; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99430 () Bool)

(assert start!99430)

(declare-fun b_free!25015 () Bool)

(declare-fun b_next!25015 () Bool)

(assert (=> start!99430 (= b_free!25015 (not b_next!25015))))

(declare-fun tp!87759 () Bool)

(declare-fun b_and!40875 () Bool)

(assert (=> start!99430 (= tp!87759 b_and!40875)))

(declare-fun b!1174285 () Bool)

(declare-fun e!667471 () Bool)

(declare-fun tp_is_empty!29545 () Bool)

(assert (=> b!1174285 (= e!667471 tp_is_empty!29545)))

(declare-fun b!1174286 () Bool)

(declare-datatypes ((Unit!38565 0))(
  ( (Unit!38566) )
))
(declare-fun e!667479 () Unit!38565)

(declare-fun Unit!38567 () Unit!38565)

(assert (=> b!1174286 (= e!667479 Unit!38567)))

(declare-datatypes ((array!75830 0))(
  ( (array!75831 (arr!36565 (Array (_ BitVec 32) (_ BitVec 64))) (size!37103 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75830)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!529404 () Unit!38565)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75830 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38565)

(assert (=> b!1174286 (= lt!529404 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174286 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529393 () Unit!38565)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75830 (_ BitVec 32) (_ BitVec 32)) Unit!38565)

(assert (=> b!1174286 (= lt!529393 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25766 0))(
  ( (Nil!25763) (Cons!25762 (h!26971 (_ BitVec 64)) (t!37764 List!25766)) )
))
(declare-fun arrayNoDuplicates!0 (array!75830 (_ BitVec 32) List!25766) Bool)

(assert (=> b!1174286 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25763)))

(declare-fun lt!529395 () Unit!38565)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75830 (_ BitVec 64) (_ BitVec 32) List!25766) Unit!38565)

(assert (=> b!1174286 (= lt!529395 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25763))))

(assert (=> b!1174286 false))

(declare-fun b!1174287 () Bool)

(declare-fun res!779837 () Bool)

(declare-fun e!667473 () Bool)

(assert (=> b!1174287 (=> (not res!779837) (not e!667473))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174287 (= res!779837 (validKeyInArray!0 k0!934))))

(declare-fun b!1174288 () Bool)

(declare-fun res!779831 () Bool)

(declare-fun e!667475 () Bool)

(assert (=> b!1174288 (=> (not res!779831) (not e!667475))))

(declare-fun lt!529396 () array!75830)

(assert (=> b!1174288 (= res!779831 (arrayNoDuplicates!0 lt!529396 #b00000000000000000000000000000000 Nil!25763))))

(declare-fun b!1174289 () Bool)

(declare-fun e!667472 () Bool)

(declare-fun e!667470 () Bool)

(assert (=> b!1174289 (= e!667472 e!667470)))

(declare-fun res!779840 () Bool)

(assert (=> b!1174289 (=> res!779840 e!667470)))

(assert (=> b!1174289 (= res!779840 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44521 0))(
  ( (V!44522 (val!14829 Int)) )
))
(declare-fun zeroValue!944 () V!44521)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44521)

(declare-datatypes ((tuple2!19052 0))(
  ( (tuple2!19053 (_1!9537 (_ BitVec 64)) (_2!9537 V!44521)) )
))
(declare-datatypes ((List!25767 0))(
  ( (Nil!25764) (Cons!25763 (h!26972 tuple2!19052) (t!37765 List!25767)) )
))
(declare-datatypes ((ListLongMap!17021 0))(
  ( (ListLongMap!17022 (toList!8526 List!25767)) )
))
(declare-fun lt!529402 () ListLongMap!17021)

(declare-datatypes ((ValueCell!14063 0))(
  ( (ValueCellFull!14063 (v!17466 V!44521)) (EmptyCell!14063) )
))
(declare-datatypes ((array!75832 0))(
  ( (array!75833 (arr!36566 (Array (_ BitVec 32) ValueCell!14063)) (size!37104 (_ BitVec 32))) )
))
(declare-fun lt!529399 () array!75832)

(declare-fun getCurrentListMapNoExtraKeys!4999 (array!75830 array!75832 (_ BitVec 32) (_ BitVec 32) V!44521 V!44521 (_ BitVec 32) Int) ListLongMap!17021)

(assert (=> b!1174289 (= lt!529402 (getCurrentListMapNoExtraKeys!4999 lt!529396 lt!529399 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!529394 () V!44521)

(declare-fun _values!996 () array!75832)

(assert (=> b!1174289 (= lt!529399 (array!75833 (store (arr!36566 _values!996) i!673 (ValueCellFull!14063 lt!529394)) (size!37104 _values!996)))))

(declare-fun dynLambda!2918 (Int (_ BitVec 64)) V!44521)

(assert (=> b!1174289 (= lt!529394 (dynLambda!2918 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529401 () ListLongMap!17021)

(assert (=> b!1174289 (= lt!529401 (getCurrentListMapNoExtraKeys!4999 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174290 () Bool)

(declare-fun e!667480 () Bool)

(declare-fun mapRes!46145 () Bool)

(assert (=> b!1174290 (= e!667480 (and e!667471 mapRes!46145))))

(declare-fun condMapEmpty!46145 () Bool)

(declare-fun mapDefault!46145 () ValueCell!14063)

(assert (=> b!1174290 (= condMapEmpty!46145 (= (arr!36566 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14063)) mapDefault!46145)))))

(declare-fun res!779844 () Bool)

(assert (=> start!99430 (=> (not res!779844) (not e!667473))))

(assert (=> start!99430 (= res!779844 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37103 _keys!1208))))))

(assert (=> start!99430 e!667473))

(assert (=> start!99430 tp_is_empty!29545))

(declare-fun array_inv!28042 (array!75830) Bool)

(assert (=> start!99430 (array_inv!28042 _keys!1208)))

(assert (=> start!99430 true))

(assert (=> start!99430 tp!87759))

(declare-fun array_inv!28043 (array!75832) Bool)

(assert (=> start!99430 (and (array_inv!28043 _values!996) e!667480)))

(declare-fun b!1174291 () Bool)

(declare-fun res!779836 () Bool)

(assert (=> b!1174291 (=> (not res!779836) (not e!667473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75830 (_ BitVec 32)) Bool)

(assert (=> b!1174291 (= res!779836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174292 () Bool)

(declare-fun e!667469 () Bool)

(assert (=> b!1174292 (= e!667469 tp_is_empty!29545)))

(declare-fun b!1174293 () Bool)

(declare-fun e!667474 () Bool)

(declare-fun e!667477 () Bool)

(assert (=> b!1174293 (= e!667474 e!667477)))

(declare-fun res!779842 () Bool)

(assert (=> b!1174293 (=> res!779842 e!667477)))

(assert (=> b!1174293 (= res!779842 (not (= (select (arr!36565 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1174294 () Bool)

(declare-fun e!667478 () Bool)

(assert (=> b!1174294 (= e!667470 e!667478)))

(declare-fun res!779843 () Bool)

(assert (=> b!1174294 (=> res!779843 e!667478)))

(assert (=> b!1174294 (= res!779843 (not (validKeyInArray!0 (select (arr!36565 _keys!1208) from!1455))))))

(declare-fun lt!529403 () ListLongMap!17021)

(declare-fun lt!529400 () ListLongMap!17021)

(assert (=> b!1174294 (= lt!529403 lt!529400)))

(declare-fun lt!529398 () ListLongMap!17021)

(declare-fun -!1513 (ListLongMap!17021 (_ BitVec 64)) ListLongMap!17021)

(assert (=> b!1174294 (= lt!529400 (-!1513 lt!529398 k0!934))))

(assert (=> b!1174294 (= lt!529403 (getCurrentListMapNoExtraKeys!4999 lt!529396 lt!529399 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174294 (= lt!529398 (getCurrentListMapNoExtraKeys!4999 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529391 () Unit!38565)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!777 (array!75830 array!75832 (_ BitVec 32) (_ BitVec 32) V!44521 V!44521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38565)

(assert (=> b!1174294 (= lt!529391 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!777 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174295 () Bool)

(assert (=> b!1174295 (= e!667473 e!667475)))

(declare-fun res!779838 () Bool)

(assert (=> b!1174295 (=> (not res!779838) (not e!667475))))

(assert (=> b!1174295 (= res!779838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529396 mask!1564))))

(assert (=> b!1174295 (= lt!529396 (array!75831 (store (arr!36565 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37103 _keys!1208)))))

(declare-fun b!1174296 () Bool)

(declare-fun res!779835 () Bool)

(assert (=> b!1174296 (=> (not res!779835) (not e!667473))))

(assert (=> b!1174296 (= res!779835 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25763))))

(declare-fun b!1174297 () Bool)

(declare-fun res!779834 () Bool)

(assert (=> b!1174297 (=> (not res!779834) (not e!667473))))

(assert (=> b!1174297 (= res!779834 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37103 _keys!1208))))))

(declare-fun b!1174298 () Bool)

(declare-fun res!779839 () Bool)

(assert (=> b!1174298 (=> (not res!779839) (not e!667473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174298 (= res!779839 (validMask!0 mask!1564))))

(declare-fun b!1174299 () Bool)

(declare-fun res!779841 () Bool)

(assert (=> b!1174299 (=> (not res!779841) (not e!667473))))

(assert (=> b!1174299 (= res!779841 (and (= (size!37104 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37103 _keys!1208) (size!37104 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46145 () Bool)

(declare-fun tp!87758 () Bool)

(assert (=> mapNonEmpty!46145 (= mapRes!46145 (and tp!87758 e!667469))))

(declare-fun mapValue!46145 () ValueCell!14063)

(declare-fun mapKey!46145 () (_ BitVec 32))

(declare-fun mapRest!46145 () (Array (_ BitVec 32) ValueCell!14063))

(assert (=> mapNonEmpty!46145 (= (arr!36566 _values!996) (store mapRest!46145 mapKey!46145 mapValue!46145))))

(declare-fun b!1174300 () Bool)

(assert (=> b!1174300 (= e!667475 (not e!667472))))

(declare-fun res!779833 () Bool)

(assert (=> b!1174300 (=> res!779833 e!667472)))

(assert (=> b!1174300 (= res!779833 (bvsgt from!1455 i!673))))

(assert (=> b!1174300 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529392 () Unit!38565)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75830 (_ BitVec 64) (_ BitVec 32)) Unit!38565)

(assert (=> b!1174300 (= lt!529392 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174301 () Bool)

(assert (=> b!1174301 (= e!667478 true)))

(assert (=> b!1174301 (not (= (select (arr!36565 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529397 () Unit!38565)

(assert (=> b!1174301 (= lt!529397 e!667479)))

(declare-fun c!116620 () Bool)

(assert (=> b!1174301 (= c!116620 (= (select (arr!36565 _keys!1208) from!1455) k0!934))))

(assert (=> b!1174301 e!667474))

(declare-fun res!779845 () Bool)

(assert (=> b!1174301 (=> (not res!779845) (not e!667474))))

(declare-fun +!3835 (ListLongMap!17021 tuple2!19052) ListLongMap!17021)

(declare-fun get!18673 (ValueCell!14063 V!44521) V!44521)

(assert (=> b!1174301 (= res!779845 (= lt!529402 (+!3835 lt!529400 (tuple2!19053 (select (arr!36565 _keys!1208) from!1455) (get!18673 (select (arr!36566 _values!996) from!1455) lt!529394)))))))

(declare-fun b!1174302 () Bool)

(declare-fun Unit!38568 () Unit!38565)

(assert (=> b!1174302 (= e!667479 Unit!38568)))

(declare-fun b!1174303 () Bool)

(assert (=> b!1174303 (= e!667477 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46145 () Bool)

(assert (=> mapIsEmpty!46145 mapRes!46145))

(declare-fun b!1174304 () Bool)

(declare-fun res!779832 () Bool)

(assert (=> b!1174304 (=> (not res!779832) (not e!667473))))

(assert (=> b!1174304 (= res!779832 (= (select (arr!36565 _keys!1208) i!673) k0!934))))

(assert (= (and start!99430 res!779844) b!1174298))

(assert (= (and b!1174298 res!779839) b!1174299))

(assert (= (and b!1174299 res!779841) b!1174291))

(assert (= (and b!1174291 res!779836) b!1174296))

(assert (= (and b!1174296 res!779835) b!1174297))

(assert (= (and b!1174297 res!779834) b!1174287))

(assert (= (and b!1174287 res!779837) b!1174304))

(assert (= (and b!1174304 res!779832) b!1174295))

(assert (= (and b!1174295 res!779838) b!1174288))

(assert (= (and b!1174288 res!779831) b!1174300))

(assert (= (and b!1174300 (not res!779833)) b!1174289))

(assert (= (and b!1174289 (not res!779840)) b!1174294))

(assert (= (and b!1174294 (not res!779843)) b!1174301))

(assert (= (and b!1174301 res!779845) b!1174293))

(assert (= (and b!1174293 (not res!779842)) b!1174303))

(assert (= (and b!1174301 c!116620) b!1174286))

(assert (= (and b!1174301 (not c!116620)) b!1174302))

(assert (= (and b!1174290 condMapEmpty!46145) mapIsEmpty!46145))

(assert (= (and b!1174290 (not condMapEmpty!46145)) mapNonEmpty!46145))

(get-info :version)

(assert (= (and mapNonEmpty!46145 ((_ is ValueCellFull!14063) mapValue!46145)) b!1174292))

(assert (= (and b!1174290 ((_ is ValueCellFull!14063) mapDefault!46145)) b!1174285))

(assert (= start!99430 b!1174290))

(declare-fun b_lambda!20141 () Bool)

(assert (=> (not b_lambda!20141) (not b!1174289)))

(declare-fun t!37763 () Bool)

(declare-fun tb!9819 () Bool)

(assert (=> (and start!99430 (= defaultEntry!1004 defaultEntry!1004) t!37763) tb!9819))

(declare-fun result!20213 () Bool)

(assert (=> tb!9819 (= result!20213 tp_is_empty!29545)))

(assert (=> b!1174289 t!37763))

(declare-fun b_and!40877 () Bool)

(assert (= b_and!40875 (and (=> t!37763 result!20213) b_and!40877)))

(declare-fun m!1081673 () Bool)

(assert (=> b!1174287 m!1081673))

(declare-fun m!1081675 () Bool)

(assert (=> b!1174303 m!1081675))

(declare-fun m!1081677 () Bool)

(assert (=> b!1174293 m!1081677))

(declare-fun m!1081679 () Bool)

(assert (=> b!1174304 m!1081679))

(declare-fun m!1081681 () Bool)

(assert (=> b!1174294 m!1081681))

(declare-fun m!1081683 () Bool)

(assert (=> b!1174294 m!1081683))

(declare-fun m!1081685 () Bool)

(assert (=> b!1174294 m!1081685))

(declare-fun m!1081687 () Bool)

(assert (=> b!1174294 m!1081687))

(assert (=> b!1174294 m!1081677))

(declare-fun m!1081689 () Bool)

(assert (=> b!1174294 m!1081689))

(assert (=> b!1174294 m!1081677))

(declare-fun m!1081691 () Bool)

(assert (=> b!1174298 m!1081691))

(assert (=> b!1174301 m!1081677))

(declare-fun m!1081693 () Bool)

(assert (=> b!1174301 m!1081693))

(assert (=> b!1174301 m!1081693))

(declare-fun m!1081695 () Bool)

(assert (=> b!1174301 m!1081695))

(declare-fun m!1081697 () Bool)

(assert (=> b!1174301 m!1081697))

(declare-fun m!1081699 () Bool)

(assert (=> b!1174286 m!1081699))

(declare-fun m!1081701 () Bool)

(assert (=> b!1174286 m!1081701))

(declare-fun m!1081703 () Bool)

(assert (=> b!1174286 m!1081703))

(declare-fun m!1081705 () Bool)

(assert (=> b!1174286 m!1081705))

(declare-fun m!1081707 () Bool)

(assert (=> b!1174286 m!1081707))

(declare-fun m!1081709 () Bool)

(assert (=> b!1174291 m!1081709))

(declare-fun m!1081711 () Bool)

(assert (=> b!1174296 m!1081711))

(declare-fun m!1081713 () Bool)

(assert (=> b!1174289 m!1081713))

(declare-fun m!1081715 () Bool)

(assert (=> b!1174289 m!1081715))

(declare-fun m!1081717 () Bool)

(assert (=> b!1174289 m!1081717))

(declare-fun m!1081719 () Bool)

(assert (=> b!1174289 m!1081719))

(declare-fun m!1081721 () Bool)

(assert (=> b!1174288 m!1081721))

(declare-fun m!1081723 () Bool)

(assert (=> mapNonEmpty!46145 m!1081723))

(declare-fun m!1081725 () Bool)

(assert (=> start!99430 m!1081725))

(declare-fun m!1081727 () Bool)

(assert (=> start!99430 m!1081727))

(declare-fun m!1081729 () Bool)

(assert (=> b!1174295 m!1081729))

(declare-fun m!1081731 () Bool)

(assert (=> b!1174295 m!1081731))

(declare-fun m!1081733 () Bool)

(assert (=> b!1174300 m!1081733))

(declare-fun m!1081735 () Bool)

(assert (=> b!1174300 m!1081735))

(check-sat (not b!1174288) (not start!99430) (not b_next!25015) (not b!1174289) (not b_lambda!20141) (not b!1174303) (not b!1174296) (not b!1174300) (not b!1174294) (not b!1174291) tp_is_empty!29545 (not b!1174286) (not b!1174301) (not mapNonEmpty!46145) (not b!1174287) (not b!1174295) (not b!1174298) b_and!40877)
(check-sat b_and!40877 (not b_next!25015))
