; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18464 () Bool)

(assert start!18464)

(declare-fun b!183156 () Bool)

(declare-fun b_free!4521 () Bool)

(declare-fun b_next!4521 () Bool)

(assert (=> b!183156 (= b_free!4521 (not b_next!4521))))

(declare-fun tp!16330 () Bool)

(declare-fun b_and!11089 () Bool)

(assert (=> b!183156 (= tp!16330 b_and!11089)))

(declare-fun b!183151 () Bool)

(declare-fun res!86704 () Bool)

(declare-fun e!120586 () Bool)

(assert (=> b!183151 (=> (not res!86704) (not e!120586))))

(declare-datatypes ((V!5371 0))(
  ( (V!5372 (val!2191 Int)) )
))
(declare-datatypes ((ValueCell!1803 0))(
  ( (ValueCellFull!1803 (v!4093 V!5371)) (EmptyCell!1803) )
))
(declare-datatypes ((array!7777 0))(
  ( (array!7778 (arr!3677 (Array (_ BitVec 32) (_ BitVec 64))) (size!3989 (_ BitVec 32))) )
))
(declare-datatypes ((array!7779 0))(
  ( (array!7780 (arr!3678 (Array (_ BitVec 32) ValueCell!1803)) (size!3990 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2514 0))(
  ( (LongMapFixedSize!2515 (defaultEntry!3746 Int) (mask!8804 (_ BitVec 32)) (extraKeys!3483 (_ BitVec 32)) (zeroValue!3587 V!5371) (minValue!3587 V!5371) (_size!1306 (_ BitVec 32)) (_keys!5663 array!7777) (_values!3729 array!7779) (_vacant!1306 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2514)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3414 0))(
  ( (tuple2!3415 (_1!1718 (_ BitVec 64)) (_2!1718 V!5371)) )
))
(declare-datatypes ((List!2333 0))(
  ( (Nil!2330) (Cons!2329 (h!2958 tuple2!3414) (t!7199 List!2333)) )
))
(declare-datatypes ((ListLongMap!2331 0))(
  ( (ListLongMap!2332 (toList!1181 List!2333)) )
))
(declare-fun contains!1267 (ListLongMap!2331 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!829 (array!7777 array!7779 (_ BitVec 32) (_ BitVec 32) V!5371 V!5371 (_ BitVec 32) Int) ListLongMap!2331)

(assert (=> b!183151 (= res!86704 (not (contains!1267 (getCurrentListMap!829 (_keys!5663 thiss!1248) (_values!3729 thiss!1248) (mask!8804 thiss!1248) (extraKeys!3483 thiss!1248) (zeroValue!3587 thiss!1248) (minValue!3587 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3746 thiss!1248)) key!828)))))

(declare-fun b!183152 () Bool)

(declare-fun e!120584 () Bool)

(declare-fun tp_is_empty!4293 () Bool)

(assert (=> b!183152 (= e!120584 tp_is_empty!4293)))

(declare-fun b!183153 () Bool)

(declare-fun e!120583 () Bool)

(declare-fun mapRes!7370 () Bool)

(assert (=> b!183153 (= e!120583 (and e!120584 mapRes!7370))))

(declare-fun condMapEmpty!7370 () Bool)

(declare-fun mapDefault!7370 () ValueCell!1803)

(assert (=> b!183153 (= condMapEmpty!7370 (= (arr!3678 (_values!3729 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1803)) mapDefault!7370)))))

(declare-fun res!86703 () Bool)

(declare-fun e!120587 () Bool)

(assert (=> start!18464 (=> (not res!86703) (not e!120587))))

(declare-fun valid!1041 (LongMapFixedSize!2514) Bool)

(assert (=> start!18464 (= res!86703 (valid!1041 thiss!1248))))

(assert (=> start!18464 e!120587))

(declare-fun e!120582 () Bool)

(assert (=> start!18464 e!120582))

(assert (=> start!18464 true))

(declare-fun b!183154 () Bool)

(declare-fun e!120585 () Bool)

(assert (=> b!183154 (= e!120585 tp_is_empty!4293)))

(declare-fun b!183155 () Bool)

(declare-fun res!86705 () Bool)

(assert (=> b!183155 (=> (not res!86705) (not e!120587))))

(assert (=> b!183155 (= res!86705 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!2377 (array!7777) Bool)

(declare-fun array_inv!2378 (array!7779) Bool)

(assert (=> b!183156 (= e!120582 (and tp!16330 tp_is_empty!4293 (array_inv!2377 (_keys!5663 thiss!1248)) (array_inv!2378 (_values!3729 thiss!1248)) e!120583))))

(declare-fun b!183157 () Bool)

(assert (=> b!183157 (= e!120587 e!120586)))

(declare-fun res!86706 () Bool)

(assert (=> b!183157 (=> (not res!86706) (not e!120586))))

(declare-datatypes ((SeekEntryResult!617 0))(
  ( (MissingZero!617 (index!4638 (_ BitVec 32))) (Found!617 (index!4639 (_ BitVec 32))) (Intermediate!617 (undefined!1429 Bool) (index!4640 (_ BitVec 32)) (x!19953 (_ BitVec 32))) (Undefined!617) (MissingVacant!617 (index!4641 (_ BitVec 32))) )
))
(declare-fun lt!90526 () SeekEntryResult!617)

(get-info :version)

(assert (=> b!183157 (= res!86706 (and (not ((_ is Undefined!617) lt!90526)) (not ((_ is MissingVacant!617) lt!90526)) (not ((_ is MissingZero!617) lt!90526)) ((_ is Found!617) lt!90526)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7777 (_ BitVec 32)) SeekEntryResult!617)

(assert (=> b!183157 (= lt!90526 (seekEntryOrOpen!0 key!828 (_keys!5663 thiss!1248) (mask!8804 thiss!1248)))))

(declare-fun b!183158 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!183158 (= e!120586 (not (validMask!0 (mask!8804 thiss!1248))))))

(declare-fun mapNonEmpty!7370 () Bool)

(declare-fun tp!16331 () Bool)

(assert (=> mapNonEmpty!7370 (= mapRes!7370 (and tp!16331 e!120585))))

(declare-fun mapValue!7370 () ValueCell!1803)

(declare-fun mapKey!7370 () (_ BitVec 32))

(declare-fun mapRest!7370 () (Array (_ BitVec 32) ValueCell!1803))

(assert (=> mapNonEmpty!7370 (= (arr!3678 (_values!3729 thiss!1248)) (store mapRest!7370 mapKey!7370 mapValue!7370))))

(declare-fun mapIsEmpty!7370 () Bool)

(assert (=> mapIsEmpty!7370 mapRes!7370))

(assert (= (and start!18464 res!86703) b!183155))

(assert (= (and b!183155 res!86705) b!183157))

(assert (= (and b!183157 res!86706) b!183151))

(assert (= (and b!183151 res!86704) b!183158))

(assert (= (and b!183153 condMapEmpty!7370) mapIsEmpty!7370))

(assert (= (and b!183153 (not condMapEmpty!7370)) mapNonEmpty!7370))

(assert (= (and mapNonEmpty!7370 ((_ is ValueCellFull!1803) mapValue!7370)) b!183154))

(assert (= (and b!183153 ((_ is ValueCellFull!1803) mapDefault!7370)) b!183152))

(assert (= b!183156 b!183153))

(assert (= start!18464 b!183156))

(declare-fun m!210709 () Bool)

(assert (=> mapNonEmpty!7370 m!210709))

(declare-fun m!210711 () Bool)

(assert (=> b!183157 m!210711))

(declare-fun m!210713 () Bool)

(assert (=> b!183151 m!210713))

(assert (=> b!183151 m!210713))

(declare-fun m!210715 () Bool)

(assert (=> b!183151 m!210715))

(declare-fun m!210717 () Bool)

(assert (=> start!18464 m!210717))

(declare-fun m!210719 () Bool)

(assert (=> b!183156 m!210719))

(declare-fun m!210721 () Bool)

(assert (=> b!183156 m!210721))

(declare-fun m!210723 () Bool)

(assert (=> b!183158 m!210723))

(check-sat (not b!183157) (not b!183156) b_and!11089 (not b!183158) (not b!183151) tp_is_empty!4293 (not mapNonEmpty!7370) (not start!18464) (not b_next!4521))
(check-sat b_and!11089 (not b_next!4521))
(get-model)

(declare-fun d!54687 () Bool)

(assert (=> d!54687 (= (array_inv!2377 (_keys!5663 thiss!1248)) (bvsge (size!3989 (_keys!5663 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183156 d!54687))

(declare-fun d!54689 () Bool)

(assert (=> d!54689 (= (array_inv!2378 (_values!3729 thiss!1248)) (bvsge (size!3990 (_values!3729 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183156 d!54689))

(declare-fun d!54691 () Bool)

(declare-fun e!120614 () Bool)

(assert (=> d!54691 e!120614))

(declare-fun res!86721 () Bool)

(assert (=> d!54691 (=> res!86721 e!120614)))

(declare-fun lt!90541 () Bool)

(assert (=> d!54691 (= res!86721 (not lt!90541))))

(declare-fun lt!90540 () Bool)

(assert (=> d!54691 (= lt!90541 lt!90540)))

(declare-datatypes ((Unit!5544 0))(
  ( (Unit!5545) )
))
(declare-fun lt!90538 () Unit!5544)

(declare-fun e!120613 () Unit!5544)

(assert (=> d!54691 (= lt!90538 e!120613)))

(declare-fun c!32820 () Bool)

(assert (=> d!54691 (= c!32820 lt!90540)))

(declare-fun containsKey!219 (List!2333 (_ BitVec 64)) Bool)

(assert (=> d!54691 (= lt!90540 (containsKey!219 (toList!1181 (getCurrentListMap!829 (_keys!5663 thiss!1248) (_values!3729 thiss!1248) (mask!8804 thiss!1248) (extraKeys!3483 thiss!1248) (zeroValue!3587 thiss!1248) (minValue!3587 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3746 thiss!1248))) key!828))))

(assert (=> d!54691 (= (contains!1267 (getCurrentListMap!829 (_keys!5663 thiss!1248) (_values!3729 thiss!1248) (mask!8804 thiss!1248) (extraKeys!3483 thiss!1248) (zeroValue!3587 thiss!1248) (minValue!3587 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3746 thiss!1248)) key!828) lt!90541)))

(declare-fun b!183189 () Bool)

(declare-fun lt!90539 () Unit!5544)

(assert (=> b!183189 (= e!120613 lt!90539)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!167 (List!2333 (_ BitVec 64)) Unit!5544)

(assert (=> b!183189 (= lt!90539 (lemmaContainsKeyImpliesGetValueByKeyDefined!167 (toList!1181 (getCurrentListMap!829 (_keys!5663 thiss!1248) (_values!3729 thiss!1248) (mask!8804 thiss!1248) (extraKeys!3483 thiss!1248) (zeroValue!3587 thiss!1248) (minValue!3587 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3746 thiss!1248))) key!828))))

(declare-datatypes ((Option!221 0))(
  ( (Some!220 (v!4095 V!5371)) (None!219) )
))
(declare-fun isDefined!168 (Option!221) Bool)

(declare-fun getValueByKey!215 (List!2333 (_ BitVec 64)) Option!221)

(assert (=> b!183189 (isDefined!168 (getValueByKey!215 (toList!1181 (getCurrentListMap!829 (_keys!5663 thiss!1248) (_values!3729 thiss!1248) (mask!8804 thiss!1248) (extraKeys!3483 thiss!1248) (zeroValue!3587 thiss!1248) (minValue!3587 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3746 thiss!1248))) key!828))))

(declare-fun b!183190 () Bool)

(declare-fun Unit!5546 () Unit!5544)

(assert (=> b!183190 (= e!120613 Unit!5546)))

(declare-fun b!183191 () Bool)

(assert (=> b!183191 (= e!120614 (isDefined!168 (getValueByKey!215 (toList!1181 (getCurrentListMap!829 (_keys!5663 thiss!1248) (_values!3729 thiss!1248) (mask!8804 thiss!1248) (extraKeys!3483 thiss!1248) (zeroValue!3587 thiss!1248) (minValue!3587 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3746 thiss!1248))) key!828)))))

(assert (= (and d!54691 c!32820) b!183189))

(assert (= (and d!54691 (not c!32820)) b!183190))

(assert (= (and d!54691 (not res!86721)) b!183191))

(declare-fun m!210741 () Bool)

(assert (=> d!54691 m!210741))

(declare-fun m!210743 () Bool)

(assert (=> b!183189 m!210743))

(declare-fun m!210745 () Bool)

(assert (=> b!183189 m!210745))

(assert (=> b!183189 m!210745))

(declare-fun m!210747 () Bool)

(assert (=> b!183189 m!210747))

(assert (=> b!183191 m!210745))

(assert (=> b!183191 m!210745))

(assert (=> b!183191 m!210747))

(assert (=> b!183151 d!54691))

(declare-fun b!183234 () Bool)

(declare-fun e!120649 () Bool)

(declare-fun e!120650 () Bool)

(assert (=> b!183234 (= e!120649 e!120650)))

(declare-fun c!32835 () Bool)

(assert (=> b!183234 (= c!32835 (not (= (bvand (extraKeys!3483 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18499 () Bool)

(declare-fun call!18508 () ListLongMap!2331)

(declare-fun call!18502 () ListLongMap!2331)

(assert (=> bm!18499 (= call!18508 call!18502)))

(declare-fun call!18505 () ListLongMap!2331)

(declare-fun bm!18501 () Bool)

(declare-fun c!32838 () Bool)

(declare-fun c!32837 () Bool)

(declare-fun call!18503 () ListLongMap!2331)

(declare-fun +!278 (ListLongMap!2331 tuple2!3414) ListLongMap!2331)

(assert (=> bm!18501 (= call!18505 (+!278 (ite c!32838 call!18502 (ite c!32837 call!18508 call!18503)) (ite (or c!32838 c!32837) (tuple2!3415 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3587 thiss!1248)) (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3587 thiss!1248)))))))

(declare-fun bm!18502 () Bool)

(declare-fun call!18507 () ListLongMap!2331)

(assert (=> bm!18502 (= call!18507 call!18505)))

(declare-fun b!183235 () Bool)

(declare-fun e!120651 () Bool)

(declare-fun e!120647 () Bool)

(assert (=> b!183235 (= e!120651 e!120647)))

(declare-fun res!86745 () Bool)

(declare-fun call!18504 () Bool)

(assert (=> b!183235 (= res!86745 call!18504)))

(assert (=> b!183235 (=> (not res!86745) (not e!120647))))

(declare-fun b!183236 () Bool)

(declare-fun e!120641 () Unit!5544)

(declare-fun lt!90600 () Unit!5544)

(assert (=> b!183236 (= e!120641 lt!90600)))

(declare-fun lt!90599 () ListLongMap!2331)

(declare-fun getCurrentListMapNoExtraKeys!191 (array!7777 array!7779 (_ BitVec 32) (_ BitVec 32) V!5371 V!5371 (_ BitVec 32) Int) ListLongMap!2331)

(assert (=> b!183236 (= lt!90599 (getCurrentListMapNoExtraKeys!191 (_keys!5663 thiss!1248) (_values!3729 thiss!1248) (mask!8804 thiss!1248) (extraKeys!3483 thiss!1248) (zeroValue!3587 thiss!1248) (minValue!3587 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3746 thiss!1248)))))

(declare-fun lt!90598 () (_ BitVec 64))

(assert (=> b!183236 (= lt!90598 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90605 () (_ BitVec 64))

(assert (=> b!183236 (= lt!90605 (select (arr!3677 (_keys!5663 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90603 () Unit!5544)

(declare-fun addStillContains!134 (ListLongMap!2331 (_ BitVec 64) V!5371 (_ BitVec 64)) Unit!5544)

(assert (=> b!183236 (= lt!90603 (addStillContains!134 lt!90599 lt!90598 (zeroValue!3587 thiss!1248) lt!90605))))

(assert (=> b!183236 (contains!1267 (+!278 lt!90599 (tuple2!3415 lt!90598 (zeroValue!3587 thiss!1248))) lt!90605)))

(declare-fun lt!90588 () Unit!5544)

(assert (=> b!183236 (= lt!90588 lt!90603)))

(declare-fun lt!90590 () ListLongMap!2331)

(assert (=> b!183236 (= lt!90590 (getCurrentListMapNoExtraKeys!191 (_keys!5663 thiss!1248) (_values!3729 thiss!1248) (mask!8804 thiss!1248) (extraKeys!3483 thiss!1248) (zeroValue!3587 thiss!1248) (minValue!3587 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3746 thiss!1248)))))

(declare-fun lt!90589 () (_ BitVec 64))

(assert (=> b!183236 (= lt!90589 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90602 () (_ BitVec 64))

(assert (=> b!183236 (= lt!90602 (select (arr!3677 (_keys!5663 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90601 () Unit!5544)

(declare-fun addApplyDifferent!134 (ListLongMap!2331 (_ BitVec 64) V!5371 (_ BitVec 64)) Unit!5544)

(assert (=> b!183236 (= lt!90601 (addApplyDifferent!134 lt!90590 lt!90589 (minValue!3587 thiss!1248) lt!90602))))

(declare-fun apply!158 (ListLongMap!2331 (_ BitVec 64)) V!5371)

(assert (=> b!183236 (= (apply!158 (+!278 lt!90590 (tuple2!3415 lt!90589 (minValue!3587 thiss!1248))) lt!90602) (apply!158 lt!90590 lt!90602))))

(declare-fun lt!90606 () Unit!5544)

(assert (=> b!183236 (= lt!90606 lt!90601)))

(declare-fun lt!90596 () ListLongMap!2331)

(assert (=> b!183236 (= lt!90596 (getCurrentListMapNoExtraKeys!191 (_keys!5663 thiss!1248) (_values!3729 thiss!1248) (mask!8804 thiss!1248) (extraKeys!3483 thiss!1248) (zeroValue!3587 thiss!1248) (minValue!3587 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3746 thiss!1248)))))

(declare-fun lt!90587 () (_ BitVec 64))

(assert (=> b!183236 (= lt!90587 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90592 () (_ BitVec 64))

(assert (=> b!183236 (= lt!90592 (select (arr!3677 (_keys!5663 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90597 () Unit!5544)

(assert (=> b!183236 (= lt!90597 (addApplyDifferent!134 lt!90596 lt!90587 (zeroValue!3587 thiss!1248) lt!90592))))

(assert (=> b!183236 (= (apply!158 (+!278 lt!90596 (tuple2!3415 lt!90587 (zeroValue!3587 thiss!1248))) lt!90592) (apply!158 lt!90596 lt!90592))))

(declare-fun lt!90595 () Unit!5544)

(assert (=> b!183236 (= lt!90595 lt!90597)))

(declare-fun lt!90594 () ListLongMap!2331)

(assert (=> b!183236 (= lt!90594 (getCurrentListMapNoExtraKeys!191 (_keys!5663 thiss!1248) (_values!3729 thiss!1248) (mask!8804 thiss!1248) (extraKeys!3483 thiss!1248) (zeroValue!3587 thiss!1248) (minValue!3587 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3746 thiss!1248)))))

(declare-fun lt!90591 () (_ BitVec 64))

(assert (=> b!183236 (= lt!90591 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90593 () (_ BitVec 64))

(assert (=> b!183236 (= lt!90593 (select (arr!3677 (_keys!5663 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183236 (= lt!90600 (addApplyDifferent!134 lt!90594 lt!90591 (minValue!3587 thiss!1248) lt!90593))))

(assert (=> b!183236 (= (apply!158 (+!278 lt!90594 (tuple2!3415 lt!90591 (minValue!3587 thiss!1248))) lt!90593) (apply!158 lt!90594 lt!90593))))

(declare-fun b!183237 () Bool)

(declare-fun e!120643 () Bool)

(declare-fun lt!90586 () ListLongMap!2331)

(declare-fun get!2105 (ValueCell!1803 V!5371) V!5371)

(declare-fun dynLambda!501 (Int (_ BitVec 64)) V!5371)

(assert (=> b!183237 (= e!120643 (= (apply!158 lt!90586 (select (arr!3677 (_keys!5663 thiss!1248)) #b00000000000000000000000000000000)) (get!2105 (select (arr!3678 (_values!3729 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!501 (defaultEntry!3746 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183237 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3990 (_values!3729 thiss!1248))))))

(assert (=> b!183237 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3989 (_keys!5663 thiss!1248))))))

(declare-fun b!183238 () Bool)

(declare-fun e!120646 () ListLongMap!2331)

(assert (=> b!183238 (= e!120646 call!18503)))

(declare-fun b!183239 () Bool)

(declare-fun c!32834 () Bool)

(assert (=> b!183239 (= c!32834 (and (not (= (bvand (extraKeys!3483 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3483 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!120642 () ListLongMap!2331)

(assert (=> b!183239 (= e!120642 e!120646)))

(declare-fun b!183240 () Bool)

(assert (=> b!183240 (= e!120642 call!18507)))

(declare-fun bm!18503 () Bool)

(assert (=> bm!18503 (= call!18503 call!18508)))

(declare-fun b!183241 () Bool)

(declare-fun call!18506 () Bool)

(assert (=> b!183241 (= e!120650 (not call!18506))))

(declare-fun b!183242 () Bool)

(declare-fun e!120645 () ListLongMap!2331)

(assert (=> b!183242 (= e!120645 e!120642)))

(assert (=> b!183242 (= c!32837 (and (not (= (bvand (extraKeys!3483 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3483 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!183243 () Bool)

(declare-fun Unit!5547 () Unit!5544)

(assert (=> b!183243 (= e!120641 Unit!5547)))

(declare-fun b!183244 () Bool)

(assert (=> b!183244 (= e!120651 (not call!18504))))

(declare-fun bm!18500 () Bool)

(assert (=> bm!18500 (= call!18504 (contains!1267 lt!90586 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!54693 () Bool)

(assert (=> d!54693 e!120649))

(declare-fun res!86743 () Bool)

(assert (=> d!54693 (=> (not res!86743) (not e!120649))))

(assert (=> d!54693 (= res!86743 (or (bvsge #b00000000000000000000000000000000 (size!3989 (_keys!5663 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3989 (_keys!5663 thiss!1248))))))))

(declare-fun lt!90604 () ListLongMap!2331)

(assert (=> d!54693 (= lt!90586 lt!90604)))

(declare-fun lt!90607 () Unit!5544)

(assert (=> d!54693 (= lt!90607 e!120641)))

(declare-fun c!32833 () Bool)

(declare-fun e!120652 () Bool)

(assert (=> d!54693 (= c!32833 e!120652)))

(declare-fun res!86740 () Bool)

(assert (=> d!54693 (=> (not res!86740) (not e!120652))))

(assert (=> d!54693 (= res!86740 (bvslt #b00000000000000000000000000000000 (size!3989 (_keys!5663 thiss!1248))))))

(assert (=> d!54693 (= lt!90604 e!120645)))

(assert (=> d!54693 (= c!32838 (and (not (= (bvand (extraKeys!3483 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3483 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54693 (validMask!0 (mask!8804 thiss!1248))))

(assert (=> d!54693 (= (getCurrentListMap!829 (_keys!5663 thiss!1248) (_values!3729 thiss!1248) (mask!8804 thiss!1248) (extraKeys!3483 thiss!1248) (zeroValue!3587 thiss!1248) (minValue!3587 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3746 thiss!1248)) lt!90586)))

(declare-fun b!183245 () Bool)

(assert (=> b!183245 (= e!120647 (= (apply!158 lt!90586 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3587 thiss!1248)))))

(declare-fun b!183246 () Bool)

(declare-fun e!120653 () Bool)

(assert (=> b!183246 (= e!120653 e!120643)))

(declare-fun res!86747 () Bool)

(assert (=> b!183246 (=> (not res!86747) (not e!120643))))

(assert (=> b!183246 (= res!86747 (contains!1267 lt!90586 (select (arr!3677 (_keys!5663 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183246 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3989 (_keys!5663 thiss!1248))))))

(declare-fun b!183247 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!183247 (= e!120652 (validKeyInArray!0 (select (arr!3677 (_keys!5663 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18504 () Bool)

(assert (=> bm!18504 (= call!18502 (getCurrentListMapNoExtraKeys!191 (_keys!5663 thiss!1248) (_values!3729 thiss!1248) (mask!8804 thiss!1248) (extraKeys!3483 thiss!1248) (zeroValue!3587 thiss!1248) (minValue!3587 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3746 thiss!1248)))))

(declare-fun b!183248 () Bool)

(declare-fun e!120648 () Bool)

(assert (=> b!183248 (= e!120648 (validKeyInArray!0 (select (arr!3677 (_keys!5663 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183249 () Bool)

(declare-fun e!120644 () Bool)

(assert (=> b!183249 (= e!120644 (= (apply!158 lt!90586 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3587 thiss!1248)))))

(declare-fun bm!18505 () Bool)

(assert (=> bm!18505 (= call!18506 (contains!1267 lt!90586 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183250 () Bool)

(declare-fun res!86748 () Bool)

(assert (=> b!183250 (=> (not res!86748) (not e!120649))))

(assert (=> b!183250 (= res!86748 e!120653)))

(declare-fun res!86746 () Bool)

(assert (=> b!183250 (=> res!86746 e!120653)))

(assert (=> b!183250 (= res!86746 (not e!120648))))

(declare-fun res!86744 () Bool)

(assert (=> b!183250 (=> (not res!86744) (not e!120648))))

(assert (=> b!183250 (= res!86744 (bvslt #b00000000000000000000000000000000 (size!3989 (_keys!5663 thiss!1248))))))

(declare-fun b!183251 () Bool)

(assert (=> b!183251 (= e!120650 e!120644)))

(declare-fun res!86741 () Bool)

(assert (=> b!183251 (= res!86741 call!18506)))

(assert (=> b!183251 (=> (not res!86741) (not e!120644))))

(declare-fun b!183252 () Bool)

(assert (=> b!183252 (= e!120645 (+!278 call!18505 (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3587 thiss!1248))))))

(declare-fun b!183253 () Bool)

(declare-fun res!86742 () Bool)

(assert (=> b!183253 (=> (not res!86742) (not e!120649))))

(assert (=> b!183253 (= res!86742 e!120651)))

(declare-fun c!32836 () Bool)

(assert (=> b!183253 (= c!32836 (not (= (bvand (extraKeys!3483 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!183254 () Bool)

(assert (=> b!183254 (= e!120646 call!18507)))

(assert (= (and d!54693 c!32838) b!183252))

(assert (= (and d!54693 (not c!32838)) b!183242))

(assert (= (and b!183242 c!32837) b!183240))

(assert (= (and b!183242 (not c!32837)) b!183239))

(assert (= (and b!183239 c!32834) b!183254))

(assert (= (and b!183239 (not c!32834)) b!183238))

(assert (= (or b!183254 b!183238) bm!18503))

(assert (= (or b!183240 bm!18503) bm!18499))

(assert (= (or b!183240 b!183254) bm!18502))

(assert (= (or b!183252 bm!18499) bm!18504))

(assert (= (or b!183252 bm!18502) bm!18501))

(assert (= (and d!54693 res!86740) b!183247))

(assert (= (and d!54693 c!32833) b!183236))

(assert (= (and d!54693 (not c!32833)) b!183243))

(assert (= (and d!54693 res!86743) b!183250))

(assert (= (and b!183250 res!86744) b!183248))

(assert (= (and b!183250 (not res!86746)) b!183246))

(assert (= (and b!183246 res!86747) b!183237))

(assert (= (and b!183250 res!86748) b!183253))

(assert (= (and b!183253 c!32836) b!183235))

(assert (= (and b!183253 (not c!32836)) b!183244))

(assert (= (and b!183235 res!86745) b!183245))

(assert (= (or b!183235 b!183244) bm!18500))

(assert (= (and b!183253 res!86742) b!183234))

(assert (= (and b!183234 c!32835) b!183251))

(assert (= (and b!183234 (not c!32835)) b!183241))

(assert (= (and b!183251 res!86741) b!183249))

(assert (= (or b!183251 b!183241) bm!18505))

(declare-fun b_lambda!7187 () Bool)

(assert (=> (not b_lambda!7187) (not b!183237)))

(declare-fun t!7202 () Bool)

(declare-fun tb!2827 () Bool)

(assert (=> (and b!183156 (= (defaultEntry!3746 thiss!1248) (defaultEntry!3746 thiss!1248)) t!7202) tb!2827))

(declare-fun result!4759 () Bool)

(assert (=> tb!2827 (= result!4759 tp_is_empty!4293)))

(assert (=> b!183237 t!7202))

(declare-fun b_and!11093 () Bool)

(assert (= b_and!11089 (and (=> t!7202 result!4759) b_and!11093)))

(declare-fun m!210749 () Bool)

(assert (=> b!183236 m!210749))

(declare-fun m!210751 () Bool)

(assert (=> b!183236 m!210751))

(declare-fun m!210753 () Bool)

(assert (=> b!183236 m!210753))

(declare-fun m!210755 () Bool)

(assert (=> b!183236 m!210755))

(declare-fun m!210757 () Bool)

(assert (=> b!183236 m!210757))

(declare-fun m!210759 () Bool)

(assert (=> b!183236 m!210759))

(assert (=> b!183236 m!210753))

(assert (=> b!183236 m!210749))

(declare-fun m!210761 () Bool)

(assert (=> b!183236 m!210761))

(declare-fun m!210763 () Bool)

(assert (=> b!183236 m!210763))

(declare-fun m!210765 () Bool)

(assert (=> b!183236 m!210765))

(declare-fun m!210767 () Bool)

(assert (=> b!183236 m!210767))

(declare-fun m!210769 () Bool)

(assert (=> b!183236 m!210769))

(assert (=> b!183236 m!210763))

(declare-fun m!210771 () Bool)

(assert (=> b!183236 m!210771))

(assert (=> b!183236 m!210767))

(declare-fun m!210773 () Bool)

(assert (=> b!183236 m!210773))

(declare-fun m!210775 () Bool)

(assert (=> b!183236 m!210775))

(declare-fun m!210777 () Bool)

(assert (=> b!183236 m!210777))

(declare-fun m!210779 () Bool)

(assert (=> b!183236 m!210779))

(declare-fun m!210781 () Bool)

(assert (=> b!183236 m!210781))

(declare-fun m!210783 () Bool)

(assert (=> bm!18501 m!210783))

(assert (=> b!183247 m!210751))

(assert (=> b!183247 m!210751))

(declare-fun m!210785 () Bool)

(assert (=> b!183247 m!210785))

(assert (=> d!54693 m!210723))

(declare-fun m!210787 () Bool)

(assert (=> bm!18500 m!210787))

(declare-fun m!210789 () Bool)

(assert (=> bm!18505 m!210789))

(assert (=> b!183248 m!210751))

(assert (=> b!183248 m!210751))

(assert (=> b!183248 m!210785))

(declare-fun m!210791 () Bool)

(assert (=> b!183245 m!210791))

(assert (=> b!183246 m!210751))

(assert (=> b!183246 m!210751))

(declare-fun m!210793 () Bool)

(assert (=> b!183246 m!210793))

(declare-fun m!210795 () Bool)

(assert (=> b!183249 m!210795))

(assert (=> b!183237 m!210751))

(declare-fun m!210797 () Bool)

(assert (=> b!183237 m!210797))

(declare-fun m!210799 () Bool)

(assert (=> b!183237 m!210799))

(assert (=> b!183237 m!210797))

(assert (=> b!183237 m!210799))

(declare-fun m!210801 () Bool)

(assert (=> b!183237 m!210801))

(assert (=> b!183237 m!210751))

(declare-fun m!210803 () Bool)

(assert (=> b!183237 m!210803))

(declare-fun m!210805 () Bool)

(assert (=> b!183252 m!210805))

(assert (=> bm!18504 m!210757))

(assert (=> b!183151 d!54693))

(declare-fun e!120661 () SeekEntryResult!617)

(declare-fun lt!90614 () SeekEntryResult!617)

(declare-fun b!183269 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7777 (_ BitVec 32)) SeekEntryResult!617)

(assert (=> b!183269 (= e!120661 (seekKeyOrZeroReturnVacant!0 (x!19953 lt!90614) (index!4640 lt!90614) (index!4640 lt!90614) key!828 (_keys!5663 thiss!1248) (mask!8804 thiss!1248)))))

(declare-fun d!54695 () Bool)

(declare-fun lt!90615 () SeekEntryResult!617)

(assert (=> d!54695 (and (or ((_ is Undefined!617) lt!90615) (not ((_ is Found!617) lt!90615)) (and (bvsge (index!4639 lt!90615) #b00000000000000000000000000000000) (bvslt (index!4639 lt!90615) (size!3989 (_keys!5663 thiss!1248))))) (or ((_ is Undefined!617) lt!90615) ((_ is Found!617) lt!90615) (not ((_ is MissingZero!617) lt!90615)) (and (bvsge (index!4638 lt!90615) #b00000000000000000000000000000000) (bvslt (index!4638 lt!90615) (size!3989 (_keys!5663 thiss!1248))))) (or ((_ is Undefined!617) lt!90615) ((_ is Found!617) lt!90615) ((_ is MissingZero!617) lt!90615) (not ((_ is MissingVacant!617) lt!90615)) (and (bvsge (index!4641 lt!90615) #b00000000000000000000000000000000) (bvslt (index!4641 lt!90615) (size!3989 (_keys!5663 thiss!1248))))) (or ((_ is Undefined!617) lt!90615) (ite ((_ is Found!617) lt!90615) (= (select (arr!3677 (_keys!5663 thiss!1248)) (index!4639 lt!90615)) key!828) (ite ((_ is MissingZero!617) lt!90615) (= (select (arr!3677 (_keys!5663 thiss!1248)) (index!4638 lt!90615)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!617) lt!90615) (= (select (arr!3677 (_keys!5663 thiss!1248)) (index!4641 lt!90615)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!120662 () SeekEntryResult!617)

(assert (=> d!54695 (= lt!90615 e!120662)))

(declare-fun c!32846 () Bool)

(assert (=> d!54695 (= c!32846 (and ((_ is Intermediate!617) lt!90614) (undefined!1429 lt!90614)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7777 (_ BitVec 32)) SeekEntryResult!617)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54695 (= lt!90614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8804 thiss!1248)) key!828 (_keys!5663 thiss!1248) (mask!8804 thiss!1248)))))

(assert (=> d!54695 (validMask!0 (mask!8804 thiss!1248))))

(assert (=> d!54695 (= (seekEntryOrOpen!0 key!828 (_keys!5663 thiss!1248) (mask!8804 thiss!1248)) lt!90615)))

(declare-fun b!183270 () Bool)

(assert (=> b!183270 (= e!120662 Undefined!617)))

(declare-fun b!183271 () Bool)

(declare-fun e!120660 () SeekEntryResult!617)

(assert (=> b!183271 (= e!120662 e!120660)))

(declare-fun lt!90616 () (_ BitVec 64))

(assert (=> b!183271 (= lt!90616 (select (arr!3677 (_keys!5663 thiss!1248)) (index!4640 lt!90614)))))

(declare-fun c!32845 () Bool)

(assert (=> b!183271 (= c!32845 (= lt!90616 key!828))))

(declare-fun b!183272 () Bool)

(assert (=> b!183272 (= e!120661 (MissingZero!617 (index!4640 lt!90614)))))

(declare-fun b!183273 () Bool)

(assert (=> b!183273 (= e!120660 (Found!617 (index!4640 lt!90614)))))

(declare-fun b!183274 () Bool)

(declare-fun c!32847 () Bool)

(assert (=> b!183274 (= c!32847 (= lt!90616 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183274 (= e!120660 e!120661)))

(assert (= (and d!54695 c!32846) b!183270))

(assert (= (and d!54695 (not c!32846)) b!183271))

(assert (= (and b!183271 c!32845) b!183273))

(assert (= (and b!183271 (not c!32845)) b!183274))

(assert (= (and b!183274 c!32847) b!183272))

(assert (= (and b!183274 (not c!32847)) b!183269))

(declare-fun m!210807 () Bool)

(assert (=> b!183269 m!210807))

(declare-fun m!210809 () Bool)

(assert (=> d!54695 m!210809))

(declare-fun m!210811 () Bool)

(assert (=> d!54695 m!210811))

(declare-fun m!210813 () Bool)

(assert (=> d!54695 m!210813))

(assert (=> d!54695 m!210723))

(declare-fun m!210815 () Bool)

(assert (=> d!54695 m!210815))

(assert (=> d!54695 m!210815))

(declare-fun m!210817 () Bool)

(assert (=> d!54695 m!210817))

(declare-fun m!210819 () Bool)

(assert (=> b!183271 m!210819))

(assert (=> b!183157 d!54695))

(declare-fun d!54697 () Bool)

(assert (=> d!54697 (= (validMask!0 (mask!8804 thiss!1248)) (and (or (= (mask!8804 thiss!1248) #b00000000000000000000000000000111) (= (mask!8804 thiss!1248) #b00000000000000000000000000001111) (= (mask!8804 thiss!1248) #b00000000000000000000000000011111) (= (mask!8804 thiss!1248) #b00000000000000000000000000111111) (= (mask!8804 thiss!1248) #b00000000000000000000000001111111) (= (mask!8804 thiss!1248) #b00000000000000000000000011111111) (= (mask!8804 thiss!1248) #b00000000000000000000000111111111) (= (mask!8804 thiss!1248) #b00000000000000000000001111111111) (= (mask!8804 thiss!1248) #b00000000000000000000011111111111) (= (mask!8804 thiss!1248) #b00000000000000000000111111111111) (= (mask!8804 thiss!1248) #b00000000000000000001111111111111) (= (mask!8804 thiss!1248) #b00000000000000000011111111111111) (= (mask!8804 thiss!1248) #b00000000000000000111111111111111) (= (mask!8804 thiss!1248) #b00000000000000001111111111111111) (= (mask!8804 thiss!1248) #b00000000000000011111111111111111) (= (mask!8804 thiss!1248) #b00000000000000111111111111111111) (= (mask!8804 thiss!1248) #b00000000000001111111111111111111) (= (mask!8804 thiss!1248) #b00000000000011111111111111111111) (= (mask!8804 thiss!1248) #b00000000000111111111111111111111) (= (mask!8804 thiss!1248) #b00000000001111111111111111111111) (= (mask!8804 thiss!1248) #b00000000011111111111111111111111) (= (mask!8804 thiss!1248) #b00000000111111111111111111111111) (= (mask!8804 thiss!1248) #b00000001111111111111111111111111) (= (mask!8804 thiss!1248) #b00000011111111111111111111111111) (= (mask!8804 thiss!1248) #b00000111111111111111111111111111) (= (mask!8804 thiss!1248) #b00001111111111111111111111111111) (= (mask!8804 thiss!1248) #b00011111111111111111111111111111) (= (mask!8804 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8804 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!183158 d!54697))

(declare-fun d!54699 () Bool)

(declare-fun res!86755 () Bool)

(declare-fun e!120665 () Bool)

(assert (=> d!54699 (=> (not res!86755) (not e!120665))))

(declare-fun simpleValid!174 (LongMapFixedSize!2514) Bool)

(assert (=> d!54699 (= res!86755 (simpleValid!174 thiss!1248))))

(assert (=> d!54699 (= (valid!1041 thiss!1248) e!120665)))

(declare-fun b!183281 () Bool)

(declare-fun res!86756 () Bool)

(assert (=> b!183281 (=> (not res!86756) (not e!120665))))

(declare-fun arrayCountValidKeys!0 (array!7777 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183281 (= res!86756 (= (arrayCountValidKeys!0 (_keys!5663 thiss!1248) #b00000000000000000000000000000000 (size!3989 (_keys!5663 thiss!1248))) (_size!1306 thiss!1248)))))

(declare-fun b!183282 () Bool)

(declare-fun res!86757 () Bool)

(assert (=> b!183282 (=> (not res!86757) (not e!120665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7777 (_ BitVec 32)) Bool)

(assert (=> b!183282 (= res!86757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5663 thiss!1248) (mask!8804 thiss!1248)))))

(declare-fun b!183283 () Bool)

(declare-datatypes ((List!2335 0))(
  ( (Nil!2332) (Cons!2331 (h!2960 (_ BitVec 64)) (t!7203 List!2335)) )
))
(declare-fun arrayNoDuplicates!0 (array!7777 (_ BitVec 32) List!2335) Bool)

(assert (=> b!183283 (= e!120665 (arrayNoDuplicates!0 (_keys!5663 thiss!1248) #b00000000000000000000000000000000 Nil!2332))))

(assert (= (and d!54699 res!86755) b!183281))

(assert (= (and b!183281 res!86756) b!183282))

(assert (= (and b!183282 res!86757) b!183283))

(declare-fun m!210821 () Bool)

(assert (=> d!54699 m!210821))

(declare-fun m!210823 () Bool)

(assert (=> b!183281 m!210823))

(declare-fun m!210825 () Bool)

(assert (=> b!183282 m!210825))

(declare-fun m!210827 () Bool)

(assert (=> b!183283 m!210827))

(assert (=> start!18464 d!54699))

(declare-fun b!183291 () Bool)

(declare-fun e!120671 () Bool)

(assert (=> b!183291 (= e!120671 tp_is_empty!4293)))

(declare-fun b!183290 () Bool)

(declare-fun e!120670 () Bool)

(assert (=> b!183290 (= e!120670 tp_is_empty!4293)))

(declare-fun mapNonEmpty!7376 () Bool)

(declare-fun mapRes!7376 () Bool)

(declare-fun tp!16340 () Bool)

(assert (=> mapNonEmpty!7376 (= mapRes!7376 (and tp!16340 e!120670))))

(declare-fun mapValue!7376 () ValueCell!1803)

(declare-fun mapRest!7376 () (Array (_ BitVec 32) ValueCell!1803))

(declare-fun mapKey!7376 () (_ BitVec 32))

(assert (=> mapNonEmpty!7376 (= mapRest!7370 (store mapRest!7376 mapKey!7376 mapValue!7376))))

(declare-fun condMapEmpty!7376 () Bool)

(declare-fun mapDefault!7376 () ValueCell!1803)

(assert (=> mapNonEmpty!7370 (= condMapEmpty!7376 (= mapRest!7370 ((as const (Array (_ BitVec 32) ValueCell!1803)) mapDefault!7376)))))

(assert (=> mapNonEmpty!7370 (= tp!16331 (and e!120671 mapRes!7376))))

(declare-fun mapIsEmpty!7376 () Bool)

(assert (=> mapIsEmpty!7376 mapRes!7376))

(assert (= (and mapNonEmpty!7370 condMapEmpty!7376) mapIsEmpty!7376))

(assert (= (and mapNonEmpty!7370 (not condMapEmpty!7376)) mapNonEmpty!7376))

(assert (= (and mapNonEmpty!7376 ((_ is ValueCellFull!1803) mapValue!7376)) b!183290))

(assert (= (and mapNonEmpty!7370 ((_ is ValueCellFull!1803) mapDefault!7376)) b!183291))

(declare-fun m!210829 () Bool)

(assert (=> mapNonEmpty!7376 m!210829))

(declare-fun b_lambda!7189 () Bool)

(assert (= b_lambda!7187 (or (and b!183156 b_free!4521) b_lambda!7189)))

(check-sat (not b!183281) (not b!183247) (not d!54693) (not b!183248) (not b!183237) (not b!183269) (not bm!18505) (not b!183236) (not b_lambda!7189) (not mapNonEmpty!7376) (not b!183282) (not bm!18504) (not d!54691) (not b!183191) (not b_next!4521) (not b!183189) (not d!54695) (not bm!18501) (not b!183252) b_and!11093 (not b!183249) (not d!54699) (not b!183246) (not bm!18500) tp_is_empty!4293 (not b!183245) (not b!183283))
(check-sat b_and!11093 (not b_next!4521))
