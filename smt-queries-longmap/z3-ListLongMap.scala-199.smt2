; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3816 () Bool)

(assert start!3816)

(declare-fun b_free!781 () Bool)

(declare-fun b_next!781 () Bool)

(assert (=> start!3816 (= b_free!781 (not b_next!781))))

(declare-fun tp!3754 () Bool)

(declare-fun b_and!1579 () Bool)

(assert (=> start!3816 (= tp!3754 b_and!1579)))

(declare-fun b!26743 () Bool)

(declare-fun e!17440 () Bool)

(declare-datatypes ((array!1485 0))(
  ( (array!1486 (arr!699 (Array (_ BitVec 32) (_ BitVec 64))) (size!800 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1485)

(assert (=> b!26743 (= e!17440 (bvsge #b00000000000000000000000000000000 (size!800 _keys!1833)))))

(declare-fun b!26744 () Bool)

(declare-fun e!17439 () Bool)

(declare-fun tp_is_empty!1135 () Bool)

(assert (=> b!26744 (= e!17439 tp_is_empty!1135)))

(declare-fun mapIsEmpty!1222 () Bool)

(declare-fun mapRes!1222 () Bool)

(assert (=> mapIsEmpty!1222 mapRes!1222))

(declare-fun b!26745 () Bool)

(declare-fun res!15861 () Bool)

(assert (=> b!26745 (=> (not res!15861) (not e!17440))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((V!1339 0))(
  ( (V!1340 (val!594 Int)) )
))
(declare-datatypes ((ValueCell!368 0))(
  ( (ValueCellFull!368 (v!1679 V!1339)) (EmptyCell!368) )
))
(declare-datatypes ((array!1487 0))(
  ( (array!1488 (arr!700 (Array (_ BitVec 32) ValueCell!368)) (size!801 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1487)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1339)

(declare-fun minValue!1443 () V!1339)

(declare-datatypes ((tuple2!1010 0))(
  ( (tuple2!1011 (_1!516 (_ BitVec 64)) (_2!516 V!1339)) )
))
(declare-datatypes ((List!597 0))(
  ( (Nil!594) (Cons!593 (h!1160 tuple2!1010) (t!3277 List!597)) )
))
(declare-datatypes ((ListLongMap!575 0))(
  ( (ListLongMap!576 (toList!303 List!597)) )
))
(declare-fun contains!241 (ListLongMap!575 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!133 (array!1485 array!1487 (_ BitVec 32) (_ BitVec 32) V!1339 V!1339 (_ BitVec 32) Int) ListLongMap!575)

(assert (=> b!26745 (= res!15861 (not (contains!241 (getCurrentListMap!133 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!26746 () Bool)

(declare-fun res!15862 () Bool)

(assert (=> b!26746 (=> (not res!15862) (not e!17440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1485 (_ BitVec 32)) Bool)

(assert (=> b!26746 (= res!15862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26747 () Bool)

(declare-fun res!15864 () Bool)

(assert (=> b!26747 (=> (not res!15864) (not e!17440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26747 (= res!15864 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1222 () Bool)

(declare-fun tp!3753 () Bool)

(assert (=> mapNonEmpty!1222 (= mapRes!1222 (and tp!3753 e!17439))))

(declare-fun mapValue!1222 () ValueCell!368)

(declare-fun mapRest!1222 () (Array (_ BitVec 32) ValueCell!368))

(declare-fun mapKey!1222 () (_ BitVec 32))

(assert (=> mapNonEmpty!1222 (= (arr!700 _values!1501) (store mapRest!1222 mapKey!1222 mapValue!1222))))

(declare-fun res!15860 () Bool)

(assert (=> start!3816 (=> (not res!15860) (not e!17440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3816 (= res!15860 (validMask!0 mask!2294))))

(assert (=> start!3816 e!17440))

(assert (=> start!3816 true))

(assert (=> start!3816 tp!3754))

(declare-fun e!17442 () Bool)

(declare-fun array_inv!497 (array!1487) Bool)

(assert (=> start!3816 (and (array_inv!497 _values!1501) e!17442)))

(declare-fun array_inv!498 (array!1485) Bool)

(assert (=> start!3816 (array_inv!498 _keys!1833)))

(assert (=> start!3816 tp_is_empty!1135))

(declare-fun b!26748 () Bool)

(declare-fun e!17441 () Bool)

(assert (=> b!26748 (= e!17441 tp_is_empty!1135)))

(declare-fun b!26749 () Bool)

(assert (=> b!26749 (= e!17442 (and e!17441 mapRes!1222))))

(declare-fun condMapEmpty!1222 () Bool)

(declare-fun mapDefault!1222 () ValueCell!368)

(assert (=> b!26749 (= condMapEmpty!1222 (= (arr!700 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!368)) mapDefault!1222)))))

(declare-fun b!26750 () Bool)

(declare-fun res!15865 () Bool)

(assert (=> b!26750 (=> (not res!15865) (not e!17440))))

(assert (=> b!26750 (= res!15865 (and (= (size!801 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!800 _keys!1833) (size!801 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26751 () Bool)

(declare-fun res!15863 () Bool)

(assert (=> b!26751 (=> (not res!15863) (not e!17440))))

(declare-datatypes ((List!598 0))(
  ( (Nil!595) (Cons!594 (h!1161 (_ BitVec 64)) (t!3278 List!598)) )
))
(declare-fun arrayNoDuplicates!0 (array!1485 (_ BitVec 32) List!598) Bool)

(assert (=> b!26751 (= res!15863 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!595))))

(assert (= (and start!3816 res!15860) b!26750))

(assert (= (and b!26750 res!15865) b!26746))

(assert (= (and b!26746 res!15862) b!26751))

(assert (= (and b!26751 res!15863) b!26747))

(assert (= (and b!26747 res!15864) b!26745))

(assert (= (and b!26745 res!15861) b!26743))

(assert (= (and b!26749 condMapEmpty!1222) mapIsEmpty!1222))

(assert (= (and b!26749 (not condMapEmpty!1222)) mapNonEmpty!1222))

(get-info :version)

(assert (= (and mapNonEmpty!1222 ((_ is ValueCellFull!368) mapValue!1222)) b!26744))

(assert (= (and b!26749 ((_ is ValueCellFull!368) mapDefault!1222)) b!26748))

(assert (= start!3816 b!26749))

(declare-fun m!21373 () Bool)

(assert (=> start!3816 m!21373))

(declare-fun m!21375 () Bool)

(assert (=> start!3816 m!21375))

(declare-fun m!21377 () Bool)

(assert (=> start!3816 m!21377))

(declare-fun m!21379 () Bool)

(assert (=> b!26746 m!21379))

(declare-fun m!21381 () Bool)

(assert (=> mapNonEmpty!1222 m!21381))

(declare-fun m!21383 () Bool)

(assert (=> b!26745 m!21383))

(assert (=> b!26745 m!21383))

(declare-fun m!21385 () Bool)

(assert (=> b!26745 m!21385))

(declare-fun m!21387 () Bool)

(assert (=> b!26747 m!21387))

(declare-fun m!21389 () Bool)

(assert (=> b!26751 m!21389))

(check-sat b_and!1579 (not b_next!781) (not mapNonEmpty!1222) tp_is_empty!1135 (not start!3816) (not b!26747) (not b!26751) (not b!26745) (not b!26746))
(check-sat b_and!1579 (not b_next!781))
(get-model)

(declare-fun d!4873 () Bool)

(assert (=> d!4873 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3816 d!4873))

(declare-fun d!4875 () Bool)

(assert (=> d!4875 (= (array_inv!497 _values!1501) (bvsge (size!801 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3816 d!4875))

(declare-fun d!4877 () Bool)

(assert (=> d!4877 (= (array_inv!498 _keys!1833) (bvsge (size!800 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3816 d!4877))

(declare-fun d!4879 () Bool)

(declare-fun e!17478 () Bool)

(assert (=> d!4879 e!17478))

(declare-fun res!15904 () Bool)

(assert (=> d!4879 (=> res!15904 e!17478)))

(declare-fun lt!10417 () Bool)

(assert (=> d!4879 (= res!15904 (not lt!10417))))

(declare-fun lt!10416 () Bool)

(assert (=> d!4879 (= lt!10417 lt!10416)))

(declare-datatypes ((Unit!634 0))(
  ( (Unit!635) )
))
(declare-fun lt!10415 () Unit!634)

(declare-fun e!17479 () Unit!634)

(assert (=> d!4879 (= lt!10415 e!17479)))

(declare-fun c!3648 () Bool)

(assert (=> d!4879 (= c!3648 lt!10416)))

(declare-fun containsKey!25 (List!597 (_ BitVec 64)) Bool)

(assert (=> d!4879 (= lt!10416 (containsKey!25 (toList!303 (getCurrentListMap!133 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!4879 (= (contains!241 (getCurrentListMap!133 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!10417)))

(declare-fun b!26812 () Bool)

(declare-fun lt!10414 () Unit!634)

(assert (=> b!26812 (= e!17479 lt!10414)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!22 (List!597 (_ BitVec 64)) Unit!634)

(assert (=> b!26812 (= lt!10414 (lemmaContainsKeyImpliesGetValueByKeyDefined!22 (toList!303 (getCurrentListMap!133 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!67 0))(
  ( (Some!66 (v!1682 V!1339)) (None!65) )
))
(declare-fun isDefined!23 (Option!67) Bool)

(declare-fun getValueByKey!61 (List!597 (_ BitVec 64)) Option!67)

(assert (=> b!26812 (isDefined!23 (getValueByKey!61 (toList!303 (getCurrentListMap!133 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!26813 () Bool)

(declare-fun Unit!636 () Unit!634)

(assert (=> b!26813 (= e!17479 Unit!636)))

(declare-fun b!26814 () Bool)

(assert (=> b!26814 (= e!17478 (isDefined!23 (getValueByKey!61 (toList!303 (getCurrentListMap!133 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!4879 c!3648) b!26812))

(assert (= (and d!4879 (not c!3648)) b!26813))

(assert (= (and d!4879 (not res!15904)) b!26814))

(declare-fun m!21427 () Bool)

(assert (=> d!4879 m!21427))

(declare-fun m!21429 () Bool)

(assert (=> b!26812 m!21429))

(declare-fun m!21431 () Bool)

(assert (=> b!26812 m!21431))

(assert (=> b!26812 m!21431))

(declare-fun m!21433 () Bool)

(assert (=> b!26812 m!21433))

(assert (=> b!26814 m!21431))

(assert (=> b!26814 m!21431))

(assert (=> b!26814 m!21433))

(assert (=> b!26745 d!4879))

(declare-fun b!26857 () Bool)

(declare-fun e!17513 () Bool)

(declare-fun e!17512 () Bool)

(assert (=> b!26857 (= e!17513 e!17512)))

(declare-fun res!15925 () Bool)

(declare-fun call!2524 () Bool)

(assert (=> b!26857 (= res!15925 call!2524)))

(assert (=> b!26857 (=> (not res!15925) (not e!17512))))

(declare-fun call!2528 () ListLongMap!575)

(declare-fun call!2523 () ListLongMap!575)

(declare-fun c!3663 () Bool)

(declare-fun call!2526 () ListLongMap!575)

(declare-fun c!3662 () Bool)

(declare-fun bm!2519 () Bool)

(declare-fun call!2527 () ListLongMap!575)

(declare-fun +!48 (ListLongMap!575 tuple2!1010) ListLongMap!575)

(assert (=> bm!2519 (= call!2527 (+!48 (ite c!3663 call!2528 (ite c!3662 call!2523 call!2526)) (ite (or c!3663 c!3662) (tuple2!1011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun bm!2520 () Bool)

(declare-fun call!2525 () ListLongMap!575)

(assert (=> bm!2520 (= call!2525 call!2527)))

(declare-fun bm!2521 () Bool)

(assert (=> bm!2521 (= call!2523 call!2528)))

(declare-fun bm!2522 () Bool)

(assert (=> bm!2522 (= call!2526 call!2523)))

(declare-fun b!26859 () Bool)

(declare-fun e!17514 () Bool)

(assert (=> b!26859 (= e!17514 (validKeyInArray!0 (select (arr!699 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26860 () Bool)

(declare-fun e!17511 () Bool)

(declare-fun e!17508 () Bool)

(assert (=> b!26860 (= e!17511 e!17508)))

(declare-fun c!3666 () Bool)

(assert (=> b!26860 (= c!3666 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!17516 () Bool)

(declare-fun b!26861 () Bool)

(declare-fun lt!10479 () ListLongMap!575)

(declare-fun apply!30 (ListLongMap!575 (_ BitVec 64)) V!1339)

(declare-fun get!433 (ValueCell!368 V!1339) V!1339)

(declare-fun dynLambda!146 (Int (_ BitVec 64)) V!1339)

(assert (=> b!26861 (= e!17516 (= (apply!30 lt!10479 (select (arr!699 _keys!1833) #b00000000000000000000000000000000)) (get!433 (select (arr!700 _values!1501) #b00000000000000000000000000000000) (dynLambda!146 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!26861 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!801 _values!1501)))))

(assert (=> b!26861 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!800 _keys!1833)))))

(declare-fun bm!2523 () Bool)

(declare-fun call!2522 () Bool)

(assert (=> bm!2523 (= call!2522 (contains!241 lt!10479 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26862 () Bool)

(declare-fun e!17507 () ListLongMap!575)

(assert (=> b!26862 (= e!17507 call!2526)))

(declare-fun b!26863 () Bool)

(declare-fun e!17506 () Bool)

(assert (=> b!26863 (= e!17508 e!17506)))

(declare-fun res!15931 () Bool)

(assert (=> b!26863 (= res!15931 call!2522)))

(assert (=> b!26863 (=> (not res!15931) (not e!17506))))

(declare-fun b!26864 () Bool)

(declare-fun res!15923 () Bool)

(assert (=> b!26864 (=> (not res!15923) (not e!17511))))

(assert (=> b!26864 (= res!15923 e!17513)))

(declare-fun c!3661 () Bool)

(assert (=> b!26864 (= c!3661 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!26865 () Bool)

(declare-fun e!17517 () Unit!634)

(declare-fun lt!10467 () Unit!634)

(assert (=> b!26865 (= e!17517 lt!10467)))

(declare-fun lt!10477 () ListLongMap!575)

(declare-fun getCurrentListMapNoExtraKeys!17 (array!1485 array!1487 (_ BitVec 32) (_ BitVec 32) V!1339 V!1339 (_ BitVec 32) Int) ListLongMap!575)

(assert (=> b!26865 (= lt!10477 (getCurrentListMapNoExtraKeys!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10462 () (_ BitVec 64))

(assert (=> b!26865 (= lt!10462 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10468 () (_ BitVec 64))

(assert (=> b!26865 (= lt!10468 (select (arr!699 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10471 () Unit!634)

(declare-fun addStillContains!15 (ListLongMap!575 (_ BitVec 64) V!1339 (_ BitVec 64)) Unit!634)

(assert (=> b!26865 (= lt!10471 (addStillContains!15 lt!10477 lt!10462 zeroValue!1443 lt!10468))))

(assert (=> b!26865 (contains!241 (+!48 lt!10477 (tuple2!1011 lt!10462 zeroValue!1443)) lt!10468)))

(declare-fun lt!10469 () Unit!634)

(assert (=> b!26865 (= lt!10469 lt!10471)))

(declare-fun lt!10478 () ListLongMap!575)

(assert (=> b!26865 (= lt!10478 (getCurrentListMapNoExtraKeys!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10466 () (_ BitVec 64))

(assert (=> b!26865 (= lt!10466 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10465 () (_ BitVec 64))

(assert (=> b!26865 (= lt!10465 (select (arr!699 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10473 () Unit!634)

(declare-fun addApplyDifferent!15 (ListLongMap!575 (_ BitVec 64) V!1339 (_ BitVec 64)) Unit!634)

(assert (=> b!26865 (= lt!10473 (addApplyDifferent!15 lt!10478 lt!10466 minValue!1443 lt!10465))))

(assert (=> b!26865 (= (apply!30 (+!48 lt!10478 (tuple2!1011 lt!10466 minValue!1443)) lt!10465) (apply!30 lt!10478 lt!10465))))

(declare-fun lt!10463 () Unit!634)

(assert (=> b!26865 (= lt!10463 lt!10473)))

(declare-fun lt!10464 () ListLongMap!575)

(assert (=> b!26865 (= lt!10464 (getCurrentListMapNoExtraKeys!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10474 () (_ BitVec 64))

(assert (=> b!26865 (= lt!10474 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10483 () (_ BitVec 64))

(assert (=> b!26865 (= lt!10483 (select (arr!699 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10482 () Unit!634)

(assert (=> b!26865 (= lt!10482 (addApplyDifferent!15 lt!10464 lt!10474 zeroValue!1443 lt!10483))))

(assert (=> b!26865 (= (apply!30 (+!48 lt!10464 (tuple2!1011 lt!10474 zeroValue!1443)) lt!10483) (apply!30 lt!10464 lt!10483))))

(declare-fun lt!10476 () Unit!634)

(assert (=> b!26865 (= lt!10476 lt!10482)))

(declare-fun lt!10470 () ListLongMap!575)

(assert (=> b!26865 (= lt!10470 (getCurrentListMapNoExtraKeys!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10480 () (_ BitVec 64))

(assert (=> b!26865 (= lt!10480 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10481 () (_ BitVec 64))

(assert (=> b!26865 (= lt!10481 (select (arr!699 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!26865 (= lt!10467 (addApplyDifferent!15 lt!10470 lt!10480 minValue!1443 lt!10481))))

(assert (=> b!26865 (= (apply!30 (+!48 lt!10470 (tuple2!1011 lt!10480 minValue!1443)) lt!10481) (apply!30 lt!10470 lt!10481))))

(declare-fun b!26866 () Bool)

(declare-fun res!15930 () Bool)

(assert (=> b!26866 (=> (not res!15930) (not e!17511))))

(declare-fun e!17509 () Bool)

(assert (=> b!26866 (= res!15930 e!17509)))

(declare-fun res!15926 () Bool)

(assert (=> b!26866 (=> res!15926 e!17509)))

(declare-fun e!17518 () Bool)

(assert (=> b!26866 (= res!15926 (not e!17518))))

(declare-fun res!15927 () Bool)

(assert (=> b!26866 (=> (not res!15927) (not e!17518))))

(assert (=> b!26866 (= res!15927 (bvslt #b00000000000000000000000000000000 (size!800 _keys!1833)))))

(declare-fun b!26867 () Bool)

(assert (=> b!26867 (= e!17508 (not call!2522))))

(declare-fun b!26868 () Bool)

(declare-fun c!3664 () Bool)

(assert (=> b!26868 (= c!3664 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!17510 () ListLongMap!575)

(assert (=> b!26868 (= e!17510 e!17507)))

(declare-fun b!26869 () Bool)

(assert (=> b!26869 (= e!17507 call!2525)))

(declare-fun b!26870 () Bool)

(assert (=> b!26870 (= e!17513 (not call!2524))))

(declare-fun b!26871 () Bool)

(declare-fun e!17515 () ListLongMap!575)

(assert (=> b!26871 (= e!17515 (+!48 call!2527 (tuple2!1011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!26872 () Bool)

(assert (=> b!26872 (= e!17512 (= (apply!30 lt!10479 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun bm!2524 () Bool)

(assert (=> bm!2524 (= call!2528 (getCurrentListMapNoExtraKeys!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!26858 () Bool)

(assert (=> b!26858 (= e!17506 (= (apply!30 lt!10479 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun d!4881 () Bool)

(assert (=> d!4881 e!17511))

(declare-fun res!15929 () Bool)

(assert (=> d!4881 (=> (not res!15929) (not e!17511))))

(assert (=> d!4881 (= res!15929 (or (bvsge #b00000000000000000000000000000000 (size!800 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!800 _keys!1833)))))))

(declare-fun lt!10472 () ListLongMap!575)

(assert (=> d!4881 (= lt!10479 lt!10472)))

(declare-fun lt!10475 () Unit!634)

(assert (=> d!4881 (= lt!10475 e!17517)))

(declare-fun c!3665 () Bool)

(assert (=> d!4881 (= c!3665 e!17514)))

(declare-fun res!15924 () Bool)

(assert (=> d!4881 (=> (not res!15924) (not e!17514))))

(assert (=> d!4881 (= res!15924 (bvslt #b00000000000000000000000000000000 (size!800 _keys!1833)))))

(assert (=> d!4881 (= lt!10472 e!17515)))

(assert (=> d!4881 (= c!3663 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!4881 (validMask!0 mask!2294)))

(assert (=> d!4881 (= (getCurrentListMap!133 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!10479)))

(declare-fun b!26873 () Bool)

(assert (=> b!26873 (= e!17510 call!2525)))

(declare-fun bm!2525 () Bool)

(assert (=> bm!2525 (= call!2524 (contains!241 lt!10479 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26874 () Bool)

(declare-fun Unit!637 () Unit!634)

(assert (=> b!26874 (= e!17517 Unit!637)))

(declare-fun b!26875 () Bool)

(assert (=> b!26875 (= e!17509 e!17516)))

(declare-fun res!15928 () Bool)

(assert (=> b!26875 (=> (not res!15928) (not e!17516))))

(assert (=> b!26875 (= res!15928 (contains!241 lt!10479 (select (arr!699 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!26875 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!800 _keys!1833)))))

(declare-fun b!26876 () Bool)

(assert (=> b!26876 (= e!17515 e!17510)))

(assert (=> b!26876 (= c!3662 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!26877 () Bool)

(assert (=> b!26877 (= e!17518 (validKeyInArray!0 (select (arr!699 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!4881 c!3663) b!26871))

(assert (= (and d!4881 (not c!3663)) b!26876))

(assert (= (and b!26876 c!3662) b!26873))

(assert (= (and b!26876 (not c!3662)) b!26868))

(assert (= (and b!26868 c!3664) b!26869))

(assert (= (and b!26868 (not c!3664)) b!26862))

(assert (= (or b!26869 b!26862) bm!2522))

(assert (= (or b!26873 bm!2522) bm!2521))

(assert (= (or b!26873 b!26869) bm!2520))

(assert (= (or b!26871 bm!2521) bm!2524))

(assert (= (or b!26871 bm!2520) bm!2519))

(assert (= (and d!4881 res!15924) b!26859))

(assert (= (and d!4881 c!3665) b!26865))

(assert (= (and d!4881 (not c!3665)) b!26874))

(assert (= (and d!4881 res!15929) b!26866))

(assert (= (and b!26866 res!15927) b!26877))

(assert (= (and b!26866 (not res!15926)) b!26875))

(assert (= (and b!26875 res!15928) b!26861))

(assert (= (and b!26866 res!15930) b!26864))

(assert (= (and b!26864 c!3661) b!26857))

(assert (= (and b!26864 (not c!3661)) b!26870))

(assert (= (and b!26857 res!15925) b!26872))

(assert (= (or b!26857 b!26870) bm!2525))

(assert (= (and b!26864 res!15923) b!26860))

(assert (= (and b!26860 c!3666) b!26863))

(assert (= (and b!26860 (not c!3666)) b!26867))

(assert (= (and b!26863 res!15931) b!26858))

(assert (= (or b!26863 b!26867) bm!2523))

(declare-fun b_lambda!1671 () Bool)

(assert (=> (not b_lambda!1671) (not b!26861)))

(declare-fun t!3282 () Bool)

(declare-fun tb!669 () Bool)

(assert (=> (and start!3816 (= defaultEntry!1504 defaultEntry!1504) t!3282) tb!669))

(declare-fun result!1129 () Bool)

(assert (=> tb!669 (= result!1129 tp_is_empty!1135)))

(assert (=> b!26861 t!3282))

(declare-fun b_and!1585 () Bool)

(assert (= b_and!1579 (and (=> t!3282 result!1129) b_and!1585)))

(declare-fun m!21435 () Bool)

(assert (=> b!26859 m!21435))

(assert (=> b!26859 m!21435))

(declare-fun m!21437 () Bool)

(assert (=> b!26859 m!21437))

(assert (=> b!26877 m!21435))

(assert (=> b!26877 m!21435))

(assert (=> b!26877 m!21437))

(declare-fun m!21439 () Bool)

(assert (=> bm!2525 m!21439))

(declare-fun m!21441 () Bool)

(assert (=> bm!2519 m!21441))

(declare-fun m!21443 () Bool)

(assert (=> b!26871 m!21443))

(declare-fun m!21445 () Bool)

(assert (=> bm!2523 m!21445))

(declare-fun m!21447 () Bool)

(assert (=> bm!2524 m!21447))

(declare-fun m!21449 () Bool)

(assert (=> b!26861 m!21449))

(assert (=> b!26861 m!21435))

(declare-fun m!21451 () Bool)

(assert (=> b!26861 m!21451))

(assert (=> b!26861 m!21435))

(declare-fun m!21453 () Bool)

(assert (=> b!26861 m!21453))

(assert (=> b!26861 m!21449))

(assert (=> b!26861 m!21451))

(declare-fun m!21455 () Bool)

(assert (=> b!26861 m!21455))

(declare-fun m!21457 () Bool)

(assert (=> b!26872 m!21457))

(assert (=> b!26875 m!21435))

(assert (=> b!26875 m!21435))

(declare-fun m!21459 () Bool)

(assert (=> b!26875 m!21459))

(declare-fun m!21461 () Bool)

(assert (=> b!26858 m!21461))

(assert (=> d!4881 m!21373))

(declare-fun m!21463 () Bool)

(assert (=> b!26865 m!21463))

(declare-fun m!21465 () Bool)

(assert (=> b!26865 m!21465))

(declare-fun m!21467 () Bool)

(assert (=> b!26865 m!21467))

(assert (=> b!26865 m!21435))

(assert (=> b!26865 m!21467))

(declare-fun m!21469 () Bool)

(assert (=> b!26865 m!21469))

(assert (=> b!26865 m!21447))

(declare-fun m!21471 () Bool)

(assert (=> b!26865 m!21471))

(declare-fun m!21473 () Bool)

(assert (=> b!26865 m!21473))

(declare-fun m!21475 () Bool)

(assert (=> b!26865 m!21475))

(assert (=> b!26865 m!21463))

(declare-fun m!21477 () Bool)

(assert (=> b!26865 m!21477))

(declare-fun m!21479 () Bool)

(assert (=> b!26865 m!21479))

(declare-fun m!21481 () Bool)

(assert (=> b!26865 m!21481))

(declare-fun m!21483 () Bool)

(assert (=> b!26865 m!21483))

(declare-fun m!21485 () Bool)

(assert (=> b!26865 m!21485))

(declare-fun m!21487 () Bool)

(assert (=> b!26865 m!21487))

(assert (=> b!26865 m!21487))

(declare-fun m!21489 () Bool)

(assert (=> b!26865 m!21489))

(assert (=> b!26865 m!21473))

(declare-fun m!21491 () Bool)

(assert (=> b!26865 m!21491))

(assert (=> b!26745 d!4881))

(declare-fun d!4883 () Bool)

(assert (=> d!4883 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!26747 d!4883))

(declare-fun b!26890 () Bool)

(declare-fun e!17529 () Bool)

(declare-fun e!17528 () Bool)

(assert (=> b!26890 (= e!17529 e!17528)))

(declare-fun c!3669 () Bool)

(assert (=> b!26890 (= c!3669 (validKeyInArray!0 (select (arr!699 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26891 () Bool)

(declare-fun e!17527 () Bool)

(declare-fun contains!243 (List!598 (_ BitVec 64)) Bool)

(assert (=> b!26891 (= e!17527 (contains!243 Nil!595 (select (arr!699 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26892 () Bool)

(declare-fun call!2531 () Bool)

(assert (=> b!26892 (= e!17528 call!2531)))

(declare-fun b!26893 () Bool)

(assert (=> b!26893 (= e!17528 call!2531)))

(declare-fun bm!2528 () Bool)

(assert (=> bm!2528 (= call!2531 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3669 (Cons!594 (select (arr!699 _keys!1833) #b00000000000000000000000000000000) Nil!595) Nil!595)))))

(declare-fun b!26894 () Bool)

(declare-fun e!17530 () Bool)

(assert (=> b!26894 (= e!17530 e!17529)))

(declare-fun res!15938 () Bool)

(assert (=> b!26894 (=> (not res!15938) (not e!17529))))

(assert (=> b!26894 (= res!15938 (not e!17527))))

(declare-fun res!15939 () Bool)

(assert (=> b!26894 (=> (not res!15939) (not e!17527))))

(assert (=> b!26894 (= res!15939 (validKeyInArray!0 (select (arr!699 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!4885 () Bool)

(declare-fun res!15940 () Bool)

(assert (=> d!4885 (=> res!15940 e!17530)))

(assert (=> d!4885 (= res!15940 (bvsge #b00000000000000000000000000000000 (size!800 _keys!1833)))))

(assert (=> d!4885 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!595) e!17530)))

(assert (= (and d!4885 (not res!15940)) b!26894))

(assert (= (and b!26894 res!15939) b!26891))

(assert (= (and b!26894 res!15938) b!26890))

(assert (= (and b!26890 c!3669) b!26893))

(assert (= (and b!26890 (not c!3669)) b!26892))

(assert (= (or b!26893 b!26892) bm!2528))

(assert (=> b!26890 m!21435))

(assert (=> b!26890 m!21435))

(assert (=> b!26890 m!21437))

(assert (=> b!26891 m!21435))

(assert (=> b!26891 m!21435))

(declare-fun m!21493 () Bool)

(assert (=> b!26891 m!21493))

(assert (=> bm!2528 m!21435))

(declare-fun m!21495 () Bool)

(assert (=> bm!2528 m!21495))

(assert (=> b!26894 m!21435))

(assert (=> b!26894 m!21435))

(assert (=> b!26894 m!21437))

(assert (=> b!26751 d!4885))

(declare-fun bm!2531 () Bool)

(declare-fun call!2534 () Bool)

(assert (=> bm!2531 (= call!2534 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!26903 () Bool)

(declare-fun e!17539 () Bool)

(assert (=> b!26903 (= e!17539 call!2534)))

(declare-fun b!26904 () Bool)

(declare-fun e!17537 () Bool)

(assert (=> b!26904 (= e!17537 e!17539)))

(declare-fun c!3672 () Bool)

(assert (=> b!26904 (= c!3672 (validKeyInArray!0 (select (arr!699 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26905 () Bool)

(declare-fun e!17538 () Bool)

(assert (=> b!26905 (= e!17538 call!2534)))

(declare-fun d!4887 () Bool)

(declare-fun res!15945 () Bool)

(assert (=> d!4887 (=> res!15945 e!17537)))

(assert (=> d!4887 (= res!15945 (bvsge #b00000000000000000000000000000000 (size!800 _keys!1833)))))

(assert (=> d!4887 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!17537)))

(declare-fun b!26906 () Bool)

(assert (=> b!26906 (= e!17539 e!17538)))

(declare-fun lt!10490 () (_ BitVec 64))

(assert (=> b!26906 (= lt!10490 (select (arr!699 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10492 () Unit!634)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1485 (_ BitVec 64) (_ BitVec 32)) Unit!634)

(assert (=> b!26906 (= lt!10492 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10490 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!26906 (arrayContainsKey!0 _keys!1833 lt!10490 #b00000000000000000000000000000000)))

(declare-fun lt!10491 () Unit!634)

(assert (=> b!26906 (= lt!10491 lt!10492)))

(declare-fun res!15946 () Bool)

(declare-datatypes ((SeekEntryResult!63 0))(
  ( (MissingZero!63 (index!2374 (_ BitVec 32))) (Found!63 (index!2375 (_ BitVec 32))) (Intermediate!63 (undefined!875 Bool) (index!2376 (_ BitVec 32)) (x!6177 (_ BitVec 32))) (Undefined!63) (MissingVacant!63 (index!2377 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1485 (_ BitVec 32)) SeekEntryResult!63)

(assert (=> b!26906 (= res!15946 (= (seekEntryOrOpen!0 (select (arr!699 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!63 #b00000000000000000000000000000000)))))

(assert (=> b!26906 (=> (not res!15946) (not e!17538))))

(assert (= (and d!4887 (not res!15945)) b!26904))

(assert (= (and b!26904 c!3672) b!26906))

(assert (= (and b!26904 (not c!3672)) b!26903))

(assert (= (and b!26906 res!15946) b!26905))

(assert (= (or b!26905 b!26903) bm!2531))

(declare-fun m!21497 () Bool)

(assert (=> bm!2531 m!21497))

(assert (=> b!26904 m!21435))

(assert (=> b!26904 m!21435))

(assert (=> b!26904 m!21437))

(assert (=> b!26906 m!21435))

(declare-fun m!21499 () Bool)

(assert (=> b!26906 m!21499))

(declare-fun m!21501 () Bool)

(assert (=> b!26906 m!21501))

(assert (=> b!26906 m!21435))

(declare-fun m!21503 () Bool)

(assert (=> b!26906 m!21503))

(assert (=> b!26746 d!4887))

(declare-fun mapIsEmpty!1231 () Bool)

(declare-fun mapRes!1231 () Bool)

(assert (=> mapIsEmpty!1231 mapRes!1231))

(declare-fun b!26914 () Bool)

(declare-fun e!17544 () Bool)

(assert (=> b!26914 (= e!17544 tp_is_empty!1135)))

(declare-fun b!26913 () Bool)

(declare-fun e!17545 () Bool)

(assert (=> b!26913 (= e!17545 tp_is_empty!1135)))

(declare-fun condMapEmpty!1231 () Bool)

(declare-fun mapDefault!1231 () ValueCell!368)

(assert (=> mapNonEmpty!1222 (= condMapEmpty!1231 (= mapRest!1222 ((as const (Array (_ BitVec 32) ValueCell!368)) mapDefault!1231)))))

(assert (=> mapNonEmpty!1222 (= tp!3753 (and e!17544 mapRes!1231))))

(declare-fun mapNonEmpty!1231 () Bool)

(declare-fun tp!3769 () Bool)

(assert (=> mapNonEmpty!1231 (= mapRes!1231 (and tp!3769 e!17545))))

(declare-fun mapRest!1231 () (Array (_ BitVec 32) ValueCell!368))

(declare-fun mapKey!1231 () (_ BitVec 32))

(declare-fun mapValue!1231 () ValueCell!368)

(assert (=> mapNonEmpty!1231 (= mapRest!1222 (store mapRest!1231 mapKey!1231 mapValue!1231))))

(assert (= (and mapNonEmpty!1222 condMapEmpty!1231) mapIsEmpty!1231))

(assert (= (and mapNonEmpty!1222 (not condMapEmpty!1231)) mapNonEmpty!1231))

(assert (= (and mapNonEmpty!1231 ((_ is ValueCellFull!368) mapValue!1231)) b!26913))

(assert (= (and mapNonEmpty!1222 ((_ is ValueCellFull!368) mapDefault!1231)) b!26914))

(declare-fun m!21505 () Bool)

(assert (=> mapNonEmpty!1231 m!21505))

(declare-fun b_lambda!1673 () Bool)

(assert (= b_lambda!1671 (or (and start!3816 b_free!781) b_lambda!1673)))

(check-sat (not d!4879) (not mapNonEmpty!1231) (not b!26814) (not bm!2524) (not b!26861) (not d!4881) (not b!26894) b_and!1585 (not b_lambda!1673) (not bm!2531) (not b!26858) (not b!26865) (not b!26871) (not b!26890) (not bm!2525) (not bm!2519) (not b!26875) (not b!26891) (not bm!2523) (not b!26872) (not b!26906) (not b!26904) (not b!26812) (not b_next!781) (not b!26859) tp_is_empty!1135 (not bm!2528) (not b!26877))
(check-sat b_and!1585 (not b_next!781))
