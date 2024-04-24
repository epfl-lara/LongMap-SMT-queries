; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99678 () Bool)

(assert start!99678)

(declare-fun b_free!25021 () Bool)

(declare-fun b_next!25021 () Bool)

(assert (=> start!99678 (= b_free!25021 (not b_next!25021))))

(declare-fun tp!87777 () Bool)

(declare-fun b_and!40911 () Bool)

(assert (=> start!99678 (= tp!87777 b_and!40911)))

(declare-fun b!1175884 () Bool)

(declare-fun res!780540 () Bool)

(declare-fun e!668490 () Bool)

(assert (=> b!1175884 (=> (not res!780540) (not e!668490))))

(declare-datatypes ((array!75967 0))(
  ( (array!75968 (arr!36627 (Array (_ BitVec 32) (_ BitVec 64))) (size!37164 (_ BitVec 32))) )
))
(declare-fun lt!530203 () array!75967)

(declare-datatypes ((List!25737 0))(
  ( (Nil!25734) (Cons!25733 (h!26951 (_ BitVec 64)) (t!37742 List!25737)) )
))
(declare-fun arrayNoDuplicates!0 (array!75967 (_ BitVec 32) List!25737) Bool)

(assert (=> b!1175884 (= res!780540 (arrayNoDuplicates!0 lt!530203 #b00000000000000000000000000000000 Nil!25734))))

(declare-fun b!1175885 () Bool)

(declare-fun e!668493 () Bool)

(assert (=> b!1175885 (= e!668493 e!668490)))

(declare-fun res!780548 () Bool)

(assert (=> b!1175885 (=> (not res!780548) (not e!668490))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75967 (_ BitVec 32)) Bool)

(assert (=> b!1175885 (= res!780548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530203 mask!1564))))

(declare-fun _keys!1208 () array!75967)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1175885 (= lt!530203 (array!75968 (store (arr!36627 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37164 _keys!1208)))))

(declare-fun b!1175886 () Bool)

(declare-datatypes ((Unit!38744 0))(
  ( (Unit!38745) )
))
(declare-fun e!668494 () Unit!38744)

(declare-fun Unit!38746 () Unit!38744)

(assert (=> b!1175886 (= e!668494 Unit!38746)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!530204 () Unit!38744)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75967 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38744)

(assert (=> b!1175886 (= lt!530204 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175886 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530195 () Unit!38744)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75967 (_ BitVec 32) (_ BitVec 32)) Unit!38744)

(assert (=> b!1175886 (= lt!530195 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1175886 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25734)))

(declare-fun lt!530198 () Unit!38744)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75967 (_ BitVec 64) (_ BitVec 32) List!25737) Unit!38744)

(assert (=> b!1175886 (= lt!530198 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25734))))

(assert (=> b!1175886 false))

(declare-fun b!1175887 () Bool)

(declare-fun res!780544 () Bool)

(assert (=> b!1175887 (=> (not res!780544) (not e!668493))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44529 0))(
  ( (V!44530 (val!14832 Int)) )
))
(declare-datatypes ((ValueCell!14066 0))(
  ( (ValueCellFull!14066 (v!17466 V!44529)) (EmptyCell!14066) )
))
(declare-datatypes ((array!75969 0))(
  ( (array!75970 (arr!36628 (Array (_ BitVec 32) ValueCell!14066)) (size!37165 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75969)

(assert (=> b!1175887 (= res!780544 (and (= (size!37165 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37164 _keys!1208) (size!37165 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175888 () Bool)

(declare-fun e!668495 () Bool)

(declare-fun e!668492 () Bool)

(assert (=> b!1175888 (= e!668495 e!668492)))

(declare-fun res!780549 () Bool)

(assert (=> b!1175888 (=> res!780549 e!668492)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175888 (= res!780549 (not (validKeyInArray!0 (select (arr!36627 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19002 0))(
  ( (tuple2!19003 (_1!9512 (_ BitVec 64)) (_2!9512 V!44529)) )
))
(declare-datatypes ((List!25738 0))(
  ( (Nil!25735) (Cons!25734 (h!26952 tuple2!19002) (t!37743 List!25738)) )
))
(declare-datatypes ((ListLongMap!16979 0))(
  ( (ListLongMap!16980 (toList!8505 List!25738)) )
))
(declare-fun lt!530193 () ListLongMap!16979)

(declare-fun lt!530200 () ListLongMap!16979)

(assert (=> b!1175888 (= lt!530193 lt!530200)))

(declare-fun lt!530206 () ListLongMap!16979)

(declare-fun -!1548 (ListLongMap!16979 (_ BitVec 64)) ListLongMap!16979)

(assert (=> b!1175888 (= lt!530200 (-!1548 lt!530206 k0!934))))

(declare-fun zeroValue!944 () V!44529)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530202 () array!75969)

(declare-fun minValue!944 () V!44529)

(declare-fun getCurrentListMapNoExtraKeys!4988 (array!75967 array!75969 (_ BitVec 32) (_ BitVec 32) V!44529 V!44529 (_ BitVec 32) Int) ListLongMap!16979)

(assert (=> b!1175888 (= lt!530193 (getCurrentListMapNoExtraKeys!4988 lt!530203 lt!530202 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1175888 (= lt!530206 (getCurrentListMapNoExtraKeys!4988 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530201 () Unit!38744)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!773 (array!75967 array!75969 (_ BitVec 32) (_ BitVec 32) V!44529 V!44529 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38744)

(assert (=> b!1175888 (= lt!530201 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!773 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1175889 () Bool)

(declare-fun res!780553 () Bool)

(assert (=> b!1175889 (=> (not res!780553) (not e!668493))))

(assert (=> b!1175889 (= res!780553 (= (select (arr!36627 _keys!1208) i!673) k0!934))))

(declare-fun b!1175890 () Bool)

(declare-fun e!668488 () Bool)

(declare-fun e!668498 () Bool)

(assert (=> b!1175890 (= e!668488 e!668498)))

(declare-fun res!780546 () Bool)

(assert (=> b!1175890 (=> res!780546 e!668498)))

(assert (=> b!1175890 (= res!780546 (not (= (select (arr!36627 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1175891 () Bool)

(declare-fun e!668497 () Bool)

(assert (=> b!1175891 (= e!668497 e!668495)))

(declare-fun res!780554 () Bool)

(assert (=> b!1175891 (=> res!780554 e!668495)))

(assert (=> b!1175891 (= res!780554 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!530194 () ListLongMap!16979)

(assert (=> b!1175891 (= lt!530194 (getCurrentListMapNoExtraKeys!4988 lt!530203 lt!530202 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!530205 () V!44529)

(assert (=> b!1175891 (= lt!530202 (array!75970 (store (arr!36628 _values!996) i!673 (ValueCellFull!14066 lt!530205)) (size!37165 _values!996)))))

(declare-fun dynLambda!2966 (Int (_ BitVec 64)) V!44529)

(assert (=> b!1175891 (= lt!530205 (dynLambda!2966 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530199 () ListLongMap!16979)

(assert (=> b!1175891 (= lt!530199 (getCurrentListMapNoExtraKeys!4988 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175892 () Bool)

(declare-fun res!780543 () Bool)

(assert (=> b!1175892 (=> (not res!780543) (not e!668493))))

(assert (=> b!1175892 (= res!780543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175893 () Bool)

(declare-fun res!780551 () Bool)

(assert (=> b!1175893 (=> (not res!780551) (not e!668493))))

(assert (=> b!1175893 (= res!780551 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25734))))

(declare-fun b!1175895 () Bool)

(declare-fun res!780541 () Bool)

(assert (=> b!1175895 (=> (not res!780541) (not e!668493))))

(assert (=> b!1175895 (= res!780541 (validKeyInArray!0 k0!934))))

(declare-fun b!1175896 () Bool)

(declare-fun Unit!38747 () Unit!38744)

(assert (=> b!1175896 (= e!668494 Unit!38747)))

(declare-fun b!1175897 () Bool)

(declare-fun e!668496 () Bool)

(declare-fun tp_is_empty!29551 () Bool)

(assert (=> b!1175897 (= e!668496 tp_is_empty!29551)))

(declare-fun b!1175898 () Bool)

(assert (=> b!1175898 (= e!668492 true)))

(assert (=> b!1175898 (not (= (select (arr!36627 _keys!1208) from!1455) k0!934))))

(declare-fun lt!530196 () Unit!38744)

(assert (=> b!1175898 (= lt!530196 e!668494)))

(declare-fun c!117053 () Bool)

(assert (=> b!1175898 (= c!117053 (= (select (arr!36627 _keys!1208) from!1455) k0!934))))

(assert (=> b!1175898 e!668488))

(declare-fun res!780552 () Bool)

(assert (=> b!1175898 (=> (not res!780552) (not e!668488))))

(declare-fun +!3837 (ListLongMap!16979 tuple2!19002) ListLongMap!16979)

(declare-fun get!18729 (ValueCell!14066 V!44529) V!44529)

(assert (=> b!1175898 (= res!780552 (= lt!530194 (+!3837 lt!530200 (tuple2!19003 (select (arr!36627 _keys!1208) from!1455) (get!18729 (select (arr!36628 _values!996) from!1455) lt!530205)))))))

(declare-fun b!1175899 () Bool)

(declare-fun res!780545 () Bool)

(assert (=> b!1175899 (=> (not res!780545) (not e!668493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175899 (= res!780545 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46154 () Bool)

(declare-fun mapRes!46154 () Bool)

(assert (=> mapIsEmpty!46154 mapRes!46154))

(declare-fun mapNonEmpty!46154 () Bool)

(declare-fun tp!87776 () Bool)

(declare-fun e!668489 () Bool)

(assert (=> mapNonEmpty!46154 (= mapRes!46154 (and tp!87776 e!668489))))

(declare-fun mapRest!46154 () (Array (_ BitVec 32) ValueCell!14066))

(declare-fun mapValue!46154 () ValueCell!14066)

(declare-fun mapKey!46154 () (_ BitVec 32))

(assert (=> mapNonEmpty!46154 (= (arr!36628 _values!996) (store mapRest!46154 mapKey!46154 mapValue!46154))))

(declare-fun b!1175900 () Bool)

(declare-fun e!668487 () Bool)

(assert (=> b!1175900 (= e!668487 (and e!668496 mapRes!46154))))

(declare-fun condMapEmpty!46154 () Bool)

(declare-fun mapDefault!46154 () ValueCell!14066)

(assert (=> b!1175900 (= condMapEmpty!46154 (= (arr!36628 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14066)) mapDefault!46154)))))

(declare-fun b!1175901 () Bool)

(assert (=> b!1175901 (= e!668489 tp_is_empty!29551)))

(declare-fun b!1175902 () Bool)

(assert (=> b!1175902 (= e!668498 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175903 () Bool)

(declare-fun res!780547 () Bool)

(assert (=> b!1175903 (=> (not res!780547) (not e!668493))))

(assert (=> b!1175903 (= res!780547 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37164 _keys!1208))))))

(declare-fun res!780542 () Bool)

(assert (=> start!99678 (=> (not res!780542) (not e!668493))))

(assert (=> start!99678 (= res!780542 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37164 _keys!1208))))))

(assert (=> start!99678 e!668493))

(assert (=> start!99678 tp_is_empty!29551))

(declare-fun array_inv!28058 (array!75967) Bool)

(assert (=> start!99678 (array_inv!28058 _keys!1208)))

(assert (=> start!99678 true))

(assert (=> start!99678 tp!87777))

(declare-fun array_inv!28059 (array!75969) Bool)

(assert (=> start!99678 (and (array_inv!28059 _values!996) e!668487)))

(declare-fun b!1175894 () Bool)

(assert (=> b!1175894 (= e!668490 (not e!668497))))

(declare-fun res!780550 () Bool)

(assert (=> b!1175894 (=> res!780550 e!668497)))

(assert (=> b!1175894 (= res!780550 (bvsgt from!1455 i!673))))

(assert (=> b!1175894 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530197 () Unit!38744)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75967 (_ BitVec 64) (_ BitVec 32)) Unit!38744)

(assert (=> b!1175894 (= lt!530197 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99678 res!780542) b!1175899))

(assert (= (and b!1175899 res!780545) b!1175887))

(assert (= (and b!1175887 res!780544) b!1175892))

(assert (= (and b!1175892 res!780543) b!1175893))

(assert (= (and b!1175893 res!780551) b!1175903))

(assert (= (and b!1175903 res!780547) b!1175895))

(assert (= (and b!1175895 res!780541) b!1175889))

(assert (= (and b!1175889 res!780553) b!1175885))

(assert (= (and b!1175885 res!780548) b!1175884))

(assert (= (and b!1175884 res!780540) b!1175894))

(assert (= (and b!1175894 (not res!780550)) b!1175891))

(assert (= (and b!1175891 (not res!780554)) b!1175888))

(assert (= (and b!1175888 (not res!780549)) b!1175898))

(assert (= (and b!1175898 res!780552) b!1175890))

(assert (= (and b!1175890 (not res!780546)) b!1175902))

(assert (= (and b!1175898 c!117053) b!1175886))

(assert (= (and b!1175898 (not c!117053)) b!1175896))

(assert (= (and b!1175900 condMapEmpty!46154) mapIsEmpty!46154))

(assert (= (and b!1175900 (not condMapEmpty!46154)) mapNonEmpty!46154))

(get-info :version)

(assert (= (and mapNonEmpty!46154 ((_ is ValueCellFull!14066) mapValue!46154)) b!1175901))

(assert (= (and b!1175900 ((_ is ValueCellFull!14066) mapDefault!46154)) b!1175897))

(assert (= start!99678 b!1175900))

(declare-fun b_lambda!20159 () Bool)

(assert (=> (not b_lambda!20159) (not b!1175891)))

(declare-fun t!37741 () Bool)

(declare-fun tb!9825 () Bool)

(assert (=> (and start!99678 (= defaultEntry!1004 defaultEntry!1004) t!37741) tb!9825))

(declare-fun result!20225 () Bool)

(assert (=> tb!9825 (= result!20225 tp_is_empty!29551)))

(assert (=> b!1175891 t!37741))

(declare-fun b_and!40913 () Bool)

(assert (= b_and!40911 (and (=> t!37741 result!20225) b_and!40913)))

(declare-fun m!1084047 () Bool)

(assert (=> b!1175890 m!1084047))

(declare-fun m!1084049 () Bool)

(assert (=> b!1175902 m!1084049))

(declare-fun m!1084051 () Bool)

(assert (=> b!1175899 m!1084051))

(declare-fun m!1084053 () Bool)

(assert (=> b!1175892 m!1084053))

(declare-fun m!1084055 () Bool)

(assert (=> b!1175895 m!1084055))

(declare-fun m!1084057 () Bool)

(assert (=> mapNonEmpty!46154 m!1084057))

(declare-fun m!1084059 () Bool)

(assert (=> b!1175893 m!1084059))

(declare-fun m!1084061 () Bool)

(assert (=> b!1175889 m!1084061))

(declare-fun m!1084063 () Bool)

(assert (=> b!1175886 m!1084063))

(declare-fun m!1084065 () Bool)

(assert (=> b!1175886 m!1084065))

(declare-fun m!1084067 () Bool)

(assert (=> b!1175886 m!1084067))

(declare-fun m!1084069 () Bool)

(assert (=> b!1175886 m!1084069))

(declare-fun m!1084071 () Bool)

(assert (=> b!1175886 m!1084071))

(declare-fun m!1084073 () Bool)

(assert (=> b!1175894 m!1084073))

(declare-fun m!1084075 () Bool)

(assert (=> b!1175894 m!1084075))

(declare-fun m!1084077 () Bool)

(assert (=> start!99678 m!1084077))

(declare-fun m!1084079 () Bool)

(assert (=> start!99678 m!1084079))

(assert (=> b!1175898 m!1084047))

(declare-fun m!1084081 () Bool)

(assert (=> b!1175898 m!1084081))

(assert (=> b!1175898 m!1084081))

(declare-fun m!1084083 () Bool)

(assert (=> b!1175898 m!1084083))

(declare-fun m!1084085 () Bool)

(assert (=> b!1175898 m!1084085))

(declare-fun m!1084087 () Bool)

(assert (=> b!1175885 m!1084087))

(declare-fun m!1084089 () Bool)

(assert (=> b!1175885 m!1084089))

(declare-fun m!1084091 () Bool)

(assert (=> b!1175891 m!1084091))

(declare-fun m!1084093 () Bool)

(assert (=> b!1175891 m!1084093))

(declare-fun m!1084095 () Bool)

(assert (=> b!1175891 m!1084095))

(declare-fun m!1084097 () Bool)

(assert (=> b!1175891 m!1084097))

(declare-fun m!1084099 () Bool)

(assert (=> b!1175884 m!1084099))

(declare-fun m!1084101 () Bool)

(assert (=> b!1175888 m!1084101))

(declare-fun m!1084103 () Bool)

(assert (=> b!1175888 m!1084103))

(declare-fun m!1084105 () Bool)

(assert (=> b!1175888 m!1084105))

(assert (=> b!1175888 m!1084047))

(declare-fun m!1084107 () Bool)

(assert (=> b!1175888 m!1084107))

(declare-fun m!1084109 () Bool)

(assert (=> b!1175888 m!1084109))

(assert (=> b!1175888 m!1084047))

(check-sat (not b!1175899) (not b!1175892) (not b!1175893) (not b!1175886) (not b!1175898) (not b!1175888) (not b!1175884) (not b!1175891) (not b!1175895) (not start!99678) (not b!1175894) (not b_lambda!20159) (not b!1175902) b_and!40913 (not mapNonEmpty!46154) (not b!1175885) tp_is_empty!29551 (not b_next!25021))
(check-sat b_and!40913 (not b_next!25021))
