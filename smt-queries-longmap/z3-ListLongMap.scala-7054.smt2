; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89376 () Bool)

(assert start!89376)

(declare-fun b!1024446 () Bool)

(declare-fun b_free!20377 () Bool)

(declare-fun b_next!20377 () Bool)

(assert (=> b!1024446 (= b_free!20377 (not b_next!20377))))

(declare-fun tp!72177 () Bool)

(declare-fun b_and!32597 () Bool)

(assert (=> b!1024446 (= tp!72177 b_and!32597)))

(declare-fun mapIsEmpty!37574 () Bool)

(declare-fun mapRes!37574 () Bool)

(assert (=> mapIsEmpty!37574 mapRes!37574))

(declare-fun b!1024443 () Bool)

(declare-fun e!577490 () Bool)

(declare-fun e!577487 () Bool)

(assert (=> b!1024443 (= e!577490 (and e!577487 mapRes!37574))))

(declare-fun condMapEmpty!37574 () Bool)

(declare-datatypes ((V!37003 0))(
  ( (V!37004 (val!12099 Int)) )
))
(declare-datatypes ((ValueCell!11345 0))(
  ( (ValueCellFull!11345 (v!14667 V!37003)) (EmptyCell!11345) )
))
(declare-datatypes ((array!64183 0))(
  ( (array!64184 (arr!30900 (Array (_ BitVec 32) (_ BitVec 64))) (size!31415 (_ BitVec 32))) )
))
(declare-datatypes ((array!64185 0))(
  ( (array!64186 (arr!30901 (Array (_ BitVec 32) ValueCell!11345)) (size!31416 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5284 0))(
  ( (LongMapFixedSize!5285 (defaultEntry!5994 Int) (mask!29643 (_ BitVec 32)) (extraKeys!5726 (_ BitVec 32)) (zeroValue!5830 V!37003) (minValue!5830 V!37003) (_size!2697 (_ BitVec 32)) (_keys!11137 array!64183) (_values!6017 array!64185) (_vacant!2697 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5284)

(declare-fun mapDefault!37574 () ValueCell!11345)

(assert (=> b!1024443 (= condMapEmpty!37574 (= (arr!30901 (_values!6017 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11345)) mapDefault!37574)))))

(declare-fun mapNonEmpty!37574 () Bool)

(declare-fun tp!72176 () Bool)

(declare-fun e!577491 () Bool)

(assert (=> mapNonEmpty!37574 (= mapRes!37574 (and tp!72176 e!577491))))

(declare-fun mapRest!37574 () (Array (_ BitVec 32) ValueCell!11345))

(declare-fun mapKey!37574 () (_ BitVec 32))

(declare-fun mapValue!37574 () ValueCell!11345)

(assert (=> mapNonEmpty!37574 (= (arr!30901 (_values!6017 thiss!1427)) (store mapRest!37574 mapKey!37574 mapValue!37574))))

(declare-fun b!1024444 () Bool)

(declare-fun res!685929 () Bool)

(declare-fun e!577484 () Bool)

(assert (=> b!1024444 (=> res!685929 e!577484)))

(declare-datatypes ((List!21766 0))(
  ( (Nil!21763) (Cons!21762 (h!22960 (_ BitVec 64)) (t!30819 List!21766)) )
))
(declare-fun noDuplicate!1473 (List!21766) Bool)

(assert (=> b!1024444 (= res!685929 (not (noDuplicate!1473 Nil!21763)))))

(declare-fun b!1024445 () Bool)

(declare-fun res!685930 () Bool)

(declare-fun e!577485 () Bool)

(assert (=> b!1024445 (=> (not res!685930) (not e!577485))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024445 (= res!685930 (not (= key!909 (bvneg key!909))))))

(declare-fun e!577486 () Bool)

(declare-fun tp_is_empty!24097 () Bool)

(declare-fun array_inv!23945 (array!64183) Bool)

(declare-fun array_inv!23946 (array!64185) Bool)

(assert (=> b!1024446 (= e!577486 (and tp!72177 tp_is_empty!24097 (array_inv!23945 (_keys!11137 thiss!1427)) (array_inv!23946 (_values!6017 thiss!1427)) e!577490))))

(declare-fun b!1024447 () Bool)

(declare-fun res!685932 () Bool)

(assert (=> b!1024447 (=> res!685932 e!577484)))

(declare-fun contains!5927 (List!21766 (_ BitVec 64)) Bool)

(assert (=> b!1024447 (= res!685932 (contains!5927 Nil!21763 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024448 () Bool)

(assert (=> b!1024448 (= e!577484 true)))

(declare-fun lt!450459 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64183 (_ BitVec 32) List!21766) Bool)

(assert (=> b!1024448 (= lt!450459 (arrayNoDuplicates!0 (_keys!11137 thiss!1427) #b00000000000000000000000000000000 Nil!21763))))

(declare-fun b!1024449 () Bool)

(declare-fun e!577489 () Bool)

(assert (=> b!1024449 (= e!577485 e!577489)))

(declare-fun res!685933 () Bool)

(assert (=> b!1024449 (=> (not res!685933) (not e!577489))))

(declare-datatypes ((SeekEntryResult!9592 0))(
  ( (MissingZero!9592 (index!40739 (_ BitVec 32))) (Found!9592 (index!40740 (_ BitVec 32))) (Intermediate!9592 (undefined!10404 Bool) (index!40741 (_ BitVec 32)) (x!91091 (_ BitVec 32))) (Undefined!9592) (MissingVacant!9592 (index!40742 (_ BitVec 32))) )
))
(declare-fun lt!450460 () SeekEntryResult!9592)

(get-info :version)

(assert (=> b!1024449 (= res!685933 ((_ is Found!9592) lt!450460))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64183 (_ BitVec 32)) SeekEntryResult!9592)

(assert (=> b!1024449 (= lt!450460 (seekEntry!0 key!909 (_keys!11137 thiss!1427) (mask!29643 thiss!1427)))))

(declare-fun b!1024450 () Bool)

(declare-fun res!685931 () Bool)

(assert (=> b!1024450 (=> res!685931 e!577484)))

(assert (=> b!1024450 (= res!685931 (contains!5927 Nil!21763 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024452 () Bool)

(assert (=> b!1024452 (= e!577489 (not e!577484))))

(declare-fun res!685928 () Bool)

(assert (=> b!1024452 (=> res!685928 e!577484)))

(assert (=> b!1024452 (= res!685928 (or (bvsge (size!31415 (_keys!11137 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31415 (_keys!11137 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64183 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024452 (= (arrayCountValidKeys!0 (array!64184 (store (arr!30900 (_keys!11137 thiss!1427)) (index!40740 lt!450460) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31415 (_keys!11137 thiss!1427))) #b00000000000000000000000000000000 (size!31415 (_keys!11137 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11137 thiss!1427) #b00000000000000000000000000000000 (size!31415 (_keys!11137 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33257 0))(
  ( (Unit!33258) )
))
(declare-fun lt!450458 () Unit!33257)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64183 (_ BitVec 32) (_ BitVec 64)) Unit!33257)

(assert (=> b!1024452 (= lt!450458 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11137 thiss!1427) (index!40740 lt!450460) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024453 () Bool)

(assert (=> b!1024453 (= e!577491 tp_is_empty!24097)))

(declare-fun res!685927 () Bool)

(assert (=> start!89376 (=> (not res!685927) (not e!577485))))

(declare-fun valid!2004 (LongMapFixedSize!5284) Bool)

(assert (=> start!89376 (= res!685927 (valid!2004 thiss!1427))))

(assert (=> start!89376 e!577485))

(assert (=> start!89376 e!577486))

(assert (=> start!89376 true))

(declare-fun b!1024451 () Bool)

(assert (=> b!1024451 (= e!577487 tp_is_empty!24097)))

(assert (= (and start!89376 res!685927) b!1024445))

(assert (= (and b!1024445 res!685930) b!1024449))

(assert (= (and b!1024449 res!685933) b!1024452))

(assert (= (and b!1024452 (not res!685928)) b!1024444))

(assert (= (and b!1024444 (not res!685929)) b!1024447))

(assert (= (and b!1024447 (not res!685932)) b!1024450))

(assert (= (and b!1024450 (not res!685931)) b!1024448))

(assert (= (and b!1024443 condMapEmpty!37574) mapIsEmpty!37574))

(assert (= (and b!1024443 (not condMapEmpty!37574)) mapNonEmpty!37574))

(assert (= (and mapNonEmpty!37574 ((_ is ValueCellFull!11345) mapValue!37574)) b!1024453))

(assert (= (and b!1024443 ((_ is ValueCellFull!11345) mapDefault!37574)) b!1024451))

(assert (= b!1024446 b!1024443))

(assert (= start!89376 b!1024446))

(declare-fun m!942287 () Bool)

(assert (=> b!1024447 m!942287))

(declare-fun m!942289 () Bool)

(assert (=> start!89376 m!942289))

(declare-fun m!942291 () Bool)

(assert (=> b!1024452 m!942291))

(declare-fun m!942293 () Bool)

(assert (=> b!1024452 m!942293))

(declare-fun m!942295 () Bool)

(assert (=> b!1024452 m!942295))

(declare-fun m!942297 () Bool)

(assert (=> b!1024452 m!942297))

(declare-fun m!942299 () Bool)

(assert (=> b!1024450 m!942299))

(declare-fun m!942301 () Bool)

(assert (=> b!1024449 m!942301))

(declare-fun m!942303 () Bool)

(assert (=> b!1024448 m!942303))

(declare-fun m!942305 () Bool)

(assert (=> mapNonEmpty!37574 m!942305))

(declare-fun m!942307 () Bool)

(assert (=> b!1024444 m!942307))

(declare-fun m!942309 () Bool)

(assert (=> b!1024446 m!942309))

(declare-fun m!942311 () Bool)

(assert (=> b!1024446 m!942311))

(check-sat (not b!1024446) (not b!1024447) (not b!1024444) (not b!1024450) (not b_next!20377) (not start!89376) b_and!32597 (not b!1024452) tp_is_empty!24097 (not b!1024448) (not b!1024449) (not mapNonEmpty!37574))
(check-sat b_and!32597 (not b_next!20377))
