; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99984 () Bool)

(assert start!99984)

(declare-fun b_free!25327 () Bool)

(declare-fun b_next!25327 () Bool)

(assert (=> start!99984 (= b_free!25327 (not b_next!25327))))

(declare-fun tp!88695 () Bool)

(declare-fun b_and!41523 () Bool)

(assert (=> start!99984 (= tp!88695 b_and!41523)))

(declare-fun b!1185712 () Bool)

(declare-fun e!674255 () Bool)

(assert (=> b!1185712 (= e!674255 true)))

(declare-datatypes ((V!44937 0))(
  ( (V!44938 (val!14985 Int)) )
))
(declare-datatypes ((tuple2!19256 0))(
  ( (tuple2!19257 (_1!9639 (_ BitVec 64)) (_2!9639 V!44937)) )
))
(declare-datatypes ((List!25989 0))(
  ( (Nil!25986) (Cons!25985 (h!27203 tuple2!19256) (t!38300 List!25989)) )
))
(declare-datatypes ((ListLongMap!17233 0))(
  ( (ListLongMap!17234 (toList!8632 List!25989)) )
))
(declare-fun lt!537556 () ListLongMap!17233)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!537570 () ListLongMap!17233)

(declare-fun -!1653 (ListLongMap!17233 (_ BitVec 64)) ListLongMap!17233)

(assert (=> b!1185712 (= (-!1653 lt!537556 k0!934) lt!537570)))

(declare-datatypes ((array!76559 0))(
  ( (array!76560 (arr!36923 (Array (_ BitVec 32) (_ BitVec 64))) (size!37460 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76559)

(declare-datatypes ((Unit!39215 0))(
  ( (Unit!39216) )
))
(declare-fun lt!537561 () Unit!39215)

(declare-fun lt!537571 () V!44937)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!537573 () ListLongMap!17233)

(declare-fun addRemoveCommutativeForDiffKeys!167 (ListLongMap!17233 (_ BitVec 64) V!44937 (_ BitVec 64)) Unit!39215)

(assert (=> b!1185712 (= lt!537561 (addRemoveCommutativeForDiffKeys!167 lt!537573 (select (arr!36923 _keys!1208) from!1455) lt!537571 k0!934))))

(declare-fun lt!537567 () ListLongMap!17233)

(declare-fun lt!537559 () ListLongMap!17233)

(declare-fun lt!537569 () ListLongMap!17233)

(assert (=> b!1185712 (and (= lt!537569 lt!537556) (= lt!537559 lt!537567))))

(declare-fun lt!537565 () tuple2!19256)

(declare-fun +!3951 (ListLongMap!17233 tuple2!19256) ListLongMap!17233)

(assert (=> b!1185712 (= lt!537556 (+!3951 lt!537573 lt!537565))))

(assert (=> b!1185712 (not (= (select (arr!36923 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537574 () Unit!39215)

(declare-fun e!674253 () Unit!39215)

(assert (=> b!1185712 (= lt!537574 e!674253)))

(declare-fun c!117512 () Bool)

(assert (=> b!1185712 (= c!117512 (= (select (arr!36923 _keys!1208) from!1455) k0!934))))

(declare-fun e!674257 () Bool)

(assert (=> b!1185712 e!674257))

(declare-fun res!787767 () Bool)

(assert (=> b!1185712 (=> (not res!787767) (not e!674257))))

(declare-fun lt!537566 () ListLongMap!17233)

(assert (=> b!1185712 (= res!787767 (= lt!537566 lt!537570))))

(assert (=> b!1185712 (= lt!537570 (+!3951 lt!537559 lt!537565))))

(assert (=> b!1185712 (= lt!537565 (tuple2!19257 (select (arr!36923 _keys!1208) from!1455) lt!537571))))

(declare-fun lt!537572 () V!44937)

(declare-datatypes ((ValueCell!14219 0))(
  ( (ValueCellFull!14219 (v!17619 V!44937)) (EmptyCell!14219) )
))
(declare-datatypes ((array!76561 0))(
  ( (array!76562 (arr!36924 (Array (_ BitVec 32) ValueCell!14219)) (size!37461 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76561)

(declare-fun get!18938 (ValueCell!14219 V!44937) V!44937)

(assert (=> b!1185712 (= lt!537571 (get!18938 (select (arr!36924 _values!996) from!1455) lt!537572))))

(declare-fun b!1185713 () Bool)

(declare-fun e!674252 () Bool)

(assert (=> b!1185713 (= e!674252 e!674255)))

(declare-fun res!787772 () Bool)

(assert (=> b!1185713 (=> res!787772 e!674255)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185713 (= res!787772 (not (validKeyInArray!0 (select (arr!36923 _keys!1208) from!1455))))))

(assert (=> b!1185713 (= lt!537567 lt!537559)))

(assert (=> b!1185713 (= lt!537559 (-!1653 lt!537573 k0!934))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!537563 () array!76559)

(declare-fun minValue!944 () V!44937)

(declare-fun zeroValue!944 () V!44937)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!537558 () array!76561)

(declare-fun getCurrentListMapNoExtraKeys!5103 (array!76559 array!76561 (_ BitVec 32) (_ BitVec 32) V!44937 V!44937 (_ BitVec 32) Int) ListLongMap!17233)

(assert (=> b!1185713 (= lt!537567 (getCurrentListMapNoExtraKeys!5103 lt!537563 lt!537558 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185713 (= lt!537573 (getCurrentListMapNoExtraKeys!5103 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!537562 () Unit!39215)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!874 (array!76559 array!76561 (_ BitVec 32) (_ BitVec 32) V!44937 V!44937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39215)

(assert (=> b!1185713 (= lt!537562 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!874 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185714 () Bool)

(declare-fun Unit!39217 () Unit!39215)

(assert (=> b!1185714 (= e!674253 Unit!39217)))

(declare-fun lt!537564 () Unit!39215)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76559 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39215)

(assert (=> b!1185714 (= lt!537564 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185714 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537568 () Unit!39215)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76559 (_ BitVec 32) (_ BitVec 32)) Unit!39215)

(assert (=> b!1185714 (= lt!537568 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25990 0))(
  ( (Nil!25987) (Cons!25986 (h!27204 (_ BitVec 64)) (t!38301 List!25990)) )
))
(declare-fun arrayNoDuplicates!0 (array!76559 (_ BitVec 32) List!25990) Bool)

(assert (=> b!1185714 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25987)))

(declare-fun lt!537557 () Unit!39215)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76559 (_ BitVec 64) (_ BitVec 32) List!25990) Unit!39215)

(assert (=> b!1185714 (= lt!537557 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25987))))

(assert (=> b!1185714 false))

(declare-fun mapIsEmpty!46613 () Bool)

(declare-fun mapRes!46613 () Bool)

(assert (=> mapIsEmpty!46613 mapRes!46613))

(declare-fun b!1185715 () Bool)

(declare-fun res!787775 () Bool)

(declare-fun e!674249 () Bool)

(assert (=> b!1185715 (=> (not res!787775) (not e!674249))))

(assert (=> b!1185715 (= res!787775 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37460 _keys!1208))))))

(declare-fun b!1185716 () Bool)

(declare-fun e!674258 () Bool)

(assert (=> b!1185716 (= e!674258 e!674252)))

(declare-fun res!787768 () Bool)

(assert (=> b!1185716 (=> res!787768 e!674252)))

(assert (=> b!1185716 (= res!787768 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1185716 (= lt!537566 (getCurrentListMapNoExtraKeys!5103 lt!537563 lt!537558 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1185716 (= lt!537558 (array!76562 (store (arr!36924 _values!996) i!673 (ValueCellFull!14219 lt!537572)) (size!37461 _values!996)))))

(declare-fun dynLambda!3066 (Int (_ BitVec 64)) V!44937)

(assert (=> b!1185716 (= lt!537572 (dynLambda!3066 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1185716 (= lt!537569 (getCurrentListMapNoExtraKeys!5103 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185717 () Bool)

(declare-fun res!787779 () Bool)

(assert (=> b!1185717 (=> (not res!787779) (not e!674249))))

(assert (=> b!1185717 (= res!787779 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25987))))

(declare-fun b!1185718 () Bool)

(declare-fun e!674251 () Bool)

(assert (=> b!1185718 (= e!674249 e!674251)))

(declare-fun res!787780 () Bool)

(assert (=> b!1185718 (=> (not res!787780) (not e!674251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76559 (_ BitVec 32)) Bool)

(assert (=> b!1185718 (= res!787780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537563 mask!1564))))

(assert (=> b!1185718 (= lt!537563 (array!76560 (store (arr!36923 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37460 _keys!1208)))))

(declare-fun b!1185719 () Bool)

(declare-fun res!787776 () Bool)

(assert (=> b!1185719 (=> (not res!787776) (not e!674251))))

(assert (=> b!1185719 (= res!787776 (arrayNoDuplicates!0 lt!537563 #b00000000000000000000000000000000 Nil!25987))))

(declare-fun b!1185720 () Bool)

(assert (=> b!1185720 (= e!674251 (not e!674258))))

(declare-fun res!787771 () Bool)

(assert (=> b!1185720 (=> res!787771 e!674258)))

(assert (=> b!1185720 (= res!787771 (bvsgt from!1455 i!673))))

(assert (=> b!1185720 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!537560 () Unit!39215)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76559 (_ BitVec 64) (_ BitVec 32)) Unit!39215)

(assert (=> b!1185720 (= lt!537560 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185721 () Bool)

(declare-fun res!787773 () Bool)

(assert (=> b!1185721 (=> (not res!787773) (not e!674249))))

(assert (=> b!1185721 (= res!787773 (= (select (arr!36923 _keys!1208) i!673) k0!934))))

(declare-fun b!1185722 () Bool)

(declare-fun res!787769 () Bool)

(assert (=> b!1185722 (=> (not res!787769) (not e!674249))))

(assert (=> b!1185722 (= res!787769 (and (= (size!37461 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37460 _keys!1208) (size!37461 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185723 () Bool)

(declare-fun e!674248 () Bool)

(assert (=> b!1185723 (= e!674257 e!674248)))

(declare-fun res!787774 () Bool)

(assert (=> b!1185723 (=> res!787774 e!674248)))

(assert (=> b!1185723 (= res!787774 (not (= (select (arr!36923 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1185724 () Bool)

(declare-fun res!787777 () Bool)

(assert (=> b!1185724 (=> (not res!787777) (not e!674249))))

(assert (=> b!1185724 (= res!787777 (validKeyInArray!0 k0!934))))

(declare-fun b!1185725 () Bool)

(declare-fun Unit!39218 () Unit!39215)

(assert (=> b!1185725 (= e!674253 Unit!39218)))

(declare-fun b!1185726 () Bool)

(assert (=> b!1185726 (= e!674248 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185727 () Bool)

(declare-fun res!787770 () Bool)

(assert (=> b!1185727 (=> (not res!787770) (not e!674249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185727 (= res!787770 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46613 () Bool)

(declare-fun tp!88694 () Bool)

(declare-fun e!674250 () Bool)

(assert (=> mapNonEmpty!46613 (= mapRes!46613 (and tp!88694 e!674250))))

(declare-fun mapValue!46613 () ValueCell!14219)

(declare-fun mapKey!46613 () (_ BitVec 32))

(declare-fun mapRest!46613 () (Array (_ BitVec 32) ValueCell!14219))

(assert (=> mapNonEmpty!46613 (= (arr!36924 _values!996) (store mapRest!46613 mapKey!46613 mapValue!46613))))

(declare-fun res!787778 () Bool)

(assert (=> start!99984 (=> (not res!787778) (not e!674249))))

(assert (=> start!99984 (= res!787778 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37460 _keys!1208))))))

(assert (=> start!99984 e!674249))

(declare-fun tp_is_empty!29857 () Bool)

(assert (=> start!99984 tp_is_empty!29857))

(declare-fun array_inv!28252 (array!76559) Bool)

(assert (=> start!99984 (array_inv!28252 _keys!1208)))

(assert (=> start!99984 true))

(assert (=> start!99984 tp!88695))

(declare-fun e!674247 () Bool)

(declare-fun array_inv!28253 (array!76561) Bool)

(assert (=> start!99984 (and (array_inv!28253 _values!996) e!674247)))

(declare-fun b!1185728 () Bool)

(declare-fun e!674256 () Bool)

(assert (=> b!1185728 (= e!674256 tp_is_empty!29857)))

(declare-fun b!1185729 () Bool)

(assert (=> b!1185729 (= e!674247 (and e!674256 mapRes!46613))))

(declare-fun condMapEmpty!46613 () Bool)

(declare-fun mapDefault!46613 () ValueCell!14219)

(assert (=> b!1185729 (= condMapEmpty!46613 (= (arr!36924 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14219)) mapDefault!46613)))))

(declare-fun b!1185730 () Bool)

(declare-fun res!787781 () Bool)

(assert (=> b!1185730 (=> (not res!787781) (not e!674249))))

(assert (=> b!1185730 (= res!787781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185731 () Bool)

(assert (=> b!1185731 (= e!674250 tp_is_empty!29857)))

(assert (= (and start!99984 res!787778) b!1185727))

(assert (= (and b!1185727 res!787770) b!1185722))

(assert (= (and b!1185722 res!787769) b!1185730))

(assert (= (and b!1185730 res!787781) b!1185717))

(assert (= (and b!1185717 res!787779) b!1185715))

(assert (= (and b!1185715 res!787775) b!1185724))

(assert (= (and b!1185724 res!787777) b!1185721))

(assert (= (and b!1185721 res!787773) b!1185718))

(assert (= (and b!1185718 res!787780) b!1185719))

(assert (= (and b!1185719 res!787776) b!1185720))

(assert (= (and b!1185720 (not res!787771)) b!1185716))

(assert (= (and b!1185716 (not res!787768)) b!1185713))

(assert (= (and b!1185713 (not res!787772)) b!1185712))

(assert (= (and b!1185712 res!787767) b!1185723))

(assert (= (and b!1185723 (not res!787774)) b!1185726))

(assert (= (and b!1185712 c!117512) b!1185714))

(assert (= (and b!1185712 (not c!117512)) b!1185725))

(assert (= (and b!1185729 condMapEmpty!46613) mapIsEmpty!46613))

(assert (= (and b!1185729 (not condMapEmpty!46613)) mapNonEmpty!46613))

(get-info :version)

(assert (= (and mapNonEmpty!46613 ((_ is ValueCellFull!14219) mapValue!46613)) b!1185731))

(assert (= (and b!1185729 ((_ is ValueCellFull!14219) mapDefault!46613)) b!1185728))

(assert (= start!99984 b!1185729))

(declare-fun b_lambda!20465 () Bool)

(assert (=> (not b_lambda!20465) (not b!1185716)))

(declare-fun t!38299 () Bool)

(declare-fun tb!10131 () Bool)

(assert (=> (and start!99984 (= defaultEntry!1004 defaultEntry!1004) t!38299) tb!10131))

(declare-fun result!20837 () Bool)

(assert (=> tb!10131 (= result!20837 tp_is_empty!29857)))

(assert (=> b!1185716 t!38299))

(declare-fun b_and!41525 () Bool)

(assert (= b_and!41523 (and (=> t!38299 result!20837) b_and!41525)))

(declare-fun m!1094277 () Bool)

(assert (=> b!1185721 m!1094277))

(declare-fun m!1094279 () Bool)

(assert (=> b!1185719 m!1094279))

(declare-fun m!1094281 () Bool)

(assert (=> b!1185712 m!1094281))

(assert (=> b!1185712 m!1094281))

(declare-fun m!1094283 () Bool)

(assert (=> b!1185712 m!1094283))

(declare-fun m!1094285 () Bool)

(assert (=> b!1185712 m!1094285))

(declare-fun m!1094287 () Bool)

(assert (=> b!1185712 m!1094287))

(declare-fun m!1094289 () Bool)

(assert (=> b!1185712 m!1094289))

(declare-fun m!1094291 () Bool)

(assert (=> b!1185712 m!1094291))

(declare-fun m!1094293 () Bool)

(assert (=> b!1185712 m!1094293))

(assert (=> b!1185712 m!1094285))

(declare-fun m!1094295 () Bool)

(assert (=> mapNonEmpty!46613 m!1094295))

(declare-fun m!1094297 () Bool)

(assert (=> b!1185724 m!1094297))

(declare-fun m!1094299 () Bool)

(assert (=> b!1185718 m!1094299))

(declare-fun m!1094301 () Bool)

(assert (=> b!1185718 m!1094301))

(declare-fun m!1094303 () Bool)

(assert (=> b!1185717 m!1094303))

(assert (=> b!1185723 m!1094285))

(declare-fun m!1094305 () Bool)

(assert (=> b!1185726 m!1094305))

(declare-fun m!1094307 () Bool)

(assert (=> start!99984 m!1094307))

(declare-fun m!1094309 () Bool)

(assert (=> start!99984 m!1094309))

(declare-fun m!1094311 () Bool)

(assert (=> b!1185714 m!1094311))

(declare-fun m!1094313 () Bool)

(assert (=> b!1185714 m!1094313))

(declare-fun m!1094315 () Bool)

(assert (=> b!1185714 m!1094315))

(declare-fun m!1094317 () Bool)

(assert (=> b!1185714 m!1094317))

(declare-fun m!1094319 () Bool)

(assert (=> b!1185714 m!1094319))

(declare-fun m!1094321 () Bool)

(assert (=> b!1185730 m!1094321))

(declare-fun m!1094323 () Bool)

(assert (=> b!1185716 m!1094323))

(declare-fun m!1094325 () Bool)

(assert (=> b!1185716 m!1094325))

(declare-fun m!1094327 () Bool)

(assert (=> b!1185716 m!1094327))

(declare-fun m!1094329 () Bool)

(assert (=> b!1185716 m!1094329))

(declare-fun m!1094331 () Bool)

(assert (=> b!1185727 m!1094331))

(declare-fun m!1094333 () Bool)

(assert (=> b!1185720 m!1094333))

(declare-fun m!1094335 () Bool)

(assert (=> b!1185720 m!1094335))

(declare-fun m!1094337 () Bool)

(assert (=> b!1185713 m!1094337))

(declare-fun m!1094339 () Bool)

(assert (=> b!1185713 m!1094339))

(declare-fun m!1094341 () Bool)

(assert (=> b!1185713 m!1094341))

(declare-fun m!1094343 () Bool)

(assert (=> b!1185713 m!1094343))

(assert (=> b!1185713 m!1094285))

(declare-fun m!1094345 () Bool)

(assert (=> b!1185713 m!1094345))

(assert (=> b!1185713 m!1094285))

(check-sat (not b!1185716) (not b!1185718) (not b_next!25327) (not b!1185712) (not b!1185719) (not b!1185720) (not b!1185726) (not b!1185717) (not mapNonEmpty!46613) (not b!1185724) (not b!1185714) (not b!1185730) (not b_lambda!20465) (not start!99984) tp_is_empty!29857 (not b!1185713) b_and!41525 (not b!1185727))
(check-sat b_and!41525 (not b_next!25327))
