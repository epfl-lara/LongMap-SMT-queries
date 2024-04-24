; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19226 () Bool)

(assert start!19226)

(declare-fun b!189153 () Bool)

(declare-fun b_free!4639 () Bool)

(declare-fun b_next!4639 () Bool)

(assert (=> b!189153 (= b_free!4639 (not b_next!4639))))

(declare-fun tp!16747 () Bool)

(declare-fun b_and!11289 () Bool)

(assert (=> b!189153 (= tp!16747 b_and!11289)))

(declare-fun b!189145 () Bool)

(declare-fun res!89424 () Bool)

(declare-fun e!124476 () Bool)

(assert (=> b!189145 (=> (not res!89424) (not e!124476))))

(declare-datatypes ((V!5529 0))(
  ( (V!5530 (val!2250 Int)) )
))
(declare-datatypes ((ValueCell!1862 0))(
  ( (ValueCellFull!1862 (v!4171 V!5529)) (EmptyCell!1862) )
))
(declare-datatypes ((array!8035 0))(
  ( (array!8036 (arr!3788 (Array (_ BitVec 32) (_ BitVec 64))) (size!4108 (_ BitVec 32))) )
))
(declare-datatypes ((array!8037 0))(
  ( (array!8038 (arr!3789 (Array (_ BitVec 32) ValueCell!1862)) (size!4109 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2632 0))(
  ( (LongMapFixedSize!2633 (defaultEntry!3857 Int) (mask!9038 (_ BitVec 32)) (extraKeys!3594 (_ BitVec 32)) (zeroValue!3698 V!5529) (minValue!3698 V!5529) (_size!1365 (_ BitVec 32)) (_keys!5822 array!8035) (_values!3840 array!8037) (_vacant!1365 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2632)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8035 (_ BitVec 32)) Bool)

(assert (=> b!189145 (= res!89424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5822 thiss!1248) (mask!9038 thiss!1248)))))

(declare-fun mapNonEmpty!7609 () Bool)

(declare-fun mapRes!7609 () Bool)

(declare-fun tp!16746 () Bool)

(declare-fun e!124474 () Bool)

(assert (=> mapNonEmpty!7609 (= mapRes!7609 (and tp!16746 e!124474))))

(declare-fun mapValue!7609 () ValueCell!1862)

(declare-fun mapKey!7609 () (_ BitVec 32))

(declare-fun mapRest!7609 () (Array (_ BitVec 32) ValueCell!1862))

(assert (=> mapNonEmpty!7609 (= (arr!3789 (_values!3840 thiss!1248)) (store mapRest!7609 mapKey!7609 mapValue!7609))))

(declare-fun b!189146 () Bool)

(declare-fun res!89423 () Bool)

(assert (=> b!189146 (=> (not res!89423) (not e!124476))))

(declare-datatypes ((List!2367 0))(
  ( (Nil!2364) (Cons!2363 (h!3000 (_ BitVec 64)) (t!7261 List!2367)) )
))
(declare-fun arrayNoDuplicates!0 (array!8035 (_ BitVec 32) List!2367) Bool)

(assert (=> b!189146 (= res!89423 (arrayNoDuplicates!0 (_keys!5822 thiss!1248) #b00000000000000000000000000000000 Nil!2364))))

(declare-fun b!189147 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!189147 (= e!124476 (not (validKeyInArray!0 key!828)))))

(declare-fun b!189148 () Bool)

(declare-datatypes ((Unit!5702 0))(
  ( (Unit!5703) )
))
(declare-fun e!124467 () Unit!5702)

(declare-fun lt!93662 () Unit!5702)

(assert (=> b!189148 (= e!124467 lt!93662)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!162 (array!8035 array!8037 (_ BitVec 32) (_ BitVec 32) V!5529 V!5529 (_ BitVec 64) Int) Unit!5702)

(assert (=> b!189148 (= lt!93662 (lemmaInListMapThenSeekEntryOrOpenFindsIt!162 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) key!828 (defaultEntry!3857 thiss!1248)))))

(declare-fun res!89422 () Bool)

(declare-datatypes ((SeekEntryResult!651 0))(
  ( (MissingZero!651 (index!4774 (_ BitVec 32))) (Found!651 (index!4775 (_ BitVec 32))) (Intermediate!651 (undefined!1463 Bool) (index!4776 (_ BitVec 32)) (x!20391 (_ BitVec 32))) (Undefined!651) (MissingVacant!651 (index!4777 (_ BitVec 32))) )
))
(declare-fun lt!93663 () SeekEntryResult!651)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189148 (= res!89422 (inRange!0 (index!4775 lt!93663) (mask!9038 thiss!1248)))))

(declare-fun e!124470 () Bool)

(assert (=> b!189148 (=> (not res!89422) (not e!124470))))

(assert (=> b!189148 e!124470))

(declare-fun res!89421 () Bool)

(declare-fun e!124475 () Bool)

(assert (=> start!19226 (=> (not res!89421) (not e!124475))))

(declare-fun valid!1107 (LongMapFixedSize!2632) Bool)

(assert (=> start!19226 (= res!89421 (valid!1107 thiss!1248))))

(assert (=> start!19226 e!124475))

(declare-fun e!124472 () Bool)

(assert (=> start!19226 e!124472))

(assert (=> start!19226 true))

(declare-fun b!189149 () Bool)

(declare-fun e!124473 () Bool)

(declare-fun e!124469 () Bool)

(assert (=> b!189149 (= e!124473 (and e!124469 mapRes!7609))))

(declare-fun condMapEmpty!7609 () Bool)

(declare-fun mapDefault!7609 () ValueCell!1862)

(assert (=> b!189149 (= condMapEmpty!7609 (= (arr!3789 (_values!3840 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1862)) mapDefault!7609)))))

(declare-fun b!189150 () Bool)

(declare-fun res!89425 () Bool)

(assert (=> b!189150 (=> (not res!89425) (not e!124475))))

(assert (=> b!189150 (= res!89425 (not (= key!828 (bvneg key!828))))))

(declare-fun b!189151 () Bool)

(declare-fun Unit!5704 () Unit!5702)

(assert (=> b!189151 (= e!124467 Unit!5704)))

(declare-fun lt!93661 () Unit!5702)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!157 (array!8035 array!8037 (_ BitVec 32) (_ BitVec 32) V!5529 V!5529 (_ BitVec 64) Int) Unit!5702)

(assert (=> b!189151 (= lt!93661 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!157 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) key!828 (defaultEntry!3857 thiss!1248)))))

(assert (=> b!189151 false))

(declare-fun b!189152 () Bool)

(declare-fun res!89420 () Bool)

(assert (=> b!189152 (=> (not res!89420) (not e!124476))))

(assert (=> b!189152 (= res!89420 (and (= (size!4109 (_values!3840 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9038 thiss!1248))) (= (size!4108 (_keys!5822 thiss!1248)) (size!4109 (_values!3840 thiss!1248))) (bvsge (mask!9038 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3594 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3594 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun tp_is_empty!4411 () Bool)

(declare-fun array_inv!2443 (array!8035) Bool)

(declare-fun array_inv!2444 (array!8037) Bool)

(assert (=> b!189153 (= e!124472 (and tp!16747 tp_is_empty!4411 (array_inv!2443 (_keys!5822 thiss!1248)) (array_inv!2444 (_values!3840 thiss!1248)) e!124473))))

(declare-fun b!189154 () Bool)

(assert (=> b!189154 (= e!124474 tp_is_empty!4411)))

(declare-fun b!189155 () Bool)

(assert (=> b!189155 (= e!124469 tp_is_empty!4411)))

(declare-fun b!189156 () Bool)

(declare-fun e!124471 () Bool)

(assert (=> b!189156 (= e!124475 e!124471)))

(declare-fun res!89419 () Bool)

(assert (=> b!189156 (=> (not res!89419) (not e!124471))))

(get-info :version)

(assert (=> b!189156 (= res!89419 (and (not ((_ is Undefined!651) lt!93663)) (not ((_ is MissingVacant!651) lt!93663)) (not ((_ is MissingZero!651) lt!93663)) ((_ is Found!651) lt!93663)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8035 (_ BitVec 32)) SeekEntryResult!651)

(assert (=> b!189156 (= lt!93663 (seekEntryOrOpen!0 key!828 (_keys!5822 thiss!1248) (mask!9038 thiss!1248)))))

(declare-fun mapIsEmpty!7609 () Bool)

(assert (=> mapIsEmpty!7609 mapRes!7609))

(declare-fun b!189157 () Bool)

(declare-fun res!89418 () Bool)

(assert (=> b!189157 (=> (not res!89418) (not e!124476))))

(assert (=> b!189157 (= res!89418 (and (bvsge (index!4775 lt!93663) #b00000000000000000000000000000000) (bvslt (index!4775 lt!93663) (size!4108 (_keys!5822 thiss!1248)))))))

(declare-fun b!189158 () Bool)

(assert (=> b!189158 (= e!124470 (= (select (arr!3788 (_keys!5822 thiss!1248)) (index!4775 lt!93663)) key!828))))

(declare-fun b!189159 () Bool)

(assert (=> b!189159 (= e!124471 e!124476)))

(declare-fun res!89417 () Bool)

(assert (=> b!189159 (=> (not res!89417) (not e!124476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!189159 (= res!89417 (validMask!0 (mask!9038 thiss!1248)))))

(declare-fun lt!93664 () Unit!5702)

(assert (=> b!189159 (= lt!93664 e!124467)))

(declare-fun c!34002 () Bool)

(declare-datatypes ((tuple2!3450 0))(
  ( (tuple2!3451 (_1!1736 (_ BitVec 64)) (_2!1736 V!5529)) )
))
(declare-datatypes ((List!2368 0))(
  ( (Nil!2365) (Cons!2364 (h!3001 tuple2!3450) (t!7262 List!2368)) )
))
(declare-datatypes ((ListLongMap!2371 0))(
  ( (ListLongMap!2372 (toList!1201 List!2368)) )
))
(declare-fun contains!1319 (ListLongMap!2371 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!853 (array!8035 array!8037 (_ BitVec 32) (_ BitVec 32) V!5529 V!5529 (_ BitVec 32) Int) ListLongMap!2371)

(assert (=> b!189159 (= c!34002 (contains!1319 (getCurrentListMap!853 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)) key!828))))

(assert (= (and start!19226 res!89421) b!189150))

(assert (= (and b!189150 res!89425) b!189156))

(assert (= (and b!189156 res!89419) b!189159))

(assert (= (and b!189159 c!34002) b!189148))

(assert (= (and b!189159 (not c!34002)) b!189151))

(assert (= (and b!189148 res!89422) b!189158))

(assert (= (and b!189159 res!89417) b!189152))

(assert (= (and b!189152 res!89420) b!189145))

(assert (= (and b!189145 res!89424) b!189146))

(assert (= (and b!189146 res!89423) b!189157))

(assert (= (and b!189157 res!89418) b!189147))

(assert (= (and b!189149 condMapEmpty!7609) mapIsEmpty!7609))

(assert (= (and b!189149 (not condMapEmpty!7609)) mapNonEmpty!7609))

(assert (= (and mapNonEmpty!7609 ((_ is ValueCellFull!1862) mapValue!7609)) b!189154))

(assert (= (and b!189149 ((_ is ValueCellFull!1862) mapDefault!7609)) b!189155))

(assert (= b!189153 b!189149))

(assert (= start!19226 b!189153))

(declare-fun m!215729 () Bool)

(assert (=> b!189159 m!215729))

(declare-fun m!215731 () Bool)

(assert (=> b!189159 m!215731))

(assert (=> b!189159 m!215731))

(declare-fun m!215733 () Bool)

(assert (=> b!189159 m!215733))

(declare-fun m!215735 () Bool)

(assert (=> b!189146 m!215735))

(declare-fun m!215737 () Bool)

(assert (=> b!189148 m!215737))

(declare-fun m!215739 () Bool)

(assert (=> b!189148 m!215739))

(declare-fun m!215741 () Bool)

(assert (=> b!189156 m!215741))

(declare-fun m!215743 () Bool)

(assert (=> b!189147 m!215743))

(declare-fun m!215745 () Bool)

(assert (=> b!189145 m!215745))

(declare-fun m!215747 () Bool)

(assert (=> b!189153 m!215747))

(declare-fun m!215749 () Bool)

(assert (=> b!189153 m!215749))

(declare-fun m!215751 () Bool)

(assert (=> b!189158 m!215751))

(declare-fun m!215753 () Bool)

(assert (=> mapNonEmpty!7609 m!215753))

(declare-fun m!215755 () Bool)

(assert (=> b!189151 m!215755))

(declare-fun m!215757 () Bool)

(assert (=> start!19226 m!215757))

(check-sat (not b!189159) b_and!11289 (not mapNonEmpty!7609) (not b!189146) (not b!189153) (not b!189145) (not b_next!4639) (not b!189151) (not b!189148) tp_is_empty!4411 (not start!19226) (not b!189147) (not b!189156))
(check-sat b_and!11289 (not b_next!4639))
(get-model)

(declare-fun d!55761 () Bool)

(assert (=> d!55761 (= (validMask!0 (mask!9038 thiss!1248)) (and (or (= (mask!9038 thiss!1248) #b00000000000000000000000000000111) (= (mask!9038 thiss!1248) #b00000000000000000000000000001111) (= (mask!9038 thiss!1248) #b00000000000000000000000000011111) (= (mask!9038 thiss!1248) #b00000000000000000000000000111111) (= (mask!9038 thiss!1248) #b00000000000000000000000001111111) (= (mask!9038 thiss!1248) #b00000000000000000000000011111111) (= (mask!9038 thiss!1248) #b00000000000000000000000111111111) (= (mask!9038 thiss!1248) #b00000000000000000000001111111111) (= (mask!9038 thiss!1248) #b00000000000000000000011111111111) (= (mask!9038 thiss!1248) #b00000000000000000000111111111111) (= (mask!9038 thiss!1248) #b00000000000000000001111111111111) (= (mask!9038 thiss!1248) #b00000000000000000011111111111111) (= (mask!9038 thiss!1248) #b00000000000000000111111111111111) (= (mask!9038 thiss!1248) #b00000000000000001111111111111111) (= (mask!9038 thiss!1248) #b00000000000000011111111111111111) (= (mask!9038 thiss!1248) #b00000000000000111111111111111111) (= (mask!9038 thiss!1248) #b00000000000001111111111111111111) (= (mask!9038 thiss!1248) #b00000000000011111111111111111111) (= (mask!9038 thiss!1248) #b00000000000111111111111111111111) (= (mask!9038 thiss!1248) #b00000000001111111111111111111111) (= (mask!9038 thiss!1248) #b00000000011111111111111111111111) (= (mask!9038 thiss!1248) #b00000000111111111111111111111111) (= (mask!9038 thiss!1248) #b00000001111111111111111111111111) (= (mask!9038 thiss!1248) #b00000011111111111111111111111111) (= (mask!9038 thiss!1248) #b00000111111111111111111111111111) (= (mask!9038 thiss!1248) #b00001111111111111111111111111111) (= (mask!9038 thiss!1248) #b00011111111111111111111111111111) (= (mask!9038 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9038 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!189159 d!55761))

(declare-fun d!55763 () Bool)

(declare-fun e!124541 () Bool)

(assert (=> d!55763 e!124541))

(declare-fun res!89482 () Bool)

(assert (=> d!55763 (=> res!89482 e!124541)))

(declare-fun lt!93700 () Bool)

(assert (=> d!55763 (= res!89482 (not lt!93700))))

(declare-fun lt!93699 () Bool)

(assert (=> d!55763 (= lt!93700 lt!93699)))

(declare-fun lt!93698 () Unit!5702)

(declare-fun e!124542 () Unit!5702)

(assert (=> d!55763 (= lt!93698 e!124542)))

(declare-fun c!34011 () Bool)

(assert (=> d!55763 (= c!34011 lt!93699)))

(declare-fun containsKey!237 (List!2368 (_ BitVec 64)) Bool)

(assert (=> d!55763 (= lt!93699 (containsKey!237 (toList!1201 (getCurrentListMap!853 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248))) key!828))))

(assert (=> d!55763 (= (contains!1319 (getCurrentListMap!853 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)) key!828) lt!93700)))

(declare-fun b!189256 () Bool)

(declare-fun lt!93697 () Unit!5702)

(assert (=> b!189256 (= e!124542 lt!93697)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!185 (List!2368 (_ BitVec 64)) Unit!5702)

(assert (=> b!189256 (= lt!93697 (lemmaContainsKeyImpliesGetValueByKeyDefined!185 (toList!1201 (getCurrentListMap!853 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248))) key!828))))

(declare-datatypes ((Option!240 0))(
  ( (Some!239 (v!4174 V!5529)) (None!238) )
))
(declare-fun isDefined!186 (Option!240) Bool)

(declare-fun getValueByKey!234 (List!2368 (_ BitVec 64)) Option!240)

(assert (=> b!189256 (isDefined!186 (getValueByKey!234 (toList!1201 (getCurrentListMap!853 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248))) key!828))))

(declare-fun b!189257 () Bool)

(declare-fun Unit!5708 () Unit!5702)

(assert (=> b!189257 (= e!124542 Unit!5708)))

(declare-fun b!189258 () Bool)

(assert (=> b!189258 (= e!124541 (isDefined!186 (getValueByKey!234 (toList!1201 (getCurrentListMap!853 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248))) key!828)))))

(assert (= (and d!55763 c!34011) b!189256))

(assert (= (and d!55763 (not c!34011)) b!189257))

(assert (= (and d!55763 (not res!89482)) b!189258))

(declare-fun m!215819 () Bool)

(assert (=> d!55763 m!215819))

(declare-fun m!215821 () Bool)

(assert (=> b!189256 m!215821))

(declare-fun m!215823 () Bool)

(assert (=> b!189256 m!215823))

(assert (=> b!189256 m!215823))

(declare-fun m!215825 () Bool)

(assert (=> b!189256 m!215825))

(assert (=> b!189258 m!215823))

(assert (=> b!189258 m!215823))

(assert (=> b!189258 m!215825))

(assert (=> b!189159 d!55763))

(declare-fun b!189301 () Bool)

(declare-fun e!124573 () Bool)

(assert (=> b!189301 (= e!124573 (validKeyInArray!0 (select (arr!3788 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189302 () Bool)

(declare-fun e!124569 () ListLongMap!2371)

(declare-fun call!19078 () ListLongMap!2371)

(assert (=> b!189302 (= e!124569 call!19078)))

(declare-fun b!189303 () Bool)

(declare-fun e!124577 () Bool)

(declare-fun e!124580 () Bool)

(assert (=> b!189303 (= e!124577 e!124580)))

(declare-fun res!89503 () Bool)

(assert (=> b!189303 (=> (not res!89503) (not e!124580))))

(declare-fun lt!93756 () ListLongMap!2371)

(assert (=> b!189303 (= res!89503 (contains!1319 lt!93756 (select (arr!3788 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4108 (_keys!5822 thiss!1248))))))

(declare-fun b!189304 () Bool)

(declare-fun e!124579 () Bool)

(declare-fun call!19075 () Bool)

(assert (=> b!189304 (= e!124579 (not call!19075))))

(declare-fun b!189305 () Bool)

(declare-fun c!34024 () Bool)

(assert (=> b!189305 (= c!34024 (and (not (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!124571 () ListLongMap!2371)

(assert (=> b!189305 (= e!124571 e!124569)))

(declare-fun b!189306 () Bool)

(declare-fun call!19076 () ListLongMap!2371)

(assert (=> b!189306 (= e!124571 call!19076)))

(declare-fun b!189307 () Bool)

(declare-fun apply!176 (ListLongMap!2371 (_ BitVec 64)) V!5529)

(declare-fun get!2193 (ValueCell!1862 V!5529) V!5529)

(declare-fun dynLambda!519 (Int (_ BitVec 64)) V!5529)

(assert (=> b!189307 (= e!124580 (= (apply!176 lt!93756 (select (arr!3788 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000)) (get!2193 (select (arr!3789 (_values!3840 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!519 (defaultEntry!3857 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189307 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4109 (_values!3840 thiss!1248))))))

(assert (=> b!189307 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4108 (_keys!5822 thiss!1248))))))

(declare-fun b!189308 () Bool)

(declare-fun e!124576 () Bool)

(assert (=> b!189308 (= e!124579 e!124576)))

(declare-fun res!89501 () Bool)

(assert (=> b!189308 (= res!89501 call!19075)))

(assert (=> b!189308 (=> (not res!89501) (not e!124576))))

(declare-fun b!189309 () Bool)

(declare-fun e!124578 () Bool)

(declare-fun e!124570 () Bool)

(assert (=> b!189309 (= e!124578 e!124570)))

(declare-fun res!89505 () Bool)

(declare-fun call!19073 () Bool)

(assert (=> b!189309 (= res!89505 call!19073)))

(assert (=> b!189309 (=> (not res!89505) (not e!124570))))

(declare-fun bm!19070 () Bool)

(assert (=> bm!19070 (= call!19075 (contains!1319 lt!93756 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19071 () Bool)

(declare-fun call!19072 () ListLongMap!2371)

(declare-fun getCurrentListMapNoExtraKeys!207 (array!8035 array!8037 (_ BitVec 32) (_ BitVec 32) V!5529 V!5529 (_ BitVec 32) Int) ListLongMap!2371)

(assert (=> bm!19071 (= call!19072 (getCurrentListMapNoExtraKeys!207 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)))))

(declare-fun bm!19072 () Bool)

(declare-fun call!19077 () ListLongMap!2371)

(assert (=> bm!19072 (= call!19078 call!19077)))

(declare-fun bm!19073 () Bool)

(assert (=> bm!19073 (= call!19073 (contains!1319 lt!93756 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189310 () Bool)

(declare-fun e!124572 () Unit!5702)

(declare-fun lt!93750 () Unit!5702)

(assert (=> b!189310 (= e!124572 lt!93750)))

(declare-fun lt!93760 () ListLongMap!2371)

(assert (=> b!189310 (= lt!93760 (getCurrentListMapNoExtraKeys!207 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)))))

(declare-fun lt!93757 () (_ BitVec 64))

(assert (=> b!189310 (= lt!93757 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93747 () (_ BitVec 64))

(assert (=> b!189310 (= lt!93747 (select (arr!3788 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93758 () Unit!5702)

(declare-fun addStillContains!152 (ListLongMap!2371 (_ BitVec 64) V!5529 (_ BitVec 64)) Unit!5702)

(assert (=> b!189310 (= lt!93758 (addStillContains!152 lt!93760 lt!93757 (zeroValue!3698 thiss!1248) lt!93747))))

(declare-fun +!296 (ListLongMap!2371 tuple2!3450) ListLongMap!2371)

(assert (=> b!189310 (contains!1319 (+!296 lt!93760 (tuple2!3451 lt!93757 (zeroValue!3698 thiss!1248))) lt!93747)))

(declare-fun lt!93749 () Unit!5702)

(assert (=> b!189310 (= lt!93749 lt!93758)))

(declare-fun lt!93751 () ListLongMap!2371)

(assert (=> b!189310 (= lt!93751 (getCurrentListMapNoExtraKeys!207 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)))))

(declare-fun lt!93748 () (_ BitVec 64))

(assert (=> b!189310 (= lt!93748 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93755 () (_ BitVec 64))

(assert (=> b!189310 (= lt!93755 (select (arr!3788 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93766 () Unit!5702)

(declare-fun addApplyDifferent!152 (ListLongMap!2371 (_ BitVec 64) V!5529 (_ BitVec 64)) Unit!5702)

(assert (=> b!189310 (= lt!93766 (addApplyDifferent!152 lt!93751 lt!93748 (minValue!3698 thiss!1248) lt!93755))))

(assert (=> b!189310 (= (apply!176 (+!296 lt!93751 (tuple2!3451 lt!93748 (minValue!3698 thiss!1248))) lt!93755) (apply!176 lt!93751 lt!93755))))

(declare-fun lt!93764 () Unit!5702)

(assert (=> b!189310 (= lt!93764 lt!93766)))

(declare-fun lt!93745 () ListLongMap!2371)

(assert (=> b!189310 (= lt!93745 (getCurrentListMapNoExtraKeys!207 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)))))

(declare-fun lt!93761 () (_ BitVec 64))

(assert (=> b!189310 (= lt!93761 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93759 () (_ BitVec 64))

(assert (=> b!189310 (= lt!93759 (select (arr!3788 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93763 () Unit!5702)

(assert (=> b!189310 (= lt!93763 (addApplyDifferent!152 lt!93745 lt!93761 (zeroValue!3698 thiss!1248) lt!93759))))

(assert (=> b!189310 (= (apply!176 (+!296 lt!93745 (tuple2!3451 lt!93761 (zeroValue!3698 thiss!1248))) lt!93759) (apply!176 lt!93745 lt!93759))))

(declare-fun lt!93746 () Unit!5702)

(assert (=> b!189310 (= lt!93746 lt!93763)))

(declare-fun lt!93765 () ListLongMap!2371)

(assert (=> b!189310 (= lt!93765 (getCurrentListMapNoExtraKeys!207 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)))))

(declare-fun lt!93762 () (_ BitVec 64))

(assert (=> b!189310 (= lt!93762 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93754 () (_ BitVec 64))

(assert (=> b!189310 (= lt!93754 (select (arr!3788 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189310 (= lt!93750 (addApplyDifferent!152 lt!93765 lt!93762 (minValue!3698 thiss!1248) lt!93754))))

(assert (=> b!189310 (= (apply!176 (+!296 lt!93765 (tuple2!3451 lt!93762 (minValue!3698 thiss!1248))) lt!93754) (apply!176 lt!93765 lt!93754))))

(declare-fun bm!19074 () Bool)

(declare-fun call!19074 () ListLongMap!2371)

(assert (=> bm!19074 (= call!19076 call!19074)))

(declare-fun b!189311 () Bool)

(declare-fun e!124575 () Bool)

(assert (=> b!189311 (= e!124575 (validKeyInArray!0 (select (arr!3788 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189312 () Bool)

(declare-fun e!124574 () Bool)

(assert (=> b!189312 (= e!124574 e!124578)))

(declare-fun c!34028 () Bool)

(assert (=> b!189312 (= c!34028 (not (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189313 () Bool)

(declare-fun e!124581 () ListLongMap!2371)

(assert (=> b!189313 (= e!124581 e!124571)))

(declare-fun c!34026 () Bool)

(assert (=> b!189313 (= c!34026 (and (not (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189314 () Bool)

(assert (=> b!189314 (= e!124581 (+!296 call!19074 (tuple2!3451 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3698 thiss!1248))))))

(declare-fun b!189315 () Bool)

(declare-fun Unit!5709 () Unit!5702)

(assert (=> b!189315 (= e!124572 Unit!5709)))

(declare-fun b!189316 () Bool)

(assert (=> b!189316 (= e!124578 (not call!19073))))

(declare-fun d!55765 () Bool)

(assert (=> d!55765 e!124574))

(declare-fun res!89504 () Bool)

(assert (=> d!55765 (=> (not res!89504) (not e!124574))))

(assert (=> d!55765 (= res!89504 (or (bvsge #b00000000000000000000000000000000 (size!4108 (_keys!5822 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4108 (_keys!5822 thiss!1248))))))))

(declare-fun lt!93752 () ListLongMap!2371)

(assert (=> d!55765 (= lt!93756 lt!93752)))

(declare-fun lt!93753 () Unit!5702)

(assert (=> d!55765 (= lt!93753 e!124572)))

(declare-fun c!34027 () Bool)

(assert (=> d!55765 (= c!34027 e!124575)))

(declare-fun res!89502 () Bool)

(assert (=> d!55765 (=> (not res!89502) (not e!124575))))

(assert (=> d!55765 (= res!89502 (bvslt #b00000000000000000000000000000000 (size!4108 (_keys!5822 thiss!1248))))))

(assert (=> d!55765 (= lt!93752 e!124581)))

(declare-fun c!34025 () Bool)

(assert (=> d!55765 (= c!34025 (and (not (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55765 (validMask!0 (mask!9038 thiss!1248))))

(assert (=> d!55765 (= (getCurrentListMap!853 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)) lt!93756)))

(declare-fun bm!19069 () Bool)

(assert (=> bm!19069 (= call!19074 (+!296 (ite c!34025 call!19072 (ite c!34026 call!19077 call!19078)) (ite (or c!34025 c!34026) (tuple2!3451 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3698 thiss!1248)) (tuple2!3451 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3698 thiss!1248)))))))

(declare-fun b!189317 () Bool)

(assert (=> b!189317 (= e!124576 (= (apply!176 lt!93756 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3698 thiss!1248)))))

(declare-fun b!189318 () Bool)

(assert (=> b!189318 (= e!124569 call!19076)))

(declare-fun b!189319 () Bool)

(declare-fun res!89507 () Bool)

(assert (=> b!189319 (=> (not res!89507) (not e!124574))))

(assert (=> b!189319 (= res!89507 e!124579)))

(declare-fun c!34029 () Bool)

(assert (=> b!189319 (= c!34029 (not (= (bvand (extraKeys!3594 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!189320 () Bool)

(declare-fun res!89506 () Bool)

(assert (=> b!189320 (=> (not res!89506) (not e!124574))))

(assert (=> b!189320 (= res!89506 e!124577)))

(declare-fun res!89509 () Bool)

(assert (=> b!189320 (=> res!89509 e!124577)))

(assert (=> b!189320 (= res!89509 (not e!124573))))

(declare-fun res!89508 () Bool)

(assert (=> b!189320 (=> (not res!89508) (not e!124573))))

(assert (=> b!189320 (= res!89508 (bvslt #b00000000000000000000000000000000 (size!4108 (_keys!5822 thiss!1248))))))

(declare-fun b!189321 () Bool)

(assert (=> b!189321 (= e!124570 (= (apply!176 lt!93756 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3698 thiss!1248)))))

(declare-fun bm!19075 () Bool)

(assert (=> bm!19075 (= call!19077 call!19072)))

(assert (= (and d!55765 c!34025) b!189314))

(assert (= (and d!55765 (not c!34025)) b!189313))

(assert (= (and b!189313 c!34026) b!189306))

(assert (= (and b!189313 (not c!34026)) b!189305))

(assert (= (and b!189305 c!34024) b!189318))

(assert (= (and b!189305 (not c!34024)) b!189302))

(assert (= (or b!189318 b!189302) bm!19072))

(assert (= (or b!189306 bm!19072) bm!19075))

(assert (= (or b!189306 b!189318) bm!19074))

(assert (= (or b!189314 bm!19075) bm!19071))

(assert (= (or b!189314 bm!19074) bm!19069))

(assert (= (and d!55765 res!89502) b!189311))

(assert (= (and d!55765 c!34027) b!189310))

(assert (= (and d!55765 (not c!34027)) b!189315))

(assert (= (and d!55765 res!89504) b!189320))

(assert (= (and b!189320 res!89508) b!189301))

(assert (= (and b!189320 (not res!89509)) b!189303))

(assert (= (and b!189303 res!89503) b!189307))

(assert (= (and b!189320 res!89506) b!189319))

(assert (= (and b!189319 c!34029) b!189308))

(assert (= (and b!189319 (not c!34029)) b!189304))

(assert (= (and b!189308 res!89501) b!189317))

(assert (= (or b!189308 b!189304) bm!19070))

(assert (= (and b!189319 res!89507) b!189312))

(assert (= (and b!189312 c!34028) b!189309))

(assert (= (and b!189312 (not c!34028)) b!189316))

(assert (= (and b!189309 res!89505) b!189321))

(assert (= (or b!189309 b!189316) bm!19073))

(declare-fun b_lambda!7345 () Bool)

(assert (=> (not b_lambda!7345) (not b!189307)))

(declare-fun t!7265 () Bool)

(declare-fun tb!2855 () Bool)

(assert (=> (and b!189153 (= (defaultEntry!3857 thiss!1248) (defaultEntry!3857 thiss!1248)) t!7265) tb!2855))

(declare-fun result!4859 () Bool)

(assert (=> tb!2855 (= result!4859 tp_is_empty!4411)))

(assert (=> b!189307 t!7265))

(declare-fun b_and!11295 () Bool)

(assert (= b_and!11289 (and (=> t!7265 result!4859) b_and!11295)))

(assert (=> d!55765 m!215729))

(declare-fun m!215827 () Bool)

(assert (=> b!189307 m!215827))

(declare-fun m!215829 () Bool)

(assert (=> b!189307 m!215829))

(assert (=> b!189307 m!215827))

(declare-fun m!215831 () Bool)

(assert (=> b!189307 m!215831))

(assert (=> b!189307 m!215829))

(declare-fun m!215833 () Bool)

(assert (=> b!189307 m!215833))

(declare-fun m!215835 () Bool)

(assert (=> b!189307 m!215835))

(assert (=> b!189307 m!215833))

(declare-fun m!215837 () Bool)

(assert (=> bm!19071 m!215837))

(declare-fun m!215839 () Bool)

(assert (=> b!189317 m!215839))

(declare-fun m!215841 () Bool)

(assert (=> b!189321 m!215841))

(assert (=> b!189311 m!215833))

(assert (=> b!189311 m!215833))

(declare-fun m!215843 () Bool)

(assert (=> b!189311 m!215843))

(declare-fun m!215845 () Bool)

(assert (=> bm!19070 m!215845))

(assert (=> b!189303 m!215833))

(assert (=> b!189303 m!215833))

(declare-fun m!215847 () Bool)

(assert (=> b!189303 m!215847))

(declare-fun m!215849 () Bool)

(assert (=> bm!19073 m!215849))

(declare-fun m!215851 () Bool)

(assert (=> bm!19069 m!215851))

(declare-fun m!215853 () Bool)

(assert (=> b!189310 m!215853))

(declare-fun m!215855 () Bool)

(assert (=> b!189310 m!215855))

(declare-fun m!215857 () Bool)

(assert (=> b!189310 m!215857))

(declare-fun m!215859 () Bool)

(assert (=> b!189310 m!215859))

(assert (=> b!189310 m!215837))

(declare-fun m!215861 () Bool)

(assert (=> b!189310 m!215861))

(assert (=> b!189310 m!215853))

(declare-fun m!215863 () Bool)

(assert (=> b!189310 m!215863))

(assert (=> b!189310 m!215859))

(declare-fun m!215865 () Bool)

(assert (=> b!189310 m!215865))

(declare-fun m!215867 () Bool)

(assert (=> b!189310 m!215867))

(declare-fun m!215869 () Bool)

(assert (=> b!189310 m!215869))

(declare-fun m!215871 () Bool)

(assert (=> b!189310 m!215871))

(assert (=> b!189310 m!215861))

(declare-fun m!215873 () Bool)

(assert (=> b!189310 m!215873))

(declare-fun m!215875 () Bool)

(assert (=> b!189310 m!215875))

(assert (=> b!189310 m!215833))

(declare-fun m!215877 () Bool)

(assert (=> b!189310 m!215877))

(declare-fun m!215879 () Bool)

(assert (=> b!189310 m!215879))

(assert (=> b!189310 m!215869))

(declare-fun m!215881 () Bool)

(assert (=> b!189310 m!215881))

(assert (=> b!189301 m!215833))

(assert (=> b!189301 m!215833))

(assert (=> b!189301 m!215843))

(declare-fun m!215883 () Bool)

(assert (=> b!189314 m!215883))

(assert (=> b!189159 d!55765))

(declare-fun b!189332 () Bool)

(declare-fun e!124590 () Bool)

(declare-fun call!19081 () Bool)

(assert (=> b!189332 (= e!124590 call!19081)))

(declare-fun b!189333 () Bool)

(declare-fun e!124589 () Bool)

(assert (=> b!189333 (= e!124589 call!19081)))

(declare-fun b!189334 () Bool)

(declare-fun e!124588 () Bool)

(assert (=> b!189334 (= e!124588 e!124589)))

(declare-fun c!34032 () Bool)

(assert (=> b!189334 (= c!34032 (validKeyInArray!0 (select (arr!3788 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189335 () Bool)

(assert (=> b!189335 (= e!124589 e!124590)))

(declare-fun lt!93773 () (_ BitVec 64))

(assert (=> b!189335 (= lt!93773 (select (arr!3788 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93775 () Unit!5702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8035 (_ BitVec 64) (_ BitVec 32)) Unit!5702)

(assert (=> b!189335 (= lt!93775 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5822 thiss!1248) lt!93773 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!189335 (arrayContainsKey!0 (_keys!5822 thiss!1248) lt!93773 #b00000000000000000000000000000000)))

(declare-fun lt!93774 () Unit!5702)

(assert (=> b!189335 (= lt!93774 lt!93775)))

(declare-fun res!89515 () Bool)

(assert (=> b!189335 (= res!89515 (= (seekEntryOrOpen!0 (select (arr!3788 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000) (_keys!5822 thiss!1248) (mask!9038 thiss!1248)) (Found!651 #b00000000000000000000000000000000)))))

(assert (=> b!189335 (=> (not res!89515) (not e!124590))))

(declare-fun bm!19078 () Bool)

(assert (=> bm!19078 (= call!19081 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5822 thiss!1248) (mask!9038 thiss!1248)))))

(declare-fun d!55767 () Bool)

(declare-fun res!89514 () Bool)

(assert (=> d!55767 (=> res!89514 e!124588)))

(assert (=> d!55767 (= res!89514 (bvsge #b00000000000000000000000000000000 (size!4108 (_keys!5822 thiss!1248))))))

(assert (=> d!55767 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5822 thiss!1248) (mask!9038 thiss!1248)) e!124588)))

(assert (= (and d!55767 (not res!89514)) b!189334))

(assert (= (and b!189334 c!34032) b!189335))

(assert (= (and b!189334 (not c!34032)) b!189333))

(assert (= (and b!189335 res!89515) b!189332))

(assert (= (or b!189332 b!189333) bm!19078))

(assert (=> b!189334 m!215833))

(assert (=> b!189334 m!215833))

(assert (=> b!189334 m!215843))

(assert (=> b!189335 m!215833))

(declare-fun m!215885 () Bool)

(assert (=> b!189335 m!215885))

(declare-fun m!215887 () Bool)

(assert (=> b!189335 m!215887))

(assert (=> b!189335 m!215833))

(declare-fun m!215889 () Bool)

(assert (=> b!189335 m!215889))

(declare-fun m!215891 () Bool)

(assert (=> bm!19078 m!215891))

(assert (=> b!189145 d!55767))

(declare-fun d!55769 () Bool)

(declare-fun res!89522 () Bool)

(declare-fun e!124593 () Bool)

(assert (=> d!55769 (=> (not res!89522) (not e!124593))))

(declare-fun simpleValid!192 (LongMapFixedSize!2632) Bool)

(assert (=> d!55769 (= res!89522 (simpleValid!192 thiss!1248))))

(assert (=> d!55769 (= (valid!1107 thiss!1248) e!124593)))

(declare-fun b!189342 () Bool)

(declare-fun res!89523 () Bool)

(assert (=> b!189342 (=> (not res!89523) (not e!124593))))

(declare-fun arrayCountValidKeys!0 (array!8035 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!189342 (= res!89523 (= (arrayCountValidKeys!0 (_keys!5822 thiss!1248) #b00000000000000000000000000000000 (size!4108 (_keys!5822 thiss!1248))) (_size!1365 thiss!1248)))))

(declare-fun b!189343 () Bool)

(declare-fun res!89524 () Bool)

(assert (=> b!189343 (=> (not res!89524) (not e!124593))))

(assert (=> b!189343 (= res!89524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5822 thiss!1248) (mask!9038 thiss!1248)))))

(declare-fun b!189344 () Bool)

(assert (=> b!189344 (= e!124593 (arrayNoDuplicates!0 (_keys!5822 thiss!1248) #b00000000000000000000000000000000 Nil!2364))))

(assert (= (and d!55769 res!89522) b!189342))

(assert (= (and b!189342 res!89523) b!189343))

(assert (= (and b!189343 res!89524) b!189344))

(declare-fun m!215893 () Bool)

(assert (=> d!55769 m!215893))

(declare-fun m!215895 () Bool)

(assert (=> b!189342 m!215895))

(assert (=> b!189343 m!215745))

(assert (=> b!189344 m!215735))

(assert (=> start!19226 d!55769))

(declare-fun b!189357 () Bool)

(declare-fun e!124601 () SeekEntryResult!651)

(assert (=> b!189357 (= e!124601 Undefined!651)))

(declare-fun e!124602 () SeekEntryResult!651)

(declare-fun lt!93782 () SeekEntryResult!651)

(declare-fun b!189358 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8035 (_ BitVec 32)) SeekEntryResult!651)

(assert (=> b!189358 (= e!124602 (seekKeyOrZeroReturnVacant!0 (x!20391 lt!93782) (index!4776 lt!93782) (index!4776 lt!93782) key!828 (_keys!5822 thiss!1248) (mask!9038 thiss!1248)))))

(declare-fun d!55771 () Bool)

(declare-fun lt!93783 () SeekEntryResult!651)

(assert (=> d!55771 (and (or ((_ is Undefined!651) lt!93783) (not ((_ is Found!651) lt!93783)) (and (bvsge (index!4775 lt!93783) #b00000000000000000000000000000000) (bvslt (index!4775 lt!93783) (size!4108 (_keys!5822 thiss!1248))))) (or ((_ is Undefined!651) lt!93783) ((_ is Found!651) lt!93783) (not ((_ is MissingZero!651) lt!93783)) (and (bvsge (index!4774 lt!93783) #b00000000000000000000000000000000) (bvslt (index!4774 lt!93783) (size!4108 (_keys!5822 thiss!1248))))) (or ((_ is Undefined!651) lt!93783) ((_ is Found!651) lt!93783) ((_ is MissingZero!651) lt!93783) (not ((_ is MissingVacant!651) lt!93783)) (and (bvsge (index!4777 lt!93783) #b00000000000000000000000000000000) (bvslt (index!4777 lt!93783) (size!4108 (_keys!5822 thiss!1248))))) (or ((_ is Undefined!651) lt!93783) (ite ((_ is Found!651) lt!93783) (= (select (arr!3788 (_keys!5822 thiss!1248)) (index!4775 lt!93783)) key!828) (ite ((_ is MissingZero!651) lt!93783) (= (select (arr!3788 (_keys!5822 thiss!1248)) (index!4774 lt!93783)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!651) lt!93783) (= (select (arr!3788 (_keys!5822 thiss!1248)) (index!4777 lt!93783)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55771 (= lt!93783 e!124601)))

(declare-fun c!34041 () Bool)

(assert (=> d!55771 (= c!34041 (and ((_ is Intermediate!651) lt!93782) (undefined!1463 lt!93782)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8035 (_ BitVec 32)) SeekEntryResult!651)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55771 (= lt!93782 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9038 thiss!1248)) key!828 (_keys!5822 thiss!1248) (mask!9038 thiss!1248)))))

(assert (=> d!55771 (validMask!0 (mask!9038 thiss!1248))))

(assert (=> d!55771 (= (seekEntryOrOpen!0 key!828 (_keys!5822 thiss!1248) (mask!9038 thiss!1248)) lt!93783)))

(declare-fun b!189359 () Bool)

(assert (=> b!189359 (= e!124602 (MissingZero!651 (index!4776 lt!93782)))))

(declare-fun b!189360 () Bool)

(declare-fun e!124600 () SeekEntryResult!651)

(assert (=> b!189360 (= e!124600 (Found!651 (index!4776 lt!93782)))))

(declare-fun b!189361 () Bool)

(assert (=> b!189361 (= e!124601 e!124600)))

(declare-fun lt!93784 () (_ BitVec 64))

(assert (=> b!189361 (= lt!93784 (select (arr!3788 (_keys!5822 thiss!1248)) (index!4776 lt!93782)))))

(declare-fun c!34040 () Bool)

(assert (=> b!189361 (= c!34040 (= lt!93784 key!828))))

(declare-fun b!189362 () Bool)

(declare-fun c!34039 () Bool)

(assert (=> b!189362 (= c!34039 (= lt!93784 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189362 (= e!124600 e!124602)))

(assert (= (and d!55771 c!34041) b!189357))

(assert (= (and d!55771 (not c!34041)) b!189361))

(assert (= (and b!189361 c!34040) b!189360))

(assert (= (and b!189361 (not c!34040)) b!189362))

(assert (= (and b!189362 c!34039) b!189359))

(assert (= (and b!189362 (not c!34039)) b!189358))

(declare-fun m!215897 () Bool)

(assert (=> b!189358 m!215897))

(declare-fun m!215899 () Bool)

(assert (=> d!55771 m!215899))

(declare-fun m!215901 () Bool)

(assert (=> d!55771 m!215901))

(declare-fun m!215903 () Bool)

(assert (=> d!55771 m!215903))

(assert (=> d!55771 m!215729))

(declare-fun m!215905 () Bool)

(assert (=> d!55771 m!215905))

(assert (=> d!55771 m!215905))

(declare-fun m!215907 () Bool)

(assert (=> d!55771 m!215907))

(declare-fun m!215909 () Bool)

(assert (=> b!189361 m!215909))

(assert (=> b!189156 d!55771))

(declare-fun d!55773 () Bool)

(declare-fun e!124611 () Bool)

(assert (=> d!55773 e!124611))

(declare-fun c!34047 () Bool)

(declare-fun lt!93790 () SeekEntryResult!651)

(assert (=> d!55773 (= c!34047 ((_ is MissingZero!651) lt!93790))))

(assert (=> d!55773 (= lt!93790 (seekEntryOrOpen!0 key!828 (_keys!5822 thiss!1248) (mask!9038 thiss!1248)))))

(declare-fun lt!93789 () Unit!5702)

(declare-fun choose!1019 (array!8035 array!8037 (_ BitVec 32) (_ BitVec 32) V!5529 V!5529 (_ BitVec 64) Int) Unit!5702)

(assert (=> d!55773 (= lt!93789 (choose!1019 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) key!828 (defaultEntry!3857 thiss!1248)))))

(assert (=> d!55773 (validMask!0 (mask!9038 thiss!1248))))

(assert (=> d!55773 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!157 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) key!828 (defaultEntry!3857 thiss!1248)) lt!93789)))

(declare-fun b!189379 () Bool)

(assert (=> b!189379 (and (bvsge (index!4774 lt!93790) #b00000000000000000000000000000000) (bvslt (index!4774 lt!93790) (size!4108 (_keys!5822 thiss!1248))))))

(declare-fun res!89535 () Bool)

(assert (=> b!189379 (= res!89535 (= (select (arr!3788 (_keys!5822 thiss!1248)) (index!4774 lt!93790)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!124613 () Bool)

(assert (=> b!189379 (=> (not res!89535) (not e!124613))))

(declare-fun b!189380 () Bool)

(declare-fun res!89534 () Bool)

(declare-fun e!124614 () Bool)

(assert (=> b!189380 (=> (not res!89534) (not e!124614))))

(declare-fun call!19087 () Bool)

(assert (=> b!189380 (= res!89534 call!19087)))

(declare-fun e!124612 () Bool)

(assert (=> b!189380 (= e!124612 e!124614)))

(declare-fun bm!19083 () Bool)

(declare-fun call!19086 () Bool)

(assert (=> bm!19083 (= call!19086 (arrayContainsKey!0 (_keys!5822 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun bm!19084 () Bool)

(assert (=> bm!19084 (= call!19087 (inRange!0 (ite c!34047 (index!4774 lt!93790) (index!4777 lt!93790)) (mask!9038 thiss!1248)))))

(declare-fun b!189381 () Bool)

(assert (=> b!189381 (= e!124613 (not call!19086))))

(declare-fun b!189382 () Bool)

(assert (=> b!189382 (= e!124611 e!124612)))

(declare-fun c!34046 () Bool)

(assert (=> b!189382 (= c!34046 ((_ is MissingVacant!651) lt!93790))))

(declare-fun b!189383 () Bool)

(assert (=> b!189383 (= e!124614 (not call!19086))))

(declare-fun b!189384 () Bool)

(assert (=> b!189384 (= e!124612 ((_ is Undefined!651) lt!93790))))

(declare-fun b!189385 () Bool)

(assert (=> b!189385 (= e!124611 e!124613)))

(declare-fun res!89533 () Bool)

(assert (=> b!189385 (= res!89533 call!19087)))

(assert (=> b!189385 (=> (not res!89533) (not e!124613))))

(declare-fun b!189386 () Bool)

(declare-fun res!89536 () Bool)

(assert (=> b!189386 (=> (not res!89536) (not e!124614))))

(assert (=> b!189386 (= res!89536 (= (select (arr!3788 (_keys!5822 thiss!1248)) (index!4777 lt!93790)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189386 (and (bvsge (index!4777 lt!93790) #b00000000000000000000000000000000) (bvslt (index!4777 lt!93790) (size!4108 (_keys!5822 thiss!1248))))))

(assert (= (and d!55773 c!34047) b!189385))

(assert (= (and d!55773 (not c!34047)) b!189382))

(assert (= (and b!189385 res!89533) b!189379))

(assert (= (and b!189379 res!89535) b!189381))

(assert (= (and b!189382 c!34046) b!189380))

(assert (= (and b!189382 (not c!34046)) b!189384))

(assert (= (and b!189380 res!89534) b!189386))

(assert (= (and b!189386 res!89536) b!189383))

(assert (= (or b!189385 b!189380) bm!19084))

(assert (= (or b!189381 b!189383) bm!19083))

(assert (=> d!55773 m!215741))

(declare-fun m!215911 () Bool)

(assert (=> d!55773 m!215911))

(assert (=> d!55773 m!215729))

(declare-fun m!215913 () Bool)

(assert (=> b!189386 m!215913))

(declare-fun m!215915 () Bool)

(assert (=> bm!19084 m!215915))

(declare-fun m!215917 () Bool)

(assert (=> b!189379 m!215917))

(declare-fun m!215919 () Bool)

(assert (=> bm!19083 m!215919))

(assert (=> b!189151 d!55773))

(declare-fun b!189397 () Bool)

(declare-fun e!124625 () Bool)

(declare-fun contains!1321 (List!2367 (_ BitVec 64)) Bool)

(assert (=> b!189397 (= e!124625 (contains!1321 Nil!2364 (select (arr!3788 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189398 () Bool)

(declare-fun e!124624 () Bool)

(declare-fun call!19090 () Bool)

(assert (=> b!189398 (= e!124624 call!19090)))

(declare-fun bm!19087 () Bool)

(declare-fun c!34050 () Bool)

(assert (=> bm!19087 (= call!19090 (arrayNoDuplicates!0 (_keys!5822 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34050 (Cons!2363 (select (arr!3788 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000) Nil!2364) Nil!2364)))))

(declare-fun b!189399 () Bool)

(declare-fun e!124626 () Bool)

(declare-fun e!124623 () Bool)

(assert (=> b!189399 (= e!124626 e!124623)))

(declare-fun res!89543 () Bool)

(assert (=> b!189399 (=> (not res!89543) (not e!124623))))

(assert (=> b!189399 (= res!89543 (not e!124625))))

(declare-fun res!89544 () Bool)

(assert (=> b!189399 (=> (not res!89544) (not e!124625))))

(assert (=> b!189399 (= res!89544 (validKeyInArray!0 (select (arr!3788 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55775 () Bool)

(declare-fun res!89545 () Bool)

(assert (=> d!55775 (=> res!89545 e!124626)))

(assert (=> d!55775 (= res!89545 (bvsge #b00000000000000000000000000000000 (size!4108 (_keys!5822 thiss!1248))))))

(assert (=> d!55775 (= (arrayNoDuplicates!0 (_keys!5822 thiss!1248) #b00000000000000000000000000000000 Nil!2364) e!124626)))

(declare-fun b!189400 () Bool)

(assert (=> b!189400 (= e!124624 call!19090)))

(declare-fun b!189401 () Bool)

(assert (=> b!189401 (= e!124623 e!124624)))

(assert (=> b!189401 (= c!34050 (validKeyInArray!0 (select (arr!3788 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55775 (not res!89545)) b!189399))

(assert (= (and b!189399 res!89544) b!189397))

(assert (= (and b!189399 res!89543) b!189401))

(assert (= (and b!189401 c!34050) b!189400))

(assert (= (and b!189401 (not c!34050)) b!189398))

(assert (= (or b!189400 b!189398) bm!19087))

(assert (=> b!189397 m!215833))

(assert (=> b!189397 m!215833))

(declare-fun m!215921 () Bool)

(assert (=> b!189397 m!215921))

(assert (=> bm!19087 m!215833))

(declare-fun m!215923 () Bool)

(assert (=> bm!19087 m!215923))

(assert (=> b!189399 m!215833))

(assert (=> b!189399 m!215833))

(assert (=> b!189399 m!215843))

(assert (=> b!189401 m!215833))

(assert (=> b!189401 m!215833))

(assert (=> b!189401 m!215843))

(assert (=> b!189146 d!55775))

(declare-fun d!55777 () Bool)

(assert (=> d!55777 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189147 d!55777))

(declare-fun d!55779 () Bool)

(assert (=> d!55779 (= (array_inv!2443 (_keys!5822 thiss!1248)) (bvsge (size!4108 (_keys!5822 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189153 d!55779))

(declare-fun d!55781 () Bool)

(assert (=> d!55781 (= (array_inv!2444 (_values!3840 thiss!1248)) (bvsge (size!4109 (_values!3840 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189153 d!55781))

(declare-fun d!55783 () Bool)

(declare-fun e!124629 () Bool)

(assert (=> d!55783 e!124629))

(declare-fun res!89551 () Bool)

(assert (=> d!55783 (=> (not res!89551) (not e!124629))))

(declare-fun lt!93796 () SeekEntryResult!651)

(assert (=> d!55783 (= res!89551 ((_ is Found!651) lt!93796))))

(assert (=> d!55783 (= lt!93796 (seekEntryOrOpen!0 key!828 (_keys!5822 thiss!1248) (mask!9038 thiss!1248)))))

(declare-fun lt!93795 () Unit!5702)

(declare-fun choose!1020 (array!8035 array!8037 (_ BitVec 32) (_ BitVec 32) V!5529 V!5529 (_ BitVec 64) Int) Unit!5702)

(assert (=> d!55783 (= lt!93795 (choose!1020 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) key!828 (defaultEntry!3857 thiss!1248)))))

(assert (=> d!55783 (validMask!0 (mask!9038 thiss!1248))))

(assert (=> d!55783 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!162 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) key!828 (defaultEntry!3857 thiss!1248)) lt!93795)))

(declare-fun b!189406 () Bool)

(declare-fun res!89550 () Bool)

(assert (=> b!189406 (=> (not res!89550) (not e!124629))))

(assert (=> b!189406 (= res!89550 (inRange!0 (index!4775 lt!93796) (mask!9038 thiss!1248)))))

(declare-fun b!189407 () Bool)

(assert (=> b!189407 (= e!124629 (= (select (arr!3788 (_keys!5822 thiss!1248)) (index!4775 lt!93796)) key!828))))

(assert (=> b!189407 (and (bvsge (index!4775 lt!93796) #b00000000000000000000000000000000) (bvslt (index!4775 lt!93796) (size!4108 (_keys!5822 thiss!1248))))))

(assert (= (and d!55783 res!89551) b!189406))

(assert (= (and b!189406 res!89550) b!189407))

(assert (=> d!55783 m!215741))

(declare-fun m!215925 () Bool)

(assert (=> d!55783 m!215925))

(assert (=> d!55783 m!215729))

(declare-fun m!215927 () Bool)

(assert (=> b!189406 m!215927))

(declare-fun m!215929 () Bool)

(assert (=> b!189407 m!215929))

(assert (=> b!189148 d!55783))

(declare-fun d!55785 () Bool)

(assert (=> d!55785 (= (inRange!0 (index!4775 lt!93663) (mask!9038 thiss!1248)) (and (bvsge (index!4775 lt!93663) #b00000000000000000000000000000000) (bvslt (index!4775 lt!93663) (bvadd (mask!9038 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!189148 d!55785))

(declare-fun b!189414 () Bool)

(declare-fun e!124634 () Bool)

(assert (=> b!189414 (= e!124634 tp_is_empty!4411)))

(declare-fun mapNonEmpty!7618 () Bool)

(declare-fun mapRes!7618 () Bool)

(declare-fun tp!16762 () Bool)

(assert (=> mapNonEmpty!7618 (= mapRes!7618 (and tp!16762 e!124634))))

(declare-fun mapRest!7618 () (Array (_ BitVec 32) ValueCell!1862))

(declare-fun mapValue!7618 () ValueCell!1862)

(declare-fun mapKey!7618 () (_ BitVec 32))

(assert (=> mapNonEmpty!7618 (= mapRest!7609 (store mapRest!7618 mapKey!7618 mapValue!7618))))

(declare-fun condMapEmpty!7618 () Bool)

(declare-fun mapDefault!7618 () ValueCell!1862)

(assert (=> mapNonEmpty!7609 (= condMapEmpty!7618 (= mapRest!7609 ((as const (Array (_ BitVec 32) ValueCell!1862)) mapDefault!7618)))))

(declare-fun e!124635 () Bool)

(assert (=> mapNonEmpty!7609 (= tp!16746 (and e!124635 mapRes!7618))))

(declare-fun b!189415 () Bool)

(assert (=> b!189415 (= e!124635 tp_is_empty!4411)))

(declare-fun mapIsEmpty!7618 () Bool)

(assert (=> mapIsEmpty!7618 mapRes!7618))

(assert (= (and mapNonEmpty!7609 condMapEmpty!7618) mapIsEmpty!7618))

(assert (= (and mapNonEmpty!7609 (not condMapEmpty!7618)) mapNonEmpty!7618))

(assert (= (and mapNonEmpty!7618 ((_ is ValueCellFull!1862) mapValue!7618)) b!189414))

(assert (= (and mapNonEmpty!7609 ((_ is ValueCellFull!1862) mapDefault!7618)) b!189415))

(declare-fun m!215931 () Bool)

(assert (=> mapNonEmpty!7618 m!215931))

(declare-fun b_lambda!7347 () Bool)

(assert (= b_lambda!7345 (or (and b!189153 b_free!4639) b_lambda!7347)))

(check-sat (not b!189406) (not b!189317) (not bm!19071) (not b!189397) (not bm!19084) (not bm!19073) (not b!189399) (not b!189343) (not d!55763) tp_is_empty!4411 (not b!189258) (not b!189334) (not bm!19083) (not d!55783) (not bm!19087) (not d!55773) (not bm!19069) (not b!189342) (not d!55765) (not b!189256) (not b!189344) (not b!189358) (not d!55769) (not b!189321) (not b_lambda!7347) (not b!189310) (not b_next!4639) (not bm!19078) b_and!11295 (not bm!19070) (not b!189307) (not b!189301) (not d!55771) (not mapNonEmpty!7618) (not b!189314) (not b!189401) (not b!189303) (not b!189335) (not b!189311))
(check-sat b_and!11295 (not b_next!4639))
