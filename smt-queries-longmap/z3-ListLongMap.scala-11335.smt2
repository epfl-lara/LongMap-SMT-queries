; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131916 () Bool)

(assert start!131916)

(declare-fun b_free!31629 () Bool)

(declare-fun b_next!31629 () Bool)

(assert (=> start!131916 (= b_free!31629 (not b_next!31629))))

(declare-fun tp!111139 () Bool)

(declare-fun b_and!51039 () Bool)

(assert (=> start!131916 (= tp!111139 b_and!51039)))

(declare-fun bm!68942 () Bool)

(declare-datatypes ((V!58983 0))(
  ( (V!58984 (val!19030 Int)) )
))
(declare-datatypes ((tuple2!24448 0))(
  ( (tuple2!24449 (_1!12235 (_ BitVec 64)) (_2!12235 V!58983)) )
))
(declare-datatypes ((List!35963 0))(
  ( (Nil!35960) (Cons!35959 (h!37404 tuple2!24448) (t!50657 List!35963)) )
))
(declare-datatypes ((ListLongMap!22057 0))(
  ( (ListLongMap!22058 (toList!11044 List!35963)) )
))
(declare-fun call!68949 () ListLongMap!22057)

(declare-fun call!68946 () ListLongMap!22057)

(assert (=> bm!68942 (= call!68949 call!68946)))

(declare-fun c!141461 () Bool)

(declare-fun c!141460 () Bool)

(declare-fun zeroValue!436 () V!58983)

(declare-fun bm!68943 () Bool)

(declare-fun call!68947 () ListLongMap!22057)

(declare-fun call!68948 () ListLongMap!22057)

(declare-fun minValue!436 () V!58983)

(declare-fun call!68945 () ListLongMap!22057)

(declare-fun +!4880 (ListLongMap!22057 tuple2!24448) ListLongMap!22057)

(assert (=> bm!68943 (= call!68946 (+!4880 (ite c!141461 call!68945 (ite c!141460 call!68948 call!68947)) (ite (or c!141461 c!141460) (tuple2!24449 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24449 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1544599 () Bool)

(declare-fun res!1059477 () Bool)

(declare-fun e!859751 () Bool)

(assert (=> b!1544599 (=> (not res!1059477) (not e!859751))))

(declare-datatypes ((array!103020 0))(
  ( (array!103021 (arr!49712 (Array (_ BitVec 32) (_ BitVec 64))) (size!50262 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103020)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103020 (_ BitVec 32)) Bool)

(assert (=> b!1544599 (= res!1059477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58561 () Bool)

(declare-fun mapRes!58561 () Bool)

(declare-fun tp!111138 () Bool)

(declare-fun e!859752 () Bool)

(assert (=> mapNonEmpty!58561 (= mapRes!58561 (and tp!111138 e!859752))))

(declare-fun mapKey!58561 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18042 0))(
  ( (ValueCellFull!18042 (v!21831 V!58983)) (EmptyCell!18042) )
))
(declare-fun mapRest!58561 () (Array (_ BitVec 32) ValueCell!18042))

(declare-datatypes ((array!103022 0))(
  ( (array!103023 (arr!49713 (Array (_ BitVec 32) ValueCell!18042)) (size!50263 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103022)

(declare-fun mapValue!58561 () ValueCell!18042)

(assert (=> mapNonEmpty!58561 (= (arr!49713 _values!470) (store mapRest!58561 mapKey!58561 mapValue!58561))))

(declare-fun b!1544600 () Bool)

(declare-fun res!1059473 () Bool)

(assert (=> b!1544600 (=> (not res!1059473) (not e!859751))))

(declare-datatypes ((List!35964 0))(
  ( (Nil!35961) (Cons!35960 (h!37405 (_ BitVec 64)) (t!50658 List!35964)) )
))
(declare-fun arrayNoDuplicates!0 (array!103020 (_ BitVec 32) List!35964) Bool)

(assert (=> b!1544600 (= res!1059473 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35961))))

(declare-fun b!1544601 () Bool)

(declare-fun e!859749 () ListLongMap!22057)

(assert (=> b!1544601 (= e!859749 (+!4880 call!68946 (tuple2!24449 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1544602 () Bool)

(declare-fun c!141459 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666161 () Bool)

(assert (=> b!1544602 (= c!141459 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666161))))

(declare-fun e!859746 () ListLongMap!22057)

(declare-fun e!859750 () ListLongMap!22057)

(assert (=> b!1544602 (= e!859746 e!859750)))

(declare-fun b!1544603 () Bool)

(assert (=> b!1544603 (= e!859750 call!68949)))

(declare-fun bm!68944 () Bool)

(assert (=> bm!68944 (= call!68948 call!68945)))

(declare-fun b!1544604 () Bool)

(declare-fun res!1059475 () Bool)

(assert (=> b!1544604 (=> (not res!1059475) (not e!859751))))

(assert (=> b!1544604 (= res!1059475 (and (= (size!50263 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50262 _keys!618) (size!50263 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544605 () Bool)

(assert (=> b!1544605 (= e!859749 e!859746)))

(assert (=> b!1544605 (= c!141460 (and (not lt!666161) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1544606 () Bool)

(declare-fun e!859745 () Bool)

(declare-fun e!859748 () Bool)

(assert (=> b!1544606 (= e!859745 (and e!859748 mapRes!58561))))

(declare-fun condMapEmpty!58561 () Bool)

(declare-fun mapDefault!58561 () ValueCell!18042)

(assert (=> b!1544606 (= condMapEmpty!58561 (= (arr!49713 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18042)) mapDefault!58561)))))

(declare-fun b!1544607 () Bool)

(declare-fun tp_is_empty!37905 () Bool)

(assert (=> b!1544607 (= e!859748 tp_is_empty!37905)))

(declare-fun b!1544608 () Bool)

(assert (=> b!1544608 (= e!859752 tp_is_empty!37905)))

(declare-fun b!1544609 () Bool)

(assert (=> b!1544609 (= e!859751 false)))

(declare-fun lt!666160 () ListLongMap!22057)

(assert (=> b!1544609 (= lt!666160 e!859749)))

(assert (=> b!1544609 (= c!141461 (and (not lt!666161) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544609 (= lt!666161 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1544610 () Bool)

(assert (=> b!1544610 (= e!859746 call!68949)))

(declare-fun mapIsEmpty!58561 () Bool)

(assert (=> mapIsEmpty!58561 mapRes!58561))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun bm!68945 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6515 (array!103020 array!103022 (_ BitVec 32) (_ BitVec 32) V!58983 V!58983 (_ BitVec 32) Int) ListLongMap!22057)

(assert (=> bm!68945 (= call!68945 (getCurrentListMapNoExtraKeys!6515 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1544611 () Bool)

(declare-fun res!1059476 () Bool)

(assert (=> b!1544611 (=> (not res!1059476) (not e!859751))))

(assert (=> b!1544611 (= res!1059476 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50262 _keys!618))))))

(declare-fun res!1059474 () Bool)

(assert (=> start!131916 (=> (not res!1059474) (not e!859751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131916 (= res!1059474 (validMask!0 mask!926))))

(assert (=> start!131916 e!859751))

(declare-fun array_inv!38669 (array!103020) Bool)

(assert (=> start!131916 (array_inv!38669 _keys!618)))

(assert (=> start!131916 tp_is_empty!37905))

(assert (=> start!131916 true))

(assert (=> start!131916 tp!111139))

(declare-fun array_inv!38670 (array!103022) Bool)

(assert (=> start!131916 (and (array_inv!38670 _values!470) e!859745)))

(declare-fun b!1544612 () Bool)

(assert (=> b!1544612 (= e!859750 call!68947)))

(declare-fun bm!68946 () Bool)

(assert (=> bm!68946 (= call!68947 call!68948)))

(assert (= (and start!131916 res!1059474) b!1544604))

(assert (= (and b!1544604 res!1059475) b!1544599))

(assert (= (and b!1544599 res!1059477) b!1544600))

(assert (= (and b!1544600 res!1059473) b!1544611))

(assert (= (and b!1544611 res!1059476) b!1544609))

(assert (= (and b!1544609 c!141461) b!1544601))

(assert (= (and b!1544609 (not c!141461)) b!1544605))

(assert (= (and b!1544605 c!141460) b!1544610))

(assert (= (and b!1544605 (not c!141460)) b!1544602))

(assert (= (and b!1544602 c!141459) b!1544603))

(assert (= (and b!1544602 (not c!141459)) b!1544612))

(assert (= (or b!1544603 b!1544612) bm!68946))

(assert (= (or b!1544610 bm!68946) bm!68944))

(assert (= (or b!1544610 b!1544603) bm!68942))

(assert (= (or b!1544601 bm!68944) bm!68945))

(assert (= (or b!1544601 bm!68942) bm!68943))

(assert (= (and b!1544606 condMapEmpty!58561) mapIsEmpty!58561))

(assert (= (and b!1544606 (not condMapEmpty!58561)) mapNonEmpty!58561))

(get-info :version)

(assert (= (and mapNonEmpty!58561 ((_ is ValueCellFull!18042) mapValue!58561)) b!1544608))

(assert (= (and b!1544606 ((_ is ValueCellFull!18042) mapDefault!58561)) b!1544607))

(assert (= start!131916 b!1544606))

(declare-fun m!1425349 () Bool)

(assert (=> start!131916 m!1425349))

(declare-fun m!1425351 () Bool)

(assert (=> start!131916 m!1425351))

(declare-fun m!1425353 () Bool)

(assert (=> start!131916 m!1425353))

(declare-fun m!1425355 () Bool)

(assert (=> bm!68945 m!1425355))

(declare-fun m!1425357 () Bool)

(assert (=> mapNonEmpty!58561 m!1425357))

(declare-fun m!1425359 () Bool)

(assert (=> b!1544600 m!1425359))

(declare-fun m!1425361 () Bool)

(assert (=> b!1544599 m!1425361))

(declare-fun m!1425363 () Bool)

(assert (=> b!1544601 m!1425363))

(declare-fun m!1425365 () Bool)

(assert (=> bm!68943 m!1425365))

(check-sat (not b!1544600) (not start!131916) tp_is_empty!37905 b_and!51039 (not bm!68943) (not bm!68945) (not mapNonEmpty!58561) (not b_next!31629) (not b!1544599) (not b!1544601))
(check-sat b_and!51039 (not b_next!31629))
