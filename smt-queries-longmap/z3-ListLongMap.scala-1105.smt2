; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22776 () Bool)

(assert start!22776)

(declare-fun b!237309 () Bool)

(declare-fun b_free!6379 () Bool)

(declare-fun b_next!6379 () Bool)

(assert (=> b!237309 (= b_free!6379 (not b_next!6379))))

(declare-fun tp!22328 () Bool)

(declare-fun b_and!13307 () Bool)

(assert (=> b!237309 (= tp!22328 b_and!13307)))

(declare-fun mapNonEmpty!10580 () Bool)

(declare-fun mapRes!10580 () Bool)

(declare-fun tp!22327 () Bool)

(declare-fun e!154096 () Bool)

(assert (=> mapNonEmpty!10580 (= mapRes!10580 (and tp!22327 e!154096))))

(declare-fun mapKey!10580 () (_ BitVec 32))

(declare-datatypes ((V!7969 0))(
  ( (V!7970 (val!3165 Int)) )
))
(declare-datatypes ((ValueCell!2777 0))(
  ( (ValueCellFull!2777 (v!5193 V!7969)) (EmptyCell!2777) )
))
(declare-fun mapValue!10580 () ValueCell!2777)

(declare-datatypes ((array!11745 0))(
  ( (array!11746 (arr!5577 (Array (_ BitVec 32) ValueCell!2777)) (size!5918 (_ BitVec 32))) )
))
(declare-datatypes ((array!11747 0))(
  ( (array!11748 (arr!5578 (Array (_ BitVec 32) (_ BitVec 64))) (size!5919 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3454 0))(
  ( (LongMapFixedSize!3455 (defaultEntry!4407 Int) (mask!10419 (_ BitVec 32)) (extraKeys!4144 (_ BitVec 32)) (zeroValue!4248 V!7969) (minValue!4248 V!7969) (_size!1776 (_ BitVec 32)) (_keys!6498 array!11747) (_values!4390 array!11745) (_vacant!1776 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3454)

(declare-fun mapRest!10580 () (Array (_ BitVec 32) ValueCell!2777))

(assert (=> mapNonEmpty!10580 (= (arr!5577 (_values!4390 thiss!1504)) (store mapRest!10580 mapKey!10580 mapValue!10580))))

(declare-fun b!237305 () Bool)

(declare-fun e!154094 () Bool)

(declare-fun e!154100 () Bool)

(assert (=> b!237305 (= e!154094 (and e!154100 mapRes!10580))))

(declare-fun condMapEmpty!10580 () Bool)

(declare-fun mapDefault!10580 () ValueCell!2777)

(assert (=> b!237305 (= condMapEmpty!10580 (= (arr!5577 (_values!4390 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2777)) mapDefault!10580)))))

(declare-fun b!237306 () Bool)

(declare-fun res!116282 () Bool)

(declare-fun e!154095 () Bool)

(assert (=> b!237306 (=> (not res!116282) (not e!154095))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!237306 (= res!116282 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237307 () Bool)

(declare-fun e!154099 () Bool)

(assert (=> b!237307 (= e!154095 e!154099)))

(declare-fun res!116281 () Bool)

(assert (=> b!237307 (=> (not res!116281) (not e!154099))))

(declare-datatypes ((SeekEntryResult!1006 0))(
  ( (MissingZero!1006 (index!6194 (_ BitVec 32))) (Found!1006 (index!6195 (_ BitVec 32))) (Intermediate!1006 (undefined!1818 Bool) (index!6196 (_ BitVec 32)) (x!23957 (_ BitVec 32))) (Undefined!1006) (MissingVacant!1006 (index!6197 (_ BitVec 32))) )
))
(declare-fun lt!119904 () SeekEntryResult!1006)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!237307 (= res!116281 (or (= lt!119904 (MissingZero!1006 index!297)) (= lt!119904 (MissingVacant!1006 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11747 (_ BitVec 32)) SeekEntryResult!1006)

(assert (=> b!237307 (= lt!119904 (seekEntryOrOpen!0 key!932 (_keys!6498 thiss!1504) (mask!10419 thiss!1504)))))

(declare-fun e!154098 () Bool)

(declare-fun tp_is_empty!6241 () Bool)

(declare-fun array_inv!3681 (array!11747) Bool)

(declare-fun array_inv!3682 (array!11745) Bool)

(assert (=> b!237309 (= e!154098 (and tp!22328 tp_is_empty!6241 (array_inv!3681 (_keys!6498 thiss!1504)) (array_inv!3682 (_values!4390 thiss!1504)) e!154094))))

(declare-fun b!237310 () Bool)

(assert (=> b!237310 (= e!154096 tp_is_empty!6241)))

(declare-fun mapIsEmpty!10580 () Bool)

(assert (=> mapIsEmpty!10580 mapRes!10580))

(declare-fun b!237311 () Bool)

(declare-fun res!116280 () Bool)

(assert (=> b!237311 (=> (not res!116280) (not e!154099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!237311 (= res!116280 (validMask!0 (mask!10419 thiss!1504)))))

(declare-fun res!116283 () Bool)

(assert (=> start!22776 (=> (not res!116283) (not e!154095))))

(declare-fun valid!1370 (LongMapFixedSize!3454) Bool)

(assert (=> start!22776 (= res!116283 (valid!1370 thiss!1504))))

(assert (=> start!22776 e!154095))

(assert (=> start!22776 e!154098))

(assert (=> start!22776 true))

(declare-fun b!237308 () Bool)

(declare-fun res!116284 () Bool)

(assert (=> b!237308 (=> (not res!116284) (not e!154099))))

(declare-datatypes ((tuple2!4644 0))(
  ( (tuple2!4645 (_1!2333 (_ BitVec 64)) (_2!2333 V!7969)) )
))
(declare-datatypes ((List!3559 0))(
  ( (Nil!3556) (Cons!3555 (h!4210 tuple2!4644) (t!8537 List!3559)) )
))
(declare-datatypes ((ListLongMap!3547 0))(
  ( (ListLongMap!3548 (toList!1789 List!3559)) )
))
(declare-fun contains!1676 (ListLongMap!3547 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1298 (array!11747 array!11745 (_ BitVec 32) (_ BitVec 32) V!7969 V!7969 (_ BitVec 32) Int) ListLongMap!3547)

(assert (=> b!237308 (= res!116284 (not (contains!1676 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)) key!932)))))

(declare-fun b!237312 () Bool)

(assert (=> b!237312 (= e!154099 (and (= (size!5918 (_values!4390 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10419 thiss!1504))) (= (size!5919 (_keys!6498 thiss!1504)) (size!5918 (_values!4390 thiss!1504))) (bvsge (mask!10419 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4144 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4144 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!237313 () Bool)

(assert (=> b!237313 (= e!154100 tp_is_empty!6241)))

(assert (= (and start!22776 res!116283) b!237306))

(assert (= (and b!237306 res!116282) b!237307))

(assert (= (and b!237307 res!116281) b!237308))

(assert (= (and b!237308 res!116284) b!237311))

(assert (= (and b!237311 res!116280) b!237312))

(assert (= (and b!237305 condMapEmpty!10580) mapIsEmpty!10580))

(assert (= (and b!237305 (not condMapEmpty!10580)) mapNonEmpty!10580))

(get-info :version)

(assert (= (and mapNonEmpty!10580 ((_ is ValueCellFull!2777) mapValue!10580)) b!237310))

(assert (= (and b!237305 ((_ is ValueCellFull!2777) mapDefault!10580)) b!237313))

(assert (= b!237309 b!237305))

(assert (= start!22776 b!237309))

(declare-fun m!257605 () Bool)

(assert (=> mapNonEmpty!10580 m!257605))

(declare-fun m!257607 () Bool)

(assert (=> b!237311 m!257607))

(declare-fun m!257609 () Bool)

(assert (=> b!237309 m!257609))

(declare-fun m!257611 () Bool)

(assert (=> b!237309 m!257611))

(declare-fun m!257613 () Bool)

(assert (=> b!237307 m!257613))

(declare-fun m!257615 () Bool)

(assert (=> start!22776 m!257615))

(declare-fun m!257617 () Bool)

(assert (=> b!237308 m!257617))

(assert (=> b!237308 m!257617))

(declare-fun m!257619 () Bool)

(assert (=> b!237308 m!257619))

(check-sat (not b!237307) (not start!22776) (not b!237311) b_and!13307 tp_is_empty!6241 (not b_next!6379) (not b!237308) (not b!237309) (not mapNonEmpty!10580))
(check-sat b_and!13307 (not b_next!6379))
(get-model)

(declare-fun d!59473 () Bool)

(declare-fun res!116321 () Bool)

(declare-fun e!154145 () Bool)

(assert (=> d!59473 (=> (not res!116321) (not e!154145))))

(declare-fun simpleValid!240 (LongMapFixedSize!3454) Bool)

(assert (=> d!59473 (= res!116321 (simpleValid!240 thiss!1504))))

(assert (=> d!59473 (= (valid!1370 thiss!1504) e!154145)))

(declare-fun b!237374 () Bool)

(declare-fun res!116322 () Bool)

(assert (=> b!237374 (=> (not res!116322) (not e!154145))))

(declare-fun arrayCountValidKeys!0 (array!11747 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!237374 (= res!116322 (= (arrayCountValidKeys!0 (_keys!6498 thiss!1504) #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))) (_size!1776 thiss!1504)))))

(declare-fun b!237375 () Bool)

(declare-fun res!116323 () Bool)

(assert (=> b!237375 (=> (not res!116323) (not e!154145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11747 (_ BitVec 32)) Bool)

(assert (=> b!237375 (= res!116323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6498 thiss!1504) (mask!10419 thiss!1504)))))

(declare-fun b!237376 () Bool)

(declare-datatypes ((List!3562 0))(
  ( (Nil!3559) (Cons!3558 (h!4213 (_ BitVec 64)) (t!8542 List!3562)) )
))
(declare-fun arrayNoDuplicates!0 (array!11747 (_ BitVec 32) List!3562) Bool)

(assert (=> b!237376 (= e!154145 (arrayNoDuplicates!0 (_keys!6498 thiss!1504) #b00000000000000000000000000000000 Nil!3559))))

(assert (= (and d!59473 res!116321) b!237374))

(assert (= (and b!237374 res!116322) b!237375))

(assert (= (and b!237375 res!116323) b!237376))

(declare-fun m!257653 () Bool)

(assert (=> d!59473 m!257653))

(declare-fun m!257655 () Bool)

(assert (=> b!237374 m!257655))

(declare-fun m!257657 () Bool)

(assert (=> b!237375 m!257657))

(declare-fun m!257659 () Bool)

(assert (=> b!237376 m!257659))

(assert (=> start!22776 d!59473))

(declare-fun b!237389 () Bool)

(declare-fun e!154153 () SeekEntryResult!1006)

(declare-fun lt!119919 () SeekEntryResult!1006)

(assert (=> b!237389 (= e!154153 (Found!1006 (index!6196 lt!119919)))))

(declare-fun d!59475 () Bool)

(declare-fun lt!119917 () SeekEntryResult!1006)

(assert (=> d!59475 (and (or ((_ is Undefined!1006) lt!119917) (not ((_ is Found!1006) lt!119917)) (and (bvsge (index!6195 lt!119917) #b00000000000000000000000000000000) (bvslt (index!6195 lt!119917) (size!5919 (_keys!6498 thiss!1504))))) (or ((_ is Undefined!1006) lt!119917) ((_ is Found!1006) lt!119917) (not ((_ is MissingZero!1006) lt!119917)) (and (bvsge (index!6194 lt!119917) #b00000000000000000000000000000000) (bvslt (index!6194 lt!119917) (size!5919 (_keys!6498 thiss!1504))))) (or ((_ is Undefined!1006) lt!119917) ((_ is Found!1006) lt!119917) ((_ is MissingZero!1006) lt!119917) (not ((_ is MissingVacant!1006) lt!119917)) (and (bvsge (index!6197 lt!119917) #b00000000000000000000000000000000) (bvslt (index!6197 lt!119917) (size!5919 (_keys!6498 thiss!1504))))) (or ((_ is Undefined!1006) lt!119917) (ite ((_ is Found!1006) lt!119917) (= (select (arr!5578 (_keys!6498 thiss!1504)) (index!6195 lt!119917)) key!932) (ite ((_ is MissingZero!1006) lt!119917) (= (select (arr!5578 (_keys!6498 thiss!1504)) (index!6194 lt!119917)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1006) lt!119917) (= (select (arr!5578 (_keys!6498 thiss!1504)) (index!6197 lt!119917)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!154152 () SeekEntryResult!1006)

(assert (=> d!59475 (= lt!119917 e!154152)))

(declare-fun c!39578 () Bool)

(assert (=> d!59475 (= c!39578 (and ((_ is Intermediate!1006) lt!119919) (undefined!1818 lt!119919)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11747 (_ BitVec 32)) SeekEntryResult!1006)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59475 (= lt!119919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10419 thiss!1504)) key!932 (_keys!6498 thiss!1504) (mask!10419 thiss!1504)))))

(assert (=> d!59475 (validMask!0 (mask!10419 thiss!1504))))

(assert (=> d!59475 (= (seekEntryOrOpen!0 key!932 (_keys!6498 thiss!1504) (mask!10419 thiss!1504)) lt!119917)))

(declare-fun b!237390 () Bool)

(assert (=> b!237390 (= e!154152 e!154153)))

(declare-fun lt!119918 () (_ BitVec 64))

(assert (=> b!237390 (= lt!119918 (select (arr!5578 (_keys!6498 thiss!1504)) (index!6196 lt!119919)))))

(declare-fun c!39577 () Bool)

(assert (=> b!237390 (= c!39577 (= lt!119918 key!932))))

(declare-fun b!237391 () Bool)

(assert (=> b!237391 (= e!154152 Undefined!1006)))

(declare-fun b!237392 () Bool)

(declare-fun e!154154 () SeekEntryResult!1006)

(assert (=> b!237392 (= e!154154 (MissingZero!1006 (index!6196 lt!119919)))))

(declare-fun b!237393 () Bool)

(declare-fun c!39576 () Bool)

(assert (=> b!237393 (= c!39576 (= lt!119918 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237393 (= e!154153 e!154154)))

(declare-fun b!237394 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11747 (_ BitVec 32)) SeekEntryResult!1006)

(assert (=> b!237394 (= e!154154 (seekKeyOrZeroReturnVacant!0 (x!23957 lt!119919) (index!6196 lt!119919) (index!6196 lt!119919) key!932 (_keys!6498 thiss!1504) (mask!10419 thiss!1504)))))

(assert (= (and d!59475 c!39578) b!237391))

(assert (= (and d!59475 (not c!39578)) b!237390))

(assert (= (and b!237390 c!39577) b!237389))

(assert (= (and b!237390 (not c!39577)) b!237393))

(assert (= (and b!237393 c!39576) b!237392))

(assert (= (and b!237393 (not c!39576)) b!237394))

(declare-fun m!257661 () Bool)

(assert (=> d!59475 m!257661))

(declare-fun m!257663 () Bool)

(assert (=> d!59475 m!257663))

(assert (=> d!59475 m!257607))

(declare-fun m!257665 () Bool)

(assert (=> d!59475 m!257665))

(declare-fun m!257667 () Bool)

(assert (=> d!59475 m!257667))

(assert (=> d!59475 m!257661))

(declare-fun m!257669 () Bool)

(assert (=> d!59475 m!257669))

(declare-fun m!257671 () Bool)

(assert (=> b!237390 m!257671))

(declare-fun m!257673 () Bool)

(assert (=> b!237394 m!257673))

(assert (=> b!237307 d!59475))

(declare-fun d!59477 () Bool)

(assert (=> d!59477 (= (validMask!0 (mask!10419 thiss!1504)) (and (or (= (mask!10419 thiss!1504) #b00000000000000000000000000000111) (= (mask!10419 thiss!1504) #b00000000000000000000000000001111) (= (mask!10419 thiss!1504) #b00000000000000000000000000011111) (= (mask!10419 thiss!1504) #b00000000000000000000000000111111) (= (mask!10419 thiss!1504) #b00000000000000000000000001111111) (= (mask!10419 thiss!1504) #b00000000000000000000000011111111) (= (mask!10419 thiss!1504) #b00000000000000000000000111111111) (= (mask!10419 thiss!1504) #b00000000000000000000001111111111) (= (mask!10419 thiss!1504) #b00000000000000000000011111111111) (= (mask!10419 thiss!1504) #b00000000000000000000111111111111) (= (mask!10419 thiss!1504) #b00000000000000000001111111111111) (= (mask!10419 thiss!1504) #b00000000000000000011111111111111) (= (mask!10419 thiss!1504) #b00000000000000000111111111111111) (= (mask!10419 thiss!1504) #b00000000000000001111111111111111) (= (mask!10419 thiss!1504) #b00000000000000011111111111111111) (= (mask!10419 thiss!1504) #b00000000000000111111111111111111) (= (mask!10419 thiss!1504) #b00000000000001111111111111111111) (= (mask!10419 thiss!1504) #b00000000000011111111111111111111) (= (mask!10419 thiss!1504) #b00000000000111111111111111111111) (= (mask!10419 thiss!1504) #b00000000001111111111111111111111) (= (mask!10419 thiss!1504) #b00000000011111111111111111111111) (= (mask!10419 thiss!1504) #b00000000111111111111111111111111) (= (mask!10419 thiss!1504) #b00000001111111111111111111111111) (= (mask!10419 thiss!1504) #b00000011111111111111111111111111) (= (mask!10419 thiss!1504) #b00000111111111111111111111111111) (= (mask!10419 thiss!1504) #b00001111111111111111111111111111) (= (mask!10419 thiss!1504) #b00011111111111111111111111111111) (= (mask!10419 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10419 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!237311 d!59477))

(declare-fun d!59479 () Bool)

(declare-fun e!154159 () Bool)

(assert (=> d!59479 e!154159))

(declare-fun res!116326 () Bool)

(assert (=> d!59479 (=> res!116326 e!154159)))

(declare-fun lt!119929 () Bool)

(assert (=> d!59479 (= res!116326 (not lt!119929))))

(declare-fun lt!119928 () Bool)

(assert (=> d!59479 (= lt!119929 lt!119928)))

(declare-datatypes ((Unit!7292 0))(
  ( (Unit!7293) )
))
(declare-fun lt!119931 () Unit!7292)

(declare-fun e!154160 () Unit!7292)

(assert (=> d!59479 (= lt!119931 e!154160)))

(declare-fun c!39581 () Bool)

(assert (=> d!59479 (= c!39581 lt!119928)))

(declare-fun containsKey!265 (List!3559 (_ BitVec 64)) Bool)

(assert (=> d!59479 (= lt!119928 (containsKey!265 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932))))

(assert (=> d!59479 (= (contains!1676 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)) key!932) lt!119929)))

(declare-fun b!237401 () Bool)

(declare-fun lt!119930 () Unit!7292)

(assert (=> b!237401 (= e!154160 lt!119930)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!214 (List!3559 (_ BitVec 64)) Unit!7292)

(assert (=> b!237401 (= lt!119930 (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932))))

(declare-datatypes ((Option!279 0))(
  ( (Some!278 (v!5196 V!7969)) (None!277) )
))
(declare-fun isDefined!215 (Option!279) Bool)

(declare-fun getValueByKey!273 (List!3559 (_ BitVec 64)) Option!279)

(assert (=> b!237401 (isDefined!215 (getValueByKey!273 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932))))

(declare-fun b!237402 () Bool)

(declare-fun Unit!7294 () Unit!7292)

(assert (=> b!237402 (= e!154160 Unit!7294)))

(declare-fun b!237403 () Bool)

(assert (=> b!237403 (= e!154159 (isDefined!215 (getValueByKey!273 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932)))))

(assert (= (and d!59479 c!39581) b!237401))

(assert (= (and d!59479 (not c!39581)) b!237402))

(assert (= (and d!59479 (not res!116326)) b!237403))

(declare-fun m!257675 () Bool)

(assert (=> d!59479 m!257675))

(declare-fun m!257677 () Bool)

(assert (=> b!237401 m!257677))

(declare-fun m!257679 () Bool)

(assert (=> b!237401 m!257679))

(assert (=> b!237401 m!257679))

(declare-fun m!257681 () Bool)

(assert (=> b!237401 m!257681))

(assert (=> b!237403 m!257679))

(assert (=> b!237403 m!257679))

(assert (=> b!237403 m!257681))

(assert (=> b!237308 d!59479))

(declare-fun call!22065 () ListLongMap!3547)

(declare-fun call!22063 () ListLongMap!3547)

(declare-fun call!22062 () ListLongMap!3547)

(declare-fun c!39596 () Bool)

(declare-fun call!22066 () ListLongMap!3547)

(declare-fun c!39594 () Bool)

(declare-fun bm!22059 () Bool)

(declare-fun +!650 (ListLongMap!3547 tuple2!4644) ListLongMap!3547)

(assert (=> bm!22059 (= call!22065 (+!650 (ite c!39594 call!22062 (ite c!39596 call!22066 call!22063)) (ite (or c!39594 c!39596) (tuple2!4645 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))))))

(declare-fun b!237446 () Bool)

(declare-fun res!116345 () Bool)

(declare-fun e!154188 () Bool)

(assert (=> b!237446 (=> (not res!116345) (not e!154188))))

(declare-fun e!154196 () Bool)

(assert (=> b!237446 (= res!116345 e!154196)))

(declare-fun c!39595 () Bool)

(assert (=> b!237446 (= c!39595 (not (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!237447 () Bool)

(declare-fun e!154199 () Unit!7292)

(declare-fun Unit!7295 () Unit!7292)

(assert (=> b!237447 (= e!154199 Unit!7295)))

(declare-fun bm!22060 () Bool)

(declare-fun call!22068 () Bool)

(declare-fun lt!119979 () ListLongMap!3547)

(assert (=> bm!22060 (= call!22068 (contains!1676 lt!119979 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237449 () Bool)

(declare-fun e!154187 () ListLongMap!3547)

(assert (=> b!237449 (= e!154187 call!22063)))

(declare-fun b!237450 () Bool)

(declare-fun e!154198 () Bool)

(declare-fun e!154194 () Bool)

(assert (=> b!237450 (= e!154198 e!154194)))

(declare-fun res!116351 () Bool)

(assert (=> b!237450 (= res!116351 call!22068)))

(assert (=> b!237450 (=> (not res!116351) (not e!154194))))

(declare-fun b!237451 () Bool)

(declare-fun call!22064 () ListLongMap!3547)

(assert (=> b!237451 (= e!154187 call!22064)))

(declare-fun b!237452 () Bool)

(declare-fun e!154191 () Bool)

(declare-fun e!154195 () Bool)

(assert (=> b!237452 (= e!154191 e!154195)))

(declare-fun res!116348 () Bool)

(assert (=> b!237452 (=> (not res!116348) (not e!154195))))

(assert (=> b!237452 (= res!116348 (contains!1676 lt!119979 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))))))

(declare-fun b!237453 () Bool)

(declare-fun e!154197 () Bool)

(assert (=> b!237453 (= e!154196 e!154197)))

(declare-fun res!116350 () Bool)

(declare-fun call!22067 () Bool)

(assert (=> b!237453 (= res!116350 call!22067)))

(assert (=> b!237453 (=> (not res!116350) (not e!154197))))

(declare-fun bm!22061 () Bool)

(assert (=> bm!22061 (= call!22067 (contains!1676 lt!119979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237454 () Bool)

(declare-fun e!154189 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!237454 (= e!154189 (validKeyInArray!0 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22062 () Bool)

(assert (=> bm!22062 (= call!22063 call!22066)))

(declare-fun bm!22063 () Bool)

(assert (=> bm!22063 (= call!22064 call!22065)))

(declare-fun b!237455 () Bool)

(assert (=> b!237455 (= e!154188 e!154198)))

(declare-fun c!39599 () Bool)

(assert (=> b!237455 (= c!39599 (not (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!237456 () Bool)

(declare-fun e!154193 () Bool)

(assert (=> b!237456 (= e!154193 (validKeyInArray!0 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237457 () Bool)

(declare-fun e!154192 () ListLongMap!3547)

(assert (=> b!237457 (= e!154192 (+!650 call!22065 (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))))

(declare-fun b!237458 () Bool)

(declare-fun res!116353 () Bool)

(assert (=> b!237458 (=> (not res!116353) (not e!154188))))

(assert (=> b!237458 (= res!116353 e!154191)))

(declare-fun res!116347 () Bool)

(assert (=> b!237458 (=> res!116347 e!154191)))

(assert (=> b!237458 (= res!116347 (not e!154189))))

(declare-fun res!116349 () Bool)

(assert (=> b!237458 (=> (not res!116349) (not e!154189))))

(assert (=> b!237458 (= res!116349 (bvslt #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))))))

(declare-fun bm!22064 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!533 (array!11747 array!11745 (_ BitVec 32) (_ BitVec 32) V!7969 V!7969 (_ BitVec 32) Int) ListLongMap!3547)

(assert (=> bm!22064 (= call!22062 (getCurrentListMapNoExtraKeys!533 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))))

(declare-fun b!237459 () Bool)

(assert (=> b!237459 (= e!154196 (not call!22067))))

(declare-fun b!237460 () Bool)

(declare-fun apply!217 (ListLongMap!3547 (_ BitVec 64)) V!7969)

(declare-fun get!2871 (ValueCell!2777 V!7969) V!7969)

(declare-fun dynLambda!551 (Int (_ BitVec 64)) V!7969)

(assert (=> b!237460 (= e!154195 (= (apply!217 lt!119979 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)) (get!2871 (select (arr!5577 (_values!4390 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4407 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237460 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5918 (_values!4390 thiss!1504))))))

(assert (=> b!237460 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))))))

(declare-fun b!237461 () Bool)

(declare-fun c!39597 () Bool)

(assert (=> b!237461 (= c!39597 (and (not (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!154190 () ListLongMap!3547)

(assert (=> b!237461 (= e!154190 e!154187)))

(declare-fun b!237462 () Bool)

(assert (=> b!237462 (= e!154190 call!22064)))

(declare-fun b!237463 () Bool)

(assert (=> b!237463 (= e!154192 e!154190)))

(assert (=> b!237463 (= c!39596 (and (not (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22065 () Bool)

(assert (=> bm!22065 (= call!22066 call!22062)))

(declare-fun b!237464 () Bool)

(assert (=> b!237464 (= e!154198 (not call!22068))))

(declare-fun d!59481 () Bool)

(assert (=> d!59481 e!154188))

(declare-fun res!116346 () Bool)

(assert (=> d!59481 (=> (not res!116346) (not e!154188))))

(assert (=> d!59481 (= res!116346 (or (bvsge #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))))))))

(declare-fun lt!119988 () ListLongMap!3547)

(assert (=> d!59481 (= lt!119979 lt!119988)))

(declare-fun lt!119982 () Unit!7292)

(assert (=> d!59481 (= lt!119982 e!154199)))

(declare-fun c!39598 () Bool)

(assert (=> d!59481 (= c!39598 e!154193)))

(declare-fun res!116352 () Bool)

(assert (=> d!59481 (=> (not res!116352) (not e!154193))))

(assert (=> d!59481 (= res!116352 (bvslt #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))))))

(assert (=> d!59481 (= lt!119988 e!154192)))

(assert (=> d!59481 (= c!39594 (and (not (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4144 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59481 (validMask!0 (mask!10419 thiss!1504))))

(assert (=> d!59481 (= (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)) lt!119979)))

(declare-fun b!237448 () Bool)

(assert (=> b!237448 (= e!154197 (= (apply!217 lt!119979 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4248 thiss!1504)))))

(declare-fun b!237465 () Bool)

(declare-fun lt!119987 () Unit!7292)

(assert (=> b!237465 (= e!154199 lt!119987)))

(declare-fun lt!119993 () ListLongMap!3547)

(assert (=> b!237465 (= lt!119993 (getCurrentListMapNoExtraKeys!533 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))))

(declare-fun lt!119986 () (_ BitVec 64))

(assert (=> b!237465 (= lt!119986 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119985 () (_ BitVec 64))

(assert (=> b!237465 (= lt!119985 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119978 () Unit!7292)

(declare-fun addStillContains!193 (ListLongMap!3547 (_ BitVec 64) V!7969 (_ BitVec 64)) Unit!7292)

(assert (=> b!237465 (= lt!119978 (addStillContains!193 lt!119993 lt!119986 (zeroValue!4248 thiss!1504) lt!119985))))

(assert (=> b!237465 (contains!1676 (+!650 lt!119993 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504))) lt!119985)))

(declare-fun lt!119977 () Unit!7292)

(assert (=> b!237465 (= lt!119977 lt!119978)))

(declare-fun lt!119981 () ListLongMap!3547)

(assert (=> b!237465 (= lt!119981 (getCurrentListMapNoExtraKeys!533 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))))

(declare-fun lt!119976 () (_ BitVec 64))

(assert (=> b!237465 (= lt!119976 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119980 () (_ BitVec 64))

(assert (=> b!237465 (= lt!119980 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119996 () Unit!7292)

(declare-fun addApplyDifferent!193 (ListLongMap!3547 (_ BitVec 64) V!7969 (_ BitVec 64)) Unit!7292)

(assert (=> b!237465 (= lt!119996 (addApplyDifferent!193 lt!119981 lt!119976 (minValue!4248 thiss!1504) lt!119980))))

(assert (=> b!237465 (= (apply!217 (+!650 lt!119981 (tuple2!4645 lt!119976 (minValue!4248 thiss!1504))) lt!119980) (apply!217 lt!119981 lt!119980))))

(declare-fun lt!119983 () Unit!7292)

(assert (=> b!237465 (= lt!119983 lt!119996)))

(declare-fun lt!119991 () ListLongMap!3547)

(assert (=> b!237465 (= lt!119991 (getCurrentListMapNoExtraKeys!533 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))))

(declare-fun lt!119997 () (_ BitVec 64))

(assert (=> b!237465 (= lt!119997 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119984 () (_ BitVec 64))

(assert (=> b!237465 (= lt!119984 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119994 () Unit!7292)

(assert (=> b!237465 (= lt!119994 (addApplyDifferent!193 lt!119991 lt!119997 (zeroValue!4248 thiss!1504) lt!119984))))

(assert (=> b!237465 (= (apply!217 (+!650 lt!119991 (tuple2!4645 lt!119997 (zeroValue!4248 thiss!1504))) lt!119984) (apply!217 lt!119991 lt!119984))))

(declare-fun lt!119992 () Unit!7292)

(assert (=> b!237465 (= lt!119992 lt!119994)))

(declare-fun lt!119989 () ListLongMap!3547)

(assert (=> b!237465 (= lt!119989 (getCurrentListMapNoExtraKeys!533 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))))

(declare-fun lt!119990 () (_ BitVec 64))

(assert (=> b!237465 (= lt!119990 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119995 () (_ BitVec 64))

(assert (=> b!237465 (= lt!119995 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237465 (= lt!119987 (addApplyDifferent!193 lt!119989 lt!119990 (minValue!4248 thiss!1504) lt!119995))))

(assert (=> b!237465 (= (apply!217 (+!650 lt!119989 (tuple2!4645 lt!119990 (minValue!4248 thiss!1504))) lt!119995) (apply!217 lt!119989 lt!119995))))

(declare-fun b!237466 () Bool)

(assert (=> b!237466 (= e!154194 (= (apply!217 lt!119979 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4248 thiss!1504)))))

(assert (= (and d!59481 c!39594) b!237457))

(assert (= (and d!59481 (not c!39594)) b!237463))

(assert (= (and b!237463 c!39596) b!237462))

(assert (= (and b!237463 (not c!39596)) b!237461))

(assert (= (and b!237461 c!39597) b!237451))

(assert (= (and b!237461 (not c!39597)) b!237449))

(assert (= (or b!237451 b!237449) bm!22062))

(assert (= (or b!237462 bm!22062) bm!22065))

(assert (= (or b!237462 b!237451) bm!22063))

(assert (= (or b!237457 bm!22065) bm!22064))

(assert (= (or b!237457 bm!22063) bm!22059))

(assert (= (and d!59481 res!116352) b!237456))

(assert (= (and d!59481 c!39598) b!237465))

(assert (= (and d!59481 (not c!39598)) b!237447))

(assert (= (and d!59481 res!116346) b!237458))

(assert (= (and b!237458 res!116349) b!237454))

(assert (= (and b!237458 (not res!116347)) b!237452))

(assert (= (and b!237452 res!116348) b!237460))

(assert (= (and b!237458 res!116353) b!237446))

(assert (= (and b!237446 c!39595) b!237453))

(assert (= (and b!237446 (not c!39595)) b!237459))

(assert (= (and b!237453 res!116350) b!237448))

(assert (= (or b!237453 b!237459) bm!22061))

(assert (= (and b!237446 res!116345) b!237455))

(assert (= (and b!237455 c!39599) b!237450))

(assert (= (and b!237455 (not c!39599)) b!237464))

(assert (= (and b!237450 res!116351) b!237466))

(assert (= (or b!237450 b!237464) bm!22060))

(declare-fun b_lambda!7937 () Bool)

(assert (=> (not b_lambda!7937) (not b!237460)))

(declare-fun t!8541 () Bool)

(declare-fun tb!2939 () Bool)

(assert (=> (and b!237309 (= (defaultEntry!4407 thiss!1504) (defaultEntry!4407 thiss!1504)) t!8541) tb!2939))

(declare-fun result!5155 () Bool)

(assert (=> tb!2939 (= result!5155 tp_is_empty!6241)))

(assert (=> b!237460 t!8541))

(declare-fun b_and!13313 () Bool)

(assert (= b_and!13307 (and (=> t!8541 result!5155) b_and!13313)))

(declare-fun m!257683 () Bool)

(assert (=> bm!22061 m!257683))

(declare-fun m!257685 () Bool)

(assert (=> bm!22060 m!257685))

(declare-fun m!257687 () Bool)

(assert (=> bm!22059 m!257687))

(declare-fun m!257689 () Bool)

(assert (=> b!237465 m!257689))

(declare-fun m!257691 () Bool)

(assert (=> b!237465 m!257691))

(declare-fun m!257693 () Bool)

(assert (=> b!237465 m!257693))

(declare-fun m!257695 () Bool)

(assert (=> b!237465 m!257695))

(declare-fun m!257697 () Bool)

(assert (=> b!237465 m!257697))

(declare-fun m!257699 () Bool)

(assert (=> b!237465 m!257699))

(assert (=> b!237465 m!257699))

(declare-fun m!257701 () Bool)

(assert (=> b!237465 m!257701))

(declare-fun m!257703 () Bool)

(assert (=> b!237465 m!257703))

(declare-fun m!257705 () Bool)

(assert (=> b!237465 m!257705))

(declare-fun m!257707 () Bool)

(assert (=> b!237465 m!257707))

(assert (=> b!237465 m!257705))

(declare-fun m!257709 () Bool)

(assert (=> b!237465 m!257709))

(declare-fun m!257711 () Bool)

(assert (=> b!237465 m!257711))

(declare-fun m!257713 () Bool)

(assert (=> b!237465 m!257713))

(assert (=> b!237465 m!257691))

(declare-fun m!257715 () Bool)

(assert (=> b!237465 m!257715))

(assert (=> b!237465 m!257715))

(declare-fun m!257717 () Bool)

(assert (=> b!237465 m!257717))

(declare-fun m!257719 () Bool)

(assert (=> b!237465 m!257719))

(declare-fun m!257721 () Bool)

(assert (=> b!237465 m!257721))

(assert (=> d!59481 m!257607))

(declare-fun m!257723 () Bool)

(assert (=> b!237460 m!257723))

(declare-fun m!257725 () Bool)

(assert (=> b!237460 m!257725))

(declare-fun m!257727 () Bool)

(assert (=> b!237460 m!257727))

(assert (=> b!237460 m!257725))

(assert (=> b!237460 m!257719))

(declare-fun m!257729 () Bool)

(assert (=> b!237460 m!257729))

(assert (=> b!237460 m!257719))

(assert (=> b!237460 m!257723))

(assert (=> b!237456 m!257719))

(assert (=> b!237456 m!257719))

(declare-fun m!257731 () Bool)

(assert (=> b!237456 m!257731))

(declare-fun m!257733 () Bool)

(assert (=> b!237457 m!257733))

(assert (=> bm!22064 m!257713))

(declare-fun m!257735 () Bool)

(assert (=> b!237448 m!257735))

(declare-fun m!257737 () Bool)

(assert (=> b!237466 m!257737))

(assert (=> b!237454 m!257719))

(assert (=> b!237454 m!257719))

(assert (=> b!237454 m!257731))

(assert (=> b!237452 m!257719))

(assert (=> b!237452 m!257719))

(declare-fun m!257739 () Bool)

(assert (=> b!237452 m!257739))

(assert (=> b!237308 d!59481))

(declare-fun d!59483 () Bool)

(assert (=> d!59483 (= (array_inv!3681 (_keys!6498 thiss!1504)) (bvsge (size!5919 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237309 d!59483))

(declare-fun d!59485 () Bool)

(assert (=> d!59485 (= (array_inv!3682 (_values!4390 thiss!1504)) (bvsge (size!5918 (_values!4390 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237309 d!59485))

(declare-fun mapNonEmpty!10589 () Bool)

(declare-fun mapRes!10589 () Bool)

(declare-fun tp!22343 () Bool)

(declare-fun e!154204 () Bool)

(assert (=> mapNonEmpty!10589 (= mapRes!10589 (and tp!22343 e!154204))))

(declare-fun mapKey!10589 () (_ BitVec 32))

(declare-fun mapValue!10589 () ValueCell!2777)

(declare-fun mapRest!10589 () (Array (_ BitVec 32) ValueCell!2777))

(assert (=> mapNonEmpty!10589 (= mapRest!10580 (store mapRest!10589 mapKey!10589 mapValue!10589))))

(declare-fun b!237476 () Bool)

(declare-fun e!154205 () Bool)

(assert (=> b!237476 (= e!154205 tp_is_empty!6241)))

(declare-fun b!237475 () Bool)

(assert (=> b!237475 (= e!154204 tp_is_empty!6241)))

(declare-fun mapIsEmpty!10589 () Bool)

(assert (=> mapIsEmpty!10589 mapRes!10589))

(declare-fun condMapEmpty!10589 () Bool)

(declare-fun mapDefault!10589 () ValueCell!2777)

(assert (=> mapNonEmpty!10580 (= condMapEmpty!10589 (= mapRest!10580 ((as const (Array (_ BitVec 32) ValueCell!2777)) mapDefault!10589)))))

(assert (=> mapNonEmpty!10580 (= tp!22327 (and e!154205 mapRes!10589))))

(assert (= (and mapNonEmpty!10580 condMapEmpty!10589) mapIsEmpty!10589))

(assert (= (and mapNonEmpty!10580 (not condMapEmpty!10589)) mapNonEmpty!10589))

(assert (= (and mapNonEmpty!10589 ((_ is ValueCellFull!2777) mapValue!10589)) b!237475))

(assert (= (and mapNonEmpty!10580 ((_ is ValueCellFull!2777) mapDefault!10589)) b!237476))

(declare-fun m!257741 () Bool)

(assert (=> mapNonEmpty!10589 m!257741))

(declare-fun b_lambda!7939 () Bool)

(assert (= b_lambda!7937 (or (and b!237309 b_free!6379) b_lambda!7939)))

(check-sat (not b!237401) (not b!237375) (not mapNonEmpty!10589) (not bm!22061) (not b!237457) (not b!237452) (not b!237466) (not b!237454) (not b!237394) (not bm!22059) (not b!237460) (not bm!22064) (not b!237374) (not b!237448) (not b!237465) (not b!237376) (not b!237403) (not d!59479) (not bm!22060) (not b!237456) b_and!13313 (not b_lambda!7939) (not d!59473) tp_is_empty!6241 (not d!59475) (not d!59481) (not b_next!6379))
(check-sat b_and!13313 (not b_next!6379))
(get-model)

(declare-fun b!237486 () Bool)

(declare-fun res!116365 () Bool)

(declare-fun e!154208 () Bool)

(assert (=> b!237486 (=> (not res!116365) (not e!154208))))

(declare-fun size!5924 (LongMapFixedSize!3454) (_ BitVec 32))

(assert (=> b!237486 (= res!116365 (bvsge (size!5924 thiss!1504) (_size!1776 thiss!1504)))))

(declare-fun d!59487 () Bool)

(declare-fun res!116363 () Bool)

(assert (=> d!59487 (=> (not res!116363) (not e!154208))))

(assert (=> d!59487 (= res!116363 (validMask!0 (mask!10419 thiss!1504)))))

(assert (=> d!59487 (= (simpleValid!240 thiss!1504) e!154208)))

(declare-fun b!237487 () Bool)

(declare-fun res!116362 () Bool)

(assert (=> b!237487 (=> (not res!116362) (not e!154208))))

(assert (=> b!237487 (= res!116362 (= (size!5924 thiss!1504) (bvadd (_size!1776 thiss!1504) (bvsdiv (bvadd (extraKeys!4144 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!237488 () Bool)

(assert (=> b!237488 (= e!154208 (and (bvsge (extraKeys!4144 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4144 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1776 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!237485 () Bool)

(declare-fun res!116364 () Bool)

(assert (=> b!237485 (=> (not res!116364) (not e!154208))))

(assert (=> b!237485 (= res!116364 (and (= (size!5918 (_values!4390 thiss!1504)) (bvadd (mask!10419 thiss!1504) #b00000000000000000000000000000001)) (= (size!5919 (_keys!6498 thiss!1504)) (size!5918 (_values!4390 thiss!1504))) (bvsge (_size!1776 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1776 thiss!1504) (bvadd (mask!10419 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!59487 res!116363) b!237485))

(assert (= (and b!237485 res!116364) b!237486))

(assert (= (and b!237486 res!116365) b!237487))

(assert (= (and b!237487 res!116362) b!237488))

(declare-fun m!257743 () Bool)

(assert (=> b!237486 m!257743))

(assert (=> d!59487 m!257607))

(assert (=> b!237487 m!257743))

(assert (=> d!59473 d!59487))

(declare-fun b!237497 () Bool)

(declare-fun e!154213 () (_ BitVec 32))

(assert (=> b!237497 (= e!154213 #b00000000000000000000000000000000)))

(declare-fun b!237498 () Bool)

(declare-fun e!154214 () (_ BitVec 32))

(declare-fun call!22071 () (_ BitVec 32))

(assert (=> b!237498 (= e!154214 call!22071)))

(declare-fun b!237499 () Bool)

(assert (=> b!237499 (= e!154214 (bvadd #b00000000000000000000000000000001 call!22071))))

(declare-fun d!59489 () Bool)

(declare-fun lt!120000 () (_ BitVec 32))

(assert (=> d!59489 (and (bvsge lt!120000 #b00000000000000000000000000000000) (bvsle lt!120000 (bvsub (size!5919 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59489 (= lt!120000 e!154213)))

(declare-fun c!39604 () Bool)

(assert (=> d!59489 (= c!39604 (bvsge #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))))))

(assert (=> d!59489 (and (bvsle #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5919 (_keys!6498 thiss!1504)) (size!5919 (_keys!6498 thiss!1504))))))

(assert (=> d!59489 (= (arrayCountValidKeys!0 (_keys!6498 thiss!1504) #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))) lt!120000)))

(declare-fun bm!22068 () Bool)

(assert (=> bm!22068 (= call!22071 (arrayCountValidKeys!0 (_keys!6498 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5919 (_keys!6498 thiss!1504))))))

(declare-fun b!237500 () Bool)

(assert (=> b!237500 (= e!154213 e!154214)))

(declare-fun c!39605 () Bool)

(assert (=> b!237500 (= c!39605 (validKeyInArray!0 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59489 c!39604) b!237497))

(assert (= (and d!59489 (not c!39604)) b!237500))

(assert (= (and b!237500 c!39605) b!237499))

(assert (= (and b!237500 (not c!39605)) b!237498))

(assert (= (or b!237499 b!237498) bm!22068))

(declare-fun m!257745 () Bool)

(assert (=> bm!22068 m!257745))

(assert (=> b!237500 m!257719))

(assert (=> b!237500 m!257719))

(assert (=> b!237500 m!257731))

(assert (=> b!237374 d!59489))

(declare-fun b!237513 () Bool)

(declare-fun e!154221 () SeekEntryResult!1006)

(assert (=> b!237513 (= e!154221 (Found!1006 (index!6196 lt!119919)))))

(declare-fun b!237514 () Bool)

(declare-fun e!154223 () SeekEntryResult!1006)

(assert (=> b!237514 (= e!154223 Undefined!1006)))

(declare-fun d!59491 () Bool)

(declare-fun lt!120006 () SeekEntryResult!1006)

(assert (=> d!59491 (and (or ((_ is Undefined!1006) lt!120006) (not ((_ is Found!1006) lt!120006)) (and (bvsge (index!6195 lt!120006) #b00000000000000000000000000000000) (bvslt (index!6195 lt!120006) (size!5919 (_keys!6498 thiss!1504))))) (or ((_ is Undefined!1006) lt!120006) ((_ is Found!1006) lt!120006) (not ((_ is MissingVacant!1006) lt!120006)) (not (= (index!6197 lt!120006) (index!6196 lt!119919))) (and (bvsge (index!6197 lt!120006) #b00000000000000000000000000000000) (bvslt (index!6197 lt!120006) (size!5919 (_keys!6498 thiss!1504))))) (or ((_ is Undefined!1006) lt!120006) (ite ((_ is Found!1006) lt!120006) (= (select (arr!5578 (_keys!6498 thiss!1504)) (index!6195 lt!120006)) key!932) (and ((_ is MissingVacant!1006) lt!120006) (= (index!6197 lt!120006) (index!6196 lt!119919)) (= (select (arr!5578 (_keys!6498 thiss!1504)) (index!6197 lt!120006)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59491 (= lt!120006 e!154223)))

(declare-fun c!39614 () Bool)

(assert (=> d!59491 (= c!39614 (bvsge (x!23957 lt!119919) #b01111111111111111111111111111110))))

(declare-fun lt!120005 () (_ BitVec 64))

(assert (=> d!59491 (= lt!120005 (select (arr!5578 (_keys!6498 thiss!1504)) (index!6196 lt!119919)))))

(assert (=> d!59491 (validMask!0 (mask!10419 thiss!1504))))

(assert (=> d!59491 (= (seekKeyOrZeroReturnVacant!0 (x!23957 lt!119919) (index!6196 lt!119919) (index!6196 lt!119919) key!932 (_keys!6498 thiss!1504) (mask!10419 thiss!1504)) lt!120006)))

(declare-fun b!237515 () Bool)

(assert (=> b!237515 (= e!154223 e!154221)))

(declare-fun c!39613 () Bool)

(assert (=> b!237515 (= c!39613 (= lt!120005 key!932))))

(declare-fun b!237516 () Bool)

(declare-fun e!154222 () SeekEntryResult!1006)

(assert (=> b!237516 (= e!154222 (MissingVacant!1006 (index!6196 lt!119919)))))

(declare-fun b!237517 () Bool)

(declare-fun c!39612 () Bool)

(assert (=> b!237517 (= c!39612 (= lt!120005 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237517 (= e!154221 e!154222)))

(declare-fun b!237518 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!237518 (= e!154222 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23957 lt!119919) #b00000000000000000000000000000001) (nextIndex!0 (index!6196 lt!119919) (x!23957 lt!119919) (mask!10419 thiss!1504)) (index!6196 lt!119919) key!932 (_keys!6498 thiss!1504) (mask!10419 thiss!1504)))))

(assert (= (and d!59491 c!39614) b!237514))

(assert (= (and d!59491 (not c!39614)) b!237515))

(assert (= (and b!237515 c!39613) b!237513))

(assert (= (and b!237515 (not c!39613)) b!237517))

(assert (= (and b!237517 c!39612) b!237516))

(assert (= (and b!237517 (not c!39612)) b!237518))

(declare-fun m!257747 () Bool)

(assert (=> d!59491 m!257747))

(declare-fun m!257749 () Bool)

(assert (=> d!59491 m!257749))

(assert (=> d!59491 m!257671))

(assert (=> d!59491 m!257607))

(declare-fun m!257751 () Bool)

(assert (=> b!237518 m!257751))

(assert (=> b!237518 m!257751))

(declare-fun m!257753 () Bool)

(assert (=> b!237518 m!257753))

(assert (=> b!237394 d!59491))

(declare-fun b!237527 () Bool)

(declare-fun e!154232 () Bool)

(declare-fun call!22074 () Bool)

(assert (=> b!237527 (= e!154232 call!22074)))

(declare-fun b!237528 () Bool)

(declare-fun e!154230 () Bool)

(assert (=> b!237528 (= e!154230 call!22074)))

(declare-fun b!237529 () Bool)

(declare-fun e!154231 () Bool)

(assert (=> b!237529 (= e!154231 e!154230)))

(declare-fun c!39617 () Bool)

(assert (=> b!237529 (= c!39617 (validKeyInArray!0 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59493 () Bool)

(declare-fun res!116370 () Bool)

(assert (=> d!59493 (=> res!116370 e!154231)))

(assert (=> d!59493 (= res!116370 (bvsge #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))))))

(assert (=> d!59493 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6498 thiss!1504) (mask!10419 thiss!1504)) e!154231)))

(declare-fun bm!22071 () Bool)

(assert (=> bm!22071 (= call!22074 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6498 thiss!1504) (mask!10419 thiss!1504)))))

(declare-fun b!237530 () Bool)

(assert (=> b!237530 (= e!154230 e!154232)))

(declare-fun lt!120014 () (_ BitVec 64))

(assert (=> b!237530 (= lt!120014 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120015 () Unit!7292)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11747 (_ BitVec 64) (_ BitVec 32)) Unit!7292)

(assert (=> b!237530 (= lt!120015 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6498 thiss!1504) lt!120014 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!237530 (arrayContainsKey!0 (_keys!6498 thiss!1504) lt!120014 #b00000000000000000000000000000000)))

(declare-fun lt!120013 () Unit!7292)

(assert (=> b!237530 (= lt!120013 lt!120015)))

(declare-fun res!116371 () Bool)

(assert (=> b!237530 (= res!116371 (= (seekEntryOrOpen!0 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000) (_keys!6498 thiss!1504) (mask!10419 thiss!1504)) (Found!1006 #b00000000000000000000000000000000)))))

(assert (=> b!237530 (=> (not res!116371) (not e!154232))))

(assert (= (and d!59493 (not res!116370)) b!237529))

(assert (= (and b!237529 c!39617) b!237530))

(assert (= (and b!237529 (not c!39617)) b!237528))

(assert (= (and b!237530 res!116371) b!237527))

(assert (= (or b!237527 b!237528) bm!22071))

(assert (=> b!237529 m!257719))

(assert (=> b!237529 m!257719))

(assert (=> b!237529 m!257731))

(declare-fun m!257755 () Bool)

(assert (=> bm!22071 m!257755))

(assert (=> b!237530 m!257719))

(declare-fun m!257757 () Bool)

(assert (=> b!237530 m!257757))

(declare-fun m!257759 () Bool)

(assert (=> b!237530 m!257759))

(assert (=> b!237530 m!257719))

(declare-fun m!257761 () Bool)

(assert (=> b!237530 m!257761))

(assert (=> b!237375 d!59493))

(declare-fun d!59495 () Bool)

(declare-fun e!154233 () Bool)

(assert (=> d!59495 e!154233))

(declare-fun res!116372 () Bool)

(assert (=> d!59495 (=> res!116372 e!154233)))

(declare-fun lt!120017 () Bool)

(assert (=> d!59495 (= res!116372 (not lt!120017))))

(declare-fun lt!120016 () Bool)

(assert (=> d!59495 (= lt!120017 lt!120016)))

(declare-fun lt!120019 () Unit!7292)

(declare-fun e!154234 () Unit!7292)

(assert (=> d!59495 (= lt!120019 e!154234)))

(declare-fun c!39618 () Bool)

(assert (=> d!59495 (= c!39618 lt!120016)))

(assert (=> d!59495 (= lt!120016 (containsKey!265 (toList!1789 lt!119979) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59495 (= (contains!1676 lt!119979 #b1000000000000000000000000000000000000000000000000000000000000000) lt!120017)))

(declare-fun b!237531 () Bool)

(declare-fun lt!120018 () Unit!7292)

(assert (=> b!237531 (= e!154234 lt!120018)))

(assert (=> b!237531 (= lt!120018 (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1789 lt!119979) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237531 (isDefined!215 (getValueByKey!273 (toList!1789 lt!119979) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237532 () Bool)

(declare-fun Unit!7296 () Unit!7292)

(assert (=> b!237532 (= e!154234 Unit!7296)))

(declare-fun b!237533 () Bool)

(assert (=> b!237533 (= e!154233 (isDefined!215 (getValueByKey!273 (toList!1789 lt!119979) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59495 c!39618) b!237531))

(assert (= (and d!59495 (not c!39618)) b!237532))

(assert (= (and d!59495 (not res!116372)) b!237533))

(declare-fun m!257763 () Bool)

(assert (=> d!59495 m!257763))

(declare-fun m!257765 () Bool)

(assert (=> b!237531 m!257765))

(declare-fun m!257767 () Bool)

(assert (=> b!237531 m!257767))

(assert (=> b!237531 m!257767))

(declare-fun m!257769 () Bool)

(assert (=> b!237531 m!257769))

(assert (=> b!237533 m!257767))

(assert (=> b!237533 m!257767))

(assert (=> b!237533 m!257769))

(assert (=> bm!22060 d!59495))

(declare-fun d!59497 () Bool)

(declare-fun res!116377 () Bool)

(declare-fun e!154239 () Bool)

(assert (=> d!59497 (=> res!116377 e!154239)))

(assert (=> d!59497 (= res!116377 (and ((_ is Cons!3555) (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))) (= (_1!2333 (h!4210 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))))) key!932)))))

(assert (=> d!59497 (= (containsKey!265 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932) e!154239)))

(declare-fun b!237538 () Bool)

(declare-fun e!154240 () Bool)

(assert (=> b!237538 (= e!154239 e!154240)))

(declare-fun res!116378 () Bool)

(assert (=> b!237538 (=> (not res!116378) (not e!154240))))

(assert (=> b!237538 (= res!116378 (and (or (not ((_ is Cons!3555) (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))))) (bvsle (_1!2333 (h!4210 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))))) key!932)) ((_ is Cons!3555) (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))) (bvslt (_1!2333 (h!4210 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))))) key!932)))))

(declare-fun b!237539 () Bool)

(assert (=> b!237539 (= e!154240 (containsKey!265 (t!8537 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))) key!932))))

(assert (= (and d!59497 (not res!116377)) b!237538))

(assert (= (and b!237538 res!116378) b!237539))

(declare-fun m!257771 () Bool)

(assert (=> b!237539 m!257771))

(assert (=> d!59479 d!59497))

(declare-fun d!59499 () Bool)

(declare-fun get!2872 (Option!279) V!7969)

(assert (=> d!59499 (= (apply!217 lt!119979 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2872 (getValueByKey!273 (toList!1789 lt!119979) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8747 () Bool)

(assert (= bs!8747 d!59499))

(declare-fun m!257773 () Bool)

(assert (=> bs!8747 m!257773))

(assert (=> bs!8747 m!257773))

(declare-fun m!257775 () Bool)

(assert (=> bs!8747 m!257775))

(assert (=> b!237448 d!59499))

(declare-fun b!237558 () Bool)

(declare-fun e!154251 () SeekEntryResult!1006)

(assert (=> b!237558 (= e!154251 (Intermediate!1006 true (toIndex!0 key!932 (mask!10419 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!237559 () Bool)

(declare-fun e!154253 () SeekEntryResult!1006)

(assert (=> b!237559 (= e!154251 e!154253)))

(declare-fun c!39626 () Bool)

(declare-fun lt!120025 () (_ BitVec 64))

(assert (=> b!237559 (= c!39626 (or (= lt!120025 key!932) (= (bvadd lt!120025 lt!120025) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237560 () Bool)

(declare-fun lt!120024 () SeekEntryResult!1006)

(assert (=> b!237560 (and (bvsge (index!6196 lt!120024) #b00000000000000000000000000000000) (bvslt (index!6196 lt!120024) (size!5919 (_keys!6498 thiss!1504))))))

(declare-fun e!154252 () Bool)

(assert (=> b!237560 (= e!154252 (= (select (arr!5578 (_keys!6498 thiss!1504)) (index!6196 lt!120024)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237562 () Bool)

(assert (=> b!237562 (and (bvsge (index!6196 lt!120024) #b00000000000000000000000000000000) (bvslt (index!6196 lt!120024) (size!5919 (_keys!6498 thiss!1504))))))

(declare-fun res!116385 () Bool)

(assert (=> b!237562 (= res!116385 (= (select (arr!5578 (_keys!6498 thiss!1504)) (index!6196 lt!120024)) key!932))))

(assert (=> b!237562 (=> res!116385 e!154252)))

(declare-fun e!154254 () Bool)

(assert (=> b!237562 (= e!154254 e!154252)))

(declare-fun b!237563 () Bool)

(declare-fun e!154255 () Bool)

(assert (=> b!237563 (= e!154255 (bvsge (x!23957 lt!120024) #b01111111111111111111111111111110))))

(declare-fun b!237564 () Bool)

(assert (=> b!237564 (= e!154255 e!154254)))

(declare-fun res!116386 () Bool)

(assert (=> b!237564 (= res!116386 (and ((_ is Intermediate!1006) lt!120024) (not (undefined!1818 lt!120024)) (bvslt (x!23957 lt!120024) #b01111111111111111111111111111110) (bvsge (x!23957 lt!120024) #b00000000000000000000000000000000) (bvsge (x!23957 lt!120024) #b00000000000000000000000000000000)))))

(assert (=> b!237564 (=> (not res!116386) (not e!154254))))

(declare-fun d!59501 () Bool)

(assert (=> d!59501 e!154255))

(declare-fun c!39625 () Bool)

(assert (=> d!59501 (= c!39625 (and ((_ is Intermediate!1006) lt!120024) (undefined!1818 lt!120024)))))

(assert (=> d!59501 (= lt!120024 e!154251)))

(declare-fun c!39627 () Bool)

(assert (=> d!59501 (= c!39627 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!59501 (= lt!120025 (select (arr!5578 (_keys!6498 thiss!1504)) (toIndex!0 key!932 (mask!10419 thiss!1504))))))

(assert (=> d!59501 (validMask!0 (mask!10419 thiss!1504))))

(assert (=> d!59501 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10419 thiss!1504)) key!932 (_keys!6498 thiss!1504) (mask!10419 thiss!1504)) lt!120024)))

(declare-fun b!237561 () Bool)

(assert (=> b!237561 (= e!154253 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10419 thiss!1504)) #b00000000000000000000000000000000 (mask!10419 thiss!1504)) key!932 (_keys!6498 thiss!1504) (mask!10419 thiss!1504)))))

(declare-fun b!237565 () Bool)

(assert (=> b!237565 (and (bvsge (index!6196 lt!120024) #b00000000000000000000000000000000) (bvslt (index!6196 lt!120024) (size!5919 (_keys!6498 thiss!1504))))))

(declare-fun res!116387 () Bool)

(assert (=> b!237565 (= res!116387 (= (select (arr!5578 (_keys!6498 thiss!1504)) (index!6196 lt!120024)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237565 (=> res!116387 e!154252)))

(declare-fun b!237566 () Bool)

(assert (=> b!237566 (= e!154253 (Intermediate!1006 false (toIndex!0 key!932 (mask!10419 thiss!1504)) #b00000000000000000000000000000000))))

(assert (= (and d!59501 c!39627) b!237558))

(assert (= (and d!59501 (not c!39627)) b!237559))

(assert (= (and b!237559 c!39626) b!237566))

(assert (= (and b!237559 (not c!39626)) b!237561))

(assert (= (and d!59501 c!39625) b!237563))

(assert (= (and d!59501 (not c!39625)) b!237564))

(assert (= (and b!237564 res!116386) b!237562))

(assert (= (and b!237562 (not res!116385)) b!237565))

(assert (= (and b!237565 (not res!116387)) b!237560))

(assert (=> d!59501 m!257661))

(declare-fun m!257777 () Bool)

(assert (=> d!59501 m!257777))

(assert (=> d!59501 m!257607))

(declare-fun m!257779 () Bool)

(assert (=> b!237562 m!257779))

(assert (=> b!237565 m!257779))

(assert (=> b!237561 m!257661))

(declare-fun m!257781 () Bool)

(assert (=> b!237561 m!257781))

(assert (=> b!237561 m!257781))

(declare-fun m!257783 () Bool)

(assert (=> b!237561 m!257783))

(assert (=> b!237560 m!257779))

(assert (=> d!59475 d!59501))

(declare-fun d!59503 () Bool)

(declare-fun lt!120031 () (_ BitVec 32))

(declare-fun lt!120030 () (_ BitVec 32))

(assert (=> d!59503 (= lt!120031 (bvmul (bvxor lt!120030 (bvlshr lt!120030 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59503 (= lt!120030 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59503 (and (bvsge (mask!10419 thiss!1504) #b00000000000000000000000000000000) (let ((res!116388 (let ((h!4214 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23976 (bvmul (bvxor h!4214 (bvlshr h!4214 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23976 (bvlshr x!23976 #b00000000000000000000000000001101)) (mask!10419 thiss!1504)))))) (and (bvslt res!116388 (bvadd (mask!10419 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!116388 #b00000000000000000000000000000000))))))

(assert (=> d!59503 (= (toIndex!0 key!932 (mask!10419 thiss!1504)) (bvand (bvxor lt!120031 (bvlshr lt!120031 #b00000000000000000000000000001101)) (mask!10419 thiss!1504)))))

(assert (=> d!59475 d!59503))

(assert (=> d!59475 d!59477))

(declare-fun d!59505 () Bool)

(declare-fun e!154256 () Bool)

(assert (=> d!59505 e!154256))

(declare-fun res!116389 () Bool)

(assert (=> d!59505 (=> res!116389 e!154256)))

(declare-fun lt!120033 () Bool)

(assert (=> d!59505 (= res!116389 (not lt!120033))))

(declare-fun lt!120032 () Bool)

(assert (=> d!59505 (= lt!120033 lt!120032)))

(declare-fun lt!120035 () Unit!7292)

(declare-fun e!154257 () Unit!7292)

(assert (=> d!59505 (= lt!120035 e!154257)))

(declare-fun c!39628 () Bool)

(assert (=> d!59505 (= c!39628 lt!120032)))

(assert (=> d!59505 (= lt!120032 (containsKey!265 (toList!1789 lt!119979) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59505 (= (contains!1676 lt!119979 #b0000000000000000000000000000000000000000000000000000000000000000) lt!120033)))

(declare-fun b!237567 () Bool)

(declare-fun lt!120034 () Unit!7292)

(assert (=> b!237567 (= e!154257 lt!120034)))

(assert (=> b!237567 (= lt!120034 (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1789 lt!119979) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237567 (isDefined!215 (getValueByKey!273 (toList!1789 lt!119979) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237568 () Bool)

(declare-fun Unit!7297 () Unit!7292)

(assert (=> b!237568 (= e!154257 Unit!7297)))

(declare-fun b!237569 () Bool)

(assert (=> b!237569 (= e!154256 (isDefined!215 (getValueByKey!273 (toList!1789 lt!119979) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59505 c!39628) b!237567))

(assert (= (and d!59505 (not c!39628)) b!237568))

(assert (= (and d!59505 (not res!116389)) b!237569))

(declare-fun m!257785 () Bool)

(assert (=> d!59505 m!257785))

(declare-fun m!257787 () Bool)

(assert (=> b!237567 m!257787))

(assert (=> b!237567 m!257773))

(assert (=> b!237567 m!257773))

(declare-fun m!257789 () Bool)

(assert (=> b!237567 m!257789))

(assert (=> b!237569 m!257773))

(assert (=> b!237569 m!257773))

(assert (=> b!237569 m!257789))

(assert (=> bm!22061 d!59505))

(declare-fun d!59507 () Bool)

(declare-fun e!154260 () Bool)

(assert (=> d!59507 e!154260))

(declare-fun res!116394 () Bool)

(assert (=> d!59507 (=> (not res!116394) (not e!154260))))

(declare-fun lt!120046 () ListLongMap!3547)

(assert (=> d!59507 (= res!116394 (contains!1676 lt!120046 (_1!2333 (ite (or c!39594 c!39596) (tuple2!4645 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))))))

(declare-fun lt!120045 () List!3559)

(assert (=> d!59507 (= lt!120046 (ListLongMap!3548 lt!120045))))

(declare-fun lt!120044 () Unit!7292)

(declare-fun lt!120047 () Unit!7292)

(assert (=> d!59507 (= lt!120044 lt!120047)))

(assert (=> d!59507 (= (getValueByKey!273 lt!120045 (_1!2333 (ite (or c!39594 c!39596) (tuple2!4645 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))) (Some!278 (_2!2333 (ite (or c!39594 c!39596) (tuple2!4645 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!155 (List!3559 (_ BitVec 64) V!7969) Unit!7292)

(assert (=> d!59507 (= lt!120047 (lemmaContainsTupThenGetReturnValue!155 lt!120045 (_1!2333 (ite (or c!39594 c!39596) (tuple2!4645 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))) (_2!2333 (ite (or c!39594 c!39596) (tuple2!4645 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))))))

(declare-fun insertStrictlySorted!158 (List!3559 (_ BitVec 64) V!7969) List!3559)

(assert (=> d!59507 (= lt!120045 (insertStrictlySorted!158 (toList!1789 (ite c!39594 call!22062 (ite c!39596 call!22066 call!22063))) (_1!2333 (ite (or c!39594 c!39596) (tuple2!4645 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))) (_2!2333 (ite (or c!39594 c!39596) (tuple2!4645 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))))))

(assert (=> d!59507 (= (+!650 (ite c!39594 call!22062 (ite c!39596 call!22066 call!22063)) (ite (or c!39594 c!39596) (tuple2!4645 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))) lt!120046)))

(declare-fun b!237574 () Bool)

(declare-fun res!116395 () Bool)

(assert (=> b!237574 (=> (not res!116395) (not e!154260))))

(assert (=> b!237574 (= res!116395 (= (getValueByKey!273 (toList!1789 lt!120046) (_1!2333 (ite (or c!39594 c!39596) (tuple2!4645 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))) (Some!278 (_2!2333 (ite (or c!39594 c!39596) (tuple2!4645 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))))))))

(declare-fun b!237575 () Bool)

(declare-fun contains!1679 (List!3559 tuple2!4644) Bool)

(assert (=> b!237575 (= e!154260 (contains!1679 (toList!1789 lt!120046) (ite (or c!39594 c!39596) (tuple2!4645 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4248 thiss!1504)) (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))))))

(assert (= (and d!59507 res!116394) b!237574))

(assert (= (and b!237574 res!116395) b!237575))

(declare-fun m!257791 () Bool)

(assert (=> d!59507 m!257791))

(declare-fun m!257793 () Bool)

(assert (=> d!59507 m!257793))

(declare-fun m!257795 () Bool)

(assert (=> d!59507 m!257795))

(declare-fun m!257797 () Bool)

(assert (=> d!59507 m!257797))

(declare-fun m!257799 () Bool)

(assert (=> b!237574 m!257799))

(declare-fun m!257801 () Bool)

(assert (=> b!237575 m!257801))

(assert (=> bm!22059 d!59507))

(declare-fun d!59509 () Bool)

(assert (=> d!59509 (= (validKeyInArray!0 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237454 d!59509))

(declare-fun b!237600 () Bool)

(declare-fun e!154280 () ListLongMap!3547)

(declare-fun e!154277 () ListLongMap!3547)

(assert (=> b!237600 (= e!154280 e!154277)))

(declare-fun c!39638 () Bool)

(assert (=> b!237600 (= c!39638 (validKeyInArray!0 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237601 () Bool)

(declare-fun e!154276 () Bool)

(declare-fun e!154279 () Bool)

(assert (=> b!237601 (= e!154276 e!154279)))

(declare-fun c!39639 () Bool)

(assert (=> b!237601 (= c!39639 (bvslt #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))))))

(declare-fun b!237602 () Bool)

(assert (=> b!237602 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))))))

(assert (=> b!237602 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5918 (_values!4390 thiss!1504))))))

(declare-fun e!154275 () Bool)

(declare-fun lt!120065 () ListLongMap!3547)

(assert (=> b!237602 (= e!154275 (= (apply!217 lt!120065 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)) (get!2871 (select (arr!5577 (_values!4390 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4407 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237603 () Bool)

(declare-fun res!116404 () Bool)

(declare-fun e!154281 () Bool)

(assert (=> b!237603 (=> (not res!116404) (not e!154281))))

(assert (=> b!237603 (= res!116404 (not (contains!1676 lt!120065 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!59511 () Bool)

(assert (=> d!59511 e!154281))

(declare-fun res!116407 () Bool)

(assert (=> d!59511 (=> (not res!116407) (not e!154281))))

(assert (=> d!59511 (= res!116407 (not (contains!1676 lt!120065 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59511 (= lt!120065 e!154280)))

(declare-fun c!39637 () Bool)

(assert (=> d!59511 (= c!39637 (bvsge #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))))))

(assert (=> d!59511 (validMask!0 (mask!10419 thiss!1504))))

(assert (=> d!59511 (= (getCurrentListMapNoExtraKeys!533 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)) lt!120065)))

(declare-fun b!237604 () Bool)

(assert (=> b!237604 (= e!154276 e!154275)))

(assert (=> b!237604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))))))

(declare-fun res!116405 () Bool)

(assert (=> b!237604 (= res!116405 (contains!1676 lt!120065 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237604 (=> (not res!116405) (not e!154275))))

(declare-fun b!237605 () Bool)

(declare-fun isEmpty!522 (ListLongMap!3547) Bool)

(assert (=> b!237605 (= e!154279 (isEmpty!522 lt!120065))))

(declare-fun b!237606 () Bool)

(declare-fun call!22077 () ListLongMap!3547)

(assert (=> b!237606 (= e!154277 call!22077)))

(declare-fun b!237607 () Bool)

(assert (=> b!237607 (= e!154281 e!154276)))

(declare-fun c!39640 () Bool)

(declare-fun e!154278 () Bool)

(assert (=> b!237607 (= c!39640 e!154278)))

(declare-fun res!116406 () Bool)

(assert (=> b!237607 (=> (not res!116406) (not e!154278))))

(assert (=> b!237607 (= res!116406 (bvslt #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))))))

(declare-fun b!237608 () Bool)

(assert (=> b!237608 (= e!154279 (= lt!120065 (getCurrentListMapNoExtraKeys!533 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4407 thiss!1504))))))

(declare-fun bm!22074 () Bool)

(assert (=> bm!22074 (= call!22077 (getCurrentListMapNoExtraKeys!533 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4407 thiss!1504)))))

(declare-fun b!237609 () Bool)

(assert (=> b!237609 (= e!154280 (ListLongMap!3548 Nil!3556))))

(declare-fun b!237610 () Bool)

(declare-fun lt!120063 () Unit!7292)

(declare-fun lt!120068 () Unit!7292)

(assert (=> b!237610 (= lt!120063 lt!120068)))

(declare-fun lt!120067 () ListLongMap!3547)

(declare-fun lt!120062 () V!7969)

(declare-fun lt!120066 () (_ BitVec 64))

(declare-fun lt!120064 () (_ BitVec 64))

(assert (=> b!237610 (not (contains!1676 (+!650 lt!120067 (tuple2!4645 lt!120066 lt!120062)) lt!120064))))

(declare-fun addStillNotContains!119 (ListLongMap!3547 (_ BitVec 64) V!7969 (_ BitVec 64)) Unit!7292)

(assert (=> b!237610 (= lt!120068 (addStillNotContains!119 lt!120067 lt!120066 lt!120062 lt!120064))))

(assert (=> b!237610 (= lt!120064 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!237610 (= lt!120062 (get!2871 (select (arr!5577 (_values!4390 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4407 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!237610 (= lt!120066 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237610 (= lt!120067 call!22077)))

(assert (=> b!237610 (= e!154277 (+!650 call!22077 (tuple2!4645 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000) (get!2871 (select (arr!5577 (_values!4390 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4407 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!237611 () Bool)

(assert (=> b!237611 (= e!154278 (validKeyInArray!0 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237611 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!59511 c!39637) b!237609))

(assert (= (and d!59511 (not c!39637)) b!237600))

(assert (= (and b!237600 c!39638) b!237610))

(assert (= (and b!237600 (not c!39638)) b!237606))

(assert (= (or b!237610 b!237606) bm!22074))

(assert (= (and d!59511 res!116407) b!237603))

(assert (= (and b!237603 res!116404) b!237607))

(assert (= (and b!237607 res!116406) b!237611))

(assert (= (and b!237607 c!39640) b!237604))

(assert (= (and b!237607 (not c!39640)) b!237601))

(assert (= (and b!237604 res!116405) b!237602))

(assert (= (and b!237601 c!39639) b!237608))

(assert (= (and b!237601 (not c!39639)) b!237605))

(declare-fun b_lambda!7941 () Bool)

(assert (=> (not b_lambda!7941) (not b!237602)))

(assert (=> b!237602 t!8541))

(declare-fun b_and!13315 () Bool)

(assert (= b_and!13313 (and (=> t!8541 result!5155) b_and!13315)))

(declare-fun b_lambda!7943 () Bool)

(assert (=> (not b_lambda!7943) (not b!237610)))

(assert (=> b!237610 t!8541))

(declare-fun b_and!13317 () Bool)

(assert (= b_and!13315 (and (=> t!8541 result!5155) b_and!13317)))

(declare-fun m!257803 () Bool)

(assert (=> b!237603 m!257803))

(assert (=> b!237600 m!257719))

(assert (=> b!237600 m!257719))

(assert (=> b!237600 m!257731))

(assert (=> b!237602 m!257725))

(assert (=> b!237602 m!257719))

(declare-fun m!257805 () Bool)

(assert (=> b!237602 m!257805))

(assert (=> b!237602 m!257719))

(assert (=> b!237602 m!257723))

(assert (=> b!237602 m!257723))

(assert (=> b!237602 m!257725))

(assert (=> b!237602 m!257727))

(declare-fun m!257807 () Bool)

(assert (=> b!237608 m!257807))

(assert (=> bm!22074 m!257807))

(assert (=> b!237611 m!257719))

(assert (=> b!237611 m!257719))

(assert (=> b!237611 m!257731))

(declare-fun m!257809 () Bool)

(assert (=> d!59511 m!257809))

(assert (=> d!59511 m!257607))

(assert (=> b!237604 m!257719))

(assert (=> b!237604 m!257719))

(declare-fun m!257811 () Bool)

(assert (=> b!237604 m!257811))

(declare-fun m!257813 () Bool)

(assert (=> b!237605 m!257813))

(assert (=> b!237610 m!257725))

(declare-fun m!257815 () Bool)

(assert (=> b!237610 m!257815))

(declare-fun m!257817 () Bool)

(assert (=> b!237610 m!257817))

(declare-fun m!257819 () Bool)

(assert (=> b!237610 m!257819))

(assert (=> b!237610 m!257817))

(assert (=> b!237610 m!257723))

(assert (=> b!237610 m!257723))

(assert (=> b!237610 m!257725))

(assert (=> b!237610 m!257727))

(declare-fun m!257821 () Bool)

(assert (=> b!237610 m!257821))

(assert (=> b!237610 m!257719))

(assert (=> bm!22064 d!59511))

(assert (=> d!59481 d!59477))

(declare-fun d!59513 () Bool)

(declare-fun e!154282 () Bool)

(assert (=> d!59513 e!154282))

(declare-fun res!116408 () Bool)

(assert (=> d!59513 (=> res!116408 e!154282)))

(declare-fun lt!120070 () Bool)

(assert (=> d!59513 (= res!116408 (not lt!120070))))

(declare-fun lt!120069 () Bool)

(assert (=> d!59513 (= lt!120070 lt!120069)))

(declare-fun lt!120072 () Unit!7292)

(declare-fun e!154283 () Unit!7292)

(assert (=> d!59513 (= lt!120072 e!154283)))

(declare-fun c!39641 () Bool)

(assert (=> d!59513 (= c!39641 lt!120069)))

(assert (=> d!59513 (= lt!120069 (containsKey!265 (toList!1789 lt!119979) (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59513 (= (contains!1676 lt!119979 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)) lt!120070)))

(declare-fun b!237612 () Bool)

(declare-fun lt!120071 () Unit!7292)

(assert (=> b!237612 (= e!154283 lt!120071)))

(assert (=> b!237612 (= lt!120071 (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1789 lt!119979) (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237612 (isDefined!215 (getValueByKey!273 (toList!1789 lt!119979) (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237613 () Bool)

(declare-fun Unit!7298 () Unit!7292)

(assert (=> b!237613 (= e!154283 Unit!7298)))

(declare-fun b!237614 () Bool)

(assert (=> b!237614 (= e!154282 (isDefined!215 (getValueByKey!273 (toList!1789 lt!119979) (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59513 c!39641) b!237612))

(assert (= (and d!59513 (not c!39641)) b!237613))

(assert (= (and d!59513 (not res!116408)) b!237614))

(assert (=> d!59513 m!257719))

(declare-fun m!257823 () Bool)

(assert (=> d!59513 m!257823))

(assert (=> b!237612 m!257719))

(declare-fun m!257825 () Bool)

(assert (=> b!237612 m!257825))

(assert (=> b!237612 m!257719))

(declare-fun m!257827 () Bool)

(assert (=> b!237612 m!257827))

(assert (=> b!237612 m!257827))

(declare-fun m!257829 () Bool)

(assert (=> b!237612 m!257829))

(assert (=> b!237614 m!257719))

(assert (=> b!237614 m!257827))

(assert (=> b!237614 m!257827))

(assert (=> b!237614 m!257829))

(assert (=> b!237452 d!59513))

(declare-fun d!59515 () Bool)

(declare-fun isEmpty!523 (Option!279) Bool)

(assert (=> d!59515 (= (isDefined!215 (getValueByKey!273 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932)) (not (isEmpty!523 (getValueByKey!273 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932))))))

(declare-fun bs!8748 () Bool)

(assert (= bs!8748 d!59515))

(assert (=> bs!8748 m!257679))

(declare-fun m!257831 () Bool)

(assert (=> bs!8748 m!257831))

(assert (=> b!237403 d!59515))

(declare-fun b!237623 () Bool)

(declare-fun e!154288 () Option!279)

(assert (=> b!237623 (= e!154288 (Some!278 (_2!2333 (h!4210 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))))))))

(declare-fun b!237626 () Bool)

(declare-fun e!154289 () Option!279)

(assert (=> b!237626 (= e!154289 None!277)))

(declare-fun d!59517 () Bool)

(declare-fun c!39646 () Bool)

(assert (=> d!59517 (= c!39646 (and ((_ is Cons!3555) (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))) (= (_1!2333 (h!4210 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))))) key!932)))))

(assert (=> d!59517 (= (getValueByKey!273 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932) e!154288)))

(declare-fun b!237624 () Bool)

(assert (=> b!237624 (= e!154288 e!154289)))

(declare-fun c!39647 () Bool)

(assert (=> b!237624 (= c!39647 (and ((_ is Cons!3555) (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))) (not (= (_1!2333 (h!4210 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))))) key!932))))))

(declare-fun b!237625 () Bool)

(assert (=> b!237625 (= e!154289 (getValueByKey!273 (t!8537 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))) key!932))))

(assert (= (and d!59517 c!39646) b!237623))

(assert (= (and d!59517 (not c!39646)) b!237624))

(assert (= (and b!237624 c!39647) b!237625))

(assert (= (and b!237624 (not c!39647)) b!237626))

(declare-fun m!257833 () Bool)

(assert (=> b!237625 m!257833))

(assert (=> b!237403 d!59517))

(declare-fun d!59519 () Bool)

(assert (=> d!59519 (= (apply!217 lt!119979 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)) (get!2872 (getValueByKey!273 (toList!1789 lt!119979) (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8749 () Bool)

(assert (= bs!8749 d!59519))

(assert (=> bs!8749 m!257719))

(assert (=> bs!8749 m!257827))

(assert (=> bs!8749 m!257827))

(declare-fun m!257835 () Bool)

(assert (=> bs!8749 m!257835))

(assert (=> b!237460 d!59519))

(declare-fun d!59521 () Bool)

(declare-fun c!39650 () Bool)

(assert (=> d!59521 (= c!39650 ((_ is ValueCellFull!2777) (select (arr!5577 (_values!4390 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!154292 () V!7969)

(assert (=> d!59521 (= (get!2871 (select (arr!5577 (_values!4390 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4407 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!154292)))

(declare-fun b!237631 () Bool)

(declare-fun get!2873 (ValueCell!2777 V!7969) V!7969)

(assert (=> b!237631 (= e!154292 (get!2873 (select (arr!5577 (_values!4390 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4407 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237632 () Bool)

(declare-fun get!2874 (ValueCell!2777 V!7969) V!7969)

(assert (=> b!237632 (= e!154292 (get!2874 (select (arr!5577 (_values!4390 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4407 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59521 c!39650) b!237631))

(assert (= (and d!59521 (not c!39650)) b!237632))

(assert (=> b!237631 m!257723))

(assert (=> b!237631 m!257725))

(declare-fun m!257837 () Bool)

(assert (=> b!237631 m!257837))

(assert (=> b!237632 m!257723))

(assert (=> b!237632 m!257725))

(declare-fun m!257839 () Bool)

(assert (=> b!237632 m!257839))

(assert (=> b!237460 d!59521))

(declare-fun d!59523 () Bool)

(assert (=> d!59523 (= (apply!217 lt!119989 lt!119995) (get!2872 (getValueByKey!273 (toList!1789 lt!119989) lt!119995)))))

(declare-fun bs!8750 () Bool)

(assert (= bs!8750 d!59523))

(declare-fun m!257841 () Bool)

(assert (=> bs!8750 m!257841))

(assert (=> bs!8750 m!257841))

(declare-fun m!257843 () Bool)

(assert (=> bs!8750 m!257843))

(assert (=> b!237465 d!59523))

(declare-fun d!59525 () Bool)

(assert (=> d!59525 (= (apply!217 (+!650 lt!119989 (tuple2!4645 lt!119990 (minValue!4248 thiss!1504))) lt!119995) (apply!217 lt!119989 lt!119995))))

(declare-fun lt!120075 () Unit!7292)

(declare-fun choose!1120 (ListLongMap!3547 (_ BitVec 64) V!7969 (_ BitVec 64)) Unit!7292)

(assert (=> d!59525 (= lt!120075 (choose!1120 lt!119989 lt!119990 (minValue!4248 thiss!1504) lt!119995))))

(declare-fun e!154295 () Bool)

(assert (=> d!59525 e!154295))

(declare-fun res!116411 () Bool)

(assert (=> d!59525 (=> (not res!116411) (not e!154295))))

(assert (=> d!59525 (= res!116411 (contains!1676 lt!119989 lt!119995))))

(assert (=> d!59525 (= (addApplyDifferent!193 lt!119989 lt!119990 (minValue!4248 thiss!1504) lt!119995) lt!120075)))

(declare-fun b!237636 () Bool)

(assert (=> b!237636 (= e!154295 (not (= lt!119995 lt!119990)))))

(assert (= (and d!59525 res!116411) b!237636))

(assert (=> d!59525 m!257697))

(assert (=> d!59525 m!257705))

(assert (=> d!59525 m!257707))

(declare-fun m!257845 () Bool)

(assert (=> d!59525 m!257845))

(assert (=> d!59525 m!257705))

(declare-fun m!257847 () Bool)

(assert (=> d!59525 m!257847))

(assert (=> b!237465 d!59525))

(declare-fun d!59527 () Bool)

(assert (=> d!59527 (contains!1676 (+!650 lt!119993 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504))) lt!119985)))

(declare-fun lt!120078 () Unit!7292)

(declare-fun choose!1121 (ListLongMap!3547 (_ BitVec 64) V!7969 (_ BitVec 64)) Unit!7292)

(assert (=> d!59527 (= lt!120078 (choose!1121 lt!119993 lt!119986 (zeroValue!4248 thiss!1504) lt!119985))))

(assert (=> d!59527 (contains!1676 lt!119993 lt!119985)))

(assert (=> d!59527 (= (addStillContains!193 lt!119993 lt!119986 (zeroValue!4248 thiss!1504) lt!119985) lt!120078)))

(declare-fun bs!8751 () Bool)

(assert (= bs!8751 d!59527))

(assert (=> bs!8751 m!257699))

(assert (=> bs!8751 m!257699))

(assert (=> bs!8751 m!257701))

(declare-fun m!257849 () Bool)

(assert (=> bs!8751 m!257849))

(declare-fun m!257851 () Bool)

(assert (=> bs!8751 m!257851))

(assert (=> b!237465 d!59527))

(declare-fun d!59529 () Bool)

(declare-fun e!154296 () Bool)

(assert (=> d!59529 e!154296))

(declare-fun res!116412 () Bool)

(assert (=> d!59529 (=> res!116412 e!154296)))

(declare-fun lt!120080 () Bool)

(assert (=> d!59529 (= res!116412 (not lt!120080))))

(declare-fun lt!120079 () Bool)

(assert (=> d!59529 (= lt!120080 lt!120079)))

(declare-fun lt!120082 () Unit!7292)

(declare-fun e!154297 () Unit!7292)

(assert (=> d!59529 (= lt!120082 e!154297)))

(declare-fun c!39651 () Bool)

(assert (=> d!59529 (= c!39651 lt!120079)))

(assert (=> d!59529 (= lt!120079 (containsKey!265 (toList!1789 (+!650 lt!119993 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504)))) lt!119985))))

(assert (=> d!59529 (= (contains!1676 (+!650 lt!119993 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504))) lt!119985) lt!120080)))

(declare-fun b!237638 () Bool)

(declare-fun lt!120081 () Unit!7292)

(assert (=> b!237638 (= e!154297 lt!120081)))

(assert (=> b!237638 (= lt!120081 (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1789 (+!650 lt!119993 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504)))) lt!119985))))

(assert (=> b!237638 (isDefined!215 (getValueByKey!273 (toList!1789 (+!650 lt!119993 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504)))) lt!119985))))

(declare-fun b!237639 () Bool)

(declare-fun Unit!7299 () Unit!7292)

(assert (=> b!237639 (= e!154297 Unit!7299)))

(declare-fun b!237640 () Bool)

(assert (=> b!237640 (= e!154296 (isDefined!215 (getValueByKey!273 (toList!1789 (+!650 lt!119993 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504)))) lt!119985)))))

(assert (= (and d!59529 c!39651) b!237638))

(assert (= (and d!59529 (not c!39651)) b!237639))

(assert (= (and d!59529 (not res!116412)) b!237640))

(declare-fun m!257853 () Bool)

(assert (=> d!59529 m!257853))

(declare-fun m!257855 () Bool)

(assert (=> b!237638 m!257855))

(declare-fun m!257857 () Bool)

(assert (=> b!237638 m!257857))

(assert (=> b!237638 m!257857))

(declare-fun m!257859 () Bool)

(assert (=> b!237638 m!257859))

(assert (=> b!237640 m!257857))

(assert (=> b!237640 m!257857))

(assert (=> b!237640 m!257859))

(assert (=> b!237465 d!59529))

(declare-fun d!59531 () Bool)

(assert (=> d!59531 (= (apply!217 (+!650 lt!119991 (tuple2!4645 lt!119997 (zeroValue!4248 thiss!1504))) lt!119984) (get!2872 (getValueByKey!273 (toList!1789 (+!650 lt!119991 (tuple2!4645 lt!119997 (zeroValue!4248 thiss!1504)))) lt!119984)))))

(declare-fun bs!8752 () Bool)

(assert (= bs!8752 d!59531))

(declare-fun m!257861 () Bool)

(assert (=> bs!8752 m!257861))

(assert (=> bs!8752 m!257861))

(declare-fun m!257863 () Bool)

(assert (=> bs!8752 m!257863))

(assert (=> b!237465 d!59531))

(declare-fun d!59533 () Bool)

(assert (=> d!59533 (= (apply!217 (+!650 lt!119981 (tuple2!4645 lt!119976 (minValue!4248 thiss!1504))) lt!119980) (get!2872 (getValueByKey!273 (toList!1789 (+!650 lt!119981 (tuple2!4645 lt!119976 (minValue!4248 thiss!1504)))) lt!119980)))))

(declare-fun bs!8753 () Bool)

(assert (= bs!8753 d!59533))

(declare-fun m!257865 () Bool)

(assert (=> bs!8753 m!257865))

(assert (=> bs!8753 m!257865))

(declare-fun m!257867 () Bool)

(assert (=> bs!8753 m!257867))

(assert (=> b!237465 d!59533))

(declare-fun d!59535 () Bool)

(assert (=> d!59535 (= (apply!217 (+!650 lt!119991 (tuple2!4645 lt!119997 (zeroValue!4248 thiss!1504))) lt!119984) (apply!217 lt!119991 lt!119984))))

(declare-fun lt!120083 () Unit!7292)

(assert (=> d!59535 (= lt!120083 (choose!1120 lt!119991 lt!119997 (zeroValue!4248 thiss!1504) lt!119984))))

(declare-fun e!154298 () Bool)

(assert (=> d!59535 e!154298))

(declare-fun res!116413 () Bool)

(assert (=> d!59535 (=> (not res!116413) (not e!154298))))

(assert (=> d!59535 (= res!116413 (contains!1676 lt!119991 lt!119984))))

(assert (=> d!59535 (= (addApplyDifferent!193 lt!119991 lt!119997 (zeroValue!4248 thiss!1504) lt!119984) lt!120083)))

(declare-fun b!237641 () Bool)

(assert (=> b!237641 (= e!154298 (not (= lt!119984 lt!119997)))))

(assert (= (and d!59535 res!116413) b!237641))

(assert (=> d!59535 m!257695))

(assert (=> d!59535 m!257715))

(assert (=> d!59535 m!257717))

(declare-fun m!257869 () Bool)

(assert (=> d!59535 m!257869))

(assert (=> d!59535 m!257715))

(declare-fun m!257871 () Bool)

(assert (=> d!59535 m!257871))

(assert (=> b!237465 d!59535))

(declare-fun d!59537 () Bool)

(declare-fun e!154299 () Bool)

(assert (=> d!59537 e!154299))

(declare-fun res!116414 () Bool)

(assert (=> d!59537 (=> (not res!116414) (not e!154299))))

(declare-fun lt!120086 () ListLongMap!3547)

(assert (=> d!59537 (= res!116414 (contains!1676 lt!120086 (_1!2333 (tuple2!4645 lt!119990 (minValue!4248 thiss!1504)))))))

(declare-fun lt!120085 () List!3559)

(assert (=> d!59537 (= lt!120086 (ListLongMap!3548 lt!120085))))

(declare-fun lt!120084 () Unit!7292)

(declare-fun lt!120087 () Unit!7292)

(assert (=> d!59537 (= lt!120084 lt!120087)))

(assert (=> d!59537 (= (getValueByKey!273 lt!120085 (_1!2333 (tuple2!4645 lt!119990 (minValue!4248 thiss!1504)))) (Some!278 (_2!2333 (tuple2!4645 lt!119990 (minValue!4248 thiss!1504)))))))

(assert (=> d!59537 (= lt!120087 (lemmaContainsTupThenGetReturnValue!155 lt!120085 (_1!2333 (tuple2!4645 lt!119990 (minValue!4248 thiss!1504))) (_2!2333 (tuple2!4645 lt!119990 (minValue!4248 thiss!1504)))))))

(assert (=> d!59537 (= lt!120085 (insertStrictlySorted!158 (toList!1789 lt!119989) (_1!2333 (tuple2!4645 lt!119990 (minValue!4248 thiss!1504))) (_2!2333 (tuple2!4645 lt!119990 (minValue!4248 thiss!1504)))))))

(assert (=> d!59537 (= (+!650 lt!119989 (tuple2!4645 lt!119990 (minValue!4248 thiss!1504))) lt!120086)))

(declare-fun b!237642 () Bool)

(declare-fun res!116415 () Bool)

(assert (=> b!237642 (=> (not res!116415) (not e!154299))))

(assert (=> b!237642 (= res!116415 (= (getValueByKey!273 (toList!1789 lt!120086) (_1!2333 (tuple2!4645 lt!119990 (minValue!4248 thiss!1504)))) (Some!278 (_2!2333 (tuple2!4645 lt!119990 (minValue!4248 thiss!1504))))))))

(declare-fun b!237643 () Bool)

(assert (=> b!237643 (= e!154299 (contains!1679 (toList!1789 lt!120086) (tuple2!4645 lt!119990 (minValue!4248 thiss!1504))))))

(assert (= (and d!59537 res!116414) b!237642))

(assert (= (and b!237642 res!116415) b!237643))

(declare-fun m!257873 () Bool)

(assert (=> d!59537 m!257873))

(declare-fun m!257875 () Bool)

(assert (=> d!59537 m!257875))

(declare-fun m!257877 () Bool)

(assert (=> d!59537 m!257877))

(declare-fun m!257879 () Bool)

(assert (=> d!59537 m!257879))

(declare-fun m!257881 () Bool)

(assert (=> b!237642 m!257881))

(declare-fun m!257883 () Bool)

(assert (=> b!237643 m!257883))

(assert (=> b!237465 d!59537))

(declare-fun d!59539 () Bool)

(assert (=> d!59539 (= (apply!217 (+!650 lt!119981 (tuple2!4645 lt!119976 (minValue!4248 thiss!1504))) lt!119980) (apply!217 lt!119981 lt!119980))))

(declare-fun lt!120088 () Unit!7292)

(assert (=> d!59539 (= lt!120088 (choose!1120 lt!119981 lt!119976 (minValue!4248 thiss!1504) lt!119980))))

(declare-fun e!154300 () Bool)

(assert (=> d!59539 e!154300))

(declare-fun res!116416 () Bool)

(assert (=> d!59539 (=> (not res!116416) (not e!154300))))

(assert (=> d!59539 (= res!116416 (contains!1676 lt!119981 lt!119980))))

(assert (=> d!59539 (= (addApplyDifferent!193 lt!119981 lt!119976 (minValue!4248 thiss!1504) lt!119980) lt!120088)))

(declare-fun b!237644 () Bool)

(assert (=> b!237644 (= e!154300 (not (= lt!119980 lt!119976)))))

(assert (= (and d!59539 res!116416) b!237644))

(assert (=> d!59539 m!257689))

(assert (=> d!59539 m!257691))

(assert (=> d!59539 m!257693))

(declare-fun m!257885 () Bool)

(assert (=> d!59539 m!257885))

(assert (=> d!59539 m!257691))

(declare-fun m!257887 () Bool)

(assert (=> d!59539 m!257887))

(assert (=> b!237465 d!59539))

(declare-fun d!59541 () Bool)

(assert (=> d!59541 (= (apply!217 lt!119981 lt!119980) (get!2872 (getValueByKey!273 (toList!1789 lt!119981) lt!119980)))))

(declare-fun bs!8754 () Bool)

(assert (= bs!8754 d!59541))

(declare-fun m!257889 () Bool)

(assert (=> bs!8754 m!257889))

(assert (=> bs!8754 m!257889))

(declare-fun m!257891 () Bool)

(assert (=> bs!8754 m!257891))

(assert (=> b!237465 d!59541))

(declare-fun d!59543 () Bool)

(declare-fun e!154301 () Bool)

(assert (=> d!59543 e!154301))

(declare-fun res!116417 () Bool)

(assert (=> d!59543 (=> (not res!116417) (not e!154301))))

(declare-fun lt!120091 () ListLongMap!3547)

(assert (=> d!59543 (= res!116417 (contains!1676 lt!120091 (_1!2333 (tuple2!4645 lt!119976 (minValue!4248 thiss!1504)))))))

(declare-fun lt!120090 () List!3559)

(assert (=> d!59543 (= lt!120091 (ListLongMap!3548 lt!120090))))

(declare-fun lt!120089 () Unit!7292)

(declare-fun lt!120092 () Unit!7292)

(assert (=> d!59543 (= lt!120089 lt!120092)))

(assert (=> d!59543 (= (getValueByKey!273 lt!120090 (_1!2333 (tuple2!4645 lt!119976 (minValue!4248 thiss!1504)))) (Some!278 (_2!2333 (tuple2!4645 lt!119976 (minValue!4248 thiss!1504)))))))

(assert (=> d!59543 (= lt!120092 (lemmaContainsTupThenGetReturnValue!155 lt!120090 (_1!2333 (tuple2!4645 lt!119976 (minValue!4248 thiss!1504))) (_2!2333 (tuple2!4645 lt!119976 (minValue!4248 thiss!1504)))))))

(assert (=> d!59543 (= lt!120090 (insertStrictlySorted!158 (toList!1789 lt!119981) (_1!2333 (tuple2!4645 lt!119976 (minValue!4248 thiss!1504))) (_2!2333 (tuple2!4645 lt!119976 (minValue!4248 thiss!1504)))))))

(assert (=> d!59543 (= (+!650 lt!119981 (tuple2!4645 lt!119976 (minValue!4248 thiss!1504))) lt!120091)))

(declare-fun b!237645 () Bool)

(declare-fun res!116418 () Bool)

(assert (=> b!237645 (=> (not res!116418) (not e!154301))))

(assert (=> b!237645 (= res!116418 (= (getValueByKey!273 (toList!1789 lt!120091) (_1!2333 (tuple2!4645 lt!119976 (minValue!4248 thiss!1504)))) (Some!278 (_2!2333 (tuple2!4645 lt!119976 (minValue!4248 thiss!1504))))))))

(declare-fun b!237646 () Bool)

(assert (=> b!237646 (= e!154301 (contains!1679 (toList!1789 lt!120091) (tuple2!4645 lt!119976 (minValue!4248 thiss!1504))))))

(assert (= (and d!59543 res!116417) b!237645))

(assert (= (and b!237645 res!116418) b!237646))

(declare-fun m!257893 () Bool)

(assert (=> d!59543 m!257893))

(declare-fun m!257895 () Bool)

(assert (=> d!59543 m!257895))

(declare-fun m!257897 () Bool)

(assert (=> d!59543 m!257897))

(declare-fun m!257899 () Bool)

(assert (=> d!59543 m!257899))

(declare-fun m!257901 () Bool)

(assert (=> b!237645 m!257901))

(declare-fun m!257903 () Bool)

(assert (=> b!237646 m!257903))

(assert (=> b!237465 d!59543))

(declare-fun d!59545 () Bool)

(assert (=> d!59545 (= (apply!217 (+!650 lt!119989 (tuple2!4645 lt!119990 (minValue!4248 thiss!1504))) lt!119995) (get!2872 (getValueByKey!273 (toList!1789 (+!650 lt!119989 (tuple2!4645 lt!119990 (minValue!4248 thiss!1504)))) lt!119995)))))

(declare-fun bs!8755 () Bool)

(assert (= bs!8755 d!59545))

(declare-fun m!257905 () Bool)

(assert (=> bs!8755 m!257905))

(assert (=> bs!8755 m!257905))

(declare-fun m!257907 () Bool)

(assert (=> bs!8755 m!257907))

(assert (=> b!237465 d!59545))

(declare-fun d!59547 () Bool)

(declare-fun e!154302 () Bool)

(assert (=> d!59547 e!154302))

(declare-fun res!116419 () Bool)

(assert (=> d!59547 (=> (not res!116419) (not e!154302))))

(declare-fun lt!120095 () ListLongMap!3547)

(assert (=> d!59547 (= res!116419 (contains!1676 lt!120095 (_1!2333 (tuple2!4645 lt!119997 (zeroValue!4248 thiss!1504)))))))

(declare-fun lt!120094 () List!3559)

(assert (=> d!59547 (= lt!120095 (ListLongMap!3548 lt!120094))))

(declare-fun lt!120093 () Unit!7292)

(declare-fun lt!120096 () Unit!7292)

(assert (=> d!59547 (= lt!120093 lt!120096)))

(assert (=> d!59547 (= (getValueByKey!273 lt!120094 (_1!2333 (tuple2!4645 lt!119997 (zeroValue!4248 thiss!1504)))) (Some!278 (_2!2333 (tuple2!4645 lt!119997 (zeroValue!4248 thiss!1504)))))))

(assert (=> d!59547 (= lt!120096 (lemmaContainsTupThenGetReturnValue!155 lt!120094 (_1!2333 (tuple2!4645 lt!119997 (zeroValue!4248 thiss!1504))) (_2!2333 (tuple2!4645 lt!119997 (zeroValue!4248 thiss!1504)))))))

(assert (=> d!59547 (= lt!120094 (insertStrictlySorted!158 (toList!1789 lt!119991) (_1!2333 (tuple2!4645 lt!119997 (zeroValue!4248 thiss!1504))) (_2!2333 (tuple2!4645 lt!119997 (zeroValue!4248 thiss!1504)))))))

(assert (=> d!59547 (= (+!650 lt!119991 (tuple2!4645 lt!119997 (zeroValue!4248 thiss!1504))) lt!120095)))

(declare-fun b!237647 () Bool)

(declare-fun res!116420 () Bool)

(assert (=> b!237647 (=> (not res!116420) (not e!154302))))

(assert (=> b!237647 (= res!116420 (= (getValueByKey!273 (toList!1789 lt!120095) (_1!2333 (tuple2!4645 lt!119997 (zeroValue!4248 thiss!1504)))) (Some!278 (_2!2333 (tuple2!4645 lt!119997 (zeroValue!4248 thiss!1504))))))))

(declare-fun b!237648 () Bool)

(assert (=> b!237648 (= e!154302 (contains!1679 (toList!1789 lt!120095) (tuple2!4645 lt!119997 (zeroValue!4248 thiss!1504))))))

(assert (= (and d!59547 res!116419) b!237647))

(assert (= (and b!237647 res!116420) b!237648))

(declare-fun m!257909 () Bool)

(assert (=> d!59547 m!257909))

(declare-fun m!257911 () Bool)

(assert (=> d!59547 m!257911))

(declare-fun m!257913 () Bool)

(assert (=> d!59547 m!257913))

(declare-fun m!257915 () Bool)

(assert (=> d!59547 m!257915))

(declare-fun m!257917 () Bool)

(assert (=> b!237647 m!257917))

(declare-fun m!257919 () Bool)

(assert (=> b!237648 m!257919))

(assert (=> b!237465 d!59547))

(declare-fun d!59549 () Bool)

(assert (=> d!59549 (= (apply!217 lt!119991 lt!119984) (get!2872 (getValueByKey!273 (toList!1789 lt!119991) lt!119984)))))

(declare-fun bs!8756 () Bool)

(assert (= bs!8756 d!59549))

(declare-fun m!257921 () Bool)

(assert (=> bs!8756 m!257921))

(assert (=> bs!8756 m!257921))

(declare-fun m!257923 () Bool)

(assert (=> bs!8756 m!257923))

(assert (=> b!237465 d!59549))

(declare-fun d!59551 () Bool)

(declare-fun e!154303 () Bool)

(assert (=> d!59551 e!154303))

(declare-fun res!116421 () Bool)

(assert (=> d!59551 (=> (not res!116421) (not e!154303))))

(declare-fun lt!120099 () ListLongMap!3547)

(assert (=> d!59551 (= res!116421 (contains!1676 lt!120099 (_1!2333 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504)))))))

(declare-fun lt!120098 () List!3559)

(assert (=> d!59551 (= lt!120099 (ListLongMap!3548 lt!120098))))

(declare-fun lt!120097 () Unit!7292)

(declare-fun lt!120100 () Unit!7292)

(assert (=> d!59551 (= lt!120097 lt!120100)))

(assert (=> d!59551 (= (getValueByKey!273 lt!120098 (_1!2333 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504)))) (Some!278 (_2!2333 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504)))))))

(assert (=> d!59551 (= lt!120100 (lemmaContainsTupThenGetReturnValue!155 lt!120098 (_1!2333 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504))) (_2!2333 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504)))))))

(assert (=> d!59551 (= lt!120098 (insertStrictlySorted!158 (toList!1789 lt!119993) (_1!2333 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504))) (_2!2333 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504)))))))

(assert (=> d!59551 (= (+!650 lt!119993 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504))) lt!120099)))

(declare-fun b!237649 () Bool)

(declare-fun res!116422 () Bool)

(assert (=> b!237649 (=> (not res!116422) (not e!154303))))

(assert (=> b!237649 (= res!116422 (= (getValueByKey!273 (toList!1789 lt!120099) (_1!2333 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504)))) (Some!278 (_2!2333 (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504))))))))

(declare-fun b!237650 () Bool)

(assert (=> b!237650 (= e!154303 (contains!1679 (toList!1789 lt!120099) (tuple2!4645 lt!119986 (zeroValue!4248 thiss!1504))))))

(assert (= (and d!59551 res!116421) b!237649))

(assert (= (and b!237649 res!116422) b!237650))

(declare-fun m!257925 () Bool)

(assert (=> d!59551 m!257925))

(declare-fun m!257927 () Bool)

(assert (=> d!59551 m!257927))

(declare-fun m!257929 () Bool)

(assert (=> d!59551 m!257929))

(declare-fun m!257931 () Bool)

(assert (=> d!59551 m!257931))

(declare-fun m!257933 () Bool)

(assert (=> b!237649 m!257933))

(declare-fun m!257935 () Bool)

(assert (=> b!237650 m!257935))

(assert (=> b!237465 d!59551))

(assert (=> b!237465 d!59511))

(assert (=> b!237456 d!59509))

(declare-fun b!237661 () Bool)

(declare-fun e!154313 () Bool)

(declare-fun call!22080 () Bool)

(assert (=> b!237661 (= e!154313 call!22080)))

(declare-fun b!237662 () Bool)

(declare-fun e!154315 () Bool)

(assert (=> b!237662 (= e!154315 e!154313)))

(declare-fun c!39654 () Bool)

(assert (=> b!237662 (= c!39654 (validKeyInArray!0 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237663 () Bool)

(declare-fun e!154314 () Bool)

(assert (=> b!237663 (= e!154314 e!154315)))

(declare-fun res!116431 () Bool)

(assert (=> b!237663 (=> (not res!116431) (not e!154315))))

(declare-fun e!154312 () Bool)

(assert (=> b!237663 (= res!116431 (not e!154312))))

(declare-fun res!116429 () Bool)

(assert (=> b!237663 (=> (not res!116429) (not e!154312))))

(assert (=> b!237663 (= res!116429 (validKeyInArray!0 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237664 () Bool)

(declare-fun contains!1680 (List!3562 (_ BitVec 64)) Bool)

(assert (=> b!237664 (= e!154312 (contains!1680 Nil!3559 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59553 () Bool)

(declare-fun res!116430 () Bool)

(assert (=> d!59553 (=> res!116430 e!154314)))

(assert (=> d!59553 (= res!116430 (bvsge #b00000000000000000000000000000000 (size!5919 (_keys!6498 thiss!1504))))))

(assert (=> d!59553 (= (arrayNoDuplicates!0 (_keys!6498 thiss!1504) #b00000000000000000000000000000000 Nil!3559) e!154314)))

(declare-fun bm!22077 () Bool)

(assert (=> bm!22077 (= call!22080 (arrayNoDuplicates!0 (_keys!6498 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39654 (Cons!3558 (select (arr!5578 (_keys!6498 thiss!1504)) #b00000000000000000000000000000000) Nil!3559) Nil!3559)))))

(declare-fun b!237665 () Bool)

(assert (=> b!237665 (= e!154313 call!22080)))

(assert (= (and d!59553 (not res!116430)) b!237663))

(assert (= (and b!237663 res!116429) b!237664))

(assert (= (and b!237663 res!116431) b!237662))

(assert (= (and b!237662 c!39654) b!237661))

(assert (= (and b!237662 (not c!39654)) b!237665))

(assert (= (or b!237661 b!237665) bm!22077))

(assert (=> b!237662 m!257719))

(assert (=> b!237662 m!257719))

(assert (=> b!237662 m!257731))

(assert (=> b!237663 m!257719))

(assert (=> b!237663 m!257719))

(assert (=> b!237663 m!257731))

(assert (=> b!237664 m!257719))

(assert (=> b!237664 m!257719))

(declare-fun m!257937 () Bool)

(assert (=> b!237664 m!257937))

(assert (=> bm!22077 m!257719))

(declare-fun m!257939 () Bool)

(assert (=> bm!22077 m!257939))

(assert (=> b!237376 d!59553))

(declare-fun d!59555 () Bool)

(declare-fun e!154316 () Bool)

(assert (=> d!59555 e!154316))

(declare-fun res!116432 () Bool)

(assert (=> d!59555 (=> (not res!116432) (not e!154316))))

(declare-fun lt!120103 () ListLongMap!3547)

(assert (=> d!59555 (= res!116432 (contains!1676 lt!120103 (_1!2333 (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))))))

(declare-fun lt!120102 () List!3559)

(assert (=> d!59555 (= lt!120103 (ListLongMap!3548 lt!120102))))

(declare-fun lt!120101 () Unit!7292)

(declare-fun lt!120104 () Unit!7292)

(assert (=> d!59555 (= lt!120101 lt!120104)))

(assert (=> d!59555 (= (getValueByKey!273 lt!120102 (_1!2333 (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))) (Some!278 (_2!2333 (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))))))

(assert (=> d!59555 (= lt!120104 (lemmaContainsTupThenGetReturnValue!155 lt!120102 (_1!2333 (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))) (_2!2333 (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))))))

(assert (=> d!59555 (= lt!120102 (insertStrictlySorted!158 (toList!1789 call!22065) (_1!2333 (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))) (_2!2333 (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))))))

(assert (=> d!59555 (= (+!650 call!22065 (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))) lt!120103)))

(declare-fun b!237666 () Bool)

(declare-fun res!116433 () Bool)

(assert (=> b!237666 (=> (not res!116433) (not e!154316))))

(assert (=> b!237666 (= res!116433 (= (getValueByKey!273 (toList!1789 lt!120103) (_1!2333 (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504)))) (Some!278 (_2!2333 (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))))))

(declare-fun b!237667 () Bool)

(assert (=> b!237667 (= e!154316 (contains!1679 (toList!1789 lt!120103) (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4248 thiss!1504))))))

(assert (= (and d!59555 res!116432) b!237666))

(assert (= (and b!237666 res!116433) b!237667))

(declare-fun m!257941 () Bool)

(assert (=> d!59555 m!257941))

(declare-fun m!257943 () Bool)

(assert (=> d!59555 m!257943))

(declare-fun m!257945 () Bool)

(assert (=> d!59555 m!257945))

(declare-fun m!257947 () Bool)

(assert (=> d!59555 m!257947))

(declare-fun m!257949 () Bool)

(assert (=> b!237666 m!257949))

(declare-fun m!257951 () Bool)

(assert (=> b!237667 m!257951))

(assert (=> b!237457 d!59555))

(declare-fun d!59557 () Bool)

(assert (=> d!59557 (isDefined!215 (getValueByKey!273 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932))))

(declare-fun lt!120107 () Unit!7292)

(declare-fun choose!1122 (List!3559 (_ BitVec 64)) Unit!7292)

(assert (=> d!59557 (= lt!120107 (choose!1122 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932))))

(declare-fun e!154319 () Bool)

(assert (=> d!59557 e!154319))

(declare-fun res!116436 () Bool)

(assert (=> d!59557 (=> (not res!116436) (not e!154319))))

(declare-fun isStrictlySorted!361 (List!3559) Bool)

(assert (=> d!59557 (= res!116436 (isStrictlySorted!361 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)))))))

(assert (=> d!59557 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!214 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932) lt!120107)))

(declare-fun b!237670 () Bool)

(assert (=> b!237670 (= e!154319 (containsKey!265 (toList!1789 (getCurrentListMap!1298 (_keys!6498 thiss!1504) (_values!4390 thiss!1504) (mask!10419 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504))) key!932))))

(assert (= (and d!59557 res!116436) b!237670))

(assert (=> d!59557 m!257679))

(assert (=> d!59557 m!257679))

(assert (=> d!59557 m!257681))

(declare-fun m!257953 () Bool)

(assert (=> d!59557 m!257953))

(declare-fun m!257955 () Bool)

(assert (=> d!59557 m!257955))

(assert (=> b!237670 m!257675))

(assert (=> b!237401 d!59557))

(assert (=> b!237401 d!59515))

(assert (=> b!237401 d!59517))

(declare-fun d!59559 () Bool)

(assert (=> d!59559 (= (apply!217 lt!119979 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2872 (getValueByKey!273 (toList!1789 lt!119979) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8757 () Bool)

(assert (= bs!8757 d!59559))

(assert (=> bs!8757 m!257767))

(assert (=> bs!8757 m!257767))

(declare-fun m!257957 () Bool)

(assert (=> bs!8757 m!257957))

(assert (=> b!237466 d!59559))

(declare-fun mapNonEmpty!10590 () Bool)

(declare-fun mapRes!10590 () Bool)

(declare-fun tp!22344 () Bool)

(declare-fun e!154320 () Bool)

(assert (=> mapNonEmpty!10590 (= mapRes!10590 (and tp!22344 e!154320))))

(declare-fun mapRest!10590 () (Array (_ BitVec 32) ValueCell!2777))

(declare-fun mapKey!10590 () (_ BitVec 32))

(declare-fun mapValue!10590 () ValueCell!2777)

(assert (=> mapNonEmpty!10590 (= mapRest!10589 (store mapRest!10590 mapKey!10590 mapValue!10590))))

(declare-fun b!237672 () Bool)

(declare-fun e!154321 () Bool)

(assert (=> b!237672 (= e!154321 tp_is_empty!6241)))

(declare-fun b!237671 () Bool)

(assert (=> b!237671 (= e!154320 tp_is_empty!6241)))

(declare-fun mapIsEmpty!10590 () Bool)

(assert (=> mapIsEmpty!10590 mapRes!10590))

(declare-fun condMapEmpty!10590 () Bool)

(declare-fun mapDefault!10590 () ValueCell!2777)

(assert (=> mapNonEmpty!10589 (= condMapEmpty!10590 (= mapRest!10589 ((as const (Array (_ BitVec 32) ValueCell!2777)) mapDefault!10590)))))

(assert (=> mapNonEmpty!10589 (= tp!22343 (and e!154321 mapRes!10590))))

(assert (= (and mapNonEmpty!10589 condMapEmpty!10590) mapIsEmpty!10590))

(assert (= (and mapNonEmpty!10589 (not condMapEmpty!10590)) mapNonEmpty!10590))

(assert (= (and mapNonEmpty!10590 ((_ is ValueCellFull!2777) mapValue!10590)) b!237671))

(assert (= (and mapNonEmpty!10589 ((_ is ValueCellFull!2777) mapDefault!10590)) b!237672))

(declare-fun m!257959 () Bool)

(assert (=> mapNonEmpty!10590 m!257959))

(declare-fun b_lambda!7945 () Bool)

(assert (= b_lambda!7941 (or (and b!237309 b_free!6379) b_lambda!7945)))

(declare-fun b_lambda!7947 () Bool)

(assert (= b_lambda!7943 (or (and b!237309 b_free!6379) b_lambda!7947)))

(check-sat (not d!59537) (not b!237650) (not d!59505) (not b!237649) (not d!59541) (not d!59527) (not b!237567) (not d!59535) (not d!59495) (not b!237605) b_and!13317 (not d!59543) (not d!59523) (not b!237640) (not b!237662) (not b!237531) (not b!237569) (not b!237603) (not d!59555) (not b!237604) (not d!59501) (not d!59529) (not b!237642) (not b!237518) (not b!237643) (not b!237539) (not b_lambda!7947) (not b!237632) (not b!237500) (not d!59513) (not b!237667) (not b!237487) (not d!59491) (not b!237648) (not bm!22071) (not bm!22068) (not d!59559) (not d!59547) (not b!237602) (not b!237611) (not mapNonEmpty!10590) (not d!59487) (not d!59507) (not d!59557) (not b!237646) (not b!237663) (not d!59533) (not b!237533) (not b_lambda!7945) (not d!59551) (not b!237638) (not b!237530) (not b!237670) (not d!59511) (not b_lambda!7939) (not b!237625) (not b!237575) (not d!59531) (not b!237645) (not b!237664) (not b!237666) (not d!59499) (not b!237631) (not d!59549) (not d!59539) (not b!237529) (not d!59545) (not b!237574) (not b!237647) (not b!237614) (not d!59519) (not b!237486) tp_is_empty!6241 (not b!237612) (not bm!22077) (not b_next!6379) (not d!59525) (not bm!22074) (not b!237561) (not b!237600) (not d!59515) (not b!237608) (not b!237610))
(check-sat b_and!13317 (not b_next!6379))
