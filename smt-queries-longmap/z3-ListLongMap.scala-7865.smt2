; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97928 () Bool)

(assert start!97928)

(declare-fun b_free!23635 () Bool)

(declare-fun b_next!23635 () Bool)

(assert (=> start!97928 (= b_free!23635 (not b_next!23635))))

(declare-fun tp!83608 () Bool)

(declare-fun b_and!38031 () Bool)

(assert (=> start!97928 (= tp!83608 b_and!38031)))

(declare-fun b!1122052 () Bool)

(declare-fun res!749634 () Bool)

(declare-fun e!638818 () Bool)

(assert (=> b!1122052 (=> (not res!749634) (not e!638818))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73122 0))(
  ( (array!73123 (arr!35214 (Array (_ BitVec 32) (_ BitVec 64))) (size!35752 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73122)

(assert (=> b!1122052 (= res!749634 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35752 _keys!1208))))))

(declare-fun b!1122054 () Bool)

(declare-fun e!638817 () Bool)

(declare-fun e!638823 () Bool)

(assert (=> b!1122054 (= e!638817 e!638823)))

(declare-fun res!749632 () Bool)

(assert (=> b!1122054 (=> res!749632 e!638823)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1122054 (= res!749632 (not (= (select (arr!35214 _keys!1208) from!1455) k0!934)))))

(declare-fun e!638820 () Bool)

(assert (=> b!1122054 e!638820))

(declare-fun c!109416 () Bool)

(assert (=> b!1122054 (= c!109416 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42681 0))(
  ( (V!42682 (val!14139 Int)) )
))
(declare-fun zeroValue!944 () V!42681)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((Unit!36643 0))(
  ( (Unit!36644) )
))
(declare-fun lt!498419 () Unit!36643)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13373 0))(
  ( (ValueCellFull!13373 (v!16771 V!42681)) (EmptyCell!13373) )
))
(declare-datatypes ((array!73124 0))(
  ( (array!73125 (arr!35215 (Array (_ BitVec 32) ValueCell!13373)) (size!35753 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73124)

(declare-fun minValue!944 () V!42681)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!336 (array!73122 array!73124 (_ BitVec 32) (_ BitVec 32) V!42681 V!42681 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36643)

(assert (=> b!1122054 (= lt!498419 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!336 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44065 () Bool)

(declare-fun mapRes!44065 () Bool)

(assert (=> mapIsEmpty!44065 mapRes!44065))

(declare-fun b!1122055 () Bool)

(assert (=> b!1122055 (= e!638823 true)))

(declare-fun lt!498421 () Bool)

(declare-datatypes ((tuple2!17818 0))(
  ( (tuple2!17819 (_1!8920 (_ BitVec 64)) (_2!8920 V!42681)) )
))
(declare-datatypes ((List!24588 0))(
  ( (Nil!24585) (Cons!24584 (h!25793 tuple2!17818) (t!35206 List!24588)) )
))
(declare-datatypes ((ListLongMap!15787 0))(
  ( (ListLongMap!15788 (toList!7909 List!24588)) )
))
(declare-fun contains!6389 (ListLongMap!15787 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4416 (array!73122 array!73124 (_ BitVec 32) (_ BitVec 32) V!42681 V!42681 (_ BitVec 32) Int) ListLongMap!15787)

(assert (=> b!1122055 (= lt!498421 (contains!6389 (getCurrentListMapNoExtraKeys!4416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1122056 () Bool)

(declare-fun e!638825 () Bool)

(declare-fun e!638819 () Bool)

(assert (=> b!1122056 (= e!638825 (not e!638819))))

(declare-fun res!749626 () Bool)

(assert (=> b!1122056 (=> res!749626 e!638819)))

(assert (=> b!1122056 (= res!749626 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73122 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122056 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498417 () Unit!36643)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73122 (_ BitVec 64) (_ BitVec 32)) Unit!36643)

(assert (=> b!1122056 (= lt!498417 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1122057 () Bool)

(declare-fun e!638822 () Bool)

(declare-fun e!638821 () Bool)

(assert (=> b!1122057 (= e!638822 (and e!638821 mapRes!44065))))

(declare-fun condMapEmpty!44065 () Bool)

(declare-fun mapDefault!44065 () ValueCell!13373)

(assert (=> b!1122057 (= condMapEmpty!44065 (= (arr!35215 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13373)) mapDefault!44065)))))

(declare-fun b!1122058 () Bool)

(declare-fun tp_is_empty!28165 () Bool)

(assert (=> b!1122058 (= e!638821 tp_is_empty!28165)))

(declare-fun b!1122059 () Bool)

(assert (=> b!1122059 (= e!638819 e!638817)))

(declare-fun res!749628 () Bool)

(assert (=> b!1122059 (=> res!749628 e!638817)))

(assert (=> b!1122059 (= res!749628 (not (= from!1455 i!673)))))

(declare-fun lt!498423 () array!73122)

(declare-fun lt!498420 () array!73124)

(declare-fun lt!498422 () ListLongMap!15787)

(assert (=> b!1122059 (= lt!498422 (getCurrentListMapNoExtraKeys!4416 lt!498423 lt!498420 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2454 (Int (_ BitVec 64)) V!42681)

(assert (=> b!1122059 (= lt!498420 (array!73125 (store (arr!35215 _values!996) i!673 (ValueCellFull!13373 (dynLambda!2454 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35753 _values!996)))))

(declare-fun lt!498418 () ListLongMap!15787)

(assert (=> b!1122059 (= lt!498418 (getCurrentListMapNoExtraKeys!4416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1122060 () Bool)

(declare-fun res!749637 () Bool)

(assert (=> b!1122060 (=> (not res!749637) (not e!638818))))

(assert (=> b!1122060 (= res!749637 (= (select (arr!35214 _keys!1208) i!673) k0!934))))

(declare-fun b!1122061 () Bool)

(declare-fun res!749633 () Bool)

(assert (=> b!1122061 (=> (not res!749633) (not e!638818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122061 (= res!749633 (validKeyInArray!0 k0!934))))

(declare-fun b!1122062 () Bool)

(declare-fun call!47164 () ListLongMap!15787)

(declare-fun call!47165 () ListLongMap!15787)

(assert (=> b!1122062 (= e!638820 (= call!47164 call!47165))))

(declare-fun b!1122063 () Bool)

(declare-fun res!749635 () Bool)

(assert (=> b!1122063 (=> (not res!749635) (not e!638825))))

(declare-datatypes ((List!24589 0))(
  ( (Nil!24586) (Cons!24585 (h!25794 (_ BitVec 64)) (t!35207 List!24589)) )
))
(declare-fun arrayNoDuplicates!0 (array!73122 (_ BitVec 32) List!24589) Bool)

(assert (=> b!1122063 (= res!749635 (arrayNoDuplicates!0 lt!498423 #b00000000000000000000000000000000 Nil!24586))))

(declare-fun b!1122064 () Bool)

(declare-fun res!749629 () Bool)

(assert (=> b!1122064 (=> (not res!749629) (not e!638818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122064 (= res!749629 (validMask!0 mask!1564))))

(declare-fun b!1122065 () Bool)

(declare-fun res!749631 () Bool)

(assert (=> b!1122065 (=> (not res!749631) (not e!638818))))

(assert (=> b!1122065 (= res!749631 (and (= (size!35753 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35752 _keys!1208) (size!35753 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!47161 () Bool)

(assert (=> bm!47161 (= call!47164 (getCurrentListMapNoExtraKeys!4416 lt!498423 lt!498420 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122053 () Bool)

(assert (=> b!1122053 (= e!638818 e!638825)))

(declare-fun res!749630 () Bool)

(assert (=> b!1122053 (=> (not res!749630) (not e!638825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73122 (_ BitVec 32)) Bool)

(assert (=> b!1122053 (= res!749630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498423 mask!1564))))

(assert (=> b!1122053 (= lt!498423 (array!73123 (store (arr!35214 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35752 _keys!1208)))))

(declare-fun res!749636 () Bool)

(assert (=> start!97928 (=> (not res!749636) (not e!638818))))

(assert (=> start!97928 (= res!749636 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35752 _keys!1208))))))

(assert (=> start!97928 e!638818))

(assert (=> start!97928 tp_is_empty!28165))

(declare-fun array_inv!27110 (array!73122) Bool)

(assert (=> start!97928 (array_inv!27110 _keys!1208)))

(assert (=> start!97928 true))

(assert (=> start!97928 tp!83608))

(declare-fun array_inv!27111 (array!73124) Bool)

(assert (=> start!97928 (and (array_inv!27111 _values!996) e!638822)))

(declare-fun b!1122066 () Bool)

(declare-fun res!749638 () Bool)

(assert (=> b!1122066 (=> (not res!749638) (not e!638818))))

(assert (=> b!1122066 (= res!749638 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24586))))

(declare-fun b!1122067 () Bool)

(declare-fun e!638826 () Bool)

(assert (=> b!1122067 (= e!638826 tp_is_empty!28165)))

(declare-fun bm!47162 () Bool)

(assert (=> bm!47162 (= call!47165 (getCurrentListMapNoExtraKeys!4416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122068 () Bool)

(declare-fun res!749627 () Bool)

(assert (=> b!1122068 (=> (not res!749627) (not e!638818))))

(assert (=> b!1122068 (= res!749627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!44065 () Bool)

(declare-fun tp!83609 () Bool)

(assert (=> mapNonEmpty!44065 (= mapRes!44065 (and tp!83609 e!638826))))

(declare-fun mapKey!44065 () (_ BitVec 32))

(declare-fun mapRest!44065 () (Array (_ BitVec 32) ValueCell!13373))

(declare-fun mapValue!44065 () ValueCell!13373)

(assert (=> mapNonEmpty!44065 (= (arr!35215 _values!996) (store mapRest!44065 mapKey!44065 mapValue!44065))))

(declare-fun b!1122069 () Bool)

(declare-fun -!1060 (ListLongMap!15787 (_ BitVec 64)) ListLongMap!15787)

(assert (=> b!1122069 (= e!638820 (= call!47164 (-!1060 call!47165 k0!934)))))

(assert (= (and start!97928 res!749636) b!1122064))

(assert (= (and b!1122064 res!749629) b!1122065))

(assert (= (and b!1122065 res!749631) b!1122068))

(assert (= (and b!1122068 res!749627) b!1122066))

(assert (= (and b!1122066 res!749638) b!1122052))

(assert (= (and b!1122052 res!749634) b!1122061))

(assert (= (and b!1122061 res!749633) b!1122060))

(assert (= (and b!1122060 res!749637) b!1122053))

(assert (= (and b!1122053 res!749630) b!1122063))

(assert (= (and b!1122063 res!749635) b!1122056))

(assert (= (and b!1122056 (not res!749626)) b!1122059))

(assert (= (and b!1122059 (not res!749628)) b!1122054))

(assert (= (and b!1122054 c!109416) b!1122069))

(assert (= (and b!1122054 (not c!109416)) b!1122062))

(assert (= (or b!1122069 b!1122062) bm!47161))

(assert (= (or b!1122069 b!1122062) bm!47162))

(assert (= (and b!1122054 (not res!749632)) b!1122055))

(assert (= (and b!1122057 condMapEmpty!44065) mapIsEmpty!44065))

(assert (= (and b!1122057 (not condMapEmpty!44065)) mapNonEmpty!44065))

(get-info :version)

(assert (= (and mapNonEmpty!44065 ((_ is ValueCellFull!13373) mapValue!44065)) b!1122067))

(assert (= (and b!1122057 ((_ is ValueCellFull!13373) mapDefault!44065)) b!1122058))

(assert (= start!97928 b!1122057))

(declare-fun b_lambda!18587 () Bool)

(assert (=> (not b_lambda!18587) (not b!1122059)))

(declare-fun t!35205 () Bool)

(declare-fun tb!8439 () Bool)

(assert (=> (and start!97928 (= defaultEntry!1004 defaultEntry!1004) t!35205) tb!8439))

(declare-fun result!17447 () Bool)

(assert (=> tb!8439 (= result!17447 tp_is_empty!28165)))

(assert (=> b!1122059 t!35205))

(declare-fun b_and!38033 () Bool)

(assert (= b_and!38031 (and (=> t!35205 result!17447) b_and!38033)))

(declare-fun m!1036251 () Bool)

(assert (=> b!1122063 m!1036251))

(declare-fun m!1036253 () Bool)

(assert (=> b!1122054 m!1036253))

(declare-fun m!1036255 () Bool)

(assert (=> b!1122054 m!1036255))

(declare-fun m!1036257 () Bool)

(assert (=> b!1122069 m!1036257))

(declare-fun m!1036259 () Bool)

(assert (=> b!1122060 m!1036259))

(declare-fun m!1036261 () Bool)

(assert (=> b!1122055 m!1036261))

(assert (=> b!1122055 m!1036261))

(declare-fun m!1036263 () Bool)

(assert (=> b!1122055 m!1036263))

(declare-fun m!1036265 () Bool)

(assert (=> b!1122064 m!1036265))

(declare-fun m!1036267 () Bool)

(assert (=> mapNonEmpty!44065 m!1036267))

(assert (=> bm!47162 m!1036261))

(declare-fun m!1036269 () Bool)

(assert (=> start!97928 m!1036269))

(declare-fun m!1036271 () Bool)

(assert (=> start!97928 m!1036271))

(declare-fun m!1036273 () Bool)

(assert (=> bm!47161 m!1036273))

(declare-fun m!1036275 () Bool)

(assert (=> b!1122056 m!1036275))

(declare-fun m!1036277 () Bool)

(assert (=> b!1122056 m!1036277))

(declare-fun m!1036279 () Bool)

(assert (=> b!1122059 m!1036279))

(declare-fun m!1036281 () Bool)

(assert (=> b!1122059 m!1036281))

(declare-fun m!1036283 () Bool)

(assert (=> b!1122059 m!1036283))

(declare-fun m!1036285 () Bool)

(assert (=> b!1122059 m!1036285))

(declare-fun m!1036287 () Bool)

(assert (=> b!1122061 m!1036287))

(declare-fun m!1036289 () Bool)

(assert (=> b!1122068 m!1036289))

(declare-fun m!1036291 () Bool)

(assert (=> b!1122053 m!1036291))

(declare-fun m!1036293 () Bool)

(assert (=> b!1122053 m!1036293))

(declare-fun m!1036295 () Bool)

(assert (=> b!1122066 m!1036295))

(check-sat (not b!1122054) (not b!1122055) (not b!1122056) (not b!1122066) (not b!1122068) (not mapNonEmpty!44065) (not start!97928) (not b!1122069) (not b_lambda!18587) (not b_next!23635) (not b!1122053) (not bm!47161) tp_is_empty!28165 (not b!1122059) b_and!38033 (not b!1122064) (not b!1122063) (not b!1122061) (not bm!47162))
(check-sat b_and!38033 (not b_next!23635))
