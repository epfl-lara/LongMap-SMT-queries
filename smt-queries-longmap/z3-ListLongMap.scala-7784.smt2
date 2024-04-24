; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97684 () Bool)

(assert start!97684)

(declare-fun b_free!23419 () Bool)

(declare-fun b_next!23419 () Bool)

(assert (=> start!97684 (= b_free!23419 (not b_next!23419))))

(declare-fun tp!82556 () Bool)

(declare-fun b_and!37685 () Bool)

(assert (=> start!97684 (= tp!82556 b_and!37685)))

(declare-fun b!1113208 () Bool)

(declare-fun res!742502 () Bool)

(declare-fun e!634835 () Bool)

(assert (=> b!1113208 (=> (not res!742502) (not e!634835))))

(declare-datatypes ((array!72309 0))(
  ( (array!72310 (arr!34801 (Array (_ BitVec 32) (_ BitVec 64))) (size!35338 (_ BitVec 32))) )
))
(declare-fun lt!496938 () array!72309)

(declare-datatypes ((List!24289 0))(
  ( (Nil!24286) (Cons!24285 (h!25503 (_ BitVec 64)) (t!34746 List!24289)) )
))
(declare-fun arrayNoDuplicates!0 (array!72309 (_ BitVec 32) List!24289) Bool)

(assert (=> b!1113208 (= res!742502 (arrayNoDuplicates!0 lt!496938 #b00000000000000000000000000000000 Nil!24286))))

(declare-fun b!1113209 () Bool)

(declare-fun e!634838 () Bool)

(declare-datatypes ((V!42033 0))(
  ( (V!42034 (val!13896 Int)) )
))
(declare-datatypes ((tuple2!17608 0))(
  ( (tuple2!17609 (_1!8815 (_ BitVec 64)) (_2!8815 V!42033)) )
))
(declare-datatypes ((List!24290 0))(
  ( (Nil!24287) (Cons!24286 (h!25504 tuple2!17608) (t!34747 List!24290)) )
))
(declare-datatypes ((ListLongMap!15585 0))(
  ( (ListLongMap!15586 (toList!7808 List!24290)) )
))
(declare-fun call!47021 () ListLongMap!15585)

(declare-fun call!47020 () ListLongMap!15585)

(assert (=> b!1113209 (= e!634838 (= call!47021 call!47020))))

(declare-fun b!1113210 () Bool)

(declare-fun res!742501 () Bool)

(declare-fun e!634842 () Bool)

(assert (=> b!1113210 (=> (not res!742501) (not e!634842))))

(declare-fun _keys!1208 () array!72309)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1113210 (= res!742501 (= (select (arr!34801 _keys!1208) i!673) k0!934))))

(declare-fun b!1113211 () Bool)

(declare-fun res!742508 () Bool)

(assert (=> b!1113211 (=> (not res!742508) (not e!634842))))

(assert (=> b!1113211 (= res!742508 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35338 _keys!1208))))))

(declare-fun b!1113212 () Bool)

(declare-fun res!742510 () Bool)

(assert (=> b!1113212 (=> (not res!742510) (not e!634842))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113212 (= res!742510 (validMask!0 mask!1564))))

(declare-fun b!1113213 () Bool)

(declare-fun res!742504 () Bool)

(assert (=> b!1113213 (=> (not res!742504) (not e!634842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72309 (_ BitVec 32)) Bool)

(assert (=> b!1113213 (= res!742504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113214 () Bool)

(declare-fun res!742505 () Bool)

(assert (=> b!1113214 (=> (not res!742505) (not e!634842))))

(assert (=> b!1113214 (= res!742505 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24286))))

(declare-fun b!1113215 () Bool)

(declare-fun e!634841 () Bool)

(declare-fun tp_is_empty!27679 () Bool)

(assert (=> b!1113215 (= e!634841 tp_is_empty!27679)))

(declare-fun b!1113216 () Bool)

(assert (=> b!1113216 (= e!634842 e!634835)))

(declare-fun res!742509 () Bool)

(assert (=> b!1113216 (=> (not res!742509) (not e!634835))))

(assert (=> b!1113216 (= res!742509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496938 mask!1564))))

(assert (=> b!1113216 (= lt!496938 (array!72310 (store (arr!34801 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35338 _keys!1208)))))

(declare-fun b!1113217 () Bool)

(declare-fun e!634837 () Bool)

(assert (=> b!1113217 (= e!634837 tp_is_empty!27679)))

(declare-fun mapIsEmpty!43336 () Bool)

(declare-fun mapRes!43336 () Bool)

(assert (=> mapIsEmpty!43336 mapRes!43336))

(declare-fun b!1113218 () Bool)

(declare-fun res!742506 () Bool)

(assert (=> b!1113218 (=> (not res!742506) (not e!634842))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13130 0))(
  ( (ValueCellFull!13130 (v!16525 V!42033)) (EmptyCell!13130) )
))
(declare-datatypes ((array!72311 0))(
  ( (array!72312 (arr!34802 (Array (_ BitVec 32) ValueCell!13130)) (size!35339 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72311)

(assert (=> b!1113218 (= res!742506 (and (= (size!35339 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35338 _keys!1208) (size!35339 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!742500 () Bool)

(assert (=> start!97684 (=> (not res!742500) (not e!634842))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97684 (= res!742500 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35338 _keys!1208))))))

(assert (=> start!97684 e!634842))

(assert (=> start!97684 tp_is_empty!27679))

(declare-fun array_inv!26814 (array!72309) Bool)

(assert (=> start!97684 (array_inv!26814 _keys!1208)))

(assert (=> start!97684 true))

(assert (=> start!97684 tp!82556))

(declare-fun e!634836 () Bool)

(declare-fun array_inv!26815 (array!72311) Bool)

(assert (=> start!97684 (and (array_inv!26815 _values!996) e!634836)))

(declare-fun b!1113219 () Bool)

(declare-fun e!634839 () Bool)

(assert (=> b!1113219 (= e!634839 true)))

(assert (=> b!1113219 e!634838))

(declare-fun c!109736 () Bool)

(assert (=> b!1113219 (= c!109736 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42033)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36463 0))(
  ( (Unit!36464) )
))
(declare-fun lt!496937 () Unit!36463)

(declare-fun minValue!944 () V!42033)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!319 (array!72309 array!72311 (_ BitVec 32) (_ BitVec 32) V!42033 V!42033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36463)

(assert (=> b!1113219 (= lt!496937 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!319 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47017 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4339 (array!72309 array!72311 (_ BitVec 32) (_ BitVec 32) V!42033 V!42033 (_ BitVec 32) Int) ListLongMap!15585)

(declare-fun dynLambda!2448 (Int (_ BitVec 64)) V!42033)

(assert (=> bm!47017 (= call!47021 (getCurrentListMapNoExtraKeys!4339 lt!496938 (array!72312 (store (arr!34802 _values!996) i!673 (ValueCellFull!13130 (dynLambda!2448 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35339 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1113220 () Bool)

(assert (=> b!1113220 (= e!634835 (not e!634839))))

(declare-fun res!742507 () Bool)

(assert (=> b!1113220 (=> res!742507 e!634839)))

(assert (=> b!1113220 (= res!742507 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35338 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113220 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496939 () Unit!36463)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72309 (_ BitVec 64) (_ BitVec 32)) Unit!36463)

(assert (=> b!1113220 (= lt!496939 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113221 () Bool)

(declare-fun res!742503 () Bool)

(assert (=> b!1113221 (=> (not res!742503) (not e!634842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113221 (= res!742503 (validKeyInArray!0 k0!934))))

(declare-fun b!1113222 () Bool)

(assert (=> b!1113222 (= e!634836 (and e!634837 mapRes!43336))))

(declare-fun condMapEmpty!43336 () Bool)

(declare-fun mapDefault!43336 () ValueCell!13130)

(assert (=> b!1113222 (= condMapEmpty!43336 (= (arr!34802 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13130)) mapDefault!43336)))))

(declare-fun bm!47018 () Bool)

(assert (=> bm!47018 (= call!47020 (getCurrentListMapNoExtraKeys!4339 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1113223 () Bool)

(declare-fun -!1056 (ListLongMap!15585 (_ BitVec 64)) ListLongMap!15585)

(assert (=> b!1113223 (= e!634838 (= call!47021 (-!1056 call!47020 k0!934)))))

(declare-fun mapNonEmpty!43336 () Bool)

(declare-fun tp!82555 () Bool)

(assert (=> mapNonEmpty!43336 (= mapRes!43336 (and tp!82555 e!634841))))

(declare-fun mapRest!43336 () (Array (_ BitVec 32) ValueCell!13130))

(declare-fun mapKey!43336 () (_ BitVec 32))

(declare-fun mapValue!43336 () ValueCell!13130)

(assert (=> mapNonEmpty!43336 (= (arr!34802 _values!996) (store mapRest!43336 mapKey!43336 mapValue!43336))))

(assert (= (and start!97684 res!742500) b!1113212))

(assert (= (and b!1113212 res!742510) b!1113218))

(assert (= (and b!1113218 res!742506) b!1113213))

(assert (= (and b!1113213 res!742504) b!1113214))

(assert (= (and b!1113214 res!742505) b!1113211))

(assert (= (and b!1113211 res!742508) b!1113221))

(assert (= (and b!1113221 res!742503) b!1113210))

(assert (= (and b!1113210 res!742501) b!1113216))

(assert (= (and b!1113216 res!742509) b!1113208))

(assert (= (and b!1113208 res!742502) b!1113220))

(assert (= (and b!1113220 (not res!742507)) b!1113219))

(assert (= (and b!1113219 c!109736) b!1113223))

(assert (= (and b!1113219 (not c!109736)) b!1113209))

(assert (= (or b!1113223 b!1113209) bm!47017))

(assert (= (or b!1113223 b!1113209) bm!47018))

(assert (= (and b!1113222 condMapEmpty!43336) mapIsEmpty!43336))

(assert (= (and b!1113222 (not condMapEmpty!43336)) mapNonEmpty!43336))

(get-info :version)

(assert (= (and mapNonEmpty!43336 ((_ is ValueCellFull!13130) mapValue!43336)) b!1113215))

(assert (= (and b!1113222 ((_ is ValueCellFull!13130) mapDefault!43336)) b!1113217))

(assert (= start!97684 b!1113222))

(declare-fun b_lambda!18453 () Bool)

(assert (=> (not b_lambda!18453) (not bm!47017)))

(declare-fun t!34745 () Bool)

(declare-fun tb!8277 () Bool)

(assert (=> (and start!97684 (= defaultEntry!1004 defaultEntry!1004) t!34745) tb!8277))

(declare-fun result!17123 () Bool)

(assert (=> tb!8277 (= result!17123 tp_is_empty!27679)))

(assert (=> bm!47017 t!34745))

(declare-fun b_and!37687 () Bool)

(assert (= b_and!37685 (and (=> t!34745 result!17123) b_and!37687)))

(declare-fun m!1031235 () Bool)

(assert (=> bm!47017 m!1031235))

(declare-fun m!1031237 () Bool)

(assert (=> bm!47017 m!1031237))

(declare-fun m!1031239 () Bool)

(assert (=> bm!47017 m!1031239))

(declare-fun m!1031241 () Bool)

(assert (=> b!1113208 m!1031241))

(declare-fun m!1031243 () Bool)

(assert (=> b!1113220 m!1031243))

(declare-fun m!1031245 () Bool)

(assert (=> b!1113220 m!1031245))

(declare-fun m!1031247 () Bool)

(assert (=> mapNonEmpty!43336 m!1031247))

(declare-fun m!1031249 () Bool)

(assert (=> b!1113219 m!1031249))

(declare-fun m!1031251 () Bool)

(assert (=> b!1113212 m!1031251))

(declare-fun m!1031253 () Bool)

(assert (=> b!1113216 m!1031253))

(declare-fun m!1031255 () Bool)

(assert (=> b!1113216 m!1031255))

(declare-fun m!1031257 () Bool)

(assert (=> bm!47018 m!1031257))

(declare-fun m!1031259 () Bool)

(assert (=> b!1113214 m!1031259))

(declare-fun m!1031261 () Bool)

(assert (=> b!1113223 m!1031261))

(declare-fun m!1031263 () Bool)

(assert (=> b!1113221 m!1031263))

(declare-fun m!1031265 () Bool)

(assert (=> b!1113213 m!1031265))

(declare-fun m!1031267 () Bool)

(assert (=> b!1113210 m!1031267))

(declare-fun m!1031269 () Bool)

(assert (=> start!97684 m!1031269))

(declare-fun m!1031271 () Bool)

(assert (=> start!97684 m!1031271))

(check-sat (not mapNonEmpty!43336) (not b!1113214) (not b!1113223) (not b!1113219) tp_is_empty!27679 (not b!1113213) (not b!1113212) (not b!1113208) (not b_next!23419) (not start!97684) b_and!37687 (not bm!47018) (not bm!47017) (not b!1113216) (not b!1113221) (not b!1113220) (not b_lambda!18453))
(check-sat b_and!37687 (not b_next!23419))
