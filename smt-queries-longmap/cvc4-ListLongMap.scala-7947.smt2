; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98526 () Bool)

(assert start!98526)

(declare-fun b_free!24131 () Bool)

(declare-fun b_next!24131 () Bool)

(assert (=> start!98526 (= b_free!24131 (not b_next!24131))))

(declare-fun tp!85104 () Bool)

(declare-fun b_and!39111 () Bool)

(assert (=> start!98526 (= tp!85104 b_and!39111)))

(declare-fun res!760715 () Bool)

(declare-fun e!649236 () Bool)

(assert (=> start!98526 (=> (not res!760715) (not e!649236))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74179 0))(
  ( (array!74180 (arr!35740 (Array (_ BitVec 32) (_ BitVec 64))) (size!36276 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74179)

(assert (=> start!98526 (= res!760715 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36276 _keys!1208))))))

(assert (=> start!98526 e!649236))

(declare-fun tp_is_empty!28661 () Bool)

(assert (=> start!98526 tp_is_empty!28661))

(declare-fun array_inv!27394 (array!74179) Bool)

(assert (=> start!98526 (array_inv!27394 _keys!1208)))

(assert (=> start!98526 true))

(assert (=> start!98526 tp!85104))

(declare-datatypes ((V!43341 0))(
  ( (V!43342 (val!14387 Int)) )
))
(declare-datatypes ((ValueCell!13621 0))(
  ( (ValueCellFull!13621 (v!17024 V!43341)) (EmptyCell!13621) )
))
(declare-datatypes ((array!74181 0))(
  ( (array!74182 (arr!35741 (Array (_ BitVec 32) ValueCell!13621)) (size!36277 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74181)

(declare-fun e!649230 () Bool)

(declare-fun array_inv!27395 (array!74181) Bool)

(assert (=> start!98526 (and (array_inv!27395 _values!996) e!649230)))

(declare-fun b!1141138 () Bool)

(declare-fun e!649232 () Bool)

(assert (=> b!1141138 (= e!649232 tp_is_empty!28661)))

(declare-fun b!1141139 () Bool)

(declare-fun res!760716 () Bool)

(assert (=> b!1141139 (=> (not res!760716) (not e!649236))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141139 (= res!760716 (validKeyInArray!0 k!934))))

(declare-fun bm!51111 () Bool)

(declare-fun call!51118 () Bool)

(declare-fun call!51115 () Bool)

(assert (=> bm!51111 (= call!51118 call!51115)))

(declare-fun b!1141140 () Bool)

(declare-fun c!112042 () Bool)

(declare-fun lt!508332 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1141140 (= c!112042 (and (not lt!508332) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37428 0))(
  ( (Unit!37429) )
))
(declare-fun e!649229 () Unit!37428)

(declare-fun e!649224 () Unit!37428)

(assert (=> b!1141140 (= e!649229 e!649224)))

(declare-fun b!1141141 () Bool)

(declare-fun e!649233 () Bool)

(declare-datatypes ((tuple2!18198 0))(
  ( (tuple2!18199 (_1!9110 (_ BitVec 64)) (_2!9110 V!43341)) )
))
(declare-datatypes ((List!24953 0))(
  ( (Nil!24950) (Cons!24949 (h!26158 tuple2!18198) (t!36076 List!24953)) )
))
(declare-datatypes ((ListLongMap!16167 0))(
  ( (ListLongMap!16168 (toList!8099 List!24953)) )
))
(declare-fun call!51114 () ListLongMap!16167)

(declare-fun call!51117 () ListLongMap!16167)

(assert (=> b!1141141 (= e!649233 (= call!51114 call!51117))))

(declare-fun b!1141142 () Bool)

(assert (=> b!1141142 call!51118))

(declare-fun lt!508323 () Unit!37428)

(declare-fun call!51116 () Unit!37428)

(assert (=> b!1141142 (= lt!508323 call!51116)))

(declare-fun e!649238 () Unit!37428)

(assert (=> b!1141142 (= e!649238 lt!508323)))

(declare-fun b!1141143 () Bool)

(declare-fun res!760717 () Bool)

(assert (=> b!1141143 (=> (not res!760717) (not e!649236))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74179 (_ BitVec 32)) Bool)

(assert (=> b!1141143 (= res!760717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1141144 () Bool)

(declare-fun e!649239 () Bool)

(declare-fun e!649228 () Bool)

(assert (=> b!1141144 (= e!649239 e!649228)))

(declare-fun res!760718 () Bool)

(assert (=> b!1141144 (=> res!760718 e!649228)))

(assert (=> b!1141144 (= res!760718 (not (= (select (arr!35740 _keys!1208) from!1455) k!934)))))

(assert (=> b!1141144 e!649233))

(declare-fun c!112037 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141144 (= c!112037 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43341)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43341)

(declare-fun lt!508328 () Unit!37428)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!494 (array!74179 array!74181 (_ BitVec 32) (_ BitVec 32) V!43341 V!43341 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37428)

(assert (=> b!1141144 (= lt!508328 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141145 () Bool)

(declare-fun res!760721 () Bool)

(assert (=> b!1141145 (=> (not res!760721) (not e!649236))))

(declare-datatypes ((List!24954 0))(
  ( (Nil!24951) (Cons!24950 (h!26159 (_ BitVec 64)) (t!36077 List!24954)) )
))
(declare-fun arrayNoDuplicates!0 (array!74179 (_ BitVec 32) List!24954) Bool)

(assert (=> b!1141145 (= res!760721 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24951))))

(declare-fun e!649231 () Bool)

(declare-fun b!1141146 () Bool)

(assert (=> b!1141146 (= e!649231 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508332) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1141147 () Bool)

(declare-fun arrayContainsKey!0 (array!74179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141147 (= e!649231 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141148 () Bool)

(assert (=> b!1141148 (= e!649228 true)))

(declare-fun lt!508330 () V!43341)

(declare-fun lt!508320 () ListLongMap!16167)

(declare-fun -!1249 (ListLongMap!16167 (_ BitVec 64)) ListLongMap!16167)

(declare-fun +!3530 (ListLongMap!16167 tuple2!18198) ListLongMap!16167)

(assert (=> b!1141148 (= (-!1249 (+!3530 lt!508320 (tuple2!18199 (select (arr!35740 _keys!1208) from!1455) lt!508330)) (select (arr!35740 _keys!1208) from!1455)) lt!508320)))

(declare-fun lt!508318 () Unit!37428)

(declare-fun addThenRemoveForNewKeyIsSame!102 (ListLongMap!16167 (_ BitVec 64) V!43341) Unit!37428)

(assert (=> b!1141148 (= lt!508318 (addThenRemoveForNewKeyIsSame!102 lt!508320 (select (arr!35740 _keys!1208) from!1455) lt!508330))))

(declare-fun lt!508338 () V!43341)

(declare-fun get!18158 (ValueCell!13621 V!43341) V!43341)

(assert (=> b!1141148 (= lt!508330 (get!18158 (select (arr!35741 _values!996) from!1455) lt!508338))))

(declare-fun lt!508322 () Unit!37428)

(declare-fun e!649234 () Unit!37428)

(assert (=> b!1141148 (= lt!508322 e!649234)))

(declare-fun c!112039 () Bool)

(declare-fun contains!6634 (ListLongMap!16167 (_ BitVec 64)) Bool)

(assert (=> b!1141148 (= c!112039 (contains!6634 lt!508320 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!4581 (array!74179 array!74181 (_ BitVec 32) (_ BitVec 32) V!43341 V!43341 (_ BitVec 32) Int) ListLongMap!16167)

(assert (=> b!1141148 (= lt!508320 (getCurrentListMapNoExtraKeys!4581 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!508324 () ListLongMap!16167)

(declare-fun bm!51112 () Bool)

(declare-fun call!51119 () ListLongMap!16167)

(declare-fun c!112040 () Bool)

(assert (=> bm!51112 (= call!51119 (+!3530 (ite c!112040 lt!508324 lt!508320) (ite c!112040 (tuple2!18199 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112042 (tuple2!18199 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18199 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun mapNonEmpty!44816 () Bool)

(declare-fun mapRes!44816 () Bool)

(declare-fun tp!85103 () Bool)

(assert (=> mapNonEmpty!44816 (= mapRes!44816 (and tp!85103 e!649232))))

(declare-fun mapValue!44816 () ValueCell!13621)

(declare-fun mapRest!44816 () (Array (_ BitVec 32) ValueCell!13621))

(declare-fun mapKey!44816 () (_ BitVec 32))

(assert (=> mapNonEmpty!44816 (= (arr!35741 _values!996) (store mapRest!44816 mapKey!44816 mapValue!44816))))

(declare-fun b!1141149 () Bool)

(declare-fun res!760719 () Bool)

(assert (=> b!1141149 (=> (not res!760719) (not e!649236))))

(assert (=> b!1141149 (= res!760719 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36276 _keys!1208))))))

(declare-fun bm!51113 () Bool)

(declare-fun call!51120 () Unit!37428)

(assert (=> bm!51113 (= call!51116 call!51120)))

(declare-fun lt!508326 () array!74179)

(declare-fun bm!51114 () Bool)

(declare-fun lt!508331 () array!74181)

(assert (=> bm!51114 (= call!51114 (getCurrentListMapNoExtraKeys!4581 lt!508326 lt!508331 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51115 () Bool)

(declare-fun addStillContains!787 (ListLongMap!16167 (_ BitVec 64) V!43341 (_ BitVec 64)) Unit!37428)

(assert (=> bm!51115 (= call!51120 (addStillContains!787 lt!508320 (ite (or c!112040 c!112042) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112040 c!112042) zeroValue!944 minValue!944) k!934))))

(declare-fun call!51121 () ListLongMap!16167)

(declare-fun bm!51116 () Bool)

(assert (=> bm!51116 (= call!51115 (contains!6634 (ite c!112040 lt!508324 call!51121) k!934))))

(declare-fun b!1141150 () Bool)

(declare-fun e!649227 () Bool)

(assert (=> b!1141150 (= e!649230 (and e!649227 mapRes!44816))))

(declare-fun condMapEmpty!44816 () Bool)

(declare-fun mapDefault!44816 () ValueCell!13621)

