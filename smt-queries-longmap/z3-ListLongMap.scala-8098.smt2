; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99456 () Bool)

(assert start!99456)

(declare-fun b_free!25035 () Bool)

(declare-fun b_next!25035 () Bool)

(assert (=> start!99456 (= b_free!25035 (not b_next!25035))))

(declare-fun tp!87819 () Bool)

(declare-fun b_and!40937 () Bool)

(assert (=> start!99456 (= tp!87819 b_and!40937)))

(declare-fun b!1175029 () Bool)

(declare-datatypes ((Unit!38777 0))(
  ( (Unit!38778) )
))
(declare-fun e!667918 () Unit!38777)

(declare-fun Unit!38779 () Unit!38777)

(assert (=> b!1175029 (= e!667918 Unit!38779)))

(declare-datatypes ((array!75941 0))(
  ( (array!75942 (arr!36620 (Array (_ BitVec 32) (_ BitVec 64))) (size!37156 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75941)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!530009 () Unit!38777)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75941 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38777)

(assert (=> b!1175029 (= lt!530009 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175029 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530003 () Unit!38777)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75941 (_ BitVec 32) (_ BitVec 32)) Unit!38777)

(assert (=> b!1175029 (= lt!530003 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25712 0))(
  ( (Nil!25709) (Cons!25708 (h!26917 (_ BitVec 64)) (t!37739 List!25712)) )
))
(declare-fun arrayNoDuplicates!0 (array!75941 (_ BitVec 32) List!25712) Bool)

(assert (=> b!1175029 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25709)))

(declare-fun lt!530012 () Unit!38777)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75941 (_ BitVec 64) (_ BitVec 32) List!25712) Unit!38777)

(assert (=> b!1175029 (= lt!530012 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25709))))

(assert (=> b!1175029 false))

(declare-fun b!1175030 () Bool)

(declare-fun res!780353 () Bool)

(declare-fun e!667908 () Bool)

(assert (=> b!1175030 (=> (not res!780353) (not e!667908))))

(assert (=> b!1175030 (= res!780353 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25709))))

(declare-fun mapNonEmpty!46175 () Bool)

(declare-fun mapRes!46175 () Bool)

(declare-fun tp!87818 () Bool)

(declare-fun e!667917 () Bool)

(assert (=> mapNonEmpty!46175 (= mapRes!46175 (and tp!87818 e!667917))))

(declare-datatypes ((V!44547 0))(
  ( (V!44548 (val!14839 Int)) )
))
(declare-datatypes ((ValueCell!14073 0))(
  ( (ValueCellFull!14073 (v!17477 V!44547)) (EmptyCell!14073) )
))
(declare-fun mapRest!46175 () (Array (_ BitVec 32) ValueCell!14073))

(declare-fun mapKey!46175 () (_ BitVec 32))

(declare-datatypes ((array!75943 0))(
  ( (array!75944 (arr!36621 (Array (_ BitVec 32) ValueCell!14073)) (size!37157 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75943)

(declare-fun mapValue!46175 () ValueCell!14073)

(assert (=> mapNonEmpty!46175 (= (arr!36621 _values!996) (store mapRest!46175 mapKey!46175 mapValue!46175))))

(declare-fun b!1175031 () Bool)

(declare-fun e!667909 () Bool)

(assert (=> b!1175031 (= e!667909 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175032 () Bool)

(declare-fun e!667916 () Bool)

(declare-fun e!667911 () Bool)

(assert (=> b!1175032 (= e!667916 e!667911)))

(declare-fun res!780357 () Bool)

(assert (=> b!1175032 (=> res!780357 e!667911)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175032 (= res!780357 (not (validKeyInArray!0 (select (arr!36620 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18974 0))(
  ( (tuple2!18975 (_1!9498 (_ BitVec 64)) (_2!9498 V!44547)) )
))
(declare-datatypes ((List!25713 0))(
  ( (Nil!25710) (Cons!25709 (h!26918 tuple2!18974) (t!37740 List!25713)) )
))
(declare-datatypes ((ListLongMap!16943 0))(
  ( (ListLongMap!16944 (toList!8487 List!25713)) )
))
(declare-fun lt!530015 () ListLongMap!16943)

(declare-fun lt!530010 () ListLongMap!16943)

(assert (=> b!1175032 (= lt!530015 lt!530010)))

(declare-fun lt!530004 () ListLongMap!16943)

(declare-fun -!1543 (ListLongMap!16943 (_ BitVec 64)) ListLongMap!16943)

(assert (=> b!1175032 (= lt!530010 (-!1543 lt!530004 k0!934))))

(declare-fun zeroValue!944 () V!44547)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!530008 () array!75941)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!44547)

(declare-fun lt!530005 () array!75943)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4947 (array!75941 array!75943 (_ BitVec 32) (_ BitVec 32) V!44547 V!44547 (_ BitVec 32) Int) ListLongMap!16943)

(assert (=> b!1175032 (= lt!530015 (getCurrentListMapNoExtraKeys!4947 lt!530008 lt!530005 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1175032 (= lt!530004 (getCurrentListMapNoExtraKeys!4947 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530011 () Unit!38777)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!770 (array!75941 array!75943 (_ BitVec 32) (_ BitVec 32) V!44547 V!44547 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38777)

(assert (=> b!1175032 (= lt!530011 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!770 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1175033 () Bool)

(declare-fun e!667910 () Bool)

(assert (=> b!1175033 (= e!667910 e!667909)))

(declare-fun res!780360 () Bool)

(assert (=> b!1175033 (=> res!780360 e!667909)))

(assert (=> b!1175033 (= res!780360 (not (= (select (arr!36620 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1175034 () Bool)

(declare-fun tp_is_empty!29565 () Bool)

(assert (=> b!1175034 (= e!667917 tp_is_empty!29565)))

(declare-fun b!1175035 () Bool)

(declare-fun res!780347 () Bool)

(assert (=> b!1175035 (=> (not res!780347) (not e!667908))))

(assert (=> b!1175035 (= res!780347 (validKeyInArray!0 k0!934))))

(declare-fun b!1175036 () Bool)

(declare-fun e!667907 () Bool)

(declare-fun e!667914 () Bool)

(assert (=> b!1175036 (= e!667907 (and e!667914 mapRes!46175))))

(declare-fun condMapEmpty!46175 () Bool)

(declare-fun mapDefault!46175 () ValueCell!14073)

(assert (=> b!1175036 (= condMapEmpty!46175 (= (arr!36621 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14073)) mapDefault!46175)))))

(declare-fun b!1175038 () Bool)

(declare-fun res!780355 () Bool)

(declare-fun e!667915 () Bool)

(assert (=> b!1175038 (=> (not res!780355) (not e!667915))))

(assert (=> b!1175038 (= res!780355 (arrayNoDuplicates!0 lt!530008 #b00000000000000000000000000000000 Nil!25709))))

(declare-fun b!1175039 () Bool)

(declare-fun res!780349 () Bool)

(assert (=> b!1175039 (=> (not res!780349) (not e!667908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175039 (= res!780349 (validMask!0 mask!1564))))

(declare-fun b!1175040 () Bool)

(declare-fun e!667913 () Bool)

(assert (=> b!1175040 (= e!667915 (not e!667913))))

(declare-fun res!780358 () Bool)

(assert (=> b!1175040 (=> res!780358 e!667913)))

(assert (=> b!1175040 (= res!780358 (bvsgt from!1455 i!673))))

(assert (=> b!1175040 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530016 () Unit!38777)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75941 (_ BitVec 64) (_ BitVec 32)) Unit!38777)

(assert (=> b!1175040 (= lt!530016 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175041 () Bool)

(assert (=> b!1175041 (= e!667908 e!667915)))

(declare-fun res!780354 () Bool)

(assert (=> b!1175041 (=> (not res!780354) (not e!667915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75941 (_ BitVec 32)) Bool)

(assert (=> b!1175041 (= res!780354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530008 mask!1564))))

(assert (=> b!1175041 (= lt!530008 (array!75942 (store (arr!36620 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37156 _keys!1208)))))

(declare-fun b!1175042 () Bool)

(declare-fun res!780350 () Bool)

(assert (=> b!1175042 (=> (not res!780350) (not e!667908))))

(assert (=> b!1175042 (= res!780350 (and (= (size!37157 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37156 _keys!1208) (size!37157 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175043 () Bool)

(declare-fun res!780356 () Bool)

(assert (=> b!1175043 (=> (not res!780356) (not e!667908))))

(assert (=> b!1175043 (= res!780356 (= (select (arr!36620 _keys!1208) i!673) k0!934))))

(declare-fun b!1175044 () Bool)

(declare-fun res!780359 () Bool)

(assert (=> b!1175044 (=> (not res!780359) (not e!667908))))

(assert (=> b!1175044 (= res!780359 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37156 _keys!1208))))))

(declare-fun b!1175045 () Bool)

(assert (=> b!1175045 (= e!667911 true)))

(assert (=> b!1175045 (not (= (select (arr!36620 _keys!1208) from!1455) k0!934))))

(declare-fun lt!530014 () Unit!38777)

(assert (=> b!1175045 (= lt!530014 e!667918)))

(declare-fun c!116676 () Bool)

(assert (=> b!1175045 (= c!116676 (= (select (arr!36620 _keys!1208) from!1455) k0!934))))

(assert (=> b!1175045 e!667910))

(declare-fun res!780361 () Bool)

(assert (=> b!1175045 (=> (not res!780361) (not e!667910))))

(declare-fun lt!530013 () ListLongMap!16943)

(declare-fun lt!530006 () V!44547)

(declare-fun +!3803 (ListLongMap!16943 tuple2!18974) ListLongMap!16943)

(declare-fun get!18695 (ValueCell!14073 V!44547) V!44547)

(assert (=> b!1175045 (= res!780361 (= lt!530013 (+!3803 lt!530010 (tuple2!18975 (select (arr!36620 _keys!1208) from!1455) (get!18695 (select (arr!36621 _values!996) from!1455) lt!530006)))))))

(declare-fun b!1175046 () Bool)

(declare-fun Unit!38780 () Unit!38777)

(assert (=> b!1175046 (= e!667918 Unit!38780)))

(declare-fun b!1175047 () Bool)

(assert (=> b!1175047 (= e!667914 tp_is_empty!29565)))

(declare-fun mapIsEmpty!46175 () Bool)

(assert (=> mapIsEmpty!46175 mapRes!46175))

(declare-fun b!1175048 () Bool)

(assert (=> b!1175048 (= e!667913 e!667916)))

(declare-fun res!780348 () Bool)

(assert (=> b!1175048 (=> res!780348 e!667916)))

(assert (=> b!1175048 (= res!780348 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1175048 (= lt!530013 (getCurrentListMapNoExtraKeys!4947 lt!530008 lt!530005 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1175048 (= lt!530005 (array!75944 (store (arr!36621 _values!996) i!673 (ValueCellFull!14073 lt!530006)) (size!37157 _values!996)))))

(declare-fun dynLambda!2915 (Int (_ BitVec 64)) V!44547)

(assert (=> b!1175048 (= lt!530006 (dynLambda!2915 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530007 () ListLongMap!16943)

(assert (=> b!1175048 (= lt!530007 (getCurrentListMapNoExtraKeys!4947 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175037 () Bool)

(declare-fun res!780351 () Bool)

(assert (=> b!1175037 (=> (not res!780351) (not e!667908))))

(assert (=> b!1175037 (= res!780351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!780352 () Bool)

(assert (=> start!99456 (=> (not res!780352) (not e!667908))))

(assert (=> start!99456 (= res!780352 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37156 _keys!1208))))))

(assert (=> start!99456 e!667908))

(assert (=> start!99456 tp_is_empty!29565))

(declare-fun array_inv!27976 (array!75941) Bool)

(assert (=> start!99456 (array_inv!27976 _keys!1208)))

(assert (=> start!99456 true))

(assert (=> start!99456 tp!87819))

(declare-fun array_inv!27977 (array!75943) Bool)

(assert (=> start!99456 (and (array_inv!27977 _values!996) e!667907)))

(assert (= (and start!99456 res!780352) b!1175039))

(assert (= (and b!1175039 res!780349) b!1175042))

(assert (= (and b!1175042 res!780350) b!1175037))

(assert (= (and b!1175037 res!780351) b!1175030))

(assert (= (and b!1175030 res!780353) b!1175044))

(assert (= (and b!1175044 res!780359) b!1175035))

(assert (= (and b!1175035 res!780347) b!1175043))

(assert (= (and b!1175043 res!780356) b!1175041))

(assert (= (and b!1175041 res!780354) b!1175038))

(assert (= (and b!1175038 res!780355) b!1175040))

(assert (= (and b!1175040 (not res!780358)) b!1175048))

(assert (= (and b!1175048 (not res!780348)) b!1175032))

(assert (= (and b!1175032 (not res!780357)) b!1175045))

(assert (= (and b!1175045 res!780361) b!1175033))

(assert (= (and b!1175033 (not res!780360)) b!1175031))

(assert (= (and b!1175045 c!116676) b!1175029))

(assert (= (and b!1175045 (not c!116676)) b!1175046))

(assert (= (and b!1175036 condMapEmpty!46175) mapIsEmpty!46175))

(assert (= (and b!1175036 (not condMapEmpty!46175)) mapNonEmpty!46175))

(get-info :version)

(assert (= (and mapNonEmpty!46175 ((_ is ValueCellFull!14073) mapValue!46175)) b!1175034))

(assert (= (and b!1175036 ((_ is ValueCellFull!14073) mapDefault!46175)) b!1175047))

(assert (= start!99456 b!1175036))

(declare-fun b_lambda!20179 () Bool)

(assert (=> (not b_lambda!20179) (not b!1175048)))

(declare-fun t!37738 () Bool)

(declare-fun tb!9847 () Bool)

(assert (=> (and start!99456 (= defaultEntry!1004 defaultEntry!1004) t!37738) tb!9847))

(declare-fun result!20261 () Bool)

(assert (=> tb!9847 (= result!20261 tp_is_empty!29565)))

(assert (=> b!1175048 t!37738))

(declare-fun b_and!40939 () Bool)

(assert (= b_and!40937 (and (=> t!37738 result!20261) b_and!40939)))

(declare-fun m!1082923 () Bool)

(assert (=> b!1175033 m!1082923))

(declare-fun m!1082925 () Bool)

(assert (=> b!1175030 m!1082925))

(assert (=> b!1175045 m!1082923))

(declare-fun m!1082927 () Bool)

(assert (=> b!1175045 m!1082927))

(assert (=> b!1175045 m!1082927))

(declare-fun m!1082929 () Bool)

(assert (=> b!1175045 m!1082929))

(declare-fun m!1082931 () Bool)

(assert (=> b!1175045 m!1082931))

(declare-fun m!1082933 () Bool)

(assert (=> mapNonEmpty!46175 m!1082933))

(declare-fun m!1082935 () Bool)

(assert (=> b!1175037 m!1082935))

(declare-fun m!1082937 () Bool)

(assert (=> b!1175039 m!1082937))

(declare-fun m!1082939 () Bool)

(assert (=> b!1175043 m!1082939))

(declare-fun m!1082941 () Bool)

(assert (=> b!1175040 m!1082941))

(declare-fun m!1082943 () Bool)

(assert (=> b!1175040 m!1082943))

(declare-fun m!1082945 () Bool)

(assert (=> b!1175032 m!1082945))

(declare-fun m!1082947 () Bool)

(assert (=> b!1175032 m!1082947))

(declare-fun m!1082949 () Bool)

(assert (=> b!1175032 m!1082949))

(assert (=> b!1175032 m!1082923))

(declare-fun m!1082951 () Bool)

(assert (=> b!1175032 m!1082951))

(assert (=> b!1175032 m!1082923))

(declare-fun m!1082953 () Bool)

(assert (=> b!1175032 m!1082953))

(declare-fun m!1082955 () Bool)

(assert (=> b!1175048 m!1082955))

(declare-fun m!1082957 () Bool)

(assert (=> b!1175048 m!1082957))

(declare-fun m!1082959 () Bool)

(assert (=> b!1175048 m!1082959))

(declare-fun m!1082961 () Bool)

(assert (=> b!1175048 m!1082961))

(declare-fun m!1082963 () Bool)

(assert (=> b!1175029 m!1082963))

(declare-fun m!1082965 () Bool)

(assert (=> b!1175029 m!1082965))

(declare-fun m!1082967 () Bool)

(assert (=> b!1175029 m!1082967))

(declare-fun m!1082969 () Bool)

(assert (=> b!1175029 m!1082969))

(declare-fun m!1082971 () Bool)

(assert (=> b!1175029 m!1082971))

(declare-fun m!1082973 () Bool)

(assert (=> b!1175038 m!1082973))

(declare-fun m!1082975 () Bool)

(assert (=> b!1175041 m!1082975))

(declare-fun m!1082977 () Bool)

(assert (=> b!1175041 m!1082977))

(declare-fun m!1082979 () Bool)

(assert (=> start!99456 m!1082979))

(declare-fun m!1082981 () Bool)

(assert (=> start!99456 m!1082981))

(declare-fun m!1082983 () Bool)

(assert (=> b!1175035 m!1082983))

(declare-fun m!1082985 () Bool)

(assert (=> b!1175031 m!1082985))

(check-sat (not b!1175037) (not b!1175030) (not b!1175029) (not start!99456) (not b!1175039) (not b!1175048) (not b!1175032) (not mapNonEmpty!46175) (not b!1175040) (not b!1175038) (not b!1175031) tp_is_empty!29565 (not b!1175045) b_and!40939 (not b_lambda!20179) (not b!1175041) (not b!1175035) (not b_next!25035))
(check-sat b_and!40939 (not b_next!25035))
