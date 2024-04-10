; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89482 () Bool)

(assert start!89482)

(declare-fun b!1026189 () Bool)

(declare-fun b_free!20481 () Bool)

(declare-fun b_next!20481 () Bool)

(assert (=> b!1026189 (= b_free!20481 (not b_next!20481))))

(declare-fun tp!72488 () Bool)

(declare-fun b_and!32727 () Bool)

(assert (=> b!1026189 (= tp!72488 b_and!32727)))

(declare-fun b!1026187 () Bool)

(declare-fun res!686966 () Bool)

(declare-fun e!578827 () Bool)

(assert (=> b!1026187 (=> (not res!686966) (not e!578827))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1026187 (= res!686966 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37730 () Bool)

(declare-fun mapRes!37730 () Bool)

(assert (=> mapIsEmpty!37730 mapRes!37730))

(declare-fun b!1026188 () Bool)

(declare-fun e!578830 () Bool)

(assert (=> b!1026188 (= e!578830 true)))

(declare-fun lt!451379 () Bool)

(declare-datatypes ((V!37141 0))(
  ( (V!37142 (val!12151 Int)) )
))
(declare-datatypes ((ValueCell!11397 0))(
  ( (ValueCellFull!11397 (v!14720 V!37141)) (EmptyCell!11397) )
))
(declare-datatypes ((array!64452 0))(
  ( (array!64453 (arr!31035 (Array (_ BitVec 32) (_ BitVec 64))) (size!31548 (_ BitVec 32))) )
))
(declare-datatypes ((array!64454 0))(
  ( (array!64455 (arr!31036 (Array (_ BitVec 32) ValueCell!11397)) (size!31549 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5388 0))(
  ( (LongMapFixedSize!5389 (defaultEntry!6046 Int) (mask!29734 (_ BitVec 32)) (extraKeys!5778 (_ BitVec 32)) (zeroValue!5882 V!37141) (minValue!5882 V!37141) (_size!2749 (_ BitVec 32)) (_keys!11193 array!64452) (_values!6069 array!64454) (_vacant!2749 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5388)

(declare-datatypes ((List!21773 0))(
  ( (Nil!21770) (Cons!21769 (h!22967 (_ BitVec 64)) (t!30835 List!21773)) )
))
(declare-fun arrayNoDuplicates!0 (array!64452 (_ BitVec 32) List!21773) Bool)

(assert (=> b!1026188 (= lt!451379 (arrayNoDuplicates!0 (_keys!11193 thiss!1427) #b00000000000000000000000000000000 Nil!21770))))

(declare-fun mapNonEmpty!37730 () Bool)

(declare-fun tp!72489 () Bool)

(declare-fun e!578826 () Bool)

(assert (=> mapNonEmpty!37730 (= mapRes!37730 (and tp!72489 e!578826))))

(declare-fun mapValue!37730 () ValueCell!11397)

(declare-fun mapRest!37730 () (Array (_ BitVec 32) ValueCell!11397))

(declare-fun mapKey!37730 () (_ BitVec 32))

(assert (=> mapNonEmpty!37730 (= (arr!31036 (_values!6069 thiss!1427)) (store mapRest!37730 mapKey!37730 mapValue!37730))))

(declare-fun res!686964 () Bool)

(assert (=> start!89482 (=> (not res!686964) (not e!578827))))

(declare-fun valid!2047 (LongMapFixedSize!5388) Bool)

(assert (=> start!89482 (= res!686964 (valid!2047 thiss!1427))))

(assert (=> start!89482 e!578827))

(declare-fun e!578823 () Bool)

(assert (=> start!89482 e!578823))

(assert (=> start!89482 true))

(declare-fun tp_is_empty!24201 () Bool)

(declare-fun e!578829 () Bool)

(declare-fun array_inv!24033 (array!64452) Bool)

(declare-fun array_inv!24034 (array!64454) Bool)

(assert (=> b!1026189 (= e!578823 (and tp!72488 tp_is_empty!24201 (array_inv!24033 (_keys!11193 thiss!1427)) (array_inv!24034 (_values!6069 thiss!1427)) e!578829))))

(declare-fun b!1026190 () Bool)

(declare-fun e!578824 () Bool)

(assert (=> b!1026190 (= e!578824 tp_is_empty!24201)))

(declare-fun b!1026191 () Bool)

(declare-fun e!578828 () Bool)

(assert (=> b!1026191 (= e!578827 e!578828)))

(declare-fun res!686963 () Bool)

(assert (=> b!1026191 (=> (not res!686963) (not e!578828))))

(declare-datatypes ((SeekEntryResult!9641 0))(
  ( (MissingZero!9641 (index!40935 (_ BitVec 32))) (Found!9641 (index!40936 (_ BitVec 32))) (Intermediate!9641 (undefined!10453 Bool) (index!40937 (_ BitVec 32)) (x!91279 (_ BitVec 32))) (Undefined!9641) (MissingVacant!9641 (index!40938 (_ BitVec 32))) )
))
(declare-fun lt!451375 () SeekEntryResult!9641)

(get-info :version)

(assert (=> b!1026191 (= res!686963 ((_ is Found!9641) lt!451375))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64452 (_ BitVec 32)) SeekEntryResult!9641)

(assert (=> b!1026191 (= lt!451375 (seekEntry!0 key!909 (_keys!11193 thiss!1427) (mask!29734 thiss!1427)))))

(declare-fun b!1026192 () Bool)

(assert (=> b!1026192 (= e!578826 tp_is_empty!24201)))

(declare-fun b!1026193 () Bool)

(assert (=> b!1026193 (= e!578829 (and e!578824 mapRes!37730))))

(declare-fun condMapEmpty!37730 () Bool)

(declare-fun mapDefault!37730 () ValueCell!11397)

(assert (=> b!1026193 (= condMapEmpty!37730 (= (arr!31036 (_values!6069 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11397)) mapDefault!37730)))))

(declare-fun b!1026194 () Bool)

(assert (=> b!1026194 (= e!578828 (not e!578830))))

(declare-fun res!686965 () Bool)

(assert (=> b!1026194 (=> res!686965 e!578830)))

(assert (=> b!1026194 (= res!686965 (or (bvslt (index!40936 lt!451375) #b00000000000000000000000000000000) (bvsge (index!40936 lt!451375) (size!31548 (_keys!11193 thiss!1427))) (bvsge (size!31548 (_keys!11193 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451380 () array!64452)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64452 (_ BitVec 32)) Bool)

(assert (=> b!1026194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451380 (mask!29734 thiss!1427))))

(declare-datatypes ((Unit!33427 0))(
  ( (Unit!33428) )
))
(declare-fun lt!451377 () Unit!33427)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64452 (_ BitVec 32) (_ BitVec 32)) Unit!33427)

(assert (=> b!1026194 (= lt!451377 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11193 thiss!1427) (index!40936 lt!451375) (mask!29734 thiss!1427)))))

(assert (=> b!1026194 (arrayNoDuplicates!0 lt!451380 #b00000000000000000000000000000000 Nil!21770)))

(declare-fun lt!451376 () Unit!33427)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64452 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21773) Unit!33427)

(assert (=> b!1026194 (= lt!451376 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11193 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40936 lt!451375) #b00000000000000000000000000000000 Nil!21770))))

(declare-fun arrayCountValidKeys!0 (array!64452 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026194 (= (arrayCountValidKeys!0 lt!451380 #b00000000000000000000000000000000 (size!31548 (_keys!11193 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11193 thiss!1427) #b00000000000000000000000000000000 (size!31548 (_keys!11193 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026194 (= lt!451380 (array!64453 (store (arr!31035 (_keys!11193 thiss!1427)) (index!40936 lt!451375) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31548 (_keys!11193 thiss!1427))))))

(declare-fun lt!451378 () Unit!33427)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64452 (_ BitVec 32) (_ BitVec 64)) Unit!33427)

(assert (=> b!1026194 (= lt!451378 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11193 thiss!1427) (index!40936 lt!451375) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89482 res!686964) b!1026187))

(assert (= (and b!1026187 res!686966) b!1026191))

(assert (= (and b!1026191 res!686963) b!1026194))

(assert (= (and b!1026194 (not res!686965)) b!1026188))

(assert (= (and b!1026193 condMapEmpty!37730) mapIsEmpty!37730))

(assert (= (and b!1026193 (not condMapEmpty!37730)) mapNonEmpty!37730))

(assert (= (and mapNonEmpty!37730 ((_ is ValueCellFull!11397) mapValue!37730)) b!1026192))

(assert (= (and b!1026193 ((_ is ValueCellFull!11397) mapDefault!37730)) b!1026190))

(assert (= b!1026189 b!1026193))

(assert (= start!89482 b!1026189))

(declare-fun m!944411 () Bool)

(assert (=> mapNonEmpty!37730 m!944411))

(declare-fun m!944413 () Bool)

(assert (=> b!1026191 m!944413))

(declare-fun m!944415 () Bool)

(assert (=> b!1026188 m!944415))

(declare-fun m!944417 () Bool)

(assert (=> b!1026189 m!944417))

(declare-fun m!944419 () Bool)

(assert (=> b!1026189 m!944419))

(declare-fun m!944421 () Bool)

(assert (=> b!1026194 m!944421))

(declare-fun m!944423 () Bool)

(assert (=> b!1026194 m!944423))

(declare-fun m!944425 () Bool)

(assert (=> b!1026194 m!944425))

(declare-fun m!944427 () Bool)

(assert (=> b!1026194 m!944427))

(declare-fun m!944429 () Bool)

(assert (=> b!1026194 m!944429))

(declare-fun m!944431 () Bool)

(assert (=> b!1026194 m!944431))

(declare-fun m!944433 () Bool)

(assert (=> b!1026194 m!944433))

(declare-fun m!944435 () Bool)

(assert (=> b!1026194 m!944435))

(declare-fun m!944437 () Bool)

(assert (=> start!89482 m!944437))

(check-sat tp_is_empty!24201 (not b!1026191) b_and!32727 (not b_next!20481) (not start!89482) (not b!1026188) (not mapNonEmpty!37730) (not b!1026189) (not b!1026194))
(check-sat b_and!32727 (not b_next!20481))
