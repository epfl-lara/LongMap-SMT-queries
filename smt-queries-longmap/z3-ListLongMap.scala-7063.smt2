; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89666 () Bool)

(assert start!89666)

(declare-fun b!1026801 () Bool)

(declare-fun b_free!20431 () Bool)

(declare-fun b_next!20431 () Bool)

(assert (=> b!1026801 (= b_free!20431 (not b_next!20431))))

(declare-fun tp!72338 () Bool)

(declare-fun b_and!32687 () Bool)

(assert (=> b!1026801 (= tp!72338 b_and!32687)))

(declare-fun b!1026800 () Bool)

(declare-fun e!579071 () Bool)

(declare-fun tp_is_empty!24151 () Bool)

(assert (=> b!1026800 (= e!579071 tp_is_empty!24151)))

(declare-fun e!579068 () Bool)

(declare-datatypes ((V!37075 0))(
  ( (V!37076 (val!12126 Int)) )
))
(declare-datatypes ((ValueCell!11372 0))(
  ( (ValueCellFull!11372 (v!14691 V!37075)) (EmptyCell!11372) )
))
(declare-datatypes ((array!64401 0))(
  ( (array!64402 (arr!31003 (Array (_ BitVec 32) (_ BitVec 64))) (size!31517 (_ BitVec 32))) )
))
(declare-datatypes ((array!64403 0))(
  ( (array!64404 (arr!31004 (Array (_ BitVec 32) ValueCell!11372)) (size!31518 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5338 0))(
  ( (LongMapFixedSize!5339 (defaultEntry!6021 Int) (mask!29753 (_ BitVec 32)) (extraKeys!5753 (_ BitVec 32)) (zeroValue!5857 V!37075) (minValue!5857 V!37075) (_size!2724 (_ BitVec 32)) (_keys!11206 array!64401) (_values!6044 array!64403) (_vacant!2724 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5338)

(declare-fun e!579073 () Bool)

(declare-fun array_inv!24031 (array!64401) Bool)

(declare-fun array_inv!24032 (array!64403) Bool)

(assert (=> b!1026801 (= e!579073 (and tp!72338 tp_is_empty!24151 (array_inv!24031 (_keys!11206 thiss!1427)) (array_inv!24032 (_values!6044 thiss!1427)) e!579068))))

(declare-fun b!1026802 () Bool)

(declare-fun res!687073 () Bool)

(declare-fun e!579070 () Bool)

(assert (=> b!1026802 (=> res!687073 e!579070)))

(declare-datatypes ((SeekEntryResult!9576 0))(
  ( (MissingZero!9576 (index!40675 (_ BitVec 32))) (Found!9576 (index!40676 (_ BitVec 32))) (Intermediate!9576 (undefined!10388 Bool) (index!40677 (_ BitVec 32)) (x!91172 (_ BitVec 32))) (Undefined!9576) (MissingVacant!9576 (index!40678 (_ BitVec 32))) )
))
(declare-fun lt!451475 () SeekEntryResult!9576)

(assert (=> b!1026802 (= res!687073 (or (not (= (size!31517 (_keys!11206 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29753 thiss!1427)))) (bvslt (index!40676 lt!451475) #b00000000000000000000000000000000) (bvsge (index!40676 lt!451475) (size!31517 (_keys!11206 thiss!1427)))))))

(declare-fun mapNonEmpty!37655 () Bool)

(declare-fun mapRes!37655 () Bool)

(declare-fun tp!72339 () Bool)

(declare-fun e!579067 () Bool)

(assert (=> mapNonEmpty!37655 (= mapRes!37655 (and tp!72339 e!579067))))

(declare-fun mapRest!37655 () (Array (_ BitVec 32) ValueCell!11372))

(declare-fun mapValue!37655 () ValueCell!11372)

(declare-fun mapKey!37655 () (_ BitVec 32))

(assert (=> mapNonEmpty!37655 (= (arr!31004 (_values!6044 thiss!1427)) (store mapRest!37655 mapKey!37655 mapValue!37655))))

(declare-fun b!1026803 () Bool)

(declare-fun res!687075 () Bool)

(assert (=> b!1026803 (=> res!687075 e!579070)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1026803 (= res!687075 (not (validKeyInArray!0 (select (arr!31003 (_keys!11206 thiss!1427)) (index!40676 lt!451475)))))))

(declare-fun b!1026804 () Bool)

(declare-fun e!579072 () Bool)

(assert (=> b!1026804 (= e!579072 (not e!579070))))

(declare-fun res!687074 () Bool)

(assert (=> b!1026804 (=> res!687074 e!579070)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026804 (= res!687074 (not (validMask!0 (mask!29753 thiss!1427))))))

(declare-fun lt!451478 () array!64401)

(declare-datatypes ((List!21741 0))(
  ( (Nil!21738) (Cons!21737 (h!22944 (_ BitVec 64)) (t!30795 List!21741)) )
))
(declare-fun arrayNoDuplicates!0 (array!64401 (_ BitVec 32) List!21741) Bool)

(assert (=> b!1026804 (arrayNoDuplicates!0 lt!451478 #b00000000000000000000000000000000 Nil!21738)))

(declare-datatypes ((Unit!33402 0))(
  ( (Unit!33403) )
))
(declare-fun lt!451474 () Unit!33402)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64401 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21741) Unit!33402)

(assert (=> b!1026804 (= lt!451474 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11206 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40676 lt!451475) #b00000000000000000000000000000000 Nil!21738))))

(declare-fun arrayCountValidKeys!0 (array!64401 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026804 (= (arrayCountValidKeys!0 lt!451478 #b00000000000000000000000000000000 (size!31517 (_keys!11206 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11206 thiss!1427) #b00000000000000000000000000000000 (size!31517 (_keys!11206 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026804 (= lt!451478 (array!64402 (store (arr!31003 (_keys!11206 thiss!1427)) (index!40676 lt!451475) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31517 (_keys!11206 thiss!1427))))))

(declare-fun lt!451477 () Unit!33402)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64401 (_ BitVec 32) (_ BitVec 64)) Unit!33402)

(assert (=> b!1026804 (= lt!451477 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11206 thiss!1427) (index!40676 lt!451475) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026805 () Bool)

(assert (=> b!1026805 (= e!579067 tp_is_empty!24151)))

(declare-fun b!1026806 () Bool)

(assert (=> b!1026806 (= e!579068 (and e!579071 mapRes!37655))))

(declare-fun condMapEmpty!37655 () Bool)

(declare-fun mapDefault!37655 () ValueCell!11372)

(assert (=> b!1026806 (= condMapEmpty!37655 (= (arr!31004 (_values!6044 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11372)) mapDefault!37655)))))

(declare-fun b!1026807 () Bool)

(declare-fun res!687077 () Bool)

(assert (=> b!1026807 (=> res!687077 e!579070)))

(assert (=> b!1026807 (= res!687077 (not (arrayNoDuplicates!0 (_keys!11206 thiss!1427) #b00000000000000000000000000000000 Nil!21738)))))

(declare-fun b!1026808 () Bool)

(declare-fun e!579069 () Bool)

(assert (=> b!1026808 (= e!579069 e!579072)))

(declare-fun res!687072 () Bool)

(assert (=> b!1026808 (=> (not res!687072) (not e!579072))))

(get-info :version)

(assert (=> b!1026808 (= res!687072 ((_ is Found!9576) lt!451475))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64401 (_ BitVec 32)) SeekEntryResult!9576)

(assert (=> b!1026808 (= lt!451475 (seekEntry!0 key!909 (_keys!11206 thiss!1427) (mask!29753 thiss!1427)))))

(declare-fun b!1026809 () Bool)

(declare-fun res!687071 () Bool)

(assert (=> b!1026809 (=> (not res!687071) (not e!579069))))

(assert (=> b!1026809 (= res!687071 (not (= key!909 (bvneg key!909))))))

(declare-fun res!687076 () Bool)

(assert (=> start!89666 (=> (not res!687076) (not e!579069))))

(declare-fun valid!2035 (LongMapFixedSize!5338) Bool)

(assert (=> start!89666 (= res!687076 (valid!2035 thiss!1427))))

(assert (=> start!89666 e!579069))

(assert (=> start!89666 e!579073))

(assert (=> start!89666 true))

(declare-fun b!1026810 () Bool)

(assert (=> b!1026810 (= e!579070 true)))

(declare-fun lt!451476 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64401 (_ BitVec 32)) Bool)

(assert (=> b!1026810 (= lt!451476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11206 thiss!1427) (mask!29753 thiss!1427)))))

(declare-fun mapIsEmpty!37655 () Bool)

(assert (=> mapIsEmpty!37655 mapRes!37655))

(assert (= (and start!89666 res!687076) b!1026809))

(assert (= (and b!1026809 res!687071) b!1026808))

(assert (= (and b!1026808 res!687072) b!1026804))

(assert (= (and b!1026804 (not res!687074)) b!1026802))

(assert (= (and b!1026802 (not res!687073)) b!1026803))

(assert (= (and b!1026803 (not res!687075)) b!1026807))

(assert (= (and b!1026807 (not res!687077)) b!1026810))

(assert (= (and b!1026806 condMapEmpty!37655) mapIsEmpty!37655))

(assert (= (and b!1026806 (not condMapEmpty!37655)) mapNonEmpty!37655))

(assert (= (and mapNonEmpty!37655 ((_ is ValueCellFull!11372) mapValue!37655)) b!1026805))

(assert (= (and b!1026806 ((_ is ValueCellFull!11372) mapDefault!37655)) b!1026800))

(assert (= b!1026801 b!1026806))

(assert (= start!89666 b!1026801))

(declare-fun m!945327 () Bool)

(assert (=> b!1026810 m!945327))

(declare-fun m!945329 () Bool)

(assert (=> mapNonEmpty!37655 m!945329))

(declare-fun m!945331 () Bool)

(assert (=> start!89666 m!945331))

(declare-fun m!945333 () Bool)

(assert (=> b!1026801 m!945333))

(declare-fun m!945335 () Bool)

(assert (=> b!1026801 m!945335))

(declare-fun m!945337 () Bool)

(assert (=> b!1026803 m!945337))

(assert (=> b!1026803 m!945337))

(declare-fun m!945339 () Bool)

(assert (=> b!1026803 m!945339))

(declare-fun m!945341 () Bool)

(assert (=> b!1026807 m!945341))

(declare-fun m!945343 () Bool)

(assert (=> b!1026804 m!945343))

(declare-fun m!945345 () Bool)

(assert (=> b!1026804 m!945345))

(declare-fun m!945347 () Bool)

(assert (=> b!1026804 m!945347))

(declare-fun m!945349 () Bool)

(assert (=> b!1026804 m!945349))

(declare-fun m!945351 () Bool)

(assert (=> b!1026804 m!945351))

(declare-fun m!945353 () Bool)

(assert (=> b!1026804 m!945353))

(declare-fun m!945355 () Bool)

(assert (=> b!1026804 m!945355))

(declare-fun m!945357 () Bool)

(assert (=> b!1026808 m!945357))

(check-sat (not b!1026808) (not b!1026807) b_and!32687 (not b!1026803) (not b_next!20431) (not mapNonEmpty!37655) (not b!1026801) (not b!1026804) (not b!1026810) tp_is_empty!24151 (not start!89666))
(check-sat b_and!32687 (not b_next!20431))
