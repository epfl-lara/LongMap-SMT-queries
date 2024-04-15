; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99718 () Bool)

(assert start!99718)

(declare-fun b_free!25303 () Bool)

(declare-fun b_next!25303 () Bool)

(assert (=> start!99718 (= b_free!25303 (not b_next!25303))))

(declare-fun tp!88623 () Bool)

(declare-fun b_and!41451 () Bool)

(assert (=> start!99718 (= tp!88623 b_and!41451)))

(declare-fun b!1183555 () Bool)

(declare-fun res!786666 () Bool)

(declare-fun e!672907 () Bool)

(assert (=> b!1183555 (=> (not res!786666) (not e!672907))))

(declare-datatypes ((array!76400 0))(
  ( (array!76401 (arr!36850 (Array (_ BitVec 32) (_ BitVec 64))) (size!37388 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76400)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44905 0))(
  ( (V!44906 (val!14973 Int)) )
))
(declare-datatypes ((ValueCell!14207 0))(
  ( (ValueCellFull!14207 (v!17610 V!44905)) (EmptyCell!14207) )
))
(declare-datatypes ((array!76402 0))(
  ( (array!76403 (arr!36851 (Array (_ BitVec 32) ValueCell!14207)) (size!37389 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76402)

(assert (=> b!1183555 (= res!786666 (and (= (size!37389 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37388 _keys!1208) (size!37389 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183556 () Bool)

(declare-fun e!672906 () Bool)

(declare-fun tp_is_empty!29833 () Bool)

(assert (=> b!1183556 (= e!672906 tp_is_empty!29833)))

(declare-fun mapIsEmpty!46577 () Bool)

(declare-fun mapRes!46577 () Bool)

(assert (=> mapIsEmpty!46577 mapRes!46577))

(declare-fun b!1183557 () Bool)

(declare-fun res!786665 () Bool)

(assert (=> b!1183557 (=> (not res!786665) (not e!672907))))

(declare-datatypes ((List!26016 0))(
  ( (Nil!26013) (Cons!26012 (h!27221 (_ BitVec 64)) (t!38302 List!26016)) )
))
(declare-fun arrayNoDuplicates!0 (array!76400 (_ BitVec 32) List!26016) Bool)

(assert (=> b!1183557 (= res!786665 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26013))))

(declare-fun b!1183558 () Bool)

(declare-fun e!672908 () Bool)

(declare-fun e!672910 () Bool)

(assert (=> b!1183558 (= e!672908 (not e!672910))))

(declare-fun res!786663 () Bool)

(assert (=> b!1183558 (=> res!786663 e!672910)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1183558 (= res!786663 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183558 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39039 0))(
  ( (Unit!39040) )
))
(declare-fun lt!536211 () Unit!39039)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76400 (_ BitVec 64) (_ BitVec 32)) Unit!39039)

(assert (=> b!1183558 (= lt!536211 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183559 () Bool)

(declare-fun e!672915 () Bool)

(declare-fun e!672909 () Bool)

(assert (=> b!1183559 (= e!672915 e!672909)))

(declare-fun res!786662 () Bool)

(assert (=> b!1183559 (=> res!786662 e!672909)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183559 (= res!786662 (not (validKeyInArray!0 (select (arr!36850 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19308 0))(
  ( (tuple2!19309 (_1!9665 (_ BitVec 64)) (_2!9665 V!44905)) )
))
(declare-datatypes ((List!26017 0))(
  ( (Nil!26014) (Cons!26013 (h!27222 tuple2!19308) (t!38303 List!26017)) )
))
(declare-datatypes ((ListLongMap!17277 0))(
  ( (ListLongMap!17278 (toList!8654 List!26017)) )
))
(declare-fun lt!536213 () ListLongMap!17277)

(declare-fun lt!536198 () ListLongMap!17277)

(assert (=> b!1183559 (= lt!536213 lt!536198)))

(declare-fun lt!536204 () ListLongMap!17277)

(declare-fun -!1608 (ListLongMap!17277 (_ BitVec 64)) ListLongMap!17277)

(assert (=> b!1183559 (= lt!536198 (-!1608 lt!536204 k0!934))))

(declare-fun zeroValue!944 () V!44905)

(declare-fun lt!536212 () array!76400)

(declare-fun lt!536214 () array!76402)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44905)

(declare-fun getCurrentListMapNoExtraKeys!5109 (array!76400 array!76402 (_ BitVec 32) (_ BitVec 32) V!44905 V!44905 (_ BitVec 32) Int) ListLongMap!17277)

(assert (=> b!1183559 (= lt!536213 (getCurrentListMapNoExtraKeys!5109 lt!536212 lt!536214 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183559 (= lt!536204 (getCurrentListMapNoExtraKeys!5109 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536199 () Unit!39039)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!870 (array!76400 array!76402 (_ BitVec 32) (_ BitVec 32) V!44905 V!44905 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39039)

(assert (=> b!1183559 (= lt!536199 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!870 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183560 () Bool)

(declare-fun res!786656 () Bool)

(assert (=> b!1183560 (=> (not res!786656) (not e!672907))))

(assert (=> b!1183560 (= res!786656 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37388 _keys!1208))))))

(declare-fun b!1183562 () Bool)

(assert (=> b!1183562 (= e!672907 e!672908)))

(declare-fun res!786657 () Bool)

(assert (=> b!1183562 (=> (not res!786657) (not e!672908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76400 (_ BitVec 32)) Bool)

(assert (=> b!1183562 (= res!786657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536212 mask!1564))))

(assert (=> b!1183562 (= lt!536212 (array!76401 (store (arr!36850 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37388 _keys!1208)))))

(declare-fun b!1183563 () Bool)

(declare-fun e!672905 () Bool)

(declare-fun e!672913 () Bool)

(assert (=> b!1183563 (= e!672905 e!672913)))

(declare-fun res!786667 () Bool)

(assert (=> b!1183563 (=> res!786667 e!672913)))

(assert (=> b!1183563 (= res!786667 (not (= (select (arr!36850 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183564 () Bool)

(declare-fun res!786659 () Bool)

(assert (=> b!1183564 (=> (not res!786659) (not e!672908))))

(assert (=> b!1183564 (= res!786659 (arrayNoDuplicates!0 lt!536212 #b00000000000000000000000000000000 Nil!26013))))

(declare-fun b!1183565 () Bool)

(declare-fun res!786654 () Bool)

(assert (=> b!1183565 (=> (not res!786654) (not e!672907))))

(assert (=> b!1183565 (= res!786654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1183566 () Bool)

(assert (=> b!1183566 (= e!672913 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183567 () Bool)

(declare-fun res!786655 () Bool)

(assert (=> b!1183567 (=> (not res!786655) (not e!672907))))

(assert (=> b!1183567 (= res!786655 (validKeyInArray!0 k0!934))))

(declare-fun b!1183568 () Bool)

(declare-fun e!672912 () Bool)

(assert (=> b!1183568 (= e!672912 tp_is_empty!29833)))

(declare-fun b!1183569 () Bool)

(assert (=> b!1183569 (= e!672910 e!672915)))

(declare-fun res!786653 () Bool)

(assert (=> b!1183569 (=> res!786653 e!672915)))

(assert (=> b!1183569 (= res!786653 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!536209 () ListLongMap!17277)

(assert (=> b!1183569 (= lt!536209 (getCurrentListMapNoExtraKeys!5109 lt!536212 lt!536214 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!536197 () V!44905)

(assert (=> b!1183569 (= lt!536214 (array!76403 (store (arr!36851 _values!996) i!673 (ValueCellFull!14207 lt!536197)) (size!37389 _values!996)))))

(declare-fun dynLambda!3014 (Int (_ BitVec 64)) V!44905)

(assert (=> b!1183569 (= lt!536197 (dynLambda!3014 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!536201 () ListLongMap!17277)

(assert (=> b!1183569 (= lt!536201 (getCurrentListMapNoExtraKeys!5109 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183570 () Bool)

(declare-fun res!786660 () Bool)

(assert (=> b!1183570 (=> (not res!786660) (not e!672907))))

(assert (=> b!1183570 (= res!786660 (= (select (arr!36850 _keys!1208) i!673) k0!934))))

(declare-fun b!1183571 () Bool)

(declare-fun e!672916 () Unit!39039)

(declare-fun Unit!39041 () Unit!39039)

(assert (=> b!1183571 (= e!672916 Unit!39041)))

(declare-fun lt!536208 () Unit!39039)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76400 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39039)

(assert (=> b!1183571 (= lt!536208 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1183571 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536203 () Unit!39039)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76400 (_ BitVec 32) (_ BitVec 32)) Unit!39039)

(assert (=> b!1183571 (= lt!536203 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1183571 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26013)))

(declare-fun lt!536202 () Unit!39039)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76400 (_ BitVec 64) (_ BitVec 32) List!26016) Unit!39039)

(assert (=> b!1183571 (= lt!536202 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26013))))

(assert (=> b!1183571 false))

(declare-fun b!1183572 () Bool)

(declare-fun Unit!39042 () Unit!39039)

(assert (=> b!1183572 (= e!672916 Unit!39042)))

(declare-fun mapNonEmpty!46577 () Bool)

(declare-fun tp!88622 () Bool)

(assert (=> mapNonEmpty!46577 (= mapRes!46577 (and tp!88622 e!672906))))

(declare-fun mapKey!46577 () (_ BitVec 32))

(declare-fun mapValue!46577 () ValueCell!14207)

(declare-fun mapRest!46577 () (Array (_ BitVec 32) ValueCell!14207))

(assert (=> mapNonEmpty!46577 (= (arr!36851 _values!996) (store mapRest!46577 mapKey!46577 mapValue!46577))))

(declare-fun res!786658 () Bool)

(assert (=> start!99718 (=> (not res!786658) (not e!672907))))

(assert (=> start!99718 (= res!786658 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37388 _keys!1208))))))

(assert (=> start!99718 e!672907))

(assert (=> start!99718 tp_is_empty!29833))

(declare-fun array_inv!28240 (array!76400) Bool)

(assert (=> start!99718 (array_inv!28240 _keys!1208)))

(assert (=> start!99718 true))

(assert (=> start!99718 tp!88623))

(declare-fun e!672911 () Bool)

(declare-fun array_inv!28241 (array!76402) Bool)

(assert (=> start!99718 (and (array_inv!28241 _values!996) e!672911)))

(declare-fun b!1183561 () Bool)

(assert (=> b!1183561 (= e!672909 true)))

(declare-fun lt!536206 () ListLongMap!17277)

(declare-fun lt!536205 () ListLongMap!17277)

(assert (=> b!1183561 (= (-!1608 lt!536206 k0!934) lt!536205)))

(declare-fun lt!536207 () Unit!39039)

(declare-fun lt!536210 () V!44905)

(declare-fun addRemoveCommutativeForDiffKeys!156 (ListLongMap!17277 (_ BitVec 64) V!44905 (_ BitVec 64)) Unit!39039)

(assert (=> b!1183561 (= lt!536207 (addRemoveCommutativeForDiffKeys!156 lt!536204 (select (arr!36850 _keys!1208) from!1455) lt!536210 k0!934))))

(assert (=> b!1183561 (and (= lt!536201 lt!536206) (= lt!536198 lt!536213))))

(declare-fun lt!536196 () tuple2!19308)

(declare-fun +!3942 (ListLongMap!17277 tuple2!19308) ListLongMap!17277)

(assert (=> b!1183561 (= lt!536206 (+!3942 lt!536204 lt!536196))))

(assert (=> b!1183561 (not (= (select (arr!36850 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536200 () Unit!39039)

(assert (=> b!1183561 (= lt!536200 e!672916)))

(declare-fun c!117052 () Bool)

(assert (=> b!1183561 (= c!117052 (= (select (arr!36850 _keys!1208) from!1455) k0!934))))

(assert (=> b!1183561 e!672905))

(declare-fun res!786661 () Bool)

(assert (=> b!1183561 (=> (not res!786661) (not e!672905))))

(assert (=> b!1183561 (= res!786661 (= lt!536209 lt!536205))))

(assert (=> b!1183561 (= lt!536205 (+!3942 lt!536198 lt!536196))))

(assert (=> b!1183561 (= lt!536196 (tuple2!19309 (select (arr!36850 _keys!1208) from!1455) lt!536210))))

(declare-fun get!18865 (ValueCell!14207 V!44905) V!44905)

(assert (=> b!1183561 (= lt!536210 (get!18865 (select (arr!36851 _values!996) from!1455) lt!536197))))

(declare-fun b!1183573 () Bool)

(assert (=> b!1183573 (= e!672911 (and e!672912 mapRes!46577))))

(declare-fun condMapEmpty!46577 () Bool)

(declare-fun mapDefault!46577 () ValueCell!14207)

(assert (=> b!1183573 (= condMapEmpty!46577 (= (arr!36851 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14207)) mapDefault!46577)))))

(declare-fun b!1183574 () Bool)

(declare-fun res!786664 () Bool)

(assert (=> b!1183574 (=> (not res!786664) (not e!672907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183574 (= res!786664 (validMask!0 mask!1564))))

(assert (= (and start!99718 res!786658) b!1183574))

(assert (= (and b!1183574 res!786664) b!1183555))

(assert (= (and b!1183555 res!786666) b!1183565))

(assert (= (and b!1183565 res!786654) b!1183557))

(assert (= (and b!1183557 res!786665) b!1183560))

(assert (= (and b!1183560 res!786656) b!1183567))

(assert (= (and b!1183567 res!786655) b!1183570))

(assert (= (and b!1183570 res!786660) b!1183562))

(assert (= (and b!1183562 res!786657) b!1183564))

(assert (= (and b!1183564 res!786659) b!1183558))

(assert (= (and b!1183558 (not res!786663)) b!1183569))

(assert (= (and b!1183569 (not res!786653)) b!1183559))

(assert (= (and b!1183559 (not res!786662)) b!1183561))

(assert (= (and b!1183561 res!786661) b!1183563))

(assert (= (and b!1183563 (not res!786667)) b!1183566))

(assert (= (and b!1183561 c!117052) b!1183571))

(assert (= (and b!1183561 (not c!117052)) b!1183572))

(assert (= (and b!1183573 condMapEmpty!46577) mapIsEmpty!46577))

(assert (= (and b!1183573 (not condMapEmpty!46577)) mapNonEmpty!46577))

(get-info :version)

(assert (= (and mapNonEmpty!46577 ((_ is ValueCellFull!14207) mapValue!46577)) b!1183556))

(assert (= (and b!1183573 ((_ is ValueCellFull!14207) mapDefault!46577)) b!1183568))

(assert (= start!99718 b!1183573))

(declare-fun b_lambda!20429 () Bool)

(assert (=> (not b_lambda!20429) (not b!1183569)))

(declare-fun t!38301 () Bool)

(declare-fun tb!10107 () Bool)

(assert (=> (and start!99718 (= defaultEntry!1004 defaultEntry!1004) t!38301) tb!10107))

(declare-fun result!20789 () Bool)

(assert (=> tb!10107 (= result!20789 tp_is_empty!29833)))

(assert (=> b!1183569 t!38301))

(declare-fun b_and!41453 () Bool)

(assert (= b_and!41451 (and (=> t!38301 result!20789) b_and!41453)))

(declare-fun m!1091255 () Bool)

(assert (=> b!1183567 m!1091255))

(declare-fun m!1091257 () Bool)

(assert (=> start!99718 m!1091257))

(declare-fun m!1091259 () Bool)

(assert (=> start!99718 m!1091259))

(declare-fun m!1091261 () Bool)

(assert (=> b!1183571 m!1091261))

(declare-fun m!1091263 () Bool)

(assert (=> b!1183571 m!1091263))

(declare-fun m!1091265 () Bool)

(assert (=> b!1183571 m!1091265))

(declare-fun m!1091267 () Bool)

(assert (=> b!1183571 m!1091267))

(declare-fun m!1091269 () Bool)

(assert (=> b!1183571 m!1091269))

(declare-fun m!1091271 () Bool)

(assert (=> b!1183562 m!1091271))

(declare-fun m!1091273 () Bool)

(assert (=> b!1183562 m!1091273))

(declare-fun m!1091275 () Bool)

(assert (=> b!1183561 m!1091275))

(declare-fun m!1091277 () Bool)

(assert (=> b!1183561 m!1091277))

(declare-fun m!1091279 () Bool)

(assert (=> b!1183561 m!1091279))

(declare-fun m!1091281 () Bool)

(assert (=> b!1183561 m!1091281))

(assert (=> b!1183561 m!1091275))

(declare-fun m!1091283 () Bool)

(assert (=> b!1183561 m!1091283))

(declare-fun m!1091285 () Bool)

(assert (=> b!1183561 m!1091285))

(declare-fun m!1091287 () Bool)

(assert (=> b!1183561 m!1091287))

(assert (=> b!1183561 m!1091277))

(declare-fun m!1091289 () Bool)

(assert (=> b!1183566 m!1091289))

(declare-fun m!1091291 () Bool)

(assert (=> b!1183570 m!1091291))

(declare-fun m!1091293 () Bool)

(assert (=> b!1183559 m!1091293))

(declare-fun m!1091295 () Bool)

(assert (=> b!1183559 m!1091295))

(declare-fun m!1091297 () Bool)

(assert (=> b!1183559 m!1091297))

(assert (=> b!1183559 m!1091277))

(declare-fun m!1091299 () Bool)

(assert (=> b!1183559 m!1091299))

(declare-fun m!1091301 () Bool)

(assert (=> b!1183559 m!1091301))

(assert (=> b!1183559 m!1091277))

(assert (=> b!1183563 m!1091277))

(declare-fun m!1091303 () Bool)

(assert (=> b!1183574 m!1091303))

(declare-fun m!1091305 () Bool)

(assert (=> b!1183565 m!1091305))

(declare-fun m!1091307 () Bool)

(assert (=> b!1183564 m!1091307))

(declare-fun m!1091309 () Bool)

(assert (=> mapNonEmpty!46577 m!1091309))

(declare-fun m!1091311 () Bool)

(assert (=> b!1183557 m!1091311))

(declare-fun m!1091313 () Bool)

(assert (=> b!1183558 m!1091313))

(declare-fun m!1091315 () Bool)

(assert (=> b!1183558 m!1091315))

(declare-fun m!1091317 () Bool)

(assert (=> b!1183569 m!1091317))

(declare-fun m!1091319 () Bool)

(assert (=> b!1183569 m!1091319))

(declare-fun m!1091321 () Bool)

(assert (=> b!1183569 m!1091321))

(declare-fun m!1091323 () Bool)

(assert (=> b!1183569 m!1091323))

(check-sat (not start!99718) (not b!1183571) (not b!1183562) (not b_lambda!20429) (not b!1183565) (not b!1183567) (not b_next!25303) tp_is_empty!29833 (not mapNonEmpty!46577) (not b!1183558) (not b!1183569) (not b!1183566) (not b!1183574) (not b!1183564) b_and!41453 (not b!1183557) (not b!1183559) (not b!1183561))
(check-sat b_and!41453 (not b_next!25303))
