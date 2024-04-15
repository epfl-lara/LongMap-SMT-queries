; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98810 () Bool)

(assert start!98810)

(declare-fun b_free!24421 () Bool)

(declare-fun b_next!24421 () Bool)

(assert (=> start!98810 (= b_free!24421 (not b_next!24421))))

(declare-fun tp!85974 () Bool)

(declare-fun b_and!39669 () Bool)

(assert (=> start!98810 (= tp!85974 b_and!39669)))

(declare-fun b!1154254 () Bool)

(declare-datatypes ((Unit!37833 0))(
  ( (Unit!37834) )
))
(declare-fun e!656441 () Unit!37833)

(declare-fun Unit!37835 () Unit!37833)

(assert (=> b!1154254 (= e!656441 Unit!37835)))

(declare-fun lt!517445 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1154254 (= lt!517445 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114623 () Bool)

(assert (=> b!1154254 (= c!114623 (and (not lt!517445) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517434 () Unit!37833)

(declare-fun e!656449 () Unit!37833)

(assert (=> b!1154254 (= lt!517434 e!656449)))

(declare-datatypes ((V!43729 0))(
  ( (V!43730 (val!14532 Int)) )
))
(declare-fun zeroValue!944 () V!43729)

(declare-datatypes ((array!74666 0))(
  ( (array!74667 (arr!35984 (Array (_ BitVec 32) (_ BitVec 64))) (size!36522 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74666)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13766 0))(
  ( (ValueCellFull!13766 (v!17168 V!43729)) (EmptyCell!13766) )
))
(declare-datatypes ((array!74668 0))(
  ( (array!74669 (arr!35985 (Array (_ BitVec 32) ValueCell!13766)) (size!36523 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74668)

(declare-fun minValue!944 () V!43729)

(declare-fun lt!517446 () Unit!37833)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!483 (array!74666 array!74668 (_ BitVec 32) (_ BitVec 32) V!43729 V!43729 (_ BitVec 64) (_ BitVec 32) Int) Unit!37833)

(assert (=> b!1154254 (= lt!517446 (lemmaListMapContainsThenArrayContainsFrom!483 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114626 () Bool)

(assert (=> b!1154254 (= c!114626 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767082 () Bool)

(declare-fun e!656445 () Bool)

(assert (=> b!1154254 (= res!767082 e!656445)))

(declare-fun e!656457 () Bool)

(assert (=> b!1154254 (=> (not res!767082) (not e!656457))))

(assert (=> b!1154254 e!656457))

(declare-fun lt!517451 () Unit!37833)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74666 (_ BitVec 32) (_ BitVec 32)) Unit!37833)

(assert (=> b!1154254 (= lt!517451 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25278 0))(
  ( (Nil!25275) (Cons!25274 (h!26483 (_ BitVec 64)) (t!36682 List!25278)) )
))
(declare-fun arrayNoDuplicates!0 (array!74666 (_ BitVec 32) List!25278) Bool)

(assert (=> b!1154254 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25275)))

(declare-fun lt!517450 () Unit!37833)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74666 (_ BitVec 64) (_ BitVec 32) List!25278) Unit!37833)

(assert (=> b!1154254 (= lt!517450 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25275))))

(assert (=> b!1154254 false))

(declare-fun b!1154255 () Bool)

(declare-fun e!656451 () Bool)

(declare-fun tp_is_empty!28951 () Bool)

(assert (=> b!1154255 (= e!656451 tp_is_empty!28951)))

(declare-fun b!1154256 () Bool)

(declare-fun res!767074 () Bool)

(declare-fun e!656453 () Bool)

(assert (=> b!1154256 (=> (not res!767074) (not e!656453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1154256 (= res!767074 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!45251 () Bool)

(declare-fun mapRes!45251 () Bool)

(declare-fun tp!85973 () Bool)

(declare-fun e!656452 () Bool)

(assert (=> mapNonEmpty!45251 (= mapRes!45251 (and tp!85973 e!656452))))

(declare-fun mapKey!45251 () (_ BitVec 32))

(declare-fun mapValue!45251 () ValueCell!13766)

(declare-fun mapRest!45251 () (Array (_ BitVec 32) ValueCell!13766))

(assert (=> mapNonEmpty!45251 (= (arr!35985 _values!996) (store mapRest!45251 mapKey!45251 mapValue!45251))))

(declare-fun bm!54568 () Bool)

(declare-datatypes ((tuple2!18548 0))(
  ( (tuple2!18549 (_1!9285 (_ BitVec 64)) (_2!9285 V!43729)) )
))
(declare-datatypes ((List!25279 0))(
  ( (Nil!25276) (Cons!25275 (h!26484 tuple2!18548) (t!36683 List!25279)) )
))
(declare-datatypes ((ListLongMap!16517 0))(
  ( (ListLongMap!16518 (toList!8274 List!25279)) )
))
(declare-fun call!54574 () ListLongMap!16517)

(declare-fun call!54572 () ListLongMap!16517)

(assert (=> bm!54568 (= call!54574 call!54572)))

(declare-fun b!1154257 () Bool)

(assert (=> b!1154257 (= e!656445 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517445) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1154258 () Bool)

(declare-fun c!114625 () Bool)

(assert (=> b!1154258 (= c!114625 (and (not lt!517445) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!656444 () Unit!37833)

(assert (=> b!1154258 (= e!656449 e!656444)))

(declare-fun mapIsEmpty!45251 () Bool)

(assert (=> mapIsEmpty!45251 mapRes!45251))

(declare-fun b!1154259 () Bool)

(declare-fun lt!517437 () Unit!37833)

(assert (=> b!1154259 (= e!656444 lt!517437)))

(declare-fun call!54576 () Unit!37833)

(assert (=> b!1154259 (= lt!517437 call!54576)))

(declare-fun call!54573 () Bool)

(assert (=> b!1154259 call!54573))

(declare-fun b!1154260 () Bool)

(declare-fun res!767085 () Bool)

(assert (=> b!1154260 (=> (not res!767085) (not e!656453))))

(assert (=> b!1154260 (= res!767085 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25275))))

(declare-fun b!1154261 () Bool)

(declare-fun e!656450 () Bool)

(assert (=> b!1154261 (= e!656450 true)))

(declare-fun e!656454 () Bool)

(assert (=> b!1154261 e!656454))

(declare-fun res!767084 () Bool)

(assert (=> b!1154261 (=> (not res!767084) (not e!656454))))

(declare-fun lt!517436 () ListLongMap!16517)

(declare-fun lt!517443 () ListLongMap!16517)

(assert (=> b!1154261 (= res!767084 (= lt!517436 lt!517443))))

(declare-fun lt!517438 () ListLongMap!16517)

(declare-fun -!1333 (ListLongMap!16517 (_ BitVec 64)) ListLongMap!16517)

(assert (=> b!1154261 (= lt!517436 (-!1333 lt!517438 k0!934))))

(declare-fun lt!517452 () V!43729)

(declare-fun +!3685 (ListLongMap!16517 tuple2!18548) ListLongMap!16517)

(assert (=> b!1154261 (= (-!1333 (+!3685 lt!517443 (tuple2!18549 (select (arr!35984 _keys!1208) from!1455) lt!517452)) (select (arr!35984 _keys!1208) from!1455)) lt!517443)))

(declare-fun lt!517455 () Unit!37833)

(declare-fun addThenRemoveForNewKeyIsSame!186 (ListLongMap!16517 (_ BitVec 64) V!43729) Unit!37833)

(assert (=> b!1154261 (= lt!517455 (addThenRemoveForNewKeyIsSame!186 lt!517443 (select (arr!35984 _keys!1208) from!1455) lt!517452))))

(declare-fun lt!517453 () V!43729)

(declare-fun get!18340 (ValueCell!13766 V!43729) V!43729)

(assert (=> b!1154261 (= lt!517452 (get!18340 (select (arr!35985 _values!996) from!1455) lt!517453))))

(declare-fun lt!517440 () Unit!37833)

(assert (=> b!1154261 (= lt!517440 e!656441)))

(declare-fun c!114624 () Bool)

(declare-fun contains!6726 (ListLongMap!16517 (_ BitVec 64)) Bool)

(assert (=> b!1154261 (= c!114624 (contains!6726 lt!517443 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4755 (array!74666 array!74668 (_ BitVec 32) (_ BitVec 32) V!43729 V!43729 (_ BitVec 32) Int) ListLongMap!16517)

(assert (=> b!1154261 (= lt!517443 (getCurrentListMapNoExtraKeys!4755 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154262 () Bool)

(declare-fun e!656456 () Bool)

(assert (=> b!1154262 (= e!656453 e!656456)))

(declare-fun res!767078 () Bool)

(assert (=> b!1154262 (=> (not res!767078) (not e!656456))))

(declare-fun lt!517447 () array!74666)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74666 (_ BitVec 32)) Bool)

(assert (=> b!1154262 (= res!767078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517447 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1154262 (= lt!517447 (array!74667 (store (arr!35984 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36522 _keys!1208)))))

(declare-fun bm!54569 () Bool)

(declare-fun call!54571 () Bool)

(assert (=> bm!54569 (= call!54573 call!54571)))

(declare-fun b!1154263 () Bool)

(declare-fun e!656448 () Bool)

(declare-fun call!54575 () ListLongMap!16517)

(declare-fun call!54578 () ListLongMap!16517)

(assert (=> b!1154263 (= e!656448 (= call!54575 call!54578))))

(declare-fun b!1154264 () Bool)

(declare-fun Unit!37836 () Unit!37833)

(assert (=> b!1154264 (= e!656441 Unit!37836)))

(declare-fun bm!54570 () Bool)

(declare-fun lt!517449 () ListLongMap!16517)

(assert (=> bm!54570 (= call!54571 (contains!6726 (ite c!114623 lt!517449 call!54574) k0!934))))

(declare-fun res!767081 () Bool)

(assert (=> start!98810 (=> (not res!767081) (not e!656453))))

(assert (=> start!98810 (= res!767081 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36522 _keys!1208))))))

(assert (=> start!98810 e!656453))

(assert (=> start!98810 tp_is_empty!28951))

(declare-fun array_inv!27650 (array!74666) Bool)

(assert (=> start!98810 (array_inv!27650 _keys!1208)))

(assert (=> start!98810 true))

(assert (=> start!98810 tp!85974))

(declare-fun e!656447 () Bool)

(declare-fun array_inv!27651 (array!74668) Bool)

(assert (=> start!98810 (and (array_inv!27651 _values!996) e!656447)))

(declare-fun b!1154265 () Bool)

(declare-fun e!656455 () Bool)

(assert (=> b!1154265 (= e!656455 e!656450)))

(declare-fun res!767076 () Bool)

(assert (=> b!1154265 (=> res!767076 e!656450)))

(assert (=> b!1154265 (= res!767076 (not (= (select (arr!35984 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1154265 e!656448))

(declare-fun c!114622 () Bool)

(assert (=> b!1154265 (= c!114622 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!517454 () Unit!37833)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!605 (array!74666 array!74668 (_ BitVec 32) (_ BitVec 32) V!43729 V!43729 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37833)

(assert (=> b!1154265 (= lt!517454 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!605 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154266 () Bool)

(assert (=> b!1154266 (= e!656447 (and e!656451 mapRes!45251))))

(declare-fun condMapEmpty!45251 () Bool)

(declare-fun mapDefault!45251 () ValueCell!13766)

(assert (=> b!1154266 (= condMapEmpty!45251 (= (arr!35985 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13766)) mapDefault!45251)))))

(declare-fun b!1154267 () Bool)

(declare-fun res!767083 () Bool)

(assert (=> b!1154267 (=> (not res!767083) (not e!656456))))

(assert (=> b!1154267 (= res!767083 (arrayNoDuplicates!0 lt!517447 #b00000000000000000000000000000000 Nil!25275))))

(declare-fun bm!54571 () Bool)

(declare-fun lt!517448 () array!74668)

(assert (=> bm!54571 (= call!54575 (getCurrentListMapNoExtraKeys!4755 lt!517447 lt!517448 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154268 () Bool)

(declare-fun res!767077 () Bool)

(assert (=> b!1154268 (=> (not res!767077) (not e!656453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1154268 (= res!767077 (validKeyInArray!0 k0!934))))

(declare-fun b!1154269 () Bool)

(declare-fun e!656442 () Bool)

(assert (=> b!1154269 (= e!656456 (not e!656442))))

(declare-fun res!767075 () Bool)

(assert (=> b!1154269 (=> res!767075 e!656442)))

(assert (=> b!1154269 (= res!767075 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154269 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!517442 () Unit!37833)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74666 (_ BitVec 64) (_ BitVec 32)) Unit!37833)

(assert (=> b!1154269 (= lt!517442 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1154270 () Bool)

(assert (=> b!1154270 (= e!656452 tp_is_empty!28951)))

(declare-fun b!1154271 () Bool)

(assert (=> b!1154271 (= e!656454 (= lt!517436 (getCurrentListMapNoExtraKeys!4755 lt!517447 lt!517448 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1154272 () Bool)

(declare-fun res!767087 () Bool)

(assert (=> b!1154272 (=> (not res!767087) (not e!656453))))

(assert (=> b!1154272 (= res!767087 (= (select (arr!35984 _keys!1208) i!673) k0!934))))

(declare-fun b!1154273 () Bool)

(declare-fun e!656446 () Unit!37833)

(declare-fun Unit!37837 () Unit!37833)

(assert (=> b!1154273 (= e!656446 Unit!37837)))

(declare-fun b!1154274 () Bool)

(assert (=> b!1154274 (= e!656444 e!656446)))

(declare-fun c!114621 () Bool)

(assert (=> b!1154274 (= c!114621 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517445))))

(declare-fun b!1154275 () Bool)

(assert (=> b!1154275 (= e!656457 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!54577 () Unit!37833)

(declare-fun bm!54572 () Bool)

(declare-fun addStillContains!897 (ListLongMap!16517 (_ BitVec 64) V!43729 (_ BitVec 64)) Unit!37833)

(assert (=> bm!54572 (= call!54577 (addStillContains!897 lt!517443 (ite (or c!114623 c!114625) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114623 c!114625) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!54573 () Bool)

(assert (=> bm!54573 (= call!54578 (getCurrentListMapNoExtraKeys!4755 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154276 () Bool)

(declare-fun res!767073 () Bool)

(assert (=> b!1154276 (=> (not res!767073) (not e!656453))))

(assert (=> b!1154276 (= res!767073 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36522 _keys!1208))))))

(declare-fun b!1154277 () Bool)

(assert (=> b!1154277 (= e!656445 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154278 () Bool)

(assert (=> b!1154278 (= e!656442 e!656455)))

(declare-fun res!767086 () Bool)

(assert (=> b!1154278 (=> res!767086 e!656455)))

(assert (=> b!1154278 (= res!767086 (not (= from!1455 i!673)))))

(declare-fun lt!517435 () ListLongMap!16517)

(assert (=> b!1154278 (= lt!517435 (getCurrentListMapNoExtraKeys!4755 lt!517447 lt!517448 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1154278 (= lt!517448 (array!74669 (store (arr!35985 _values!996) i!673 (ValueCellFull!13766 lt!517453)) (size!36523 _values!996)))))

(declare-fun dynLambda!2714 (Int (_ BitVec 64)) V!43729)

(assert (=> b!1154278 (= lt!517453 (dynLambda!2714 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1154278 (= lt!517438 (getCurrentListMapNoExtraKeys!4755 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!54574 () Bool)

(assert (=> bm!54574 (= call!54576 call!54577)))

(declare-fun b!1154279 () Bool)

(declare-fun res!767079 () Bool)

(assert (=> b!1154279 (=> (not res!767079) (not e!656453))))

(assert (=> b!1154279 (= res!767079 (and (= (size!36523 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36522 _keys!1208) (size!36523 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1154280 () Bool)

(assert (=> b!1154280 (contains!6726 call!54572 k0!934)))

(declare-fun lt!517444 () Unit!37833)

(assert (=> b!1154280 (= lt!517444 (addStillContains!897 lt!517449 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1154280 call!54571))

(assert (=> b!1154280 (= lt!517449 (+!3685 lt!517443 (tuple2!18549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!517439 () Unit!37833)

(assert (=> b!1154280 (= lt!517439 call!54577)))

(assert (=> b!1154280 (= e!656449 lt!517444)))

(declare-fun b!1154281 () Bool)

(assert (=> b!1154281 (= e!656448 (= call!54575 (-!1333 call!54578 k0!934)))))

(declare-fun b!1154282 () Bool)

(declare-fun res!767080 () Bool)

(assert (=> b!1154282 (=> (not res!767080) (not e!656453))))

(assert (=> b!1154282 (= res!767080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1154283 () Bool)

(assert (=> b!1154283 call!54573))

(declare-fun lt!517441 () Unit!37833)

(assert (=> b!1154283 (= lt!517441 call!54576)))

(assert (=> b!1154283 (= e!656446 lt!517441)))

(declare-fun bm!54575 () Bool)

(assert (=> bm!54575 (= call!54572 (+!3685 (ite c!114623 lt!517449 lt!517443) (ite c!114623 (tuple2!18549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114625 (tuple2!18549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and start!98810 res!767081) b!1154256))

(assert (= (and b!1154256 res!767074) b!1154279))

(assert (= (and b!1154279 res!767079) b!1154282))

(assert (= (and b!1154282 res!767080) b!1154260))

(assert (= (and b!1154260 res!767085) b!1154276))

(assert (= (and b!1154276 res!767073) b!1154268))

(assert (= (and b!1154268 res!767077) b!1154272))

(assert (= (and b!1154272 res!767087) b!1154262))

(assert (= (and b!1154262 res!767078) b!1154267))

(assert (= (and b!1154267 res!767083) b!1154269))

(assert (= (and b!1154269 (not res!767075)) b!1154278))

(assert (= (and b!1154278 (not res!767086)) b!1154265))

(assert (= (and b!1154265 c!114622) b!1154281))

(assert (= (and b!1154265 (not c!114622)) b!1154263))

(assert (= (or b!1154281 b!1154263) bm!54571))

(assert (= (or b!1154281 b!1154263) bm!54573))

(assert (= (and b!1154265 (not res!767076)) b!1154261))

(assert (= (and b!1154261 c!114624) b!1154254))

(assert (= (and b!1154261 (not c!114624)) b!1154264))

(assert (= (and b!1154254 c!114623) b!1154280))

(assert (= (and b!1154254 (not c!114623)) b!1154258))

(assert (= (and b!1154258 c!114625) b!1154259))

(assert (= (and b!1154258 (not c!114625)) b!1154274))

(assert (= (and b!1154274 c!114621) b!1154283))

(assert (= (and b!1154274 (not c!114621)) b!1154273))

(assert (= (or b!1154259 b!1154283) bm!54574))

(assert (= (or b!1154259 b!1154283) bm!54568))

(assert (= (or b!1154259 b!1154283) bm!54569))

(assert (= (or b!1154280 bm!54569) bm!54570))

(assert (= (or b!1154280 bm!54574) bm!54572))

(assert (= (or b!1154280 bm!54568) bm!54575))

(assert (= (and b!1154254 c!114626) b!1154277))

(assert (= (and b!1154254 (not c!114626)) b!1154257))

(assert (= (and b!1154254 res!767082) b!1154275))

(assert (= (and b!1154261 res!767084) b!1154271))

(assert (= (and b!1154266 condMapEmpty!45251) mapIsEmpty!45251))

(assert (= (and b!1154266 (not condMapEmpty!45251)) mapNonEmpty!45251))

(get-info :version)

(assert (= (and mapNonEmpty!45251 ((_ is ValueCellFull!13766) mapValue!45251)) b!1154270))

(assert (= (and b!1154266 ((_ is ValueCellFull!13766) mapDefault!45251)) b!1154255))

(assert (= start!98810 b!1154266))

(declare-fun b_lambda!19509 () Bool)

(assert (=> (not b_lambda!19509) (not b!1154278)))

(declare-fun t!36681 () Bool)

(declare-fun tb!9225 () Bool)

(assert (=> (and start!98810 (= defaultEntry!1004 defaultEntry!1004) t!36681) tb!9225))

(declare-fun result!19023 () Bool)

(assert (=> tb!9225 (= result!19023 tp_is_empty!28951)))

(assert (=> b!1154278 t!36681))

(declare-fun b_and!39671 () Bool)

(assert (= b_and!39669 (and (=> t!36681 result!19023) b_and!39671)))

(declare-fun m!1063507 () Bool)

(assert (=> bm!54573 m!1063507))

(declare-fun m!1063509 () Bool)

(assert (=> start!98810 m!1063509))

(declare-fun m!1063511 () Bool)

(assert (=> start!98810 m!1063511))

(declare-fun m!1063513 () Bool)

(assert (=> b!1154282 m!1063513))

(declare-fun m!1063515 () Bool)

(assert (=> b!1154269 m!1063515))

(declare-fun m!1063517 () Bool)

(assert (=> b!1154269 m!1063517))

(declare-fun m!1063519 () Bool)

(assert (=> b!1154277 m!1063519))

(declare-fun m!1063521 () Bool)

(assert (=> b!1154262 m!1063521))

(declare-fun m!1063523 () Bool)

(assert (=> b!1154262 m!1063523))

(declare-fun m!1063525 () Bool)

(assert (=> bm!54571 m!1063525))

(declare-fun m!1063527 () Bool)

(assert (=> b!1154278 m!1063527))

(declare-fun m!1063529 () Bool)

(assert (=> b!1154278 m!1063529))

(declare-fun m!1063531 () Bool)

(assert (=> b!1154278 m!1063531))

(declare-fun m!1063533 () Bool)

(assert (=> b!1154278 m!1063533))

(declare-fun m!1063535 () Bool)

(assert (=> b!1154267 m!1063535))

(declare-fun m!1063537 () Bool)

(assert (=> bm!54575 m!1063537))

(declare-fun m!1063539 () Bool)

(assert (=> bm!54572 m!1063539))

(assert (=> b!1154261 m!1063507))

(declare-fun m!1063541 () Bool)

(assert (=> b!1154261 m!1063541))

(declare-fun m!1063543 () Bool)

(assert (=> b!1154261 m!1063543))

(declare-fun m!1063545 () Bool)

(assert (=> b!1154261 m!1063545))

(declare-fun m!1063547 () Bool)

(assert (=> b!1154261 m!1063547))

(assert (=> b!1154261 m!1063541))

(declare-fun m!1063549 () Bool)

(assert (=> b!1154261 m!1063549))

(assert (=> b!1154261 m!1063547))

(assert (=> b!1154261 m!1063543))

(declare-fun m!1063551 () Bool)

(assert (=> b!1154261 m!1063551))

(declare-fun m!1063553 () Bool)

(assert (=> b!1154261 m!1063553))

(assert (=> b!1154261 m!1063543))

(declare-fun m!1063555 () Bool)

(assert (=> b!1154261 m!1063555))

(declare-fun m!1063557 () Bool)

(assert (=> b!1154260 m!1063557))

(declare-fun m!1063559 () Bool)

(assert (=> b!1154254 m!1063559))

(declare-fun m!1063561 () Bool)

(assert (=> b!1154254 m!1063561))

(declare-fun m!1063563 () Bool)

(assert (=> b!1154254 m!1063563))

(declare-fun m!1063565 () Bool)

(assert (=> b!1154254 m!1063565))

(assert (=> b!1154271 m!1063525))

(declare-fun m!1063567 () Bool)

(assert (=> b!1154268 m!1063567))

(assert (=> b!1154275 m!1063519))

(assert (=> b!1154265 m!1063543))

(declare-fun m!1063569 () Bool)

(assert (=> b!1154265 m!1063569))

(declare-fun m!1063571 () Bool)

(assert (=> b!1154280 m!1063571))

(declare-fun m!1063573 () Bool)

(assert (=> b!1154280 m!1063573))

(declare-fun m!1063575 () Bool)

(assert (=> b!1154280 m!1063575))

(declare-fun m!1063577 () Bool)

(assert (=> bm!54570 m!1063577))

(declare-fun m!1063579 () Bool)

(assert (=> b!1154256 m!1063579))

(declare-fun m!1063581 () Bool)

(assert (=> mapNonEmpty!45251 m!1063581))

(declare-fun m!1063583 () Bool)

(assert (=> b!1154281 m!1063583))

(declare-fun m!1063585 () Bool)

(assert (=> b!1154272 m!1063585))

(check-sat (not b!1154281) tp_is_empty!28951 (not b!1154268) (not b!1154277) (not b!1154254) (not b!1154271) (not mapNonEmpty!45251) (not b!1154269) (not start!98810) (not b!1154260) (not b!1154280) (not b!1154278) (not b!1154282) (not bm!54573) (not b_lambda!19509) b_and!39671 (not b!1154275) (not b!1154261) (not bm!54571) (not b!1154267) (not bm!54575) (not b!1154262) (not bm!54572) (not b_next!24421) (not b!1154265) (not bm!54570) (not b!1154256))
(check-sat b_and!39671 (not b_next!24421))
