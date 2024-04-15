; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91730 () Bool)

(assert start!91730)

(declare-fun b!1043853 () Bool)

(declare-fun b_free!21109 () Bool)

(declare-fun b_next!21109 () Bool)

(assert (=> b!1043853 (= b_free!21109 (not b_next!21109))))

(declare-fun tp!74570 () Bool)

(declare-fun b_and!33639 () Bool)

(assert (=> b!1043853 (= tp!74570 b_and!33639)))

(declare-fun b!1043850 () Bool)

(declare-fun res!695355 () Bool)

(declare-fun e!591516 () Bool)

(assert (=> b!1043850 (=> (not res!695355) (not e!591516))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1043850 (= res!695355 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38870 () Bool)

(declare-fun mapRes!38870 () Bool)

(assert (=> mapIsEmpty!38870 mapRes!38870))

(declare-fun b!1043851 () Bool)

(declare-fun e!591511 () Bool)

(declare-fun tp_is_empty!24829 () Bool)

(assert (=> b!1043851 (= e!591511 tp_is_empty!24829)))

(declare-fun b!1043852 () Bool)

(declare-fun e!591512 () Bool)

(assert (=> b!1043852 (= e!591512 (and e!591511 mapRes!38870))))

(declare-fun condMapEmpty!38870 () Bool)

(declare-datatypes ((V!37979 0))(
  ( (V!37980 (val!12465 Int)) )
))
(declare-datatypes ((ValueCell!11711 0))(
  ( (ValueCellFull!11711 (v!15055 V!37979)) (EmptyCell!11711) )
))
(declare-datatypes ((array!65763 0))(
  ( (array!65764 (arr!31632 (Array (_ BitVec 32) (_ BitVec 64))) (size!32169 (_ BitVec 32))) )
))
(declare-datatypes ((array!65765 0))(
  ( (array!65766 (arr!31633 (Array (_ BitVec 32) ValueCell!11711)) (size!32170 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6016 0))(
  ( (LongMapFixedSize!6017 (defaultEntry!6394 Int) (mask!30490 (_ BitVec 32)) (extraKeys!6122 (_ BitVec 32)) (zeroValue!6228 V!37979) (minValue!6228 V!37979) (_size!3063 (_ BitVec 32)) (_keys!11652 array!65763) (_values!6417 array!65765) (_vacant!3063 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6016)

(declare-fun mapDefault!38870 () ValueCell!11711)

(assert (=> b!1043852 (= condMapEmpty!38870 (= (arr!31633 (_values!6417 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11711)) mapDefault!38870)))))

(declare-fun res!695357 () Bool)

(assert (=> start!91730 (=> (not res!695357) (not e!591516))))

(declare-fun valid!2253 (LongMapFixedSize!6016) Bool)

(assert (=> start!91730 (= res!695357 (valid!2253 thiss!1427))))

(assert (=> start!91730 e!591516))

(declare-fun e!591518 () Bool)

(assert (=> start!91730 e!591518))

(assert (=> start!91730 true))

(declare-fun array_inv!24447 (array!65763) Bool)

(declare-fun array_inv!24448 (array!65765) Bool)

(assert (=> b!1043853 (= e!591518 (and tp!74570 tp_is_empty!24829 (array_inv!24447 (_keys!11652 thiss!1427)) (array_inv!24448 (_values!6417 thiss!1427)) e!591512))))

(declare-fun b!1043854 () Bool)

(declare-fun e!591515 () Bool)

(assert (=> b!1043854 (= e!591515 tp_is_empty!24829)))

(declare-fun mapNonEmpty!38870 () Bool)

(declare-fun tp!74571 () Bool)

(assert (=> mapNonEmpty!38870 (= mapRes!38870 (and tp!74571 e!591515))))

(declare-fun mapKey!38870 () (_ BitVec 32))

(declare-fun mapRest!38870 () (Array (_ BitVec 32) ValueCell!11711))

(declare-fun mapValue!38870 () ValueCell!11711)

(assert (=> mapNonEmpty!38870 (= (arr!31633 (_values!6417 thiss!1427)) (store mapRest!38870 mapKey!38870 mapValue!38870))))

(declare-fun b!1043855 () Bool)

(declare-fun e!591517 () Bool)

(assert (=> b!1043855 (= e!591516 e!591517)))

(declare-fun res!695356 () Bool)

(assert (=> b!1043855 (=> (not res!695356) (not e!591517))))

(declare-datatypes ((SeekEntryResult!9838 0))(
  ( (MissingZero!9838 (index!41723 (_ BitVec 32))) (Found!9838 (index!41724 (_ BitVec 32))) (Intermediate!9838 (undefined!10650 Bool) (index!41725 (_ BitVec 32)) (x!93217 (_ BitVec 32))) (Undefined!9838) (MissingVacant!9838 (index!41726 (_ BitVec 32))) )
))
(declare-fun lt!460168 () SeekEntryResult!9838)

(get-info :version)

(assert (=> b!1043855 (= res!695356 ((_ is Found!9838) lt!460168))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65763 (_ BitVec 32)) SeekEntryResult!9838)

(assert (=> b!1043855 (= lt!460168 (seekEntry!0 key!909 (_keys!11652 thiss!1427) (mask!30490 thiss!1427)))))

(declare-fun b!1043856 () Bool)

(declare-fun e!591513 () Bool)

(declare-datatypes ((Unit!33975 0))(
  ( (Unit!33976) )
))
(declare-datatypes ((tuple2!15822 0))(
  ( (tuple2!15823 (_1!7922 Unit!33975) (_2!7922 LongMapFixedSize!6016)) )
))
(declare-fun lt!460162 () tuple2!15822)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1043856 (= e!591513 (validMask!0 (mask!30490 (_2!7922 lt!460162))))))

(declare-fun b!1043857 () Bool)

(assert (=> b!1043857 (= e!591517 (not e!591513))))

(declare-fun res!695354 () Bool)

(assert (=> b!1043857 (=> res!695354 e!591513)))

(declare-datatypes ((tuple2!15824 0))(
  ( (tuple2!15825 (_1!7923 (_ BitVec 64)) (_2!7923 V!37979)) )
))
(declare-datatypes ((List!22038 0))(
  ( (Nil!22035) (Cons!22034 (h!23242 tuple2!15824) (t!31257 List!22038)) )
))
(declare-datatypes ((ListLongMap!13845 0))(
  ( (ListLongMap!13846 (toList!6938 List!22038)) )
))
(declare-fun contains!6046 (ListLongMap!13845 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3904 (array!65763 array!65765 (_ BitVec 32) (_ BitVec 32) V!37979 V!37979 (_ BitVec 32) Int) ListLongMap!13845)

(assert (=> b!1043857 (= res!695354 (not (contains!6046 (getCurrentListMap!3904 (_keys!11652 (_2!7922 lt!460162)) (_values!6417 (_2!7922 lt!460162)) (mask!30490 (_2!7922 lt!460162)) (extraKeys!6122 (_2!7922 lt!460162)) (zeroValue!6228 (_2!7922 lt!460162)) (minValue!6228 (_2!7922 lt!460162)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7922 lt!460162))) key!909)))))

(declare-fun lt!460163 () array!65765)

(declare-fun lt!460170 () array!65763)

(declare-fun Unit!33977 () Unit!33975)

(declare-fun Unit!33978 () Unit!33975)

(assert (=> b!1043857 (= lt!460162 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3063 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15823 Unit!33977 (LongMapFixedSize!6017 (defaultEntry!6394 thiss!1427) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) (bvsub (_size!3063 thiss!1427) #b00000000000000000000000000000001) lt!460170 lt!460163 (bvadd #b00000000000000000000000000000001 (_vacant!3063 thiss!1427)))) (tuple2!15823 Unit!33978 (LongMapFixedSize!6017 (defaultEntry!6394 thiss!1427) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) (bvsub (_size!3063 thiss!1427) #b00000000000000000000000000000001) lt!460170 lt!460163 (_vacant!3063 thiss!1427)))))))

(declare-fun -!530 (ListLongMap!13845 (_ BitVec 64)) ListLongMap!13845)

(assert (=> b!1043857 (= (-!530 (getCurrentListMap!3904 (_keys!11652 thiss!1427) (_values!6417 thiss!1427) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)) key!909) (getCurrentListMap!3904 lt!460170 lt!460163 (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun dynLambda!1991 (Int (_ BitVec 64)) V!37979)

(assert (=> b!1043857 (= lt!460163 (array!65766 (store (arr!31633 (_values!6417 thiss!1427)) (index!41724 lt!460168) (ValueCellFull!11711 (dynLambda!1991 (defaultEntry!6394 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32170 (_values!6417 thiss!1427))))))

(declare-fun lt!460169 () Unit!33975)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!52 (array!65763 array!65765 (_ BitVec 32) (_ BitVec 32) V!37979 V!37979 (_ BitVec 32) (_ BitVec 64) Int) Unit!33975)

(assert (=> b!1043857 (= lt!460169 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!52 (_keys!11652 thiss!1427) (_values!6417 thiss!1427) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) (index!41724 lt!460168) key!909 (defaultEntry!6394 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043857 (not (arrayContainsKey!0 lt!460170 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460164 () Unit!33975)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65763 (_ BitVec 32) (_ BitVec 64)) Unit!33975)

(assert (=> b!1043857 (= lt!460164 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11652 thiss!1427) (index!41724 lt!460168) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65763 (_ BitVec 32)) Bool)

(assert (=> b!1043857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460170 (mask!30490 thiss!1427))))

(declare-fun lt!460165 () Unit!33975)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65763 (_ BitVec 32) (_ BitVec 32)) Unit!33975)

(assert (=> b!1043857 (= lt!460165 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11652 thiss!1427) (index!41724 lt!460168) (mask!30490 thiss!1427)))))

(declare-datatypes ((List!22039 0))(
  ( (Nil!22036) (Cons!22035 (h!23243 (_ BitVec 64)) (t!31258 List!22039)) )
))
(declare-fun arrayNoDuplicates!0 (array!65763 (_ BitVec 32) List!22039) Bool)

(assert (=> b!1043857 (arrayNoDuplicates!0 lt!460170 #b00000000000000000000000000000000 Nil!22036)))

(declare-fun lt!460166 () Unit!33975)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65763 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22039) Unit!33975)

(assert (=> b!1043857 (= lt!460166 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11652 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41724 lt!460168) #b00000000000000000000000000000000 Nil!22036))))

(declare-fun arrayCountValidKeys!0 (array!65763 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043857 (= (arrayCountValidKeys!0 lt!460170 #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11652 thiss!1427) #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043857 (= lt!460170 (array!65764 (store (arr!31632 (_keys!11652 thiss!1427)) (index!41724 lt!460168) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32169 (_keys!11652 thiss!1427))))))

(declare-fun lt!460167 () Unit!33975)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65763 (_ BitVec 32) (_ BitVec 64)) Unit!33975)

(assert (=> b!1043857 (= lt!460167 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11652 thiss!1427) (index!41724 lt!460168) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!91730 res!695357) b!1043850))

(assert (= (and b!1043850 res!695355) b!1043855))

(assert (= (and b!1043855 res!695356) b!1043857))

(assert (= (and b!1043857 (not res!695354)) b!1043856))

(assert (= (and b!1043852 condMapEmpty!38870) mapIsEmpty!38870))

(assert (= (and b!1043852 (not condMapEmpty!38870)) mapNonEmpty!38870))

(assert (= (and mapNonEmpty!38870 ((_ is ValueCellFull!11711) mapValue!38870)) b!1043854))

(assert (= (and b!1043852 ((_ is ValueCellFull!11711) mapDefault!38870)) b!1043851))

(assert (= b!1043853 b!1043852))

(assert (= start!91730 b!1043853))

(declare-fun b_lambda!16175 () Bool)

(assert (=> (not b_lambda!16175) (not b!1043857)))

(declare-fun t!31256 () Bool)

(declare-fun tb!7041 () Bool)

(assert (=> (and b!1043853 (= (defaultEntry!6394 thiss!1427) (defaultEntry!6394 thiss!1427)) t!31256) tb!7041))

(declare-fun result!14515 () Bool)

(assert (=> tb!7041 (= result!14515 tp_is_empty!24829)))

(assert (=> b!1043857 t!31256))

(declare-fun b_and!33641 () Bool)

(assert (= b_and!33639 (and (=> t!31256 result!14515) b_and!33641)))

(declare-fun m!962691 () Bool)

(assert (=> start!91730 m!962691))

(declare-fun m!962693 () Bool)

(assert (=> b!1043857 m!962693))

(declare-fun m!962695 () Bool)

(assert (=> b!1043857 m!962695))

(declare-fun m!962697 () Bool)

(assert (=> b!1043857 m!962697))

(declare-fun m!962699 () Bool)

(assert (=> b!1043857 m!962699))

(declare-fun m!962701 () Bool)

(assert (=> b!1043857 m!962701))

(declare-fun m!962703 () Bool)

(assert (=> b!1043857 m!962703))

(declare-fun m!962705 () Bool)

(assert (=> b!1043857 m!962705))

(declare-fun m!962707 () Bool)

(assert (=> b!1043857 m!962707))

(declare-fun m!962709 () Bool)

(assert (=> b!1043857 m!962709))

(declare-fun m!962711 () Bool)

(assert (=> b!1043857 m!962711))

(declare-fun m!962713 () Bool)

(assert (=> b!1043857 m!962713))

(declare-fun m!962715 () Bool)

(assert (=> b!1043857 m!962715))

(declare-fun m!962717 () Bool)

(assert (=> b!1043857 m!962717))

(assert (=> b!1043857 m!962709))

(declare-fun m!962719 () Bool)

(assert (=> b!1043857 m!962719))

(declare-fun m!962721 () Bool)

(assert (=> b!1043857 m!962721))

(assert (=> b!1043857 m!962693))

(declare-fun m!962723 () Bool)

(assert (=> b!1043857 m!962723))

(declare-fun m!962725 () Bool)

(assert (=> b!1043857 m!962725))

(declare-fun m!962727 () Bool)

(assert (=> b!1043857 m!962727))

(declare-fun m!962729 () Bool)

(assert (=> b!1043855 m!962729))

(declare-fun m!962731 () Bool)

(assert (=> b!1043853 m!962731))

(declare-fun m!962733 () Bool)

(assert (=> b!1043853 m!962733))

(declare-fun m!962735 () Bool)

(assert (=> mapNonEmpty!38870 m!962735))

(declare-fun m!962737 () Bool)

(assert (=> b!1043856 m!962737))

(check-sat (not b!1043853) (not b_next!21109) (not b_lambda!16175) (not mapNonEmpty!38870) (not b!1043855) (not b!1043856) (not b!1043857) b_and!33641 tp_is_empty!24829 (not start!91730))
(check-sat b_and!33641 (not b_next!21109))
(get-model)

(declare-fun b_lambda!16181 () Bool)

(assert (= b_lambda!16175 (or (and b!1043853 b_free!21109) b_lambda!16181)))

(check-sat (not b!1043853) (not b_lambda!16181) (not b_next!21109) (not mapNonEmpty!38870) (not b!1043855) (not b!1043856) (not b!1043857) b_and!33641 tp_is_empty!24829 (not start!91730))
(check-sat b_and!33641 (not b_next!21109))
(get-model)

(declare-fun b!1043924 () Bool)

(declare-fun e!591574 () SeekEntryResult!9838)

(declare-fun lt!460233 () SeekEntryResult!9838)

(assert (=> b!1043924 (= e!591574 (MissingZero!9838 (index!41725 lt!460233)))))

(declare-fun b!1043925 () Bool)

(declare-fun lt!460235 () SeekEntryResult!9838)

(assert (=> b!1043925 (= e!591574 (ite ((_ is MissingVacant!9838) lt!460235) (MissingZero!9838 (index!41726 lt!460235)) lt!460235))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65763 (_ BitVec 32)) SeekEntryResult!9838)

(assert (=> b!1043925 (= lt!460235 (seekKeyOrZeroReturnVacant!0 (x!93217 lt!460233) (index!41725 lt!460233) (index!41725 lt!460233) key!909 (_keys!11652 thiss!1427) (mask!30490 thiss!1427)))))

(declare-fun b!1043926 () Bool)

(declare-fun e!591573 () SeekEntryResult!9838)

(declare-fun e!591575 () SeekEntryResult!9838)

(assert (=> b!1043926 (= e!591573 e!591575)))

(declare-fun lt!460234 () (_ BitVec 64))

(assert (=> b!1043926 (= lt!460234 (select (arr!31632 (_keys!11652 thiss!1427)) (index!41725 lt!460233)))))

(declare-fun c!105996 () Bool)

(assert (=> b!1043926 (= c!105996 (= lt!460234 key!909))))

(declare-fun b!1043927 () Bool)

(declare-fun c!105995 () Bool)

(assert (=> b!1043927 (= c!105995 (= lt!460234 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1043927 (= e!591575 e!591574)))

(declare-fun b!1043928 () Bool)

(assert (=> b!1043928 (= e!591575 (Found!9838 (index!41725 lt!460233)))))

(declare-fun d!126183 () Bool)

(declare-fun lt!460236 () SeekEntryResult!9838)

(assert (=> d!126183 (and (or ((_ is MissingVacant!9838) lt!460236) (not ((_ is Found!9838) lt!460236)) (and (bvsge (index!41724 lt!460236) #b00000000000000000000000000000000) (bvslt (index!41724 lt!460236) (size!32169 (_keys!11652 thiss!1427))))) (not ((_ is MissingVacant!9838) lt!460236)) (or (not ((_ is Found!9838) lt!460236)) (= (select (arr!31632 (_keys!11652 thiss!1427)) (index!41724 lt!460236)) key!909)))))

(assert (=> d!126183 (= lt!460236 e!591573)))

(declare-fun c!105994 () Bool)

(assert (=> d!126183 (= c!105994 (and ((_ is Intermediate!9838) lt!460233) (undefined!10650 lt!460233)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65763 (_ BitVec 32)) SeekEntryResult!9838)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126183 (= lt!460233 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30490 thiss!1427)) key!909 (_keys!11652 thiss!1427) (mask!30490 thiss!1427)))))

(assert (=> d!126183 (validMask!0 (mask!30490 thiss!1427))))

(assert (=> d!126183 (= (seekEntry!0 key!909 (_keys!11652 thiss!1427) (mask!30490 thiss!1427)) lt!460236)))

(declare-fun b!1043929 () Bool)

(assert (=> b!1043929 (= e!591573 Undefined!9838)))

(assert (= (and d!126183 c!105994) b!1043929))

(assert (= (and d!126183 (not c!105994)) b!1043926))

(assert (= (and b!1043926 c!105996) b!1043928))

(assert (= (and b!1043926 (not c!105996)) b!1043927))

(assert (= (and b!1043927 c!105995) b!1043924))

(assert (= (and b!1043927 (not c!105995)) b!1043925))

(declare-fun m!962835 () Bool)

(assert (=> b!1043925 m!962835))

(declare-fun m!962837 () Bool)

(assert (=> b!1043926 m!962837))

(declare-fun m!962839 () Bool)

(assert (=> d!126183 m!962839))

(declare-fun m!962841 () Bool)

(assert (=> d!126183 m!962841))

(assert (=> d!126183 m!962841))

(declare-fun m!962843 () Bool)

(assert (=> d!126183 m!962843))

(declare-fun m!962845 () Bool)

(assert (=> d!126183 m!962845))

(assert (=> b!1043855 d!126183))

(declare-fun d!126185 () Bool)

(assert (=> d!126185 (= (array_inv!24447 (_keys!11652 thiss!1427)) (bvsge (size!32169 (_keys!11652 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043853 d!126185))

(declare-fun d!126187 () Bool)

(assert (=> d!126187 (= (array_inv!24448 (_values!6417 thiss!1427)) (bvsge (size!32170 (_values!6417 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043853 d!126187))

(declare-fun b!1043972 () Bool)

(declare-fun e!591612 () Bool)

(declare-fun call!44295 () Bool)

(assert (=> b!1043972 (= e!591612 (not call!44295))))

(declare-fun b!1043973 () Bool)

(declare-fun e!591603 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1043973 (= e!591603 (validKeyInArray!0 (select (arr!31632 lt!460170) #b00000000000000000000000000000000)))))

(declare-fun b!1043974 () Bool)

(declare-fun e!591605 () Bool)

(declare-fun e!591602 () Bool)

(assert (=> b!1043974 (= e!591605 e!591602)))

(declare-fun res!695404 () Bool)

(declare-fun call!44290 () Bool)

(assert (=> b!1043974 (= res!695404 call!44290)))

(assert (=> b!1043974 (=> (not res!695404) (not e!591602))))

(declare-fun bm!44287 () Bool)

(declare-fun call!44296 () ListLongMap!13845)

(declare-fun call!44292 () ListLongMap!13845)

(assert (=> bm!44287 (= call!44296 call!44292)))

(declare-fun b!1043975 () Bool)

(declare-fun e!591613 () ListLongMap!13845)

(declare-fun call!44294 () ListLongMap!13845)

(assert (=> b!1043975 (= e!591613 call!44294)))

(declare-fun b!1043976 () Bool)

(declare-fun res!695408 () Bool)

(declare-fun e!591604 () Bool)

(assert (=> b!1043976 (=> (not res!695408) (not e!591604))))

(assert (=> b!1043976 (= res!695408 e!591605)))

(declare-fun c!106010 () Bool)

(assert (=> b!1043976 (= c!106010 (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!126189 () Bool)

(assert (=> d!126189 e!591604))

(declare-fun res!695402 () Bool)

(assert (=> d!126189 (=> (not res!695402) (not e!591604))))

(assert (=> d!126189 (= res!695402 (or (bvsge #b00000000000000000000000000000000 (size!32169 lt!460170)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32169 lt!460170)))))))

(declare-fun lt!460295 () ListLongMap!13845)

(declare-fun lt!460300 () ListLongMap!13845)

(assert (=> d!126189 (= lt!460295 lt!460300)))

(declare-fun lt!460288 () Unit!33975)

(declare-fun e!591610 () Unit!33975)

(assert (=> d!126189 (= lt!460288 e!591610)))

(declare-fun c!106009 () Bool)

(assert (=> d!126189 (= c!106009 e!591603)))

(declare-fun res!695403 () Bool)

(assert (=> d!126189 (=> (not res!695403) (not e!591603))))

(assert (=> d!126189 (= res!695403 (bvslt #b00000000000000000000000000000000 (size!32169 lt!460170)))))

(declare-fun e!591606 () ListLongMap!13845)

(assert (=> d!126189 (= lt!460300 e!591606)))

(declare-fun c!106011 () Bool)

(assert (=> d!126189 (= c!106011 (and (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126189 (validMask!0 (mask!30490 thiss!1427))))

(assert (=> d!126189 (= (getCurrentListMap!3904 lt!460170 lt!460163 (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)) lt!460295)))

(declare-fun call!44291 () ListLongMap!13845)

(declare-fun bm!44288 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3569 (array!65763 array!65765 (_ BitVec 32) (_ BitVec 32) V!37979 V!37979 (_ BitVec 32) Int) ListLongMap!13845)

(assert (=> bm!44288 (= call!44291 (getCurrentListMapNoExtraKeys!3569 lt!460170 lt!460163 (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun bm!44289 () Bool)

(assert (=> bm!44289 (= call!44295 (contains!6046 lt!460295 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043977 () Bool)

(declare-fun apply!903 (ListLongMap!13845 (_ BitVec 64)) V!37979)

(assert (=> b!1043977 (= e!591602 (= (apply!903 lt!460295 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6228 thiss!1427)))))

(declare-fun b!1043978 () Bool)

(declare-fun Unit!33985 () Unit!33975)

(assert (=> b!1043978 (= e!591610 Unit!33985)))

(declare-fun b!1043979 () Bool)

(declare-fun e!591608 () Bool)

(declare-fun e!591611 () Bool)

(assert (=> b!1043979 (= e!591608 e!591611)))

(declare-fun res!695401 () Bool)

(assert (=> b!1043979 (=> (not res!695401) (not e!591611))))

(assert (=> b!1043979 (= res!695401 (contains!6046 lt!460295 (select (arr!31632 lt!460170) #b00000000000000000000000000000000)))))

(assert (=> b!1043979 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32169 lt!460170)))))

(declare-fun bm!44290 () Bool)

(assert (=> bm!44290 (= call!44290 (contains!6046 lt!460295 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043980 () Bool)

(declare-fun e!591609 () Bool)

(assert (=> b!1043980 (= e!591609 (validKeyInArray!0 (select (arr!31632 lt!460170) #b00000000000000000000000000000000)))))

(declare-fun bm!44291 () Bool)

(assert (=> bm!44291 (= call!44292 call!44291)))

(declare-fun b!1043981 () Bool)

(declare-fun res!695406 () Bool)

(assert (=> b!1043981 (=> (not res!695406) (not e!591604))))

(assert (=> b!1043981 (= res!695406 e!591608)))

(declare-fun res!695400 () Bool)

(assert (=> b!1043981 (=> res!695400 e!591608)))

(assert (=> b!1043981 (= res!695400 (not e!591609))))

(declare-fun res!695405 () Bool)

(assert (=> b!1043981 (=> (not res!695405) (not e!591609))))

(assert (=> b!1043981 (= res!695405 (bvslt #b00000000000000000000000000000000 (size!32169 lt!460170)))))

(declare-fun b!1043982 () Bool)

(assert (=> b!1043982 (= e!591604 e!591612)))

(declare-fun c!106012 () Bool)

(assert (=> b!1043982 (= c!106012 (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1043983 () Bool)

(declare-fun e!591614 () Bool)

(assert (=> b!1043983 (= e!591614 (= (apply!903 lt!460295 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6228 thiss!1427)))))

(declare-fun b!1043984 () Bool)

(declare-fun call!44293 () ListLongMap!13845)

(declare-fun +!3134 (ListLongMap!13845 tuple2!15824) ListLongMap!13845)

(assert (=> b!1043984 (= e!591606 (+!3134 call!44293 (tuple2!15825 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6228 thiss!1427))))))

(declare-fun c!106014 () Bool)

(declare-fun bm!44292 () Bool)

(assert (=> bm!44292 (= call!44293 (+!3134 (ite c!106011 call!44291 (ite c!106014 call!44292 call!44296)) (ite (or c!106011 c!106014) (tuple2!15825 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6228 thiss!1427)) (tuple2!15825 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6228 thiss!1427)))))))

(declare-fun b!1043985 () Bool)

(assert (=> b!1043985 (= e!591613 call!44296)))

(declare-fun b!1043986 () Bool)

(declare-fun lt!460293 () Unit!33975)

(assert (=> b!1043986 (= e!591610 lt!460293)))

(declare-fun lt!460289 () ListLongMap!13845)

(assert (=> b!1043986 (= lt!460289 (getCurrentListMapNoExtraKeys!3569 lt!460170 lt!460163 (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!460284 () (_ BitVec 64))

(assert (=> b!1043986 (= lt!460284 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460294 () (_ BitVec 64))

(assert (=> b!1043986 (= lt!460294 (select (arr!31632 lt!460170) #b00000000000000000000000000000000))))

(declare-fun lt!460299 () Unit!33975)

(declare-fun addStillContains!622 (ListLongMap!13845 (_ BitVec 64) V!37979 (_ BitVec 64)) Unit!33975)

(assert (=> b!1043986 (= lt!460299 (addStillContains!622 lt!460289 lt!460284 (zeroValue!6228 thiss!1427) lt!460294))))

(assert (=> b!1043986 (contains!6046 (+!3134 lt!460289 (tuple2!15825 lt!460284 (zeroValue!6228 thiss!1427))) lt!460294)))

(declare-fun lt!460298 () Unit!33975)

(assert (=> b!1043986 (= lt!460298 lt!460299)))

(declare-fun lt!460292 () ListLongMap!13845)

(assert (=> b!1043986 (= lt!460292 (getCurrentListMapNoExtraKeys!3569 lt!460170 lt!460163 (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!460283 () (_ BitVec 64))

(assert (=> b!1043986 (= lt!460283 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460297 () (_ BitVec 64))

(assert (=> b!1043986 (= lt!460297 (select (arr!31632 lt!460170) #b00000000000000000000000000000000))))

(declare-fun lt!460290 () Unit!33975)

(declare-fun addApplyDifferent!478 (ListLongMap!13845 (_ BitVec 64) V!37979 (_ BitVec 64)) Unit!33975)

(assert (=> b!1043986 (= lt!460290 (addApplyDifferent!478 lt!460292 lt!460283 (minValue!6228 thiss!1427) lt!460297))))

(assert (=> b!1043986 (= (apply!903 (+!3134 lt!460292 (tuple2!15825 lt!460283 (minValue!6228 thiss!1427))) lt!460297) (apply!903 lt!460292 lt!460297))))

(declare-fun lt!460296 () Unit!33975)

(assert (=> b!1043986 (= lt!460296 lt!460290)))

(declare-fun lt!460286 () ListLongMap!13845)

(assert (=> b!1043986 (= lt!460286 (getCurrentListMapNoExtraKeys!3569 lt!460170 lt!460163 (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!460301 () (_ BitVec 64))

(assert (=> b!1043986 (= lt!460301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460291 () (_ BitVec 64))

(assert (=> b!1043986 (= lt!460291 (select (arr!31632 lt!460170) #b00000000000000000000000000000000))))

(declare-fun lt!460285 () Unit!33975)

(assert (=> b!1043986 (= lt!460285 (addApplyDifferent!478 lt!460286 lt!460301 (zeroValue!6228 thiss!1427) lt!460291))))

(assert (=> b!1043986 (= (apply!903 (+!3134 lt!460286 (tuple2!15825 lt!460301 (zeroValue!6228 thiss!1427))) lt!460291) (apply!903 lt!460286 lt!460291))))

(declare-fun lt!460282 () Unit!33975)

(assert (=> b!1043986 (= lt!460282 lt!460285)))

(declare-fun lt!460287 () ListLongMap!13845)

(assert (=> b!1043986 (= lt!460287 (getCurrentListMapNoExtraKeys!3569 lt!460170 lt!460163 (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!460302 () (_ BitVec 64))

(assert (=> b!1043986 (= lt!460302 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460281 () (_ BitVec 64))

(assert (=> b!1043986 (= lt!460281 (select (arr!31632 lt!460170) #b00000000000000000000000000000000))))

(assert (=> b!1043986 (= lt!460293 (addApplyDifferent!478 lt!460287 lt!460302 (minValue!6228 thiss!1427) lt!460281))))

(assert (=> b!1043986 (= (apply!903 (+!3134 lt!460287 (tuple2!15825 lt!460302 (minValue!6228 thiss!1427))) lt!460281) (apply!903 lt!460287 lt!460281))))

(declare-fun b!1043987 () Bool)

(assert (=> b!1043987 (= e!591612 e!591614)))

(declare-fun res!695407 () Bool)

(assert (=> b!1043987 (= res!695407 call!44295)))

(assert (=> b!1043987 (=> (not res!695407) (not e!591614))))

(declare-fun b!1043988 () Bool)

(assert (=> b!1043988 (= e!591605 (not call!44290))))

(declare-fun b!1043989 () Bool)

(declare-fun c!106013 () Bool)

(assert (=> b!1043989 (= c!106013 (and (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!591607 () ListLongMap!13845)

(assert (=> b!1043989 (= e!591607 e!591613)))

(declare-fun b!1043990 () Bool)

(declare-fun get!16542 (ValueCell!11711 V!37979) V!37979)

(assert (=> b!1043990 (= e!591611 (= (apply!903 lt!460295 (select (arr!31632 lt!460170) #b00000000000000000000000000000000)) (get!16542 (select (arr!31633 lt!460163) #b00000000000000000000000000000000) (dynLambda!1991 (defaultEntry!6394 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043990 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32170 lt!460163)))))

(assert (=> b!1043990 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32169 lt!460170)))))

(declare-fun b!1043991 () Bool)

(assert (=> b!1043991 (= e!591607 call!44294)))

(declare-fun b!1043992 () Bool)

(assert (=> b!1043992 (= e!591606 e!591607)))

(assert (=> b!1043992 (= c!106014 (and (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44293 () Bool)

(assert (=> bm!44293 (= call!44294 call!44293)))

(assert (= (and d!126189 c!106011) b!1043984))

(assert (= (and d!126189 (not c!106011)) b!1043992))

(assert (= (and b!1043992 c!106014) b!1043991))

(assert (= (and b!1043992 (not c!106014)) b!1043989))

(assert (= (and b!1043989 c!106013) b!1043975))

(assert (= (and b!1043989 (not c!106013)) b!1043985))

(assert (= (or b!1043975 b!1043985) bm!44287))

(assert (= (or b!1043991 bm!44287) bm!44291))

(assert (= (or b!1043991 b!1043975) bm!44293))

(assert (= (or b!1043984 bm!44291) bm!44288))

(assert (= (or b!1043984 bm!44293) bm!44292))

(assert (= (and d!126189 res!695403) b!1043973))

(assert (= (and d!126189 c!106009) b!1043986))

(assert (= (and d!126189 (not c!106009)) b!1043978))

(assert (= (and d!126189 res!695402) b!1043981))

(assert (= (and b!1043981 res!695405) b!1043980))

(assert (= (and b!1043981 (not res!695400)) b!1043979))

(assert (= (and b!1043979 res!695401) b!1043990))

(assert (= (and b!1043981 res!695406) b!1043976))

(assert (= (and b!1043976 c!106010) b!1043974))

(assert (= (and b!1043976 (not c!106010)) b!1043988))

(assert (= (and b!1043974 res!695404) b!1043977))

(assert (= (or b!1043974 b!1043988) bm!44290))

(assert (= (and b!1043976 res!695408) b!1043982))

(assert (= (and b!1043982 c!106012) b!1043987))

(assert (= (and b!1043982 (not c!106012)) b!1043972))

(assert (= (and b!1043987 res!695407) b!1043983))

(assert (= (or b!1043987 b!1043972) bm!44289))

(declare-fun b_lambda!16183 () Bool)

(assert (=> (not b_lambda!16183) (not b!1043990)))

(assert (=> b!1043990 t!31256))

(declare-fun b_and!33651 () Bool)

(assert (= b_and!33641 (and (=> t!31256 result!14515) b_and!33651)))

(assert (=> d!126189 m!962845))

(assert (=> b!1043990 m!962727))

(declare-fun m!962847 () Bool)

(assert (=> b!1043990 m!962847))

(assert (=> b!1043990 m!962847))

(assert (=> b!1043990 m!962727))

(declare-fun m!962849 () Bool)

(assert (=> b!1043990 m!962849))

(declare-fun m!962851 () Bool)

(assert (=> b!1043990 m!962851))

(declare-fun m!962853 () Bool)

(assert (=> b!1043990 m!962853))

(assert (=> b!1043990 m!962851))

(declare-fun m!962855 () Bool)

(assert (=> bm!44290 m!962855))

(assert (=> b!1043973 m!962851))

(assert (=> b!1043973 m!962851))

(declare-fun m!962857 () Bool)

(assert (=> b!1043973 m!962857))

(declare-fun m!962859 () Bool)

(assert (=> b!1043984 m!962859))

(declare-fun m!962861 () Bool)

(assert (=> b!1043983 m!962861))

(declare-fun m!962863 () Bool)

(assert (=> b!1043977 m!962863))

(declare-fun m!962865 () Bool)

(assert (=> bm!44292 m!962865))

(declare-fun m!962867 () Bool)

(assert (=> bm!44289 m!962867))

(assert (=> b!1043980 m!962851))

(assert (=> b!1043980 m!962851))

(assert (=> b!1043980 m!962857))

(declare-fun m!962869 () Bool)

(assert (=> bm!44288 m!962869))

(assert (=> b!1043979 m!962851))

(assert (=> b!1043979 m!962851))

(declare-fun m!962871 () Bool)

(assert (=> b!1043979 m!962871))

(declare-fun m!962873 () Bool)

(assert (=> b!1043986 m!962873))

(assert (=> b!1043986 m!962869))

(declare-fun m!962875 () Bool)

(assert (=> b!1043986 m!962875))

(declare-fun m!962877 () Bool)

(assert (=> b!1043986 m!962877))

(declare-fun m!962879 () Bool)

(assert (=> b!1043986 m!962879))

(declare-fun m!962881 () Bool)

(assert (=> b!1043986 m!962881))

(declare-fun m!962883 () Bool)

(assert (=> b!1043986 m!962883))

(assert (=> b!1043986 m!962877))

(assert (=> b!1043986 m!962881))

(assert (=> b!1043986 m!962851))

(declare-fun m!962885 () Bool)

(assert (=> b!1043986 m!962885))

(declare-fun m!962887 () Bool)

(assert (=> b!1043986 m!962887))

(declare-fun m!962889 () Bool)

(assert (=> b!1043986 m!962889))

(declare-fun m!962891 () Bool)

(assert (=> b!1043986 m!962891))

(declare-fun m!962893 () Bool)

(assert (=> b!1043986 m!962893))

(declare-fun m!962895 () Bool)

(assert (=> b!1043986 m!962895))

(assert (=> b!1043986 m!962893))

(declare-fun m!962897 () Bool)

(assert (=> b!1043986 m!962897))

(declare-fun m!962899 () Bool)

(assert (=> b!1043986 m!962899))

(assert (=> b!1043986 m!962899))

(declare-fun m!962901 () Bool)

(assert (=> b!1043986 m!962901))

(assert (=> b!1043857 d!126189))

(declare-fun b!1044001 () Bool)

(declare-fun e!591621 () Bool)

(declare-fun call!44299 () Bool)

(assert (=> b!1044001 (= e!591621 call!44299)))

(declare-fun b!1044002 () Bool)

(declare-fun e!591622 () Bool)

(assert (=> b!1044002 (= e!591622 call!44299)))

(declare-fun b!1044003 () Bool)

(assert (=> b!1044003 (= e!591622 e!591621)))

(declare-fun lt!460311 () (_ BitVec 64))

(assert (=> b!1044003 (= lt!460311 (select (arr!31632 lt!460170) #b00000000000000000000000000000000))))

(declare-fun lt!460309 () Unit!33975)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65763 (_ BitVec 64) (_ BitVec 32)) Unit!33975)

(assert (=> b!1044003 (= lt!460309 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!460170 lt!460311 #b00000000000000000000000000000000))))

(assert (=> b!1044003 (arrayContainsKey!0 lt!460170 lt!460311 #b00000000000000000000000000000000)))

(declare-fun lt!460310 () Unit!33975)

(assert (=> b!1044003 (= lt!460310 lt!460309)))

(declare-fun res!695414 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65763 (_ BitVec 32)) SeekEntryResult!9838)

(assert (=> b!1044003 (= res!695414 (= (seekEntryOrOpen!0 (select (arr!31632 lt!460170) #b00000000000000000000000000000000) lt!460170 (mask!30490 thiss!1427)) (Found!9838 #b00000000000000000000000000000000)))))

(assert (=> b!1044003 (=> (not res!695414) (not e!591621))))

(declare-fun b!1044004 () Bool)

(declare-fun e!591623 () Bool)

(assert (=> b!1044004 (= e!591623 e!591622)))

(declare-fun c!106017 () Bool)

(assert (=> b!1044004 (= c!106017 (validKeyInArray!0 (select (arr!31632 lt!460170) #b00000000000000000000000000000000)))))

(declare-fun d!126191 () Bool)

(declare-fun res!695413 () Bool)

(assert (=> d!126191 (=> res!695413 e!591623)))

(assert (=> d!126191 (= res!695413 (bvsge #b00000000000000000000000000000000 (size!32169 lt!460170)))))

(assert (=> d!126191 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460170 (mask!30490 thiss!1427)) e!591623)))

(declare-fun bm!44296 () Bool)

(assert (=> bm!44296 (= call!44299 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!460170 (mask!30490 thiss!1427)))))

(assert (= (and d!126191 (not res!695413)) b!1044004))

(assert (= (and b!1044004 c!106017) b!1044003))

(assert (= (and b!1044004 (not c!106017)) b!1044002))

(assert (= (and b!1044003 res!695414) b!1044001))

(assert (= (or b!1044001 b!1044002) bm!44296))

(assert (=> b!1044003 m!962851))

(declare-fun m!962903 () Bool)

(assert (=> b!1044003 m!962903))

(declare-fun m!962905 () Bool)

(assert (=> b!1044003 m!962905))

(assert (=> b!1044003 m!962851))

(declare-fun m!962907 () Bool)

(assert (=> b!1044003 m!962907))

(assert (=> b!1044004 m!962851))

(assert (=> b!1044004 m!962851))

(assert (=> b!1044004 m!962857))

(declare-fun m!962909 () Bool)

(assert (=> bm!44296 m!962909))

(assert (=> b!1043857 d!126191))

(declare-fun d!126193 () Bool)

(declare-fun e!591626 () Bool)

(assert (=> d!126193 e!591626))

(declare-fun res!695417 () Bool)

(assert (=> d!126193 (=> (not res!695417) (not e!591626))))

(assert (=> d!126193 (= res!695417 (and (bvsge (index!41724 lt!460168) #b00000000000000000000000000000000) (bvslt (index!41724 lt!460168) (size!32169 (_keys!11652 thiss!1427)))))))

(declare-fun lt!460314 () Unit!33975)

(declare-fun choose!1717 (array!65763 array!65765 (_ BitVec 32) (_ BitVec 32) V!37979 V!37979 (_ BitVec 32) (_ BitVec 64) Int) Unit!33975)

(assert (=> d!126193 (= lt!460314 (choose!1717 (_keys!11652 thiss!1427) (_values!6417 thiss!1427) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) (index!41724 lt!460168) key!909 (defaultEntry!6394 thiss!1427)))))

(assert (=> d!126193 (validMask!0 (mask!30490 thiss!1427))))

(assert (=> d!126193 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!52 (_keys!11652 thiss!1427) (_values!6417 thiss!1427) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) (index!41724 lt!460168) key!909 (defaultEntry!6394 thiss!1427)) lt!460314)))

(declare-fun b!1044007 () Bool)

(assert (=> b!1044007 (= e!591626 (= (-!530 (getCurrentListMap!3904 (_keys!11652 thiss!1427) (_values!6417 thiss!1427) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)) key!909) (getCurrentListMap!3904 (array!65764 (store (arr!31632 (_keys!11652 thiss!1427)) (index!41724 lt!460168) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32169 (_keys!11652 thiss!1427))) (array!65766 (store (arr!31633 (_values!6417 thiss!1427)) (index!41724 lt!460168) (ValueCellFull!11711 (dynLambda!1991 (defaultEntry!6394 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32170 (_values!6417 thiss!1427))) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427))))))

(assert (=> b!1044007 (bvslt (index!41724 lt!460168) (size!32170 (_values!6417 thiss!1427)))))

(assert (= (and d!126193 res!695417) b!1044007))

(declare-fun b_lambda!16185 () Bool)

(assert (=> (not b_lambda!16185) (not b!1044007)))

(assert (=> b!1044007 t!31256))

(declare-fun b_and!33653 () Bool)

(assert (= b_and!33651 (and (=> t!31256 result!14515) b_and!33653)))

(declare-fun m!962911 () Bool)

(assert (=> d!126193 m!962911))

(assert (=> d!126193 m!962845))

(assert (=> b!1044007 m!962717))

(assert (=> b!1044007 m!962727))

(assert (=> b!1044007 m!962709))

(assert (=> b!1044007 m!962699))

(assert (=> b!1044007 m!962709))

(assert (=> b!1044007 m!962711))

(declare-fun m!962913 () Bool)

(assert (=> b!1044007 m!962913))

(assert (=> b!1043857 d!126193))

(declare-fun d!126195 () Bool)

(declare-fun lt!460317 () ListLongMap!13845)

(assert (=> d!126195 (not (contains!6046 lt!460317 key!909))))

(declare-fun removeStrictlySorted!60 (List!22038 (_ BitVec 64)) List!22038)

(assert (=> d!126195 (= lt!460317 (ListLongMap!13846 (removeStrictlySorted!60 (toList!6938 (getCurrentListMap!3904 (_keys!11652 thiss!1427) (_values!6417 thiss!1427) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427))) key!909)))))

(assert (=> d!126195 (= (-!530 (getCurrentListMap!3904 (_keys!11652 thiss!1427) (_values!6417 thiss!1427) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)) key!909) lt!460317)))

(declare-fun bs!30482 () Bool)

(assert (= bs!30482 d!126195))

(declare-fun m!962915 () Bool)

(assert (=> bs!30482 m!962915))

(declare-fun m!962917 () Bool)

(assert (=> bs!30482 m!962917))

(assert (=> b!1043857 d!126195))

(declare-fun b!1044016 () Bool)

(declare-fun e!591632 () (_ BitVec 32))

(assert (=> b!1044016 (= e!591632 #b00000000000000000000000000000000)))

(declare-fun b!1044017 () Bool)

(declare-fun e!591631 () (_ BitVec 32))

(declare-fun call!44302 () (_ BitVec 32))

(assert (=> b!1044017 (= e!591631 (bvadd #b00000000000000000000000000000001 call!44302))))

(declare-fun d!126197 () Bool)

(declare-fun lt!460320 () (_ BitVec 32))

(assert (=> d!126197 (and (bvsge lt!460320 #b00000000000000000000000000000000) (bvsle lt!460320 (bvsub (size!32169 lt!460170) #b00000000000000000000000000000000)))))

(assert (=> d!126197 (= lt!460320 e!591632)))

(declare-fun c!106022 () Bool)

(assert (=> d!126197 (= c!106022 (bvsge #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))))))

(assert (=> d!126197 (and (bvsle #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32169 (_keys!11652 thiss!1427)) (size!32169 lt!460170)))))

(assert (=> d!126197 (= (arrayCountValidKeys!0 lt!460170 #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))) lt!460320)))

(declare-fun b!1044018 () Bool)

(assert (=> b!1044018 (= e!591632 e!591631)))

(declare-fun c!106023 () Bool)

(assert (=> b!1044018 (= c!106023 (validKeyInArray!0 (select (arr!31632 lt!460170) #b00000000000000000000000000000000)))))

(declare-fun bm!44299 () Bool)

(assert (=> bm!44299 (= call!44302 (arrayCountValidKeys!0 lt!460170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32169 (_keys!11652 thiss!1427))))))

(declare-fun b!1044019 () Bool)

(assert (=> b!1044019 (= e!591631 call!44302)))

(assert (= (and d!126197 c!106022) b!1044016))

(assert (= (and d!126197 (not c!106022)) b!1044018))

(assert (= (and b!1044018 c!106023) b!1044017))

(assert (= (and b!1044018 (not c!106023)) b!1044019))

(assert (= (or b!1044017 b!1044019) bm!44299))

(assert (=> b!1044018 m!962851))

(assert (=> b!1044018 m!962851))

(assert (=> b!1044018 m!962857))

(declare-fun m!962919 () Bool)

(assert (=> bm!44299 m!962919))

(assert (=> b!1043857 d!126197))

(declare-fun d!126199 () Bool)

(declare-fun e!591637 () Bool)

(assert (=> d!126199 e!591637))

(declare-fun res!695420 () Bool)

(assert (=> d!126199 (=> res!695420 e!591637)))

(declare-fun lt!460329 () Bool)

(assert (=> d!126199 (= res!695420 (not lt!460329))))

(declare-fun lt!460332 () Bool)

(assert (=> d!126199 (= lt!460329 lt!460332)))

(declare-fun lt!460331 () Unit!33975)

(declare-fun e!591638 () Unit!33975)

(assert (=> d!126199 (= lt!460331 e!591638)))

(declare-fun c!106026 () Bool)

(assert (=> d!126199 (= c!106026 lt!460332)))

(declare-fun containsKey!565 (List!22038 (_ BitVec 64)) Bool)

(assert (=> d!126199 (= lt!460332 (containsKey!565 (toList!6938 (getCurrentListMap!3904 (_keys!11652 (_2!7922 lt!460162)) (_values!6417 (_2!7922 lt!460162)) (mask!30490 (_2!7922 lt!460162)) (extraKeys!6122 (_2!7922 lt!460162)) (zeroValue!6228 (_2!7922 lt!460162)) (minValue!6228 (_2!7922 lt!460162)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7922 lt!460162)))) key!909))))

(assert (=> d!126199 (= (contains!6046 (getCurrentListMap!3904 (_keys!11652 (_2!7922 lt!460162)) (_values!6417 (_2!7922 lt!460162)) (mask!30490 (_2!7922 lt!460162)) (extraKeys!6122 (_2!7922 lt!460162)) (zeroValue!6228 (_2!7922 lt!460162)) (minValue!6228 (_2!7922 lt!460162)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7922 lt!460162))) key!909) lt!460329)))

(declare-fun b!1044026 () Bool)

(declare-fun lt!460330 () Unit!33975)

(assert (=> b!1044026 (= e!591638 lt!460330)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!397 (List!22038 (_ BitVec 64)) Unit!33975)

(assert (=> b!1044026 (= lt!460330 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6938 (getCurrentListMap!3904 (_keys!11652 (_2!7922 lt!460162)) (_values!6417 (_2!7922 lt!460162)) (mask!30490 (_2!7922 lt!460162)) (extraKeys!6122 (_2!7922 lt!460162)) (zeroValue!6228 (_2!7922 lt!460162)) (minValue!6228 (_2!7922 lt!460162)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7922 lt!460162)))) key!909))))

(declare-datatypes ((Option!643 0))(
  ( (Some!642 (v!15058 V!37979)) (None!641) )
))
(declare-fun isDefined!440 (Option!643) Bool)

(declare-fun getValueByKey!592 (List!22038 (_ BitVec 64)) Option!643)

(assert (=> b!1044026 (isDefined!440 (getValueByKey!592 (toList!6938 (getCurrentListMap!3904 (_keys!11652 (_2!7922 lt!460162)) (_values!6417 (_2!7922 lt!460162)) (mask!30490 (_2!7922 lt!460162)) (extraKeys!6122 (_2!7922 lt!460162)) (zeroValue!6228 (_2!7922 lt!460162)) (minValue!6228 (_2!7922 lt!460162)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7922 lt!460162)))) key!909))))

(declare-fun b!1044027 () Bool)

(declare-fun Unit!33986 () Unit!33975)

(assert (=> b!1044027 (= e!591638 Unit!33986)))

(declare-fun b!1044028 () Bool)

(assert (=> b!1044028 (= e!591637 (isDefined!440 (getValueByKey!592 (toList!6938 (getCurrentListMap!3904 (_keys!11652 (_2!7922 lt!460162)) (_values!6417 (_2!7922 lt!460162)) (mask!30490 (_2!7922 lt!460162)) (extraKeys!6122 (_2!7922 lt!460162)) (zeroValue!6228 (_2!7922 lt!460162)) (minValue!6228 (_2!7922 lt!460162)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7922 lt!460162)))) key!909)))))

(assert (= (and d!126199 c!106026) b!1044026))

(assert (= (and d!126199 (not c!106026)) b!1044027))

(assert (= (and d!126199 (not res!695420)) b!1044028))

(declare-fun m!962921 () Bool)

(assert (=> d!126199 m!962921))

(declare-fun m!962923 () Bool)

(assert (=> b!1044026 m!962923))

(declare-fun m!962925 () Bool)

(assert (=> b!1044026 m!962925))

(assert (=> b!1044026 m!962925))

(declare-fun m!962927 () Bool)

(assert (=> b!1044026 m!962927))

(assert (=> b!1044028 m!962925))

(assert (=> b!1044028 m!962925))

(assert (=> b!1044028 m!962927))

(assert (=> b!1043857 d!126199))

(declare-fun d!126201 () Bool)

(declare-fun e!591641 () Bool)

(assert (=> d!126201 e!591641))

(declare-fun res!695423 () Bool)

(assert (=> d!126201 (=> (not res!695423) (not e!591641))))

(assert (=> d!126201 (= res!695423 (and (bvsge (index!41724 lt!460168) #b00000000000000000000000000000000) (bvslt (index!41724 lt!460168) (size!32169 (_keys!11652 thiss!1427)))))))

(declare-fun lt!460335 () Unit!33975)

(declare-fun choose!53 (array!65763 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22039) Unit!33975)

(assert (=> d!126201 (= lt!460335 (choose!53 (_keys!11652 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41724 lt!460168) #b00000000000000000000000000000000 Nil!22036))))

(assert (=> d!126201 (bvslt (size!32169 (_keys!11652 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126201 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11652 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41724 lt!460168) #b00000000000000000000000000000000 Nil!22036) lt!460335)))

(declare-fun b!1044031 () Bool)

(assert (=> b!1044031 (= e!591641 (arrayNoDuplicates!0 (array!65764 (store (arr!31632 (_keys!11652 thiss!1427)) (index!41724 lt!460168) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32169 (_keys!11652 thiss!1427))) #b00000000000000000000000000000000 Nil!22036))))

(assert (= (and d!126201 res!695423) b!1044031))

(declare-fun m!962929 () Bool)

(assert (=> d!126201 m!962929))

(assert (=> b!1044031 m!962717))

(declare-fun m!962931 () Bool)

(assert (=> b!1044031 m!962931))

(assert (=> b!1043857 d!126201))

(declare-fun b!1044041 () Bool)

(declare-fun res!695434 () Bool)

(declare-fun e!591646 () Bool)

(assert (=> b!1044041 (=> (not res!695434) (not e!591646))))

(assert (=> b!1044041 (= res!695434 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1044043 () Bool)

(declare-fun e!591647 () Bool)

(assert (=> b!1044043 (= e!591647 (= (arrayCountValidKeys!0 (array!65764 (store (arr!31632 (_keys!11652 thiss!1427)) (index!41724 lt!460168) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32169 (_keys!11652 thiss!1427))) #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11652 thiss!1427) #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1044042 () Bool)

(assert (=> b!1044042 (= e!591646 (bvslt (size!32169 (_keys!11652 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!126203 () Bool)

(assert (=> d!126203 e!591647))

(declare-fun res!695433 () Bool)

(assert (=> d!126203 (=> (not res!695433) (not e!591647))))

(assert (=> d!126203 (= res!695433 (and (bvsge (index!41724 lt!460168) #b00000000000000000000000000000000) (bvslt (index!41724 lt!460168) (size!32169 (_keys!11652 thiss!1427)))))))

(declare-fun lt!460338 () Unit!33975)

(declare-fun choose!82 (array!65763 (_ BitVec 32) (_ BitVec 64)) Unit!33975)

(assert (=> d!126203 (= lt!460338 (choose!82 (_keys!11652 thiss!1427) (index!41724 lt!460168) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126203 e!591646))

(declare-fun res!695432 () Bool)

(assert (=> d!126203 (=> (not res!695432) (not e!591646))))

(assert (=> d!126203 (= res!695432 (and (bvsge (index!41724 lt!460168) #b00000000000000000000000000000000) (bvslt (index!41724 lt!460168) (size!32169 (_keys!11652 thiss!1427)))))))

(assert (=> d!126203 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11652 thiss!1427) (index!41724 lt!460168) #b1000000000000000000000000000000000000000000000000000000000000000) lt!460338)))

(declare-fun b!1044040 () Bool)

(declare-fun res!695435 () Bool)

(assert (=> b!1044040 (=> (not res!695435) (not e!591646))))

(assert (=> b!1044040 (= res!695435 (validKeyInArray!0 (select (arr!31632 (_keys!11652 thiss!1427)) (index!41724 lt!460168))))))

(assert (= (and d!126203 res!695432) b!1044040))

(assert (= (and b!1044040 res!695435) b!1044041))

(assert (= (and b!1044041 res!695434) b!1044042))

(assert (= (and d!126203 res!695433) b!1044043))

(declare-fun m!962933 () Bool)

(assert (=> b!1044041 m!962933))

(assert (=> b!1044043 m!962717))

(declare-fun m!962935 () Bool)

(assert (=> b!1044043 m!962935))

(assert (=> b!1044043 m!962703))

(declare-fun m!962937 () Bool)

(assert (=> d!126203 m!962937))

(declare-fun m!962939 () Bool)

(assert (=> b!1044040 m!962939))

(assert (=> b!1044040 m!962939))

(declare-fun m!962941 () Bool)

(assert (=> b!1044040 m!962941))

(assert (=> b!1043857 d!126203))

(declare-fun b!1044044 () Bool)

(declare-fun e!591658 () Bool)

(declare-fun call!44308 () Bool)

(assert (=> b!1044044 (= e!591658 (not call!44308))))

(declare-fun b!1044045 () Bool)

(declare-fun e!591649 () Bool)

(assert (=> b!1044045 (= e!591649 (validKeyInArray!0 (select (arr!31632 (_keys!11652 (_2!7922 lt!460162))) #b00000000000000000000000000000000)))))

(declare-fun b!1044046 () Bool)

(declare-fun e!591651 () Bool)

(declare-fun e!591648 () Bool)

(assert (=> b!1044046 (= e!591651 e!591648)))

(declare-fun res!695440 () Bool)

(declare-fun call!44303 () Bool)

(assert (=> b!1044046 (= res!695440 call!44303)))

(assert (=> b!1044046 (=> (not res!695440) (not e!591648))))

(declare-fun bm!44300 () Bool)

(declare-fun call!44309 () ListLongMap!13845)

(declare-fun call!44305 () ListLongMap!13845)

(assert (=> bm!44300 (= call!44309 call!44305)))

(declare-fun b!1044047 () Bool)

(declare-fun e!591659 () ListLongMap!13845)

(declare-fun call!44307 () ListLongMap!13845)

(assert (=> b!1044047 (= e!591659 call!44307)))

(declare-fun b!1044048 () Bool)

(declare-fun res!695444 () Bool)

(declare-fun e!591650 () Bool)

(assert (=> b!1044048 (=> (not res!695444) (not e!591650))))

(assert (=> b!1044048 (= res!695444 e!591651)))

(declare-fun c!106028 () Bool)

(assert (=> b!1044048 (= c!106028 (not (= (bvand (extraKeys!6122 (_2!7922 lt!460162)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!126205 () Bool)

(assert (=> d!126205 e!591650))

(declare-fun res!695438 () Bool)

(assert (=> d!126205 (=> (not res!695438) (not e!591650))))

(assert (=> d!126205 (= res!695438 (or (bvsge #b00000000000000000000000000000000 (size!32169 (_keys!11652 (_2!7922 lt!460162)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32169 (_keys!11652 (_2!7922 lt!460162)))))))))

(declare-fun lt!460353 () ListLongMap!13845)

(declare-fun lt!460358 () ListLongMap!13845)

(assert (=> d!126205 (= lt!460353 lt!460358)))

(declare-fun lt!460346 () Unit!33975)

(declare-fun e!591656 () Unit!33975)

(assert (=> d!126205 (= lt!460346 e!591656)))

(declare-fun c!106027 () Bool)

(assert (=> d!126205 (= c!106027 e!591649)))

(declare-fun res!695439 () Bool)

(assert (=> d!126205 (=> (not res!695439) (not e!591649))))

(assert (=> d!126205 (= res!695439 (bvslt #b00000000000000000000000000000000 (size!32169 (_keys!11652 (_2!7922 lt!460162)))))))

(declare-fun e!591652 () ListLongMap!13845)

(assert (=> d!126205 (= lt!460358 e!591652)))

(declare-fun c!106029 () Bool)

(assert (=> d!126205 (= c!106029 (and (not (= (bvand (extraKeys!6122 (_2!7922 lt!460162)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6122 (_2!7922 lt!460162)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126205 (validMask!0 (mask!30490 (_2!7922 lt!460162)))))

(assert (=> d!126205 (= (getCurrentListMap!3904 (_keys!11652 (_2!7922 lt!460162)) (_values!6417 (_2!7922 lt!460162)) (mask!30490 (_2!7922 lt!460162)) (extraKeys!6122 (_2!7922 lt!460162)) (zeroValue!6228 (_2!7922 lt!460162)) (minValue!6228 (_2!7922 lt!460162)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7922 lt!460162))) lt!460353)))

(declare-fun bm!44301 () Bool)

(declare-fun call!44304 () ListLongMap!13845)

(assert (=> bm!44301 (= call!44304 (getCurrentListMapNoExtraKeys!3569 (_keys!11652 (_2!7922 lt!460162)) (_values!6417 (_2!7922 lt!460162)) (mask!30490 (_2!7922 lt!460162)) (extraKeys!6122 (_2!7922 lt!460162)) (zeroValue!6228 (_2!7922 lt!460162)) (minValue!6228 (_2!7922 lt!460162)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7922 lt!460162))))))

(declare-fun bm!44302 () Bool)

(assert (=> bm!44302 (= call!44308 (contains!6046 lt!460353 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044049 () Bool)

(assert (=> b!1044049 (= e!591648 (= (apply!903 lt!460353 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6228 (_2!7922 lt!460162))))))

(declare-fun b!1044050 () Bool)

(declare-fun Unit!33987 () Unit!33975)

(assert (=> b!1044050 (= e!591656 Unit!33987)))

(declare-fun b!1044051 () Bool)

(declare-fun e!591654 () Bool)

(declare-fun e!591657 () Bool)

(assert (=> b!1044051 (= e!591654 e!591657)))

(declare-fun res!695437 () Bool)

(assert (=> b!1044051 (=> (not res!695437) (not e!591657))))

(assert (=> b!1044051 (= res!695437 (contains!6046 lt!460353 (select (arr!31632 (_keys!11652 (_2!7922 lt!460162))) #b00000000000000000000000000000000)))))

(assert (=> b!1044051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32169 (_keys!11652 (_2!7922 lt!460162)))))))

(declare-fun bm!44303 () Bool)

(assert (=> bm!44303 (= call!44303 (contains!6046 lt!460353 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044052 () Bool)

(declare-fun e!591655 () Bool)

(assert (=> b!1044052 (= e!591655 (validKeyInArray!0 (select (arr!31632 (_keys!11652 (_2!7922 lt!460162))) #b00000000000000000000000000000000)))))

(declare-fun bm!44304 () Bool)

(assert (=> bm!44304 (= call!44305 call!44304)))

(declare-fun b!1044053 () Bool)

(declare-fun res!695442 () Bool)

(assert (=> b!1044053 (=> (not res!695442) (not e!591650))))

(assert (=> b!1044053 (= res!695442 e!591654)))

(declare-fun res!695436 () Bool)

(assert (=> b!1044053 (=> res!695436 e!591654)))

(assert (=> b!1044053 (= res!695436 (not e!591655))))

(declare-fun res!695441 () Bool)

(assert (=> b!1044053 (=> (not res!695441) (not e!591655))))

(assert (=> b!1044053 (= res!695441 (bvslt #b00000000000000000000000000000000 (size!32169 (_keys!11652 (_2!7922 lt!460162)))))))

(declare-fun b!1044054 () Bool)

(assert (=> b!1044054 (= e!591650 e!591658)))

(declare-fun c!106030 () Bool)

(assert (=> b!1044054 (= c!106030 (not (= (bvand (extraKeys!6122 (_2!7922 lt!460162)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044055 () Bool)

(declare-fun e!591660 () Bool)

(assert (=> b!1044055 (= e!591660 (= (apply!903 lt!460353 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6228 (_2!7922 lt!460162))))))

(declare-fun b!1044056 () Bool)

(declare-fun call!44306 () ListLongMap!13845)

(assert (=> b!1044056 (= e!591652 (+!3134 call!44306 (tuple2!15825 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6228 (_2!7922 lt!460162)))))))

(declare-fun bm!44305 () Bool)

(declare-fun c!106032 () Bool)

(assert (=> bm!44305 (= call!44306 (+!3134 (ite c!106029 call!44304 (ite c!106032 call!44305 call!44309)) (ite (or c!106029 c!106032) (tuple2!15825 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6228 (_2!7922 lt!460162))) (tuple2!15825 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6228 (_2!7922 lt!460162))))))))

(declare-fun b!1044057 () Bool)

(assert (=> b!1044057 (= e!591659 call!44309)))

(declare-fun b!1044058 () Bool)

(declare-fun lt!460351 () Unit!33975)

(assert (=> b!1044058 (= e!591656 lt!460351)))

(declare-fun lt!460347 () ListLongMap!13845)

(assert (=> b!1044058 (= lt!460347 (getCurrentListMapNoExtraKeys!3569 (_keys!11652 (_2!7922 lt!460162)) (_values!6417 (_2!7922 lt!460162)) (mask!30490 (_2!7922 lt!460162)) (extraKeys!6122 (_2!7922 lt!460162)) (zeroValue!6228 (_2!7922 lt!460162)) (minValue!6228 (_2!7922 lt!460162)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7922 lt!460162))))))

(declare-fun lt!460342 () (_ BitVec 64))

(assert (=> b!1044058 (= lt!460342 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460352 () (_ BitVec 64))

(assert (=> b!1044058 (= lt!460352 (select (arr!31632 (_keys!11652 (_2!7922 lt!460162))) #b00000000000000000000000000000000))))

(declare-fun lt!460357 () Unit!33975)

(assert (=> b!1044058 (= lt!460357 (addStillContains!622 lt!460347 lt!460342 (zeroValue!6228 (_2!7922 lt!460162)) lt!460352))))

(assert (=> b!1044058 (contains!6046 (+!3134 lt!460347 (tuple2!15825 lt!460342 (zeroValue!6228 (_2!7922 lt!460162)))) lt!460352)))

(declare-fun lt!460356 () Unit!33975)

(assert (=> b!1044058 (= lt!460356 lt!460357)))

(declare-fun lt!460350 () ListLongMap!13845)

(assert (=> b!1044058 (= lt!460350 (getCurrentListMapNoExtraKeys!3569 (_keys!11652 (_2!7922 lt!460162)) (_values!6417 (_2!7922 lt!460162)) (mask!30490 (_2!7922 lt!460162)) (extraKeys!6122 (_2!7922 lt!460162)) (zeroValue!6228 (_2!7922 lt!460162)) (minValue!6228 (_2!7922 lt!460162)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7922 lt!460162))))))

(declare-fun lt!460341 () (_ BitVec 64))

(assert (=> b!1044058 (= lt!460341 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460355 () (_ BitVec 64))

(assert (=> b!1044058 (= lt!460355 (select (arr!31632 (_keys!11652 (_2!7922 lt!460162))) #b00000000000000000000000000000000))))

(declare-fun lt!460348 () Unit!33975)

(assert (=> b!1044058 (= lt!460348 (addApplyDifferent!478 lt!460350 lt!460341 (minValue!6228 (_2!7922 lt!460162)) lt!460355))))

(assert (=> b!1044058 (= (apply!903 (+!3134 lt!460350 (tuple2!15825 lt!460341 (minValue!6228 (_2!7922 lt!460162)))) lt!460355) (apply!903 lt!460350 lt!460355))))

(declare-fun lt!460354 () Unit!33975)

(assert (=> b!1044058 (= lt!460354 lt!460348)))

(declare-fun lt!460344 () ListLongMap!13845)

(assert (=> b!1044058 (= lt!460344 (getCurrentListMapNoExtraKeys!3569 (_keys!11652 (_2!7922 lt!460162)) (_values!6417 (_2!7922 lt!460162)) (mask!30490 (_2!7922 lt!460162)) (extraKeys!6122 (_2!7922 lt!460162)) (zeroValue!6228 (_2!7922 lt!460162)) (minValue!6228 (_2!7922 lt!460162)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7922 lt!460162))))))

(declare-fun lt!460359 () (_ BitVec 64))

(assert (=> b!1044058 (= lt!460359 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460349 () (_ BitVec 64))

(assert (=> b!1044058 (= lt!460349 (select (arr!31632 (_keys!11652 (_2!7922 lt!460162))) #b00000000000000000000000000000000))))

(declare-fun lt!460343 () Unit!33975)

(assert (=> b!1044058 (= lt!460343 (addApplyDifferent!478 lt!460344 lt!460359 (zeroValue!6228 (_2!7922 lt!460162)) lt!460349))))

(assert (=> b!1044058 (= (apply!903 (+!3134 lt!460344 (tuple2!15825 lt!460359 (zeroValue!6228 (_2!7922 lt!460162)))) lt!460349) (apply!903 lt!460344 lt!460349))))

(declare-fun lt!460340 () Unit!33975)

(assert (=> b!1044058 (= lt!460340 lt!460343)))

(declare-fun lt!460345 () ListLongMap!13845)

(assert (=> b!1044058 (= lt!460345 (getCurrentListMapNoExtraKeys!3569 (_keys!11652 (_2!7922 lt!460162)) (_values!6417 (_2!7922 lt!460162)) (mask!30490 (_2!7922 lt!460162)) (extraKeys!6122 (_2!7922 lt!460162)) (zeroValue!6228 (_2!7922 lt!460162)) (minValue!6228 (_2!7922 lt!460162)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7922 lt!460162))))))

(declare-fun lt!460360 () (_ BitVec 64))

(assert (=> b!1044058 (= lt!460360 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460339 () (_ BitVec 64))

(assert (=> b!1044058 (= lt!460339 (select (arr!31632 (_keys!11652 (_2!7922 lt!460162))) #b00000000000000000000000000000000))))

(assert (=> b!1044058 (= lt!460351 (addApplyDifferent!478 lt!460345 lt!460360 (minValue!6228 (_2!7922 lt!460162)) lt!460339))))

(assert (=> b!1044058 (= (apply!903 (+!3134 lt!460345 (tuple2!15825 lt!460360 (minValue!6228 (_2!7922 lt!460162)))) lt!460339) (apply!903 lt!460345 lt!460339))))

(declare-fun b!1044059 () Bool)

(assert (=> b!1044059 (= e!591658 e!591660)))

(declare-fun res!695443 () Bool)

(assert (=> b!1044059 (= res!695443 call!44308)))

(assert (=> b!1044059 (=> (not res!695443) (not e!591660))))

(declare-fun b!1044060 () Bool)

(assert (=> b!1044060 (= e!591651 (not call!44303))))

(declare-fun b!1044061 () Bool)

(declare-fun c!106031 () Bool)

(assert (=> b!1044061 (= c!106031 (and (not (= (bvand (extraKeys!6122 (_2!7922 lt!460162)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6122 (_2!7922 lt!460162)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!591653 () ListLongMap!13845)

(assert (=> b!1044061 (= e!591653 e!591659)))

(declare-fun b!1044062 () Bool)

(assert (=> b!1044062 (= e!591657 (= (apply!903 lt!460353 (select (arr!31632 (_keys!11652 (_2!7922 lt!460162))) #b00000000000000000000000000000000)) (get!16542 (select (arr!31633 (_values!6417 (_2!7922 lt!460162))) #b00000000000000000000000000000000) (dynLambda!1991 (defaultEntry!6394 (_2!7922 lt!460162)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044062 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32170 (_values!6417 (_2!7922 lt!460162)))))))

(assert (=> b!1044062 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32169 (_keys!11652 (_2!7922 lt!460162)))))))

(declare-fun b!1044063 () Bool)

(assert (=> b!1044063 (= e!591653 call!44307)))

(declare-fun b!1044064 () Bool)

(assert (=> b!1044064 (= e!591652 e!591653)))

(assert (=> b!1044064 (= c!106032 (and (not (= (bvand (extraKeys!6122 (_2!7922 lt!460162)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6122 (_2!7922 lt!460162)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44306 () Bool)

(assert (=> bm!44306 (= call!44307 call!44306)))

(assert (= (and d!126205 c!106029) b!1044056))

(assert (= (and d!126205 (not c!106029)) b!1044064))

(assert (= (and b!1044064 c!106032) b!1044063))

(assert (= (and b!1044064 (not c!106032)) b!1044061))

(assert (= (and b!1044061 c!106031) b!1044047))

(assert (= (and b!1044061 (not c!106031)) b!1044057))

(assert (= (or b!1044047 b!1044057) bm!44300))

(assert (= (or b!1044063 bm!44300) bm!44304))

(assert (= (or b!1044063 b!1044047) bm!44306))

(assert (= (or b!1044056 bm!44304) bm!44301))

(assert (= (or b!1044056 bm!44306) bm!44305))

(assert (= (and d!126205 res!695439) b!1044045))

(assert (= (and d!126205 c!106027) b!1044058))

(assert (= (and d!126205 (not c!106027)) b!1044050))

(assert (= (and d!126205 res!695438) b!1044053))

(assert (= (and b!1044053 res!695441) b!1044052))

(assert (= (and b!1044053 (not res!695436)) b!1044051))

(assert (= (and b!1044051 res!695437) b!1044062))

(assert (= (and b!1044053 res!695442) b!1044048))

(assert (= (and b!1044048 c!106028) b!1044046))

(assert (= (and b!1044048 (not c!106028)) b!1044060))

(assert (= (and b!1044046 res!695440) b!1044049))

(assert (= (or b!1044046 b!1044060) bm!44303))

(assert (= (and b!1044048 res!695444) b!1044054))

(assert (= (and b!1044054 c!106030) b!1044059))

(assert (= (and b!1044054 (not c!106030)) b!1044044))

(assert (= (and b!1044059 res!695443) b!1044055))

(assert (= (or b!1044059 b!1044044) bm!44302))

(declare-fun b_lambda!16187 () Bool)

(assert (=> (not b_lambda!16187) (not b!1044062)))

(declare-fun tb!7047 () Bool)

(declare-fun t!31266 () Bool)

(assert (=> (and b!1043853 (= (defaultEntry!6394 thiss!1427) (defaultEntry!6394 (_2!7922 lt!460162))) t!31266) tb!7047))

(declare-fun result!14527 () Bool)

(assert (=> tb!7047 (= result!14527 tp_is_empty!24829)))

(assert (=> b!1044062 t!31266))

(declare-fun b_and!33655 () Bool)

(assert (= b_and!33653 (and (=> t!31266 result!14527) b_and!33655)))

(assert (=> d!126205 m!962737))

(declare-fun m!962943 () Bool)

(assert (=> b!1044062 m!962943))

(declare-fun m!962945 () Bool)

(assert (=> b!1044062 m!962945))

(assert (=> b!1044062 m!962945))

(assert (=> b!1044062 m!962943))

(declare-fun m!962947 () Bool)

(assert (=> b!1044062 m!962947))

(declare-fun m!962949 () Bool)

(assert (=> b!1044062 m!962949))

(declare-fun m!962951 () Bool)

(assert (=> b!1044062 m!962951))

(assert (=> b!1044062 m!962949))

(declare-fun m!962953 () Bool)

(assert (=> bm!44303 m!962953))

(assert (=> b!1044045 m!962949))

(assert (=> b!1044045 m!962949))

(declare-fun m!962955 () Bool)

(assert (=> b!1044045 m!962955))

(declare-fun m!962957 () Bool)

(assert (=> b!1044056 m!962957))

(declare-fun m!962959 () Bool)

(assert (=> b!1044055 m!962959))

(declare-fun m!962961 () Bool)

(assert (=> b!1044049 m!962961))

(declare-fun m!962963 () Bool)

(assert (=> bm!44305 m!962963))

(declare-fun m!962965 () Bool)

(assert (=> bm!44302 m!962965))

(assert (=> b!1044052 m!962949))

(assert (=> b!1044052 m!962949))

(assert (=> b!1044052 m!962955))

(declare-fun m!962967 () Bool)

(assert (=> bm!44301 m!962967))

(assert (=> b!1044051 m!962949))

(assert (=> b!1044051 m!962949))

(declare-fun m!962969 () Bool)

(assert (=> b!1044051 m!962969))

(declare-fun m!962971 () Bool)

(assert (=> b!1044058 m!962971))

(assert (=> b!1044058 m!962967))

(declare-fun m!962973 () Bool)

(assert (=> b!1044058 m!962973))

(declare-fun m!962975 () Bool)

(assert (=> b!1044058 m!962975))

(declare-fun m!962977 () Bool)

(assert (=> b!1044058 m!962977))

(declare-fun m!962979 () Bool)

(assert (=> b!1044058 m!962979))

(declare-fun m!962981 () Bool)

(assert (=> b!1044058 m!962981))

(assert (=> b!1044058 m!962975))

(assert (=> b!1044058 m!962979))

(assert (=> b!1044058 m!962949))

(declare-fun m!962983 () Bool)

(assert (=> b!1044058 m!962983))

(declare-fun m!962985 () Bool)

(assert (=> b!1044058 m!962985))

(declare-fun m!962987 () Bool)

(assert (=> b!1044058 m!962987))

(declare-fun m!962989 () Bool)

(assert (=> b!1044058 m!962989))

(declare-fun m!962991 () Bool)

(assert (=> b!1044058 m!962991))

(declare-fun m!962993 () Bool)

(assert (=> b!1044058 m!962993))

(assert (=> b!1044058 m!962991))

(declare-fun m!962995 () Bool)

(assert (=> b!1044058 m!962995))

(declare-fun m!962997 () Bool)

(assert (=> b!1044058 m!962997))

(assert (=> b!1044058 m!962997))

(declare-fun m!962999 () Bool)

(assert (=> b!1044058 m!962999))

(assert (=> b!1043857 d!126205))

(declare-fun b!1044075 () Bool)

(declare-fun e!591669 () Bool)

(declare-fun contains!6048 (List!22039 (_ BitVec 64)) Bool)

(assert (=> b!1044075 (= e!591669 (contains!6048 Nil!22036 (select (arr!31632 lt!460170) #b00000000000000000000000000000000)))))

(declare-fun bm!44309 () Bool)

(declare-fun call!44312 () Bool)

(declare-fun c!106035 () Bool)

(assert (=> bm!44309 (= call!44312 (arrayNoDuplicates!0 lt!460170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106035 (Cons!22035 (select (arr!31632 lt!460170) #b00000000000000000000000000000000) Nil!22036) Nil!22036)))))

(declare-fun b!1044076 () Bool)

(declare-fun e!591670 () Bool)

(declare-fun e!591671 () Bool)

(assert (=> b!1044076 (= e!591670 e!591671)))

(assert (=> b!1044076 (= c!106035 (validKeyInArray!0 (select (arr!31632 lt!460170) #b00000000000000000000000000000000)))))

(declare-fun b!1044077 () Bool)

(assert (=> b!1044077 (= e!591671 call!44312)))

(declare-fun d!126207 () Bool)

(declare-fun res!695453 () Bool)

(declare-fun e!591672 () Bool)

(assert (=> d!126207 (=> res!695453 e!591672)))

(assert (=> d!126207 (= res!695453 (bvsge #b00000000000000000000000000000000 (size!32169 lt!460170)))))

(assert (=> d!126207 (= (arrayNoDuplicates!0 lt!460170 #b00000000000000000000000000000000 Nil!22036) e!591672)))

(declare-fun b!1044078 () Bool)

(assert (=> b!1044078 (= e!591672 e!591670)))

(declare-fun res!695451 () Bool)

(assert (=> b!1044078 (=> (not res!695451) (not e!591670))))

(assert (=> b!1044078 (= res!695451 (not e!591669))))

(declare-fun res!695452 () Bool)

(assert (=> b!1044078 (=> (not res!695452) (not e!591669))))

(assert (=> b!1044078 (= res!695452 (validKeyInArray!0 (select (arr!31632 lt!460170) #b00000000000000000000000000000000)))))

(declare-fun b!1044079 () Bool)

(assert (=> b!1044079 (= e!591671 call!44312)))

(assert (= (and d!126207 (not res!695453)) b!1044078))

(assert (= (and b!1044078 res!695452) b!1044075))

(assert (= (and b!1044078 res!695451) b!1044076))

(assert (= (and b!1044076 c!106035) b!1044077))

(assert (= (and b!1044076 (not c!106035)) b!1044079))

(assert (= (or b!1044077 b!1044079) bm!44309))

(assert (=> b!1044075 m!962851))

(assert (=> b!1044075 m!962851))

(declare-fun m!963001 () Bool)

(assert (=> b!1044075 m!963001))

(assert (=> bm!44309 m!962851))

(declare-fun m!963003 () Bool)

(assert (=> bm!44309 m!963003))

(assert (=> b!1044076 m!962851))

(assert (=> b!1044076 m!962851))

(assert (=> b!1044076 m!962857))

(assert (=> b!1044078 m!962851))

(assert (=> b!1044078 m!962851))

(assert (=> b!1044078 m!962857))

(assert (=> b!1043857 d!126207))

(declare-fun d!126209 () Bool)

(declare-fun res!695458 () Bool)

(declare-fun e!591677 () Bool)

(assert (=> d!126209 (=> res!695458 e!591677)))

(assert (=> d!126209 (= res!695458 (= (select (arr!31632 lt!460170) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126209 (= (arrayContainsKey!0 lt!460170 key!909 #b00000000000000000000000000000000) e!591677)))

(declare-fun b!1044084 () Bool)

(declare-fun e!591678 () Bool)

(assert (=> b!1044084 (= e!591677 e!591678)))

(declare-fun res!695459 () Bool)

(assert (=> b!1044084 (=> (not res!695459) (not e!591678))))

(assert (=> b!1044084 (= res!695459 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32169 lt!460170)))))

(declare-fun b!1044085 () Bool)

(assert (=> b!1044085 (= e!591678 (arrayContainsKey!0 lt!460170 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126209 (not res!695458)) b!1044084))

(assert (= (and b!1044084 res!695459) b!1044085))

(assert (=> d!126209 m!962851))

(declare-fun m!963005 () Bool)

(assert (=> b!1044085 m!963005))

(assert (=> b!1043857 d!126209))

(declare-fun d!126211 () Bool)

(declare-fun e!591681 () Bool)

(assert (=> d!126211 e!591681))

(declare-fun res!695462 () Bool)

(assert (=> d!126211 (=> (not res!695462) (not e!591681))))

(assert (=> d!126211 (= res!695462 (bvslt (index!41724 lt!460168) (size!32169 (_keys!11652 thiss!1427))))))

(declare-fun lt!460363 () Unit!33975)

(declare-fun choose!121 (array!65763 (_ BitVec 32) (_ BitVec 64)) Unit!33975)

(assert (=> d!126211 (= lt!460363 (choose!121 (_keys!11652 thiss!1427) (index!41724 lt!460168) key!909))))

(assert (=> d!126211 (bvsge (index!41724 lt!460168) #b00000000000000000000000000000000)))

(assert (=> d!126211 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11652 thiss!1427) (index!41724 lt!460168) key!909) lt!460363)))

(declare-fun b!1044088 () Bool)

(assert (=> b!1044088 (= e!591681 (not (arrayContainsKey!0 (array!65764 (store (arr!31632 (_keys!11652 thiss!1427)) (index!41724 lt!460168) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32169 (_keys!11652 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126211 res!695462) b!1044088))

(declare-fun m!963007 () Bool)

(assert (=> d!126211 m!963007))

(assert (=> b!1044088 m!962717))

(declare-fun m!963009 () Bool)

(assert (=> b!1044088 m!963009))

(assert (=> b!1043857 d!126211))

(declare-fun b!1044089 () Bool)

(declare-fun e!591692 () Bool)

(declare-fun call!44318 () Bool)

(assert (=> b!1044089 (= e!591692 (not call!44318))))

(declare-fun b!1044090 () Bool)

(declare-fun e!591683 () Bool)

(assert (=> b!1044090 (= e!591683 (validKeyInArray!0 (select (arr!31632 (_keys!11652 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044091 () Bool)

(declare-fun e!591685 () Bool)

(declare-fun e!591682 () Bool)

(assert (=> b!1044091 (= e!591685 e!591682)))

(declare-fun res!695467 () Bool)

(declare-fun call!44313 () Bool)

(assert (=> b!1044091 (= res!695467 call!44313)))

(assert (=> b!1044091 (=> (not res!695467) (not e!591682))))

(declare-fun bm!44310 () Bool)

(declare-fun call!44319 () ListLongMap!13845)

(declare-fun call!44315 () ListLongMap!13845)

(assert (=> bm!44310 (= call!44319 call!44315)))

(declare-fun b!1044092 () Bool)

(declare-fun e!591693 () ListLongMap!13845)

(declare-fun call!44317 () ListLongMap!13845)

(assert (=> b!1044092 (= e!591693 call!44317)))

(declare-fun b!1044093 () Bool)

(declare-fun res!695471 () Bool)

(declare-fun e!591684 () Bool)

(assert (=> b!1044093 (=> (not res!695471) (not e!591684))))

(assert (=> b!1044093 (= res!695471 e!591685)))

(declare-fun c!106037 () Bool)

(assert (=> b!1044093 (= c!106037 (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!126213 () Bool)

(assert (=> d!126213 e!591684))

(declare-fun res!695465 () Bool)

(assert (=> d!126213 (=> (not res!695465) (not e!591684))))

(assert (=> d!126213 (= res!695465 (or (bvsge #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))))))))

(declare-fun lt!460378 () ListLongMap!13845)

(declare-fun lt!460383 () ListLongMap!13845)

(assert (=> d!126213 (= lt!460378 lt!460383)))

(declare-fun lt!460371 () Unit!33975)

(declare-fun e!591690 () Unit!33975)

(assert (=> d!126213 (= lt!460371 e!591690)))

(declare-fun c!106036 () Bool)

(assert (=> d!126213 (= c!106036 e!591683)))

(declare-fun res!695466 () Bool)

(assert (=> d!126213 (=> (not res!695466) (not e!591683))))

(assert (=> d!126213 (= res!695466 (bvslt #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))))))

(declare-fun e!591686 () ListLongMap!13845)

(assert (=> d!126213 (= lt!460383 e!591686)))

(declare-fun c!106038 () Bool)

(assert (=> d!126213 (= c!106038 (and (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126213 (validMask!0 (mask!30490 thiss!1427))))

(assert (=> d!126213 (= (getCurrentListMap!3904 (_keys!11652 thiss!1427) (_values!6417 thiss!1427) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)) lt!460378)))

(declare-fun bm!44311 () Bool)

(declare-fun call!44314 () ListLongMap!13845)

(assert (=> bm!44311 (= call!44314 (getCurrentListMapNoExtraKeys!3569 (_keys!11652 thiss!1427) (_values!6417 thiss!1427) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun bm!44312 () Bool)

(assert (=> bm!44312 (= call!44318 (contains!6046 lt!460378 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044094 () Bool)

(assert (=> b!1044094 (= e!591682 (= (apply!903 lt!460378 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6228 thiss!1427)))))

(declare-fun b!1044095 () Bool)

(declare-fun Unit!33988 () Unit!33975)

(assert (=> b!1044095 (= e!591690 Unit!33988)))

(declare-fun b!1044096 () Bool)

(declare-fun e!591688 () Bool)

(declare-fun e!591691 () Bool)

(assert (=> b!1044096 (= e!591688 e!591691)))

(declare-fun res!695464 () Bool)

(assert (=> b!1044096 (=> (not res!695464) (not e!591691))))

(assert (=> b!1044096 (= res!695464 (contains!6046 lt!460378 (select (arr!31632 (_keys!11652 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1044096 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))))))

(declare-fun bm!44313 () Bool)

(assert (=> bm!44313 (= call!44313 (contains!6046 lt!460378 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044097 () Bool)

(declare-fun e!591689 () Bool)

(assert (=> b!1044097 (= e!591689 (validKeyInArray!0 (select (arr!31632 (_keys!11652 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44314 () Bool)

(assert (=> bm!44314 (= call!44315 call!44314)))

(declare-fun b!1044098 () Bool)

(declare-fun res!695469 () Bool)

(assert (=> b!1044098 (=> (not res!695469) (not e!591684))))

(assert (=> b!1044098 (= res!695469 e!591688)))

(declare-fun res!695463 () Bool)

(assert (=> b!1044098 (=> res!695463 e!591688)))

(assert (=> b!1044098 (= res!695463 (not e!591689))))

(declare-fun res!695468 () Bool)

(assert (=> b!1044098 (=> (not res!695468) (not e!591689))))

(assert (=> b!1044098 (= res!695468 (bvslt #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))))))

(declare-fun b!1044099 () Bool)

(assert (=> b!1044099 (= e!591684 e!591692)))

(declare-fun c!106039 () Bool)

(assert (=> b!1044099 (= c!106039 (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044100 () Bool)

(declare-fun e!591694 () Bool)

(assert (=> b!1044100 (= e!591694 (= (apply!903 lt!460378 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6228 thiss!1427)))))

(declare-fun b!1044101 () Bool)

(declare-fun call!44316 () ListLongMap!13845)

(assert (=> b!1044101 (= e!591686 (+!3134 call!44316 (tuple2!15825 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6228 thiss!1427))))))

(declare-fun c!106041 () Bool)

(declare-fun bm!44315 () Bool)

(assert (=> bm!44315 (= call!44316 (+!3134 (ite c!106038 call!44314 (ite c!106041 call!44315 call!44319)) (ite (or c!106038 c!106041) (tuple2!15825 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6228 thiss!1427)) (tuple2!15825 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6228 thiss!1427)))))))

(declare-fun b!1044102 () Bool)

(assert (=> b!1044102 (= e!591693 call!44319)))

(declare-fun b!1044103 () Bool)

(declare-fun lt!460376 () Unit!33975)

(assert (=> b!1044103 (= e!591690 lt!460376)))

(declare-fun lt!460372 () ListLongMap!13845)

(assert (=> b!1044103 (= lt!460372 (getCurrentListMapNoExtraKeys!3569 (_keys!11652 thiss!1427) (_values!6417 thiss!1427) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!460367 () (_ BitVec 64))

(assert (=> b!1044103 (= lt!460367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460377 () (_ BitVec 64))

(assert (=> b!1044103 (= lt!460377 (select (arr!31632 (_keys!11652 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460382 () Unit!33975)

(assert (=> b!1044103 (= lt!460382 (addStillContains!622 lt!460372 lt!460367 (zeroValue!6228 thiss!1427) lt!460377))))

(assert (=> b!1044103 (contains!6046 (+!3134 lt!460372 (tuple2!15825 lt!460367 (zeroValue!6228 thiss!1427))) lt!460377)))

(declare-fun lt!460381 () Unit!33975)

(assert (=> b!1044103 (= lt!460381 lt!460382)))

(declare-fun lt!460375 () ListLongMap!13845)

(assert (=> b!1044103 (= lt!460375 (getCurrentListMapNoExtraKeys!3569 (_keys!11652 thiss!1427) (_values!6417 thiss!1427) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!460366 () (_ BitVec 64))

(assert (=> b!1044103 (= lt!460366 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460380 () (_ BitVec 64))

(assert (=> b!1044103 (= lt!460380 (select (arr!31632 (_keys!11652 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460373 () Unit!33975)

(assert (=> b!1044103 (= lt!460373 (addApplyDifferent!478 lt!460375 lt!460366 (minValue!6228 thiss!1427) lt!460380))))

(assert (=> b!1044103 (= (apply!903 (+!3134 lt!460375 (tuple2!15825 lt!460366 (minValue!6228 thiss!1427))) lt!460380) (apply!903 lt!460375 lt!460380))))

(declare-fun lt!460379 () Unit!33975)

(assert (=> b!1044103 (= lt!460379 lt!460373)))

(declare-fun lt!460369 () ListLongMap!13845)

(assert (=> b!1044103 (= lt!460369 (getCurrentListMapNoExtraKeys!3569 (_keys!11652 thiss!1427) (_values!6417 thiss!1427) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!460384 () (_ BitVec 64))

(assert (=> b!1044103 (= lt!460384 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460374 () (_ BitVec 64))

(assert (=> b!1044103 (= lt!460374 (select (arr!31632 (_keys!11652 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460368 () Unit!33975)

(assert (=> b!1044103 (= lt!460368 (addApplyDifferent!478 lt!460369 lt!460384 (zeroValue!6228 thiss!1427) lt!460374))))

(assert (=> b!1044103 (= (apply!903 (+!3134 lt!460369 (tuple2!15825 lt!460384 (zeroValue!6228 thiss!1427))) lt!460374) (apply!903 lt!460369 lt!460374))))

(declare-fun lt!460365 () Unit!33975)

(assert (=> b!1044103 (= lt!460365 lt!460368)))

(declare-fun lt!460370 () ListLongMap!13845)

(assert (=> b!1044103 (= lt!460370 (getCurrentListMapNoExtraKeys!3569 (_keys!11652 thiss!1427) (_values!6417 thiss!1427) (mask!30490 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-fun lt!460385 () (_ BitVec 64))

(assert (=> b!1044103 (= lt!460385 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460364 () (_ BitVec 64))

(assert (=> b!1044103 (= lt!460364 (select (arr!31632 (_keys!11652 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044103 (= lt!460376 (addApplyDifferent!478 lt!460370 lt!460385 (minValue!6228 thiss!1427) lt!460364))))

(assert (=> b!1044103 (= (apply!903 (+!3134 lt!460370 (tuple2!15825 lt!460385 (minValue!6228 thiss!1427))) lt!460364) (apply!903 lt!460370 lt!460364))))

(declare-fun b!1044104 () Bool)

(assert (=> b!1044104 (= e!591692 e!591694)))

(declare-fun res!695470 () Bool)

(assert (=> b!1044104 (= res!695470 call!44318)))

(assert (=> b!1044104 (=> (not res!695470) (not e!591694))))

(declare-fun b!1044105 () Bool)

(assert (=> b!1044105 (= e!591685 (not call!44313))))

(declare-fun b!1044106 () Bool)

(declare-fun c!106040 () Bool)

(assert (=> b!1044106 (= c!106040 (and (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!591687 () ListLongMap!13845)

(assert (=> b!1044106 (= e!591687 e!591693)))

(declare-fun b!1044107 () Bool)

(assert (=> b!1044107 (= e!591691 (= (apply!903 lt!460378 (select (arr!31632 (_keys!11652 thiss!1427)) #b00000000000000000000000000000000)) (get!16542 (select (arr!31633 (_values!6417 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1991 (defaultEntry!6394 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044107 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32170 (_values!6417 thiss!1427))))))

(assert (=> b!1044107 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))))))

(declare-fun b!1044108 () Bool)

(assert (=> b!1044108 (= e!591687 call!44317)))

(declare-fun b!1044109 () Bool)

(assert (=> b!1044109 (= e!591686 e!591687)))

(assert (=> b!1044109 (= c!106041 (and (not (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6122 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44316 () Bool)

(assert (=> bm!44316 (= call!44317 call!44316)))

(assert (= (and d!126213 c!106038) b!1044101))

(assert (= (and d!126213 (not c!106038)) b!1044109))

(assert (= (and b!1044109 c!106041) b!1044108))

(assert (= (and b!1044109 (not c!106041)) b!1044106))

(assert (= (and b!1044106 c!106040) b!1044092))

(assert (= (and b!1044106 (not c!106040)) b!1044102))

(assert (= (or b!1044092 b!1044102) bm!44310))

(assert (= (or b!1044108 bm!44310) bm!44314))

(assert (= (or b!1044108 b!1044092) bm!44316))

(assert (= (or b!1044101 bm!44314) bm!44311))

(assert (= (or b!1044101 bm!44316) bm!44315))

(assert (= (and d!126213 res!695466) b!1044090))

(assert (= (and d!126213 c!106036) b!1044103))

(assert (= (and d!126213 (not c!106036)) b!1044095))

(assert (= (and d!126213 res!695465) b!1044098))

(assert (= (and b!1044098 res!695468) b!1044097))

(assert (= (and b!1044098 (not res!695463)) b!1044096))

(assert (= (and b!1044096 res!695464) b!1044107))

(assert (= (and b!1044098 res!695469) b!1044093))

(assert (= (and b!1044093 c!106037) b!1044091))

(assert (= (and b!1044093 (not c!106037)) b!1044105))

(assert (= (and b!1044091 res!695467) b!1044094))

(assert (= (or b!1044091 b!1044105) bm!44313))

(assert (= (and b!1044093 res!695471) b!1044099))

(assert (= (and b!1044099 c!106039) b!1044104))

(assert (= (and b!1044099 (not c!106039)) b!1044089))

(assert (= (and b!1044104 res!695470) b!1044100))

(assert (= (or b!1044104 b!1044089) bm!44312))

(declare-fun b_lambda!16189 () Bool)

(assert (=> (not b_lambda!16189) (not b!1044107)))

(assert (=> b!1044107 t!31256))

(declare-fun b_and!33657 () Bool)

(assert (= b_and!33655 (and (=> t!31256 result!14515) b_and!33657)))

(assert (=> d!126213 m!962845))

(assert (=> b!1044107 m!962727))

(declare-fun m!963011 () Bool)

(assert (=> b!1044107 m!963011))

(assert (=> b!1044107 m!963011))

(assert (=> b!1044107 m!962727))

(declare-fun m!963013 () Bool)

(assert (=> b!1044107 m!963013))

(declare-fun m!963015 () Bool)

(assert (=> b!1044107 m!963015))

(declare-fun m!963017 () Bool)

(assert (=> b!1044107 m!963017))

(assert (=> b!1044107 m!963015))

(declare-fun m!963019 () Bool)

(assert (=> bm!44313 m!963019))

(assert (=> b!1044090 m!963015))

(assert (=> b!1044090 m!963015))

(declare-fun m!963021 () Bool)

(assert (=> b!1044090 m!963021))

(declare-fun m!963023 () Bool)

(assert (=> b!1044101 m!963023))

(declare-fun m!963025 () Bool)

(assert (=> b!1044100 m!963025))

(declare-fun m!963027 () Bool)

(assert (=> b!1044094 m!963027))

(declare-fun m!963029 () Bool)

(assert (=> bm!44315 m!963029))

(declare-fun m!963031 () Bool)

(assert (=> bm!44312 m!963031))

(assert (=> b!1044097 m!963015))

(assert (=> b!1044097 m!963015))

(assert (=> b!1044097 m!963021))

(declare-fun m!963033 () Bool)

(assert (=> bm!44311 m!963033))

(assert (=> b!1044096 m!963015))

(assert (=> b!1044096 m!963015))

(declare-fun m!963035 () Bool)

(assert (=> b!1044096 m!963035))

(declare-fun m!963037 () Bool)

(assert (=> b!1044103 m!963037))

(assert (=> b!1044103 m!963033))

(declare-fun m!963039 () Bool)

(assert (=> b!1044103 m!963039))

(declare-fun m!963041 () Bool)

(assert (=> b!1044103 m!963041))

(declare-fun m!963043 () Bool)

(assert (=> b!1044103 m!963043))

(declare-fun m!963045 () Bool)

(assert (=> b!1044103 m!963045))

(declare-fun m!963047 () Bool)

(assert (=> b!1044103 m!963047))

(assert (=> b!1044103 m!963041))

(assert (=> b!1044103 m!963045))

(assert (=> b!1044103 m!963015))

(declare-fun m!963049 () Bool)

(assert (=> b!1044103 m!963049))

(declare-fun m!963051 () Bool)

(assert (=> b!1044103 m!963051))

(declare-fun m!963053 () Bool)

(assert (=> b!1044103 m!963053))

(declare-fun m!963055 () Bool)

(assert (=> b!1044103 m!963055))

(declare-fun m!963057 () Bool)

(assert (=> b!1044103 m!963057))

(declare-fun m!963059 () Bool)

(assert (=> b!1044103 m!963059))

(assert (=> b!1044103 m!963057))

(declare-fun m!963061 () Bool)

(assert (=> b!1044103 m!963061))

(declare-fun m!963063 () Bool)

(assert (=> b!1044103 m!963063))

(assert (=> b!1044103 m!963063))

(declare-fun m!963065 () Bool)

(assert (=> b!1044103 m!963065))

(assert (=> b!1043857 d!126213))

(declare-fun d!126215 () Bool)

(declare-fun e!591697 () Bool)

(assert (=> d!126215 e!591697))

(declare-fun res!695474 () Bool)

(assert (=> d!126215 (=> (not res!695474) (not e!591697))))

(assert (=> d!126215 (= res!695474 (and (bvsge (index!41724 lt!460168) #b00000000000000000000000000000000) (bvslt (index!41724 lt!460168) (size!32169 (_keys!11652 thiss!1427)))))))

(declare-fun lt!460388 () Unit!33975)

(declare-fun choose!25 (array!65763 (_ BitVec 32) (_ BitVec 32)) Unit!33975)

(assert (=> d!126215 (= lt!460388 (choose!25 (_keys!11652 thiss!1427) (index!41724 lt!460168) (mask!30490 thiss!1427)))))

(assert (=> d!126215 (validMask!0 (mask!30490 thiss!1427))))

(assert (=> d!126215 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11652 thiss!1427) (index!41724 lt!460168) (mask!30490 thiss!1427)) lt!460388)))

(declare-fun b!1044112 () Bool)

(assert (=> b!1044112 (= e!591697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65764 (store (arr!31632 (_keys!11652 thiss!1427)) (index!41724 lt!460168) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32169 (_keys!11652 thiss!1427))) (mask!30490 thiss!1427)))))

(assert (= (and d!126215 res!695474) b!1044112))

(declare-fun m!963067 () Bool)

(assert (=> d!126215 m!963067))

(assert (=> d!126215 m!962845))

(assert (=> b!1044112 m!962717))

(declare-fun m!963069 () Bool)

(assert (=> b!1044112 m!963069))

(assert (=> b!1043857 d!126215))

(declare-fun b!1044113 () Bool)

(declare-fun e!591699 () (_ BitVec 32))

(assert (=> b!1044113 (= e!591699 #b00000000000000000000000000000000)))

(declare-fun b!1044114 () Bool)

(declare-fun e!591698 () (_ BitVec 32))

(declare-fun call!44320 () (_ BitVec 32))

(assert (=> b!1044114 (= e!591698 (bvadd #b00000000000000000000000000000001 call!44320))))

(declare-fun d!126217 () Bool)

(declare-fun lt!460389 () (_ BitVec 32))

(assert (=> d!126217 (and (bvsge lt!460389 #b00000000000000000000000000000000) (bvsle lt!460389 (bvsub (size!32169 (_keys!11652 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126217 (= lt!460389 e!591699)))

(declare-fun c!106042 () Bool)

(assert (=> d!126217 (= c!106042 (bvsge #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))))))

(assert (=> d!126217 (and (bvsle #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32169 (_keys!11652 thiss!1427)) (size!32169 (_keys!11652 thiss!1427))))))

(assert (=> d!126217 (= (arrayCountValidKeys!0 (_keys!11652 thiss!1427) #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))) lt!460389)))

(declare-fun b!1044115 () Bool)

(assert (=> b!1044115 (= e!591699 e!591698)))

(declare-fun c!106043 () Bool)

(assert (=> b!1044115 (= c!106043 (validKeyInArray!0 (select (arr!31632 (_keys!11652 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44317 () Bool)

(assert (=> bm!44317 (= call!44320 (arrayCountValidKeys!0 (_keys!11652 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32169 (_keys!11652 thiss!1427))))))

(declare-fun b!1044116 () Bool)

(assert (=> b!1044116 (= e!591698 call!44320)))

(assert (= (and d!126217 c!106042) b!1044113))

(assert (= (and d!126217 (not c!106042)) b!1044115))

(assert (= (and b!1044115 c!106043) b!1044114))

(assert (= (and b!1044115 (not c!106043)) b!1044116))

(assert (= (or b!1044114 b!1044116) bm!44317))

(assert (=> b!1044115 m!963015))

(assert (=> b!1044115 m!963015))

(assert (=> b!1044115 m!963021))

(declare-fun m!963071 () Bool)

(assert (=> bm!44317 m!963071))

(assert (=> b!1043857 d!126217))

(declare-fun d!126219 () Bool)

(assert (=> d!126219 (= (validMask!0 (mask!30490 (_2!7922 lt!460162))) (and (or (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000000000000000000111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000000000000000001111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000000000000000011111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000000000000000111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000000000000001111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000000000000011111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000000000000111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000000000001111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000000000011111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000000000111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000000001111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000000011111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000000111111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000001111111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000011111111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000000111111111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000001111111111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000011111111111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000000111111111111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000001111111111111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000011111111111111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000000111111111111111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000001111111111111111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000011111111111111111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00000111111111111111111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00001111111111111111111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00011111111111111111111111111111) (= (mask!30490 (_2!7922 lt!460162)) #b00111111111111111111111111111111)) (bvsle (mask!30490 (_2!7922 lt!460162)) #b00111111111111111111111111111111)))))

(assert (=> b!1043856 d!126219))

(declare-fun d!126221 () Bool)

(declare-fun res!695481 () Bool)

(declare-fun e!591702 () Bool)

(assert (=> d!126221 (=> (not res!695481) (not e!591702))))

(declare-fun simpleValid!448 (LongMapFixedSize!6016) Bool)

(assert (=> d!126221 (= res!695481 (simpleValid!448 thiss!1427))))

(assert (=> d!126221 (= (valid!2253 thiss!1427) e!591702)))

(declare-fun b!1044123 () Bool)

(declare-fun res!695482 () Bool)

(assert (=> b!1044123 (=> (not res!695482) (not e!591702))))

(assert (=> b!1044123 (= res!695482 (= (arrayCountValidKeys!0 (_keys!11652 thiss!1427) #b00000000000000000000000000000000 (size!32169 (_keys!11652 thiss!1427))) (_size!3063 thiss!1427)))))

(declare-fun b!1044124 () Bool)

(declare-fun res!695483 () Bool)

(assert (=> b!1044124 (=> (not res!695483) (not e!591702))))

(assert (=> b!1044124 (= res!695483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11652 thiss!1427) (mask!30490 thiss!1427)))))

(declare-fun b!1044125 () Bool)

(assert (=> b!1044125 (= e!591702 (arrayNoDuplicates!0 (_keys!11652 thiss!1427) #b00000000000000000000000000000000 Nil!22036))))

(assert (= (and d!126221 res!695481) b!1044123))

(assert (= (and b!1044123 res!695482) b!1044124))

(assert (= (and b!1044124 res!695483) b!1044125))

(declare-fun m!963073 () Bool)

(assert (=> d!126221 m!963073))

(assert (=> b!1044123 m!962703))

(declare-fun m!963075 () Bool)

(assert (=> b!1044124 m!963075))

(declare-fun m!963077 () Bool)

(assert (=> b!1044125 m!963077))

(assert (=> start!91730 d!126221))

(declare-fun condMapEmpty!38879 () Bool)

(declare-fun mapDefault!38879 () ValueCell!11711)

(assert (=> mapNonEmpty!38870 (= condMapEmpty!38879 (= mapRest!38870 ((as const (Array (_ BitVec 32) ValueCell!11711)) mapDefault!38879)))))

(declare-fun e!591707 () Bool)

(declare-fun mapRes!38879 () Bool)

(assert (=> mapNonEmpty!38870 (= tp!74571 (and e!591707 mapRes!38879))))

(declare-fun b!1044133 () Bool)

(assert (=> b!1044133 (= e!591707 tp_is_empty!24829)))

(declare-fun b!1044132 () Bool)

(declare-fun e!591708 () Bool)

(assert (=> b!1044132 (= e!591708 tp_is_empty!24829)))

(declare-fun mapIsEmpty!38879 () Bool)

(assert (=> mapIsEmpty!38879 mapRes!38879))

(declare-fun mapNonEmpty!38879 () Bool)

(declare-fun tp!74586 () Bool)

(assert (=> mapNonEmpty!38879 (= mapRes!38879 (and tp!74586 e!591708))))

(declare-fun mapKey!38879 () (_ BitVec 32))

(declare-fun mapValue!38879 () ValueCell!11711)

(declare-fun mapRest!38879 () (Array (_ BitVec 32) ValueCell!11711))

(assert (=> mapNonEmpty!38879 (= mapRest!38870 (store mapRest!38879 mapKey!38879 mapValue!38879))))

(assert (= (and mapNonEmpty!38870 condMapEmpty!38879) mapIsEmpty!38879))

(assert (= (and mapNonEmpty!38870 (not condMapEmpty!38879)) mapNonEmpty!38879))

(assert (= (and mapNonEmpty!38879 ((_ is ValueCellFull!11711) mapValue!38879)) b!1044132))

(assert (= (and mapNonEmpty!38870 ((_ is ValueCellFull!11711) mapDefault!38879)) b!1044133))

(declare-fun m!963079 () Bool)

(assert (=> mapNonEmpty!38879 m!963079))

(declare-fun b_lambda!16191 () Bool)

(assert (= b_lambda!16189 (or (and b!1043853 b_free!21109) b_lambda!16191)))

(declare-fun b_lambda!16193 () Bool)

(assert (= b_lambda!16183 (or (and b!1043853 b_free!21109) b_lambda!16193)))

(declare-fun b_lambda!16195 () Bool)

(assert (= b_lambda!16185 (or (and b!1043853 b_free!21109) b_lambda!16195)))

(check-sat (not b!1044090) (not b!1044028) (not bm!44311) (not d!126221) (not b!1044085) (not b!1044088) tp_is_empty!24829 (not b!1043977) (not b!1044040) (not d!126189) (not b!1044045) (not b!1044026) (not b_lambda!16181) (not b!1044103) (not b!1044052) (not d!126215) (not bm!44288) (not bm!44302) b_and!33657 (not bm!44301) (not b!1044107) (not d!126201) (not bm!44289) (not b!1043983) (not b!1044003) (not b!1044101) (not b_next!21109) (not b_lambda!16187) (not b!1044100) (not b!1043925) (not b!1044124) (not b!1044055) (not b!1044031) (not bm!44299) (not b!1044112) (not b!1044051) (not d!126193) (not b!1043984) (not bm!44303) (not b!1044096) (not d!126195) (not b!1044056) (not b!1044018) (not bm!44312) (not b!1044097) (not b_lambda!16195) (not d!126203) (not b!1044123) (not b!1044043) (not bm!44305) (not b!1044076) (not d!126211) (not b!1044004) (not b!1043979) (not b!1044078) (not b!1043973) (not bm!44290) (not d!126213) (not b!1043986) (not bm!44292) (not b!1044094) (not b!1044041) (not mapNonEmpty!38879) (not b!1043980) (not bm!44309) (not bm!44317) (not b!1044007) (not bm!44315) (not d!126183) (not b!1044062) (not d!126199) (not b!1044125) (not b!1043990) (not b!1044075) (not d!126205) (not b!1044049) (not b_lambda!16191) (not bm!44296) (not bm!44313) (not b!1044058) (not b_lambda!16193) (not b!1044115))
(check-sat b_and!33657 (not b_next!21109))
