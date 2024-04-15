; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89508 () Bool)

(assert start!89508)

(declare-fun b!1026438 () Bool)

(declare-fun b_free!20509 () Bool)

(declare-fun b_next!20509 () Bool)

(assert (=> b!1026438 (= b_free!20509 (not b_next!20509))))

(declare-fun tp!72573 () Bool)

(declare-fun b_and!32729 () Bool)

(assert (=> b!1026438 (= tp!72573 b_and!32729)))

(declare-fun b!1026430 () Bool)

(declare-fun e!579069 () Bool)

(declare-fun e!579072 () Bool)

(assert (=> b!1026430 (= e!579069 (not e!579072))))

(declare-fun res!687127 () Bool)

(assert (=> b!1026430 (=> res!687127 e!579072)))

(declare-datatypes ((V!37179 0))(
  ( (V!37180 (val!12165 Int)) )
))
(declare-datatypes ((ValueCell!11411 0))(
  ( (ValueCellFull!11411 (v!14733 V!37179)) (EmptyCell!11411) )
))
(declare-datatypes ((array!64447 0))(
  ( (array!64448 (arr!31032 (Array (_ BitVec 32) (_ BitVec 64))) (size!31547 (_ BitVec 32))) )
))
(declare-datatypes ((array!64449 0))(
  ( (array!64450 (arr!31033 (Array (_ BitVec 32) ValueCell!11411)) (size!31548 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5416 0))(
  ( (LongMapFixedSize!5417 (defaultEntry!6060 Int) (mask!29753 (_ BitVec 32)) (extraKeys!5792 (_ BitVec 32)) (zeroValue!5896 V!37179) (minValue!5896 V!37179) (_size!2763 (_ BitVec 32)) (_keys!11203 array!64447) (_values!6083 array!64449) (_vacant!2763 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5416)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026430 (= res!687127 (not (validMask!0 (mask!29753 thiss!1427))))))

(declare-fun lt!451456 () array!64447)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026430 (not (arrayContainsKey!0 lt!451456 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9646 0))(
  ( (MissingZero!9646 (index!40955 (_ BitVec 32))) (Found!9646 (index!40956 (_ BitVec 32))) (Intermediate!9646 (undefined!10458 Bool) (index!40957 (_ BitVec 32)) (x!91321 (_ BitVec 32))) (Undefined!9646) (MissingVacant!9646 (index!40958 (_ BitVec 32))) )
))
(declare-fun lt!451457 () SeekEntryResult!9646)

(declare-datatypes ((Unit!33343 0))(
  ( (Unit!33344) )
))
(declare-fun lt!451462 () Unit!33343)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64447 (_ BitVec 32) (_ BitVec 64)) Unit!33343)

(assert (=> b!1026430 (= lt!451462 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11203 thiss!1427) (index!40956 lt!451457) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64447 (_ BitVec 32)) Bool)

(assert (=> b!1026430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451456 (mask!29753 thiss!1427))))

(declare-fun lt!451458 () Unit!33343)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64447 (_ BitVec 32) (_ BitVec 32)) Unit!33343)

(assert (=> b!1026430 (= lt!451458 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11203 thiss!1427) (index!40956 lt!451457) (mask!29753 thiss!1427)))))

(declare-datatypes ((List!21819 0))(
  ( (Nil!21816) (Cons!21815 (h!23013 (_ BitVec 64)) (t!30872 List!21819)) )
))
(declare-fun arrayNoDuplicates!0 (array!64447 (_ BitVec 32) List!21819) Bool)

(assert (=> b!1026430 (arrayNoDuplicates!0 lt!451456 #b00000000000000000000000000000000 Nil!21816)))

(declare-fun lt!451459 () Unit!33343)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64447 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21819) Unit!33343)

(assert (=> b!1026430 (= lt!451459 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11203 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40956 lt!451457) #b00000000000000000000000000000000 Nil!21816))))

(declare-fun arrayCountValidKeys!0 (array!64447 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026430 (= (arrayCountValidKeys!0 lt!451456 #b00000000000000000000000000000000 (size!31547 (_keys!11203 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11203 thiss!1427) #b00000000000000000000000000000000 (size!31547 (_keys!11203 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026430 (= lt!451456 (array!64448 (store (arr!31032 (_keys!11203 thiss!1427)) (index!40956 lt!451457) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31547 (_keys!11203 thiss!1427))))))

(declare-fun lt!451460 () Unit!33343)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64447 (_ BitVec 32) (_ BitVec 64)) Unit!33343)

(assert (=> b!1026430 (= lt!451460 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11203 thiss!1427) (index!40956 lt!451457) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026431 () Bool)

(declare-fun e!579074 () Bool)

(declare-fun tp_is_empty!24229 () Bool)

(assert (=> b!1026431 (= e!579074 tp_is_empty!24229)))

(declare-fun b!1026432 () Bool)

(declare-fun res!687126 () Bool)

(declare-fun e!579075 () Bool)

(assert (=> b!1026432 (=> (not res!687126) (not e!579075))))

(assert (=> b!1026432 (= res!687126 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026433 () Bool)

(declare-fun e!579073 () Bool)

(declare-fun mapRes!37772 () Bool)

(assert (=> b!1026433 (= e!579073 (and e!579074 mapRes!37772))))

(declare-fun condMapEmpty!37772 () Bool)

(declare-fun mapDefault!37772 () ValueCell!11411)

(assert (=> b!1026433 (= condMapEmpty!37772 (= (arr!31033 (_values!6083 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11411)) mapDefault!37772)))))

(declare-fun mapIsEmpty!37772 () Bool)

(assert (=> mapIsEmpty!37772 mapRes!37772))

(declare-fun res!687125 () Bool)

(assert (=> start!89508 (=> (not res!687125) (not e!579075))))

(declare-fun valid!2051 (LongMapFixedSize!5416) Bool)

(assert (=> start!89508 (= res!687125 (valid!2051 thiss!1427))))

(assert (=> start!89508 e!579075))

(declare-fun e!579071 () Bool)

(assert (=> start!89508 e!579071))

(assert (=> start!89508 true))

(declare-fun b!1026434 () Bool)

(declare-fun res!687122 () Bool)

(assert (=> b!1026434 (=> res!687122 e!579072)))

(assert (=> b!1026434 (= res!687122 (or (not (= (size!31548 (_values!6083 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29753 thiss!1427)))) (not (= (size!31547 (_keys!11203 thiss!1427)) (size!31548 (_values!6083 thiss!1427)))) (bvslt (mask!29753 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5792 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5792 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026435 () Bool)

(assert (=> b!1026435 (= e!579075 e!579069)))

(declare-fun res!687124 () Bool)

(assert (=> b!1026435 (=> (not res!687124) (not e!579069))))

(get-info :version)

(assert (=> b!1026435 (= res!687124 ((_ is Found!9646) lt!451457))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64447 (_ BitVec 32)) SeekEntryResult!9646)

(assert (=> b!1026435 (= lt!451457 (seekEntry!0 key!909 (_keys!11203 thiss!1427) (mask!29753 thiss!1427)))))

(declare-fun b!1026436 () Bool)

(declare-fun res!687123 () Bool)

(assert (=> b!1026436 (=> res!687123 e!579072)))

(assert (=> b!1026436 (= res!687123 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11203 thiss!1427) (mask!29753 thiss!1427))))))

(declare-fun b!1026437 () Bool)

(declare-fun e!579068 () Bool)

(assert (=> b!1026437 (= e!579068 tp_is_empty!24229)))

(declare-fun array_inv!24039 (array!64447) Bool)

(declare-fun array_inv!24040 (array!64449) Bool)

(assert (=> b!1026438 (= e!579071 (and tp!72573 tp_is_empty!24229 (array_inv!24039 (_keys!11203 thiss!1427)) (array_inv!24040 (_values!6083 thiss!1427)) e!579073))))

(declare-fun mapNonEmpty!37772 () Bool)

(declare-fun tp!72572 () Bool)

(assert (=> mapNonEmpty!37772 (= mapRes!37772 (and tp!72572 e!579068))))

(declare-fun mapKey!37772 () (_ BitVec 32))

(declare-fun mapValue!37772 () ValueCell!11411)

(declare-fun mapRest!37772 () (Array (_ BitVec 32) ValueCell!11411))

(assert (=> mapNonEmpty!37772 (= (arr!31033 (_values!6083 thiss!1427)) (store mapRest!37772 mapKey!37772 mapValue!37772))))

(declare-fun b!1026439 () Bool)

(assert (=> b!1026439 (= e!579072 true)))

(declare-fun lt!451461 () Bool)

(assert (=> b!1026439 (= lt!451461 (arrayNoDuplicates!0 (_keys!11203 thiss!1427) #b00000000000000000000000000000000 Nil!21816))))

(assert (= (and start!89508 res!687125) b!1026432))

(assert (= (and b!1026432 res!687126) b!1026435))

(assert (= (and b!1026435 res!687124) b!1026430))

(assert (= (and b!1026430 (not res!687127)) b!1026434))

(assert (= (and b!1026434 (not res!687122)) b!1026436))

(assert (= (and b!1026436 (not res!687123)) b!1026439))

(assert (= (and b!1026433 condMapEmpty!37772) mapIsEmpty!37772))

(assert (= (and b!1026433 (not condMapEmpty!37772)) mapNonEmpty!37772))

(assert (= (and mapNonEmpty!37772 ((_ is ValueCellFull!11411) mapValue!37772)) b!1026437))

(assert (= (and b!1026433 ((_ is ValueCellFull!11411) mapDefault!37772)) b!1026431))

(assert (= b!1026438 b!1026433))

(assert (= start!89508 b!1026438))

(declare-fun m!944255 () Bool)

(assert (=> b!1026436 m!944255))

(declare-fun m!944257 () Bool)

(assert (=> b!1026438 m!944257))

(declare-fun m!944259 () Bool)

(assert (=> b!1026438 m!944259))

(declare-fun m!944261 () Bool)

(assert (=> start!89508 m!944261))

(declare-fun m!944263 () Bool)

(assert (=> b!1026430 m!944263))

(declare-fun m!944265 () Bool)

(assert (=> b!1026430 m!944265))

(declare-fun m!944267 () Bool)

(assert (=> b!1026430 m!944267))

(declare-fun m!944269 () Bool)

(assert (=> b!1026430 m!944269))

(declare-fun m!944271 () Bool)

(assert (=> b!1026430 m!944271))

(declare-fun m!944273 () Bool)

(assert (=> b!1026430 m!944273))

(declare-fun m!944275 () Bool)

(assert (=> b!1026430 m!944275))

(declare-fun m!944277 () Bool)

(assert (=> b!1026430 m!944277))

(declare-fun m!944279 () Bool)

(assert (=> b!1026430 m!944279))

(declare-fun m!944281 () Bool)

(assert (=> b!1026430 m!944281))

(declare-fun m!944283 () Bool)

(assert (=> b!1026430 m!944283))

(declare-fun m!944285 () Bool)

(assert (=> b!1026439 m!944285))

(declare-fun m!944287 () Bool)

(assert (=> mapNonEmpty!37772 m!944287))

(declare-fun m!944289 () Bool)

(assert (=> b!1026435 m!944289))

(check-sat b_and!32729 (not b!1026438) (not b!1026430) (not start!89508) (not b!1026436) (not b!1026439) (not b!1026435) tp_is_empty!24229 (not b_next!20509) (not mapNonEmpty!37772))
(check-sat b_and!32729 (not b_next!20509))
