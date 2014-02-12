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

    tags_and_interpretation = {
      '010E' => :string # ImageDescription
    }

    def interpret(tag, data)
      case tag


      # these used for testing, they're dupes
      when "0132"
        # The format is "YYYY:MM:DD HH:MM:SS"
        data = data.scan(/../).map(&:hex).map(&:chr).join[0..-2]
        @data.date_time = DateTime.strptime(data, '%Y:%m:%d %H:%M:%S')
      when "8769"
        # U Long
        @data.exif_offset = data.to_i(16)
      end




      when "0001"
        @interop_index = data
      when "0002"
        @interop_version = data
      when "000B"
        @processing_software = data
      when "00FE"
        @subfile_type = data
      when "00FF"
        @old_subfile_type = data
      when "0100"
        @image_width = data
      when "0101"
        @image_height = data
      when "0102"
        @bits_per_sample = data
      when "0103"
        @compression = data
      when "0106"
        @photometric_interpretation = data
      when "0107"
        @thresholding = data
      when "0108"
        @cell_width = data
      when "0109"
        @cell_length = data
      when "010A"
        @fill_order = data
      when "010D"
        @document_name = data
      when "010E"
        @image_description = data
      when "010F"
        @make = data
      when "0110"
        @model = data
      when "0111"
        @strip_offsets = data
      when "0112"
        @orientation = data
      when "0115"
        @samples_per_pixel = data
      when "0116"
        @rows_per_strip = data
      when "0117"
        @strip_byte_counts = data
      when "0118"
        @min_sample_value = data
      when "0119"
        @max_sample_value = data
      when "011A"
        @x_resolution = data
      when "011B"
        @y_resolution = data
      when "011C"
        @planar_configuration = data
      when "011D"
        @page_name = data
      when "011E"
        @x_position = data
      when "011F"
        @y_position = data
      when "0120"
        @free_offsets = data
      when "0121"
        @free_byte_counts = data
      when "0122"
        @gray_response_unit = data
      when "0123"
        @gray_response_curve = data
      when "0124"
        @t4_options = data
      when "0125"
        @t6_options = data
      when "0128"
        @resolution_unit = data
      when "0129"
        @page_number = data
      when "012C"
        @color_response_unit = data
      when "012D"
        @transfer_function = data
      when "0131"
        @software = data
      when "0132"
        @modify_date = data
      when "013B"
        @artist = data
      when "013C"
        @host_computer = data
      when "013D"
        @predictor = data
      when "013E"
        @white_point = data
      when "013F"
        @primary_chromaticities = data
      when "0140"
        @color_map = data
      when "0141"
        @halftone_hints = data
      when "0142"
        @tile_width = data
      when "0143"
        @tile_length = data
      when "0144"
        @tile_offsets = data
      when "0145"
        @tile_byte_counts = data
      when "0146"
        @bad_fax_lines = data
      when "0147"
        @clean_fax_data = data
      when "0148"
        @consecutive_bad_fax_lines = data
      when "014A"
        @sub_ifd = data
      when "014C"
        @ink_set = data
      when "014D"
        @ink_names = data
      when "014E"
        @number_of_inks = data
      when "0150"
        @dot_range = data
      when "0151"
        @target_printer = data
      when "0152"
        @extra_samples = data
      when "0153"
        @sample_format = data
      when "0154"
        @s_min_sample_value = data
      when "0155"
        @s_max_sample_value = data
      when "0156"
        @transfer_range = data
      when "0157"
        @clip_path = data
      when "0158"
        @x_clip_path_units = data
      when "0159"
        @y_clip_path_units = data
      when "015A"
        @indexed = data
      when "015B"
        @jpeg_tables = data
      when "015F"
        @opi_proxy = data
      when "0190"
        @global_parameters_ifd = data
      when "0191"
        @profile_type = data
      when "0192"
        @fax_profile = data
      when "0193"
        @coding_methods = data
      when "0194"
        @version_year = data
      when "0195"
        @mode_number = data
      when "01B1"
        @decode = data
      when "01B2"
        @default_image_color = data
      when "01B3"
        @t82_options = data
      when "01B5"
        @jpeg_tables = data
      when "0200"
        @jpeg_proc = data
      when "0201"
        @thumbnail_offset = data
      when "0202"
        @thumbnail_length = data
      when "0203"
        @jpeg_restart_interval = data
      when "0205"
        @jpeg_lossless_predictors = data
      when "0206"
        @jpeg_point_transforms = data
      when "0207"
        @jpeg_q_tables = data
      when "0208"
        @jpeg_dc_tables = data
      when "0209"
        @jpeg_ac_tables = data
      when "0211"
        @y_cb_cr_coefficients = data
      when "0212"
        @y_cb_cr_subsampling = data
      when "0213"
        @y_cb_cr_positioning = data
      when "0214"
        @reference_black_white = data
      when "022F"
        @strip_row_counts = data
      when "02BC"
        @application_notes = data
      when "03E7"
        @uspt_omiscellaneous = data
      when "1000"
        @related_image_file_format = data
      when "1001"
        @related_image_width = data
      when "1002"
        @related_image_height = data
      when "4746"
        @rating = data
      when "4747"
        @xp_dip_xml = data
      when "4748"
        @stitch_info = data
      when "4749"
        @rating_percent = data
      when "800D"
        @image_id = data
      when "80A3"
        @wang_tag_1 = data
      when "80A4"
        @wang_annotation = data
      when "80A5"
        @wang_tag_3 = data
      when "80A6"
        @wang_tag_4 = data
      when "80E3"
        @matteing = data
      when "80E4"
        @data_type = data
      when "80E5"
        @image_depth = data
      when "80E6"
        @tile_depth = data
      when "827D"
        @mode_l2 = data
      when "828D"
        @cfa_repeat_pattern_dim = data
      when "828E"
        @cfa_pattern_2 = data
      when "828F"
        @battery_level = data
      when "8290"
        @kodak_ifd = data
      when "8298"
        @copyright = data
      when "829A"
        @exposure_time = data
      when "829D"
        @f_number = data
      when "82A5"
        @md_file_tag = data
      when "82A6"
        @md_scale_pixel = data
      when "82A7"
        @md_color_table = data
      when "82A8"
        @md_lab_name = data
      when "82A9"
        @md_sample_info = data
      when "82AA"
        @md_prep_date = data
      when "82AB"
        @md_prep_time = data
      when "82AC"
        @mdfileunits = data
      when "830E"
        @pixel_scale = data
      when "8335"
        @advent_scale = data
      when "8336"
        @advent_revision = data
      when "835C"
        @uic_1_tag = data
      when "835D"
        @uic_2_tag = data
      when "835E"
        @uic_3_tag = data
      when "835F"
        @uic_4_tag = data
      when "83BB"
        @iptc_naa = data
      when "847E"
        @intergraph_packet_data = data
      when "847F"
        @intergraph_flag_registers = data
      when "8480"
        @intergraph_matrix = data
      when "8481"
        @ingr_reserved = data
      when "8482"
        @model_tie_point = data
      when "84E0"
        @site = data
      when "84E1"
        @color_sequence = data
      when "84E2"
        @it8_header = data
      when "84E3"
        @raster_padding = data
      when "84E4"
        @bits_per_run_length = data
      when "84E5"
        @bits_per_extended_run_length = data
      when "84E6"
        @color_table = data
      when "84E7"
        @image_color_indicator = data
      when "84E8"
        @background_color_indicator = data
      when "84E9"
        @image_color_value = data
      when "84EA"
        @background_color_value = data
      when "84EB"
        @pixel_intensity_range = data
      when "84EC"
        @transparency_indicator = data
      when "84ED"
        @color_characterization = data
      when "84EE"
        @hc_usage = data
      when "84EF"
        @trap_indicator = data
      when "84F0"
        @cmyk_equivalent = data
      when "8546"
        @sem_info = data
      when "8568"
        @afcp_iptc = data
      when "85B8"
        @pixel_magic_jbig_options = data
      when "85D8"
        @model_transform = data
      when "8602"
        @wb_grgb_levels = data
      when "8606"
        @leaf_data = data
      when "8649"
        @photoshop_settings = data
      when "8769"
        @exif_offset = data
      when "8773"
        @icc_profile = data
      when "877F"
        @tiff_fxextensions = data
      when "8780"
        @multi_profiles = data
      when "8781"
        @shared_data = data
      when "8782"
        @t88_options = data
      when "87AC"
        @image_layer = data
      when "87AF"
        @geo_tiff_directory = data
      when "87B0"
        @geo_tiff_double_params = data
      when "87B1"
        @geo_tiff_ascii_params = data
      when "8822"
        @exposure_program = data
      when "8824"
        @spectral_sensitivity = data
      when "8825"
        @gps_info = data
      when "8827"
        @iso = data
      when "8828"
        @opto_electric_conv_factor = data
      when "8829"
        @interlace = data
      when "882A"
        @time_zone_offset = data
      when "882B"
        @self_timer_mode = data
      when "8830"
        @sensitivity_type = data
      when "8831"
        @standard_output_sensitivity = data
      when "8832"
        @recommended_exposure_index = data
      when "8833"
        @iso_speed = data
      when "8834"
        @iso_speed_latitude_yyy = data
      when "8835"
        @iso_speed_latitude_zzz = data
      when "885C"
        @fax_recv_params = data
      when "885D"
        @fax_sub_address = data
      when "885E"
        @fax_recv_time = data
      when "888A"
        @leaf_subifd = data
      when "9000"
        @exif_version = data
      when "9003"
        @date_time_original = data
      when "9004"
        @create_date = data
      when "9101"
        @components_configuration = data
      when "9102"
        @compressed_bits_per_pixel = data
      when "9201"
        @shutter_speed_value = data
      when "9202"
        @aperture_value = data
      when "9203"
        @brightness_value = data
      when "9204"
        @exposure_compensation = data
      when "9205"
        @max_aperture_value = data
      when "9206"
        @subject_distance = data
      when "9207"
        @metering_mode = data
      when "9208"
        @light_source = data
      when "9209"
        @flash = data
      when "920A"
        @focal_length = data
      when "920B"
        @flash_energy = data
      when "920C"
        @spatial_frequencyresponse = data
      when "920D"
        @noise = data
      when "920E"
        @focal_plane_x_resolution = data
      when "920F"
        @focal_plane_y_resolution = data
      when "9210"
        @focal_plane_resolution_unit = data
      when "9211"
        @image_number = data
      when "9212"
        @security_classification = data
      when "9213"
        @image_history = data
      when "9214"
        @subject_area = data
      when "9215"
        @exposure_index = data
      when "9216"
        @tiff_ep_standard_id = data
      when "9217"
        @sensing_method = data
      when "923A"
        @cip3_data_file = data
      when "923B"
        @cip3_sheet = data
      when "923C"
        @cip3_side = data
      when "923F"
        @sto_nits = data
      when "927C"
        @maker_note_vendor = data # VENDOR can be Apple, Nikon, Canon, etc
      when "9286"
        @user_comment = data
      when "9290"
        @sub_sec_time = data
      when "9291"
        @sub_sec_time_original = data
      when "9292"
        @sub_sec_time_digitized = data
      when "932F"
        @ms_document_text = data
      when "9330"
        @ms_property_set_storage = data
      when "9331"
        @ms_document_text_position = data
      when "935C"
        @image_source_data = data
      when "9C9B"
        @xp_title = data
      when "9C9C"
        @xp_comment = data
      when "9C9D"
        @xp_author = data
      when "9C9E"
        @xp_keywords = data
      when "9C9F"
        @xp_subject = data
      when "A000"
        @flashpix_version = data
      when "A001"
        @color_space = data
      when "A002"
        @exif_image_width = data
      when "A003"
        @exif_image_height = data
      when "A004"
        @related_sound_file = data
      when "A005"
        @interop_offset = data
      when "A20B"
        @flash_energy = data
      when "A20C"
        @spatial_frequency_response = data
      when "A20D"
        @noise = data
      when "A20E"
        @focal_plane_x_resolution = data
      when "A20F"
        @focal_plane_y_resolution = data
      when "A210"
        @focal_plane_resolution_unit = data
      when "A211"
        @image_number = data
      when "A212"
        @security_classification = data
      when "A213"
        @image_history = data
      when "A214"
        @subject_location = data
      when "A215"
        @exposure_index = data
      when "A216"
        @tiff_ep_standard_id = data
      when "A217"
        @sensing_method = data
      when "A300"
        @file_source = data
      when "A301"
        @scene_type = data
      when "A302"
        @cfa_pattern = data
      when "A401"
        @custom_rendered = data
      when "A402"
        @exposure_mode = data
      when "A403"
        @white_balance = data
      when "A404"
        @digital_zoom_ratio = data
      when "A405"
        @focal_length_in_35mm_format = data
      when "A406"
        @scene_capture_type = data
      when "A407"
        @gain_control = data
      when "A408"
        @contrast = data
      when "A409"
        @saturation = data
      when "A40A"
        @sharpness = data
      when "A40B"
        @device_setting_description = data
      when "A40C"
        @subject_distance_range = data
      when "A420"
        @image_unique_id = data
      when "A430"
        @owner_name = data
      when "A431"
        @serial_number = data
      when "A432"
        @lens_info = data
      when "A433"
        @lens_make = data
      when "A434"
        @lens_model = data
      when "A435"
        @lens_serial_number = data
      when "A480"
        @gdal_metadata = data
      when "A481"
        @gdal_no_data = data
      when "A500"
        @gamma = data
      when "AFC0"
        @expand_software = data
      when "AFC1"
        @expand_lens = data
      when "AFC2"
        @expand_film = data
      when "AFC3"
        @expand_filter_lens = data
      when "AFC4"
        @expand_scanner = data
      when "AFC5"
        @expand_flash_lamp = data
      when "BC01"
        @pixel_format = data
      when "BC02"
        @transformation = data
      when "BC03"
        @uncompressed = data
      when "BC04"
        @image_type = data
      when "BC80"
        @image_width = data
      when "BC81"
        @image_height = data
      when "BC82"
        @width_resolution = data
      when "BC83"
        @height_resolution = data
      when "BCC0"
        @image_offset = data
      when "BCC1"
        @image_byte_count = data
      when "BCC2"
        @alpha_offset = data
      when "BCC3"
        @alpha_byte_count = data
      when "BCC4"
        @image_data_discard = data
      when "BCC5"
        @alpha_data_discard = data
      when "C427"
        @oce_scanjob_desc = data
      when "C428"
        @oce_application_selector = data
      when "C429"
        @oce_id_number = data
      when "C42A"
        @oce_image_logic = data
      when "C44F"
        @annotations = data
      when "C4A5"
        @print_im = data
      when "C573"
        @original_filename = data
      when "C580"
        @uspto_original_content_type = data
      when "C612"
        @dng_version = data
      when "C613"
        @dng_backward_version = data
      when "C614"
        @unique_camera_model = data
      when "C615"
        @localized_camera_model = data
      when "C616"
        @cfa_plane_color = data
      when "C617"
        @cfa_layout = data
      when "C618"
        @linearization_table = data
      when "C619"
        @black_level_repeat_dim = data
      when "C61A"
        @black_level = data
      when "C61B"
        @black_level_delta_h = data
      when "C61C"
        @black_level_delta_v = data
      when "C61D"
        @white_level = data
      when "C61E"
        @default_scale = data
      when "C61F"
        @default_crop_origin = data
      when "C620"
        @default_crop_size = data
      when "C621"
        @color_matrix_1 = data
      when "C622"
        @color_matrix_2 = data
      when "C623"
        @camera_calibration_1 = data
      when "C624"
        @camera_calibration_2 = data
      when "C625"
        @reduction_matrix_1 = data
      when "C626"
        @reduction_matrix_2 = data
      when "C627"
        @analog_balance = data
      when "C628"
        @asshot_neutral = data
      when "C629"
        @asshot_white_xy = data
      when "C62A"
        @baseline_exposure = data
      when "C62B"
        @baseline_noise = data
      when "C62C"
        @baseline_sharpness = data
      when "C62D"
        @bayer_green_split = data
      when "C62E"
        @linear_response_limit = data
      when "C62F"
        @camera_serial_number = data
      when "C630"
        @dng_lens_info = data
      when "C631"
        @chroma_blur_radius = data
      when "C632"
        @anti_alias_strength = data
      when "C633"
        @shadow_scale = data
      when "C634"
        @sr2_private = data
      when "C635"
        @maker_note_safety = data
      when "C640"
        @raw_image_segmentation = data
      when "C65A"
        @calibration_illuminant_1 = data
      when "C65B"
        @calibration_illuminant_2 = data
      when "C65C"
        @best_quality_scale = data
      when "C65D"
        @raw_data_unique_id = data
      when "C660"
        @alias_layer_metadata = data
      when "C68B"
        @original_raw_file_name = data
      when "C68C"
        @original_raw_file_data = data
      when "C68D"
        @active_area = data
      when "C68E"
        @masked_areas = data
      when "C68F"
        @asshot_icc_profile = data
      when "C690"
        @asshot_pre_profile_matrix = data
      when "C691"
        @current_icc_profile = data
      when "C692"
        @current_pre_profile_matrix = data
      when "C6BF"
        @colorimetric_reference = data
      when "C6D2"
        @panasonic_title = data
      when "C6D3"
        @panasonic_title_2 = data
      when "C6F3"
        @camera_calibration_sig = data
      when "C6F4"
        @profile_calibration_sig = data
      when "C6F5"
        @profile_ifd = data
      when "C6F6"
        @asshot_profile_name = data
      when "C6F7"
        @noise_reduction_applied = data
      when "C6F8"
        @profile_name = data
      when "C6F9"
        @profile_hue_sat_mapdims = data
      when "C6FA"
        @profile_hue_sat_map_data_1 = data
      when "C6FB"
        @profile_hue_sat_map_data_2 = data
      when "C6FC"
        @profile_tone_curve = data
      when "C6FD"
        @profile_embed_policy = data
      when "C6FE"
        @profile_copyright = data
      when "C714"
        @forward_matrix_1 = data
      when "C715"
        @forward_matrix_2 = data
      when "C716"
        @preview_application_name = data
      when "C717"
        @preview_application_version = data
      when "C718"
        @preview_settings_name = data
      when "C719"
        @preview_settings_digest = data
      when "C71A"
        @preview_color_space = data
      when "C71B"
        @preview_date_time = data
      when "C71C"
        @raw_image_digest = data
      when "C71D"
        @original_raw_file_digest = data
      when "C71E"
        @sub_tile_block_size = data
      when "C71F"
        @row_interleave_factor = data
      when "C725"
        @profile_look_table_dims = data
      when "C726"
        @profile_look_table_data = data
      when "C740"
        @opcode_list_1 = data
      when "C741"
        @opcode_list_2 = data
      when "C74E"
        @opcode_list_3 = data
      when "C761"
        @noise_profile = data
      when "C763"
        @time_codes = data
      when "C764"
        @frame_rate = data
      when "C772"
        @t_stop = data
      when "C789"
        @reel_name = data
      when "C791"
        @original_default_final_size = data
      when "C792"
        @original_best_quality_size = data
      when "C793"
        @original_default_crop_size = data
      when "C7A1"
        @camera_label = data
      when "C7A3"
        @profile_hue_sat_map_encoding = data
      when "C7A4"
        @profile_look_table_encoding = data
      when "C7A5"
        @baseline_exposure_offset = data
      when "C7A6"
        @default_black_render = data
      when "C7A7"
        @new_raw_image_digest = data
      when "C7A8"
        @raw_to_preview_gain = data
      when "C7B5"
        @default_user_crop = data
      when "EA1C"
        @padding = data
      when "EA1D"
        @offset_schema = data
      when "FDE8"
        @owner_name = data
      when "FDE9"
        @serial_number = data
      when "FDEA"
        @lens = data
      when "FE00"
        @kdc_ifd = data
      when "FE4C"
        @raw_file = data
      when "FE4D"
        @converter = data
      when "FE4E"
        @white_balance = data
      when "FE51"
        @exposure = data
      when "FE52"
        @shadows = data
      when "FE53"
        @brightness = data
      when "FE54"
        @contrast = data
      when "FE55"
        @saturation = data
      when "FE56"
        @sharpness = data
      when "FE57"
        @smoothness = data
      when "FE58"
        @moire_filter = data
      end

    end

    # Notes: strings end with a NULL char (all observed so far have).




  end
end