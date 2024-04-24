; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80212 () Bool)

(assert start!80212)

(declare-fun b!942037 () Bool)

(declare-fun b_free!17899 () Bool)

(declare-fun b_next!17899 () Bool)

(assert (=> b!942037 (= b_free!17899 (not b_next!17899))))

(declare-fun tp!62173 () Bool)

(declare-fun b_and!29321 () Bool)

(assert (=> b!942037 (= tp!62173 b_and!29321)))

(declare-fun b!942036 () Bool)

(declare-fun e!529651 () Bool)

(declare-fun tp_is_empty!20407 () Bool)

(assert (=> b!942036 (= e!529651 tp_is_empty!20407)))

(declare-fun res!633099 () Bool)

(declare-fun e!529648 () Bool)

(assert (=> start!80212 (=> (not res!633099) (not e!529648))))

(declare-datatypes ((V!32175 0))(
  ( (V!32176 (val!10254 Int)) )
))
(declare-datatypes ((ValueCell!9722 0))(
  ( (ValueCellFull!9722 (v!12782 V!32175)) (EmptyCell!9722) )
))
(declare-datatypes ((array!56813 0))(
  ( (array!56814 (arr!27337 (Array (_ BitVec 32) ValueCell!9722)) (size!27799 (_ BitVec 32))) )
))
(declare-datatypes ((array!56815 0))(
  ( (array!56816 (arr!27338 (Array (_ BitVec 32) (_ BitVec 64))) (size!27800 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4594 0))(
  ( (LongMapFixedSize!4595 (defaultEntry!5588 Int) (mask!27188 (_ BitVec 32)) (extraKeys!5320 (_ BitVec 32)) (zeroValue!5424 V!32175) (minValue!5424 V!32175) (_size!2352 (_ BitVec 32)) (_keys!10466 array!56815) (_values!5611 array!56813) (_vacant!2352 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4594)

(declare-fun valid!1764 (LongMapFixedSize!4594) Bool)

(assert (=> start!80212 (= res!633099 (valid!1764 thiss!1141))))

(assert (=> start!80212 e!529648))

(declare-fun e!529650 () Bool)

(assert (=> start!80212 e!529650))

(assert (=> start!80212 true))

(declare-fun e!529647 () Bool)

(declare-fun array_inv!21336 (array!56815) Bool)

(declare-fun array_inv!21337 (array!56813) Bool)

(assert (=> b!942037 (= e!529650 (and tp!62173 tp_is_empty!20407 (array_inv!21336 (_keys!10466 thiss!1141)) (array_inv!21337 (_values!5611 thiss!1141)) e!529647))))

(declare-fun b!942038 () Bool)

(declare-fun mapRes!32401 () Bool)

(assert (=> b!942038 (= e!529647 (and e!529651 mapRes!32401))))

(declare-fun condMapEmpty!32401 () Bool)

(declare-fun mapDefault!32401 () ValueCell!9722)

(assert (=> b!942038 (= condMapEmpty!32401 (= (arr!27337 (_values!5611 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9722)) mapDefault!32401)))))

(declare-fun b!942039 () Bool)

(declare-fun res!633098 () Bool)

(assert (=> b!942039 (=> (not res!633098) (not e!529648))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!8971 0))(
  ( (MissingZero!8971 (index!38255 (_ BitVec 32))) (Found!8971 (index!38256 (_ BitVec 32))) (Intermediate!8971 (undefined!9783 Bool) (index!38257 (_ BitVec 32)) (x!80710 (_ BitVec 32))) (Undefined!8971) (MissingVacant!8971 (index!38258 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56815 (_ BitVec 32)) SeekEntryResult!8971)

(assert (=> b!942039 (= res!633098 (not ((_ is Found!8971) (seekEntry!0 key!756 (_keys!10466 thiss!1141) (mask!27188 thiss!1141)))))))

(declare-fun mapNonEmpty!32401 () Bool)

(declare-fun tp!62172 () Bool)

(declare-fun e!529646 () Bool)

(assert (=> mapNonEmpty!32401 (= mapRes!32401 (and tp!62172 e!529646))))

(declare-fun mapValue!32401 () ValueCell!9722)

(declare-fun mapKey!32401 () (_ BitVec 32))

(declare-fun mapRest!32401 () (Array (_ BitVec 32) ValueCell!9722))

(assert (=> mapNonEmpty!32401 (= (arr!27337 (_values!5611 thiss!1141)) (store mapRest!32401 mapKey!32401 mapValue!32401))))

(declare-fun mapIsEmpty!32401 () Bool)

(assert (=> mapIsEmpty!32401 mapRes!32401))

(declare-fun b!942040 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942040 (= e!529648 (not (validMask!0 (mask!27188 thiss!1141))))))

(declare-fun b!942041 () Bool)

(declare-fun res!633097 () Bool)

(assert (=> b!942041 (=> (not res!633097) (not e!529648))))

(assert (=> b!942041 (= res!633097 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942042 () Bool)

(assert (=> b!942042 (= e!529646 tp_is_empty!20407)))

(assert (= (and start!80212 res!633099) b!942041))

(assert (= (and b!942041 res!633097) b!942039))

(assert (= (and b!942039 res!633098) b!942040))

(assert (= (and b!942038 condMapEmpty!32401) mapIsEmpty!32401))

(assert (= (and b!942038 (not condMapEmpty!32401)) mapNonEmpty!32401))

(assert (= (and mapNonEmpty!32401 ((_ is ValueCellFull!9722) mapValue!32401)) b!942042))

(assert (= (and b!942038 ((_ is ValueCellFull!9722) mapDefault!32401)) b!942036))

(assert (= b!942037 b!942038))

(assert (= start!80212 b!942037))

(declare-fun m!877673 () Bool)

(assert (=> b!942040 m!877673))

(declare-fun m!877675 () Bool)

(assert (=> mapNonEmpty!32401 m!877675))

(declare-fun m!877677 () Bool)

(assert (=> b!942037 m!877677))

(declare-fun m!877679 () Bool)

(assert (=> b!942037 m!877679))

(declare-fun m!877681 () Bool)

(assert (=> b!942039 m!877681))

(declare-fun m!877683 () Bool)

(assert (=> start!80212 m!877683))

(check-sat b_and!29321 (not b!942037) (not start!80212) (not b!942039) tp_is_empty!20407 (not mapNonEmpty!32401) (not b_next!17899) (not b!942040))
(check-sat b_and!29321 (not b_next!17899))
(get-model)

(declare-fun d!114353 () Bool)

(declare-fun res!633124 () Bool)

(declare-fun e!529690 () Bool)

(assert (=> d!114353 (=> (not res!633124) (not e!529690))))

(declare-fun simpleValid!339 (LongMapFixedSize!4594) Bool)

(assert (=> d!114353 (= res!633124 (simpleValid!339 thiss!1141))))

(assert (=> d!114353 (= (valid!1764 thiss!1141) e!529690)))

(declare-fun b!942091 () Bool)

(declare-fun res!633125 () Bool)

(assert (=> b!942091 (=> (not res!633125) (not e!529690))))

(declare-fun arrayCountValidKeys!0 (array!56815 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942091 (= res!633125 (= (arrayCountValidKeys!0 (_keys!10466 thiss!1141) #b00000000000000000000000000000000 (size!27800 (_keys!10466 thiss!1141))) (_size!2352 thiss!1141)))))

(declare-fun b!942092 () Bool)

(declare-fun res!633126 () Bool)

(assert (=> b!942092 (=> (not res!633126) (not e!529690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56815 (_ BitVec 32)) Bool)

(assert (=> b!942092 (= res!633126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10466 thiss!1141) (mask!27188 thiss!1141)))))

(declare-fun b!942093 () Bool)

(declare-datatypes ((List!19190 0))(
  ( (Nil!19187) (Cons!19186 (h!20338 (_ BitVec 64)) (t!27497 List!19190)) )
))
(declare-fun arrayNoDuplicates!0 (array!56815 (_ BitVec 32) List!19190) Bool)

(assert (=> b!942093 (= e!529690 (arrayNoDuplicates!0 (_keys!10466 thiss!1141) #b00000000000000000000000000000000 Nil!19187))))

(assert (= (and d!114353 res!633124) b!942091))

(assert (= (and b!942091 res!633125) b!942092))

(assert (= (and b!942092 res!633126) b!942093))

(declare-fun m!877709 () Bool)

(assert (=> d!114353 m!877709))

(declare-fun m!877711 () Bool)

(assert (=> b!942091 m!877711))

(declare-fun m!877713 () Bool)

(assert (=> b!942092 m!877713))

(declare-fun m!877715 () Bool)

(assert (=> b!942093 m!877715))

(assert (=> start!80212 d!114353))

(declare-fun d!114355 () Bool)

(assert (=> d!114355 (= (array_inv!21336 (_keys!10466 thiss!1141)) (bvsge (size!27800 (_keys!10466 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942037 d!114355))

(declare-fun d!114357 () Bool)

(assert (=> d!114357 (= (array_inv!21337 (_values!5611 thiss!1141)) (bvsge (size!27799 (_values!5611 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942037 d!114357))

(declare-fun d!114359 () Bool)

(assert (=> d!114359 (= (validMask!0 (mask!27188 thiss!1141)) (and (or (= (mask!27188 thiss!1141) #b00000000000000000000000000000111) (= (mask!27188 thiss!1141) #b00000000000000000000000000001111) (= (mask!27188 thiss!1141) #b00000000000000000000000000011111) (= (mask!27188 thiss!1141) #b00000000000000000000000000111111) (= (mask!27188 thiss!1141) #b00000000000000000000000001111111) (= (mask!27188 thiss!1141) #b00000000000000000000000011111111) (= (mask!27188 thiss!1141) #b00000000000000000000000111111111) (= (mask!27188 thiss!1141) #b00000000000000000000001111111111) (= (mask!27188 thiss!1141) #b00000000000000000000011111111111) (= (mask!27188 thiss!1141) #b00000000000000000000111111111111) (= (mask!27188 thiss!1141) #b00000000000000000001111111111111) (= (mask!27188 thiss!1141) #b00000000000000000011111111111111) (= (mask!27188 thiss!1141) #b00000000000000000111111111111111) (= (mask!27188 thiss!1141) #b00000000000000001111111111111111) (= (mask!27188 thiss!1141) #b00000000000000011111111111111111) (= (mask!27188 thiss!1141) #b00000000000000111111111111111111) (= (mask!27188 thiss!1141) #b00000000000001111111111111111111) (= (mask!27188 thiss!1141) #b00000000000011111111111111111111) (= (mask!27188 thiss!1141) #b00000000000111111111111111111111) (= (mask!27188 thiss!1141) #b00000000001111111111111111111111) (= (mask!27188 thiss!1141) #b00000000011111111111111111111111) (= (mask!27188 thiss!1141) #b00000000111111111111111111111111) (= (mask!27188 thiss!1141) #b00000001111111111111111111111111) (= (mask!27188 thiss!1141) #b00000011111111111111111111111111) (= (mask!27188 thiss!1141) #b00000111111111111111111111111111) (= (mask!27188 thiss!1141) #b00001111111111111111111111111111) (= (mask!27188 thiss!1141) #b00011111111111111111111111111111) (= (mask!27188 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27188 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!942040 d!114359))

(declare-fun b!942106 () Bool)

(declare-fun e!529697 () SeekEntryResult!8971)

(declare-fun e!529699 () SeekEntryResult!8971)

(assert (=> b!942106 (= e!529697 e!529699)))

(declare-fun lt!425294 () (_ BitVec 64))

(declare-fun lt!425291 () SeekEntryResult!8971)

(assert (=> b!942106 (= lt!425294 (select (arr!27338 (_keys!10466 thiss!1141)) (index!38257 lt!425291)))))

(declare-fun c!98315 () Bool)

(assert (=> b!942106 (= c!98315 (= lt!425294 key!756))))

(declare-fun d!114361 () Bool)

(declare-fun lt!425292 () SeekEntryResult!8971)

(assert (=> d!114361 (and (or ((_ is MissingVacant!8971) lt!425292) (not ((_ is Found!8971) lt!425292)) (and (bvsge (index!38256 lt!425292) #b00000000000000000000000000000000) (bvslt (index!38256 lt!425292) (size!27800 (_keys!10466 thiss!1141))))) (not ((_ is MissingVacant!8971) lt!425292)) (or (not ((_ is Found!8971) lt!425292)) (= (select (arr!27338 (_keys!10466 thiss!1141)) (index!38256 lt!425292)) key!756)))))

(assert (=> d!114361 (= lt!425292 e!529697)))

(declare-fun c!98317 () Bool)

(assert (=> d!114361 (= c!98317 (and ((_ is Intermediate!8971) lt!425291) (undefined!9783 lt!425291)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56815 (_ BitVec 32)) SeekEntryResult!8971)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114361 (= lt!425291 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27188 thiss!1141)) key!756 (_keys!10466 thiss!1141) (mask!27188 thiss!1141)))))

(assert (=> d!114361 (validMask!0 (mask!27188 thiss!1141))))

(assert (=> d!114361 (= (seekEntry!0 key!756 (_keys!10466 thiss!1141) (mask!27188 thiss!1141)) lt!425292)))

(declare-fun b!942107 () Bool)

(assert (=> b!942107 (= e!529697 Undefined!8971)))

(declare-fun b!942108 () Bool)

(declare-fun e!529698 () SeekEntryResult!8971)

(assert (=> b!942108 (= e!529698 (MissingZero!8971 (index!38257 lt!425291)))))

(declare-fun b!942109 () Bool)

(declare-fun c!98316 () Bool)

(assert (=> b!942109 (= c!98316 (= lt!425294 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942109 (= e!529699 e!529698)))

(declare-fun b!942110 () Bool)

(declare-fun lt!425293 () SeekEntryResult!8971)

(assert (=> b!942110 (= e!529698 (ite ((_ is MissingVacant!8971) lt!425293) (MissingZero!8971 (index!38258 lt!425293)) lt!425293))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56815 (_ BitVec 32)) SeekEntryResult!8971)

(assert (=> b!942110 (= lt!425293 (seekKeyOrZeroReturnVacant!0 (x!80710 lt!425291) (index!38257 lt!425291) (index!38257 lt!425291) key!756 (_keys!10466 thiss!1141) (mask!27188 thiss!1141)))))

(declare-fun b!942111 () Bool)

(assert (=> b!942111 (= e!529699 (Found!8971 (index!38257 lt!425291)))))

(assert (= (and d!114361 c!98317) b!942107))

(assert (= (and d!114361 (not c!98317)) b!942106))

(assert (= (and b!942106 c!98315) b!942111))

(assert (= (and b!942106 (not c!98315)) b!942109))

(assert (= (and b!942109 c!98316) b!942108))

(assert (= (and b!942109 (not c!98316)) b!942110))

(declare-fun m!877717 () Bool)

(assert (=> b!942106 m!877717))

(declare-fun m!877719 () Bool)

(assert (=> d!114361 m!877719))

(declare-fun m!877721 () Bool)

(assert (=> d!114361 m!877721))

(assert (=> d!114361 m!877721))

(declare-fun m!877723 () Bool)

(assert (=> d!114361 m!877723))

(assert (=> d!114361 m!877673))

(declare-fun m!877725 () Bool)

(assert (=> b!942110 m!877725))

(assert (=> b!942039 d!114361))

(declare-fun condMapEmpty!32410 () Bool)

(declare-fun mapDefault!32410 () ValueCell!9722)

(assert (=> mapNonEmpty!32401 (= condMapEmpty!32410 (= mapRest!32401 ((as const (Array (_ BitVec 32) ValueCell!9722)) mapDefault!32410)))))

(declare-fun e!529704 () Bool)

(declare-fun mapRes!32410 () Bool)

(assert (=> mapNonEmpty!32401 (= tp!62172 (and e!529704 mapRes!32410))))

(declare-fun mapNonEmpty!32410 () Bool)

(declare-fun tp!62188 () Bool)

(declare-fun e!529705 () Bool)

(assert (=> mapNonEmpty!32410 (= mapRes!32410 (and tp!62188 e!529705))))

(declare-fun mapValue!32410 () ValueCell!9722)

(declare-fun mapKey!32410 () (_ BitVec 32))

(declare-fun mapRest!32410 () (Array (_ BitVec 32) ValueCell!9722))

(assert (=> mapNonEmpty!32410 (= mapRest!32401 (store mapRest!32410 mapKey!32410 mapValue!32410))))

(declare-fun b!942118 () Bool)

(assert (=> b!942118 (= e!529705 tp_is_empty!20407)))

(declare-fun mapIsEmpty!32410 () Bool)

(assert (=> mapIsEmpty!32410 mapRes!32410))

(declare-fun b!942119 () Bool)

(assert (=> b!942119 (= e!529704 tp_is_empty!20407)))

(assert (= (and mapNonEmpty!32401 condMapEmpty!32410) mapIsEmpty!32410))

(assert (= (and mapNonEmpty!32401 (not condMapEmpty!32410)) mapNonEmpty!32410))

(assert (= (and mapNonEmpty!32410 ((_ is ValueCellFull!9722) mapValue!32410)) b!942118))

(assert (= (and mapNonEmpty!32401 ((_ is ValueCellFull!9722) mapDefault!32410)) b!942119))

(declare-fun m!877727 () Bool)

(assert (=> mapNonEmpty!32410 m!877727))

(check-sat (not d!114353) b_and!29321 (not b!942092) (not b!942110) tp_is_empty!20407 (not mapNonEmpty!32410) (not b_next!17899) (not b!942091) (not d!114361) (not b!942093))
(check-sat b_and!29321 (not b_next!17899))
