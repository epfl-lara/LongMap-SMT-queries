; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23060 () Bool)

(assert start!23060)

(declare-fun b!241695 () Bool)

(declare-fun b_free!6493 () Bool)

(declare-fun b_next!6493 () Bool)

(assert (=> b!241695 (= b_free!6493 (not b_next!6493))))

(declare-fun tp!22687 () Bool)

(declare-fun b_and!13479 () Bool)

(assert (=> b!241695 (= tp!22687 b_and!13479)))

(declare-fun b!241679 () Bool)

(declare-fun e!156848 () Bool)

(declare-fun e!156841 () Bool)

(assert (=> b!241679 (= e!156848 e!156841)))

(declare-fun res!118455 () Bool)

(assert (=> b!241679 (=> (not res!118455) (not e!156841))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8121 0))(
  ( (V!8122 (val!3222 Int)) )
))
(declare-datatypes ((ValueCell!2834 0))(
  ( (ValueCellFull!2834 (v!5262 V!8121)) (EmptyCell!2834) )
))
(declare-datatypes ((array!11989 0))(
  ( (array!11990 (arr!5695 (Array (_ BitVec 32) ValueCell!2834)) (size!6037 (_ BitVec 32))) )
))
(declare-datatypes ((array!11991 0))(
  ( (array!11992 (arr!5696 (Array (_ BitVec 32) (_ BitVec 64))) (size!6038 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3568 0))(
  ( (LongMapFixedSize!3569 (defaultEntry!4477 Int) (mask!10550 (_ BitVec 32)) (extraKeys!4214 (_ BitVec 32)) (zeroValue!4318 V!8121) (minValue!4318 V!8121) (_size!1833 (_ BitVec 32)) (_keys!6583 array!11991) (_values!4460 array!11989) (_vacant!1833 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3568)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!241679 (= res!118455 (inRange!0 index!297 (mask!10550 thiss!1504)))))

(declare-datatypes ((Unit!7423 0))(
  ( (Unit!7424) )
))
(declare-fun lt!121478 () Unit!7423)

(declare-fun e!156850 () Unit!7423)

(assert (=> b!241679 (= lt!121478 e!156850)))

(declare-fun c!40302 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4676 0))(
  ( (tuple2!4677 (_1!2349 (_ BitVec 64)) (_2!2349 V!8121)) )
))
(declare-datatypes ((List!3547 0))(
  ( (Nil!3544) (Cons!3543 (h!4200 tuple2!4676) (t!8536 List!3547)) )
))
(declare-datatypes ((ListLongMap!3591 0))(
  ( (ListLongMap!3592 (toList!1811 List!3547)) )
))
(declare-fun contains!1715 (ListLongMap!3591 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1343 (array!11991 array!11989 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 32) Int) ListLongMap!3591)

(assert (=> b!241679 (= c!40302 (contains!1715 (getCurrentListMap!1343 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)) key!932))))

(declare-fun b!241680 () Bool)

(declare-fun res!118460 () Bool)

(declare-fun e!156852 () Bool)

(assert (=> b!241680 (=> (not res!118460) (not e!156852))))

(assert (=> b!241680 (= res!118460 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!118459 () Bool)

(assert (=> start!23060 (=> (not res!118459) (not e!156852))))

(declare-fun valid!1414 (LongMapFixedSize!3568) Bool)

(assert (=> start!23060 (= res!118459 (valid!1414 thiss!1504))))

(assert (=> start!23060 e!156852))

(declare-fun e!156840 () Bool)

(assert (=> start!23060 e!156840))

(assert (=> start!23060 true))

(declare-fun b!241681 () Bool)

(declare-fun e!156845 () Unit!7423)

(declare-fun Unit!7425 () Unit!7423)

(assert (=> b!241681 (= e!156845 Unit!7425)))

(declare-fun lt!121481 () Unit!7423)

(declare-fun lemmaArrayContainsKeyThenInListMap!165 (array!11991 array!11989 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 64) (_ BitVec 32) Int) Unit!7423)

(assert (=> b!241681 (= lt!121481 (lemmaArrayContainsKeyThenInListMap!165 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)))))

(assert (=> b!241681 false))

(declare-fun b!241682 () Bool)

(declare-fun c!40300 () Bool)

(declare-datatypes ((SeekEntryResult!1025 0))(
  ( (MissingZero!1025 (index!6270 (_ BitVec 32))) (Found!1025 (index!6271 (_ BitVec 32))) (Intermediate!1025 (undefined!1837 Bool) (index!6272 (_ BitVec 32)) (x!24195 (_ BitVec 32))) (Undefined!1025) (MissingVacant!1025 (index!6273 (_ BitVec 32))) )
))
(declare-fun lt!121482 () SeekEntryResult!1025)

(get-info :version)

(assert (=> b!241682 (= c!40300 ((_ is MissingVacant!1025) lt!121482))))

(declare-fun e!156853 () Bool)

(declare-fun e!156844 () Bool)

(assert (=> b!241682 (= e!156853 e!156844)))

(declare-fun b!241683 () Bool)

(declare-fun e!156847 () Bool)

(declare-fun call!22473 () Bool)

(assert (=> b!241683 (= e!156847 (not call!22473))))

(declare-fun b!241684 () Bool)

(declare-fun Unit!7426 () Unit!7423)

(assert (=> b!241684 (= e!156845 Unit!7426)))

(declare-fun b!241685 () Bool)

(declare-fun res!118458 () Bool)

(declare-fun e!156842 () Bool)

(assert (=> b!241685 (=> (not res!118458) (not e!156842))))

(assert (=> b!241685 (= res!118458 (= (select (arr!5696 (_keys!6583 thiss!1504)) (index!6270 lt!121482)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!40301 () Bool)

(declare-fun call!22472 () Bool)

(declare-fun bm!22469 () Bool)

(assert (=> bm!22469 (= call!22472 (inRange!0 (ite c!40301 (index!6270 lt!121482) (index!6273 lt!121482)) (mask!10550 thiss!1504)))))

(declare-fun bm!22470 () Bool)

(declare-fun arrayContainsKey!0 (array!11991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22470 (= call!22473 (arrayContainsKey!0 (_keys!6583 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241686 () Bool)

(declare-fun res!118461 () Bool)

(assert (=> b!241686 (= res!118461 (= (select (arr!5696 (_keys!6583 thiss!1504)) (index!6273 lt!121482)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241686 (=> (not res!118461) (not e!156847))))

(declare-fun b!241687 () Bool)

(declare-fun e!156846 () Bool)

(declare-fun tp_is_empty!6355 () Bool)

(assert (=> b!241687 (= e!156846 tp_is_empty!6355)))

(declare-fun b!241688 () Bool)

(assert (=> b!241688 (= e!156842 (not call!22473))))

(declare-fun b!241689 () Bool)

(assert (=> b!241689 (= e!156844 ((_ is Undefined!1025) lt!121482))))

(declare-fun b!241690 () Bool)

(declare-fun e!156843 () Bool)

(assert (=> b!241690 (= e!156843 tp_is_empty!6355)))

(declare-fun b!241691 () Bool)

(declare-fun Unit!7427 () Unit!7423)

(assert (=> b!241691 (= e!156850 Unit!7427)))

(declare-fun lt!121479 () Unit!7423)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!351 (array!11991 array!11989 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 64) Int) Unit!7423)

(assert (=> b!241691 (= lt!121479 (lemmaInListMapThenSeekEntryOrOpenFindsIt!351 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 (defaultEntry!4477 thiss!1504)))))

(assert (=> b!241691 false))

(declare-fun b!241692 () Bool)

(declare-fun e!156849 () Bool)

(declare-fun mapRes!10768 () Bool)

(assert (=> b!241692 (= e!156849 (and e!156843 mapRes!10768))))

(declare-fun condMapEmpty!10768 () Bool)

(declare-fun mapDefault!10768 () ValueCell!2834)

(assert (=> b!241692 (= condMapEmpty!10768 (= (arr!5695 (_values!4460 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2834)) mapDefault!10768)))))

(declare-fun b!241693 () Bool)

(assert (=> b!241693 (= e!156852 e!156848)))

(declare-fun res!118454 () Bool)

(assert (=> b!241693 (=> (not res!118454) (not e!156848))))

(assert (=> b!241693 (= res!118454 (or (= lt!121482 (MissingZero!1025 index!297)) (= lt!121482 (MissingVacant!1025 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11991 (_ BitVec 32)) SeekEntryResult!1025)

(assert (=> b!241693 (= lt!121482 (seekEntryOrOpen!0 key!932 (_keys!6583 thiss!1504) (mask!10550 thiss!1504)))))

(declare-fun mapIsEmpty!10768 () Bool)

(assert (=> mapIsEmpty!10768 mapRes!10768))

(declare-fun b!241694 () Bool)

(declare-fun res!118456 () Bool)

(assert (=> b!241694 (=> (not res!118456) (not e!156842))))

(assert (=> b!241694 (= res!118456 call!22472)))

(assert (=> b!241694 (= e!156853 e!156842)))

(declare-fun array_inv!3743 (array!11991) Bool)

(declare-fun array_inv!3744 (array!11989) Bool)

(assert (=> b!241695 (= e!156840 (and tp!22687 tp_is_empty!6355 (array_inv!3743 (_keys!6583 thiss!1504)) (array_inv!3744 (_values!4460 thiss!1504)) e!156849))))

(declare-fun mapNonEmpty!10768 () Bool)

(declare-fun tp!22686 () Bool)

(assert (=> mapNonEmpty!10768 (= mapRes!10768 (and tp!22686 e!156846))))

(declare-fun mapValue!10768 () ValueCell!2834)

(declare-fun mapRest!10768 () (Array (_ BitVec 32) ValueCell!2834))

(declare-fun mapKey!10768 () (_ BitVec 32))

(assert (=> mapNonEmpty!10768 (= (arr!5695 (_values!4460 thiss!1504)) (store mapRest!10768 mapKey!10768 mapValue!10768))))

(declare-fun b!241696 () Bool)

(assert (=> b!241696 (= e!156844 e!156847)))

(declare-fun res!118457 () Bool)

(assert (=> b!241696 (= res!118457 call!22472)))

(assert (=> b!241696 (=> (not res!118457) (not e!156847))))

(declare-fun b!241697 () Bool)

(assert (=> b!241697 (= e!156841 (and (bvslt (size!6038 (_keys!6583 thiss!1504)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!6038 (_keys!6583 thiss!1504)))))))

(declare-fun lt!121483 () Unit!7423)

(assert (=> b!241697 (= lt!121483 e!156845)))

(declare-fun c!40303 () Bool)

(assert (=> b!241697 (= c!40303 (arrayContainsKey!0 (_keys!6583 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241698 () Bool)

(declare-fun lt!121480 () Unit!7423)

(assert (=> b!241698 (= e!156850 lt!121480)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!344 (array!11991 array!11989 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 64) Int) Unit!7423)

(assert (=> b!241698 (= lt!121480 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!344 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 (defaultEntry!4477 thiss!1504)))))

(assert (=> b!241698 (= c!40301 ((_ is MissingZero!1025) lt!121482))))

(assert (=> b!241698 e!156853))

(assert (= (and start!23060 res!118459) b!241680))

(assert (= (and b!241680 res!118460) b!241693))

(assert (= (and b!241693 res!118454) b!241679))

(assert (= (and b!241679 c!40302) b!241691))

(assert (= (and b!241679 (not c!40302)) b!241698))

(assert (= (and b!241698 c!40301) b!241694))

(assert (= (and b!241698 (not c!40301)) b!241682))

(assert (= (and b!241694 res!118456) b!241685))

(assert (= (and b!241685 res!118458) b!241688))

(assert (= (and b!241682 c!40300) b!241696))

(assert (= (and b!241682 (not c!40300)) b!241689))

(assert (= (and b!241696 res!118457) b!241686))

(assert (= (and b!241686 res!118461) b!241683))

(assert (= (or b!241694 b!241696) bm!22469))

(assert (= (or b!241688 b!241683) bm!22470))

(assert (= (and b!241679 res!118455) b!241697))

(assert (= (and b!241697 c!40303) b!241681))

(assert (= (and b!241697 (not c!40303)) b!241684))

(assert (= (and b!241692 condMapEmpty!10768) mapIsEmpty!10768))

(assert (= (and b!241692 (not condMapEmpty!10768)) mapNonEmpty!10768))

(assert (= (and mapNonEmpty!10768 ((_ is ValueCellFull!2834) mapValue!10768)) b!241687))

(assert (= (and b!241692 ((_ is ValueCellFull!2834) mapDefault!10768)) b!241690))

(assert (= b!241695 b!241692))

(assert (= start!23060 b!241695))

(declare-fun m!260959 () Bool)

(assert (=> b!241697 m!260959))

(declare-fun m!260961 () Bool)

(assert (=> b!241686 m!260961))

(declare-fun m!260963 () Bool)

(assert (=> b!241691 m!260963))

(declare-fun m!260965 () Bool)

(assert (=> b!241685 m!260965))

(declare-fun m!260967 () Bool)

(assert (=> bm!22469 m!260967))

(assert (=> bm!22470 m!260959))

(declare-fun m!260969 () Bool)

(assert (=> mapNonEmpty!10768 m!260969))

(declare-fun m!260971 () Bool)

(assert (=> b!241695 m!260971))

(declare-fun m!260973 () Bool)

(assert (=> b!241695 m!260973))

(declare-fun m!260975 () Bool)

(assert (=> start!23060 m!260975))

(declare-fun m!260977 () Bool)

(assert (=> b!241679 m!260977))

(declare-fun m!260979 () Bool)

(assert (=> b!241679 m!260979))

(assert (=> b!241679 m!260979))

(declare-fun m!260981 () Bool)

(assert (=> b!241679 m!260981))

(declare-fun m!260983 () Bool)

(assert (=> b!241681 m!260983))

(declare-fun m!260985 () Bool)

(assert (=> b!241698 m!260985))

(declare-fun m!260987 () Bool)

(assert (=> b!241693 m!260987))

(check-sat (not bm!22470) (not start!23060) b_and!13479 (not b!241697) (not b!241679) (not b!241698) (not b_next!6493) tp_is_empty!6355 (not b!241691) (not b!241693) (not bm!22469) (not b!241681) (not b!241695) (not mapNonEmpty!10768))
(check-sat b_and!13479 (not b_next!6493))
(get-model)

(declare-fun d!59987 () Bool)

(assert (=> d!59987 (= (array_inv!3743 (_keys!6583 thiss!1504)) (bvsge (size!6038 (_keys!6583 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!241695 d!59987))

(declare-fun d!59989 () Bool)

(assert (=> d!59989 (= (array_inv!3744 (_values!4460 thiss!1504)) (bvsge (size!6037 (_values!4460 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!241695 d!59989))

(declare-fun d!59991 () Bool)

(declare-fun e!156940 () Bool)

(assert (=> d!59991 e!156940))

(declare-fun res!118514 () Bool)

(assert (=> d!59991 (=> (not res!118514) (not e!156940))))

(declare-fun lt!121524 () SeekEntryResult!1025)

(assert (=> d!59991 (= res!118514 ((_ is Found!1025) lt!121524))))

(assert (=> d!59991 (= lt!121524 (seekEntryOrOpen!0 key!932 (_keys!6583 thiss!1504) (mask!10550 thiss!1504)))))

(declare-fun lt!121525 () Unit!7423)

(declare-fun choose!1129 (array!11991 array!11989 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 64) Int) Unit!7423)

(assert (=> d!59991 (= lt!121525 (choose!1129 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 (defaultEntry!4477 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59991 (validMask!0 (mask!10550 thiss!1504))))

(assert (=> d!59991 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!351 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 (defaultEntry!4477 thiss!1504)) lt!121525)))

(declare-fun b!241823 () Bool)

(declare-fun res!118515 () Bool)

(assert (=> b!241823 (=> (not res!118515) (not e!156940))))

(assert (=> b!241823 (= res!118515 (inRange!0 (index!6271 lt!121524) (mask!10550 thiss!1504)))))

(declare-fun b!241824 () Bool)

(assert (=> b!241824 (= e!156940 (= (select (arr!5696 (_keys!6583 thiss!1504)) (index!6271 lt!121524)) key!932))))

(assert (=> b!241824 (and (bvsge (index!6271 lt!121524) #b00000000000000000000000000000000) (bvslt (index!6271 lt!121524) (size!6038 (_keys!6583 thiss!1504))))))

(assert (= (and d!59991 res!118514) b!241823))

(assert (= (and b!241823 res!118515) b!241824))

(assert (=> d!59991 m!260987))

(declare-fun m!261049 () Bool)

(assert (=> d!59991 m!261049))

(declare-fun m!261051 () Bool)

(assert (=> d!59991 m!261051))

(declare-fun m!261053 () Bool)

(assert (=> b!241823 m!261053))

(declare-fun m!261055 () Bool)

(assert (=> b!241824 m!261055))

(assert (=> b!241691 d!59991))

(declare-fun d!59993 () Bool)

(declare-fun res!118520 () Bool)

(declare-fun e!156945 () Bool)

(assert (=> d!59993 (=> res!118520 e!156945)))

(assert (=> d!59993 (= res!118520 (= (select (arr!5696 (_keys!6583 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!59993 (= (arrayContainsKey!0 (_keys!6583 thiss!1504) key!932 #b00000000000000000000000000000000) e!156945)))

(declare-fun b!241829 () Bool)

(declare-fun e!156946 () Bool)

(assert (=> b!241829 (= e!156945 e!156946)))

(declare-fun res!118521 () Bool)

(assert (=> b!241829 (=> (not res!118521) (not e!156946))))

(assert (=> b!241829 (= res!118521 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6038 (_keys!6583 thiss!1504))))))

(declare-fun b!241830 () Bool)

(assert (=> b!241830 (= e!156946 (arrayContainsKey!0 (_keys!6583 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!59993 (not res!118520)) b!241829))

(assert (= (and b!241829 res!118521) b!241830))

(declare-fun m!261057 () Bool)

(assert (=> d!59993 m!261057))

(declare-fun m!261059 () Bool)

(assert (=> b!241830 m!261059))

(assert (=> bm!22470 d!59993))

(declare-fun d!59995 () Bool)

(declare-fun res!118528 () Bool)

(declare-fun e!156949 () Bool)

(assert (=> d!59995 (=> (not res!118528) (not e!156949))))

(declare-fun simpleValid!245 (LongMapFixedSize!3568) Bool)

(assert (=> d!59995 (= res!118528 (simpleValid!245 thiss!1504))))

(assert (=> d!59995 (= (valid!1414 thiss!1504) e!156949)))

(declare-fun b!241837 () Bool)

(declare-fun res!118529 () Bool)

(assert (=> b!241837 (=> (not res!118529) (not e!156949))))

(declare-fun arrayCountValidKeys!0 (array!11991 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!241837 (= res!118529 (= (arrayCountValidKeys!0 (_keys!6583 thiss!1504) #b00000000000000000000000000000000 (size!6038 (_keys!6583 thiss!1504))) (_size!1833 thiss!1504)))))

(declare-fun b!241838 () Bool)

(declare-fun res!118530 () Bool)

(assert (=> b!241838 (=> (not res!118530) (not e!156949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11991 (_ BitVec 32)) Bool)

(assert (=> b!241838 (= res!118530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6583 thiss!1504) (mask!10550 thiss!1504)))))

(declare-fun b!241839 () Bool)

(declare-datatypes ((List!3549 0))(
  ( (Nil!3546) (Cons!3545 (h!4202 (_ BitVec 64)) (t!8540 List!3549)) )
))
(declare-fun arrayNoDuplicates!0 (array!11991 (_ BitVec 32) List!3549) Bool)

(assert (=> b!241839 (= e!156949 (arrayNoDuplicates!0 (_keys!6583 thiss!1504) #b00000000000000000000000000000000 Nil!3546))))

(assert (= (and d!59995 res!118528) b!241837))

(assert (= (and b!241837 res!118529) b!241838))

(assert (= (and b!241838 res!118530) b!241839))

(declare-fun m!261061 () Bool)

(assert (=> d!59995 m!261061))

(declare-fun m!261063 () Bool)

(assert (=> b!241837 m!261063))

(declare-fun m!261065 () Bool)

(assert (=> b!241838 m!261065))

(declare-fun m!261067 () Bool)

(assert (=> b!241839 m!261067))

(assert (=> start!23060 d!59995))

(assert (=> b!241697 d!59993))

(declare-fun b!241852 () Bool)

(declare-fun e!156956 () SeekEntryResult!1025)

(declare-fun lt!121534 () SeekEntryResult!1025)

(assert (=> b!241852 (= e!156956 (MissingZero!1025 (index!6272 lt!121534)))))

(declare-fun d!59997 () Bool)

(declare-fun lt!121532 () SeekEntryResult!1025)

(assert (=> d!59997 (and (or ((_ is Undefined!1025) lt!121532) (not ((_ is Found!1025) lt!121532)) (and (bvsge (index!6271 lt!121532) #b00000000000000000000000000000000) (bvslt (index!6271 lt!121532) (size!6038 (_keys!6583 thiss!1504))))) (or ((_ is Undefined!1025) lt!121532) ((_ is Found!1025) lt!121532) (not ((_ is MissingZero!1025) lt!121532)) (and (bvsge (index!6270 lt!121532) #b00000000000000000000000000000000) (bvslt (index!6270 lt!121532) (size!6038 (_keys!6583 thiss!1504))))) (or ((_ is Undefined!1025) lt!121532) ((_ is Found!1025) lt!121532) ((_ is MissingZero!1025) lt!121532) (not ((_ is MissingVacant!1025) lt!121532)) (and (bvsge (index!6273 lt!121532) #b00000000000000000000000000000000) (bvslt (index!6273 lt!121532) (size!6038 (_keys!6583 thiss!1504))))) (or ((_ is Undefined!1025) lt!121532) (ite ((_ is Found!1025) lt!121532) (= (select (arr!5696 (_keys!6583 thiss!1504)) (index!6271 lt!121532)) key!932) (ite ((_ is MissingZero!1025) lt!121532) (= (select (arr!5696 (_keys!6583 thiss!1504)) (index!6270 lt!121532)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1025) lt!121532) (= (select (arr!5696 (_keys!6583 thiss!1504)) (index!6273 lt!121532)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!156958 () SeekEntryResult!1025)

(assert (=> d!59997 (= lt!121532 e!156958)))

(declare-fun c!40335 () Bool)

(assert (=> d!59997 (= c!40335 (and ((_ is Intermediate!1025) lt!121534) (undefined!1837 lt!121534)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11991 (_ BitVec 32)) SeekEntryResult!1025)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59997 (= lt!121534 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10550 thiss!1504)) key!932 (_keys!6583 thiss!1504) (mask!10550 thiss!1504)))))

(assert (=> d!59997 (validMask!0 (mask!10550 thiss!1504))))

(assert (=> d!59997 (= (seekEntryOrOpen!0 key!932 (_keys!6583 thiss!1504) (mask!10550 thiss!1504)) lt!121532)))

(declare-fun b!241853 () Bool)

(declare-fun e!156957 () SeekEntryResult!1025)

(assert (=> b!241853 (= e!156958 e!156957)))

(declare-fun lt!121533 () (_ BitVec 64))

(assert (=> b!241853 (= lt!121533 (select (arr!5696 (_keys!6583 thiss!1504)) (index!6272 lt!121534)))))

(declare-fun c!40336 () Bool)

(assert (=> b!241853 (= c!40336 (= lt!121533 key!932))))

(declare-fun b!241854 () Bool)

(declare-fun c!40334 () Bool)

(assert (=> b!241854 (= c!40334 (= lt!121533 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241854 (= e!156957 e!156956)))

(declare-fun b!241855 () Bool)

(assert (=> b!241855 (= e!156957 (Found!1025 (index!6272 lt!121534)))))

(declare-fun b!241856 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11991 (_ BitVec 32)) SeekEntryResult!1025)

(assert (=> b!241856 (= e!156956 (seekKeyOrZeroReturnVacant!0 (x!24195 lt!121534) (index!6272 lt!121534) (index!6272 lt!121534) key!932 (_keys!6583 thiss!1504) (mask!10550 thiss!1504)))))

(declare-fun b!241857 () Bool)

(assert (=> b!241857 (= e!156958 Undefined!1025)))

(assert (= (and d!59997 c!40335) b!241857))

(assert (= (and d!59997 (not c!40335)) b!241853))

(assert (= (and b!241853 c!40336) b!241855))

(assert (= (and b!241853 (not c!40336)) b!241854))

(assert (= (and b!241854 c!40334) b!241852))

(assert (= (and b!241854 (not c!40334)) b!241856))

(declare-fun m!261069 () Bool)

(assert (=> d!59997 m!261069))

(declare-fun m!261071 () Bool)

(assert (=> d!59997 m!261071))

(declare-fun m!261073 () Bool)

(assert (=> d!59997 m!261073))

(declare-fun m!261075 () Bool)

(assert (=> d!59997 m!261075))

(declare-fun m!261077 () Bool)

(assert (=> d!59997 m!261077))

(assert (=> d!59997 m!261051))

(assert (=> d!59997 m!261075))

(declare-fun m!261079 () Bool)

(assert (=> b!241853 m!261079))

(declare-fun m!261081 () Bool)

(assert (=> b!241856 m!261081))

(assert (=> b!241693 d!59997))

(declare-fun d!59999 () Bool)

(assert (=> d!59999 (= (inRange!0 index!297 (mask!10550 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10550 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!241679 d!59999))

(declare-fun d!60001 () Bool)

(declare-fun e!156963 () Bool)

(assert (=> d!60001 e!156963))

(declare-fun res!118533 () Bool)

(assert (=> d!60001 (=> res!118533 e!156963)))

(declare-fun lt!121543 () Bool)

(assert (=> d!60001 (= res!118533 (not lt!121543))))

(declare-fun lt!121546 () Bool)

(assert (=> d!60001 (= lt!121543 lt!121546)))

(declare-fun lt!121544 () Unit!7423)

(declare-fun e!156964 () Unit!7423)

(assert (=> d!60001 (= lt!121544 e!156964)))

(declare-fun c!40339 () Bool)

(assert (=> d!60001 (= c!40339 lt!121546)))

(declare-fun containsKey!272 (List!3547 (_ BitVec 64)) Bool)

(assert (=> d!60001 (= lt!121546 (containsKey!272 (toList!1811 (getCurrentListMap!1343 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504))) key!932))))

(assert (=> d!60001 (= (contains!1715 (getCurrentListMap!1343 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)) key!932) lt!121543)))

(declare-fun b!241864 () Bool)

(declare-fun lt!121545 () Unit!7423)

(assert (=> b!241864 (= e!156964 lt!121545)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!220 (List!3547 (_ BitVec 64)) Unit!7423)

(assert (=> b!241864 (= lt!121545 (lemmaContainsKeyImpliesGetValueByKeyDefined!220 (toList!1811 (getCurrentListMap!1343 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504))) key!932))))

(declare-datatypes ((Option!287 0))(
  ( (Some!286 (v!5265 V!8121)) (None!285) )
))
(declare-fun isDefined!221 (Option!287) Bool)

(declare-fun getValueByKey!281 (List!3547 (_ BitVec 64)) Option!287)

(assert (=> b!241864 (isDefined!221 (getValueByKey!281 (toList!1811 (getCurrentListMap!1343 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504))) key!932))))

(declare-fun b!241865 () Bool)

(declare-fun Unit!7434 () Unit!7423)

(assert (=> b!241865 (= e!156964 Unit!7434)))

(declare-fun b!241866 () Bool)

(assert (=> b!241866 (= e!156963 (isDefined!221 (getValueByKey!281 (toList!1811 (getCurrentListMap!1343 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504))) key!932)))))

(assert (= (and d!60001 c!40339) b!241864))

(assert (= (and d!60001 (not c!40339)) b!241865))

(assert (= (and d!60001 (not res!118533)) b!241866))

(declare-fun m!261083 () Bool)

(assert (=> d!60001 m!261083))

(declare-fun m!261085 () Bool)

(assert (=> b!241864 m!261085))

(declare-fun m!261087 () Bool)

(assert (=> b!241864 m!261087))

(assert (=> b!241864 m!261087))

(declare-fun m!261089 () Bool)

(assert (=> b!241864 m!261089))

(assert (=> b!241866 m!261087))

(assert (=> b!241866 m!261087))

(assert (=> b!241866 m!261089))

(assert (=> b!241679 d!60001))

(declare-fun b!241909 () Bool)

(declare-fun e!156991 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!241909 (= e!156991 (validKeyInArray!0 (select (arr!5696 (_keys!6583 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22497 () Bool)

(declare-fun call!22501 () Bool)

(declare-fun lt!121606 () ListLongMap!3591)

(assert (=> bm!22497 (= call!22501 (contains!1715 lt!121606 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241910 () Bool)

(declare-fun e!156993 () Bool)

(declare-fun apply!222 (ListLongMap!3591 (_ BitVec 64)) V!8121)

(assert (=> b!241910 (= e!156993 (= (apply!222 lt!121606 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4318 thiss!1504)))))

(declare-fun b!241911 () Bool)

(declare-fun e!156996 () Bool)

(assert (=> b!241911 (= e!156996 (validKeyInArray!0 (select (arr!5696 (_keys!6583 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241912 () Bool)

(declare-fun c!40354 () Bool)

(assert (=> b!241912 (= c!40354 (and (not (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!156999 () ListLongMap!3591)

(declare-fun e!157001 () ListLongMap!3591)

(assert (=> b!241912 (= e!156999 e!157001)))

(declare-fun b!241913 () Bool)

(declare-fun e!156998 () ListLongMap!3591)

(assert (=> b!241913 (= e!156998 e!156999)))

(declare-fun c!40353 () Bool)

(assert (=> b!241913 (= c!40353 (and (not (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!241914 () Bool)

(declare-fun e!156992 () Bool)

(declare-fun e!156997 () Bool)

(assert (=> b!241914 (= e!156992 e!156997)))

(declare-fun res!118553 () Bool)

(assert (=> b!241914 (= res!118553 call!22501)))

(assert (=> b!241914 (=> (not res!118553) (not e!156997))))

(declare-fun b!241915 () Bool)

(assert (=> b!241915 (= e!156997 (= (apply!222 lt!121606 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4318 thiss!1504)))))

(declare-fun call!22506 () ListLongMap!3591)

(declare-fun bm!22498 () Bool)

(declare-fun c!40352 () Bool)

(declare-fun call!22500 () ListLongMap!3591)

(declare-fun call!22502 () ListLongMap!3591)

(declare-fun call!22504 () ListLongMap!3591)

(declare-fun +!649 (ListLongMap!3591 tuple2!4676) ListLongMap!3591)

(assert (=> bm!22498 (= call!22500 (+!649 (ite c!40352 call!22502 (ite c!40353 call!22506 call!22504)) (ite (or c!40352 c!40353) (tuple2!4677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4318 thiss!1504)) (tuple2!4677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4318 thiss!1504)))))))

(declare-fun bm!22499 () Bool)

(declare-fun call!22505 () ListLongMap!3591)

(assert (=> bm!22499 (= call!22505 call!22500)))

(declare-fun b!241916 () Bool)

(declare-fun e!157003 () Unit!7423)

(declare-fun Unit!7435 () Unit!7423)

(assert (=> b!241916 (= e!157003 Unit!7435)))

(declare-fun b!241917 () Bool)

(assert (=> b!241917 (= e!156992 (not call!22501))))

(declare-fun bm!22500 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!538 (array!11991 array!11989 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 32) Int) ListLongMap!3591)

(assert (=> bm!22500 (= call!22502 (getCurrentListMapNoExtraKeys!538 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)))))

(declare-fun b!241918 () Bool)

(declare-fun res!118556 () Bool)

(declare-fun e!156995 () Bool)

(assert (=> b!241918 (=> (not res!118556) (not e!156995))))

(assert (=> b!241918 (= res!118556 e!156992)))

(declare-fun c!40357 () Bool)

(assert (=> b!241918 (= c!40357 (not (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!22501 () Bool)

(declare-fun call!22503 () Bool)

(assert (=> bm!22501 (= call!22503 (contains!1715 lt!121606 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241919 () Bool)

(assert (=> b!241919 (= e!157001 call!22505)))

(declare-fun b!241920 () Bool)

(declare-fun res!118560 () Bool)

(assert (=> b!241920 (=> (not res!118560) (not e!156995))))

(declare-fun e!156994 () Bool)

(assert (=> b!241920 (= res!118560 e!156994)))

(declare-fun res!118555 () Bool)

(assert (=> b!241920 (=> res!118555 e!156994)))

(assert (=> b!241920 (= res!118555 (not e!156991))))

(declare-fun res!118559 () Bool)

(assert (=> b!241920 (=> (not res!118559) (not e!156991))))

(assert (=> b!241920 (= res!118559 (bvslt #b00000000000000000000000000000000 (size!6038 (_keys!6583 thiss!1504))))))

(declare-fun bm!22502 () Bool)

(assert (=> bm!22502 (= call!22506 call!22502)))

(declare-fun b!241921 () Bool)

(declare-fun e!157002 () Bool)

(assert (=> b!241921 (= e!157002 (not call!22503))))

(declare-fun b!241922 () Bool)

(assert (=> b!241922 (= e!156998 (+!649 call!22500 (tuple2!4677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4318 thiss!1504))))))

(declare-fun b!241923 () Bool)

(assert (=> b!241923 (= e!157001 call!22504)))

(declare-fun bm!22503 () Bool)

(assert (=> bm!22503 (= call!22504 call!22506)))

(declare-fun d!60003 () Bool)

(assert (=> d!60003 e!156995))

(declare-fun res!118554 () Bool)

(assert (=> d!60003 (=> (not res!118554) (not e!156995))))

(assert (=> d!60003 (= res!118554 (or (bvsge #b00000000000000000000000000000000 (size!6038 (_keys!6583 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6038 (_keys!6583 thiss!1504))))))))

(declare-fun lt!121611 () ListLongMap!3591)

(assert (=> d!60003 (= lt!121606 lt!121611)))

(declare-fun lt!121594 () Unit!7423)

(assert (=> d!60003 (= lt!121594 e!157003)))

(declare-fun c!40356 () Bool)

(assert (=> d!60003 (= c!40356 e!156996)))

(declare-fun res!118558 () Bool)

(assert (=> d!60003 (=> (not res!118558) (not e!156996))))

(assert (=> d!60003 (= res!118558 (bvslt #b00000000000000000000000000000000 (size!6038 (_keys!6583 thiss!1504))))))

(assert (=> d!60003 (= lt!121611 e!156998)))

(assert (=> d!60003 (= c!40352 (and (not (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60003 (validMask!0 (mask!10550 thiss!1504))))

(assert (=> d!60003 (= (getCurrentListMap!1343 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)) lt!121606)))

(declare-fun b!241924 () Bool)

(declare-fun e!157000 () Bool)

(assert (=> b!241924 (= e!156994 e!157000)))

(declare-fun res!118557 () Bool)

(assert (=> b!241924 (=> (not res!118557) (not e!157000))))

(assert (=> b!241924 (= res!118557 (contains!1715 lt!121606 (select (arr!5696 (_keys!6583 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!241924 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6038 (_keys!6583 thiss!1504))))))

(declare-fun b!241925 () Bool)

(declare-fun get!2932 (ValueCell!2834 V!8121) V!8121)

(declare-fun dynLambda!565 (Int (_ BitVec 64)) V!8121)

(assert (=> b!241925 (= e!157000 (= (apply!222 lt!121606 (select (arr!5696 (_keys!6583 thiss!1504)) #b00000000000000000000000000000000)) (get!2932 (select (arr!5695 (_values!4460 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!565 (defaultEntry!4477 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!241925 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6037 (_values!4460 thiss!1504))))))

(assert (=> b!241925 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6038 (_keys!6583 thiss!1504))))))

(declare-fun b!241926 () Bool)

(assert (=> b!241926 (= e!157002 e!156993)))

(declare-fun res!118552 () Bool)

(assert (=> b!241926 (= res!118552 call!22503)))

(assert (=> b!241926 (=> (not res!118552) (not e!156993))))

(declare-fun b!241927 () Bool)

(assert (=> b!241927 (= e!156995 e!157002)))

(declare-fun c!40355 () Bool)

(assert (=> b!241927 (= c!40355 (not (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!241928 () Bool)

(assert (=> b!241928 (= e!156999 call!22505)))

(declare-fun b!241929 () Bool)

(declare-fun lt!121608 () Unit!7423)

(assert (=> b!241929 (= e!157003 lt!121608)))

(declare-fun lt!121607 () ListLongMap!3591)

(assert (=> b!241929 (= lt!121607 (getCurrentListMapNoExtraKeys!538 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)))))

(declare-fun lt!121605 () (_ BitVec 64))

(assert (=> b!241929 (= lt!121605 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121591 () (_ BitVec 64))

(assert (=> b!241929 (= lt!121591 (select (arr!5696 (_keys!6583 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121595 () Unit!7423)

(declare-fun addStillContains!198 (ListLongMap!3591 (_ BitVec 64) V!8121 (_ BitVec 64)) Unit!7423)

(assert (=> b!241929 (= lt!121595 (addStillContains!198 lt!121607 lt!121605 (zeroValue!4318 thiss!1504) lt!121591))))

(assert (=> b!241929 (contains!1715 (+!649 lt!121607 (tuple2!4677 lt!121605 (zeroValue!4318 thiss!1504))) lt!121591)))

(declare-fun lt!121599 () Unit!7423)

(assert (=> b!241929 (= lt!121599 lt!121595)))

(declare-fun lt!121609 () ListLongMap!3591)

(assert (=> b!241929 (= lt!121609 (getCurrentListMapNoExtraKeys!538 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)))))

(declare-fun lt!121592 () (_ BitVec 64))

(assert (=> b!241929 (= lt!121592 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121604 () (_ BitVec 64))

(assert (=> b!241929 (= lt!121604 (select (arr!5696 (_keys!6583 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121602 () Unit!7423)

(declare-fun addApplyDifferent!198 (ListLongMap!3591 (_ BitVec 64) V!8121 (_ BitVec 64)) Unit!7423)

(assert (=> b!241929 (= lt!121602 (addApplyDifferent!198 lt!121609 lt!121592 (minValue!4318 thiss!1504) lt!121604))))

(assert (=> b!241929 (= (apply!222 (+!649 lt!121609 (tuple2!4677 lt!121592 (minValue!4318 thiss!1504))) lt!121604) (apply!222 lt!121609 lt!121604))))

(declare-fun lt!121610 () Unit!7423)

(assert (=> b!241929 (= lt!121610 lt!121602)))

(declare-fun lt!121600 () ListLongMap!3591)

(assert (=> b!241929 (= lt!121600 (getCurrentListMapNoExtraKeys!538 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)))))

(declare-fun lt!121603 () (_ BitVec 64))

(assert (=> b!241929 (= lt!121603 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121596 () (_ BitVec 64))

(assert (=> b!241929 (= lt!121596 (select (arr!5696 (_keys!6583 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121598 () Unit!7423)

(assert (=> b!241929 (= lt!121598 (addApplyDifferent!198 lt!121600 lt!121603 (zeroValue!4318 thiss!1504) lt!121596))))

(assert (=> b!241929 (= (apply!222 (+!649 lt!121600 (tuple2!4677 lt!121603 (zeroValue!4318 thiss!1504))) lt!121596) (apply!222 lt!121600 lt!121596))))

(declare-fun lt!121612 () Unit!7423)

(assert (=> b!241929 (= lt!121612 lt!121598)))

(declare-fun lt!121597 () ListLongMap!3591)

(assert (=> b!241929 (= lt!121597 (getCurrentListMapNoExtraKeys!538 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)))))

(declare-fun lt!121601 () (_ BitVec 64))

(assert (=> b!241929 (= lt!121601 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121593 () (_ BitVec 64))

(assert (=> b!241929 (= lt!121593 (select (arr!5696 (_keys!6583 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!241929 (= lt!121608 (addApplyDifferent!198 lt!121597 lt!121601 (minValue!4318 thiss!1504) lt!121593))))

(assert (=> b!241929 (= (apply!222 (+!649 lt!121597 (tuple2!4677 lt!121601 (minValue!4318 thiss!1504))) lt!121593) (apply!222 lt!121597 lt!121593))))

(assert (= (and d!60003 c!40352) b!241922))

(assert (= (and d!60003 (not c!40352)) b!241913))

(assert (= (and b!241913 c!40353) b!241928))

(assert (= (and b!241913 (not c!40353)) b!241912))

(assert (= (and b!241912 c!40354) b!241919))

(assert (= (and b!241912 (not c!40354)) b!241923))

(assert (= (or b!241919 b!241923) bm!22503))

(assert (= (or b!241928 bm!22503) bm!22502))

(assert (= (or b!241928 b!241919) bm!22499))

(assert (= (or b!241922 bm!22502) bm!22500))

(assert (= (or b!241922 bm!22499) bm!22498))

(assert (= (and d!60003 res!118558) b!241911))

(assert (= (and d!60003 c!40356) b!241929))

(assert (= (and d!60003 (not c!40356)) b!241916))

(assert (= (and d!60003 res!118554) b!241920))

(assert (= (and b!241920 res!118559) b!241909))

(assert (= (and b!241920 (not res!118555)) b!241924))

(assert (= (and b!241924 res!118557) b!241925))

(assert (= (and b!241920 res!118560) b!241918))

(assert (= (and b!241918 c!40357) b!241914))

(assert (= (and b!241918 (not c!40357)) b!241917))

(assert (= (and b!241914 res!118553) b!241915))

(assert (= (or b!241914 b!241917) bm!22497))

(assert (= (and b!241918 res!118556) b!241927))

(assert (= (and b!241927 c!40355) b!241926))

(assert (= (and b!241927 (not c!40355)) b!241921))

(assert (= (and b!241926 res!118552) b!241910))

(assert (= (or b!241926 b!241921) bm!22501))

(declare-fun b_lambda!8013 () Bool)

(assert (=> (not b_lambda!8013) (not b!241925)))

(declare-fun t!8539 () Bool)

(declare-fun tb!2949 () Bool)

(assert (=> (and b!241695 (= (defaultEntry!4477 thiss!1504) (defaultEntry!4477 thiss!1504)) t!8539) tb!2949))

(declare-fun result!5185 () Bool)

(assert (=> tb!2949 (= result!5185 tp_is_empty!6355)))

(assert (=> b!241925 t!8539))

(declare-fun b_and!13485 () Bool)

(assert (= b_and!13479 (and (=> t!8539 result!5185) b_and!13485)))

(assert (=> b!241909 m!261057))

(assert (=> b!241909 m!261057))

(declare-fun m!261091 () Bool)

(assert (=> b!241909 m!261091))

(declare-fun m!261093 () Bool)

(assert (=> b!241915 m!261093))

(declare-fun m!261095 () Bool)

(assert (=> b!241929 m!261095))

(declare-fun m!261097 () Bool)

(assert (=> b!241929 m!261097))

(assert (=> b!241929 m!261095))

(declare-fun m!261099 () Bool)

(assert (=> b!241929 m!261099))

(declare-fun m!261101 () Bool)

(assert (=> b!241929 m!261101))

(declare-fun m!261103 () Bool)

(assert (=> b!241929 m!261103))

(declare-fun m!261105 () Bool)

(assert (=> b!241929 m!261105))

(assert (=> b!241929 m!261101))

(declare-fun m!261107 () Bool)

(assert (=> b!241929 m!261107))

(declare-fun m!261109 () Bool)

(assert (=> b!241929 m!261109))

(declare-fun m!261111 () Bool)

(assert (=> b!241929 m!261111))

(declare-fun m!261113 () Bool)

(assert (=> b!241929 m!261113))

(declare-fun m!261115 () Bool)

(assert (=> b!241929 m!261115))

(declare-fun m!261117 () Bool)

(assert (=> b!241929 m!261117))

(assert (=> b!241929 m!261111))

(assert (=> b!241929 m!261099))

(declare-fun m!261119 () Bool)

(assert (=> b!241929 m!261119))

(declare-fun m!261121 () Bool)

(assert (=> b!241929 m!261121))

(assert (=> b!241929 m!261057))

(declare-fun m!261123 () Bool)

(assert (=> b!241929 m!261123))

(declare-fun m!261125 () Bool)

(assert (=> b!241929 m!261125))

(declare-fun m!261127 () Bool)

(assert (=> b!241925 m!261127))

(assert (=> b!241925 m!261127))

(declare-fun m!261129 () Bool)

(assert (=> b!241925 m!261129))

(declare-fun m!261131 () Bool)

(assert (=> b!241925 m!261131))

(assert (=> b!241925 m!261057))

(assert (=> b!241925 m!261057))

(declare-fun m!261133 () Bool)

(assert (=> b!241925 m!261133))

(assert (=> b!241925 m!261129))

(declare-fun m!261135 () Bool)

(assert (=> bm!22498 m!261135))

(declare-fun m!261137 () Bool)

(assert (=> b!241910 m!261137))

(declare-fun m!261139 () Bool)

(assert (=> bm!22497 m!261139))

(declare-fun m!261141 () Bool)

(assert (=> bm!22501 m!261141))

(declare-fun m!261143 () Bool)

(assert (=> b!241922 m!261143))

(assert (=> d!60003 m!261051))

(assert (=> b!241911 m!261057))

(assert (=> b!241911 m!261057))

(assert (=> b!241911 m!261091))

(assert (=> b!241924 m!261057))

(assert (=> b!241924 m!261057))

(declare-fun m!261145 () Bool)

(assert (=> b!241924 m!261145))

(assert (=> bm!22500 m!261109))

(assert (=> b!241679 d!60003))

(declare-fun bm!22508 () Bool)

(declare-fun c!40363 () Bool)

(declare-fun call!22512 () Bool)

(declare-fun lt!121617 () SeekEntryResult!1025)

(assert (=> bm!22508 (= call!22512 (inRange!0 (ite c!40363 (index!6270 lt!121617) (index!6273 lt!121617)) (mask!10550 thiss!1504)))))

(declare-fun b!241948 () Bool)

(declare-fun e!157014 () Bool)

(declare-fun e!157012 () Bool)

(assert (=> b!241948 (= e!157014 e!157012)))

(declare-fun res!118571 () Bool)

(assert (=> b!241948 (= res!118571 call!22512)))

(assert (=> b!241948 (=> (not res!118571) (not e!157012))))

(declare-fun b!241950 () Bool)

(assert (=> b!241950 (and (bvsge (index!6270 lt!121617) #b00000000000000000000000000000000) (bvslt (index!6270 lt!121617) (size!6038 (_keys!6583 thiss!1504))))))

(declare-fun res!118572 () Bool)

(assert (=> b!241950 (= res!118572 (= (select (arr!5696 (_keys!6583 thiss!1504)) (index!6270 lt!121617)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241950 (=> (not res!118572) (not e!157012))))

(declare-fun bm!22509 () Bool)

(declare-fun call!22511 () Bool)

(assert (=> bm!22509 (= call!22511 (arrayContainsKey!0 (_keys!6583 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241951 () Bool)

(declare-fun res!118570 () Bool)

(declare-fun e!157013 () Bool)

(assert (=> b!241951 (=> (not res!118570) (not e!157013))))

(assert (=> b!241951 (= res!118570 (= (select (arr!5696 (_keys!6583 thiss!1504)) (index!6273 lt!121617)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241951 (and (bvsge (index!6273 lt!121617) #b00000000000000000000000000000000) (bvslt (index!6273 lt!121617) (size!6038 (_keys!6583 thiss!1504))))))

(declare-fun b!241952 () Bool)

(declare-fun e!157015 () Bool)

(assert (=> b!241952 (= e!157014 e!157015)))

(declare-fun c!40362 () Bool)

(assert (=> b!241952 (= c!40362 ((_ is MissingVacant!1025) lt!121617))))

(declare-fun b!241949 () Bool)

(assert (=> b!241949 (= e!157012 (not call!22511))))

(declare-fun d!60005 () Bool)

(assert (=> d!60005 e!157014))

(assert (=> d!60005 (= c!40363 ((_ is MissingZero!1025) lt!121617))))

(assert (=> d!60005 (= lt!121617 (seekEntryOrOpen!0 key!932 (_keys!6583 thiss!1504) (mask!10550 thiss!1504)))))

(declare-fun lt!121618 () Unit!7423)

(declare-fun choose!1130 (array!11991 array!11989 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 64) Int) Unit!7423)

(assert (=> d!60005 (= lt!121618 (choose!1130 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 (defaultEntry!4477 thiss!1504)))))

(assert (=> d!60005 (validMask!0 (mask!10550 thiss!1504))))

(assert (=> d!60005 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!344 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 (defaultEntry!4477 thiss!1504)) lt!121618)))

(declare-fun b!241953 () Bool)

(declare-fun res!118569 () Bool)

(assert (=> b!241953 (=> (not res!118569) (not e!157013))))

(assert (=> b!241953 (= res!118569 call!22512)))

(assert (=> b!241953 (= e!157015 e!157013)))

(declare-fun b!241954 () Bool)

(assert (=> b!241954 (= e!157015 ((_ is Undefined!1025) lt!121617))))

(declare-fun b!241955 () Bool)

(assert (=> b!241955 (= e!157013 (not call!22511))))

(assert (= (and d!60005 c!40363) b!241948))

(assert (= (and d!60005 (not c!40363)) b!241952))

(assert (= (and b!241948 res!118571) b!241950))

(assert (= (and b!241950 res!118572) b!241949))

(assert (= (and b!241952 c!40362) b!241953))

(assert (= (and b!241952 (not c!40362)) b!241954))

(assert (= (and b!241953 res!118569) b!241951))

(assert (= (and b!241951 res!118570) b!241955))

(assert (= (or b!241948 b!241953) bm!22508))

(assert (= (or b!241949 b!241955) bm!22509))

(assert (=> d!60005 m!260987))

(declare-fun m!261147 () Bool)

(assert (=> d!60005 m!261147))

(assert (=> d!60005 m!261051))

(declare-fun m!261149 () Bool)

(assert (=> bm!22508 m!261149))

(declare-fun m!261151 () Bool)

(assert (=> b!241950 m!261151))

(assert (=> bm!22509 m!260959))

(declare-fun m!261153 () Bool)

(assert (=> b!241951 m!261153))

(assert (=> b!241698 d!60005))

(declare-fun d!60007 () Bool)

(assert (=> d!60007 (= (inRange!0 (ite c!40301 (index!6270 lt!121482) (index!6273 lt!121482)) (mask!10550 thiss!1504)) (and (bvsge (ite c!40301 (index!6270 lt!121482) (index!6273 lt!121482)) #b00000000000000000000000000000000) (bvslt (ite c!40301 (index!6270 lt!121482) (index!6273 lt!121482)) (bvadd (mask!10550 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22469 d!60007))

(declare-fun d!60009 () Bool)

(assert (=> d!60009 (contains!1715 (getCurrentListMap!1343 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)) key!932)))

(declare-fun lt!121621 () Unit!7423)

(declare-fun choose!1131 (array!11991 array!11989 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 64) (_ BitVec 32) Int) Unit!7423)

(assert (=> d!60009 (= lt!121621 (choose!1131 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)))))

(assert (=> d!60009 (validMask!0 (mask!10550 thiss!1504))))

(assert (=> d!60009 (= (lemmaArrayContainsKeyThenInListMap!165 (_keys!6583 thiss!1504) (_values!4460 thiss!1504) (mask!10550 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)) lt!121621)))

(declare-fun bs!8872 () Bool)

(assert (= bs!8872 d!60009))

(assert (=> bs!8872 m!260979))

(assert (=> bs!8872 m!260979))

(assert (=> bs!8872 m!260981))

(declare-fun m!261155 () Bool)

(assert (=> bs!8872 m!261155))

(assert (=> bs!8872 m!261051))

(assert (=> b!241681 d!60009))

(declare-fun b!241962 () Bool)

(declare-fun e!157020 () Bool)

(assert (=> b!241962 (= e!157020 tp_is_empty!6355)))

(declare-fun b!241963 () Bool)

(declare-fun e!157021 () Bool)

(assert (=> b!241963 (= e!157021 tp_is_empty!6355)))

(declare-fun condMapEmpty!10777 () Bool)

(declare-fun mapDefault!10777 () ValueCell!2834)

(assert (=> mapNonEmpty!10768 (= condMapEmpty!10777 (= mapRest!10768 ((as const (Array (_ BitVec 32) ValueCell!2834)) mapDefault!10777)))))

(declare-fun mapRes!10777 () Bool)

(assert (=> mapNonEmpty!10768 (= tp!22686 (and e!157021 mapRes!10777))))

(declare-fun mapIsEmpty!10777 () Bool)

(assert (=> mapIsEmpty!10777 mapRes!10777))

(declare-fun mapNonEmpty!10777 () Bool)

(declare-fun tp!22702 () Bool)

(assert (=> mapNonEmpty!10777 (= mapRes!10777 (and tp!22702 e!157020))))

(declare-fun mapValue!10777 () ValueCell!2834)

(declare-fun mapKey!10777 () (_ BitVec 32))

(declare-fun mapRest!10777 () (Array (_ BitVec 32) ValueCell!2834))

(assert (=> mapNonEmpty!10777 (= mapRest!10768 (store mapRest!10777 mapKey!10777 mapValue!10777))))

(assert (= (and mapNonEmpty!10768 condMapEmpty!10777) mapIsEmpty!10777))

(assert (= (and mapNonEmpty!10768 (not condMapEmpty!10777)) mapNonEmpty!10777))

(assert (= (and mapNonEmpty!10777 ((_ is ValueCellFull!2834) mapValue!10777)) b!241962))

(assert (= (and mapNonEmpty!10768 ((_ is ValueCellFull!2834) mapDefault!10777)) b!241963))

(declare-fun m!261157 () Bool)

(assert (=> mapNonEmpty!10777 m!261157))

(declare-fun b_lambda!8015 () Bool)

(assert (= b_lambda!8013 (or (and b!241695 b_free!6493) b_lambda!8015)))

(check-sat (not d!60005) (not d!59991) (not d!60009) (not bm!22501) b_and!13485 (not bm!22508) (not b!241924) (not d!60001) (not b!241823) (not d!59995) (not bm!22500) (not d!60003) (not b!241856) (not b!241909) (not mapNonEmpty!10777) (not b!241922) (not b!241864) (not b!241830) (not d!59997) (not b!241929) (not b!241910) (not bm!22498) (not b_lambda!8015) (not bm!22497) (not b!241866) (not b!241837) (not b!241839) (not b!241911) (not b!241838) (not bm!22509) (not b!241925) (not b_next!6493) (not b!241915) tp_is_empty!6355)
(check-sat b_and!13485 (not b_next!6493))
