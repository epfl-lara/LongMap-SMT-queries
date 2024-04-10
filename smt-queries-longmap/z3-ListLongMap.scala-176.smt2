; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3364 () Bool)

(assert start!3364)

(declare-fun b!21366 () Bool)

(declare-fun b_free!735 () Bool)

(declare-fun b_next!735 () Bool)

(assert (=> b!21366 (= b_free!735 (not b_next!735))))

(declare-fun tp!3442 () Bool)

(declare-fun b_and!1423 () Bool)

(assert (=> b!21366 (= tp!3442 b_and!1423)))

(declare-fun b!21363 () Bool)

(declare-fun e!13926 () Bool)

(declare-fun e!13928 () Bool)

(declare-fun mapRes!979 () Bool)

(assert (=> b!21363 (= e!13926 (and e!13928 mapRes!979))))

(declare-fun condMapEmpty!979 () Bool)

(declare-datatypes ((V!1157 0))(
  ( (V!1158 (val!526 Int)) )
))
(declare-datatypes ((ValueCell!300 0))(
  ( (ValueCellFull!300 (v!1572 V!1157)) (EmptyCell!300) )
))
(declare-datatypes ((array!1229 0))(
  ( (array!1230 (arr!583 (Array (_ BitVec 32) ValueCell!300)) (size!676 (_ BitVec 32))) )
))
(declare-datatypes ((array!1231 0))(
  ( (array!1232 (arr!584 (Array (_ BitVec 32) (_ BitVec 64))) (size!677 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!186 0))(
  ( (LongMapFixedSize!187 (defaultEntry!1719 Int) (mask!4692 (_ BitVec 32)) (extraKeys!1622 (_ BitVec 32)) (zeroValue!1646 V!1157) (minValue!1646 V!1157) (_size!134 (_ BitVec 32)) (_keys!3140 array!1231) (_values!1708 array!1229) (_vacant!134 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!186 0))(
  ( (Cell!187 (v!1573 LongMapFixedSize!186)) )
))
(declare-datatypes ((LongMap!186 0))(
  ( (LongMap!187 (underlying!104 Cell!186)) )
))
(declare-fun thiss!938 () LongMap!186)

(declare-fun mapDefault!979 () ValueCell!300)

(assert (=> b!21363 (= condMapEmpty!979 (= (arr!583 (_values!1708 (v!1573 (underlying!104 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!300)) mapDefault!979)))))

(declare-fun b!21364 () Bool)

(declare-fun e!13933 () Bool)

(declare-fun e!13924 () Bool)

(assert (=> b!21364 (= e!13933 e!13924)))

(declare-fun c!2455 () Bool)

(declare-datatypes ((tuple2!896 0))(
  ( (tuple2!897 (_1!451 Bool) (_2!451 LongMapFixedSize!186)) )
))
(declare-fun lt!6679 () tuple2!896)

(declare-fun call!1348 () tuple2!896)

(declare-fun lt!6678 () LongMapFixedSize!186)

(declare-fun bm!1344 () Bool)

(declare-fun c!2454 () Bool)

(declare-fun update!23 (LongMapFixedSize!186 (_ BitVec 64) V!1157) tuple2!896)

(assert (=> bm!1344 (= call!1348 (update!23 (ite c!2454 (_2!451 lt!6679) lt!6678) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(declare-fun b!21365 () Bool)

(declare-datatypes ((tuple2!898 0))(
  ( (tuple2!899 (_1!452 Bool) (_2!452 Cell!186)) )
))
(declare-fun e!13931 () tuple2!898)

(declare-fun e!13934 () tuple2!898)

(assert (=> b!21365 (= e!13931 e!13934)))

(declare-fun lt!6676 () Bool)

(assert (=> b!21365 (= c!2455 (and (not lt!6676) (= (bvand (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun tp_is_empty!999 () Bool)

(declare-fun e!13927 () Bool)

(declare-fun array_inv!393 (array!1231) Bool)

(declare-fun array_inv!394 (array!1229) Bool)

(assert (=> b!21366 (= e!13927 (and tp!3442 tp_is_empty!999 (array_inv!393 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (array_inv!394 (_values!1708 (v!1573 (underlying!104 thiss!938)))) e!13926))))

(declare-fun b!21367 () Bool)

(declare-fun e!13935 () Bool)

(declare-fun e!13930 () Bool)

(assert (=> b!21367 (= e!13935 e!13930)))

(declare-fun res!13768 () Bool)

(assert (=> b!21367 (=> (not res!13768) (not e!13930))))

(declare-fun lt!6681 () tuple2!898)

(assert (=> b!21367 (= res!13768 (_1!452 lt!6681))))

(assert (=> b!21367 (= lt!6681 e!13931)))

(assert (=> b!21367 (= c!2454 (and (not lt!6676) (not (= (bvand (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!21367 (= lt!6676 (= (bvand (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!26 ((_ BitVec 32) Int) LongMapFixedSize!186)

(declare-fun computeNewMask!22 (LongMap!186 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!21367 (= lt!6678 (getNewLongMapFixedSize!26 (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun b!21368 () Bool)

(declare-datatypes ((tuple2!900 0))(
  ( (tuple2!901 (_1!453 (_ BitVec 64)) (_2!453 V!1157)) )
))
(declare-datatypes ((List!561 0))(
  ( (Nil!558) (Cons!557 (h!1123 tuple2!900) (t!3218 List!561)) )
))
(declare-datatypes ((ListLongMap!559 0))(
  ( (ListLongMap!560 (toList!295 List!561)) )
))
(declare-fun getCurrentListMap!126 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 (_ BitVec 32) Int) ListLongMap!559)

(declare-fun map!395 (LongMapFixedSize!186) ListLongMap!559)

(assert (=> b!21368 (= e!13930 (not (= (getCurrentListMap!126 (_keys!3140 (v!1573 (underlying!104 thiss!938))) (_values!1708 (v!1573 (underlying!104 thiss!938))) (mask!4692 (v!1573 (underlying!104 thiss!938))) (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938)))) (map!395 (v!1573 (_2!452 lt!6681))))))))

(declare-fun b!21369 () Bool)

(assert (=> b!21369 (= e!13924 e!13927)))

(declare-fun res!13767 () Bool)

(assert (=> start!3364 (=> (not res!13767) (not e!13935))))

(declare-fun valid!92 (LongMap!186) Bool)

(assert (=> start!3364 (= res!13767 (valid!92 thiss!938))))

(assert (=> start!3364 e!13935))

(assert (=> start!3364 e!13933))

(declare-fun b!21370 () Bool)

(declare-fun lt!6680 () tuple2!896)

(assert (=> b!21370 (= e!13931 (tuple2!899 (and (_1!451 lt!6679) (_1!451 lt!6680)) (Cell!187 (_2!451 lt!6680))))))

(assert (=> b!21370 (= lt!6679 (update!23 lt!6678 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))

(assert (=> b!21370 (= lt!6680 call!1348)))

(declare-fun b!21371 () Bool)

(declare-fun c!2453 () Bool)

(assert (=> b!21371 (= c!2453 (and (not (= (bvand (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!6676))))

(declare-fun e!13925 () tuple2!898)

(assert (=> b!21371 (= e!13934 e!13925)))

(declare-fun b!21372 () Bool)

(assert (=> b!21372 (= e!13925 (tuple2!899 true (Cell!187 lt!6678)))))

(declare-fun b!21373 () Bool)

(declare-fun res!13769 () Bool)

(assert (=> b!21373 (=> (not res!13769) (not e!13930))))

(assert (=> b!21373 (= res!13769 (and (= (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4692 (v!1573 (underlying!104 thiss!938))))) (bvsge (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001) (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))))))))

(declare-fun mapIsEmpty!979 () Bool)

(assert (=> mapIsEmpty!979 mapRes!979))

(declare-fun b!21374 () Bool)

(declare-fun lt!6675 () tuple2!896)

(assert (=> b!21374 (= e!13925 (tuple2!899 (_1!451 lt!6675) (Cell!187 (_2!451 lt!6675))))))

(declare-fun call!1347 () tuple2!896)

(assert (=> b!21374 (= lt!6675 call!1347)))

(declare-fun bm!1345 () Bool)

(assert (=> bm!1345 (= call!1347 call!1348)))

(declare-fun mapNonEmpty!979 () Bool)

(declare-fun tp!3441 () Bool)

(declare-fun e!13932 () Bool)

(assert (=> mapNonEmpty!979 (= mapRes!979 (and tp!3441 e!13932))))

(declare-fun mapRest!979 () (Array (_ BitVec 32) ValueCell!300))

(declare-fun mapKey!979 () (_ BitVec 32))

(declare-fun mapValue!979 () ValueCell!300)

(assert (=> mapNonEmpty!979 (= (arr!583 (_values!1708 (v!1573 (underlying!104 thiss!938)))) (store mapRest!979 mapKey!979 mapValue!979))))

(declare-fun b!21375 () Bool)

(assert (=> b!21375 (= e!13928 tp_is_empty!999)))

(declare-fun b!21376 () Bool)

(declare-fun res!13771 () Bool)

(assert (=> b!21376 (=> (not res!13771) (not e!13930))))

(assert (=> b!21376 (= res!13771 (bvsge (bvadd #b00000000000000000000000000000001 (mask!4692 (v!1573 (_2!452 lt!6681)))) (_size!134 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun b!21377 () Bool)

(declare-fun res!13770 () Bool)

(assert (=> b!21377 (=> (not res!13770) (not e!13930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!21377 (= res!13770 (validMask!0 (mask!4692 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun b!21378 () Bool)

(assert (=> b!21378 (= e!13932 tp_is_empty!999)))

(declare-fun b!21379 () Bool)

(declare-fun res!13766 () Bool)

(assert (=> b!21379 (=> (not res!13766) (not e!13930))))

(declare-fun valid!93 (LongMapFixedSize!186) Bool)

(assert (=> b!21379 (= res!13766 (valid!93 (v!1573 (_2!452 lt!6681))))))

(declare-fun b!21380 () Bool)

(declare-fun lt!6677 () tuple2!896)

(assert (=> b!21380 (= lt!6677 call!1347)))

(assert (=> b!21380 (= e!13934 (tuple2!899 (_1!451 lt!6677) (Cell!187 (_2!451 lt!6677))))))

(assert (= (and start!3364 res!13767) b!21367))

(assert (= (and b!21367 c!2454) b!21370))

(assert (= (and b!21367 (not c!2454)) b!21365))

(assert (= (and b!21365 c!2455) b!21380))

(assert (= (and b!21365 (not c!2455)) b!21371))

(assert (= (and b!21371 c!2453) b!21374))

(assert (= (and b!21371 (not c!2453)) b!21372))

(assert (= (or b!21380 b!21374) bm!1345))

(assert (= (or b!21370 bm!1345) bm!1344))

(assert (= (and b!21367 res!13768) b!21377))

(assert (= (and b!21377 res!13770) b!21373))

(assert (= (and b!21373 res!13769) b!21379))

(assert (= (and b!21379 res!13766) b!21376))

(assert (= (and b!21376 res!13771) b!21368))

(assert (= (and b!21363 condMapEmpty!979) mapIsEmpty!979))

(assert (= (and b!21363 (not condMapEmpty!979)) mapNonEmpty!979))

(get-info :version)

(assert (= (and mapNonEmpty!979 ((_ is ValueCellFull!300) mapValue!979)) b!21378))

(assert (= (and b!21363 ((_ is ValueCellFull!300) mapDefault!979)) b!21375))

(assert (= b!21366 b!21363))

(assert (= b!21369 b!21366))

(assert (= b!21364 b!21369))

(assert (= start!3364 b!21364))

(declare-fun m!14915 () Bool)

(assert (=> b!21368 m!14915))

(declare-fun m!14917 () Bool)

(assert (=> b!21368 m!14917))

(declare-fun m!14919 () Bool)

(assert (=> b!21367 m!14919))

(assert (=> b!21367 m!14919))

(declare-fun m!14921 () Bool)

(assert (=> b!21367 m!14921))

(declare-fun m!14923 () Bool)

(assert (=> b!21370 m!14923))

(declare-fun m!14925 () Bool)

(assert (=> b!21379 m!14925))

(declare-fun m!14927 () Bool)

(assert (=> bm!1344 m!14927))

(declare-fun m!14929 () Bool)

(assert (=> b!21377 m!14929))

(declare-fun m!14931 () Bool)

(assert (=> b!21366 m!14931))

(declare-fun m!14933 () Bool)

(assert (=> b!21366 m!14933))

(declare-fun m!14935 () Bool)

(assert (=> mapNonEmpty!979 m!14935))

(declare-fun m!14937 () Bool)

(assert (=> start!3364 m!14937))

(check-sat (not mapNonEmpty!979) (not b!21370) b_and!1423 (not b!21368) (not b_next!735) (not b!21377) (not b!21366) (not bm!1344) tp_is_empty!999 (not start!3364) (not b!21367) (not b!21379))
(check-sat b_and!1423 (not b_next!735))
(get-model)

(declare-fun b!21477 () Bool)

(declare-fun e!14009 () Bool)

(declare-fun e!13999 () Bool)

(assert (=> b!21477 (= e!14009 e!13999)))

(declare-fun res!13812 () Bool)

(declare-fun call!1372 () Bool)

(assert (=> b!21477 (= res!13812 call!1372)))

(assert (=> b!21477 (=> (not res!13812) (not e!13999))))

(declare-fun bm!1366 () Bool)

(declare-fun call!1370 () ListLongMap!559)

(declare-fun call!1371 () ListLongMap!559)

(assert (=> bm!1366 (= call!1370 call!1371)))

(declare-fun b!21478 () Bool)

(declare-fun lt!6762 () ListLongMap!559)

(declare-fun apply!28 (ListLongMap!559 (_ BitVec 64)) V!1157)

(assert (=> b!21478 (= e!13999 (= (apply!28 lt!6762 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun b!21479 () Bool)

(declare-fun e!14003 () Bool)

(declare-fun e!14004 () Bool)

(assert (=> b!21479 (= e!14003 e!14004)))

(declare-fun c!2482 () Bool)

(assert (=> b!21479 (= c!2482 (not (= (bvand (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1367 () Bool)

(declare-fun call!1369 () ListLongMap!559)

(declare-fun call!1373 () ListLongMap!559)

(assert (=> bm!1367 (= call!1369 call!1373)))

(declare-fun b!21480 () Bool)

(declare-fun e!14006 () ListLongMap!559)

(assert (=> b!21480 (= e!14006 call!1369)))

(declare-fun d!3737 () Bool)

(assert (=> d!3737 e!14003))

(declare-fun res!13810 () Bool)

(assert (=> d!3737 (=> (not res!13810) (not e!14003))))

(assert (=> d!3737 (= res!13810 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938))))) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938))))))))))

(declare-fun lt!6763 () ListLongMap!559)

(assert (=> d!3737 (= lt!6762 lt!6763)))

(declare-datatypes ((Unit!452 0))(
  ( (Unit!453) )
))
(declare-fun lt!6765 () Unit!452)

(declare-fun e!14000 () Unit!452)

(assert (=> d!3737 (= lt!6765 e!14000)))

(declare-fun c!2477 () Bool)

(declare-fun e!14010 () Bool)

(assert (=> d!3737 (= c!2477 e!14010)))

(declare-fun res!13815 () Bool)

(assert (=> d!3737 (=> (not res!13815) (not e!14010))))

(assert (=> d!3737 (= res!13815 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938))))))))

(declare-fun e!14002 () ListLongMap!559)

(assert (=> d!3737 (= lt!6763 e!14002)))

(declare-fun c!2478 () Bool)

(assert (=> d!3737 (= c!2478 (and (not (= (bvand (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3737 (validMask!0 (mask!4692 (v!1573 (underlying!104 thiss!938))))))

(assert (=> d!3737 (= (getCurrentListMap!126 (_keys!3140 (v!1573 (underlying!104 thiss!938))) (_values!1708 (v!1573 (underlying!104 thiss!938))) (mask!4692 (v!1573 (underlying!104 thiss!938))) (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938)))) lt!6762)))

(declare-fun bm!1368 () Bool)

(declare-fun call!1374 () Bool)

(declare-fun contains!225 (ListLongMap!559 (_ BitVec 64)) Bool)

(assert (=> bm!1368 (= call!1374 (contains!225 lt!6762 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21481 () Bool)

(declare-fun +!42 (ListLongMap!559 tuple2!900) ListLongMap!559)

(assert (=> b!21481 (= e!14002 (+!42 call!1373 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))

(declare-fun call!1375 () ListLongMap!559)

(declare-fun c!2481 () Bool)

(declare-fun bm!1369 () Bool)

(assert (=> bm!1369 (= call!1373 (+!42 (ite c!2478 call!1375 (ite c!2481 call!1371 call!1370)) (ite (or c!2478 c!2481) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(declare-fun b!21482 () Bool)

(declare-fun res!13814 () Bool)

(assert (=> b!21482 (=> (not res!13814) (not e!14003))))

(declare-fun e!14005 () Bool)

(assert (=> b!21482 (= res!13814 e!14005)))

(declare-fun res!13809 () Bool)

(assert (=> b!21482 (=> res!13809 e!14005)))

(declare-fun e!14008 () Bool)

(assert (=> b!21482 (= res!13809 (not e!14008))))

(declare-fun res!13808 () Bool)

(assert (=> b!21482 (=> (not res!13808) (not e!14008))))

(assert (=> b!21482 (= res!13808 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938))))))))

(declare-fun b!21483 () Bool)

(declare-fun e!13998 () Bool)

(assert (=> b!21483 (= e!13998 (= (apply!28 lt!6762 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun b!21484 () Bool)

(declare-fun e!14007 () Bool)

(declare-fun get!377 (ValueCell!300 V!1157) V!1157)

(declare-fun dynLambda!141 (Int (_ BitVec 64)) V!1157)

(assert (=> b!21484 (= e!14007 (= (apply!28 lt!6762 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))) (get!377 (select (arr!583 (_values!1708 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!141 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21484 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (size!676 (_values!1708 (v!1573 (underlying!104 thiss!938))))))))

(assert (=> b!21484 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938))))))))

(declare-fun b!21485 () Bool)

(declare-fun e!14001 () ListLongMap!559)

(assert (=> b!21485 (= e!14001 call!1369)))

(declare-fun b!21486 () Bool)

(declare-fun res!13811 () Bool)

(assert (=> b!21486 (=> (not res!13811) (not e!14003))))

(assert (=> b!21486 (= res!13811 e!14009)))

(declare-fun c!2480 () Bool)

(assert (=> b!21486 (= c!2480 (not (= (bvand (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!21487 () Bool)

(assert (=> b!21487 (= e!14001 call!1370)))

(declare-fun b!21488 () Bool)

(assert (=> b!21488 (= e!14004 e!13998)))

(declare-fun res!13816 () Bool)

(assert (=> b!21488 (= res!13816 call!1374)))

(assert (=> b!21488 (=> (not res!13816) (not e!13998))))

(declare-fun b!21489 () Bool)

(declare-fun c!2479 () Bool)

(assert (=> b!21489 (= c!2479 (and (not (= (bvand (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21489 (= e!14006 e!14001)))

(declare-fun b!21490 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!21490 (= e!14008 (validKeyInArray!0 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))))))

(declare-fun bm!1370 () Bool)

(assert (=> bm!1370 (= call!1371 call!1375)))

(declare-fun b!21491 () Bool)

(assert (=> b!21491 (= e!14004 (not call!1374))))

(declare-fun b!21492 () Bool)

(assert (=> b!21492 (= e!14010 (validKeyInArray!0 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))))))

(declare-fun b!21493 () Bool)

(declare-fun lt!6761 () Unit!452)

(assert (=> b!21493 (= e!14000 lt!6761)))

(declare-fun lt!6759 () ListLongMap!559)

(declare-fun getCurrentListMapNoExtraKeys!13 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 (_ BitVec 32) Int) ListLongMap!559)

(assert (=> b!21493 (= lt!6759 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (v!1573 (underlying!104 thiss!938))) (_values!1708 (v!1573 (underlying!104 thiss!938))) (mask!4692 (v!1573 (underlying!104 thiss!938))) (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun lt!6752 () (_ BitVec 64))

(assert (=> b!21493 (= lt!6752 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6749 () (_ BitVec 64))

(assert (=> b!21493 (= lt!6749 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))))))

(declare-fun lt!6751 () Unit!452)

(declare-fun addStillContains!13 (ListLongMap!559 (_ BitVec 64) V!1157 (_ BitVec 64)) Unit!452)

(assert (=> b!21493 (= lt!6751 (addStillContains!13 lt!6759 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) lt!6749))))

(assert (=> b!21493 (contains!225 (+!42 lt!6759 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!6749)))

(declare-fun lt!6756 () Unit!452)

(assert (=> b!21493 (= lt!6756 lt!6751)))

(declare-fun lt!6760 () ListLongMap!559)

(assert (=> b!21493 (= lt!6760 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (v!1573 (underlying!104 thiss!938))) (_values!1708 (v!1573 (underlying!104 thiss!938))) (mask!4692 (v!1573 (underlying!104 thiss!938))) (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun lt!6753 () (_ BitVec 64))

(assert (=> b!21493 (= lt!6753 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6747 () (_ BitVec 64))

(assert (=> b!21493 (= lt!6747 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))))))

(declare-fun lt!6768 () Unit!452)

(declare-fun addApplyDifferent!13 (ListLongMap!559 (_ BitVec 64) V!1157 (_ BitVec 64)) Unit!452)

(assert (=> b!21493 (= lt!6768 (addApplyDifferent!13 lt!6760 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938))) lt!6747))))

(assert (=> b!21493 (= (apply!28 (+!42 lt!6760 (tuple2!901 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!6747) (apply!28 lt!6760 lt!6747))))

(declare-fun lt!6757 () Unit!452)

(assert (=> b!21493 (= lt!6757 lt!6768)))

(declare-fun lt!6767 () ListLongMap!559)

(assert (=> b!21493 (= lt!6767 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (v!1573 (underlying!104 thiss!938))) (_values!1708 (v!1573 (underlying!104 thiss!938))) (mask!4692 (v!1573 (underlying!104 thiss!938))) (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun lt!6766 () (_ BitVec 64))

(assert (=> b!21493 (= lt!6766 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6758 () (_ BitVec 64))

(assert (=> b!21493 (= lt!6758 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))))))

(declare-fun lt!6750 () Unit!452)

(assert (=> b!21493 (= lt!6750 (addApplyDifferent!13 lt!6767 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) lt!6758))))

(assert (=> b!21493 (= (apply!28 (+!42 lt!6767 (tuple2!901 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!6758) (apply!28 lt!6767 lt!6758))))

(declare-fun lt!6754 () Unit!452)

(assert (=> b!21493 (= lt!6754 lt!6750)))

(declare-fun lt!6764 () ListLongMap!559)

(assert (=> b!21493 (= lt!6764 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (v!1573 (underlying!104 thiss!938))) (_values!1708 (v!1573 (underlying!104 thiss!938))) (mask!4692 (v!1573 (underlying!104 thiss!938))) (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun lt!6755 () (_ BitVec 64))

(assert (=> b!21493 (= lt!6755 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6748 () (_ BitVec 64))

(assert (=> b!21493 (= lt!6748 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))))))

(assert (=> b!21493 (= lt!6761 (addApplyDifferent!13 lt!6764 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938))) lt!6748))))

(assert (=> b!21493 (= (apply!28 (+!42 lt!6764 (tuple2!901 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!6748) (apply!28 lt!6764 lt!6748))))

(declare-fun b!21494 () Bool)

(declare-fun Unit!454 () Unit!452)

(assert (=> b!21494 (= e!14000 Unit!454)))

(declare-fun bm!1371 () Bool)

(assert (=> bm!1371 (= call!1375 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (v!1573 (underlying!104 thiss!938))) (_values!1708 (v!1573 (underlying!104 thiss!938))) (mask!4692 (v!1573 (underlying!104 thiss!938))) (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun b!21495 () Bool)

(assert (=> b!21495 (= e!14009 (not call!1372))))

(declare-fun b!21496 () Bool)

(assert (=> b!21496 (= e!14005 e!14007)))

(declare-fun res!13813 () Bool)

(assert (=> b!21496 (=> (not res!13813) (not e!14007))))

(assert (=> b!21496 (= res!13813 (contains!225 lt!6762 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))))))

(assert (=> b!21496 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938))))))))

(declare-fun b!21497 () Bool)

(assert (=> b!21497 (= e!14002 e!14006)))

(assert (=> b!21497 (= c!2481 (and (not (= (bvand (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1372 () Bool)

(assert (=> bm!1372 (= call!1372 (contains!225 lt!6762 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3737 c!2478) b!21481))

(assert (= (and d!3737 (not c!2478)) b!21497))

(assert (= (and b!21497 c!2481) b!21480))

(assert (= (and b!21497 (not c!2481)) b!21489))

(assert (= (and b!21489 c!2479) b!21485))

(assert (= (and b!21489 (not c!2479)) b!21487))

(assert (= (or b!21485 b!21487) bm!1366))

(assert (= (or b!21480 bm!1366) bm!1370))

(assert (= (or b!21480 b!21485) bm!1367))

(assert (= (or b!21481 bm!1370) bm!1371))

(assert (= (or b!21481 bm!1367) bm!1369))

(assert (= (and d!3737 res!13815) b!21492))

(assert (= (and d!3737 c!2477) b!21493))

(assert (= (and d!3737 (not c!2477)) b!21494))

(assert (= (and d!3737 res!13810) b!21482))

(assert (= (and b!21482 res!13808) b!21490))

(assert (= (and b!21482 (not res!13809)) b!21496))

(assert (= (and b!21496 res!13813) b!21484))

(assert (= (and b!21482 res!13814) b!21486))

(assert (= (and b!21486 c!2480) b!21477))

(assert (= (and b!21486 (not c!2480)) b!21495))

(assert (= (and b!21477 res!13812) b!21478))

(assert (= (or b!21477 b!21495) bm!1372))

(assert (= (and b!21486 res!13811) b!21479))

(assert (= (and b!21479 c!2482) b!21488))

(assert (= (and b!21479 (not c!2482)) b!21491))

(assert (= (and b!21488 res!13816) b!21483))

(assert (= (or b!21488 b!21491) bm!1368))

(declare-fun b_lambda!1521 () Bool)

(assert (=> (not b_lambda!1521) (not b!21484)))

(declare-fun t!3221 () Bool)

(declare-fun tb!645 () Bool)

(assert (=> (and b!21366 (= (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938)))) t!3221) tb!645))

(declare-fun result!1069 () Bool)

(assert (=> tb!645 (= result!1069 tp_is_empty!999)))

(assert (=> b!21484 t!3221))

(declare-fun b_and!1427 () Bool)

(assert (= b_and!1423 (and (=> t!3221 result!1069) b_and!1427)))

(declare-fun m!14963 () Bool)

(assert (=> b!21490 m!14963))

(assert (=> b!21490 m!14963))

(declare-fun m!14965 () Bool)

(assert (=> b!21490 m!14965))

(declare-fun m!14967 () Bool)

(assert (=> bm!1371 m!14967))

(declare-fun m!14969 () Bool)

(assert (=> b!21493 m!14969))

(assert (=> b!21493 m!14963))

(declare-fun m!14971 () Bool)

(assert (=> b!21493 m!14971))

(declare-fun m!14973 () Bool)

(assert (=> b!21493 m!14973))

(declare-fun m!14975 () Bool)

(assert (=> b!21493 m!14975))

(declare-fun m!14977 () Bool)

(assert (=> b!21493 m!14977))

(assert (=> b!21493 m!14971))

(declare-fun m!14979 () Bool)

(assert (=> b!21493 m!14979))

(declare-fun m!14981 () Bool)

(assert (=> b!21493 m!14981))

(declare-fun m!14983 () Bool)

(assert (=> b!21493 m!14983))

(assert (=> b!21493 m!14967))

(declare-fun m!14985 () Bool)

(assert (=> b!21493 m!14985))

(declare-fun m!14987 () Bool)

(assert (=> b!21493 m!14987))

(declare-fun m!14989 () Bool)

(assert (=> b!21493 m!14989))

(declare-fun m!14991 () Bool)

(assert (=> b!21493 m!14991))

(assert (=> b!21493 m!14991))

(declare-fun m!14993 () Bool)

(assert (=> b!21493 m!14993))

(assert (=> b!21493 m!14985))

(declare-fun m!14995 () Bool)

(assert (=> b!21493 m!14995))

(assert (=> b!21493 m!14977))

(declare-fun m!14997 () Bool)

(assert (=> b!21493 m!14997))

(assert (=> b!21496 m!14963))

(assert (=> b!21496 m!14963))

(declare-fun m!14999 () Bool)

(assert (=> b!21496 m!14999))

(declare-fun m!15001 () Bool)

(assert (=> bm!1369 m!15001))

(declare-fun m!15003 () Bool)

(assert (=> b!21481 m!15003))

(assert (=> b!21492 m!14963))

(assert (=> b!21492 m!14963))

(assert (=> b!21492 m!14965))

(declare-fun m!15005 () Bool)

(assert (=> bm!1368 m!15005))

(declare-fun m!15007 () Bool)

(assert (=> b!21483 m!15007))

(assert (=> b!21484 m!14963))

(assert (=> b!21484 m!14963))

(declare-fun m!15009 () Bool)

(assert (=> b!21484 m!15009))

(declare-fun m!15011 () Bool)

(assert (=> b!21484 m!15011))

(declare-fun m!15013 () Bool)

(assert (=> b!21484 m!15013))

(declare-fun m!15015 () Bool)

(assert (=> b!21484 m!15015))

(assert (=> b!21484 m!15013))

(assert (=> b!21484 m!15011))

(declare-fun m!15017 () Bool)

(assert (=> b!21478 m!15017))

(declare-fun m!15019 () Bool)

(assert (=> bm!1372 m!15019))

(assert (=> d!3737 m!14929))

(assert (=> b!21368 d!3737))

(declare-fun d!3739 () Bool)

(assert (=> d!3739 (= (map!395 (v!1573 (_2!452 lt!6681))) (getCurrentListMap!126 (_keys!3140 (v!1573 (_2!452 lt!6681))) (_values!1708 (v!1573 (_2!452 lt!6681))) (mask!4692 (v!1573 (_2!452 lt!6681))) (extraKeys!1622 (v!1573 (_2!452 lt!6681))) (zeroValue!1646 (v!1573 (_2!452 lt!6681))) (minValue!1646 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000000 (defaultEntry!1719 (v!1573 (_2!452 lt!6681)))))))

(declare-fun bs!909 () Bool)

(assert (= bs!909 d!3739))

(declare-fun m!15021 () Bool)

(assert (=> bs!909 m!15021))

(assert (=> b!21368 d!3739))

(declare-fun b!21513 () Bool)

(declare-fun e!14017 () Bool)

(declare-fun lt!6825 () LongMapFixedSize!186)

(assert (=> b!21513 (= e!14017 (= (map!395 lt!6825) (ListLongMap!560 Nil!558)))))

(declare-fun b!21514 () Bool)

(declare-fun e!14018 () Bool)

(declare-fun lt!6837 () tuple2!900)

(declare-fun lt!6823 () (_ BitVec 32))

(assert (=> b!21514 (= e!14018 (ite (= (_1!453 lt!6837) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!6823 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!6823 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!21515 () Bool)

(declare-fun lt!6833 () array!1231)

(declare-fun arrayContainsKey!0 (array!1231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!21515 (= e!14018 (arrayContainsKey!0 lt!6833 (_1!453 lt!6837) #b00000000000000000000000000000000))))

(declare-fun b!21516 () Bool)

(declare-fun res!13821 () Bool)

(assert (=> b!21516 (=> (not res!13821) (not e!14017))))

(assert (=> b!21516 (= res!13821 (= (mask!4692 lt!6825) (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938))))))))

(declare-fun b!21517 () Bool)

(declare-fun e!14019 () Unit!452)

(declare-fun Unit!455 () Unit!452)

(assert (=> b!21517 (= e!14019 Unit!455)))

(declare-fun lt!6821 () LongMapFixedSize!186)

(declare-fun head!827 (List!561) tuple2!900)

(assert (=> b!21517 (= lt!6837 (head!827 (toList!295 (map!395 lt!6821))))))

(assert (=> b!21517 (= lt!6833 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!21517 (= lt!6823 #b00000000000000000000000000000000)))

(declare-fun lt!6817 () Unit!452)

(declare-fun lemmaKeyInListMapIsInArray!88 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 (_ BitVec 64) Int) Unit!452)

(assert (=> b!21517 (= lt!6817 (lemmaKeyInListMapIsInArray!88 lt!6833 (array!1230 ((as const (Array (_ BitVec 32) ValueCell!300)) EmptyCell!300) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) lt!6823 (dynLambda!141 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!141 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!453 lt!6837) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun c!2487 () Bool)

(assert (=> b!21517 (= c!2487 (and (not (= (_1!453 lt!6837) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!453 lt!6837) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21517 e!14018))

(declare-fun lt!6827 () Unit!452)

(assert (=> b!21517 (= lt!6827 lt!6817)))

(declare-fun lt!6826 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1231 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!21517 (= lt!6826 (arrayScanForKey!0 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (_1!453 lt!6837) #b00000000000000000000000000000000))))

(assert (=> b!21517 false))

(declare-fun b!21512 () Bool)

(declare-fun Unit!456 () Unit!452)

(assert (=> b!21512 (= e!14019 Unit!456)))

(declare-fun d!3741 () Bool)

(assert (=> d!3741 e!14017))

(declare-fun res!13822 () Bool)

(assert (=> d!3741 (=> (not res!13822) (not e!14017))))

(assert (=> d!3741 (= res!13822 (valid!93 lt!6825))))

(assert (=> d!3741 (= lt!6825 lt!6821)))

(declare-fun lt!6815 () Unit!452)

(assert (=> d!3741 (= lt!6815 e!14019)))

(declare-fun c!2488 () Bool)

(assert (=> d!3741 (= c!2488 (not (= (map!395 lt!6821) (ListLongMap!560 Nil!558))))))

(declare-fun lt!6836 () Unit!452)

(declare-fun lt!6835 () Unit!452)

(assert (=> d!3741 (= lt!6836 lt!6835)))

(declare-fun lt!6824 () array!1231)

(declare-fun lt!6829 () (_ BitVec 32))

(declare-datatypes ((List!563 0))(
  ( (Nil!560) (Cons!559 (h!1125 (_ BitVec 64)) (t!3222 List!563)) )
))
(declare-fun lt!6831 () List!563)

(declare-fun arrayNoDuplicates!0 (array!1231 (_ BitVec 32) List!563) Bool)

(assert (=> d!3741 (arrayNoDuplicates!0 lt!6824 lt!6829 lt!6831)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1231 (_ BitVec 32) (_ BitVec 32) List!563) Unit!452)

(assert (=> d!3741 (= lt!6835 (lemmaArrayNoDuplicatesInAll0Array!0 lt!6824 lt!6829 (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001) lt!6831))))

(assert (=> d!3741 (= lt!6831 Nil!560)))

(assert (=> d!3741 (= lt!6829 #b00000000000000000000000000000000)))

(assert (=> d!3741 (= lt!6824 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6830 () Unit!452)

(declare-fun lt!6819 () Unit!452)

(assert (=> d!3741 (= lt!6830 lt!6819)))

(declare-fun lt!6822 () (_ BitVec 32))

(declare-fun lt!6820 () array!1231)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1231 (_ BitVec 32)) Bool)

(assert (=> d!3741 (arrayForallSeekEntryOrOpenFound!0 lt!6822 lt!6820 (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1231 (_ BitVec 32) (_ BitVec 32)) Unit!452)

(assert (=> d!3741 (= lt!6819 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!6820 (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) lt!6822))))

(assert (=> d!3741 (= lt!6822 #b00000000000000000000000000000000)))

(assert (=> d!3741 (= lt!6820 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6832 () Unit!452)

(declare-fun lt!6816 () Unit!452)

(assert (=> d!3741 (= lt!6832 lt!6816)))

(declare-fun lt!6818 () array!1231)

(declare-fun lt!6828 () (_ BitVec 32))

(declare-fun lt!6834 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1231 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3741 (= (arrayCountValidKeys!0 lt!6818 lt!6828 lt!6834) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1231 (_ BitVec 32) (_ BitVec 32)) Unit!452)

(assert (=> d!3741 (= lt!6816 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!6818 lt!6828 lt!6834))))

(assert (=> d!3741 (= lt!6834 (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3741 (= lt!6828 #b00000000000000000000000000000000)))

(assert (=> d!3741 (= lt!6818 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3741 (= lt!6821 (LongMapFixedSize!187 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!141 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!141 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (array!1230 ((as const (Array (_ BitVec 32) ValueCell!300)) EmptyCell!300) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3741 (validMask!0 (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))))))

(assert (=> d!3741 (= (getNewLongMapFixedSize!26 (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938)))) lt!6825)))

(assert (= (and d!3741 c!2488) b!21517))

(assert (= (and d!3741 (not c!2488)) b!21512))

(assert (= (and b!21517 c!2487) b!21515))

(assert (= (and b!21517 (not c!2487)) b!21514))

(assert (= (and d!3741 res!13822) b!21516))

(assert (= (and b!21516 res!13821) b!21513))

(declare-fun b_lambda!1523 () Bool)

(assert (=> (not b_lambda!1523) (not b!21517)))

(assert (=> b!21517 t!3221))

(declare-fun b_and!1429 () Bool)

(assert (= b_and!1427 (and (=> t!3221 result!1069) b_and!1429)))

(declare-fun b_lambda!1525 () Bool)

(assert (=> (not b_lambda!1525) (not d!3741)))

(assert (=> d!3741 t!3221))

(declare-fun b_and!1431 () Bool)

(assert (= b_and!1429 (and (=> t!3221 result!1069) b_and!1431)))

(declare-fun m!15023 () Bool)

(assert (=> b!21513 m!15023))

(declare-fun m!15025 () Bool)

(assert (=> b!21515 m!15025))

(declare-fun m!15027 () Bool)

(assert (=> b!21517 m!15027))

(declare-fun m!15029 () Bool)

(assert (=> b!21517 m!15029))

(assert (=> b!21517 m!14919))

(assert (=> b!21517 m!15013))

(assert (=> b!21517 m!15013))

(declare-fun m!15031 () Bool)

(assert (=> b!21517 m!15031))

(assert (=> b!21517 m!15013))

(declare-fun m!15033 () Bool)

(assert (=> b!21517 m!15033))

(declare-fun m!15035 () Bool)

(assert (=> d!3741 m!15035))

(assert (=> d!3741 m!14919))

(declare-fun m!15037 () Bool)

(assert (=> d!3741 m!15037))

(declare-fun m!15039 () Bool)

(assert (=> d!3741 m!15039))

(assert (=> d!3741 m!14919))

(declare-fun m!15041 () Bool)

(assert (=> d!3741 m!15041))

(assert (=> d!3741 m!14919))

(declare-fun m!15043 () Bool)

(assert (=> d!3741 m!15043))

(assert (=> d!3741 m!15033))

(declare-fun m!15045 () Bool)

(assert (=> d!3741 m!15045))

(declare-fun m!15047 () Bool)

(assert (=> d!3741 m!15047))

(assert (=> d!3741 m!15013))

(declare-fun m!15049 () Bool)

(assert (=> d!3741 m!15049))

(assert (=> b!21367 d!3741))

(declare-fun d!3743 () Bool)

(declare-fun e!14024 () Bool)

(assert (=> d!3743 e!14024))

(declare-fun res!13825 () Bool)

(assert (=> d!3743 (=> (not res!13825) (not e!14024))))

(declare-fun lt!6842 () (_ BitVec 32))

(assert (=> d!3743 (= res!13825 (validMask!0 lt!6842))))

(declare-datatypes ((tuple2!908 0))(
  ( (tuple2!909 (_1!457 Unit!452) (_2!457 (_ BitVec 32))) )
))
(declare-fun e!14025 () tuple2!908)

(assert (=> d!3743 (= lt!6842 (_2!457 e!14025))))

(declare-fun c!2491 () Bool)

(declare-fun lt!6843 () tuple2!908)

(assert (=> d!3743 (= c!2491 (and (bvsgt (_2!457 lt!6843) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!134 (v!1573 (underlying!104 thiss!938)))) (_2!457 lt!6843)) (bvsge (bvadd (bvand (bvashr (_2!457 lt!6843) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!134 (v!1573 (underlying!104 thiss!938))))))))

(declare-fun Unit!457 () Unit!452)

(declare-fun Unit!458 () Unit!452)

(assert (=> d!3743 (= lt!6843 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!134 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))))) (mask!4692 (v!1573 (underlying!104 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!134 (v!1573 (underlying!104 thiss!938)))) (mask!4692 (v!1573 (underlying!104 thiss!938))))) (tuple2!909 Unit!457 (bvand (bvadd (bvshl (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!909 Unit!458 (mask!4692 (v!1573 (underlying!104 thiss!938))))))))

(assert (=> d!3743 (validMask!0 (mask!4692 (v!1573 (underlying!104 thiss!938))))))

(assert (=> d!3743 (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) lt!6842)))

(declare-fun b!21524 () Bool)

(declare-fun computeNewMaskWhile!11 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!908)

(assert (=> b!21524 (= e!14025 (computeNewMaskWhile!11 (_size!134 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (mask!4692 (v!1573 (underlying!104 thiss!938))) (_2!457 lt!6843)))))

(declare-fun b!21525 () Bool)

(declare-fun Unit!459 () Unit!452)

(assert (=> b!21525 (= e!14025 (tuple2!909 Unit!459 (_2!457 lt!6843)))))

(declare-fun b!21526 () Bool)

(assert (=> b!21526 (= e!14024 (bvsle (_size!134 (v!1573 (underlying!104 thiss!938))) (bvadd lt!6842 #b00000000000000000000000000000001)))))

(assert (= (and d!3743 c!2491) b!21524))

(assert (= (and d!3743 (not c!2491)) b!21525))

(assert (= (and d!3743 res!13825) b!21526))

(declare-fun m!15051 () Bool)

(assert (=> d!3743 m!15051))

(assert (=> d!3743 m!14929))

(declare-fun m!15053 () Bool)

(assert (=> b!21524 m!15053))

(assert (=> b!21367 d!3743))

(declare-fun d!3745 () Bool)

(assert (=> d!3745 (= (valid!92 thiss!938) (valid!93 (v!1573 (underlying!104 thiss!938))))))

(declare-fun bs!910 () Bool)

(assert (= bs!910 d!3745))

(declare-fun m!15055 () Bool)

(assert (=> bs!910 m!15055))

(assert (=> start!3364 d!3745))

(declare-fun d!3747 () Bool)

(assert (=> d!3747 (= (array_inv!393 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvsge (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!21366 d!3747))

(declare-fun d!3749 () Bool)

(assert (=> d!3749 (= (array_inv!394 (_values!1708 (v!1573 (underlying!104 thiss!938)))) (bvsge (size!676 (_values!1708 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!21366 d!3749))

(declare-fun d!3751 () Bool)

(declare-fun res!13832 () Bool)

(declare-fun e!14028 () Bool)

(assert (=> d!3751 (=> (not res!13832) (not e!14028))))

(declare-fun simpleValid!19 (LongMapFixedSize!186) Bool)

(assert (=> d!3751 (= res!13832 (simpleValid!19 (v!1573 (_2!452 lt!6681))))))

(assert (=> d!3751 (= (valid!93 (v!1573 (_2!452 lt!6681))) e!14028)))

(declare-fun b!21533 () Bool)

(declare-fun res!13833 () Bool)

(assert (=> b!21533 (=> (not res!13833) (not e!14028))))

(assert (=> b!21533 (= res!13833 (= (arrayCountValidKeys!0 (_keys!3140 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000000 (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681))))) (_size!134 (v!1573 (_2!452 lt!6681)))))))

(declare-fun b!21534 () Bool)

(declare-fun res!13834 () Bool)

(assert (=> b!21534 (=> (not res!13834) (not e!14028))))

(assert (=> b!21534 (= res!13834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3140 (v!1573 (_2!452 lt!6681))) (mask!4692 (v!1573 (_2!452 lt!6681)))))))

(declare-fun b!21535 () Bool)

(assert (=> b!21535 (= e!14028 (arrayNoDuplicates!0 (_keys!3140 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000000 Nil!560))))

(assert (= (and d!3751 res!13832) b!21533))

(assert (= (and b!21533 res!13833) b!21534))

(assert (= (and b!21534 res!13834) b!21535))

(declare-fun m!15057 () Bool)

(assert (=> d!3751 m!15057))

(declare-fun m!15059 () Bool)

(assert (=> b!21533 m!15059))

(declare-fun m!15061 () Bool)

(assert (=> b!21534 m!15061))

(declare-fun m!15063 () Bool)

(assert (=> b!21535 m!15063))

(assert (=> b!21379 d!3751))

(declare-fun bm!1421 () Bool)

(declare-fun call!1428 () ListLongMap!559)

(declare-fun call!1434 () ListLongMap!559)

(assert (=> bm!1421 (= call!1428 call!1434)))

(declare-fun b!21616 () Bool)

(declare-fun e!14086 () tuple2!896)

(declare-fun lt!6922 () tuple2!896)

(assert (=> b!21616 (= e!14086 (tuple2!897 (_1!451 lt!6922) (_2!451 lt!6922)))))

(declare-fun call!1439 () tuple2!896)

(assert (=> b!21616 (= lt!6922 call!1439)))

(declare-fun b!21617 () Bool)

(declare-fun res!13872 () Bool)

(declare-fun call!1426 () Bool)

(assert (=> b!21617 (= res!13872 call!1426)))

(declare-fun e!14082 () Bool)

(assert (=> b!21617 (=> (not res!13872) (not e!14082))))

(declare-fun b!21618 () Bool)

(declare-fun e!14083 () Bool)

(declare-fun e!14080 () Bool)

(assert (=> b!21618 (= e!14083 e!14080)))

(declare-fun res!13863 () Bool)

(declare-fun call!1424 () Bool)

(assert (=> b!21618 (= res!13863 call!1424)))

(assert (=> b!21618 (=> (not res!13863) (not e!14080))))

(declare-fun bm!1422 () Bool)

(declare-datatypes ((SeekEntryResult!51 0))(
  ( (MissingZero!51 (index!2324 (_ BitVec 32))) (Found!51 (index!2325 (_ BitVec 32))) (Intermediate!51 (undefined!863 Bool) (index!2326 (_ BitVec 32)) (x!5190 (_ BitVec 32))) (Undefined!51) (MissingVacant!51 (index!2327 (_ BitVec 32))) )
))
(declare-fun call!1432 () SeekEntryResult!51)

(declare-fun call!1435 () SeekEntryResult!51)

(assert (=> bm!1422 (= call!1432 call!1435)))

(declare-fun b!21619 () Bool)

(declare-fun res!13868 () Bool)

(declare-fun call!1431 () Bool)

(assert (=> b!21619 (= res!13868 call!1431)))

(declare-fun e!14073 () Bool)

(assert (=> b!21619 (=> (not res!13868) (not e!14073))))

(declare-fun bm!1423 () Bool)

(declare-fun call!1438 () ListLongMap!559)

(declare-fun lt!6915 () tuple2!896)

(assert (=> bm!1423 (= call!1438 (map!395 (_2!451 lt!6915)))))

(declare-fun bm!1424 () Bool)

(declare-fun call!1443 () Unit!452)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 (_ BitVec 64) Int) Unit!452)

(assert (=> bm!1424 (= call!1443 (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!21620 () Bool)

(declare-fun e!14076 () tuple2!896)

(declare-fun e!14089 () tuple2!896)

(assert (=> b!21620 (= e!14076 e!14089)))

(declare-fun lt!6918 () SeekEntryResult!51)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1231 (_ BitVec 32)) SeekEntryResult!51)

(assert (=> b!21620 (= lt!6918 (seekEntryOrOpen!0 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun c!2521 () Bool)

(assert (=> b!21620 (= c!2521 ((_ is Undefined!51) lt!6918))))

(declare-fun lt!6904 () SeekEntryResult!51)

(declare-fun b!21621 () Bool)

(declare-fun res!13865 () Bool)

(assert (=> b!21621 (= res!13865 (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2327 lt!6904)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21621 (=> (not res!13865) (not e!14080))))

(declare-fun b!21622 () Bool)

(declare-fun e!14072 () Unit!452)

(declare-fun Unit!460 () Unit!452)

(assert (=> b!21622 (= e!14072 Unit!460)))

(declare-fun lt!6909 () Unit!452)

(declare-fun call!1440 () Unit!452)

(assert (=> b!21622 (= lt!6909 call!1440)))

(assert (=> b!21622 (= lt!6904 call!1432)))

(declare-fun c!2530 () Bool)

(assert (=> b!21622 (= c!2530 ((_ is MissingZero!51) lt!6904))))

(declare-fun e!14091 () Bool)

(assert (=> b!21622 e!14091))

(declare-fun lt!6911 () Unit!452)

(assert (=> b!21622 (= lt!6911 lt!6909)))

(assert (=> b!21622 false))

(declare-fun b!21623 () Bool)

(declare-fun e!14085 () Bool)

(declare-fun e!14088 () Bool)

(assert (=> b!21623 (= e!14085 e!14088)))

(declare-fun res!13874 () Bool)

(assert (=> b!21623 (= res!13874 (contains!225 call!1438 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21623 (=> (not res!13874) (not e!14088))))

(declare-fun call!1442 () ListLongMap!559)

(declare-fun b!21624 () Bool)

(assert (=> b!21624 (= e!14088 (= call!1438 (+!42 call!1442 (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))))

(declare-fun bm!1425 () Bool)

(assert (=> bm!1425 (= call!1442 (map!395 (ite c!2454 (_2!451 lt!6679) lt!6678)))))

(declare-fun b!21625 () Bool)

(declare-fun lt!6899 () Unit!452)

(declare-fun lt!6910 () Unit!452)

(assert (=> b!21625 (= lt!6899 lt!6910)))

(declare-fun call!1446 () ListLongMap!559)

(declare-fun call!1433 () ListLongMap!559)

(assert (=> b!21625 (= call!1446 call!1433)))

(declare-fun lt!6905 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!7 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 V!1157 Int) Unit!452)

(assert (=> b!21625 (= lt!6910 (lemmaChangeZeroKeyThenAddPairToListMap!7 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6905 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(assert (=> b!21625 (= lt!6905 (bvor (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000001))))

(declare-fun e!14071 () tuple2!896)

(assert (=> b!21625 (= e!14071 (tuple2!897 true (LongMapFixedSize!187 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (bvor (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000001) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_size!134 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_vacant!134 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun bm!1426 () Bool)

(assert (=> bm!1426 (= call!1435 (seekEntryOrOpen!0 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!21626 () Bool)

(declare-fun res!13864 () Bool)

(declare-fun e!14078 () Bool)

(assert (=> b!21626 (=> (not res!13864) (not e!14078))))

(declare-fun call!1447 () Bool)

(assert (=> b!21626 (= res!13864 call!1447)))

(declare-fun e!14090 () Bool)

(assert (=> b!21626 (= e!14090 e!14078)))

(declare-fun bm!1427 () Bool)

(assert (=> bm!1427 (= call!1447 call!1426)))

(declare-fun b!21627 () Bool)

(declare-fun lt!6898 () Unit!452)

(declare-fun lt!6923 () Unit!452)

(assert (=> b!21627 (= lt!6898 lt!6923)))

(assert (=> b!21627 (= call!1446 call!1433)))

(declare-fun lt!6924 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!7 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 V!1157 Int) Unit!452)

(assert (=> b!21627 (= lt!6923 (lemmaChangeLongMinValueKeyThenAddPairToListMap!7 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6924 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(assert (=> b!21627 (= lt!6924 (bvor (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000010))))

(assert (=> b!21627 (= e!14071 (tuple2!897 true (LongMapFixedSize!187 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (bvor (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000010) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (_size!134 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_vacant!134 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun bm!1428 () Bool)

(declare-fun call!1425 () Bool)

(assert (=> bm!1428 (= call!1431 call!1425)))

(declare-fun b!21628 () Bool)

(declare-fun e!14075 () Bool)

(declare-fun call!1427 () Bool)

(assert (=> b!21628 (= e!14075 (not call!1427))))

(declare-fun bm!1429 () Bool)

(declare-fun call!1430 () ListLongMap!559)

(assert (=> bm!1429 (= call!1430 (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun bm!1430 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 (_ BitVec 64) Int) Unit!452)

(assert (=> bm!1430 (= call!1440 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!21629 () Bool)

(declare-fun c!2529 () Bool)

(assert (=> b!21629 (= c!2529 ((_ is MissingVacant!51) lt!6904))))

(assert (=> b!21629 (= e!14091 e!14083)))

(declare-fun b!21630 () Bool)

(declare-fun e!14084 () ListLongMap!559)

(assert (=> b!21630 (= e!14084 call!1428)))

(declare-fun bm!1431 () Bool)

(declare-fun call!1437 () Bool)

(assert (=> bm!1431 (= call!1427 call!1437)))

(declare-fun b!21631 () Bool)

(declare-fun e!14087 () Bool)

(declare-fun lt!6902 () SeekEntryResult!51)

(assert (=> b!21631 (= e!14087 ((_ is Undefined!51) lt!6902))))

(declare-fun b!21632 () Bool)

(declare-fun lt!6914 () Unit!452)

(declare-fun e!14081 () Unit!452)

(assert (=> b!21632 (= lt!6914 e!14081)))

(declare-fun c!2524 () Bool)

(declare-fun call!1445 () Bool)

(assert (=> b!21632 (= c!2524 call!1445)))

(assert (=> b!21632 (= e!14089 (tuple2!897 false (ite c!2454 (_2!451 lt!6679) lt!6678)))))

(declare-fun b!21633 () Bool)

(declare-fun res!13871 () Bool)

(declare-fun e!14077 () Bool)

(assert (=> b!21633 (=> (not res!13871) (not e!14077))))

(assert (=> b!21633 (= res!13871 (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2324 lt!6904)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1432 () Bool)

(assert (=> bm!1432 (= call!1424 call!1431)))

(declare-fun b!21634 () Bool)

(declare-fun res!13870 () Bool)

(assert (=> b!21634 (=> (not res!13870) (not e!14078))))

(assert (=> b!21634 (= res!13870 (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2324 lt!6902)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21635 () Bool)

(assert (=> b!21635 (= e!14087 e!14075)))

(declare-fun res!13876 () Bool)

(assert (=> b!21635 (= res!13876 call!1447)))

(assert (=> b!21635 (=> (not res!13876) (not e!14075))))

(declare-fun bm!1433 () Bool)

(assert (=> bm!1433 (= call!1426 call!1425)))

(declare-fun bm!1434 () Bool)

(declare-fun c!2520 () Bool)

(assert (=> bm!1434 (= c!2520 c!2521)))

(assert (=> bm!1434 (= call!1445 (contains!225 e!14084 (ite c!2521 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918)))))))

(declare-fun b!21637 () Bool)

(declare-fun e!14074 () tuple2!896)

(assert (=> b!21637 (= e!14086 e!14074)))

(declare-fun c!2523 () Bool)

(assert (=> b!21637 (= c!2523 ((_ is MissingZero!51) lt!6918))))

(declare-fun b!21638 () Bool)

(declare-fun lt!6913 () Unit!452)

(assert (=> b!21638 (= e!14081 lt!6913)))

(assert (=> b!21638 (= lt!6913 call!1440)))

(declare-fun call!1441 () SeekEntryResult!51)

(assert (=> b!21638 (= lt!6902 call!1441)))

(declare-fun c!2527 () Bool)

(assert (=> b!21638 (= c!2527 ((_ is MissingZero!51) lt!6902))))

(assert (=> b!21638 e!14090))

(declare-fun d!3753 () Bool)

(declare-fun e!14079 () Bool)

(assert (=> d!3753 e!14079))

(declare-fun res!13867 () Bool)

(assert (=> d!3753 (=> (not res!13867) (not e!14079))))

(assert (=> d!3753 (= res!13867 (valid!93 (_2!451 lt!6915)))))

(assert (=> d!3753 (= lt!6915 e!14076)))

(declare-fun c!2519 () Bool)

(assert (=> d!3753 (= c!2519 (= (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3753 (valid!93 (ite c!2454 (_2!451 lt!6679) lt!6678))))

(assert (=> d!3753 (= (update!23 (ite c!2454 (_2!451 lt!6679) lt!6678) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) lt!6915)))

(declare-fun b!21636 () Bool)

(assert (=> b!21636 (= e!14076 e!14071)))

(declare-fun c!2525 () Bool)

(assert (=> b!21636 (= c!2525 (= (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1435 () Bool)

(assert (=> bm!1435 (= call!1441 call!1435)))

(declare-fun b!21639 () Bool)

(declare-fun c!2526 () Bool)

(assert (=> b!21639 (= c!2526 ((_ is MissingVacant!51) lt!6902))))

(assert (=> b!21639 (= e!14090 e!14087)))

(declare-fun bm!1436 () Bool)

(assert (=> bm!1436 (= call!1433 call!1434)))

(declare-fun call!1444 () ListLongMap!559)

(declare-fun bm!1437 () Bool)

(declare-fun call!1436 () ListLongMap!559)

(assert (=> bm!1437 (= call!1436 (+!42 (ite c!2519 call!1444 call!1430) (ite c!2519 (ite c!2525 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))))

(declare-fun b!21640 () Bool)

(declare-fun res!13873 () Bool)

(assert (=> b!21640 (= res!13873 (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2327 lt!6902)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21640 (=> (not res!13873) (not e!14075))))

(declare-fun b!21641 () Bool)

(declare-fun Unit!461 () Unit!452)

(assert (=> b!21641 (= e!14081 Unit!461)))

(declare-fun lt!6916 () Unit!452)

(assert (=> b!21641 (= lt!6916 call!1443)))

(declare-fun lt!6901 () SeekEntryResult!51)

(assert (=> b!21641 (= lt!6901 call!1441)))

(declare-fun res!13875 () Bool)

(assert (=> b!21641 (= res!13875 ((_ is Found!51) lt!6901))))

(assert (=> b!21641 (=> (not res!13875) (not e!14082))))

(assert (=> b!21641 e!14082))

(declare-fun lt!6900 () Unit!452)

(assert (=> b!21641 (= lt!6900 lt!6916)))

(assert (=> b!21641 false))

(declare-fun bm!1438 () Bool)

(assert (=> bm!1438 (= call!1446 call!1436)))

(declare-fun b!21642 () Bool)

(declare-fun lt!6906 () tuple2!896)

(assert (=> b!21642 (= lt!6906 call!1439)))

(assert (=> b!21642 (= e!14074 (tuple2!897 (_1!451 lt!6906) (_2!451 lt!6906)))))

(declare-fun lt!6920 () SeekEntryResult!51)

(declare-fun bm!1439 () Bool)

(declare-fun c!2528 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1439 (= call!1425 (inRange!0 (ite c!2521 (ite c!2524 (index!2325 lt!6901) (ite c!2527 (index!2324 lt!6902) (index!2327 lt!6902))) (ite c!2528 (index!2325 lt!6920) (ite c!2530 (index!2324 lt!6904) (index!2327 lt!6904)))) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun bm!1440 () Bool)

(declare-fun c!2518 () Bool)

(declare-fun updateHelperNewKey!7 (LongMapFixedSize!186 (_ BitVec 64) V!1157 (_ BitVec 32)) tuple2!896)

(assert (=> bm!1440 (= call!1439 (updateHelperNewKey!7 (ite c!2454 (_2!451 lt!6679) lt!6678) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918))))))

(declare-fun b!21643 () Bool)

(assert (=> b!21643 (= c!2518 ((_ is MissingVacant!51) lt!6918))))

(assert (=> b!21643 (= e!14089 e!14086)))

(declare-fun b!21644 () Bool)

(declare-fun call!1429 () Bool)

(assert (=> b!21644 (= e!14080 (not call!1429))))

(declare-fun b!21645 () Bool)

(assert (=> b!21645 (= e!14073 (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6920)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!21646 () Bool)

(assert (=> b!21646 (= e!14082 (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6901)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!21647 () Bool)

(assert (=> b!21647 (= e!14077 (not call!1429))))

(declare-fun b!21648 () Bool)

(declare-fun res!13869 () Bool)

(assert (=> b!21648 (=> (not res!13869) (not e!14077))))

(assert (=> b!21648 (= res!13869 call!1424)))

(assert (=> b!21648 (= e!14091 e!14077)))

(declare-fun b!21649 () Bool)

(assert (=> b!21649 (= e!14078 (not call!1427))))

(declare-fun bm!1441 () Bool)

(assert (=> bm!1441 (= call!1429 call!1437)))

(declare-fun bm!1442 () Bool)

(assert (=> bm!1442 (= call!1434 (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite (or c!2519 c!2521) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (array!1230 (store (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918) (ValueCellFull!300 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))))) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2519 (ite c!2525 lt!6905 lt!6924) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite (and c!2519 c!2525) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2519 (ite c!2525 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!21650 () Bool)

(assert (=> b!21650 (= e!14085 (= call!1438 call!1442))))

(declare-fun b!21651 () Bool)

(declare-fun lt!6907 () Unit!452)

(assert (=> b!21651 (= e!14072 lt!6907)))

(assert (=> b!21651 (= lt!6907 call!1443)))

(assert (=> b!21651 (= lt!6920 call!1432)))

(declare-fun res!13866 () Bool)

(assert (=> b!21651 (= res!13866 ((_ is Found!51) lt!6920))))

(assert (=> b!21651 (=> (not res!13866) (not e!14073))))

(assert (=> b!21651 e!14073))

(declare-fun bm!1443 () Bool)

(assert (=> bm!1443 (= call!1437 (arrayContainsKey!0 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun bm!1444 () Bool)

(assert (=> bm!1444 (= call!1444 call!1430)))

(declare-fun b!21652 () Bool)

(assert (=> b!21652 (= e!14083 ((_ is Undefined!51) lt!6904))))

(declare-fun b!21653 () Bool)

(declare-fun lt!6912 () Unit!452)

(declare-fun lt!6917 () Unit!452)

(assert (=> b!21653 (= lt!6912 lt!6917)))

(assert (=> b!21653 call!1445))

(declare-fun lt!6919 () array!1229)

(declare-fun lemmaValidKeyInArrayIsInListMap!7 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 (_ BitVec 32) Int) Unit!452)

(assert (=> b!21653 (= lt!6917 (lemmaValidKeyInArrayIsInListMap!7 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6919 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (index!2325 lt!6918) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(assert (=> b!21653 (= lt!6919 (array!1230 (store (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918) (ValueCellFull!300 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun lt!6903 () Unit!452)

(declare-fun lt!6908 () Unit!452)

(assert (=> b!21653 (= lt!6903 lt!6908)))

(assert (=> b!21653 (= call!1436 call!1428)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!7 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 (_ BitVec 32) (_ BitVec 64) V!1157 Int) Unit!452)

(assert (=> b!21653 (= lt!6908 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!7 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (index!2325 lt!6918) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!6921 () Unit!452)

(assert (=> b!21653 (= lt!6921 e!14072)))

(assert (=> b!21653 (= c!2528 (contains!225 call!1430 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21653 (= e!14074 (tuple2!897 true (LongMapFixedSize!187 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_size!134 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (array!1230 (store (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918) (ValueCellFull!300 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)))) (_vacant!134 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun b!21654 () Bool)

(assert (=> b!21654 (= e!14084 (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6919 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!21655 () Bool)

(assert (=> b!21655 (= e!14079 e!14085)))

(declare-fun c!2522 () Bool)

(assert (=> b!21655 (= c!2522 (_1!451 lt!6915))))

(assert (= (and d!3753 c!2519) b!21636))

(assert (= (and d!3753 (not c!2519)) b!21620))

(assert (= (and b!21636 c!2525) b!21625))

(assert (= (and b!21636 (not c!2525)) b!21627))

(assert (= (or b!21625 b!21627) bm!1436))

(assert (= (or b!21625 b!21627) bm!1444))

(assert (= (or b!21625 b!21627) bm!1438))

(assert (= (and b!21620 c!2521) b!21632))

(assert (= (and b!21620 (not c!2521)) b!21643))

(assert (= (and b!21632 c!2524) b!21641))

(assert (= (and b!21632 (not c!2524)) b!21638))

(assert (= (and b!21641 res!13875) b!21617))

(assert (= (and b!21617 res!13872) b!21646))

(assert (= (and b!21638 c!2527) b!21626))

(assert (= (and b!21638 (not c!2527)) b!21639))

(assert (= (and b!21626 res!13864) b!21634))

(assert (= (and b!21634 res!13870) b!21649))

(assert (= (and b!21639 c!2526) b!21635))

(assert (= (and b!21639 (not c!2526)) b!21631))

(assert (= (and b!21635 res!13876) b!21640))

(assert (= (and b!21640 res!13873) b!21628))

(assert (= (or b!21626 b!21635) bm!1427))

(assert (= (or b!21649 b!21628) bm!1431))

(assert (= (or b!21617 bm!1427) bm!1433))

(assert (= (or b!21641 b!21638) bm!1435))

(assert (= (and b!21643 c!2518) b!21616))

(assert (= (and b!21643 (not c!2518)) b!21637))

(assert (= (and b!21637 c!2523) b!21642))

(assert (= (and b!21637 (not c!2523)) b!21653))

(assert (= (and b!21653 c!2528) b!21651))

(assert (= (and b!21653 (not c!2528)) b!21622))

(assert (= (and b!21651 res!13866) b!21619))

(assert (= (and b!21619 res!13868) b!21645))

(assert (= (and b!21622 c!2530) b!21648))

(assert (= (and b!21622 (not c!2530)) b!21629))

(assert (= (and b!21648 res!13869) b!21633))

(assert (= (and b!21633 res!13871) b!21647))

(assert (= (and b!21629 c!2529) b!21618))

(assert (= (and b!21629 (not c!2529)) b!21652))

(assert (= (and b!21618 res!13863) b!21621))

(assert (= (and b!21621 res!13865) b!21644))

(assert (= (or b!21648 b!21618) bm!1432))

(assert (= (or b!21647 b!21644) bm!1441))

(assert (= (or b!21619 bm!1432) bm!1428))

(assert (= (or b!21651 b!21622) bm!1422))

(assert (= (or b!21616 b!21642) bm!1440))

(assert (= (or bm!1431 bm!1441) bm!1443))

(assert (= (or bm!1435 bm!1422) bm!1426))

(assert (= (or b!21632 b!21653) bm!1421))

(assert (= (or bm!1433 bm!1428) bm!1439))

(assert (= (or b!21641 b!21651) bm!1424))

(assert (= (or b!21638 b!21622) bm!1430))

(assert (= (or b!21632 b!21653) bm!1434))

(assert (= (and bm!1434 c!2520) b!21630))

(assert (= (and bm!1434 (not c!2520)) b!21654))

(assert (= (or bm!1436 bm!1421) bm!1442))

(assert (= (or bm!1444 b!21653) bm!1429))

(assert (= (or bm!1438 b!21653) bm!1437))

(assert (= (and d!3753 res!13867) b!21655))

(assert (= (and b!21655 c!2522) b!21623))

(assert (= (and b!21655 (not c!2522)) b!21650))

(assert (= (and b!21623 res!13874) b!21624))

(assert (= (or b!21623 b!21624 b!21650) bm!1423))

(assert (= (or b!21624 b!21650) bm!1425))

(declare-fun m!15065 () Bool)

(assert (=> bm!1440 m!15065))

(declare-fun m!15067 () Bool)

(assert (=> b!21625 m!15067))

(declare-fun m!15069 () Bool)

(assert (=> b!21624 m!15069))

(declare-fun m!15071 () Bool)

(assert (=> bm!1425 m!15071))

(declare-fun m!15073 () Bool)

(assert (=> d!3753 m!15073))

(declare-fun m!15075 () Bool)

(assert (=> d!3753 m!15075))

(declare-fun m!15077 () Bool)

(assert (=> b!21653 m!15077))

(declare-fun m!15079 () Bool)

(assert (=> b!21653 m!15079))

(declare-fun m!15081 () Bool)

(assert (=> b!21653 m!15081))

(declare-fun m!15083 () Bool)

(assert (=> b!21653 m!15083))

(declare-fun m!15085 () Bool)

(assert (=> bm!1430 m!15085))

(declare-fun m!15087 () Bool)

(assert (=> bm!1437 m!15087))

(declare-fun m!15089 () Bool)

(assert (=> bm!1443 m!15089))

(declare-fun m!15091 () Bool)

(assert (=> b!21620 m!15091))

(declare-fun m!15093 () Bool)

(assert (=> b!21640 m!15093))

(declare-fun m!15095 () Bool)

(assert (=> b!21645 m!15095))

(declare-fun m!15097 () Bool)

(assert (=> b!21627 m!15097))

(declare-fun m!15099 () Bool)

(assert (=> b!21654 m!15099))

(declare-fun m!15101 () Bool)

(assert (=> bm!1429 m!15101))

(declare-fun m!15103 () Bool)

(assert (=> bm!1423 m!15103))

(declare-fun m!15105 () Bool)

(assert (=> b!21621 m!15105))

(declare-fun m!15107 () Bool)

(assert (=> b!21633 m!15107))

(declare-fun m!15109 () Bool)

(assert (=> b!21634 m!15109))

(declare-fun m!15111 () Bool)

(assert (=> bm!1434 m!15111))

(declare-fun m!15113 () Bool)

(assert (=> bm!1434 m!15113))

(assert (=> bm!1426 m!15091))

(assert (=> bm!1442 m!15079))

(declare-fun m!15115 () Bool)

(assert (=> bm!1442 m!15115))

(declare-fun m!15117 () Bool)

(assert (=> b!21646 m!15117))

(declare-fun m!15119 () Bool)

(assert (=> bm!1439 m!15119))

(declare-fun m!15121 () Bool)

(assert (=> b!21623 m!15121))

(declare-fun m!15123 () Bool)

(assert (=> bm!1424 m!15123))

(assert (=> bm!1344 d!3753))

(declare-fun d!3755 () Bool)

(assert (=> d!3755 (= (validMask!0 (mask!4692 (v!1573 (underlying!104 thiss!938)))) (and (or (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000001111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000011111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000001111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000011111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000001111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000011111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000000001111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000000011111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000000111111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000001111111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000011111111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000000111111111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000001111111111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000011111111111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000000111111111111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000001111111111111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000011111111111111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000000111111111111111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000001111111111111111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000011111111111111111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00000111111111111111111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00001111111111111111111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00011111111111111111111111111111) (= (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4692 (v!1573 (underlying!104 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!21377 d!3755))

(declare-fun bm!1445 () Bool)

(declare-fun call!1452 () ListLongMap!559)

(declare-fun call!1458 () ListLongMap!559)

(assert (=> bm!1445 (= call!1452 call!1458)))

(declare-fun b!21656 () Bool)

(declare-fun e!14107 () tuple2!896)

(declare-fun lt!6949 () tuple2!896)

(assert (=> b!21656 (= e!14107 (tuple2!897 (_1!451 lt!6949) (_2!451 lt!6949)))))

(declare-fun call!1463 () tuple2!896)

(assert (=> b!21656 (= lt!6949 call!1463)))

(declare-fun b!21657 () Bool)

(declare-fun res!13886 () Bool)

(declare-fun call!1450 () Bool)

(assert (=> b!21657 (= res!13886 call!1450)))

(declare-fun e!14103 () Bool)

(assert (=> b!21657 (=> (not res!13886) (not e!14103))))

(declare-fun b!21658 () Bool)

(declare-fun e!14104 () Bool)

(declare-fun e!14101 () Bool)

(assert (=> b!21658 (= e!14104 e!14101)))

(declare-fun res!13877 () Bool)

(declare-fun call!1448 () Bool)

(assert (=> b!21658 (= res!13877 call!1448)))

(assert (=> b!21658 (=> (not res!13877) (not e!14101))))

(declare-fun bm!1446 () Bool)

(declare-fun call!1456 () SeekEntryResult!51)

(declare-fun call!1459 () SeekEntryResult!51)

(assert (=> bm!1446 (= call!1456 call!1459)))

(declare-fun b!21659 () Bool)

(declare-fun res!13882 () Bool)

(declare-fun call!1455 () Bool)

(assert (=> b!21659 (= res!13882 call!1455)))

(declare-fun e!14094 () Bool)

(assert (=> b!21659 (=> (not res!13882) (not e!14094))))

(declare-fun bm!1447 () Bool)

(declare-fun call!1462 () ListLongMap!559)

(declare-fun lt!6942 () tuple2!896)

(assert (=> bm!1447 (= call!1462 (map!395 (_2!451 lt!6942)))))

(declare-fun bm!1448 () Bool)

(declare-fun call!1467 () Unit!452)

(assert (=> bm!1448 (= call!1467 (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun b!21660 () Bool)

(declare-fun e!14097 () tuple2!896)

(declare-fun e!14110 () tuple2!896)

(assert (=> b!21660 (= e!14097 e!14110)))

(declare-fun lt!6945 () SeekEntryResult!51)

(assert (=> b!21660 (= lt!6945 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3140 lt!6678) (mask!4692 lt!6678)))))

(declare-fun c!2534 () Bool)

(assert (=> b!21660 (= c!2534 ((_ is Undefined!51) lt!6945))))

(declare-fun b!21661 () Bool)

(declare-fun res!13879 () Bool)

(declare-fun lt!6931 () SeekEntryResult!51)

(assert (=> b!21661 (= res!13879 (= (select (arr!584 (_keys!3140 lt!6678)) (index!2327 lt!6931)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21661 (=> (not res!13879) (not e!14101))))

(declare-fun b!21662 () Bool)

(declare-fun e!14093 () Unit!452)

(declare-fun Unit!462 () Unit!452)

(assert (=> b!21662 (= e!14093 Unit!462)))

(declare-fun lt!6936 () Unit!452)

(declare-fun call!1464 () Unit!452)

(assert (=> b!21662 (= lt!6936 call!1464)))

(assert (=> b!21662 (= lt!6931 call!1456)))

(declare-fun c!2543 () Bool)

(assert (=> b!21662 (= c!2543 ((_ is MissingZero!51) lt!6931))))

(declare-fun e!14112 () Bool)

(assert (=> b!21662 e!14112))

(declare-fun lt!6938 () Unit!452)

(assert (=> b!21662 (= lt!6938 lt!6936)))

(assert (=> b!21662 false))

(declare-fun b!21663 () Bool)

(declare-fun e!14106 () Bool)

(declare-fun e!14109 () Bool)

(assert (=> b!21663 (= e!14106 e!14109)))

(declare-fun res!13888 () Bool)

(assert (=> b!21663 (= res!13888 (contains!225 call!1462 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21663 (=> (not res!13888) (not e!14109))))

(declare-fun call!1466 () ListLongMap!559)

(declare-fun b!21664 () Bool)

(assert (=> b!21664 (= e!14109 (= call!1462 (+!42 call!1466 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(declare-fun bm!1449 () Bool)

(assert (=> bm!1449 (= call!1466 (map!395 lt!6678))))

(declare-fun b!21665 () Bool)

(declare-fun lt!6926 () Unit!452)

(declare-fun lt!6937 () Unit!452)

(assert (=> b!21665 (= lt!6926 lt!6937)))

(declare-fun call!1470 () ListLongMap!559)

(declare-fun call!1457 () ListLongMap!559)

(assert (=> b!21665 (= call!1470 call!1457)))

(declare-fun lt!6932 () (_ BitVec 32))

(assert (=> b!21665 (= lt!6937 (lemmaChangeZeroKeyThenAddPairToListMap!7 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) lt!6932 (zeroValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 lt!6678) (defaultEntry!1719 lt!6678)))))

(assert (=> b!21665 (= lt!6932 (bvor (extraKeys!1622 lt!6678) #b00000000000000000000000000000001))))

(declare-fun e!14092 () tuple2!896)

(assert (=> b!21665 (= e!14092 (tuple2!897 true (LongMapFixedSize!187 (defaultEntry!1719 lt!6678) (mask!4692 lt!6678) (bvor (extraKeys!1622 lt!6678) #b00000000000000000000000000000001) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 lt!6678) (_size!134 lt!6678) (_keys!3140 lt!6678) (_values!1708 lt!6678) (_vacant!134 lt!6678))))))

(declare-fun bm!1450 () Bool)

(assert (=> bm!1450 (= call!1459 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3140 lt!6678) (mask!4692 lt!6678)))))

(declare-fun b!21666 () Bool)

(declare-fun res!13878 () Bool)

(declare-fun e!14099 () Bool)

(assert (=> b!21666 (=> (not res!13878) (not e!14099))))

(declare-fun call!1471 () Bool)

(assert (=> b!21666 (= res!13878 call!1471)))

(declare-fun e!14111 () Bool)

(assert (=> b!21666 (= e!14111 e!14099)))

(declare-fun bm!1451 () Bool)

(assert (=> bm!1451 (= call!1471 call!1450)))

(declare-fun b!21667 () Bool)

(declare-fun lt!6925 () Unit!452)

(declare-fun lt!6950 () Unit!452)

(assert (=> b!21667 (= lt!6925 lt!6950)))

(assert (=> b!21667 (= call!1470 call!1457)))

(declare-fun lt!6951 () (_ BitVec 32))

(assert (=> b!21667 (= lt!6950 (lemmaChangeLongMinValueKeyThenAddPairToListMap!7 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) lt!6951 (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (defaultEntry!1719 lt!6678)))))

(assert (=> b!21667 (= lt!6951 (bvor (extraKeys!1622 lt!6678) #b00000000000000000000000000000010))))

(assert (=> b!21667 (= e!14092 (tuple2!897 true (LongMapFixedSize!187 (defaultEntry!1719 lt!6678) (mask!4692 lt!6678) (bvor (extraKeys!1622 lt!6678) #b00000000000000000000000000000010) (zeroValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (_size!134 lt!6678) (_keys!3140 lt!6678) (_values!1708 lt!6678) (_vacant!134 lt!6678))))))

(declare-fun bm!1452 () Bool)

(declare-fun call!1449 () Bool)

(assert (=> bm!1452 (= call!1455 call!1449)))

(declare-fun b!21668 () Bool)

(declare-fun e!14096 () Bool)

(declare-fun call!1451 () Bool)

(assert (=> b!21668 (= e!14096 (not call!1451))))

(declare-fun bm!1453 () Bool)

(declare-fun call!1454 () ListLongMap!559)

(assert (=> bm!1453 (= call!1454 (getCurrentListMap!126 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun bm!1454 () Bool)

(assert (=> bm!1454 (= call!1464 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun b!21669 () Bool)

(declare-fun c!2542 () Bool)

(assert (=> b!21669 (= c!2542 ((_ is MissingVacant!51) lt!6931))))

(assert (=> b!21669 (= e!14112 e!14104)))

(declare-fun b!21670 () Bool)

(declare-fun e!14105 () ListLongMap!559)

(assert (=> b!21670 (= e!14105 call!1452)))

(declare-fun bm!1455 () Bool)

(declare-fun call!1461 () Bool)

(assert (=> bm!1455 (= call!1451 call!1461)))

(declare-fun b!21671 () Bool)

(declare-fun e!14108 () Bool)

(declare-fun lt!6929 () SeekEntryResult!51)

(assert (=> b!21671 (= e!14108 ((_ is Undefined!51) lt!6929))))

(declare-fun b!21672 () Bool)

(declare-fun lt!6941 () Unit!452)

(declare-fun e!14102 () Unit!452)

(assert (=> b!21672 (= lt!6941 e!14102)))

(declare-fun c!2537 () Bool)

(declare-fun call!1469 () Bool)

(assert (=> b!21672 (= c!2537 call!1469)))

(assert (=> b!21672 (= e!14110 (tuple2!897 false lt!6678))))

(declare-fun b!21673 () Bool)

(declare-fun res!13885 () Bool)

(declare-fun e!14098 () Bool)

(assert (=> b!21673 (=> (not res!13885) (not e!14098))))

(assert (=> b!21673 (= res!13885 (= (select (arr!584 (_keys!3140 lt!6678)) (index!2324 lt!6931)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1456 () Bool)

(assert (=> bm!1456 (= call!1448 call!1455)))

(declare-fun b!21674 () Bool)

(declare-fun res!13884 () Bool)

(assert (=> b!21674 (=> (not res!13884) (not e!14099))))

(assert (=> b!21674 (= res!13884 (= (select (arr!584 (_keys!3140 lt!6678)) (index!2324 lt!6929)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21675 () Bool)

(assert (=> b!21675 (= e!14108 e!14096)))

(declare-fun res!13890 () Bool)

(assert (=> b!21675 (= res!13890 call!1471)))

(assert (=> b!21675 (=> (not res!13890) (not e!14096))))

(declare-fun bm!1457 () Bool)

(assert (=> bm!1457 (= call!1450 call!1449)))

(declare-fun bm!1458 () Bool)

(declare-fun c!2533 () Bool)

(assert (=> bm!1458 (= c!2533 c!2534)))

(assert (=> bm!1458 (= call!1469 (contains!225 e!14105 (ite c!2534 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!584 (_keys!3140 lt!6678)) (index!2325 lt!6945)))))))

(declare-fun b!21677 () Bool)

(declare-fun e!14095 () tuple2!896)

(assert (=> b!21677 (= e!14107 e!14095)))

(declare-fun c!2536 () Bool)

(assert (=> b!21677 (= c!2536 ((_ is MissingZero!51) lt!6945))))

(declare-fun b!21678 () Bool)

(declare-fun lt!6940 () Unit!452)

(assert (=> b!21678 (= e!14102 lt!6940)))

(assert (=> b!21678 (= lt!6940 call!1464)))

(declare-fun call!1465 () SeekEntryResult!51)

(assert (=> b!21678 (= lt!6929 call!1465)))

(declare-fun c!2540 () Bool)

(assert (=> b!21678 (= c!2540 ((_ is MissingZero!51) lt!6929))))

(assert (=> b!21678 e!14111))

(declare-fun d!3757 () Bool)

(declare-fun e!14100 () Bool)

(assert (=> d!3757 e!14100))

(declare-fun res!13881 () Bool)

(assert (=> d!3757 (=> (not res!13881) (not e!14100))))

(assert (=> d!3757 (= res!13881 (valid!93 (_2!451 lt!6942)))))

(assert (=> d!3757 (= lt!6942 e!14097)))

(declare-fun c!2532 () Bool)

(assert (=> d!3757 (= c!2532 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3757 (valid!93 lt!6678)))

(assert (=> d!3757 (= (update!23 lt!6678 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) lt!6942)))

(declare-fun b!21676 () Bool)

(assert (=> b!21676 (= e!14097 e!14092)))

(declare-fun c!2538 () Bool)

(assert (=> b!21676 (= c!2538 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1459 () Bool)

(assert (=> bm!1459 (= call!1465 call!1459)))

(declare-fun b!21679 () Bool)

(declare-fun c!2539 () Bool)

(assert (=> b!21679 (= c!2539 ((_ is MissingVacant!51) lt!6929))))

(assert (=> b!21679 (= e!14111 e!14108)))

(declare-fun bm!1460 () Bool)

(assert (=> bm!1460 (= call!1457 call!1458)))

(declare-fun call!1468 () ListLongMap!559)

(declare-fun bm!1461 () Bool)

(declare-fun call!1460 () ListLongMap!559)

(assert (=> bm!1461 (= call!1460 (+!42 (ite c!2532 call!1468 call!1454) (ite c!2532 (ite c!2538 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(declare-fun b!21680 () Bool)

(declare-fun res!13887 () Bool)

(assert (=> b!21680 (= res!13887 (= (select (arr!584 (_keys!3140 lt!6678)) (index!2327 lt!6929)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21680 (=> (not res!13887) (not e!14096))))

(declare-fun b!21681 () Bool)

(declare-fun Unit!463 () Unit!452)

(assert (=> b!21681 (= e!14102 Unit!463)))

(declare-fun lt!6943 () Unit!452)

(assert (=> b!21681 (= lt!6943 call!1467)))

(declare-fun lt!6928 () SeekEntryResult!51)

(assert (=> b!21681 (= lt!6928 call!1465)))

(declare-fun res!13889 () Bool)

(assert (=> b!21681 (= res!13889 ((_ is Found!51) lt!6928))))

(assert (=> b!21681 (=> (not res!13889) (not e!14103))))

(assert (=> b!21681 e!14103))

(declare-fun lt!6927 () Unit!452)

(assert (=> b!21681 (= lt!6927 lt!6943)))

(assert (=> b!21681 false))

(declare-fun bm!1462 () Bool)

(assert (=> bm!1462 (= call!1470 call!1460)))

(declare-fun b!21682 () Bool)

(declare-fun lt!6933 () tuple2!896)

(assert (=> b!21682 (= lt!6933 call!1463)))

(assert (=> b!21682 (= e!14095 (tuple2!897 (_1!451 lt!6933) (_2!451 lt!6933)))))

(declare-fun bm!1463 () Bool)

(declare-fun lt!6947 () SeekEntryResult!51)

(declare-fun c!2541 () Bool)

(assert (=> bm!1463 (= call!1449 (inRange!0 (ite c!2534 (ite c!2537 (index!2325 lt!6928) (ite c!2540 (index!2324 lt!6929) (index!2327 lt!6929))) (ite c!2541 (index!2325 lt!6947) (ite c!2543 (index!2324 lt!6931) (index!2327 lt!6931)))) (mask!4692 lt!6678)))))

(declare-fun bm!1464 () Bool)

(declare-fun c!2531 () Bool)

(assert (=> bm!1464 (= call!1463 (updateHelperNewKey!7 lt!6678 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945))))))

(declare-fun b!21683 () Bool)

(assert (=> b!21683 (= c!2531 ((_ is MissingVacant!51) lt!6945))))

(assert (=> b!21683 (= e!14110 e!14107)))

(declare-fun b!21684 () Bool)

(declare-fun call!1453 () Bool)

(assert (=> b!21684 (= e!14101 (not call!1453))))

(declare-fun b!21685 () Bool)

(assert (=> b!21685 (= e!14094 (= (select (arr!584 (_keys!3140 lt!6678)) (index!2325 lt!6947)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21686 () Bool)

(assert (=> b!21686 (= e!14103 (= (select (arr!584 (_keys!3140 lt!6678)) (index!2325 lt!6928)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21687 () Bool)

(assert (=> b!21687 (= e!14098 (not call!1453))))

(declare-fun b!21688 () Bool)

(declare-fun res!13883 () Bool)

(assert (=> b!21688 (=> (not res!13883) (not e!14098))))

(assert (=> b!21688 (= res!13883 call!1448)))

(assert (=> b!21688 (= e!14112 e!14098)))

(declare-fun b!21689 () Bool)

(assert (=> b!21689 (= e!14099 (not call!1451))))

(declare-fun bm!1465 () Bool)

(assert (=> bm!1465 (= call!1453 call!1461)))

(declare-fun bm!1466 () Bool)

(assert (=> bm!1466 (= call!1458 (getCurrentListMap!126 (_keys!3140 lt!6678) (ite (or c!2532 c!2534) (_values!1708 lt!6678) (array!1230 (store (arr!583 (_values!1708 lt!6678)) (index!2325 lt!6945) (ValueCellFull!300 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (size!676 (_values!1708 lt!6678)))) (mask!4692 lt!6678) (ite c!2532 (ite c!2538 lt!6932 lt!6951) (extraKeys!1622 lt!6678)) (ite (and c!2532 c!2538) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 lt!6678)) (ite c!2532 (ite c!2538 (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (minValue!1646 lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun b!21690 () Bool)

(assert (=> b!21690 (= e!14106 (= call!1462 call!1466))))

(declare-fun b!21691 () Bool)

(declare-fun lt!6934 () Unit!452)

(assert (=> b!21691 (= e!14093 lt!6934)))

(assert (=> b!21691 (= lt!6934 call!1467)))

(assert (=> b!21691 (= lt!6947 call!1456)))

(declare-fun res!13880 () Bool)

(assert (=> b!21691 (= res!13880 ((_ is Found!51) lt!6947))))

(assert (=> b!21691 (=> (not res!13880) (not e!14094))))

(assert (=> b!21691 e!14094))

(declare-fun bm!1467 () Bool)

(assert (=> bm!1467 (= call!1461 (arrayContainsKey!0 (_keys!3140 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun bm!1468 () Bool)

(assert (=> bm!1468 (= call!1468 call!1454)))

(declare-fun b!21692 () Bool)

(assert (=> b!21692 (= e!14104 ((_ is Undefined!51) lt!6931))))

(declare-fun b!21693 () Bool)

(declare-fun lt!6939 () Unit!452)

(declare-fun lt!6944 () Unit!452)

(assert (=> b!21693 (= lt!6939 lt!6944)))

(assert (=> b!21693 call!1469))

(declare-fun lt!6946 () array!1229)

(assert (=> b!21693 (= lt!6944 (lemmaValidKeyInArrayIsInListMap!7 (_keys!3140 lt!6678) lt!6946 (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) (index!2325 lt!6945) (defaultEntry!1719 lt!6678)))))

(assert (=> b!21693 (= lt!6946 (array!1230 (store (arr!583 (_values!1708 lt!6678)) (index!2325 lt!6945) (ValueCellFull!300 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (size!676 (_values!1708 lt!6678))))))

(declare-fun lt!6930 () Unit!452)

(declare-fun lt!6935 () Unit!452)

(assert (=> b!21693 (= lt!6930 lt!6935)))

(assert (=> b!21693 (= call!1460 call!1452)))

(assert (=> b!21693 (= lt!6935 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!7 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) (index!2325 lt!6945) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (defaultEntry!1719 lt!6678)))))

(declare-fun lt!6948 () Unit!452)

(assert (=> b!21693 (= lt!6948 e!14093)))

(assert (=> b!21693 (= c!2541 (contains!225 call!1454 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21693 (= e!14095 (tuple2!897 true (LongMapFixedSize!187 (defaultEntry!1719 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) (_size!134 lt!6678) (_keys!3140 lt!6678) (array!1230 (store (arr!583 (_values!1708 lt!6678)) (index!2325 lt!6945) (ValueCellFull!300 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (size!676 (_values!1708 lt!6678))) (_vacant!134 lt!6678))))))

(declare-fun b!21694 () Bool)

(assert (=> b!21694 (= e!14105 (getCurrentListMap!126 (_keys!3140 lt!6678) lt!6946 (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun b!21695 () Bool)

(assert (=> b!21695 (= e!14100 e!14106)))

(declare-fun c!2535 () Bool)

(assert (=> b!21695 (= c!2535 (_1!451 lt!6942))))

(assert (= (and d!3757 c!2532) b!21676))

(assert (= (and d!3757 (not c!2532)) b!21660))

(assert (= (and b!21676 c!2538) b!21665))

(assert (= (and b!21676 (not c!2538)) b!21667))

(assert (= (or b!21665 b!21667) bm!1460))

(assert (= (or b!21665 b!21667) bm!1468))

(assert (= (or b!21665 b!21667) bm!1462))

(assert (= (and b!21660 c!2534) b!21672))

(assert (= (and b!21660 (not c!2534)) b!21683))

(assert (= (and b!21672 c!2537) b!21681))

(assert (= (and b!21672 (not c!2537)) b!21678))

(assert (= (and b!21681 res!13889) b!21657))

(assert (= (and b!21657 res!13886) b!21686))

(assert (= (and b!21678 c!2540) b!21666))

(assert (= (and b!21678 (not c!2540)) b!21679))

(assert (= (and b!21666 res!13878) b!21674))

(assert (= (and b!21674 res!13884) b!21689))

(assert (= (and b!21679 c!2539) b!21675))

(assert (= (and b!21679 (not c!2539)) b!21671))

(assert (= (and b!21675 res!13890) b!21680))

(assert (= (and b!21680 res!13887) b!21668))

(assert (= (or b!21666 b!21675) bm!1451))

(assert (= (or b!21689 b!21668) bm!1455))

(assert (= (or b!21657 bm!1451) bm!1457))

(assert (= (or b!21681 b!21678) bm!1459))

(assert (= (and b!21683 c!2531) b!21656))

(assert (= (and b!21683 (not c!2531)) b!21677))

(assert (= (and b!21677 c!2536) b!21682))

(assert (= (and b!21677 (not c!2536)) b!21693))

(assert (= (and b!21693 c!2541) b!21691))

(assert (= (and b!21693 (not c!2541)) b!21662))

(assert (= (and b!21691 res!13880) b!21659))

(assert (= (and b!21659 res!13882) b!21685))

(assert (= (and b!21662 c!2543) b!21688))

(assert (= (and b!21662 (not c!2543)) b!21669))

(assert (= (and b!21688 res!13883) b!21673))

(assert (= (and b!21673 res!13885) b!21687))

(assert (= (and b!21669 c!2542) b!21658))

(assert (= (and b!21669 (not c!2542)) b!21692))

(assert (= (and b!21658 res!13877) b!21661))

(assert (= (and b!21661 res!13879) b!21684))

(assert (= (or b!21688 b!21658) bm!1456))

(assert (= (or b!21687 b!21684) bm!1465))

(assert (= (or b!21659 bm!1456) bm!1452))

(assert (= (or b!21691 b!21662) bm!1446))

(assert (= (or b!21656 b!21682) bm!1464))

(assert (= (or bm!1455 bm!1465) bm!1467))

(assert (= (or bm!1459 bm!1446) bm!1450))

(assert (= (or b!21672 b!21693) bm!1445))

(assert (= (or bm!1457 bm!1452) bm!1463))

(assert (= (or b!21681 b!21691) bm!1448))

(assert (= (or b!21678 b!21662) bm!1454))

(assert (= (or b!21672 b!21693) bm!1458))

(assert (= (and bm!1458 c!2533) b!21670))

(assert (= (and bm!1458 (not c!2533)) b!21694))

(assert (= (or bm!1460 bm!1445) bm!1466))

(assert (= (or bm!1468 b!21693) bm!1453))

(assert (= (or bm!1462 b!21693) bm!1461))

(assert (= (and d!3757 res!13881) b!21695))

(assert (= (and b!21695 c!2535) b!21663))

(assert (= (and b!21695 (not c!2535)) b!21690))

(assert (= (and b!21663 res!13888) b!21664))

(assert (= (or b!21663 b!21664 b!21690) bm!1447))

(assert (= (or b!21664 b!21690) bm!1449))

(declare-fun m!15125 () Bool)

(assert (=> bm!1464 m!15125))

(declare-fun m!15127 () Bool)

(assert (=> b!21665 m!15127))

(declare-fun m!15129 () Bool)

(assert (=> b!21664 m!15129))

(declare-fun m!15131 () Bool)

(assert (=> bm!1449 m!15131))

(declare-fun m!15133 () Bool)

(assert (=> d!3757 m!15133))

(declare-fun m!15135 () Bool)

(assert (=> d!3757 m!15135))

(declare-fun m!15137 () Bool)

(assert (=> b!21693 m!15137))

(declare-fun m!15139 () Bool)

(assert (=> b!21693 m!15139))

(declare-fun m!15141 () Bool)

(assert (=> b!21693 m!15141))

(declare-fun m!15143 () Bool)

(assert (=> b!21693 m!15143))

(declare-fun m!15145 () Bool)

(assert (=> bm!1454 m!15145))

(declare-fun m!15147 () Bool)

(assert (=> bm!1461 m!15147))

(declare-fun m!15149 () Bool)

(assert (=> bm!1467 m!15149))

(declare-fun m!15151 () Bool)

(assert (=> b!21660 m!15151))

(declare-fun m!15153 () Bool)

(assert (=> b!21680 m!15153))

(declare-fun m!15155 () Bool)

(assert (=> b!21685 m!15155))

(declare-fun m!15157 () Bool)

(assert (=> b!21667 m!15157))

(declare-fun m!15159 () Bool)

(assert (=> b!21694 m!15159))

(declare-fun m!15161 () Bool)

(assert (=> bm!1453 m!15161))

(declare-fun m!15163 () Bool)

(assert (=> bm!1447 m!15163))

(declare-fun m!15165 () Bool)

(assert (=> b!21661 m!15165))

(declare-fun m!15167 () Bool)

(assert (=> b!21673 m!15167))

(declare-fun m!15169 () Bool)

(assert (=> b!21674 m!15169))

(declare-fun m!15171 () Bool)

(assert (=> bm!1458 m!15171))

(declare-fun m!15173 () Bool)

(assert (=> bm!1458 m!15173))

(assert (=> bm!1450 m!15151))

(assert (=> bm!1466 m!15139))

(declare-fun m!15175 () Bool)

(assert (=> bm!1466 m!15175))

(declare-fun m!15177 () Bool)

(assert (=> b!21686 m!15177))

(declare-fun m!15179 () Bool)

(assert (=> bm!1463 m!15179))

(declare-fun m!15181 () Bool)

(assert (=> b!21663 m!15181))

(declare-fun m!15183 () Bool)

(assert (=> bm!1448 m!15183))

(assert (=> b!21370 d!3757))

(declare-fun condMapEmpty!985 () Bool)

(declare-fun mapDefault!985 () ValueCell!300)

(assert (=> mapNonEmpty!979 (= condMapEmpty!985 (= mapRest!979 ((as const (Array (_ BitVec 32) ValueCell!300)) mapDefault!985)))))

(declare-fun e!14118 () Bool)

(declare-fun mapRes!985 () Bool)

(assert (=> mapNonEmpty!979 (= tp!3441 (and e!14118 mapRes!985))))

(declare-fun b!21702 () Bool)

(declare-fun e!14117 () Bool)

(assert (=> b!21702 (= e!14117 tp_is_empty!999)))

(declare-fun mapNonEmpty!985 () Bool)

(declare-fun tp!3451 () Bool)

(assert (=> mapNonEmpty!985 (= mapRes!985 (and tp!3451 e!14117))))

(declare-fun mapKey!985 () (_ BitVec 32))

(declare-fun mapValue!985 () ValueCell!300)

(declare-fun mapRest!985 () (Array (_ BitVec 32) ValueCell!300))

(assert (=> mapNonEmpty!985 (= mapRest!979 (store mapRest!985 mapKey!985 mapValue!985))))

(declare-fun mapIsEmpty!985 () Bool)

(assert (=> mapIsEmpty!985 mapRes!985))

(declare-fun b!21703 () Bool)

(assert (=> b!21703 (= e!14118 tp_is_empty!999)))

(assert (= (and mapNonEmpty!979 condMapEmpty!985) mapIsEmpty!985))

(assert (= (and mapNonEmpty!979 (not condMapEmpty!985)) mapNonEmpty!985))

(assert (= (and mapNonEmpty!985 ((_ is ValueCellFull!300) mapValue!985)) b!21702))

(assert (= (and mapNonEmpty!979 ((_ is ValueCellFull!300) mapDefault!985)) b!21703))

(declare-fun m!15185 () Bool)

(assert (=> mapNonEmpty!985 m!15185))

(declare-fun b_lambda!1527 () Bool)

(assert (= b_lambda!1525 (or (and b!21366 b_free!735) b_lambda!1527)))

(declare-fun b_lambda!1529 () Bool)

(assert (= b_lambda!1521 (or (and b!21366 b_free!735) b_lambda!1529)))

(declare-fun b_lambda!1531 () Bool)

(assert (= b_lambda!1523 (or (and b!21366 b_free!735) b_lambda!1531)))

(check-sat (not b!21496) (not bm!1368) (not b_lambda!1529) b_and!1431 (not d!3741) (not b!21665) (not bm!1440) (not bm!1425) (not b!21654) (not bm!1439) (not d!3737) (not b!21627) tp_is_empty!999 (not bm!1453) (not bm!1464) (not bm!1461) (not b!21533) (not d!3753) (not bm!1437) (not bm!1448) (not bm!1372) (not b!21490) (not b!21667) (not bm!1429) (not b_lambda!1527) (not b!21660) (not b!21664) (not b!21492) (not bm!1449) (not bm!1463) (not bm!1458) (not b!21653) (not bm!1454) (not bm!1442) (not bm!1430) (not b!21493) (not bm!1424) (not b!21513) (not d!3739) (not bm!1443) (not b!21515) (not bm!1447) (not bm!1369) (not b!21620) (not b!21478) (not b!21481) (not b!21524) (not b!21693) (not bm!1371) (not b!21534) (not b!21663) (not mapNonEmpty!985) (not d!3745) (not d!3751) (not b!21517) (not bm!1426) (not b!21484) (not bm!1466) (not b_lambda!1531) (not b!21694) (not d!3757) (not b_next!735) (not d!3743) (not b!21535) (not bm!1434) (not b!21623) (not bm!1467) (not bm!1423) (not b!21624) (not b!21625) (not bm!1450) (not b!21483))
(check-sat b_and!1431 (not b_next!735))
(get-model)

(declare-fun d!3759 () Bool)

(assert (=> d!3759 (= (validKeyInArray!0 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))) (and (not (= (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21492 d!3759))

(declare-fun b!21716 () Bool)

(declare-fun c!2551 () Bool)

(declare-fun lt!6960 () (_ BitVec 64))

(assert (=> b!21716 (= c!2551 (= lt!6960 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14125 () SeekEntryResult!51)

(declare-fun e!14127 () SeekEntryResult!51)

(assert (=> b!21716 (= e!14125 e!14127)))

(declare-fun b!21717 () Bool)

(declare-fun lt!6958 () SeekEntryResult!51)

(assert (=> b!21717 (= e!14127 (MissingZero!51 (index!2326 lt!6958)))))

(declare-fun b!21718 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!1231 (_ BitVec 32)) SeekEntryResult!51)

(assert (=> b!21718 (= e!14127 (seekKeyOrZeroReturnVacant!0 (x!5190 lt!6958) (index!2326 lt!6958) (index!2326 lt!6958) #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3140 lt!6678) (mask!4692 lt!6678)))))

(declare-fun b!21719 () Bool)

(declare-fun e!14126 () SeekEntryResult!51)

(assert (=> b!21719 (= e!14126 Undefined!51)))

(declare-fun b!21720 () Bool)

(assert (=> b!21720 (= e!14125 (Found!51 (index!2326 lt!6958)))))

(declare-fun d!3761 () Bool)

(declare-fun lt!6959 () SeekEntryResult!51)

(assert (=> d!3761 (and (or ((_ is Undefined!51) lt!6959) (not ((_ is Found!51) lt!6959)) (and (bvsge (index!2325 lt!6959) #b00000000000000000000000000000000) (bvslt (index!2325 lt!6959) (size!677 (_keys!3140 lt!6678))))) (or ((_ is Undefined!51) lt!6959) ((_ is Found!51) lt!6959) (not ((_ is MissingZero!51) lt!6959)) (and (bvsge (index!2324 lt!6959) #b00000000000000000000000000000000) (bvslt (index!2324 lt!6959) (size!677 (_keys!3140 lt!6678))))) (or ((_ is Undefined!51) lt!6959) ((_ is Found!51) lt!6959) ((_ is MissingZero!51) lt!6959) (not ((_ is MissingVacant!51) lt!6959)) (and (bvsge (index!2327 lt!6959) #b00000000000000000000000000000000) (bvslt (index!2327 lt!6959) (size!677 (_keys!3140 lt!6678))))) (or ((_ is Undefined!51) lt!6959) (ite ((_ is Found!51) lt!6959) (= (select (arr!584 (_keys!3140 lt!6678)) (index!2325 lt!6959)) #b0000000000000000000000000000000000000000000000000000000000000000) (ite ((_ is MissingZero!51) lt!6959) (= (select (arr!584 (_keys!3140 lt!6678)) (index!2324 lt!6959)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!51) lt!6959) (= (select (arr!584 (_keys!3140 lt!6678)) (index!2327 lt!6959)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!3761 (= lt!6959 e!14126)))

(declare-fun c!2552 () Bool)

(assert (=> d!3761 (= c!2552 (and ((_ is Intermediate!51) lt!6958) (undefined!863 lt!6958)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!1231 (_ BitVec 32)) SeekEntryResult!51)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3761 (= lt!6958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 #b0000000000000000000000000000000000000000000000000000000000000000 (mask!4692 lt!6678)) #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3140 lt!6678) (mask!4692 lt!6678)))))

(assert (=> d!3761 (validMask!0 (mask!4692 lt!6678))))

(assert (=> d!3761 (= (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3140 lt!6678) (mask!4692 lt!6678)) lt!6959)))

(declare-fun b!21721 () Bool)

(assert (=> b!21721 (= e!14126 e!14125)))

(assert (=> b!21721 (= lt!6960 (select (arr!584 (_keys!3140 lt!6678)) (index!2326 lt!6958)))))

(declare-fun c!2550 () Bool)

(assert (=> b!21721 (= c!2550 (= lt!6960 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3761 c!2552) b!21719))

(assert (= (and d!3761 (not c!2552)) b!21721))

(assert (= (and b!21721 c!2550) b!21720))

(assert (= (and b!21721 (not c!2550)) b!21716))

(assert (= (and b!21716 c!2551) b!21717))

(assert (= (and b!21716 (not c!2551)) b!21718))

(declare-fun m!15187 () Bool)

(assert (=> b!21718 m!15187))

(declare-fun m!15189 () Bool)

(assert (=> d!3761 m!15189))

(declare-fun m!15191 () Bool)

(assert (=> d!3761 m!15191))

(declare-fun m!15193 () Bool)

(assert (=> d!3761 m!15193))

(declare-fun m!15195 () Bool)

(assert (=> d!3761 m!15195))

(declare-fun m!15197 () Bool)

(assert (=> d!3761 m!15197))

(assert (=> d!3761 m!15193))

(declare-fun m!15199 () Bool)

(assert (=> d!3761 m!15199))

(declare-fun m!15201 () Bool)

(assert (=> b!21721 m!15201))

(assert (=> b!21660 d!3761))

(declare-fun d!3763 () Bool)

(assert (=> d!3763 (= (map!395 (_2!451 lt!6942)) (getCurrentListMap!126 (_keys!3140 (_2!451 lt!6942)) (_values!1708 (_2!451 lt!6942)) (mask!4692 (_2!451 lt!6942)) (extraKeys!1622 (_2!451 lt!6942)) (zeroValue!1646 (_2!451 lt!6942)) (minValue!1646 (_2!451 lt!6942)) #b00000000000000000000000000000000 (defaultEntry!1719 (_2!451 lt!6942))))))

(declare-fun bs!911 () Bool)

(assert (= bs!911 d!3763))

(declare-fun m!15203 () Bool)

(assert (=> bs!911 m!15203))

(assert (=> bm!1447 d!3763))

(declare-fun d!3765 () Bool)

(assert (=> d!3765 (= (inRange!0 (ite c!2521 (ite c!2524 (index!2325 lt!6901) (ite c!2527 (index!2324 lt!6902) (index!2327 lt!6902))) (ite c!2528 (index!2325 lt!6920) (ite c!2530 (index!2324 lt!6904) (index!2327 lt!6904)))) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))) (and (bvsge (ite c!2521 (ite c!2524 (index!2325 lt!6901) (ite c!2527 (index!2324 lt!6902) (index!2327 lt!6902))) (ite c!2528 (index!2325 lt!6920) (ite c!2530 (index!2324 lt!6904) (index!2327 lt!6904)))) #b00000000000000000000000000000000) (bvslt (ite c!2521 (ite c!2524 (index!2325 lt!6901) (ite c!2527 (index!2324 lt!6902) (index!2327 lt!6902))) (ite c!2528 (index!2325 lt!6920) (ite c!2530 (index!2324 lt!6904) (index!2327 lt!6904)))) (bvadd (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000001))))))

(assert (=> bm!1439 d!3765))

(declare-fun b!21730 () Bool)

(declare-fun e!14135 () Bool)

(declare-fun e!14136 () Bool)

(assert (=> b!21730 (= e!14135 e!14136)))

(declare-fun lt!6969 () (_ BitVec 64))

(assert (=> b!21730 (= lt!6969 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000))))

(declare-fun lt!6968 () Unit!452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1231 (_ BitVec 64) (_ BitVec 32)) Unit!452)

(assert (=> b!21730 (= lt!6968 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3140 (v!1573 (_2!452 lt!6681))) lt!6969 #b00000000000000000000000000000000))))

(assert (=> b!21730 (arrayContainsKey!0 (_keys!3140 (v!1573 (_2!452 lt!6681))) lt!6969 #b00000000000000000000000000000000)))

(declare-fun lt!6967 () Unit!452)

(assert (=> b!21730 (= lt!6967 lt!6968)))

(declare-fun res!13895 () Bool)

(assert (=> b!21730 (= res!13895 (= (seekEntryOrOpen!0 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000) (_keys!3140 (v!1573 (_2!452 lt!6681))) (mask!4692 (v!1573 (_2!452 lt!6681)))) (Found!51 #b00000000000000000000000000000000)))))

(assert (=> b!21730 (=> (not res!13895) (not e!14136))))

(declare-fun b!21731 () Bool)

(declare-fun call!1474 () Bool)

(assert (=> b!21731 (= e!14135 call!1474)))

(declare-fun b!21732 () Bool)

(declare-fun e!14134 () Bool)

(assert (=> b!21732 (= e!14134 e!14135)))

(declare-fun c!2555 () Bool)

(assert (=> b!21732 (= c!2555 (validKeyInArray!0 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000)))))

(declare-fun b!21733 () Bool)

(assert (=> b!21733 (= e!14136 call!1474)))

(declare-fun d!3767 () Bool)

(declare-fun res!13896 () Bool)

(assert (=> d!3767 (=> res!13896 e!14134)))

(assert (=> d!3767 (= res!13896 (bvsge #b00000000000000000000000000000000 (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681))))))))

(assert (=> d!3767 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3140 (v!1573 (_2!452 lt!6681))) (mask!4692 (v!1573 (_2!452 lt!6681)))) e!14134)))

(declare-fun bm!1471 () Bool)

(assert (=> bm!1471 (= call!1474 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3140 (v!1573 (_2!452 lt!6681))) (mask!4692 (v!1573 (_2!452 lt!6681)))))))

(assert (= (and d!3767 (not res!13896)) b!21732))

(assert (= (and b!21732 c!2555) b!21730))

(assert (= (and b!21732 (not c!2555)) b!21731))

(assert (= (and b!21730 res!13895) b!21733))

(assert (= (or b!21733 b!21731) bm!1471))

(declare-fun m!15205 () Bool)

(assert (=> b!21730 m!15205))

(declare-fun m!15207 () Bool)

(assert (=> b!21730 m!15207))

(declare-fun m!15209 () Bool)

(assert (=> b!21730 m!15209))

(assert (=> b!21730 m!15205))

(declare-fun m!15211 () Bool)

(assert (=> b!21730 m!15211))

(assert (=> b!21732 m!15205))

(assert (=> b!21732 m!15205))

(declare-fun m!15213 () Bool)

(assert (=> b!21732 m!15213))

(declare-fun m!15215 () Bool)

(assert (=> bm!1471 m!15215))

(assert (=> b!21534 d!3767))

(declare-fun b!21742 () Bool)

(declare-fun res!13907 () Bool)

(declare-fun e!14139 () Bool)

(assert (=> b!21742 (=> (not res!13907) (not e!14139))))

(assert (=> b!21742 (= res!13907 (and (= (size!676 (_values!1708 (v!1573 (_2!452 lt!6681)))) (bvadd (mask!4692 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000001)) (= (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681)))) (size!676 (_values!1708 (v!1573 (_2!452 lt!6681))))) (bvsge (_size!134 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000000) (bvsle (_size!134 (v!1573 (_2!452 lt!6681))) (bvadd (mask!4692 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000001))))))

(declare-fun d!3769 () Bool)

(declare-fun res!13905 () Bool)

(assert (=> d!3769 (=> (not res!13905) (not e!14139))))

(assert (=> d!3769 (= res!13905 (validMask!0 (mask!4692 (v!1573 (_2!452 lt!6681)))))))

(assert (=> d!3769 (= (simpleValid!19 (v!1573 (_2!452 lt!6681))) e!14139)))

(declare-fun b!21744 () Bool)

(declare-fun res!13908 () Bool)

(assert (=> b!21744 (=> (not res!13908) (not e!14139))))

(declare-fun size!682 (LongMapFixedSize!186) (_ BitVec 32))

(assert (=> b!21744 (= res!13908 (= (size!682 (v!1573 (_2!452 lt!6681))) (bvadd (_size!134 (v!1573 (_2!452 lt!6681))) (bvsdiv (bvadd (extraKeys!1622 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!21743 () Bool)

(declare-fun res!13906 () Bool)

(assert (=> b!21743 (=> (not res!13906) (not e!14139))))

(assert (=> b!21743 (= res!13906 (bvsge (size!682 (v!1573 (_2!452 lt!6681))) (_size!134 (v!1573 (_2!452 lt!6681)))))))

(declare-fun b!21745 () Bool)

(assert (=> b!21745 (= e!14139 (and (bvsge (extraKeys!1622 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000000) (bvsle (extraKeys!1622 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000011) (bvsge (_vacant!134 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000000)))))

(assert (= (and d!3769 res!13905) b!21742))

(assert (= (and b!21742 res!13907) b!21743))

(assert (= (and b!21743 res!13906) b!21744))

(assert (= (and b!21744 res!13908) b!21745))

(declare-fun m!15217 () Bool)

(assert (=> d!3769 m!15217))

(declare-fun m!15219 () Bool)

(assert (=> b!21744 m!15219))

(assert (=> b!21743 m!15219))

(assert (=> d!3751 d!3769))

(declare-fun b!21746 () Bool)

(declare-fun e!14151 () Bool)

(declare-fun e!14141 () Bool)

(assert (=> b!21746 (= e!14151 e!14141)))

(declare-fun res!13913 () Bool)

(declare-fun call!1478 () Bool)

(assert (=> b!21746 (= res!13913 call!1478)))

(assert (=> b!21746 (=> (not res!13913) (not e!14141))))

(declare-fun bm!1472 () Bool)

(declare-fun call!1476 () ListLongMap!559)

(declare-fun call!1477 () ListLongMap!559)

(assert (=> bm!1472 (= call!1476 call!1477)))

(declare-fun lt!6985 () ListLongMap!559)

(declare-fun b!21747 () Bool)

(assert (=> b!21747 (= e!14141 (= (apply!28 lt!6985 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!21748 () Bool)

(declare-fun e!14145 () Bool)

(declare-fun e!14146 () Bool)

(assert (=> b!21748 (= e!14145 e!14146)))

(declare-fun c!2561 () Bool)

(assert (=> b!21748 (= c!2561 (not (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1473 () Bool)

(declare-fun call!1475 () ListLongMap!559)

(declare-fun call!1479 () ListLongMap!559)

(assert (=> bm!1473 (= call!1475 call!1479)))

(declare-fun b!21749 () Bool)

(declare-fun e!14148 () ListLongMap!559)

(assert (=> b!21749 (= e!14148 call!1475)))

(declare-fun d!3771 () Bool)

(assert (=> d!3771 e!14145))

(declare-fun res!13911 () Bool)

(assert (=> d!3771 (=> (not res!13911) (not e!14145))))

(assert (=> d!3771 (= res!13911 (or (bvsge #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))))

(declare-fun lt!6986 () ListLongMap!559)

(assert (=> d!3771 (= lt!6985 lt!6986)))

(declare-fun lt!6988 () Unit!452)

(declare-fun e!14142 () Unit!452)

(assert (=> d!3771 (= lt!6988 e!14142)))

(declare-fun c!2556 () Bool)

(declare-fun e!14152 () Bool)

(assert (=> d!3771 (= c!2556 e!14152)))

(declare-fun res!13916 () Bool)

(assert (=> d!3771 (=> (not res!13916) (not e!14152))))

(assert (=> d!3771 (= res!13916 (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun e!14144 () ListLongMap!559)

(assert (=> d!3771 (= lt!6986 e!14144)))

(declare-fun c!2557 () Bool)

(assert (=> d!3771 (= c!2557 (and (not (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3771 (validMask!0 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)))))

(assert (=> d!3771 (= (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6919 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) lt!6985)))

(declare-fun bm!1474 () Bool)

(declare-fun call!1480 () Bool)

(assert (=> bm!1474 (= call!1480 (contains!225 lt!6985 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21750 () Bool)

(assert (=> b!21750 (= e!14144 (+!42 call!1479 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun c!2560 () Bool)

(declare-fun call!1481 () ListLongMap!559)

(declare-fun bm!1475 () Bool)

(assert (=> bm!1475 (= call!1479 (+!42 (ite c!2557 call!1481 (ite c!2560 call!1477 call!1476)) (ite (or c!2557 c!2560) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))))))))

(declare-fun b!21751 () Bool)

(declare-fun res!13915 () Bool)

(assert (=> b!21751 (=> (not res!13915) (not e!14145))))

(declare-fun e!14147 () Bool)

(assert (=> b!21751 (= res!13915 e!14147)))

(declare-fun res!13910 () Bool)

(assert (=> b!21751 (=> res!13910 e!14147)))

(declare-fun e!14150 () Bool)

(assert (=> b!21751 (= res!13910 (not e!14150))))

(declare-fun res!13909 () Bool)

(assert (=> b!21751 (=> (not res!13909) (not e!14150))))

(assert (=> b!21751 (= res!13909 (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun e!14140 () Bool)

(declare-fun b!21752 () Bool)

(assert (=> b!21752 (= e!14140 (= (apply!28 lt!6985 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun e!14149 () Bool)

(declare-fun b!21753 () Bool)

(assert (=> b!21753 (= e!14149 (= (apply!28 lt!6985 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000)) (get!377 (select (arr!583 lt!6919) #b00000000000000000000000000000000) (dynLambda!141 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!676 lt!6919)))))

(assert (=> b!21753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun b!21754 () Bool)

(declare-fun e!14143 () ListLongMap!559)

(assert (=> b!21754 (= e!14143 call!1475)))

(declare-fun b!21755 () Bool)

(declare-fun res!13912 () Bool)

(assert (=> b!21755 (=> (not res!13912) (not e!14145))))

(assert (=> b!21755 (= res!13912 e!14151)))

(declare-fun c!2559 () Bool)

(assert (=> b!21755 (= c!2559 (not (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!21756 () Bool)

(assert (=> b!21756 (= e!14143 call!1476)))

(declare-fun b!21757 () Bool)

(assert (=> b!21757 (= e!14146 e!14140)))

(declare-fun res!13917 () Bool)

(assert (=> b!21757 (= res!13917 call!1480)))

(assert (=> b!21757 (=> (not res!13917) (not e!14140))))

(declare-fun b!21758 () Bool)

(declare-fun c!2558 () Bool)

(assert (=> b!21758 (= c!2558 (and (not (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21758 (= e!14148 e!14143)))

(declare-fun b!21759 () Bool)

(assert (=> b!21759 (= e!14150 (validKeyInArray!0 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000)))))

(declare-fun bm!1476 () Bool)

(assert (=> bm!1476 (= call!1477 call!1481)))

(declare-fun b!21760 () Bool)

(assert (=> b!21760 (= e!14146 (not call!1480))))

(declare-fun b!21761 () Bool)

(assert (=> b!21761 (= e!14152 (validKeyInArray!0 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000)))))

(declare-fun b!21762 () Bool)

(declare-fun lt!6984 () Unit!452)

(assert (=> b!21762 (= e!14142 lt!6984)))

(declare-fun lt!6982 () ListLongMap!559)

(assert (=> b!21762 (= lt!6982 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6919 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!6975 () (_ BitVec 64))

(assert (=> b!21762 (= lt!6975 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6972 () (_ BitVec 64))

(assert (=> b!21762 (= lt!6972 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000))))

(declare-fun lt!6974 () Unit!452)

(assert (=> b!21762 (= lt!6974 (addStillContains!13 lt!6982 lt!6975 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6972))))

(assert (=> b!21762 (contains!225 (+!42 lt!6982 (tuple2!901 lt!6975 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)))) lt!6972)))

(declare-fun lt!6979 () Unit!452)

(assert (=> b!21762 (= lt!6979 lt!6974)))

(declare-fun lt!6983 () ListLongMap!559)

(assert (=> b!21762 (= lt!6983 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6919 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!6976 () (_ BitVec 64))

(assert (=> b!21762 (= lt!6976 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6970 () (_ BitVec 64))

(assert (=> b!21762 (= lt!6970 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000))))

(declare-fun lt!6991 () Unit!452)

(assert (=> b!21762 (= lt!6991 (addApplyDifferent!13 lt!6983 lt!6976 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6970))))

(assert (=> b!21762 (= (apply!28 (+!42 lt!6983 (tuple2!901 lt!6976 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)))) lt!6970) (apply!28 lt!6983 lt!6970))))

(declare-fun lt!6980 () Unit!452)

(assert (=> b!21762 (= lt!6980 lt!6991)))

(declare-fun lt!6990 () ListLongMap!559)

(assert (=> b!21762 (= lt!6990 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6919 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!6989 () (_ BitVec 64))

(assert (=> b!21762 (= lt!6989 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6981 () (_ BitVec 64))

(assert (=> b!21762 (= lt!6981 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000))))

(declare-fun lt!6973 () Unit!452)

(assert (=> b!21762 (= lt!6973 (addApplyDifferent!13 lt!6990 lt!6989 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6981))))

(assert (=> b!21762 (= (apply!28 (+!42 lt!6990 (tuple2!901 lt!6989 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)))) lt!6981) (apply!28 lt!6990 lt!6981))))

(declare-fun lt!6977 () Unit!452)

(assert (=> b!21762 (= lt!6977 lt!6973)))

(declare-fun lt!6987 () ListLongMap!559)

(assert (=> b!21762 (= lt!6987 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6919 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!6978 () (_ BitVec 64))

(assert (=> b!21762 (= lt!6978 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6971 () (_ BitVec 64))

(assert (=> b!21762 (= lt!6971 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000))))

(assert (=> b!21762 (= lt!6984 (addApplyDifferent!13 lt!6987 lt!6978 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6971))))

(assert (=> b!21762 (= (apply!28 (+!42 lt!6987 (tuple2!901 lt!6978 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)))) lt!6971) (apply!28 lt!6987 lt!6971))))

(declare-fun b!21763 () Bool)

(declare-fun Unit!464 () Unit!452)

(assert (=> b!21763 (= e!14142 Unit!464)))

(declare-fun bm!1477 () Bool)

(assert (=> bm!1477 (= call!1481 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6919 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!21764 () Bool)

(assert (=> b!21764 (= e!14151 (not call!1478))))

(declare-fun b!21765 () Bool)

(assert (=> b!21765 (= e!14147 e!14149)))

(declare-fun res!13914 () Bool)

(assert (=> b!21765 (=> (not res!13914) (not e!14149))))

(assert (=> b!21765 (= res!13914 (contains!225 lt!6985 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000)))))

(assert (=> b!21765 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun b!21766 () Bool)

(assert (=> b!21766 (= e!14144 e!14148)))

(assert (=> b!21766 (= c!2560 (and (not (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1478 () Bool)

(assert (=> bm!1478 (= call!1478 (contains!225 lt!6985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3771 c!2557) b!21750))

(assert (= (and d!3771 (not c!2557)) b!21766))

(assert (= (and b!21766 c!2560) b!21749))

(assert (= (and b!21766 (not c!2560)) b!21758))

(assert (= (and b!21758 c!2558) b!21754))

(assert (= (and b!21758 (not c!2558)) b!21756))

(assert (= (or b!21754 b!21756) bm!1472))

(assert (= (or b!21749 bm!1472) bm!1476))

(assert (= (or b!21749 b!21754) bm!1473))

(assert (= (or b!21750 bm!1476) bm!1477))

(assert (= (or b!21750 bm!1473) bm!1475))

(assert (= (and d!3771 res!13916) b!21761))

(assert (= (and d!3771 c!2556) b!21762))

(assert (= (and d!3771 (not c!2556)) b!21763))

(assert (= (and d!3771 res!13911) b!21751))

(assert (= (and b!21751 res!13909) b!21759))

(assert (= (and b!21751 (not res!13910)) b!21765))

(assert (= (and b!21765 res!13914) b!21753))

(assert (= (and b!21751 res!13915) b!21755))

(assert (= (and b!21755 c!2559) b!21746))

(assert (= (and b!21755 (not c!2559)) b!21764))

(assert (= (and b!21746 res!13913) b!21747))

(assert (= (or b!21746 b!21764) bm!1478))

(assert (= (and b!21755 res!13912) b!21748))

(assert (= (and b!21748 c!2561) b!21757))

(assert (= (and b!21748 (not c!2561)) b!21760))

(assert (= (and b!21757 res!13917) b!21752))

(assert (= (or b!21757 b!21760) bm!1474))

(declare-fun b_lambda!1533 () Bool)

(assert (=> (not b_lambda!1533) (not b!21753)))

(declare-fun t!3224 () Bool)

(declare-fun tb!647 () Bool)

(assert (=> (and b!21366 (= (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) t!3224) tb!647))

(declare-fun result!1075 () Bool)

(assert (=> tb!647 (= result!1075 tp_is_empty!999)))

(assert (=> b!21753 t!3224))

(declare-fun b_and!1433 () Bool)

(assert (= b_and!1431 (and (=> t!3224 result!1075) b_and!1433)))

(declare-fun m!15221 () Bool)

(assert (=> b!21759 m!15221))

(assert (=> b!21759 m!15221))

(declare-fun m!15223 () Bool)

(assert (=> b!21759 m!15223))

(declare-fun m!15225 () Bool)

(assert (=> bm!1477 m!15225))

(declare-fun m!15227 () Bool)

(assert (=> b!21762 m!15227))

(assert (=> b!21762 m!15221))

(declare-fun m!15229 () Bool)

(assert (=> b!21762 m!15229))

(declare-fun m!15231 () Bool)

(assert (=> b!21762 m!15231))

(declare-fun m!15233 () Bool)

(assert (=> b!21762 m!15233))

(declare-fun m!15235 () Bool)

(assert (=> b!21762 m!15235))

(assert (=> b!21762 m!15229))

(declare-fun m!15237 () Bool)

(assert (=> b!21762 m!15237))

(declare-fun m!15239 () Bool)

(assert (=> b!21762 m!15239))

(declare-fun m!15241 () Bool)

(assert (=> b!21762 m!15241))

(assert (=> b!21762 m!15225))

(declare-fun m!15243 () Bool)

(assert (=> b!21762 m!15243))

(declare-fun m!15245 () Bool)

(assert (=> b!21762 m!15245))

(declare-fun m!15247 () Bool)

(assert (=> b!21762 m!15247))

(declare-fun m!15249 () Bool)

(assert (=> b!21762 m!15249))

(assert (=> b!21762 m!15249))

(declare-fun m!15251 () Bool)

(assert (=> b!21762 m!15251))

(assert (=> b!21762 m!15243))

(declare-fun m!15253 () Bool)

(assert (=> b!21762 m!15253))

(assert (=> b!21762 m!15235))

(declare-fun m!15255 () Bool)

(assert (=> b!21762 m!15255))

(assert (=> b!21765 m!15221))

(assert (=> b!21765 m!15221))

(declare-fun m!15257 () Bool)

(assert (=> b!21765 m!15257))

(declare-fun m!15259 () Bool)

(assert (=> bm!1475 m!15259))

(declare-fun m!15261 () Bool)

(assert (=> b!21750 m!15261))

(assert (=> b!21761 m!15221))

(assert (=> b!21761 m!15221))

(assert (=> b!21761 m!15223))

(declare-fun m!15263 () Bool)

(assert (=> bm!1474 m!15263))

(declare-fun m!15265 () Bool)

(assert (=> b!21752 m!15265))

(assert (=> b!21753 m!15221))

(assert (=> b!21753 m!15221))

(declare-fun m!15267 () Bool)

(assert (=> b!21753 m!15267))

(declare-fun m!15269 () Bool)

(assert (=> b!21753 m!15269))

(declare-fun m!15271 () Bool)

(assert (=> b!21753 m!15271))

(declare-fun m!15273 () Bool)

(assert (=> b!21753 m!15273))

(assert (=> b!21753 m!15271))

(assert (=> b!21753 m!15269))

(declare-fun m!15275 () Bool)

(assert (=> b!21747 m!15275))

(declare-fun m!15277 () Bool)

(assert (=> bm!1478 m!15277))

(declare-fun m!15279 () Bool)

(assert (=> d!3771 m!15279))

(assert (=> b!21654 d!3771))

(declare-fun d!3773 () Bool)

(assert (=> d!3773 (= (+!42 (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6924 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!6994 () Unit!452)

(declare-fun choose!194 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 V!1157 Int) Unit!452)

(assert (=> d!3773 (= lt!6994 (choose!194 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6924 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(assert (=> d!3773 (validMask!0 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)))))

(assert (=> d!3773 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!7 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6924 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) lt!6994)))

(declare-fun bs!912 () Bool)

(assert (= bs!912 d!3773))

(declare-fun m!15281 () Bool)

(assert (=> bs!912 m!15281))

(declare-fun m!15283 () Bool)

(assert (=> bs!912 m!15283))

(assert (=> bs!912 m!15101))

(assert (=> bs!912 m!15101))

(declare-fun m!15285 () Bool)

(assert (=> bs!912 m!15285))

(assert (=> bs!912 m!15279))

(assert (=> b!21627 d!3773))

(assert (=> d!3737 d!3755))

(declare-fun b!21783 () Bool)

(declare-fun e!14161 () Bool)

(declare-fun call!1487 () Bool)

(assert (=> b!21783 (= e!14161 (not call!1487))))

(declare-fun b!21784 () Bool)

(declare-fun res!13926 () Bool)

(declare-fun e!14163 () Bool)

(assert (=> b!21784 (=> (not res!13926) (not e!14163))))

(declare-fun lt!6999 () SeekEntryResult!51)

(assert (=> b!21784 (= res!13926 (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2327 lt!6999)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21784 (and (bvsge (index!2327 lt!6999) #b00000000000000000000000000000000) (bvslt (index!2327 lt!6999) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun b!21785 () Bool)

(assert (=> b!21785 (and (bvsge (index!2324 lt!6999) #b00000000000000000000000000000000) (bvslt (index!2324 lt!6999) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun res!13928 () Bool)

(assert (=> b!21785 (= res!13928 (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2324 lt!6999)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21785 (=> (not res!13928) (not e!14161))))

(declare-fun b!21787 () Bool)

(declare-fun e!14162 () Bool)

(assert (=> b!21787 (= e!14162 e!14161)))

(declare-fun res!13927 () Bool)

(declare-fun call!1486 () Bool)

(assert (=> b!21787 (= res!13927 call!1486)))

(assert (=> b!21787 (=> (not res!13927) (not e!14161))))

(declare-fun b!21788 () Bool)

(assert (=> b!21788 (= e!14163 (not call!1487))))

(declare-fun c!2566 () Bool)

(declare-fun bm!1483 () Bool)

(assert (=> bm!1483 (= call!1486 (inRange!0 (ite c!2566 (index!2324 lt!6999) (index!2327 lt!6999)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!21789 () Bool)

(declare-fun e!14164 () Bool)

(assert (=> b!21789 (= e!14164 ((_ is Undefined!51) lt!6999))))

(declare-fun d!3775 () Bool)

(assert (=> d!3775 e!14162))

(assert (=> d!3775 (= c!2566 ((_ is MissingZero!51) lt!6999))))

(assert (=> d!3775 (= lt!6999 (seekEntryOrOpen!0 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!7000 () Unit!452)

(declare-fun choose!195 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 (_ BitVec 64) Int) Unit!452)

(assert (=> d!3775 (= lt!7000 (choose!195 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(assert (=> d!3775 (validMask!0 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)))))

(assert (=> d!3775 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) lt!7000)))

(declare-fun b!21786 () Bool)

(declare-fun res!13929 () Bool)

(assert (=> b!21786 (=> (not res!13929) (not e!14163))))

(assert (=> b!21786 (= res!13929 call!1486)))

(assert (=> b!21786 (= e!14164 e!14163)))

(declare-fun b!21790 () Bool)

(assert (=> b!21790 (= e!14162 e!14164)))

(declare-fun c!2567 () Bool)

(assert (=> b!21790 (= c!2567 ((_ is MissingVacant!51) lt!6999))))

(declare-fun bm!1484 () Bool)

(assert (=> bm!1484 (= call!1487 (arrayContainsKey!0 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(assert (= (and d!3775 c!2566) b!21787))

(assert (= (and d!3775 (not c!2566)) b!21790))

(assert (= (and b!21787 res!13927) b!21785))

(assert (= (and b!21785 res!13928) b!21783))

(assert (= (and b!21790 c!2567) b!21786))

(assert (= (and b!21790 (not c!2567)) b!21789))

(assert (= (and b!21786 res!13929) b!21784))

(assert (= (and b!21784 res!13926) b!21788))

(assert (= (or b!21787 b!21786) bm!1483))

(assert (= (or b!21783 b!21788) bm!1484))

(declare-fun m!15287 () Bool)

(assert (=> b!21785 m!15287))

(assert (=> bm!1484 m!15089))

(declare-fun m!15289 () Bool)

(assert (=> b!21784 m!15289))

(assert (=> d!3775 m!15091))

(declare-fun m!15291 () Bool)

(assert (=> d!3775 m!15291))

(assert (=> d!3775 m!15279))

(declare-fun m!15293 () Bool)

(assert (=> bm!1483 m!15293))

(assert (=> bm!1430 d!3775))

(declare-fun d!3777 () Bool)

(declare-fun e!14184 () Bool)

(assert (=> d!3777 e!14184))

(declare-fun res!13952 () Bool)

(assert (=> d!3777 (=> (not res!13952) (not e!14184))))

(declare-fun lt!7086 () tuple2!896)

(assert (=> d!3777 (= res!13952 (_1!451 lt!7086))))

(assert (=> d!3777 (= lt!7086 (tuple2!897 true (LongMapFixedSize!187 (defaultEntry!1719 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) (bvadd (_size!134 lt!6678) #b00000000000000000000000000000001) (array!1232 (store (arr!584 (_keys!3140 lt!6678)) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!677 (_keys!3140 lt!6678))) (array!1230 (store (arr!583 (_values!1708 lt!6678)) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) (ValueCellFull!300 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (size!676 (_values!1708 lt!6678))) (_vacant!134 lt!6678))))))

(declare-fun lt!7085 () Unit!452)

(declare-fun lt!7087 () Unit!452)

(assert (=> d!3777 (= lt!7085 lt!7087)))

(declare-fun lt!7090 () array!1231)

(declare-fun lt!7068 () array!1229)

(assert (=> d!3777 (contains!225 (getCurrentListMap!126 lt!7090 lt!7068 (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)) (select (store (arr!584 (_keys!3140 lt!6678)) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945))))))

(assert (=> d!3777 (= lt!7087 (lemmaValidKeyInArrayIsInListMap!7 lt!7090 lt!7068 (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) (defaultEntry!1719 lt!6678)))))

(assert (=> d!3777 (= lt!7068 (array!1230 (store (arr!583 (_values!1708 lt!6678)) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) (ValueCellFull!300 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (size!676 (_values!1708 lt!6678))))))

(assert (=> d!3777 (= lt!7090 (array!1232 (store (arr!584 (_keys!3140 lt!6678)) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!677 (_keys!3140 lt!6678))))))

(declare-fun lt!7062 () Unit!452)

(declare-fun lt!7066 () Unit!452)

(assert (=> d!3777 (= lt!7062 lt!7066)))

(declare-fun lt!7064 () array!1231)

(assert (=> d!3777 (= (arrayCountValidKeys!0 lt!7064 (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) (bvadd (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!1231 (_ BitVec 32)) Unit!452)

(assert (=> d!3777 (= lt!7066 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!7064 (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945))))))

(assert (=> d!3777 (= lt!7064 (array!1232 (store (arr!584 (_keys!3140 lt!6678)) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!677 (_keys!3140 lt!6678))))))

(declare-fun lt!7063 () Unit!452)

(declare-fun lt!7082 () Unit!452)

(assert (=> d!3777 (= lt!7063 lt!7082)))

(declare-fun lt!7078 () array!1231)

(assert (=> d!3777 (arrayContainsKey!0 lt!7078 #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!3777 (= lt!7082 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!7078 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945))))))

(assert (=> d!3777 (= lt!7078 (array!1232 (store (arr!584 (_keys!3140 lt!6678)) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!677 (_keys!3140 lt!6678))))))

(declare-fun lt!7070 () Unit!452)

(declare-fun lt!7072 () Unit!452)

(assert (=> d!3777 (= lt!7070 lt!7072)))

(assert (=> d!3777 (= (+!42 (getCurrentListMap!126 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (getCurrentListMap!126 (array!1232 (store (arr!584 (_keys!3140 lt!6678)) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!677 (_keys!3140 lt!6678))) (array!1230 (store (arr!583 (_values!1708 lt!6678)) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) (ValueCellFull!300 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (size!676 (_values!1708 lt!6678))) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!2 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 (_ BitVec 32) (_ BitVec 64) V!1157 Int) Unit!452)

(assert (=> d!3777 (= lt!7072 (lemmaAddValidKeyToArrayThenAddPairToListMap!2 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (defaultEntry!1719 lt!6678)))))

(declare-fun lt!7077 () Unit!452)

(declare-fun lt!7074 () Unit!452)

(assert (=> d!3777 (= lt!7077 lt!7074)))

(assert (=> d!3777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!1232 (store (arr!584 (_keys!3140 lt!6678)) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!677 (_keys!3140 lt!6678))) (mask!4692 lt!6678))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!1231 (_ BitVec 32) (_ BitVec 32)) Unit!452)

(assert (=> d!3777 (= lt!7074 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3140 lt!6678) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) (mask!4692 lt!6678)))))

(declare-fun lt!7083 () Unit!452)

(declare-fun lt!7089 () Unit!452)

(assert (=> d!3777 (= lt!7083 lt!7089)))

(assert (=> d!3777 (= (arrayCountValidKeys!0 (array!1232 (store (arr!584 (_keys!3140 lt!6678)) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!677 (_keys!3140 lt!6678))) #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))) (bvadd (arrayCountValidKeys!0 (_keys!3140 lt!6678) #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!1231 (_ BitVec 32) (_ BitVec 64)) Unit!452)

(assert (=> d!3777 (= lt!7089 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3140 lt!6678) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!7073 () Unit!452)

(declare-fun lt!7065 () Unit!452)

(assert (=> d!3777 (= lt!7073 lt!7065)))

(declare-fun lt!7088 () List!563)

(declare-fun lt!7076 () (_ BitVec 32))

(assert (=> d!3777 (arrayNoDuplicates!0 (array!1232 (store (arr!584 (_keys!3140 lt!6678)) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!677 (_keys!3140 lt!6678))) lt!7076 lt!7088)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!1231 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!563) Unit!452)

(assert (=> d!3777 (= lt!7065 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3140 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945)) lt!7076 lt!7088))))

(assert (=> d!3777 (= lt!7088 Nil!560)))

(assert (=> d!3777 (= lt!7076 #b00000000000000000000000000000000)))

(declare-fun lt!7075 () Unit!452)

(declare-fun e!14182 () Unit!452)

(assert (=> d!3777 (= lt!7075 e!14182)))

(declare-fun c!2577 () Bool)

(assert (=> d!3777 (= c!2577 (arrayContainsKey!0 (_keys!3140 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun lt!7069 () Unit!452)

(declare-fun e!14183 () Unit!452)

(assert (=> d!3777 (= lt!7069 e!14183)))

(declare-fun c!2579 () Bool)

(assert (=> d!3777 (= c!2579 (contains!225 (getCurrentListMap!126 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3777 (valid!93 lt!6678)))

(assert (=> d!3777 (= (updateHelperNewKey!7 lt!6678 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2531 (index!2327 lt!6945) (index!2324 lt!6945))) lt!7086)))

(declare-fun b!21825 () Bool)

(declare-fun res!13955 () Bool)

(declare-fun e!14181 () Bool)

(assert (=> b!21825 (=> (not res!13955) (not e!14181))))

(declare-fun lt!7079 () SeekEntryResult!51)

(assert (=> b!21825 (= res!13955 (= (select (arr!584 (_keys!3140 lt!6678)) (index!2324 lt!7079)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21826 () Bool)

(declare-fun Unit!465 () Unit!452)

(assert (=> b!21826 (= e!14182 Unit!465)))

(declare-fun bm!1493 () Bool)

(declare-fun call!1499 () Bool)

(assert (=> bm!1493 (= call!1499 (arrayContainsKey!0 (_keys!3140 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun bm!1494 () Bool)

(declare-fun call!1496 () Bool)

(declare-fun call!1498 () Bool)

(assert (=> bm!1494 (= call!1496 call!1498)))

(declare-fun bm!1495 () Bool)

(declare-fun c!2576 () Bool)

(declare-fun lt!7071 () SeekEntryResult!51)

(assert (=> bm!1495 (= call!1498 (inRange!0 (ite c!2579 (index!2325 lt!7071) (ite c!2576 (index!2324 lt!7079) (index!2327 lt!7079))) (mask!4692 lt!6678)))))

(declare-fun b!21827 () Bool)

(declare-fun c!2578 () Bool)

(assert (=> b!21827 (= c!2578 ((_ is MissingVacant!51) lt!7079))))

(declare-fun e!14188 () Bool)

(declare-fun e!14185 () Bool)

(assert (=> b!21827 (= e!14188 e!14185)))

(declare-fun b!21828 () Bool)

(assert (=> b!21828 (= e!14185 ((_ is Undefined!51) lt!7079))))

(declare-fun b!21829 () Bool)

(declare-fun Unit!466 () Unit!452)

(assert (=> b!21829 (= e!14183 Unit!466)))

(declare-fun lt!7080 () Unit!452)

(assert (=> b!21829 (= lt!7080 (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun call!1497 () SeekEntryResult!51)

(assert (=> b!21829 (= lt!7071 call!1497)))

(declare-fun res!13950 () Bool)

(assert (=> b!21829 (= res!13950 ((_ is Found!51) lt!7071))))

(declare-fun e!14186 () Bool)

(assert (=> b!21829 (=> (not res!13950) (not e!14186))))

(assert (=> b!21829 e!14186))

(declare-fun lt!7067 () Unit!452)

(assert (=> b!21829 (= lt!7067 lt!7080)))

(assert (=> b!21829 false))

(declare-fun b!21830 () Bool)

(assert (=> b!21830 (= e!14181 (not call!1499))))

(declare-fun b!21831 () Bool)

(declare-fun e!14187 () Bool)

(assert (=> b!21831 (= e!14187 (not call!1499))))

(declare-fun b!21832 () Bool)

(declare-fun res!13954 () Bool)

(assert (=> b!21832 (=> (not res!13954) (not e!14184))))

(assert (=> b!21832 (= res!13954 (valid!93 (_2!451 lt!7086)))))

(declare-fun b!21833 () Bool)

(declare-fun res!13951 () Bool)

(assert (=> b!21833 (= res!13951 call!1498)))

(assert (=> b!21833 (=> (not res!13951) (not e!14186))))

(declare-fun b!21834 () Bool)

(assert (=> b!21834 (= e!14184 (= (map!395 (_2!451 lt!7086)) (+!42 (map!395 lt!6678) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(declare-fun b!21835 () Bool)

(assert (=> b!21835 (= e!14186 (= (select (arr!584 (_keys!3140 lt!6678)) (index!2325 lt!7071)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21836 () Bool)

(declare-fun res!13956 () Bool)

(assert (=> b!21836 (=> (not res!13956) (not e!14184))))

(assert (=> b!21836 (= res!13956 (contains!225 (map!395 (_2!451 lt!7086)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21837 () Bool)

(declare-fun res!13953 () Bool)

(assert (=> b!21837 (= res!13953 (= (select (arr!584 (_keys!3140 lt!6678)) (index!2327 lt!7079)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21837 (=> (not res!13953) (not e!14187))))

(declare-fun bm!1496 () Bool)

(assert (=> bm!1496 (= call!1497 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3140 lt!6678) (mask!4692 lt!6678)))))

(declare-fun b!21838 () Bool)

(declare-fun Unit!467 () Unit!452)

(assert (=> b!21838 (= e!14182 Unit!467)))

(declare-fun lt!7084 () Unit!452)

(declare-fun lemmaArrayContainsKeyThenInListMap!2 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 (_ BitVec 64) (_ BitVec 32) Int) Unit!452)

(assert (=> b!21838 (= lt!7084 (lemmaArrayContainsKeyThenInListMap!2 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(assert (=> b!21838 (contains!225 (getCurrentListMap!126 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7081 () Unit!452)

(assert (=> b!21838 (= lt!7081 lt!7084)))

(assert (=> b!21838 false))

(declare-fun b!21839 () Bool)

(declare-fun lt!7061 () Unit!452)

(assert (=> b!21839 (= e!14183 lt!7061)))

(assert (=> b!21839 (= lt!7061 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(assert (=> b!21839 (= lt!7079 call!1497)))

(assert (=> b!21839 (= c!2576 ((_ is MissingZero!51) lt!7079))))

(assert (=> b!21839 e!14188))

(declare-fun b!21840 () Bool)

(declare-fun res!13949 () Bool)

(assert (=> b!21840 (=> (not res!13949) (not e!14181))))

(assert (=> b!21840 (= res!13949 call!1496)))

(assert (=> b!21840 (= e!14188 e!14181)))

(declare-fun b!21841 () Bool)

(assert (=> b!21841 (= e!14185 e!14187)))

(declare-fun res!13948 () Bool)

(assert (=> b!21841 (= res!13948 call!1496)))

(assert (=> b!21841 (=> (not res!13948) (not e!14187))))

(assert (= (and d!3777 c!2579) b!21829))

(assert (= (and d!3777 (not c!2579)) b!21839))

(assert (= (and b!21829 res!13950) b!21833))

(assert (= (and b!21833 res!13951) b!21835))

(assert (= (and b!21839 c!2576) b!21840))

(assert (= (and b!21839 (not c!2576)) b!21827))

(assert (= (and b!21840 res!13949) b!21825))

(assert (= (and b!21825 res!13955) b!21830))

(assert (= (and b!21827 c!2578) b!21841))

(assert (= (and b!21827 (not c!2578)) b!21828))

(assert (= (and b!21841 res!13948) b!21837))

(assert (= (and b!21837 res!13953) b!21831))

(assert (= (or b!21840 b!21841) bm!1494))

(assert (= (or b!21830 b!21831) bm!1493))

(assert (= (or b!21833 bm!1494) bm!1495))

(assert (= (or b!21829 b!21839) bm!1496))

(assert (= (and d!3777 c!2577) b!21838))

(assert (= (and d!3777 (not c!2577)) b!21826))

(assert (= (and d!3777 res!13952) b!21832))

(assert (= (and b!21832 res!13954) b!21836))

(assert (= (and b!21836 res!13956) b!21834))

(declare-fun m!15295 () Bool)

(assert (=> bm!1495 m!15295))

(assert (=> bm!1496 m!15151))

(declare-fun m!15297 () Bool)

(assert (=> b!21838 m!15297))

(assert (=> b!21838 m!15161))

(assert (=> b!21838 m!15161))

(declare-fun m!15299 () Bool)

(assert (=> b!21838 m!15299))

(declare-fun m!15301 () Bool)

(assert (=> b!21832 m!15301))

(declare-fun m!15303 () Bool)

(assert (=> d!3777 m!15303))

(declare-fun m!15305 () Bool)

(assert (=> d!3777 m!15305))

(declare-fun m!15307 () Bool)

(assert (=> d!3777 m!15307))

(declare-fun m!15309 () Bool)

(assert (=> d!3777 m!15309))

(declare-fun m!15311 () Bool)

(assert (=> d!3777 m!15311))

(declare-fun m!15313 () Bool)

(assert (=> d!3777 m!15313))

(declare-fun m!15315 () Bool)

(assert (=> d!3777 m!15315))

(declare-fun m!15317 () Bool)

(assert (=> d!3777 m!15317))

(assert (=> d!3777 m!15317))

(assert (=> d!3777 m!15307))

(declare-fun m!15319 () Bool)

(assert (=> d!3777 m!15319))

(declare-fun m!15321 () Bool)

(assert (=> d!3777 m!15321))

(declare-fun m!15323 () Bool)

(assert (=> d!3777 m!15323))

(declare-fun m!15325 () Bool)

(assert (=> d!3777 m!15325))

(declare-fun m!15327 () Bool)

(assert (=> d!3777 m!15327))

(assert (=> d!3777 m!15161))

(declare-fun m!15329 () Bool)

(assert (=> d!3777 m!15329))

(declare-fun m!15331 () Bool)

(assert (=> d!3777 m!15331))

(assert (=> d!3777 m!15161))

(assert (=> d!3777 m!15299))

(assert (=> d!3777 m!15149))

(assert (=> d!3777 m!15135))

(declare-fun m!15333 () Bool)

(assert (=> d!3777 m!15333))

(declare-fun m!15335 () Bool)

(assert (=> d!3777 m!15335))

(declare-fun m!15337 () Bool)

(assert (=> d!3777 m!15337))

(assert (=> d!3777 m!15161))

(declare-fun m!15339 () Bool)

(assert (=> d!3777 m!15339))

(declare-fun m!15341 () Bool)

(assert (=> d!3777 m!15341))

(declare-fun m!15343 () Bool)

(assert (=> b!21837 m!15343))

(declare-fun m!15345 () Bool)

(assert (=> b!21836 m!15345))

(assert (=> b!21836 m!15345))

(declare-fun m!15347 () Bool)

(assert (=> b!21836 m!15347))

(assert (=> b!21834 m!15345))

(assert (=> b!21834 m!15131))

(assert (=> b!21834 m!15131))

(declare-fun m!15349 () Bool)

(assert (=> b!21834 m!15349))

(assert (=> b!21829 m!15183))

(declare-fun m!15351 () Bool)

(assert (=> b!21825 m!15351))

(assert (=> b!21839 m!15145))

(declare-fun m!15353 () Bool)

(assert (=> b!21835 m!15353))

(assert (=> bm!1493 m!15149))

(assert (=> bm!1464 d!3777))

(declare-fun d!3779 () Bool)

(declare-fun e!14191 () Bool)

(assert (=> d!3779 e!14191))

(declare-fun res!13962 () Bool)

(assert (=> d!3779 (=> (not res!13962) (not e!14191))))

(declare-fun lt!7100 () ListLongMap!559)

(assert (=> d!3779 (= res!13962 (contains!225 lt!7100 (_1!453 (ite c!2532 (ite c!2538 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))))))))

(declare-fun lt!7101 () List!561)

(assert (=> d!3779 (= lt!7100 (ListLongMap!560 lt!7101))))

(declare-fun lt!7102 () Unit!452)

(declare-fun lt!7099 () Unit!452)

(assert (=> d!3779 (= lt!7102 lt!7099)))

(declare-datatypes ((Option!66 0))(
  ( (Some!65 (v!1580 V!1157)) (None!64) )
))
(declare-fun getValueByKey!60 (List!561 (_ BitVec 64)) Option!66)

(assert (=> d!3779 (= (getValueByKey!60 lt!7101 (_1!453 (ite c!2532 (ite c!2538 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))))) (Some!65 (_2!453 (ite c!2532 (ite c!2538 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!17 (List!561 (_ BitVec 64) V!1157) Unit!452)

(assert (=> d!3779 (= lt!7099 (lemmaContainsTupThenGetReturnValue!17 lt!7101 (_1!453 (ite c!2532 (ite c!2538 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))) (_2!453 (ite c!2532 (ite c!2538 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))))))))

(declare-fun insertStrictlySorted!17 (List!561 (_ BitVec 64) V!1157) List!561)

(assert (=> d!3779 (= lt!7101 (insertStrictlySorted!17 (toList!295 (ite c!2532 call!1468 call!1454)) (_1!453 (ite c!2532 (ite c!2538 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))) (_2!453 (ite c!2532 (ite c!2538 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))))))))

(assert (=> d!3779 (= (+!42 (ite c!2532 call!1468 call!1454) (ite c!2532 (ite c!2538 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))) lt!7100)))

(declare-fun b!21846 () Bool)

(declare-fun res!13961 () Bool)

(assert (=> b!21846 (=> (not res!13961) (not e!14191))))

(assert (=> b!21846 (= res!13961 (= (getValueByKey!60 (toList!295 lt!7100) (_1!453 (ite c!2532 (ite c!2538 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))))) (Some!65 (_2!453 (ite c!2532 (ite c!2538 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))))

(declare-fun b!21847 () Bool)

(declare-fun contains!226 (List!561 tuple2!900) Bool)

(assert (=> b!21847 (= e!14191 (contains!226 (toList!295 lt!7100) (ite c!2532 (ite c!2538 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (= (and d!3779 res!13962) b!21846))

(assert (= (and b!21846 res!13961) b!21847))

(declare-fun m!15355 () Bool)

(assert (=> d!3779 m!15355))

(declare-fun m!15357 () Bool)

(assert (=> d!3779 m!15357))

(declare-fun m!15359 () Bool)

(assert (=> d!3779 m!15359))

(declare-fun m!15361 () Bool)

(assert (=> d!3779 m!15361))

(declare-fun m!15363 () Bool)

(assert (=> b!21846 m!15363))

(declare-fun m!15365 () Bool)

(assert (=> b!21847 m!15365))

(assert (=> bm!1461 d!3779))

(declare-fun d!3781 () Bool)

(assert (=> d!3781 (= (+!42 (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6905 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!7105 () Unit!452)

(declare-fun choose!196 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 V!1157 Int) Unit!452)

(assert (=> d!3781 (= lt!7105 (choose!196 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6905 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(assert (=> d!3781 (validMask!0 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)))))

(assert (=> d!3781 (= (lemmaChangeZeroKeyThenAddPairToListMap!7 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6905 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) lt!7105)))

(declare-fun bs!913 () Bool)

(assert (= bs!913 d!3781))

(assert (=> bs!913 m!15101))

(declare-fun m!15367 () Bool)

(assert (=> bs!913 m!15367))

(assert (=> bs!913 m!15279))

(assert (=> bs!913 m!15101))

(declare-fun m!15369 () Bool)

(assert (=> bs!913 m!15369))

(declare-fun m!15371 () Bool)

(assert (=> bs!913 m!15371))

(assert (=> b!21625 d!3781))

(declare-fun d!3783 () Bool)

(declare-fun get!378 (Option!66) V!1157)

(assert (=> d!3783 (= (apply!28 lt!6762 #b1000000000000000000000000000000000000000000000000000000000000000) (get!378 (getValueByKey!60 (toList!295 lt!6762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!914 () Bool)

(assert (= bs!914 d!3783))

(declare-fun m!15373 () Bool)

(assert (=> bs!914 m!15373))

(assert (=> bs!914 m!15373))

(declare-fun m!15375 () Bool)

(assert (=> bs!914 m!15375))

(assert (=> b!21483 d!3783))

(declare-fun d!3785 () Bool)

(declare-fun e!14192 () Bool)

(assert (=> d!3785 e!14192))

(declare-fun res!13964 () Bool)

(assert (=> d!3785 (=> (not res!13964) (not e!14192))))

(declare-fun lt!7107 () ListLongMap!559)

(assert (=> d!3785 (= res!13964 (contains!225 lt!7107 (_1!453 (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))))

(declare-fun lt!7108 () List!561)

(assert (=> d!3785 (= lt!7107 (ListLongMap!560 lt!7108))))

(declare-fun lt!7109 () Unit!452)

(declare-fun lt!7106 () Unit!452)

(assert (=> d!3785 (= lt!7109 lt!7106)))

(assert (=> d!3785 (= (getValueByKey!60 lt!7108 (_1!453 (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))) (Some!65 (_2!453 (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))))

(assert (=> d!3785 (= lt!7106 (lemmaContainsTupThenGetReturnValue!17 lt!7108 (_1!453 (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (_2!453 (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))))

(assert (=> d!3785 (= lt!7108 (insertStrictlySorted!17 (toList!295 call!1442) (_1!453 (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (_2!453 (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))))

(assert (=> d!3785 (= (+!42 call!1442 (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) lt!7107)))

(declare-fun b!21848 () Bool)

(declare-fun res!13963 () Bool)

(assert (=> b!21848 (=> (not res!13963) (not e!14192))))

(assert (=> b!21848 (= res!13963 (= (getValueByKey!60 (toList!295 lt!7107) (_1!453 (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))) (Some!65 (_2!453 (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))))))

(declare-fun b!21849 () Bool)

(assert (=> b!21849 (= e!14192 (contains!226 (toList!295 lt!7107) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))))

(assert (= (and d!3785 res!13964) b!21848))

(assert (= (and b!21848 res!13963) b!21849))

(declare-fun m!15377 () Bool)

(assert (=> d!3785 m!15377))

(declare-fun m!15379 () Bool)

(assert (=> d!3785 m!15379))

(declare-fun m!15381 () Bool)

(assert (=> d!3785 m!15381))

(declare-fun m!15383 () Bool)

(assert (=> d!3785 m!15383))

(declare-fun m!15385 () Bool)

(assert (=> b!21848 m!15385))

(declare-fun m!15387 () Bool)

(assert (=> b!21849 m!15387))

(assert (=> b!21624 d!3785))

(declare-fun d!3787 () Bool)

(declare-fun e!14193 () Bool)

(assert (=> d!3787 e!14193))

(declare-fun res!13966 () Bool)

(assert (=> d!3787 (=> (not res!13966) (not e!14193))))

(declare-fun lt!7111 () ListLongMap!559)

(assert (=> d!3787 (= res!13966 (contains!225 lt!7111 (_1!453 (ite (or c!2478 c!2481) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))))

(declare-fun lt!7112 () List!561)

(assert (=> d!3787 (= lt!7111 (ListLongMap!560 lt!7112))))

(declare-fun lt!7113 () Unit!452)

(declare-fun lt!7110 () Unit!452)

(assert (=> d!3787 (= lt!7113 lt!7110)))

(assert (=> d!3787 (= (getValueByKey!60 lt!7112 (_1!453 (ite (or c!2478 c!2481) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (Some!65 (_2!453 (ite (or c!2478 c!2481) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))))

(assert (=> d!3787 (= lt!7110 (lemmaContainsTupThenGetReturnValue!17 lt!7112 (_1!453 (ite (or c!2478 c!2481) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (_2!453 (ite (or c!2478 c!2481) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))))

(assert (=> d!3787 (= lt!7112 (insertStrictlySorted!17 (toList!295 (ite c!2478 call!1375 (ite c!2481 call!1371 call!1370))) (_1!453 (ite (or c!2478 c!2481) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (_2!453 (ite (or c!2478 c!2481) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))))

(assert (=> d!3787 (= (+!42 (ite c!2478 call!1375 (ite c!2481 call!1371 call!1370)) (ite (or c!2478 c!2481) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) lt!7111)))

(declare-fun b!21850 () Bool)

(declare-fun res!13965 () Bool)

(assert (=> b!21850 (=> (not res!13965) (not e!14193))))

(assert (=> b!21850 (= res!13965 (= (getValueByKey!60 (toList!295 lt!7111) (_1!453 (ite (or c!2478 c!2481) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (Some!65 (_2!453 (ite (or c!2478 c!2481) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))))

(declare-fun b!21851 () Bool)

(assert (=> b!21851 (= e!14193 (contains!226 (toList!295 lt!7111) (ite (or c!2478 c!2481) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (= (and d!3787 res!13966) b!21850))

(assert (= (and b!21850 res!13965) b!21851))

(declare-fun m!15389 () Bool)

(assert (=> d!3787 m!15389))

(declare-fun m!15391 () Bool)

(assert (=> d!3787 m!15391))

(declare-fun m!15393 () Bool)

(assert (=> d!3787 m!15393))

(declare-fun m!15395 () Bool)

(assert (=> d!3787 m!15395))

(declare-fun m!15397 () Bool)

(assert (=> b!21850 m!15397))

(declare-fun m!15399 () Bool)

(assert (=> b!21851 m!15399))

(assert (=> bm!1369 d!3787))

(declare-fun d!3789 () Bool)

(declare-fun e!14196 () Bool)

(assert (=> d!3789 e!14196))

(declare-fun res!13969 () Bool)

(assert (=> d!3789 (=> (not res!13969) (not e!14196))))

(assert (=> d!3789 (= res!13969 (and (bvsge (index!2325 lt!6945) #b00000000000000000000000000000000) (bvslt (index!2325 lt!6945) (size!677 (_keys!3140 lt!6678)))))))

(declare-fun lt!7116 () Unit!452)

(declare-fun choose!197 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 (_ BitVec 32) Int) Unit!452)

(assert (=> d!3789 (= lt!7116 (choose!197 (_keys!3140 lt!6678) lt!6946 (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) (index!2325 lt!6945) (defaultEntry!1719 lt!6678)))))

(assert (=> d!3789 (validMask!0 (mask!4692 lt!6678))))

(assert (=> d!3789 (= (lemmaValidKeyInArrayIsInListMap!7 (_keys!3140 lt!6678) lt!6946 (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) (index!2325 lt!6945) (defaultEntry!1719 lt!6678)) lt!7116)))

(declare-fun b!21854 () Bool)

(assert (=> b!21854 (= e!14196 (contains!225 (getCurrentListMap!126 (_keys!3140 lt!6678) lt!6946 (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)) (select (arr!584 (_keys!3140 lt!6678)) (index!2325 lt!6945))))))

(assert (= (and d!3789 res!13969) b!21854))

(declare-fun m!15401 () Bool)

(assert (=> d!3789 m!15401))

(assert (=> d!3789 m!15191))

(assert (=> b!21854 m!15159))

(assert (=> b!21854 m!15171))

(assert (=> b!21854 m!15159))

(assert (=> b!21854 m!15171))

(declare-fun m!15403 () Bool)

(assert (=> b!21854 m!15403))

(assert (=> b!21693 d!3789))

(declare-fun d!3791 () Bool)

(declare-fun e!14199 () Bool)

(assert (=> d!3791 e!14199))

(declare-fun res!13972 () Bool)

(assert (=> d!3791 (=> (not res!13972) (not e!14199))))

(assert (=> d!3791 (= res!13972 (and (bvsge (index!2325 lt!6945) #b00000000000000000000000000000000) (bvslt (index!2325 lt!6945) (size!676 (_values!1708 lt!6678)))))))

(declare-fun lt!7119 () Unit!452)

(declare-fun choose!198 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 (_ BitVec 32) (_ BitVec 64) V!1157 Int) Unit!452)

(assert (=> d!3791 (= lt!7119 (choose!198 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) (index!2325 lt!6945) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (defaultEntry!1719 lt!6678)))))

(assert (=> d!3791 (validMask!0 (mask!4692 lt!6678))))

(assert (=> d!3791 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!7 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) (index!2325 lt!6945) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (defaultEntry!1719 lt!6678)) lt!7119)))

(declare-fun b!21857 () Bool)

(assert (=> b!21857 (= e!14199 (= (+!42 (getCurrentListMap!126 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (getCurrentListMap!126 (_keys!3140 lt!6678) (array!1230 (store (arr!583 (_values!1708 lt!6678)) (index!2325 lt!6945) (ValueCellFull!300 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (size!676 (_values!1708 lt!6678))) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678))))))

(assert (= (and d!3791 res!13972) b!21857))

(declare-fun m!15405 () Bool)

(assert (=> d!3791 m!15405))

(assert (=> d!3791 m!15191))

(assert (=> b!21857 m!15161))

(assert (=> b!21857 m!15161))

(assert (=> b!21857 m!15329))

(assert (=> b!21857 m!15139))

(declare-fun m!15407 () Bool)

(assert (=> b!21857 m!15407))

(assert (=> b!21693 d!3791))

(declare-fun d!3793 () Bool)

(declare-fun e!14204 () Bool)

(assert (=> d!3793 e!14204))

(declare-fun res!13975 () Bool)

(assert (=> d!3793 (=> res!13975 e!14204)))

(declare-fun lt!7128 () Bool)

(assert (=> d!3793 (= res!13975 (not lt!7128))))

(declare-fun lt!7129 () Bool)

(assert (=> d!3793 (= lt!7128 lt!7129)))

(declare-fun lt!7131 () Unit!452)

(declare-fun e!14205 () Unit!452)

(assert (=> d!3793 (= lt!7131 e!14205)))

(declare-fun c!2582 () Bool)

(assert (=> d!3793 (= c!2582 lt!7129)))

(declare-fun containsKey!24 (List!561 (_ BitVec 64)) Bool)

(assert (=> d!3793 (= lt!7129 (containsKey!24 (toList!295 call!1454) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3793 (= (contains!225 call!1454 #b0000000000000000000000000000000000000000000000000000000000000000) lt!7128)))

(declare-fun b!21864 () Bool)

(declare-fun lt!7130 () Unit!452)

(assert (=> b!21864 (= e!14205 lt!7130)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!21 (List!561 (_ BitVec 64)) Unit!452)

(assert (=> b!21864 (= lt!7130 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!295 call!1454) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!22 (Option!66) Bool)

(assert (=> b!21864 (isDefined!22 (getValueByKey!60 (toList!295 call!1454) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21865 () Bool)

(declare-fun Unit!468 () Unit!452)

(assert (=> b!21865 (= e!14205 Unit!468)))

(declare-fun b!21866 () Bool)

(assert (=> b!21866 (= e!14204 (isDefined!22 (getValueByKey!60 (toList!295 call!1454) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!3793 c!2582) b!21864))

(assert (= (and d!3793 (not c!2582)) b!21865))

(assert (= (and d!3793 (not res!13975)) b!21866))

(declare-fun m!15409 () Bool)

(assert (=> d!3793 m!15409))

(declare-fun m!15411 () Bool)

(assert (=> b!21864 m!15411))

(declare-fun m!15413 () Bool)

(assert (=> b!21864 m!15413))

(assert (=> b!21864 m!15413))

(declare-fun m!15415 () Bool)

(assert (=> b!21864 m!15415))

(assert (=> b!21866 m!15413))

(assert (=> b!21866 m!15413))

(assert (=> b!21866 m!15415))

(assert (=> b!21693 d!3793))

(declare-fun b!21867 () Bool)

(declare-fun e!14217 () Bool)

(declare-fun e!14207 () Bool)

(assert (=> b!21867 (= e!14217 e!14207)))

(declare-fun res!13980 () Bool)

(declare-fun call!1503 () Bool)

(assert (=> b!21867 (= res!13980 call!1503)))

(assert (=> b!21867 (=> (not res!13980) (not e!14207))))

(declare-fun bm!1497 () Bool)

(declare-fun call!1501 () ListLongMap!559)

(declare-fun call!1502 () ListLongMap!559)

(assert (=> bm!1497 (= call!1501 call!1502)))

(declare-fun b!21868 () Bool)

(declare-fun lt!7147 () ListLongMap!559)

(assert (=> b!21868 (= e!14207 (= (apply!28 lt!7147 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1646 lt!6678)))))

(declare-fun b!21869 () Bool)

(declare-fun e!14211 () Bool)

(declare-fun e!14212 () Bool)

(assert (=> b!21869 (= e!14211 e!14212)))

(declare-fun c!2588 () Bool)

(assert (=> b!21869 (= c!2588 (not (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1498 () Bool)

(declare-fun call!1500 () ListLongMap!559)

(declare-fun call!1504 () ListLongMap!559)

(assert (=> bm!1498 (= call!1500 call!1504)))

(declare-fun b!21870 () Bool)

(declare-fun e!14214 () ListLongMap!559)

(assert (=> b!21870 (= e!14214 call!1500)))

(declare-fun d!3795 () Bool)

(assert (=> d!3795 e!14211))

(declare-fun res!13978 () Bool)

(assert (=> d!3795 (=> (not res!13978) (not e!14211))))

(assert (=> d!3795 (= res!13978 (or (bvsge #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))))))))

(declare-fun lt!7148 () ListLongMap!559)

(assert (=> d!3795 (= lt!7147 lt!7148)))

(declare-fun lt!7150 () Unit!452)

(declare-fun e!14208 () Unit!452)

(assert (=> d!3795 (= lt!7150 e!14208)))

(declare-fun c!2583 () Bool)

(declare-fun e!14218 () Bool)

(assert (=> d!3795 (= c!2583 e!14218)))

(declare-fun res!13983 () Bool)

(assert (=> d!3795 (=> (not res!13983) (not e!14218))))

(assert (=> d!3795 (= res!13983 (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))))))

(declare-fun e!14210 () ListLongMap!559)

(assert (=> d!3795 (= lt!7148 e!14210)))

(declare-fun c!2584 () Bool)

(assert (=> d!3795 (= c!2584 (and (not (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3795 (validMask!0 (mask!4692 lt!6678))))

(assert (=> d!3795 (= (getCurrentListMap!126 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)) lt!7147)))

(declare-fun bm!1499 () Bool)

(declare-fun call!1505 () Bool)

(assert (=> bm!1499 (= call!1505 (contains!225 lt!7147 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21871 () Bool)

(assert (=> b!21871 (= e!14210 (+!42 call!1504 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 lt!6678))))))

(declare-fun bm!1500 () Bool)

(declare-fun call!1506 () ListLongMap!559)

(declare-fun c!2587 () Bool)

(assert (=> bm!1500 (= call!1504 (+!42 (ite c!2584 call!1506 (ite c!2587 call!1502 call!1501)) (ite (or c!2584 c!2587) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 lt!6678)) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 lt!6678)))))))

(declare-fun b!21872 () Bool)

(declare-fun res!13982 () Bool)

(assert (=> b!21872 (=> (not res!13982) (not e!14211))))

(declare-fun e!14213 () Bool)

(assert (=> b!21872 (= res!13982 e!14213)))

(declare-fun res!13977 () Bool)

(assert (=> b!21872 (=> res!13977 e!14213)))

(declare-fun e!14216 () Bool)

(assert (=> b!21872 (= res!13977 (not e!14216))))

(declare-fun res!13976 () Bool)

(assert (=> b!21872 (=> (not res!13976) (not e!14216))))

(assert (=> b!21872 (= res!13976 (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))))))

(declare-fun b!21873 () Bool)

(declare-fun e!14206 () Bool)

(assert (=> b!21873 (= e!14206 (= (apply!28 lt!7147 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1646 lt!6678)))))

(declare-fun b!21874 () Bool)

(declare-fun e!14215 () Bool)

(assert (=> b!21874 (= e!14215 (= (apply!28 lt!7147 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000)) (get!377 (select (arr!583 (_values!1708 lt!6678)) #b00000000000000000000000000000000) (dynLambda!141 (defaultEntry!1719 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21874 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!676 (_values!1708 lt!6678))))))

(assert (=> b!21874 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))))))

(declare-fun b!21875 () Bool)

(declare-fun e!14209 () ListLongMap!559)

(assert (=> b!21875 (= e!14209 call!1500)))

(declare-fun b!21876 () Bool)

(declare-fun res!13979 () Bool)

(assert (=> b!21876 (=> (not res!13979) (not e!14211))))

(assert (=> b!21876 (= res!13979 e!14217)))

(declare-fun c!2586 () Bool)

(assert (=> b!21876 (= c!2586 (not (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!21877 () Bool)

(assert (=> b!21877 (= e!14209 call!1501)))

(declare-fun b!21878 () Bool)

(assert (=> b!21878 (= e!14212 e!14206)))

(declare-fun res!13984 () Bool)

(assert (=> b!21878 (= res!13984 call!1505)))

(assert (=> b!21878 (=> (not res!13984) (not e!14206))))

(declare-fun b!21879 () Bool)

(declare-fun c!2585 () Bool)

(assert (=> b!21879 (= c!2585 (and (not (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21879 (= e!14214 e!14209)))

(declare-fun b!21880 () Bool)

(assert (=> b!21880 (= e!14216 (validKeyInArray!0 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000)))))

(declare-fun bm!1501 () Bool)

(assert (=> bm!1501 (= call!1502 call!1506)))

(declare-fun b!21881 () Bool)

(assert (=> b!21881 (= e!14212 (not call!1505))))

(declare-fun b!21882 () Bool)

(assert (=> b!21882 (= e!14218 (validKeyInArray!0 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000)))))

(declare-fun b!21883 () Bool)

(declare-fun lt!7146 () Unit!452)

(assert (=> b!21883 (= e!14208 lt!7146)))

(declare-fun lt!7144 () ListLongMap!559)

(assert (=> b!21883 (= lt!7144 (getCurrentListMapNoExtraKeys!13 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun lt!7137 () (_ BitVec 64))

(assert (=> b!21883 (= lt!7137 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7134 () (_ BitVec 64))

(assert (=> b!21883 (= lt!7134 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000))))

(declare-fun lt!7136 () Unit!452)

(assert (=> b!21883 (= lt!7136 (addStillContains!13 lt!7144 lt!7137 (zeroValue!1646 lt!6678) lt!7134))))

(assert (=> b!21883 (contains!225 (+!42 lt!7144 (tuple2!901 lt!7137 (zeroValue!1646 lt!6678))) lt!7134)))

(declare-fun lt!7141 () Unit!452)

(assert (=> b!21883 (= lt!7141 lt!7136)))

(declare-fun lt!7145 () ListLongMap!559)

(assert (=> b!21883 (= lt!7145 (getCurrentListMapNoExtraKeys!13 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun lt!7138 () (_ BitVec 64))

(assert (=> b!21883 (= lt!7138 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7132 () (_ BitVec 64))

(assert (=> b!21883 (= lt!7132 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000))))

(declare-fun lt!7153 () Unit!452)

(assert (=> b!21883 (= lt!7153 (addApplyDifferent!13 lt!7145 lt!7138 (minValue!1646 lt!6678) lt!7132))))

(assert (=> b!21883 (= (apply!28 (+!42 lt!7145 (tuple2!901 lt!7138 (minValue!1646 lt!6678))) lt!7132) (apply!28 lt!7145 lt!7132))))

(declare-fun lt!7142 () Unit!452)

(assert (=> b!21883 (= lt!7142 lt!7153)))

(declare-fun lt!7152 () ListLongMap!559)

(assert (=> b!21883 (= lt!7152 (getCurrentListMapNoExtraKeys!13 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun lt!7151 () (_ BitVec 64))

(assert (=> b!21883 (= lt!7151 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7143 () (_ BitVec 64))

(assert (=> b!21883 (= lt!7143 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000))))

(declare-fun lt!7135 () Unit!452)

(assert (=> b!21883 (= lt!7135 (addApplyDifferent!13 lt!7152 lt!7151 (zeroValue!1646 lt!6678) lt!7143))))

(assert (=> b!21883 (= (apply!28 (+!42 lt!7152 (tuple2!901 lt!7151 (zeroValue!1646 lt!6678))) lt!7143) (apply!28 lt!7152 lt!7143))))

(declare-fun lt!7139 () Unit!452)

(assert (=> b!21883 (= lt!7139 lt!7135)))

(declare-fun lt!7149 () ListLongMap!559)

(assert (=> b!21883 (= lt!7149 (getCurrentListMapNoExtraKeys!13 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun lt!7140 () (_ BitVec 64))

(assert (=> b!21883 (= lt!7140 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7133 () (_ BitVec 64))

(assert (=> b!21883 (= lt!7133 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000))))

(assert (=> b!21883 (= lt!7146 (addApplyDifferent!13 lt!7149 lt!7140 (minValue!1646 lt!6678) lt!7133))))

(assert (=> b!21883 (= (apply!28 (+!42 lt!7149 (tuple2!901 lt!7140 (minValue!1646 lt!6678))) lt!7133) (apply!28 lt!7149 lt!7133))))

(declare-fun b!21884 () Bool)

(declare-fun Unit!469 () Unit!452)

(assert (=> b!21884 (= e!14208 Unit!469)))

(declare-fun bm!1502 () Bool)

(assert (=> bm!1502 (= call!1506 (getCurrentListMapNoExtraKeys!13 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun b!21885 () Bool)

(assert (=> b!21885 (= e!14217 (not call!1503))))

(declare-fun b!21886 () Bool)

(assert (=> b!21886 (= e!14213 e!14215)))

(declare-fun res!13981 () Bool)

(assert (=> b!21886 (=> (not res!13981) (not e!14215))))

(assert (=> b!21886 (= res!13981 (contains!225 lt!7147 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000)))))

(assert (=> b!21886 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))))))

(declare-fun b!21887 () Bool)

(assert (=> b!21887 (= e!14210 e!14214)))

(assert (=> b!21887 (= c!2587 (and (not (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1503 () Bool)

(assert (=> bm!1503 (= call!1503 (contains!225 lt!7147 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3795 c!2584) b!21871))

(assert (= (and d!3795 (not c!2584)) b!21887))

(assert (= (and b!21887 c!2587) b!21870))

(assert (= (and b!21887 (not c!2587)) b!21879))

(assert (= (and b!21879 c!2585) b!21875))

(assert (= (and b!21879 (not c!2585)) b!21877))

(assert (= (or b!21875 b!21877) bm!1497))

(assert (= (or b!21870 bm!1497) bm!1501))

(assert (= (or b!21870 b!21875) bm!1498))

(assert (= (or b!21871 bm!1501) bm!1502))

(assert (= (or b!21871 bm!1498) bm!1500))

(assert (= (and d!3795 res!13983) b!21882))

(assert (= (and d!3795 c!2583) b!21883))

(assert (= (and d!3795 (not c!2583)) b!21884))

(assert (= (and d!3795 res!13978) b!21872))

(assert (= (and b!21872 res!13976) b!21880))

(assert (= (and b!21872 (not res!13977)) b!21886))

(assert (= (and b!21886 res!13981) b!21874))

(assert (= (and b!21872 res!13982) b!21876))

(assert (= (and b!21876 c!2586) b!21867))

(assert (= (and b!21876 (not c!2586)) b!21885))

(assert (= (and b!21867 res!13980) b!21868))

(assert (= (or b!21867 b!21885) bm!1503))

(assert (= (and b!21876 res!13979) b!21869))

(assert (= (and b!21869 c!2588) b!21878))

(assert (= (and b!21869 (not c!2588)) b!21881))

(assert (= (and b!21878 res!13984) b!21873))

(assert (= (or b!21878 b!21881) bm!1499))

(declare-fun b_lambda!1535 () Bool)

(assert (=> (not b_lambda!1535) (not b!21874)))

(declare-fun t!3226 () Bool)

(declare-fun tb!649 () Bool)

(assert (=> (and b!21366 (= (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) (defaultEntry!1719 lt!6678)) t!3226) tb!649))

(declare-fun result!1077 () Bool)

(assert (=> tb!649 (= result!1077 tp_is_empty!999)))

(assert (=> b!21874 t!3226))

(declare-fun b_and!1435 () Bool)

(assert (= b_and!1433 (and (=> t!3226 result!1077) b_and!1435)))

(declare-fun m!15417 () Bool)

(assert (=> b!21880 m!15417))

(assert (=> b!21880 m!15417))

(declare-fun m!15419 () Bool)

(assert (=> b!21880 m!15419))

(declare-fun m!15421 () Bool)

(assert (=> bm!1502 m!15421))

(declare-fun m!15423 () Bool)

(assert (=> b!21883 m!15423))

(assert (=> b!21883 m!15417))

(declare-fun m!15425 () Bool)

(assert (=> b!21883 m!15425))

(declare-fun m!15427 () Bool)

(assert (=> b!21883 m!15427))

(declare-fun m!15429 () Bool)

(assert (=> b!21883 m!15429))

(declare-fun m!15431 () Bool)

(assert (=> b!21883 m!15431))

(assert (=> b!21883 m!15425))

(declare-fun m!15433 () Bool)

(assert (=> b!21883 m!15433))

(declare-fun m!15435 () Bool)

(assert (=> b!21883 m!15435))

(declare-fun m!15437 () Bool)

(assert (=> b!21883 m!15437))

(assert (=> b!21883 m!15421))

(declare-fun m!15439 () Bool)

(assert (=> b!21883 m!15439))

(declare-fun m!15441 () Bool)

(assert (=> b!21883 m!15441))

(declare-fun m!15443 () Bool)

(assert (=> b!21883 m!15443))

(declare-fun m!15445 () Bool)

(assert (=> b!21883 m!15445))

(assert (=> b!21883 m!15445))

(declare-fun m!15447 () Bool)

(assert (=> b!21883 m!15447))

(assert (=> b!21883 m!15439))

(declare-fun m!15449 () Bool)

(assert (=> b!21883 m!15449))

(assert (=> b!21883 m!15431))

(declare-fun m!15451 () Bool)

(assert (=> b!21883 m!15451))

(assert (=> b!21886 m!15417))

(assert (=> b!21886 m!15417))

(declare-fun m!15453 () Bool)

(assert (=> b!21886 m!15453))

(declare-fun m!15455 () Bool)

(assert (=> bm!1500 m!15455))

(declare-fun m!15457 () Bool)

(assert (=> b!21871 m!15457))

(assert (=> b!21882 m!15417))

(assert (=> b!21882 m!15417))

(assert (=> b!21882 m!15419))

(declare-fun m!15459 () Bool)

(assert (=> bm!1499 m!15459))

(declare-fun m!15461 () Bool)

(assert (=> b!21873 m!15461))

(assert (=> b!21874 m!15417))

(assert (=> b!21874 m!15417))

(declare-fun m!15463 () Bool)

(assert (=> b!21874 m!15463))

(declare-fun m!15465 () Bool)

(assert (=> b!21874 m!15465))

(declare-fun m!15467 () Bool)

(assert (=> b!21874 m!15467))

(declare-fun m!15469 () Bool)

(assert (=> b!21874 m!15469))

(assert (=> b!21874 m!15467))

(assert (=> b!21874 m!15465))

(declare-fun m!15471 () Bool)

(assert (=> b!21868 m!15471))

(declare-fun m!15473 () Bool)

(assert (=> bm!1503 m!15473))

(assert (=> d!3795 m!15191))

(assert (=> bm!1453 d!3795))

(declare-fun d!3797 () Bool)

(declare-fun res!13985 () Bool)

(declare-fun e!14219 () Bool)

(assert (=> d!3797 (=> (not res!13985) (not e!14219))))

(assert (=> d!3797 (= res!13985 (simpleValid!19 (_2!451 lt!6915)))))

(assert (=> d!3797 (= (valid!93 (_2!451 lt!6915)) e!14219)))

(declare-fun b!21888 () Bool)

(declare-fun res!13986 () Bool)

(assert (=> b!21888 (=> (not res!13986) (not e!14219))))

(assert (=> b!21888 (= res!13986 (= (arrayCountValidKeys!0 (_keys!3140 (_2!451 lt!6915)) #b00000000000000000000000000000000 (size!677 (_keys!3140 (_2!451 lt!6915)))) (_size!134 (_2!451 lt!6915))))))

(declare-fun b!21889 () Bool)

(declare-fun res!13987 () Bool)

(assert (=> b!21889 (=> (not res!13987) (not e!14219))))

(assert (=> b!21889 (= res!13987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3140 (_2!451 lt!6915)) (mask!4692 (_2!451 lt!6915))))))

(declare-fun b!21890 () Bool)

(assert (=> b!21890 (= e!14219 (arrayNoDuplicates!0 (_keys!3140 (_2!451 lt!6915)) #b00000000000000000000000000000000 Nil!560))))

(assert (= (and d!3797 res!13985) b!21888))

(assert (= (and b!21888 res!13986) b!21889))

(assert (= (and b!21889 res!13987) b!21890))

(declare-fun m!15475 () Bool)

(assert (=> d!3797 m!15475))

(declare-fun m!15477 () Bool)

(assert (=> b!21888 m!15477))

(declare-fun m!15479 () Bool)

(assert (=> b!21889 m!15479))

(declare-fun m!15481 () Bool)

(assert (=> b!21890 m!15481))

(assert (=> d!3753 d!3797))

(declare-fun d!3799 () Bool)

(declare-fun res!13988 () Bool)

(declare-fun e!14220 () Bool)

(assert (=> d!3799 (=> (not res!13988) (not e!14220))))

(assert (=> d!3799 (= res!13988 (simpleValid!19 (ite c!2454 (_2!451 lt!6679) lt!6678)))))

(assert (=> d!3799 (= (valid!93 (ite c!2454 (_2!451 lt!6679) lt!6678)) e!14220)))

(declare-fun b!21891 () Bool)

(declare-fun res!13989 () Bool)

(assert (=> b!21891 (=> (not res!13989) (not e!14220))))

(assert (=> b!21891 (= res!13989 (= (arrayCountValidKeys!0 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))) (_size!134 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!21892 () Bool)

(declare-fun res!13990 () Bool)

(assert (=> b!21892 (=> (not res!13990) (not e!14220))))

(assert (=> b!21892 (= res!13990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!21893 () Bool)

(assert (=> b!21893 (= e!14220 (arrayNoDuplicates!0 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 Nil!560))))

(assert (= (and d!3799 res!13988) b!21891))

(assert (= (and b!21891 res!13989) b!21892))

(assert (= (and b!21892 res!13990) b!21893))

(declare-fun m!15483 () Bool)

(assert (=> d!3799 m!15483))

(declare-fun m!15485 () Bool)

(assert (=> b!21891 m!15485))

(declare-fun m!15487 () Bool)

(assert (=> b!21892 m!15487))

(declare-fun m!15489 () Bool)

(assert (=> b!21893 m!15489))

(assert (=> d!3753 d!3799))

(declare-fun d!3801 () Bool)

(declare-fun res!13995 () Bool)

(declare-fun e!14225 () Bool)

(assert (=> d!3801 (=> res!13995 e!14225)))

(assert (=> d!3801 (= res!13995 (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3801 (= (arrayContainsKey!0 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000) e!14225)))

(declare-fun b!21898 () Bool)

(declare-fun e!14226 () Bool)

(assert (=> b!21898 (= e!14225 e!14226)))

(declare-fun res!13996 () Bool)

(assert (=> b!21898 (=> (not res!13996) (not e!14226))))

(assert (=> b!21898 (= res!13996 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun b!21899 () Bool)

(assert (=> b!21899 (= e!14226 (arrayContainsKey!0 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!3801 (not res!13995)) b!21898))

(assert (= (and b!21898 res!13996) b!21899))

(assert (=> d!3801 m!15221))

(declare-fun m!15491 () Bool)

(assert (=> b!21899 m!15491))

(assert (=> bm!1443 d!3801))

(declare-fun b!21900 () Bool)

(declare-fun c!2590 () Bool)

(declare-fun lt!7156 () (_ BitVec 64))

(assert (=> b!21900 (= c!2590 (= lt!7156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14227 () SeekEntryResult!51)

(declare-fun e!14229 () SeekEntryResult!51)

(assert (=> b!21900 (= e!14227 e!14229)))

(declare-fun b!21901 () Bool)

(declare-fun lt!7154 () SeekEntryResult!51)

(assert (=> b!21901 (= e!14229 (MissingZero!51 (index!2326 lt!7154)))))

(declare-fun b!21902 () Bool)

(assert (=> b!21902 (= e!14229 (seekKeyOrZeroReturnVacant!0 (x!5190 lt!7154) (index!2326 lt!7154) (index!2326 lt!7154) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!21903 () Bool)

(declare-fun e!14228 () SeekEntryResult!51)

(assert (=> b!21903 (= e!14228 Undefined!51)))

(declare-fun b!21904 () Bool)

(assert (=> b!21904 (= e!14227 (Found!51 (index!2326 lt!7154)))))

(declare-fun lt!7155 () SeekEntryResult!51)

(declare-fun d!3803 () Bool)

(assert (=> d!3803 (and (or ((_ is Undefined!51) lt!7155) (not ((_ is Found!51) lt!7155)) (and (bvsge (index!2325 lt!7155) #b00000000000000000000000000000000) (bvslt (index!2325 lt!7155) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))) (or ((_ is Undefined!51) lt!7155) ((_ is Found!51) lt!7155) (not ((_ is MissingZero!51) lt!7155)) (and (bvsge (index!2324 lt!7155) #b00000000000000000000000000000000) (bvslt (index!2324 lt!7155) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))) (or ((_ is Undefined!51) lt!7155) ((_ is Found!51) lt!7155) ((_ is MissingZero!51) lt!7155) (not ((_ is MissingVacant!51) lt!7155)) (and (bvsge (index!2327 lt!7155) #b00000000000000000000000000000000) (bvslt (index!2327 lt!7155) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))) (or ((_ is Undefined!51) lt!7155) (ite ((_ is Found!51) lt!7155) (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!7155)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (ite ((_ is MissingZero!51) lt!7155) (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2324 lt!7155)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!51) lt!7155) (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2327 lt!7155)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!3803 (= lt!7155 e!14228)))

(declare-fun c!2591 () Bool)

(assert (=> d!3803 (= c!2591 (and ((_ is Intermediate!51) lt!7154) (undefined!863 lt!7154)))))

(assert (=> d!3803 (= lt!7154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(assert (=> d!3803 (validMask!0 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)))))

(assert (=> d!3803 (= (seekEntryOrOpen!0 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))) lt!7155)))

(declare-fun b!21905 () Bool)

(assert (=> b!21905 (= e!14228 e!14227)))

(assert (=> b!21905 (= lt!7156 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2326 lt!7154)))))

(declare-fun c!2589 () Bool)

(assert (=> b!21905 (= c!2589 (= lt!7156 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!3803 c!2591) b!21903))

(assert (= (and d!3803 (not c!2591)) b!21905))

(assert (= (and b!21905 c!2589) b!21904))

(assert (= (and b!21905 (not c!2589)) b!21900))

(assert (= (and b!21900 c!2590) b!21901))

(assert (= (and b!21900 (not c!2590)) b!21902))

(declare-fun m!15493 () Bool)

(assert (=> b!21902 m!15493))

(declare-fun m!15495 () Bool)

(assert (=> d!3803 m!15495))

(assert (=> d!3803 m!15279))

(declare-fun m!15497 () Bool)

(assert (=> d!3803 m!15497))

(declare-fun m!15499 () Bool)

(assert (=> d!3803 m!15499))

(declare-fun m!15501 () Bool)

(assert (=> d!3803 m!15501))

(assert (=> d!3803 m!15497))

(declare-fun m!15503 () Bool)

(assert (=> d!3803 m!15503))

(declare-fun m!15505 () Bool)

(assert (=> b!21905 m!15505))

(assert (=> b!21620 d!3803))

(declare-fun d!3805 () Bool)

(declare-fun e!14230 () Bool)

(assert (=> d!3805 e!14230))

(declare-fun res!13997 () Bool)

(assert (=> d!3805 (=> res!13997 e!14230)))

(declare-fun lt!7157 () Bool)

(assert (=> d!3805 (= res!13997 (not lt!7157))))

(declare-fun lt!7158 () Bool)

(assert (=> d!3805 (= lt!7157 lt!7158)))

(declare-fun lt!7160 () Unit!452)

(declare-fun e!14231 () Unit!452)

(assert (=> d!3805 (= lt!7160 e!14231)))

(declare-fun c!2592 () Bool)

(assert (=> d!3805 (= c!2592 lt!7158)))

(assert (=> d!3805 (= lt!7158 (containsKey!24 (toList!295 lt!6762) (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))))))

(assert (=> d!3805 (= (contains!225 lt!6762 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))) lt!7157)))

(declare-fun b!21906 () Bool)

(declare-fun lt!7159 () Unit!452)

(assert (=> b!21906 (= e!14231 lt!7159)))

(assert (=> b!21906 (= lt!7159 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!295 lt!6762) (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))))))

(assert (=> b!21906 (isDefined!22 (getValueByKey!60 (toList!295 lt!6762) (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))))))

(declare-fun b!21907 () Bool)

(declare-fun Unit!470 () Unit!452)

(assert (=> b!21907 (= e!14231 Unit!470)))

(declare-fun b!21908 () Bool)

(assert (=> b!21908 (= e!14230 (isDefined!22 (getValueByKey!60 (toList!295 lt!6762) (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))))))))

(assert (= (and d!3805 c!2592) b!21906))

(assert (= (and d!3805 (not c!2592)) b!21907))

(assert (= (and d!3805 (not res!13997)) b!21908))

(assert (=> d!3805 m!14963))

(declare-fun m!15507 () Bool)

(assert (=> d!3805 m!15507))

(assert (=> b!21906 m!14963))

(declare-fun m!15509 () Bool)

(assert (=> b!21906 m!15509))

(assert (=> b!21906 m!14963))

(declare-fun m!15511 () Bool)

(assert (=> b!21906 m!15511))

(assert (=> b!21906 m!15511))

(declare-fun m!15513 () Bool)

(assert (=> b!21906 m!15513))

(assert (=> b!21908 m!14963))

(assert (=> b!21908 m!15511))

(assert (=> b!21908 m!15511))

(assert (=> b!21908 m!15513))

(assert (=> b!21496 d!3805))

(declare-fun b!21909 () Bool)

(declare-fun e!14243 () Bool)

(declare-fun e!14233 () Bool)

(assert (=> b!21909 (= e!14243 e!14233)))

(declare-fun res!14002 () Bool)

(declare-fun call!1510 () Bool)

(assert (=> b!21909 (= res!14002 call!1510)))

(assert (=> b!21909 (=> (not res!14002) (not e!14233))))

(declare-fun bm!1504 () Bool)

(declare-fun call!1508 () ListLongMap!559)

(declare-fun call!1509 () ListLongMap!559)

(assert (=> bm!1504 (= call!1508 call!1509)))

(declare-fun b!21910 () Bool)

(declare-fun lt!7176 () ListLongMap!559)

(assert (=> b!21910 (= e!14233 (= (apply!28 lt!7176 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!2532 c!2538) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 lt!6678))))))

(declare-fun b!21911 () Bool)

(declare-fun e!14237 () Bool)

(declare-fun e!14238 () Bool)

(assert (=> b!21911 (= e!14237 e!14238)))

(declare-fun c!2598 () Bool)

(assert (=> b!21911 (= c!2598 (not (= (bvand (ite c!2532 (ite c!2538 lt!6932 lt!6951) (extraKeys!1622 lt!6678)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1505 () Bool)

(declare-fun call!1507 () ListLongMap!559)

(declare-fun call!1511 () ListLongMap!559)

(assert (=> bm!1505 (= call!1507 call!1511)))

(declare-fun b!21912 () Bool)

(declare-fun e!14240 () ListLongMap!559)

(assert (=> b!21912 (= e!14240 call!1507)))

(declare-fun d!3807 () Bool)

(assert (=> d!3807 e!14237))

(declare-fun res!14000 () Bool)

(assert (=> d!3807 (=> (not res!14000) (not e!14237))))

(assert (=> d!3807 (= res!14000 (or (bvsge #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))))))))

(declare-fun lt!7177 () ListLongMap!559)

(assert (=> d!3807 (= lt!7176 lt!7177)))

(declare-fun lt!7179 () Unit!452)

(declare-fun e!14234 () Unit!452)

(assert (=> d!3807 (= lt!7179 e!14234)))

(declare-fun c!2593 () Bool)

(declare-fun e!14244 () Bool)

(assert (=> d!3807 (= c!2593 e!14244)))

(declare-fun res!14005 () Bool)

(assert (=> d!3807 (=> (not res!14005) (not e!14244))))

(assert (=> d!3807 (= res!14005 (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))))))

(declare-fun e!14236 () ListLongMap!559)

(assert (=> d!3807 (= lt!7177 e!14236)))

(declare-fun c!2594 () Bool)

(assert (=> d!3807 (= c!2594 (and (not (= (bvand (ite c!2532 (ite c!2538 lt!6932 lt!6951) (extraKeys!1622 lt!6678)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!2532 (ite c!2538 lt!6932 lt!6951) (extraKeys!1622 lt!6678)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3807 (validMask!0 (mask!4692 lt!6678))))

(assert (=> d!3807 (= (getCurrentListMap!126 (_keys!3140 lt!6678) (ite (or c!2532 c!2534) (_values!1708 lt!6678) (array!1230 (store (arr!583 (_values!1708 lt!6678)) (index!2325 lt!6945) (ValueCellFull!300 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (size!676 (_values!1708 lt!6678)))) (mask!4692 lt!6678) (ite c!2532 (ite c!2538 lt!6932 lt!6951) (extraKeys!1622 lt!6678)) (ite (and c!2532 c!2538) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 lt!6678)) (ite c!2532 (ite c!2538 (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (minValue!1646 lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)) lt!7176)))

(declare-fun bm!1506 () Bool)

(declare-fun call!1512 () Bool)

(assert (=> bm!1506 (= call!1512 (contains!225 lt!7176 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21913 () Bool)

(assert (=> b!21913 (= e!14236 (+!42 call!1511 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2532 (ite c!2538 (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (minValue!1646 lt!6678)))))))

(declare-fun c!2597 () Bool)

(declare-fun bm!1507 () Bool)

(declare-fun call!1513 () ListLongMap!559)

(assert (=> bm!1507 (= call!1511 (+!42 (ite c!2594 call!1513 (ite c!2597 call!1509 call!1508)) (ite (or c!2594 c!2597) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!2532 c!2538) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 lt!6678))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2532 (ite c!2538 (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (minValue!1646 lt!6678))))))))

(declare-fun b!21914 () Bool)

(declare-fun res!14004 () Bool)

(assert (=> b!21914 (=> (not res!14004) (not e!14237))))

(declare-fun e!14239 () Bool)

(assert (=> b!21914 (= res!14004 e!14239)))

(declare-fun res!13999 () Bool)

(assert (=> b!21914 (=> res!13999 e!14239)))

(declare-fun e!14242 () Bool)

(assert (=> b!21914 (= res!13999 (not e!14242))))

(declare-fun res!13998 () Bool)

(assert (=> b!21914 (=> (not res!13998) (not e!14242))))

(assert (=> b!21914 (= res!13998 (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))))))

(declare-fun e!14232 () Bool)

(declare-fun b!21915 () Bool)

(assert (=> b!21915 (= e!14232 (= (apply!28 lt!7176 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!2532 (ite c!2538 (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (minValue!1646 lt!6678))))))

(declare-fun b!21916 () Bool)

(declare-fun e!14241 () Bool)

(assert (=> b!21916 (= e!14241 (= (apply!28 lt!7176 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000)) (get!377 (select (arr!583 (ite (or c!2532 c!2534) (_values!1708 lt!6678) (array!1230 (store (arr!583 (_values!1708 lt!6678)) (index!2325 lt!6945) (ValueCellFull!300 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (size!676 (_values!1708 lt!6678))))) #b00000000000000000000000000000000) (dynLambda!141 (defaultEntry!1719 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21916 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!676 (ite (or c!2532 c!2534) (_values!1708 lt!6678) (array!1230 (store (arr!583 (_values!1708 lt!6678)) (index!2325 lt!6945) (ValueCellFull!300 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (size!676 (_values!1708 lt!6678)))))))))

(assert (=> b!21916 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))))))

(declare-fun b!21917 () Bool)

(declare-fun e!14235 () ListLongMap!559)

(assert (=> b!21917 (= e!14235 call!1507)))

(declare-fun b!21918 () Bool)

(declare-fun res!14001 () Bool)

(assert (=> b!21918 (=> (not res!14001) (not e!14237))))

(assert (=> b!21918 (= res!14001 e!14243)))

(declare-fun c!2596 () Bool)

(assert (=> b!21918 (= c!2596 (not (= (bvand (ite c!2532 (ite c!2538 lt!6932 lt!6951) (extraKeys!1622 lt!6678)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!21919 () Bool)

(assert (=> b!21919 (= e!14235 call!1508)))

(declare-fun b!21920 () Bool)

(assert (=> b!21920 (= e!14238 e!14232)))

(declare-fun res!14006 () Bool)

(assert (=> b!21920 (= res!14006 call!1512)))

(assert (=> b!21920 (=> (not res!14006) (not e!14232))))

(declare-fun b!21921 () Bool)

(declare-fun c!2595 () Bool)

(assert (=> b!21921 (= c!2595 (and (not (= (bvand (ite c!2532 (ite c!2538 lt!6932 lt!6951) (extraKeys!1622 lt!6678)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!2532 (ite c!2538 lt!6932 lt!6951) (extraKeys!1622 lt!6678)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21921 (= e!14240 e!14235)))

(declare-fun b!21922 () Bool)

(assert (=> b!21922 (= e!14242 (validKeyInArray!0 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000)))))

(declare-fun bm!1508 () Bool)

(assert (=> bm!1508 (= call!1509 call!1513)))

(declare-fun b!21923 () Bool)

(assert (=> b!21923 (= e!14238 (not call!1512))))

(declare-fun b!21924 () Bool)

(assert (=> b!21924 (= e!14244 (validKeyInArray!0 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000)))))

(declare-fun b!21925 () Bool)

(declare-fun lt!7175 () Unit!452)

(assert (=> b!21925 (= e!14234 lt!7175)))

(declare-fun lt!7173 () ListLongMap!559)

(assert (=> b!21925 (= lt!7173 (getCurrentListMapNoExtraKeys!13 (_keys!3140 lt!6678) (ite (or c!2532 c!2534) (_values!1708 lt!6678) (array!1230 (store (arr!583 (_values!1708 lt!6678)) (index!2325 lt!6945) (ValueCellFull!300 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (size!676 (_values!1708 lt!6678)))) (mask!4692 lt!6678) (ite c!2532 (ite c!2538 lt!6932 lt!6951) (extraKeys!1622 lt!6678)) (ite (and c!2532 c!2538) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 lt!6678)) (ite c!2532 (ite c!2538 (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (minValue!1646 lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun lt!7166 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7166 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7163 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7163 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000))))

(declare-fun lt!7165 () Unit!452)

(assert (=> b!21925 (= lt!7165 (addStillContains!13 lt!7173 lt!7166 (ite (and c!2532 c!2538) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 lt!6678)) lt!7163))))

(assert (=> b!21925 (contains!225 (+!42 lt!7173 (tuple2!901 lt!7166 (ite (and c!2532 c!2538) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 lt!6678)))) lt!7163)))

(declare-fun lt!7170 () Unit!452)

(assert (=> b!21925 (= lt!7170 lt!7165)))

(declare-fun lt!7174 () ListLongMap!559)

(assert (=> b!21925 (= lt!7174 (getCurrentListMapNoExtraKeys!13 (_keys!3140 lt!6678) (ite (or c!2532 c!2534) (_values!1708 lt!6678) (array!1230 (store (arr!583 (_values!1708 lt!6678)) (index!2325 lt!6945) (ValueCellFull!300 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (size!676 (_values!1708 lt!6678)))) (mask!4692 lt!6678) (ite c!2532 (ite c!2538 lt!6932 lt!6951) (extraKeys!1622 lt!6678)) (ite (and c!2532 c!2538) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 lt!6678)) (ite c!2532 (ite c!2538 (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (minValue!1646 lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun lt!7167 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7167 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7161 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7161 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000))))

(declare-fun lt!7182 () Unit!452)

(assert (=> b!21925 (= lt!7182 (addApplyDifferent!13 lt!7174 lt!7167 (ite c!2532 (ite c!2538 (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (minValue!1646 lt!6678)) lt!7161))))

(assert (=> b!21925 (= (apply!28 (+!42 lt!7174 (tuple2!901 lt!7167 (ite c!2532 (ite c!2538 (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (minValue!1646 lt!6678)))) lt!7161) (apply!28 lt!7174 lt!7161))))

(declare-fun lt!7171 () Unit!452)

(assert (=> b!21925 (= lt!7171 lt!7182)))

(declare-fun lt!7181 () ListLongMap!559)

(assert (=> b!21925 (= lt!7181 (getCurrentListMapNoExtraKeys!13 (_keys!3140 lt!6678) (ite (or c!2532 c!2534) (_values!1708 lt!6678) (array!1230 (store (arr!583 (_values!1708 lt!6678)) (index!2325 lt!6945) (ValueCellFull!300 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (size!676 (_values!1708 lt!6678)))) (mask!4692 lt!6678) (ite c!2532 (ite c!2538 lt!6932 lt!6951) (extraKeys!1622 lt!6678)) (ite (and c!2532 c!2538) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 lt!6678)) (ite c!2532 (ite c!2538 (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (minValue!1646 lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun lt!7180 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7180 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7172 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7172 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000))))

(declare-fun lt!7164 () Unit!452)

(assert (=> b!21925 (= lt!7164 (addApplyDifferent!13 lt!7181 lt!7180 (ite (and c!2532 c!2538) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 lt!6678)) lt!7172))))

(assert (=> b!21925 (= (apply!28 (+!42 lt!7181 (tuple2!901 lt!7180 (ite (and c!2532 c!2538) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 lt!6678)))) lt!7172) (apply!28 lt!7181 lt!7172))))

(declare-fun lt!7168 () Unit!452)

(assert (=> b!21925 (= lt!7168 lt!7164)))

(declare-fun lt!7178 () ListLongMap!559)

(assert (=> b!21925 (= lt!7178 (getCurrentListMapNoExtraKeys!13 (_keys!3140 lt!6678) (ite (or c!2532 c!2534) (_values!1708 lt!6678) (array!1230 (store (arr!583 (_values!1708 lt!6678)) (index!2325 lt!6945) (ValueCellFull!300 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (size!676 (_values!1708 lt!6678)))) (mask!4692 lt!6678) (ite c!2532 (ite c!2538 lt!6932 lt!6951) (extraKeys!1622 lt!6678)) (ite (and c!2532 c!2538) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 lt!6678)) (ite c!2532 (ite c!2538 (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (minValue!1646 lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun lt!7169 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7169 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7162 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7162 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000))))

(assert (=> b!21925 (= lt!7175 (addApplyDifferent!13 lt!7178 lt!7169 (ite c!2532 (ite c!2538 (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (minValue!1646 lt!6678)) lt!7162))))

(assert (=> b!21925 (= (apply!28 (+!42 lt!7178 (tuple2!901 lt!7169 (ite c!2532 (ite c!2538 (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (minValue!1646 lt!6678)))) lt!7162) (apply!28 lt!7178 lt!7162))))

(declare-fun b!21926 () Bool)

(declare-fun Unit!471 () Unit!452)

(assert (=> b!21926 (= e!14234 Unit!471)))

(declare-fun bm!1509 () Bool)

(assert (=> bm!1509 (= call!1513 (getCurrentListMapNoExtraKeys!13 (_keys!3140 lt!6678) (ite (or c!2532 c!2534) (_values!1708 lt!6678) (array!1230 (store (arr!583 (_values!1708 lt!6678)) (index!2325 lt!6945) (ValueCellFull!300 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (size!676 (_values!1708 lt!6678)))) (mask!4692 lt!6678) (ite c!2532 (ite c!2538 lt!6932 lt!6951) (extraKeys!1622 lt!6678)) (ite (and c!2532 c!2538) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 lt!6678)) (ite c!2532 (ite c!2538 (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))) (minValue!1646 lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun b!21927 () Bool)

(assert (=> b!21927 (= e!14243 (not call!1510))))

(declare-fun b!21928 () Bool)

(assert (=> b!21928 (= e!14239 e!14241)))

(declare-fun res!14003 () Bool)

(assert (=> b!21928 (=> (not res!14003) (not e!14241))))

(assert (=> b!21928 (= res!14003 (contains!225 lt!7176 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000)))))

(assert (=> b!21928 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))))))

(declare-fun b!21929 () Bool)

(assert (=> b!21929 (= e!14236 e!14240)))

(assert (=> b!21929 (= c!2597 (and (not (= (bvand (ite c!2532 (ite c!2538 lt!6932 lt!6951) (extraKeys!1622 lt!6678)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!2532 (ite c!2538 lt!6932 lt!6951) (extraKeys!1622 lt!6678)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1510 () Bool)

(assert (=> bm!1510 (= call!1510 (contains!225 lt!7176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3807 c!2594) b!21913))

(assert (= (and d!3807 (not c!2594)) b!21929))

(assert (= (and b!21929 c!2597) b!21912))

(assert (= (and b!21929 (not c!2597)) b!21921))

(assert (= (and b!21921 c!2595) b!21917))

(assert (= (and b!21921 (not c!2595)) b!21919))

(assert (= (or b!21917 b!21919) bm!1504))

(assert (= (or b!21912 bm!1504) bm!1508))

(assert (= (or b!21912 b!21917) bm!1505))

(assert (= (or b!21913 bm!1508) bm!1509))

(assert (= (or b!21913 bm!1505) bm!1507))

(assert (= (and d!3807 res!14005) b!21924))

(assert (= (and d!3807 c!2593) b!21925))

(assert (= (and d!3807 (not c!2593)) b!21926))

(assert (= (and d!3807 res!14000) b!21914))

(assert (= (and b!21914 res!13998) b!21922))

(assert (= (and b!21914 (not res!13999)) b!21928))

(assert (= (and b!21928 res!14003) b!21916))

(assert (= (and b!21914 res!14004) b!21918))

(assert (= (and b!21918 c!2596) b!21909))

(assert (= (and b!21918 (not c!2596)) b!21927))

(assert (= (and b!21909 res!14002) b!21910))

(assert (= (or b!21909 b!21927) bm!1510))

(assert (= (and b!21918 res!14001) b!21911))

(assert (= (and b!21911 c!2598) b!21920))

(assert (= (and b!21911 (not c!2598)) b!21923))

(assert (= (and b!21920 res!14006) b!21915))

(assert (= (or b!21920 b!21923) bm!1506))

(declare-fun b_lambda!1537 () Bool)

(assert (=> (not b_lambda!1537) (not b!21916)))

(assert (=> b!21916 t!3226))

(declare-fun b_and!1437 () Bool)

(assert (= b_and!1435 (and (=> t!3226 result!1077) b_and!1437)))

(assert (=> b!21922 m!15417))

(assert (=> b!21922 m!15417))

(assert (=> b!21922 m!15419))

(declare-fun m!15515 () Bool)

(assert (=> bm!1509 m!15515))

(declare-fun m!15517 () Bool)

(assert (=> b!21925 m!15517))

(assert (=> b!21925 m!15417))

(declare-fun m!15519 () Bool)

(assert (=> b!21925 m!15519))

(declare-fun m!15521 () Bool)

(assert (=> b!21925 m!15521))

(declare-fun m!15523 () Bool)

(assert (=> b!21925 m!15523))

(declare-fun m!15525 () Bool)

(assert (=> b!21925 m!15525))

(assert (=> b!21925 m!15519))

(declare-fun m!15527 () Bool)

(assert (=> b!21925 m!15527))

(declare-fun m!15529 () Bool)

(assert (=> b!21925 m!15529))

(declare-fun m!15531 () Bool)

(assert (=> b!21925 m!15531))

(assert (=> b!21925 m!15515))

(declare-fun m!15533 () Bool)

(assert (=> b!21925 m!15533))

(declare-fun m!15535 () Bool)

(assert (=> b!21925 m!15535))

(declare-fun m!15537 () Bool)

(assert (=> b!21925 m!15537))

(declare-fun m!15539 () Bool)

(assert (=> b!21925 m!15539))

(assert (=> b!21925 m!15539))

(declare-fun m!15541 () Bool)

(assert (=> b!21925 m!15541))

(assert (=> b!21925 m!15533))

(declare-fun m!15543 () Bool)

(assert (=> b!21925 m!15543))

(assert (=> b!21925 m!15525))

(declare-fun m!15545 () Bool)

(assert (=> b!21925 m!15545))

(assert (=> b!21928 m!15417))

(assert (=> b!21928 m!15417))

(declare-fun m!15547 () Bool)

(assert (=> b!21928 m!15547))

(declare-fun m!15549 () Bool)

(assert (=> bm!1507 m!15549))

(declare-fun m!15551 () Bool)

(assert (=> b!21913 m!15551))

(assert (=> b!21924 m!15417))

(assert (=> b!21924 m!15417))

(assert (=> b!21924 m!15419))

(declare-fun m!15553 () Bool)

(assert (=> bm!1506 m!15553))

(declare-fun m!15555 () Bool)

(assert (=> b!21915 m!15555))

(assert (=> b!21916 m!15417))

(assert (=> b!21916 m!15417))

(declare-fun m!15557 () Bool)

(assert (=> b!21916 m!15557))

(declare-fun m!15559 () Bool)

(assert (=> b!21916 m!15559))

(assert (=> b!21916 m!15467))

(declare-fun m!15561 () Bool)

(assert (=> b!21916 m!15561))

(assert (=> b!21916 m!15467))

(assert (=> b!21916 m!15559))

(declare-fun m!15563 () Bool)

(assert (=> b!21910 m!15563))

(declare-fun m!15565 () Bool)

(assert (=> bm!1510 m!15565))

(assert (=> d!3807 m!15191))

(assert (=> bm!1466 d!3807))

(declare-fun d!3809 () Bool)

(assert (=> d!3809 (= (map!395 lt!6678) (getCurrentListMap!126 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun bs!915 () Bool)

(assert (= bs!915 d!3809))

(assert (=> bs!915 m!15161))

(assert (=> bm!1449 d!3809))

(declare-fun d!3811 () Bool)

(assert (=> d!3811 (arrayNoDuplicates!0 lt!6824 lt!6829 lt!6831)))

(declare-fun lt!7185 () Unit!452)

(declare-fun choose!111 (array!1231 (_ BitVec 32) (_ BitVec 32) List!563) Unit!452)

(assert (=> d!3811 (= lt!7185 (choose!111 lt!6824 lt!6829 (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001) lt!6831))))

(assert (=> d!3811 (= (size!677 lt!6824) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3811 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!6824 lt!6829 (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001) lt!6831) lt!7185)))

(declare-fun bs!916 () Bool)

(assert (= bs!916 d!3811))

(assert (=> bs!916 m!15049))

(declare-fun m!15567 () Bool)

(assert (=> bs!916 m!15567))

(assert (=> d!3741 d!3811))

(declare-fun d!3813 () Bool)

(assert (=> d!3813 (= (validMask!0 (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938))))) (and (or (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000001111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000011111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000001111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000011111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000001111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000011111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000001111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000011111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000111111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000001111111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000011111111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000111111111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000001111111111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000011111111111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000111111111111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000001111111111111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000011111111111111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000111111111111111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000001111111111111111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000011111111111111111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000111111111111111111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00001111111111111111111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00011111111111111111111111111111) (= (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00111111111111111111111111111111)) (bvsle (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00111111111111111111111111111111)))))

(assert (=> d!3741 d!3813))

(declare-fun d!3815 () Bool)

(declare-fun res!14007 () Bool)

(declare-fun e!14245 () Bool)

(assert (=> d!3815 (=> (not res!14007) (not e!14245))))

(assert (=> d!3815 (= res!14007 (simpleValid!19 lt!6825))))

(assert (=> d!3815 (= (valid!93 lt!6825) e!14245)))

(declare-fun b!21930 () Bool)

(declare-fun res!14008 () Bool)

(assert (=> b!21930 (=> (not res!14008) (not e!14245))))

(assert (=> b!21930 (= res!14008 (= (arrayCountValidKeys!0 (_keys!3140 lt!6825) #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6825))) (_size!134 lt!6825)))))

(declare-fun b!21931 () Bool)

(declare-fun res!14009 () Bool)

(assert (=> b!21931 (=> (not res!14009) (not e!14245))))

(assert (=> b!21931 (= res!14009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3140 lt!6825) (mask!4692 lt!6825)))))

(declare-fun b!21932 () Bool)

(assert (=> b!21932 (= e!14245 (arrayNoDuplicates!0 (_keys!3140 lt!6825) #b00000000000000000000000000000000 Nil!560))))

(assert (= (and d!3815 res!14007) b!21930))

(assert (= (and b!21930 res!14008) b!21931))

(assert (= (and b!21931 res!14009) b!21932))

(declare-fun m!15569 () Bool)

(assert (=> d!3815 m!15569))

(declare-fun m!15571 () Bool)

(assert (=> b!21930 m!15571))

(declare-fun m!15573 () Bool)

(assert (=> b!21931 m!15573))

(declare-fun m!15575 () Bool)

(assert (=> b!21932 m!15575))

(assert (=> d!3741 d!3815))

(declare-fun d!3817 () Bool)

(assert (=> d!3817 (arrayForallSeekEntryOrOpenFound!0 lt!6822 lt!6820 (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun lt!7188 () Unit!452)

(declare-fun choose!34 (array!1231 (_ BitVec 32) (_ BitVec 32)) Unit!452)

(assert (=> d!3817 (= lt!7188 (choose!34 lt!6820 (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) lt!6822))))

(assert (=> d!3817 (validMask!0 (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))))))

(assert (=> d!3817 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!6820 (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) lt!6822) lt!7188)))

(declare-fun bs!917 () Bool)

(assert (= bs!917 d!3817))

(assert (=> bs!917 m!14919))

(assert (=> bs!917 m!15043))

(assert (=> bs!917 m!14919))

(declare-fun m!15577 () Bool)

(assert (=> bs!917 m!15577))

(assert (=> bs!917 m!14919))

(assert (=> bs!917 m!15041))

(assert (=> d!3741 d!3817))

(declare-fun d!3819 () Bool)

(assert (=> d!3819 (= (map!395 lt!6821) (getCurrentListMap!126 (_keys!3140 lt!6821) (_values!1708 lt!6821) (mask!4692 lt!6821) (extraKeys!1622 lt!6821) (zeroValue!1646 lt!6821) (minValue!1646 lt!6821) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6821)))))

(declare-fun bs!918 () Bool)

(assert (= bs!918 d!3819))

(declare-fun m!15579 () Bool)

(assert (=> bs!918 m!15579))

(assert (=> d!3741 d!3819))

(declare-fun b!21943 () Bool)

(declare-fun e!14256 () Bool)

(declare-fun e!14257 () Bool)

(assert (=> b!21943 (= e!14256 e!14257)))

(declare-fun res!14016 () Bool)

(assert (=> b!21943 (=> (not res!14016) (not e!14257))))

(declare-fun e!14254 () Bool)

(assert (=> b!21943 (= res!14016 (not e!14254))))

(declare-fun res!14018 () Bool)

(assert (=> b!21943 (=> (not res!14018) (not e!14254))))

(assert (=> b!21943 (= res!14018 (validKeyInArray!0 (select (arr!584 lt!6824) lt!6829)))))

(declare-fun b!21944 () Bool)

(declare-fun e!14255 () Bool)

(declare-fun call!1516 () Bool)

(assert (=> b!21944 (= e!14255 call!1516)))

(declare-fun d!3821 () Bool)

(declare-fun res!14017 () Bool)

(assert (=> d!3821 (=> res!14017 e!14256)))

(assert (=> d!3821 (= res!14017 (bvsge lt!6829 (size!677 lt!6824)))))

(assert (=> d!3821 (= (arrayNoDuplicates!0 lt!6824 lt!6829 lt!6831) e!14256)))

(declare-fun c!2601 () Bool)

(declare-fun bm!1513 () Bool)

(assert (=> bm!1513 (= call!1516 (arrayNoDuplicates!0 lt!6824 (bvadd lt!6829 #b00000000000000000000000000000001) (ite c!2601 (Cons!559 (select (arr!584 lt!6824) lt!6829) lt!6831) lt!6831)))))

(declare-fun b!21945 () Bool)

(assert (=> b!21945 (= e!14255 call!1516)))

(declare-fun b!21946 () Bool)

(assert (=> b!21946 (= e!14257 e!14255)))

(assert (=> b!21946 (= c!2601 (validKeyInArray!0 (select (arr!584 lt!6824) lt!6829)))))

(declare-fun b!21947 () Bool)

(declare-fun contains!227 (List!563 (_ BitVec 64)) Bool)

(assert (=> b!21947 (= e!14254 (contains!227 lt!6831 (select (arr!584 lt!6824) lt!6829)))))

(assert (= (and d!3821 (not res!14017)) b!21943))

(assert (= (and b!21943 res!14018) b!21947))

(assert (= (and b!21943 res!14016) b!21946))

(assert (= (and b!21946 c!2601) b!21945))

(assert (= (and b!21946 (not c!2601)) b!21944))

(assert (= (or b!21945 b!21944) bm!1513))

(declare-fun m!15581 () Bool)

(assert (=> b!21943 m!15581))

(assert (=> b!21943 m!15581))

(declare-fun m!15583 () Bool)

(assert (=> b!21943 m!15583))

(assert (=> bm!1513 m!15581))

(declare-fun m!15585 () Bool)

(assert (=> bm!1513 m!15585))

(assert (=> b!21946 m!15581))

(assert (=> b!21946 m!15581))

(assert (=> b!21946 m!15583))

(assert (=> b!21947 m!15581))

(assert (=> b!21947 m!15581))

(declare-fun m!15587 () Bool)

(assert (=> b!21947 m!15587))

(assert (=> d!3741 d!3821))

(declare-fun b!21948 () Bool)

(declare-fun e!14259 () Bool)

(declare-fun e!14260 () Bool)

(assert (=> b!21948 (= e!14259 e!14260)))

(declare-fun lt!7191 () (_ BitVec 64))

(assert (=> b!21948 (= lt!7191 (select (arr!584 lt!6820) lt!6822))))

(declare-fun lt!7190 () Unit!452)

(assert (=> b!21948 (= lt!7190 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!6820 lt!7191 lt!6822))))

(assert (=> b!21948 (arrayContainsKey!0 lt!6820 lt!7191 #b00000000000000000000000000000000)))

(declare-fun lt!7189 () Unit!452)

(assert (=> b!21948 (= lt!7189 lt!7190)))

(declare-fun res!14019 () Bool)

(assert (=> b!21948 (= res!14019 (= (seekEntryOrOpen!0 (select (arr!584 lt!6820) lt!6822) lt!6820 (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938))))) (Found!51 lt!6822)))))

(assert (=> b!21948 (=> (not res!14019) (not e!14260))))

(declare-fun b!21949 () Bool)

(declare-fun call!1517 () Bool)

(assert (=> b!21949 (= e!14259 call!1517)))

(declare-fun b!21950 () Bool)

(declare-fun e!14258 () Bool)

(assert (=> b!21950 (= e!14258 e!14259)))

(declare-fun c!2602 () Bool)

(assert (=> b!21950 (= c!2602 (validKeyInArray!0 (select (arr!584 lt!6820) lt!6822)))))

(declare-fun b!21951 () Bool)

(assert (=> b!21951 (= e!14260 call!1517)))

(declare-fun d!3823 () Bool)

(declare-fun res!14020 () Bool)

(assert (=> d!3823 (=> res!14020 e!14258)))

(assert (=> d!3823 (= res!14020 (bvsge lt!6822 (size!677 lt!6820)))))

(assert (=> d!3823 (= (arrayForallSeekEntryOrOpenFound!0 lt!6822 lt!6820 (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938))))) e!14258)))

(declare-fun bm!1514 () Bool)

(assert (=> bm!1514 (= call!1517 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!6822 #b00000000000000000000000000000001) lt!6820 (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938))))))))

(assert (= (and d!3823 (not res!14020)) b!21950))

(assert (= (and b!21950 c!2602) b!21948))

(assert (= (and b!21950 (not c!2602)) b!21949))

(assert (= (and b!21948 res!14019) b!21951))

(assert (= (or b!21951 b!21949) bm!1514))

(declare-fun m!15589 () Bool)

(assert (=> b!21948 m!15589))

(declare-fun m!15591 () Bool)

(assert (=> b!21948 m!15591))

(declare-fun m!15593 () Bool)

(assert (=> b!21948 m!15593))

(assert (=> b!21948 m!15589))

(assert (=> b!21948 m!14919))

(declare-fun m!15595 () Bool)

(assert (=> b!21948 m!15595))

(assert (=> b!21950 m!15589))

(assert (=> b!21950 m!15589))

(declare-fun m!15597 () Bool)

(assert (=> b!21950 m!15597))

(assert (=> bm!1514 m!14919))

(declare-fun m!15599 () Bool)

(assert (=> bm!1514 m!15599))

(assert (=> d!3741 d!3823))

(declare-fun b!21960 () Bool)

(declare-fun e!14265 () (_ BitVec 32))

(assert (=> b!21960 (= e!14265 #b00000000000000000000000000000000)))

(declare-fun b!21961 () Bool)

(declare-fun e!14266 () (_ BitVec 32))

(assert (=> b!21961 (= e!14265 e!14266)))

(declare-fun c!2607 () Bool)

(assert (=> b!21961 (= c!2607 (validKeyInArray!0 (select (arr!584 lt!6818) lt!6828)))))

(declare-fun b!21962 () Bool)

(declare-fun call!1520 () (_ BitVec 32))

(assert (=> b!21962 (= e!14266 (bvadd #b00000000000000000000000000000001 call!1520))))

(declare-fun b!21963 () Bool)

(assert (=> b!21963 (= e!14266 call!1520)))

(declare-fun d!3825 () Bool)

(declare-fun lt!7194 () (_ BitVec 32))

(assert (=> d!3825 (and (bvsge lt!7194 #b00000000000000000000000000000000) (bvsle lt!7194 (bvsub (size!677 lt!6818) lt!6828)))))

(assert (=> d!3825 (= lt!7194 e!14265)))

(declare-fun c!2608 () Bool)

(assert (=> d!3825 (= c!2608 (bvsge lt!6828 lt!6834))))

(assert (=> d!3825 (and (bvsle lt!6828 lt!6834) (bvsge lt!6828 #b00000000000000000000000000000000) (bvsle lt!6834 (size!677 lt!6818)))))

(assert (=> d!3825 (= (arrayCountValidKeys!0 lt!6818 lt!6828 lt!6834) lt!7194)))

(declare-fun bm!1517 () Bool)

(assert (=> bm!1517 (= call!1520 (arrayCountValidKeys!0 lt!6818 (bvadd lt!6828 #b00000000000000000000000000000001) lt!6834))))

(assert (= (and d!3825 c!2608) b!21960))

(assert (= (and d!3825 (not c!2608)) b!21961))

(assert (= (and b!21961 c!2607) b!21962))

(assert (= (and b!21961 (not c!2607)) b!21963))

(assert (= (or b!21962 b!21963) bm!1517))

(declare-fun m!15601 () Bool)

(assert (=> b!21961 m!15601))

(assert (=> b!21961 m!15601))

(declare-fun m!15603 () Bool)

(assert (=> b!21961 m!15603))

(declare-fun m!15605 () Bool)

(assert (=> bm!1517 m!15605))

(assert (=> d!3741 d!3825))

(declare-fun d!3827 () Bool)

(assert (=> d!3827 (= (arrayCountValidKeys!0 lt!6818 lt!6828 lt!6834) #b00000000000000000000000000000000)))

(declare-fun lt!7197 () Unit!452)

(declare-fun choose!59 (array!1231 (_ BitVec 32) (_ BitVec 32)) Unit!452)

(assert (=> d!3827 (= lt!7197 (choose!59 lt!6818 lt!6828 lt!6834))))

(assert (=> d!3827 (bvslt (size!677 lt!6818) #b01111111111111111111111111111111)))

(assert (=> d!3827 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!6818 lt!6828 lt!6834) lt!7197)))

(declare-fun bs!919 () Bool)

(assert (= bs!919 d!3827))

(assert (=> bs!919 m!15035))

(declare-fun m!15607 () Bool)

(assert (=> bs!919 m!15607))

(assert (=> d!3741 d!3827))

(declare-fun b!21964 () Bool)

(declare-fun e!14269 () Bool)

(declare-fun e!14270 () Bool)

(assert (=> b!21964 (= e!14269 e!14270)))

(declare-fun res!14021 () Bool)

(assert (=> b!21964 (=> (not res!14021) (not e!14270))))

(declare-fun e!14267 () Bool)

(assert (=> b!21964 (= res!14021 (not e!14267))))

(declare-fun res!14023 () Bool)

(assert (=> b!21964 (=> (not res!14023) (not e!14267))))

(assert (=> b!21964 (= res!14023 (validKeyInArray!0 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000)))))

(declare-fun b!21965 () Bool)

(declare-fun e!14268 () Bool)

(declare-fun call!1521 () Bool)

(assert (=> b!21965 (= e!14268 call!1521)))

(declare-fun d!3829 () Bool)

(declare-fun res!14022 () Bool)

(assert (=> d!3829 (=> res!14022 e!14269)))

(assert (=> d!3829 (= res!14022 (bvsge #b00000000000000000000000000000000 (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681))))))))

(assert (=> d!3829 (= (arrayNoDuplicates!0 (_keys!3140 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000000 Nil!560) e!14269)))

(declare-fun bm!1518 () Bool)

(declare-fun c!2609 () Bool)

(assert (=> bm!1518 (= call!1521 (arrayNoDuplicates!0 (_keys!3140 (v!1573 (_2!452 lt!6681))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!2609 (Cons!559 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000) Nil!560) Nil!560)))))

(declare-fun b!21966 () Bool)

(assert (=> b!21966 (= e!14268 call!1521)))

(declare-fun b!21967 () Bool)

(assert (=> b!21967 (= e!14270 e!14268)))

(assert (=> b!21967 (= c!2609 (validKeyInArray!0 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000)))))

(declare-fun b!21968 () Bool)

(assert (=> b!21968 (= e!14267 (contains!227 Nil!560 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000)))))

(assert (= (and d!3829 (not res!14022)) b!21964))

(assert (= (and b!21964 res!14023) b!21968))

(assert (= (and b!21964 res!14021) b!21967))

(assert (= (and b!21967 c!2609) b!21966))

(assert (= (and b!21967 (not c!2609)) b!21965))

(assert (= (or b!21966 b!21965) bm!1518))

(assert (=> b!21964 m!15205))

(assert (=> b!21964 m!15205))

(assert (=> b!21964 m!15213))

(assert (=> bm!1518 m!15205))

(declare-fun m!15609 () Bool)

(assert (=> bm!1518 m!15609))

(assert (=> b!21967 m!15205))

(assert (=> b!21967 m!15205))

(assert (=> b!21967 m!15213))

(assert (=> b!21968 m!15205))

(assert (=> b!21968 m!15205))

(declare-fun m!15611 () Bool)

(assert (=> b!21968 m!15611))

(assert (=> b!21535 d!3829))

(declare-fun d!3831 () Bool)

(declare-fun res!14024 () Bool)

(declare-fun e!14271 () Bool)

(assert (=> d!3831 (=> (not res!14024) (not e!14271))))

(assert (=> d!3831 (= res!14024 (simpleValid!19 (v!1573 (underlying!104 thiss!938))))))

(assert (=> d!3831 (= (valid!93 (v!1573 (underlying!104 thiss!938))) e!14271)))

(declare-fun b!21969 () Bool)

(declare-fun res!14025 () Bool)

(assert (=> b!21969 (=> (not res!14025) (not e!14271))))

(assert (=> b!21969 (= res!14025 (= (arrayCountValidKeys!0 (_keys!3140 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000000 (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938))))) (_size!134 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun b!21970 () Bool)

(declare-fun res!14026 () Bool)

(assert (=> b!21970 (=> (not res!14026) (not e!14271))))

(assert (=> b!21970 (= res!14026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3140 (v!1573 (underlying!104 thiss!938))) (mask!4692 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun b!21971 () Bool)

(assert (=> b!21971 (= e!14271 (arrayNoDuplicates!0 (_keys!3140 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000000 Nil!560))))

(assert (= (and d!3831 res!14024) b!21969))

(assert (= (and b!21969 res!14025) b!21970))

(assert (= (and b!21970 res!14026) b!21971))

(declare-fun m!15613 () Bool)

(assert (=> d!3831 m!15613))

(declare-fun m!15615 () Bool)

(assert (=> b!21969 m!15615))

(declare-fun m!15617 () Bool)

(assert (=> b!21970 m!15617))

(declare-fun m!15619 () Bool)

(assert (=> b!21971 m!15619))

(assert (=> d!3745 d!3831))

(declare-fun d!3833 () Bool)

(declare-fun e!14272 () Bool)

(assert (=> d!3833 e!14272))

(declare-fun res!14027 () Bool)

(assert (=> d!3833 (=> res!14027 e!14272)))

(declare-fun lt!7198 () Bool)

(assert (=> d!3833 (= res!14027 (not lt!7198))))

(declare-fun lt!7199 () Bool)

(assert (=> d!3833 (= lt!7198 lt!7199)))

(declare-fun lt!7201 () Unit!452)

(declare-fun e!14273 () Unit!452)

(assert (=> d!3833 (= lt!7201 e!14273)))

(declare-fun c!2610 () Bool)

(assert (=> d!3833 (= c!2610 lt!7199)))

(assert (=> d!3833 (= lt!7199 (containsKey!24 (toList!295 e!14084) (ite c!2521 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918)))))))

(assert (=> d!3833 (= (contains!225 e!14084 (ite c!2521 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918)))) lt!7198)))

(declare-fun b!21972 () Bool)

(declare-fun lt!7200 () Unit!452)

(assert (=> b!21972 (= e!14273 lt!7200)))

(assert (=> b!21972 (= lt!7200 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!295 e!14084) (ite c!2521 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918)))))))

(assert (=> b!21972 (isDefined!22 (getValueByKey!60 (toList!295 e!14084) (ite c!2521 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918)))))))

(declare-fun b!21973 () Bool)

(declare-fun Unit!472 () Unit!452)

(assert (=> b!21973 (= e!14273 Unit!472)))

(declare-fun b!21974 () Bool)

(assert (=> b!21974 (= e!14272 (isDefined!22 (getValueByKey!60 (toList!295 e!14084) (ite c!2521 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918))))))))

(assert (= (and d!3833 c!2610) b!21972))

(assert (= (and d!3833 (not c!2610)) b!21973))

(assert (= (and d!3833 (not res!14027)) b!21974))

(declare-fun m!15621 () Bool)

(assert (=> d!3833 m!15621))

(declare-fun m!15623 () Bool)

(assert (=> b!21972 m!15623))

(declare-fun m!15625 () Bool)

(assert (=> b!21972 m!15625))

(assert (=> b!21972 m!15625))

(declare-fun m!15627 () Bool)

(assert (=> b!21972 m!15627))

(assert (=> b!21974 m!15625))

(assert (=> b!21974 m!15625))

(assert (=> b!21974 m!15627))

(assert (=> bm!1434 d!3833))

(declare-fun d!3835 () Bool)

(declare-fun e!14274 () Bool)

(assert (=> d!3835 e!14274))

(declare-fun res!14028 () Bool)

(assert (=> d!3835 (=> res!14028 e!14274)))

(declare-fun lt!7202 () Bool)

(assert (=> d!3835 (= res!14028 (not lt!7202))))

(declare-fun lt!7203 () Bool)

(assert (=> d!3835 (= lt!7202 lt!7203)))

(declare-fun lt!7205 () Unit!452)

(declare-fun e!14275 () Unit!452)

(assert (=> d!3835 (= lt!7205 e!14275)))

(declare-fun c!2611 () Bool)

(assert (=> d!3835 (= c!2611 lt!7203)))

(assert (=> d!3835 (= lt!7203 (containsKey!24 (toList!295 lt!6762) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3835 (= (contains!225 lt!6762 #b0000000000000000000000000000000000000000000000000000000000000000) lt!7202)))

(declare-fun b!21975 () Bool)

(declare-fun lt!7204 () Unit!452)

(assert (=> b!21975 (= e!14275 lt!7204)))

(assert (=> b!21975 (= lt!7204 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!295 lt!6762) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21975 (isDefined!22 (getValueByKey!60 (toList!295 lt!6762) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21976 () Bool)

(declare-fun Unit!473 () Unit!452)

(assert (=> b!21976 (= e!14275 Unit!473)))

(declare-fun b!21977 () Bool)

(assert (=> b!21977 (= e!14274 (isDefined!22 (getValueByKey!60 (toList!295 lt!6762) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!3835 c!2611) b!21975))

(assert (= (and d!3835 (not c!2611)) b!21976))

(assert (= (and d!3835 (not res!14028)) b!21977))

(declare-fun m!15629 () Bool)

(assert (=> d!3835 m!15629))

(declare-fun m!15631 () Bool)

(assert (=> b!21975 m!15631))

(declare-fun m!15633 () Bool)

(assert (=> b!21975 m!15633))

(assert (=> b!21975 m!15633))

(declare-fun m!15635 () Bool)

(assert (=> b!21975 m!15635))

(assert (=> b!21977 m!15633))

(assert (=> b!21977 m!15633))

(assert (=> b!21977 m!15635))

(assert (=> bm!1372 d!3835))

(assert (=> bm!1450 d!3761))

(declare-fun d!3837 () Bool)

(declare-fun e!14276 () Bool)

(assert (=> d!3837 e!14276))

(declare-fun res!14029 () Bool)

(assert (=> d!3837 (=> res!14029 e!14276)))

(declare-fun lt!7206 () Bool)

(assert (=> d!3837 (= res!14029 (not lt!7206))))

(declare-fun lt!7207 () Bool)

(assert (=> d!3837 (= lt!7206 lt!7207)))

(declare-fun lt!7209 () Unit!452)

(declare-fun e!14277 () Unit!452)

(assert (=> d!3837 (= lt!7209 e!14277)))

(declare-fun c!2612 () Bool)

(assert (=> d!3837 (= c!2612 lt!7207)))

(assert (=> d!3837 (= lt!7207 (containsKey!24 (toList!295 lt!6762) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3837 (= (contains!225 lt!6762 #b1000000000000000000000000000000000000000000000000000000000000000) lt!7206)))

(declare-fun b!21978 () Bool)

(declare-fun lt!7208 () Unit!452)

(assert (=> b!21978 (= e!14277 lt!7208)))

(assert (=> b!21978 (= lt!7208 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!295 lt!6762) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21978 (isDefined!22 (getValueByKey!60 (toList!295 lt!6762) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21979 () Bool)

(declare-fun Unit!474 () Unit!452)

(assert (=> b!21979 (= e!14277 Unit!474)))

(declare-fun b!21980 () Bool)

(assert (=> b!21980 (= e!14276 (isDefined!22 (getValueByKey!60 (toList!295 lt!6762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!3837 c!2612) b!21978))

(assert (= (and d!3837 (not c!2612)) b!21979))

(assert (= (and d!3837 (not res!14029)) b!21980))

(declare-fun m!15637 () Bool)

(assert (=> d!3837 m!15637))

(declare-fun m!15639 () Bool)

(assert (=> b!21978 m!15639))

(assert (=> b!21978 m!15373))

(assert (=> b!21978 m!15373))

(declare-fun m!15641 () Bool)

(assert (=> b!21978 m!15641))

(assert (=> b!21980 m!15373))

(assert (=> b!21980 m!15373))

(assert (=> b!21980 m!15641))

(assert (=> bm!1368 d!3837))

(declare-fun d!3839 () Bool)

(declare-fun e!14281 () Bool)

(assert (=> d!3839 e!14281))

(declare-fun res!14034 () Bool)

(assert (=> d!3839 (=> (not res!14034) (not e!14281))))

(declare-fun lt!7235 () tuple2!896)

(assert (=> d!3839 (= res!14034 (_1!451 lt!7235))))

(assert (=> d!3839 (= lt!7235 (tuple2!897 true (LongMapFixedSize!187 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (bvadd (_size!134 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000001) (array!1232 (store (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))) (array!1230 (store (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (ValueCellFull!300 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)))) (_vacant!134 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun lt!7234 () Unit!452)

(declare-fun lt!7236 () Unit!452)

(assert (=> d!3839 (= lt!7234 lt!7236)))

(declare-fun lt!7239 () array!1231)

(declare-fun lt!7217 () array!1229)

(assert (=> d!3839 (contains!225 (getCurrentListMap!126 lt!7239 lt!7217 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) (select (store (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918))))))

(assert (=> d!3839 (= lt!7236 (lemmaValidKeyInArrayIsInListMap!7 lt!7239 lt!7217 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(assert (=> d!3839 (= lt!7217 (array!1230 (store (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (ValueCellFull!300 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(assert (=> d!3839 (= lt!7239 (array!1232 (store (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun lt!7211 () Unit!452)

(declare-fun lt!7215 () Unit!452)

(assert (=> d!3839 (= lt!7211 lt!7215)))

(declare-fun lt!7213 () array!1231)

(assert (=> d!3839 (= (arrayCountValidKeys!0 lt!7213 (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (bvadd (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!3839 (= lt!7215 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!7213 (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918))))))

(assert (=> d!3839 (= lt!7213 (array!1232 (store (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun lt!7212 () Unit!452)

(declare-fun lt!7231 () Unit!452)

(assert (=> d!3839 (= lt!7212 lt!7231)))

(declare-fun lt!7227 () array!1231)

(assert (=> d!3839 (arrayContainsKey!0 lt!7227 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000)))

(assert (=> d!3839 (= lt!7231 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!7227 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918))))))

(assert (=> d!3839 (= lt!7227 (array!1232 (store (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun lt!7219 () Unit!452)

(declare-fun lt!7221 () Unit!452)

(assert (=> d!3839 (= lt!7219 lt!7221)))

(assert (=> d!3839 (= (+!42 (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (getCurrentListMap!126 (array!1232 (store (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))) (array!1230 (store (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (ValueCellFull!300 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)))) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(assert (=> d!3839 (= lt!7221 (lemmaAddValidKeyToArrayThenAddPairToListMap!2 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!7226 () Unit!452)

(declare-fun lt!7223 () Unit!452)

(assert (=> d!3839 (= lt!7226 lt!7223)))

(assert (=> d!3839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!1232 (store (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)))))

(assert (=> d!3839 (= lt!7223 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!7232 () Unit!452)

(declare-fun lt!7238 () Unit!452)

(assert (=> d!3839 (= lt!7232 lt!7238)))

(assert (=> d!3839 (= (arrayCountValidKeys!0 (array!1232 (store (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))) #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))) (bvadd (arrayCountValidKeys!0 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))) #b00000000000000000000000000000001))))

(assert (=> d!3839 (= lt!7238 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!7222 () Unit!452)

(declare-fun lt!7214 () Unit!452)

(assert (=> d!3839 (= lt!7222 lt!7214)))

(declare-fun lt!7225 () (_ BitVec 32))

(declare-fun lt!7237 () List!563)

(assert (=> d!3839 (arrayNoDuplicates!0 (array!1232 (store (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))) lt!7225 lt!7237)))

(assert (=> d!3839 (= lt!7214 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918)) lt!7225 lt!7237))))

(assert (=> d!3839 (= lt!7237 Nil!560)))

(assert (=> d!3839 (= lt!7225 #b00000000000000000000000000000000)))

(declare-fun lt!7224 () Unit!452)

(declare-fun e!14279 () Unit!452)

(assert (=> d!3839 (= lt!7224 e!14279)))

(declare-fun c!2614 () Bool)

(assert (=> d!3839 (= c!2614 (arrayContainsKey!0 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun lt!7218 () Unit!452)

(declare-fun e!14280 () Unit!452)

(assert (=> d!3839 (= lt!7218 e!14280)))

(declare-fun c!2616 () Bool)

(assert (=> d!3839 (= c!2616 (contains!225 (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3839 (valid!93 (ite c!2454 (_2!451 lt!6679) lt!6678))))

(assert (=> d!3839 (= (updateHelperNewKey!7 (ite c!2454 (_2!451 lt!6679) lt!6678) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (ite c!2518 (index!2327 lt!6918) (index!2324 lt!6918))) lt!7235)))

(declare-fun b!21981 () Bool)

(declare-fun res!14037 () Bool)

(declare-fun e!14278 () Bool)

(assert (=> b!21981 (=> (not res!14037) (not e!14278))))

(declare-fun lt!7228 () SeekEntryResult!51)

(assert (=> b!21981 (= res!14037 (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2324 lt!7228)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21982 () Bool)

(declare-fun Unit!475 () Unit!452)

(assert (=> b!21982 (= e!14279 Unit!475)))

(declare-fun bm!1519 () Bool)

(declare-fun call!1525 () Bool)

(assert (=> bm!1519 (= call!1525 (arrayContainsKey!0 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun bm!1520 () Bool)

(declare-fun call!1522 () Bool)

(declare-fun call!1524 () Bool)

(assert (=> bm!1520 (= call!1522 call!1524)))

(declare-fun bm!1521 () Bool)

(declare-fun c!2613 () Bool)

(declare-fun lt!7220 () SeekEntryResult!51)

(assert (=> bm!1521 (= call!1524 (inRange!0 (ite c!2616 (index!2325 lt!7220) (ite c!2613 (index!2324 lt!7228) (index!2327 lt!7228))) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!21983 () Bool)

(declare-fun c!2615 () Bool)

(assert (=> b!21983 (= c!2615 ((_ is MissingVacant!51) lt!7228))))

(declare-fun e!14285 () Bool)

(declare-fun e!14282 () Bool)

(assert (=> b!21983 (= e!14285 e!14282)))

(declare-fun b!21984 () Bool)

(assert (=> b!21984 (= e!14282 ((_ is Undefined!51) lt!7228))))

(declare-fun b!21985 () Bool)

(declare-fun Unit!476 () Unit!452)

(assert (=> b!21985 (= e!14280 Unit!476)))

(declare-fun lt!7229 () Unit!452)

(assert (=> b!21985 (= lt!7229 (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun call!1523 () SeekEntryResult!51)

(assert (=> b!21985 (= lt!7220 call!1523)))

(declare-fun res!14032 () Bool)

(assert (=> b!21985 (= res!14032 ((_ is Found!51) lt!7220))))

(declare-fun e!14283 () Bool)

(assert (=> b!21985 (=> (not res!14032) (not e!14283))))

(assert (=> b!21985 e!14283))

(declare-fun lt!7216 () Unit!452)

(assert (=> b!21985 (= lt!7216 lt!7229)))

(assert (=> b!21985 false))

(declare-fun b!21986 () Bool)

(assert (=> b!21986 (= e!14278 (not call!1525))))

(declare-fun b!21987 () Bool)

(declare-fun e!14284 () Bool)

(assert (=> b!21987 (= e!14284 (not call!1525))))

(declare-fun b!21988 () Bool)

(declare-fun res!14036 () Bool)

(assert (=> b!21988 (=> (not res!14036) (not e!14281))))

(assert (=> b!21988 (= res!14036 (valid!93 (_2!451 lt!7235)))))

(declare-fun b!21989 () Bool)

(declare-fun res!14033 () Bool)

(assert (=> b!21989 (= res!14033 call!1524)))

(assert (=> b!21989 (=> (not res!14033) (not e!14283))))

(declare-fun b!21990 () Bool)

(assert (=> b!21990 (= e!14281 (= (map!395 (_2!451 lt!7235)) (+!42 (map!395 (ite c!2454 (_2!451 lt!6679) lt!6678)) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))))

(declare-fun b!21991 () Bool)

(assert (=> b!21991 (= e!14283 (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!7220)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!21992 () Bool)

(declare-fun res!14038 () Bool)

(assert (=> b!21992 (=> (not res!14038) (not e!14281))))

(assert (=> b!21992 (= res!14038 (contains!225 (map!395 (_2!451 lt!7235)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!21993 () Bool)

(declare-fun res!14035 () Bool)

(assert (=> b!21993 (= res!14035 (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2327 lt!7228)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21993 (=> (not res!14035) (not e!14284))))

(declare-fun bm!1522 () Bool)

(assert (=> bm!1522 (= call!1523 (seekEntryOrOpen!0 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!21994 () Bool)

(declare-fun Unit!477 () Unit!452)

(assert (=> b!21994 (= e!14279 Unit!477)))

(declare-fun lt!7233 () Unit!452)

(assert (=> b!21994 (= lt!7233 (lemmaArrayContainsKeyThenInListMap!2 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(assert (=> b!21994 (contains!225 (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!7230 () Unit!452)

(assert (=> b!21994 (= lt!7230 lt!7233)))

(assert (=> b!21994 false))

(declare-fun b!21995 () Bool)

(declare-fun lt!7210 () Unit!452)

(assert (=> b!21995 (= e!14280 lt!7210)))

(assert (=> b!21995 (= lt!7210 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(assert (=> b!21995 (= lt!7228 call!1523)))

(assert (=> b!21995 (= c!2613 ((_ is MissingZero!51) lt!7228))))

(assert (=> b!21995 e!14285))

(declare-fun b!21996 () Bool)

(declare-fun res!14031 () Bool)

(assert (=> b!21996 (=> (not res!14031) (not e!14278))))

(assert (=> b!21996 (= res!14031 call!1522)))

(assert (=> b!21996 (= e!14285 e!14278)))

(declare-fun b!21997 () Bool)

(assert (=> b!21997 (= e!14282 e!14284)))

(declare-fun res!14030 () Bool)

(assert (=> b!21997 (= res!14030 call!1522)))

(assert (=> b!21997 (=> (not res!14030) (not e!14284))))

(assert (= (and d!3839 c!2616) b!21985))

(assert (= (and d!3839 (not c!2616)) b!21995))

(assert (= (and b!21985 res!14032) b!21989))

(assert (= (and b!21989 res!14033) b!21991))

(assert (= (and b!21995 c!2613) b!21996))

(assert (= (and b!21995 (not c!2613)) b!21983))

(assert (= (and b!21996 res!14031) b!21981))

(assert (= (and b!21981 res!14037) b!21986))

(assert (= (and b!21983 c!2615) b!21997))

(assert (= (and b!21983 (not c!2615)) b!21984))

(assert (= (and b!21997 res!14030) b!21993))

(assert (= (and b!21993 res!14035) b!21987))

(assert (= (or b!21996 b!21997) bm!1520))

(assert (= (or b!21986 b!21987) bm!1519))

(assert (= (or b!21989 bm!1520) bm!1521))

(assert (= (or b!21985 b!21995) bm!1522))

(assert (= (and d!3839 c!2614) b!21994))

(assert (= (and d!3839 (not c!2614)) b!21982))

(assert (= (and d!3839 res!14034) b!21988))

(assert (= (and b!21988 res!14036) b!21992))

(assert (= (and b!21992 res!14038) b!21990))

(declare-fun m!15643 () Bool)

(assert (=> bm!1521 m!15643))

(assert (=> bm!1522 m!15091))

(declare-fun m!15645 () Bool)

(assert (=> b!21994 m!15645))

(assert (=> b!21994 m!15101))

(assert (=> b!21994 m!15101))

(declare-fun m!15647 () Bool)

(assert (=> b!21994 m!15647))

(declare-fun m!15649 () Bool)

(assert (=> b!21988 m!15649))

(declare-fun m!15651 () Bool)

(assert (=> d!3839 m!15651))

(declare-fun m!15653 () Bool)

(assert (=> d!3839 m!15653))

(declare-fun m!15655 () Bool)

(assert (=> d!3839 m!15655))

(declare-fun m!15657 () Bool)

(assert (=> d!3839 m!15657))

(declare-fun m!15659 () Bool)

(assert (=> d!3839 m!15659))

(declare-fun m!15661 () Bool)

(assert (=> d!3839 m!15661))

(declare-fun m!15663 () Bool)

(assert (=> d!3839 m!15663))

(declare-fun m!15665 () Bool)

(assert (=> d!3839 m!15665))

(assert (=> d!3839 m!15665))

(assert (=> d!3839 m!15655))

(declare-fun m!15667 () Bool)

(assert (=> d!3839 m!15667))

(declare-fun m!15669 () Bool)

(assert (=> d!3839 m!15669))

(declare-fun m!15671 () Bool)

(assert (=> d!3839 m!15671))

(declare-fun m!15673 () Bool)

(assert (=> d!3839 m!15673))

(declare-fun m!15675 () Bool)

(assert (=> d!3839 m!15675))

(assert (=> d!3839 m!15101))

(declare-fun m!15677 () Bool)

(assert (=> d!3839 m!15677))

(declare-fun m!15679 () Bool)

(assert (=> d!3839 m!15679))

(assert (=> d!3839 m!15101))

(assert (=> d!3839 m!15647))

(assert (=> d!3839 m!15089))

(assert (=> d!3839 m!15075))

(declare-fun m!15681 () Bool)

(assert (=> d!3839 m!15681))

(declare-fun m!15683 () Bool)

(assert (=> d!3839 m!15683))

(assert (=> d!3839 m!15485))

(assert (=> d!3839 m!15101))

(declare-fun m!15685 () Bool)

(assert (=> d!3839 m!15685))

(declare-fun m!15687 () Bool)

(assert (=> d!3839 m!15687))

(declare-fun m!15689 () Bool)

(assert (=> b!21993 m!15689))

(declare-fun m!15691 () Bool)

(assert (=> b!21992 m!15691))

(assert (=> b!21992 m!15691))

(declare-fun m!15693 () Bool)

(assert (=> b!21992 m!15693))

(assert (=> b!21990 m!15691))

(assert (=> b!21990 m!15071))

(assert (=> b!21990 m!15071))

(declare-fun m!15695 () Bool)

(assert (=> b!21990 m!15695))

(assert (=> b!21985 m!15123))

(declare-fun m!15697 () Bool)

(assert (=> b!21981 m!15697))

(assert (=> b!21995 m!15085))

(declare-fun m!15699 () Bool)

(assert (=> b!21991 m!15699))

(assert (=> bm!1519 m!15089))

(assert (=> bm!1440 d!3839))

(declare-fun d!3841 () Bool)

(declare-fun res!14039 () Bool)

(declare-fun e!14286 () Bool)

(assert (=> d!3841 (=> (not res!14039) (not e!14286))))

(assert (=> d!3841 (= res!14039 (simpleValid!19 (_2!451 lt!6942)))))

(assert (=> d!3841 (= (valid!93 (_2!451 lt!6942)) e!14286)))

(declare-fun b!21998 () Bool)

(declare-fun res!14040 () Bool)

(assert (=> b!21998 (=> (not res!14040) (not e!14286))))

(assert (=> b!21998 (= res!14040 (= (arrayCountValidKeys!0 (_keys!3140 (_2!451 lt!6942)) #b00000000000000000000000000000000 (size!677 (_keys!3140 (_2!451 lt!6942)))) (_size!134 (_2!451 lt!6942))))))

(declare-fun b!21999 () Bool)

(declare-fun res!14041 () Bool)

(assert (=> b!21999 (=> (not res!14041) (not e!14286))))

(assert (=> b!21999 (= res!14041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3140 (_2!451 lt!6942)) (mask!4692 (_2!451 lt!6942))))))

(declare-fun b!22000 () Bool)

(assert (=> b!22000 (= e!14286 (arrayNoDuplicates!0 (_keys!3140 (_2!451 lt!6942)) #b00000000000000000000000000000000 Nil!560))))

(assert (= (and d!3841 res!14039) b!21998))

(assert (= (and b!21998 res!14040) b!21999))

(assert (= (and b!21999 res!14041) b!22000))

(declare-fun m!15701 () Bool)

(assert (=> d!3841 m!15701))

(declare-fun m!15703 () Bool)

(assert (=> b!21998 m!15703))

(declare-fun m!15705 () Bool)

(assert (=> b!21999 m!15705))

(declare-fun m!15707 () Bool)

(assert (=> b!22000 m!15707))

(assert (=> d!3757 d!3841))

(declare-fun d!3843 () Bool)

(declare-fun res!14042 () Bool)

(declare-fun e!14287 () Bool)

(assert (=> d!3843 (=> (not res!14042) (not e!14287))))

(assert (=> d!3843 (= res!14042 (simpleValid!19 lt!6678))))

(assert (=> d!3843 (= (valid!93 lt!6678) e!14287)))

(declare-fun b!22001 () Bool)

(declare-fun res!14043 () Bool)

(assert (=> b!22001 (=> (not res!14043) (not e!14287))))

(assert (=> b!22001 (= res!14043 (= (arrayCountValidKeys!0 (_keys!3140 lt!6678) #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))) (_size!134 lt!6678)))))

(declare-fun b!22002 () Bool)

(declare-fun res!14044 () Bool)

(assert (=> b!22002 (=> (not res!14044) (not e!14287))))

(assert (=> b!22002 (= res!14044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3140 lt!6678) (mask!4692 lt!6678)))))

(declare-fun b!22003 () Bool)

(assert (=> b!22003 (= e!14287 (arrayNoDuplicates!0 (_keys!3140 lt!6678) #b00000000000000000000000000000000 Nil!560))))

(assert (= (and d!3843 res!14042) b!22001))

(assert (= (and b!22001 res!14043) b!22002))

(assert (= (and b!22002 res!14044) b!22003))

(declare-fun m!15709 () Bool)

(assert (=> d!3843 m!15709))

(assert (=> b!22001 m!15337))

(declare-fun m!15711 () Bool)

(assert (=> b!22002 m!15711))

(declare-fun m!15713 () Bool)

(assert (=> b!22003 m!15713))

(assert (=> d!3757 d!3843))

(declare-fun d!3845 () Bool)

(declare-fun e!14290 () Bool)

(assert (=> d!3845 e!14290))

(declare-fun res!14049 () Bool)

(assert (=> d!3845 (=> (not res!14049) (not e!14290))))

(declare-fun lt!7244 () SeekEntryResult!51)

(assert (=> d!3845 (= res!14049 ((_ is Found!51) lt!7244))))

(assert (=> d!3845 (= lt!7244 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3140 lt!6678) (mask!4692 lt!6678)))))

(declare-fun lt!7245 () Unit!452)

(declare-fun choose!199 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 (_ BitVec 64) Int) Unit!452)

(assert (=> d!3845 (= lt!7245 (choose!199 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(assert (=> d!3845 (validMask!0 (mask!4692 lt!6678))))

(assert (=> d!3845 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1719 lt!6678)) lt!7245)))

(declare-fun b!22008 () Bool)

(declare-fun res!14050 () Bool)

(assert (=> b!22008 (=> (not res!14050) (not e!14290))))

(assert (=> b!22008 (= res!14050 (inRange!0 (index!2325 lt!7244) (mask!4692 lt!6678)))))

(declare-fun b!22009 () Bool)

(assert (=> b!22009 (= e!14290 (= (select (arr!584 (_keys!3140 lt!6678)) (index!2325 lt!7244)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22009 (and (bvsge (index!2325 lt!7244) #b00000000000000000000000000000000) (bvslt (index!2325 lt!7244) (size!677 (_keys!3140 lt!6678))))))

(assert (= (and d!3845 res!14049) b!22008))

(assert (= (and b!22008 res!14050) b!22009))

(assert (=> d!3845 m!15151))

(declare-fun m!15715 () Bool)

(assert (=> d!3845 m!15715))

(assert (=> d!3845 m!15191))

(declare-fun m!15717 () Bool)

(assert (=> b!22008 m!15717))

(declare-fun m!15719 () Bool)

(assert (=> b!22009 m!15719))

(assert (=> bm!1448 d!3845))

(declare-fun d!3847 () Bool)

(assert (=> d!3847 (= (map!395 (_2!451 lt!6915)) (getCurrentListMap!126 (_keys!3140 (_2!451 lt!6915)) (_values!1708 (_2!451 lt!6915)) (mask!4692 (_2!451 lt!6915)) (extraKeys!1622 (_2!451 lt!6915)) (zeroValue!1646 (_2!451 lt!6915)) (minValue!1646 (_2!451 lt!6915)) #b00000000000000000000000000000000 (defaultEntry!1719 (_2!451 lt!6915))))))

(declare-fun bs!920 () Bool)

(assert (= bs!920 d!3847))

(declare-fun m!15721 () Bool)

(assert (=> bs!920 m!15721))

(assert (=> bm!1423 d!3847))

(declare-fun d!3849 () Bool)

(declare-fun e!14308 () Bool)

(assert (=> d!3849 e!14308))

(declare-fun res!14060 () Bool)

(assert (=> d!3849 (=> (not res!14060) (not e!14308))))

(declare-fun lt!7263 () ListLongMap!559)

(assert (=> d!3849 (= res!14060 (not (contains!225 lt!7263 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!14305 () ListLongMap!559)

(assert (=> d!3849 (= lt!7263 e!14305)))

(declare-fun c!2626 () Bool)

(assert (=> d!3849 (= c!2626 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938))))))))

(assert (=> d!3849 (validMask!0 (mask!4692 (v!1573 (underlying!104 thiss!938))))))

(assert (=> d!3849 (= (getCurrentListMapNoExtraKeys!13 (_keys!3140 (v!1573 (underlying!104 thiss!938))) (_values!1708 (v!1573 (underlying!104 thiss!938))) (mask!4692 (v!1573 (underlying!104 thiss!938))) (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938)))) lt!7263)))

(declare-fun bm!1525 () Bool)

(declare-fun call!1528 () ListLongMap!559)

(assert (=> bm!1525 (= call!1528 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (v!1573 (underlying!104 thiss!938))) (_values!1708 (v!1573 (underlying!104 thiss!938))) (mask!4692 (v!1573 (underlying!104 thiss!938))) (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun b!22034 () Bool)

(declare-fun e!14307 () Bool)

(declare-fun e!14310 () Bool)

(assert (=> b!22034 (= e!14307 e!14310)))

(assert (=> b!22034 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938))))))))

(declare-fun res!14059 () Bool)

(assert (=> b!22034 (= res!14059 (contains!225 lt!7263 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))))))

(assert (=> b!22034 (=> (not res!14059) (not e!14310))))

(declare-fun b!22035 () Bool)

(declare-fun e!14309 () ListLongMap!559)

(assert (=> b!22035 (= e!14309 call!1528)))

(declare-fun b!22036 () Bool)

(assert (=> b!22036 (= e!14305 e!14309)))

(declare-fun c!2627 () Bool)

(assert (=> b!22036 (= c!2627 (validKeyInArray!0 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))))))

(declare-fun b!22037 () Bool)

(declare-fun e!14311 () Bool)

(assert (=> b!22037 (= e!14311 (validKeyInArray!0 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))))))

(assert (=> b!22037 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000)))

(declare-fun b!22038 () Bool)

(declare-fun e!14306 () Bool)

(assert (=> b!22038 (= e!14307 e!14306)))

(declare-fun c!2628 () Bool)

(assert (=> b!22038 (= c!2628 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938))))))))

(declare-fun b!22039 () Bool)

(declare-fun res!14061 () Bool)

(assert (=> b!22039 (=> (not res!14061) (not e!14308))))

(assert (=> b!22039 (= res!14061 (not (contains!225 lt!7263 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!22040 () Bool)

(assert (=> b!22040 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938))))))))

(assert (=> b!22040 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (size!676 (_values!1708 (v!1573 (underlying!104 thiss!938))))))))

(assert (=> b!22040 (= e!14310 (= (apply!28 lt!7263 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))) (get!377 (select (arr!583 (_values!1708 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!141 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!22041 () Bool)

(assert (=> b!22041 (= e!14308 e!14307)))

(declare-fun c!2625 () Bool)

(assert (=> b!22041 (= c!2625 e!14311)))

(declare-fun res!14062 () Bool)

(assert (=> b!22041 (=> (not res!14062) (not e!14311))))

(assert (=> b!22041 (= res!14062 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938))))))))

(declare-fun b!22042 () Bool)

(assert (=> b!22042 (= e!14306 (= lt!7263 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (v!1573 (underlying!104 thiss!938))) (_values!1708 (v!1573 (underlying!104 thiss!938))) (mask!4692 (v!1573 (underlying!104 thiss!938))) (extraKeys!1622 (v!1573 (underlying!104 thiss!938))) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))))))))

(declare-fun b!22043 () Bool)

(declare-fun lt!7264 () Unit!452)

(declare-fun lt!7261 () Unit!452)

(assert (=> b!22043 (= lt!7264 lt!7261)))

(declare-fun lt!7260 () V!1157)

(declare-fun lt!7265 () ListLongMap!559)

(declare-fun lt!7266 () (_ BitVec 64))

(declare-fun lt!7262 () (_ BitVec 64))

(assert (=> b!22043 (not (contains!225 (+!42 lt!7265 (tuple2!901 lt!7266 lt!7260)) lt!7262))))

(declare-fun addStillNotContains!1 (ListLongMap!559 (_ BitVec 64) V!1157 (_ BitVec 64)) Unit!452)

(assert (=> b!22043 (= lt!7261 (addStillNotContains!1 lt!7265 lt!7266 lt!7260 lt!7262))))

(assert (=> b!22043 (= lt!7262 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!22043 (= lt!7260 (get!377 (select (arr!583 (_values!1708 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!141 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22043 (= lt!7266 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))))))

(assert (=> b!22043 (= lt!7265 call!1528)))

(assert (=> b!22043 (= e!14309 (+!42 call!1528 (tuple2!901 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))) (get!377 (select (arr!583 (_values!1708 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!141 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!22044 () Bool)

(declare-fun isEmpty!171 (ListLongMap!559) Bool)

(assert (=> b!22044 (= e!14306 (isEmpty!171 lt!7263))))

(declare-fun b!22045 () Bool)

(assert (=> b!22045 (= e!14305 (ListLongMap!560 Nil!558))))

(assert (= (and d!3849 c!2626) b!22045))

(assert (= (and d!3849 (not c!2626)) b!22036))

(assert (= (and b!22036 c!2627) b!22043))

(assert (= (and b!22036 (not c!2627)) b!22035))

(assert (= (or b!22043 b!22035) bm!1525))

(assert (= (and d!3849 res!14060) b!22039))

(assert (= (and b!22039 res!14061) b!22041))

(assert (= (and b!22041 res!14062) b!22037))

(assert (= (and b!22041 c!2625) b!22034))

(assert (= (and b!22041 (not c!2625)) b!22038))

(assert (= (and b!22034 res!14059) b!22040))

(assert (= (and b!22038 c!2628) b!22042))

(assert (= (and b!22038 (not c!2628)) b!22044))

(declare-fun b_lambda!1539 () Bool)

(assert (=> (not b_lambda!1539) (not b!22040)))

(assert (=> b!22040 t!3221))

(declare-fun b_and!1439 () Bool)

(assert (= b_and!1437 (and (=> t!3221 result!1069) b_and!1439)))

(declare-fun b_lambda!1541 () Bool)

(assert (=> (not b_lambda!1541) (not b!22043)))

(assert (=> b!22043 t!3221))

(declare-fun b_and!1441 () Bool)

(assert (= b_and!1439 (and (=> t!3221 result!1069) b_and!1441)))

(declare-fun m!15723 () Bool)

(assert (=> d!3849 m!15723))

(assert (=> d!3849 m!14929))

(assert (=> b!22034 m!14963))

(assert (=> b!22034 m!14963))

(declare-fun m!15725 () Bool)

(assert (=> b!22034 m!15725))

(declare-fun m!15727 () Bool)

(assert (=> b!22044 m!15727))

(declare-fun m!15729 () Bool)

(assert (=> b!22039 m!15729))

(assert (=> b!22040 m!14963))

(assert (=> b!22040 m!14963))

(declare-fun m!15731 () Bool)

(assert (=> b!22040 m!15731))

(assert (=> b!22040 m!15013))

(assert (=> b!22040 m!15011))

(assert (=> b!22040 m!15011))

(assert (=> b!22040 m!15013))

(assert (=> b!22040 m!15015))

(assert (=> b!22037 m!14963))

(assert (=> b!22037 m!14963))

(assert (=> b!22037 m!14965))

(assert (=> b!22036 m!14963))

(assert (=> b!22036 m!14963))

(assert (=> b!22036 m!14965))

(declare-fun m!15733 () Bool)

(assert (=> b!22043 m!15733))

(assert (=> b!22043 m!15013))

(assert (=> b!22043 m!15011))

(assert (=> b!22043 m!15011))

(assert (=> b!22043 m!15013))

(assert (=> b!22043 m!15015))

(assert (=> b!22043 m!14963))

(declare-fun m!15735 () Bool)

(assert (=> b!22043 m!15735))

(declare-fun m!15737 () Bool)

(assert (=> b!22043 m!15737))

(assert (=> b!22043 m!15735))

(declare-fun m!15739 () Bool)

(assert (=> b!22043 m!15739))

(declare-fun m!15741 () Bool)

(assert (=> bm!1525 m!15741))

(assert (=> b!22042 m!15741))

(assert (=> bm!1371 d!3849))

(declare-fun d!3851 () Bool)

(declare-fun e!14312 () Bool)

(assert (=> d!3851 e!14312))

(declare-fun res!14063 () Bool)

(assert (=> d!3851 (=> res!14063 e!14312)))

(declare-fun lt!7267 () Bool)

(assert (=> d!3851 (= res!14063 (not lt!7267))))

(declare-fun lt!7268 () Bool)

(assert (=> d!3851 (= lt!7267 lt!7268)))

(declare-fun lt!7270 () Unit!452)

(declare-fun e!14313 () Unit!452)

(assert (=> d!3851 (= lt!7270 e!14313)))

(declare-fun c!2629 () Bool)

(assert (=> d!3851 (= c!2629 lt!7268)))

(assert (=> d!3851 (= lt!7268 (containsKey!24 (toList!295 call!1462) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3851 (= (contains!225 call!1462 #b0000000000000000000000000000000000000000000000000000000000000000) lt!7267)))

(declare-fun b!22046 () Bool)

(declare-fun lt!7269 () Unit!452)

(assert (=> b!22046 (= e!14313 lt!7269)))

(assert (=> b!22046 (= lt!7269 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!295 call!1462) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22046 (isDefined!22 (getValueByKey!60 (toList!295 call!1462) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22047 () Bool)

(declare-fun Unit!478 () Unit!452)

(assert (=> b!22047 (= e!14313 Unit!478)))

(declare-fun b!22048 () Bool)

(assert (=> b!22048 (= e!14312 (isDefined!22 (getValueByKey!60 (toList!295 call!1462) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!3851 c!2629) b!22046))

(assert (= (and d!3851 (not c!2629)) b!22047))

(assert (= (and d!3851 (not res!14063)) b!22048))

(declare-fun m!15743 () Bool)

(assert (=> d!3851 m!15743))

(declare-fun m!15745 () Bool)

(assert (=> b!22046 m!15745))

(declare-fun m!15747 () Bool)

(assert (=> b!22046 m!15747))

(assert (=> b!22046 m!15747))

(declare-fun m!15749 () Bool)

(assert (=> b!22046 m!15749))

(assert (=> b!22048 m!15747))

(assert (=> b!22048 m!15747))

(assert (=> b!22048 m!15749))

(assert (=> b!21663 d!3851))

(declare-fun d!3853 () Bool)

(assert (=> d!3853 (= (apply!28 lt!6762 #b0000000000000000000000000000000000000000000000000000000000000000) (get!378 (getValueByKey!60 (toList!295 lt!6762) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!921 () Bool)

(assert (= bs!921 d!3853))

(assert (=> bs!921 m!15633))

(assert (=> bs!921 m!15633))

(declare-fun m!15751 () Bool)

(assert (=> bs!921 m!15751))

(assert (=> b!21478 d!3853))

(declare-fun d!3855 () Bool)

(declare-fun e!14314 () Bool)

(assert (=> d!3855 e!14314))

(declare-fun res!14065 () Bool)

(assert (=> d!3855 (=> (not res!14065) (not e!14314))))

(declare-fun lt!7272 () ListLongMap!559)

(assert (=> d!3855 (= res!14065 (contains!225 lt!7272 (_1!453 (tuple2!901 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(declare-fun lt!7273 () List!561)

(assert (=> d!3855 (= lt!7272 (ListLongMap!560 lt!7273))))

(declare-fun lt!7274 () Unit!452)

(declare-fun lt!7271 () Unit!452)

(assert (=> d!3855 (= lt!7274 lt!7271)))

(assert (=> d!3855 (= (getValueByKey!60 lt!7273 (_1!453 (tuple2!901 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))) (Some!65 (_2!453 (tuple2!901 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3855 (= lt!7271 (lemmaContainsTupThenGetReturnValue!17 lt!7273 (_1!453 (tuple2!901 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (_2!453 (tuple2!901 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3855 (= lt!7273 (insertStrictlySorted!17 (toList!295 lt!6767) (_1!453 (tuple2!901 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (_2!453 (tuple2!901 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3855 (= (+!42 lt!6767 (tuple2!901 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!7272)))

(declare-fun b!22049 () Bool)

(declare-fun res!14064 () Bool)

(assert (=> b!22049 (=> (not res!14064) (not e!14314))))

(assert (=> b!22049 (= res!14064 (= (getValueByKey!60 (toList!295 lt!7272) (_1!453 (tuple2!901 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))) (Some!65 (_2!453 (tuple2!901 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))))))))

(declare-fun b!22050 () Bool)

(assert (=> b!22050 (= e!14314 (contains!226 (toList!295 lt!7272) (tuple2!901 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))))))

(assert (= (and d!3855 res!14065) b!22049))

(assert (= (and b!22049 res!14064) b!22050))

(declare-fun m!15753 () Bool)

(assert (=> d!3855 m!15753))

(declare-fun m!15755 () Bool)

(assert (=> d!3855 m!15755))

(declare-fun m!15757 () Bool)

(assert (=> d!3855 m!15757))

(declare-fun m!15759 () Bool)

(assert (=> d!3855 m!15759))

(declare-fun m!15761 () Bool)

(assert (=> b!22049 m!15761))

(declare-fun m!15763 () Bool)

(assert (=> b!22050 m!15763))

(assert (=> b!21493 d!3855))

(declare-fun d!3857 () Bool)

(assert (=> d!3857 (= (apply!28 (+!42 lt!6767 (tuple2!901 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!6758) (get!378 (getValueByKey!60 (toList!295 (+!42 lt!6767 (tuple2!901 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))) lt!6758)))))

(declare-fun bs!922 () Bool)

(assert (= bs!922 d!3857))

(declare-fun m!15765 () Bool)

(assert (=> bs!922 m!15765))

(assert (=> bs!922 m!15765))

(declare-fun m!15767 () Bool)

(assert (=> bs!922 m!15767))

(assert (=> b!21493 d!3857))

(declare-fun d!3859 () Bool)

(assert (=> d!3859 (= (apply!28 (+!42 lt!6764 (tuple2!901 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!6748) (get!378 (getValueByKey!60 (toList!295 (+!42 lt!6764 (tuple2!901 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) lt!6748)))))

(declare-fun bs!923 () Bool)

(assert (= bs!923 d!3859))

(declare-fun m!15769 () Bool)

(assert (=> bs!923 m!15769))

(assert (=> bs!923 m!15769))

(declare-fun m!15771 () Bool)

(assert (=> bs!923 m!15771))

(assert (=> b!21493 d!3859))

(declare-fun d!3861 () Bool)

(assert (=> d!3861 (contains!225 (+!42 lt!6759 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!6749)))

(declare-fun lt!7277 () Unit!452)

(declare-fun choose!200 (ListLongMap!559 (_ BitVec 64) V!1157 (_ BitVec 64)) Unit!452)

(assert (=> d!3861 (= lt!7277 (choose!200 lt!6759 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) lt!6749))))

(assert (=> d!3861 (contains!225 lt!6759 lt!6749)))

(assert (=> d!3861 (= (addStillContains!13 lt!6759 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) lt!6749) lt!7277)))

(declare-fun bs!924 () Bool)

(assert (= bs!924 d!3861))

(assert (=> bs!924 m!14991))

(assert (=> bs!924 m!14991))

(assert (=> bs!924 m!14993))

(declare-fun m!15773 () Bool)

(assert (=> bs!924 m!15773))

(declare-fun m!15775 () Bool)

(assert (=> bs!924 m!15775))

(assert (=> b!21493 d!3861))

(declare-fun d!3863 () Bool)

(declare-fun e!14315 () Bool)

(assert (=> d!3863 e!14315))

(declare-fun res!14067 () Bool)

(assert (=> d!3863 (=> (not res!14067) (not e!14315))))

(declare-fun lt!7279 () ListLongMap!559)

(assert (=> d!3863 (= res!14067 (contains!225 lt!7279 (_1!453 (tuple2!901 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(declare-fun lt!7280 () List!561)

(assert (=> d!3863 (= lt!7279 (ListLongMap!560 lt!7280))))

(declare-fun lt!7281 () Unit!452)

(declare-fun lt!7278 () Unit!452)

(assert (=> d!3863 (= lt!7281 lt!7278)))

(assert (=> d!3863 (= (getValueByKey!60 lt!7280 (_1!453 (tuple2!901 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (Some!65 (_2!453 (tuple2!901 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3863 (= lt!7278 (lemmaContainsTupThenGetReturnValue!17 lt!7280 (_1!453 (tuple2!901 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (_2!453 (tuple2!901 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3863 (= lt!7280 (insertStrictlySorted!17 (toList!295 lt!6764) (_1!453 (tuple2!901 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (_2!453 (tuple2!901 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3863 (= (+!42 lt!6764 (tuple2!901 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!7279)))

(declare-fun b!22052 () Bool)

(declare-fun res!14066 () Bool)

(assert (=> b!22052 (=> (not res!14066) (not e!14315))))

(assert (=> b!22052 (= res!14066 (= (getValueByKey!60 (toList!295 lt!7279) (_1!453 (tuple2!901 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (Some!65 (_2!453 (tuple2!901 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))))

(declare-fun b!22053 () Bool)

(assert (=> b!22053 (= e!14315 (contains!226 (toList!295 lt!7279) (tuple2!901 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))

(assert (= (and d!3863 res!14067) b!22052))

(assert (= (and b!22052 res!14066) b!22053))

(declare-fun m!15777 () Bool)

(assert (=> d!3863 m!15777))

(declare-fun m!15779 () Bool)

(assert (=> d!3863 m!15779))

(declare-fun m!15781 () Bool)

(assert (=> d!3863 m!15781))

(declare-fun m!15783 () Bool)

(assert (=> d!3863 m!15783))

(declare-fun m!15785 () Bool)

(assert (=> b!22052 m!15785))

(declare-fun m!15787 () Bool)

(assert (=> b!22053 m!15787))

(assert (=> b!21493 d!3863))

(declare-fun d!3865 () Bool)

(assert (=> d!3865 (= (apply!28 lt!6767 lt!6758) (get!378 (getValueByKey!60 (toList!295 lt!6767) lt!6758)))))

(declare-fun bs!925 () Bool)

(assert (= bs!925 d!3865))

(declare-fun m!15789 () Bool)

(assert (=> bs!925 m!15789))

(assert (=> bs!925 m!15789))

(declare-fun m!15791 () Bool)

(assert (=> bs!925 m!15791))

(assert (=> b!21493 d!3865))

(declare-fun d!3867 () Bool)

(assert (=> d!3867 (= (apply!28 (+!42 lt!6767 (tuple2!901 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!6758) (apply!28 lt!6767 lt!6758))))

(declare-fun lt!7284 () Unit!452)

(declare-fun choose!201 (ListLongMap!559 (_ BitVec 64) V!1157 (_ BitVec 64)) Unit!452)

(assert (=> d!3867 (= lt!7284 (choose!201 lt!6767 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) lt!6758))))

(declare-fun e!14318 () Bool)

(assert (=> d!3867 e!14318))

(declare-fun res!14070 () Bool)

(assert (=> d!3867 (=> (not res!14070) (not e!14318))))

(assert (=> d!3867 (= res!14070 (contains!225 lt!6767 lt!6758))))

(assert (=> d!3867 (= (addApplyDifferent!13 lt!6767 lt!6766 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) lt!6758) lt!7284)))

(declare-fun b!22057 () Bool)

(assert (=> b!22057 (= e!14318 (not (= lt!6758 lt!6766)))))

(assert (= (and d!3867 res!14070) b!22057))

(assert (=> d!3867 m!14985))

(declare-fun m!15793 () Bool)

(assert (=> d!3867 m!15793))

(assert (=> d!3867 m!14987))

(declare-fun m!15795 () Bool)

(assert (=> d!3867 m!15795))

(assert (=> d!3867 m!14985))

(assert (=> d!3867 m!14995))

(assert (=> b!21493 d!3867))

(declare-fun d!3869 () Bool)

(assert (=> d!3869 (= (apply!28 (+!42 lt!6760 (tuple2!901 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!6747) (get!378 (getValueByKey!60 (toList!295 (+!42 lt!6760 (tuple2!901 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) lt!6747)))))

(declare-fun bs!926 () Bool)

(assert (= bs!926 d!3869))

(declare-fun m!15797 () Bool)

(assert (=> bs!926 m!15797))

(assert (=> bs!926 m!15797))

(declare-fun m!15799 () Bool)

(assert (=> bs!926 m!15799))

(assert (=> b!21493 d!3869))

(declare-fun d!3871 () Bool)

(declare-fun e!14319 () Bool)

(assert (=> d!3871 e!14319))

(declare-fun res!14072 () Bool)

(assert (=> d!3871 (=> (not res!14072) (not e!14319))))

(declare-fun lt!7286 () ListLongMap!559)

(assert (=> d!3871 (= res!14072 (contains!225 lt!7286 (_1!453 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(declare-fun lt!7287 () List!561)

(assert (=> d!3871 (= lt!7286 (ListLongMap!560 lt!7287))))

(declare-fun lt!7288 () Unit!452)

(declare-fun lt!7285 () Unit!452)

(assert (=> d!3871 (= lt!7288 lt!7285)))

(assert (=> d!3871 (= (getValueByKey!60 lt!7287 (_1!453 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))) (Some!65 (_2!453 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3871 (= lt!7285 (lemmaContainsTupThenGetReturnValue!17 lt!7287 (_1!453 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (_2!453 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3871 (= lt!7287 (insertStrictlySorted!17 (toList!295 lt!6759) (_1!453 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (_2!453 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3871 (= (+!42 lt!6759 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!7286)))

(declare-fun b!22058 () Bool)

(declare-fun res!14071 () Bool)

(assert (=> b!22058 (=> (not res!14071) (not e!14319))))

(assert (=> b!22058 (= res!14071 (= (getValueByKey!60 (toList!295 lt!7286) (_1!453 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))) (Some!65 (_2!453 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))))))))

(declare-fun b!22059 () Bool)

(assert (=> b!22059 (= e!14319 (contains!226 (toList!295 lt!7286) (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))))))

(assert (= (and d!3871 res!14072) b!22058))

(assert (= (and b!22058 res!14071) b!22059))

(declare-fun m!15801 () Bool)

(assert (=> d!3871 m!15801))

(declare-fun m!15803 () Bool)

(assert (=> d!3871 m!15803))

(declare-fun m!15805 () Bool)

(assert (=> d!3871 m!15805))

(declare-fun m!15807 () Bool)

(assert (=> d!3871 m!15807))

(declare-fun m!15809 () Bool)

(assert (=> b!22058 m!15809))

(declare-fun m!15811 () Bool)

(assert (=> b!22059 m!15811))

(assert (=> b!21493 d!3871))

(declare-fun d!3873 () Bool)

(declare-fun e!14320 () Bool)

(assert (=> d!3873 e!14320))

(declare-fun res!14073 () Bool)

(assert (=> d!3873 (=> res!14073 e!14320)))

(declare-fun lt!7289 () Bool)

(assert (=> d!3873 (= res!14073 (not lt!7289))))

(declare-fun lt!7290 () Bool)

(assert (=> d!3873 (= lt!7289 lt!7290)))

(declare-fun lt!7292 () Unit!452)

(declare-fun e!14321 () Unit!452)

(assert (=> d!3873 (= lt!7292 e!14321)))

(declare-fun c!2630 () Bool)

(assert (=> d!3873 (= c!2630 lt!7290)))

(assert (=> d!3873 (= lt!7290 (containsKey!24 (toList!295 (+!42 lt!6759 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))) lt!6749))))

(assert (=> d!3873 (= (contains!225 (+!42 lt!6759 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!6749) lt!7289)))

(declare-fun b!22060 () Bool)

(declare-fun lt!7291 () Unit!452)

(assert (=> b!22060 (= e!14321 lt!7291)))

(assert (=> b!22060 (= lt!7291 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!295 (+!42 lt!6759 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))) lt!6749))))

(assert (=> b!22060 (isDefined!22 (getValueByKey!60 (toList!295 (+!42 lt!6759 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))) lt!6749))))

(declare-fun b!22061 () Bool)

(declare-fun Unit!479 () Unit!452)

(assert (=> b!22061 (= e!14321 Unit!479)))

(declare-fun b!22062 () Bool)

(assert (=> b!22062 (= e!14320 (isDefined!22 (getValueByKey!60 (toList!295 (+!42 lt!6759 (tuple2!901 lt!6752 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))) lt!6749)))))

(assert (= (and d!3873 c!2630) b!22060))

(assert (= (and d!3873 (not c!2630)) b!22061))

(assert (= (and d!3873 (not res!14073)) b!22062))

(declare-fun m!15813 () Bool)

(assert (=> d!3873 m!15813))

(declare-fun m!15815 () Bool)

(assert (=> b!22060 m!15815))

(declare-fun m!15817 () Bool)

(assert (=> b!22060 m!15817))

(assert (=> b!22060 m!15817))

(declare-fun m!15819 () Bool)

(assert (=> b!22060 m!15819))

(assert (=> b!22062 m!15817))

(assert (=> b!22062 m!15817))

(assert (=> b!22062 m!15819))

(assert (=> b!21493 d!3873))

(declare-fun d!3875 () Bool)

(assert (=> d!3875 (= (apply!28 lt!6764 lt!6748) (get!378 (getValueByKey!60 (toList!295 lt!6764) lt!6748)))))

(declare-fun bs!927 () Bool)

(assert (= bs!927 d!3875))

(declare-fun m!15821 () Bool)

(assert (=> bs!927 m!15821))

(assert (=> bs!927 m!15821))

(declare-fun m!15823 () Bool)

(assert (=> bs!927 m!15823))

(assert (=> b!21493 d!3875))

(declare-fun d!3877 () Bool)

(declare-fun e!14322 () Bool)

(assert (=> d!3877 e!14322))

(declare-fun res!14075 () Bool)

(assert (=> d!3877 (=> (not res!14075) (not e!14322))))

(declare-fun lt!7294 () ListLongMap!559)

(assert (=> d!3877 (= res!14075 (contains!225 lt!7294 (_1!453 (tuple2!901 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(declare-fun lt!7295 () List!561)

(assert (=> d!3877 (= lt!7294 (ListLongMap!560 lt!7295))))

(declare-fun lt!7296 () Unit!452)

(declare-fun lt!7293 () Unit!452)

(assert (=> d!3877 (= lt!7296 lt!7293)))

(assert (=> d!3877 (= (getValueByKey!60 lt!7295 (_1!453 (tuple2!901 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (Some!65 (_2!453 (tuple2!901 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3877 (= lt!7293 (lemmaContainsTupThenGetReturnValue!17 lt!7295 (_1!453 (tuple2!901 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (_2!453 (tuple2!901 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3877 (= lt!7295 (insertStrictlySorted!17 (toList!295 lt!6760) (_1!453 (tuple2!901 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (_2!453 (tuple2!901 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3877 (= (+!42 lt!6760 (tuple2!901 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!7294)))

(declare-fun b!22063 () Bool)

(declare-fun res!14074 () Bool)

(assert (=> b!22063 (=> (not res!14074) (not e!14322))))

(assert (=> b!22063 (= res!14074 (= (getValueByKey!60 (toList!295 lt!7294) (_1!453 (tuple2!901 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (Some!65 (_2!453 (tuple2!901 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))))

(declare-fun b!22064 () Bool)

(assert (=> b!22064 (= e!14322 (contains!226 (toList!295 lt!7294) (tuple2!901 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))

(assert (= (and d!3877 res!14075) b!22063))

(assert (= (and b!22063 res!14074) b!22064))

(declare-fun m!15825 () Bool)

(assert (=> d!3877 m!15825))

(declare-fun m!15827 () Bool)

(assert (=> d!3877 m!15827))

(declare-fun m!15829 () Bool)

(assert (=> d!3877 m!15829))

(declare-fun m!15831 () Bool)

(assert (=> d!3877 m!15831))

(declare-fun m!15833 () Bool)

(assert (=> b!22063 m!15833))

(declare-fun m!15835 () Bool)

(assert (=> b!22064 m!15835))

(assert (=> b!21493 d!3877))

(assert (=> b!21493 d!3849))

(declare-fun d!3879 () Bool)

(assert (=> d!3879 (= (apply!28 (+!42 lt!6760 (tuple2!901 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!6747) (apply!28 lt!6760 lt!6747))))

(declare-fun lt!7297 () Unit!452)

(assert (=> d!3879 (= lt!7297 (choose!201 lt!6760 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938))) lt!6747))))

(declare-fun e!14323 () Bool)

(assert (=> d!3879 e!14323))

(declare-fun res!14076 () Bool)

(assert (=> d!3879 (=> (not res!14076) (not e!14323))))

(assert (=> d!3879 (= res!14076 (contains!225 lt!6760 lt!6747))))

(assert (=> d!3879 (= (addApplyDifferent!13 lt!6760 lt!6753 (minValue!1646 (v!1573 (underlying!104 thiss!938))) lt!6747) lt!7297)))

(declare-fun b!22065 () Bool)

(assert (=> b!22065 (= e!14323 (not (= lt!6747 lt!6753)))))

(assert (= (and d!3879 res!14076) b!22065))

(assert (=> d!3879 m!14971))

(declare-fun m!15837 () Bool)

(assert (=> d!3879 m!15837))

(assert (=> d!3879 m!14969))

(declare-fun m!15839 () Bool)

(assert (=> d!3879 m!15839))

(assert (=> d!3879 m!14971))

(assert (=> d!3879 m!14979))

(assert (=> b!21493 d!3879))

(declare-fun d!3881 () Bool)

(assert (=> d!3881 (= (apply!28 lt!6760 lt!6747) (get!378 (getValueByKey!60 (toList!295 lt!6760) lt!6747)))))

(declare-fun bs!928 () Bool)

(assert (= bs!928 d!3881))

(declare-fun m!15841 () Bool)

(assert (=> bs!928 m!15841))

(assert (=> bs!928 m!15841))

(declare-fun m!15843 () Bool)

(assert (=> bs!928 m!15843))

(assert (=> b!21493 d!3881))

(declare-fun d!3883 () Bool)

(assert (=> d!3883 (= (apply!28 (+!42 lt!6764 (tuple2!901 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!6748) (apply!28 lt!6764 lt!6748))))

(declare-fun lt!7298 () Unit!452)

(assert (=> d!3883 (= lt!7298 (choose!201 lt!6764 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938))) lt!6748))))

(declare-fun e!14324 () Bool)

(assert (=> d!3883 e!14324))

(declare-fun res!14077 () Bool)

(assert (=> d!3883 (=> (not res!14077) (not e!14324))))

(assert (=> d!3883 (= res!14077 (contains!225 lt!6764 lt!6748))))

(assert (=> d!3883 (= (addApplyDifferent!13 lt!6764 lt!6755 (minValue!1646 (v!1573 (underlying!104 thiss!938))) lt!6748) lt!7298)))

(declare-fun b!22066 () Bool)

(assert (=> b!22066 (= e!14324 (not (= lt!6748 lt!6755)))))

(assert (= (and d!3883 res!14077) b!22066))

(assert (=> d!3883 m!14977))

(declare-fun m!15845 () Bool)

(assert (=> d!3883 m!15845))

(assert (=> d!3883 m!14981))

(declare-fun m!15847 () Bool)

(assert (=> d!3883 m!15847))

(assert (=> d!3883 m!14977))

(assert (=> d!3883 m!14997))

(assert (=> b!21493 d!3883))

(declare-fun b!22067 () Bool)

(declare-fun e!14325 () (_ BitVec 32))

(assert (=> b!22067 (= e!14325 #b00000000000000000000000000000000)))

(declare-fun b!22068 () Bool)

(declare-fun e!14326 () (_ BitVec 32))

(assert (=> b!22068 (= e!14325 e!14326)))

(declare-fun c!2631 () Bool)

(assert (=> b!22068 (= c!2631 (validKeyInArray!0 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000)))))

(declare-fun b!22069 () Bool)

(declare-fun call!1529 () (_ BitVec 32))

(assert (=> b!22069 (= e!14326 (bvadd #b00000000000000000000000000000001 call!1529))))

(declare-fun b!22070 () Bool)

(assert (=> b!22070 (= e!14326 call!1529)))

(declare-fun d!3885 () Bool)

(declare-fun lt!7299 () (_ BitVec 32))

(assert (=> d!3885 (and (bvsge lt!7299 #b00000000000000000000000000000000) (bvsle lt!7299 (bvsub (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000)))))

(assert (=> d!3885 (= lt!7299 e!14325)))

(declare-fun c!2632 () Bool)

(assert (=> d!3885 (= c!2632 (bvsge #b00000000000000000000000000000000 (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681))))))))

(assert (=> d!3885 (and (bvsle #b00000000000000000000000000000000 (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681)))) (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681))))))))

(assert (=> d!3885 (= (arrayCountValidKeys!0 (_keys!3140 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000000 (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681))))) lt!7299)))

(declare-fun bm!1526 () Bool)

(assert (=> bm!1526 (= call!1529 (arrayCountValidKeys!0 (_keys!3140 (v!1573 (_2!452 lt!6681))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681))))))))

(assert (= (and d!3885 c!2632) b!22067))

(assert (= (and d!3885 (not c!2632)) b!22068))

(assert (= (and b!22068 c!2631) b!22069))

(assert (= (and b!22068 (not c!2631)) b!22070))

(assert (= (or b!22069 b!22070) bm!1526))

(assert (=> b!22068 m!15205))

(assert (=> b!22068 m!15205))

(assert (=> b!22068 m!15213))

(declare-fun m!15849 () Bool)

(assert (=> bm!1526 m!15849))

(assert (=> b!21533 d!3885))

(declare-fun d!3887 () Bool)

(declare-fun e!14327 () Bool)

(assert (=> d!3887 e!14327))

(declare-fun res!14079 () Bool)

(assert (=> d!3887 (=> (not res!14079) (not e!14327))))

(declare-fun lt!7301 () ListLongMap!559)

(assert (=> d!3887 (= res!14079 (contains!225 lt!7301 (_1!453 (ite c!2519 (ite c!2525 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))))))

(declare-fun lt!7302 () List!561)

(assert (=> d!3887 (= lt!7301 (ListLongMap!560 lt!7302))))

(declare-fun lt!7303 () Unit!452)

(declare-fun lt!7300 () Unit!452)

(assert (=> d!3887 (= lt!7303 lt!7300)))

(assert (=> d!3887 (= (getValueByKey!60 lt!7302 (_1!453 (ite c!2519 (ite c!2525 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))) (Some!65 (_2!453 (ite c!2519 (ite c!2525 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))))))

(assert (=> d!3887 (= lt!7300 (lemmaContainsTupThenGetReturnValue!17 lt!7302 (_1!453 (ite c!2519 (ite c!2525 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))) (_2!453 (ite c!2519 (ite c!2525 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))))))

(assert (=> d!3887 (= lt!7302 (insertStrictlySorted!17 (toList!295 (ite c!2519 call!1444 call!1430)) (_1!453 (ite c!2519 (ite c!2525 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))) (_2!453 (ite c!2519 (ite c!2525 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))))))

(assert (=> d!3887 (= (+!42 (ite c!2519 call!1444 call!1430) (ite c!2519 (ite c!2525 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))) lt!7301)))

(declare-fun b!22071 () Bool)

(declare-fun res!14078 () Bool)

(assert (=> b!22071 (=> (not res!14078) (not e!14327))))

(assert (=> b!22071 (= res!14078 (= (getValueByKey!60 (toList!295 lt!7301) (_1!453 (ite c!2519 (ite c!2525 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))) (Some!65 (_2!453 (ite c!2519 (ite c!2525 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))))))

(declare-fun b!22072 () Bool)

(assert (=> b!22072 (= e!14327 (contains!226 (toList!295 lt!7301) (ite c!2519 (ite c!2525 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))))

(assert (= (and d!3887 res!14079) b!22071))

(assert (= (and b!22071 res!14078) b!22072))

(declare-fun m!15851 () Bool)

(assert (=> d!3887 m!15851))

(declare-fun m!15853 () Bool)

(assert (=> d!3887 m!15853))

(declare-fun m!15855 () Bool)

(assert (=> d!3887 m!15855))

(declare-fun m!15857 () Bool)

(assert (=> d!3887 m!15857))

(declare-fun m!15859 () Bool)

(assert (=> b!22071 m!15859))

(declare-fun m!15861 () Bool)

(assert (=> b!22072 m!15861))

(assert (=> bm!1437 d!3887))

(declare-fun d!3889 () Bool)

(assert (=> d!3889 (= (inRange!0 (ite c!2534 (ite c!2537 (index!2325 lt!6928) (ite c!2540 (index!2324 lt!6929) (index!2327 lt!6929))) (ite c!2541 (index!2325 lt!6947) (ite c!2543 (index!2324 lt!6931) (index!2327 lt!6931)))) (mask!4692 lt!6678)) (and (bvsge (ite c!2534 (ite c!2537 (index!2325 lt!6928) (ite c!2540 (index!2324 lt!6929) (index!2327 lt!6929))) (ite c!2541 (index!2325 lt!6947) (ite c!2543 (index!2324 lt!6931) (index!2327 lt!6931)))) #b00000000000000000000000000000000) (bvslt (ite c!2534 (ite c!2537 (index!2325 lt!6928) (ite c!2540 (index!2324 lt!6929) (index!2327 lt!6929))) (ite c!2541 (index!2325 lt!6947) (ite c!2543 (index!2324 lt!6931) (index!2327 lt!6931)))) (bvadd (mask!4692 lt!6678) #b00000000000000000000000000000001))))))

(assert (=> bm!1463 d!3889))

(declare-fun b!22073 () Bool)

(declare-fun e!14328 () Bool)

(declare-fun call!1531 () Bool)

(assert (=> b!22073 (= e!14328 (not call!1531))))

(declare-fun b!22074 () Bool)

(declare-fun res!14080 () Bool)

(declare-fun e!14330 () Bool)

(assert (=> b!22074 (=> (not res!14080) (not e!14330))))

(declare-fun lt!7304 () SeekEntryResult!51)

(assert (=> b!22074 (= res!14080 (= (select (arr!584 (_keys!3140 lt!6678)) (index!2327 lt!7304)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22074 (and (bvsge (index!2327 lt!7304) #b00000000000000000000000000000000) (bvslt (index!2327 lt!7304) (size!677 (_keys!3140 lt!6678))))))

(declare-fun b!22075 () Bool)

(assert (=> b!22075 (and (bvsge (index!2324 lt!7304) #b00000000000000000000000000000000) (bvslt (index!2324 lt!7304) (size!677 (_keys!3140 lt!6678))))))

(declare-fun res!14082 () Bool)

(assert (=> b!22075 (= res!14082 (= (select (arr!584 (_keys!3140 lt!6678)) (index!2324 lt!7304)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22075 (=> (not res!14082) (not e!14328))))

(declare-fun b!22077 () Bool)

(declare-fun e!14329 () Bool)

(assert (=> b!22077 (= e!14329 e!14328)))

(declare-fun res!14081 () Bool)

(declare-fun call!1530 () Bool)

(assert (=> b!22077 (= res!14081 call!1530)))

(assert (=> b!22077 (=> (not res!14081) (not e!14328))))

(declare-fun b!22078 () Bool)

(assert (=> b!22078 (= e!14330 (not call!1531))))

(declare-fun bm!1527 () Bool)

(declare-fun c!2633 () Bool)

(assert (=> bm!1527 (= call!1530 (inRange!0 (ite c!2633 (index!2324 lt!7304) (index!2327 lt!7304)) (mask!4692 lt!6678)))))

(declare-fun b!22079 () Bool)

(declare-fun e!14331 () Bool)

(assert (=> b!22079 (= e!14331 ((_ is Undefined!51) lt!7304))))

(declare-fun d!3891 () Bool)

(assert (=> d!3891 e!14329))

(assert (=> d!3891 (= c!2633 ((_ is MissingZero!51) lt!7304))))

(assert (=> d!3891 (= lt!7304 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3140 lt!6678) (mask!4692 lt!6678)))))

(declare-fun lt!7305 () Unit!452)

(assert (=> d!3891 (= lt!7305 (choose!195 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(assert (=> d!3891 (validMask!0 (mask!4692 lt!6678))))

(assert (=> d!3891 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1719 lt!6678)) lt!7305)))

(declare-fun b!22076 () Bool)

(declare-fun res!14083 () Bool)

(assert (=> b!22076 (=> (not res!14083) (not e!14330))))

(assert (=> b!22076 (= res!14083 call!1530)))

(assert (=> b!22076 (= e!14331 e!14330)))

(declare-fun b!22080 () Bool)

(assert (=> b!22080 (= e!14329 e!14331)))

(declare-fun c!2634 () Bool)

(assert (=> b!22080 (= c!2634 ((_ is MissingVacant!51) lt!7304))))

(declare-fun bm!1528 () Bool)

(assert (=> bm!1528 (= call!1531 (arrayContainsKey!0 (_keys!3140 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (= (and d!3891 c!2633) b!22077))

(assert (= (and d!3891 (not c!2633)) b!22080))

(assert (= (and b!22077 res!14081) b!22075))

(assert (= (and b!22075 res!14082) b!22073))

(assert (= (and b!22080 c!2634) b!22076))

(assert (= (and b!22080 (not c!2634)) b!22079))

(assert (= (and b!22076 res!14083) b!22074))

(assert (= (and b!22074 res!14080) b!22078))

(assert (= (or b!22077 b!22076) bm!1527))

(assert (= (or b!22073 b!22078) bm!1528))

(declare-fun m!15863 () Bool)

(assert (=> b!22075 m!15863))

(assert (=> bm!1528 m!15149))

(declare-fun m!15865 () Bool)

(assert (=> b!22074 m!15865))

(assert (=> d!3891 m!15151))

(declare-fun m!15867 () Bool)

(assert (=> d!3891 m!15867))

(assert (=> d!3891 m!15191))

(declare-fun m!15869 () Bool)

(assert (=> bm!1527 m!15869))

(assert (=> bm!1454 d!3891))

(declare-fun d!3893 () Bool)

(declare-fun e!14332 () Bool)

(assert (=> d!3893 e!14332))

(declare-fun res!14084 () Bool)

(assert (=> d!3893 (=> (not res!14084) (not e!14332))))

(assert (=> d!3893 (= res!14084 (and (bvsge (index!2325 lt!6918) #b00000000000000000000000000000000) (bvslt (index!2325 lt!6918) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))))))))

(declare-fun lt!7306 () Unit!452)

(assert (=> d!3893 (= lt!7306 (choose!197 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6919 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (index!2325 lt!6918) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(assert (=> d!3893 (validMask!0 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)))))

(assert (=> d!3893 (= (lemmaValidKeyInArrayIsInListMap!7 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6919 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (index!2325 lt!6918) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) lt!7306)))

(declare-fun b!22081 () Bool)

(assert (=> b!22081 (= e!14332 (contains!225 (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!6919 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918))))))

(assert (= (and d!3893 res!14084) b!22081))

(declare-fun m!15871 () Bool)

(assert (=> d!3893 m!15871))

(assert (=> d!3893 m!15279))

(assert (=> b!22081 m!15099))

(assert (=> b!22081 m!15111))

(assert (=> b!22081 m!15099))

(assert (=> b!22081 m!15111))

(declare-fun m!15873 () Bool)

(assert (=> b!22081 m!15873))

(assert (=> b!21653 d!3893))

(declare-fun d!3895 () Bool)

(declare-fun e!14333 () Bool)

(assert (=> d!3895 e!14333))

(declare-fun res!14085 () Bool)

(assert (=> d!3895 (=> (not res!14085) (not e!14333))))

(assert (=> d!3895 (= res!14085 (and (bvsge (index!2325 lt!6918) #b00000000000000000000000000000000) (bvslt (index!2325 lt!6918) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))))))))

(declare-fun lt!7307 () Unit!452)

(assert (=> d!3895 (= lt!7307 (choose!198 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (index!2325 lt!6918) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(assert (=> d!3895 (validMask!0 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)))))

(assert (=> d!3895 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!7 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (index!2325 lt!6918) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) lt!7307)))

(declare-fun b!22082 () Bool)

(assert (=> b!22082 (= e!14333 (= (+!42 (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) (tuple2!901 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (array!1230 (store (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918) (ValueCellFull!300 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)))) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(assert (= (and d!3895 res!14085) b!22082))

(declare-fun m!15875 () Bool)

(assert (=> d!3895 m!15875))

(assert (=> d!3895 m!15279))

(assert (=> b!22082 m!15101))

(assert (=> b!22082 m!15101))

(assert (=> b!22082 m!15677))

(assert (=> b!22082 m!15079))

(declare-fun m!15877 () Bool)

(assert (=> b!22082 m!15877))

(assert (=> b!21653 d!3895))

(declare-fun d!3897 () Bool)

(declare-fun e!14334 () Bool)

(assert (=> d!3897 e!14334))

(declare-fun res!14086 () Bool)

(assert (=> d!3897 (=> res!14086 e!14334)))

(declare-fun lt!7308 () Bool)

(assert (=> d!3897 (= res!14086 (not lt!7308))))

(declare-fun lt!7309 () Bool)

(assert (=> d!3897 (= lt!7308 lt!7309)))

(declare-fun lt!7311 () Unit!452)

(declare-fun e!14335 () Unit!452)

(assert (=> d!3897 (= lt!7311 e!14335)))

(declare-fun c!2635 () Bool)

(assert (=> d!3897 (= c!2635 lt!7309)))

(assert (=> d!3897 (= lt!7309 (containsKey!24 (toList!295 call!1430) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3897 (= (contains!225 call!1430 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) lt!7308)))

(declare-fun b!22083 () Bool)

(declare-fun lt!7310 () Unit!452)

(assert (=> b!22083 (= e!14335 lt!7310)))

(assert (=> b!22083 (= lt!7310 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!295 call!1430) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22083 (isDefined!22 (getValueByKey!60 (toList!295 call!1430) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!22084 () Bool)

(declare-fun Unit!480 () Unit!452)

(assert (=> b!22084 (= e!14335 Unit!480)))

(declare-fun b!22085 () Bool)

(assert (=> b!22085 (= e!14334 (isDefined!22 (getValueByKey!60 (toList!295 call!1430) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!3897 c!2635) b!22083))

(assert (= (and d!3897 (not c!2635)) b!22084))

(assert (= (and d!3897 (not res!14086)) b!22085))

(declare-fun m!15879 () Bool)

(assert (=> d!3897 m!15879))

(declare-fun m!15881 () Bool)

(assert (=> b!22083 m!15881))

(declare-fun m!15883 () Bool)

(assert (=> b!22083 m!15883))

(assert (=> b!22083 m!15883))

(declare-fun m!15885 () Bool)

(assert (=> b!22083 m!15885))

(assert (=> b!22085 m!15883))

(assert (=> b!22085 m!15883))

(assert (=> b!22085 m!15885))

(assert (=> b!21653 d!3897))

(assert (=> b!21490 d!3759))

(declare-fun b!22086 () Bool)

(declare-fun e!14347 () Bool)

(declare-fun e!14337 () Bool)

(assert (=> b!22086 (= e!14347 e!14337)))

(declare-fun res!14091 () Bool)

(declare-fun call!1535 () Bool)

(assert (=> b!22086 (= res!14091 call!1535)))

(assert (=> b!22086 (=> (not res!14091) (not e!14337))))

(declare-fun bm!1529 () Bool)

(declare-fun call!1533 () ListLongMap!559)

(declare-fun call!1534 () ListLongMap!559)

(assert (=> bm!1529 (= call!1533 call!1534)))

(declare-fun b!22087 () Bool)

(declare-fun lt!7327 () ListLongMap!559)

(assert (=> b!22087 (= e!14337 (= (apply!28 lt!7327 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1646 (v!1573 (_2!452 lt!6681)))))))

(declare-fun b!22088 () Bool)

(declare-fun e!14341 () Bool)

(declare-fun e!14342 () Bool)

(assert (=> b!22088 (= e!14341 e!14342)))

(declare-fun c!2641 () Bool)

(assert (=> b!22088 (= c!2641 (not (= (bvand (extraKeys!1622 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1530 () Bool)

(declare-fun call!1532 () ListLongMap!559)

(declare-fun call!1536 () ListLongMap!559)

(assert (=> bm!1530 (= call!1532 call!1536)))

(declare-fun b!22089 () Bool)

(declare-fun e!14344 () ListLongMap!559)

(assert (=> b!22089 (= e!14344 call!1532)))

(declare-fun d!3899 () Bool)

(assert (=> d!3899 e!14341))

(declare-fun res!14089 () Bool)

(assert (=> d!3899 (=> (not res!14089) (not e!14341))))

(assert (=> d!3899 (= res!14089 (or (bvsge #b00000000000000000000000000000000 (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681))))))))))

(declare-fun lt!7328 () ListLongMap!559)

(assert (=> d!3899 (= lt!7327 lt!7328)))

(declare-fun lt!7330 () Unit!452)

(declare-fun e!14338 () Unit!452)

(assert (=> d!3899 (= lt!7330 e!14338)))

(declare-fun c!2636 () Bool)

(declare-fun e!14348 () Bool)

(assert (=> d!3899 (= c!2636 e!14348)))

(declare-fun res!14094 () Bool)

(assert (=> d!3899 (=> (not res!14094) (not e!14348))))

(assert (=> d!3899 (= res!14094 (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681))))))))

(declare-fun e!14340 () ListLongMap!559)

(assert (=> d!3899 (= lt!7328 e!14340)))

(declare-fun c!2637 () Bool)

(assert (=> d!3899 (= c!2637 (and (not (= (bvand (extraKeys!1622 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1622 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3899 (validMask!0 (mask!4692 (v!1573 (_2!452 lt!6681))))))

(assert (=> d!3899 (= (getCurrentListMap!126 (_keys!3140 (v!1573 (_2!452 lt!6681))) (_values!1708 (v!1573 (_2!452 lt!6681))) (mask!4692 (v!1573 (_2!452 lt!6681))) (extraKeys!1622 (v!1573 (_2!452 lt!6681))) (zeroValue!1646 (v!1573 (_2!452 lt!6681))) (minValue!1646 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000000 (defaultEntry!1719 (v!1573 (_2!452 lt!6681)))) lt!7327)))

(declare-fun bm!1531 () Bool)

(declare-fun call!1537 () Bool)

(assert (=> bm!1531 (= call!1537 (contains!225 lt!7327 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22090 () Bool)

(assert (=> b!22090 (= e!14340 (+!42 call!1536 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (_2!452 lt!6681))))))))

(declare-fun c!2640 () Bool)

(declare-fun bm!1532 () Bool)

(declare-fun call!1538 () ListLongMap!559)

(assert (=> bm!1532 (= call!1536 (+!42 (ite c!2637 call!1538 (ite c!2640 call!1534 call!1533)) (ite (or c!2637 c!2640) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (_2!452 lt!6681)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (_2!452 lt!6681)))))))))

(declare-fun b!22091 () Bool)

(declare-fun res!14093 () Bool)

(assert (=> b!22091 (=> (not res!14093) (not e!14341))))

(declare-fun e!14343 () Bool)

(assert (=> b!22091 (= res!14093 e!14343)))

(declare-fun res!14088 () Bool)

(assert (=> b!22091 (=> res!14088 e!14343)))

(declare-fun e!14346 () Bool)

(assert (=> b!22091 (= res!14088 (not e!14346))))

(declare-fun res!14087 () Bool)

(assert (=> b!22091 (=> (not res!14087) (not e!14346))))

(assert (=> b!22091 (= res!14087 (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681))))))))

(declare-fun b!22092 () Bool)

(declare-fun e!14336 () Bool)

(assert (=> b!22092 (= e!14336 (= (apply!28 lt!7327 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1646 (v!1573 (_2!452 lt!6681)))))))

(declare-fun b!22093 () Bool)

(declare-fun e!14345 () Bool)

(assert (=> b!22093 (= e!14345 (= (apply!28 lt!7327 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000)) (get!377 (select (arr!583 (_values!1708 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000) (dynLambda!141 (defaultEntry!1719 (v!1573 (_2!452 lt!6681))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22093 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!676 (_values!1708 (v!1573 (_2!452 lt!6681))))))))

(assert (=> b!22093 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681))))))))

(declare-fun b!22094 () Bool)

(declare-fun e!14339 () ListLongMap!559)

(assert (=> b!22094 (= e!14339 call!1532)))

(declare-fun b!22095 () Bool)

(declare-fun res!14090 () Bool)

(assert (=> b!22095 (=> (not res!14090) (not e!14341))))

(assert (=> b!22095 (= res!14090 e!14347)))

(declare-fun c!2639 () Bool)

(assert (=> b!22095 (= c!2639 (not (= (bvand (extraKeys!1622 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!22096 () Bool)

(assert (=> b!22096 (= e!14339 call!1533)))

(declare-fun b!22097 () Bool)

(assert (=> b!22097 (= e!14342 e!14336)))

(declare-fun res!14095 () Bool)

(assert (=> b!22097 (= res!14095 call!1537)))

(assert (=> b!22097 (=> (not res!14095) (not e!14336))))

(declare-fun b!22098 () Bool)

(declare-fun c!2638 () Bool)

(assert (=> b!22098 (= c!2638 (and (not (= (bvand (extraKeys!1622 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1622 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!22098 (= e!14344 e!14339)))

(declare-fun b!22099 () Bool)

(assert (=> b!22099 (= e!14346 (validKeyInArray!0 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000)))))

(declare-fun bm!1533 () Bool)

(assert (=> bm!1533 (= call!1534 call!1538)))

(declare-fun b!22100 () Bool)

(assert (=> b!22100 (= e!14342 (not call!1537))))

(declare-fun b!22101 () Bool)

(assert (=> b!22101 (= e!14348 (validKeyInArray!0 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000)))))

(declare-fun b!22102 () Bool)

(declare-fun lt!7326 () Unit!452)

(assert (=> b!22102 (= e!14338 lt!7326)))

(declare-fun lt!7324 () ListLongMap!559)

(assert (=> b!22102 (= lt!7324 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (v!1573 (_2!452 lt!6681))) (_values!1708 (v!1573 (_2!452 lt!6681))) (mask!4692 (v!1573 (_2!452 lt!6681))) (extraKeys!1622 (v!1573 (_2!452 lt!6681))) (zeroValue!1646 (v!1573 (_2!452 lt!6681))) (minValue!1646 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000000 (defaultEntry!1719 (v!1573 (_2!452 lt!6681)))))))

(declare-fun lt!7317 () (_ BitVec 64))

(assert (=> b!22102 (= lt!7317 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7314 () (_ BitVec 64))

(assert (=> b!22102 (= lt!7314 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000))))

(declare-fun lt!7316 () Unit!452)

(assert (=> b!22102 (= lt!7316 (addStillContains!13 lt!7324 lt!7317 (zeroValue!1646 (v!1573 (_2!452 lt!6681))) lt!7314))))

(assert (=> b!22102 (contains!225 (+!42 lt!7324 (tuple2!901 lt!7317 (zeroValue!1646 (v!1573 (_2!452 lt!6681))))) lt!7314)))

(declare-fun lt!7321 () Unit!452)

(assert (=> b!22102 (= lt!7321 lt!7316)))

(declare-fun lt!7325 () ListLongMap!559)

(assert (=> b!22102 (= lt!7325 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (v!1573 (_2!452 lt!6681))) (_values!1708 (v!1573 (_2!452 lt!6681))) (mask!4692 (v!1573 (_2!452 lt!6681))) (extraKeys!1622 (v!1573 (_2!452 lt!6681))) (zeroValue!1646 (v!1573 (_2!452 lt!6681))) (minValue!1646 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000000 (defaultEntry!1719 (v!1573 (_2!452 lt!6681)))))))

(declare-fun lt!7318 () (_ BitVec 64))

(assert (=> b!22102 (= lt!7318 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7312 () (_ BitVec 64))

(assert (=> b!22102 (= lt!7312 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000))))

(declare-fun lt!7333 () Unit!452)

(assert (=> b!22102 (= lt!7333 (addApplyDifferent!13 lt!7325 lt!7318 (minValue!1646 (v!1573 (_2!452 lt!6681))) lt!7312))))

(assert (=> b!22102 (= (apply!28 (+!42 lt!7325 (tuple2!901 lt!7318 (minValue!1646 (v!1573 (_2!452 lt!6681))))) lt!7312) (apply!28 lt!7325 lt!7312))))

(declare-fun lt!7322 () Unit!452)

(assert (=> b!22102 (= lt!7322 lt!7333)))

(declare-fun lt!7332 () ListLongMap!559)

(assert (=> b!22102 (= lt!7332 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (v!1573 (_2!452 lt!6681))) (_values!1708 (v!1573 (_2!452 lt!6681))) (mask!4692 (v!1573 (_2!452 lt!6681))) (extraKeys!1622 (v!1573 (_2!452 lt!6681))) (zeroValue!1646 (v!1573 (_2!452 lt!6681))) (minValue!1646 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000000 (defaultEntry!1719 (v!1573 (_2!452 lt!6681)))))))

(declare-fun lt!7331 () (_ BitVec 64))

(assert (=> b!22102 (= lt!7331 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7323 () (_ BitVec 64))

(assert (=> b!22102 (= lt!7323 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000))))

(declare-fun lt!7315 () Unit!452)

(assert (=> b!22102 (= lt!7315 (addApplyDifferent!13 lt!7332 lt!7331 (zeroValue!1646 (v!1573 (_2!452 lt!6681))) lt!7323))))

(assert (=> b!22102 (= (apply!28 (+!42 lt!7332 (tuple2!901 lt!7331 (zeroValue!1646 (v!1573 (_2!452 lt!6681))))) lt!7323) (apply!28 lt!7332 lt!7323))))

(declare-fun lt!7319 () Unit!452)

(assert (=> b!22102 (= lt!7319 lt!7315)))

(declare-fun lt!7329 () ListLongMap!559)

(assert (=> b!22102 (= lt!7329 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (v!1573 (_2!452 lt!6681))) (_values!1708 (v!1573 (_2!452 lt!6681))) (mask!4692 (v!1573 (_2!452 lt!6681))) (extraKeys!1622 (v!1573 (_2!452 lt!6681))) (zeroValue!1646 (v!1573 (_2!452 lt!6681))) (minValue!1646 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000000 (defaultEntry!1719 (v!1573 (_2!452 lt!6681)))))))

(declare-fun lt!7320 () (_ BitVec 64))

(assert (=> b!22102 (= lt!7320 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7313 () (_ BitVec 64))

(assert (=> b!22102 (= lt!7313 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000))))

(assert (=> b!22102 (= lt!7326 (addApplyDifferent!13 lt!7329 lt!7320 (minValue!1646 (v!1573 (_2!452 lt!6681))) lt!7313))))

(assert (=> b!22102 (= (apply!28 (+!42 lt!7329 (tuple2!901 lt!7320 (minValue!1646 (v!1573 (_2!452 lt!6681))))) lt!7313) (apply!28 lt!7329 lt!7313))))

(declare-fun b!22103 () Bool)

(declare-fun Unit!481 () Unit!452)

(assert (=> b!22103 (= e!14338 Unit!481)))

(declare-fun bm!1534 () Bool)

(assert (=> bm!1534 (= call!1538 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (v!1573 (_2!452 lt!6681))) (_values!1708 (v!1573 (_2!452 lt!6681))) (mask!4692 (v!1573 (_2!452 lt!6681))) (extraKeys!1622 (v!1573 (_2!452 lt!6681))) (zeroValue!1646 (v!1573 (_2!452 lt!6681))) (minValue!1646 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000000 (defaultEntry!1719 (v!1573 (_2!452 lt!6681)))))))

(declare-fun b!22104 () Bool)

(assert (=> b!22104 (= e!14347 (not call!1535))))

(declare-fun b!22105 () Bool)

(assert (=> b!22105 (= e!14343 e!14345)))

(declare-fun res!14092 () Bool)

(assert (=> b!22105 (=> (not res!14092) (not e!14345))))

(assert (=> b!22105 (= res!14092 (contains!225 lt!7327 (select (arr!584 (_keys!3140 (v!1573 (_2!452 lt!6681)))) #b00000000000000000000000000000000)))))

(assert (=> b!22105 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (v!1573 (_2!452 lt!6681))))))))

(declare-fun b!22106 () Bool)

(assert (=> b!22106 (= e!14340 e!14344)))

(assert (=> b!22106 (= c!2640 (and (not (= (bvand (extraKeys!1622 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1622 (v!1573 (_2!452 lt!6681))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1535 () Bool)

(assert (=> bm!1535 (= call!1535 (contains!225 lt!7327 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3899 c!2637) b!22090))

(assert (= (and d!3899 (not c!2637)) b!22106))

(assert (= (and b!22106 c!2640) b!22089))

(assert (= (and b!22106 (not c!2640)) b!22098))

(assert (= (and b!22098 c!2638) b!22094))

(assert (= (and b!22098 (not c!2638)) b!22096))

(assert (= (or b!22094 b!22096) bm!1529))

(assert (= (or b!22089 bm!1529) bm!1533))

(assert (= (or b!22089 b!22094) bm!1530))

(assert (= (or b!22090 bm!1533) bm!1534))

(assert (= (or b!22090 bm!1530) bm!1532))

(assert (= (and d!3899 res!14094) b!22101))

(assert (= (and d!3899 c!2636) b!22102))

(assert (= (and d!3899 (not c!2636)) b!22103))

(assert (= (and d!3899 res!14089) b!22091))

(assert (= (and b!22091 res!14087) b!22099))

(assert (= (and b!22091 (not res!14088)) b!22105))

(assert (= (and b!22105 res!14092) b!22093))

(assert (= (and b!22091 res!14093) b!22095))

(assert (= (and b!22095 c!2639) b!22086))

(assert (= (and b!22095 (not c!2639)) b!22104))

(assert (= (and b!22086 res!14091) b!22087))

(assert (= (or b!22086 b!22104) bm!1535))

(assert (= (and b!22095 res!14090) b!22088))

(assert (= (and b!22088 c!2641) b!22097))

(assert (= (and b!22088 (not c!2641)) b!22100))

(assert (= (and b!22097 res!14095) b!22092))

(assert (= (or b!22097 b!22100) bm!1531))

(declare-fun b_lambda!1543 () Bool)

(assert (=> (not b_lambda!1543) (not b!22093)))

(declare-fun t!3228 () Bool)

(declare-fun tb!651 () Bool)

(assert (=> (and b!21366 (= (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) (defaultEntry!1719 (v!1573 (_2!452 lt!6681)))) t!3228) tb!651))

(declare-fun result!1079 () Bool)

(assert (=> tb!651 (= result!1079 tp_is_empty!999)))

(assert (=> b!22093 t!3228))

(declare-fun b_and!1443 () Bool)

(assert (= b_and!1441 (and (=> t!3228 result!1079) b_and!1443)))

(assert (=> b!22099 m!15205))

(assert (=> b!22099 m!15205))

(assert (=> b!22099 m!15213))

(declare-fun m!15887 () Bool)

(assert (=> bm!1534 m!15887))

(declare-fun m!15889 () Bool)

(assert (=> b!22102 m!15889))

(assert (=> b!22102 m!15205))

(declare-fun m!15891 () Bool)

(assert (=> b!22102 m!15891))

(declare-fun m!15893 () Bool)

(assert (=> b!22102 m!15893))

(declare-fun m!15895 () Bool)

(assert (=> b!22102 m!15895))

(declare-fun m!15897 () Bool)

(assert (=> b!22102 m!15897))

(assert (=> b!22102 m!15891))

(declare-fun m!15899 () Bool)

(assert (=> b!22102 m!15899))

(declare-fun m!15901 () Bool)

(assert (=> b!22102 m!15901))

(declare-fun m!15903 () Bool)

(assert (=> b!22102 m!15903))

(assert (=> b!22102 m!15887))

(declare-fun m!15905 () Bool)

(assert (=> b!22102 m!15905))

(declare-fun m!15907 () Bool)

(assert (=> b!22102 m!15907))

(declare-fun m!15909 () Bool)

(assert (=> b!22102 m!15909))

(declare-fun m!15911 () Bool)

(assert (=> b!22102 m!15911))

(assert (=> b!22102 m!15911))

(declare-fun m!15913 () Bool)

(assert (=> b!22102 m!15913))

(assert (=> b!22102 m!15905))

(declare-fun m!15915 () Bool)

(assert (=> b!22102 m!15915))

(assert (=> b!22102 m!15897))

(declare-fun m!15917 () Bool)

(assert (=> b!22102 m!15917))

(assert (=> b!22105 m!15205))

(assert (=> b!22105 m!15205))

(declare-fun m!15919 () Bool)

(assert (=> b!22105 m!15919))

(declare-fun m!15921 () Bool)

(assert (=> bm!1532 m!15921))

(declare-fun m!15923 () Bool)

(assert (=> b!22090 m!15923))

(assert (=> b!22101 m!15205))

(assert (=> b!22101 m!15205))

(assert (=> b!22101 m!15213))

(declare-fun m!15925 () Bool)

(assert (=> bm!1531 m!15925))

(declare-fun m!15927 () Bool)

(assert (=> b!22092 m!15927))

(assert (=> b!22093 m!15205))

(assert (=> b!22093 m!15205))

(declare-fun m!15929 () Bool)

(assert (=> b!22093 m!15929))

(declare-fun m!15931 () Bool)

(assert (=> b!22093 m!15931))

(declare-fun m!15933 () Bool)

(assert (=> b!22093 m!15933))

(declare-fun m!15935 () Bool)

(assert (=> b!22093 m!15935))

(assert (=> b!22093 m!15933))

(assert (=> b!22093 m!15931))

(declare-fun m!15937 () Bool)

(assert (=> b!22087 m!15937))

(declare-fun m!15939 () Bool)

(assert (=> bm!1535 m!15939))

(assert (=> d!3899 m!15217))

(assert (=> d!3739 d!3899))

(declare-fun b!22107 () Bool)

(declare-fun e!14360 () Bool)

(declare-fun e!14350 () Bool)

(assert (=> b!22107 (= e!14360 e!14350)))

(declare-fun res!14100 () Bool)

(declare-fun call!1542 () Bool)

(assert (=> b!22107 (= res!14100 call!1542)))

(assert (=> b!22107 (=> (not res!14100) (not e!14350))))

(declare-fun bm!1536 () Bool)

(declare-fun call!1540 () ListLongMap!559)

(declare-fun call!1541 () ListLongMap!559)

(assert (=> bm!1536 (= call!1540 call!1541)))

(declare-fun lt!7349 () ListLongMap!559)

(declare-fun b!22108 () Bool)

(assert (=> b!22108 (= e!14350 (= (apply!28 lt!7349 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!22109 () Bool)

(declare-fun e!14354 () Bool)

(declare-fun e!14355 () Bool)

(assert (=> b!22109 (= e!14354 e!14355)))

(declare-fun c!2647 () Bool)

(assert (=> b!22109 (= c!2647 (not (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1537 () Bool)

(declare-fun call!1539 () ListLongMap!559)

(declare-fun call!1543 () ListLongMap!559)

(assert (=> bm!1537 (= call!1539 call!1543)))

(declare-fun b!22110 () Bool)

(declare-fun e!14357 () ListLongMap!559)

(assert (=> b!22110 (= e!14357 call!1539)))

(declare-fun d!3901 () Bool)

(assert (=> d!3901 e!14354))

(declare-fun res!14098 () Bool)

(assert (=> d!3901 (=> (not res!14098) (not e!14354))))

(assert (=> d!3901 (= res!14098 (or (bvsge #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))))

(declare-fun lt!7350 () ListLongMap!559)

(assert (=> d!3901 (= lt!7349 lt!7350)))

(declare-fun lt!7352 () Unit!452)

(declare-fun e!14351 () Unit!452)

(assert (=> d!3901 (= lt!7352 e!14351)))

(declare-fun c!2642 () Bool)

(declare-fun e!14361 () Bool)

(assert (=> d!3901 (= c!2642 e!14361)))

(declare-fun res!14103 () Bool)

(assert (=> d!3901 (=> (not res!14103) (not e!14361))))

(assert (=> d!3901 (= res!14103 (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun e!14353 () ListLongMap!559)

(assert (=> d!3901 (= lt!7350 e!14353)))

(declare-fun c!2643 () Bool)

(assert (=> d!3901 (= c!2643 (and (not (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3901 (validMask!0 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)))))

(assert (=> d!3901 (= (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) lt!7349)))

(declare-fun bm!1538 () Bool)

(declare-fun call!1544 () Bool)

(assert (=> bm!1538 (= call!1544 (contains!225 lt!7349 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22111 () Bool)

(assert (=> b!22111 (= e!14353 (+!42 call!1543 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun c!2646 () Bool)

(declare-fun call!1545 () ListLongMap!559)

(declare-fun bm!1539 () Bool)

(assert (=> bm!1539 (= call!1543 (+!42 (ite c!2643 call!1545 (ite c!2646 call!1541 call!1540)) (ite (or c!2643 c!2646) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))))))))

(declare-fun b!22112 () Bool)

(declare-fun res!14102 () Bool)

(assert (=> b!22112 (=> (not res!14102) (not e!14354))))

(declare-fun e!14356 () Bool)

(assert (=> b!22112 (= res!14102 e!14356)))

(declare-fun res!14097 () Bool)

(assert (=> b!22112 (=> res!14097 e!14356)))

(declare-fun e!14359 () Bool)

(assert (=> b!22112 (= res!14097 (not e!14359))))

(declare-fun res!14096 () Bool)

(assert (=> b!22112 (=> (not res!14096) (not e!14359))))

(assert (=> b!22112 (= res!14096 (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun e!14349 () Bool)

(declare-fun b!22113 () Bool)

(assert (=> b!22113 (= e!14349 (= (apply!28 lt!7349 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!22114 () Bool)

(declare-fun e!14358 () Bool)

(assert (=> b!22114 (= e!14358 (= (apply!28 lt!7349 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000)) (get!377 (select (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000) (dynLambda!141 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(assert (=> b!22114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun b!22115 () Bool)

(declare-fun e!14352 () ListLongMap!559)

(assert (=> b!22115 (= e!14352 call!1539)))

(declare-fun b!22116 () Bool)

(declare-fun res!14099 () Bool)

(assert (=> b!22116 (=> (not res!14099) (not e!14354))))

(assert (=> b!22116 (= res!14099 e!14360)))

(declare-fun c!2645 () Bool)

(assert (=> b!22116 (= c!2645 (not (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!22117 () Bool)

(assert (=> b!22117 (= e!14352 call!1540)))

(declare-fun b!22118 () Bool)

(assert (=> b!22118 (= e!14355 e!14349)))

(declare-fun res!14104 () Bool)

(assert (=> b!22118 (= res!14104 call!1544)))

(assert (=> b!22118 (=> (not res!14104) (not e!14349))))

(declare-fun b!22119 () Bool)

(declare-fun c!2644 () Bool)

(assert (=> b!22119 (= c!2644 (and (not (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!22119 (= e!14357 e!14352)))

(declare-fun b!22120 () Bool)

(assert (=> b!22120 (= e!14359 (validKeyInArray!0 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000)))))

(declare-fun bm!1540 () Bool)

(assert (=> bm!1540 (= call!1541 call!1545)))

(declare-fun b!22121 () Bool)

(assert (=> b!22121 (= e!14355 (not call!1544))))

(declare-fun b!22122 () Bool)

(assert (=> b!22122 (= e!14361 (validKeyInArray!0 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000)))))

(declare-fun b!22123 () Bool)

(declare-fun lt!7348 () Unit!452)

(assert (=> b!22123 (= e!14351 lt!7348)))

(declare-fun lt!7346 () ListLongMap!559)

(assert (=> b!22123 (= lt!7346 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!7339 () (_ BitVec 64))

(assert (=> b!22123 (= lt!7339 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7336 () (_ BitVec 64))

(assert (=> b!22123 (= lt!7336 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000))))

(declare-fun lt!7338 () Unit!452)

(assert (=> b!22123 (= lt!7338 (addStillContains!13 lt!7346 lt!7339 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!7336))))

(assert (=> b!22123 (contains!225 (+!42 lt!7346 (tuple2!901 lt!7339 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)))) lt!7336)))

(declare-fun lt!7343 () Unit!452)

(assert (=> b!22123 (= lt!7343 lt!7338)))

(declare-fun lt!7347 () ListLongMap!559)

(assert (=> b!22123 (= lt!7347 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!7340 () (_ BitVec 64))

(assert (=> b!22123 (= lt!7340 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7334 () (_ BitVec 64))

(assert (=> b!22123 (= lt!7334 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000))))

(declare-fun lt!7355 () Unit!452)

(assert (=> b!22123 (= lt!7355 (addApplyDifferent!13 lt!7347 lt!7340 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!7334))))

(assert (=> b!22123 (= (apply!28 (+!42 lt!7347 (tuple2!901 lt!7340 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)))) lt!7334) (apply!28 lt!7347 lt!7334))))

(declare-fun lt!7344 () Unit!452)

(assert (=> b!22123 (= lt!7344 lt!7355)))

(declare-fun lt!7354 () ListLongMap!559)

(assert (=> b!22123 (= lt!7354 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!7353 () (_ BitVec 64))

(assert (=> b!22123 (= lt!7353 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7345 () (_ BitVec 64))

(assert (=> b!22123 (= lt!7345 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000))))

(declare-fun lt!7337 () Unit!452)

(assert (=> b!22123 (= lt!7337 (addApplyDifferent!13 lt!7354 lt!7353 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!7345))))

(assert (=> b!22123 (= (apply!28 (+!42 lt!7354 (tuple2!901 lt!7353 (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)))) lt!7345) (apply!28 lt!7354 lt!7345))))

(declare-fun lt!7341 () Unit!452)

(assert (=> b!22123 (= lt!7341 lt!7337)))

(declare-fun lt!7351 () ListLongMap!559)

(assert (=> b!22123 (= lt!7351 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!7342 () (_ BitVec 64))

(assert (=> b!22123 (= lt!7342 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7335 () (_ BitVec 64))

(assert (=> b!22123 (= lt!7335 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000))))

(assert (=> b!22123 (= lt!7348 (addApplyDifferent!13 lt!7351 lt!7342 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) lt!7335))))

(assert (=> b!22123 (= (apply!28 (+!42 lt!7351 (tuple2!901 lt!7342 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)))) lt!7335) (apply!28 lt!7351 lt!7335))))

(declare-fun b!22124 () Bool)

(declare-fun Unit!482 () Unit!452)

(assert (=> b!22124 (= e!14351 Unit!482)))

(declare-fun bm!1541 () Bool)

(assert (=> bm!1541 (= call!1545 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!22125 () Bool)

(assert (=> b!22125 (= e!14360 (not call!1542))))

(declare-fun b!22126 () Bool)

(assert (=> b!22126 (= e!14356 e!14358)))

(declare-fun res!14101 () Bool)

(assert (=> b!22126 (=> (not res!14101) (not e!14358))))

(assert (=> b!22126 (= res!14101 (contains!225 lt!7349 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000)))))

(assert (=> b!22126 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun b!22127 () Bool)

(assert (=> b!22127 (= e!14353 e!14357)))

(assert (=> b!22127 (= c!2646 (and (not (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1542 () Bool)

(assert (=> bm!1542 (= call!1542 (contains!225 lt!7349 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3901 c!2643) b!22111))

(assert (= (and d!3901 (not c!2643)) b!22127))

(assert (= (and b!22127 c!2646) b!22110))

(assert (= (and b!22127 (not c!2646)) b!22119))

(assert (= (and b!22119 c!2644) b!22115))

(assert (= (and b!22119 (not c!2644)) b!22117))

(assert (= (or b!22115 b!22117) bm!1536))

(assert (= (or b!22110 bm!1536) bm!1540))

(assert (= (or b!22110 b!22115) bm!1537))

(assert (= (or b!22111 bm!1540) bm!1541))

(assert (= (or b!22111 bm!1537) bm!1539))

(assert (= (and d!3901 res!14103) b!22122))

(assert (= (and d!3901 c!2642) b!22123))

(assert (= (and d!3901 (not c!2642)) b!22124))

(assert (= (and d!3901 res!14098) b!22112))

(assert (= (and b!22112 res!14096) b!22120))

(assert (= (and b!22112 (not res!14097)) b!22126))

(assert (= (and b!22126 res!14101) b!22114))

(assert (= (and b!22112 res!14102) b!22116))

(assert (= (and b!22116 c!2645) b!22107))

(assert (= (and b!22116 (not c!2645)) b!22125))

(assert (= (and b!22107 res!14100) b!22108))

(assert (= (or b!22107 b!22125) bm!1542))

(assert (= (and b!22116 res!14099) b!22109))

(assert (= (and b!22109 c!2647) b!22118))

(assert (= (and b!22109 (not c!2647)) b!22121))

(assert (= (and b!22118 res!14104) b!22113))

(assert (= (or b!22118 b!22121) bm!1538))

(declare-fun b_lambda!1545 () Bool)

(assert (=> (not b_lambda!1545) (not b!22114)))

(assert (=> b!22114 t!3224))

(declare-fun b_and!1445 () Bool)

(assert (= b_and!1443 (and (=> t!3224 result!1075) b_and!1445)))

(assert (=> b!22120 m!15221))

(assert (=> b!22120 m!15221))

(assert (=> b!22120 m!15223))

(declare-fun m!15941 () Bool)

(assert (=> bm!1541 m!15941))

(declare-fun m!15943 () Bool)

(assert (=> b!22123 m!15943))

(assert (=> b!22123 m!15221))

(declare-fun m!15945 () Bool)

(assert (=> b!22123 m!15945))

(declare-fun m!15947 () Bool)

(assert (=> b!22123 m!15947))

(declare-fun m!15949 () Bool)

(assert (=> b!22123 m!15949))

(declare-fun m!15951 () Bool)

(assert (=> b!22123 m!15951))

(assert (=> b!22123 m!15945))

(declare-fun m!15953 () Bool)

(assert (=> b!22123 m!15953))

(declare-fun m!15955 () Bool)

(assert (=> b!22123 m!15955))

(declare-fun m!15957 () Bool)

(assert (=> b!22123 m!15957))

(assert (=> b!22123 m!15941))

(declare-fun m!15959 () Bool)

(assert (=> b!22123 m!15959))

(declare-fun m!15961 () Bool)

(assert (=> b!22123 m!15961))

(declare-fun m!15963 () Bool)

(assert (=> b!22123 m!15963))

(declare-fun m!15965 () Bool)

(assert (=> b!22123 m!15965))

(assert (=> b!22123 m!15965))

(declare-fun m!15967 () Bool)

(assert (=> b!22123 m!15967))

(assert (=> b!22123 m!15959))

(declare-fun m!15969 () Bool)

(assert (=> b!22123 m!15969))

(assert (=> b!22123 m!15951))

(declare-fun m!15971 () Bool)

(assert (=> b!22123 m!15971))

(assert (=> b!22126 m!15221))

(assert (=> b!22126 m!15221))

(declare-fun m!15973 () Bool)

(assert (=> b!22126 m!15973))

(declare-fun m!15975 () Bool)

(assert (=> bm!1539 m!15975))

(declare-fun m!15977 () Bool)

(assert (=> b!22111 m!15977))

(assert (=> b!22122 m!15221))

(assert (=> b!22122 m!15221))

(assert (=> b!22122 m!15223))

(declare-fun m!15979 () Bool)

(assert (=> bm!1538 m!15979))

(declare-fun m!15981 () Bool)

(assert (=> b!22113 m!15981))

(assert (=> b!22114 m!15221))

(assert (=> b!22114 m!15221))

(declare-fun m!15983 () Bool)

(assert (=> b!22114 m!15983))

(declare-fun m!15985 () Bool)

(assert (=> b!22114 m!15985))

(assert (=> b!22114 m!15271))

(declare-fun m!15987 () Bool)

(assert (=> b!22114 m!15987))

(assert (=> b!22114 m!15271))

(assert (=> b!22114 m!15985))

(declare-fun m!15989 () Bool)

(assert (=> b!22108 m!15989))

(declare-fun m!15991 () Bool)

(assert (=> bm!1542 m!15991))

(assert (=> d!3901 m!15279))

(assert (=> bm!1429 d!3901))

(declare-fun d!3903 () Bool)

(declare-fun lt!7360 () tuple2!908)

(assert (=> d!3903 (or (bvsle (_2!457 lt!7360) #b00000000000000000000000000001000) (bvsge (bvmul #b00000000000000000000000000001000 (_size!134 (v!1573 (underlying!104 thiss!938)))) (_2!457 lt!7360)) (bvslt (bvadd (bvand (bvashr (_2!457 lt!7360) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!134 (v!1573 (underlying!104 thiss!938)))))))

(declare-fun e!14364 () tuple2!908)

(assert (=> d!3903 (= lt!7360 e!14364)))

(declare-fun c!2650 () Bool)

(declare-fun lt!7361 () (_ BitVec 32))

(assert (=> d!3903 (= c!2650 (and (bvsgt lt!7361 #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!134 (v!1573 (underlying!104 thiss!938)))) lt!7361) (bvsge (bvadd (bvand (bvashr lt!7361 #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!134 (v!1573 (underlying!104 thiss!938))))))))

(assert (=> d!3903 (= lt!7361 (bvlshr (_2!457 lt!6843) #b00000000000000000000000000000001))))

(assert (=> d!3903 (and (bvsgt (_2!457 lt!6843) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!134 (v!1573 (underlying!104 thiss!938)))) (_2!457 lt!6843)) (bvsge (bvadd (bvand (bvashr (_2!457 lt!6843) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!134 (v!1573 (underlying!104 thiss!938)))))))

(assert (=> d!3903 (= (computeNewMaskWhile!11 (_size!134 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (mask!4692 (v!1573 (underlying!104 thiss!938))) (_2!457 lt!6843)) lt!7360)))

(declare-fun b!22132 () Bool)

(assert (=> b!22132 (= e!14364 (computeNewMaskWhile!11 (_size!134 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (mask!4692 (v!1573 (underlying!104 thiss!938))) lt!7361))))

(declare-fun b!22133 () Bool)

(declare-fun Unit!483 () Unit!452)

(assert (=> b!22133 (= e!14364 (tuple2!909 Unit!483 lt!7361))))

(assert (= (and d!3903 c!2650) b!22132))

(assert (= (and d!3903 (not c!2650)) b!22133))

(declare-fun m!15994 () Bool)

(assert (=> b!22132 m!15994))

(assert (=> b!21524 d!3903))

(declare-fun d!3905 () Bool)

(assert (=> d!3905 (= (+!42 (getCurrentListMap!126 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (getCurrentListMap!126 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) lt!6951 (zeroValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun lt!7362 () Unit!452)

(assert (=> d!3905 (= lt!7362 (choose!194 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) lt!6951 (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (defaultEntry!1719 lt!6678)))))

(assert (=> d!3905 (validMask!0 (mask!4692 lt!6678))))

(assert (=> d!3905 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!7 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) lt!6951 (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (defaultEntry!1719 lt!6678)) lt!7362)))

(declare-fun bs!929 () Bool)

(assert (= bs!929 d!3905))

(declare-fun m!15996 () Bool)

(assert (=> bs!929 m!15996))

(declare-fun m!15998 () Bool)

(assert (=> bs!929 m!15998))

(assert (=> bs!929 m!15161))

(assert (=> bs!929 m!15161))

(declare-fun m!16000 () Bool)

(assert (=> bs!929 m!16000))

(assert (=> bs!929 m!15191))

(assert (=> b!21667 d!3905))

(declare-fun d!3907 () Bool)

(declare-fun res!14105 () Bool)

(declare-fun e!14365 () Bool)

(assert (=> d!3907 (=> res!14105 e!14365)))

(assert (=> d!3907 (= res!14105 (= (select (arr!584 lt!6833) #b00000000000000000000000000000000) (_1!453 lt!6837)))))

(assert (=> d!3907 (= (arrayContainsKey!0 lt!6833 (_1!453 lt!6837) #b00000000000000000000000000000000) e!14365)))

(declare-fun b!22134 () Bool)

(declare-fun e!14366 () Bool)

(assert (=> b!22134 (= e!14365 e!14366)))

(declare-fun res!14106 () Bool)

(assert (=> b!22134 (=> (not res!14106) (not e!14366))))

(assert (=> b!22134 (= res!14106 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!677 lt!6833)))))

(declare-fun b!22135 () Bool)

(assert (=> b!22135 (= e!14366 (arrayContainsKey!0 lt!6833 (_1!453 lt!6837) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!3907 (not res!14105)) b!22134))

(assert (= (and b!22134 res!14106) b!22135))

(declare-fun m!16002 () Bool)

(assert (=> d!3907 m!16002))

(declare-fun m!16004 () Bool)

(assert (=> b!22135 m!16004))

(assert (=> b!21515 d!3907))

(declare-fun d!3909 () Bool)

(assert (=> d!3909 (= (map!395 lt!6825) (getCurrentListMap!126 (_keys!3140 lt!6825) (_values!1708 lt!6825) (mask!4692 lt!6825) (extraKeys!1622 lt!6825) (zeroValue!1646 lt!6825) (minValue!1646 lt!6825) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6825)))))

(declare-fun bs!930 () Bool)

(assert (= bs!930 d!3909))

(declare-fun m!16006 () Bool)

(assert (=> bs!930 m!16006))

(assert (=> b!21513 d!3909))

(declare-fun b!22136 () Bool)

(declare-fun e!14378 () Bool)

(declare-fun e!14368 () Bool)

(assert (=> b!22136 (= e!14378 e!14368)))

(declare-fun res!14111 () Bool)

(declare-fun call!1549 () Bool)

(assert (=> b!22136 (= res!14111 call!1549)))

(assert (=> b!22136 (=> (not res!14111) (not e!14368))))

(declare-fun bm!1543 () Bool)

(declare-fun call!1547 () ListLongMap!559)

(declare-fun call!1548 () ListLongMap!559)

(assert (=> bm!1543 (= call!1547 call!1548)))

(declare-fun lt!7378 () ListLongMap!559)

(declare-fun b!22137 () Bool)

(assert (=> b!22137 (= e!14368 (= (apply!28 lt!7378 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!2519 c!2525) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun b!22138 () Bool)

(declare-fun e!14372 () Bool)

(declare-fun e!14373 () Bool)

(assert (=> b!22138 (= e!14372 e!14373)))

(declare-fun c!2656 () Bool)

(assert (=> b!22138 (= c!2656 (not (= (bvand (ite c!2519 (ite c!2525 lt!6905 lt!6924) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1544 () Bool)

(declare-fun call!1546 () ListLongMap!559)

(declare-fun call!1550 () ListLongMap!559)

(assert (=> bm!1544 (= call!1546 call!1550)))

(declare-fun b!22139 () Bool)

(declare-fun e!14375 () ListLongMap!559)

(assert (=> b!22139 (= e!14375 call!1546)))

(declare-fun d!3911 () Bool)

(assert (=> d!3911 e!14372))

(declare-fun res!14109 () Bool)

(assert (=> d!3911 (=> (not res!14109) (not e!14372))))

(assert (=> d!3911 (= res!14109 (or (bvsge #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))))

(declare-fun lt!7379 () ListLongMap!559)

(assert (=> d!3911 (= lt!7378 lt!7379)))

(declare-fun lt!7381 () Unit!452)

(declare-fun e!14369 () Unit!452)

(assert (=> d!3911 (= lt!7381 e!14369)))

(declare-fun c!2651 () Bool)

(declare-fun e!14379 () Bool)

(assert (=> d!3911 (= c!2651 e!14379)))

(declare-fun res!14114 () Bool)

(assert (=> d!3911 (=> (not res!14114) (not e!14379))))

(assert (=> d!3911 (= res!14114 (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun e!14371 () ListLongMap!559)

(assert (=> d!3911 (= lt!7379 e!14371)))

(declare-fun c!2652 () Bool)

(assert (=> d!3911 (= c!2652 (and (not (= (bvand (ite c!2519 (ite c!2525 lt!6905 lt!6924) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!2519 (ite c!2525 lt!6905 lt!6924) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3911 (validMask!0 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)))))

(assert (=> d!3911 (= (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite (or c!2519 c!2521) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (array!1230 (store (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918) (ValueCellFull!300 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))))) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2519 (ite c!2525 lt!6905 lt!6924) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite (and c!2519 c!2525) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2519 (ite c!2525 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) lt!7378)))

(declare-fun bm!1545 () Bool)

(declare-fun call!1551 () Bool)

(assert (=> bm!1545 (= call!1551 (contains!225 lt!7378 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22140 () Bool)

(assert (=> b!22140 (= e!14371 (+!42 call!1550 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2519 (ite c!2525 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))))))))

(declare-fun call!1552 () ListLongMap!559)

(declare-fun bm!1546 () Bool)

(declare-fun c!2655 () Bool)

(assert (=> bm!1546 (= call!1550 (+!42 (ite c!2652 call!1552 (ite c!2655 call!1548 call!1547)) (ite (or c!2652 c!2655) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!2519 c!2525) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)))) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2519 (ite c!2525 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))))

(declare-fun b!22141 () Bool)

(declare-fun res!14113 () Bool)

(assert (=> b!22141 (=> (not res!14113) (not e!14372))))

(declare-fun e!14374 () Bool)

(assert (=> b!22141 (= res!14113 e!14374)))

(declare-fun res!14108 () Bool)

(assert (=> b!22141 (=> res!14108 e!14374)))

(declare-fun e!14377 () Bool)

(assert (=> b!22141 (= res!14108 (not e!14377))))

(declare-fun res!14107 () Bool)

(assert (=> b!22141 (=> (not res!14107) (not e!14377))))

(assert (=> b!22141 (= res!14107 (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun b!22142 () Bool)

(declare-fun e!14367 () Bool)

(assert (=> b!22142 (= e!14367 (= (apply!28 lt!7378 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!2519 (ite c!2525 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun b!22143 () Bool)

(declare-fun e!14376 () Bool)

(assert (=> b!22143 (= e!14376 (= (apply!28 lt!7378 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000)) (get!377 (select (arr!583 (ite (or c!2519 c!2521) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (array!1230 (store (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918) (ValueCellFull!300 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)))))) #b00000000000000000000000000000000) (dynLambda!141 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22143 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!676 (ite (or c!2519 c!2521) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (array!1230 (store (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918) (ValueCellFull!300 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))))))))))

(assert (=> b!22143 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun b!22144 () Bool)

(declare-fun e!14370 () ListLongMap!559)

(assert (=> b!22144 (= e!14370 call!1546)))

(declare-fun b!22145 () Bool)

(declare-fun res!14110 () Bool)

(assert (=> b!22145 (=> (not res!14110) (not e!14372))))

(assert (=> b!22145 (= res!14110 e!14378)))

(declare-fun c!2654 () Bool)

(assert (=> b!22145 (= c!2654 (not (= (bvand (ite c!2519 (ite c!2525 lt!6905 lt!6924) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!22146 () Bool)

(assert (=> b!22146 (= e!14370 call!1547)))

(declare-fun b!22147 () Bool)

(assert (=> b!22147 (= e!14373 e!14367)))

(declare-fun res!14115 () Bool)

(assert (=> b!22147 (= res!14115 call!1551)))

(assert (=> b!22147 (=> (not res!14115) (not e!14367))))

(declare-fun b!22148 () Bool)

(declare-fun c!2653 () Bool)

(assert (=> b!22148 (= c!2653 (and (not (= (bvand (ite c!2519 (ite c!2525 lt!6905 lt!6924) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!2519 (ite c!2525 lt!6905 lt!6924) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!22148 (= e!14375 e!14370)))

(declare-fun b!22149 () Bool)

(assert (=> b!22149 (= e!14377 (validKeyInArray!0 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000)))))

(declare-fun bm!1547 () Bool)

(assert (=> bm!1547 (= call!1548 call!1552)))

(declare-fun b!22150 () Bool)

(assert (=> b!22150 (= e!14373 (not call!1551))))

(declare-fun b!22151 () Bool)

(assert (=> b!22151 (= e!14379 (validKeyInArray!0 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000)))))

(declare-fun b!22152 () Bool)

(declare-fun lt!7377 () Unit!452)

(assert (=> b!22152 (= e!14369 lt!7377)))

(declare-fun lt!7375 () ListLongMap!559)

(assert (=> b!22152 (= lt!7375 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite (or c!2519 c!2521) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (array!1230 (store (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918) (ValueCellFull!300 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))))) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2519 (ite c!2525 lt!6905 lt!6924) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite (and c!2519 c!2525) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2519 (ite c!2525 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!7368 () (_ BitVec 64))

(assert (=> b!22152 (= lt!7368 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7365 () (_ BitVec 64))

(assert (=> b!22152 (= lt!7365 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000))))

(declare-fun lt!7367 () Unit!452)

(assert (=> b!22152 (= lt!7367 (addStillContains!13 lt!7375 lt!7368 (ite (and c!2519 c!2525) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) lt!7365))))

(assert (=> b!22152 (contains!225 (+!42 lt!7375 (tuple2!901 lt!7368 (ite (and c!2519 c!2525) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))))) lt!7365)))

(declare-fun lt!7372 () Unit!452)

(assert (=> b!22152 (= lt!7372 lt!7367)))

(declare-fun lt!7376 () ListLongMap!559)

(assert (=> b!22152 (= lt!7376 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite (or c!2519 c!2521) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (array!1230 (store (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918) (ValueCellFull!300 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))))) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2519 (ite c!2525 lt!6905 lt!6924) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite (and c!2519 c!2525) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2519 (ite c!2525 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!7369 () (_ BitVec 64))

(assert (=> b!22152 (= lt!7369 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7363 () (_ BitVec 64))

(assert (=> b!22152 (= lt!7363 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000))))

(declare-fun lt!7384 () Unit!452)

(assert (=> b!22152 (= lt!7384 (addApplyDifferent!13 lt!7376 lt!7369 (ite c!2519 (ite c!2525 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) lt!7363))))

(assert (=> b!22152 (= (apply!28 (+!42 lt!7376 (tuple2!901 lt!7369 (ite c!2519 (ite c!2525 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))))) lt!7363) (apply!28 lt!7376 lt!7363))))

(declare-fun lt!7373 () Unit!452)

(assert (=> b!22152 (= lt!7373 lt!7384)))

(declare-fun lt!7383 () ListLongMap!559)

(assert (=> b!22152 (= lt!7383 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite (or c!2519 c!2521) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (array!1230 (store (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918) (ValueCellFull!300 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))))) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2519 (ite c!2525 lt!6905 lt!6924) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite (and c!2519 c!2525) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2519 (ite c!2525 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!7382 () (_ BitVec 64))

(assert (=> b!22152 (= lt!7382 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7374 () (_ BitVec 64))

(assert (=> b!22152 (= lt!7374 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000))))

(declare-fun lt!7366 () Unit!452)

(assert (=> b!22152 (= lt!7366 (addApplyDifferent!13 lt!7383 lt!7382 (ite (and c!2519 c!2525) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) lt!7374))))

(assert (=> b!22152 (= (apply!28 (+!42 lt!7383 (tuple2!901 lt!7382 (ite (and c!2519 c!2525) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))))) lt!7374) (apply!28 lt!7383 lt!7374))))

(declare-fun lt!7370 () Unit!452)

(assert (=> b!22152 (= lt!7370 lt!7366)))

(declare-fun lt!7380 () ListLongMap!559)

(assert (=> b!22152 (= lt!7380 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite (or c!2519 c!2521) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (array!1230 (store (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918) (ValueCellFull!300 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))))) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2519 (ite c!2525 lt!6905 lt!6924) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite (and c!2519 c!2525) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2519 (ite c!2525 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!7371 () (_ BitVec 64))

(assert (=> b!22152 (= lt!7371 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7364 () (_ BitVec 64))

(assert (=> b!22152 (= lt!7364 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000))))

(assert (=> b!22152 (= lt!7377 (addApplyDifferent!13 lt!7380 lt!7371 (ite c!2519 (ite c!2525 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) lt!7364))))

(assert (=> b!22152 (= (apply!28 (+!42 lt!7380 (tuple2!901 lt!7371 (ite c!2519 (ite c!2525 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))))) lt!7364) (apply!28 lt!7380 lt!7364))))

(declare-fun b!22153 () Bool)

(declare-fun Unit!484 () Unit!452)

(assert (=> b!22153 (= e!14369 Unit!484)))

(declare-fun bm!1548 () Bool)

(assert (=> bm!1548 (= call!1552 (getCurrentListMapNoExtraKeys!13 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite (or c!2519 c!2521) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (array!1230 (store (arr!583 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!6918) (ValueCellFull!300 (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))))) (size!676 (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678))))) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2519 (ite c!2525 lt!6905 lt!6924) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite (and c!2519 c!2525) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) (ite c!2519 (ite c!2525 (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 (minValue!1646 (v!1573 (underlying!104 thiss!938))) (ite c!2455 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!22154 () Bool)

(assert (=> b!22154 (= e!14378 (not call!1549))))

(declare-fun b!22155 () Bool)

(assert (=> b!22155 (= e!14374 e!14376)))

(declare-fun res!14112 () Bool)

(assert (=> b!22155 (=> (not res!14112) (not e!14376))))

(assert (=> b!22155 (= res!14112 (contains!225 lt!7378 (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000000)))))

(assert (=> b!22155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(declare-fun b!22156 () Bool)

(assert (=> b!22156 (= e!14371 e!14375)))

(assert (=> b!22156 (= c!2655 (and (not (= (bvand (ite c!2519 (ite c!2525 lt!6905 lt!6924) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!2519 (ite c!2525 lt!6905 lt!6924) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1549 () Bool)

(assert (=> bm!1549 (= call!1549 (contains!225 lt!7378 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3911 c!2652) b!22140))

(assert (= (and d!3911 (not c!2652)) b!22156))

(assert (= (and b!22156 c!2655) b!22139))

(assert (= (and b!22156 (not c!2655)) b!22148))

(assert (= (and b!22148 c!2653) b!22144))

(assert (= (and b!22148 (not c!2653)) b!22146))

(assert (= (or b!22144 b!22146) bm!1543))

(assert (= (or b!22139 bm!1543) bm!1547))

(assert (= (or b!22139 b!22144) bm!1544))

(assert (= (or b!22140 bm!1547) bm!1548))

(assert (= (or b!22140 bm!1544) bm!1546))

(assert (= (and d!3911 res!14114) b!22151))

(assert (= (and d!3911 c!2651) b!22152))

(assert (= (and d!3911 (not c!2651)) b!22153))

(assert (= (and d!3911 res!14109) b!22141))

(assert (= (and b!22141 res!14107) b!22149))

(assert (= (and b!22141 (not res!14108)) b!22155))

(assert (= (and b!22155 res!14112) b!22143))

(assert (= (and b!22141 res!14113) b!22145))

(assert (= (and b!22145 c!2654) b!22136))

(assert (= (and b!22145 (not c!2654)) b!22154))

(assert (= (and b!22136 res!14111) b!22137))

(assert (= (or b!22136 b!22154) bm!1549))

(assert (= (and b!22145 res!14110) b!22138))

(assert (= (and b!22138 c!2656) b!22147))

(assert (= (and b!22138 (not c!2656)) b!22150))

(assert (= (and b!22147 res!14115) b!22142))

(assert (= (or b!22147 b!22150) bm!1545))

(declare-fun b_lambda!1547 () Bool)

(assert (=> (not b_lambda!1547) (not b!22143)))

(assert (=> b!22143 t!3224))

(declare-fun b_and!1447 () Bool)

(assert (= b_and!1445 (and (=> t!3224 result!1075) b_and!1447)))

(assert (=> b!22149 m!15221))

(assert (=> b!22149 m!15221))

(assert (=> b!22149 m!15223))

(declare-fun m!16008 () Bool)

(assert (=> bm!1548 m!16008))

(declare-fun m!16010 () Bool)

(assert (=> b!22152 m!16010))

(assert (=> b!22152 m!15221))

(declare-fun m!16012 () Bool)

(assert (=> b!22152 m!16012))

(declare-fun m!16014 () Bool)

(assert (=> b!22152 m!16014))

(declare-fun m!16016 () Bool)

(assert (=> b!22152 m!16016))

(declare-fun m!16018 () Bool)

(assert (=> b!22152 m!16018))

(assert (=> b!22152 m!16012))

(declare-fun m!16020 () Bool)

(assert (=> b!22152 m!16020))

(declare-fun m!16022 () Bool)

(assert (=> b!22152 m!16022))

(declare-fun m!16024 () Bool)

(assert (=> b!22152 m!16024))

(assert (=> b!22152 m!16008))

(declare-fun m!16026 () Bool)

(assert (=> b!22152 m!16026))

(declare-fun m!16028 () Bool)

(assert (=> b!22152 m!16028))

(declare-fun m!16030 () Bool)

(assert (=> b!22152 m!16030))

(declare-fun m!16032 () Bool)

(assert (=> b!22152 m!16032))

(assert (=> b!22152 m!16032))

(declare-fun m!16034 () Bool)

(assert (=> b!22152 m!16034))

(assert (=> b!22152 m!16026))

(declare-fun m!16036 () Bool)

(assert (=> b!22152 m!16036))

(assert (=> b!22152 m!16018))

(declare-fun m!16038 () Bool)

(assert (=> b!22152 m!16038))

(assert (=> b!22155 m!15221))

(assert (=> b!22155 m!15221))

(declare-fun m!16040 () Bool)

(assert (=> b!22155 m!16040))

(declare-fun m!16042 () Bool)

(assert (=> bm!1546 m!16042))

(declare-fun m!16044 () Bool)

(assert (=> b!22140 m!16044))

(assert (=> b!22151 m!15221))

(assert (=> b!22151 m!15221))

(assert (=> b!22151 m!15223))

(declare-fun m!16046 () Bool)

(assert (=> bm!1545 m!16046))

(declare-fun m!16048 () Bool)

(assert (=> b!22142 m!16048))

(assert (=> b!22143 m!15221))

(assert (=> b!22143 m!15221))

(declare-fun m!16050 () Bool)

(assert (=> b!22143 m!16050))

(declare-fun m!16052 () Bool)

(assert (=> b!22143 m!16052))

(assert (=> b!22143 m!15271))

(declare-fun m!16054 () Bool)

(assert (=> b!22143 m!16054))

(assert (=> b!22143 m!15271))

(assert (=> b!22143 m!16052))

(declare-fun m!16056 () Bool)

(assert (=> b!22137 m!16056))

(declare-fun m!16058 () Bool)

(assert (=> bm!1549 m!16058))

(assert (=> d!3911 m!15279))

(assert (=> bm!1442 d!3911))

(declare-fun d!3913 () Bool)

(assert (=> d!3913 (= (map!395 (ite c!2454 (_2!451 lt!6679) lt!6678)) (getCurrentListMap!126 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) #b00000000000000000000000000000000 (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun bs!931 () Bool)

(assert (= bs!931 d!3913))

(assert (=> bs!931 m!15101))

(assert (=> bm!1425 d!3913))

(declare-fun d!3915 () Bool)

(assert (=> d!3915 (= (head!827 (toList!295 (map!395 lt!6821))) (h!1123 (toList!295 (map!395 lt!6821))))))

(assert (=> b!21517 d!3915))

(assert (=> b!21517 d!3819))

(declare-fun d!3917 () Bool)

(declare-fun e!14382 () Bool)

(assert (=> d!3917 e!14382))

(declare-fun c!2659 () Bool)

(assert (=> d!3917 (= c!2659 (and (not (= (_1!453 lt!6837) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!453 lt!6837) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!7387 () Unit!452)

(declare-fun choose!202 (array!1231 array!1229 (_ BitVec 32) (_ BitVec 32) V!1157 V!1157 (_ BitVec 64) Int) Unit!452)

(assert (=> d!3917 (= lt!7387 (choose!202 lt!6833 (array!1230 ((as const (Array (_ BitVec 32) ValueCell!300)) EmptyCell!300) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) lt!6823 (dynLambda!141 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!141 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!453 lt!6837) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938)))))))

(assert (=> d!3917 (validMask!0 (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))))))

(assert (=> d!3917 (= (lemmaKeyInListMapIsInArray!88 lt!6833 (array!1230 ((as const (Array (_ BitVec 32) ValueCell!300)) EmptyCell!300) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) lt!6823 (dynLambda!141 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!141 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!453 lt!6837) (defaultEntry!1719 (v!1573 (underlying!104 thiss!938)))) lt!7387)))

(declare-fun b!22161 () Bool)

(assert (=> b!22161 (= e!14382 (arrayContainsKey!0 lt!6833 (_1!453 lt!6837) #b00000000000000000000000000000000))))

(declare-fun b!22162 () Bool)

(assert (=> b!22162 (= e!14382 (ite (= (_1!453 lt!6837) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!6823 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!6823 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!3917 c!2659) b!22161))

(assert (= (and d!3917 (not c!2659)) b!22162))

(assert (=> d!3917 m!14919))

(assert (=> d!3917 m!15013))

(assert (=> d!3917 m!15013))

(declare-fun m!16060 () Bool)

(assert (=> d!3917 m!16060))

(assert (=> d!3917 m!14919))

(assert (=> d!3917 m!15041))

(assert (=> b!22161 m!15025))

(assert (=> b!21517 d!3917))

(declare-fun d!3919 () Bool)

(declare-fun lt!7390 () (_ BitVec 32))

(assert (=> d!3919 (and (or (bvslt lt!7390 #b00000000000000000000000000000000) (bvsge lt!7390 (size!677 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))) (and (bvsge lt!7390 #b00000000000000000000000000000000) (bvslt lt!7390 (size!677 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))))) (bvsge lt!7390 #b00000000000000000000000000000000) (bvslt lt!7390 (size!677 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))) (= (select (arr!584 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))) lt!7390) (_1!453 lt!6837)))))

(declare-fun e!14385 () (_ BitVec 32))

(assert (=> d!3919 (= lt!7390 e!14385)))

(declare-fun c!2662 () Bool)

(assert (=> d!3919 (= c!2662 (= (select (arr!584 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))) #b00000000000000000000000000000000) (_1!453 lt!6837)))))

(assert (=> d!3919 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))) (bvslt (size!677 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))) #b01111111111111111111111111111111))))

(assert (=> d!3919 (= (arrayScanForKey!0 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (_1!453 lt!6837) #b00000000000000000000000000000000) lt!7390)))

(declare-fun b!22167 () Bool)

(assert (=> b!22167 (= e!14385 #b00000000000000000000000000000000)))

(declare-fun b!22168 () Bool)

(assert (=> b!22168 (= e!14385 (arrayScanForKey!0 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!22 thiss!938 (mask!4692 (v!1573 (underlying!104 thiss!938))) (_vacant!134 (v!1573 (underlying!104 thiss!938))) (_size!134 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)) (_1!453 lt!6837) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!3919 c!2662) b!22167))

(assert (= (and d!3919 (not c!2662)) b!22168))

(declare-fun m!16062 () Bool)

(assert (=> d!3919 m!16062))

(declare-fun m!16064 () Bool)

(assert (=> d!3919 m!16064))

(declare-fun m!16066 () Bool)

(assert (=> b!22168 m!16066))

(assert (=> b!21517 d!3919))

(declare-fun b!22169 () Bool)

(declare-fun e!14397 () Bool)

(declare-fun e!14387 () Bool)

(assert (=> b!22169 (= e!14397 e!14387)))

(declare-fun res!14120 () Bool)

(declare-fun call!1556 () Bool)

(assert (=> b!22169 (= res!14120 call!1556)))

(assert (=> b!22169 (=> (not res!14120) (not e!14387))))

(declare-fun bm!1550 () Bool)

(declare-fun call!1554 () ListLongMap!559)

(declare-fun call!1555 () ListLongMap!559)

(assert (=> bm!1550 (= call!1554 call!1555)))

(declare-fun b!22170 () Bool)

(declare-fun lt!7406 () ListLongMap!559)

(assert (=> b!22170 (= e!14387 (= (apply!28 lt!7406 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1646 lt!6678)))))

(declare-fun b!22171 () Bool)

(declare-fun e!14391 () Bool)

(declare-fun e!14392 () Bool)

(assert (=> b!22171 (= e!14391 e!14392)))

(declare-fun c!2668 () Bool)

(assert (=> b!22171 (= c!2668 (not (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1551 () Bool)

(declare-fun call!1553 () ListLongMap!559)

(declare-fun call!1557 () ListLongMap!559)

(assert (=> bm!1551 (= call!1553 call!1557)))

(declare-fun b!22172 () Bool)

(declare-fun e!14394 () ListLongMap!559)

(assert (=> b!22172 (= e!14394 call!1553)))

(declare-fun d!3921 () Bool)

(assert (=> d!3921 e!14391))

(declare-fun res!14118 () Bool)

(assert (=> d!3921 (=> (not res!14118) (not e!14391))))

(assert (=> d!3921 (= res!14118 (or (bvsge #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))))))))

(declare-fun lt!7407 () ListLongMap!559)

(assert (=> d!3921 (= lt!7406 lt!7407)))

(declare-fun lt!7409 () Unit!452)

(declare-fun e!14388 () Unit!452)

(assert (=> d!3921 (= lt!7409 e!14388)))

(declare-fun c!2663 () Bool)

(declare-fun e!14398 () Bool)

(assert (=> d!3921 (= c!2663 e!14398)))

(declare-fun res!14123 () Bool)

(assert (=> d!3921 (=> (not res!14123) (not e!14398))))

(assert (=> d!3921 (= res!14123 (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))))))

(declare-fun e!14390 () ListLongMap!559)

(assert (=> d!3921 (= lt!7407 e!14390)))

(declare-fun c!2664 () Bool)

(assert (=> d!3921 (= c!2664 (and (not (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3921 (validMask!0 (mask!4692 lt!6678))))

(assert (=> d!3921 (= (getCurrentListMap!126 (_keys!3140 lt!6678) lt!6946 (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)) lt!7406)))

(declare-fun bm!1552 () Bool)

(declare-fun call!1558 () Bool)

(assert (=> bm!1552 (= call!1558 (contains!225 lt!7406 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22173 () Bool)

(assert (=> b!22173 (= e!14390 (+!42 call!1557 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 lt!6678))))))

(declare-fun bm!1553 () Bool)

(declare-fun call!1559 () ListLongMap!559)

(declare-fun c!2667 () Bool)

(assert (=> bm!1553 (= call!1557 (+!42 (ite c!2664 call!1559 (ite c!2667 call!1555 call!1554)) (ite (or c!2664 c!2667) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 lt!6678)) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 lt!6678)))))))

(declare-fun b!22174 () Bool)

(declare-fun res!14122 () Bool)

(assert (=> b!22174 (=> (not res!14122) (not e!14391))))

(declare-fun e!14393 () Bool)

(assert (=> b!22174 (= res!14122 e!14393)))

(declare-fun res!14117 () Bool)

(assert (=> b!22174 (=> res!14117 e!14393)))

(declare-fun e!14396 () Bool)

(assert (=> b!22174 (= res!14117 (not e!14396))))

(declare-fun res!14116 () Bool)

(assert (=> b!22174 (=> (not res!14116) (not e!14396))))

(assert (=> b!22174 (= res!14116 (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))))))

(declare-fun b!22175 () Bool)

(declare-fun e!14386 () Bool)

(assert (=> b!22175 (= e!14386 (= (apply!28 lt!7406 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1646 lt!6678)))))

(declare-fun b!22176 () Bool)

(declare-fun e!14395 () Bool)

(assert (=> b!22176 (= e!14395 (= (apply!28 lt!7406 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000)) (get!377 (select (arr!583 lt!6946) #b00000000000000000000000000000000) (dynLambda!141 (defaultEntry!1719 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!676 lt!6946)))))

(assert (=> b!22176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))))))

(declare-fun b!22177 () Bool)

(declare-fun e!14389 () ListLongMap!559)

(assert (=> b!22177 (= e!14389 call!1553)))

(declare-fun b!22178 () Bool)

(declare-fun res!14119 () Bool)

(assert (=> b!22178 (=> (not res!14119) (not e!14391))))

(assert (=> b!22178 (= res!14119 e!14397)))

(declare-fun c!2666 () Bool)

(assert (=> b!22178 (= c!2666 (not (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!22179 () Bool)

(assert (=> b!22179 (= e!14389 call!1554)))

(declare-fun b!22180 () Bool)

(assert (=> b!22180 (= e!14392 e!14386)))

(declare-fun res!14124 () Bool)

(assert (=> b!22180 (= res!14124 call!1558)))

(assert (=> b!22180 (=> (not res!14124) (not e!14386))))

(declare-fun b!22181 () Bool)

(declare-fun c!2665 () Bool)

(assert (=> b!22181 (= c!2665 (and (not (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!22181 (= e!14394 e!14389)))

(declare-fun b!22182 () Bool)

(assert (=> b!22182 (= e!14396 (validKeyInArray!0 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000)))))

(declare-fun bm!1554 () Bool)

(assert (=> bm!1554 (= call!1555 call!1559)))

(declare-fun b!22183 () Bool)

(assert (=> b!22183 (= e!14392 (not call!1558))))

(declare-fun b!22184 () Bool)

(assert (=> b!22184 (= e!14398 (validKeyInArray!0 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000)))))

(declare-fun b!22185 () Bool)

(declare-fun lt!7405 () Unit!452)

(assert (=> b!22185 (= e!14388 lt!7405)))

(declare-fun lt!7403 () ListLongMap!559)

(assert (=> b!22185 (= lt!7403 (getCurrentListMapNoExtraKeys!13 (_keys!3140 lt!6678) lt!6946 (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun lt!7396 () (_ BitVec 64))

(assert (=> b!22185 (= lt!7396 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7393 () (_ BitVec 64))

(assert (=> b!22185 (= lt!7393 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000))))

(declare-fun lt!7395 () Unit!452)

(assert (=> b!22185 (= lt!7395 (addStillContains!13 lt!7403 lt!7396 (zeroValue!1646 lt!6678) lt!7393))))

(assert (=> b!22185 (contains!225 (+!42 lt!7403 (tuple2!901 lt!7396 (zeroValue!1646 lt!6678))) lt!7393)))

(declare-fun lt!7400 () Unit!452)

(assert (=> b!22185 (= lt!7400 lt!7395)))

(declare-fun lt!7404 () ListLongMap!559)

(assert (=> b!22185 (= lt!7404 (getCurrentListMapNoExtraKeys!13 (_keys!3140 lt!6678) lt!6946 (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun lt!7397 () (_ BitVec 64))

(assert (=> b!22185 (= lt!7397 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7391 () (_ BitVec 64))

(assert (=> b!22185 (= lt!7391 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000))))

(declare-fun lt!7412 () Unit!452)

(assert (=> b!22185 (= lt!7412 (addApplyDifferent!13 lt!7404 lt!7397 (minValue!1646 lt!6678) lt!7391))))

(assert (=> b!22185 (= (apply!28 (+!42 lt!7404 (tuple2!901 lt!7397 (minValue!1646 lt!6678))) lt!7391) (apply!28 lt!7404 lt!7391))))

(declare-fun lt!7401 () Unit!452)

(assert (=> b!22185 (= lt!7401 lt!7412)))

(declare-fun lt!7411 () ListLongMap!559)

(assert (=> b!22185 (= lt!7411 (getCurrentListMapNoExtraKeys!13 (_keys!3140 lt!6678) lt!6946 (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun lt!7410 () (_ BitVec 64))

(assert (=> b!22185 (= lt!7410 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7402 () (_ BitVec 64))

(assert (=> b!22185 (= lt!7402 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000))))

(declare-fun lt!7394 () Unit!452)

(assert (=> b!22185 (= lt!7394 (addApplyDifferent!13 lt!7411 lt!7410 (zeroValue!1646 lt!6678) lt!7402))))

(assert (=> b!22185 (= (apply!28 (+!42 lt!7411 (tuple2!901 lt!7410 (zeroValue!1646 lt!6678))) lt!7402) (apply!28 lt!7411 lt!7402))))

(declare-fun lt!7398 () Unit!452)

(assert (=> b!22185 (= lt!7398 lt!7394)))

(declare-fun lt!7408 () ListLongMap!559)

(assert (=> b!22185 (= lt!7408 (getCurrentListMapNoExtraKeys!13 (_keys!3140 lt!6678) lt!6946 (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun lt!7399 () (_ BitVec 64))

(assert (=> b!22185 (= lt!7399 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7392 () (_ BitVec 64))

(assert (=> b!22185 (= lt!7392 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000))))

(assert (=> b!22185 (= lt!7405 (addApplyDifferent!13 lt!7408 lt!7399 (minValue!1646 lt!6678) lt!7392))))

(assert (=> b!22185 (= (apply!28 (+!42 lt!7408 (tuple2!901 lt!7399 (minValue!1646 lt!6678))) lt!7392) (apply!28 lt!7408 lt!7392))))

(declare-fun b!22186 () Bool)

(declare-fun Unit!485 () Unit!452)

(assert (=> b!22186 (= e!14388 Unit!485)))

(declare-fun bm!1555 () Bool)

(assert (=> bm!1555 (= call!1559 (getCurrentListMapNoExtraKeys!13 (_keys!3140 lt!6678) lt!6946 (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun b!22187 () Bool)

(assert (=> b!22187 (= e!14397 (not call!1556))))

(declare-fun b!22188 () Bool)

(assert (=> b!22188 (= e!14393 e!14395)))

(declare-fun res!14121 () Bool)

(assert (=> b!22188 (=> (not res!14121) (not e!14395))))

(assert (=> b!22188 (= res!14121 (contains!225 lt!7406 (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000)))))

(assert (=> b!22188 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!677 (_keys!3140 lt!6678))))))

(declare-fun b!22189 () Bool)

(assert (=> b!22189 (= e!14390 e!14394)))

(assert (=> b!22189 (= c!2667 (and (not (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1622 lt!6678) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1556 () Bool)

(assert (=> bm!1556 (= call!1556 (contains!225 lt!7406 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3921 c!2664) b!22173))

(assert (= (and d!3921 (not c!2664)) b!22189))

(assert (= (and b!22189 c!2667) b!22172))

(assert (= (and b!22189 (not c!2667)) b!22181))

(assert (= (and b!22181 c!2665) b!22177))

(assert (= (and b!22181 (not c!2665)) b!22179))

(assert (= (or b!22177 b!22179) bm!1550))

(assert (= (or b!22172 bm!1550) bm!1554))

(assert (= (or b!22172 b!22177) bm!1551))

(assert (= (or b!22173 bm!1554) bm!1555))

(assert (= (or b!22173 bm!1551) bm!1553))

(assert (= (and d!3921 res!14123) b!22184))

(assert (= (and d!3921 c!2663) b!22185))

(assert (= (and d!3921 (not c!2663)) b!22186))

(assert (= (and d!3921 res!14118) b!22174))

(assert (= (and b!22174 res!14116) b!22182))

(assert (= (and b!22174 (not res!14117)) b!22188))

(assert (= (and b!22188 res!14121) b!22176))

(assert (= (and b!22174 res!14122) b!22178))

(assert (= (and b!22178 c!2666) b!22169))

(assert (= (and b!22178 (not c!2666)) b!22187))

(assert (= (and b!22169 res!14120) b!22170))

(assert (= (or b!22169 b!22187) bm!1556))

(assert (= (and b!22178 res!14119) b!22171))

(assert (= (and b!22171 c!2668) b!22180))

(assert (= (and b!22171 (not c!2668)) b!22183))

(assert (= (and b!22180 res!14124) b!22175))

(assert (= (or b!22180 b!22183) bm!1552))

(declare-fun b_lambda!1549 () Bool)

(assert (=> (not b_lambda!1549) (not b!22176)))

(assert (=> b!22176 t!3226))

(declare-fun b_and!1449 () Bool)

(assert (= b_and!1447 (and (=> t!3226 result!1077) b_and!1449)))

(assert (=> b!22182 m!15417))

(assert (=> b!22182 m!15417))

(assert (=> b!22182 m!15419))

(declare-fun m!16068 () Bool)

(assert (=> bm!1555 m!16068))

(declare-fun m!16070 () Bool)

(assert (=> b!22185 m!16070))

(assert (=> b!22185 m!15417))

(declare-fun m!16072 () Bool)

(assert (=> b!22185 m!16072))

(declare-fun m!16074 () Bool)

(assert (=> b!22185 m!16074))

(declare-fun m!16076 () Bool)

(assert (=> b!22185 m!16076))

(declare-fun m!16078 () Bool)

(assert (=> b!22185 m!16078))

(assert (=> b!22185 m!16072))

(declare-fun m!16080 () Bool)

(assert (=> b!22185 m!16080))

(declare-fun m!16082 () Bool)

(assert (=> b!22185 m!16082))

(declare-fun m!16084 () Bool)

(assert (=> b!22185 m!16084))

(assert (=> b!22185 m!16068))

(declare-fun m!16086 () Bool)

(assert (=> b!22185 m!16086))

(declare-fun m!16088 () Bool)

(assert (=> b!22185 m!16088))

(declare-fun m!16090 () Bool)

(assert (=> b!22185 m!16090))

(declare-fun m!16092 () Bool)

(assert (=> b!22185 m!16092))

(assert (=> b!22185 m!16092))

(declare-fun m!16094 () Bool)

(assert (=> b!22185 m!16094))

(assert (=> b!22185 m!16086))

(declare-fun m!16096 () Bool)

(assert (=> b!22185 m!16096))

(assert (=> b!22185 m!16078))

(declare-fun m!16098 () Bool)

(assert (=> b!22185 m!16098))

(assert (=> b!22188 m!15417))

(assert (=> b!22188 m!15417))

(declare-fun m!16100 () Bool)

(assert (=> b!22188 m!16100))

(declare-fun m!16102 () Bool)

(assert (=> bm!1553 m!16102))

(declare-fun m!16104 () Bool)

(assert (=> b!22173 m!16104))

(assert (=> b!22184 m!15417))

(assert (=> b!22184 m!15417))

(assert (=> b!22184 m!15419))

(declare-fun m!16106 () Bool)

(assert (=> bm!1552 m!16106))

(declare-fun m!16108 () Bool)

(assert (=> b!22175 m!16108))

(assert (=> b!22176 m!15417))

(assert (=> b!22176 m!15417))

(declare-fun m!16110 () Bool)

(assert (=> b!22176 m!16110))

(declare-fun m!16112 () Bool)

(assert (=> b!22176 m!16112))

(assert (=> b!22176 m!15467))

(declare-fun m!16114 () Bool)

(assert (=> b!22176 m!16114))

(assert (=> b!22176 m!15467))

(assert (=> b!22176 m!16112))

(declare-fun m!16116 () Bool)

(assert (=> b!22170 m!16116))

(declare-fun m!16118 () Bool)

(assert (=> bm!1556 m!16118))

(assert (=> d!3921 m!15191))

(assert (=> b!21694 d!3921))

(assert (=> bm!1426 d!3803))

(declare-fun d!3923 () Bool)

(assert (=> d!3923 (= (apply!28 lt!6762 (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))) (get!378 (getValueByKey!60 (toList!295 lt!6762) (select (arr!584 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))))))))

(declare-fun bs!932 () Bool)

(assert (= bs!932 d!3923))

(assert (=> bs!932 m!14963))

(assert (=> bs!932 m!15511))

(assert (=> bs!932 m!15511))

(declare-fun m!16120 () Bool)

(assert (=> bs!932 m!16120))

(assert (=> b!21484 d!3923))

(declare-fun d!3925 () Bool)

(declare-fun c!2671 () Bool)

(assert (=> d!3925 (= c!2671 ((_ is ValueCellFull!300) (select (arr!583 (_values!1708 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001)))))))

(declare-fun e!14401 () V!1157)

(assert (=> d!3925 (= (get!377 (select (arr!583 (_values!1708 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!141 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!14401)))

(declare-fun b!22194 () Bool)

(declare-fun get!379 (ValueCell!300 V!1157) V!1157)

(assert (=> b!22194 (= e!14401 (get!379 (select (arr!583 (_values!1708 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!141 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!22195 () Bool)

(declare-fun get!380 (ValueCell!300 V!1157) V!1157)

(assert (=> b!22195 (= e!14401 (get!380 (select (arr!583 (_values!1708 (v!1573 (underlying!104 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!677 (_keys!3140 (v!1573 (underlying!104 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!141 (defaultEntry!1719 (v!1573 (underlying!104 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!3925 c!2671) b!22194))

(assert (= (and d!3925 (not c!2671)) b!22195))

(assert (=> b!22194 m!15011))

(assert (=> b!22194 m!15013))

(declare-fun m!16122 () Bool)

(assert (=> b!22194 m!16122))

(assert (=> b!22195 m!15011))

(assert (=> b!22195 m!15013))

(declare-fun m!16124 () Bool)

(assert (=> b!22195 m!16124))

(assert (=> b!21484 d!3925))

(declare-fun d!3927 () Bool)

(declare-fun e!14402 () Bool)

(assert (=> d!3927 e!14402))

(declare-fun res!14125 () Bool)

(assert (=> d!3927 (=> res!14125 e!14402)))

(declare-fun lt!7413 () Bool)

(assert (=> d!3927 (= res!14125 (not lt!7413))))

(declare-fun lt!7414 () Bool)

(assert (=> d!3927 (= lt!7413 lt!7414)))

(declare-fun lt!7416 () Unit!452)

(declare-fun e!14403 () Unit!452)

(assert (=> d!3927 (= lt!7416 e!14403)))

(declare-fun c!2672 () Bool)

(assert (=> d!3927 (= c!2672 lt!7414)))

(assert (=> d!3927 (= lt!7414 (containsKey!24 (toList!295 e!14105) (ite c!2534 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!584 (_keys!3140 lt!6678)) (index!2325 lt!6945)))))))

(assert (=> d!3927 (= (contains!225 e!14105 (ite c!2534 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!584 (_keys!3140 lt!6678)) (index!2325 lt!6945)))) lt!7413)))

(declare-fun b!22196 () Bool)

(declare-fun lt!7415 () Unit!452)

(assert (=> b!22196 (= e!14403 lt!7415)))

(assert (=> b!22196 (= lt!7415 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!295 e!14105) (ite c!2534 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!584 (_keys!3140 lt!6678)) (index!2325 lt!6945)))))))

(assert (=> b!22196 (isDefined!22 (getValueByKey!60 (toList!295 e!14105) (ite c!2534 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!584 (_keys!3140 lt!6678)) (index!2325 lt!6945)))))))

(declare-fun b!22197 () Bool)

(declare-fun Unit!486 () Unit!452)

(assert (=> b!22197 (= e!14403 Unit!486)))

(declare-fun b!22198 () Bool)

(assert (=> b!22198 (= e!14402 (isDefined!22 (getValueByKey!60 (toList!295 e!14105) (ite c!2534 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!584 (_keys!3140 lt!6678)) (index!2325 lt!6945))))))))

(assert (= (and d!3927 c!2672) b!22196))

(assert (= (and d!3927 (not c!2672)) b!22197))

(assert (= (and d!3927 (not res!14125)) b!22198))

(declare-fun m!16126 () Bool)

(assert (=> d!3927 m!16126))

(declare-fun m!16128 () Bool)

(assert (=> b!22196 m!16128))

(declare-fun m!16130 () Bool)

(assert (=> b!22196 m!16130))

(assert (=> b!22196 m!16130))

(declare-fun m!16132 () Bool)

(assert (=> b!22196 m!16132))

(assert (=> b!22198 m!16130))

(assert (=> b!22198 m!16130))

(assert (=> b!22198 m!16132))

(assert (=> bm!1458 d!3927))

(declare-fun d!3929 () Bool)

(declare-fun e!14404 () Bool)

(assert (=> d!3929 e!14404))

(declare-fun res!14126 () Bool)

(assert (=> d!3929 (=> (not res!14126) (not e!14404))))

(declare-fun lt!7417 () SeekEntryResult!51)

(assert (=> d!3929 (= res!14126 ((_ is Found!51) lt!7417))))

(assert (=> d!3929 (= lt!7417 (seekEntryOrOpen!0 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun lt!7418 () Unit!452)

(assert (=> d!3929 (= lt!7418 (choose!199 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(assert (=> d!3929 (validMask!0 (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)))))

(assert (=> d!3929 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)) (_values!1708 (ite c!2454 (_2!451 lt!6679) lt!6678)) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678)) (extraKeys!1622 (ite c!2454 (_2!451 lt!6679) lt!6678)) (zeroValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (minValue!1646 (ite c!2454 (_2!451 lt!6679) lt!6678)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1719 (ite c!2454 (_2!451 lt!6679) lt!6678))) lt!7418)))

(declare-fun b!22199 () Bool)

(declare-fun res!14127 () Bool)

(assert (=> b!22199 (=> (not res!14127) (not e!14404))))

(assert (=> b!22199 (= res!14127 (inRange!0 (index!2325 lt!7417) (mask!4692 (ite c!2454 (_2!451 lt!6679) lt!6678))))))

(declare-fun b!22200 () Bool)

(assert (=> b!22200 (= e!14404 (= (select (arr!584 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678))) (index!2325 lt!7417)) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22200 (and (bvsge (index!2325 lt!7417) #b00000000000000000000000000000000) (bvslt (index!2325 lt!7417) (size!677 (_keys!3140 (ite c!2454 (_2!451 lt!6679) lt!6678)))))))

(assert (= (and d!3929 res!14126) b!22199))

(assert (= (and b!22199 res!14127) b!22200))

(assert (=> d!3929 m!15091))

(declare-fun m!16134 () Bool)

(assert (=> d!3929 m!16134))

(assert (=> d!3929 m!15279))

(declare-fun m!16136 () Bool)

(assert (=> b!22199 m!16136))

(declare-fun m!16138 () Bool)

(assert (=> b!22200 m!16138))

(assert (=> bm!1424 d!3929))

(declare-fun d!3931 () Bool)

(declare-fun e!14405 () Bool)

(assert (=> d!3931 e!14405))

(declare-fun res!14129 () Bool)

(assert (=> d!3931 (=> (not res!14129) (not e!14405))))

(declare-fun lt!7420 () ListLongMap!559)

(assert (=> d!3931 (= res!14129 (contains!225 lt!7420 (_1!453 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(declare-fun lt!7421 () List!561)

(assert (=> d!3931 (= lt!7420 (ListLongMap!560 lt!7421))))

(declare-fun lt!7422 () Unit!452)

(declare-fun lt!7419 () Unit!452)

(assert (=> d!3931 (= lt!7422 lt!7419)))

(assert (=> d!3931 (= (getValueByKey!60 lt!7421 (_1!453 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))) (Some!65 (_2!453 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3931 (= lt!7419 (lemmaContainsTupThenGetReturnValue!17 lt!7421 (_1!453 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (_2!453 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3931 (= lt!7421 (insertStrictlySorted!17 (toList!295 call!1466) (_1!453 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (_2!453 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3931 (= (+!42 call!1466 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!7420)))

(declare-fun b!22201 () Bool)

(declare-fun res!14128 () Bool)

(assert (=> b!22201 (=> (not res!14128) (not e!14405))))

(assert (=> b!22201 (= res!14128 (= (getValueByKey!60 (toList!295 lt!7420) (_1!453 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938)))))) (Some!65 (_2!453 (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))))))))

(declare-fun b!22202 () Bool)

(assert (=> b!22202 (= e!14405 (contains!226 (toList!295 lt!7420) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))))))

(assert (= (and d!3931 res!14129) b!22201))

(assert (= (and b!22201 res!14128) b!22202))

(declare-fun m!16140 () Bool)

(assert (=> d!3931 m!16140))

(declare-fun m!16142 () Bool)

(assert (=> d!3931 m!16142))

(declare-fun m!16144 () Bool)

(assert (=> d!3931 m!16144))

(declare-fun m!16146 () Bool)

(assert (=> d!3931 m!16146))

(declare-fun m!16148 () Bool)

(assert (=> b!22201 m!16148))

(declare-fun m!16150 () Bool)

(assert (=> b!22202 m!16150))

(assert (=> b!21664 d!3931))

(declare-fun d!3933 () Bool)

(declare-fun e!14406 () Bool)

(assert (=> d!3933 e!14406))

(declare-fun res!14130 () Bool)

(assert (=> d!3933 (=> res!14130 e!14406)))

(declare-fun lt!7423 () Bool)

(assert (=> d!3933 (= res!14130 (not lt!7423))))

(declare-fun lt!7424 () Bool)

(assert (=> d!3933 (= lt!7423 lt!7424)))

(declare-fun lt!7426 () Unit!452)

(declare-fun e!14407 () Unit!452)

(assert (=> d!3933 (= lt!7426 e!14407)))

(declare-fun c!2673 () Bool)

(assert (=> d!3933 (= c!2673 lt!7424)))

(assert (=> d!3933 (= lt!7424 (containsKey!24 (toList!295 call!1438) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3933 (= (contains!225 call!1438 (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) lt!7423)))

(declare-fun b!22203 () Bool)

(declare-fun lt!7425 () Unit!452)

(assert (=> b!22203 (= e!14407 lt!7425)))

(assert (=> b!22203 (= lt!7425 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!295 call!1438) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22203 (isDefined!22 (getValueByKey!60 (toList!295 call!1438) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!22204 () Bool)

(declare-fun Unit!487 () Unit!452)

(assert (=> b!22204 (= e!14407 Unit!487)))

(declare-fun b!22205 () Bool)

(assert (=> b!22205 (= e!14406 (isDefined!22 (getValueByKey!60 (toList!295 call!1438) (ite c!2454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2455 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!3933 c!2673) b!22203))

(assert (= (and d!3933 (not c!2673)) b!22204))

(assert (= (and d!3933 (not res!14130)) b!22205))

(declare-fun m!16152 () Bool)

(assert (=> d!3933 m!16152))

(declare-fun m!16154 () Bool)

(assert (=> b!22203 m!16154))

(declare-fun m!16156 () Bool)

(assert (=> b!22203 m!16156))

(assert (=> b!22203 m!16156))

(declare-fun m!16158 () Bool)

(assert (=> b!22203 m!16158))

(assert (=> b!22205 m!16156))

(assert (=> b!22205 m!16156))

(assert (=> b!22205 m!16158))

(assert (=> b!21623 d!3933))

(declare-fun d!3935 () Bool)

(assert (=> d!3935 (= (validMask!0 lt!6842) (and (or (= lt!6842 #b00000000000000000000000000000111) (= lt!6842 #b00000000000000000000000000001111) (= lt!6842 #b00000000000000000000000000011111) (= lt!6842 #b00000000000000000000000000111111) (= lt!6842 #b00000000000000000000000001111111) (= lt!6842 #b00000000000000000000000011111111) (= lt!6842 #b00000000000000000000000111111111) (= lt!6842 #b00000000000000000000001111111111) (= lt!6842 #b00000000000000000000011111111111) (= lt!6842 #b00000000000000000000111111111111) (= lt!6842 #b00000000000000000001111111111111) (= lt!6842 #b00000000000000000011111111111111) (= lt!6842 #b00000000000000000111111111111111) (= lt!6842 #b00000000000000001111111111111111) (= lt!6842 #b00000000000000011111111111111111) (= lt!6842 #b00000000000000111111111111111111) (= lt!6842 #b00000000000001111111111111111111) (= lt!6842 #b00000000000011111111111111111111) (= lt!6842 #b00000000000111111111111111111111) (= lt!6842 #b00000000001111111111111111111111) (= lt!6842 #b00000000011111111111111111111111) (= lt!6842 #b00000000111111111111111111111111) (= lt!6842 #b00000001111111111111111111111111) (= lt!6842 #b00000011111111111111111111111111) (= lt!6842 #b00000111111111111111111111111111) (= lt!6842 #b00001111111111111111111111111111) (= lt!6842 #b00011111111111111111111111111111) (= lt!6842 #b00111111111111111111111111111111)) (bvsle lt!6842 #b00111111111111111111111111111111)))))

(assert (=> d!3743 d!3935))

(assert (=> d!3743 d!3755))

(declare-fun d!3937 () Bool)

(declare-fun e!14408 () Bool)

(assert (=> d!3937 e!14408))

(declare-fun res!14132 () Bool)

(assert (=> d!3937 (=> (not res!14132) (not e!14408))))

(declare-fun lt!7428 () ListLongMap!559)

(assert (=> d!3937 (= res!14132 (contains!225 lt!7428 (_1!453 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(declare-fun lt!7429 () List!561)

(assert (=> d!3937 (= lt!7428 (ListLongMap!560 lt!7429))))

(declare-fun lt!7430 () Unit!452)

(declare-fun lt!7427 () Unit!452)

(assert (=> d!3937 (= lt!7430 lt!7427)))

(assert (=> d!3937 (= (getValueByKey!60 lt!7429 (_1!453 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (Some!65 (_2!453 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3937 (= lt!7427 (lemmaContainsTupThenGetReturnValue!17 lt!7429 (_1!453 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (_2!453 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3937 (= lt!7429 (insertStrictlySorted!17 (toList!295 call!1373) (_1!453 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938))))) (_2!453 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))))))

(assert (=> d!3937 (= (+!42 call!1373 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938))))) lt!7428)))

(declare-fun b!22206 () Bool)

(declare-fun res!14131 () Bool)

(assert (=> b!22206 (=> (not res!14131) (not e!14408))))

(assert (=> b!22206 (= res!14131 (= (getValueByKey!60 (toList!295 lt!7428) (_1!453 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938)))))) (Some!65 (_2!453 (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))))

(declare-fun b!22207 () Bool)

(assert (=> b!22207 (= e!14408 (contains!226 (toList!295 lt!7428) (tuple2!901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1646 (v!1573 (underlying!104 thiss!938))))))))

(assert (= (and d!3937 res!14132) b!22206))

(assert (= (and b!22206 res!14131) b!22207))

(declare-fun m!16160 () Bool)

(assert (=> d!3937 m!16160))

(declare-fun m!16162 () Bool)

(assert (=> d!3937 m!16162))

(declare-fun m!16164 () Bool)

(assert (=> d!3937 m!16164))

(declare-fun m!16166 () Bool)

(assert (=> d!3937 m!16166))

(declare-fun m!16168 () Bool)

(assert (=> b!22206 m!16168))

(declare-fun m!16170 () Bool)

(assert (=> b!22207 m!16170))

(assert (=> b!21481 d!3937))

(declare-fun d!3939 () Bool)

(assert (=> d!3939 (= (+!42 (getCurrentListMap!126 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) (zeroValue!1646 lt!6678) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)) (tuple2!901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))))) (getCurrentListMap!126 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) lt!6932 (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 lt!6678) #b00000000000000000000000000000000 (defaultEntry!1719 lt!6678)))))

(declare-fun lt!7431 () Unit!452)

(assert (=> d!3939 (= lt!7431 (choose!196 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) lt!6932 (zeroValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 lt!6678) (defaultEntry!1719 lt!6678)))))

(assert (=> d!3939 (validMask!0 (mask!4692 lt!6678))))

(assert (=> d!3939 (= (lemmaChangeZeroKeyThenAddPairToListMap!7 (_keys!3140 lt!6678) (_values!1708 lt!6678) (mask!4692 lt!6678) (extraKeys!1622 lt!6678) lt!6932 (zeroValue!1646 lt!6678) (zeroValue!1646 (v!1573 (underlying!104 thiss!938))) (minValue!1646 lt!6678) (defaultEntry!1719 lt!6678)) lt!7431)))

(declare-fun bs!933 () Bool)

(assert (= bs!933 d!3939))

(assert (=> bs!933 m!15161))

(declare-fun m!16172 () Bool)

(assert (=> bs!933 m!16172))

(assert (=> bs!933 m!15191))

(assert (=> bs!933 m!15161))

(assert (=> bs!933 m!15329))

(declare-fun m!16174 () Bool)

(assert (=> bs!933 m!16174))

(assert (=> b!21665 d!3939))

(declare-fun d!3941 () Bool)

(declare-fun res!14133 () Bool)

(declare-fun e!14409 () Bool)

(assert (=> d!3941 (=> res!14133 e!14409)))

(assert (=> d!3941 (= res!14133 (= (select (arr!584 (_keys!3140 lt!6678)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3941 (= (arrayContainsKey!0 (_keys!3140 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000) e!14409)))

(declare-fun b!22208 () Bool)

(declare-fun e!14410 () Bool)

(assert (=> b!22208 (= e!14409 e!14410)))

(declare-fun res!14134 () Bool)

(assert (=> b!22208 (=> (not res!14134) (not e!14410))))

(assert (=> b!22208 (= res!14134 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!677 (_keys!3140 lt!6678))))))

(declare-fun b!22209 () Bool)

(assert (=> b!22209 (= e!14410 (arrayContainsKey!0 (_keys!3140 lt!6678) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!3941 (not res!14133)) b!22208))

(assert (= (and b!22208 res!14134) b!22209))

(assert (=> d!3941 m!15417))

(declare-fun m!16176 () Bool)

(assert (=> b!22209 m!16176))

(assert (=> bm!1467 d!3941))

(declare-fun condMapEmpty!986 () Bool)

(declare-fun mapDefault!986 () ValueCell!300)

(assert (=> mapNonEmpty!985 (= condMapEmpty!986 (= mapRest!985 ((as const (Array (_ BitVec 32) ValueCell!300)) mapDefault!986)))))

(declare-fun e!14412 () Bool)

(declare-fun mapRes!986 () Bool)

(assert (=> mapNonEmpty!985 (= tp!3451 (and e!14412 mapRes!986))))

(declare-fun b!22210 () Bool)

(declare-fun e!14411 () Bool)

(assert (=> b!22210 (= e!14411 tp_is_empty!999)))

(declare-fun mapNonEmpty!986 () Bool)

(declare-fun tp!3452 () Bool)

(assert (=> mapNonEmpty!986 (= mapRes!986 (and tp!3452 e!14411))))

(declare-fun mapValue!986 () ValueCell!300)

(declare-fun mapKey!986 () (_ BitVec 32))

(declare-fun mapRest!986 () (Array (_ BitVec 32) ValueCell!300))

(assert (=> mapNonEmpty!986 (= mapRest!985 (store mapRest!986 mapKey!986 mapValue!986))))

(declare-fun mapIsEmpty!986 () Bool)

(assert (=> mapIsEmpty!986 mapRes!986))

(declare-fun b!22211 () Bool)

(assert (=> b!22211 (= e!14412 tp_is_empty!999)))

(assert (= (and mapNonEmpty!985 condMapEmpty!986) mapIsEmpty!986))

(assert (= (and mapNonEmpty!985 (not condMapEmpty!986)) mapNonEmpty!986))

(assert (= (and mapNonEmpty!986 ((_ is ValueCellFull!300) mapValue!986)) b!22210))

(assert (= (and mapNonEmpty!985 ((_ is ValueCellFull!300) mapDefault!986)) b!22211))

(declare-fun m!16178 () Bool)

(assert (=> mapNonEmpty!986 m!16178))

(declare-fun b_lambda!1551 () Bool)

(assert (= b_lambda!1541 (or (and b!21366 b_free!735) b_lambda!1551)))

(declare-fun b_lambda!1553 () Bool)

(assert (= b_lambda!1539 (or (and b!21366 b_free!735) b_lambda!1553)))

(check-sat (not b!21753) (not b!21985) (not d!3783) (not b!21928) (not b!21873) (not b!22037) (not b!22000) tp_is_empty!999 (not b!22123) (not b!21916) (not b!22068) (not b!22206) (not b!22002) (not b!22099) (not b!22170) (not b_lambda!1535) (not d!3763) (not b!22053) (not d!3939) (not d!3921) (not b!21974) (not b!21970) (not b_lambda!1549) (not b!21950) (not d!3779) (not bm!1546) (not b!22140) (not b!21930) (not d!3815) (not bm!1525) (not b!22044) (not d!3891) (not b!22195) (not d!3777) (not b!21765) (not b!22205) (not b_lambda!1527) (not d!3909) (not b!21972) (not b!21906) (not d!3877) (not bm!1503) (not bm!1555) (not d!3771) (not b_lambda!1543) (not b!21761) (not b!22198) (not b!21924) (not b!22143) (not d!3817) (not d!3853) (not bm!1548) (not b!22050) (not d!3837) (not b!22058) (not d!3807) (not d!3863) (not d!3929) (not b!21931) (not b!21747) (not b!21752) (not d!3787) (not b!22176) (not d!3927) (not d!3775) (not b!22034) (not d!3773) (not b!21838) (not d!3789) (not d!3871) (not bm!1539) (not bm!1471) (not b!22093) (not d!3859) (not b!21732) (not d!3887) (not b!21961) (not d!3831) (not b!21882) (not d!3799) (not b!21913) (not b!21946) (not b!22046) (not b!21892) (not b!21886) (not b!22188) (not bm!1531) (not b!21947) (not b!21743) (not b_lambda!1529) (not b!22043) (not b!22202) (not d!3845) (not d!3879) (not bm!1532) (not b!21908) (not b!21890) (not bm!1521) (not mapNonEmpty!986) (not bm!1553) (not b!21948) (not b!22060) (not d!3913) (not d!3819) (not b_lambda!1547) (not b!22161) (not b!21883) (not b!21964) (not d!3761) (not d!3841) (not b!21969) (not b!21866) (not b!22063) (not b!21871) (not bm!1526) (not d!3881) (not b!21922) (not b!22048) (not d!3857) (not b!22182) (not d!3905) (not d!3811) (not b!21847) (not b!22194) (not b!22203) (not bm!1506) (not d!3861) (not bm!1510) (not d!3933) (not d!3875) (not b!22108) (not b!22072) (not b!22201) (not b!21910) (not b!21850) (not b!21762) (not b!21977) (not b!22196) (not bm!1475) (not d!3931) (not b!21899) (not bm!1527) (not d!3809) (not b!21999) (not b!22114) (not b!22052) (not d!3781) (not b!21759) (not d!3833) (not b!22090) (not b!21857) (not b!22092) (not bm!1522) (not bm!1538) (not bm!1519) (not b!22102) (not bm!1528) (not b_lambda!1533) (not bm!1495) (not b!22113) (not d!3893) (not b_lambda!1545) (not b!21832) (not b!21992) (not b_lambda!1551) (not b!22122) (not b!22083) (not b!22185) (not bm!1483) (not b!22207) (not b!22105) (not d!3839) (not b!22175) (not b!22036) (not d!3847) (not bm!1549) (not d!3843) (not b!21889) (not d!3785) (not b!22142) b_and!1449 (not bm!1542) (not b!21834) (not b!21971) (not b!21891) (not b!21994) (not b!21864) (not b!21967) (not b!21925) (not b!21848) (not bm!1514) (not bm!1552) (not b!21836) (not b!21995) (not b!22132) (not bm!1534) (not b_lambda!1537) (not d!3855) (not bm!1541) (not b!22184) (not bm!1513) (not b!22039) (not d!3827) (not b!22082) (not b!22064) (not b!21839) (not b!22126) (not b!22111) (not b!22085) (not d!3897) (not bm!1517) (not bm!1556) (not b!21915) (not d!3791) (not bm!1518) (not b!22173) (not b!22059) (not b!21874) (not b!21868) (not b!22101) (not bm!1500) (not b!21943) (not b!21932) (not d!3793) (not b!21998) (not d!3869) (not b!21893) (not b!22168) (not d!3769) (not b!21978) (not b!21988) (not d!3873) (not d!3805) (not b!22001) (not d!3899) (not b!21888) (not b!21730) (not b!22155) (not b!22151) (not d!3797) (not b!21975) (not d!3795) (not b!21829) (not b!22071) (not b!22081) (not b!21980) (not b_lambda!1531) (not bm!1507) (not d!3895) (not b!22199) (not d!3901) (not bm!1499) (not d!3865) (not b!22209) (not d!3867) (not b_next!735) (not b!21990) (not b!21846) (not b!21744) (not b!22008) (not d!3883) (not d!3911) (not b!21851) (not bm!1474) (not d!3803) (not bm!1493) (not b!22087) (not bm!1502) (not b!21902) (not b!22062) (not d!3835) (not d!3937) (not d!3923) (not bm!1535) (not bm!1478) (not b!22135) (not b!22049) (not b!22120) (not b!21750) (not b!22040) (not bm!1509) (not d!3849) (not bm!1496) (not b!22149) (not b!22137) (not b!22042) (not d!3851) (not b!22003) (not b!21718) (not bm!1484) (not b!21849) (not b_lambda!1553) (not bm!1545) (not b!21854) (not b!21968) (not b!21880) (not d!3917) (not b!22152) (not bm!1477))
(check-sat b_and!1449 (not b_next!735))
