; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80092 () Bool)

(assert start!80092)

(declare-fun b!941466 () Bool)

(declare-fun b_free!17913 () Bool)

(declare-fun b_next!17913 () Bool)

(assert (=> b!941466 (= b_free!17913 (not b_next!17913))))

(declare-fun tp!62221 () Bool)

(declare-fun b_and!29325 () Bool)

(assert (=> b!941466 (= tp!62221 b_and!29325)))

(declare-fun b!941462 () Bool)

(declare-fun e!529282 () Bool)

(declare-fun tp_is_empty!20421 () Bool)

(assert (=> b!941462 (= e!529282 tp_is_empty!20421)))

(declare-fun b!941463 () Bool)

(declare-fun res!632885 () Bool)

(declare-fun e!529284 () Bool)

(assert (=> b!941463 (=> (not res!632885) (not e!529284))))

(declare-datatypes ((V!32193 0))(
  ( (V!32194 (val!10261 Int)) )
))
(declare-datatypes ((ValueCell!9729 0))(
  ( (ValueCellFull!9729 (v!12792 V!32193)) (EmptyCell!9729) )
))
(declare-datatypes ((array!56794 0))(
  ( (array!56795 (arr!27330 (Array (_ BitVec 32) ValueCell!9729)) (size!27792 (_ BitVec 32))) )
))
(declare-datatypes ((array!56796 0))(
  ( (array!56797 (arr!27331 (Array (_ BitVec 32) (_ BitVec 64))) (size!27793 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4608 0))(
  ( (LongMapFixedSize!4609 (defaultEntry!5595 Int) (mask!27164 (_ BitVec 32)) (extraKeys!5327 (_ BitVec 32)) (zeroValue!5431 V!32193) (minValue!5431 V!32193) (_size!2359 (_ BitVec 32)) (_keys!10450 array!56796) (_values!5618 array!56794) (_vacant!2359 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4608)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941463 (= res!632885 (validMask!0 (mask!27164 thiss!1141)))))

(declare-fun b!941464 () Bool)

(declare-fun res!632886 () Bool)

(assert (=> b!941464 (=> (not res!632886) (not e!529284))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9022 0))(
  ( (MissingZero!9022 (index!38459 (_ BitVec 32))) (Found!9022 (index!38460 (_ BitVec 32))) (Intermediate!9022 (undefined!9834 Bool) (index!38461 (_ BitVec 32)) (x!80788 (_ BitVec 32))) (Undefined!9022) (MissingVacant!9022 (index!38462 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56796 (_ BitVec 32)) SeekEntryResult!9022)

(assert (=> b!941464 (= res!632886 (not ((_ is Found!9022) (seekEntry!0 key!756 (_keys!10450 thiss!1141) (mask!27164 thiss!1141)))))))

(declare-fun b!941465 () Bool)

(declare-fun e!529285 () Bool)

(assert (=> b!941465 (= e!529285 tp_is_empty!20421)))

(declare-fun res!632888 () Bool)

(assert (=> start!80092 (=> (not res!632888) (not e!529284))))

(declare-fun valid!1765 (LongMapFixedSize!4608) Bool)

(assert (=> start!80092 (= res!632888 (valid!1765 thiss!1141))))

(assert (=> start!80092 e!529284))

(declare-fun e!529286 () Bool)

(assert (=> start!80092 e!529286))

(assert (=> start!80092 true))

(declare-fun e!529283 () Bool)

(declare-fun array_inv!21238 (array!56796) Bool)

(declare-fun array_inv!21239 (array!56794) Bool)

(assert (=> b!941466 (= e!529286 (and tp!62221 tp_is_empty!20421 (array_inv!21238 (_keys!10450 thiss!1141)) (array_inv!21239 (_values!5618 thiss!1141)) e!529283))))

(declare-fun b!941467 () Bool)

(assert (=> b!941467 (= e!529284 (and (= (size!27792 (_values!5618 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27164 thiss!1141))) (not (= (size!27793 (_keys!10450 thiss!1141)) (size!27792 (_values!5618 thiss!1141))))))))

(declare-fun mapNonEmpty!32429 () Bool)

(declare-fun mapRes!32429 () Bool)

(declare-fun tp!62220 () Bool)

(assert (=> mapNonEmpty!32429 (= mapRes!32429 (and tp!62220 e!529285))))

(declare-fun mapValue!32429 () ValueCell!9729)

(declare-fun mapKey!32429 () (_ BitVec 32))

(declare-fun mapRest!32429 () (Array (_ BitVec 32) ValueCell!9729))

(assert (=> mapNonEmpty!32429 (= (arr!27330 (_values!5618 thiss!1141)) (store mapRest!32429 mapKey!32429 mapValue!32429))))

(declare-fun b!941468 () Bool)

(declare-fun res!632887 () Bool)

(assert (=> b!941468 (=> (not res!632887) (not e!529284))))

(assert (=> b!941468 (= res!632887 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32429 () Bool)

(assert (=> mapIsEmpty!32429 mapRes!32429))

(declare-fun b!941469 () Bool)

(assert (=> b!941469 (= e!529283 (and e!529282 mapRes!32429))))

(declare-fun condMapEmpty!32429 () Bool)

(declare-fun mapDefault!32429 () ValueCell!9729)

(assert (=> b!941469 (= condMapEmpty!32429 (= (arr!27330 (_values!5618 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9729)) mapDefault!32429)))))

(assert (= (and start!80092 res!632888) b!941468))

(assert (= (and b!941468 res!632887) b!941464))

(assert (= (and b!941464 res!632886) b!941463))

(assert (= (and b!941463 res!632885) b!941467))

(assert (= (and b!941469 condMapEmpty!32429) mapIsEmpty!32429))

(assert (= (and b!941469 (not condMapEmpty!32429)) mapNonEmpty!32429))

(assert (= (and mapNonEmpty!32429 ((_ is ValueCellFull!9729) mapValue!32429)) b!941465))

(assert (= (and b!941469 ((_ is ValueCellFull!9729) mapDefault!32429)) b!941462))

(assert (= b!941466 b!941469))

(assert (= start!80092 b!941466))

(declare-fun m!876541 () Bool)

(assert (=> start!80092 m!876541))

(declare-fun m!876543 () Bool)

(assert (=> b!941463 m!876543))

(declare-fun m!876545 () Bool)

(assert (=> mapNonEmpty!32429 m!876545))

(declare-fun m!876547 () Bool)

(assert (=> b!941466 m!876547))

(declare-fun m!876549 () Bool)

(assert (=> b!941466 m!876549))

(declare-fun m!876551 () Bool)

(assert (=> b!941464 m!876551))

(check-sat b_and!29325 (not b!941466) tp_is_empty!20421 (not mapNonEmpty!32429) (not start!80092) (not b_next!17913) (not b!941463) (not b!941464))
(check-sat b_and!29325 (not b_next!17913))
(get-model)

(declare-fun b!941507 () Bool)

(declare-fun e!529313 () SeekEntryResult!9022)

(declare-fun lt!424986 () SeekEntryResult!9022)

(assert (=> b!941507 (= e!529313 (ite ((_ is MissingVacant!9022) lt!424986) (MissingZero!9022 (index!38462 lt!424986)) lt!424986))))

(declare-fun lt!424984 () SeekEntryResult!9022)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56796 (_ BitVec 32)) SeekEntryResult!9022)

(assert (=> b!941507 (= lt!424986 (seekKeyOrZeroReturnVacant!0 (x!80788 lt!424984) (index!38461 lt!424984) (index!38461 lt!424984) key!756 (_keys!10450 thiss!1141) (mask!27164 thiss!1141)))))

(declare-fun b!941508 () Bool)

(declare-fun e!529312 () SeekEntryResult!9022)

(assert (=> b!941508 (= e!529312 Undefined!9022)))

(declare-fun b!941509 () Bool)

(declare-fun c!98082 () Bool)

(declare-fun lt!424985 () (_ BitVec 64))

(assert (=> b!941509 (= c!98082 (= lt!424985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!529314 () SeekEntryResult!9022)

(assert (=> b!941509 (= e!529314 e!529313)))

(declare-fun d!114069 () Bool)

(declare-fun lt!424987 () SeekEntryResult!9022)

(assert (=> d!114069 (and (or ((_ is MissingVacant!9022) lt!424987) (not ((_ is Found!9022) lt!424987)) (and (bvsge (index!38460 lt!424987) #b00000000000000000000000000000000) (bvslt (index!38460 lt!424987) (size!27793 (_keys!10450 thiss!1141))))) (not ((_ is MissingVacant!9022) lt!424987)) (or (not ((_ is Found!9022) lt!424987)) (= (select (arr!27331 (_keys!10450 thiss!1141)) (index!38460 lt!424987)) key!756)))))

(assert (=> d!114069 (= lt!424987 e!529312)))

(declare-fun c!98083 () Bool)

(assert (=> d!114069 (= c!98083 (and ((_ is Intermediate!9022) lt!424984) (undefined!9834 lt!424984)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56796 (_ BitVec 32)) SeekEntryResult!9022)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114069 (= lt!424984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27164 thiss!1141)) key!756 (_keys!10450 thiss!1141) (mask!27164 thiss!1141)))))

(assert (=> d!114069 (validMask!0 (mask!27164 thiss!1141))))

(assert (=> d!114069 (= (seekEntry!0 key!756 (_keys!10450 thiss!1141) (mask!27164 thiss!1141)) lt!424987)))

(declare-fun b!941506 () Bool)

(assert (=> b!941506 (= e!529314 (Found!9022 (index!38461 lt!424984)))))

(declare-fun b!941510 () Bool)

(assert (=> b!941510 (= e!529312 e!529314)))

(assert (=> b!941510 (= lt!424985 (select (arr!27331 (_keys!10450 thiss!1141)) (index!38461 lt!424984)))))

(declare-fun c!98081 () Bool)

(assert (=> b!941510 (= c!98081 (= lt!424985 key!756))))

(declare-fun b!941511 () Bool)

(assert (=> b!941511 (= e!529313 (MissingZero!9022 (index!38461 lt!424984)))))

(assert (= (and d!114069 c!98083) b!941508))

(assert (= (and d!114069 (not c!98083)) b!941510))

(assert (= (and b!941510 c!98081) b!941506))

(assert (= (and b!941510 (not c!98081)) b!941509))

(assert (= (and b!941509 c!98082) b!941511))

(assert (= (and b!941509 (not c!98082)) b!941507))

(declare-fun m!876565 () Bool)

(assert (=> b!941507 m!876565))

(declare-fun m!876567 () Bool)

(assert (=> d!114069 m!876567))

(declare-fun m!876569 () Bool)

(assert (=> d!114069 m!876569))

(assert (=> d!114069 m!876569))

(declare-fun m!876571 () Bool)

(assert (=> d!114069 m!876571))

(assert (=> d!114069 m!876543))

(declare-fun m!876573 () Bool)

(assert (=> b!941510 m!876573))

(assert (=> b!941464 d!114069))

(declare-fun d!114071 () Bool)

(declare-fun res!632907 () Bool)

(declare-fun e!529317 () Bool)

(assert (=> d!114071 (=> (not res!632907) (not e!529317))))

(declare-fun simpleValid!341 (LongMapFixedSize!4608) Bool)

(assert (=> d!114071 (= res!632907 (simpleValid!341 thiss!1141))))

(assert (=> d!114071 (= (valid!1765 thiss!1141) e!529317)))

(declare-fun b!941518 () Bool)

(declare-fun res!632908 () Bool)

(assert (=> b!941518 (=> (not res!632908) (not e!529317))))

(declare-fun arrayCountValidKeys!0 (array!56796 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941518 (= res!632908 (= (arrayCountValidKeys!0 (_keys!10450 thiss!1141) #b00000000000000000000000000000000 (size!27793 (_keys!10450 thiss!1141))) (_size!2359 thiss!1141)))))

(declare-fun b!941519 () Bool)

(declare-fun res!632909 () Bool)

(assert (=> b!941519 (=> (not res!632909) (not e!529317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56796 (_ BitVec 32)) Bool)

(assert (=> b!941519 (= res!632909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10450 thiss!1141) (mask!27164 thiss!1141)))))

(declare-fun b!941520 () Bool)

(declare-datatypes ((List!19206 0))(
  ( (Nil!19203) (Cons!19202 (h!20349 (_ BitVec 64)) (t!27521 List!19206)) )
))
(declare-fun arrayNoDuplicates!0 (array!56796 (_ BitVec 32) List!19206) Bool)

(assert (=> b!941520 (= e!529317 (arrayNoDuplicates!0 (_keys!10450 thiss!1141) #b00000000000000000000000000000000 Nil!19203))))

(assert (= (and d!114071 res!632907) b!941518))

(assert (= (and b!941518 res!632908) b!941519))

(assert (= (and b!941519 res!632909) b!941520))

(declare-fun m!876575 () Bool)

(assert (=> d!114071 m!876575))

(declare-fun m!876577 () Bool)

(assert (=> b!941518 m!876577))

(declare-fun m!876579 () Bool)

(assert (=> b!941519 m!876579))

(declare-fun m!876581 () Bool)

(assert (=> b!941520 m!876581))

(assert (=> start!80092 d!114071))

(declare-fun d!114073 () Bool)

(assert (=> d!114073 (= (array_inv!21238 (_keys!10450 thiss!1141)) (bvsge (size!27793 (_keys!10450 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941466 d!114073))

(declare-fun d!114075 () Bool)

(assert (=> d!114075 (= (array_inv!21239 (_values!5618 thiss!1141)) (bvsge (size!27792 (_values!5618 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941466 d!114075))

(declare-fun d!114077 () Bool)

(assert (=> d!114077 (= (validMask!0 (mask!27164 thiss!1141)) (and (or (= (mask!27164 thiss!1141) #b00000000000000000000000000000111) (= (mask!27164 thiss!1141) #b00000000000000000000000000001111) (= (mask!27164 thiss!1141) #b00000000000000000000000000011111) (= (mask!27164 thiss!1141) #b00000000000000000000000000111111) (= (mask!27164 thiss!1141) #b00000000000000000000000001111111) (= (mask!27164 thiss!1141) #b00000000000000000000000011111111) (= (mask!27164 thiss!1141) #b00000000000000000000000111111111) (= (mask!27164 thiss!1141) #b00000000000000000000001111111111) (= (mask!27164 thiss!1141) #b00000000000000000000011111111111) (= (mask!27164 thiss!1141) #b00000000000000000000111111111111) (= (mask!27164 thiss!1141) #b00000000000000000001111111111111) (= (mask!27164 thiss!1141) #b00000000000000000011111111111111) (= (mask!27164 thiss!1141) #b00000000000000000111111111111111) (= (mask!27164 thiss!1141) #b00000000000000001111111111111111) (= (mask!27164 thiss!1141) #b00000000000000011111111111111111) (= (mask!27164 thiss!1141) #b00000000000000111111111111111111) (= (mask!27164 thiss!1141) #b00000000000001111111111111111111) (= (mask!27164 thiss!1141) #b00000000000011111111111111111111) (= (mask!27164 thiss!1141) #b00000000000111111111111111111111) (= (mask!27164 thiss!1141) #b00000000001111111111111111111111) (= (mask!27164 thiss!1141) #b00000000011111111111111111111111) (= (mask!27164 thiss!1141) #b00000000111111111111111111111111) (= (mask!27164 thiss!1141) #b00000001111111111111111111111111) (= (mask!27164 thiss!1141) #b00000011111111111111111111111111) (= (mask!27164 thiss!1141) #b00000111111111111111111111111111) (= (mask!27164 thiss!1141) #b00001111111111111111111111111111) (= (mask!27164 thiss!1141) #b00011111111111111111111111111111) (= (mask!27164 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27164 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!941463 d!114077))

(declare-fun b!941528 () Bool)

(declare-fun e!529323 () Bool)

(assert (=> b!941528 (= e!529323 tp_is_empty!20421)))

(declare-fun mapIsEmpty!32435 () Bool)

(declare-fun mapRes!32435 () Bool)

(assert (=> mapIsEmpty!32435 mapRes!32435))

(declare-fun condMapEmpty!32435 () Bool)

(declare-fun mapDefault!32435 () ValueCell!9729)

(assert (=> mapNonEmpty!32429 (= condMapEmpty!32435 (= mapRest!32429 ((as const (Array (_ BitVec 32) ValueCell!9729)) mapDefault!32435)))))

(assert (=> mapNonEmpty!32429 (= tp!62220 (and e!529323 mapRes!32435))))

(declare-fun b!941527 () Bool)

(declare-fun e!529322 () Bool)

(assert (=> b!941527 (= e!529322 tp_is_empty!20421)))

(declare-fun mapNonEmpty!32435 () Bool)

(declare-fun tp!62230 () Bool)

(assert (=> mapNonEmpty!32435 (= mapRes!32435 (and tp!62230 e!529322))))

(declare-fun mapValue!32435 () ValueCell!9729)

(declare-fun mapKey!32435 () (_ BitVec 32))

(declare-fun mapRest!32435 () (Array (_ BitVec 32) ValueCell!9729))

(assert (=> mapNonEmpty!32435 (= mapRest!32429 (store mapRest!32435 mapKey!32435 mapValue!32435))))

(assert (= (and mapNonEmpty!32429 condMapEmpty!32435) mapIsEmpty!32435))

(assert (= (and mapNonEmpty!32429 (not condMapEmpty!32435)) mapNonEmpty!32435))

(assert (= (and mapNonEmpty!32435 ((_ is ValueCellFull!9729) mapValue!32435)) b!941527))

(assert (= (and mapNonEmpty!32429 ((_ is ValueCellFull!9729) mapDefault!32435)) b!941528))

(declare-fun m!876583 () Bool)

(assert (=> mapNonEmpty!32435 m!876583))

(check-sat (not b!941518) (not b!941520) (not mapNonEmpty!32435) (not b!941519) (not d!114071) (not d!114069) tp_is_empty!20421 (not b_next!17913) b_and!29325 (not b!941507))
(check-sat b_and!29325 (not b_next!17913))
(get-model)

(declare-fun b!941547 () Bool)

(declare-fun lt!424993 () SeekEntryResult!9022)

(assert (=> b!941547 (and (bvsge (index!38461 lt!424993) #b00000000000000000000000000000000) (bvslt (index!38461 lt!424993) (size!27793 (_keys!10450 thiss!1141))))))

(declare-fun e!529338 () Bool)

(assert (=> b!941547 (= e!529338 (= (select (arr!27331 (_keys!10450 thiss!1141)) (index!38461 lt!424993)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!941548 () Bool)

(assert (=> b!941548 (and (bvsge (index!38461 lt!424993) #b00000000000000000000000000000000) (bvslt (index!38461 lt!424993) (size!27793 (_keys!10450 thiss!1141))))))

(declare-fun res!632917 () Bool)

(assert (=> b!941548 (= res!632917 (= (select (arr!27331 (_keys!10450 thiss!1141)) (index!38461 lt!424993)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941548 (=> res!632917 e!529338)))

(declare-fun b!941549 () Bool)

(declare-fun e!529337 () SeekEntryResult!9022)

(declare-fun e!529336 () SeekEntryResult!9022)

(assert (=> b!941549 (= e!529337 e!529336)))

(declare-fun c!98090 () Bool)

(declare-fun lt!424992 () (_ BitVec 64))

(assert (=> b!941549 (= c!98090 (or (= lt!424992 key!756) (= (bvadd lt!424992 lt!424992) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!941550 () Bool)

(assert (=> b!941550 (= e!529337 (Intermediate!9022 true (toIndex!0 key!756 (mask!27164 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!941551 () Bool)

(declare-fun e!529335 () Bool)

(assert (=> b!941551 (= e!529335 (bvsge (x!80788 lt!424993) #b01111111111111111111111111111110))))

(declare-fun d!114079 () Bool)

(assert (=> d!114079 e!529335))

(declare-fun c!98092 () Bool)

(assert (=> d!114079 (= c!98092 (and ((_ is Intermediate!9022) lt!424993) (undefined!9834 lt!424993)))))

(assert (=> d!114079 (= lt!424993 e!529337)))

(declare-fun c!98091 () Bool)

(assert (=> d!114079 (= c!98091 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114079 (= lt!424992 (select (arr!27331 (_keys!10450 thiss!1141)) (toIndex!0 key!756 (mask!27164 thiss!1141))))))

(assert (=> d!114079 (validMask!0 (mask!27164 thiss!1141))))

(assert (=> d!114079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27164 thiss!1141)) key!756 (_keys!10450 thiss!1141) (mask!27164 thiss!1141)) lt!424993)))

(declare-fun b!941552 () Bool)

(assert (=> b!941552 (= e!529336 (Intermediate!9022 false (toIndex!0 key!756 (mask!27164 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!941553 () Bool)

(declare-fun e!529334 () Bool)

(assert (=> b!941553 (= e!529335 e!529334)))

(declare-fun res!632918 () Bool)

(assert (=> b!941553 (= res!632918 (and ((_ is Intermediate!9022) lt!424993) (not (undefined!9834 lt!424993)) (bvslt (x!80788 lt!424993) #b01111111111111111111111111111110) (bvsge (x!80788 lt!424993) #b00000000000000000000000000000000) (bvsge (x!80788 lt!424993) #b00000000000000000000000000000000)))))

(assert (=> b!941553 (=> (not res!632918) (not e!529334))))

(declare-fun b!941554 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941554 (= e!529336 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27164 thiss!1141)) #b00000000000000000000000000000000 (mask!27164 thiss!1141)) key!756 (_keys!10450 thiss!1141) (mask!27164 thiss!1141)))))

(declare-fun b!941555 () Bool)

(assert (=> b!941555 (and (bvsge (index!38461 lt!424993) #b00000000000000000000000000000000) (bvslt (index!38461 lt!424993) (size!27793 (_keys!10450 thiss!1141))))))

(declare-fun res!632916 () Bool)

(assert (=> b!941555 (= res!632916 (= (select (arr!27331 (_keys!10450 thiss!1141)) (index!38461 lt!424993)) key!756))))

(assert (=> b!941555 (=> res!632916 e!529338)))

(assert (=> b!941555 (= e!529334 e!529338)))

(assert (= (and d!114079 c!98091) b!941550))

(assert (= (and d!114079 (not c!98091)) b!941549))

(assert (= (and b!941549 c!98090) b!941552))

(assert (= (and b!941549 (not c!98090)) b!941554))

(assert (= (and d!114079 c!98092) b!941551))

(assert (= (and d!114079 (not c!98092)) b!941553))

(assert (= (and b!941553 res!632918) b!941555))

(assert (= (and b!941555 (not res!632916)) b!941548))

(assert (= (and b!941548 (not res!632917)) b!941547))

(assert (=> d!114079 m!876569))

(declare-fun m!876585 () Bool)

(assert (=> d!114079 m!876585))

(assert (=> d!114079 m!876543))

(declare-fun m!876587 () Bool)

(assert (=> b!941555 m!876587))

(assert (=> b!941548 m!876587))

(assert (=> b!941554 m!876569))

(declare-fun m!876589 () Bool)

(assert (=> b!941554 m!876589))

(assert (=> b!941554 m!876589))

(declare-fun m!876591 () Bool)

(assert (=> b!941554 m!876591))

(assert (=> b!941547 m!876587))

(assert (=> d!114069 d!114079))

(declare-fun d!114081 () Bool)

(declare-fun lt!424999 () (_ BitVec 32))

(declare-fun lt!424998 () (_ BitVec 32))

(assert (=> d!114081 (= lt!424999 (bvmul (bvxor lt!424998 (bvlshr lt!424998 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114081 (= lt!424998 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114081 (and (bvsge (mask!27164 thiss!1141) #b00000000000000000000000000000000) (let ((res!632919 (let ((h!20350 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!80804 (bvmul (bvxor h!20350 (bvlshr h!20350 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!80804 (bvlshr x!80804 #b00000000000000000000000000001101)) (mask!27164 thiss!1141)))))) (and (bvslt res!632919 (bvadd (mask!27164 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!632919 #b00000000000000000000000000000000))))))

(assert (=> d!114081 (= (toIndex!0 key!756 (mask!27164 thiss!1141)) (bvand (bvxor lt!424999 (bvlshr lt!424999 #b00000000000000000000000000001101)) (mask!27164 thiss!1141)))))

(assert (=> d!114069 d!114081))

(assert (=> d!114069 d!114077))

(declare-fun b!941564 () Bool)

(declare-fun e!529345 () Bool)

(declare-fun call!40926 () Bool)

(assert (=> b!941564 (= e!529345 call!40926)))

(declare-fun b!941566 () Bool)

(declare-fun e!529346 () Bool)

(assert (=> b!941566 (= e!529346 call!40926)))

(declare-fun b!941567 () Bool)

(declare-fun e!529347 () Bool)

(assert (=> b!941567 (= e!529347 e!529346)))

(declare-fun c!98095 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!941567 (= c!98095 (validKeyInArray!0 (select (arr!27331 (_keys!10450 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40923 () Bool)

(assert (=> bm!40923 (= call!40926 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10450 thiss!1141) (mask!27164 thiss!1141)))))

(declare-fun d!114083 () Bool)

(declare-fun res!632924 () Bool)

(assert (=> d!114083 (=> res!632924 e!529347)))

(assert (=> d!114083 (= res!632924 (bvsge #b00000000000000000000000000000000 (size!27793 (_keys!10450 thiss!1141))))))

(assert (=> d!114083 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10450 thiss!1141) (mask!27164 thiss!1141)) e!529347)))

(declare-fun b!941565 () Bool)

(assert (=> b!941565 (= e!529346 e!529345)))

(declare-fun lt!425008 () (_ BitVec 64))

(assert (=> b!941565 (= lt!425008 (select (arr!27331 (_keys!10450 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31802 0))(
  ( (Unit!31803) )
))
(declare-fun lt!425007 () Unit!31802)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56796 (_ BitVec 64) (_ BitVec 32)) Unit!31802)

(assert (=> b!941565 (= lt!425007 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10450 thiss!1141) lt!425008 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941565 (arrayContainsKey!0 (_keys!10450 thiss!1141) lt!425008 #b00000000000000000000000000000000)))

(declare-fun lt!425006 () Unit!31802)

(assert (=> b!941565 (= lt!425006 lt!425007)))

(declare-fun res!632925 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56796 (_ BitVec 32)) SeekEntryResult!9022)

(assert (=> b!941565 (= res!632925 (= (seekEntryOrOpen!0 (select (arr!27331 (_keys!10450 thiss!1141)) #b00000000000000000000000000000000) (_keys!10450 thiss!1141) (mask!27164 thiss!1141)) (Found!9022 #b00000000000000000000000000000000)))))

(assert (=> b!941565 (=> (not res!632925) (not e!529345))))

(assert (= (and d!114083 (not res!632924)) b!941567))

(assert (= (and b!941567 c!98095) b!941565))

(assert (= (and b!941567 (not c!98095)) b!941566))

(assert (= (and b!941565 res!632925) b!941564))

(assert (= (or b!941564 b!941566) bm!40923))

(declare-fun m!876593 () Bool)

(assert (=> b!941567 m!876593))

(assert (=> b!941567 m!876593))

(declare-fun m!876595 () Bool)

(assert (=> b!941567 m!876595))

(declare-fun m!876597 () Bool)

(assert (=> bm!40923 m!876597))

(assert (=> b!941565 m!876593))

(declare-fun m!876599 () Bool)

(assert (=> b!941565 m!876599))

(declare-fun m!876601 () Bool)

(assert (=> b!941565 m!876601))

(assert (=> b!941565 m!876593))

(declare-fun m!876603 () Bool)

(assert (=> b!941565 m!876603))

(assert (=> b!941519 d!114083))

(declare-fun b!941576 () Bool)

(declare-fun e!529352 () (_ BitVec 32))

(declare-fun call!40929 () (_ BitVec 32))

(assert (=> b!941576 (= e!529352 (bvadd #b00000000000000000000000000000001 call!40929))))

(declare-fun d!114085 () Bool)

(declare-fun lt!425011 () (_ BitVec 32))

(assert (=> d!114085 (and (bvsge lt!425011 #b00000000000000000000000000000000) (bvsle lt!425011 (bvsub (size!27793 (_keys!10450 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!529353 () (_ BitVec 32))

(assert (=> d!114085 (= lt!425011 e!529353)))

(declare-fun c!98100 () Bool)

(assert (=> d!114085 (= c!98100 (bvsge #b00000000000000000000000000000000 (size!27793 (_keys!10450 thiss!1141))))))

(assert (=> d!114085 (and (bvsle #b00000000000000000000000000000000 (size!27793 (_keys!10450 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27793 (_keys!10450 thiss!1141)) (size!27793 (_keys!10450 thiss!1141))))))

(assert (=> d!114085 (= (arrayCountValidKeys!0 (_keys!10450 thiss!1141) #b00000000000000000000000000000000 (size!27793 (_keys!10450 thiss!1141))) lt!425011)))

(declare-fun b!941577 () Bool)

(assert (=> b!941577 (= e!529353 e!529352)))

(declare-fun c!98101 () Bool)

(assert (=> b!941577 (= c!98101 (validKeyInArray!0 (select (arr!27331 (_keys!10450 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40926 () Bool)

(assert (=> bm!40926 (= call!40929 (arrayCountValidKeys!0 (_keys!10450 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27793 (_keys!10450 thiss!1141))))))

(declare-fun b!941578 () Bool)

(assert (=> b!941578 (= e!529352 call!40929)))

(declare-fun b!941579 () Bool)

(assert (=> b!941579 (= e!529353 #b00000000000000000000000000000000)))

(assert (= (and d!114085 c!98100) b!941579))

(assert (= (and d!114085 (not c!98100)) b!941577))

(assert (= (and b!941577 c!98101) b!941576))

(assert (= (and b!941577 (not c!98101)) b!941578))

(assert (= (or b!941576 b!941578) bm!40926))

(assert (=> b!941577 m!876593))

(assert (=> b!941577 m!876593))

(assert (=> b!941577 m!876595))

(declare-fun m!876605 () Bool)

(assert (=> bm!40926 m!876605))

(assert (=> b!941518 d!114085))

(declare-fun b!941589 () Bool)

(declare-fun res!632934 () Bool)

(declare-fun e!529356 () Bool)

(assert (=> b!941589 (=> (not res!632934) (not e!529356))))

(declare-fun size!27796 (LongMapFixedSize!4608) (_ BitVec 32))

(assert (=> b!941589 (= res!632934 (bvsge (size!27796 thiss!1141) (_size!2359 thiss!1141)))))

(declare-fun b!941591 () Bool)

(assert (=> b!941591 (= e!529356 (and (bvsge (extraKeys!5327 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5327 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2359 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!941590 () Bool)

(declare-fun res!632937 () Bool)

(assert (=> b!941590 (=> (not res!632937) (not e!529356))))

(assert (=> b!941590 (= res!632937 (= (size!27796 thiss!1141) (bvadd (_size!2359 thiss!1141) (bvsdiv (bvadd (extraKeys!5327 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!941588 () Bool)

(declare-fun res!632935 () Bool)

(assert (=> b!941588 (=> (not res!632935) (not e!529356))))

(assert (=> b!941588 (= res!632935 (and (= (size!27792 (_values!5618 thiss!1141)) (bvadd (mask!27164 thiss!1141) #b00000000000000000000000000000001)) (= (size!27793 (_keys!10450 thiss!1141)) (size!27792 (_values!5618 thiss!1141))) (bvsge (_size!2359 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2359 thiss!1141) (bvadd (mask!27164 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun d!114087 () Bool)

(declare-fun res!632936 () Bool)

(assert (=> d!114087 (=> (not res!632936) (not e!529356))))

(assert (=> d!114087 (= res!632936 (validMask!0 (mask!27164 thiss!1141)))))

(assert (=> d!114087 (= (simpleValid!341 thiss!1141) e!529356)))

(assert (= (and d!114087 res!632936) b!941588))

(assert (= (and b!941588 res!632935) b!941589))

(assert (= (and b!941589 res!632934) b!941590))

(assert (= (and b!941590 res!632937) b!941591))

(declare-fun m!876607 () Bool)

(assert (=> b!941589 m!876607))

(assert (=> b!941590 m!876607))

(assert (=> d!114087 m!876543))

(assert (=> d!114071 d!114087))

(declare-fun b!941604 () Bool)

(declare-fun e!529364 () SeekEntryResult!9022)

(assert (=> b!941604 (= e!529364 (MissingVacant!9022 (index!38461 lt!424984)))))

(declare-fun b!941605 () Bool)

(declare-fun e!529365 () SeekEntryResult!9022)

(declare-fun e!529363 () SeekEntryResult!9022)

(assert (=> b!941605 (= e!529365 e!529363)))

(declare-fun c!98109 () Bool)

(declare-fun lt!425016 () (_ BitVec 64))

(assert (=> b!941605 (= c!98109 (= lt!425016 key!756))))

(declare-fun b!941606 () Bool)

(declare-fun c!98108 () Bool)

(assert (=> b!941606 (= c!98108 (= lt!425016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941606 (= e!529363 e!529364)))

(declare-fun d!114089 () Bool)

(declare-fun lt!425017 () SeekEntryResult!9022)

(assert (=> d!114089 (and (or ((_ is Undefined!9022) lt!425017) (not ((_ is Found!9022) lt!425017)) (and (bvsge (index!38460 lt!425017) #b00000000000000000000000000000000) (bvslt (index!38460 lt!425017) (size!27793 (_keys!10450 thiss!1141))))) (or ((_ is Undefined!9022) lt!425017) ((_ is Found!9022) lt!425017) (not ((_ is MissingVacant!9022) lt!425017)) (not (= (index!38462 lt!425017) (index!38461 lt!424984))) (and (bvsge (index!38462 lt!425017) #b00000000000000000000000000000000) (bvslt (index!38462 lt!425017) (size!27793 (_keys!10450 thiss!1141))))) (or ((_ is Undefined!9022) lt!425017) (ite ((_ is Found!9022) lt!425017) (= (select (arr!27331 (_keys!10450 thiss!1141)) (index!38460 lt!425017)) key!756) (and ((_ is MissingVacant!9022) lt!425017) (= (index!38462 lt!425017) (index!38461 lt!424984)) (= (select (arr!27331 (_keys!10450 thiss!1141)) (index!38462 lt!425017)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114089 (= lt!425017 e!529365)))

(declare-fun c!98110 () Bool)

(assert (=> d!114089 (= c!98110 (bvsge (x!80788 lt!424984) #b01111111111111111111111111111110))))

(assert (=> d!114089 (= lt!425016 (select (arr!27331 (_keys!10450 thiss!1141)) (index!38461 lt!424984)))))

(assert (=> d!114089 (validMask!0 (mask!27164 thiss!1141))))

(assert (=> d!114089 (= (seekKeyOrZeroReturnVacant!0 (x!80788 lt!424984) (index!38461 lt!424984) (index!38461 lt!424984) key!756 (_keys!10450 thiss!1141) (mask!27164 thiss!1141)) lt!425017)))

(declare-fun b!941607 () Bool)

(assert (=> b!941607 (= e!529364 (seekKeyOrZeroReturnVacant!0 (bvadd (x!80788 lt!424984) #b00000000000000000000000000000001) (nextIndex!0 (index!38461 lt!424984) (x!80788 lt!424984) (mask!27164 thiss!1141)) (index!38461 lt!424984) key!756 (_keys!10450 thiss!1141) (mask!27164 thiss!1141)))))

(declare-fun b!941608 () Bool)

(assert (=> b!941608 (= e!529363 (Found!9022 (index!38461 lt!424984)))))

(declare-fun b!941609 () Bool)

(assert (=> b!941609 (= e!529365 Undefined!9022)))

(assert (= (and d!114089 c!98110) b!941609))

(assert (= (and d!114089 (not c!98110)) b!941605))

(assert (= (and b!941605 c!98109) b!941608))

(assert (= (and b!941605 (not c!98109)) b!941606))

(assert (= (and b!941606 c!98108) b!941604))

(assert (= (and b!941606 (not c!98108)) b!941607))

(declare-fun m!876609 () Bool)

(assert (=> d!114089 m!876609))

(declare-fun m!876611 () Bool)

(assert (=> d!114089 m!876611))

(assert (=> d!114089 m!876573))

(assert (=> d!114089 m!876543))

(declare-fun m!876613 () Bool)

(assert (=> b!941607 m!876613))

(assert (=> b!941607 m!876613))

(declare-fun m!876615 () Bool)

(assert (=> b!941607 m!876615))

(assert (=> b!941507 d!114089))

(declare-fun b!941620 () Bool)

(declare-fun e!529377 () Bool)

(declare-fun e!529374 () Bool)

(assert (=> b!941620 (= e!529377 e!529374)))

(declare-fun res!632944 () Bool)

(assert (=> b!941620 (=> (not res!632944) (not e!529374))))

(declare-fun e!529375 () Bool)

(assert (=> b!941620 (= res!632944 (not e!529375))))

(declare-fun res!632946 () Bool)

(assert (=> b!941620 (=> (not res!632946) (not e!529375))))

(assert (=> b!941620 (= res!632946 (validKeyInArray!0 (select (arr!27331 (_keys!10450 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941621 () Bool)

(declare-fun e!529376 () Bool)

(declare-fun call!40932 () Bool)

(assert (=> b!941621 (= e!529376 call!40932)))

(declare-fun bm!40929 () Bool)

(declare-fun c!98113 () Bool)

(assert (=> bm!40929 (= call!40932 (arrayNoDuplicates!0 (_keys!10450 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98113 (Cons!19202 (select (arr!27331 (_keys!10450 thiss!1141)) #b00000000000000000000000000000000) Nil!19203) Nil!19203)))))

(declare-fun d!114091 () Bool)

(declare-fun res!632945 () Bool)

(assert (=> d!114091 (=> res!632945 e!529377)))

(assert (=> d!114091 (= res!632945 (bvsge #b00000000000000000000000000000000 (size!27793 (_keys!10450 thiss!1141))))))

(assert (=> d!114091 (= (arrayNoDuplicates!0 (_keys!10450 thiss!1141) #b00000000000000000000000000000000 Nil!19203) e!529377)))

(declare-fun b!941622 () Bool)

(assert (=> b!941622 (= e!529376 call!40932)))

(declare-fun b!941623 () Bool)

(assert (=> b!941623 (= e!529374 e!529376)))

(assert (=> b!941623 (= c!98113 (validKeyInArray!0 (select (arr!27331 (_keys!10450 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941624 () Bool)

(declare-fun contains!5132 (List!19206 (_ BitVec 64)) Bool)

(assert (=> b!941624 (= e!529375 (contains!5132 Nil!19203 (select (arr!27331 (_keys!10450 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114091 (not res!632945)) b!941620))

(assert (= (and b!941620 res!632946) b!941624))

(assert (= (and b!941620 res!632944) b!941623))

(assert (= (and b!941623 c!98113) b!941621))

(assert (= (and b!941623 (not c!98113)) b!941622))

(assert (= (or b!941621 b!941622) bm!40929))

(assert (=> b!941620 m!876593))

(assert (=> b!941620 m!876593))

(assert (=> b!941620 m!876595))

(assert (=> bm!40929 m!876593))

(declare-fun m!876617 () Bool)

(assert (=> bm!40929 m!876617))

(assert (=> b!941623 m!876593))

(assert (=> b!941623 m!876593))

(assert (=> b!941623 m!876595))

(assert (=> b!941624 m!876593))

(assert (=> b!941624 m!876593))

(declare-fun m!876619 () Bool)

(assert (=> b!941624 m!876619))

(assert (=> b!941520 d!114091))

(declare-fun b!941626 () Bool)

(declare-fun e!529379 () Bool)

(assert (=> b!941626 (= e!529379 tp_is_empty!20421)))

(declare-fun mapIsEmpty!32436 () Bool)

(declare-fun mapRes!32436 () Bool)

(assert (=> mapIsEmpty!32436 mapRes!32436))

(declare-fun condMapEmpty!32436 () Bool)

(declare-fun mapDefault!32436 () ValueCell!9729)

(assert (=> mapNonEmpty!32435 (= condMapEmpty!32436 (= mapRest!32435 ((as const (Array (_ BitVec 32) ValueCell!9729)) mapDefault!32436)))))

(assert (=> mapNonEmpty!32435 (= tp!62230 (and e!529379 mapRes!32436))))

(declare-fun b!941625 () Bool)

(declare-fun e!529378 () Bool)

(assert (=> b!941625 (= e!529378 tp_is_empty!20421)))

(declare-fun mapNonEmpty!32436 () Bool)

(declare-fun tp!62231 () Bool)

(assert (=> mapNonEmpty!32436 (= mapRes!32436 (and tp!62231 e!529378))))

(declare-fun mapRest!32436 () (Array (_ BitVec 32) ValueCell!9729))

(declare-fun mapKey!32436 () (_ BitVec 32))

(declare-fun mapValue!32436 () ValueCell!9729)

(assert (=> mapNonEmpty!32436 (= mapRest!32435 (store mapRest!32436 mapKey!32436 mapValue!32436))))

(assert (= (and mapNonEmpty!32435 condMapEmpty!32436) mapIsEmpty!32436))

(assert (= (and mapNonEmpty!32435 (not condMapEmpty!32436)) mapNonEmpty!32436))

(assert (= (and mapNonEmpty!32436 ((_ is ValueCellFull!9729) mapValue!32436)) b!941625))

(assert (= (and mapNonEmpty!32435 ((_ is ValueCellFull!9729) mapDefault!32436)) b!941626))

(declare-fun m!876621 () Bool)

(assert (=> mapNonEmpty!32436 m!876621))

(check-sat (not b!941620) (not b!941624) (not b!941567) tp_is_empty!20421 (not b!941577) (not b!941590) (not b!941565) (not bm!40926) (not b!941554) (not b_next!17913) (not b!941607) (not d!114079) (not bm!40929) (not mapNonEmpty!32436) (not b!941589) b_and!29325 (not d!114087) (not b!941623) (not bm!40923) (not d!114089))
(check-sat b_and!29325 (not b_next!17913))
