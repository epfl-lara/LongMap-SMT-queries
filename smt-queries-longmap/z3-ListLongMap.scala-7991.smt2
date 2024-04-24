; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99022 () Bool)

(assert start!99022)

(declare-fun b_free!24391 () Bool)

(declare-fun b_next!24391 () Bool)

(assert (=> start!99022 (= b_free!24391 (not b_next!24391))))

(declare-fun tp!85883 () Bool)

(declare-fun b_and!39633 () Bool)

(assert (=> start!99022 (= tp!85883 b_and!39633)))

(declare-fun b!1154287 () Bool)

(declare-datatypes ((Unit!37926 0))(
  ( (Unit!37927) )
))
(declare-fun e!656595 () Unit!37926)

(declare-fun Unit!37928 () Unit!37926)

(assert (=> b!1154287 (= e!656595 Unit!37928)))

(declare-fun lt!517127 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1154287 (= lt!517127 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114776 () Bool)

(assert (=> b!1154287 (= c!114776 (and (not lt!517127) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517137 () Unit!37926)

(declare-fun e!656602 () Unit!37926)

(assert (=> b!1154287 (= lt!517137 e!656602)))

(declare-datatypes ((array!74733 0))(
  ( (array!74734 (arr!36011 (Array (_ BitVec 32) (_ BitVec 64))) (size!36548 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74733)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!43689 0))(
  ( (V!43690 (val!14517 Int)) )
))
(declare-datatypes ((ValueCell!13751 0))(
  ( (ValueCellFull!13751 (v!17150 V!43689)) (EmptyCell!13751) )
))
(declare-datatypes ((array!74735 0))(
  ( (array!74736 (arr!36012 (Array (_ BitVec 32) ValueCell!13751)) (size!36549 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74735)

(declare-fun minValue!944 () V!43689)

(declare-fun lt!517124 () Unit!37926)

(declare-fun zeroValue!944 () V!43689)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!483 (array!74733 array!74735 (_ BitVec 32) (_ BitVec 32) V!43689 V!43689 (_ BitVec 64) (_ BitVec 32) Int) Unit!37926)

(assert (=> b!1154287 (= lt!517124 (lemmaListMapContainsThenArrayContainsFrom!483 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114777 () Bool)

(assert (=> b!1154287 (= c!114777 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766977 () Bool)

(declare-fun e!656600 () Bool)

(assert (=> b!1154287 (= res!766977 e!656600)))

(declare-fun e!656588 () Bool)

(assert (=> b!1154287 (=> (not res!766977) (not e!656588))))

(assert (=> b!1154287 e!656588))

(declare-fun lt!517141 () Unit!37926)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74733 (_ BitVec 32) (_ BitVec 32)) Unit!37926)

(assert (=> b!1154287 (= lt!517141 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25209 0))(
  ( (Nil!25206) (Cons!25205 (h!26423 (_ BitVec 64)) (t!36584 List!25209)) )
))
(declare-fun arrayNoDuplicates!0 (array!74733 (_ BitVec 32) List!25209) Bool)

(assert (=> b!1154287 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25206)))

(declare-fun lt!517136 () Unit!37926)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74733 (_ BitVec 64) (_ BitVec 32) List!25209) Unit!37926)

(assert (=> b!1154287 (= lt!517136 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25206))))

(assert (=> b!1154287 false))

(declare-fun b!1154288 () Bool)

(declare-fun call!54304 () Bool)

(assert (=> b!1154288 call!54304))

(declare-fun lt!517122 () Unit!37926)

(declare-fun call!54302 () Unit!37926)

(assert (=> b!1154288 (= lt!517122 call!54302)))

(declare-fun e!656598 () Unit!37926)

(assert (=> b!1154288 (= e!656598 lt!517122)))

(declare-fun b!1154290 () Bool)

(declare-fun e!656593 () Bool)

(declare-datatypes ((tuple2!18460 0))(
  ( (tuple2!18461 (_1!9241 (_ BitVec 64)) (_2!9241 V!43689)) )
))
(declare-datatypes ((List!25210 0))(
  ( (Nil!25207) (Cons!25206 (h!26424 tuple2!18460) (t!36585 List!25210)) )
))
(declare-datatypes ((ListLongMap!16437 0))(
  ( (ListLongMap!16438 (toList!8234 List!25210)) )
))
(declare-fun call!54301 () ListLongMap!16437)

(declare-fun call!54306 () ListLongMap!16437)

(assert (=> b!1154290 (= e!656593 (= call!54301 call!54306))))

(declare-fun c!114778 () Bool)

(declare-fun bm!54296 () Bool)

(declare-fun lt!517134 () ListLongMap!16437)

(declare-fun call!54300 () Unit!37926)

(declare-fun addStillContains!887 (ListLongMap!16437 (_ BitVec 64) V!43689 (_ BitVec 64)) Unit!37926)

(assert (=> bm!54296 (= call!54300 (addStillContains!887 lt!517134 (ite (or c!114776 c!114778) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114776 c!114778) zeroValue!944 minValue!944) k0!934))))

(declare-fun lt!517126 () array!74735)

(declare-fun b!1154291 () Bool)

(declare-fun lt!517129 () ListLongMap!16437)

(declare-fun lt!517138 () array!74733)

(declare-fun e!656590 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4730 (array!74733 array!74735 (_ BitVec 32) (_ BitVec 32) V!43689 V!43689 (_ BitVec 32) Int) ListLongMap!16437)

(assert (=> b!1154291 (= e!656590 (= lt!517129 (getCurrentListMapNoExtraKeys!4730 lt!517138 lt!517126 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!54297 () Bool)

(declare-fun call!54305 () Bool)

(assert (=> bm!54297 (= call!54304 call!54305)))

(declare-fun bm!54298 () Bool)

(assert (=> bm!54298 (= call!54306 (getCurrentListMapNoExtraKeys!4730 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154292 () Bool)

(declare-fun arrayContainsKey!0 (array!74733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154292 (= e!656588 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154293 () Bool)

(declare-fun e!656596 () Unit!37926)

(assert (=> b!1154293 (= e!656596 e!656598)))

(declare-fun c!114779 () Bool)

(assert (=> b!1154293 (= c!114779 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517127))))

(declare-fun b!1154294 () Bool)

(declare-fun res!766981 () Bool)

(declare-fun e!656597 () Bool)

(assert (=> b!1154294 (=> (not res!766981) (not e!656597))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1154294 (= res!766981 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36548 _keys!1208))))))

(declare-fun b!1154295 () Bool)

(declare-fun Unit!37929 () Unit!37926)

(assert (=> b!1154295 (= e!656598 Unit!37929)))

(declare-fun b!1154296 () Bool)

(declare-fun res!766982 () Bool)

(assert (=> b!1154296 (=> (not res!766982) (not e!656597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1154296 (= res!766982 (validMask!0 mask!1564))))

(declare-fun b!1154297 () Bool)

(declare-fun res!766986 () Bool)

(assert (=> b!1154297 (=> (not res!766986) (not e!656597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1154297 (= res!766986 (validKeyInArray!0 k0!934))))

(declare-fun b!1154298 () Bool)

(assert (=> b!1154298 (= e!656600 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517127) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1154299 () Bool)

(declare-fun e!656601 () Bool)

(declare-fun e!656589 () Bool)

(declare-fun mapRes!45206 () Bool)

(assert (=> b!1154299 (= e!656601 (and e!656589 mapRes!45206))))

(declare-fun condMapEmpty!45206 () Bool)

(declare-fun mapDefault!45206 () ValueCell!13751)

(assert (=> b!1154299 (= condMapEmpty!45206 (= (arr!36012 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13751)) mapDefault!45206)))))

(declare-fun b!1154300 () Bool)

(assert (=> b!1154300 (= e!656600 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154301 () Bool)

(declare-fun e!656586 () Bool)

(declare-fun tp_is_empty!28921 () Bool)

(assert (=> b!1154301 (= e!656586 tp_is_empty!28921)))

(declare-fun call!54303 () ListLongMap!16437)

(declare-fun lt!517133 () ListLongMap!16437)

(declare-fun bm!54299 () Bool)

(declare-fun +!3664 (ListLongMap!16437 tuple2!18460) ListLongMap!16437)

(assert (=> bm!54299 (= call!54303 (+!3664 (ite c!114776 lt!517133 lt!517134) (ite c!114776 (tuple2!18461 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114778 (tuple2!18461 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18461 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun res!766980 () Bool)

(assert (=> start!99022 (=> (not res!766980) (not e!656597))))

(assert (=> start!99022 (= res!766980 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36548 _keys!1208))))))

(assert (=> start!99022 e!656597))

(assert (=> start!99022 tp_is_empty!28921))

(declare-fun array_inv!27632 (array!74733) Bool)

(assert (=> start!99022 (array_inv!27632 _keys!1208)))

(assert (=> start!99022 true))

(assert (=> start!99022 tp!85883))

(declare-fun array_inv!27633 (array!74735) Bool)

(assert (=> start!99022 (and (array_inv!27633 _values!996) e!656601)))

(declare-fun b!1154289 () Bool)

(declare-fun res!766974 () Bool)

(assert (=> b!1154289 (=> (not res!766974) (not e!656597))))

(assert (=> b!1154289 (= res!766974 (= (select (arr!36011 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45206 () Bool)

(declare-fun tp!85884 () Bool)

(assert (=> mapNonEmpty!45206 (= mapRes!45206 (and tp!85884 e!656586))))

(declare-fun mapRest!45206 () (Array (_ BitVec 32) ValueCell!13751))

(declare-fun mapValue!45206 () ValueCell!13751)

(declare-fun mapKey!45206 () (_ BitVec 32))

(assert (=> mapNonEmpty!45206 (= (arr!36012 _values!996) (store mapRest!45206 mapKey!45206 mapValue!45206))))

(declare-fun b!1154302 () Bool)

(declare-fun e!656587 () Bool)

(declare-fun e!656591 () Bool)

(assert (=> b!1154302 (= e!656587 e!656591)))

(declare-fun res!766973 () Bool)

(assert (=> b!1154302 (=> res!766973 e!656591)))

(assert (=> b!1154302 (= res!766973 (not (= (select (arr!36011 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1154302 e!656593))

(declare-fun c!114780 () Bool)

(assert (=> b!1154302 (= c!114780 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!517123 () Unit!37926)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!588 (array!74733 array!74735 (_ BitVec 32) (_ BitVec 32) V!43689 V!43689 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37926)

(assert (=> b!1154302 (= lt!517123 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!588 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45206 () Bool)

(assert (=> mapIsEmpty!45206 mapRes!45206))

(declare-fun bm!54300 () Bool)

(assert (=> bm!54300 (= call!54302 call!54300)))

(declare-fun bm!54301 () Bool)

(declare-fun call!54299 () ListLongMap!16437)

(assert (=> bm!54301 (= call!54299 call!54303)))

(declare-fun b!1154303 () Bool)

(assert (=> b!1154303 (= e!656589 tp_is_empty!28921)))

(declare-fun bm!54302 () Bool)

(assert (=> bm!54302 (= call!54301 (getCurrentListMapNoExtraKeys!4730 lt!517138 lt!517126 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154304 () Bool)

(declare-fun contains!6763 (ListLongMap!16437 (_ BitVec 64)) Bool)

(assert (=> b!1154304 (contains!6763 call!54303 k0!934)))

(declare-fun lt!517139 () Unit!37926)

(assert (=> b!1154304 (= lt!517139 (addStillContains!887 lt!517133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1154304 call!54305))

(assert (=> b!1154304 (= lt!517133 (+!3664 lt!517134 (tuple2!18461 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!517121 () Unit!37926)

(assert (=> b!1154304 (= lt!517121 call!54300)))

(assert (=> b!1154304 (= e!656602 lt!517139)))

(declare-fun b!1154305 () Bool)

(declare-fun res!766984 () Bool)

(declare-fun e!656599 () Bool)

(assert (=> b!1154305 (=> (not res!766984) (not e!656599))))

(assert (=> b!1154305 (= res!766984 (arrayNoDuplicates!0 lt!517138 #b00000000000000000000000000000000 Nil!25206))))

(declare-fun b!1154306 () Bool)

(declare-fun lt!517140 () Unit!37926)

(assert (=> b!1154306 (= e!656596 lt!517140)))

(assert (=> b!1154306 (= lt!517140 call!54302)))

(assert (=> b!1154306 call!54304))

(declare-fun b!1154307 () Bool)

(declare-fun e!656594 () Bool)

(assert (=> b!1154307 (= e!656599 (not e!656594))))

(declare-fun res!766975 () Bool)

(assert (=> b!1154307 (=> res!766975 e!656594)))

(assert (=> b!1154307 (= res!766975 (bvsgt from!1455 i!673))))

(assert (=> b!1154307 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!517120 () Unit!37926)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74733 (_ BitVec 64) (_ BitVec 32)) Unit!37926)

(assert (=> b!1154307 (= lt!517120 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1154308 () Bool)

(declare-fun -!1348 (ListLongMap!16437 (_ BitVec 64)) ListLongMap!16437)

(assert (=> b!1154308 (= e!656593 (= call!54301 (-!1348 call!54306 k0!934)))))

(declare-fun b!1154309 () Bool)

(assert (=> b!1154309 (= e!656594 e!656587)))

(declare-fun res!766976 () Bool)

(assert (=> b!1154309 (=> res!766976 e!656587)))

(assert (=> b!1154309 (= res!766976 (not (= from!1455 i!673)))))

(declare-fun lt!517130 () ListLongMap!16437)

(assert (=> b!1154309 (= lt!517130 (getCurrentListMapNoExtraKeys!4730 lt!517138 lt!517126 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!517131 () V!43689)

(assert (=> b!1154309 (= lt!517126 (array!74736 (store (arr!36012 _values!996) i!673 (ValueCellFull!13751 lt!517131)) (size!36549 _values!996)))))

(declare-fun dynLambda!2753 (Int (_ BitVec 64)) V!43689)

(assert (=> b!1154309 (= lt!517131 (dynLambda!2753 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!517132 () ListLongMap!16437)

(assert (=> b!1154309 (= lt!517132 (getCurrentListMapNoExtraKeys!4730 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1154310 () Bool)

(declare-fun res!766979 () Bool)

(assert (=> b!1154310 (=> (not res!766979) (not e!656597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74733 (_ BitVec 32)) Bool)

(assert (=> b!1154310 (= res!766979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1154311 () Bool)

(declare-fun res!766978 () Bool)

(assert (=> b!1154311 (=> (not res!766978) (not e!656597))))

(assert (=> b!1154311 (= res!766978 (and (= (size!36549 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36548 _keys!1208) (size!36549 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1154312 () Bool)

(declare-fun res!766972 () Bool)

(assert (=> b!1154312 (=> (not res!766972) (not e!656597))))

(assert (=> b!1154312 (= res!766972 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25206))))

(declare-fun b!1154313 () Bool)

(assert (=> b!1154313 (= e!656597 e!656599)))

(declare-fun res!766983 () Bool)

(assert (=> b!1154313 (=> (not res!766983) (not e!656599))))

(assert (=> b!1154313 (= res!766983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517138 mask!1564))))

(assert (=> b!1154313 (= lt!517138 (array!74734 (store (arr!36011 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36548 _keys!1208)))))

(declare-fun b!1154314 () Bool)

(assert (=> b!1154314 (= e!656591 true)))

(assert (=> b!1154314 e!656590))

(declare-fun res!766985 () Bool)

(assert (=> b!1154314 (=> (not res!766985) (not e!656590))))

(assert (=> b!1154314 (= res!766985 (= lt!517129 lt!517134))))

(assert (=> b!1154314 (= lt!517129 (-!1348 lt!517132 k0!934))))

(declare-fun lt!517135 () V!43689)

(assert (=> b!1154314 (= (-!1348 (+!3664 lt!517134 (tuple2!18461 (select (arr!36011 _keys!1208) from!1455) lt!517135)) (select (arr!36011 _keys!1208) from!1455)) lt!517134)))

(declare-fun lt!517128 () Unit!37926)

(declare-fun addThenRemoveForNewKeyIsSame!191 (ListLongMap!16437 (_ BitVec 64) V!43689) Unit!37926)

(assert (=> b!1154314 (= lt!517128 (addThenRemoveForNewKeyIsSame!191 lt!517134 (select (arr!36011 _keys!1208) from!1455) lt!517135))))

(declare-fun get!18366 (ValueCell!13751 V!43689) V!43689)

(assert (=> b!1154314 (= lt!517135 (get!18366 (select (arr!36012 _values!996) from!1455) lt!517131))))

(declare-fun lt!517125 () Unit!37926)

(assert (=> b!1154314 (= lt!517125 e!656595)))

(declare-fun c!114775 () Bool)

(assert (=> b!1154314 (= c!114775 (contains!6763 lt!517134 k0!934))))

(assert (=> b!1154314 (= lt!517134 (getCurrentListMapNoExtraKeys!4730 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154315 () Bool)

(assert (=> b!1154315 (= c!114778 (and (not lt!517127) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1154315 (= e!656602 e!656596)))

(declare-fun b!1154316 () Bool)

(declare-fun Unit!37930 () Unit!37926)

(assert (=> b!1154316 (= e!656595 Unit!37930)))

(declare-fun bm!54303 () Bool)

(assert (=> bm!54303 (= call!54305 (contains!6763 (ite c!114776 lt!517133 call!54299) k0!934))))

(assert (= (and start!99022 res!766980) b!1154296))

(assert (= (and b!1154296 res!766982) b!1154311))

(assert (= (and b!1154311 res!766978) b!1154310))

(assert (= (and b!1154310 res!766979) b!1154312))

(assert (= (and b!1154312 res!766972) b!1154294))

(assert (= (and b!1154294 res!766981) b!1154297))

(assert (= (and b!1154297 res!766986) b!1154289))

(assert (= (and b!1154289 res!766974) b!1154313))

(assert (= (and b!1154313 res!766983) b!1154305))

(assert (= (and b!1154305 res!766984) b!1154307))

(assert (= (and b!1154307 (not res!766975)) b!1154309))

(assert (= (and b!1154309 (not res!766976)) b!1154302))

(assert (= (and b!1154302 c!114780) b!1154308))

(assert (= (and b!1154302 (not c!114780)) b!1154290))

(assert (= (or b!1154308 b!1154290) bm!54302))

(assert (= (or b!1154308 b!1154290) bm!54298))

(assert (= (and b!1154302 (not res!766973)) b!1154314))

(assert (= (and b!1154314 c!114775) b!1154287))

(assert (= (and b!1154314 (not c!114775)) b!1154316))

(assert (= (and b!1154287 c!114776) b!1154304))

(assert (= (and b!1154287 (not c!114776)) b!1154315))

(assert (= (and b!1154315 c!114778) b!1154306))

(assert (= (and b!1154315 (not c!114778)) b!1154293))

(assert (= (and b!1154293 c!114779) b!1154288))

(assert (= (and b!1154293 (not c!114779)) b!1154295))

(assert (= (or b!1154306 b!1154288) bm!54300))

(assert (= (or b!1154306 b!1154288) bm!54301))

(assert (= (or b!1154306 b!1154288) bm!54297))

(assert (= (or b!1154304 bm!54297) bm!54303))

(assert (= (or b!1154304 bm!54300) bm!54296))

(assert (= (or b!1154304 bm!54301) bm!54299))

(assert (= (and b!1154287 c!114777) b!1154300))

(assert (= (and b!1154287 (not c!114777)) b!1154298))

(assert (= (and b!1154287 res!766977) b!1154292))

(assert (= (and b!1154314 res!766985) b!1154291))

(assert (= (and b!1154299 condMapEmpty!45206) mapIsEmpty!45206))

(assert (= (and b!1154299 (not condMapEmpty!45206)) mapNonEmpty!45206))

(get-info :version)

(assert (= (and mapNonEmpty!45206 ((_ is ValueCellFull!13751) mapValue!45206)) b!1154301))

(assert (= (and b!1154299 ((_ is ValueCellFull!13751) mapDefault!45206)) b!1154303))

(assert (= start!99022 b!1154299))

(declare-fun b_lambda!19491 () Bool)

(assert (=> (not b_lambda!19491) (not b!1154309)))

(declare-fun t!36583 () Bool)

(declare-fun tb!9195 () Bool)

(assert (=> (and start!99022 (= defaultEntry!1004 defaultEntry!1004) t!36583) tb!9195))

(declare-fun result!18963 () Bool)

(assert (=> tb!9195 (= result!18963 tp_is_empty!28921)))

(assert (=> b!1154309 t!36583))

(declare-fun b_and!39635 () Bool)

(assert (= b_and!39633 (and (=> t!36583 result!18963) b_and!39635)))

(declare-fun m!1064473 () Bool)

(assert (=> start!99022 m!1064473))

(declare-fun m!1064475 () Bool)

(assert (=> start!99022 m!1064475))

(declare-fun m!1064477 () Bool)

(assert (=> b!1154304 m!1064477))

(declare-fun m!1064479 () Bool)

(assert (=> b!1154304 m!1064479))

(declare-fun m!1064481 () Bool)

(assert (=> b!1154304 m!1064481))

(declare-fun m!1064483 () Bool)

(assert (=> mapNonEmpty!45206 m!1064483))

(declare-fun m!1064485 () Bool)

(assert (=> b!1154287 m!1064485))

(declare-fun m!1064487 () Bool)

(assert (=> b!1154287 m!1064487))

(declare-fun m!1064489 () Bool)

(assert (=> b!1154287 m!1064489))

(declare-fun m!1064491 () Bool)

(assert (=> b!1154287 m!1064491))

(declare-fun m!1064493 () Bool)

(assert (=> b!1154314 m!1064493))

(declare-fun m!1064495 () Bool)

(assert (=> b!1154314 m!1064495))

(declare-fun m!1064497 () Bool)

(assert (=> b!1154314 m!1064497))

(declare-fun m!1064499 () Bool)

(assert (=> b!1154314 m!1064499))

(assert (=> b!1154314 m!1064499))

(declare-fun m!1064501 () Bool)

(assert (=> b!1154314 m!1064501))

(declare-fun m!1064503 () Bool)

(assert (=> b!1154314 m!1064503))

(declare-fun m!1064505 () Bool)

(assert (=> b!1154314 m!1064505))

(assert (=> b!1154314 m!1064501))

(declare-fun m!1064507 () Bool)

(assert (=> b!1154314 m!1064507))

(assert (=> b!1154314 m!1064495))

(declare-fun m!1064509 () Bool)

(assert (=> b!1154314 m!1064509))

(assert (=> b!1154314 m!1064501))

(declare-fun m!1064511 () Bool)

(assert (=> b!1154289 m!1064511))

(declare-fun m!1064513 () Bool)

(assert (=> bm!54302 m!1064513))

(declare-fun m!1064515 () Bool)

(assert (=> b!1154297 m!1064515))

(declare-fun m!1064517 () Bool)

(assert (=> b!1154310 m!1064517))

(declare-fun m!1064519 () Bool)

(assert (=> b!1154305 m!1064519))

(declare-fun m!1064521 () Bool)

(assert (=> b!1154308 m!1064521))

(declare-fun m!1064523 () Bool)

(assert (=> b!1154307 m!1064523))

(declare-fun m!1064525 () Bool)

(assert (=> b!1154307 m!1064525))

(declare-fun m!1064527 () Bool)

(assert (=> bm!54299 m!1064527))

(declare-fun m!1064529 () Bool)

(assert (=> b!1154292 m!1064529))

(declare-fun m!1064531 () Bool)

(assert (=> b!1154312 m!1064531))

(declare-fun m!1064533 () Bool)

(assert (=> b!1154296 m!1064533))

(declare-fun m!1064535 () Bool)

(assert (=> b!1154309 m!1064535))

(declare-fun m!1064537 () Bool)

(assert (=> b!1154309 m!1064537))

(declare-fun m!1064539 () Bool)

(assert (=> b!1154309 m!1064539))

(declare-fun m!1064541 () Bool)

(assert (=> b!1154309 m!1064541))

(assert (=> b!1154302 m!1064501))

(declare-fun m!1064543 () Bool)

(assert (=> b!1154302 m!1064543))

(declare-fun m!1064545 () Bool)

(assert (=> bm!54303 m!1064545))

(declare-fun m!1064547 () Bool)

(assert (=> bm!54296 m!1064547))

(assert (=> b!1154300 m!1064529))

(assert (=> bm!54298 m!1064493))

(assert (=> b!1154291 m!1064513))

(declare-fun m!1064549 () Bool)

(assert (=> b!1154313 m!1064549))

(declare-fun m!1064551 () Bool)

(assert (=> b!1154313 m!1064551))

(check-sat (not b!1154300) tp_is_empty!28921 (not b!1154296) (not b!1154291) (not b!1154309) (not b!1154310) (not b!1154308) (not b_lambda!19491) (not bm!54299) (not b!1154287) (not b!1154313) (not bm!54303) (not b!1154305) (not b!1154307) b_and!39635 (not b!1154292) (not b_next!24391) (not b!1154304) (not mapNonEmpty!45206) (not bm!54298) (not b!1154302) (not start!99022) (not b!1154297) (not bm!54296) (not bm!54302) (not b!1154314) (not b!1154312))
(check-sat b_and!39635 (not b_next!24391))
