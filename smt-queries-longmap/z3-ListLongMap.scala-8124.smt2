; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99846 () Bool)

(assert start!99846)

(declare-fun b_free!25189 () Bool)

(declare-fun b_next!25189 () Bool)

(assert (=> start!99846 (= b_free!25189 (not b_next!25189))))

(declare-fun tp!88281 () Bool)

(declare-fun b_and!41247 () Bool)

(assert (=> start!99846 (= tp!88281 b_and!41247)))

(declare-fun mapNonEmpty!46406 () Bool)

(declare-fun mapRes!46406 () Bool)

(declare-fun tp!88280 () Bool)

(declare-fun e!671699 () Bool)

(assert (=> mapNonEmpty!46406 (= mapRes!46406 (and tp!88280 e!671699))))

(declare-datatypes ((V!44753 0))(
  ( (V!44754 (val!14916 Int)) )
))
(declare-datatypes ((ValueCell!14150 0))(
  ( (ValueCellFull!14150 (v!17550 V!44753)) (EmptyCell!14150) )
))
(declare-fun mapRest!46406 () (Array (_ BitVec 32) ValueCell!14150))

(declare-fun mapValue!46406 () ValueCell!14150)

(declare-fun mapKey!46406 () (_ BitVec 32))

(declare-datatypes ((array!76291 0))(
  ( (array!76292 (arr!36789 (Array (_ BitVec 32) ValueCell!14150)) (size!37326 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76291)

(assert (=> mapNonEmpty!46406 (= (arr!36789 _values!996) (store mapRest!46406 mapKey!46406 mapValue!46406))))

(declare-fun b!1181294 () Bool)

(declare-fun tp_is_empty!29719 () Bool)

(assert (=> b!1181294 (= e!671699 tp_is_empty!29719)))

(declare-fun b!1181295 () Bool)

(declare-fun res!784530 () Bool)

(declare-fun e!671695 () Bool)

(assert (=> b!1181295 (=> (not res!784530) (not e!671695))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181295 (= res!784530 (validMask!0 mask!1564))))

(declare-fun b!1181296 () Bool)

(declare-fun e!671700 () Bool)

(declare-fun e!671694 () Bool)

(assert (=> b!1181296 (= e!671700 e!671694)))

(declare-fun res!784536 () Bool)

(assert (=> b!1181296 (=> res!784536 e!671694)))

(declare-datatypes ((array!76293 0))(
  ( (array!76294 (arr!36790 (Array (_ BitVec 32) (_ BitVec 64))) (size!37327 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76293)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1181296 (= res!784536 (not (= (select (arr!36790 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1181297 () Bool)

(declare-fun e!671705 () Bool)

(declare-fun e!671702 () Bool)

(assert (=> b!1181297 (= e!671705 (not e!671702))))

(declare-fun res!784531 () Bool)

(assert (=> b!1181297 (=> res!784531 e!671702)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1181297 (= res!784531 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181297 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39004 0))(
  ( (Unit!39005) )
))
(declare-fun lt!533911 () Unit!39004)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76293 (_ BitVec 64) (_ BitVec 32)) Unit!39004)

(assert (=> b!1181297 (= lt!533911 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181298 () Bool)

(declare-fun res!784537 () Bool)

(declare-fun e!671696 () Bool)

(assert (=> b!1181298 (=> (not res!784537) (not e!671696))))

(declare-datatypes ((tuple2!19146 0))(
  ( (tuple2!19147 (_1!9584 (_ BitVec 64)) (_2!9584 V!44753)) )
))
(declare-datatypes ((List!25876 0))(
  ( (Nil!25873) (Cons!25872 (h!27090 tuple2!19146) (t!38049 List!25876)) )
))
(declare-datatypes ((ListLongMap!17123 0))(
  ( (ListLongMap!17124 (toList!8577 List!25876)) )
))
(declare-fun lt!533915 () ListLongMap!17123)

(declare-fun lt!533916 () tuple2!19146)

(declare-fun lt!533904 () ListLongMap!17123)

(declare-fun +!3901 (ListLongMap!17123 tuple2!19146) ListLongMap!17123)

(assert (=> b!1181298 (= res!784537 (= lt!533904 (+!3901 lt!533915 lt!533916)))))

(declare-fun mapIsEmpty!46406 () Bool)

(assert (=> mapIsEmpty!46406 mapRes!46406))

(declare-fun b!1181299 () Bool)

(assert (=> b!1181299 (= e!671694 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181300 () Bool)

(declare-fun res!784525 () Bool)

(assert (=> b!1181300 (=> (not res!784525) (not e!671695))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1181300 (= res!784525 (and (= (size!37326 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37327 _keys!1208) (size!37326 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181301 () Bool)

(declare-fun res!784534 () Bool)

(assert (=> b!1181301 (=> (not res!784534) (not e!671705))))

(declare-fun lt!533917 () array!76293)

(declare-datatypes ((List!25877 0))(
  ( (Nil!25874) (Cons!25873 (h!27091 (_ BitVec 64)) (t!38050 List!25877)) )
))
(declare-fun arrayNoDuplicates!0 (array!76293 (_ BitVec 32) List!25877) Bool)

(assert (=> b!1181301 (= res!784534 (arrayNoDuplicates!0 lt!533917 #b00000000000000000000000000000000 Nil!25874))))

(declare-fun b!1181302 () Bool)

(assert (=> b!1181302 (= e!671695 e!671705)))

(declare-fun res!784524 () Bool)

(assert (=> b!1181302 (=> (not res!784524) (not e!671705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76293 (_ BitVec 32)) Bool)

(assert (=> b!1181302 (= res!784524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533917 mask!1564))))

(assert (=> b!1181302 (= lt!533917 (array!76294 (store (arr!36790 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37327 _keys!1208)))))

(declare-fun b!1181303 () Bool)

(declare-fun lt!533908 () ListLongMap!17123)

(declare-fun lt!533913 () ListLongMap!17123)

(assert (=> b!1181303 (= e!671696 (= lt!533908 lt!533913))))

(declare-fun b!1181304 () Bool)

(declare-fun e!671701 () Unit!39004)

(declare-fun Unit!39006 () Unit!39004)

(assert (=> b!1181304 (= e!671701 Unit!39006)))

(declare-fun lt!533906 () Unit!39004)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76293 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39004)

(assert (=> b!1181304 (= lt!533906 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1181304 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533912 () Unit!39004)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76293 (_ BitVec 32) (_ BitVec 32)) Unit!39004)

(assert (=> b!1181304 (= lt!533912 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1181304 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25874)))

(declare-fun lt!533914 () Unit!39004)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76293 (_ BitVec 64) (_ BitVec 32) List!25877) Unit!39004)

(assert (=> b!1181304 (= lt!533914 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25874))))

(assert (=> b!1181304 false))

(declare-fun res!784526 () Bool)

(assert (=> start!99846 (=> (not res!784526) (not e!671695))))

(assert (=> start!99846 (= res!784526 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37327 _keys!1208))))))

(assert (=> start!99846 e!671695))

(assert (=> start!99846 tp_is_empty!29719))

(declare-fun array_inv!28170 (array!76293) Bool)

(assert (=> start!99846 (array_inv!28170 _keys!1208)))

(assert (=> start!99846 true))

(assert (=> start!99846 tp!88281))

(declare-fun e!671698 () Bool)

(declare-fun array_inv!28171 (array!76291) Bool)

(assert (=> start!99846 (and (array_inv!28171 _values!996) e!671698)))

(declare-fun b!1181305 () Bool)

(declare-fun res!784523 () Bool)

(assert (=> b!1181305 (=> (not res!784523) (not e!671695))))

(assert (=> b!1181305 (= res!784523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181306 () Bool)

(declare-fun res!784527 () Bool)

(assert (=> b!1181306 (=> (not res!784527) (not e!671695))))

(assert (=> b!1181306 (= res!784527 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25874))))

(declare-fun b!1181307 () Bool)

(declare-fun e!671703 () Bool)

(assert (=> b!1181307 (= e!671702 e!671703)))

(declare-fun res!784532 () Bool)

(assert (=> b!1181307 (=> res!784532 e!671703)))

(assert (=> b!1181307 (= res!784532 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44753)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44753)

(declare-fun lt!533907 () array!76291)

(declare-fun lt!533905 () ListLongMap!17123)

(declare-fun getCurrentListMapNoExtraKeys!5055 (array!76293 array!76291 (_ BitVec 32) (_ BitVec 32) V!44753 V!44753 (_ BitVec 32) Int) ListLongMap!17123)

(assert (=> b!1181307 (= lt!533905 (getCurrentListMapNoExtraKeys!5055 lt!533917 lt!533907 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!533910 () V!44753)

(assert (=> b!1181307 (= lt!533907 (array!76292 (store (arr!36789 _values!996) i!673 (ValueCellFull!14150 lt!533910)) (size!37326 _values!996)))))

(declare-fun dynLambda!3023 (Int (_ BitVec 64)) V!44753)

(assert (=> b!1181307 (= lt!533910 (dynLambda!3023 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1181307 (= lt!533904 (getCurrentListMapNoExtraKeys!5055 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181308 () Bool)

(declare-fun res!784522 () Bool)

(assert (=> b!1181308 (=> (not res!784522) (not e!671695))))

(assert (=> b!1181308 (= res!784522 (= (select (arr!36790 _keys!1208) i!673) k0!934))))

(declare-fun b!1181309 () Bool)

(declare-fun e!671693 () Bool)

(assert (=> b!1181309 (= e!671693 tp_is_empty!29719)))

(declare-fun b!1181310 () Bool)

(declare-fun res!784535 () Bool)

(assert (=> b!1181310 (=> (not res!784535) (not e!671695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181310 (= res!784535 (validKeyInArray!0 k0!934))))

(declare-fun b!1181311 () Bool)

(declare-fun e!671704 () Bool)

(assert (=> b!1181311 (= e!671704 true)))

(assert (=> b!1181311 e!671696))

(declare-fun res!784533 () Bool)

(assert (=> b!1181311 (=> (not res!784533) (not e!671696))))

(assert (=> b!1181311 (= res!784533 (not (= (select (arr!36790 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533903 () Unit!39004)

(assert (=> b!1181311 (= lt!533903 e!671701)))

(declare-fun c!117305 () Bool)

(assert (=> b!1181311 (= c!117305 (= (select (arr!36790 _keys!1208) from!1455) k0!934))))

(assert (=> b!1181311 e!671700))

(declare-fun res!784528 () Bool)

(assert (=> b!1181311 (=> (not res!784528) (not e!671700))))

(assert (=> b!1181311 (= res!784528 (= lt!533905 (+!3901 lt!533908 lt!533916)))))

(declare-fun get!18843 (ValueCell!14150 V!44753) V!44753)

(assert (=> b!1181311 (= lt!533916 (tuple2!19147 (select (arr!36790 _keys!1208) from!1455) (get!18843 (select (arr!36789 _values!996) from!1455) lt!533910)))))

(declare-fun b!1181312 () Bool)

(declare-fun res!784529 () Bool)

(assert (=> b!1181312 (=> (not res!784529) (not e!671695))))

(assert (=> b!1181312 (= res!784529 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37327 _keys!1208))))))

(declare-fun b!1181313 () Bool)

(declare-fun Unit!39007 () Unit!39004)

(assert (=> b!1181313 (= e!671701 Unit!39007)))

(declare-fun b!1181314 () Bool)

(assert (=> b!1181314 (= e!671698 (and e!671693 mapRes!46406))))

(declare-fun condMapEmpty!46406 () Bool)

(declare-fun mapDefault!46406 () ValueCell!14150)

(assert (=> b!1181314 (= condMapEmpty!46406 (= (arr!36789 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14150)) mapDefault!46406)))))

(declare-fun b!1181315 () Bool)

(assert (=> b!1181315 (= e!671703 e!671704)))

(declare-fun res!784538 () Bool)

(assert (=> b!1181315 (=> res!784538 e!671704)))

(assert (=> b!1181315 (= res!784538 (not (validKeyInArray!0 (select (arr!36790 _keys!1208) from!1455))))))

(assert (=> b!1181315 (= lt!533913 lt!533908)))

(declare-fun -!1606 (ListLongMap!17123 (_ BitVec 64)) ListLongMap!17123)

(assert (=> b!1181315 (= lt!533908 (-!1606 lt!533915 k0!934))))

(assert (=> b!1181315 (= lt!533913 (getCurrentListMapNoExtraKeys!5055 lt!533917 lt!533907 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181315 (= lt!533915 (getCurrentListMapNoExtraKeys!5055 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533909 () Unit!39004)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!831 (array!76293 array!76291 (_ BitVec 32) (_ BitVec 32) V!44753 V!44753 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39004)

(assert (=> b!1181315 (= lt!533909 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!831 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99846 res!784526) b!1181295))

(assert (= (and b!1181295 res!784530) b!1181300))

(assert (= (and b!1181300 res!784525) b!1181305))

(assert (= (and b!1181305 res!784523) b!1181306))

(assert (= (and b!1181306 res!784527) b!1181312))

(assert (= (and b!1181312 res!784529) b!1181310))

(assert (= (and b!1181310 res!784535) b!1181308))

(assert (= (and b!1181308 res!784522) b!1181302))

(assert (= (and b!1181302 res!784524) b!1181301))

(assert (= (and b!1181301 res!784534) b!1181297))

(assert (= (and b!1181297 (not res!784531)) b!1181307))

(assert (= (and b!1181307 (not res!784532)) b!1181315))

(assert (= (and b!1181315 (not res!784538)) b!1181311))

(assert (= (and b!1181311 res!784528) b!1181296))

(assert (= (and b!1181296 (not res!784536)) b!1181299))

(assert (= (and b!1181311 c!117305) b!1181304))

(assert (= (and b!1181311 (not c!117305)) b!1181313))

(assert (= (and b!1181311 res!784533) b!1181298))

(assert (= (and b!1181298 res!784537) b!1181303))

(assert (= (and b!1181314 condMapEmpty!46406) mapIsEmpty!46406))

(assert (= (and b!1181314 (not condMapEmpty!46406)) mapNonEmpty!46406))

(get-info :version)

(assert (= (and mapNonEmpty!46406 ((_ is ValueCellFull!14150) mapValue!46406)) b!1181294))

(assert (= (and b!1181314 ((_ is ValueCellFull!14150) mapDefault!46406)) b!1181309))

(assert (= start!99846 b!1181314))

(declare-fun b_lambda!20327 () Bool)

(assert (=> (not b_lambda!20327) (not b!1181307)))

(declare-fun t!38048 () Bool)

(declare-fun tb!9993 () Bool)

(assert (=> (and start!99846 (= defaultEntry!1004 defaultEntry!1004) t!38048) tb!9993))

(declare-fun result!20561 () Bool)

(assert (=> tb!9993 (= result!20561 tp_is_empty!29719)))

(assert (=> b!1181307 t!38048))

(declare-fun b_and!41249 () Bool)

(assert (= b_and!41247 (and (=> t!38048 result!20561) b_and!41249)))

(declare-fun m!1089543 () Bool)

(assert (=> start!99846 m!1089543))

(declare-fun m!1089545 () Bool)

(assert (=> start!99846 m!1089545))

(declare-fun m!1089547 () Bool)

(assert (=> b!1181311 m!1089547))

(declare-fun m!1089549 () Bool)

(assert (=> b!1181311 m!1089549))

(declare-fun m!1089551 () Bool)

(assert (=> b!1181311 m!1089551))

(assert (=> b!1181311 m!1089551))

(declare-fun m!1089553 () Bool)

(assert (=> b!1181311 m!1089553))

(declare-fun m!1089555 () Bool)

(assert (=> b!1181306 m!1089555))

(declare-fun m!1089557 () Bool)

(assert (=> b!1181295 m!1089557))

(declare-fun m!1089559 () Bool)

(assert (=> b!1181299 m!1089559))

(declare-fun m!1089561 () Bool)

(assert (=> b!1181298 m!1089561))

(declare-fun m!1089563 () Bool)

(assert (=> b!1181307 m!1089563))

(declare-fun m!1089565 () Bool)

(assert (=> b!1181307 m!1089565))

(declare-fun m!1089567 () Bool)

(assert (=> b!1181307 m!1089567))

(declare-fun m!1089569 () Bool)

(assert (=> b!1181307 m!1089569))

(declare-fun m!1089571 () Bool)

(assert (=> b!1181301 m!1089571))

(declare-fun m!1089573 () Bool)

(assert (=> b!1181308 m!1089573))

(declare-fun m!1089575 () Bool)

(assert (=> b!1181297 m!1089575))

(declare-fun m!1089577 () Bool)

(assert (=> b!1181297 m!1089577))

(assert (=> b!1181296 m!1089547))

(declare-fun m!1089579 () Bool)

(assert (=> b!1181305 m!1089579))

(declare-fun m!1089581 () Bool)

(assert (=> b!1181302 m!1089581))

(declare-fun m!1089583 () Bool)

(assert (=> b!1181302 m!1089583))

(declare-fun m!1089585 () Bool)

(assert (=> b!1181315 m!1089585))

(declare-fun m!1089587 () Bool)

(assert (=> b!1181315 m!1089587))

(declare-fun m!1089589 () Bool)

(assert (=> b!1181315 m!1089589))

(declare-fun m!1089591 () Bool)

(assert (=> b!1181315 m!1089591))

(assert (=> b!1181315 m!1089547))

(declare-fun m!1089593 () Bool)

(assert (=> b!1181315 m!1089593))

(assert (=> b!1181315 m!1089547))

(declare-fun m!1089595 () Bool)

(assert (=> b!1181310 m!1089595))

(declare-fun m!1089597 () Bool)

(assert (=> b!1181304 m!1089597))

(declare-fun m!1089599 () Bool)

(assert (=> b!1181304 m!1089599))

(declare-fun m!1089601 () Bool)

(assert (=> b!1181304 m!1089601))

(declare-fun m!1089603 () Bool)

(assert (=> b!1181304 m!1089603))

(declare-fun m!1089605 () Bool)

(assert (=> b!1181304 m!1089605))

(declare-fun m!1089607 () Bool)

(assert (=> mapNonEmpty!46406 m!1089607))

(check-sat (not b_next!25189) (not b!1181315) (not b!1181295) tp_is_empty!29719 (not b!1181305) (not start!99846) (not b!1181298) b_and!41249 (not b!1181310) (not b!1181306) (not b!1181301) (not mapNonEmpty!46406) (not b!1181302) (not b_lambda!20327) (not b!1181304) (not b!1181299) (not b!1181307) (not b!1181311) (not b!1181297))
(check-sat b_and!41249 (not b_next!25189))
