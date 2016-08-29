FROM alexcheng/predictionio

ADD pio_create_app.sh /etc/my_init.d/z00_pio_create_app.sh
RUN chmod +x /etc/my_init.d/z00_pio_create_app.sh

ADD pio_build.sh /etc/my_init.d/z10_pio_build.sh
RUN chmod +x /etc/my_init.d/z10_pio_build.sh
