FROM centos:centos6.10

RUN yum -y install epel-release centos-release-scl
RUN yum -y install createrepo wget bzip2 patch make cmake cmake3 automake file gcc gcc-c++ gcc-gfortran antlr libtool texinfo bison flex perl-XML-Parser swig gettext libjpeg-turbo freetype fontconfig jasper-libs python-devel zlib-devel bzip2-devel libjpeg-turbo-devel freetype-devel fontconfig-devel jasper-devel rpm-build xz expat-devel bc which git nspr-devel nss-devel file-devel popt-devel elfutils-devel elfutils elfutils-libelf-devel elfutils-libelf elfutils-libs atlas-devel valgrind ncurses-devel gperf devtoolset-7 rh-python35 libX11-devel libXrender-devel libXext-devel pixman-devel && rpm -qa |sort |md5sum |awk '{print $1;}' >/etc/buildimage_hash
