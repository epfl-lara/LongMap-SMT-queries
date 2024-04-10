; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99496 () Bool)

(assert start!99496)

(declare-fun b_free!25075 () Bool)

(declare-fun b_next!25075 () Bool)

(assert (=> start!99496 (= b_free!25075 (not b_next!25075))))

(declare-fun tp!87938 () Bool)

(declare-fun b_and!41017 () Bool)

(assert (=> start!99496 (= tp!87938 b_and!41017)))

(declare-fun b!1176280 () Bool)

(declare-fun res!781260 () Bool)

(declare-fun e!668638 () Bool)

(assert (=> b!1176280 (=> (not res!781260) (not e!668638))))

(declare-datatypes ((array!76017 0))(
  ( (array!76018 (arr!36658 (Array (_ BitVec 32) (_ BitVec 64))) (size!37194 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76017)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1176280 (= res!781260 (= (select (arr!36658 _keys!1208) i!673) k!934))))

(declare-fun b!1176281 () Bool)

(declare-fun e!668641 () Bool)

(declare-fun tp_is_empty!29605 () Bool)

(assert (=> b!1176281 (= e!668641 tp_is_empty!29605)))

(declare-fun b!1176282 () Bool)

(declare-datatypes ((Unit!38827 0))(
  ( (Unit!38828) )
))
(declare-fun e!668642 () Unit!38827)

(declare-fun Unit!38829 () Unit!38827)

(assert (=> b!1176282 (= e!668642 Unit!38829)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!530867 () Unit!38827)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76017 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38827)

(assert (=> b!1176282 (= lt!530867 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176282 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530854 () Unit!38827)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76017 (_ BitVec 32) (_ BitVec 32)) Unit!38827)

(assert (=> b!1176282 (= lt!530854 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25738 0))(
  ( (Nil!25735) (Cons!25734 (h!26943 (_ BitVec 64)) (t!37805 List!25738)) )
))
(declare-fun arrayNoDuplicates!0 (array!76017 (_ BitVec 32) List!25738) Bool)

(assert (=> b!1176282 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25735)))

(declare-fun lt!530866 () Unit!38827)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76017 (_ BitVec 64) (_ BitVec 32) List!25738) Unit!38827)

(assert (=> b!1176282 (= lt!530866 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25735))))

(assert (=> b!1176282 false))

(declare-fun b!1176283 () Bool)

(declare-fun res!781273 () Bool)

(assert (=> b!1176283 (=> (not res!781273) (not e!668638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176283 (= res!781273 (validKeyInArray!0 k!934))))

(declare-fun res!781270 () Bool)

(assert (=> start!99496 (=> (not res!781270) (not e!668638))))

(assert (=> start!99496 (= res!781270 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37194 _keys!1208))))))

(assert (=> start!99496 e!668638))

(assert (=> start!99496 tp_is_empty!29605))

(declare-fun array_inv!27996 (array!76017) Bool)

(assert (=> start!99496 (array_inv!27996 _keys!1208)))

(assert (=> start!99496 true))

(assert (=> start!99496 tp!87938))

(declare-datatypes ((V!44601 0))(
  ( (V!44602 (val!14859 Int)) )
))
(declare-datatypes ((ValueCell!14093 0))(
  ( (ValueCellFull!14093 (v!17497 V!44601)) (EmptyCell!14093) )
))
(declare-datatypes ((array!76019 0))(
  ( (array!76020 (arr!36659 (Array (_ BitVec 32) ValueCell!14093)) (size!37195 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76019)

(declare-fun e!668643 () Bool)

(declare-fun array_inv!27997 (array!76019) Bool)

(assert (=> start!99496 (and (array_inv!27997 _values!996) e!668643)))

(declare-fun mapIsEmpty!46235 () Bool)

(declare-fun mapRes!46235 () Bool)

(assert (=> mapIsEmpty!46235 mapRes!46235))

(declare-fun b!1176284 () Bool)

(declare-fun res!781259 () Bool)

(assert (=> b!1176284 (=> (not res!781259) (not e!668638))))

(assert (=> b!1176284 (= res!781259 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25735))))

(declare-fun mapNonEmpty!46235 () Bool)

(declare-fun tp!87939 () Bool)

(assert (=> mapNonEmpty!46235 (= mapRes!46235 (and tp!87939 e!668641))))

(declare-fun mapKey!46235 () (_ BitVec 32))

(declare-fun mapValue!46235 () ValueCell!14093)

(declare-fun mapRest!46235 () (Array (_ BitVec 32) ValueCell!14093))

(assert (=> mapNonEmpty!46235 (= (arr!36659 _values!996) (store mapRest!46235 mapKey!46235 mapValue!46235))))

(declare-fun b!1176285 () Bool)

(declare-fun e!668650 () Bool)

(assert (=> b!1176285 (= e!668650 tp_is_empty!29605)))

(declare-fun b!1176286 () Bool)

(declare-fun Unit!38830 () Unit!38827)

(assert (=> b!1176286 (= e!668642 Unit!38830)))

(declare-fun b!1176287 () Bool)

(declare-fun res!781262 () Bool)

(assert (=> b!1176287 (=> (not res!781262) (not e!668638))))

(assert (=> b!1176287 (= res!781262 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37194 _keys!1208))))))

(declare-fun b!1176288 () Bool)

(declare-fun e!668640 () Bool)

(declare-fun e!668646 () Bool)

(assert (=> b!1176288 (= e!668640 (not e!668646))))

(declare-fun res!781271 () Bool)

(assert (=> b!1176288 (=> res!781271 e!668646)))

(assert (=> b!1176288 (= res!781271 (bvsgt from!1455 i!673))))

(assert (=> b!1176288 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!530855 () Unit!38827)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76017 (_ BitVec 64) (_ BitVec 32)) Unit!38827)

(assert (=> b!1176288 (= lt!530855 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1176289 () Bool)

(declare-fun e!668649 () Bool)

(declare-fun e!668647 () Bool)

(assert (=> b!1176289 (= e!668649 e!668647)))

(declare-fun res!781263 () Bool)

(assert (=> b!1176289 (=> res!781263 e!668647)))

(assert (=> b!1176289 (= res!781263 (not (= (select (arr!36658 _keys!1208) from!1455) k!934)))))

(declare-fun b!1176290 () Bool)

(declare-fun res!781266 () Bool)

(assert (=> b!1176290 (=> (not res!781266) (not e!668638))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76017 (_ BitVec 32)) Bool)

(assert (=> b!1176290 (= res!781266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176291 () Bool)

(declare-fun e!668645 () Bool)

(assert (=> b!1176291 (= e!668646 e!668645)))

(declare-fun res!781272 () Bool)

(assert (=> b!1176291 (=> res!781272 e!668645)))

(assert (=> b!1176291 (= res!781272 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44601)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!530865 () array!76017)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19000 0))(
  ( (tuple2!19001 (_1!9511 (_ BitVec 64)) (_2!9511 V!44601)) )
))
(declare-datatypes ((List!25739 0))(
  ( (Nil!25736) (Cons!25735 (h!26944 tuple2!19000) (t!37806 List!25739)) )
))
(declare-datatypes ((ListLongMap!16969 0))(
  ( (ListLongMap!16970 (toList!8500 List!25739)) )
))
(declare-fun lt!530868 () ListLongMap!16969)

(declare-fun minValue!944 () V!44601)

(declare-fun lt!530861 () array!76019)

(declare-fun getCurrentListMapNoExtraKeys!4959 (array!76017 array!76019 (_ BitVec 32) (_ BitVec 32) V!44601 V!44601 (_ BitVec 32) Int) ListLongMap!16969)

(assert (=> b!1176291 (= lt!530868 (getCurrentListMapNoExtraKeys!4959 lt!530865 lt!530861 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!530859 () V!44601)

(assert (=> b!1176291 (= lt!530861 (array!76020 (store (arr!36659 _values!996) i!673 (ValueCellFull!14093 lt!530859)) (size!37195 _values!996)))))

(declare-fun dynLambda!2924 (Int (_ BitVec 64)) V!44601)

(assert (=> b!1176291 (= lt!530859 (dynLambda!2924 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530864 () ListLongMap!16969)

(assert (=> b!1176291 (= lt!530864 (getCurrentListMapNoExtraKeys!4959 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176292 () Bool)

(declare-fun res!781265 () Bool)

(assert (=> b!1176292 (=> (not res!781265) (not e!668640))))

(assert (=> b!1176292 (= res!781265 (arrayNoDuplicates!0 lt!530865 #b00000000000000000000000000000000 Nil!25735))))

(declare-fun b!1176293 () Bool)

(declare-fun e!668648 () Bool)

(assert (=> b!1176293 (= e!668645 e!668648)))

(declare-fun res!781267 () Bool)

(assert (=> b!1176293 (=> res!781267 e!668648)))

(assert (=> b!1176293 (= res!781267 (not (validKeyInArray!0 (select (arr!36658 _keys!1208) from!1455))))))

(declare-fun lt!530863 () ListLongMap!16969)

(declare-fun lt!530857 () ListLongMap!16969)

(assert (=> b!1176293 (= lt!530863 lt!530857)))

(declare-fun lt!530860 () ListLongMap!16969)

(declare-fun -!1554 (ListLongMap!16969 (_ BitVec 64)) ListLongMap!16969)

(assert (=> b!1176293 (= lt!530857 (-!1554 lt!530860 k!934))))

(assert (=> b!1176293 (= lt!530863 (getCurrentListMapNoExtraKeys!4959 lt!530865 lt!530861 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1176293 (= lt!530860 (getCurrentListMapNoExtraKeys!4959 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530858 () Unit!38827)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!781 (array!76017 array!76019 (_ BitVec 32) (_ BitVec 32) V!44601 V!44601 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38827)

(assert (=> b!1176293 (= lt!530858 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!781 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176294 () Bool)

(declare-fun res!781269 () Bool)

(assert (=> b!1176294 (=> (not res!781269) (not e!668638))))

(assert (=> b!1176294 (= res!781269 (and (= (size!37195 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37194 _keys!1208) (size!37195 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!668644 () Bool)

(declare-fun lt!530862 () tuple2!19000)

(declare-fun b!1176295 () Bool)

(declare-fun +!3816 (ListLongMap!16969 tuple2!19000) ListLongMap!16969)

(assert (=> b!1176295 (= e!668644 (= lt!530864 (+!3816 lt!530860 lt!530862)))))

(declare-fun b!1176296 () Bool)

(declare-fun res!781258 () Bool)

(assert (=> b!1176296 (=> (not res!781258) (not e!668638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176296 (= res!781258 (validMask!0 mask!1564))))

(declare-fun b!1176297 () Bool)

(assert (=> b!1176297 (= e!668648 true)))

(assert (=> b!1176297 e!668644))

(declare-fun res!781261 () Bool)

(assert (=> b!1176297 (=> (not res!781261) (not e!668644))))

(assert (=> b!1176297 (= res!781261 (not (= (select (arr!36658 _keys!1208) from!1455) k!934)))))

(declare-fun lt!530856 () Unit!38827)

(assert (=> b!1176297 (= lt!530856 e!668642)))

(declare-fun c!116736 () Bool)

(assert (=> b!1176297 (= c!116736 (= (select (arr!36658 _keys!1208) from!1455) k!934))))

(assert (=> b!1176297 e!668649))

(declare-fun res!781264 () Bool)

(assert (=> b!1176297 (=> (not res!781264) (not e!668649))))

(assert (=> b!1176297 (= res!781264 (= lt!530868 (+!3816 lt!530857 lt!530862)))))

(declare-fun get!18722 (ValueCell!14093 V!44601) V!44601)

(assert (=> b!1176297 (= lt!530862 (tuple2!19001 (select (arr!36658 _keys!1208) from!1455) (get!18722 (select (arr!36659 _values!996) from!1455) lt!530859)))))

(declare-fun b!1176298 () Bool)

(assert (=> b!1176298 (= e!668643 (and e!668650 mapRes!46235))))

(declare-fun condMapEmpty!46235 () Bool)

(declare-fun mapDefault!46235 () ValueCell!14093)

