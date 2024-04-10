; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99786 () Bool)

(assert start!99786)

(declare-fun b_free!25365 () Bool)

(declare-fun b_next!25365 () Bool)

(assert (=> start!99786 (= b_free!25365 (not b_next!25365))))

(declare-fun tp!88809 () Bool)

(declare-fun b_and!41597 () Bool)

(assert (=> start!99786 (= tp!88809 b_and!41597)))

(declare-fun b!1185601 () Bool)

(declare-fun e!674100 () Bool)

(declare-fun tp_is_empty!29895 () Bool)

(assert (=> b!1185601 (= e!674100 tp_is_empty!29895)))

(declare-fun b!1185602 () Bool)

(declare-datatypes ((Unit!39280 0))(
  ( (Unit!39281) )
))
(declare-fun e!674106 () Unit!39280)

(declare-fun Unit!39282 () Unit!39280)

(assert (=> b!1185602 (= e!674106 Unit!39282)))

(declare-fun b!1185603 () Bool)

(declare-fun e!674105 () Bool)

(declare-fun e!674107 () Bool)

(assert (=> b!1185603 (= e!674105 e!674107)))

(declare-fun res!788123 () Bool)

(assert (=> b!1185603 (=> res!788123 e!674107)))

(declare-datatypes ((array!76587 0))(
  ( (array!76588 (arr!36943 (Array (_ BitVec 32) (_ BitVec 64))) (size!37479 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76587)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1185603 (= res!788123 (not (= (select (arr!36943 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1185604 () Bool)

(declare-fun e!674108 () Bool)

(declare-fun e!674103 () Bool)

(assert (=> b!1185604 (= e!674108 (not e!674103))))

(declare-fun res!788118 () Bool)

(assert (=> b!1185604 (=> res!788118 e!674103)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1185604 (= res!788118 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185604 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!538171 () Unit!39280)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76587 (_ BitVec 64) (_ BitVec 32)) Unit!39280)

(assert (=> b!1185604 (= lt!538171 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185605 () Bool)

(declare-fun e!674102 () Bool)

(assert (=> b!1185605 (= e!674102 e!674108)))

(declare-fun res!788117 () Bool)

(assert (=> b!1185605 (=> (not res!788117) (not e!674108))))

(declare-fun lt!538159 () array!76587)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76587 (_ BitVec 32)) Bool)

(assert (=> b!1185605 (= res!788117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538159 mask!1564))))

(assert (=> b!1185605 (= lt!538159 (array!76588 (store (arr!36943 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37479 _keys!1208)))))

(declare-fun mapNonEmpty!46670 () Bool)

(declare-fun mapRes!46670 () Bool)

(declare-fun tp!88808 () Bool)

(declare-fun e!674101 () Bool)

(assert (=> mapNonEmpty!46670 (= mapRes!46670 (and tp!88808 e!674101))))

(declare-datatypes ((V!44987 0))(
  ( (V!44988 (val!15004 Int)) )
))
(declare-datatypes ((ValueCell!14238 0))(
  ( (ValueCellFull!14238 (v!17642 V!44987)) (EmptyCell!14238) )
))
(declare-fun mapValue!46670 () ValueCell!14238)

(declare-fun mapRest!46670 () (Array (_ BitVec 32) ValueCell!14238))

(declare-fun mapKey!46670 () (_ BitVec 32))

(declare-datatypes ((array!76589 0))(
  ( (array!76590 (arr!36944 (Array (_ BitVec 32) ValueCell!14238)) (size!37480 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76589)

(assert (=> mapNonEmpty!46670 (= (arr!36944 _values!996) (store mapRest!46670 mapKey!46670 mapValue!46670))))

(declare-fun b!1185606 () Bool)

(declare-fun res!788127 () Bool)

(assert (=> b!1185606 (=> (not res!788127) (not e!674102))))

(assert (=> b!1185606 (= res!788127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185607 () Bool)

(declare-fun res!788125 () Bool)

(assert (=> b!1185607 (=> (not res!788125) (not e!674102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185607 (= res!788125 (validMask!0 mask!1564))))

(declare-fun res!788121 () Bool)

(assert (=> start!99786 (=> (not res!788121) (not e!674102))))

(assert (=> start!99786 (= res!788121 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37479 _keys!1208))))))

(assert (=> start!99786 e!674102))

(assert (=> start!99786 tp_is_empty!29895))

(declare-fun array_inv!28194 (array!76587) Bool)

(assert (=> start!99786 (array_inv!28194 _keys!1208)))

(assert (=> start!99786 true))

(assert (=> start!99786 tp!88809))

(declare-fun e!674104 () Bool)

(declare-fun array_inv!28195 (array!76589) Bool)

(assert (=> start!99786 (and (array_inv!28195 _values!996) e!674104)))

(declare-fun b!1185608 () Bool)

(declare-fun res!788114 () Bool)

(assert (=> b!1185608 (=> (not res!788114) (not e!674108))))

(declare-datatypes ((List!25988 0))(
  ( (Nil!25985) (Cons!25984 (h!27193 (_ BitVec 64)) (t!38345 List!25988)) )
))
(declare-fun arrayNoDuplicates!0 (array!76587 (_ BitVec 32) List!25988) Bool)

(assert (=> b!1185608 (= res!788114 (arrayNoDuplicates!0 lt!538159 #b00000000000000000000000000000000 Nil!25985))))

(declare-fun b!1185609 () Bool)

(declare-fun res!788128 () Bool)

(assert (=> b!1185609 (=> (not res!788128) (not e!674102))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1185609 (= res!788128 (and (= (size!37480 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37479 _keys!1208) (size!37480 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185610 () Bool)

(declare-fun res!788124 () Bool)

(assert (=> b!1185610 (=> (not res!788124) (not e!674102))))

(assert (=> b!1185610 (= res!788124 (= (select (arr!36943 _keys!1208) i!673) k0!934))))

(declare-fun b!1185611 () Bool)

(assert (=> b!1185611 (= e!674104 (and e!674100 mapRes!46670))))

(declare-fun condMapEmpty!46670 () Bool)

(declare-fun mapDefault!46670 () ValueCell!14238)

(assert (=> b!1185611 (= condMapEmpty!46670 (= (arr!36944 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14238)) mapDefault!46670)))))

(declare-fun b!1185612 () Bool)

(assert (=> b!1185612 (= e!674107 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185613 () Bool)

(declare-fun res!788126 () Bool)

(assert (=> b!1185613 (=> (not res!788126) (not e!674102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185613 (= res!788126 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46670 () Bool)

(assert (=> mapIsEmpty!46670 mapRes!46670))

(declare-fun b!1185614 () Bool)

(assert (=> b!1185614 (= e!674101 tp_is_empty!29895)))

(declare-fun b!1185615 () Bool)

(declare-fun e!674110 () Bool)

(declare-fun e!674099 () Bool)

(assert (=> b!1185615 (= e!674110 e!674099)))

(declare-fun res!788116 () Bool)

(assert (=> b!1185615 (=> res!788116 e!674099)))

(assert (=> b!1185615 (= res!788116 (not (validKeyInArray!0 (select (arr!36943 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19248 0))(
  ( (tuple2!19249 (_1!9635 (_ BitVec 64)) (_2!9635 V!44987)) )
))
(declare-datatypes ((List!25989 0))(
  ( (Nil!25986) (Cons!25985 (h!27194 tuple2!19248) (t!38346 List!25989)) )
))
(declare-datatypes ((ListLongMap!17217 0))(
  ( (ListLongMap!17218 (toList!8624 List!25989)) )
))
(declare-fun lt!538164 () ListLongMap!17217)

(declare-fun lt!538160 () ListLongMap!17217)

(assert (=> b!1185615 (= lt!538164 lt!538160)))

(declare-fun lt!538166 () ListLongMap!17217)

(declare-fun -!1658 (ListLongMap!17217 (_ BitVec 64)) ListLongMap!17217)

(assert (=> b!1185615 (= lt!538160 (-!1658 lt!538166 k0!934))))

(declare-fun zeroValue!944 () V!44987)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44987)

(declare-fun lt!538158 () array!76589)

(declare-fun getCurrentListMapNoExtraKeys!5070 (array!76587 array!76589 (_ BitVec 32) (_ BitVec 32) V!44987 V!44987 (_ BitVec 32) Int) ListLongMap!17217)

(assert (=> b!1185615 (= lt!538164 (getCurrentListMapNoExtraKeys!5070 lt!538159 lt!538158 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185615 (= lt!538166 (getCurrentListMapNoExtraKeys!5070 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!538173 () Unit!39280)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!874 (array!76587 array!76589 (_ BitVec 32) (_ BitVec 32) V!44987 V!44987 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39280)

(assert (=> b!1185615 (= lt!538173 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!874 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185616 () Bool)

(declare-fun res!788122 () Bool)

(assert (=> b!1185616 (=> (not res!788122) (not e!674102))))

(assert (=> b!1185616 (= res!788122 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37479 _keys!1208))))))

(declare-fun b!1185617 () Bool)

(assert (=> b!1185617 (= e!674103 e!674110)))

(declare-fun res!788120 () Bool)

(assert (=> b!1185617 (=> res!788120 e!674110)))

(assert (=> b!1185617 (= res!788120 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!538156 () ListLongMap!17217)

(assert (=> b!1185617 (= lt!538156 (getCurrentListMapNoExtraKeys!5070 lt!538159 lt!538158 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!538168 () V!44987)

(assert (=> b!1185617 (= lt!538158 (array!76590 (store (arr!36944 _values!996) i!673 (ValueCellFull!14238 lt!538168)) (size!37480 _values!996)))))

(declare-fun dynLambda!3021 (Int (_ BitVec 64)) V!44987)

(assert (=> b!1185617 (= lt!538168 (dynLambda!3021 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!538161 () ListLongMap!17217)

(assert (=> b!1185617 (= lt!538161 (getCurrentListMapNoExtraKeys!5070 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185618 () Bool)

(declare-fun res!788115 () Bool)

(assert (=> b!1185618 (=> (not res!788115) (not e!674102))))

(assert (=> b!1185618 (= res!788115 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25985))))

(declare-fun b!1185619 () Bool)

(declare-fun Unit!39283 () Unit!39280)

(assert (=> b!1185619 (= e!674106 Unit!39283)))

(declare-fun lt!538170 () Unit!39280)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76587 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39280)

(assert (=> b!1185619 (= lt!538170 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185619 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538167 () Unit!39280)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76587 (_ BitVec 32) (_ BitVec 32)) Unit!39280)

(assert (=> b!1185619 (= lt!538167 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185619 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25985)))

(declare-fun lt!538157 () Unit!39280)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76587 (_ BitVec 64) (_ BitVec 32) List!25988) Unit!39280)

(assert (=> b!1185619 (= lt!538157 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25985))))

(assert (=> b!1185619 false))

(declare-fun b!1185620 () Bool)

(assert (=> b!1185620 (= e!674099 true)))

(declare-fun lt!538162 () ListLongMap!17217)

(declare-fun lt!538172 () ListLongMap!17217)

(assert (=> b!1185620 (= (-!1658 lt!538162 k0!934) lt!538172)))

(declare-fun lt!538155 () V!44987)

(declare-fun lt!538163 () Unit!39280)

(declare-fun addRemoveCommutativeForDiffKeys!183 (ListLongMap!17217 (_ BitVec 64) V!44987 (_ BitVec 64)) Unit!39280)

(assert (=> b!1185620 (= lt!538163 (addRemoveCommutativeForDiffKeys!183 lt!538166 (select (arr!36943 _keys!1208) from!1455) lt!538155 k0!934))))

(assert (=> b!1185620 (and (= lt!538161 lt!538162) (= lt!538160 lt!538164))))

(declare-fun lt!538165 () tuple2!19248)

(declare-fun +!3920 (ListLongMap!17217 tuple2!19248) ListLongMap!17217)

(assert (=> b!1185620 (= lt!538162 (+!3920 lt!538166 lt!538165))))

(assert (=> b!1185620 (not (= (select (arr!36943 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538169 () Unit!39280)

(assert (=> b!1185620 (= lt!538169 e!674106)))

(declare-fun c!117171 () Bool)

(assert (=> b!1185620 (= c!117171 (= (select (arr!36943 _keys!1208) from!1455) k0!934))))

(assert (=> b!1185620 e!674105))

(declare-fun res!788119 () Bool)

(assert (=> b!1185620 (=> (not res!788119) (not e!674105))))

(assert (=> b!1185620 (= res!788119 (= lt!538156 lt!538172))))

(assert (=> b!1185620 (= lt!538172 (+!3920 lt!538160 lt!538165))))

(assert (=> b!1185620 (= lt!538165 (tuple2!19249 (select (arr!36943 _keys!1208) from!1455) lt!538155))))

(declare-fun get!18915 (ValueCell!14238 V!44987) V!44987)

(assert (=> b!1185620 (= lt!538155 (get!18915 (select (arr!36944 _values!996) from!1455) lt!538168))))

(assert (= (and start!99786 res!788121) b!1185607))

(assert (= (and b!1185607 res!788125) b!1185609))

(assert (= (and b!1185609 res!788128) b!1185606))

(assert (= (and b!1185606 res!788127) b!1185618))

(assert (= (and b!1185618 res!788115) b!1185616))

(assert (= (and b!1185616 res!788122) b!1185613))

(assert (= (and b!1185613 res!788126) b!1185610))

(assert (= (and b!1185610 res!788124) b!1185605))

(assert (= (and b!1185605 res!788117) b!1185608))

(assert (= (and b!1185608 res!788114) b!1185604))

(assert (= (and b!1185604 (not res!788118)) b!1185617))

(assert (= (and b!1185617 (not res!788120)) b!1185615))

(assert (= (and b!1185615 (not res!788116)) b!1185620))

(assert (= (and b!1185620 res!788119) b!1185603))

(assert (= (and b!1185603 (not res!788123)) b!1185612))

(assert (= (and b!1185620 c!117171) b!1185619))

(assert (= (and b!1185620 (not c!117171)) b!1185602))

(assert (= (and b!1185611 condMapEmpty!46670) mapIsEmpty!46670))

(assert (= (and b!1185611 (not condMapEmpty!46670)) mapNonEmpty!46670))

(get-info :version)

(assert (= (and mapNonEmpty!46670 ((_ is ValueCellFull!14238) mapValue!46670)) b!1185614))

(assert (= (and b!1185611 ((_ is ValueCellFull!14238) mapDefault!46670)) b!1185601))

(assert (= start!99786 b!1185611))

(declare-fun b_lambda!20509 () Bool)

(assert (=> (not b_lambda!20509) (not b!1185617)))

(declare-fun t!38344 () Bool)

(declare-fun tb!10177 () Bool)

(assert (=> (and start!99786 (= defaultEntry!1004 defaultEntry!1004) t!38344) tb!10177))

(declare-fun result!20921 () Bool)

(assert (=> tb!10177 (= result!20921 tp_is_empty!29895)))

(assert (=> b!1185617 t!38344))

(declare-fun b_and!41599 () Bool)

(assert (= b_and!41597 (and (=> t!38344 result!20921) b_and!41599)))

(declare-fun m!1094035 () Bool)

(assert (=> b!1185605 m!1094035))

(declare-fun m!1094037 () Bool)

(assert (=> b!1185605 m!1094037))

(declare-fun m!1094039 () Bool)

(assert (=> start!99786 m!1094039))

(declare-fun m!1094041 () Bool)

(assert (=> start!99786 m!1094041))

(declare-fun m!1094043 () Bool)

(assert (=> b!1185619 m!1094043))

(declare-fun m!1094045 () Bool)

(assert (=> b!1185619 m!1094045))

(declare-fun m!1094047 () Bool)

(assert (=> b!1185619 m!1094047))

(declare-fun m!1094049 () Bool)

(assert (=> b!1185619 m!1094049))

(declare-fun m!1094051 () Bool)

(assert (=> b!1185619 m!1094051))

(declare-fun m!1094053 () Bool)

(assert (=> b!1185615 m!1094053))

(declare-fun m!1094055 () Bool)

(assert (=> b!1185615 m!1094055))

(declare-fun m!1094057 () Bool)

(assert (=> b!1185615 m!1094057))

(declare-fun m!1094059 () Bool)

(assert (=> b!1185615 m!1094059))

(declare-fun m!1094061 () Bool)

(assert (=> b!1185615 m!1094061))

(declare-fun m!1094063 () Bool)

(assert (=> b!1185615 m!1094063))

(assert (=> b!1185615 m!1094061))

(declare-fun m!1094065 () Bool)

(assert (=> b!1185620 m!1094065))

(declare-fun m!1094067 () Bool)

(assert (=> b!1185620 m!1094067))

(declare-fun m!1094069 () Bool)

(assert (=> b!1185620 m!1094069))

(assert (=> b!1185620 m!1094061))

(declare-fun m!1094071 () Bool)

(assert (=> b!1185620 m!1094071))

(declare-fun m!1094073 () Bool)

(assert (=> b!1185620 m!1094073))

(assert (=> b!1185620 m!1094065))

(declare-fun m!1094075 () Bool)

(assert (=> b!1185620 m!1094075))

(assert (=> b!1185620 m!1094061))

(declare-fun m!1094077 () Bool)

(assert (=> b!1185618 m!1094077))

(declare-fun m!1094079 () Bool)

(assert (=> mapNonEmpty!46670 m!1094079))

(declare-fun m!1094081 () Bool)

(assert (=> b!1185612 m!1094081))

(declare-fun m!1094083 () Bool)

(assert (=> b!1185613 m!1094083))

(declare-fun m!1094085 () Bool)

(assert (=> b!1185610 m!1094085))

(declare-fun m!1094087 () Bool)

(assert (=> b!1185608 m!1094087))

(declare-fun m!1094089 () Bool)

(assert (=> b!1185604 m!1094089))

(declare-fun m!1094091 () Bool)

(assert (=> b!1185604 m!1094091))

(declare-fun m!1094093 () Bool)

(assert (=> b!1185607 m!1094093))

(declare-fun m!1094095 () Bool)

(assert (=> b!1185606 m!1094095))

(declare-fun m!1094097 () Bool)

(assert (=> b!1185617 m!1094097))

(declare-fun m!1094099 () Bool)

(assert (=> b!1185617 m!1094099))

(declare-fun m!1094101 () Bool)

(assert (=> b!1185617 m!1094101))

(declare-fun m!1094103 () Bool)

(assert (=> b!1185617 m!1094103))

(assert (=> b!1185603 m!1094061))

(check-sat (not b!1185615) (not b_next!25365) (not start!99786) (not b!1185620) (not b!1185619) (not b_lambda!20509) (not b!1185606) (not b!1185604) (not b!1185608) (not b!1185613) (not b!1185607) (not b!1185618) (not b!1185617) b_and!41599 (not mapNonEmpty!46670) (not b!1185605) tp_is_empty!29895 (not b!1185612))
(check-sat b_and!41599 (not b_next!25365))
