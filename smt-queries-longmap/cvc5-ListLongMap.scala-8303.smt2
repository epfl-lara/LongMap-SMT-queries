; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101166 () Bool)

(assert start!101166)

(declare-fun b_free!26089 () Bool)

(declare-fun b_next!26089 () Bool)

(assert (=> start!101166 (= b_free!26089 (not b_next!26089))))

(declare-fun tp!91289 () Bool)

(declare-fun b_and!43295 () Bool)

(assert (=> start!101166 (= tp!91289 b_and!43295)))

(declare-datatypes ((V!46185 0))(
  ( (V!46186 (val!15453 Int)) )
))
(declare-fun zeroValue!944 () V!46185)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14687 0))(
  ( (ValueCellFull!14687 (v!18106 V!46185)) (EmptyCell!14687) )
))
(declare-datatypes ((array!78373 0))(
  ( (array!78374 (arr!37821 (Array (_ BitVec 32) ValueCell!14687)) (size!38357 (_ BitVec 32))) )
))
(declare-fun lt!552167 () array!78373)

(declare-datatypes ((tuple2!19866 0))(
  ( (tuple2!19867 (_1!9944 (_ BitVec 64)) (_2!9944 V!46185)) )
))
(declare-datatypes ((List!26664 0))(
  ( (Nil!26661) (Cons!26660 (h!27869 tuple2!19866) (t!39733 List!26664)) )
))
(declare-datatypes ((ListLongMap!17835 0))(
  ( (ListLongMap!17836 (toList!8933 List!26664)) )
))
(declare-fun call!60558 () ListLongMap!17835)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78375 0))(
  ( (array!78376 (arr!37822 (Array (_ BitVec 32) (_ BitVec 64))) (size!38358 (_ BitVec 32))) )
))
(declare-fun lt!552175 () array!78375)

(declare-fun bm!60548 () Bool)

(declare-fun minValue!944 () V!46185)

(declare-fun getCurrentListMapNoExtraKeys!5360 (array!78375 array!78373 (_ BitVec 32) (_ BitVec 32) V!46185 V!46185 (_ BitVec 32) Int) ListLongMap!17835)

(assert (=> bm!60548 (= call!60558 (getCurrentListMapNoExtraKeys!5360 lt!552175 lt!552167 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214120 () Bool)

(declare-fun res!806070 () Bool)

(declare-fun e!689500 () Bool)

(assert (=> b!1214120 (=> (not res!806070) (not e!689500))))

(declare-fun _keys!1208 () array!78375)

(declare-fun _values!996 () array!78373)

(assert (=> b!1214120 (= res!806070 (and (= (size!38357 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38358 _keys!1208) (size!38357 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!48064 () Bool)

(declare-fun mapRes!48064 () Bool)

(declare-fun tp!91288 () Bool)

(declare-fun e!689509 () Bool)

(assert (=> mapNonEmpty!48064 (= mapRes!48064 (and tp!91288 e!689509))))

(declare-fun mapValue!48064 () ValueCell!14687)

(declare-fun mapRest!48064 () (Array (_ BitVec 32) ValueCell!14687))

(declare-fun mapKey!48064 () (_ BitVec 32))

(assert (=> mapNonEmpty!48064 (= (arr!37821 _values!996) (store mapRest!48064 mapKey!48064 mapValue!48064))))

(declare-fun mapIsEmpty!48064 () Bool)

(assert (=> mapIsEmpty!48064 mapRes!48064))

(declare-fun b!1214121 () Bool)

(declare-fun e!689512 () Bool)

(declare-fun call!60551 () ListLongMap!17835)

(assert (=> b!1214121 (= e!689512 (= call!60558 call!60551))))

(declare-fun b!1214122 () Bool)

(declare-datatypes ((Unit!40264 0))(
  ( (Unit!40265) )
))
(declare-fun e!689507 () Unit!40264)

(declare-fun Unit!40266 () Unit!40264)

(assert (=> b!1214122 (= e!689507 Unit!40266)))

(declare-fun b!1214123 () Bool)

(declare-fun e!689501 () Bool)

(declare-fun tp_is_empty!30793 () Bool)

(assert (=> b!1214123 (= e!689501 tp_is_empty!30793)))

(declare-fun b!1214124 () Bool)

(declare-fun e!689504 () Unit!40264)

(declare-fun lt!552180 () Unit!40264)

(assert (=> b!1214124 (= e!689504 lt!552180)))

(declare-fun call!60552 () Unit!40264)

(assert (=> b!1214124 (= lt!552180 call!60552)))

(declare-fun call!60555 () Bool)

(assert (=> b!1214124 call!60555))

(declare-fun b!1214125 () Bool)

(declare-fun e!689502 () Bool)

(declare-fun e!689499 () Bool)

(assert (=> b!1214125 (= e!689502 (not e!689499))))

(declare-fun res!806084 () Bool)

(assert (=> b!1214125 (=> res!806084 e!689499)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1214125 (= res!806084 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214125 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!552165 () Unit!40264)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78375 (_ BitVec 64) (_ BitVec 32)) Unit!40264)

(assert (=> b!1214125 (= lt!552165 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1214126 () Bool)

(assert (=> b!1214126 call!60555))

(declare-fun lt!552171 () Unit!40264)

(assert (=> b!1214126 (= lt!552171 call!60552)))

(assert (=> b!1214126 (= e!689507 lt!552171)))

(declare-fun b!1214127 () Bool)

(declare-fun e!689508 () Bool)

(declare-fun lt!552162 () ListLongMap!17835)

(declare-fun lt!552161 () ListLongMap!17835)

(assert (=> b!1214127 (= e!689508 (or (not (= lt!552162 lt!552161)) (= lt!552161 lt!552162)))))

(declare-fun e!689496 () Bool)

(assert (=> b!1214127 e!689496))

(declare-fun res!806082 () Bool)

(assert (=> b!1214127 (=> (not res!806082) (not e!689496))))

(declare-fun lt!552172 () ListLongMap!17835)

(assert (=> b!1214127 (= res!806082 (= lt!552162 lt!552172))))

(declare-fun lt!552166 () ListLongMap!17835)

(declare-fun -!1878 (ListLongMap!17835 (_ BitVec 64)) ListLongMap!17835)

(assert (=> b!1214127 (= lt!552162 (-!1878 lt!552166 k!934))))

(declare-fun lt!552177 () V!46185)

(declare-fun +!4045 (ListLongMap!17835 tuple2!19866) ListLongMap!17835)

(assert (=> b!1214127 (= (-!1878 (+!4045 lt!552172 (tuple2!19867 (select (arr!37822 _keys!1208) from!1455) lt!552177)) (select (arr!37822 _keys!1208) from!1455)) lt!552172)))

(declare-fun lt!552169 () Unit!40264)

(declare-fun addThenRemoveForNewKeyIsSame!289 (ListLongMap!17835 (_ BitVec 64) V!46185) Unit!40264)

(assert (=> b!1214127 (= lt!552169 (addThenRemoveForNewKeyIsSame!289 lt!552172 (select (arr!37822 _keys!1208) from!1455) lt!552177))))

(declare-fun lt!552174 () V!46185)

(declare-fun get!19282 (ValueCell!14687 V!46185) V!46185)

(assert (=> b!1214127 (= lt!552177 (get!19282 (select (arr!37821 _values!996) from!1455) lt!552174))))

(declare-fun lt!552170 () Unit!40264)

(declare-fun e!689510 () Unit!40264)

(assert (=> b!1214127 (= lt!552170 e!689510)))

(declare-fun c!120007 () Bool)

(declare-fun contains!7003 (ListLongMap!17835 (_ BitVec 64)) Bool)

(assert (=> b!1214127 (= c!120007 (contains!7003 lt!552172 k!934))))

(assert (=> b!1214127 (= lt!552172 (getCurrentListMapNoExtraKeys!5360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60549 () Bool)

(declare-fun call!60556 () Unit!40264)

(assert (=> bm!60549 (= call!60552 call!60556)))

(declare-fun e!689503 () Bool)

(declare-fun b!1214128 () Bool)

(declare-fun lt!552163 () Bool)

(assert (=> b!1214128 (= e!689503 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!552163) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1214129 () Bool)

(assert (=> b!1214129 (= e!689512 (= call!60558 (-!1878 call!60551 k!934)))))

(declare-fun b!1214130 () Bool)

(assert (=> b!1214130 (= e!689509 tp_is_empty!30793)))

(declare-fun b!1214131 () Bool)

(declare-fun Unit!40267 () Unit!40264)

(assert (=> b!1214131 (= e!689510 Unit!40267)))

(declare-fun b!1214132 () Bool)

(assert (=> b!1214132 (= e!689504 e!689507)))

(declare-fun c!120008 () Bool)

(assert (=> b!1214132 (= c!120008 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!552163))))

(declare-fun b!1214133 () Bool)

(declare-fun Unit!40268 () Unit!40264)

(assert (=> b!1214133 (= e!689510 Unit!40268)))

(assert (=> b!1214133 (= lt!552163 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!120009 () Bool)

(assert (=> b!1214133 (= c!120009 (and (not lt!552163) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!552176 () Unit!40264)

(declare-fun e!689497 () Unit!40264)

(assert (=> b!1214133 (= lt!552176 e!689497)))

(declare-fun lt!552178 () Unit!40264)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!621 (array!78375 array!78373 (_ BitVec 32) (_ BitVec 32) V!46185 V!46185 (_ BitVec 64) (_ BitVec 32) Int) Unit!40264)

(assert (=> b!1214133 (= lt!552178 (lemmaListMapContainsThenArrayContainsFrom!621 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!120010 () Bool)

(assert (=> b!1214133 (= c!120010 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!806071 () Bool)

(assert (=> b!1214133 (= res!806071 e!689503)))

(declare-fun e!689506 () Bool)

(assert (=> b!1214133 (=> (not res!806071) (not e!689506))))

(assert (=> b!1214133 e!689506))

(declare-fun lt!552168 () Unit!40264)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78375 (_ BitVec 32) (_ BitVec 32)) Unit!40264)

(assert (=> b!1214133 (= lt!552168 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26665 0))(
  ( (Nil!26662) (Cons!26661 (h!27870 (_ BitVec 64)) (t!39734 List!26665)) )
))
(declare-fun arrayNoDuplicates!0 (array!78375 (_ BitVec 32) List!26665) Bool)

(assert (=> b!1214133 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26662)))

(declare-fun lt!552159 () Unit!40264)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78375 (_ BitVec 64) (_ BitVec 32) List!26665) Unit!40264)

(assert (=> b!1214133 (= lt!552159 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26662))))

(assert (=> b!1214133 false))

(declare-fun bm!60550 () Bool)

(assert (=> bm!60550 (= call!60551 (getCurrentListMapNoExtraKeys!5360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214134 () Bool)

(declare-fun e!689511 () Bool)

(assert (=> b!1214134 (= e!689511 e!689508)))

(declare-fun res!806080 () Bool)

(assert (=> b!1214134 (=> res!806080 e!689508)))

(assert (=> b!1214134 (= res!806080 (not (= (select (arr!37822 _keys!1208) from!1455) k!934)))))

(assert (=> b!1214134 e!689512))

(declare-fun c!120011 () Bool)

(assert (=> b!1214134 (= c!120011 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!552164 () Unit!40264)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1085 (array!78375 array!78373 (_ BitVec 32) (_ BitVec 32) V!46185 V!46185 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40264)

(assert (=> b!1214134 (= lt!552164 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1085 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60551 () Bool)

(declare-fun c!120012 () Bool)

(declare-fun call!60554 () ListLongMap!17835)

(declare-fun lt!552160 () ListLongMap!17835)

(assert (=> bm!60551 (= call!60554 (+!4045 (ite c!120009 lt!552160 lt!552172) (ite c!120009 (tuple2!19867 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120012 (tuple2!19867 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19867 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1214135 () Bool)

(assert (=> b!1214135 (= e!689503 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!60552 () Bool)

(declare-fun addStillContains!1073 (ListLongMap!17835 (_ BitVec 64) V!46185 (_ BitVec 64)) Unit!40264)

(assert (=> bm!60552 (= call!60556 (addStillContains!1073 (ite c!120009 lt!552160 lt!552172) (ite c!120009 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!120012 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!120009 minValue!944 (ite c!120012 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1214136 () Bool)

(declare-fun e!689498 () Bool)

(assert (=> b!1214136 (= e!689498 (and e!689501 mapRes!48064))))

(declare-fun condMapEmpty!48064 () Bool)

(declare-fun mapDefault!48064 () ValueCell!14687)

