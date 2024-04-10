; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18728 () Bool)

(assert start!18728)

(declare-fun b!185084 () Bool)

(declare-fun b_free!4557 () Bool)

(declare-fun b_next!4557 () Bool)

(assert (=> b!185084 (= b_free!4557 (not b_next!4557))))

(declare-fun tp!16460 () Bool)

(declare-fun b_and!11153 () Bool)

(assert (=> b!185084 (= tp!16460 b_and!11153)))

(declare-fun b!185076 () Bool)

(declare-fun e!121801 () Bool)

(declare-fun e!121806 () Bool)

(assert (=> b!185076 (= e!121801 e!121806)))

(declare-fun res!87543 () Bool)

(assert (=> b!185076 (=> (not res!87543) (not e!121806))))

(declare-datatypes ((SeekEntryResult!629 0))(
  ( (MissingZero!629 (index!4686 (_ BitVec 32))) (Found!629 (index!4687 (_ BitVec 32))) (Intermediate!629 (undefined!1441 Bool) (index!4688 (_ BitVec 32)) (x!20105 (_ BitVec 32))) (Undefined!629) (MissingVacant!629 (index!4689 (_ BitVec 32))) )
))
(declare-fun lt!91542 () SeekEntryResult!629)

(get-info :version)

(assert (=> b!185076 (= res!87543 (and (not ((_ is Undefined!629) lt!91542)) (not ((_ is MissingVacant!629) lt!91542)) (not ((_ is MissingZero!629) lt!91542)) ((_ is Found!629) lt!91542)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5419 0))(
  ( (V!5420 (val!2209 Int)) )
))
(declare-datatypes ((ValueCell!1821 0))(
  ( (ValueCellFull!1821 (v!4117 V!5419)) (EmptyCell!1821) )
))
(declare-datatypes ((array!7861 0))(
  ( (array!7862 (arr!3713 (Array (_ BitVec 32) (_ BitVec 64))) (size!4029 (_ BitVec 32))) )
))
(declare-datatypes ((array!7863 0))(
  ( (array!7864 (arr!3714 (Array (_ BitVec 32) ValueCell!1821)) (size!4030 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2550 0))(
  ( (LongMapFixedSize!2551 (defaultEntry!3774 Int) (mask!8872 (_ BitVec 32)) (extraKeys!3511 (_ BitVec 32)) (zeroValue!3615 V!5419) (minValue!3615 V!5419) (_size!1324 (_ BitVec 32)) (_keys!5709 array!7861) (_values!3757 array!7863) (_vacant!1324 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2550)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7861 (_ BitVec 32)) SeekEntryResult!629)

(assert (=> b!185076 (= lt!91542 (seekEntryOrOpen!0 key!828 (_keys!5709 thiss!1248) (mask!8872 thiss!1248)))))

(declare-fun mapIsEmpty!7446 () Bool)

(declare-fun mapRes!7446 () Bool)

(assert (=> mapIsEmpty!7446 mapRes!7446))

(declare-fun b!185077 () Bool)

(declare-fun res!87540 () Bool)

(assert (=> b!185077 (=> (not res!87540) (not e!121806))))

(declare-datatypes ((tuple2!3440 0))(
  ( (tuple2!3441 (_1!1731 (_ BitVec 64)) (_2!1731 V!5419)) )
))
(declare-datatypes ((List!2352 0))(
  ( (Nil!2349) (Cons!2348 (h!2981 tuple2!3440) (t!7230 List!2352)) )
))
(declare-datatypes ((ListLongMap!2357 0))(
  ( (ListLongMap!2358 (toList!1194 List!2352)) )
))
(declare-fun contains!1288 (ListLongMap!2357 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!842 (array!7861 array!7863 (_ BitVec 32) (_ BitVec 32) V!5419 V!5419 (_ BitVec 32) Int) ListLongMap!2357)

(assert (=> b!185077 (= res!87540 (not (contains!1288 (getCurrentListMap!842 (_keys!5709 thiss!1248) (_values!3757 thiss!1248) (mask!8872 thiss!1248) (extraKeys!3511 thiss!1248) (zeroValue!3615 thiss!1248) (minValue!3615 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3774 thiss!1248)) key!828)))))

(declare-fun b!185078 () Bool)

(declare-fun res!87544 () Bool)

(assert (=> b!185078 (=> (not res!87544) (not e!121806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185078 (= res!87544 (validMask!0 (mask!8872 thiss!1248)))))

(declare-fun b!185079 () Bool)

(declare-fun e!121802 () Bool)

(declare-fun tp_is_empty!4329 () Bool)

(assert (=> b!185079 (= e!121802 tp_is_empty!4329)))

(declare-fun b!185080 () Bool)

(declare-fun e!121804 () Bool)

(assert (=> b!185080 (= e!121804 tp_is_empty!4329)))

(declare-fun b!185081 () Bool)

(declare-fun res!87542 () Bool)

(assert (=> b!185081 (=> (not res!87542) (not e!121801))))

(assert (=> b!185081 (= res!87542 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185082 () Bool)

(declare-fun res!87545 () Bool)

(assert (=> b!185082 (=> (not res!87545) (not e!121806))))

(assert (=> b!185082 (= res!87545 (and (= (size!4030 (_values!3757 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8872 thiss!1248))) (= (size!4029 (_keys!5709 thiss!1248)) (size!4030 (_values!3757 thiss!1248))) (bvsge (mask!8872 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3511 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3511 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!185083 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7861 (_ BitVec 32)) Bool)

(assert (=> b!185083 (= e!121806 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5709 thiss!1248) (mask!8872 thiss!1248))))))

(declare-fun res!87541 () Bool)

(assert (=> start!18728 (=> (not res!87541) (not e!121801))))

(declare-fun valid!1053 (LongMapFixedSize!2550) Bool)

(assert (=> start!18728 (= res!87541 (valid!1053 thiss!1248))))

(assert (=> start!18728 e!121801))

(declare-fun e!121807 () Bool)

(assert (=> start!18728 e!121807))

(assert (=> start!18728 true))

(declare-fun e!121805 () Bool)

(declare-fun array_inv!2401 (array!7861) Bool)

(declare-fun array_inv!2402 (array!7863) Bool)

(assert (=> b!185084 (= e!121807 (and tp!16460 tp_is_empty!4329 (array_inv!2401 (_keys!5709 thiss!1248)) (array_inv!2402 (_values!3757 thiss!1248)) e!121805))))

(declare-fun mapNonEmpty!7446 () Bool)

(declare-fun tp!16461 () Bool)

(assert (=> mapNonEmpty!7446 (= mapRes!7446 (and tp!16461 e!121802))))

(declare-fun mapValue!7446 () ValueCell!1821)

(declare-fun mapRest!7446 () (Array (_ BitVec 32) ValueCell!1821))

(declare-fun mapKey!7446 () (_ BitVec 32))

(assert (=> mapNonEmpty!7446 (= (arr!3714 (_values!3757 thiss!1248)) (store mapRest!7446 mapKey!7446 mapValue!7446))))

(declare-fun b!185085 () Bool)

(assert (=> b!185085 (= e!121805 (and e!121804 mapRes!7446))))

(declare-fun condMapEmpty!7446 () Bool)

(declare-fun mapDefault!7446 () ValueCell!1821)

(assert (=> b!185085 (= condMapEmpty!7446 (= (arr!3714 (_values!3757 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1821)) mapDefault!7446)))))

(assert (= (and start!18728 res!87541) b!185081))

(assert (= (and b!185081 res!87542) b!185076))

(assert (= (and b!185076 res!87543) b!185077))

(assert (= (and b!185077 res!87540) b!185078))

(assert (= (and b!185078 res!87544) b!185082))

(assert (= (and b!185082 res!87545) b!185083))

(assert (= (and b!185085 condMapEmpty!7446) mapIsEmpty!7446))

(assert (= (and b!185085 (not condMapEmpty!7446)) mapNonEmpty!7446))

(assert (= (and mapNonEmpty!7446 ((_ is ValueCellFull!1821) mapValue!7446)) b!185079))

(assert (= (and b!185085 ((_ is ValueCellFull!1821) mapDefault!7446)) b!185080))

(assert (= b!185084 b!185085))

(assert (= start!18728 b!185084))

(declare-fun m!212411 () Bool)

(assert (=> start!18728 m!212411))

(declare-fun m!212413 () Bool)

(assert (=> b!185083 m!212413))

(declare-fun m!212415 () Bool)

(assert (=> b!185076 m!212415))

(declare-fun m!212417 () Bool)

(assert (=> b!185077 m!212417))

(assert (=> b!185077 m!212417))

(declare-fun m!212419 () Bool)

(assert (=> b!185077 m!212419))

(declare-fun m!212421 () Bool)

(assert (=> b!185078 m!212421))

(declare-fun m!212423 () Bool)

(assert (=> mapNonEmpty!7446 m!212423))

(declare-fun m!212425 () Bool)

(assert (=> b!185084 m!212425))

(declare-fun m!212427 () Bool)

(assert (=> b!185084 m!212427))

(check-sat (not start!18728) (not b!185077) (not b!185078) (not b!185084) (not mapNonEmpty!7446) (not b_next!4557) (not b!185083) b_and!11153 (not b!185076) tp_is_empty!4329)
(check-sat b_and!11153 (not b_next!4557))
(get-model)

(declare-fun b!185124 () Bool)

(declare-fun e!121836 () Bool)

(declare-fun e!121837 () Bool)

(assert (=> b!185124 (= e!121836 e!121837)))

(declare-fun lt!91552 () (_ BitVec 64))

(assert (=> b!185124 (= lt!91552 (select (arr!3713 (_keys!5709 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5584 0))(
  ( (Unit!5585) )
))
(declare-fun lt!91553 () Unit!5584)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7861 (_ BitVec 64) (_ BitVec 32)) Unit!5584)

(assert (=> b!185124 (= lt!91553 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5709 thiss!1248) lt!91552 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!185124 (arrayContainsKey!0 (_keys!5709 thiss!1248) lt!91552 #b00000000000000000000000000000000)))

(declare-fun lt!91554 () Unit!5584)

(assert (=> b!185124 (= lt!91554 lt!91553)))

(declare-fun res!87569 () Bool)

(assert (=> b!185124 (= res!87569 (= (seekEntryOrOpen!0 (select (arr!3713 (_keys!5709 thiss!1248)) #b00000000000000000000000000000000) (_keys!5709 thiss!1248) (mask!8872 thiss!1248)) (Found!629 #b00000000000000000000000000000000)))))

(assert (=> b!185124 (=> (not res!87569) (not e!121837))))

(declare-fun b!185125 () Bool)

(declare-fun call!18664 () Bool)

(assert (=> b!185125 (= e!121837 call!18664)))

(declare-fun d!55079 () Bool)

(declare-fun res!87568 () Bool)

(declare-fun e!121835 () Bool)

(assert (=> d!55079 (=> res!87568 e!121835)))

(assert (=> d!55079 (= res!87568 (bvsge #b00000000000000000000000000000000 (size!4029 (_keys!5709 thiss!1248))))))

(assert (=> d!55079 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5709 thiss!1248) (mask!8872 thiss!1248)) e!121835)))

(declare-fun b!185126 () Bool)

(assert (=> b!185126 (= e!121836 call!18664)))

(declare-fun bm!18661 () Bool)

(assert (=> bm!18661 (= call!18664 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5709 thiss!1248) (mask!8872 thiss!1248)))))

(declare-fun b!185127 () Bool)

(assert (=> b!185127 (= e!121835 e!121836)))

(declare-fun c!33220 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!185127 (= c!33220 (validKeyInArray!0 (select (arr!3713 (_keys!5709 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55079 (not res!87568)) b!185127))

(assert (= (and b!185127 c!33220) b!185124))

(assert (= (and b!185127 (not c!33220)) b!185126))

(assert (= (and b!185124 res!87569) b!185125))

(assert (= (or b!185125 b!185126) bm!18661))

(declare-fun m!212447 () Bool)

(assert (=> b!185124 m!212447))

(declare-fun m!212449 () Bool)

(assert (=> b!185124 m!212449))

(declare-fun m!212451 () Bool)

(assert (=> b!185124 m!212451))

(assert (=> b!185124 m!212447))

(declare-fun m!212453 () Bool)

(assert (=> b!185124 m!212453))

(declare-fun m!212455 () Bool)

(assert (=> bm!18661 m!212455))

(assert (=> b!185127 m!212447))

(assert (=> b!185127 m!212447))

(declare-fun m!212457 () Bool)

(assert (=> b!185127 m!212457))

(assert (=> b!185083 d!55079))

(declare-fun d!55081 () Bool)

(assert (=> d!55081 (= (validMask!0 (mask!8872 thiss!1248)) (and (or (= (mask!8872 thiss!1248) #b00000000000000000000000000000111) (= (mask!8872 thiss!1248) #b00000000000000000000000000001111) (= (mask!8872 thiss!1248) #b00000000000000000000000000011111) (= (mask!8872 thiss!1248) #b00000000000000000000000000111111) (= (mask!8872 thiss!1248) #b00000000000000000000000001111111) (= (mask!8872 thiss!1248) #b00000000000000000000000011111111) (= (mask!8872 thiss!1248) #b00000000000000000000000111111111) (= (mask!8872 thiss!1248) #b00000000000000000000001111111111) (= (mask!8872 thiss!1248) #b00000000000000000000011111111111) (= (mask!8872 thiss!1248) #b00000000000000000000111111111111) (= (mask!8872 thiss!1248) #b00000000000000000001111111111111) (= (mask!8872 thiss!1248) #b00000000000000000011111111111111) (= (mask!8872 thiss!1248) #b00000000000000000111111111111111) (= (mask!8872 thiss!1248) #b00000000000000001111111111111111) (= (mask!8872 thiss!1248) #b00000000000000011111111111111111) (= (mask!8872 thiss!1248) #b00000000000000111111111111111111) (= (mask!8872 thiss!1248) #b00000000000001111111111111111111) (= (mask!8872 thiss!1248) #b00000000000011111111111111111111) (= (mask!8872 thiss!1248) #b00000000000111111111111111111111) (= (mask!8872 thiss!1248) #b00000000001111111111111111111111) (= (mask!8872 thiss!1248) #b00000000011111111111111111111111) (= (mask!8872 thiss!1248) #b00000000111111111111111111111111) (= (mask!8872 thiss!1248) #b00000001111111111111111111111111) (= (mask!8872 thiss!1248) #b00000011111111111111111111111111) (= (mask!8872 thiss!1248) #b00000111111111111111111111111111) (= (mask!8872 thiss!1248) #b00001111111111111111111111111111) (= (mask!8872 thiss!1248) #b00011111111111111111111111111111) (= (mask!8872 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8872 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!185078 d!55081))

(declare-fun d!55083 () Bool)

(declare-fun res!87576 () Bool)

(declare-fun e!121840 () Bool)

(assert (=> d!55083 (=> (not res!87576) (not e!121840))))

(declare-fun simpleValid!180 (LongMapFixedSize!2550) Bool)

(assert (=> d!55083 (= res!87576 (simpleValid!180 thiss!1248))))

(assert (=> d!55083 (= (valid!1053 thiss!1248) e!121840)))

(declare-fun b!185134 () Bool)

(declare-fun res!87577 () Bool)

(assert (=> b!185134 (=> (not res!87577) (not e!121840))))

(declare-fun arrayCountValidKeys!0 (array!7861 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!185134 (= res!87577 (= (arrayCountValidKeys!0 (_keys!5709 thiss!1248) #b00000000000000000000000000000000 (size!4029 (_keys!5709 thiss!1248))) (_size!1324 thiss!1248)))))

(declare-fun b!185135 () Bool)

(declare-fun res!87578 () Bool)

(assert (=> b!185135 (=> (not res!87578) (not e!121840))))

(assert (=> b!185135 (= res!87578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5709 thiss!1248) (mask!8872 thiss!1248)))))

(declare-fun b!185136 () Bool)

(declare-datatypes ((List!2354 0))(
  ( (Nil!2351) (Cons!2350 (h!2983 (_ BitVec 64)) (t!7234 List!2354)) )
))
(declare-fun arrayNoDuplicates!0 (array!7861 (_ BitVec 32) List!2354) Bool)

(assert (=> b!185136 (= e!121840 (arrayNoDuplicates!0 (_keys!5709 thiss!1248) #b00000000000000000000000000000000 Nil!2351))))

(assert (= (and d!55083 res!87576) b!185134))

(assert (= (and b!185134 res!87577) b!185135))

(assert (= (and b!185135 res!87578) b!185136))

(declare-fun m!212459 () Bool)

(assert (=> d!55083 m!212459))

(declare-fun m!212461 () Bool)

(assert (=> b!185134 m!212461))

(assert (=> b!185135 m!212413))

(declare-fun m!212463 () Bool)

(assert (=> b!185136 m!212463))

(assert (=> start!18728 d!55083))

(declare-fun d!55085 () Bool)

(declare-fun e!121845 () Bool)

(assert (=> d!55085 e!121845))

(declare-fun res!87581 () Bool)

(assert (=> d!55085 (=> res!87581 e!121845)))

(declare-fun lt!91566 () Bool)

(assert (=> d!55085 (= res!87581 (not lt!91566))))

(declare-fun lt!91564 () Bool)

(assert (=> d!55085 (= lt!91566 lt!91564)))

(declare-fun lt!91563 () Unit!5584)

(declare-fun e!121846 () Unit!5584)

(assert (=> d!55085 (= lt!91563 e!121846)))

(declare-fun c!33223 () Bool)

(assert (=> d!55085 (= c!33223 lt!91564)))

(declare-fun containsKey!225 (List!2352 (_ BitVec 64)) Bool)

(assert (=> d!55085 (= lt!91564 (containsKey!225 (toList!1194 (getCurrentListMap!842 (_keys!5709 thiss!1248) (_values!3757 thiss!1248) (mask!8872 thiss!1248) (extraKeys!3511 thiss!1248) (zeroValue!3615 thiss!1248) (minValue!3615 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3774 thiss!1248))) key!828))))

(assert (=> d!55085 (= (contains!1288 (getCurrentListMap!842 (_keys!5709 thiss!1248) (_values!3757 thiss!1248) (mask!8872 thiss!1248) (extraKeys!3511 thiss!1248) (zeroValue!3615 thiss!1248) (minValue!3615 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3774 thiss!1248)) key!828) lt!91566)))

(declare-fun b!185143 () Bool)

(declare-fun lt!91565 () Unit!5584)

(assert (=> b!185143 (= e!121846 lt!91565)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!173 (List!2352 (_ BitVec 64)) Unit!5584)

(assert (=> b!185143 (= lt!91565 (lemmaContainsKeyImpliesGetValueByKeyDefined!173 (toList!1194 (getCurrentListMap!842 (_keys!5709 thiss!1248) (_values!3757 thiss!1248) (mask!8872 thiss!1248) (extraKeys!3511 thiss!1248) (zeroValue!3615 thiss!1248) (minValue!3615 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3774 thiss!1248))) key!828))))

(declare-datatypes ((Option!227 0))(
  ( (Some!226 (v!4119 V!5419)) (None!225) )
))
(declare-fun isDefined!174 (Option!227) Bool)

(declare-fun getValueByKey!221 (List!2352 (_ BitVec 64)) Option!227)

(assert (=> b!185143 (isDefined!174 (getValueByKey!221 (toList!1194 (getCurrentListMap!842 (_keys!5709 thiss!1248) (_values!3757 thiss!1248) (mask!8872 thiss!1248) (extraKeys!3511 thiss!1248) (zeroValue!3615 thiss!1248) (minValue!3615 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3774 thiss!1248))) key!828))))

(declare-fun b!185144 () Bool)

(declare-fun Unit!5586 () Unit!5584)

(assert (=> b!185144 (= e!121846 Unit!5586)))

(declare-fun b!185145 () Bool)

(assert (=> b!185145 (= e!121845 (isDefined!174 (getValueByKey!221 (toList!1194 (getCurrentListMap!842 (_keys!5709 thiss!1248) (_values!3757 thiss!1248) (mask!8872 thiss!1248) (extraKeys!3511 thiss!1248) (zeroValue!3615 thiss!1248) (minValue!3615 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3774 thiss!1248))) key!828)))))

(assert (= (and d!55085 c!33223) b!185143))

(assert (= (and d!55085 (not c!33223)) b!185144))

(assert (= (and d!55085 (not res!87581)) b!185145))

(declare-fun m!212465 () Bool)

(assert (=> d!55085 m!212465))

(declare-fun m!212467 () Bool)

(assert (=> b!185143 m!212467))

(declare-fun m!212469 () Bool)

(assert (=> b!185143 m!212469))

(assert (=> b!185143 m!212469))

(declare-fun m!212471 () Bool)

(assert (=> b!185143 m!212471))

(assert (=> b!185145 m!212469))

(assert (=> b!185145 m!212469))

(assert (=> b!185145 m!212471))

(assert (=> b!185077 d!55085))

(declare-fun b!185188 () Bool)

(declare-fun e!121877 () Bool)

(declare-fun lt!91615 () ListLongMap!2357)

(declare-fun apply!164 (ListLongMap!2357 (_ BitVec 64)) V!5419)

(assert (=> b!185188 (= e!121877 (= (apply!164 lt!91615 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3615 thiss!1248)))))

(declare-fun b!185189 () Bool)

(declare-fun res!87607 () Bool)

(declare-fun e!121880 () Bool)

(assert (=> b!185189 (=> (not res!87607) (not e!121880))))

(declare-fun e!121873 () Bool)

(assert (=> b!185189 (= res!87607 e!121873)))

(declare-fun res!87602 () Bool)

(assert (=> b!185189 (=> res!87602 e!121873)))

(declare-fun e!121878 () Bool)

(assert (=> b!185189 (= res!87602 (not e!121878))))

(declare-fun res!87605 () Bool)

(assert (=> b!185189 (=> (not res!87605) (not e!121878))))

(assert (=> b!185189 (= res!87605 (bvslt #b00000000000000000000000000000000 (size!4029 (_keys!5709 thiss!1248))))))

(declare-fun b!185190 () Bool)

(declare-fun e!121881 () ListLongMap!2357)

(declare-fun call!18680 () ListLongMap!2357)

(declare-fun +!284 (ListLongMap!2357 tuple2!3440) ListLongMap!2357)

(assert (=> b!185190 (= e!121881 (+!284 call!18680 (tuple2!3441 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3615 thiss!1248))))))

(declare-fun b!185191 () Bool)

(declare-fun e!121882 () Unit!5584)

(declare-fun lt!91631 () Unit!5584)

(assert (=> b!185191 (= e!121882 lt!91631)))

(declare-fun lt!91620 () ListLongMap!2357)

(declare-fun getCurrentListMapNoExtraKeys!197 (array!7861 array!7863 (_ BitVec 32) (_ BitVec 32) V!5419 V!5419 (_ BitVec 32) Int) ListLongMap!2357)

(assert (=> b!185191 (= lt!91620 (getCurrentListMapNoExtraKeys!197 (_keys!5709 thiss!1248) (_values!3757 thiss!1248) (mask!8872 thiss!1248) (extraKeys!3511 thiss!1248) (zeroValue!3615 thiss!1248) (minValue!3615 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3774 thiss!1248)))))

(declare-fun lt!91627 () (_ BitVec 64))

(assert (=> b!185191 (= lt!91627 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91624 () (_ BitVec 64))

(assert (=> b!185191 (= lt!91624 (select (arr!3713 (_keys!5709 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91617 () Unit!5584)

(declare-fun addStillContains!140 (ListLongMap!2357 (_ BitVec 64) V!5419 (_ BitVec 64)) Unit!5584)

(assert (=> b!185191 (= lt!91617 (addStillContains!140 lt!91620 lt!91627 (zeroValue!3615 thiss!1248) lt!91624))))

(assert (=> b!185191 (contains!1288 (+!284 lt!91620 (tuple2!3441 lt!91627 (zeroValue!3615 thiss!1248))) lt!91624)))

(declare-fun lt!91630 () Unit!5584)

(assert (=> b!185191 (= lt!91630 lt!91617)))

(declare-fun lt!91623 () ListLongMap!2357)

(assert (=> b!185191 (= lt!91623 (getCurrentListMapNoExtraKeys!197 (_keys!5709 thiss!1248) (_values!3757 thiss!1248) (mask!8872 thiss!1248) (extraKeys!3511 thiss!1248) (zeroValue!3615 thiss!1248) (minValue!3615 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3774 thiss!1248)))))

(declare-fun lt!91614 () (_ BitVec 64))

(assert (=> b!185191 (= lt!91614 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91612 () (_ BitVec 64))

(assert (=> b!185191 (= lt!91612 (select (arr!3713 (_keys!5709 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91632 () Unit!5584)

(declare-fun addApplyDifferent!140 (ListLongMap!2357 (_ BitVec 64) V!5419 (_ BitVec 64)) Unit!5584)

(assert (=> b!185191 (= lt!91632 (addApplyDifferent!140 lt!91623 lt!91614 (minValue!3615 thiss!1248) lt!91612))))

(assert (=> b!185191 (= (apply!164 (+!284 lt!91623 (tuple2!3441 lt!91614 (minValue!3615 thiss!1248))) lt!91612) (apply!164 lt!91623 lt!91612))))

(declare-fun lt!91618 () Unit!5584)

(assert (=> b!185191 (= lt!91618 lt!91632)))

(declare-fun lt!91629 () ListLongMap!2357)

(assert (=> b!185191 (= lt!91629 (getCurrentListMapNoExtraKeys!197 (_keys!5709 thiss!1248) (_values!3757 thiss!1248) (mask!8872 thiss!1248) (extraKeys!3511 thiss!1248) (zeroValue!3615 thiss!1248) (minValue!3615 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3774 thiss!1248)))))

(declare-fun lt!91628 () (_ BitVec 64))

(assert (=> b!185191 (= lt!91628 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91613 () (_ BitVec 64))

(assert (=> b!185191 (= lt!91613 (select (arr!3713 (_keys!5709 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91621 () Unit!5584)

(assert (=> b!185191 (= lt!91621 (addApplyDifferent!140 lt!91629 lt!91628 (zeroValue!3615 thiss!1248) lt!91613))))

(assert (=> b!185191 (= (apply!164 (+!284 lt!91629 (tuple2!3441 lt!91628 (zeroValue!3615 thiss!1248))) lt!91613) (apply!164 lt!91629 lt!91613))))

(declare-fun lt!91622 () Unit!5584)

(assert (=> b!185191 (= lt!91622 lt!91621)))

(declare-fun lt!91611 () ListLongMap!2357)

(assert (=> b!185191 (= lt!91611 (getCurrentListMapNoExtraKeys!197 (_keys!5709 thiss!1248) (_values!3757 thiss!1248) (mask!8872 thiss!1248) (extraKeys!3511 thiss!1248) (zeroValue!3615 thiss!1248) (minValue!3615 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3774 thiss!1248)))))

(declare-fun lt!91619 () (_ BitVec 64))

(assert (=> b!185191 (= lt!91619 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91626 () (_ BitVec 64))

(assert (=> b!185191 (= lt!91626 (select (arr!3713 (_keys!5709 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185191 (= lt!91631 (addApplyDifferent!140 lt!91611 lt!91619 (minValue!3615 thiss!1248) lt!91626))))

(assert (=> b!185191 (= (apply!164 (+!284 lt!91611 (tuple2!3441 lt!91619 (minValue!3615 thiss!1248))) lt!91626) (apply!164 lt!91611 lt!91626))))

(declare-fun bm!18676 () Bool)

(declare-fun call!18684 () Bool)

(assert (=> bm!18676 (= call!18684 (contains!1288 lt!91615 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!185193 () Bool)

(declare-fun e!121874 () Bool)

(declare-fun call!18683 () Bool)

(assert (=> b!185193 (= e!121874 (not call!18683))))

(declare-fun b!185194 () Bool)

(assert (=> b!185194 (= e!121880 e!121874)))

(declare-fun c!33240 () Bool)

(assert (=> b!185194 (= c!33240 (not (= (bvand (extraKeys!3511 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!185195 () Bool)

(declare-fun e!121879 () ListLongMap!2357)

(declare-fun call!18681 () ListLongMap!2357)

(assert (=> b!185195 (= e!121879 call!18681)))

(declare-fun b!185196 () Bool)

(declare-fun Unit!5587 () Unit!5584)

(assert (=> b!185196 (= e!121882 Unit!5587)))

(declare-fun b!185197 () Bool)

(declare-fun e!121875 () Bool)

(assert (=> b!185197 (= e!121875 (validKeyInArray!0 (select (arr!3713 (_keys!5709 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185198 () Bool)

(declare-fun c!33237 () Bool)

(assert (=> b!185198 (= c!33237 (and (not (= (bvand (extraKeys!3511 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3511 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!121876 () ListLongMap!2357)

(assert (=> b!185198 (= e!121876 e!121879)))

(declare-fun bm!18677 () Bool)

(assert (=> bm!18677 (= call!18681 call!18680)))

(declare-fun b!185199 () Bool)

(declare-fun res!87603 () Bool)

(assert (=> b!185199 (=> (not res!87603) (not e!121880))))

(declare-fun e!121884 () Bool)

(assert (=> b!185199 (= res!87603 e!121884)))

(declare-fun c!33236 () Bool)

(assert (=> b!185199 (= c!33236 (not (= (bvand (extraKeys!3511 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!185200 () Bool)

(declare-fun call!18679 () ListLongMap!2357)

(assert (=> b!185200 (= e!121879 call!18679)))

(declare-fun b!185201 () Bool)

(declare-fun e!121883 () Bool)

(declare-fun get!2135 (ValueCell!1821 V!5419) V!5419)

(declare-fun dynLambda!507 (Int (_ BitVec 64)) V!5419)

(assert (=> b!185201 (= e!121883 (= (apply!164 lt!91615 (select (arr!3713 (_keys!5709 thiss!1248)) #b00000000000000000000000000000000)) (get!2135 (select (arr!3714 (_values!3757 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!507 (defaultEntry!3774 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!185201 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4030 (_values!3757 thiss!1248))))))

(assert (=> b!185201 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4029 (_keys!5709 thiss!1248))))))

(declare-fun bm!18678 () Bool)

(declare-fun call!18682 () ListLongMap!2357)

(assert (=> bm!18678 (= call!18679 call!18682)))

(declare-fun b!185202 () Bool)

(assert (=> b!185202 (= e!121878 (validKeyInArray!0 (select (arr!3713 (_keys!5709 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun call!18685 () ListLongMap!2357)

(declare-fun bm!18679 () Bool)

(declare-fun c!33241 () Bool)

(declare-fun c!33238 () Bool)

(assert (=> bm!18679 (= call!18680 (+!284 (ite c!33241 call!18685 (ite c!33238 call!18682 call!18679)) (ite (or c!33241 c!33238) (tuple2!3441 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3615 thiss!1248)) (tuple2!3441 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3615 thiss!1248)))))))

(declare-fun bm!18680 () Bool)

(assert (=> bm!18680 (= call!18683 (contains!1288 lt!91615 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!55087 () Bool)

(assert (=> d!55087 e!121880))

(declare-fun res!87606 () Bool)

(assert (=> d!55087 (=> (not res!87606) (not e!121880))))

(assert (=> d!55087 (= res!87606 (or (bvsge #b00000000000000000000000000000000 (size!4029 (_keys!5709 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4029 (_keys!5709 thiss!1248))))))))

(declare-fun lt!91616 () ListLongMap!2357)

(assert (=> d!55087 (= lt!91615 lt!91616)))

(declare-fun lt!91625 () Unit!5584)

(assert (=> d!55087 (= lt!91625 e!121882)))

(declare-fun c!33239 () Bool)

(assert (=> d!55087 (= c!33239 e!121875)))

(declare-fun res!87600 () Bool)

(assert (=> d!55087 (=> (not res!87600) (not e!121875))))

(assert (=> d!55087 (= res!87600 (bvslt #b00000000000000000000000000000000 (size!4029 (_keys!5709 thiss!1248))))))

(assert (=> d!55087 (= lt!91616 e!121881)))

(assert (=> d!55087 (= c!33241 (and (not (= (bvand (extraKeys!3511 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3511 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55087 (validMask!0 (mask!8872 thiss!1248))))

(assert (=> d!55087 (= (getCurrentListMap!842 (_keys!5709 thiss!1248) (_values!3757 thiss!1248) (mask!8872 thiss!1248) (extraKeys!3511 thiss!1248) (zeroValue!3615 thiss!1248) (minValue!3615 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3774 thiss!1248)) lt!91615)))

(declare-fun b!185192 () Bool)

(assert (=> b!185192 (= e!121884 (not call!18684))))

(declare-fun b!185203 () Bool)

(declare-fun e!121885 () Bool)

(assert (=> b!185203 (= e!121885 (= (apply!164 lt!91615 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3615 thiss!1248)))))

(declare-fun bm!18681 () Bool)

(assert (=> bm!18681 (= call!18682 call!18685)))

(declare-fun b!185204 () Bool)

(assert (=> b!185204 (= e!121873 e!121883)))

(declare-fun res!87601 () Bool)

(assert (=> b!185204 (=> (not res!87601) (not e!121883))))

(assert (=> b!185204 (= res!87601 (contains!1288 lt!91615 (select (arr!3713 (_keys!5709 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!185204 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4029 (_keys!5709 thiss!1248))))))

(declare-fun b!185205 () Bool)

(assert (=> b!185205 (= e!121881 e!121876)))

(assert (=> b!185205 (= c!33238 (and (not (= (bvand (extraKeys!3511 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3511 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!185206 () Bool)

(assert (=> b!185206 (= e!121876 call!18681)))

(declare-fun b!185207 () Bool)

(assert (=> b!185207 (= e!121874 e!121877)))

(declare-fun res!87608 () Bool)

(assert (=> b!185207 (= res!87608 call!18683)))

(assert (=> b!185207 (=> (not res!87608) (not e!121877))))

(declare-fun b!185208 () Bool)

(assert (=> b!185208 (= e!121884 e!121885)))

(declare-fun res!87604 () Bool)

(assert (=> b!185208 (= res!87604 call!18684)))

(assert (=> b!185208 (=> (not res!87604) (not e!121885))))

(declare-fun bm!18682 () Bool)

(assert (=> bm!18682 (= call!18685 (getCurrentListMapNoExtraKeys!197 (_keys!5709 thiss!1248) (_values!3757 thiss!1248) (mask!8872 thiss!1248) (extraKeys!3511 thiss!1248) (zeroValue!3615 thiss!1248) (minValue!3615 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3774 thiss!1248)))))

(assert (= (and d!55087 c!33241) b!185190))

(assert (= (and d!55087 (not c!33241)) b!185205))

(assert (= (and b!185205 c!33238) b!185206))

(assert (= (and b!185205 (not c!33238)) b!185198))

(assert (= (and b!185198 c!33237) b!185195))

(assert (= (and b!185198 (not c!33237)) b!185200))

(assert (= (or b!185195 b!185200) bm!18678))

(assert (= (or b!185206 bm!18678) bm!18681))

(assert (= (or b!185206 b!185195) bm!18677))

(assert (= (or b!185190 bm!18681) bm!18682))

(assert (= (or b!185190 bm!18677) bm!18679))

(assert (= (and d!55087 res!87600) b!185197))

(assert (= (and d!55087 c!33239) b!185191))

(assert (= (and d!55087 (not c!33239)) b!185196))

(assert (= (and d!55087 res!87606) b!185189))

(assert (= (and b!185189 res!87605) b!185202))

(assert (= (and b!185189 (not res!87602)) b!185204))

(assert (= (and b!185204 res!87601) b!185201))

(assert (= (and b!185189 res!87607) b!185199))

(assert (= (and b!185199 c!33236) b!185208))

(assert (= (and b!185199 (not c!33236)) b!185192))

(assert (= (and b!185208 res!87604) b!185203))

(assert (= (or b!185208 b!185192) bm!18676))

(assert (= (and b!185199 res!87603) b!185194))

(assert (= (and b!185194 c!33240) b!185207))

(assert (= (and b!185194 (not c!33240)) b!185193))

(assert (= (and b!185207 res!87608) b!185188))

(assert (= (or b!185207 b!185193) bm!18680))

(declare-fun b_lambda!7243 () Bool)

(assert (=> (not b_lambda!7243) (not b!185201)))

(declare-fun t!7233 () Bool)

(declare-fun tb!2839 () Bool)

(assert (=> (and b!185084 (= (defaultEntry!3774 thiss!1248) (defaultEntry!3774 thiss!1248)) t!7233) tb!2839))

(declare-fun result!4795 () Bool)

(assert (=> tb!2839 (= result!4795 tp_is_empty!4329)))

(assert (=> b!185201 t!7233))

(declare-fun b_and!11157 () Bool)

(assert (= b_and!11153 (and (=> t!7233 result!4795) b_and!11157)))

(declare-fun m!212473 () Bool)

(assert (=> bm!18676 m!212473))

(declare-fun m!212475 () Bool)

(assert (=> bm!18680 m!212475))

(declare-fun m!212477 () Bool)

(assert (=> b!185203 m!212477))

(assert (=> b!185201 m!212447))

(declare-fun m!212479 () Bool)

(assert (=> b!185201 m!212479))

(declare-fun m!212481 () Bool)

(assert (=> b!185201 m!212481))

(assert (=> b!185201 m!212479))

(declare-fun m!212483 () Bool)

(assert (=> b!185201 m!212483))

(assert (=> b!185201 m!212447))

(declare-fun m!212485 () Bool)

(assert (=> b!185201 m!212485))

(assert (=> b!185201 m!212481))

(assert (=> b!185197 m!212447))

(assert (=> b!185197 m!212447))

(assert (=> b!185197 m!212457))

(declare-fun m!212487 () Bool)

(assert (=> bm!18679 m!212487))

(declare-fun m!212489 () Bool)

(assert (=> b!185190 m!212489))

(assert (=> b!185202 m!212447))

(assert (=> b!185202 m!212447))

(assert (=> b!185202 m!212457))

(assert (=> b!185191 m!212447))

(declare-fun m!212491 () Bool)

(assert (=> b!185191 m!212491))

(declare-fun m!212493 () Bool)

(assert (=> b!185191 m!212493))

(declare-fun m!212495 () Bool)

(assert (=> b!185191 m!212495))

(declare-fun m!212497 () Bool)

(assert (=> b!185191 m!212497))

(declare-fun m!212499 () Bool)

(assert (=> b!185191 m!212499))

(declare-fun m!212501 () Bool)

(assert (=> b!185191 m!212501))

(declare-fun m!212503 () Bool)

(assert (=> b!185191 m!212503))

(declare-fun m!212505 () Bool)

(assert (=> b!185191 m!212505))

(assert (=> b!185191 m!212491))

(declare-fun m!212507 () Bool)

(assert (=> b!185191 m!212507))

(declare-fun m!212509 () Bool)

(assert (=> b!185191 m!212509))

(declare-fun m!212511 () Bool)

(assert (=> b!185191 m!212511))

(declare-fun m!212513 () Bool)

(assert (=> b!185191 m!212513))

(declare-fun m!212515 () Bool)

(assert (=> b!185191 m!212515))

(declare-fun m!212517 () Bool)

(assert (=> b!185191 m!212517))

(assert (=> b!185191 m!212503))

(assert (=> b!185191 m!212495))

(assert (=> b!185191 m!212509))

(declare-fun m!212519 () Bool)

(assert (=> b!185191 m!212519))

(declare-fun m!212521 () Bool)

(assert (=> b!185191 m!212521))

(declare-fun m!212523 () Bool)

(assert (=> b!185188 m!212523))

(assert (=> bm!18682 m!212513))

(assert (=> b!185204 m!212447))

(assert (=> b!185204 m!212447))

(declare-fun m!212525 () Bool)

(assert (=> b!185204 m!212525))

(assert (=> d!55087 m!212421))

(assert (=> b!185077 d!55087))

(declare-fun b!185223 () Bool)

(declare-fun e!121892 () SeekEntryResult!629)

(assert (=> b!185223 (= e!121892 Undefined!629)))

(declare-fun d!55089 () Bool)

(declare-fun lt!91640 () SeekEntryResult!629)

(assert (=> d!55089 (and (or ((_ is Undefined!629) lt!91640) (not ((_ is Found!629) lt!91640)) (and (bvsge (index!4687 lt!91640) #b00000000000000000000000000000000) (bvslt (index!4687 lt!91640) (size!4029 (_keys!5709 thiss!1248))))) (or ((_ is Undefined!629) lt!91640) ((_ is Found!629) lt!91640) (not ((_ is MissingZero!629) lt!91640)) (and (bvsge (index!4686 lt!91640) #b00000000000000000000000000000000) (bvslt (index!4686 lt!91640) (size!4029 (_keys!5709 thiss!1248))))) (or ((_ is Undefined!629) lt!91640) ((_ is Found!629) lt!91640) ((_ is MissingZero!629) lt!91640) (not ((_ is MissingVacant!629) lt!91640)) (and (bvsge (index!4689 lt!91640) #b00000000000000000000000000000000) (bvslt (index!4689 lt!91640) (size!4029 (_keys!5709 thiss!1248))))) (or ((_ is Undefined!629) lt!91640) (ite ((_ is Found!629) lt!91640) (= (select (arr!3713 (_keys!5709 thiss!1248)) (index!4687 lt!91640)) key!828) (ite ((_ is MissingZero!629) lt!91640) (= (select (arr!3713 (_keys!5709 thiss!1248)) (index!4686 lt!91640)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!629) lt!91640) (= (select (arr!3713 (_keys!5709 thiss!1248)) (index!4689 lt!91640)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55089 (= lt!91640 e!121892)))

(declare-fun c!33249 () Bool)

(declare-fun lt!91639 () SeekEntryResult!629)

(assert (=> d!55089 (= c!33249 (and ((_ is Intermediate!629) lt!91639) (undefined!1441 lt!91639)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7861 (_ BitVec 32)) SeekEntryResult!629)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55089 (= lt!91639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8872 thiss!1248)) key!828 (_keys!5709 thiss!1248) (mask!8872 thiss!1248)))))

(assert (=> d!55089 (validMask!0 (mask!8872 thiss!1248))))

(assert (=> d!55089 (= (seekEntryOrOpen!0 key!828 (_keys!5709 thiss!1248) (mask!8872 thiss!1248)) lt!91640)))

(declare-fun b!185224 () Bool)

(declare-fun e!121894 () SeekEntryResult!629)

(assert (=> b!185224 (= e!121892 e!121894)))

(declare-fun lt!91641 () (_ BitVec 64))

(assert (=> b!185224 (= lt!91641 (select (arr!3713 (_keys!5709 thiss!1248)) (index!4688 lt!91639)))))

(declare-fun c!33248 () Bool)

(assert (=> b!185224 (= c!33248 (= lt!91641 key!828))))

(declare-fun b!185225 () Bool)

(declare-fun e!121893 () SeekEntryResult!629)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7861 (_ BitVec 32)) SeekEntryResult!629)

(assert (=> b!185225 (= e!121893 (seekKeyOrZeroReturnVacant!0 (x!20105 lt!91639) (index!4688 lt!91639) (index!4688 lt!91639) key!828 (_keys!5709 thiss!1248) (mask!8872 thiss!1248)))))

(declare-fun b!185226 () Bool)

(assert (=> b!185226 (= e!121894 (Found!629 (index!4688 lt!91639)))))

(declare-fun b!185227 () Bool)

(assert (=> b!185227 (= e!121893 (MissingZero!629 (index!4688 lt!91639)))))

(declare-fun b!185228 () Bool)

(declare-fun c!33250 () Bool)

(assert (=> b!185228 (= c!33250 (= lt!91641 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!185228 (= e!121894 e!121893)))

(assert (= (and d!55089 c!33249) b!185223))

(assert (= (and d!55089 (not c!33249)) b!185224))

(assert (= (and b!185224 c!33248) b!185226))

(assert (= (and b!185224 (not c!33248)) b!185228))

(assert (= (and b!185228 c!33250) b!185227))

(assert (= (and b!185228 (not c!33250)) b!185225))

(declare-fun m!212527 () Bool)

(assert (=> d!55089 m!212527))

(assert (=> d!55089 m!212421))

(declare-fun m!212529 () Bool)

(assert (=> d!55089 m!212529))

(declare-fun m!212531 () Bool)

(assert (=> d!55089 m!212531))

(declare-fun m!212533 () Bool)

(assert (=> d!55089 m!212533))

(declare-fun m!212535 () Bool)

(assert (=> d!55089 m!212535))

(assert (=> d!55089 m!212533))

(declare-fun m!212537 () Bool)

(assert (=> b!185224 m!212537))

(declare-fun m!212539 () Bool)

(assert (=> b!185225 m!212539))

(assert (=> b!185076 d!55089))

(declare-fun d!55091 () Bool)

(assert (=> d!55091 (= (array_inv!2401 (_keys!5709 thiss!1248)) (bvsge (size!4029 (_keys!5709 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185084 d!55091))

(declare-fun d!55093 () Bool)

(assert (=> d!55093 (= (array_inv!2402 (_values!3757 thiss!1248)) (bvsge (size!4030 (_values!3757 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185084 d!55093))

(declare-fun mapIsEmpty!7452 () Bool)

(declare-fun mapRes!7452 () Bool)

(assert (=> mapIsEmpty!7452 mapRes!7452))

(declare-fun b!185235 () Bool)

(declare-fun e!121900 () Bool)

(assert (=> b!185235 (= e!121900 tp_is_empty!4329)))

(declare-fun condMapEmpty!7452 () Bool)

(declare-fun mapDefault!7452 () ValueCell!1821)

(assert (=> mapNonEmpty!7446 (= condMapEmpty!7452 (= mapRest!7446 ((as const (Array (_ BitVec 32) ValueCell!1821)) mapDefault!7452)))))

(declare-fun e!121899 () Bool)

(assert (=> mapNonEmpty!7446 (= tp!16461 (and e!121899 mapRes!7452))))

(declare-fun b!185236 () Bool)

(assert (=> b!185236 (= e!121899 tp_is_empty!4329)))

(declare-fun mapNonEmpty!7452 () Bool)

(declare-fun tp!16470 () Bool)

(assert (=> mapNonEmpty!7452 (= mapRes!7452 (and tp!16470 e!121900))))

(declare-fun mapRest!7452 () (Array (_ BitVec 32) ValueCell!1821))

(declare-fun mapValue!7452 () ValueCell!1821)

(declare-fun mapKey!7452 () (_ BitVec 32))

(assert (=> mapNonEmpty!7452 (= mapRest!7446 (store mapRest!7452 mapKey!7452 mapValue!7452))))

(assert (= (and mapNonEmpty!7446 condMapEmpty!7452) mapIsEmpty!7452))

(assert (= (and mapNonEmpty!7446 (not condMapEmpty!7452)) mapNonEmpty!7452))

(assert (= (and mapNonEmpty!7452 ((_ is ValueCellFull!1821) mapValue!7452)) b!185235))

(assert (= (and mapNonEmpty!7446 ((_ is ValueCellFull!1821) mapDefault!7452)) b!185236))

(declare-fun m!212541 () Bool)

(assert (=> mapNonEmpty!7452 m!212541))

(declare-fun b_lambda!7245 () Bool)

(assert (= b_lambda!7243 (or (and b!185084 b_free!4557) b_lambda!7245)))

(check-sat (not d!55087) (not b!185134) (not b!185143) b_and!11157 (not mapNonEmpty!7452) (not b!185225) (not b!185124) (not b!185204) (not bm!18676) (not bm!18682) (not bm!18679) (not b_next!4557) (not b!185190) (not d!55083) (not b!185201) (not b!185191) (not d!55089) (not b!185202) (not b!185135) (not bm!18680) (not b!185188) (not b!185197) (not b_lambda!7245) (not d!55085) (not b!185136) (not b!185145) (not b!185203) tp_is_empty!4329 (not b!185127) (not bm!18661))
(check-sat b_and!11157 (not b_next!4557))
