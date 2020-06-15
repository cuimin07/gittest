function [w,tw] = zero_phase(f,dt,r)
%RICKER: Ricker wavelet of central frequency f.
%
%  [w,tw] = zero_phase(f,dt,r);
%
%  IN   f : central freq. in Hz (f <<1/(2dt) ) 中心频率
%       dt: sampling interval in sec  采样间隔
%
%  OUT  w:  the Ricker wavelet
%       tw: axis
%
%  Example
%
%    [w,tw] = zero_phase(10,0.004,3);
%    plot(tw,w);
%

%  Copyright (C) 2008, Signal Analysis and Imaging Group
%  For more information: http://www-geo.phys.ualberta.ca/saig/SeismicLab
%  Author: M.D.Sacchi
%
%  This program is free software: you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published
%  by the Free Software Foundation, either version 3 of the License, or
%  any later version.
%
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details: http://www.gnu.org/licenses/
%


 nw=2.2/f/dt;
 nw=2*floor(nw/2)+1;
 nc=floor(nw/2);
 w = zeros(nw,1);

 k=[1:1:nw]';

 alpha = (nc-k+1).*f*dt*pi;
 beta=alpha.^2;
 w = cos(alpha.*2.).*exp(-(4.*beta./(r^4)));
%  w = (1.-beta.*2).*exp(-beta);

  if nargout>1;
    tw = -(nc+1-[1:1:nw])*dt;
  end

