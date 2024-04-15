; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89964 () Bool)

(assert start!89964)

(declare-fun b!1030106 () Bool)

(declare-fun b_free!20605 () Bool)

(declare-fun b_next!20605 () Bool)

(assert (=> b!1030106 (= b_free!20605 (not b_next!20605))))

(declare-fun tp!72883 () Bool)

(declare-fun b_and!32945 () Bool)

(assert (=> b!1030106 (= tp!72883 b_and!32945)))

(declare-fun b!1030103 () Bool)

(declare-fun e!581652 () Bool)

(declare-datatypes ((V!37307 0))(
  ( (V!37308 (val!12213 Int)) )
))
(declare-datatypes ((ValueCell!11459 0))(
  ( (ValueCellFull!11459 (v!14789 V!37307)) (EmptyCell!11459) )
))
(declare-datatypes ((Unit!33535 0))(
  ( (Unit!33536) )
))
(declare-datatypes ((array!64651 0))(
  ( (array!64652 (arr!31128 (Array (_ BitVec 32) (_ BitVec 64))) (size!31647 (_ BitVec 32))) )
))
(declare-datatypes ((array!64653 0))(
  ( (array!64654 (arr!31129 (Array (_ BitVec 32) ValueCell!11459)) (size!31648 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5512 0))(
  ( (LongMapFixedSize!5513 (defaultEntry!6128 Int) (mask!29897 (_ BitVec 32)) (extraKeys!5860 (_ BitVec 32)) (zeroValue!5964 V!37307) (minValue!5964 V!37307) (_size!2811 (_ BitVec 32)) (_keys!11295 array!64651) (_values!6151 array!64653) (_vacant!2811 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15660 0))(
  ( (tuple2!15661 (_1!7841 Unit!33535) (_2!7841 LongMapFixedSize!5512)) )
))
(declare-fun lt!454199 () tuple2!15660)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64651 (_ BitVec 32)) Bool)

(assert (=> b!1030103 (= e!581652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11295 (_2!7841 lt!454199)) (mask!29897 (_2!7841 lt!454199))))))

(declare-fun b!1030104 () Bool)

(declare-fun e!581656 () Bool)

(declare-fun tp_is_empty!24325 () Bool)

(assert (=> b!1030104 (= e!581656 tp_is_empty!24325)))

(declare-fun res!688903 () Bool)

(declare-fun e!581655 () Bool)

(assert (=> start!89964 (=> (not res!688903) (not e!581655))))

(declare-fun thiss!1427 () LongMapFixedSize!5512)

(declare-fun valid!2078 (LongMapFixedSize!5512) Bool)

(assert (=> start!89964 (= res!688903 (valid!2078 thiss!1427))))

(assert (=> start!89964 e!581655))

(declare-fun e!581651 () Bool)

(assert (=> start!89964 e!581651))

(assert (=> start!89964 true))

(declare-fun b!1030105 () Bool)

(declare-fun e!581654 () Bool)

(assert (=> b!1030105 (= e!581654 (not e!581652))))

(declare-fun res!688906 () Bool)

(assert (=> b!1030105 (=> res!688906 e!581652)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030105 (= res!688906 (not (validMask!0 (mask!29897 (_2!7841 lt!454199)))))))

(declare-fun lt!454194 () array!64651)

(declare-fun lt!454201 () array!64653)

(declare-fun Unit!33537 () Unit!33535)

(declare-fun Unit!33538 () Unit!33535)

(assert (=> b!1030105 (= lt!454199 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2811 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15661 Unit!33537 (LongMapFixedSize!5513 (defaultEntry!6128 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5860 thiss!1427) (zeroValue!5964 thiss!1427) (minValue!5964 thiss!1427) (bvsub (_size!2811 thiss!1427) #b00000000000000000000000000000001) lt!454194 lt!454201 (bvadd #b00000000000000000000000000000001 (_vacant!2811 thiss!1427)))) (tuple2!15661 Unit!33538 (LongMapFixedSize!5513 (defaultEntry!6128 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5860 thiss!1427) (zeroValue!5964 thiss!1427) (minValue!5964 thiss!1427) (bvsub (_size!2811 thiss!1427) #b00000000000000000000000000000001) lt!454194 lt!454201 (_vacant!2811 thiss!1427)))))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15662 0))(
  ( (tuple2!15663 (_1!7842 (_ BitVec 64)) (_2!7842 V!37307)) )
))
(declare-datatypes ((List!21864 0))(
  ( (Nil!21861) (Cons!21860 (h!23062 tuple2!15662) (t!30955 List!21864)) )
))
(declare-datatypes ((ListLongMap!13765 0))(
  ( (ListLongMap!13766 (toList!6898 List!21864)) )
))
(declare-fun -!490 (ListLongMap!13765 (_ BitVec 64)) ListLongMap!13765)

(declare-fun getCurrentListMap!3865 (array!64651 array!64653 (_ BitVec 32) (_ BitVec 32) V!37307 V!37307 (_ BitVec 32) Int) ListLongMap!13765)

(assert (=> b!1030105 (= (-!490 (getCurrentListMap!3865 (_keys!11295 thiss!1427) (_values!6151 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5860 thiss!1427) (zeroValue!5964 thiss!1427) (minValue!5964 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6128 thiss!1427)) key!909) (getCurrentListMap!3865 lt!454194 lt!454201 (mask!29897 thiss!1427) (extraKeys!5860 thiss!1427) (zeroValue!5964 thiss!1427) (minValue!5964 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6128 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9676 0))(
  ( (MissingZero!9676 (index!41075 (_ BitVec 32))) (Found!9676 (index!41076 (_ BitVec 32))) (Intermediate!9676 (undefined!10488 Bool) (index!41077 (_ BitVec 32)) (x!91665 (_ BitVec 32))) (Undefined!9676) (MissingVacant!9676 (index!41078 (_ BitVec 32))) )
))
(declare-fun lt!454197 () SeekEntryResult!9676)

(declare-fun dynLambda!1952 (Int (_ BitVec 64)) V!37307)

(assert (=> b!1030105 (= lt!454201 (array!64654 (store (arr!31129 (_values!6151 thiss!1427)) (index!41076 lt!454197) (ValueCellFull!11459 (dynLambda!1952 (defaultEntry!6128 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31648 (_values!6151 thiss!1427))))))

(declare-fun lt!454200 () Unit!33535)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!15 (array!64651 array!64653 (_ BitVec 32) (_ BitVec 32) V!37307 V!37307 (_ BitVec 32) (_ BitVec 64) Int) Unit!33535)

(assert (=> b!1030105 (= lt!454200 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!15 (_keys!11295 thiss!1427) (_values!6151 thiss!1427) (mask!29897 thiss!1427) (extraKeys!5860 thiss!1427) (zeroValue!5964 thiss!1427) (minValue!5964 thiss!1427) (index!41076 lt!454197) key!909 (defaultEntry!6128 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030105 (not (arrayContainsKey!0 lt!454194 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454195 () Unit!33535)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64651 (_ BitVec 32) (_ BitVec 64)) Unit!33535)

(assert (=> b!1030105 (= lt!454195 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11295 thiss!1427) (index!41076 lt!454197) key!909))))

(assert (=> b!1030105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454194 (mask!29897 thiss!1427))))

(declare-fun lt!454196 () Unit!33535)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64651 (_ BitVec 32) (_ BitVec 32)) Unit!33535)

(assert (=> b!1030105 (= lt!454196 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11295 thiss!1427) (index!41076 lt!454197) (mask!29897 thiss!1427)))))

(declare-datatypes ((List!21865 0))(
  ( (Nil!21862) (Cons!21861 (h!23063 (_ BitVec 64)) (t!30956 List!21865)) )
))
(declare-fun arrayNoDuplicates!0 (array!64651 (_ BitVec 32) List!21865) Bool)

(assert (=> b!1030105 (arrayNoDuplicates!0 lt!454194 #b00000000000000000000000000000000 Nil!21862)))

(declare-fun lt!454193 () Unit!33535)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64651 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21865) Unit!33535)

(assert (=> b!1030105 (= lt!454193 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11295 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41076 lt!454197) #b00000000000000000000000000000000 Nil!21862))))

(declare-fun arrayCountValidKeys!0 (array!64651 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030105 (= (arrayCountValidKeys!0 lt!454194 #b00000000000000000000000000000000 (size!31647 (_keys!11295 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11295 thiss!1427) #b00000000000000000000000000000000 (size!31647 (_keys!11295 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030105 (= lt!454194 (array!64652 (store (arr!31128 (_keys!11295 thiss!1427)) (index!41076 lt!454197) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31647 (_keys!11295 thiss!1427))))))

(declare-fun lt!454198 () Unit!33535)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64651 (_ BitVec 32) (_ BitVec 64)) Unit!33535)

(assert (=> b!1030105 (= lt!454198 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11295 thiss!1427) (index!41076 lt!454197) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581650 () Bool)

(declare-fun array_inv!24097 (array!64651) Bool)

(declare-fun array_inv!24098 (array!64653) Bool)

(assert (=> b!1030106 (= e!581651 (and tp!72883 tp_is_empty!24325 (array_inv!24097 (_keys!11295 thiss!1427)) (array_inv!24098 (_values!6151 thiss!1427)) e!581650))))

(declare-fun b!1030107 () Bool)

(declare-fun res!688907 () Bool)

(assert (=> b!1030107 (=> (not res!688907) (not e!581655))))

(assert (=> b!1030107 (= res!688907 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37938 () Bool)

(declare-fun mapRes!37938 () Bool)

(assert (=> mapIsEmpty!37938 mapRes!37938))

(declare-fun b!1030108 () Bool)

(declare-fun e!581649 () Bool)

(assert (=> b!1030108 (= e!581649 tp_is_empty!24325)))

(declare-fun b!1030109 () Bool)

(assert (=> b!1030109 (= e!581655 e!581654)))

(declare-fun res!688904 () Bool)

(assert (=> b!1030109 (=> (not res!688904) (not e!581654))))

(get-info :version)

(assert (=> b!1030109 (= res!688904 ((_ is Found!9676) lt!454197))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64651 (_ BitVec 32)) SeekEntryResult!9676)

(assert (=> b!1030109 (= lt!454197 (seekEntry!0 key!909 (_keys!11295 thiss!1427) (mask!29897 thiss!1427)))))

(declare-fun mapNonEmpty!37938 () Bool)

(declare-fun tp!72882 () Bool)

(assert (=> mapNonEmpty!37938 (= mapRes!37938 (and tp!72882 e!581656))))

(declare-fun mapValue!37938 () ValueCell!11459)

(declare-fun mapKey!37938 () (_ BitVec 32))

(declare-fun mapRest!37938 () (Array (_ BitVec 32) ValueCell!11459))

(assert (=> mapNonEmpty!37938 (= (arr!31129 (_values!6151 thiss!1427)) (store mapRest!37938 mapKey!37938 mapValue!37938))))

(declare-fun b!1030110 () Bool)

(declare-fun res!688905 () Bool)

(assert (=> b!1030110 (=> res!688905 e!581652)))

(assert (=> b!1030110 (= res!688905 (or (not (= (size!31648 (_values!6151 (_2!7841 lt!454199))) (bvadd #b00000000000000000000000000000001 (mask!29897 (_2!7841 lt!454199))))) (not (= (size!31647 (_keys!11295 (_2!7841 lt!454199))) (size!31648 (_values!6151 (_2!7841 lt!454199))))) (bvslt (mask!29897 (_2!7841 lt!454199)) #b00000000000000000000000000000000) (bvslt (extraKeys!5860 (_2!7841 lt!454199)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5860 (_2!7841 lt!454199)) #b00000000000000000000000000000011)))))

(declare-fun b!1030111 () Bool)

(assert (=> b!1030111 (= e!581650 (and e!581649 mapRes!37938))))

(declare-fun condMapEmpty!37938 () Bool)

(declare-fun mapDefault!37938 () ValueCell!11459)

(assert (=> b!1030111 (= condMapEmpty!37938 (= (arr!31129 (_values!6151 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11459)) mapDefault!37938)))))

(assert (= (and start!89964 res!688903) b!1030107))

(assert (= (and b!1030107 res!688907) b!1030109))

(assert (= (and b!1030109 res!688904) b!1030105))

(assert (= (and b!1030105 (not res!688906)) b!1030110))

(assert (= (and b!1030110 (not res!688905)) b!1030103))

(assert (= (and b!1030111 condMapEmpty!37938) mapIsEmpty!37938))

(assert (= (and b!1030111 (not condMapEmpty!37938)) mapNonEmpty!37938))

(assert (= (and mapNonEmpty!37938 ((_ is ValueCellFull!11459) mapValue!37938)) b!1030104))

(assert (= (and b!1030111 ((_ is ValueCellFull!11459) mapDefault!37938)) b!1030108))

(assert (= b!1030106 b!1030111))

(assert (= start!89964 b!1030106))

(declare-fun b_lambda!15913 () Bool)

(assert (=> (not b_lambda!15913) (not b!1030105)))

(declare-fun t!30954 () Bool)

(declare-fun tb!6915 () Bool)

(assert (=> (and b!1030106 (= (defaultEntry!6128 thiss!1427) (defaultEntry!6128 thiss!1427)) t!30954) tb!6915))

(declare-fun result!14165 () Bool)

(assert (=> tb!6915 (= result!14165 tp_is_empty!24325)))

(assert (=> b!1030105 t!30954))

(declare-fun b_and!32947 () Bool)

(assert (= b_and!32945 (and (=> t!30954 result!14165) b_and!32947)))

(declare-fun m!949287 () Bool)

(assert (=> b!1030103 m!949287))

(declare-fun m!949289 () Bool)

(assert (=> mapNonEmpty!37938 m!949289))

(declare-fun m!949291 () Bool)

(assert (=> start!89964 m!949291))

(declare-fun m!949293 () Bool)

(assert (=> b!1030106 m!949293))

(declare-fun m!949295 () Bool)

(assert (=> b!1030106 m!949295))

(declare-fun m!949297 () Bool)

(assert (=> b!1030105 m!949297))

(declare-fun m!949299 () Bool)

(assert (=> b!1030105 m!949299))

(declare-fun m!949301 () Bool)

(assert (=> b!1030105 m!949301))

(declare-fun m!949303 () Bool)

(assert (=> b!1030105 m!949303))

(declare-fun m!949305 () Bool)

(assert (=> b!1030105 m!949305))

(declare-fun m!949307 () Bool)

(assert (=> b!1030105 m!949307))

(declare-fun m!949309 () Bool)

(assert (=> b!1030105 m!949309))

(declare-fun m!949311 () Bool)

(assert (=> b!1030105 m!949311))

(declare-fun m!949313 () Bool)

(assert (=> b!1030105 m!949313))

(declare-fun m!949315 () Bool)

(assert (=> b!1030105 m!949315))

(declare-fun m!949317 () Bool)

(assert (=> b!1030105 m!949317))

(declare-fun m!949319 () Bool)

(assert (=> b!1030105 m!949319))

(declare-fun m!949321 () Bool)

(assert (=> b!1030105 m!949321))

(declare-fun m!949323 () Bool)

(assert (=> b!1030105 m!949323))

(declare-fun m!949325 () Bool)

(assert (=> b!1030105 m!949325))

(assert (=> b!1030105 m!949323))

(declare-fun m!949327 () Bool)

(assert (=> b!1030105 m!949327))

(declare-fun m!949329 () Bool)

(assert (=> b!1030105 m!949329))

(declare-fun m!949331 () Bool)

(assert (=> b!1030109 m!949331))

(check-sat (not b!1030105) (not start!89964) (not mapNonEmpty!37938) tp_is_empty!24325 b_and!32947 (not b!1030103) (not b_next!20605) (not b_lambda!15913) (not b!1030106) (not b!1030109))
(check-sat b_and!32947 (not b_next!20605))
