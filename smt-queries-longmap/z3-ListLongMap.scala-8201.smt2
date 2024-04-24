; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100308 () Bool)

(assert start!100308)

(declare-fun b_free!25651 () Bool)

(declare-fun b_next!25651 () Bool)

(assert (=> start!100308 (= b_free!25651 (not b_next!25651))))

(declare-fun tp!89666 () Bool)

(declare-fun b_and!42171 () Bool)

(assert (=> start!100308 (= tp!89666 b_and!42171)))

(declare-fun b!1194261 () Bool)

(declare-fun e!678884 () Bool)

(assert (=> b!1194261 (= e!678884 true)))

(declare-datatypes ((V!45369 0))(
  ( (V!45370 (val!15147 Int)) )
))
(declare-fun zeroValue!944 () V!45369)

(declare-datatypes ((array!77185 0))(
  ( (array!77186 (arr!37236 (Array (_ BitVec 32) (_ BitVec 64))) (size!37773 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77185)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14381 0))(
  ( (ValueCellFull!14381 (v!17781 V!45369)) (EmptyCell!14381) )
))
(declare-datatypes ((array!77187 0))(
  ( (array!77188 (arr!37237 (Array (_ BitVec 32) ValueCell!14381)) (size!37774 (_ BitVec 32))) )
))
(declare-fun lt!542908 () array!77187)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _values!996 () array!77187)

(declare-fun minValue!944 () V!45369)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!542905 () array!77185)

(declare-datatypes ((tuple2!19506 0))(
  ( (tuple2!19507 (_1!9764 (_ BitVec 64)) (_2!9764 V!45369)) )
))
(declare-datatypes ((List!26247 0))(
  ( (Nil!26244) (Cons!26243 (h!27461 tuple2!19506) (t!38882 List!26247)) )
))
(declare-datatypes ((ListLongMap!17483 0))(
  ( (ListLongMap!17484 (toList!8757 List!26247)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5225 (array!77185 array!77187 (_ BitVec 32) (_ BitVec 32) V!45369 V!45369 (_ BitVec 32) Int) ListLongMap!17483)

(declare-fun -!1761 (ListLongMap!17483 (_ BitVec 64)) ListLongMap!17483)

(assert (=> b!1194261 (= (getCurrentListMapNoExtraKeys!5225 lt!542905 lt!542908 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1761 (getCurrentListMapNoExtraKeys!5225 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39553 0))(
  ( (Unit!39554) )
))
(declare-fun lt!542904 () Unit!39553)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!976 (array!77185 array!77187 (_ BitVec 32) (_ BitVec 32) V!45369 V!45369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39553)

(assert (=> b!1194261 (= lt!542904 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!976 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1194262 () Bool)

(declare-fun res!794169 () Bool)

(declare-fun e!678888 () Bool)

(assert (=> b!1194262 (=> (not res!794169) (not e!678888))))

(declare-datatypes ((List!26248 0))(
  ( (Nil!26245) (Cons!26244 (h!27462 (_ BitVec 64)) (t!38883 List!26248)) )
))
(declare-fun arrayNoDuplicates!0 (array!77185 (_ BitVec 32) List!26248) Bool)

(assert (=> b!1194262 (= res!794169 (arrayNoDuplicates!0 lt!542905 #b00000000000000000000000000000000 Nil!26245))))

(declare-fun b!1194263 () Bool)

(declare-fun res!794171 () Bool)

(declare-fun e!678885 () Bool)

(assert (=> b!1194263 (=> (not res!794171) (not e!678885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194263 (= res!794171 (validKeyInArray!0 k0!934))))

(declare-fun b!1194264 () Bool)

(declare-fun e!678889 () Bool)

(assert (=> b!1194264 (= e!678888 (not e!678889))))

(declare-fun res!794170 () Bool)

(assert (=> b!1194264 (=> res!794170 e!678889)))

(assert (=> b!1194264 (= res!794170 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194264 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542903 () Unit!39553)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77185 (_ BitVec 64) (_ BitVec 32)) Unit!39553)

(assert (=> b!1194264 (= lt!542903 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1194265 () Bool)

(declare-fun e!678890 () Bool)

(declare-fun e!678886 () Bool)

(declare-fun mapRes!47099 () Bool)

(assert (=> b!1194265 (= e!678890 (and e!678886 mapRes!47099))))

(declare-fun condMapEmpty!47099 () Bool)

(declare-fun mapDefault!47099 () ValueCell!14381)

(assert (=> b!1194265 (= condMapEmpty!47099 (= (arr!37237 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14381)) mapDefault!47099)))))

(declare-fun b!1194266 () Bool)

(declare-fun tp_is_empty!30181 () Bool)

(assert (=> b!1194266 (= e!678886 tp_is_empty!30181)))

(declare-fun res!794162 () Bool)

(assert (=> start!100308 (=> (not res!794162) (not e!678885))))

(assert (=> start!100308 (= res!794162 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37773 _keys!1208))))))

(assert (=> start!100308 e!678885))

(assert (=> start!100308 tp_is_empty!30181))

(declare-fun array_inv!28456 (array!77185) Bool)

(assert (=> start!100308 (array_inv!28456 _keys!1208)))

(assert (=> start!100308 true))

(assert (=> start!100308 tp!89666))

(declare-fun array_inv!28457 (array!77187) Bool)

(assert (=> start!100308 (and (array_inv!28457 _values!996) e!678890)))

(declare-fun b!1194267 () Bool)

(declare-fun res!794160 () Bool)

(assert (=> b!1194267 (=> (not res!794160) (not e!678885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194267 (= res!794160 (validMask!0 mask!1564))))

(declare-fun b!1194268 () Bool)

(declare-fun e!678883 () Bool)

(assert (=> b!1194268 (= e!678883 tp_is_empty!30181)))

(declare-fun b!1194269 () Bool)

(assert (=> b!1194269 (= e!678885 e!678888)))

(declare-fun res!794161 () Bool)

(assert (=> b!1194269 (=> (not res!794161) (not e!678888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77185 (_ BitVec 32)) Bool)

(assert (=> b!1194269 (= res!794161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542905 mask!1564))))

(assert (=> b!1194269 (= lt!542905 (array!77186 (store (arr!37236 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37773 _keys!1208)))))

(declare-fun b!1194270 () Bool)

(declare-fun res!794168 () Bool)

(assert (=> b!1194270 (=> (not res!794168) (not e!678885))))

(assert (=> b!1194270 (= res!794168 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37773 _keys!1208))))))

(declare-fun b!1194271 () Bool)

(declare-fun res!794165 () Bool)

(assert (=> b!1194271 (=> (not res!794165) (not e!678885))))

(assert (=> b!1194271 (= res!794165 (= (select (arr!37236 _keys!1208) i!673) k0!934))))

(declare-fun b!1194272 () Bool)

(declare-fun res!794166 () Bool)

(assert (=> b!1194272 (=> (not res!794166) (not e!678885))))

(assert (=> b!1194272 (= res!794166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47099 () Bool)

(assert (=> mapIsEmpty!47099 mapRes!47099))

(declare-fun b!1194273 () Bool)

(declare-fun res!794167 () Bool)

(assert (=> b!1194273 (=> (not res!794167) (not e!678885))))

(assert (=> b!1194273 (= res!794167 (and (= (size!37774 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37773 _keys!1208) (size!37774 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194274 () Bool)

(assert (=> b!1194274 (= e!678889 e!678884)))

(declare-fun res!794163 () Bool)

(assert (=> b!1194274 (=> res!794163 e!678884)))

(assert (=> b!1194274 (= res!794163 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542907 () ListLongMap!17483)

(assert (=> b!1194274 (= lt!542907 (getCurrentListMapNoExtraKeys!5225 lt!542905 lt!542908 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3174 (Int (_ BitVec 64)) V!45369)

(assert (=> b!1194274 (= lt!542908 (array!77188 (store (arr!37237 _values!996) i!673 (ValueCellFull!14381 (dynLambda!3174 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37774 _values!996)))))

(declare-fun lt!542906 () ListLongMap!17483)

(assert (=> b!1194274 (= lt!542906 (getCurrentListMapNoExtraKeys!5225 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1194275 () Bool)

(declare-fun res!794164 () Bool)

(assert (=> b!1194275 (=> (not res!794164) (not e!678885))))

(assert (=> b!1194275 (= res!794164 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26245))))

(declare-fun mapNonEmpty!47099 () Bool)

(declare-fun tp!89667 () Bool)

(assert (=> mapNonEmpty!47099 (= mapRes!47099 (and tp!89667 e!678883))))

(declare-fun mapKey!47099 () (_ BitVec 32))

(declare-fun mapValue!47099 () ValueCell!14381)

(declare-fun mapRest!47099 () (Array (_ BitVec 32) ValueCell!14381))

(assert (=> mapNonEmpty!47099 (= (arr!37237 _values!996) (store mapRest!47099 mapKey!47099 mapValue!47099))))

(assert (= (and start!100308 res!794162) b!1194267))

(assert (= (and b!1194267 res!794160) b!1194273))

(assert (= (and b!1194273 res!794167) b!1194272))

(assert (= (and b!1194272 res!794166) b!1194275))

(assert (= (and b!1194275 res!794164) b!1194270))

(assert (= (and b!1194270 res!794168) b!1194263))

(assert (= (and b!1194263 res!794171) b!1194271))

(assert (= (and b!1194271 res!794165) b!1194269))

(assert (= (and b!1194269 res!794161) b!1194262))

(assert (= (and b!1194262 res!794169) b!1194264))

(assert (= (and b!1194264 (not res!794170)) b!1194274))

(assert (= (and b!1194274 (not res!794163)) b!1194261))

(assert (= (and b!1194265 condMapEmpty!47099) mapIsEmpty!47099))

(assert (= (and b!1194265 (not condMapEmpty!47099)) mapNonEmpty!47099))

(get-info :version)

(assert (= (and mapNonEmpty!47099 ((_ is ValueCellFull!14381) mapValue!47099)) b!1194268))

(assert (= (and b!1194265 ((_ is ValueCellFull!14381) mapDefault!47099)) b!1194266))

(assert (= start!100308 b!1194265))

(declare-fun b_lambda!20789 () Bool)

(assert (=> (not b_lambda!20789) (not b!1194274)))

(declare-fun t!38881 () Bool)

(declare-fun tb!10455 () Bool)

(assert (=> (and start!100308 (= defaultEntry!1004 defaultEntry!1004) t!38881) tb!10455))

(declare-fun result!21485 () Bool)

(assert (=> tb!10455 (= result!21485 tp_is_empty!30181)))

(assert (=> b!1194274 t!38881))

(declare-fun b_and!42173 () Bool)

(assert (= b_and!42171 (and (=> t!38881 result!21485) b_and!42173)))

(declare-fun m!1102845 () Bool)

(assert (=> mapNonEmpty!47099 m!1102845))

(declare-fun m!1102847 () Bool)

(assert (=> b!1194261 m!1102847))

(declare-fun m!1102849 () Bool)

(assert (=> b!1194261 m!1102849))

(assert (=> b!1194261 m!1102849))

(declare-fun m!1102851 () Bool)

(assert (=> b!1194261 m!1102851))

(declare-fun m!1102853 () Bool)

(assert (=> b!1194261 m!1102853))

(declare-fun m!1102855 () Bool)

(assert (=> b!1194262 m!1102855))

(declare-fun m!1102857 () Bool)

(assert (=> b!1194274 m!1102857))

(declare-fun m!1102859 () Bool)

(assert (=> b!1194274 m!1102859))

(declare-fun m!1102861 () Bool)

(assert (=> b!1194274 m!1102861))

(declare-fun m!1102863 () Bool)

(assert (=> b!1194274 m!1102863))

(declare-fun m!1102865 () Bool)

(assert (=> start!100308 m!1102865))

(declare-fun m!1102867 () Bool)

(assert (=> start!100308 m!1102867))

(declare-fun m!1102869 () Bool)

(assert (=> b!1194275 m!1102869))

(declare-fun m!1102871 () Bool)

(assert (=> b!1194272 m!1102871))

(declare-fun m!1102873 () Bool)

(assert (=> b!1194263 m!1102873))

(declare-fun m!1102875 () Bool)

(assert (=> b!1194264 m!1102875))

(declare-fun m!1102877 () Bool)

(assert (=> b!1194264 m!1102877))

(declare-fun m!1102879 () Bool)

(assert (=> b!1194267 m!1102879))

(declare-fun m!1102881 () Bool)

(assert (=> b!1194269 m!1102881))

(declare-fun m!1102883 () Bool)

(assert (=> b!1194269 m!1102883))

(declare-fun m!1102885 () Bool)

(assert (=> b!1194271 m!1102885))

(check-sat tp_is_empty!30181 (not b!1194275) (not start!100308) (not b!1194274) (not b!1194262) (not b!1194261) (not b!1194263) (not b!1194272) (not b_next!25651) (not b_lambda!20789) (not b!1194264) b_and!42173 (not b!1194269) (not mapNonEmpty!47099) (not b!1194267))
(check-sat b_and!42173 (not b_next!25651))
