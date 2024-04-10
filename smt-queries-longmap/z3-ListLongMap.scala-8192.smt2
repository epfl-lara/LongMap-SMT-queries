; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100020 () Bool)

(assert start!100020)

(declare-fun b_free!25599 () Bool)

(declare-fun b_next!25599 () Bool)

(assert (=> start!100020 (= b_free!25599 (not b_next!25599))))

(declare-fun tp!89511 () Bool)

(declare-fun b_and!42065 () Bool)

(assert (=> start!100020 (= tp!89511 b_and!42065)))

(declare-fun b!1191750 () Bool)

(declare-fun e!677427 () Bool)

(assert (=> b!1191750 (= e!677427 true)))

(declare-datatypes ((V!45299 0))(
  ( (V!45300 (val!15121 Int)) )
))
(declare-fun zeroValue!944 () V!45299)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14355 0))(
  ( (ValueCellFull!14355 (v!17759 V!45299)) (EmptyCell!14355) )
))
(declare-datatypes ((array!77049 0))(
  ( (array!77050 (arr!37174 (Array (_ BitVec 32) ValueCell!14355)) (size!37710 (_ BitVec 32))) )
))
(declare-fun lt!541954 () array!77049)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _values!996 () array!77049)

(declare-fun minValue!944 () V!45299)

(declare-datatypes ((array!77051 0))(
  ( (array!77052 (arr!37175 (Array (_ BitVec 32) (_ BitVec 64))) (size!37711 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77051)

(declare-fun lt!541956 () array!77051)

(declare-datatypes ((tuple2!19436 0))(
  ( (tuple2!19437 (_1!9729 (_ BitVec 64)) (_2!9729 V!45299)) )
))
(declare-datatypes ((List!26179 0))(
  ( (Nil!26176) (Cons!26175 (h!27384 tuple2!19436) (t!38770 List!26179)) )
))
(declare-datatypes ((ListLongMap!17405 0))(
  ( (ListLongMap!17406 (toList!8718 List!26179)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5159 (array!77051 array!77049 (_ BitVec 32) (_ BitVec 32) V!45299 V!45299 (_ BitVec 32) Int) ListLongMap!17405)

(declare-fun -!1743 (ListLongMap!17405 (_ BitVec 64)) ListLongMap!17405)

(assert (=> b!1191750 (= (getCurrentListMapNoExtraKeys!5159 lt!541956 lt!541954 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1743 (getCurrentListMapNoExtraKeys!5159 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39534 0))(
  ( (Unit!39535) )
))
(declare-fun lt!541955 () Unit!39534)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!952 (array!77051 array!77049 (_ BitVec 32) (_ BitVec 32) V!45299 V!45299 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39534)

(assert (=> b!1191750 (= lt!541955 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!952 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191751 () Bool)

(declare-fun e!677433 () Bool)

(declare-fun e!677428 () Bool)

(declare-fun mapRes!47021 () Bool)

(assert (=> b!1191751 (= e!677433 (and e!677428 mapRes!47021))))

(declare-fun condMapEmpty!47021 () Bool)

(declare-fun mapDefault!47021 () ValueCell!14355)

(assert (=> b!1191751 (= condMapEmpty!47021 (= (arr!37174 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14355)) mapDefault!47021)))))

(declare-fun b!1191752 () Bool)

(declare-fun res!792724 () Bool)

(declare-fun e!677429 () Bool)

(assert (=> b!1191752 (=> (not res!792724) (not e!677429))))

(declare-datatypes ((List!26180 0))(
  ( (Nil!26177) (Cons!26176 (h!27385 (_ BitVec 64)) (t!38771 List!26180)) )
))
(declare-fun arrayNoDuplicates!0 (array!77051 (_ BitVec 32) List!26180) Bool)

(assert (=> b!1191752 (= res!792724 (arrayNoDuplicates!0 lt!541956 #b00000000000000000000000000000000 Nil!26177))))

(declare-fun b!1191753 () Bool)

(declare-fun e!677432 () Bool)

(assert (=> b!1191753 (= e!677432 e!677429)))

(declare-fun res!792717 () Bool)

(assert (=> b!1191753 (=> (not res!792717) (not e!677429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77051 (_ BitVec 32)) Bool)

(assert (=> b!1191753 (= res!792717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541956 mask!1564))))

(assert (=> b!1191753 (= lt!541956 (array!77052 (store (arr!37175 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37711 _keys!1208)))))

(declare-fun mapNonEmpty!47021 () Bool)

(declare-fun tp!89510 () Bool)

(declare-fun e!677434 () Bool)

(assert (=> mapNonEmpty!47021 (= mapRes!47021 (and tp!89510 e!677434))))

(declare-fun mapValue!47021 () ValueCell!14355)

(declare-fun mapKey!47021 () (_ BitVec 32))

(declare-fun mapRest!47021 () (Array (_ BitVec 32) ValueCell!14355))

(assert (=> mapNonEmpty!47021 (= (arr!37174 _values!996) (store mapRest!47021 mapKey!47021 mapValue!47021))))

(declare-fun b!1191754 () Bool)

(declare-fun res!792726 () Bool)

(assert (=> b!1191754 (=> (not res!792726) (not e!677432))))

(assert (=> b!1191754 (= res!792726 (= (select (arr!37175 _keys!1208) i!673) k0!934))))

(declare-fun b!1191755 () Bool)

(declare-fun tp_is_empty!30129 () Bool)

(assert (=> b!1191755 (= e!677434 tp_is_empty!30129)))

(declare-fun b!1191756 () Bool)

(declare-fun res!792725 () Bool)

(assert (=> b!1191756 (=> (not res!792725) (not e!677432))))

(assert (=> b!1191756 (= res!792725 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26177))))

(declare-fun b!1191757 () Bool)

(declare-fun e!677430 () Bool)

(assert (=> b!1191757 (= e!677430 e!677427)))

(declare-fun res!792727 () Bool)

(assert (=> b!1191757 (=> res!792727 e!677427)))

(assert (=> b!1191757 (= res!792727 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541952 () ListLongMap!17405)

(assert (=> b!1191757 (= lt!541952 (getCurrentListMapNoExtraKeys!5159 lt!541956 lt!541954 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3092 (Int (_ BitVec 64)) V!45299)

(assert (=> b!1191757 (= lt!541954 (array!77050 (store (arr!37174 _values!996) i!673 (ValueCellFull!14355 (dynLambda!3092 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37710 _values!996)))))

(declare-fun lt!541953 () ListLongMap!17405)

(assert (=> b!1191757 (= lt!541953 (getCurrentListMapNoExtraKeys!5159 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191758 () Bool)

(declare-fun res!792723 () Bool)

(assert (=> b!1191758 (=> (not res!792723) (not e!677432))))

(assert (=> b!1191758 (= res!792723 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37711 _keys!1208))))))

(declare-fun b!1191759 () Bool)

(declare-fun res!792718 () Bool)

(assert (=> b!1191759 (=> (not res!792718) (not e!677432))))

(assert (=> b!1191759 (= res!792718 (and (= (size!37710 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37711 _keys!1208) (size!37710 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!792722 () Bool)

(assert (=> start!100020 (=> (not res!792722) (not e!677432))))

(assert (=> start!100020 (= res!792722 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37711 _keys!1208))))))

(assert (=> start!100020 e!677432))

(assert (=> start!100020 tp_is_empty!30129))

(declare-fun array_inv!28348 (array!77051) Bool)

(assert (=> start!100020 (array_inv!28348 _keys!1208)))

(assert (=> start!100020 true))

(assert (=> start!100020 tp!89511))

(declare-fun array_inv!28349 (array!77049) Bool)

(assert (=> start!100020 (and (array_inv!28349 _values!996) e!677433)))

(declare-fun b!1191760 () Bool)

(declare-fun res!792721 () Bool)

(assert (=> b!1191760 (=> (not res!792721) (not e!677432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191760 (= res!792721 (validMask!0 mask!1564))))

(declare-fun b!1191761 () Bool)

(declare-fun res!792719 () Bool)

(assert (=> b!1191761 (=> (not res!792719) (not e!677432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191761 (= res!792719 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47021 () Bool)

(assert (=> mapIsEmpty!47021 mapRes!47021))

(declare-fun b!1191762 () Bool)

(assert (=> b!1191762 (= e!677428 tp_is_empty!30129)))

(declare-fun b!1191763 () Bool)

(declare-fun res!792720 () Bool)

(assert (=> b!1191763 (=> (not res!792720) (not e!677432))))

(assert (=> b!1191763 (= res!792720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191764 () Bool)

(assert (=> b!1191764 (= e!677429 (not e!677430))))

(declare-fun res!792716 () Bool)

(assert (=> b!1191764 (=> res!792716 e!677430)))

(assert (=> b!1191764 (= res!792716 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191764 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541951 () Unit!39534)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77051 (_ BitVec 64) (_ BitVec 32)) Unit!39534)

(assert (=> b!1191764 (= lt!541951 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100020 res!792722) b!1191760))

(assert (= (and b!1191760 res!792721) b!1191759))

(assert (= (and b!1191759 res!792718) b!1191763))

(assert (= (and b!1191763 res!792720) b!1191756))

(assert (= (and b!1191756 res!792725) b!1191758))

(assert (= (and b!1191758 res!792723) b!1191761))

(assert (= (and b!1191761 res!792719) b!1191754))

(assert (= (and b!1191754 res!792726) b!1191753))

(assert (= (and b!1191753 res!792717) b!1191752))

(assert (= (and b!1191752 res!792724) b!1191764))

(assert (= (and b!1191764 (not res!792716)) b!1191757))

(assert (= (and b!1191757 (not res!792727)) b!1191750))

(assert (= (and b!1191751 condMapEmpty!47021) mapIsEmpty!47021))

(assert (= (and b!1191751 (not condMapEmpty!47021)) mapNonEmpty!47021))

(get-info :version)

(assert (= (and mapNonEmpty!47021 ((_ is ValueCellFull!14355) mapValue!47021)) b!1191755))

(assert (= (and b!1191751 ((_ is ValueCellFull!14355) mapDefault!47021)) b!1191762))

(assert (= start!100020 b!1191751))

(declare-fun b_lambda!20743 () Bool)

(assert (=> (not b_lambda!20743) (not b!1191757)))

(declare-fun t!38769 () Bool)

(declare-fun tb!10411 () Bool)

(assert (=> (and start!100020 (= defaultEntry!1004 defaultEntry!1004) t!38769) tb!10411))

(declare-fun result!21389 () Bool)

(assert (=> tb!10411 (= result!21389 tp_is_empty!30129)))

(assert (=> b!1191757 t!38769))

(declare-fun b_and!42067 () Bool)

(assert (= b_and!42065 (and (=> t!38769 result!21389) b_and!42067)))

(declare-fun m!1100181 () Bool)

(assert (=> b!1191763 m!1100181))

(declare-fun m!1100183 () Bool)

(assert (=> b!1191760 m!1100183))

(declare-fun m!1100185 () Bool)

(assert (=> b!1191756 m!1100185))

(declare-fun m!1100187 () Bool)

(assert (=> b!1191753 m!1100187))

(declare-fun m!1100189 () Bool)

(assert (=> b!1191753 m!1100189))

(declare-fun m!1100191 () Bool)

(assert (=> b!1191752 m!1100191))

(declare-fun m!1100193 () Bool)

(assert (=> b!1191761 m!1100193))

(declare-fun m!1100195 () Bool)

(assert (=> mapNonEmpty!47021 m!1100195))

(declare-fun m!1100197 () Bool)

(assert (=> b!1191764 m!1100197))

(declare-fun m!1100199 () Bool)

(assert (=> b!1191764 m!1100199))

(declare-fun m!1100201 () Bool)

(assert (=> b!1191750 m!1100201))

(declare-fun m!1100203 () Bool)

(assert (=> b!1191750 m!1100203))

(assert (=> b!1191750 m!1100203))

(declare-fun m!1100205 () Bool)

(assert (=> b!1191750 m!1100205))

(declare-fun m!1100207 () Bool)

(assert (=> b!1191750 m!1100207))

(declare-fun m!1100209 () Bool)

(assert (=> b!1191757 m!1100209))

(declare-fun m!1100211 () Bool)

(assert (=> b!1191757 m!1100211))

(declare-fun m!1100213 () Bool)

(assert (=> b!1191757 m!1100213))

(declare-fun m!1100215 () Bool)

(assert (=> b!1191757 m!1100215))

(declare-fun m!1100217 () Bool)

(assert (=> b!1191754 m!1100217))

(declare-fun m!1100219 () Bool)

(assert (=> start!100020 m!1100219))

(declare-fun m!1100221 () Bool)

(assert (=> start!100020 m!1100221))

(check-sat (not b!1191753) (not b!1191757) (not b_next!25599) (not b!1191761) (not b!1191750) (not b!1191764) (not b_lambda!20743) (not b!1191756) (not b!1191763) (not b!1191752) tp_is_empty!30129 (not start!100020) (not b!1191760) b_and!42067 (not mapNonEmpty!47021))
(check-sat b_and!42067 (not b_next!25599))
