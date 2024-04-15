; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23292 () Bool)

(assert start!23292)

(declare-fun b!244533 () Bool)

(declare-fun b_free!6541 () Bool)

(declare-fun b_next!6541 () Bool)

(assert (=> b!244533 (= b_free!6541 (not b_next!6541))))

(declare-fun tp!22852 () Bool)

(declare-fun b_and!13501 () Bool)

(assert (=> b!244533 (= tp!22852 b_and!13501)))

(declare-fun b!244505 () Bool)

(declare-fun res!119903 () Bool)

(declare-fun e!158642 () Bool)

(assert (=> b!244505 (=> (not res!119903) (not e!158642))))

(declare-fun e!158653 () Bool)

(assert (=> b!244505 (= res!119903 e!158653)))

(declare-fun res!119907 () Bool)

(assert (=> b!244505 (=> res!119907 e!158653)))

(declare-fun e!158647 () Bool)

(assert (=> b!244505 (= res!119907 e!158647)))

(declare-fun res!119909 () Bool)

(assert (=> b!244505 (=> (not res!119909) (not e!158647))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!244505 (= res!119909 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!244506 () Bool)

(declare-fun res!119910 () Bool)

(declare-fun e!158646 () Bool)

(assert (=> b!244506 (=> (not res!119910) (not e!158646))))

(declare-fun call!22802 () Bool)

(assert (=> b!244506 (= res!119910 call!22802)))

(declare-fun e!158645 () Bool)

(assert (=> b!244506 (= e!158645 e!158646)))

(declare-fun b!244507 () Bool)

(declare-fun res!119911 () Bool)

(assert (=> b!244507 (=> (not res!119911) (not e!158642))))

(declare-datatypes ((V!8185 0))(
  ( (V!8186 (val!3246 Int)) )
))
(declare-datatypes ((ValueCell!2858 0))(
  ( (ValueCellFull!2858 (v!5291 V!8185)) (EmptyCell!2858) )
))
(declare-datatypes ((array!12093 0))(
  ( (array!12094 (arr!5739 (Array (_ BitVec 32) ValueCell!2858)) (size!6082 (_ BitVec 32))) )
))
(declare-datatypes ((array!12095 0))(
  ( (array!12096 (arr!5740 (Array (_ BitVec 32) (_ BitVec 64))) (size!6083 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3616 0))(
  ( (LongMapFixedSize!3617 (defaultEntry!4529 Int) (mask!10631 (_ BitVec 32)) (extraKeys!4266 (_ BitVec 32)) (zeroValue!4370 V!8185) (minValue!4370 V!8185) (_size!1857 (_ BitVec 32)) (_keys!6641 array!12095) (_values!4512 array!12093) (_vacant!1857 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3616)

(declare-datatypes ((List!3646 0))(
  ( (Nil!3643) (Cons!3642 (h!4299 (_ BitVec 64)) (t!8648 List!3646)) )
))
(declare-fun arrayNoDuplicates!0 (array!12095 (_ BitVec 32) List!3646) Bool)

(assert (=> b!244507 (= res!119911 (arrayNoDuplicates!0 (_keys!6641 thiss!1504) #b00000000000000000000000000000000 Nil!3643))))

(declare-fun b!244508 () Bool)

(declare-fun res!119908 () Bool)

(assert (=> b!244508 (=> (not res!119908) (not e!158642))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!244508 (= res!119908 (validKeyInArray!0 key!932))))

(declare-fun b!244509 () Bool)

(declare-datatypes ((Unit!7539 0))(
  ( (Unit!7540) )
))
(declare-fun e!158649 () Unit!7539)

(declare-fun Unit!7541 () Unit!7539)

(assert (=> b!244509 (= e!158649 Unit!7541)))

(declare-fun lt!122425 () Unit!7539)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!373 (array!12095 array!12093 (_ BitVec 32) (_ BitVec 32) V!8185 V!8185 (_ BitVec 64) Int) Unit!7539)

(assert (=> b!244509 (= lt!122425 (lemmaInListMapThenSeekEntryOrOpenFindsIt!373 (_keys!6641 thiss!1504) (_values!4512 thiss!1504) (mask!10631 thiss!1504) (extraKeys!4266 thiss!1504) (zeroValue!4370 thiss!1504) (minValue!4370 thiss!1504) key!932 (defaultEntry!4529 thiss!1504)))))

(assert (=> b!244509 false))

(declare-fun b!244510 () Bool)

(declare-fun lt!122420 () Unit!7539)

(assert (=> b!244510 (= e!158649 lt!122420)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!369 (array!12095 array!12093 (_ BitVec 32) (_ BitVec 32) V!8185 V!8185 (_ BitVec 64) Int) Unit!7539)

(assert (=> b!244510 (= lt!122420 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!369 (_keys!6641 thiss!1504) (_values!4512 thiss!1504) (mask!10631 thiss!1504) (extraKeys!4266 thiss!1504) (zeroValue!4370 thiss!1504) (minValue!4370 thiss!1504) key!932 (defaultEntry!4529 thiss!1504)))))

(declare-fun c!40812 () Bool)

(declare-datatypes ((SeekEntryResult!1080 0))(
  ( (MissingZero!1080 (index!6490 (_ BitVec 32))) (Found!1080 (index!6491 (_ BitVec 32))) (Intermediate!1080 (undefined!1892 Bool) (index!6492 (_ BitVec 32)) (x!24383 (_ BitVec 32))) (Undefined!1080) (MissingVacant!1080 (index!6493 (_ BitVec 32))) )
))
(declare-fun lt!122423 () SeekEntryResult!1080)

(get-info :version)

(assert (=> b!244510 (= c!40812 ((_ is MissingZero!1080) lt!122423))))

(assert (=> b!244510 e!158645))

(declare-fun b!244511 () Bool)

(declare-fun e!158648 () Bool)

(declare-fun e!158651 () Bool)

(assert (=> b!244511 (= e!158648 e!158651)))

(declare-fun res!119913 () Bool)

(assert (=> b!244511 (= res!119913 call!22802)))

(assert (=> b!244511 (=> (not res!119913) (not e!158651))))

(declare-fun bm!22799 () Bool)

(declare-fun call!22803 () Bool)

(declare-fun arrayContainsKey!0 (array!12095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22799 (= call!22803 (arrayContainsKey!0 (_keys!6641 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244512 () Bool)

(declare-fun res!119902 () Bool)

(assert (=> b!244512 (=> (not res!119902) (not e!158646))))

(assert (=> b!244512 (= res!119902 (= (select (arr!5740 (_keys!6641 thiss!1504)) (index!6490 lt!122423)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244513 () Bool)

(declare-fun e!158641 () Bool)

(declare-fun tp_is_empty!6403 () Bool)

(assert (=> b!244513 (= e!158641 tp_is_empty!6403)))

(declare-fun b!244514 () Bool)

(declare-fun res!119916 () Bool)

(declare-fun e!158650 () Bool)

(assert (=> b!244514 (=> (not res!119916) (not e!158650))))

(assert (=> b!244514 (= res!119916 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10861 () Bool)

(declare-fun mapRes!10861 () Bool)

(declare-fun tp!22851 () Bool)

(assert (=> mapNonEmpty!10861 (= mapRes!10861 (and tp!22851 e!158641))))

(declare-fun mapKey!10861 () (_ BitVec 32))

(declare-fun mapValue!10861 () ValueCell!2858)

(declare-fun mapRest!10861 () (Array (_ BitVec 32) ValueCell!2858))

(assert (=> mapNonEmpty!10861 (= (arr!5739 (_values!4512 thiss!1504)) (store mapRest!10861 mapKey!10861 mapValue!10861))))

(declare-fun b!244515 () Bool)

(assert (=> b!244515 (= e!158651 (not call!22803))))

(declare-fun b!244516 () Bool)

(declare-fun e!158638 () Bool)

(assert (=> b!244516 (= e!158638 e!158642)))

(declare-fun res!119914 () Bool)

(assert (=> b!244516 (=> (not res!119914) (not e!158642))))

(assert (=> b!244516 (= res!119914 (and (bvslt (size!6083 (_keys!6641 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6083 (_keys!6641 thiss!1504)))))))

(declare-fun lt!122422 () Unit!7539)

(declare-fun e!158639 () Unit!7539)

(assert (=> b!244516 (= lt!122422 e!158639)))

(declare-fun c!40810 () Bool)

(declare-fun lt!122424 () Bool)

(assert (=> b!244516 (= c!40810 lt!122424)))

(assert (=> b!244516 (= lt!122424 (arrayContainsKey!0 (_keys!6641 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244517 () Bool)

(declare-fun e!158637 () Bool)

(declare-fun contains!1748 (List!3646 (_ BitVec 64)) Bool)

(assert (=> b!244517 (= e!158637 (not (contains!1748 Nil!3643 key!932)))))

(declare-fun bm!22800 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22800 (= call!22802 (inRange!0 (ite c!40812 (index!6490 lt!122423) (index!6493 lt!122423)) (mask!10631 thiss!1504)))))

(declare-fun b!244518 () Bool)

(declare-fun c!40811 () Bool)

(assert (=> b!244518 (= c!40811 ((_ is MissingVacant!1080) lt!122423))))

(assert (=> b!244518 (= e!158645 e!158648)))

(declare-fun b!244519 () Bool)

(declare-fun e!158643 () Bool)

(assert (=> b!244519 (= e!158650 e!158643)))

(declare-fun res!119920 () Bool)

(assert (=> b!244519 (=> (not res!119920) (not e!158643))))

(assert (=> b!244519 (= res!119920 (or (= lt!122423 (MissingZero!1080 index!297)) (= lt!122423 (MissingVacant!1080 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12095 (_ BitVec 32)) SeekEntryResult!1080)

(assert (=> b!244519 (= lt!122423 (seekEntryOrOpen!0 key!932 (_keys!6641 thiss!1504) (mask!10631 thiss!1504)))))

(declare-fun b!244520 () Bool)

(assert (=> b!244520 (= e!158653 e!158637)))

(declare-fun res!119904 () Bool)

(assert (=> b!244520 (=> (not res!119904) (not e!158637))))

(assert (=> b!244520 (= res!119904 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!244521 () Bool)

(declare-fun e!158644 () Bool)

(declare-fun e!158654 () Bool)

(assert (=> b!244521 (= e!158644 (and e!158654 mapRes!10861))))

(declare-fun condMapEmpty!10861 () Bool)

(declare-fun mapDefault!10861 () ValueCell!2858)

(assert (=> b!244521 (= condMapEmpty!10861 (= (arr!5739 (_values!4512 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2858)) mapDefault!10861)))))

(declare-fun b!244522 () Bool)

(assert (=> b!244522 (= e!158654 tp_is_empty!6403)))

(declare-fun b!244523 () Bool)

(declare-fun Unit!7542 () Unit!7539)

(assert (=> b!244523 (= e!158639 Unit!7542)))

(declare-fun b!244524 () Bool)

(assert (=> b!244524 (= e!158648 ((_ is Undefined!1080) lt!122423))))

(declare-fun res!119918 () Bool)

(assert (=> start!23292 (=> (not res!119918) (not e!158650))))

(declare-fun valid!1426 (LongMapFixedSize!3616) Bool)

(assert (=> start!23292 (= res!119918 (valid!1426 thiss!1504))))

(assert (=> start!23292 e!158650))

(declare-fun e!158652 () Bool)

(assert (=> start!23292 e!158652))

(assert (=> start!23292 true))

(declare-fun mapIsEmpty!10861 () Bool)

(assert (=> mapIsEmpty!10861 mapRes!10861))

(declare-fun b!244525 () Bool)

(declare-fun res!119917 () Bool)

(assert (=> b!244525 (= res!119917 (= (select (arr!5740 (_keys!6641 thiss!1504)) (index!6493 lt!122423)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244525 (=> (not res!119917) (not e!158651))))

(declare-fun b!244526 () Bool)

(assert (=> b!244526 (= e!158643 e!158638)))

(declare-fun res!119912 () Bool)

(assert (=> b!244526 (=> (not res!119912) (not e!158638))))

(assert (=> b!244526 (= res!119912 (inRange!0 index!297 (mask!10631 thiss!1504)))))

(declare-fun lt!122419 () Unit!7539)

(assert (=> b!244526 (= lt!122419 e!158649)))

(declare-fun c!40813 () Bool)

(declare-datatypes ((tuple2!4744 0))(
  ( (tuple2!4745 (_1!2383 (_ BitVec 64)) (_2!2383 V!8185)) )
))
(declare-datatypes ((List!3647 0))(
  ( (Nil!3644) (Cons!3643 (h!4300 tuple2!4744) (t!8649 List!3647)) )
))
(declare-datatypes ((ListLongMap!3647 0))(
  ( (ListLongMap!3648 (toList!1839 List!3647)) )
))
(declare-fun contains!1749 (ListLongMap!3647 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1348 (array!12095 array!12093 (_ BitVec 32) (_ BitVec 32) V!8185 V!8185 (_ BitVec 32) Int) ListLongMap!3647)

(assert (=> b!244526 (= c!40813 (contains!1749 (getCurrentListMap!1348 (_keys!6641 thiss!1504) (_values!4512 thiss!1504) (mask!10631 thiss!1504) (extraKeys!4266 thiss!1504) (zeroValue!4370 thiss!1504) (minValue!4370 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4529 thiss!1504)) key!932))))

(declare-fun b!244527 () Bool)

(declare-fun res!119905 () Bool)

(assert (=> b!244527 (=> (not res!119905) (not e!158642))))

(assert (=> b!244527 (= res!119905 (not (contains!1748 Nil!3643 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!244528 () Bool)

(declare-fun res!119906 () Bool)

(assert (=> b!244528 (=> (not res!119906) (not e!158642))))

(assert (=> b!244528 (= res!119906 (not (contains!1748 Nil!3643 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!244529 () Bool)

(declare-fun Unit!7543 () Unit!7539)

(assert (=> b!244529 (= e!158639 Unit!7543)))

(declare-fun lt!122421 () Unit!7539)

(declare-fun lemmaArrayContainsKeyThenInListMap!180 (array!12095 array!12093 (_ BitVec 32) (_ BitVec 32) V!8185 V!8185 (_ BitVec 64) (_ BitVec 32) Int) Unit!7539)

(assert (=> b!244529 (= lt!122421 (lemmaArrayContainsKeyThenInListMap!180 (_keys!6641 thiss!1504) (_values!4512 thiss!1504) (mask!10631 thiss!1504) (extraKeys!4266 thiss!1504) (zeroValue!4370 thiss!1504) (minValue!4370 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4529 thiss!1504)))))

(assert (=> b!244529 false))

(declare-fun b!244530 () Bool)

(assert (=> b!244530 (= e!158646 (not call!22803))))

(declare-fun b!244531 () Bool)

(declare-fun res!119915 () Bool)

(assert (=> b!244531 (=> (not res!119915) (not e!158642))))

(declare-fun noDuplicate!103 (List!3646) Bool)

(assert (=> b!244531 (= res!119915 (noDuplicate!103 Nil!3643))))

(declare-fun b!244532 () Bool)

(assert (=> b!244532 (= e!158642 lt!122424)))

(declare-fun array_inv!3785 (array!12095) Bool)

(declare-fun array_inv!3786 (array!12093) Bool)

(assert (=> b!244533 (= e!158652 (and tp!22852 tp_is_empty!6403 (array_inv!3785 (_keys!6641 thiss!1504)) (array_inv!3786 (_values!4512 thiss!1504)) e!158644))))

(declare-fun b!244534 () Bool)

(declare-fun res!119919 () Bool)

(assert (=> b!244534 (=> (not res!119919) (not e!158642))))

(assert (=> b!244534 (= res!119919 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6083 (_keys!6641 thiss!1504)))))))

(declare-fun b!244535 () Bool)

(assert (=> b!244535 (= e!158647 (contains!1748 Nil!3643 key!932))))

(assert (= (and start!23292 res!119918) b!244514))

(assert (= (and b!244514 res!119916) b!244519))

(assert (= (and b!244519 res!119920) b!244526))

(assert (= (and b!244526 c!40813) b!244509))

(assert (= (and b!244526 (not c!40813)) b!244510))

(assert (= (and b!244510 c!40812) b!244506))

(assert (= (and b!244510 (not c!40812)) b!244518))

(assert (= (and b!244506 res!119910) b!244512))

(assert (= (and b!244512 res!119902) b!244530))

(assert (= (and b!244518 c!40811) b!244511))

(assert (= (and b!244518 (not c!40811)) b!244524))

(assert (= (and b!244511 res!119913) b!244525))

(assert (= (and b!244525 res!119917) b!244515))

(assert (= (or b!244506 b!244511) bm!22800))

(assert (= (or b!244530 b!244515) bm!22799))

(assert (= (and b!244526 res!119912) b!244516))

(assert (= (and b!244516 c!40810) b!244529))

(assert (= (and b!244516 (not c!40810)) b!244523))

(assert (= (and b!244516 res!119914) b!244531))

(assert (= (and b!244531 res!119915) b!244528))

(assert (= (and b!244528 res!119906) b!244527))

(assert (= (and b!244527 res!119905) b!244505))

(assert (= (and b!244505 res!119909) b!244535))

(assert (= (and b!244505 (not res!119907)) b!244520))

(assert (= (and b!244520 res!119904) b!244517))

(assert (= (and b!244505 res!119903) b!244507))

(assert (= (and b!244507 res!119911) b!244534))

(assert (= (and b!244534 res!119919) b!244508))

(assert (= (and b!244508 res!119908) b!244532))

(assert (= (and b!244521 condMapEmpty!10861) mapIsEmpty!10861))

(assert (= (and b!244521 (not condMapEmpty!10861)) mapNonEmpty!10861))

(assert (= (and mapNonEmpty!10861 ((_ is ValueCellFull!2858) mapValue!10861)) b!244513))

(assert (= (and b!244521 ((_ is ValueCellFull!2858) mapDefault!10861)) b!244522))

(assert (= b!244533 b!244521))

(assert (= start!23292 b!244533))

(declare-fun m!261921 () Bool)

(assert (=> b!244517 m!261921))

(assert (=> b!244535 m!261921))

(declare-fun m!261923 () Bool)

(assert (=> b!244531 m!261923))

(declare-fun m!261925 () Bool)

(assert (=> start!23292 m!261925))

(declare-fun m!261927 () Bool)

(assert (=> b!244509 m!261927))

(declare-fun m!261929 () Bool)

(assert (=> b!244519 m!261929))

(declare-fun m!261931 () Bool)

(assert (=> b!244528 m!261931))

(declare-fun m!261933 () Bool)

(assert (=> b!244533 m!261933))

(declare-fun m!261935 () Bool)

(assert (=> b!244533 m!261935))

(declare-fun m!261937 () Bool)

(assert (=> mapNonEmpty!10861 m!261937))

(declare-fun m!261939 () Bool)

(assert (=> b!244512 m!261939))

(declare-fun m!261941 () Bool)

(assert (=> b!244529 m!261941))

(declare-fun m!261943 () Bool)

(assert (=> b!244527 m!261943))

(declare-fun m!261945 () Bool)

(assert (=> b!244525 m!261945))

(declare-fun m!261947 () Bool)

(assert (=> bm!22800 m!261947))

(declare-fun m!261949 () Bool)

(assert (=> b!244510 m!261949))

(declare-fun m!261951 () Bool)

(assert (=> b!244507 m!261951))

(declare-fun m!261953 () Bool)

(assert (=> b!244508 m!261953))

(declare-fun m!261955 () Bool)

(assert (=> bm!22799 m!261955))

(declare-fun m!261957 () Bool)

(assert (=> b!244526 m!261957))

(declare-fun m!261959 () Bool)

(assert (=> b!244526 m!261959))

(assert (=> b!244526 m!261959))

(declare-fun m!261961 () Bool)

(assert (=> b!244526 m!261961))

(assert (=> b!244516 m!261955))

(check-sat (not mapNonEmpty!10861) (not bm!22800) (not b!244508) tp_is_empty!6403 (not b!244517) (not b!244533) (not b!244531) (not b!244510) (not b!244516) (not b_next!6541) (not bm!22799) (not b!244527) (not b!244526) (not b!244507) (not b!244528) (not b!244535) (not b!244509) (not start!23292) (not b!244529) b_and!13501 (not b!244519))
(check-sat b_and!13501 (not b_next!6541))
