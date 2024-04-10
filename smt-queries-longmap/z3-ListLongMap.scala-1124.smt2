; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23058 () Bool)

(assert start!23058)

(declare-fun b!241696 () Bool)

(declare-fun b_free!6495 () Bool)

(declare-fun b_next!6495 () Bool)

(assert (=> b!241696 (= b_free!6495 (not b_next!6495))))

(declare-fun tp!22692 () Bool)

(declare-fun b_and!13467 () Bool)

(assert (=> b!241696 (= tp!22692 b_and!13467)))

(declare-fun b!241692 () Bool)

(declare-fun res!118457 () Bool)

(declare-datatypes ((V!8123 0))(
  ( (V!8124 (val!3223 Int)) )
))
(declare-datatypes ((ValueCell!2835 0))(
  ( (ValueCellFull!2835 (v!5262 V!8123)) (EmptyCell!2835) )
))
(declare-datatypes ((array!11995 0))(
  ( (array!11996 (arr!5698 (Array (_ BitVec 32) ValueCell!2835)) (size!6040 (_ BitVec 32))) )
))
(declare-datatypes ((array!11997 0))(
  ( (array!11998 (arr!5699 (Array (_ BitVec 32) (_ BitVec 64))) (size!6041 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3570 0))(
  ( (LongMapFixedSize!3571 (defaultEntry!4478 Int) (mask!10551 (_ BitVec 32)) (extraKeys!4215 (_ BitVec 32)) (zeroValue!4319 V!8123) (minValue!4319 V!8123) (_size!1834 (_ BitVec 32)) (_keys!6584 array!11997) (_values!4461 array!11995) (_vacant!1834 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3570)

(declare-datatypes ((SeekEntryResult!1059 0))(
  ( (MissingZero!1059 (index!6406 (_ BitVec 32))) (Found!1059 (index!6407 (_ BitVec 32))) (Intermediate!1059 (undefined!1871 Bool) (index!6408 (_ BitVec 32)) (x!24229 (_ BitVec 32))) (Undefined!1059) (MissingVacant!1059 (index!6409 (_ BitVec 32))) )
))
(declare-fun lt!121438 () SeekEntryResult!1059)

(assert (=> b!241692 (= res!118457 (= (select (arr!5699 (_keys!6584 thiss!1504)) (index!6409 lt!121438)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156858 () Bool)

(assert (=> b!241692 (=> (not res!118457) (not e!156858))))

(declare-fun b!241693 () Bool)

(declare-datatypes ((Unit!7444 0))(
  ( (Unit!7445) )
))
(declare-fun e!156866 () Unit!7444)

(declare-fun Unit!7446 () Unit!7444)

(assert (=> b!241693 (= e!156866 Unit!7446)))

(declare-fun b!241695 () Bool)

(declare-fun e!156863 () Bool)

(declare-fun tp_is_empty!6357 () Bool)

(assert (=> b!241695 (= e!156863 tp_is_empty!6357)))

(declare-fun mapNonEmpty!10771 () Bool)

(declare-fun mapRes!10771 () Bool)

(declare-fun tp!22693 () Bool)

(declare-fun e!156859 () Bool)

(assert (=> mapNonEmpty!10771 (= mapRes!10771 (and tp!22693 e!156859))))

(declare-fun mapKey!10771 () (_ BitVec 32))

(declare-fun mapValue!10771 () ValueCell!2835)

(declare-fun mapRest!10771 () (Array (_ BitVec 32) ValueCell!2835))

(assert (=> mapNonEmpty!10771 (= (arr!5698 (_values!4461 thiss!1504)) (store mapRest!10771 mapKey!10771 mapValue!10771))))

(declare-fun e!156869 () Bool)

(declare-fun e!156862 () Bool)

(declare-fun array_inv!3773 (array!11997) Bool)

(declare-fun array_inv!3774 (array!11995) Bool)

(assert (=> b!241696 (= e!156862 (and tp!22692 tp_is_empty!6357 (array_inv!3773 (_keys!6584 thiss!1504)) (array_inv!3774 (_values!4461 thiss!1504)) e!156869))))

(declare-fun b!241697 () Bool)

(declare-fun e!156870 () Bool)

(declare-fun e!156861 () Bool)

(assert (=> b!241697 (= e!156870 e!156861)))

(declare-fun res!118464 () Bool)

(assert (=> b!241697 (=> (not res!118464) (not e!156861))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!241697 (= res!118464 (inRange!0 index!297 (mask!10551 thiss!1504)))))

(declare-fun lt!121437 () Unit!7444)

(declare-fun e!156867 () Unit!7444)

(assert (=> b!241697 (= lt!121437 e!156867)))

(declare-fun c!40299 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4746 0))(
  ( (tuple2!4747 (_1!2384 (_ BitVec 64)) (_2!2384 V!8123)) )
))
(declare-datatypes ((List!3625 0))(
  ( (Nil!3622) (Cons!3621 (h!4278 tuple2!4746) (t!8622 List!3625)) )
))
(declare-datatypes ((ListLongMap!3659 0))(
  ( (ListLongMap!3660 (toList!1845 List!3625)) )
))
(declare-fun contains!1735 (ListLongMap!3659 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1373 (array!11997 array!11995 (_ BitVec 32) (_ BitVec 32) V!8123 V!8123 (_ BitVec 32) Int) ListLongMap!3659)

(assert (=> b!241697 (= c!40299 (contains!1735 (getCurrentListMap!1373 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10771 () Bool)

(assert (=> mapIsEmpty!10771 mapRes!10771))

(declare-fun b!241698 () Bool)

(assert (=> b!241698 (= e!156861 (and (bvslt (size!6041 (_keys!6584 thiss!1504)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!6041 (_keys!6584 thiss!1504)))))))

(declare-fun lt!121439 () Unit!7444)

(assert (=> b!241698 (= lt!121439 e!156866)))

(declare-fun c!40302 () Bool)

(declare-fun arrayContainsKey!0 (array!11997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!241698 (= c!40302 (arrayContainsKey!0 (_keys!6584 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241699 () Bool)

(declare-fun e!156865 () Bool)

(get-info :version)

(assert (=> b!241699 (= e!156865 ((_ is Undefined!1059) lt!121438))))

(declare-fun b!241700 () Bool)

(assert (=> b!241700 (= e!156869 (and e!156863 mapRes!10771))))

(declare-fun condMapEmpty!10771 () Bool)

(declare-fun mapDefault!10771 () ValueCell!2835)

(assert (=> b!241700 (= condMapEmpty!10771 (= (arr!5698 (_values!4461 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2835)) mapDefault!10771)))))

(declare-fun b!241701 () Bool)

(declare-fun call!22490 () Bool)

(assert (=> b!241701 (= e!156858 (not call!22490))))

(declare-fun b!241702 () Bool)

(assert (=> b!241702 (= e!156859 tp_is_empty!6357)))

(declare-fun b!241703 () Bool)

(declare-fun Unit!7447 () Unit!7444)

(assert (=> b!241703 (= e!156866 Unit!7447)))

(declare-fun lt!121440 () Unit!7444)

(declare-fun lemmaArrayContainsKeyThenInListMap!154 (array!11997 array!11995 (_ BitVec 32) (_ BitVec 32) V!8123 V!8123 (_ BitVec 64) (_ BitVec 32) Int) Unit!7444)

(assert (=> b!241703 (= lt!121440 (lemmaArrayContainsKeyThenInListMap!154 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504)))))

(assert (=> b!241703 false))

(declare-fun res!118462 () Bool)

(declare-fun e!156868 () Bool)

(assert (=> start!23058 (=> (not res!118462) (not e!156868))))

(declare-fun valid!1402 (LongMapFixedSize!3570) Bool)

(assert (=> start!23058 (= res!118462 (valid!1402 thiss!1504))))

(assert (=> start!23058 e!156868))

(assert (=> start!23058 e!156862))

(assert (=> start!23058 true))

(declare-fun b!241694 () Bool)

(declare-fun res!118461 () Bool)

(declare-fun e!156864 () Bool)

(assert (=> b!241694 (=> (not res!118461) (not e!156864))))

(assert (=> b!241694 (= res!118461 (= (select (arr!5699 (_keys!6584 thiss!1504)) (index!6406 lt!121438)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!22491 () Bool)

(declare-fun bm!22487 () Bool)

(declare-fun c!40301 () Bool)

(assert (=> bm!22487 (= call!22491 (inRange!0 (ite c!40301 (index!6406 lt!121438) (index!6409 lt!121438)) (mask!10551 thiss!1504)))))

(declare-fun b!241704 () Bool)

(declare-fun c!40300 () Bool)

(assert (=> b!241704 (= c!40300 ((_ is MissingVacant!1059) lt!121438))))

(declare-fun e!156871 () Bool)

(assert (=> b!241704 (= e!156871 e!156865)))

(declare-fun b!241705 () Bool)

(assert (=> b!241705 (= e!156868 e!156870)))

(declare-fun res!118463 () Bool)

(assert (=> b!241705 (=> (not res!118463) (not e!156870))))

(assert (=> b!241705 (= res!118463 (or (= lt!121438 (MissingZero!1059 index!297)) (= lt!121438 (MissingVacant!1059 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11997 (_ BitVec 32)) SeekEntryResult!1059)

(assert (=> b!241705 (= lt!121438 (seekEntryOrOpen!0 key!932 (_keys!6584 thiss!1504) (mask!10551 thiss!1504)))))

(declare-fun b!241706 () Bool)

(declare-fun Unit!7448 () Unit!7444)

(assert (=> b!241706 (= e!156867 Unit!7448)))

(declare-fun lt!121442 () Unit!7444)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!350 (array!11997 array!11995 (_ BitVec 32) (_ BitVec 32) V!8123 V!8123 (_ BitVec 64) Int) Unit!7444)

(assert (=> b!241706 (= lt!121442 (lemmaInListMapThenSeekEntryOrOpenFindsIt!350 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) key!932 (defaultEntry!4478 thiss!1504)))))

(assert (=> b!241706 false))

(declare-fun b!241707 () Bool)

(declare-fun res!118458 () Bool)

(assert (=> b!241707 (=> (not res!118458) (not e!156868))))

(assert (=> b!241707 (= res!118458 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!241708 () Bool)

(assert (=> b!241708 (= e!156864 (not call!22490))))

(declare-fun b!241709 () Bool)

(declare-fun res!118460 () Bool)

(assert (=> b!241709 (=> (not res!118460) (not e!156864))))

(assert (=> b!241709 (= res!118460 call!22491)))

(assert (=> b!241709 (= e!156871 e!156864)))

(declare-fun bm!22488 () Bool)

(assert (=> bm!22488 (= call!22490 (arrayContainsKey!0 (_keys!6584 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241710 () Bool)

(assert (=> b!241710 (= e!156865 e!156858)))

(declare-fun res!118459 () Bool)

(assert (=> b!241710 (= res!118459 call!22491)))

(assert (=> b!241710 (=> (not res!118459) (not e!156858))))

(declare-fun b!241711 () Bool)

(declare-fun lt!121441 () Unit!7444)

(assert (=> b!241711 (= e!156867 lt!121441)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!359 (array!11997 array!11995 (_ BitVec 32) (_ BitVec 32) V!8123 V!8123 (_ BitVec 64) Int) Unit!7444)

(assert (=> b!241711 (= lt!121441 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!359 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) key!932 (defaultEntry!4478 thiss!1504)))))

(assert (=> b!241711 (= c!40301 ((_ is MissingZero!1059) lt!121438))))

(assert (=> b!241711 e!156871))

(assert (= (and start!23058 res!118462) b!241707))

(assert (= (and b!241707 res!118458) b!241705))

(assert (= (and b!241705 res!118463) b!241697))

(assert (= (and b!241697 c!40299) b!241706))

(assert (= (and b!241697 (not c!40299)) b!241711))

(assert (= (and b!241711 c!40301) b!241709))

(assert (= (and b!241711 (not c!40301)) b!241704))

(assert (= (and b!241709 res!118460) b!241694))

(assert (= (and b!241694 res!118461) b!241708))

(assert (= (and b!241704 c!40300) b!241710))

(assert (= (and b!241704 (not c!40300)) b!241699))

(assert (= (and b!241710 res!118459) b!241692))

(assert (= (and b!241692 res!118457) b!241701))

(assert (= (or b!241709 b!241710) bm!22487))

(assert (= (or b!241708 b!241701) bm!22488))

(assert (= (and b!241697 res!118464) b!241698))

(assert (= (and b!241698 c!40302) b!241703))

(assert (= (and b!241698 (not c!40302)) b!241693))

(assert (= (and b!241700 condMapEmpty!10771) mapIsEmpty!10771))

(assert (= (and b!241700 (not condMapEmpty!10771)) mapNonEmpty!10771))

(assert (= (and mapNonEmpty!10771 ((_ is ValueCellFull!2835) mapValue!10771)) b!241702))

(assert (= (and b!241700 ((_ is ValueCellFull!2835) mapDefault!10771)) b!241695))

(assert (= b!241696 b!241700))

(assert (= start!23058 b!241696))

(declare-fun m!260807 () Bool)

(assert (=> bm!22487 m!260807))

(declare-fun m!260809 () Bool)

(assert (=> b!241696 m!260809))

(declare-fun m!260811 () Bool)

(assert (=> b!241696 m!260811))

(declare-fun m!260813 () Bool)

(assert (=> b!241703 m!260813))

(declare-fun m!260815 () Bool)

(assert (=> b!241694 m!260815))

(declare-fun m!260817 () Bool)

(assert (=> b!241692 m!260817))

(declare-fun m!260819 () Bool)

(assert (=> b!241698 m!260819))

(declare-fun m!260821 () Bool)

(assert (=> mapNonEmpty!10771 m!260821))

(assert (=> bm!22488 m!260819))

(declare-fun m!260823 () Bool)

(assert (=> b!241706 m!260823))

(declare-fun m!260825 () Bool)

(assert (=> b!241697 m!260825))

(declare-fun m!260827 () Bool)

(assert (=> b!241697 m!260827))

(assert (=> b!241697 m!260827))

(declare-fun m!260829 () Bool)

(assert (=> b!241697 m!260829))

(declare-fun m!260831 () Bool)

(assert (=> b!241705 m!260831))

(declare-fun m!260833 () Bool)

(assert (=> b!241711 m!260833))

(declare-fun m!260835 () Bool)

(assert (=> start!23058 m!260835))

(check-sat (not b!241705) (not bm!22488) (not b!241696) tp_is_empty!6357 (not b!241703) (not b_next!6495) (not b!241706) b_and!13467 (not b!241711) (not b!241698) (not b!241697) (not start!23058) (not bm!22487) (not mapNonEmpty!10771))
(check-sat b_and!13467 (not b_next!6495))
(get-model)

(declare-fun d!59913 () Bool)

(assert (=> d!59913 (= (inRange!0 index!297 (mask!10551 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10551 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!241697 d!59913))

(declare-fun d!59915 () Bool)

(declare-fun e!156919 () Bool)

(assert (=> d!59915 e!156919))

(declare-fun res!118491 () Bool)

(assert (=> d!59915 (=> res!118491 e!156919)))

(declare-fun lt!121470 () Bool)

(assert (=> d!59915 (= res!118491 (not lt!121470))))

(declare-fun lt!121471 () Bool)

(assert (=> d!59915 (= lt!121470 lt!121471)))

(declare-fun lt!121472 () Unit!7444)

(declare-fun e!156918 () Unit!7444)

(assert (=> d!59915 (= lt!121472 e!156918)))

(declare-fun c!40317 () Bool)

(assert (=> d!59915 (= c!40317 lt!121471)))

(declare-fun containsKey!272 (List!3625 (_ BitVec 64)) Bool)

(assert (=> d!59915 (= lt!121471 (containsKey!272 (toList!1845 (getCurrentListMap!1373 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504))) key!932))))

(assert (=> d!59915 (= (contains!1735 (getCurrentListMap!1373 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504)) key!932) lt!121470)))

(declare-fun b!241778 () Bool)

(declare-fun lt!121469 () Unit!7444)

(assert (=> b!241778 (= e!156918 lt!121469)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!220 (List!3625 (_ BitVec 64)) Unit!7444)

(assert (=> b!241778 (= lt!121469 (lemmaContainsKeyImpliesGetValueByKeyDefined!220 (toList!1845 (getCurrentListMap!1373 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504))) key!932))))

(declare-datatypes ((Option!286 0))(
  ( (Some!285 (v!5264 V!8123)) (None!284) )
))
(declare-fun isDefined!221 (Option!286) Bool)

(declare-fun getValueByKey!280 (List!3625 (_ BitVec 64)) Option!286)

(assert (=> b!241778 (isDefined!221 (getValueByKey!280 (toList!1845 (getCurrentListMap!1373 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504))) key!932))))

(declare-fun b!241779 () Bool)

(declare-fun Unit!7454 () Unit!7444)

(assert (=> b!241779 (= e!156918 Unit!7454)))

(declare-fun b!241780 () Bool)

(assert (=> b!241780 (= e!156919 (isDefined!221 (getValueByKey!280 (toList!1845 (getCurrentListMap!1373 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504))) key!932)))))

(assert (= (and d!59915 c!40317) b!241778))

(assert (= (and d!59915 (not c!40317)) b!241779))

(assert (= (and d!59915 (not res!118491)) b!241780))

(declare-fun m!260867 () Bool)

(assert (=> d!59915 m!260867))

(declare-fun m!260869 () Bool)

(assert (=> b!241778 m!260869))

(declare-fun m!260871 () Bool)

(assert (=> b!241778 m!260871))

(assert (=> b!241778 m!260871))

(declare-fun m!260873 () Bool)

(assert (=> b!241778 m!260873))

(assert (=> b!241780 m!260871))

(assert (=> b!241780 m!260871))

(assert (=> b!241780 m!260873))

(assert (=> b!241697 d!59915))

(declare-fun bm!22509 () Bool)

(declare-fun call!22513 () Bool)

(declare-fun lt!121529 () ListLongMap!3659)

(assert (=> bm!22509 (= call!22513 (contains!1735 lt!121529 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241823 () Bool)

(declare-fun e!156948 () Bool)

(declare-fun e!156949 () Bool)

(assert (=> b!241823 (= e!156948 e!156949)))

(declare-fun res!118516 () Bool)

(declare-fun call!22518 () Bool)

(assert (=> b!241823 (= res!118516 call!22518)))

(assert (=> b!241823 (=> (not res!118516) (not e!156949))))

(declare-fun b!241824 () Bool)

(assert (=> b!241824 (= e!156948 (not call!22518))))

(declare-fun b!241825 () Bool)

(declare-fun e!156958 () Unit!7444)

(declare-fun lt!121522 () Unit!7444)

(assert (=> b!241825 (= e!156958 lt!121522)))

(declare-fun lt!121526 () ListLongMap!3659)

(declare-fun getCurrentListMapNoExtraKeys!544 (array!11997 array!11995 (_ BitVec 32) (_ BitVec 32) V!8123 V!8123 (_ BitVec 32) Int) ListLongMap!3659)

(assert (=> b!241825 (= lt!121526 (getCurrentListMapNoExtraKeys!544 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504)))))

(declare-fun lt!121523 () (_ BitVec 64))

(assert (=> b!241825 (= lt!121523 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121528 () (_ BitVec 64))

(assert (=> b!241825 (= lt!121528 (select (arr!5699 (_keys!6584 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121534 () Unit!7444)

(declare-fun addStillContains!198 (ListLongMap!3659 (_ BitVec 64) V!8123 (_ BitVec 64)) Unit!7444)

(assert (=> b!241825 (= lt!121534 (addStillContains!198 lt!121526 lt!121523 (zeroValue!4319 thiss!1504) lt!121528))))

(declare-fun +!649 (ListLongMap!3659 tuple2!4746) ListLongMap!3659)

(assert (=> b!241825 (contains!1735 (+!649 lt!121526 (tuple2!4747 lt!121523 (zeroValue!4319 thiss!1504))) lt!121528)))

(declare-fun lt!121538 () Unit!7444)

(assert (=> b!241825 (= lt!121538 lt!121534)))

(declare-fun lt!121532 () ListLongMap!3659)

(assert (=> b!241825 (= lt!121532 (getCurrentListMapNoExtraKeys!544 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504)))))

(declare-fun lt!121530 () (_ BitVec 64))

(assert (=> b!241825 (= lt!121530 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121521 () (_ BitVec 64))

(assert (=> b!241825 (= lt!121521 (select (arr!5699 (_keys!6584 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121533 () Unit!7444)

(declare-fun addApplyDifferent!198 (ListLongMap!3659 (_ BitVec 64) V!8123 (_ BitVec 64)) Unit!7444)

(assert (=> b!241825 (= lt!121533 (addApplyDifferent!198 lt!121532 lt!121530 (minValue!4319 thiss!1504) lt!121521))))

(declare-fun apply!222 (ListLongMap!3659 (_ BitVec 64)) V!8123)

(assert (=> b!241825 (= (apply!222 (+!649 lt!121532 (tuple2!4747 lt!121530 (minValue!4319 thiss!1504))) lt!121521) (apply!222 lt!121532 lt!121521))))

(declare-fun lt!121518 () Unit!7444)

(assert (=> b!241825 (= lt!121518 lt!121533)))

(declare-fun lt!121524 () ListLongMap!3659)

(assert (=> b!241825 (= lt!121524 (getCurrentListMapNoExtraKeys!544 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504)))))

(declare-fun lt!121517 () (_ BitVec 64))

(assert (=> b!241825 (= lt!121517 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121535 () (_ BitVec 64))

(assert (=> b!241825 (= lt!121535 (select (arr!5699 (_keys!6584 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121531 () Unit!7444)

(assert (=> b!241825 (= lt!121531 (addApplyDifferent!198 lt!121524 lt!121517 (zeroValue!4319 thiss!1504) lt!121535))))

(assert (=> b!241825 (= (apply!222 (+!649 lt!121524 (tuple2!4747 lt!121517 (zeroValue!4319 thiss!1504))) lt!121535) (apply!222 lt!121524 lt!121535))))

(declare-fun lt!121519 () Unit!7444)

(assert (=> b!241825 (= lt!121519 lt!121531)))

(declare-fun lt!121527 () ListLongMap!3659)

(assert (=> b!241825 (= lt!121527 (getCurrentListMapNoExtraKeys!544 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504)))))

(declare-fun lt!121537 () (_ BitVec 64))

(assert (=> b!241825 (= lt!121537 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121536 () (_ BitVec 64))

(assert (=> b!241825 (= lt!121536 (select (arr!5699 (_keys!6584 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!241825 (= lt!121522 (addApplyDifferent!198 lt!121527 lt!121537 (minValue!4319 thiss!1504) lt!121536))))

(assert (=> b!241825 (= (apply!222 (+!649 lt!121527 (tuple2!4747 lt!121537 (minValue!4319 thiss!1504))) lt!121536) (apply!222 lt!121527 lt!121536))))

(declare-fun b!241826 () Bool)

(declare-fun e!156953 () ListLongMap!3659)

(declare-fun call!22512 () ListLongMap!3659)

(assert (=> b!241826 (= e!156953 call!22512)))

(declare-fun bm!22511 () Bool)

(declare-fun call!22516 () ListLongMap!3659)

(declare-fun call!22514 () ListLongMap!3659)

(assert (=> bm!22511 (= call!22516 call!22514)))

(declare-fun bm!22512 () Bool)

(assert (=> bm!22512 (= call!22514 (getCurrentListMapNoExtraKeys!544 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504)))))

(declare-fun b!241827 () Bool)

(declare-fun e!156957 () Bool)

(declare-fun e!156951 () Bool)

(assert (=> b!241827 (= e!156957 e!156951)))

(declare-fun res!118518 () Bool)

(assert (=> b!241827 (= res!118518 call!22513)))

(assert (=> b!241827 (=> (not res!118518) (not e!156951))))

(declare-fun b!241828 () Bool)

(declare-fun res!118512 () Bool)

(declare-fun e!156950 () Bool)

(assert (=> b!241828 (=> (not res!118512) (not e!156950))))

(declare-fun e!156946 () Bool)

(assert (=> b!241828 (= res!118512 e!156946)))

(declare-fun res!118515 () Bool)

(assert (=> b!241828 (=> res!118515 e!156946)))

(declare-fun e!156952 () Bool)

(assert (=> b!241828 (= res!118515 (not e!156952))))

(declare-fun res!118513 () Bool)

(assert (=> b!241828 (=> (not res!118513) (not e!156952))))

(assert (=> b!241828 (= res!118513 (bvslt #b00000000000000000000000000000000 (size!6041 (_keys!6584 thiss!1504))))))

(declare-fun b!241829 () Bool)

(assert (=> b!241829 (= e!156951 (= (apply!222 lt!121529 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4319 thiss!1504)))))

(declare-fun bm!22510 () Bool)

(assert (=> bm!22510 (= call!22518 (contains!1735 lt!121529 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!59917 () Bool)

(assert (=> d!59917 e!156950))

(declare-fun res!118517 () Bool)

(assert (=> d!59917 (=> (not res!118517) (not e!156950))))

(assert (=> d!59917 (= res!118517 (or (bvsge #b00000000000000000000000000000000 (size!6041 (_keys!6584 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6041 (_keys!6584 thiss!1504))))))))

(declare-fun lt!121520 () ListLongMap!3659)

(assert (=> d!59917 (= lt!121529 lt!121520)))

(declare-fun lt!121525 () Unit!7444)

(assert (=> d!59917 (= lt!121525 e!156958)))

(declare-fun c!40332 () Bool)

(declare-fun e!156956 () Bool)

(assert (=> d!59917 (= c!40332 e!156956)))

(declare-fun res!118514 () Bool)

(assert (=> d!59917 (=> (not res!118514) (not e!156956))))

(assert (=> d!59917 (= res!118514 (bvslt #b00000000000000000000000000000000 (size!6041 (_keys!6584 thiss!1504))))))

(declare-fun e!156947 () ListLongMap!3659)

(assert (=> d!59917 (= lt!121520 e!156947)))

(declare-fun c!40333 () Bool)

(assert (=> d!59917 (= c!40333 (and (not (= (bvand (extraKeys!4215 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4215 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59917 (validMask!0 (mask!10551 thiss!1504))))

(assert (=> d!59917 (= (getCurrentListMap!1373 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504)) lt!121529)))

(declare-fun b!241830 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!241830 (= e!156952 (validKeyInArray!0 (select (arr!5699 (_keys!6584 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241831 () Bool)

(assert (=> b!241831 (= e!156949 (= (apply!222 lt!121529 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4319 thiss!1504)))))

(declare-fun b!241832 () Bool)

(declare-fun e!156955 () Bool)

(declare-fun get!2926 (ValueCell!2835 V!8123) V!8123)

(declare-fun dynLambda!565 (Int (_ BitVec 64)) V!8123)

(assert (=> b!241832 (= e!156955 (= (apply!222 lt!121529 (select (arr!5699 (_keys!6584 thiss!1504)) #b00000000000000000000000000000000)) (get!2926 (select (arr!5698 (_values!4461 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!565 (defaultEntry!4478 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!241832 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6040 (_values!4461 thiss!1504))))))

(assert (=> b!241832 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6041 (_keys!6584 thiss!1504))))))

(declare-fun bm!22513 () Bool)

(declare-fun call!22517 () ListLongMap!3659)

(declare-fun call!22515 () ListLongMap!3659)

(assert (=> bm!22513 (= call!22517 call!22515)))

(declare-fun b!241833 () Bool)

(declare-fun e!156954 () ListLongMap!3659)

(assert (=> b!241833 (= e!156954 call!22517)))

(declare-fun bm!22514 () Bool)

(declare-fun c!40334 () Bool)

(assert (=> bm!22514 (= call!22515 (+!649 (ite c!40333 call!22514 (ite c!40334 call!22516 call!22512)) (ite (or c!40333 c!40334) (tuple2!4747 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4319 thiss!1504)) (tuple2!4747 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4319 thiss!1504)))))))

(declare-fun b!241834 () Bool)

(assert (=> b!241834 (= e!156950 e!156957)))

(declare-fun c!40330 () Bool)

(assert (=> b!241834 (= c!40330 (not (= (bvand (extraKeys!4215 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!241835 () Bool)

(declare-fun c!40335 () Bool)

(assert (=> b!241835 (= c!40335 (and (not (= (bvand (extraKeys!4215 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4215 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!241835 (= e!156954 e!156953)))

(declare-fun b!241836 () Bool)

(assert (=> b!241836 (= e!156947 (+!649 call!22515 (tuple2!4747 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4319 thiss!1504))))))

(declare-fun b!241837 () Bool)

(declare-fun Unit!7455 () Unit!7444)

(assert (=> b!241837 (= e!156958 Unit!7455)))

(declare-fun b!241838 () Bool)

(assert (=> b!241838 (= e!156953 call!22517)))

(declare-fun b!241839 () Bool)

(assert (=> b!241839 (= e!156947 e!156954)))

(assert (=> b!241839 (= c!40334 (and (not (= (bvand (extraKeys!4215 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4215 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22515 () Bool)

(assert (=> bm!22515 (= call!22512 call!22516)))

(declare-fun b!241840 () Bool)

(assert (=> b!241840 (= e!156956 (validKeyInArray!0 (select (arr!5699 (_keys!6584 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241841 () Bool)

(declare-fun res!118510 () Bool)

(assert (=> b!241841 (=> (not res!118510) (not e!156950))))

(assert (=> b!241841 (= res!118510 e!156948)))

(declare-fun c!40331 () Bool)

(assert (=> b!241841 (= c!40331 (not (= (bvand (extraKeys!4215 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!241842 () Bool)

(assert (=> b!241842 (= e!156957 (not call!22513))))

(declare-fun b!241843 () Bool)

(assert (=> b!241843 (= e!156946 e!156955)))

(declare-fun res!118511 () Bool)

(assert (=> b!241843 (=> (not res!118511) (not e!156955))))

(assert (=> b!241843 (= res!118511 (contains!1735 lt!121529 (select (arr!5699 (_keys!6584 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!241843 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6041 (_keys!6584 thiss!1504))))))

(assert (= (and d!59917 c!40333) b!241836))

(assert (= (and d!59917 (not c!40333)) b!241839))

(assert (= (and b!241839 c!40334) b!241833))

(assert (= (and b!241839 (not c!40334)) b!241835))

(assert (= (and b!241835 c!40335) b!241838))

(assert (= (and b!241835 (not c!40335)) b!241826))

(assert (= (or b!241838 b!241826) bm!22515))

(assert (= (or b!241833 bm!22515) bm!22511))

(assert (= (or b!241833 b!241838) bm!22513))

(assert (= (or b!241836 bm!22511) bm!22512))

(assert (= (or b!241836 bm!22513) bm!22514))

(assert (= (and d!59917 res!118514) b!241840))

(assert (= (and d!59917 c!40332) b!241825))

(assert (= (and d!59917 (not c!40332)) b!241837))

(assert (= (and d!59917 res!118517) b!241828))

(assert (= (and b!241828 res!118513) b!241830))

(assert (= (and b!241828 (not res!118515)) b!241843))

(assert (= (and b!241843 res!118511) b!241832))

(assert (= (and b!241828 res!118512) b!241841))

(assert (= (and b!241841 c!40331) b!241823))

(assert (= (and b!241841 (not c!40331)) b!241824))

(assert (= (and b!241823 res!118516) b!241831))

(assert (= (or b!241823 b!241824) bm!22510))

(assert (= (and b!241841 res!118510) b!241834))

(assert (= (and b!241834 c!40330) b!241827))

(assert (= (and b!241834 (not c!40330)) b!241842))

(assert (= (and b!241827 res!118518) b!241829))

(assert (= (or b!241827 b!241842) bm!22509))

(declare-fun b_lambda!7991 () Bool)

(assert (=> (not b_lambda!7991) (not b!241832)))

(declare-fun t!8625 () Bool)

(declare-fun tb!2957 () Bool)

(assert (=> (and b!241696 (= (defaultEntry!4478 thiss!1504) (defaultEntry!4478 thiss!1504)) t!8625) tb!2957))

(declare-fun result!5193 () Bool)

(assert (=> tb!2957 (= result!5193 tp_is_empty!6357)))

(assert (=> b!241832 t!8625))

(declare-fun b_and!13471 () Bool)

(assert (= b_and!13467 (and (=> t!8625 result!5193) b_and!13471)))

(declare-fun m!260875 () Bool)

(assert (=> bm!22510 m!260875))

(declare-fun m!260877 () Bool)

(assert (=> b!241829 m!260877))

(declare-fun m!260879 () Bool)

(assert (=> bm!22509 m!260879))

(declare-fun m!260881 () Bool)

(assert (=> b!241836 m!260881))

(declare-fun m!260883 () Bool)

(assert (=> b!241830 m!260883))

(assert (=> b!241830 m!260883))

(declare-fun m!260885 () Bool)

(assert (=> b!241830 m!260885))

(declare-fun m!260887 () Bool)

(assert (=> d!59917 m!260887))

(declare-fun m!260889 () Bool)

(assert (=> b!241831 m!260889))

(declare-fun m!260891 () Bool)

(assert (=> bm!22514 m!260891))

(declare-fun m!260893 () Bool)

(assert (=> bm!22512 m!260893))

(declare-fun m!260895 () Bool)

(assert (=> b!241825 m!260895))

(declare-fun m!260897 () Bool)

(assert (=> b!241825 m!260897))

(declare-fun m!260899 () Bool)

(assert (=> b!241825 m!260899))

(assert (=> b!241825 m!260895))

(declare-fun m!260901 () Bool)

(assert (=> b!241825 m!260901))

(declare-fun m!260903 () Bool)

(assert (=> b!241825 m!260903))

(declare-fun m!260905 () Bool)

(assert (=> b!241825 m!260905))

(declare-fun m!260907 () Bool)

(assert (=> b!241825 m!260907))

(declare-fun m!260909 () Bool)

(assert (=> b!241825 m!260909))

(declare-fun m!260911 () Bool)

(assert (=> b!241825 m!260911))

(declare-fun m!260913 () Bool)

(assert (=> b!241825 m!260913))

(declare-fun m!260915 () Bool)

(assert (=> b!241825 m!260915))

(assert (=> b!241825 m!260883))

(declare-fun m!260917 () Bool)

(assert (=> b!241825 m!260917))

(assert (=> b!241825 m!260897))

(declare-fun m!260919 () Bool)

(assert (=> b!241825 m!260919))

(assert (=> b!241825 m!260919))

(declare-fun m!260921 () Bool)

(assert (=> b!241825 m!260921))

(declare-fun m!260923 () Bool)

(assert (=> b!241825 m!260923))

(assert (=> b!241825 m!260911))

(assert (=> b!241825 m!260893))

(assert (=> b!241840 m!260883))

(assert (=> b!241840 m!260883))

(assert (=> b!241840 m!260885))

(assert (=> b!241843 m!260883))

(assert (=> b!241843 m!260883))

(declare-fun m!260925 () Bool)

(assert (=> b!241843 m!260925))

(declare-fun m!260927 () Bool)

(assert (=> b!241832 m!260927))

(assert (=> b!241832 m!260883))

(declare-fun m!260929 () Bool)

(assert (=> b!241832 m!260929))

(assert (=> b!241832 m!260883))

(declare-fun m!260931 () Bool)

(assert (=> b!241832 m!260931))

(assert (=> b!241832 m!260931))

(assert (=> b!241832 m!260927))

(declare-fun m!260933 () Bool)

(assert (=> b!241832 m!260933))

(assert (=> b!241697 d!59917))

(declare-fun d!59919 () Bool)

(declare-fun e!156961 () Bool)

(assert (=> d!59919 e!156961))

(declare-fun res!118524 () Bool)

(assert (=> d!59919 (=> (not res!118524) (not e!156961))))

(declare-fun lt!121543 () SeekEntryResult!1059)

(assert (=> d!59919 (= res!118524 ((_ is Found!1059) lt!121543))))

(assert (=> d!59919 (= lt!121543 (seekEntryOrOpen!0 key!932 (_keys!6584 thiss!1504) (mask!10551 thiss!1504)))))

(declare-fun lt!121544 () Unit!7444)

(declare-fun choose!1122 (array!11997 array!11995 (_ BitVec 32) (_ BitVec 32) V!8123 V!8123 (_ BitVec 64) Int) Unit!7444)

(assert (=> d!59919 (= lt!121544 (choose!1122 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) key!932 (defaultEntry!4478 thiss!1504)))))

(assert (=> d!59919 (validMask!0 (mask!10551 thiss!1504))))

(assert (=> d!59919 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!350 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) key!932 (defaultEntry!4478 thiss!1504)) lt!121544)))

(declare-fun b!241850 () Bool)

(declare-fun res!118523 () Bool)

(assert (=> b!241850 (=> (not res!118523) (not e!156961))))

(assert (=> b!241850 (= res!118523 (inRange!0 (index!6407 lt!121543) (mask!10551 thiss!1504)))))

(declare-fun b!241851 () Bool)

(assert (=> b!241851 (= e!156961 (= (select (arr!5699 (_keys!6584 thiss!1504)) (index!6407 lt!121543)) key!932))))

(assert (=> b!241851 (and (bvsge (index!6407 lt!121543) #b00000000000000000000000000000000) (bvslt (index!6407 lt!121543) (size!6041 (_keys!6584 thiss!1504))))))

(assert (= (and d!59919 res!118524) b!241850))

(assert (= (and b!241850 res!118523) b!241851))

(assert (=> d!59919 m!260831))

(declare-fun m!260935 () Bool)

(assert (=> d!59919 m!260935))

(assert (=> d!59919 m!260887))

(declare-fun m!260937 () Bool)

(assert (=> b!241850 m!260937))

(declare-fun m!260939 () Bool)

(assert (=> b!241851 m!260939))

(assert (=> b!241706 d!59919))

(declare-fun d!59921 () Bool)

(declare-fun lt!121552 () SeekEntryResult!1059)

(assert (=> d!59921 (and (or ((_ is Undefined!1059) lt!121552) (not ((_ is Found!1059) lt!121552)) (and (bvsge (index!6407 lt!121552) #b00000000000000000000000000000000) (bvslt (index!6407 lt!121552) (size!6041 (_keys!6584 thiss!1504))))) (or ((_ is Undefined!1059) lt!121552) ((_ is Found!1059) lt!121552) (not ((_ is MissingZero!1059) lt!121552)) (and (bvsge (index!6406 lt!121552) #b00000000000000000000000000000000) (bvslt (index!6406 lt!121552) (size!6041 (_keys!6584 thiss!1504))))) (or ((_ is Undefined!1059) lt!121552) ((_ is Found!1059) lt!121552) ((_ is MissingZero!1059) lt!121552) (not ((_ is MissingVacant!1059) lt!121552)) (and (bvsge (index!6409 lt!121552) #b00000000000000000000000000000000) (bvslt (index!6409 lt!121552) (size!6041 (_keys!6584 thiss!1504))))) (or ((_ is Undefined!1059) lt!121552) (ite ((_ is Found!1059) lt!121552) (= (select (arr!5699 (_keys!6584 thiss!1504)) (index!6407 lt!121552)) key!932) (ite ((_ is MissingZero!1059) lt!121552) (= (select (arr!5699 (_keys!6584 thiss!1504)) (index!6406 lt!121552)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1059) lt!121552) (= (select (arr!5699 (_keys!6584 thiss!1504)) (index!6409 lt!121552)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!156968 () SeekEntryResult!1059)

(assert (=> d!59921 (= lt!121552 e!156968)))

(declare-fun c!40343 () Bool)

(declare-fun lt!121551 () SeekEntryResult!1059)

(assert (=> d!59921 (= c!40343 (and ((_ is Intermediate!1059) lt!121551) (undefined!1871 lt!121551)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11997 (_ BitVec 32)) SeekEntryResult!1059)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59921 (= lt!121551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10551 thiss!1504)) key!932 (_keys!6584 thiss!1504) (mask!10551 thiss!1504)))))

(assert (=> d!59921 (validMask!0 (mask!10551 thiss!1504))))

(assert (=> d!59921 (= (seekEntryOrOpen!0 key!932 (_keys!6584 thiss!1504) (mask!10551 thiss!1504)) lt!121552)))

(declare-fun b!241864 () Bool)

(assert (=> b!241864 (= e!156968 Undefined!1059)))

(declare-fun b!241865 () Bool)

(declare-fun e!156969 () SeekEntryResult!1059)

(assert (=> b!241865 (= e!156969 (MissingZero!1059 (index!6408 lt!121551)))))

(declare-fun b!241866 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11997 (_ BitVec 32)) SeekEntryResult!1059)

(assert (=> b!241866 (= e!156969 (seekKeyOrZeroReturnVacant!0 (x!24229 lt!121551) (index!6408 lt!121551) (index!6408 lt!121551) key!932 (_keys!6584 thiss!1504) (mask!10551 thiss!1504)))))

(declare-fun b!241867 () Bool)

(declare-fun e!156970 () SeekEntryResult!1059)

(assert (=> b!241867 (= e!156968 e!156970)))

(declare-fun lt!121553 () (_ BitVec 64))

(assert (=> b!241867 (= lt!121553 (select (arr!5699 (_keys!6584 thiss!1504)) (index!6408 lt!121551)))))

(declare-fun c!40344 () Bool)

(assert (=> b!241867 (= c!40344 (= lt!121553 key!932))))

(declare-fun b!241868 () Bool)

(declare-fun c!40342 () Bool)

(assert (=> b!241868 (= c!40342 (= lt!121553 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241868 (= e!156970 e!156969)))

(declare-fun b!241869 () Bool)

(assert (=> b!241869 (= e!156970 (Found!1059 (index!6408 lt!121551)))))

(assert (= (and d!59921 c!40343) b!241864))

(assert (= (and d!59921 (not c!40343)) b!241867))

(assert (= (and b!241867 c!40344) b!241869))

(assert (= (and b!241867 (not c!40344)) b!241868))

(assert (= (and b!241868 c!40342) b!241865))

(assert (= (and b!241868 (not c!40342)) b!241866))

(declare-fun m!260941 () Bool)

(assert (=> d!59921 m!260941))

(declare-fun m!260943 () Bool)

(assert (=> d!59921 m!260943))

(assert (=> d!59921 m!260941))

(declare-fun m!260945 () Bool)

(assert (=> d!59921 m!260945))

(assert (=> d!59921 m!260887))

(declare-fun m!260947 () Bool)

(assert (=> d!59921 m!260947))

(declare-fun m!260949 () Bool)

(assert (=> d!59921 m!260949))

(declare-fun m!260951 () Bool)

(assert (=> b!241866 m!260951))

(declare-fun m!260953 () Bool)

(assert (=> b!241867 m!260953))

(assert (=> b!241705 d!59921))

(declare-fun d!59923 () Bool)

(assert (=> d!59923 (contains!1735 (getCurrentListMap!1373 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504)) key!932)))

(declare-fun lt!121556 () Unit!7444)

(declare-fun choose!1123 (array!11997 array!11995 (_ BitVec 32) (_ BitVec 32) V!8123 V!8123 (_ BitVec 64) (_ BitVec 32) Int) Unit!7444)

(assert (=> d!59923 (= lt!121556 (choose!1123 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504)))))

(assert (=> d!59923 (validMask!0 (mask!10551 thiss!1504))))

(assert (=> d!59923 (= (lemmaArrayContainsKeyThenInListMap!154 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4478 thiss!1504)) lt!121556)))

(declare-fun bs!8853 () Bool)

(assert (= bs!8853 d!59923))

(assert (=> bs!8853 m!260827))

(assert (=> bs!8853 m!260827))

(assert (=> bs!8853 m!260829))

(declare-fun m!260955 () Bool)

(assert (=> bs!8853 m!260955))

(assert (=> bs!8853 m!260887))

(assert (=> b!241703 d!59923))

(declare-fun b!241886 () Bool)

(declare-fun e!156982 () Bool)

(declare-fun e!156981 () Bool)

(assert (=> b!241886 (= e!156982 e!156981)))

(declare-fun res!118534 () Bool)

(declare-fun call!22524 () Bool)

(assert (=> b!241886 (= res!118534 call!22524)))

(assert (=> b!241886 (=> (not res!118534) (not e!156981))))

(declare-fun b!241887 () Bool)

(declare-fun e!156980 () Bool)

(assert (=> b!241887 (= e!156982 e!156980)))

(declare-fun c!40349 () Bool)

(declare-fun lt!121561 () SeekEntryResult!1059)

(assert (=> b!241887 (= c!40349 ((_ is MissingVacant!1059) lt!121561))))

(declare-fun b!241888 () Bool)

(assert (=> b!241888 (and (bvsge (index!6406 lt!121561) #b00000000000000000000000000000000) (bvslt (index!6406 lt!121561) (size!6041 (_keys!6584 thiss!1504))))))

(declare-fun res!118533 () Bool)

(assert (=> b!241888 (= res!118533 (= (select (arr!5699 (_keys!6584 thiss!1504)) (index!6406 lt!121561)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241888 (=> (not res!118533) (not e!156981))))

(declare-fun b!241889 () Bool)

(declare-fun res!118536 () Bool)

(declare-fun e!156979 () Bool)

(assert (=> b!241889 (=> (not res!118536) (not e!156979))))

(assert (=> b!241889 (= res!118536 (= (select (arr!5699 (_keys!6584 thiss!1504)) (index!6409 lt!121561)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241889 (and (bvsge (index!6409 lt!121561) #b00000000000000000000000000000000) (bvslt (index!6409 lt!121561) (size!6041 (_keys!6584 thiss!1504))))))

(declare-fun b!241890 () Bool)

(declare-fun call!22523 () Bool)

(assert (=> b!241890 (= e!156979 (not call!22523))))

(declare-fun bm!22520 () Bool)

(assert (=> bm!22520 (= call!22523 (arrayContainsKey!0 (_keys!6584 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun d!59925 () Bool)

(assert (=> d!59925 e!156982))

(declare-fun c!40350 () Bool)

(assert (=> d!59925 (= c!40350 ((_ is MissingZero!1059) lt!121561))))

(assert (=> d!59925 (= lt!121561 (seekEntryOrOpen!0 key!932 (_keys!6584 thiss!1504) (mask!10551 thiss!1504)))))

(declare-fun lt!121562 () Unit!7444)

(declare-fun choose!1124 (array!11997 array!11995 (_ BitVec 32) (_ BitVec 32) V!8123 V!8123 (_ BitVec 64) Int) Unit!7444)

(assert (=> d!59925 (= lt!121562 (choose!1124 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) key!932 (defaultEntry!4478 thiss!1504)))))

(assert (=> d!59925 (validMask!0 (mask!10551 thiss!1504))))

(assert (=> d!59925 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!359 (_keys!6584 thiss!1504) (_values!4461 thiss!1504) (mask!10551 thiss!1504) (extraKeys!4215 thiss!1504) (zeroValue!4319 thiss!1504) (minValue!4319 thiss!1504) key!932 (defaultEntry!4478 thiss!1504)) lt!121562)))

(declare-fun b!241891 () Bool)

(declare-fun res!118535 () Bool)

(assert (=> b!241891 (=> (not res!118535) (not e!156979))))

(assert (=> b!241891 (= res!118535 call!22524)))

(assert (=> b!241891 (= e!156980 e!156979)))

(declare-fun bm!22521 () Bool)

(assert (=> bm!22521 (= call!22524 (inRange!0 (ite c!40350 (index!6406 lt!121561) (index!6409 lt!121561)) (mask!10551 thiss!1504)))))

(declare-fun b!241892 () Bool)

(assert (=> b!241892 (= e!156981 (not call!22523))))

(declare-fun b!241893 () Bool)

(assert (=> b!241893 (= e!156980 ((_ is Undefined!1059) lt!121561))))

(assert (= (and d!59925 c!40350) b!241886))

(assert (= (and d!59925 (not c!40350)) b!241887))

(assert (= (and b!241886 res!118534) b!241888))

(assert (= (and b!241888 res!118533) b!241892))

(assert (= (and b!241887 c!40349) b!241891))

(assert (= (and b!241887 (not c!40349)) b!241893))

(assert (= (and b!241891 res!118535) b!241889))

(assert (= (and b!241889 res!118536) b!241890))

(assert (= (or b!241886 b!241891) bm!22521))

(assert (= (or b!241892 b!241890) bm!22520))

(assert (=> bm!22520 m!260819))

(declare-fun m!260957 () Bool)

(assert (=> b!241888 m!260957))

(assert (=> d!59925 m!260831))

(declare-fun m!260959 () Bool)

(assert (=> d!59925 m!260959))

(assert (=> d!59925 m!260887))

(declare-fun m!260961 () Bool)

(assert (=> bm!22521 m!260961))

(declare-fun m!260963 () Bool)

(assert (=> b!241889 m!260963))

(assert (=> b!241711 d!59925))

(declare-fun d!59927 () Bool)

(assert (=> d!59927 (= (inRange!0 (ite c!40301 (index!6406 lt!121438) (index!6409 lt!121438)) (mask!10551 thiss!1504)) (and (bvsge (ite c!40301 (index!6406 lt!121438) (index!6409 lt!121438)) #b00000000000000000000000000000000) (bvslt (ite c!40301 (index!6406 lt!121438) (index!6409 lt!121438)) (bvadd (mask!10551 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22487 d!59927))

(declare-fun d!59929 () Bool)

(declare-fun res!118541 () Bool)

(declare-fun e!156987 () Bool)

(assert (=> d!59929 (=> res!118541 e!156987)))

(assert (=> d!59929 (= res!118541 (= (select (arr!5699 (_keys!6584 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!59929 (= (arrayContainsKey!0 (_keys!6584 thiss!1504) key!932 #b00000000000000000000000000000000) e!156987)))

(declare-fun b!241898 () Bool)

(declare-fun e!156988 () Bool)

(assert (=> b!241898 (= e!156987 e!156988)))

(declare-fun res!118542 () Bool)

(assert (=> b!241898 (=> (not res!118542) (not e!156988))))

(assert (=> b!241898 (= res!118542 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6041 (_keys!6584 thiss!1504))))))

(declare-fun b!241899 () Bool)

(assert (=> b!241899 (= e!156988 (arrayContainsKey!0 (_keys!6584 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!59929 (not res!118541)) b!241898))

(assert (= (and b!241898 res!118542) b!241899))

(assert (=> d!59929 m!260883))

(declare-fun m!260965 () Bool)

(assert (=> b!241899 m!260965))

(assert (=> b!241698 d!59929))

(declare-fun d!59931 () Bool)

(assert (=> d!59931 (= (array_inv!3773 (_keys!6584 thiss!1504)) (bvsge (size!6041 (_keys!6584 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!241696 d!59931))

(declare-fun d!59933 () Bool)

(assert (=> d!59933 (= (array_inv!3774 (_values!4461 thiss!1504)) (bvsge (size!6040 (_values!4461 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!241696 d!59933))

(assert (=> bm!22488 d!59929))

(declare-fun d!59935 () Bool)

(declare-fun res!118549 () Bool)

(declare-fun e!156991 () Bool)

(assert (=> d!59935 (=> (not res!118549) (not e!156991))))

(declare-fun simpleValid!245 (LongMapFixedSize!3570) Bool)

(assert (=> d!59935 (= res!118549 (simpleValid!245 thiss!1504))))

(assert (=> d!59935 (= (valid!1402 thiss!1504) e!156991)))

(declare-fun b!241906 () Bool)

(declare-fun res!118550 () Bool)

(assert (=> b!241906 (=> (not res!118550) (not e!156991))))

(declare-fun arrayCountValidKeys!0 (array!11997 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!241906 (= res!118550 (= (arrayCountValidKeys!0 (_keys!6584 thiss!1504) #b00000000000000000000000000000000 (size!6041 (_keys!6584 thiss!1504))) (_size!1834 thiss!1504)))))

(declare-fun b!241907 () Bool)

(declare-fun res!118551 () Bool)

(assert (=> b!241907 (=> (not res!118551) (not e!156991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11997 (_ BitVec 32)) Bool)

(assert (=> b!241907 (= res!118551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6584 thiss!1504) (mask!10551 thiss!1504)))))

(declare-fun b!241908 () Bool)

(declare-datatypes ((List!3627 0))(
  ( (Nil!3624) (Cons!3623 (h!4280 (_ BitVec 64)) (t!8626 List!3627)) )
))
(declare-fun arrayNoDuplicates!0 (array!11997 (_ BitVec 32) List!3627) Bool)

(assert (=> b!241908 (= e!156991 (arrayNoDuplicates!0 (_keys!6584 thiss!1504) #b00000000000000000000000000000000 Nil!3624))))

(assert (= (and d!59935 res!118549) b!241906))

(assert (= (and b!241906 res!118550) b!241907))

(assert (= (and b!241907 res!118551) b!241908))

(declare-fun m!260967 () Bool)

(assert (=> d!59935 m!260967))

(declare-fun m!260969 () Bool)

(assert (=> b!241906 m!260969))

(declare-fun m!260971 () Bool)

(assert (=> b!241907 m!260971))

(declare-fun m!260973 () Bool)

(assert (=> b!241908 m!260973))

(assert (=> start!23058 d!59935))

(declare-fun b!241915 () Bool)

(declare-fun e!156997 () Bool)

(assert (=> b!241915 (= e!156997 tp_is_empty!6357)))

(declare-fun condMapEmpty!10777 () Bool)

(declare-fun mapDefault!10777 () ValueCell!2835)

(assert (=> mapNonEmpty!10771 (= condMapEmpty!10777 (= mapRest!10771 ((as const (Array (_ BitVec 32) ValueCell!2835)) mapDefault!10777)))))

(declare-fun e!156996 () Bool)

(declare-fun mapRes!10777 () Bool)

(assert (=> mapNonEmpty!10771 (= tp!22693 (and e!156996 mapRes!10777))))

(declare-fun mapIsEmpty!10777 () Bool)

(assert (=> mapIsEmpty!10777 mapRes!10777))

(declare-fun b!241916 () Bool)

(assert (=> b!241916 (= e!156996 tp_is_empty!6357)))

(declare-fun mapNonEmpty!10777 () Bool)

(declare-fun tp!22702 () Bool)

(assert (=> mapNonEmpty!10777 (= mapRes!10777 (and tp!22702 e!156997))))

(declare-fun mapRest!10777 () (Array (_ BitVec 32) ValueCell!2835))

(declare-fun mapKey!10777 () (_ BitVec 32))

(declare-fun mapValue!10777 () ValueCell!2835)

(assert (=> mapNonEmpty!10777 (= mapRest!10771 (store mapRest!10777 mapKey!10777 mapValue!10777))))

(assert (= (and mapNonEmpty!10771 condMapEmpty!10777) mapIsEmpty!10777))

(assert (= (and mapNonEmpty!10771 (not condMapEmpty!10777)) mapNonEmpty!10777))

(assert (= (and mapNonEmpty!10777 ((_ is ValueCellFull!2835) mapValue!10777)) b!241915))

(assert (= (and mapNonEmpty!10771 ((_ is ValueCellFull!2835) mapDefault!10777)) b!241916))

(declare-fun m!260975 () Bool)

(assert (=> mapNonEmpty!10777 m!260975))

(declare-fun b_lambda!7993 () Bool)

(assert (= b_lambda!7991 (or (and b!241696 b_free!6495) b_lambda!7993)))

(check-sat (not d!59925) (not b!241850) (not b!241831) tp_is_empty!6357 (not b!241780) (not b!241830) (not bm!22509) (not mapNonEmpty!10777) (not b!241866) (not b_next!6495) (not bm!22520) (not b!241899) (not d!59915) (not b!241825) (not b!241832) (not b!241836) (not d!59917) (not b!241840) (not d!59935) (not b!241908) (not d!59919) b_and!13471 (not bm!22510) (not bm!22514) (not d!59921) (not b_lambda!7993) (not bm!22512) (not b!241829) (not d!59923) (not b!241906) (not bm!22521) (not b!241907) (not b!241843) (not b!241778))
(check-sat b_and!13471 (not b_next!6495))
