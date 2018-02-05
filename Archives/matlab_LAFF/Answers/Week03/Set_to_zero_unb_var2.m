% Copyright 2018 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Jiangtang Hu
%                jiangtanghu@gmail.com
% Testing:
% M = randi(5,4)
% Set_to_zero_unb_var2(M)
% zeros(size(M))

function [ A_out ] = Set_to_zero_unb_var2( A )

  [ AT, ...
    AB ] = FLA_Part_2x1( A, ...
                         0, 'FLA_TOP' );

  while ( size( AT, 1 ) < size( A, 1 ) )

    [ A0, ...
      a1t, ...
      A2 ] = FLA_Repart_2x1_to_3x1( AT, ...
                                    AB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%

    a1t = laff_zerov( a1t );

    %------------------------------------------------------------%

    [ AT, ...
      AB ] = FLA_Cont_with_3x1_to_2x1( A0, ...
                                       a1t, ...
                                       A2, ...
                                       'FLA_TOP' );

  end

  A_out = [ AT
            AB ];

return
