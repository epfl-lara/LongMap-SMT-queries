; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99134 () Bool)

(assert start!99134)

(declare-fun b_free!24745 () Bool)

(declare-fun b_next!24745 () Bool)

(assert (=> start!99134 (= b_free!24745 (not b_next!24745))))

(declare-fun tp!86946 () Bool)

(declare-fun b_and!40317 () Bool)

(assert (=> start!99134 (= tp!86946 b_and!40317)))

(declare-fun b!1166438 () Bool)

(declare-fun e!663024 () Bool)

(assert (=> b!1166438 (= e!663024 true)))

(declare-datatypes ((V!44161 0))(
  ( (V!44162 (val!14694 Int)) )
))
(declare-fun zeroValue!944 () V!44161)

(declare-datatypes ((array!75302 0))(
  ( (array!75303 (arr!36302 (Array (_ BitVec 32) (_ BitVec 64))) (size!36840 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75302)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13928 0))(
  ( (ValueCellFull!13928 (v!17330 V!44161)) (EmptyCell!13928) )
))
(declare-datatypes ((array!75304 0))(
  ( (array!75305 (arr!36303 (Array (_ BitVec 32) ValueCell!13928)) (size!36841 (_ BitVec 32))) )
))
(declare-fun lt!525107 () array!75304)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _values!996 () array!75304)

(declare-fun minValue!944 () V!44161)

(declare-fun lt!525111 () array!75302)

(declare-datatypes ((tuple2!18830 0))(
  ( (tuple2!18831 (_1!9426 (_ BitVec 64)) (_2!9426 V!44161)) )
))
(declare-datatypes ((List!25547 0))(
  ( (Nil!25544) (Cons!25543 (h!26752 tuple2!18830) (t!37275 List!25547)) )
))
(declare-datatypes ((ListLongMap!16799 0))(
  ( (ListLongMap!16800 (toList!8415 List!25547)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4891 (array!75302 array!75304 (_ BitVec 32) (_ BitVec 32) V!44161 V!44161 (_ BitVec 32) Int) ListLongMap!16799)

(declare-fun -!1428 (ListLongMap!16799 (_ BitVec 64)) ListLongMap!16799)

(assert (=> b!1166438 (= (getCurrentListMapNoExtraKeys!4891 lt!525111 lt!525107 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1428 (getCurrentListMapNoExtraKeys!4891 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38321 0))(
  ( (Unit!38322) )
))
(declare-fun lt!525108 () Unit!38321)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!692 (array!75302 array!75304 (_ BitVec 32) (_ BitVec 32) V!44161 V!44161 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38321)

(assert (=> b!1166438 (= lt!525108 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!692 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166439 () Bool)

(declare-fun e!663027 () Bool)

(declare-fun tp_is_empty!29275 () Bool)

(assert (=> b!1166439 (= e!663027 tp_is_empty!29275)))

(declare-fun b!1166440 () Bool)

(declare-fun e!663023 () Bool)

(declare-fun e!663021 () Bool)

(assert (=> b!1166440 (= e!663023 e!663021)))

(declare-fun res!773725 () Bool)

(assert (=> b!1166440 (=> (not res!773725) (not e!663021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75302 (_ BitVec 32)) Bool)

(assert (=> b!1166440 (= res!773725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525111 mask!1564))))

(assert (=> b!1166440 (= lt!525111 (array!75303 (store (arr!36302 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36840 _keys!1208)))))

(declare-fun b!1166441 () Bool)

(declare-fun res!773726 () Bool)

(assert (=> b!1166441 (=> (not res!773726) (not e!663023))))

(assert (=> b!1166441 (= res!773726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166442 () Bool)

(declare-fun res!773718 () Bool)

(assert (=> b!1166442 (=> (not res!773718) (not e!663021))))

(declare-datatypes ((List!25548 0))(
  ( (Nil!25545) (Cons!25544 (h!26753 (_ BitVec 64)) (t!37276 List!25548)) )
))
(declare-fun arrayNoDuplicates!0 (array!75302 (_ BitVec 32) List!25548) Bool)

(assert (=> b!1166442 (= res!773718 (arrayNoDuplicates!0 lt!525111 #b00000000000000000000000000000000 Nil!25545))))

(declare-fun b!1166443 () Bool)

(declare-fun e!663020 () Bool)

(declare-fun e!663022 () Bool)

(declare-fun mapRes!45737 () Bool)

(assert (=> b!1166443 (= e!663020 (and e!663022 mapRes!45737))))

(declare-fun condMapEmpty!45737 () Bool)

(declare-fun mapDefault!45737 () ValueCell!13928)

(assert (=> b!1166443 (= condMapEmpty!45737 (= (arr!36303 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13928)) mapDefault!45737)))))

(declare-fun b!1166444 () Bool)

(declare-fun res!773724 () Bool)

(assert (=> b!1166444 (=> (not res!773724) (not e!663023))))

(assert (=> b!1166444 (= res!773724 (and (= (size!36841 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36840 _keys!1208) (size!36841 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!45737 () Bool)

(assert (=> mapIsEmpty!45737 mapRes!45737))

(declare-fun b!1166445 () Bool)

(declare-fun e!663026 () Bool)

(assert (=> b!1166445 (= e!663021 (not e!663026))))

(declare-fun res!773728 () Bool)

(assert (=> b!1166445 (=> res!773728 e!663026)))

(assert (=> b!1166445 (= res!773728 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166445 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525109 () Unit!38321)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75302 (_ BitVec 64) (_ BitVec 32)) Unit!38321)

(assert (=> b!1166445 (= lt!525109 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166446 () Bool)

(declare-fun res!773727 () Bool)

(assert (=> b!1166446 (=> (not res!773727) (not e!663023))))

(assert (=> b!1166446 (= res!773727 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36840 _keys!1208))))))

(declare-fun res!773729 () Bool)

(assert (=> start!99134 (=> (not res!773729) (not e!663023))))

(assert (=> start!99134 (= res!773729 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36840 _keys!1208))))))

(assert (=> start!99134 e!663023))

(assert (=> start!99134 tp_is_empty!29275))

(declare-fun array_inv!27858 (array!75302) Bool)

(assert (=> start!99134 (array_inv!27858 _keys!1208)))

(assert (=> start!99134 true))

(assert (=> start!99134 tp!86946))

(declare-fun array_inv!27859 (array!75304) Bool)

(assert (=> start!99134 (and (array_inv!27859 _values!996) e!663020)))

(declare-fun b!1166437 () Bool)

(assert (=> b!1166437 (= e!663026 e!663024)))

(declare-fun res!773721 () Bool)

(assert (=> b!1166437 (=> res!773721 e!663024)))

(assert (=> b!1166437 (= res!773721 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525110 () ListLongMap!16799)

(assert (=> b!1166437 (= lt!525110 (getCurrentListMapNoExtraKeys!4891 lt!525111 lt!525107 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2824 (Int (_ BitVec 64)) V!44161)

(assert (=> b!1166437 (= lt!525107 (array!75305 (store (arr!36303 _values!996) i!673 (ValueCellFull!13928 (dynLambda!2824 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36841 _values!996)))))

(declare-fun lt!525106 () ListLongMap!16799)

(assert (=> b!1166437 (= lt!525106 (getCurrentListMapNoExtraKeys!4891 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166447 () Bool)

(declare-fun res!773722 () Bool)

(assert (=> b!1166447 (=> (not res!773722) (not e!663023))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166447 (= res!773722 (validKeyInArray!0 k0!934))))

(declare-fun b!1166448 () Bool)

(declare-fun res!773719 () Bool)

(assert (=> b!1166448 (=> (not res!773719) (not e!663023))))

(assert (=> b!1166448 (= res!773719 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25545))))

(declare-fun b!1166449 () Bool)

(assert (=> b!1166449 (= e!663022 tp_is_empty!29275)))

(declare-fun b!1166450 () Bool)

(declare-fun res!773723 () Bool)

(assert (=> b!1166450 (=> (not res!773723) (not e!663023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166450 (= res!773723 (validMask!0 mask!1564))))

(declare-fun b!1166451 () Bool)

(declare-fun res!773720 () Bool)

(assert (=> b!1166451 (=> (not res!773720) (not e!663023))))

(assert (=> b!1166451 (= res!773720 (= (select (arr!36302 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45737 () Bool)

(declare-fun tp!86945 () Bool)

(assert (=> mapNonEmpty!45737 (= mapRes!45737 (and tp!86945 e!663027))))

(declare-fun mapRest!45737 () (Array (_ BitVec 32) ValueCell!13928))

(declare-fun mapValue!45737 () ValueCell!13928)

(declare-fun mapKey!45737 () (_ BitVec 32))

(assert (=> mapNonEmpty!45737 (= (arr!36303 _values!996) (store mapRest!45737 mapKey!45737 mapValue!45737))))

(assert (= (and start!99134 res!773729) b!1166450))

(assert (= (and b!1166450 res!773723) b!1166444))

(assert (= (and b!1166444 res!773724) b!1166441))

(assert (= (and b!1166441 res!773726) b!1166448))

(assert (= (and b!1166448 res!773719) b!1166446))

(assert (= (and b!1166446 res!773727) b!1166447))

(assert (= (and b!1166447 res!773722) b!1166451))

(assert (= (and b!1166451 res!773720) b!1166440))

(assert (= (and b!1166440 res!773725) b!1166442))

(assert (= (and b!1166442 res!773718) b!1166445))

(assert (= (and b!1166445 (not res!773728)) b!1166437))

(assert (= (and b!1166437 (not res!773721)) b!1166438))

(assert (= (and b!1166443 condMapEmpty!45737) mapIsEmpty!45737))

(assert (= (and b!1166443 (not condMapEmpty!45737)) mapNonEmpty!45737))

(get-info :version)

(assert (= (and mapNonEmpty!45737 ((_ is ValueCellFull!13928) mapValue!45737)) b!1166439))

(assert (= (and b!1166443 ((_ is ValueCellFull!13928) mapDefault!45737)) b!1166449))

(assert (= start!99134 b!1166443))

(declare-fun b_lambda!19833 () Bool)

(assert (=> (not b_lambda!19833) (not b!1166437)))

(declare-fun t!37274 () Bool)

(declare-fun tb!9549 () Bool)

(assert (=> (and start!99134 (= defaultEntry!1004 defaultEntry!1004) t!37274) tb!9549))

(declare-fun result!19671 () Bool)

(assert (=> tb!9549 (= result!19671 tp_is_empty!29275)))

(assert (=> b!1166437 t!37274))

(declare-fun b_and!40319 () Bool)

(assert (= b_and!40317 (and (=> t!37274 result!19671) b_and!40319)))

(declare-fun m!1073977 () Bool)

(assert (=> b!1166440 m!1073977))

(declare-fun m!1073979 () Bool)

(assert (=> b!1166440 m!1073979))

(declare-fun m!1073981 () Bool)

(assert (=> b!1166450 m!1073981))

(declare-fun m!1073983 () Bool)

(assert (=> b!1166441 m!1073983))

(declare-fun m!1073985 () Bool)

(assert (=> b!1166437 m!1073985))

(declare-fun m!1073987 () Bool)

(assert (=> b!1166437 m!1073987))

(declare-fun m!1073989 () Bool)

(assert (=> b!1166437 m!1073989))

(declare-fun m!1073991 () Bool)

(assert (=> b!1166437 m!1073991))

(declare-fun m!1073993 () Bool)

(assert (=> b!1166442 m!1073993))

(declare-fun m!1073995 () Bool)

(assert (=> mapNonEmpty!45737 m!1073995))

(declare-fun m!1073997 () Bool)

(assert (=> b!1166448 m!1073997))

(declare-fun m!1073999 () Bool)

(assert (=> b!1166438 m!1073999))

(declare-fun m!1074001 () Bool)

(assert (=> b!1166438 m!1074001))

(assert (=> b!1166438 m!1074001))

(declare-fun m!1074003 () Bool)

(assert (=> b!1166438 m!1074003))

(declare-fun m!1074005 () Bool)

(assert (=> b!1166438 m!1074005))

(declare-fun m!1074007 () Bool)

(assert (=> b!1166447 m!1074007))

(declare-fun m!1074009 () Bool)

(assert (=> b!1166445 m!1074009))

(declare-fun m!1074011 () Bool)

(assert (=> b!1166445 m!1074011))

(declare-fun m!1074013 () Bool)

(assert (=> start!99134 m!1074013))

(declare-fun m!1074015 () Bool)

(assert (=> start!99134 m!1074015))

(declare-fun m!1074017 () Bool)

(assert (=> b!1166451 m!1074017))

(check-sat (not b!1166450) (not b!1166437) tp_is_empty!29275 (not b!1166447) (not b!1166438) (not b_next!24745) (not b!1166442) (not b!1166448) (not mapNonEmpty!45737) (not b_lambda!19833) (not b!1166445) (not b!1166441) (not start!99134) (not b!1166440) b_and!40319)
(check-sat b_and!40319 (not b_next!24745))
