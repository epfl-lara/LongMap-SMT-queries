; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101786 () Bool)

(assert start!101786)

(declare-fun b_free!26475 () Bool)

(declare-fun b_next!26475 () Bool)

(assert (=> start!101786 (= b_free!26475 (not b_next!26475))))

(declare-fun tp!92470 () Bool)

(declare-fun b_and!44211 () Bool)

(assert (=> start!101786 (= tp!92470 b_and!44211)))

(declare-fun mapIsEmpty!48667 () Bool)

(declare-fun mapRes!48667 () Bool)

(assert (=> mapIsEmpty!48667 mapRes!48667))

(declare-fun b!1226036 () Bool)

(declare-fun e!696323 () Bool)

(declare-fun tp_is_empty!31179 () Bool)

(assert (=> b!1226036 (= e!696323 tp_is_empty!31179)))

(declare-fun b!1226037 () Bool)

(declare-fun e!696319 () Bool)

(declare-fun e!696325 () Bool)

(assert (=> b!1226037 (= e!696319 e!696325)))

(declare-fun res!814812 () Bool)

(assert (=> b!1226037 (=> res!814812 e!696325)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1226037 (= res!814812 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46699 0))(
  ( (V!46700 (val!15646 Int)) )
))
(declare-fun zeroValue!944 () V!46699)

(declare-datatypes ((array!79135 0))(
  ( (array!79136 (arr!38194 (Array (_ BitVec 32) (_ BitVec 64))) (size!38730 (_ BitVec 32))) )
))
(declare-fun lt!558673 () array!79135)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!20164 0))(
  ( (tuple2!20165 (_1!10093 (_ BitVec 64)) (_2!10093 V!46699)) )
))
(declare-datatypes ((List!26967 0))(
  ( (Nil!26964) (Cons!26963 (h!28172 tuple2!20164) (t!40422 List!26967)) )
))
(declare-datatypes ((ListLongMap!18133 0))(
  ( (ListLongMap!18134 (toList!9082 List!26967)) )
))
(declare-fun lt!558670 () ListLongMap!18133)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14880 0))(
  ( (ValueCellFull!14880 (v!18308 V!46699)) (EmptyCell!14880) )
))
(declare-datatypes ((array!79137 0))(
  ( (array!79138 (arr!38195 (Array (_ BitVec 32) ValueCell!14880)) (size!38731 (_ BitVec 32))) )
))
(declare-fun lt!558671 () array!79137)

(declare-fun minValue!944 () V!46699)

(declare-fun getCurrentListMapNoExtraKeys!5501 (array!79135 array!79137 (_ BitVec 32) (_ BitVec 32) V!46699 V!46699 (_ BitVec 32) Int) ListLongMap!18133)

(assert (=> b!1226037 (= lt!558670 (getCurrentListMapNoExtraKeys!5501 lt!558673 lt!558671 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!79137)

(declare-fun dynLambda!3372 (Int (_ BitVec 64)) V!46699)

(assert (=> b!1226037 (= lt!558671 (array!79138 (store (arr!38195 _values!996) i!673 (ValueCellFull!14880 (dynLambda!3372 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38731 _values!996)))))

(declare-fun _keys!1208 () array!79135)

(declare-fun lt!558669 () ListLongMap!18133)

(assert (=> b!1226037 (= lt!558669 (getCurrentListMapNoExtraKeys!5501 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1226038 () Bool)

(declare-fun res!814817 () Bool)

(declare-fun e!696318 () Bool)

(assert (=> b!1226038 (=> (not res!814817) (not e!696318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1226038 (= res!814817 (validMask!0 mask!1564))))

(declare-fun b!1226039 () Bool)

(declare-fun res!814811 () Bool)

(assert (=> b!1226039 (=> (not res!814811) (not e!696318))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1226039 (= res!814811 (= (select (arr!38194 _keys!1208) i!673) k0!934))))

(declare-fun b!1226040 () Bool)

(declare-fun e!696322 () Bool)

(assert (=> b!1226040 (= e!696322 (not e!696319))))

(declare-fun res!814822 () Bool)

(assert (=> b!1226040 (=> res!814822 e!696319)))

(assert (=> b!1226040 (= res!814822 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!79135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226040 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40632 0))(
  ( (Unit!40633) )
))
(declare-fun lt!558672 () Unit!40632)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79135 (_ BitVec 64) (_ BitVec 32)) Unit!40632)

(assert (=> b!1226040 (= lt!558672 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1226041 () Bool)

(declare-fun e!696321 () Bool)

(assert (=> b!1226041 (= e!696321 (and e!696323 mapRes!48667))))

(declare-fun condMapEmpty!48667 () Bool)

(declare-fun mapDefault!48667 () ValueCell!14880)

(assert (=> b!1226041 (= condMapEmpty!48667 (= (arr!38195 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14880)) mapDefault!48667)))))

(declare-fun res!814818 () Bool)

(assert (=> start!101786 (=> (not res!814818) (not e!696318))))

(assert (=> start!101786 (= res!814818 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38730 _keys!1208))))))

(assert (=> start!101786 e!696318))

(assert (=> start!101786 tp_is_empty!31179))

(declare-fun array_inv!29042 (array!79135) Bool)

(assert (=> start!101786 (array_inv!29042 _keys!1208)))

(assert (=> start!101786 true))

(assert (=> start!101786 tp!92470))

(declare-fun array_inv!29043 (array!79137) Bool)

(assert (=> start!101786 (and (array_inv!29043 _values!996) e!696321)))

(declare-fun b!1226042 () Bool)

(declare-fun e!696324 () Bool)

(assert (=> b!1226042 (= e!696324 tp_is_empty!31179)))

(declare-fun b!1226043 () Bool)

(declare-fun res!814821 () Bool)

(assert (=> b!1226043 (=> (not res!814821) (not e!696318))))

(assert (=> b!1226043 (= res!814821 (and (= (size!38731 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38730 _keys!1208) (size!38731 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1226044 () Bool)

(declare-fun res!814819 () Bool)

(assert (=> b!1226044 (=> (not res!814819) (not e!696318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79135 (_ BitVec 32)) Bool)

(assert (=> b!1226044 (= res!814819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48667 () Bool)

(declare-fun tp!92471 () Bool)

(assert (=> mapNonEmpty!48667 (= mapRes!48667 (and tp!92471 e!696324))))

(declare-fun mapValue!48667 () ValueCell!14880)

(declare-fun mapRest!48667 () (Array (_ BitVec 32) ValueCell!14880))

(declare-fun mapKey!48667 () (_ BitVec 32))

(assert (=> mapNonEmpty!48667 (= (arr!38195 _values!996) (store mapRest!48667 mapKey!48667 mapValue!48667))))

(declare-fun b!1226045 () Bool)

(declare-fun res!814815 () Bool)

(assert (=> b!1226045 (=> (not res!814815) (not e!696318))))

(declare-datatypes ((List!26968 0))(
  ( (Nil!26965) (Cons!26964 (h!28173 (_ BitVec 64)) (t!40423 List!26968)) )
))
(declare-fun arrayNoDuplicates!0 (array!79135 (_ BitVec 32) List!26968) Bool)

(assert (=> b!1226045 (= res!814815 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26965))))

(declare-fun b!1226046 () Bool)

(declare-fun res!814813 () Bool)

(assert (=> b!1226046 (=> (not res!814813) (not e!696318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226046 (= res!814813 (validKeyInArray!0 k0!934))))

(declare-fun b!1226047 () Bool)

(declare-fun res!814820 () Bool)

(assert (=> b!1226047 (=> (not res!814820) (not e!696322))))

(assert (=> b!1226047 (= res!814820 (arrayNoDuplicates!0 lt!558673 #b00000000000000000000000000000000 Nil!26965))))

(declare-fun b!1226048 () Bool)

(declare-fun res!814816 () Bool)

(assert (=> b!1226048 (=> (not res!814816) (not e!696318))))

(assert (=> b!1226048 (= res!814816 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38730 _keys!1208))))))

(declare-fun b!1226049 () Bool)

(assert (=> b!1226049 (= e!696325 true)))

(declare-fun -!1981 (ListLongMap!18133 (_ BitVec 64)) ListLongMap!18133)

(assert (=> b!1226049 (= (getCurrentListMapNoExtraKeys!5501 lt!558673 lt!558671 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1981 (getCurrentListMapNoExtraKeys!5501 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!558674 () Unit!40632)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1187 (array!79135 array!79137 (_ BitVec 32) (_ BitVec 32) V!46699 V!46699 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40632)

(assert (=> b!1226049 (= lt!558674 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1187 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1226050 () Bool)

(assert (=> b!1226050 (= e!696318 e!696322)))

(declare-fun res!814814 () Bool)

(assert (=> b!1226050 (=> (not res!814814) (not e!696322))))

(assert (=> b!1226050 (= res!814814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558673 mask!1564))))

(assert (=> b!1226050 (= lt!558673 (array!79136 (store (arr!38194 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38730 _keys!1208)))))

(assert (= (and start!101786 res!814818) b!1226038))

(assert (= (and b!1226038 res!814817) b!1226043))

(assert (= (and b!1226043 res!814821) b!1226044))

(assert (= (and b!1226044 res!814819) b!1226045))

(assert (= (and b!1226045 res!814815) b!1226048))

(assert (= (and b!1226048 res!814816) b!1226046))

(assert (= (and b!1226046 res!814813) b!1226039))

(assert (= (and b!1226039 res!814811) b!1226050))

(assert (= (and b!1226050 res!814814) b!1226047))

(assert (= (and b!1226047 res!814820) b!1226040))

(assert (= (and b!1226040 (not res!814822)) b!1226037))

(assert (= (and b!1226037 (not res!814812)) b!1226049))

(assert (= (and b!1226041 condMapEmpty!48667) mapIsEmpty!48667))

(assert (= (and b!1226041 (not condMapEmpty!48667)) mapNonEmpty!48667))

(get-info :version)

(assert (= (and mapNonEmpty!48667 ((_ is ValueCellFull!14880) mapValue!48667)) b!1226042))

(assert (= (and b!1226041 ((_ is ValueCellFull!14880) mapDefault!48667)) b!1226036))

(assert (= start!101786 b!1226041))

(declare-fun b_lambda!22455 () Bool)

(assert (=> (not b_lambda!22455) (not b!1226037)))

(declare-fun t!40421 () Bool)

(declare-fun tb!11275 () Bool)

(assert (=> (and start!101786 (= defaultEntry!1004 defaultEntry!1004) t!40421) tb!11275))

(declare-fun result!23163 () Bool)

(assert (=> tb!11275 (= result!23163 tp_is_empty!31179)))

(assert (=> b!1226037 t!40421))

(declare-fun b_and!44213 () Bool)

(assert (= b_and!44211 (and (=> t!40421 result!23163) b_and!44213)))

(declare-fun m!1131125 () Bool)

(assert (=> b!1226044 m!1131125))

(declare-fun m!1131127 () Bool)

(assert (=> b!1226045 m!1131127))

(declare-fun m!1131129 () Bool)

(assert (=> start!101786 m!1131129))

(declare-fun m!1131131 () Bool)

(assert (=> start!101786 m!1131131))

(declare-fun m!1131133 () Bool)

(assert (=> b!1226047 m!1131133))

(declare-fun m!1131135 () Bool)

(assert (=> b!1226039 m!1131135))

(declare-fun m!1131137 () Bool)

(assert (=> b!1226037 m!1131137))

(declare-fun m!1131139 () Bool)

(assert (=> b!1226037 m!1131139))

(declare-fun m!1131141 () Bool)

(assert (=> b!1226037 m!1131141))

(declare-fun m!1131143 () Bool)

(assert (=> b!1226037 m!1131143))

(declare-fun m!1131145 () Bool)

(assert (=> b!1226049 m!1131145))

(declare-fun m!1131147 () Bool)

(assert (=> b!1226049 m!1131147))

(assert (=> b!1226049 m!1131147))

(declare-fun m!1131149 () Bool)

(assert (=> b!1226049 m!1131149))

(declare-fun m!1131151 () Bool)

(assert (=> b!1226049 m!1131151))

(declare-fun m!1131153 () Bool)

(assert (=> b!1226050 m!1131153))

(declare-fun m!1131155 () Bool)

(assert (=> b!1226050 m!1131155))

(declare-fun m!1131157 () Bool)

(assert (=> b!1226046 m!1131157))

(declare-fun m!1131159 () Bool)

(assert (=> b!1226040 m!1131159))

(declare-fun m!1131161 () Bool)

(assert (=> b!1226040 m!1131161))

(declare-fun m!1131163 () Bool)

(assert (=> b!1226038 m!1131163))

(declare-fun m!1131165 () Bool)

(assert (=> mapNonEmpty!48667 m!1131165))

(check-sat (not b!1226046) (not b!1226049) (not mapNonEmpty!48667) (not b!1226038) (not start!101786) (not b_next!26475) (not b!1226037) tp_is_empty!31179 (not b_lambda!22455) b_and!44213 (not b!1226040) (not b!1226047) (not b!1226045) (not b!1226044) (not b!1226050))
(check-sat b_and!44213 (not b_next!26475))
