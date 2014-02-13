module ExifUtility
  class Interpreter

    def initialize(data)
      @data = data

      # data_format =>
      @data_format_and_size = {
        "0001" => 1, # unsigned byte
        "0002" => 1, # ascii character
        "0003" => 2, # unsigned short
        "0004" => 4, # unsigned long
        "0005" => 8, # unsigned rational: a fractional value containing 2 signed/unsigned long integer values: the first is the numerator, the second is the denominator
        "0006" => 1, # signed byte
        "0007" => 1, # undefined
        "0008" => 2, # signed short
        "0009" => 4, # signed long
        "000A" => 8, # signed rational
        "000B" => 4, # single float
        "000C" => 8 # double float
      }
    end

    def size_from_data_format(data_format)
      @data_format_and_size[data_format]
    end




    def interpret_as_string(data)
      # Also removes the null character at the end.
      data.scan(/../).map(&:hex).map(&:chr).join[0..-2]
    end

    def interpret_as_number(data)
      data.to_i(16)
    end

    def interpret_as_date_time(data)
      data = interpret_as_string(data)
      DateTime.strptime(data, '%Y:%m:%d %H:%M:%S')
    end



    # http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/EXIF.html
    def interpret(tag, data)
      case tag


      # when "0001"
      #   @data.interop_index = data
      # when "0002"
      #   @data.interop_version = data
      # when "000B"
      #   @data.processing_software = data
      # when "00FE"
      #   @data.subfile_type = data
      # when "00FF"
      #   @data.old_subfile_type = data
      # when "0100"
      #   @data.image_width = data
      # when "0101"
      #   @data.image_height = data
      # when "0102"
      #   @data.bits_per_sample = data
      # when "0103"
      #   @data.compression = data
      # when "0106"
      #   @data.photometric_interpretation = data
      # when "0107"
      #   @data.thresholding = data
      # when "0108"
      #   @data.cell_width = data
      # when "0109"
      #   @data.cell_length = data
      # when "010A"
      #   @data.fill_order = data
      # when "010D"
      #   @data.document_name = data
      # when "010E"
      #   @data.image_description = data
      when "010F"
        @data.make = interpret_as_string(data)
      when "0110"
        @data.model = interpret_as_string(data)
      # when "0111"
      #   @data.strip_offsets = data
      # when "0112"
      #   @data.orientation = data
      # when "0115"
      #   @data.samples_per_pixel = data
      # when "0116"
      #   @data.rows_per_strip = data
      # when "0117"
      #   @data.strip_byte_counts = data
      # when "0118"
      #   @data.min_sample_value = data
      # when "0119"
      #   @data.max_sample_value = data
      # when "011A"
      #   @data.x_resolution = data
      # when "011B"
      #   @data.y_resolution = data
      # when "011C"
      #   @data.planar_configuration = data
      # when "011D"
      #   @data.page_name = data
      # when "011E"
      #   @data.x_position = data
      # when "011F"
      #   @data.y_position = data
      # when "0120"
      #   @data.free_offsets = data
      # when "0121"
      #   @data.free_byte_counts = data
      # when "0122"
      #   @data.gray_response_unit = data
      # when "0123"
      #   @data.gray_response_curve = data
      # when "0124"
      #   @data.t4_options = data
      # when "0125"
      #   @data.t6_options = data
      # when "0128"
      #   @data.resolution_unit = data
      # when "0129"
      #   @data.page_number = data
      # when "012C"
      #   @data.color_response_unit = data
      # when "012D"
      #   @data.transfer_function = data
      when "0131"
        @data.software = interpret_as_string(data)
      when "0132"
        @data.modify_date = interpret_as_date_time(data)
      # when "013B"
      #   @data.artist = data
      # when "013C"
      #   @data.host_computer = data
      # when "013D"
      #   @data.predictor = data
      # when "013E"
      #   @data.white_point = data
      # when "013F"
      #   @data.primary_chromaticities = data
      # when "0140"
      #   @data.color_map = data
      # when "0141"
      #   @data.halftone_hints = data
      # when "0142"
      #   @data.tile_width = data
      # when "0143"
      #   @data.tile_length = data
      # when "0144"
      #   @data.tile_offsets = data
      # when "0145"
      #   @data.tile_byte_counts = data
      # when "0146"
      #   @data.bad_fax_lines = data
      # when "0147"
      #   @data.clean_fax_data = data
      # when "0148"
      #   @data.consecutive_bad_fax_lines = data
      # when "014A"
      #   @data.sub_ifd = data
      # when "014C"
      #   @data.ink_set = data
      # when "014D"
      #   @data.ink_names = data
      # when "014E"
      #   @data.number_of_inks = data
      # when "0150"
      #   @data.dot_range = data
      # when "0151"
      #   @data.target_printer = data
      # when "0152"
      #   @data.extra_samples = data
      # when "0153"
      #   @data.sample_format = data
      # when "0154"
      #   @data.s_min_sample_value = data
      # when "0155"
      #   @data.s_max_sample_value = data
      # when "0156"
      #   @data.transfer_range = data
      # when "0157"
      #   @data.clip_path = data
      # when "0158"
      #   @data.x_clip_path_units = data
      # when "0159"
      #   @data.y_clip_path_units = data
      # when "015A"
      #   @data.indexed = data
      # when "015B"
      #   @data.jpeg_tables = data
      # when "015F"
      #   @data.opi_proxy = data
      # when "0190"
      #   @data.global_parameters_ifd = data
      # when "0191"
      #   @data.profile_type = data
      # when "0192"
      #   @data.fax_profile = data
      # when "0193"
      #   @data.coding_methods = data
      # when "0194"
      #   @data.version_year = data
      # when "0195"
      #   @data.mode_number = data
      # when "01B1"
      #   @data.decode = data
      # when "01B2"
      #   @data.default_image_color = data
      # when "01B3"
      #   @data.t82_options = data
      # when "01B5"
      #   @data.jpeg_tables = data
      # when "0200"
      #   @data.jpeg_proc = data
      # when "0201"
      #   @data.thumbnail_offset = data
      # when "0202"
      #   @data.thumbnail_length = data
      # when "0203"
      #   @data.jpeg_restart_interval = data
      # when "0205"
      #   @data.jpeg_lossless_predictors = data
      # when "0206"
      #   @data.jpeg_point_transforms = data
      # when "0207"
      #   @data.jpeg_q_tables = data
      # when "0208"
      #   @data.jpeg_dc_tables = data
      # when "0209"
      #   @data.jpeg_ac_tables = data
      # when "0211"
      #   @data.y_cb_cr_coefficients = data
      # when "0212"
      #   @data.y_cb_cr_subsampling = data
      # when "0213"
      #   @data.y_cb_cr_positioning = data
      # when "0214"
      #   @data.reference_black_white = data
      # when "022F"
      #   @data.strip_row_counts = data
      # when "02BC"
      #   @data.application_notes = data
      # when "03E7"
      #   @data.uspt_omiscellaneous = data
      # when "1000"
      #   @data.related_image_file_format = data
      # when "1001"
      #   @data.related_image_width = data
      # when "1002"
      #   @data.related_image_height = data
      # when "4746"
      #   @data.rating = data
      # when "4747"
      #   @data.xp_dip_xml = data
      # when "4748"
      #   @data.stitch_info = data
      # when "4749"
      #   @data.rating_percent = data
      # when "800D"
      #   @data.image_id = data
      # when "80A3"
      #   @data.wang_tag_1 = data
      # when "80A4"
      #   @data.wang_annotation = data
      # when "80A5"
      #   @data.wang_tag_3 = data
      # when "80A6"
      #   @data.wang_tag_4 = data
      # when "80E3"
      #   @data.matteing = data
      # when "80E4"
      #   @data.data_type = data
      # when "80E5"
      #   @data.image_depth = data
      # when "80E6"
      #   @data.tile_depth = data
      # when "827D"
      #   @data.mode_l2 = data
      # when "828D"
      #   @data.cfa_repeat_pattern_dim = data
      # when "828E"
      #   @data.cfa_pattern_2 = data
      # when "828F"
      #   @data.battery_level = data
      # when "8290"
      #   @data.kodak_ifd = data
      # when "8298"
      #   @data.copyright = data
      # when "829A"
      #   @data.exposure_time = data
      # when "829D"
      #   @data.f_number = data
      # when "82A5"
      #   @data.md_file_tag = data
      # when "82A6"
      #   @data.md_scale_pixel = data
      # when "82A7"
      #   @data.md_color_table = data
      # when "82A8"
      #   @data.md_lab_name = data
      # when "82A9"
      #   @data.md_sample_info = data
      # when "82AA"
      #   @data.md_prep_date = data
      # when "82AB"
      #   @data.md_prep_time = data
      # when "82AC"
      #   @data.mdfileunits = data
      # when "830E"
      #   @data.pixel_scale = data
      # when "8335"
      #   @data.advent_scale = data
      # when "8336"
      #   @data.advent_revision = data
      # when "835C"
      #   @data.uic_1_tag = data
      # when "835D"
      #   @data.uic_2_tag = data
      # when "835E"
      #   @data.uic_3_tag = data
      # when "835F"
      #   @data.uic_4_tag = data
      # when "83BB"
      #   @data.iptc_naa = data
      # when "847E"
      #   @data.intergraph_packet_data = data
      # when "847F"
      #   @data.intergraph_flag_registers = data
      # when "8480"
      #   @data.intergraph_matrix = data
      # when "8481"
      #   @data.ingr_reserved = data
      # when "8482"
      #   @data.model_tie_point = data
      # when "84E0"
      #   @data.site = data
      # when "84E1"
      #   @data.color_sequence = data
      # when "84E2"
      #   @data.it8_header = data
      # when "84E3"
      #   @data.raster_padding = data
      # when "84E4"
      #   @data.bits_per_run_length = data
      # when "84E5"
      #   @data.bits_per_extended_run_length = data
      # when "84E6"
      #   @data.color_table = data
      # when "84E7"
      #   @data.image_color_indicator = data
      # when "84E8"
      #   @data.background_color_indicator = data
      # when "84E9"
      #   @data.image_color_value = data
      # when "84EA"
      #   @data.background_color_value = data
      # when "84EB"
      #   @data.pixel_intensity_range = data
      # when "84EC"
      #   @data.transparency_indicator = data
      # when "84ED"
      #   @data.color_characterization = data
      # when "84EE"
      #   @data.hc_usage = data
      # when "84EF"
      #   @data.trap_indicator = data
      # when "84F0"
      #   @data.cmyk_equivalent = data
      # when "8546"
      #   @data.sem_info = data
      # when "8568"
      #   @data.afcp_iptc = data
      # when "85B8"
      #   @data.pixel_magic_jbig_options = data
      # when "85D8"
      #   @data.model_transform = data
      # when "8602"
      #   @data.wb_grgb_levels = data
      # when "8606"
      #   @data.leaf_data = data
      # when "8649"
      #   @data.photoshop_settings = data
      when "8769"
        @data.exif_offset = interpret_as_number(data)
      # when "8773"
      #   @data.icc_profile = data
      # when "877F"
      #   @data.tiff_fxextensions = data
      # when "8780"
      #   @data.multi_profiles = data
      # when "8781"
      #   @data.shared_data = data
      # when "8782"
      #   @data.t88_options = data
      # when "87AC"
      #   @data.image_layer = data
      # when "87AF"
      #   @data.geo_tiff_directory = data
      # when "87B0"
      #   @data.geo_tiff_double_params = data
      # when "87B1"
      #   @data.geo_tiff_ascii_params = data
      # when "8822"
      #   @data.exposure_program = data
      # when "8824"
      #   @data.spectral_sensitivity = data
      # when "8825"
      #   @data.gps_info = data
      # when "8827"
      #   @data.iso = data
      # when "8828"
      #   @data.opto_electric_conv_factor = data
      # when "8829"
      #   @data.interlace = data
      # when "882A"
      #   @data.time_zone_offset = data
      # when "882B"
      #   @data.self_timer_mode = data
      # when "8830"
      #   @data.sensitivity_type = data
      # when "8831"
      #   @data.standard_output_sensitivity = data
      # when "8832"
      #   @data.recommended_exposure_index = data
      # when "8833"
      #   @data.iso_speed = data
      # when "8834"
      #   @data.iso_speed_latitude_yyy = data
      # when "8835"
      #   @data.iso_speed_latitude_zzz = data
      # when "885C"
      #   @data.fax_recv_params = data
      # when "885D"
      #   @data.fax_sub_address = data
      # when "885E"
      #   @data.fax_recv_time = data
      # when "888A"
      #   @data.leaf_subifd = data
      # when "9000"
      #   @data.exif_version = data
      when "9003"
        @data.date_time_original = interpret_as_date_time(data)
      when "9004"
        @data.create_date = interpret_as_date_time(data)
      # when "9101"
      #   @data.components_configuration = data
      # when "9102"
      #   @data.compressed_bits_per_pixel = data
      # when "9201"
      #   @data.shutter_speed_value = data
      # when "9202"
      #   @data.aperture_value = data
      # when "9203"
      #   @data.brightness_value = data
      # when "9204"
      #   @data.exposure_compensation = data
      # when "9205"
      #   @data.max_aperture_value = data
      # when "9206"
      #   @data.subject_distance = data
      # when "9207"
      #   @data.metering_mode = data
      # when "9208"
      #   @data.light_source = data
      # when "9209"
      #   @data.flash = data
      # when "920A"
      #   @data.focal_length = data
      # when "920B"
      #   @data.flash_energy = data
      # when "920C"
      #   @data.spatial_frequencyresponse = data
      # when "920D"
      #   @data.noise = data
      # when "920E"
      #   @data.focal_plane_x_resolution = data
      # when "920F"
      #   @data.focal_plane_y_resolution = data
      # when "9210"
      #   @data.focal_plane_resolution_unit = data
      # when "9211"
      #   @data.image_number = data
      # when "9212"
      #   @data.security_classification = data
      # when "9213"
      #   @data.image_history = data
      # when "9214"
      #   @data.subject_area = data
      # when "9215"
      #   @data.exposure_index = data
      # when "9216"
      #   @data.tiff_ep_standard_id = data
      # when "9217"
      #   @data.sensing_method = data
      # when "923A"
      #   @data.cip3_data_file = data
      # when "923B"
      #   @data.cip3_sheet = data
      # when "923C"
      #   @data.cip3_side = data
      # when "923F"
      #   @data.sto_nits = data
      # when "927C"
      #   @data.maker_note_vendor = data # VENDOR can be Apple, Nikon, Canon, etc
      # when "9286"
      #   @data.user_comment = data
      # when "9290"
      #   @data.sub_sec_time = data
      # when "9291"
      #   @data.sub_sec_time_original = data
      # when "9292"
      #   @data.sub_sec_time_digitized = data
      # when "932F"
      #   @data.ms_document_text = data
      # when "9330"
      #   @data.ms_property_set_storage = data
      # when "9331"
      #   @data.ms_document_text_position = data
      # when "935C"
      #   @data.image_source_data = data
      # when "9C9B"
      #   @data.xp_title = data
      # when "9C9C"
      #   @data.xp_comment = data
      # when "9C9D"
      #   @data.xp_author = data
      # when "9C9E"
      #   @data.xp_keywords = data
      # when "9C9F"
      #   @data.xp_subject = data
      # when "A000"
      #   @data.flashpix_version = data
      # when "A001"
      #   @data.color_space = data
      # when "A002"
      #   @data.exif_image_width = data
      # when "A003"
      #   @data.exif_image_height = data
      # when "A004"
      #   @data.related_sound_file = data
      # when "A005"
      #   @data.interop_offset = data
      # when "A20B"
      #   @data.flash_energy = data
      # when "A20C"
      #   @data.spatial_frequency_response = data
      # when "A20D"
      #   @data.noise = data
      # when "A20E"
      #   @data.focal_plane_x_resolution = data
      # when "A20F"
      #   @data.focal_plane_y_resolution = data
      # when "A210"
      #   @data.focal_plane_resolution_unit = data
      # when "A211"
      #   @data.image_number = data
      # when "A212"
      #   @data.security_classification = data
      # when "A213"
      #   @data.image_history = data
      # when "A214"
      #   @data.subject_location = data
      # when "A215"
      #   @data.exposure_index = data
      # when "A216"
      #   @data.tiff_ep_standard_id = data
      # when "A217"
      #   @data.sensing_method = data
      # when "A300"
      #   @data.file_source = data
      # when "A301"
      #   @data.scene_type = data
      # when "A302"
      #   @data.cfa_pattern = data
      # when "A401"
      #   @data.custom_rendered = data
      # when "A402"
      #   @data.exposure_mode = data
      # when "A403"
      #   @data.white_balance = data
      # when "A404"
      #   @data.digital_zoom_ratio = data
      # when "A405"
      #   @data.focal_length_in_35mm_format = data
      # when "A406"
      #   @data.scene_capture_type = data
      # when "A407"
      #   @data.gain_control = data
      # when "A408"
      #   @data.contrast = data
      # when "A409"
      #   @data.saturation = data
      # when "A40A"
      #   @data.sharpness = data
      # when "A40B"
      #   @data.device_setting_description = data
      # when "A40C"
      #   @data.subject_distance_range = data
      # when "A420"
      #   @data.image_unique_id = data
      # when "A430"
      #   @data.owner_name = data
      # when "A431"
      #   @data.serial_number = data
      # when "A432"
      #   @data.lens_info = data
      # when "A433"
      #   @data.lens_make = data
      # when "A434"
      #   @data.lens_model = data
      # when "A435"
      #   @data.lens_serial_number = data
      # when "A480"
      #   @data.gdal_metadata = data
      # when "A481"
      #   @data.gdal_no_data = data
      # when "A500"
      #   @data.gamma = data
      # when "AFC0"
      #   @data.expand_software = data
      # when "AFC1"
      #   @data.expand_lens = data
      # when "AFC2"
      #   @data.expand_film = data
      # when "AFC3"
      #   @data.expand_filter_lens = data
      # when "AFC4"
      #   @data.expand_scanner = data
      # when "AFC5"
      #   @data.expand_flash_lamp = data
      # when "BC01"
      #   @data.pixel_format = data
      # when "BC02"
      #   @data.transformation = data
      # when "BC03"
      #   @data.uncompressed = data
      # when "BC04"
      #   @data.image_type = data
      # when "BC80"
      #   @data.image_width = data
      # when "BC81"
      #   @data.image_height = data
      # when "BC82"
      #   @data.width_resolution = data
      # when "BC83"
      #   @data.height_resolution = data
      # when "BCC0"
      #   @data.image_offset = data
      # when "BCC1"
      #   @data.image_byte_count = data
      # when "BCC2"
      #   @data.alpha_offset = data
      # when "BCC3"
      #   @data.alpha_byte_count = data
      # when "BCC4"
      #   @data.image_data_discard = data
      # when "BCC5"
      #   @data.alpha_data_discard = data
      # when "C427"
      #   @data.oce_scanjob_desc = data
      # when "C428"
      #   @data.oce_application_selector = data
      # when "C429"
      #   @data.oce_id_number = data
      # when "C42A"
      #   @data.oce_image_logic = data
      # when "C44F"
      #   @data.annotations = data
      # when "C4A5"
      #   @data.print_im = data
      # when "C573"
      #   @data.original_filename = data
      # when "C580"
      #   @data.uspto_original_content_type = data
      # when "C612"
      #   @data.dng_version = data
      # when "C613"
      #   @data.dng_backward_version = data
      # when "C614"
      #   @data.unique_camera_model = data
      # when "C615"
      #   @data.localized_camera_model = data
      # when "C616"
      #   @data.cfa_plane_color = data
      # when "C617"
      #   @data.cfa_layout = data
      # when "C618"
      #   @data.linearization_table = data
      # when "C619"
      #   @data.black_level_repeat_dim = data
      # when "C61A"
      #   @data.black_level = data
      # when "C61B"
      #   @data.black_level_delta_h = data
      # when "C61C"
      #   @data.black_level_delta_v = data
      # when "C61D"
      #   @data.white_level = data
      # when "C61E"
      #   @data.default_scale = data
      # when "C61F"
      #   @data.default_crop_origin = data
      # when "C620"
      #   @data.default_crop_size = data
      # when "C621"
      #   @data.color_matrix_1 = data
      # when "C622"
      #   @data.color_matrix_2 = data
      # when "C623"
      #   @data.camera_calibration_1 = data
      # when "C624"
      #   @data.camera_calibration_2 = data
      # when "C625"
      #   @data.reduction_matrix_1 = data
      # when "C626"
      #   @data.reduction_matrix_2 = data
      # when "C627"
      #   @data.analog_balance = data
      # when "C628"
      #   @data.asshot_neutral = data
      # when "C629"
      #   @data.asshot_white_xy = data
      # when "C62A"
      #   @data.baseline_exposure = data
      # when "C62B"
      #   @data.baseline_noise = data
      # when "C62C"
      #   @data.baseline_sharpness = data
      # when "C62D"
      #   @data.bayer_green_split = data
      # when "C62E"
      #   @data.linear_response_limit = data
      # when "C62F"
      #   @data.camera_serial_number = data
      # when "C630"
      #   @data.dng_lens_info = data
      # when "C631"
      #   @data.chroma_blur_radius = data
      # when "C632"
      #   @data.anti_alias_strength = data
      # when "C633"
      #   @data.shadow_scale = data
      # when "C634"
      #   @data.sr2_private = data
      # when "C635"
      #   @data.maker_note_safety = data
      # when "C640"
      #   @data.raw_image_segmentation = data
      # when "C65A"
      #   @data.calibration_illuminant_1 = data
      # when "C65B"
      #   @data.calibration_illuminant_2 = data
      # when "C65C"
      #   @data.best_quality_scale = data
      # when "C65D"
      #   @data.raw_data_unique_id = data
      # when "C660"
      #   @data.alias_layer_metadata = data
      # when "C68B"
      #   @data.original_raw_file_name = data
      # when "C68C"
      #   @data.original_raw_file_data = data
      # when "C68D"
      #   @data.active_area = data
      # when "C68E"
      #   @data.masked_areas = data
      # when "C68F"
      #   @data.asshot_icc_profile = data
      # when "C690"
      #   @data.asshot_pre_profile_matrix = data
      # when "C691"
      #   @data.current_icc_profile = data
      # when "C692"
      #   @data.current_pre_profile_matrix = data
      # when "C6BF"
      #   @data.colorimetric_reference = data
      # when "C6D2"
      #   @data.panasonic_title = data
      # when "C6D3"
      #   @data.panasonic_title_2 = data
      # when "C6F3"
      #   @data.camera_calibration_sig = data
      # when "C6F4"
      #   @data.profile_calibration_sig = data
      # when "C6F5"
      #   @data.profile_ifd = data
      # when "C6F6"
      #   @data.asshot_profile_name = data
      # when "C6F7"
      #   @data.noise_reduction_applied = data
      # when "C6F8"
      #   @data.profile_name = data
      # when "C6F9"
      #   @data.profile_hue_sat_mapdims = data
      # when "C6FA"
      #   @data.profile_hue_sat_map_data_1 = data
      # when "C6FB"
      #   @data.profile_hue_sat_map_data_2 = data
      # when "C6FC"
      #   @data.profile_tone_curve = data
      # when "C6FD"
      #   @data.profile_embed_policy = data
      # when "C6FE"
      #   @data.profile_copyright = data
      # when "C714"
      #   @data.forward_matrix_1 = data
      # when "C715"
      #   @data.forward_matrix_2 = data
      # when "C716"
      #   @data.preview_application_name = data
      # when "C717"
      #   @data.preview_application_version = data
      # when "C718"
      #   @data.preview_settings_name = data
      # when "C719"
      #   @data.preview_settings_digest = data
      # when "C71A"
      #   @data.preview_color_space = data
      # when "C71B"
      #   @data.preview_date_time = data
      # when "C71C"
      #   @data.raw_image_digest = data
      # when "C71D"
      #   @data.original_raw_file_digest = data
      # when "C71E"
      #   @data.sub_tile_block_size = data
      # when "C71F"
      #   @data.row_interleave_factor = data
      # when "C725"
      #   @data.profile_look_table_dims = data
      # when "C726"
      #   @data.profile_look_table_data = data
      # when "C740"
      #   @data.opcode_list_1 = data
      # when "C741"
      #   @data.opcode_list_2 = data
      # when "C74E"
      #   @data.opcode_list_3 = data
      # when "C761"
      #   @data.noise_profile = data
      # when "C763"
      #   @data.time_codes = data
      # when "C764"
      #   @data.frame_rate = data
      # when "C772"
      #   @data.t_stop = data
      # when "C789"
      #   @data.reel_name = data
      # when "C791"
      #   @data.original_default_final_size = data
      # when "C792"
      #   @data.original_best_quality_size = data
      # when "C793"
      #   @data.original_default_crop_size = data
      # when "C7A1"
      #   @data.camera_label = data
      # when "C7A3"
      #   @data.profile_hue_sat_map_encoding = data
      # when "C7A4"
      #   @data.profile_look_table_encoding = data
      # when "C7A5"
      #   @data.baseline_exposure_offset = data
      # when "C7A6"
      #   @data.default_black_render = data
      # when "C7A7"
      #   @data.new_raw_image_digest = data
      # when "C7A8"
      #   @data.raw_to_preview_gain = data
      # when "C7B5"
      #   @data.default_user_crop = data
      # when "EA1C"
      #   @data.padding = data
      # when "EA1D"
      #   @data.offset_schema = data
      # when "FDE8"
      #   @data.owner_name = data
      # when "FDE9"
      #   @data.serial_number = data
      # when "FDEA"
      #   @data.lens = data
      # when "FE00"
      #   @data.kdc_ifd = data
      # when "FE4C"
      #   @data.raw_file = data
      # when "FE4D"
      #   @data.converter = data
      # when "FE4E"
      #   @data.white_balance = data
      # when "FE51"
      #   @data.exposure = data
      # when "FE52"
      #   @data.shadows = data
      # when "FE53"
      #   @data.brightness = data
      # when "FE54"
      #   @data.contrast = data
      # when "FE55"
      #   @data.saturation = data
      # when "FE56"
      #   @data.sharpness = data
      # when "FE57"
      #   @data.smoothness = data
      # when "FE58"
      #   @data.moire_filter = data
      end

    end

  end

end