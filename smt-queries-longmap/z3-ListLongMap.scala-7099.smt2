; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90274 () Bool)

(assert start!90274)

(declare-fun b!1032487 () Bool)

(declare-fun b_free!20647 () Bool)

(declare-fun b_next!20647 () Bool)

(assert (=> b!1032487 (= b_free!20647 (not b_next!20647))))

(declare-fun tp!73012 () Bool)

(declare-fun b_and!33071 () Bool)

(assert (=> b!1032487 (= tp!73012 b_and!33071)))

(declare-fun b!1032482 () Bool)

(declare-fun res!689996 () Bool)

(declare-fun e!583224 () Bool)

(assert (=> b!1032482 (=> res!689996 e!583224)))

(declare-datatypes ((V!37363 0))(
  ( (V!37364 (val!12234 Int)) )
))
(declare-datatypes ((ValueCell!11480 0))(
  ( (ValueCellFull!11480 (v!14807 V!37363)) (EmptyCell!11480) )
))
(declare-datatypes ((Unit!33716 0))(
  ( (Unit!33717) )
))
(declare-datatypes ((array!64847 0))(
  ( (array!64848 (arr!31219 (Array (_ BitVec 32) (_ BitVec 64))) (size!31737 (_ BitVec 32))) )
))
(declare-datatypes ((array!64849 0))(
  ( (array!64850 (arr!31220 (Array (_ BitVec 32) ValueCell!11480)) (size!31738 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5554 0))(
  ( (LongMapFixedSize!5555 (defaultEntry!6151 Int) (mask!30003 (_ BitVec 32)) (extraKeys!5883 (_ BitVec 32)) (zeroValue!5987 V!37363) (minValue!5987 V!37363) (_size!2832 (_ BitVec 32)) (_keys!11362 array!64847) (_values!6174 array!64849) (_vacant!2832 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15640 0))(
  ( (tuple2!15641 (_1!7831 Unit!33716) (_2!7831 LongMapFixedSize!5554)) )
))
(declare-fun lt!455655 () tuple2!15640)

(assert (=> b!1032482 (= res!689996 (or (not (= (size!31738 (_values!6174 (_2!7831 lt!455655))) (bvadd #b00000000000000000000000000000001 (mask!30003 (_2!7831 lt!455655))))) (not (= (size!31737 (_keys!11362 (_2!7831 lt!455655))) (size!31738 (_values!6174 (_2!7831 lt!455655))))) (bvslt (mask!30003 (_2!7831 lt!455655)) #b00000000000000000000000000000000) (bvslt (extraKeys!5883 (_2!7831 lt!455655)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5883 (_2!7831 lt!455655)) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!38004 () Bool)

(declare-fun mapRes!38004 () Bool)

(assert (=> mapIsEmpty!38004 mapRes!38004))

(declare-fun b!1032483 () Bool)

(declare-fun e!583218 () Bool)

(declare-fun tp_is_empty!24367 () Bool)

(assert (=> b!1032483 (= e!583218 tp_is_empty!24367)))

(declare-fun b!1032484 () Bool)

(assert (=> b!1032484 (= e!583224 true)))

(declare-fun lt!455651 () Bool)

(declare-datatypes ((List!21844 0))(
  ( (Nil!21841) (Cons!21840 (h!23051 (_ BitVec 64)) (t!30978 List!21844)) )
))
(declare-fun arrayNoDuplicates!0 (array!64847 (_ BitVec 32) List!21844) Bool)

(assert (=> b!1032484 (= lt!455651 (arrayNoDuplicates!0 (_keys!11362 (_2!7831 lt!455655)) #b00000000000000000000000000000000 Nil!21841))))

(declare-fun b!1032485 () Bool)

(declare-fun res!689994 () Bool)

(assert (=> b!1032485 (=> res!689994 e!583224)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64847 (_ BitVec 32)) Bool)

(assert (=> b!1032485 (= res!689994 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11362 (_2!7831 lt!455655)) (mask!30003 (_2!7831 lt!455655)))))))

(declare-fun mapNonEmpty!38004 () Bool)

(declare-fun tp!73011 () Bool)

(assert (=> mapNonEmpty!38004 (= mapRes!38004 (and tp!73011 e!583218))))

(declare-fun mapValue!38004 () ValueCell!11480)

(declare-fun thiss!1427 () LongMapFixedSize!5554)

(declare-fun mapKey!38004 () (_ BitVec 32))

(declare-fun mapRest!38004 () (Array (_ BitVec 32) ValueCell!11480))

(assert (=> mapNonEmpty!38004 (= (arr!31220 (_values!6174 thiss!1427)) (store mapRest!38004 mapKey!38004 mapValue!38004))))

(declare-fun e!583222 () Bool)

(declare-fun e!583219 () Bool)

(declare-fun array_inv!24171 (array!64847) Bool)

(declare-fun array_inv!24172 (array!64849) Bool)

(assert (=> b!1032487 (= e!583222 (and tp!73012 tp_is_empty!24367 (array_inv!24171 (_keys!11362 thiss!1427)) (array_inv!24172 (_values!6174 thiss!1427)) e!583219))))

(declare-fun b!1032488 () Bool)

(declare-fun e!583221 () Bool)

(assert (=> b!1032488 (= e!583221 tp_is_empty!24367)))

(declare-fun b!1032489 () Bool)

(declare-fun e!583220 () Bool)

(assert (=> b!1032489 (= e!583220 (not e!583224))))

(declare-fun res!689999 () Bool)

(assert (=> b!1032489 (=> res!689999 e!583224)))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15642 0))(
  ( (tuple2!15643 (_1!7832 (_ BitVec 64)) (_2!7832 V!37363)) )
))
(declare-datatypes ((List!21845 0))(
  ( (Nil!21842) (Cons!21841 (h!23052 tuple2!15642) (t!30979 List!21845)) )
))
(declare-datatypes ((ListLongMap!13725 0))(
  ( (ListLongMap!13726 (toList!6878 List!21845)) )
))
(declare-fun contains!6013 (ListLongMap!13725 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3924 (array!64847 array!64849 (_ BitVec 32) (_ BitVec 32) V!37363 V!37363 (_ BitVec 32) Int) ListLongMap!13725)

(assert (=> b!1032489 (= res!689999 (not (contains!6013 (getCurrentListMap!3924 (_keys!11362 (_2!7831 lt!455655)) (_values!6174 (_2!7831 lt!455655)) (mask!30003 (_2!7831 lt!455655)) (extraKeys!5883 (_2!7831 lt!455655)) (zeroValue!5987 (_2!7831 lt!455655)) (minValue!5987 (_2!7831 lt!455655)) #b00000000000000000000000000000000 (defaultEntry!6151 (_2!7831 lt!455655))) key!909)))))

(declare-fun lt!455652 () array!64849)

(declare-fun lt!455650 () array!64847)

(declare-fun Unit!33718 () Unit!33716)

(declare-fun Unit!33719 () Unit!33716)

(assert (=> b!1032489 (= lt!455655 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2832 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15641 Unit!33718 (LongMapFixedSize!5555 (defaultEntry!6151 thiss!1427) (mask!30003 thiss!1427) (extraKeys!5883 thiss!1427) (zeroValue!5987 thiss!1427) (minValue!5987 thiss!1427) (bvsub (_size!2832 thiss!1427) #b00000000000000000000000000000001) lt!455650 lt!455652 (bvadd #b00000000000000000000000000000001 (_vacant!2832 thiss!1427)))) (tuple2!15641 Unit!33719 (LongMapFixedSize!5555 (defaultEntry!6151 thiss!1427) (mask!30003 thiss!1427) (extraKeys!5883 thiss!1427) (zeroValue!5987 thiss!1427) (minValue!5987 thiss!1427) (bvsub (_size!2832 thiss!1427) #b00000000000000000000000000000001) lt!455650 lt!455652 (_vacant!2832 thiss!1427)))))))

(declare-fun -!501 (ListLongMap!13725 (_ BitVec 64)) ListLongMap!13725)

(assert (=> b!1032489 (= (-!501 (getCurrentListMap!3924 (_keys!11362 thiss!1427) (_values!6174 thiss!1427) (mask!30003 thiss!1427) (extraKeys!5883 thiss!1427) (zeroValue!5987 thiss!1427) (minValue!5987 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6151 thiss!1427)) key!909) (getCurrentListMap!3924 lt!455650 lt!455652 (mask!30003 thiss!1427) (extraKeys!5883 thiss!1427) (zeroValue!5987 thiss!1427) (minValue!5987 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6151 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9656 0))(
  ( (MissingZero!9656 (index!40995 (_ BitVec 32))) (Found!9656 (index!40996 (_ BitVec 32))) (Intermediate!9656 (undefined!10468 Bool) (index!40997 (_ BitVec 32)) (x!91786 (_ BitVec 32))) (Undefined!9656) (MissingVacant!9656 (index!40998 (_ BitVec 32))) )
))
(declare-fun lt!455653 () SeekEntryResult!9656)

(declare-fun dynLambda!1995 (Int (_ BitVec 64)) V!37363)

(assert (=> b!1032489 (= lt!455652 (array!64850 (store (arr!31220 (_values!6174 thiss!1427)) (index!40996 lt!455653) (ValueCellFull!11480 (dynLambda!1995 (defaultEntry!6151 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31738 (_values!6174 thiss!1427))))))

(declare-fun lt!455647 () Unit!33716)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!27 (array!64847 array!64849 (_ BitVec 32) (_ BitVec 32) V!37363 V!37363 (_ BitVec 32) (_ BitVec 64) Int) Unit!33716)

(assert (=> b!1032489 (= lt!455647 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!27 (_keys!11362 thiss!1427) (_values!6174 thiss!1427) (mask!30003 thiss!1427) (extraKeys!5883 thiss!1427) (zeroValue!5987 thiss!1427) (minValue!5987 thiss!1427) (index!40996 lt!455653) key!909 (defaultEntry!6151 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032489 (not (arrayContainsKey!0 lt!455650 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455649 () Unit!33716)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64847 (_ BitVec 32) (_ BitVec 64)) Unit!33716)

(assert (=> b!1032489 (= lt!455649 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11362 thiss!1427) (index!40996 lt!455653) key!909))))

(assert (=> b!1032489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455650 (mask!30003 thiss!1427))))

(declare-fun lt!455648 () Unit!33716)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64847 (_ BitVec 32) (_ BitVec 32)) Unit!33716)

(assert (=> b!1032489 (= lt!455648 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11362 thiss!1427) (index!40996 lt!455653) (mask!30003 thiss!1427)))))

(assert (=> b!1032489 (arrayNoDuplicates!0 lt!455650 #b00000000000000000000000000000000 Nil!21841)))

(declare-fun lt!455654 () Unit!33716)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64847 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21844) Unit!33716)

(assert (=> b!1032489 (= lt!455654 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11362 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40996 lt!455653) #b00000000000000000000000000000000 Nil!21841))))

(declare-fun arrayCountValidKeys!0 (array!64847 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032489 (= (arrayCountValidKeys!0 lt!455650 #b00000000000000000000000000000000 (size!31737 (_keys!11362 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11362 thiss!1427) #b00000000000000000000000000000000 (size!31737 (_keys!11362 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1032489 (= lt!455650 (array!64848 (store (arr!31219 (_keys!11362 thiss!1427)) (index!40996 lt!455653) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31737 (_keys!11362 thiss!1427))))))

(declare-fun lt!455656 () Unit!33716)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64847 (_ BitVec 32) (_ BitVec 64)) Unit!33716)

(assert (=> b!1032489 (= lt!455656 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11362 thiss!1427) (index!40996 lt!455653) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1032490 () Bool)

(declare-fun res!689998 () Bool)

(declare-fun e!583217 () Bool)

(assert (=> b!1032490 (=> (not res!689998) (not e!583217))))

(assert (=> b!1032490 (= res!689998 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1032491 () Bool)

(assert (=> b!1032491 (= e!583217 e!583220)))

(declare-fun res!689995 () Bool)

(assert (=> b!1032491 (=> (not res!689995) (not e!583220))))

(get-info :version)

(assert (=> b!1032491 (= res!689995 ((_ is Found!9656) lt!455653))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64847 (_ BitVec 32)) SeekEntryResult!9656)

(assert (=> b!1032491 (= lt!455653 (seekEntry!0 key!909 (_keys!11362 thiss!1427) (mask!30003 thiss!1427)))))

(declare-fun b!1032492 () Bool)

(assert (=> b!1032492 (= e!583219 (and e!583221 mapRes!38004))))

(declare-fun condMapEmpty!38004 () Bool)

(declare-fun mapDefault!38004 () ValueCell!11480)

(assert (=> b!1032492 (= condMapEmpty!38004 (= (arr!31220 (_values!6174 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11480)) mapDefault!38004)))))

(declare-fun b!1032486 () Bool)

(declare-fun res!689993 () Bool)

(assert (=> b!1032486 (=> res!689993 e!583224)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032486 (= res!689993 (not (validMask!0 (mask!30003 (_2!7831 lt!455655)))))))

(declare-fun res!689997 () Bool)

(assert (=> start!90274 (=> (not res!689997) (not e!583217))))

(declare-fun valid!2107 (LongMapFixedSize!5554) Bool)

(assert (=> start!90274 (= res!689997 (valid!2107 thiss!1427))))

(assert (=> start!90274 e!583217))

(assert (=> start!90274 e!583222))

(assert (=> start!90274 true))

(assert (= (and start!90274 res!689997) b!1032490))

(assert (= (and b!1032490 res!689998) b!1032491))

(assert (= (and b!1032491 res!689995) b!1032489))

(assert (= (and b!1032489 (not res!689999)) b!1032486))

(assert (= (and b!1032486 (not res!689993)) b!1032482))

(assert (= (and b!1032482 (not res!689996)) b!1032485))

(assert (= (and b!1032485 (not res!689994)) b!1032484))

(assert (= (and b!1032492 condMapEmpty!38004) mapIsEmpty!38004))

(assert (= (and b!1032492 (not condMapEmpty!38004)) mapNonEmpty!38004))

(assert (= (and mapNonEmpty!38004 ((_ is ValueCellFull!11480) mapValue!38004)) b!1032483))

(assert (= (and b!1032492 ((_ is ValueCellFull!11480) mapDefault!38004)) b!1032488))

(assert (= b!1032487 b!1032492))

(assert (= start!90274 b!1032487))

(declare-fun b_lambda!16001 () Bool)

(assert (=> (not b_lambda!16001) (not b!1032489)))

(declare-fun t!30977 () Bool)

(declare-fun tb!6957 () Bool)

(assert (=> (and b!1032487 (= (defaultEntry!6151 thiss!1427) (defaultEntry!6151 thiss!1427)) t!30977) tb!6957))

(declare-fun result!14251 () Bool)

(assert (=> tb!6957 (= result!14251 tp_is_empty!24367)))

(assert (=> b!1032489 t!30977))

(declare-fun b_and!33073 () Bool)

(assert (= b_and!33071 (and (=> t!30977 result!14251) b_and!33073)))

(declare-fun m!952817 () Bool)

(assert (=> b!1032485 m!952817))

(declare-fun m!952819 () Bool)

(assert (=> b!1032486 m!952819))

(declare-fun m!952821 () Bool)

(assert (=> start!90274 m!952821))

(declare-fun m!952823 () Bool)

(assert (=> b!1032489 m!952823))

(declare-fun m!952825 () Bool)

(assert (=> b!1032489 m!952825))

(declare-fun m!952827 () Bool)

(assert (=> b!1032489 m!952827))

(declare-fun m!952829 () Bool)

(assert (=> b!1032489 m!952829))

(declare-fun m!952831 () Bool)

(assert (=> b!1032489 m!952831))

(declare-fun m!952833 () Bool)

(assert (=> b!1032489 m!952833))

(declare-fun m!952835 () Bool)

(assert (=> b!1032489 m!952835))

(declare-fun m!952837 () Bool)

(assert (=> b!1032489 m!952837))

(declare-fun m!952839 () Bool)

(assert (=> b!1032489 m!952839))

(declare-fun m!952841 () Bool)

(assert (=> b!1032489 m!952841))

(assert (=> b!1032489 m!952839))

(declare-fun m!952843 () Bool)

(assert (=> b!1032489 m!952843))

(declare-fun m!952845 () Bool)

(assert (=> b!1032489 m!952845))

(declare-fun m!952847 () Bool)

(assert (=> b!1032489 m!952847))

(declare-fun m!952849 () Bool)

(assert (=> b!1032489 m!952849))

(declare-fun m!952851 () Bool)

(assert (=> b!1032489 m!952851))

(declare-fun m!952853 () Bool)

(assert (=> b!1032489 m!952853))

(declare-fun m!952855 () Bool)

(assert (=> b!1032489 m!952855))

(assert (=> b!1032489 m!952833))

(declare-fun m!952857 () Bool)

(assert (=> b!1032489 m!952857))

(declare-fun m!952859 () Bool)

(assert (=> b!1032491 m!952859))

(declare-fun m!952861 () Bool)

(assert (=> b!1032487 m!952861))

(declare-fun m!952863 () Bool)

(assert (=> b!1032487 m!952863))

(declare-fun m!952865 () Bool)

(assert (=> b!1032484 m!952865))

(declare-fun m!952867 () Bool)

(assert (=> mapNonEmpty!38004 m!952867))

(check-sat (not b!1032485) (not b!1032484) b_and!33073 (not b_lambda!16001) (not start!90274) (not b_next!20647) tp_is_empty!24367 (not b!1032486) (not mapNonEmpty!38004) (not b!1032491) (not b!1032489) (not b!1032487))
(check-sat b_and!33073 (not b_next!20647))
