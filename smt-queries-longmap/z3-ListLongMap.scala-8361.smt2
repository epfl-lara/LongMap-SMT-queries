; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101750 () Bool)

(assert start!101750)

(declare-fun b_free!26439 () Bool)

(declare-fun b_next!26439 () Bool)

(assert (=> start!101750 (= b_free!26439 (not b_next!26439))))

(declare-fun tp!92363 () Bool)

(declare-fun b_and!44139 () Bool)

(assert (=> start!101750 (= tp!92363 b_and!44139)))

(declare-fun b!1225071 () Bool)

(declare-fun e!695791 () Bool)

(declare-fun tp_is_empty!31143 () Bool)

(assert (=> b!1225071 (= e!695791 tp_is_empty!31143)))

(declare-fun b!1225072 () Bool)

(declare-fun e!695789 () Bool)

(declare-fun e!695794 () Bool)

(assert (=> b!1225072 (= e!695789 e!695794)))

(declare-fun res!814089 () Bool)

(assert (=> b!1225072 (=> res!814089 e!695794)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225072 (= res!814089 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46651 0))(
  ( (V!46652 (val!15628 Int)) )
))
(declare-fun zeroValue!944 () V!46651)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14862 0))(
  ( (ValueCellFull!14862 (v!18290 V!46651)) (EmptyCell!14862) )
))
(declare-datatypes ((array!79069 0))(
  ( (array!79070 (arr!38161 (Array (_ BitVec 32) ValueCell!14862)) (size!38697 (_ BitVec 32))) )
))
(declare-fun lt!558064 () array!79069)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46651)

(declare-datatypes ((array!79071 0))(
  ( (array!79072 (arr!38162 (Array (_ BitVec 32) (_ BitVec 64))) (size!38698 (_ BitVec 32))) )
))
(declare-fun lt!558062 () array!79071)

(declare-datatypes ((tuple2!20142 0))(
  ( (tuple2!20143 (_1!10082 (_ BitVec 64)) (_2!10082 V!46651)) )
))
(declare-datatypes ((List!26943 0))(
  ( (Nil!26940) (Cons!26939 (h!28148 tuple2!20142) (t!40362 List!26943)) )
))
(declare-datatypes ((ListLongMap!18111 0))(
  ( (ListLongMap!18112 (toList!9071 List!26943)) )
))
(declare-fun lt!558059 () ListLongMap!18111)

(declare-fun getCurrentListMapNoExtraKeys!5490 (array!79071 array!79069 (_ BitVec 32) (_ BitVec 32) V!46651 V!46651 (_ BitVec 32) Int) ListLongMap!18111)

(assert (=> b!1225072 (= lt!558059 (getCurrentListMapNoExtraKeys!5490 lt!558062 lt!558064 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!79069)

(declare-fun lt!558061 () V!46651)

(assert (=> b!1225072 (= lt!558064 (array!79070 (store (arr!38161 _values!996) i!673 (ValueCellFull!14862 lt!558061)) (size!38697 _values!996)))))

(declare-fun dynLambda!3362 (Int (_ BitVec 64)) V!46651)

(assert (=> b!1225072 (= lt!558061 (dynLambda!3362 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!79071)

(declare-fun lt!558068 () ListLongMap!18111)

(assert (=> b!1225072 (= lt!558068 (getCurrentListMapNoExtraKeys!5490 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225073 () Bool)

(declare-fun res!814091 () Bool)

(declare-fun e!695799 () Bool)

(assert (=> b!1225073 (=> (not res!814091) (not e!695799))))

(assert (=> b!1225073 (= res!814091 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38698 _keys!1208))))))

(declare-fun mapNonEmpty!48613 () Bool)

(declare-fun mapRes!48613 () Bool)

(declare-fun tp!92362 () Bool)

(assert (=> mapNonEmpty!48613 (= mapRes!48613 (and tp!92362 e!695791))))

(declare-fun mapValue!48613 () ValueCell!14862)

(declare-fun mapKey!48613 () (_ BitVec 32))

(declare-fun mapRest!48613 () (Array (_ BitVec 32) ValueCell!14862))

(assert (=> mapNonEmpty!48613 (= (arr!38161 _values!996) (store mapRest!48613 mapKey!48613 mapValue!48613))))

(declare-fun b!1225074 () Bool)

(declare-fun e!695797 () Bool)

(declare-fun e!695800 () Bool)

(assert (=> b!1225074 (= e!695797 (and e!695800 mapRes!48613))))

(declare-fun condMapEmpty!48613 () Bool)

(declare-fun mapDefault!48613 () ValueCell!14862)

(assert (=> b!1225074 (= condMapEmpty!48613 (= (arr!38161 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14862)) mapDefault!48613)))))

(declare-fun b!1225076 () Bool)

(declare-fun res!814095 () Bool)

(assert (=> b!1225076 (=> (not res!814095) (not e!695799))))

(assert (=> b!1225076 (= res!814095 (and (= (size!38697 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38698 _keys!1208) (size!38697 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225077 () Bool)

(declare-fun res!814093 () Bool)

(declare-fun e!695795 () Bool)

(assert (=> b!1225077 (=> (not res!814093) (not e!695795))))

(declare-datatypes ((List!26944 0))(
  ( (Nil!26941) (Cons!26940 (h!28149 (_ BitVec 64)) (t!40363 List!26944)) )
))
(declare-fun arrayNoDuplicates!0 (array!79071 (_ BitVec 32) List!26944) Bool)

(assert (=> b!1225077 (= res!814093 (arrayNoDuplicates!0 lt!558062 #b00000000000000000000000000000000 Nil!26941))))

(declare-fun b!1225078 () Bool)

(declare-fun res!814099 () Bool)

(assert (=> b!1225078 (=> (not res!814099) (not e!695799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79071 (_ BitVec 32)) Bool)

(assert (=> b!1225078 (= res!814099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225079 () Bool)

(assert (=> b!1225079 (= e!695795 (not e!695789))))

(declare-fun res!814100 () Bool)

(assert (=> b!1225079 (=> res!814100 e!695789)))

(assert (=> b!1225079 (= res!814100 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225079 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40597 0))(
  ( (Unit!40598) )
))
(declare-fun lt!558077 () Unit!40597)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79071 (_ BitVec 64) (_ BitVec 32)) Unit!40597)

(assert (=> b!1225079 (= lt!558077 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225080 () Bool)

(assert (=> b!1225080 (= e!695799 e!695795)))

(declare-fun res!814101 () Bool)

(assert (=> b!1225080 (=> (not res!814101) (not e!695795))))

(assert (=> b!1225080 (= res!814101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558062 mask!1564))))

(assert (=> b!1225080 (= lt!558062 (array!79072 (store (arr!38162 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38698 _keys!1208)))))

(declare-fun b!1225081 () Bool)

(declare-fun e!695796 () Unit!40597)

(declare-fun Unit!40599 () Unit!40597)

(assert (=> b!1225081 (= e!695796 Unit!40599)))

(declare-fun b!1225082 () Bool)

(declare-fun res!814098 () Bool)

(assert (=> b!1225082 (=> (not res!814098) (not e!695799))))

(assert (=> b!1225082 (= res!814098 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26941))))

(declare-fun b!1225083 () Bool)

(declare-fun res!814092 () Bool)

(assert (=> b!1225083 (=> (not res!814092) (not e!695799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225083 (= res!814092 (validKeyInArray!0 k0!934))))

(declare-fun b!1225084 () Bool)

(declare-fun e!695792 () Bool)

(assert (=> b!1225084 (= e!695794 e!695792)))

(declare-fun res!814096 () Bool)

(assert (=> b!1225084 (=> res!814096 e!695792)))

(assert (=> b!1225084 (= res!814096 (not (validKeyInArray!0 (select (arr!38162 _keys!1208) from!1455))))))

(declare-fun lt!558060 () ListLongMap!18111)

(declare-fun lt!558067 () ListLongMap!18111)

(assert (=> b!1225084 (= lt!558060 lt!558067)))

(declare-fun lt!558065 () ListLongMap!18111)

(declare-fun -!1970 (ListLongMap!18111 (_ BitVec 64)) ListLongMap!18111)

(assert (=> b!1225084 (= lt!558067 (-!1970 lt!558065 k0!934))))

(assert (=> b!1225084 (= lt!558060 (getCurrentListMapNoExtraKeys!5490 lt!558062 lt!558064 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1225084 (= lt!558065 (getCurrentListMapNoExtraKeys!5490 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!558066 () Unit!40597)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1176 (array!79071 array!79069 (_ BitVec 32) (_ BitVec 32) V!46651 V!46651 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40597)

(assert (=> b!1225084 (= lt!558066 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1176 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225085 () Bool)

(assert (=> b!1225085 (= e!695792 true)))

(declare-fun lt!558063 () ListLongMap!18111)

(declare-fun lt!558070 () ListLongMap!18111)

(assert (=> b!1225085 (= (-!1970 lt!558063 k0!934) lt!558070)))

(declare-fun lt!558074 () V!46651)

(declare-fun lt!558076 () Unit!40597)

(declare-fun addRemoveCommutativeForDiffKeys!213 (ListLongMap!18111 (_ BitVec 64) V!46651 (_ BitVec 64)) Unit!40597)

(assert (=> b!1225085 (= lt!558076 (addRemoveCommutativeForDiffKeys!213 lt!558065 (select (arr!38162 _keys!1208) from!1455) lt!558074 k0!934))))

(assert (=> b!1225085 (and (= lt!558068 lt!558063) (= lt!558067 lt!558060))))

(declare-fun lt!558072 () tuple2!20142)

(declare-fun +!4126 (ListLongMap!18111 tuple2!20142) ListLongMap!18111)

(assert (=> b!1225085 (= lt!558063 (+!4126 lt!558065 lt!558072))))

(assert (=> b!1225085 (not (= (select (arr!38162 _keys!1208) from!1455) k0!934))))

(declare-fun lt!558071 () Unit!40597)

(assert (=> b!1225085 (= lt!558071 e!695796)))

(declare-fun c!120479 () Bool)

(assert (=> b!1225085 (= c!120479 (= (select (arr!38162 _keys!1208) from!1455) k0!934))))

(declare-fun e!695790 () Bool)

(assert (=> b!1225085 e!695790))

(declare-fun res!814090 () Bool)

(assert (=> b!1225085 (=> (not res!814090) (not e!695790))))

(assert (=> b!1225085 (= res!814090 (= lt!558059 lt!558070))))

(assert (=> b!1225085 (= lt!558070 (+!4126 lt!558067 lt!558072))))

(assert (=> b!1225085 (= lt!558072 (tuple2!20143 (select (arr!38162 _keys!1208) from!1455) lt!558074))))

(declare-fun get!19492 (ValueCell!14862 V!46651) V!46651)

(assert (=> b!1225085 (= lt!558074 (get!19492 (select (arr!38161 _values!996) from!1455) lt!558061))))

(declare-fun mapIsEmpty!48613 () Bool)

(assert (=> mapIsEmpty!48613 mapRes!48613))

(declare-fun b!1225086 () Bool)

(declare-fun Unit!40600 () Unit!40597)

(assert (=> b!1225086 (= e!695796 Unit!40600)))

(declare-fun lt!558073 () Unit!40597)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79071 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40597)

(assert (=> b!1225086 (= lt!558073 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1225086 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!558075 () Unit!40597)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79071 (_ BitVec 32) (_ BitVec 32)) Unit!40597)

(assert (=> b!1225086 (= lt!558075 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1225086 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26941)))

(declare-fun lt!558069 () Unit!40597)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79071 (_ BitVec 64) (_ BitVec 32) List!26944) Unit!40597)

(assert (=> b!1225086 (= lt!558069 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26941))))

(assert (=> b!1225086 false))

(declare-fun b!1225075 () Bool)

(declare-fun e!695793 () Bool)

(assert (=> b!1225075 (= e!695790 e!695793)))

(declare-fun res!814102 () Bool)

(assert (=> b!1225075 (=> res!814102 e!695793)))

(assert (=> b!1225075 (= res!814102 (not (= (select (arr!38162 _keys!1208) from!1455) k0!934)))))

(declare-fun res!814088 () Bool)

(assert (=> start!101750 (=> (not res!814088) (not e!695799))))

(assert (=> start!101750 (= res!814088 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38698 _keys!1208))))))

(assert (=> start!101750 e!695799))

(assert (=> start!101750 tp_is_empty!31143))

(declare-fun array_inv!29024 (array!79071) Bool)

(assert (=> start!101750 (array_inv!29024 _keys!1208)))

(assert (=> start!101750 true))

(assert (=> start!101750 tp!92363))

(declare-fun array_inv!29025 (array!79069) Bool)

(assert (=> start!101750 (and (array_inv!29025 _values!996) e!695797)))

(declare-fun b!1225087 () Bool)

(assert (=> b!1225087 (= e!695800 tp_is_empty!31143)))

(declare-fun b!1225088 () Bool)

(declare-fun res!814097 () Bool)

(assert (=> b!1225088 (=> (not res!814097) (not e!695799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225088 (= res!814097 (validMask!0 mask!1564))))

(declare-fun b!1225089 () Bool)

(declare-fun res!814094 () Bool)

(assert (=> b!1225089 (=> (not res!814094) (not e!695799))))

(assert (=> b!1225089 (= res!814094 (= (select (arr!38162 _keys!1208) i!673) k0!934))))

(declare-fun b!1225090 () Bool)

(assert (=> b!1225090 (= e!695793 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!101750 res!814088) b!1225088))

(assert (= (and b!1225088 res!814097) b!1225076))

(assert (= (and b!1225076 res!814095) b!1225078))

(assert (= (and b!1225078 res!814099) b!1225082))

(assert (= (and b!1225082 res!814098) b!1225073))

(assert (= (and b!1225073 res!814091) b!1225083))

(assert (= (and b!1225083 res!814092) b!1225089))

(assert (= (and b!1225089 res!814094) b!1225080))

(assert (= (and b!1225080 res!814101) b!1225077))

(assert (= (and b!1225077 res!814093) b!1225079))

(assert (= (and b!1225079 (not res!814100)) b!1225072))

(assert (= (and b!1225072 (not res!814089)) b!1225084))

(assert (= (and b!1225084 (not res!814096)) b!1225085))

(assert (= (and b!1225085 res!814090) b!1225075))

(assert (= (and b!1225075 (not res!814102)) b!1225090))

(assert (= (and b!1225085 c!120479) b!1225086))

(assert (= (and b!1225085 (not c!120479)) b!1225081))

(assert (= (and b!1225074 condMapEmpty!48613) mapIsEmpty!48613))

(assert (= (and b!1225074 (not condMapEmpty!48613)) mapNonEmpty!48613))

(get-info :version)

(assert (= (and mapNonEmpty!48613 ((_ is ValueCellFull!14862) mapValue!48613)) b!1225071))

(assert (= (and b!1225074 ((_ is ValueCellFull!14862) mapDefault!48613)) b!1225087))

(assert (= start!101750 b!1225074))

(declare-fun b_lambda!22419 () Bool)

(assert (=> (not b_lambda!22419) (not b!1225072)))

(declare-fun t!40361 () Bool)

(declare-fun tb!11239 () Bool)

(assert (=> (and start!101750 (= defaultEntry!1004 defaultEntry!1004) t!40361) tb!11239))

(declare-fun result!23091 () Bool)

(assert (=> tb!11239 (= result!23091 tp_is_empty!31143)))

(assert (=> b!1225072 t!40361))

(declare-fun b_and!44141 () Bool)

(assert (= b_and!44139 (and (=> t!40361 result!23091) b_and!44141)))

(declare-fun m!1130127 () Bool)

(assert (=> mapNonEmpty!48613 m!1130127))

(declare-fun m!1130129 () Bool)

(assert (=> b!1225075 m!1130129))

(declare-fun m!1130131 () Bool)

(assert (=> b!1225090 m!1130131))

(declare-fun m!1130133 () Bool)

(assert (=> start!101750 m!1130133))

(declare-fun m!1130135 () Bool)

(assert (=> start!101750 m!1130135))

(declare-fun m!1130137 () Bool)

(assert (=> b!1225077 m!1130137))

(declare-fun m!1130139 () Bool)

(assert (=> b!1225079 m!1130139))

(declare-fun m!1130141 () Bool)

(assert (=> b!1225079 m!1130141))

(declare-fun m!1130143 () Bool)

(assert (=> b!1225083 m!1130143))

(declare-fun m!1130145 () Bool)

(assert (=> b!1225088 m!1130145))

(declare-fun m!1130147 () Bool)

(assert (=> b!1225082 m!1130147))

(declare-fun m!1130149 () Bool)

(assert (=> b!1225072 m!1130149))

(declare-fun m!1130151 () Bool)

(assert (=> b!1225072 m!1130151))

(declare-fun m!1130153 () Bool)

(assert (=> b!1225072 m!1130153))

(declare-fun m!1130155 () Bool)

(assert (=> b!1225072 m!1130155))

(declare-fun m!1130157 () Bool)

(assert (=> b!1225084 m!1130157))

(declare-fun m!1130159 () Bool)

(assert (=> b!1225084 m!1130159))

(assert (=> b!1225084 m!1130129))

(declare-fun m!1130161 () Bool)

(assert (=> b!1225084 m!1130161))

(assert (=> b!1225084 m!1130129))

(declare-fun m!1130163 () Bool)

(assert (=> b!1225084 m!1130163))

(declare-fun m!1130165 () Bool)

(assert (=> b!1225084 m!1130165))

(declare-fun m!1130167 () Bool)

(assert (=> b!1225089 m!1130167))

(declare-fun m!1130169 () Bool)

(assert (=> b!1225080 m!1130169))

(declare-fun m!1130171 () Bool)

(assert (=> b!1225080 m!1130171))

(declare-fun m!1130173 () Bool)

(assert (=> b!1225078 m!1130173))

(declare-fun m!1130175 () Bool)

(assert (=> b!1225085 m!1130175))

(assert (=> b!1225085 m!1130129))

(declare-fun m!1130177 () Bool)

(assert (=> b!1225085 m!1130177))

(assert (=> b!1225085 m!1130129))

(assert (=> b!1225085 m!1130175))

(declare-fun m!1130179 () Bool)

(assert (=> b!1225085 m!1130179))

(declare-fun m!1130181 () Bool)

(assert (=> b!1225085 m!1130181))

(declare-fun m!1130183 () Bool)

(assert (=> b!1225085 m!1130183))

(declare-fun m!1130185 () Bool)

(assert (=> b!1225085 m!1130185))

(declare-fun m!1130187 () Bool)

(assert (=> b!1225086 m!1130187))

(declare-fun m!1130189 () Bool)

(assert (=> b!1225086 m!1130189))

(declare-fun m!1130191 () Bool)

(assert (=> b!1225086 m!1130191))

(declare-fun m!1130193 () Bool)

(assert (=> b!1225086 m!1130193))

(declare-fun m!1130195 () Bool)

(assert (=> b!1225086 m!1130195))

(check-sat (not b!1225088) (not b!1225086) (not b!1225080) (not b!1225085) (not b!1225082) (not b_next!26439) (not b!1225077) b_and!44141 (not b!1225084) (not b_lambda!22419) tp_is_empty!31143 (not b!1225078) (not b!1225090) (not b!1225083) (not b!1225079) (not b!1225072) (not start!101750) (not mapNonEmpty!48613))
(check-sat b_and!44141 (not b_next!26439))
