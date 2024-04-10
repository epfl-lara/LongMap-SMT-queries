; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99648 () Bool)

(assert start!99648)

(declare-fun b_free!25227 () Bool)

(declare-fun b_next!25227 () Bool)

(assert (=> start!99648 (= b_free!25227 (not b_next!25227))))

(declare-fun tp!88395 () Bool)

(declare-fun b_and!41321 () Bool)

(assert (=> start!99648 (= tp!88395 b_and!41321)))

(declare-fun b!1181297 () Bool)

(declare-fun res!784993 () Bool)

(declare-fun e!671604 () Bool)

(assert (=> b!1181297 (=> (not res!784993) (not e!671604))))

(declare-datatypes ((V!44803 0))(
  ( (V!44804 (val!14935 Int)) )
))
(declare-datatypes ((tuple2!19130 0))(
  ( (tuple2!19131 (_1!9576 (_ BitVec 64)) (_2!9576 V!44803)) )
))
(declare-datatypes ((List!25871 0))(
  ( (Nil!25868) (Cons!25867 (h!27076 tuple2!19130) (t!38090 List!25871)) )
))
(declare-datatypes ((ListLongMap!17099 0))(
  ( (ListLongMap!17100 (toList!8565 List!25871)) )
))
(declare-fun lt!534283 () ListLongMap!17099)

(declare-fun lt!534282 () tuple2!19130)

(declare-fun lt!534280 () ListLongMap!17099)

(declare-fun +!3873 (ListLongMap!17099 tuple2!19130) ListLongMap!17099)

(assert (=> b!1181297 (= res!784993 (= lt!534283 (+!3873 lt!534280 lt!534282)))))

(declare-fun b!1181298 () Bool)

(declare-fun e!671608 () Bool)

(declare-fun e!671607 () Bool)

(declare-fun mapRes!46463 () Bool)

(assert (=> b!1181298 (= e!671608 (and e!671607 mapRes!46463))))

(declare-fun condMapEmpty!46463 () Bool)

(declare-datatypes ((ValueCell!14169 0))(
  ( (ValueCellFull!14169 (v!17573 V!44803)) (EmptyCell!14169) )
))
(declare-datatypes ((array!76317 0))(
  ( (array!76318 (arr!36808 (Array (_ BitVec 32) ValueCell!14169)) (size!37344 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76317)

(declare-fun mapDefault!46463 () ValueCell!14169)

(assert (=> b!1181298 (= condMapEmpty!46463 (= (arr!36808 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14169)) mapDefault!46463)))))

(declare-fun mapIsEmpty!46463 () Bool)

(assert (=> mapIsEmpty!46463 mapRes!46463))

(declare-fun b!1181299 () Bool)

(declare-fun lt!534276 () ListLongMap!17099)

(declare-fun lt!534288 () ListLongMap!17099)

(assert (=> b!1181299 (= e!671604 (= lt!534276 lt!534288))))

(declare-fun res!784997 () Bool)

(declare-fun e!671614 () Bool)

(assert (=> start!99648 (=> (not res!784997) (not e!671614))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76319 0))(
  ( (array!76320 (arr!36809 (Array (_ BitVec 32) (_ BitVec 64))) (size!37345 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76319)

(assert (=> start!99648 (= res!784997 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37345 _keys!1208))))))

(assert (=> start!99648 e!671614))

(declare-fun tp_is_empty!29757 () Bool)

(assert (=> start!99648 tp_is_empty!29757))

(declare-fun array_inv!28106 (array!76319) Bool)

(assert (=> start!99648 (array_inv!28106 _keys!1208)))

(assert (=> start!99648 true))

(assert (=> start!99648 tp!88395))

(declare-fun array_inv!28107 (array!76317) Bool)

(assert (=> start!99648 (and (array_inv!28107 _values!996) e!671608)))

(declare-fun b!1181300 () Bool)

(declare-fun res!784986 () Bool)

(assert (=> b!1181300 (=> (not res!784986) (not e!671614))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181300 (= res!784986 (validKeyInArray!0 k0!934))))

(declare-fun b!1181301 () Bool)

(declare-fun res!784988 () Bool)

(assert (=> b!1181301 (=> (not res!784988) (not e!671614))))

(declare-datatypes ((List!25872 0))(
  ( (Nil!25869) (Cons!25868 (h!27077 (_ BitVec 64)) (t!38091 List!25872)) )
))
(declare-fun arrayNoDuplicates!0 (array!76319 (_ BitVec 32) List!25872) Bool)

(assert (=> b!1181301 (= res!784988 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25869))))

(declare-fun b!1181302 () Bool)

(declare-fun e!671602 () Bool)

(declare-fun e!671609 () Bool)

(assert (=> b!1181302 (= e!671602 e!671609)))

(declare-fun res!784991 () Bool)

(assert (=> b!1181302 (=> res!784991 e!671609)))

(assert (=> b!1181302 (= res!784991 (not (= (select (arr!36809 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1181303 () Bool)

(declare-fun e!671606 () Bool)

(declare-fun e!671611 () Bool)

(assert (=> b!1181303 (= e!671606 (not e!671611))))

(declare-fun res!784987 () Bool)

(assert (=> b!1181303 (=> res!784987 e!671611)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1181303 (= res!784987 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181303 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39062 0))(
  ( (Unit!39063) )
))
(declare-fun lt!534285 () Unit!39062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76319 (_ BitVec 64) (_ BitVec 32)) Unit!39062)

(assert (=> b!1181303 (= lt!534285 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181304 () Bool)

(assert (=> b!1181304 (= e!671607 tp_is_empty!29757)))

(declare-fun b!1181305 () Bool)

(declare-fun res!784992 () Bool)

(assert (=> b!1181305 (=> (not res!784992) (not e!671614))))

(assert (=> b!1181305 (= res!784992 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37345 _keys!1208))))))

(declare-fun b!1181306 () Bool)

(declare-fun e!671603 () Unit!39062)

(declare-fun Unit!39064 () Unit!39062)

(assert (=> b!1181306 (= e!671603 Unit!39064)))

(declare-fun b!1181307 () Bool)

(declare-fun res!784984 () Bool)

(assert (=> b!1181307 (=> (not res!784984) (not e!671614))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181307 (= res!784984 (validMask!0 mask!1564))))

(declare-fun b!1181308 () Bool)

(declare-fun e!671613 () Bool)

(assert (=> b!1181308 (= e!671613 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37345 _keys!1208))))))

(assert (=> b!1181308 e!671604))

(declare-fun res!784999 () Bool)

(assert (=> b!1181308 (=> (not res!784999) (not e!671604))))

(assert (=> b!1181308 (= res!784999 (not (= (select (arr!36809 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!534278 () Unit!39062)

(assert (=> b!1181308 (= lt!534278 e!671603)))

(declare-fun c!116964 () Bool)

(assert (=> b!1181308 (= c!116964 (= (select (arr!36809 _keys!1208) from!1455) k0!934))))

(assert (=> b!1181308 e!671602))

(declare-fun res!784998 () Bool)

(assert (=> b!1181308 (=> (not res!784998) (not e!671602))))

(declare-fun lt!534274 () ListLongMap!17099)

(assert (=> b!1181308 (= res!784998 (= lt!534274 (+!3873 lt!534276 lt!534282)))))

(declare-fun lt!534284 () V!44803)

(declare-fun get!18824 (ValueCell!14169 V!44803) V!44803)

(assert (=> b!1181308 (= lt!534282 (tuple2!19131 (select (arr!36809 _keys!1208) from!1455) (get!18824 (select (arr!36808 _values!996) from!1455) lt!534284)))))

(declare-fun b!1181309 () Bool)

(assert (=> b!1181309 (= e!671614 e!671606)))

(declare-fun res!784994 () Bool)

(assert (=> b!1181309 (=> (not res!784994) (not e!671606))))

(declare-fun lt!534277 () array!76319)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76319 (_ BitVec 32)) Bool)

(assert (=> b!1181309 (= res!784994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534277 mask!1564))))

(assert (=> b!1181309 (= lt!534277 (array!76320 (store (arr!36809 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37345 _keys!1208)))))

(declare-fun b!1181310 () Bool)

(assert (=> b!1181310 (= e!671609 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181311 () Bool)

(declare-fun e!671612 () Bool)

(assert (=> b!1181311 (= e!671612 e!671613)))

(declare-fun res!784995 () Bool)

(assert (=> b!1181311 (=> res!784995 e!671613)))

(assert (=> b!1181311 (= res!784995 (not (validKeyInArray!0 (select (arr!36809 _keys!1208) from!1455))))))

(assert (=> b!1181311 (= lt!534288 lt!534276)))

(declare-fun -!1605 (ListLongMap!17099 (_ BitVec 64)) ListLongMap!17099)

(assert (=> b!1181311 (= lt!534276 (-!1605 lt!534280 k0!934))))

(declare-fun zeroValue!944 () V!44803)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!534279 () array!76317)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44803)

(declare-fun getCurrentListMapNoExtraKeys!5018 (array!76319 array!76317 (_ BitVec 32) (_ BitVec 32) V!44803 V!44803 (_ BitVec 32) Int) ListLongMap!17099)

(assert (=> b!1181311 (= lt!534288 (getCurrentListMapNoExtraKeys!5018 lt!534277 lt!534279 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181311 (= lt!534280 (getCurrentListMapNoExtraKeys!5018 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534275 () Unit!39062)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!832 (array!76319 array!76317 (_ BitVec 32) (_ BitVec 32) V!44803 V!44803 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39062)

(assert (=> b!1181311 (= lt!534275 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!832 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1181312 () Bool)

(declare-fun res!784990 () Bool)

(assert (=> b!1181312 (=> (not res!784990) (not e!671606))))

(assert (=> b!1181312 (= res!784990 (arrayNoDuplicates!0 lt!534277 #b00000000000000000000000000000000 Nil!25869))))

(declare-fun b!1181313 () Bool)

(declare-fun Unit!39065 () Unit!39062)

(assert (=> b!1181313 (= e!671603 Unit!39065)))

(declare-fun lt!534287 () Unit!39062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76319 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39062)

(assert (=> b!1181313 (= lt!534287 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1181313 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534281 () Unit!39062)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76319 (_ BitVec 32) (_ BitVec 32)) Unit!39062)

(assert (=> b!1181313 (= lt!534281 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1181313 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25869)))

(declare-fun lt!534286 () Unit!39062)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76319 (_ BitVec 64) (_ BitVec 32) List!25872) Unit!39062)

(assert (=> b!1181313 (= lt!534286 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25869))))

(assert (=> b!1181313 false))

(declare-fun b!1181314 () Bool)

(declare-fun res!784983 () Bool)

(assert (=> b!1181314 (=> (not res!784983) (not e!671614))))

(assert (=> b!1181314 (= res!784983 (= (select (arr!36809 _keys!1208) i!673) k0!934))))

(declare-fun b!1181315 () Bool)

(declare-fun res!784985 () Bool)

(assert (=> b!1181315 (=> (not res!784985) (not e!671614))))

(assert (=> b!1181315 (= res!784985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46463 () Bool)

(declare-fun tp!88394 () Bool)

(declare-fun e!671605 () Bool)

(assert (=> mapNonEmpty!46463 (= mapRes!46463 (and tp!88394 e!671605))))

(declare-fun mapValue!46463 () ValueCell!14169)

(declare-fun mapKey!46463 () (_ BitVec 32))

(declare-fun mapRest!46463 () (Array (_ BitVec 32) ValueCell!14169))

(assert (=> mapNonEmpty!46463 (= (arr!36808 _values!996) (store mapRest!46463 mapKey!46463 mapValue!46463))))

(declare-fun b!1181316 () Bool)

(declare-fun res!784989 () Bool)

(assert (=> b!1181316 (=> (not res!784989) (not e!671614))))

(assert (=> b!1181316 (= res!784989 (and (= (size!37344 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37345 _keys!1208) (size!37344 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181317 () Bool)

(assert (=> b!1181317 (= e!671611 e!671612)))

(declare-fun res!784996 () Bool)

(assert (=> b!1181317 (=> res!784996 e!671612)))

(assert (=> b!1181317 (= res!784996 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1181317 (= lt!534274 (getCurrentListMapNoExtraKeys!5018 lt!534277 lt!534279 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1181317 (= lt!534279 (array!76318 (store (arr!36808 _values!996) i!673 (ValueCellFull!14169 lt!534284)) (size!37344 _values!996)))))

(declare-fun dynLambda!2974 (Int (_ BitVec 64)) V!44803)

(assert (=> b!1181317 (= lt!534284 (dynLambda!2974 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1181317 (= lt!534283 (getCurrentListMapNoExtraKeys!5018 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181318 () Bool)

(assert (=> b!1181318 (= e!671605 tp_is_empty!29757)))

(assert (= (and start!99648 res!784997) b!1181307))

(assert (= (and b!1181307 res!784984) b!1181316))

(assert (= (and b!1181316 res!784989) b!1181315))

(assert (= (and b!1181315 res!784985) b!1181301))

(assert (= (and b!1181301 res!784988) b!1181305))

(assert (= (and b!1181305 res!784992) b!1181300))

(assert (= (and b!1181300 res!784986) b!1181314))

(assert (= (and b!1181314 res!784983) b!1181309))

(assert (= (and b!1181309 res!784994) b!1181312))

(assert (= (and b!1181312 res!784990) b!1181303))

(assert (= (and b!1181303 (not res!784987)) b!1181317))

(assert (= (and b!1181317 (not res!784996)) b!1181311))

(assert (= (and b!1181311 (not res!784995)) b!1181308))

(assert (= (and b!1181308 res!784998) b!1181302))

(assert (= (and b!1181302 (not res!784991)) b!1181310))

(assert (= (and b!1181308 c!116964) b!1181313))

(assert (= (and b!1181308 (not c!116964)) b!1181306))

(assert (= (and b!1181308 res!784999) b!1181297))

(assert (= (and b!1181297 res!784993) b!1181299))

(assert (= (and b!1181298 condMapEmpty!46463) mapIsEmpty!46463))

(assert (= (and b!1181298 (not condMapEmpty!46463)) mapNonEmpty!46463))

(get-info :version)

(assert (= (and mapNonEmpty!46463 ((_ is ValueCellFull!14169) mapValue!46463)) b!1181318))

(assert (= (and b!1181298 ((_ is ValueCellFull!14169) mapDefault!46463)) b!1181304))

(assert (= start!99648 b!1181298))

(declare-fun b_lambda!20371 () Bool)

(assert (=> (not b_lambda!20371) (not b!1181317)))

(declare-fun t!38089 () Bool)

(declare-fun tb!10039 () Bool)

(assert (=> (and start!99648 (= defaultEntry!1004 defaultEntry!1004) t!38089) tb!10039))

(declare-fun result!20645 () Bool)

(assert (=> tb!10039 (= result!20645 tp_is_empty!29757)))

(assert (=> b!1181317 t!38089))

(declare-fun b_and!41323 () Bool)

(assert (= b_and!41321 (and (=> t!38089 result!20645) b_and!41323)))

(declare-fun m!1089225 () Bool)

(assert (=> b!1181300 m!1089225))

(declare-fun m!1089227 () Bool)

(assert (=> b!1181302 m!1089227))

(declare-fun m!1089229 () Bool)

(assert (=> b!1181301 m!1089229))

(declare-fun m!1089231 () Bool)

(assert (=> mapNonEmpty!46463 m!1089231))

(declare-fun m!1089233 () Bool)

(assert (=> start!99648 m!1089233))

(declare-fun m!1089235 () Bool)

(assert (=> start!99648 m!1089235))

(declare-fun m!1089237 () Bool)

(assert (=> b!1181307 m!1089237))

(declare-fun m!1089239 () Bool)

(assert (=> b!1181314 m!1089239))

(declare-fun m!1089241 () Bool)

(assert (=> b!1181315 m!1089241))

(declare-fun m!1089243 () Bool)

(assert (=> b!1181310 m!1089243))

(declare-fun m!1089245 () Bool)

(assert (=> b!1181309 m!1089245))

(declare-fun m!1089247 () Bool)

(assert (=> b!1181309 m!1089247))

(declare-fun m!1089249 () Bool)

(assert (=> b!1181317 m!1089249))

(declare-fun m!1089251 () Bool)

(assert (=> b!1181317 m!1089251))

(declare-fun m!1089253 () Bool)

(assert (=> b!1181317 m!1089253))

(declare-fun m!1089255 () Bool)

(assert (=> b!1181317 m!1089255))

(declare-fun m!1089257 () Bool)

(assert (=> b!1181297 m!1089257))

(declare-fun m!1089259 () Bool)

(assert (=> b!1181303 m!1089259))

(declare-fun m!1089261 () Bool)

(assert (=> b!1181303 m!1089261))

(assert (=> b!1181308 m!1089227))

(declare-fun m!1089263 () Bool)

(assert (=> b!1181308 m!1089263))

(declare-fun m!1089265 () Bool)

(assert (=> b!1181308 m!1089265))

(assert (=> b!1181308 m!1089265))

(declare-fun m!1089267 () Bool)

(assert (=> b!1181308 m!1089267))

(declare-fun m!1089269 () Bool)

(assert (=> b!1181313 m!1089269))

(declare-fun m!1089271 () Bool)

(assert (=> b!1181313 m!1089271))

(declare-fun m!1089273 () Bool)

(assert (=> b!1181313 m!1089273))

(declare-fun m!1089275 () Bool)

(assert (=> b!1181313 m!1089275))

(declare-fun m!1089277 () Bool)

(assert (=> b!1181313 m!1089277))

(declare-fun m!1089279 () Bool)

(assert (=> b!1181312 m!1089279))

(declare-fun m!1089281 () Bool)

(assert (=> b!1181311 m!1089281))

(declare-fun m!1089283 () Bool)

(assert (=> b!1181311 m!1089283))

(declare-fun m!1089285 () Bool)

(assert (=> b!1181311 m!1089285))

(declare-fun m!1089287 () Bool)

(assert (=> b!1181311 m!1089287))

(assert (=> b!1181311 m!1089227))

(declare-fun m!1089289 () Bool)

(assert (=> b!1181311 m!1089289))

(assert (=> b!1181311 m!1089227))

(check-sat (not b!1181315) (not b!1181301) (not start!99648) (not b!1181309) (not b!1181317) (not b!1181303) (not b!1181300) (not b!1181313) (not mapNonEmpty!46463) (not b!1181307) (not b!1181310) b_and!41323 (not b!1181297) (not b_lambda!20371) (not b!1181312) (not b!1181308) (not b_next!25227) tp_is_empty!29757 (not b!1181311))
(check-sat b_and!41323 (not b_next!25227))
