% conversao para coordenadas cartesianas
function cart = ICRS2Cart(ICRS)
    ar = (abs(ICRS(1,1))+ ICRS(1,2)/60 + ICRS(1,3)/3600)*15;
    if ICRS(1,1) < 0
        ar = -ar;
    end
    
    ar = deg2rad(ar);
    
    decl = abs(ICRS(2,1)) + ICRS(2,2)/60 + ICRS(2,3)/3600;
    if ICRS(2,1) < 0
        decl = -decl;
    end
    
    decl = deg2rad(decl);
    x = cos(decl)*cos(ar);
    y = cos(decl)*sin(ar);
    z = sin(decl);
    cart = [x y z];
end