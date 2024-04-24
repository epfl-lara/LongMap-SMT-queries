; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22196 () Bool)

(assert start!22196)

(declare-fun b!232489 () Bool)

(declare-fun b_free!6259 () Bool)

(declare-fun b_next!6259 () Bool)

(assert (=> b!232489 (= b_free!6259 (not b_next!6259))))

(declare-fun tp!21919 () Bool)

(declare-fun b_and!13171 () Bool)

(assert (=> b!232489 (= tp!21919 b_and!13171)))

(declare-fun bm!21596 () Bool)

(declare-fun call!21599 () Bool)

(declare-datatypes ((V!7809 0))(
  ( (V!7810 (val!3105 Int)) )
))
(declare-datatypes ((ValueCell!2717 0))(
  ( (ValueCellFull!2717 (v!5126 V!7809)) (EmptyCell!2717) )
))
(declare-datatypes ((array!11483 0))(
  ( (array!11484 (arr!5461 (Array (_ BitVec 32) ValueCell!2717)) (size!5794 (_ BitVec 32))) )
))
(declare-datatypes ((array!11485 0))(
  ( (array!11486 (arr!5462 (Array (_ BitVec 32) (_ BitVec 64))) (size!5795 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3334 0))(
  ( (LongMapFixedSize!3335 (defaultEntry!4326 Int) (mask!10240 (_ BitVec 32)) (extraKeys!4063 (_ BitVec 32)) (zeroValue!4167 V!7809) (minValue!4167 V!7809) (_size!1716 (_ BitVec 32)) (_keys!6380 array!11485) (_values!4309 array!11483) (_vacant!1716 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3334)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21596 (= call!21599 (arrayContainsKey!0 (_keys!6380 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232487 () Bool)

(declare-datatypes ((Unit!7160 0))(
  ( (Unit!7161) )
))
(declare-fun e!150979 () Unit!7160)

(declare-fun lt!117439 () Unit!7160)

(assert (=> b!232487 (= e!150979 lt!117439)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!308 (array!11485 array!11483 (_ BitVec 32) (_ BitVec 32) V!7809 V!7809 (_ BitVec 64) Int) Unit!7160)

(assert (=> b!232487 (= lt!117439 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!308 (_keys!6380 thiss!1504) (_values!4309 thiss!1504) (mask!10240 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) key!932 (defaultEntry!4326 thiss!1504)))))

(declare-fun c!38662 () Bool)

(declare-datatypes ((SeekEntryResult!933 0))(
  ( (MissingZero!933 (index!5902 (_ BitVec 32))) (Found!933 (index!5903 (_ BitVec 32))) (Intermediate!933 (undefined!1745 Bool) (index!5904 (_ BitVec 32)) (x!23529 (_ BitVec 32))) (Undefined!933) (MissingVacant!933 (index!5905 (_ BitVec 32))) )
))
(declare-fun lt!117444 () SeekEntryResult!933)

(get-info :version)

(assert (=> b!232487 (= c!38662 ((_ is MissingZero!933) lt!117444))))

(declare-fun e!150978 () Bool)

(assert (=> b!232487 e!150978))

(declare-fun b!232488 () Bool)

(declare-fun e!150971 () Bool)

(declare-fun tp_is_empty!6121 () Bool)

(assert (=> b!232488 (= e!150971 tp_is_empty!6121)))

(declare-fun e!150967 () Bool)

(declare-fun e!150969 () Bool)

(declare-fun array_inv!3583 (array!11485) Bool)

(declare-fun array_inv!3584 (array!11483) Bool)

(assert (=> b!232489 (= e!150967 (and tp!21919 tp_is_empty!6121 (array_inv!3583 (_keys!6380 thiss!1504)) (array_inv!3584 (_values!4309 thiss!1504)) e!150969))))

(declare-fun b!232490 () Bool)

(declare-fun e!150968 () Bool)

(assert (=> b!232490 (= e!150968 ((_ is Undefined!933) lt!117444))))

(declare-fun b!232491 () Bool)

(declare-fun res!114163 () Bool)

(assert (=> b!232491 (= res!114163 (= (select (arr!5462 (_keys!6380 thiss!1504)) (index!5905 lt!117444)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!150977 () Bool)

(assert (=> b!232491 (=> (not res!114163) (not e!150977))))

(declare-fun mapNonEmpty!10351 () Bool)

(declare-fun mapRes!10351 () Bool)

(declare-fun tp!21918 () Bool)

(assert (=> mapNonEmpty!10351 (= mapRes!10351 (and tp!21918 e!150971))))

(declare-fun mapValue!10351 () ValueCell!2717)

(declare-fun mapKey!10351 () (_ BitVec 32))

(declare-fun mapRest!10351 () (Array (_ BitVec 32) ValueCell!2717))

(assert (=> mapNonEmpty!10351 (= (arr!5461 (_values!4309 thiss!1504)) (store mapRest!10351 mapKey!10351 mapValue!10351))))

(declare-fun bm!21597 () Bool)

(declare-fun call!21600 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21597 (= call!21600 (inRange!0 (ite c!38662 (index!5902 lt!117444) (index!5905 lt!117444)) (mask!10240 thiss!1504)))))

(declare-fun b!232492 () Bool)

(assert (=> b!232492 (= e!150977 (not call!21599))))

(declare-fun b!232493 () Bool)

(declare-fun c!38664 () Bool)

(assert (=> b!232493 (= c!38664 ((_ is MissingVacant!933) lt!117444))))

(assert (=> b!232493 (= e!150978 e!150968)))

(declare-fun b!232494 () Bool)

(declare-fun e!150976 () Bool)

(assert (=> b!232494 (= e!150976 (not call!21599))))

(declare-fun b!232495 () Bool)

(assert (=> b!232495 (= e!150968 e!150977)))

(declare-fun res!114160 () Bool)

(assert (=> b!232495 (= res!114160 call!21600)))

(assert (=> b!232495 (=> (not res!114160) (not e!150977))))

(declare-fun b!232496 () Bool)

(declare-fun res!114166 () Bool)

(declare-fun e!150974 () Bool)

(assert (=> b!232496 (=> (not res!114166) (not e!150974))))

(assert (=> b!232496 (= res!114166 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!232497 () Bool)

(declare-fun e!150975 () Bool)

(declare-fun e!150972 () Bool)

(assert (=> b!232497 (= e!150975 e!150972)))

(declare-fun res!114165 () Bool)

(assert (=> b!232497 (=> (not res!114165) (not e!150972))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!232497 (= res!114165 (inRange!0 index!297 (mask!10240 thiss!1504)))))

(declare-fun lt!117443 () Unit!7160)

(assert (=> b!232497 (= lt!117443 e!150979)))

(declare-fun c!38663 () Bool)

(declare-datatypes ((tuple2!4512 0))(
  ( (tuple2!4513 (_1!2267 (_ BitVec 64)) (_2!2267 V!7809)) )
))
(declare-datatypes ((List!3421 0))(
  ( (Nil!3418) (Cons!3417 (h!4065 tuple2!4512) (t!8372 List!3421)) )
))
(declare-datatypes ((ListLongMap!3427 0))(
  ( (ListLongMap!3428 (toList!1729 List!3421)) )
))
(declare-fun lt!117452 () ListLongMap!3427)

(declare-fun contains!1611 (ListLongMap!3427 (_ BitVec 64)) Bool)

(assert (=> b!232497 (= c!38663 (contains!1611 lt!117452 key!932))))

(declare-fun getCurrentListMap!1261 (array!11485 array!11483 (_ BitVec 32) (_ BitVec 32) V!7809 V!7809 (_ BitVec 32) Int) ListLongMap!3427)

(assert (=> b!232497 (= lt!117452 (getCurrentListMap!1261 (_keys!6380 thiss!1504) (_values!4309 thiss!1504) (mask!10240 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4326 thiss!1504)))))

(declare-fun b!232498 () Bool)

(declare-fun e!150980 () Bool)

(assert (=> b!232498 (= e!150969 (and e!150980 mapRes!10351))))

(declare-fun condMapEmpty!10351 () Bool)

(declare-fun mapDefault!10351 () ValueCell!2717)

(assert (=> b!232498 (= condMapEmpty!10351 (= (arr!5461 (_values!4309 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2717)) mapDefault!10351)))))

(declare-fun mapIsEmpty!10351 () Bool)

(assert (=> mapIsEmpty!10351 mapRes!10351))

(declare-fun b!232499 () Bool)

(declare-fun res!114161 () Bool)

(assert (=> b!232499 (=> (not res!114161) (not e!150976))))

(assert (=> b!232499 (= res!114161 call!21600)))

(assert (=> b!232499 (= e!150978 e!150976)))

(declare-fun b!232500 () Bool)

(declare-fun Unit!7162 () Unit!7160)

(assert (=> b!232500 (= e!150979 Unit!7162)))

(declare-fun lt!117447 () Unit!7160)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!313 (array!11485 array!11483 (_ BitVec 32) (_ BitVec 32) V!7809 V!7809 (_ BitVec 64) Int) Unit!7160)

(assert (=> b!232500 (= lt!117447 (lemmaInListMapThenSeekEntryOrOpenFindsIt!313 (_keys!6380 thiss!1504) (_values!4309 thiss!1504) (mask!10240 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) key!932 (defaultEntry!4326 thiss!1504)))))

(assert (=> b!232500 false))

(declare-fun b!232501 () Bool)

(declare-fun e!150973 () Unit!7160)

(declare-fun Unit!7163 () Unit!7160)

(assert (=> b!232501 (= e!150973 Unit!7163)))

(declare-fun lt!117454 () Unit!7160)

(declare-fun lemmaArrayContainsKeyThenInListMap!151 (array!11485 array!11483 (_ BitVec 32) (_ BitVec 32) V!7809 V!7809 (_ BitVec 64) (_ BitVec 32) Int) Unit!7160)

(assert (=> b!232501 (= lt!117454 (lemmaArrayContainsKeyThenInListMap!151 (_keys!6380 thiss!1504) (_values!4309 thiss!1504) (mask!10240 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4326 thiss!1504)))))

(assert (=> b!232501 false))

(declare-fun res!114162 () Bool)

(assert (=> start!22196 (=> (not res!114162) (not e!150974))))

(declare-fun valid!1334 (LongMapFixedSize!3334) Bool)

(assert (=> start!22196 (= res!114162 (valid!1334 thiss!1504))))

(assert (=> start!22196 e!150974))

(assert (=> start!22196 e!150967))

(assert (=> start!22196 true))

(assert (=> start!22196 tp_is_empty!6121))

(declare-fun b!232502 () Bool)

(assert (=> b!232502 (= e!150972 (not true))))

(declare-fun lt!117453 () array!11485)

(declare-fun lt!117446 () Bool)

(declare-fun lt!117445 () array!11483)

(assert (=> b!232502 (= lt!117446 (valid!1334 (LongMapFixedSize!3335 (defaultEntry!4326 thiss!1504) (mask!10240 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) (bvadd #b00000000000000000000000000000001 (_size!1716 thiss!1504)) lt!117453 lt!117445 (_vacant!1716 thiss!1504))))))

(declare-fun lt!117451 () ListLongMap!3427)

(assert (=> b!232502 (contains!1611 lt!117451 key!932)))

(declare-fun lt!117438 () Unit!7160)

(declare-fun lemmaValidKeyInArrayIsInListMap!145 (array!11485 array!11483 (_ BitVec 32) (_ BitVec 32) V!7809 V!7809 (_ BitVec 32) Int) Unit!7160)

(assert (=> b!232502 (= lt!117438 (lemmaValidKeyInArrayIsInListMap!145 lt!117453 lt!117445 (mask!10240 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) index!297 (defaultEntry!4326 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11485 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232502 (= (arrayCountValidKeys!0 lt!117453 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!117442 () Unit!7160)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11485 (_ BitVec 32)) Unit!7160)

(assert (=> b!232502 (= lt!117442 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117453 index!297))))

(assert (=> b!232502 (arrayContainsKey!0 lt!117453 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117440 () Unit!7160)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11485 (_ BitVec 64) (_ BitVec 32)) Unit!7160)

(assert (=> b!232502 (= lt!117440 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117453 key!932 index!297))))

(declare-fun lt!117450 () ListLongMap!3427)

(assert (=> b!232502 (= lt!117450 lt!117451)))

(assert (=> b!232502 (= lt!117451 (getCurrentListMap!1261 lt!117453 lt!117445 (mask!10240 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4326 thiss!1504)))))

(declare-fun v!346 () V!7809)

(declare-fun +!624 (ListLongMap!3427 tuple2!4512) ListLongMap!3427)

(assert (=> b!232502 (= lt!117450 (+!624 lt!117452 (tuple2!4513 key!932 v!346)))))

(assert (=> b!232502 (= lt!117445 (array!11484 (store (arr!5461 (_values!4309 thiss!1504)) index!297 (ValueCellFull!2717 v!346)) (size!5794 (_values!4309 thiss!1504))))))

(declare-fun lt!117448 () Unit!7160)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!83 (array!11485 array!11483 (_ BitVec 32) (_ BitVec 32) V!7809 V!7809 (_ BitVec 32) (_ BitVec 64) V!7809 Int) Unit!7160)

(assert (=> b!232502 (= lt!117448 (lemmaAddValidKeyToArrayThenAddPairToListMap!83 (_keys!6380 thiss!1504) (_values!4309 thiss!1504) (mask!10240 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) index!297 key!932 v!346 (defaultEntry!4326 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11485 (_ BitVec 32)) Bool)

(assert (=> b!232502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117453 (mask!10240 thiss!1504))))

(declare-fun lt!117437 () Unit!7160)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11485 (_ BitVec 32) (_ BitVec 32)) Unit!7160)

(assert (=> b!232502 (= lt!117437 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6380 thiss!1504) index!297 (mask!10240 thiss!1504)))))

(assert (=> b!232502 (= (arrayCountValidKeys!0 lt!117453 #b00000000000000000000000000000000 (size!5795 (_keys!6380 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6380 thiss!1504) #b00000000000000000000000000000000 (size!5795 (_keys!6380 thiss!1504)))))))

(declare-fun lt!117449 () Unit!7160)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11485 (_ BitVec 32) (_ BitVec 64)) Unit!7160)

(assert (=> b!232502 (= lt!117449 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6380 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3422 0))(
  ( (Nil!3419) (Cons!3418 (h!4066 (_ BitVec 64)) (t!8373 List!3422)) )
))
(declare-fun arrayNoDuplicates!0 (array!11485 (_ BitVec 32) List!3422) Bool)

(assert (=> b!232502 (arrayNoDuplicates!0 lt!117453 #b00000000000000000000000000000000 Nil!3419)))

(assert (=> b!232502 (= lt!117453 (array!11486 (store (arr!5462 (_keys!6380 thiss!1504)) index!297 key!932) (size!5795 (_keys!6380 thiss!1504))))))

(declare-fun lt!117441 () Unit!7160)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11485 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3422) Unit!7160)

(assert (=> b!232502 (= lt!117441 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6380 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3419))))

(declare-fun lt!117436 () Unit!7160)

(assert (=> b!232502 (= lt!117436 e!150973)))

(declare-fun c!38665 () Bool)

(assert (=> b!232502 (= c!38665 (arrayContainsKey!0 (_keys!6380 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232503 () Bool)

(declare-fun Unit!7164 () Unit!7160)

(assert (=> b!232503 (= e!150973 Unit!7164)))

(declare-fun b!232504 () Bool)

(declare-fun res!114159 () Bool)

(assert (=> b!232504 (=> (not res!114159) (not e!150976))))

(assert (=> b!232504 (= res!114159 (= (select (arr!5462 (_keys!6380 thiss!1504)) (index!5902 lt!117444)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!232505 () Bool)

(assert (=> b!232505 (= e!150974 e!150975)))

(declare-fun res!114164 () Bool)

(assert (=> b!232505 (=> (not res!114164) (not e!150975))))

(assert (=> b!232505 (= res!114164 (or (= lt!117444 (MissingZero!933 index!297)) (= lt!117444 (MissingVacant!933 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11485 (_ BitVec 32)) SeekEntryResult!933)

(assert (=> b!232505 (= lt!117444 (seekEntryOrOpen!0 key!932 (_keys!6380 thiss!1504) (mask!10240 thiss!1504)))))

(declare-fun b!232506 () Bool)

(assert (=> b!232506 (= e!150980 tp_is_empty!6121)))

(assert (= (and start!22196 res!114162) b!232496))

(assert (= (and b!232496 res!114166) b!232505))

(assert (= (and b!232505 res!114164) b!232497))

(assert (= (and b!232497 c!38663) b!232500))

(assert (= (and b!232497 (not c!38663)) b!232487))

(assert (= (and b!232487 c!38662) b!232499))

(assert (= (and b!232487 (not c!38662)) b!232493))

(assert (= (and b!232499 res!114161) b!232504))

(assert (= (and b!232504 res!114159) b!232494))

(assert (= (and b!232493 c!38664) b!232495))

(assert (= (and b!232493 (not c!38664)) b!232490))

(assert (= (and b!232495 res!114160) b!232491))

(assert (= (and b!232491 res!114163) b!232492))

(assert (= (or b!232499 b!232495) bm!21597))

(assert (= (or b!232494 b!232492) bm!21596))

(assert (= (and b!232497 res!114165) b!232502))

(assert (= (and b!232502 c!38665) b!232501))

(assert (= (and b!232502 (not c!38665)) b!232503))

(assert (= (and b!232498 condMapEmpty!10351) mapIsEmpty!10351))

(assert (= (and b!232498 (not condMapEmpty!10351)) mapNonEmpty!10351))

(assert (= (and mapNonEmpty!10351 ((_ is ValueCellFull!2717) mapValue!10351)) b!232488))

(assert (= (and b!232498 ((_ is ValueCellFull!2717) mapDefault!10351)) b!232506))

(assert (= b!232489 b!232498))

(assert (= start!22196 b!232489))

(declare-fun m!254047 () Bool)

(assert (=> b!232491 m!254047))

(declare-fun m!254049 () Bool)

(assert (=> b!232501 m!254049))

(declare-fun m!254051 () Bool)

(assert (=> start!22196 m!254051))

(declare-fun m!254053 () Bool)

(assert (=> b!232504 m!254053))

(declare-fun m!254055 () Bool)

(assert (=> mapNonEmpty!10351 m!254055))

(declare-fun m!254057 () Bool)

(assert (=> bm!21597 m!254057))

(declare-fun m!254059 () Bool)

(assert (=> b!232500 m!254059))

(declare-fun m!254061 () Bool)

(assert (=> b!232497 m!254061))

(declare-fun m!254063 () Bool)

(assert (=> b!232497 m!254063))

(declare-fun m!254065 () Bool)

(assert (=> b!232497 m!254065))

(declare-fun m!254067 () Bool)

(assert (=> bm!21596 m!254067))

(declare-fun m!254069 () Bool)

(assert (=> b!232487 m!254069))

(declare-fun m!254071 () Bool)

(assert (=> b!232489 m!254071))

(declare-fun m!254073 () Bool)

(assert (=> b!232489 m!254073))

(declare-fun m!254075 () Bool)

(assert (=> b!232505 m!254075))

(declare-fun m!254077 () Bool)

(assert (=> b!232502 m!254077))

(declare-fun m!254079 () Bool)

(assert (=> b!232502 m!254079))

(declare-fun m!254081 () Bool)

(assert (=> b!232502 m!254081))

(declare-fun m!254083 () Bool)

(assert (=> b!232502 m!254083))

(declare-fun m!254085 () Bool)

(assert (=> b!232502 m!254085))

(declare-fun m!254087 () Bool)

(assert (=> b!232502 m!254087))

(declare-fun m!254089 () Bool)

(assert (=> b!232502 m!254089))

(assert (=> b!232502 m!254067))

(declare-fun m!254091 () Bool)

(assert (=> b!232502 m!254091))

(declare-fun m!254093 () Bool)

(assert (=> b!232502 m!254093))

(declare-fun m!254095 () Bool)

(assert (=> b!232502 m!254095))

(declare-fun m!254097 () Bool)

(assert (=> b!232502 m!254097))

(declare-fun m!254099 () Bool)

(assert (=> b!232502 m!254099))

(declare-fun m!254101 () Bool)

(assert (=> b!232502 m!254101))

(declare-fun m!254103 () Bool)

(assert (=> b!232502 m!254103))

(declare-fun m!254105 () Bool)

(assert (=> b!232502 m!254105))

(declare-fun m!254107 () Bool)

(assert (=> b!232502 m!254107))

(declare-fun m!254109 () Bool)

(assert (=> b!232502 m!254109))

(declare-fun m!254111 () Bool)

(assert (=> b!232502 m!254111))

(declare-fun m!254113 () Bool)

(assert (=> b!232502 m!254113))

(check-sat (not b!232487) (not start!22196) (not b!232502) tp_is_empty!6121 (not b!232501) (not b!232505) (not bm!21597) (not b!232497) (not bm!21596) (not b!232500) (not mapNonEmpty!10351) (not b!232489) (not b_next!6259) b_and!13171)
(check-sat b_and!13171 (not b_next!6259))
