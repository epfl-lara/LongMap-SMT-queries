; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97964 () Bool)

(assert start!97964)

(declare-fun b_free!23671 () Bool)

(declare-fun b_next!23671 () Bool)

(assert (=> start!97964 (= b_free!23671 (not b_next!23671))))

(declare-fun tp!83716 () Bool)

(declare-fun b_and!38103 () Bool)

(assert (=> start!97964 (= tp!83716 b_and!38103)))

(declare-fun b!1123060 () Bool)

(declare-fun res!750328 () Bool)

(declare-fun e!639362 () Bool)

(assert (=> b!1123060 (=> (not res!750328) (not e!639362))))

(declare-datatypes ((array!73194 0))(
  ( (array!73195 (arr!35250 (Array (_ BitVec 32) (_ BitVec 64))) (size!35788 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73194)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73194 (_ BitVec 32)) Bool)

(assert (=> b!1123060 (= res!750328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123061 () Bool)

(declare-fun e!639365 () Bool)

(declare-fun e!639359 () Bool)

(declare-fun mapRes!44119 () Bool)

(assert (=> b!1123061 (= e!639365 (and e!639359 mapRes!44119))))

(declare-fun condMapEmpty!44119 () Bool)

(declare-datatypes ((V!42729 0))(
  ( (V!42730 (val!14157 Int)) )
))
(declare-datatypes ((ValueCell!13391 0))(
  ( (ValueCellFull!13391 (v!16789 V!42729)) (EmptyCell!13391) )
))
(declare-datatypes ((array!73196 0))(
  ( (array!73197 (arr!35251 (Array (_ BitVec 32) ValueCell!13391)) (size!35789 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73196)

(declare-fun mapDefault!44119 () ValueCell!13391)

(assert (=> b!1123061 (= condMapEmpty!44119 (= (arr!35251 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13391)) mapDefault!44119)))))

(declare-fun zeroValue!944 () V!42729)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!498795 () array!73196)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42729)

(declare-datatypes ((tuple2!17854 0))(
  ( (tuple2!17855 (_1!8938 (_ BitVec 64)) (_2!8938 V!42729)) )
))
(declare-datatypes ((List!24619 0))(
  ( (Nil!24616) (Cons!24615 (h!25824 tuple2!17854) (t!35273 List!24619)) )
))
(declare-datatypes ((ListLongMap!15823 0))(
  ( (ListLongMap!15824 (toList!7927 List!24619)) )
))
(declare-fun call!47272 () ListLongMap!15823)

(declare-fun bm!47269 () Bool)

(declare-fun lt!498796 () array!73194)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4434 (array!73194 array!73196 (_ BitVec 32) (_ BitVec 32) V!42729 V!42729 (_ BitVec 32) Int) ListLongMap!15823)

(assert (=> bm!47269 (= call!47272 (getCurrentListMapNoExtraKeys!4434 lt!498796 lt!498795 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!47273 () ListLongMap!15823)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!639366 () Bool)

(declare-fun b!1123063 () Bool)

(declare-fun -!1070 (ListLongMap!15823 (_ BitVec 64)) ListLongMap!15823)

(assert (=> b!1123063 (= e!639366 (= call!47272 (-!1070 call!47273 k0!934)))))

(declare-fun b!1123064 () Bool)

(declare-fun res!750329 () Bool)

(assert (=> b!1123064 (=> (not res!750329) (not e!639362))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123064 (= res!750329 (= (select (arr!35250 _keys!1208) i!673) k0!934))))

(declare-fun b!1123065 () Bool)

(declare-fun res!750337 () Bool)

(assert (=> b!1123065 (=> (not res!750337) (not e!639362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123065 (= res!750337 (validMask!0 mask!1564))))

(declare-fun b!1123066 () Bool)

(declare-fun res!750332 () Bool)

(assert (=> b!1123066 (=> (not res!750332) (not e!639362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123066 (= res!750332 (validKeyInArray!0 k0!934))))

(declare-fun b!1123067 () Bool)

(declare-fun e!639358 () Bool)

(declare-fun e!639364 () Bool)

(assert (=> b!1123067 (= e!639358 (not e!639364))))

(declare-fun res!750336 () Bool)

(assert (=> b!1123067 (=> res!750336 e!639364)))

(assert (=> b!1123067 (= res!750336 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73194 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123067 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36671 0))(
  ( (Unit!36672) )
))
(declare-fun lt!498797 () Unit!36671)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73194 (_ BitVec 64) (_ BitVec 32)) Unit!36671)

(assert (=> b!1123067 (= lt!498797 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1123068 () Bool)

(declare-fun res!750330 () Bool)

(assert (=> b!1123068 (=> (not res!750330) (not e!639362))))

(assert (=> b!1123068 (= res!750330 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35788 _keys!1208))))))

(declare-fun b!1123069 () Bool)

(declare-fun e!639357 () Bool)

(assert (=> b!1123069 (= e!639364 e!639357)))

(declare-fun res!750333 () Bool)

(assert (=> b!1123069 (=> res!750333 e!639357)))

(assert (=> b!1123069 (= res!750333 (not (= from!1455 i!673)))))

(declare-fun lt!498801 () ListLongMap!15823)

(assert (=> b!1123069 (= lt!498801 (getCurrentListMapNoExtraKeys!4434 lt!498796 lt!498795 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2465 (Int (_ BitVec 64)) V!42729)

(assert (=> b!1123069 (= lt!498795 (array!73197 (store (arr!35251 _values!996) i!673 (ValueCellFull!13391 (dynLambda!2465 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35789 _values!996)))))

(declare-fun lt!498800 () ListLongMap!15823)

(assert (=> b!1123069 (= lt!498800 (getCurrentListMapNoExtraKeys!4434 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!44119 () Bool)

(declare-fun tp!83717 () Bool)

(declare-fun e!639360 () Bool)

(assert (=> mapNonEmpty!44119 (= mapRes!44119 (and tp!83717 e!639360))))

(declare-fun mapKey!44119 () (_ BitVec 32))

(declare-fun mapRest!44119 () (Array (_ BitVec 32) ValueCell!13391))

(declare-fun mapValue!44119 () ValueCell!13391)

(assert (=> mapNonEmpty!44119 (= (arr!35251 _values!996) (store mapRest!44119 mapKey!44119 mapValue!44119))))

(declare-fun b!1123070 () Bool)

(declare-fun res!750339 () Bool)

(assert (=> b!1123070 (=> (not res!750339) (not e!639358))))

(declare-datatypes ((List!24620 0))(
  ( (Nil!24617) (Cons!24616 (h!25825 (_ BitVec 64)) (t!35274 List!24620)) )
))
(declare-fun arrayNoDuplicates!0 (array!73194 (_ BitVec 32) List!24620) Bool)

(assert (=> b!1123070 (= res!750339 (arrayNoDuplicates!0 lt!498796 #b00000000000000000000000000000000 Nil!24617))))

(declare-fun mapIsEmpty!44119 () Bool)

(assert (=> mapIsEmpty!44119 mapRes!44119))

(declare-fun b!1123071 () Bool)

(assert (=> b!1123071 (= e!639366 (= call!47272 call!47273))))

(declare-fun res!750335 () Bool)

(assert (=> start!97964 (=> (not res!750335) (not e!639362))))

(assert (=> start!97964 (= res!750335 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35788 _keys!1208))))))

(assert (=> start!97964 e!639362))

(declare-fun tp_is_empty!28201 () Bool)

(assert (=> start!97964 tp_is_empty!28201))

(declare-fun array_inv!27134 (array!73194) Bool)

(assert (=> start!97964 (array_inv!27134 _keys!1208)))

(assert (=> start!97964 true))

(assert (=> start!97964 tp!83716))

(declare-fun array_inv!27135 (array!73196) Bool)

(assert (=> start!97964 (and (array_inv!27135 _values!996) e!639365)))

(declare-fun b!1123062 () Bool)

(assert (=> b!1123062 (= e!639362 e!639358)))

(declare-fun res!750338 () Bool)

(assert (=> b!1123062 (=> (not res!750338) (not e!639358))))

(assert (=> b!1123062 (= res!750338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498796 mask!1564))))

(assert (=> b!1123062 (= lt!498796 (array!73195 (store (arr!35250 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35788 _keys!1208)))))

(declare-fun b!1123072 () Bool)

(assert (=> b!1123072 (= e!639359 tp_is_empty!28201)))

(declare-fun bm!47270 () Bool)

(assert (=> bm!47270 (= call!47273 (getCurrentListMapNoExtraKeys!4434 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123073 () Bool)

(declare-fun res!750331 () Bool)

(assert (=> b!1123073 (=> (not res!750331) (not e!639362))))

(assert (=> b!1123073 (= res!750331 (and (= (size!35789 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35788 _keys!1208) (size!35789 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123074 () Bool)

(declare-fun e!639363 () Bool)

(assert (=> b!1123074 (= e!639363 true)))

(declare-fun lt!498798 () Bool)

(declare-fun contains!6403 (ListLongMap!15823 (_ BitVec 64)) Bool)

(assert (=> b!1123074 (= lt!498798 (contains!6403 (getCurrentListMapNoExtraKeys!4434 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1123075 () Bool)

(assert (=> b!1123075 (= e!639360 tp_is_empty!28201)))

(declare-fun b!1123076 () Bool)

(declare-fun res!750334 () Bool)

(assert (=> b!1123076 (=> (not res!750334) (not e!639362))))

(assert (=> b!1123076 (= res!750334 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24617))))

(declare-fun b!1123077 () Bool)

(assert (=> b!1123077 (= e!639357 e!639363)))

(declare-fun res!750340 () Bool)

(assert (=> b!1123077 (=> res!750340 e!639363)))

(assert (=> b!1123077 (= res!750340 (not (= (select (arr!35250 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1123077 e!639366))

(declare-fun c!109470 () Bool)

(assert (=> b!1123077 (= c!109470 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498799 () Unit!36671)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!348 (array!73194 array!73196 (_ BitVec 32) (_ BitVec 32) V!42729 V!42729 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36671)

(assert (=> b!1123077 (= lt!498799 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!348 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97964 res!750335) b!1123065))

(assert (= (and b!1123065 res!750337) b!1123073))

(assert (= (and b!1123073 res!750331) b!1123060))

(assert (= (and b!1123060 res!750328) b!1123076))

(assert (= (and b!1123076 res!750334) b!1123068))

(assert (= (and b!1123068 res!750330) b!1123066))

(assert (= (and b!1123066 res!750332) b!1123064))

(assert (= (and b!1123064 res!750329) b!1123062))

(assert (= (and b!1123062 res!750338) b!1123070))

(assert (= (and b!1123070 res!750339) b!1123067))

(assert (= (and b!1123067 (not res!750336)) b!1123069))

(assert (= (and b!1123069 (not res!750333)) b!1123077))

(assert (= (and b!1123077 c!109470) b!1123063))

(assert (= (and b!1123077 (not c!109470)) b!1123071))

(assert (= (or b!1123063 b!1123071) bm!47269))

(assert (= (or b!1123063 b!1123071) bm!47270))

(assert (= (and b!1123077 (not res!750340)) b!1123074))

(assert (= (and b!1123061 condMapEmpty!44119) mapIsEmpty!44119))

(assert (= (and b!1123061 (not condMapEmpty!44119)) mapNonEmpty!44119))

(get-info :version)

(assert (= (and mapNonEmpty!44119 ((_ is ValueCellFull!13391) mapValue!44119)) b!1123075))

(assert (= (and b!1123061 ((_ is ValueCellFull!13391) mapDefault!44119)) b!1123072))

(assert (= start!97964 b!1123061))

(declare-fun b_lambda!18623 () Bool)

(assert (=> (not b_lambda!18623) (not b!1123069)))

(declare-fun t!35272 () Bool)

(declare-fun tb!8475 () Bool)

(assert (=> (and start!97964 (= defaultEntry!1004 defaultEntry!1004) t!35272) tb!8475))

(declare-fun result!17519 () Bool)

(assert (=> tb!8475 (= result!17519 tp_is_empty!28201)))

(assert (=> b!1123069 t!35272))

(declare-fun b_and!38105 () Bool)

(assert (= b_and!38103 (and (=> t!35272 result!17519) b_and!38105)))

(declare-fun m!1037079 () Bool)

(assert (=> b!1123077 m!1037079))

(declare-fun m!1037081 () Bool)

(assert (=> b!1123077 m!1037081))

(declare-fun m!1037083 () Bool)

(assert (=> b!1123074 m!1037083))

(assert (=> b!1123074 m!1037083))

(declare-fun m!1037085 () Bool)

(assert (=> b!1123074 m!1037085))

(declare-fun m!1037087 () Bool)

(assert (=> b!1123064 m!1037087))

(declare-fun m!1037089 () Bool)

(assert (=> start!97964 m!1037089))

(declare-fun m!1037091 () Bool)

(assert (=> start!97964 m!1037091))

(declare-fun m!1037093 () Bool)

(assert (=> b!1123065 m!1037093))

(declare-fun m!1037095 () Bool)

(assert (=> b!1123076 m!1037095))

(declare-fun m!1037097 () Bool)

(assert (=> b!1123067 m!1037097))

(declare-fun m!1037099 () Bool)

(assert (=> b!1123067 m!1037099))

(declare-fun m!1037101 () Bool)

(assert (=> b!1123070 m!1037101))

(declare-fun m!1037103 () Bool)

(assert (=> b!1123063 m!1037103))

(declare-fun m!1037105 () Bool)

(assert (=> b!1123062 m!1037105))

(declare-fun m!1037107 () Bool)

(assert (=> b!1123062 m!1037107))

(declare-fun m!1037109 () Bool)

(assert (=> b!1123069 m!1037109))

(declare-fun m!1037111 () Bool)

(assert (=> b!1123069 m!1037111))

(declare-fun m!1037113 () Bool)

(assert (=> b!1123069 m!1037113))

(declare-fun m!1037115 () Bool)

(assert (=> b!1123069 m!1037115))

(declare-fun m!1037117 () Bool)

(assert (=> b!1123066 m!1037117))

(declare-fun m!1037119 () Bool)

(assert (=> b!1123060 m!1037119))

(declare-fun m!1037121 () Bool)

(assert (=> bm!47269 m!1037121))

(declare-fun m!1037123 () Bool)

(assert (=> mapNonEmpty!44119 m!1037123))

(assert (=> bm!47270 m!1037083))

(check-sat (not b!1123067) (not b_lambda!18623) (not b!1123069) (not b!1123077) (not b!1123065) (not b!1123070) (not b!1123066) (not b!1123063) (not mapNonEmpty!44119) tp_is_empty!28201 (not bm!47269) (not b!1123076) (not b!1123060) b_and!38105 (not b!1123062) (not b_next!23671) (not start!97964) (not bm!47270) (not b!1123074))
(check-sat b_and!38105 (not b_next!23671))
