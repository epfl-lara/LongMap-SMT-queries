; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99018 () Bool)

(assert start!99018)

(declare-fun b_free!24623 () Bool)

(declare-fun b_next!24623 () Bool)

(assert (=> start!99018 (= b_free!24623 (not b_next!24623))))

(declare-fun tp!86579 () Bool)

(declare-fun b_and!40095 () Bool)

(assert (=> start!99018 (= tp!86579 b_and!40095)))

(declare-fun bm!57015 () Bool)

(declare-fun call!57018 () Bool)

(declare-fun call!57022 () Bool)

(assert (=> bm!57015 (= call!57018 call!57022)))

(declare-fun res!771691 () Bool)

(declare-fun e!661670 () Bool)

(assert (=> start!99018 (=> (not res!771691) (not e!661670))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75145 0))(
  ( (array!75146 (arr!36223 (Array (_ BitVec 32) (_ BitVec 64))) (size!36759 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75145)

(assert (=> start!99018 (= res!771691 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36759 _keys!1208))))))

(assert (=> start!99018 e!661670))

(declare-fun tp_is_empty!29153 () Bool)

(assert (=> start!99018 tp_is_empty!29153))

(declare-fun array_inv!27718 (array!75145) Bool)

(assert (=> start!99018 (array_inv!27718 _keys!1208)))

(assert (=> start!99018 true))

(assert (=> start!99018 tp!86579))

(declare-datatypes ((V!43997 0))(
  ( (V!43998 (val!14633 Int)) )
))
(declare-datatypes ((ValueCell!13867 0))(
  ( (ValueCellFull!13867 (v!17270 V!43997)) (EmptyCell!13867) )
))
(declare-datatypes ((array!75147 0))(
  ( (array!75148 (arr!36224 (Array (_ BitVec 32) ValueCell!13867)) (size!36760 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75147)

(declare-fun e!661676 () Bool)

(declare-fun array_inv!27719 (array!75147) Bool)

(assert (=> start!99018 (and (array_inv!27719 _values!996) e!661676)))

(declare-fun b!1163670 () Bool)

(declare-fun e!661678 () Bool)

(assert (=> b!1163670 (= e!661678 tp_is_empty!29153)))

(declare-fun mapIsEmpty!45554 () Bool)

(declare-fun mapRes!45554 () Bool)

(assert (=> mapIsEmpty!45554 mapRes!45554))

(declare-fun b!1163671 () Bool)

(declare-fun res!771696 () Bool)

(assert (=> b!1163671 (=> (not res!771696) (not e!661670))))

(declare-datatypes ((List!25395 0))(
  ( (Nil!25392) (Cons!25391 (h!26600 (_ BitVec 64)) (t!37010 List!25395)) )
))
(declare-fun arrayNoDuplicates!0 (array!75145 (_ BitVec 32) List!25395) Bool)

(assert (=> b!1163671 (= res!771696 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25392))))

(declare-fun b!1163672 () Bool)

(declare-datatypes ((Unit!38404 0))(
  ( (Unit!38405) )
))
(declare-fun e!661686 () Unit!38404)

(declare-fun Unit!38406 () Unit!38404)

(assert (=> b!1163672 (= e!661686 Unit!38406)))

(declare-fun b!1163673 () Bool)

(declare-fun e!661679 () Unit!38404)

(declare-fun e!661681 () Unit!38404)

(assert (=> b!1163673 (= e!661679 e!661681)))

(declare-fun c!116466 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!524304 () Bool)

(assert (=> b!1163673 (= c!116466 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!524304))))

(declare-fun b!1163674 () Bool)

(declare-fun Unit!38407 () Unit!38404)

(assert (=> b!1163674 (= e!661686 Unit!38407)))

(assert (=> b!1163674 (= lt!524304 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116470 () Bool)

(assert (=> b!1163674 (= c!116470 (and (not lt!524304) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!524311 () Unit!38404)

(declare-fun e!661683 () Unit!38404)

(assert (=> b!1163674 (= lt!524311 e!661683)))

(declare-fun zeroValue!944 () V!43997)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!524297 () Unit!38404)

(declare-fun minValue!944 () V!43997)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!558 (array!75145 array!75147 (_ BitVec 32) (_ BitVec 32) V!43997 V!43997 (_ BitVec 64) (_ BitVec 32) Int) Unit!38404)

(assert (=> b!1163674 (= lt!524297 (lemmaListMapContainsThenArrayContainsFrom!558 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116465 () Bool)

(assert (=> b!1163674 (= c!116465 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771684 () Bool)

(declare-fun e!661677 () Bool)

(assert (=> b!1163674 (= res!771684 e!661677)))

(declare-fun e!661682 () Bool)

(assert (=> b!1163674 (=> (not res!771684) (not e!661682))))

(assert (=> b!1163674 e!661682))

(declare-fun lt!524302 () Unit!38404)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75145 (_ BitVec 32) (_ BitVec 32)) Unit!38404)

(assert (=> b!1163674 (= lt!524302 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1163674 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25392)))

(declare-fun lt!524303 () Unit!38404)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75145 (_ BitVec 64) (_ BitVec 32) List!25395) Unit!38404)

(assert (=> b!1163674 (= lt!524303 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25392))))

(assert (=> b!1163674 false))

(declare-fun b!1163675 () Bool)

(declare-fun res!771685 () Bool)

(assert (=> b!1163675 (=> (not res!771685) (not e!661670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163675 (= res!771685 (validKeyInArray!0 k!934))))

(declare-fun b!1163676 () Bool)

(declare-datatypes ((tuple2!18662 0))(
  ( (tuple2!18663 (_1!9342 (_ BitVec 64)) (_2!9342 V!43997)) )
))
(declare-datatypes ((List!25396 0))(
  ( (Nil!25393) (Cons!25392 (h!26601 tuple2!18662) (t!37011 List!25396)) )
))
(declare-datatypes ((ListLongMap!16631 0))(
  ( (ListLongMap!16632 (toList!8331 List!25396)) )
))
(declare-fun call!57020 () ListLongMap!16631)

(declare-fun call!57021 () ListLongMap!16631)

(declare-fun e!661672 () Bool)

(declare-fun -!1435 (ListLongMap!16631 (_ BitVec 64)) ListLongMap!16631)

(assert (=> b!1163676 (= e!661672 (= call!57021 (-!1435 call!57020 k!934)))))

(declare-fun b!1163677 () Bool)

(declare-fun e!661684 () Bool)

(assert (=> b!1163677 (= e!661684 tp_is_empty!29153)))

(declare-fun bm!57016 () Bool)

(declare-fun call!57025 () Unit!38404)

(declare-fun call!57019 () Unit!38404)

(assert (=> bm!57016 (= call!57025 call!57019)))

(declare-fun b!1163678 () Bool)

(declare-fun e!661685 () Bool)

(assert (=> b!1163678 (= e!661685 true)))

(declare-fun e!661680 () Bool)

(assert (=> b!1163678 e!661680))

(declare-fun res!771689 () Bool)

(assert (=> b!1163678 (=> (not res!771689) (not e!661680))))

(declare-fun lt!524309 () ListLongMap!16631)

(declare-fun lt!524298 () ListLongMap!16631)

(assert (=> b!1163678 (= res!771689 (= lt!524309 lt!524298))))

(declare-fun lt!524310 () ListLongMap!16631)

(assert (=> b!1163678 (= lt!524309 (-!1435 lt!524310 k!934))))

(declare-fun lt!524307 () V!43997)

(declare-fun +!3734 (ListLongMap!16631 tuple2!18662) ListLongMap!16631)

(assert (=> b!1163678 (= (-!1435 (+!3734 lt!524298 (tuple2!18663 (select (arr!36223 _keys!1208) from!1455) lt!524307)) (select (arr!36223 _keys!1208) from!1455)) lt!524298)))

(declare-fun lt!524296 () Unit!38404)

(declare-fun addThenRemoveForNewKeyIsSame!267 (ListLongMap!16631 (_ BitVec 64) V!43997) Unit!38404)

(assert (=> b!1163678 (= lt!524296 (addThenRemoveForNewKeyIsSame!267 lt!524298 (select (arr!36223 _keys!1208) from!1455) lt!524307))))

(declare-fun lt!524313 () V!43997)

(declare-fun get!18487 (ValueCell!13867 V!43997) V!43997)

(assert (=> b!1163678 (= lt!524307 (get!18487 (select (arr!36224 _values!996) from!1455) lt!524313))))

(declare-fun lt!524301 () Unit!38404)

(assert (=> b!1163678 (= lt!524301 e!661686)))

(declare-fun c!116467 () Bool)

(declare-fun contains!6835 (ListLongMap!16631 (_ BitVec 64)) Bool)

(assert (=> b!1163678 (= c!116467 (contains!6835 lt!524298 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!4795 (array!75145 array!75147 (_ BitVec 32) (_ BitVec 32) V!43997 V!43997 (_ BitVec 32) Int) ListLongMap!16631)

(assert (=> b!1163678 (= lt!524298 (getCurrentListMapNoExtraKeys!4795 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163679 () Bool)

(assert (=> b!1163679 (= e!661672 (= call!57021 call!57020))))

(declare-fun lt!524292 () array!75147)

(declare-fun lt!524295 () array!75145)

(declare-fun bm!57017 () Bool)

(assert (=> bm!57017 (= call!57021 (getCurrentListMapNoExtraKeys!4795 lt!524295 lt!524292 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163680 () Bool)

(declare-fun arrayContainsKey!0 (array!75145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163680 (= e!661677 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163681 () Bool)

(declare-fun res!771693 () Bool)

(assert (=> b!1163681 (=> (not res!771693) (not e!661670))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1163681 (= res!771693 (= (select (arr!36223 _keys!1208) i!673) k!934))))

(declare-fun b!1163682 () Bool)

(declare-fun res!771686 () Bool)

(assert (=> b!1163682 (=> (not res!771686) (not e!661670))))

(assert (=> b!1163682 (= res!771686 (and (= (size!36760 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36759 _keys!1208) (size!36760 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1163683 () Bool)

(declare-fun res!771687 () Bool)

(declare-fun e!661675 () Bool)

(assert (=> b!1163683 (=> (not res!771687) (not e!661675))))

(assert (=> b!1163683 (= res!771687 (arrayNoDuplicates!0 lt!524295 #b00000000000000000000000000000000 Nil!25392))))

(declare-fun b!1163684 () Bool)

(declare-fun Unit!38408 () Unit!38404)

(assert (=> b!1163684 (= e!661681 Unit!38408)))

(declare-fun bm!57018 () Bool)

(assert (=> bm!57018 (= call!57020 (getCurrentListMapNoExtraKeys!4795 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163685 () Bool)

(assert (=> b!1163685 (= e!661670 e!661675)))

(declare-fun res!771694 () Bool)

(assert (=> b!1163685 (=> (not res!771694) (not e!661675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75145 (_ BitVec 32)) Bool)

(assert (=> b!1163685 (= res!771694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524295 mask!1564))))

(assert (=> b!1163685 (= lt!524295 (array!75146 (store (arr!36223 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36759 _keys!1208)))))

(declare-fun b!1163686 () Bool)

(declare-fun lt!524294 () Unit!38404)

(assert (=> b!1163686 (= e!661679 lt!524294)))

(assert (=> b!1163686 (= lt!524294 call!57025)))

(assert (=> b!1163686 call!57018))

(declare-fun b!1163687 () Bool)

(declare-fun res!771698 () Bool)

(assert (=> b!1163687 (=> (not res!771698) (not e!661670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163687 (= res!771698 (validMask!0 mask!1564))))

(declare-fun b!1163688 () Bool)

(declare-fun e!661674 () Bool)

(assert (=> b!1163688 (= e!661675 (not e!661674))))

(declare-fun res!771697 () Bool)

(assert (=> b!1163688 (=> res!771697 e!661674)))

(assert (=> b!1163688 (= res!771697 (bvsgt from!1455 i!673))))

(assert (=> b!1163688 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!524312 () Unit!38404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75145 (_ BitVec 64) (_ BitVec 32)) Unit!38404)

(assert (=> b!1163688 (= lt!524312 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!57019 () Bool)

(declare-fun lt!524305 () ListLongMap!16631)

(declare-fun c!116469 () Bool)

(declare-fun call!57023 () ListLongMap!16631)

(assert (=> bm!57019 (= call!57023 (+!3734 (ite c!116470 lt!524305 lt!524298) (ite c!116470 (tuple2!18663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116469 (tuple2!18663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1163689 () Bool)

(declare-fun e!661671 () Bool)

(assert (=> b!1163689 (= e!661671 e!661685)))

(declare-fun res!771695 () Bool)

(assert (=> b!1163689 (=> res!771695 e!661685)))

(assert (=> b!1163689 (= res!771695 (not (= (select (arr!36223 _keys!1208) from!1455) k!934)))))

(assert (=> b!1163689 e!661672))

(declare-fun c!116468 () Bool)

(assert (=> b!1163689 (= c!116468 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!524306 () Unit!38404)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!662 (array!75145 array!75147 (_ BitVec 32) (_ BitVec 32) V!43997 V!43997 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38404)

(assert (=> b!1163689 (= lt!524306 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!662 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163690 () Bool)

(declare-fun res!771688 () Bool)

(assert (=> b!1163690 (=> (not res!771688) (not e!661670))))

(assert (=> b!1163690 (= res!771688 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36759 _keys!1208))))))

(declare-fun mapNonEmpty!45554 () Bool)

(declare-fun tp!86580 () Bool)

(assert (=> mapNonEmpty!45554 (= mapRes!45554 (and tp!86580 e!661678))))

(declare-fun mapValue!45554 () ValueCell!13867)

(declare-fun mapKey!45554 () (_ BitVec 32))

(declare-fun mapRest!45554 () (Array (_ BitVec 32) ValueCell!13867))

(assert (=> mapNonEmpty!45554 (= (arr!36224 _values!996) (store mapRest!45554 mapKey!45554 mapValue!45554))))

(declare-fun b!1163691 () Bool)

(assert (=> b!1163691 (= c!116469 (and (not lt!524304) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1163691 (= e!661683 e!661679)))

(declare-fun b!1163692 () Bool)

(assert (=> b!1163692 (= e!661674 e!661671)))

(declare-fun res!771692 () Bool)

(assert (=> b!1163692 (=> res!771692 e!661671)))

(assert (=> b!1163692 (= res!771692 (not (= from!1455 i!673)))))

(declare-fun lt!524300 () ListLongMap!16631)

(assert (=> b!1163692 (= lt!524300 (getCurrentListMapNoExtraKeys!4795 lt!524295 lt!524292 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1163692 (= lt!524292 (array!75148 (store (arr!36224 _values!996) i!673 (ValueCellFull!13867 lt!524313)) (size!36760 _values!996)))))

(declare-fun dynLambda!2787 (Int (_ BitVec 64)) V!43997)

(assert (=> b!1163692 (= lt!524313 (dynLambda!2787 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1163692 (= lt!524310 (getCurrentListMapNoExtraKeys!4795 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1163693 () Bool)

(declare-fun res!771690 () Bool)

(assert (=> b!1163693 (=> (not res!771690) (not e!661670))))

(assert (=> b!1163693 (= res!771690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1163694 () Bool)

(assert (=> b!1163694 call!57018))

(declare-fun lt!524299 () Unit!38404)

(assert (=> b!1163694 (= lt!524299 call!57025)))

(assert (=> b!1163694 (= e!661681 lt!524299)))

(declare-fun b!1163695 () Bool)

(assert (=> b!1163695 (contains!6835 call!57023 k!934)))

(declare-fun lt!524293 () Unit!38404)

(assert (=> b!1163695 (= lt!524293 call!57019)))

(assert (=> b!1163695 call!57022))

(assert (=> b!1163695 (= lt!524305 (+!3734 lt!524298 (tuple2!18663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!524308 () Unit!38404)

(declare-fun addStillContains!973 (ListLongMap!16631 (_ BitVec 64) V!43997 (_ BitVec 64)) Unit!38404)

(assert (=> b!1163695 (= lt!524308 (addStillContains!973 lt!524298 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1163695 (= e!661683 lt!524293)))

(declare-fun bm!57020 () Bool)

(declare-fun call!57024 () ListLongMap!16631)

(assert (=> bm!57020 (= call!57024 call!57023)))

(declare-fun b!1163696 () Bool)

(assert (=> b!1163696 (= e!661680 (= lt!524309 (getCurrentListMapNoExtraKeys!4795 lt!524295 lt!524292 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1163697 () Bool)

(assert (=> b!1163697 (= e!661682 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163698 () Bool)

(assert (=> b!1163698 (= e!661676 (and e!661684 mapRes!45554))))

(declare-fun condMapEmpty!45554 () Bool)

(declare-fun mapDefault!45554 () ValueCell!13867)

