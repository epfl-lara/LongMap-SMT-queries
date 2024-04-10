; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22944 () Bool)

(assert start!22944)

(declare-fun b!239802 () Bool)

(declare-fun b_free!6447 () Bool)

(declare-fun b_next!6447 () Bool)

(assert (=> b!239802 (= b_free!6447 (not b_next!6447))))

(declare-fun tp!22544 () Bool)

(declare-fun b_and!13413 () Bool)

(assert (=> b!239802 (= tp!22544 b_and!13413)))

(declare-fun b!239785 () Bool)

(declare-datatypes ((Unit!7368 0))(
  ( (Unit!7369) )
))
(declare-fun e!155690 () Unit!7368)

(declare-fun Unit!7370 () Unit!7368)

(assert (=> b!239785 (= e!155690 Unit!7370)))

(declare-fun lt!120858 () Unit!7368)

(declare-datatypes ((V!8059 0))(
  ( (V!8060 (val!3199 Int)) )
))
(declare-datatypes ((ValueCell!2811 0))(
  ( (ValueCellFull!2811 (v!5237 V!8059)) (EmptyCell!2811) )
))
(declare-datatypes ((array!11897 0))(
  ( (array!11898 (arr!5650 (Array (_ BitVec 32) ValueCell!2811)) (size!5991 (_ BitVec 32))) )
))
(declare-datatypes ((array!11899 0))(
  ( (array!11900 (arr!5651 (Array (_ BitVec 32) (_ BitVec 64))) (size!5992 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3522 0))(
  ( (LongMapFixedSize!3523 (defaultEntry!4446 Int) (mask!10496 (_ BitVec 32)) (extraKeys!4183 (_ BitVec 32)) (zeroValue!4287 V!8059) (minValue!4287 V!8059) (_size!1810 (_ BitVec 32)) (_keys!6548 array!11899) (_values!4429 array!11897) (_vacant!1810 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3522)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!332 (array!11899 array!11897 (_ BitVec 32) (_ BitVec 32) V!8059 V!8059 (_ BitVec 64) Int) Unit!7368)

(assert (=> b!239785 (= lt!120858 (lemmaInListMapThenSeekEntryOrOpenFindsIt!332 (_keys!6548 thiss!1504) (_values!4429 thiss!1504) (mask!10496 thiss!1504) (extraKeys!4183 thiss!1504) (zeroValue!4287 thiss!1504) (minValue!4287 thiss!1504) key!932 (defaultEntry!4446 thiss!1504)))))

(assert (=> b!239785 false))

(declare-fun b!239786 () Bool)

(declare-fun e!155688 () Bool)

(declare-fun e!155694 () Bool)

(declare-fun mapRes!10695 () Bool)

(assert (=> b!239786 (= e!155688 (and e!155694 mapRes!10695))))

(declare-fun condMapEmpty!10695 () Bool)

(declare-fun mapDefault!10695 () ValueCell!2811)

(assert (=> b!239786 (= condMapEmpty!10695 (= (arr!5650 (_values!4429 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2811)) mapDefault!10695)))))

(declare-fun b!239787 () Bool)

(declare-fun e!155691 () Bool)

(declare-fun call!22302 () Bool)

(assert (=> b!239787 (= e!155691 (not call!22302))))

(declare-fun b!239788 () Bool)

(declare-fun c!39964 () Bool)

(declare-datatypes ((SeekEntryResult!1037 0))(
  ( (MissingZero!1037 (index!6318 (_ BitVec 32))) (Found!1037 (index!6319 (_ BitVec 32))) (Intermediate!1037 (undefined!1849 Bool) (index!6320 (_ BitVec 32)) (x!24125 (_ BitVec 32))) (Undefined!1037) (MissingVacant!1037 (index!6321 (_ BitVec 32))) )
))
(declare-fun lt!120861 () SeekEntryResult!1037)

(get-info :version)

(assert (=> b!239788 (= c!39964 ((_ is MissingVacant!1037) lt!120861))))

(declare-fun e!155685 () Bool)

(declare-fun e!155687 () Bool)

(assert (=> b!239788 (= e!155685 e!155687)))

(declare-fun res!117527 () Bool)

(declare-fun e!155689 () Bool)

(assert (=> start!22944 (=> (not res!117527) (not e!155689))))

(declare-fun valid!1388 (LongMapFixedSize!3522) Bool)

(assert (=> start!22944 (= res!117527 (valid!1388 thiss!1504))))

(assert (=> start!22944 e!155689))

(declare-fun e!155682 () Bool)

(assert (=> start!22944 e!155682))

(assert (=> start!22944 true))

(declare-fun b!239789 () Bool)

(declare-fun res!117529 () Bool)

(declare-fun e!155692 () Bool)

(assert (=> b!239789 (=> (not res!117529) (not e!155692))))

(declare-fun arrayContainsKey!0 (array!11899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!239789 (= res!117529 (arrayContainsKey!0 (_keys!6548 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239790 () Bool)

(declare-fun e!155683 () Bool)

(declare-fun tp_is_empty!6309 () Bool)

(assert (=> b!239790 (= e!155683 tp_is_empty!6309)))

(declare-fun b!239791 () Bool)

(declare-fun res!117531 () Bool)

(assert (=> b!239791 (=> (not res!117531) (not e!155691))))

(declare-fun call!22301 () Bool)

(assert (=> b!239791 (= res!117531 call!22301)))

(assert (=> b!239791 (= e!155685 e!155691)))

(declare-fun bm!22298 () Bool)

(assert (=> bm!22298 (= call!22302 (arrayContainsKey!0 (_keys!6548 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239792 () Bool)

(assert (=> b!239792 (= e!155694 tp_is_empty!6309)))

(declare-fun b!239793 () Bool)

(assert (=> b!239793 (= e!155687 ((_ is Undefined!1037) lt!120861))))

(declare-fun b!239794 () Bool)

(declare-fun res!117530 () Bool)

(assert (=> b!239794 (=> (not res!117530) (not e!155691))))

(assert (=> b!239794 (= res!117530 (= (select (arr!5651 (_keys!6548 thiss!1504)) (index!6318 lt!120861)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239795 () Bool)

(declare-fun res!117528 () Bool)

(assert (=> b!239795 (=> (not res!117528) (not e!155692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239795 (= res!117528 (validMask!0 (mask!10496 thiss!1504)))))

(declare-fun b!239796 () Bool)

(declare-fun res!117525 () Bool)

(assert (=> b!239796 (=> (not res!117525) (not e!155692))))

(assert (=> b!239796 (= res!117525 (and (= (size!5991 (_values!4429 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10496 thiss!1504))) (= (size!5992 (_keys!6548 thiss!1504)) (size!5991 (_values!4429 thiss!1504))) (bvsge (mask!10496 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4183 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4183 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!10695 () Bool)

(assert (=> mapIsEmpty!10695 mapRes!10695))

(declare-fun b!239797 () Bool)

(declare-fun e!155686 () Bool)

(assert (=> b!239797 (= e!155687 e!155686)))

(declare-fun res!117532 () Bool)

(assert (=> b!239797 (= res!117532 call!22301)))

(assert (=> b!239797 (=> (not res!117532) (not e!155686))))

(declare-fun b!239798 () Bool)

(declare-fun e!155693 () Bool)

(assert (=> b!239798 (= e!155689 e!155693)))

(declare-fun res!117524 () Bool)

(assert (=> b!239798 (=> (not res!117524) (not e!155693))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239798 (= res!117524 (or (= lt!120861 (MissingZero!1037 index!297)) (= lt!120861 (MissingVacant!1037 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11899 (_ BitVec 32)) SeekEntryResult!1037)

(assert (=> b!239798 (= lt!120861 (seekEntryOrOpen!0 key!932 (_keys!6548 thiss!1504) (mask!10496 thiss!1504)))))

(declare-fun b!239799 () Bool)

(assert (=> b!239799 (= e!155686 (not call!22302))))

(declare-fun b!239800 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11899 (_ BitVec 32)) Bool)

(assert (=> b!239800 (= e!155692 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6548 thiss!1504) (mask!10496 thiss!1504))))))

(declare-fun mapNonEmpty!10695 () Bool)

(declare-fun tp!22545 () Bool)

(assert (=> mapNonEmpty!10695 (= mapRes!10695 (and tp!22545 e!155683))))

(declare-fun mapRest!10695 () (Array (_ BitVec 32) ValueCell!2811))

(declare-fun mapKey!10695 () (_ BitVec 32))

(declare-fun mapValue!10695 () ValueCell!2811)

(assert (=> mapNonEmpty!10695 (= (arr!5650 (_values!4429 thiss!1504)) (store mapRest!10695 mapKey!10695 mapValue!10695))))

(declare-fun b!239801 () Bool)

(declare-fun res!117526 () Bool)

(assert (=> b!239801 (= res!117526 (= (select (arr!5651 (_keys!6548 thiss!1504)) (index!6321 lt!120861)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239801 (=> (not res!117526) (not e!155686))))

(declare-fun array_inv!3737 (array!11899) Bool)

(declare-fun array_inv!3738 (array!11897) Bool)

(assert (=> b!239802 (= e!155682 (and tp!22544 tp_is_empty!6309 (array_inv!3737 (_keys!6548 thiss!1504)) (array_inv!3738 (_values!4429 thiss!1504)) e!155688))))

(declare-fun b!239803 () Bool)

(declare-fun lt!120859 () Unit!7368)

(assert (=> b!239803 (= e!155690 lt!120859)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!347 (array!11899 array!11897 (_ BitVec 32) (_ BitVec 32) V!8059 V!8059 (_ BitVec 64) Int) Unit!7368)

(assert (=> b!239803 (= lt!120859 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!347 (_keys!6548 thiss!1504) (_values!4429 thiss!1504) (mask!10496 thiss!1504) (extraKeys!4183 thiss!1504) (zeroValue!4287 thiss!1504) (minValue!4287 thiss!1504) key!932 (defaultEntry!4446 thiss!1504)))))

(declare-fun c!39965 () Bool)

(assert (=> b!239803 (= c!39965 ((_ is MissingZero!1037) lt!120861))))

(assert (=> b!239803 e!155685))

(declare-fun bm!22299 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22299 (= call!22301 (inRange!0 (ite c!39965 (index!6318 lt!120861) (index!6321 lt!120861)) (mask!10496 thiss!1504)))))

(declare-fun b!239804 () Bool)

(assert (=> b!239804 (= e!155693 e!155692)))

(declare-fun res!117523 () Bool)

(assert (=> b!239804 (=> (not res!117523) (not e!155692))))

(assert (=> b!239804 (= res!117523 (inRange!0 index!297 (mask!10496 thiss!1504)))))

(declare-fun lt!120860 () Unit!7368)

(assert (=> b!239804 (= lt!120860 e!155690)))

(declare-fun c!39963 () Bool)

(declare-datatypes ((tuple2!4714 0))(
  ( (tuple2!4715 (_1!2368 (_ BitVec 64)) (_2!2368 V!8059)) )
))
(declare-datatypes ((List!3599 0))(
  ( (Nil!3596) (Cons!3595 (h!4251 tuple2!4714) (t!8594 List!3599)) )
))
(declare-datatypes ((ListLongMap!3627 0))(
  ( (ListLongMap!3628 (toList!1829 List!3599)) )
))
(declare-fun contains!1717 (ListLongMap!3627 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1357 (array!11899 array!11897 (_ BitVec 32) (_ BitVec 32) V!8059 V!8059 (_ BitVec 32) Int) ListLongMap!3627)

(assert (=> b!239804 (= c!39963 (contains!1717 (getCurrentListMap!1357 (_keys!6548 thiss!1504) (_values!4429 thiss!1504) (mask!10496 thiss!1504) (extraKeys!4183 thiss!1504) (zeroValue!4287 thiss!1504) (minValue!4287 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4446 thiss!1504)) key!932))))

(declare-fun b!239805 () Bool)

(declare-fun res!117533 () Bool)

(assert (=> b!239805 (=> (not res!117533) (not e!155689))))

(assert (=> b!239805 (= res!117533 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22944 res!117527) b!239805))

(assert (= (and b!239805 res!117533) b!239798))

(assert (= (and b!239798 res!117524) b!239804))

(assert (= (and b!239804 c!39963) b!239785))

(assert (= (and b!239804 (not c!39963)) b!239803))

(assert (= (and b!239803 c!39965) b!239791))

(assert (= (and b!239803 (not c!39965)) b!239788))

(assert (= (and b!239791 res!117531) b!239794))

(assert (= (and b!239794 res!117530) b!239787))

(assert (= (and b!239788 c!39964) b!239797))

(assert (= (and b!239788 (not c!39964)) b!239793))

(assert (= (and b!239797 res!117532) b!239801))

(assert (= (and b!239801 res!117526) b!239799))

(assert (= (or b!239791 b!239797) bm!22299))

(assert (= (or b!239787 b!239799) bm!22298))

(assert (= (and b!239804 res!117523) b!239789))

(assert (= (and b!239789 res!117529) b!239795))

(assert (= (and b!239795 res!117528) b!239796))

(assert (= (and b!239796 res!117525) b!239800))

(assert (= (and b!239786 condMapEmpty!10695) mapIsEmpty!10695))

(assert (= (and b!239786 (not condMapEmpty!10695)) mapNonEmpty!10695))

(assert (= (and mapNonEmpty!10695 ((_ is ValueCellFull!2811) mapValue!10695)) b!239790))

(assert (= (and b!239786 ((_ is ValueCellFull!2811) mapDefault!10695)) b!239792))

(assert (= b!239802 b!239786))

(assert (= start!22944 b!239802))

(declare-fun m!259681 () Bool)

(assert (=> b!239794 m!259681))

(declare-fun m!259683 () Bool)

(assert (=> b!239803 m!259683))

(declare-fun m!259685 () Bool)

(assert (=> mapNonEmpty!10695 m!259685))

(declare-fun m!259687 () Bool)

(assert (=> b!239785 m!259687))

(declare-fun m!259689 () Bool)

(assert (=> b!239804 m!259689))

(declare-fun m!259691 () Bool)

(assert (=> b!239804 m!259691))

(assert (=> b!239804 m!259691))

(declare-fun m!259693 () Bool)

(assert (=> b!239804 m!259693))

(declare-fun m!259695 () Bool)

(assert (=> bm!22298 m!259695))

(declare-fun m!259697 () Bool)

(assert (=> bm!22299 m!259697))

(declare-fun m!259699 () Bool)

(assert (=> b!239795 m!259699))

(declare-fun m!259701 () Bool)

(assert (=> start!22944 m!259701))

(declare-fun m!259703 () Bool)

(assert (=> b!239800 m!259703))

(declare-fun m!259705 () Bool)

(assert (=> b!239802 m!259705))

(declare-fun m!259707 () Bool)

(assert (=> b!239802 m!259707))

(declare-fun m!259709 () Bool)

(assert (=> b!239801 m!259709))

(assert (=> b!239789 m!259695))

(declare-fun m!259711 () Bool)

(assert (=> b!239798 m!259711))

(check-sat tp_is_empty!6309 (not b!239795) (not b!239800) (not bm!22298) (not b_next!6447) (not mapNonEmpty!10695) (not b!239798) (not b!239804) (not bm!22299) (not b!239803) (not start!22944) (not b!239785) (not b!239789) (not b!239802) b_and!13413)
(check-sat b_and!13413 (not b_next!6447))
