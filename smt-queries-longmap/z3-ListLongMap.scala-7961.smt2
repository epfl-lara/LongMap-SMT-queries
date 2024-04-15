; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98600 () Bool)

(assert start!98600)

(declare-fun b_free!24211 () Bool)

(declare-fun b_next!24211 () Bool)

(assert (=> start!98600 (= b_free!24211 (not b_next!24211))))

(declare-fun tp!85343 () Bool)

(declare-fun b_and!39249 () Bool)

(assert (=> start!98600 (= tp!85343 b_and!39249)))

(declare-fun b!1144594 () Bool)

(declare-fun res!762353 () Bool)

(declare-fun e!651100 () Bool)

(assert (=> b!1144594 (=> (not res!762353) (not e!651100))))

(declare-datatypes ((array!74254 0))(
  ( (array!74255 (arr!35778 (Array (_ BitVec 32) (_ BitVec 64))) (size!36316 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74254)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74254 (_ BitVec 32)) Bool)

(assert (=> b!1144594 (= res!762353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!43449 0))(
  ( (V!43450 (val!14427 Int)) )
))
(declare-fun zeroValue!944 () V!43449)

(declare-datatypes ((tuple2!18358 0))(
  ( (tuple2!18359 (_1!9190 (_ BitVec 64)) (_2!9190 V!43449)) )
))
(declare-datatypes ((List!25094 0))(
  ( (Nil!25091) (Cons!25090 (h!26299 tuple2!18358) (t!36288 List!25094)) )
))
(declare-datatypes ((ListLongMap!16327 0))(
  ( (ListLongMap!16328 (toList!8179 List!25094)) )
))
(declare-fun call!52053 () ListLongMap!16327)

(declare-fun bm!52048 () Bool)

(declare-fun c!112734 () Bool)

(declare-fun c!112733 () Bool)

(declare-fun minValue!944 () V!43449)

(declare-fun lt!510666 () ListLongMap!16327)

(declare-fun +!3600 (ListLongMap!16327 tuple2!18358) ListLongMap!16327)

(assert (=> bm!52048 (= call!52053 (+!3600 lt!510666 (ite (or c!112734 c!112733) (tuple2!18359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1144595 () Bool)

(declare-fun lt!510661 () Bool)

(declare-fun e!651097 () Bool)

(assert (=> b!1144595 (= e!651097 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510661) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1144597 () Bool)

(declare-fun e!651087 () Bool)

(declare-fun e!651098 () Bool)

(assert (=> b!1144597 (= e!651087 (not e!651098))))

(declare-fun res!762362 () Bool)

(assert (=> b!1144597 (=> res!762362 e!651098)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1144597 (= res!762362 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1144597 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37425 0))(
  ( (Unit!37426) )
))
(declare-fun lt!510664 () Unit!37425)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74254 (_ BitVec 64) (_ BitVec 32)) Unit!37425)

(assert (=> b!1144597 (= lt!510664 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun call!52051 () ListLongMap!16327)

(declare-fun b!1144598 () Bool)

(declare-fun call!52054 () ListLongMap!16327)

(declare-fun e!651094 () Bool)

(declare-fun -!1255 (ListLongMap!16327 (_ BitVec 64)) ListLongMap!16327)

(assert (=> b!1144598 (= e!651094 (= call!52054 (-!1255 call!52051 k0!934)))))

(declare-fun b!1144599 () Bool)

(declare-fun res!762356 () Bool)

(assert (=> b!1144599 (=> (not res!762356) (not e!651100))))

(assert (=> b!1144599 (= res!762356 (= (select (arr!35778 _keys!1208) i!673) k0!934))))

(declare-fun bm!52049 () Bool)

(declare-fun lt!510651 () ListLongMap!16327)

(declare-fun call!52055 () ListLongMap!16327)

(declare-fun call!52057 () Bool)

(declare-fun contains!6645 (ListLongMap!16327 (_ BitVec 64)) Bool)

(assert (=> bm!52049 (= call!52057 (contains!6645 (ite c!112734 lt!510651 call!52055) k0!934))))

(declare-fun bm!52050 () Bool)

(assert (=> bm!52050 (= call!52055 call!52053)))

(declare-fun b!1144600 () Bool)

(declare-fun res!762360 () Bool)

(assert (=> b!1144600 (=> (not res!762360) (not e!651100))))

(assert (=> b!1144600 (= res!762360 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36316 _keys!1208))))))

(declare-fun b!1144601 () Bool)

(declare-fun e!651091 () Bool)

(declare-fun tp_is_empty!28741 () Bool)

(assert (=> b!1144601 (= e!651091 tp_is_empty!28741)))

(declare-fun bm!52051 () Bool)

(declare-fun call!52056 () Bool)

(assert (=> bm!52051 (= call!52056 call!52057)))

(declare-fun lt!510665 () ListLongMap!16327)

(declare-fun b!1144602 () Bool)

(declare-fun e!651089 () Bool)

(assert (=> b!1144602 (= e!651089 (= (-!1255 lt!510665 k0!934) lt!510666))))

(declare-fun b!1144603 () Bool)

(declare-fun e!651093 () Bool)

(assert (=> b!1144603 (= e!651093 true)))

(assert (=> b!1144603 e!651089))

(declare-fun res!762350 () Bool)

(assert (=> b!1144603 (=> (not res!762350) (not e!651089))))

(declare-fun lt!510656 () V!43449)

(assert (=> b!1144603 (= res!762350 (= (-!1255 (+!3600 lt!510666 (tuple2!18359 (select (arr!35778 _keys!1208) from!1455) lt!510656)) (select (arr!35778 _keys!1208) from!1455)) lt!510666))))

(declare-fun lt!510658 () Unit!37425)

(declare-fun addThenRemoveForNewKeyIsSame!120 (ListLongMap!16327 (_ BitVec 64) V!43449) Unit!37425)

(assert (=> b!1144603 (= lt!510658 (addThenRemoveForNewKeyIsSame!120 lt!510666 (select (arr!35778 _keys!1208) from!1455) lt!510656))))

(declare-fun lt!510647 () V!43449)

(declare-datatypes ((ValueCell!13661 0))(
  ( (ValueCellFull!13661 (v!17063 V!43449)) (EmptyCell!13661) )
))
(declare-datatypes ((array!74256 0))(
  ( (array!74257 (arr!35779 (Array (_ BitVec 32) ValueCell!13661)) (size!36317 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74256)

(declare-fun get!18204 (ValueCell!13661 V!43449) V!43449)

(assert (=> b!1144603 (= lt!510656 (get!18204 (select (arr!35779 _values!996) from!1455) lt!510647))))

(declare-fun lt!510660 () Unit!37425)

(declare-fun e!651096 () Unit!37425)

(assert (=> b!1144603 (= lt!510660 e!651096)))

(declare-fun c!112731 () Bool)

(assert (=> b!1144603 (= c!112731 (contains!6645 lt!510666 k0!934))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4667 (array!74254 array!74256 (_ BitVec 32) (_ BitVec 32) V!43449 V!43449 (_ BitVec 32) Int) ListLongMap!16327)

(assert (=> b!1144603 (= lt!510666 (getCurrentListMapNoExtraKeys!4667 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52052 () Bool)

(declare-fun call!52052 () Unit!37425)

(declare-fun call!52058 () Unit!37425)

(assert (=> bm!52052 (= call!52052 call!52058)))

(declare-fun mapNonEmpty!44936 () Bool)

(declare-fun mapRes!44936 () Bool)

(declare-fun tp!85344 () Bool)

(assert (=> mapNonEmpty!44936 (= mapRes!44936 (and tp!85344 e!651091))))

(declare-fun mapRest!44936 () (Array (_ BitVec 32) ValueCell!13661))

(declare-fun mapValue!44936 () ValueCell!13661)

(declare-fun mapKey!44936 () (_ BitVec 32))

(assert (=> mapNonEmpty!44936 (= (arr!35779 _values!996) (store mapRest!44936 mapKey!44936 mapValue!44936))))

(declare-fun b!1144604 () Bool)

(declare-fun res!762351 () Bool)

(assert (=> b!1144604 (=> (not res!762351) (not e!651100))))

(assert (=> b!1144604 (= res!762351 (and (= (size!36317 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36316 _keys!1208) (size!36317 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1144605 () Bool)

(declare-fun e!651095 () Unit!37425)

(declare-fun e!651088 () Unit!37425)

(assert (=> b!1144605 (= e!651095 e!651088)))

(declare-fun c!112736 () Bool)

(assert (=> b!1144605 (= c!112736 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510661))))

(declare-fun bm!52053 () Bool)

(assert (=> bm!52053 (= call!52051 (getCurrentListMapNoExtraKeys!4667 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144606 () Bool)

(declare-fun Unit!37427 () Unit!37425)

(assert (=> b!1144606 (= e!651096 Unit!37427)))

(assert (=> b!1144606 (= lt!510661 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1144606 (= c!112734 (and (not lt!510661) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510657 () Unit!37425)

(declare-fun e!651101 () Unit!37425)

(assert (=> b!1144606 (= lt!510657 e!651101)))

(declare-fun lt!510662 () Unit!37425)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!409 (array!74254 array!74256 (_ BitVec 32) (_ BitVec 32) V!43449 V!43449 (_ BitVec 64) (_ BitVec 32) Int) Unit!37425)

(assert (=> b!1144606 (= lt!510662 (lemmaListMapContainsThenArrayContainsFrom!409 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112735 () Bool)

(assert (=> b!1144606 (= c!112735 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762348 () Bool)

(assert (=> b!1144606 (= res!762348 e!651097)))

(declare-fun e!651086 () Bool)

(assert (=> b!1144606 (=> (not res!762348) (not e!651086))))

(assert (=> b!1144606 e!651086))

(declare-fun lt!510650 () Unit!37425)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74254 (_ BitVec 32) (_ BitVec 32)) Unit!37425)

(assert (=> b!1144606 (= lt!510650 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25095 0))(
  ( (Nil!25092) (Cons!25091 (h!26300 (_ BitVec 64)) (t!36289 List!25095)) )
))
(declare-fun arrayNoDuplicates!0 (array!74254 (_ BitVec 32) List!25095) Bool)

(assert (=> b!1144606 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25092)))

(declare-fun lt!510654 () Unit!37425)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74254 (_ BitVec 64) (_ BitVec 32) List!25095) Unit!37425)

(assert (=> b!1144606 (= lt!510654 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25092))))

(assert (=> b!1144606 false))

(declare-fun b!1144607 () Bool)

(declare-fun e!651092 () Bool)

(assert (=> b!1144607 (= e!651092 tp_is_empty!28741)))

(declare-fun b!1144608 () Bool)

(declare-fun lt!510652 () Unit!37425)

(assert (=> b!1144608 (= e!651095 lt!510652)))

(assert (=> b!1144608 (= lt!510652 call!52052)))

(assert (=> b!1144608 call!52056))

(declare-fun b!1144609 () Bool)

(assert (=> b!1144609 (= e!651094 (= call!52054 call!52051))))

(declare-fun b!1144610 () Bool)

(declare-fun e!651090 () Bool)

(assert (=> b!1144610 (= e!651090 e!651093)))

(declare-fun res!762357 () Bool)

(assert (=> b!1144610 (=> res!762357 e!651093)))

(assert (=> b!1144610 (= res!762357 (not (= (select (arr!35778 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1144610 e!651094))

(declare-fun c!112732 () Bool)

(assert (=> b!1144610 (= c!112732 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510655 () Unit!37425)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!535 (array!74254 array!74256 (_ BitVec 32) (_ BitVec 32) V!43449 V!43449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37425)

(assert (=> b!1144610 (= lt!510655 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!535 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52054 () Bool)

(declare-fun lt!510659 () array!74254)

(declare-fun lt!510649 () array!74256)

(assert (=> bm!52054 (= call!52054 (getCurrentListMapNoExtraKeys!4667 lt!510659 lt!510649 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144611 () Bool)

(assert (=> b!1144611 (= e!651098 e!651090)))

(declare-fun res!762349 () Bool)

(assert (=> b!1144611 (=> res!762349 e!651090)))

(assert (=> b!1144611 (= res!762349 (not (= from!1455 i!673)))))

(declare-fun lt!510648 () ListLongMap!16327)

(assert (=> b!1144611 (= lt!510648 (getCurrentListMapNoExtraKeys!4667 lt!510659 lt!510649 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1144611 (= lt!510649 (array!74257 (store (arr!35779 _values!996) i!673 (ValueCellFull!13661 lt!510647)) (size!36317 _values!996)))))

(declare-fun dynLambda!2642 (Int (_ BitVec 64)) V!43449)

(assert (=> b!1144611 (= lt!510647 (dynLambda!2642 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1144611 (= lt!510665 (getCurrentListMapNoExtraKeys!4667 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!762355 () Bool)

(assert (=> start!98600 (=> (not res!762355) (not e!651100))))

(assert (=> start!98600 (= res!762355 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36316 _keys!1208))))))

(assert (=> start!98600 e!651100))

(assert (=> start!98600 tp_is_empty!28741))

(declare-fun array_inv!27492 (array!74254) Bool)

(assert (=> start!98600 (array_inv!27492 _keys!1208)))

(assert (=> start!98600 true))

(assert (=> start!98600 tp!85343))

(declare-fun e!651099 () Bool)

(declare-fun array_inv!27493 (array!74256) Bool)

(assert (=> start!98600 (and (array_inv!27493 _values!996) e!651099)))

(declare-fun b!1144596 () Bool)

(declare-fun res!762361 () Bool)

(assert (=> b!1144596 (=> (not res!762361) (not e!651100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1144596 (= res!762361 (validKeyInArray!0 k0!934))))

(declare-fun bm!52055 () Bool)

(declare-fun addStillContains!814 (ListLongMap!16327 (_ BitVec 64) V!43449 (_ BitVec 64)) Unit!37425)

(assert (=> bm!52055 (= call!52058 (addStillContains!814 lt!510666 (ite (or c!112734 c!112733) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112734 c!112733) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1144612 () Bool)

(assert (=> b!1144612 (= e!651097 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144613 () Bool)

(assert (=> b!1144613 (= c!112733 (and (not lt!510661) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1144613 (= e!651101 e!651095)))

(declare-fun b!1144614 () Bool)

(declare-fun Unit!37428 () Unit!37425)

(assert (=> b!1144614 (= e!651088 Unit!37428)))

(declare-fun mapIsEmpty!44936 () Bool)

(assert (=> mapIsEmpty!44936 mapRes!44936))

(declare-fun b!1144615 () Bool)

(declare-fun res!762358 () Bool)

(assert (=> b!1144615 (=> (not res!762358) (not e!651087))))

(assert (=> b!1144615 (= res!762358 (arrayNoDuplicates!0 lt!510659 #b00000000000000000000000000000000 Nil!25092))))

(declare-fun b!1144616 () Bool)

(assert (=> b!1144616 (= e!651086 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144617 () Bool)

(assert (=> b!1144617 (= e!651099 (and e!651092 mapRes!44936))))

(declare-fun condMapEmpty!44936 () Bool)

(declare-fun mapDefault!44936 () ValueCell!13661)

(assert (=> b!1144617 (= condMapEmpty!44936 (= (arr!35779 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13661)) mapDefault!44936)))))

(declare-fun b!1144618 () Bool)

(assert (=> b!1144618 (contains!6645 (+!3600 lt!510651 (tuple2!18359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!510663 () Unit!37425)

(assert (=> b!1144618 (= lt!510663 (addStillContains!814 lt!510651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1144618 call!52057))

(assert (=> b!1144618 (= lt!510651 call!52053)))

(declare-fun lt!510646 () Unit!37425)

(assert (=> b!1144618 (= lt!510646 call!52058)))

(assert (=> b!1144618 (= e!651101 lt!510663)))

(declare-fun b!1144619 () Bool)

(declare-fun Unit!37429 () Unit!37425)

(assert (=> b!1144619 (= e!651096 Unit!37429)))

(declare-fun b!1144620 () Bool)

(assert (=> b!1144620 call!52056))

(declare-fun lt!510653 () Unit!37425)

(assert (=> b!1144620 (= lt!510653 call!52052)))

(assert (=> b!1144620 (= e!651088 lt!510653)))

(declare-fun b!1144621 () Bool)

(assert (=> b!1144621 (= e!651100 e!651087)))

(declare-fun res!762354 () Bool)

(assert (=> b!1144621 (=> (not res!762354) (not e!651087))))

(assert (=> b!1144621 (= res!762354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510659 mask!1564))))

(assert (=> b!1144621 (= lt!510659 (array!74255 (store (arr!35778 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36316 _keys!1208)))))

(declare-fun b!1144622 () Bool)

(declare-fun res!762359 () Bool)

(assert (=> b!1144622 (=> (not res!762359) (not e!651100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1144622 (= res!762359 (validMask!0 mask!1564))))

(declare-fun b!1144623 () Bool)

(declare-fun res!762352 () Bool)

(assert (=> b!1144623 (=> (not res!762352) (not e!651100))))

(assert (=> b!1144623 (= res!762352 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25092))))

(assert (= (and start!98600 res!762355) b!1144622))

(assert (= (and b!1144622 res!762359) b!1144604))

(assert (= (and b!1144604 res!762351) b!1144594))

(assert (= (and b!1144594 res!762353) b!1144623))

(assert (= (and b!1144623 res!762352) b!1144600))

(assert (= (and b!1144600 res!762360) b!1144596))

(assert (= (and b!1144596 res!762361) b!1144599))

(assert (= (and b!1144599 res!762356) b!1144621))

(assert (= (and b!1144621 res!762354) b!1144615))

(assert (= (and b!1144615 res!762358) b!1144597))

(assert (= (and b!1144597 (not res!762362)) b!1144611))

(assert (= (and b!1144611 (not res!762349)) b!1144610))

(assert (= (and b!1144610 c!112732) b!1144598))

(assert (= (and b!1144610 (not c!112732)) b!1144609))

(assert (= (or b!1144598 b!1144609) bm!52054))

(assert (= (or b!1144598 b!1144609) bm!52053))

(assert (= (and b!1144610 (not res!762357)) b!1144603))

(assert (= (and b!1144603 c!112731) b!1144606))

(assert (= (and b!1144603 (not c!112731)) b!1144619))

(assert (= (and b!1144606 c!112734) b!1144618))

(assert (= (and b!1144606 (not c!112734)) b!1144613))

(assert (= (and b!1144613 c!112733) b!1144608))

(assert (= (and b!1144613 (not c!112733)) b!1144605))

(assert (= (and b!1144605 c!112736) b!1144620))

(assert (= (and b!1144605 (not c!112736)) b!1144614))

(assert (= (or b!1144608 b!1144620) bm!52052))

(assert (= (or b!1144608 b!1144620) bm!52050))

(assert (= (or b!1144608 b!1144620) bm!52051))

(assert (= (or b!1144618 bm!52051) bm!52049))

(assert (= (or b!1144618 bm!52052) bm!52055))

(assert (= (or b!1144618 bm!52050) bm!52048))

(assert (= (and b!1144606 c!112735) b!1144612))

(assert (= (and b!1144606 (not c!112735)) b!1144595))

(assert (= (and b!1144606 res!762348) b!1144616))

(assert (= (and b!1144603 res!762350) b!1144602))

(assert (= (and b!1144617 condMapEmpty!44936) mapIsEmpty!44936))

(assert (= (and b!1144617 (not condMapEmpty!44936)) mapNonEmpty!44936))

(get-info :version)

(assert (= (and mapNonEmpty!44936 ((_ is ValueCellFull!13661) mapValue!44936)) b!1144601))

(assert (= (and b!1144617 ((_ is ValueCellFull!13661) mapDefault!44936)) b!1144607))

(assert (= start!98600 b!1144617))

(declare-fun b_lambda!19299 () Bool)

(assert (=> (not b_lambda!19299) (not b!1144611)))

(declare-fun t!36287 () Bool)

(declare-fun tb!9015 () Bool)

(assert (=> (and start!98600 (= defaultEntry!1004 defaultEntry!1004) t!36287) tb!9015))

(declare-fun result!18603 () Bool)

(assert (=> tb!9015 (= result!18603 tp_is_empty!28741)))

(assert (=> b!1144611 t!36287))

(declare-fun b_and!39251 () Bool)

(assert (= b_and!39249 (and (=> t!36287 result!18603) b_and!39251)))

(declare-fun m!1055099 () Bool)

(assert (=> b!1144612 m!1055099))

(declare-fun m!1055101 () Bool)

(assert (=> b!1144594 m!1055101))

(declare-fun m!1055103 () Bool)

(assert (=> start!98600 m!1055103))

(declare-fun m!1055105 () Bool)

(assert (=> start!98600 m!1055105))

(declare-fun m!1055107 () Bool)

(assert (=> b!1144610 m!1055107))

(declare-fun m!1055109 () Bool)

(assert (=> b!1144610 m!1055109))

(declare-fun m!1055111 () Bool)

(assert (=> bm!52048 m!1055111))

(assert (=> b!1144616 m!1055099))

(declare-fun m!1055113 () Bool)

(assert (=> bm!52053 m!1055113))

(declare-fun m!1055115 () Bool)

(assert (=> b!1144602 m!1055115))

(declare-fun m!1055117 () Bool)

(assert (=> b!1144611 m!1055117))

(declare-fun m!1055119 () Bool)

(assert (=> b!1144611 m!1055119))

(declare-fun m!1055121 () Bool)

(assert (=> b!1144611 m!1055121))

(declare-fun m!1055123 () Bool)

(assert (=> b!1144611 m!1055123))

(declare-fun m!1055125 () Bool)

(assert (=> b!1144606 m!1055125))

(declare-fun m!1055127 () Bool)

(assert (=> b!1144606 m!1055127))

(declare-fun m!1055129 () Bool)

(assert (=> b!1144606 m!1055129))

(declare-fun m!1055131 () Bool)

(assert (=> b!1144606 m!1055131))

(declare-fun m!1055133 () Bool)

(assert (=> b!1144621 m!1055133))

(declare-fun m!1055135 () Bool)

(assert (=> b!1144621 m!1055135))

(declare-fun m!1055137 () Bool)

(assert (=> b!1144615 m!1055137))

(declare-fun m!1055139 () Bool)

(assert (=> b!1144623 m!1055139))

(declare-fun m!1055141 () Bool)

(assert (=> b!1144597 m!1055141))

(declare-fun m!1055143 () Bool)

(assert (=> b!1144597 m!1055143))

(declare-fun m!1055145 () Bool)

(assert (=> b!1144599 m!1055145))

(declare-fun m!1055147 () Bool)

(assert (=> bm!52055 m!1055147))

(declare-fun m!1055149 () Bool)

(assert (=> b!1144598 m!1055149))

(declare-fun m!1055151 () Bool)

(assert (=> b!1144596 m!1055151))

(assert (=> b!1144603 m!1055113))

(declare-fun m!1055153 () Bool)

(assert (=> b!1144603 m!1055153))

(declare-fun m!1055155 () Bool)

(assert (=> b!1144603 m!1055155))

(assert (=> b!1144603 m!1055153))

(declare-fun m!1055157 () Bool)

(assert (=> b!1144603 m!1055157))

(declare-fun m!1055159 () Bool)

(assert (=> b!1144603 m!1055159))

(assert (=> b!1144603 m!1055157))

(assert (=> b!1144603 m!1055107))

(declare-fun m!1055161 () Bool)

(assert (=> b!1144603 m!1055161))

(assert (=> b!1144603 m!1055107))

(declare-fun m!1055163 () Bool)

(assert (=> b!1144603 m!1055163))

(assert (=> b!1144603 m!1055107))

(declare-fun m!1055165 () Bool)

(assert (=> mapNonEmpty!44936 m!1055165))

(declare-fun m!1055167 () Bool)

(assert (=> b!1144618 m!1055167))

(assert (=> b!1144618 m!1055167))

(declare-fun m!1055169 () Bool)

(assert (=> b!1144618 m!1055169))

(declare-fun m!1055171 () Bool)

(assert (=> b!1144618 m!1055171))

(declare-fun m!1055173 () Bool)

(assert (=> bm!52049 m!1055173))

(declare-fun m!1055175 () Bool)

(assert (=> bm!52054 m!1055175))

(declare-fun m!1055177 () Bool)

(assert (=> b!1144622 m!1055177))

(check-sat b_and!39251 (not bm!52055) tp_is_empty!28741 (not start!98600) (not mapNonEmpty!44936) (not b!1144598) (not b!1144615) (not b!1144612) (not bm!52053) (not b!1144611) (not b!1144602) (not b!1144622) (not b!1144610) (not b!1144596) (not b!1144621) (not bm!52049) (not b!1144623) (not b!1144603) (not bm!52054) (not b_lambda!19299) (not b!1144597) (not b!1144594) (not bm!52048) (not b_next!24211) (not b!1144618) (not b!1144616) (not b!1144606))
(check-sat b_and!39251 (not b_next!24211))
