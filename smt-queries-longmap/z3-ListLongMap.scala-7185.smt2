; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91988 () Bool)

(assert start!91988)

(declare-fun b!1046008 () Bool)

(declare-fun b_free!21163 () Bool)

(declare-fun b_next!21163 () Bool)

(assert (=> b!1046008 (= b_free!21163 (not b_next!21163))))

(declare-fun tp!74750 () Bool)

(declare-fun b_and!33795 () Bool)

(assert (=> b!1046008 (= tp!74750 b_and!33795)))

(declare-fun b!1046005 () Bool)

(declare-fun e!593014 () Bool)

(assert (=> b!1046005 (= e!593014 false)))

(declare-fun e!593015 () Bool)

(assert (=> b!1046005 e!593015))

(declare-fun c!106326 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1046005 (= c!106326 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!34071 0))(
  ( (Unit!34072) )
))
(declare-fun lt!461894 () Unit!34071)

(declare-datatypes ((V!38051 0))(
  ( (V!38052 (val!12492 Int)) )
))
(declare-datatypes ((ValueCell!11738 0))(
  ( (ValueCellFull!11738 (v!15088 V!38051)) (EmptyCell!11738) )
))
(declare-datatypes ((array!65883 0))(
  ( (array!65884 (arr!31686 (Array (_ BitVec 32) (_ BitVec 64))) (size!32223 (_ BitVec 32))) )
))
(declare-datatypes ((array!65885 0))(
  ( (array!65886 (arr!31687 (Array (_ BitVec 32) ValueCell!11738)) (size!32224 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6070 0))(
  ( (LongMapFixedSize!6071 (defaultEntry!6433 Int) (mask!30571 (_ BitVec 32)) (extraKeys!6161 (_ BitVec 32)) (zeroValue!6267 V!38051) (minValue!6267 V!38051) (_size!3090 (_ BitVec 32)) (_keys!11703 array!65883) (_values!6456 array!65885) (_vacant!3090 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15894 0))(
  ( (tuple2!15895 (_1!7958 Unit!34071) (_2!7958 LongMapFixedSize!6070)) )
))
(declare-fun lt!461897 () tuple2!15894)

(declare-fun lemmaKeyInListMapIsInArray!332 (array!65883 array!65885 (_ BitVec 32) (_ BitVec 32) V!38051 V!38051 (_ BitVec 64) Int) Unit!34071)

(assert (=> b!1046005 (= lt!461894 (lemmaKeyInListMapIsInArray!332 (_keys!11703 (_2!7958 lt!461897)) (_values!6456 (_2!7958 lt!461897)) (mask!30571 (_2!7958 lt!461897)) (extraKeys!6161 (_2!7958 lt!461897)) (zeroValue!6267 (_2!7958 lt!461897)) (minValue!6267 (_2!7958 lt!461897)) key!909 (defaultEntry!6433 (_2!7958 lt!461897))))))

(declare-fun b!1046006 () Bool)

(declare-fun e!593016 () Bool)

(assert (=> b!1046006 (= e!593016 (not e!593014))))

(declare-fun res!696407 () Bool)

(assert (=> b!1046006 (=> res!696407 e!593014)))

(declare-datatypes ((tuple2!15896 0))(
  ( (tuple2!15897 (_1!7959 (_ BitVec 64)) (_2!7959 V!38051)) )
))
(declare-datatypes ((List!22069 0))(
  ( (Nil!22066) (Cons!22065 (h!23273 tuple2!15896) (t!31354 List!22069)) )
))
(declare-datatypes ((ListLongMap!13875 0))(
  ( (ListLongMap!13876 (toList!6953 List!22069)) )
))
(declare-fun contains!6067 (ListLongMap!13875 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3919 (array!65883 array!65885 (_ BitVec 32) (_ BitVec 32) V!38051 V!38051 (_ BitVec 32) Int) ListLongMap!13875)

(assert (=> b!1046006 (= res!696407 (not (contains!6067 (getCurrentListMap!3919 (_keys!11703 (_2!7958 lt!461897)) (_values!6456 (_2!7958 lt!461897)) (mask!30571 (_2!7958 lt!461897)) (extraKeys!6161 (_2!7958 lt!461897)) (zeroValue!6267 (_2!7958 lt!461897)) (minValue!6267 (_2!7958 lt!461897)) #b00000000000000000000000000000000 (defaultEntry!6433 (_2!7958 lt!461897))) key!909)))))

(declare-fun lt!461893 () array!65883)

(declare-fun lt!461901 () array!65885)

(declare-fun thiss!1427 () LongMapFixedSize!6070)

(declare-fun Unit!34073 () Unit!34071)

(declare-fun Unit!34074 () Unit!34071)

(assert (=> b!1046006 (= lt!461897 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3090 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15895 Unit!34073 (LongMapFixedSize!6071 (defaultEntry!6433 thiss!1427) (mask!30571 thiss!1427) (extraKeys!6161 thiss!1427) (zeroValue!6267 thiss!1427) (minValue!6267 thiss!1427) (bvsub (_size!3090 thiss!1427) #b00000000000000000000000000000001) lt!461893 lt!461901 (bvadd #b00000000000000000000000000000001 (_vacant!3090 thiss!1427)))) (tuple2!15895 Unit!34074 (LongMapFixedSize!6071 (defaultEntry!6433 thiss!1427) (mask!30571 thiss!1427) (extraKeys!6161 thiss!1427) (zeroValue!6267 thiss!1427) (minValue!6267 thiss!1427) (bvsub (_size!3090 thiss!1427) #b00000000000000000000000000000001) lt!461893 lt!461901 (_vacant!3090 thiss!1427)))))))

(declare-fun -!545 (ListLongMap!13875 (_ BitVec 64)) ListLongMap!13875)

(assert (=> b!1046006 (= (-!545 (getCurrentListMap!3919 (_keys!11703 thiss!1427) (_values!6456 thiss!1427) (mask!30571 thiss!1427) (extraKeys!6161 thiss!1427) (zeroValue!6267 thiss!1427) (minValue!6267 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6433 thiss!1427)) key!909) (getCurrentListMap!3919 lt!461893 lt!461901 (mask!30571 thiss!1427) (extraKeys!6161 thiss!1427) (zeroValue!6267 thiss!1427) (minValue!6267 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6433 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9859 0))(
  ( (MissingZero!9859 (index!41807 (_ BitVec 32))) (Found!9859 (index!41808 (_ BitVec 32))) (Intermediate!9859 (undefined!10671 Bool) (index!41809 (_ BitVec 32)) (x!93472 (_ BitVec 32))) (Undefined!9859) (MissingVacant!9859 (index!41810 (_ BitVec 32))) )
))
(declare-fun lt!461898 () SeekEntryResult!9859)

(declare-fun dynLambda!2006 (Int (_ BitVec 64)) V!38051)

(assert (=> b!1046006 (= lt!461901 (array!65886 (store (arr!31687 (_values!6456 thiss!1427)) (index!41808 lt!461898) (ValueCellFull!11738 (dynLambda!2006 (defaultEntry!6433 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32224 (_values!6456 thiss!1427))))))

(declare-fun lt!461900 () Unit!34071)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!67 (array!65883 array!65885 (_ BitVec 32) (_ BitVec 32) V!38051 V!38051 (_ BitVec 32) (_ BitVec 64) Int) Unit!34071)

(assert (=> b!1046006 (= lt!461900 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!67 (_keys!11703 thiss!1427) (_values!6456 thiss!1427) (mask!30571 thiss!1427) (extraKeys!6161 thiss!1427) (zeroValue!6267 thiss!1427) (minValue!6267 thiss!1427) (index!41808 lt!461898) key!909 (defaultEntry!6433 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1046006 (not (arrayContainsKey!0 lt!461893 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461892 () Unit!34071)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65883 (_ BitVec 32) (_ BitVec 64)) Unit!34071)

(assert (=> b!1046006 (= lt!461892 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11703 thiss!1427) (index!41808 lt!461898) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65883 (_ BitVec 32)) Bool)

(assert (=> b!1046006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461893 (mask!30571 thiss!1427))))

(declare-fun lt!461895 () Unit!34071)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65883 (_ BitVec 32) (_ BitVec 32)) Unit!34071)

(assert (=> b!1046006 (= lt!461895 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11703 thiss!1427) (index!41808 lt!461898) (mask!30571 thiss!1427)))))

(declare-datatypes ((List!22070 0))(
  ( (Nil!22067) (Cons!22066 (h!23274 (_ BitVec 64)) (t!31355 List!22070)) )
))
(declare-fun arrayNoDuplicates!0 (array!65883 (_ BitVec 32) List!22070) Bool)

(assert (=> b!1046006 (arrayNoDuplicates!0 lt!461893 #b00000000000000000000000000000000 Nil!22067)))

(declare-fun lt!461899 () Unit!34071)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65883 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22070) Unit!34071)

(assert (=> b!1046006 (= lt!461899 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11703 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41808 lt!461898) #b00000000000000000000000000000000 Nil!22067))))

(declare-fun arrayCountValidKeys!0 (array!65883 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1046006 (= (arrayCountValidKeys!0 lt!461893 #b00000000000000000000000000000000 (size!32223 (_keys!11703 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11703 thiss!1427) #b00000000000000000000000000000000 (size!32223 (_keys!11703 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1046006 (= lt!461893 (array!65884 (store (arr!31686 (_keys!11703 thiss!1427)) (index!41808 lt!461898) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32223 (_keys!11703 thiss!1427))))))

(declare-fun lt!461896 () Unit!34071)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65883 (_ BitVec 32) (_ BitVec 64)) Unit!34071)

(assert (=> b!1046006 (= lt!461896 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11703 thiss!1427) (index!41808 lt!461898) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046007 () Bool)

(declare-fun e!593020 () Bool)

(assert (=> b!1046007 (= e!593020 e!593016)))

(declare-fun res!696409 () Bool)

(assert (=> b!1046007 (=> (not res!696409) (not e!593016))))

(get-info :version)

(assert (=> b!1046007 (= res!696409 ((_ is Found!9859) lt!461898))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65883 (_ BitVec 32)) SeekEntryResult!9859)

(assert (=> b!1046007 (= lt!461898 (seekEntry!0 key!909 (_keys!11703 thiss!1427) (mask!30571 thiss!1427)))))

(declare-fun e!593021 () Bool)

(declare-fun e!593019 () Bool)

(declare-fun tp_is_empty!24883 () Bool)

(declare-fun array_inv!24479 (array!65883) Bool)

(declare-fun array_inv!24480 (array!65885) Bool)

(assert (=> b!1046008 (= e!593021 (and tp!74750 tp_is_empty!24883 (array_inv!24479 (_keys!11703 thiss!1427)) (array_inv!24480 (_values!6456 thiss!1427)) e!593019))))

(declare-fun res!696410 () Bool)

(assert (=> start!91988 (=> (not res!696410) (not e!593020))))

(declare-fun valid!2274 (LongMapFixedSize!6070) Bool)

(assert (=> start!91988 (= res!696410 (valid!2274 thiss!1427))))

(assert (=> start!91988 e!593020))

(assert (=> start!91988 e!593021))

(assert (=> start!91988 true))

(declare-fun b!1046009 () Bool)

(assert (=> b!1046009 (= e!593015 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!6161 (_2!7958 lt!461897)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6161 (_2!7958 lt!461897)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1046010 () Bool)

(assert (=> b!1046010 (= e!593015 (arrayContainsKey!0 (_keys!11703 (_2!7958 lt!461897)) key!909 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!38969 () Bool)

(declare-fun mapRes!38969 () Bool)

(declare-fun tp!74751 () Bool)

(declare-fun e!593018 () Bool)

(assert (=> mapNonEmpty!38969 (= mapRes!38969 (and tp!74751 e!593018))))

(declare-fun mapValue!38969 () ValueCell!11738)

(declare-fun mapKey!38969 () (_ BitVec 32))

(declare-fun mapRest!38969 () (Array (_ BitVec 32) ValueCell!11738))

(assert (=> mapNonEmpty!38969 (= (arr!31687 (_values!6456 thiss!1427)) (store mapRest!38969 mapKey!38969 mapValue!38969))))

(declare-fun b!1046011 () Bool)

(declare-fun e!593017 () Bool)

(assert (=> b!1046011 (= e!593017 tp_is_empty!24883)))

(declare-fun b!1046012 () Bool)

(assert (=> b!1046012 (= e!593019 (and e!593017 mapRes!38969))))

(declare-fun condMapEmpty!38969 () Bool)

(declare-fun mapDefault!38969 () ValueCell!11738)

(assert (=> b!1046012 (= condMapEmpty!38969 (= (arr!31687 (_values!6456 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11738)) mapDefault!38969)))))

(declare-fun b!1046013 () Bool)

(assert (=> b!1046013 (= e!593018 tp_is_empty!24883)))

(declare-fun b!1046014 () Bool)

(declare-fun res!696408 () Bool)

(assert (=> b!1046014 (=> (not res!696408) (not e!593020))))

(assert (=> b!1046014 (= res!696408 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38969 () Bool)

(assert (=> mapIsEmpty!38969 mapRes!38969))

(assert (= (and start!91988 res!696410) b!1046014))

(assert (= (and b!1046014 res!696408) b!1046007))

(assert (= (and b!1046007 res!696409) b!1046006))

(assert (= (and b!1046006 (not res!696407)) b!1046005))

(assert (= (and b!1046005 c!106326) b!1046010))

(assert (= (and b!1046005 (not c!106326)) b!1046009))

(assert (= (and b!1046012 condMapEmpty!38969) mapIsEmpty!38969))

(assert (= (and b!1046012 (not condMapEmpty!38969)) mapNonEmpty!38969))

(assert (= (and mapNonEmpty!38969 ((_ is ValueCellFull!11738) mapValue!38969)) b!1046013))

(assert (= (and b!1046012 ((_ is ValueCellFull!11738) mapDefault!38969)) b!1046011))

(assert (= b!1046008 b!1046012))

(assert (= start!91988 b!1046008))

(declare-fun b_lambda!16325 () Bool)

(assert (=> (not b_lambda!16325) (not b!1046006)))

(declare-fun t!31353 () Bool)

(declare-fun tb!7107 () Bool)

(assert (=> (and b!1046008 (= (defaultEntry!6433 thiss!1427) (defaultEntry!6433 thiss!1427)) t!31353) tb!7107))

(declare-fun result!14647 () Bool)

(assert (=> tb!7107 (= result!14647 tp_is_empty!24883)))

(assert (=> b!1046006 t!31353))

(declare-fun b_and!33797 () Bool)

(assert (= b_and!33795 (and (=> t!31353 result!14647) b_and!33797)))

(declare-fun m!965493 () Bool)

(assert (=> b!1046007 m!965493))

(declare-fun m!965495 () Bool)

(assert (=> b!1046008 m!965495))

(declare-fun m!965497 () Bool)

(assert (=> b!1046008 m!965497))

(declare-fun m!965499 () Bool)

(assert (=> mapNonEmpty!38969 m!965499))

(declare-fun m!965501 () Bool)

(assert (=> start!91988 m!965501))

(declare-fun m!965503 () Bool)

(assert (=> b!1046010 m!965503))

(declare-fun m!965505 () Bool)

(assert (=> b!1046005 m!965505))

(declare-fun m!965507 () Bool)

(assert (=> b!1046006 m!965507))

(declare-fun m!965509 () Bool)

(assert (=> b!1046006 m!965509))

(declare-fun m!965511 () Bool)

(assert (=> b!1046006 m!965511))

(declare-fun m!965513 () Bool)

(assert (=> b!1046006 m!965513))

(declare-fun m!965515 () Bool)

(assert (=> b!1046006 m!965515))

(declare-fun m!965517 () Bool)

(assert (=> b!1046006 m!965517))

(declare-fun m!965519 () Bool)

(assert (=> b!1046006 m!965519))

(declare-fun m!965521 () Bool)

(assert (=> b!1046006 m!965521))

(declare-fun m!965523 () Bool)

(assert (=> b!1046006 m!965523))

(assert (=> b!1046006 m!965521))

(declare-fun m!965525 () Bool)

(assert (=> b!1046006 m!965525))

(declare-fun m!965527 () Bool)

(assert (=> b!1046006 m!965527))

(declare-fun m!965529 () Bool)

(assert (=> b!1046006 m!965529))

(declare-fun m!965531 () Bool)

(assert (=> b!1046006 m!965531))

(declare-fun m!965533 () Bool)

(assert (=> b!1046006 m!965533))

(declare-fun m!965535 () Bool)

(assert (=> b!1046006 m!965535))

(declare-fun m!965537 () Bool)

(assert (=> b!1046006 m!965537))

(declare-fun m!965539 () Bool)

(assert (=> b!1046006 m!965539))

(assert (=> b!1046006 m!965509))

(declare-fun m!965541 () Bool)

(assert (=> b!1046006 m!965541))

(check-sat (not b!1046008) b_and!33797 (not b!1046006) (not mapNonEmpty!38969) (not b_lambda!16325) tp_is_empty!24883 (not b!1046005) (not start!91988) (not b!1046010) (not b!1046007) (not b_next!21163))
(check-sat b_and!33797 (not b_next!21163))
