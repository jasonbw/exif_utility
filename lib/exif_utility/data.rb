module ExifUtility
  # Contains the values for each tag, populated by the parser
  class Data

    # TODO: Save data read in for each tag
    # TODO: attr_accessor for all tags

    attr_reader :exif_offset

    attr_reader :date_time

    # you can do multiple per line
    # attr_reader :name, :age


    def initialize
      # nothing needed to be done currently
      @date_time = "test value, please delete"
    end


    # this means that data needs to have a mapping from Tag to attr_accessor / english
    def add_data(tag_number, data)

      #  should also cover for:
      # The last entry of IFD0 contains the Exif Offset, the offset to the Exif SubIDF

      case tag_number

      # DEL THIS ONE, it's a dupe
      when "0132"
        @date_time = data


      when "0001"
        @interop_index = data
      when "0002"
        @interop_version = data
      when "000B"
        @Processing_Software = data
      when "00FE"
        @Subfile_Type = data
      when "00FF"
        @Old_Subfile_Type = data
      when "0100"
        @Image_Width = data
      when "0101"
        @Image_Height = data
      when "0102"
        @Bits_Per_Sample = data
      when "0103"
        @Compression = data
      when "0106"
        @Photometric_Interpretation = data
      when "0107"
        @Thresholding = data
      when "0108"
        @Cell_Width = data
      when "0109"
        @Cell_Length = data
      when "010A"
        @Fill_Order = data
      when "010D"
        @Document_Name = data
      when "010E"
        @Image_Description = data
      when "010F"
        @Make = data
      when "0110"
        @Model = data
      when "0111"
        @Strip_Offsets = data
      when "0112"
        @Orientation = data
      when "0115"
        @Samples_Per_Pixel = data
      when "0116"
        @Rows_Per_Strip = data
      when "0117"
        @Strip_Byte_Counts = data
      when "0118"
        @Min_Sample_Value = data
      when "0119"
        @Max_Sample_Value = data
      when "011A"
        @X_Resolution = data
      when "011B"
        @Y_Resolution = data
      when "011C"
        @Planar_Configuration = data
      when "011D"
        @Page_Name = data
      when "011E"
        @X_Position = data
      when "011F"
        @Y_Position = data
      when "0120"
        @Free_Offsets = data
      when "0121"
        @Free_Byte_Counts = data
      when "0122"
        @Gray_Response_Unit = data
      when "0123"
        @Gray_Response_Curve = data
      when "0124"
        @T4_Options = data
      when "0125"
        @T6_Options = data
      when "0128"
        @Resolution_Unit = data
      when "0129"
        @Page_Number = data
      when "012C"
        @Color_Response_Unit = data
      when "012D"
        @Transfer_Function = data
      when "0131"
        @Software = data
      when "0132"
        @Modify_Date = data
      when "013B"
        @Artist = data
      when "013C"
        @Host_Computer = data
      when "013D"
        @Predictor = data
      when "013E"
        @White_Point = data
      when "013F"
        @Primary_Chromaticities = data
      when "0140"
        @Color_Map = data
      when "0141"
        @Halftone_Hints = data
      when "0142"
        @Tile_Width = data
      when "0143"
        @Tile_Length = data
      when "0144"
        @Tile_Offsets = data
      when "0145"
        @Tile_Byte_Counts = data
      when "0146"
        @Bad_Fax_Lines = data
      when "0147"
        @Clean_Fax_Data = data
      when "0148"
        @Consecutive_Bad_Fax_Lines = data
      when "014A"
        @Sub_IFD = data
      when "014C"
        @Ink_Set = data
      when "014D"
        @Ink_Names = data
      when "014E"
        @Number_of_Inks = data
      when "0150"
        @Dot_Range = data
      when "0151"
        @Target_Printer = data
      when "0152"
        @Extra_Samples = data
      when "0153"
        @Sample_Format = data
      when "0154"
        @S_Min_Sample_Value = data
      when "0155"
        @S_Max_Sample_Value = data
      when "0156"
        @Transfer_Range = data
      when "0157"
        @Clip_Path = data
      when "0158"
        @X_Clip_Path_Units = data
      when "0159"
        @Y_Clip_Path_Units = data
      when "015A"
        @Indexed = data
      when "015B"
        @JPEG_Tables = data
      when "015F"
        @OPI_Proxy = data
      when "0190"
        @Global_Parameters_IFD = data
      when "0191"
        @Profile_Type = data
      when "0192"
        @Fax_Profile = data
      when "0193"
        @Coding_Methods = data
      when "0194"
        @Version_Year = data
      when "0195"
        @Mode_Number = data
      when "01B1"
        @Decode = data
      when "01B2"
        @Default_Image_Color = data
      when "01B3"
        @T82_Options = data
      when "01B5"
        @JPEG_Tables = data
      when "0200"
        @JPEG_Proc = data
      when "0201"
        @Thumbnail_Offset = data
      when "0202"
        @Thumbnail_Length = data
      when "0203"
        @JPEG_Restart_Interval = data
      when "0205"
        @JPEG_Lossless_Predictors = data
      when "0206"
        @JPEG_Point_Transforms = data
      when "0207"
        @JPEG_Q_Tables = data
      when "0208"
        @JPEG_DC_Tables = data
      when "0209"
        @JPEG_AC_Tables = data
      when "0211"
        @Y_Cb_Cr_Coefficients = data
      when "0212"
        @Y_Cb_Cr_SubSampling = data
      when "0213"
        @Y_Cb_Cr_Positioning = data
      when "0214"
        @Reference_Black_White = data
      when "022F"
        @Strip_Row_Counts = data
      when "02BC"
        @Application_Notes = data
      when "03E7"
        @USPT_OMiscellaneous = data
      when "1000"
        @Related_Image_File_Format = data
      when "1001"
        @Related_Image_Width = data
      when "1002"
        @Related_Image_Height = data
      when "4746"
        @Rating = data
      when "4747"
        @XP_DIP_XML = data
      when "4748"
        @Stitch_Info = data
      when "4749"
        @Rating_Percent = data
      when "800D"
        @Image_ID = data
      when "80A3"
        @Wang_Tag_1 = data
      when "80A4"
        @Wang_Annotation = data
      when "80A5"
        @Wang_Tag_3 = data
      when "80A6"
        @Wang_Tag_4 = data
      when "80E3"
        @Matteing = data
      when "80E4"
        @Data_Type = data
      when "80E5"
        @Image_Depth = data
      when "80E6"
        @Tile_Depth = data
      when "827D"
        @Mode_l2 = data
      when "828D"
        @CFA_Repeat_Pattern_Dim = data
      when "828E"
        @CFA_Pattern_2 = data
      when "828F"
        @Battery_Level = data
      when "8290"
        @Kodak_IFD = data
      when "8298"
        @Copyright = data
      when "829A"
        @Exposure_Time = data
      when "829D"
        @F_Number = data
      when "82A5"
        @MD_File_Tag = data
      when "82A6"
        @MD_Scale_Pixel = data
      when "82A7"
        @MD_Color_Table = data
      when "82A8"
        @MD_Lab_Name = data
      when "82A9"
        @MD_Sample_Info = data
      when "82AA"
        @MD_Prep_Date = data
      when "82AB"
        @MD_Prep_Time = data
      when "82AC"
        @MDFileUnits = data
      when "830E"
        @PixelScale = data
      when "8335"
        @AdventScale = data
      when "8336"
        @AdventRevision = data
      when "835C"
        @UIC1Tag = data
      when "835D"
        @UIC2Tag = data
      when "835E"
        @UIC3Tag = data
      when "835F"
        @UIC4Tag = data
      when "83BB"
        @IPTC-NAA = data
      when "847E"
        @IntergraphPacketData = data
      when "847F"
        @IntergraphFlagRegisters = data
      when "8480"
        @IntergraphMatrix = data
      when "8481"
        @INGRReserved = data
      when "8482"
        @ModelTiePoint = data
      when "84E0"
        @Site = data
      when "84E1"
        @ColorSequence = data
      when "84E2"
        @IT8Header = data
      when "84E3"
        @RasterPadding = data
      when "84E4"
        @BitsPerRunLength = data
      when "84E5"
        @BitsPerExtendedRunLength = data
      when "84E6"
        @ColorTable = data
      when "84E7"
        @ImageColorIndicator = data
      when "84E8"
        @BackgroundColorIndicator = data
      when "84E9"
        @ImageColorValue = data
      when "84EA"
        @BackgroundColorValue = data
      when "84EB"
        @PixelIntensityRange = data
      when "84EC"
        @TransparencyIndicator = data
      when "84ED"
        @ColorCharacterization = data
      when "84EE"
        @HCUsage = data
      when "84EF"
        @TrapIndicator = data
      when "84F0"
        @CMYKEquivalent = data
      when "8546"
        @SEMInfo = data
      when "8568"
        @AFCP_IPTC = data
      when "85B8"
        @PixelMagicJBIGOptions = data
      when "85D8"
        @ModelTransform = data
      when "8602"
        @WB_GRGBLevels = data
      when "8606"
        @LeafData = data
      when "8649"
        @PhotoshopSettings = data
      when "8769"
        @exif_offset = data
      when "8773"
        @ICC_Profile = data
      when "877F"
        @TIFF_FXExtensions = data
      when "8780"
        @MultiProfiles = data
      when "8781"
        @SharedData = data
      when "8782"
        @T88Options = data
      when "87AC"
        @ImageLayer = data
      when "87AF"
        @GeoTiffDirectory = data
      when "87B0"
        @GeoTiffDoubleParams = data
      when "87B1"
        @GeoTiffAsciiParams = data
      when "8822"
        @ExposureProgram = data
      when "8824"
        @SpectralSensitivity = data
      when "8825"
        @GPSInfo = data
      when "8827"
        @ISO = data
      when "8828"
        @Opto-ElectricConvFactor = data
      when "8829"
        @Interlace = data
      when "882A"
        @TimeZoneOffset = data
      when "882B"
        @SelfTimerMode = data
      when "8830"
        @SensitivityType = data
      when "8831"
        @StandardOutputSensitivity = data
      when "8832"
        @RecommendedExposureIndex = data
      when "8833"
        @ISOSpeed = data
      when "8834"
        @ISOSpeedLatitudeyyy = data
      when "8835"
        @ISOSpeedLatitudezzz = data
      when "885C"
        @FaxRecvParams = data
      when "885D"
        @FaxSubAddress = data
      when "885E"
        @FaxRecvTime = data
      when "888A"
        @LeafSubIFD = data
      when "9000"
        @ExifVersion = data
      when "9003"
        @DateTimeOriginal = data
      when "9004"
        @CreateDate = data
      when "9101"
        @ComponentsConfiguration = data
      when "9102"
        @CompressedBitsPerPixel = data
      when "9201"
        @ShutterSpeedValue = data
      when "9202"
        @ApertureValue = data
      when "9203"
        @BrightnessValue = data
      when "9204"
        @ExposureCompensation = data
      when "9205"
        @MaxApertureValue = data
      when "9206"
        @SubjectDistance = data
      when "9207"
        @MeteringMode = data
      when "9208"
        @LightSource = data
      when "9209"
        @Flash = data
      when "920A"
        @FocalLength = data
      when "920B"
        @FlashEnergy = data
      when "920C"
        @SpatialFrequencyResponse = data
      when "920D"
        @Noise = data
      when "920E"
        @FocalPlaneXResolution = data
      when "920F"
        @FocalPlaneYResolution = data
      when "9210"
        @FocalPlaneResolutionUnit = data
      when "9211"
        @ImageNumber = data
      when "9212"
        @SecurityClassification = data
      when "9213"
        @ImageHistory = data
      when "9214"
        @SubjectArea = data
      when "9215"
        @ExposureIndex = data
      when "9216"
        @TIFF-EPStandardID = data
      when "9217"
        @SensingMethod = data
      when "923A"
        @CIP3DataFile = data
      when "923B"
        @CIP3Sheet = data
      when "923C"
        @CIP3Side = data
      when "923F"
        @StoNits = data
      when "927C"
        @MakerNoteVENDOR = data # VENDOR can be Apple, Nikon, Canon, etc
      when "9286"
        @UserComment = data
      when "9290"
        @SubSecTime = data
      when "9291"
        @SubSecTimeOriginal = data
      when "9292"
        @SubSecTimeDigitized = data
      when "932F"
        @MSDocumentText = data
      when "9330"
        @MSPropertySetStorage = data
      when "9331"
        @MSDocumentTextPosition = data
      when "935C"
        @ImageSourceData = data
      when "9C9B"
        @XPTitle = data
      when "9C9C"
        @XPComment = data
      when "9C9D"
        @XPAuthor = data
      when "9C9E"
        @XPKeywords = data
      when "9C9F"
        @XPSubject = data
      when "A000"
        @FlashpixVersion = data
      when "A001"
        @ColorSpace = data
      when "A002"
        @ExifImageWidth = data
      when "A003"
        @ExifImageHeight = data
      when "A004"
        @RelatedSoundFile = data
      when "A005"
        @InteropOffset = data
      when "A20B"
        @FlashEnergy = data
      when "A20C"
        @SpatialFrequencyResponse = data
      when "A20D"
        @Noise = data
      when "A20E"
        @FocalPlaneXResolution = data
      when "A20F"
        @FocalPlaneYResolution = data
      when "A210"
        @FocalPlaneResolutionUnit = data
      when "A211"
        @ImageNumber = data
      when "A212"
        @SecurityClassification = data
      when "A213"
        @ImageHistory = data
      when "A214"
        @SubjectLocation = data
      when "A215"
        @ExposureIndex = data
      when "A216"
        @TIFF-EPStandardID = data
      when "A217"
        @SensingMethod = data
      when "A300"
        @FileSource = data
      when "A301"
        @SceneType = data
      when "A302"
        @CFAPattern = data
      when "A401"
        @CustomRendered = data
      when "A402"
        @ExposureMode = data
      when "A403"
        @WhiteBalance = data
      when "A404"
        @DigitalZoomRatio = data
      when "A405"
        @FocalLengthIn35mmFormat = data
      when "A406"
        @SceneCaptureType = data
      when "A407"
        @GainControl = data
      when "A408"
        @Contrast = data
      when "A409"
        @Saturation = data
      when "A40A"
        @Sharpness = data
      when "A40B"
        @DeviceSettingDescription = data
      when "A40C"
        @SubjectDistanceRange = data
      when "A420"
        @ImageUniqueID = data
      when "A430"
        @OwnerName = data
      when "A431"
        @SerialNumber = data
      when "A432"
        @LensInfo = data
      when "A433"
        @LensMake = data
      when "A434"
        @LensModel = data
      when "A435"
        @LensSerialNumber = data
      when "A480"
        @GDALMetadata = data
      when "A481"
        @GDALNoData = data
      when "A500"
        @Gamma = data
      when "AFC0"
        @ExpandSoftware = data
      when "AFC1"
        @ExpandLens = data
      when "AFC2"
        @ExpandFilm = data
      when "AFC3"
        @ExpandFilterLens = data
      when "AFC4"
        @ExpandScanner = data
      when "AFC5"
        @ExpandFlashLamp = data
      when "BC01"
        @PixelFormat = data
      when "BC02"
        @Transformation = data
      when "BC03"
        @Uncompressed = data
      when "BC04"
        @ImageType = data
      when "BC80"
        @ImageWidth = data
      when "BC81"
        @ImageHeight = data
      when "BC82"
        @WidthResolution = data
      when "BC83"
        @HeightResolution = data
      when "BCC0"
        @ImageOffset = data
      when "BCC1"
        @ImageByteCount = data
      when "BCC2"
        @AlphaOffset = data
      when "BCC3"
        @AlphaByteCount = data
      when "BCC4"
        @ImageDataDiscard = data
      when "BCC5"
        @AlphaDataDiscard = data
      when "C427"
        @OceScanjobDesc = data
      when "C428"
        @OceApplicationSelector = data
      when "C429"
        @OceIDNumber = data
      when "C42A"
        @OceImageLogic = data
      when "C44F"
        @Annotations = data
      when "C4A5"
        @PrintIM = data
      when "C573"
        @OriginalFileName = data
      when "C580"
        @USPTOOriginalContentType = data
      when "C612"
        @DNGVersion = data
      when "C613"
        @DNGBackwardVersion = data
      when "C614"
        @UniqueCameraModel = data
      when "C615"
        @LocalizedCameraModel = data
      when "C616"
        @CFAPlaneColor = data
      when "C617"
        @CFALayout = data
      when "C618"
        @LinearizationTable = data
      when "C619"
        @BlackLevelRepeatDim = data
      when "C61A"
        @BlackLevel = data
      when "C61B"
        @BlackLevelDeltaH = data
      when "C61C"
        @BlackLevelDeltaV = data
      when "C61D"
        @WhiteLevel = data
      when "C61E"
        @DefaultScale = data
      when "C61F"
        @DefaultCropOrigin = data
      when "C620"
        @DefaultCropSize = data
      when "C621"
        @ColorMatrix1 = data
      when "C622"
        @ColorMatrix2 = data
      when "C623"
        @CameraCalibration1 = data
      when "C624"
        @CameraCalibration2 = data
      when "C625"
        @ReductionMatrix1 = data
      when "C626"
        @ReductionMatrix2 = data
      when "C627"
        @AnalogBalance = data
      when "C628"
        @AsShotNeutral = data
      when "C629"
        @AsShotWhiteXY = data
      when "C62A"
        @BaselineExposure = data
      when "C62B"
        @BaselineNoise = data
      when "C62C"
        @BaselineSharpness = data
      when "C62D"
        @BayerGreenSplit = data
      when "C62E"
        @LinearResponseLimit = data
      when "C62F"
        @CameraSerialNumber = data
      when "C630"
        @DNGLensInfo = data
      when "C631"
        @ChromaBlurRadius = data
      when "C632"
        @AntiAliasStrength = data
      when "C633"
        @ShadowScale = data
      when "C634"
        @SR2Private = data
      when "C635"
        @MakerNoteSafety = data
      when "C640"
        @RawImageSegmentation = data
      when "C65A"
        @CalibrationIlluminant1 = data
      when "C65B"
        @CalibrationIlluminant2 = data
      when "C65C"
        @BestQualityScale = data
      when "C65D"
        @RawDataUniqueID = data
      when "C660"
        @AliasLayerMetadata = data
      when "C68B"
        @OriginalRawFileName = data
      when "C68C"
        @OriginalRawFileData = data
      when "C68D"
        @ActiveArea = data
      when "C68E"
        @MaskedAreas = data
      when "C68F"
        @AsShotICCProfile = data
      when "C690"
        @AsShotPreProfileMatrix = data
      when "C691"
        @CurrentICCProfile = data
      when "C692"
        @CurrentPreProfileMatrix = data
      when "C6BF"
        @ColorimetricReference = data
      when "C6D2"
        @PanasonicTitle = data
      when "C6D3"
        @PanasonicTitle2 = data
      when "C6F3"
        @CameraCalibrationSig = data
      when "C6F4"
        @ProfileCalibrationSig = data
      when "C6F5"
        @ProfileIFD = data
      when "C6F6"
        @AsShotProfileName = data
      when "C6F7"
        @NoiseReductionApplied = data
      when "C6F8"
        @ProfileName = data
      when "C6F9"
        @ProfileHueSatMapDims = data
      when "C6FA"
        @ProfileHueSatMapData1 = data
      when "C6FB"
        @ProfileHueSatMapData2 = data
      when "C6FC"
        @ProfileToneCurve = data
      when "C6FD"
        @ProfileEmbedPolicy = data
      when "C6FE"
        @ProfileCopyright = data
      when "C714"
        @ForwardMatrix1 = data
      when "C715"
        @ForwardMatrix2 = data
      when "C716"
        @PreviewApplicationName = data
      when "C717"
        @PreviewApplicationVersion = data
      when "C718"
        @PreviewSettingsName = data
      when "C719"
        @PreviewSettingsDigest = data
      when "C71A"
        @PreviewColorSpace = data
      when "C71B"
        @PreviewDateTime = data
      when "C71C"
        @RawImageDigest = data
      when "C71D"
        @OriginalRawFileDigest = data
      when "C71E"
        @SubTileBlockSize = data
      when "C71F"
        @RowInterleaveFactor = data
      when "C725"
        @ProfileLookTableDims = data
      when "C726"
        @ProfileLookTableData = data
      when "C740"
        @OpcodeList1 = data
      when "C741"
        @OpcodeList2 = data
      when "C74E"
        @OpcodeList3 = data
      when "C761"
        @NoiseProfile = data
      when "C763"
        @TimeCodes = data
      when "C764"
        @FrameRate = data
      when "C772"
        @TStop = data
      when "C789"
        @ReelName = data
      when "C791"
        @OriginalDefaultFinalSize = data
      when "C792"
        @OriginalBestQualitySize = data
      when "C793"
        @OriginalDefaultCropSize = data
      when "C7A1"
        @CameraLabel = data
      when "C7A3"
        @ProfileHueSatMapEncoding = data
      when "C7A4"
        @ProfileLookTableEncoding = data
      when "C7A5"
        @BaselineExposureOffset = data
      when "C7A6"
        @DefaultBlackRender = data
      when "C7A7"
        @NewRawImageDigest = data
      when "C7A8"
        @RawToPreviewGain = data
      when "C7B5"
        @DefaultUserCrop = data
      when "EA1C"
        @Padding = data
      when "EA1D"
        @OffsetSchema = data
      when "FDE8"
        @OwnerName = data
      when "FDE9"
        @SerialNumber = data
      when "FDEA"
        @Lens = data
      when "FE00"
        @KDC_IFD = data
      when "FE4C"
        @RawFile = data
      when "FE4D"
        @Converter = data
      when "FE4E"
        @WhiteBalance = data
      when "FE51"
        @Exposure = data
      when "FE52"
        @Shadows = data
      when "FE53"
        @Brightness = data
      when "FE54"
        @Contrast = data
      when "FE55"
        @Saturation = data
      when "FE56"
        @Sharpness = data
      when "FE57"
        @Smoothness = data
      when "FE58"
        @MoireFilter = data
      end
    }




  end
end