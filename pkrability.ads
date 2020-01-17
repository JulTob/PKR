with PKR; use PKR;

package PKRability is
   type probability_tp is delta 0.000_000_1 range 0.0..1.0;

   function Provability return probability_tp;

end PKRability;
