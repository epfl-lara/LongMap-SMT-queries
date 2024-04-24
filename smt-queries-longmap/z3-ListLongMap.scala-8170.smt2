; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100122 () Bool)

(assert start!100122)

(declare-fun b_free!25465 () Bool)

(declare-fun b_next!25465 () Bool)

(assert (=> start!100122 (= b_free!25465 (not b_next!25465))))

(declare-fun tp!89108 () Bool)

(declare-fun b_and!41799 () Bool)

(assert (=> start!100122 (= tp!89108 b_and!41799)))

(declare-fun b!1189890 () Bool)

(declare-fun e!676653 () Bool)

(declare-fun e!676651 () Bool)

(assert (=> b!1189890 (= e!676653 e!676651)))

(declare-fun res!790815 () Bool)

(assert (=> b!1189890 (=> (not res!790815) (not e!676651))))

(declare-datatypes ((array!76829 0))(
  ( (array!76830 (arr!37058 (Array (_ BitVec 32) (_ BitVec 64))) (size!37595 (_ BitVec 32))) )
))
(declare-fun lt!541233 () array!76829)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76829 (_ BitVec 32)) Bool)

(assert (=> b!1189890 (= res!790815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541233 mask!1564))))

(declare-fun _keys!1208 () array!76829)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1189890 (= lt!541233 (array!76830 (store (arr!37058 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37595 _keys!1208)))))

(declare-fun b!1189891 () Bool)

(declare-fun res!790822 () Bool)

(assert (=> b!1189891 (=> (not res!790822) (not e!676653))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189891 (= res!790822 (validKeyInArray!0 k0!934))))

(declare-fun res!790816 () Bool)

(assert (=> start!100122 (=> (not res!790816) (not e!676653))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100122 (= res!790816 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37595 _keys!1208))))))

(assert (=> start!100122 e!676653))

(declare-fun tp_is_empty!29995 () Bool)

(assert (=> start!100122 tp_is_empty!29995))

(declare-fun array_inv!28338 (array!76829) Bool)

(assert (=> start!100122 (array_inv!28338 _keys!1208)))

(assert (=> start!100122 true))

(assert (=> start!100122 tp!89108))

(declare-datatypes ((V!45121 0))(
  ( (V!45122 (val!15054 Int)) )
))
(declare-datatypes ((ValueCell!14288 0))(
  ( (ValueCellFull!14288 (v!17688 V!45121)) (EmptyCell!14288) )
))
(declare-datatypes ((array!76831 0))(
  ( (array!76832 (arr!37059 (Array (_ BitVec 32) ValueCell!14288)) (size!37596 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76831)

(declare-fun e!676656 () Bool)

(declare-fun array_inv!28339 (array!76831) Bool)

(assert (=> start!100122 (and (array_inv!28339 _values!996) e!676656)))

(declare-fun b!1189892 () Bool)

(declare-fun res!790823 () Bool)

(assert (=> b!1189892 (=> (not res!790823) (not e!676651))))

(declare-datatypes ((List!26106 0))(
  ( (Nil!26103) (Cons!26102 (h!27320 (_ BitVec 64)) (t!38555 List!26106)) )
))
(declare-fun arrayNoDuplicates!0 (array!76829 (_ BitVec 32) List!26106) Bool)

(assert (=> b!1189892 (= res!790823 (arrayNoDuplicates!0 lt!541233 #b00000000000000000000000000000000 Nil!26103))))

(declare-fun b!1189893 () Bool)

(declare-fun res!790817 () Bool)

(assert (=> b!1189893 (=> (not res!790817) (not e!676653))))

(assert (=> b!1189893 (= res!790817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189894 () Bool)

(declare-fun res!790819 () Bool)

(assert (=> b!1189894 (=> (not res!790819) (not e!676653))))

(assert (=> b!1189894 (= res!790819 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37595 _keys!1208))))))

(declare-fun b!1189895 () Bool)

(declare-fun res!790812 () Bool)

(assert (=> b!1189895 (=> (not res!790812) (not e!676653))))

(assert (=> b!1189895 (= res!790812 (= (select (arr!37058 _keys!1208) i!673) k0!934))))

(declare-fun b!1189896 () Bool)

(declare-fun e!676652 () Bool)

(declare-fun mapRes!46820 () Bool)

(assert (=> b!1189896 (= e!676656 (and e!676652 mapRes!46820))))

(declare-fun condMapEmpty!46820 () Bool)

(declare-fun mapDefault!46820 () ValueCell!14288)

(assert (=> b!1189896 (= condMapEmpty!46820 (= (arr!37059 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14288)) mapDefault!46820)))))

(declare-fun mapIsEmpty!46820 () Bool)

(assert (=> mapIsEmpty!46820 mapRes!46820))

(declare-fun mapNonEmpty!46820 () Bool)

(declare-fun tp!89109 () Bool)

(declare-fun e!676658 () Bool)

(assert (=> mapNonEmpty!46820 (= mapRes!46820 (and tp!89109 e!676658))))

(declare-fun mapKey!46820 () (_ BitVec 32))

(declare-fun mapValue!46820 () ValueCell!14288)

(declare-fun mapRest!46820 () (Array (_ BitVec 32) ValueCell!14288))

(assert (=> mapNonEmpty!46820 (= (arr!37059 _values!996) (store mapRest!46820 mapKey!46820 mapValue!46820))))

(declare-fun b!1189897 () Bool)

(declare-fun e!676657 () Bool)

(assert (=> b!1189897 (= e!676651 (not e!676657))))

(declare-fun res!790814 () Bool)

(assert (=> b!1189897 (=> res!790814 e!676657)))

(assert (=> b!1189897 (= res!790814 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189897 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39411 0))(
  ( (Unit!39412) )
))
(declare-fun lt!541232 () Unit!39411)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76829 (_ BitVec 64) (_ BitVec 32)) Unit!39411)

(assert (=> b!1189897 (= lt!541232 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189898 () Bool)

(declare-fun res!790813 () Bool)

(assert (=> b!1189898 (=> (not res!790813) (not e!676653))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1189898 (= res!790813 (and (= (size!37596 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37595 _keys!1208) (size!37596 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189899 () Bool)

(declare-fun e!676655 () Bool)

(assert (=> b!1189899 (= e!676655 true)))

(declare-fun zeroValue!944 () V!45121)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541229 () array!76831)

(declare-fun minValue!944 () V!45121)

(declare-datatypes ((tuple2!19364 0))(
  ( (tuple2!19365 (_1!9693 (_ BitVec 64)) (_2!9693 V!45121)) )
))
(declare-datatypes ((List!26107 0))(
  ( (Nil!26104) (Cons!26103 (h!27321 tuple2!19364) (t!38556 List!26107)) )
))
(declare-datatypes ((ListLongMap!17341 0))(
  ( (ListLongMap!17342 (toList!8686 List!26107)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5154 (array!76829 array!76831 (_ BitVec 32) (_ BitVec 32) V!45121 V!45121 (_ BitVec 32) Int) ListLongMap!17341)

(declare-fun -!1704 (ListLongMap!17341 (_ BitVec 64)) ListLongMap!17341)

(assert (=> b!1189899 (= (getCurrentListMapNoExtraKeys!5154 lt!541233 lt!541229 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1704 (getCurrentListMapNoExtraKeys!5154 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541231 () Unit!39411)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!919 (array!76829 array!76831 (_ BitVec 32) (_ BitVec 32) V!45121 V!45121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39411)

(assert (=> b!1189899 (= lt!541231 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!919 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189900 () Bool)

(assert (=> b!1189900 (= e!676652 tp_is_empty!29995)))

(declare-fun b!1189901 () Bool)

(assert (=> b!1189901 (= e!676657 e!676655)))

(declare-fun res!790820 () Bool)

(assert (=> b!1189901 (=> res!790820 e!676655)))

(assert (=> b!1189901 (= res!790820 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541230 () ListLongMap!17341)

(assert (=> b!1189901 (= lt!541230 (getCurrentListMapNoExtraKeys!5154 lt!541233 lt!541229 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3112 (Int (_ BitVec 64)) V!45121)

(assert (=> b!1189901 (= lt!541229 (array!76832 (store (arr!37059 _values!996) i!673 (ValueCellFull!14288 (dynLambda!3112 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37596 _values!996)))))

(declare-fun lt!541234 () ListLongMap!17341)

(assert (=> b!1189901 (= lt!541234 (getCurrentListMapNoExtraKeys!5154 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189902 () Bool)

(assert (=> b!1189902 (= e!676658 tp_is_empty!29995)))

(declare-fun b!1189903 () Bool)

(declare-fun res!790818 () Bool)

(assert (=> b!1189903 (=> (not res!790818) (not e!676653))))

(assert (=> b!1189903 (= res!790818 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26103))))

(declare-fun b!1189904 () Bool)

(declare-fun res!790821 () Bool)

(assert (=> b!1189904 (=> (not res!790821) (not e!676653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189904 (= res!790821 (validMask!0 mask!1564))))

(assert (= (and start!100122 res!790816) b!1189904))

(assert (= (and b!1189904 res!790821) b!1189898))

(assert (= (and b!1189898 res!790813) b!1189893))

(assert (= (and b!1189893 res!790817) b!1189903))

(assert (= (and b!1189903 res!790818) b!1189894))

(assert (= (and b!1189894 res!790819) b!1189891))

(assert (= (and b!1189891 res!790822) b!1189895))

(assert (= (and b!1189895 res!790812) b!1189890))

(assert (= (and b!1189890 res!790815) b!1189892))

(assert (= (and b!1189892 res!790823) b!1189897))

(assert (= (and b!1189897 (not res!790814)) b!1189901))

(assert (= (and b!1189901 (not res!790820)) b!1189899))

(assert (= (and b!1189896 condMapEmpty!46820) mapIsEmpty!46820))

(assert (= (and b!1189896 (not condMapEmpty!46820)) mapNonEmpty!46820))

(get-info :version)

(assert (= (and mapNonEmpty!46820 ((_ is ValueCellFull!14288) mapValue!46820)) b!1189902))

(assert (= (and b!1189896 ((_ is ValueCellFull!14288) mapDefault!46820)) b!1189900))

(assert (= start!100122 b!1189896))

(declare-fun b_lambda!20603 () Bool)

(assert (=> (not b_lambda!20603) (not b!1189901)))

(declare-fun t!38554 () Bool)

(declare-fun tb!10269 () Bool)

(assert (=> (and start!100122 (= defaultEntry!1004 defaultEntry!1004) t!38554) tb!10269))

(declare-fun result!21113 () Bool)

(assert (=> tb!10269 (= result!21113 tp_is_empty!29995)))

(assert (=> b!1189901 t!38554))

(declare-fun b_and!41801 () Bool)

(assert (= b_and!41799 (and (=> t!38554 result!21113) b_and!41801)))

(declare-fun m!1098939 () Bool)

(assert (=> mapNonEmpty!46820 m!1098939))

(declare-fun m!1098941 () Bool)

(assert (=> b!1189901 m!1098941))

(declare-fun m!1098943 () Bool)

(assert (=> b!1189901 m!1098943))

(declare-fun m!1098945 () Bool)

(assert (=> b!1189901 m!1098945))

(declare-fun m!1098947 () Bool)

(assert (=> b!1189901 m!1098947))

(declare-fun m!1098949 () Bool)

(assert (=> b!1189895 m!1098949))

(declare-fun m!1098951 () Bool)

(assert (=> b!1189890 m!1098951))

(declare-fun m!1098953 () Bool)

(assert (=> b!1189890 m!1098953))

(declare-fun m!1098955 () Bool)

(assert (=> b!1189899 m!1098955))

(declare-fun m!1098957 () Bool)

(assert (=> b!1189899 m!1098957))

(assert (=> b!1189899 m!1098957))

(declare-fun m!1098959 () Bool)

(assert (=> b!1189899 m!1098959))

(declare-fun m!1098961 () Bool)

(assert (=> b!1189899 m!1098961))

(declare-fun m!1098963 () Bool)

(assert (=> b!1189904 m!1098963))

(declare-fun m!1098965 () Bool)

(assert (=> b!1189897 m!1098965))

(declare-fun m!1098967 () Bool)

(assert (=> b!1189897 m!1098967))

(declare-fun m!1098969 () Bool)

(assert (=> b!1189903 m!1098969))

(declare-fun m!1098971 () Bool)

(assert (=> b!1189893 m!1098971))

(declare-fun m!1098973 () Bool)

(assert (=> b!1189892 m!1098973))

(declare-fun m!1098975 () Bool)

(assert (=> start!100122 m!1098975))

(declare-fun m!1098977 () Bool)

(assert (=> start!100122 m!1098977))

(declare-fun m!1098979 () Bool)

(assert (=> b!1189891 m!1098979))

(check-sat (not b!1189890) (not b!1189892) (not b!1189899) b_and!41801 (not b!1189903) (not b!1189901) (not b!1189897) (not b!1189893) (not mapNonEmpty!46820) (not b!1189904) (not b!1189891) (not start!100122) tp_is_empty!29995 (not b_lambda!20603) (not b_next!25465))
(check-sat b_and!41801 (not b_next!25465))
