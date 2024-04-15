; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97886 () Bool)

(assert start!97886)

(declare-fun b_free!23593 () Bool)

(declare-fun b_next!23593 () Bool)

(assert (=> start!97886 (= b_free!23593 (not b_next!23593))))

(declare-fun tp!83483 () Bool)

(declare-fun b_and!37947 () Bool)

(assert (=> start!97886 (= tp!83483 b_and!37947)))

(declare-fun mapNonEmpty!44002 () Bool)

(declare-fun mapRes!44002 () Bool)

(declare-fun tp!83482 () Bool)

(declare-fun e!638246 () Bool)

(assert (=> mapNonEmpty!44002 (= mapRes!44002 (and tp!83482 e!638246))))

(declare-fun mapKey!44002 () (_ BitVec 32))

(declare-datatypes ((V!42625 0))(
  ( (V!42626 (val!14118 Int)) )
))
(declare-datatypes ((ValueCell!13352 0))(
  ( (ValueCellFull!13352 (v!16750 V!42625)) (EmptyCell!13352) )
))
(declare-fun mapRest!44002 () (Array (_ BitVec 32) ValueCell!13352))

(declare-datatypes ((array!73040 0))(
  ( (array!73041 (arr!35173 (Array (_ BitVec 32) ValueCell!13352)) (size!35711 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73040)

(declare-fun mapValue!44002 () ValueCell!13352)

(assert (=> mapNonEmpty!44002 (= (arr!35173 _values!996) (store mapRest!44002 mapKey!44002 mapValue!44002))))

(declare-fun b!1120929 () Bool)

(declare-fun res!748868 () Bool)

(declare-fun e!638241 () Bool)

(assert (=> b!1120929 (=> (not res!748868) (not e!638241))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120929 (= res!748868 (validKeyInArray!0 k0!934))))

(declare-fun zeroValue!944 () V!42625)

(declare-datatypes ((array!73042 0))(
  ( (array!73043 (arr!35174 (Array (_ BitVec 32) (_ BitVec 64))) (size!35712 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73042)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!47035 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17784 0))(
  ( (tuple2!17785 (_1!8903 (_ BitVec 64)) (_2!8903 V!42625)) )
))
(declare-datatypes ((List!24557 0))(
  ( (Nil!24554) (Cons!24553 (h!25762 tuple2!17784) (t!35133 List!24557)) )
))
(declare-datatypes ((ListLongMap!15753 0))(
  ( (ListLongMap!15754 (toList!7892 List!24557)) )
))
(declare-fun call!47038 () ListLongMap!15753)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42625)

(declare-fun getCurrentListMapNoExtraKeys!4400 (array!73042 array!73040 (_ BitVec 32) (_ BitVec 32) V!42625 V!42625 (_ BitVec 32) Int) ListLongMap!15753)

(assert (=> bm!47035 (= call!47038 (getCurrentListMapNoExtraKeys!4400 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120930 () Bool)

(declare-fun tp_is_empty!28123 () Bool)

(assert (=> b!1120930 (= e!638246 tp_is_empty!28123)))

(declare-fun b!1120931 () Bool)

(declare-fun e!638239 () Bool)

(assert (=> b!1120931 (= e!638239 tp_is_empty!28123)))

(declare-fun res!748859 () Bool)

(assert (=> start!97886 (=> (not res!748859) (not e!638241))))

(assert (=> start!97886 (= res!748859 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35712 _keys!1208))))))

(assert (=> start!97886 e!638241))

(assert (=> start!97886 tp_is_empty!28123))

(declare-fun array_inv!27088 (array!73042) Bool)

(assert (=> start!97886 (array_inv!27088 _keys!1208)))

(assert (=> start!97886 true))

(assert (=> start!97886 tp!83483))

(declare-fun e!638247 () Bool)

(declare-fun array_inv!27089 (array!73040) Bool)

(assert (=> start!97886 (and (array_inv!27089 _values!996) e!638247)))

(declare-fun b!1120928 () Bool)

(declare-fun res!748861 () Bool)

(assert (=> b!1120928 (=> (not res!748861) (not e!638241))))

(assert (=> b!1120928 (= res!748861 (and (= (size!35711 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35712 _keys!1208) (size!35711 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44002 () Bool)

(assert (=> mapIsEmpty!44002 mapRes!44002))

(declare-fun b!1120932 () Bool)

(declare-fun e!638244 () Bool)

(declare-fun call!47039 () ListLongMap!15753)

(assert (=> b!1120932 (= e!638244 (= call!47039 call!47038))))

(declare-fun b!1120933 () Bool)

(declare-fun res!748867 () Bool)

(assert (=> b!1120933 (=> (not res!748867) (not e!638241))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1120933 (= res!748867 (= (select (arr!35174 _keys!1208) i!673) k0!934))))

(declare-fun lt!498031 () array!73040)

(declare-fun bm!47036 () Bool)

(declare-fun lt!498030 () array!73042)

(assert (=> bm!47036 (= call!47039 (getCurrentListMapNoExtraKeys!4400 lt!498030 lt!498031 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120934 () Bool)

(declare-fun -!1047 (ListLongMap!15753 (_ BitVec 64)) ListLongMap!15753)

(assert (=> b!1120934 (= e!638244 (= call!47039 (-!1047 call!47038 k0!934)))))

(declare-fun b!1120935 () Bool)

(declare-fun res!748869 () Bool)

(declare-fun e!638242 () Bool)

(assert (=> b!1120935 (=> (not res!748869) (not e!638242))))

(declare-datatypes ((List!24558 0))(
  ( (Nil!24555) (Cons!24554 (h!25763 (_ BitVec 64)) (t!35134 List!24558)) )
))
(declare-fun arrayNoDuplicates!0 (array!73042 (_ BitVec 32) List!24558) Bool)

(assert (=> b!1120935 (= res!748869 (arrayNoDuplicates!0 lt!498030 #b00000000000000000000000000000000 Nil!24555))))

(declare-fun b!1120936 () Bool)

(declare-fun res!748866 () Bool)

(assert (=> b!1120936 (=> (not res!748866) (not e!638241))))

(assert (=> b!1120936 (= res!748866 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35712 _keys!1208))))))

(declare-fun b!1120937 () Bool)

(assert (=> b!1120937 (= e!638247 (and e!638239 mapRes!44002))))

(declare-fun condMapEmpty!44002 () Bool)

(declare-fun mapDefault!44002 () ValueCell!13352)

(assert (=> b!1120937 (= condMapEmpty!44002 (= (arr!35173 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13352)) mapDefault!44002)))))

(declare-fun b!1120938 () Bool)

(declare-fun res!748862 () Bool)

(assert (=> b!1120938 (=> (not res!748862) (not e!638241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73042 (_ BitVec 32)) Bool)

(assert (=> b!1120938 (= res!748862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120939 () Bool)

(declare-fun e!638245 () Bool)

(declare-fun e!638243 () Bool)

(assert (=> b!1120939 (= e!638245 e!638243)))

(declare-fun res!748863 () Bool)

(assert (=> b!1120939 (=> res!748863 e!638243)))

(assert (=> b!1120939 (= res!748863 (not (= from!1455 i!673)))))

(declare-fun lt!498029 () ListLongMap!15753)

(assert (=> b!1120939 (= lt!498029 (getCurrentListMapNoExtraKeys!4400 lt!498030 lt!498031 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2441 (Int (_ BitVec 64)) V!42625)

(assert (=> b!1120939 (= lt!498031 (array!73041 (store (arr!35173 _values!996) i!673 (ValueCellFull!13352 (dynLambda!2441 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35711 _values!996)))))

(declare-fun lt!498033 () ListLongMap!15753)

(assert (=> b!1120939 (= lt!498033 (getCurrentListMapNoExtraKeys!4400 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120940 () Bool)

(declare-fun res!748865 () Bool)

(assert (=> b!1120940 (=> (not res!748865) (not e!638241))))

(assert (=> b!1120940 (= res!748865 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24555))))

(declare-fun b!1120941 () Bool)

(assert (=> b!1120941 (= e!638241 e!638242)))

(declare-fun res!748860 () Bool)

(assert (=> b!1120941 (=> (not res!748860) (not e!638242))))

(assert (=> b!1120941 (= res!748860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498030 mask!1564))))

(assert (=> b!1120941 (= lt!498030 (array!73043 (store (arr!35174 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35712 _keys!1208)))))

(declare-fun b!1120942 () Bool)

(assert (=> b!1120942 (= e!638242 (not e!638245))))

(declare-fun res!748864 () Bool)

(assert (=> b!1120942 (=> res!748864 e!638245)))

(assert (=> b!1120942 (= res!748864 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120942 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36611 0))(
  ( (Unit!36612) )
))
(declare-fun lt!498028 () Unit!36611)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73042 (_ BitVec 64) (_ BitVec 32)) Unit!36611)

(assert (=> b!1120942 (= lt!498028 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120943 () Bool)

(assert (=> b!1120943 (= e!638243 true)))

(assert (=> b!1120943 e!638244))

(declare-fun c!109353 () Bool)

(assert (=> b!1120943 (= c!109353 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498032 () Unit!36611)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!323 (array!73042 array!73040 (_ BitVec 32) (_ BitVec 32) V!42625 V!42625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36611)

(assert (=> b!1120943 (= lt!498032 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120944 () Bool)

(declare-fun res!748870 () Bool)

(assert (=> b!1120944 (=> (not res!748870) (not e!638241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120944 (= res!748870 (validMask!0 mask!1564))))

(assert (= (and start!97886 res!748859) b!1120944))

(assert (= (and b!1120944 res!748870) b!1120928))

(assert (= (and b!1120928 res!748861) b!1120938))

(assert (= (and b!1120938 res!748862) b!1120940))

(assert (= (and b!1120940 res!748865) b!1120936))

(assert (= (and b!1120936 res!748866) b!1120929))

(assert (= (and b!1120929 res!748868) b!1120933))

(assert (= (and b!1120933 res!748867) b!1120941))

(assert (= (and b!1120941 res!748860) b!1120935))

(assert (= (and b!1120935 res!748869) b!1120942))

(assert (= (and b!1120942 (not res!748864)) b!1120939))

(assert (= (and b!1120939 (not res!748863)) b!1120943))

(assert (= (and b!1120943 c!109353) b!1120934))

(assert (= (and b!1120943 (not c!109353)) b!1120932))

(assert (= (or b!1120934 b!1120932) bm!47035))

(assert (= (or b!1120934 b!1120932) bm!47036))

(assert (= (and b!1120937 condMapEmpty!44002) mapIsEmpty!44002))

(assert (= (and b!1120937 (not condMapEmpty!44002)) mapNonEmpty!44002))

(get-info :version)

(assert (= (and mapNonEmpty!44002 ((_ is ValueCellFull!13352) mapValue!44002)) b!1120930))

(assert (= (and b!1120937 ((_ is ValueCellFull!13352) mapDefault!44002)) b!1120931))

(assert (= start!97886 b!1120937))

(declare-fun b_lambda!18545 () Bool)

(assert (=> (not b_lambda!18545) (not b!1120939)))

(declare-fun t!35132 () Bool)

(declare-fun tb!8397 () Bool)

(assert (=> (and start!97886 (= defaultEntry!1004 defaultEntry!1004) t!35132) tb!8397))

(declare-fun result!17363 () Bool)

(assert (=> tb!8397 (= result!17363 tp_is_empty!28123)))

(assert (=> b!1120939 t!35132))

(declare-fun b_and!37949 () Bool)

(assert (= b_and!37947 (and (=> t!35132 result!17363) b_and!37949)))

(declare-fun m!1035351 () Bool)

(assert (=> start!97886 m!1035351))

(declare-fun m!1035353 () Bool)

(assert (=> start!97886 m!1035353))

(declare-fun m!1035355 () Bool)

(assert (=> b!1120940 m!1035355))

(declare-fun m!1035357 () Bool)

(assert (=> b!1120939 m!1035357))

(declare-fun m!1035359 () Bool)

(assert (=> b!1120939 m!1035359))

(declare-fun m!1035361 () Bool)

(assert (=> b!1120939 m!1035361))

(declare-fun m!1035363 () Bool)

(assert (=> b!1120939 m!1035363))

(declare-fun m!1035365 () Bool)

(assert (=> b!1120933 m!1035365))

(declare-fun m!1035367 () Bool)

(assert (=> bm!47036 m!1035367))

(declare-fun m!1035369 () Bool)

(assert (=> b!1120934 m!1035369))

(declare-fun m!1035371 () Bool)

(assert (=> b!1120935 m!1035371))

(declare-fun m!1035373 () Bool)

(assert (=> b!1120943 m!1035373))

(declare-fun m!1035375 () Bool)

(assert (=> b!1120944 m!1035375))

(declare-fun m!1035377 () Bool)

(assert (=> b!1120942 m!1035377))

(declare-fun m!1035379 () Bool)

(assert (=> b!1120942 m!1035379))

(declare-fun m!1035381 () Bool)

(assert (=> b!1120929 m!1035381))

(declare-fun m!1035383 () Bool)

(assert (=> b!1120938 m!1035383))

(declare-fun m!1035385 () Bool)

(assert (=> b!1120941 m!1035385))

(declare-fun m!1035387 () Bool)

(assert (=> b!1120941 m!1035387))

(declare-fun m!1035389 () Bool)

(assert (=> mapNonEmpty!44002 m!1035389))

(declare-fun m!1035391 () Bool)

(assert (=> bm!47035 m!1035391))

(check-sat (not b!1120938) (not mapNonEmpty!44002) b_and!37949 (not bm!47036) (not b!1120942) (not b!1120929) (not b!1120940) (not b!1120943) (not b!1120941) (not b!1120934) (not b_next!23593) (not b!1120944) (not bm!47035) (not b_lambda!18545) tp_is_empty!28123 (not start!97886) (not b!1120935) (not b!1120939))
(check-sat b_and!37949 (not b_next!23593))
