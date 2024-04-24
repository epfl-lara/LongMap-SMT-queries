; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80334 () Bool)

(assert start!80334)

(declare-fun b!942863 () Bool)

(declare-fun b_free!17929 () Bool)

(declare-fun b_next!17929 () Bool)

(assert (=> b!942863 (= b_free!17929 (not b_next!17929))))

(declare-fun tp!62281 () Bool)

(declare-fun b_and!29351 () Bool)

(assert (=> b!942863 (= tp!62281 b_and!29351)))

(declare-fun b!942858 () Bool)

(declare-fun e!530175 () Bool)

(declare-fun tp_is_empty!20437 () Bool)

(assert (=> b!942858 (= e!530175 tp_is_empty!20437)))

(declare-fun mapIsEmpty!32464 () Bool)

(declare-fun mapRes!32464 () Bool)

(assert (=> mapIsEmpty!32464 mapRes!32464))

(declare-fun b!942859 () Bool)

(declare-fun res!633427 () Bool)

(declare-fun e!530174 () Bool)

(assert (=> b!942859 (=> (not res!633427) (not e!530174))))

(declare-datatypes ((V!32215 0))(
  ( (V!32216 (val!10269 Int)) )
))
(declare-datatypes ((ValueCell!9737 0))(
  ( (ValueCellFull!9737 (v!12797 V!32215)) (EmptyCell!9737) )
))
(declare-datatypes ((array!56883 0))(
  ( (array!56884 (arr!27367 (Array (_ BitVec 32) ValueCell!9737)) (size!27832 (_ BitVec 32))) )
))
(declare-datatypes ((array!56885 0))(
  ( (array!56886 (arr!27368 (Array (_ BitVec 32) (_ BitVec 64))) (size!27833 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4624 0))(
  ( (LongMapFixedSize!4625 (defaultEntry!5603 Int) (mask!27235 (_ BitVec 32)) (extraKeys!5335 (_ BitVec 32)) (zeroValue!5439 V!32215) (minValue!5439 V!32215) (_size!2367 (_ BitVec 32)) (_keys!10495 array!56885) (_values!5626 array!56883) (_vacant!2367 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4624)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942859 (= res!633427 (validMask!0 (mask!27235 thiss!1141)))))

(declare-fun b!942860 () Bool)

(declare-fun res!633428 () Bool)

(assert (=> b!942860 (=> (not res!633428) (not e!530174))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!942860 (= res!633428 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!633426 () Bool)

(assert (=> start!80334 (=> (not res!633426) (not e!530174))))

(declare-fun valid!1777 (LongMapFixedSize!4624) Bool)

(assert (=> start!80334 (= res!633426 (valid!1777 thiss!1141))))

(assert (=> start!80334 e!530174))

(declare-fun e!530177 () Bool)

(assert (=> start!80334 e!530177))

(assert (=> start!80334 true))

(declare-fun b!942861 () Bool)

(assert (=> b!942861 (= e!530174 (and (= (size!27832 (_values!5626 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27235 thiss!1141))) (= (size!27833 (_keys!10495 thiss!1141)) (size!27832 (_values!5626 thiss!1141))) (bvsge (mask!27235 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5335 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5335 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942862 () Bool)

(declare-fun e!530176 () Bool)

(assert (=> b!942862 (= e!530176 (and e!530175 mapRes!32464))))

(declare-fun condMapEmpty!32464 () Bool)

(declare-fun mapDefault!32464 () ValueCell!9737)

(assert (=> b!942862 (= condMapEmpty!32464 (= (arr!27367 (_values!5626 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9737)) mapDefault!32464)))))

(declare-fun array_inv!21358 (array!56885) Bool)

(declare-fun array_inv!21359 (array!56883) Bool)

(assert (=> b!942863 (= e!530177 (and tp!62281 tp_is_empty!20437 (array_inv!21358 (_keys!10495 thiss!1141)) (array_inv!21359 (_values!5626 thiss!1141)) e!530176))))

(declare-fun b!942864 () Bool)

(declare-fun e!530178 () Bool)

(assert (=> b!942864 (= e!530178 tp_is_empty!20437)))

(declare-fun b!942865 () Bool)

(declare-fun res!633429 () Bool)

(assert (=> b!942865 (=> (not res!633429) (not e!530174))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!8982 0))(
  ( (MissingZero!8982 (index!38299 (_ BitVec 32))) (Found!8982 (index!38300 (_ BitVec 32))) (Intermediate!8982 (undefined!9794 Bool) (index!38301 (_ BitVec 32)) (x!80828 (_ BitVec 32))) (Undefined!8982) (MissingVacant!8982 (index!38302 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56885 (_ BitVec 32)) SeekEntryResult!8982)

(assert (=> b!942865 (= res!633429 (not ((_ is Found!8982) (seekEntry!0 key!756 (_keys!10495 thiss!1141) (mask!27235 thiss!1141)))))))

(declare-fun mapNonEmpty!32464 () Bool)

(declare-fun tp!62280 () Bool)

(assert (=> mapNonEmpty!32464 (= mapRes!32464 (and tp!62280 e!530178))))

(declare-fun mapKey!32464 () (_ BitVec 32))

(declare-fun mapRest!32464 () (Array (_ BitVec 32) ValueCell!9737))

(declare-fun mapValue!32464 () ValueCell!9737)

(assert (=> mapNonEmpty!32464 (= (arr!27367 (_values!5626 thiss!1141)) (store mapRest!32464 mapKey!32464 mapValue!32464))))

(assert (= (and start!80334 res!633426) b!942860))

(assert (= (and b!942860 res!633428) b!942865))

(assert (= (and b!942865 res!633429) b!942859))

(assert (= (and b!942859 res!633427) b!942861))

(assert (= (and b!942862 condMapEmpty!32464) mapIsEmpty!32464))

(assert (= (and b!942862 (not condMapEmpty!32464)) mapNonEmpty!32464))

(assert (= (and mapNonEmpty!32464 ((_ is ValueCellFull!9737) mapValue!32464)) b!942864))

(assert (= (and b!942862 ((_ is ValueCellFull!9737) mapDefault!32464)) b!942858))

(assert (= b!942863 b!942862))

(assert (= start!80334 b!942863))

(declare-fun m!878067 () Bool)

(assert (=> b!942863 m!878067))

(declare-fun m!878069 () Bool)

(assert (=> b!942863 m!878069))

(declare-fun m!878071 () Bool)

(assert (=> mapNonEmpty!32464 m!878071))

(declare-fun m!878073 () Bool)

(assert (=> b!942859 m!878073))

(declare-fun m!878075 () Bool)

(assert (=> start!80334 m!878075))

(declare-fun m!878077 () Bool)

(assert (=> b!942865 m!878077))

(check-sat (not b_next!17929) b_and!29351 (not b!942865) (not start!80334) (not mapNonEmpty!32464) tp_is_empty!20437 (not b!942859) (not b!942863))
(check-sat b_and!29351 (not b_next!17929))
(get-model)

(declare-fun d!114455 () Bool)

(assert (=> d!114455 (= (array_inv!21358 (_keys!10495 thiss!1141)) (bvsge (size!27833 (_keys!10495 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942863 d!114455))

(declare-fun d!114457 () Bool)

(assert (=> d!114457 (= (array_inv!21359 (_values!5626 thiss!1141)) (bvsge (size!27832 (_values!5626 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942863 d!114457))

(declare-fun d!114459 () Bool)

(assert (=> d!114459 (= (validMask!0 (mask!27235 thiss!1141)) (and (or (= (mask!27235 thiss!1141) #b00000000000000000000000000000111) (= (mask!27235 thiss!1141) #b00000000000000000000000000001111) (= (mask!27235 thiss!1141) #b00000000000000000000000000011111) (= (mask!27235 thiss!1141) #b00000000000000000000000000111111) (= (mask!27235 thiss!1141) #b00000000000000000000000001111111) (= (mask!27235 thiss!1141) #b00000000000000000000000011111111) (= (mask!27235 thiss!1141) #b00000000000000000000000111111111) (= (mask!27235 thiss!1141) #b00000000000000000000001111111111) (= (mask!27235 thiss!1141) #b00000000000000000000011111111111) (= (mask!27235 thiss!1141) #b00000000000000000000111111111111) (= (mask!27235 thiss!1141) #b00000000000000000001111111111111) (= (mask!27235 thiss!1141) #b00000000000000000011111111111111) (= (mask!27235 thiss!1141) #b00000000000000000111111111111111) (= (mask!27235 thiss!1141) #b00000000000000001111111111111111) (= (mask!27235 thiss!1141) #b00000000000000011111111111111111) (= (mask!27235 thiss!1141) #b00000000000000111111111111111111) (= (mask!27235 thiss!1141) #b00000000000001111111111111111111) (= (mask!27235 thiss!1141) #b00000000000011111111111111111111) (= (mask!27235 thiss!1141) #b00000000000111111111111111111111) (= (mask!27235 thiss!1141) #b00000000001111111111111111111111) (= (mask!27235 thiss!1141) #b00000000011111111111111111111111) (= (mask!27235 thiss!1141) #b00000000111111111111111111111111) (= (mask!27235 thiss!1141) #b00000001111111111111111111111111) (= (mask!27235 thiss!1141) #b00000011111111111111111111111111) (= (mask!27235 thiss!1141) #b00000111111111111111111111111111) (= (mask!27235 thiss!1141) #b00001111111111111111111111111111) (= (mask!27235 thiss!1141) #b00011111111111111111111111111111) (= (mask!27235 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27235 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!942859 d!114459))

(declare-fun d!114461 () Bool)

(declare-fun res!633460 () Bool)

(declare-fun e!530218 () Bool)

(assert (=> d!114461 (=> (not res!633460) (not e!530218))))

(declare-fun simpleValid!344 (LongMapFixedSize!4624) Bool)

(assert (=> d!114461 (= res!633460 (simpleValid!344 thiss!1141))))

(assert (=> d!114461 (= (valid!1777 thiss!1141) e!530218)))

(declare-fun b!942920 () Bool)

(declare-fun res!633461 () Bool)

(assert (=> b!942920 (=> (not res!633461) (not e!530218))))

(declare-fun arrayCountValidKeys!0 (array!56885 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942920 (= res!633461 (= (arrayCountValidKeys!0 (_keys!10495 thiss!1141) #b00000000000000000000000000000000 (size!27833 (_keys!10495 thiss!1141))) (_size!2367 thiss!1141)))))

(declare-fun b!942921 () Bool)

(declare-fun res!633462 () Bool)

(assert (=> b!942921 (=> (not res!633462) (not e!530218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56885 (_ BitVec 32)) Bool)

(assert (=> b!942921 (= res!633462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10495 thiss!1141) (mask!27235 thiss!1141)))))

(declare-fun b!942922 () Bool)

(declare-datatypes ((List!19195 0))(
  ( (Nil!19192) (Cons!19191 (h!20346 (_ BitVec 64)) (t!27502 List!19195)) )
))
(declare-fun arrayNoDuplicates!0 (array!56885 (_ BitVec 32) List!19195) Bool)

(assert (=> b!942922 (= e!530218 (arrayNoDuplicates!0 (_keys!10495 thiss!1141) #b00000000000000000000000000000000 Nil!19192))))

(assert (= (and d!114461 res!633460) b!942920))

(assert (= (and b!942920 res!633461) b!942921))

(assert (= (and b!942921 res!633462) b!942922))

(declare-fun m!878103 () Bool)

(assert (=> d!114461 m!878103))

(declare-fun m!878105 () Bool)

(assert (=> b!942920 m!878105))

(declare-fun m!878107 () Bool)

(assert (=> b!942921 m!878107))

(declare-fun m!878109 () Bool)

(assert (=> b!942922 m!878109))

(assert (=> start!80334 d!114461))

(declare-fun b!942935 () Bool)

(declare-fun e!530226 () SeekEntryResult!8982)

(declare-fun lt!425441 () SeekEntryResult!8982)

(assert (=> b!942935 (= e!530226 (ite ((_ is MissingVacant!8982) lt!425441) (MissingZero!8982 (index!38302 lt!425441)) lt!425441))))

(declare-fun lt!425444 () SeekEntryResult!8982)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56885 (_ BitVec 32)) SeekEntryResult!8982)

(assert (=> b!942935 (= lt!425441 (seekKeyOrZeroReturnVacant!0 (x!80828 lt!425444) (index!38301 lt!425444) (index!38301 lt!425444) key!756 (_keys!10495 thiss!1141) (mask!27235 thiss!1141)))))

(declare-fun b!942936 () Bool)

(assert (=> b!942936 (= e!530226 (MissingZero!8982 (index!38301 lt!425444)))))

(declare-fun b!942937 () Bool)

(declare-fun e!530225 () SeekEntryResult!8982)

(assert (=> b!942937 (= e!530225 (Found!8982 (index!38301 lt!425444)))))

(declare-fun b!942939 () Bool)

(declare-fun e!530227 () SeekEntryResult!8982)

(assert (=> b!942939 (= e!530227 e!530225)))

(declare-fun lt!425443 () (_ BitVec 64))

(assert (=> b!942939 (= lt!425443 (select (arr!27368 (_keys!10495 thiss!1141)) (index!38301 lt!425444)))))

(declare-fun c!98450 () Bool)

(assert (=> b!942939 (= c!98450 (= lt!425443 key!756))))

(declare-fun b!942940 () Bool)

(declare-fun c!98451 () Bool)

(assert (=> b!942940 (= c!98451 (= lt!425443 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942940 (= e!530225 e!530226)))

(declare-fun d!114463 () Bool)

(declare-fun lt!425442 () SeekEntryResult!8982)

(assert (=> d!114463 (and (or ((_ is MissingVacant!8982) lt!425442) (not ((_ is Found!8982) lt!425442)) (and (bvsge (index!38300 lt!425442) #b00000000000000000000000000000000) (bvslt (index!38300 lt!425442) (size!27833 (_keys!10495 thiss!1141))))) (not ((_ is MissingVacant!8982) lt!425442)) (or (not ((_ is Found!8982) lt!425442)) (= (select (arr!27368 (_keys!10495 thiss!1141)) (index!38300 lt!425442)) key!756)))))

(assert (=> d!114463 (= lt!425442 e!530227)))

(declare-fun c!98452 () Bool)

(assert (=> d!114463 (= c!98452 (and ((_ is Intermediate!8982) lt!425444) (undefined!9794 lt!425444)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56885 (_ BitVec 32)) SeekEntryResult!8982)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114463 (= lt!425444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27235 thiss!1141)) key!756 (_keys!10495 thiss!1141) (mask!27235 thiss!1141)))))

(assert (=> d!114463 (validMask!0 (mask!27235 thiss!1141))))

(assert (=> d!114463 (= (seekEntry!0 key!756 (_keys!10495 thiss!1141) (mask!27235 thiss!1141)) lt!425442)))

(declare-fun b!942938 () Bool)

(assert (=> b!942938 (= e!530227 Undefined!8982)))

(assert (= (and d!114463 c!98452) b!942938))

(assert (= (and d!114463 (not c!98452)) b!942939))

(assert (= (and b!942939 c!98450) b!942937))

(assert (= (and b!942939 (not c!98450)) b!942940))

(assert (= (and b!942940 c!98451) b!942936))

(assert (= (and b!942940 (not c!98451)) b!942935))

(declare-fun m!878111 () Bool)

(assert (=> b!942935 m!878111))

(declare-fun m!878113 () Bool)

(assert (=> b!942939 m!878113))

(declare-fun m!878115 () Bool)

(assert (=> d!114463 m!878115))

(declare-fun m!878117 () Bool)

(assert (=> d!114463 m!878117))

(assert (=> d!114463 m!878117))

(declare-fun m!878119 () Bool)

(assert (=> d!114463 m!878119))

(assert (=> d!114463 m!878073))

(assert (=> b!942865 d!114463))

(declare-fun mapIsEmpty!32473 () Bool)

(declare-fun mapRes!32473 () Bool)

(assert (=> mapIsEmpty!32473 mapRes!32473))

(declare-fun b!942948 () Bool)

(declare-fun e!530232 () Bool)

(assert (=> b!942948 (= e!530232 tp_is_empty!20437)))

(declare-fun condMapEmpty!32473 () Bool)

(declare-fun mapDefault!32473 () ValueCell!9737)

(assert (=> mapNonEmpty!32464 (= condMapEmpty!32473 (= mapRest!32464 ((as const (Array (_ BitVec 32) ValueCell!9737)) mapDefault!32473)))))

(assert (=> mapNonEmpty!32464 (= tp!62280 (and e!530232 mapRes!32473))))

(declare-fun mapNonEmpty!32473 () Bool)

(declare-fun tp!62296 () Bool)

(declare-fun e!530233 () Bool)

(assert (=> mapNonEmpty!32473 (= mapRes!32473 (and tp!62296 e!530233))))

(declare-fun mapValue!32473 () ValueCell!9737)

(declare-fun mapKey!32473 () (_ BitVec 32))

(declare-fun mapRest!32473 () (Array (_ BitVec 32) ValueCell!9737))

(assert (=> mapNonEmpty!32473 (= mapRest!32464 (store mapRest!32473 mapKey!32473 mapValue!32473))))

(declare-fun b!942947 () Bool)

(assert (=> b!942947 (= e!530233 tp_is_empty!20437)))

(assert (= (and mapNonEmpty!32464 condMapEmpty!32473) mapIsEmpty!32473))

(assert (= (and mapNonEmpty!32464 (not condMapEmpty!32473)) mapNonEmpty!32473))

(assert (= (and mapNonEmpty!32473 ((_ is ValueCellFull!9737) mapValue!32473)) b!942947))

(assert (= (and mapNonEmpty!32464 ((_ is ValueCellFull!9737) mapDefault!32473)) b!942948))

(declare-fun m!878121 () Bool)

(assert (=> mapNonEmpty!32473 m!878121))

(check-sat (not b_next!17929) (not b!942921) b_and!29351 (not d!114463) (not b!942920) (not d!114461) tp_is_empty!20437 (not mapNonEmpty!32473) (not b!942935) (not b!942922))
(check-sat b_and!29351 (not b_next!17929))
(get-model)

(declare-fun b!942967 () Bool)

(declare-fun e!530246 () Bool)

(declare-fun lt!425449 () SeekEntryResult!8982)

(assert (=> b!942967 (= e!530246 (bvsge (x!80828 lt!425449) #b01111111111111111111111111111110))))

(declare-fun b!942968 () Bool)

(declare-fun e!530248 () Bool)

(assert (=> b!942968 (= e!530246 e!530248)))

(declare-fun res!633469 () Bool)

(assert (=> b!942968 (= res!633469 (and ((_ is Intermediate!8982) lt!425449) (not (undefined!9794 lt!425449)) (bvslt (x!80828 lt!425449) #b01111111111111111111111111111110) (bvsge (x!80828 lt!425449) #b00000000000000000000000000000000) (bvsge (x!80828 lt!425449) #b00000000000000000000000000000000)))))

(assert (=> b!942968 (=> (not res!633469) (not e!530248))))

(declare-fun b!942969 () Bool)

(declare-fun e!530247 () SeekEntryResult!8982)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942969 (= e!530247 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27235 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27235 thiss!1141)) key!756 (_keys!10495 thiss!1141) (mask!27235 thiss!1141)))))

(declare-fun b!942970 () Bool)

(assert (=> b!942970 (and (bvsge (index!38301 lt!425449) #b00000000000000000000000000000000) (bvslt (index!38301 lt!425449) (size!27833 (_keys!10495 thiss!1141))))))

(declare-fun res!633470 () Bool)

(assert (=> b!942970 (= res!633470 (= (select (arr!27368 (_keys!10495 thiss!1141)) (index!38301 lt!425449)) key!756))))

(declare-fun e!530245 () Bool)

(assert (=> b!942970 (=> res!633470 e!530245)))

(assert (=> b!942970 (= e!530248 e!530245)))

(declare-fun b!942971 () Bool)

(declare-fun e!530244 () SeekEntryResult!8982)

(assert (=> b!942971 (= e!530244 (Intermediate!8982 true (toIndex!0 key!756 (mask!27235 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun d!114465 () Bool)

(assert (=> d!114465 e!530246))

(declare-fun c!98461 () Bool)

(assert (=> d!114465 (= c!98461 (and ((_ is Intermediate!8982) lt!425449) (undefined!9794 lt!425449)))))

(assert (=> d!114465 (= lt!425449 e!530244)))

(declare-fun c!98460 () Bool)

(assert (=> d!114465 (= c!98460 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!425450 () (_ BitVec 64))

(assert (=> d!114465 (= lt!425450 (select (arr!27368 (_keys!10495 thiss!1141)) (toIndex!0 key!756 (mask!27235 thiss!1141))))))

(assert (=> d!114465 (validMask!0 (mask!27235 thiss!1141))))

(assert (=> d!114465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27235 thiss!1141)) key!756 (_keys!10495 thiss!1141) (mask!27235 thiss!1141)) lt!425449)))

(declare-fun b!942972 () Bool)

(assert (=> b!942972 (= e!530244 e!530247)))

(declare-fun c!98459 () Bool)

(assert (=> b!942972 (= c!98459 (or (= lt!425450 key!756) (= (bvadd lt!425450 lt!425450) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!942973 () Bool)

(assert (=> b!942973 (and (bvsge (index!38301 lt!425449) #b00000000000000000000000000000000) (bvslt (index!38301 lt!425449) (size!27833 (_keys!10495 thiss!1141))))))

(declare-fun res!633471 () Bool)

(assert (=> b!942973 (= res!633471 (= (select (arr!27368 (_keys!10495 thiss!1141)) (index!38301 lt!425449)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942973 (=> res!633471 e!530245)))

(declare-fun b!942974 () Bool)

(assert (=> b!942974 (and (bvsge (index!38301 lt!425449) #b00000000000000000000000000000000) (bvslt (index!38301 lt!425449) (size!27833 (_keys!10495 thiss!1141))))))

(assert (=> b!942974 (= e!530245 (= (select (arr!27368 (_keys!10495 thiss!1141)) (index!38301 lt!425449)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!942975 () Bool)

(assert (=> b!942975 (= e!530247 (Intermediate!8982 false (toIndex!0 key!756 (mask!27235 thiss!1141)) #b00000000000000000000000000000000))))

(assert (= (and d!114465 c!98460) b!942971))

(assert (= (and d!114465 (not c!98460)) b!942972))

(assert (= (and b!942972 c!98459) b!942975))

(assert (= (and b!942972 (not c!98459)) b!942969))

(assert (= (and d!114465 c!98461) b!942967))

(assert (= (and d!114465 (not c!98461)) b!942968))

(assert (= (and b!942968 res!633469) b!942970))

(assert (= (and b!942970 (not res!633470)) b!942973))

(assert (= (and b!942973 (not res!633471)) b!942974))

(declare-fun m!878123 () Bool)

(assert (=> b!942970 m!878123))

(assert (=> b!942969 m!878117))

(declare-fun m!878125 () Bool)

(assert (=> b!942969 m!878125))

(assert (=> b!942969 m!878125))

(declare-fun m!878127 () Bool)

(assert (=> b!942969 m!878127))

(assert (=> b!942974 m!878123))

(assert (=> b!942973 m!878123))

(assert (=> d!114465 m!878117))

(declare-fun m!878129 () Bool)

(assert (=> d!114465 m!878129))

(assert (=> d!114465 m!878073))

(assert (=> d!114463 d!114465))

(declare-fun d!114467 () Bool)

(declare-fun lt!425456 () (_ BitVec 32))

(declare-fun lt!425455 () (_ BitVec 32))

(assert (=> d!114467 (= lt!425456 (bvmul (bvxor lt!425455 (bvlshr lt!425455 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114467 (= lt!425455 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114467 (and (bvsge (mask!27235 thiss!1141) #b00000000000000000000000000000000) (let ((res!633472 (let ((h!20347 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!80844 (bvmul (bvxor h!20347 (bvlshr h!20347 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!80844 (bvlshr x!80844 #b00000000000000000000000000001101)) (mask!27235 thiss!1141)))))) (and (bvslt res!633472 (bvadd (mask!27235 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!633472 #b00000000000000000000000000000000))))))

(assert (=> d!114467 (= (toIndex!0 key!756 (mask!27235 thiss!1141)) (bvand (bvxor lt!425456 (bvlshr lt!425456 #b00000000000000000000000000001101)) (mask!27235 thiss!1141)))))

(assert (=> d!114463 d!114467))

(assert (=> d!114463 d!114459))

(declare-fun bm!40986 () Bool)

(declare-fun call!40989 () Bool)

(assert (=> bm!40986 (= call!40989 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10495 thiss!1141) (mask!27235 thiss!1141)))))

(declare-fun d!114469 () Bool)

(declare-fun res!633477 () Bool)

(declare-fun e!530256 () Bool)

(assert (=> d!114469 (=> res!633477 e!530256)))

(assert (=> d!114469 (= res!633477 (bvsge #b00000000000000000000000000000000 (size!27833 (_keys!10495 thiss!1141))))))

(assert (=> d!114469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10495 thiss!1141) (mask!27235 thiss!1141)) e!530256)))

(declare-fun b!942984 () Bool)

(declare-fun e!530257 () Bool)

(assert (=> b!942984 (= e!530256 e!530257)))

(declare-fun c!98464 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!942984 (= c!98464 (validKeyInArray!0 (select (arr!27368 (_keys!10495 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942985 () Bool)

(declare-fun e!530255 () Bool)

(assert (=> b!942985 (= e!530255 call!40989)))

(declare-fun b!942986 () Bool)

(assert (=> b!942986 (= e!530257 call!40989)))

(declare-fun b!942987 () Bool)

(assert (=> b!942987 (= e!530257 e!530255)))

(declare-fun lt!425465 () (_ BitVec 64))

(assert (=> b!942987 (= lt!425465 (select (arr!27368 (_keys!10495 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31780 0))(
  ( (Unit!31781) )
))
(declare-fun lt!425464 () Unit!31780)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56885 (_ BitVec 64) (_ BitVec 32)) Unit!31780)

(assert (=> b!942987 (= lt!425464 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10495 thiss!1141) lt!425465 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!942987 (arrayContainsKey!0 (_keys!10495 thiss!1141) lt!425465 #b00000000000000000000000000000000)))

(declare-fun lt!425463 () Unit!31780)

(assert (=> b!942987 (= lt!425463 lt!425464)))

(declare-fun res!633478 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56885 (_ BitVec 32)) SeekEntryResult!8982)

(assert (=> b!942987 (= res!633478 (= (seekEntryOrOpen!0 (select (arr!27368 (_keys!10495 thiss!1141)) #b00000000000000000000000000000000) (_keys!10495 thiss!1141) (mask!27235 thiss!1141)) (Found!8982 #b00000000000000000000000000000000)))))

(assert (=> b!942987 (=> (not res!633478) (not e!530255))))

(assert (= (and d!114469 (not res!633477)) b!942984))

(assert (= (and b!942984 c!98464) b!942987))

(assert (= (and b!942984 (not c!98464)) b!942986))

(assert (= (and b!942987 res!633478) b!942985))

(assert (= (or b!942985 b!942986) bm!40986))

(declare-fun m!878131 () Bool)

(assert (=> bm!40986 m!878131))

(declare-fun m!878133 () Bool)

(assert (=> b!942984 m!878133))

(assert (=> b!942984 m!878133))

(declare-fun m!878135 () Bool)

(assert (=> b!942984 m!878135))

(assert (=> b!942987 m!878133))

(declare-fun m!878137 () Bool)

(assert (=> b!942987 m!878137))

(declare-fun m!878139 () Bool)

(assert (=> b!942987 m!878139))

(assert (=> b!942987 m!878133))

(declare-fun m!878141 () Bool)

(assert (=> b!942987 m!878141))

(assert (=> b!942921 d!114469))

(declare-fun b!942998 () Bool)

(declare-fun e!530268 () Bool)

(declare-fun call!40992 () Bool)

(assert (=> b!942998 (= e!530268 call!40992)))

(declare-fun bm!40989 () Bool)

(declare-fun c!98467 () Bool)

(assert (=> bm!40989 (= call!40992 (arrayNoDuplicates!0 (_keys!10495 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98467 (Cons!19191 (select (arr!27368 (_keys!10495 thiss!1141)) #b00000000000000000000000000000000) Nil!19192) Nil!19192)))))

(declare-fun b!942999 () Bool)

(declare-fun e!530267 () Bool)

(assert (=> b!942999 (= e!530267 e!530268)))

(assert (=> b!942999 (= c!98467 (validKeyInArray!0 (select (arr!27368 (_keys!10495 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943000 () Bool)

(declare-fun e!530269 () Bool)

(declare-fun contains!5138 (List!19195 (_ BitVec 64)) Bool)

(assert (=> b!943000 (= e!530269 (contains!5138 Nil!19192 (select (arr!27368 (_keys!10495 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943001 () Bool)

(declare-fun e!530266 () Bool)

(assert (=> b!943001 (= e!530266 e!530267)))

(declare-fun res!633486 () Bool)

(assert (=> b!943001 (=> (not res!633486) (not e!530267))))

(assert (=> b!943001 (= res!633486 (not e!530269))))

(declare-fun res!633485 () Bool)

(assert (=> b!943001 (=> (not res!633485) (not e!530269))))

(assert (=> b!943001 (= res!633485 (validKeyInArray!0 (select (arr!27368 (_keys!10495 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114471 () Bool)

(declare-fun res!633487 () Bool)

(assert (=> d!114471 (=> res!633487 e!530266)))

(assert (=> d!114471 (= res!633487 (bvsge #b00000000000000000000000000000000 (size!27833 (_keys!10495 thiss!1141))))))

(assert (=> d!114471 (= (arrayNoDuplicates!0 (_keys!10495 thiss!1141) #b00000000000000000000000000000000 Nil!19192) e!530266)))

(declare-fun b!943002 () Bool)

(assert (=> b!943002 (= e!530268 call!40992)))

(assert (= (and d!114471 (not res!633487)) b!943001))

(assert (= (and b!943001 res!633485) b!943000))

(assert (= (and b!943001 res!633486) b!942999))

(assert (= (and b!942999 c!98467) b!943002))

(assert (= (and b!942999 (not c!98467)) b!942998))

(assert (= (or b!943002 b!942998) bm!40989))

(assert (=> bm!40989 m!878133))

(declare-fun m!878143 () Bool)

(assert (=> bm!40989 m!878143))

(assert (=> b!942999 m!878133))

(assert (=> b!942999 m!878133))

(assert (=> b!942999 m!878135))

(assert (=> b!943000 m!878133))

(assert (=> b!943000 m!878133))

(declare-fun m!878145 () Bool)

(assert (=> b!943000 m!878145))

(assert (=> b!943001 m!878133))

(assert (=> b!943001 m!878133))

(assert (=> b!943001 m!878135))

(assert (=> b!942922 d!114471))

(declare-fun d!114473 () Bool)

(declare-fun lt!425471 () SeekEntryResult!8982)

(assert (=> d!114473 (and (or ((_ is Undefined!8982) lt!425471) (not ((_ is Found!8982) lt!425471)) (and (bvsge (index!38300 lt!425471) #b00000000000000000000000000000000) (bvslt (index!38300 lt!425471) (size!27833 (_keys!10495 thiss!1141))))) (or ((_ is Undefined!8982) lt!425471) ((_ is Found!8982) lt!425471) (not ((_ is MissingVacant!8982) lt!425471)) (not (= (index!38302 lt!425471) (index!38301 lt!425444))) (and (bvsge (index!38302 lt!425471) #b00000000000000000000000000000000) (bvslt (index!38302 lt!425471) (size!27833 (_keys!10495 thiss!1141))))) (or ((_ is Undefined!8982) lt!425471) (ite ((_ is Found!8982) lt!425471) (= (select (arr!27368 (_keys!10495 thiss!1141)) (index!38300 lt!425471)) key!756) (and ((_ is MissingVacant!8982) lt!425471) (= (index!38302 lt!425471) (index!38301 lt!425444)) (= (select (arr!27368 (_keys!10495 thiss!1141)) (index!38302 lt!425471)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!530276 () SeekEntryResult!8982)

(assert (=> d!114473 (= lt!425471 e!530276)))

(declare-fun c!98475 () Bool)

(assert (=> d!114473 (= c!98475 (bvsge (x!80828 lt!425444) #b01111111111111111111111111111110))))

(declare-fun lt!425470 () (_ BitVec 64))

(assert (=> d!114473 (= lt!425470 (select (arr!27368 (_keys!10495 thiss!1141)) (index!38301 lt!425444)))))

(assert (=> d!114473 (validMask!0 (mask!27235 thiss!1141))))

(assert (=> d!114473 (= (seekKeyOrZeroReturnVacant!0 (x!80828 lt!425444) (index!38301 lt!425444) (index!38301 lt!425444) key!756 (_keys!10495 thiss!1141) (mask!27235 thiss!1141)) lt!425471)))

(declare-fun e!530278 () SeekEntryResult!8982)

(declare-fun b!943015 () Bool)

(assert (=> b!943015 (= e!530278 (seekKeyOrZeroReturnVacant!0 (bvadd (x!80828 lt!425444) #b00000000000000000000000000000001) (nextIndex!0 (index!38301 lt!425444) (bvadd (x!80828 lt!425444) #b00000000000000000000000000000001) (mask!27235 thiss!1141)) (index!38301 lt!425444) key!756 (_keys!10495 thiss!1141) (mask!27235 thiss!1141)))))

(declare-fun b!943016 () Bool)

(assert (=> b!943016 (= e!530278 (MissingVacant!8982 (index!38301 lt!425444)))))

(declare-fun b!943017 () Bool)

(declare-fun e!530277 () SeekEntryResult!8982)

(assert (=> b!943017 (= e!530277 (Found!8982 (index!38301 lt!425444)))))

(declare-fun b!943018 () Bool)

(declare-fun c!98476 () Bool)

(assert (=> b!943018 (= c!98476 (= lt!425470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!943018 (= e!530277 e!530278)))

(declare-fun b!943019 () Bool)

(assert (=> b!943019 (= e!530276 e!530277)))

(declare-fun c!98474 () Bool)

(assert (=> b!943019 (= c!98474 (= lt!425470 key!756))))

(declare-fun b!943020 () Bool)

(assert (=> b!943020 (= e!530276 Undefined!8982)))

(assert (= (and d!114473 c!98475) b!943020))

(assert (= (and d!114473 (not c!98475)) b!943019))

(assert (= (and b!943019 c!98474) b!943017))

(assert (= (and b!943019 (not c!98474)) b!943018))

(assert (= (and b!943018 c!98476) b!943016))

(assert (= (and b!943018 (not c!98476)) b!943015))

(declare-fun m!878147 () Bool)

(assert (=> d!114473 m!878147))

(declare-fun m!878149 () Bool)

(assert (=> d!114473 m!878149))

(assert (=> d!114473 m!878113))

(assert (=> d!114473 m!878073))

(declare-fun m!878151 () Bool)

(assert (=> b!943015 m!878151))

(assert (=> b!943015 m!878151))

(declare-fun m!878153 () Bool)

(assert (=> b!943015 m!878153))

(assert (=> b!942935 d!114473))

(declare-fun b!943031 () Bool)

(declare-fun res!633498 () Bool)

(declare-fun e!530281 () Bool)

(assert (=> b!943031 (=> (not res!633498) (not e!530281))))

(declare-fun size!27838 (LongMapFixedSize!4624) (_ BitVec 32))

(assert (=> b!943031 (= res!633498 (= (size!27838 thiss!1141) (bvadd (_size!2367 thiss!1141) (bvsdiv (bvadd (extraKeys!5335 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!943029 () Bool)

(declare-fun res!633499 () Bool)

(assert (=> b!943029 (=> (not res!633499) (not e!530281))))

(assert (=> b!943029 (= res!633499 (and (= (size!27832 (_values!5626 thiss!1141)) (bvadd (mask!27235 thiss!1141) #b00000000000000000000000000000001)) (= (size!27833 (_keys!10495 thiss!1141)) (size!27832 (_values!5626 thiss!1141))) (bvsge (_size!2367 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2367 thiss!1141) (bvadd (mask!27235 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!943030 () Bool)

(declare-fun res!633496 () Bool)

(assert (=> b!943030 (=> (not res!633496) (not e!530281))))

(assert (=> b!943030 (= res!633496 (bvsge (size!27838 thiss!1141) (_size!2367 thiss!1141)))))

(declare-fun b!943032 () Bool)

(assert (=> b!943032 (= e!530281 (and (bvsge (extraKeys!5335 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5335 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2367 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun d!114475 () Bool)

(declare-fun res!633497 () Bool)

(assert (=> d!114475 (=> (not res!633497) (not e!530281))))

(assert (=> d!114475 (= res!633497 (validMask!0 (mask!27235 thiss!1141)))))

(assert (=> d!114475 (= (simpleValid!344 thiss!1141) e!530281)))

(assert (= (and d!114475 res!633497) b!943029))

(assert (= (and b!943029 res!633499) b!943030))

(assert (= (and b!943030 res!633496) b!943031))

(assert (= (and b!943031 res!633498) b!943032))

(declare-fun m!878155 () Bool)

(assert (=> b!943031 m!878155))

(assert (=> b!943030 m!878155))

(assert (=> d!114475 m!878073))

(assert (=> d!114461 d!114475))

(declare-fun bm!40992 () Bool)

(declare-fun call!40995 () (_ BitVec 32))

(assert (=> bm!40992 (= call!40995 (arrayCountValidKeys!0 (_keys!10495 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27833 (_keys!10495 thiss!1141))))))

(declare-fun b!943041 () Bool)

(declare-fun e!530286 () (_ BitVec 32))

(declare-fun e!530287 () (_ BitVec 32))

(assert (=> b!943041 (= e!530286 e!530287)))

(declare-fun c!98482 () Bool)

(assert (=> b!943041 (= c!98482 (validKeyInArray!0 (select (arr!27368 (_keys!10495 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943042 () Bool)

(assert (=> b!943042 (= e!530286 #b00000000000000000000000000000000)))

(declare-fun d!114477 () Bool)

(declare-fun lt!425474 () (_ BitVec 32))

(assert (=> d!114477 (and (bvsge lt!425474 #b00000000000000000000000000000000) (bvsle lt!425474 (bvsub (size!27833 (_keys!10495 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114477 (= lt!425474 e!530286)))

(declare-fun c!98481 () Bool)

(assert (=> d!114477 (= c!98481 (bvsge #b00000000000000000000000000000000 (size!27833 (_keys!10495 thiss!1141))))))

(assert (=> d!114477 (and (bvsle #b00000000000000000000000000000000 (size!27833 (_keys!10495 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27833 (_keys!10495 thiss!1141)) (size!27833 (_keys!10495 thiss!1141))))))

(assert (=> d!114477 (= (arrayCountValidKeys!0 (_keys!10495 thiss!1141) #b00000000000000000000000000000000 (size!27833 (_keys!10495 thiss!1141))) lt!425474)))

(declare-fun b!943043 () Bool)

(assert (=> b!943043 (= e!530287 (bvadd #b00000000000000000000000000000001 call!40995))))

(declare-fun b!943044 () Bool)

(assert (=> b!943044 (= e!530287 call!40995)))

(assert (= (and d!114477 c!98481) b!943042))

(assert (= (and d!114477 (not c!98481)) b!943041))

(assert (= (and b!943041 c!98482) b!943043))

(assert (= (and b!943041 (not c!98482)) b!943044))

(assert (= (or b!943043 b!943044) bm!40992))

(declare-fun m!878157 () Bool)

(assert (=> bm!40992 m!878157))

(assert (=> b!943041 m!878133))

(assert (=> b!943041 m!878133))

(assert (=> b!943041 m!878135))

(assert (=> b!942920 d!114477))

(declare-fun mapIsEmpty!32474 () Bool)

(declare-fun mapRes!32474 () Bool)

(assert (=> mapIsEmpty!32474 mapRes!32474))

(declare-fun b!943046 () Bool)

(declare-fun e!530288 () Bool)

(assert (=> b!943046 (= e!530288 tp_is_empty!20437)))

(declare-fun condMapEmpty!32474 () Bool)

(declare-fun mapDefault!32474 () ValueCell!9737)

(assert (=> mapNonEmpty!32473 (= condMapEmpty!32474 (= mapRest!32473 ((as const (Array (_ BitVec 32) ValueCell!9737)) mapDefault!32474)))))

(assert (=> mapNonEmpty!32473 (= tp!62296 (and e!530288 mapRes!32474))))

(declare-fun mapNonEmpty!32474 () Bool)

(declare-fun tp!62297 () Bool)

(declare-fun e!530289 () Bool)

(assert (=> mapNonEmpty!32474 (= mapRes!32474 (and tp!62297 e!530289))))

(declare-fun mapRest!32474 () (Array (_ BitVec 32) ValueCell!9737))

(declare-fun mapValue!32474 () ValueCell!9737)

(declare-fun mapKey!32474 () (_ BitVec 32))

(assert (=> mapNonEmpty!32474 (= mapRest!32473 (store mapRest!32474 mapKey!32474 mapValue!32474))))

(declare-fun b!943045 () Bool)

(assert (=> b!943045 (= e!530289 tp_is_empty!20437)))

(assert (= (and mapNonEmpty!32473 condMapEmpty!32474) mapIsEmpty!32474))

(assert (= (and mapNonEmpty!32473 (not condMapEmpty!32474)) mapNonEmpty!32474))

(assert (= (and mapNonEmpty!32474 ((_ is ValueCellFull!9737) mapValue!32474)) b!943045))

(assert (= (and mapNonEmpty!32473 ((_ is ValueCellFull!9737) mapDefault!32474)) b!943046))

(declare-fun m!878159 () Bool)

(assert (=> mapNonEmpty!32474 m!878159))

(check-sat (not b_next!17929) (not b!942987) b_and!29351 (not d!114465) (not b!943031) (not b!943030) (not b!943041) (not mapNonEmpty!32474) (not b!942969) (not bm!40986) (not b!942999) tp_is_empty!20437 (not b!942984) (not d!114473) (not bm!40992) (not b!943001) (not b!943000) (not bm!40989) (not b!943015) (not d!114475))
(check-sat b_and!29351 (not b_next!17929))
