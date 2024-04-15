; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80400 () Bool)

(assert start!80400)

(declare-fun b!944407 () Bool)

(declare-fun b_free!18061 () Bool)

(declare-fun b_next!18061 () Bool)

(assert (=> b!944407 (= b_free!18061 (not b_next!18061))))

(declare-fun tp!62694 () Bool)

(declare-fun b_and!29453 () Bool)

(assert (=> b!944407 (= tp!62694 b_and!29453)))

(declare-fun b!944396 () Bool)

(declare-fun res!634471 () Bool)

(declare-fun e!531074 () Bool)

(assert (=> b!944396 (=> (not res!634471) (not e!531074))))

(declare-datatypes ((V!32391 0))(
  ( (V!32392 (val!10335 Int)) )
))
(declare-datatypes ((ValueCell!9803 0))(
  ( (ValueCellFull!9803 (v!12866 V!32391)) (EmptyCell!9803) )
))
(declare-datatypes ((array!57071 0))(
  ( (array!57072 (arr!27461 (Array (_ BitVec 32) ValueCell!9803)) (size!27929 (_ BitVec 32))) )
))
(declare-datatypes ((array!57073 0))(
  ( (array!57074 (arr!27462 (Array (_ BitVec 32) (_ BitVec 64))) (size!27930 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4756 0))(
  ( (LongMapFixedSize!4757 (defaultEntry!5673 Int) (mask!27320 (_ BitVec 32)) (extraKeys!5405 (_ BitVec 32)) (zeroValue!5509 V!32391) (minValue!5509 V!32391) (_size!2433 (_ BitVec 32)) (_keys!10546 array!57073) (_values!5696 array!57071) (_vacant!2433 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4756)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13536 0))(
  ( (tuple2!13537 (_1!6779 (_ BitVec 64)) (_2!6779 V!32391)) )
))
(declare-datatypes ((List!19283 0))(
  ( (Nil!19280) (Cons!19279 (h!20430 tuple2!13536) (t!27591 List!19283)) )
))
(declare-datatypes ((ListLongMap!12223 0))(
  ( (ListLongMap!12224 (toList!6127 List!19283)) )
))
(declare-fun contains!5142 (ListLongMap!12223 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3290 (array!57073 array!57071 (_ BitVec 32) (_ BitVec 32) V!32391 V!32391 (_ BitVec 32) Int) ListLongMap!12223)

(assert (=> b!944396 (= res!634471 (contains!5142 (getCurrentListMap!3290 (_keys!10546 thiss!1141) (_values!5696 thiss!1141) (mask!27320 thiss!1141) (extraKeys!5405 thiss!1141) (zeroValue!5509 thiss!1141) (minValue!5509 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5673 thiss!1141)) key!756))))

(declare-fun b!944397 () Bool)

(declare-fun e!531073 () Bool)

(declare-fun tp_is_empty!20569 () Bool)

(assert (=> b!944397 (= e!531073 tp_is_empty!20569)))

(declare-fun b!944398 () Bool)

(declare-fun res!634477 () Bool)

(declare-fun e!531069 () Bool)

(assert (=> b!944398 (=> res!634477 e!531069)))

(assert (=> b!944398 (= res!634477 (not (= (size!27930 (_keys!10546 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27320 thiss!1141)))))))

(declare-fun mapIsEmpty!32679 () Bool)

(declare-fun mapRes!32679 () Bool)

(assert (=> mapIsEmpty!32679 mapRes!32679))

(declare-fun b!944400 () Bool)

(declare-fun e!531072 () Bool)

(assert (=> b!944400 (= e!531072 (and e!531073 mapRes!32679))))

(declare-fun condMapEmpty!32679 () Bool)

(declare-fun mapDefault!32679 () ValueCell!9803)

(assert (=> b!944400 (= condMapEmpty!32679 (= (arr!27461 (_values!5696 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9803)) mapDefault!32679)))))

(declare-fun b!944401 () Bool)

(assert (=> b!944401 (= e!531074 (not e!531069))))

(declare-fun res!634475 () Bool)

(assert (=> b!944401 (=> res!634475 e!531069)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944401 (= res!634475 (not (validMask!0 (mask!27320 thiss!1141))))))

(declare-fun lt!425461 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57073 (_ BitVec 32)) Bool)

(assert (=> b!944401 (arrayForallSeekEntryOrOpenFound!0 lt!425461 (_keys!10546 thiss!1141) (mask!27320 thiss!1141))))

(declare-datatypes ((Unit!31737 0))(
  ( (Unit!31738) )
))
(declare-fun lt!425459 () Unit!31737)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31737)

(assert (=> b!944401 (= lt!425459 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10546 thiss!1141) (mask!27320 thiss!1141) #b00000000000000000000000000000000 lt!425461))))

(declare-fun arrayScanForKey!0 (array!57073 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944401 (= lt!425461 (arrayScanForKey!0 (_keys!10546 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944401 (arrayContainsKey!0 (_keys!10546 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425458 () Unit!31737)

(declare-fun lemmaKeyInListMapIsInArray!297 (array!57073 array!57071 (_ BitVec 32) (_ BitVec 32) V!32391 V!32391 (_ BitVec 64) Int) Unit!31737)

(assert (=> b!944401 (= lt!425458 (lemmaKeyInListMapIsInArray!297 (_keys!10546 thiss!1141) (_values!5696 thiss!1141) (mask!27320 thiss!1141) (extraKeys!5405 thiss!1141) (zeroValue!5509 thiss!1141) (minValue!5509 thiss!1141) key!756 (defaultEntry!5673 thiss!1141)))))

(declare-fun mapNonEmpty!32679 () Bool)

(declare-fun tp!62693 () Bool)

(declare-fun e!531070 () Bool)

(assert (=> mapNonEmpty!32679 (= mapRes!32679 (and tp!62693 e!531070))))

(declare-fun mapRest!32679 () (Array (_ BitVec 32) ValueCell!9803))

(declare-fun mapKey!32679 () (_ BitVec 32))

(declare-fun mapValue!32679 () ValueCell!9803)

(assert (=> mapNonEmpty!32679 (= (arr!27461 (_values!5696 thiss!1141)) (store mapRest!32679 mapKey!32679 mapValue!32679))))

(declare-fun b!944402 () Bool)

(declare-fun res!634476 () Bool)

(assert (=> b!944402 (=> (not res!634476) (not e!531074))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9069 0))(
  ( (MissingZero!9069 (index!38647 (_ BitVec 32))) (Found!9069 (index!38648 (_ BitVec 32))) (Intermediate!9069 (undefined!9881 Bool) (index!38649 (_ BitVec 32)) (x!81131 (_ BitVec 32))) (Undefined!9069) (MissingVacant!9069 (index!38650 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57073 (_ BitVec 32)) SeekEntryResult!9069)

(assert (=> b!944402 (= res!634476 (not ((_ is Found!9069) (seekEntry!0 key!756 (_keys!10546 thiss!1141) (mask!27320 thiss!1141)))))))

(declare-fun b!944403 () Bool)

(assert (=> b!944403 (= e!531070 tp_is_empty!20569)))

(declare-fun b!944404 () Bool)

(declare-fun res!634470 () Bool)

(assert (=> b!944404 (=> res!634470 e!531069)))

(assert (=> b!944404 (= res!634470 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10546 thiss!1141) (mask!27320 thiss!1141))))))

(declare-fun b!944399 () Bool)

(assert (=> b!944399 (= e!531069 true)))

(declare-fun lt!425460 () SeekEntryResult!9069)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57073 (_ BitVec 32)) SeekEntryResult!9069)

(assert (=> b!944399 (= lt!425460 (seekEntryOrOpen!0 key!756 (_keys!10546 thiss!1141) (mask!27320 thiss!1141)))))

(declare-fun res!634472 () Bool)

(assert (=> start!80400 (=> (not res!634472) (not e!531074))))

(declare-fun valid!1819 (LongMapFixedSize!4756) Bool)

(assert (=> start!80400 (= res!634472 (valid!1819 thiss!1141))))

(assert (=> start!80400 e!531074))

(declare-fun e!531075 () Bool)

(assert (=> start!80400 e!531075))

(assert (=> start!80400 true))

(declare-fun b!944405 () Bool)

(declare-fun res!634473 () Bool)

(assert (=> b!944405 (=> res!634473 e!531069)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944405 (= res!634473 (not (validKeyInArray!0 key!756)))))

(declare-fun b!944406 () Bool)

(declare-fun res!634474 () Bool)

(assert (=> b!944406 (=> (not res!634474) (not e!531074))))

(assert (=> b!944406 (= res!634474 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!21388 (array!57073) Bool)

(declare-fun array_inv!21389 (array!57071) Bool)

(assert (=> b!944407 (= e!531075 (and tp!62694 tp_is_empty!20569 (array_inv!21388 (_keys!10546 thiss!1141)) (array_inv!21389 (_values!5696 thiss!1141)) e!531072))))

(assert (= (and start!80400 res!634472) b!944406))

(assert (= (and b!944406 res!634474) b!944402))

(assert (= (and b!944402 res!634476) b!944396))

(assert (= (and b!944396 res!634471) b!944401))

(assert (= (and b!944401 (not res!634475)) b!944398))

(assert (= (and b!944398 (not res!634477)) b!944404))

(assert (= (and b!944404 (not res!634470)) b!944405))

(assert (= (and b!944405 (not res!634473)) b!944399))

(assert (= (and b!944400 condMapEmpty!32679) mapIsEmpty!32679))

(assert (= (and b!944400 (not condMapEmpty!32679)) mapNonEmpty!32679))

(assert (= (and mapNonEmpty!32679 ((_ is ValueCellFull!9803) mapValue!32679)) b!944403))

(assert (= (and b!944400 ((_ is ValueCellFull!9803) mapDefault!32679)) b!944397))

(assert (= b!944407 b!944400))

(assert (= start!80400 b!944407))

(declare-fun m!877855 () Bool)

(assert (=> b!944401 m!877855))

(declare-fun m!877857 () Bool)

(assert (=> b!944401 m!877857))

(declare-fun m!877859 () Bool)

(assert (=> b!944401 m!877859))

(declare-fun m!877861 () Bool)

(assert (=> b!944401 m!877861))

(declare-fun m!877863 () Bool)

(assert (=> b!944401 m!877863))

(declare-fun m!877865 () Bool)

(assert (=> b!944401 m!877865))

(declare-fun m!877867 () Bool)

(assert (=> start!80400 m!877867))

(declare-fun m!877869 () Bool)

(assert (=> b!944396 m!877869))

(assert (=> b!944396 m!877869))

(declare-fun m!877871 () Bool)

(assert (=> b!944396 m!877871))

(declare-fun m!877873 () Bool)

(assert (=> b!944404 m!877873))

(declare-fun m!877875 () Bool)

(assert (=> b!944399 m!877875))

(declare-fun m!877877 () Bool)

(assert (=> b!944405 m!877877))

(declare-fun m!877879 () Bool)

(assert (=> b!944402 m!877879))

(declare-fun m!877881 () Bool)

(assert (=> b!944407 m!877881))

(declare-fun m!877883 () Bool)

(assert (=> b!944407 m!877883))

(declare-fun m!877885 () Bool)

(assert (=> mapNonEmpty!32679 m!877885))

(check-sat (not b!944405) (not mapNonEmpty!32679) (not b!944396) (not b!944401) tp_is_empty!20569 b_and!29453 (not start!80400) (not b_next!18061) (not b!944399) (not b!944407) (not b!944402) (not b!944404))
(check-sat b_and!29453 (not b_next!18061))
