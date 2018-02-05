% Copyright 2018 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Jiangtang Hu
%                jiangtanghu@gmail.com
% Testing:
% M = randi(4,4); d =[1 2 3 4]'
% Set_to_diagonal_matrix_unb_var5(M)
% diag(M)

function [ A_out ] = Set_to_diagonal_matrix_unb_var5( A, d )

  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  [ dT, ...
    dB ] = FLA_Part_2x1( d, ...
                         0, 'FLA_TOP' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    [ d0, ...
      delta1, ...
      d2 ] = FLA_Repart_2x1_to_3x1( dT, ...
                                    dB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%

    a01 = laff_zerov(a01);
    alpha11 = delta1;
    %alphal1 = laff_copy(chi1,alphal1)
    a21 = laff_zerov(a21);

    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

    [ dT, ...
      dB ] = FLA_Cont_with_3x1_to_2x1( d0, ...
                                       delta1, ...
                                       d2, ...
                                       'FLA_TOP' );

  end

  A_out = [ ATL, ATR
            ABL, ABR ];

return
