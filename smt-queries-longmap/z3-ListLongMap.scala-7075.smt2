; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89502 () Bool)

(assert start!89502)

(declare-fun b!1026345 () Bool)

(declare-fun b_free!20503 () Bool)

(declare-fun b_next!20503 () Bool)

(assert (=> b!1026345 (= b_free!20503 (not b_next!20503))))

(declare-fun tp!72555 () Bool)

(declare-fun b_and!32723 () Bool)

(assert (=> b!1026345 (= tp!72555 b_and!32723)))

(declare-fun b!1026340 () Bool)

(declare-fun e!579001 () Bool)

(assert (=> b!1026340 (= e!579001 true)))

(declare-fun lt!451394 () Bool)

(declare-datatypes ((V!37171 0))(
  ( (V!37172 (val!12162 Int)) )
))
(declare-datatypes ((ValueCell!11408 0))(
  ( (ValueCellFull!11408 (v!14730 V!37171)) (EmptyCell!11408) )
))
(declare-datatypes ((array!64435 0))(
  ( (array!64436 (arr!31026 (Array (_ BitVec 32) (_ BitVec 64))) (size!31541 (_ BitVec 32))) )
))
(declare-datatypes ((array!64437 0))(
  ( (array!64438 (arr!31027 (Array (_ BitVec 32) ValueCell!11408)) (size!31542 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5410 0))(
  ( (LongMapFixedSize!5411 (defaultEntry!6057 Int) (mask!29748 (_ BitVec 32)) (extraKeys!5789 (_ BitVec 32)) (zeroValue!5893 V!37171) (minValue!5893 V!37171) (_size!2760 (_ BitVec 32)) (_keys!11200 array!64435) (_values!6080 array!64437) (_vacant!2760 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5410)

(declare-datatypes ((List!21817 0))(
  ( (Nil!21814) (Cons!21813 (h!23011 (_ BitVec 64)) (t!30870 List!21817)) )
))
(declare-fun arrayNoDuplicates!0 (array!64435 (_ BitVec 32) List!21817) Bool)

(assert (=> b!1026340 (= lt!451394 (arrayNoDuplicates!0 (_keys!11200 thiss!1427) #b00000000000000000000000000000000 Nil!21814))))

(declare-fun b!1026341 () Bool)

(declare-fun e!579000 () Bool)

(declare-fun e!579003 () Bool)

(assert (=> b!1026341 (= e!579000 e!579003)))

(declare-fun res!687069 () Bool)

(assert (=> b!1026341 (=> (not res!687069) (not e!579003))))

(declare-datatypes ((SeekEntryResult!9644 0))(
  ( (MissingZero!9644 (index!40947 (_ BitVec 32))) (Found!9644 (index!40948 (_ BitVec 32))) (Intermediate!9644 (undefined!10456 Bool) (index!40949 (_ BitVec 32)) (x!91311 (_ BitVec 32))) (Undefined!9644) (MissingVacant!9644 (index!40950 (_ BitVec 32))) )
))
(declare-fun lt!451399 () SeekEntryResult!9644)

(get-info :version)

(assert (=> b!1026341 (= res!687069 ((_ is Found!9644) lt!451399))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64435 (_ BitVec 32)) SeekEntryResult!9644)

(assert (=> b!1026341 (= lt!451399 (seekEntry!0 key!909 (_keys!11200 thiss!1427) (mask!29748 thiss!1427)))))

(declare-fun b!1026342 () Bool)

(declare-fun e!578996 () Bool)

(declare-fun e!579002 () Bool)

(declare-fun mapRes!37763 () Bool)

(assert (=> b!1026342 (= e!578996 (and e!579002 mapRes!37763))))

(declare-fun condMapEmpty!37763 () Bool)

(declare-fun mapDefault!37763 () ValueCell!11408)

(assert (=> b!1026342 (= condMapEmpty!37763 (= (arr!31027 (_values!6080 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11408)) mapDefault!37763)))))

(declare-fun b!1026343 () Bool)

(declare-fun res!687073 () Bool)

(assert (=> b!1026343 (=> res!687073 e!579001)))

(assert (=> b!1026343 (= res!687073 (or (not (= (size!31542 (_values!6080 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29748 thiss!1427)))) (not (= (size!31541 (_keys!11200 thiss!1427)) (size!31542 (_values!6080 thiss!1427)))) (bvslt (mask!29748 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5789 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5789 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun res!687071 () Bool)

(assert (=> start!89502 (=> (not res!687071) (not e!579000))))

(declare-fun valid!2050 (LongMapFixedSize!5410) Bool)

(assert (=> start!89502 (= res!687071 (valid!2050 thiss!1427))))

(assert (=> start!89502 e!579000))

(declare-fun e!578998 () Bool)

(assert (=> start!89502 e!578998))

(assert (=> start!89502 true))

(declare-fun b!1026344 () Bool)

(declare-fun e!578999 () Bool)

(declare-fun tp_is_empty!24223 () Bool)

(assert (=> b!1026344 (= e!578999 tp_is_empty!24223)))

(declare-fun mapIsEmpty!37763 () Bool)

(assert (=> mapIsEmpty!37763 mapRes!37763))

(declare-fun array_inv!24035 (array!64435) Bool)

(declare-fun array_inv!24036 (array!64437) Bool)

(assert (=> b!1026345 (= e!578998 (and tp!72555 tp_is_empty!24223 (array_inv!24035 (_keys!11200 thiss!1427)) (array_inv!24036 (_values!6080 thiss!1427)) e!578996))))

(declare-fun b!1026346 () Bool)

(declare-fun res!687070 () Bool)

(assert (=> b!1026346 (=> res!687070 e!579001)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64435 (_ BitVec 32)) Bool)

(assert (=> b!1026346 (= res!687070 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11200 thiss!1427) (mask!29748 thiss!1427))))))

(declare-fun b!1026347 () Bool)

(assert (=> b!1026347 (= e!579002 tp_is_empty!24223)))

(declare-fun mapNonEmpty!37763 () Bool)

(declare-fun tp!72554 () Bool)

(assert (=> mapNonEmpty!37763 (= mapRes!37763 (and tp!72554 e!578999))))

(declare-fun mapKey!37763 () (_ BitVec 32))

(declare-fun mapRest!37763 () (Array (_ BitVec 32) ValueCell!11408))

(declare-fun mapValue!37763 () ValueCell!11408)

(assert (=> mapNonEmpty!37763 (= (arr!31027 (_values!6080 thiss!1427)) (store mapRest!37763 mapKey!37763 mapValue!37763))))

(declare-fun b!1026348 () Bool)

(declare-fun res!687068 () Bool)

(assert (=> b!1026348 (=> (not res!687068) (not e!579000))))

(assert (=> b!1026348 (= res!687068 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026349 () Bool)

(assert (=> b!1026349 (= e!579003 (not e!579001))))

(declare-fun res!687072 () Bool)

(assert (=> b!1026349 (=> res!687072 e!579001)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026349 (= res!687072 (not (validMask!0 (mask!29748 thiss!1427))))))

(declare-fun lt!451397 () array!64435)

(declare-fun arrayContainsKey!0 (array!64435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026349 (not (arrayContainsKey!0 lt!451397 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33339 0))(
  ( (Unit!33340) )
))
(declare-fun lt!451396 () Unit!33339)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64435 (_ BitVec 32) (_ BitVec 64)) Unit!33339)

(assert (=> b!1026349 (= lt!451396 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11200 thiss!1427) (index!40948 lt!451399) key!909))))

(assert (=> b!1026349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451397 (mask!29748 thiss!1427))))

(declare-fun lt!451398 () Unit!33339)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64435 (_ BitVec 32) (_ BitVec 32)) Unit!33339)

(assert (=> b!1026349 (= lt!451398 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11200 thiss!1427) (index!40948 lt!451399) (mask!29748 thiss!1427)))))

(assert (=> b!1026349 (arrayNoDuplicates!0 lt!451397 #b00000000000000000000000000000000 Nil!21814)))

(declare-fun lt!451395 () Unit!33339)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64435 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21817) Unit!33339)

(assert (=> b!1026349 (= lt!451395 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11200 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40948 lt!451399) #b00000000000000000000000000000000 Nil!21814))))

(declare-fun arrayCountValidKeys!0 (array!64435 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026349 (= (arrayCountValidKeys!0 lt!451397 #b00000000000000000000000000000000 (size!31541 (_keys!11200 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11200 thiss!1427) #b00000000000000000000000000000000 (size!31541 (_keys!11200 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026349 (= lt!451397 (array!64436 (store (arr!31026 (_keys!11200 thiss!1427)) (index!40948 lt!451399) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31541 (_keys!11200 thiss!1427))))))

(declare-fun lt!451393 () Unit!33339)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64435 (_ BitVec 32) (_ BitVec 64)) Unit!33339)

(assert (=> b!1026349 (= lt!451393 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11200 thiss!1427) (index!40948 lt!451399) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89502 res!687071) b!1026348))

(assert (= (and b!1026348 res!687068) b!1026341))

(assert (= (and b!1026341 res!687069) b!1026349))

(assert (= (and b!1026349 (not res!687072)) b!1026343))

(assert (= (and b!1026343 (not res!687073)) b!1026346))

(assert (= (and b!1026346 (not res!687070)) b!1026340))

(assert (= (and b!1026342 condMapEmpty!37763) mapIsEmpty!37763))

(assert (= (and b!1026342 (not condMapEmpty!37763)) mapNonEmpty!37763))

(assert (= (and mapNonEmpty!37763 ((_ is ValueCellFull!11408) mapValue!37763)) b!1026344))

(assert (= (and b!1026342 ((_ is ValueCellFull!11408) mapDefault!37763)) b!1026347))

(assert (= b!1026345 b!1026342))

(assert (= start!89502 b!1026345))

(declare-fun m!944147 () Bool)

(assert (=> b!1026349 m!944147))

(declare-fun m!944149 () Bool)

(assert (=> b!1026349 m!944149))

(declare-fun m!944151 () Bool)

(assert (=> b!1026349 m!944151))

(declare-fun m!944153 () Bool)

(assert (=> b!1026349 m!944153))

(declare-fun m!944155 () Bool)

(assert (=> b!1026349 m!944155))

(declare-fun m!944157 () Bool)

(assert (=> b!1026349 m!944157))

(declare-fun m!944159 () Bool)

(assert (=> b!1026349 m!944159))

(declare-fun m!944161 () Bool)

(assert (=> b!1026349 m!944161))

(declare-fun m!944163 () Bool)

(assert (=> b!1026349 m!944163))

(declare-fun m!944165 () Bool)

(assert (=> b!1026349 m!944165))

(declare-fun m!944167 () Bool)

(assert (=> b!1026349 m!944167))

(declare-fun m!944169 () Bool)

(assert (=> b!1026340 m!944169))

(declare-fun m!944171 () Bool)

(assert (=> mapNonEmpty!37763 m!944171))

(declare-fun m!944173 () Bool)

(assert (=> b!1026345 m!944173))

(declare-fun m!944175 () Bool)

(assert (=> b!1026345 m!944175))

(declare-fun m!944177 () Bool)

(assert (=> start!89502 m!944177))

(declare-fun m!944179 () Bool)

(assert (=> b!1026346 m!944179))

(declare-fun m!944181 () Bool)

(assert (=> b!1026341 m!944181))

(check-sat (not mapNonEmpty!37763) (not b_next!20503) (not b!1026346) (not b!1026340) (not b!1026349) b_and!32723 (not start!89502) (not b!1026345) (not b!1026341) tp_is_empty!24223)
(check-sat b_and!32723 (not b_next!20503))
