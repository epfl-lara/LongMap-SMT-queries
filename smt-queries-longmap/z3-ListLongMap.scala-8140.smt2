; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99942 () Bool)

(assert start!99942)

(declare-fun b_free!25285 () Bool)

(declare-fun b_next!25285 () Bool)

(assert (=> start!99942 (= b_free!25285 (not b_next!25285))))

(declare-fun tp!88568 () Bool)

(declare-fun b_and!41439 () Bool)

(assert (=> start!99942 (= tp!88568 b_and!41439)))

(declare-datatypes ((array!76477 0))(
  ( (array!76478 (arr!36882 (Array (_ BitVec 32) (_ BitVec 64))) (size!37419 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76477)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1184410 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!673494 () Bool)

(declare-fun arrayContainsKey!0 (array!76477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184410 (= e!673494 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184411 () Bool)

(declare-fun res!786824 () Bool)

(declare-fun e!673493 () Bool)

(assert (=> b!1184411 (=> (not res!786824) (not e!673493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184411 (= res!786824 (validKeyInArray!0 k0!934))))

(declare-fun b!1184412 () Bool)

(declare-fun res!786825 () Bool)

(assert (=> b!1184412 (=> (not res!786825) (not e!673493))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184412 (= res!786825 (validMask!0 mask!1564))))

(declare-fun b!1184414 () Bool)

(declare-fun res!786828 () Bool)

(assert (=> b!1184414 (=> (not res!786828) (not e!673493))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44881 0))(
  ( (V!44882 (val!14964 Int)) )
))
(declare-datatypes ((ValueCell!14198 0))(
  ( (ValueCellFull!14198 (v!17598 V!44881)) (EmptyCell!14198) )
))
(declare-datatypes ((array!76479 0))(
  ( (array!76480 (arr!36883 (Array (_ BitVec 32) ValueCell!14198)) (size!37420 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76479)

(assert (=> b!1184414 (= res!786828 (and (= (size!37420 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37419 _keys!1208) (size!37420 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184415 () Bool)

(declare-fun e!673496 () Bool)

(assert (=> b!1184415 (= e!673496 true)))

(declare-datatypes ((tuple2!19224 0))(
  ( (tuple2!19225 (_1!9623 (_ BitVec 64)) (_2!9623 V!44881)) )
))
(declare-datatypes ((List!25956 0))(
  ( (Nil!25953) (Cons!25952 (h!27170 tuple2!19224) (t!38225 List!25956)) )
))
(declare-datatypes ((ListLongMap!17201 0))(
  ( (ListLongMap!17202 (toList!8616 List!25956)) )
))
(declare-fun lt!536365 () ListLongMap!17201)

(declare-fun lt!536363 () ListLongMap!17201)

(declare-fun -!1637 (ListLongMap!17201 (_ BitVec 64)) ListLongMap!17201)

(assert (=> b!1184415 (= (-!1637 lt!536365 k0!934) lt!536363)))

(declare-fun lt!536360 () ListLongMap!17201)

(declare-datatypes ((Unit!39153 0))(
  ( (Unit!39154) )
))
(declare-fun lt!536377 () Unit!39153)

(declare-fun lt!536361 () V!44881)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun addRemoveCommutativeForDiffKeys!151 (ListLongMap!17201 (_ BitVec 64) V!44881 (_ BitVec 64)) Unit!39153)

(assert (=> b!1184415 (= lt!536377 (addRemoveCommutativeForDiffKeys!151 lt!536360 (select (arr!36882 _keys!1208) from!1455) lt!536361 k0!934))))

(declare-fun lt!536371 () ListLongMap!17201)

(declare-fun lt!536367 () ListLongMap!17201)

(declare-fun lt!536374 () ListLongMap!17201)

(assert (=> b!1184415 (and (= lt!536374 lt!536365) (= lt!536371 lt!536367))))

(declare-fun lt!536366 () tuple2!19224)

(declare-fun +!3935 (ListLongMap!17201 tuple2!19224) ListLongMap!17201)

(assert (=> b!1184415 (= lt!536365 (+!3935 lt!536360 lt!536366))))

(assert (=> b!1184415 (not (= (select (arr!36882 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536375 () Unit!39153)

(declare-fun e!673498 () Unit!39153)

(assert (=> b!1184415 (= lt!536375 e!673498)))

(declare-fun c!117449 () Bool)

(assert (=> b!1184415 (= c!117449 (= (select (arr!36882 _keys!1208) from!1455) k0!934))))

(declare-fun e!673499 () Bool)

(assert (=> b!1184415 e!673499))

(declare-fun res!786826 () Bool)

(assert (=> b!1184415 (=> (not res!786826) (not e!673499))))

(declare-fun lt!536369 () ListLongMap!17201)

(assert (=> b!1184415 (= res!786826 (= lt!536369 lt!536363))))

(assert (=> b!1184415 (= lt!536363 (+!3935 lt!536371 lt!536366))))

(assert (=> b!1184415 (= lt!536366 (tuple2!19225 (select (arr!36882 _keys!1208) from!1455) lt!536361))))

(declare-fun lt!536372 () V!44881)

(declare-fun get!18908 (ValueCell!14198 V!44881) V!44881)

(assert (=> b!1184415 (= lt!536361 (get!18908 (select (arr!36883 _values!996) from!1455) lt!536372))))

(declare-fun b!1184416 () Bool)

(declare-fun res!786832 () Bool)

(assert (=> b!1184416 (=> (not res!786832) (not e!673493))))

(assert (=> b!1184416 (= res!786832 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37419 _keys!1208))))))

(declare-fun mapNonEmpty!46550 () Bool)

(declare-fun mapRes!46550 () Bool)

(declare-fun tp!88569 () Bool)

(declare-fun e!673502 () Bool)

(assert (=> mapNonEmpty!46550 (= mapRes!46550 (and tp!88569 e!673502))))

(declare-fun mapValue!46550 () ValueCell!14198)

(declare-fun mapKey!46550 () (_ BitVec 32))

(declare-fun mapRest!46550 () (Array (_ BitVec 32) ValueCell!14198))

(assert (=> mapNonEmpty!46550 (= (arr!36883 _values!996) (store mapRest!46550 mapKey!46550 mapValue!46550))))

(declare-fun b!1184417 () Bool)

(declare-fun e!673501 () Bool)

(declare-fun e!673495 () Bool)

(assert (=> b!1184417 (= e!673501 e!673495)))

(declare-fun res!786823 () Bool)

(assert (=> b!1184417 (=> res!786823 e!673495)))

(assert (=> b!1184417 (= res!786823 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44881)

(declare-fun lt!536362 () array!76477)

(declare-fun minValue!944 () V!44881)

(declare-fun lt!536368 () array!76479)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5088 (array!76477 array!76479 (_ BitVec 32) (_ BitVec 32) V!44881 V!44881 (_ BitVec 32) Int) ListLongMap!17201)

(assert (=> b!1184417 (= lt!536369 (getCurrentListMapNoExtraKeys!5088 lt!536362 lt!536368 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1184417 (= lt!536368 (array!76480 (store (arr!36883 _values!996) i!673 (ValueCellFull!14198 lt!536372)) (size!37420 _values!996)))))

(declare-fun dynLambda!3052 (Int (_ BitVec 64)) V!44881)

(assert (=> b!1184417 (= lt!536372 (dynLambda!3052 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1184417 (= lt!536374 (getCurrentListMapNoExtraKeys!5088 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!46550 () Bool)

(assert (=> mapIsEmpty!46550 mapRes!46550))

(declare-fun b!1184418 () Bool)

(declare-fun res!786829 () Bool)

(assert (=> b!1184418 (=> (not res!786829) (not e!673493))))

(assert (=> b!1184418 (= res!786829 (= (select (arr!36882 _keys!1208) i!673) k0!934))))

(declare-fun b!1184419 () Bool)

(declare-fun res!786831 () Bool)

(assert (=> b!1184419 (=> (not res!786831) (not e!673493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76477 (_ BitVec 32)) Bool)

(assert (=> b!1184419 (= res!786831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184420 () Bool)

(declare-fun e!673500 () Bool)

(assert (=> b!1184420 (= e!673493 e!673500)))

(declare-fun res!786830 () Bool)

(assert (=> b!1184420 (=> (not res!786830) (not e!673500))))

(assert (=> b!1184420 (= res!786830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536362 mask!1564))))

(assert (=> b!1184420 (= lt!536362 (array!76478 (store (arr!36882 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37419 _keys!1208)))))

(declare-fun b!1184421 () Bool)

(declare-fun e!673492 () Bool)

(declare-fun tp_is_empty!29815 () Bool)

(assert (=> b!1184421 (= e!673492 tp_is_empty!29815)))

(declare-fun b!1184413 () Bool)

(assert (=> b!1184413 (= e!673500 (not e!673501))))

(declare-fun res!786827 () Bool)

(assert (=> b!1184413 (=> res!786827 e!673501)))

(assert (=> b!1184413 (= res!786827 (bvsgt from!1455 i!673))))

(assert (=> b!1184413 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536376 () Unit!39153)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76477 (_ BitVec 64) (_ BitVec 32)) Unit!39153)

(assert (=> b!1184413 (= lt!536376 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!786835 () Bool)

(assert (=> start!99942 (=> (not res!786835) (not e!673493))))

(assert (=> start!99942 (= res!786835 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37419 _keys!1208))))))

(assert (=> start!99942 e!673493))

(assert (=> start!99942 tp_is_empty!29815))

(declare-fun array_inv!28230 (array!76477) Bool)

(assert (=> start!99942 (array_inv!28230 _keys!1208)))

(assert (=> start!99942 true))

(assert (=> start!99942 tp!88568))

(declare-fun e!673497 () Bool)

(declare-fun array_inv!28231 (array!76479) Bool)

(assert (=> start!99942 (and (array_inv!28231 _values!996) e!673497)))

(declare-fun b!1184422 () Bool)

(declare-fun res!786836 () Bool)

(assert (=> b!1184422 (=> (not res!786836) (not e!673500))))

(declare-datatypes ((List!25957 0))(
  ( (Nil!25954) (Cons!25953 (h!27171 (_ BitVec 64)) (t!38226 List!25957)) )
))
(declare-fun arrayNoDuplicates!0 (array!76477 (_ BitVec 32) List!25957) Bool)

(assert (=> b!1184422 (= res!786836 (arrayNoDuplicates!0 lt!536362 #b00000000000000000000000000000000 Nil!25954))))

(declare-fun b!1184423 () Bool)

(declare-fun Unit!39155 () Unit!39153)

(assert (=> b!1184423 (= e!673498 Unit!39155)))

(declare-fun lt!536359 () Unit!39153)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76477 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39153)

(assert (=> b!1184423 (= lt!536359 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1184423 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536364 () Unit!39153)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76477 (_ BitVec 32) (_ BitVec 32)) Unit!39153)

(assert (=> b!1184423 (= lt!536364 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184423 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25954)))

(declare-fun lt!536370 () Unit!39153)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76477 (_ BitVec 64) (_ BitVec 32) List!25957) Unit!39153)

(assert (=> b!1184423 (= lt!536370 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25954))))

(assert (=> b!1184423 false))

(declare-fun b!1184424 () Bool)

(assert (=> b!1184424 (= e!673502 tp_is_empty!29815)))

(declare-fun b!1184425 () Bool)

(declare-fun Unit!39156 () Unit!39153)

(assert (=> b!1184425 (= e!673498 Unit!39156)))

(declare-fun b!1184426 () Bool)

(assert (=> b!1184426 (= e!673497 (and e!673492 mapRes!46550))))

(declare-fun condMapEmpty!46550 () Bool)

(declare-fun mapDefault!46550 () ValueCell!14198)

(assert (=> b!1184426 (= condMapEmpty!46550 (= (arr!36883 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14198)) mapDefault!46550)))))

(declare-fun b!1184427 () Bool)

(assert (=> b!1184427 (= e!673499 e!673494)))

(declare-fun res!786834 () Bool)

(assert (=> b!1184427 (=> res!786834 e!673494)))

(assert (=> b!1184427 (= res!786834 (not (= (select (arr!36882 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1184428 () Bool)

(assert (=> b!1184428 (= e!673495 e!673496)))

(declare-fun res!786833 () Bool)

(assert (=> b!1184428 (=> res!786833 e!673496)))

(assert (=> b!1184428 (= res!786833 (not (validKeyInArray!0 (select (arr!36882 _keys!1208) from!1455))))))

(assert (=> b!1184428 (= lt!536367 lt!536371)))

(assert (=> b!1184428 (= lt!536371 (-!1637 lt!536360 k0!934))))

(assert (=> b!1184428 (= lt!536367 (getCurrentListMapNoExtraKeys!5088 lt!536362 lt!536368 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184428 (= lt!536360 (getCurrentListMapNoExtraKeys!5088 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536373 () Unit!39153)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!860 (array!76477 array!76479 (_ BitVec 32) (_ BitVec 32) V!44881 V!44881 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39153)

(assert (=> b!1184428 (= lt!536373 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!860 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184429 () Bool)

(declare-fun res!786822 () Bool)

(assert (=> b!1184429 (=> (not res!786822) (not e!673493))))

(assert (=> b!1184429 (= res!786822 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25954))))

(assert (= (and start!99942 res!786835) b!1184412))

(assert (= (and b!1184412 res!786825) b!1184414))

(assert (= (and b!1184414 res!786828) b!1184419))

(assert (= (and b!1184419 res!786831) b!1184429))

(assert (= (and b!1184429 res!786822) b!1184416))

(assert (= (and b!1184416 res!786832) b!1184411))

(assert (= (and b!1184411 res!786824) b!1184418))

(assert (= (and b!1184418 res!786829) b!1184420))

(assert (= (and b!1184420 res!786830) b!1184422))

(assert (= (and b!1184422 res!786836) b!1184413))

(assert (= (and b!1184413 (not res!786827)) b!1184417))

(assert (= (and b!1184417 (not res!786823)) b!1184428))

(assert (= (and b!1184428 (not res!786833)) b!1184415))

(assert (= (and b!1184415 res!786826) b!1184427))

(assert (= (and b!1184427 (not res!786834)) b!1184410))

(assert (= (and b!1184415 c!117449) b!1184423))

(assert (= (and b!1184415 (not c!117449)) b!1184425))

(assert (= (and b!1184426 condMapEmpty!46550) mapIsEmpty!46550))

(assert (= (and b!1184426 (not condMapEmpty!46550)) mapNonEmpty!46550))

(get-info :version)

(assert (= (and mapNonEmpty!46550 ((_ is ValueCellFull!14198) mapValue!46550)) b!1184424))

(assert (= (and b!1184426 ((_ is ValueCellFull!14198) mapDefault!46550)) b!1184421))

(assert (= start!99942 b!1184426))

(declare-fun b_lambda!20423 () Bool)

(assert (=> (not b_lambda!20423) (not b!1184417)))

(declare-fun t!38224 () Bool)

(declare-fun tb!10089 () Bool)

(assert (=> (and start!99942 (= defaultEntry!1004 defaultEntry!1004) t!38224) tb!10089))

(declare-fun result!20753 () Bool)

(assert (=> tb!10089 (= result!20753 tp_is_empty!29815)))

(assert (=> b!1184417 t!38224))

(declare-fun b_and!41441 () Bool)

(assert (= b_and!41439 (and (=> t!38224 result!20753) b_and!41441)))

(declare-fun m!1092807 () Bool)

(assert (=> b!1184412 m!1092807))

(declare-fun m!1092809 () Bool)

(assert (=> b!1184429 m!1092809))

(declare-fun m!1092811 () Bool)

(assert (=> b!1184417 m!1092811))

(declare-fun m!1092813 () Bool)

(assert (=> b!1184417 m!1092813))

(declare-fun m!1092815 () Bool)

(assert (=> b!1184417 m!1092815))

(declare-fun m!1092817 () Bool)

(assert (=> b!1184417 m!1092817))

(declare-fun m!1092819 () Bool)

(assert (=> b!1184422 m!1092819))

(declare-fun m!1092821 () Bool)

(assert (=> b!1184427 m!1092821))

(declare-fun m!1092823 () Bool)

(assert (=> b!1184415 m!1092823))

(declare-fun m!1092825 () Bool)

(assert (=> b!1184415 m!1092825))

(declare-fun m!1092827 () Bool)

(assert (=> b!1184415 m!1092827))

(assert (=> b!1184415 m!1092821))

(declare-fun m!1092829 () Bool)

(assert (=> b!1184415 m!1092829))

(declare-fun m!1092831 () Bool)

(assert (=> b!1184415 m!1092831))

(assert (=> b!1184415 m!1092821))

(assert (=> b!1184415 m!1092823))

(declare-fun m!1092833 () Bool)

(assert (=> b!1184415 m!1092833))

(declare-fun m!1092835 () Bool)

(assert (=> start!99942 m!1092835))

(declare-fun m!1092837 () Bool)

(assert (=> start!99942 m!1092837))

(declare-fun m!1092839 () Bool)

(assert (=> mapNonEmpty!46550 m!1092839))

(declare-fun m!1092841 () Bool)

(assert (=> b!1184410 m!1092841))

(declare-fun m!1092843 () Bool)

(assert (=> b!1184419 m!1092843))

(declare-fun m!1092845 () Bool)

(assert (=> b!1184418 m!1092845))

(declare-fun m!1092847 () Bool)

(assert (=> b!1184420 m!1092847))

(declare-fun m!1092849 () Bool)

(assert (=> b!1184420 m!1092849))

(declare-fun m!1092851 () Bool)

(assert (=> b!1184428 m!1092851))

(declare-fun m!1092853 () Bool)

(assert (=> b!1184428 m!1092853))

(declare-fun m!1092855 () Bool)

(assert (=> b!1184428 m!1092855))

(assert (=> b!1184428 m!1092821))

(declare-fun m!1092857 () Bool)

(assert (=> b!1184428 m!1092857))

(declare-fun m!1092859 () Bool)

(assert (=> b!1184428 m!1092859))

(assert (=> b!1184428 m!1092821))

(declare-fun m!1092861 () Bool)

(assert (=> b!1184423 m!1092861))

(declare-fun m!1092863 () Bool)

(assert (=> b!1184423 m!1092863))

(declare-fun m!1092865 () Bool)

(assert (=> b!1184423 m!1092865))

(declare-fun m!1092867 () Bool)

(assert (=> b!1184423 m!1092867))

(declare-fun m!1092869 () Bool)

(assert (=> b!1184423 m!1092869))

(declare-fun m!1092871 () Bool)

(assert (=> b!1184411 m!1092871))

(declare-fun m!1092873 () Bool)

(assert (=> b!1184413 m!1092873))

(declare-fun m!1092875 () Bool)

(assert (=> b!1184413 m!1092875))

(check-sat (not b!1184419) (not b_lambda!20423) (not b!1184411) (not mapNonEmpty!46550) (not b!1184423) (not b!1184417) (not b!1184420) (not b!1184412) (not b!1184410) (not start!99942) (not b!1184429) tp_is_empty!29815 (not b!1184422) b_and!41441 (not b_next!25285) (not b!1184428) (not b!1184415) (not b!1184413))
(check-sat b_and!41441 (not b_next!25285))
