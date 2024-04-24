; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91966 () Bool)

(assert start!91966)

(declare-fun b!1045316 () Bool)

(declare-fun b_free!21109 () Bool)

(declare-fun b_next!21109 () Bool)

(assert (=> b!1045316 (= b_free!21109 (not b_next!21109))))

(declare-fun tp!74570 () Bool)

(declare-fun b_and!33675 () Bool)

(assert (=> b!1045316 (= tp!74570 b_and!33675)))

(declare-fun res!695933 () Bool)

(declare-fun e!592447 () Bool)

(assert (=> start!91966 (=> (not res!695933) (not e!592447))))

(declare-datatypes ((V!37979 0))(
  ( (V!37980 (val!12465 Int)) )
))
(declare-datatypes ((ValueCell!11711 0))(
  ( (ValueCellFull!11711 (v!15052 V!37979)) (EmptyCell!11711) )
))
(declare-datatypes ((array!65873 0))(
  ( (array!65874 (arr!31681 (Array (_ BitVec 32) (_ BitVec 64))) (size!32217 (_ BitVec 32))) )
))
(declare-datatypes ((array!65875 0))(
  ( (array!65876 (arr!31682 (Array (_ BitVec 32) ValueCell!11711)) (size!32218 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6016 0))(
  ( (LongMapFixedSize!6017 (defaultEntry!6394 Int) (mask!30555 (_ BitVec 32)) (extraKeys!6122 (_ BitVec 32)) (zeroValue!6228 V!37979) (minValue!6228 V!37979) (_size!3063 (_ BitVec 32)) (_keys!11694 array!65873) (_values!6417 array!65875) (_vacant!3063 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6016)

(declare-fun valid!2263 (LongMapFixedSize!6016) Bool)

(assert (=> start!91966 (= res!695933 (valid!2263 thiss!1427))))

(assert (=> start!91966 e!592447))

(declare-fun e!592446 () Bool)

(assert (=> start!91966 e!592446))

(assert (=> start!91966 true))

(declare-fun tp_is_empty!24829 () Bool)

(declare-fun e!592451 () Bool)

(declare-fun array_inv!24485 (array!65873) Bool)

(declare-fun array_inv!24486 (array!65875) Bool)

(assert (=> b!1045316 (= e!592446 (and tp!74570 tp_is_empty!24829 (array_inv!24485 (_keys!11694 thiss!1427)) (array_inv!24486 (_values!6417 thiss!1427)) e!592451))))

(declare-fun b!1045317 () Bool)

(declare-fun e!592450 () Bool)

(assert (=> b!1045317 (= e!592450 tp_is_empty!24829)))

(declare-fun b!1045318 () Bool)

(declare-fun e!592445 () Bool)

(assert (=> b!1045318 (= e!592445 tp_is_empty!24829)))

(declare-fun b!1045319 () Bool)

(declare-fun e!592449 () Bool)

(assert (=> b!1045319 (= e!592447 e!592449)))

(declare-fun res!695931 () Bool)

(assert (=> b!1045319 (=> (not res!695931) (not e!592449))))

(declare-datatypes ((SeekEntryResult!9792 0))(
  ( (MissingZero!9792 (index!41539 (_ BitVec 32))) (Found!9792 (index!41540 (_ BitVec 32))) (Intermediate!9792 (undefined!10604 Bool) (index!41541 (_ BitVec 32)) (x!93196 (_ BitVec 32))) (Undefined!9792) (MissingVacant!9792 (index!41542 (_ BitVec 32))) )
))
(declare-fun lt!460880 () SeekEntryResult!9792)

(get-info :version)

(assert (=> b!1045319 (= res!695931 ((_ is Found!9792) lt!460880))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65873 (_ BitVec 32)) SeekEntryResult!9792)

(assert (=> b!1045319 (= lt!460880 (seekEntry!0 key!909 (_keys!11694 thiss!1427) (mask!30555 thiss!1427)))))

(declare-fun b!1045320 () Bool)

(declare-fun e!592448 () Bool)

(assert (=> b!1045320 (= e!592449 (not e!592448))))

(declare-fun res!695934 () Bool)

(assert (=> b!1045320 (=> res!695934 e!592448)))

(declare-datatypes ((Unit!34095 0))(
  ( (Unit!34096) )
))
(declare-datatypes ((tuple2!15740 0))(
  ( (tuple2!15741 (_1!7881 Unit!34095) (_2!7881 LongMapFixedSize!6016)) )
))
(declare-fun lt!460885 () tuple2!15740)

(declare-datatypes ((tuple2!15742 0))(
  ( (tuple2!15743 (_1!7882 (_ BitVec 64)) (_2!7882 V!37979)) )
))
(declare-datatypes ((List!21987 0))(
  ( (Nil!21984) (Cons!21983 (h!23200 tuple2!15742) (t!31207 List!21987)) )
))
(declare-datatypes ((ListLongMap!13775 0))(
  ( (ListLongMap!13776 (toList!6903 List!21987)) )
))
(declare-fun contains!6092 (ListLongMap!13775 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3947 (array!65873 array!65875 (_ BitVec 32) (_ BitVec 32) V!37979 V!37979 (_ BitVec 32) Int) ListLongMap!13775)

(assert (=> b!1045320 (= res!695934 (not (contains!6092 (getCurrentListMap!3947 (_keys!11694 (_2!7881 lt!460885)) (_values!6417 (_2!7881 lt!460885)) (mask!30555 (_2!7881 lt!460885)) (extraKeys!6122 (_2!7881 lt!460885)) (zeroValue!6228 (_2!7881 lt!460885)) (minValue!6228 (_2!7881 lt!460885)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7881 lt!460885))) key!909)))))

(declare-fun lt!460878 () array!65875)

(declare-fun lt!460884 () array!65873)

(declare-fun Unit!34097 () Unit!34095)

(declare-fun Unit!34098 () Unit!34095)

(assert (=> b!1045320 (= lt!460885 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3063 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15741 Unit!34097 (LongMapFixedSize!6017 (defaultEntry!6394 thiss!1427) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) (bvsub (_size!3063 thiss!1427) #b00000000000000000000000000000001) lt!460884 lt!460878 (bvadd #b00000000000000000000000000000001 (_vacant!3063 thiss!1427)))) (tuple2!15741 Unit!34098 (LongMapFixedSize!6017 (defaultEntry!6394 thiss!1427) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) (bvsub (_size!3063 thiss!1427) #b00000000000000000000000000000001) lt!460884 lt!460878 (_vacant!3063 thiss!1427)))))))

(declare-fun -!526 (ListLongMap!13775 (_ BitVec 64)) ListLongMap!13775)

(assert (=> b!1045320 (= (-!526 (getCurrentListMap!3947 (_keys!11694 thiss!1427) (_values!6417 thiss!1427) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)) key!909) (getCurrentListMap!3947 lt!460884 lt!460878 (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun dynLambda!2018 (Int (_ BitVec 64)) V!37979)

(assert (=> b!1045320 (= lt!460878 (array!65876 (store (arr!31682 (_values!6417 thiss!1427)) (index!41540 lt!460880) (ValueCellFull!11711 (dynLambda!2018 (defaultEntry!6394 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32218 (_values!6417 thiss!1427))))))

(declare-fun lt!460882 () Unit!34095)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!48 (array!65873 array!65875 (_ BitVec 32) (_ BitVec 32) V!37979 V!37979 (_ BitVec 32) (_ BitVec 64) Int) Unit!34095)

(assert (=> b!1045320 (= lt!460882 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!48 (_keys!11694 thiss!1427) (_values!6417 thiss!1427) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) (index!41540 lt!460880) key!909 (defaultEntry!6394 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1045320 (not (arrayContainsKey!0 lt!460884 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460879 () Unit!34095)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65873 (_ BitVec 32) (_ BitVec 64)) Unit!34095)

(assert (=> b!1045320 (= lt!460879 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11694 thiss!1427) (index!41540 lt!460880) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65873 (_ BitVec 32)) Bool)

(assert (=> b!1045320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460884 (mask!30555 thiss!1427))))

(declare-fun lt!460881 () Unit!34095)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65873 (_ BitVec 32) (_ BitVec 32)) Unit!34095)

(assert (=> b!1045320 (= lt!460881 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11694 thiss!1427) (index!41540 lt!460880) (mask!30555 thiss!1427)))))

(declare-datatypes ((List!21988 0))(
  ( (Nil!21985) (Cons!21984 (h!23201 (_ BitVec 64)) (t!31208 List!21988)) )
))
(declare-fun arrayNoDuplicates!0 (array!65873 (_ BitVec 32) List!21988) Bool)

(assert (=> b!1045320 (arrayNoDuplicates!0 lt!460884 #b00000000000000000000000000000000 Nil!21985)))

(declare-fun lt!460883 () Unit!34095)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65873 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21988) Unit!34095)

(assert (=> b!1045320 (= lt!460883 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11694 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41540 lt!460880) #b00000000000000000000000000000000 Nil!21985))))

(declare-fun arrayCountValidKeys!0 (array!65873 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1045320 (= (arrayCountValidKeys!0 lt!460884 #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11694 thiss!1427) #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1045320 (= lt!460884 (array!65874 (store (arr!31681 (_keys!11694 thiss!1427)) (index!41540 lt!460880) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32217 (_keys!11694 thiss!1427))))))

(declare-fun lt!460877 () Unit!34095)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65873 (_ BitVec 32) (_ BitVec 64)) Unit!34095)

(assert (=> b!1045320 (= lt!460877 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11694 thiss!1427) (index!41540 lt!460880) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38870 () Bool)

(declare-fun mapRes!38870 () Bool)

(declare-fun tp!74571 () Bool)

(assert (=> mapNonEmpty!38870 (= mapRes!38870 (and tp!74571 e!592445))))

(declare-fun mapValue!38870 () ValueCell!11711)

(declare-fun mapRest!38870 () (Array (_ BitVec 32) ValueCell!11711))

(declare-fun mapKey!38870 () (_ BitVec 32))

(assert (=> mapNonEmpty!38870 (= (arr!31682 (_values!6417 thiss!1427)) (store mapRest!38870 mapKey!38870 mapValue!38870))))

(declare-fun b!1045321 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045321 (= e!592448 (validMask!0 (mask!30555 (_2!7881 lt!460885))))))

(declare-fun b!1045322 () Bool)

(declare-fun res!695932 () Bool)

(assert (=> b!1045322 (=> (not res!695932) (not e!592447))))

(assert (=> b!1045322 (= res!695932 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38870 () Bool)

(assert (=> mapIsEmpty!38870 mapRes!38870))

(declare-fun b!1045323 () Bool)

(assert (=> b!1045323 (= e!592451 (and e!592450 mapRes!38870))))

(declare-fun condMapEmpty!38870 () Bool)

(declare-fun mapDefault!38870 () ValueCell!11711)

(assert (=> b!1045323 (= condMapEmpty!38870 (= (arr!31682 (_values!6417 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11711)) mapDefault!38870)))))

(assert (= (and start!91966 res!695933) b!1045322))

(assert (= (and b!1045322 res!695932) b!1045319))

(assert (= (and b!1045319 res!695931) b!1045320))

(assert (= (and b!1045320 (not res!695934)) b!1045321))

(assert (= (and b!1045323 condMapEmpty!38870) mapIsEmpty!38870))

(assert (= (and b!1045323 (not condMapEmpty!38870)) mapNonEmpty!38870))

(assert (= (and mapNonEmpty!38870 ((_ is ValueCellFull!11711) mapValue!38870)) b!1045318))

(assert (= (and b!1045323 ((_ is ValueCellFull!11711) mapDefault!38870)) b!1045317))

(assert (= b!1045316 b!1045323))

(assert (= start!91966 b!1045316))

(declare-fun b_lambda!16207 () Bool)

(assert (=> (not b_lambda!16207) (not b!1045320)))

(declare-fun t!31206 () Bool)

(declare-fun tb!7041 () Bool)

(assert (=> (and b!1045316 (= (defaultEntry!6394 thiss!1427) (defaultEntry!6394 thiss!1427)) t!31206) tb!7041))

(declare-fun result!14515 () Bool)

(assert (=> tb!7041 (= result!14515 tp_is_empty!24829)))

(assert (=> b!1045320 t!31206))

(declare-fun b_and!33677 () Bool)

(assert (= b_and!33675 (and (=> t!31206 result!14515) b_and!33677)))

(declare-fun m!964975 () Bool)

(assert (=> b!1045321 m!964975))

(declare-fun m!964977 () Bool)

(assert (=> mapNonEmpty!38870 m!964977))

(declare-fun m!964979 () Bool)

(assert (=> b!1045316 m!964979))

(declare-fun m!964981 () Bool)

(assert (=> b!1045316 m!964981))

(declare-fun m!964983 () Bool)

(assert (=> b!1045320 m!964983))

(declare-fun m!964985 () Bool)

(assert (=> b!1045320 m!964985))

(declare-fun m!964987 () Bool)

(assert (=> b!1045320 m!964987))

(declare-fun m!964989 () Bool)

(assert (=> b!1045320 m!964989))

(declare-fun m!964991 () Bool)

(assert (=> b!1045320 m!964991))

(declare-fun m!964993 () Bool)

(assert (=> b!1045320 m!964993))

(declare-fun m!964995 () Bool)

(assert (=> b!1045320 m!964995))

(declare-fun m!964997 () Bool)

(assert (=> b!1045320 m!964997))

(assert (=> b!1045320 m!964985))

(declare-fun m!964999 () Bool)

(assert (=> b!1045320 m!964999))

(declare-fun m!965001 () Bool)

(assert (=> b!1045320 m!965001))

(declare-fun m!965003 () Bool)

(assert (=> b!1045320 m!965003))

(declare-fun m!965005 () Bool)

(assert (=> b!1045320 m!965005))

(assert (=> b!1045320 m!965003))

(declare-fun m!965007 () Bool)

(assert (=> b!1045320 m!965007))

(declare-fun m!965009 () Bool)

(assert (=> b!1045320 m!965009))

(declare-fun m!965011 () Bool)

(assert (=> b!1045320 m!965011))

(declare-fun m!965013 () Bool)

(assert (=> b!1045320 m!965013))

(declare-fun m!965015 () Bool)

(assert (=> b!1045320 m!965015))

(declare-fun m!965017 () Bool)

(assert (=> b!1045320 m!965017))

(declare-fun m!965019 () Bool)

(assert (=> start!91966 m!965019))

(declare-fun m!965021 () Bool)

(assert (=> b!1045319 m!965021))

(check-sat tp_is_empty!24829 (not b!1045316) (not b!1045319) (not mapNonEmpty!38870) (not b_lambda!16207) (not b!1045320) (not start!91966) b_and!33677 (not b!1045321) (not b_next!21109))
(check-sat b_and!33677 (not b_next!21109))
(get-model)

(declare-fun b_lambda!16213 () Bool)

(assert (= b_lambda!16207 (or (and b!1045316 b_free!21109) b_lambda!16213)))

(check-sat tp_is_empty!24829 (not b!1045316) (not b!1045319) (not mapNonEmpty!38870) (not b_lambda!16213) (not b!1045320) (not start!91966) b_and!33677 (not b!1045321) (not b_next!21109))
(check-sat b_and!33677 (not b_next!21109))
(get-model)

(declare-fun b!1045390 () Bool)

(declare-fun e!592509 () SeekEntryResult!9792)

(declare-fun lt!460950 () SeekEntryResult!9792)

(assert (=> b!1045390 (= e!592509 (ite ((_ is MissingVacant!9792) lt!460950) (MissingZero!9792 (index!41542 lt!460950)) lt!460950))))

(declare-fun lt!460948 () SeekEntryResult!9792)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65873 (_ BitVec 32)) SeekEntryResult!9792)

(assert (=> b!1045390 (= lt!460950 (seekKeyOrZeroReturnVacant!0 (x!93196 lt!460948) (index!41541 lt!460948) (index!41541 lt!460948) key!909 (_keys!11694 thiss!1427) (mask!30555 thiss!1427)))))

(declare-fun b!1045391 () Bool)

(declare-fun e!592508 () SeekEntryResult!9792)

(assert (=> b!1045391 (= e!592508 (Found!9792 (index!41541 lt!460948)))))

(declare-fun b!1045392 () Bool)

(assert (=> b!1045392 (= e!592509 (MissingZero!9792 (index!41541 lt!460948)))))

(declare-fun d!126795 () Bool)

(declare-fun lt!460951 () SeekEntryResult!9792)

(assert (=> d!126795 (and (or ((_ is MissingVacant!9792) lt!460951) (not ((_ is Found!9792) lt!460951)) (and (bvsge (index!41540 lt!460951) #b00000000000000000000000000000000) (bvslt (index!41540 lt!460951) (size!32217 (_keys!11694 thiss!1427))))) (not ((_ is MissingVacant!9792) lt!460951)) (or (not ((_ is Found!9792) lt!460951)) (= (select (arr!31681 (_keys!11694 thiss!1427)) (index!41540 lt!460951)) key!909)))))

(declare-fun e!592507 () SeekEntryResult!9792)

(assert (=> d!126795 (= lt!460951 e!592507)))

(declare-fun c!106444 () Bool)

(assert (=> d!126795 (= c!106444 (and ((_ is Intermediate!9792) lt!460948) (undefined!10604 lt!460948)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65873 (_ BitVec 32)) SeekEntryResult!9792)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126795 (= lt!460948 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30555 thiss!1427)) key!909 (_keys!11694 thiss!1427) (mask!30555 thiss!1427)))))

(assert (=> d!126795 (validMask!0 (mask!30555 thiss!1427))))

(assert (=> d!126795 (= (seekEntry!0 key!909 (_keys!11694 thiss!1427) (mask!30555 thiss!1427)) lt!460951)))

(declare-fun b!1045393 () Bool)

(assert (=> b!1045393 (= e!592507 e!592508)))

(declare-fun lt!460949 () (_ BitVec 64))

(assert (=> b!1045393 (= lt!460949 (select (arr!31681 (_keys!11694 thiss!1427)) (index!41541 lt!460948)))))

(declare-fun c!106443 () Bool)

(assert (=> b!1045393 (= c!106443 (= lt!460949 key!909))))

(declare-fun b!1045394 () Bool)

(assert (=> b!1045394 (= e!592507 Undefined!9792)))

(declare-fun b!1045395 () Bool)

(declare-fun c!106445 () Bool)

(assert (=> b!1045395 (= c!106445 (= lt!460949 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1045395 (= e!592508 e!592509)))

(assert (= (and d!126795 c!106444) b!1045394))

(assert (= (and d!126795 (not c!106444)) b!1045393))

(assert (= (and b!1045393 c!106443) b!1045391))

(assert (= (and b!1045393 (not c!106443)) b!1045395))

(assert (= (and b!1045395 c!106445) b!1045392))

(assert (= (and b!1045395 (not c!106445)) b!1045390))

(declare-fun m!965119 () Bool)

(assert (=> b!1045390 m!965119))

(declare-fun m!965121 () Bool)

(assert (=> d!126795 m!965121))

(declare-fun m!965123 () Bool)

(assert (=> d!126795 m!965123))

(assert (=> d!126795 m!965123))

(declare-fun m!965125 () Bool)

(assert (=> d!126795 m!965125))

(declare-fun m!965127 () Bool)

(assert (=> d!126795 m!965127))

(declare-fun m!965129 () Bool)

(assert (=> b!1045393 m!965129))

(assert (=> b!1045319 d!126795))

(declare-fun d!126797 () Bool)

(declare-fun e!592512 () Bool)

(assert (=> d!126797 e!592512))

(declare-fun res!695961 () Bool)

(assert (=> d!126797 (=> (not res!695961) (not e!592512))))

(assert (=> d!126797 (= res!695961 (and (bvsge (index!41540 lt!460880) #b00000000000000000000000000000000) (bvslt (index!41540 lt!460880) (size!32217 (_keys!11694 thiss!1427)))))))

(declare-fun lt!460954 () Unit!34095)

(declare-fun choose!53 (array!65873 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21988) Unit!34095)

(assert (=> d!126797 (= lt!460954 (choose!53 (_keys!11694 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41540 lt!460880) #b00000000000000000000000000000000 Nil!21985))))

(assert (=> d!126797 (bvslt (size!32217 (_keys!11694 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126797 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11694 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41540 lt!460880) #b00000000000000000000000000000000 Nil!21985) lt!460954)))

(declare-fun b!1045398 () Bool)

(assert (=> b!1045398 (= e!592512 (arrayNoDuplicates!0 (array!65874 (store (arr!31681 (_keys!11694 thiss!1427)) (index!41540 lt!460880) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32217 (_keys!11694 thiss!1427))) #b00000000000000000000000000000000 Nil!21985))))

(assert (= (and d!126797 res!695961) b!1045398))

(declare-fun m!965131 () Bool)

(assert (=> d!126797 m!965131))

(assert (=> b!1045398 m!964991))

(declare-fun m!965133 () Bool)

(assert (=> b!1045398 m!965133))

(assert (=> b!1045320 d!126797))

(declare-fun b!1045441 () Bool)

(declare-fun res!695983 () Bool)

(declare-fun e!592547 () Bool)

(assert (=> b!1045441 (=> (not res!695983) (not e!592547))))

(declare-fun e!592551 () Bool)

(assert (=> b!1045441 (= res!695983 e!592551)))

(declare-fun res!695988 () Bool)

(assert (=> b!1045441 (=> res!695988 e!592551)))

(declare-fun e!592546 () Bool)

(assert (=> b!1045441 (= res!695988 (not e!592546))))

(declare-fun res!695987 () Bool)

(assert (=> b!1045441 (=> (not res!695987) (not e!592546))))

(assert (=> b!1045441 (= res!695987 (bvslt #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))))))

(declare-fun bm!44377 () Bool)

(declare-fun call!44380 () Bool)

(declare-fun lt!461006 () ListLongMap!13775)

(assert (=> bm!44377 (= call!44380 (contains!6092 lt!461006 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44378 () Bool)

(declare-fun call!44383 () ListLongMap!13775)

(declare-fun call!44385 () ListLongMap!13775)

(assert (=> bm!44378 (= call!44383 call!44385)))

(declare-fun b!1045442 () Bool)

(declare-fun e!592539 () Bool)

(assert (=> b!1045442 (= e!592547 e!592539)))

(declare-fun c!106462 () Bool)

(assert (=> b!1045442 (= c!106462 (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045443 () Bool)

(declare-fun e!592544 () ListLongMap!13775)

(declare-fun call!44382 () ListLongMap!13775)

(assert (=> b!1045443 (= e!592544 call!44382)))

(declare-fun b!1045444 () Bool)

(declare-fun e!592542 () Bool)

(declare-fun apply!919 (ListLongMap!13775 (_ BitVec 64)) V!37979)

(declare-fun get!16576 (ValueCell!11711 V!37979) V!37979)

(assert (=> b!1045444 (= e!592542 (= (apply!919 lt!461006 (select (arr!31681 (_keys!11694 thiss!1427)) #b00000000000000000000000000000000)) (get!16576 (select (arr!31682 (_values!6417 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2018 (defaultEntry!6394 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045444 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32218 (_values!6417 thiss!1427))))))

(assert (=> b!1045444 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))))))

(declare-fun b!1045445 () Bool)

(declare-fun e!592549 () ListLongMap!13775)

(assert (=> b!1045445 (= e!592549 call!44382)))

(declare-fun b!1045446 () Bool)

(declare-fun e!592541 () Bool)

(assert (=> b!1045446 (= e!592539 e!592541)))

(declare-fun res!695984 () Bool)

(assert (=> b!1045446 (= res!695984 call!44380)))

(assert (=> b!1045446 (=> (not res!695984) (not e!592541))))

(declare-fun b!1045447 () Bool)

(declare-fun e!592545 () ListLongMap!13775)

(assert (=> b!1045447 (= e!592545 e!592549)))

(declare-fun c!106459 () Bool)

(assert (=> b!1045447 (= c!106459 (and (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44379 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3570 (array!65873 array!65875 (_ BitVec 32) (_ BitVec 32) V!37979 V!37979 (_ BitVec 32) Int) ListLongMap!13775)

(assert (=> bm!44379 (= call!44385 (getCurrentListMapNoExtraKeys!3570 (_keys!11694 thiss!1427) (_values!6417 thiss!1427) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun b!1045448 () Bool)

(declare-fun e!592548 () Bool)

(declare-fun e!592540 () Bool)

(assert (=> b!1045448 (= e!592548 e!592540)))

(declare-fun res!695985 () Bool)

(declare-fun call!44384 () Bool)

(assert (=> b!1045448 (= res!695985 call!44384)))

(assert (=> b!1045448 (=> (not res!695985) (not e!592540))))

(declare-fun b!1045449 () Bool)

(declare-fun res!695981 () Bool)

(assert (=> b!1045449 (=> (not res!695981) (not e!592547))))

(assert (=> b!1045449 (= res!695981 e!592548)))

(declare-fun c!106458 () Bool)

(assert (=> b!1045449 (= c!106458 (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045450 () Bool)

(declare-fun e!592543 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1045450 (= e!592543 (validKeyInArray!0 (select (arr!31681 (_keys!11694 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045451 () Bool)

(declare-fun call!44386 () ListLongMap!13775)

(assert (=> b!1045451 (= e!592544 call!44386)))

(declare-fun bm!44380 () Bool)

(declare-fun call!44381 () ListLongMap!13775)

(declare-fun c!106461 () Bool)

(declare-fun +!3130 (ListLongMap!13775 tuple2!15742) ListLongMap!13775)

(assert (=> bm!44380 (= call!44381 (+!3130 (ite c!106461 call!44385 (ite c!106459 call!44383 call!44386)) (ite (or c!106461 c!106459) (tuple2!15743 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6228 thiss!1427)) (tuple2!15743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6228 thiss!1427)))))))

(declare-fun b!1045452 () Bool)

(assert (=> b!1045452 (= e!592545 (+!3130 call!44381 (tuple2!15743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6228 thiss!1427))))))

(declare-fun d!126799 () Bool)

(assert (=> d!126799 e!592547))

(declare-fun res!695986 () Bool)

(assert (=> d!126799 (=> (not res!695986) (not e!592547))))

(assert (=> d!126799 (= res!695986 (or (bvsge #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))))))))

(declare-fun lt!461001 () ListLongMap!13775)

(assert (=> d!126799 (= lt!461006 lt!461001)))

(declare-fun lt!461019 () Unit!34095)

(declare-fun e!592550 () Unit!34095)

(assert (=> d!126799 (= lt!461019 e!592550)))

(declare-fun c!106460 () Bool)

(assert (=> d!126799 (= c!106460 e!592543)))

(declare-fun res!695982 () Bool)

(assert (=> d!126799 (=> (not res!695982) (not e!592543))))

(assert (=> d!126799 (= res!695982 (bvslt #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))))))

(assert (=> d!126799 (= lt!461001 e!592545)))

(assert (=> d!126799 (= c!106461 (and (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126799 (validMask!0 (mask!30555 thiss!1427))))

(assert (=> d!126799 (= (getCurrentListMap!3947 (_keys!11694 thiss!1427) (_values!6417 thiss!1427) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)) lt!461006)))

(declare-fun bm!44381 () Bool)

(assert (=> bm!44381 (= call!44386 call!44383)))

(declare-fun b!1045453 () Bool)

(assert (=> b!1045453 (= e!592541 (= (apply!919 lt!461006 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6228 thiss!1427)))))

(declare-fun b!1045454 () Bool)

(declare-fun Unit!34107 () Unit!34095)

(assert (=> b!1045454 (= e!592550 Unit!34107)))

(declare-fun b!1045455 () Bool)

(assert (=> b!1045455 (= e!592551 e!592542)))

(declare-fun res!695980 () Bool)

(assert (=> b!1045455 (=> (not res!695980) (not e!592542))))

(assert (=> b!1045455 (= res!695980 (contains!6092 lt!461006 (select (arr!31681 (_keys!11694 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1045455 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))))))

(declare-fun b!1045456 () Bool)

(assert (=> b!1045456 (= e!592539 (not call!44380))))

(declare-fun bm!44382 () Bool)

(assert (=> bm!44382 (= call!44382 call!44381)))

(declare-fun bm!44383 () Bool)

(assert (=> bm!44383 (= call!44384 (contains!6092 lt!461006 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045457 () Bool)

(declare-fun c!106463 () Bool)

(assert (=> b!1045457 (= c!106463 (and (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1045457 (= e!592549 e!592544)))

(declare-fun b!1045458 () Bool)

(assert (=> b!1045458 (= e!592546 (validKeyInArray!0 (select (arr!31681 (_keys!11694 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045459 () Bool)

(declare-fun lt!461020 () Unit!34095)

(assert (=> b!1045459 (= e!592550 lt!461020)))

(declare-fun lt!461013 () ListLongMap!13775)

(assert (=> b!1045459 (= lt!461013 (getCurrentListMapNoExtraKeys!3570 (_keys!11694 thiss!1427) (_values!6417 thiss!1427) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!461000 () (_ BitVec 64))

(assert (=> b!1045459 (= lt!461000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461003 () (_ BitVec 64))

(assert (=> b!1045459 (= lt!461003 (select (arr!31681 (_keys!11694 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461017 () Unit!34095)

(declare-fun addStillContains!629 (ListLongMap!13775 (_ BitVec 64) V!37979 (_ BitVec 64)) Unit!34095)

(assert (=> b!1045459 (= lt!461017 (addStillContains!629 lt!461013 lt!461000 (zeroValue!6228 thiss!1427) lt!461003))))

(assert (=> b!1045459 (contains!6092 (+!3130 lt!461013 (tuple2!15743 lt!461000 (zeroValue!6228 thiss!1427))) lt!461003)))

(declare-fun lt!461012 () Unit!34095)

(assert (=> b!1045459 (= lt!461012 lt!461017)))

(declare-fun lt!461004 () ListLongMap!13775)

(assert (=> b!1045459 (= lt!461004 (getCurrentListMapNoExtraKeys!3570 (_keys!11694 thiss!1427) (_values!6417 thiss!1427) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!461005 () (_ BitVec 64))

(assert (=> b!1045459 (= lt!461005 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461018 () (_ BitVec 64))

(assert (=> b!1045459 (= lt!461018 (select (arr!31681 (_keys!11694 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461007 () Unit!34095)

(declare-fun addApplyDifferent!485 (ListLongMap!13775 (_ BitVec 64) V!37979 (_ BitVec 64)) Unit!34095)

(assert (=> b!1045459 (= lt!461007 (addApplyDifferent!485 lt!461004 lt!461005 (minValue!6228 thiss!1427) lt!461018))))

(assert (=> b!1045459 (= (apply!919 (+!3130 lt!461004 (tuple2!15743 lt!461005 (minValue!6228 thiss!1427))) lt!461018) (apply!919 lt!461004 lt!461018))))

(declare-fun lt!461011 () Unit!34095)

(assert (=> b!1045459 (= lt!461011 lt!461007)))

(declare-fun lt!461016 () ListLongMap!13775)

(assert (=> b!1045459 (= lt!461016 (getCurrentListMapNoExtraKeys!3570 (_keys!11694 thiss!1427) (_values!6417 thiss!1427) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!461010 () (_ BitVec 64))

(assert (=> b!1045459 (= lt!461010 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461009 () (_ BitVec 64))

(assert (=> b!1045459 (= lt!461009 (select (arr!31681 (_keys!11694 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460999 () Unit!34095)

(assert (=> b!1045459 (= lt!460999 (addApplyDifferent!485 lt!461016 lt!461010 (zeroValue!6228 thiss!1427) lt!461009))))

(assert (=> b!1045459 (= (apply!919 (+!3130 lt!461016 (tuple2!15743 lt!461010 (zeroValue!6228 thiss!1427))) lt!461009) (apply!919 lt!461016 lt!461009))))

(declare-fun lt!461014 () Unit!34095)

(assert (=> b!1045459 (= lt!461014 lt!460999)))

(declare-fun lt!461008 () ListLongMap!13775)

(assert (=> b!1045459 (= lt!461008 (getCurrentListMapNoExtraKeys!3570 (_keys!11694 thiss!1427) (_values!6417 thiss!1427) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!461015 () (_ BitVec 64))

(assert (=> b!1045459 (= lt!461015 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461002 () (_ BitVec 64))

(assert (=> b!1045459 (= lt!461002 (select (arr!31681 (_keys!11694 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045459 (= lt!461020 (addApplyDifferent!485 lt!461008 lt!461015 (minValue!6228 thiss!1427) lt!461002))))

(assert (=> b!1045459 (= (apply!919 (+!3130 lt!461008 (tuple2!15743 lt!461015 (minValue!6228 thiss!1427))) lt!461002) (apply!919 lt!461008 lt!461002))))

(declare-fun b!1045460 () Bool)

(assert (=> b!1045460 (= e!592548 (not call!44384))))

(declare-fun b!1045461 () Bool)

(assert (=> b!1045461 (= e!592540 (= (apply!919 lt!461006 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6228 thiss!1427)))))

(assert (= (and d!126799 c!106461) b!1045452))

(assert (= (and d!126799 (not c!106461)) b!1045447))

(assert (= (and b!1045447 c!106459) b!1045445))

(assert (= (and b!1045447 (not c!106459)) b!1045457))

(assert (= (and b!1045457 c!106463) b!1045443))

(assert (= (and b!1045457 (not c!106463)) b!1045451))

(assert (= (or b!1045443 b!1045451) bm!44381))

(assert (= (or b!1045445 bm!44381) bm!44378))

(assert (= (or b!1045445 b!1045443) bm!44382))

(assert (= (or b!1045452 bm!44378) bm!44379))

(assert (= (or b!1045452 bm!44382) bm!44380))

(assert (= (and d!126799 res!695982) b!1045450))

(assert (= (and d!126799 c!106460) b!1045459))

(assert (= (and d!126799 (not c!106460)) b!1045454))

(assert (= (and d!126799 res!695986) b!1045441))

(assert (= (and b!1045441 res!695987) b!1045458))

(assert (= (and b!1045441 (not res!695988)) b!1045455))

(assert (= (and b!1045455 res!695980) b!1045444))

(assert (= (and b!1045441 res!695983) b!1045449))

(assert (= (and b!1045449 c!106458) b!1045448))

(assert (= (and b!1045449 (not c!106458)) b!1045460))

(assert (= (and b!1045448 res!695985) b!1045461))

(assert (= (or b!1045448 b!1045460) bm!44383))

(assert (= (and b!1045449 res!695981) b!1045442))

(assert (= (and b!1045442 c!106462) b!1045446))

(assert (= (and b!1045442 (not c!106462)) b!1045456))

(assert (= (and b!1045446 res!695984) b!1045453))

(assert (= (or b!1045446 b!1045456) bm!44377))

(declare-fun b_lambda!16215 () Bool)

(assert (=> (not b_lambda!16215) (not b!1045444)))

(assert (=> b!1045444 t!31206))

(declare-fun b_and!33687 () Bool)

(assert (= b_and!33677 (and (=> t!31206 result!14515) b_and!33687)))

(declare-fun m!965135 () Bool)

(assert (=> b!1045455 m!965135))

(assert (=> b!1045455 m!965135))

(declare-fun m!965137 () Bool)

(assert (=> b!1045455 m!965137))

(declare-fun m!965139 () Bool)

(assert (=> bm!44380 m!965139))

(assert (=> b!1045458 m!965135))

(assert (=> b!1045458 m!965135))

(declare-fun m!965141 () Bool)

(assert (=> b!1045458 m!965141))

(assert (=> d!126799 m!965127))

(declare-fun m!965143 () Bool)

(assert (=> bm!44377 m!965143))

(assert (=> b!1045450 m!965135))

(assert (=> b!1045450 m!965135))

(assert (=> b!1045450 m!965141))

(declare-fun m!965145 () Bool)

(assert (=> bm!44379 m!965145))

(declare-fun m!965147 () Bool)

(assert (=> b!1045452 m!965147))

(declare-fun m!965149 () Bool)

(assert (=> bm!44383 m!965149))

(assert (=> b!1045444 m!965135))

(declare-fun m!965151 () Bool)

(assert (=> b!1045444 m!965151))

(assert (=> b!1045444 m!965017))

(assert (=> b!1045444 m!965151))

(assert (=> b!1045444 m!965017))

(declare-fun m!965153 () Bool)

(assert (=> b!1045444 m!965153))

(assert (=> b!1045444 m!965135))

(declare-fun m!965155 () Bool)

(assert (=> b!1045444 m!965155))

(declare-fun m!965157 () Bool)

(assert (=> b!1045453 m!965157))

(declare-fun m!965159 () Bool)

(assert (=> b!1045461 m!965159))

(declare-fun m!965161 () Bool)

(assert (=> b!1045459 m!965161))

(assert (=> b!1045459 m!965135))

(declare-fun m!965163 () Bool)

(assert (=> b!1045459 m!965163))

(declare-fun m!965165 () Bool)

(assert (=> b!1045459 m!965165))

(declare-fun m!965167 () Bool)

(assert (=> b!1045459 m!965167))

(declare-fun m!965169 () Bool)

(assert (=> b!1045459 m!965169))

(declare-fun m!965171 () Bool)

(assert (=> b!1045459 m!965171))

(declare-fun m!965173 () Bool)

(assert (=> b!1045459 m!965173))

(assert (=> b!1045459 m!965145))

(declare-fun m!965175 () Bool)

(assert (=> b!1045459 m!965175))

(declare-fun m!965177 () Bool)

(assert (=> b!1045459 m!965177))

(assert (=> b!1045459 m!965171))

(declare-fun m!965179 () Bool)

(assert (=> b!1045459 m!965179))

(declare-fun m!965181 () Bool)

(assert (=> b!1045459 m!965181))

(declare-fun m!965183 () Bool)

(assert (=> b!1045459 m!965183))

(declare-fun m!965185 () Bool)

(assert (=> b!1045459 m!965185))

(declare-fun m!965187 () Bool)

(assert (=> b!1045459 m!965187))

(declare-fun m!965189 () Bool)

(assert (=> b!1045459 m!965189))

(assert (=> b!1045459 m!965165))

(assert (=> b!1045459 m!965183))

(assert (=> b!1045459 m!965175))

(assert (=> b!1045320 d!126799))

(declare-fun d!126801 () Bool)

(declare-fun e!592554 () Bool)

(assert (=> d!126801 e!592554))

(declare-fun res!695991 () Bool)

(assert (=> d!126801 (=> (not res!695991) (not e!592554))))

(assert (=> d!126801 (= res!695991 (bvslt (index!41540 lt!460880) (size!32217 (_keys!11694 thiss!1427))))))

(declare-fun lt!461023 () Unit!34095)

(declare-fun choose!121 (array!65873 (_ BitVec 32) (_ BitVec 64)) Unit!34095)

(assert (=> d!126801 (= lt!461023 (choose!121 (_keys!11694 thiss!1427) (index!41540 lt!460880) key!909))))

(assert (=> d!126801 (bvsge (index!41540 lt!460880) #b00000000000000000000000000000000)))

(assert (=> d!126801 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11694 thiss!1427) (index!41540 lt!460880) key!909) lt!461023)))

(declare-fun b!1045464 () Bool)

(assert (=> b!1045464 (= e!592554 (not (arrayContainsKey!0 (array!65874 (store (arr!31681 (_keys!11694 thiss!1427)) (index!41540 lt!460880) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32217 (_keys!11694 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126801 res!695991) b!1045464))

(declare-fun m!965191 () Bool)

(assert (=> d!126801 m!965191))

(assert (=> b!1045464 m!964991))

(declare-fun m!965193 () Bool)

(assert (=> b!1045464 m!965193))

(assert (=> b!1045320 d!126801))

(declare-fun d!126803 () Bool)

(declare-fun lt!461026 () ListLongMap!13775)

(assert (=> d!126803 (not (contains!6092 lt!461026 key!909))))

(declare-fun removeStrictlySorted!59 (List!21987 (_ BitVec 64)) List!21987)

(assert (=> d!126803 (= lt!461026 (ListLongMap!13776 (removeStrictlySorted!59 (toList!6903 (getCurrentListMap!3947 (_keys!11694 thiss!1427) (_values!6417 thiss!1427) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427))) key!909)))))

(assert (=> d!126803 (= (-!526 (getCurrentListMap!3947 (_keys!11694 thiss!1427) (_values!6417 thiss!1427) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)) key!909) lt!461026)))

(declare-fun bs!30531 () Bool)

(assert (= bs!30531 d!126803))

(declare-fun m!965195 () Bool)

(assert (=> bs!30531 m!965195))

(declare-fun m!965197 () Bool)

(assert (=> bs!30531 m!965197))

(assert (=> b!1045320 d!126803))

(declare-fun d!126805 () Bool)

(declare-fun e!592557 () Bool)

(assert (=> d!126805 e!592557))

(declare-fun res!695994 () Bool)

(assert (=> d!126805 (=> (not res!695994) (not e!592557))))

(assert (=> d!126805 (= res!695994 (and (bvsge (index!41540 lt!460880) #b00000000000000000000000000000000) (bvslt (index!41540 lt!460880) (size!32217 (_keys!11694 thiss!1427)))))))

(declare-fun lt!461029 () Unit!34095)

(declare-fun choose!1714 (array!65873 array!65875 (_ BitVec 32) (_ BitVec 32) V!37979 V!37979 (_ BitVec 32) (_ BitVec 64) Int) Unit!34095)

(assert (=> d!126805 (= lt!461029 (choose!1714 (_keys!11694 thiss!1427) (_values!6417 thiss!1427) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) (index!41540 lt!460880) key!909 (defaultEntry!6394 thiss!1427)))))

(assert (=> d!126805 (validMask!0 (mask!30555 thiss!1427))))

(assert (=> d!126805 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!48 (_keys!11694 thiss!1427) (_values!6417 thiss!1427) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) (index!41540 lt!460880) key!909 (defaultEntry!6394 thiss!1427)) lt!461029)))

(declare-fun b!1045467 () Bool)

(assert (=> b!1045467 (= e!592557 (= (-!526 (getCurrentListMap!3947 (_keys!11694 thiss!1427) (_values!6417 thiss!1427) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)) key!909) (getCurrentListMap!3947 (array!65874 (store (arr!31681 (_keys!11694 thiss!1427)) (index!41540 lt!460880) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32217 (_keys!11694 thiss!1427))) (array!65876 (store (arr!31682 (_values!6417 thiss!1427)) (index!41540 lt!460880) (ValueCellFull!11711 (dynLambda!2018 (defaultEntry!6394 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32218 (_values!6417 thiss!1427))) (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427))))))

(assert (=> b!1045467 (bvslt (index!41540 lt!460880) (size!32218 (_values!6417 thiss!1427)))))

(assert (= (and d!126805 res!695994) b!1045467))

(declare-fun b_lambda!16217 () Bool)

(assert (=> (not b_lambda!16217) (not b!1045467)))

(assert (=> b!1045467 t!31206))

(declare-fun b_and!33689 () Bool)

(assert (= b_and!33687 (and (=> t!31206 result!14515) b_and!33689)))

(declare-fun m!965199 () Bool)

(assert (=> d!126805 m!965199))

(assert (=> d!126805 m!965127))

(assert (=> b!1045467 m!965003))

(assert (=> b!1045467 m!965005))

(assert (=> b!1045467 m!964991))

(assert (=> b!1045467 m!965003))

(declare-fun m!965201 () Bool)

(assert (=> b!1045467 m!965201))

(assert (=> b!1045467 m!964993))

(assert (=> b!1045467 m!965017))

(assert (=> b!1045320 d!126805))

(declare-fun b!1045468 () Bool)

(declare-fun res!695998 () Bool)

(declare-fun e!592566 () Bool)

(assert (=> b!1045468 (=> (not res!695998) (not e!592566))))

(declare-fun e!592570 () Bool)

(assert (=> b!1045468 (= res!695998 e!592570)))

(declare-fun res!696003 () Bool)

(assert (=> b!1045468 (=> res!696003 e!592570)))

(declare-fun e!592565 () Bool)

(assert (=> b!1045468 (= res!696003 (not e!592565))))

(declare-fun res!696002 () Bool)

(assert (=> b!1045468 (=> (not res!696002) (not e!592565))))

(assert (=> b!1045468 (= res!696002 (bvslt #b00000000000000000000000000000000 (size!32217 lt!460884)))))

(declare-fun bm!44384 () Bool)

(declare-fun call!44387 () Bool)

(declare-fun lt!461037 () ListLongMap!13775)

(assert (=> bm!44384 (= call!44387 (contains!6092 lt!461037 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44385 () Bool)

(declare-fun call!44390 () ListLongMap!13775)

(declare-fun call!44392 () ListLongMap!13775)

(assert (=> bm!44385 (= call!44390 call!44392)))

(declare-fun b!1045469 () Bool)

(declare-fun e!592558 () Bool)

(assert (=> b!1045469 (= e!592566 e!592558)))

(declare-fun c!106468 () Bool)

(assert (=> b!1045469 (= c!106468 (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045470 () Bool)

(declare-fun e!592563 () ListLongMap!13775)

(declare-fun call!44389 () ListLongMap!13775)

(assert (=> b!1045470 (= e!592563 call!44389)))

(declare-fun e!592561 () Bool)

(declare-fun b!1045471 () Bool)

(assert (=> b!1045471 (= e!592561 (= (apply!919 lt!461037 (select (arr!31681 lt!460884) #b00000000000000000000000000000000)) (get!16576 (select (arr!31682 lt!460878) #b00000000000000000000000000000000) (dynLambda!2018 (defaultEntry!6394 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045471 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32218 lt!460878)))))

(assert (=> b!1045471 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32217 lt!460884)))))

(declare-fun b!1045472 () Bool)

(declare-fun e!592568 () ListLongMap!13775)

(assert (=> b!1045472 (= e!592568 call!44389)))

(declare-fun b!1045473 () Bool)

(declare-fun e!592560 () Bool)

(assert (=> b!1045473 (= e!592558 e!592560)))

(declare-fun res!695999 () Bool)

(assert (=> b!1045473 (= res!695999 call!44387)))

(assert (=> b!1045473 (=> (not res!695999) (not e!592560))))

(declare-fun b!1045474 () Bool)

(declare-fun e!592564 () ListLongMap!13775)

(assert (=> b!1045474 (= e!592564 e!592568)))

(declare-fun c!106465 () Bool)

(assert (=> b!1045474 (= c!106465 (and (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44386 () Bool)

(assert (=> bm!44386 (= call!44392 (getCurrentListMapNoExtraKeys!3570 lt!460884 lt!460878 (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun b!1045475 () Bool)

(declare-fun e!592567 () Bool)

(declare-fun e!592559 () Bool)

(assert (=> b!1045475 (= e!592567 e!592559)))

(declare-fun res!696000 () Bool)

(declare-fun call!44391 () Bool)

(assert (=> b!1045475 (= res!696000 call!44391)))

(assert (=> b!1045475 (=> (not res!696000) (not e!592559))))

(declare-fun b!1045476 () Bool)

(declare-fun res!695996 () Bool)

(assert (=> b!1045476 (=> (not res!695996) (not e!592566))))

(assert (=> b!1045476 (= res!695996 e!592567)))

(declare-fun c!106464 () Bool)

(assert (=> b!1045476 (= c!106464 (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045477 () Bool)

(declare-fun e!592562 () Bool)

(assert (=> b!1045477 (= e!592562 (validKeyInArray!0 (select (arr!31681 lt!460884) #b00000000000000000000000000000000)))))

(declare-fun b!1045478 () Bool)

(declare-fun call!44393 () ListLongMap!13775)

(assert (=> b!1045478 (= e!592563 call!44393)))

(declare-fun bm!44387 () Bool)

(declare-fun call!44388 () ListLongMap!13775)

(declare-fun c!106467 () Bool)

(assert (=> bm!44387 (= call!44388 (+!3130 (ite c!106467 call!44392 (ite c!106465 call!44390 call!44393)) (ite (or c!106467 c!106465) (tuple2!15743 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6228 thiss!1427)) (tuple2!15743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6228 thiss!1427)))))))

(declare-fun b!1045479 () Bool)

(assert (=> b!1045479 (= e!592564 (+!3130 call!44388 (tuple2!15743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6228 thiss!1427))))))

(declare-fun d!126807 () Bool)

(assert (=> d!126807 e!592566))

(declare-fun res!696001 () Bool)

(assert (=> d!126807 (=> (not res!696001) (not e!592566))))

(assert (=> d!126807 (= res!696001 (or (bvsge #b00000000000000000000000000000000 (size!32217 lt!460884)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32217 lt!460884)))))))

(declare-fun lt!461032 () ListLongMap!13775)

(assert (=> d!126807 (= lt!461037 lt!461032)))

(declare-fun lt!461050 () Unit!34095)

(declare-fun e!592569 () Unit!34095)

(assert (=> d!126807 (= lt!461050 e!592569)))

(declare-fun c!106466 () Bool)

(assert (=> d!126807 (= c!106466 e!592562)))

(declare-fun res!695997 () Bool)

(assert (=> d!126807 (=> (not res!695997) (not e!592562))))

(assert (=> d!126807 (= res!695997 (bvslt #b00000000000000000000000000000000 (size!32217 lt!460884)))))

(assert (=> d!126807 (= lt!461032 e!592564)))

(assert (=> d!126807 (= c!106467 (and (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126807 (validMask!0 (mask!30555 thiss!1427))))

(assert (=> d!126807 (= (getCurrentListMap!3947 lt!460884 lt!460878 (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)) lt!461037)))

(declare-fun bm!44388 () Bool)

(assert (=> bm!44388 (= call!44393 call!44390)))

(declare-fun b!1045480 () Bool)

(assert (=> b!1045480 (= e!592560 (= (apply!919 lt!461037 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6228 thiss!1427)))))

(declare-fun b!1045481 () Bool)

(declare-fun Unit!34108 () Unit!34095)

(assert (=> b!1045481 (= e!592569 Unit!34108)))

(declare-fun b!1045482 () Bool)

(assert (=> b!1045482 (= e!592570 e!592561)))

(declare-fun res!695995 () Bool)

(assert (=> b!1045482 (=> (not res!695995) (not e!592561))))

(assert (=> b!1045482 (= res!695995 (contains!6092 lt!461037 (select (arr!31681 lt!460884) #b00000000000000000000000000000000)))))

(assert (=> b!1045482 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32217 lt!460884)))))

(declare-fun b!1045483 () Bool)

(assert (=> b!1045483 (= e!592558 (not call!44387))))

(declare-fun bm!44389 () Bool)

(assert (=> bm!44389 (= call!44389 call!44388)))

(declare-fun bm!44390 () Bool)

(assert (=> bm!44390 (= call!44391 (contains!6092 lt!461037 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045484 () Bool)

(declare-fun c!106469 () Bool)

(assert (=> b!1045484 (= c!106469 (and (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1045484 (= e!592568 e!592563)))

(declare-fun b!1045485 () Bool)

(assert (=> b!1045485 (= e!592565 (validKeyInArray!0 (select (arr!31681 lt!460884) #b00000000000000000000000000000000)))))

(declare-fun b!1045486 () Bool)

(declare-fun lt!461051 () Unit!34095)

(assert (=> b!1045486 (= e!592569 lt!461051)))

(declare-fun lt!461044 () ListLongMap!13775)

(assert (=> b!1045486 (= lt!461044 (getCurrentListMapNoExtraKeys!3570 lt!460884 lt!460878 (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!461031 () (_ BitVec 64))

(assert (=> b!1045486 (= lt!461031 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461034 () (_ BitVec 64))

(assert (=> b!1045486 (= lt!461034 (select (arr!31681 lt!460884) #b00000000000000000000000000000000))))

(declare-fun lt!461048 () Unit!34095)

(assert (=> b!1045486 (= lt!461048 (addStillContains!629 lt!461044 lt!461031 (zeroValue!6228 thiss!1427) lt!461034))))

(assert (=> b!1045486 (contains!6092 (+!3130 lt!461044 (tuple2!15743 lt!461031 (zeroValue!6228 thiss!1427))) lt!461034)))

(declare-fun lt!461043 () Unit!34095)

(assert (=> b!1045486 (= lt!461043 lt!461048)))

(declare-fun lt!461035 () ListLongMap!13775)

(assert (=> b!1045486 (= lt!461035 (getCurrentListMapNoExtraKeys!3570 lt!460884 lt!460878 (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!461036 () (_ BitVec 64))

(assert (=> b!1045486 (= lt!461036 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461049 () (_ BitVec 64))

(assert (=> b!1045486 (= lt!461049 (select (arr!31681 lt!460884) #b00000000000000000000000000000000))))

(declare-fun lt!461038 () Unit!34095)

(assert (=> b!1045486 (= lt!461038 (addApplyDifferent!485 lt!461035 lt!461036 (minValue!6228 thiss!1427) lt!461049))))

(assert (=> b!1045486 (= (apply!919 (+!3130 lt!461035 (tuple2!15743 lt!461036 (minValue!6228 thiss!1427))) lt!461049) (apply!919 lt!461035 lt!461049))))

(declare-fun lt!461042 () Unit!34095)

(assert (=> b!1045486 (= lt!461042 lt!461038)))

(declare-fun lt!461047 () ListLongMap!13775)

(assert (=> b!1045486 (= lt!461047 (getCurrentListMapNoExtraKeys!3570 lt!460884 lt!460878 (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!461041 () (_ BitVec 64))

(assert (=> b!1045486 (= lt!461041 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461040 () (_ BitVec 64))

(assert (=> b!1045486 (= lt!461040 (select (arr!31681 lt!460884) #b00000000000000000000000000000000))))

(declare-fun lt!461030 () Unit!34095)

(assert (=> b!1045486 (= lt!461030 (addApplyDifferent!485 lt!461047 lt!461041 (zeroValue!6228 thiss!1427) lt!461040))))

(assert (=> b!1045486 (= (apply!919 (+!3130 lt!461047 (tuple2!15743 lt!461041 (zeroValue!6228 thiss!1427))) lt!461040) (apply!919 lt!461047 lt!461040))))

(declare-fun lt!461045 () Unit!34095)

(assert (=> b!1045486 (= lt!461045 lt!461030)))

(declare-fun lt!461039 () ListLongMap!13775)

(assert (=> b!1045486 (= lt!461039 (getCurrentListMapNoExtraKeys!3570 lt!460884 lt!460878 (mask!30555 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!461046 () (_ BitVec 64))

(assert (=> b!1045486 (= lt!461046 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461033 () (_ BitVec 64))

(assert (=> b!1045486 (= lt!461033 (select (arr!31681 lt!460884) #b00000000000000000000000000000000))))

(assert (=> b!1045486 (= lt!461051 (addApplyDifferent!485 lt!461039 lt!461046 (minValue!6228 thiss!1427) lt!461033))))

(assert (=> b!1045486 (= (apply!919 (+!3130 lt!461039 (tuple2!15743 lt!461046 (minValue!6228 thiss!1427))) lt!461033) (apply!919 lt!461039 lt!461033))))

(declare-fun b!1045487 () Bool)

(assert (=> b!1045487 (= e!592567 (not call!44391))))

(declare-fun b!1045488 () Bool)

(assert (=> b!1045488 (= e!592559 (= (apply!919 lt!461037 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6228 thiss!1427)))))

(assert (= (and d!126807 c!106467) b!1045479))

(assert (= (and d!126807 (not c!106467)) b!1045474))

(assert (= (and b!1045474 c!106465) b!1045472))

(assert (= (and b!1045474 (not c!106465)) b!1045484))

(assert (= (and b!1045484 c!106469) b!1045470))

(assert (= (and b!1045484 (not c!106469)) b!1045478))

(assert (= (or b!1045470 b!1045478) bm!44388))

(assert (= (or b!1045472 bm!44388) bm!44385))

(assert (= (or b!1045472 b!1045470) bm!44389))

(assert (= (or b!1045479 bm!44385) bm!44386))

(assert (= (or b!1045479 bm!44389) bm!44387))

(assert (= (and d!126807 res!695997) b!1045477))

(assert (= (and d!126807 c!106466) b!1045486))

(assert (= (and d!126807 (not c!106466)) b!1045481))

(assert (= (and d!126807 res!696001) b!1045468))

(assert (= (and b!1045468 res!696002) b!1045485))

(assert (= (and b!1045468 (not res!696003)) b!1045482))

(assert (= (and b!1045482 res!695995) b!1045471))

(assert (= (and b!1045468 res!695998) b!1045476))

(assert (= (and b!1045476 c!106464) b!1045475))

(assert (= (and b!1045476 (not c!106464)) b!1045487))

(assert (= (and b!1045475 res!696000) b!1045488))

(assert (= (or b!1045475 b!1045487) bm!44390))

(assert (= (and b!1045476 res!695996) b!1045469))

(assert (= (and b!1045469 c!106468) b!1045473))

(assert (= (and b!1045469 (not c!106468)) b!1045483))

(assert (= (and b!1045473 res!695999) b!1045480))

(assert (= (or b!1045473 b!1045483) bm!44384))

(declare-fun b_lambda!16219 () Bool)

(assert (=> (not b_lambda!16219) (not b!1045471)))

(assert (=> b!1045471 t!31206))

(declare-fun b_and!33691 () Bool)

(assert (= b_and!33689 (and (=> t!31206 result!14515) b_and!33691)))

(declare-fun m!965203 () Bool)

(assert (=> b!1045482 m!965203))

(assert (=> b!1045482 m!965203))

(declare-fun m!965205 () Bool)

(assert (=> b!1045482 m!965205))

(declare-fun m!965207 () Bool)

(assert (=> bm!44387 m!965207))

(assert (=> b!1045485 m!965203))

(assert (=> b!1045485 m!965203))

(declare-fun m!965209 () Bool)

(assert (=> b!1045485 m!965209))

(assert (=> d!126807 m!965127))

(declare-fun m!965211 () Bool)

(assert (=> bm!44384 m!965211))

(assert (=> b!1045477 m!965203))

(assert (=> b!1045477 m!965203))

(assert (=> b!1045477 m!965209))

(declare-fun m!965213 () Bool)

(assert (=> bm!44386 m!965213))

(declare-fun m!965215 () Bool)

(assert (=> b!1045479 m!965215))

(declare-fun m!965217 () Bool)

(assert (=> bm!44390 m!965217))

(assert (=> b!1045471 m!965203))

(declare-fun m!965219 () Bool)

(assert (=> b!1045471 m!965219))

(assert (=> b!1045471 m!965017))

(assert (=> b!1045471 m!965219))

(assert (=> b!1045471 m!965017))

(declare-fun m!965221 () Bool)

(assert (=> b!1045471 m!965221))

(assert (=> b!1045471 m!965203))

(declare-fun m!965223 () Bool)

(assert (=> b!1045471 m!965223))

(declare-fun m!965225 () Bool)

(assert (=> b!1045480 m!965225))

(declare-fun m!965227 () Bool)

(assert (=> b!1045488 m!965227))

(declare-fun m!965229 () Bool)

(assert (=> b!1045486 m!965229))

(assert (=> b!1045486 m!965203))

(declare-fun m!965231 () Bool)

(assert (=> b!1045486 m!965231))

(declare-fun m!965233 () Bool)

(assert (=> b!1045486 m!965233))

(declare-fun m!965235 () Bool)

(assert (=> b!1045486 m!965235))

(declare-fun m!965237 () Bool)

(assert (=> b!1045486 m!965237))

(declare-fun m!965239 () Bool)

(assert (=> b!1045486 m!965239))

(declare-fun m!965241 () Bool)

(assert (=> b!1045486 m!965241))

(assert (=> b!1045486 m!965213))

(declare-fun m!965243 () Bool)

(assert (=> b!1045486 m!965243))

(declare-fun m!965245 () Bool)

(assert (=> b!1045486 m!965245))

(assert (=> b!1045486 m!965239))

(declare-fun m!965247 () Bool)

(assert (=> b!1045486 m!965247))

(declare-fun m!965249 () Bool)

(assert (=> b!1045486 m!965249))

(declare-fun m!965251 () Bool)

(assert (=> b!1045486 m!965251))

(declare-fun m!965253 () Bool)

(assert (=> b!1045486 m!965253))

(declare-fun m!965255 () Bool)

(assert (=> b!1045486 m!965255))

(declare-fun m!965257 () Bool)

(assert (=> b!1045486 m!965257))

(assert (=> b!1045486 m!965233))

(assert (=> b!1045486 m!965251))

(assert (=> b!1045486 m!965243))

(assert (=> b!1045320 d!126807))

(declare-fun d!126809 () Bool)

(declare-fun res!696008 () Bool)

(declare-fun e!592575 () Bool)

(assert (=> d!126809 (=> res!696008 e!592575)))

(assert (=> d!126809 (= res!696008 (= (select (arr!31681 lt!460884) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126809 (= (arrayContainsKey!0 lt!460884 key!909 #b00000000000000000000000000000000) e!592575)))

(declare-fun b!1045493 () Bool)

(declare-fun e!592576 () Bool)

(assert (=> b!1045493 (= e!592575 e!592576)))

(declare-fun res!696009 () Bool)

(assert (=> b!1045493 (=> (not res!696009) (not e!592576))))

(assert (=> b!1045493 (= res!696009 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32217 lt!460884)))))

(declare-fun b!1045494 () Bool)

(assert (=> b!1045494 (= e!592576 (arrayContainsKey!0 lt!460884 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126809 (not res!696008)) b!1045493))

(assert (= (and b!1045493 res!696009) b!1045494))

(assert (=> d!126809 m!965203))

(declare-fun m!965259 () Bool)

(assert (=> b!1045494 m!965259))

(assert (=> b!1045320 d!126809))

(declare-fun b!1045503 () Bool)

(declare-fun e!592583 () Bool)

(declare-fun e!592585 () Bool)

(assert (=> b!1045503 (= e!592583 e!592585)))

(declare-fun lt!461059 () (_ BitVec 64))

(assert (=> b!1045503 (= lt!461059 (select (arr!31681 lt!460884) #b00000000000000000000000000000000))))

(declare-fun lt!461060 () Unit!34095)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65873 (_ BitVec 64) (_ BitVec 32)) Unit!34095)

(assert (=> b!1045503 (= lt!461060 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!460884 lt!461059 #b00000000000000000000000000000000))))

(assert (=> b!1045503 (arrayContainsKey!0 lt!460884 lt!461059 #b00000000000000000000000000000000)))

(declare-fun lt!461058 () Unit!34095)

(assert (=> b!1045503 (= lt!461058 lt!461060)))

(declare-fun res!696015 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65873 (_ BitVec 32)) SeekEntryResult!9792)

(assert (=> b!1045503 (= res!696015 (= (seekEntryOrOpen!0 (select (arr!31681 lt!460884) #b00000000000000000000000000000000) lt!460884 (mask!30555 thiss!1427)) (Found!9792 #b00000000000000000000000000000000)))))

(assert (=> b!1045503 (=> (not res!696015) (not e!592585))))

(declare-fun b!1045504 () Bool)

(declare-fun e!592584 () Bool)

(assert (=> b!1045504 (= e!592584 e!592583)))

(declare-fun c!106472 () Bool)

(assert (=> b!1045504 (= c!106472 (validKeyInArray!0 (select (arr!31681 lt!460884) #b00000000000000000000000000000000)))))

(declare-fun bm!44393 () Bool)

(declare-fun call!44396 () Bool)

(assert (=> bm!44393 (= call!44396 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!460884 (mask!30555 thiss!1427)))))

(declare-fun b!1045505 () Bool)

(assert (=> b!1045505 (= e!592583 call!44396)))

(declare-fun b!1045506 () Bool)

(assert (=> b!1045506 (= e!592585 call!44396)))

(declare-fun d!126811 () Bool)

(declare-fun res!696014 () Bool)

(assert (=> d!126811 (=> res!696014 e!592584)))

(assert (=> d!126811 (= res!696014 (bvsge #b00000000000000000000000000000000 (size!32217 lt!460884)))))

(assert (=> d!126811 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460884 (mask!30555 thiss!1427)) e!592584)))

(assert (= (and d!126811 (not res!696014)) b!1045504))

(assert (= (and b!1045504 c!106472) b!1045503))

(assert (= (and b!1045504 (not c!106472)) b!1045505))

(assert (= (and b!1045503 res!696015) b!1045506))

(assert (= (or b!1045506 b!1045505) bm!44393))

(assert (=> b!1045503 m!965203))

(declare-fun m!965261 () Bool)

(assert (=> b!1045503 m!965261))

(declare-fun m!965263 () Bool)

(assert (=> b!1045503 m!965263))

(assert (=> b!1045503 m!965203))

(declare-fun m!965265 () Bool)

(assert (=> b!1045503 m!965265))

(assert (=> b!1045504 m!965203))

(assert (=> b!1045504 m!965203))

(assert (=> b!1045504 m!965209))

(declare-fun m!965267 () Bool)

(assert (=> bm!44393 m!965267))

(assert (=> b!1045320 d!126811))

(declare-fun b!1045515 () Bool)

(declare-fun res!696025 () Bool)

(declare-fun e!592591 () Bool)

(assert (=> b!1045515 (=> (not res!696025) (not e!592591))))

(assert (=> b!1045515 (= res!696025 (validKeyInArray!0 (select (arr!31681 (_keys!11694 thiss!1427)) (index!41540 lt!460880))))))

(declare-fun d!126813 () Bool)

(declare-fun e!592590 () Bool)

(assert (=> d!126813 e!592590))

(declare-fun res!696027 () Bool)

(assert (=> d!126813 (=> (not res!696027) (not e!592590))))

(assert (=> d!126813 (= res!696027 (and (bvsge (index!41540 lt!460880) #b00000000000000000000000000000000) (bvslt (index!41540 lt!460880) (size!32217 (_keys!11694 thiss!1427)))))))

(declare-fun lt!461063 () Unit!34095)

(declare-fun choose!82 (array!65873 (_ BitVec 32) (_ BitVec 64)) Unit!34095)

(assert (=> d!126813 (= lt!461063 (choose!82 (_keys!11694 thiss!1427) (index!41540 lt!460880) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126813 e!592591))

(declare-fun res!696026 () Bool)

(assert (=> d!126813 (=> (not res!696026) (not e!592591))))

(assert (=> d!126813 (= res!696026 (and (bvsge (index!41540 lt!460880) #b00000000000000000000000000000000) (bvslt (index!41540 lt!460880) (size!32217 (_keys!11694 thiss!1427)))))))

(assert (=> d!126813 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11694 thiss!1427) (index!41540 lt!460880) #b1000000000000000000000000000000000000000000000000000000000000000) lt!461063)))

(declare-fun b!1045518 () Bool)

(assert (=> b!1045518 (= e!592590 (= (arrayCountValidKeys!0 (array!65874 (store (arr!31681 (_keys!11694 thiss!1427)) (index!41540 lt!460880) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32217 (_keys!11694 thiss!1427))) #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11694 thiss!1427) #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1045517 () Bool)

(assert (=> b!1045517 (= e!592591 (bvslt (size!32217 (_keys!11694 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1045516 () Bool)

(declare-fun res!696024 () Bool)

(assert (=> b!1045516 (=> (not res!696024) (not e!592591))))

(assert (=> b!1045516 (= res!696024 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!126813 res!696026) b!1045515))

(assert (= (and b!1045515 res!696025) b!1045516))

(assert (= (and b!1045516 res!696024) b!1045517))

(assert (= (and d!126813 res!696027) b!1045518))

(declare-fun m!965269 () Bool)

(assert (=> b!1045515 m!965269))

(assert (=> b!1045515 m!965269))

(declare-fun m!965271 () Bool)

(assert (=> b!1045515 m!965271))

(declare-fun m!965273 () Bool)

(assert (=> d!126813 m!965273))

(assert (=> b!1045518 m!964991))

(declare-fun m!965275 () Bool)

(assert (=> b!1045518 m!965275))

(assert (=> b!1045518 m!964997))

(declare-fun m!965277 () Bool)

(assert (=> b!1045516 m!965277))

(assert (=> b!1045320 d!126813))

(declare-fun d!126815 () Bool)

(declare-fun res!696035 () Bool)

(declare-fun e!592602 () Bool)

(assert (=> d!126815 (=> res!696035 e!592602)))

(assert (=> d!126815 (= res!696035 (bvsge #b00000000000000000000000000000000 (size!32217 lt!460884)))))

(assert (=> d!126815 (= (arrayNoDuplicates!0 lt!460884 #b00000000000000000000000000000000 Nil!21985) e!592602)))

(declare-fun bm!44396 () Bool)

(declare-fun call!44399 () Bool)

(declare-fun c!106475 () Bool)

(assert (=> bm!44396 (= call!44399 (arrayNoDuplicates!0 lt!460884 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106475 (Cons!21984 (select (arr!31681 lt!460884) #b00000000000000000000000000000000) Nil!21985) Nil!21985)))))

(declare-fun b!1045529 () Bool)

(declare-fun e!592600 () Bool)

(declare-fun e!592603 () Bool)

(assert (=> b!1045529 (= e!592600 e!592603)))

(assert (=> b!1045529 (= c!106475 (validKeyInArray!0 (select (arr!31681 lt!460884) #b00000000000000000000000000000000)))))

(declare-fun b!1045530 () Bool)

(declare-fun e!592601 () Bool)

(declare-fun contains!6095 (List!21988 (_ BitVec 64)) Bool)

(assert (=> b!1045530 (= e!592601 (contains!6095 Nil!21985 (select (arr!31681 lt!460884) #b00000000000000000000000000000000)))))

(declare-fun b!1045531 () Bool)

(assert (=> b!1045531 (= e!592603 call!44399)))

(declare-fun b!1045532 () Bool)

(assert (=> b!1045532 (= e!592603 call!44399)))

(declare-fun b!1045533 () Bool)

(assert (=> b!1045533 (= e!592602 e!592600)))

(declare-fun res!696036 () Bool)

(assert (=> b!1045533 (=> (not res!696036) (not e!592600))))

(assert (=> b!1045533 (= res!696036 (not e!592601))))

(declare-fun res!696034 () Bool)

(assert (=> b!1045533 (=> (not res!696034) (not e!592601))))

(assert (=> b!1045533 (= res!696034 (validKeyInArray!0 (select (arr!31681 lt!460884) #b00000000000000000000000000000000)))))

(assert (= (and d!126815 (not res!696035)) b!1045533))

(assert (= (and b!1045533 res!696034) b!1045530))

(assert (= (and b!1045533 res!696036) b!1045529))

(assert (= (and b!1045529 c!106475) b!1045532))

(assert (= (and b!1045529 (not c!106475)) b!1045531))

(assert (= (or b!1045532 b!1045531) bm!44396))

(assert (=> bm!44396 m!965203))

(declare-fun m!965279 () Bool)

(assert (=> bm!44396 m!965279))

(assert (=> b!1045529 m!965203))

(assert (=> b!1045529 m!965203))

(assert (=> b!1045529 m!965209))

(assert (=> b!1045530 m!965203))

(assert (=> b!1045530 m!965203))

(declare-fun m!965281 () Bool)

(assert (=> b!1045530 m!965281))

(assert (=> b!1045533 m!965203))

(assert (=> b!1045533 m!965203))

(assert (=> b!1045533 m!965209))

(assert (=> b!1045320 d!126815))

(declare-fun b!1045534 () Bool)

(declare-fun res!696040 () Bool)

(declare-fun e!592612 () Bool)

(assert (=> b!1045534 (=> (not res!696040) (not e!592612))))

(declare-fun e!592616 () Bool)

(assert (=> b!1045534 (= res!696040 e!592616)))

(declare-fun res!696045 () Bool)

(assert (=> b!1045534 (=> res!696045 e!592616)))

(declare-fun e!592611 () Bool)

(assert (=> b!1045534 (= res!696045 (not e!592611))))

(declare-fun res!696044 () Bool)

(assert (=> b!1045534 (=> (not res!696044) (not e!592611))))

(assert (=> b!1045534 (= res!696044 (bvslt #b00000000000000000000000000000000 (size!32217 (_keys!11694 (_2!7881 lt!460885)))))))

(declare-fun bm!44397 () Bool)

(declare-fun call!44400 () Bool)

(declare-fun lt!461071 () ListLongMap!13775)

(assert (=> bm!44397 (= call!44400 (contains!6092 lt!461071 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44398 () Bool)

(declare-fun call!44403 () ListLongMap!13775)

(declare-fun call!44405 () ListLongMap!13775)

(assert (=> bm!44398 (= call!44403 call!44405)))

(declare-fun b!1045535 () Bool)

(declare-fun e!592604 () Bool)

(assert (=> b!1045535 (= e!592612 e!592604)))

(declare-fun c!106480 () Bool)

(assert (=> b!1045535 (= c!106480 (not (= (bvand (extraKeys!6122 (_2!7881 lt!460885)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045536 () Bool)

(declare-fun e!592609 () ListLongMap!13775)

(declare-fun call!44402 () ListLongMap!13775)

(assert (=> b!1045536 (= e!592609 call!44402)))

(declare-fun b!1045537 () Bool)

(declare-fun e!592607 () Bool)

(assert (=> b!1045537 (= e!592607 (= (apply!919 lt!461071 (select (arr!31681 (_keys!11694 (_2!7881 lt!460885))) #b00000000000000000000000000000000)) (get!16576 (select (arr!31682 (_values!6417 (_2!7881 lt!460885))) #b00000000000000000000000000000000) (dynLambda!2018 (defaultEntry!6394 (_2!7881 lt!460885)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045537 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32218 (_values!6417 (_2!7881 lt!460885)))))))

(assert (=> b!1045537 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32217 (_keys!11694 (_2!7881 lt!460885)))))))

(declare-fun b!1045538 () Bool)

(declare-fun e!592614 () ListLongMap!13775)

(assert (=> b!1045538 (= e!592614 call!44402)))

(declare-fun b!1045539 () Bool)

(declare-fun e!592606 () Bool)

(assert (=> b!1045539 (= e!592604 e!592606)))

(declare-fun res!696041 () Bool)

(assert (=> b!1045539 (= res!696041 call!44400)))

(assert (=> b!1045539 (=> (not res!696041) (not e!592606))))

(declare-fun b!1045540 () Bool)

(declare-fun e!592610 () ListLongMap!13775)

(assert (=> b!1045540 (= e!592610 e!592614)))

(declare-fun c!106477 () Bool)

(assert (=> b!1045540 (= c!106477 (and (not (= (bvand (extraKeys!6122 (_2!7881 lt!460885)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6122 (_2!7881 lt!460885)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44399 () Bool)

(assert (=> bm!44399 (= call!44405 (getCurrentListMapNoExtraKeys!3570 (_keys!11694 (_2!7881 lt!460885)) (_values!6417 (_2!7881 lt!460885)) (mask!30555 (_2!7881 lt!460885)) (extraKeys!6122 (_2!7881 lt!460885)) (zeroValue!6228 (_2!7881 lt!460885)) (minValue!6228 (_2!7881 lt!460885)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7881 lt!460885))))))

(declare-fun b!1045541 () Bool)

(declare-fun e!592613 () Bool)

(declare-fun e!592605 () Bool)

(assert (=> b!1045541 (= e!592613 e!592605)))

(declare-fun res!696042 () Bool)

(declare-fun call!44404 () Bool)

(assert (=> b!1045541 (= res!696042 call!44404)))

(assert (=> b!1045541 (=> (not res!696042) (not e!592605))))

(declare-fun b!1045542 () Bool)

(declare-fun res!696038 () Bool)

(assert (=> b!1045542 (=> (not res!696038) (not e!592612))))

(assert (=> b!1045542 (= res!696038 e!592613)))

(declare-fun c!106476 () Bool)

(assert (=> b!1045542 (= c!106476 (not (= (bvand (extraKeys!6122 (_2!7881 lt!460885)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045543 () Bool)

(declare-fun e!592608 () Bool)

(assert (=> b!1045543 (= e!592608 (validKeyInArray!0 (select (arr!31681 (_keys!11694 (_2!7881 lt!460885))) #b00000000000000000000000000000000)))))

(declare-fun b!1045544 () Bool)

(declare-fun call!44406 () ListLongMap!13775)

(assert (=> b!1045544 (= e!592609 call!44406)))

(declare-fun c!106479 () Bool)

(declare-fun call!44401 () ListLongMap!13775)

(declare-fun bm!44400 () Bool)

(assert (=> bm!44400 (= call!44401 (+!3130 (ite c!106479 call!44405 (ite c!106477 call!44403 call!44406)) (ite (or c!106479 c!106477) (tuple2!15743 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6228 (_2!7881 lt!460885))) (tuple2!15743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6228 (_2!7881 lt!460885))))))))

(declare-fun b!1045545 () Bool)

(assert (=> b!1045545 (= e!592610 (+!3130 call!44401 (tuple2!15743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6228 (_2!7881 lt!460885)))))))

(declare-fun d!126817 () Bool)

(assert (=> d!126817 e!592612))

(declare-fun res!696043 () Bool)

(assert (=> d!126817 (=> (not res!696043) (not e!592612))))

(assert (=> d!126817 (= res!696043 (or (bvsge #b00000000000000000000000000000000 (size!32217 (_keys!11694 (_2!7881 lt!460885)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32217 (_keys!11694 (_2!7881 lt!460885)))))))))

(declare-fun lt!461066 () ListLongMap!13775)

(assert (=> d!126817 (= lt!461071 lt!461066)))

(declare-fun lt!461084 () Unit!34095)

(declare-fun e!592615 () Unit!34095)

(assert (=> d!126817 (= lt!461084 e!592615)))

(declare-fun c!106478 () Bool)

(assert (=> d!126817 (= c!106478 e!592608)))

(declare-fun res!696039 () Bool)

(assert (=> d!126817 (=> (not res!696039) (not e!592608))))

(assert (=> d!126817 (= res!696039 (bvslt #b00000000000000000000000000000000 (size!32217 (_keys!11694 (_2!7881 lt!460885)))))))

(assert (=> d!126817 (= lt!461066 e!592610)))

(assert (=> d!126817 (= c!106479 (and (not (= (bvand (extraKeys!6122 (_2!7881 lt!460885)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6122 (_2!7881 lt!460885)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126817 (validMask!0 (mask!30555 (_2!7881 lt!460885)))))

(assert (=> d!126817 (= (getCurrentListMap!3947 (_keys!11694 (_2!7881 lt!460885)) (_values!6417 (_2!7881 lt!460885)) (mask!30555 (_2!7881 lt!460885)) (extraKeys!6122 (_2!7881 lt!460885)) (zeroValue!6228 (_2!7881 lt!460885)) (minValue!6228 (_2!7881 lt!460885)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7881 lt!460885))) lt!461071)))

(declare-fun bm!44401 () Bool)

(assert (=> bm!44401 (= call!44406 call!44403)))

(declare-fun b!1045546 () Bool)

(assert (=> b!1045546 (= e!592606 (= (apply!919 lt!461071 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6228 (_2!7881 lt!460885))))))

(declare-fun b!1045547 () Bool)

(declare-fun Unit!34109 () Unit!34095)

(assert (=> b!1045547 (= e!592615 Unit!34109)))

(declare-fun b!1045548 () Bool)

(assert (=> b!1045548 (= e!592616 e!592607)))

(declare-fun res!696037 () Bool)

(assert (=> b!1045548 (=> (not res!696037) (not e!592607))))

(assert (=> b!1045548 (= res!696037 (contains!6092 lt!461071 (select (arr!31681 (_keys!11694 (_2!7881 lt!460885))) #b00000000000000000000000000000000)))))

(assert (=> b!1045548 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32217 (_keys!11694 (_2!7881 lt!460885)))))))

(declare-fun b!1045549 () Bool)

(assert (=> b!1045549 (= e!592604 (not call!44400))))

(declare-fun bm!44402 () Bool)

(assert (=> bm!44402 (= call!44402 call!44401)))

(declare-fun bm!44403 () Bool)

(assert (=> bm!44403 (= call!44404 (contains!6092 lt!461071 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045550 () Bool)

(declare-fun c!106481 () Bool)

(assert (=> b!1045550 (= c!106481 (and (not (= (bvand (extraKeys!6122 (_2!7881 lt!460885)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6122 (_2!7881 lt!460885)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1045550 (= e!592614 e!592609)))

(declare-fun b!1045551 () Bool)

(assert (=> b!1045551 (= e!592611 (validKeyInArray!0 (select (arr!31681 (_keys!11694 (_2!7881 lt!460885))) #b00000000000000000000000000000000)))))

(declare-fun b!1045552 () Bool)

(declare-fun lt!461085 () Unit!34095)

(assert (=> b!1045552 (= e!592615 lt!461085)))

(declare-fun lt!461078 () ListLongMap!13775)

(assert (=> b!1045552 (= lt!461078 (getCurrentListMapNoExtraKeys!3570 (_keys!11694 (_2!7881 lt!460885)) (_values!6417 (_2!7881 lt!460885)) (mask!30555 (_2!7881 lt!460885)) (extraKeys!6122 (_2!7881 lt!460885)) (zeroValue!6228 (_2!7881 lt!460885)) (minValue!6228 (_2!7881 lt!460885)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7881 lt!460885))))))

(declare-fun lt!461065 () (_ BitVec 64))

(assert (=> b!1045552 (= lt!461065 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461068 () (_ BitVec 64))

(assert (=> b!1045552 (= lt!461068 (select (arr!31681 (_keys!11694 (_2!7881 lt!460885))) #b00000000000000000000000000000000))))

(declare-fun lt!461082 () Unit!34095)

(assert (=> b!1045552 (= lt!461082 (addStillContains!629 lt!461078 lt!461065 (zeroValue!6228 (_2!7881 lt!460885)) lt!461068))))

(assert (=> b!1045552 (contains!6092 (+!3130 lt!461078 (tuple2!15743 lt!461065 (zeroValue!6228 (_2!7881 lt!460885)))) lt!461068)))

(declare-fun lt!461077 () Unit!34095)

(assert (=> b!1045552 (= lt!461077 lt!461082)))

(declare-fun lt!461069 () ListLongMap!13775)

(assert (=> b!1045552 (= lt!461069 (getCurrentListMapNoExtraKeys!3570 (_keys!11694 (_2!7881 lt!460885)) (_values!6417 (_2!7881 lt!460885)) (mask!30555 (_2!7881 lt!460885)) (extraKeys!6122 (_2!7881 lt!460885)) (zeroValue!6228 (_2!7881 lt!460885)) (minValue!6228 (_2!7881 lt!460885)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7881 lt!460885))))))

(declare-fun lt!461070 () (_ BitVec 64))

(assert (=> b!1045552 (= lt!461070 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461083 () (_ BitVec 64))

(assert (=> b!1045552 (= lt!461083 (select (arr!31681 (_keys!11694 (_2!7881 lt!460885))) #b00000000000000000000000000000000))))

(declare-fun lt!461072 () Unit!34095)

(assert (=> b!1045552 (= lt!461072 (addApplyDifferent!485 lt!461069 lt!461070 (minValue!6228 (_2!7881 lt!460885)) lt!461083))))

(assert (=> b!1045552 (= (apply!919 (+!3130 lt!461069 (tuple2!15743 lt!461070 (minValue!6228 (_2!7881 lt!460885)))) lt!461083) (apply!919 lt!461069 lt!461083))))

(declare-fun lt!461076 () Unit!34095)

(assert (=> b!1045552 (= lt!461076 lt!461072)))

(declare-fun lt!461081 () ListLongMap!13775)

(assert (=> b!1045552 (= lt!461081 (getCurrentListMapNoExtraKeys!3570 (_keys!11694 (_2!7881 lt!460885)) (_values!6417 (_2!7881 lt!460885)) (mask!30555 (_2!7881 lt!460885)) (extraKeys!6122 (_2!7881 lt!460885)) (zeroValue!6228 (_2!7881 lt!460885)) (minValue!6228 (_2!7881 lt!460885)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7881 lt!460885))))))

(declare-fun lt!461075 () (_ BitVec 64))

(assert (=> b!1045552 (= lt!461075 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461074 () (_ BitVec 64))

(assert (=> b!1045552 (= lt!461074 (select (arr!31681 (_keys!11694 (_2!7881 lt!460885))) #b00000000000000000000000000000000))))

(declare-fun lt!461064 () Unit!34095)

(assert (=> b!1045552 (= lt!461064 (addApplyDifferent!485 lt!461081 lt!461075 (zeroValue!6228 (_2!7881 lt!460885)) lt!461074))))

(assert (=> b!1045552 (= (apply!919 (+!3130 lt!461081 (tuple2!15743 lt!461075 (zeroValue!6228 (_2!7881 lt!460885)))) lt!461074) (apply!919 lt!461081 lt!461074))))

(declare-fun lt!461079 () Unit!34095)

(assert (=> b!1045552 (= lt!461079 lt!461064)))

(declare-fun lt!461073 () ListLongMap!13775)

(assert (=> b!1045552 (= lt!461073 (getCurrentListMapNoExtraKeys!3570 (_keys!11694 (_2!7881 lt!460885)) (_values!6417 (_2!7881 lt!460885)) (mask!30555 (_2!7881 lt!460885)) (extraKeys!6122 (_2!7881 lt!460885)) (zeroValue!6228 (_2!7881 lt!460885)) (minValue!6228 (_2!7881 lt!460885)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7881 lt!460885))))))

(declare-fun lt!461080 () (_ BitVec 64))

(assert (=> b!1045552 (= lt!461080 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461067 () (_ BitVec 64))

(assert (=> b!1045552 (= lt!461067 (select (arr!31681 (_keys!11694 (_2!7881 lt!460885))) #b00000000000000000000000000000000))))

(assert (=> b!1045552 (= lt!461085 (addApplyDifferent!485 lt!461073 lt!461080 (minValue!6228 (_2!7881 lt!460885)) lt!461067))))

(assert (=> b!1045552 (= (apply!919 (+!3130 lt!461073 (tuple2!15743 lt!461080 (minValue!6228 (_2!7881 lt!460885)))) lt!461067) (apply!919 lt!461073 lt!461067))))

(declare-fun b!1045553 () Bool)

(assert (=> b!1045553 (= e!592613 (not call!44404))))

(declare-fun b!1045554 () Bool)

(assert (=> b!1045554 (= e!592605 (= (apply!919 lt!461071 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6228 (_2!7881 lt!460885))))))

(assert (= (and d!126817 c!106479) b!1045545))

(assert (= (and d!126817 (not c!106479)) b!1045540))

(assert (= (and b!1045540 c!106477) b!1045538))

(assert (= (and b!1045540 (not c!106477)) b!1045550))

(assert (= (and b!1045550 c!106481) b!1045536))

(assert (= (and b!1045550 (not c!106481)) b!1045544))

(assert (= (or b!1045536 b!1045544) bm!44401))

(assert (= (or b!1045538 bm!44401) bm!44398))

(assert (= (or b!1045538 b!1045536) bm!44402))

(assert (= (or b!1045545 bm!44398) bm!44399))

(assert (= (or b!1045545 bm!44402) bm!44400))

(assert (= (and d!126817 res!696039) b!1045543))

(assert (= (and d!126817 c!106478) b!1045552))

(assert (= (and d!126817 (not c!106478)) b!1045547))

(assert (= (and d!126817 res!696043) b!1045534))

(assert (= (and b!1045534 res!696044) b!1045551))

(assert (= (and b!1045534 (not res!696045)) b!1045548))

(assert (= (and b!1045548 res!696037) b!1045537))

(assert (= (and b!1045534 res!696040) b!1045542))

(assert (= (and b!1045542 c!106476) b!1045541))

(assert (= (and b!1045542 (not c!106476)) b!1045553))

(assert (= (and b!1045541 res!696042) b!1045554))

(assert (= (or b!1045541 b!1045553) bm!44403))

(assert (= (and b!1045542 res!696038) b!1045535))

(assert (= (and b!1045535 c!106480) b!1045539))

(assert (= (and b!1045535 (not c!106480)) b!1045549))

(assert (= (and b!1045539 res!696041) b!1045546))

(assert (= (or b!1045539 b!1045549) bm!44397))

(declare-fun b_lambda!16221 () Bool)

(assert (=> (not b_lambda!16221) (not b!1045537)))

(declare-fun tb!7047 () Bool)

(declare-fun t!31218 () Bool)

(assert (=> (and b!1045316 (= (defaultEntry!6394 thiss!1427) (defaultEntry!6394 (_2!7881 lt!460885))) t!31218) tb!7047))

(declare-fun result!14527 () Bool)

(assert (=> tb!7047 (= result!14527 tp_is_empty!24829)))

(assert (=> b!1045537 t!31218))

(declare-fun b_and!33693 () Bool)

(assert (= b_and!33691 (and (=> t!31218 result!14527) b_and!33693)))

(declare-fun m!965283 () Bool)

(assert (=> b!1045548 m!965283))

(assert (=> b!1045548 m!965283))

(declare-fun m!965285 () Bool)

(assert (=> b!1045548 m!965285))

(declare-fun m!965287 () Bool)

(assert (=> bm!44400 m!965287))

(assert (=> b!1045551 m!965283))

(assert (=> b!1045551 m!965283))

(declare-fun m!965289 () Bool)

(assert (=> b!1045551 m!965289))

(assert (=> d!126817 m!964975))

(declare-fun m!965291 () Bool)

(assert (=> bm!44397 m!965291))

(assert (=> b!1045543 m!965283))

(assert (=> b!1045543 m!965283))

(assert (=> b!1045543 m!965289))

(declare-fun m!965293 () Bool)

(assert (=> bm!44399 m!965293))

(declare-fun m!965295 () Bool)

(assert (=> b!1045545 m!965295))

(declare-fun m!965297 () Bool)

(assert (=> bm!44403 m!965297))

(assert (=> b!1045537 m!965283))

(declare-fun m!965299 () Bool)

(assert (=> b!1045537 m!965299))

(declare-fun m!965301 () Bool)

(assert (=> b!1045537 m!965301))

(assert (=> b!1045537 m!965299))

(assert (=> b!1045537 m!965301))

(declare-fun m!965303 () Bool)

(assert (=> b!1045537 m!965303))

(assert (=> b!1045537 m!965283))

(declare-fun m!965305 () Bool)

(assert (=> b!1045537 m!965305))

(declare-fun m!965307 () Bool)

(assert (=> b!1045546 m!965307))

(declare-fun m!965309 () Bool)

(assert (=> b!1045554 m!965309))

(declare-fun m!965311 () Bool)

(assert (=> b!1045552 m!965311))

(assert (=> b!1045552 m!965283))

(declare-fun m!965313 () Bool)

(assert (=> b!1045552 m!965313))

(declare-fun m!965315 () Bool)

(assert (=> b!1045552 m!965315))

(declare-fun m!965317 () Bool)

(assert (=> b!1045552 m!965317))

(declare-fun m!965319 () Bool)

(assert (=> b!1045552 m!965319))

(declare-fun m!965321 () Bool)

(assert (=> b!1045552 m!965321))

(declare-fun m!965323 () Bool)

(assert (=> b!1045552 m!965323))

(assert (=> b!1045552 m!965293))

(declare-fun m!965325 () Bool)

(assert (=> b!1045552 m!965325))

(declare-fun m!965327 () Bool)

(assert (=> b!1045552 m!965327))

(assert (=> b!1045552 m!965321))

(declare-fun m!965329 () Bool)

(assert (=> b!1045552 m!965329))

(declare-fun m!965331 () Bool)

(assert (=> b!1045552 m!965331))

(declare-fun m!965333 () Bool)

(assert (=> b!1045552 m!965333))

(declare-fun m!965335 () Bool)

(assert (=> b!1045552 m!965335))

(declare-fun m!965337 () Bool)

(assert (=> b!1045552 m!965337))

(declare-fun m!965339 () Bool)

(assert (=> b!1045552 m!965339))

(assert (=> b!1045552 m!965315))

(assert (=> b!1045552 m!965333))

(assert (=> b!1045552 m!965325))

(assert (=> b!1045320 d!126817))

(declare-fun b!1045563 () Bool)

(declare-fun e!592622 () (_ BitVec 32))

(declare-fun e!592621 () (_ BitVec 32))

(assert (=> b!1045563 (= e!592622 e!592621)))

(declare-fun c!106487 () Bool)

(assert (=> b!1045563 (= c!106487 (validKeyInArray!0 (select (arr!31681 lt!460884) #b00000000000000000000000000000000)))))

(declare-fun b!1045564 () Bool)

(assert (=> b!1045564 (= e!592622 #b00000000000000000000000000000000)))

(declare-fun bm!44406 () Bool)

(declare-fun call!44409 () (_ BitVec 32))

(assert (=> bm!44406 (= call!44409 (arrayCountValidKeys!0 lt!460884 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32217 (_keys!11694 thiss!1427))))))

(declare-fun d!126819 () Bool)

(declare-fun lt!461088 () (_ BitVec 32))

(assert (=> d!126819 (and (bvsge lt!461088 #b00000000000000000000000000000000) (bvsle lt!461088 (bvsub (size!32217 lt!460884) #b00000000000000000000000000000000)))))

(assert (=> d!126819 (= lt!461088 e!592622)))

(declare-fun c!106486 () Bool)

(assert (=> d!126819 (= c!106486 (bvsge #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))))))

(assert (=> d!126819 (and (bvsle #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32217 (_keys!11694 thiss!1427)) (size!32217 lt!460884)))))

(assert (=> d!126819 (= (arrayCountValidKeys!0 lt!460884 #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))) lt!461088)))

(declare-fun b!1045565 () Bool)

(assert (=> b!1045565 (= e!592621 (bvadd #b00000000000000000000000000000001 call!44409))))

(declare-fun b!1045566 () Bool)

(assert (=> b!1045566 (= e!592621 call!44409)))

(assert (= (and d!126819 c!106486) b!1045564))

(assert (= (and d!126819 (not c!106486)) b!1045563))

(assert (= (and b!1045563 c!106487) b!1045565))

(assert (= (and b!1045563 (not c!106487)) b!1045566))

(assert (= (or b!1045565 b!1045566) bm!44406))

(assert (=> b!1045563 m!965203))

(assert (=> b!1045563 m!965203))

(assert (=> b!1045563 m!965209))

(declare-fun m!965341 () Bool)

(assert (=> bm!44406 m!965341))

(assert (=> b!1045320 d!126819))

(declare-fun d!126821 () Bool)

(declare-fun e!592625 () Bool)

(assert (=> d!126821 e!592625))

(declare-fun res!696048 () Bool)

(assert (=> d!126821 (=> (not res!696048) (not e!592625))))

(assert (=> d!126821 (= res!696048 (and (bvsge (index!41540 lt!460880) #b00000000000000000000000000000000) (bvslt (index!41540 lt!460880) (size!32217 (_keys!11694 thiss!1427)))))))

(declare-fun lt!461091 () Unit!34095)

(declare-fun choose!25 (array!65873 (_ BitVec 32) (_ BitVec 32)) Unit!34095)

(assert (=> d!126821 (= lt!461091 (choose!25 (_keys!11694 thiss!1427) (index!41540 lt!460880) (mask!30555 thiss!1427)))))

(assert (=> d!126821 (validMask!0 (mask!30555 thiss!1427))))

(assert (=> d!126821 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11694 thiss!1427) (index!41540 lt!460880) (mask!30555 thiss!1427)) lt!461091)))

(declare-fun b!1045569 () Bool)

(assert (=> b!1045569 (= e!592625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65874 (store (arr!31681 (_keys!11694 thiss!1427)) (index!41540 lt!460880) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32217 (_keys!11694 thiss!1427))) (mask!30555 thiss!1427)))))

(assert (= (and d!126821 res!696048) b!1045569))

(declare-fun m!965343 () Bool)

(assert (=> d!126821 m!965343))

(assert (=> d!126821 m!965127))

(assert (=> b!1045569 m!964991))

(declare-fun m!965345 () Bool)

(assert (=> b!1045569 m!965345))

(assert (=> b!1045320 d!126821))

(declare-fun b!1045570 () Bool)

(declare-fun e!592627 () (_ BitVec 32))

(declare-fun e!592626 () (_ BitVec 32))

(assert (=> b!1045570 (= e!592627 e!592626)))

(declare-fun c!106489 () Bool)

(assert (=> b!1045570 (= c!106489 (validKeyInArray!0 (select (arr!31681 (_keys!11694 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045571 () Bool)

(assert (=> b!1045571 (= e!592627 #b00000000000000000000000000000000)))

(declare-fun bm!44407 () Bool)

(declare-fun call!44410 () (_ BitVec 32))

(assert (=> bm!44407 (= call!44410 (arrayCountValidKeys!0 (_keys!11694 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32217 (_keys!11694 thiss!1427))))))

(declare-fun d!126823 () Bool)

(declare-fun lt!461092 () (_ BitVec 32))

(assert (=> d!126823 (and (bvsge lt!461092 #b00000000000000000000000000000000) (bvsle lt!461092 (bvsub (size!32217 (_keys!11694 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126823 (= lt!461092 e!592627)))

(declare-fun c!106488 () Bool)

(assert (=> d!126823 (= c!106488 (bvsge #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))))))

(assert (=> d!126823 (and (bvsle #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32217 (_keys!11694 thiss!1427)) (size!32217 (_keys!11694 thiss!1427))))))

(assert (=> d!126823 (= (arrayCountValidKeys!0 (_keys!11694 thiss!1427) #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))) lt!461092)))

(declare-fun b!1045572 () Bool)

(assert (=> b!1045572 (= e!592626 (bvadd #b00000000000000000000000000000001 call!44410))))

(declare-fun b!1045573 () Bool)

(assert (=> b!1045573 (= e!592626 call!44410)))

(assert (= (and d!126823 c!106488) b!1045571))

(assert (= (and d!126823 (not c!106488)) b!1045570))

(assert (= (and b!1045570 c!106489) b!1045572))

(assert (= (and b!1045570 (not c!106489)) b!1045573))

(assert (= (or b!1045572 b!1045573) bm!44407))

(assert (=> b!1045570 m!965135))

(assert (=> b!1045570 m!965135))

(assert (=> b!1045570 m!965141))

(declare-fun m!965347 () Bool)

(assert (=> bm!44407 m!965347))

(assert (=> b!1045320 d!126823))

(declare-fun d!126825 () Bool)

(declare-fun e!592632 () Bool)

(assert (=> d!126825 e!592632))

(declare-fun res!696051 () Bool)

(assert (=> d!126825 (=> res!696051 e!592632)))

(declare-fun lt!461104 () Bool)

(assert (=> d!126825 (= res!696051 (not lt!461104))))

(declare-fun lt!461102 () Bool)

(assert (=> d!126825 (= lt!461104 lt!461102)))

(declare-fun lt!461101 () Unit!34095)

(declare-fun e!592633 () Unit!34095)

(assert (=> d!126825 (= lt!461101 e!592633)))

(declare-fun c!106492 () Bool)

(assert (=> d!126825 (= c!106492 lt!461102)))

(declare-fun containsKey!567 (List!21987 (_ BitVec 64)) Bool)

(assert (=> d!126825 (= lt!461102 (containsKey!567 (toList!6903 (getCurrentListMap!3947 (_keys!11694 (_2!7881 lt!460885)) (_values!6417 (_2!7881 lt!460885)) (mask!30555 (_2!7881 lt!460885)) (extraKeys!6122 (_2!7881 lt!460885)) (zeroValue!6228 (_2!7881 lt!460885)) (minValue!6228 (_2!7881 lt!460885)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7881 lt!460885)))) key!909))))

(assert (=> d!126825 (= (contains!6092 (getCurrentListMap!3947 (_keys!11694 (_2!7881 lt!460885)) (_values!6417 (_2!7881 lt!460885)) (mask!30555 (_2!7881 lt!460885)) (extraKeys!6122 (_2!7881 lt!460885)) (zeroValue!6228 (_2!7881 lt!460885)) (minValue!6228 (_2!7881 lt!460885)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7881 lt!460885))) key!909) lt!461104)))

(declare-fun b!1045580 () Bool)

(declare-fun lt!461103 () Unit!34095)

(assert (=> b!1045580 (= e!592633 lt!461103)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!398 (List!21987 (_ BitVec 64)) Unit!34095)

(assert (=> b!1045580 (= lt!461103 (lemmaContainsKeyImpliesGetValueByKeyDefined!398 (toList!6903 (getCurrentListMap!3947 (_keys!11694 (_2!7881 lt!460885)) (_values!6417 (_2!7881 lt!460885)) (mask!30555 (_2!7881 lt!460885)) (extraKeys!6122 (_2!7881 lt!460885)) (zeroValue!6228 (_2!7881 lt!460885)) (minValue!6228 (_2!7881 lt!460885)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7881 lt!460885)))) key!909))))

(declare-datatypes ((Option!637 0))(
  ( (Some!636 (v!15055 V!37979)) (None!635) )
))
(declare-fun isDefined!436 (Option!637) Bool)

(declare-fun getValueByKey!586 (List!21987 (_ BitVec 64)) Option!637)

(assert (=> b!1045580 (isDefined!436 (getValueByKey!586 (toList!6903 (getCurrentListMap!3947 (_keys!11694 (_2!7881 lt!460885)) (_values!6417 (_2!7881 lt!460885)) (mask!30555 (_2!7881 lt!460885)) (extraKeys!6122 (_2!7881 lt!460885)) (zeroValue!6228 (_2!7881 lt!460885)) (minValue!6228 (_2!7881 lt!460885)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7881 lt!460885)))) key!909))))

(declare-fun b!1045581 () Bool)

(declare-fun Unit!34110 () Unit!34095)

(assert (=> b!1045581 (= e!592633 Unit!34110)))

(declare-fun b!1045582 () Bool)

(assert (=> b!1045582 (= e!592632 (isDefined!436 (getValueByKey!586 (toList!6903 (getCurrentListMap!3947 (_keys!11694 (_2!7881 lt!460885)) (_values!6417 (_2!7881 lt!460885)) (mask!30555 (_2!7881 lt!460885)) (extraKeys!6122 (_2!7881 lt!460885)) (zeroValue!6228 (_2!7881 lt!460885)) (minValue!6228 (_2!7881 lt!460885)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7881 lt!460885)))) key!909)))))

(assert (= (and d!126825 c!106492) b!1045580))

(assert (= (and d!126825 (not c!106492)) b!1045581))

(assert (= (and d!126825 (not res!696051)) b!1045582))

(declare-fun m!965349 () Bool)

(assert (=> d!126825 m!965349))

(declare-fun m!965351 () Bool)

(assert (=> b!1045580 m!965351))

(declare-fun m!965353 () Bool)

(assert (=> b!1045580 m!965353))

(assert (=> b!1045580 m!965353))

(declare-fun m!965355 () Bool)

(assert (=> b!1045580 m!965355))

(assert (=> b!1045582 m!965353))

(assert (=> b!1045582 m!965353))

(assert (=> b!1045582 m!965355))

(assert (=> b!1045320 d!126825))

(declare-fun d!126827 () Bool)

(assert (=> d!126827 (= (array_inv!24485 (_keys!11694 thiss!1427)) (bvsge (size!32217 (_keys!11694 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045316 d!126827))

(declare-fun d!126829 () Bool)

(assert (=> d!126829 (= (array_inv!24486 (_values!6417 thiss!1427)) (bvsge (size!32218 (_values!6417 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045316 d!126829))

(declare-fun d!126831 () Bool)

(assert (=> d!126831 (= (validMask!0 (mask!30555 (_2!7881 lt!460885))) (and (or (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000000000000000000111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000000000000000001111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000000000000000011111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000000000000000111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000000000000001111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000000000000011111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000000000000111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000000000001111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000000000011111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000000000111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000000001111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000000011111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000000111111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000001111111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000011111111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000000111111111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000001111111111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000011111111111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000000111111111111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000001111111111111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000011111111111111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000000111111111111111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000001111111111111111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000011111111111111111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00000111111111111111111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00001111111111111111111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00011111111111111111111111111111) (= (mask!30555 (_2!7881 lt!460885)) #b00111111111111111111111111111111)) (bvsle (mask!30555 (_2!7881 lt!460885)) #b00111111111111111111111111111111)))))

(assert (=> b!1045321 d!126831))

(declare-fun d!126833 () Bool)

(declare-fun res!696058 () Bool)

(declare-fun e!592636 () Bool)

(assert (=> d!126833 (=> (not res!696058) (not e!592636))))

(declare-fun simpleValid!448 (LongMapFixedSize!6016) Bool)

(assert (=> d!126833 (= res!696058 (simpleValid!448 thiss!1427))))

(assert (=> d!126833 (= (valid!2263 thiss!1427) e!592636)))

(declare-fun b!1045589 () Bool)

(declare-fun res!696059 () Bool)

(assert (=> b!1045589 (=> (not res!696059) (not e!592636))))

(assert (=> b!1045589 (= res!696059 (= (arrayCountValidKeys!0 (_keys!11694 thiss!1427) #b00000000000000000000000000000000 (size!32217 (_keys!11694 thiss!1427))) (_size!3063 thiss!1427)))))

(declare-fun b!1045590 () Bool)

(declare-fun res!696060 () Bool)

(assert (=> b!1045590 (=> (not res!696060) (not e!592636))))

(assert (=> b!1045590 (= res!696060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11694 thiss!1427) (mask!30555 thiss!1427)))))

(declare-fun b!1045591 () Bool)

(assert (=> b!1045591 (= e!592636 (arrayNoDuplicates!0 (_keys!11694 thiss!1427) #b00000000000000000000000000000000 Nil!21985))))

(assert (= (and d!126833 res!696058) b!1045589))

(assert (= (and b!1045589 res!696059) b!1045590))

(assert (= (and b!1045590 res!696060) b!1045591))

(declare-fun m!965357 () Bool)

(assert (=> d!126833 m!965357))

(assert (=> b!1045589 m!964997))

(declare-fun m!965359 () Bool)

(assert (=> b!1045590 m!965359))

(declare-fun m!965361 () Bool)

(assert (=> b!1045591 m!965361))

(assert (=> start!91966 d!126833))

(declare-fun condMapEmpty!38879 () Bool)

(declare-fun mapDefault!38879 () ValueCell!11711)

(assert (=> mapNonEmpty!38870 (= condMapEmpty!38879 (= mapRest!38870 ((as const (Array (_ BitVec 32) ValueCell!11711)) mapDefault!38879)))))

(declare-fun e!592641 () Bool)

(declare-fun mapRes!38879 () Bool)

(assert (=> mapNonEmpty!38870 (= tp!74571 (and e!592641 mapRes!38879))))

(declare-fun mapNonEmpty!38879 () Bool)

(declare-fun tp!74586 () Bool)

(declare-fun e!592642 () Bool)

(assert (=> mapNonEmpty!38879 (= mapRes!38879 (and tp!74586 e!592642))))

(declare-fun mapRest!38879 () (Array (_ BitVec 32) ValueCell!11711))

(declare-fun mapValue!38879 () ValueCell!11711)

(declare-fun mapKey!38879 () (_ BitVec 32))

(assert (=> mapNonEmpty!38879 (= mapRest!38870 (store mapRest!38879 mapKey!38879 mapValue!38879))))

(declare-fun b!1045598 () Bool)

(assert (=> b!1045598 (= e!592642 tp_is_empty!24829)))

(declare-fun mapIsEmpty!38879 () Bool)

(assert (=> mapIsEmpty!38879 mapRes!38879))

(declare-fun b!1045599 () Bool)

(assert (=> b!1045599 (= e!592641 tp_is_empty!24829)))

(assert (= (and mapNonEmpty!38870 condMapEmpty!38879) mapIsEmpty!38879))

(assert (= (and mapNonEmpty!38870 (not condMapEmpty!38879)) mapNonEmpty!38879))

(assert (= (and mapNonEmpty!38879 ((_ is ValueCellFull!11711) mapValue!38879)) b!1045598))

(assert (= (and mapNonEmpty!38870 ((_ is ValueCellFull!11711) mapDefault!38879)) b!1045599))

(declare-fun m!965363 () Bool)

(assert (=> mapNonEmpty!38879 m!965363))

(declare-fun b_lambda!16223 () Bool)

(assert (= b_lambda!16215 (or (and b!1045316 b_free!21109) b_lambda!16223)))

(declare-fun b_lambda!16225 () Bool)

(assert (= b_lambda!16217 (or (and b!1045316 b_free!21109) b_lambda!16225)))

(declare-fun b_lambda!16227 () Bool)

(assert (= b_lambda!16219 (or (and b!1045316 b_free!21109) b_lambda!16227)))

(check-sat (not bm!44383) (not b!1045480) (not b_lambda!16221) (not b!1045452) b_and!33693 (not b!1045563) (not b!1045548) (not b!1045545) (not b!1045488) (not b!1045589) tp_is_empty!24829 (not b!1045552) (not bm!44386) (not b!1045464) (not b!1045503) (not b!1045477) (not b!1045582) (not b!1045398) (not b!1045533) (not b!1045485) (not b!1045590) (not bm!44377) (not b!1045529) (not b!1045471) (not bm!44380) (not bm!44387) (not b_lambda!16225) (not b!1045479) (not b!1045570) (not b!1045516) (not bm!44396) (not bm!44379) (not d!126813) (not b!1045546) (not b!1045486) (not b!1045444) (not d!126821) (not d!126803) (not bm!44390) (not b!1045494) (not bm!44407) (not b!1045554) (not mapNonEmpty!38879) (not bm!44397) (not b!1045543) (not bm!44400) (not bm!44399) (not d!126799) (not b!1045530) (not b!1045455) (not b!1045467) (not b!1045458) (not b!1045450) (not d!126817) (not d!126805) (not b_lambda!16227) (not b_lambda!16213) (not bm!44393) (not d!126807) (not b!1045569) (not bm!44406) (not b!1045580) (not d!126833) (not b!1045390) (not b!1045461) (not b!1045459) (not bm!44403) (not d!126797) (not b!1045551) (not d!126795) (not d!126825) (not b!1045515) (not b_lambda!16223) (not b!1045537) (not b!1045504) (not b!1045591) (not bm!44384) (not b!1045518) (not b!1045482) (not b!1045453) (not b_next!21109) (not d!126801))
(check-sat b_and!33693 (not b_next!21109))
