; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22852 () Bool)

(assert start!22852)

(declare-fun b!238095 () Bool)

(declare-fun b_free!6393 () Bool)

(declare-fun b_next!6393 () Bool)

(assert (=> b!238095 (= b_free!6393 (not b_next!6393))))

(declare-fun tp!22377 () Bool)

(declare-fun b_and!13355 () Bool)

(assert (=> b!238095 (= tp!22377 b_and!13355)))

(declare-fun mapIsEmpty!10608 () Bool)

(declare-fun mapRes!10608 () Bool)

(assert (=> mapIsEmpty!10608 mapRes!10608))

(declare-fun b!238086 () Bool)

(declare-fun e!154594 () Bool)

(declare-fun e!154599 () Bool)

(assert (=> b!238086 (= e!154594 (and e!154599 mapRes!10608))))

(declare-fun condMapEmpty!10608 () Bool)

(declare-datatypes ((V!7987 0))(
  ( (V!7988 (val!3172 Int)) )
))
(declare-datatypes ((ValueCell!2784 0))(
  ( (ValueCellFull!2784 (v!5208 V!7987)) (EmptyCell!2784) )
))
(declare-datatypes ((array!11785 0))(
  ( (array!11786 (arr!5596 (Array (_ BitVec 32) ValueCell!2784)) (size!5937 (_ BitVec 32))) )
))
(declare-datatypes ((array!11787 0))(
  ( (array!11788 (arr!5597 (Array (_ BitVec 32) (_ BitVec 64))) (size!5938 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3468 0))(
  ( (LongMapFixedSize!3469 (defaultEntry!4417 Int) (mask!10443 (_ BitVec 32)) (extraKeys!4154 (_ BitVec 32)) (zeroValue!4258 V!7987) (minValue!4258 V!7987) (_size!1783 (_ BitVec 32)) (_keys!6515 array!11787) (_values!4400 array!11785) (_vacant!1783 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3468)

(declare-fun mapDefault!10608 () ValueCell!2784)

(assert (=> b!238086 (= condMapEmpty!10608 (= (arr!5596 (_values!4400 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2784)) mapDefault!10608)))))

(declare-fun b!238087 () Bool)

(declare-fun res!116667 () Bool)

(declare-fun e!154593 () Bool)

(assert (=> b!238087 (=> (not res!116667) (not e!154593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11787 (_ BitVec 32)) Bool)

(assert (=> b!238087 (= res!116667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6515 thiss!1504) (mask!10443 thiss!1504)))))

(declare-fun mapNonEmpty!10608 () Bool)

(declare-fun tp!22376 () Bool)

(declare-fun e!154598 () Bool)

(assert (=> mapNonEmpty!10608 (= mapRes!10608 (and tp!22376 e!154598))))

(declare-fun mapRest!10608 () (Array (_ BitVec 32) ValueCell!2784))

(declare-fun mapKey!10608 () (_ BitVec 32))

(declare-fun mapValue!10608 () ValueCell!2784)

(assert (=> mapNonEmpty!10608 (= (arr!5596 (_values!4400 thiss!1504)) (store mapRest!10608 mapKey!10608 mapValue!10608))))

(declare-fun b!238088 () Bool)

(declare-datatypes ((List!3573 0))(
  ( (Nil!3570) (Cons!3569 (h!4225 (_ BitVec 64)) (t!8564 List!3573)) )
))
(declare-fun arrayNoDuplicates!0 (array!11787 (_ BitVec 32) List!3573) Bool)

(assert (=> b!238088 (= e!154593 (not (arrayNoDuplicates!0 (_keys!6515 thiss!1504) #b00000000000000000000000000000000 Nil!3570)))))

(declare-fun b!238089 () Bool)

(declare-fun e!154596 () Bool)

(assert (=> b!238089 (= e!154596 e!154593)))

(declare-fun res!116668 () Bool)

(assert (=> b!238089 (=> (not res!116668) (not e!154593))))

(declare-datatypes ((SeekEntryResult!1013 0))(
  ( (MissingZero!1013 (index!6222 (_ BitVec 32))) (Found!1013 (index!6223 (_ BitVec 32))) (Intermediate!1013 (undefined!1825 Bool) (index!6224 (_ BitVec 32)) (x!24009 (_ BitVec 32))) (Undefined!1013) (MissingVacant!1013 (index!6225 (_ BitVec 32))) )
))
(declare-fun lt!120399 () SeekEntryResult!1013)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238089 (= res!116668 (or (= lt!120399 (MissingZero!1013 index!297)) (= lt!120399 (MissingVacant!1013 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11787 (_ BitVec 32)) SeekEntryResult!1013)

(assert (=> b!238089 (= lt!120399 (seekEntryOrOpen!0 key!932 (_keys!6515 thiss!1504) (mask!10443 thiss!1504)))))

(declare-fun b!238090 () Bool)

(declare-fun res!116671 () Bool)

(assert (=> b!238090 (=> (not res!116671) (not e!154593))))

(assert (=> b!238090 (= res!116671 (and (= (size!5937 (_values!4400 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10443 thiss!1504))) (= (size!5938 (_keys!6515 thiss!1504)) (size!5937 (_values!4400 thiss!1504))) (bvsge (mask!10443 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4154 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4154 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!238091 () Bool)

(declare-fun tp_is_empty!6255 () Bool)

(assert (=> b!238091 (= e!154598 tp_is_empty!6255)))

(declare-fun b!238092 () Bool)

(declare-fun res!116669 () Bool)

(assert (=> b!238092 (=> (not res!116669) (not e!154593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238092 (= res!116669 (validMask!0 (mask!10443 thiss!1504)))))

(declare-fun b!238093 () Bool)

(declare-fun res!116672 () Bool)

(assert (=> b!238093 (=> (not res!116672) (not e!154596))))

(assert (=> b!238093 (= res!116672 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!154595 () Bool)

(declare-fun array_inv!3697 (array!11787) Bool)

(declare-fun array_inv!3698 (array!11785) Bool)

(assert (=> b!238095 (= e!154595 (and tp!22377 tp_is_empty!6255 (array_inv!3697 (_keys!6515 thiss!1504)) (array_inv!3698 (_values!4400 thiss!1504)) e!154594))))

(declare-fun b!238096 () Bool)

(assert (=> b!238096 (= e!154599 tp_is_empty!6255)))

(declare-fun b!238094 () Bool)

(declare-fun res!116666 () Bool)

(assert (=> b!238094 (=> (not res!116666) (not e!154593))))

(declare-datatypes ((tuple2!4676 0))(
  ( (tuple2!4677 (_1!2349 (_ BitVec 64)) (_2!2349 V!7987)) )
))
(declare-datatypes ((List!3574 0))(
  ( (Nil!3571) (Cons!3570 (h!4226 tuple2!4676) (t!8565 List!3574)) )
))
(declare-datatypes ((ListLongMap!3589 0))(
  ( (ListLongMap!3590 (toList!1810 List!3574)) )
))
(declare-fun contains!1696 (ListLongMap!3589 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1338 (array!11787 array!11785 (_ BitVec 32) (_ BitVec 32) V!7987 V!7987 (_ BitVec 32) Int) ListLongMap!3589)

(assert (=> b!238094 (= res!116666 (not (contains!1696 (getCurrentListMap!1338 (_keys!6515 thiss!1504) (_values!4400 thiss!1504) (mask!10443 thiss!1504) (extraKeys!4154 thiss!1504) (zeroValue!4258 thiss!1504) (minValue!4258 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4417 thiss!1504)) key!932)))))

(declare-fun res!116670 () Bool)

(assert (=> start!22852 (=> (not res!116670) (not e!154596))))

(declare-fun valid!1369 (LongMapFixedSize!3468) Bool)

(assert (=> start!22852 (= res!116670 (valid!1369 thiss!1504))))

(assert (=> start!22852 e!154596))

(assert (=> start!22852 e!154595))

(assert (=> start!22852 true))

(assert (= (and start!22852 res!116670) b!238093))

(assert (= (and b!238093 res!116672) b!238089))

(assert (= (and b!238089 res!116668) b!238094))

(assert (= (and b!238094 res!116666) b!238092))

(assert (= (and b!238092 res!116669) b!238090))

(assert (= (and b!238090 res!116671) b!238087))

(assert (= (and b!238087 res!116667) b!238088))

(assert (= (and b!238086 condMapEmpty!10608) mapIsEmpty!10608))

(assert (= (and b!238086 (not condMapEmpty!10608)) mapNonEmpty!10608))

(get-info :version)

(assert (= (and mapNonEmpty!10608 ((_ is ValueCellFull!2784) mapValue!10608)) b!238091))

(assert (= (and b!238086 ((_ is ValueCellFull!2784) mapDefault!10608)) b!238096))

(assert (= b!238095 b!238086))

(assert (= start!22852 b!238095))

(declare-fun m!258747 () Bool)

(assert (=> b!238087 m!258747))

(declare-fun m!258749 () Bool)

(assert (=> b!238088 m!258749))

(declare-fun m!258751 () Bool)

(assert (=> b!238092 m!258751))

(declare-fun m!258753 () Bool)

(assert (=> b!238089 m!258753))

(declare-fun m!258755 () Bool)

(assert (=> mapNonEmpty!10608 m!258755))

(declare-fun m!258757 () Bool)

(assert (=> b!238095 m!258757))

(declare-fun m!258759 () Bool)

(assert (=> b!238095 m!258759))

(declare-fun m!258761 () Bool)

(assert (=> b!238094 m!258761))

(assert (=> b!238094 m!258761))

(declare-fun m!258763 () Bool)

(assert (=> b!238094 m!258763))

(declare-fun m!258765 () Bool)

(assert (=> start!22852 m!258765))

(check-sat (not b!238095) (not b!238092) (not b!238087) tp_is_empty!6255 (not start!22852) (not b!238088) b_and!13355 (not b!238094) (not mapNonEmpty!10608) (not b!238089) (not b_next!6393))
(check-sat b_and!13355 (not b_next!6393))
(get-model)

(declare-fun b!238138 () Bool)

(declare-fun e!154629 () Bool)

(declare-fun e!154628 () Bool)

(assert (=> b!238138 (= e!154629 e!154628)))

(declare-fun lt!120411 () (_ BitVec 64))

(assert (=> b!238138 (= lt!120411 (select (arr!5597 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!7312 0))(
  ( (Unit!7313) )
))
(declare-fun lt!120409 () Unit!7312)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11787 (_ BitVec 64) (_ BitVec 32)) Unit!7312)

(assert (=> b!238138 (= lt!120409 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6515 thiss!1504) lt!120411 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!238138 (arrayContainsKey!0 (_keys!6515 thiss!1504) lt!120411 #b00000000000000000000000000000000)))

(declare-fun lt!120410 () Unit!7312)

(assert (=> b!238138 (= lt!120410 lt!120409)))

(declare-fun res!116699 () Bool)

(assert (=> b!238138 (= res!116699 (= (seekEntryOrOpen!0 (select (arr!5597 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000) (_keys!6515 thiss!1504) (mask!10443 thiss!1504)) (Found!1013 #b00000000000000000000000000000000)))))

(assert (=> b!238138 (=> (not res!116699) (not e!154628))))

(declare-fun b!238139 () Bool)

(declare-fun call!22131 () Bool)

(assert (=> b!238139 (= e!154628 call!22131)))

(declare-fun b!238140 () Bool)

(declare-fun e!154627 () Bool)

(assert (=> b!238140 (= e!154627 e!154629)))

(declare-fun c!39716 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!238140 (= c!39716 (validKeyInArray!0 (select (arr!5597 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59729 () Bool)

(declare-fun res!116698 () Bool)

(assert (=> d!59729 (=> res!116698 e!154627)))

(assert (=> d!59729 (= res!116698 (bvsge #b00000000000000000000000000000000 (size!5938 (_keys!6515 thiss!1504))))))

(assert (=> d!59729 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6515 thiss!1504) (mask!10443 thiss!1504)) e!154627)))

(declare-fun b!238141 () Bool)

(assert (=> b!238141 (= e!154629 call!22131)))

(declare-fun bm!22128 () Bool)

(assert (=> bm!22128 (= call!22131 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6515 thiss!1504) (mask!10443 thiss!1504)))))

(assert (= (and d!59729 (not res!116698)) b!238140))

(assert (= (and b!238140 c!39716) b!238138))

(assert (= (and b!238140 (not c!39716)) b!238141))

(assert (= (and b!238138 res!116699) b!238139))

(assert (= (or b!238139 b!238141) bm!22128))

(declare-fun m!258787 () Bool)

(assert (=> b!238138 m!258787))

(declare-fun m!258789 () Bool)

(assert (=> b!238138 m!258789))

(declare-fun m!258791 () Bool)

(assert (=> b!238138 m!258791))

(assert (=> b!238138 m!258787))

(declare-fun m!258793 () Bool)

(assert (=> b!238138 m!258793))

(assert (=> b!238140 m!258787))

(assert (=> b!238140 m!258787))

(declare-fun m!258795 () Bool)

(assert (=> b!238140 m!258795))

(declare-fun m!258797 () Bool)

(assert (=> bm!22128 m!258797))

(assert (=> b!238087 d!59729))

(declare-fun d!59731 () Bool)

(assert (=> d!59731 (= (array_inv!3697 (_keys!6515 thiss!1504)) (bvsge (size!5938 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238095 d!59731))

(declare-fun d!59733 () Bool)

(assert (=> d!59733 (= (array_inv!3698 (_values!4400 thiss!1504)) (bvsge (size!5937 (_values!4400 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238095 d!59733))

(declare-fun b!238152 () Bool)

(declare-fun e!154640 () Bool)

(declare-fun call!22134 () Bool)

(assert (=> b!238152 (= e!154640 call!22134)))

(declare-fun b!238153 () Bool)

(declare-fun e!154638 () Bool)

(declare-fun e!154641 () Bool)

(assert (=> b!238153 (= e!154638 e!154641)))

(declare-fun res!116706 () Bool)

(assert (=> b!238153 (=> (not res!116706) (not e!154641))))

(declare-fun e!154639 () Bool)

(assert (=> b!238153 (= res!116706 (not e!154639))))

(declare-fun res!116708 () Bool)

(assert (=> b!238153 (=> (not res!116708) (not e!154639))))

(assert (=> b!238153 (= res!116708 (validKeyInArray!0 (select (arr!5597 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238154 () Bool)

(assert (=> b!238154 (= e!154641 e!154640)))

(declare-fun c!39719 () Bool)

(assert (=> b!238154 (= c!39719 (validKeyInArray!0 (select (arr!5597 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22131 () Bool)

(assert (=> bm!22131 (= call!22134 (arrayNoDuplicates!0 (_keys!6515 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39719 (Cons!3569 (select (arr!5597 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000) Nil!3570) Nil!3570)))))

(declare-fun d!59735 () Bool)

(declare-fun res!116707 () Bool)

(assert (=> d!59735 (=> res!116707 e!154638)))

(assert (=> d!59735 (= res!116707 (bvsge #b00000000000000000000000000000000 (size!5938 (_keys!6515 thiss!1504))))))

(assert (=> d!59735 (= (arrayNoDuplicates!0 (_keys!6515 thiss!1504) #b00000000000000000000000000000000 Nil!3570) e!154638)))

(declare-fun b!238155 () Bool)

(declare-fun contains!1697 (List!3573 (_ BitVec 64)) Bool)

(assert (=> b!238155 (= e!154639 (contains!1697 Nil!3570 (select (arr!5597 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238156 () Bool)

(assert (=> b!238156 (= e!154640 call!22134)))

(assert (= (and d!59735 (not res!116707)) b!238153))

(assert (= (and b!238153 res!116708) b!238155))

(assert (= (and b!238153 res!116706) b!238154))

(assert (= (and b!238154 c!39719) b!238156))

(assert (= (and b!238154 (not c!39719)) b!238152))

(assert (= (or b!238156 b!238152) bm!22131))

(assert (=> b!238153 m!258787))

(assert (=> b!238153 m!258787))

(assert (=> b!238153 m!258795))

(assert (=> b!238154 m!258787))

(assert (=> b!238154 m!258787))

(assert (=> b!238154 m!258795))

(assert (=> bm!22131 m!258787))

(declare-fun m!258799 () Bool)

(assert (=> bm!22131 m!258799))

(assert (=> b!238155 m!258787))

(assert (=> b!238155 m!258787))

(declare-fun m!258801 () Bool)

(assert (=> b!238155 m!258801))

(assert (=> b!238088 d!59735))

(declare-fun d!59737 () Bool)

(declare-fun e!154646 () Bool)

(assert (=> d!59737 e!154646))

(declare-fun res!116711 () Bool)

(assert (=> d!59737 (=> res!116711 e!154646)))

(declare-fun lt!120421 () Bool)

(assert (=> d!59737 (= res!116711 (not lt!120421))))

(declare-fun lt!120422 () Bool)

(assert (=> d!59737 (= lt!120421 lt!120422)))

(declare-fun lt!120420 () Unit!7312)

(declare-fun e!154647 () Unit!7312)

(assert (=> d!59737 (= lt!120420 e!154647)))

(declare-fun c!39722 () Bool)

(assert (=> d!59737 (= c!39722 lt!120422)))

(declare-fun containsKey!269 (List!3574 (_ BitVec 64)) Bool)

(assert (=> d!59737 (= lt!120422 (containsKey!269 (toList!1810 (getCurrentListMap!1338 (_keys!6515 thiss!1504) (_values!4400 thiss!1504) (mask!10443 thiss!1504) (extraKeys!4154 thiss!1504) (zeroValue!4258 thiss!1504) (minValue!4258 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4417 thiss!1504))) key!932))))

(assert (=> d!59737 (= (contains!1696 (getCurrentListMap!1338 (_keys!6515 thiss!1504) (_values!4400 thiss!1504) (mask!10443 thiss!1504) (extraKeys!4154 thiss!1504) (zeroValue!4258 thiss!1504) (minValue!4258 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4417 thiss!1504)) key!932) lt!120421)))

(declare-fun b!238163 () Bool)

(declare-fun lt!120423 () Unit!7312)

(assert (=> b!238163 (= e!154647 lt!120423)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!217 (List!3574 (_ BitVec 64)) Unit!7312)

(assert (=> b!238163 (= lt!120423 (lemmaContainsKeyImpliesGetValueByKeyDefined!217 (toList!1810 (getCurrentListMap!1338 (_keys!6515 thiss!1504) (_values!4400 thiss!1504) (mask!10443 thiss!1504) (extraKeys!4154 thiss!1504) (zeroValue!4258 thiss!1504) (minValue!4258 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4417 thiss!1504))) key!932))))

(declare-datatypes ((Option!283 0))(
  ( (Some!282 (v!5210 V!7987)) (None!281) )
))
(declare-fun isDefined!218 (Option!283) Bool)

(declare-fun getValueByKey!277 (List!3574 (_ BitVec 64)) Option!283)

(assert (=> b!238163 (isDefined!218 (getValueByKey!277 (toList!1810 (getCurrentListMap!1338 (_keys!6515 thiss!1504) (_values!4400 thiss!1504) (mask!10443 thiss!1504) (extraKeys!4154 thiss!1504) (zeroValue!4258 thiss!1504) (minValue!4258 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4417 thiss!1504))) key!932))))

(declare-fun b!238164 () Bool)

(declare-fun Unit!7314 () Unit!7312)

(assert (=> b!238164 (= e!154647 Unit!7314)))

(declare-fun b!238165 () Bool)

(assert (=> b!238165 (= e!154646 (isDefined!218 (getValueByKey!277 (toList!1810 (getCurrentListMap!1338 (_keys!6515 thiss!1504) (_values!4400 thiss!1504) (mask!10443 thiss!1504) (extraKeys!4154 thiss!1504) (zeroValue!4258 thiss!1504) (minValue!4258 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4417 thiss!1504))) key!932)))))

(assert (= (and d!59737 c!39722) b!238163))

(assert (= (and d!59737 (not c!39722)) b!238164))

(assert (= (and d!59737 (not res!116711)) b!238165))

(declare-fun m!258803 () Bool)

(assert (=> d!59737 m!258803))

(declare-fun m!258805 () Bool)

(assert (=> b!238163 m!258805))

(declare-fun m!258807 () Bool)

(assert (=> b!238163 m!258807))

(assert (=> b!238163 m!258807))

(declare-fun m!258809 () Bool)

(assert (=> b!238163 m!258809))

(assert (=> b!238165 m!258807))

(assert (=> b!238165 m!258807))

(assert (=> b!238165 m!258809))

(assert (=> b!238094 d!59737))

(declare-fun bm!22146 () Bool)

(declare-fun call!22152 () Bool)

(declare-fun lt!120474 () ListLongMap!3589)

(assert (=> bm!22146 (= call!22152 (contains!1696 lt!120474 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238208 () Bool)

(declare-fun e!154682 () Bool)

(declare-fun apply!219 (ListLongMap!3589 (_ BitVec 64)) V!7987)

(declare-fun get!2886 (ValueCell!2784 V!7987) V!7987)

(declare-fun dynLambda!562 (Int (_ BitVec 64)) V!7987)

(assert (=> b!238208 (= e!154682 (= (apply!219 lt!120474 (select (arr!5597 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000)) (get!2886 (select (arr!5596 (_values!4400 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!562 (defaultEntry!4417 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!238208 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5937 (_values!4400 thiss!1504))))))

(assert (=> b!238208 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5938 (_keys!6515 thiss!1504))))))

(declare-fun b!238209 () Bool)

(declare-fun e!154684 () Bool)

(assert (=> b!238209 (= e!154684 (validKeyInArray!0 (select (arr!5597 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238210 () Bool)

(declare-fun c!39740 () Bool)

(assert (=> b!238210 (= c!39740 (and (not (= (bvand (extraKeys!4154 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4154 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!154677 () ListLongMap!3589)

(declare-fun e!154686 () ListLongMap!3589)

(assert (=> b!238210 (= e!154677 e!154686)))

(declare-fun b!238211 () Bool)

(declare-fun e!154674 () Unit!7312)

(declare-fun lt!120482 () Unit!7312)

(assert (=> b!238211 (= e!154674 lt!120482)))

(declare-fun lt!120486 () ListLongMap!3589)

(declare-fun getCurrentListMapNoExtraKeys!541 (array!11787 array!11785 (_ BitVec 32) (_ BitVec 32) V!7987 V!7987 (_ BitVec 32) Int) ListLongMap!3589)

(assert (=> b!238211 (= lt!120486 (getCurrentListMapNoExtraKeys!541 (_keys!6515 thiss!1504) (_values!4400 thiss!1504) (mask!10443 thiss!1504) (extraKeys!4154 thiss!1504) (zeroValue!4258 thiss!1504) (minValue!4258 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4417 thiss!1504)))))

(declare-fun lt!120470 () (_ BitVec 64))

(assert (=> b!238211 (= lt!120470 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120483 () (_ BitVec 64))

(assert (=> b!238211 (= lt!120483 (select (arr!5597 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120485 () Unit!7312)

(declare-fun addStillContains!195 (ListLongMap!3589 (_ BitVec 64) V!7987 (_ BitVec 64)) Unit!7312)

(assert (=> b!238211 (= lt!120485 (addStillContains!195 lt!120486 lt!120470 (zeroValue!4258 thiss!1504) lt!120483))))

(declare-fun +!646 (ListLongMap!3589 tuple2!4676) ListLongMap!3589)

(assert (=> b!238211 (contains!1696 (+!646 lt!120486 (tuple2!4677 lt!120470 (zeroValue!4258 thiss!1504))) lt!120483)))

(declare-fun lt!120488 () Unit!7312)

(assert (=> b!238211 (= lt!120488 lt!120485)))

(declare-fun lt!120477 () ListLongMap!3589)

(assert (=> b!238211 (= lt!120477 (getCurrentListMapNoExtraKeys!541 (_keys!6515 thiss!1504) (_values!4400 thiss!1504) (mask!10443 thiss!1504) (extraKeys!4154 thiss!1504) (zeroValue!4258 thiss!1504) (minValue!4258 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4417 thiss!1504)))))

(declare-fun lt!120478 () (_ BitVec 64))

(assert (=> b!238211 (= lt!120478 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120469 () (_ BitVec 64))

(assert (=> b!238211 (= lt!120469 (select (arr!5597 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120476 () Unit!7312)

(declare-fun addApplyDifferent!195 (ListLongMap!3589 (_ BitVec 64) V!7987 (_ BitVec 64)) Unit!7312)

(assert (=> b!238211 (= lt!120476 (addApplyDifferent!195 lt!120477 lt!120478 (minValue!4258 thiss!1504) lt!120469))))

(assert (=> b!238211 (= (apply!219 (+!646 lt!120477 (tuple2!4677 lt!120478 (minValue!4258 thiss!1504))) lt!120469) (apply!219 lt!120477 lt!120469))))

(declare-fun lt!120481 () Unit!7312)

(assert (=> b!238211 (= lt!120481 lt!120476)))

(declare-fun lt!120471 () ListLongMap!3589)

(assert (=> b!238211 (= lt!120471 (getCurrentListMapNoExtraKeys!541 (_keys!6515 thiss!1504) (_values!4400 thiss!1504) (mask!10443 thiss!1504) (extraKeys!4154 thiss!1504) (zeroValue!4258 thiss!1504) (minValue!4258 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4417 thiss!1504)))))

(declare-fun lt!120484 () (_ BitVec 64))

(assert (=> b!238211 (= lt!120484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120468 () (_ BitVec 64))

(assert (=> b!238211 (= lt!120468 (select (arr!5597 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120487 () Unit!7312)

(assert (=> b!238211 (= lt!120487 (addApplyDifferent!195 lt!120471 lt!120484 (zeroValue!4258 thiss!1504) lt!120468))))

(assert (=> b!238211 (= (apply!219 (+!646 lt!120471 (tuple2!4677 lt!120484 (zeroValue!4258 thiss!1504))) lt!120468) (apply!219 lt!120471 lt!120468))))

(declare-fun lt!120479 () Unit!7312)

(assert (=> b!238211 (= lt!120479 lt!120487)))

(declare-fun lt!120480 () ListLongMap!3589)

(assert (=> b!238211 (= lt!120480 (getCurrentListMapNoExtraKeys!541 (_keys!6515 thiss!1504) (_values!4400 thiss!1504) (mask!10443 thiss!1504) (extraKeys!4154 thiss!1504) (zeroValue!4258 thiss!1504) (minValue!4258 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4417 thiss!1504)))))

(declare-fun lt!120473 () (_ BitVec 64))

(assert (=> b!238211 (= lt!120473 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120475 () (_ BitVec 64))

(assert (=> b!238211 (= lt!120475 (select (arr!5597 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238211 (= lt!120482 (addApplyDifferent!195 lt!120480 lt!120473 (minValue!4258 thiss!1504) lt!120475))))

(assert (=> b!238211 (= (apply!219 (+!646 lt!120480 (tuple2!4677 lt!120473 (minValue!4258 thiss!1504))) lt!120475) (apply!219 lt!120480 lt!120475))))

(declare-fun b!238212 () Bool)

(declare-fun Unit!7315 () Unit!7312)

(assert (=> b!238212 (= e!154674 Unit!7315)))

(declare-fun d!59739 () Bool)

(declare-fun e!154678 () Bool)

(assert (=> d!59739 e!154678))

(declare-fun res!116737 () Bool)

(assert (=> d!59739 (=> (not res!116737) (not e!154678))))

(assert (=> d!59739 (= res!116737 (or (bvsge #b00000000000000000000000000000000 (size!5938 (_keys!6515 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5938 (_keys!6515 thiss!1504))))))))

(declare-fun lt!120489 () ListLongMap!3589)

(assert (=> d!59739 (= lt!120474 lt!120489)))

(declare-fun lt!120472 () Unit!7312)

(assert (=> d!59739 (= lt!120472 e!154674)))

(declare-fun c!39738 () Bool)

(assert (=> d!59739 (= c!39738 e!154684)))

(declare-fun res!116736 () Bool)

(assert (=> d!59739 (=> (not res!116736) (not e!154684))))

(assert (=> d!59739 (= res!116736 (bvslt #b00000000000000000000000000000000 (size!5938 (_keys!6515 thiss!1504))))))

(declare-fun e!154675 () ListLongMap!3589)

(assert (=> d!59739 (= lt!120489 e!154675)))

(declare-fun c!39735 () Bool)

(assert (=> d!59739 (= c!39735 (and (not (= (bvand (extraKeys!4154 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4154 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59739 (validMask!0 (mask!10443 thiss!1504))))

(assert (=> d!59739 (= (getCurrentListMap!1338 (_keys!6515 thiss!1504) (_values!4400 thiss!1504) (mask!10443 thiss!1504) (extraKeys!4154 thiss!1504) (zeroValue!4258 thiss!1504) (minValue!4258 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4417 thiss!1504)) lt!120474)))

(declare-fun b!238213 () Bool)

(declare-fun e!154681 () Bool)

(declare-fun call!22149 () Bool)

(assert (=> b!238213 (= e!154681 (not call!22149))))

(declare-fun b!238214 () Bool)

(declare-fun e!154680 () Bool)

(assert (=> b!238214 (= e!154680 (validKeyInArray!0 (select (arr!5597 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22147 () Bool)

(assert (=> bm!22147 (= call!22149 (contains!1696 lt!120474 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238215 () Bool)

(declare-fun e!154676 () Bool)

(assert (=> b!238215 (= e!154676 e!154682)))

(declare-fun res!116738 () Bool)

(assert (=> b!238215 (=> (not res!116738) (not e!154682))))

(assert (=> b!238215 (= res!116738 (contains!1696 lt!120474 (select (arr!5597 (_keys!6515 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!238215 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5938 (_keys!6515 thiss!1504))))))

(declare-fun b!238216 () Bool)

(declare-fun call!22154 () ListLongMap!3589)

(assert (=> b!238216 (= e!154686 call!22154)))

(declare-fun b!238217 () Bool)

(declare-fun e!154685 () Bool)

(assert (=> b!238217 (= e!154681 e!154685)))

(declare-fun res!116733 () Bool)

(assert (=> b!238217 (= res!116733 call!22149)))

(assert (=> b!238217 (=> (not res!116733) (not e!154685))))

(declare-fun bm!22148 () Bool)

(declare-fun call!22151 () ListLongMap!3589)

(declare-fun call!22150 () ListLongMap!3589)

(assert (=> bm!22148 (= call!22151 call!22150)))

(declare-fun b!238218 () Bool)

(declare-fun e!154683 () Bool)

(assert (=> b!238218 (= e!154678 e!154683)))

(declare-fun c!39737 () Bool)

(assert (=> b!238218 (= c!39737 (not (= (bvand (extraKeys!4154 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!238219 () Bool)

(assert (=> b!238219 (= e!154683 (not call!22152))))

(declare-fun b!238220 () Bool)

(declare-fun res!116734 () Bool)

(assert (=> b!238220 (=> (not res!116734) (not e!154678))))

(assert (=> b!238220 (= res!116734 e!154681)))

(declare-fun c!39736 () Bool)

(assert (=> b!238220 (= c!39736 (not (= (bvand (extraKeys!4154 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!238221 () Bool)

(declare-fun res!116731 () Bool)

(assert (=> b!238221 (=> (not res!116731) (not e!154678))))

(assert (=> b!238221 (= res!116731 e!154676)))

(declare-fun res!116730 () Bool)

(assert (=> b!238221 (=> res!116730 e!154676)))

(assert (=> b!238221 (= res!116730 (not e!154680))))

(declare-fun res!116735 () Bool)

(assert (=> b!238221 (=> (not res!116735) (not e!154680))))

(assert (=> b!238221 (= res!116735 (bvslt #b00000000000000000000000000000000 (size!5938 (_keys!6515 thiss!1504))))))

(declare-fun b!238222 () Bool)

(declare-fun call!22155 () ListLongMap!3589)

(assert (=> b!238222 (= e!154675 (+!646 call!22155 (tuple2!4677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4258 thiss!1504))))))

(declare-fun b!238223 () Bool)

(assert (=> b!238223 (= e!154675 e!154677)))

(declare-fun c!39739 () Bool)

(assert (=> b!238223 (= c!39739 (and (not (= (bvand (extraKeys!4154 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4154 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22149 () Bool)

(declare-fun call!22153 () ListLongMap!3589)

(assert (=> bm!22149 (= call!22153 call!22151)))

(declare-fun b!238224 () Bool)

(declare-fun e!154679 () Bool)

(assert (=> b!238224 (= e!154683 e!154679)))

(declare-fun res!116732 () Bool)

(assert (=> b!238224 (= res!116732 call!22152)))

(assert (=> b!238224 (=> (not res!116732) (not e!154679))))

(declare-fun bm!22150 () Bool)

(assert (=> bm!22150 (= call!22150 (getCurrentListMapNoExtraKeys!541 (_keys!6515 thiss!1504) (_values!4400 thiss!1504) (mask!10443 thiss!1504) (extraKeys!4154 thiss!1504) (zeroValue!4258 thiss!1504) (minValue!4258 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4417 thiss!1504)))))

(declare-fun b!238225 () Bool)

(assert (=> b!238225 (= e!154685 (= (apply!219 lt!120474 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4258 thiss!1504)))))

(declare-fun bm!22151 () Bool)

(assert (=> bm!22151 (= call!22155 (+!646 (ite c!39735 call!22150 (ite c!39739 call!22151 call!22153)) (ite (or c!39735 c!39739) (tuple2!4677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4258 thiss!1504)) (tuple2!4677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4258 thiss!1504)))))))

(declare-fun b!238226 () Bool)

(assert (=> b!238226 (= e!154686 call!22153)))

(declare-fun b!238227 () Bool)

(assert (=> b!238227 (= e!154679 (= (apply!219 lt!120474 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4258 thiss!1504)))))

(declare-fun bm!22152 () Bool)

(assert (=> bm!22152 (= call!22154 call!22155)))

(declare-fun b!238228 () Bool)

(assert (=> b!238228 (= e!154677 call!22154)))

(assert (= (and d!59739 c!39735) b!238222))

(assert (= (and d!59739 (not c!39735)) b!238223))

(assert (= (and b!238223 c!39739) b!238228))

(assert (= (and b!238223 (not c!39739)) b!238210))

(assert (= (and b!238210 c!39740) b!238216))

(assert (= (and b!238210 (not c!39740)) b!238226))

(assert (= (or b!238216 b!238226) bm!22149))

(assert (= (or b!238228 bm!22149) bm!22148))

(assert (= (or b!238228 b!238216) bm!22152))

(assert (= (or b!238222 bm!22148) bm!22150))

(assert (= (or b!238222 bm!22152) bm!22151))

(assert (= (and d!59739 res!116736) b!238209))

(assert (= (and d!59739 c!39738) b!238211))

(assert (= (and d!59739 (not c!39738)) b!238212))

(assert (= (and d!59739 res!116737) b!238221))

(assert (= (and b!238221 res!116735) b!238214))

(assert (= (and b!238221 (not res!116730)) b!238215))

(assert (= (and b!238215 res!116738) b!238208))

(assert (= (and b!238221 res!116731) b!238220))

(assert (= (and b!238220 c!39736) b!238217))

(assert (= (and b!238220 (not c!39736)) b!238213))

(assert (= (and b!238217 res!116733) b!238225))

(assert (= (or b!238217 b!238213) bm!22147))

(assert (= (and b!238220 res!116734) b!238218))

(assert (= (and b!238218 c!39737) b!238224))

(assert (= (and b!238218 (not c!39737)) b!238219))

(assert (= (and b!238224 res!116732) b!238227))

(assert (= (or b!238224 b!238219) bm!22146))

(declare-fun b_lambda!7971 () Bool)

(assert (=> (not b_lambda!7971) (not b!238208)))

(declare-fun t!8568 () Bool)

(declare-fun tb!2951 () Bool)

(assert (=> (and b!238095 (= (defaultEntry!4417 thiss!1504) (defaultEntry!4417 thiss!1504)) t!8568) tb!2951))

(declare-fun result!5175 () Bool)

(assert (=> tb!2951 (= result!5175 tp_is_empty!6255)))

(assert (=> b!238208 t!8568))

(declare-fun b_and!13359 () Bool)

(assert (= b_and!13355 (and (=> t!8568 result!5175) b_and!13359)))

(declare-fun m!258811 () Bool)

(assert (=> bm!22147 m!258811))

(assert (=> b!238215 m!258787))

(assert (=> b!238215 m!258787))

(declare-fun m!258813 () Bool)

(assert (=> b!238215 m!258813))

(declare-fun m!258815 () Bool)

(assert (=> bm!22150 m!258815))

(declare-fun m!258817 () Bool)

(assert (=> bm!22146 m!258817))

(declare-fun m!258819 () Bool)

(assert (=> b!238222 m!258819))

(declare-fun m!258821 () Bool)

(assert (=> b!238208 m!258821))

(assert (=> b!238208 m!258787))

(declare-fun m!258823 () Bool)

(assert (=> b!238208 m!258823))

(assert (=> b!238208 m!258787))

(declare-fun m!258825 () Bool)

(assert (=> b!238208 m!258825))

(assert (=> b!238208 m!258825))

(assert (=> b!238208 m!258821))

(declare-fun m!258827 () Bool)

(assert (=> b!238208 m!258827))

(assert (=> b!238214 m!258787))

(assert (=> b!238214 m!258787))

(assert (=> b!238214 m!258795))

(declare-fun m!258829 () Bool)

(assert (=> b!238227 m!258829))

(assert (=> b!238209 m!258787))

(assert (=> b!238209 m!258787))

(assert (=> b!238209 m!258795))

(declare-fun m!258831 () Bool)

(assert (=> bm!22151 m!258831))

(assert (=> d!59739 m!258751))

(declare-fun m!258833 () Bool)

(assert (=> b!238225 m!258833))

(declare-fun m!258835 () Bool)

(assert (=> b!238211 m!258835))

(declare-fun m!258837 () Bool)

(assert (=> b!238211 m!258837))

(declare-fun m!258839 () Bool)

(assert (=> b!238211 m!258839))

(declare-fun m!258841 () Bool)

(assert (=> b!238211 m!258841))

(declare-fun m!258843 () Bool)

(assert (=> b!238211 m!258843))

(declare-fun m!258845 () Bool)

(assert (=> b!238211 m!258845))

(declare-fun m!258847 () Bool)

(assert (=> b!238211 m!258847))

(declare-fun m!258849 () Bool)

(assert (=> b!238211 m!258849))

(assert (=> b!238211 m!258839))

(declare-fun m!258851 () Bool)

(assert (=> b!238211 m!258851))

(declare-fun m!258853 () Bool)

(assert (=> b!238211 m!258853))

(declare-fun m!258855 () Bool)

(assert (=> b!238211 m!258855))

(assert (=> b!238211 m!258815))

(assert (=> b!238211 m!258847))

(declare-fun m!258857 () Bool)

(assert (=> b!238211 m!258857))

(assert (=> b!238211 m!258787))

(declare-fun m!258859 () Bool)

(assert (=> b!238211 m!258859))

(assert (=> b!238211 m!258843))

(declare-fun m!258861 () Bool)

(assert (=> b!238211 m!258861))

(assert (=> b!238211 m!258861))

(declare-fun m!258863 () Bool)

(assert (=> b!238211 m!258863))

(assert (=> b!238094 d!59739))

(declare-fun e!154693 () SeekEntryResult!1013)

(declare-fun lt!120498 () SeekEntryResult!1013)

(declare-fun b!238243 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11787 (_ BitVec 32)) SeekEntryResult!1013)

(assert (=> b!238243 (= e!154693 (seekKeyOrZeroReturnVacant!0 (x!24009 lt!120498) (index!6224 lt!120498) (index!6224 lt!120498) key!932 (_keys!6515 thiss!1504) (mask!10443 thiss!1504)))))

(declare-fun b!238244 () Bool)

(declare-fun c!39749 () Bool)

(declare-fun lt!120497 () (_ BitVec 64))

(assert (=> b!238244 (= c!39749 (= lt!120497 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!154695 () SeekEntryResult!1013)

(assert (=> b!238244 (= e!154695 e!154693)))

(declare-fun b!238245 () Bool)

(assert (=> b!238245 (= e!154695 (Found!1013 (index!6224 lt!120498)))))

(declare-fun b!238246 () Bool)

(declare-fun e!154694 () SeekEntryResult!1013)

(assert (=> b!238246 (= e!154694 e!154695)))

(assert (=> b!238246 (= lt!120497 (select (arr!5597 (_keys!6515 thiss!1504)) (index!6224 lt!120498)))))

(declare-fun c!39747 () Bool)

(assert (=> b!238246 (= c!39747 (= lt!120497 key!932))))

(declare-fun b!238247 () Bool)

(assert (=> b!238247 (= e!154694 Undefined!1013)))

(declare-fun d!59741 () Bool)

(declare-fun lt!120496 () SeekEntryResult!1013)

(assert (=> d!59741 (and (or ((_ is Undefined!1013) lt!120496) (not ((_ is Found!1013) lt!120496)) (and (bvsge (index!6223 lt!120496) #b00000000000000000000000000000000) (bvslt (index!6223 lt!120496) (size!5938 (_keys!6515 thiss!1504))))) (or ((_ is Undefined!1013) lt!120496) ((_ is Found!1013) lt!120496) (not ((_ is MissingZero!1013) lt!120496)) (and (bvsge (index!6222 lt!120496) #b00000000000000000000000000000000) (bvslt (index!6222 lt!120496) (size!5938 (_keys!6515 thiss!1504))))) (or ((_ is Undefined!1013) lt!120496) ((_ is Found!1013) lt!120496) ((_ is MissingZero!1013) lt!120496) (not ((_ is MissingVacant!1013) lt!120496)) (and (bvsge (index!6225 lt!120496) #b00000000000000000000000000000000) (bvslt (index!6225 lt!120496) (size!5938 (_keys!6515 thiss!1504))))) (or ((_ is Undefined!1013) lt!120496) (ite ((_ is Found!1013) lt!120496) (= (select (arr!5597 (_keys!6515 thiss!1504)) (index!6223 lt!120496)) key!932) (ite ((_ is MissingZero!1013) lt!120496) (= (select (arr!5597 (_keys!6515 thiss!1504)) (index!6222 lt!120496)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1013) lt!120496) (= (select (arr!5597 (_keys!6515 thiss!1504)) (index!6225 lt!120496)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59741 (= lt!120496 e!154694)))

(declare-fun c!39748 () Bool)

(assert (=> d!59741 (= c!39748 (and ((_ is Intermediate!1013) lt!120498) (undefined!1825 lt!120498)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11787 (_ BitVec 32)) SeekEntryResult!1013)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59741 (= lt!120498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10443 thiss!1504)) key!932 (_keys!6515 thiss!1504) (mask!10443 thiss!1504)))))

(assert (=> d!59741 (validMask!0 (mask!10443 thiss!1504))))

(assert (=> d!59741 (= (seekEntryOrOpen!0 key!932 (_keys!6515 thiss!1504) (mask!10443 thiss!1504)) lt!120496)))

(declare-fun b!238248 () Bool)

(assert (=> b!238248 (= e!154693 (MissingZero!1013 (index!6224 lt!120498)))))

(assert (= (and d!59741 c!39748) b!238247))

(assert (= (and d!59741 (not c!39748)) b!238246))

(assert (= (and b!238246 c!39747) b!238245))

(assert (= (and b!238246 (not c!39747)) b!238244))

(assert (= (and b!238244 c!39749) b!238248))

(assert (= (and b!238244 (not c!39749)) b!238243))

(declare-fun m!258865 () Bool)

(assert (=> b!238243 m!258865))

(declare-fun m!258867 () Bool)

(assert (=> b!238246 m!258867))

(declare-fun m!258869 () Bool)

(assert (=> d!59741 m!258869))

(declare-fun m!258871 () Bool)

(assert (=> d!59741 m!258871))

(declare-fun m!258873 () Bool)

(assert (=> d!59741 m!258873))

(assert (=> d!59741 m!258751))

(declare-fun m!258875 () Bool)

(assert (=> d!59741 m!258875))

(assert (=> d!59741 m!258869))

(declare-fun m!258877 () Bool)

(assert (=> d!59741 m!258877))

(assert (=> b!238089 d!59741))

(declare-fun d!59743 () Bool)

(assert (=> d!59743 (= (validMask!0 (mask!10443 thiss!1504)) (and (or (= (mask!10443 thiss!1504) #b00000000000000000000000000000111) (= (mask!10443 thiss!1504) #b00000000000000000000000000001111) (= (mask!10443 thiss!1504) #b00000000000000000000000000011111) (= (mask!10443 thiss!1504) #b00000000000000000000000000111111) (= (mask!10443 thiss!1504) #b00000000000000000000000001111111) (= (mask!10443 thiss!1504) #b00000000000000000000000011111111) (= (mask!10443 thiss!1504) #b00000000000000000000000111111111) (= (mask!10443 thiss!1504) #b00000000000000000000001111111111) (= (mask!10443 thiss!1504) #b00000000000000000000011111111111) (= (mask!10443 thiss!1504) #b00000000000000000000111111111111) (= (mask!10443 thiss!1504) #b00000000000000000001111111111111) (= (mask!10443 thiss!1504) #b00000000000000000011111111111111) (= (mask!10443 thiss!1504) #b00000000000000000111111111111111) (= (mask!10443 thiss!1504) #b00000000000000001111111111111111) (= (mask!10443 thiss!1504) #b00000000000000011111111111111111) (= (mask!10443 thiss!1504) #b00000000000000111111111111111111) (= (mask!10443 thiss!1504) #b00000000000001111111111111111111) (= (mask!10443 thiss!1504) #b00000000000011111111111111111111) (= (mask!10443 thiss!1504) #b00000000000111111111111111111111) (= (mask!10443 thiss!1504) #b00000000001111111111111111111111) (= (mask!10443 thiss!1504) #b00000000011111111111111111111111) (= (mask!10443 thiss!1504) #b00000000111111111111111111111111) (= (mask!10443 thiss!1504) #b00000001111111111111111111111111) (= (mask!10443 thiss!1504) #b00000011111111111111111111111111) (= (mask!10443 thiss!1504) #b00000111111111111111111111111111) (= (mask!10443 thiss!1504) #b00001111111111111111111111111111) (= (mask!10443 thiss!1504) #b00011111111111111111111111111111) (= (mask!10443 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10443 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!238092 d!59743))

(declare-fun d!59745 () Bool)

(declare-fun res!116745 () Bool)

(declare-fun e!154698 () Bool)

(assert (=> d!59745 (=> (not res!116745) (not e!154698))))

(declare-fun simpleValid!242 (LongMapFixedSize!3468) Bool)

(assert (=> d!59745 (= res!116745 (simpleValid!242 thiss!1504))))

(assert (=> d!59745 (= (valid!1369 thiss!1504) e!154698)))

(declare-fun b!238255 () Bool)

(declare-fun res!116746 () Bool)

(assert (=> b!238255 (=> (not res!116746) (not e!154698))))

(declare-fun arrayCountValidKeys!0 (array!11787 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!238255 (= res!116746 (= (arrayCountValidKeys!0 (_keys!6515 thiss!1504) #b00000000000000000000000000000000 (size!5938 (_keys!6515 thiss!1504))) (_size!1783 thiss!1504)))))

(declare-fun b!238256 () Bool)

(declare-fun res!116747 () Bool)

(assert (=> b!238256 (=> (not res!116747) (not e!154698))))

(assert (=> b!238256 (= res!116747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6515 thiss!1504) (mask!10443 thiss!1504)))))

(declare-fun b!238257 () Bool)

(assert (=> b!238257 (= e!154698 (arrayNoDuplicates!0 (_keys!6515 thiss!1504) #b00000000000000000000000000000000 Nil!3570))))

(assert (= (and d!59745 res!116745) b!238255))

(assert (= (and b!238255 res!116746) b!238256))

(assert (= (and b!238256 res!116747) b!238257))

(declare-fun m!258879 () Bool)

(assert (=> d!59745 m!258879))

(declare-fun m!258881 () Bool)

(assert (=> b!238255 m!258881))

(assert (=> b!238256 m!258747))

(assert (=> b!238257 m!258749))

(assert (=> start!22852 d!59745))

(declare-fun mapIsEmpty!10614 () Bool)

(declare-fun mapRes!10614 () Bool)

(assert (=> mapIsEmpty!10614 mapRes!10614))

(declare-fun b!238265 () Bool)

(declare-fun e!154704 () Bool)

(assert (=> b!238265 (= e!154704 tp_is_empty!6255)))

(declare-fun mapNonEmpty!10614 () Bool)

(declare-fun tp!22386 () Bool)

(declare-fun e!154703 () Bool)

(assert (=> mapNonEmpty!10614 (= mapRes!10614 (and tp!22386 e!154703))))

(declare-fun mapValue!10614 () ValueCell!2784)

(declare-fun mapRest!10614 () (Array (_ BitVec 32) ValueCell!2784))

(declare-fun mapKey!10614 () (_ BitVec 32))

(assert (=> mapNonEmpty!10614 (= mapRest!10608 (store mapRest!10614 mapKey!10614 mapValue!10614))))

(declare-fun b!238264 () Bool)

(assert (=> b!238264 (= e!154703 tp_is_empty!6255)))

(declare-fun condMapEmpty!10614 () Bool)

(declare-fun mapDefault!10614 () ValueCell!2784)

(assert (=> mapNonEmpty!10608 (= condMapEmpty!10614 (= mapRest!10608 ((as const (Array (_ BitVec 32) ValueCell!2784)) mapDefault!10614)))))

(assert (=> mapNonEmpty!10608 (= tp!22376 (and e!154704 mapRes!10614))))

(assert (= (and mapNonEmpty!10608 condMapEmpty!10614) mapIsEmpty!10614))

(assert (= (and mapNonEmpty!10608 (not condMapEmpty!10614)) mapNonEmpty!10614))

(assert (= (and mapNonEmpty!10614 ((_ is ValueCellFull!2784) mapValue!10614)) b!238264))

(assert (= (and mapNonEmpty!10608 ((_ is ValueCellFull!2784) mapDefault!10614)) b!238265))

(declare-fun m!258883 () Bool)

(assert (=> mapNonEmpty!10614 m!258883))

(declare-fun b_lambda!7973 () Bool)

(assert (= b_lambda!7971 (or (and b!238095 b_free!6393) b_lambda!7973)))

(check-sat b_and!13359 (not b!238155) (not b!238153) (not d!59745) (not b!238140) (not b!238257) (not d!59737) (not b!238208) (not bm!22151) (not b!238209) (not b_next!6393) (not b_lambda!7973) (not b!238255) (not b!238215) (not b!238154) (not b!238243) (not b!238227) (not bm!22147) (not b!238256) (not b!238222) (not b!238163) (not bm!22146) (not d!59741) (not d!59739) (not bm!22128) (not mapNonEmpty!10614) (not b!238214) tp_is_empty!6255 (not b!238211) (not b!238138) (not b!238165) (not bm!22131) (not bm!22150) (not b!238225))
(check-sat b_and!13359 (not b_next!6393))
