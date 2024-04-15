; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23664 () Bool)

(assert start!23664)

(declare-fun b!248521 () Bool)

(declare-fun b_free!6607 () Bool)

(declare-fun b_next!6607 () Bool)

(assert (=> b!248521 (= b_free!6607 (not b_next!6607))))

(declare-fun tp!23074 () Bool)

(declare-fun b_and!13587 () Bool)

(assert (=> b!248521 (= tp!23074 b_and!13587)))

(declare-fun bm!23290 () Bool)

(declare-fun call!23293 () Bool)

(declare-datatypes ((V!8273 0))(
  ( (V!8274 (val!3279 Int)) )
))
(declare-datatypes ((ValueCell!2891 0))(
  ( (ValueCellFull!2891 (v!5333 V!8273)) (EmptyCell!2891) )
))
(declare-datatypes ((array!12241 0))(
  ( (array!12242 (arr!5805 (Array (_ BitVec 32) ValueCell!2891)) (size!6149 (_ BitVec 32))) )
))
(declare-datatypes ((array!12243 0))(
  ( (array!12244 (arr!5806 (Array (_ BitVec 32) (_ BitVec 64))) (size!6150 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3682 0))(
  ( (LongMapFixedSize!3683 (defaultEntry!4598 Int) (mask!10751 (_ BitVec 32)) (extraKeys!4335 (_ BitVec 32)) (zeroValue!4439 V!8273) (minValue!4439 V!8273) (_size!1890 (_ BitVec 32)) (_keys!6723 array!12243) (_values!4581 array!12241) (_vacant!1890 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3682)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23290 (= call!23293 (arrayContainsKey!0 (_keys!6723 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248506 () Bool)

(declare-fun c!41643 () Bool)

(declare-datatypes ((SeekEntryResult!1110 0))(
  ( (MissingZero!1110 (index!6610 (_ BitVec 32))) (Found!1110 (index!6611 (_ BitVec 32))) (Intermediate!1110 (undefined!1922 Bool) (index!6612 (_ BitVec 32)) (x!24589 (_ BitVec 32))) (Undefined!1110) (MissingVacant!1110 (index!6613 (_ BitVec 32))) )
))
(declare-fun lt!124338 () SeekEntryResult!1110)

(get-info :version)

(assert (=> b!248506 (= c!41643 ((_ is MissingVacant!1110) lt!124338))))

(declare-fun e!161186 () Bool)

(declare-fun e!161174 () Bool)

(assert (=> b!248506 (= e!161186 e!161174)))

(declare-fun b!248507 () Bool)

(declare-datatypes ((Unit!7679 0))(
  ( (Unit!7680) )
))
(declare-fun e!161177 () Unit!7679)

(declare-fun Unit!7681 () Unit!7679)

(assert (=> b!248507 (= e!161177 Unit!7681)))

(declare-fun b!248508 () Bool)

(declare-fun res!121760 () Bool)

(declare-fun e!161184 () Bool)

(assert (=> b!248508 (=> (not res!121760) (not e!161184))))

(assert (=> b!248508 (= res!121760 (= (select (arr!5806 (_keys!6723 thiss!1504)) (index!6610 lt!124338)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248509 () Bool)

(declare-fun e!161183 () Bool)

(assert (=> b!248509 (= e!161183 (not call!23293))))

(declare-fun b!248510 () Bool)

(declare-fun res!121766 () Bool)

(assert (=> b!248510 (= res!121766 (= (select (arr!5806 (_keys!6723 thiss!1504)) (index!6613 lt!124338)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248510 (=> (not res!121766) (not e!161183))))

(declare-fun c!41645 () Bool)

(declare-fun bm!23291 () Bool)

(declare-fun call!23294 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23291 (= call!23294 (inRange!0 (ite c!41645 (index!6610 lt!124338) (index!6613 lt!124338)) (mask!10751 thiss!1504)))))

(declare-fun b!248511 () Bool)

(assert (=> b!248511 (= e!161174 e!161183)))

(declare-fun res!121764 () Bool)

(assert (=> b!248511 (= res!121764 call!23294)))

(assert (=> b!248511 (=> (not res!121764) (not e!161183))))

(declare-fun b!248512 () Bool)

(declare-fun e!161181 () Bool)

(declare-fun tp_is_empty!6469 () Bool)

(assert (=> b!248512 (= e!161181 tp_is_empty!6469)))

(declare-fun b!248513 () Bool)

(declare-fun res!121763 () Bool)

(declare-fun e!161178 () Bool)

(assert (=> b!248513 (=> (not res!121763) (not e!161178))))

(assert (=> b!248513 (= res!121763 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!248514 () Bool)

(declare-fun e!161180 () Bool)

(assert (=> b!248514 (= e!161178 e!161180)))

(declare-fun res!121759 () Bool)

(assert (=> b!248514 (=> (not res!121759) (not e!161180))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!248514 (= res!121759 (or (= lt!124338 (MissingZero!1110 index!297)) (= lt!124338 (MissingVacant!1110 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12243 (_ BitVec 32)) SeekEntryResult!1110)

(assert (=> b!248514 (= lt!124338 (seekEntryOrOpen!0 key!932 (_keys!6723 thiss!1504) (mask!10751 thiss!1504)))))

(declare-fun b!248515 () Bool)

(declare-fun res!121762 () Bool)

(assert (=> b!248515 (=> (not res!121762) (not e!161184))))

(assert (=> b!248515 (= res!121762 call!23294)))

(assert (=> b!248515 (= e!161186 e!161184)))

(declare-fun mapNonEmpty!10985 () Bool)

(declare-fun mapRes!10985 () Bool)

(declare-fun tp!23075 () Bool)

(declare-fun e!161182 () Bool)

(assert (=> mapNonEmpty!10985 (= mapRes!10985 (and tp!23075 e!161182))))

(declare-fun mapRest!10985 () (Array (_ BitVec 32) ValueCell!2891))

(declare-fun mapValue!10985 () ValueCell!2891)

(declare-fun mapKey!10985 () (_ BitVec 32))

(assert (=> mapNonEmpty!10985 (= (arr!5805 (_values!4581 thiss!1504)) (store mapRest!10985 mapKey!10985 mapValue!10985))))

(declare-fun b!248505 () Bool)

(declare-fun e!161185 () Bool)

(assert (=> b!248505 (= e!161180 e!161185)))

(declare-fun res!121761 () Bool)

(assert (=> b!248505 (=> (not res!121761) (not e!161185))))

(assert (=> b!248505 (= res!121761 (inRange!0 index!297 (mask!10751 thiss!1504)))))

(declare-fun lt!124341 () Unit!7679)

(declare-fun e!161179 () Unit!7679)

(assert (=> b!248505 (= lt!124341 e!161179)))

(declare-fun c!41644 () Bool)

(declare-datatypes ((tuple2!4790 0))(
  ( (tuple2!4791 (_1!2406 (_ BitVec 64)) (_2!2406 V!8273)) )
))
(declare-datatypes ((List!3692 0))(
  ( (Nil!3689) (Cons!3688 (h!4346 tuple2!4790) (t!8710 List!3692)) )
))
(declare-datatypes ((ListLongMap!3693 0))(
  ( (ListLongMap!3694 (toList!1862 List!3692)) )
))
(declare-fun contains!1783 (ListLongMap!3693 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1371 (array!12243 array!12241 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 32) Int) ListLongMap!3693)

(assert (=> b!248505 (= c!41644 (contains!1783 (getCurrentListMap!1371 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)) key!932))))

(declare-fun res!121765 () Bool)

(assert (=> start!23664 (=> (not res!121765) (not e!161178))))

(declare-fun valid!1446 (LongMapFixedSize!3682) Bool)

(assert (=> start!23664 (= res!121765 (valid!1446 thiss!1504))))

(assert (=> start!23664 e!161178))

(declare-fun e!161175 () Bool)

(assert (=> start!23664 e!161175))

(assert (=> start!23664 true))

(declare-fun b!248516 () Bool)

(declare-fun Unit!7682 () Unit!7679)

(assert (=> b!248516 (= e!161179 Unit!7682)))

(declare-fun lt!124342 () Unit!7679)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!392 (array!12243 array!12241 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 64) Int) Unit!7679)

(assert (=> b!248516 (= lt!124342 (lemmaInListMapThenSeekEntryOrOpenFindsIt!392 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 (defaultEntry!4598 thiss!1504)))))

(assert (=> b!248516 false))

(declare-fun b!248517 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!248517 (= e!161185 (not (validMask!0 (mask!10751 thiss!1504))))))

(declare-fun lt!124334 () array!12243)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12243 (_ BitVec 32)) Bool)

(assert (=> b!248517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124334 (mask!10751 thiss!1504))))

(declare-fun lt!124340 () Unit!7679)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12243 (_ BitVec 32) (_ BitVec 32)) Unit!7679)

(assert (=> b!248517 (= lt!124340 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6723 thiss!1504) index!297 (mask!10751 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12243 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!248517 (= (arrayCountValidKeys!0 lt!124334 #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6723 thiss!1504) #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504)))))))

(declare-fun lt!124337 () Unit!7679)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12243 (_ BitVec 32) (_ BitVec 64)) Unit!7679)

(assert (=> b!248517 (= lt!124337 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6723 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3693 0))(
  ( (Nil!3690) (Cons!3689 (h!4347 (_ BitVec 64)) (t!8711 List!3693)) )
))
(declare-fun arrayNoDuplicates!0 (array!12243 (_ BitVec 32) List!3693) Bool)

(assert (=> b!248517 (arrayNoDuplicates!0 lt!124334 #b00000000000000000000000000000000 Nil!3690)))

(assert (=> b!248517 (= lt!124334 (array!12244 (store (arr!5806 (_keys!6723 thiss!1504)) index!297 key!932) (size!6150 (_keys!6723 thiss!1504))))))

(declare-fun lt!124333 () Unit!7679)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12243 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3693) Unit!7679)

(assert (=> b!248517 (= lt!124333 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6723 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3690))))

(declare-fun lt!124335 () Unit!7679)

(assert (=> b!248517 (= lt!124335 e!161177)))

(declare-fun c!41642 () Bool)

(assert (=> b!248517 (= c!41642 (arrayContainsKey!0 (_keys!6723 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248518 () Bool)

(declare-fun lt!124336 () Unit!7679)

(assert (=> b!248518 (= e!161179 lt!124336)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!391 (array!12243 array!12241 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 64) Int) Unit!7679)

(assert (=> b!248518 (= lt!124336 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!391 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 (defaultEntry!4598 thiss!1504)))))

(assert (=> b!248518 (= c!41645 ((_ is MissingZero!1110) lt!124338))))

(assert (=> b!248518 e!161186))

(declare-fun mapIsEmpty!10985 () Bool)

(assert (=> mapIsEmpty!10985 mapRes!10985))

(declare-fun b!248519 () Bool)

(assert (=> b!248519 (= e!161174 ((_ is Undefined!1110) lt!124338))))

(declare-fun b!248520 () Bool)

(assert (=> b!248520 (= e!161184 (not call!23293))))

(declare-fun e!161187 () Bool)

(declare-fun array_inv!3829 (array!12243) Bool)

(declare-fun array_inv!3830 (array!12241) Bool)

(assert (=> b!248521 (= e!161175 (and tp!23074 tp_is_empty!6469 (array_inv!3829 (_keys!6723 thiss!1504)) (array_inv!3830 (_values!4581 thiss!1504)) e!161187))))

(declare-fun b!248522 () Bool)

(assert (=> b!248522 (= e!161187 (and e!161181 mapRes!10985))))

(declare-fun condMapEmpty!10985 () Bool)

(declare-fun mapDefault!10985 () ValueCell!2891)

(assert (=> b!248522 (= condMapEmpty!10985 (= (arr!5805 (_values!4581 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2891)) mapDefault!10985)))))

(declare-fun b!248523 () Bool)

(declare-fun Unit!7683 () Unit!7679)

(assert (=> b!248523 (= e!161177 Unit!7683)))

(declare-fun lt!124339 () Unit!7679)

(declare-fun lemmaArrayContainsKeyThenInListMap!202 (array!12243 array!12241 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 64) (_ BitVec 32) Int) Unit!7679)

(assert (=> b!248523 (= lt!124339 (lemmaArrayContainsKeyThenInListMap!202 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)))))

(assert (=> b!248523 false))

(declare-fun b!248524 () Bool)

(assert (=> b!248524 (= e!161182 tp_is_empty!6469)))

(assert (= (and start!23664 res!121765) b!248513))

(assert (= (and b!248513 res!121763) b!248514))

(assert (= (and b!248514 res!121759) b!248505))

(assert (= (and b!248505 c!41644) b!248516))

(assert (= (and b!248505 (not c!41644)) b!248518))

(assert (= (and b!248518 c!41645) b!248515))

(assert (= (and b!248518 (not c!41645)) b!248506))

(assert (= (and b!248515 res!121762) b!248508))

(assert (= (and b!248508 res!121760) b!248520))

(assert (= (and b!248506 c!41643) b!248511))

(assert (= (and b!248506 (not c!41643)) b!248519))

(assert (= (and b!248511 res!121764) b!248510))

(assert (= (and b!248510 res!121766) b!248509))

(assert (= (or b!248515 b!248511) bm!23291))

(assert (= (or b!248520 b!248509) bm!23290))

(assert (= (and b!248505 res!121761) b!248517))

(assert (= (and b!248517 c!41642) b!248523))

(assert (= (and b!248517 (not c!41642)) b!248507))

(assert (= (and b!248522 condMapEmpty!10985) mapIsEmpty!10985))

(assert (= (and b!248522 (not condMapEmpty!10985)) mapNonEmpty!10985))

(assert (= (and mapNonEmpty!10985 ((_ is ValueCellFull!2891) mapValue!10985)) b!248524))

(assert (= (and b!248522 ((_ is ValueCellFull!2891) mapDefault!10985)) b!248512))

(assert (= b!248521 b!248522))

(assert (= start!23664 b!248521))

(declare-fun m!264709 () Bool)

(assert (=> b!248518 m!264709))

(declare-fun m!264711 () Bool)

(assert (=> b!248510 m!264711))

(declare-fun m!264713 () Bool)

(assert (=> b!248508 m!264713))

(declare-fun m!264715 () Bool)

(assert (=> bm!23290 m!264715))

(declare-fun m!264717 () Bool)

(assert (=> b!248516 m!264717))

(declare-fun m!264719 () Bool)

(assert (=> b!248517 m!264719))

(assert (=> b!248517 m!264715))

(declare-fun m!264721 () Bool)

(assert (=> b!248517 m!264721))

(declare-fun m!264723 () Bool)

(assert (=> b!248517 m!264723))

(declare-fun m!264725 () Bool)

(assert (=> b!248517 m!264725))

(declare-fun m!264727 () Bool)

(assert (=> b!248517 m!264727))

(declare-fun m!264729 () Bool)

(assert (=> b!248517 m!264729))

(declare-fun m!264731 () Bool)

(assert (=> b!248517 m!264731))

(declare-fun m!264733 () Bool)

(assert (=> b!248517 m!264733))

(declare-fun m!264735 () Bool)

(assert (=> b!248517 m!264735))

(declare-fun m!264737 () Bool)

(assert (=> b!248514 m!264737))

(declare-fun m!264739 () Bool)

(assert (=> b!248523 m!264739))

(declare-fun m!264741 () Bool)

(assert (=> bm!23291 m!264741))

(declare-fun m!264743 () Bool)

(assert (=> b!248505 m!264743))

(declare-fun m!264745 () Bool)

(assert (=> b!248505 m!264745))

(assert (=> b!248505 m!264745))

(declare-fun m!264747 () Bool)

(assert (=> b!248505 m!264747))

(declare-fun m!264749 () Bool)

(assert (=> b!248521 m!264749))

(declare-fun m!264751 () Bool)

(assert (=> b!248521 m!264751))

(declare-fun m!264753 () Bool)

(assert (=> mapNonEmpty!10985 m!264753))

(declare-fun m!264755 () Bool)

(assert (=> start!23664 m!264755))

(check-sat (not b!248521) (not b!248518) (not bm!23291) (not mapNonEmpty!10985) tp_is_empty!6469 (not start!23664) (not b!248516) b_and!13587 (not b!248505) (not b!248514) (not b!248517) (not b!248523) (not bm!23290) (not b_next!6607))
(check-sat b_and!13587 (not b_next!6607))
(get-model)

(declare-fun d!60421 () Bool)

(assert (=> d!60421 (= (inRange!0 (ite c!41645 (index!6610 lt!124338) (index!6613 lt!124338)) (mask!10751 thiss!1504)) (and (bvsge (ite c!41645 (index!6610 lt!124338) (index!6613 lt!124338)) #b00000000000000000000000000000000) (bvslt (ite c!41645 (index!6610 lt!124338) (index!6613 lt!124338)) (bvadd (mask!10751 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23291 d!60421))

(declare-fun d!60423 () Bool)

(declare-fun res!121821 () Bool)

(declare-fun e!161274 () Bool)

(assert (=> d!60423 (=> (not res!121821) (not e!161274))))

(declare-fun simpleValid!260 (LongMapFixedSize!3682) Bool)

(assert (=> d!60423 (= res!121821 (simpleValid!260 thiss!1504))))

(assert (=> d!60423 (= (valid!1446 thiss!1504) e!161274)))

(declare-fun b!248651 () Bool)

(declare-fun res!121822 () Bool)

(assert (=> b!248651 (=> (not res!121822) (not e!161274))))

(assert (=> b!248651 (= res!121822 (= (arrayCountValidKeys!0 (_keys!6723 thiss!1504) #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))) (_size!1890 thiss!1504)))))

(declare-fun b!248652 () Bool)

(declare-fun res!121823 () Bool)

(assert (=> b!248652 (=> (not res!121823) (not e!161274))))

(assert (=> b!248652 (= res!121823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6723 thiss!1504) (mask!10751 thiss!1504)))))

(declare-fun b!248653 () Bool)

(assert (=> b!248653 (= e!161274 (arrayNoDuplicates!0 (_keys!6723 thiss!1504) #b00000000000000000000000000000000 Nil!3690))))

(assert (= (and d!60423 res!121821) b!248651))

(assert (= (and b!248651 res!121822) b!248652))

(assert (= (and b!248652 res!121823) b!248653))

(declare-fun m!264853 () Bool)

(assert (=> d!60423 m!264853))

(assert (=> b!248651 m!264729))

(declare-fun m!264855 () Bool)

(assert (=> b!248652 m!264855))

(declare-fun m!264857 () Bool)

(assert (=> b!248653 m!264857))

(assert (=> start!23664 d!60423))

(declare-fun d!60425 () Bool)

(declare-fun e!161277 () Bool)

(assert (=> d!60425 e!161277))

(declare-fun res!121829 () Bool)

(assert (=> d!60425 (=> (not res!121829) (not e!161277))))

(declare-fun lt!124408 () SeekEntryResult!1110)

(assert (=> d!60425 (= res!121829 ((_ is Found!1110) lt!124408))))

(assert (=> d!60425 (= lt!124408 (seekEntryOrOpen!0 key!932 (_keys!6723 thiss!1504) (mask!10751 thiss!1504)))))

(declare-fun lt!124407 () Unit!7679)

(declare-fun choose!1177 (array!12243 array!12241 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 64) Int) Unit!7679)

(assert (=> d!60425 (= lt!124407 (choose!1177 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 (defaultEntry!4598 thiss!1504)))))

(assert (=> d!60425 (validMask!0 (mask!10751 thiss!1504))))

(assert (=> d!60425 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!392 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 (defaultEntry!4598 thiss!1504)) lt!124407)))

(declare-fun b!248658 () Bool)

(declare-fun res!121828 () Bool)

(assert (=> b!248658 (=> (not res!121828) (not e!161277))))

(assert (=> b!248658 (= res!121828 (inRange!0 (index!6611 lt!124408) (mask!10751 thiss!1504)))))

(declare-fun b!248659 () Bool)

(assert (=> b!248659 (= e!161277 (= (select (arr!5806 (_keys!6723 thiss!1504)) (index!6611 lt!124408)) key!932))))

(assert (=> b!248659 (and (bvsge (index!6611 lt!124408) #b00000000000000000000000000000000) (bvslt (index!6611 lt!124408) (size!6150 (_keys!6723 thiss!1504))))))

(assert (= (and d!60425 res!121829) b!248658))

(assert (= (and b!248658 res!121828) b!248659))

(assert (=> d!60425 m!264737))

(declare-fun m!264859 () Bool)

(assert (=> d!60425 m!264859))

(assert (=> d!60425 m!264719))

(declare-fun m!264861 () Bool)

(assert (=> b!248658 m!264861))

(declare-fun m!264863 () Bool)

(assert (=> b!248659 m!264863))

(assert (=> b!248516 d!60425))

(declare-fun bm!23306 () Bool)

(declare-fun call!23309 () Bool)

(assert (=> bm!23306 (= call!23309 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!124334 (mask!10751 thiss!1504)))))

(declare-fun b!248668 () Bool)

(declare-fun e!161285 () Bool)

(assert (=> b!248668 (= e!161285 call!23309)))

(declare-fun b!248669 () Bool)

(declare-fun e!161286 () Bool)

(declare-fun e!161284 () Bool)

(assert (=> b!248669 (= e!161286 e!161284)))

(declare-fun c!41672 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!248669 (= c!41672 (validKeyInArray!0 (select (arr!5806 lt!124334) #b00000000000000000000000000000000)))))

(declare-fun d!60427 () Bool)

(declare-fun res!121835 () Bool)

(assert (=> d!60427 (=> res!121835 e!161286)))

(assert (=> d!60427 (= res!121835 (bvsge #b00000000000000000000000000000000 (size!6150 lt!124334)))))

(assert (=> d!60427 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124334 (mask!10751 thiss!1504)) e!161286)))

(declare-fun b!248670 () Bool)

(assert (=> b!248670 (= e!161284 e!161285)))

(declare-fun lt!124417 () (_ BitVec 64))

(assert (=> b!248670 (= lt!124417 (select (arr!5806 lt!124334) #b00000000000000000000000000000000))))

(declare-fun lt!124416 () Unit!7679)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12243 (_ BitVec 64) (_ BitVec 32)) Unit!7679)

(assert (=> b!248670 (= lt!124416 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!124334 lt!124417 #b00000000000000000000000000000000))))

(assert (=> b!248670 (arrayContainsKey!0 lt!124334 lt!124417 #b00000000000000000000000000000000)))

(declare-fun lt!124415 () Unit!7679)

(assert (=> b!248670 (= lt!124415 lt!124416)))

(declare-fun res!121834 () Bool)

(assert (=> b!248670 (= res!121834 (= (seekEntryOrOpen!0 (select (arr!5806 lt!124334) #b00000000000000000000000000000000) lt!124334 (mask!10751 thiss!1504)) (Found!1110 #b00000000000000000000000000000000)))))

(assert (=> b!248670 (=> (not res!121834) (not e!161285))))

(declare-fun b!248671 () Bool)

(assert (=> b!248671 (= e!161284 call!23309)))

(assert (= (and d!60427 (not res!121835)) b!248669))

(assert (= (and b!248669 c!41672) b!248670))

(assert (= (and b!248669 (not c!41672)) b!248671))

(assert (= (and b!248670 res!121834) b!248668))

(assert (= (or b!248668 b!248671) bm!23306))

(declare-fun m!264865 () Bool)

(assert (=> bm!23306 m!264865))

(declare-fun m!264867 () Bool)

(assert (=> b!248669 m!264867))

(assert (=> b!248669 m!264867))

(declare-fun m!264869 () Bool)

(assert (=> b!248669 m!264869))

(assert (=> b!248670 m!264867))

(declare-fun m!264871 () Bool)

(assert (=> b!248670 m!264871))

(declare-fun m!264873 () Bool)

(assert (=> b!248670 m!264873))

(assert (=> b!248670 m!264867))

(declare-fun m!264875 () Bool)

(assert (=> b!248670 m!264875))

(assert (=> b!248517 d!60427))

(declare-fun b!248681 () Bool)

(declare-fun res!121847 () Bool)

(declare-fun e!161292 () Bool)

(assert (=> b!248681 (=> (not res!121847) (not e!161292))))

(assert (=> b!248681 (= res!121847 (validKeyInArray!0 key!932))))

(declare-fun d!60429 () Bool)

(declare-fun e!161291 () Bool)

(assert (=> d!60429 e!161291))

(declare-fun res!121846 () Bool)

(assert (=> d!60429 (=> (not res!121846) (not e!161291))))

(assert (=> d!60429 (= res!121846 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6150 (_keys!6723 thiss!1504)))))))

(declare-fun lt!124420 () Unit!7679)

(declare-fun choose!1 (array!12243 (_ BitVec 32) (_ BitVec 64)) Unit!7679)

(assert (=> d!60429 (= lt!124420 (choose!1 (_keys!6723 thiss!1504) index!297 key!932))))

(assert (=> d!60429 e!161292))

(declare-fun res!121845 () Bool)

(assert (=> d!60429 (=> (not res!121845) (not e!161292))))

(assert (=> d!60429 (= res!121845 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6150 (_keys!6723 thiss!1504)))))))

(assert (=> d!60429 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6723 thiss!1504) index!297 key!932) lt!124420)))

(declare-fun b!248683 () Bool)

(assert (=> b!248683 (= e!161291 (= (arrayCountValidKeys!0 (array!12244 (store (arr!5806 (_keys!6723 thiss!1504)) index!297 key!932) (size!6150 (_keys!6723 thiss!1504))) #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6723 thiss!1504) #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!248682 () Bool)

(assert (=> b!248682 (= e!161292 (bvslt (size!6150 (_keys!6723 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!248680 () Bool)

(declare-fun res!121844 () Bool)

(assert (=> b!248680 (=> (not res!121844) (not e!161292))))

(assert (=> b!248680 (= res!121844 (not (validKeyInArray!0 (select (arr!5806 (_keys!6723 thiss!1504)) index!297))))))

(assert (= (and d!60429 res!121845) b!248680))

(assert (= (and b!248680 res!121844) b!248681))

(assert (= (and b!248681 res!121847) b!248682))

(assert (= (and d!60429 res!121846) b!248683))

(declare-fun m!264877 () Bool)

(assert (=> b!248681 m!264877))

(declare-fun m!264879 () Bool)

(assert (=> d!60429 m!264879))

(assert (=> b!248683 m!264727))

(declare-fun m!264881 () Bool)

(assert (=> b!248683 m!264881))

(assert (=> b!248683 m!264729))

(declare-fun m!264883 () Bool)

(assert (=> b!248680 m!264883))

(assert (=> b!248680 m!264883))

(declare-fun m!264885 () Bool)

(assert (=> b!248680 m!264885))

(assert (=> b!248517 d!60429))

(declare-fun b!248692 () Bool)

(declare-fun e!161297 () (_ BitVec 32))

(declare-fun call!23312 () (_ BitVec 32))

(assert (=> b!248692 (= e!161297 (bvadd #b00000000000000000000000000000001 call!23312))))

(declare-fun b!248693 () Bool)

(declare-fun e!161298 () (_ BitVec 32))

(assert (=> b!248693 (= e!161298 e!161297)))

(declare-fun c!41678 () Bool)

(assert (=> b!248693 (= c!41678 (validKeyInArray!0 (select (arr!5806 (_keys!6723 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23309 () Bool)

(assert (=> bm!23309 (= call!23312 (arrayCountValidKeys!0 (_keys!6723 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6150 (_keys!6723 thiss!1504))))))

(declare-fun d!60431 () Bool)

(declare-fun lt!124423 () (_ BitVec 32))

(assert (=> d!60431 (and (bvsge lt!124423 #b00000000000000000000000000000000) (bvsle lt!124423 (bvsub (size!6150 (_keys!6723 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60431 (= lt!124423 e!161298)))

(declare-fun c!41677 () Bool)

(assert (=> d!60431 (= c!41677 (bvsge #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))))))

(assert (=> d!60431 (and (bvsle #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6150 (_keys!6723 thiss!1504)) (size!6150 (_keys!6723 thiss!1504))))))

(assert (=> d!60431 (= (arrayCountValidKeys!0 (_keys!6723 thiss!1504) #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))) lt!124423)))

(declare-fun b!248694 () Bool)

(assert (=> b!248694 (= e!161298 #b00000000000000000000000000000000)))

(declare-fun b!248695 () Bool)

(assert (=> b!248695 (= e!161297 call!23312)))

(assert (= (and d!60431 c!41677) b!248694))

(assert (= (and d!60431 (not c!41677)) b!248693))

(assert (= (and b!248693 c!41678) b!248692))

(assert (= (and b!248693 (not c!41678)) b!248695))

(assert (= (or b!248692 b!248695) bm!23309))

(declare-fun m!264887 () Bool)

(assert (=> b!248693 m!264887))

(assert (=> b!248693 m!264887))

(declare-fun m!264889 () Bool)

(assert (=> b!248693 m!264889))

(declare-fun m!264891 () Bool)

(assert (=> bm!23309 m!264891))

(assert (=> b!248517 d!60431))

(declare-fun d!60433 () Bool)

(assert (=> d!60433 (= (validMask!0 (mask!10751 thiss!1504)) (and (or (= (mask!10751 thiss!1504) #b00000000000000000000000000000111) (= (mask!10751 thiss!1504) #b00000000000000000000000000001111) (= (mask!10751 thiss!1504) #b00000000000000000000000000011111) (= (mask!10751 thiss!1504) #b00000000000000000000000000111111) (= (mask!10751 thiss!1504) #b00000000000000000000000001111111) (= (mask!10751 thiss!1504) #b00000000000000000000000011111111) (= (mask!10751 thiss!1504) #b00000000000000000000000111111111) (= (mask!10751 thiss!1504) #b00000000000000000000001111111111) (= (mask!10751 thiss!1504) #b00000000000000000000011111111111) (= (mask!10751 thiss!1504) #b00000000000000000000111111111111) (= (mask!10751 thiss!1504) #b00000000000000000001111111111111) (= (mask!10751 thiss!1504) #b00000000000000000011111111111111) (= (mask!10751 thiss!1504) #b00000000000000000111111111111111) (= (mask!10751 thiss!1504) #b00000000000000001111111111111111) (= (mask!10751 thiss!1504) #b00000000000000011111111111111111) (= (mask!10751 thiss!1504) #b00000000000000111111111111111111) (= (mask!10751 thiss!1504) #b00000000000001111111111111111111) (= (mask!10751 thiss!1504) #b00000000000011111111111111111111) (= (mask!10751 thiss!1504) #b00000000000111111111111111111111) (= (mask!10751 thiss!1504) #b00000000001111111111111111111111) (= (mask!10751 thiss!1504) #b00000000011111111111111111111111) (= (mask!10751 thiss!1504) #b00000000111111111111111111111111) (= (mask!10751 thiss!1504) #b00000001111111111111111111111111) (= (mask!10751 thiss!1504) #b00000011111111111111111111111111) (= (mask!10751 thiss!1504) #b00000111111111111111111111111111) (= (mask!10751 thiss!1504) #b00001111111111111111111111111111) (= (mask!10751 thiss!1504) #b00011111111111111111111111111111) (= (mask!10751 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10751 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!248517 d!60433))

(declare-fun d!60435 () Bool)

(declare-fun res!121854 () Bool)

(declare-fun e!161309 () Bool)

(assert (=> d!60435 (=> res!121854 e!161309)))

(assert (=> d!60435 (= res!121854 (bvsge #b00000000000000000000000000000000 (size!6150 lt!124334)))))

(assert (=> d!60435 (= (arrayNoDuplicates!0 lt!124334 #b00000000000000000000000000000000 Nil!3690) e!161309)))

(declare-fun bm!23312 () Bool)

(declare-fun call!23315 () Bool)

(declare-fun c!41681 () Bool)

(assert (=> bm!23312 (= call!23315 (arrayNoDuplicates!0 lt!124334 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41681 (Cons!3689 (select (arr!5806 lt!124334) #b00000000000000000000000000000000) Nil!3690) Nil!3690)))))

(declare-fun b!248706 () Bool)

(declare-fun e!161308 () Bool)

(declare-fun contains!1786 (List!3693 (_ BitVec 64)) Bool)

(assert (=> b!248706 (= e!161308 (contains!1786 Nil!3690 (select (arr!5806 lt!124334) #b00000000000000000000000000000000)))))

(declare-fun b!248707 () Bool)

(declare-fun e!161310 () Bool)

(assert (=> b!248707 (= e!161309 e!161310)))

(declare-fun res!121856 () Bool)

(assert (=> b!248707 (=> (not res!121856) (not e!161310))))

(assert (=> b!248707 (= res!121856 (not e!161308))))

(declare-fun res!121855 () Bool)

(assert (=> b!248707 (=> (not res!121855) (not e!161308))))

(assert (=> b!248707 (= res!121855 (validKeyInArray!0 (select (arr!5806 lt!124334) #b00000000000000000000000000000000)))))

(declare-fun b!248708 () Bool)

(declare-fun e!161307 () Bool)

(assert (=> b!248708 (= e!161307 call!23315)))

(declare-fun b!248709 () Bool)

(assert (=> b!248709 (= e!161307 call!23315)))

(declare-fun b!248710 () Bool)

(assert (=> b!248710 (= e!161310 e!161307)))

(assert (=> b!248710 (= c!41681 (validKeyInArray!0 (select (arr!5806 lt!124334) #b00000000000000000000000000000000)))))

(assert (= (and d!60435 (not res!121854)) b!248707))

(assert (= (and b!248707 res!121855) b!248706))

(assert (= (and b!248707 res!121856) b!248710))

(assert (= (and b!248710 c!41681) b!248709))

(assert (= (and b!248710 (not c!41681)) b!248708))

(assert (= (or b!248709 b!248708) bm!23312))

(assert (=> bm!23312 m!264867))

(declare-fun m!264893 () Bool)

(assert (=> bm!23312 m!264893))

(assert (=> b!248706 m!264867))

(assert (=> b!248706 m!264867))

(declare-fun m!264895 () Bool)

(assert (=> b!248706 m!264895))

(assert (=> b!248707 m!264867))

(assert (=> b!248707 m!264867))

(assert (=> b!248707 m!264869))

(assert (=> b!248710 m!264867))

(assert (=> b!248710 m!264867))

(assert (=> b!248710 m!264869))

(assert (=> b!248517 d!60435))

(declare-fun d!60437 () Bool)

(declare-fun e!161313 () Bool)

(assert (=> d!60437 e!161313))

(declare-fun res!121859 () Bool)

(assert (=> d!60437 (=> (not res!121859) (not e!161313))))

(assert (=> d!60437 (= res!121859 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6150 (_keys!6723 thiss!1504)))))))

(declare-fun lt!124426 () Unit!7679)

(declare-fun choose!41 (array!12243 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3693) Unit!7679)

(assert (=> d!60437 (= lt!124426 (choose!41 (_keys!6723 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3690))))

(assert (=> d!60437 (bvslt (size!6150 (_keys!6723 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60437 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6723 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3690) lt!124426)))

(declare-fun b!248713 () Bool)

(assert (=> b!248713 (= e!161313 (arrayNoDuplicates!0 (array!12244 (store (arr!5806 (_keys!6723 thiss!1504)) index!297 key!932) (size!6150 (_keys!6723 thiss!1504))) #b00000000000000000000000000000000 Nil!3690))))

(assert (= (and d!60437 res!121859) b!248713))

(declare-fun m!264897 () Bool)

(assert (=> d!60437 m!264897))

(assert (=> b!248713 m!264727))

(declare-fun m!264899 () Bool)

(assert (=> b!248713 m!264899))

(assert (=> b!248517 d!60437))

(declare-fun b!248714 () Bool)

(declare-fun e!161314 () (_ BitVec 32))

(declare-fun call!23316 () (_ BitVec 32))

(assert (=> b!248714 (= e!161314 (bvadd #b00000000000000000000000000000001 call!23316))))

(declare-fun b!248715 () Bool)

(declare-fun e!161315 () (_ BitVec 32))

(assert (=> b!248715 (= e!161315 e!161314)))

(declare-fun c!41683 () Bool)

(assert (=> b!248715 (= c!41683 (validKeyInArray!0 (select (arr!5806 lt!124334) #b00000000000000000000000000000000)))))

(declare-fun bm!23313 () Bool)

(assert (=> bm!23313 (= call!23316 (arrayCountValidKeys!0 lt!124334 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6150 (_keys!6723 thiss!1504))))))

(declare-fun d!60439 () Bool)

(declare-fun lt!124427 () (_ BitVec 32))

(assert (=> d!60439 (and (bvsge lt!124427 #b00000000000000000000000000000000) (bvsle lt!124427 (bvsub (size!6150 lt!124334) #b00000000000000000000000000000000)))))

(assert (=> d!60439 (= lt!124427 e!161315)))

(declare-fun c!41682 () Bool)

(assert (=> d!60439 (= c!41682 (bvsge #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))))))

(assert (=> d!60439 (and (bvsle #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6150 (_keys!6723 thiss!1504)) (size!6150 lt!124334)))))

(assert (=> d!60439 (= (arrayCountValidKeys!0 lt!124334 #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))) lt!124427)))

(declare-fun b!248716 () Bool)

(assert (=> b!248716 (= e!161315 #b00000000000000000000000000000000)))

(declare-fun b!248717 () Bool)

(assert (=> b!248717 (= e!161314 call!23316)))

(assert (= (and d!60439 c!41682) b!248716))

(assert (= (and d!60439 (not c!41682)) b!248715))

(assert (= (and b!248715 c!41683) b!248714))

(assert (= (and b!248715 (not c!41683)) b!248717))

(assert (= (or b!248714 b!248717) bm!23313))

(assert (=> b!248715 m!264867))

(assert (=> b!248715 m!264867))

(assert (=> b!248715 m!264869))

(declare-fun m!264901 () Bool)

(assert (=> bm!23313 m!264901))

(assert (=> b!248517 d!60439))

(declare-fun d!60441 () Bool)

(declare-fun res!121864 () Bool)

(declare-fun e!161320 () Bool)

(assert (=> d!60441 (=> res!121864 e!161320)))

(assert (=> d!60441 (= res!121864 (= (select (arr!5806 (_keys!6723 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60441 (= (arrayContainsKey!0 (_keys!6723 thiss!1504) key!932 #b00000000000000000000000000000000) e!161320)))

(declare-fun b!248722 () Bool)

(declare-fun e!161321 () Bool)

(assert (=> b!248722 (= e!161320 e!161321)))

(declare-fun res!121865 () Bool)

(assert (=> b!248722 (=> (not res!121865) (not e!161321))))

(assert (=> b!248722 (= res!121865 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6150 (_keys!6723 thiss!1504))))))

(declare-fun b!248723 () Bool)

(assert (=> b!248723 (= e!161321 (arrayContainsKey!0 (_keys!6723 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60441 (not res!121864)) b!248722))

(assert (= (and b!248722 res!121865) b!248723))

(assert (=> d!60441 m!264887))

(declare-fun m!264903 () Bool)

(assert (=> b!248723 m!264903))

(assert (=> b!248517 d!60441))

(declare-fun d!60443 () Bool)

(declare-fun e!161324 () Bool)

(assert (=> d!60443 e!161324))

(declare-fun res!121868 () Bool)

(assert (=> d!60443 (=> (not res!121868) (not e!161324))))

(assert (=> d!60443 (= res!121868 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6150 (_keys!6723 thiss!1504)))))))

(declare-fun lt!124430 () Unit!7679)

(declare-fun choose!102 ((_ BitVec 64) array!12243 (_ BitVec 32) (_ BitVec 32)) Unit!7679)

(assert (=> d!60443 (= lt!124430 (choose!102 key!932 (_keys!6723 thiss!1504) index!297 (mask!10751 thiss!1504)))))

(assert (=> d!60443 (validMask!0 (mask!10751 thiss!1504))))

(assert (=> d!60443 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6723 thiss!1504) index!297 (mask!10751 thiss!1504)) lt!124430)))

(declare-fun b!248726 () Bool)

(assert (=> b!248726 (= e!161324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12244 (store (arr!5806 (_keys!6723 thiss!1504)) index!297 key!932) (size!6150 (_keys!6723 thiss!1504))) (mask!10751 thiss!1504)))))

(assert (= (and d!60443 res!121868) b!248726))

(declare-fun m!264905 () Bool)

(assert (=> d!60443 m!264905))

(assert (=> d!60443 m!264719))

(assert (=> b!248726 m!264727))

(declare-fun m!264907 () Bool)

(assert (=> b!248726 m!264907))

(assert (=> b!248517 d!60443))

(declare-fun d!60445 () Bool)

(assert (=> d!60445 (= (array_inv!3829 (_keys!6723 thiss!1504)) (bvsge (size!6150 (_keys!6723 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248521 d!60445))

(declare-fun d!60447 () Bool)

(assert (=> d!60447 (= (array_inv!3830 (_values!4581 thiss!1504)) (bvsge (size!6149 (_values!4581 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248521 d!60447))

(declare-fun b!248739 () Bool)

(declare-fun e!161332 () SeekEntryResult!1110)

(declare-fun lt!124437 () SeekEntryResult!1110)

(assert (=> b!248739 (= e!161332 (MissingZero!1110 (index!6612 lt!124437)))))

(declare-fun b!248740 () Bool)

(declare-fun e!161331 () SeekEntryResult!1110)

(assert (=> b!248740 (= e!161331 (Found!1110 (index!6612 lt!124437)))))

(declare-fun b!248741 () Bool)

(declare-fun e!161333 () SeekEntryResult!1110)

(assert (=> b!248741 (= e!161333 e!161331)))

(declare-fun lt!124438 () (_ BitVec 64))

(assert (=> b!248741 (= lt!124438 (select (arr!5806 (_keys!6723 thiss!1504)) (index!6612 lt!124437)))))

(declare-fun c!41691 () Bool)

(assert (=> b!248741 (= c!41691 (= lt!124438 key!932))))

(declare-fun d!60449 () Bool)

(declare-fun lt!124439 () SeekEntryResult!1110)

(assert (=> d!60449 (and (or ((_ is Undefined!1110) lt!124439) (not ((_ is Found!1110) lt!124439)) (and (bvsge (index!6611 lt!124439) #b00000000000000000000000000000000) (bvslt (index!6611 lt!124439) (size!6150 (_keys!6723 thiss!1504))))) (or ((_ is Undefined!1110) lt!124439) ((_ is Found!1110) lt!124439) (not ((_ is MissingZero!1110) lt!124439)) (and (bvsge (index!6610 lt!124439) #b00000000000000000000000000000000) (bvslt (index!6610 lt!124439) (size!6150 (_keys!6723 thiss!1504))))) (or ((_ is Undefined!1110) lt!124439) ((_ is Found!1110) lt!124439) ((_ is MissingZero!1110) lt!124439) (not ((_ is MissingVacant!1110) lt!124439)) (and (bvsge (index!6613 lt!124439) #b00000000000000000000000000000000) (bvslt (index!6613 lt!124439) (size!6150 (_keys!6723 thiss!1504))))) (or ((_ is Undefined!1110) lt!124439) (ite ((_ is Found!1110) lt!124439) (= (select (arr!5806 (_keys!6723 thiss!1504)) (index!6611 lt!124439)) key!932) (ite ((_ is MissingZero!1110) lt!124439) (= (select (arr!5806 (_keys!6723 thiss!1504)) (index!6610 lt!124439)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1110) lt!124439) (= (select (arr!5806 (_keys!6723 thiss!1504)) (index!6613 lt!124439)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60449 (= lt!124439 e!161333)))

(declare-fun c!41692 () Bool)

(assert (=> d!60449 (= c!41692 (and ((_ is Intermediate!1110) lt!124437) (undefined!1922 lt!124437)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12243 (_ BitVec 32)) SeekEntryResult!1110)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60449 (= lt!124437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10751 thiss!1504)) key!932 (_keys!6723 thiss!1504) (mask!10751 thiss!1504)))))

(assert (=> d!60449 (validMask!0 (mask!10751 thiss!1504))))

(assert (=> d!60449 (= (seekEntryOrOpen!0 key!932 (_keys!6723 thiss!1504) (mask!10751 thiss!1504)) lt!124439)))

(declare-fun b!248742 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12243 (_ BitVec 32)) SeekEntryResult!1110)

(assert (=> b!248742 (= e!161332 (seekKeyOrZeroReturnVacant!0 (x!24589 lt!124437) (index!6612 lt!124437) (index!6612 lt!124437) key!932 (_keys!6723 thiss!1504) (mask!10751 thiss!1504)))))

(declare-fun b!248743 () Bool)

(assert (=> b!248743 (= e!161333 Undefined!1110)))

(declare-fun b!248744 () Bool)

(declare-fun c!41690 () Bool)

(assert (=> b!248744 (= c!41690 (= lt!124438 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248744 (= e!161331 e!161332)))

(assert (= (and d!60449 c!41692) b!248743))

(assert (= (and d!60449 (not c!41692)) b!248741))

(assert (= (and b!248741 c!41691) b!248740))

(assert (= (and b!248741 (not c!41691)) b!248744))

(assert (= (and b!248744 c!41690) b!248739))

(assert (= (and b!248744 (not c!41690)) b!248742))

(declare-fun m!264909 () Bool)

(assert (=> b!248741 m!264909))

(assert (=> d!60449 m!264719))

(declare-fun m!264911 () Bool)

(assert (=> d!60449 m!264911))

(declare-fun m!264913 () Bool)

(assert (=> d!60449 m!264913))

(declare-fun m!264915 () Bool)

(assert (=> d!60449 m!264915))

(assert (=> d!60449 m!264911))

(declare-fun m!264917 () Bool)

(assert (=> d!60449 m!264917))

(declare-fun m!264919 () Bool)

(assert (=> d!60449 m!264919))

(declare-fun m!264921 () Bool)

(assert (=> b!248742 m!264921))

(assert (=> b!248514 d!60449))

(declare-fun b!248761 () Bool)

(declare-fun e!161343 () Bool)

(declare-fun call!23322 () Bool)

(assert (=> b!248761 (= e!161343 (not call!23322))))

(declare-fun b!248762 () Bool)

(declare-fun lt!124444 () SeekEntryResult!1110)

(assert (=> b!248762 (and (bvsge (index!6610 lt!124444) #b00000000000000000000000000000000) (bvslt (index!6610 lt!124444) (size!6150 (_keys!6723 thiss!1504))))))

(declare-fun res!121878 () Bool)

(assert (=> b!248762 (= res!121878 (= (select (arr!5806 (_keys!6723 thiss!1504)) (index!6610 lt!124444)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161342 () Bool)

(assert (=> b!248762 (=> (not res!121878) (not e!161342))))

(declare-fun d!60451 () Bool)

(declare-fun e!161344 () Bool)

(assert (=> d!60451 e!161344))

(declare-fun c!41698 () Bool)

(assert (=> d!60451 (= c!41698 ((_ is MissingZero!1110) lt!124444))))

(assert (=> d!60451 (= lt!124444 (seekEntryOrOpen!0 key!932 (_keys!6723 thiss!1504) (mask!10751 thiss!1504)))))

(declare-fun lt!124445 () Unit!7679)

(declare-fun choose!1178 (array!12243 array!12241 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 64) Int) Unit!7679)

(assert (=> d!60451 (= lt!124445 (choose!1178 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 (defaultEntry!4598 thiss!1504)))))

(assert (=> d!60451 (validMask!0 (mask!10751 thiss!1504))))

(assert (=> d!60451 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!391 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 (defaultEntry!4598 thiss!1504)) lt!124445)))

(declare-fun b!248763 () Bool)

(assert (=> b!248763 (= e!161344 e!161342)))

(declare-fun res!121880 () Bool)

(declare-fun call!23321 () Bool)

(assert (=> b!248763 (= res!121880 call!23321)))

(assert (=> b!248763 (=> (not res!121880) (not e!161342))))

(declare-fun bm!23318 () Bool)

(assert (=> bm!23318 (= call!23322 (arrayContainsKey!0 (_keys!6723 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!23319 () Bool)

(assert (=> bm!23319 (= call!23321 (inRange!0 (ite c!41698 (index!6610 lt!124444) (index!6613 lt!124444)) (mask!10751 thiss!1504)))))

(declare-fun b!248764 () Bool)

(declare-fun e!161345 () Bool)

(assert (=> b!248764 (= e!161344 e!161345)))

(declare-fun c!41697 () Bool)

(assert (=> b!248764 (= c!41697 ((_ is MissingVacant!1110) lt!124444))))

(declare-fun b!248765 () Bool)

(assert (=> b!248765 (= e!161342 (not call!23322))))

(declare-fun b!248766 () Bool)

(assert (=> b!248766 (= e!161345 ((_ is Undefined!1110) lt!124444))))

(declare-fun b!248767 () Bool)

(declare-fun res!121877 () Bool)

(assert (=> b!248767 (=> (not res!121877) (not e!161343))))

(assert (=> b!248767 (= res!121877 (= (select (arr!5806 (_keys!6723 thiss!1504)) (index!6613 lt!124444)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248767 (and (bvsge (index!6613 lt!124444) #b00000000000000000000000000000000) (bvslt (index!6613 lt!124444) (size!6150 (_keys!6723 thiss!1504))))))

(declare-fun b!248768 () Bool)

(declare-fun res!121879 () Bool)

(assert (=> b!248768 (=> (not res!121879) (not e!161343))))

(assert (=> b!248768 (= res!121879 call!23321)))

(assert (=> b!248768 (= e!161345 e!161343)))

(assert (= (and d!60451 c!41698) b!248763))

(assert (= (and d!60451 (not c!41698)) b!248764))

(assert (= (and b!248763 res!121880) b!248762))

(assert (= (and b!248762 res!121878) b!248765))

(assert (= (and b!248764 c!41697) b!248768))

(assert (= (and b!248764 (not c!41697)) b!248766))

(assert (= (and b!248768 res!121879) b!248767))

(assert (= (and b!248767 res!121877) b!248761))

(assert (= (or b!248763 b!248768) bm!23319))

(assert (= (or b!248765 b!248761) bm!23318))

(assert (=> bm!23318 m!264715))

(assert (=> d!60451 m!264737))

(declare-fun m!264923 () Bool)

(assert (=> d!60451 m!264923))

(assert (=> d!60451 m!264719))

(declare-fun m!264925 () Bool)

(assert (=> b!248762 m!264925))

(declare-fun m!264927 () Bool)

(assert (=> bm!23319 m!264927))

(declare-fun m!264929 () Bool)

(assert (=> b!248767 m!264929))

(assert (=> b!248518 d!60451))

(assert (=> bm!23290 d!60441))

(declare-fun d!60453 () Bool)

(assert (=> d!60453 (= (inRange!0 index!297 (mask!10751 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10751 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!248505 d!60453))

(declare-fun d!60455 () Bool)

(declare-fun e!161350 () Bool)

(assert (=> d!60455 e!161350))

(declare-fun res!121883 () Bool)

(assert (=> d!60455 (=> res!121883 e!161350)))

(declare-fun lt!124454 () Bool)

(assert (=> d!60455 (= res!121883 (not lt!124454))))

(declare-fun lt!124456 () Bool)

(assert (=> d!60455 (= lt!124454 lt!124456)))

(declare-fun lt!124455 () Unit!7679)

(declare-fun e!161351 () Unit!7679)

(assert (=> d!60455 (= lt!124455 e!161351)))

(declare-fun c!41701 () Bool)

(assert (=> d!60455 (= c!41701 lt!124456)))

(declare-fun containsKey!285 (List!3692 (_ BitVec 64)) Bool)

(assert (=> d!60455 (= lt!124456 (containsKey!285 (toList!1862 (getCurrentListMap!1371 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504))) key!932))))

(assert (=> d!60455 (= (contains!1783 (getCurrentListMap!1371 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)) key!932) lt!124454)))

(declare-fun b!248775 () Bool)

(declare-fun lt!124457 () Unit!7679)

(assert (=> b!248775 (= e!161351 lt!124457)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!234 (List!3692 (_ BitVec 64)) Unit!7679)

(assert (=> b!248775 (= lt!124457 (lemmaContainsKeyImpliesGetValueByKeyDefined!234 (toList!1862 (getCurrentListMap!1371 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504))) key!932))))

(declare-datatypes ((Option!299 0))(
  ( (Some!298 (v!5336 V!8273)) (None!297) )
))
(declare-fun isDefined!235 (Option!299) Bool)

(declare-fun getValueByKey!293 (List!3692 (_ BitVec 64)) Option!299)

(assert (=> b!248775 (isDefined!235 (getValueByKey!293 (toList!1862 (getCurrentListMap!1371 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504))) key!932))))

(declare-fun b!248776 () Bool)

(declare-fun Unit!7691 () Unit!7679)

(assert (=> b!248776 (= e!161351 Unit!7691)))

(declare-fun b!248777 () Bool)

(assert (=> b!248777 (= e!161350 (isDefined!235 (getValueByKey!293 (toList!1862 (getCurrentListMap!1371 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504))) key!932)))))

(assert (= (and d!60455 c!41701) b!248775))

(assert (= (and d!60455 (not c!41701)) b!248776))

(assert (= (and d!60455 (not res!121883)) b!248777))

(declare-fun m!264931 () Bool)

(assert (=> d!60455 m!264931))

(declare-fun m!264933 () Bool)

(assert (=> b!248775 m!264933))

(declare-fun m!264935 () Bool)

(assert (=> b!248775 m!264935))

(assert (=> b!248775 m!264935))

(declare-fun m!264937 () Bool)

(assert (=> b!248775 m!264937))

(assert (=> b!248777 m!264935))

(assert (=> b!248777 m!264935))

(assert (=> b!248777 m!264937))

(assert (=> b!248505 d!60455))

(declare-fun b!248820 () Bool)

(declare-fun e!161383 () Bool)

(declare-fun e!161381 () Bool)

(assert (=> b!248820 (= e!161383 e!161381)))

(declare-fun res!121908 () Bool)

(declare-fun call!23338 () Bool)

(assert (=> b!248820 (= res!121908 call!23338)))

(assert (=> b!248820 (=> (not res!121908) (not e!161381))))

(declare-fun bm!23334 () Bool)

(declare-fun call!23340 () ListLongMap!3693)

(declare-fun call!23342 () ListLongMap!3693)

(assert (=> bm!23334 (= call!23340 call!23342)))

(declare-fun b!248821 () Bool)

(declare-fun e!161384 () ListLongMap!3693)

(declare-fun e!161382 () ListLongMap!3693)

(assert (=> b!248821 (= e!161384 e!161382)))

(declare-fun c!41715 () Bool)

(assert (=> b!248821 (= c!41715 (and (not (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!248822 () Bool)

(declare-fun res!121906 () Bool)

(declare-fun e!161378 () Bool)

(assert (=> b!248822 (=> (not res!121906) (not e!161378))))

(declare-fun e!161386 () Bool)

(assert (=> b!248822 (= res!121906 e!161386)))

(declare-fun res!121910 () Bool)

(assert (=> b!248822 (=> res!121910 e!161386)))

(declare-fun e!161388 () Bool)

(assert (=> b!248822 (= res!121910 (not e!161388))))

(declare-fun res!121909 () Bool)

(assert (=> b!248822 (=> (not res!121909) (not e!161388))))

(assert (=> b!248822 (= res!121909 (bvslt #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))))))

(declare-fun d!60457 () Bool)

(assert (=> d!60457 e!161378))

(declare-fun res!121903 () Bool)

(assert (=> d!60457 (=> (not res!121903) (not e!161378))))

(assert (=> d!60457 (= res!121903 (or (bvsge #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))))))))

(declare-fun lt!124516 () ListLongMap!3693)

(declare-fun lt!124510 () ListLongMap!3693)

(assert (=> d!60457 (= lt!124516 lt!124510)))

(declare-fun lt!124509 () Unit!7679)

(declare-fun e!161385 () Unit!7679)

(assert (=> d!60457 (= lt!124509 e!161385)))

(declare-fun c!41718 () Bool)

(declare-fun e!161387 () Bool)

(assert (=> d!60457 (= c!41718 e!161387)))

(declare-fun res!121904 () Bool)

(assert (=> d!60457 (=> (not res!121904) (not e!161387))))

(assert (=> d!60457 (= res!121904 (bvslt #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))))))

(assert (=> d!60457 (= lt!124510 e!161384)))

(declare-fun c!41719 () Bool)

(assert (=> d!60457 (= c!41719 (and (not (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60457 (validMask!0 (mask!10751 thiss!1504))))

(assert (=> d!60457 (= (getCurrentListMap!1371 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)) lt!124516)))

(declare-fun b!248823 () Bool)

(declare-fun e!161389 () Bool)

(assert (=> b!248823 (= e!161378 e!161389)))

(declare-fun c!41716 () Bool)

(assert (=> b!248823 (= c!41716 (not (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!248824 () Bool)

(declare-fun c!41714 () Bool)

(assert (=> b!248824 (= c!41714 (and (not (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!161390 () ListLongMap!3693)

(assert (=> b!248824 (= e!161382 e!161390)))

(declare-fun b!248825 () Bool)

(declare-fun Unit!7692 () Unit!7679)

(assert (=> b!248825 (= e!161385 Unit!7692)))

(declare-fun b!248826 () Bool)

(declare-fun e!161380 () Bool)

(assert (=> b!248826 (= e!161386 e!161380)))

(declare-fun res!121907 () Bool)

(assert (=> b!248826 (=> (not res!121907) (not e!161380))))

(assert (=> b!248826 (= res!121907 (contains!1783 lt!124516 (select (arr!5806 (_keys!6723 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!248826 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))))))

(declare-fun b!248827 () Bool)

(declare-fun e!161379 () Bool)

(assert (=> b!248827 (= e!161389 e!161379)))

(declare-fun res!121905 () Bool)

(declare-fun call!23337 () Bool)

(assert (=> b!248827 (= res!121905 call!23337)))

(assert (=> b!248827 (=> (not res!121905) (not e!161379))))

(declare-fun bm!23335 () Bool)

(assert (=> bm!23335 (= call!23338 (contains!1783 lt!124516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248828 () Bool)

(declare-fun apply!237 (ListLongMap!3693 (_ BitVec 64)) V!8273)

(declare-fun get!2976 (ValueCell!2891 V!8273) V!8273)

(declare-fun dynLambda!571 (Int (_ BitVec 64)) V!8273)

(assert (=> b!248828 (= e!161380 (= (apply!237 lt!124516 (select (arr!5806 (_keys!6723 thiss!1504)) #b00000000000000000000000000000000)) (get!2976 (select (arr!5805 (_values!4581 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!571 (defaultEntry!4598 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!248828 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6149 (_values!4581 thiss!1504))))))

(assert (=> b!248828 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6150 (_keys!6723 thiss!1504))))))

(declare-fun bm!23336 () Bool)

(declare-fun call!23341 () ListLongMap!3693)

(declare-fun call!23339 () ListLongMap!3693)

(assert (=> bm!23336 (= call!23341 call!23339)))

(declare-fun bm!23337 () Bool)

(declare-fun call!23343 () ListLongMap!3693)

(assert (=> bm!23337 (= call!23342 call!23343)))

(declare-fun b!248829 () Bool)

(assert (=> b!248829 (= e!161389 (not call!23337))))

(declare-fun b!248830 () Bool)

(assert (=> b!248830 (= e!161379 (= (apply!237 lt!124516 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4439 thiss!1504)))))

(declare-fun bm!23338 () Bool)

(declare-fun +!670 (ListLongMap!3693 tuple2!4790) ListLongMap!3693)

(assert (=> bm!23338 (= call!23339 (+!670 (ite c!41719 call!23343 (ite c!41715 call!23342 call!23340)) (ite (or c!41719 c!41715) (tuple2!4791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4439 thiss!1504)) (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4439 thiss!1504)))))))

(declare-fun b!248831 () Bool)

(assert (=> b!248831 (= e!161383 (not call!23338))))

(declare-fun b!248832 () Bool)

(assert (=> b!248832 (= e!161390 call!23341)))

(declare-fun b!248833 () Bool)

(declare-fun lt!124515 () Unit!7679)

(assert (=> b!248833 (= e!161385 lt!124515)))

(declare-fun lt!124519 () ListLongMap!3693)

(declare-fun getCurrentListMapNoExtraKeys!553 (array!12243 array!12241 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 32) Int) ListLongMap!3693)

(assert (=> b!248833 (= lt!124519 (getCurrentListMapNoExtraKeys!553 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)))))

(declare-fun lt!124512 () (_ BitVec 64))

(assert (=> b!248833 (= lt!124512 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124511 () (_ BitVec 64))

(assert (=> b!248833 (= lt!124511 (select (arr!5806 (_keys!6723 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124520 () Unit!7679)

(declare-fun addStillContains!213 (ListLongMap!3693 (_ BitVec 64) V!8273 (_ BitVec 64)) Unit!7679)

(assert (=> b!248833 (= lt!124520 (addStillContains!213 lt!124519 lt!124512 (zeroValue!4439 thiss!1504) lt!124511))))

(assert (=> b!248833 (contains!1783 (+!670 lt!124519 (tuple2!4791 lt!124512 (zeroValue!4439 thiss!1504))) lt!124511)))

(declare-fun lt!124514 () Unit!7679)

(assert (=> b!248833 (= lt!124514 lt!124520)))

(declare-fun lt!124502 () ListLongMap!3693)

(assert (=> b!248833 (= lt!124502 (getCurrentListMapNoExtraKeys!553 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)))))

(declare-fun lt!124507 () (_ BitVec 64))

(assert (=> b!248833 (= lt!124507 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124518 () (_ BitVec 64))

(assert (=> b!248833 (= lt!124518 (select (arr!5806 (_keys!6723 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124513 () Unit!7679)

(declare-fun addApplyDifferent!213 (ListLongMap!3693 (_ BitVec 64) V!8273 (_ BitVec 64)) Unit!7679)

(assert (=> b!248833 (= lt!124513 (addApplyDifferent!213 lt!124502 lt!124507 (minValue!4439 thiss!1504) lt!124518))))

(assert (=> b!248833 (= (apply!237 (+!670 lt!124502 (tuple2!4791 lt!124507 (minValue!4439 thiss!1504))) lt!124518) (apply!237 lt!124502 lt!124518))))

(declare-fun lt!124523 () Unit!7679)

(assert (=> b!248833 (= lt!124523 lt!124513)))

(declare-fun lt!124521 () ListLongMap!3693)

(assert (=> b!248833 (= lt!124521 (getCurrentListMapNoExtraKeys!553 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)))))

(declare-fun lt!124504 () (_ BitVec 64))

(assert (=> b!248833 (= lt!124504 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124508 () (_ BitVec 64))

(assert (=> b!248833 (= lt!124508 (select (arr!5806 (_keys!6723 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124522 () Unit!7679)

(assert (=> b!248833 (= lt!124522 (addApplyDifferent!213 lt!124521 lt!124504 (zeroValue!4439 thiss!1504) lt!124508))))

(assert (=> b!248833 (= (apply!237 (+!670 lt!124521 (tuple2!4791 lt!124504 (zeroValue!4439 thiss!1504))) lt!124508) (apply!237 lt!124521 lt!124508))))

(declare-fun lt!124505 () Unit!7679)

(assert (=> b!248833 (= lt!124505 lt!124522)))

(declare-fun lt!124503 () ListLongMap!3693)

(assert (=> b!248833 (= lt!124503 (getCurrentListMapNoExtraKeys!553 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)))))

(declare-fun lt!124517 () (_ BitVec 64))

(assert (=> b!248833 (= lt!124517 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124506 () (_ BitVec 64))

(assert (=> b!248833 (= lt!124506 (select (arr!5806 (_keys!6723 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248833 (= lt!124515 (addApplyDifferent!213 lt!124503 lt!124517 (minValue!4439 thiss!1504) lt!124506))))

(assert (=> b!248833 (= (apply!237 (+!670 lt!124503 (tuple2!4791 lt!124517 (minValue!4439 thiss!1504))) lt!124506) (apply!237 lt!124503 lt!124506))))

(declare-fun bm!23339 () Bool)

(assert (=> bm!23339 (= call!23343 (getCurrentListMapNoExtraKeys!553 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)))))

(declare-fun b!248834 () Bool)

(assert (=> b!248834 (= e!161388 (validKeyInArray!0 (select (arr!5806 (_keys!6723 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248835 () Bool)

(assert (=> b!248835 (= e!161384 (+!670 call!23339 (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4439 thiss!1504))))))

(declare-fun b!248836 () Bool)

(assert (=> b!248836 (= e!161387 (validKeyInArray!0 (select (arr!5806 (_keys!6723 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23340 () Bool)

(assert (=> bm!23340 (= call!23337 (contains!1783 lt!124516 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248837 () Bool)

(declare-fun res!121902 () Bool)

(assert (=> b!248837 (=> (not res!121902) (not e!161378))))

(assert (=> b!248837 (= res!121902 e!161383)))

(declare-fun c!41717 () Bool)

(assert (=> b!248837 (= c!41717 (not (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!248838 () Bool)

(assert (=> b!248838 (= e!161390 call!23340)))

(declare-fun b!248839 () Bool)

(assert (=> b!248839 (= e!161381 (= (apply!237 lt!124516 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4439 thiss!1504)))))

(declare-fun b!248840 () Bool)

(assert (=> b!248840 (= e!161382 call!23341)))

(assert (= (and d!60457 c!41719) b!248835))

(assert (= (and d!60457 (not c!41719)) b!248821))

(assert (= (and b!248821 c!41715) b!248840))

(assert (= (and b!248821 (not c!41715)) b!248824))

(assert (= (and b!248824 c!41714) b!248832))

(assert (= (and b!248824 (not c!41714)) b!248838))

(assert (= (or b!248832 b!248838) bm!23334))

(assert (= (or b!248840 bm!23334) bm!23337))

(assert (= (or b!248840 b!248832) bm!23336))

(assert (= (or b!248835 bm!23337) bm!23339))

(assert (= (or b!248835 bm!23336) bm!23338))

(assert (= (and d!60457 res!121904) b!248836))

(assert (= (and d!60457 c!41718) b!248833))

(assert (= (and d!60457 (not c!41718)) b!248825))

(assert (= (and d!60457 res!121903) b!248822))

(assert (= (and b!248822 res!121909) b!248834))

(assert (= (and b!248822 (not res!121910)) b!248826))

(assert (= (and b!248826 res!121907) b!248828))

(assert (= (and b!248822 res!121906) b!248837))

(assert (= (and b!248837 c!41717) b!248820))

(assert (= (and b!248837 (not c!41717)) b!248831))

(assert (= (and b!248820 res!121908) b!248839))

(assert (= (or b!248820 b!248831) bm!23335))

(assert (= (and b!248837 res!121902) b!248823))

(assert (= (and b!248823 c!41716) b!248827))

(assert (= (and b!248823 (not c!41716)) b!248829))

(assert (= (and b!248827 res!121905) b!248830))

(assert (= (or b!248827 b!248829) bm!23340))

(declare-fun b_lambda!8041 () Bool)

(assert (=> (not b_lambda!8041) (not b!248828)))

(declare-fun t!8716 () Bool)

(declare-fun tb!2979 () Bool)

(assert (=> (and b!248521 (= (defaultEntry!4598 thiss!1504) (defaultEntry!4598 thiss!1504)) t!8716) tb!2979))

(declare-fun result!5275 () Bool)

(assert (=> tb!2979 (= result!5275 tp_is_empty!6469)))

(assert (=> b!248828 t!8716))

(declare-fun b_and!13593 () Bool)

(assert (= b_and!13587 (and (=> t!8716 result!5275) b_and!13593)))

(declare-fun m!264939 () Bool)

(assert (=> bm!23338 m!264939))

(declare-fun m!264941 () Bool)

(assert (=> b!248839 m!264941))

(assert (=> b!248836 m!264887))

(assert (=> b!248836 m!264887))

(assert (=> b!248836 m!264889))

(assert (=> b!248826 m!264887))

(assert (=> b!248826 m!264887))

(declare-fun m!264943 () Bool)

(assert (=> b!248826 m!264943))

(declare-fun m!264945 () Bool)

(assert (=> bm!23335 m!264945))

(declare-fun m!264947 () Bool)

(assert (=> bm!23340 m!264947))

(declare-fun m!264949 () Bool)

(assert (=> b!248833 m!264949))

(assert (=> b!248833 m!264887))

(declare-fun m!264951 () Bool)

(assert (=> b!248833 m!264951))

(declare-fun m!264953 () Bool)

(assert (=> b!248833 m!264953))

(declare-fun m!264955 () Bool)

(assert (=> b!248833 m!264955))

(declare-fun m!264957 () Bool)

(assert (=> b!248833 m!264957))

(declare-fun m!264959 () Bool)

(assert (=> b!248833 m!264959))

(declare-fun m!264961 () Bool)

(assert (=> b!248833 m!264961))

(declare-fun m!264963 () Bool)

(assert (=> b!248833 m!264963))

(assert (=> b!248833 m!264957))

(declare-fun m!264965 () Bool)

(assert (=> b!248833 m!264965))

(declare-fun m!264967 () Bool)

(assert (=> b!248833 m!264967))

(assert (=> b!248833 m!264951))

(declare-fun m!264969 () Bool)

(assert (=> b!248833 m!264969))

(declare-fun m!264971 () Bool)

(assert (=> b!248833 m!264971))

(declare-fun m!264973 () Bool)

(assert (=> b!248833 m!264973))

(declare-fun m!264975 () Bool)

(assert (=> b!248833 m!264975))

(assert (=> b!248833 m!264953))

(declare-fun m!264977 () Bool)

(assert (=> b!248833 m!264977))

(assert (=> b!248833 m!264971))

(declare-fun m!264979 () Bool)

(assert (=> b!248833 m!264979))

(assert (=> b!248834 m!264887))

(assert (=> b!248834 m!264887))

(assert (=> b!248834 m!264889))

(assert (=> bm!23339 m!264955))

(assert (=> b!248828 m!264887))

(declare-fun m!264981 () Bool)

(assert (=> b!248828 m!264981))

(declare-fun m!264983 () Bool)

(assert (=> b!248828 m!264983))

(assert (=> b!248828 m!264887))

(declare-fun m!264985 () Bool)

(assert (=> b!248828 m!264985))

(assert (=> b!248828 m!264983))

(assert (=> b!248828 m!264981))

(declare-fun m!264987 () Bool)

(assert (=> b!248828 m!264987))

(declare-fun m!264989 () Bool)

(assert (=> b!248835 m!264989))

(assert (=> d!60457 m!264719))

(declare-fun m!264991 () Bool)

(assert (=> b!248830 m!264991))

(assert (=> b!248505 d!60457))

(declare-fun d!60459 () Bool)

(assert (=> d!60459 (contains!1783 (getCurrentListMap!1371 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)) key!932)))

(declare-fun lt!124526 () Unit!7679)

(declare-fun choose!1179 (array!12243 array!12241 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 64) (_ BitVec 32) Int) Unit!7679)

(assert (=> d!60459 (= lt!124526 (choose!1179 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)))))

(assert (=> d!60459 (validMask!0 (mask!10751 thiss!1504))))

(assert (=> d!60459 (= (lemmaArrayContainsKeyThenInListMap!202 (_keys!6723 thiss!1504) (_values!4581 thiss!1504) (mask!10751 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)) lt!124526)))

(declare-fun bs!8914 () Bool)

(assert (= bs!8914 d!60459))

(assert (=> bs!8914 m!264745))

(assert (=> bs!8914 m!264745))

(assert (=> bs!8914 m!264747))

(declare-fun m!264993 () Bool)

(assert (=> bs!8914 m!264993))

(assert (=> bs!8914 m!264719))

(assert (=> b!248523 d!60459))

(declare-fun b!248849 () Bool)

(declare-fun e!161396 () Bool)

(assert (=> b!248849 (= e!161396 tp_is_empty!6469)))

(declare-fun mapNonEmpty!10994 () Bool)

(declare-fun mapRes!10994 () Bool)

(declare-fun tp!23090 () Bool)

(assert (=> mapNonEmpty!10994 (= mapRes!10994 (and tp!23090 e!161396))))

(declare-fun mapRest!10994 () (Array (_ BitVec 32) ValueCell!2891))

(declare-fun mapKey!10994 () (_ BitVec 32))

(declare-fun mapValue!10994 () ValueCell!2891)

(assert (=> mapNonEmpty!10994 (= mapRest!10985 (store mapRest!10994 mapKey!10994 mapValue!10994))))

(declare-fun mapIsEmpty!10994 () Bool)

(assert (=> mapIsEmpty!10994 mapRes!10994))

(declare-fun condMapEmpty!10994 () Bool)

(declare-fun mapDefault!10994 () ValueCell!2891)

(assert (=> mapNonEmpty!10985 (= condMapEmpty!10994 (= mapRest!10985 ((as const (Array (_ BitVec 32) ValueCell!2891)) mapDefault!10994)))))

(declare-fun e!161395 () Bool)

(assert (=> mapNonEmpty!10985 (= tp!23075 (and e!161395 mapRes!10994))))

(declare-fun b!248850 () Bool)

(assert (=> b!248850 (= e!161395 tp_is_empty!6469)))

(assert (= (and mapNonEmpty!10985 condMapEmpty!10994) mapIsEmpty!10994))

(assert (= (and mapNonEmpty!10985 (not condMapEmpty!10994)) mapNonEmpty!10994))

(assert (= (and mapNonEmpty!10994 ((_ is ValueCellFull!2891) mapValue!10994)) b!248849))

(assert (= (and mapNonEmpty!10985 ((_ is ValueCellFull!2891) mapDefault!10994)) b!248850))

(declare-fun m!264995 () Bool)

(assert (=> mapNonEmpty!10994 m!264995))

(declare-fun b_lambda!8043 () Bool)

(assert (= b_lambda!8041 (or (and b!248521 b_free!6607) b_lambda!8043)))

(check-sat (not bm!23313) (not mapNonEmpty!10994) (not d!60429) (not bm!23318) (not b!248683) (not b!248828) (not b!248681) (not b!248707) (not b!248777) (not d!60449) (not bm!23319) (not bm!23309) (not d!60437) (not b!248835) (not b!248706) (not b!248658) (not b!248726) tp_is_empty!6469 (not b!248710) (not b_lambda!8043) (not b!248715) (not b!248834) (not b!248723) (not b!248830) (not d!60457) (not bm!23339) (not bm!23340) (not b!248836) (not d!60459) (not b!248670) (not b!248669) (not bm!23335) (not b!248713) (not d!60455) (not b!248652) (not bm!23306) (not b!248833) (not b!248680) (not d!60423) (not b!248693) (not b!248653) (not b!248775) (not b_next!6607) (not b!248651) (not d!60443) (not bm!23312) (not b!248826) b_and!13593 (not d!60451) (not d!60425) (not b!248839) (not bm!23338) (not b!248742))
(check-sat b_and!13593 (not b_next!6607))
