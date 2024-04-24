; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3822 () Bool)

(assert start!3822)

(declare-fun b_free!781 () Bool)

(declare-fun b_next!781 () Bool)

(assert (=> start!3822 (= b_free!781 (not b_next!781))))

(declare-fun tp!3753 () Bool)

(declare-fun b_and!1575 () Bool)

(assert (=> start!3822 (= tp!3753 b_and!1575)))

(declare-fun b!26726 () Bool)

(declare-fun res!15853 () Bool)

(declare-fun e!17434 () Bool)

(assert (=> b!26726 (=> (not res!15853) (not e!17434))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1339 0))(
  ( (V!1340 (val!594 Int)) )
))
(declare-datatypes ((ValueCell!368 0))(
  ( (ValueCellFull!368 (v!1680 V!1339)) (EmptyCell!368) )
))
(declare-datatypes ((array!1491 0))(
  ( (array!1492 (arr!702 (Array (_ BitVec 32) ValueCell!368)) (size!803 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1491)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1493 0))(
  ( (array!1494 (arr!703 (Array (_ BitVec 32) (_ BitVec 64))) (size!804 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1493)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun zeroValue!1443 () V!1339)

(declare-fun minValue!1443 () V!1339)

(declare-datatypes ((tuple2!1002 0))(
  ( (tuple2!1003 (_1!512 (_ BitVec 64)) (_2!512 V!1339)) )
))
(declare-datatypes ((List!596 0))(
  ( (Nil!593) (Cons!592 (h!1159 tuple2!1002) (t!3277 List!596)) )
))
(declare-datatypes ((ListLongMap!573 0))(
  ( (ListLongMap!574 (toList!302 List!596)) )
))
(declare-fun contains!241 (ListLongMap!573 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!132 (array!1493 array!1491 (_ BitVec 32) (_ BitVec 32) V!1339 V!1339 (_ BitVec 32) Int) ListLongMap!573)

(assert (=> b!26726 (= res!15853 (not (contains!241 (getCurrentListMap!132 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!26727 () Bool)

(assert (=> b!26727 (= e!17434 (bvsge #b00000000000000000000000000000000 (size!804 _keys!1833)))))

(declare-fun b!26728 () Bool)

(declare-fun e!17430 () Bool)

(declare-fun e!17432 () Bool)

(declare-fun mapRes!1222 () Bool)

(assert (=> b!26728 (= e!17430 (and e!17432 mapRes!1222))))

(declare-fun condMapEmpty!1222 () Bool)

(declare-fun mapDefault!1222 () ValueCell!368)

(assert (=> b!26728 (= condMapEmpty!1222 (= (arr!702 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!368)) mapDefault!1222)))))

(declare-fun mapNonEmpty!1222 () Bool)

(declare-fun tp!3754 () Bool)

(declare-fun e!17433 () Bool)

(assert (=> mapNonEmpty!1222 (= mapRes!1222 (and tp!3754 e!17433))))

(declare-fun mapValue!1222 () ValueCell!368)

(declare-fun mapRest!1222 () (Array (_ BitVec 32) ValueCell!368))

(declare-fun mapKey!1222 () (_ BitVec 32))

(assert (=> mapNonEmpty!1222 (= (arr!702 _values!1501) (store mapRest!1222 mapKey!1222 mapValue!1222))))

(declare-fun res!15855 () Bool)

(assert (=> start!3822 (=> (not res!15855) (not e!17434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3822 (= res!15855 (validMask!0 mask!2294))))

(assert (=> start!3822 e!17434))

(assert (=> start!3822 true))

(assert (=> start!3822 tp!3753))

(declare-fun array_inv!491 (array!1491) Bool)

(assert (=> start!3822 (and (array_inv!491 _values!1501) e!17430)))

(declare-fun array_inv!492 (array!1493) Bool)

(assert (=> start!3822 (array_inv!492 _keys!1833)))

(declare-fun tp_is_empty!1135 () Bool)

(assert (=> start!3822 tp_is_empty!1135))

(declare-fun b!26725 () Bool)

(declare-fun res!15856 () Bool)

(assert (=> b!26725 (=> (not res!15856) (not e!17434))))

(declare-datatypes ((List!597 0))(
  ( (Nil!594) (Cons!593 (h!1160 (_ BitVec 64)) (t!3278 List!597)) )
))
(declare-fun arrayNoDuplicates!0 (array!1493 (_ BitVec 32) List!597) Bool)

(assert (=> b!26725 (= res!15856 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!594))))

(declare-fun b!26729 () Bool)

(declare-fun res!15852 () Bool)

(assert (=> b!26729 (=> (not res!15852) (not e!17434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26729 (= res!15852 (validKeyInArray!0 k0!1304))))

(declare-fun b!26730 () Bool)

(declare-fun res!15854 () Bool)

(assert (=> b!26730 (=> (not res!15854) (not e!17434))))

(assert (=> b!26730 (= res!15854 (and (= (size!803 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!804 _keys!1833) (size!803 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26731 () Bool)

(assert (=> b!26731 (= e!17432 tp_is_empty!1135)))

(declare-fun mapIsEmpty!1222 () Bool)

(assert (=> mapIsEmpty!1222 mapRes!1222))

(declare-fun b!26732 () Bool)

(assert (=> b!26732 (= e!17433 tp_is_empty!1135)))

(declare-fun b!26733 () Bool)

(declare-fun res!15857 () Bool)

(assert (=> b!26733 (=> (not res!15857) (not e!17434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1493 (_ BitVec 32)) Bool)

(assert (=> b!26733 (= res!15857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!3822 res!15855) b!26730))

(assert (= (and b!26730 res!15854) b!26733))

(assert (= (and b!26733 res!15857) b!26725))

(assert (= (and b!26725 res!15856) b!26729))

(assert (= (and b!26729 res!15852) b!26726))

(assert (= (and b!26726 res!15853) b!26727))

(assert (= (and b!26728 condMapEmpty!1222) mapIsEmpty!1222))

(assert (= (and b!26728 (not condMapEmpty!1222)) mapNonEmpty!1222))

(get-info :version)

(assert (= (and mapNonEmpty!1222 ((_ is ValueCellFull!368) mapValue!1222)) b!26732))

(assert (= (and b!26728 ((_ is ValueCellFull!368) mapDefault!1222)) b!26731))

(assert (= start!3822 b!26728))

(declare-fun m!21291 () Bool)

(assert (=> mapNonEmpty!1222 m!21291))

(declare-fun m!21293 () Bool)

(assert (=> b!26729 m!21293))

(declare-fun m!21295 () Bool)

(assert (=> start!3822 m!21295))

(declare-fun m!21297 () Bool)

(assert (=> start!3822 m!21297))

(declare-fun m!21299 () Bool)

(assert (=> start!3822 m!21299))

(declare-fun m!21301 () Bool)

(assert (=> b!26725 m!21301))

(declare-fun m!21303 () Bool)

(assert (=> b!26733 m!21303))

(declare-fun m!21305 () Bool)

(assert (=> b!26726 m!21305))

(assert (=> b!26726 m!21305))

(declare-fun m!21307 () Bool)

(assert (=> b!26726 m!21307))

(check-sat (not b!26726) (not b!26733) (not mapNonEmpty!1222) (not start!3822) b_and!1575 (not b!26729) tp_is_empty!1135 (not b_next!781) (not b!26725))
(check-sat b_and!1575 (not b_next!781))
(get-model)

(declare-fun b!26796 () Bool)

(declare-fun e!17472 () Bool)

(declare-fun e!17473 () Bool)

(assert (=> b!26796 (= e!17472 e!17473)))

(declare-fun lt!10373 () (_ BitVec 64))

(assert (=> b!26796 (= lt!10373 (select (arr!703 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!635 0))(
  ( (Unit!636) )
))
(declare-fun lt!10374 () Unit!635)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1493 (_ BitVec 64) (_ BitVec 32)) Unit!635)

(assert (=> b!26796 (= lt!10374 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10373 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!26796 (arrayContainsKey!0 _keys!1833 lt!10373 #b00000000000000000000000000000000)))

(declare-fun lt!10372 () Unit!635)

(assert (=> b!26796 (= lt!10372 lt!10374)))

(declare-fun res!15899 () Bool)

(declare-datatypes ((SeekEntryResult!62 0))(
  ( (MissingZero!62 (index!2370 (_ BitVec 32))) (Found!62 (index!2371 (_ BitVec 32))) (Intermediate!62 (undefined!874 Bool) (index!2372 (_ BitVec 32)) (x!6176 (_ BitVec 32))) (Undefined!62) (MissingVacant!62 (index!2373 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1493 (_ BitVec 32)) SeekEntryResult!62)

(assert (=> b!26796 (= res!15899 (= (seekEntryOrOpen!0 (select (arr!703 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!62 #b00000000000000000000000000000000)))))

(assert (=> b!26796 (=> (not res!15899) (not e!17473))))

(declare-fun b!26797 () Bool)

(declare-fun call!2496 () Bool)

(assert (=> b!26797 (= e!17473 call!2496)))

(declare-fun d!4875 () Bool)

(declare-fun res!15898 () Bool)

(declare-fun e!17471 () Bool)

(assert (=> d!4875 (=> res!15898 e!17471)))

(assert (=> d!4875 (= res!15898 (bvsge #b00000000000000000000000000000000 (size!804 _keys!1833)))))

(assert (=> d!4875 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!17471)))

(declare-fun bm!2493 () Bool)

(assert (=> bm!2493 (= call!2496 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!26798 () Bool)

(assert (=> b!26798 (= e!17472 call!2496)))

(declare-fun b!26799 () Bool)

(assert (=> b!26799 (= e!17471 e!17472)))

(declare-fun c!3643 () Bool)

(assert (=> b!26799 (= c!3643 (validKeyInArray!0 (select (arr!703 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!4875 (not res!15898)) b!26799))

(assert (= (and b!26799 c!3643) b!26796))

(assert (= (and b!26799 (not c!3643)) b!26798))

(assert (= (and b!26796 res!15899) b!26797))

(assert (= (or b!26797 b!26798) bm!2493))

(declare-fun m!21345 () Bool)

(assert (=> b!26796 m!21345))

(declare-fun m!21347 () Bool)

(assert (=> b!26796 m!21347))

(declare-fun m!21349 () Bool)

(assert (=> b!26796 m!21349))

(assert (=> b!26796 m!21345))

(declare-fun m!21351 () Bool)

(assert (=> b!26796 m!21351))

(declare-fun m!21353 () Bool)

(assert (=> bm!2493 m!21353))

(assert (=> b!26799 m!21345))

(assert (=> b!26799 m!21345))

(declare-fun m!21355 () Bool)

(assert (=> b!26799 m!21355))

(assert (=> b!26733 d!4875))

(declare-fun d!4877 () Bool)

(declare-fun res!15908 () Bool)

(declare-fun e!17482 () Bool)

(assert (=> d!4877 (=> res!15908 e!17482)))

(assert (=> d!4877 (= res!15908 (bvsge #b00000000000000000000000000000000 (size!804 _keys!1833)))))

(assert (=> d!4877 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!594) e!17482)))

(declare-fun b!26810 () Bool)

(declare-fun e!17484 () Bool)

(declare-fun contains!244 (List!597 (_ BitVec 64)) Bool)

(assert (=> b!26810 (= e!17484 (contains!244 Nil!594 (select (arr!703 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26811 () Bool)

(declare-fun e!17483 () Bool)

(declare-fun call!2499 () Bool)

(assert (=> b!26811 (= e!17483 call!2499)))

(declare-fun b!26812 () Bool)

(declare-fun e!17485 () Bool)

(assert (=> b!26812 (= e!17485 e!17483)))

(declare-fun c!3646 () Bool)

(assert (=> b!26812 (= c!3646 (validKeyInArray!0 (select (arr!703 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2496 () Bool)

(assert (=> bm!2496 (= call!2499 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3646 (Cons!593 (select (arr!703 _keys!1833) #b00000000000000000000000000000000) Nil!594) Nil!594)))))

(declare-fun b!26813 () Bool)

(assert (=> b!26813 (= e!17482 e!17485)))

(declare-fun res!15906 () Bool)

(assert (=> b!26813 (=> (not res!15906) (not e!17485))))

(assert (=> b!26813 (= res!15906 (not e!17484))))

(declare-fun res!15907 () Bool)

(assert (=> b!26813 (=> (not res!15907) (not e!17484))))

(assert (=> b!26813 (= res!15907 (validKeyInArray!0 (select (arr!703 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26814 () Bool)

(assert (=> b!26814 (= e!17483 call!2499)))

(assert (= (and d!4877 (not res!15908)) b!26813))

(assert (= (and b!26813 res!15907) b!26810))

(assert (= (and b!26813 res!15906) b!26812))

(assert (= (and b!26812 c!3646) b!26811))

(assert (= (and b!26812 (not c!3646)) b!26814))

(assert (= (or b!26811 b!26814) bm!2496))

(assert (=> b!26810 m!21345))

(assert (=> b!26810 m!21345))

(declare-fun m!21357 () Bool)

(assert (=> b!26810 m!21357))

(assert (=> b!26812 m!21345))

(assert (=> b!26812 m!21345))

(assert (=> b!26812 m!21355))

(assert (=> bm!2496 m!21345))

(declare-fun m!21359 () Bool)

(assert (=> bm!2496 m!21359))

(assert (=> b!26813 m!21345))

(assert (=> b!26813 m!21345))

(assert (=> b!26813 m!21355))

(assert (=> b!26725 d!4877))

(declare-fun d!4879 () Bool)

(assert (=> d!4879 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!26729 d!4879))

(declare-fun d!4881 () Bool)

(declare-fun e!17491 () Bool)

(assert (=> d!4881 e!17491))

(declare-fun res!15911 () Bool)

(assert (=> d!4881 (=> res!15911 e!17491)))

(declare-fun lt!10386 () Bool)

(assert (=> d!4881 (= res!15911 (not lt!10386))))

(declare-fun lt!10383 () Bool)

(assert (=> d!4881 (= lt!10386 lt!10383)))

(declare-fun lt!10385 () Unit!635)

(declare-fun e!17490 () Unit!635)

(assert (=> d!4881 (= lt!10385 e!17490)))

(declare-fun c!3649 () Bool)

(assert (=> d!4881 (= c!3649 lt!10383)))

(declare-fun containsKey!26 (List!596 (_ BitVec 64)) Bool)

(assert (=> d!4881 (= lt!10383 (containsKey!26 (toList!302 (getCurrentListMap!132 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!4881 (= (contains!241 (getCurrentListMap!132 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!10386)))

(declare-fun b!26821 () Bool)

(declare-fun lt!10384 () Unit!635)

(assert (=> b!26821 (= e!17490 lt!10384)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!23 (List!596 (_ BitVec 64)) Unit!635)

(assert (=> b!26821 (= lt!10384 (lemmaContainsKeyImpliesGetValueByKeyDefined!23 (toList!302 (getCurrentListMap!132 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!68 0))(
  ( (Some!67 (v!1683 V!1339)) (None!66) )
))
(declare-fun isDefined!24 (Option!68) Bool)

(declare-fun getValueByKey!62 (List!596 (_ BitVec 64)) Option!68)

(assert (=> b!26821 (isDefined!24 (getValueByKey!62 (toList!302 (getCurrentListMap!132 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!26822 () Bool)

(declare-fun Unit!637 () Unit!635)

(assert (=> b!26822 (= e!17490 Unit!637)))

(declare-fun b!26823 () Bool)

(assert (=> b!26823 (= e!17491 (isDefined!24 (getValueByKey!62 (toList!302 (getCurrentListMap!132 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!4881 c!3649) b!26821))

(assert (= (and d!4881 (not c!3649)) b!26822))

(assert (= (and d!4881 (not res!15911)) b!26823))

(declare-fun m!21361 () Bool)

(assert (=> d!4881 m!21361))

(declare-fun m!21363 () Bool)

(assert (=> b!26821 m!21363))

(declare-fun m!21365 () Bool)

(assert (=> b!26821 m!21365))

(assert (=> b!26821 m!21365))

(declare-fun m!21367 () Bool)

(assert (=> b!26821 m!21367))

(assert (=> b!26823 m!21365))

(assert (=> b!26823 m!21365))

(assert (=> b!26823 m!21367))

(assert (=> b!26726 d!4881))

(declare-fun call!2515 () ListLongMap!573)

(declare-fun call!2516 () ListLongMap!573)

(declare-fun c!3666 () Bool)

(declare-fun call!2519 () ListLongMap!573)

(declare-fun call!2518 () ListLongMap!573)

(declare-fun bm!2511 () Bool)

(declare-fun c!3663 () Bool)

(declare-fun +!47 (ListLongMap!573 tuple2!1002) ListLongMap!573)

(assert (=> bm!2511 (= call!2516 (+!47 (ite c!3663 call!2515 (ite c!3666 call!2519 call!2518)) (ite (or c!3663 c!3666) (tuple2!1003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!26866 () Bool)

(declare-fun e!17523 () Bool)

(declare-fun e!17518 () Bool)

(assert (=> b!26866 (= e!17523 e!17518)))

(declare-fun res!15931 () Bool)

(declare-fun call!2514 () Bool)

(assert (=> b!26866 (= res!15931 call!2514)))

(assert (=> b!26866 (=> (not res!15931) (not e!17518))))

(declare-fun b!26867 () Bool)

(declare-fun e!17521 () Bool)

(declare-fun e!17520 () Bool)

(assert (=> b!26867 (= e!17521 e!17520)))

(declare-fun c!3662 () Bool)

(assert (=> b!26867 (= c!3662 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!26868 () Bool)

(declare-fun e!17527 () Bool)

(declare-fun lt!10448 () ListLongMap!573)

(declare-fun apply!30 (ListLongMap!573 (_ BitVec 64)) V!1339)

(assert (=> b!26868 (= e!17527 (= (apply!30 lt!10448 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun e!17524 () Bool)

(declare-fun b!26869 () Bool)

(declare-fun get!433 (ValueCell!368 V!1339) V!1339)

(declare-fun dynLambda!143 (Int (_ BitVec 64)) V!1339)

(assert (=> b!26869 (= e!17524 (= (apply!30 lt!10448 (select (arr!703 _keys!1833) #b00000000000000000000000000000000)) (get!433 (select (arr!702 _values!1501) #b00000000000000000000000000000000) (dynLambda!143 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!26869 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!803 _values!1501)))))

(assert (=> b!26869 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!804 _keys!1833)))))

(declare-fun b!26870 () Bool)

(declare-fun res!15935 () Bool)

(assert (=> b!26870 (=> (not res!15935) (not e!17521))))

(declare-fun e!17526 () Bool)

(assert (=> b!26870 (= res!15935 e!17526)))

(declare-fun res!15930 () Bool)

(assert (=> b!26870 (=> res!15930 e!17526)))

(declare-fun e!17529 () Bool)

(assert (=> b!26870 (= res!15930 (not e!17529))))

(declare-fun res!15932 () Bool)

(assert (=> b!26870 (=> (not res!15932) (not e!17529))))

(assert (=> b!26870 (= res!15932 (bvslt #b00000000000000000000000000000000 (size!804 _keys!1833)))))

(declare-fun b!26871 () Bool)

(declare-fun e!17525 () ListLongMap!573)

(declare-fun call!2520 () ListLongMap!573)

(assert (=> b!26871 (= e!17525 call!2520)))

(declare-fun b!26872 () Bool)

(declare-fun e!17522 () ListLongMap!573)

(assert (=> b!26872 (= e!17522 call!2520)))

(declare-fun bm!2512 () Bool)

(declare-fun call!2517 () Bool)

(assert (=> bm!2512 (= call!2517 (contains!241 lt!10448 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26873 () Bool)

(assert (=> b!26873 (= e!17523 (not call!2514))))

(declare-fun d!4883 () Bool)

(assert (=> d!4883 e!17521))

(declare-fun res!15933 () Bool)

(assert (=> d!4883 (=> (not res!15933) (not e!17521))))

(assert (=> d!4883 (= res!15933 (or (bvsge #b00000000000000000000000000000000 (size!804 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!804 _keys!1833)))))))

(declare-fun lt!10452 () ListLongMap!573)

(assert (=> d!4883 (= lt!10448 lt!10452)))

(declare-fun lt!10438 () Unit!635)

(declare-fun e!17530 () Unit!635)

(assert (=> d!4883 (= lt!10438 e!17530)))

(declare-fun c!3664 () Bool)

(declare-fun e!17519 () Bool)

(assert (=> d!4883 (= c!3664 e!17519)))

(declare-fun res!15934 () Bool)

(assert (=> d!4883 (=> (not res!15934) (not e!17519))))

(assert (=> d!4883 (= res!15934 (bvslt #b00000000000000000000000000000000 (size!804 _keys!1833)))))

(declare-fun e!17528 () ListLongMap!573)

(assert (=> d!4883 (= lt!10452 e!17528)))

(assert (=> d!4883 (= c!3663 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!4883 (validMask!0 mask!2294)))

(assert (=> d!4883 (= (getCurrentListMap!132 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!10448)))

(declare-fun b!26874 () Bool)

(declare-fun c!3667 () Bool)

(assert (=> b!26874 (= c!3667 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!26874 (= e!17522 e!17525)))

(declare-fun bm!2513 () Bool)

(assert (=> bm!2513 (= call!2520 call!2516)))

(declare-fun b!26875 () Bool)

(assert (=> b!26875 (= e!17528 e!17522)))

(assert (=> b!26875 (= c!3666 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!26876 () Bool)

(assert (=> b!26876 (= e!17526 e!17524)))

(declare-fun res!15937 () Bool)

(assert (=> b!26876 (=> (not res!15937) (not e!17524))))

(assert (=> b!26876 (= res!15937 (contains!241 lt!10448 (select (arr!703 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!26876 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!804 _keys!1833)))))

(declare-fun b!26877 () Bool)

(declare-fun Unit!638 () Unit!635)

(assert (=> b!26877 (= e!17530 Unit!638)))

(declare-fun bm!2514 () Bool)

(assert (=> bm!2514 (= call!2518 call!2519)))

(declare-fun bm!2515 () Bool)

(assert (=> bm!2515 (= call!2514 (contains!241 lt!10448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26878 () Bool)

(assert (=> b!26878 (= e!17519 (validKeyInArray!0 (select (arr!703 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26879 () Bool)

(declare-fun res!15936 () Bool)

(assert (=> b!26879 (=> (not res!15936) (not e!17521))))

(assert (=> b!26879 (= res!15936 e!17523)))

(declare-fun c!3665 () Bool)

(assert (=> b!26879 (= c!3665 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!26880 () Bool)

(assert (=> b!26880 (= e!17525 call!2518)))

(declare-fun b!26881 () Bool)

(declare-fun lt!10446 () Unit!635)

(assert (=> b!26881 (= e!17530 lt!10446)))

(declare-fun lt!10445 () ListLongMap!573)

(declare-fun getCurrentListMapNoExtraKeys!17 (array!1493 array!1491 (_ BitVec 32) (_ BitVec 32) V!1339 V!1339 (_ BitVec 32) Int) ListLongMap!573)

(assert (=> b!26881 (= lt!10445 (getCurrentListMapNoExtraKeys!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10433 () (_ BitVec 64))

(assert (=> b!26881 (= lt!10433 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10434 () (_ BitVec 64))

(assert (=> b!26881 (= lt!10434 (select (arr!703 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10450 () Unit!635)

(declare-fun addStillContains!15 (ListLongMap!573 (_ BitVec 64) V!1339 (_ BitVec 64)) Unit!635)

(assert (=> b!26881 (= lt!10450 (addStillContains!15 lt!10445 lt!10433 zeroValue!1443 lt!10434))))

(assert (=> b!26881 (contains!241 (+!47 lt!10445 (tuple2!1003 lt!10433 zeroValue!1443)) lt!10434)))

(declare-fun lt!10440 () Unit!635)

(assert (=> b!26881 (= lt!10440 lt!10450)))

(declare-fun lt!10436 () ListLongMap!573)

(assert (=> b!26881 (= lt!10436 (getCurrentListMapNoExtraKeys!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10435 () (_ BitVec 64))

(assert (=> b!26881 (= lt!10435 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10441 () (_ BitVec 64))

(assert (=> b!26881 (= lt!10441 (select (arr!703 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10449 () Unit!635)

(declare-fun addApplyDifferent!15 (ListLongMap!573 (_ BitVec 64) V!1339 (_ BitVec 64)) Unit!635)

(assert (=> b!26881 (= lt!10449 (addApplyDifferent!15 lt!10436 lt!10435 minValue!1443 lt!10441))))

(assert (=> b!26881 (= (apply!30 (+!47 lt!10436 (tuple2!1003 lt!10435 minValue!1443)) lt!10441) (apply!30 lt!10436 lt!10441))))

(declare-fun lt!10432 () Unit!635)

(assert (=> b!26881 (= lt!10432 lt!10449)))

(declare-fun lt!10447 () ListLongMap!573)

(assert (=> b!26881 (= lt!10447 (getCurrentListMapNoExtraKeys!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10444 () (_ BitVec 64))

(assert (=> b!26881 (= lt!10444 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10437 () (_ BitVec 64))

(assert (=> b!26881 (= lt!10437 (select (arr!703 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10439 () Unit!635)

(assert (=> b!26881 (= lt!10439 (addApplyDifferent!15 lt!10447 lt!10444 zeroValue!1443 lt!10437))))

(assert (=> b!26881 (= (apply!30 (+!47 lt!10447 (tuple2!1003 lt!10444 zeroValue!1443)) lt!10437) (apply!30 lt!10447 lt!10437))))

(declare-fun lt!10442 () Unit!635)

(assert (=> b!26881 (= lt!10442 lt!10439)))

(declare-fun lt!10451 () ListLongMap!573)

(assert (=> b!26881 (= lt!10451 (getCurrentListMapNoExtraKeys!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10443 () (_ BitVec 64))

(assert (=> b!26881 (= lt!10443 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10431 () (_ BitVec 64))

(assert (=> b!26881 (= lt!10431 (select (arr!703 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!26881 (= lt!10446 (addApplyDifferent!15 lt!10451 lt!10443 minValue!1443 lt!10431))))

(assert (=> b!26881 (= (apply!30 (+!47 lt!10451 (tuple2!1003 lt!10443 minValue!1443)) lt!10431) (apply!30 lt!10451 lt!10431))))

(declare-fun b!26882 () Bool)

(assert (=> b!26882 (= e!17529 (validKeyInArray!0 (select (arr!703 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26883 () Bool)

(assert (=> b!26883 (= e!17520 e!17527)))

(declare-fun res!15938 () Bool)

(assert (=> b!26883 (= res!15938 call!2517)))

(assert (=> b!26883 (=> (not res!15938) (not e!17527))))

(declare-fun b!26884 () Bool)

(assert (=> b!26884 (= e!17528 (+!47 call!2516 (tuple2!1003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!26885 () Bool)

(assert (=> b!26885 (= e!17520 (not call!2517))))

(declare-fun b!26886 () Bool)

(assert (=> b!26886 (= e!17518 (= (apply!30 lt!10448 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun bm!2516 () Bool)

(assert (=> bm!2516 (= call!2519 call!2515)))

(declare-fun bm!2517 () Bool)

(assert (=> bm!2517 (= call!2515 (getCurrentListMapNoExtraKeys!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(assert (= (and d!4883 c!3663) b!26884))

(assert (= (and d!4883 (not c!3663)) b!26875))

(assert (= (and b!26875 c!3666) b!26872))

(assert (= (and b!26875 (not c!3666)) b!26874))

(assert (= (and b!26874 c!3667) b!26871))

(assert (= (and b!26874 (not c!3667)) b!26880))

(assert (= (or b!26871 b!26880) bm!2514))

(assert (= (or b!26872 bm!2514) bm!2516))

(assert (= (or b!26872 b!26871) bm!2513))

(assert (= (or b!26884 bm!2516) bm!2517))

(assert (= (or b!26884 bm!2513) bm!2511))

(assert (= (and d!4883 res!15934) b!26878))

(assert (= (and d!4883 c!3664) b!26881))

(assert (= (and d!4883 (not c!3664)) b!26877))

(assert (= (and d!4883 res!15933) b!26870))

(assert (= (and b!26870 res!15932) b!26882))

(assert (= (and b!26870 (not res!15930)) b!26876))

(assert (= (and b!26876 res!15937) b!26869))

(assert (= (and b!26870 res!15935) b!26879))

(assert (= (and b!26879 c!3665) b!26866))

(assert (= (and b!26879 (not c!3665)) b!26873))

(assert (= (and b!26866 res!15931) b!26886))

(assert (= (or b!26866 b!26873) bm!2515))

(assert (= (and b!26879 res!15936) b!26867))

(assert (= (and b!26867 c!3662) b!26883))

(assert (= (and b!26867 (not c!3662)) b!26885))

(assert (= (and b!26883 res!15938) b!26868))

(assert (= (or b!26883 b!26885) bm!2512))

(declare-fun b_lambda!1667 () Bool)

(assert (=> (not b_lambda!1667) (not b!26869)))

(declare-fun t!3282 () Bool)

(declare-fun tb!669 () Bool)

(assert (=> (and start!3822 (= defaultEntry!1504 defaultEntry!1504) t!3282) tb!669))

(declare-fun result!1129 () Bool)

(assert (=> tb!669 (= result!1129 tp_is_empty!1135)))

(assert (=> b!26869 t!3282))

(declare-fun b_and!1581 () Bool)

(assert (= b_and!1575 (and (=> t!3282 result!1129) b_and!1581)))

(declare-fun m!21369 () Bool)

(assert (=> bm!2511 m!21369))

(declare-fun m!21371 () Bool)

(assert (=> bm!2517 m!21371))

(assert (=> d!4883 m!21295))

(assert (=> b!26882 m!21345))

(assert (=> b!26882 m!21345))

(assert (=> b!26882 m!21355))

(declare-fun m!21373 () Bool)

(assert (=> bm!2512 m!21373))

(declare-fun m!21375 () Bool)

(assert (=> b!26884 m!21375))

(assert (=> b!26876 m!21345))

(assert (=> b!26876 m!21345))

(declare-fun m!21377 () Bool)

(assert (=> b!26876 m!21377))

(declare-fun m!21379 () Bool)

(assert (=> b!26886 m!21379))

(declare-fun m!21381 () Bool)

(assert (=> bm!2515 m!21381))

(declare-fun m!21383 () Bool)

(assert (=> b!26868 m!21383))

(declare-fun m!21385 () Bool)

(assert (=> b!26881 m!21385))

(declare-fun m!21387 () Bool)

(assert (=> b!26881 m!21387))

(declare-fun m!21389 () Bool)

(assert (=> b!26881 m!21389))

(declare-fun m!21391 () Bool)

(assert (=> b!26881 m!21391))

(declare-fun m!21393 () Bool)

(assert (=> b!26881 m!21393))

(assert (=> b!26881 m!21345))

(declare-fun m!21395 () Bool)

(assert (=> b!26881 m!21395))

(declare-fun m!21397 () Bool)

(assert (=> b!26881 m!21397))

(declare-fun m!21399 () Bool)

(assert (=> b!26881 m!21399))

(declare-fun m!21401 () Bool)

(assert (=> b!26881 m!21401))

(assert (=> b!26881 m!21385))

(declare-fun m!21403 () Bool)

(assert (=> b!26881 m!21403))

(declare-fun m!21405 () Bool)

(assert (=> b!26881 m!21405))

(declare-fun m!21407 () Bool)

(assert (=> b!26881 m!21407))

(assert (=> b!26881 m!21405))

(assert (=> b!26881 m!21397))

(declare-fun m!21409 () Bool)

(assert (=> b!26881 m!21409))

(assert (=> b!26881 m!21371))

(assert (=> b!26881 m!21399))

(declare-fun m!21411 () Bool)

(assert (=> b!26881 m!21411))

(declare-fun m!21413 () Bool)

(assert (=> b!26881 m!21413))

(assert (=> b!26869 m!21345))

(declare-fun m!21415 () Bool)

(assert (=> b!26869 m!21415))

(declare-fun m!21417 () Bool)

(assert (=> b!26869 m!21417))

(declare-fun m!21419 () Bool)

(assert (=> b!26869 m!21419))

(assert (=> b!26869 m!21417))

(declare-fun m!21421 () Bool)

(assert (=> b!26869 m!21421))

(assert (=> b!26869 m!21419))

(assert (=> b!26869 m!21345))

(assert (=> b!26878 m!21345))

(assert (=> b!26878 m!21345))

(assert (=> b!26878 m!21355))

(assert (=> b!26726 d!4883))

(declare-fun d!4885 () Bool)

(assert (=> d!4885 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3822 d!4885))

(declare-fun d!4887 () Bool)

(assert (=> d!4887 (= (array_inv!491 _values!1501) (bvsge (size!803 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3822 d!4887))

(declare-fun d!4889 () Bool)

(assert (=> d!4889 (= (array_inv!492 _keys!1833) (bvsge (size!804 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3822 d!4889))

(declare-fun mapIsEmpty!1231 () Bool)

(declare-fun mapRes!1231 () Bool)

(assert (=> mapIsEmpty!1231 mapRes!1231))

(declare-fun b!26896 () Bool)

(declare-fun e!17535 () Bool)

(assert (=> b!26896 (= e!17535 tp_is_empty!1135)))

(declare-fun condMapEmpty!1231 () Bool)

(declare-fun mapDefault!1231 () ValueCell!368)

(assert (=> mapNonEmpty!1222 (= condMapEmpty!1231 (= mapRest!1222 ((as const (Array (_ BitVec 32) ValueCell!368)) mapDefault!1231)))))

(assert (=> mapNonEmpty!1222 (= tp!3754 (and e!17535 mapRes!1231))))

(declare-fun mapNonEmpty!1231 () Bool)

(declare-fun tp!3769 () Bool)

(declare-fun e!17536 () Bool)

(assert (=> mapNonEmpty!1231 (= mapRes!1231 (and tp!3769 e!17536))))

(declare-fun mapValue!1231 () ValueCell!368)

(declare-fun mapRest!1231 () (Array (_ BitVec 32) ValueCell!368))

(declare-fun mapKey!1231 () (_ BitVec 32))

(assert (=> mapNonEmpty!1231 (= mapRest!1222 (store mapRest!1231 mapKey!1231 mapValue!1231))))

(declare-fun b!26895 () Bool)

(assert (=> b!26895 (= e!17536 tp_is_empty!1135)))

(assert (= (and mapNonEmpty!1222 condMapEmpty!1231) mapIsEmpty!1231))

(assert (= (and mapNonEmpty!1222 (not condMapEmpty!1231)) mapNonEmpty!1231))

(assert (= (and mapNonEmpty!1231 ((_ is ValueCellFull!368) mapValue!1231)) b!26895))

(assert (= (and mapNonEmpty!1222 ((_ is ValueCellFull!368) mapDefault!1231)) b!26896))

(declare-fun m!21423 () Bool)

(assert (=> mapNonEmpty!1231 m!21423))

(declare-fun b_lambda!1669 () Bool)

(assert (= b_lambda!1667 (or (and start!3822 b_free!781) b_lambda!1669)))

(check-sat (not d!4883) (not b!26868) (not b_lambda!1669) b_and!1581 (not b!26882) (not b!26799) (not b!26821) (not b!26881) (not mapNonEmpty!1231) (not b!26812) (not b!26810) (not bm!2515) (not b!26876) (not b!26878) (not bm!2512) (not b!26823) (not b!26796) (not b!26886) (not b!26869) (not bm!2517) (not b!26884) (not bm!2493) tp_is_empty!1135 (not b!26813) (not bm!2496) (not b_next!781) (not d!4881) (not bm!2511))
(check-sat b_and!1581 (not b_next!781))
