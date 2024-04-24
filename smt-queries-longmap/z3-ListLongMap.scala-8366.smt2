; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102014 () Bool)

(assert start!102014)

(declare-fun b_free!26467 () Bool)

(declare-fun b_next!26467 () Bool)

(assert (=> start!102014 (= b_free!26467 (not b_next!26467))))

(declare-fun tp!92446 () Bool)

(declare-fun b_and!44197 () Bool)

(assert (=> start!102014 (= tp!92446 b_and!44197)))

(declare-fun b!1227135 () Bool)

(declare-fun e!697054 () Bool)

(declare-fun tp_is_empty!31171 () Bool)

(assert (=> b!1227135 (= e!697054 tp_is_empty!31171)))

(declare-fun b!1227136 () Bool)

(declare-fun e!697055 () Bool)

(declare-fun e!697058 () Bool)

(assert (=> b!1227136 (= e!697055 (not e!697058))))

(declare-fun res!815183 () Bool)

(assert (=> b!1227136 (=> res!815183 e!697058)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1227136 (= res!815183 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!79161 0))(
  ( (array!79162 (arr!38201 (Array (_ BitVec 32) (_ BitVec 64))) (size!38738 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79161)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227136 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40605 0))(
  ( (Unit!40606) )
))
(declare-fun lt!559081 () Unit!40605)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79161 (_ BitVec 64) (_ BitVec 32)) Unit!40605)

(assert (=> b!1227136 (= lt!559081 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1227137 () Bool)

(declare-fun e!697060 () Bool)

(assert (=> b!1227137 (= e!697058 e!697060)))

(declare-fun res!815184 () Bool)

(assert (=> b!1227137 (=> res!815184 e!697060)))

(assert (=> b!1227137 (= res!815184 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46689 0))(
  ( (V!46690 (val!15642 Int)) )
))
(declare-fun zeroValue!944 () V!46689)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14876 0))(
  ( (ValueCellFull!14876 (v!18300 V!46689)) (EmptyCell!14876) )
))
(declare-datatypes ((array!79163 0))(
  ( (array!79164 (arr!38202 (Array (_ BitVec 32) ValueCell!14876)) (size!38739 (_ BitVec 32))) )
))
(declare-fun lt!559078 () array!79163)

(declare-datatypes ((tuple2!20182 0))(
  ( (tuple2!20183 (_1!10102 (_ BitVec 64)) (_2!10102 V!46689)) )
))
(declare-datatypes ((List!26993 0))(
  ( (Nil!26990) (Cons!26989 (h!28207 tuple2!20182) (t!40432 List!26993)) )
))
(declare-datatypes ((ListLongMap!18159 0))(
  ( (ListLongMap!18160 (toList!9095 List!26993)) )
))
(declare-fun lt!559079 () ListLongMap!18159)

(declare-fun lt!559077 () array!79161)

(declare-fun minValue!944 () V!46689)

(declare-fun getCurrentListMapNoExtraKeys!5542 (array!79161 array!79163 (_ BitVec 32) (_ BitVec 32) V!46689 V!46689 (_ BitVec 32) Int) ListLongMap!18159)

(assert (=> b!1227137 (= lt!559079 (getCurrentListMapNoExtraKeys!5542 lt!559077 lt!559078 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!79163)

(declare-fun dynLambda!3436 (Int (_ BitVec 64)) V!46689)

(assert (=> b!1227137 (= lt!559078 (array!79164 (store (arr!38202 _values!996) i!673 (ValueCellFull!14876 (dynLambda!3436 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38739 _values!996)))))

(declare-fun lt!559082 () ListLongMap!18159)

(assert (=> b!1227137 (= lt!559082 (getCurrentListMapNoExtraKeys!5542 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1227138 () Bool)

(declare-fun e!697056 () Bool)

(assert (=> b!1227138 (= e!697056 e!697055)))

(declare-fun res!815182 () Bool)

(assert (=> b!1227138 (=> (not res!815182) (not e!697055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79161 (_ BitVec 32)) Bool)

(assert (=> b!1227138 (= res!815182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!559077 mask!1564))))

(assert (=> b!1227138 (= lt!559077 (array!79162 (store (arr!38201 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38738 _keys!1208)))))

(declare-fun b!1227139 () Bool)

(assert (=> b!1227139 (= e!697060 true)))

(declare-fun -!1964 (ListLongMap!18159 (_ BitVec 64)) ListLongMap!18159)

(assert (=> b!1227139 (= (getCurrentListMapNoExtraKeys!5542 lt!559077 lt!559078 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1964 (getCurrentListMapNoExtraKeys!5542 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!559080 () Unit!40605)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1179 (array!79161 array!79163 (_ BitVec 32) (_ BitVec 32) V!46689 V!46689 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40605)

(assert (=> b!1227139 (= lt!559080 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1179 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!815176 () Bool)

(assert (=> start!102014 (=> (not res!815176) (not e!697056))))

(assert (=> start!102014 (= res!815176 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38738 _keys!1208))))))

(assert (=> start!102014 e!697056))

(assert (=> start!102014 tp_is_empty!31171))

(declare-fun array_inv!29146 (array!79161) Bool)

(assert (=> start!102014 (array_inv!29146 _keys!1208)))

(assert (=> start!102014 true))

(assert (=> start!102014 tp!92446))

(declare-fun e!697053 () Bool)

(declare-fun array_inv!29147 (array!79163) Bool)

(assert (=> start!102014 (and (array_inv!29147 _values!996) e!697053)))

(declare-fun b!1227140 () Bool)

(declare-fun res!815180 () Bool)

(assert (=> b!1227140 (=> (not res!815180) (not e!697056))))

(assert (=> b!1227140 (= res!815180 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38738 _keys!1208))))))

(declare-fun b!1227141 () Bool)

(declare-fun e!697057 () Bool)

(assert (=> b!1227141 (= e!697057 tp_is_empty!31171)))

(declare-fun b!1227142 () Bool)

(declare-fun res!815173 () Bool)

(assert (=> b!1227142 (=> (not res!815173) (not e!697055))))

(declare-datatypes ((List!26994 0))(
  ( (Nil!26991) (Cons!26990 (h!28208 (_ BitVec 64)) (t!40433 List!26994)) )
))
(declare-fun arrayNoDuplicates!0 (array!79161 (_ BitVec 32) List!26994) Bool)

(assert (=> b!1227142 (= res!815173 (arrayNoDuplicates!0 lt!559077 #b00000000000000000000000000000000 Nil!26991))))

(declare-fun mapIsEmpty!48655 () Bool)

(declare-fun mapRes!48655 () Bool)

(assert (=> mapIsEmpty!48655 mapRes!48655))

(declare-fun b!1227143 () Bool)

(assert (=> b!1227143 (= e!697053 (and e!697057 mapRes!48655))))

(declare-fun condMapEmpty!48655 () Bool)

(declare-fun mapDefault!48655 () ValueCell!14876)

(assert (=> b!1227143 (= condMapEmpty!48655 (= (arr!38202 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14876)) mapDefault!48655)))))

(declare-fun b!1227144 () Bool)

(declare-fun res!815177 () Bool)

(assert (=> b!1227144 (=> (not res!815177) (not e!697056))))

(assert (=> b!1227144 (= res!815177 (and (= (size!38739 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38738 _keys!1208) (size!38739 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1227145 () Bool)

(declare-fun res!815175 () Bool)

(assert (=> b!1227145 (=> (not res!815175) (not e!697056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227145 (= res!815175 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!48655 () Bool)

(declare-fun tp!92447 () Bool)

(assert (=> mapNonEmpty!48655 (= mapRes!48655 (and tp!92447 e!697054))))

(declare-fun mapRest!48655 () (Array (_ BitVec 32) ValueCell!14876))

(declare-fun mapValue!48655 () ValueCell!14876)

(declare-fun mapKey!48655 () (_ BitVec 32))

(assert (=> mapNonEmpty!48655 (= (arr!38202 _values!996) (store mapRest!48655 mapKey!48655 mapValue!48655))))

(declare-fun b!1227146 () Bool)

(declare-fun res!815179 () Bool)

(assert (=> b!1227146 (=> (not res!815179) (not e!697056))))

(assert (=> b!1227146 (= res!815179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1227147 () Bool)

(declare-fun res!815178 () Bool)

(assert (=> b!1227147 (=> (not res!815178) (not e!697056))))

(assert (=> b!1227147 (= res!815178 (= (select (arr!38201 _keys!1208) i!673) k0!934))))

(declare-fun b!1227148 () Bool)

(declare-fun res!815174 () Bool)

(assert (=> b!1227148 (=> (not res!815174) (not e!697056))))

(assert (=> b!1227148 (= res!815174 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26991))))

(declare-fun b!1227149 () Bool)

(declare-fun res!815181 () Bool)

(assert (=> b!1227149 (=> (not res!815181) (not e!697056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1227149 (= res!815181 (validMask!0 mask!1564))))

(assert (= (and start!102014 res!815176) b!1227149))

(assert (= (and b!1227149 res!815181) b!1227144))

(assert (= (and b!1227144 res!815177) b!1227146))

(assert (= (and b!1227146 res!815179) b!1227148))

(assert (= (and b!1227148 res!815174) b!1227140))

(assert (= (and b!1227140 res!815180) b!1227145))

(assert (= (and b!1227145 res!815175) b!1227147))

(assert (= (and b!1227147 res!815178) b!1227138))

(assert (= (and b!1227138 res!815182) b!1227142))

(assert (= (and b!1227142 res!815173) b!1227136))

(assert (= (and b!1227136 (not res!815183)) b!1227137))

(assert (= (and b!1227137 (not res!815184)) b!1227139))

(assert (= (and b!1227143 condMapEmpty!48655) mapIsEmpty!48655))

(assert (= (and b!1227143 (not condMapEmpty!48655)) mapNonEmpty!48655))

(get-info :version)

(assert (= (and mapNonEmpty!48655 ((_ is ValueCellFull!14876) mapValue!48655)) b!1227135))

(assert (= (and b!1227143 ((_ is ValueCellFull!14876) mapDefault!48655)) b!1227141))

(assert (= start!102014 b!1227143))

(declare-fun b_lambda!22441 () Bool)

(assert (=> (not b_lambda!22441) (not b!1227137)))

(declare-fun t!40431 () Bool)

(declare-fun tb!11259 () Bool)

(assert (=> (and start!102014 (= defaultEntry!1004 defaultEntry!1004) t!40431) tb!11259))

(declare-fun result!23139 () Bool)

(assert (=> tb!11259 (= result!23139 tp_is_empty!31171)))

(assert (=> b!1227137 t!40431))

(declare-fun b_and!44199 () Bool)

(assert (= b_and!44197 (and (=> t!40431 result!23139) b_and!44199)))

(declare-fun m!1132547 () Bool)

(assert (=> b!1227149 m!1132547))

(declare-fun m!1132549 () Bool)

(assert (=> start!102014 m!1132549))

(declare-fun m!1132551 () Bool)

(assert (=> start!102014 m!1132551))

(declare-fun m!1132553 () Bool)

(assert (=> mapNonEmpty!48655 m!1132553))

(declare-fun m!1132555 () Bool)

(assert (=> b!1227145 m!1132555))

(declare-fun m!1132557 () Bool)

(assert (=> b!1227136 m!1132557))

(declare-fun m!1132559 () Bool)

(assert (=> b!1227136 m!1132559))

(declare-fun m!1132561 () Bool)

(assert (=> b!1227139 m!1132561))

(declare-fun m!1132563 () Bool)

(assert (=> b!1227139 m!1132563))

(assert (=> b!1227139 m!1132563))

(declare-fun m!1132565 () Bool)

(assert (=> b!1227139 m!1132565))

(declare-fun m!1132567 () Bool)

(assert (=> b!1227139 m!1132567))

(declare-fun m!1132569 () Bool)

(assert (=> b!1227146 m!1132569))

(declare-fun m!1132571 () Bool)

(assert (=> b!1227148 m!1132571))

(declare-fun m!1132573 () Bool)

(assert (=> b!1227142 m!1132573))

(declare-fun m!1132575 () Bool)

(assert (=> b!1227147 m!1132575))

(declare-fun m!1132577 () Bool)

(assert (=> b!1227137 m!1132577))

(declare-fun m!1132579 () Bool)

(assert (=> b!1227137 m!1132579))

(declare-fun m!1132581 () Bool)

(assert (=> b!1227137 m!1132581))

(declare-fun m!1132583 () Bool)

(assert (=> b!1227137 m!1132583))

(declare-fun m!1132585 () Bool)

(assert (=> b!1227138 m!1132585))

(declare-fun m!1132587 () Bool)

(assert (=> b!1227138 m!1132587))

(check-sat (not mapNonEmpty!48655) (not b!1227138) (not b_next!26467) (not b!1227146) (not start!102014) (not b!1227148) (not b!1227137) (not b!1227145) (not b!1227136) tp_is_empty!31171 (not b!1227149) b_and!44199 (not b_lambda!22441) (not b!1227142) (not b!1227139))
(check-sat b_and!44199 (not b_next!26467))
