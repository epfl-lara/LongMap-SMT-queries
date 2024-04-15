; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99256 () Bool)

(assert start!99256)

(declare-fun b_free!24841 () Bool)

(declare-fun b_next!24841 () Bool)

(assert (=> start!99256 (= b_free!24841 (not b_next!24841))))

(declare-fun tp!87236 () Bool)

(declare-fun b_and!40527 () Bool)

(assert (=> start!99256 (= tp!87236 b_and!40527)))

(declare-fun b!1168878 () Bool)

(declare-fun res!775560 () Bool)

(declare-fun e!664308 () Bool)

(assert (=> b!1168878 (=> (not res!775560) (not e!664308))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168878 (= res!775560 (validKeyInArray!0 k0!934))))

(declare-fun b!1168879 () Bool)

(declare-fun e!664313 () Bool)

(assert (=> b!1168879 (= e!664308 e!664313)))

(declare-fun res!775558 () Bool)

(assert (=> b!1168879 (=> (not res!775558) (not e!664313))))

(declare-datatypes ((array!75490 0))(
  ( (array!75491 (arr!36395 (Array (_ BitVec 32) (_ BitVec 64))) (size!36933 (_ BitVec 32))) )
))
(declare-fun lt!526167 () array!75490)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75490 (_ BitVec 32)) Bool)

(assert (=> b!1168879 (= res!775558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526167 mask!1564))))

(declare-fun _keys!1208 () array!75490)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1168879 (= lt!526167 (array!75491 (store (arr!36395 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36933 _keys!1208)))))

(declare-fun b!1168880 () Bool)

(declare-fun e!664318 () Bool)

(declare-fun e!664315 () Bool)

(assert (=> b!1168880 (= e!664318 e!664315)))

(declare-fun res!775559 () Bool)

(assert (=> b!1168880 (=> res!775559 e!664315)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1168880 (= res!775559 (not (validKeyInArray!0 (select (arr!36395 _keys!1208) from!1455))))))

(declare-datatypes ((V!44289 0))(
  ( (V!44290 (val!14742 Int)) )
))
(declare-datatypes ((tuple2!18906 0))(
  ( (tuple2!18907 (_1!9464 (_ BitVec 64)) (_2!9464 V!44289)) )
))
(declare-datatypes ((List!25622 0))(
  ( (Nil!25619) (Cons!25618 (h!26827 tuple2!18906) (t!37446 List!25622)) )
))
(declare-datatypes ((ListLongMap!16875 0))(
  ( (ListLongMap!16876 (toList!8453 List!25622)) )
))
(declare-fun lt!526164 () ListLongMap!16875)

(declare-fun lt!526166 () ListLongMap!16875)

(assert (=> b!1168880 (= lt!526164 lt!526166)))

(declare-fun lt!526163 () ListLongMap!16875)

(declare-fun -!1459 (ListLongMap!16875 (_ BitVec 64)) ListLongMap!16875)

(assert (=> b!1168880 (= lt!526166 (-!1459 lt!526163 k0!934))))

(declare-datatypes ((ValueCell!13976 0))(
  ( (ValueCellFull!13976 (v!17379 V!44289)) (EmptyCell!13976) )
))
(declare-datatypes ((array!75492 0))(
  ( (array!75493 (arr!36396 (Array (_ BitVec 32) ValueCell!13976)) (size!36934 (_ BitVec 32))) )
))
(declare-fun lt!526161 () array!75492)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun zeroValue!944 () V!44289)

(declare-fun minValue!944 () V!44289)

(declare-fun getCurrentListMapNoExtraKeys!4929 (array!75490 array!75492 (_ BitVec 32) (_ BitVec 32) V!44289 V!44289 (_ BitVec 32) Int) ListLongMap!16875)

(assert (=> b!1168880 (= lt!526164 (getCurrentListMapNoExtraKeys!4929 lt!526167 lt!526161 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75492)

(assert (=> b!1168880 (= lt!526163 (getCurrentListMapNoExtraKeys!4929 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38395 0))(
  ( (Unit!38396) )
))
(declare-fun lt!526165 () Unit!38395)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!723 (array!75490 array!75492 (_ BitVec 32) (_ BitVec 32) V!44289 V!44289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38395)

(assert (=> b!1168880 (= lt!526165 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!723 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168881 () Bool)

(declare-fun e!664316 () Bool)

(assert (=> b!1168881 (= e!664313 (not e!664316))))

(declare-fun res!775547 () Bool)

(assert (=> b!1168881 (=> res!775547 e!664316)))

(assert (=> b!1168881 (= res!775547 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168881 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526169 () Unit!38395)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75490 (_ BitVec 64) (_ BitVec 32)) Unit!38395)

(assert (=> b!1168881 (= lt!526169 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!45884 () Bool)

(declare-fun mapRes!45884 () Bool)

(declare-fun tp!87237 () Bool)

(declare-fun e!664311 () Bool)

(assert (=> mapNonEmpty!45884 (= mapRes!45884 (and tp!87237 e!664311))))

(declare-fun mapRest!45884 () (Array (_ BitVec 32) ValueCell!13976))

(declare-fun mapValue!45884 () ValueCell!13976)

(declare-fun mapKey!45884 () (_ BitVec 32))

(assert (=> mapNonEmpty!45884 (= (arr!36396 _values!996) (store mapRest!45884 mapKey!45884 mapValue!45884))))

(declare-fun mapIsEmpty!45884 () Bool)

(assert (=> mapIsEmpty!45884 mapRes!45884))

(declare-fun b!1168882 () Bool)

(declare-fun res!775553 () Bool)

(assert (=> b!1168882 (=> (not res!775553) (not e!664308))))

(declare-datatypes ((List!25623 0))(
  ( (Nil!25620) (Cons!25619 (h!26828 (_ BitVec 64)) (t!37447 List!25623)) )
))
(declare-fun arrayNoDuplicates!0 (array!75490 (_ BitVec 32) List!25623) Bool)

(assert (=> b!1168882 (= res!775553 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25620))))

(declare-fun b!1168883 () Bool)

(declare-fun res!775550 () Bool)

(assert (=> b!1168883 (=> (not res!775550) (not e!664308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168883 (= res!775550 (validMask!0 mask!1564))))

(declare-fun res!775551 () Bool)

(assert (=> start!99256 (=> (not res!775551) (not e!664308))))

(assert (=> start!99256 (= res!775551 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36933 _keys!1208))))))

(assert (=> start!99256 e!664308))

(declare-fun tp_is_empty!29371 () Bool)

(assert (=> start!99256 tp_is_empty!29371))

(declare-fun array_inv!27920 (array!75490) Bool)

(assert (=> start!99256 (array_inv!27920 _keys!1208)))

(assert (=> start!99256 true))

(assert (=> start!99256 tp!87236))

(declare-fun e!664310 () Bool)

(declare-fun array_inv!27921 (array!75492) Bool)

(assert (=> start!99256 (and (array_inv!27921 _values!996) e!664310)))

(declare-fun e!664317 () Bool)

(declare-fun b!1168884 () Bool)

(assert (=> b!1168884 (= e!664317 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1168885 () Bool)

(declare-fun res!775548 () Bool)

(assert (=> b!1168885 (=> (not res!775548) (not e!664308))))

(assert (=> b!1168885 (= res!775548 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36933 _keys!1208))))))

(declare-fun b!1168886 () Bool)

(assert (=> b!1168886 (= e!664311 tp_is_empty!29371)))

(declare-fun b!1168887 () Bool)

(assert (=> b!1168887 (= e!664316 e!664318)))

(declare-fun res!775554 () Bool)

(assert (=> b!1168887 (=> res!775554 e!664318)))

(assert (=> b!1168887 (= res!775554 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!526170 () ListLongMap!16875)

(assert (=> b!1168887 (= lt!526170 (getCurrentListMapNoExtraKeys!4929 lt!526167 lt!526161 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526168 () V!44289)

(assert (=> b!1168887 (= lt!526161 (array!75493 (store (arr!36396 _values!996) i!673 (ValueCellFull!13976 lt!526168)) (size!36934 _values!996)))))

(declare-fun dynLambda!2856 (Int (_ BitVec 64)) V!44289)

(assert (=> b!1168887 (= lt!526168 (dynLambda!2856 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526162 () ListLongMap!16875)

(assert (=> b!1168887 (= lt!526162 (getCurrentListMapNoExtraKeys!4929 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168888 () Bool)

(declare-fun res!775549 () Bool)

(assert (=> b!1168888 (=> (not res!775549) (not e!664308))))

(assert (=> b!1168888 (= res!775549 (= (select (arr!36395 _keys!1208) i!673) k0!934))))

(declare-fun b!1168889 () Bool)

(declare-fun res!775561 () Bool)

(assert (=> b!1168889 (=> (not res!775561) (not e!664313))))

(assert (=> b!1168889 (= res!775561 (arrayNoDuplicates!0 lt!526167 #b00000000000000000000000000000000 Nil!25620))))

(declare-fun b!1168890 () Bool)

(declare-fun res!775555 () Bool)

(assert (=> b!1168890 (=> (not res!775555) (not e!664308))))

(assert (=> b!1168890 (= res!775555 (and (= (size!36934 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36933 _keys!1208) (size!36934 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168891 () Bool)

(assert (=> b!1168891 (= e!664315 true)))

(declare-fun e!664312 () Bool)

(assert (=> b!1168891 e!664312))

(declare-fun res!775557 () Bool)

(assert (=> b!1168891 (=> (not res!775557) (not e!664312))))

(declare-fun +!3779 (ListLongMap!16875 tuple2!18906) ListLongMap!16875)

(declare-fun get!18559 (ValueCell!13976 V!44289) V!44289)

(assert (=> b!1168891 (= res!775557 (= lt!526170 (+!3779 lt!526166 (tuple2!18907 (select (arr!36395 _keys!1208) from!1455) (get!18559 (select (arr!36396 _values!996) from!1455) lt!526168)))))))

(declare-fun b!1168892 () Bool)

(assert (=> b!1168892 (= e!664312 e!664317)))

(declare-fun res!775556 () Bool)

(assert (=> b!1168892 (=> res!775556 e!664317)))

(assert (=> b!1168892 (= res!775556 (not (= (select (arr!36395 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1168893 () Bool)

(declare-fun e!664309 () Bool)

(assert (=> b!1168893 (= e!664310 (and e!664309 mapRes!45884))))

(declare-fun condMapEmpty!45884 () Bool)

(declare-fun mapDefault!45884 () ValueCell!13976)

(assert (=> b!1168893 (= condMapEmpty!45884 (= (arr!36396 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13976)) mapDefault!45884)))))

(declare-fun b!1168894 () Bool)

(assert (=> b!1168894 (= e!664309 tp_is_empty!29371)))

(declare-fun b!1168895 () Bool)

(declare-fun res!775552 () Bool)

(assert (=> b!1168895 (=> (not res!775552) (not e!664308))))

(assert (=> b!1168895 (= res!775552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99256 res!775551) b!1168883))

(assert (= (and b!1168883 res!775550) b!1168890))

(assert (= (and b!1168890 res!775555) b!1168895))

(assert (= (and b!1168895 res!775552) b!1168882))

(assert (= (and b!1168882 res!775553) b!1168885))

(assert (= (and b!1168885 res!775548) b!1168878))

(assert (= (and b!1168878 res!775560) b!1168888))

(assert (= (and b!1168888 res!775549) b!1168879))

(assert (= (and b!1168879 res!775558) b!1168889))

(assert (= (and b!1168889 res!775561) b!1168881))

(assert (= (and b!1168881 (not res!775547)) b!1168887))

(assert (= (and b!1168887 (not res!775554)) b!1168880))

(assert (= (and b!1168880 (not res!775559)) b!1168891))

(assert (= (and b!1168891 res!775557) b!1168892))

(assert (= (and b!1168892 (not res!775556)) b!1168884))

(assert (= (and b!1168893 condMapEmpty!45884) mapIsEmpty!45884))

(assert (= (and b!1168893 (not condMapEmpty!45884)) mapNonEmpty!45884))

(get-info :version)

(assert (= (and mapNonEmpty!45884 ((_ is ValueCellFull!13976) mapValue!45884)) b!1168886))

(assert (= (and b!1168893 ((_ is ValueCellFull!13976) mapDefault!45884)) b!1168894))

(assert (= start!99256 b!1168893))

(declare-fun b_lambda!19967 () Bool)

(assert (=> (not b_lambda!19967) (not b!1168887)))

(declare-fun t!37445 () Bool)

(declare-fun tb!9645 () Bool)

(assert (=> (and start!99256 (= defaultEntry!1004 defaultEntry!1004) t!37445) tb!9645))

(declare-fun result!19865 () Bool)

(assert (=> tb!9645 (= result!19865 tp_is_empty!29371)))

(assert (=> b!1168887 t!37445))

(declare-fun b_and!40529 () Bool)

(assert (= b_and!40527 (and (=> t!37445 result!19865) b_and!40529)))

(declare-fun m!1076267 () Bool)

(assert (=> b!1168878 m!1076267))

(declare-fun m!1076269 () Bool)

(assert (=> b!1168892 m!1076269))

(declare-fun m!1076271 () Bool)

(assert (=> b!1168881 m!1076271))

(declare-fun m!1076273 () Bool)

(assert (=> b!1168881 m!1076273))

(declare-fun m!1076275 () Bool)

(assert (=> b!1168883 m!1076275))

(declare-fun m!1076277 () Bool)

(assert (=> start!99256 m!1076277))

(declare-fun m!1076279 () Bool)

(assert (=> start!99256 m!1076279))

(assert (=> b!1168891 m!1076269))

(declare-fun m!1076281 () Bool)

(assert (=> b!1168891 m!1076281))

(assert (=> b!1168891 m!1076281))

(declare-fun m!1076283 () Bool)

(assert (=> b!1168891 m!1076283))

(declare-fun m!1076285 () Bool)

(assert (=> b!1168891 m!1076285))

(declare-fun m!1076287 () Bool)

(assert (=> mapNonEmpty!45884 m!1076287))

(declare-fun m!1076289 () Bool)

(assert (=> b!1168879 m!1076289))

(declare-fun m!1076291 () Bool)

(assert (=> b!1168879 m!1076291))

(declare-fun m!1076293 () Bool)

(assert (=> b!1168888 m!1076293))

(declare-fun m!1076295 () Bool)

(assert (=> b!1168882 m!1076295))

(declare-fun m!1076297 () Bool)

(assert (=> b!1168889 m!1076297))

(declare-fun m!1076299 () Bool)

(assert (=> b!1168887 m!1076299))

(declare-fun m!1076301 () Bool)

(assert (=> b!1168887 m!1076301))

(declare-fun m!1076303 () Bool)

(assert (=> b!1168887 m!1076303))

(declare-fun m!1076305 () Bool)

(assert (=> b!1168887 m!1076305))

(declare-fun m!1076307 () Bool)

(assert (=> b!1168884 m!1076307))

(declare-fun m!1076309 () Bool)

(assert (=> b!1168880 m!1076309))

(declare-fun m!1076311 () Bool)

(assert (=> b!1168880 m!1076311))

(declare-fun m!1076313 () Bool)

(assert (=> b!1168880 m!1076313))

(assert (=> b!1168880 m!1076269))

(declare-fun m!1076315 () Bool)

(assert (=> b!1168880 m!1076315))

(assert (=> b!1168880 m!1076269))

(declare-fun m!1076317 () Bool)

(assert (=> b!1168880 m!1076317))

(declare-fun m!1076319 () Bool)

(assert (=> b!1168895 m!1076319))

(check-sat (not b!1168884) (not b!1168879) (not b!1168895) (not start!99256) (not b_lambda!19967) (not b!1168887) (not b!1168883) (not b!1168880) (not b!1168878) b_and!40529 (not b_next!24841) (not b!1168891) (not b!1168889) (not b!1168881) (not b!1168882) (not mapNonEmpty!45884) tp_is_empty!29371)
(check-sat b_and!40529 (not b_next!24841))
