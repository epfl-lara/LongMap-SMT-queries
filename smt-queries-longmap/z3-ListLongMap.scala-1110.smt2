; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22910 () Bool)

(assert start!22910)

(declare-fun b!238511 () Bool)

(declare-fun b_free!6409 () Bool)

(declare-fun b_next!6409 () Bool)

(assert (=> b!238511 (= b_free!6409 (not b_next!6409))))

(declare-fun tp!22430 () Bool)

(declare-fun b_and!13349 () Bool)

(assert (=> b!238511 (= tp!22430 b_and!13349)))

(declare-fun b!238500 () Bool)

(declare-datatypes ((Unit!7312 0))(
  ( (Unit!7313) )
))
(declare-fun e!154844 () Unit!7312)

(declare-fun lt!120451 () Unit!7312)

(assert (=> b!238500 (= e!154844 lt!120451)))

(declare-datatypes ((V!8009 0))(
  ( (V!8010 (val!3180 Int)) )
))
(declare-datatypes ((ValueCell!2792 0))(
  ( (ValueCellFull!2792 (v!5212 V!8009)) (EmptyCell!2792) )
))
(declare-datatypes ((array!11813 0))(
  ( (array!11814 (arr!5607 (Array (_ BitVec 32) ValueCell!2792)) (size!5949 (_ BitVec 32))) )
))
(declare-datatypes ((array!11815 0))(
  ( (array!11816 (arr!5608 (Array (_ BitVec 32) (_ BitVec 64))) (size!5950 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3484 0))(
  ( (LongMapFixedSize!3485 (defaultEntry!4427 Int) (mask!10464 (_ BitVec 32)) (extraKeys!4164 (_ BitVec 32)) (zeroValue!4268 V!8009) (minValue!4268 V!8009) (_size!1791 (_ BitVec 32)) (_keys!6528 array!11815) (_values!4410 array!11813) (_vacant!1791 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3484)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!321 (array!11815 array!11813 (_ BitVec 32) (_ BitVec 32) V!8009 V!8009 (_ BitVec 64) Int) Unit!7312)

(assert (=> b!238500 (= lt!120451 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!321 (_keys!6528 thiss!1504) (_values!4410 thiss!1504) (mask!10464 thiss!1504) (extraKeys!4164 thiss!1504) (zeroValue!4268 thiss!1504) (minValue!4268 thiss!1504) key!932 (defaultEntry!4427 thiss!1504)))))

(declare-fun c!39767 () Bool)

(declare-datatypes ((SeekEntryResult!1016 0))(
  ( (MissingZero!1016 (index!6234 (_ BitVec 32))) (Found!1016 (index!6235 (_ BitVec 32))) (Intermediate!1016 (undefined!1828 Bool) (index!6236 (_ BitVec 32)) (x!24055 (_ BitVec 32))) (Undefined!1016) (MissingVacant!1016 (index!6237 (_ BitVec 32))) )
))
(declare-fun lt!120449 () SeekEntryResult!1016)

(get-info :version)

(assert (=> b!238500 (= c!39767 ((_ is MissingZero!1016) lt!120449))))

(declare-fun e!154847 () Bool)

(assert (=> b!238500 e!154847))

(declare-fun b!238501 () Bool)

(declare-fun e!154840 () Bool)

(declare-fun call!22163 () Bool)

(assert (=> b!238501 (= e!154840 (not call!22163))))

(declare-fun b!238502 () Bool)

(declare-fun e!154841 () Bool)

(declare-fun e!154842 () Bool)

(assert (=> b!238502 (= e!154841 e!154842)))

(declare-fun res!116863 () Bool)

(declare-fun call!22164 () Bool)

(assert (=> b!238502 (= res!116863 call!22164)))

(assert (=> b!238502 (=> (not res!116863) (not e!154842))))

(declare-fun b!238503 () Bool)

(declare-fun res!116864 () Bool)

(assert (=> b!238503 (=> (not res!116864) (not e!154840))))

(assert (=> b!238503 (= res!116864 (= (select (arr!5608 (_keys!6528 thiss!1504)) (index!6234 lt!120449)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238504 () Bool)

(declare-fun c!39766 () Bool)

(assert (=> b!238504 (= c!39766 ((_ is MissingVacant!1016) lt!120449))))

(assert (=> b!238504 (= e!154847 e!154841)))

(declare-fun b!238505 () Bool)

(declare-fun res!116866 () Bool)

(assert (=> b!238505 (=> (not res!116866) (not e!154840))))

(assert (=> b!238505 (= res!116866 call!22164)))

(assert (=> b!238505 (= e!154847 e!154840)))

(declare-fun b!238506 () Bool)

(assert (=> b!238506 (= e!154841 ((_ is Undefined!1016) lt!120449))))

(declare-fun b!238507 () Bool)

(assert (=> b!238507 (= e!154842 (not call!22163))))

(declare-fun res!116865 () Bool)

(declare-fun e!154843 () Bool)

(assert (=> start!22910 (=> (not res!116865) (not e!154843))))

(declare-fun valid!1381 (LongMapFixedSize!3484) Bool)

(assert (=> start!22910 (= res!116865 (valid!1381 thiss!1504))))

(assert (=> start!22910 e!154843))

(declare-fun e!154849 () Bool)

(assert (=> start!22910 e!154849))

(assert (=> start!22910 true))

(declare-fun b!238508 () Bool)

(declare-fun e!154850 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238508 (= e!154850 (not (validMask!0 (mask!10464 thiss!1504))))))

(declare-fun b!238509 () Bool)

(declare-fun Unit!7314 () Unit!7312)

(assert (=> b!238509 (= e!154844 Unit!7314)))

(declare-fun lt!120452 () Unit!7312)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!326 (array!11815 array!11813 (_ BitVec 32) (_ BitVec 32) V!8009 V!8009 (_ BitVec 64) Int) Unit!7312)

(assert (=> b!238509 (= lt!120452 (lemmaInListMapThenSeekEntryOrOpenFindsIt!326 (_keys!6528 thiss!1504) (_values!4410 thiss!1504) (mask!10464 thiss!1504) (extraKeys!4164 thiss!1504) (zeroValue!4268 thiss!1504) (minValue!4268 thiss!1504) key!932 (defaultEntry!4427 thiss!1504)))))

(assert (=> b!238509 false))

(declare-fun mapNonEmpty!10638 () Bool)

(declare-fun mapRes!10638 () Bool)

(declare-fun tp!22431 () Bool)

(declare-fun e!154848 () Bool)

(assert (=> mapNonEmpty!10638 (= mapRes!10638 (and tp!22431 e!154848))))

(declare-fun mapKey!10638 () (_ BitVec 32))

(declare-fun mapValue!10638 () ValueCell!2792)

(declare-fun mapRest!10638 () (Array (_ BitVec 32) ValueCell!2792))

(assert (=> mapNonEmpty!10638 (= (arr!5607 (_values!4410 thiss!1504)) (store mapRest!10638 mapKey!10638 mapValue!10638))))

(declare-fun b!238510 () Bool)

(declare-fun e!154845 () Bool)

(declare-fun tp_is_empty!6271 () Bool)

(assert (=> b!238510 (= e!154845 tp_is_empty!6271)))

(declare-fun bm!22160 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22160 (= call!22164 (inRange!0 (ite c!39767 (index!6234 lt!120449) (index!6237 lt!120449)) (mask!10464 thiss!1504)))))

(declare-fun e!154851 () Bool)

(declare-fun array_inv!3701 (array!11815) Bool)

(declare-fun array_inv!3702 (array!11813) Bool)

(assert (=> b!238511 (= e!154849 (and tp!22430 tp_is_empty!6271 (array_inv!3701 (_keys!6528 thiss!1504)) (array_inv!3702 (_values!4410 thiss!1504)) e!154851))))

(declare-fun mapIsEmpty!10638 () Bool)

(assert (=> mapIsEmpty!10638 mapRes!10638))

(declare-fun bm!22161 () Bool)

(declare-fun arrayContainsKey!0 (array!11815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22161 (= call!22163 (arrayContainsKey!0 (_keys!6528 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!238512 () Bool)

(declare-fun e!154846 () Bool)

(assert (=> b!238512 (= e!154843 e!154846)))

(declare-fun res!116860 () Bool)

(assert (=> b!238512 (=> (not res!116860) (not e!154846))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238512 (= res!116860 (or (= lt!120449 (MissingZero!1016 index!297)) (= lt!120449 (MissingVacant!1016 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11815 (_ BitVec 32)) SeekEntryResult!1016)

(assert (=> b!238512 (= lt!120449 (seekEntryOrOpen!0 key!932 (_keys!6528 thiss!1504) (mask!10464 thiss!1504)))))

(declare-fun b!238513 () Bool)

(assert (=> b!238513 (= e!154851 (and e!154845 mapRes!10638))))

(declare-fun condMapEmpty!10638 () Bool)

(declare-fun mapDefault!10638 () ValueCell!2792)

(assert (=> b!238513 (= condMapEmpty!10638 (= (arr!5607 (_values!4410 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2792)) mapDefault!10638)))))

(declare-fun b!238514 () Bool)

(declare-fun res!116868 () Bool)

(assert (=> b!238514 (=> (not res!116868) (not e!154850))))

(assert (=> b!238514 (= res!116868 (arrayContainsKey!0 (_keys!6528 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!238515 () Bool)

(declare-fun res!116861 () Bool)

(assert (=> b!238515 (=> (not res!116861) (not e!154843))))

(assert (=> b!238515 (= res!116861 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!238516 () Bool)

(assert (=> b!238516 (= e!154846 e!154850)))

(declare-fun res!116867 () Bool)

(assert (=> b!238516 (=> (not res!116867) (not e!154850))))

(assert (=> b!238516 (= res!116867 (inRange!0 index!297 (mask!10464 thiss!1504)))))

(declare-fun lt!120450 () Unit!7312)

(assert (=> b!238516 (= lt!120450 e!154844)))

(declare-fun c!39768 () Bool)

(declare-datatypes ((tuple2!4664 0))(
  ( (tuple2!4665 (_1!2343 (_ BitVec 64)) (_2!2343 V!8009)) )
))
(declare-datatypes ((List!3575 0))(
  ( (Nil!3572) (Cons!3571 (h!4227 tuple2!4664) (t!8561 List!3575)) )
))
(declare-datatypes ((ListLongMap!3567 0))(
  ( (ListLongMap!3568 (toList!1799 List!3575)) )
))
(declare-fun contains!1690 (ListLongMap!3567 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1308 (array!11815 array!11813 (_ BitVec 32) (_ BitVec 32) V!8009 V!8009 (_ BitVec 32) Int) ListLongMap!3567)

(assert (=> b!238516 (= c!39768 (contains!1690 (getCurrentListMap!1308 (_keys!6528 thiss!1504) (_values!4410 thiss!1504) (mask!10464 thiss!1504) (extraKeys!4164 thiss!1504) (zeroValue!4268 thiss!1504) (minValue!4268 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4427 thiss!1504)) key!932))))

(declare-fun b!238517 () Bool)

(assert (=> b!238517 (= e!154848 tp_is_empty!6271)))

(declare-fun b!238518 () Bool)

(declare-fun res!116862 () Bool)

(assert (=> b!238518 (= res!116862 (= (select (arr!5608 (_keys!6528 thiss!1504)) (index!6237 lt!120449)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!238518 (=> (not res!116862) (not e!154842))))

(assert (= (and start!22910 res!116865) b!238515))

(assert (= (and b!238515 res!116861) b!238512))

(assert (= (and b!238512 res!116860) b!238516))

(assert (= (and b!238516 c!39768) b!238509))

(assert (= (and b!238516 (not c!39768)) b!238500))

(assert (= (and b!238500 c!39767) b!238505))

(assert (= (and b!238500 (not c!39767)) b!238504))

(assert (= (and b!238505 res!116866) b!238503))

(assert (= (and b!238503 res!116864) b!238501))

(assert (= (and b!238504 c!39766) b!238502))

(assert (= (and b!238504 (not c!39766)) b!238506))

(assert (= (and b!238502 res!116863) b!238518))

(assert (= (and b!238518 res!116862) b!238507))

(assert (= (or b!238505 b!238502) bm!22160))

(assert (= (or b!238501 b!238507) bm!22161))

(assert (= (and b!238516 res!116867) b!238514))

(assert (= (and b!238514 res!116868) b!238508))

(assert (= (and b!238513 condMapEmpty!10638) mapIsEmpty!10638))

(assert (= (and b!238513 (not condMapEmpty!10638)) mapNonEmpty!10638))

(assert (= (and mapNonEmpty!10638 ((_ is ValueCellFull!2792) mapValue!10638)) b!238517))

(assert (= (and b!238513 ((_ is ValueCellFull!2792) mapDefault!10638)) b!238510))

(assert (= b!238511 b!238513))

(assert (= start!22910 b!238511))

(declare-fun m!258493 () Bool)

(assert (=> b!238514 m!258493))

(declare-fun m!258495 () Bool)

(assert (=> start!22910 m!258495))

(declare-fun m!258497 () Bool)

(assert (=> b!238511 m!258497))

(declare-fun m!258499 () Bool)

(assert (=> b!238511 m!258499))

(declare-fun m!258501 () Bool)

(assert (=> b!238516 m!258501))

(declare-fun m!258503 () Bool)

(assert (=> b!238516 m!258503))

(assert (=> b!238516 m!258503))

(declare-fun m!258505 () Bool)

(assert (=> b!238516 m!258505))

(declare-fun m!258507 () Bool)

(assert (=> b!238512 m!258507))

(declare-fun m!258509 () Bool)

(assert (=> bm!22160 m!258509))

(declare-fun m!258511 () Bool)

(assert (=> mapNonEmpty!10638 m!258511))

(declare-fun m!258513 () Bool)

(assert (=> b!238509 m!258513))

(declare-fun m!258515 () Bool)

(assert (=> b!238500 m!258515))

(assert (=> bm!22161 m!258493))

(declare-fun m!258517 () Bool)

(assert (=> b!238503 m!258517))

(declare-fun m!258519 () Bool)

(assert (=> b!238508 m!258519))

(declare-fun m!258521 () Bool)

(assert (=> b!238518 m!258521))

(check-sat (not b!238509) (not b!238512) (not b!238514) (not b!238516) (not bm!22160) tp_is_empty!6271 (not b!238500) (not bm!22161) b_and!13349 (not b!238508) (not start!22910) (not b_next!6409) (not b!238511) (not mapNonEmpty!10638))
(check-sat b_and!13349 (not b_next!6409))
