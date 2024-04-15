; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90032 () Bool)

(assert start!90032)

(declare-fun b!1030920 () Bool)

(declare-fun b_free!20641 () Bool)

(declare-fun b_next!20641 () Bool)

(assert (=> b!1030920 (= b_free!20641 (not b_next!20641))))

(declare-fun tp!72994 () Bool)

(declare-fun b_and!33023 () Bool)

(assert (=> b!1030920 (= tp!72994 b_and!33023)))

(declare-fun mapNonEmpty!37995 () Bool)

(declare-fun mapRes!37995 () Bool)

(declare-fun tp!72993 () Bool)

(declare-fun e!582217 () Bool)

(assert (=> mapNonEmpty!37995 (= mapRes!37995 (and tp!72993 e!582217))))

(declare-datatypes ((V!37355 0))(
  ( (V!37356 (val!12231 Int)) )
))
(declare-datatypes ((ValueCell!11477 0))(
  ( (ValueCellFull!11477 (v!14807 V!37355)) (EmptyCell!11477) )
))
(declare-fun mapValue!37995 () ValueCell!11477)

(declare-fun mapKey!37995 () (_ BitVec 32))

(declare-datatypes ((array!64725 0))(
  ( (array!64726 (arr!31164 (Array (_ BitVec 32) (_ BitVec 64))) (size!31683 (_ BitVec 32))) )
))
(declare-datatypes ((array!64727 0))(
  ( (array!64728 (arr!31165 (Array (_ BitVec 32) ValueCell!11477)) (size!31684 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5548 0))(
  ( (LongMapFixedSize!5549 (defaultEntry!6148 Int) (mask!29933 (_ BitVec 32)) (extraKeys!5880 (_ BitVec 32)) (zeroValue!5984 V!37355) (minValue!5984 V!37355) (_size!2829 (_ BitVec 32)) (_keys!11317 array!64725) (_values!6171 array!64727) (_vacant!2829 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5548)

(declare-fun mapRest!37995 () (Array (_ BitVec 32) ValueCell!11477))

(assert (=> mapNonEmpty!37995 (= (arr!31165 (_values!6171 thiss!1427)) (store mapRest!37995 mapKey!37995 mapValue!37995))))

(declare-fun b!1030911 () Bool)

(declare-fun res!689356 () Bool)

(declare-fun e!582212 () Bool)

(assert (=> b!1030911 (=> res!689356 e!582212)))

(declare-datatypes ((Unit!33589 0))(
  ( (Unit!33590) )
))
(declare-datatypes ((tuple2!15712 0))(
  ( (tuple2!15713 (_1!7867 Unit!33589) (_2!7867 LongMapFixedSize!5548)) )
))
(declare-fun lt!454849 () tuple2!15712)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64725 (_ BitVec 32)) Bool)

(assert (=> b!1030911 (= res!689356 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11317 (_2!7867 lt!454849)) (mask!29933 (_2!7867 lt!454849)))))))

(declare-fun b!1030912 () Bool)

(declare-fun e!582213 () Bool)

(declare-fun tp_is_empty!24361 () Bool)

(assert (=> b!1030912 (= e!582213 tp_is_empty!24361)))

(declare-fun mapIsEmpty!37995 () Bool)

(assert (=> mapIsEmpty!37995 mapRes!37995))

(declare-fun b!1030913 () Bool)

(declare-fun e!582216 () Bool)

(assert (=> b!1030913 (= e!582216 (and e!582213 mapRes!37995))))

(declare-fun condMapEmpty!37995 () Bool)

(declare-fun mapDefault!37995 () ValueCell!11477)

(assert (=> b!1030913 (= condMapEmpty!37995 (= (arr!31165 (_values!6171 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11477)) mapDefault!37995)))))

(declare-fun b!1030914 () Bool)

(assert (=> b!1030914 (= e!582217 tp_is_empty!24361)))

(declare-fun b!1030916 () Bool)

(assert (=> b!1030916 (= e!582212 true)))

(declare-fun lt!454847 () Bool)

(declare-datatypes ((List!21886 0))(
  ( (Nil!21883) (Cons!21882 (h!23084 (_ BitVec 64)) (t!31013 List!21886)) )
))
(declare-fun arrayNoDuplicates!0 (array!64725 (_ BitVec 32) List!21886) Bool)

(assert (=> b!1030916 (= lt!454847 (arrayNoDuplicates!0 (_keys!11317 (_2!7867 lt!454849)) #b00000000000000000000000000000000 Nil!21883))))

(declare-fun b!1030917 () Bool)

(declare-fun e!582218 () Bool)

(declare-fun e!582214 () Bool)

(assert (=> b!1030917 (= e!582218 e!582214)))

(declare-fun res!689355 () Bool)

(assert (=> b!1030917 (=> (not res!689355) (not e!582214))))

(declare-datatypes ((SeekEntryResult!9689 0))(
  ( (MissingZero!9689 (index!41127 (_ BitVec 32))) (Found!9689 (index!41128 (_ BitVec 32))) (Intermediate!9689 (undefined!10501 Bool) (index!41129 (_ BitVec 32)) (x!91780 (_ BitVec 32))) (Undefined!9689) (MissingVacant!9689 (index!41130 (_ BitVec 32))) )
))
(declare-fun lt!454844 () SeekEntryResult!9689)

(get-info :version)

(assert (=> b!1030917 (= res!689355 ((_ is Found!9689) lt!454844))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64725 (_ BitVec 32)) SeekEntryResult!9689)

(assert (=> b!1030917 (= lt!454844 (seekEntry!0 key!909 (_keys!11317 thiss!1427) (mask!29933 thiss!1427)))))

(declare-fun b!1030918 () Bool)

(declare-fun res!689357 () Bool)

(assert (=> b!1030918 (=> res!689357 e!582212)))

(assert (=> b!1030918 (= res!689357 (or (not (= (size!31684 (_values!6171 (_2!7867 lt!454849))) (bvadd #b00000000000000000000000000000001 (mask!29933 (_2!7867 lt!454849))))) (not (= (size!31683 (_keys!11317 (_2!7867 lt!454849))) (size!31684 (_values!6171 (_2!7867 lt!454849))))) (bvslt (mask!29933 (_2!7867 lt!454849)) #b00000000000000000000000000000000) (bvslt (extraKeys!5880 (_2!7867 lt!454849)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5880 (_2!7867 lt!454849)) #b00000000000000000000000000000011)))))

(declare-fun b!1030919 () Bool)

(declare-fun res!689359 () Bool)

(assert (=> b!1030919 (=> res!689359 e!582212)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030919 (= res!689359 (not (validMask!0 (mask!29933 (_2!7867 lt!454849)))))))

(declare-fun e!582211 () Bool)

(declare-fun array_inv!24125 (array!64725) Bool)

(declare-fun array_inv!24126 (array!64727) Bool)

(assert (=> b!1030920 (= e!582211 (and tp!72994 tp_is_empty!24361 (array_inv!24125 (_keys!11317 thiss!1427)) (array_inv!24126 (_values!6171 thiss!1427)) e!582216))))

(declare-fun b!1030921 () Bool)

(declare-fun res!689353 () Bool)

(assert (=> b!1030921 (=> (not res!689353) (not e!582218))))

(assert (=> b!1030921 (= res!689353 (not (= key!909 (bvneg key!909))))))

(declare-fun res!689358 () Bool)

(assert (=> start!90032 (=> (not res!689358) (not e!582218))))

(declare-fun valid!2091 (LongMapFixedSize!5548) Bool)

(assert (=> start!90032 (= res!689358 (valid!2091 thiss!1427))))

(assert (=> start!90032 e!582218))

(assert (=> start!90032 e!582211))

(assert (=> start!90032 true))

(declare-fun b!1030915 () Bool)

(assert (=> b!1030915 (= e!582214 (not e!582212))))

(declare-fun res!689354 () Bool)

(assert (=> b!1030915 (=> res!689354 e!582212)))

(declare-datatypes ((tuple2!15714 0))(
  ( (tuple2!15715 (_1!7868 (_ BitVec 64)) (_2!7868 V!37355)) )
))
(declare-datatypes ((List!21887 0))(
  ( (Nil!21884) (Cons!21883 (h!23085 tuple2!15714) (t!31014 List!21887)) )
))
(declare-datatypes ((ListLongMap!13787 0))(
  ( (ListLongMap!13788 (toList!6909 List!21887)) )
))
(declare-fun contains!5965 (ListLongMap!13787 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3876 (array!64725 array!64727 (_ BitVec 32) (_ BitVec 32) V!37355 V!37355 (_ BitVec 32) Int) ListLongMap!13787)

(assert (=> b!1030915 (= res!689354 (not (contains!5965 (getCurrentListMap!3876 (_keys!11317 (_2!7867 lt!454849)) (_values!6171 (_2!7867 lt!454849)) (mask!29933 (_2!7867 lt!454849)) (extraKeys!5880 (_2!7867 lt!454849)) (zeroValue!5984 (_2!7867 lt!454849)) (minValue!5984 (_2!7867 lt!454849)) #b00000000000000000000000000000000 (defaultEntry!6148 (_2!7867 lt!454849))) key!909)))))

(declare-fun lt!454843 () array!64725)

(declare-fun lt!454848 () array!64727)

(declare-fun Unit!33591 () Unit!33589)

(declare-fun Unit!33592 () Unit!33589)

(assert (=> b!1030915 (= lt!454849 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2829 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15713 Unit!33591 (LongMapFixedSize!5549 (defaultEntry!6148 thiss!1427) (mask!29933 thiss!1427) (extraKeys!5880 thiss!1427) (zeroValue!5984 thiss!1427) (minValue!5984 thiss!1427) (bvsub (_size!2829 thiss!1427) #b00000000000000000000000000000001) lt!454843 lt!454848 (bvadd #b00000000000000000000000000000001 (_vacant!2829 thiss!1427)))) (tuple2!15713 Unit!33592 (LongMapFixedSize!5549 (defaultEntry!6148 thiss!1427) (mask!29933 thiss!1427) (extraKeys!5880 thiss!1427) (zeroValue!5984 thiss!1427) (minValue!5984 thiss!1427) (bvsub (_size!2829 thiss!1427) #b00000000000000000000000000000001) lt!454843 lt!454848 (_vacant!2829 thiss!1427)))))))

(declare-fun -!501 (ListLongMap!13787 (_ BitVec 64)) ListLongMap!13787)

(assert (=> b!1030915 (= (-!501 (getCurrentListMap!3876 (_keys!11317 thiss!1427) (_values!6171 thiss!1427) (mask!29933 thiss!1427) (extraKeys!5880 thiss!1427) (zeroValue!5984 thiss!1427) (minValue!5984 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6148 thiss!1427)) key!909) (getCurrentListMap!3876 lt!454843 lt!454848 (mask!29933 thiss!1427) (extraKeys!5880 thiss!1427) (zeroValue!5984 thiss!1427) (minValue!5984 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6148 thiss!1427)))))

(declare-fun dynLambda!1963 (Int (_ BitVec 64)) V!37355)

(assert (=> b!1030915 (= lt!454848 (array!64728 (store (arr!31165 (_values!6171 thiss!1427)) (index!41128 lt!454844) (ValueCellFull!11477 (dynLambda!1963 (defaultEntry!6148 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31684 (_values!6171 thiss!1427))))))

(declare-fun lt!454851 () Unit!33589)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!26 (array!64725 array!64727 (_ BitVec 32) (_ BitVec 32) V!37355 V!37355 (_ BitVec 32) (_ BitVec 64) Int) Unit!33589)

(assert (=> b!1030915 (= lt!454851 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!26 (_keys!11317 thiss!1427) (_values!6171 thiss!1427) (mask!29933 thiss!1427) (extraKeys!5880 thiss!1427) (zeroValue!5984 thiss!1427) (minValue!5984 thiss!1427) (index!41128 lt!454844) key!909 (defaultEntry!6148 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030915 (not (arrayContainsKey!0 lt!454843 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454850 () Unit!33589)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64725 (_ BitVec 32) (_ BitVec 64)) Unit!33589)

(assert (=> b!1030915 (= lt!454850 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11317 thiss!1427) (index!41128 lt!454844) key!909))))

(assert (=> b!1030915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454843 (mask!29933 thiss!1427))))

(declare-fun lt!454845 () Unit!33589)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64725 (_ BitVec 32) (_ BitVec 32)) Unit!33589)

(assert (=> b!1030915 (= lt!454845 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11317 thiss!1427) (index!41128 lt!454844) (mask!29933 thiss!1427)))))

(assert (=> b!1030915 (arrayNoDuplicates!0 lt!454843 #b00000000000000000000000000000000 Nil!21883)))

(declare-fun lt!454842 () Unit!33589)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64725 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21886) Unit!33589)

(assert (=> b!1030915 (= lt!454842 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11317 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41128 lt!454844) #b00000000000000000000000000000000 Nil!21883))))

(declare-fun arrayCountValidKeys!0 (array!64725 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030915 (= (arrayCountValidKeys!0 lt!454843 #b00000000000000000000000000000000 (size!31683 (_keys!11317 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11317 thiss!1427) #b00000000000000000000000000000000 (size!31683 (_keys!11317 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030915 (= lt!454843 (array!64726 (store (arr!31164 (_keys!11317 thiss!1427)) (index!41128 lt!454844) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31683 (_keys!11317 thiss!1427))))))

(declare-fun lt!454846 () Unit!33589)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64725 (_ BitVec 32) (_ BitVec 64)) Unit!33589)

(assert (=> b!1030915 (= lt!454846 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11317 thiss!1427) (index!41128 lt!454844) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!90032 res!689358) b!1030921))

(assert (= (and b!1030921 res!689353) b!1030917))

(assert (= (and b!1030917 res!689355) b!1030915))

(assert (= (and b!1030915 (not res!689354)) b!1030919))

(assert (= (and b!1030919 (not res!689359)) b!1030918))

(assert (= (and b!1030918 (not res!689357)) b!1030911))

(assert (= (and b!1030911 (not res!689356)) b!1030916))

(assert (= (and b!1030913 condMapEmpty!37995) mapIsEmpty!37995))

(assert (= (and b!1030913 (not condMapEmpty!37995)) mapNonEmpty!37995))

(assert (= (and mapNonEmpty!37995 ((_ is ValueCellFull!11477) mapValue!37995)) b!1030914))

(assert (= (and b!1030913 ((_ is ValueCellFull!11477) mapDefault!37995)) b!1030912))

(assert (= b!1030920 b!1030913))

(assert (= start!90032 b!1030920))

(declare-fun b_lambda!15963 () Bool)

(assert (=> (not b_lambda!15963) (not b!1030915)))

(declare-fun t!31012 () Bool)

(declare-fun tb!6951 () Bool)

(assert (=> (and b!1030920 (= (defaultEntry!6148 thiss!1427) (defaultEntry!6148 thiss!1427)) t!31012) tb!6951))

(declare-fun result!14239 () Bool)

(assert (=> tb!6951 (= result!14239 tp_is_empty!24361)))

(assert (=> b!1030915 t!31012))

(declare-fun b_and!33025 () Bool)

(assert (= b_and!33023 (and (=> t!31012 result!14239) b_and!33025)))

(declare-fun m!950377 () Bool)

(assert (=> start!90032 m!950377))

(declare-fun m!950379 () Bool)

(assert (=> b!1030911 m!950379))

(declare-fun m!950381 () Bool)

(assert (=> b!1030915 m!950381))

(declare-fun m!950383 () Bool)

(assert (=> b!1030915 m!950383))

(declare-fun m!950385 () Bool)

(assert (=> b!1030915 m!950385))

(declare-fun m!950387 () Bool)

(assert (=> b!1030915 m!950387))

(declare-fun m!950389 () Bool)

(assert (=> b!1030915 m!950389))

(declare-fun m!950391 () Bool)

(assert (=> b!1030915 m!950391))

(declare-fun m!950393 () Bool)

(assert (=> b!1030915 m!950393))

(declare-fun m!950395 () Bool)

(assert (=> b!1030915 m!950395))

(declare-fun m!950397 () Bool)

(assert (=> b!1030915 m!950397))

(declare-fun m!950399 () Bool)

(assert (=> b!1030915 m!950399))

(declare-fun m!950401 () Bool)

(assert (=> b!1030915 m!950401))

(assert (=> b!1030915 m!950397))

(declare-fun m!950403 () Bool)

(assert (=> b!1030915 m!950403))

(declare-fun m!950405 () Bool)

(assert (=> b!1030915 m!950405))

(declare-fun m!950407 () Bool)

(assert (=> b!1030915 m!950407))

(assert (=> b!1030915 m!950389))

(declare-fun m!950409 () Bool)

(assert (=> b!1030915 m!950409))

(declare-fun m!950411 () Bool)

(assert (=> b!1030915 m!950411))

(declare-fun m!950413 () Bool)

(assert (=> b!1030915 m!950413))

(declare-fun m!950415 () Bool)

(assert (=> b!1030915 m!950415))

(declare-fun m!950417 () Bool)

(assert (=> b!1030920 m!950417))

(declare-fun m!950419 () Bool)

(assert (=> b!1030920 m!950419))

(declare-fun m!950421 () Bool)

(assert (=> b!1030919 m!950421))

(declare-fun m!950423 () Bool)

(assert (=> b!1030917 m!950423))

(declare-fun m!950425 () Bool)

(assert (=> mapNonEmpty!37995 m!950425))

(declare-fun m!950427 () Bool)

(assert (=> b!1030916 m!950427))

(check-sat (not mapNonEmpty!37995) (not b!1030917) (not b!1030920) (not b!1030915) tp_is_empty!24361 (not b!1030911) (not start!90032) (not b!1030916) b_and!33025 (not b!1030919) (not b_next!20641) (not b_lambda!15963))
(check-sat b_and!33025 (not b_next!20641))
