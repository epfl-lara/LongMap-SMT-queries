; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97380 () Bool)

(assert start!97380)

(declare-fun b_free!23351 () Bool)

(declare-fun b_next!23351 () Bool)

(assert (=> start!97380 (= b_free!23351 (not b_next!23351))))

(declare-fun tp!82352 () Bool)

(declare-fun b_and!37537 () Bool)

(assert (=> start!97380 (= tp!82352 b_and!37537)))

(declare-fun b!1110169 () Bool)

(declare-fun res!740862 () Bool)

(declare-fun e!633161 () Bool)

(assert (=> b!1110169 (=> (not res!740862) (not e!633161))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((array!72139 0))(
  ( (array!72140 (arr!34722 (Array (_ BitVec 32) (_ BitVec 64))) (size!35258 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72139)

(assert (=> b!1110169 (= res!740862 (= (select (arr!34722 _keys!1208) i!673) k!934))))

(declare-fun b!1110170 () Bool)

(declare-fun e!633160 () Bool)

(assert (=> b!1110170 (= e!633160 true)))

(declare-fun e!633163 () Bool)

(assert (=> b!1110170 e!633163))

(declare-fun c!109218 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1110170 (= c!109218 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!41941 0))(
  ( (V!41942 (val!13862 Int)) )
))
(declare-fun zeroValue!944 () V!41941)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((Unit!36436 0))(
  ( (Unit!36437) )
))
(declare-fun lt!496117 () Unit!36436)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13096 0))(
  ( (ValueCellFull!13096 (v!16495 V!41941)) (EmptyCell!13096) )
))
(declare-datatypes ((array!72141 0))(
  ( (array!72142 (arr!34723 (Array (_ BitVec 32) ValueCell!13096)) (size!35259 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72141)

(declare-fun minValue!944 () V!41941)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!287 (array!72139 array!72141 (_ BitVec 32) (_ BitVec 32) V!41941 V!41941 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36436)

(assert (=> b!1110170 (= lt!496117 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!287 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110171 () Bool)

(declare-fun res!740860 () Bool)

(declare-fun e!633164 () Bool)

(assert (=> b!1110171 (=> (not res!740860) (not e!633164))))

(declare-fun lt!496116 () array!72139)

(declare-datatypes ((List!24212 0))(
  ( (Nil!24209) (Cons!24208 (h!25417 (_ BitVec 64)) (t!34609 List!24212)) )
))
(declare-fun arrayNoDuplicates!0 (array!72139 (_ BitVec 32) List!24212) Bool)

(assert (=> b!1110171 (= res!740860 (arrayNoDuplicates!0 lt!496116 #b00000000000000000000000000000000 Nil!24209))))

(declare-fun b!1110172 () Bool)

(declare-fun res!740866 () Bool)

(assert (=> b!1110172 (=> (not res!740866) (not e!633161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110172 (= res!740866 (validKeyInArray!0 k!934))))

(declare-fun b!1110173 () Bool)

(declare-fun res!740856 () Bool)

(assert (=> b!1110173 (=> (not res!740856) (not e!633161))))

(assert (=> b!1110173 (= res!740856 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24209))))

(declare-fun b!1110175 () Bool)

(assert (=> b!1110175 (= e!633161 e!633164)))

(declare-fun res!740865 () Bool)

(assert (=> b!1110175 (=> (not res!740865) (not e!633164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72139 (_ BitVec 32)) Bool)

(assert (=> b!1110175 (= res!740865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496116 mask!1564))))

(assert (=> b!1110175 (= lt!496116 (array!72140 (store (arr!34722 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35258 _keys!1208)))))

(declare-fun b!1110176 () Bool)

(assert (=> b!1110176 (= e!633164 (not e!633160))))

(declare-fun res!740857 () Bool)

(assert (=> b!1110176 (=> res!740857 e!633160)))

(assert (=> b!1110176 (= res!740857 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35258 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110176 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!496118 () Unit!36436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72139 (_ BitVec 64) (_ BitVec 32)) Unit!36436)

(assert (=> b!1110176 (= lt!496118 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-datatypes ((tuple2!17528 0))(
  ( (tuple2!17529 (_1!8775 (_ BitVec 64)) (_2!8775 V!41941)) )
))
(declare-datatypes ((List!24213 0))(
  ( (Nil!24210) (Cons!24209 (h!25418 tuple2!17528) (t!34610 List!24213)) )
))
(declare-datatypes ((ListLongMap!15497 0))(
  ( (ListLongMap!15498 (toList!7764 List!24213)) )
))
(declare-fun call!46749 () ListLongMap!15497)

(declare-fun bm!46746 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4258 (array!72139 array!72141 (_ BitVec 32) (_ BitVec 32) V!41941 V!41941 (_ BitVec 32) Int) ListLongMap!15497)

(declare-fun dynLambda!2386 (Int (_ BitVec 64)) V!41941)

(assert (=> bm!46746 (= call!46749 (getCurrentListMapNoExtraKeys!4258 lt!496116 (array!72142 (store (arr!34723 _values!996) i!673 (ValueCellFull!13096 (dynLambda!2386 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35259 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!46750 () ListLongMap!15497)

(declare-fun bm!46747 () Bool)

(assert (=> bm!46747 (= call!46750 (getCurrentListMapNoExtraKeys!4258 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110177 () Bool)

(assert (=> b!1110177 (= e!633163 (= call!46749 call!46750))))

(declare-fun b!1110178 () Bool)

(declare-fun res!740859 () Bool)

(assert (=> b!1110178 (=> (not res!740859) (not e!633161))))

(assert (=> b!1110178 (= res!740859 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35258 _keys!1208))))))

(declare-fun b!1110179 () Bool)

(declare-fun res!740863 () Bool)

(assert (=> b!1110179 (=> (not res!740863) (not e!633161))))

(assert (=> b!1110179 (= res!740863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110180 () Bool)

(declare-fun res!740864 () Bool)

(assert (=> b!1110180 (=> (not res!740864) (not e!633161))))

(assert (=> b!1110180 (= res!740864 (and (= (size!35259 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35258 _keys!1208) (size!35259 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110174 () Bool)

(declare-fun -!1037 (ListLongMap!15497 (_ BitVec 64)) ListLongMap!15497)

(assert (=> b!1110174 (= e!633163 (= call!46749 (-!1037 call!46750 k!934)))))

(declare-fun res!740861 () Bool)

(assert (=> start!97380 (=> (not res!740861) (not e!633161))))

(assert (=> start!97380 (= res!740861 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35258 _keys!1208))))))

(assert (=> start!97380 e!633161))

(declare-fun tp_is_empty!27611 () Bool)

(assert (=> start!97380 tp_is_empty!27611))

(declare-fun array_inv!26718 (array!72139) Bool)

(assert (=> start!97380 (array_inv!26718 _keys!1208)))

(assert (=> start!97380 true))

(assert (=> start!97380 tp!82352))

(declare-fun e!633158 () Bool)

(declare-fun array_inv!26719 (array!72141) Bool)

(assert (=> start!97380 (and (array_inv!26719 _values!996) e!633158)))

(declare-fun mapNonEmpty!43234 () Bool)

(declare-fun mapRes!43234 () Bool)

(declare-fun tp!82351 () Bool)

(declare-fun e!633162 () Bool)

(assert (=> mapNonEmpty!43234 (= mapRes!43234 (and tp!82351 e!633162))))

(declare-fun mapValue!43234 () ValueCell!13096)

(declare-fun mapKey!43234 () (_ BitVec 32))

(declare-fun mapRest!43234 () (Array (_ BitVec 32) ValueCell!13096))

(assert (=> mapNonEmpty!43234 (= (arr!34723 _values!996) (store mapRest!43234 mapKey!43234 mapValue!43234))))

(declare-fun b!1110181 () Bool)

(declare-fun e!633159 () Bool)

(assert (=> b!1110181 (= e!633158 (and e!633159 mapRes!43234))))

(declare-fun condMapEmpty!43234 () Bool)

(declare-fun mapDefault!43234 () ValueCell!13096)

