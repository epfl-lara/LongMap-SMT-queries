; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99352 () Bool)

(assert start!99352)

(declare-fun b_free!24937 () Bool)

(declare-fun b_next!24937 () Bool)

(assert (=> start!99352 (= b_free!24937 (not b_next!24937))))

(declare-fun tp!87525 () Bool)

(declare-fun b_and!40719 () Bool)

(assert (=> start!99352 (= tp!87525 b_and!40719)))

(declare-fun mapIsEmpty!46028 () Bool)

(declare-fun mapRes!46028 () Bool)

(assert (=> mapIsEmpty!46028 mapRes!46028))

(declare-fun b!1171799 () Bool)

(declare-fun e!666034 () Bool)

(declare-fun e!666041 () Bool)

(assert (=> b!1171799 (= e!666034 e!666041)))

(declare-fun res!777944 () Bool)

(assert (=> b!1171799 (=> res!777944 e!666041)))

(declare-datatypes ((array!75678 0))(
  ( (array!75679 (arr!36489 (Array (_ BitVec 32) (_ BitVec 64))) (size!37027 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75678)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1171799 (= res!777944 (not (= (select (arr!36489 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1171800 () Bool)

(declare-fun res!777956 () Bool)

(declare-fun e!666040 () Bool)

(assert (=> b!1171800 (=> (not res!777956) (not e!666040))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171800 (= res!777956 (validMask!0 mask!1564))))

(declare-fun b!1171801 () Bool)

(declare-fun e!666043 () Bool)

(assert (=> b!1171801 (= e!666043 true)))

(declare-fun lt!527796 () Bool)

(declare-datatypes ((List!25700 0))(
  ( (Nil!25697) (Cons!25696 (h!26905 (_ BitVec 64)) (t!37620 List!25700)) )
))
(declare-fun contains!6833 (List!25700 (_ BitVec 64)) Bool)

(assert (=> b!1171801 (= lt!527796 (contains!6833 Nil!25697 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171802 () Bool)

(declare-fun e!666039 () Bool)

(declare-fun e!666033 () Bool)

(assert (=> b!1171802 (= e!666039 e!666033)))

(declare-fun res!777940 () Bool)

(assert (=> b!1171802 (=> res!777940 e!666033)))

(assert (=> b!1171802 (= res!777940 (not (= (select (arr!36489 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1171802 e!666034))

(declare-fun res!777954 () Bool)

(assert (=> b!1171802 (=> (not res!777954) (not e!666034))))

(declare-datatypes ((V!44417 0))(
  ( (V!44418 (val!14790 Int)) )
))
(declare-datatypes ((tuple2!18986 0))(
  ( (tuple2!18987 (_1!9504 (_ BitVec 64)) (_2!9504 V!44417)) )
))
(declare-datatypes ((List!25701 0))(
  ( (Nil!25698) (Cons!25697 (h!26906 tuple2!18986) (t!37621 List!25701)) )
))
(declare-datatypes ((ListLongMap!16955 0))(
  ( (ListLongMap!16956 (toList!8493 List!25701)) )
))
(declare-fun lt!527798 () ListLongMap!16955)

(declare-fun lt!527795 () ListLongMap!16955)

(declare-datatypes ((ValueCell!14024 0))(
  ( (ValueCellFull!14024 (v!17427 V!44417)) (EmptyCell!14024) )
))
(declare-datatypes ((array!75680 0))(
  ( (array!75681 (arr!36490 (Array (_ BitVec 32) ValueCell!14024)) (size!37028 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75680)

(declare-fun lt!527791 () V!44417)

(declare-fun +!3811 (ListLongMap!16955 tuple2!18986) ListLongMap!16955)

(declare-fun get!18623 (ValueCell!14024 V!44417) V!44417)

(assert (=> b!1171802 (= res!777954 (= lt!527798 (+!3811 lt!527795 (tuple2!18987 (select (arr!36489 _keys!1208) from!1455) (get!18623 (select (arr!36490 _values!996) from!1455) lt!527791)))))))

(declare-fun b!1171803 () Bool)

(declare-fun e!666036 () Bool)

(assert (=> b!1171803 (= e!666040 e!666036)))

(declare-fun res!777947 () Bool)

(assert (=> b!1171803 (=> (not res!777947) (not e!666036))))

(declare-fun lt!527794 () array!75678)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75678 (_ BitVec 32)) Bool)

(assert (=> b!1171803 (= res!777947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527794 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1171803 (= lt!527794 (array!75679 (store (arr!36489 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37027 _keys!1208)))))

(declare-fun b!1171804 () Bool)

(declare-fun res!777941 () Bool)

(assert (=> b!1171804 (=> (not res!777941) (not e!666040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171804 (= res!777941 (validKeyInArray!0 k0!934))))

(declare-fun b!1171805 () Bool)

(declare-fun e!666037 () Bool)

(assert (=> b!1171805 (= e!666037 e!666039)))

(declare-fun res!777955 () Bool)

(assert (=> b!1171805 (=> res!777955 e!666039)))

(assert (=> b!1171805 (= res!777955 (not (validKeyInArray!0 (select (arr!36489 _keys!1208) from!1455))))))

(declare-fun lt!527790 () ListLongMap!16955)

(assert (=> b!1171805 (= lt!527790 lt!527795)))

(declare-fun lt!527788 () ListLongMap!16955)

(declare-fun -!1486 (ListLongMap!16955 (_ BitVec 64)) ListLongMap!16955)

(assert (=> b!1171805 (= lt!527795 (-!1486 lt!527788 k0!934))))

(declare-fun zeroValue!944 () V!44417)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527789 () array!75680)

(declare-fun minValue!944 () V!44417)

(declare-fun getCurrentListMapNoExtraKeys!4967 (array!75678 array!75680 (_ BitVec 32) (_ BitVec 32) V!44417 V!44417 (_ BitVec 32) Int) ListLongMap!16955)

(assert (=> b!1171805 (= lt!527790 (getCurrentListMapNoExtraKeys!4967 lt!527794 lt!527789 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171805 (= lt!527788 (getCurrentListMapNoExtraKeys!4967 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38465 0))(
  ( (Unit!38466) )
))
(declare-fun lt!527797 () Unit!38465)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!750 (array!75678 array!75680 (_ BitVec 32) (_ BitVec 32) V!44417 V!44417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38465)

(assert (=> b!1171805 (= lt!527797 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!750 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!777948 () Bool)

(assert (=> start!99352 (=> (not res!777948) (not e!666040))))

(assert (=> start!99352 (= res!777948 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37027 _keys!1208))))))

(assert (=> start!99352 e!666040))

(declare-fun tp_is_empty!29467 () Bool)

(assert (=> start!99352 tp_is_empty!29467))

(declare-fun array_inv!27988 (array!75678) Bool)

(assert (=> start!99352 (array_inv!27988 _keys!1208)))

(assert (=> start!99352 true))

(assert (=> start!99352 tp!87525))

(declare-fun e!666031 () Bool)

(declare-fun array_inv!27989 (array!75680) Bool)

(assert (=> start!99352 (and (array_inv!27989 _values!996) e!666031)))

(declare-fun b!1171806 () Bool)

(declare-fun res!777950 () Bool)

(assert (=> b!1171806 (=> res!777950 e!666043)))

(declare-fun noDuplicate!1630 (List!25700) Bool)

(assert (=> b!1171806 (= res!777950 (not (noDuplicate!1630 Nil!25697)))))

(declare-fun mapNonEmpty!46028 () Bool)

(declare-fun tp!87524 () Bool)

(declare-fun e!666042 () Bool)

(assert (=> mapNonEmpty!46028 (= mapRes!46028 (and tp!87524 e!666042))))

(declare-fun mapRest!46028 () (Array (_ BitVec 32) ValueCell!14024))

(declare-fun mapKey!46028 () (_ BitVec 32))

(declare-fun mapValue!46028 () ValueCell!14024)

(assert (=> mapNonEmpty!46028 (= (arr!36490 _values!996) (store mapRest!46028 mapKey!46028 mapValue!46028))))

(declare-fun b!1171807 () Bool)

(declare-fun res!777953 () Bool)

(assert (=> b!1171807 (=> (not res!777953) (not e!666040))))

(assert (=> b!1171807 (= res!777953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171808 () Bool)

(assert (=> b!1171808 (= e!666042 tp_is_empty!29467)))

(declare-fun b!1171809 () Bool)

(declare-fun res!777942 () Bool)

(assert (=> b!1171809 (=> (not res!777942) (not e!666040))))

(assert (=> b!1171809 (= res!777942 (= (select (arr!36489 _keys!1208) i!673) k0!934))))

(declare-fun b!1171810 () Bool)

(declare-fun e!666032 () Bool)

(assert (=> b!1171810 (= e!666032 e!666037)))

(declare-fun res!777945 () Bool)

(assert (=> b!1171810 (=> res!777945 e!666037)))

(assert (=> b!1171810 (= res!777945 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1171810 (= lt!527798 (getCurrentListMapNoExtraKeys!4967 lt!527794 lt!527789 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1171810 (= lt!527789 (array!75681 (store (arr!36490 _values!996) i!673 (ValueCellFull!14024 lt!527791)) (size!37028 _values!996)))))

(declare-fun dynLambda!2892 (Int (_ BitVec 64)) V!44417)

(assert (=> b!1171810 (= lt!527791 (dynLambda!2892 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527787 () ListLongMap!16955)

(assert (=> b!1171810 (= lt!527787 (getCurrentListMapNoExtraKeys!4967 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1171811 () Bool)

(declare-fun res!777949 () Bool)

(assert (=> b!1171811 (=> (not res!777949) (not e!666036))))

(declare-fun arrayNoDuplicates!0 (array!75678 (_ BitVec 32) List!25700) Bool)

(assert (=> b!1171811 (= res!777949 (arrayNoDuplicates!0 lt!527794 #b00000000000000000000000000000000 Nil!25697))))

(declare-fun b!1171812 () Bool)

(declare-fun e!666038 () Bool)

(assert (=> b!1171812 (= e!666031 (and e!666038 mapRes!46028))))

(declare-fun condMapEmpty!46028 () Bool)

(declare-fun mapDefault!46028 () ValueCell!14024)

(assert (=> b!1171812 (= condMapEmpty!46028 (= (arr!36490 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14024)) mapDefault!46028)))))

(declare-fun b!1171813 () Bool)

(assert (=> b!1171813 (= e!666033 e!666043)))

(declare-fun res!777958 () Bool)

(assert (=> b!1171813 (=> res!777958 e!666043)))

(assert (=> b!1171813 (= res!777958 (or (bvsge (size!37027 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37027 _keys!1208)) (bvsge from!1455 (size!37027 _keys!1208))))))

(assert (=> b!1171813 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25697)))

(declare-fun lt!527792 () Unit!38465)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75678 (_ BitVec 32) (_ BitVec 32)) Unit!38465)

(assert (=> b!1171813 (= lt!527792 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!75678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171813 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527799 () Unit!38465)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75678 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38465)

(assert (=> b!1171813 (= lt!527799 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1171814 () Bool)

(assert (=> b!1171814 (= e!666038 tp_is_empty!29467)))

(declare-fun b!1171815 () Bool)

(declare-fun res!777957 () Bool)

(assert (=> b!1171815 (=> res!777957 e!666043)))

(assert (=> b!1171815 (= res!777957 (contains!6833 Nil!25697 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171816 () Bool)

(assert (=> b!1171816 (= e!666041 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171817 () Bool)

(declare-fun res!777943 () Bool)

(assert (=> b!1171817 (=> (not res!777943) (not e!666040))))

(assert (=> b!1171817 (= res!777943 (and (= (size!37028 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37027 _keys!1208) (size!37028 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1171818 () Bool)

(declare-fun res!777951 () Bool)

(assert (=> b!1171818 (=> (not res!777951) (not e!666040))))

(assert (=> b!1171818 (= res!777951 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25697))))

(declare-fun b!1171819 () Bool)

(assert (=> b!1171819 (= e!666036 (not e!666032))))

(declare-fun res!777952 () Bool)

(assert (=> b!1171819 (=> res!777952 e!666032)))

(assert (=> b!1171819 (= res!777952 (bvsgt from!1455 i!673))))

(assert (=> b!1171819 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527793 () Unit!38465)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75678 (_ BitVec 64) (_ BitVec 32)) Unit!38465)

(assert (=> b!1171819 (= lt!527793 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171820 () Bool)

(declare-fun res!777946 () Bool)

(assert (=> b!1171820 (=> (not res!777946) (not e!666040))))

(assert (=> b!1171820 (= res!777946 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37027 _keys!1208))))))

(assert (= (and start!99352 res!777948) b!1171800))

(assert (= (and b!1171800 res!777956) b!1171817))

(assert (= (and b!1171817 res!777943) b!1171807))

(assert (= (and b!1171807 res!777953) b!1171818))

(assert (= (and b!1171818 res!777951) b!1171820))

(assert (= (and b!1171820 res!777946) b!1171804))

(assert (= (and b!1171804 res!777941) b!1171809))

(assert (= (and b!1171809 res!777942) b!1171803))

(assert (= (and b!1171803 res!777947) b!1171811))

(assert (= (and b!1171811 res!777949) b!1171819))

(assert (= (and b!1171819 (not res!777952)) b!1171810))

(assert (= (and b!1171810 (not res!777945)) b!1171805))

(assert (= (and b!1171805 (not res!777955)) b!1171802))

(assert (= (and b!1171802 res!777954) b!1171799))

(assert (= (and b!1171799 (not res!777944)) b!1171816))

(assert (= (and b!1171802 (not res!777940)) b!1171813))

(assert (= (and b!1171813 (not res!777958)) b!1171806))

(assert (= (and b!1171806 (not res!777950)) b!1171815))

(assert (= (and b!1171815 (not res!777957)) b!1171801))

(assert (= (and b!1171812 condMapEmpty!46028) mapIsEmpty!46028))

(assert (= (and b!1171812 (not condMapEmpty!46028)) mapNonEmpty!46028))

(get-info :version)

(assert (= (and mapNonEmpty!46028 ((_ is ValueCellFull!14024) mapValue!46028)) b!1171808))

(assert (= (and b!1171812 ((_ is ValueCellFull!14024) mapDefault!46028)) b!1171814))

(assert (= start!99352 b!1171812))

(declare-fun b_lambda!20063 () Bool)

(assert (=> (not b_lambda!20063) (not b!1171810)))

(declare-fun t!37619 () Bool)

(declare-fun tb!9741 () Bool)

(assert (=> (and start!99352 (= defaultEntry!1004 defaultEntry!1004) t!37619) tb!9741))

(declare-fun result!20057 () Bool)

(assert (=> tb!9741 (= result!20057 tp_is_empty!29467)))

(assert (=> b!1171810 t!37619))

(declare-fun b_and!40721 () Bool)

(assert (= b_and!40719 (and (=> t!37619 result!20057) b_and!40721)))

(declare-fun m!1079129 () Bool)

(assert (=> b!1171805 m!1079129))

(declare-fun m!1079131 () Bool)

(assert (=> b!1171805 m!1079131))

(declare-fun m!1079133 () Bool)

(assert (=> b!1171805 m!1079133))

(declare-fun m!1079135 () Bool)

(assert (=> b!1171805 m!1079135))

(declare-fun m!1079137 () Bool)

(assert (=> b!1171805 m!1079137))

(declare-fun m!1079139 () Bool)

(assert (=> b!1171805 m!1079139))

(assert (=> b!1171805 m!1079137))

(declare-fun m!1079141 () Bool)

(assert (=> b!1171807 m!1079141))

(declare-fun m!1079143 () Bool)

(assert (=> b!1171800 m!1079143))

(declare-fun m!1079145 () Bool)

(assert (=> b!1171809 m!1079145))

(declare-fun m!1079147 () Bool)

(assert (=> b!1171818 m!1079147))

(declare-fun m!1079149 () Bool)

(assert (=> start!99352 m!1079149))

(declare-fun m!1079151 () Bool)

(assert (=> start!99352 m!1079151))

(declare-fun m!1079153 () Bool)

(assert (=> b!1171813 m!1079153))

(declare-fun m!1079155 () Bool)

(assert (=> b!1171813 m!1079155))

(declare-fun m!1079157 () Bool)

(assert (=> b!1171813 m!1079157))

(declare-fun m!1079159 () Bool)

(assert (=> b!1171813 m!1079159))

(declare-fun m!1079161 () Bool)

(assert (=> b!1171815 m!1079161))

(declare-fun m!1079163 () Bool)

(assert (=> b!1171803 m!1079163))

(declare-fun m!1079165 () Bool)

(assert (=> b!1171803 m!1079165))

(assert (=> b!1171799 m!1079137))

(declare-fun m!1079167 () Bool)

(assert (=> b!1171819 m!1079167))

(declare-fun m!1079169 () Bool)

(assert (=> b!1171819 m!1079169))

(assert (=> b!1171802 m!1079137))

(declare-fun m!1079171 () Bool)

(assert (=> b!1171802 m!1079171))

(assert (=> b!1171802 m!1079171))

(declare-fun m!1079173 () Bool)

(assert (=> b!1171802 m!1079173))

(declare-fun m!1079175 () Bool)

(assert (=> b!1171802 m!1079175))

(declare-fun m!1079177 () Bool)

(assert (=> b!1171804 m!1079177))

(declare-fun m!1079179 () Bool)

(assert (=> b!1171801 m!1079179))

(declare-fun m!1079181 () Bool)

(assert (=> mapNonEmpty!46028 m!1079181))

(declare-fun m!1079183 () Bool)

(assert (=> b!1171810 m!1079183))

(declare-fun m!1079185 () Bool)

(assert (=> b!1171810 m!1079185))

(declare-fun m!1079187 () Bool)

(assert (=> b!1171810 m!1079187))

(declare-fun m!1079189 () Bool)

(assert (=> b!1171810 m!1079189))

(declare-fun m!1079191 () Bool)

(assert (=> b!1171811 m!1079191))

(declare-fun m!1079193 () Bool)

(assert (=> b!1171816 m!1079193))

(declare-fun m!1079195 () Bool)

(assert (=> b!1171806 m!1079195))

(check-sat (not b!1171815) tp_is_empty!29467 (not b!1171813) (not b!1171802) (not b!1171801) (not b!1171806) (not b_lambda!20063) (not b!1171819) (not b!1171810) (not b!1171818) (not mapNonEmpty!46028) (not b!1171807) (not b!1171804) (not start!99352) (not b!1171800) (not b!1171803) (not b!1171811) b_and!40721 (not b!1171816) (not b_next!24937) (not b!1171805))
(check-sat b_and!40721 (not b_next!24937))
