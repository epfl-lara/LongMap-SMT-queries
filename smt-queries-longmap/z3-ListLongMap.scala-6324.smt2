; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81330 () Bool)

(assert start!81330)

(declare-fun b!951090 () Bool)

(declare-fun b_free!18265 () Bool)

(declare-fun b_next!18265 () Bool)

(assert (=> b!951090 (= b_free!18265 (not b_next!18265))))

(declare-fun tp!63404 () Bool)

(declare-fun b_and!29707 () Bool)

(assert (=> b!951090 (= tp!63404 b_and!29707)))

(declare-fun b!951081 () Bool)

(declare-fun e!535535 () Bool)

(declare-fun e!535537 () Bool)

(assert (=> b!951081 (= e!535535 (not e!535537))))

(declare-fun res!637471 () Bool)

(assert (=> b!951081 (=> res!637471 e!535537)))

(declare-datatypes ((V!32663 0))(
  ( (V!32664 (val!10437 Int)) )
))
(declare-datatypes ((ValueCell!9905 0))(
  ( (ValueCellFull!9905 (v!12983 V!32663)) (EmptyCell!9905) )
))
(declare-datatypes ((array!57537 0))(
  ( (array!57538 (arr!27665 (Array (_ BitVec 32) ValueCell!9905)) (size!28145 (_ BitVec 32))) )
))
(declare-datatypes ((array!57539 0))(
  ( (array!57540 (arr!27666 (Array (_ BitVec 32) (_ BitVec 64))) (size!28146 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4960 0))(
  ( (LongMapFixedSize!4961 (defaultEntry!5801 Int) (mask!27614 (_ BitVec 32)) (extraKeys!5533 (_ BitVec 32)) (zeroValue!5637 V!32663) (minValue!5637 V!32663) (_size!2535 (_ BitVec 32)) (_keys!10739 array!57539) (_values!5824 array!57537) (_vacant!2535 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4960)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951081 (= res!637471 (not (validMask!0 (mask!27614 thiss!1141))))))

(declare-fun lt!428274 () (_ BitVec 32))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57539 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951081 (= lt!428274 (arrayScanForKey!0 (_keys!10739 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951081 (arrayContainsKey!0 (_keys!10739 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31891 0))(
  ( (Unit!31892) )
))
(declare-fun lt!428275 () Unit!31891)

(declare-fun lemmaKeyInListMapIsInArray!310 (array!57539 array!57537 (_ BitVec 32) (_ BitVec 32) V!32663 V!32663 (_ BitVec 64) Int) Unit!31891)

(assert (=> b!951081 (= lt!428275 (lemmaKeyInListMapIsInArray!310 (_keys!10739 thiss!1141) (_values!5824 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) key!756 (defaultEntry!5801 thiss!1141)))))

(declare-fun b!951082 () Bool)

(declare-fun res!637476 () Bool)

(assert (=> b!951082 (=> (not res!637476) (not e!535535))))

(declare-datatypes ((tuple2!13612 0))(
  ( (tuple2!13613 (_1!6817 (_ BitVec 64)) (_2!6817 V!32663)) )
))
(declare-datatypes ((List!19355 0))(
  ( (Nil!19352) (Cons!19351 (h!20512 tuple2!13612) (t!27693 List!19355)) )
))
(declare-datatypes ((ListLongMap!12299 0))(
  ( (ListLongMap!12300 (toList!6165 List!19355)) )
))
(declare-fun contains!5201 (ListLongMap!12299 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3327 (array!57539 array!57537 (_ BitVec 32) (_ BitVec 32) V!32663 V!32663 (_ BitVec 32) Int) ListLongMap!12299)

(assert (=> b!951082 (= res!637476 (contains!5201 (getCurrentListMap!3327 (_keys!10739 thiss!1141) (_values!5824 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)) key!756))))

(declare-fun b!951083 () Bool)

(declare-fun e!535532 () Bool)

(declare-fun e!535531 () Bool)

(declare-fun mapRes!33084 () Bool)

(assert (=> b!951083 (= e!535532 (and e!535531 mapRes!33084))))

(declare-fun condMapEmpty!33084 () Bool)

(declare-fun mapDefault!33084 () ValueCell!9905)

(assert (=> b!951083 (= condMapEmpty!33084 (= (arr!27665 (_values!5824 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9905)) mapDefault!33084)))))

(declare-fun mapIsEmpty!33084 () Bool)

(assert (=> mapIsEmpty!33084 mapRes!33084))

(declare-fun b!951084 () Bool)

(declare-fun res!637474 () Bool)

(assert (=> b!951084 (=> res!637474 e!535537)))

(assert (=> b!951084 (= res!637474 (or (not (= (size!28146 (_keys!10739 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27614 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!28146 (_keys!10739 thiss!1141))) (bvslt lt!428274 #b00000000000000000000000000000000) (bvsgt lt!428274 (size!28146 (_keys!10739 thiss!1141)))))))

(declare-fun b!951086 () Bool)

(declare-fun e!535536 () Bool)

(declare-fun tp_is_empty!20773 () Bool)

(assert (=> b!951086 (= e!535536 tp_is_empty!20773)))

(declare-fun b!951087 () Bool)

(declare-fun res!637472 () Bool)

(assert (=> b!951087 (=> (not res!637472) (not e!535535))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9149 0))(
  ( (MissingZero!9149 (index!38967 (_ BitVec 32))) (Found!9149 (index!38968 (_ BitVec 32))) (Intermediate!9149 (undefined!9961 Bool) (index!38969 (_ BitVec 32)) (x!81842 (_ BitVec 32))) (Undefined!9149) (MissingVacant!9149 (index!38970 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57539 (_ BitVec 32)) SeekEntryResult!9149)

(assert (=> b!951087 (= res!637472 (not ((_ is Found!9149) (seekEntry!0 key!756 (_keys!10739 thiss!1141) (mask!27614 thiss!1141)))))))

(declare-fun b!951088 () Bool)

(assert (=> b!951088 (= e!535531 tp_is_empty!20773)))

(declare-fun b!951089 () Bool)

(declare-fun res!637473 () Bool)

(assert (=> b!951089 (=> (not res!637473) (not e!535535))))

(assert (=> b!951089 (= res!637473 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!33084 () Bool)

(declare-fun tp!63405 () Bool)

(assert (=> mapNonEmpty!33084 (= mapRes!33084 (and tp!63405 e!535536))))

(declare-fun mapValue!33084 () ValueCell!9905)

(declare-fun mapRest!33084 () (Array (_ BitVec 32) ValueCell!9905))

(declare-fun mapKey!33084 () (_ BitVec 32))

(assert (=> mapNonEmpty!33084 (= (arr!27665 (_values!5824 thiss!1141)) (store mapRest!33084 mapKey!33084 mapValue!33084))))

(declare-fun e!535534 () Bool)

(declare-fun array_inv!21532 (array!57539) Bool)

(declare-fun array_inv!21533 (array!57537) Bool)

(assert (=> b!951090 (= e!535534 (and tp!63404 tp_is_empty!20773 (array_inv!21532 (_keys!10739 thiss!1141)) (array_inv!21533 (_values!5824 thiss!1141)) e!535532))))

(declare-fun b!951085 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57539 (_ BitVec 32)) Bool)

(assert (=> b!951085 (= e!535537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10739 thiss!1141) (mask!27614 thiss!1141)))))

(declare-fun res!637475 () Bool)

(assert (=> start!81330 (=> (not res!637475) (not e!535535))))

(declare-fun valid!1892 (LongMapFixedSize!4960) Bool)

(assert (=> start!81330 (= res!637475 (valid!1892 thiss!1141))))

(assert (=> start!81330 e!535535))

(assert (=> start!81330 e!535534))

(assert (=> start!81330 true))

(assert (= (and start!81330 res!637475) b!951089))

(assert (= (and b!951089 res!637473) b!951087))

(assert (= (and b!951087 res!637472) b!951082))

(assert (= (and b!951082 res!637476) b!951081))

(assert (= (and b!951081 (not res!637471)) b!951084))

(assert (= (and b!951084 (not res!637474)) b!951085))

(assert (= (and b!951083 condMapEmpty!33084) mapIsEmpty!33084))

(assert (= (and b!951083 (not condMapEmpty!33084)) mapNonEmpty!33084))

(assert (= (and mapNonEmpty!33084 ((_ is ValueCellFull!9905) mapValue!33084)) b!951086))

(assert (= (and b!951083 ((_ is ValueCellFull!9905) mapDefault!33084)) b!951088))

(assert (= b!951090 b!951083))

(assert (= start!81330 b!951090))

(declare-fun m!882839 () Bool)

(assert (=> b!951087 m!882839))

(declare-fun m!882841 () Bool)

(assert (=> b!951090 m!882841))

(declare-fun m!882843 () Bool)

(assert (=> b!951090 m!882843))

(declare-fun m!882845 () Bool)

(assert (=> start!81330 m!882845))

(declare-fun m!882847 () Bool)

(assert (=> b!951085 m!882847))

(declare-fun m!882849 () Bool)

(assert (=> mapNonEmpty!33084 m!882849))

(declare-fun m!882851 () Bool)

(assert (=> b!951082 m!882851))

(assert (=> b!951082 m!882851))

(declare-fun m!882853 () Bool)

(assert (=> b!951082 m!882853))

(declare-fun m!882855 () Bool)

(assert (=> b!951081 m!882855))

(declare-fun m!882857 () Bool)

(assert (=> b!951081 m!882857))

(declare-fun m!882859 () Bool)

(assert (=> b!951081 m!882859))

(declare-fun m!882861 () Bool)

(assert (=> b!951081 m!882861))

(check-sat (not b!951081) (not b!951085) (not start!81330) (not b!951090) b_and!29707 (not b_next!18265) (not b!951087) (not b!951082) tp_is_empty!20773 (not mapNonEmpty!33084))
(check-sat b_and!29707 (not b_next!18265))
(get-model)

(declare-fun d!115137 () Bool)

(assert (=> d!115137 (= (array_inv!21532 (_keys!10739 thiss!1141)) (bvsge (size!28146 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951090 d!115137))

(declare-fun d!115139 () Bool)

(assert (=> d!115139 (= (array_inv!21533 (_values!5824 thiss!1141)) (bvsge (size!28145 (_values!5824 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951090 d!115139))

(declare-fun d!115141 () Bool)

(assert (=> d!115141 (= (validMask!0 (mask!27614 thiss!1141)) (and (or (= (mask!27614 thiss!1141) #b00000000000000000000000000000111) (= (mask!27614 thiss!1141) #b00000000000000000000000000001111) (= (mask!27614 thiss!1141) #b00000000000000000000000000011111) (= (mask!27614 thiss!1141) #b00000000000000000000000000111111) (= (mask!27614 thiss!1141) #b00000000000000000000000001111111) (= (mask!27614 thiss!1141) #b00000000000000000000000011111111) (= (mask!27614 thiss!1141) #b00000000000000000000000111111111) (= (mask!27614 thiss!1141) #b00000000000000000000001111111111) (= (mask!27614 thiss!1141) #b00000000000000000000011111111111) (= (mask!27614 thiss!1141) #b00000000000000000000111111111111) (= (mask!27614 thiss!1141) #b00000000000000000001111111111111) (= (mask!27614 thiss!1141) #b00000000000000000011111111111111) (= (mask!27614 thiss!1141) #b00000000000000000111111111111111) (= (mask!27614 thiss!1141) #b00000000000000001111111111111111) (= (mask!27614 thiss!1141) #b00000000000000011111111111111111) (= (mask!27614 thiss!1141) #b00000000000000111111111111111111) (= (mask!27614 thiss!1141) #b00000000000001111111111111111111) (= (mask!27614 thiss!1141) #b00000000000011111111111111111111) (= (mask!27614 thiss!1141) #b00000000000111111111111111111111) (= (mask!27614 thiss!1141) #b00000000001111111111111111111111) (= (mask!27614 thiss!1141) #b00000000011111111111111111111111) (= (mask!27614 thiss!1141) #b00000000111111111111111111111111) (= (mask!27614 thiss!1141) #b00000001111111111111111111111111) (= (mask!27614 thiss!1141) #b00000011111111111111111111111111) (= (mask!27614 thiss!1141) #b00000111111111111111111111111111) (= (mask!27614 thiss!1141) #b00001111111111111111111111111111) (= (mask!27614 thiss!1141) #b00011111111111111111111111111111) (= (mask!27614 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27614 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!951081 d!115141))

(declare-fun d!115143 () Bool)

(declare-fun lt!428290 () (_ BitVec 32))

(assert (=> d!115143 (and (or (bvslt lt!428290 #b00000000000000000000000000000000) (bvsge lt!428290 (size!28146 (_keys!10739 thiss!1141))) (and (bvsge lt!428290 #b00000000000000000000000000000000) (bvslt lt!428290 (size!28146 (_keys!10739 thiss!1141))))) (bvsge lt!428290 #b00000000000000000000000000000000) (bvslt lt!428290 (size!28146 (_keys!10739 thiss!1141))) (= (select (arr!27666 (_keys!10739 thiss!1141)) lt!428290) key!756))))

(declare-fun e!535582 () (_ BitVec 32))

(assert (=> d!115143 (= lt!428290 e!535582)))

(declare-fun c!99358 () Bool)

(assert (=> d!115143 (= c!99358 (= (select (arr!27666 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115143 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28146 (_keys!10739 thiss!1141))) (bvslt (size!28146 (_keys!10739 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115143 (= (arrayScanForKey!0 (_keys!10739 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428290)))

(declare-fun b!951155 () Bool)

(assert (=> b!951155 (= e!535582 #b00000000000000000000000000000000)))

(declare-fun b!951156 () Bool)

(assert (=> b!951156 (= e!535582 (arrayScanForKey!0 (_keys!10739 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115143 c!99358) b!951155))

(assert (= (and d!115143 (not c!99358)) b!951156))

(declare-fun m!882911 () Bool)

(assert (=> d!115143 m!882911))

(declare-fun m!882913 () Bool)

(assert (=> d!115143 m!882913))

(declare-fun m!882915 () Bool)

(assert (=> b!951156 m!882915))

(assert (=> b!951081 d!115143))

(declare-fun d!115145 () Bool)

(declare-fun res!637517 () Bool)

(declare-fun e!535587 () Bool)

(assert (=> d!115145 (=> res!637517 e!535587)))

(assert (=> d!115145 (= res!637517 (= (select (arr!27666 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115145 (= (arrayContainsKey!0 (_keys!10739 thiss!1141) key!756 #b00000000000000000000000000000000) e!535587)))

(declare-fun b!951161 () Bool)

(declare-fun e!535588 () Bool)

(assert (=> b!951161 (= e!535587 e!535588)))

(declare-fun res!637518 () Bool)

(assert (=> b!951161 (=> (not res!637518) (not e!535588))))

(assert (=> b!951161 (= res!637518 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28146 (_keys!10739 thiss!1141))))))

(declare-fun b!951162 () Bool)

(assert (=> b!951162 (= e!535588 (arrayContainsKey!0 (_keys!10739 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115145 (not res!637517)) b!951161))

(assert (= (and b!951161 res!637518) b!951162))

(assert (=> d!115145 m!882913))

(declare-fun m!882917 () Bool)

(assert (=> b!951162 m!882917))

(assert (=> b!951081 d!115145))

(declare-fun d!115147 () Bool)

(declare-fun e!535591 () Bool)

(assert (=> d!115147 e!535591))

(declare-fun c!99361 () Bool)

(assert (=> d!115147 (= c!99361 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428293 () Unit!31891)

(declare-fun choose!1600 (array!57539 array!57537 (_ BitVec 32) (_ BitVec 32) V!32663 V!32663 (_ BitVec 64) Int) Unit!31891)

(assert (=> d!115147 (= lt!428293 (choose!1600 (_keys!10739 thiss!1141) (_values!5824 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) key!756 (defaultEntry!5801 thiss!1141)))))

(assert (=> d!115147 (validMask!0 (mask!27614 thiss!1141))))

(assert (=> d!115147 (= (lemmaKeyInListMapIsInArray!310 (_keys!10739 thiss!1141) (_values!5824 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) key!756 (defaultEntry!5801 thiss!1141)) lt!428293)))

(declare-fun b!951167 () Bool)

(assert (=> b!951167 (= e!535591 (arrayContainsKey!0 (_keys!10739 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!951168 () Bool)

(assert (=> b!951168 (= e!535591 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115147 c!99361) b!951167))

(assert (= (and d!115147 (not c!99361)) b!951168))

(declare-fun m!882919 () Bool)

(assert (=> d!115147 m!882919))

(assert (=> d!115147 m!882855))

(assert (=> b!951167 m!882859))

(assert (=> b!951081 d!115147))

(declare-fun d!115149 () Bool)

(declare-fun res!637525 () Bool)

(declare-fun e!535594 () Bool)

(assert (=> d!115149 (=> (not res!637525) (not e!535594))))

(declare-fun simpleValid!378 (LongMapFixedSize!4960) Bool)

(assert (=> d!115149 (= res!637525 (simpleValid!378 thiss!1141))))

(assert (=> d!115149 (= (valid!1892 thiss!1141) e!535594)))

(declare-fun b!951175 () Bool)

(declare-fun res!637526 () Bool)

(assert (=> b!951175 (=> (not res!637526) (not e!535594))))

(declare-fun arrayCountValidKeys!0 (array!57539 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951175 (= res!637526 (= (arrayCountValidKeys!0 (_keys!10739 thiss!1141) #b00000000000000000000000000000000 (size!28146 (_keys!10739 thiss!1141))) (_size!2535 thiss!1141)))))

(declare-fun b!951176 () Bool)

(declare-fun res!637527 () Bool)

(assert (=> b!951176 (=> (not res!637527) (not e!535594))))

(assert (=> b!951176 (= res!637527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10739 thiss!1141) (mask!27614 thiss!1141)))))

(declare-fun b!951177 () Bool)

(declare-datatypes ((List!19357 0))(
  ( (Nil!19354) (Cons!19353 (h!20514 (_ BitVec 64)) (t!27697 List!19357)) )
))
(declare-fun arrayNoDuplicates!0 (array!57539 (_ BitVec 32) List!19357) Bool)

(assert (=> b!951177 (= e!535594 (arrayNoDuplicates!0 (_keys!10739 thiss!1141) #b00000000000000000000000000000000 Nil!19354))))

(assert (= (and d!115149 res!637525) b!951175))

(assert (= (and b!951175 res!637526) b!951176))

(assert (= (and b!951176 res!637527) b!951177))

(declare-fun m!882921 () Bool)

(assert (=> d!115149 m!882921))

(declare-fun m!882923 () Bool)

(assert (=> b!951175 m!882923))

(assert (=> b!951176 m!882847))

(declare-fun m!882925 () Bool)

(assert (=> b!951177 m!882925))

(assert (=> start!81330 d!115149))

(declare-fun b!951186 () Bool)

(declare-fun e!535601 () Bool)

(declare-fun call!41443 () Bool)

(assert (=> b!951186 (= e!535601 call!41443)))

(declare-fun b!951187 () Bool)

(declare-fun e!535603 () Bool)

(assert (=> b!951187 (= e!535601 e!535603)))

(declare-fun lt!428300 () (_ BitVec 64))

(assert (=> b!951187 (= lt!428300 (select (arr!27666 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428301 () Unit!31891)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57539 (_ BitVec 64) (_ BitVec 32)) Unit!31891)

(assert (=> b!951187 (= lt!428301 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10739 thiss!1141) lt!428300 #b00000000000000000000000000000000))))

(assert (=> b!951187 (arrayContainsKey!0 (_keys!10739 thiss!1141) lt!428300 #b00000000000000000000000000000000)))

(declare-fun lt!428302 () Unit!31891)

(assert (=> b!951187 (= lt!428302 lt!428301)))

(declare-fun res!637532 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57539 (_ BitVec 32)) SeekEntryResult!9149)

(assert (=> b!951187 (= res!637532 (= (seekEntryOrOpen!0 (select (arr!27666 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000) (_keys!10739 thiss!1141) (mask!27614 thiss!1141)) (Found!9149 #b00000000000000000000000000000000)))))

(assert (=> b!951187 (=> (not res!637532) (not e!535603))))

(declare-fun b!951188 () Bool)

(assert (=> b!951188 (= e!535603 call!41443)))

(declare-fun d!115151 () Bool)

(declare-fun res!637533 () Bool)

(declare-fun e!535602 () Bool)

(assert (=> d!115151 (=> res!637533 e!535602)))

(assert (=> d!115151 (= res!637533 (bvsge #b00000000000000000000000000000000 (size!28146 (_keys!10739 thiss!1141))))))

(assert (=> d!115151 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10739 thiss!1141) (mask!27614 thiss!1141)) e!535602)))

(declare-fun bm!41440 () Bool)

(assert (=> bm!41440 (= call!41443 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10739 thiss!1141) (mask!27614 thiss!1141)))))

(declare-fun b!951189 () Bool)

(assert (=> b!951189 (= e!535602 e!535601)))

(declare-fun c!99364 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!951189 (= c!99364 (validKeyInArray!0 (select (arr!27666 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115151 (not res!637533)) b!951189))

(assert (= (and b!951189 c!99364) b!951187))

(assert (= (and b!951189 (not c!99364)) b!951186))

(assert (= (and b!951187 res!637532) b!951188))

(assert (= (or b!951188 b!951186) bm!41440))

(assert (=> b!951187 m!882913))

(declare-fun m!882927 () Bool)

(assert (=> b!951187 m!882927))

(declare-fun m!882929 () Bool)

(assert (=> b!951187 m!882929))

(assert (=> b!951187 m!882913))

(declare-fun m!882931 () Bool)

(assert (=> b!951187 m!882931))

(declare-fun m!882933 () Bool)

(assert (=> bm!41440 m!882933))

(assert (=> b!951189 m!882913))

(assert (=> b!951189 m!882913))

(declare-fun m!882935 () Bool)

(assert (=> b!951189 m!882935))

(assert (=> b!951085 d!115151))

(declare-fun d!115153 () Bool)

(declare-fun lt!428314 () SeekEntryResult!9149)

(assert (=> d!115153 (and (or ((_ is MissingVacant!9149) lt!428314) (not ((_ is Found!9149) lt!428314)) (and (bvsge (index!38968 lt!428314) #b00000000000000000000000000000000) (bvslt (index!38968 lt!428314) (size!28146 (_keys!10739 thiss!1141))))) (not ((_ is MissingVacant!9149) lt!428314)) (or (not ((_ is Found!9149) lt!428314)) (= (select (arr!27666 (_keys!10739 thiss!1141)) (index!38968 lt!428314)) key!756)))))

(declare-fun e!535611 () SeekEntryResult!9149)

(assert (=> d!115153 (= lt!428314 e!535611)))

(declare-fun c!99371 () Bool)

(declare-fun lt!428311 () SeekEntryResult!9149)

(assert (=> d!115153 (= c!99371 (and ((_ is Intermediate!9149) lt!428311) (undefined!9961 lt!428311)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57539 (_ BitVec 32)) SeekEntryResult!9149)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115153 (= lt!428311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27614 thiss!1141)) key!756 (_keys!10739 thiss!1141) (mask!27614 thiss!1141)))))

(assert (=> d!115153 (validMask!0 (mask!27614 thiss!1141))))

(assert (=> d!115153 (= (seekEntry!0 key!756 (_keys!10739 thiss!1141) (mask!27614 thiss!1141)) lt!428314)))

(declare-fun b!951202 () Bool)

(assert (=> b!951202 (= e!535611 Undefined!9149)))

(declare-fun b!951203 () Bool)

(declare-fun e!535610 () SeekEntryResult!9149)

(assert (=> b!951203 (= e!535610 (Found!9149 (index!38969 lt!428311)))))

(declare-fun b!951204 () Bool)

(declare-fun e!535612 () SeekEntryResult!9149)

(declare-fun lt!428313 () SeekEntryResult!9149)

(assert (=> b!951204 (= e!535612 (ite ((_ is MissingVacant!9149) lt!428313) (MissingZero!9149 (index!38970 lt!428313)) lt!428313))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57539 (_ BitVec 32)) SeekEntryResult!9149)

(assert (=> b!951204 (= lt!428313 (seekKeyOrZeroReturnVacant!0 (x!81842 lt!428311) (index!38969 lt!428311) (index!38969 lt!428311) key!756 (_keys!10739 thiss!1141) (mask!27614 thiss!1141)))))

(declare-fun b!951205 () Bool)

(declare-fun c!99372 () Bool)

(declare-fun lt!428312 () (_ BitVec 64))

(assert (=> b!951205 (= c!99372 (= lt!428312 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!951205 (= e!535610 e!535612)))

(declare-fun b!951206 () Bool)

(assert (=> b!951206 (= e!535612 (MissingZero!9149 (index!38969 lt!428311)))))

(declare-fun b!951207 () Bool)

(assert (=> b!951207 (= e!535611 e!535610)))

(assert (=> b!951207 (= lt!428312 (select (arr!27666 (_keys!10739 thiss!1141)) (index!38969 lt!428311)))))

(declare-fun c!99373 () Bool)

(assert (=> b!951207 (= c!99373 (= lt!428312 key!756))))

(assert (= (and d!115153 c!99371) b!951202))

(assert (= (and d!115153 (not c!99371)) b!951207))

(assert (= (and b!951207 c!99373) b!951203))

(assert (= (and b!951207 (not c!99373)) b!951205))

(assert (= (and b!951205 c!99372) b!951206))

(assert (= (and b!951205 (not c!99372)) b!951204))

(declare-fun m!882937 () Bool)

(assert (=> d!115153 m!882937))

(declare-fun m!882939 () Bool)

(assert (=> d!115153 m!882939))

(assert (=> d!115153 m!882939))

(declare-fun m!882941 () Bool)

(assert (=> d!115153 m!882941))

(assert (=> d!115153 m!882855))

(declare-fun m!882943 () Bool)

(assert (=> b!951204 m!882943))

(declare-fun m!882945 () Bool)

(assert (=> b!951207 m!882945))

(assert (=> b!951087 d!115153))

(declare-fun d!115155 () Bool)

(declare-fun e!535617 () Bool)

(assert (=> d!115155 e!535617))

(declare-fun res!637536 () Bool)

(assert (=> d!115155 (=> res!637536 e!535617)))

(declare-fun lt!428323 () Bool)

(assert (=> d!115155 (= res!637536 (not lt!428323))))

(declare-fun lt!428325 () Bool)

(assert (=> d!115155 (= lt!428323 lt!428325)))

(declare-fun lt!428324 () Unit!31891)

(declare-fun e!535618 () Unit!31891)

(assert (=> d!115155 (= lt!428324 e!535618)))

(declare-fun c!99376 () Bool)

(assert (=> d!115155 (= c!99376 lt!428325)))

(declare-fun containsKey!468 (List!19355 (_ BitVec 64)) Bool)

(assert (=> d!115155 (= lt!428325 (containsKey!468 (toList!6165 (getCurrentListMap!3327 (_keys!10739 thiss!1141) (_values!5824 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141))) key!756))))

(assert (=> d!115155 (= (contains!5201 (getCurrentListMap!3327 (_keys!10739 thiss!1141) (_values!5824 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)) key!756) lt!428323)))

(declare-fun b!951214 () Bool)

(declare-fun lt!428326 () Unit!31891)

(assert (=> b!951214 (= e!535618 lt!428326)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!363 (List!19355 (_ BitVec 64)) Unit!31891)

(assert (=> b!951214 (= lt!428326 (lemmaContainsKeyImpliesGetValueByKeyDefined!363 (toList!6165 (getCurrentListMap!3327 (_keys!10739 thiss!1141) (_values!5824 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141))) key!756))))

(declare-datatypes ((Option!510 0))(
  ( (Some!509 (v!12986 V!32663)) (None!508) )
))
(declare-fun isDefined!376 (Option!510) Bool)

(declare-fun getValueByKey!504 (List!19355 (_ BitVec 64)) Option!510)

(assert (=> b!951214 (isDefined!376 (getValueByKey!504 (toList!6165 (getCurrentListMap!3327 (_keys!10739 thiss!1141) (_values!5824 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141))) key!756))))

(declare-fun b!951215 () Bool)

(declare-fun Unit!31893 () Unit!31891)

(assert (=> b!951215 (= e!535618 Unit!31893)))

(declare-fun b!951216 () Bool)

(assert (=> b!951216 (= e!535617 (isDefined!376 (getValueByKey!504 (toList!6165 (getCurrentListMap!3327 (_keys!10739 thiss!1141) (_values!5824 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141))) key!756)))))

(assert (= (and d!115155 c!99376) b!951214))

(assert (= (and d!115155 (not c!99376)) b!951215))

(assert (= (and d!115155 (not res!637536)) b!951216))

(declare-fun m!882947 () Bool)

(assert (=> d!115155 m!882947))

(declare-fun m!882949 () Bool)

(assert (=> b!951214 m!882949))

(declare-fun m!882951 () Bool)

(assert (=> b!951214 m!882951))

(assert (=> b!951214 m!882951))

(declare-fun m!882953 () Bool)

(assert (=> b!951214 m!882953))

(assert (=> b!951216 m!882951))

(assert (=> b!951216 m!882951))

(assert (=> b!951216 m!882953))

(assert (=> b!951082 d!115155))

(declare-fun b!951259 () Bool)

(declare-fun e!535657 () ListLongMap!12299)

(declare-fun e!535652 () ListLongMap!12299)

(assert (=> b!951259 (= e!535657 e!535652)))

(declare-fun c!99393 () Bool)

(assert (=> b!951259 (= c!99393 (and (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951260 () Bool)

(declare-fun call!41463 () ListLongMap!12299)

(declare-fun +!2885 (ListLongMap!12299 tuple2!13612) ListLongMap!12299)

(assert (=> b!951260 (= e!535657 (+!2885 call!41463 (tuple2!13613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5637 thiss!1141))))))

(declare-fun b!951261 () Bool)

(declare-fun e!535647 () Bool)

(declare-fun call!41459 () Bool)

(assert (=> b!951261 (= e!535647 (not call!41459))))

(declare-fun b!951262 () Bool)

(declare-fun e!535645 () Bool)

(declare-fun lt!428389 () ListLongMap!12299)

(declare-fun apply!875 (ListLongMap!12299 (_ BitVec 64)) V!32663)

(assert (=> b!951262 (= e!535645 (= (apply!875 lt!428389 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5637 thiss!1141)))))

(declare-fun b!951263 () Bool)

(declare-fun e!535650 () Bool)

(declare-fun call!41464 () Bool)

(assert (=> b!951263 (= e!535650 (not call!41464))))

(declare-fun b!951264 () Bool)

(declare-fun e!535646 () Unit!31891)

(declare-fun Unit!31894 () Unit!31891)

(assert (=> b!951264 (= e!535646 Unit!31894)))

(declare-fun b!951265 () Bool)

(declare-fun e!535656 () Bool)

(assert (=> b!951265 (= e!535656 e!535650)))

(declare-fun c!99389 () Bool)

(assert (=> b!951265 (= c!99389 (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951266 () Bool)

(declare-fun e!535648 () Bool)

(assert (=> b!951266 (= e!535647 e!535648)))

(declare-fun res!637557 () Bool)

(assert (=> b!951266 (= res!637557 call!41459)))

(assert (=> b!951266 (=> (not res!637557) (not e!535648))))

(declare-fun b!951267 () Bool)

(assert (=> b!951267 (= e!535648 (= (apply!875 lt!428389 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5637 thiss!1141)))))

(declare-fun bm!41455 () Bool)

(declare-fun call!41462 () ListLongMap!12299)

(declare-fun call!41458 () ListLongMap!12299)

(assert (=> bm!41455 (= call!41462 call!41458)))

(declare-fun b!951268 () Bool)

(declare-fun e!535654 () ListLongMap!12299)

(declare-fun call!41460 () ListLongMap!12299)

(assert (=> b!951268 (= e!535654 call!41460)))

(declare-fun b!951269 () Bool)

(declare-fun e!535649 () Bool)

(declare-fun get!14541 (ValueCell!9905 V!32663) V!32663)

(declare-fun dynLambda!1641 (Int (_ BitVec 64)) V!32663)

(assert (=> b!951269 (= e!535649 (= (apply!875 lt!428389 (select (arr!27666 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000)) (get!14541 (select (arr!27665 (_values!5824 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1641 (defaultEntry!5801 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951269 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28145 (_values!5824 thiss!1141))))))

(assert (=> b!951269 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28146 (_keys!10739 thiss!1141))))))

(declare-fun b!951270 () Bool)

(assert (=> b!951270 (= e!535652 call!41460)))

(declare-fun d!115157 () Bool)

(assert (=> d!115157 e!535656))

(declare-fun res!637556 () Bool)

(assert (=> d!115157 (=> (not res!637556) (not e!535656))))

(assert (=> d!115157 (= res!637556 (or (bvsge #b00000000000000000000000000000000 (size!28146 (_keys!10739 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28146 (_keys!10739 thiss!1141))))))))

(declare-fun lt!428382 () ListLongMap!12299)

(assert (=> d!115157 (= lt!428389 lt!428382)))

(declare-fun lt!428372 () Unit!31891)

(assert (=> d!115157 (= lt!428372 e!535646)))

(declare-fun c!99394 () Bool)

(declare-fun e!535651 () Bool)

(assert (=> d!115157 (= c!99394 e!535651)))

(declare-fun res!637559 () Bool)

(assert (=> d!115157 (=> (not res!637559) (not e!535651))))

(assert (=> d!115157 (= res!637559 (bvslt #b00000000000000000000000000000000 (size!28146 (_keys!10739 thiss!1141))))))

(assert (=> d!115157 (= lt!428382 e!535657)))

(declare-fun c!99391 () Bool)

(assert (=> d!115157 (= c!99391 (and (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115157 (validMask!0 (mask!27614 thiss!1141))))

(assert (=> d!115157 (= (getCurrentListMap!3327 (_keys!10739 thiss!1141) (_values!5824 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)) lt!428389)))

(declare-fun bm!41456 () Bool)

(assert (=> bm!41456 (= call!41460 call!41463)))

(declare-fun bm!41457 () Bool)

(declare-fun call!41461 () ListLongMap!12299)

(assert (=> bm!41457 (= call!41461 call!41462)))

(declare-fun bm!41458 () Bool)

(assert (=> bm!41458 (= call!41464 (contains!5201 lt!428389 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951271 () Bool)

(declare-fun e!535655 () Bool)

(assert (=> b!951271 (= e!535655 (validKeyInArray!0 (select (arr!27666 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951272 () Bool)

(declare-fun e!535653 () Bool)

(assert (=> b!951272 (= e!535653 e!535649)))

(declare-fun res!637563 () Bool)

(assert (=> b!951272 (=> (not res!637563) (not e!535649))))

(assert (=> b!951272 (= res!637563 (contains!5201 lt!428389 (select (arr!27666 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951272 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28146 (_keys!10739 thiss!1141))))))

(declare-fun b!951273 () Bool)

(declare-fun res!637562 () Bool)

(assert (=> b!951273 (=> (not res!637562) (not e!535656))))

(assert (=> b!951273 (= res!637562 e!535647)))

(declare-fun c!99390 () Bool)

(assert (=> b!951273 (= c!99390 (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!951274 () Bool)

(declare-fun c!99392 () Bool)

(assert (=> b!951274 (= c!99392 (and (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!951274 (= e!535652 e!535654)))

(declare-fun b!951275 () Bool)

(declare-fun res!637560 () Bool)

(assert (=> b!951275 (=> (not res!637560) (not e!535656))))

(assert (=> b!951275 (= res!637560 e!535653)))

(declare-fun res!637561 () Bool)

(assert (=> b!951275 (=> res!637561 e!535653)))

(assert (=> b!951275 (= res!637561 (not e!535655))))

(declare-fun res!637558 () Bool)

(assert (=> b!951275 (=> (not res!637558) (not e!535655))))

(assert (=> b!951275 (= res!637558 (bvslt #b00000000000000000000000000000000 (size!28146 (_keys!10739 thiss!1141))))))

(declare-fun b!951276 () Bool)

(assert (=> b!951276 (= e!535654 call!41461)))

(declare-fun bm!41459 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3357 (array!57539 array!57537 (_ BitVec 32) (_ BitVec 32) V!32663 V!32663 (_ BitVec 32) Int) ListLongMap!12299)

(assert (=> bm!41459 (= call!41458 (getCurrentListMapNoExtraKeys!3357 (_keys!10739 thiss!1141) (_values!5824 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)))))

(declare-fun b!951277 () Bool)

(declare-fun lt!428381 () Unit!31891)

(assert (=> b!951277 (= e!535646 lt!428381)))

(declare-fun lt!428392 () ListLongMap!12299)

(assert (=> b!951277 (= lt!428392 (getCurrentListMapNoExtraKeys!3357 (_keys!10739 thiss!1141) (_values!5824 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)))))

(declare-fun lt!428385 () (_ BitVec 64))

(assert (=> b!951277 (= lt!428385 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428386 () (_ BitVec 64))

(assert (=> b!951277 (= lt!428386 (select (arr!27666 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428371 () Unit!31891)

(declare-fun addStillContains!574 (ListLongMap!12299 (_ BitVec 64) V!32663 (_ BitVec 64)) Unit!31891)

(assert (=> b!951277 (= lt!428371 (addStillContains!574 lt!428392 lt!428385 (zeroValue!5637 thiss!1141) lt!428386))))

(assert (=> b!951277 (contains!5201 (+!2885 lt!428392 (tuple2!13613 lt!428385 (zeroValue!5637 thiss!1141))) lt!428386)))

(declare-fun lt!428380 () Unit!31891)

(assert (=> b!951277 (= lt!428380 lt!428371)))

(declare-fun lt!428374 () ListLongMap!12299)

(assert (=> b!951277 (= lt!428374 (getCurrentListMapNoExtraKeys!3357 (_keys!10739 thiss!1141) (_values!5824 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)))))

(declare-fun lt!428377 () (_ BitVec 64))

(assert (=> b!951277 (= lt!428377 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428373 () (_ BitVec 64))

(assert (=> b!951277 (= lt!428373 (select (arr!27666 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428388 () Unit!31891)

(declare-fun addApplyDifferent!454 (ListLongMap!12299 (_ BitVec 64) V!32663 (_ BitVec 64)) Unit!31891)

(assert (=> b!951277 (= lt!428388 (addApplyDifferent!454 lt!428374 lt!428377 (minValue!5637 thiss!1141) lt!428373))))

(assert (=> b!951277 (= (apply!875 (+!2885 lt!428374 (tuple2!13613 lt!428377 (minValue!5637 thiss!1141))) lt!428373) (apply!875 lt!428374 lt!428373))))

(declare-fun lt!428383 () Unit!31891)

(assert (=> b!951277 (= lt!428383 lt!428388)))

(declare-fun lt!428390 () ListLongMap!12299)

(assert (=> b!951277 (= lt!428390 (getCurrentListMapNoExtraKeys!3357 (_keys!10739 thiss!1141) (_values!5824 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)))))

(declare-fun lt!428384 () (_ BitVec 64))

(assert (=> b!951277 (= lt!428384 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428379 () (_ BitVec 64))

(assert (=> b!951277 (= lt!428379 (select (arr!27666 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428378 () Unit!31891)

(assert (=> b!951277 (= lt!428378 (addApplyDifferent!454 lt!428390 lt!428384 (zeroValue!5637 thiss!1141) lt!428379))))

(assert (=> b!951277 (= (apply!875 (+!2885 lt!428390 (tuple2!13613 lt!428384 (zeroValue!5637 thiss!1141))) lt!428379) (apply!875 lt!428390 lt!428379))))

(declare-fun lt!428387 () Unit!31891)

(assert (=> b!951277 (= lt!428387 lt!428378)))

(declare-fun lt!428391 () ListLongMap!12299)

(assert (=> b!951277 (= lt!428391 (getCurrentListMapNoExtraKeys!3357 (_keys!10739 thiss!1141) (_values!5824 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)))))

(declare-fun lt!428375 () (_ BitVec 64))

(assert (=> b!951277 (= lt!428375 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428376 () (_ BitVec 64))

(assert (=> b!951277 (= lt!428376 (select (arr!27666 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951277 (= lt!428381 (addApplyDifferent!454 lt!428391 lt!428375 (minValue!5637 thiss!1141) lt!428376))))

(assert (=> b!951277 (= (apply!875 (+!2885 lt!428391 (tuple2!13613 lt!428375 (minValue!5637 thiss!1141))) lt!428376) (apply!875 lt!428391 lt!428376))))

(declare-fun bm!41460 () Bool)

(assert (=> bm!41460 (= call!41463 (+!2885 (ite c!99391 call!41458 (ite c!99393 call!41462 call!41461)) (ite (or c!99391 c!99393) (tuple2!13613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5637 thiss!1141)) (tuple2!13613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5637 thiss!1141)))))))

(declare-fun bm!41461 () Bool)

(assert (=> bm!41461 (= call!41459 (contains!5201 lt!428389 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951278 () Bool)

(assert (=> b!951278 (= e!535650 e!535645)))

(declare-fun res!637555 () Bool)

(assert (=> b!951278 (= res!637555 call!41464)))

(assert (=> b!951278 (=> (not res!637555) (not e!535645))))

(declare-fun b!951279 () Bool)

(assert (=> b!951279 (= e!535651 (validKeyInArray!0 (select (arr!27666 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115157 c!99391) b!951260))

(assert (= (and d!115157 (not c!99391)) b!951259))

(assert (= (and b!951259 c!99393) b!951270))

(assert (= (and b!951259 (not c!99393)) b!951274))

(assert (= (and b!951274 c!99392) b!951268))

(assert (= (and b!951274 (not c!99392)) b!951276))

(assert (= (or b!951268 b!951276) bm!41457))

(assert (= (or b!951270 bm!41457) bm!41455))

(assert (= (or b!951270 b!951268) bm!41456))

(assert (= (or b!951260 bm!41455) bm!41459))

(assert (= (or b!951260 bm!41456) bm!41460))

(assert (= (and d!115157 res!637559) b!951279))

(assert (= (and d!115157 c!99394) b!951277))

(assert (= (and d!115157 (not c!99394)) b!951264))

(assert (= (and d!115157 res!637556) b!951275))

(assert (= (and b!951275 res!637558) b!951271))

(assert (= (and b!951275 (not res!637561)) b!951272))

(assert (= (and b!951272 res!637563) b!951269))

(assert (= (and b!951275 res!637560) b!951273))

(assert (= (and b!951273 c!99390) b!951266))

(assert (= (and b!951273 (not c!99390)) b!951261))

(assert (= (and b!951266 res!637557) b!951267))

(assert (= (or b!951266 b!951261) bm!41461))

(assert (= (and b!951273 res!637562) b!951265))

(assert (= (and b!951265 c!99389) b!951278))

(assert (= (and b!951265 (not c!99389)) b!951263))

(assert (= (and b!951278 res!637555) b!951262))

(assert (= (or b!951278 b!951263) bm!41458))

(declare-fun b_lambda!14373 () Bool)

(assert (=> (not b_lambda!14373) (not b!951269)))

(declare-fun t!27696 () Bool)

(declare-fun tb!6191 () Bool)

(assert (=> (and b!951090 (= (defaultEntry!5801 thiss!1141) (defaultEntry!5801 thiss!1141)) t!27696) tb!6191))

(declare-fun result!12311 () Bool)

(assert (=> tb!6191 (= result!12311 tp_is_empty!20773)))

(assert (=> b!951269 t!27696))

(declare-fun b_and!29713 () Bool)

(assert (= b_and!29707 (and (=> t!27696 result!12311) b_and!29713)))

(assert (=> b!951269 m!882913))

(declare-fun m!882955 () Bool)

(assert (=> b!951269 m!882955))

(declare-fun m!882957 () Bool)

(assert (=> b!951269 m!882957))

(declare-fun m!882959 () Bool)

(assert (=> b!951269 m!882959))

(assert (=> b!951269 m!882957))

(assert (=> b!951269 m!882913))

(declare-fun m!882961 () Bool)

(assert (=> b!951269 m!882961))

(assert (=> b!951269 m!882955))

(assert (=> b!951272 m!882913))

(assert (=> b!951272 m!882913))

(declare-fun m!882963 () Bool)

(assert (=> b!951272 m!882963))

(declare-fun m!882965 () Bool)

(assert (=> bm!41459 m!882965))

(declare-fun m!882967 () Bool)

(assert (=> bm!41458 m!882967))

(assert (=> b!951279 m!882913))

(assert (=> b!951279 m!882913))

(assert (=> b!951279 m!882935))

(assert (=> d!115157 m!882855))

(declare-fun m!882969 () Bool)

(assert (=> bm!41460 m!882969))

(assert (=> b!951271 m!882913))

(assert (=> b!951271 m!882913))

(assert (=> b!951271 m!882935))

(declare-fun m!882971 () Bool)

(assert (=> b!951267 m!882971))

(declare-fun m!882973 () Bool)

(assert (=> b!951277 m!882973))

(declare-fun m!882975 () Bool)

(assert (=> b!951277 m!882975))

(declare-fun m!882977 () Bool)

(assert (=> b!951277 m!882977))

(declare-fun m!882979 () Bool)

(assert (=> b!951277 m!882979))

(declare-fun m!882981 () Bool)

(assert (=> b!951277 m!882981))

(declare-fun m!882983 () Bool)

(assert (=> b!951277 m!882983))

(declare-fun m!882985 () Bool)

(assert (=> b!951277 m!882985))

(declare-fun m!882987 () Bool)

(assert (=> b!951277 m!882987))

(assert (=> b!951277 m!882983))

(declare-fun m!882989 () Bool)

(assert (=> b!951277 m!882989))

(declare-fun m!882991 () Bool)

(assert (=> b!951277 m!882991))

(declare-fun m!882993 () Bool)

(assert (=> b!951277 m!882993))

(assert (=> b!951277 m!882965))

(assert (=> b!951277 m!882913))

(declare-fun m!882995 () Bool)

(assert (=> b!951277 m!882995))

(declare-fun m!882997 () Bool)

(assert (=> b!951277 m!882997))

(assert (=> b!951277 m!882995))

(declare-fun m!882999 () Bool)

(assert (=> b!951277 m!882999))

(assert (=> b!951277 m!882979))

(assert (=> b!951277 m!882993))

(declare-fun m!883001 () Bool)

(assert (=> b!951277 m!883001))

(declare-fun m!883003 () Bool)

(assert (=> bm!41461 m!883003))

(declare-fun m!883005 () Bool)

(assert (=> b!951260 m!883005))

(declare-fun m!883007 () Bool)

(assert (=> b!951262 m!883007))

(assert (=> b!951082 d!115157))

(declare-fun b!951288 () Bool)

(declare-fun e!535663 () Bool)

(assert (=> b!951288 (= e!535663 tp_is_empty!20773)))

(declare-fun b!951289 () Bool)

(declare-fun e!535662 () Bool)

(assert (=> b!951289 (= e!535662 tp_is_empty!20773)))

(declare-fun mapNonEmpty!33093 () Bool)

(declare-fun mapRes!33093 () Bool)

(declare-fun tp!63420 () Bool)

(assert (=> mapNonEmpty!33093 (= mapRes!33093 (and tp!63420 e!535663))))

(declare-fun mapValue!33093 () ValueCell!9905)

(declare-fun mapRest!33093 () (Array (_ BitVec 32) ValueCell!9905))

(declare-fun mapKey!33093 () (_ BitVec 32))

(assert (=> mapNonEmpty!33093 (= mapRest!33084 (store mapRest!33093 mapKey!33093 mapValue!33093))))

(declare-fun mapIsEmpty!33093 () Bool)

(assert (=> mapIsEmpty!33093 mapRes!33093))

(declare-fun condMapEmpty!33093 () Bool)

(declare-fun mapDefault!33093 () ValueCell!9905)

(assert (=> mapNonEmpty!33084 (= condMapEmpty!33093 (= mapRest!33084 ((as const (Array (_ BitVec 32) ValueCell!9905)) mapDefault!33093)))))

(assert (=> mapNonEmpty!33084 (= tp!63405 (and e!535662 mapRes!33093))))

(assert (= (and mapNonEmpty!33084 condMapEmpty!33093) mapIsEmpty!33093))

(assert (= (and mapNonEmpty!33084 (not condMapEmpty!33093)) mapNonEmpty!33093))

(assert (= (and mapNonEmpty!33093 ((_ is ValueCellFull!9905) mapValue!33093)) b!951288))

(assert (= (and mapNonEmpty!33084 ((_ is ValueCellFull!9905) mapDefault!33093)) b!951289))

(declare-fun m!883009 () Bool)

(assert (=> mapNonEmpty!33093 m!883009))

(declare-fun b_lambda!14375 () Bool)

(assert (= b_lambda!14373 (or (and b!951090 b_free!18265) b_lambda!14375)))

(check-sat (not bm!41461) (not b!951269) (not b!951267) (not b!951260) (not b!951214) (not d!115155) tp_is_empty!20773 (not b!951216) (not bm!41440) (not b!951189) b_and!29713 (not b!951204) (not mapNonEmpty!33093) (not b!951277) (not d!115147) (not d!115153) (not d!115157) (not b!951262) (not bm!41459) (not b!951187) (not b!951272) (not b!951279) (not d!115149) (not bm!41458) (not b_lambda!14375) (not b!951162) (not b!951177) (not b!951176) (not bm!41460) (not b!951156) (not b!951167) (not b_next!18265) (not b!951175) (not b!951271))
(check-sat b_and!29713 (not b_next!18265))
