module ExifUtility
  # Contains the values for each tag, populated by the parser
  class Data

    # TODO: Save data read in for each tag
    # TODO: attr_accessor for all tags

    attr_reader :exif_offset

    attr_reader :date_time


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
				@InteropIndex = data
      when "0002"
				@InteropVersion = data
      when "000b"
				@ProcessingSoftware = data
      when "00fe"
				@SubfileType = data
      when "00ff"
				@OldSubfileType = data
      when "0100"
				@ImageWidth = data
      when "0101"
				@ImageHeight = data
      when "0102"
				@BitsPerSample = data
      when "0103"
				@Compression = data
      when "0106"
				@PhotometricInterpretation = data
      when "0107"
				@Thresholding = data
      when "0108"
				@CellWidth = data
      when "0109"
				@CellLength = data
      when "010a"
				@FillOrder = data
      when "010d"
				@DocumentName = data
      when "010e"
				@ImageDescription = data
      when "010f"
				@Make = data
      when "0110"
				@Model = data
      when "0111"
				@StripOffsets = data
      when "0112"
				@Orientation = data
      when "0115"
				@SamplesPerPixel = data
      when "0116"
				@RowsPerStrip = data
      when "0117"
				@StripByteCounts = data
      when "0118"
				@MinSampleValue = data
      when "0119"
				@MaxSampleValue = data
      when "011a"
				@XResolution = data
      when "011b"
				@YResolution = data
      when "011c"
				@PlanarConfiguration = data
      when "011d"
				@PageName = data
      when "011e"
				@XPosition = data
      when "011f"
				@YPosition = data
      when "0120"
				@FreeOffsets = data
      when "0121"
				@FreeByteCounts = data
      when "0122"
				@GrayResponseUnit = data
      when "0123"
				@GrayResponseCurve = data
      when "0124"
				@T4Options = data
      when "0125"
				@T6Options = data
      when "0128"
				@ResolutionUnit = data
      when "0129"
				@PageNumber = data
      when "012c"
				@ColorResponseUnit = data
      when "012d"
				@TransferFunction = data
      when "0131"
				@Software = data
      when "0132"
				@ModifyDate = data
      when "013b"
				@Artist = data
      when "013c"
				@HostComputer = data
      when "013d"
				@Predictor = data
      when "013e"
				@WhitePoint = data
      when "013f"
				@PrimaryChromaticities = data
      when "0140"
				@ColorMap = data
      when "0141"
				@HalftoneHints = data
      when "0142"
				@TileWidth = data
      when "0143"
				@TileLength = data
      when "0144"
				@TileOffsets = data
      when "0145"
				@TileByteCounts = data
      when "0146"
				@BadFaxLines = data
      when "0147"
				@CleanFaxData = data
      when "0148"
				@ConsecutiveBadFaxLines = data
      when "014a"
				@SubIFD = data
      when "014c"
				@InkSet = data
      when "014d"
				@InkNames = data
      when "014e"
				@NumberofInks = data
      when "0150"
				@DotRange = data
      when "0151"
				@TargetPrinter = data
      when "0152"
				@ExtraSamples = data
      when "0153"
				@SampleFormat = data
      when "0154"
				@SMinSampleValue = data
      when "0155"
				@SMaxSampleValue = data
      when "0156"
				@TransferRange = data
      when "0157"
				@ClipPath = data
      when "0158"
				@XClipPathUnits = data
      when "0159"
				@YClipPathUnits = data
      when "015a"
				@Indexed = data
      when "015b"
				@JPEGTables = data
      when "015f"
				@OPIProxy = data
      when "0190"
				@GlobalParametersIFD = data
      when "0191"
				@ProfileType = data
      when "0192"
				@FaxProfile = data
      when "0193"
				@CodingMethods = data
      when "0194"
				@VersionYear = data
      when "0195"
				@ModeNumber = data
      when "01b1"
				@Decode = data
      when "01b2"
				@DefaultImageColor = data
      when "01b3"
				@T82Options = data
      when "01b5"
				@JPEGTables = data
      when "0200"
				@JPEGProc = data
      when "0201"
				@ThumbnailOffset = data
      when "0202"
				@ThumbnailLength = data
      when "0203"
				@JPEGRestartInterval = data
      when "0205"
				@JPEGLosslessPredictors = data
      when "0206"
				@JPEGPointTransforms = data
      when "0207"
				@JPEGQTables = data
      when "0208"
				@JPEGDCTables = data
      when "0209"
				@JPEGACTables = data
      when "0211"
				@YCbCrCoefficients = data
      when "0212"
				@YCbCrSubSampling = data
      when "0213"
				@YCbCrPositioning = data
      when "0214"
				@ReferenceBlackWhite = data
      when "022f"
				@StripRowCounts = data
      when "02bc"
				@ApplicationNotes = data
      when "03e7"
				@USPTOMiscellaneous = data
      when "1000"
				@RelatedImageFileFormat = data
      when "1001"
				@RelatedImageWidth = data
      when "1002"
				@RelatedImageHeight = data
      when "4746"
				@Rating = data
      when "4747"
				@XP_DIP_XML = data
      when "4748"
				@StitchInfo = data
      when "4749"
				@RatingPercent = data
      when "800d"
				@ImageID = data
      when "80a3"
				@WangTag1 = data
      when "80a4"
				@WangAnnotation = data
      when "80a5"
				@WangTag3 = data
      when "80a6"
				@WangTag4 = data
      when "80e3"
				@Matteing = data
      when "80e4"
				@DataType = data
      when "80e5"
				@ImageDepth = data
      when "80e6"
				@TileDepth = data
      when "827d"
				@Model2 = data
      when "828d"
				@CFARepeatPatternDim = data
      when "828e"
				@CFAPattern2 = data
      when "828f"
				@BatteryLevel = data
      when "8290"
				@KodakIFD = data
      when "8298"
				@Copyright = data
      when "829a"
				@ExposureTime = data
      when "829d"
				@FNumber = data
      when "82a5"
				@MDFileTag = data
      when "82a6"
				@MDScalePixel = data
      when "82a7"
				@MDColorTable = data
      when "82a8"
				@MDLabName = data
      when "82a9"
				@MDSampleInfo = data
      when "82aa"
				@MDPrepDate = data
      when "82ab"
				@MDPrepTime = data
      when "82ac"
				@MDFileUnits = data
      when "830e"
				@PixelScale = data
      when "8335"
				@AdventScale = data
      when "8336"
				@AdventRevision = data
      when "835c"
				@UIC1Tag = data
      when "835d"
				@UIC2Tag = data
      when "835e"
				@UIC3Tag = data
      when "835f"
				@UIC4Tag = data
      when "83bb"
				@IPTC-NAA = data
      when "847e"
				@IntergraphPacketData = data
      when "847f"
				@IntergraphFlagRegisters = data
      when "8480"
				@IntergraphMatrix = data
      when "8481"
				@INGRReserved = data
      when "8482"
				@ModelTiePoint = data
      when "84e0"
				@Site = data
      when "84e1"
				@ColorSequence = data
      when "84e2"
				@IT8Header = data
      when "84e3"
				@RasterPadding = data
      when "84e4"
				@BitsPerRunLength = data
      when "84e5"
				@BitsPerExtendedRunLength = data
      when "84e6"
				@ColorTable = data
      when "84e7"
				@ImageColorIndicator = data
      when "84e8"
				@BackgroundColorIndicator = data
      when "84e9"
				@ImageColorValue = data
      when "84ea"
				@BackgroundColorValue = data
      when "84eb"
				@PixelIntensityRange = data
      when "84ec"
				@TransparencyIndicator = data
      when "84ed"
				@ColorCharacterization = data
      when "84ee"
				@HCUsage = data
      when "84ef"
				@TrapIndicator = data
      when "84f0"
				@CMYKEquivalent = data
      when "8546"
				@SEMInfo = data
      when "8568"
				@AFCP_IPTC = data
      when "85b8"
				@PixelMagicJBIGOptions = data
      when "85d8"
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
      when "877f"
				@TIFF_FXExtensions = data
      when "8780"
				@MultiProfiles = data
      when "8781"
				@SharedData = data
      when "8782"
				@T88Options = data
      when "87ac"
				@ImageLayer = data
      when "87af"
				@GeoTiffDirectory = data
      when "87b0"
				@GeoTiffDoubleParams = data
      when "87b1"
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
      when "882a"
				@TimeZoneOffset = data
      when "882b"
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
      when "885c"
				@FaxRecvParams = data
      when "885d"
				@FaxSubAddress = data
      when "885e"
				@FaxRecvTime = data
      when "888a"
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
      when "920a"
				@FocalLength = data
      when "920b"
				@FlashEnergy = data
      when "920c"
				@SpatialFrequencyResponse = data
      when "920d"
				@Noise = data
      when "920e"
				@FocalPlaneXResolution = data
      when "920f"
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
      when "923a"
				@CIP3DataFile = data
      when "923b"
				@CIP3Sheet = data
      when "923c"
				@CIP3Side = data
      when "923f"
				@StoNits = data
      when "927c"
				@MakerNoteVENDOR = data # VENDOR can be Apple, Nikon, Canon, etc
      when "9286"
				@UserComment = data
      when "9290"
				@SubSecTime = data
      when "9291"
				@SubSecTimeOriginal = data
      when "9292"
				@SubSecTimeDigitized = data
      when "932f"
				@MSDocumentText = data
      when "9330"
				@MSPropertySetStorage = data
      when "9331"
				@MSDocumentTextPosition = data
      when "935c"
				@ImageSourceData = data
      when "9c9b"
				@XPTitle = data
      when "9c9c"
				@XPComment = data
      when "9c9d"
				@XPAuthor = data
      when "9c9e"
				@XPKeywords = data
      when "9c9f"
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
      when "A20b"
				@FlashEnergy = data
      when "A20c"
				@SpatialFrequencyResponse = data
      when "A20d"
				@Noise = data
      when "A20e"
				@FocalPlaneXResolution = data
      when "A20f"
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
      when "A40a"
				@Sharpness = data
      when "A40b"
				@DeviceSettingDescription = data
      when "A40c"
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
      when "Afc0"
				@ExpandSoftware = data
      when "Afc1"
				@ExpandLens = data
      when "Afc2"
				@ExpandFilm = data
      when "Afc3"
				@ExpandFilterLens = data
      when "Afc4"
				@ExpandScanner = data
      when "Afc5"
				@ExpandFlashLamp = data
      when "Bc01"
				@PixelFormat = data
      when "Bc02"
				@Transformation = data
      when "Bc03"
				@Uncompressed = data
      when "Bc04"
				@ImageType = data
      when "Bc80"
				@ImageWidth = data
      when "Bc81"
				@ImageHeight = data
      when "Bc82"
				@WidthResolution = data
      when "Bc83"
				@HeightResolution = data
      when "Bcc0"
				@ImageOffset = data
      when "Bcc1"
				@ImageByteCount = data
      when "Bcc2"
				@AlphaOffset = data
      when "Bcc3"
				@AlphaByteCount = data
      when "Bcc4"
				@ImageDataDiscard = data
      when "Bcc5"
				@AlphaDataDiscard = data
      when "C427"
				@OceScanjobDesc = data
      when "C428"
				@OceApplicationSelector = data
      when "C429"
				@OceIDNumber = data
      when "C42a"
				@OceImageLogic = data
      when "C44f"
				@Annotations = data
      when "C4a5"
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
      when "C61a"
				@BlackLevel = data
      when "C61b"
				@BlackLevelDeltaH = data
      when "C61c"
				@BlackLevelDeltaV = data
      when "C61d"
				@WhiteLevel = data
      when "C61e"
				@DefaultScale = data
      when "C61f"
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
      when "C62a"
				@BaselineExposure = data
      when "C62b"
				@BaselineNoise = data
      when "C62c"
				@BaselineSharpness = data
      when "C62d"
				@BayerGreenSplit = data
      when "C62e"
				@LinearResponseLimit = data
      when "C62f"
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
      when "C65a"
				@CalibrationIlluminant1 = data
      when "C65b"
				@CalibrationIlluminant2 = data
      when "C65c"
				@BestQualityScale = data
      when "C65d"
				@RawDataUniqueID = data
      when "C660"
				@AliasLayerMetadata = data
      when "C68b"
				@OriginalRawFileName = data
      when "C68c"
				@OriginalRawFileData = data
      when "C68d"
				@ActiveArea = data
      when "C68e"
				@MaskedAreas = data
      when "C68f"
				@AsShotICCProfile = data
      when "C690"
				@AsShotPreProfileMatrix = data
      when "C691"
				@CurrentICCProfile = data
      when "C692"
				@CurrentPreProfileMatrix = data
      when "C6bf"
				@ColorimetricReference = data
      when "C6d2"
				@PanasonicTitle = data
      when "C6d3"
				@PanasonicTitle2 = data
      when "C6f3"
				@CameraCalibrationSig = data
      when "C6f4"
				@ProfileCalibrationSig = data
      when "C6f5"
				@ProfileIFD = data
      when "C6f6"
				@AsShotProfileName = data
      when "C6f7"
				@NoiseReductionApplied = data
      when "C6f8"
				@ProfileName = data
      when "C6f9"
				@ProfileHueSatMapDims = data
      when "C6fa"
				@ProfileHueSatMapData1 = data
      when "C6fb"
				@ProfileHueSatMapData2 = data
      when "C6fc"
				@ProfileToneCurve = data
      when "C6fd"
				@ProfileEmbedPolicy = data
      when "C6fe"
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
      when "C71a"
				@PreviewColorSpace = data
      when "C71b"
				@PreviewDateTime = data
      when "C71c"
				@RawImageDigest = data
      when "C71d"
				@OriginalRawFileDigest = data
      when "C71e"
				@SubTileBlockSize = data
      when "C71f"
				@RowInterleaveFactor = data
      when "C725"
				@ProfileLookTableDims = data
      when "C726"
				@ProfileLookTableData = data
      when "C740"
				@OpcodeList1 = data
      when "C741"
				@OpcodeList2 = data
      when "C74e"
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
      when "C7a1"
				@CameraLabel = data
      when "C7a3"
				@ProfileHueSatMapEncoding = data
      when "C7a4"
				@ProfileLookTableEncoding = data
      when "C7a5"
				@BaselineExposureOffset = data
      when "C7a6"
				@DefaultBlackRender = data
      when "C7a7"
				@NewRawImageDigest = data
      when "C7a8"
				@RawToPreviewGain = data
      when "C7b5"
				@DefaultUserCrop = data
      when "Ea1c"
				@Padding = data
      when "Ea1d"
				@OffsetSchema = data
      when "Fde8"
				@OwnerName = data
      when "Fde9"
				@SerialNumber = data
      when "Fdea"
				@Lens = data
      when "Fe00"
				@KDC_IFD = data
      when "Fe4c"
				@RawFile = data
      when "Fe4d"
				@Converter = data
      when "Fe4e"
				@WhiteBalance = data
      when "Fe51"
				@Exposure = data
      when "Fe52"
				@Shadows = data
      when "Fe53"
				@Brightness = data
      when "Fe54"
				@Contrast = data
      when "Fe55"
				@Saturation = data
      when "Fe56"
				@Sharpness = data
      when "Fe57"
				@Smoothness = data
      when "FE58"
        @MoireFilter = data
      end
    }




  end
end