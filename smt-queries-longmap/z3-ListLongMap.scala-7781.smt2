; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97432 () Bool)

(assert start!97432)

(declare-fun b_free!23403 () Bool)

(declare-fun b_next!23403 () Bool)

(assert (=> start!97432 (= b_free!23403 (not b_next!23403))))

(declare-fun tp!82507 () Bool)

(declare-fun b_and!37643 () Bool)

(assert (=> start!97432 (= tp!82507 b_and!37643)))

(declare-datatypes ((V!42011 0))(
  ( (V!42012 (val!13888 Int)) )
))
(declare-fun zeroValue!944 () V!42011)

(declare-datatypes ((array!72243 0))(
  ( (array!72244 (arr!34774 (Array (_ BitVec 32) (_ BitVec 64))) (size!35310 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72243)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17578 0))(
  ( (tuple2!17579 (_1!8800 (_ BitVec 64)) (_2!8800 V!42011)) )
))
(declare-datatypes ((List!24261 0))(
  ( (Nil!24258) (Cons!24257 (h!25466 tuple2!17578) (t!34710 List!24261)) )
))
(declare-datatypes ((ListLongMap!15547 0))(
  ( (ListLongMap!15548 (toList!7789 List!24261)) )
))
(declare-fun call!46906 () ListLongMap!15547)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13122 0))(
  ( (ValueCellFull!13122 (v!16521 V!42011)) (EmptyCell!13122) )
))
(declare-datatypes ((array!72245 0))(
  ( (array!72246 (arr!34775 (Array (_ BitVec 32) ValueCell!13122)) (size!35311 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72245)

(declare-fun bm!46902 () Bool)

(declare-fun minValue!944 () V!42011)

(declare-fun getCurrentListMapNoExtraKeys!4280 (array!72243 array!72245 (_ BitVec 32) (_ BitVec 32) V!42011 V!42011 (_ BitVec 32) Int) ListLongMap!15547)

(assert (=> bm!46902 (= call!46906 (getCurrentListMapNoExtraKeys!4280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111481 () Bool)

(declare-fun res!741722 () Bool)

(declare-fun e!633794 () Bool)

(assert (=> b!1111481 (=> (not res!741722) (not e!633794))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1111481 (= res!741722 (= (select (arr!34774 _keys!1208) i!673) k0!934))))

(declare-fun b!1111482 () Bool)

(declare-fun res!741715 () Bool)

(declare-fun e!633793 () Bool)

(assert (=> b!1111482 (=> (not res!741715) (not e!633793))))

(declare-fun lt!496350 () array!72243)

(declare-datatypes ((List!24262 0))(
  ( (Nil!24259) (Cons!24258 (h!25467 (_ BitVec 64)) (t!34711 List!24262)) )
))
(declare-fun arrayNoDuplicates!0 (array!72243 (_ BitVec 32) List!24262) Bool)

(assert (=> b!1111482 (= res!741715 (arrayNoDuplicates!0 lt!496350 #b00000000000000000000000000000000 Nil!24259))))

(declare-fun b!1111483 () Bool)

(declare-fun e!633792 () Bool)

(assert (=> b!1111483 (= e!633793 (not e!633792))))

(declare-fun res!741717 () Bool)

(assert (=> b!1111483 (=> res!741717 e!633792)))

(assert (=> b!1111483 (= res!741717 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35310 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111483 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36476 0))(
  ( (Unit!36477) )
))
(declare-fun lt!496352 () Unit!36476)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72243 (_ BitVec 64) (_ BitVec 32)) Unit!36476)

(assert (=> b!1111483 (= lt!496352 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1111484 () Bool)

(declare-fun res!741723 () Bool)

(assert (=> b!1111484 (=> (not res!741723) (not e!633794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111484 (= res!741723 (validKeyInArray!0 k0!934))))

(declare-fun b!1111485 () Bool)

(declare-fun e!633789 () Bool)

(declare-fun call!46905 () ListLongMap!15547)

(assert (=> b!1111485 (= e!633789 (= call!46905 call!46906))))

(declare-fun mapNonEmpty!43312 () Bool)

(declare-fun mapRes!43312 () Bool)

(declare-fun tp!82508 () Bool)

(declare-fun e!633791 () Bool)

(assert (=> mapNonEmpty!43312 (= mapRes!43312 (and tp!82508 e!633791))))

(declare-fun mapRest!43312 () (Array (_ BitVec 32) ValueCell!13122))

(declare-fun mapValue!43312 () ValueCell!13122)

(declare-fun mapKey!43312 () (_ BitVec 32))

(assert (=> mapNonEmpty!43312 (= (arr!34775 _values!996) (store mapRest!43312 mapKey!43312 mapValue!43312))))

(declare-fun b!1111486 () Bool)

(declare-fun e!633788 () Bool)

(declare-fun e!633795 () Bool)

(assert (=> b!1111486 (= e!633788 (and e!633795 mapRes!43312))))

(declare-fun condMapEmpty!43312 () Bool)

(declare-fun mapDefault!43312 () ValueCell!13122)

(assert (=> b!1111486 (= condMapEmpty!43312 (= (arr!34775 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13122)) mapDefault!43312)))))

(declare-fun b!1111487 () Bool)

(declare-fun tp_is_empty!27663 () Bool)

(assert (=> b!1111487 (= e!633791 tp_is_empty!27663)))

(declare-fun b!1111488 () Bool)

(declare-fun res!741721 () Bool)

(assert (=> b!1111488 (=> (not res!741721) (not e!633794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111488 (= res!741721 (validMask!0 mask!1564))))

(declare-fun res!741719 () Bool)

(assert (=> start!97432 (=> (not res!741719) (not e!633794))))

(assert (=> start!97432 (= res!741719 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35310 _keys!1208))))))

(assert (=> start!97432 e!633794))

(assert (=> start!97432 tp_is_empty!27663))

(declare-fun array_inv!26746 (array!72243) Bool)

(assert (=> start!97432 (array_inv!26746 _keys!1208)))

(assert (=> start!97432 true))

(assert (=> start!97432 tp!82507))

(declare-fun array_inv!26747 (array!72245) Bool)

(assert (=> start!97432 (and (array_inv!26747 _values!996) e!633788)))

(declare-fun b!1111489 () Bool)

(declare-fun res!741716 () Bool)

(assert (=> b!1111489 (=> (not res!741716) (not e!633794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72243 (_ BitVec 32)) Bool)

(assert (=> b!1111489 (= res!741716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43312 () Bool)

(assert (=> mapIsEmpty!43312 mapRes!43312))

(declare-fun b!1111490 () Bool)

(declare-fun res!741718 () Bool)

(assert (=> b!1111490 (=> (not res!741718) (not e!633794))))

(assert (=> b!1111490 (= res!741718 (and (= (size!35311 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35310 _keys!1208) (size!35311 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!46903 () Bool)

(declare-fun dynLambda!2407 (Int (_ BitVec 64)) V!42011)

(assert (=> bm!46903 (= call!46905 (getCurrentListMapNoExtraKeys!4280 lt!496350 (array!72246 (store (arr!34775 _values!996) i!673 (ValueCellFull!13122 (dynLambda!2407 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35311 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111491 () Bool)

(declare-fun res!741714 () Bool)

(assert (=> b!1111491 (=> (not res!741714) (not e!633794))))

(assert (=> b!1111491 (= res!741714 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24259))))

(declare-fun b!1111492 () Bool)

(assert (=> b!1111492 (= e!633792 true)))

(assert (=> b!1111492 e!633789))

(declare-fun c!109302 () Bool)

(assert (=> b!1111492 (= c!109302 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496351 () Unit!36476)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!303 (array!72243 array!72245 (_ BitVec 32) (_ BitVec 32) V!42011 V!42011 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36476)

(assert (=> b!1111492 (= lt!496351 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!303 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111493 () Bool)

(declare-fun res!741724 () Bool)

(assert (=> b!1111493 (=> (not res!741724) (not e!633794))))

(assert (=> b!1111493 (= res!741724 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35310 _keys!1208))))))

(declare-fun b!1111494 () Bool)

(declare-fun -!1057 (ListLongMap!15547 (_ BitVec 64)) ListLongMap!15547)

(assert (=> b!1111494 (= e!633789 (= call!46905 (-!1057 call!46906 k0!934)))))

(declare-fun b!1111495 () Bool)

(assert (=> b!1111495 (= e!633795 tp_is_empty!27663)))

(declare-fun b!1111496 () Bool)

(assert (=> b!1111496 (= e!633794 e!633793)))

(declare-fun res!741720 () Bool)

(assert (=> b!1111496 (=> (not res!741720) (not e!633793))))

(assert (=> b!1111496 (= res!741720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496350 mask!1564))))

(assert (=> b!1111496 (= lt!496350 (array!72244 (store (arr!34774 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35310 _keys!1208)))))

(assert (= (and start!97432 res!741719) b!1111488))

(assert (= (and b!1111488 res!741721) b!1111490))

(assert (= (and b!1111490 res!741718) b!1111489))

(assert (= (and b!1111489 res!741716) b!1111491))

(assert (= (and b!1111491 res!741714) b!1111493))

(assert (= (and b!1111493 res!741724) b!1111484))

(assert (= (and b!1111484 res!741723) b!1111481))

(assert (= (and b!1111481 res!741722) b!1111496))

(assert (= (and b!1111496 res!741720) b!1111482))

(assert (= (and b!1111482 res!741715) b!1111483))

(assert (= (and b!1111483 (not res!741717)) b!1111492))

(assert (= (and b!1111492 c!109302) b!1111494))

(assert (= (and b!1111492 (not c!109302)) b!1111485))

(assert (= (or b!1111494 b!1111485) bm!46903))

(assert (= (or b!1111494 b!1111485) bm!46902))

(assert (= (and b!1111486 condMapEmpty!43312) mapIsEmpty!43312))

(assert (= (and b!1111486 (not condMapEmpty!43312)) mapNonEmpty!43312))

(get-info :version)

(assert (= (and mapNonEmpty!43312 ((_ is ValueCellFull!13122) mapValue!43312)) b!1111487))

(assert (= (and b!1111486 ((_ is ValueCellFull!13122) mapDefault!43312)) b!1111495))

(assert (= start!97432 b!1111486))

(declare-fun b_lambda!18427 () Bool)

(assert (=> (not b_lambda!18427) (not bm!46903)))

(declare-fun t!34709 () Bool)

(declare-fun tb!8269 () Bool)

(assert (=> (and start!97432 (= defaultEntry!1004 defaultEntry!1004) t!34709) tb!8269))

(declare-fun result!17099 () Bool)

(assert (=> tb!8269 (= result!17099 tp_is_empty!27663)))

(assert (=> bm!46903 t!34709))

(declare-fun b_and!37645 () Bool)

(assert (= b_and!37643 (and (=> t!34709 result!17099) b_and!37645)))

(declare-fun m!1029259 () Bool)

(assert (=> b!1111484 m!1029259))

(declare-fun m!1029261 () Bool)

(assert (=> bm!46903 m!1029261))

(declare-fun m!1029263 () Bool)

(assert (=> bm!46903 m!1029263))

(declare-fun m!1029265 () Bool)

(assert (=> bm!46903 m!1029265))

(declare-fun m!1029267 () Bool)

(assert (=> b!1111491 m!1029267))

(declare-fun m!1029269 () Bool)

(assert (=> b!1111492 m!1029269))

(declare-fun m!1029271 () Bool)

(assert (=> b!1111494 m!1029271))

(declare-fun m!1029273 () Bool)

(assert (=> bm!46902 m!1029273))

(declare-fun m!1029275 () Bool)

(assert (=> start!97432 m!1029275))

(declare-fun m!1029277 () Bool)

(assert (=> start!97432 m!1029277))

(declare-fun m!1029279 () Bool)

(assert (=> b!1111483 m!1029279))

(declare-fun m!1029281 () Bool)

(assert (=> b!1111483 m!1029281))

(declare-fun m!1029283 () Bool)

(assert (=> b!1111496 m!1029283))

(declare-fun m!1029285 () Bool)

(assert (=> b!1111496 m!1029285))

(declare-fun m!1029287 () Bool)

(assert (=> b!1111488 m!1029287))

(declare-fun m!1029289 () Bool)

(assert (=> b!1111482 m!1029289))

(declare-fun m!1029291 () Bool)

(assert (=> b!1111489 m!1029291))

(declare-fun m!1029293 () Bool)

(assert (=> b!1111481 m!1029293))

(declare-fun m!1029295 () Bool)

(assert (=> mapNonEmpty!43312 m!1029295))

(check-sat b_and!37645 (not mapNonEmpty!43312) (not b!1111489) (not b!1111488) (not b!1111494) (not bm!46902) (not b_next!23403) (not b!1111482) (not b!1111496) (not b!1111491) tp_is_empty!27663 (not bm!46903) (not b!1111483) (not b!1111492) (not start!97432) (not b_lambda!18427) (not b!1111484))
(check-sat b_and!37645 (not b_next!23403))
