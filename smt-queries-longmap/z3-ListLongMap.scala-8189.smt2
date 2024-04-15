; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99994 () Bool)

(assert start!99994)

(declare-fun b_free!25579 () Bool)

(declare-fun b_next!25579 () Bool)

(assert (=> start!99994 (= b_free!25579 (not b_next!25579))))

(declare-fun tp!89450 () Bool)

(declare-fun b_and!42003 () Bool)

(assert (=> start!99994 (= tp!89450 b_and!42003)))

(declare-fun b!1191156 () Bool)

(declare-fun res!792296 () Bool)

(declare-fun e!677112 () Bool)

(assert (=> b!1191156 (=> (not res!792296) (not e!677112))))

(declare-datatypes ((array!76938 0))(
  ( (array!76939 (arr!37119 (Array (_ BitVec 32) (_ BitVec 64))) (size!37657 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76938)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1191156 (= res!792296 (= (select (arr!37119 _keys!1208) i!673) k0!934))))

(declare-fun b!1191157 () Bool)

(declare-fun e!677110 () Bool)

(declare-fun e!677113 () Bool)

(declare-fun mapRes!46991 () Bool)

(assert (=> b!1191157 (= e!677110 (and e!677113 mapRes!46991))))

(declare-fun condMapEmpty!46991 () Bool)

(declare-datatypes ((V!45273 0))(
  ( (V!45274 (val!15111 Int)) )
))
(declare-datatypes ((ValueCell!14345 0))(
  ( (ValueCellFull!14345 (v!17748 V!45273)) (EmptyCell!14345) )
))
(declare-datatypes ((array!76940 0))(
  ( (array!76941 (arr!37120 (Array (_ BitVec 32) ValueCell!14345)) (size!37658 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76940)

(declare-fun mapDefault!46991 () ValueCell!14345)

(assert (=> b!1191157 (= condMapEmpty!46991 (= (arr!37120 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14345)) mapDefault!46991)))))

(declare-fun b!1191158 () Bool)

(declare-fun res!792298 () Bool)

(assert (=> b!1191158 (=> (not res!792298) (not e!677112))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1191158 (= res!792298 (and (= (size!37658 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37657 _keys!1208) (size!37658 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191159 () Bool)

(declare-fun tp_is_empty!30109 () Bool)

(assert (=> b!1191159 (= e!677113 tp_is_empty!30109)))

(declare-fun mapNonEmpty!46991 () Bool)

(declare-fun tp!89451 () Bool)

(declare-fun e!677109 () Bool)

(assert (=> mapNonEmpty!46991 (= mapRes!46991 (and tp!89451 e!677109))))

(declare-fun mapRest!46991 () (Array (_ BitVec 32) ValueCell!14345))

(declare-fun mapKey!46991 () (_ BitVec 32))

(declare-fun mapValue!46991 () ValueCell!14345)

(assert (=> mapNonEmpty!46991 (= (arr!37120 _values!996) (store mapRest!46991 mapKey!46991 mapValue!46991))))

(declare-fun b!1191160 () Bool)

(declare-fun e!677114 () Bool)

(assert (=> b!1191160 (= e!677112 e!677114)))

(declare-fun res!792294 () Bool)

(assert (=> b!1191160 (=> (not res!792294) (not e!677114))))

(declare-fun lt!541582 () array!76938)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76938 (_ BitVec 32)) Bool)

(assert (=> b!1191160 (= res!792294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541582 mask!1564))))

(assert (=> b!1191160 (= lt!541582 (array!76939 (store (arr!37119 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37657 _keys!1208)))))

(declare-fun mapIsEmpty!46991 () Bool)

(assert (=> mapIsEmpty!46991 mapRes!46991))

(declare-fun b!1191161 () Bool)

(declare-fun res!792301 () Bool)

(assert (=> b!1191161 (=> (not res!792301) (not e!677112))))

(declare-datatypes ((List!26243 0))(
  ( (Nil!26240) (Cons!26239 (h!27448 (_ BitVec 64)) (t!38805 List!26243)) )
))
(declare-fun arrayNoDuplicates!0 (array!76938 (_ BitVec 32) List!26243) Bool)

(assert (=> b!1191161 (= res!792301 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26240))))

(declare-fun b!1191162 () Bool)

(declare-fun res!792297 () Bool)

(assert (=> b!1191162 (=> (not res!792297) (not e!677112))))

(assert (=> b!1191162 (= res!792297 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37657 _keys!1208))))))

(declare-fun b!1191164 () Bool)

(declare-fun res!792292 () Bool)

(assert (=> b!1191164 (=> (not res!792292) (not e!677112))))

(assert (=> b!1191164 (= res!792292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191165 () Bool)

(declare-fun e!677116 () Bool)

(assert (=> b!1191165 (= e!677116 true)))

(declare-fun zeroValue!944 () V!45273)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45273)

(declare-fun lt!541581 () array!76940)

(declare-datatypes ((tuple2!19532 0))(
  ( (tuple2!19533 (_1!9777 (_ BitVec 64)) (_2!9777 V!45273)) )
))
(declare-datatypes ((List!26244 0))(
  ( (Nil!26241) (Cons!26240 (h!27449 tuple2!19532) (t!38806 List!26244)) )
))
(declare-datatypes ((ListLongMap!17501 0))(
  ( (ListLongMap!17502 (toList!8766 List!26244)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5216 (array!76938 array!76940 (_ BitVec 32) (_ BitVec 32) V!45273 V!45273 (_ BitVec 32) Int) ListLongMap!17501)

(declare-fun -!1709 (ListLongMap!17501 (_ BitVec 64)) ListLongMap!17501)

(assert (=> b!1191165 (= (getCurrentListMapNoExtraKeys!5216 lt!541582 lt!541581 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1709 (getCurrentListMapNoExtraKeys!5216 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39393 0))(
  ( (Unit!39394) )
))
(declare-fun lt!541579 () Unit!39393)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!959 (array!76938 array!76940 (_ BitVec 32) (_ BitVec 32) V!45273 V!45273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39393)

(assert (=> b!1191165 (= lt!541579 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!959 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191166 () Bool)

(declare-fun res!792293 () Bool)

(assert (=> b!1191166 (=> (not res!792293) (not e!677112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191166 (= res!792293 (validKeyInArray!0 k0!934))))

(declare-fun b!1191167 () Bool)

(declare-fun e!677115 () Bool)

(assert (=> b!1191167 (= e!677114 (not e!677115))))

(declare-fun res!792300 () Bool)

(assert (=> b!1191167 (=> res!792300 e!677115)))

(assert (=> b!1191167 (= res!792300 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191167 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541583 () Unit!39393)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76938 (_ BitVec 64) (_ BitVec 32)) Unit!39393)

(assert (=> b!1191167 (= lt!541583 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191168 () Bool)

(declare-fun res!792291 () Bool)

(assert (=> b!1191168 (=> (not res!792291) (not e!677112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191168 (= res!792291 (validMask!0 mask!1564))))

(declare-fun b!1191169 () Bool)

(assert (=> b!1191169 (= e!677109 tp_is_empty!30109)))

(declare-fun b!1191170 () Bool)

(assert (=> b!1191170 (= e!677115 e!677116)))

(declare-fun res!792290 () Bool)

(assert (=> b!1191170 (=> res!792290 e!677116)))

(assert (=> b!1191170 (= res!792290 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541580 () ListLongMap!17501)

(assert (=> b!1191170 (= lt!541580 (getCurrentListMapNoExtraKeys!5216 lt!541582 lt!541581 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3105 (Int (_ BitVec 64)) V!45273)

(assert (=> b!1191170 (= lt!541581 (array!76941 (store (arr!37120 _values!996) i!673 (ValueCellFull!14345 (dynLambda!3105 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37658 _values!996)))))

(declare-fun lt!541584 () ListLongMap!17501)

(assert (=> b!1191170 (= lt!541584 (getCurrentListMapNoExtraKeys!5216 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!792295 () Bool)

(assert (=> start!99994 (=> (not res!792295) (not e!677112))))

(assert (=> start!99994 (= res!792295 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37657 _keys!1208))))))

(assert (=> start!99994 e!677112))

(assert (=> start!99994 tp_is_empty!30109))

(declare-fun array_inv!28430 (array!76938) Bool)

(assert (=> start!99994 (array_inv!28430 _keys!1208)))

(assert (=> start!99994 true))

(assert (=> start!99994 tp!89450))

(declare-fun array_inv!28431 (array!76940) Bool)

(assert (=> start!99994 (and (array_inv!28431 _values!996) e!677110)))

(declare-fun b!1191163 () Bool)

(declare-fun res!792299 () Bool)

(assert (=> b!1191163 (=> (not res!792299) (not e!677114))))

(assert (=> b!1191163 (= res!792299 (arrayNoDuplicates!0 lt!541582 #b00000000000000000000000000000000 Nil!26240))))

(assert (= (and start!99994 res!792295) b!1191168))

(assert (= (and b!1191168 res!792291) b!1191158))

(assert (= (and b!1191158 res!792298) b!1191164))

(assert (= (and b!1191164 res!792292) b!1191161))

(assert (= (and b!1191161 res!792301) b!1191162))

(assert (= (and b!1191162 res!792297) b!1191166))

(assert (= (and b!1191166 res!792293) b!1191156))

(assert (= (and b!1191156 res!792296) b!1191160))

(assert (= (and b!1191160 res!792294) b!1191163))

(assert (= (and b!1191163 res!792299) b!1191167))

(assert (= (and b!1191167 (not res!792300)) b!1191170))

(assert (= (and b!1191170 (not res!792290)) b!1191165))

(assert (= (and b!1191157 condMapEmpty!46991) mapIsEmpty!46991))

(assert (= (and b!1191157 (not condMapEmpty!46991)) mapNonEmpty!46991))

(get-info :version)

(assert (= (and mapNonEmpty!46991 ((_ is ValueCellFull!14345) mapValue!46991)) b!1191169))

(assert (= (and b!1191157 ((_ is ValueCellFull!14345) mapDefault!46991)) b!1191159))

(assert (= start!99994 b!1191157))

(declare-fun b_lambda!20705 () Bool)

(assert (=> (not b_lambda!20705) (not b!1191170)))

(declare-fun t!38804 () Bool)

(declare-fun tb!10383 () Bool)

(assert (=> (and start!99994 (= defaultEntry!1004 defaultEntry!1004) t!38804) tb!10383))

(declare-fun result!21341 () Bool)

(assert (=> tb!10383 (= result!21341 tp_is_empty!30109)))

(assert (=> b!1191170 t!38804))

(declare-fun b_and!42005 () Bool)

(assert (= b_and!42003 (and (=> t!38804 result!21341) b_and!42005)))

(declare-fun m!1099151 () Bool)

(assert (=> b!1191170 m!1099151))

(declare-fun m!1099153 () Bool)

(assert (=> b!1191170 m!1099153))

(declare-fun m!1099155 () Bool)

(assert (=> b!1191170 m!1099155))

(declare-fun m!1099157 () Bool)

(assert (=> b!1191170 m!1099157))

(declare-fun m!1099159 () Bool)

(assert (=> b!1191165 m!1099159))

(declare-fun m!1099161 () Bool)

(assert (=> b!1191165 m!1099161))

(assert (=> b!1191165 m!1099161))

(declare-fun m!1099163 () Bool)

(assert (=> b!1191165 m!1099163))

(declare-fun m!1099165 () Bool)

(assert (=> b!1191165 m!1099165))

(declare-fun m!1099167 () Bool)

(assert (=> b!1191168 m!1099167))

(declare-fun m!1099169 () Bool)

(assert (=> b!1191167 m!1099169))

(declare-fun m!1099171 () Bool)

(assert (=> b!1191167 m!1099171))

(declare-fun m!1099173 () Bool)

(assert (=> b!1191163 m!1099173))

(declare-fun m!1099175 () Bool)

(assert (=> b!1191161 m!1099175))

(declare-fun m!1099177 () Bool)

(assert (=> b!1191160 m!1099177))

(declare-fun m!1099179 () Bool)

(assert (=> b!1191160 m!1099179))

(declare-fun m!1099181 () Bool)

(assert (=> mapNonEmpty!46991 m!1099181))

(declare-fun m!1099183 () Bool)

(assert (=> b!1191164 m!1099183))

(declare-fun m!1099185 () Bool)

(assert (=> b!1191166 m!1099185))

(declare-fun m!1099187 () Bool)

(assert (=> b!1191156 m!1099187))

(declare-fun m!1099189 () Bool)

(assert (=> start!99994 m!1099189))

(declare-fun m!1099191 () Bool)

(assert (=> start!99994 m!1099191))

(check-sat (not b!1191161) (not b!1191165) (not b!1191160) (not start!99994) b_and!42005 (not b_lambda!20705) (not b!1191166) (not b!1191168) (not b!1191167) (not mapNonEmpty!46991) tp_is_empty!30109 (not b!1191163) (not b_next!25579) (not b!1191164) (not b!1191170))
(check-sat b_and!42005 (not b_next!25579))
