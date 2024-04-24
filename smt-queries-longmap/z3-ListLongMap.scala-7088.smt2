; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89922 () Bool)

(assert start!89922)

(declare-fun b!1029620 () Bool)

(declare-fun b_free!20581 () Bool)

(declare-fun b_next!20581 () Bool)

(assert (=> b!1029620 (= b_free!20581 (not b_next!20581))))

(declare-fun tp!72795 () Bool)

(declare-fun b_and!32873 () Bool)

(assert (=> b!1029620 (= tp!72795 b_and!32873)))

(declare-fun b!1029614 () Bool)

(declare-fun e!581280 () Bool)

(declare-fun tp_is_empty!24301 () Bool)

(assert (=> b!1029614 (= e!581280 tp_is_empty!24301)))

(declare-fun b!1029615 () Bool)

(declare-fun e!581278 () Bool)

(declare-fun mapRes!37887 () Bool)

(assert (=> b!1029615 (= e!581278 (and e!581280 mapRes!37887))))

(declare-fun condMapEmpty!37887 () Bool)

(declare-datatypes ((V!37275 0))(
  ( (V!37276 (val!12201 Int)) )
))
(declare-datatypes ((ValueCell!11447 0))(
  ( (ValueCellFull!11447 (v!14768 V!37275)) (EmptyCell!11447) )
))
(declare-datatypes ((array!64705 0))(
  ( (array!64706 (arr!31153 (Array (_ BitVec 32) (_ BitVec 64))) (size!31668 (_ BitVec 32))) )
))
(declare-datatypes ((array!64707 0))(
  ( (array!64708 (arr!31154 (Array (_ BitVec 32) ValueCell!11447)) (size!31669 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5488 0))(
  ( (LongMapFixedSize!5489 (defaultEntry!6102 Int) (mask!29897 (_ BitVec 32)) (extraKeys!5834 (_ BitVec 32)) (zeroValue!5938 V!37275) (minValue!5938 V!37275) (_size!2799 (_ BitVec 32)) (_keys!11294 array!64705) (_values!6125 array!64707) (_vacant!2799 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5488)

(declare-fun mapDefault!37887 () ValueCell!11447)

(assert (=> b!1029615 (= condMapEmpty!37887 (= (arr!31154 (_values!6125 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11447)) mapDefault!37887)))))

(declare-fun b!1029616 () Bool)

(declare-fun e!581284 () Bool)

(declare-datatypes ((Unit!33586 0))(
  ( (Unit!33587) )
))
(declare-datatypes ((tuple2!15550 0))(
  ( (tuple2!15551 (_1!7786 Unit!33586) (_2!7786 LongMapFixedSize!5488)) )
))
(declare-fun lt!453431 () tuple2!15550)

(assert (=> b!1029616 (= e!581284 (or (not (= (size!31669 (_values!6125 (_2!7786 lt!453431))) (bvadd #b00000000000000000000000000000001 (mask!29897 (_2!7786 lt!453431))))) (= (size!31668 (_keys!11294 (_2!7786 lt!453431))) (size!31669 (_values!6125 (_2!7786 lt!453431))))))))

(declare-fun mapIsEmpty!37887 () Bool)

(assert (=> mapIsEmpty!37887 mapRes!37887))

(declare-fun b!1029617 () Bool)

(declare-fun e!581283 () Bool)

(assert (=> b!1029617 (= e!581283 (not e!581284))))

(declare-fun res!688605 () Bool)

(assert (=> b!1029617 (=> res!688605 e!581284)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1029617 (= res!688605 (not (validMask!0 (mask!29897 (_2!7786 lt!453431)))))))

(declare-fun lt!453435 () array!64707)

(declare-fun lt!453437 () array!64705)

(declare-fun Unit!33588 () Unit!33586)

(declare-fun Unit!33589 () Unit!33586)

(assert (=> b!1029617 (= lt!453431 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2799 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15551 Unit!33588 (LongMapFixedSize!5489 (defaultEntry!6102 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (bvsub (_size!2799 thiss!1427) #b00000000000000000000000000000001) lt!453437 lt!453435 (bvadd #b00000000000000000000000000000001 (_vacant!2799 thiss!1427)))) (tuple2!15551 Unit!33589 (LongMapFixedSize!5489 (defaultEntry!6102 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (bvsub (_size!2799 thiss!1427) #b00000000000000000000000000000001) lt!453437 lt!453435 (_vacant!2799 thiss!1427)))))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15552 0))(
  ( (tuple2!15553 (_1!7787 (_ BitVec 64)) (_2!7787 V!37275)) )
))
(declare-datatypes ((List!21802 0))(
  ( (Nil!21799) (Cons!21798 (h!23006 tuple2!15552) (t!30870 List!21802)) )
))
(declare-datatypes ((ListLongMap!13685 0))(
  ( (ListLongMap!13686 (toList!6858 List!21802)) )
))
(declare-fun -!481 (ListLongMap!13685 (_ BitVec 64)) ListLongMap!13685)

(declare-fun getCurrentListMap!3904 (array!64705 array!64707 (_ BitVec 32) (_ BitVec 32) V!37275 V!37275 (_ BitVec 32) Int) ListLongMap!13685)

(assert (=> b!1029617 (= (-!481 (getCurrentListMap!3904 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) key!909) (getCurrentListMap!3904 lt!453437 lt!453435 (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9633 0))(
  ( (MissingZero!9633 (index!40903 (_ BitVec 32))) (Found!9633 (index!40904 (_ BitVec 32))) (Intermediate!9633 (undefined!10445 Bool) (index!40905 (_ BitVec 32)) (x!91483 (_ BitVec 32))) (Undefined!9633) (MissingVacant!9633 (index!40906 (_ BitVec 32))) )
))
(declare-fun lt!453434 () SeekEntryResult!9633)

(declare-fun dynLambda!1975 (Int (_ BitVec 64)) V!37275)

(assert (=> b!1029617 (= lt!453435 (array!64708 (store (arr!31154 (_values!6125 thiss!1427)) (index!40904 lt!453434) (ValueCellFull!11447 (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31669 (_values!6125 thiss!1427))))))

(declare-fun lt!453430 () Unit!33586)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!7 (array!64705 array!64707 (_ BitVec 32) (_ BitVec 32) V!37275 V!37275 (_ BitVec 32) (_ BitVec 64) Int) Unit!33586)

(assert (=> b!1029617 (= lt!453430 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!7 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (index!40904 lt!453434) key!909 (defaultEntry!6102 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1029617 (not (arrayContainsKey!0 lt!453437 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!453436 () Unit!33586)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64705 (_ BitVec 32) (_ BitVec 64)) Unit!33586)

(assert (=> b!1029617 (= lt!453436 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11294 thiss!1427) (index!40904 lt!453434) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64705 (_ BitVec 32)) Bool)

(assert (=> b!1029617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453437 (mask!29897 thiss!1427))))

(declare-fun lt!453438 () Unit!33586)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64705 (_ BitVec 32) (_ BitVec 32)) Unit!33586)

(assert (=> b!1029617 (= lt!453438 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11294 thiss!1427) (index!40904 lt!453434) (mask!29897 thiss!1427)))))

(declare-datatypes ((List!21803 0))(
  ( (Nil!21800) (Cons!21799 (h!23007 (_ BitVec 64)) (t!30871 List!21803)) )
))
(declare-fun arrayNoDuplicates!0 (array!64705 (_ BitVec 32) List!21803) Bool)

(assert (=> b!1029617 (arrayNoDuplicates!0 lt!453437 #b00000000000000000000000000000000 Nil!21800)))

(declare-fun lt!453433 () Unit!33586)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64705 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21803) Unit!33586)

(assert (=> b!1029617 (= lt!453433 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11294 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40904 lt!453434) #b00000000000000000000000000000000 Nil!21800))))

(declare-fun arrayCountValidKeys!0 (array!64705 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1029617 (= (arrayCountValidKeys!0 lt!453437 #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11294 thiss!1427) #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1029617 (= lt!453437 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun lt!453432 () Unit!33586)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64705 (_ BitVec 32) (_ BitVec 64)) Unit!33586)

(assert (=> b!1029617 (= lt!453432 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11294 thiss!1427) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029618 () Bool)

(declare-fun e!581285 () Bool)

(assert (=> b!1029618 (= e!581285 tp_is_empty!24301)))

(declare-fun mapNonEmpty!37887 () Bool)

(declare-fun tp!72796 () Bool)

(assert (=> mapNonEmpty!37887 (= mapRes!37887 (and tp!72796 e!581285))))

(declare-fun mapRest!37887 () (Array (_ BitVec 32) ValueCell!11447))

(declare-fun mapKey!37887 () (_ BitVec 32))

(declare-fun mapValue!37887 () ValueCell!11447)

(assert (=> mapNonEmpty!37887 (= (arr!31154 (_values!6125 thiss!1427)) (store mapRest!37887 mapKey!37887 mapValue!37887))))

(declare-fun b!1029619 () Bool)

(declare-fun e!581281 () Bool)

(assert (=> b!1029619 (= e!581281 e!581283)))

(declare-fun res!688602 () Bool)

(assert (=> b!1029619 (=> (not res!688602) (not e!581283))))

(get-info :version)

(assert (=> b!1029619 (= res!688602 ((_ is Found!9633) lt!453434))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64705 (_ BitVec 32)) SeekEntryResult!9633)

(assert (=> b!1029619 (= lt!453434 (seekEntry!0 key!909 (_keys!11294 thiss!1427) (mask!29897 thiss!1427)))))

(declare-fun res!688604 () Bool)

(assert (=> start!89922 (=> (not res!688604) (not e!581281))))

(declare-fun valid!2084 (LongMapFixedSize!5488) Bool)

(assert (=> start!89922 (= res!688604 (valid!2084 thiss!1427))))

(assert (=> start!89922 e!581281))

(declare-fun e!581282 () Bool)

(assert (=> start!89922 e!581282))

(assert (=> start!89922 true))

(declare-fun array_inv!24133 (array!64705) Bool)

(declare-fun array_inv!24134 (array!64707) Bool)

(assert (=> b!1029620 (= e!581282 (and tp!72795 tp_is_empty!24301 (array_inv!24133 (_keys!11294 thiss!1427)) (array_inv!24134 (_values!6125 thiss!1427)) e!581278))))

(declare-fun b!1029621 () Bool)

(declare-fun res!688603 () Bool)

(assert (=> b!1029621 (=> (not res!688603) (not e!581281))))

(assert (=> b!1029621 (= res!688603 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!89922 res!688604) b!1029621))

(assert (= (and b!1029621 res!688603) b!1029619))

(assert (= (and b!1029619 res!688602) b!1029617))

(assert (= (and b!1029617 (not res!688605)) b!1029616))

(assert (= (and b!1029615 condMapEmpty!37887) mapIsEmpty!37887))

(assert (= (and b!1029615 (not condMapEmpty!37887)) mapNonEmpty!37887))

(assert (= (and mapNonEmpty!37887 ((_ is ValueCellFull!11447) mapValue!37887)) b!1029618))

(assert (= (and b!1029615 ((_ is ValueCellFull!11447) mapDefault!37887)) b!1029614))

(assert (= b!1029620 b!1029615))

(assert (= start!89922 b!1029620))

(declare-fun b_lambda!15793 () Bool)

(assert (=> (not b_lambda!15793) (not b!1029617)))

(declare-fun t!30869 () Bool)

(declare-fun tb!6891 () Bool)

(assert (=> (and b!1029620 (= (defaultEntry!6102 thiss!1427) (defaultEntry!6102 thiss!1427)) t!30869) tb!6891))

(declare-fun result!14109 () Bool)

(assert (=> tb!6891 (= result!14109 tp_is_empty!24301)))

(assert (=> b!1029617 t!30869))

(declare-fun b_and!32875 () Bool)

(assert (= b_and!32873 (and (=> t!30869 result!14109) b_and!32875)))

(declare-fun m!948763 () Bool)

(assert (=> start!89922 m!948763))

(declare-fun m!948765 () Bool)

(assert (=> b!1029617 m!948765))

(declare-fun m!948767 () Bool)

(assert (=> b!1029617 m!948767))

(declare-fun m!948769 () Bool)

(assert (=> b!1029617 m!948769))

(declare-fun m!948771 () Bool)

(assert (=> b!1029617 m!948771))

(declare-fun m!948773 () Bool)

(assert (=> b!1029617 m!948773))

(declare-fun m!948775 () Bool)

(assert (=> b!1029617 m!948775))

(declare-fun m!948777 () Bool)

(assert (=> b!1029617 m!948777))

(declare-fun m!948779 () Bool)

(assert (=> b!1029617 m!948779))

(declare-fun m!948781 () Bool)

(assert (=> b!1029617 m!948781))

(declare-fun m!948783 () Bool)

(assert (=> b!1029617 m!948783))

(declare-fun m!948785 () Bool)

(assert (=> b!1029617 m!948785))

(declare-fun m!948787 () Bool)

(assert (=> b!1029617 m!948787))

(declare-fun m!948789 () Bool)

(assert (=> b!1029617 m!948789))

(declare-fun m!948791 () Bool)

(assert (=> b!1029617 m!948791))

(declare-fun m!948793 () Bool)

(assert (=> b!1029617 m!948793))

(assert (=> b!1029617 m!948785))

(declare-fun m!948795 () Bool)

(assert (=> b!1029617 m!948795))

(declare-fun m!948797 () Bool)

(assert (=> b!1029617 m!948797))

(declare-fun m!948799 () Bool)

(assert (=> b!1029619 m!948799))

(declare-fun m!948801 () Bool)

(assert (=> b!1029620 m!948801))

(declare-fun m!948803 () Bool)

(assert (=> b!1029620 m!948803))

(declare-fun m!948805 () Bool)

(assert (=> mapNonEmpty!37887 m!948805))

(check-sat (not b!1029620) (not b!1029617) tp_is_empty!24301 (not b_lambda!15793) (not b!1029619) b_and!32875 (not start!89922) (not mapNonEmpty!37887) (not b_next!20581))
(check-sat b_and!32875 (not b_next!20581))
(get-model)

(declare-fun b_lambda!15799 () Bool)

(assert (= b_lambda!15793 (or (and b!1029620 b_free!20581) b_lambda!15799)))

(check-sat (not b!1029620) (not b!1029617) tp_is_empty!24301 (not b!1029619) (not b_lambda!15799) b_and!32875 (not start!89922) (not mapNonEmpty!37887) (not b_next!20581))
(check-sat b_and!32875 (not b_next!20581))
(get-model)

(declare-fun b!1029688 () Bool)

(declare-fun e!581340 () SeekEntryResult!9633)

(assert (=> b!1029688 (= e!581340 Undefined!9633)))

(declare-fun b!1029689 () Bool)

(declare-fun e!581341 () SeekEntryResult!9633)

(declare-fun lt!453504 () SeekEntryResult!9633)

(assert (=> b!1029689 (= e!581341 (ite ((_ is MissingVacant!9633) lt!453504) (MissingZero!9633 (index!40906 lt!453504)) lt!453504))))

(declare-fun lt!453501 () SeekEntryResult!9633)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64705 (_ BitVec 32)) SeekEntryResult!9633)

(assert (=> b!1029689 (= lt!453504 (seekKeyOrZeroReturnVacant!0 (x!91483 lt!453501) (index!40905 lt!453501) (index!40905 lt!453501) key!909 (_keys!11294 thiss!1427) (mask!29897 thiss!1427)))))

(declare-fun b!1029690 () Bool)

(declare-fun e!581342 () SeekEntryResult!9633)

(assert (=> b!1029690 (= e!581340 e!581342)))

(declare-fun lt!453502 () (_ BitVec 64))

(assert (=> b!1029690 (= lt!453502 (select (arr!31153 (_keys!11294 thiss!1427)) (index!40905 lt!453501)))))

(declare-fun c!104164 () Bool)

(assert (=> b!1029690 (= c!104164 (= lt!453502 key!909))))

(declare-fun b!1029691 () Bool)

(declare-fun c!104163 () Bool)

(assert (=> b!1029691 (= c!104163 (= lt!453502 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029691 (= e!581342 e!581341)))

(declare-fun b!1029692 () Bool)

(assert (=> b!1029692 (= e!581342 (Found!9633 (index!40905 lt!453501)))))

(declare-fun d!123409 () Bool)

(declare-fun lt!453503 () SeekEntryResult!9633)

(assert (=> d!123409 (and (or ((_ is MissingVacant!9633) lt!453503) (not ((_ is Found!9633) lt!453503)) (and (bvsge (index!40904 lt!453503) #b00000000000000000000000000000000) (bvslt (index!40904 lt!453503) (size!31668 (_keys!11294 thiss!1427))))) (not ((_ is MissingVacant!9633) lt!453503)) (or (not ((_ is Found!9633) lt!453503)) (= (select (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453503)) key!909)))))

(assert (=> d!123409 (= lt!453503 e!581340)))

(declare-fun c!104165 () Bool)

(assert (=> d!123409 (= c!104165 (and ((_ is Intermediate!9633) lt!453501) (undefined!10445 lt!453501)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64705 (_ BitVec 32)) SeekEntryResult!9633)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!123409 (= lt!453501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29897 thiss!1427)) key!909 (_keys!11294 thiss!1427) (mask!29897 thiss!1427)))))

(assert (=> d!123409 (validMask!0 (mask!29897 thiss!1427))))

(assert (=> d!123409 (= (seekEntry!0 key!909 (_keys!11294 thiss!1427) (mask!29897 thiss!1427)) lt!453503)))

(declare-fun b!1029693 () Bool)

(assert (=> b!1029693 (= e!581341 (MissingZero!9633 (index!40905 lt!453501)))))

(assert (= (and d!123409 c!104165) b!1029688))

(assert (= (and d!123409 (not c!104165)) b!1029690))

(assert (= (and b!1029690 c!104164) b!1029692))

(assert (= (and b!1029690 (not c!104164)) b!1029691))

(assert (= (and b!1029691 c!104163) b!1029693))

(assert (= (and b!1029691 (not c!104163)) b!1029689))

(declare-fun m!948895 () Bool)

(assert (=> b!1029689 m!948895))

(declare-fun m!948897 () Bool)

(assert (=> b!1029690 m!948897))

(declare-fun m!948899 () Bool)

(assert (=> d!123409 m!948899))

(declare-fun m!948901 () Bool)

(assert (=> d!123409 m!948901))

(assert (=> d!123409 m!948901))

(declare-fun m!948903 () Bool)

(assert (=> d!123409 m!948903))

(declare-fun m!948905 () Bool)

(assert (=> d!123409 m!948905))

(assert (=> b!1029619 d!123409))

(declare-fun d!123411 () Bool)

(declare-fun e!581345 () Bool)

(assert (=> d!123411 e!581345))

(declare-fun res!688632 () Bool)

(assert (=> d!123411 (=> (not res!688632) (not e!581345))))

(assert (=> d!123411 (= res!688632 (and (bvsge (index!40904 lt!453434) #b00000000000000000000000000000000) (bvslt (index!40904 lt!453434) (size!31668 (_keys!11294 thiss!1427)))))))

(declare-fun lt!453507 () Unit!33586)

(declare-fun choose!53 (array!64705 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21803) Unit!33586)

(assert (=> d!123411 (= lt!453507 (choose!53 (_keys!11294 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40904 lt!453434) #b00000000000000000000000000000000 Nil!21800))))

(assert (=> d!123411 (bvslt (size!31668 (_keys!11294 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!123411 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11294 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40904 lt!453434) #b00000000000000000000000000000000 Nil!21800) lt!453507)))

(declare-fun b!1029696 () Bool)

(assert (=> b!1029696 (= e!581345 (arrayNoDuplicates!0 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) #b00000000000000000000000000000000 Nil!21800))))

(assert (= (and d!123411 res!688632) b!1029696))

(declare-fun m!948907 () Bool)

(assert (=> d!123411 m!948907))

(assert (=> b!1029696 m!948771))

(declare-fun m!948909 () Bool)

(assert (=> b!1029696 m!948909))

(assert (=> b!1029617 d!123411))

(declare-fun b!1029705 () Bool)

(declare-fun e!581351 () (_ BitVec 32))

(declare-fun call!43408 () (_ BitVec 32))

(assert (=> b!1029705 (= e!581351 call!43408)))

(declare-fun d!123413 () Bool)

(declare-fun lt!453510 () (_ BitVec 32))

(assert (=> d!123413 (and (bvsge lt!453510 #b00000000000000000000000000000000) (bvsle lt!453510 (bvsub (size!31668 lt!453437) #b00000000000000000000000000000000)))))

(declare-fun e!581350 () (_ BitVec 32))

(assert (=> d!123413 (= lt!453510 e!581350)))

(declare-fun c!104171 () Bool)

(assert (=> d!123413 (= c!104171 (bvsge #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))))))

(assert (=> d!123413 (and (bvsle #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31668 (_keys!11294 thiss!1427)) (size!31668 lt!453437)))))

(assert (=> d!123413 (= (arrayCountValidKeys!0 lt!453437 #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))) lt!453510)))

(declare-fun bm!43405 () Bool)

(assert (=> bm!43405 (= call!43408 (arrayCountValidKeys!0 lt!453437 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun b!1029706 () Bool)

(assert (=> b!1029706 (= e!581350 e!581351)))

(declare-fun c!104170 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1029706 (= c!104170 (validKeyInArray!0 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(declare-fun b!1029707 () Bool)

(assert (=> b!1029707 (= e!581350 #b00000000000000000000000000000000)))

(declare-fun b!1029708 () Bool)

(assert (=> b!1029708 (= e!581351 (bvadd #b00000000000000000000000000000001 call!43408))))

(assert (= (and d!123413 c!104171) b!1029707))

(assert (= (and d!123413 (not c!104171)) b!1029706))

(assert (= (and b!1029706 c!104170) b!1029708))

(assert (= (and b!1029706 (not c!104170)) b!1029705))

(assert (= (or b!1029708 b!1029705) bm!43405))

(declare-fun m!948911 () Bool)

(assert (=> bm!43405 m!948911))

(declare-fun m!948913 () Bool)

(assert (=> b!1029706 m!948913))

(assert (=> b!1029706 m!948913))

(declare-fun m!948915 () Bool)

(assert (=> b!1029706 m!948915))

(assert (=> b!1029617 d!123413))

(declare-fun d!123415 () Bool)

(assert (=> d!123415 (= (validMask!0 (mask!29897 (_2!7786 lt!453431))) (and (or (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000000000000000000111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000000000000000001111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000000000000000011111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000000000000000111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000000000000001111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000000000000011111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000000000000111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000000000001111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000000000011111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000000000111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000000001111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000000011111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000000111111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000001111111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000011111111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000000111111111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000001111111111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000011111111111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000000111111111111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000001111111111111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000011111111111111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000000111111111111111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000001111111111111111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000011111111111111111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00000111111111111111111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00001111111111111111111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00011111111111111111111111111111) (= (mask!29897 (_2!7786 lt!453431)) #b00111111111111111111111111111111)) (bvsle (mask!29897 (_2!7786 lt!453431)) #b00111111111111111111111111111111)))))

(assert (=> b!1029617 d!123415))

(declare-fun d!123417 () Bool)

(declare-fun res!688637 () Bool)

(declare-fun e!581356 () Bool)

(assert (=> d!123417 (=> res!688637 e!581356)))

(assert (=> d!123417 (= res!688637 (= (select (arr!31153 lt!453437) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123417 (= (arrayContainsKey!0 lt!453437 key!909 #b00000000000000000000000000000000) e!581356)))

(declare-fun b!1029713 () Bool)

(declare-fun e!581357 () Bool)

(assert (=> b!1029713 (= e!581356 e!581357)))

(declare-fun res!688638 () Bool)

(assert (=> b!1029713 (=> (not res!688638) (not e!581357))))

(assert (=> b!1029713 (= res!688638 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31668 lt!453437)))))

(declare-fun b!1029714 () Bool)

(assert (=> b!1029714 (= e!581357 (arrayContainsKey!0 lt!453437 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123417 (not res!688637)) b!1029713))

(assert (= (and b!1029713 res!688638) b!1029714))

(assert (=> d!123417 m!948913))

(declare-fun m!948917 () Bool)

(assert (=> b!1029714 m!948917))

(assert (=> b!1029617 d!123417))

(declare-fun d!123419 () Bool)

(declare-fun lt!453513 () ListLongMap!13685)

(declare-fun contains!5992 (ListLongMap!13685 (_ BitVec 64)) Bool)

(assert (=> d!123419 (not (contains!5992 lt!453513 key!909))))

(declare-fun removeStrictlySorted!50 (List!21802 (_ BitVec 64)) List!21802)

(assert (=> d!123419 (= lt!453513 (ListLongMap!13686 (removeStrictlySorted!50 (toList!6858 (getCurrentListMap!3904 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427))) key!909)))))

(assert (=> d!123419 (= (-!481 (getCurrentListMap!3904 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) key!909) lt!453513)))

(declare-fun bs!30043 () Bool)

(assert (= bs!30043 d!123419))

(declare-fun m!948919 () Bool)

(assert (=> bs!30043 m!948919))

(declare-fun m!948921 () Bool)

(assert (=> bs!30043 m!948921))

(assert (=> b!1029617 d!123419))

(declare-fun b!1029724 () Bool)

(declare-fun res!688649 () Bool)

(declare-fun e!581363 () Bool)

(assert (=> b!1029724 (=> (not res!688649) (not e!581363))))

(assert (=> b!1029724 (= res!688649 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!123421 () Bool)

(declare-fun e!581362 () Bool)

(assert (=> d!123421 e!581362))

(declare-fun res!688648 () Bool)

(assert (=> d!123421 (=> (not res!688648) (not e!581362))))

(assert (=> d!123421 (= res!688648 (and (bvsge (index!40904 lt!453434) #b00000000000000000000000000000000) (bvslt (index!40904 lt!453434) (size!31668 (_keys!11294 thiss!1427)))))))

(declare-fun lt!453516 () Unit!33586)

(declare-fun choose!82 (array!64705 (_ BitVec 32) (_ BitVec 64)) Unit!33586)

(assert (=> d!123421 (= lt!453516 (choose!82 (_keys!11294 thiss!1427) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123421 e!581363))

(declare-fun res!688650 () Bool)

(assert (=> d!123421 (=> (not res!688650) (not e!581363))))

(assert (=> d!123421 (= res!688650 (and (bvsge (index!40904 lt!453434) #b00000000000000000000000000000000) (bvslt (index!40904 lt!453434) (size!31668 (_keys!11294 thiss!1427)))))))

(assert (=> d!123421 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11294 thiss!1427) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) lt!453516)))

(declare-fun b!1029723 () Bool)

(declare-fun res!688647 () Bool)

(assert (=> b!1029723 (=> (not res!688647) (not e!581363))))

(assert (=> b!1029723 (= res!688647 (validKeyInArray!0 (select (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434))))))

(declare-fun b!1029725 () Bool)

(assert (=> b!1029725 (= e!581363 (bvslt (size!31668 (_keys!11294 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1029726 () Bool)

(assert (=> b!1029726 (= e!581362 (= (arrayCountValidKeys!0 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11294 thiss!1427) #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!123421 res!688650) b!1029723))

(assert (= (and b!1029723 res!688647) b!1029724))

(assert (= (and b!1029724 res!688649) b!1029725))

(assert (= (and d!123421 res!688648) b!1029726))

(declare-fun m!948923 () Bool)

(assert (=> b!1029724 m!948923))

(declare-fun m!948925 () Bool)

(assert (=> d!123421 m!948925))

(declare-fun m!948927 () Bool)

(assert (=> b!1029723 m!948927))

(assert (=> b!1029723 m!948927))

(declare-fun m!948929 () Bool)

(assert (=> b!1029723 m!948929))

(assert (=> b!1029726 m!948771))

(declare-fun m!948931 () Bool)

(assert (=> b!1029726 m!948931))

(assert (=> b!1029726 m!948781))

(assert (=> b!1029617 d!123421))

(declare-fun b!1029727 () Bool)

(declare-fun e!581365 () (_ BitVec 32))

(declare-fun call!43409 () (_ BitVec 32))

(assert (=> b!1029727 (= e!581365 call!43409)))

(declare-fun d!123423 () Bool)

(declare-fun lt!453517 () (_ BitVec 32))

(assert (=> d!123423 (and (bvsge lt!453517 #b00000000000000000000000000000000) (bvsle lt!453517 (bvsub (size!31668 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!581364 () (_ BitVec 32))

(assert (=> d!123423 (= lt!453517 e!581364)))

(declare-fun c!104173 () Bool)

(assert (=> d!123423 (= c!104173 (bvsge #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))))))

(assert (=> d!123423 (and (bvsle #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31668 (_keys!11294 thiss!1427)) (size!31668 (_keys!11294 thiss!1427))))))

(assert (=> d!123423 (= (arrayCountValidKeys!0 (_keys!11294 thiss!1427) #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))) lt!453517)))

(declare-fun bm!43406 () Bool)

(assert (=> bm!43406 (= call!43409 (arrayCountValidKeys!0 (_keys!11294 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun b!1029728 () Bool)

(assert (=> b!1029728 (= e!581364 e!581365)))

(declare-fun c!104172 () Bool)

(assert (=> b!1029728 (= c!104172 (validKeyInArray!0 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029729 () Bool)

(assert (=> b!1029729 (= e!581364 #b00000000000000000000000000000000)))

(declare-fun b!1029730 () Bool)

(assert (=> b!1029730 (= e!581365 (bvadd #b00000000000000000000000000000001 call!43409))))

(assert (= (and d!123423 c!104173) b!1029729))

(assert (= (and d!123423 (not c!104173)) b!1029728))

(assert (= (and b!1029728 c!104172) b!1029730))

(assert (= (and b!1029728 (not c!104172)) b!1029727))

(assert (= (or b!1029730 b!1029727) bm!43406))

(declare-fun m!948933 () Bool)

(assert (=> bm!43406 m!948933))

(declare-fun m!948935 () Bool)

(assert (=> b!1029728 m!948935))

(assert (=> b!1029728 m!948935))

(declare-fun m!948937 () Bool)

(assert (=> b!1029728 m!948937))

(assert (=> b!1029617 d!123423))

(declare-fun d!123425 () Bool)

(declare-fun e!581368 () Bool)

(assert (=> d!123425 e!581368))

(declare-fun res!688653 () Bool)

(assert (=> d!123425 (=> (not res!688653) (not e!581368))))

(assert (=> d!123425 (= res!688653 (and (bvsge (index!40904 lt!453434) #b00000000000000000000000000000000) (bvslt (index!40904 lt!453434) (size!31668 (_keys!11294 thiss!1427)))))))

(declare-fun lt!453520 () Unit!33586)

(declare-fun choose!25 (array!64705 (_ BitVec 32) (_ BitVec 32)) Unit!33586)

(assert (=> d!123425 (= lt!453520 (choose!25 (_keys!11294 thiss!1427) (index!40904 lt!453434) (mask!29897 thiss!1427)))))

(assert (=> d!123425 (validMask!0 (mask!29897 thiss!1427))))

(assert (=> d!123425 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11294 thiss!1427) (index!40904 lt!453434) (mask!29897 thiss!1427)) lt!453520)))

(declare-fun b!1029733 () Bool)

(assert (=> b!1029733 (= e!581368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) (mask!29897 thiss!1427)))))

(assert (= (and d!123425 res!688653) b!1029733))

(declare-fun m!948939 () Bool)

(assert (=> d!123425 m!948939))

(assert (=> d!123425 m!948905))

(assert (=> b!1029733 m!948771))

(declare-fun m!948941 () Bool)

(assert (=> b!1029733 m!948941))

(assert (=> b!1029617 d!123425))

(declare-fun bm!43421 () Bool)

(declare-fun call!43430 () ListLongMap!13685)

(declare-fun call!43429 () ListLongMap!13685)

(assert (=> bm!43421 (= call!43430 call!43429)))

(declare-fun call!43428 () ListLongMap!13685)

(declare-fun bm!43422 () Bool)

(declare-fun call!43427 () ListLongMap!13685)

(declare-fun c!104186 () Bool)

(declare-fun call!43424 () ListLongMap!13685)

(declare-fun c!104188 () Bool)

(declare-fun +!3121 (ListLongMap!13685 tuple2!15552) ListLongMap!13685)

(assert (=> bm!43422 (= call!43429 (+!3121 (ite c!104186 call!43427 (ite c!104188 call!43428 call!43424)) (ite (or c!104186 c!104188) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(declare-fun b!1029776 () Bool)

(declare-fun res!688680 () Bool)

(declare-fun e!581403 () Bool)

(assert (=> b!1029776 (=> (not res!688680) (not e!581403))))

(declare-fun e!581404 () Bool)

(assert (=> b!1029776 (= res!688680 e!581404)))

(declare-fun c!104191 () Bool)

(assert (=> b!1029776 (= c!104191 (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1029777 () Bool)

(declare-fun e!581398 () Bool)

(assert (=> b!1029777 (= e!581398 (validKeyInArray!0 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(declare-fun b!1029778 () Bool)

(declare-fun e!581397 () ListLongMap!13685)

(assert (=> b!1029778 (= e!581397 call!43424)))

(declare-fun b!1029779 () Bool)

(declare-fun e!581395 () Bool)

(assert (=> b!1029779 (= e!581395 (validKeyInArray!0 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(declare-fun b!1029780 () Bool)

(declare-fun e!581399 () Unit!33586)

(declare-fun Unit!33594 () Unit!33586)

(assert (=> b!1029780 (= e!581399 Unit!33594)))

(declare-fun lt!453574 () ListLongMap!13685)

(declare-fun e!581396 () Bool)

(declare-fun b!1029781 () Bool)

(declare-fun apply!910 (ListLongMap!13685 (_ BitVec 64)) V!37275)

(declare-fun get!16376 (ValueCell!11447 V!37275) V!37275)

(assert (=> b!1029781 (= e!581396 (= (apply!910 lt!453574 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)) (get!16376 (select (arr!31154 lt!453435) #b00000000000000000000000000000000) (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029781 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31669 lt!453435)))))

(assert (=> b!1029781 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31668 lt!453437)))))

(declare-fun b!1029783 () Bool)

(assert (=> b!1029783 (= e!581397 call!43430)))

(declare-fun bm!43423 () Bool)

(declare-fun call!43425 () Bool)

(assert (=> bm!43423 (= call!43425 (contains!5992 lt!453574 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029784 () Bool)

(declare-fun e!581407 () Bool)

(declare-fun e!581405 () Bool)

(assert (=> b!1029784 (= e!581407 e!581405)))

(declare-fun res!688677 () Bool)

(assert (=> b!1029784 (= res!688677 call!43425)))

(assert (=> b!1029784 (=> (not res!688677) (not e!581405))))

(declare-fun bm!43424 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3561 (array!64705 array!64707 (_ BitVec 32) (_ BitVec 32) V!37275 V!37275 (_ BitVec 32) Int) ListLongMap!13685)

(assert (=> bm!43424 (= call!43427 (getCurrentListMapNoExtraKeys!3561 lt!453437 lt!453435 (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun b!1029785 () Bool)

(declare-fun e!581400 () Bool)

(assert (=> b!1029785 (= e!581400 e!581396)))

(declare-fun res!688679 () Bool)

(assert (=> b!1029785 (=> (not res!688679) (not e!581396))))

(assert (=> b!1029785 (= res!688679 (contains!5992 lt!453574 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(assert (=> b!1029785 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31668 lt!453437)))))

(declare-fun bm!43425 () Bool)

(assert (=> bm!43425 (= call!43428 call!43427)))

(declare-fun b!1029786 () Bool)

(declare-fun e!581401 () Bool)

(assert (=> b!1029786 (= e!581404 e!581401)))

(declare-fun res!688673 () Bool)

(declare-fun call!43426 () Bool)

(assert (=> b!1029786 (= res!688673 call!43426)))

(assert (=> b!1029786 (=> (not res!688673) (not e!581401))))

(declare-fun b!1029787 () Bool)

(declare-fun lt!453576 () Unit!33586)

(assert (=> b!1029787 (= e!581399 lt!453576)))

(declare-fun lt!453565 () ListLongMap!13685)

(assert (=> b!1029787 (= lt!453565 (getCurrentListMapNoExtraKeys!3561 lt!453437 lt!453435 (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453581 () (_ BitVec 64))

(assert (=> b!1029787 (= lt!453581 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453570 () (_ BitVec 64))

(assert (=> b!1029787 (= lt!453570 (select (arr!31153 lt!453437) #b00000000000000000000000000000000))))

(declare-fun lt!453583 () Unit!33586)

(declare-fun addStillContains!620 (ListLongMap!13685 (_ BitVec 64) V!37275 (_ BitVec 64)) Unit!33586)

(assert (=> b!1029787 (= lt!453583 (addStillContains!620 lt!453565 lt!453581 (zeroValue!5938 thiss!1427) lt!453570))))

(assert (=> b!1029787 (contains!5992 (+!3121 lt!453565 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427))) lt!453570)))

(declare-fun lt!453584 () Unit!33586)

(assert (=> b!1029787 (= lt!453584 lt!453583)))

(declare-fun lt!453573 () ListLongMap!13685)

(assert (=> b!1029787 (= lt!453573 (getCurrentListMapNoExtraKeys!3561 lt!453437 lt!453435 (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453566 () (_ BitVec 64))

(assert (=> b!1029787 (= lt!453566 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453577 () (_ BitVec 64))

(assert (=> b!1029787 (= lt!453577 (select (arr!31153 lt!453437) #b00000000000000000000000000000000))))

(declare-fun lt!453571 () Unit!33586)

(declare-fun addApplyDifferent!476 (ListLongMap!13685 (_ BitVec 64) V!37275 (_ BitVec 64)) Unit!33586)

(assert (=> b!1029787 (= lt!453571 (addApplyDifferent!476 lt!453573 lt!453566 (minValue!5938 thiss!1427) lt!453577))))

(assert (=> b!1029787 (= (apply!910 (+!3121 lt!453573 (tuple2!15553 lt!453566 (minValue!5938 thiss!1427))) lt!453577) (apply!910 lt!453573 lt!453577))))

(declare-fun lt!453575 () Unit!33586)

(assert (=> b!1029787 (= lt!453575 lt!453571)))

(declare-fun lt!453572 () ListLongMap!13685)

(assert (=> b!1029787 (= lt!453572 (getCurrentListMapNoExtraKeys!3561 lt!453437 lt!453435 (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453579 () (_ BitVec 64))

(assert (=> b!1029787 (= lt!453579 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453580 () (_ BitVec 64))

(assert (=> b!1029787 (= lt!453580 (select (arr!31153 lt!453437) #b00000000000000000000000000000000))))

(declare-fun lt!453567 () Unit!33586)

(assert (=> b!1029787 (= lt!453567 (addApplyDifferent!476 lt!453572 lt!453579 (zeroValue!5938 thiss!1427) lt!453580))))

(assert (=> b!1029787 (= (apply!910 (+!3121 lt!453572 (tuple2!15553 lt!453579 (zeroValue!5938 thiss!1427))) lt!453580) (apply!910 lt!453572 lt!453580))))

(declare-fun lt!453578 () Unit!33586)

(assert (=> b!1029787 (= lt!453578 lt!453567)))

(declare-fun lt!453586 () ListLongMap!13685)

(assert (=> b!1029787 (= lt!453586 (getCurrentListMapNoExtraKeys!3561 lt!453437 lt!453435 (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453568 () (_ BitVec 64))

(assert (=> b!1029787 (= lt!453568 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453569 () (_ BitVec 64))

(assert (=> b!1029787 (= lt!453569 (select (arr!31153 lt!453437) #b00000000000000000000000000000000))))

(assert (=> b!1029787 (= lt!453576 (addApplyDifferent!476 lt!453586 lt!453568 (minValue!5938 thiss!1427) lt!453569))))

(assert (=> b!1029787 (= (apply!910 (+!3121 lt!453586 (tuple2!15553 lt!453568 (minValue!5938 thiss!1427))) lt!453569) (apply!910 lt!453586 lt!453569))))

(declare-fun b!1029788 () Bool)

(assert (=> b!1029788 (= e!581403 e!581407)))

(declare-fun c!104187 () Bool)

(assert (=> b!1029788 (= c!104187 (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43426 () Bool)

(assert (=> bm!43426 (= call!43426 (contains!5992 lt!453574 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029789 () Bool)

(declare-fun res!688678 () Bool)

(assert (=> b!1029789 (=> (not res!688678) (not e!581403))))

(assert (=> b!1029789 (= res!688678 e!581400)))

(declare-fun res!688672 () Bool)

(assert (=> b!1029789 (=> res!688672 e!581400)))

(assert (=> b!1029789 (= res!688672 (not e!581398))))

(declare-fun res!688674 () Bool)

(assert (=> b!1029789 (=> (not res!688674) (not e!581398))))

(assert (=> b!1029789 (= res!688674 (bvslt #b00000000000000000000000000000000 (size!31668 lt!453437)))))

(declare-fun b!1029790 () Bool)

(assert (=> b!1029790 (= e!581404 (not call!43426))))

(declare-fun b!1029791 () Bool)

(assert (=> b!1029791 (= e!581407 (not call!43425))))

(declare-fun d!123427 () Bool)

(assert (=> d!123427 e!581403))

(declare-fun res!688676 () Bool)

(assert (=> d!123427 (=> (not res!688676) (not e!581403))))

(assert (=> d!123427 (= res!688676 (or (bvsge #b00000000000000000000000000000000 (size!31668 lt!453437)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31668 lt!453437)))))))

(declare-fun lt!453582 () ListLongMap!13685)

(assert (=> d!123427 (= lt!453574 lt!453582)))

(declare-fun lt!453585 () Unit!33586)

(assert (=> d!123427 (= lt!453585 e!581399)))

(declare-fun c!104189 () Bool)

(assert (=> d!123427 (= c!104189 e!581395)))

(declare-fun res!688675 () Bool)

(assert (=> d!123427 (=> (not res!688675) (not e!581395))))

(assert (=> d!123427 (= res!688675 (bvslt #b00000000000000000000000000000000 (size!31668 lt!453437)))))

(declare-fun e!581402 () ListLongMap!13685)

(assert (=> d!123427 (= lt!453582 e!581402)))

(assert (=> d!123427 (= c!104186 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123427 (validMask!0 (mask!29897 thiss!1427))))

(assert (=> d!123427 (= (getCurrentListMap!3904 lt!453437 lt!453435 (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) lt!453574)))

(declare-fun b!1029782 () Bool)

(assert (=> b!1029782 (= e!581402 (+!3121 call!43429 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))

(declare-fun b!1029792 () Bool)

(declare-fun e!581406 () ListLongMap!13685)

(assert (=> b!1029792 (= e!581406 call!43430)))

(declare-fun b!1029793 () Bool)

(assert (=> b!1029793 (= e!581405 (= (apply!910 lt!453574 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5938 thiss!1427)))))

(declare-fun b!1029794 () Bool)

(assert (=> b!1029794 (= e!581402 e!581406)))

(assert (=> b!1029794 (= c!104188 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029795 () Bool)

(assert (=> b!1029795 (= e!581401 (= (apply!910 lt!453574 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5938 thiss!1427)))))

(declare-fun bm!43427 () Bool)

(assert (=> bm!43427 (= call!43424 call!43428)))

(declare-fun b!1029796 () Bool)

(declare-fun c!104190 () Bool)

(assert (=> b!1029796 (= c!104190 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1029796 (= e!581406 e!581397)))

(assert (= (and d!123427 c!104186) b!1029782))

(assert (= (and d!123427 (not c!104186)) b!1029794))

(assert (= (and b!1029794 c!104188) b!1029792))

(assert (= (and b!1029794 (not c!104188)) b!1029796))

(assert (= (and b!1029796 c!104190) b!1029783))

(assert (= (and b!1029796 (not c!104190)) b!1029778))

(assert (= (or b!1029783 b!1029778) bm!43427))

(assert (= (or b!1029792 bm!43427) bm!43425))

(assert (= (or b!1029792 b!1029783) bm!43421))

(assert (= (or b!1029782 bm!43425) bm!43424))

(assert (= (or b!1029782 bm!43421) bm!43422))

(assert (= (and d!123427 res!688675) b!1029779))

(assert (= (and d!123427 c!104189) b!1029787))

(assert (= (and d!123427 (not c!104189)) b!1029780))

(assert (= (and d!123427 res!688676) b!1029789))

(assert (= (and b!1029789 res!688674) b!1029777))

(assert (= (and b!1029789 (not res!688672)) b!1029785))

(assert (= (and b!1029785 res!688679) b!1029781))

(assert (= (and b!1029789 res!688678) b!1029776))

(assert (= (and b!1029776 c!104191) b!1029786))

(assert (= (and b!1029776 (not c!104191)) b!1029790))

(assert (= (and b!1029786 res!688673) b!1029795))

(assert (= (or b!1029786 b!1029790) bm!43426))

(assert (= (and b!1029776 res!688680) b!1029788))

(assert (= (and b!1029788 c!104187) b!1029784))

(assert (= (and b!1029788 (not c!104187)) b!1029791))

(assert (= (and b!1029784 res!688677) b!1029793))

(assert (= (or b!1029784 b!1029791) bm!43423))

(declare-fun b_lambda!15801 () Bool)

(assert (=> (not b_lambda!15801) (not b!1029781)))

(assert (=> b!1029781 t!30869))

(declare-fun b_and!32885 () Bool)

(assert (= b_and!32875 (and (=> t!30869 result!14109) b_and!32885)))

(declare-fun m!948943 () Bool)

(assert (=> b!1029782 m!948943))

(declare-fun m!948945 () Bool)

(assert (=> bm!43424 m!948945))

(declare-fun m!948947 () Bool)

(assert (=> b!1029787 m!948947))

(declare-fun m!948949 () Bool)

(assert (=> b!1029787 m!948949))

(assert (=> b!1029787 m!948949))

(declare-fun m!948951 () Bool)

(assert (=> b!1029787 m!948951))

(declare-fun m!948953 () Bool)

(assert (=> b!1029787 m!948953))

(declare-fun m!948955 () Bool)

(assert (=> b!1029787 m!948955))

(assert (=> b!1029787 m!948913))

(declare-fun m!948957 () Bool)

(assert (=> b!1029787 m!948957))

(declare-fun m!948959 () Bool)

(assert (=> b!1029787 m!948959))

(declare-fun m!948961 () Bool)

(assert (=> b!1029787 m!948961))

(declare-fun m!948963 () Bool)

(assert (=> b!1029787 m!948963))

(assert (=> b!1029787 m!948957))

(assert (=> b!1029787 m!948947))

(declare-fun m!948965 () Bool)

(assert (=> b!1029787 m!948965))

(assert (=> b!1029787 m!948961))

(declare-fun m!948967 () Bool)

(assert (=> b!1029787 m!948967))

(declare-fun m!948969 () Bool)

(assert (=> b!1029787 m!948969))

(declare-fun m!948971 () Bool)

(assert (=> b!1029787 m!948971))

(assert (=> b!1029787 m!948945))

(declare-fun m!948973 () Bool)

(assert (=> b!1029787 m!948973))

(declare-fun m!948975 () Bool)

(assert (=> b!1029787 m!948975))

(assert (=> d!123427 m!948905))

(declare-fun m!948977 () Bool)

(assert (=> bm!43426 m!948977))

(declare-fun m!948979 () Bool)

(assert (=> bm!43422 m!948979))

(declare-fun m!948981 () Bool)

(assert (=> b!1029793 m!948981))

(declare-fun m!948983 () Bool)

(assert (=> b!1029795 m!948983))

(assert (=> b!1029779 m!948913))

(assert (=> b!1029779 m!948913))

(assert (=> b!1029779 m!948915))

(declare-fun m!948985 () Bool)

(assert (=> bm!43423 m!948985))

(declare-fun m!948987 () Bool)

(assert (=> b!1029781 m!948987))

(assert (=> b!1029781 m!948987))

(assert (=> b!1029781 m!948797))

(declare-fun m!948989 () Bool)

(assert (=> b!1029781 m!948989))

(assert (=> b!1029781 m!948913))

(declare-fun m!948991 () Bool)

(assert (=> b!1029781 m!948991))

(assert (=> b!1029781 m!948913))

(assert (=> b!1029781 m!948797))

(assert (=> b!1029785 m!948913))

(assert (=> b!1029785 m!948913))

(declare-fun m!948993 () Bool)

(assert (=> b!1029785 m!948993))

(assert (=> b!1029777 m!948913))

(assert (=> b!1029777 m!948913))

(assert (=> b!1029777 m!948915))

(assert (=> b!1029617 d!123427))

(declare-fun bm!43428 () Bool)

(declare-fun call!43437 () ListLongMap!13685)

(declare-fun call!43436 () ListLongMap!13685)

(assert (=> bm!43428 (= call!43437 call!43436)))

(declare-fun bm!43429 () Bool)

(declare-fun c!104194 () Bool)

(declare-fun call!43434 () ListLongMap!13685)

(declare-fun call!43435 () ListLongMap!13685)

(declare-fun call!43431 () ListLongMap!13685)

(declare-fun c!104192 () Bool)

(assert (=> bm!43429 (= call!43436 (+!3121 (ite c!104192 call!43434 (ite c!104194 call!43435 call!43431)) (ite (or c!104192 c!104194) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(declare-fun b!1029797 () Bool)

(declare-fun res!688689 () Bool)

(declare-fun e!581416 () Bool)

(assert (=> b!1029797 (=> (not res!688689) (not e!581416))))

(declare-fun e!581417 () Bool)

(assert (=> b!1029797 (= res!688689 e!581417)))

(declare-fun c!104197 () Bool)

(assert (=> b!1029797 (= c!104197 (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1029798 () Bool)

(declare-fun e!581411 () Bool)

(assert (=> b!1029798 (= e!581411 (validKeyInArray!0 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029799 () Bool)

(declare-fun e!581410 () ListLongMap!13685)

(assert (=> b!1029799 (= e!581410 call!43431)))

(declare-fun b!1029800 () Bool)

(declare-fun e!581408 () Bool)

(assert (=> b!1029800 (= e!581408 (validKeyInArray!0 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029801 () Bool)

(declare-fun e!581412 () Unit!33586)

(declare-fun Unit!33595 () Unit!33586)

(assert (=> b!1029801 (= e!581412 Unit!33595)))

(declare-fun b!1029802 () Bool)

(declare-fun e!581409 () Bool)

(declare-fun lt!453596 () ListLongMap!13685)

(assert (=> b!1029802 (= e!581409 (= (apply!910 lt!453596 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)) (get!16376 (select (arr!31154 (_values!6125 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029802 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31669 (_values!6125 thiss!1427))))))

(assert (=> b!1029802 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun b!1029804 () Bool)

(assert (=> b!1029804 (= e!581410 call!43437)))

(declare-fun bm!43430 () Bool)

(declare-fun call!43432 () Bool)

(assert (=> bm!43430 (= call!43432 (contains!5992 lt!453596 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029805 () Bool)

(declare-fun e!581420 () Bool)

(declare-fun e!581418 () Bool)

(assert (=> b!1029805 (= e!581420 e!581418)))

(declare-fun res!688686 () Bool)

(assert (=> b!1029805 (= res!688686 call!43432)))

(assert (=> b!1029805 (=> (not res!688686) (not e!581418))))

(declare-fun bm!43431 () Bool)

(assert (=> bm!43431 (= call!43434 (getCurrentListMapNoExtraKeys!3561 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun b!1029806 () Bool)

(declare-fun e!581413 () Bool)

(assert (=> b!1029806 (= e!581413 e!581409)))

(declare-fun res!688688 () Bool)

(assert (=> b!1029806 (=> (not res!688688) (not e!581409))))

(assert (=> b!1029806 (= res!688688 (contains!5992 lt!453596 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029806 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun bm!43432 () Bool)

(assert (=> bm!43432 (= call!43435 call!43434)))

(declare-fun b!1029807 () Bool)

(declare-fun e!581414 () Bool)

(assert (=> b!1029807 (= e!581417 e!581414)))

(declare-fun res!688682 () Bool)

(declare-fun call!43433 () Bool)

(assert (=> b!1029807 (= res!688682 call!43433)))

(assert (=> b!1029807 (=> (not res!688682) (not e!581414))))

(declare-fun b!1029808 () Bool)

(declare-fun lt!453598 () Unit!33586)

(assert (=> b!1029808 (= e!581412 lt!453598)))

(declare-fun lt!453587 () ListLongMap!13685)

(assert (=> b!1029808 (= lt!453587 (getCurrentListMapNoExtraKeys!3561 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453603 () (_ BitVec 64))

(assert (=> b!1029808 (= lt!453603 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453592 () (_ BitVec 64))

(assert (=> b!1029808 (= lt!453592 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453605 () Unit!33586)

(assert (=> b!1029808 (= lt!453605 (addStillContains!620 lt!453587 lt!453603 (zeroValue!5938 thiss!1427) lt!453592))))

(assert (=> b!1029808 (contains!5992 (+!3121 lt!453587 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427))) lt!453592)))

(declare-fun lt!453606 () Unit!33586)

(assert (=> b!1029808 (= lt!453606 lt!453605)))

(declare-fun lt!453595 () ListLongMap!13685)

(assert (=> b!1029808 (= lt!453595 (getCurrentListMapNoExtraKeys!3561 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453588 () (_ BitVec 64))

(assert (=> b!1029808 (= lt!453588 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453599 () (_ BitVec 64))

(assert (=> b!1029808 (= lt!453599 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453593 () Unit!33586)

(assert (=> b!1029808 (= lt!453593 (addApplyDifferent!476 lt!453595 lt!453588 (minValue!5938 thiss!1427) lt!453599))))

(assert (=> b!1029808 (= (apply!910 (+!3121 lt!453595 (tuple2!15553 lt!453588 (minValue!5938 thiss!1427))) lt!453599) (apply!910 lt!453595 lt!453599))))

(declare-fun lt!453597 () Unit!33586)

(assert (=> b!1029808 (= lt!453597 lt!453593)))

(declare-fun lt!453594 () ListLongMap!13685)

(assert (=> b!1029808 (= lt!453594 (getCurrentListMapNoExtraKeys!3561 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453601 () (_ BitVec 64))

(assert (=> b!1029808 (= lt!453601 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453602 () (_ BitVec 64))

(assert (=> b!1029808 (= lt!453602 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453589 () Unit!33586)

(assert (=> b!1029808 (= lt!453589 (addApplyDifferent!476 lt!453594 lt!453601 (zeroValue!5938 thiss!1427) lt!453602))))

(assert (=> b!1029808 (= (apply!910 (+!3121 lt!453594 (tuple2!15553 lt!453601 (zeroValue!5938 thiss!1427))) lt!453602) (apply!910 lt!453594 lt!453602))))

(declare-fun lt!453600 () Unit!33586)

(assert (=> b!1029808 (= lt!453600 lt!453589)))

(declare-fun lt!453608 () ListLongMap!13685)

(assert (=> b!1029808 (= lt!453608 (getCurrentListMapNoExtraKeys!3561 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453590 () (_ BitVec 64))

(assert (=> b!1029808 (= lt!453590 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453591 () (_ BitVec 64))

(assert (=> b!1029808 (= lt!453591 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029808 (= lt!453598 (addApplyDifferent!476 lt!453608 lt!453590 (minValue!5938 thiss!1427) lt!453591))))

(assert (=> b!1029808 (= (apply!910 (+!3121 lt!453608 (tuple2!15553 lt!453590 (minValue!5938 thiss!1427))) lt!453591) (apply!910 lt!453608 lt!453591))))

(declare-fun b!1029809 () Bool)

(assert (=> b!1029809 (= e!581416 e!581420)))

(declare-fun c!104193 () Bool)

(assert (=> b!1029809 (= c!104193 (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43433 () Bool)

(assert (=> bm!43433 (= call!43433 (contains!5992 lt!453596 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029810 () Bool)

(declare-fun res!688687 () Bool)

(assert (=> b!1029810 (=> (not res!688687) (not e!581416))))

(assert (=> b!1029810 (= res!688687 e!581413)))

(declare-fun res!688681 () Bool)

(assert (=> b!1029810 (=> res!688681 e!581413)))

(assert (=> b!1029810 (= res!688681 (not e!581411))))

(declare-fun res!688683 () Bool)

(assert (=> b!1029810 (=> (not res!688683) (not e!581411))))

(assert (=> b!1029810 (= res!688683 (bvslt #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun b!1029811 () Bool)

(assert (=> b!1029811 (= e!581417 (not call!43433))))

(declare-fun b!1029812 () Bool)

(assert (=> b!1029812 (= e!581420 (not call!43432))))

(declare-fun d!123429 () Bool)

(assert (=> d!123429 e!581416))

(declare-fun res!688685 () Bool)

(assert (=> d!123429 (=> (not res!688685) (not e!581416))))

(assert (=> d!123429 (= res!688685 (or (bvsge #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))))))))

(declare-fun lt!453604 () ListLongMap!13685)

(assert (=> d!123429 (= lt!453596 lt!453604)))

(declare-fun lt!453607 () Unit!33586)

(assert (=> d!123429 (= lt!453607 e!581412)))

(declare-fun c!104195 () Bool)

(assert (=> d!123429 (= c!104195 e!581408)))

(declare-fun res!688684 () Bool)

(assert (=> d!123429 (=> (not res!688684) (not e!581408))))

(assert (=> d!123429 (= res!688684 (bvslt #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun e!581415 () ListLongMap!13685)

(assert (=> d!123429 (= lt!453604 e!581415)))

(assert (=> d!123429 (= c!104192 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123429 (validMask!0 (mask!29897 thiss!1427))))

(assert (=> d!123429 (= (getCurrentListMap!3904 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) lt!453596)))

(declare-fun b!1029803 () Bool)

(assert (=> b!1029803 (= e!581415 (+!3121 call!43436 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))

(declare-fun b!1029813 () Bool)

(declare-fun e!581419 () ListLongMap!13685)

(assert (=> b!1029813 (= e!581419 call!43437)))

(declare-fun b!1029814 () Bool)

(assert (=> b!1029814 (= e!581418 (= (apply!910 lt!453596 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5938 thiss!1427)))))

(declare-fun b!1029815 () Bool)

(assert (=> b!1029815 (= e!581415 e!581419)))

(assert (=> b!1029815 (= c!104194 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029816 () Bool)

(assert (=> b!1029816 (= e!581414 (= (apply!910 lt!453596 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5938 thiss!1427)))))

(declare-fun bm!43434 () Bool)

(assert (=> bm!43434 (= call!43431 call!43435)))

(declare-fun b!1029817 () Bool)

(declare-fun c!104196 () Bool)

(assert (=> b!1029817 (= c!104196 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1029817 (= e!581419 e!581410)))

(assert (= (and d!123429 c!104192) b!1029803))

(assert (= (and d!123429 (not c!104192)) b!1029815))

(assert (= (and b!1029815 c!104194) b!1029813))

(assert (= (and b!1029815 (not c!104194)) b!1029817))

(assert (= (and b!1029817 c!104196) b!1029804))

(assert (= (and b!1029817 (not c!104196)) b!1029799))

(assert (= (or b!1029804 b!1029799) bm!43434))

(assert (= (or b!1029813 bm!43434) bm!43432))

(assert (= (or b!1029813 b!1029804) bm!43428))

(assert (= (or b!1029803 bm!43432) bm!43431))

(assert (= (or b!1029803 bm!43428) bm!43429))

(assert (= (and d!123429 res!688684) b!1029800))

(assert (= (and d!123429 c!104195) b!1029808))

(assert (= (and d!123429 (not c!104195)) b!1029801))

(assert (= (and d!123429 res!688685) b!1029810))

(assert (= (and b!1029810 res!688683) b!1029798))

(assert (= (and b!1029810 (not res!688681)) b!1029806))

(assert (= (and b!1029806 res!688688) b!1029802))

(assert (= (and b!1029810 res!688687) b!1029797))

(assert (= (and b!1029797 c!104197) b!1029807))

(assert (= (and b!1029797 (not c!104197)) b!1029811))

(assert (= (and b!1029807 res!688682) b!1029816))

(assert (= (or b!1029807 b!1029811) bm!43433))

(assert (= (and b!1029797 res!688689) b!1029809))

(assert (= (and b!1029809 c!104193) b!1029805))

(assert (= (and b!1029809 (not c!104193)) b!1029812))

(assert (= (and b!1029805 res!688686) b!1029814))

(assert (= (or b!1029805 b!1029812) bm!43430))

(declare-fun b_lambda!15803 () Bool)

(assert (=> (not b_lambda!15803) (not b!1029802)))

(assert (=> b!1029802 t!30869))

(declare-fun b_and!32887 () Bool)

(assert (= b_and!32885 (and (=> t!30869 result!14109) b_and!32887)))

(declare-fun m!948995 () Bool)

(assert (=> b!1029803 m!948995))

(declare-fun m!948997 () Bool)

(assert (=> bm!43431 m!948997))

(declare-fun m!948999 () Bool)

(assert (=> b!1029808 m!948999))

(declare-fun m!949001 () Bool)

(assert (=> b!1029808 m!949001))

(assert (=> b!1029808 m!949001))

(declare-fun m!949003 () Bool)

(assert (=> b!1029808 m!949003))

(declare-fun m!949005 () Bool)

(assert (=> b!1029808 m!949005))

(declare-fun m!949007 () Bool)

(assert (=> b!1029808 m!949007))

(assert (=> b!1029808 m!948935))

(declare-fun m!949009 () Bool)

(assert (=> b!1029808 m!949009))

(declare-fun m!949011 () Bool)

(assert (=> b!1029808 m!949011))

(declare-fun m!949013 () Bool)

(assert (=> b!1029808 m!949013))

(declare-fun m!949015 () Bool)

(assert (=> b!1029808 m!949015))

(assert (=> b!1029808 m!949009))

(assert (=> b!1029808 m!948999))

(declare-fun m!949017 () Bool)

(assert (=> b!1029808 m!949017))

(assert (=> b!1029808 m!949013))

(declare-fun m!949019 () Bool)

(assert (=> b!1029808 m!949019))

(declare-fun m!949021 () Bool)

(assert (=> b!1029808 m!949021))

(declare-fun m!949023 () Bool)

(assert (=> b!1029808 m!949023))

(assert (=> b!1029808 m!948997))

(declare-fun m!949025 () Bool)

(assert (=> b!1029808 m!949025))

(declare-fun m!949027 () Bool)

(assert (=> b!1029808 m!949027))

(assert (=> d!123429 m!948905))

(declare-fun m!949029 () Bool)

(assert (=> bm!43433 m!949029))

(declare-fun m!949031 () Bool)

(assert (=> bm!43429 m!949031))

(declare-fun m!949033 () Bool)

(assert (=> b!1029814 m!949033))

(declare-fun m!949035 () Bool)

(assert (=> b!1029816 m!949035))

(assert (=> b!1029800 m!948935))

(assert (=> b!1029800 m!948935))

(assert (=> b!1029800 m!948937))

(declare-fun m!949037 () Bool)

(assert (=> bm!43430 m!949037))

(declare-fun m!949039 () Bool)

(assert (=> b!1029802 m!949039))

(assert (=> b!1029802 m!949039))

(assert (=> b!1029802 m!948797))

(declare-fun m!949041 () Bool)

(assert (=> b!1029802 m!949041))

(assert (=> b!1029802 m!948935))

(declare-fun m!949043 () Bool)

(assert (=> b!1029802 m!949043))

(assert (=> b!1029802 m!948935))

(assert (=> b!1029802 m!948797))

(assert (=> b!1029806 m!948935))

(assert (=> b!1029806 m!948935))

(declare-fun m!949045 () Bool)

(assert (=> b!1029806 m!949045))

(assert (=> b!1029798 m!948935))

(assert (=> b!1029798 m!948935))

(assert (=> b!1029798 m!948937))

(assert (=> b!1029617 d!123429))

(declare-fun b!1029828 () Bool)

(declare-fun e!581432 () Bool)

(declare-fun call!43440 () Bool)

(assert (=> b!1029828 (= e!581432 call!43440)))

(declare-fun bm!43437 () Bool)

(declare-fun c!104200 () Bool)

(assert (=> bm!43437 (= call!43440 (arrayNoDuplicates!0 lt!453437 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104200 (Cons!21799 (select (arr!31153 lt!453437) #b00000000000000000000000000000000) Nil!21800) Nil!21800)))))

(declare-fun b!1029829 () Bool)

(assert (=> b!1029829 (= e!581432 call!43440)))

(declare-fun b!1029830 () Bool)

(declare-fun e!581430 () Bool)

(declare-fun contains!5993 (List!21803 (_ BitVec 64)) Bool)

(assert (=> b!1029830 (= e!581430 (contains!5993 Nil!21800 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(declare-fun b!1029831 () Bool)

(declare-fun e!581429 () Bool)

(declare-fun e!581431 () Bool)

(assert (=> b!1029831 (= e!581429 e!581431)))

(declare-fun res!688698 () Bool)

(assert (=> b!1029831 (=> (not res!688698) (not e!581431))))

(assert (=> b!1029831 (= res!688698 (not e!581430))))

(declare-fun res!688696 () Bool)

(assert (=> b!1029831 (=> (not res!688696) (not e!581430))))

(assert (=> b!1029831 (= res!688696 (validKeyInArray!0 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(declare-fun b!1029832 () Bool)

(assert (=> b!1029832 (= e!581431 e!581432)))

(assert (=> b!1029832 (= c!104200 (validKeyInArray!0 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(declare-fun d!123431 () Bool)

(declare-fun res!688697 () Bool)

(assert (=> d!123431 (=> res!688697 e!581429)))

(assert (=> d!123431 (= res!688697 (bvsge #b00000000000000000000000000000000 (size!31668 lt!453437)))))

(assert (=> d!123431 (= (arrayNoDuplicates!0 lt!453437 #b00000000000000000000000000000000 Nil!21800) e!581429)))

(assert (= (and d!123431 (not res!688697)) b!1029831))

(assert (= (and b!1029831 res!688696) b!1029830))

(assert (= (and b!1029831 res!688698) b!1029832))

(assert (= (and b!1029832 c!104200) b!1029828))

(assert (= (and b!1029832 (not c!104200)) b!1029829))

(assert (= (or b!1029828 b!1029829) bm!43437))

(assert (=> bm!43437 m!948913))

(declare-fun m!949047 () Bool)

(assert (=> bm!43437 m!949047))

(assert (=> b!1029830 m!948913))

(assert (=> b!1029830 m!948913))

(declare-fun m!949049 () Bool)

(assert (=> b!1029830 m!949049))

(assert (=> b!1029831 m!948913))

(assert (=> b!1029831 m!948913))

(assert (=> b!1029831 m!948915))

(assert (=> b!1029832 m!948913))

(assert (=> b!1029832 m!948913))

(assert (=> b!1029832 m!948915))

(assert (=> b!1029617 d!123431))

(declare-fun d!123433 () Bool)

(declare-fun e!581435 () Bool)

(assert (=> d!123433 e!581435))

(declare-fun res!688701 () Bool)

(assert (=> d!123433 (=> (not res!688701) (not e!581435))))

(assert (=> d!123433 (= res!688701 (and (bvsge (index!40904 lt!453434) #b00000000000000000000000000000000) (bvslt (index!40904 lt!453434) (size!31668 (_keys!11294 thiss!1427)))))))

(declare-fun lt!453611 () Unit!33586)

(declare-fun choose!1689 (array!64705 array!64707 (_ BitVec 32) (_ BitVec 32) V!37275 V!37275 (_ BitVec 32) (_ BitVec 64) Int) Unit!33586)

(assert (=> d!123433 (= lt!453611 (choose!1689 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (index!40904 lt!453434) key!909 (defaultEntry!6102 thiss!1427)))))

(assert (=> d!123433 (validMask!0 (mask!29897 thiss!1427))))

(assert (=> d!123433 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!7 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (index!40904 lt!453434) key!909 (defaultEntry!6102 thiss!1427)) lt!453611)))

(declare-fun b!1029835 () Bool)

(assert (=> b!1029835 (= e!581435 (= (-!481 (getCurrentListMap!3904 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) key!909) (getCurrentListMap!3904 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) (array!64708 (store (arr!31154 (_values!6125 thiss!1427)) (index!40904 lt!453434) (ValueCellFull!11447 (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31669 (_values!6125 thiss!1427))) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427))))))

(assert (=> b!1029835 (bvslt (index!40904 lt!453434) (size!31669 (_values!6125 thiss!1427)))))

(assert (= (and d!123433 res!688701) b!1029835))

(declare-fun b_lambda!15805 () Bool)

(assert (=> (not b_lambda!15805) (not b!1029835)))

(assert (=> b!1029835 t!30869))

(declare-fun b_and!32889 () Bool)

(assert (= b_and!32887 (and (=> t!30869 result!14109) b_and!32889)))

(declare-fun m!949051 () Bool)

(assert (=> d!123433 m!949051))

(assert (=> d!123433 m!948905))

(assert (=> b!1029835 m!948785))

(assert (=> b!1029835 m!948787))

(assert (=> b!1029835 m!948769))

(declare-fun m!949053 () Bool)

(assert (=> b!1029835 m!949053))

(assert (=> b!1029835 m!948797))

(assert (=> b!1029835 m!948785))

(assert (=> b!1029835 m!948771))

(assert (=> b!1029617 d!123433))

(declare-fun b!1029844 () Bool)

(declare-fun e!581442 () Bool)

(declare-fun call!43443 () Bool)

(assert (=> b!1029844 (= e!581442 call!43443)))

(declare-fun b!1029845 () Bool)

(declare-fun e!581444 () Bool)

(assert (=> b!1029845 (= e!581442 e!581444)))

(declare-fun lt!453618 () (_ BitVec 64))

(assert (=> b!1029845 (= lt!453618 (select (arr!31153 lt!453437) #b00000000000000000000000000000000))))

(declare-fun lt!453619 () Unit!33586)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64705 (_ BitVec 64) (_ BitVec 32)) Unit!33586)

(assert (=> b!1029845 (= lt!453619 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453437 lt!453618 #b00000000000000000000000000000000))))

(assert (=> b!1029845 (arrayContainsKey!0 lt!453437 lt!453618 #b00000000000000000000000000000000)))

(declare-fun lt!453620 () Unit!33586)

(assert (=> b!1029845 (= lt!453620 lt!453619)))

(declare-fun res!688706 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64705 (_ BitVec 32)) SeekEntryResult!9633)

(assert (=> b!1029845 (= res!688706 (= (seekEntryOrOpen!0 (select (arr!31153 lt!453437) #b00000000000000000000000000000000) lt!453437 (mask!29897 thiss!1427)) (Found!9633 #b00000000000000000000000000000000)))))

(assert (=> b!1029845 (=> (not res!688706) (not e!581444))))

(declare-fun b!1029846 () Bool)

(declare-fun e!581443 () Bool)

(assert (=> b!1029846 (= e!581443 e!581442)))

(declare-fun c!104203 () Bool)

(assert (=> b!1029846 (= c!104203 (validKeyInArray!0 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(declare-fun bm!43440 () Bool)

(assert (=> bm!43440 (= call!43443 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!453437 (mask!29897 thiss!1427)))))

(declare-fun b!1029847 () Bool)

(assert (=> b!1029847 (= e!581444 call!43443)))

(declare-fun d!123435 () Bool)

(declare-fun res!688707 () Bool)

(assert (=> d!123435 (=> res!688707 e!581443)))

(assert (=> d!123435 (= res!688707 (bvsge #b00000000000000000000000000000000 (size!31668 lt!453437)))))

(assert (=> d!123435 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453437 (mask!29897 thiss!1427)) e!581443)))

(assert (= (and d!123435 (not res!688707)) b!1029846))

(assert (= (and b!1029846 c!104203) b!1029845))

(assert (= (and b!1029846 (not c!104203)) b!1029844))

(assert (= (and b!1029845 res!688706) b!1029847))

(assert (= (or b!1029847 b!1029844) bm!43440))

(assert (=> b!1029845 m!948913))

(declare-fun m!949055 () Bool)

(assert (=> b!1029845 m!949055))

(declare-fun m!949057 () Bool)

(assert (=> b!1029845 m!949057))

(assert (=> b!1029845 m!948913))

(declare-fun m!949059 () Bool)

(assert (=> b!1029845 m!949059))

(assert (=> b!1029846 m!948913))

(assert (=> b!1029846 m!948913))

(assert (=> b!1029846 m!948915))

(declare-fun m!949061 () Bool)

(assert (=> bm!43440 m!949061))

(assert (=> b!1029617 d!123435))

(declare-fun d!123437 () Bool)

(declare-fun e!581447 () Bool)

(assert (=> d!123437 e!581447))

(declare-fun res!688710 () Bool)

(assert (=> d!123437 (=> (not res!688710) (not e!581447))))

(assert (=> d!123437 (= res!688710 (bvslt (index!40904 lt!453434) (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun lt!453623 () Unit!33586)

(declare-fun choose!121 (array!64705 (_ BitVec 32) (_ BitVec 64)) Unit!33586)

(assert (=> d!123437 (= lt!453623 (choose!121 (_keys!11294 thiss!1427) (index!40904 lt!453434) key!909))))

(assert (=> d!123437 (bvsge (index!40904 lt!453434) #b00000000000000000000000000000000)))

(assert (=> d!123437 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11294 thiss!1427) (index!40904 lt!453434) key!909) lt!453623)))

(declare-fun b!1029850 () Bool)

(assert (=> b!1029850 (= e!581447 (not (arrayContainsKey!0 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!123437 res!688710) b!1029850))

(declare-fun m!949063 () Bool)

(assert (=> d!123437 m!949063))

(assert (=> b!1029850 m!948771))

(declare-fun m!949065 () Bool)

(assert (=> b!1029850 m!949065))

(assert (=> b!1029617 d!123437))

(declare-fun d!123439 () Bool)

(assert (=> d!123439 (= (array_inv!24133 (_keys!11294 thiss!1427)) (bvsge (size!31668 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029620 d!123439))

(declare-fun d!123441 () Bool)

(assert (=> d!123441 (= (array_inv!24134 (_values!6125 thiss!1427)) (bvsge (size!31669 (_values!6125 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029620 d!123441))

(declare-fun d!123443 () Bool)

(declare-fun res!688717 () Bool)

(declare-fun e!581450 () Bool)

(assert (=> d!123443 (=> (not res!688717) (not e!581450))))

(declare-fun simpleValid!392 (LongMapFixedSize!5488) Bool)

(assert (=> d!123443 (= res!688717 (simpleValid!392 thiss!1427))))

(assert (=> d!123443 (= (valid!2084 thiss!1427) e!581450)))

(declare-fun b!1029857 () Bool)

(declare-fun res!688718 () Bool)

(assert (=> b!1029857 (=> (not res!688718) (not e!581450))))

(assert (=> b!1029857 (= res!688718 (= (arrayCountValidKeys!0 (_keys!11294 thiss!1427) #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))) (_size!2799 thiss!1427)))))

(declare-fun b!1029858 () Bool)

(declare-fun res!688719 () Bool)

(assert (=> b!1029858 (=> (not res!688719) (not e!581450))))

(assert (=> b!1029858 (= res!688719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11294 thiss!1427) (mask!29897 thiss!1427)))))

(declare-fun b!1029859 () Bool)

(assert (=> b!1029859 (= e!581450 (arrayNoDuplicates!0 (_keys!11294 thiss!1427) #b00000000000000000000000000000000 Nil!21800))))

(assert (= (and d!123443 res!688717) b!1029857))

(assert (= (and b!1029857 res!688718) b!1029858))

(assert (= (and b!1029858 res!688719) b!1029859))

(declare-fun m!949067 () Bool)

(assert (=> d!123443 m!949067))

(assert (=> b!1029857 m!948781))

(declare-fun m!949069 () Bool)

(assert (=> b!1029858 m!949069))

(declare-fun m!949071 () Bool)

(assert (=> b!1029859 m!949071))

(assert (=> start!89922 d!123443))

(declare-fun b!1029866 () Bool)

(declare-fun e!581456 () Bool)

(assert (=> b!1029866 (= e!581456 tp_is_empty!24301)))

(declare-fun b!1029867 () Bool)

(declare-fun e!581455 () Bool)

(assert (=> b!1029867 (= e!581455 tp_is_empty!24301)))

(declare-fun mapIsEmpty!37896 () Bool)

(declare-fun mapRes!37896 () Bool)

(assert (=> mapIsEmpty!37896 mapRes!37896))

(declare-fun condMapEmpty!37896 () Bool)

(declare-fun mapDefault!37896 () ValueCell!11447)

(assert (=> mapNonEmpty!37887 (= condMapEmpty!37896 (= mapRest!37887 ((as const (Array (_ BitVec 32) ValueCell!11447)) mapDefault!37896)))))

(assert (=> mapNonEmpty!37887 (= tp!72796 (and e!581455 mapRes!37896))))

(declare-fun mapNonEmpty!37896 () Bool)

(declare-fun tp!72811 () Bool)

(assert (=> mapNonEmpty!37896 (= mapRes!37896 (and tp!72811 e!581456))))

(declare-fun mapRest!37896 () (Array (_ BitVec 32) ValueCell!11447))

(declare-fun mapKey!37896 () (_ BitVec 32))

(declare-fun mapValue!37896 () ValueCell!11447)

(assert (=> mapNonEmpty!37896 (= mapRest!37887 (store mapRest!37896 mapKey!37896 mapValue!37896))))

(assert (= (and mapNonEmpty!37887 condMapEmpty!37896) mapIsEmpty!37896))

(assert (= (and mapNonEmpty!37887 (not condMapEmpty!37896)) mapNonEmpty!37896))

(assert (= (and mapNonEmpty!37896 ((_ is ValueCellFull!11447) mapValue!37896)) b!1029866))

(assert (= (and mapNonEmpty!37887 ((_ is ValueCellFull!11447) mapDefault!37896)) b!1029867))

(declare-fun m!949073 () Bool)

(assert (=> mapNonEmpty!37896 m!949073))

(declare-fun b_lambda!15807 () Bool)

(assert (= b_lambda!15803 (or (and b!1029620 b_free!20581) b_lambda!15807)))

(declare-fun b_lambda!15809 () Bool)

(assert (= b_lambda!15805 (or (and b!1029620 b_free!20581) b_lambda!15809)))

(declare-fun b_lambda!15811 () Bool)

(assert (= b_lambda!15801 (or (and b!1029620 b_free!20581) b_lambda!15811)))

(check-sat (not b!1029689) (not d!123425) (not bm!43405) (not d!123421) (not bm!43437) (not b!1029793) (not bm!43406) (not b!1029800) (not b_lambda!15809) (not b!1029726) (not bm!43426) (not b_lambda!15811) (not d!123419) (not b!1029802) (not b!1029859) (not b!1029845) (not b!1029831) (not b!1029777) (not b!1029787) (not d!123409) (not b!1029806) (not d!123427) (not b!1029781) (not bm!43422) (not d!123433) (not d!123429) (not b!1029835) (not b!1029714) (not b!1029779) (not b_lambda!15807) (not bm!43431) (not b!1029808) (not b!1029696) (not b!1029830) (not b!1029782) (not d!123437) (not b!1029857) (not d!123443) (not d!123411) (not mapNonEmpty!37896) tp_is_empty!24301 (not bm!43429) (not b!1029816) (not b!1029728) (not bm!43424) (not b!1029832) (not b!1029814) (not bm!43430) (not b!1029798) (not b!1029795) (not b!1029858) (not bm!43433) (not b_next!20581) (not b!1029733) (not b!1029846) (not b!1029803) (not b!1029850) b_and!32889 (not b_lambda!15799) (not bm!43440) (not b!1029723) (not b!1029706) (not b!1029724) (not bm!43423) (not b!1029785))
(check-sat b_and!32889 (not b_next!20581))
(get-model)

(declare-fun d!123445 () Bool)

(assert (=> d!123445 (= (-!481 (getCurrentListMap!3904 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) key!909) (getCurrentListMap!3904 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) (array!64708 (store (arr!31154 (_values!6125 thiss!1427)) (index!40904 lt!453434) (ValueCellFull!11447 (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31669 (_values!6125 thiss!1427))) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(assert (=> d!123445 true))

(declare-fun _$9!38 () Unit!33586)

(assert (=> d!123445 (= (choose!1689 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (index!40904 lt!453434) key!909 (defaultEntry!6102 thiss!1427)) _$9!38)))

(declare-fun b_lambda!15813 () Bool)

(assert (=> (not b_lambda!15813) (not d!123445)))

(assert (=> d!123445 t!30869))

(declare-fun b_and!32891 () Bool)

(assert (= b_and!32889 (and (=> t!30869 result!14109) b_and!32891)))

(assert (=> d!123445 m!948785))

(assert (=> d!123445 m!948787))

(assert (=> d!123445 m!949053))

(assert (=> d!123445 m!948797))

(assert (=> d!123445 m!948769))

(assert (=> d!123445 m!948771))

(assert (=> d!123445 m!948785))

(assert (=> d!123433 d!123445))

(declare-fun d!123447 () Bool)

(assert (=> d!123447 (= (validMask!0 (mask!29897 thiss!1427)) (and (or (= (mask!29897 thiss!1427) #b00000000000000000000000000000111) (= (mask!29897 thiss!1427) #b00000000000000000000000000001111) (= (mask!29897 thiss!1427) #b00000000000000000000000000011111) (= (mask!29897 thiss!1427) #b00000000000000000000000000111111) (= (mask!29897 thiss!1427) #b00000000000000000000000001111111) (= (mask!29897 thiss!1427) #b00000000000000000000000011111111) (= (mask!29897 thiss!1427) #b00000000000000000000000111111111) (= (mask!29897 thiss!1427) #b00000000000000000000001111111111) (= (mask!29897 thiss!1427) #b00000000000000000000011111111111) (= (mask!29897 thiss!1427) #b00000000000000000000111111111111) (= (mask!29897 thiss!1427) #b00000000000000000001111111111111) (= (mask!29897 thiss!1427) #b00000000000000000011111111111111) (= (mask!29897 thiss!1427) #b00000000000000000111111111111111) (= (mask!29897 thiss!1427) #b00000000000000001111111111111111) (= (mask!29897 thiss!1427) #b00000000000000011111111111111111) (= (mask!29897 thiss!1427) #b00000000000000111111111111111111) (= (mask!29897 thiss!1427) #b00000000000001111111111111111111) (= (mask!29897 thiss!1427) #b00000000000011111111111111111111) (= (mask!29897 thiss!1427) #b00000000000111111111111111111111) (= (mask!29897 thiss!1427) #b00000000001111111111111111111111) (= (mask!29897 thiss!1427) #b00000000011111111111111111111111) (= (mask!29897 thiss!1427) #b00000000111111111111111111111111) (= (mask!29897 thiss!1427) #b00000001111111111111111111111111) (= (mask!29897 thiss!1427) #b00000011111111111111111111111111) (= (mask!29897 thiss!1427) #b00000111111111111111111111111111) (= (mask!29897 thiss!1427) #b00001111111111111111111111111111) (= (mask!29897 thiss!1427) #b00011111111111111111111111111111) (= (mask!29897 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29897 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!123433 d!123447))

(declare-fun d!123449 () Bool)

(declare-fun e!581462 () Bool)

(assert (=> d!123449 e!581462))

(declare-fun res!688722 () Bool)

(assert (=> d!123449 (=> res!688722 e!581462)))

(declare-fun lt!453633 () Bool)

(assert (=> d!123449 (= res!688722 (not lt!453633))))

(declare-fun lt!453634 () Bool)

(assert (=> d!123449 (= lt!453633 lt!453634)))

(declare-fun lt!453635 () Unit!33586)

(declare-fun e!581461 () Unit!33586)

(assert (=> d!123449 (= lt!453635 e!581461)))

(declare-fun c!104206 () Bool)

(assert (=> d!123449 (= c!104206 lt!453634)))

(declare-fun containsKey!562 (List!21802 (_ BitVec 64)) Bool)

(assert (=> d!123449 (= lt!453634 (containsKey!562 (toList!6858 lt!453596) (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123449 (= (contains!5992 lt!453596 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)) lt!453633)))

(declare-fun b!1029874 () Bool)

(declare-fun lt!453632 () Unit!33586)

(assert (=> b!1029874 (= e!581461 lt!453632)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!393 (List!21802 (_ BitVec 64)) Unit!33586)

(assert (=> b!1029874 (= lt!453632 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6858 lt!453596) (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-datatypes ((Option!632 0))(
  ( (Some!631 (v!14772 V!37275)) (None!630) )
))
(declare-fun isDefined!431 (Option!632) Bool)

(declare-fun getValueByKey!581 (List!21802 (_ BitVec 64)) Option!632)

(assert (=> b!1029874 (isDefined!431 (getValueByKey!581 (toList!6858 lt!453596) (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029875 () Bool)

(declare-fun Unit!33596 () Unit!33586)

(assert (=> b!1029875 (= e!581461 Unit!33596)))

(declare-fun b!1029876 () Bool)

(assert (=> b!1029876 (= e!581462 (isDefined!431 (getValueByKey!581 (toList!6858 lt!453596) (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!123449 c!104206) b!1029874))

(assert (= (and d!123449 (not c!104206)) b!1029875))

(assert (= (and d!123449 (not res!688722)) b!1029876))

(assert (=> d!123449 m!948935))

(declare-fun m!949075 () Bool)

(assert (=> d!123449 m!949075))

(assert (=> b!1029874 m!948935))

(declare-fun m!949077 () Bool)

(assert (=> b!1029874 m!949077))

(assert (=> b!1029874 m!948935))

(declare-fun m!949079 () Bool)

(assert (=> b!1029874 m!949079))

(assert (=> b!1029874 m!949079))

(declare-fun m!949081 () Bool)

(assert (=> b!1029874 m!949081))

(assert (=> b!1029876 m!948935))

(assert (=> b!1029876 m!949079))

(assert (=> b!1029876 m!949079))

(assert (=> b!1029876 m!949081))

(assert (=> b!1029806 d!123449))

(declare-fun b!1029877 () Bool)

(declare-fun e!581463 () Bool)

(declare-fun call!43444 () Bool)

(assert (=> b!1029877 (= e!581463 call!43444)))

(declare-fun b!1029878 () Bool)

(declare-fun e!581465 () Bool)

(assert (=> b!1029878 (= e!581463 e!581465)))

(declare-fun lt!453636 () (_ BitVec 64))

(assert (=> b!1029878 (= lt!453636 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453637 () Unit!33586)

(assert (=> b!1029878 (= lt!453637 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11294 thiss!1427) lt!453636 #b00000000000000000000000000000000))))

(assert (=> b!1029878 (arrayContainsKey!0 (_keys!11294 thiss!1427) lt!453636 #b00000000000000000000000000000000)))

(declare-fun lt!453638 () Unit!33586)

(assert (=> b!1029878 (= lt!453638 lt!453637)))

(declare-fun res!688723 () Bool)

(assert (=> b!1029878 (= res!688723 (= (seekEntryOrOpen!0 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000) (_keys!11294 thiss!1427) (mask!29897 thiss!1427)) (Found!9633 #b00000000000000000000000000000000)))))

(assert (=> b!1029878 (=> (not res!688723) (not e!581465))))

(declare-fun b!1029879 () Bool)

(declare-fun e!581464 () Bool)

(assert (=> b!1029879 (= e!581464 e!581463)))

(declare-fun c!104207 () Bool)

(assert (=> b!1029879 (= c!104207 (validKeyInArray!0 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43441 () Bool)

(assert (=> bm!43441 (= call!43444 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11294 thiss!1427) (mask!29897 thiss!1427)))))

(declare-fun b!1029880 () Bool)

(assert (=> b!1029880 (= e!581465 call!43444)))

(declare-fun d!123451 () Bool)

(declare-fun res!688724 () Bool)

(assert (=> d!123451 (=> res!688724 e!581464)))

(assert (=> d!123451 (= res!688724 (bvsge #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))))))

(assert (=> d!123451 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11294 thiss!1427) (mask!29897 thiss!1427)) e!581464)))

(assert (= (and d!123451 (not res!688724)) b!1029879))

(assert (= (and b!1029879 c!104207) b!1029878))

(assert (= (and b!1029879 (not c!104207)) b!1029877))

(assert (= (and b!1029878 res!688723) b!1029880))

(assert (= (or b!1029880 b!1029877) bm!43441))

(assert (=> b!1029878 m!948935))

(declare-fun m!949083 () Bool)

(assert (=> b!1029878 m!949083))

(declare-fun m!949085 () Bool)

(assert (=> b!1029878 m!949085))

(assert (=> b!1029878 m!948935))

(declare-fun m!949087 () Bool)

(assert (=> b!1029878 m!949087))

(assert (=> b!1029879 m!948935))

(assert (=> b!1029879 m!948935))

(assert (=> b!1029879 m!948937))

(declare-fun m!949089 () Bool)

(assert (=> bm!43441 m!949089))

(assert (=> b!1029858 d!123451))

(declare-fun d!123453 () Bool)

(declare-fun get!16377 (Option!632) V!37275)

(assert (=> d!123453 (= (apply!910 lt!453574 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)) (get!16377 (getValueByKey!581 (toList!6858 lt!453574) (select (arr!31153 lt!453437) #b00000000000000000000000000000000))))))

(declare-fun bs!30044 () Bool)

(assert (= bs!30044 d!123453))

(assert (=> bs!30044 m!948913))

(declare-fun m!949091 () Bool)

(assert (=> bs!30044 m!949091))

(assert (=> bs!30044 m!949091))

(declare-fun m!949093 () Bool)

(assert (=> bs!30044 m!949093))

(assert (=> b!1029781 d!123453))

(declare-fun d!123455 () Bool)

(declare-fun c!104210 () Bool)

(assert (=> d!123455 (= c!104210 ((_ is ValueCellFull!11447) (select (arr!31154 lt!453435) #b00000000000000000000000000000000)))))

(declare-fun e!581468 () V!37275)

(assert (=> d!123455 (= (get!16376 (select (arr!31154 lt!453435) #b00000000000000000000000000000000) (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!581468)))

(declare-fun b!1029885 () Bool)

(declare-fun get!16378 (ValueCell!11447 V!37275) V!37275)

(assert (=> b!1029885 (= e!581468 (get!16378 (select (arr!31154 lt!453435) #b00000000000000000000000000000000) (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029886 () Bool)

(declare-fun get!16379 (ValueCell!11447 V!37275) V!37275)

(assert (=> b!1029886 (= e!581468 (get!16379 (select (arr!31154 lt!453435) #b00000000000000000000000000000000) (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123455 c!104210) b!1029885))

(assert (= (and d!123455 (not c!104210)) b!1029886))

(assert (=> b!1029885 m!948987))

(assert (=> b!1029885 m!948797))

(declare-fun m!949095 () Bool)

(assert (=> b!1029885 m!949095))

(assert (=> b!1029886 m!948987))

(assert (=> b!1029886 m!948797))

(declare-fun m!949097 () Bool)

(assert (=> b!1029886 m!949097))

(assert (=> b!1029781 d!123455))

(declare-fun b!1029887 () Bool)

(declare-fun e!581470 () (_ BitVec 32))

(declare-fun call!43445 () (_ BitVec 32))

(assert (=> b!1029887 (= e!581470 call!43445)))

(declare-fun d!123457 () Bool)

(declare-fun lt!453639 () (_ BitVec 32))

(assert (=> d!123457 (and (bvsge lt!453639 #b00000000000000000000000000000000) (bvsle lt!453639 (bvsub (size!31668 (_keys!11294 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!581469 () (_ BitVec 32))

(assert (=> d!123457 (= lt!453639 e!581469)))

(declare-fun c!104212 () Bool)

(assert (=> d!123457 (= c!104212 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31668 (_keys!11294 thiss!1427))))))

(assert (=> d!123457 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31668 (_keys!11294 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31668 (_keys!11294 thiss!1427)) (size!31668 (_keys!11294 thiss!1427))))))

(assert (=> d!123457 (= (arrayCountValidKeys!0 (_keys!11294 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31668 (_keys!11294 thiss!1427))) lt!453639)))

(declare-fun bm!43442 () Bool)

(assert (=> bm!43442 (= call!43445 (arrayCountValidKeys!0 (_keys!11294 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun b!1029888 () Bool)

(assert (=> b!1029888 (= e!581469 e!581470)))

(declare-fun c!104211 () Bool)

(assert (=> b!1029888 (= c!104211 (validKeyInArray!0 (select (arr!31153 (_keys!11294 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029889 () Bool)

(assert (=> b!1029889 (= e!581469 #b00000000000000000000000000000000)))

(declare-fun b!1029890 () Bool)

(assert (=> b!1029890 (= e!581470 (bvadd #b00000000000000000000000000000001 call!43445))))

(assert (= (and d!123457 c!104212) b!1029889))

(assert (= (and d!123457 (not c!104212)) b!1029888))

(assert (= (and b!1029888 c!104211) b!1029890))

(assert (= (and b!1029888 (not c!104211)) b!1029887))

(assert (= (or b!1029890 b!1029887) bm!43442))

(declare-fun m!949099 () Bool)

(assert (=> bm!43442 m!949099))

(declare-fun m!949101 () Bool)

(assert (=> b!1029888 m!949101))

(assert (=> b!1029888 m!949101))

(declare-fun m!949103 () Bool)

(assert (=> b!1029888 m!949103))

(assert (=> bm!43406 d!123457))

(declare-fun b!1029903 () Bool)

(declare-fun e!581477 () SeekEntryResult!9633)

(assert (=> b!1029903 (= e!581477 (Found!9633 (index!40905 lt!453501)))))

(declare-fun b!1029904 () Bool)

(declare-fun e!581479 () SeekEntryResult!9633)

(assert (=> b!1029904 (= e!581479 (MissingVacant!9633 (index!40905 lt!453501)))))

(declare-fun b!1029905 () Bool)

(declare-fun e!581478 () SeekEntryResult!9633)

(assert (=> b!1029905 (= e!581478 e!581477)))

(declare-fun c!104219 () Bool)

(declare-fun lt!453644 () (_ BitVec 64))

(assert (=> b!1029905 (= c!104219 (= lt!453644 key!909))))

(declare-fun lt!453645 () SeekEntryResult!9633)

(declare-fun d!123459 () Bool)

(assert (=> d!123459 (and (or ((_ is Undefined!9633) lt!453645) (not ((_ is Found!9633) lt!453645)) (and (bvsge (index!40904 lt!453645) #b00000000000000000000000000000000) (bvslt (index!40904 lt!453645) (size!31668 (_keys!11294 thiss!1427))))) (or ((_ is Undefined!9633) lt!453645) ((_ is Found!9633) lt!453645) (not ((_ is MissingVacant!9633) lt!453645)) (not (= (index!40906 lt!453645) (index!40905 lt!453501))) (and (bvsge (index!40906 lt!453645) #b00000000000000000000000000000000) (bvslt (index!40906 lt!453645) (size!31668 (_keys!11294 thiss!1427))))) (or ((_ is Undefined!9633) lt!453645) (ite ((_ is Found!9633) lt!453645) (= (select (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453645)) key!909) (and ((_ is MissingVacant!9633) lt!453645) (= (index!40906 lt!453645) (index!40905 lt!453501)) (= (select (arr!31153 (_keys!11294 thiss!1427)) (index!40906 lt!453645)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!123459 (= lt!453645 e!581478)))

(declare-fun c!104221 () Bool)

(assert (=> d!123459 (= c!104221 (bvsge (x!91483 lt!453501) #b01111111111111111111111111111110))))

(assert (=> d!123459 (= lt!453644 (select (arr!31153 (_keys!11294 thiss!1427)) (index!40905 lt!453501)))))

(assert (=> d!123459 (validMask!0 (mask!29897 thiss!1427))))

(assert (=> d!123459 (= (seekKeyOrZeroReturnVacant!0 (x!91483 lt!453501) (index!40905 lt!453501) (index!40905 lt!453501) key!909 (_keys!11294 thiss!1427) (mask!29897 thiss!1427)) lt!453645)))

(declare-fun b!1029906 () Bool)

(declare-fun c!104220 () Bool)

(assert (=> b!1029906 (= c!104220 (= lt!453644 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029906 (= e!581477 e!581479)))

(declare-fun b!1029907 () Bool)

(assert (=> b!1029907 (= e!581478 Undefined!9633)))

(declare-fun b!1029908 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1029908 (= e!581479 (seekKeyOrZeroReturnVacant!0 (bvadd (x!91483 lt!453501) #b00000000000000000000000000000001) (nextIndex!0 (index!40905 lt!453501) (bvadd (x!91483 lt!453501) #b00000000000000000000000000000001) (mask!29897 thiss!1427)) (index!40905 lt!453501) key!909 (_keys!11294 thiss!1427) (mask!29897 thiss!1427)))))

(assert (= (and d!123459 c!104221) b!1029907))

(assert (= (and d!123459 (not c!104221)) b!1029905))

(assert (= (and b!1029905 c!104219) b!1029903))

(assert (= (and b!1029905 (not c!104219)) b!1029906))

(assert (= (and b!1029906 c!104220) b!1029904))

(assert (= (and b!1029906 (not c!104220)) b!1029908))

(declare-fun m!949105 () Bool)

(assert (=> d!123459 m!949105))

(declare-fun m!949107 () Bool)

(assert (=> d!123459 m!949107))

(assert (=> d!123459 m!948897))

(assert (=> d!123459 m!948905))

(declare-fun m!949109 () Bool)

(assert (=> b!1029908 m!949109))

(assert (=> b!1029908 m!949109))

(declare-fun m!949111 () Bool)

(assert (=> b!1029908 m!949111))

(assert (=> b!1029689 d!123459))

(declare-fun d!123461 () Bool)

(assert (=> d!123461 (= (validKeyInArray!0 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)) (and (not (= (select (arr!31153 lt!453437) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31153 lt!453437) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029779 d!123461))

(assert (=> b!1029777 d!123461))

(declare-fun d!123463 () Bool)

(declare-fun res!688734 () Bool)

(declare-fun e!581482 () Bool)

(assert (=> d!123463 (=> (not res!688734) (not e!581482))))

(assert (=> d!123463 (= res!688734 (validMask!0 (mask!29897 thiss!1427)))))

(assert (=> d!123463 (= (simpleValid!392 thiss!1427) e!581482)))

(declare-fun b!1029919 () Bool)

(declare-fun res!688735 () Bool)

(assert (=> b!1029919 (=> (not res!688735) (not e!581482))))

(declare-fun size!31674 (LongMapFixedSize!5488) (_ BitVec 32))

(assert (=> b!1029919 (= res!688735 (= (size!31674 thiss!1427) (bvadd (_size!2799 thiss!1427) (bvsdiv (bvadd (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1029920 () Bool)

(assert (=> b!1029920 (= e!581482 (and (bvsge (extraKeys!5834 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5834 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2799 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1029918 () Bool)

(declare-fun res!688733 () Bool)

(assert (=> b!1029918 (=> (not res!688733) (not e!581482))))

(assert (=> b!1029918 (= res!688733 (bvsge (size!31674 thiss!1427) (_size!2799 thiss!1427)))))

(declare-fun b!1029917 () Bool)

(declare-fun res!688736 () Bool)

(assert (=> b!1029917 (=> (not res!688736) (not e!581482))))

(assert (=> b!1029917 (= res!688736 (and (= (size!31669 (_values!6125 thiss!1427)) (bvadd (mask!29897 thiss!1427) #b00000000000000000000000000000001)) (= (size!31668 (_keys!11294 thiss!1427)) (size!31669 (_values!6125 thiss!1427))) (bvsge (_size!2799 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2799 thiss!1427) (bvadd (mask!29897 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!123463 res!688734) b!1029917))

(assert (= (and b!1029917 res!688736) b!1029918))

(assert (= (and b!1029918 res!688733) b!1029919))

(assert (= (and b!1029919 res!688735) b!1029920))

(assert (=> d!123463 m!948905))

(declare-fun m!949113 () Bool)

(assert (=> b!1029919 m!949113))

(assert (=> b!1029918 m!949113))

(assert (=> d!123443 d!123463))

(declare-fun b!1029921 () Bool)

(declare-fun e!581483 () Bool)

(declare-fun call!43446 () Bool)

(assert (=> b!1029921 (= e!581483 call!43446)))

(declare-fun b!1029922 () Bool)

(declare-fun e!581485 () Bool)

(assert (=> b!1029922 (= e!581483 e!581485)))

(declare-fun lt!453646 () (_ BitVec 64))

(assert (=> b!1029922 (= lt!453646 (select (arr!31153 lt!453437) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!453647 () Unit!33586)

(assert (=> b!1029922 (= lt!453647 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453437 lt!453646 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1029922 (arrayContainsKey!0 lt!453437 lt!453646 #b00000000000000000000000000000000)))

(declare-fun lt!453648 () Unit!33586)

(assert (=> b!1029922 (= lt!453648 lt!453647)))

(declare-fun res!688737 () Bool)

(assert (=> b!1029922 (= res!688737 (= (seekEntryOrOpen!0 (select (arr!31153 lt!453437) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!453437 (mask!29897 thiss!1427)) (Found!9633 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1029922 (=> (not res!688737) (not e!581485))))

(declare-fun b!1029923 () Bool)

(declare-fun e!581484 () Bool)

(assert (=> b!1029923 (= e!581484 e!581483)))

(declare-fun c!104222 () Bool)

(assert (=> b!1029923 (= c!104222 (validKeyInArray!0 (select (arr!31153 lt!453437) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!43443 () Bool)

(assert (=> bm!43443 (= call!43446 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!453437 (mask!29897 thiss!1427)))))

(declare-fun b!1029924 () Bool)

(assert (=> b!1029924 (= e!581485 call!43446)))

(declare-fun d!123465 () Bool)

(declare-fun res!688738 () Bool)

(assert (=> d!123465 (=> res!688738 e!581484)))

(assert (=> d!123465 (= res!688738 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31668 lt!453437)))))

(assert (=> d!123465 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!453437 (mask!29897 thiss!1427)) e!581484)))

(assert (= (and d!123465 (not res!688738)) b!1029923))

(assert (= (and b!1029923 c!104222) b!1029922))

(assert (= (and b!1029923 (not c!104222)) b!1029921))

(assert (= (and b!1029922 res!688737) b!1029924))

(assert (= (or b!1029924 b!1029921) bm!43443))

(declare-fun m!949115 () Bool)

(assert (=> b!1029922 m!949115))

(declare-fun m!949117 () Bool)

(assert (=> b!1029922 m!949117))

(declare-fun m!949119 () Bool)

(assert (=> b!1029922 m!949119))

(assert (=> b!1029922 m!949115))

(declare-fun m!949121 () Bool)

(assert (=> b!1029922 m!949121))

(assert (=> b!1029923 m!949115))

(assert (=> b!1029923 m!949115))

(declare-fun m!949123 () Bool)

(assert (=> b!1029923 m!949123))

(declare-fun m!949125 () Bool)

(assert (=> bm!43443 m!949125))

(assert (=> bm!43440 d!123465))

(declare-fun d!123467 () Bool)

(assert (=> d!123467 (= (validKeyInArray!0 (select (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434))) (and (not (= (select (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029723 d!123467))

(declare-fun d!123469 () Bool)

(assert (=> d!123469 (arrayContainsKey!0 lt!453437 lt!453618 #b00000000000000000000000000000000)))

(declare-fun lt!453651 () Unit!33586)

(declare-fun choose!13 (array!64705 (_ BitVec 64) (_ BitVec 32)) Unit!33586)

(assert (=> d!123469 (= lt!453651 (choose!13 lt!453437 lt!453618 #b00000000000000000000000000000000))))

(assert (=> d!123469 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!123469 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453437 lt!453618 #b00000000000000000000000000000000) lt!453651)))

(declare-fun bs!30045 () Bool)

(assert (= bs!30045 d!123469))

(assert (=> bs!30045 m!949057))

(declare-fun m!949127 () Bool)

(assert (=> bs!30045 m!949127))

(assert (=> b!1029845 d!123469))

(declare-fun d!123471 () Bool)

(declare-fun res!688739 () Bool)

(declare-fun e!581486 () Bool)

(assert (=> d!123471 (=> res!688739 e!581486)))

(assert (=> d!123471 (= res!688739 (= (select (arr!31153 lt!453437) #b00000000000000000000000000000000) lt!453618))))

(assert (=> d!123471 (= (arrayContainsKey!0 lt!453437 lt!453618 #b00000000000000000000000000000000) e!581486)))

(declare-fun b!1029925 () Bool)

(declare-fun e!581487 () Bool)

(assert (=> b!1029925 (= e!581486 e!581487)))

(declare-fun res!688740 () Bool)

(assert (=> b!1029925 (=> (not res!688740) (not e!581487))))

(assert (=> b!1029925 (= res!688740 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31668 lt!453437)))))

(declare-fun b!1029926 () Bool)

(assert (=> b!1029926 (= e!581487 (arrayContainsKey!0 lt!453437 lt!453618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123471 (not res!688739)) b!1029925))

(assert (= (and b!1029925 res!688740) b!1029926))

(assert (=> d!123471 m!948913))

(declare-fun m!949129 () Bool)

(assert (=> b!1029926 m!949129))

(assert (=> b!1029845 d!123471))

(declare-fun b!1029939 () Bool)

(declare-fun e!581495 () SeekEntryResult!9633)

(declare-fun e!581494 () SeekEntryResult!9633)

(assert (=> b!1029939 (= e!581495 e!581494)))

(declare-fun lt!453660 () (_ BitVec 64))

(declare-fun lt!453658 () SeekEntryResult!9633)

(assert (=> b!1029939 (= lt!453660 (select (arr!31153 lt!453437) (index!40905 lt!453658)))))

(declare-fun c!104231 () Bool)

(assert (=> b!1029939 (= c!104231 (= lt!453660 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(declare-fun b!1029940 () Bool)

(declare-fun c!104230 () Bool)

(assert (=> b!1029940 (= c!104230 (= lt!453660 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581496 () SeekEntryResult!9633)

(assert (=> b!1029940 (= e!581494 e!581496)))

(declare-fun b!1029941 () Bool)

(assert (=> b!1029941 (= e!581495 Undefined!9633)))

(declare-fun d!123473 () Bool)

(declare-fun lt!453659 () SeekEntryResult!9633)

(assert (=> d!123473 (and (or ((_ is Undefined!9633) lt!453659) (not ((_ is Found!9633) lt!453659)) (and (bvsge (index!40904 lt!453659) #b00000000000000000000000000000000) (bvslt (index!40904 lt!453659) (size!31668 lt!453437)))) (or ((_ is Undefined!9633) lt!453659) ((_ is Found!9633) lt!453659) (not ((_ is MissingZero!9633) lt!453659)) (and (bvsge (index!40903 lt!453659) #b00000000000000000000000000000000) (bvslt (index!40903 lt!453659) (size!31668 lt!453437)))) (or ((_ is Undefined!9633) lt!453659) ((_ is Found!9633) lt!453659) ((_ is MissingZero!9633) lt!453659) (not ((_ is MissingVacant!9633) lt!453659)) (and (bvsge (index!40906 lt!453659) #b00000000000000000000000000000000) (bvslt (index!40906 lt!453659) (size!31668 lt!453437)))) (or ((_ is Undefined!9633) lt!453659) (ite ((_ is Found!9633) lt!453659) (= (select (arr!31153 lt!453437) (index!40904 lt!453659)) (select (arr!31153 lt!453437) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9633) lt!453659) (= (select (arr!31153 lt!453437) (index!40903 lt!453659)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9633) lt!453659) (= (select (arr!31153 lt!453437) (index!40906 lt!453659)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!123473 (= lt!453659 e!581495)))

(declare-fun c!104229 () Bool)

(assert (=> d!123473 (= c!104229 (and ((_ is Intermediate!9633) lt!453658) (undefined!10445 lt!453658)))))

(assert (=> d!123473 (= lt!453658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31153 lt!453437) #b00000000000000000000000000000000) (mask!29897 thiss!1427)) (select (arr!31153 lt!453437) #b00000000000000000000000000000000) lt!453437 (mask!29897 thiss!1427)))))

(assert (=> d!123473 (validMask!0 (mask!29897 thiss!1427))))

(assert (=> d!123473 (= (seekEntryOrOpen!0 (select (arr!31153 lt!453437) #b00000000000000000000000000000000) lt!453437 (mask!29897 thiss!1427)) lt!453659)))

(declare-fun b!1029942 () Bool)

(assert (=> b!1029942 (= e!581496 (seekKeyOrZeroReturnVacant!0 (x!91483 lt!453658) (index!40905 lt!453658) (index!40905 lt!453658) (select (arr!31153 lt!453437) #b00000000000000000000000000000000) lt!453437 (mask!29897 thiss!1427)))))

(declare-fun b!1029943 () Bool)

(assert (=> b!1029943 (= e!581496 (MissingZero!9633 (index!40905 lt!453658)))))

(declare-fun b!1029944 () Bool)

(assert (=> b!1029944 (= e!581494 (Found!9633 (index!40905 lt!453658)))))

(assert (= (and d!123473 c!104229) b!1029941))

(assert (= (and d!123473 (not c!104229)) b!1029939))

(assert (= (and b!1029939 c!104231) b!1029944))

(assert (= (and b!1029939 (not c!104231)) b!1029940))

(assert (= (and b!1029940 c!104230) b!1029943))

(assert (= (and b!1029940 (not c!104230)) b!1029942))

(declare-fun m!949131 () Bool)

(assert (=> b!1029939 m!949131))

(declare-fun m!949133 () Bool)

(assert (=> d!123473 m!949133))

(declare-fun m!949135 () Bool)

(assert (=> d!123473 m!949135))

(declare-fun m!949137 () Bool)

(assert (=> d!123473 m!949137))

(assert (=> d!123473 m!948913))

(declare-fun m!949139 () Bool)

(assert (=> d!123473 m!949139))

(declare-fun m!949141 () Bool)

(assert (=> d!123473 m!949141))

(assert (=> d!123473 m!948913))

(assert (=> d!123473 m!949137))

(assert (=> d!123473 m!948905))

(assert (=> b!1029942 m!948913))

(declare-fun m!949143 () Bool)

(assert (=> b!1029942 m!949143))

(assert (=> b!1029845 d!123473))

(assert (=> b!1029832 d!123461))

(declare-fun d!123475 () Bool)

(assert (=> d!123475 (= (apply!910 lt!453596 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)) (get!16377 (getValueByKey!581 (toList!6858 lt!453596) (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30046 () Bool)

(assert (= bs!30046 d!123475))

(assert (=> bs!30046 m!948935))

(assert (=> bs!30046 m!949079))

(assert (=> bs!30046 m!949079))

(declare-fun m!949145 () Bool)

(assert (=> bs!30046 m!949145))

(assert (=> b!1029802 d!123475))

(declare-fun d!123477 () Bool)

(declare-fun c!104232 () Bool)

(assert (=> d!123477 (= c!104232 ((_ is ValueCellFull!11447) (select (arr!31154 (_values!6125 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!581497 () V!37275)

(assert (=> d!123477 (= (get!16376 (select (arr!31154 (_values!6125 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!581497)))

(declare-fun b!1029945 () Bool)

(assert (=> b!1029945 (= e!581497 (get!16378 (select (arr!31154 (_values!6125 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029946 () Bool)

(assert (=> b!1029946 (= e!581497 (get!16379 (select (arr!31154 (_values!6125 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123477 c!104232) b!1029945))

(assert (= (and d!123477 (not c!104232)) b!1029946))

(assert (=> b!1029945 m!949039))

(assert (=> b!1029945 m!948797))

(declare-fun m!949147 () Bool)

(assert (=> b!1029945 m!949147))

(assert (=> b!1029946 m!949039))

(assert (=> b!1029946 m!948797))

(declare-fun m!949149 () Bool)

(assert (=> b!1029946 m!949149))

(assert (=> b!1029802 d!123477))

(declare-fun d!123479 () Bool)

(declare-fun e!581500 () Bool)

(assert (=> d!123479 e!581500))

(declare-fun res!688745 () Bool)

(assert (=> d!123479 (=> (not res!688745) (not e!581500))))

(declare-fun lt!453672 () ListLongMap!13685)

(assert (=> d!123479 (= res!688745 (contains!5992 lt!453672 (_1!7787 (ite (or c!104186 c!104188) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(declare-fun lt!453670 () List!21802)

(assert (=> d!123479 (= lt!453672 (ListLongMap!13686 lt!453670))))

(declare-fun lt!453669 () Unit!33586)

(declare-fun lt!453671 () Unit!33586)

(assert (=> d!123479 (= lt!453669 lt!453671)))

(assert (=> d!123479 (= (getValueByKey!581 lt!453670 (_1!7787 (ite (or c!104186 c!104188) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))) (Some!631 (_2!7787 (ite (or c!104186 c!104188) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!277 (List!21802 (_ BitVec 64) V!37275) Unit!33586)

(assert (=> d!123479 (= lt!453671 (lemmaContainsTupThenGetReturnValue!277 lt!453670 (_1!7787 (ite (or c!104186 c!104188) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (_2!7787 (ite (or c!104186 c!104188) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(declare-fun insertStrictlySorted!370 (List!21802 (_ BitVec 64) V!37275) List!21802)

(assert (=> d!123479 (= lt!453670 (insertStrictlySorted!370 (toList!6858 (ite c!104186 call!43427 (ite c!104188 call!43428 call!43424))) (_1!7787 (ite (or c!104186 c!104188) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (_2!7787 (ite (or c!104186 c!104188) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(assert (=> d!123479 (= (+!3121 (ite c!104186 call!43427 (ite c!104188 call!43428 call!43424)) (ite (or c!104186 c!104188) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) lt!453672)))

(declare-fun b!1029951 () Bool)

(declare-fun res!688746 () Bool)

(assert (=> b!1029951 (=> (not res!688746) (not e!581500))))

(assert (=> b!1029951 (= res!688746 (= (getValueByKey!581 (toList!6858 lt!453672) (_1!7787 (ite (or c!104186 c!104188) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))) (Some!631 (_2!7787 (ite (or c!104186 c!104188) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))))

(declare-fun b!1029952 () Bool)

(declare-fun contains!5994 (List!21802 tuple2!15552) Bool)

(assert (=> b!1029952 (= e!581500 (contains!5994 (toList!6858 lt!453672) (ite (or c!104186 c!104188) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(assert (= (and d!123479 res!688745) b!1029951))

(assert (= (and b!1029951 res!688746) b!1029952))

(declare-fun m!949151 () Bool)

(assert (=> d!123479 m!949151))

(declare-fun m!949153 () Bool)

(assert (=> d!123479 m!949153))

(declare-fun m!949155 () Bool)

(assert (=> d!123479 m!949155))

(declare-fun m!949157 () Bool)

(assert (=> d!123479 m!949157))

(declare-fun m!949159 () Bool)

(assert (=> b!1029951 m!949159))

(declare-fun m!949161 () Bool)

(assert (=> b!1029952 m!949161))

(assert (=> bm!43422 d!123479))

(declare-fun d!123481 () Bool)

(declare-fun lt!453675 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!512 (List!21803) (InoxSet (_ BitVec 64)))

(assert (=> d!123481 (= lt!453675 (select (content!512 Nil!21800) (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(declare-fun e!581506 () Bool)

(assert (=> d!123481 (= lt!453675 e!581506)))

(declare-fun res!688751 () Bool)

(assert (=> d!123481 (=> (not res!688751) (not e!581506))))

(assert (=> d!123481 (= res!688751 ((_ is Cons!21799) Nil!21800))))

(assert (=> d!123481 (= (contains!5993 Nil!21800 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)) lt!453675)))

(declare-fun b!1029957 () Bool)

(declare-fun e!581505 () Bool)

(assert (=> b!1029957 (= e!581506 e!581505)))

(declare-fun res!688752 () Bool)

(assert (=> b!1029957 (=> res!688752 e!581505)))

(assert (=> b!1029957 (= res!688752 (= (h!23007 Nil!21800) (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(declare-fun b!1029958 () Bool)

(assert (=> b!1029958 (= e!581505 (contains!5993 (t!30871 Nil!21800) (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(assert (= (and d!123481 res!688751) b!1029957))

(assert (= (and b!1029957 (not res!688752)) b!1029958))

(declare-fun m!949163 () Bool)

(assert (=> d!123481 m!949163))

(assert (=> d!123481 m!948913))

(declare-fun m!949165 () Bool)

(assert (=> d!123481 m!949165))

(assert (=> b!1029958 m!948913))

(declare-fun m!949167 () Bool)

(assert (=> b!1029958 m!949167))

(assert (=> b!1029830 d!123481))

(declare-fun d!123483 () Bool)

(assert (=> d!123483 (= (validKeyInArray!0 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029800 d!123483))

(assert (=> d!123429 d!123447))

(declare-fun d!123485 () Bool)

(assert (=> d!123485 (= (apply!910 lt!453596 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16377 (getValueByKey!581 (toList!6858 lt!453596) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30047 () Bool)

(assert (= bs!30047 d!123485))

(declare-fun m!949169 () Bool)

(assert (=> bs!30047 m!949169))

(assert (=> bs!30047 m!949169))

(declare-fun m!949171 () Bool)

(assert (=> bs!30047 m!949171))

(assert (=> b!1029814 d!123485))

(declare-fun d!123487 () Bool)

(declare-fun res!688753 () Bool)

(declare-fun e!581507 () Bool)

(assert (=> d!123487 (=> res!688753 e!581507)))

(assert (=> d!123487 (= res!688753 (= (select (arr!31153 lt!453437) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!123487 (= (arrayContainsKey!0 lt!453437 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!581507)))

(declare-fun b!1029959 () Bool)

(declare-fun e!581508 () Bool)

(assert (=> b!1029959 (= e!581507 e!581508)))

(declare-fun res!688754 () Bool)

(assert (=> b!1029959 (=> (not res!688754) (not e!581508))))

(assert (=> b!1029959 (= res!688754 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31668 lt!453437)))))

(declare-fun b!1029960 () Bool)

(assert (=> b!1029960 (= e!581508 (arrayContainsKey!0 lt!453437 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!123487 (not res!688753)) b!1029959))

(assert (= (and b!1029959 res!688754) b!1029960))

(assert (=> d!123487 m!949115))

(declare-fun m!949173 () Bool)

(assert (=> b!1029960 m!949173))

(assert (=> b!1029714 d!123487))

(declare-fun d!123489 () Bool)

(declare-fun e!581510 () Bool)

(assert (=> d!123489 e!581510))

(declare-fun res!688755 () Bool)

(assert (=> d!123489 (=> res!688755 e!581510)))

(declare-fun lt!453677 () Bool)

(assert (=> d!123489 (= res!688755 (not lt!453677))))

(declare-fun lt!453678 () Bool)

(assert (=> d!123489 (= lt!453677 lt!453678)))

(declare-fun lt!453679 () Unit!33586)

(declare-fun e!581509 () Unit!33586)

(assert (=> d!123489 (= lt!453679 e!581509)))

(declare-fun c!104233 () Bool)

(assert (=> d!123489 (= c!104233 lt!453678)))

(assert (=> d!123489 (= lt!453678 (containsKey!562 (toList!6858 lt!453574) (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(assert (=> d!123489 (= (contains!5992 lt!453574 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)) lt!453677)))

(declare-fun b!1029961 () Bool)

(declare-fun lt!453676 () Unit!33586)

(assert (=> b!1029961 (= e!581509 lt!453676)))

(assert (=> b!1029961 (= lt!453676 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6858 lt!453574) (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(assert (=> b!1029961 (isDefined!431 (getValueByKey!581 (toList!6858 lt!453574) (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(declare-fun b!1029962 () Bool)

(declare-fun Unit!33597 () Unit!33586)

(assert (=> b!1029962 (= e!581509 Unit!33597)))

(declare-fun b!1029963 () Bool)

(assert (=> b!1029963 (= e!581510 (isDefined!431 (getValueByKey!581 (toList!6858 lt!453574) (select (arr!31153 lt!453437) #b00000000000000000000000000000000))))))

(assert (= (and d!123489 c!104233) b!1029961))

(assert (= (and d!123489 (not c!104233)) b!1029962))

(assert (= (and d!123489 (not res!688755)) b!1029963))

(assert (=> d!123489 m!948913))

(declare-fun m!949175 () Bool)

(assert (=> d!123489 m!949175))

(assert (=> b!1029961 m!948913))

(declare-fun m!949177 () Bool)

(assert (=> b!1029961 m!949177))

(assert (=> b!1029961 m!948913))

(assert (=> b!1029961 m!949091))

(assert (=> b!1029961 m!949091))

(declare-fun m!949179 () Bool)

(assert (=> b!1029961 m!949179))

(assert (=> b!1029963 m!948913))

(assert (=> b!1029963 m!949091))

(assert (=> b!1029963 m!949091))

(assert (=> b!1029963 m!949179))

(assert (=> b!1029785 d!123489))

(assert (=> b!1029835 d!123419))

(assert (=> b!1029835 d!123429))

(declare-fun bm!43444 () Bool)

(declare-fun call!43453 () ListLongMap!13685)

(declare-fun call!43452 () ListLongMap!13685)

(assert (=> bm!43444 (= call!43453 call!43452)))

(declare-fun call!43450 () ListLongMap!13685)

(declare-fun c!104234 () Bool)

(declare-fun c!104236 () Bool)

(declare-fun call!43447 () ListLongMap!13685)

(declare-fun bm!43445 () Bool)

(declare-fun call!43451 () ListLongMap!13685)

(assert (=> bm!43445 (= call!43452 (+!3121 (ite c!104234 call!43450 (ite c!104236 call!43451 call!43447)) (ite (or c!104234 c!104236) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(declare-fun b!1029964 () Bool)

(declare-fun res!688764 () Bool)

(declare-fun e!581519 () Bool)

(assert (=> b!1029964 (=> (not res!688764) (not e!581519))))

(declare-fun e!581520 () Bool)

(assert (=> b!1029964 (= res!688764 e!581520)))

(declare-fun c!104239 () Bool)

(assert (=> b!1029964 (= c!104239 (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1029965 () Bool)

(declare-fun e!581514 () Bool)

(assert (=> b!1029965 (= e!581514 (validKeyInArray!0 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029966 () Bool)

(declare-fun e!581513 () ListLongMap!13685)

(assert (=> b!1029966 (= e!581513 call!43447)))

(declare-fun b!1029967 () Bool)

(declare-fun e!581511 () Bool)

(assert (=> b!1029967 (= e!581511 (validKeyInArray!0 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029968 () Bool)

(declare-fun e!581515 () Unit!33586)

(declare-fun Unit!33598 () Unit!33586)

(assert (=> b!1029968 (= e!581515 Unit!33598)))

(declare-fun lt!453689 () ListLongMap!13685)

(declare-fun b!1029969 () Bool)

(declare-fun e!581512 () Bool)

(assert (=> b!1029969 (= e!581512 (= (apply!910 lt!453689 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000)) (get!16376 (select (arr!31154 (array!64708 (store (arr!31154 (_values!6125 thiss!1427)) (index!40904 lt!453434) (ValueCellFull!11447 (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31669 (_values!6125 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029969 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31669 (array!64708 (store (arr!31154 (_values!6125 thiss!1427)) (index!40904 lt!453434) (ValueCellFull!11447 (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31669 (_values!6125 thiss!1427))))))))

(assert (=> b!1029969 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31668 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))))))))

(declare-fun b!1029971 () Bool)

(assert (=> b!1029971 (= e!581513 call!43453)))

(declare-fun bm!43446 () Bool)

(declare-fun call!43448 () Bool)

(assert (=> bm!43446 (= call!43448 (contains!5992 lt!453689 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029972 () Bool)

(declare-fun e!581523 () Bool)

(declare-fun e!581521 () Bool)

(assert (=> b!1029972 (= e!581523 e!581521)))

(declare-fun res!688761 () Bool)

(assert (=> b!1029972 (= res!688761 call!43448)))

(assert (=> b!1029972 (=> (not res!688761) (not e!581521))))

(declare-fun bm!43447 () Bool)

(assert (=> bm!43447 (= call!43450 (getCurrentListMapNoExtraKeys!3561 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) (array!64708 (store (arr!31154 (_values!6125 thiss!1427)) (index!40904 lt!453434) (ValueCellFull!11447 (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31669 (_values!6125 thiss!1427))) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun b!1029973 () Bool)

(declare-fun e!581516 () Bool)

(assert (=> b!1029973 (= e!581516 e!581512)))

(declare-fun res!688763 () Bool)

(assert (=> b!1029973 (=> (not res!688763) (not e!581512))))

(assert (=> b!1029973 (= res!688763 (contains!5992 lt!453689 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> b!1029973 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31668 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))))))))

(declare-fun bm!43448 () Bool)

(assert (=> bm!43448 (= call!43451 call!43450)))

(declare-fun b!1029974 () Bool)

(declare-fun e!581517 () Bool)

(assert (=> b!1029974 (= e!581520 e!581517)))

(declare-fun res!688757 () Bool)

(declare-fun call!43449 () Bool)

(assert (=> b!1029974 (= res!688757 call!43449)))

(assert (=> b!1029974 (=> (not res!688757) (not e!581517))))

(declare-fun b!1029975 () Bool)

(declare-fun lt!453691 () Unit!33586)

(assert (=> b!1029975 (= e!581515 lt!453691)))

(declare-fun lt!453680 () ListLongMap!13685)

(assert (=> b!1029975 (= lt!453680 (getCurrentListMapNoExtraKeys!3561 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) (array!64708 (store (arr!31154 (_values!6125 thiss!1427)) (index!40904 lt!453434) (ValueCellFull!11447 (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31669 (_values!6125 thiss!1427))) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453696 () (_ BitVec 64))

(assert (=> b!1029975 (= lt!453696 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453685 () (_ BitVec 64))

(assert (=> b!1029975 (= lt!453685 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453698 () Unit!33586)

(assert (=> b!1029975 (= lt!453698 (addStillContains!620 lt!453680 lt!453696 (zeroValue!5938 thiss!1427) lt!453685))))

(assert (=> b!1029975 (contains!5992 (+!3121 lt!453680 (tuple2!15553 lt!453696 (zeroValue!5938 thiss!1427))) lt!453685)))

(declare-fun lt!453699 () Unit!33586)

(assert (=> b!1029975 (= lt!453699 lt!453698)))

(declare-fun lt!453688 () ListLongMap!13685)

(assert (=> b!1029975 (= lt!453688 (getCurrentListMapNoExtraKeys!3561 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) (array!64708 (store (arr!31154 (_values!6125 thiss!1427)) (index!40904 lt!453434) (ValueCellFull!11447 (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31669 (_values!6125 thiss!1427))) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453681 () (_ BitVec 64))

(assert (=> b!1029975 (= lt!453681 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453692 () (_ BitVec 64))

(assert (=> b!1029975 (= lt!453692 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453686 () Unit!33586)

(assert (=> b!1029975 (= lt!453686 (addApplyDifferent!476 lt!453688 lt!453681 (minValue!5938 thiss!1427) lt!453692))))

(assert (=> b!1029975 (= (apply!910 (+!3121 lt!453688 (tuple2!15553 lt!453681 (minValue!5938 thiss!1427))) lt!453692) (apply!910 lt!453688 lt!453692))))

(declare-fun lt!453690 () Unit!33586)

(assert (=> b!1029975 (= lt!453690 lt!453686)))

(declare-fun lt!453687 () ListLongMap!13685)

(assert (=> b!1029975 (= lt!453687 (getCurrentListMapNoExtraKeys!3561 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) (array!64708 (store (arr!31154 (_values!6125 thiss!1427)) (index!40904 lt!453434) (ValueCellFull!11447 (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31669 (_values!6125 thiss!1427))) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453694 () (_ BitVec 64))

(assert (=> b!1029975 (= lt!453694 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453695 () (_ BitVec 64))

(assert (=> b!1029975 (= lt!453695 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453682 () Unit!33586)

(assert (=> b!1029975 (= lt!453682 (addApplyDifferent!476 lt!453687 lt!453694 (zeroValue!5938 thiss!1427) lt!453695))))

(assert (=> b!1029975 (= (apply!910 (+!3121 lt!453687 (tuple2!15553 lt!453694 (zeroValue!5938 thiss!1427))) lt!453695) (apply!910 lt!453687 lt!453695))))

(declare-fun lt!453693 () Unit!33586)

(assert (=> b!1029975 (= lt!453693 lt!453682)))

(declare-fun lt!453701 () ListLongMap!13685)

(assert (=> b!1029975 (= lt!453701 (getCurrentListMapNoExtraKeys!3561 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) (array!64708 (store (arr!31154 (_values!6125 thiss!1427)) (index!40904 lt!453434) (ValueCellFull!11447 (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31669 (_values!6125 thiss!1427))) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453683 () (_ BitVec 64))

(assert (=> b!1029975 (= lt!453683 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453684 () (_ BitVec 64))

(assert (=> b!1029975 (= lt!453684 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000))))

(assert (=> b!1029975 (= lt!453691 (addApplyDifferent!476 lt!453701 lt!453683 (minValue!5938 thiss!1427) lt!453684))))

(assert (=> b!1029975 (= (apply!910 (+!3121 lt!453701 (tuple2!15553 lt!453683 (minValue!5938 thiss!1427))) lt!453684) (apply!910 lt!453701 lt!453684))))

(declare-fun b!1029976 () Bool)

(assert (=> b!1029976 (= e!581519 e!581523)))

(declare-fun c!104235 () Bool)

(assert (=> b!1029976 (= c!104235 (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43449 () Bool)

(assert (=> bm!43449 (= call!43449 (contains!5992 lt!453689 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029977 () Bool)

(declare-fun res!688762 () Bool)

(assert (=> b!1029977 (=> (not res!688762) (not e!581519))))

(assert (=> b!1029977 (= res!688762 e!581516)))

(declare-fun res!688756 () Bool)

(assert (=> b!1029977 (=> res!688756 e!581516)))

(assert (=> b!1029977 (= res!688756 (not e!581514))))

(declare-fun res!688758 () Bool)

(assert (=> b!1029977 (=> (not res!688758) (not e!581514))))

(assert (=> b!1029977 (= res!688758 (bvslt #b00000000000000000000000000000000 (size!31668 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))))))))

(declare-fun b!1029978 () Bool)

(assert (=> b!1029978 (= e!581520 (not call!43449))))

(declare-fun b!1029979 () Bool)

(assert (=> b!1029979 (= e!581523 (not call!43448))))

(declare-fun d!123491 () Bool)

(assert (=> d!123491 e!581519))

(declare-fun res!688760 () Bool)

(assert (=> d!123491 (=> (not res!688760) (not e!581519))))

(assert (=> d!123491 (= res!688760 (or (bvsge #b00000000000000000000000000000000 (size!31668 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31668 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))))))))))

(declare-fun lt!453697 () ListLongMap!13685)

(assert (=> d!123491 (= lt!453689 lt!453697)))

(declare-fun lt!453700 () Unit!33586)

(assert (=> d!123491 (= lt!453700 e!581515)))

(declare-fun c!104237 () Bool)

(assert (=> d!123491 (= c!104237 e!581511)))

(declare-fun res!688759 () Bool)

(assert (=> d!123491 (=> (not res!688759) (not e!581511))))

(assert (=> d!123491 (= res!688759 (bvslt #b00000000000000000000000000000000 (size!31668 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))))))))

(declare-fun e!581518 () ListLongMap!13685)

(assert (=> d!123491 (= lt!453697 e!581518)))

(assert (=> d!123491 (= c!104234 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123491 (validMask!0 (mask!29897 thiss!1427))))

(assert (=> d!123491 (= (getCurrentListMap!3904 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) (array!64708 (store (arr!31154 (_values!6125 thiss!1427)) (index!40904 lt!453434) (ValueCellFull!11447 (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31669 (_values!6125 thiss!1427))) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) lt!453689)))

(declare-fun b!1029970 () Bool)

(assert (=> b!1029970 (= e!581518 (+!3121 call!43452 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))

(declare-fun b!1029980 () Bool)

(declare-fun e!581522 () ListLongMap!13685)

(assert (=> b!1029980 (= e!581522 call!43453)))

(declare-fun b!1029981 () Bool)

(assert (=> b!1029981 (= e!581521 (= (apply!910 lt!453689 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5938 thiss!1427)))))

(declare-fun b!1029982 () Bool)

(assert (=> b!1029982 (= e!581518 e!581522)))

(assert (=> b!1029982 (= c!104236 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029983 () Bool)

(assert (=> b!1029983 (= e!581517 (= (apply!910 lt!453689 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5938 thiss!1427)))))

(declare-fun bm!43450 () Bool)

(assert (=> bm!43450 (= call!43447 call!43451)))

(declare-fun b!1029984 () Bool)

(declare-fun c!104238 () Bool)

(assert (=> b!1029984 (= c!104238 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1029984 (= e!581522 e!581513)))

(assert (= (and d!123491 c!104234) b!1029970))

(assert (= (and d!123491 (not c!104234)) b!1029982))

(assert (= (and b!1029982 c!104236) b!1029980))

(assert (= (and b!1029982 (not c!104236)) b!1029984))

(assert (= (and b!1029984 c!104238) b!1029971))

(assert (= (and b!1029984 (not c!104238)) b!1029966))

(assert (= (or b!1029971 b!1029966) bm!43450))

(assert (= (or b!1029980 bm!43450) bm!43448))

(assert (= (or b!1029980 b!1029971) bm!43444))

(assert (= (or b!1029970 bm!43448) bm!43447))

(assert (= (or b!1029970 bm!43444) bm!43445))

(assert (= (and d!123491 res!688759) b!1029967))

(assert (= (and d!123491 c!104237) b!1029975))

(assert (= (and d!123491 (not c!104237)) b!1029968))

(assert (= (and d!123491 res!688760) b!1029977))

(assert (= (and b!1029977 res!688758) b!1029965))

(assert (= (and b!1029977 (not res!688756)) b!1029973))

(assert (= (and b!1029973 res!688763) b!1029969))

(assert (= (and b!1029977 res!688762) b!1029964))

(assert (= (and b!1029964 c!104239) b!1029974))

(assert (= (and b!1029964 (not c!104239)) b!1029978))

(assert (= (and b!1029974 res!688757) b!1029983))

(assert (= (or b!1029974 b!1029978) bm!43449))

(assert (= (and b!1029964 res!688764) b!1029976))

(assert (= (and b!1029976 c!104235) b!1029972))

(assert (= (and b!1029976 (not c!104235)) b!1029979))

(assert (= (and b!1029972 res!688761) b!1029981))

(assert (= (or b!1029972 b!1029979) bm!43446))

(declare-fun b_lambda!15815 () Bool)

(assert (=> (not b_lambda!15815) (not b!1029969)))

(assert (=> b!1029969 t!30869))

(declare-fun b_and!32893 () Bool)

(assert (= b_and!32891 (and (=> t!30869 result!14109) b_and!32893)))

(declare-fun m!949181 () Bool)

(assert (=> b!1029970 m!949181))

(declare-fun m!949183 () Bool)

(assert (=> bm!43447 m!949183))

(declare-fun m!949185 () Bool)

(assert (=> b!1029975 m!949185))

(declare-fun m!949187 () Bool)

(assert (=> b!1029975 m!949187))

(assert (=> b!1029975 m!949187))

(declare-fun m!949189 () Bool)

(assert (=> b!1029975 m!949189))

(declare-fun m!949191 () Bool)

(assert (=> b!1029975 m!949191))

(declare-fun m!949193 () Bool)

(assert (=> b!1029975 m!949193))

(declare-fun m!949195 () Bool)

(assert (=> b!1029975 m!949195))

(declare-fun m!949197 () Bool)

(assert (=> b!1029975 m!949197))

(declare-fun m!949199 () Bool)

(assert (=> b!1029975 m!949199))

(declare-fun m!949201 () Bool)

(assert (=> b!1029975 m!949201))

(declare-fun m!949203 () Bool)

(assert (=> b!1029975 m!949203))

(assert (=> b!1029975 m!949197))

(assert (=> b!1029975 m!949185))

(declare-fun m!949205 () Bool)

(assert (=> b!1029975 m!949205))

(assert (=> b!1029975 m!949201))

(declare-fun m!949207 () Bool)

(assert (=> b!1029975 m!949207))

(declare-fun m!949209 () Bool)

(assert (=> b!1029975 m!949209))

(declare-fun m!949211 () Bool)

(assert (=> b!1029975 m!949211))

(assert (=> b!1029975 m!949183))

(declare-fun m!949213 () Bool)

(assert (=> b!1029975 m!949213))

(declare-fun m!949215 () Bool)

(assert (=> b!1029975 m!949215))

(assert (=> d!123491 m!948905))

(declare-fun m!949217 () Bool)

(assert (=> bm!43449 m!949217))

(declare-fun m!949219 () Bool)

(assert (=> bm!43445 m!949219))

(declare-fun m!949221 () Bool)

(assert (=> b!1029981 m!949221))

(declare-fun m!949223 () Bool)

(assert (=> b!1029983 m!949223))

(assert (=> b!1029967 m!949195))

(assert (=> b!1029967 m!949195))

(declare-fun m!949225 () Bool)

(assert (=> b!1029967 m!949225))

(declare-fun m!949227 () Bool)

(assert (=> bm!43446 m!949227))

(declare-fun m!949229 () Bool)

(assert (=> b!1029969 m!949229))

(assert (=> b!1029969 m!949229))

(assert (=> b!1029969 m!948797))

(declare-fun m!949231 () Bool)

(assert (=> b!1029969 m!949231))

(assert (=> b!1029969 m!949195))

(declare-fun m!949233 () Bool)

(assert (=> b!1029969 m!949233))

(assert (=> b!1029969 m!949195))

(assert (=> b!1029969 m!948797))

(assert (=> b!1029973 m!949195))

(assert (=> b!1029973 m!949195))

(declare-fun m!949235 () Bool)

(assert (=> b!1029973 m!949235))

(assert (=> b!1029965 m!949195))

(assert (=> b!1029965 m!949195))

(assert (=> b!1029965 m!949225))

(assert (=> b!1029835 d!123491))

(declare-fun b!1029985 () Bool)

(declare-fun e!581525 () (_ BitVec 32))

(declare-fun call!43454 () (_ BitVec 32))

(assert (=> b!1029985 (= e!581525 call!43454)))

(declare-fun d!123493 () Bool)

(declare-fun lt!453702 () (_ BitVec 32))

(assert (=> d!123493 (and (bvsge lt!453702 #b00000000000000000000000000000000) (bvsle lt!453702 (bvsub (size!31668 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun e!581524 () (_ BitVec 32))

(assert (=> d!123493 (= lt!453702 e!581524)))

(declare-fun c!104241 () Bool)

(assert (=> d!123493 (= c!104241 (bvsge #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))))))

(assert (=> d!123493 (and (bvsle #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31668 (_keys!11294 thiss!1427)) (size!31668 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))))))))

(assert (=> d!123493 (= (arrayCountValidKeys!0 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))) lt!453702)))

(declare-fun bm!43451 () Bool)

(assert (=> bm!43451 (= call!43454 (arrayCountValidKeys!0 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun b!1029986 () Bool)

(assert (=> b!1029986 (= e!581524 e!581525)))

(declare-fun c!104240 () Bool)

(assert (=> b!1029986 (= c!104240 (validKeyInArray!0 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029987 () Bool)

(assert (=> b!1029987 (= e!581524 #b00000000000000000000000000000000)))

(declare-fun b!1029988 () Bool)

(assert (=> b!1029988 (= e!581525 (bvadd #b00000000000000000000000000000001 call!43454))))

(assert (= (and d!123493 c!104241) b!1029987))

(assert (= (and d!123493 (not c!104241)) b!1029986))

(assert (= (and b!1029986 c!104240) b!1029988))

(assert (= (and b!1029986 (not c!104240)) b!1029985))

(assert (= (or b!1029988 b!1029985) bm!43451))

(declare-fun m!949237 () Bool)

(assert (=> bm!43451 m!949237))

(assert (=> b!1029986 m!949195))

(assert (=> b!1029986 m!949195))

(assert (=> b!1029986 m!949225))

(assert (=> b!1029726 d!123493))

(assert (=> b!1029726 d!123423))

(assert (=> b!1029857 d!123423))

(declare-fun b!1030013 () Bool)

(declare-fun e!581544 () Bool)

(declare-fun lt!453717 () ListLongMap!13685)

(assert (=> b!1030013 (= e!581544 (= lt!453717 (getCurrentListMapNoExtraKeys!3561 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6102 thiss!1427))))))

(declare-fun b!1030014 () Bool)

(declare-fun res!688776 () Bool)

(declare-fun e!581545 () Bool)

(assert (=> b!1030014 (=> (not res!688776) (not e!581545))))

(assert (=> b!1030014 (= res!688776 (not (contains!5992 lt!453717 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030015 () Bool)

(declare-fun e!581540 () Bool)

(assert (=> b!1030015 (= e!581545 e!581540)))

(declare-fun c!104250 () Bool)

(declare-fun e!581542 () Bool)

(assert (=> b!1030015 (= c!104250 e!581542)))

(declare-fun res!688773 () Bool)

(assert (=> b!1030015 (=> (not res!688773) (not e!581542))))

(assert (=> b!1030015 (= res!688773 (bvslt #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun b!1030016 () Bool)

(assert (=> b!1030016 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))))))

(assert (=> b!1030016 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31669 (_values!6125 thiss!1427))))))

(declare-fun e!581541 () Bool)

(assert (=> b!1030016 (= e!581541 (= (apply!910 lt!453717 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)) (get!16376 (select (arr!31154 (_values!6125 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1030017 () Bool)

(declare-fun e!581543 () ListLongMap!13685)

(assert (=> b!1030017 (= e!581543 (ListLongMap!13686 Nil!21799))))

(declare-fun b!1030018 () Bool)

(assert (=> b!1030018 (= e!581542 (validKeyInArray!0 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1030018 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1030020 () Bool)

(assert (=> b!1030020 (= e!581540 e!581544)))

(declare-fun c!104253 () Bool)

(assert (=> b!1030020 (= c!104253 (bvslt #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun b!1030021 () Bool)

(declare-fun e!581546 () ListLongMap!13685)

(declare-fun call!43457 () ListLongMap!13685)

(assert (=> b!1030021 (= e!581546 call!43457)))

(declare-fun b!1030022 () Bool)

(assert (=> b!1030022 (= e!581543 e!581546)))

(declare-fun c!104252 () Bool)

(assert (=> b!1030022 (= c!104252 (validKeyInArray!0 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030023 () Bool)

(declare-fun isEmpty!927 (ListLongMap!13685) Bool)

(assert (=> b!1030023 (= e!581544 (isEmpty!927 lt!453717))))

(declare-fun d!123495 () Bool)

(assert (=> d!123495 e!581545))

(declare-fun res!688774 () Bool)

(assert (=> d!123495 (=> (not res!688774) (not e!581545))))

(assert (=> d!123495 (= res!688774 (not (contains!5992 lt!453717 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123495 (= lt!453717 e!581543)))

(declare-fun c!104251 () Bool)

(assert (=> d!123495 (= c!104251 (bvsge #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))))))

(assert (=> d!123495 (validMask!0 (mask!29897 thiss!1427))))

(assert (=> d!123495 (= (getCurrentListMapNoExtraKeys!3561 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) lt!453717)))

(declare-fun b!1030019 () Bool)

(assert (=> b!1030019 (= e!581540 e!581541)))

(assert (=> b!1030019 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun res!688775 () Bool)

(assert (=> b!1030019 (= res!688775 (contains!5992 lt!453717 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1030019 (=> (not res!688775) (not e!581541))))

(declare-fun bm!43454 () Bool)

(assert (=> bm!43454 (= call!43457 (getCurrentListMapNoExtraKeys!3561 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6102 thiss!1427)))))

(declare-fun b!1030024 () Bool)

(declare-fun lt!453720 () Unit!33586)

(declare-fun lt!453723 () Unit!33586)

(assert (=> b!1030024 (= lt!453720 lt!453723)))

(declare-fun lt!453721 () (_ BitVec 64))

(declare-fun lt!453719 () (_ BitVec 64))

(declare-fun lt!453722 () ListLongMap!13685)

(declare-fun lt!453718 () V!37275)

(assert (=> b!1030024 (not (contains!5992 (+!3121 lt!453722 (tuple2!15553 lt!453721 lt!453718)) lt!453719))))

(declare-fun addStillNotContains!241 (ListLongMap!13685 (_ BitVec 64) V!37275 (_ BitVec 64)) Unit!33586)

(assert (=> b!1030024 (= lt!453723 (addStillNotContains!241 lt!453722 lt!453721 lt!453718 lt!453719))))

(assert (=> b!1030024 (= lt!453719 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1030024 (= lt!453718 (get!16376 (select (arr!31154 (_values!6125 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1030024 (= lt!453721 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1030024 (= lt!453722 call!43457)))

(assert (=> b!1030024 (= e!581546 (+!3121 call!43457 (tuple2!15553 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000) (get!16376 (select (arr!31154 (_values!6125 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!123495 c!104251) b!1030017))

(assert (= (and d!123495 (not c!104251)) b!1030022))

(assert (= (and b!1030022 c!104252) b!1030024))

(assert (= (and b!1030022 (not c!104252)) b!1030021))

(assert (= (or b!1030024 b!1030021) bm!43454))

(assert (= (and d!123495 res!688774) b!1030014))

(assert (= (and b!1030014 res!688776) b!1030015))

(assert (= (and b!1030015 res!688773) b!1030018))

(assert (= (and b!1030015 c!104250) b!1030019))

(assert (= (and b!1030015 (not c!104250)) b!1030020))

(assert (= (and b!1030019 res!688775) b!1030016))

(assert (= (and b!1030020 c!104253) b!1030013))

(assert (= (and b!1030020 (not c!104253)) b!1030023))

(declare-fun b_lambda!15817 () Bool)

(assert (=> (not b_lambda!15817) (not b!1030016)))

(assert (=> b!1030016 t!30869))

(declare-fun b_and!32895 () Bool)

(assert (= b_and!32893 (and (=> t!30869 result!14109) b_and!32895)))

(declare-fun b_lambda!15819 () Bool)

(assert (=> (not b_lambda!15819) (not b!1030024)))

(assert (=> b!1030024 t!30869))

(declare-fun b_and!32897 () Bool)

(assert (= b_and!32895 (and (=> t!30869 result!14109) b_and!32897)))

(declare-fun m!949239 () Bool)

(assert (=> b!1030023 m!949239))

(declare-fun m!949241 () Bool)

(assert (=> bm!43454 m!949241))

(declare-fun m!949243 () Bool)

(assert (=> d!123495 m!949243))

(assert (=> d!123495 m!948905))

(assert (=> b!1030022 m!948935))

(assert (=> b!1030022 m!948935))

(assert (=> b!1030022 m!948937))

(assert (=> b!1030016 m!949039))

(assert (=> b!1030016 m!948797))

(assert (=> b!1030016 m!948935))

(declare-fun m!949245 () Bool)

(assert (=> b!1030016 m!949245))

(assert (=> b!1030016 m!949039))

(assert (=> b!1030016 m!948797))

(assert (=> b!1030016 m!949041))

(assert (=> b!1030016 m!948935))

(assert (=> b!1030018 m!948935))

(assert (=> b!1030018 m!948935))

(assert (=> b!1030018 m!948937))

(assert (=> b!1030019 m!948935))

(assert (=> b!1030019 m!948935))

(declare-fun m!949247 () Bool)

(assert (=> b!1030019 m!949247))

(declare-fun m!949249 () Bool)

(assert (=> b!1030014 m!949249))

(assert (=> b!1030013 m!949241))

(declare-fun m!949251 () Bool)

(assert (=> b!1030024 m!949251))

(assert (=> b!1030024 m!948797))

(declare-fun m!949253 () Bool)

(assert (=> b!1030024 m!949253))

(assert (=> b!1030024 m!949039))

(assert (=> b!1030024 m!948797))

(assert (=> b!1030024 m!949041))

(assert (=> b!1030024 m!949253))

(declare-fun m!949255 () Bool)

(assert (=> b!1030024 m!949255))

(assert (=> b!1030024 m!948935))

(declare-fun m!949257 () Bool)

(assert (=> b!1030024 m!949257))

(assert (=> b!1030024 m!949039))

(assert (=> bm!43431 d!123495))

(declare-fun b!1030025 () Bool)

(declare-fun e!581550 () Bool)

(declare-fun call!43458 () Bool)

(assert (=> b!1030025 (= e!581550 call!43458)))

(declare-fun bm!43455 () Bool)

(declare-fun c!104254 () Bool)

(assert (=> bm!43455 (= call!43458 (arrayNoDuplicates!0 (_keys!11294 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104254 (Cons!21799 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000) Nil!21800) Nil!21800)))))

(declare-fun b!1030026 () Bool)

(assert (=> b!1030026 (= e!581550 call!43458)))

(declare-fun b!1030027 () Bool)

(declare-fun e!581548 () Bool)

(assert (=> b!1030027 (= e!581548 (contains!5993 Nil!21800 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030028 () Bool)

(declare-fun e!581547 () Bool)

(declare-fun e!581549 () Bool)

(assert (=> b!1030028 (= e!581547 e!581549)))

(declare-fun res!688779 () Bool)

(assert (=> b!1030028 (=> (not res!688779) (not e!581549))))

(assert (=> b!1030028 (= res!688779 (not e!581548))))

(declare-fun res!688777 () Bool)

(assert (=> b!1030028 (=> (not res!688777) (not e!581548))))

(assert (=> b!1030028 (= res!688777 (validKeyInArray!0 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030029 () Bool)

(assert (=> b!1030029 (= e!581549 e!581550)))

(assert (=> b!1030029 (= c!104254 (validKeyInArray!0 (select (arr!31153 (_keys!11294 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123497 () Bool)

(declare-fun res!688778 () Bool)

(assert (=> d!123497 (=> res!688778 e!581547)))

(assert (=> d!123497 (= res!688778 (bvsge #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))))))

(assert (=> d!123497 (= (arrayNoDuplicates!0 (_keys!11294 thiss!1427) #b00000000000000000000000000000000 Nil!21800) e!581547)))

(assert (= (and d!123497 (not res!688778)) b!1030028))

(assert (= (and b!1030028 res!688777) b!1030027))

(assert (= (and b!1030028 res!688779) b!1030029))

(assert (= (and b!1030029 c!104254) b!1030025))

(assert (= (and b!1030029 (not c!104254)) b!1030026))

(assert (= (or b!1030025 b!1030026) bm!43455))

(assert (=> bm!43455 m!948935))

(declare-fun m!949259 () Bool)

(assert (=> bm!43455 m!949259))

(assert (=> b!1030027 m!948935))

(assert (=> b!1030027 m!948935))

(declare-fun m!949261 () Bool)

(assert (=> b!1030027 m!949261))

(assert (=> b!1030028 m!948935))

(assert (=> b!1030028 m!948935))

(assert (=> b!1030028 m!948937))

(assert (=> b!1030029 m!948935))

(assert (=> b!1030029 m!948935))

(assert (=> b!1030029 m!948937))

(assert (=> b!1029859 d!123497))

(assert (=> b!1029728 d!123483))

(declare-fun d!123499 () Bool)

(assert (=> d!123499 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1029724 d!123499))

(declare-fun d!123501 () Bool)

(declare-fun e!581552 () Bool)

(assert (=> d!123501 e!581552))

(declare-fun res!688780 () Bool)

(assert (=> d!123501 (=> res!688780 e!581552)))

(declare-fun lt!453725 () Bool)

(assert (=> d!123501 (= res!688780 (not lt!453725))))

(declare-fun lt!453726 () Bool)

(assert (=> d!123501 (= lt!453725 lt!453726)))

(declare-fun lt!453727 () Unit!33586)

(declare-fun e!581551 () Unit!33586)

(assert (=> d!123501 (= lt!453727 e!581551)))

(declare-fun c!104255 () Bool)

(assert (=> d!123501 (= c!104255 lt!453726)))

(assert (=> d!123501 (= lt!453726 (containsKey!562 (toList!6858 lt!453596) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123501 (= (contains!5992 lt!453596 #b1000000000000000000000000000000000000000000000000000000000000000) lt!453725)))

(declare-fun b!1030030 () Bool)

(declare-fun lt!453724 () Unit!33586)

(assert (=> b!1030030 (= e!581551 lt!453724)))

(assert (=> b!1030030 (= lt!453724 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6858 lt!453596) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030030 (isDefined!431 (getValueByKey!581 (toList!6858 lt!453596) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030031 () Bool)

(declare-fun Unit!33599 () Unit!33586)

(assert (=> b!1030031 (= e!581551 Unit!33599)))

(declare-fun b!1030032 () Bool)

(assert (=> b!1030032 (= e!581552 (isDefined!431 (getValueByKey!581 (toList!6858 lt!453596) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123501 c!104255) b!1030030))

(assert (= (and d!123501 (not c!104255)) b!1030031))

(assert (= (and d!123501 (not res!688780)) b!1030032))

(declare-fun m!949263 () Bool)

(assert (=> d!123501 m!949263))

(declare-fun m!949265 () Bool)

(assert (=> b!1030030 m!949265))

(assert (=> b!1030030 m!949169))

(assert (=> b!1030030 m!949169))

(declare-fun m!949267 () Bool)

(assert (=> b!1030030 m!949267))

(assert (=> b!1030032 m!949169))

(assert (=> b!1030032 m!949169))

(assert (=> b!1030032 m!949267))

(assert (=> bm!43430 d!123501))

(declare-fun d!123503 () Bool)

(assert (=> d!123503 (= (apply!910 lt!453574 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16377 (getValueByKey!581 (toList!6858 lt!453574) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30048 () Bool)

(assert (= bs!30048 d!123503))

(declare-fun m!949269 () Bool)

(assert (=> bs!30048 m!949269))

(assert (=> bs!30048 m!949269))

(declare-fun m!949271 () Bool)

(assert (=> bs!30048 m!949271))

(assert (=> b!1029795 d!123503))

(declare-fun d!123505 () Bool)

(declare-fun e!581553 () Bool)

(assert (=> d!123505 e!581553))

(declare-fun res!688781 () Bool)

(assert (=> d!123505 (=> (not res!688781) (not e!581553))))

(declare-fun lt!453731 () ListLongMap!13685)

(assert (=> d!123505 (= res!688781 (contains!5992 lt!453731 (_1!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(declare-fun lt!453729 () List!21802)

(assert (=> d!123505 (= lt!453731 (ListLongMap!13686 lt!453729))))

(declare-fun lt!453728 () Unit!33586)

(declare-fun lt!453730 () Unit!33586)

(assert (=> d!123505 (= lt!453728 lt!453730)))

(assert (=> d!123505 (= (getValueByKey!581 lt!453729 (_1!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(assert (=> d!123505 (= lt!453730 (lemmaContainsTupThenGetReturnValue!277 lt!453729 (_1!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(assert (=> d!123505 (= lt!453729 (insertStrictlySorted!370 (toList!6858 call!43436) (_1!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(assert (=> d!123505 (= (+!3121 call!43436 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))) lt!453731)))

(declare-fun b!1030033 () Bool)

(declare-fun res!688782 () Bool)

(assert (=> b!1030033 (=> (not res!688782) (not e!581553))))

(assert (=> b!1030033 (= res!688782 (= (getValueByKey!581 (toList!6858 lt!453731) (_1!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(declare-fun b!1030034 () Bool)

(assert (=> b!1030034 (= e!581553 (contains!5994 (toList!6858 lt!453731) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))

(assert (= (and d!123505 res!688781) b!1030033))

(assert (= (and b!1030033 res!688782) b!1030034))

(declare-fun m!949273 () Bool)

(assert (=> d!123505 m!949273))

(declare-fun m!949275 () Bool)

(assert (=> d!123505 m!949275))

(declare-fun m!949277 () Bool)

(assert (=> d!123505 m!949277))

(declare-fun m!949279 () Bool)

(assert (=> d!123505 m!949279))

(declare-fun m!949281 () Bool)

(assert (=> b!1030033 m!949281))

(declare-fun m!949283 () Bool)

(assert (=> b!1030034 m!949283))

(assert (=> b!1029803 d!123505))

(declare-fun d!123507 () Bool)

(assert (=> d!123507 (= (apply!910 lt!453574 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16377 (getValueByKey!581 (toList!6858 lt!453574) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30049 () Bool)

(assert (= bs!30049 d!123507))

(declare-fun m!949285 () Bool)

(assert (=> bs!30049 m!949285))

(assert (=> bs!30049 m!949285))

(declare-fun m!949287 () Bool)

(assert (=> bs!30049 m!949287))

(assert (=> b!1029793 d!123507))

(assert (=> b!1029846 d!123461))

(declare-fun d!123509 () Bool)

(assert (=> d!123509 (arrayNoDuplicates!0 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) #b00000000000000000000000000000000 Nil!21800)))

(assert (=> d!123509 true))

(declare-fun _$66!35 () Unit!33586)

(assert (=> d!123509 (= (choose!53 (_keys!11294 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40904 lt!453434) #b00000000000000000000000000000000 Nil!21800) _$66!35)))

(declare-fun bs!30050 () Bool)

(assert (= bs!30050 d!123509))

(assert (=> bs!30050 m!948771))

(assert (=> bs!30050 m!948909))

(assert (=> d!123411 d!123509))

(declare-fun b!1030035 () Bool)

(declare-fun e!581557 () Bool)

(declare-fun call!43459 () Bool)

(assert (=> b!1030035 (= e!581557 call!43459)))

(declare-fun c!104256 () Bool)

(declare-fun bm!43456 () Bool)

(assert (=> bm!43456 (= call!43459 (arrayNoDuplicates!0 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104256 (Cons!21799 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000) Nil!21800) Nil!21800)))))

(declare-fun b!1030036 () Bool)

(assert (=> b!1030036 (= e!581557 call!43459)))

(declare-fun b!1030037 () Bool)

(declare-fun e!581555 () Bool)

(assert (=> b!1030037 (= e!581555 (contains!5993 Nil!21800 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1030038 () Bool)

(declare-fun e!581554 () Bool)

(declare-fun e!581556 () Bool)

(assert (=> b!1030038 (= e!581554 e!581556)))

(declare-fun res!688785 () Bool)

(assert (=> b!1030038 (=> (not res!688785) (not e!581556))))

(assert (=> b!1030038 (= res!688785 (not e!581555))))

(declare-fun res!688783 () Bool)

(assert (=> b!1030038 (=> (not res!688783) (not e!581555))))

(assert (=> b!1030038 (= res!688783 (validKeyInArray!0 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1030039 () Bool)

(assert (=> b!1030039 (= e!581556 e!581557)))

(assert (=> b!1030039 (= c!104256 (validKeyInArray!0 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!123511 () Bool)

(declare-fun res!688784 () Bool)

(assert (=> d!123511 (=> res!688784 e!581554)))

(assert (=> d!123511 (= res!688784 (bvsge #b00000000000000000000000000000000 (size!31668 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))))))))

(assert (=> d!123511 (= (arrayNoDuplicates!0 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) #b00000000000000000000000000000000 Nil!21800) e!581554)))

(assert (= (and d!123511 (not res!688784)) b!1030038))

(assert (= (and b!1030038 res!688783) b!1030037))

(assert (= (and b!1030038 res!688785) b!1030039))

(assert (= (and b!1030039 c!104256) b!1030035))

(assert (= (and b!1030039 (not c!104256)) b!1030036))

(assert (= (or b!1030035 b!1030036) bm!43456))

(assert (=> bm!43456 m!949195))

(declare-fun m!949289 () Bool)

(assert (=> bm!43456 m!949289))

(assert (=> b!1030037 m!949195))

(assert (=> b!1030037 m!949195))

(declare-fun m!949291 () Bool)

(assert (=> b!1030037 m!949291))

(assert (=> b!1030038 m!949195))

(assert (=> b!1030038 m!949195))

(assert (=> b!1030038 m!949225))

(assert (=> b!1030039 m!949195))

(assert (=> b!1030039 m!949195))

(assert (=> b!1030039 m!949225))

(assert (=> b!1029696 d!123511))

(assert (=> b!1029831 d!123461))

(declare-fun d!123513 () Bool)

(assert (=> d!123513 (= (apply!910 lt!453596 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16377 (getValueByKey!581 (toList!6858 lt!453596) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30051 () Bool)

(assert (= bs!30051 d!123513))

(declare-fun m!949293 () Bool)

(assert (=> bs!30051 m!949293))

(assert (=> bs!30051 m!949293))

(declare-fun m!949295 () Bool)

(assert (=> bs!30051 m!949295))

(assert (=> b!1029816 d!123513))

(declare-fun d!123515 () Bool)

(declare-fun e!581559 () Bool)

(assert (=> d!123515 e!581559))

(declare-fun res!688786 () Bool)

(assert (=> d!123515 (=> res!688786 e!581559)))

(declare-fun lt!453733 () Bool)

(assert (=> d!123515 (= res!688786 (not lt!453733))))

(declare-fun lt!453734 () Bool)

(assert (=> d!123515 (= lt!453733 lt!453734)))

(declare-fun lt!453735 () Unit!33586)

(declare-fun e!581558 () Unit!33586)

(assert (=> d!123515 (= lt!453735 e!581558)))

(declare-fun c!104257 () Bool)

(assert (=> d!123515 (= c!104257 lt!453734)))

(assert (=> d!123515 (= lt!453734 (containsKey!562 (toList!6858 lt!453513) key!909))))

(assert (=> d!123515 (= (contains!5992 lt!453513 key!909) lt!453733)))

(declare-fun b!1030040 () Bool)

(declare-fun lt!453732 () Unit!33586)

(assert (=> b!1030040 (= e!581558 lt!453732)))

(assert (=> b!1030040 (= lt!453732 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6858 lt!453513) key!909))))

(assert (=> b!1030040 (isDefined!431 (getValueByKey!581 (toList!6858 lt!453513) key!909))))

(declare-fun b!1030041 () Bool)

(declare-fun Unit!33600 () Unit!33586)

(assert (=> b!1030041 (= e!581558 Unit!33600)))

(declare-fun b!1030042 () Bool)

(assert (=> b!1030042 (= e!581559 (isDefined!431 (getValueByKey!581 (toList!6858 lt!453513) key!909)))))

(assert (= (and d!123515 c!104257) b!1030040))

(assert (= (and d!123515 (not c!104257)) b!1030041))

(assert (= (and d!123515 (not res!688786)) b!1030042))

(declare-fun m!949297 () Bool)

(assert (=> d!123515 m!949297))

(declare-fun m!949299 () Bool)

(assert (=> b!1030040 m!949299))

(declare-fun m!949301 () Bool)

(assert (=> b!1030040 m!949301))

(assert (=> b!1030040 m!949301))

(declare-fun m!949303 () Bool)

(assert (=> b!1030040 m!949303))

(assert (=> b!1030042 m!949301))

(assert (=> b!1030042 m!949301))

(assert (=> b!1030042 m!949303))

(assert (=> d!123419 d!123515))

(declare-fun d!123517 () Bool)

(declare-fun e!581566 () Bool)

(assert (=> d!123517 e!581566))

(declare-fun res!688789 () Bool)

(assert (=> d!123517 (=> (not res!688789) (not e!581566))))

(declare-fun lt!453738 () List!21802)

(declare-fun isStrictlySorted!703 (List!21802) Bool)

(assert (=> d!123517 (= res!688789 (isStrictlySorted!703 lt!453738))))

(declare-fun e!581568 () List!21802)

(assert (=> d!123517 (= lt!453738 e!581568)))

(declare-fun c!104262 () Bool)

(assert (=> d!123517 (= c!104262 (and ((_ is Cons!21798) (toList!6858 (getCurrentListMap!3904 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))) (= (_1!7787 (h!23006 (toList!6858 (getCurrentListMap!3904 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427))))) key!909)))))

(assert (=> d!123517 (isStrictlySorted!703 (toList!6858 (getCurrentListMap!3904 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427))))))

(assert (=> d!123517 (= (removeStrictlySorted!50 (toList!6858 (getCurrentListMap!3904 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427))) key!909) lt!453738)))

(declare-fun b!1030053 () Bool)

(assert (=> b!1030053 (= e!581566 (not (containsKey!562 lt!453738 key!909)))))

(declare-fun b!1030054 () Bool)

(declare-fun e!581567 () List!21802)

(declare-fun $colon$colon!600 (List!21802 tuple2!15552) List!21802)

(assert (=> b!1030054 (= e!581567 ($colon$colon!600 (removeStrictlySorted!50 (t!30870 (toList!6858 (getCurrentListMap!3904 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))) key!909) (h!23006 (toList!6858 (getCurrentListMap!3904 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427))))))))

(declare-fun b!1030055 () Bool)

(assert (=> b!1030055 (= e!581568 e!581567)))

(declare-fun c!104263 () Bool)

(assert (=> b!1030055 (= c!104263 (and ((_ is Cons!21798) (toList!6858 (getCurrentListMap!3904 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))) (not (= (_1!7787 (h!23006 (toList!6858 (getCurrentListMap!3904 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427))))) key!909))))))

(declare-fun b!1030056 () Bool)

(assert (=> b!1030056 (= e!581568 (t!30870 (toList!6858 (getCurrentListMap!3904 (_keys!11294 thiss!1427) (_values!6125 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))))

(declare-fun b!1030057 () Bool)

(assert (=> b!1030057 (= e!581567 Nil!21799)))

(assert (= (and d!123517 c!104262) b!1030056))

(assert (= (and d!123517 (not c!104262)) b!1030055))

(assert (= (and b!1030055 c!104263) b!1030054))

(assert (= (and b!1030055 (not c!104263)) b!1030057))

(assert (= (and d!123517 res!688789) b!1030053))

(declare-fun m!949305 () Bool)

(assert (=> d!123517 m!949305))

(declare-fun m!949307 () Bool)

(assert (=> d!123517 m!949307))

(declare-fun m!949309 () Bool)

(assert (=> b!1030053 m!949309))

(declare-fun m!949311 () Bool)

(assert (=> b!1030054 m!949311))

(assert (=> b!1030054 m!949311))

(declare-fun m!949313 () Bool)

(assert (=> b!1030054 m!949313))

(assert (=> d!123419 d!123517))

(assert (=> b!1029706 d!123461))

(declare-fun b!1030058 () Bool)

(declare-fun e!581572 () Bool)

(declare-fun call!43460 () Bool)

(assert (=> b!1030058 (= e!581572 call!43460)))

(declare-fun c!104264 () Bool)

(declare-fun bm!43457 () Bool)

(assert (=> bm!43457 (= call!43460 (arrayNoDuplicates!0 lt!453437 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!104264 (Cons!21799 (select (arr!31153 lt!453437) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104200 (Cons!21799 (select (arr!31153 lt!453437) #b00000000000000000000000000000000) Nil!21800) Nil!21800)) (ite c!104200 (Cons!21799 (select (arr!31153 lt!453437) #b00000000000000000000000000000000) Nil!21800) Nil!21800))))))

(declare-fun b!1030059 () Bool)

(assert (=> b!1030059 (= e!581572 call!43460)))

(declare-fun b!1030060 () Bool)

(declare-fun e!581570 () Bool)

(assert (=> b!1030060 (= e!581570 (contains!5993 (ite c!104200 (Cons!21799 (select (arr!31153 lt!453437) #b00000000000000000000000000000000) Nil!21800) Nil!21800) (select (arr!31153 lt!453437) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1030061 () Bool)

(declare-fun e!581569 () Bool)

(declare-fun e!581571 () Bool)

(assert (=> b!1030061 (= e!581569 e!581571)))

(declare-fun res!688792 () Bool)

(assert (=> b!1030061 (=> (not res!688792) (not e!581571))))

(assert (=> b!1030061 (= res!688792 (not e!581570))))

(declare-fun res!688790 () Bool)

(assert (=> b!1030061 (=> (not res!688790) (not e!581570))))

(assert (=> b!1030061 (= res!688790 (validKeyInArray!0 (select (arr!31153 lt!453437) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1030062 () Bool)

(assert (=> b!1030062 (= e!581571 e!581572)))

(assert (=> b!1030062 (= c!104264 (validKeyInArray!0 (select (arr!31153 lt!453437) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!123519 () Bool)

(declare-fun res!688791 () Bool)

(assert (=> d!123519 (=> res!688791 e!581569)))

(assert (=> d!123519 (= res!688791 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31668 lt!453437)))))

(assert (=> d!123519 (= (arrayNoDuplicates!0 lt!453437 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104200 (Cons!21799 (select (arr!31153 lt!453437) #b00000000000000000000000000000000) Nil!21800) Nil!21800)) e!581569)))

(assert (= (and d!123519 (not res!688791)) b!1030061))

(assert (= (and b!1030061 res!688790) b!1030060))

(assert (= (and b!1030061 res!688792) b!1030062))

(assert (= (and b!1030062 c!104264) b!1030058))

(assert (= (and b!1030062 (not c!104264)) b!1030059))

(assert (= (or b!1030058 b!1030059) bm!43457))

(assert (=> bm!43457 m!949115))

(declare-fun m!949315 () Bool)

(assert (=> bm!43457 m!949315))

(assert (=> b!1030060 m!949115))

(assert (=> b!1030060 m!949115))

(declare-fun m!949317 () Bool)

(assert (=> b!1030060 m!949317))

(assert (=> b!1030061 m!949115))

(assert (=> b!1030061 m!949115))

(assert (=> b!1030061 m!949123))

(assert (=> b!1030062 m!949115))

(assert (=> b!1030062 m!949115))

(assert (=> b!1030062 m!949123))

(assert (=> bm!43437 d!123519))

(assert (=> b!1029798 d!123483))

(declare-fun d!123521 () Bool)

(declare-fun e!581574 () Bool)

(assert (=> d!123521 e!581574))

(declare-fun res!688793 () Bool)

(assert (=> d!123521 (=> res!688793 e!581574)))

(declare-fun lt!453740 () Bool)

(assert (=> d!123521 (= res!688793 (not lt!453740))))

(declare-fun lt!453741 () Bool)

(assert (=> d!123521 (= lt!453740 lt!453741)))

(declare-fun lt!453742 () Unit!33586)

(declare-fun e!581573 () Unit!33586)

(assert (=> d!123521 (= lt!453742 e!581573)))

(declare-fun c!104265 () Bool)

(assert (=> d!123521 (= c!104265 lt!453741)))

(assert (=> d!123521 (= lt!453741 (containsKey!562 (toList!6858 lt!453574) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123521 (= (contains!5992 lt!453574 #b0000000000000000000000000000000000000000000000000000000000000000) lt!453740)))

(declare-fun b!1030063 () Bool)

(declare-fun lt!453739 () Unit!33586)

(assert (=> b!1030063 (= e!581573 lt!453739)))

(assert (=> b!1030063 (= lt!453739 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6858 lt!453574) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030063 (isDefined!431 (getValueByKey!581 (toList!6858 lt!453574) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030064 () Bool)

(declare-fun Unit!33601 () Unit!33586)

(assert (=> b!1030064 (= e!581573 Unit!33601)))

(declare-fun b!1030065 () Bool)

(assert (=> b!1030065 (= e!581574 (isDefined!431 (getValueByKey!581 (toList!6858 lt!453574) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123521 c!104265) b!1030063))

(assert (= (and d!123521 (not c!104265)) b!1030064))

(assert (= (and d!123521 (not res!688793)) b!1030065))

(declare-fun m!949319 () Bool)

(assert (=> d!123521 m!949319))

(declare-fun m!949321 () Bool)

(assert (=> b!1030063 m!949321))

(assert (=> b!1030063 m!949269))

(assert (=> b!1030063 m!949269))

(declare-fun m!949323 () Bool)

(assert (=> b!1030063 m!949323))

(assert (=> b!1030065 m!949269))

(assert (=> b!1030065 m!949269))

(assert (=> b!1030065 m!949323))

(assert (=> bm!43426 d!123521))

(assert (=> d!123427 d!123447))

(declare-fun b!1030066 () Bool)

(declare-fun e!581576 () (_ BitVec 32))

(declare-fun call!43461 () (_ BitVec 32))

(assert (=> b!1030066 (= e!581576 call!43461)))

(declare-fun d!123523 () Bool)

(declare-fun lt!453743 () (_ BitVec 32))

(assert (=> d!123523 (and (bvsge lt!453743 #b00000000000000000000000000000000) (bvsle lt!453743 (bvsub (size!31668 lt!453437) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!581575 () (_ BitVec 32))

(assert (=> d!123523 (= lt!453743 e!581575)))

(declare-fun c!104267 () Bool)

(assert (=> d!123523 (= c!104267 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31668 (_keys!11294 thiss!1427))))))

(assert (=> d!123523 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31668 (_keys!11294 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31668 (_keys!11294 thiss!1427)) (size!31668 lt!453437)))))

(assert (=> d!123523 (= (arrayCountValidKeys!0 lt!453437 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31668 (_keys!11294 thiss!1427))) lt!453743)))

(declare-fun bm!43458 () Bool)

(assert (=> bm!43458 (= call!43461 (arrayCountValidKeys!0 lt!453437 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun b!1030067 () Bool)

(assert (=> b!1030067 (= e!581575 e!581576)))

(declare-fun c!104266 () Bool)

(assert (=> b!1030067 (= c!104266 (validKeyInArray!0 (select (arr!31153 lt!453437) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1030068 () Bool)

(assert (=> b!1030068 (= e!581575 #b00000000000000000000000000000000)))

(declare-fun b!1030069 () Bool)

(assert (=> b!1030069 (= e!581576 (bvadd #b00000000000000000000000000000001 call!43461))))

(assert (= (and d!123523 c!104267) b!1030068))

(assert (= (and d!123523 (not c!104267)) b!1030067))

(assert (= (and b!1030067 c!104266) b!1030069))

(assert (= (and b!1030067 (not c!104266)) b!1030066))

(assert (= (or b!1030069 b!1030066) bm!43458))

(declare-fun m!949325 () Bool)

(assert (=> bm!43458 m!949325))

(assert (=> b!1030067 m!949115))

(assert (=> b!1030067 m!949115))

(assert (=> b!1030067 m!949123))

(assert (=> bm!43405 d!123523))

(declare-fun b!1030088 () Bool)

(declare-fun e!581590 () SeekEntryResult!9633)

(assert (=> b!1030088 (= e!581590 (Intermediate!9633 false (toIndex!0 key!909 (mask!29897 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1030089 () Bool)

(declare-fun e!581589 () SeekEntryResult!9633)

(assert (=> b!1030089 (= e!581589 e!581590)))

(declare-fun c!104275 () Bool)

(declare-fun lt!453748 () (_ BitVec 64))

(assert (=> b!1030089 (= c!104275 (or (= lt!453748 key!909) (= (bvadd lt!453748 lt!453748) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030090 () Bool)

(declare-fun e!581591 () Bool)

(declare-fun lt!453749 () SeekEntryResult!9633)

(assert (=> b!1030090 (= e!581591 (bvsge (x!91483 lt!453749) #b01111111111111111111111111111110))))

(declare-fun b!1030091 () Bool)

(assert (=> b!1030091 (= e!581590 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!29897 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!29897 thiss!1427)) key!909 (_keys!11294 thiss!1427) (mask!29897 thiss!1427)))))

(declare-fun b!1030092 () Bool)

(declare-fun e!581588 () Bool)

(assert (=> b!1030092 (= e!581591 e!581588)))

(declare-fun res!688802 () Bool)

(assert (=> b!1030092 (= res!688802 (and ((_ is Intermediate!9633) lt!453749) (not (undefined!10445 lt!453749)) (bvslt (x!91483 lt!453749) #b01111111111111111111111111111110) (bvsge (x!91483 lt!453749) #b00000000000000000000000000000000) (bvsge (x!91483 lt!453749) #b00000000000000000000000000000000)))))

(assert (=> b!1030092 (=> (not res!688802) (not e!581588))))

(declare-fun b!1030094 () Bool)

(assert (=> b!1030094 (and (bvsge (index!40905 lt!453749) #b00000000000000000000000000000000) (bvslt (index!40905 lt!453749) (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun res!688800 () Bool)

(assert (=> b!1030094 (= res!688800 (= (select (arr!31153 (_keys!11294 thiss!1427)) (index!40905 lt!453749)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581587 () Bool)

(assert (=> b!1030094 (=> res!688800 e!581587)))

(declare-fun b!1030095 () Bool)

(assert (=> b!1030095 (and (bvsge (index!40905 lt!453749) #b00000000000000000000000000000000) (bvslt (index!40905 lt!453749) (size!31668 (_keys!11294 thiss!1427))))))

(declare-fun res!688801 () Bool)

(assert (=> b!1030095 (= res!688801 (= (select (arr!31153 (_keys!11294 thiss!1427)) (index!40905 lt!453749)) key!909))))

(assert (=> b!1030095 (=> res!688801 e!581587)))

(assert (=> b!1030095 (= e!581588 e!581587)))

(declare-fun b!1030096 () Bool)

(assert (=> b!1030096 (= e!581589 (Intermediate!9633 true (toIndex!0 key!909 (mask!29897 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun d!123525 () Bool)

(assert (=> d!123525 e!581591))

(declare-fun c!104274 () Bool)

(assert (=> d!123525 (= c!104274 (and ((_ is Intermediate!9633) lt!453749) (undefined!10445 lt!453749)))))

(assert (=> d!123525 (= lt!453749 e!581589)))

(declare-fun c!104276 () Bool)

(assert (=> d!123525 (= c!104276 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!123525 (= lt!453748 (select (arr!31153 (_keys!11294 thiss!1427)) (toIndex!0 key!909 (mask!29897 thiss!1427))))))

(assert (=> d!123525 (validMask!0 (mask!29897 thiss!1427))))

(assert (=> d!123525 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29897 thiss!1427)) key!909 (_keys!11294 thiss!1427) (mask!29897 thiss!1427)) lt!453749)))

(declare-fun b!1030093 () Bool)

(assert (=> b!1030093 (and (bvsge (index!40905 lt!453749) #b00000000000000000000000000000000) (bvslt (index!40905 lt!453749) (size!31668 (_keys!11294 thiss!1427))))))

(assert (=> b!1030093 (= e!581587 (= (select (arr!31153 (_keys!11294 thiss!1427)) (index!40905 lt!453749)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!123525 c!104276) b!1030096))

(assert (= (and d!123525 (not c!104276)) b!1030089))

(assert (= (and b!1030089 c!104275) b!1030088))

(assert (= (and b!1030089 (not c!104275)) b!1030091))

(assert (= (and d!123525 c!104274) b!1030090))

(assert (= (and d!123525 (not c!104274)) b!1030092))

(assert (= (and b!1030092 res!688802) b!1030095))

(assert (= (and b!1030095 (not res!688801)) b!1030094))

(assert (= (and b!1030094 (not res!688800)) b!1030093))

(declare-fun m!949327 () Bool)

(assert (=> b!1030094 m!949327))

(assert (=> d!123525 m!948901))

(declare-fun m!949329 () Bool)

(assert (=> d!123525 m!949329))

(assert (=> d!123525 m!948905))

(assert (=> b!1030093 m!949327))

(assert (=> b!1030091 m!948901))

(declare-fun m!949331 () Bool)

(assert (=> b!1030091 m!949331))

(assert (=> b!1030091 m!949331))

(declare-fun m!949333 () Bool)

(assert (=> b!1030091 m!949333))

(assert (=> b!1030095 m!949327))

(assert (=> d!123409 d!123525))

(declare-fun d!123527 () Bool)

(declare-fun lt!453755 () (_ BitVec 32))

(declare-fun lt!453754 () (_ BitVec 32))

(assert (=> d!123527 (= lt!453755 (bvmul (bvxor lt!453754 (bvlshr lt!453754 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!123527 (= lt!453754 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!123527 (and (bvsge (mask!29897 thiss!1427) #b00000000000000000000000000000000) (let ((res!688803 (let ((h!23010 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!91518 (bvmul (bvxor h!23010 (bvlshr h!23010 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!91518 (bvlshr x!91518 #b00000000000000000000000000001101)) (mask!29897 thiss!1427)))))) (and (bvslt res!688803 (bvadd (mask!29897 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!688803 #b00000000000000000000000000000000))))))

(assert (=> d!123527 (= (toIndex!0 key!909 (mask!29897 thiss!1427)) (bvand (bvxor lt!453755 (bvlshr lt!453755 #b00000000000000000000000000001101)) (mask!29897 thiss!1427)))))

(assert (=> d!123409 d!123527))

(assert (=> d!123409 d!123447))

(declare-fun d!123529 () Bool)

(declare-fun e!581592 () Bool)

(assert (=> d!123529 e!581592))

(declare-fun res!688804 () Bool)

(assert (=> d!123529 (=> (not res!688804) (not e!581592))))

(declare-fun lt!453759 () ListLongMap!13685)

(assert (=> d!123529 (= res!688804 (contains!5992 lt!453759 (_1!7787 (ite (or c!104192 c!104194) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(declare-fun lt!453757 () List!21802)

(assert (=> d!123529 (= lt!453759 (ListLongMap!13686 lt!453757))))

(declare-fun lt!453756 () Unit!33586)

(declare-fun lt!453758 () Unit!33586)

(assert (=> d!123529 (= lt!453756 lt!453758)))

(assert (=> d!123529 (= (getValueByKey!581 lt!453757 (_1!7787 (ite (or c!104192 c!104194) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))) (Some!631 (_2!7787 (ite (or c!104192 c!104194) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(assert (=> d!123529 (= lt!453758 (lemmaContainsTupThenGetReturnValue!277 lt!453757 (_1!7787 (ite (or c!104192 c!104194) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (_2!7787 (ite (or c!104192 c!104194) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(assert (=> d!123529 (= lt!453757 (insertStrictlySorted!370 (toList!6858 (ite c!104192 call!43434 (ite c!104194 call!43435 call!43431))) (_1!7787 (ite (or c!104192 c!104194) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (_2!7787 (ite (or c!104192 c!104194) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(assert (=> d!123529 (= (+!3121 (ite c!104192 call!43434 (ite c!104194 call!43435 call!43431)) (ite (or c!104192 c!104194) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) lt!453759)))

(declare-fun b!1030097 () Bool)

(declare-fun res!688805 () Bool)

(assert (=> b!1030097 (=> (not res!688805) (not e!581592))))

(assert (=> b!1030097 (= res!688805 (= (getValueByKey!581 (toList!6858 lt!453759) (_1!7787 (ite (or c!104192 c!104194) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))) (Some!631 (_2!7787 (ite (or c!104192 c!104194) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))))

(declare-fun b!1030098 () Bool)

(assert (=> b!1030098 (= e!581592 (contains!5994 (toList!6858 lt!453759) (ite (or c!104192 c!104194) (tuple2!15553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(assert (= (and d!123529 res!688804) b!1030097))

(assert (= (and b!1030097 res!688805) b!1030098))

(declare-fun m!949335 () Bool)

(assert (=> d!123529 m!949335))

(declare-fun m!949337 () Bool)

(assert (=> d!123529 m!949337))

(declare-fun m!949339 () Bool)

(assert (=> d!123529 m!949339))

(declare-fun m!949341 () Bool)

(assert (=> d!123529 m!949341))

(declare-fun m!949343 () Bool)

(assert (=> b!1030097 m!949343))

(declare-fun m!949345 () Bool)

(assert (=> b!1030098 m!949345))

(assert (=> bm!43429 d!123529))

(declare-fun d!123531 () Bool)

(declare-fun e!581593 () Bool)

(assert (=> d!123531 e!581593))

(declare-fun res!688806 () Bool)

(assert (=> d!123531 (=> (not res!688806) (not e!581593))))

(declare-fun lt!453763 () ListLongMap!13685)

(assert (=> d!123531 (= res!688806 (contains!5992 lt!453763 (_1!7787 (tuple2!15553 lt!453568 (minValue!5938 thiss!1427)))))))

(declare-fun lt!453761 () List!21802)

(assert (=> d!123531 (= lt!453763 (ListLongMap!13686 lt!453761))))

(declare-fun lt!453760 () Unit!33586)

(declare-fun lt!453762 () Unit!33586)

(assert (=> d!123531 (= lt!453760 lt!453762)))

(assert (=> d!123531 (= (getValueByKey!581 lt!453761 (_1!7787 (tuple2!15553 lt!453568 (minValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453568 (minValue!5938 thiss!1427)))))))

(assert (=> d!123531 (= lt!453762 (lemmaContainsTupThenGetReturnValue!277 lt!453761 (_1!7787 (tuple2!15553 lt!453568 (minValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453568 (minValue!5938 thiss!1427)))))))

(assert (=> d!123531 (= lt!453761 (insertStrictlySorted!370 (toList!6858 lt!453586) (_1!7787 (tuple2!15553 lt!453568 (minValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453568 (minValue!5938 thiss!1427)))))))

(assert (=> d!123531 (= (+!3121 lt!453586 (tuple2!15553 lt!453568 (minValue!5938 thiss!1427))) lt!453763)))

(declare-fun b!1030099 () Bool)

(declare-fun res!688807 () Bool)

(assert (=> b!1030099 (=> (not res!688807) (not e!581593))))

(assert (=> b!1030099 (= res!688807 (= (getValueByKey!581 (toList!6858 lt!453763) (_1!7787 (tuple2!15553 lt!453568 (minValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453568 (minValue!5938 thiss!1427))))))))

(declare-fun b!1030100 () Bool)

(assert (=> b!1030100 (= e!581593 (contains!5994 (toList!6858 lt!453763) (tuple2!15553 lt!453568 (minValue!5938 thiss!1427))))))

(assert (= (and d!123531 res!688806) b!1030099))

(assert (= (and b!1030099 res!688807) b!1030100))

(declare-fun m!949347 () Bool)

(assert (=> d!123531 m!949347))

(declare-fun m!949349 () Bool)

(assert (=> d!123531 m!949349))

(declare-fun m!949351 () Bool)

(assert (=> d!123531 m!949351))

(declare-fun m!949353 () Bool)

(assert (=> d!123531 m!949353))

(declare-fun m!949355 () Bool)

(assert (=> b!1030099 m!949355))

(declare-fun m!949357 () Bool)

(assert (=> b!1030100 m!949357))

(assert (=> b!1029787 d!123531))

(declare-fun d!123533 () Bool)

(declare-fun e!581594 () Bool)

(assert (=> d!123533 e!581594))

(declare-fun res!688808 () Bool)

(assert (=> d!123533 (=> (not res!688808) (not e!581594))))

(declare-fun lt!453767 () ListLongMap!13685)

(assert (=> d!123533 (= res!688808 (contains!5992 lt!453767 (_1!7787 (tuple2!15553 lt!453566 (minValue!5938 thiss!1427)))))))

(declare-fun lt!453765 () List!21802)

(assert (=> d!123533 (= lt!453767 (ListLongMap!13686 lt!453765))))

(declare-fun lt!453764 () Unit!33586)

(declare-fun lt!453766 () Unit!33586)

(assert (=> d!123533 (= lt!453764 lt!453766)))

(assert (=> d!123533 (= (getValueByKey!581 lt!453765 (_1!7787 (tuple2!15553 lt!453566 (minValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453566 (minValue!5938 thiss!1427)))))))

(assert (=> d!123533 (= lt!453766 (lemmaContainsTupThenGetReturnValue!277 lt!453765 (_1!7787 (tuple2!15553 lt!453566 (minValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453566 (minValue!5938 thiss!1427)))))))

(assert (=> d!123533 (= lt!453765 (insertStrictlySorted!370 (toList!6858 lt!453573) (_1!7787 (tuple2!15553 lt!453566 (minValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453566 (minValue!5938 thiss!1427)))))))

(assert (=> d!123533 (= (+!3121 lt!453573 (tuple2!15553 lt!453566 (minValue!5938 thiss!1427))) lt!453767)))

(declare-fun b!1030101 () Bool)

(declare-fun res!688809 () Bool)

(assert (=> b!1030101 (=> (not res!688809) (not e!581594))))

(assert (=> b!1030101 (= res!688809 (= (getValueByKey!581 (toList!6858 lt!453767) (_1!7787 (tuple2!15553 lt!453566 (minValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453566 (minValue!5938 thiss!1427))))))))

(declare-fun b!1030102 () Bool)

(assert (=> b!1030102 (= e!581594 (contains!5994 (toList!6858 lt!453767) (tuple2!15553 lt!453566 (minValue!5938 thiss!1427))))))

(assert (= (and d!123533 res!688808) b!1030101))

(assert (= (and b!1030101 res!688809) b!1030102))

(declare-fun m!949359 () Bool)

(assert (=> d!123533 m!949359))

(declare-fun m!949361 () Bool)

(assert (=> d!123533 m!949361))

(declare-fun m!949363 () Bool)

(assert (=> d!123533 m!949363))

(declare-fun m!949365 () Bool)

(assert (=> d!123533 m!949365))

(declare-fun m!949367 () Bool)

(assert (=> b!1030101 m!949367))

(declare-fun m!949369 () Bool)

(assert (=> b!1030102 m!949369))

(assert (=> b!1029787 d!123533))

(declare-fun d!123535 () Bool)

(assert (=> d!123535 (= (apply!910 (+!3121 lt!453586 (tuple2!15553 lt!453568 (minValue!5938 thiss!1427))) lt!453569) (get!16377 (getValueByKey!581 (toList!6858 (+!3121 lt!453586 (tuple2!15553 lt!453568 (minValue!5938 thiss!1427)))) lt!453569)))))

(declare-fun bs!30052 () Bool)

(assert (= bs!30052 d!123535))

(declare-fun m!949371 () Bool)

(assert (=> bs!30052 m!949371))

(assert (=> bs!30052 m!949371))

(declare-fun m!949373 () Bool)

(assert (=> bs!30052 m!949373))

(assert (=> b!1029787 d!123535))

(declare-fun lt!453768 () ListLongMap!13685)

(declare-fun e!581599 () Bool)

(declare-fun b!1030103 () Bool)

(assert (=> b!1030103 (= e!581599 (= lt!453768 (getCurrentListMapNoExtraKeys!3561 lt!453437 lt!453435 (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6102 thiss!1427))))))

(declare-fun b!1030104 () Bool)

(declare-fun res!688813 () Bool)

(declare-fun e!581600 () Bool)

(assert (=> b!1030104 (=> (not res!688813) (not e!581600))))

(assert (=> b!1030104 (= res!688813 (not (contains!5992 lt!453768 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030105 () Bool)

(declare-fun e!581595 () Bool)

(assert (=> b!1030105 (= e!581600 e!581595)))

(declare-fun c!104277 () Bool)

(declare-fun e!581597 () Bool)

(assert (=> b!1030105 (= c!104277 e!581597)))

(declare-fun res!688810 () Bool)

(assert (=> b!1030105 (=> (not res!688810) (not e!581597))))

(assert (=> b!1030105 (= res!688810 (bvslt #b00000000000000000000000000000000 (size!31668 lt!453437)))))

(declare-fun b!1030106 () Bool)

(assert (=> b!1030106 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31668 lt!453437)))))

(assert (=> b!1030106 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31669 lt!453435)))))

(declare-fun e!581596 () Bool)

(assert (=> b!1030106 (= e!581596 (= (apply!910 lt!453768 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)) (get!16376 (select (arr!31154 lt!453435) #b00000000000000000000000000000000) (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1030107 () Bool)

(declare-fun e!581598 () ListLongMap!13685)

(assert (=> b!1030107 (= e!581598 (ListLongMap!13686 Nil!21799))))

(declare-fun b!1030108 () Bool)

(assert (=> b!1030108 (= e!581597 (validKeyInArray!0 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(assert (=> b!1030108 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1030110 () Bool)

(assert (=> b!1030110 (= e!581595 e!581599)))

(declare-fun c!104280 () Bool)

(assert (=> b!1030110 (= c!104280 (bvslt #b00000000000000000000000000000000 (size!31668 lt!453437)))))

(declare-fun b!1030111 () Bool)

(declare-fun e!581601 () ListLongMap!13685)

(declare-fun call!43462 () ListLongMap!13685)

(assert (=> b!1030111 (= e!581601 call!43462)))

(declare-fun b!1030112 () Bool)

(assert (=> b!1030112 (= e!581598 e!581601)))

(declare-fun c!104279 () Bool)

(assert (=> b!1030112 (= c!104279 (validKeyInArray!0 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(declare-fun b!1030113 () Bool)

(assert (=> b!1030113 (= e!581599 (isEmpty!927 lt!453768))))

(declare-fun d!123537 () Bool)

(assert (=> d!123537 e!581600))

(declare-fun res!688811 () Bool)

(assert (=> d!123537 (=> (not res!688811) (not e!581600))))

(assert (=> d!123537 (= res!688811 (not (contains!5992 lt!453768 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123537 (= lt!453768 e!581598)))

(declare-fun c!104278 () Bool)

(assert (=> d!123537 (= c!104278 (bvsge #b00000000000000000000000000000000 (size!31668 lt!453437)))))

(assert (=> d!123537 (validMask!0 (mask!29897 thiss!1427))))

(assert (=> d!123537 (= (getCurrentListMapNoExtraKeys!3561 lt!453437 lt!453435 (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) lt!453768)))

(declare-fun b!1030109 () Bool)

(assert (=> b!1030109 (= e!581595 e!581596)))

(assert (=> b!1030109 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31668 lt!453437)))))

(declare-fun res!688812 () Bool)

(assert (=> b!1030109 (= res!688812 (contains!5992 lt!453768 (select (arr!31153 lt!453437) #b00000000000000000000000000000000)))))

(assert (=> b!1030109 (=> (not res!688812) (not e!581596))))

(declare-fun bm!43459 () Bool)

(assert (=> bm!43459 (= call!43462 (getCurrentListMapNoExtraKeys!3561 lt!453437 lt!453435 (mask!29897 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6102 thiss!1427)))))

(declare-fun b!1030114 () Bool)

(declare-fun lt!453771 () Unit!33586)

(declare-fun lt!453774 () Unit!33586)

(assert (=> b!1030114 (= lt!453771 lt!453774)))

(declare-fun lt!453772 () (_ BitVec 64))

(declare-fun lt!453770 () (_ BitVec 64))

(declare-fun lt!453769 () V!37275)

(declare-fun lt!453773 () ListLongMap!13685)

(assert (=> b!1030114 (not (contains!5992 (+!3121 lt!453773 (tuple2!15553 lt!453772 lt!453769)) lt!453770))))

(assert (=> b!1030114 (= lt!453774 (addStillNotContains!241 lt!453773 lt!453772 lt!453769 lt!453770))))

(assert (=> b!1030114 (= lt!453770 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1030114 (= lt!453769 (get!16376 (select (arr!31154 lt!453435) #b00000000000000000000000000000000) (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1030114 (= lt!453772 (select (arr!31153 lt!453437) #b00000000000000000000000000000000))))

(assert (=> b!1030114 (= lt!453773 call!43462)))

(assert (=> b!1030114 (= e!581601 (+!3121 call!43462 (tuple2!15553 (select (arr!31153 lt!453437) #b00000000000000000000000000000000) (get!16376 (select (arr!31154 lt!453435) #b00000000000000000000000000000000) (dynLambda!1975 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!123537 c!104278) b!1030107))

(assert (= (and d!123537 (not c!104278)) b!1030112))

(assert (= (and b!1030112 c!104279) b!1030114))

(assert (= (and b!1030112 (not c!104279)) b!1030111))

(assert (= (or b!1030114 b!1030111) bm!43459))

(assert (= (and d!123537 res!688811) b!1030104))

(assert (= (and b!1030104 res!688813) b!1030105))

(assert (= (and b!1030105 res!688810) b!1030108))

(assert (= (and b!1030105 c!104277) b!1030109))

(assert (= (and b!1030105 (not c!104277)) b!1030110))

(assert (= (and b!1030109 res!688812) b!1030106))

(assert (= (and b!1030110 c!104280) b!1030103))

(assert (= (and b!1030110 (not c!104280)) b!1030113))

(declare-fun b_lambda!15821 () Bool)

(assert (=> (not b_lambda!15821) (not b!1030106)))

(assert (=> b!1030106 t!30869))

(declare-fun b_and!32899 () Bool)

(assert (= b_and!32897 (and (=> t!30869 result!14109) b_and!32899)))

(declare-fun b_lambda!15823 () Bool)

(assert (=> (not b_lambda!15823) (not b!1030114)))

(assert (=> b!1030114 t!30869))

(declare-fun b_and!32901 () Bool)

(assert (= b_and!32899 (and (=> t!30869 result!14109) b_and!32901)))

(declare-fun m!949375 () Bool)

(assert (=> b!1030113 m!949375))

(declare-fun m!949377 () Bool)

(assert (=> bm!43459 m!949377))

(declare-fun m!949379 () Bool)

(assert (=> d!123537 m!949379))

(assert (=> d!123537 m!948905))

(assert (=> b!1030112 m!948913))

(assert (=> b!1030112 m!948913))

(assert (=> b!1030112 m!948915))

(assert (=> b!1030106 m!948987))

(assert (=> b!1030106 m!948797))

(assert (=> b!1030106 m!948913))

(declare-fun m!949381 () Bool)

(assert (=> b!1030106 m!949381))

(assert (=> b!1030106 m!948987))

(assert (=> b!1030106 m!948797))

(assert (=> b!1030106 m!948989))

(assert (=> b!1030106 m!948913))

(assert (=> b!1030108 m!948913))

(assert (=> b!1030108 m!948913))

(assert (=> b!1030108 m!948915))

(assert (=> b!1030109 m!948913))

(assert (=> b!1030109 m!948913))

(declare-fun m!949383 () Bool)

(assert (=> b!1030109 m!949383))

(declare-fun m!949385 () Bool)

(assert (=> b!1030104 m!949385))

(assert (=> b!1030103 m!949377))

(declare-fun m!949387 () Bool)

(assert (=> b!1030114 m!949387))

(assert (=> b!1030114 m!948797))

(declare-fun m!949389 () Bool)

(assert (=> b!1030114 m!949389))

(assert (=> b!1030114 m!948987))

(assert (=> b!1030114 m!948797))

(assert (=> b!1030114 m!948989))

(assert (=> b!1030114 m!949389))

(declare-fun m!949391 () Bool)

(assert (=> b!1030114 m!949391))

(assert (=> b!1030114 m!948913))

(declare-fun m!949393 () Bool)

(assert (=> b!1030114 m!949393))

(assert (=> b!1030114 m!948987))

(assert (=> b!1029787 d!123537))

(declare-fun d!123539 () Bool)

(assert (=> d!123539 (= (apply!910 lt!453572 lt!453580) (get!16377 (getValueByKey!581 (toList!6858 lt!453572) lt!453580)))))

(declare-fun bs!30053 () Bool)

(assert (= bs!30053 d!123539))

(declare-fun m!949395 () Bool)

(assert (=> bs!30053 m!949395))

(assert (=> bs!30053 m!949395))

(declare-fun m!949397 () Bool)

(assert (=> bs!30053 m!949397))

(assert (=> b!1029787 d!123539))

(declare-fun d!123541 () Bool)

(assert (=> d!123541 (= (apply!910 lt!453573 lt!453577) (get!16377 (getValueByKey!581 (toList!6858 lt!453573) lt!453577)))))

(declare-fun bs!30054 () Bool)

(assert (= bs!30054 d!123541))

(declare-fun m!949399 () Bool)

(assert (=> bs!30054 m!949399))

(assert (=> bs!30054 m!949399))

(declare-fun m!949401 () Bool)

(assert (=> bs!30054 m!949401))

(assert (=> b!1029787 d!123541))

(declare-fun d!123543 () Bool)

(assert (=> d!123543 (= (apply!910 (+!3121 lt!453573 (tuple2!15553 lt!453566 (minValue!5938 thiss!1427))) lt!453577) (apply!910 lt!453573 lt!453577))))

(declare-fun lt!453777 () Unit!33586)

(declare-fun choose!1690 (ListLongMap!13685 (_ BitVec 64) V!37275 (_ BitVec 64)) Unit!33586)

(assert (=> d!123543 (= lt!453777 (choose!1690 lt!453573 lt!453566 (minValue!5938 thiss!1427) lt!453577))))

(declare-fun e!581604 () Bool)

(assert (=> d!123543 e!581604))

(declare-fun res!688816 () Bool)

(assert (=> d!123543 (=> (not res!688816) (not e!581604))))

(assert (=> d!123543 (= res!688816 (contains!5992 lt!453573 lt!453577))))

(assert (=> d!123543 (= (addApplyDifferent!476 lt!453573 lt!453566 (minValue!5938 thiss!1427) lt!453577) lt!453777)))

(declare-fun b!1030118 () Bool)

(assert (=> b!1030118 (= e!581604 (not (= lt!453577 lt!453566)))))

(assert (= (and d!123543 res!688816) b!1030118))

(declare-fun m!949403 () Bool)

(assert (=> d!123543 m!949403))

(assert (=> d!123543 m!948949))

(assert (=> d!123543 m!948949))

(assert (=> d!123543 m!948951))

(assert (=> d!123543 m!948973))

(declare-fun m!949405 () Bool)

(assert (=> d!123543 m!949405))

(assert (=> b!1029787 d!123543))

(declare-fun d!123545 () Bool)

(assert (=> d!123545 (= (apply!910 (+!3121 lt!453572 (tuple2!15553 lt!453579 (zeroValue!5938 thiss!1427))) lt!453580) (get!16377 (getValueByKey!581 (toList!6858 (+!3121 lt!453572 (tuple2!15553 lt!453579 (zeroValue!5938 thiss!1427)))) lt!453580)))))

(declare-fun bs!30055 () Bool)

(assert (= bs!30055 d!123545))

(declare-fun m!949407 () Bool)

(assert (=> bs!30055 m!949407))

(assert (=> bs!30055 m!949407))

(declare-fun m!949409 () Bool)

(assert (=> bs!30055 m!949409))

(assert (=> b!1029787 d!123545))

(declare-fun d!123547 () Bool)

(assert (=> d!123547 (= (apply!910 lt!453586 lt!453569) (get!16377 (getValueByKey!581 (toList!6858 lt!453586) lt!453569)))))

(declare-fun bs!30056 () Bool)

(assert (= bs!30056 d!123547))

(declare-fun m!949411 () Bool)

(assert (=> bs!30056 m!949411))

(assert (=> bs!30056 m!949411))

(declare-fun m!949413 () Bool)

(assert (=> bs!30056 m!949413))

(assert (=> b!1029787 d!123547))

(declare-fun d!123549 () Bool)

(assert (=> d!123549 (= (apply!910 (+!3121 lt!453572 (tuple2!15553 lt!453579 (zeroValue!5938 thiss!1427))) lt!453580) (apply!910 lt!453572 lt!453580))))

(declare-fun lt!453778 () Unit!33586)

(assert (=> d!123549 (= lt!453778 (choose!1690 lt!453572 lt!453579 (zeroValue!5938 thiss!1427) lt!453580))))

(declare-fun e!581605 () Bool)

(assert (=> d!123549 e!581605))

(declare-fun res!688817 () Bool)

(assert (=> d!123549 (=> (not res!688817) (not e!581605))))

(assert (=> d!123549 (= res!688817 (contains!5992 lt!453572 lt!453580))))

(assert (=> d!123549 (= (addApplyDifferent!476 lt!453572 lt!453579 (zeroValue!5938 thiss!1427) lt!453580) lt!453778)))

(declare-fun b!1030119 () Bool)

(assert (=> b!1030119 (= e!581605 (not (= lt!453580 lt!453579)))))

(assert (= (and d!123549 res!688817) b!1030119))

(declare-fun m!949415 () Bool)

(assert (=> d!123549 m!949415))

(assert (=> d!123549 m!948947))

(assert (=> d!123549 m!948947))

(assert (=> d!123549 m!948965))

(assert (=> d!123549 m!948967))

(declare-fun m!949417 () Bool)

(assert (=> d!123549 m!949417))

(assert (=> b!1029787 d!123549))

(declare-fun d!123551 () Bool)

(declare-fun e!581606 () Bool)

(assert (=> d!123551 e!581606))

(declare-fun res!688818 () Bool)

(assert (=> d!123551 (=> (not res!688818) (not e!581606))))

(declare-fun lt!453782 () ListLongMap!13685)

(assert (=> d!123551 (= res!688818 (contains!5992 lt!453782 (_1!7787 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427)))))))

(declare-fun lt!453780 () List!21802)

(assert (=> d!123551 (= lt!453782 (ListLongMap!13686 lt!453780))))

(declare-fun lt!453779 () Unit!33586)

(declare-fun lt!453781 () Unit!33586)

(assert (=> d!123551 (= lt!453779 lt!453781)))

(assert (=> d!123551 (= (getValueByKey!581 lt!453780 (_1!7787 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!123551 (= lt!453781 (lemmaContainsTupThenGetReturnValue!277 lt!453780 (_1!7787 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!123551 (= lt!453780 (insertStrictlySorted!370 (toList!6858 lt!453565) (_1!7787 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!123551 (= (+!3121 lt!453565 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427))) lt!453782)))

(declare-fun b!1030120 () Bool)

(declare-fun res!688819 () Bool)

(assert (=> b!1030120 (=> (not res!688819) (not e!581606))))

(assert (=> b!1030120 (= res!688819 (= (getValueByKey!581 (toList!6858 lt!453782) (_1!7787 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427))))))))

(declare-fun b!1030121 () Bool)

(assert (=> b!1030121 (= e!581606 (contains!5994 (toList!6858 lt!453782) (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427))))))

(assert (= (and d!123551 res!688818) b!1030120))

(assert (= (and b!1030120 res!688819) b!1030121))

(declare-fun m!949419 () Bool)

(assert (=> d!123551 m!949419))

(declare-fun m!949421 () Bool)

(assert (=> d!123551 m!949421))

(declare-fun m!949423 () Bool)

(assert (=> d!123551 m!949423))

(declare-fun m!949425 () Bool)

(assert (=> d!123551 m!949425))

(declare-fun m!949427 () Bool)

(assert (=> b!1030120 m!949427))

(declare-fun m!949429 () Bool)

(assert (=> b!1030121 m!949429))

(assert (=> b!1029787 d!123551))

(declare-fun d!123553 () Bool)

(declare-fun e!581608 () Bool)

(assert (=> d!123553 e!581608))

(declare-fun res!688820 () Bool)

(assert (=> d!123553 (=> res!688820 e!581608)))

(declare-fun lt!453784 () Bool)

(assert (=> d!123553 (= res!688820 (not lt!453784))))

(declare-fun lt!453785 () Bool)

(assert (=> d!123553 (= lt!453784 lt!453785)))

(declare-fun lt!453786 () Unit!33586)

(declare-fun e!581607 () Unit!33586)

(assert (=> d!123553 (= lt!453786 e!581607)))

(declare-fun c!104281 () Bool)

(assert (=> d!123553 (= c!104281 lt!453785)))

(assert (=> d!123553 (= lt!453785 (containsKey!562 (toList!6858 (+!3121 lt!453565 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427)))) lt!453570))))

(assert (=> d!123553 (= (contains!5992 (+!3121 lt!453565 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427))) lt!453570) lt!453784)))

(declare-fun b!1030122 () Bool)

(declare-fun lt!453783 () Unit!33586)

(assert (=> b!1030122 (= e!581607 lt!453783)))

(assert (=> b!1030122 (= lt!453783 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6858 (+!3121 lt!453565 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427)))) lt!453570))))

(assert (=> b!1030122 (isDefined!431 (getValueByKey!581 (toList!6858 (+!3121 lt!453565 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427)))) lt!453570))))

(declare-fun b!1030123 () Bool)

(declare-fun Unit!33602 () Unit!33586)

(assert (=> b!1030123 (= e!581607 Unit!33602)))

(declare-fun b!1030124 () Bool)

(assert (=> b!1030124 (= e!581608 (isDefined!431 (getValueByKey!581 (toList!6858 (+!3121 lt!453565 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427)))) lt!453570)))))

(assert (= (and d!123553 c!104281) b!1030122))

(assert (= (and d!123553 (not c!104281)) b!1030123))

(assert (= (and d!123553 (not res!688820)) b!1030124))

(declare-fun m!949431 () Bool)

(assert (=> d!123553 m!949431))

(declare-fun m!949433 () Bool)

(assert (=> b!1030122 m!949433))

(declare-fun m!949435 () Bool)

(assert (=> b!1030122 m!949435))

(assert (=> b!1030122 m!949435))

(declare-fun m!949437 () Bool)

(assert (=> b!1030122 m!949437))

(assert (=> b!1030124 m!949435))

(assert (=> b!1030124 m!949435))

(assert (=> b!1030124 m!949437))

(assert (=> b!1029787 d!123553))

(declare-fun d!123555 () Bool)

(assert (=> d!123555 (contains!5992 (+!3121 lt!453565 (tuple2!15553 lt!453581 (zeroValue!5938 thiss!1427))) lt!453570)))

(declare-fun lt!453789 () Unit!33586)

(declare-fun choose!1691 (ListLongMap!13685 (_ BitVec 64) V!37275 (_ BitVec 64)) Unit!33586)

(assert (=> d!123555 (= lt!453789 (choose!1691 lt!453565 lt!453581 (zeroValue!5938 thiss!1427) lt!453570))))

(assert (=> d!123555 (contains!5992 lt!453565 lt!453570)))

(assert (=> d!123555 (= (addStillContains!620 lt!453565 lt!453581 (zeroValue!5938 thiss!1427) lt!453570) lt!453789)))

(declare-fun bs!30057 () Bool)

(assert (= bs!30057 d!123555))

(assert (=> bs!30057 m!948957))

(assert (=> bs!30057 m!948957))

(assert (=> bs!30057 m!948959))

(declare-fun m!949439 () Bool)

(assert (=> bs!30057 m!949439))

(declare-fun m!949441 () Bool)

(assert (=> bs!30057 m!949441))

(assert (=> b!1029787 d!123555))

(declare-fun d!123557 () Bool)

(assert (=> d!123557 (= (apply!910 (+!3121 lt!453573 (tuple2!15553 lt!453566 (minValue!5938 thiss!1427))) lt!453577) (get!16377 (getValueByKey!581 (toList!6858 (+!3121 lt!453573 (tuple2!15553 lt!453566 (minValue!5938 thiss!1427)))) lt!453577)))))

(declare-fun bs!30058 () Bool)

(assert (= bs!30058 d!123557))

(declare-fun m!949443 () Bool)

(assert (=> bs!30058 m!949443))

(assert (=> bs!30058 m!949443))

(declare-fun m!949445 () Bool)

(assert (=> bs!30058 m!949445))

(assert (=> b!1029787 d!123557))

(declare-fun d!123559 () Bool)

(declare-fun e!581609 () Bool)

(assert (=> d!123559 e!581609))

(declare-fun res!688821 () Bool)

(assert (=> d!123559 (=> (not res!688821) (not e!581609))))

(declare-fun lt!453793 () ListLongMap!13685)

(assert (=> d!123559 (= res!688821 (contains!5992 lt!453793 (_1!7787 (tuple2!15553 lt!453579 (zeroValue!5938 thiss!1427)))))))

(declare-fun lt!453791 () List!21802)

(assert (=> d!123559 (= lt!453793 (ListLongMap!13686 lt!453791))))

(declare-fun lt!453790 () Unit!33586)

(declare-fun lt!453792 () Unit!33586)

(assert (=> d!123559 (= lt!453790 lt!453792)))

(assert (=> d!123559 (= (getValueByKey!581 lt!453791 (_1!7787 (tuple2!15553 lt!453579 (zeroValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453579 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!123559 (= lt!453792 (lemmaContainsTupThenGetReturnValue!277 lt!453791 (_1!7787 (tuple2!15553 lt!453579 (zeroValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453579 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!123559 (= lt!453791 (insertStrictlySorted!370 (toList!6858 lt!453572) (_1!7787 (tuple2!15553 lt!453579 (zeroValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453579 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!123559 (= (+!3121 lt!453572 (tuple2!15553 lt!453579 (zeroValue!5938 thiss!1427))) lt!453793)))

(declare-fun b!1030126 () Bool)

(declare-fun res!688822 () Bool)

(assert (=> b!1030126 (=> (not res!688822) (not e!581609))))

(assert (=> b!1030126 (= res!688822 (= (getValueByKey!581 (toList!6858 lt!453793) (_1!7787 (tuple2!15553 lt!453579 (zeroValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453579 (zeroValue!5938 thiss!1427))))))))

(declare-fun b!1030127 () Bool)

(assert (=> b!1030127 (= e!581609 (contains!5994 (toList!6858 lt!453793) (tuple2!15553 lt!453579 (zeroValue!5938 thiss!1427))))))

(assert (= (and d!123559 res!688821) b!1030126))

(assert (= (and b!1030126 res!688822) b!1030127))

(declare-fun m!949447 () Bool)

(assert (=> d!123559 m!949447))

(declare-fun m!949449 () Bool)

(assert (=> d!123559 m!949449))

(declare-fun m!949451 () Bool)

(assert (=> d!123559 m!949451))

(declare-fun m!949453 () Bool)

(assert (=> d!123559 m!949453))

(declare-fun m!949455 () Bool)

(assert (=> b!1030126 m!949455))

(declare-fun m!949457 () Bool)

(assert (=> b!1030127 m!949457))

(assert (=> b!1029787 d!123559))

(declare-fun d!123561 () Bool)

(assert (=> d!123561 (= (apply!910 (+!3121 lt!453586 (tuple2!15553 lt!453568 (minValue!5938 thiss!1427))) lt!453569) (apply!910 lt!453586 lt!453569))))

(declare-fun lt!453794 () Unit!33586)

(assert (=> d!123561 (= lt!453794 (choose!1690 lt!453586 lt!453568 (minValue!5938 thiss!1427) lt!453569))))

(declare-fun e!581610 () Bool)

(assert (=> d!123561 e!581610))

(declare-fun res!688823 () Bool)

(assert (=> d!123561 (=> (not res!688823) (not e!581610))))

(assert (=> d!123561 (= res!688823 (contains!5992 lt!453586 lt!453569))))

(assert (=> d!123561 (= (addApplyDifferent!476 lt!453586 lt!453568 (minValue!5938 thiss!1427) lt!453569) lt!453794)))

(declare-fun b!1030128 () Bool)

(assert (=> b!1030128 (= e!581610 (not (= lt!453569 lt!453568)))))

(assert (= (and d!123561 res!688823) b!1030128))

(declare-fun m!949459 () Bool)

(assert (=> d!123561 m!949459))

(assert (=> d!123561 m!948961))

(assert (=> d!123561 m!948961))

(assert (=> d!123561 m!948963))

(assert (=> d!123561 m!948975))

(declare-fun m!949461 () Bool)

(assert (=> d!123561 m!949461))

(assert (=> b!1029787 d!123561))

(declare-fun d!123563 () Bool)

(assert (=> d!123563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) (mask!29897 thiss!1427))))

(assert (=> d!123563 true))

(declare-fun _$44!12 () Unit!33586)

(assert (=> d!123563 (= (choose!25 (_keys!11294 thiss!1427) (index!40904 lt!453434) (mask!29897 thiss!1427)) _$44!12)))

(declare-fun bs!30059 () Bool)

(assert (= bs!30059 d!123563))

(assert (=> bs!30059 m!948771))

(assert (=> bs!30059 m!948941))

(assert (=> d!123425 d!123563))

(assert (=> d!123425 d!123447))

(declare-fun d!123565 () Bool)

(assert (=> d!123565 (not (arrayContainsKey!0 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!123565 true))

(declare-fun _$59!14 () Unit!33586)

(assert (=> d!123565 (= (choose!121 (_keys!11294 thiss!1427) (index!40904 lt!453434) key!909) _$59!14)))

(declare-fun bs!30060 () Bool)

(assert (= bs!30060 d!123565))

(assert (=> bs!30060 m!948771))

(assert (=> bs!30060 m!949065))

(assert (=> d!123437 d!123565))

(assert (=> bm!43424 d!123537))

(declare-fun b!1030129 () Bool)

(declare-fun e!581611 () Bool)

(declare-fun call!43463 () Bool)

(assert (=> b!1030129 (= e!581611 call!43463)))

(declare-fun b!1030130 () Bool)

(declare-fun e!581613 () Bool)

(assert (=> b!1030130 (= e!581611 e!581613)))

(declare-fun lt!453795 () (_ BitVec 64))

(assert (=> b!1030130 (= lt!453795 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453796 () Unit!33586)

(assert (=> b!1030130 (= lt!453796 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) lt!453795 #b00000000000000000000000000000000))))

(assert (=> b!1030130 (arrayContainsKey!0 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) lt!453795 #b00000000000000000000000000000000)))

(declare-fun lt!453797 () Unit!33586)

(assert (=> b!1030130 (= lt!453797 lt!453796)))

(declare-fun res!688824 () Bool)

(assert (=> b!1030130 (= res!688824 (= (seekEntryOrOpen!0 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000) (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) (mask!29897 thiss!1427)) (Found!9633 #b00000000000000000000000000000000)))))

(assert (=> b!1030130 (=> (not res!688824) (not e!581613))))

(declare-fun b!1030131 () Bool)

(declare-fun e!581612 () Bool)

(assert (=> b!1030131 (= e!581612 e!581611)))

(declare-fun c!104282 () Bool)

(assert (=> b!1030131 (= c!104282 (validKeyInArray!0 (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!43460 () Bool)

(assert (=> bm!43460 (= call!43463 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) (mask!29897 thiss!1427)))))

(declare-fun b!1030132 () Bool)

(assert (=> b!1030132 (= e!581613 call!43463)))

(declare-fun d!123567 () Bool)

(declare-fun res!688825 () Bool)

(assert (=> d!123567 (=> res!688825 e!581612)))

(assert (=> d!123567 (= res!688825 (bvsge #b00000000000000000000000000000000 (size!31668 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))))))))

(assert (=> d!123567 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) (mask!29897 thiss!1427)) e!581612)))

(assert (= (and d!123567 (not res!688825)) b!1030131))

(assert (= (and b!1030131 c!104282) b!1030130))

(assert (= (and b!1030131 (not c!104282)) b!1030129))

(assert (= (and b!1030130 res!688824) b!1030132))

(assert (= (or b!1030132 b!1030129) bm!43460))

(assert (=> b!1030130 m!949195))

(declare-fun m!949463 () Bool)

(assert (=> b!1030130 m!949463))

(declare-fun m!949465 () Bool)

(assert (=> b!1030130 m!949465))

(assert (=> b!1030130 m!949195))

(declare-fun m!949467 () Bool)

(assert (=> b!1030130 m!949467))

(assert (=> b!1030131 m!949195))

(assert (=> b!1030131 m!949195))

(assert (=> b!1030131 m!949225))

(declare-fun m!949469 () Bool)

(assert (=> bm!43460 m!949469))

(assert (=> b!1029733 d!123567))

(declare-fun d!123569 () Bool)

(assert (=> d!123569 (= (arrayCountValidKeys!0 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11294 thiss!1427) #b00000000000000000000000000000000 (size!31668 (_keys!11294 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!123569 true))

(declare-fun _$79!11 () Unit!33586)

(assert (=> d!123569 (= (choose!82 (_keys!11294 thiss!1427) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!11)))

(declare-fun bs!30061 () Bool)

(assert (= bs!30061 d!123569))

(assert (=> bs!30061 m!948771))

(assert (=> bs!30061 m!948931))

(assert (=> bs!30061 m!948781))

(assert (=> d!123421 d!123569))

(declare-fun d!123571 () Bool)

(declare-fun e!581615 () Bool)

(assert (=> d!123571 e!581615))

(declare-fun res!688826 () Bool)

(assert (=> d!123571 (=> res!688826 e!581615)))

(declare-fun lt!453799 () Bool)

(assert (=> d!123571 (= res!688826 (not lt!453799))))

(declare-fun lt!453800 () Bool)

(assert (=> d!123571 (= lt!453799 lt!453800)))

(declare-fun lt!453801 () Unit!33586)

(declare-fun e!581614 () Unit!33586)

(assert (=> d!123571 (= lt!453801 e!581614)))

(declare-fun c!104283 () Bool)

(assert (=> d!123571 (= c!104283 lt!453800)))

(assert (=> d!123571 (= lt!453800 (containsKey!562 (toList!6858 lt!453596) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123571 (= (contains!5992 lt!453596 #b0000000000000000000000000000000000000000000000000000000000000000) lt!453799)))

(declare-fun b!1030133 () Bool)

(declare-fun lt!453798 () Unit!33586)

(assert (=> b!1030133 (= e!581614 lt!453798)))

(assert (=> b!1030133 (= lt!453798 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6858 lt!453596) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030133 (isDefined!431 (getValueByKey!581 (toList!6858 lt!453596) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030134 () Bool)

(declare-fun Unit!33603 () Unit!33586)

(assert (=> b!1030134 (= e!581614 Unit!33603)))

(declare-fun b!1030135 () Bool)

(assert (=> b!1030135 (= e!581615 (isDefined!431 (getValueByKey!581 (toList!6858 lt!453596) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123571 c!104283) b!1030133))

(assert (= (and d!123571 (not c!104283)) b!1030134))

(assert (= (and d!123571 (not res!688826)) b!1030135))

(declare-fun m!949471 () Bool)

(assert (=> d!123571 m!949471))

(declare-fun m!949473 () Bool)

(assert (=> b!1030133 m!949473))

(assert (=> b!1030133 m!949293))

(assert (=> b!1030133 m!949293))

(declare-fun m!949475 () Bool)

(assert (=> b!1030133 m!949475))

(assert (=> b!1030135 m!949293))

(assert (=> b!1030135 m!949293))

(assert (=> b!1030135 m!949475))

(assert (=> bm!43433 d!123571))

(declare-fun d!123573 () Bool)

(declare-fun e!581616 () Bool)

(assert (=> d!123573 e!581616))

(declare-fun res!688827 () Bool)

(assert (=> d!123573 (=> (not res!688827) (not e!581616))))

(declare-fun lt!453805 () ListLongMap!13685)

(assert (=> d!123573 (= res!688827 (contains!5992 lt!453805 (_1!7787 (tuple2!15553 lt!453588 (minValue!5938 thiss!1427)))))))

(declare-fun lt!453803 () List!21802)

(assert (=> d!123573 (= lt!453805 (ListLongMap!13686 lt!453803))))

(declare-fun lt!453802 () Unit!33586)

(declare-fun lt!453804 () Unit!33586)

(assert (=> d!123573 (= lt!453802 lt!453804)))

(assert (=> d!123573 (= (getValueByKey!581 lt!453803 (_1!7787 (tuple2!15553 lt!453588 (minValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453588 (minValue!5938 thiss!1427)))))))

(assert (=> d!123573 (= lt!453804 (lemmaContainsTupThenGetReturnValue!277 lt!453803 (_1!7787 (tuple2!15553 lt!453588 (minValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453588 (minValue!5938 thiss!1427)))))))

(assert (=> d!123573 (= lt!453803 (insertStrictlySorted!370 (toList!6858 lt!453595) (_1!7787 (tuple2!15553 lt!453588 (minValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453588 (minValue!5938 thiss!1427)))))))

(assert (=> d!123573 (= (+!3121 lt!453595 (tuple2!15553 lt!453588 (minValue!5938 thiss!1427))) lt!453805)))

(declare-fun b!1030136 () Bool)

(declare-fun res!688828 () Bool)

(assert (=> b!1030136 (=> (not res!688828) (not e!581616))))

(assert (=> b!1030136 (= res!688828 (= (getValueByKey!581 (toList!6858 lt!453805) (_1!7787 (tuple2!15553 lt!453588 (minValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453588 (minValue!5938 thiss!1427))))))))

(declare-fun b!1030137 () Bool)

(assert (=> b!1030137 (= e!581616 (contains!5994 (toList!6858 lt!453805) (tuple2!15553 lt!453588 (minValue!5938 thiss!1427))))))

(assert (= (and d!123573 res!688827) b!1030136))

(assert (= (and b!1030136 res!688828) b!1030137))

(declare-fun m!949477 () Bool)

(assert (=> d!123573 m!949477))

(declare-fun m!949479 () Bool)

(assert (=> d!123573 m!949479))

(declare-fun m!949481 () Bool)

(assert (=> d!123573 m!949481))

(declare-fun m!949483 () Bool)

(assert (=> d!123573 m!949483))

(declare-fun m!949485 () Bool)

(assert (=> b!1030136 m!949485))

(declare-fun m!949487 () Bool)

(assert (=> b!1030137 m!949487))

(assert (=> b!1029808 d!123573))

(declare-fun d!123575 () Bool)

(declare-fun e!581617 () Bool)

(assert (=> d!123575 e!581617))

(declare-fun res!688829 () Bool)

(assert (=> d!123575 (=> (not res!688829) (not e!581617))))

(declare-fun lt!453809 () ListLongMap!13685)

(assert (=> d!123575 (= res!688829 (contains!5992 lt!453809 (_1!7787 (tuple2!15553 lt!453590 (minValue!5938 thiss!1427)))))))

(declare-fun lt!453807 () List!21802)

(assert (=> d!123575 (= lt!453809 (ListLongMap!13686 lt!453807))))

(declare-fun lt!453806 () Unit!33586)

(declare-fun lt!453808 () Unit!33586)

(assert (=> d!123575 (= lt!453806 lt!453808)))

(assert (=> d!123575 (= (getValueByKey!581 lt!453807 (_1!7787 (tuple2!15553 lt!453590 (minValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453590 (minValue!5938 thiss!1427)))))))

(assert (=> d!123575 (= lt!453808 (lemmaContainsTupThenGetReturnValue!277 lt!453807 (_1!7787 (tuple2!15553 lt!453590 (minValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453590 (minValue!5938 thiss!1427)))))))

(assert (=> d!123575 (= lt!453807 (insertStrictlySorted!370 (toList!6858 lt!453608) (_1!7787 (tuple2!15553 lt!453590 (minValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453590 (minValue!5938 thiss!1427)))))))

(assert (=> d!123575 (= (+!3121 lt!453608 (tuple2!15553 lt!453590 (minValue!5938 thiss!1427))) lt!453809)))

(declare-fun b!1030138 () Bool)

(declare-fun res!688830 () Bool)

(assert (=> b!1030138 (=> (not res!688830) (not e!581617))))

(assert (=> b!1030138 (= res!688830 (= (getValueByKey!581 (toList!6858 lt!453809) (_1!7787 (tuple2!15553 lt!453590 (minValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453590 (minValue!5938 thiss!1427))))))))

(declare-fun b!1030139 () Bool)

(assert (=> b!1030139 (= e!581617 (contains!5994 (toList!6858 lt!453809) (tuple2!15553 lt!453590 (minValue!5938 thiss!1427))))))

(assert (= (and d!123575 res!688829) b!1030138))

(assert (= (and b!1030138 res!688830) b!1030139))

(declare-fun m!949489 () Bool)

(assert (=> d!123575 m!949489))

(declare-fun m!949491 () Bool)

(assert (=> d!123575 m!949491))

(declare-fun m!949493 () Bool)

(assert (=> d!123575 m!949493))

(declare-fun m!949495 () Bool)

(assert (=> d!123575 m!949495))

(declare-fun m!949497 () Bool)

(assert (=> b!1030138 m!949497))

(declare-fun m!949499 () Bool)

(assert (=> b!1030139 m!949499))

(assert (=> b!1029808 d!123575))

(assert (=> b!1029808 d!123495))

(declare-fun d!123577 () Bool)

(assert (=> d!123577 (= (apply!910 (+!3121 lt!453595 (tuple2!15553 lt!453588 (minValue!5938 thiss!1427))) lt!453599) (get!16377 (getValueByKey!581 (toList!6858 (+!3121 lt!453595 (tuple2!15553 lt!453588 (minValue!5938 thiss!1427)))) lt!453599)))))

(declare-fun bs!30062 () Bool)

(assert (= bs!30062 d!123577))

(declare-fun m!949501 () Bool)

(assert (=> bs!30062 m!949501))

(assert (=> bs!30062 m!949501))

(declare-fun m!949503 () Bool)

(assert (=> bs!30062 m!949503))

(assert (=> b!1029808 d!123577))

(declare-fun d!123579 () Bool)

(assert (=> d!123579 (= (apply!910 (+!3121 lt!453608 (tuple2!15553 lt!453590 (minValue!5938 thiss!1427))) lt!453591) (apply!910 lt!453608 lt!453591))))

(declare-fun lt!453810 () Unit!33586)

(assert (=> d!123579 (= lt!453810 (choose!1690 lt!453608 lt!453590 (minValue!5938 thiss!1427) lt!453591))))

(declare-fun e!581618 () Bool)

(assert (=> d!123579 e!581618))

(declare-fun res!688831 () Bool)

(assert (=> d!123579 (=> (not res!688831) (not e!581618))))

(assert (=> d!123579 (= res!688831 (contains!5992 lt!453608 lt!453591))))

(assert (=> d!123579 (= (addApplyDifferent!476 lt!453608 lt!453590 (minValue!5938 thiss!1427) lt!453591) lt!453810)))

(declare-fun b!1030140 () Bool)

(assert (=> b!1030140 (= e!581618 (not (= lt!453591 lt!453590)))))

(assert (= (and d!123579 res!688831) b!1030140))

(declare-fun m!949505 () Bool)

(assert (=> d!123579 m!949505))

(assert (=> d!123579 m!949013))

(assert (=> d!123579 m!949013))

(assert (=> d!123579 m!949015))

(assert (=> d!123579 m!949027))

(declare-fun m!949507 () Bool)

(assert (=> d!123579 m!949507))

(assert (=> b!1029808 d!123579))

(declare-fun d!123581 () Bool)

(assert (=> d!123581 (= (apply!910 lt!453594 lt!453602) (get!16377 (getValueByKey!581 (toList!6858 lt!453594) lt!453602)))))

(declare-fun bs!30063 () Bool)

(assert (= bs!30063 d!123581))

(declare-fun m!949509 () Bool)

(assert (=> bs!30063 m!949509))

(assert (=> bs!30063 m!949509))

(declare-fun m!949511 () Bool)

(assert (=> bs!30063 m!949511))

(assert (=> b!1029808 d!123581))

(declare-fun d!123583 () Bool)

(assert (=> d!123583 (= (apply!910 (+!3121 lt!453595 (tuple2!15553 lt!453588 (minValue!5938 thiss!1427))) lt!453599) (apply!910 lt!453595 lt!453599))))

(declare-fun lt!453811 () Unit!33586)

(assert (=> d!123583 (= lt!453811 (choose!1690 lt!453595 lt!453588 (minValue!5938 thiss!1427) lt!453599))))

(declare-fun e!581619 () Bool)

(assert (=> d!123583 e!581619))

(declare-fun res!688832 () Bool)

(assert (=> d!123583 (=> (not res!688832) (not e!581619))))

(assert (=> d!123583 (= res!688832 (contains!5992 lt!453595 lt!453599))))

(assert (=> d!123583 (= (addApplyDifferent!476 lt!453595 lt!453588 (minValue!5938 thiss!1427) lt!453599) lt!453811)))

(declare-fun b!1030141 () Bool)

(assert (=> b!1030141 (= e!581619 (not (= lt!453599 lt!453588)))))

(assert (= (and d!123583 res!688832) b!1030141))

(declare-fun m!949513 () Bool)

(assert (=> d!123583 m!949513))

(assert (=> d!123583 m!949001))

(assert (=> d!123583 m!949001))

(assert (=> d!123583 m!949003))

(assert (=> d!123583 m!949025))

(declare-fun m!949515 () Bool)

(assert (=> d!123583 m!949515))

(assert (=> b!1029808 d!123583))

(declare-fun d!123585 () Bool)

(assert (=> d!123585 (= (apply!910 lt!453595 lt!453599) (get!16377 (getValueByKey!581 (toList!6858 lt!453595) lt!453599)))))

(declare-fun bs!30064 () Bool)

(assert (= bs!30064 d!123585))

(declare-fun m!949517 () Bool)

(assert (=> bs!30064 m!949517))

(assert (=> bs!30064 m!949517))

(declare-fun m!949519 () Bool)

(assert (=> bs!30064 m!949519))

(assert (=> b!1029808 d!123585))

(declare-fun d!123587 () Bool)

(assert (=> d!123587 (contains!5992 (+!3121 lt!453587 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427))) lt!453592)))

(declare-fun lt!453812 () Unit!33586)

(assert (=> d!123587 (= lt!453812 (choose!1691 lt!453587 lt!453603 (zeroValue!5938 thiss!1427) lt!453592))))

(assert (=> d!123587 (contains!5992 lt!453587 lt!453592)))

(assert (=> d!123587 (= (addStillContains!620 lt!453587 lt!453603 (zeroValue!5938 thiss!1427) lt!453592) lt!453812)))

(declare-fun bs!30065 () Bool)

(assert (= bs!30065 d!123587))

(assert (=> bs!30065 m!949009))

(assert (=> bs!30065 m!949009))

(assert (=> bs!30065 m!949011))

(declare-fun m!949521 () Bool)

(assert (=> bs!30065 m!949521))

(declare-fun m!949523 () Bool)

(assert (=> bs!30065 m!949523))

(assert (=> b!1029808 d!123587))

(declare-fun d!123589 () Bool)

(assert (=> d!123589 (= (apply!910 lt!453608 lt!453591) (get!16377 (getValueByKey!581 (toList!6858 lt!453608) lt!453591)))))

(declare-fun bs!30066 () Bool)

(assert (= bs!30066 d!123589))

(declare-fun m!949525 () Bool)

(assert (=> bs!30066 m!949525))

(assert (=> bs!30066 m!949525))

(declare-fun m!949527 () Bool)

(assert (=> bs!30066 m!949527))

(assert (=> b!1029808 d!123589))

(declare-fun d!123591 () Bool)

(declare-fun e!581621 () Bool)

(assert (=> d!123591 e!581621))

(declare-fun res!688833 () Bool)

(assert (=> d!123591 (=> res!688833 e!581621)))

(declare-fun lt!453814 () Bool)

(assert (=> d!123591 (= res!688833 (not lt!453814))))

(declare-fun lt!453815 () Bool)

(assert (=> d!123591 (= lt!453814 lt!453815)))

(declare-fun lt!453816 () Unit!33586)

(declare-fun e!581620 () Unit!33586)

(assert (=> d!123591 (= lt!453816 e!581620)))

(declare-fun c!104284 () Bool)

(assert (=> d!123591 (= c!104284 lt!453815)))

(assert (=> d!123591 (= lt!453815 (containsKey!562 (toList!6858 (+!3121 lt!453587 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427)))) lt!453592))))

(assert (=> d!123591 (= (contains!5992 (+!3121 lt!453587 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427))) lt!453592) lt!453814)))

(declare-fun b!1030142 () Bool)

(declare-fun lt!453813 () Unit!33586)

(assert (=> b!1030142 (= e!581620 lt!453813)))

(assert (=> b!1030142 (= lt!453813 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6858 (+!3121 lt!453587 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427)))) lt!453592))))

(assert (=> b!1030142 (isDefined!431 (getValueByKey!581 (toList!6858 (+!3121 lt!453587 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427)))) lt!453592))))

(declare-fun b!1030143 () Bool)

(declare-fun Unit!33604 () Unit!33586)

(assert (=> b!1030143 (= e!581620 Unit!33604)))

(declare-fun b!1030144 () Bool)

(assert (=> b!1030144 (= e!581621 (isDefined!431 (getValueByKey!581 (toList!6858 (+!3121 lt!453587 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427)))) lt!453592)))))

(assert (= (and d!123591 c!104284) b!1030142))

(assert (= (and d!123591 (not c!104284)) b!1030143))

(assert (= (and d!123591 (not res!688833)) b!1030144))

(declare-fun m!949529 () Bool)

(assert (=> d!123591 m!949529))

(declare-fun m!949531 () Bool)

(assert (=> b!1030142 m!949531))

(declare-fun m!949533 () Bool)

(assert (=> b!1030142 m!949533))

(assert (=> b!1030142 m!949533))

(declare-fun m!949535 () Bool)

(assert (=> b!1030142 m!949535))

(assert (=> b!1030144 m!949533))

(assert (=> b!1030144 m!949533))

(assert (=> b!1030144 m!949535))

(assert (=> b!1029808 d!123591))

(declare-fun d!123593 () Bool)

(assert (=> d!123593 (= (apply!910 (+!3121 lt!453608 (tuple2!15553 lt!453590 (minValue!5938 thiss!1427))) lt!453591) (get!16377 (getValueByKey!581 (toList!6858 (+!3121 lt!453608 (tuple2!15553 lt!453590 (minValue!5938 thiss!1427)))) lt!453591)))))

(declare-fun bs!30067 () Bool)

(assert (= bs!30067 d!123593))

(declare-fun m!949537 () Bool)

(assert (=> bs!30067 m!949537))

(assert (=> bs!30067 m!949537))

(declare-fun m!949539 () Bool)

(assert (=> bs!30067 m!949539))

(assert (=> b!1029808 d!123593))

(declare-fun d!123595 () Bool)

(declare-fun e!581622 () Bool)

(assert (=> d!123595 e!581622))

(declare-fun res!688834 () Bool)

(assert (=> d!123595 (=> (not res!688834) (not e!581622))))

(declare-fun lt!453820 () ListLongMap!13685)

(assert (=> d!123595 (= res!688834 (contains!5992 lt!453820 (_1!7787 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427)))))))

(declare-fun lt!453818 () List!21802)

(assert (=> d!123595 (= lt!453820 (ListLongMap!13686 lt!453818))))

(declare-fun lt!453817 () Unit!33586)

(declare-fun lt!453819 () Unit!33586)

(assert (=> d!123595 (= lt!453817 lt!453819)))

(assert (=> d!123595 (= (getValueByKey!581 lt!453818 (_1!7787 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!123595 (= lt!453819 (lemmaContainsTupThenGetReturnValue!277 lt!453818 (_1!7787 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!123595 (= lt!453818 (insertStrictlySorted!370 (toList!6858 lt!453587) (_1!7787 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!123595 (= (+!3121 lt!453587 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427))) lt!453820)))

(declare-fun b!1030145 () Bool)

(declare-fun res!688835 () Bool)

(assert (=> b!1030145 (=> (not res!688835) (not e!581622))))

(assert (=> b!1030145 (= res!688835 (= (getValueByKey!581 (toList!6858 lt!453820) (_1!7787 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427))))))))

(declare-fun b!1030146 () Bool)

(assert (=> b!1030146 (= e!581622 (contains!5994 (toList!6858 lt!453820) (tuple2!15553 lt!453603 (zeroValue!5938 thiss!1427))))))

(assert (= (and d!123595 res!688834) b!1030145))

(assert (= (and b!1030145 res!688835) b!1030146))

(declare-fun m!949541 () Bool)

(assert (=> d!123595 m!949541))

(declare-fun m!949543 () Bool)

(assert (=> d!123595 m!949543))

(declare-fun m!949545 () Bool)

(assert (=> d!123595 m!949545))

(declare-fun m!949547 () Bool)

(assert (=> d!123595 m!949547))

(declare-fun m!949549 () Bool)

(assert (=> b!1030145 m!949549))

(declare-fun m!949551 () Bool)

(assert (=> b!1030146 m!949551))

(assert (=> b!1029808 d!123595))

(declare-fun d!123597 () Bool)

(assert (=> d!123597 (= (apply!910 (+!3121 lt!453594 (tuple2!15553 lt!453601 (zeroValue!5938 thiss!1427))) lt!453602) (apply!910 lt!453594 lt!453602))))

(declare-fun lt!453821 () Unit!33586)

(assert (=> d!123597 (= lt!453821 (choose!1690 lt!453594 lt!453601 (zeroValue!5938 thiss!1427) lt!453602))))

(declare-fun e!581623 () Bool)

(assert (=> d!123597 e!581623))

(declare-fun res!688836 () Bool)

(assert (=> d!123597 (=> (not res!688836) (not e!581623))))

(assert (=> d!123597 (= res!688836 (contains!5992 lt!453594 lt!453602))))

(assert (=> d!123597 (= (addApplyDifferent!476 lt!453594 lt!453601 (zeroValue!5938 thiss!1427) lt!453602) lt!453821)))

(declare-fun b!1030147 () Bool)

(assert (=> b!1030147 (= e!581623 (not (= lt!453602 lt!453601)))))

(assert (= (and d!123597 res!688836) b!1030147))

(declare-fun m!949553 () Bool)

(assert (=> d!123597 m!949553))

(assert (=> d!123597 m!948999))

(assert (=> d!123597 m!948999))

(assert (=> d!123597 m!949017))

(assert (=> d!123597 m!949019))

(declare-fun m!949555 () Bool)

(assert (=> d!123597 m!949555))

(assert (=> b!1029808 d!123597))

(declare-fun d!123599 () Bool)

(declare-fun e!581624 () Bool)

(assert (=> d!123599 e!581624))

(declare-fun res!688837 () Bool)

(assert (=> d!123599 (=> (not res!688837) (not e!581624))))

(declare-fun lt!453825 () ListLongMap!13685)

(assert (=> d!123599 (= res!688837 (contains!5992 lt!453825 (_1!7787 (tuple2!15553 lt!453601 (zeroValue!5938 thiss!1427)))))))

(declare-fun lt!453823 () List!21802)

(assert (=> d!123599 (= lt!453825 (ListLongMap!13686 lt!453823))))

(declare-fun lt!453822 () Unit!33586)

(declare-fun lt!453824 () Unit!33586)

(assert (=> d!123599 (= lt!453822 lt!453824)))

(assert (=> d!123599 (= (getValueByKey!581 lt!453823 (_1!7787 (tuple2!15553 lt!453601 (zeroValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453601 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!123599 (= lt!453824 (lemmaContainsTupThenGetReturnValue!277 lt!453823 (_1!7787 (tuple2!15553 lt!453601 (zeroValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453601 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!123599 (= lt!453823 (insertStrictlySorted!370 (toList!6858 lt!453594) (_1!7787 (tuple2!15553 lt!453601 (zeroValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 lt!453601 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!123599 (= (+!3121 lt!453594 (tuple2!15553 lt!453601 (zeroValue!5938 thiss!1427))) lt!453825)))

(declare-fun b!1030148 () Bool)

(declare-fun res!688838 () Bool)

(assert (=> b!1030148 (=> (not res!688838) (not e!581624))))

(assert (=> b!1030148 (= res!688838 (= (getValueByKey!581 (toList!6858 lt!453825) (_1!7787 (tuple2!15553 lt!453601 (zeroValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 lt!453601 (zeroValue!5938 thiss!1427))))))))

(declare-fun b!1030149 () Bool)

(assert (=> b!1030149 (= e!581624 (contains!5994 (toList!6858 lt!453825) (tuple2!15553 lt!453601 (zeroValue!5938 thiss!1427))))))

(assert (= (and d!123599 res!688837) b!1030148))

(assert (= (and b!1030148 res!688838) b!1030149))

(declare-fun m!949557 () Bool)

(assert (=> d!123599 m!949557))

(declare-fun m!949559 () Bool)

(assert (=> d!123599 m!949559))

(declare-fun m!949561 () Bool)

(assert (=> d!123599 m!949561))

(declare-fun m!949563 () Bool)

(assert (=> d!123599 m!949563))

(declare-fun m!949565 () Bool)

(assert (=> b!1030148 m!949565))

(declare-fun m!949567 () Bool)

(assert (=> b!1030149 m!949567))

(assert (=> b!1029808 d!123599))

(declare-fun d!123601 () Bool)

(assert (=> d!123601 (= (apply!910 (+!3121 lt!453594 (tuple2!15553 lt!453601 (zeroValue!5938 thiss!1427))) lt!453602) (get!16377 (getValueByKey!581 (toList!6858 (+!3121 lt!453594 (tuple2!15553 lt!453601 (zeroValue!5938 thiss!1427)))) lt!453602)))))

(declare-fun bs!30068 () Bool)

(assert (= bs!30068 d!123601))

(declare-fun m!949569 () Bool)

(assert (=> bs!30068 m!949569))

(assert (=> bs!30068 m!949569))

(declare-fun m!949571 () Bool)

(assert (=> bs!30068 m!949571))

(assert (=> b!1029808 d!123601))

(declare-fun d!123603 () Bool)

(declare-fun e!581626 () Bool)

(assert (=> d!123603 e!581626))

(declare-fun res!688839 () Bool)

(assert (=> d!123603 (=> res!688839 e!581626)))

(declare-fun lt!453827 () Bool)

(assert (=> d!123603 (= res!688839 (not lt!453827))))

(declare-fun lt!453828 () Bool)

(assert (=> d!123603 (= lt!453827 lt!453828)))

(declare-fun lt!453829 () Unit!33586)

(declare-fun e!581625 () Unit!33586)

(assert (=> d!123603 (= lt!453829 e!581625)))

(declare-fun c!104285 () Bool)

(assert (=> d!123603 (= c!104285 lt!453828)))

(assert (=> d!123603 (= lt!453828 (containsKey!562 (toList!6858 lt!453574) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123603 (= (contains!5992 lt!453574 #b1000000000000000000000000000000000000000000000000000000000000000) lt!453827)))

(declare-fun b!1030150 () Bool)

(declare-fun lt!453826 () Unit!33586)

(assert (=> b!1030150 (= e!581625 lt!453826)))

(assert (=> b!1030150 (= lt!453826 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6858 lt!453574) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030150 (isDefined!431 (getValueByKey!581 (toList!6858 lt!453574) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030151 () Bool)

(declare-fun Unit!33605 () Unit!33586)

(assert (=> b!1030151 (= e!581625 Unit!33605)))

(declare-fun b!1030152 () Bool)

(assert (=> b!1030152 (= e!581626 (isDefined!431 (getValueByKey!581 (toList!6858 lt!453574) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123603 c!104285) b!1030150))

(assert (= (and d!123603 (not c!104285)) b!1030151))

(assert (= (and d!123603 (not res!688839)) b!1030152))

(declare-fun m!949573 () Bool)

(assert (=> d!123603 m!949573))

(declare-fun m!949575 () Bool)

(assert (=> b!1030150 m!949575))

(assert (=> b!1030150 m!949285))

(assert (=> b!1030150 m!949285))

(declare-fun m!949577 () Bool)

(assert (=> b!1030150 m!949577))

(assert (=> b!1030152 m!949285))

(assert (=> b!1030152 m!949285))

(assert (=> b!1030152 m!949577))

(assert (=> bm!43423 d!123603))

(declare-fun d!123605 () Bool)

(declare-fun e!581627 () Bool)

(assert (=> d!123605 e!581627))

(declare-fun res!688840 () Bool)

(assert (=> d!123605 (=> (not res!688840) (not e!581627))))

(declare-fun lt!453833 () ListLongMap!13685)

(assert (=> d!123605 (= res!688840 (contains!5992 lt!453833 (_1!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(declare-fun lt!453831 () List!21802)

(assert (=> d!123605 (= lt!453833 (ListLongMap!13686 lt!453831))))

(declare-fun lt!453830 () Unit!33586)

(declare-fun lt!453832 () Unit!33586)

(assert (=> d!123605 (= lt!453830 lt!453832)))

(assert (=> d!123605 (= (getValueByKey!581 lt!453831 (_1!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(assert (=> d!123605 (= lt!453832 (lemmaContainsTupThenGetReturnValue!277 lt!453831 (_1!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(assert (=> d!123605 (= lt!453831 (insertStrictlySorted!370 (toList!6858 call!43429) (_1!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))) (_2!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(assert (=> d!123605 (= (+!3121 call!43429 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))) lt!453833)))

(declare-fun b!1030153 () Bool)

(declare-fun res!688841 () Bool)

(assert (=> b!1030153 (=> (not res!688841) (not e!581627))))

(assert (=> b!1030153 (= res!688841 (= (getValueByKey!581 (toList!6858 lt!453833) (_1!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (Some!631 (_2!7787 (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(declare-fun b!1030154 () Bool)

(assert (=> b!1030154 (= e!581627 (contains!5994 (toList!6858 lt!453833) (tuple2!15553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))

(assert (= (and d!123605 res!688840) b!1030153))

(assert (= (and b!1030153 res!688841) b!1030154))

(declare-fun m!949579 () Bool)

(assert (=> d!123605 m!949579))

(declare-fun m!949581 () Bool)

(assert (=> d!123605 m!949581))

(declare-fun m!949583 () Bool)

(assert (=> d!123605 m!949583))

(declare-fun m!949585 () Bool)

(assert (=> d!123605 m!949585))

(declare-fun m!949587 () Bool)

(assert (=> b!1030153 m!949587))

(declare-fun m!949589 () Bool)

(assert (=> b!1030154 m!949589))

(assert (=> b!1029782 d!123605))

(declare-fun d!123607 () Bool)

(declare-fun res!688842 () Bool)

(declare-fun e!581628 () Bool)

(assert (=> d!123607 (=> res!688842 e!581628)))

(assert (=> d!123607 (= res!688842 (= (select (arr!31153 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123607 (= (arrayContainsKey!0 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) key!909 #b00000000000000000000000000000000) e!581628)))

(declare-fun b!1030155 () Bool)

(declare-fun e!581629 () Bool)

(assert (=> b!1030155 (= e!581628 e!581629)))

(declare-fun res!688843 () Bool)

(assert (=> b!1030155 (=> (not res!688843) (not e!581629))))

(assert (=> b!1030155 (= res!688843 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31668 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))))))))

(declare-fun b!1030156 () Bool)

(assert (=> b!1030156 (= e!581629 (arrayContainsKey!0 (array!64706 (store (arr!31153 (_keys!11294 thiss!1427)) (index!40904 lt!453434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31668 (_keys!11294 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123607 (not res!688842)) b!1030155))

(assert (= (and b!1030155 res!688843) b!1030156))

(assert (=> d!123607 m!949195))

(declare-fun m!949591 () Bool)

(assert (=> b!1030156 m!949591))

(assert (=> b!1029850 d!123607))

(declare-fun b!1030157 () Bool)

(declare-fun e!581631 () Bool)

(assert (=> b!1030157 (= e!581631 tp_is_empty!24301)))

(declare-fun b!1030158 () Bool)

(declare-fun e!581630 () Bool)

(assert (=> b!1030158 (= e!581630 tp_is_empty!24301)))

(declare-fun mapIsEmpty!37897 () Bool)

(declare-fun mapRes!37897 () Bool)

(assert (=> mapIsEmpty!37897 mapRes!37897))

(declare-fun condMapEmpty!37897 () Bool)

(declare-fun mapDefault!37897 () ValueCell!11447)

(assert (=> mapNonEmpty!37896 (= condMapEmpty!37897 (= mapRest!37896 ((as const (Array (_ BitVec 32) ValueCell!11447)) mapDefault!37897)))))

(assert (=> mapNonEmpty!37896 (= tp!72811 (and e!581630 mapRes!37897))))

(declare-fun mapNonEmpty!37897 () Bool)

(declare-fun tp!72812 () Bool)

(assert (=> mapNonEmpty!37897 (= mapRes!37897 (and tp!72812 e!581631))))

(declare-fun mapKey!37897 () (_ BitVec 32))

(declare-fun mapValue!37897 () ValueCell!11447)

(declare-fun mapRest!37897 () (Array (_ BitVec 32) ValueCell!11447))

(assert (=> mapNonEmpty!37897 (= mapRest!37896 (store mapRest!37897 mapKey!37897 mapValue!37897))))

(assert (= (and mapNonEmpty!37896 condMapEmpty!37897) mapIsEmpty!37897))

(assert (= (and mapNonEmpty!37896 (not condMapEmpty!37897)) mapNonEmpty!37897))

(assert (= (and mapNonEmpty!37897 ((_ is ValueCellFull!11447) mapValue!37897)) b!1030157))

(assert (= (and mapNonEmpty!37896 ((_ is ValueCellFull!11447) mapDefault!37897)) b!1030158))

(declare-fun m!949593 () Bool)

(assert (=> mapNonEmpty!37897 m!949593))

(declare-fun b_lambda!15825 () Bool)

(assert (= b_lambda!15813 (or (and b!1029620 b_free!20581) b_lambda!15825)))

(declare-fun b_lambda!15827 () Bool)

(assert (= b_lambda!15823 (or (and b!1029620 b_free!20581) b_lambda!15827)))

(declare-fun b_lambda!15829 () Bool)

(assert (= b_lambda!15821 (or (and b!1029620 b_free!20581) b_lambda!15829)))

(declare-fun b_lambda!15831 () Bool)

(assert (= b_lambda!15819 (or (and b!1029620 b_free!20581) b_lambda!15831)))

(declare-fun b_lambda!15833 () Bool)

(assert (= b_lambda!15817 (or (and b!1029620 b_free!20581) b_lambda!15833)))

(declare-fun b_lambda!15835 () Bool)

(assert (= b_lambda!15815 (or (and b!1029620 b_free!20581) b_lambda!15835)))

(check-sat (not d!123549) (not b!1029951) (not b!1030099) (not b!1030027) (not d!123605) (not b!1030061) (not b!1030101) (not b!1029969) (not b!1030108) (not d!123545) (not d!123509) (not b!1030029) (not d!123541) (not b!1030098) (not b!1029918) (not b_lambda!15809) (not b!1030104) (not b!1030136) (not b_lambda!15833) (not b!1030103) (not d!123475) (not b!1030018) (not b_lambda!15811) (not bm!43457) (not d!123473) (not b!1029983) (not b!1029908) (not b!1030028) (not d!123593) (not d!123513) (not d!123503) (not b!1030102) (not b!1030148) (not b!1029986) (not d!123563) (not bm!43451) (not b!1030150) (not bm!43460) (not b!1030065) (not d!123525) (not b!1029963) (not b!1030154) (not bm!43445) (not b!1029926) (not b!1030033) (not d!123553) (not b!1029879) (not b!1029886) (not b!1029961) (not b!1030109) (not b!1030100) (not b!1030124) (not b!1030145) (not b!1029958) (not b!1030130) (not b!1030062) (not d!123555) (not b!1030037) (not d!123583) (not d!123469) (not d!123557) (not b_lambda!15827) (not d!123489) (not bm!43446) (not b!1030127) (not d!123573) (not d!123529) (not d!123533) (not b!1030022) (not d!123531) (not b!1030030) (not d!123543) (not b!1030122) (not d!123601) (not d!123569) (not b!1029952) (not d!123547) (not b!1030146) (not b!1030113) (not bm!43442) (not b!1030039) (not b!1029967) (not b!1030042) (not b_lambda!15829) (not b_lambda!15807) (not b!1030131) (not b!1030063) (not d!123599) (not d!123577) (not b!1030097) (not d!123575) b_and!32901 (not b!1030138) (not d!123485) (not bm!43459) (not d!123479) (not b!1029965) (not b!1029970) (not d!123481) (not d!123597) (not d!123517) (not bm!43449) (not b!1029975) (not b!1030014) (not b!1030019) (not b!1030149) (not d!123587) tp_is_empty!24301 (not bm!43441) (not bm!43443) (not mapNonEmpty!37897) (not b!1030121) (not b!1030034) (not d!123463) (not b!1030156) (not b!1030024) (not b!1030153) (not b!1030091) (not bm!43454) (not b!1030152) (not b!1030137) (not b!1030016) (not b!1029942) (not b!1029878) (not d!123501) (not b!1029946) (not b!1029874) (not d!123459) (not d!123579) (not b!1029888) (not b!1030060) (not d!123521) (not b!1030067) (not b!1030144) (not b!1030038) (not b_lambda!15835) (not b!1030040) (not b!1030032) (not b!1029922) (not d!123537) (not d!123539) (not b!1030139) (not b!1030106) (not bm!43456) (not b!1029876) (not b!1029919) (not b_next!20581) (not b!1029923) (not d!123515) (not d!123535) (not d!123505) (not b!1030114) (not d!123445) (not b!1030023) (not b!1030135) (not b!1030133) (not d!123495) (not d!123449) (not d!123589) (not d!123571) (not b!1030053) (not bm!43455) (not b!1030112) (not b!1030126) (not b!1029945) (not b!1029981) (not b!1029960) (not b!1029973) (not b!1030054) (not d!123507) (not d!123603) (not d!123585) (not b_lambda!15831) (not d!123453) (not b!1029885) (not d!123595) (not d!123561) (not b_lambda!15799) (not b_lambda!15825) (not b!1030120) (not b!1030142) (not bm!43458) (not d!123491) (not d!123559) (not d!123581) (not b!1030013) (not d!123565) (not bm!43447) (not d!123591) (not d!123551))
(check-sat b_and!32901 (not b_next!20581))
