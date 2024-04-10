; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98170 () Bool)

(assert start!98170)

(declare-fun b_free!23871 () Bool)

(declare-fun b_next!23871 () Bool)

(assert (=> start!98170 (= b_free!23871 (not b_next!23871))))

(declare-fun tp!84316 () Bool)

(declare-fun b_and!38525 () Bool)

(assert (=> start!98170 (= tp!84316 b_and!38525)))

(declare-fun mapNonEmpty!44419 () Bool)

(declare-fun mapRes!44419 () Bool)

(declare-fun tp!84317 () Bool)

(declare-fun e!642567 () Bool)

(assert (=> mapNonEmpty!44419 (= mapRes!44419 (and tp!84317 e!642567))))

(declare-fun mapKey!44419 () (_ BitVec 32))

(declare-datatypes ((V!42995 0))(
  ( (V!42996 (val!14257 Int)) )
))
(declare-datatypes ((ValueCell!13491 0))(
  ( (ValueCellFull!13491 (v!16890 V!42995)) (EmptyCell!13491) )
))
(declare-fun mapRest!44419 () (Array (_ BitVec 32) ValueCell!13491))

(declare-datatypes ((array!73659 0))(
  ( (array!73660 (arr!35482 (Array (_ BitVec 32) ValueCell!13491)) (size!36018 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73659)

(declare-fun mapValue!44419 () ValueCell!13491)

(assert (=> mapNonEmpty!44419 (= (arr!35482 _values!996) (store mapRest!44419 mapKey!44419 mapValue!44419))))

(declare-fun b!1129036 () Bool)

(declare-fun e!642565 () Bool)

(declare-fun e!642561 () Bool)

(assert (=> b!1129036 (= e!642565 e!642561)))

(declare-fun res!754515 () Bool)

(assert (=> b!1129036 (=> (not res!754515) (not e!642561))))

(declare-datatypes ((array!73661 0))(
  ( (array!73662 (arr!35483 (Array (_ BitVec 32) (_ BitVec 64))) (size!36019 (_ BitVec 32))) )
))
(declare-fun lt!501200 () array!73661)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73661 (_ BitVec 32)) Bool)

(assert (=> b!1129036 (= res!754515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501200 mask!1564))))

(declare-fun _keys!1208 () array!73661)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129036 (= lt!501200 (array!73662 (store (arr!35483 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36019 _keys!1208)))))

(declare-datatypes ((tuple2!17948 0))(
  ( (tuple2!17949 (_1!8985 (_ BitVec 64)) (_2!8985 V!42995)) )
))
(declare-datatypes ((List!24716 0))(
  ( (Nil!24713) (Cons!24712 (h!25921 tuple2!17948) (t!35579 List!24716)) )
))
(declare-datatypes ((ListLongMap!15917 0))(
  ( (ListLongMap!15918 (toList!7974 List!24716)) )
))
(declare-fun call!47928 () ListLongMap!15917)

(declare-fun b!1129037 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!642558 () Bool)

(declare-fun call!47930 () ListLongMap!15917)

(declare-fun -!1156 (ListLongMap!15917 (_ BitVec 64)) ListLongMap!15917)

(assert (=> b!1129037 (= e!642558 (= call!47930 (-!1156 call!47928 k0!934)))))

(declare-fun b!1129038 () Bool)

(declare-fun e!642556 () Bool)

(declare-fun e!642562 () Bool)

(assert (=> b!1129038 (= e!642556 e!642562)))

(declare-fun res!754518 () Bool)

(assert (=> b!1129038 (=> res!754518 e!642562)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1129038 (= res!754518 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42995)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!501204 () array!73659)

(declare-fun lt!501201 () ListLongMap!15917)

(declare-fun minValue!944 () V!42995)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4461 (array!73661 array!73659 (_ BitVec 32) (_ BitVec 32) V!42995 V!42995 (_ BitVec 32) Int) ListLongMap!15917)

(assert (=> b!1129038 (= lt!501201 (getCurrentListMapNoExtraKeys!4461 lt!501200 lt!501204 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2541 (Int (_ BitVec 64)) V!42995)

(assert (=> b!1129038 (= lt!501204 (array!73660 (store (arr!35482 _values!996) i!673 (ValueCellFull!13491 (dynLambda!2541 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36018 _values!996)))))

(declare-fun lt!501211 () ListLongMap!15917)

(assert (=> b!1129038 (= lt!501211 (getCurrentListMapNoExtraKeys!4461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1129039 () Bool)

(assert (=> b!1129039 (= e!642561 (not e!642556))))

(declare-fun res!754514 () Bool)

(assert (=> b!1129039 (=> res!754514 e!642556)))

(assert (=> b!1129039 (= res!754514 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129039 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36986 0))(
  ( (Unit!36987) )
))
(declare-fun lt!501198 () Unit!36986)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73661 (_ BitVec 64) (_ BitVec 32)) Unit!36986)

(assert (=> b!1129039 (= lt!501198 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1129040 () Bool)

(declare-fun res!754516 () Bool)

(assert (=> b!1129040 (=> (not res!754516) (not e!642565))))

(declare-datatypes ((List!24717 0))(
  ( (Nil!24714) (Cons!24713 (h!25922 (_ BitVec 64)) (t!35580 List!24717)) )
))
(declare-fun arrayNoDuplicates!0 (array!73661 (_ BitVec 32) List!24717) Bool)

(assert (=> b!1129040 (= res!754516 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24714))))

(declare-fun res!754520 () Bool)

(assert (=> start!98170 (=> (not res!754520) (not e!642565))))

(assert (=> start!98170 (= res!754520 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36019 _keys!1208))))))

(assert (=> start!98170 e!642565))

(declare-fun tp_is_empty!28401 () Bool)

(assert (=> start!98170 tp_is_empty!28401))

(declare-fun array_inv!27222 (array!73661) Bool)

(assert (=> start!98170 (array_inv!27222 _keys!1208)))

(assert (=> start!98170 true))

(assert (=> start!98170 tp!84316))

(declare-fun e!642554 () Bool)

(declare-fun array_inv!27223 (array!73659) Bool)

(assert (=> start!98170 (and (array_inv!27223 _values!996) e!642554)))

(declare-fun b!1129041 () Bool)

(declare-fun res!754526 () Bool)

(assert (=> b!1129041 (=> (not res!754526) (not e!642565))))

(assert (=> b!1129041 (= res!754526 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36019 _keys!1208))))))

(declare-fun b!1129042 () Bool)

(assert (=> b!1129042 (= e!642558 (= call!47930 call!47928))))

(declare-fun b!1129043 () Bool)

(declare-fun res!754519 () Bool)

(assert (=> b!1129043 (=> (not res!754519) (not e!642565))))

(assert (=> b!1129043 (= res!754519 (= (select (arr!35483 _keys!1208) i!673) k0!934))))

(declare-fun b!1129044 () Bool)

(declare-fun e!642557 () Unit!36986)

(declare-fun lt!501199 () Unit!36986)

(assert (=> b!1129044 (= e!642557 lt!501199)))

(declare-fun call!47929 () Unit!36986)

(assert (=> b!1129044 (= lt!501199 call!47929)))

(declare-fun call!47932 () Bool)

(assert (=> b!1129044 call!47932))

(declare-fun b!1129045 () Bool)

(declare-fun res!754527 () Bool)

(assert (=> b!1129045 (=> (not res!754527) (not e!642561))))

(assert (=> b!1129045 (= res!754527 (arrayNoDuplicates!0 lt!501200 #b00000000000000000000000000000000 Nil!24714))))

(declare-fun b!1129046 () Bool)

(declare-fun res!754523 () Bool)

(assert (=> b!1129046 (=> (not res!754523) (not e!642565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129046 (= res!754523 (validMask!0 mask!1564))))

(declare-fun bm!47922 () Bool)

(declare-fun call!47931 () Bool)

(assert (=> bm!47922 (= call!47932 call!47931)))

(declare-fun b!1129047 () Bool)

(declare-fun e!642559 () Unit!36986)

(declare-fun e!642566 () Unit!36986)

(assert (=> b!1129047 (= e!642559 e!642566)))

(declare-fun c!109813 () Bool)

(declare-fun lt!501212 () Bool)

(assert (=> b!1129047 (= c!109813 (and (not lt!501212) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1129048 () Bool)

(declare-fun e!642553 () Bool)

(declare-fun e!642560 () Bool)

(assert (=> b!1129048 (= e!642553 e!642560)))

(declare-fun res!754517 () Bool)

(assert (=> b!1129048 (=> res!754517 e!642560)))

(declare-fun lt!501207 () ListLongMap!15917)

(declare-fun contains!6497 (ListLongMap!15917 (_ BitVec 64)) Bool)

(assert (=> b!1129048 (= res!754517 (not (contains!6497 lt!501207 k0!934)))))

(assert (=> b!1129048 (= lt!501207 (getCurrentListMapNoExtraKeys!4461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129049 () Bool)

(assert (=> b!1129049 (= e!642562 e!642553)))

(declare-fun res!754522 () Bool)

(assert (=> b!1129049 (=> res!754522 e!642553)))

(assert (=> b!1129049 (= res!754522 (not (= (select (arr!35483 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1129049 e!642558))

(declare-fun c!109814 () Bool)

(assert (=> b!1129049 (= c!109814 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501209 () Unit!36986)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!409 (array!73661 array!73659 (_ BitVec 32) (_ BitVec 32) V!42995 V!42995 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36986)

(assert (=> b!1129049 (= lt!501209 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!409 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129050 () Bool)

(assert (=> b!1129050 call!47932))

(declare-fun lt!501202 () Unit!36986)

(assert (=> b!1129050 (= lt!501202 call!47929)))

(assert (=> b!1129050 (= e!642566 lt!501202)))

(declare-fun b!1129051 () Bool)

(declare-fun lt!501208 () Unit!36986)

(assert (=> b!1129051 (= e!642559 lt!501208)))

(declare-fun lt!501205 () Unit!36986)

(declare-fun call!47926 () Unit!36986)

(assert (=> b!1129051 (= lt!501205 call!47926)))

(declare-fun lt!501206 () ListLongMap!15917)

(declare-fun +!3426 (ListLongMap!15917 tuple2!17948) ListLongMap!15917)

(assert (=> b!1129051 (= lt!501206 (+!3426 lt!501207 (tuple2!17949 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1129051 call!47931))

(declare-fun addStillContains!688 (ListLongMap!15917 (_ BitVec 64) V!42995 (_ BitVec 64)) Unit!36986)

(assert (=> b!1129051 (= lt!501208 (addStillContains!688 lt!501206 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!47925 () ListLongMap!15917)

(assert (=> b!1129051 (contains!6497 call!47925 k0!934)))

(declare-fun c!109815 () Bool)

(declare-fun bm!47923 () Bool)

(assert (=> bm!47923 (= call!47925 (+!3426 (ite c!109815 lt!501206 lt!501207) (ite c!109815 (tuple2!17949 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!109813 (tuple2!17949 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17949 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1129052 () Bool)

(declare-fun e!642555 () Bool)

(assert (=> b!1129052 (= e!642560 e!642555)))

(declare-fun res!754525 () Bool)

(assert (=> b!1129052 (=> res!754525 e!642555)))

(assert (=> b!1129052 (= res!754525 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36019 _keys!1208))))))

(declare-fun lt!501210 () Unit!36986)

(assert (=> b!1129052 (= lt!501210 e!642559)))

(assert (=> b!1129052 (= c!109815 (and (not lt!501212) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1129052 (= lt!501212 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1129053 () Bool)

(assert (=> b!1129053 (= e!642555 true)))

(declare-fun lt!501203 () Bool)

(declare-fun getCurrentListMap!4413 (array!73661 array!73659 (_ BitVec 32) (_ BitVec 32) V!42995 V!42995 (_ BitVec 32) Int) ListLongMap!15917)

(assert (=> b!1129053 (= lt!501203 (contains!6497 (getCurrentListMap!4413 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun bm!47924 () Bool)

(assert (=> bm!47924 (= call!47929 call!47926)))

(declare-fun b!1129054 () Bool)

(declare-fun c!109812 () Bool)

(assert (=> b!1129054 (= c!109812 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501212))))

(assert (=> b!1129054 (= e!642566 e!642557)))

(declare-fun b!1129055 () Bool)

(declare-fun res!754528 () Bool)

(assert (=> b!1129055 (=> (not res!754528) (not e!642565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129055 (= res!754528 (validKeyInArray!0 k0!934))))

(declare-fun b!1129056 () Bool)

(assert (=> b!1129056 (= e!642567 tp_is_empty!28401)))

(declare-fun b!1129057 () Bool)

(declare-fun res!754524 () Bool)

(assert (=> b!1129057 (=> (not res!754524) (not e!642565))))

(assert (=> b!1129057 (= res!754524 (and (= (size!36018 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36019 _keys!1208) (size!36018 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!47927 () ListLongMap!15917)

(declare-fun bm!47925 () Bool)

(assert (=> bm!47925 (= call!47931 (contains!6497 (ite c!109815 lt!501206 call!47927) k0!934))))

(declare-fun bm!47926 () Bool)

(assert (=> bm!47926 (= call!47926 (addStillContains!688 lt!501207 (ite (or c!109815 c!109813) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!109815 c!109813) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!47927 () Bool)

(assert (=> bm!47927 (= call!47930 (getCurrentListMapNoExtraKeys!4461 lt!501200 lt!501204 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44419 () Bool)

(assert (=> mapIsEmpty!44419 mapRes!44419))

(declare-fun bm!47928 () Bool)

(assert (=> bm!47928 (= call!47927 call!47925)))

(declare-fun b!1129058 () Bool)

(declare-fun res!754521 () Bool)

(assert (=> b!1129058 (=> (not res!754521) (not e!642565))))

(assert (=> b!1129058 (= res!754521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!47929 () Bool)

(assert (=> bm!47929 (= call!47928 (getCurrentListMapNoExtraKeys!4461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129059 () Bool)

(declare-fun e!642563 () Bool)

(assert (=> b!1129059 (= e!642554 (and e!642563 mapRes!44419))))

(declare-fun condMapEmpty!44419 () Bool)

(declare-fun mapDefault!44419 () ValueCell!13491)

(assert (=> b!1129059 (= condMapEmpty!44419 (= (arr!35482 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13491)) mapDefault!44419)))))

(declare-fun b!1129060 () Bool)

(assert (=> b!1129060 (= e!642563 tp_is_empty!28401)))

(declare-fun b!1129061 () Bool)

(declare-fun Unit!36988 () Unit!36986)

(assert (=> b!1129061 (= e!642557 Unit!36988)))

(assert (= (and start!98170 res!754520) b!1129046))

(assert (= (and b!1129046 res!754523) b!1129057))

(assert (= (and b!1129057 res!754524) b!1129058))

(assert (= (and b!1129058 res!754521) b!1129040))

(assert (= (and b!1129040 res!754516) b!1129041))

(assert (= (and b!1129041 res!754526) b!1129055))

(assert (= (and b!1129055 res!754528) b!1129043))

(assert (= (and b!1129043 res!754519) b!1129036))

(assert (= (and b!1129036 res!754515) b!1129045))

(assert (= (and b!1129045 res!754527) b!1129039))

(assert (= (and b!1129039 (not res!754514)) b!1129038))

(assert (= (and b!1129038 (not res!754518)) b!1129049))

(assert (= (and b!1129049 c!109814) b!1129037))

(assert (= (and b!1129049 (not c!109814)) b!1129042))

(assert (= (or b!1129037 b!1129042) bm!47927))

(assert (= (or b!1129037 b!1129042) bm!47929))

(assert (= (and b!1129049 (not res!754522)) b!1129048))

(assert (= (and b!1129048 (not res!754517)) b!1129052))

(assert (= (and b!1129052 c!109815) b!1129051))

(assert (= (and b!1129052 (not c!109815)) b!1129047))

(assert (= (and b!1129047 c!109813) b!1129050))

(assert (= (and b!1129047 (not c!109813)) b!1129054))

(assert (= (and b!1129054 c!109812) b!1129044))

(assert (= (and b!1129054 (not c!109812)) b!1129061))

(assert (= (or b!1129050 b!1129044) bm!47924))

(assert (= (or b!1129050 b!1129044) bm!47928))

(assert (= (or b!1129050 b!1129044) bm!47922))

(assert (= (or b!1129051 bm!47922) bm!47925))

(assert (= (or b!1129051 bm!47924) bm!47926))

(assert (= (or b!1129051 bm!47928) bm!47923))

(assert (= (and b!1129052 (not res!754525)) b!1129053))

(assert (= (and b!1129059 condMapEmpty!44419) mapIsEmpty!44419))

(assert (= (and b!1129059 (not condMapEmpty!44419)) mapNonEmpty!44419))

(get-info :version)

(assert (= (and mapNonEmpty!44419 ((_ is ValueCellFull!13491) mapValue!44419)) b!1129056))

(assert (= (and b!1129059 ((_ is ValueCellFull!13491) mapDefault!44419)) b!1129060))

(assert (= start!98170 b!1129059))

(declare-fun b_lambda!18841 () Bool)

(assert (=> (not b_lambda!18841) (not b!1129038)))

(declare-fun t!35578 () Bool)

(declare-fun tb!8683 () Bool)

(assert (=> (and start!98170 (= defaultEntry!1004 defaultEntry!1004) t!35578) tb!8683))

(declare-fun result!17927 () Bool)

(assert (=> tb!8683 (= result!17927 tp_is_empty!28401)))

(assert (=> b!1129038 t!35578))

(declare-fun b_and!38527 () Bool)

(assert (= b_and!38525 (and (=> t!35578 result!17927) b_and!38527)))

(declare-fun m!1042507 () Bool)

(assert (=> b!1129037 m!1042507))

(declare-fun m!1042509 () Bool)

(assert (=> bm!47923 m!1042509))

(declare-fun m!1042511 () Bool)

(assert (=> bm!47927 m!1042511))

(declare-fun m!1042513 () Bool)

(assert (=> b!1129040 m!1042513))

(declare-fun m!1042515 () Bool)

(assert (=> b!1129039 m!1042515))

(declare-fun m!1042517 () Bool)

(assert (=> b!1129039 m!1042517))

(declare-fun m!1042519 () Bool)

(assert (=> bm!47929 m!1042519))

(declare-fun m!1042521 () Bool)

(assert (=> b!1129038 m!1042521))

(declare-fun m!1042523 () Bool)

(assert (=> b!1129038 m!1042523))

(declare-fun m!1042525 () Bool)

(assert (=> b!1129038 m!1042525))

(declare-fun m!1042527 () Bool)

(assert (=> b!1129038 m!1042527))

(declare-fun m!1042529 () Bool)

(assert (=> b!1129055 m!1042529))

(declare-fun m!1042531 () Bool)

(assert (=> b!1129058 m!1042531))

(declare-fun m!1042533 () Bool)

(assert (=> b!1129045 m!1042533))

(declare-fun m!1042535 () Bool)

(assert (=> start!98170 m!1042535))

(declare-fun m!1042537 () Bool)

(assert (=> start!98170 m!1042537))

(declare-fun m!1042539 () Bool)

(assert (=> b!1129036 m!1042539))

(declare-fun m!1042541 () Bool)

(assert (=> b!1129036 m!1042541))

(declare-fun m!1042543 () Bool)

(assert (=> b!1129051 m!1042543))

(declare-fun m!1042545 () Bool)

(assert (=> b!1129051 m!1042545))

(declare-fun m!1042547 () Bool)

(assert (=> b!1129051 m!1042547))

(declare-fun m!1042549 () Bool)

(assert (=> b!1129048 m!1042549))

(assert (=> b!1129048 m!1042519))

(declare-fun m!1042551 () Bool)

(assert (=> b!1129049 m!1042551))

(declare-fun m!1042553 () Bool)

(assert (=> b!1129049 m!1042553))

(declare-fun m!1042555 () Bool)

(assert (=> b!1129043 m!1042555))

(declare-fun m!1042557 () Bool)

(assert (=> b!1129053 m!1042557))

(assert (=> b!1129053 m!1042557))

(declare-fun m!1042559 () Bool)

(assert (=> b!1129053 m!1042559))

(declare-fun m!1042561 () Bool)

(assert (=> mapNonEmpty!44419 m!1042561))

(declare-fun m!1042563 () Bool)

(assert (=> bm!47926 m!1042563))

(declare-fun m!1042565 () Bool)

(assert (=> b!1129046 m!1042565))

(declare-fun m!1042567 () Bool)

(assert (=> bm!47925 m!1042567))

(check-sat (not bm!47926) (not b!1129053) (not bm!47927) (not b!1129055) (not b!1129058) (not bm!47925) (not b!1129048) (not b!1129045) b_and!38527 (not b!1129037) tp_is_empty!28401 (not b!1129038) (not start!98170) (not b!1129051) (not b!1129039) (not b!1129040) (not mapNonEmpty!44419) (not bm!47929) (not b!1129036) (not bm!47923) (not b!1129049) (not b_lambda!18841) (not b_next!23871) (not b!1129046))
(check-sat b_and!38527 (not b_next!23871))
