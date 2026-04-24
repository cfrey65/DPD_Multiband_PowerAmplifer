deg = 2;
mem = 2;
l = 2;


coeff = [];
RMSin = -20.5;
y = RFWebLab_IMS2026_PA_meas_v1_1(x(1:1000), RMSin);

for i = (mem+l+1):(10+mem+l+1)
    row = [];
    for m = 1:mem
        for d = 1:deg
            inp = i-m;
            row(end+1) = y(inp)*abs(y(inp))^d;
            for j = 1:l 
              row(end+1) = y(inp)*abs(y(inp-j))^d;
              row(end+1) = y(inp)*abs(y(inp+j))^d;
            end
        end
    end
    coeff = [coeff; row];

end
coeff
pa = resize(y(1:10), [11, 1]);
size(pa)
size(coeff)
targ = pa\coeff
%DO gmp/target to calculate coeff
