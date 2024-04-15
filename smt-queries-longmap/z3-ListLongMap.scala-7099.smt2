; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90038 () Bool)

(assert start!90038)

(declare-fun b!1031019 () Bool)

(declare-fun b_free!20647 () Bool)

(declare-fun b_next!20647 () Bool)

(assert (=> b!1031019 (= b_free!20647 (not b_next!20647))))

(declare-fun tp!73011 () Bool)

(declare-fun b_and!33035 () Bool)

(assert (=> b!1031019 (= tp!73011 b_and!33035)))

(declare-fun b!1031016 () Bool)

(declare-fun res!689421 () Bool)

(declare-fun e!582283 () Bool)

(assert (=> b!1031016 (=> (not res!689421) (not e!582283))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1031016 (= res!689421 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031017 () Bool)

(declare-fun e!582285 () Bool)

(assert (=> b!1031017 (= e!582285 true)))

(declare-fun lt!454937 () Bool)

(declare-datatypes ((V!37363 0))(
  ( (V!37364 (val!12234 Int)) )
))
(declare-datatypes ((ValueCell!11480 0))(
  ( (ValueCellFull!11480 (v!14810 V!37363)) (EmptyCell!11480) )
))
(declare-datatypes ((Unit!33599 0))(
  ( (Unit!33600) )
))
(declare-datatypes ((array!64737 0))(
  ( (array!64738 (arr!31170 (Array (_ BitVec 32) (_ BitVec 64))) (size!31689 (_ BitVec 32))) )
))
(declare-datatypes ((array!64739 0))(
  ( (array!64740 (arr!31171 (Array (_ BitVec 32) ValueCell!11480)) (size!31690 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5554 0))(
  ( (LongMapFixedSize!5555 (defaultEntry!6151 Int) (mask!29938 (_ BitVec 32)) (extraKeys!5883 (_ BitVec 32)) (zeroValue!5987 V!37363) (minValue!5987 V!37363) (_size!2832 (_ BitVec 32)) (_keys!11320 array!64737) (_values!6174 array!64739) (_vacant!2832 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15722 0))(
  ( (tuple2!15723 (_1!7872 Unit!33599) (_2!7872 LongMapFixedSize!5554)) )
))
(declare-fun lt!454939 () tuple2!15722)

(declare-datatypes ((List!21891 0))(
  ( (Nil!21888) (Cons!21887 (h!23089 (_ BitVec 64)) (t!31024 List!21891)) )
))
(declare-fun arrayNoDuplicates!0 (array!64737 (_ BitVec 32) List!21891) Bool)

(assert (=> b!1031017 (= lt!454937 (arrayNoDuplicates!0 (_keys!11320 (_2!7872 lt!454939)) #b00000000000000000000000000000000 Nil!21888))))

(declare-fun mapNonEmpty!38004 () Bool)

(declare-fun mapRes!38004 () Bool)

(declare-fun tp!73012 () Bool)

(declare-fun e!582286 () Bool)

(assert (=> mapNonEmpty!38004 (= mapRes!38004 (and tp!73012 e!582286))))

(declare-fun mapRest!38004 () (Array (_ BitVec 32) ValueCell!11480))

(declare-fun thiss!1427 () LongMapFixedSize!5554)

(declare-fun mapValue!38004 () ValueCell!11480)

(declare-fun mapKey!38004 () (_ BitVec 32))

(assert (=> mapNonEmpty!38004 (= (arr!31171 (_values!6174 thiss!1427)) (store mapRest!38004 mapKey!38004 mapValue!38004))))

(declare-fun b!1031018 () Bool)

(declare-fun res!689422 () Bool)

(assert (=> b!1031018 (=> res!689422 e!582285)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031018 (= res!689422 (not (validMask!0 (mask!29938 (_2!7872 lt!454939)))))))

(declare-fun mapIsEmpty!38004 () Bool)

(assert (=> mapIsEmpty!38004 mapRes!38004))

(declare-fun tp_is_empty!24367 () Bool)

(declare-fun e!582290 () Bool)

(declare-fun e!582284 () Bool)

(declare-fun array_inv!24129 (array!64737) Bool)

(declare-fun array_inv!24130 (array!64739) Bool)

(assert (=> b!1031019 (= e!582284 (and tp!73011 tp_is_empty!24367 (array_inv!24129 (_keys!11320 thiss!1427)) (array_inv!24130 (_values!6174 thiss!1427)) e!582290))))

(declare-fun b!1031020 () Bool)

(declare-fun res!689416 () Bool)

(assert (=> b!1031020 (=> res!689416 e!582285)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64737 (_ BitVec 32)) Bool)

(assert (=> b!1031020 (= res!689416 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11320 (_2!7872 lt!454939)) (mask!29938 (_2!7872 lt!454939)))))))

(declare-fun b!1031022 () Bool)

(declare-fun e!582287 () Bool)

(assert (=> b!1031022 (= e!582290 (and e!582287 mapRes!38004))))

(declare-fun condMapEmpty!38004 () Bool)

(declare-fun mapDefault!38004 () ValueCell!11480)

(assert (=> b!1031022 (= condMapEmpty!38004 (= (arr!31171 (_values!6174 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11480)) mapDefault!38004)))))

(declare-fun b!1031023 () Bool)

(assert (=> b!1031023 (= e!582286 tp_is_empty!24367)))

(declare-fun b!1031024 () Bool)

(declare-fun e!582288 () Bool)

(assert (=> b!1031024 (= e!582288 (not e!582285))))

(declare-fun res!689420 () Bool)

(assert (=> b!1031024 (=> res!689420 e!582285)))

(declare-datatypes ((tuple2!15724 0))(
  ( (tuple2!15725 (_1!7873 (_ BitVec 64)) (_2!7873 V!37363)) )
))
(declare-datatypes ((List!21892 0))(
  ( (Nil!21889) (Cons!21888 (h!23090 tuple2!15724) (t!31025 List!21892)) )
))
(declare-datatypes ((ListLongMap!13791 0))(
  ( (ListLongMap!13792 (toList!6911 List!21892)) )
))
(declare-fun contains!5967 (ListLongMap!13791 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3878 (array!64737 array!64739 (_ BitVec 32) (_ BitVec 32) V!37363 V!37363 (_ BitVec 32) Int) ListLongMap!13791)

(assert (=> b!1031024 (= res!689420 (not (contains!5967 (getCurrentListMap!3878 (_keys!11320 (_2!7872 lt!454939)) (_values!6174 (_2!7872 lt!454939)) (mask!29938 (_2!7872 lt!454939)) (extraKeys!5883 (_2!7872 lt!454939)) (zeroValue!5987 (_2!7872 lt!454939)) (minValue!5987 (_2!7872 lt!454939)) #b00000000000000000000000000000000 (defaultEntry!6151 (_2!7872 lt!454939))) key!909)))))

(declare-fun lt!454932 () array!64739)

(declare-fun lt!454933 () array!64737)

(declare-fun Unit!33601 () Unit!33599)

(declare-fun Unit!33602 () Unit!33599)

(assert (=> b!1031024 (= lt!454939 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2832 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15723 Unit!33601 (LongMapFixedSize!5555 (defaultEntry!6151 thiss!1427) (mask!29938 thiss!1427) (extraKeys!5883 thiss!1427) (zeroValue!5987 thiss!1427) (minValue!5987 thiss!1427) (bvsub (_size!2832 thiss!1427) #b00000000000000000000000000000001) lt!454933 lt!454932 (bvadd #b00000000000000000000000000000001 (_vacant!2832 thiss!1427)))) (tuple2!15723 Unit!33602 (LongMapFixedSize!5555 (defaultEntry!6151 thiss!1427) (mask!29938 thiss!1427) (extraKeys!5883 thiss!1427) (zeroValue!5987 thiss!1427) (minValue!5987 thiss!1427) (bvsub (_size!2832 thiss!1427) #b00000000000000000000000000000001) lt!454933 lt!454932 (_vacant!2832 thiss!1427)))))))

(declare-fun -!503 (ListLongMap!13791 (_ BitVec 64)) ListLongMap!13791)

(assert (=> b!1031024 (= (-!503 (getCurrentListMap!3878 (_keys!11320 thiss!1427) (_values!6174 thiss!1427) (mask!29938 thiss!1427) (extraKeys!5883 thiss!1427) (zeroValue!5987 thiss!1427) (minValue!5987 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6151 thiss!1427)) key!909) (getCurrentListMap!3878 lt!454933 lt!454932 (mask!29938 thiss!1427) (extraKeys!5883 thiss!1427) (zeroValue!5987 thiss!1427) (minValue!5987 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6151 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9692 0))(
  ( (MissingZero!9692 (index!41139 (_ BitVec 32))) (Found!9692 (index!41140 (_ BitVec 32))) (Intermediate!9692 (undefined!10504 Bool) (index!41141 (_ BitVec 32)) (x!91797 (_ BitVec 32))) (Undefined!9692) (MissingVacant!9692 (index!41142 (_ BitVec 32))) )
))
(declare-fun lt!454936 () SeekEntryResult!9692)

(declare-fun dynLambda!1965 (Int (_ BitVec 64)) V!37363)

(assert (=> b!1031024 (= lt!454932 (array!64740 (store (arr!31171 (_values!6174 thiss!1427)) (index!41140 lt!454936) (ValueCellFull!11480 (dynLambda!1965 (defaultEntry!6151 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31690 (_values!6174 thiss!1427))))))

(declare-fun lt!454938 () Unit!33599)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!28 (array!64737 array!64739 (_ BitVec 32) (_ BitVec 32) V!37363 V!37363 (_ BitVec 32) (_ BitVec 64) Int) Unit!33599)

(assert (=> b!1031024 (= lt!454938 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!28 (_keys!11320 thiss!1427) (_values!6174 thiss!1427) (mask!29938 thiss!1427) (extraKeys!5883 thiss!1427) (zeroValue!5987 thiss!1427) (minValue!5987 thiss!1427) (index!41140 lt!454936) key!909 (defaultEntry!6151 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031024 (not (arrayContainsKey!0 lt!454933 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454935 () Unit!33599)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64737 (_ BitVec 32) (_ BitVec 64)) Unit!33599)

(assert (=> b!1031024 (= lt!454935 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11320 thiss!1427) (index!41140 lt!454936) key!909))))

(assert (=> b!1031024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454933 (mask!29938 thiss!1427))))

(declare-fun lt!454941 () Unit!33599)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64737 (_ BitVec 32) (_ BitVec 32)) Unit!33599)

(assert (=> b!1031024 (= lt!454941 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11320 thiss!1427) (index!41140 lt!454936) (mask!29938 thiss!1427)))))

(assert (=> b!1031024 (arrayNoDuplicates!0 lt!454933 #b00000000000000000000000000000000 Nil!21888)))

(declare-fun lt!454934 () Unit!33599)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64737 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21891) Unit!33599)

(assert (=> b!1031024 (= lt!454934 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11320 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41140 lt!454936) #b00000000000000000000000000000000 Nil!21888))))

(declare-fun arrayCountValidKeys!0 (array!64737 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031024 (= (arrayCountValidKeys!0 lt!454933 #b00000000000000000000000000000000 (size!31689 (_keys!11320 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11320 thiss!1427) #b00000000000000000000000000000000 (size!31689 (_keys!11320 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031024 (= lt!454933 (array!64738 (store (arr!31170 (_keys!11320 thiss!1427)) (index!41140 lt!454936) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31689 (_keys!11320 thiss!1427))))))

(declare-fun lt!454940 () Unit!33599)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64737 (_ BitVec 32) (_ BitVec 64)) Unit!33599)

(assert (=> b!1031024 (= lt!454940 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11320 thiss!1427) (index!41140 lt!454936) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031025 () Bool)

(declare-fun res!689417 () Bool)

(assert (=> b!1031025 (=> res!689417 e!582285)))

(assert (=> b!1031025 (= res!689417 (or (not (= (size!31690 (_values!6174 (_2!7872 lt!454939))) (bvadd #b00000000000000000000000000000001 (mask!29938 (_2!7872 lt!454939))))) (not (= (size!31689 (_keys!11320 (_2!7872 lt!454939))) (size!31690 (_values!6174 (_2!7872 lt!454939))))) (bvslt (mask!29938 (_2!7872 lt!454939)) #b00000000000000000000000000000000) (bvslt (extraKeys!5883 (_2!7872 lt!454939)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5883 (_2!7872 lt!454939)) #b00000000000000000000000000000011)))))

(declare-fun b!1031026 () Bool)

(assert (=> b!1031026 (= e!582283 e!582288)))

(declare-fun res!689418 () Bool)

(assert (=> b!1031026 (=> (not res!689418) (not e!582288))))

(get-info :version)

(assert (=> b!1031026 (= res!689418 ((_ is Found!9692) lt!454936))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64737 (_ BitVec 32)) SeekEntryResult!9692)

(assert (=> b!1031026 (= lt!454936 (seekEntry!0 key!909 (_keys!11320 thiss!1427) (mask!29938 thiss!1427)))))

(declare-fun b!1031021 () Bool)

(assert (=> b!1031021 (= e!582287 tp_is_empty!24367)))

(declare-fun res!689419 () Bool)

(assert (=> start!90038 (=> (not res!689419) (not e!582283))))

(declare-fun valid!2093 (LongMapFixedSize!5554) Bool)

(assert (=> start!90038 (= res!689419 (valid!2093 thiss!1427))))

(assert (=> start!90038 e!582283))

(assert (=> start!90038 e!582284))

(assert (=> start!90038 true))

(assert (= (and start!90038 res!689419) b!1031016))

(assert (= (and b!1031016 res!689421) b!1031026))

(assert (= (and b!1031026 res!689418) b!1031024))

(assert (= (and b!1031024 (not res!689420)) b!1031018))

(assert (= (and b!1031018 (not res!689422)) b!1031025))

(assert (= (and b!1031025 (not res!689417)) b!1031020))

(assert (= (and b!1031020 (not res!689416)) b!1031017))

(assert (= (and b!1031022 condMapEmpty!38004) mapIsEmpty!38004))

(assert (= (and b!1031022 (not condMapEmpty!38004)) mapNonEmpty!38004))

(assert (= (and mapNonEmpty!38004 ((_ is ValueCellFull!11480) mapValue!38004)) b!1031023))

(assert (= (and b!1031022 ((_ is ValueCellFull!11480) mapDefault!38004)) b!1031021))

(assert (= b!1031019 b!1031022))

(assert (= start!90038 b!1031019))

(declare-fun b_lambda!15969 () Bool)

(assert (=> (not b_lambda!15969) (not b!1031024)))

(declare-fun t!31023 () Bool)

(declare-fun tb!6957 () Bool)

(assert (=> (and b!1031019 (= (defaultEntry!6151 thiss!1427) (defaultEntry!6151 thiss!1427)) t!31023) tb!6957))

(declare-fun result!14251 () Bool)

(assert (=> tb!6957 (= result!14251 tp_is_empty!24367)))

(assert (=> b!1031024 t!31023))

(declare-fun b_and!33037 () Bool)

(assert (= b_and!33035 (and (=> t!31023 result!14251) b_and!33037)))

(declare-fun m!950533 () Bool)

(assert (=> b!1031026 m!950533))

(declare-fun m!950535 () Bool)

(assert (=> b!1031018 m!950535))

(declare-fun m!950537 () Bool)

(assert (=> mapNonEmpty!38004 m!950537))

(declare-fun m!950539 () Bool)

(assert (=> b!1031024 m!950539))

(declare-fun m!950541 () Bool)

(assert (=> b!1031024 m!950541))

(declare-fun m!950543 () Bool)

(assert (=> b!1031024 m!950543))

(assert (=> b!1031024 m!950541))

(declare-fun m!950545 () Bool)

(assert (=> b!1031024 m!950545))

(declare-fun m!950547 () Bool)

(assert (=> b!1031024 m!950547))

(declare-fun m!950549 () Bool)

(assert (=> b!1031024 m!950549))

(declare-fun m!950551 () Bool)

(assert (=> b!1031024 m!950551))

(declare-fun m!950553 () Bool)

(assert (=> b!1031024 m!950553))

(declare-fun m!950555 () Bool)

(assert (=> b!1031024 m!950555))

(declare-fun m!950557 () Bool)

(assert (=> b!1031024 m!950557))

(declare-fun m!950559 () Bool)

(assert (=> b!1031024 m!950559))

(declare-fun m!950561 () Bool)

(assert (=> b!1031024 m!950561))

(declare-fun m!950563 () Bool)

(assert (=> b!1031024 m!950563))

(declare-fun m!950565 () Bool)

(assert (=> b!1031024 m!950565))

(declare-fun m!950567 () Bool)

(assert (=> b!1031024 m!950567))

(assert (=> b!1031024 m!950549))

(declare-fun m!950569 () Bool)

(assert (=> b!1031024 m!950569))

(declare-fun m!950571 () Bool)

(assert (=> b!1031024 m!950571))

(declare-fun m!950573 () Bool)

(assert (=> b!1031024 m!950573))

(declare-fun m!950575 () Bool)

(assert (=> b!1031017 m!950575))

(declare-fun m!950577 () Bool)

(assert (=> b!1031020 m!950577))

(declare-fun m!950579 () Bool)

(assert (=> start!90038 m!950579))

(declare-fun m!950581 () Bool)

(assert (=> b!1031019 m!950581))

(declare-fun m!950583 () Bool)

(assert (=> b!1031019 m!950583))

(check-sat (not mapNonEmpty!38004) (not b!1031020) (not b!1031018) tp_is_empty!24367 (not b_next!20647) (not start!90038) (not b!1031026) (not b!1031019) (not b!1031024) (not b!1031017) (not b_lambda!15969) b_and!33037)
(check-sat b_and!33037 (not b_next!20647))
