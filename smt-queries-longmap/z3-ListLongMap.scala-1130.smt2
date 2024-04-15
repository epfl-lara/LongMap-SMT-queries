; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23222 () Bool)

(assert start!23222)

(declare-fun b!243624 () Bool)

(declare-fun b_free!6529 () Bool)

(declare-fun b_next!6529 () Bool)

(assert (=> b!243624 (= b_free!6529 (not b_next!6529))))

(declare-fun tp!22810 () Bool)

(declare-fun b_and!13485 () Bool)

(assert (=> b!243624 (= tp!22810 b_and!13485)))

(declare-fun mapIsEmpty!10837 () Bool)

(declare-fun mapRes!10837 () Bool)

(assert (=> mapIsEmpty!10837 mapRes!10837))

(declare-fun b!243618 () Bool)

(declare-fun e!158090 () Bool)

(declare-fun call!22706 () Bool)

(assert (=> b!243618 (= e!158090 (not call!22706))))

(declare-fun b!243619 () Bool)

(declare-fun e!158098 () Bool)

(declare-fun e!158094 () Bool)

(assert (=> b!243619 (= e!158098 e!158094)))

(declare-fun res!119411 () Bool)

(declare-fun call!22707 () Bool)

(assert (=> b!243619 (= res!119411 call!22707)))

(assert (=> b!243619 (=> (not res!119411) (not e!158094))))

(declare-fun b!243620 () Bool)

(declare-fun e!158103 () Bool)

(declare-fun e!158091 () Bool)

(assert (=> b!243620 (= e!158103 e!158091)))

(declare-fun res!119415 () Bool)

(assert (=> b!243620 (=> (not res!119415) (not e!158091))))

(declare-datatypes ((V!8169 0))(
  ( (V!8170 (val!3240 Int)) )
))
(declare-datatypes ((ValueCell!2852 0))(
  ( (ValueCellFull!2852 (v!5281 V!8169)) (EmptyCell!2852) )
))
(declare-datatypes ((array!12065 0))(
  ( (array!12066 (arr!5727 (Array (_ BitVec 32) ValueCell!2852)) (size!6070 (_ BitVec 32))) )
))
(declare-datatypes ((array!12067 0))(
  ( (array!12068 (arr!5728 (Array (_ BitVec 32) (_ BitVec 64))) (size!6071 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3604 0))(
  ( (LongMapFixedSize!3605 (defaultEntry!4515 Int) (mask!10609 (_ BitVec 32)) (extraKeys!4252 (_ BitVec 32)) (zeroValue!4356 V!8169) (minValue!4356 V!8169) (_size!1851 (_ BitVec 32)) (_keys!6625 array!12067) (_values!4498 array!12065) (_vacant!1851 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3604)

(assert (=> b!243620 (= res!119415 (and (bvslt (size!6071 (_keys!6625 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6071 (_keys!6625 thiss!1504)))))))

(declare-datatypes ((Unit!7510 0))(
  ( (Unit!7511) )
))
(declare-fun lt!122095 () Unit!7510)

(declare-fun e!158095 () Unit!7510)

(assert (=> b!243620 (= lt!122095 e!158095)))

(declare-fun c!40661 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!243620 (= c!40661 (arrayContainsKey!0 (_keys!6625 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243621 () Bool)

(declare-fun e!158102 () Bool)

(declare-fun e!158106 () Bool)

(assert (=> b!243621 (= e!158102 e!158106)))

(declare-fun res!119420 () Bool)

(assert (=> b!243621 (=> (not res!119420) (not e!158106))))

(declare-datatypes ((SeekEntryResult!1074 0))(
  ( (MissingZero!1074 (index!6466 (_ BitVec 32))) (Found!1074 (index!6467 (_ BitVec 32))) (Intermediate!1074 (undefined!1886 Bool) (index!6468 (_ BitVec 32)) (x!24341 (_ BitVec 32))) (Undefined!1074) (MissingVacant!1074 (index!6469 (_ BitVec 32))) )
))
(declare-fun lt!122098 () SeekEntryResult!1074)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!243621 (= res!119420 (or (= lt!122098 (MissingZero!1074 index!297)) (= lt!122098 (MissingVacant!1074 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12067 (_ BitVec 32)) SeekEntryResult!1074)

(assert (=> b!243621 (= lt!122098 (seekEntryOrOpen!0 key!932 (_keys!6625 thiss!1504) (mask!10609 thiss!1504)))))

(declare-fun b!243622 () Bool)

(declare-fun res!119410 () Bool)

(assert (=> b!243622 (= res!119410 (= (select (arr!5728 (_keys!6625 thiss!1504)) (index!6469 lt!122098)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243622 (=> (not res!119410) (not e!158094))))

(declare-fun b!243623 () Bool)

(declare-fun e!158097 () Bool)

(declare-fun e!158096 () Bool)

(assert (=> b!243623 (= e!158097 (and e!158096 mapRes!10837))))

(declare-fun condMapEmpty!10837 () Bool)

(declare-fun mapDefault!10837 () ValueCell!2852)

(assert (=> b!243623 (= condMapEmpty!10837 (= (arr!5727 (_values!4498 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2852)) mapDefault!10837)))))

(declare-fun e!158100 () Bool)

(declare-fun tp_is_empty!6391 () Bool)

(declare-fun array_inv!3779 (array!12067) Bool)

(declare-fun array_inv!3780 (array!12065) Bool)

(assert (=> b!243624 (= e!158100 (and tp!22810 tp_is_empty!6391 (array_inv!3779 (_keys!6625 thiss!1504)) (array_inv!3780 (_values!4498 thiss!1504)) e!158097))))

(declare-fun b!243625 () Bool)

(declare-fun e!158089 () Unit!7510)

(declare-fun lt!122097 () Unit!7510)

(assert (=> b!243625 (= e!158089 lt!122097)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!364 (array!12067 array!12065 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 64) Int) Unit!7510)

(assert (=> b!243625 (= lt!122097 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!364 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 (defaultEntry!4515 thiss!1504)))))

(declare-fun c!40663 () Bool)

(get-info :version)

(assert (=> b!243625 (= c!40663 ((_ is MissingZero!1074) lt!122098))))

(declare-fun e!158105 () Bool)

(assert (=> b!243625 e!158105))

(declare-fun b!243626 () Bool)

(assert (=> b!243626 (= e!158094 (not call!22706))))

(declare-fun b!243627 () Bool)

(declare-fun res!119419 () Bool)

(assert (=> b!243627 (=> (not res!119419) (not e!158091))))

(declare-datatypes ((List!3635 0))(
  ( (Nil!3632) (Cons!3631 (h!4288 (_ BitVec 64)) (t!8633 List!3635)) )
))
(declare-fun noDuplicate!98 (List!3635) Bool)

(assert (=> b!243627 (= res!119419 (noDuplicate!98 Nil!3632))))

(declare-fun b!243629 () Bool)

(declare-fun res!119417 () Bool)

(assert (=> b!243629 (=> (not res!119417) (not e!158091))))

(declare-fun arrayNoDuplicates!0 (array!12067 (_ BitVec 32) List!3635) Bool)

(assert (=> b!243629 (= res!119417 (arrayNoDuplicates!0 (_keys!6625 thiss!1504) #b00000000000000000000000000000000 Nil!3632))))

(declare-fun b!243630 () Bool)

(assert (=> b!243630 (= e!158098 ((_ is Undefined!1074) lt!122098))))

(declare-fun b!243631 () Bool)

(declare-fun e!158092 () Bool)

(declare-fun contains!1737 (List!3635 (_ BitVec 64)) Bool)

(assert (=> b!243631 (= e!158092 (not (contains!1737 Nil!3632 key!932)))))

(declare-fun b!243632 () Bool)

(declare-fun res!119409 () Bool)

(assert (=> b!243632 (=> (not res!119409) (not e!158091))))

(assert (=> b!243632 (= res!119409 (not (contains!1737 Nil!3632 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!243633 () Bool)

(assert (=> b!243633 (= e!158106 e!158103)))

(declare-fun res!119416 () Bool)

(assert (=> b!243633 (=> (not res!119416) (not e!158103))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243633 (= res!119416 (inRange!0 index!297 (mask!10609 thiss!1504)))))

(declare-fun lt!122100 () Unit!7510)

(assert (=> b!243633 (= lt!122100 e!158089)))

(declare-fun c!40662 () Bool)

(declare-datatypes ((tuple2!4734 0))(
  ( (tuple2!4735 (_1!2378 (_ BitVec 64)) (_2!2378 V!8169)) )
))
(declare-datatypes ((List!3636 0))(
  ( (Nil!3633) (Cons!3632 (h!4289 tuple2!4734) (t!8634 List!3636)) )
))
(declare-datatypes ((ListLongMap!3637 0))(
  ( (ListLongMap!3638 (toList!1834 List!3636)) )
))
(declare-fun contains!1738 (ListLongMap!3637 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1343 (array!12067 array!12065 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 32) Int) ListLongMap!3637)

(assert (=> b!243633 (= c!40662 (contains!1738 (getCurrentListMap!1343 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)) key!932))))

(declare-fun b!243634 () Bool)

(declare-fun res!119413 () Bool)

(assert (=> b!243634 (=> (not res!119413) (not e!158090))))

(assert (=> b!243634 (= res!119413 (= (select (arr!5728 (_keys!6625 thiss!1504)) (index!6466 lt!122098)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243635 () Bool)

(assert (=> b!243635 (= e!158096 tp_is_empty!6391)))

(declare-fun b!243636 () Bool)

(declare-fun res!119422 () Bool)

(assert (=> b!243636 (=> (not res!119422) (not e!158102))))

(assert (=> b!243636 (= res!119422 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!243637 () Bool)

(declare-fun e!158101 () Bool)

(assert (=> b!243637 (= e!158101 e!158092)))

(declare-fun res!119418 () Bool)

(assert (=> b!243637 (=> (not res!119418) (not e!158092))))

(assert (=> b!243637 (= res!119418 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!243638 () Bool)

(declare-fun Unit!7512 () Unit!7510)

(assert (=> b!243638 (= e!158089 Unit!7512)))

(declare-fun lt!122096 () Unit!7510)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!368 (array!12067 array!12065 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 64) Int) Unit!7510)

(assert (=> b!243638 (= lt!122096 (lemmaInListMapThenSeekEntryOrOpenFindsIt!368 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 (defaultEntry!4515 thiss!1504)))))

(assert (=> b!243638 false))

(declare-fun b!243639 () Bool)

(declare-fun e!158104 () Bool)

(assert (=> b!243639 (= e!158104 tp_is_empty!6391)))

(declare-fun b!243640 () Bool)

(declare-fun res!119423 () Bool)

(assert (=> b!243640 (=> (not res!119423) (not e!158091))))

(assert (=> b!243640 (= res!119423 (not (contains!1737 Nil!3632 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!243641 () Bool)

(assert (=> b!243641 (= e!158091 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6071 (_keys!6625 thiss!1504)))))))

(declare-fun b!243642 () Bool)

(declare-fun e!158099 () Bool)

(assert (=> b!243642 (= e!158099 (contains!1737 Nil!3632 key!932))))

(declare-fun b!243643 () Bool)

(declare-fun res!119407 () Bool)

(assert (=> b!243643 (=> (not res!119407) (not e!158090))))

(assert (=> b!243643 (= res!119407 call!22707)))

(assert (=> b!243643 (= e!158105 e!158090)))

(declare-fun bm!22703 () Bool)

(assert (=> bm!22703 (= call!22707 (inRange!0 (ite c!40663 (index!6466 lt!122098) (index!6469 lt!122098)) (mask!10609 thiss!1504)))))

(declare-fun b!243644 () Bool)

(declare-fun res!119412 () Bool)

(assert (=> b!243644 (=> (not res!119412) (not e!158091))))

(assert (=> b!243644 (= res!119412 e!158101)))

(declare-fun res!119408 () Bool)

(assert (=> b!243644 (=> res!119408 e!158101)))

(assert (=> b!243644 (= res!119408 e!158099)))

(declare-fun res!119414 () Bool)

(assert (=> b!243644 (=> (not res!119414) (not e!158099))))

(assert (=> b!243644 (= res!119414 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun mapNonEmpty!10837 () Bool)

(declare-fun tp!22809 () Bool)

(assert (=> mapNonEmpty!10837 (= mapRes!10837 (and tp!22809 e!158104))))

(declare-fun mapValue!10837 () ValueCell!2852)

(declare-fun mapRest!10837 () (Array (_ BitVec 32) ValueCell!2852))

(declare-fun mapKey!10837 () (_ BitVec 32))

(assert (=> mapNonEmpty!10837 (= (arr!5727 (_values!4498 thiss!1504)) (store mapRest!10837 mapKey!10837 mapValue!10837))))

(declare-fun b!243645 () Bool)

(declare-fun Unit!7513 () Unit!7510)

(assert (=> b!243645 (= e!158095 Unit!7513)))

(declare-fun lt!122099 () Unit!7510)

(declare-fun lemmaArrayContainsKeyThenInListMap!178 (array!12067 array!12065 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 64) (_ BitVec 32) Int) Unit!7510)

(assert (=> b!243645 (= lt!122099 (lemmaArrayContainsKeyThenInListMap!178 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)))))

(assert (=> b!243645 false))

(declare-fun b!243646 () Bool)

(declare-fun c!40660 () Bool)

(assert (=> b!243646 (= c!40660 ((_ is MissingVacant!1074) lt!122098))))

(assert (=> b!243646 (= e!158105 e!158098)))

(declare-fun bm!22704 () Bool)

(assert (=> bm!22704 (= call!22706 (arrayContainsKey!0 (_keys!6625 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243628 () Bool)

(declare-fun Unit!7514 () Unit!7510)

(assert (=> b!243628 (= e!158095 Unit!7514)))

(declare-fun res!119421 () Bool)

(assert (=> start!23222 (=> (not res!119421) (not e!158102))))

(declare-fun valid!1421 (LongMapFixedSize!3604) Bool)

(assert (=> start!23222 (= res!119421 (valid!1421 thiss!1504))))

(assert (=> start!23222 e!158102))

(assert (=> start!23222 e!158100))

(assert (=> start!23222 true))

(assert (= (and start!23222 res!119421) b!243636))

(assert (= (and b!243636 res!119422) b!243621))

(assert (= (and b!243621 res!119420) b!243633))

(assert (= (and b!243633 c!40662) b!243638))

(assert (= (and b!243633 (not c!40662)) b!243625))

(assert (= (and b!243625 c!40663) b!243643))

(assert (= (and b!243625 (not c!40663)) b!243646))

(assert (= (and b!243643 res!119407) b!243634))

(assert (= (and b!243634 res!119413) b!243618))

(assert (= (and b!243646 c!40660) b!243619))

(assert (= (and b!243646 (not c!40660)) b!243630))

(assert (= (and b!243619 res!119411) b!243622))

(assert (= (and b!243622 res!119410) b!243626))

(assert (= (or b!243643 b!243619) bm!22703))

(assert (= (or b!243618 b!243626) bm!22704))

(assert (= (and b!243633 res!119416) b!243620))

(assert (= (and b!243620 c!40661) b!243645))

(assert (= (and b!243620 (not c!40661)) b!243628))

(assert (= (and b!243620 res!119415) b!243627))

(assert (= (and b!243627 res!119419) b!243632))

(assert (= (and b!243632 res!119409) b!243640))

(assert (= (and b!243640 res!119423) b!243644))

(assert (= (and b!243644 res!119414) b!243642))

(assert (= (and b!243644 (not res!119408)) b!243637))

(assert (= (and b!243637 res!119418) b!243631))

(assert (= (and b!243644 res!119412) b!243629))

(assert (= (and b!243629 res!119417) b!243641))

(assert (= (and b!243623 condMapEmpty!10837) mapIsEmpty!10837))

(assert (= (and b!243623 (not condMapEmpty!10837)) mapNonEmpty!10837))

(assert (= (and mapNonEmpty!10837 ((_ is ValueCellFull!2852) mapValue!10837)) b!243639))

(assert (= (and b!243623 ((_ is ValueCellFull!2852) mapDefault!10837)) b!243635))

(assert (= b!243624 b!243623))

(assert (= start!23222 b!243624))

(declare-fun m!261415 () Bool)

(assert (=> b!243620 m!261415))

(declare-fun m!261417 () Bool)

(assert (=> bm!22703 m!261417))

(declare-fun m!261419 () Bool)

(assert (=> b!243640 m!261419))

(declare-fun m!261421 () Bool)

(assert (=> b!243645 m!261421))

(declare-fun m!261423 () Bool)

(assert (=> b!243634 m!261423))

(declare-fun m!261425 () Bool)

(assert (=> b!243631 m!261425))

(declare-fun m!261427 () Bool)

(assert (=> b!243627 m!261427))

(declare-fun m!261429 () Bool)

(assert (=> mapNonEmpty!10837 m!261429))

(declare-fun m!261431 () Bool)

(assert (=> b!243621 m!261431))

(declare-fun m!261433 () Bool)

(assert (=> b!243633 m!261433))

(declare-fun m!261435 () Bool)

(assert (=> b!243633 m!261435))

(assert (=> b!243633 m!261435))

(declare-fun m!261437 () Bool)

(assert (=> b!243633 m!261437))

(declare-fun m!261439 () Bool)

(assert (=> b!243625 m!261439))

(declare-fun m!261441 () Bool)

(assert (=> b!243632 m!261441))

(declare-fun m!261443 () Bool)

(assert (=> b!243638 m!261443))

(declare-fun m!261445 () Bool)

(assert (=> b!243629 m!261445))

(declare-fun m!261447 () Bool)

(assert (=> start!23222 m!261447))

(declare-fun m!261449 () Bool)

(assert (=> b!243622 m!261449))

(assert (=> bm!22704 m!261415))

(assert (=> b!243642 m!261425))

(declare-fun m!261451 () Bool)

(assert (=> b!243624 m!261451))

(declare-fun m!261453 () Bool)

(assert (=> b!243624 m!261453))

(check-sat b_and!13485 (not b!243645) (not b!243642) tp_is_empty!6391 (not b!243624) (not start!23222) (not b!243631) (not b!243620) (not b_next!6529) (not b!243640) (not b!243632) (not b!243629) (not bm!22703) (not b!243633) (not b!243627) (not b!243638) (not bm!22704) (not b!243621) (not b!243625) (not mapNonEmpty!10837))
(check-sat b_and!13485 (not b_next!6529))
(get-model)

(declare-fun d!59923 () Bool)

(assert (=> d!59923 (= (array_inv!3779 (_keys!6625 thiss!1504)) (bvsge (size!6071 (_keys!6625 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!243624 d!59923))

(declare-fun d!59925 () Bool)

(assert (=> d!59925 (= (array_inv!3780 (_values!4498 thiss!1504)) (bvsge (size!6070 (_values!4498 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!243624 d!59925))

(declare-fun b!243837 () Bool)

(declare-fun e!158224 () Bool)

(declare-fun e!158226 () Bool)

(assert (=> b!243837 (= e!158224 e!158226)))

(declare-fun c!40693 () Bool)

(declare-fun lt!122142 () SeekEntryResult!1074)

(assert (=> b!243837 (= c!40693 ((_ is MissingVacant!1074) lt!122142))))

(declare-fun b!243838 () Bool)

(declare-fun res!119536 () Bool)

(declare-fun e!158223 () Bool)

(assert (=> b!243838 (=> (not res!119536) (not e!158223))))

(assert (=> b!243838 (= res!119536 (= (select (arr!5728 (_keys!6625 thiss!1504)) (index!6469 lt!122142)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243838 (and (bvsge (index!6469 lt!122142) #b00000000000000000000000000000000) (bvslt (index!6469 lt!122142) (size!6071 (_keys!6625 thiss!1504))))))

(declare-fun b!243839 () Bool)

(assert (=> b!243839 (and (bvsge (index!6466 lt!122142) #b00000000000000000000000000000000) (bvslt (index!6466 lt!122142) (size!6071 (_keys!6625 thiss!1504))))))

(declare-fun res!119534 () Bool)

(assert (=> b!243839 (= res!119534 (= (select (arr!5728 (_keys!6625 thiss!1504)) (index!6466 lt!122142)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158225 () Bool)

(assert (=> b!243839 (=> (not res!119534) (not e!158225))))

(declare-fun b!243840 () Bool)

(declare-fun res!119537 () Bool)

(assert (=> b!243840 (=> (not res!119537) (not e!158223))))

(declare-fun call!22725 () Bool)

(assert (=> b!243840 (= res!119537 call!22725)))

(assert (=> b!243840 (= e!158226 e!158223)))

(declare-fun bm!22721 () Bool)

(declare-fun c!40692 () Bool)

(assert (=> bm!22721 (= call!22725 (inRange!0 (ite c!40692 (index!6466 lt!122142) (index!6469 lt!122142)) (mask!10609 thiss!1504)))))

(declare-fun b!243841 () Bool)

(declare-fun call!22724 () Bool)

(assert (=> b!243841 (= e!158225 (not call!22724))))

(declare-fun b!243842 () Bool)

(assert (=> b!243842 (= e!158224 e!158225)))

(declare-fun res!119535 () Bool)

(assert (=> b!243842 (= res!119535 call!22725)))

(assert (=> b!243842 (=> (not res!119535) (not e!158225))))

(declare-fun d!59927 () Bool)

(assert (=> d!59927 e!158224))

(assert (=> d!59927 (= c!40692 ((_ is MissingZero!1074) lt!122142))))

(assert (=> d!59927 (= lt!122142 (seekEntryOrOpen!0 key!932 (_keys!6625 thiss!1504) (mask!10609 thiss!1504)))))

(declare-fun lt!122141 () Unit!7510)

(declare-fun choose!1144 (array!12067 array!12065 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 64) Int) Unit!7510)

(assert (=> d!59927 (= lt!122141 (choose!1144 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 (defaultEntry!4515 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59927 (validMask!0 (mask!10609 thiss!1504))))

(assert (=> d!59927 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!364 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 (defaultEntry!4515 thiss!1504)) lt!122141)))

(declare-fun bm!22722 () Bool)

(assert (=> bm!22722 (= call!22724 (arrayContainsKey!0 (_keys!6625 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243843 () Bool)

(assert (=> b!243843 (= e!158226 ((_ is Undefined!1074) lt!122142))))

(declare-fun b!243844 () Bool)

(assert (=> b!243844 (= e!158223 (not call!22724))))

(assert (= (and d!59927 c!40692) b!243842))

(assert (= (and d!59927 (not c!40692)) b!243837))

(assert (= (and b!243842 res!119535) b!243839))

(assert (= (and b!243839 res!119534) b!243841))

(assert (= (and b!243837 c!40693) b!243840))

(assert (= (and b!243837 (not c!40693)) b!243843))

(assert (= (and b!243840 res!119537) b!243838))

(assert (= (and b!243838 res!119536) b!243844))

(assert (= (or b!243842 b!243840) bm!22721))

(assert (= (or b!243841 b!243844) bm!22722))

(declare-fun m!261535 () Bool)

(assert (=> bm!22721 m!261535))

(assert (=> bm!22722 m!261415))

(declare-fun m!261537 () Bool)

(assert (=> b!243838 m!261537))

(assert (=> d!59927 m!261431))

(declare-fun m!261539 () Bool)

(assert (=> d!59927 m!261539))

(declare-fun m!261541 () Bool)

(assert (=> d!59927 m!261541))

(declare-fun m!261543 () Bool)

(assert (=> b!243839 m!261543))

(assert (=> b!243625 d!59927))

(declare-fun d!59929 () Bool)

(assert (=> d!59929 (contains!1738 (getCurrentListMap!1343 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)) key!932)))

(declare-fun lt!122145 () Unit!7510)

(declare-fun choose!1145 (array!12067 array!12065 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 64) (_ BitVec 32) Int) Unit!7510)

(assert (=> d!59929 (= lt!122145 (choose!1145 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)))))

(assert (=> d!59929 (validMask!0 (mask!10609 thiss!1504))))

(assert (=> d!59929 (= (lemmaArrayContainsKeyThenInListMap!178 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)) lt!122145)))

(declare-fun bs!8851 () Bool)

(assert (= bs!8851 d!59929))

(assert (=> bs!8851 m!261435))

(assert (=> bs!8851 m!261435))

(assert (=> bs!8851 m!261437))

(declare-fun m!261545 () Bool)

(assert (=> bs!8851 m!261545))

(assert (=> bs!8851 m!261541))

(assert (=> b!243645 d!59929))

(declare-fun b!243857 () Bool)

(declare-fun e!158233 () SeekEntryResult!1074)

(declare-fun e!158235 () SeekEntryResult!1074)

(assert (=> b!243857 (= e!158233 e!158235)))

(declare-fun lt!122154 () (_ BitVec 64))

(declare-fun lt!122152 () SeekEntryResult!1074)

(assert (=> b!243857 (= lt!122154 (select (arr!5728 (_keys!6625 thiss!1504)) (index!6468 lt!122152)))))

(declare-fun c!40700 () Bool)

(assert (=> b!243857 (= c!40700 (= lt!122154 key!932))))

(declare-fun d!59931 () Bool)

(declare-fun lt!122153 () SeekEntryResult!1074)

(assert (=> d!59931 (and (or ((_ is Undefined!1074) lt!122153) (not ((_ is Found!1074) lt!122153)) (and (bvsge (index!6467 lt!122153) #b00000000000000000000000000000000) (bvslt (index!6467 lt!122153) (size!6071 (_keys!6625 thiss!1504))))) (or ((_ is Undefined!1074) lt!122153) ((_ is Found!1074) lt!122153) (not ((_ is MissingZero!1074) lt!122153)) (and (bvsge (index!6466 lt!122153) #b00000000000000000000000000000000) (bvslt (index!6466 lt!122153) (size!6071 (_keys!6625 thiss!1504))))) (or ((_ is Undefined!1074) lt!122153) ((_ is Found!1074) lt!122153) ((_ is MissingZero!1074) lt!122153) (not ((_ is MissingVacant!1074) lt!122153)) (and (bvsge (index!6469 lt!122153) #b00000000000000000000000000000000) (bvslt (index!6469 lt!122153) (size!6071 (_keys!6625 thiss!1504))))) (or ((_ is Undefined!1074) lt!122153) (ite ((_ is Found!1074) lt!122153) (= (select (arr!5728 (_keys!6625 thiss!1504)) (index!6467 lt!122153)) key!932) (ite ((_ is MissingZero!1074) lt!122153) (= (select (arr!5728 (_keys!6625 thiss!1504)) (index!6466 lt!122153)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1074) lt!122153) (= (select (arr!5728 (_keys!6625 thiss!1504)) (index!6469 lt!122153)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59931 (= lt!122153 e!158233)))

(declare-fun c!40701 () Bool)

(assert (=> d!59931 (= c!40701 (and ((_ is Intermediate!1074) lt!122152) (undefined!1886 lt!122152)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12067 (_ BitVec 32)) SeekEntryResult!1074)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59931 (= lt!122152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10609 thiss!1504)) key!932 (_keys!6625 thiss!1504) (mask!10609 thiss!1504)))))

(assert (=> d!59931 (validMask!0 (mask!10609 thiss!1504))))

(assert (=> d!59931 (= (seekEntryOrOpen!0 key!932 (_keys!6625 thiss!1504) (mask!10609 thiss!1504)) lt!122153)))

(declare-fun b!243858 () Bool)

(assert (=> b!243858 (= e!158235 (Found!1074 (index!6468 lt!122152)))))

(declare-fun b!243859 () Bool)

(assert (=> b!243859 (= e!158233 Undefined!1074)))

(declare-fun b!243860 () Bool)

(declare-fun e!158234 () SeekEntryResult!1074)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12067 (_ BitVec 32)) SeekEntryResult!1074)

(assert (=> b!243860 (= e!158234 (seekKeyOrZeroReturnVacant!0 (x!24341 lt!122152) (index!6468 lt!122152) (index!6468 lt!122152) key!932 (_keys!6625 thiss!1504) (mask!10609 thiss!1504)))))

(declare-fun b!243861 () Bool)

(assert (=> b!243861 (= e!158234 (MissingZero!1074 (index!6468 lt!122152)))))

(declare-fun b!243862 () Bool)

(declare-fun c!40702 () Bool)

(assert (=> b!243862 (= c!40702 (= lt!122154 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243862 (= e!158235 e!158234)))

(assert (= (and d!59931 c!40701) b!243859))

(assert (= (and d!59931 (not c!40701)) b!243857))

(assert (= (and b!243857 c!40700) b!243858))

(assert (= (and b!243857 (not c!40700)) b!243862))

(assert (= (and b!243862 c!40702) b!243861))

(assert (= (and b!243862 (not c!40702)) b!243860))

(declare-fun m!261547 () Bool)

(assert (=> b!243857 m!261547))

(declare-fun m!261549 () Bool)

(assert (=> d!59931 m!261549))

(declare-fun m!261551 () Bool)

(assert (=> d!59931 m!261551))

(assert (=> d!59931 m!261549))

(declare-fun m!261553 () Bool)

(assert (=> d!59931 m!261553))

(declare-fun m!261555 () Bool)

(assert (=> d!59931 m!261555))

(declare-fun m!261557 () Bool)

(assert (=> d!59931 m!261557))

(assert (=> d!59931 m!261541))

(declare-fun m!261559 () Bool)

(assert (=> b!243860 m!261559))

(assert (=> b!243621 d!59931))

(declare-fun d!59933 () Bool)

(declare-fun lt!122157 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!161 (List!3635) (InoxSet (_ BitVec 64)))

(assert (=> d!59933 (= lt!122157 (select (content!161 Nil!3632) key!932))))

(declare-fun e!158241 () Bool)

(assert (=> d!59933 (= lt!122157 e!158241)))

(declare-fun res!119542 () Bool)

(assert (=> d!59933 (=> (not res!119542) (not e!158241))))

(assert (=> d!59933 (= res!119542 ((_ is Cons!3631) Nil!3632))))

(assert (=> d!59933 (= (contains!1737 Nil!3632 key!932) lt!122157)))

(declare-fun b!243867 () Bool)

(declare-fun e!158240 () Bool)

(assert (=> b!243867 (= e!158241 e!158240)))

(declare-fun res!119543 () Bool)

(assert (=> b!243867 (=> res!119543 e!158240)))

(assert (=> b!243867 (= res!119543 (= (h!4288 Nil!3632) key!932))))

(declare-fun b!243868 () Bool)

(assert (=> b!243868 (= e!158240 (contains!1737 (t!8633 Nil!3632) key!932))))

(assert (= (and d!59933 res!119542) b!243867))

(assert (= (and b!243867 (not res!119543)) b!243868))

(declare-fun m!261561 () Bool)

(assert (=> d!59933 m!261561))

(declare-fun m!261563 () Bool)

(assert (=> d!59933 m!261563))

(declare-fun m!261565 () Bool)

(assert (=> b!243868 m!261565))

(assert (=> b!243642 d!59933))

(declare-fun d!59935 () Bool)

(declare-fun lt!122158 () Bool)

(assert (=> d!59935 (= lt!122158 (select (content!161 Nil!3632) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158243 () Bool)

(assert (=> d!59935 (= lt!122158 e!158243)))

(declare-fun res!119544 () Bool)

(assert (=> d!59935 (=> (not res!119544) (not e!158243))))

(assert (=> d!59935 (= res!119544 ((_ is Cons!3631) Nil!3632))))

(assert (=> d!59935 (= (contains!1737 Nil!3632 #b0000000000000000000000000000000000000000000000000000000000000000) lt!122158)))

(declare-fun b!243869 () Bool)

(declare-fun e!158242 () Bool)

(assert (=> b!243869 (= e!158243 e!158242)))

(declare-fun res!119545 () Bool)

(assert (=> b!243869 (=> res!119545 e!158242)))

(assert (=> b!243869 (= res!119545 (= (h!4288 Nil!3632) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243870 () Bool)

(assert (=> b!243870 (= e!158242 (contains!1737 (t!8633 Nil!3632) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59935 res!119544) b!243869))

(assert (= (and b!243869 (not res!119545)) b!243870))

(assert (=> d!59935 m!261561))

(declare-fun m!261567 () Bool)

(assert (=> d!59935 m!261567))

(declare-fun m!261569 () Bool)

(assert (=> b!243870 m!261569))

(assert (=> b!243632 d!59935))

(declare-fun d!59937 () Bool)

(assert (=> d!59937 (= (inRange!0 index!297 (mask!10609 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10609 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!243633 d!59937))

(declare-fun d!59939 () Bool)

(declare-fun e!158249 () Bool)

(assert (=> d!59939 e!158249))

(declare-fun res!119548 () Bool)

(assert (=> d!59939 (=> res!119548 e!158249)))

(declare-fun lt!122170 () Bool)

(assert (=> d!59939 (= res!119548 (not lt!122170))))

(declare-fun lt!122167 () Bool)

(assert (=> d!59939 (= lt!122170 lt!122167)))

(declare-fun lt!122169 () Unit!7510)

(declare-fun e!158248 () Unit!7510)

(assert (=> d!59939 (= lt!122169 e!158248)))

(declare-fun c!40705 () Bool)

(assert (=> d!59939 (= c!40705 lt!122167)))

(declare-fun containsKey!275 (List!3636 (_ BitVec 64)) Bool)

(assert (=> d!59939 (= lt!122167 (containsKey!275 (toList!1834 (getCurrentListMap!1343 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504))) key!932))))

(assert (=> d!59939 (= (contains!1738 (getCurrentListMap!1343 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)) key!932) lt!122170)))

(declare-fun b!243877 () Bool)

(declare-fun lt!122168 () Unit!7510)

(assert (=> b!243877 (= e!158248 lt!122168)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!224 (List!3636 (_ BitVec 64)) Unit!7510)

(assert (=> b!243877 (= lt!122168 (lemmaContainsKeyImpliesGetValueByKeyDefined!224 (toList!1834 (getCurrentListMap!1343 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504))) key!932))))

(declare-datatypes ((Option!289 0))(
  ( (Some!288 (v!5285 V!8169)) (None!287) )
))
(declare-fun isDefined!225 (Option!289) Bool)

(declare-fun getValueByKey!283 (List!3636 (_ BitVec 64)) Option!289)

(assert (=> b!243877 (isDefined!225 (getValueByKey!283 (toList!1834 (getCurrentListMap!1343 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504))) key!932))))

(declare-fun b!243878 () Bool)

(declare-fun Unit!7523 () Unit!7510)

(assert (=> b!243878 (= e!158248 Unit!7523)))

(declare-fun b!243879 () Bool)

(assert (=> b!243879 (= e!158249 (isDefined!225 (getValueByKey!283 (toList!1834 (getCurrentListMap!1343 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504))) key!932)))))

(assert (= (and d!59939 c!40705) b!243877))

(assert (= (and d!59939 (not c!40705)) b!243878))

(assert (= (and d!59939 (not res!119548)) b!243879))

(declare-fun m!261571 () Bool)

(assert (=> d!59939 m!261571))

(declare-fun m!261573 () Bool)

(assert (=> b!243877 m!261573))

(declare-fun m!261575 () Bool)

(assert (=> b!243877 m!261575))

(assert (=> b!243877 m!261575))

(declare-fun m!261577 () Bool)

(assert (=> b!243877 m!261577))

(assert (=> b!243879 m!261575))

(assert (=> b!243879 m!261575))

(assert (=> b!243879 m!261577))

(assert (=> b!243633 d!59939))

(declare-fun b!243922 () Bool)

(declare-fun res!119575 () Bool)

(declare-fun e!158288 () Bool)

(assert (=> b!243922 (=> (not res!119575) (not e!158288))))

(declare-fun e!158284 () Bool)

(assert (=> b!243922 (= res!119575 e!158284)))

(declare-fun res!119567 () Bool)

(assert (=> b!243922 (=> res!119567 e!158284)))

(declare-fun e!158287 () Bool)

(assert (=> b!243922 (= res!119567 (not e!158287))))

(declare-fun res!119568 () Bool)

(assert (=> b!243922 (=> (not res!119568) (not e!158287))))

(assert (=> b!243922 (= res!119568 (bvslt #b00000000000000000000000000000000 (size!6071 (_keys!6625 thiss!1504))))))

(declare-fun b!243923 () Bool)

(declare-fun e!158281 () Bool)

(declare-fun call!22745 () Bool)

(assert (=> b!243923 (= e!158281 (not call!22745))))

(declare-fun b!243924 () Bool)

(assert (=> b!243924 (= e!158288 e!158281)))

(declare-fun c!40723 () Bool)

(assert (=> b!243924 (= c!40723 (not (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22737 () Bool)

(declare-fun call!22742 () Bool)

(declare-fun lt!122231 () ListLongMap!3637)

(assert (=> bm!22737 (= call!22742 (contains!1738 lt!122231 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243925 () Bool)

(declare-fun e!158279 () Bool)

(assert (=> b!243925 (= e!158281 e!158279)))

(declare-fun res!119569 () Bool)

(assert (=> b!243925 (= res!119569 call!22745)))

(assert (=> b!243925 (=> (not res!119569) (not e!158279))))

(declare-fun d!59941 () Bool)

(assert (=> d!59941 e!158288))

(declare-fun res!119571 () Bool)

(assert (=> d!59941 (=> (not res!119571) (not e!158288))))

(assert (=> d!59941 (= res!119571 (or (bvsge #b00000000000000000000000000000000 (size!6071 (_keys!6625 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6071 (_keys!6625 thiss!1504))))))))

(declare-fun lt!122227 () ListLongMap!3637)

(assert (=> d!59941 (= lt!122231 lt!122227)))

(declare-fun lt!122223 () Unit!7510)

(declare-fun e!158285 () Unit!7510)

(assert (=> d!59941 (= lt!122223 e!158285)))

(declare-fun c!40720 () Bool)

(declare-fun e!158276 () Bool)

(assert (=> d!59941 (= c!40720 e!158276)))

(declare-fun res!119570 () Bool)

(assert (=> d!59941 (=> (not res!119570) (not e!158276))))

(assert (=> d!59941 (= res!119570 (bvslt #b00000000000000000000000000000000 (size!6071 (_keys!6625 thiss!1504))))))

(declare-fun e!158277 () ListLongMap!3637)

(assert (=> d!59941 (= lt!122227 e!158277)))

(declare-fun c!40722 () Bool)

(assert (=> d!59941 (= c!40722 (and (not (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59941 (validMask!0 (mask!10609 thiss!1504))))

(assert (=> d!59941 (= (getCurrentListMap!1343 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)) lt!122231)))

(declare-fun b!243926 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!243926 (= e!158276 (validKeyInArray!0 (select (arr!5728 (_keys!6625 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!243927 () Bool)

(declare-fun e!158278 () Bool)

(declare-fun apply!227 (ListLongMap!3637 (_ BitVec 64)) V!8169)

(declare-fun get!2937 (ValueCell!2852 V!8169) V!8169)

(declare-fun dynLambda!561 (Int (_ BitVec 64)) V!8169)

(assert (=> b!243927 (= e!158278 (= (apply!227 lt!122231 (select (arr!5728 (_keys!6625 thiss!1504)) #b00000000000000000000000000000000)) (get!2937 (select (arr!5727 (_values!4498 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!561 (defaultEntry!4515 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!243927 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6070 (_values!4498 thiss!1504))))))

(assert (=> b!243927 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6071 (_keys!6625 thiss!1504))))))

(declare-fun b!243928 () Bool)

(assert (=> b!243928 (= e!158287 (validKeyInArray!0 (select (arr!5728 (_keys!6625 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!243929 () Bool)

(declare-fun c!40719 () Bool)

(assert (=> b!243929 (= c!40719 (and (not (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!158286 () ListLongMap!3637)

(declare-fun e!158280 () ListLongMap!3637)

(assert (=> b!243929 (= e!158286 e!158280)))

(declare-fun b!243930 () Bool)

(declare-fun e!158282 () Bool)

(assert (=> b!243930 (= e!158282 (not call!22742))))

(declare-fun b!243931 () Bool)

(declare-fun call!22741 () ListLongMap!3637)

(declare-fun +!660 (ListLongMap!3637 tuple2!4734) ListLongMap!3637)

(assert (=> b!243931 (= e!158277 (+!660 call!22741 (tuple2!4735 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4356 thiss!1504))))))

(declare-fun b!243932 () Bool)

(declare-fun e!158283 () Bool)

(assert (=> b!243932 (= e!158283 (= (apply!227 lt!122231 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4356 thiss!1504)))))

(declare-fun bm!22738 () Bool)

(declare-fun call!22744 () ListLongMap!3637)

(declare-fun call!22743 () ListLongMap!3637)

(assert (=> bm!22738 (= call!22744 call!22743)))

(declare-fun b!243933 () Bool)

(assert (=> b!243933 (= e!158282 e!158283)))

(declare-fun res!119574 () Bool)

(assert (=> b!243933 (= res!119574 call!22742)))

(assert (=> b!243933 (=> (not res!119574) (not e!158283))))

(declare-fun b!243934 () Bool)

(declare-fun call!22746 () ListLongMap!3637)

(assert (=> b!243934 (= e!158280 call!22746)))

(declare-fun b!243935 () Bool)

(declare-fun call!22740 () ListLongMap!3637)

(assert (=> b!243935 (= e!158286 call!22740)))

(declare-fun b!243936 () Bool)

(declare-fun Unit!7524 () Unit!7510)

(assert (=> b!243936 (= e!158285 Unit!7524)))

(declare-fun c!40721 () Bool)

(declare-fun bm!22739 () Bool)

(assert (=> bm!22739 (= call!22741 (+!660 (ite c!40722 call!22743 (ite c!40721 call!22744 call!22746)) (ite (or c!40722 c!40721) (tuple2!4735 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4356 thiss!1504)) (tuple2!4735 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4356 thiss!1504)))))))

(declare-fun bm!22740 () Bool)

(assert (=> bm!22740 (= call!22746 call!22744)))

(declare-fun bm!22741 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!543 (array!12067 array!12065 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 32) Int) ListLongMap!3637)

(assert (=> bm!22741 (= call!22743 (getCurrentListMapNoExtraKeys!543 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)))))

(declare-fun b!243937 () Bool)

(declare-fun res!119573 () Bool)

(assert (=> b!243937 (=> (not res!119573) (not e!158288))))

(assert (=> b!243937 (= res!119573 e!158282)))

(declare-fun c!40718 () Bool)

(assert (=> b!243937 (= c!40718 (not (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!243938 () Bool)

(assert (=> b!243938 (= e!158280 call!22740)))

(declare-fun b!243939 () Bool)

(assert (=> b!243939 (= e!158277 e!158286)))

(assert (=> b!243939 (= c!40721 (and (not (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!243940 () Bool)

(assert (=> b!243940 (= e!158279 (= (apply!227 lt!122231 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4356 thiss!1504)))))

(declare-fun b!243941 () Bool)

(declare-fun lt!122222 () Unit!7510)

(assert (=> b!243941 (= e!158285 lt!122222)))

(declare-fun lt!122219 () ListLongMap!3637)

(assert (=> b!243941 (= lt!122219 (getCurrentListMapNoExtraKeys!543 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)))))

(declare-fun lt!122233 () (_ BitVec 64))

(assert (=> b!243941 (= lt!122233 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122224 () (_ BitVec 64))

(assert (=> b!243941 (= lt!122224 (select (arr!5728 (_keys!6625 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122218 () Unit!7510)

(declare-fun addStillContains!203 (ListLongMap!3637 (_ BitVec 64) V!8169 (_ BitVec 64)) Unit!7510)

(assert (=> b!243941 (= lt!122218 (addStillContains!203 lt!122219 lt!122233 (zeroValue!4356 thiss!1504) lt!122224))))

(assert (=> b!243941 (contains!1738 (+!660 lt!122219 (tuple2!4735 lt!122233 (zeroValue!4356 thiss!1504))) lt!122224)))

(declare-fun lt!122232 () Unit!7510)

(assert (=> b!243941 (= lt!122232 lt!122218)))

(declare-fun lt!122215 () ListLongMap!3637)

(assert (=> b!243941 (= lt!122215 (getCurrentListMapNoExtraKeys!543 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)))))

(declare-fun lt!122234 () (_ BitVec 64))

(assert (=> b!243941 (= lt!122234 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122228 () (_ BitVec 64))

(assert (=> b!243941 (= lt!122228 (select (arr!5728 (_keys!6625 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122236 () Unit!7510)

(declare-fun addApplyDifferent!203 (ListLongMap!3637 (_ BitVec 64) V!8169 (_ BitVec 64)) Unit!7510)

(assert (=> b!243941 (= lt!122236 (addApplyDifferent!203 lt!122215 lt!122234 (minValue!4356 thiss!1504) lt!122228))))

(assert (=> b!243941 (= (apply!227 (+!660 lt!122215 (tuple2!4735 lt!122234 (minValue!4356 thiss!1504))) lt!122228) (apply!227 lt!122215 lt!122228))))

(declare-fun lt!122217 () Unit!7510)

(assert (=> b!243941 (= lt!122217 lt!122236)))

(declare-fun lt!122220 () ListLongMap!3637)

(assert (=> b!243941 (= lt!122220 (getCurrentListMapNoExtraKeys!543 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)))))

(declare-fun lt!122221 () (_ BitVec 64))

(assert (=> b!243941 (= lt!122221 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122225 () (_ BitVec 64))

(assert (=> b!243941 (= lt!122225 (select (arr!5728 (_keys!6625 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122235 () Unit!7510)

(assert (=> b!243941 (= lt!122235 (addApplyDifferent!203 lt!122220 lt!122221 (zeroValue!4356 thiss!1504) lt!122225))))

(assert (=> b!243941 (= (apply!227 (+!660 lt!122220 (tuple2!4735 lt!122221 (zeroValue!4356 thiss!1504))) lt!122225) (apply!227 lt!122220 lt!122225))))

(declare-fun lt!122229 () Unit!7510)

(assert (=> b!243941 (= lt!122229 lt!122235)))

(declare-fun lt!122226 () ListLongMap!3637)

(assert (=> b!243941 (= lt!122226 (getCurrentListMapNoExtraKeys!543 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)))))

(declare-fun lt!122216 () (_ BitVec 64))

(assert (=> b!243941 (= lt!122216 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122230 () (_ BitVec 64))

(assert (=> b!243941 (= lt!122230 (select (arr!5728 (_keys!6625 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!243941 (= lt!122222 (addApplyDifferent!203 lt!122226 lt!122216 (minValue!4356 thiss!1504) lt!122230))))

(assert (=> b!243941 (= (apply!227 (+!660 lt!122226 (tuple2!4735 lt!122216 (minValue!4356 thiss!1504))) lt!122230) (apply!227 lt!122226 lt!122230))))

(declare-fun bm!22742 () Bool)

(assert (=> bm!22742 (= call!22740 call!22741)))

(declare-fun bm!22743 () Bool)

(assert (=> bm!22743 (= call!22745 (contains!1738 lt!122231 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243942 () Bool)

(assert (=> b!243942 (= e!158284 e!158278)))

(declare-fun res!119572 () Bool)

(assert (=> b!243942 (=> (not res!119572) (not e!158278))))

(assert (=> b!243942 (= res!119572 (contains!1738 lt!122231 (select (arr!5728 (_keys!6625 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!243942 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6071 (_keys!6625 thiss!1504))))))

(assert (= (and d!59941 c!40722) b!243931))

(assert (= (and d!59941 (not c!40722)) b!243939))

(assert (= (and b!243939 c!40721) b!243935))

(assert (= (and b!243939 (not c!40721)) b!243929))

(assert (= (and b!243929 c!40719) b!243938))

(assert (= (and b!243929 (not c!40719)) b!243934))

(assert (= (or b!243938 b!243934) bm!22740))

(assert (= (or b!243935 bm!22740) bm!22738))

(assert (= (or b!243935 b!243938) bm!22742))

(assert (= (or b!243931 bm!22738) bm!22741))

(assert (= (or b!243931 bm!22742) bm!22739))

(assert (= (and d!59941 res!119570) b!243926))

(assert (= (and d!59941 c!40720) b!243941))

(assert (= (and d!59941 (not c!40720)) b!243936))

(assert (= (and d!59941 res!119571) b!243922))

(assert (= (and b!243922 res!119568) b!243928))

(assert (= (and b!243922 (not res!119567)) b!243942))

(assert (= (and b!243942 res!119572) b!243927))

(assert (= (and b!243922 res!119575) b!243937))

(assert (= (and b!243937 c!40718) b!243933))

(assert (= (and b!243937 (not c!40718)) b!243930))

(assert (= (and b!243933 res!119574) b!243932))

(assert (= (or b!243933 b!243930) bm!22737))

(assert (= (and b!243937 res!119573) b!243924))

(assert (= (and b!243924 c!40723) b!243925))

(assert (= (and b!243924 (not c!40723)) b!243923))

(assert (= (and b!243925 res!119569) b!243940))

(assert (= (or b!243925 b!243923) bm!22743))

(declare-fun b_lambda!7993 () Bool)

(assert (=> (not b_lambda!7993) (not b!243927)))

(declare-fun t!8640 () Bool)

(declare-fun tb!2959 () Bool)

(assert (=> (and b!243624 (= (defaultEntry!4515 thiss!1504) (defaultEntry!4515 thiss!1504)) t!8640) tb!2959))

(declare-fun result!5215 () Bool)

(assert (=> tb!2959 (= result!5215 tp_is_empty!6391)))

(assert (=> b!243927 t!8640))

(declare-fun b_and!13491 () Bool)

(assert (= b_and!13485 (and (=> t!8640 result!5215) b_and!13491)))

(declare-fun m!261579 () Bool)

(assert (=> b!243931 m!261579))

(declare-fun m!261581 () Bool)

(assert (=> b!243927 m!261581))

(declare-fun m!261583 () Bool)

(assert (=> b!243927 m!261583))

(declare-fun m!261585 () Bool)

(assert (=> b!243927 m!261585))

(declare-fun m!261587 () Bool)

(assert (=> b!243927 m!261587))

(declare-fun m!261589 () Bool)

(assert (=> b!243927 m!261589))

(assert (=> b!243927 m!261583))

(assert (=> b!243927 m!261587))

(assert (=> b!243927 m!261581))

(declare-fun m!261591 () Bool)

(assert (=> b!243932 m!261591))

(declare-fun m!261593 () Bool)

(assert (=> bm!22739 m!261593))

(assert (=> b!243926 m!261587))

(assert (=> b!243926 m!261587))

(declare-fun m!261595 () Bool)

(assert (=> b!243926 m!261595))

(declare-fun m!261597 () Bool)

(assert (=> b!243940 m!261597))

(assert (=> b!243928 m!261587))

(assert (=> b!243928 m!261587))

(assert (=> b!243928 m!261595))

(declare-fun m!261599 () Bool)

(assert (=> bm!22743 m!261599))

(declare-fun m!261601 () Bool)

(assert (=> bm!22737 m!261601))

(declare-fun m!261603 () Bool)

(assert (=> b!243941 m!261603))

(declare-fun m!261605 () Bool)

(assert (=> b!243941 m!261605))

(declare-fun m!261607 () Bool)

(assert (=> b!243941 m!261607))

(declare-fun m!261609 () Bool)

(assert (=> b!243941 m!261609))

(declare-fun m!261611 () Bool)

(assert (=> b!243941 m!261611))

(declare-fun m!261613 () Bool)

(assert (=> b!243941 m!261613))

(declare-fun m!261615 () Bool)

(assert (=> b!243941 m!261615))

(assert (=> b!243941 m!261603))

(declare-fun m!261617 () Bool)

(assert (=> b!243941 m!261617))

(assert (=> b!243941 m!261605))

(declare-fun m!261619 () Bool)

(assert (=> b!243941 m!261619))

(declare-fun m!261621 () Bool)

(assert (=> b!243941 m!261621))

(declare-fun m!261623 () Bool)

(assert (=> b!243941 m!261623))

(declare-fun m!261625 () Bool)

(assert (=> b!243941 m!261625))

(assert (=> b!243941 m!261587))

(assert (=> b!243941 m!261609))

(assert (=> b!243941 m!261613))

(declare-fun m!261627 () Bool)

(assert (=> b!243941 m!261627))

(declare-fun m!261629 () Bool)

(assert (=> b!243941 m!261629))

(declare-fun m!261631 () Bool)

(assert (=> b!243941 m!261631))

(declare-fun m!261633 () Bool)

(assert (=> b!243941 m!261633))

(assert (=> d!59941 m!261541))

(assert (=> b!243942 m!261587))

(assert (=> b!243942 m!261587))

(declare-fun m!261635 () Bool)

(assert (=> b!243942 m!261635))

(assert (=> bm!22741 m!261633))

(assert (=> b!243633 d!59941))

(declare-fun d!59943 () Bool)

(assert (=> d!59943 (= (inRange!0 (ite c!40663 (index!6466 lt!122098) (index!6469 lt!122098)) (mask!10609 thiss!1504)) (and (bvsge (ite c!40663 (index!6466 lt!122098) (index!6469 lt!122098)) #b00000000000000000000000000000000) (bvslt (ite c!40663 (index!6466 lt!122098) (index!6469 lt!122098)) (bvadd (mask!10609 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22703 d!59943))

(declare-fun bm!22746 () Bool)

(declare-fun call!22749 () Bool)

(declare-fun c!40726 () Bool)

(assert (=> bm!22746 (= call!22749 (arrayNoDuplicates!0 (_keys!6625 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40726 (Cons!3631 (select (arr!5728 (_keys!6625 thiss!1504)) #b00000000000000000000000000000000) Nil!3632) Nil!3632)))))

(declare-fun d!59945 () Bool)

(declare-fun res!119583 () Bool)

(declare-fun e!158299 () Bool)

(assert (=> d!59945 (=> res!119583 e!158299)))

(assert (=> d!59945 (= res!119583 (bvsge #b00000000000000000000000000000000 (size!6071 (_keys!6625 thiss!1504))))))

(assert (=> d!59945 (= (arrayNoDuplicates!0 (_keys!6625 thiss!1504) #b00000000000000000000000000000000 Nil!3632) e!158299)))

(declare-fun b!243955 () Bool)

(declare-fun e!158297 () Bool)

(assert (=> b!243955 (= e!158297 call!22749)))

(declare-fun b!243956 () Bool)

(declare-fun e!158300 () Bool)

(assert (=> b!243956 (= e!158300 (contains!1737 Nil!3632 (select (arr!5728 (_keys!6625 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!243957 () Bool)

(assert (=> b!243957 (= e!158297 call!22749)))

(declare-fun b!243958 () Bool)

(declare-fun e!158298 () Bool)

(assert (=> b!243958 (= e!158298 e!158297)))

(assert (=> b!243958 (= c!40726 (validKeyInArray!0 (select (arr!5728 (_keys!6625 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!243959 () Bool)

(assert (=> b!243959 (= e!158299 e!158298)))

(declare-fun res!119582 () Bool)

(assert (=> b!243959 (=> (not res!119582) (not e!158298))))

(assert (=> b!243959 (= res!119582 (not e!158300))))

(declare-fun res!119584 () Bool)

(assert (=> b!243959 (=> (not res!119584) (not e!158300))))

(assert (=> b!243959 (= res!119584 (validKeyInArray!0 (select (arr!5728 (_keys!6625 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59945 (not res!119583)) b!243959))

(assert (= (and b!243959 res!119584) b!243956))

(assert (= (and b!243959 res!119582) b!243958))

(assert (= (and b!243958 c!40726) b!243957))

(assert (= (and b!243958 (not c!40726)) b!243955))

(assert (= (or b!243957 b!243955) bm!22746))

(assert (=> bm!22746 m!261587))

(declare-fun m!261637 () Bool)

(assert (=> bm!22746 m!261637))

(assert (=> b!243956 m!261587))

(assert (=> b!243956 m!261587))

(declare-fun m!261639 () Bool)

(assert (=> b!243956 m!261639))

(assert (=> b!243958 m!261587))

(assert (=> b!243958 m!261587))

(assert (=> b!243958 m!261595))

(assert (=> b!243959 m!261587))

(assert (=> b!243959 m!261587))

(assert (=> b!243959 m!261595))

(assert (=> b!243629 d!59945))

(declare-fun d!59947 () Bool)

(declare-fun lt!122237 () Bool)

(assert (=> d!59947 (= lt!122237 (select (content!161 Nil!3632) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158302 () Bool)

(assert (=> d!59947 (= lt!122237 e!158302)))

(declare-fun res!119585 () Bool)

(assert (=> d!59947 (=> (not res!119585) (not e!158302))))

(assert (=> d!59947 (= res!119585 ((_ is Cons!3631) Nil!3632))))

(assert (=> d!59947 (= (contains!1737 Nil!3632 #b1000000000000000000000000000000000000000000000000000000000000000) lt!122237)))

(declare-fun b!243960 () Bool)

(declare-fun e!158301 () Bool)

(assert (=> b!243960 (= e!158302 e!158301)))

(declare-fun res!119586 () Bool)

(assert (=> b!243960 (=> res!119586 e!158301)))

(assert (=> b!243960 (= res!119586 (= (h!4288 Nil!3632) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243961 () Bool)

(assert (=> b!243961 (= e!158301 (contains!1737 (t!8633 Nil!3632) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59947 res!119585) b!243960))

(assert (= (and b!243960 (not res!119586)) b!243961))

(assert (=> d!59947 m!261561))

(declare-fun m!261641 () Bool)

(assert (=> d!59947 m!261641))

(declare-fun m!261643 () Bool)

(assert (=> b!243961 m!261643))

(assert (=> b!243640 d!59947))

(assert (=> b!243631 d!59933))

(declare-fun d!59949 () Bool)

(declare-fun res!119591 () Bool)

(declare-fun e!158307 () Bool)

(assert (=> d!59949 (=> res!119591 e!158307)))

(assert (=> d!59949 (= res!119591 (= (select (arr!5728 (_keys!6625 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!59949 (= (arrayContainsKey!0 (_keys!6625 thiss!1504) key!932 #b00000000000000000000000000000000) e!158307)))

(declare-fun b!243966 () Bool)

(declare-fun e!158308 () Bool)

(assert (=> b!243966 (= e!158307 e!158308)))

(declare-fun res!119592 () Bool)

(assert (=> b!243966 (=> (not res!119592) (not e!158308))))

(assert (=> b!243966 (= res!119592 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6071 (_keys!6625 thiss!1504))))))

(declare-fun b!243967 () Bool)

(assert (=> b!243967 (= e!158308 (arrayContainsKey!0 (_keys!6625 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!59949 (not res!119591)) b!243966))

(assert (= (and b!243966 res!119592) b!243967))

(assert (=> d!59949 m!261587))

(declare-fun m!261645 () Bool)

(assert (=> b!243967 m!261645))

(assert (=> b!243620 d!59949))

(declare-fun d!59951 () Bool)

(declare-fun res!119597 () Bool)

(declare-fun e!158313 () Bool)

(assert (=> d!59951 (=> res!119597 e!158313)))

(assert (=> d!59951 (= res!119597 ((_ is Nil!3632) Nil!3632))))

(assert (=> d!59951 (= (noDuplicate!98 Nil!3632) e!158313)))

(declare-fun b!243972 () Bool)

(declare-fun e!158314 () Bool)

(assert (=> b!243972 (= e!158313 e!158314)))

(declare-fun res!119598 () Bool)

(assert (=> b!243972 (=> (not res!119598) (not e!158314))))

(assert (=> b!243972 (= res!119598 (not (contains!1737 (t!8633 Nil!3632) (h!4288 Nil!3632))))))

(declare-fun b!243973 () Bool)

(assert (=> b!243973 (= e!158314 (noDuplicate!98 (t!8633 Nil!3632)))))

(assert (= (and d!59951 (not res!119597)) b!243972))

(assert (= (and b!243972 res!119598) b!243973))

(declare-fun m!261647 () Bool)

(assert (=> b!243972 m!261647))

(declare-fun m!261649 () Bool)

(assert (=> b!243973 m!261649))

(assert (=> b!243627 d!59951))

(assert (=> bm!22704 d!59949))

(declare-fun d!59953 () Bool)

(declare-fun e!158317 () Bool)

(assert (=> d!59953 e!158317))

(declare-fun res!119603 () Bool)

(assert (=> d!59953 (=> (not res!119603) (not e!158317))))

(declare-fun lt!122243 () SeekEntryResult!1074)

(assert (=> d!59953 (= res!119603 ((_ is Found!1074) lt!122243))))

(assert (=> d!59953 (= lt!122243 (seekEntryOrOpen!0 key!932 (_keys!6625 thiss!1504) (mask!10609 thiss!1504)))))

(declare-fun lt!122242 () Unit!7510)

(declare-fun choose!1146 (array!12067 array!12065 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 64) Int) Unit!7510)

(assert (=> d!59953 (= lt!122242 (choose!1146 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 (defaultEntry!4515 thiss!1504)))))

(assert (=> d!59953 (validMask!0 (mask!10609 thiss!1504))))

(assert (=> d!59953 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!368 (_keys!6625 thiss!1504) (_values!4498 thiss!1504) (mask!10609 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 (defaultEntry!4515 thiss!1504)) lt!122242)))

(declare-fun b!243978 () Bool)

(declare-fun res!119604 () Bool)

(assert (=> b!243978 (=> (not res!119604) (not e!158317))))

(assert (=> b!243978 (= res!119604 (inRange!0 (index!6467 lt!122243) (mask!10609 thiss!1504)))))

(declare-fun b!243979 () Bool)

(assert (=> b!243979 (= e!158317 (= (select (arr!5728 (_keys!6625 thiss!1504)) (index!6467 lt!122243)) key!932))))

(assert (=> b!243979 (and (bvsge (index!6467 lt!122243) #b00000000000000000000000000000000) (bvslt (index!6467 lt!122243) (size!6071 (_keys!6625 thiss!1504))))))

(assert (= (and d!59953 res!119603) b!243978))

(assert (= (and b!243978 res!119604) b!243979))

(assert (=> d!59953 m!261431))

(declare-fun m!261651 () Bool)

(assert (=> d!59953 m!261651))

(assert (=> d!59953 m!261541))

(declare-fun m!261653 () Bool)

(assert (=> b!243978 m!261653))

(declare-fun m!261655 () Bool)

(assert (=> b!243979 m!261655))

(assert (=> b!243638 d!59953))

(declare-fun d!59955 () Bool)

(declare-fun res!119611 () Bool)

(declare-fun e!158320 () Bool)

(assert (=> d!59955 (=> (not res!119611) (not e!158320))))

(declare-fun simpleValid!250 (LongMapFixedSize!3604) Bool)

(assert (=> d!59955 (= res!119611 (simpleValid!250 thiss!1504))))

(assert (=> d!59955 (= (valid!1421 thiss!1504) e!158320)))

(declare-fun b!243986 () Bool)

(declare-fun res!119612 () Bool)

(assert (=> b!243986 (=> (not res!119612) (not e!158320))))

(declare-fun arrayCountValidKeys!0 (array!12067 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!243986 (= res!119612 (= (arrayCountValidKeys!0 (_keys!6625 thiss!1504) #b00000000000000000000000000000000 (size!6071 (_keys!6625 thiss!1504))) (_size!1851 thiss!1504)))))

(declare-fun b!243987 () Bool)

(declare-fun res!119613 () Bool)

(assert (=> b!243987 (=> (not res!119613) (not e!158320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12067 (_ BitVec 32)) Bool)

(assert (=> b!243987 (= res!119613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6625 thiss!1504) (mask!10609 thiss!1504)))))

(declare-fun b!243988 () Bool)

(assert (=> b!243988 (= e!158320 (arrayNoDuplicates!0 (_keys!6625 thiss!1504) #b00000000000000000000000000000000 Nil!3632))))

(assert (= (and d!59955 res!119611) b!243986))

(assert (= (and b!243986 res!119612) b!243987))

(assert (= (and b!243987 res!119613) b!243988))

(declare-fun m!261657 () Bool)

(assert (=> d!59955 m!261657))

(declare-fun m!261659 () Bool)

(assert (=> b!243986 m!261659))

(declare-fun m!261661 () Bool)

(assert (=> b!243987 m!261661))

(assert (=> b!243988 m!261445))

(assert (=> start!23222 d!59955))

(declare-fun mapIsEmpty!10846 () Bool)

(declare-fun mapRes!10846 () Bool)

(assert (=> mapIsEmpty!10846 mapRes!10846))

(declare-fun b!243995 () Bool)

(declare-fun e!158326 () Bool)

(assert (=> b!243995 (= e!158326 tp_is_empty!6391)))

(declare-fun mapNonEmpty!10846 () Bool)

(declare-fun tp!22825 () Bool)

(assert (=> mapNonEmpty!10846 (= mapRes!10846 (and tp!22825 e!158326))))

(declare-fun mapValue!10846 () ValueCell!2852)

(declare-fun mapKey!10846 () (_ BitVec 32))

(declare-fun mapRest!10846 () (Array (_ BitVec 32) ValueCell!2852))

(assert (=> mapNonEmpty!10846 (= mapRest!10837 (store mapRest!10846 mapKey!10846 mapValue!10846))))

(declare-fun b!243996 () Bool)

(declare-fun e!158325 () Bool)

(assert (=> b!243996 (= e!158325 tp_is_empty!6391)))

(declare-fun condMapEmpty!10846 () Bool)

(declare-fun mapDefault!10846 () ValueCell!2852)

(assert (=> mapNonEmpty!10837 (= condMapEmpty!10846 (= mapRest!10837 ((as const (Array (_ BitVec 32) ValueCell!2852)) mapDefault!10846)))))

(assert (=> mapNonEmpty!10837 (= tp!22809 (and e!158325 mapRes!10846))))

(assert (= (and mapNonEmpty!10837 condMapEmpty!10846) mapIsEmpty!10846))

(assert (= (and mapNonEmpty!10837 (not condMapEmpty!10846)) mapNonEmpty!10846))

(assert (= (and mapNonEmpty!10846 ((_ is ValueCellFull!2852) mapValue!10846)) b!243995))

(assert (= (and mapNonEmpty!10837 ((_ is ValueCellFull!2852) mapDefault!10846)) b!243996))

(declare-fun m!261663 () Bool)

(assert (=> mapNonEmpty!10846 m!261663))

(declare-fun b_lambda!7995 () Bool)

(assert (= b_lambda!7993 (or (and b!243624 b_free!6529) b_lambda!7995)))

(check-sat (not bm!22722) tp_is_empty!6391 (not b_lambda!7995) (not d!59955) (not b!243986) (not b!243926) b_and!13491 (not b!243972) (not b!243958) (not bm!22743) (not b!243931) (not b!243940) (not b!243961) (not b!243987) (not b!243860) (not d!59931) (not b!243870) (not d!59935) (not d!59927) (not d!59939) (not bm!22746) (not b!243928) (not b!243941) (not b!243956) (not d!59953) (not b!243967) (not mapNonEmpty!10846) (not b!243877) (not bm!22721) (not b!243927) (not d!59933) (not b!243959) (not d!59947) (not b_next!6529) (not bm!22737) (not d!59941) (not b!243988) (not b!243868) (not b!243932) (not d!59929) (not bm!22739) (not b!243942) (not b!243879) (not bm!22741) (not b!243978) (not b!243973))
(check-sat b_and!13491 (not b_next!6529))
