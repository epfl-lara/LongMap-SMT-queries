; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99202 () Bool)

(assert start!99202)

(declare-fun b_free!24807 () Bool)

(declare-fun b_next!24807 () Bool)

(assert (=> start!99202 (= b_free!24807 (not b_next!24807))))

(declare-fun tp!87132 () Bool)

(declare-fun b_and!40463 () Bool)

(assert (=> start!99202 (= tp!87132 b_and!40463)))

(declare-fun b!1168018 () Bool)

(declare-fun res!774911 () Bool)

(declare-fun e!663848 () Bool)

(assert (=> b!1168018 (=> (not res!774911) (not e!663848))))

(declare-datatypes ((array!75497 0))(
  ( (array!75498 (arr!36399 (Array (_ BitVec 32) (_ BitVec 64))) (size!36935 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75497)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1168018 (= res!774911 (= (select (arr!36399 _keys!1208) i!673) k0!934))))

(declare-fun b!1168019 () Bool)

(declare-fun res!774908 () Bool)

(assert (=> b!1168019 (=> (not res!774908) (not e!663848))))

(assert (=> b!1168019 (= res!774908 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36935 _keys!1208))))))

(declare-fun b!1168020 () Bool)

(declare-fun e!663847 () Bool)

(assert (=> b!1168020 (= e!663848 e!663847)))

(declare-fun res!774906 () Bool)

(assert (=> b!1168020 (=> (not res!774906) (not e!663847))))

(declare-fun lt!525858 () array!75497)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75497 (_ BitVec 32)) Bool)

(assert (=> b!1168020 (= res!774906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525858 mask!1564))))

(assert (=> b!1168020 (= lt!525858 (array!75498 (store (arr!36399 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36935 _keys!1208)))))

(declare-fun b!1168021 () Bool)

(declare-fun res!774904 () Bool)

(assert (=> b!1168021 (=> (not res!774904) (not e!663848))))

(declare-datatypes ((List!25528 0))(
  ( (Nil!25525) (Cons!25524 (h!26733 (_ BitVec 64)) (t!37327 List!25528)) )
))
(declare-fun arrayNoDuplicates!0 (array!75497 (_ BitVec 32) List!25528) Bool)

(assert (=> b!1168021 (= res!774904 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25525))))

(declare-fun b!1168022 () Bool)

(declare-fun res!774907 () Bool)

(assert (=> b!1168022 (=> (not res!774907) (not e!663848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168022 (= res!774907 (validMask!0 mask!1564))))

(declare-fun b!1168023 () Bool)

(declare-fun e!663845 () Bool)

(declare-fun e!663849 () Bool)

(assert (=> b!1168023 (= e!663845 e!663849)))

(declare-fun res!774910 () Bool)

(assert (=> b!1168023 (=> res!774910 e!663849)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1168023 (= res!774910 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44243 0))(
  ( (V!44244 (val!14725 Int)) )
))
(declare-fun zeroValue!944 () V!44243)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18788 0))(
  ( (tuple2!18789 (_1!9405 (_ BitVec 64)) (_2!9405 V!44243)) )
))
(declare-datatypes ((List!25529 0))(
  ( (Nil!25526) (Cons!25525 (h!26734 tuple2!18788) (t!37328 List!25529)) )
))
(declare-datatypes ((ListLongMap!16757 0))(
  ( (ListLongMap!16758 (toList!8394 List!25529)) )
))
(declare-fun lt!525856 () ListLongMap!16757)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13959 0))(
  ( (ValueCellFull!13959 (v!17362 V!44243)) (EmptyCell!13959) )
))
(declare-datatypes ((array!75499 0))(
  ( (array!75500 (arr!36400 (Array (_ BitVec 32) ValueCell!13959)) (size!36936 (_ BitVec 32))) )
))
(declare-fun lt!525860 () array!75499)

(declare-fun minValue!944 () V!44243)

(declare-fun getCurrentListMapNoExtraKeys!4858 (array!75497 array!75499 (_ BitVec 32) (_ BitVec 32) V!44243 V!44243 (_ BitVec 32) Int) ListLongMap!16757)

(assert (=> b!1168023 (= lt!525856 (getCurrentListMapNoExtraKeys!4858 lt!525858 lt!525860 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75499)

(declare-fun dynLambda!2839 (Int (_ BitVec 64)) V!44243)

(assert (=> b!1168023 (= lt!525860 (array!75500 (store (arr!36400 _values!996) i!673 (ValueCellFull!13959 (dynLambda!2839 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36936 _values!996)))))

(declare-fun lt!525859 () ListLongMap!16757)

(assert (=> b!1168023 (= lt!525859 (getCurrentListMapNoExtraKeys!4858 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168024 () Bool)

(declare-fun res!774900 () Bool)

(assert (=> b!1168024 (=> (not res!774900) (not e!663848))))

(assert (=> b!1168024 (= res!774900 (and (= (size!36936 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36935 _keys!1208) (size!36936 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168025 () Bool)

(assert (=> b!1168025 (= e!663849 true)))

(declare-fun -!1469 (ListLongMap!16757 (_ BitVec 64)) ListLongMap!16757)

(assert (=> b!1168025 (= (getCurrentListMapNoExtraKeys!4858 lt!525858 lt!525860 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1469 (getCurrentListMapNoExtraKeys!4858 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38540 0))(
  ( (Unit!38541) )
))
(declare-fun lt!525861 () Unit!38540)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!696 (array!75497 array!75499 (_ BitVec 32) (_ BitVec 32) V!44243 V!44243 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38540)

(assert (=> b!1168025 (= lt!525861 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!696 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168026 () Bool)

(declare-fun e!663842 () Bool)

(declare-fun tp_is_empty!29337 () Bool)

(assert (=> b!1168026 (= e!663842 tp_is_empty!29337)))

(declare-fun b!1168027 () Bool)

(declare-fun e!663846 () Bool)

(declare-fun mapRes!45830 () Bool)

(assert (=> b!1168027 (= e!663846 (and e!663842 mapRes!45830))))

(declare-fun condMapEmpty!45830 () Bool)

(declare-fun mapDefault!45830 () ValueCell!13959)

(assert (=> b!1168027 (= condMapEmpty!45830 (= (arr!36400 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13959)) mapDefault!45830)))))

(declare-fun b!1168028 () Bool)

(declare-fun res!774909 () Bool)

(assert (=> b!1168028 (=> (not res!774909) (not e!663847))))

(assert (=> b!1168028 (= res!774909 (arrayNoDuplicates!0 lt!525858 #b00000000000000000000000000000000 Nil!25525))))

(declare-fun mapNonEmpty!45830 () Bool)

(declare-fun tp!87131 () Bool)

(declare-fun e!663844 () Bool)

(assert (=> mapNonEmpty!45830 (= mapRes!45830 (and tp!87131 e!663844))))

(declare-fun mapValue!45830 () ValueCell!13959)

(declare-fun mapKey!45830 () (_ BitVec 32))

(declare-fun mapRest!45830 () (Array (_ BitVec 32) ValueCell!13959))

(assert (=> mapNonEmpty!45830 (= (arr!36400 _values!996) (store mapRest!45830 mapKey!45830 mapValue!45830))))

(declare-fun res!774905 () Bool)

(assert (=> start!99202 (=> (not res!774905) (not e!663848))))

(assert (=> start!99202 (= res!774905 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36935 _keys!1208))))))

(assert (=> start!99202 e!663848))

(assert (=> start!99202 tp_is_empty!29337))

(declare-fun array_inv!27824 (array!75497) Bool)

(assert (=> start!99202 (array_inv!27824 _keys!1208)))

(assert (=> start!99202 true))

(assert (=> start!99202 tp!87132))

(declare-fun array_inv!27825 (array!75499) Bool)

(assert (=> start!99202 (and (array_inv!27825 _values!996) e!663846)))

(declare-fun mapIsEmpty!45830 () Bool)

(assert (=> mapIsEmpty!45830 mapRes!45830))

(declare-fun b!1168029 () Bool)

(assert (=> b!1168029 (= e!663844 tp_is_empty!29337)))

(declare-fun b!1168030 () Bool)

(declare-fun res!774903 () Bool)

(assert (=> b!1168030 (=> (not res!774903) (not e!663848))))

(assert (=> b!1168030 (= res!774903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168031 () Bool)

(assert (=> b!1168031 (= e!663847 (not e!663845))))

(declare-fun res!774901 () Bool)

(assert (=> b!1168031 (=> res!774901 e!663845)))

(assert (=> b!1168031 (= res!774901 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168031 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525857 () Unit!38540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75497 (_ BitVec 64) (_ BitVec 32)) Unit!38540)

(assert (=> b!1168031 (= lt!525857 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1168032 () Bool)

(declare-fun res!774902 () Bool)

(assert (=> b!1168032 (=> (not res!774902) (not e!663848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168032 (= res!774902 (validKeyInArray!0 k0!934))))

(assert (= (and start!99202 res!774905) b!1168022))

(assert (= (and b!1168022 res!774907) b!1168024))

(assert (= (and b!1168024 res!774900) b!1168030))

(assert (= (and b!1168030 res!774903) b!1168021))

(assert (= (and b!1168021 res!774904) b!1168019))

(assert (= (and b!1168019 res!774908) b!1168032))

(assert (= (and b!1168032 res!774902) b!1168018))

(assert (= (and b!1168018 res!774911) b!1168020))

(assert (= (and b!1168020 res!774906) b!1168028))

(assert (= (and b!1168028 res!774909) b!1168031))

(assert (= (and b!1168031 (not res!774901)) b!1168023))

(assert (= (and b!1168023 (not res!774910)) b!1168025))

(assert (= (and b!1168027 condMapEmpty!45830) mapIsEmpty!45830))

(assert (= (and b!1168027 (not condMapEmpty!45830)) mapNonEmpty!45830))

(get-info :version)

(assert (= (and mapNonEmpty!45830 ((_ is ValueCellFull!13959) mapValue!45830)) b!1168029))

(assert (= (and b!1168027 ((_ is ValueCellFull!13959) mapDefault!45830)) b!1168026))

(assert (= start!99202 b!1168027))

(declare-fun b_lambda!19913 () Bool)

(assert (=> (not b_lambda!19913) (not b!1168023)))

(declare-fun t!37326 () Bool)

(declare-fun tb!9619 () Bool)

(assert (=> (and start!99202 (= defaultEntry!1004 defaultEntry!1004) t!37326) tb!9619))

(declare-fun result!19803 () Bool)

(assert (=> tb!9619 (= result!19803 tp_is_empty!29337)))

(assert (=> b!1168023 t!37326))

(declare-fun b_and!40465 () Bool)

(assert (= b_and!40463 (and (=> t!37326 result!19803) b_and!40465)))

(declare-fun m!1075889 () Bool)

(assert (=> b!1168030 m!1075889))

(declare-fun m!1075891 () Bool)

(assert (=> b!1168025 m!1075891))

(declare-fun m!1075893 () Bool)

(assert (=> b!1168025 m!1075893))

(assert (=> b!1168025 m!1075893))

(declare-fun m!1075895 () Bool)

(assert (=> b!1168025 m!1075895))

(declare-fun m!1075897 () Bool)

(assert (=> b!1168025 m!1075897))

(declare-fun m!1075899 () Bool)

(assert (=> b!1168028 m!1075899))

(declare-fun m!1075901 () Bool)

(assert (=> b!1168018 m!1075901))

(declare-fun m!1075903 () Bool)

(assert (=> b!1168031 m!1075903))

(declare-fun m!1075905 () Bool)

(assert (=> b!1168031 m!1075905))

(declare-fun m!1075907 () Bool)

(assert (=> start!99202 m!1075907))

(declare-fun m!1075909 () Bool)

(assert (=> start!99202 m!1075909))

(declare-fun m!1075911 () Bool)

(assert (=> b!1168032 m!1075911))

(declare-fun m!1075913 () Bool)

(assert (=> b!1168020 m!1075913))

(declare-fun m!1075915 () Bool)

(assert (=> b!1168020 m!1075915))

(declare-fun m!1075917 () Bool)

(assert (=> mapNonEmpty!45830 m!1075917))

(declare-fun m!1075919 () Bool)

(assert (=> b!1168023 m!1075919))

(declare-fun m!1075921 () Bool)

(assert (=> b!1168023 m!1075921))

(declare-fun m!1075923 () Bool)

(assert (=> b!1168023 m!1075923))

(declare-fun m!1075925 () Bool)

(assert (=> b!1168023 m!1075925))

(declare-fun m!1075927 () Bool)

(assert (=> b!1168021 m!1075927))

(declare-fun m!1075929 () Bool)

(assert (=> b!1168022 m!1075929))

(check-sat (not b!1168021) (not b!1168032) (not start!99202) (not b!1168030) (not b!1168022) tp_is_empty!29337 (not b_lambda!19913) (not mapNonEmpty!45830) (not b!1168023) (not b!1168031) b_and!40465 (not b!1168020) (not b!1168028) (not b!1168025) (not b_next!24807))
(check-sat b_and!40465 (not b_next!24807))
