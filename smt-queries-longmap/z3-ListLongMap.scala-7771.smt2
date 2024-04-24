; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97606 () Bool)

(assert start!97606)

(declare-fun b_free!23341 () Bool)

(declare-fun b_next!23341 () Bool)

(assert (=> start!97606 (= b_free!23341 (not b_next!23341))))

(declare-fun tp!82321 () Bool)

(declare-fun b_and!37525 () Bool)

(assert (=> start!97606 (= tp!82321 b_and!37525)))

(declare-datatypes ((V!41929 0))(
  ( (V!41930 (val!13857 Int)) )
))
(declare-fun zeroValue!944 () V!41929)

(declare-datatypes ((tuple2!17536 0))(
  ( (tuple2!17537 (_1!8779 (_ BitVec 64)) (_2!8779 V!41929)) )
))
(declare-datatypes ((List!24221 0))(
  ( (Nil!24218) (Cons!24217 (h!25435 tuple2!17536) (t!34600 List!24221)) )
))
(declare-datatypes ((ListLongMap!15513 0))(
  ( (ListLongMap!15514 (toList!7772 List!24221)) )
))
(declare-fun call!46786 () ListLongMap!15513)

(declare-datatypes ((array!72153 0))(
  ( (array!72154 (arr!34723 (Array (_ BitVec 32) (_ BitVec 64))) (size!35260 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72153)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13091 0))(
  ( (ValueCellFull!13091 (v!16486 V!41929)) (EmptyCell!13091) )
))
(declare-datatypes ((array!72155 0))(
  ( (array!72156 (arr!34724 (Array (_ BitVec 32) ValueCell!13091)) (size!35261 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72155)

(declare-fun minValue!944 () V!41929)

(declare-fun bm!46783 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4305 (array!72153 array!72155 (_ BitVec 32) (_ BitVec 32) V!41929 V!41929 (_ BitVec 32) Int) ListLongMap!15513)

(assert (=> bm!46783 (= call!46786 (getCurrentListMapNoExtraKeys!4305 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111234 () Bool)

(declare-fun res!741213 () Bool)

(declare-fun e!633894 () Bool)

(assert (=> b!1111234 (=> (not res!741213) (not e!633894))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111234 (= res!741213 (validKeyInArray!0 k0!934))))

(declare-fun res!741219 () Bool)

(assert (=> start!97606 (=> (not res!741219) (not e!633894))))

(assert (=> start!97606 (= res!741219 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35260 _keys!1208))))))

(assert (=> start!97606 e!633894))

(declare-fun tp_is_empty!27601 () Bool)

(assert (=> start!97606 tp_is_empty!27601))

(declare-fun array_inv!26754 (array!72153) Bool)

(assert (=> start!97606 (array_inv!26754 _keys!1208)))

(assert (=> start!97606 true))

(assert (=> start!97606 tp!82321))

(declare-fun e!633887 () Bool)

(declare-fun array_inv!26755 (array!72155) Bool)

(assert (=> start!97606 (and (array_inv!26755 _values!996) e!633887)))

(declare-fun b!1111235 () Bool)

(declare-fun res!741218 () Bool)

(assert (=> b!1111235 (=> (not res!741218) (not e!633894))))

(assert (=> b!1111235 (= res!741218 (and (= (size!35261 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35260 _keys!1208) (size!35261 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111236 () Bool)

(declare-fun e!633890 () Bool)

(assert (=> b!1111236 (= e!633890 true)))

(declare-fun e!633888 () Bool)

(assert (=> b!1111236 e!633888))

(declare-fun c!109607 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111236 (= c!109607 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36401 0))(
  ( (Unit!36402) )
))
(declare-fun lt!496587 () Unit!36401)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!295 (array!72153 array!72155 (_ BitVec 32) (_ BitVec 32) V!41929 V!41929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36401)

(assert (=> b!1111236 (= lt!496587 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!295 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111237 () Bool)

(declare-fun e!633893 () Bool)

(assert (=> b!1111237 (= e!633894 e!633893)))

(declare-fun res!741221 () Bool)

(assert (=> b!1111237 (=> (not res!741221) (not e!633893))))

(declare-fun lt!496586 () array!72153)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72153 (_ BitVec 32)) Bool)

(assert (=> b!1111237 (= res!741221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496586 mask!1564))))

(assert (=> b!1111237 (= lt!496586 (array!72154 (store (arr!34723 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35260 _keys!1208)))))

(declare-fun b!1111238 () Bool)

(declare-fun call!46787 () ListLongMap!15513)

(assert (=> b!1111238 (= e!633888 (= call!46787 call!46786))))

(declare-fun b!1111239 () Bool)

(declare-fun res!741215 () Bool)

(assert (=> b!1111239 (=> (not res!741215) (not e!633894))))

(declare-datatypes ((List!24222 0))(
  ( (Nil!24219) (Cons!24218 (h!25436 (_ BitVec 64)) (t!34601 List!24222)) )
))
(declare-fun arrayNoDuplicates!0 (array!72153 (_ BitVec 32) List!24222) Bool)

(assert (=> b!1111239 (= res!741215 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24219))))

(declare-fun b!1111240 () Bool)

(declare-fun res!741222 () Bool)

(assert (=> b!1111240 (=> (not res!741222) (not e!633894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111240 (= res!741222 (validMask!0 mask!1564))))

(declare-fun b!1111241 () Bool)

(declare-fun res!741214 () Bool)

(assert (=> b!1111241 (=> (not res!741214) (not e!633894))))

(assert (=> b!1111241 (= res!741214 (= (select (arr!34723 _keys!1208) i!673) k0!934))))

(declare-fun b!1111242 () Bool)

(declare-fun e!633892 () Bool)

(assert (=> b!1111242 (= e!633892 tp_is_empty!27601)))

(declare-fun b!1111243 () Bool)

(assert (=> b!1111243 (= e!633893 (not e!633890))))

(declare-fun res!741220 () Bool)

(assert (=> b!1111243 (=> res!741220 e!633890)))

(assert (=> b!1111243 (= res!741220 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35260 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111243 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496588 () Unit!36401)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72153 (_ BitVec 64) (_ BitVec 32)) Unit!36401)

(assert (=> b!1111243 (= lt!496588 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1111244 () Bool)

(declare-fun res!741217 () Bool)

(assert (=> b!1111244 (=> (not res!741217) (not e!633894))))

(assert (=> b!1111244 (= res!741217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43219 () Bool)

(declare-fun mapRes!43219 () Bool)

(assert (=> mapIsEmpty!43219 mapRes!43219))

(declare-fun b!1111245 () Bool)

(declare-fun -!1026 (ListLongMap!15513 (_ BitVec 64)) ListLongMap!15513)

(assert (=> b!1111245 (= e!633888 (= call!46787 (-!1026 call!46786 k0!934)))))

(declare-fun b!1111246 () Bool)

(declare-fun res!741223 () Bool)

(assert (=> b!1111246 (=> (not res!741223) (not e!633893))))

(assert (=> b!1111246 (= res!741223 (arrayNoDuplicates!0 lt!496586 #b00000000000000000000000000000000 Nil!24219))))

(declare-fun bm!46784 () Bool)

(declare-fun dynLambda!2417 (Int (_ BitVec 64)) V!41929)

(assert (=> bm!46784 (= call!46787 (getCurrentListMapNoExtraKeys!4305 lt!496586 (array!72156 (store (arr!34724 _values!996) i!673 (ValueCellFull!13091 (dynLambda!2417 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35261 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111247 () Bool)

(declare-fun res!741216 () Bool)

(assert (=> b!1111247 (=> (not res!741216) (not e!633894))))

(assert (=> b!1111247 (= res!741216 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35260 _keys!1208))))))

(declare-fun b!1111248 () Bool)

(declare-fun e!633891 () Bool)

(assert (=> b!1111248 (= e!633891 tp_is_empty!27601)))

(declare-fun b!1111249 () Bool)

(assert (=> b!1111249 (= e!633887 (and e!633891 mapRes!43219))))

(declare-fun condMapEmpty!43219 () Bool)

(declare-fun mapDefault!43219 () ValueCell!13091)

(assert (=> b!1111249 (= condMapEmpty!43219 (= (arr!34724 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13091)) mapDefault!43219)))))

(declare-fun mapNonEmpty!43219 () Bool)

(declare-fun tp!82322 () Bool)

(assert (=> mapNonEmpty!43219 (= mapRes!43219 (and tp!82322 e!633892))))

(declare-fun mapValue!43219 () ValueCell!13091)

(declare-fun mapRest!43219 () (Array (_ BitVec 32) ValueCell!13091))

(declare-fun mapKey!43219 () (_ BitVec 32))

(assert (=> mapNonEmpty!43219 (= (arr!34724 _values!996) (store mapRest!43219 mapKey!43219 mapValue!43219))))

(assert (= (and start!97606 res!741219) b!1111240))

(assert (= (and b!1111240 res!741222) b!1111235))

(assert (= (and b!1111235 res!741218) b!1111244))

(assert (= (and b!1111244 res!741217) b!1111239))

(assert (= (and b!1111239 res!741215) b!1111247))

(assert (= (and b!1111247 res!741216) b!1111234))

(assert (= (and b!1111234 res!741213) b!1111241))

(assert (= (and b!1111241 res!741214) b!1111237))

(assert (= (and b!1111237 res!741221) b!1111246))

(assert (= (and b!1111246 res!741223) b!1111243))

(assert (= (and b!1111243 (not res!741220)) b!1111236))

(assert (= (and b!1111236 c!109607) b!1111245))

(assert (= (and b!1111236 (not c!109607)) b!1111238))

(assert (= (or b!1111245 b!1111238) bm!46784))

(assert (= (or b!1111245 b!1111238) bm!46783))

(assert (= (and b!1111249 condMapEmpty!43219) mapIsEmpty!43219))

(assert (= (and b!1111249 (not condMapEmpty!43219)) mapNonEmpty!43219))

(get-info :version)

(assert (= (and mapNonEmpty!43219 ((_ is ValueCellFull!13091) mapValue!43219)) b!1111242))

(assert (= (and b!1111249 ((_ is ValueCellFull!13091) mapDefault!43219)) b!1111248))

(assert (= start!97606 b!1111249))

(declare-fun b_lambda!18371 () Bool)

(assert (=> (not b_lambda!18371) (not bm!46784)))

(declare-fun t!34599 () Bool)

(declare-fun tb!8199 () Bool)

(assert (=> (and start!97606 (= defaultEntry!1004 defaultEntry!1004) t!34599) tb!8199))

(declare-fun result!16967 () Bool)

(assert (=> tb!8199 (= result!16967 tp_is_empty!27601)))

(assert (=> bm!46784 t!34599))

(declare-fun b_and!37527 () Bool)

(assert (= b_and!37525 (and (=> t!34599 result!16967) b_and!37527)))

(declare-fun m!1029753 () Bool)

(assert (=> b!1111241 m!1029753))

(declare-fun m!1029755 () Bool)

(assert (=> b!1111246 m!1029755))

(declare-fun m!1029757 () Bool)

(assert (=> b!1111236 m!1029757))

(declare-fun m!1029759 () Bool)

(assert (=> bm!46784 m!1029759))

(declare-fun m!1029761 () Bool)

(assert (=> bm!46784 m!1029761))

(declare-fun m!1029763 () Bool)

(assert (=> bm!46784 m!1029763))

(declare-fun m!1029765 () Bool)

(assert (=> b!1111240 m!1029765))

(declare-fun m!1029767 () Bool)

(assert (=> bm!46783 m!1029767))

(declare-fun m!1029769 () Bool)

(assert (=> b!1111244 m!1029769))

(declare-fun m!1029771 () Bool)

(assert (=> b!1111243 m!1029771))

(declare-fun m!1029773 () Bool)

(assert (=> b!1111243 m!1029773))

(declare-fun m!1029775 () Bool)

(assert (=> b!1111237 m!1029775))

(declare-fun m!1029777 () Bool)

(assert (=> b!1111237 m!1029777))

(declare-fun m!1029779 () Bool)

(assert (=> b!1111245 m!1029779))

(declare-fun m!1029781 () Bool)

(assert (=> start!97606 m!1029781))

(declare-fun m!1029783 () Bool)

(assert (=> start!97606 m!1029783))

(declare-fun m!1029785 () Bool)

(assert (=> b!1111239 m!1029785))

(declare-fun m!1029787 () Bool)

(assert (=> b!1111234 m!1029787))

(declare-fun m!1029789 () Bool)

(assert (=> mapNonEmpty!43219 m!1029789))

(check-sat (not bm!46784) (not bm!46783) (not b!1111234) (not b!1111243) (not mapNonEmpty!43219) (not b!1111237) (not b!1111244) (not b!1111245) (not b!1111240) tp_is_empty!27601 (not start!97606) (not b!1111236) (not b_next!23341) (not b!1111246) (not b_lambda!18371) b_and!37527 (not b!1111239))
(check-sat b_and!37527 (not b_next!23341))
