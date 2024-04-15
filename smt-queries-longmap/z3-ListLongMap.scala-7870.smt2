; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97958 () Bool)

(assert start!97958)

(declare-fun b_free!23665 () Bool)

(declare-fun b_next!23665 () Bool)

(assert (=> start!97958 (= b_free!23665 (not b_next!23665))))

(declare-fun tp!83698 () Bool)

(declare-fun b_and!38091 () Bool)

(assert (=> start!97958 (= tp!83698 b_and!38091)))

(declare-fun b!1122892 () Bool)

(declare-fun res!750223 () Bool)

(declare-fun e!639274 () Bool)

(assert (=> b!1122892 (=> (not res!750223) (not e!639274))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73182 0))(
  ( (array!73183 (arr!35244 (Array (_ BitVec 32) (_ BitVec 64))) (size!35782 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73182)

(assert (=> b!1122892 (= res!750223 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35782 _keys!1208))))))

(declare-fun b!1122893 () Bool)

(declare-fun e!639270 () Bool)

(declare-fun tp_is_empty!28195 () Bool)

(assert (=> b!1122893 (= e!639270 tp_is_empty!28195)))

(declare-fun mapIsEmpty!44110 () Bool)

(declare-fun mapRes!44110 () Bool)

(assert (=> mapIsEmpty!44110 mapRes!44110))

(declare-fun b!1122894 () Bool)

(declare-fun e!639272 () Bool)

(declare-fun e!639276 () Bool)

(assert (=> b!1122894 (= e!639272 e!639276)))

(declare-fun res!750221 () Bool)

(assert (=> b!1122894 (=> res!750221 e!639276)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1122894 (= res!750221 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42721 0))(
  ( (V!42722 (val!14154 Int)) )
))
(declare-fun zeroValue!944 () V!42721)

(declare-datatypes ((ValueCell!13388 0))(
  ( (ValueCellFull!13388 (v!16786 V!42721)) (EmptyCell!13388) )
))
(declare-datatypes ((array!73184 0))(
  ( (array!73185 (arr!35245 (Array (_ BitVec 32) ValueCell!13388)) (size!35783 (_ BitVec 32))) )
))
(declare-fun lt!498737 () array!73184)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17848 0))(
  ( (tuple2!17849 (_1!8935 (_ BitVec 64)) (_2!8935 V!42721)) )
))
(declare-datatypes ((List!24614 0))(
  ( (Nil!24611) (Cons!24610 (h!25819 tuple2!17848) (t!35262 List!24614)) )
))
(declare-datatypes ((ListLongMap!15817 0))(
  ( (ListLongMap!15818 (toList!7924 List!24614)) )
))
(declare-fun lt!498738 () ListLongMap!15817)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42721)

(declare-fun lt!498736 () array!73182)

(declare-fun getCurrentListMapNoExtraKeys!4431 (array!73182 array!73184 (_ BitVec 32) (_ BitVec 32) V!42721 V!42721 (_ BitVec 32) Int) ListLongMap!15817)

(assert (=> b!1122894 (= lt!498738 (getCurrentListMapNoExtraKeys!4431 lt!498736 lt!498737 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73184)

(declare-fun dynLambda!2463 (Int (_ BitVec 64)) V!42721)

(assert (=> b!1122894 (= lt!498737 (array!73185 (store (arr!35245 _values!996) i!673 (ValueCellFull!13388 (dynLambda!2463 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35783 _values!996)))))

(declare-fun lt!498733 () ListLongMap!15817)

(assert (=> b!1122894 (= lt!498733 (getCurrentListMapNoExtraKeys!4431 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1122895 () Bool)

(declare-fun e!639271 () Bool)

(assert (=> b!1122895 (= e!639271 tp_is_empty!28195)))

(declare-fun b!1122896 () Bool)

(declare-fun e!639267 () Bool)

(assert (=> b!1122896 (= e!639267 (and e!639271 mapRes!44110))))

(declare-fun condMapEmpty!44110 () Bool)

(declare-fun mapDefault!44110 () ValueCell!13388)

(assert (=> b!1122896 (= condMapEmpty!44110 (= (arr!35245 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13388)) mapDefault!44110)))))

(declare-fun res!750217 () Bool)

(assert (=> start!97958 (=> (not res!750217) (not e!639274))))

(assert (=> start!97958 (= res!750217 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35782 _keys!1208))))))

(assert (=> start!97958 e!639274))

(assert (=> start!97958 tp_is_empty!28195))

(declare-fun array_inv!27128 (array!73182) Bool)

(assert (=> start!97958 (array_inv!27128 _keys!1208)))

(assert (=> start!97958 true))

(assert (=> start!97958 tp!83698))

(declare-fun array_inv!27129 (array!73184) Bool)

(assert (=> start!97958 (and (array_inv!27129 _values!996) e!639267)))

(declare-fun b!1122897 () Bool)

(declare-fun res!750218 () Bool)

(assert (=> b!1122897 (=> (not res!750218) (not e!639274))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1122897 (= res!750218 (= (select (arr!35244 _keys!1208) i!673) k0!934))))

(declare-fun b!1122898 () Bool)

(declare-fun e!639273 () Bool)

(assert (=> b!1122898 (= e!639276 e!639273)))

(declare-fun res!750213 () Bool)

(assert (=> b!1122898 (=> res!750213 e!639273)))

(assert (=> b!1122898 (= res!750213 (not (= (select (arr!35244 _keys!1208) from!1455) k0!934)))))

(declare-fun e!639275 () Bool)

(assert (=> b!1122898 e!639275))

(declare-fun c!109461 () Bool)

(assert (=> b!1122898 (= c!109461 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36665 0))(
  ( (Unit!36666) )
))
(declare-fun lt!498735 () Unit!36665)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!345 (array!73182 array!73184 (_ BitVec 32) (_ BitVec 32) V!42721 V!42721 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36665)

(assert (=> b!1122898 (= lt!498735 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!345 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44110 () Bool)

(declare-fun tp!83699 () Bool)

(assert (=> mapNonEmpty!44110 (= mapRes!44110 (and tp!83699 e!639270))))

(declare-fun mapRest!44110 () (Array (_ BitVec 32) ValueCell!13388))

(declare-fun mapValue!44110 () ValueCell!13388)

(declare-fun mapKey!44110 () (_ BitVec 32))

(assert (=> mapNonEmpty!44110 (= (arr!35245 _values!996) (store mapRest!44110 mapKey!44110 mapValue!44110))))

(declare-fun b!1122899 () Bool)

(assert (=> b!1122899 (= e!639273 true)))

(declare-fun lt!498732 () Bool)

(declare-fun contains!6401 (ListLongMap!15817 (_ BitVec 64)) Bool)

(assert (=> b!1122899 (= lt!498732 (contains!6401 (getCurrentListMapNoExtraKeys!4431 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1122900 () Bool)

(declare-fun call!47255 () ListLongMap!15817)

(declare-fun call!47254 () ListLongMap!15817)

(assert (=> b!1122900 (= e!639275 (= call!47255 call!47254))))

(declare-fun b!1122901 () Bool)

(declare-fun res!750219 () Bool)

(declare-fun e!639268 () Bool)

(assert (=> b!1122901 (=> (not res!750219) (not e!639268))))

(declare-datatypes ((List!24615 0))(
  ( (Nil!24612) (Cons!24611 (h!25820 (_ BitVec 64)) (t!35263 List!24615)) )
))
(declare-fun arrayNoDuplicates!0 (array!73182 (_ BitVec 32) List!24615) Bool)

(assert (=> b!1122901 (= res!750219 (arrayNoDuplicates!0 lt!498736 #b00000000000000000000000000000000 Nil!24612))))

(declare-fun bm!47251 () Bool)

(assert (=> bm!47251 (= call!47255 (getCurrentListMapNoExtraKeys!4431 lt!498736 lt!498737 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122902 () Bool)

(declare-fun res!750214 () Bool)

(assert (=> b!1122902 (=> (not res!750214) (not e!639274))))

(assert (=> b!1122902 (= res!750214 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24612))))

(declare-fun b!1122903 () Bool)

(declare-fun res!750220 () Bool)

(assert (=> b!1122903 (=> (not res!750220) (not e!639274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122903 (= res!750220 (validKeyInArray!0 k0!934))))

(declare-fun b!1122904 () Bool)

(assert (=> b!1122904 (= e!639268 (not e!639272))))

(declare-fun res!750212 () Bool)

(assert (=> b!1122904 (=> res!750212 e!639272)))

(assert (=> b!1122904 (= res!750212 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122904 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498734 () Unit!36665)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73182 (_ BitVec 64) (_ BitVec 32)) Unit!36665)

(assert (=> b!1122904 (= lt!498734 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!47252 () Bool)

(assert (=> bm!47252 (= call!47254 (getCurrentListMapNoExtraKeys!4431 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122905 () Bool)

(declare-fun res!750215 () Bool)

(assert (=> b!1122905 (=> (not res!750215) (not e!639274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73182 (_ BitVec 32)) Bool)

(assert (=> b!1122905 (= res!750215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1122906 () Bool)

(assert (=> b!1122906 (= e!639274 e!639268)))

(declare-fun res!750211 () Bool)

(assert (=> b!1122906 (=> (not res!750211) (not e!639268))))

(assert (=> b!1122906 (= res!750211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498736 mask!1564))))

(assert (=> b!1122906 (= lt!498736 (array!73183 (store (arr!35244 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35782 _keys!1208)))))

(declare-fun b!1122907 () Bool)

(declare-fun res!750216 () Bool)

(assert (=> b!1122907 (=> (not res!750216) (not e!639274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122907 (= res!750216 (validMask!0 mask!1564))))

(declare-fun b!1122908 () Bool)

(declare-fun -!1068 (ListLongMap!15817 (_ BitVec 64)) ListLongMap!15817)

(assert (=> b!1122908 (= e!639275 (= call!47255 (-!1068 call!47254 k0!934)))))

(declare-fun b!1122909 () Bool)

(declare-fun res!750222 () Bool)

(assert (=> b!1122909 (=> (not res!750222) (not e!639274))))

(assert (=> b!1122909 (= res!750222 (and (= (size!35783 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35782 _keys!1208) (size!35783 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97958 res!750217) b!1122907))

(assert (= (and b!1122907 res!750216) b!1122909))

(assert (= (and b!1122909 res!750222) b!1122905))

(assert (= (and b!1122905 res!750215) b!1122902))

(assert (= (and b!1122902 res!750214) b!1122892))

(assert (= (and b!1122892 res!750223) b!1122903))

(assert (= (and b!1122903 res!750220) b!1122897))

(assert (= (and b!1122897 res!750218) b!1122906))

(assert (= (and b!1122906 res!750211) b!1122901))

(assert (= (and b!1122901 res!750219) b!1122904))

(assert (= (and b!1122904 (not res!750212)) b!1122894))

(assert (= (and b!1122894 (not res!750221)) b!1122898))

(assert (= (and b!1122898 c!109461) b!1122908))

(assert (= (and b!1122898 (not c!109461)) b!1122900))

(assert (= (or b!1122908 b!1122900) bm!47251))

(assert (= (or b!1122908 b!1122900) bm!47252))

(assert (= (and b!1122898 (not res!750213)) b!1122899))

(assert (= (and b!1122896 condMapEmpty!44110) mapIsEmpty!44110))

(assert (= (and b!1122896 (not condMapEmpty!44110)) mapNonEmpty!44110))

(get-info :version)

(assert (= (and mapNonEmpty!44110 ((_ is ValueCellFull!13388) mapValue!44110)) b!1122893))

(assert (= (and b!1122896 ((_ is ValueCellFull!13388) mapDefault!44110)) b!1122895))

(assert (= start!97958 b!1122896))

(declare-fun b_lambda!18617 () Bool)

(assert (=> (not b_lambda!18617) (not b!1122894)))

(declare-fun t!35261 () Bool)

(declare-fun tb!8469 () Bool)

(assert (=> (and start!97958 (= defaultEntry!1004 defaultEntry!1004) t!35261) tb!8469))

(declare-fun result!17507 () Bool)

(assert (=> tb!8469 (= result!17507 tp_is_empty!28195)))

(assert (=> b!1122894 t!35261))

(declare-fun b_and!38093 () Bool)

(assert (= b_and!38091 (and (=> t!35261 result!17507) b_and!38093)))

(declare-fun m!1036941 () Bool)

(assert (=> b!1122907 m!1036941))

(declare-fun m!1036943 () Bool)

(assert (=> b!1122903 m!1036943))

(declare-fun m!1036945 () Bool)

(assert (=> b!1122904 m!1036945))

(declare-fun m!1036947 () Bool)

(assert (=> b!1122904 m!1036947))

(declare-fun m!1036949 () Bool)

(assert (=> b!1122908 m!1036949))

(declare-fun m!1036951 () Bool)

(assert (=> b!1122894 m!1036951))

(declare-fun m!1036953 () Bool)

(assert (=> b!1122894 m!1036953))

(declare-fun m!1036955 () Bool)

(assert (=> b!1122894 m!1036955))

(declare-fun m!1036957 () Bool)

(assert (=> b!1122894 m!1036957))

(declare-fun m!1036959 () Bool)

(assert (=> b!1122902 m!1036959))

(declare-fun m!1036961 () Bool)

(assert (=> bm!47251 m!1036961))

(declare-fun m!1036963 () Bool)

(assert (=> bm!47252 m!1036963))

(assert (=> b!1122899 m!1036963))

(assert (=> b!1122899 m!1036963))

(declare-fun m!1036965 () Bool)

(assert (=> b!1122899 m!1036965))

(declare-fun m!1036967 () Bool)

(assert (=> b!1122901 m!1036967))

(declare-fun m!1036969 () Bool)

(assert (=> b!1122897 m!1036969))

(declare-fun m!1036971 () Bool)

(assert (=> start!97958 m!1036971))

(declare-fun m!1036973 () Bool)

(assert (=> start!97958 m!1036973))

(declare-fun m!1036975 () Bool)

(assert (=> mapNonEmpty!44110 m!1036975))

(declare-fun m!1036977 () Bool)

(assert (=> b!1122906 m!1036977))

(declare-fun m!1036979 () Bool)

(assert (=> b!1122906 m!1036979))

(declare-fun m!1036981 () Bool)

(assert (=> b!1122898 m!1036981))

(declare-fun m!1036983 () Bool)

(assert (=> b!1122898 m!1036983))

(declare-fun m!1036985 () Bool)

(assert (=> b!1122905 m!1036985))

(check-sat (not b!1122894) (not bm!47252) (not mapNonEmpty!44110) tp_is_empty!28195 (not b!1122899) (not b!1122902) (not b_next!23665) (not b!1122903) (not b_lambda!18617) (not b!1122908) (not b!1122905) b_and!38093 (not b!1122906) (not b!1122898) (not b!1122907) (not bm!47251) (not start!97958) (not b!1122904) (not b!1122901))
(check-sat b_and!38093 (not b_next!23665))
