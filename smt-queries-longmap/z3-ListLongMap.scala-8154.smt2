; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100026 () Bool)

(assert start!100026)

(declare-fun b_free!25369 () Bool)

(declare-fun b_next!25369 () Bool)

(assert (=> start!100026 (= b_free!25369 (not b_next!25369))))

(declare-fun tp!88820 () Bool)

(declare-fun b_and!41607 () Bool)

(assert (=> start!100026 (= tp!88820 b_and!41607)))

(declare-fun b!1187014 () Bool)

(declare-fun e!675007 () Bool)

(declare-fun e!675014 () Bool)

(assert (=> b!1187014 (= e!675007 (not e!675014))))

(declare-fun res!788725 () Bool)

(assert (=> b!1187014 (=> res!788725 e!675014)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1187014 (= res!788725 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76643 0))(
  ( (array!76644 (arr!36965 (Array (_ BitVec 32) (_ BitVec 64))) (size!37502 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76643)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187014 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39286 0))(
  ( (Unit!39287) )
))
(declare-fun lt!538757 () Unit!39286)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76643 (_ BitVec 64) (_ BitVec 32)) Unit!39286)

(assert (=> b!1187014 (= lt!538757 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187015 () Bool)

(declare-fun e!675003 () Unit!39286)

(declare-fun Unit!39288 () Unit!39286)

(assert (=> b!1187015 (= e!675003 Unit!39288)))

(declare-fun lt!538759 () Unit!39286)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76643 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39286)

(assert (=> b!1187015 (= lt!538759 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187015 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538755 () Unit!39286)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76643 (_ BitVec 32) (_ BitVec 32)) Unit!39286)

(assert (=> b!1187015 (= lt!538755 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26029 0))(
  ( (Nil!26026) (Cons!26025 (h!27243 (_ BitVec 64)) (t!38382 List!26029)) )
))
(declare-fun arrayNoDuplicates!0 (array!76643 (_ BitVec 32) List!26029) Bool)

(assert (=> b!1187015 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26026)))

(declare-fun lt!538766 () Unit!39286)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76643 (_ BitVec 64) (_ BitVec 32) List!26029) Unit!39286)

(assert (=> b!1187015 (= lt!538766 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26026))))

(assert (=> b!1187015 false))

(declare-fun b!1187016 () Bool)

(declare-fun e!675004 () Bool)

(declare-fun tp_is_empty!29899 () Bool)

(assert (=> b!1187016 (= e!675004 tp_is_empty!29899)))

(declare-fun b!1187017 () Bool)

(declare-fun e!675013 () Bool)

(declare-fun e!675009 () Bool)

(declare-fun mapRes!46676 () Bool)

(assert (=> b!1187017 (= e!675013 (and e!675009 mapRes!46676))))

(declare-fun condMapEmpty!46676 () Bool)

(declare-datatypes ((V!44993 0))(
  ( (V!44994 (val!15006 Int)) )
))
(declare-datatypes ((ValueCell!14240 0))(
  ( (ValueCellFull!14240 (v!17640 V!44993)) (EmptyCell!14240) )
))
(declare-datatypes ((array!76645 0))(
  ( (array!76646 (arr!36966 (Array (_ BitVec 32) ValueCell!14240)) (size!37503 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76645)

(declare-fun mapDefault!46676 () ValueCell!14240)

(assert (=> b!1187017 (= condMapEmpty!46676 (= (arr!36966 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14240)) mapDefault!46676)))))

(declare-fun b!1187018 () Bool)

(declare-fun res!788716 () Bool)

(declare-fun e!675011 () Bool)

(assert (=> b!1187018 (=> (not res!788716) (not e!675011))))

(assert (=> b!1187018 (= res!788716 (= (select (arr!36965 _keys!1208) i!673) k0!934))))

(declare-fun b!1187019 () Bool)

(assert (=> b!1187019 (= e!675009 tp_is_empty!29899)))

(declare-fun mapNonEmpty!46676 () Bool)

(declare-fun tp!88821 () Bool)

(assert (=> mapNonEmpty!46676 (= mapRes!46676 (and tp!88821 e!675004))))

(declare-fun mapValue!46676 () ValueCell!14240)

(declare-fun mapRest!46676 () (Array (_ BitVec 32) ValueCell!14240))

(declare-fun mapKey!46676 () (_ BitVec 32))

(assert (=> mapNonEmpty!46676 (= (arr!36966 _values!996) (store mapRest!46676 mapKey!46676 mapValue!46676))))

(declare-fun b!1187020 () Bool)

(declare-fun res!788724 () Bool)

(assert (=> b!1187020 (=> (not res!788724) (not e!675011))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187020 (= res!788724 (validMask!0 mask!1564))))

(declare-fun b!1187021 () Bool)

(assert (=> b!1187021 (= e!675011 e!675007)))

(declare-fun res!788712 () Bool)

(assert (=> b!1187021 (=> (not res!788712) (not e!675007))))

(declare-fun lt!538767 () array!76643)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76643 (_ BitVec 32)) Bool)

(assert (=> b!1187021 (= res!788712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538767 mask!1564))))

(assert (=> b!1187021 (= lt!538767 (array!76644 (store (arr!36965 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37502 _keys!1208)))))

(declare-fun b!1187023 () Bool)

(declare-fun res!788723 () Bool)

(assert (=> b!1187023 (=> (not res!788723) (not e!675011))))

(assert (=> b!1187023 (= res!788723 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37502 _keys!1208))))))

(declare-fun b!1187024 () Bool)

(declare-fun e!675006 () Bool)

(declare-fun e!675008 () Bool)

(assert (=> b!1187024 (= e!675006 e!675008)))

(declare-fun res!788721 () Bool)

(assert (=> b!1187024 (=> res!788721 e!675008)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187024 (= res!788721 (not (validKeyInArray!0 (select (arr!36965 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19294 0))(
  ( (tuple2!19295 (_1!9658 (_ BitVec 64)) (_2!9658 V!44993)) )
))
(declare-datatypes ((List!26030 0))(
  ( (Nil!26027) (Cons!26026 (h!27244 tuple2!19294) (t!38383 List!26030)) )
))
(declare-datatypes ((ListLongMap!17271 0))(
  ( (ListLongMap!17272 (toList!8651 List!26030)) )
))
(declare-fun lt!538764 () ListLongMap!17271)

(declare-fun lt!538763 () ListLongMap!17271)

(assert (=> b!1187024 (= lt!538764 lt!538763)))

(declare-fun lt!538769 () ListLongMap!17271)

(declare-fun -!1671 (ListLongMap!17271 (_ BitVec 64)) ListLongMap!17271)

(assert (=> b!1187024 (= lt!538763 (-!1671 lt!538769 k0!934))))

(declare-fun zeroValue!944 () V!44993)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!538754 () array!76645)

(declare-fun minValue!944 () V!44993)

(declare-fun getCurrentListMapNoExtraKeys!5121 (array!76643 array!76645 (_ BitVec 32) (_ BitVec 32) V!44993 V!44993 (_ BitVec 32) Int) ListLongMap!17271)

(assert (=> b!1187024 (= lt!538764 (getCurrentListMapNoExtraKeys!5121 lt!538767 lt!538754 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187024 (= lt!538769 (getCurrentListMapNoExtraKeys!5121 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!538761 () Unit!39286)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!890 (array!76643 array!76645 (_ BitVec 32) (_ BitVec 32) V!44993 V!44993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39286)

(assert (=> b!1187024 (= lt!538761 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!890 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187025 () Bool)

(assert (=> b!1187025 (= e!675008 true)))

(declare-fun lt!538765 () ListLongMap!17271)

(declare-fun lt!538756 () ListLongMap!17271)

(assert (=> b!1187025 (= (-!1671 lt!538765 k0!934) lt!538756)))

(declare-fun lt!538758 () V!44993)

(declare-fun lt!538760 () Unit!39286)

(declare-fun addRemoveCommutativeForDiffKeys!184 (ListLongMap!17271 (_ BitVec 64) V!44993 (_ BitVec 64)) Unit!39286)

(assert (=> b!1187025 (= lt!538760 (addRemoveCommutativeForDiffKeys!184 lt!538769 (select (arr!36965 _keys!1208) from!1455) lt!538758 k0!934))))

(declare-fun lt!538753 () ListLongMap!17271)

(assert (=> b!1187025 (and (= lt!538753 lt!538765) (= lt!538763 lt!538764))))

(declare-fun lt!538762 () tuple2!19294)

(declare-fun +!3968 (ListLongMap!17271 tuple2!19294) ListLongMap!17271)

(assert (=> b!1187025 (= lt!538765 (+!3968 lt!538769 lt!538762))))

(assert (=> b!1187025 (not (= (select (arr!36965 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538771 () Unit!39286)

(assert (=> b!1187025 (= lt!538771 e!675003)))

(declare-fun c!117575 () Bool)

(assert (=> b!1187025 (= c!117575 (= (select (arr!36965 _keys!1208) from!1455) k0!934))))

(declare-fun e!675010 () Bool)

(assert (=> b!1187025 e!675010))

(declare-fun res!788717 () Bool)

(assert (=> b!1187025 (=> (not res!788717) (not e!675010))))

(declare-fun lt!538768 () ListLongMap!17271)

(assert (=> b!1187025 (= res!788717 (= lt!538768 lt!538756))))

(assert (=> b!1187025 (= lt!538756 (+!3968 lt!538763 lt!538762))))

(assert (=> b!1187025 (= lt!538762 (tuple2!19295 (select (arr!36965 _keys!1208) from!1455) lt!538758))))

(declare-fun lt!538770 () V!44993)

(declare-fun get!18969 (ValueCell!14240 V!44993) V!44993)

(assert (=> b!1187025 (= lt!538758 (get!18969 (select (arr!36966 _values!996) from!1455) lt!538770))))

(declare-fun b!1187026 () Bool)

(declare-fun res!788726 () Bool)

(assert (=> b!1187026 (=> (not res!788726) (not e!675011))))

(assert (=> b!1187026 (= res!788726 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26026))))

(declare-fun b!1187027 () Bool)

(declare-fun res!788719 () Bool)

(assert (=> b!1187027 (=> (not res!788719) (not e!675011))))

(assert (=> b!1187027 (= res!788719 (validKeyInArray!0 k0!934))))

(declare-fun b!1187028 () Bool)

(assert (=> b!1187028 (= e!675014 e!675006)))

(declare-fun res!788715 () Bool)

(assert (=> b!1187028 (=> res!788715 e!675006)))

(assert (=> b!1187028 (= res!788715 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1187028 (= lt!538768 (getCurrentListMapNoExtraKeys!5121 lt!538767 lt!538754 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1187028 (= lt!538754 (array!76646 (store (arr!36966 _values!996) i!673 (ValueCellFull!14240 lt!538770)) (size!37503 _values!996)))))

(declare-fun dynLambda!3082 (Int (_ BitVec 64)) V!44993)

(assert (=> b!1187028 (= lt!538770 (dynLambda!3082 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1187028 (= lt!538753 (getCurrentListMapNoExtraKeys!5121 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187029 () Bool)

(declare-fun res!788713 () Bool)

(assert (=> b!1187029 (=> (not res!788713) (not e!675011))))

(assert (=> b!1187029 (= res!788713 (and (= (size!37503 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37502 _keys!1208) (size!37503 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187030 () Bool)

(declare-fun res!788720 () Bool)

(assert (=> b!1187030 (=> (not res!788720) (not e!675011))))

(assert (=> b!1187030 (= res!788720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187031 () Bool)

(declare-fun res!788714 () Bool)

(assert (=> b!1187031 (=> (not res!788714) (not e!675007))))

(assert (=> b!1187031 (= res!788714 (arrayNoDuplicates!0 lt!538767 #b00000000000000000000000000000000 Nil!26026))))

(declare-fun b!1187032 () Bool)

(declare-fun Unit!39289 () Unit!39286)

(assert (=> b!1187032 (= e!675003 Unit!39289)))

(declare-fun b!1187022 () Bool)

(declare-fun e!675005 () Bool)

(assert (=> b!1187022 (= e!675005 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun res!788722 () Bool)

(assert (=> start!100026 (=> (not res!788722) (not e!675011))))

(assert (=> start!100026 (= res!788722 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37502 _keys!1208))))))

(assert (=> start!100026 e!675011))

(assert (=> start!100026 tp_is_empty!29899))

(declare-fun array_inv!28284 (array!76643) Bool)

(assert (=> start!100026 (array_inv!28284 _keys!1208)))

(assert (=> start!100026 true))

(assert (=> start!100026 tp!88820))

(declare-fun array_inv!28285 (array!76645) Bool)

(assert (=> start!100026 (and (array_inv!28285 _values!996) e!675013)))

(declare-fun mapIsEmpty!46676 () Bool)

(assert (=> mapIsEmpty!46676 mapRes!46676))

(declare-fun b!1187033 () Bool)

(assert (=> b!1187033 (= e!675010 e!675005)))

(declare-fun res!788718 () Bool)

(assert (=> b!1187033 (=> res!788718 e!675005)))

(assert (=> b!1187033 (= res!788718 (not (= (select (arr!36965 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!100026 res!788722) b!1187020))

(assert (= (and b!1187020 res!788724) b!1187029))

(assert (= (and b!1187029 res!788713) b!1187030))

(assert (= (and b!1187030 res!788720) b!1187026))

(assert (= (and b!1187026 res!788726) b!1187023))

(assert (= (and b!1187023 res!788723) b!1187027))

(assert (= (and b!1187027 res!788719) b!1187018))

(assert (= (and b!1187018 res!788716) b!1187021))

(assert (= (and b!1187021 res!788712) b!1187031))

(assert (= (and b!1187031 res!788714) b!1187014))

(assert (= (and b!1187014 (not res!788725)) b!1187028))

(assert (= (and b!1187028 (not res!788715)) b!1187024))

(assert (= (and b!1187024 (not res!788721)) b!1187025))

(assert (= (and b!1187025 res!788717) b!1187033))

(assert (= (and b!1187033 (not res!788718)) b!1187022))

(assert (= (and b!1187025 c!117575) b!1187015))

(assert (= (and b!1187025 (not c!117575)) b!1187032))

(assert (= (and b!1187017 condMapEmpty!46676) mapIsEmpty!46676))

(assert (= (and b!1187017 (not condMapEmpty!46676)) mapNonEmpty!46676))

(get-info :version)

(assert (= (and mapNonEmpty!46676 ((_ is ValueCellFull!14240) mapValue!46676)) b!1187016))

(assert (= (and b!1187017 ((_ is ValueCellFull!14240) mapDefault!46676)) b!1187019))

(assert (= start!100026 b!1187017))

(declare-fun b_lambda!20507 () Bool)

(assert (=> (not b_lambda!20507) (not b!1187028)))

(declare-fun t!38381 () Bool)

(declare-fun tb!10173 () Bool)

(assert (=> (and start!100026 (= defaultEntry!1004 defaultEntry!1004) t!38381) tb!10173))

(declare-fun result!20921 () Bool)

(assert (=> tb!10173 (= result!20921 tp_is_empty!29899)))

(assert (=> b!1187028 t!38381))

(declare-fun b_and!41609 () Bool)

(assert (= b_and!41607 (and (=> t!38381 result!20921) b_and!41609)))

(declare-fun m!1095747 () Bool)

(assert (=> b!1187027 m!1095747))

(declare-fun m!1095749 () Bool)

(assert (=> start!100026 m!1095749))

(declare-fun m!1095751 () Bool)

(assert (=> start!100026 m!1095751))

(declare-fun m!1095753 () Bool)

(assert (=> b!1187033 m!1095753))

(declare-fun m!1095755 () Bool)

(assert (=> b!1187021 m!1095755))

(declare-fun m!1095757 () Bool)

(assert (=> b!1187021 m!1095757))

(declare-fun m!1095759 () Bool)

(assert (=> b!1187015 m!1095759))

(declare-fun m!1095761 () Bool)

(assert (=> b!1187015 m!1095761))

(declare-fun m!1095763 () Bool)

(assert (=> b!1187015 m!1095763))

(declare-fun m!1095765 () Bool)

(assert (=> b!1187015 m!1095765))

(declare-fun m!1095767 () Bool)

(assert (=> b!1187015 m!1095767))

(declare-fun m!1095769 () Bool)

(assert (=> b!1187030 m!1095769))

(assert (=> b!1187025 m!1095753))

(declare-fun m!1095771 () Bool)

(assert (=> b!1187025 m!1095771))

(declare-fun m!1095773 () Bool)

(assert (=> b!1187025 m!1095773))

(declare-fun m!1095775 () Bool)

(assert (=> b!1187025 m!1095775))

(declare-fun m!1095777 () Bool)

(assert (=> b!1187025 m!1095777))

(declare-fun m!1095779 () Bool)

(assert (=> b!1187025 m!1095779))

(assert (=> b!1187025 m!1095773))

(declare-fun m!1095781 () Bool)

(assert (=> b!1187025 m!1095781))

(assert (=> b!1187025 m!1095753))

(declare-fun m!1095783 () Bool)

(assert (=> b!1187014 m!1095783))

(declare-fun m!1095785 () Bool)

(assert (=> b!1187014 m!1095785))

(declare-fun m!1095787 () Bool)

(assert (=> b!1187018 m!1095787))

(declare-fun m!1095789 () Bool)

(assert (=> b!1187022 m!1095789))

(declare-fun m!1095791 () Bool)

(assert (=> b!1187028 m!1095791))

(declare-fun m!1095793 () Bool)

(assert (=> b!1187028 m!1095793))

(declare-fun m!1095795 () Bool)

(assert (=> b!1187028 m!1095795))

(declare-fun m!1095797 () Bool)

(assert (=> b!1187028 m!1095797))

(declare-fun m!1095799 () Bool)

(assert (=> b!1187024 m!1095799))

(declare-fun m!1095801 () Bool)

(assert (=> b!1187024 m!1095801))

(declare-fun m!1095803 () Bool)

(assert (=> b!1187024 m!1095803))

(assert (=> b!1187024 m!1095753))

(declare-fun m!1095805 () Bool)

(assert (=> b!1187024 m!1095805))

(declare-fun m!1095807 () Bool)

(assert (=> b!1187024 m!1095807))

(assert (=> b!1187024 m!1095753))

(declare-fun m!1095809 () Bool)

(assert (=> b!1187031 m!1095809))

(declare-fun m!1095811 () Bool)

(assert (=> b!1187026 m!1095811))

(declare-fun m!1095813 () Bool)

(assert (=> b!1187020 m!1095813))

(declare-fun m!1095815 () Bool)

(assert (=> mapNonEmpty!46676 m!1095815))

(check-sat (not b!1187020) (not b!1187031) (not b!1187026) b_and!41609 (not b_lambda!20507) (not b!1187014) tp_is_empty!29899 (not b!1187015) (not b!1187030) (not b!1187027) (not start!100026) (not b!1187022) (not b_next!25369) (not mapNonEmpty!46676) (not b!1187024) (not b!1187028) (not b!1187025) (not b!1187021))
(check-sat b_and!41609 (not b_next!25369))
