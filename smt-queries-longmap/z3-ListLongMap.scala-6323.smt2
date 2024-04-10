; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81324 () Bool)

(assert start!81324)

(declare-fun b!951145 () Bool)

(declare-fun b_free!18261 () Bool)

(declare-fun b_next!18261 () Bool)

(assert (=> b!951145 (= b_free!18261 (not b_next!18261))))

(declare-fun tp!63388 () Bool)

(declare-fun b_and!29727 () Bool)

(assert (=> b!951145 (= tp!63388 b_and!29727)))

(declare-fun mapIsEmpty!33075 () Bool)

(declare-fun mapRes!33075 () Bool)

(assert (=> mapIsEmpty!33075 mapRes!33075))

(declare-fun res!637504 () Bool)

(declare-fun e!535563 () Bool)

(assert (=> start!81324 (=> (not res!637504) (not e!535563))))

(declare-datatypes ((V!32657 0))(
  ( (V!32658 (val!10435 Int)) )
))
(declare-datatypes ((ValueCell!9903 0))(
  ( (ValueCellFull!9903 (v!12981 V!32657)) (EmptyCell!9903) )
))
(declare-datatypes ((array!57562 0))(
  ( (array!57563 (arr!27678 (Array (_ BitVec 32) ValueCell!9903)) (size!28156 (_ BitVec 32))) )
))
(declare-datatypes ((array!57564 0))(
  ( (array!57565 (arr!27679 (Array (_ BitVec 32) (_ BitVec 64))) (size!28157 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4956 0))(
  ( (LongMapFixedSize!4957 (defaultEntry!5797 Int) (mask!27613 (_ BitVec 32)) (extraKeys!5529 (_ BitVec 32)) (zeroValue!5633 V!32657) (minValue!5633 V!32657) (_size!2533 (_ BitVec 32)) (_keys!10739 array!57564) (_values!5820 array!57562) (_vacant!2533 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4956)

(declare-fun valid!1885 (LongMapFixedSize!4956) Bool)

(assert (=> start!81324 (= res!637504 (valid!1885 thiss!1141))))

(assert (=> start!81324 e!535563))

(declare-fun e!535565 () Bool)

(assert (=> start!81324 e!535565))

(assert (=> start!81324 true))

(declare-fun b!951137 () Bool)

(declare-fun e!535567 () Bool)

(declare-fun e!535564 () Bool)

(assert (=> b!951137 (= e!535567 (and e!535564 mapRes!33075))))

(declare-fun condMapEmpty!33075 () Bool)

(declare-fun mapDefault!33075 () ValueCell!9903)

(assert (=> b!951137 (= condMapEmpty!33075 (= (arr!27678 (_values!5820 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9903)) mapDefault!33075)))))

(declare-fun b!951138 () Bool)

(declare-fun e!535568 () Bool)

(assert (=> b!951138 (= e!535563 (not e!535568))))

(declare-fun res!637507 () Bool)

(assert (=> b!951138 (=> res!637507 e!535568)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951138 (= res!637507 (not (validMask!0 (mask!27613 thiss!1141))))))

(declare-fun lt!428403 () (_ BitVec 32))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57564 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951138 (= lt!428403 (arrayScanForKey!0 (_keys!10739 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951138 (arrayContainsKey!0 (_keys!10739 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!32009 0))(
  ( (Unit!32010) )
))
(declare-fun lt!428402 () Unit!32009)

(declare-fun lemmaKeyInListMapIsInArray!324 (array!57564 array!57562 (_ BitVec 32) (_ BitVec 32) V!32657 V!32657 (_ BitVec 64) Int) Unit!32009)

(assert (=> b!951138 (= lt!428402 (lemmaKeyInListMapIsInArray!324 (_keys!10739 thiss!1141) (_values!5820 thiss!1141) (mask!27613 thiss!1141) (extraKeys!5529 thiss!1141) (zeroValue!5633 thiss!1141) (minValue!5633 thiss!1141) key!756 (defaultEntry!5797 thiss!1141)))))

(declare-fun b!951139 () Bool)

(assert (=> b!951139 (= e!535568 (or (not (= (size!28157 (_keys!10739 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27613 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!28157 (_keys!10739 thiss!1141))) (and (bvsge lt!428403 #b00000000000000000000000000000000) (bvsle lt!428403 (size!28157 (_keys!10739 thiss!1141))))))))

(declare-fun b!951140 () Bool)

(declare-fun res!637505 () Bool)

(assert (=> b!951140 (=> (not res!637505) (not e!535563))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9149 0))(
  ( (MissingZero!9149 (index!38967 (_ BitVec 32))) (Found!9149 (index!38968 (_ BitVec 32))) (Intermediate!9149 (undefined!9961 Bool) (index!38969 (_ BitVec 32)) (x!81829 (_ BitVec 32))) (Undefined!9149) (MissingVacant!9149 (index!38970 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57564 (_ BitVec 32)) SeekEntryResult!9149)

(assert (=> b!951140 (= res!637505 (not ((_ is Found!9149) (seekEntry!0 key!756 (_keys!10739 thiss!1141) (mask!27613 thiss!1141)))))))

(declare-fun b!951141 () Bool)

(declare-fun res!637508 () Bool)

(assert (=> b!951141 (=> (not res!637508) (not e!535563))))

(declare-datatypes ((tuple2!13562 0))(
  ( (tuple2!13563 (_1!6792 (_ BitVec 64)) (_2!6792 V!32657)) )
))
(declare-datatypes ((List!19349 0))(
  ( (Nil!19346) (Cons!19345 (h!20506 tuple2!13562) (t!27694 List!19349)) )
))
(declare-datatypes ((ListLongMap!12259 0))(
  ( (ListLongMap!12260 (toList!6145 List!19349)) )
))
(declare-fun contains!5238 (ListLongMap!12259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3378 (array!57564 array!57562 (_ BitVec 32) (_ BitVec 32) V!32657 V!32657 (_ BitVec 32) Int) ListLongMap!12259)

(assert (=> b!951141 (= res!637508 (contains!5238 (getCurrentListMap!3378 (_keys!10739 thiss!1141) (_values!5820 thiss!1141) (mask!27613 thiss!1141) (extraKeys!5529 thiss!1141) (zeroValue!5633 thiss!1141) (minValue!5633 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5797 thiss!1141)) key!756))))

(declare-fun b!951142 () Bool)

(declare-fun tp_is_empty!20769 () Bool)

(assert (=> b!951142 (= e!535564 tp_is_empty!20769)))

(declare-fun mapNonEmpty!33075 () Bool)

(declare-fun tp!63389 () Bool)

(declare-fun e!535566 () Bool)

(assert (=> mapNonEmpty!33075 (= mapRes!33075 (and tp!63389 e!535566))))

(declare-fun mapValue!33075 () ValueCell!9903)

(declare-fun mapKey!33075 () (_ BitVec 32))

(declare-fun mapRest!33075 () (Array (_ BitVec 32) ValueCell!9903))

(assert (=> mapNonEmpty!33075 (= (arr!27678 (_values!5820 thiss!1141)) (store mapRest!33075 mapKey!33075 mapValue!33075))))

(declare-fun b!951143 () Bool)

(declare-fun res!637506 () Bool)

(assert (=> b!951143 (=> (not res!637506) (not e!535563))))

(assert (=> b!951143 (= res!637506 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!951144 () Bool)

(assert (=> b!951144 (= e!535566 tp_is_empty!20769)))

(declare-fun array_inv!21484 (array!57564) Bool)

(declare-fun array_inv!21485 (array!57562) Bool)

(assert (=> b!951145 (= e!535565 (and tp!63388 tp_is_empty!20769 (array_inv!21484 (_keys!10739 thiss!1141)) (array_inv!21485 (_values!5820 thiss!1141)) e!535567))))

(assert (= (and start!81324 res!637504) b!951143))

(assert (= (and b!951143 res!637506) b!951140))

(assert (= (and b!951140 res!637505) b!951141))

(assert (= (and b!951141 res!637508) b!951138))

(assert (= (and b!951138 (not res!637507)) b!951139))

(assert (= (and b!951137 condMapEmpty!33075) mapIsEmpty!33075))

(assert (= (and b!951137 (not condMapEmpty!33075)) mapNonEmpty!33075))

(assert (= (and mapNonEmpty!33075 ((_ is ValueCellFull!9903) mapValue!33075)) b!951144))

(assert (= (and b!951137 ((_ is ValueCellFull!9903) mapDefault!33075)) b!951142))

(assert (= b!951145 b!951137))

(assert (= start!81324 b!951145))

(declare-fun m!883459 () Bool)

(assert (=> b!951141 m!883459))

(assert (=> b!951141 m!883459))

(declare-fun m!883461 () Bool)

(assert (=> b!951141 m!883461))

(declare-fun m!883463 () Bool)

(assert (=> mapNonEmpty!33075 m!883463))

(declare-fun m!883465 () Bool)

(assert (=> b!951138 m!883465))

(declare-fun m!883467 () Bool)

(assert (=> b!951138 m!883467))

(declare-fun m!883469 () Bool)

(assert (=> b!951138 m!883469))

(declare-fun m!883471 () Bool)

(assert (=> b!951138 m!883471))

(declare-fun m!883473 () Bool)

(assert (=> start!81324 m!883473))

(declare-fun m!883475 () Bool)

(assert (=> b!951145 m!883475))

(declare-fun m!883477 () Bool)

(assert (=> b!951145 m!883477))

(declare-fun m!883479 () Bool)

(assert (=> b!951140 m!883479))

(check-sat (not b_next!18261) (not mapNonEmpty!33075) (not start!81324) (not b!951141) tp_is_empty!20769 (not b!951138) b_and!29727 (not b!951145) (not b!951140))
(check-sat b_and!29727 (not b_next!18261))
(get-model)

(declare-fun d!115313 () Bool)

(declare-fun lt!428420 () SeekEntryResult!9149)

(assert (=> d!115313 (and (or ((_ is MissingVacant!9149) lt!428420) (not ((_ is Found!9149) lt!428420)) (and (bvsge (index!38968 lt!428420) #b00000000000000000000000000000000) (bvslt (index!38968 lt!428420) (size!28157 (_keys!10739 thiss!1141))))) (not ((_ is MissingVacant!9149) lt!428420)) (or (not ((_ is Found!9149) lt!428420)) (= (select (arr!27679 (_keys!10739 thiss!1141)) (index!38968 lt!428420)) key!756)))))

(declare-fun e!535596 () SeekEntryResult!9149)

(assert (=> d!115313 (= lt!428420 e!535596)))

(declare-fun c!99393 () Bool)

(declare-fun lt!428418 () SeekEntryResult!9149)

(assert (=> d!115313 (= c!99393 (and ((_ is Intermediate!9149) lt!428418) (undefined!9961 lt!428418)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57564 (_ BitVec 32)) SeekEntryResult!9149)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115313 (= lt!428418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27613 thiss!1141)) key!756 (_keys!10739 thiss!1141) (mask!27613 thiss!1141)))))

(assert (=> d!115313 (validMask!0 (mask!27613 thiss!1141))))

(assert (=> d!115313 (= (seekEntry!0 key!756 (_keys!10739 thiss!1141) (mask!27613 thiss!1141)) lt!428420)))

(declare-fun b!951185 () Bool)

(declare-fun e!535598 () SeekEntryResult!9149)

(assert (=> b!951185 (= e!535598 (Found!9149 (index!38969 lt!428418)))))

(declare-fun b!951186 () Bool)

(declare-fun e!535597 () SeekEntryResult!9149)

(assert (=> b!951186 (= e!535597 (MissingZero!9149 (index!38969 lt!428418)))))

(declare-fun b!951187 () Bool)

(declare-fun c!99392 () Bool)

(declare-fun lt!428421 () (_ BitVec 64))

(assert (=> b!951187 (= c!99392 (= lt!428421 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!951187 (= e!535598 e!535597)))

(declare-fun b!951188 () Bool)

(assert (=> b!951188 (= e!535596 Undefined!9149)))

(declare-fun b!951189 () Bool)

(declare-fun lt!428419 () SeekEntryResult!9149)

(assert (=> b!951189 (= e!535597 (ite ((_ is MissingVacant!9149) lt!428419) (MissingZero!9149 (index!38970 lt!428419)) lt!428419))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57564 (_ BitVec 32)) SeekEntryResult!9149)

(assert (=> b!951189 (= lt!428419 (seekKeyOrZeroReturnVacant!0 (x!81829 lt!428418) (index!38969 lt!428418) (index!38969 lt!428418) key!756 (_keys!10739 thiss!1141) (mask!27613 thiss!1141)))))

(declare-fun b!951190 () Bool)

(assert (=> b!951190 (= e!535596 e!535598)))

(assert (=> b!951190 (= lt!428421 (select (arr!27679 (_keys!10739 thiss!1141)) (index!38969 lt!428418)))))

(declare-fun c!99391 () Bool)

(assert (=> b!951190 (= c!99391 (= lt!428421 key!756))))

(assert (= (and d!115313 c!99393) b!951188))

(assert (= (and d!115313 (not c!99393)) b!951190))

(assert (= (and b!951190 c!99391) b!951185))

(assert (= (and b!951190 (not c!99391)) b!951187))

(assert (= (and b!951187 c!99392) b!951186))

(assert (= (and b!951187 (not c!99392)) b!951189))

(declare-fun m!883503 () Bool)

(assert (=> d!115313 m!883503))

(declare-fun m!883505 () Bool)

(assert (=> d!115313 m!883505))

(assert (=> d!115313 m!883505))

(declare-fun m!883507 () Bool)

(assert (=> d!115313 m!883507))

(assert (=> d!115313 m!883465))

(declare-fun m!883509 () Bool)

(assert (=> b!951189 m!883509))

(declare-fun m!883511 () Bool)

(assert (=> b!951190 m!883511))

(assert (=> b!951140 d!115313))

(declare-fun d!115315 () Bool)

(assert (=> d!115315 (= (validMask!0 (mask!27613 thiss!1141)) (and (or (= (mask!27613 thiss!1141) #b00000000000000000000000000000111) (= (mask!27613 thiss!1141) #b00000000000000000000000000001111) (= (mask!27613 thiss!1141) #b00000000000000000000000000011111) (= (mask!27613 thiss!1141) #b00000000000000000000000000111111) (= (mask!27613 thiss!1141) #b00000000000000000000000001111111) (= (mask!27613 thiss!1141) #b00000000000000000000000011111111) (= (mask!27613 thiss!1141) #b00000000000000000000000111111111) (= (mask!27613 thiss!1141) #b00000000000000000000001111111111) (= (mask!27613 thiss!1141) #b00000000000000000000011111111111) (= (mask!27613 thiss!1141) #b00000000000000000000111111111111) (= (mask!27613 thiss!1141) #b00000000000000000001111111111111) (= (mask!27613 thiss!1141) #b00000000000000000011111111111111) (= (mask!27613 thiss!1141) #b00000000000000000111111111111111) (= (mask!27613 thiss!1141) #b00000000000000001111111111111111) (= (mask!27613 thiss!1141) #b00000000000000011111111111111111) (= (mask!27613 thiss!1141) #b00000000000000111111111111111111) (= (mask!27613 thiss!1141) #b00000000000001111111111111111111) (= (mask!27613 thiss!1141) #b00000000000011111111111111111111) (= (mask!27613 thiss!1141) #b00000000000111111111111111111111) (= (mask!27613 thiss!1141) #b00000000001111111111111111111111) (= (mask!27613 thiss!1141) #b00000000011111111111111111111111) (= (mask!27613 thiss!1141) #b00000000111111111111111111111111) (= (mask!27613 thiss!1141) #b00000001111111111111111111111111) (= (mask!27613 thiss!1141) #b00000011111111111111111111111111) (= (mask!27613 thiss!1141) #b00000111111111111111111111111111) (= (mask!27613 thiss!1141) #b00001111111111111111111111111111) (= (mask!27613 thiss!1141) #b00011111111111111111111111111111) (= (mask!27613 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27613 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!951138 d!115315))

(declare-fun d!115317 () Bool)

(declare-fun lt!428424 () (_ BitVec 32))

(assert (=> d!115317 (and (or (bvslt lt!428424 #b00000000000000000000000000000000) (bvsge lt!428424 (size!28157 (_keys!10739 thiss!1141))) (and (bvsge lt!428424 #b00000000000000000000000000000000) (bvslt lt!428424 (size!28157 (_keys!10739 thiss!1141))))) (bvsge lt!428424 #b00000000000000000000000000000000) (bvslt lt!428424 (size!28157 (_keys!10739 thiss!1141))) (= (select (arr!27679 (_keys!10739 thiss!1141)) lt!428424) key!756))))

(declare-fun e!535601 () (_ BitVec 32))

(assert (=> d!115317 (= lt!428424 e!535601)))

(declare-fun c!99396 () Bool)

(assert (=> d!115317 (= c!99396 (= (select (arr!27679 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115317 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28157 (_keys!10739 thiss!1141))) (bvslt (size!28157 (_keys!10739 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115317 (= (arrayScanForKey!0 (_keys!10739 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428424)))

(declare-fun b!951195 () Bool)

(assert (=> b!951195 (= e!535601 #b00000000000000000000000000000000)))

(declare-fun b!951196 () Bool)

(assert (=> b!951196 (= e!535601 (arrayScanForKey!0 (_keys!10739 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115317 c!99396) b!951195))

(assert (= (and d!115317 (not c!99396)) b!951196))

(declare-fun m!883513 () Bool)

(assert (=> d!115317 m!883513))

(declare-fun m!883515 () Bool)

(assert (=> d!115317 m!883515))

(declare-fun m!883517 () Bool)

(assert (=> b!951196 m!883517))

(assert (=> b!951138 d!115317))

(declare-fun d!115319 () Bool)

(declare-fun res!637528 () Bool)

(declare-fun e!535606 () Bool)

(assert (=> d!115319 (=> res!637528 e!535606)))

(assert (=> d!115319 (= res!637528 (= (select (arr!27679 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115319 (= (arrayContainsKey!0 (_keys!10739 thiss!1141) key!756 #b00000000000000000000000000000000) e!535606)))

(declare-fun b!951201 () Bool)

(declare-fun e!535607 () Bool)

(assert (=> b!951201 (= e!535606 e!535607)))

(declare-fun res!637529 () Bool)

(assert (=> b!951201 (=> (not res!637529) (not e!535607))))

(assert (=> b!951201 (= res!637529 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28157 (_keys!10739 thiss!1141))))))

(declare-fun b!951202 () Bool)

(assert (=> b!951202 (= e!535607 (arrayContainsKey!0 (_keys!10739 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115319 (not res!637528)) b!951201))

(assert (= (and b!951201 res!637529) b!951202))

(assert (=> d!115319 m!883515))

(declare-fun m!883519 () Bool)

(assert (=> b!951202 m!883519))

(assert (=> b!951138 d!115319))

(declare-fun d!115321 () Bool)

(declare-fun e!535610 () Bool)

(assert (=> d!115321 e!535610))

(declare-fun c!99399 () Bool)

(assert (=> d!115321 (= c!99399 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428427 () Unit!32009)

(declare-fun choose!1590 (array!57564 array!57562 (_ BitVec 32) (_ BitVec 32) V!32657 V!32657 (_ BitVec 64) Int) Unit!32009)

(assert (=> d!115321 (= lt!428427 (choose!1590 (_keys!10739 thiss!1141) (_values!5820 thiss!1141) (mask!27613 thiss!1141) (extraKeys!5529 thiss!1141) (zeroValue!5633 thiss!1141) (minValue!5633 thiss!1141) key!756 (defaultEntry!5797 thiss!1141)))))

(assert (=> d!115321 (validMask!0 (mask!27613 thiss!1141))))

(assert (=> d!115321 (= (lemmaKeyInListMapIsInArray!324 (_keys!10739 thiss!1141) (_values!5820 thiss!1141) (mask!27613 thiss!1141) (extraKeys!5529 thiss!1141) (zeroValue!5633 thiss!1141) (minValue!5633 thiss!1141) key!756 (defaultEntry!5797 thiss!1141)) lt!428427)))

(declare-fun b!951207 () Bool)

(assert (=> b!951207 (= e!535610 (arrayContainsKey!0 (_keys!10739 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!951208 () Bool)

(assert (=> b!951208 (= e!535610 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5529 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5529 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115321 c!99399) b!951207))

(assert (= (and d!115321 (not c!99399)) b!951208))

(declare-fun m!883521 () Bool)

(assert (=> d!115321 m!883521))

(assert (=> d!115321 m!883465))

(assert (=> b!951207 m!883469))

(assert (=> b!951138 d!115321))

(declare-fun d!115323 () Bool)

(assert (=> d!115323 (= (array_inv!21484 (_keys!10739 thiss!1141)) (bvsge (size!28157 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951145 d!115323))

(declare-fun d!115325 () Bool)

(assert (=> d!115325 (= (array_inv!21485 (_values!5820 thiss!1141)) (bvsge (size!28156 (_values!5820 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951145 d!115325))

(declare-fun d!115327 () Bool)

(declare-fun e!535615 () Bool)

(assert (=> d!115327 e!535615))

(declare-fun res!637532 () Bool)

(assert (=> d!115327 (=> res!637532 e!535615)))

(declare-fun lt!428438 () Bool)

(assert (=> d!115327 (= res!637532 (not lt!428438))))

(declare-fun lt!428439 () Bool)

(assert (=> d!115327 (= lt!428438 lt!428439)))

(declare-fun lt!428436 () Unit!32009)

(declare-fun e!535616 () Unit!32009)

(assert (=> d!115327 (= lt!428436 e!535616)))

(declare-fun c!99402 () Bool)

(assert (=> d!115327 (= c!99402 lt!428439)))

(declare-fun containsKey!467 (List!19349 (_ BitVec 64)) Bool)

(assert (=> d!115327 (= lt!428439 (containsKey!467 (toList!6145 (getCurrentListMap!3378 (_keys!10739 thiss!1141) (_values!5820 thiss!1141) (mask!27613 thiss!1141) (extraKeys!5529 thiss!1141) (zeroValue!5633 thiss!1141) (minValue!5633 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5797 thiss!1141))) key!756))))

(assert (=> d!115327 (= (contains!5238 (getCurrentListMap!3378 (_keys!10739 thiss!1141) (_values!5820 thiss!1141) (mask!27613 thiss!1141) (extraKeys!5529 thiss!1141) (zeroValue!5633 thiss!1141) (minValue!5633 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5797 thiss!1141)) key!756) lt!428438)))

(declare-fun b!951215 () Bool)

(declare-fun lt!428437 () Unit!32009)

(assert (=> b!951215 (= e!535616 lt!428437)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!363 (List!19349 (_ BitVec 64)) Unit!32009)

(assert (=> b!951215 (= lt!428437 (lemmaContainsKeyImpliesGetValueByKeyDefined!363 (toList!6145 (getCurrentListMap!3378 (_keys!10739 thiss!1141) (_values!5820 thiss!1141) (mask!27613 thiss!1141) (extraKeys!5529 thiss!1141) (zeroValue!5633 thiss!1141) (minValue!5633 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5797 thiss!1141))) key!756))))

(declare-datatypes ((Option!506 0))(
  ( (Some!505 (v!12983 V!32657)) (None!504) )
))
(declare-fun isDefined!372 (Option!506) Bool)

(declare-fun getValueByKey!500 (List!19349 (_ BitVec 64)) Option!506)

(assert (=> b!951215 (isDefined!372 (getValueByKey!500 (toList!6145 (getCurrentListMap!3378 (_keys!10739 thiss!1141) (_values!5820 thiss!1141) (mask!27613 thiss!1141) (extraKeys!5529 thiss!1141) (zeroValue!5633 thiss!1141) (minValue!5633 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5797 thiss!1141))) key!756))))

(declare-fun b!951216 () Bool)

(declare-fun Unit!32013 () Unit!32009)

(assert (=> b!951216 (= e!535616 Unit!32013)))

(declare-fun b!951217 () Bool)

(assert (=> b!951217 (= e!535615 (isDefined!372 (getValueByKey!500 (toList!6145 (getCurrentListMap!3378 (_keys!10739 thiss!1141) (_values!5820 thiss!1141) (mask!27613 thiss!1141) (extraKeys!5529 thiss!1141) (zeroValue!5633 thiss!1141) (minValue!5633 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5797 thiss!1141))) key!756)))))

(assert (= (and d!115327 c!99402) b!951215))

(assert (= (and d!115327 (not c!99402)) b!951216))

(assert (= (and d!115327 (not res!637532)) b!951217))

(declare-fun m!883523 () Bool)

(assert (=> d!115327 m!883523))

(declare-fun m!883525 () Bool)

(assert (=> b!951215 m!883525))

(declare-fun m!883527 () Bool)

(assert (=> b!951215 m!883527))

(assert (=> b!951215 m!883527))

(declare-fun m!883529 () Bool)

(assert (=> b!951215 m!883529))

(assert (=> b!951217 m!883527))

(assert (=> b!951217 m!883527))

(assert (=> b!951217 m!883529))

(assert (=> b!951141 d!115327))

(declare-fun b!951261 () Bool)

(declare-fun e!535652 () Bool)

(declare-fun lt!428504 () ListLongMap!12259)

(declare-fun apply!881 (ListLongMap!12259 (_ BitVec 64)) V!32657)

(declare-fun get!14547 (ValueCell!9903 V!32657) V!32657)

(declare-fun dynLambda!1654 (Int (_ BitVec 64)) V!32657)

(assert (=> b!951261 (= e!535652 (= (apply!881 lt!428504 (select (arr!27679 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000)) (get!14547 (select (arr!27678 (_values!5820 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1654 (defaultEntry!5797 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951261 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28156 (_values!5820 thiss!1141))))))

(assert (=> b!951261 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28157 (_keys!10739 thiss!1141))))))

(declare-fun b!951262 () Bool)

(declare-fun e!535644 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!951262 (= e!535644 (validKeyInArray!0 (select (arr!27679 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951263 () Bool)

(declare-fun e!535649 () Bool)

(declare-fun e!535650 () Bool)

(assert (=> b!951263 (= e!535649 e!535650)))

(declare-fun res!637557 () Bool)

(declare-fun call!41465 () Bool)

(assert (=> b!951263 (= res!637557 call!41465)))

(assert (=> b!951263 (=> (not res!637557) (not e!535650))))

(declare-fun bm!41457 () Bool)

(declare-fun call!41462 () ListLongMap!12259)

(declare-fun call!41461 () ListLongMap!12259)

(assert (=> bm!41457 (= call!41462 call!41461)))

(declare-fun b!951264 () Bool)

(declare-fun c!99418 () Bool)

(assert (=> b!951264 (= c!99418 (and (not (= (bvand (extraKeys!5529 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5529 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!535653 () ListLongMap!12259)

(declare-fun e!535655 () ListLongMap!12259)

(assert (=> b!951264 (= e!535653 e!535655)))

(declare-fun b!951265 () Bool)

(declare-fun res!637552 () Bool)

(declare-fun e!535647 () Bool)

(assert (=> b!951265 (=> (not res!637552) (not e!535647))))

(declare-fun e!535643 () Bool)

(assert (=> b!951265 (= res!637552 e!535643)))

(declare-fun c!99415 () Bool)

(assert (=> b!951265 (= c!99415 (not (= (bvand (extraKeys!5529 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!951266 () Bool)

(declare-fun res!637555 () Bool)

(assert (=> b!951266 (=> (not res!637555) (not e!535647))))

(declare-fun e!535648 () Bool)

(assert (=> b!951266 (= res!637555 e!535648)))

(declare-fun res!637553 () Bool)

(assert (=> b!951266 (=> res!637553 e!535648)))

(declare-fun e!535646 () Bool)

(assert (=> b!951266 (= res!637553 (not e!535646))))

(declare-fun res!637554 () Bool)

(assert (=> b!951266 (=> (not res!637554) (not e!535646))))

(assert (=> b!951266 (= res!637554 (bvslt #b00000000000000000000000000000000 (size!28157 (_keys!10739 thiss!1141))))))

(declare-fun b!951267 () Bool)

(declare-fun e!535651 () Unit!32009)

(declare-fun Unit!32014 () Unit!32009)

(assert (=> b!951267 (= e!535651 Unit!32014)))

(declare-fun bm!41458 () Bool)

(declare-fun call!41460 () ListLongMap!12259)

(declare-fun call!41466 () ListLongMap!12259)

(assert (=> bm!41458 (= call!41460 call!41466)))

(declare-fun b!951268 () Bool)

(declare-fun lt!428500 () Unit!32009)

(assert (=> b!951268 (= e!535651 lt!428500)))

(declare-fun lt!428497 () ListLongMap!12259)

(declare-fun getCurrentListMapNoExtraKeys!3320 (array!57564 array!57562 (_ BitVec 32) (_ BitVec 32) V!32657 V!32657 (_ BitVec 32) Int) ListLongMap!12259)

(assert (=> b!951268 (= lt!428497 (getCurrentListMapNoExtraKeys!3320 (_keys!10739 thiss!1141) (_values!5820 thiss!1141) (mask!27613 thiss!1141) (extraKeys!5529 thiss!1141) (zeroValue!5633 thiss!1141) (minValue!5633 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5797 thiss!1141)))))

(declare-fun lt!428501 () (_ BitVec 64))

(assert (=> b!951268 (= lt!428501 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428485 () (_ BitVec 64))

(assert (=> b!951268 (= lt!428485 (select (arr!27679 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428489 () Unit!32009)

(declare-fun addStillContains!584 (ListLongMap!12259 (_ BitVec 64) V!32657 (_ BitVec 64)) Unit!32009)

(assert (=> b!951268 (= lt!428489 (addStillContains!584 lt!428497 lt!428501 (zeroValue!5633 thiss!1141) lt!428485))))

(declare-fun +!2865 (ListLongMap!12259 tuple2!13562) ListLongMap!12259)

(assert (=> b!951268 (contains!5238 (+!2865 lt!428497 (tuple2!13563 lt!428501 (zeroValue!5633 thiss!1141))) lt!428485)))

(declare-fun lt!428505 () Unit!32009)

(assert (=> b!951268 (= lt!428505 lt!428489)))

(declare-fun lt!428493 () ListLongMap!12259)

(assert (=> b!951268 (= lt!428493 (getCurrentListMapNoExtraKeys!3320 (_keys!10739 thiss!1141) (_values!5820 thiss!1141) (mask!27613 thiss!1141) (extraKeys!5529 thiss!1141) (zeroValue!5633 thiss!1141) (minValue!5633 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5797 thiss!1141)))))

(declare-fun lt!428491 () (_ BitVec 64))

(assert (=> b!951268 (= lt!428491 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428503 () (_ BitVec 64))

(assert (=> b!951268 (= lt!428503 (select (arr!27679 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428498 () Unit!32009)

(declare-fun addApplyDifferent!464 (ListLongMap!12259 (_ BitVec 64) V!32657 (_ BitVec 64)) Unit!32009)

(assert (=> b!951268 (= lt!428498 (addApplyDifferent!464 lt!428493 lt!428491 (minValue!5633 thiss!1141) lt!428503))))

(assert (=> b!951268 (= (apply!881 (+!2865 lt!428493 (tuple2!13563 lt!428491 (minValue!5633 thiss!1141))) lt!428503) (apply!881 lt!428493 lt!428503))))

(declare-fun lt!428496 () Unit!32009)

(assert (=> b!951268 (= lt!428496 lt!428498)))

(declare-fun lt!428487 () ListLongMap!12259)

(assert (=> b!951268 (= lt!428487 (getCurrentListMapNoExtraKeys!3320 (_keys!10739 thiss!1141) (_values!5820 thiss!1141) (mask!27613 thiss!1141) (extraKeys!5529 thiss!1141) (zeroValue!5633 thiss!1141) (minValue!5633 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5797 thiss!1141)))))

(declare-fun lt!428492 () (_ BitVec 64))

(assert (=> b!951268 (= lt!428492 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428488 () (_ BitVec 64))

(assert (=> b!951268 (= lt!428488 (select (arr!27679 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428494 () Unit!32009)

(assert (=> b!951268 (= lt!428494 (addApplyDifferent!464 lt!428487 lt!428492 (zeroValue!5633 thiss!1141) lt!428488))))

(assert (=> b!951268 (= (apply!881 (+!2865 lt!428487 (tuple2!13563 lt!428492 (zeroValue!5633 thiss!1141))) lt!428488) (apply!881 lt!428487 lt!428488))))

(declare-fun lt!428490 () Unit!32009)

(assert (=> b!951268 (= lt!428490 lt!428494)))

(declare-fun lt!428495 () ListLongMap!12259)

(assert (=> b!951268 (= lt!428495 (getCurrentListMapNoExtraKeys!3320 (_keys!10739 thiss!1141) (_values!5820 thiss!1141) (mask!27613 thiss!1141) (extraKeys!5529 thiss!1141) (zeroValue!5633 thiss!1141) (minValue!5633 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5797 thiss!1141)))))

(declare-fun lt!428499 () (_ BitVec 64))

(assert (=> b!951268 (= lt!428499 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428486 () (_ BitVec 64))

(assert (=> b!951268 (= lt!428486 (select (arr!27679 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951268 (= lt!428500 (addApplyDifferent!464 lt!428495 lt!428499 (minValue!5633 thiss!1141) lt!428486))))

(assert (=> b!951268 (= (apply!881 (+!2865 lt!428495 (tuple2!13563 lt!428499 (minValue!5633 thiss!1141))) lt!428486) (apply!881 lt!428495 lt!428486))))

(declare-fun c!99416 () Bool)

(declare-fun call!41463 () ListLongMap!12259)

(declare-fun bm!41459 () Bool)

(declare-fun c!99419 () Bool)

(assert (=> bm!41459 (= call!41461 (+!2865 (ite c!99419 call!41466 (ite c!99416 call!41460 call!41463)) (ite (or c!99419 c!99416) (tuple2!13563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5633 thiss!1141)) (tuple2!13563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5633 thiss!1141)))))))

(declare-fun b!951260 () Bool)

(declare-fun e!535645 () ListLongMap!12259)

(assert (=> b!951260 (= e!535645 e!535653)))

(assert (=> b!951260 (= c!99416 (and (not (= (bvand (extraKeys!5529 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5529 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!115329 () Bool)

(assert (=> d!115329 e!535647))

(declare-fun res!637556 () Bool)

(assert (=> d!115329 (=> (not res!637556) (not e!535647))))

(assert (=> d!115329 (= res!637556 (or (bvsge #b00000000000000000000000000000000 (size!28157 (_keys!10739 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28157 (_keys!10739 thiss!1141))))))))

(declare-fun lt!428502 () ListLongMap!12259)

(assert (=> d!115329 (= lt!428504 lt!428502)))

(declare-fun lt!428484 () Unit!32009)

(assert (=> d!115329 (= lt!428484 e!535651)))

(declare-fun c!99420 () Bool)

(assert (=> d!115329 (= c!99420 e!535644)))

(declare-fun res!637559 () Bool)

(assert (=> d!115329 (=> (not res!637559) (not e!535644))))

(assert (=> d!115329 (= res!637559 (bvslt #b00000000000000000000000000000000 (size!28157 (_keys!10739 thiss!1141))))))

(assert (=> d!115329 (= lt!428502 e!535645)))

(assert (=> d!115329 (= c!99419 (and (not (= (bvand (extraKeys!5529 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5529 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115329 (validMask!0 (mask!27613 thiss!1141))))

(assert (=> d!115329 (= (getCurrentListMap!3378 (_keys!10739 thiss!1141) (_values!5820 thiss!1141) (mask!27613 thiss!1141) (extraKeys!5529 thiss!1141) (zeroValue!5633 thiss!1141) (minValue!5633 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5797 thiss!1141)) lt!428504)))

(declare-fun b!951269 () Bool)

(declare-fun call!41464 () Bool)

(assert (=> b!951269 (= e!535643 (not call!41464))))

(declare-fun b!951270 () Bool)

(declare-fun e!535654 () Bool)

(assert (=> b!951270 (= e!535654 (= (apply!881 lt!428504 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5633 thiss!1141)))))

(declare-fun b!951271 () Bool)

(assert (=> b!951271 (= e!535655 call!41463)))

(declare-fun b!951272 () Bool)

(assert (=> b!951272 (= e!535645 (+!2865 call!41461 (tuple2!13563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5633 thiss!1141))))))

(declare-fun bm!41460 () Bool)

(assert (=> bm!41460 (= call!41463 call!41460)))

(declare-fun b!951273 () Bool)

(assert (=> b!951273 (= e!535650 (= (apply!881 lt!428504 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5633 thiss!1141)))))

(declare-fun b!951274 () Bool)

(assert (=> b!951274 (= e!535643 e!535654)))

(declare-fun res!637558 () Bool)

(assert (=> b!951274 (= res!637558 call!41464)))

(assert (=> b!951274 (=> (not res!637558) (not e!535654))))

(declare-fun b!951275 () Bool)

(assert (=> b!951275 (= e!535653 call!41462)))

(declare-fun bm!41461 () Bool)

(assert (=> bm!41461 (= call!41466 (getCurrentListMapNoExtraKeys!3320 (_keys!10739 thiss!1141) (_values!5820 thiss!1141) (mask!27613 thiss!1141) (extraKeys!5529 thiss!1141) (zeroValue!5633 thiss!1141) (minValue!5633 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5797 thiss!1141)))))

(declare-fun b!951276 () Bool)

(assert (=> b!951276 (= e!535646 (validKeyInArray!0 (select (arr!27679 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951277 () Bool)

(assert (=> b!951277 (= e!535647 e!535649)))

(declare-fun c!99417 () Bool)

(assert (=> b!951277 (= c!99417 (not (= (bvand (extraKeys!5529 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951278 () Bool)

(assert (=> b!951278 (= e!535649 (not call!41465))))

(declare-fun b!951279 () Bool)

(assert (=> b!951279 (= e!535648 e!535652)))

(declare-fun res!637551 () Bool)

(assert (=> b!951279 (=> (not res!637551) (not e!535652))))

(assert (=> b!951279 (= res!637551 (contains!5238 lt!428504 (select (arr!27679 (_keys!10739 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951279 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28157 (_keys!10739 thiss!1141))))))

(declare-fun bm!41462 () Bool)

(assert (=> bm!41462 (= call!41465 (contains!5238 lt!428504 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41463 () Bool)

(assert (=> bm!41463 (= call!41464 (contains!5238 lt!428504 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951280 () Bool)

(assert (=> b!951280 (= e!535655 call!41462)))

(assert (= (and d!115329 c!99419) b!951272))

(assert (= (and d!115329 (not c!99419)) b!951260))

(assert (= (and b!951260 c!99416) b!951275))

(assert (= (and b!951260 (not c!99416)) b!951264))

(assert (= (and b!951264 c!99418) b!951280))

(assert (= (and b!951264 (not c!99418)) b!951271))

(assert (= (or b!951280 b!951271) bm!41460))

(assert (= (or b!951275 bm!41460) bm!41458))

(assert (= (or b!951275 b!951280) bm!41457))

(assert (= (or b!951272 bm!41458) bm!41461))

(assert (= (or b!951272 bm!41457) bm!41459))

(assert (= (and d!115329 res!637559) b!951262))

(assert (= (and d!115329 c!99420) b!951268))

(assert (= (and d!115329 (not c!99420)) b!951267))

(assert (= (and d!115329 res!637556) b!951266))

(assert (= (and b!951266 res!637554) b!951276))

(assert (= (and b!951266 (not res!637553)) b!951279))

(assert (= (and b!951279 res!637551) b!951261))

(assert (= (and b!951266 res!637555) b!951265))

(assert (= (and b!951265 c!99415) b!951274))

(assert (= (and b!951265 (not c!99415)) b!951269))

(assert (= (and b!951274 res!637558) b!951270))

(assert (= (or b!951274 b!951269) bm!41463))

(assert (= (and b!951265 res!637552) b!951277))

(assert (= (and b!951277 c!99417) b!951263))

(assert (= (and b!951277 (not c!99417)) b!951278))

(assert (= (and b!951263 res!637557) b!951273))

(assert (= (or b!951263 b!951278) bm!41462))

(declare-fun b_lambda!14387 () Bool)

(assert (=> (not b_lambda!14387) (not b!951261)))

(declare-fun t!27697 () Bool)

(declare-fun tb!6197 () Bool)

(assert (=> (and b!951145 (= (defaultEntry!5797 thiss!1141) (defaultEntry!5797 thiss!1141)) t!27697) tb!6197))

(declare-fun result!12313 () Bool)

(assert (=> tb!6197 (= result!12313 tp_is_empty!20769)))

(assert (=> b!951261 t!27697))

(declare-fun b_and!29731 () Bool)

(assert (= b_and!29727 (and (=> t!27697 result!12313) b_and!29731)))

(declare-fun m!883531 () Bool)

(assert (=> bm!41463 m!883531))

(declare-fun m!883533 () Bool)

(assert (=> b!951272 m!883533))

(declare-fun m!883535 () Bool)

(assert (=> b!951268 m!883535))

(declare-fun m!883537 () Bool)

(assert (=> b!951268 m!883537))

(declare-fun m!883539 () Bool)

(assert (=> b!951268 m!883539))

(declare-fun m!883541 () Bool)

(assert (=> b!951268 m!883541))

(declare-fun m!883543 () Bool)

(assert (=> b!951268 m!883543))

(declare-fun m!883545 () Bool)

(assert (=> b!951268 m!883545))

(declare-fun m!883547 () Bool)

(assert (=> b!951268 m!883547))

(declare-fun m!883549 () Bool)

(assert (=> b!951268 m!883549))

(declare-fun m!883551 () Bool)

(assert (=> b!951268 m!883551))

(declare-fun m!883553 () Bool)

(assert (=> b!951268 m!883553))

(assert (=> b!951268 m!883553))

(declare-fun m!883555 () Bool)

(assert (=> b!951268 m!883555))

(declare-fun m!883557 () Bool)

(assert (=> b!951268 m!883557))

(assert (=> b!951268 m!883535))

(declare-fun m!883559 () Bool)

(assert (=> b!951268 m!883559))

(assert (=> b!951268 m!883549))

(declare-fun m!883561 () Bool)

(assert (=> b!951268 m!883561))

(assert (=> b!951268 m!883543))

(declare-fun m!883563 () Bool)

(assert (=> b!951268 m!883563))

(declare-fun m!883565 () Bool)

(assert (=> b!951268 m!883565))

(assert (=> b!951268 m!883515))

(assert (=> d!115329 m!883465))

(declare-fun m!883567 () Bool)

(assert (=> b!951261 m!883567))

(assert (=> b!951261 m!883567))

(declare-fun m!883569 () Bool)

(assert (=> b!951261 m!883569))

(declare-fun m!883571 () Bool)

(assert (=> b!951261 m!883571))

(assert (=> b!951261 m!883569))

(assert (=> b!951261 m!883515))

(declare-fun m!883573 () Bool)

(assert (=> b!951261 m!883573))

(assert (=> b!951261 m!883515))

(declare-fun m!883575 () Bool)

(assert (=> b!951273 m!883575))

(declare-fun m!883577 () Bool)

(assert (=> bm!41462 m!883577))

(assert (=> bm!41461 m!883565))

(declare-fun m!883579 () Bool)

(assert (=> b!951270 m!883579))

(assert (=> b!951276 m!883515))

(assert (=> b!951276 m!883515))

(declare-fun m!883581 () Bool)

(assert (=> b!951276 m!883581))

(assert (=> b!951279 m!883515))

(assert (=> b!951279 m!883515))

(declare-fun m!883583 () Bool)

(assert (=> b!951279 m!883583))

(declare-fun m!883585 () Bool)

(assert (=> bm!41459 m!883585))

(assert (=> b!951262 m!883515))

(assert (=> b!951262 m!883515))

(assert (=> b!951262 m!883581))

(assert (=> b!951141 d!115329))

(declare-fun d!115331 () Bool)

(declare-fun res!637566 () Bool)

(declare-fun e!535658 () Bool)

(assert (=> d!115331 (=> (not res!637566) (not e!535658))))

(declare-fun simpleValid!377 (LongMapFixedSize!4956) Bool)

(assert (=> d!115331 (= res!637566 (simpleValid!377 thiss!1141))))

(assert (=> d!115331 (= (valid!1885 thiss!1141) e!535658)))

(declare-fun b!951289 () Bool)

(declare-fun res!637567 () Bool)

(assert (=> b!951289 (=> (not res!637567) (not e!535658))))

(declare-fun arrayCountValidKeys!0 (array!57564 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951289 (= res!637567 (= (arrayCountValidKeys!0 (_keys!10739 thiss!1141) #b00000000000000000000000000000000 (size!28157 (_keys!10739 thiss!1141))) (_size!2533 thiss!1141)))))

(declare-fun b!951290 () Bool)

(declare-fun res!637568 () Bool)

(assert (=> b!951290 (=> (not res!637568) (not e!535658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57564 (_ BitVec 32)) Bool)

(assert (=> b!951290 (= res!637568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10739 thiss!1141) (mask!27613 thiss!1141)))))

(declare-fun b!951291 () Bool)

(declare-datatypes ((List!19351 0))(
  ( (Nil!19348) (Cons!19347 (h!20508 (_ BitVec 64)) (t!27698 List!19351)) )
))
(declare-fun arrayNoDuplicates!0 (array!57564 (_ BitVec 32) List!19351) Bool)

(assert (=> b!951291 (= e!535658 (arrayNoDuplicates!0 (_keys!10739 thiss!1141) #b00000000000000000000000000000000 Nil!19348))))

(assert (= (and d!115331 res!637566) b!951289))

(assert (= (and b!951289 res!637567) b!951290))

(assert (= (and b!951290 res!637568) b!951291))

(declare-fun m!883587 () Bool)

(assert (=> d!115331 m!883587))

(declare-fun m!883589 () Bool)

(assert (=> b!951289 m!883589))

(declare-fun m!883591 () Bool)

(assert (=> b!951290 m!883591))

(declare-fun m!883593 () Bool)

(assert (=> b!951291 m!883593))

(assert (=> start!81324 d!115331))

(declare-fun b!951299 () Bool)

(declare-fun e!535664 () Bool)

(assert (=> b!951299 (= e!535664 tp_is_empty!20769)))

(declare-fun mapNonEmpty!33081 () Bool)

(declare-fun mapRes!33081 () Bool)

(declare-fun tp!63398 () Bool)

(declare-fun e!535663 () Bool)

(assert (=> mapNonEmpty!33081 (= mapRes!33081 (and tp!63398 e!535663))))

(declare-fun mapRest!33081 () (Array (_ BitVec 32) ValueCell!9903))

(declare-fun mapValue!33081 () ValueCell!9903)

(declare-fun mapKey!33081 () (_ BitVec 32))

(assert (=> mapNonEmpty!33081 (= mapRest!33075 (store mapRest!33081 mapKey!33081 mapValue!33081))))

(declare-fun b!951298 () Bool)

(assert (=> b!951298 (= e!535663 tp_is_empty!20769)))

(declare-fun condMapEmpty!33081 () Bool)

(declare-fun mapDefault!33081 () ValueCell!9903)

(assert (=> mapNonEmpty!33075 (= condMapEmpty!33081 (= mapRest!33075 ((as const (Array (_ BitVec 32) ValueCell!9903)) mapDefault!33081)))))

(assert (=> mapNonEmpty!33075 (= tp!63389 (and e!535664 mapRes!33081))))

(declare-fun mapIsEmpty!33081 () Bool)

(assert (=> mapIsEmpty!33081 mapRes!33081))

(assert (= (and mapNonEmpty!33075 condMapEmpty!33081) mapIsEmpty!33081))

(assert (= (and mapNonEmpty!33075 (not condMapEmpty!33081)) mapNonEmpty!33081))

(assert (= (and mapNonEmpty!33081 ((_ is ValueCellFull!9903) mapValue!33081)) b!951298))

(assert (= (and mapNonEmpty!33075 ((_ is ValueCellFull!9903) mapDefault!33081)) b!951299))

(declare-fun m!883595 () Bool)

(assert (=> mapNonEmpty!33081 m!883595))

(declare-fun b_lambda!14389 () Bool)

(assert (= b_lambda!14387 (or (and b!951145 b_free!18261) b_lambda!14389)))

(check-sat (not d!115331) (not bm!41463) (not b!951196) (not b_next!18261) (not b!951270) (not b!951207) (not b!951289) (not b!951276) (not b!951262) (not b!951215) tp_is_empty!20769 (not bm!41461) (not b!951290) (not d!115327) (not b!951189) (not d!115329) (not d!115313) (not b!951217) (not b!951279) (not b!951273) (not bm!41459) (not b!951202) (not d!115321) (not b!951272) b_and!29731 (not b!951268) (not bm!41462) (not b_lambda!14389) (not b!951291) (not mapNonEmpty!33081) (not b!951261))
(check-sat b_and!29731 (not b_next!18261))
