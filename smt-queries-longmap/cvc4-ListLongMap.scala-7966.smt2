; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98640 () Bool)

(assert start!98640)

(declare-fun b_free!24245 () Bool)

(declare-fun b_next!24245 () Bool)

(assert (=> start!98640 (= b_free!24245 (not b_next!24245))))

(declare-fun tp!85445 () Bool)

(declare-fun b_and!39339 () Bool)

(assert (=> start!98640 (= tp!85445 b_and!39339)))

(declare-fun b!1146282 () Bool)

(declare-fun res!763188 () Bool)

(declare-fun e!652037 () Bool)

(assert (=> b!1146282 (=> (not res!763188) (not e!652037))))

(declare-datatypes ((array!74399 0))(
  ( (array!74400 (arr!35850 (Array (_ BitVec 32) (_ BitVec 64))) (size!36386 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74399)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1146282 (= res!763188 (= (select (arr!35850 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!44987 () Bool)

(declare-fun mapRes!44987 () Bool)

(assert (=> mapIsEmpty!44987 mapRes!44987))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!652041 () Bool)

(declare-fun b!1146283 () Bool)

(declare-fun arrayContainsKey!0 (array!74399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146283 (= e!652041 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146284 () Bool)

(declare-datatypes ((Unit!37639 0))(
  ( (Unit!37640) )
))
(declare-fun e!652038 () Unit!37639)

(declare-fun Unit!37641 () Unit!37639)

(assert (=> b!1146284 (= e!652038 Unit!37641)))

(declare-fun b!1146285 () Bool)

(declare-fun res!763186 () Bool)

(assert (=> b!1146285 (=> (not res!763186) (not e!652037))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146285 (= res!763186 (validMask!0 mask!1564))))

(declare-fun b!1146286 () Bool)

(declare-fun e!652036 () Bool)

(assert (=> b!1146286 (= e!652036 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-datatypes ((V!43493 0))(
  ( (V!43494 (val!14444 Int)) )
))
(declare-fun zeroValue!944 () V!43493)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18300 0))(
  ( (tuple2!18301 (_1!9161 (_ BitVec 64)) (_2!9161 V!43493)) )
))
(declare-datatypes ((List!25053 0))(
  ( (Nil!25050) (Cons!25049 (h!26258 tuple2!18300) (t!36290 List!25053)) )
))
(declare-datatypes ((ListLongMap!16269 0))(
  ( (ListLongMap!16270 (toList!8150 List!25053)) )
))
(declare-fun call!52483 () ListLongMap!16269)

(declare-datatypes ((ValueCell!13678 0))(
  ( (ValueCellFull!13678 (v!17081 V!43493)) (EmptyCell!13678) )
))
(declare-datatypes ((array!74401 0))(
  ( (array!74402 (arr!35851 (Array (_ BitVec 32) ValueCell!13678)) (size!36387 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74401)

(declare-fun bm!52479 () Bool)

(declare-fun minValue!944 () V!43493)

(declare-fun getCurrentListMapNoExtraKeys!4625 (array!74399 array!74401 (_ BitVec 32) (_ BitVec 32) V!43493 V!43493 (_ BitVec 32) Int) ListLongMap!16269)

(assert (=> bm!52479 (= call!52483 (getCurrentListMapNoExtraKeys!4625 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146287 () Bool)

(declare-fun e!652039 () Bool)

(declare-fun call!52486 () ListLongMap!16269)

(assert (=> b!1146287 (= e!652039 (= call!52486 call!52483))))

(declare-fun b!1146288 () Bool)

(declare-fun e!652043 () Bool)

(assert (=> b!1146288 (= e!652037 e!652043)))

(declare-fun res!763189 () Bool)

(assert (=> b!1146288 (=> (not res!763189) (not e!652043))))

(declare-fun lt!511910 () array!74399)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74399 (_ BitVec 32)) Bool)

(assert (=> b!1146288 (= res!763189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511910 mask!1564))))

(assert (=> b!1146288 (= lt!511910 (array!74400 (store (arr!35850 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36386 _keys!1208)))))

(declare-fun bm!52481 () Bool)

(declare-fun call!52484 () Unit!37639)

(declare-fun call!52488 () Unit!37639)

(assert (=> bm!52481 (= call!52484 call!52488)))

(declare-fun res!763180 () Bool)

(assert (=> start!98640 (=> (not res!763180) (not e!652037))))

(assert (=> start!98640 (= res!763180 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36386 _keys!1208))))))

(assert (=> start!98640 e!652037))

(declare-fun tp_is_empty!28775 () Bool)

(assert (=> start!98640 tp_is_empty!28775))

(declare-fun array_inv!27464 (array!74399) Bool)

(assert (=> start!98640 (array_inv!27464 _keys!1208)))

(assert (=> start!98640 true))

(assert (=> start!98640 tp!85445))

(declare-fun e!652045 () Bool)

(declare-fun array_inv!27465 (array!74401) Bool)

(assert (=> start!98640 (and (array_inv!27465 _values!996) e!652045)))

(declare-fun c!113064 () Bool)

(declare-fun call!52482 () ListLongMap!16269)

(declare-fun lt!511918 () ListLongMap!16269)

(declare-fun c!113066 () Bool)

(declare-fun bm!52480 () Bool)

(declare-fun +!3575 (ListLongMap!16269 tuple2!18300) ListLongMap!16269)

(assert (=> bm!52480 (= call!52482 (+!3575 lt!511918 (ite (or c!113064 c!113066) (tuple2!18301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1146289 () Bool)

(declare-fun e!652033 () Bool)

(assert (=> b!1146289 (= e!652033 true)))

(declare-fun e!652034 () Bool)

(assert (=> b!1146289 e!652034))

(declare-fun res!763181 () Bool)

(assert (=> b!1146289 (=> (not res!763181) (not e!652034))))

(declare-fun lt!511920 () V!43493)

(declare-fun -!1288 (ListLongMap!16269 (_ BitVec 64)) ListLongMap!16269)

(assert (=> b!1146289 (= res!763181 (= (-!1288 (+!3575 lt!511918 (tuple2!18301 (select (arr!35850 _keys!1208) from!1455) lt!511920)) (select (arr!35850 _keys!1208) from!1455)) lt!511918))))

(declare-fun lt!511919 () Unit!37639)

(declare-fun addThenRemoveForNewKeyIsSame!137 (ListLongMap!16269 (_ BitVec 64) V!43493) Unit!37639)

(assert (=> b!1146289 (= lt!511919 (addThenRemoveForNewKeyIsSame!137 lt!511918 (select (arr!35850 _keys!1208) from!1455) lt!511920))))

(declare-fun lt!511916 () V!43493)

(declare-fun get!18231 (ValueCell!13678 V!43493) V!43493)

(assert (=> b!1146289 (= lt!511920 (get!18231 (select (arr!35851 _values!996) from!1455) lt!511916))))

(declare-fun lt!511917 () Unit!37639)

(declare-fun e!652035 () Unit!37639)

(assert (=> b!1146289 (= lt!511917 e!652035)))

(declare-fun c!113065 () Bool)

(declare-fun contains!6676 (ListLongMap!16269 (_ BitVec 64)) Bool)

(assert (=> b!1146289 (= c!113065 (contains!6676 lt!511918 k!934))))

(assert (=> b!1146289 (= lt!511918 (getCurrentListMapNoExtraKeys!4625 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146290 () Bool)

(declare-fun res!763193 () Bool)

(assert (=> b!1146290 (=> (not res!763193) (not e!652037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1146290 (= res!763193 (validKeyInArray!0 k!934))))

(declare-fun b!1146291 () Bool)

(assert (=> b!1146291 (= e!652039 (= call!52486 (-!1288 call!52483 k!934)))))

(declare-fun b!1146292 () Bool)

(declare-fun lt!511927 () Bool)

(assert (=> b!1146292 (= e!652036 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511927) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1146293 () Bool)

(declare-fun e!652047 () Bool)

(assert (=> b!1146293 (= e!652043 (not e!652047))))

(declare-fun res!763183 () Bool)

(assert (=> b!1146293 (=> res!763183 e!652047)))

(assert (=> b!1146293 (= res!763183 (bvsgt from!1455 i!673))))

(assert (=> b!1146293 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!511924 () Unit!37639)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74399 (_ BitVec 64) (_ BitVec 32)) Unit!37639)

(assert (=> b!1146293 (= lt!511924 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1146294 () Bool)

(declare-fun e!652032 () Bool)

(assert (=> b!1146294 (= e!652045 (and e!652032 mapRes!44987))))

(declare-fun condMapEmpty!44987 () Bool)

(declare-fun mapDefault!44987 () ValueCell!13678)

