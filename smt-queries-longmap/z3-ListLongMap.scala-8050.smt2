; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99376 () Bool)

(assert start!99376)

(declare-fun b_free!24745 () Bool)

(declare-fun b_next!24745 () Bool)

(assert (=> start!99376 (= b_free!24745 (not b_next!24745))))

(declare-fun tp!86945 () Bool)

(declare-fun b_and!40341 () Bool)

(assert (=> start!99376 (= tp!86945 b_and!40341)))

(declare-fun b!1167850 () Bool)

(declare-fun e!663933 () Bool)

(declare-fun e!663931 () Bool)

(assert (=> b!1167850 (= e!663933 (not e!663931))))

(declare-fun res!774292 () Bool)

(assert (=> b!1167850 (=> res!774292 e!663931)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167850 (= res!774292 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75429 0))(
  ( (array!75430 (arr!36359 (Array (_ BitVec 32) (_ BitVec 64))) (size!36896 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75429)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167850 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38481 0))(
  ( (Unit!38482) )
))
(declare-fun lt!525785 () Unit!38481)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75429 (_ BitVec 64) (_ BitVec 32)) Unit!38481)

(assert (=> b!1167850 (= lt!525785 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167851 () Bool)

(declare-fun res!774294 () Bool)

(declare-fun e!663936 () Bool)

(assert (=> b!1167851 (=> (not res!774294) (not e!663936))))

(assert (=> b!1167851 (= res!774294 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36896 _keys!1208))))))

(declare-fun b!1167852 () Bool)

(declare-fun e!663930 () Bool)

(declare-fun tp_is_empty!29275 () Bool)

(assert (=> b!1167852 (= e!663930 tp_is_empty!29275)))

(declare-fun b!1167853 () Bool)

(declare-fun e!663935 () Bool)

(declare-fun mapRes!45737 () Bool)

(assert (=> b!1167853 (= e!663935 (and e!663930 mapRes!45737))))

(declare-fun condMapEmpty!45737 () Bool)

(declare-datatypes ((V!44161 0))(
  ( (V!44162 (val!14694 Int)) )
))
(declare-datatypes ((ValueCell!13928 0))(
  ( (ValueCellFull!13928 (v!17327 V!44161)) (EmptyCell!13928) )
))
(declare-datatypes ((array!75431 0))(
  ( (array!75432 (arr!36360 (Array (_ BitVec 32) ValueCell!13928)) (size!36897 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75431)

(declare-fun mapDefault!45737 () ValueCell!13928)

(assert (=> b!1167853 (= condMapEmpty!45737 (= (arr!36360 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13928)) mapDefault!45737)))))

(declare-fun b!1167854 () Bool)

(declare-fun res!774303 () Bool)

(assert (=> b!1167854 (=> (not res!774303) (not e!663936))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1167854 (= res!774303 (and (= (size!36897 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36896 _keys!1208) (size!36897 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167855 () Bool)

(declare-fun e!663934 () Bool)

(assert (=> b!1167855 (= e!663934 tp_is_empty!29275)))

(declare-fun b!1167856 () Bool)

(declare-fun res!774302 () Bool)

(assert (=> b!1167856 (=> (not res!774302) (not e!663936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167856 (= res!774302 (validMask!0 mask!1564))))

(declare-fun res!774297 () Bool)

(assert (=> start!99376 (=> (not res!774297) (not e!663936))))

(assert (=> start!99376 (= res!774297 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36896 _keys!1208))))))

(assert (=> start!99376 e!663936))

(assert (=> start!99376 tp_is_empty!29275))

(declare-fun array_inv!27874 (array!75429) Bool)

(assert (=> start!99376 (array_inv!27874 _keys!1208)))

(assert (=> start!99376 true))

(assert (=> start!99376 tp!86945))

(declare-fun array_inv!27875 (array!75431) Bool)

(assert (=> start!99376 (and (array_inv!27875 _values!996) e!663935)))

(declare-fun b!1167857 () Bool)

(declare-fun res!774301 () Bool)

(assert (=> b!1167857 (=> (not res!774301) (not e!663936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75429 (_ BitVec 32)) Bool)

(assert (=> b!1167857 (= res!774301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!45737 () Bool)

(declare-fun tp!86946 () Bool)

(assert (=> mapNonEmpty!45737 (= mapRes!45737 (and tp!86946 e!663934))))

(declare-fun mapValue!45737 () ValueCell!13928)

(declare-fun mapKey!45737 () (_ BitVec 32))

(declare-fun mapRest!45737 () (Array (_ BitVec 32) ValueCell!13928))

(assert (=> mapNonEmpty!45737 (= (arr!36360 _values!996) (store mapRest!45737 mapKey!45737 mapValue!45737))))

(declare-fun b!1167858 () Bool)

(declare-fun e!663937 () Bool)

(assert (=> b!1167858 (= e!663937 true)))

(declare-fun zeroValue!944 () V!44161)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525787 () array!75431)

(declare-fun minValue!944 () V!44161)

(declare-fun lt!525782 () array!75429)

(declare-datatypes ((tuple2!18776 0))(
  ( (tuple2!18777 (_1!9399 (_ BitVec 64)) (_2!9399 V!44161)) )
))
(declare-datatypes ((List!25516 0))(
  ( (Nil!25513) (Cons!25512 (h!26730 tuple2!18776) (t!37245 List!25516)) )
))
(declare-datatypes ((ListLongMap!16753 0))(
  ( (ListLongMap!16754 (toList!8392 List!25516)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4883 (array!75429 array!75431 (_ BitVec 32) (_ BitVec 32) V!44161 V!44161 (_ BitVec 32) Int) ListLongMap!16753)

(declare-fun -!1455 (ListLongMap!16753 (_ BitVec 64)) ListLongMap!16753)

(assert (=> b!1167858 (= (getCurrentListMapNoExtraKeys!4883 lt!525782 lt!525787 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1455 (getCurrentListMapNoExtraKeys!4883 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525784 () Unit!38481)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!680 (array!75429 array!75431 (_ BitVec 32) (_ BitVec 32) V!44161 V!44161 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38481)

(assert (=> b!1167858 (= lt!525784 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!680 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167859 () Bool)

(assert (=> b!1167859 (= e!663931 e!663937)))

(declare-fun res!774293 () Bool)

(assert (=> b!1167859 (=> res!774293 e!663937)))

(assert (=> b!1167859 (= res!774293 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525783 () ListLongMap!16753)

(assert (=> b!1167859 (= lt!525783 (getCurrentListMapNoExtraKeys!4883 lt!525782 lt!525787 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2872 (Int (_ BitVec 64)) V!44161)

(assert (=> b!1167859 (= lt!525787 (array!75432 (store (arr!36360 _values!996) i!673 (ValueCellFull!13928 (dynLambda!2872 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36897 _values!996)))))

(declare-fun lt!525786 () ListLongMap!16753)

(assert (=> b!1167859 (= lt!525786 (getCurrentListMapNoExtraKeys!4883 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167860 () Bool)

(declare-fun res!774296 () Bool)

(assert (=> b!1167860 (=> (not res!774296) (not e!663936))))

(assert (=> b!1167860 (= res!774296 (= (select (arr!36359 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!45737 () Bool)

(assert (=> mapIsEmpty!45737 mapRes!45737))

(declare-fun b!1167861 () Bool)

(declare-fun res!774298 () Bool)

(assert (=> b!1167861 (=> (not res!774298) (not e!663936))))

(declare-datatypes ((List!25517 0))(
  ( (Nil!25514) (Cons!25513 (h!26731 (_ BitVec 64)) (t!37246 List!25517)) )
))
(declare-fun arrayNoDuplicates!0 (array!75429 (_ BitVec 32) List!25517) Bool)

(assert (=> b!1167861 (= res!774298 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25514))))

(declare-fun b!1167862 () Bool)

(declare-fun res!774300 () Bool)

(assert (=> b!1167862 (=> (not res!774300) (not e!663936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167862 (= res!774300 (validKeyInArray!0 k0!934))))

(declare-fun b!1167863 () Bool)

(assert (=> b!1167863 (= e!663936 e!663933)))

(declare-fun res!774295 () Bool)

(assert (=> b!1167863 (=> (not res!774295) (not e!663933))))

(assert (=> b!1167863 (= res!774295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525782 mask!1564))))

(assert (=> b!1167863 (= lt!525782 (array!75430 (store (arr!36359 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36896 _keys!1208)))))

(declare-fun b!1167864 () Bool)

(declare-fun res!774299 () Bool)

(assert (=> b!1167864 (=> (not res!774299) (not e!663933))))

(assert (=> b!1167864 (= res!774299 (arrayNoDuplicates!0 lt!525782 #b00000000000000000000000000000000 Nil!25514))))

(assert (= (and start!99376 res!774297) b!1167856))

(assert (= (and b!1167856 res!774302) b!1167854))

(assert (= (and b!1167854 res!774303) b!1167857))

(assert (= (and b!1167857 res!774301) b!1167861))

(assert (= (and b!1167861 res!774298) b!1167851))

(assert (= (and b!1167851 res!774294) b!1167862))

(assert (= (and b!1167862 res!774300) b!1167860))

(assert (= (and b!1167860 res!774296) b!1167863))

(assert (= (and b!1167863 res!774295) b!1167864))

(assert (= (and b!1167864 res!774299) b!1167850))

(assert (= (and b!1167850 (not res!774292)) b!1167859))

(assert (= (and b!1167859 (not res!774293)) b!1167858))

(assert (= (and b!1167853 condMapEmpty!45737) mapIsEmpty!45737))

(assert (= (and b!1167853 (not condMapEmpty!45737)) mapNonEmpty!45737))

(get-info :version)

(assert (= (and mapNonEmpty!45737 ((_ is ValueCellFull!13928) mapValue!45737)) b!1167855))

(assert (= (and b!1167853 ((_ is ValueCellFull!13928) mapDefault!45737)) b!1167852))

(assert (= start!99376 b!1167853))

(declare-fun b_lambda!19845 () Bool)

(assert (=> (not b_lambda!19845) (not b!1167859)))

(declare-fun t!37244 () Bool)

(declare-fun tb!9549 () Bool)

(assert (=> (and start!99376 (= defaultEntry!1004 defaultEntry!1004) t!37244) tb!9549))

(declare-fun result!19671 () Bool)

(assert (=> tb!9549 (= result!19671 tp_is_empty!29275)))

(assert (=> b!1167859 t!37244))

(declare-fun b_and!40343 () Bool)

(assert (= b_and!40341 (and (=> t!37244 result!19671) b_and!40343)))

(declare-fun m!1076159 () Bool)

(assert (=> mapNonEmpty!45737 m!1076159))

(declare-fun m!1076161 () Bool)

(assert (=> b!1167863 m!1076161))

(declare-fun m!1076163 () Bool)

(assert (=> b!1167863 m!1076163))

(declare-fun m!1076165 () Bool)

(assert (=> b!1167861 m!1076165))

(declare-fun m!1076167 () Bool)

(assert (=> b!1167857 m!1076167))

(declare-fun m!1076169 () Bool)

(assert (=> b!1167859 m!1076169))

(declare-fun m!1076171 () Bool)

(assert (=> b!1167859 m!1076171))

(declare-fun m!1076173 () Bool)

(assert (=> b!1167859 m!1076173))

(declare-fun m!1076175 () Bool)

(assert (=> b!1167859 m!1076175))

(declare-fun m!1076177 () Bool)

(assert (=> b!1167860 m!1076177))

(declare-fun m!1076179 () Bool)

(assert (=> b!1167856 m!1076179))

(declare-fun m!1076181 () Bool)

(assert (=> b!1167858 m!1076181))

(declare-fun m!1076183 () Bool)

(assert (=> b!1167858 m!1076183))

(assert (=> b!1167858 m!1076183))

(declare-fun m!1076185 () Bool)

(assert (=> b!1167858 m!1076185))

(declare-fun m!1076187 () Bool)

(assert (=> b!1167858 m!1076187))

(declare-fun m!1076189 () Bool)

(assert (=> start!99376 m!1076189))

(declare-fun m!1076191 () Bool)

(assert (=> start!99376 m!1076191))

(declare-fun m!1076193 () Bool)

(assert (=> b!1167850 m!1076193))

(declare-fun m!1076195 () Bool)

(assert (=> b!1167850 m!1076195))

(declare-fun m!1076197 () Bool)

(assert (=> b!1167864 m!1076197))

(declare-fun m!1076199 () Bool)

(assert (=> b!1167862 m!1076199))

(check-sat (not b!1167862) (not b!1167864) (not b!1167863) (not b!1167858) (not b!1167856) (not start!99376) (not b_lambda!19845) (not b_next!24745) (not b!1167850) (not b!1167859) b_and!40343 tp_is_empty!29275 (not b!1167857) (not mapNonEmpty!45737) (not b!1167861))
(check-sat b_and!40343 (not b_next!24745))
