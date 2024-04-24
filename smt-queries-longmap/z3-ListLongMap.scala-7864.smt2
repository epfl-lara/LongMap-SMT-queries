; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98164 () Bool)

(assert start!98164)

(declare-fun b_free!23629 () Bool)

(declare-fun b_next!23629 () Bool)

(assert (=> start!98164 (= b_free!23629 (not b_next!23629))))

(declare-fun tp!83590 () Bool)

(declare-fun b_and!38051 () Bool)

(assert (=> start!98164 (= tp!83590 b_and!38051)))

(declare-fun b!1123340 () Bool)

(declare-fun e!639663 () Bool)

(declare-fun e!639672 () Bool)

(assert (=> b!1123340 (= e!639663 e!639672)))

(declare-fun res!750110 () Bool)

(assert (=> b!1123340 (=> res!750110 e!639672)))

(declare-datatypes ((array!73241 0))(
  ( (array!73242 (arr!35267 (Array (_ BitVec 32) (_ BitVec 64))) (size!35804 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73241)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1123340 (= res!750110 (not (= (select (arr!35267 _keys!1208) from!1455) k0!934)))))

(declare-fun e!639664 () Bool)

(assert (=> b!1123340 e!639664))

(declare-fun c!109844 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123340 (= c!109844 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42673 0))(
  ( (V!42674 (val!14136 Int)) )
))
(declare-fun zeroValue!944 () V!42673)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36795 0))(
  ( (Unit!36796) )
))
(declare-fun lt!499072 () Unit!36795)

(declare-datatypes ((ValueCell!13370 0))(
  ( (ValueCellFull!13370 (v!16765 V!42673)) (EmptyCell!13370) )
))
(declare-datatypes ((array!73243 0))(
  ( (array!73244 (arr!35268 (Array (_ BitVec 32) ValueCell!13370)) (size!35805 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73243)

(declare-fun minValue!944 () V!42673)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!341 (array!73241 array!73243 (_ BitVec 32) (_ BitVec 32) V!42673 V!42673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36795)

(assert (=> b!1123340 (= lt!499072 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!341 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((tuple2!17754 0))(
  ( (tuple2!17755 (_1!8888 (_ BitVec 64)) (_2!8888 V!42673)) )
))
(declare-datatypes ((List!24551 0))(
  ( (Nil!24548) (Cons!24547 (h!25765 tuple2!17754) (t!35164 List!24551)) )
))
(declare-datatypes ((ListLongMap!15731 0))(
  ( (ListLongMap!15732 (toList!7881 List!24551)) )
))
(declare-fun call!47236 () ListLongMap!15731)

(declare-fun bm!47233 () Bool)

(declare-fun lt!499074 () array!73241)

(declare-fun lt!499075 () array!73243)

(declare-fun getCurrentListMapNoExtraKeys!4410 (array!73241 array!73243 (_ BitVec 32) (_ BitVec 32) V!42673 V!42673 (_ BitVec 32) Int) ListLongMap!15731)

(assert (=> bm!47233 (= call!47236 (getCurrentListMapNoExtraKeys!4410 lt!499074 lt!499075 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123342 () Bool)

(declare-fun call!47237 () ListLongMap!15731)

(assert (=> b!1123342 (= e!639664 (= call!47236 call!47237))))

(declare-fun b!1123343 () Bool)

(declare-fun res!750105 () Bool)

(declare-fun e!639666 () Bool)

(assert (=> b!1123343 (=> (not res!750105) (not e!639666))))

(assert (=> b!1123343 (= res!750105 (and (= (size!35805 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35804 _keys!1208) (size!35805 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123344 () Bool)

(declare-fun -!1079 (ListLongMap!15731 (_ BitVec 64)) ListLongMap!15731)

(assert (=> b!1123344 (= e!639664 (= call!47236 (-!1079 call!47237 k0!934)))))

(declare-fun b!1123345 () Bool)

(declare-fun res!750103 () Bool)

(assert (=> b!1123345 (=> (not res!750103) (not e!639666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123345 (= res!750103 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!44056 () Bool)

(declare-fun mapRes!44056 () Bool)

(declare-fun tp!83591 () Bool)

(declare-fun e!639665 () Bool)

(assert (=> mapNonEmpty!44056 (= mapRes!44056 (and tp!83591 e!639665))))

(declare-fun mapKey!44056 () (_ BitVec 32))

(declare-fun mapRest!44056 () (Array (_ BitVec 32) ValueCell!13370))

(declare-fun mapValue!44056 () ValueCell!13370)

(assert (=> mapNonEmpty!44056 (= (arr!35268 _values!996) (store mapRest!44056 mapKey!44056 mapValue!44056))))

(declare-fun b!1123346 () Bool)

(declare-fun e!639667 () Bool)

(assert (=> b!1123346 (= e!639667 e!639663)))

(declare-fun res!750104 () Bool)

(assert (=> b!1123346 (=> res!750104 e!639663)))

(assert (=> b!1123346 (= res!750104 (not (= from!1455 i!673)))))

(declare-fun lt!499069 () ListLongMap!15731)

(assert (=> b!1123346 (= lt!499069 (getCurrentListMapNoExtraKeys!4410 lt!499074 lt!499075 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2496 (Int (_ BitVec 64)) V!42673)

(assert (=> b!1123346 (= lt!499075 (array!73244 (store (arr!35268 _values!996) i!673 (ValueCellFull!13370 (dynLambda!2496 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35805 _values!996)))))

(declare-fun lt!499070 () ListLongMap!15731)

(assert (=> b!1123346 (= lt!499070 (getCurrentListMapNoExtraKeys!4410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123347 () Bool)

(declare-fun res!750107 () Bool)

(assert (=> b!1123347 (=> (not res!750107) (not e!639666))))

(assert (=> b!1123347 (= res!750107 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35804 _keys!1208))))))

(declare-fun b!1123348 () Bool)

(declare-fun res!750111 () Bool)

(assert (=> b!1123348 (=> (not res!750111) (not e!639666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73241 (_ BitVec 32)) Bool)

(assert (=> b!1123348 (= res!750111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123349 () Bool)

(declare-fun res!750100 () Bool)

(declare-fun e!639670 () Bool)

(assert (=> b!1123349 (=> (not res!750100) (not e!639670))))

(declare-datatypes ((List!24552 0))(
  ( (Nil!24549) (Cons!24548 (h!25766 (_ BitVec 64)) (t!35165 List!24552)) )
))
(declare-fun arrayNoDuplicates!0 (array!73241 (_ BitVec 32) List!24552) Bool)

(assert (=> b!1123349 (= res!750100 (arrayNoDuplicates!0 lt!499074 #b00000000000000000000000000000000 Nil!24549))))

(declare-fun b!1123350 () Bool)

(declare-fun res!750109 () Bool)

(assert (=> b!1123350 (=> (not res!750109) (not e!639666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123350 (= res!750109 (validKeyInArray!0 k0!934))))

(declare-fun b!1123351 () Bool)

(assert (=> b!1123351 (= e!639666 e!639670)))

(declare-fun res!750112 () Bool)

(assert (=> b!1123351 (=> (not res!750112) (not e!639670))))

(assert (=> b!1123351 (= res!750112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499074 mask!1564))))

(assert (=> b!1123351 (= lt!499074 (array!73242 (store (arr!35267 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35804 _keys!1208)))))

(declare-fun b!1123352 () Bool)

(declare-fun e!639671 () Bool)

(declare-fun tp_is_empty!28159 () Bool)

(assert (=> b!1123352 (= e!639671 tp_is_empty!28159)))

(declare-fun b!1123353 () Bool)

(declare-fun e!639669 () Bool)

(assert (=> b!1123353 (= e!639669 (and e!639671 mapRes!44056))))

(declare-fun condMapEmpty!44056 () Bool)

(declare-fun mapDefault!44056 () ValueCell!13370)

(assert (=> b!1123353 (= condMapEmpty!44056 (= (arr!35268 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13370)) mapDefault!44056)))))

(declare-fun b!1123354 () Bool)

(assert (=> b!1123354 (= e!639672 true)))

(declare-fun lt!499073 () Bool)

(declare-fun contains!6444 (ListLongMap!15731 (_ BitVec 64)) Bool)

(assert (=> b!1123354 (= lt!499073 (contains!6444 (getCurrentListMapNoExtraKeys!4410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun mapIsEmpty!44056 () Bool)

(assert (=> mapIsEmpty!44056 mapRes!44056))

(declare-fun b!1123355 () Bool)

(declare-fun res!750108 () Bool)

(assert (=> b!1123355 (=> (not res!750108) (not e!639666))))

(assert (=> b!1123355 (= res!750108 (= (select (arr!35267 _keys!1208) i!673) k0!934))))

(declare-fun bm!47234 () Bool)

(assert (=> bm!47234 (= call!47237 (getCurrentListMapNoExtraKeys!4410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!750106 () Bool)

(assert (=> start!98164 (=> (not res!750106) (not e!639666))))

(assert (=> start!98164 (= res!750106 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35804 _keys!1208))))))

(assert (=> start!98164 e!639666))

(assert (=> start!98164 tp_is_empty!28159))

(declare-fun array_inv!27146 (array!73241) Bool)

(assert (=> start!98164 (array_inv!27146 _keys!1208)))

(assert (=> start!98164 true))

(assert (=> start!98164 tp!83590))

(declare-fun array_inv!27147 (array!73243) Bool)

(assert (=> start!98164 (and (array_inv!27147 _values!996) e!639669)))

(declare-fun b!1123341 () Bool)

(assert (=> b!1123341 (= e!639670 (not e!639667))))

(declare-fun res!750101 () Bool)

(assert (=> b!1123341 (=> res!750101 e!639667)))

(assert (=> b!1123341 (= res!750101 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123341 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499071 () Unit!36795)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73241 (_ BitVec 64) (_ BitVec 32)) Unit!36795)

(assert (=> b!1123341 (= lt!499071 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1123356 () Bool)

(declare-fun res!750102 () Bool)

(assert (=> b!1123356 (=> (not res!750102) (not e!639666))))

(assert (=> b!1123356 (= res!750102 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24549))))

(declare-fun b!1123357 () Bool)

(assert (=> b!1123357 (= e!639665 tp_is_empty!28159)))

(assert (= (and start!98164 res!750106) b!1123345))

(assert (= (and b!1123345 res!750103) b!1123343))

(assert (= (and b!1123343 res!750105) b!1123348))

(assert (= (and b!1123348 res!750111) b!1123356))

(assert (= (and b!1123356 res!750102) b!1123347))

(assert (= (and b!1123347 res!750107) b!1123350))

(assert (= (and b!1123350 res!750109) b!1123355))

(assert (= (and b!1123355 res!750108) b!1123351))

(assert (= (and b!1123351 res!750112) b!1123349))

(assert (= (and b!1123349 res!750100) b!1123341))

(assert (= (and b!1123341 (not res!750101)) b!1123346))

(assert (= (and b!1123346 (not res!750104)) b!1123340))

(assert (= (and b!1123340 c!109844) b!1123344))

(assert (= (and b!1123340 (not c!109844)) b!1123342))

(assert (= (or b!1123344 b!1123342) bm!47233))

(assert (= (or b!1123344 b!1123342) bm!47234))

(assert (= (and b!1123340 (not res!750110)) b!1123354))

(assert (= (and b!1123353 condMapEmpty!44056) mapIsEmpty!44056))

(assert (= (and b!1123353 (not condMapEmpty!44056)) mapNonEmpty!44056))

(get-info :version)

(assert (= (and mapNonEmpty!44056 ((_ is ValueCellFull!13370) mapValue!44056)) b!1123357))

(assert (= (and b!1123353 ((_ is ValueCellFull!13370) mapDefault!44056)) b!1123352))

(assert (= start!98164 b!1123353))

(declare-fun b_lambda!18609 () Bool)

(assert (=> (not b_lambda!18609) (not b!1123346)))

(declare-fun t!35163 () Bool)

(declare-fun tb!8433 () Bool)

(assert (=> (and start!98164 (= defaultEntry!1004 defaultEntry!1004) t!35163) tb!8433))

(declare-fun result!17435 () Bool)

(assert (=> tb!8433 (= result!17435 tp_is_empty!28159)))

(assert (=> b!1123346 t!35163))

(declare-fun b_and!38053 () Bool)

(assert (= b_and!38051 (and (=> t!35163 result!17435) b_and!38053)))

(declare-fun m!1038411 () Bool)

(assert (=> b!1123355 m!1038411))

(declare-fun m!1038413 () Bool)

(assert (=> b!1123351 m!1038413))

(declare-fun m!1038415 () Bool)

(assert (=> b!1123351 m!1038415))

(declare-fun m!1038417 () Bool)

(assert (=> b!1123344 m!1038417))

(declare-fun m!1038419 () Bool)

(assert (=> bm!47233 m!1038419))

(declare-fun m!1038421 () Bool)

(assert (=> bm!47234 m!1038421))

(declare-fun m!1038423 () Bool)

(assert (=> b!1123356 m!1038423))

(declare-fun m!1038425 () Bool)

(assert (=> b!1123350 m!1038425))

(declare-fun m!1038427 () Bool)

(assert (=> start!98164 m!1038427))

(declare-fun m!1038429 () Bool)

(assert (=> start!98164 m!1038429))

(declare-fun m!1038431 () Bool)

(assert (=> b!1123348 m!1038431))

(declare-fun m!1038433 () Bool)

(assert (=> b!1123349 m!1038433))

(declare-fun m!1038435 () Bool)

(assert (=> b!1123341 m!1038435))

(declare-fun m!1038437 () Bool)

(assert (=> b!1123341 m!1038437))

(declare-fun m!1038439 () Bool)

(assert (=> b!1123346 m!1038439))

(declare-fun m!1038441 () Bool)

(assert (=> b!1123346 m!1038441))

(declare-fun m!1038443 () Bool)

(assert (=> b!1123346 m!1038443))

(declare-fun m!1038445 () Bool)

(assert (=> b!1123346 m!1038445))

(assert (=> b!1123354 m!1038421))

(assert (=> b!1123354 m!1038421))

(declare-fun m!1038447 () Bool)

(assert (=> b!1123354 m!1038447))

(declare-fun m!1038449 () Bool)

(assert (=> b!1123345 m!1038449))

(declare-fun m!1038451 () Bool)

(assert (=> b!1123340 m!1038451))

(declare-fun m!1038453 () Bool)

(assert (=> b!1123340 m!1038453))

(declare-fun m!1038455 () Bool)

(assert (=> mapNonEmpty!44056 m!1038455))

(check-sat (not b!1123349) (not b_lambda!18609) (not b!1123356) (not b!1123351) (not b!1123345) (not bm!47234) (not bm!47233) (not b!1123348) (not b!1123346) tp_is_empty!28159 (not mapNonEmpty!44056) (not b!1123350) (not b!1123341) (not b!1123340) (not b!1123344) (not start!98164) b_and!38053 (not b_next!23629) (not b!1123354))
(check-sat b_and!38053 (not b_next!23629))
