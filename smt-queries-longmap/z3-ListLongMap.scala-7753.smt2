; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97264 () Bool)

(assert start!97264)

(declare-fun b_free!23235 () Bool)

(declare-fun b_next!23235 () Bool)

(assert (=> start!97264 (= b_free!23235 (not b_next!23235))))

(declare-fun tp!82003 () Bool)

(declare-fun b_and!37301 () Bool)

(assert (=> start!97264 (= tp!82003 b_and!37301)))

(declare-fun b!1107245 () Bool)

(declare-fun res!738950 () Bool)

(declare-fun e!631761 () Bool)

(assert (=> b!1107245 (=> (not res!738950) (not e!631761))))

(declare-datatypes ((array!71907 0))(
  ( (array!71908 (arr!34606 (Array (_ BitVec 32) (_ BitVec 64))) (size!35142 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71907)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107245 (= res!738950 (= (select (arr!34606 _keys!1208) i!673) k0!934))))

(declare-fun b!1107246 () Bool)

(declare-fun res!738949 () Bool)

(declare-fun e!631758 () Bool)

(assert (=> b!1107246 (=> (not res!738949) (not e!631758))))

(declare-fun lt!495596 () array!71907)

(declare-datatypes ((List!24117 0))(
  ( (Nil!24114) (Cons!24113 (h!25322 (_ BitVec 64)) (t!34398 List!24117)) )
))
(declare-fun arrayNoDuplicates!0 (array!71907 (_ BitVec 32) List!24117) Bool)

(assert (=> b!1107246 (= res!738949 (arrayNoDuplicates!0 lt!495596 #b00000000000000000000000000000000 Nil!24114))))

(declare-fun b!1107247 () Bool)

(declare-fun res!738944 () Bool)

(assert (=> b!1107247 (=> (not res!738944) (not e!631761))))

(assert (=> b!1107247 (= res!738944 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24114))))

(declare-fun b!1107248 () Bool)

(declare-fun res!738948 () Bool)

(assert (=> b!1107248 (=> (not res!738948) (not e!631761))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107248 (= res!738948 (validMask!0 mask!1564))))

(declare-fun b!1107249 () Bool)

(declare-fun e!631757 () Bool)

(assert (=> b!1107249 (= e!631757 true)))

(declare-fun e!631756 () Bool)

(assert (=> b!1107249 e!631756))

(declare-fun c!109032 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1107249 (= c!109032 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!41787 0))(
  ( (V!41788 (val!13804 Int)) )
))
(declare-fun zeroValue!944 () V!41787)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((Unit!36338 0))(
  ( (Unit!36339) )
))
(declare-fun lt!495595 () Unit!36338)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13038 0))(
  ( (ValueCellFull!13038 (v!16437 V!41787)) (EmptyCell!13038) )
))
(declare-datatypes ((array!71909 0))(
  ( (array!71910 (arr!34607 (Array (_ BitVec 32) ValueCell!13038)) (size!35143 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71909)

(declare-fun minValue!944 () V!41787)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!243 (array!71907 array!71909 (_ BitVec 32) (_ BitVec 32) V!41787 V!41787 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36338)

(assert (=> b!1107249 (= lt!495595 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!243 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!738945 () Bool)

(assert (=> start!97264 (=> (not res!738945) (not e!631761))))

(assert (=> start!97264 (= res!738945 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35142 _keys!1208))))))

(assert (=> start!97264 e!631761))

(declare-fun tp_is_empty!27495 () Bool)

(assert (=> start!97264 tp_is_empty!27495))

(declare-fun array_inv!26632 (array!71907) Bool)

(assert (=> start!97264 (array_inv!26632 _keys!1208)))

(assert (=> start!97264 true))

(assert (=> start!97264 tp!82003))

(declare-fun e!631760 () Bool)

(declare-fun array_inv!26633 (array!71909) Bool)

(assert (=> start!97264 (and (array_inv!26633 _values!996) e!631760)))

(declare-fun b!1107250 () Bool)

(declare-datatypes ((tuple2!17432 0))(
  ( (tuple2!17433 (_1!8727 (_ BitVec 64)) (_2!8727 V!41787)) )
))
(declare-datatypes ((List!24118 0))(
  ( (Nil!24115) (Cons!24114 (h!25323 tuple2!17432) (t!34399 List!24118)) )
))
(declare-datatypes ((ListLongMap!15401 0))(
  ( (ListLongMap!15402 (toList!7716 List!24118)) )
))
(declare-fun call!46402 () ListLongMap!15401)

(declare-fun call!46401 () ListLongMap!15401)

(assert (=> b!1107250 (= e!631756 (= call!46402 call!46401))))

(declare-fun bm!46398 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4214 (array!71907 array!71909 (_ BitVec 32) (_ BitVec 32) V!41787 V!41787 (_ BitVec 32) Int) ListLongMap!15401)

(assert (=> bm!46398 (= call!46401 (getCurrentListMapNoExtraKeys!4214 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107251 () Bool)

(declare-fun -!997 (ListLongMap!15401 (_ BitVec 64)) ListLongMap!15401)

(assert (=> b!1107251 (= e!631756 (= call!46402 (-!997 call!46401 k0!934)))))

(declare-fun b!1107252 () Bool)

(assert (=> b!1107252 (= e!631761 e!631758)))

(declare-fun res!738942 () Bool)

(assert (=> b!1107252 (=> (not res!738942) (not e!631758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71907 (_ BitVec 32)) Bool)

(assert (=> b!1107252 (= res!738942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495596 mask!1564))))

(assert (=> b!1107252 (= lt!495596 (array!71908 (store (arr!34606 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35142 _keys!1208)))))

(declare-fun b!1107253 () Bool)

(declare-fun e!631755 () Bool)

(declare-fun mapRes!43060 () Bool)

(assert (=> b!1107253 (= e!631760 (and e!631755 mapRes!43060))))

(declare-fun condMapEmpty!43060 () Bool)

(declare-fun mapDefault!43060 () ValueCell!13038)

(assert (=> b!1107253 (= condMapEmpty!43060 (= (arr!34607 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13038)) mapDefault!43060)))))

(declare-fun b!1107254 () Bool)

(declare-fun res!738946 () Bool)

(assert (=> b!1107254 (=> (not res!738946) (not e!631761))))

(assert (=> b!1107254 (= res!738946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43060 () Bool)

(assert (=> mapIsEmpty!43060 mapRes!43060))

(declare-fun mapNonEmpty!43060 () Bool)

(declare-fun tp!82004 () Bool)

(declare-fun e!631759 () Bool)

(assert (=> mapNonEmpty!43060 (= mapRes!43060 (and tp!82004 e!631759))))

(declare-fun mapRest!43060 () (Array (_ BitVec 32) ValueCell!13038))

(declare-fun mapKey!43060 () (_ BitVec 32))

(declare-fun mapValue!43060 () ValueCell!13038)

(assert (=> mapNonEmpty!43060 (= (arr!34607 _values!996) (store mapRest!43060 mapKey!43060 mapValue!43060))))

(declare-fun bm!46399 () Bool)

(declare-fun dynLambda!2348 (Int (_ BitVec 64)) V!41787)

(assert (=> bm!46399 (= call!46402 (getCurrentListMapNoExtraKeys!4214 lt!495596 (array!71910 (store (arr!34607 _values!996) i!673 (ValueCellFull!13038 (dynLambda!2348 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35143 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107255 () Bool)

(assert (=> b!1107255 (= e!631758 (not e!631757))))

(declare-fun res!738951 () Bool)

(assert (=> b!1107255 (=> res!738951 e!631757)))

(assert (=> b!1107255 (= res!738951 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35142 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107255 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495594 () Unit!36338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71907 (_ BitVec 64) (_ BitVec 32)) Unit!36338)

(assert (=> b!1107255 (= lt!495594 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107256 () Bool)

(declare-fun res!738947 () Bool)

(assert (=> b!1107256 (=> (not res!738947) (not e!631761))))

(assert (=> b!1107256 (= res!738947 (and (= (size!35143 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35142 _keys!1208) (size!35143 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107257 () Bool)

(assert (=> b!1107257 (= e!631759 tp_is_empty!27495)))

(declare-fun b!1107258 () Bool)

(declare-fun res!738943 () Bool)

(assert (=> b!1107258 (=> (not res!738943) (not e!631761))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107258 (= res!738943 (validKeyInArray!0 k0!934))))

(declare-fun b!1107259 () Bool)

(declare-fun res!738952 () Bool)

(assert (=> b!1107259 (=> (not res!738952) (not e!631761))))

(assert (=> b!1107259 (= res!738952 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35142 _keys!1208))))))

(declare-fun b!1107260 () Bool)

(assert (=> b!1107260 (= e!631755 tp_is_empty!27495)))

(assert (= (and start!97264 res!738945) b!1107248))

(assert (= (and b!1107248 res!738948) b!1107256))

(assert (= (and b!1107256 res!738947) b!1107254))

(assert (= (and b!1107254 res!738946) b!1107247))

(assert (= (and b!1107247 res!738944) b!1107259))

(assert (= (and b!1107259 res!738952) b!1107258))

(assert (= (and b!1107258 res!738943) b!1107245))

(assert (= (and b!1107245 res!738950) b!1107252))

(assert (= (and b!1107252 res!738942) b!1107246))

(assert (= (and b!1107246 res!738949) b!1107255))

(assert (= (and b!1107255 (not res!738951)) b!1107249))

(assert (= (and b!1107249 c!109032) b!1107251))

(assert (= (and b!1107249 (not c!109032)) b!1107250))

(assert (= (or b!1107251 b!1107250) bm!46399))

(assert (= (or b!1107251 b!1107250) bm!46398))

(assert (= (and b!1107253 condMapEmpty!43060) mapIsEmpty!43060))

(assert (= (and b!1107253 (not condMapEmpty!43060)) mapNonEmpty!43060))

(get-info :version)

(assert (= (and mapNonEmpty!43060 ((_ is ValueCellFull!13038) mapValue!43060)) b!1107257))

(assert (= (and b!1107253 ((_ is ValueCellFull!13038) mapDefault!43060)) b!1107260))

(assert (= start!97264 b!1107253))

(declare-fun b_lambda!18253 () Bool)

(assert (=> (not b_lambda!18253) (not bm!46399)))

(declare-fun t!34397 () Bool)

(declare-fun tb!8101 () Bool)

(assert (=> (and start!97264 (= defaultEntry!1004 defaultEntry!1004) t!34397) tb!8101))

(declare-fun result!16763 () Bool)

(assert (=> tb!8101 (= result!16763 tp_is_empty!27495)))

(assert (=> bm!46399 t!34397))

(declare-fun b_and!37303 () Bool)

(assert (= b_and!37301 (and (=> t!34397 result!16763) b_and!37303)))

(declare-fun m!1026067 () Bool)

(assert (=> b!1107251 m!1026067))

(declare-fun m!1026069 () Bool)

(assert (=> b!1107258 m!1026069))

(declare-fun m!1026071 () Bool)

(assert (=> b!1107249 m!1026071))

(declare-fun m!1026073 () Bool)

(assert (=> b!1107247 m!1026073))

(declare-fun m!1026075 () Bool)

(assert (=> b!1107246 m!1026075))

(declare-fun m!1026077 () Bool)

(assert (=> mapNonEmpty!43060 m!1026077))

(declare-fun m!1026079 () Bool)

(assert (=> bm!46399 m!1026079))

(declare-fun m!1026081 () Bool)

(assert (=> bm!46399 m!1026081))

(declare-fun m!1026083 () Bool)

(assert (=> bm!46399 m!1026083))

(declare-fun m!1026085 () Bool)

(assert (=> start!97264 m!1026085))

(declare-fun m!1026087 () Bool)

(assert (=> start!97264 m!1026087))

(declare-fun m!1026089 () Bool)

(assert (=> b!1107245 m!1026089))

(declare-fun m!1026091 () Bool)

(assert (=> b!1107254 m!1026091))

(declare-fun m!1026093 () Bool)

(assert (=> b!1107252 m!1026093))

(declare-fun m!1026095 () Bool)

(assert (=> b!1107252 m!1026095))

(declare-fun m!1026097 () Bool)

(assert (=> b!1107248 m!1026097))

(declare-fun m!1026099 () Bool)

(assert (=> b!1107255 m!1026099))

(declare-fun m!1026101 () Bool)

(assert (=> b!1107255 m!1026101))

(declare-fun m!1026103 () Bool)

(assert (=> bm!46398 m!1026103))

(check-sat (not bm!46399) (not b!1107246) (not mapNonEmpty!43060) (not b!1107247) (not bm!46398) tp_is_empty!27495 (not b!1107252) (not b_next!23235) (not b!1107249) (not b_lambda!18253) (not b!1107258) (not b!1107251) b_and!37303 (not b!1107248) (not b!1107255) (not b!1107254) (not start!97264))
(check-sat b_and!37303 (not b_next!23235))
