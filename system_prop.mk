# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    ro.qc.sdk.audio.fluencetype=none \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=false \
    persist.audio.button_jack.profile=volume \
    persist.audio.button_jack.switch=0 \
    tunnel.audio.encode = true \
    audio.offload.buffer.size.kb=32 \
    av.offload.enable=true \
    use.voice.path.for.pcm.voip=true \
    audio.offload.gapless.enabled=true

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.bluetooth.bqr.event_mask=14 \
    persist.bluetooth.bqr.min_interval_ms=500 \
    vendor.bluetooth.soc=cherokee \
    persist.vendor.btstack.enable.splita2dp=true \
    persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aptxadaptive-aac-ldac

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=true \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.android.camera,com.google.android.GoogleCamera

# CNE and DPM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.cne.feature=1 \
    persist.vendor.dpm.feature=1 \
    persist.vendor.dpm.nsrm.bkg.evt=3955

# Data Modules
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.use_data_netmgrd=true \
    persist.vendor.data.mode=concurrent

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=440 \
    ro.vendor.display.ad=1 \
    ro.vendor.display.ad.hdr_calib_data=/vendor/etc/hdr_config.cfg \
    ro.vendor.display.ad.sdr_calib_data=/vendor/etc/sdr_config.cfg \
    ro.vendor.display.sensortype=2

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=0 \
	debug.sf.hw=1 \
    debug.sf.disable_backpressure=1 \
    debug.sf.enable_gl_backpressure=1 \
    debug.sf.enable_hwc_vds=1 \
    debug.egl.hw=1 \
    debug.enable.sglscale=1 \
    debug.gralloc.enable_fb_ubwc=1 \
    debug.sf.latch_unsignaled=1 \
    debug.sf.recomputecrop=0 \
    dev.pm.dyn_samplingrate=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.vendor.display.enable_kernel_idle_timer=true \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.max_virtual_display_dimension=4096 \
    ro.surface_flinger.protected_contents=true \
    ro.surface_flinger.set_idle_timer_ms=80 \
    ro.surface_flinger.set_touch_timer_ms=200 \
    ro.surface_flinger.set_display_power_timer_ms=1000 \
    ro.surface_flinger.support_kernel_idle_timer=true \
    ro.surface_flinger.use_color_management=true \
    ro.surface_flinger.use_smart_90_for_video=true \
    ro.surface_flinger.vsync_event_phase_offset_ns=2000000 \
    ro.surface_flinger.vsync_sf_event_phase_offset_ns=6000000 \
    ro.surface_flinger.wcg_composition_dataspace=143261696

# Early phase offset configuration for SurfaceFlinger (b/75985430)
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.early_phase_offset_ns=500000 \
    debug.sf.early_app_phase_offset_ns=500000 \
    debug.sf.early_gl_phase_offset_ns=3000000 \
    debug.sf.early_gl_app_phase_offset_ns=15000000

# Enable EGL image tracking on SF for b/137514000
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.enable_egl_image_tracker=1

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1  \
    persist.dbg.wfc_avail_ovr=1 \
    persist.sys.fflag.override.settings_network_and_internet_v2=true

# IOP
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.iop.enable_prefetch_ofr=1 \
    vendor.iop.enable_uxe=0

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.settings.xml=/system/etc/media_profiles_vendor.xml \
    media.stagefright.enable-player=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-fma2dp=true \
    media.stagefright.enable-scan=true \
    media.stagefright.thumbnail.prefer_hw_codecs=true \
    mmp.enable.3g2=true \
    media.aac_51_output_enabled=true \
    mm.enable.smoothstreaming=true \
    vendor.mm.enable.qcom_parser=63963135

# set lmkd options
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lmk.use_psi=true \
    ro.lmk.low_ram=false \
    ro.lmk.kill_heaviest_task=true \
    ro.lmk.kill_timeout_ms=100 \
    ro.lmk.use_minfree_levels=true

# Memory optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.sys.fw.bservice_enable=true

# Netflix
PRODUCT_PROPERTY_OVERRIDES += \
    ro.netflix.bsp_rev=Q6150-17263-1

# QC framework value-adds
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.va_aosp.support=1

PRODUCT_ODM_PROPERTIES += \
    ro.vendor.qti.va_odm.support=1

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib64/libril-qc-hal-qmi.so \
    ril.subscription.types=RUIM \
    DEVICE_PROVISIONED=1 \
    ro.telephony.default_network=22,22 \
    ro.telephony.default_cdma_sub=0 \
    persist.radio.multisim.config=dsds \
    persist.vendor.data.iwlan.enable=true \
    persist.radio.NO_STAPA=1 \
    persist.vendor.radio.redir_party_num=1 \
    persist.vendor.radio.rat_on=combine \
    persist.vendor.radio.force_on_dc=true \
    persist.radio.VT_CAM_INTERFACE=1 \
    telephony.lteOnCdmaDevice=1 \
    persist.vendor.radio.data_con_rprt=1 \
    persist.vendor.radio.report_codec=1

# RCS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.rcs.supported=1

# Subsystem ramdump
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.ssr.enable_ramdumps=0 \
    persist.vendor.ssr.restart_level=ALL_ENABLE

# WLAN
PRODUCT_PROPERTY_OVERRIDES += \
    ro.wlan.vendor=qcom \
    ro.wlan.chip=39xx \
    ro.wlan.mimo=0 \
    ro.hardware.wlan.vendor=qcom \
    ro.hardware.wlan.chip=39xx \
    ro.hardware.wlan.mimo=1
