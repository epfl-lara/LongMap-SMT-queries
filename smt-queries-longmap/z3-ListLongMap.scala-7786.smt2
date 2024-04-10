; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97462 () Bool)

(assert start!97462)

(declare-fun b_free!23433 () Bool)

(declare-fun b_next!23433 () Bool)

(assert (=> start!97462 (= b_free!23433 (not b_next!23433))))

(declare-fun tp!82598 () Bool)

(declare-fun b_and!37703 () Bool)

(assert (=> start!97462 (= tp!82598 b_and!37703)))

(declare-fun b!1112231 () Bool)

(declare-fun res!742211 () Bool)

(declare-fun e!634149 () Bool)

(assert (=> b!1112231 (=> (not res!742211) (not e!634149))))

(declare-datatypes ((array!72299 0))(
  ( (array!72300 (arr!34802 (Array (_ BitVec 32) (_ BitVec 64))) (size!35338 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72299)

(declare-datatypes ((List!24283 0))(
  ( (Nil!24280) (Cons!24279 (h!25488 (_ BitVec 64)) (t!34762 List!24283)) )
))
(declare-fun arrayNoDuplicates!0 (array!72299 (_ BitVec 32) List!24283) Bool)

(assert (=> b!1112231 (= res!742211 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24280))))

(declare-fun b!1112232 () Bool)

(declare-fun res!742216 () Bool)

(assert (=> b!1112232 (=> (not res!742216) (not e!634149))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112232 (= res!742216 (validMask!0 mask!1564))))

(declare-fun b!1112233 () Bool)

(declare-fun e!634148 () Bool)

(declare-fun e!634153 () Bool)

(assert (=> b!1112233 (= e!634148 (not e!634153))))

(declare-fun res!742214 () Bool)

(assert (=> b!1112233 (=> res!742214 e!634153)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1112233 (= res!742214 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35338 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112233 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36496 0))(
  ( (Unit!36497) )
))
(declare-fun lt!496487 () Unit!36496)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72299 (_ BitVec 64) (_ BitVec 32)) Unit!36496)

(assert (=> b!1112233 (= lt!496487 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-datatypes ((V!42051 0))(
  ( (V!42052 (val!13903 Int)) )
))
(declare-datatypes ((tuple2!17600 0))(
  ( (tuple2!17601 (_1!8811 (_ BitVec 64)) (_2!8811 V!42051)) )
))
(declare-datatypes ((List!24284 0))(
  ( (Nil!24281) (Cons!24280 (h!25489 tuple2!17600) (t!34763 List!24284)) )
))
(declare-datatypes ((ListLongMap!15569 0))(
  ( (ListLongMap!15570 (toList!7800 List!24284)) )
))
(declare-fun call!46996 () ListLongMap!15569)

(declare-fun call!46995 () ListLongMap!15569)

(declare-fun b!1112234 () Bool)

(declare-fun e!634151 () Bool)

(declare-fun -!1064 (ListLongMap!15569 (_ BitVec 64)) ListLongMap!15569)

(assert (=> b!1112234 (= e!634151 (= call!46996 (-!1064 call!46995 k0!934)))))

(declare-fun b!1112235 () Bool)

(assert (=> b!1112235 (= e!634151 (= call!46996 call!46995))))

(declare-fun b!1112236 () Bool)

(declare-fun res!742210 () Bool)

(assert (=> b!1112236 (=> (not res!742210) (not e!634148))))

(declare-fun lt!496485 () array!72299)

(assert (=> b!1112236 (= res!742210 (arrayNoDuplicates!0 lt!496485 #b00000000000000000000000000000000 Nil!24280))))

(declare-fun b!1112237 () Bool)

(declare-fun res!742217 () Bool)

(assert (=> b!1112237 (=> (not res!742217) (not e!634149))))

(assert (=> b!1112237 (= res!742217 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35338 _keys!1208))))))

(declare-fun b!1112238 () Bool)

(declare-fun res!742215 () Bool)

(assert (=> b!1112238 (=> (not res!742215) (not e!634149))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13137 0))(
  ( (ValueCellFull!13137 (v!16536 V!42051)) (EmptyCell!13137) )
))
(declare-datatypes ((array!72301 0))(
  ( (array!72302 (arr!34803 (Array (_ BitVec 32) ValueCell!13137)) (size!35339 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72301)

(assert (=> b!1112238 (= res!742215 (and (= (size!35339 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35338 _keys!1208) (size!35339 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43357 () Bool)

(declare-fun mapRes!43357 () Bool)

(declare-fun tp!82597 () Bool)

(declare-fun e!634152 () Bool)

(assert (=> mapNonEmpty!43357 (= mapRes!43357 (and tp!82597 e!634152))))

(declare-fun mapKey!43357 () (_ BitVec 32))

(declare-fun mapRest!43357 () (Array (_ BitVec 32) ValueCell!13137))

(declare-fun mapValue!43357 () ValueCell!13137)

(assert (=> mapNonEmpty!43357 (= (arr!34803 _values!996) (store mapRest!43357 mapKey!43357 mapValue!43357))))

(declare-fun b!1112239 () Bool)

(declare-fun res!742209 () Bool)

(assert (=> b!1112239 (=> (not res!742209) (not e!634149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112239 (= res!742209 (validKeyInArray!0 k0!934))))

(declare-fun b!1112240 () Bool)

(assert (=> b!1112240 (= e!634149 e!634148)))

(declare-fun res!742218 () Bool)

(assert (=> b!1112240 (=> (not res!742218) (not e!634148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72299 (_ BitVec 32)) Bool)

(assert (=> b!1112240 (= res!742218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496485 mask!1564))))

(assert (=> b!1112240 (= lt!496485 (array!72300 (store (arr!34802 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35338 _keys!1208)))))

(declare-fun b!1112241 () Bool)

(declare-fun e!634155 () Bool)

(declare-fun e!634150 () Bool)

(assert (=> b!1112241 (= e!634155 (and e!634150 mapRes!43357))))

(declare-fun condMapEmpty!43357 () Bool)

(declare-fun mapDefault!43357 () ValueCell!13137)

(assert (=> b!1112241 (= condMapEmpty!43357 (= (arr!34803 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13137)) mapDefault!43357)))))

(declare-fun b!1112242 () Bool)

(declare-fun tp_is_empty!27693 () Bool)

(assert (=> b!1112242 (= e!634150 tp_is_empty!27693)))

(declare-fun b!1112243 () Bool)

(declare-fun res!742212 () Bool)

(assert (=> b!1112243 (=> (not res!742212) (not e!634149))))

(assert (=> b!1112243 (= res!742212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43357 () Bool)

(assert (=> mapIsEmpty!43357 mapRes!43357))

(declare-fun zeroValue!944 () V!42051)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46992 () Bool)

(declare-fun minValue!944 () V!42051)

(declare-fun getCurrentListMapNoExtraKeys!4290 (array!72299 array!72301 (_ BitVec 32) (_ BitVec 32) V!42051 V!42051 (_ BitVec 32) Int) ListLongMap!15569)

(declare-fun dynLambda!2416 (Int (_ BitVec 64)) V!42051)

(assert (=> bm!46992 (= call!46996 (getCurrentListMapNoExtraKeys!4290 lt!496485 (array!72302 (store (arr!34803 _values!996) i!673 (ValueCellFull!13137 (dynLambda!2416 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35339 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112244 () Bool)

(assert (=> b!1112244 (= e!634152 tp_is_empty!27693)))

(declare-fun res!742219 () Bool)

(assert (=> start!97462 (=> (not res!742219) (not e!634149))))

(assert (=> start!97462 (= res!742219 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35338 _keys!1208))))))

(assert (=> start!97462 e!634149))

(assert (=> start!97462 tp_is_empty!27693))

(declare-fun array_inv!26762 (array!72299) Bool)

(assert (=> start!97462 (array_inv!26762 _keys!1208)))

(assert (=> start!97462 true))

(assert (=> start!97462 tp!82598))

(declare-fun array_inv!26763 (array!72301) Bool)

(assert (=> start!97462 (and (array_inv!26763 _values!996) e!634155)))

(declare-fun b!1112245 () Bool)

(declare-fun res!742213 () Bool)

(assert (=> b!1112245 (=> (not res!742213) (not e!634149))))

(assert (=> b!1112245 (= res!742213 (= (select (arr!34802 _keys!1208) i!673) k0!934))))

(declare-fun b!1112246 () Bool)

(assert (=> b!1112246 (= e!634153 true)))

(assert (=> b!1112246 e!634151))

(declare-fun c!109347 () Bool)

(assert (=> b!1112246 (= c!109347 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496486 () Unit!36496)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!313 (array!72299 array!72301 (_ BitVec 32) (_ BitVec 32) V!42051 V!42051 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36496)

(assert (=> b!1112246 (= lt!496486 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!313 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46993 () Bool)

(assert (=> bm!46993 (= call!46995 (getCurrentListMapNoExtraKeys!4290 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97462 res!742219) b!1112232))

(assert (= (and b!1112232 res!742216) b!1112238))

(assert (= (and b!1112238 res!742215) b!1112243))

(assert (= (and b!1112243 res!742212) b!1112231))

(assert (= (and b!1112231 res!742211) b!1112237))

(assert (= (and b!1112237 res!742217) b!1112239))

(assert (= (and b!1112239 res!742209) b!1112245))

(assert (= (and b!1112245 res!742213) b!1112240))

(assert (= (and b!1112240 res!742218) b!1112236))

(assert (= (and b!1112236 res!742210) b!1112233))

(assert (= (and b!1112233 (not res!742214)) b!1112246))

(assert (= (and b!1112246 c!109347) b!1112234))

(assert (= (and b!1112246 (not c!109347)) b!1112235))

(assert (= (or b!1112234 b!1112235) bm!46992))

(assert (= (or b!1112234 b!1112235) bm!46993))

(assert (= (and b!1112241 condMapEmpty!43357) mapIsEmpty!43357))

(assert (= (and b!1112241 (not condMapEmpty!43357)) mapNonEmpty!43357))

(get-info :version)

(assert (= (and mapNonEmpty!43357 ((_ is ValueCellFull!13137) mapValue!43357)) b!1112244))

(assert (= (and b!1112241 ((_ is ValueCellFull!13137) mapDefault!43357)) b!1112242))

(assert (= start!97462 b!1112241))

(declare-fun b_lambda!18457 () Bool)

(assert (=> (not b_lambda!18457) (not bm!46992)))

(declare-fun t!34761 () Bool)

(declare-fun tb!8299 () Bool)

(assert (=> (and start!97462 (= defaultEntry!1004 defaultEntry!1004) t!34761) tb!8299))

(declare-fun result!17159 () Bool)

(assert (=> tb!8299 (= result!17159 tp_is_empty!27693)))

(assert (=> bm!46992 t!34761))

(declare-fun b_and!37705 () Bool)

(assert (= b_and!37703 (and (=> t!34761 result!17159) b_and!37705)))

(declare-fun m!1029829 () Bool)

(assert (=> b!1112245 m!1029829))

(declare-fun m!1029831 () Bool)

(assert (=> b!1112234 m!1029831))

(declare-fun m!1029833 () Bool)

(assert (=> b!1112243 m!1029833))

(declare-fun m!1029835 () Bool)

(assert (=> bm!46993 m!1029835))

(declare-fun m!1029837 () Bool)

(assert (=> b!1112233 m!1029837))

(declare-fun m!1029839 () Bool)

(assert (=> b!1112233 m!1029839))

(declare-fun m!1029841 () Bool)

(assert (=> b!1112240 m!1029841))

(declare-fun m!1029843 () Bool)

(assert (=> b!1112240 m!1029843))

(declare-fun m!1029845 () Bool)

(assert (=> b!1112236 m!1029845))

(declare-fun m!1029847 () Bool)

(assert (=> b!1112232 m!1029847))

(declare-fun m!1029849 () Bool)

(assert (=> b!1112246 m!1029849))

(declare-fun m!1029851 () Bool)

(assert (=> mapNonEmpty!43357 m!1029851))

(declare-fun m!1029853 () Bool)

(assert (=> start!97462 m!1029853))

(declare-fun m!1029855 () Bool)

(assert (=> start!97462 m!1029855))

(declare-fun m!1029857 () Bool)

(assert (=> bm!46992 m!1029857))

(declare-fun m!1029859 () Bool)

(assert (=> bm!46992 m!1029859))

(declare-fun m!1029861 () Bool)

(assert (=> bm!46992 m!1029861))

(declare-fun m!1029863 () Bool)

(assert (=> b!1112239 m!1029863))

(declare-fun m!1029865 () Bool)

(assert (=> b!1112231 m!1029865))

(check-sat (not b_next!23433) (not b!1112236) (not b!1112246) (not b!1112232) (not b!1112233) (not mapNonEmpty!43357) (not start!97462) (not bm!46992) b_and!37705 tp_is_empty!27693 (not b!1112243) (not b!1112234) (not b!1112240) (not b!1112231) (not b_lambda!18457) (not bm!46993) (not b!1112239))
(check-sat b_and!37705 (not b_next!23433))
