FROM metwork/centos6:latest

RUN yum -y install epel-release
RUN yum -y install createrepo wget bzip2 patch make cmake cmake3 automake file gcc gcc-c++ gcc-gfortran antlr libtool texinfo bison flex perl-XML-Parser swig gettext libpng libjpeg-turbo freetype fontconfig jasper-libs pango python-devel zlib-devel libffi-devel readline-devel bzip2-devel libpng-devel libjpeg-turbo-devel freetype-devel fontconfig-devel jasper-devel pango-devel rpm-build xz expat-devel bc which git nspr-devel nss-devel file-devel popt-devel elfutils-devel elfutils elfutils-libelf-devel elfutils-libelf elfutils-libs atlas-devel valgrind tcl-devel tk-devel
RUN yum -y install devtoolset-7 rh-python35

RUN rpm -qa |sort |md5sum |awk '{print $1;}' >/etc/buildimage_hash
