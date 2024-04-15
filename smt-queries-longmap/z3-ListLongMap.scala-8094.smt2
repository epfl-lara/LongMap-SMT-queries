; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99424 () Bool)

(assert start!99424)

(declare-fun b_free!25009 () Bool)

(declare-fun b_next!25009 () Bool)

(assert (=> start!99424 (= b_free!25009 (not b_next!25009))))

(declare-fun tp!87740 () Bool)

(declare-fun b_and!40863 () Bool)

(assert (=> start!99424 (= tp!87740 b_and!40863)))

(declare-fun b!1174099 () Bool)

(declare-fun res!779704 () Bool)

(declare-fun e!667362 () Bool)

(assert (=> b!1174099 (=> (not res!779704) (not e!667362))))

(declare-datatypes ((array!75818 0))(
  ( (array!75819 (arr!36559 (Array (_ BitVec 32) (_ BitVec 64))) (size!37097 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75818)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44513 0))(
  ( (V!44514 (val!14826 Int)) )
))
(declare-datatypes ((ValueCell!14060 0))(
  ( (ValueCellFull!14060 (v!17463 V!44513)) (EmptyCell!14060) )
))
(declare-datatypes ((array!75820 0))(
  ( (array!75821 (arr!36560 (Array (_ BitVec 32) ValueCell!14060)) (size!37098 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75820)

(assert (=> b!1174099 (= res!779704 (and (= (size!37098 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37097 _keys!1208) (size!37098 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174100 () Bool)

(declare-fun res!779698 () Bool)

(assert (=> b!1174100 (=> (not res!779698) (not e!667362))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1174100 (= res!779698 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37097 _keys!1208))))))

(declare-fun b!1174101 () Bool)

(declare-fun e!667364 () Bool)

(declare-fun e!667371 () Bool)

(assert (=> b!1174101 (= e!667364 (not e!667371))))

(declare-fun res!779697 () Bool)

(assert (=> b!1174101 (=> res!779697 e!667371)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1174101 (= res!779697 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174101 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38556 0))(
  ( (Unit!38557) )
))
(declare-fun lt!529268 () Unit!38556)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75818 (_ BitVec 64) (_ BitVec 32)) Unit!38556)

(assert (=> b!1174101 (= lt!529268 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174102 () Bool)

(declare-fun res!779710 () Bool)

(assert (=> b!1174102 (=> (not res!779710) (not e!667362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174102 (= res!779710 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46136 () Bool)

(declare-fun mapRes!46136 () Bool)

(declare-fun tp!87741 () Bool)

(declare-fun e!667361 () Bool)

(assert (=> mapNonEmpty!46136 (= mapRes!46136 (and tp!87741 e!667361))))

(declare-fun mapKey!46136 () (_ BitVec 32))

(declare-fun mapValue!46136 () ValueCell!14060)

(declare-fun mapRest!46136 () (Array (_ BitVec 32) ValueCell!14060))

(assert (=> mapNonEmpty!46136 (= (arr!36560 _values!996) (store mapRest!46136 mapKey!46136 mapValue!46136))))

(declare-fun b!1174103 () Bool)

(declare-fun e!667363 () Bool)

(declare-fun tp_is_empty!29539 () Bool)

(assert (=> b!1174103 (= e!667363 tp_is_empty!29539)))

(declare-fun b!1174104 () Bool)

(declare-fun res!779703 () Bool)

(assert (=> b!1174104 (=> (not res!779703) (not e!667362))))

(declare-datatypes ((List!25762 0))(
  ( (Nil!25759) (Cons!25758 (h!26967 (_ BitVec 64)) (t!37754 List!25762)) )
))
(declare-fun arrayNoDuplicates!0 (array!75818 (_ BitVec 32) List!25762) Bool)

(assert (=> b!1174104 (= res!779703 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25759))))

(declare-fun b!1174105 () Bool)

(declare-fun e!667366 () Bool)

(assert (=> b!1174105 (= e!667366 (and e!667363 mapRes!46136))))

(declare-fun condMapEmpty!46136 () Bool)

(declare-fun mapDefault!46136 () ValueCell!14060)

(assert (=> b!1174105 (= condMapEmpty!46136 (= (arr!36560 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14060)) mapDefault!46136)))))

(declare-fun b!1174106 () Bool)

(declare-fun e!667365 () Bool)

(declare-fun e!667367 () Bool)

(assert (=> b!1174106 (= e!667365 e!667367)))

(declare-fun res!779706 () Bool)

(assert (=> b!1174106 (=> res!779706 e!667367)))

(assert (=> b!1174106 (= res!779706 (not (= (select (arr!36559 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1174107 () Bool)

(declare-fun e!667368 () Unit!38556)

(declare-fun Unit!38558 () Unit!38556)

(assert (=> b!1174107 (= e!667368 Unit!38558)))

(declare-fun lt!529274 () Unit!38556)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75818 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38556)

(assert (=> b!1174107 (= lt!529274 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1174107 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529275 () Unit!38556)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75818 (_ BitVec 32) (_ BitVec 32)) Unit!38556)

(assert (=> b!1174107 (= lt!529275 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1174107 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25759)))

(declare-fun lt!529267 () Unit!38556)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75818 (_ BitVec 64) (_ BitVec 32) List!25762) Unit!38556)

(assert (=> b!1174107 (= lt!529267 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25759))))

(assert (=> b!1174107 false))

(declare-fun res!779709 () Bool)

(assert (=> start!99424 (=> (not res!779709) (not e!667362))))

(assert (=> start!99424 (= res!779709 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37097 _keys!1208))))))

(assert (=> start!99424 e!667362))

(assert (=> start!99424 tp_is_empty!29539))

(declare-fun array_inv!28038 (array!75818) Bool)

(assert (=> start!99424 (array_inv!28038 _keys!1208)))

(assert (=> start!99424 true))

(assert (=> start!99424 tp!87740))

(declare-fun array_inv!28039 (array!75820) Bool)

(assert (=> start!99424 (and (array_inv!28039 _values!996) e!667366)))

(declare-fun b!1174108 () Bool)

(declare-fun e!667369 () Bool)

(assert (=> b!1174108 (= e!667369 true)))

(assert (=> b!1174108 (not (= (select (arr!36559 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529269 () Unit!38556)

(assert (=> b!1174108 (= lt!529269 e!667368)))

(declare-fun c!116611 () Bool)

(assert (=> b!1174108 (= c!116611 (= (select (arr!36559 _keys!1208) from!1455) k0!934))))

(assert (=> b!1174108 e!667365))

(declare-fun res!779705 () Bool)

(assert (=> b!1174108 (=> (not res!779705) (not e!667365))))

(declare-datatypes ((tuple2!19048 0))(
  ( (tuple2!19049 (_1!9535 (_ BitVec 64)) (_2!9535 V!44513)) )
))
(declare-datatypes ((List!25763 0))(
  ( (Nil!25760) (Cons!25759 (h!26968 tuple2!19048) (t!37755 List!25763)) )
))
(declare-datatypes ((ListLongMap!17017 0))(
  ( (ListLongMap!17018 (toList!8524 List!25763)) )
))
(declare-fun lt!529276 () ListLongMap!17017)

(declare-fun lt!529270 () ListLongMap!17017)

(declare-fun lt!529271 () V!44513)

(declare-fun +!3833 (ListLongMap!17017 tuple2!19048) ListLongMap!17017)

(declare-fun get!18669 (ValueCell!14060 V!44513) V!44513)

(assert (=> b!1174108 (= res!779705 (= lt!529270 (+!3833 lt!529276 (tuple2!19049 (select (arr!36559 _keys!1208) from!1455) (get!18669 (select (arr!36560 _values!996) from!1455) lt!529271)))))))

(declare-fun b!1174109 () Bool)

(declare-fun res!779696 () Bool)

(assert (=> b!1174109 (=> (not res!779696) (not e!667362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75818 (_ BitVec 32)) Bool)

(assert (=> b!1174109 (= res!779696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174110 () Bool)

(declare-fun Unit!38559 () Unit!38556)

(assert (=> b!1174110 (= e!667368 Unit!38559)))

(declare-fun b!1174111 () Bool)

(assert (=> b!1174111 (= e!667367 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174112 () Bool)

(declare-fun e!667372 () Bool)

(assert (=> b!1174112 (= e!667371 e!667372)))

(declare-fun res!779699 () Bool)

(assert (=> b!1174112 (=> res!779699 e!667372)))

(assert (=> b!1174112 (= res!779699 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44513)

(declare-fun lt!529277 () array!75818)

(declare-fun zeroValue!944 () V!44513)

(declare-fun lt!529265 () array!75820)

(declare-fun getCurrentListMapNoExtraKeys!4997 (array!75818 array!75820 (_ BitVec 32) (_ BitVec 32) V!44513 V!44513 (_ BitVec 32) Int) ListLongMap!17017)

(assert (=> b!1174112 (= lt!529270 (getCurrentListMapNoExtraKeys!4997 lt!529277 lt!529265 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1174112 (= lt!529265 (array!75821 (store (arr!36560 _values!996) i!673 (ValueCellFull!14060 lt!529271)) (size!37098 _values!996)))))

(declare-fun dynLambda!2917 (Int (_ BitVec 64)) V!44513)

(assert (=> b!1174112 (= lt!529271 (dynLambda!2917 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529278 () ListLongMap!17017)

(assert (=> b!1174112 (= lt!529278 (getCurrentListMapNoExtraKeys!4997 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174113 () Bool)

(declare-fun res!779700 () Bool)

(assert (=> b!1174113 (=> (not res!779700) (not e!667362))))

(assert (=> b!1174113 (= res!779700 (= (select (arr!36559 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!46136 () Bool)

(assert (=> mapIsEmpty!46136 mapRes!46136))

(declare-fun b!1174114 () Bool)

(assert (=> b!1174114 (= e!667372 e!667369)))

(declare-fun res!779702 () Bool)

(assert (=> b!1174114 (=> res!779702 e!667369)))

(assert (=> b!1174114 (= res!779702 (not (validKeyInArray!0 (select (arr!36559 _keys!1208) from!1455))))))

(declare-fun lt!529273 () ListLongMap!17017)

(assert (=> b!1174114 (= lt!529273 lt!529276)))

(declare-fun lt!529266 () ListLongMap!17017)

(declare-fun -!1511 (ListLongMap!17017 (_ BitVec 64)) ListLongMap!17017)

(assert (=> b!1174114 (= lt!529276 (-!1511 lt!529266 k0!934))))

(assert (=> b!1174114 (= lt!529273 (getCurrentListMapNoExtraKeys!4997 lt!529277 lt!529265 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174114 (= lt!529266 (getCurrentListMapNoExtraKeys!4997 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529272 () Unit!38556)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!775 (array!75818 array!75820 (_ BitVec 32) (_ BitVec 32) V!44513 V!44513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38556)

(assert (=> b!1174114 (= lt!529272 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!775 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174115 () Bool)

(assert (=> b!1174115 (= e!667362 e!667364)))

(declare-fun res!779707 () Bool)

(assert (=> b!1174115 (=> (not res!779707) (not e!667364))))

(assert (=> b!1174115 (= res!779707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529277 mask!1564))))

(assert (=> b!1174115 (= lt!529277 (array!75819 (store (arr!36559 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37097 _keys!1208)))))

(declare-fun b!1174116 () Bool)

(declare-fun res!779708 () Bool)

(assert (=> b!1174116 (=> (not res!779708) (not e!667362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174116 (= res!779708 (validMask!0 mask!1564))))

(declare-fun b!1174117 () Bool)

(assert (=> b!1174117 (= e!667361 tp_is_empty!29539)))

(declare-fun b!1174118 () Bool)

(declare-fun res!779701 () Bool)

(assert (=> b!1174118 (=> (not res!779701) (not e!667364))))

(assert (=> b!1174118 (= res!779701 (arrayNoDuplicates!0 lt!529277 #b00000000000000000000000000000000 Nil!25759))))

(assert (= (and start!99424 res!779709) b!1174116))

(assert (= (and b!1174116 res!779708) b!1174099))

(assert (= (and b!1174099 res!779704) b!1174109))

(assert (= (and b!1174109 res!779696) b!1174104))

(assert (= (and b!1174104 res!779703) b!1174100))

(assert (= (and b!1174100 res!779698) b!1174102))

(assert (= (and b!1174102 res!779710) b!1174113))

(assert (= (and b!1174113 res!779700) b!1174115))

(assert (= (and b!1174115 res!779707) b!1174118))

(assert (= (and b!1174118 res!779701) b!1174101))

(assert (= (and b!1174101 (not res!779697)) b!1174112))

(assert (= (and b!1174112 (not res!779699)) b!1174114))

(assert (= (and b!1174114 (not res!779702)) b!1174108))

(assert (= (and b!1174108 res!779705) b!1174106))

(assert (= (and b!1174106 (not res!779706)) b!1174111))

(assert (= (and b!1174108 c!116611) b!1174107))

(assert (= (and b!1174108 (not c!116611)) b!1174110))

(assert (= (and b!1174105 condMapEmpty!46136) mapIsEmpty!46136))

(assert (= (and b!1174105 (not condMapEmpty!46136)) mapNonEmpty!46136))

(get-info :version)

(assert (= (and mapNonEmpty!46136 ((_ is ValueCellFull!14060) mapValue!46136)) b!1174117))

(assert (= (and b!1174105 ((_ is ValueCellFull!14060) mapDefault!46136)) b!1174103))

(assert (= start!99424 b!1174105))

(declare-fun b_lambda!20135 () Bool)

(assert (=> (not b_lambda!20135) (not b!1174112)))

(declare-fun t!37753 () Bool)

(declare-fun tb!9813 () Bool)

(assert (=> (and start!99424 (= defaultEntry!1004 defaultEntry!1004) t!37753) tb!9813))

(declare-fun result!20201 () Bool)

(assert (=> tb!9813 (= result!20201 tp_is_empty!29539)))

(assert (=> b!1174112 t!37753))

(declare-fun b_and!40865 () Bool)

(assert (= b_and!40863 (and (=> t!37753 result!20201) b_and!40865)))

(declare-fun m!1081481 () Bool)

(assert (=> mapNonEmpty!46136 m!1081481))

(declare-fun m!1081483 () Bool)

(assert (=> b!1174109 m!1081483))

(declare-fun m!1081485 () Bool)

(assert (=> b!1174112 m!1081485))

(declare-fun m!1081487 () Bool)

(assert (=> b!1174112 m!1081487))

(declare-fun m!1081489 () Bool)

(assert (=> b!1174112 m!1081489))

(declare-fun m!1081491 () Bool)

(assert (=> b!1174112 m!1081491))

(declare-fun m!1081493 () Bool)

(assert (=> b!1174106 m!1081493))

(declare-fun m!1081495 () Bool)

(assert (=> b!1174107 m!1081495))

(declare-fun m!1081497 () Bool)

(assert (=> b!1174107 m!1081497))

(declare-fun m!1081499 () Bool)

(assert (=> b!1174107 m!1081499))

(declare-fun m!1081501 () Bool)

(assert (=> b!1174107 m!1081501))

(declare-fun m!1081503 () Bool)

(assert (=> b!1174107 m!1081503))

(declare-fun m!1081505 () Bool)

(assert (=> start!99424 m!1081505))

(declare-fun m!1081507 () Bool)

(assert (=> start!99424 m!1081507))

(declare-fun m!1081509 () Bool)

(assert (=> b!1174118 m!1081509))

(declare-fun m!1081511 () Bool)

(assert (=> b!1174111 m!1081511))

(declare-fun m!1081513 () Bool)

(assert (=> b!1174104 m!1081513))

(declare-fun m!1081515 () Bool)

(assert (=> b!1174102 m!1081515))

(declare-fun m!1081517 () Bool)

(assert (=> b!1174116 m!1081517))

(declare-fun m!1081519 () Bool)

(assert (=> b!1174101 m!1081519))

(declare-fun m!1081521 () Bool)

(assert (=> b!1174101 m!1081521))

(declare-fun m!1081523 () Bool)

(assert (=> b!1174114 m!1081523))

(declare-fun m!1081525 () Bool)

(assert (=> b!1174114 m!1081525))

(declare-fun m!1081527 () Bool)

(assert (=> b!1174114 m!1081527))

(declare-fun m!1081529 () Bool)

(assert (=> b!1174114 m!1081529))

(assert (=> b!1174114 m!1081493))

(declare-fun m!1081531 () Bool)

(assert (=> b!1174114 m!1081531))

(assert (=> b!1174114 m!1081493))

(declare-fun m!1081533 () Bool)

(assert (=> b!1174113 m!1081533))

(declare-fun m!1081535 () Bool)

(assert (=> b!1174115 m!1081535))

(declare-fun m!1081537 () Bool)

(assert (=> b!1174115 m!1081537))

(assert (=> b!1174108 m!1081493))

(declare-fun m!1081539 () Bool)

(assert (=> b!1174108 m!1081539))

(assert (=> b!1174108 m!1081539))

(declare-fun m!1081541 () Bool)

(assert (=> b!1174108 m!1081541))

(declare-fun m!1081543 () Bool)

(assert (=> b!1174108 m!1081543))

(check-sat (not b!1174107) (not b!1174104) tp_is_empty!29539 (not b!1174109) (not b!1174101) (not b_next!25009) (not b!1174108) (not b!1174115) (not b!1174102) b_and!40865 (not b!1174116) (not b!1174118) (not mapNonEmpty!46136) (not b!1174112) (not b!1174114) (not b!1174111) (not b_lambda!20135) (not start!99424))
(check-sat b_and!40865 (not b_next!25009))
