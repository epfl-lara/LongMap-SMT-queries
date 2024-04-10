; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98644 () Bool)

(assert start!98644)

(declare-fun b_free!24249 () Bool)

(declare-fun b_next!24249 () Bool)

(assert (=> start!98644 (= b_free!24249 (not b_next!24249))))

(declare-fun tp!85457 () Bool)

(declare-fun b_and!39347 () Bool)

(assert (=> start!98644 (= tp!85457 b_and!39347)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1146466 () Bool)

(declare-fun lt!512055 () Bool)

(declare-fun e!652134 () Bool)

(assert (=> b!1146466 (= e!652134 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512055) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!52527 () Bool)

(declare-datatypes ((V!43499 0))(
  ( (V!43500 (val!14446 Int)) )
))
(declare-datatypes ((tuple2!18304 0))(
  ( (tuple2!18305 (_1!9163 (_ BitVec 64)) (_2!9163 V!43499)) )
))
(declare-datatypes ((List!25055 0))(
  ( (Nil!25052) (Cons!25051 (h!26260 tuple2!18304) (t!36296 List!25055)) )
))
(declare-datatypes ((ListLongMap!16273 0))(
  ( (ListLongMap!16274 (toList!8152 List!25055)) )
))
(declare-fun call!52535 () ListLongMap!16273)

(declare-fun call!52534 () Bool)

(declare-fun c!113104 () Bool)

(declare-fun lt!512053 () ListLongMap!16273)

(declare-fun contains!6677 (ListLongMap!16273 (_ BitVec 64)) Bool)

(assert (=> bm!52527 (= call!52534 (contains!6677 (ite c!113104 lt!512053 call!52535) k0!934))))

(declare-fun mapIsEmpty!44993 () Bool)

(declare-fun mapRes!44993 () Bool)

(assert (=> mapIsEmpty!44993 mapRes!44993))

(declare-fun b!1146467 () Bool)

(declare-fun e!652141 () Bool)

(declare-fun e!652135 () Bool)

(assert (=> b!1146467 (= e!652141 e!652135)))

(declare-fun res!763279 () Bool)

(assert (=> b!1146467 (=> res!763279 e!652135)))

(declare-datatypes ((array!74405 0))(
  ( (array!74406 (arr!35853 (Array (_ BitVec 32) (_ BitVec 64))) (size!36389 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74405)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1146467 (= res!763279 (not (= (select (arr!35853 _keys!1208) from!1455) k0!934)))))

(declare-fun e!652140 () Bool)

(assert (=> b!1146467 e!652140))

(declare-fun c!113099 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1146467 (= c!113099 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43499)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!37644 0))(
  ( (Unit!37645) )
))
(declare-fun lt!512038 () Unit!37644)

(declare-datatypes ((ValueCell!13680 0))(
  ( (ValueCellFull!13680 (v!17083 V!43499)) (EmptyCell!13680) )
))
(declare-datatypes ((array!74407 0))(
  ( (array!74408 (arr!35854 (Array (_ BitVec 32) ValueCell!13680)) (size!36390 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74407)

(declare-fun minValue!944 () V!43499)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!528 (array!74405 array!74407 (_ BitVec 32) (_ BitVec 32) V!43499 V!43499 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37644)

(assert (=> b!1146467 (= lt!512038 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!528 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146468 () Bool)

(declare-fun res!763283 () Bool)

(declare-fun e!652148 () Bool)

(assert (=> b!1146468 (=> (not res!763283) (not e!652148))))

(declare-fun lt!512048 () array!74405)

(declare-datatypes ((List!25056 0))(
  ( (Nil!25053) (Cons!25052 (h!26261 (_ BitVec 64)) (t!36297 List!25056)) )
))
(declare-fun arrayNoDuplicates!0 (array!74405 (_ BitVec 32) List!25056) Bool)

(assert (=> b!1146468 (= res!763283 (arrayNoDuplicates!0 lt!512048 #b00000000000000000000000000000000 Nil!25053))))

(declare-fun b!1146469 () Bool)

(declare-fun e!652149 () Bool)

(assert (=> b!1146469 (= e!652149 e!652148)))

(declare-fun res!763270 () Bool)

(assert (=> b!1146469 (=> (not res!763270) (not e!652148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74405 (_ BitVec 32)) Bool)

(assert (=> b!1146469 (= res!763270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512048 mask!1564))))

(assert (=> b!1146469 (= lt!512048 (array!74406 (store (arr!35853 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36389 _keys!1208)))))

(declare-fun b!1146470 () Bool)

(declare-fun e!652137 () Bool)

(assert (=> b!1146470 (= e!652137 e!652141)))

(declare-fun res!763280 () Bool)

(assert (=> b!1146470 (=> res!763280 e!652141)))

(assert (=> b!1146470 (= res!763280 (not (= from!1455 i!673)))))

(declare-fun lt!512039 () ListLongMap!16273)

(declare-fun lt!512042 () array!74407)

(declare-fun getCurrentListMapNoExtraKeys!4626 (array!74405 array!74407 (_ BitVec 32) (_ BitVec 32) V!43499 V!43499 (_ BitVec 32) Int) ListLongMap!16273)

(assert (=> b!1146470 (= lt!512039 (getCurrentListMapNoExtraKeys!4626 lt!512048 lt!512042 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!512046 () V!43499)

(assert (=> b!1146470 (= lt!512042 (array!74408 (store (arr!35854 _values!996) i!673 (ValueCellFull!13680 lt!512046)) (size!36390 _values!996)))))

(declare-fun dynLambda!2659 (Int (_ BitVec 64)) V!43499)

(assert (=> b!1146470 (= lt!512046 (dynLambda!2659 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!512041 () ListLongMap!16273)

(assert (=> b!1146470 (= lt!512041 (getCurrentListMapNoExtraKeys!4626 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1146471 () Bool)

(declare-fun e!652138 () Unit!37644)

(declare-fun Unit!37646 () Unit!37644)

(assert (=> b!1146471 (= e!652138 Unit!37646)))

(assert (=> b!1146471 (= lt!512055 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1146471 (= c!113104 (and (not lt!512055) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512049 () Unit!37644)

(declare-fun e!652142 () Unit!37644)

(assert (=> b!1146471 (= lt!512049 e!652142)))

(declare-fun lt!512043 () Unit!37644)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!422 (array!74405 array!74407 (_ BitVec 32) (_ BitVec 32) V!43499 V!43499 (_ BitVec 64) (_ BitVec 32) Int) Unit!37644)

(assert (=> b!1146471 (= lt!512043 (lemmaListMapContainsThenArrayContainsFrom!422 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113100 () Bool)

(assert (=> b!1146471 (= c!113100 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763278 () Bool)

(assert (=> b!1146471 (= res!763278 e!652134)))

(declare-fun e!652139 () Bool)

(assert (=> b!1146471 (=> (not res!763278) (not e!652139))))

(assert (=> b!1146471 e!652139))

(declare-fun lt!512050 () Unit!37644)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74405 (_ BitVec 32) (_ BitVec 32)) Unit!37644)

(assert (=> b!1146471 (= lt!512050 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1146471 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25053)))

(declare-fun lt!512051 () Unit!37644)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74405 (_ BitVec 64) (_ BitVec 32) List!25056) Unit!37644)

(assert (=> b!1146471 (= lt!512051 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25053))))

(assert (=> b!1146471 false))

(declare-fun b!1146472 () Bool)

(declare-fun res!763273 () Bool)

(assert (=> b!1146472 (=> (not res!763273) (not e!652149))))

(assert (=> b!1146472 (= res!763273 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25053))))

(declare-fun bm!52528 () Bool)

(declare-fun call!52531 () Unit!37644)

(declare-fun call!52530 () Unit!37644)

(assert (=> bm!52528 (= call!52531 call!52530)))

(declare-fun b!1146473 () Bool)

(declare-fun res!763277 () Bool)

(assert (=> b!1146473 (=> (not res!763277) (not e!652149))))

(assert (=> b!1146473 (= res!763277 (= (select (arr!35853 _keys!1208) i!673) k0!934))))

(declare-fun bm!52529 () Bool)

(declare-fun call!52537 () Bool)

(assert (=> bm!52529 (= call!52537 call!52534)))

(declare-fun b!1146474 () Bool)

(declare-fun e!652147 () Bool)

(declare-fun tp_is_empty!28779 () Bool)

(assert (=> b!1146474 (= e!652147 tp_is_empty!28779)))

(declare-fun call!52532 () ListLongMap!16273)

(declare-fun bm!52530 () Bool)

(assert (=> bm!52530 (= call!52532 (getCurrentListMapNoExtraKeys!4626 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146475 () Bool)

(declare-fun e!652136 () Bool)

(assert (=> b!1146475 (= e!652136 tp_is_empty!28779)))

(declare-fun b!1146476 () Bool)

(declare-fun lt!512054 () ListLongMap!16273)

(declare-fun e!652144 () Bool)

(declare-fun -!1289 (ListLongMap!16273 (_ BitVec 64)) ListLongMap!16273)

(assert (=> b!1146476 (= e!652144 (= (-!1289 lt!512041 k0!934) lt!512054))))

(declare-fun res!763281 () Bool)

(assert (=> start!98644 (=> (not res!763281) (not e!652149))))

(assert (=> start!98644 (= res!763281 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36389 _keys!1208))))))

(assert (=> start!98644 e!652149))

(assert (=> start!98644 tp_is_empty!28779))

(declare-fun array_inv!27466 (array!74405) Bool)

(assert (=> start!98644 (array_inv!27466 _keys!1208)))

(assert (=> start!98644 true))

(assert (=> start!98644 tp!85457))

(declare-fun e!652143 () Bool)

(declare-fun array_inv!27467 (array!74407) Bool)

(assert (=> start!98644 (and (array_inv!27467 _values!996) e!652143)))

(declare-fun bm!52531 () Bool)

(declare-fun call!52536 () ListLongMap!16273)

(assert (=> bm!52531 (= call!52536 (getCurrentListMapNoExtraKeys!4626 lt!512048 lt!512042 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146477 () Bool)

(declare-fun res!763276 () Bool)

(assert (=> b!1146477 (=> (not res!763276) (not e!652149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1146477 (= res!763276 (validKeyInArray!0 k0!934))))

(declare-fun b!1146478 () Bool)

(declare-fun res!763272 () Bool)

(assert (=> b!1146478 (=> (not res!763272) (not e!652149))))

(assert (=> b!1146478 (= res!763272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1146479 () Bool)

(assert (=> b!1146479 (= e!652143 (and e!652136 mapRes!44993))))

(declare-fun condMapEmpty!44993 () Bool)

(declare-fun mapDefault!44993 () ValueCell!13680)

(assert (=> b!1146479 (= condMapEmpty!44993 (= (arr!35854 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13680)) mapDefault!44993)))))

(declare-fun b!1146480 () Bool)

(assert (=> b!1146480 (= e!652148 (not e!652137))))

(declare-fun res!763274 () Bool)

(assert (=> b!1146480 (=> res!763274 e!652137)))

(assert (=> b!1146480 (= res!763274 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146480 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!512045 () Unit!37644)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74405 (_ BitVec 64) (_ BitVec 32)) Unit!37644)

(assert (=> b!1146480 (= lt!512045 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1146481 () Bool)

(assert (=> b!1146481 (= e!652140 (= call!52536 call!52532))))

(declare-fun b!1146482 () Bool)

(declare-fun e!652133 () Unit!37644)

(declare-fun Unit!37647 () Unit!37644)

(assert (=> b!1146482 (= e!652133 Unit!37647)))

(declare-fun b!1146483 () Bool)

(assert (=> b!1146483 (= e!652134 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146484 () Bool)

(declare-fun res!763269 () Bool)

(assert (=> b!1146484 (=> (not res!763269) (not e!652149))))

(assert (=> b!1146484 (= res!763269 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36389 _keys!1208))))))

(declare-fun b!1146485 () Bool)

(declare-fun +!3576 (ListLongMap!16273 tuple2!18304) ListLongMap!16273)

(assert (=> b!1146485 (contains!6677 (+!3576 lt!512053 (tuple2!18305 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!512036 () Unit!37644)

(declare-fun addStillContains!829 (ListLongMap!16273 (_ BitVec 64) V!43499 (_ BitVec 64)) Unit!37644)

(assert (=> b!1146485 (= lt!512036 (addStillContains!829 lt!512053 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1146485 call!52534))

(declare-fun call!52533 () ListLongMap!16273)

(assert (=> b!1146485 (= lt!512053 call!52533)))

(declare-fun lt!512035 () Unit!37644)

(assert (=> b!1146485 (= lt!512035 call!52530)))

(assert (=> b!1146485 (= e!652142 lt!512036)))

(declare-fun c!113103 () Bool)

(declare-fun bm!52532 () Bool)

(assert (=> bm!52532 (= call!52530 (addStillContains!829 lt!512054 (ite (or c!113104 c!113103) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113104 c!113103) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1146486 () Bool)

(assert (=> b!1146486 call!52537))

(declare-fun lt!512047 () Unit!37644)

(assert (=> b!1146486 (= lt!512047 call!52531)))

(assert (=> b!1146486 (= e!652133 lt!512047)))

(declare-fun bm!52533 () Bool)

(assert (=> bm!52533 (= call!52533 (+!3576 lt!512054 (ite (or c!113104 c!113103) (tuple2!18305 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18305 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1146487 () Bool)

(assert (=> b!1146487 (= c!113103 (and (not lt!512055) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!652146 () Unit!37644)

(assert (=> b!1146487 (= e!652142 e!652146)))

(declare-fun b!1146488 () Bool)

(declare-fun lt!512044 () Unit!37644)

(assert (=> b!1146488 (= e!652146 lt!512044)))

(assert (=> b!1146488 (= lt!512044 call!52531)))

(assert (=> b!1146488 call!52537))

(declare-fun mapNonEmpty!44993 () Bool)

(declare-fun tp!85458 () Bool)

(assert (=> mapNonEmpty!44993 (= mapRes!44993 (and tp!85458 e!652147))))

(declare-fun mapRest!44993 () (Array (_ BitVec 32) ValueCell!13680))

(declare-fun mapValue!44993 () ValueCell!13680)

(declare-fun mapKey!44993 () (_ BitVec 32))

(assert (=> mapNonEmpty!44993 (= (arr!35854 _values!996) (store mapRest!44993 mapKey!44993 mapValue!44993))))

(declare-fun b!1146489 () Bool)

(assert (=> b!1146489 (= e!652146 e!652133)))

(declare-fun c!113102 () Bool)

(assert (=> b!1146489 (= c!113102 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512055))))

(declare-fun b!1146490 () Bool)

(declare-fun Unit!37648 () Unit!37644)

(assert (=> b!1146490 (= e!652138 Unit!37648)))

(declare-fun b!1146491 () Bool)

(assert (=> b!1146491 (= e!652140 (= call!52536 (-!1289 call!52532 k0!934)))))

(declare-fun bm!52534 () Bool)

(assert (=> bm!52534 (= call!52535 call!52533)))

(declare-fun b!1146492 () Bool)

(assert (=> b!1146492 (= e!652135 true)))

(assert (=> b!1146492 e!652144))

(declare-fun res!763282 () Bool)

(assert (=> b!1146492 (=> (not res!763282) (not e!652144))))

(declare-fun lt!512052 () V!43499)

(assert (=> b!1146492 (= res!763282 (= (-!1289 (+!3576 lt!512054 (tuple2!18305 (select (arr!35853 _keys!1208) from!1455) lt!512052)) (select (arr!35853 _keys!1208) from!1455)) lt!512054))))

(declare-fun lt!512040 () Unit!37644)

(declare-fun addThenRemoveForNewKeyIsSame!138 (ListLongMap!16273 (_ BitVec 64) V!43499) Unit!37644)

(assert (=> b!1146492 (= lt!512040 (addThenRemoveForNewKeyIsSame!138 lt!512054 (select (arr!35853 _keys!1208) from!1455) lt!512052))))

(declare-fun get!18234 (ValueCell!13680 V!43499) V!43499)

(assert (=> b!1146492 (= lt!512052 (get!18234 (select (arr!35854 _values!996) from!1455) lt!512046))))

(declare-fun lt!512037 () Unit!37644)

(assert (=> b!1146492 (= lt!512037 e!652138)))

(declare-fun c!113101 () Bool)

(assert (=> b!1146492 (= c!113101 (contains!6677 lt!512054 k0!934))))

(assert (=> b!1146492 (= lt!512054 (getCurrentListMapNoExtraKeys!4626 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146493 () Bool)

(assert (=> b!1146493 (= e!652139 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146494 () Bool)

(declare-fun res!763275 () Bool)

(assert (=> b!1146494 (=> (not res!763275) (not e!652149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146494 (= res!763275 (validMask!0 mask!1564))))

(declare-fun b!1146495 () Bool)

(declare-fun res!763271 () Bool)

(assert (=> b!1146495 (=> (not res!763271) (not e!652149))))

(assert (=> b!1146495 (= res!763271 (and (= (size!36390 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36389 _keys!1208) (size!36390 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98644 res!763281) b!1146494))

(assert (= (and b!1146494 res!763275) b!1146495))

(assert (= (and b!1146495 res!763271) b!1146478))

(assert (= (and b!1146478 res!763272) b!1146472))

(assert (= (and b!1146472 res!763273) b!1146484))

(assert (= (and b!1146484 res!763269) b!1146477))

(assert (= (and b!1146477 res!763276) b!1146473))

(assert (= (and b!1146473 res!763277) b!1146469))

(assert (= (and b!1146469 res!763270) b!1146468))

(assert (= (and b!1146468 res!763283) b!1146480))

(assert (= (and b!1146480 (not res!763274)) b!1146470))

(assert (= (and b!1146470 (not res!763280)) b!1146467))

(assert (= (and b!1146467 c!113099) b!1146491))

(assert (= (and b!1146467 (not c!113099)) b!1146481))

(assert (= (or b!1146491 b!1146481) bm!52531))

(assert (= (or b!1146491 b!1146481) bm!52530))

(assert (= (and b!1146467 (not res!763279)) b!1146492))

(assert (= (and b!1146492 c!113101) b!1146471))

(assert (= (and b!1146492 (not c!113101)) b!1146490))

(assert (= (and b!1146471 c!113104) b!1146485))

(assert (= (and b!1146471 (not c!113104)) b!1146487))

(assert (= (and b!1146487 c!113103) b!1146488))

(assert (= (and b!1146487 (not c!113103)) b!1146489))

(assert (= (and b!1146489 c!113102) b!1146486))

(assert (= (and b!1146489 (not c!113102)) b!1146482))

(assert (= (or b!1146488 b!1146486) bm!52528))

(assert (= (or b!1146488 b!1146486) bm!52534))

(assert (= (or b!1146488 b!1146486) bm!52529))

(assert (= (or b!1146485 bm!52529) bm!52527))

(assert (= (or b!1146485 bm!52528) bm!52532))

(assert (= (or b!1146485 bm!52534) bm!52533))

(assert (= (and b!1146471 c!113100) b!1146483))

(assert (= (and b!1146471 (not c!113100)) b!1146466))

(assert (= (and b!1146471 res!763278) b!1146493))

(assert (= (and b!1146492 res!763282) b!1146476))

(assert (= (and b!1146479 condMapEmpty!44993) mapIsEmpty!44993))

(assert (= (and b!1146479 (not condMapEmpty!44993)) mapNonEmpty!44993))

(get-info :version)

(assert (= (and mapNonEmpty!44993 ((_ is ValueCellFull!13680) mapValue!44993)) b!1146474))

(assert (= (and b!1146479 ((_ is ValueCellFull!13680) mapDefault!44993)) b!1146475))

(assert (= start!98644 b!1146479))

(declare-fun b_lambda!19355 () Bool)

(assert (=> (not b_lambda!19355) (not b!1146470)))

(declare-fun t!36295 () Bool)

(declare-fun tb!9061 () Bool)

(assert (=> (and start!98644 (= defaultEntry!1004 defaultEntry!1004) t!36295) tb!9061))

(declare-fun result!18687 () Bool)

(assert (=> tb!9061 (= result!18687 tp_is_empty!28779)))

(assert (=> b!1146470 t!36295))

(declare-fun b_and!39349 () Bool)

(assert (= b_and!39347 (and (=> t!36295 result!18687) b_and!39349)))

(declare-fun m!1057219 () Bool)

(assert (=> b!1146477 m!1057219))

(declare-fun m!1057221 () Bool)

(assert (=> b!1146472 m!1057221))

(declare-fun m!1057223 () Bool)

(assert (=> b!1146494 m!1057223))

(declare-fun m!1057225 () Bool)

(assert (=> bm!52527 m!1057225))

(declare-fun m!1057227 () Bool)

(assert (=> b!1146473 m!1057227))

(declare-fun m!1057229 () Bool)

(assert (=> mapNonEmpty!44993 m!1057229))

(declare-fun m!1057231 () Bool)

(assert (=> b!1146476 m!1057231))

(declare-fun m!1057233 () Bool)

(assert (=> b!1146483 m!1057233))

(declare-fun m!1057235 () Bool)

(assert (=> b!1146467 m!1057235))

(declare-fun m!1057237 () Bool)

(assert (=> b!1146467 m!1057237))

(declare-fun m!1057239 () Bool)

(assert (=> b!1146480 m!1057239))

(declare-fun m!1057241 () Bool)

(assert (=> b!1146480 m!1057241))

(declare-fun m!1057243 () Bool)

(assert (=> b!1146485 m!1057243))

(assert (=> b!1146485 m!1057243))

(declare-fun m!1057245 () Bool)

(assert (=> b!1146485 m!1057245))

(declare-fun m!1057247 () Bool)

(assert (=> b!1146485 m!1057247))

(declare-fun m!1057249 () Bool)

(assert (=> b!1146471 m!1057249))

(declare-fun m!1057251 () Bool)

(assert (=> b!1146471 m!1057251))

(declare-fun m!1057253 () Bool)

(assert (=> b!1146471 m!1057253))

(declare-fun m!1057255 () Bool)

(assert (=> b!1146471 m!1057255))

(declare-fun m!1057257 () Bool)

(assert (=> bm!52531 m!1057257))

(declare-fun m!1057259 () Bool)

(assert (=> start!98644 m!1057259))

(declare-fun m!1057261 () Bool)

(assert (=> start!98644 m!1057261))

(assert (=> b!1146493 m!1057233))

(declare-fun m!1057263 () Bool)

(assert (=> bm!52530 m!1057263))

(declare-fun m!1057265 () Bool)

(assert (=> b!1146468 m!1057265))

(declare-fun m!1057267 () Bool)

(assert (=> bm!52532 m!1057267))

(declare-fun m!1057269 () Bool)

(assert (=> b!1146469 m!1057269))

(declare-fun m!1057271 () Bool)

(assert (=> b!1146469 m!1057271))

(declare-fun m!1057273 () Bool)

(assert (=> b!1146470 m!1057273))

(declare-fun m!1057275 () Bool)

(assert (=> b!1146470 m!1057275))

(declare-fun m!1057277 () Bool)

(assert (=> b!1146470 m!1057277))

(declare-fun m!1057279 () Bool)

(assert (=> b!1146470 m!1057279))

(declare-fun m!1057281 () Bool)

(assert (=> b!1146491 m!1057281))

(declare-fun m!1057283 () Bool)

(assert (=> bm!52533 m!1057283))

(declare-fun m!1057285 () Bool)

(assert (=> b!1146478 m!1057285))

(assert (=> b!1146492 m!1057263))

(assert (=> b!1146492 m!1057235))

(declare-fun m!1057287 () Bool)

(assert (=> b!1146492 m!1057287))

(declare-fun m!1057289 () Bool)

(assert (=> b!1146492 m!1057289))

(declare-fun m!1057291 () Bool)

(assert (=> b!1146492 m!1057291))

(assert (=> b!1146492 m!1057235))

(declare-fun m!1057293 () Bool)

(assert (=> b!1146492 m!1057293))

(declare-fun m!1057295 () Bool)

(assert (=> b!1146492 m!1057295))

(assert (=> b!1146492 m!1057289))

(assert (=> b!1146492 m!1057235))

(declare-fun m!1057297 () Bool)

(assert (=> b!1146492 m!1057297))

(assert (=> b!1146492 m!1057293))

(check-sat (not b!1146492) b_and!39349 (not b!1146472) (not bm!52530) tp_is_empty!28779 (not b!1146477) (not bm!52527) (not b!1146469) (not b_lambda!19355) (not b!1146493) (not bm!52532) (not b_next!24249) (not b!1146494) (not b!1146491) (not bm!52533) (not start!98644) (not b!1146467) (not b!1146471) (not b!1146470) (not mapNonEmpty!44993) (not b!1146485) (not b!1146483) (not b!1146468) (not bm!52531) (not b!1146478) (not b!1146476) (not b!1146480))
(check-sat b_and!39349 (not b_next!24249))
