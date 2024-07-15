module floatadder (clk, rst, ix, iy, oz, ofw);

input clk, rst;
input [31:0] ix, iy;
output reg [31:0] oz;
output ofw;
reg [23:0] xm, ym, zm;
reg [7:0] xe, ye, ze;
reg zs;
reg mc;
reg [2:0] state, nextstate;
parameter start = 3'b000, zerock = 3'b001, exequal = 3'b010, addm = 3'b011, infifl = 3'b100, zerofl = 3'b101, over = 3'b110;
assign ofw = state == over ? 1 : 0;

always @ (posedge clk)
    if (!rst)
        state <= start;
    else
        state <= nextstate;

always @ (state)
    case (state)
        start:
            begin
                xe <= ix[30:23];
                xm <= {1'b1, ix[22:0]};
                ye <= iy[30:23];
                ym <= {1'b1, iy[22:0]};
                nextstate <= zerock;
            end
        
        zerock:
            begin
                if (xm == 0)
                    begin
                        {ze, zm} <= {ye, ym};
                        nextstate <= over;
                    end
                else if (ym == 0)
                    begin
                        {ze, zm} <= {xe, xm};
                        nextstate <= over;
                    end
                else
                    nextstate <= exequal;
            end
        
        exequal:
            begin
                if (xe == ye)
                    nextstate <= addm;
                else if (xe > ye)
                    begin
                        ye <= ye + 1;
                        ym <= {1'b0, ym[23:1]};
                        if (ym == 0)
                            begin
                                zm <= xm;
                                ze <= xe;
                                zs <= ix[31];
                                oz <= {zs, ze, zm[23:1]};
                                nextstate <= over;
                            end
                        else
                            nextstate <= exequal;
                    end
                else
                    begin
                        xe <= xe + 1;
                        xm <= {1'b0, xm[23:1]};
                        if (xm == 0)
                            begin
                                zm <= ym;
                                ze <= ye;
                                zs <= iy[31];
                                oz <= {zs, ze, zm[23:1]};
                                nextstate <= over;
                            end
                        else
                            nextstate <= exequal;
                    end  
            end

        addm:
            begin
                ze <= xe;
                if (iy[31])
                    {mc, zm} <= xm + (~ym);
                else
                    {mc, zm} <= xm + ym;
                
                if (zm == 24'b0)
                    nextstate <= over;
                else
                    nextstate <= infifl;
            end

        infifl:
            begin
                if (mc)
                    begin
                        zm <= {mc, zm[23:1]};
                        ze <= ze + 1;
                        zs <= ix[31];
                        oz <= {zs, ze, zm[22:0]};
                        if (ze == 8'b1111_1111)
                            nextstate <= over;
                        else
                            nextstate <= zerofl;
                    end
                else
                    nextstate <= zerofl;
            end

        zerofl:
            begin
                if (zm[23] == 1'b1)
                    begin
                        zm <= {1'b0, zm[23:1]};
                        ze <= ze - 1;
                        zs <= ix[31];
                        oz <= {zs, ze, zm[22:0]};
                        nextstate <= zerofl;
                    end
                else
                    if (zm[23:22] == 2'b0)
                        begin
                            zm <= {zm[22:0], 1'b0};
                            ze <= ze + 1;
                            zs <= ix[31];
                            oz <= {zs, ze, zm[22:0]};
                            if (ze == 8'b1111_1111)
                                nextstate <= over;
                            else
                                nextstate <= zerofl;
                        end
                    else
                        nextstate <= over;
            end

        over:
            begin
            end

        default: state <= start;
    endcase
endmodule