; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97414 () Bool)

(assert start!97414)

(declare-fun b_free!23385 () Bool)

(declare-fun b_next!23385 () Bool)

(assert (=> start!97414 (= b_free!23385 (not b_next!23385))))

(declare-fun tp!82453 () Bool)

(declare-fun b_and!37607 () Bool)

(assert (=> start!97414 (= tp!82453 b_and!37607)))

(declare-fun b!1111031 () Bool)

(declare-fun res!741419 () Bool)

(declare-fun e!633578 () Bool)

(assert (=> b!1111031 (=> (not res!741419) (not e!633578))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111031 (= res!741419 (validKeyInArray!0 k0!934))))

(declare-fun res!741418 () Bool)

(assert (=> start!97414 (=> (not res!741418) (not e!633578))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72207 0))(
  ( (array!72208 (arr!34756 (Array (_ BitVec 32) (_ BitVec 64))) (size!35292 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72207)

(assert (=> start!97414 (= res!741418 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35292 _keys!1208))))))

(assert (=> start!97414 e!633578))

(declare-fun tp_is_empty!27645 () Bool)

(assert (=> start!97414 tp_is_empty!27645))

(declare-fun array_inv!26736 (array!72207) Bool)

(assert (=> start!97414 (array_inv!26736 _keys!1208)))

(assert (=> start!97414 true))

(assert (=> start!97414 tp!82453))

(declare-datatypes ((V!41987 0))(
  ( (V!41988 (val!13879 Int)) )
))
(declare-datatypes ((ValueCell!13113 0))(
  ( (ValueCellFull!13113 (v!16512 V!41987)) (EmptyCell!13113) )
))
(declare-datatypes ((array!72209 0))(
  ( (array!72210 (arr!34757 (Array (_ BitVec 32) ValueCell!13113)) (size!35293 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72209)

(declare-fun e!633575 () Bool)

(declare-fun array_inv!26737 (array!72209) Bool)

(assert (=> start!97414 (and (array_inv!26737 _values!996) e!633575)))

(declare-fun b!1111032 () Bool)

(declare-fun res!741417 () Bool)

(assert (=> b!1111032 (=> (not res!741417) (not e!633578))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111032 (= res!741417 (= (select (arr!34756 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!43285 () Bool)

(declare-fun mapRes!43285 () Bool)

(declare-fun tp!82454 () Bool)

(declare-fun e!633577 () Bool)

(assert (=> mapNonEmpty!43285 (= mapRes!43285 (and tp!82454 e!633577))))

(declare-fun mapRest!43285 () (Array (_ BitVec 32) ValueCell!13113))

(declare-fun mapValue!43285 () ValueCell!13113)

(declare-fun mapKey!43285 () (_ BitVec 32))

(assert (=> mapNonEmpty!43285 (= (arr!34757 _values!996) (store mapRest!43285 mapKey!43285 mapValue!43285))))

(declare-fun b!1111033 () Bool)

(declare-fun res!741421 () Bool)

(assert (=> b!1111033 (=> (not res!741421) (not e!633578))))

(declare-datatypes ((List!24244 0))(
  ( (Nil!24241) (Cons!24240 (h!25449 (_ BitVec 64)) (t!34675 List!24244)) )
))
(declare-fun arrayNoDuplicates!0 (array!72207 (_ BitVec 32) List!24244) Bool)

(assert (=> b!1111033 (= res!741421 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24241))))

(declare-fun b!1111034 () Bool)

(declare-fun e!633579 () Bool)

(assert (=> b!1111034 (= e!633579 tp_is_empty!27645)))

(declare-fun zeroValue!944 () V!41987)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17560 0))(
  ( (tuple2!17561 (_1!8791 (_ BitVec 64)) (_2!8791 V!41987)) )
))
(declare-datatypes ((List!24245 0))(
  ( (Nil!24242) (Cons!24241 (h!25450 tuple2!17560) (t!34676 List!24245)) )
))
(declare-datatypes ((ListLongMap!15529 0))(
  ( (ListLongMap!15530 (toList!7780 List!24245)) )
))
(declare-fun call!46852 () ListLongMap!15529)

(declare-fun bm!46848 () Bool)

(declare-fun minValue!944 () V!41987)

(declare-fun getCurrentListMapNoExtraKeys!4272 (array!72207 array!72209 (_ BitVec 32) (_ BitVec 32) V!41987 V!41987 (_ BitVec 32) Int) ListLongMap!15529)

(assert (=> bm!46848 (= call!46852 (getCurrentListMapNoExtraKeys!4272 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111035 () Bool)

(declare-fun e!633576 () Bool)

(declare-fun call!46851 () ListLongMap!15529)

(assert (=> b!1111035 (= e!633576 (= call!46851 call!46852))))

(declare-fun b!1111036 () Bool)

(assert (=> b!1111036 (= e!633577 tp_is_empty!27645)))

(declare-fun b!1111037 () Bool)

(declare-fun res!741422 () Bool)

(assert (=> b!1111037 (=> (not res!741422) (not e!633578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72207 (_ BitVec 32)) Bool)

(assert (=> b!1111037 (= res!741422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!496271 () array!72207)

(declare-fun bm!46849 () Bool)

(declare-fun dynLambda!2401 (Int (_ BitVec 64)) V!41987)

(assert (=> bm!46849 (= call!46851 (getCurrentListMapNoExtraKeys!4272 lt!496271 (array!72210 (store (arr!34757 _values!996) i!673 (ValueCellFull!13113 (dynLambda!2401 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35293 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111038 () Bool)

(declare-fun e!633573 () Bool)

(declare-fun e!633572 () Bool)

(assert (=> b!1111038 (= e!633573 (not e!633572))))

(declare-fun res!741424 () Bool)

(assert (=> b!1111038 (=> res!741424 e!633572)))

(assert (=> b!1111038 (= res!741424 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35292 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111038 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36460 0))(
  ( (Unit!36461) )
))
(declare-fun lt!496270 () Unit!36460)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72207 (_ BitVec 64) (_ BitVec 32)) Unit!36460)

(assert (=> b!1111038 (= lt!496270 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1111039 () Bool)

(assert (=> b!1111039 (= e!633575 (and e!633579 mapRes!43285))))

(declare-fun condMapEmpty!43285 () Bool)

(declare-fun mapDefault!43285 () ValueCell!13113)

(assert (=> b!1111039 (= condMapEmpty!43285 (= (arr!34757 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13113)) mapDefault!43285)))))

(declare-fun b!1111040 () Bool)

(assert (=> b!1111040 (= e!633572 true)))

(assert (=> b!1111040 e!633576))

(declare-fun c!109275 () Bool)

(assert (=> b!1111040 (= c!109275 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496269 () Unit!36460)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!298 (array!72207 array!72209 (_ BitVec 32) (_ BitVec 32) V!41987 V!41987 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36460)

(assert (=> b!1111040 (= lt!496269 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!298 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111041 () Bool)

(declare-fun res!741420 () Bool)

(assert (=> b!1111041 (=> (not res!741420) (not e!633573))))

(assert (=> b!1111041 (= res!741420 (arrayNoDuplicates!0 lt!496271 #b00000000000000000000000000000000 Nil!24241))))

(declare-fun b!1111042 () Bool)

(declare-fun -!1049 (ListLongMap!15529 (_ BitVec 64)) ListLongMap!15529)

(assert (=> b!1111042 (= e!633576 (= call!46851 (-!1049 call!46852 k0!934)))))

(declare-fun mapIsEmpty!43285 () Bool)

(assert (=> mapIsEmpty!43285 mapRes!43285))

(declare-fun b!1111043 () Bool)

(assert (=> b!1111043 (= e!633578 e!633573)))

(declare-fun res!741426 () Bool)

(assert (=> b!1111043 (=> (not res!741426) (not e!633573))))

(assert (=> b!1111043 (= res!741426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496271 mask!1564))))

(assert (=> b!1111043 (= lt!496271 (array!72208 (store (arr!34756 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35292 _keys!1208)))))

(declare-fun b!1111044 () Bool)

(declare-fun res!741423 () Bool)

(assert (=> b!1111044 (=> (not res!741423) (not e!633578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111044 (= res!741423 (validMask!0 mask!1564))))

(declare-fun b!1111045 () Bool)

(declare-fun res!741425 () Bool)

(assert (=> b!1111045 (=> (not res!741425) (not e!633578))))

(assert (=> b!1111045 (= res!741425 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35292 _keys!1208))))))

(declare-fun b!1111046 () Bool)

(declare-fun res!741427 () Bool)

(assert (=> b!1111046 (=> (not res!741427) (not e!633578))))

(assert (=> b!1111046 (= res!741427 (and (= (size!35293 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35292 _keys!1208) (size!35293 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97414 res!741418) b!1111044))

(assert (= (and b!1111044 res!741423) b!1111046))

(assert (= (and b!1111046 res!741427) b!1111037))

(assert (= (and b!1111037 res!741422) b!1111033))

(assert (= (and b!1111033 res!741421) b!1111045))

(assert (= (and b!1111045 res!741425) b!1111031))

(assert (= (and b!1111031 res!741419) b!1111032))

(assert (= (and b!1111032 res!741417) b!1111043))

(assert (= (and b!1111043 res!741426) b!1111041))

(assert (= (and b!1111041 res!741420) b!1111038))

(assert (= (and b!1111038 (not res!741424)) b!1111040))

(assert (= (and b!1111040 c!109275) b!1111042))

(assert (= (and b!1111040 (not c!109275)) b!1111035))

(assert (= (or b!1111042 b!1111035) bm!46849))

(assert (= (or b!1111042 b!1111035) bm!46848))

(assert (= (and b!1111039 condMapEmpty!43285) mapIsEmpty!43285))

(assert (= (and b!1111039 (not condMapEmpty!43285)) mapNonEmpty!43285))

(get-info :version)

(assert (= (and mapNonEmpty!43285 ((_ is ValueCellFull!13113) mapValue!43285)) b!1111036))

(assert (= (and b!1111039 ((_ is ValueCellFull!13113) mapDefault!43285)) b!1111034))

(assert (= start!97414 b!1111039))

(declare-fun b_lambda!18409 () Bool)

(assert (=> (not b_lambda!18409) (not bm!46849)))

(declare-fun t!34674 () Bool)

(declare-fun tb!8251 () Bool)

(assert (=> (and start!97414 (= defaultEntry!1004 defaultEntry!1004) t!34674) tb!8251))

(declare-fun result!17063 () Bool)

(assert (=> tb!8251 (= result!17063 tp_is_empty!27645)))

(assert (=> bm!46849 t!34674))

(declare-fun b_and!37609 () Bool)

(assert (= b_and!37607 (and (=> t!34674 result!17063) b_and!37609)))

(declare-fun m!1028917 () Bool)

(assert (=> b!1111042 m!1028917))

(declare-fun m!1028919 () Bool)

(assert (=> b!1111032 m!1028919))

(declare-fun m!1028921 () Bool)

(assert (=> start!97414 m!1028921))

(declare-fun m!1028923 () Bool)

(assert (=> start!97414 m!1028923))

(declare-fun m!1028925 () Bool)

(assert (=> bm!46848 m!1028925))

(declare-fun m!1028927 () Bool)

(assert (=> b!1111037 m!1028927))

(declare-fun m!1028929 () Bool)

(assert (=> b!1111041 m!1028929))

(declare-fun m!1028931 () Bool)

(assert (=> b!1111044 m!1028931))

(declare-fun m!1028933 () Bool)

(assert (=> b!1111038 m!1028933))

(declare-fun m!1028935 () Bool)

(assert (=> b!1111038 m!1028935))

(declare-fun m!1028937 () Bool)

(assert (=> bm!46849 m!1028937))

(declare-fun m!1028939 () Bool)

(assert (=> bm!46849 m!1028939))

(declare-fun m!1028941 () Bool)

(assert (=> bm!46849 m!1028941))

(declare-fun m!1028943 () Bool)

(assert (=> b!1111033 m!1028943))

(declare-fun m!1028945 () Bool)

(assert (=> b!1111031 m!1028945))

(declare-fun m!1028947 () Bool)

(assert (=> mapNonEmpty!43285 m!1028947))

(declare-fun m!1028949 () Bool)

(assert (=> b!1111040 m!1028949))

(declare-fun m!1028951 () Bool)

(assert (=> b!1111043 m!1028951))

(declare-fun m!1028953 () Bool)

(assert (=> b!1111043 m!1028953))

(check-sat (not b!1111041) (not b!1111031) (not b_lambda!18409) (not b!1111043) (not b_next!23385) (not b!1111042) (not b!1111040) (not b!1111037) (not bm!46849) (not b!1111033) (not mapNonEmpty!43285) (not b!1111038) (not start!97414) (not b!1111044) b_and!37609 (not bm!46848) tp_is_empty!27645)
(check-sat b_and!37609 (not b_next!23385))
