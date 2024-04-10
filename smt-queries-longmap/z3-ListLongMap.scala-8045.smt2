; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99112 () Bool)

(assert start!99112)

(declare-fun b_free!24717 () Bool)

(declare-fun b_next!24717 () Bool)

(assert (=> start!99112 (= b_free!24717 (not b_next!24717))))

(declare-fun tp!86862 () Bool)

(declare-fun b_and!40283 () Bool)

(assert (=> start!99112 (= tp!86862 b_and!40283)))

(declare-fun b!1165903 () Bool)

(declare-fun res!773280 () Bool)

(declare-fun e!662763 () Bool)

(assert (=> b!1165903 (=> (not res!773280) (not e!662763))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75325 0))(
  ( (array!75326 (arr!36313 (Array (_ BitVec 32) (_ BitVec 64))) (size!36849 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75325)

(assert (=> b!1165903 (= res!773280 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36849 _keys!1208))))))

(declare-fun b!1165905 () Bool)

(declare-fun res!773283 () Bool)

(assert (=> b!1165905 (=> (not res!773283) (not e!662763))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165905 (= res!773283 (validMask!0 mask!1564))))

(declare-fun b!1165906 () Bool)

(declare-fun e!662764 () Bool)

(declare-fun e!662765 () Bool)

(assert (=> b!1165906 (= e!662764 e!662765)))

(declare-fun res!773290 () Bool)

(assert (=> b!1165906 (=> res!773290 e!662765)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1165906 (= res!773290 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44123 0))(
  ( (V!44124 (val!14680 Int)) )
))
(declare-fun zeroValue!944 () V!44123)

(declare-datatypes ((tuple2!18720 0))(
  ( (tuple2!18721 (_1!9371 (_ BitVec 64)) (_2!9371 V!44123)) )
))
(declare-datatypes ((List!25458 0))(
  ( (Nil!25455) (Cons!25454 (h!26663 tuple2!18720) (t!37167 List!25458)) )
))
(declare-datatypes ((ListLongMap!16689 0))(
  ( (ListLongMap!16690 (toList!8360 List!25458)) )
))
(declare-fun lt!525049 () ListLongMap!16689)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13914 0))(
  ( (ValueCellFull!13914 (v!17317 V!44123)) (EmptyCell!13914) )
))
(declare-datatypes ((array!75327 0))(
  ( (array!75328 (arr!36314 (Array (_ BitVec 32) ValueCell!13914)) (size!36850 (_ BitVec 32))) )
))
(declare-fun lt!525050 () array!75327)

(declare-fun lt!525051 () array!75325)

(declare-fun minValue!944 () V!44123)

(declare-fun getCurrentListMapNoExtraKeys!4824 (array!75325 array!75327 (_ BitVec 32) (_ BitVec 32) V!44123 V!44123 (_ BitVec 32) Int) ListLongMap!16689)

(assert (=> b!1165906 (= lt!525049 (getCurrentListMapNoExtraKeys!4824 lt!525051 lt!525050 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75327)

(declare-fun dynLambda!2814 (Int (_ BitVec 64)) V!44123)

(assert (=> b!1165906 (= lt!525050 (array!75328 (store (arr!36314 _values!996) i!673 (ValueCellFull!13914 (dynLambda!2814 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36850 _values!996)))))

(declare-fun lt!525047 () ListLongMap!16689)

(assert (=> b!1165906 (= lt!525047 (getCurrentListMapNoExtraKeys!4824 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45695 () Bool)

(declare-fun mapRes!45695 () Bool)

(assert (=> mapIsEmpty!45695 mapRes!45695))

(declare-fun b!1165907 () Bool)

(declare-fun res!773289 () Bool)

(assert (=> b!1165907 (=> (not res!773289) (not e!662763))))

(assert (=> b!1165907 (= res!773289 (and (= (size!36850 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36849 _keys!1208) (size!36850 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165908 () Bool)

(declare-fun e!662769 () Bool)

(declare-fun tp_is_empty!29247 () Bool)

(assert (=> b!1165908 (= e!662769 tp_is_empty!29247)))

(declare-fun b!1165909 () Bool)

(declare-fun e!662762 () Bool)

(assert (=> b!1165909 (= e!662763 e!662762)))

(declare-fun res!773286 () Bool)

(assert (=> b!1165909 (=> (not res!773286) (not e!662762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75325 (_ BitVec 32)) Bool)

(assert (=> b!1165909 (= res!773286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525051 mask!1564))))

(assert (=> b!1165909 (= lt!525051 (array!75326 (store (arr!36313 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36849 _keys!1208)))))

(declare-fun b!1165910 () Bool)

(declare-fun res!773282 () Bool)

(assert (=> b!1165910 (=> (not res!773282) (not e!662762))))

(declare-datatypes ((List!25459 0))(
  ( (Nil!25456) (Cons!25455 (h!26664 (_ BitVec 64)) (t!37168 List!25459)) )
))
(declare-fun arrayNoDuplicates!0 (array!75325 (_ BitVec 32) List!25459) Bool)

(assert (=> b!1165910 (= res!773282 (arrayNoDuplicates!0 lt!525051 #b00000000000000000000000000000000 Nil!25456))))

(declare-fun b!1165911 () Bool)

(assert (=> b!1165911 (= e!662765 true)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1437 (ListLongMap!16689 (_ BitVec 64)) ListLongMap!16689)

(assert (=> b!1165911 (= (getCurrentListMapNoExtraKeys!4824 lt!525051 lt!525050 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1437 (getCurrentListMapNoExtraKeys!4824 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38470 0))(
  ( (Unit!38471) )
))
(declare-fun lt!525046 () Unit!38470)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!664 (array!75325 array!75327 (_ BitVec 32) (_ BitVec 32) V!44123 V!44123 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38470)

(assert (=> b!1165911 (= lt!525046 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!664 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1165912 () Bool)

(declare-fun res!773288 () Bool)

(assert (=> b!1165912 (=> (not res!773288) (not e!662763))))

(assert (=> b!1165912 (= res!773288 (= (select (arr!36313 _keys!1208) i!673) k0!934))))

(declare-fun res!773284 () Bool)

(assert (=> start!99112 (=> (not res!773284) (not e!662763))))

(assert (=> start!99112 (= res!773284 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36849 _keys!1208))))))

(assert (=> start!99112 e!662763))

(assert (=> start!99112 tp_is_empty!29247))

(declare-fun array_inv!27774 (array!75325) Bool)

(assert (=> start!99112 (array_inv!27774 _keys!1208)))

(assert (=> start!99112 true))

(assert (=> start!99112 tp!86862))

(declare-fun e!662767 () Bool)

(declare-fun array_inv!27775 (array!75327) Bool)

(assert (=> start!99112 (and (array_inv!27775 _values!996) e!662767)))

(declare-fun b!1165904 () Bool)

(declare-fun e!662766 () Bool)

(assert (=> b!1165904 (= e!662766 tp_is_empty!29247)))

(declare-fun b!1165913 () Bool)

(declare-fun res!773285 () Bool)

(assert (=> b!1165913 (=> (not res!773285) (not e!662763))))

(assert (=> b!1165913 (= res!773285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!45695 () Bool)

(declare-fun tp!86861 () Bool)

(assert (=> mapNonEmpty!45695 (= mapRes!45695 (and tp!86861 e!662766))))

(declare-fun mapValue!45695 () ValueCell!13914)

(declare-fun mapKey!45695 () (_ BitVec 32))

(declare-fun mapRest!45695 () (Array (_ BitVec 32) ValueCell!13914))

(assert (=> mapNonEmpty!45695 (= (arr!36314 _values!996) (store mapRest!45695 mapKey!45695 mapValue!45695))))

(declare-fun b!1165914 () Bool)

(declare-fun res!773291 () Bool)

(assert (=> b!1165914 (=> (not res!773291) (not e!662763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165914 (= res!773291 (validKeyInArray!0 k0!934))))

(declare-fun b!1165915 () Bool)

(declare-fun res!773281 () Bool)

(assert (=> b!1165915 (=> (not res!773281) (not e!662763))))

(assert (=> b!1165915 (= res!773281 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25456))))

(declare-fun b!1165916 () Bool)

(assert (=> b!1165916 (= e!662762 (not e!662764))))

(declare-fun res!773287 () Bool)

(assert (=> b!1165916 (=> res!773287 e!662764)))

(assert (=> b!1165916 (= res!773287 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165916 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525048 () Unit!38470)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75325 (_ BitVec 64) (_ BitVec 32)) Unit!38470)

(assert (=> b!1165916 (= lt!525048 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165917 () Bool)

(assert (=> b!1165917 (= e!662767 (and e!662769 mapRes!45695))))

(declare-fun condMapEmpty!45695 () Bool)

(declare-fun mapDefault!45695 () ValueCell!13914)

(assert (=> b!1165917 (= condMapEmpty!45695 (= (arr!36314 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13914)) mapDefault!45695)))))

(assert (= (and start!99112 res!773284) b!1165905))

(assert (= (and b!1165905 res!773283) b!1165907))

(assert (= (and b!1165907 res!773289) b!1165913))

(assert (= (and b!1165913 res!773285) b!1165915))

(assert (= (and b!1165915 res!773281) b!1165903))

(assert (= (and b!1165903 res!773280) b!1165914))

(assert (= (and b!1165914 res!773291) b!1165912))

(assert (= (and b!1165912 res!773288) b!1165909))

(assert (= (and b!1165909 res!773286) b!1165910))

(assert (= (and b!1165910 res!773282) b!1165916))

(assert (= (and b!1165916 (not res!773287)) b!1165906))

(assert (= (and b!1165906 (not res!773290)) b!1165911))

(assert (= (and b!1165917 condMapEmpty!45695) mapIsEmpty!45695))

(assert (= (and b!1165917 (not condMapEmpty!45695)) mapNonEmpty!45695))

(get-info :version)

(assert (= (and mapNonEmpty!45695 ((_ is ValueCellFull!13914) mapValue!45695)) b!1165904))

(assert (= (and b!1165917 ((_ is ValueCellFull!13914) mapDefault!45695)) b!1165908))

(assert (= start!99112 b!1165917))

(declare-fun b_lambda!19823 () Bool)

(assert (=> (not b_lambda!19823) (not b!1165906)))

(declare-fun t!37166 () Bool)

(declare-fun tb!9529 () Bool)

(assert (=> (and start!99112 (= defaultEntry!1004 defaultEntry!1004) t!37166) tb!9529))

(declare-fun result!19623 () Bool)

(assert (=> tb!9529 (= result!19623 tp_is_empty!29247)))

(assert (=> b!1165906 t!37166))

(declare-fun b_and!40285 () Bool)

(assert (= b_and!40283 (and (=> t!37166 result!19623) b_and!40285)))

(declare-fun m!1073999 () Bool)

(assert (=> b!1165916 m!1073999))

(declare-fun m!1074001 () Bool)

(assert (=> b!1165916 m!1074001))

(declare-fun m!1074003 () Bool)

(assert (=> b!1165915 m!1074003))

(declare-fun m!1074005 () Bool)

(assert (=> start!99112 m!1074005))

(declare-fun m!1074007 () Bool)

(assert (=> start!99112 m!1074007))

(declare-fun m!1074009 () Bool)

(assert (=> b!1165914 m!1074009))

(declare-fun m!1074011 () Bool)

(assert (=> b!1165912 m!1074011))

(declare-fun m!1074013 () Bool)

(assert (=> b!1165909 m!1074013))

(declare-fun m!1074015 () Bool)

(assert (=> b!1165909 m!1074015))

(declare-fun m!1074017 () Bool)

(assert (=> b!1165913 m!1074017))

(declare-fun m!1074019 () Bool)

(assert (=> b!1165910 m!1074019))

(declare-fun m!1074021 () Bool)

(assert (=> b!1165906 m!1074021))

(declare-fun m!1074023 () Bool)

(assert (=> b!1165906 m!1074023))

(declare-fun m!1074025 () Bool)

(assert (=> b!1165906 m!1074025))

(declare-fun m!1074027 () Bool)

(assert (=> b!1165906 m!1074027))

(declare-fun m!1074029 () Bool)

(assert (=> mapNonEmpty!45695 m!1074029))

(declare-fun m!1074031 () Bool)

(assert (=> b!1165911 m!1074031))

(declare-fun m!1074033 () Bool)

(assert (=> b!1165911 m!1074033))

(assert (=> b!1165911 m!1074033))

(declare-fun m!1074035 () Bool)

(assert (=> b!1165911 m!1074035))

(declare-fun m!1074037 () Bool)

(assert (=> b!1165911 m!1074037))

(declare-fun m!1074039 () Bool)

(assert (=> b!1165905 m!1074039))

(check-sat (not b!1165909) (not b!1165911) b_and!40285 (not b!1165906) (not mapNonEmpty!45695) (not b_lambda!19823) (not b!1165915) (not b!1165910) (not b!1165913) (not b!1165905) (not b!1165914) tp_is_empty!29247 (not b_next!24717) (not b!1165916) (not start!99112))
(check-sat b_and!40285 (not b_next!24717))
