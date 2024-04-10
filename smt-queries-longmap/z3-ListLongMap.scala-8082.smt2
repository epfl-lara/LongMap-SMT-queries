; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99360 () Bool)

(assert start!99360)

(declare-fun b_free!24939 () Bool)

(declare-fun b_next!24939 () Bool)

(assert (=> start!99360 (= b_free!24939 (not b_next!24939))))

(declare-fun tp!87531 () Bool)

(declare-fun b_and!40745 () Bool)

(assert (=> start!99360 (= tp!87531 b_and!40745)))

(declare-fun b!1171991 () Bool)

(declare-fun res!778075 () Bool)

(declare-fun e!666150 () Bool)

(assert (=> b!1171991 (=> (not res!778075) (not e!666150))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171991 (= res!778075 (validMask!0 mask!1564))))

(declare-fun b!1171992 () Bool)

(declare-fun res!778067 () Bool)

(declare-fun e!666149 () Bool)

(assert (=> b!1171992 (=> res!778067 e!666149)))

(declare-datatypes ((List!25634 0))(
  ( (Nil!25631) (Cons!25630 (h!26839 (_ BitVec 64)) (t!37565 List!25634)) )
))
(declare-fun noDuplicate!1614 (List!25634) Bool)

(assert (=> b!1171992 (= res!778067 (not (noDuplicate!1614 Nil!25631)))))

(declare-fun b!1171993 () Bool)

(declare-fun e!666151 () Bool)

(declare-fun e!666155 () Bool)

(assert (=> b!1171993 (= e!666151 (not e!666155))))

(declare-fun res!778069 () Bool)

(assert (=> b!1171993 (=> res!778069 e!666155)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1171993 (= res!778069 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75755 0))(
  ( (array!75756 (arr!36527 (Array (_ BitVec 32) (_ BitVec 64))) (size!37063 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75755)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171993 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38650 0))(
  ( (Unit!38651) )
))
(declare-fun lt!528021 () Unit!38650)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75755 (_ BitVec 64) (_ BitVec 32)) Unit!38650)

(assert (=> b!1171993 (= lt!528021 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171994 () Bool)

(declare-fun res!778079 () Bool)

(assert (=> b!1171994 (=> (not res!778079) (not e!666150))))

(assert (=> b!1171994 (= res!778079 (= (select (arr!36527 _keys!1208) i!673) k0!934))))

(declare-fun b!1171995 () Bool)

(declare-fun res!778071 () Bool)

(assert (=> b!1171995 (=> (not res!778071) (not e!666150))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44419 0))(
  ( (V!44420 (val!14791 Int)) )
))
(declare-datatypes ((ValueCell!14025 0))(
  ( (ValueCellFull!14025 (v!17429 V!44419)) (EmptyCell!14025) )
))
(declare-datatypes ((array!75757 0))(
  ( (array!75758 (arr!36528 (Array (_ BitVec 32) ValueCell!14025)) (size!37064 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75757)

(assert (=> b!1171995 (= res!778071 (and (= (size!37064 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37063 _keys!1208) (size!37064 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1171996 () Bool)

(declare-fun e!666152 () Bool)

(declare-fun tp_is_empty!29469 () Bool)

(assert (=> b!1171996 (= e!666152 tp_is_empty!29469)))

(declare-fun b!1171997 () Bool)

(declare-fun res!778078 () Bool)

(assert (=> b!1171997 (=> (not res!778078) (not e!666150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75755 (_ BitVec 32)) Bool)

(assert (=> b!1171997 (= res!778078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171998 () Bool)

(declare-fun res!778066 () Bool)

(assert (=> b!1171998 (=> res!778066 e!666149)))

(declare-fun contains!6853 (List!25634 (_ BitVec 64)) Bool)

(assert (=> b!1171998 (= res!778066 (contains!6853 Nil!25631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!46031 () Bool)

(declare-fun mapRes!46031 () Bool)

(assert (=> mapIsEmpty!46031 mapRes!46031))

(declare-fun b!1172000 () Bool)

(declare-fun res!778068 () Bool)

(assert (=> b!1172000 (=> (not res!778068) (not e!666151))))

(declare-fun lt!528019 () array!75755)

(declare-fun arrayNoDuplicates!0 (array!75755 (_ BitVec 32) List!25634) Bool)

(assert (=> b!1172000 (= res!778068 (arrayNoDuplicates!0 lt!528019 #b00000000000000000000000000000000 Nil!25631))))

(declare-fun b!1172001 () Bool)

(assert (=> b!1172001 (= e!666149 true)))

(declare-fun lt!528025 () Bool)

(assert (=> b!1172001 (= lt!528025 (contains!6853 Nil!25631 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!666157 () Bool)

(declare-fun b!1172002 () Bool)

(assert (=> b!1172002 (= e!666157 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46031 () Bool)

(declare-fun tp!87530 () Bool)

(declare-fun e!666158 () Bool)

(assert (=> mapNonEmpty!46031 (= mapRes!46031 (and tp!87530 e!666158))))

(declare-fun mapKey!46031 () (_ BitVec 32))

(declare-fun mapRest!46031 () (Array (_ BitVec 32) ValueCell!14025))

(declare-fun mapValue!46031 () ValueCell!14025)

(assert (=> mapNonEmpty!46031 (= (arr!36528 _values!996) (store mapRest!46031 mapKey!46031 mapValue!46031))))

(declare-fun b!1172003 () Bool)

(declare-fun e!666154 () Bool)

(assert (=> b!1172003 (= e!666154 e!666149)))

(declare-fun res!778070 () Bool)

(assert (=> b!1172003 (=> res!778070 e!666149)))

(assert (=> b!1172003 (= res!778070 (or (bvsge (size!37063 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37063 _keys!1208)) (bvsge from!1455 (size!37063 _keys!1208))))))

(assert (=> b!1172003 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25631)))

(declare-fun lt!528026 () Unit!38650)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75755 (_ BitVec 32) (_ BitVec 32)) Unit!38650)

(assert (=> b!1172003 (= lt!528026 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1172003 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528024 () Unit!38650)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75755 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38650)

(assert (=> b!1172003 (= lt!528024 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172004 () Bool)

(declare-fun res!778077 () Bool)

(assert (=> b!1172004 (=> (not res!778077) (not e!666150))))

(assert (=> b!1172004 (= res!778077 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37063 _keys!1208))))))

(declare-fun b!1172005 () Bool)

(declare-fun e!666159 () Bool)

(declare-fun e!666160 () Bool)

(assert (=> b!1172005 (= e!666159 e!666160)))

(declare-fun res!778064 () Bool)

(assert (=> b!1172005 (=> res!778064 e!666160)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172005 (= res!778064 (not (validKeyInArray!0 (select (arr!36527 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18898 0))(
  ( (tuple2!18899 (_1!9460 (_ BitVec 64)) (_2!9460 V!44419)) )
))
(declare-datatypes ((List!25635 0))(
  ( (Nil!25632) (Cons!25631 (h!26840 tuple2!18898) (t!37566 List!25635)) )
))
(declare-datatypes ((ListLongMap!16867 0))(
  ( (ListLongMap!16868 (toList!8449 List!25635)) )
))
(declare-fun lt!528029 () ListLongMap!16867)

(declare-fun lt!528027 () ListLongMap!16867)

(assert (=> b!1172005 (= lt!528029 lt!528027)))

(declare-fun lt!528030 () ListLongMap!16867)

(declare-fun -!1517 (ListLongMap!16867 (_ BitVec 64)) ListLongMap!16867)

(assert (=> b!1172005 (= lt!528027 (-!1517 lt!528030 k0!934))))

(declare-fun zeroValue!944 () V!44419)

(declare-fun lt!528020 () array!75757)

(declare-fun minValue!944 () V!44419)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4913 (array!75755 array!75757 (_ BitVec 32) (_ BitVec 32) V!44419 V!44419 (_ BitVec 32) Int) ListLongMap!16867)

(assert (=> b!1172005 (= lt!528029 (getCurrentListMapNoExtraKeys!4913 lt!528019 lt!528020 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172005 (= lt!528030 (getCurrentListMapNoExtraKeys!4913 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528023 () Unit!38650)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!744 (array!75755 array!75757 (_ BitVec 32) (_ BitVec 32) V!44419 V!44419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38650)

(assert (=> b!1172005 (= lt!528023 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!744 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172006 () Bool)

(assert (=> b!1172006 (= e!666150 e!666151)))

(declare-fun res!778072 () Bool)

(assert (=> b!1172006 (=> (not res!778072) (not e!666151))))

(assert (=> b!1172006 (= res!778072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528019 mask!1564))))

(assert (=> b!1172006 (= lt!528019 (array!75756 (store (arr!36527 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37063 _keys!1208)))))

(declare-fun b!1172007 () Bool)

(declare-fun res!778073 () Bool)

(assert (=> b!1172007 (=> (not res!778073) (not e!666150))))

(assert (=> b!1172007 (= res!778073 (validKeyInArray!0 k0!934))))

(declare-fun b!1172008 () Bool)

(assert (=> b!1172008 (= e!666160 e!666154)))

(declare-fun res!778080 () Bool)

(assert (=> b!1172008 (=> res!778080 e!666154)))

(assert (=> b!1172008 (= res!778080 (not (= (select (arr!36527 _keys!1208) from!1455) k0!934)))))

(declare-fun e!666156 () Bool)

(assert (=> b!1172008 e!666156))

(declare-fun res!778081 () Bool)

(assert (=> b!1172008 (=> (not res!778081) (not e!666156))))

(declare-fun lt!528028 () V!44419)

(declare-fun lt!528018 () ListLongMap!16867)

(declare-fun +!3772 (ListLongMap!16867 tuple2!18898) ListLongMap!16867)

(declare-fun get!18632 (ValueCell!14025 V!44419) V!44419)

(assert (=> b!1172008 (= res!778081 (= lt!528018 (+!3772 lt!528027 (tuple2!18899 (select (arr!36527 _keys!1208) from!1455) (get!18632 (select (arr!36528 _values!996) from!1455) lt!528028)))))))

(declare-fun b!1171999 () Bool)

(declare-fun res!778076 () Bool)

(assert (=> b!1171999 (=> (not res!778076) (not e!666150))))

(assert (=> b!1171999 (= res!778076 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25631))))

(declare-fun res!778063 () Bool)

(assert (=> start!99360 (=> (not res!778063) (not e!666150))))

(assert (=> start!99360 (= res!778063 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37063 _keys!1208))))))

(assert (=> start!99360 e!666150))

(assert (=> start!99360 tp_is_empty!29469))

(declare-fun array_inv!27912 (array!75755) Bool)

(assert (=> start!99360 (array_inv!27912 _keys!1208)))

(assert (=> start!99360 true))

(assert (=> start!99360 tp!87531))

(declare-fun e!666148 () Bool)

(declare-fun array_inv!27913 (array!75757) Bool)

(assert (=> start!99360 (and (array_inv!27913 _values!996) e!666148)))

(declare-fun b!1172009 () Bool)

(assert (=> b!1172009 (= e!666148 (and e!666152 mapRes!46031))))

(declare-fun condMapEmpty!46031 () Bool)

(declare-fun mapDefault!46031 () ValueCell!14025)

(assert (=> b!1172009 (= condMapEmpty!46031 (= (arr!36528 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14025)) mapDefault!46031)))))

(declare-fun b!1172010 () Bool)

(assert (=> b!1172010 (= e!666156 e!666157)))

(declare-fun res!778074 () Bool)

(assert (=> b!1172010 (=> res!778074 e!666157)))

(assert (=> b!1172010 (= res!778074 (not (= (select (arr!36527 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1172011 () Bool)

(assert (=> b!1172011 (= e!666155 e!666159)))

(declare-fun res!778065 () Bool)

(assert (=> b!1172011 (=> res!778065 e!666159)))

(assert (=> b!1172011 (= res!778065 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1172011 (= lt!528018 (getCurrentListMapNoExtraKeys!4913 lt!528019 lt!528020 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1172011 (= lt!528020 (array!75758 (store (arr!36528 _values!996) i!673 (ValueCellFull!14025 lt!528028)) (size!37064 _values!996)))))

(declare-fun dynLambda!2885 (Int (_ BitVec 64)) V!44419)

(assert (=> b!1172011 (= lt!528028 (dynLambda!2885 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528022 () ListLongMap!16867)

(assert (=> b!1172011 (= lt!528022 (getCurrentListMapNoExtraKeys!4913 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172012 () Bool)

(assert (=> b!1172012 (= e!666158 tp_is_empty!29469)))

(assert (= (and start!99360 res!778063) b!1171991))

(assert (= (and b!1171991 res!778075) b!1171995))

(assert (= (and b!1171995 res!778071) b!1171997))

(assert (= (and b!1171997 res!778078) b!1171999))

(assert (= (and b!1171999 res!778076) b!1172004))

(assert (= (and b!1172004 res!778077) b!1172007))

(assert (= (and b!1172007 res!778073) b!1171994))

(assert (= (and b!1171994 res!778079) b!1172006))

(assert (= (and b!1172006 res!778072) b!1172000))

(assert (= (and b!1172000 res!778068) b!1171993))

(assert (= (and b!1171993 (not res!778069)) b!1172011))

(assert (= (and b!1172011 (not res!778065)) b!1172005))

(assert (= (and b!1172005 (not res!778064)) b!1172008))

(assert (= (and b!1172008 res!778081) b!1172010))

(assert (= (and b!1172010 (not res!778074)) b!1172002))

(assert (= (and b!1172008 (not res!778080)) b!1172003))

(assert (= (and b!1172003 (not res!778070)) b!1171992))

(assert (= (and b!1171992 (not res!778067)) b!1171998))

(assert (= (and b!1171998 (not res!778066)) b!1172001))

(assert (= (and b!1172009 condMapEmpty!46031) mapIsEmpty!46031))

(assert (= (and b!1172009 (not condMapEmpty!46031)) mapNonEmpty!46031))

(get-info :version)

(assert (= (and mapNonEmpty!46031 ((_ is ValueCellFull!14025) mapValue!46031)) b!1172012))

(assert (= (and b!1172009 ((_ is ValueCellFull!14025) mapDefault!46031)) b!1171996))

(assert (= start!99360 b!1172009))

(declare-fun b_lambda!20083 () Bool)

(assert (=> (not b_lambda!20083) (not b!1172011)))

(declare-fun t!37564 () Bool)

(declare-fun tb!9751 () Bool)

(assert (=> (and start!99360 (= defaultEntry!1004 defaultEntry!1004) t!37564) tb!9751))

(declare-fun result!20069 () Bool)

(assert (=> tb!9751 (= result!20069 tp_is_empty!29469)))

(assert (=> b!1172011 t!37564))

(declare-fun b_and!40747 () Bool)

(assert (= b_and!40745 (and (=> t!37564 result!20069) b_and!40747)))

(declare-fun m!1079807 () Bool)

(assert (=> b!1171998 m!1079807))

(declare-fun m!1079809 () Bool)

(assert (=> b!1172002 m!1079809))

(declare-fun m!1079811 () Bool)

(assert (=> b!1172008 m!1079811))

(declare-fun m!1079813 () Bool)

(assert (=> b!1172008 m!1079813))

(assert (=> b!1172008 m!1079813))

(declare-fun m!1079815 () Bool)

(assert (=> b!1172008 m!1079815))

(declare-fun m!1079817 () Bool)

(assert (=> b!1172008 m!1079817))

(declare-fun m!1079819 () Bool)

(assert (=> b!1172011 m!1079819))

(declare-fun m!1079821 () Bool)

(assert (=> b!1172011 m!1079821))

(declare-fun m!1079823 () Bool)

(assert (=> b!1172011 m!1079823))

(declare-fun m!1079825 () Bool)

(assert (=> b!1172011 m!1079825))

(declare-fun m!1079827 () Bool)

(assert (=> b!1172000 m!1079827))

(declare-fun m!1079829 () Bool)

(assert (=> b!1172006 m!1079829))

(declare-fun m!1079831 () Bool)

(assert (=> b!1172006 m!1079831))

(declare-fun m!1079833 () Bool)

(assert (=> b!1172007 m!1079833))

(declare-fun m!1079835 () Bool)

(assert (=> b!1171997 m!1079835))

(declare-fun m!1079837 () Bool)

(assert (=> b!1171994 m!1079837))

(declare-fun m!1079839 () Bool)

(assert (=> b!1171992 m!1079839))

(declare-fun m!1079841 () Bool)

(assert (=> start!99360 m!1079841))

(declare-fun m!1079843 () Bool)

(assert (=> start!99360 m!1079843))

(declare-fun m!1079845 () Bool)

(assert (=> b!1171999 m!1079845))

(assert (=> b!1172010 m!1079811))

(declare-fun m!1079847 () Bool)

(assert (=> mapNonEmpty!46031 m!1079847))

(declare-fun m!1079849 () Bool)

(assert (=> b!1171991 m!1079849))

(declare-fun m!1079851 () Bool)

(assert (=> b!1172003 m!1079851))

(declare-fun m!1079853 () Bool)

(assert (=> b!1172003 m!1079853))

(declare-fun m!1079855 () Bool)

(assert (=> b!1172003 m!1079855))

(declare-fun m!1079857 () Bool)

(assert (=> b!1172003 m!1079857))

(declare-fun m!1079859 () Bool)

(assert (=> b!1172005 m!1079859))

(declare-fun m!1079861 () Bool)

(assert (=> b!1172005 m!1079861))

(assert (=> b!1172005 m!1079811))

(declare-fun m!1079863 () Bool)

(assert (=> b!1172005 m!1079863))

(declare-fun m!1079865 () Bool)

(assert (=> b!1172005 m!1079865))

(declare-fun m!1079867 () Bool)

(assert (=> b!1172005 m!1079867))

(assert (=> b!1172005 m!1079811))

(declare-fun m!1079869 () Bool)

(assert (=> b!1172001 m!1079869))

(declare-fun m!1079871 () Bool)

(assert (=> b!1171993 m!1079871))

(declare-fun m!1079873 () Bool)

(assert (=> b!1171993 m!1079873))

(check-sat (not b!1172007) (not b!1171993) (not b!1172005) (not b!1172002) (not b!1172003) (not start!99360) (not b!1171998) (not b_lambda!20083) (not mapNonEmpty!46031) (not b!1171999) (not b!1172001) (not b!1172008) (not b!1172006) b_and!40747 (not b!1171992) (not b!1172011) (not b!1171997) (not b!1171991) (not b_next!24939) (not b!1172000) tp_is_empty!29469)
(check-sat b_and!40747 (not b_next!24939))
