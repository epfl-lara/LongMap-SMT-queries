; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99690 () Bool)

(assert start!99690)

(declare-fun b_free!25033 () Bool)

(declare-fun b_next!25033 () Bool)

(assert (=> start!99690 (= b_free!25033 (not b_next!25033))))

(declare-fun tp!87812 () Bool)

(declare-fun b_and!40935 () Bool)

(assert (=> start!99690 (= tp!87812 b_and!40935)))

(declare-datatypes ((array!75991 0))(
  ( (array!75992 (arr!36639 (Array (_ BitVec 32) (_ BitVec 64))) (size!37176 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75991)

(declare-fun b!1176256 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!668710 () Bool)

(declare-fun arrayContainsKey!0 (array!75991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176256 (= e!668710 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun res!780817 () Bool)

(declare-fun e!668703 () Bool)

(assert (=> start!99690 (=> (not res!780817) (not e!668703))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99690 (= res!780817 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37176 _keys!1208))))))

(assert (=> start!99690 e!668703))

(declare-fun tp_is_empty!29563 () Bool)

(assert (=> start!99690 tp_is_empty!29563))

(declare-fun array_inv!28064 (array!75991) Bool)

(assert (=> start!99690 (array_inv!28064 _keys!1208)))

(assert (=> start!99690 true))

(assert (=> start!99690 tp!87812))

(declare-datatypes ((V!44545 0))(
  ( (V!44546 (val!14838 Int)) )
))
(declare-datatypes ((ValueCell!14072 0))(
  ( (ValueCellFull!14072 (v!17472 V!44545)) (EmptyCell!14072) )
))
(declare-datatypes ((array!75993 0))(
  ( (array!75994 (arr!36640 (Array (_ BitVec 32) ValueCell!14072)) (size!37177 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75993)

(declare-fun e!668707 () Bool)

(declare-fun array_inv!28065 (array!75993) Bool)

(assert (=> start!99690 (and (array_inv!28065 _values!996) e!668707)))

(declare-fun b!1176257 () Bool)

(declare-fun res!780818 () Bool)

(assert (=> b!1176257 (=> (not res!780818) (not e!668703))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176257 (= res!780818 (validMask!0 mask!1564))))

(declare-fun b!1176258 () Bool)

(declare-fun e!668711 () Bool)

(assert (=> b!1176258 (= e!668711 e!668710)))

(declare-fun res!780824 () Bool)

(assert (=> b!1176258 (=> res!780824 e!668710)))

(assert (=> b!1176258 (= res!780824 (not (= (select (arr!36639 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1176259 () Bool)

(declare-fun e!668705 () Bool)

(assert (=> b!1176259 (= e!668703 e!668705)))

(declare-fun res!780815 () Bool)

(assert (=> b!1176259 (=> (not res!780815) (not e!668705))))

(declare-fun lt!530453 () array!75991)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75991 (_ BitVec 32)) Bool)

(assert (=> b!1176259 (= res!780815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530453 mask!1564))))

(assert (=> b!1176259 (= lt!530453 (array!75992 (store (arr!36639 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37176 _keys!1208)))))

(declare-fun mapIsEmpty!46172 () Bool)

(declare-fun mapRes!46172 () Bool)

(assert (=> mapIsEmpty!46172 mapRes!46172))

(declare-fun b!1176260 () Bool)

(declare-fun e!668713 () Bool)

(declare-fun e!668712 () Bool)

(assert (=> b!1176260 (= e!668713 e!668712)))

(declare-fun res!780811 () Bool)

(assert (=> b!1176260 (=> res!780811 e!668712)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176260 (= res!780811 (not (validKeyInArray!0 (select (arr!36639 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19014 0))(
  ( (tuple2!19015 (_1!9518 (_ BitVec 64)) (_2!9518 V!44545)) )
))
(declare-datatypes ((List!25748 0))(
  ( (Nil!25745) (Cons!25744 (h!26962 tuple2!19014) (t!37765 List!25748)) )
))
(declare-datatypes ((ListLongMap!16991 0))(
  ( (ListLongMap!16992 (toList!8511 List!25748)) )
))
(declare-fun lt!530456 () ListLongMap!16991)

(declare-fun lt!530448 () ListLongMap!16991)

(assert (=> b!1176260 (= lt!530456 lt!530448)))

(declare-fun lt!530458 () ListLongMap!16991)

(declare-fun -!1553 (ListLongMap!16991 (_ BitVec 64)) ListLongMap!16991)

(assert (=> b!1176260 (= lt!530448 (-!1553 lt!530458 k0!934))))

(declare-fun zeroValue!944 () V!44545)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530457 () array!75993)

(declare-fun minValue!944 () V!44545)

(declare-fun getCurrentListMapNoExtraKeys!4993 (array!75991 array!75993 (_ BitVec 32) (_ BitVec 32) V!44545 V!44545 (_ BitVec 32) Int) ListLongMap!16991)

(assert (=> b!1176260 (= lt!530456 (getCurrentListMapNoExtraKeys!4993 lt!530453 lt!530457 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1176260 (= lt!530458 (getCurrentListMapNoExtraKeys!4993 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38765 0))(
  ( (Unit!38766) )
))
(declare-fun lt!530451 () Unit!38765)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!778 (array!75991 array!75993 (_ BitVec 32) (_ BitVec 32) V!44545 V!44545 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38765)

(assert (=> b!1176260 (= lt!530451 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!778 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176261 () Bool)

(declare-fun res!780814 () Bool)

(assert (=> b!1176261 (=> (not res!780814) (not e!668703))))

(assert (=> b!1176261 (= res!780814 (= (select (arr!36639 _keys!1208) i!673) k0!934))))

(declare-fun b!1176262 () Bool)

(declare-fun e!668708 () Bool)

(assert (=> b!1176262 (= e!668707 (and e!668708 mapRes!46172))))

(declare-fun condMapEmpty!46172 () Bool)

(declare-fun mapDefault!46172 () ValueCell!14072)

(assert (=> b!1176262 (= condMapEmpty!46172 (= (arr!36640 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14072)) mapDefault!46172)))))

(declare-fun b!1176263 () Bool)

(assert (=> b!1176263 (= e!668708 tp_is_empty!29563)))

(declare-fun b!1176264 () Bool)

(declare-fun res!780821 () Bool)

(assert (=> b!1176264 (=> (not res!780821) (not e!668703))))

(assert (=> b!1176264 (= res!780821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176265 () Bool)

(declare-fun e!668709 () Bool)

(assert (=> b!1176265 (= e!668705 (not e!668709))))

(declare-fun res!780822 () Bool)

(assert (=> b!1176265 (=> res!780822 e!668709)))

(assert (=> b!1176265 (= res!780822 (bvsgt from!1455 i!673))))

(assert (=> b!1176265 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530455 () Unit!38765)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75991 (_ BitVec 64) (_ BitVec 32)) Unit!38765)

(assert (=> b!1176265 (= lt!530455 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176266 () Bool)

(declare-fun res!780820 () Bool)

(assert (=> b!1176266 (=> (not res!780820) (not e!668705))))

(declare-datatypes ((List!25749 0))(
  ( (Nil!25746) (Cons!25745 (h!26963 (_ BitVec 64)) (t!37766 List!25749)) )
))
(declare-fun arrayNoDuplicates!0 (array!75991 (_ BitVec 32) List!25749) Bool)

(assert (=> b!1176266 (= res!780820 (arrayNoDuplicates!0 lt!530453 #b00000000000000000000000000000000 Nil!25746))))

(declare-fun b!1176267 () Bool)

(declare-fun e!668706 () Unit!38765)

(declare-fun Unit!38767 () Unit!38765)

(assert (=> b!1176267 (= e!668706 Unit!38767)))

(declare-fun lt!530446 () Unit!38765)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75991 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38765)

(assert (=> b!1176267 (= lt!530446 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1176267 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530445 () Unit!38765)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75991 (_ BitVec 32) (_ BitVec 32)) Unit!38765)

(assert (=> b!1176267 (= lt!530445 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1176267 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25746)))

(declare-fun lt!530447 () Unit!38765)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75991 (_ BitVec 64) (_ BitVec 32) List!25749) Unit!38765)

(assert (=> b!1176267 (= lt!530447 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25746))))

(assert (=> b!1176267 false))

(declare-fun b!1176268 () Bool)

(declare-fun res!780813 () Bool)

(assert (=> b!1176268 (=> (not res!780813) (not e!668703))))

(assert (=> b!1176268 (= res!780813 (and (= (size!37177 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37176 _keys!1208) (size!37177 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176269 () Bool)

(declare-fun res!780816 () Bool)

(assert (=> b!1176269 (=> (not res!780816) (not e!668703))))

(assert (=> b!1176269 (= res!780816 (validKeyInArray!0 k0!934))))

(declare-fun b!1176270 () Bool)

(declare-fun e!668714 () Bool)

(assert (=> b!1176270 (= e!668714 tp_is_empty!29563)))

(declare-fun b!1176271 () Bool)

(declare-fun res!780819 () Bool)

(assert (=> b!1176271 (=> (not res!780819) (not e!668703))))

(assert (=> b!1176271 (= res!780819 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37176 _keys!1208))))))

(declare-fun b!1176272 () Bool)

(assert (=> b!1176272 (= e!668709 e!668713)))

(declare-fun res!780823 () Bool)

(assert (=> b!1176272 (=> res!780823 e!668713)))

(assert (=> b!1176272 (= res!780823 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!530450 () ListLongMap!16991)

(assert (=> b!1176272 (= lt!530450 (getCurrentListMapNoExtraKeys!4993 lt!530453 lt!530457 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!530449 () V!44545)

(assert (=> b!1176272 (= lt!530457 (array!75994 (store (arr!36640 _values!996) i!673 (ValueCellFull!14072 lt!530449)) (size!37177 _values!996)))))

(declare-fun dynLambda!2971 (Int (_ BitVec 64)) V!44545)

(assert (=> b!1176272 (= lt!530449 (dynLambda!2971 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530454 () ListLongMap!16991)

(assert (=> b!1176272 (= lt!530454 (getCurrentListMapNoExtraKeys!4993 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176273 () Bool)

(assert (=> b!1176273 (= e!668712 true)))

(assert (=> b!1176273 (not (= (select (arr!36639 _keys!1208) from!1455) k0!934))))

(declare-fun lt!530452 () Unit!38765)

(assert (=> b!1176273 (= lt!530452 e!668706)))

(declare-fun c!117071 () Bool)

(assert (=> b!1176273 (= c!117071 (= (select (arr!36639 _keys!1208) from!1455) k0!934))))

(assert (=> b!1176273 e!668711))

(declare-fun res!780810 () Bool)

(assert (=> b!1176273 (=> (not res!780810) (not e!668711))))

(declare-fun +!3843 (ListLongMap!16991 tuple2!19014) ListLongMap!16991)

(declare-fun get!18739 (ValueCell!14072 V!44545) V!44545)

(assert (=> b!1176273 (= res!780810 (= lt!530450 (+!3843 lt!530448 (tuple2!19015 (select (arr!36639 _keys!1208) from!1455) (get!18739 (select (arr!36640 _values!996) from!1455) lt!530449)))))))

(declare-fun mapNonEmpty!46172 () Bool)

(declare-fun tp!87813 () Bool)

(assert (=> mapNonEmpty!46172 (= mapRes!46172 (and tp!87813 e!668714))))

(declare-fun mapValue!46172 () ValueCell!14072)

(declare-fun mapRest!46172 () (Array (_ BitVec 32) ValueCell!14072))

(declare-fun mapKey!46172 () (_ BitVec 32))

(assert (=> mapNonEmpty!46172 (= (arr!36640 _values!996) (store mapRest!46172 mapKey!46172 mapValue!46172))))

(declare-fun b!1176274 () Bool)

(declare-fun Unit!38768 () Unit!38765)

(assert (=> b!1176274 (= e!668706 Unit!38768)))

(declare-fun b!1176275 () Bool)

(declare-fun res!780812 () Bool)

(assert (=> b!1176275 (=> (not res!780812) (not e!668703))))

(assert (=> b!1176275 (= res!780812 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25746))))

(assert (= (and start!99690 res!780817) b!1176257))

(assert (= (and b!1176257 res!780818) b!1176268))

(assert (= (and b!1176268 res!780813) b!1176264))

(assert (= (and b!1176264 res!780821) b!1176275))

(assert (= (and b!1176275 res!780812) b!1176271))

(assert (= (and b!1176271 res!780819) b!1176269))

(assert (= (and b!1176269 res!780816) b!1176261))

(assert (= (and b!1176261 res!780814) b!1176259))

(assert (= (and b!1176259 res!780815) b!1176266))

(assert (= (and b!1176266 res!780820) b!1176265))

(assert (= (and b!1176265 (not res!780822)) b!1176272))

(assert (= (and b!1176272 (not res!780823)) b!1176260))

(assert (= (and b!1176260 (not res!780811)) b!1176273))

(assert (= (and b!1176273 res!780810) b!1176258))

(assert (= (and b!1176258 (not res!780824)) b!1176256))

(assert (= (and b!1176273 c!117071) b!1176267))

(assert (= (and b!1176273 (not c!117071)) b!1176274))

(assert (= (and b!1176262 condMapEmpty!46172) mapIsEmpty!46172))

(assert (= (and b!1176262 (not condMapEmpty!46172)) mapNonEmpty!46172))

(get-info :version)

(assert (= (and mapNonEmpty!46172 ((_ is ValueCellFull!14072) mapValue!46172)) b!1176270))

(assert (= (and b!1176262 ((_ is ValueCellFull!14072) mapDefault!46172)) b!1176263))

(assert (= start!99690 b!1176262))

(declare-fun b_lambda!20171 () Bool)

(assert (=> (not b_lambda!20171) (not b!1176272)))

(declare-fun t!37764 () Bool)

(declare-fun tb!9837 () Bool)

(assert (=> (and start!99690 (= defaultEntry!1004 defaultEntry!1004) t!37764) tb!9837))

(declare-fun result!20249 () Bool)

(assert (=> tb!9837 (= result!20249 tp_is_empty!29563)))

(assert (=> b!1176272 t!37764))

(declare-fun b_and!40937 () Bool)

(assert (= b_and!40935 (and (=> t!37764 result!20249) b_and!40937)))

(declare-fun m!1084431 () Bool)

(assert (=> mapNonEmpty!46172 m!1084431))

(declare-fun m!1084433 () Bool)

(assert (=> b!1176261 m!1084433))

(declare-fun m!1084435 () Bool)

(assert (=> b!1176272 m!1084435))

(declare-fun m!1084437 () Bool)

(assert (=> b!1176272 m!1084437))

(declare-fun m!1084439 () Bool)

(assert (=> b!1176272 m!1084439))

(declare-fun m!1084441 () Bool)

(assert (=> b!1176272 m!1084441))

(declare-fun m!1084443 () Bool)

(assert (=> b!1176260 m!1084443))

(declare-fun m!1084445 () Bool)

(assert (=> b!1176260 m!1084445))

(declare-fun m!1084447 () Bool)

(assert (=> b!1176260 m!1084447))

(declare-fun m!1084449 () Bool)

(assert (=> b!1176260 m!1084449))

(declare-fun m!1084451 () Bool)

(assert (=> b!1176260 m!1084451))

(declare-fun m!1084453 () Bool)

(assert (=> b!1176260 m!1084453))

(assert (=> b!1176260 m!1084451))

(declare-fun m!1084455 () Bool)

(assert (=> b!1176269 m!1084455))

(assert (=> b!1176258 m!1084451))

(declare-fun m!1084457 () Bool)

(assert (=> b!1176259 m!1084457))

(declare-fun m!1084459 () Bool)

(assert (=> b!1176259 m!1084459))

(assert (=> b!1176273 m!1084451))

(declare-fun m!1084461 () Bool)

(assert (=> b!1176273 m!1084461))

(assert (=> b!1176273 m!1084461))

(declare-fun m!1084463 () Bool)

(assert (=> b!1176273 m!1084463))

(declare-fun m!1084465 () Bool)

(assert (=> b!1176273 m!1084465))

(declare-fun m!1084467 () Bool)

(assert (=> b!1176264 m!1084467))

(declare-fun m!1084469 () Bool)

(assert (=> b!1176257 m!1084469))

(declare-fun m!1084471 () Bool)

(assert (=> b!1176275 m!1084471))

(declare-fun m!1084473 () Bool)

(assert (=> b!1176256 m!1084473))

(declare-fun m!1084475 () Bool)

(assert (=> b!1176266 m!1084475))

(declare-fun m!1084477 () Bool)

(assert (=> b!1176267 m!1084477))

(declare-fun m!1084479 () Bool)

(assert (=> b!1176267 m!1084479))

(declare-fun m!1084481 () Bool)

(assert (=> b!1176267 m!1084481))

(declare-fun m!1084483 () Bool)

(assert (=> b!1176267 m!1084483))

(declare-fun m!1084485 () Bool)

(assert (=> b!1176267 m!1084485))

(declare-fun m!1084487 () Bool)

(assert (=> b!1176265 m!1084487))

(declare-fun m!1084489 () Bool)

(assert (=> b!1176265 m!1084489))

(declare-fun m!1084491 () Bool)

(assert (=> start!99690 m!1084491))

(declare-fun m!1084493 () Bool)

(assert (=> start!99690 m!1084493))

(check-sat (not start!99690) (not b!1176275) b_and!40937 (not b_lambda!20171) (not b!1176256) (not b!1176273) (not b!1176260) (not b!1176272) (not b!1176259) (not b!1176264) (not b!1176265) (not b!1176266) tp_is_empty!29563 (not b!1176269) (not mapNonEmpty!46172) (not b_next!25033) (not b!1176257) (not b!1176267))
(check-sat b_and!40937 (not b_next!25033))
