; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97454 () Bool)

(assert start!97454)

(declare-fun b_free!23431 () Bool)

(declare-fun b_next!23431 () Bool)

(assert (=> start!97454 (= b_free!23431 (not b_next!23431))))

(declare-fun tp!82591 () Bool)

(declare-fun b_and!37677 () Bool)

(assert (=> start!97454 (= tp!82591 b_and!37677)))

(declare-fun b!1112052 () Bool)

(declare-fun res!742113 () Bool)

(declare-fun e!634047 () Bool)

(assert (=> b!1112052 (=> (not res!742113) (not e!634047))))

(declare-datatypes ((array!72192 0))(
  ( (array!72193 (arr!34749 (Array (_ BitVec 32) (_ BitVec 64))) (size!35287 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72192)

(declare-datatypes ((List!24315 0))(
  ( (Nil!24312) (Cons!24311 (h!25520 (_ BitVec 64)) (t!34783 List!24315)) )
))
(declare-fun arrayNoDuplicates!0 (array!72192 (_ BitVec 32) List!24315) Bool)

(assert (=> b!1112052 (= res!742113 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24312))))

(declare-fun mapNonEmpty!43354 () Bool)

(declare-fun mapRes!43354 () Bool)

(declare-fun tp!82592 () Bool)

(declare-fun e!634050 () Bool)

(assert (=> mapNonEmpty!43354 (= mapRes!43354 (and tp!82592 e!634050))))

(declare-datatypes ((V!42049 0))(
  ( (V!42050 (val!13902 Int)) )
))
(declare-datatypes ((ValueCell!13136 0))(
  ( (ValueCellFull!13136 (v!16534 V!42049)) (EmptyCell!13136) )
))
(declare-fun mapValue!43354 () ValueCell!13136)

(declare-fun mapKey!43354 () (_ BitVec 32))

(declare-datatypes ((array!72194 0))(
  ( (array!72195 (arr!34750 (Array (_ BitVec 32) ValueCell!13136)) (size!35288 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72194)

(declare-fun mapRest!43354 () (Array (_ BitVec 32) ValueCell!13136))

(assert (=> mapNonEmpty!43354 (= (arr!34750 _values!996) (store mapRest!43354 mapKey!43354 mapValue!43354))))

(declare-fun res!742112 () Bool)

(assert (=> start!97454 (=> (not res!742112) (not e!634047))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97454 (= res!742112 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35287 _keys!1208))))))

(assert (=> start!97454 e!634047))

(declare-fun tp_is_empty!27691 () Bool)

(assert (=> start!97454 tp_is_empty!27691))

(declare-fun array_inv!26790 (array!72192) Bool)

(assert (=> start!97454 (array_inv!26790 _keys!1208)))

(assert (=> start!97454 true))

(assert (=> start!97454 tp!82591))

(declare-fun e!634043 () Bool)

(declare-fun array_inv!26791 (array!72194) Bool)

(assert (=> start!97454 (and (array_inv!26791 _values!996) e!634043)))

(declare-fun b!1112053 () Bool)

(declare-fun e!634046 () Bool)

(assert (=> b!1112053 (= e!634046 tp_is_empty!27691)))

(declare-fun b!1112054 () Bool)

(declare-fun res!742110 () Bool)

(assert (=> b!1112054 (=> (not res!742110) (not e!634047))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72192 (_ BitVec 32)) Bool)

(assert (=> b!1112054 (= res!742110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43354 () Bool)

(assert (=> mapIsEmpty!43354 mapRes!43354))

(declare-fun b!1112055 () Bool)

(declare-fun e!634045 () Bool)

(declare-fun e!634044 () Bool)

(assert (=> b!1112055 (= e!634045 (not e!634044))))

(declare-fun res!742115 () Bool)

(assert (=> b!1112055 (=> res!742115 e!634044)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112055 (= res!742115 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35287 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72192 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112055 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36309 0))(
  ( (Unit!36310) )
))
(declare-fun lt!496277 () Unit!36309)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72192 (_ BitVec 64) (_ BitVec 32)) Unit!36309)

(assert (=> b!1112055 (= lt!496277 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1112056 () Bool)

(declare-fun res!742108 () Bool)

(assert (=> b!1112056 (=> (not res!742108) (not e!634047))))

(assert (=> b!1112056 (= res!742108 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35287 _keys!1208))))))

(declare-fun b!1112057 () Bool)

(assert (=> b!1112057 (= e!634047 e!634045)))

(declare-fun res!742111 () Bool)

(assert (=> b!1112057 (=> (not res!742111) (not e!634045))))

(declare-fun lt!496278 () array!72192)

(assert (=> b!1112057 (= res!742111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496278 mask!1564))))

(assert (=> b!1112057 (= lt!496278 (array!72193 (store (arr!34749 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35287 _keys!1208)))))

(declare-fun b!1112058 () Bool)

(declare-fun res!742107 () Bool)

(assert (=> b!1112058 (=> (not res!742107) (not e!634047))))

(assert (=> b!1112058 (= res!742107 (= (select (arr!34749 _keys!1208) i!673) k0!934))))

(declare-fun zeroValue!944 () V!42049)

(declare-fun bm!46963 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17664 0))(
  ( (tuple2!17665 (_1!8843 (_ BitVec 64)) (_2!8843 V!42049)) )
))
(declare-datatypes ((List!24316 0))(
  ( (Nil!24313) (Cons!24312 (h!25521 tuple2!17664) (t!34784 List!24316)) )
))
(declare-datatypes ((ListLongMap!15633 0))(
  ( (ListLongMap!15634 (toList!7832 List!24316)) )
))
(declare-fun call!46966 () ListLongMap!15633)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42049)

(declare-fun getCurrentListMapNoExtraKeys!4342 (array!72192 array!72194 (_ BitVec 32) (_ BitVec 32) V!42049 V!42049 (_ BitVec 32) Int) ListLongMap!15633)

(declare-fun dynLambda!2405 (Int (_ BitVec 64)) V!42049)

(assert (=> bm!46963 (= call!46966 (getCurrentListMapNoExtraKeys!4342 lt!496278 (array!72195 (store (arr!34750 _values!996) i!673 (ValueCellFull!13136 (dynLambda!2405 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35288 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112059 () Bool)

(declare-fun res!742109 () Bool)

(assert (=> b!1112059 (=> (not res!742109) (not e!634047))))

(assert (=> b!1112059 (= res!742109 (and (= (size!35288 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35287 _keys!1208) (size!35288 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112060 () Bool)

(declare-fun call!46967 () ListLongMap!15633)

(declare-fun e!634049 () Bool)

(declare-fun -!1040 (ListLongMap!15633 (_ BitVec 64)) ListLongMap!15633)

(assert (=> b!1112060 (= e!634049 (= call!46966 (-!1040 call!46967 k0!934)))))

(declare-fun b!1112061 () Bool)

(assert (=> b!1112061 (= e!634050 tp_is_empty!27691)))

(declare-fun b!1112062 () Bool)

(assert (=> b!1112062 (= e!634049 (= call!46966 call!46967))))

(declare-fun b!1112063 () Bool)

(assert (=> b!1112063 (= e!634043 (and e!634046 mapRes!43354))))

(declare-fun condMapEmpty!43354 () Bool)

(declare-fun mapDefault!43354 () ValueCell!13136)

(assert (=> b!1112063 (= condMapEmpty!43354 (= (arr!34750 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13136)) mapDefault!43354)))))

(declare-fun b!1112064 () Bool)

(declare-fun res!742117 () Bool)

(assert (=> b!1112064 (=> (not res!742117) (not e!634047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112064 (= res!742117 (validMask!0 mask!1564))))

(declare-fun b!1112065 () Bool)

(declare-fun res!742116 () Bool)

(assert (=> b!1112065 (=> (not res!742116) (not e!634045))))

(assert (=> b!1112065 (= res!742116 (arrayNoDuplicates!0 lt!496278 #b00000000000000000000000000000000 Nil!24312))))

(declare-fun bm!46964 () Bool)

(assert (=> bm!46964 (= call!46967 (getCurrentListMapNoExtraKeys!4342 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112066 () Bool)

(declare-fun res!742114 () Bool)

(assert (=> b!1112066 (=> (not res!742114) (not e!634047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112066 (= res!742114 (validKeyInArray!0 k0!934))))

(declare-fun b!1112067 () Bool)

(assert (=> b!1112067 (= e!634044 true)))

(assert (=> b!1112067 e!634049))

(declare-fun c!109317 () Bool)

(assert (=> b!1112067 (= c!109317 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496276 () Unit!36309)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!313 (array!72192 array!72194 (_ BitVec 32) (_ BitVec 32) V!42049 V!42049 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36309)

(assert (=> b!1112067 (= lt!496276 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!313 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97454 res!742112) b!1112064))

(assert (= (and b!1112064 res!742117) b!1112059))

(assert (= (and b!1112059 res!742109) b!1112054))

(assert (= (and b!1112054 res!742110) b!1112052))

(assert (= (and b!1112052 res!742113) b!1112056))

(assert (= (and b!1112056 res!742108) b!1112066))

(assert (= (and b!1112066 res!742114) b!1112058))

(assert (= (and b!1112058 res!742107) b!1112057))

(assert (= (and b!1112057 res!742111) b!1112065))

(assert (= (and b!1112065 res!742116) b!1112055))

(assert (= (and b!1112055 (not res!742115)) b!1112067))

(assert (= (and b!1112067 c!109317) b!1112060))

(assert (= (and b!1112067 (not c!109317)) b!1112062))

(assert (= (or b!1112060 b!1112062) bm!46964))

(assert (= (or b!1112060 b!1112062) bm!46963))

(assert (= (and b!1112063 condMapEmpty!43354) mapIsEmpty!43354))

(assert (= (and b!1112063 (not condMapEmpty!43354)) mapNonEmpty!43354))

(get-info :version)

(assert (= (and mapNonEmpty!43354 ((_ is ValueCellFull!13136) mapValue!43354)) b!1112061))

(assert (= (and b!1112063 ((_ is ValueCellFull!13136) mapDefault!43354)) b!1112053))

(assert (= start!97454 b!1112063))

(declare-fun b_lambda!18437 () Bool)

(assert (=> (not b_lambda!18437) (not bm!46963)))

(declare-fun t!34782 () Bool)

(declare-fun tb!8289 () Bool)

(assert (=> (and start!97454 (= defaultEntry!1004 defaultEntry!1004) t!34782) tb!8289))

(declare-fun result!17147 () Bool)

(assert (=> tb!8289 (= result!17147 tp_is_empty!27691)))

(assert (=> bm!46963 t!34782))

(declare-fun b_and!37679 () Bool)

(assert (= b_and!37677 (and (=> t!34782 result!17147) b_and!37679)))

(declare-fun m!1029165 () Bool)

(assert (=> b!1112065 m!1029165))

(declare-fun m!1029167 () Bool)

(assert (=> mapNonEmpty!43354 m!1029167))

(declare-fun m!1029169 () Bool)

(assert (=> b!1112054 m!1029169))

(declare-fun m!1029171 () Bool)

(assert (=> b!1112060 m!1029171))

(declare-fun m!1029173 () Bool)

(assert (=> b!1112057 m!1029173))

(declare-fun m!1029175 () Bool)

(assert (=> b!1112057 m!1029175))

(declare-fun m!1029177 () Bool)

(assert (=> b!1112067 m!1029177))

(declare-fun m!1029179 () Bool)

(assert (=> b!1112064 m!1029179))

(declare-fun m!1029181 () Bool)

(assert (=> b!1112052 m!1029181))

(declare-fun m!1029183 () Bool)

(assert (=> bm!46964 m!1029183))

(declare-fun m!1029185 () Bool)

(assert (=> b!1112058 m!1029185))

(declare-fun m!1029187 () Bool)

(assert (=> bm!46963 m!1029187))

(declare-fun m!1029189 () Bool)

(assert (=> bm!46963 m!1029189))

(declare-fun m!1029191 () Bool)

(assert (=> bm!46963 m!1029191))

(declare-fun m!1029193 () Bool)

(assert (=> b!1112066 m!1029193))

(declare-fun m!1029195 () Bool)

(assert (=> b!1112055 m!1029195))

(declare-fun m!1029197 () Bool)

(assert (=> b!1112055 m!1029197))

(declare-fun m!1029199 () Bool)

(assert (=> start!97454 m!1029199))

(declare-fun m!1029201 () Bool)

(assert (=> start!97454 m!1029201))

(check-sat (not b!1112067) (not b!1112052) (not b!1112055) (not b_next!23431) (not b!1112054) (not b!1112057) (not bm!46963) (not bm!46964) (not b!1112066) (not b!1112060) (not mapNonEmpty!43354) tp_is_empty!27691 (not b_lambda!18437) (not b!1112064) b_and!37679 (not start!97454) (not b!1112065))
(check-sat b_and!37679 (not b_next!23431))
