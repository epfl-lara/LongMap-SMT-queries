; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90018 () Bool)

(assert start!90018)

(declare-fun b!1030786 () Bool)

(declare-fun b_free!20625 () Bool)

(declare-fun b_next!20625 () Bool)

(assert (=> b!1030786 (= b_free!20625 (not b_next!20625))))

(declare-fun tp!72946 () Bool)

(declare-fun b_and!33017 () Bool)

(assert (=> b!1030786 (= tp!72946 b_and!33017)))

(declare-fun res!689256 () Bool)

(declare-fun e!582117 () Bool)

(assert (=> start!90018 (=> (not res!689256) (not e!582117))))

(declare-datatypes ((V!37333 0))(
  ( (V!37334 (val!12223 Int)) )
))
(declare-datatypes ((ValueCell!11469 0))(
  ( (ValueCellFull!11469 (v!14800 V!37333)) (EmptyCell!11469) )
))
(declare-datatypes ((array!64754 0))(
  ( (array!64755 (arr!31179 (Array (_ BitVec 32) (_ BitVec 64))) (size!31696 (_ BitVec 32))) )
))
(declare-datatypes ((array!64756 0))(
  ( (array!64757 (arr!31180 (Array (_ BitVec 32) ValueCell!11469)) (size!31697 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5532 0))(
  ( (LongMapFixedSize!5533 (defaultEntry!6140 Int) (mask!29924 (_ BitVec 32)) (extraKeys!5872 (_ BitVec 32)) (zeroValue!5976 V!37333) (minValue!5976 V!37333) (_size!2821 (_ BitVec 32)) (_keys!11313 array!64754) (_values!6163 array!64756) (_vacant!2821 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5532)

(declare-fun valid!2094 (LongMapFixedSize!5532) Bool)

(assert (=> start!90018 (= res!689256 (valid!2094 thiss!1427))))

(assert (=> start!90018 e!582117))

(declare-fun e!582111 () Bool)

(assert (=> start!90018 e!582111))

(assert (=> start!90018 true))

(declare-fun b!1030782 () Bool)

(declare-fun res!689252 () Bool)

(assert (=> b!1030782 (=> (not res!689252) (not e!582117))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1030782 (= res!689252 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1030783 () Bool)

(declare-fun res!689257 () Bool)

(declare-fun e!582110 () Bool)

(assert (=> b!1030783 (=> res!689257 e!582110)))

(declare-datatypes ((Unit!33671 0))(
  ( (Unit!33672) )
))
(declare-datatypes ((tuple2!15598 0))(
  ( (tuple2!15599 (_1!7810 Unit!33671) (_2!7810 LongMapFixedSize!5532)) )
))
(declare-fun lt!454806 () tuple2!15598)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64754 (_ BitVec 32)) Bool)

(assert (=> b!1030783 (= res!689257 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11313 (_2!7810 lt!454806)) (mask!29924 (_2!7810 lt!454806)))))))

(declare-fun b!1030784 () Bool)

(declare-fun e!582113 () Bool)

(declare-fun tp_is_empty!24345 () Bool)

(assert (=> b!1030784 (= e!582113 tp_is_empty!24345)))

(declare-fun mapNonEmpty!37971 () Bool)

(declare-fun mapRes!37971 () Bool)

(declare-fun tp!72945 () Bool)

(assert (=> mapNonEmpty!37971 (= mapRes!37971 (and tp!72945 e!582113))))

(declare-fun mapValue!37971 () ValueCell!11469)

(declare-fun mapKey!37971 () (_ BitVec 32))

(declare-fun mapRest!37971 () (Array (_ BitVec 32) ValueCell!11469))

(assert (=> mapNonEmpty!37971 (= (arr!31180 (_values!6163 thiss!1427)) (store mapRest!37971 mapKey!37971 mapValue!37971))))

(declare-fun b!1030785 () Bool)

(declare-fun e!582114 () Bool)

(assert (=> b!1030785 (= e!582114 (not e!582110))))

(declare-fun res!689253 () Bool)

(assert (=> b!1030785 (=> res!689253 e!582110)))

(declare-datatypes ((tuple2!15600 0))(
  ( (tuple2!15601 (_1!7811 (_ BitVec 64)) (_2!7811 V!37333)) )
))
(declare-datatypes ((List!21841 0))(
  ( (Nil!21838) (Cons!21837 (h!23039 tuple2!15600) (t!30961 List!21841)) )
))
(declare-datatypes ((ListLongMap!13701 0))(
  ( (ListLongMap!13702 (toList!6866 List!21841)) )
))
(declare-fun contains!5980 (ListLongMap!13701 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3914 (array!64754 array!64756 (_ BitVec 32) (_ BitVec 32) V!37333 V!37333 (_ BitVec 32) Int) ListLongMap!13701)

(assert (=> b!1030785 (= res!689253 (not (contains!5980 (getCurrentListMap!3914 (_keys!11313 (_2!7810 lt!454806)) (_values!6163 (_2!7810 lt!454806)) (mask!29924 (_2!7810 lt!454806)) (extraKeys!5872 (_2!7810 lt!454806)) (zeroValue!5976 (_2!7810 lt!454806)) (minValue!5976 (_2!7810 lt!454806)) #b00000000000000000000000000000000 (defaultEntry!6140 (_2!7810 lt!454806))) key!909)))))

(declare-fun lt!454809 () array!64754)

(declare-fun lt!454803 () array!64756)

(declare-fun Unit!33673 () Unit!33671)

(declare-fun Unit!33674 () Unit!33671)

(assert (=> b!1030785 (= lt!454806 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2821 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15599 Unit!33673 (LongMapFixedSize!5533 (defaultEntry!6140 thiss!1427) (mask!29924 thiss!1427) (extraKeys!5872 thiss!1427) (zeroValue!5976 thiss!1427) (minValue!5976 thiss!1427) (bvsub (_size!2821 thiss!1427) #b00000000000000000000000000000001) lt!454809 lt!454803 (bvadd #b00000000000000000000000000000001 (_vacant!2821 thiss!1427)))) (tuple2!15599 Unit!33674 (LongMapFixedSize!5533 (defaultEntry!6140 thiss!1427) (mask!29924 thiss!1427) (extraKeys!5872 thiss!1427) (zeroValue!5976 thiss!1427) (minValue!5976 thiss!1427) (bvsub (_size!2821 thiss!1427) #b00000000000000000000000000000001) lt!454809 lt!454803 (_vacant!2821 thiss!1427)))))))

(declare-fun -!493 (ListLongMap!13701 (_ BitVec 64)) ListLongMap!13701)

(assert (=> b!1030785 (= (-!493 (getCurrentListMap!3914 (_keys!11313 thiss!1427) (_values!6163 thiss!1427) (mask!29924 thiss!1427) (extraKeys!5872 thiss!1427) (zeroValue!5976 thiss!1427) (minValue!5976 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6140 thiss!1427)) key!909) (getCurrentListMap!3914 lt!454809 lt!454803 (mask!29924 thiss!1427) (extraKeys!5872 thiss!1427) (zeroValue!5976 thiss!1427) (minValue!5976 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6140 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9693 0))(
  ( (MissingZero!9693 (index!41143 (_ BitVec 32))) (Found!9693 (index!41144 (_ BitVec 32))) (Intermediate!9693 (undefined!10505 Bool) (index!41145 (_ BitVec 32)) (x!91747 (_ BitVec 32))) (Undefined!9693) (MissingVacant!9693 (index!41146 (_ BitVec 32))) )
))
(declare-fun lt!454811 () SeekEntryResult!9693)

(declare-fun dynLambda!1963 (Int (_ BitVec 64)) V!37333)

(assert (=> b!1030785 (= lt!454803 (array!64757 (store (arr!31180 (_values!6163 thiss!1427)) (index!41144 lt!454811) (ValueCellFull!11469 (dynLambda!1963 (defaultEntry!6140 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31697 (_values!6163 thiss!1427))))))

(declare-fun lt!454802 () Unit!33671)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!19 (array!64754 array!64756 (_ BitVec 32) (_ BitVec 32) V!37333 V!37333 (_ BitVec 32) (_ BitVec 64) Int) Unit!33671)

(assert (=> b!1030785 (= lt!454802 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!19 (_keys!11313 thiss!1427) (_values!6163 thiss!1427) (mask!29924 thiss!1427) (extraKeys!5872 thiss!1427) (zeroValue!5976 thiss!1427) (minValue!5976 thiss!1427) (index!41144 lt!454811) key!909 (defaultEntry!6140 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030785 (not (arrayContainsKey!0 lt!454809 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454805 () Unit!33671)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64754 (_ BitVec 32) (_ BitVec 64)) Unit!33671)

(assert (=> b!1030785 (= lt!454805 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11313 thiss!1427) (index!41144 lt!454811) key!909))))

(assert (=> b!1030785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454809 (mask!29924 thiss!1427))))

(declare-fun lt!454808 () Unit!33671)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64754 (_ BitVec 32) (_ BitVec 32)) Unit!33671)

(assert (=> b!1030785 (= lt!454808 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11313 thiss!1427) (index!41144 lt!454811) (mask!29924 thiss!1427)))))

(declare-datatypes ((List!21842 0))(
  ( (Nil!21839) (Cons!21838 (h!23040 (_ BitVec 64)) (t!30962 List!21842)) )
))
(declare-fun arrayNoDuplicates!0 (array!64754 (_ BitVec 32) List!21842) Bool)

(assert (=> b!1030785 (arrayNoDuplicates!0 lt!454809 #b00000000000000000000000000000000 Nil!21839)))

(declare-fun lt!454807 () Unit!33671)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64754 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21842) Unit!33671)

(assert (=> b!1030785 (= lt!454807 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11313 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41144 lt!454811) #b00000000000000000000000000000000 Nil!21839))))

(declare-fun arrayCountValidKeys!0 (array!64754 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030785 (= (arrayCountValidKeys!0 lt!454809 #b00000000000000000000000000000000 (size!31696 (_keys!11313 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11313 thiss!1427) #b00000000000000000000000000000000 (size!31696 (_keys!11313 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030785 (= lt!454809 (array!64755 (store (arr!31179 (_keys!11313 thiss!1427)) (index!41144 lt!454811) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31696 (_keys!11313 thiss!1427))))))

(declare-fun lt!454810 () Unit!33671)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64754 (_ BitVec 32) (_ BitVec 64)) Unit!33671)

(assert (=> b!1030785 (= lt!454810 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11313 thiss!1427) (index!41144 lt!454811) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!582112 () Bool)

(declare-fun array_inv!24135 (array!64754) Bool)

(declare-fun array_inv!24136 (array!64756) Bool)

(assert (=> b!1030786 (= e!582111 (and tp!72946 tp_is_empty!24345 (array_inv!24135 (_keys!11313 thiss!1427)) (array_inv!24136 (_values!6163 thiss!1427)) e!582112))))

(declare-fun b!1030787 () Bool)

(declare-fun res!689258 () Bool)

(assert (=> b!1030787 (=> res!689258 e!582110)))

(assert (=> b!1030787 (= res!689258 (or (not (= (size!31697 (_values!6163 (_2!7810 lt!454806))) (bvadd #b00000000000000000000000000000001 (mask!29924 (_2!7810 lt!454806))))) (not (= (size!31696 (_keys!11313 (_2!7810 lt!454806))) (size!31697 (_values!6163 (_2!7810 lt!454806))))) (bvslt (mask!29924 (_2!7810 lt!454806)) #b00000000000000000000000000000000) (bvslt (extraKeys!5872 (_2!7810 lt!454806)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5872 (_2!7810 lt!454806)) #b00000000000000000000000000000011)))))

(declare-fun b!1030788 () Bool)

(assert (=> b!1030788 (= e!582110 true)))

(declare-fun lt!454804 () Bool)

(assert (=> b!1030788 (= lt!454804 (arrayNoDuplicates!0 (_keys!11313 (_2!7810 lt!454806)) #b00000000000000000000000000000000 Nil!21839))))

(declare-fun b!1030789 () Bool)

(declare-fun e!582116 () Bool)

(assert (=> b!1030789 (= e!582112 (and e!582116 mapRes!37971))))

(declare-fun condMapEmpty!37971 () Bool)

(declare-fun mapDefault!37971 () ValueCell!11469)

(assert (=> b!1030789 (= condMapEmpty!37971 (= (arr!31180 (_values!6163 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11469)) mapDefault!37971)))))

(declare-fun b!1030790 () Bool)

(declare-fun res!689254 () Bool)

(assert (=> b!1030790 (=> res!689254 e!582110)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030790 (= res!689254 (not (validMask!0 (mask!29924 (_2!7810 lt!454806)))))))

(declare-fun mapIsEmpty!37971 () Bool)

(assert (=> mapIsEmpty!37971 mapRes!37971))

(declare-fun b!1030791 () Bool)

(assert (=> b!1030791 (= e!582116 tp_is_empty!24345)))

(declare-fun b!1030792 () Bool)

(assert (=> b!1030792 (= e!582117 e!582114)))

(declare-fun res!689255 () Bool)

(assert (=> b!1030792 (=> (not res!689255) (not e!582114))))

(get-info :version)

(assert (=> b!1030792 (= res!689255 ((_ is Found!9693) lt!454811))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64754 (_ BitVec 32)) SeekEntryResult!9693)

(assert (=> b!1030792 (= lt!454811 (seekEntry!0 key!909 (_keys!11313 thiss!1427) (mask!29924 thiss!1427)))))

(assert (= (and start!90018 res!689256) b!1030782))

(assert (= (and b!1030782 res!689252) b!1030792))

(assert (= (and b!1030792 res!689255) b!1030785))

(assert (= (and b!1030785 (not res!689253)) b!1030790))

(assert (= (and b!1030790 (not res!689254)) b!1030787))

(assert (= (and b!1030787 (not res!689258)) b!1030783))

(assert (= (and b!1030783 (not res!689257)) b!1030788))

(assert (= (and b!1030789 condMapEmpty!37971) mapIsEmpty!37971))

(assert (= (and b!1030789 (not condMapEmpty!37971)) mapNonEmpty!37971))

(assert (= (and mapNonEmpty!37971 ((_ is ValueCellFull!11469) mapValue!37971)) b!1030784))

(assert (= (and b!1030789 ((_ is ValueCellFull!11469) mapDefault!37971)) b!1030791))

(assert (= b!1030786 b!1030789))

(assert (= start!90018 b!1030786))

(declare-fun b_lambda!15969 () Bool)

(assert (=> (not b_lambda!15969) (not b!1030785)))

(declare-fun t!30960 () Bool)

(declare-fun tb!6943 () Bool)

(assert (=> (and b!1030786 (= (defaultEntry!6140 thiss!1427) (defaultEntry!6140 thiss!1427)) t!30960) tb!6943))

(declare-fun result!14215 () Bool)

(assert (=> tb!6943 (= result!14215 tp_is_empty!24345)))

(assert (=> b!1030785 t!30960))

(declare-fun b_and!33019 () Bool)

(assert (= b_and!33017 (and (=> t!30960 result!14215) b_and!33019)))

(declare-fun m!950581 () Bool)

(assert (=> b!1030788 m!950581))

(declare-fun m!950583 () Bool)

(assert (=> b!1030785 m!950583))

(declare-fun m!950585 () Bool)

(assert (=> b!1030785 m!950585))

(declare-fun m!950587 () Bool)

(assert (=> b!1030785 m!950587))

(declare-fun m!950589 () Bool)

(assert (=> b!1030785 m!950589))

(declare-fun m!950591 () Bool)

(assert (=> b!1030785 m!950591))

(declare-fun m!950593 () Bool)

(assert (=> b!1030785 m!950593))

(declare-fun m!950595 () Bool)

(assert (=> b!1030785 m!950595))

(declare-fun m!950597 () Bool)

(assert (=> b!1030785 m!950597))

(declare-fun m!950599 () Bool)

(assert (=> b!1030785 m!950599))

(declare-fun m!950601 () Bool)

(assert (=> b!1030785 m!950601))

(declare-fun m!950603 () Bool)

(assert (=> b!1030785 m!950603))

(declare-fun m!950605 () Bool)

(assert (=> b!1030785 m!950605))

(assert (=> b!1030785 m!950593))

(declare-fun m!950607 () Bool)

(assert (=> b!1030785 m!950607))

(assert (=> b!1030785 m!950597))

(declare-fun m!950609 () Bool)

(assert (=> b!1030785 m!950609))

(declare-fun m!950611 () Bool)

(assert (=> b!1030785 m!950611))

(declare-fun m!950613 () Bool)

(assert (=> b!1030785 m!950613))

(declare-fun m!950615 () Bool)

(assert (=> b!1030785 m!950615))

(declare-fun m!950617 () Bool)

(assert (=> b!1030785 m!950617))

(declare-fun m!950619 () Bool)

(assert (=> b!1030786 m!950619))

(declare-fun m!950621 () Bool)

(assert (=> b!1030786 m!950621))

(declare-fun m!950623 () Bool)

(assert (=> b!1030783 m!950623))

(declare-fun m!950625 () Bool)

(assert (=> mapNonEmpty!37971 m!950625))

(declare-fun m!950627 () Bool)

(assert (=> start!90018 m!950627))

(declare-fun m!950629 () Bool)

(assert (=> b!1030792 m!950629))

(declare-fun m!950631 () Bool)

(assert (=> b!1030790 m!950631))

(check-sat (not b!1030786) (not b_next!20625) (not b!1030785) (not b!1030783) (not start!90018) (not b!1030792) (not mapNonEmpty!37971) b_and!33019 (not b_lambda!15969) tp_is_empty!24345 (not b!1030788) (not b!1030790))
(check-sat b_and!33019 (not b_next!20625))
