; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22700 () Bool)

(assert start!22700)

(declare-fun b!236736 () Bool)

(declare-fun b_free!6367 () Bool)

(declare-fun b_next!6367 () Bool)

(assert (=> b!236736 (= b_free!6367 (not b_next!6367))))

(declare-fun tp!22284 () Bool)

(declare-fun b_and!13287 () Bool)

(assert (=> b!236736 (= tp!22284 b_and!13287)))

(declare-fun b!236729 () Bool)

(declare-fun res!116030 () Bool)

(declare-fun e!153727 () Bool)

(assert (=> b!236729 (=> (not res!116030) (not e!153727))))

(declare-datatypes ((V!7953 0))(
  ( (V!7954 (val!3159 Int)) )
))
(declare-datatypes ((ValueCell!2771 0))(
  ( (ValueCellFull!2771 (v!5185 V!7953)) (EmptyCell!2771) )
))
(declare-datatypes ((array!11717 0))(
  ( (array!11718 (arr!5565 (Array (_ BitVec 32) ValueCell!2771)) (size!5905 (_ BitVec 32))) )
))
(declare-datatypes ((array!11719 0))(
  ( (array!11720 (arr!5566 (Array (_ BitVec 32) (_ BitVec 64))) (size!5906 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3442 0))(
  ( (LongMapFixedSize!3443 (defaultEntry!4398 Int) (mask!10398 (_ BitVec 32)) (extraKeys!4135 (_ BitVec 32)) (zeroValue!4239 V!7953) (minValue!4239 V!7953) (_size!1770 (_ BitVec 32)) (_keys!6484 array!11719) (_values!4381 array!11717) (_vacant!1770 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3442)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!236729 (= res!116030 (validMask!0 (mask!10398 thiss!1504)))))

(declare-fun b!236730 () Bool)

(declare-fun res!116032 () Bool)

(declare-fun e!153732 () Bool)

(assert (=> b!236730 (=> (not res!116032) (not e!153732))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!236730 (= res!116032 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!236731 () Bool)

(assert (=> b!236731 (= e!153727 (and (= (size!5905 (_values!4381 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10398 thiss!1504))) (= (size!5906 (_keys!6484 thiss!1504)) (size!5905 (_values!4381 thiss!1504))) (bvslt (mask!10398 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun res!116029 () Bool)

(assert (=> start!22700 (=> (not res!116029) (not e!153732))))

(declare-fun valid!1365 (LongMapFixedSize!3442) Bool)

(assert (=> start!22700 (= res!116029 (valid!1365 thiss!1504))))

(assert (=> start!22700 e!153732))

(declare-fun e!153729 () Bool)

(assert (=> start!22700 e!153729))

(assert (=> start!22700 true))

(declare-fun b!236732 () Bool)

(assert (=> b!236732 (= e!153732 e!153727)))

(declare-fun res!116033 () Bool)

(assert (=> b!236732 (=> (not res!116033) (not e!153727))))

(declare-datatypes ((SeekEntryResult!1002 0))(
  ( (MissingZero!1002 (index!6178 (_ BitVec 32))) (Found!1002 (index!6179 (_ BitVec 32))) (Intermediate!1002 (undefined!1814 Bool) (index!6180 (_ BitVec 32)) (x!23909 (_ BitVec 32))) (Undefined!1002) (MissingVacant!1002 (index!6181 (_ BitVec 32))) )
))
(declare-fun lt!119602 () SeekEntryResult!1002)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!236732 (= res!116033 (or (= lt!119602 (MissingZero!1002 index!297)) (= lt!119602 (MissingVacant!1002 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11719 (_ BitVec 32)) SeekEntryResult!1002)

(assert (=> b!236732 (= lt!119602 (seekEntryOrOpen!0 key!932 (_keys!6484 thiss!1504) (mask!10398 thiss!1504)))))

(declare-fun b!236733 () Bool)

(declare-fun e!153730 () Bool)

(declare-fun e!153731 () Bool)

(declare-fun mapRes!10555 () Bool)

(assert (=> b!236733 (= e!153730 (and e!153731 mapRes!10555))))

(declare-fun condMapEmpty!10555 () Bool)

(declare-fun mapDefault!10555 () ValueCell!2771)

(assert (=> b!236733 (= condMapEmpty!10555 (= (arr!5565 (_values!4381 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2771)) mapDefault!10555)))))

(declare-fun mapIsEmpty!10555 () Bool)

(assert (=> mapIsEmpty!10555 mapRes!10555))

(declare-fun b!236734 () Bool)

(declare-fun e!153728 () Bool)

(declare-fun tp_is_empty!6229 () Bool)

(assert (=> b!236734 (= e!153728 tp_is_empty!6229)))

(declare-fun b!236735 () Bool)

(declare-fun res!116031 () Bool)

(assert (=> b!236735 (=> (not res!116031) (not e!153727))))

(declare-datatypes ((tuple2!4632 0))(
  ( (tuple2!4633 (_1!2327 (_ BitVec 64)) (_2!2327 V!7953)) )
))
(declare-datatypes ((List!3551 0))(
  ( (Nil!3548) (Cons!3547 (h!4201 tuple2!4632) (t!8525 List!3551)) )
))
(declare-datatypes ((ListLongMap!3535 0))(
  ( (ListLongMap!3536 (toList!1783 List!3551)) )
))
(declare-fun contains!1668 (ListLongMap!3535 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1292 (array!11719 array!11717 (_ BitVec 32) (_ BitVec 32) V!7953 V!7953 (_ BitVec 32) Int) ListLongMap!3535)

(assert (=> b!236735 (= res!116031 (not (contains!1668 (getCurrentListMap!1292 (_keys!6484 thiss!1504) (_values!4381 thiss!1504) (mask!10398 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)) key!932)))))

(declare-fun array_inv!3669 (array!11719) Bool)

(declare-fun array_inv!3670 (array!11717) Bool)

(assert (=> b!236736 (= e!153729 (and tp!22284 tp_is_empty!6229 (array_inv!3669 (_keys!6484 thiss!1504)) (array_inv!3670 (_values!4381 thiss!1504)) e!153730))))

(declare-fun b!236737 () Bool)

(assert (=> b!236737 (= e!153731 tp_is_empty!6229)))

(declare-fun mapNonEmpty!10555 () Bool)

(declare-fun tp!22285 () Bool)

(assert (=> mapNonEmpty!10555 (= mapRes!10555 (and tp!22285 e!153728))))

(declare-fun mapValue!10555 () ValueCell!2771)

(declare-fun mapKey!10555 () (_ BitVec 32))

(declare-fun mapRest!10555 () (Array (_ BitVec 32) ValueCell!2771))

(assert (=> mapNonEmpty!10555 (= (arr!5565 (_values!4381 thiss!1504)) (store mapRest!10555 mapKey!10555 mapValue!10555))))

(assert (= (and start!22700 res!116029) b!236730))

(assert (= (and b!236730 res!116032) b!236732))

(assert (= (and b!236732 res!116033) b!236735))

(assert (= (and b!236735 res!116031) b!236729))

(assert (= (and b!236729 res!116030) b!236731))

(assert (= (and b!236733 condMapEmpty!10555) mapIsEmpty!10555))

(assert (= (and b!236733 (not condMapEmpty!10555)) mapNonEmpty!10555))

(get-info :version)

(assert (= (and mapNonEmpty!10555 ((_ is ValueCellFull!2771) mapValue!10555)) b!236734))

(assert (= (and b!236733 ((_ is ValueCellFull!2771) mapDefault!10555)) b!236737))

(assert (= b!236736 b!236733))

(assert (= start!22700 b!236736))

(declare-fun m!257111 () Bool)

(assert (=> mapNonEmpty!10555 m!257111))

(declare-fun m!257113 () Bool)

(assert (=> b!236729 m!257113))

(declare-fun m!257115 () Bool)

(assert (=> b!236732 m!257115))

(declare-fun m!257117 () Bool)

(assert (=> b!236735 m!257117))

(assert (=> b!236735 m!257117))

(declare-fun m!257119 () Bool)

(assert (=> b!236735 m!257119))

(declare-fun m!257121 () Bool)

(assert (=> b!236736 m!257121))

(declare-fun m!257123 () Bool)

(assert (=> b!236736 m!257123))

(declare-fun m!257125 () Bool)

(assert (=> start!22700 m!257125))

(check-sat (not b!236736) b_and!13287 (not b!236735) (not b!236732) (not b!236729) (not start!22700) (not b_next!6367) (not mapNonEmpty!10555) tp_is_empty!6229)
(check-sat b_and!13287 (not b_next!6367))
(get-model)

(declare-fun d!59367 () Bool)

(assert (=> d!59367 (= (array_inv!3669 (_keys!6484 thiss!1504)) (bvsge (size!5906 (_keys!6484 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236736 d!59367))

(declare-fun d!59369 () Bool)

(assert (=> d!59369 (= (array_inv!3670 (_values!4381 thiss!1504)) (bvsge (size!5905 (_values!4381 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236736 d!59369))

(declare-fun d!59371 () Bool)

(declare-fun res!116070 () Bool)

(declare-fun e!153777 () Bool)

(assert (=> d!59371 (=> (not res!116070) (not e!153777))))

(declare-fun simpleValid!238 (LongMapFixedSize!3442) Bool)

(assert (=> d!59371 (= res!116070 (simpleValid!238 thiss!1504))))

(assert (=> d!59371 (= (valid!1365 thiss!1504) e!153777)))

(declare-fun b!236798 () Bool)

(declare-fun res!116071 () Bool)

(assert (=> b!236798 (=> (not res!116071) (not e!153777))))

(declare-fun arrayCountValidKeys!0 (array!11719 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!236798 (= res!116071 (= (arrayCountValidKeys!0 (_keys!6484 thiss!1504) #b00000000000000000000000000000000 (size!5906 (_keys!6484 thiss!1504))) (_size!1770 thiss!1504)))))

(declare-fun b!236799 () Bool)

(declare-fun res!116072 () Bool)

(assert (=> b!236799 (=> (not res!116072) (not e!153777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11719 (_ BitVec 32)) Bool)

(assert (=> b!236799 (= res!116072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6484 thiss!1504) (mask!10398 thiss!1504)))))

(declare-fun b!236800 () Bool)

(declare-datatypes ((List!3554 0))(
  ( (Nil!3551) (Cons!3550 (h!4204 (_ BitVec 64)) (t!8530 List!3554)) )
))
(declare-fun arrayNoDuplicates!0 (array!11719 (_ BitVec 32) List!3554) Bool)

(assert (=> b!236800 (= e!153777 (arrayNoDuplicates!0 (_keys!6484 thiss!1504) #b00000000000000000000000000000000 Nil!3551))))

(assert (= (and d!59371 res!116070) b!236798))

(assert (= (and b!236798 res!116071) b!236799))

(assert (= (and b!236799 res!116072) b!236800))

(declare-fun m!257159 () Bool)

(assert (=> d!59371 m!257159))

(declare-fun m!257161 () Bool)

(assert (=> b!236798 m!257161))

(declare-fun m!257163 () Bool)

(assert (=> b!236799 m!257163))

(declare-fun m!257165 () Bool)

(assert (=> b!236800 m!257165))

(assert (=> start!22700 d!59371))

(declare-fun b!236813 () Bool)

(declare-fun c!39462 () Bool)

(declare-fun lt!119617 () (_ BitVec 64))

(assert (=> b!236813 (= c!39462 (= lt!119617 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!153784 () SeekEntryResult!1002)

(declare-fun e!153786 () SeekEntryResult!1002)

(assert (=> b!236813 (= e!153784 e!153786)))

(declare-fun b!236814 () Bool)

(declare-fun e!153785 () SeekEntryResult!1002)

(assert (=> b!236814 (= e!153785 Undefined!1002)))

(declare-fun b!236815 () Bool)

(assert (=> b!236815 (= e!153785 e!153784)))

(declare-fun lt!119616 () SeekEntryResult!1002)

(assert (=> b!236815 (= lt!119617 (select (arr!5566 (_keys!6484 thiss!1504)) (index!6180 lt!119616)))))

(declare-fun c!39463 () Bool)

(assert (=> b!236815 (= c!39463 (= lt!119617 key!932))))

(declare-fun b!236816 () Bool)

(assert (=> b!236816 (= e!153784 (Found!1002 (index!6180 lt!119616)))))

(declare-fun d!59373 () Bool)

(declare-fun lt!119615 () SeekEntryResult!1002)

(assert (=> d!59373 (and (or ((_ is Undefined!1002) lt!119615) (not ((_ is Found!1002) lt!119615)) (and (bvsge (index!6179 lt!119615) #b00000000000000000000000000000000) (bvslt (index!6179 lt!119615) (size!5906 (_keys!6484 thiss!1504))))) (or ((_ is Undefined!1002) lt!119615) ((_ is Found!1002) lt!119615) (not ((_ is MissingZero!1002) lt!119615)) (and (bvsge (index!6178 lt!119615) #b00000000000000000000000000000000) (bvslt (index!6178 lt!119615) (size!5906 (_keys!6484 thiss!1504))))) (or ((_ is Undefined!1002) lt!119615) ((_ is Found!1002) lt!119615) ((_ is MissingZero!1002) lt!119615) (not ((_ is MissingVacant!1002) lt!119615)) (and (bvsge (index!6181 lt!119615) #b00000000000000000000000000000000) (bvslt (index!6181 lt!119615) (size!5906 (_keys!6484 thiss!1504))))) (or ((_ is Undefined!1002) lt!119615) (ite ((_ is Found!1002) lt!119615) (= (select (arr!5566 (_keys!6484 thiss!1504)) (index!6179 lt!119615)) key!932) (ite ((_ is MissingZero!1002) lt!119615) (= (select (arr!5566 (_keys!6484 thiss!1504)) (index!6178 lt!119615)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1002) lt!119615) (= (select (arr!5566 (_keys!6484 thiss!1504)) (index!6181 lt!119615)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59373 (= lt!119615 e!153785)))

(declare-fun c!39461 () Bool)

(assert (=> d!59373 (= c!39461 (and ((_ is Intermediate!1002) lt!119616) (undefined!1814 lt!119616)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11719 (_ BitVec 32)) SeekEntryResult!1002)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59373 (= lt!119616 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10398 thiss!1504)) key!932 (_keys!6484 thiss!1504) (mask!10398 thiss!1504)))))

(assert (=> d!59373 (validMask!0 (mask!10398 thiss!1504))))

(assert (=> d!59373 (= (seekEntryOrOpen!0 key!932 (_keys!6484 thiss!1504) (mask!10398 thiss!1504)) lt!119615)))

(declare-fun b!236817 () Bool)

(assert (=> b!236817 (= e!153786 (MissingZero!1002 (index!6180 lt!119616)))))

(declare-fun b!236818 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11719 (_ BitVec 32)) SeekEntryResult!1002)

(assert (=> b!236818 (= e!153786 (seekKeyOrZeroReturnVacant!0 (x!23909 lt!119616) (index!6180 lt!119616) (index!6180 lt!119616) key!932 (_keys!6484 thiss!1504) (mask!10398 thiss!1504)))))

(assert (= (and d!59373 c!39461) b!236814))

(assert (= (and d!59373 (not c!39461)) b!236815))

(assert (= (and b!236815 c!39463) b!236816))

(assert (= (and b!236815 (not c!39463)) b!236813))

(assert (= (and b!236813 c!39462) b!236817))

(assert (= (and b!236813 (not c!39462)) b!236818))

(declare-fun m!257167 () Bool)

(assert (=> b!236815 m!257167))

(declare-fun m!257169 () Bool)

(assert (=> d!59373 m!257169))

(declare-fun m!257171 () Bool)

(assert (=> d!59373 m!257171))

(declare-fun m!257173 () Bool)

(assert (=> d!59373 m!257173))

(declare-fun m!257175 () Bool)

(assert (=> d!59373 m!257175))

(assert (=> d!59373 m!257171))

(declare-fun m!257177 () Bool)

(assert (=> d!59373 m!257177))

(assert (=> d!59373 m!257113))

(declare-fun m!257179 () Bool)

(assert (=> b!236818 m!257179))

(assert (=> b!236732 d!59373))

(declare-fun d!59375 () Bool)

(declare-fun e!153792 () Bool)

(assert (=> d!59375 e!153792))

(declare-fun res!116075 () Bool)

(assert (=> d!59375 (=> res!116075 e!153792)))

(declare-fun lt!119627 () Bool)

(assert (=> d!59375 (= res!116075 (not lt!119627))))

(declare-fun lt!119626 () Bool)

(assert (=> d!59375 (= lt!119627 lt!119626)))

(declare-datatypes ((Unit!7280 0))(
  ( (Unit!7281) )
))
(declare-fun lt!119628 () Unit!7280)

(declare-fun e!153791 () Unit!7280)

(assert (=> d!59375 (= lt!119628 e!153791)))

(declare-fun c!39466 () Bool)

(assert (=> d!59375 (= c!39466 lt!119626)))

(declare-fun containsKey!263 (List!3551 (_ BitVec 64)) Bool)

(assert (=> d!59375 (= lt!119626 (containsKey!263 (toList!1783 (getCurrentListMap!1292 (_keys!6484 thiss!1504) (_values!4381 thiss!1504) (mask!10398 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504))) key!932))))

(assert (=> d!59375 (= (contains!1668 (getCurrentListMap!1292 (_keys!6484 thiss!1504) (_values!4381 thiss!1504) (mask!10398 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)) key!932) lt!119627)))

(declare-fun b!236825 () Bool)

(declare-fun lt!119629 () Unit!7280)

(assert (=> b!236825 (= e!153791 lt!119629)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!212 (List!3551 (_ BitVec 64)) Unit!7280)

(assert (=> b!236825 (= lt!119629 (lemmaContainsKeyImpliesGetValueByKeyDefined!212 (toList!1783 (getCurrentListMap!1292 (_keys!6484 thiss!1504) (_values!4381 thiss!1504) (mask!10398 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504))) key!932))))

(declare-datatypes ((Option!277 0))(
  ( (Some!276 (v!5188 V!7953)) (None!275) )
))
(declare-fun isDefined!213 (Option!277) Bool)

(declare-fun getValueByKey!271 (List!3551 (_ BitVec 64)) Option!277)

(assert (=> b!236825 (isDefined!213 (getValueByKey!271 (toList!1783 (getCurrentListMap!1292 (_keys!6484 thiss!1504) (_values!4381 thiss!1504) (mask!10398 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504))) key!932))))

(declare-fun b!236826 () Bool)

(declare-fun Unit!7282 () Unit!7280)

(assert (=> b!236826 (= e!153791 Unit!7282)))

(declare-fun b!236827 () Bool)

(assert (=> b!236827 (= e!153792 (isDefined!213 (getValueByKey!271 (toList!1783 (getCurrentListMap!1292 (_keys!6484 thiss!1504) (_values!4381 thiss!1504) (mask!10398 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504))) key!932)))))

(assert (= (and d!59375 c!39466) b!236825))

(assert (= (and d!59375 (not c!39466)) b!236826))

(assert (= (and d!59375 (not res!116075)) b!236827))

(declare-fun m!257181 () Bool)

(assert (=> d!59375 m!257181))

(declare-fun m!257183 () Bool)

(assert (=> b!236825 m!257183))

(declare-fun m!257185 () Bool)

(assert (=> b!236825 m!257185))

(assert (=> b!236825 m!257185))

(declare-fun m!257187 () Bool)

(assert (=> b!236825 m!257187))

(assert (=> b!236827 m!257185))

(assert (=> b!236827 m!257185))

(assert (=> b!236827 m!257187))

(assert (=> b!236735 d!59375))

(declare-fun b!236870 () Bool)

(declare-fun e!153819 () Unit!7280)

(declare-fun lt!119695 () Unit!7280)

(assert (=> b!236870 (= e!153819 lt!119695)))

(declare-fun lt!119693 () ListLongMap!3535)

(declare-fun getCurrentListMapNoExtraKeys!531 (array!11719 array!11717 (_ BitVec 32) (_ BitVec 32) V!7953 V!7953 (_ BitVec 32) Int) ListLongMap!3535)

(assert (=> b!236870 (= lt!119693 (getCurrentListMapNoExtraKeys!531 (_keys!6484 thiss!1504) (_values!4381 thiss!1504) (mask!10398 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)))))

(declare-fun lt!119683 () (_ BitVec 64))

(assert (=> b!236870 (= lt!119683 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119690 () (_ BitVec 64))

(assert (=> b!236870 (= lt!119690 (select (arr!5566 (_keys!6484 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119684 () Unit!7280)

(declare-fun addStillContains!191 (ListLongMap!3535 (_ BitVec 64) V!7953 (_ BitVec 64)) Unit!7280)

(assert (=> b!236870 (= lt!119684 (addStillContains!191 lt!119693 lt!119683 (zeroValue!4239 thiss!1504) lt!119690))))

(declare-fun +!648 (ListLongMap!3535 tuple2!4632) ListLongMap!3535)

(assert (=> b!236870 (contains!1668 (+!648 lt!119693 (tuple2!4633 lt!119683 (zeroValue!4239 thiss!1504))) lt!119690)))

(declare-fun lt!119686 () Unit!7280)

(assert (=> b!236870 (= lt!119686 lt!119684)))

(declare-fun lt!119694 () ListLongMap!3535)

(assert (=> b!236870 (= lt!119694 (getCurrentListMapNoExtraKeys!531 (_keys!6484 thiss!1504) (_values!4381 thiss!1504) (mask!10398 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)))))

(declare-fun lt!119685 () (_ BitVec 64))

(assert (=> b!236870 (= lt!119685 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119688 () (_ BitVec 64))

(assert (=> b!236870 (= lt!119688 (select (arr!5566 (_keys!6484 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119676 () Unit!7280)

(declare-fun addApplyDifferent!191 (ListLongMap!3535 (_ BitVec 64) V!7953 (_ BitVec 64)) Unit!7280)

(assert (=> b!236870 (= lt!119676 (addApplyDifferent!191 lt!119694 lt!119685 (minValue!4239 thiss!1504) lt!119688))))

(declare-fun apply!215 (ListLongMap!3535 (_ BitVec 64)) V!7953)

(assert (=> b!236870 (= (apply!215 (+!648 lt!119694 (tuple2!4633 lt!119685 (minValue!4239 thiss!1504))) lt!119688) (apply!215 lt!119694 lt!119688))))

(declare-fun lt!119689 () Unit!7280)

(assert (=> b!236870 (= lt!119689 lt!119676)))

(declare-fun lt!119679 () ListLongMap!3535)

(assert (=> b!236870 (= lt!119679 (getCurrentListMapNoExtraKeys!531 (_keys!6484 thiss!1504) (_values!4381 thiss!1504) (mask!10398 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)))))

(declare-fun lt!119678 () (_ BitVec 64))

(assert (=> b!236870 (= lt!119678 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119687 () (_ BitVec 64))

(assert (=> b!236870 (= lt!119687 (select (arr!5566 (_keys!6484 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119675 () Unit!7280)

(assert (=> b!236870 (= lt!119675 (addApplyDifferent!191 lt!119679 lt!119678 (zeroValue!4239 thiss!1504) lt!119687))))

(assert (=> b!236870 (= (apply!215 (+!648 lt!119679 (tuple2!4633 lt!119678 (zeroValue!4239 thiss!1504))) lt!119687) (apply!215 lt!119679 lt!119687))))

(declare-fun lt!119674 () Unit!7280)

(assert (=> b!236870 (= lt!119674 lt!119675)))

(declare-fun lt!119681 () ListLongMap!3535)

(assert (=> b!236870 (= lt!119681 (getCurrentListMapNoExtraKeys!531 (_keys!6484 thiss!1504) (_values!4381 thiss!1504) (mask!10398 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)))))

(declare-fun lt!119677 () (_ BitVec 64))

(assert (=> b!236870 (= lt!119677 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119692 () (_ BitVec 64))

(assert (=> b!236870 (= lt!119692 (select (arr!5566 (_keys!6484 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236870 (= lt!119695 (addApplyDifferent!191 lt!119681 lt!119677 (minValue!4239 thiss!1504) lt!119692))))

(assert (=> b!236870 (= (apply!215 (+!648 lt!119681 (tuple2!4633 lt!119677 (minValue!4239 thiss!1504))) lt!119692) (apply!215 lt!119681 lt!119692))))

(declare-fun bm!22005 () Bool)

(declare-fun call!22012 () ListLongMap!3535)

(declare-fun call!22011 () ListLongMap!3535)

(assert (=> bm!22005 (= call!22012 call!22011)))

(declare-fun b!236871 () Bool)

(declare-fun e!153830 () Bool)

(declare-fun e!153828 () Bool)

(assert (=> b!236871 (= e!153830 e!153828)))

(declare-fun res!116095 () Bool)

(declare-fun call!22010 () Bool)

(assert (=> b!236871 (= res!116095 call!22010)))

(assert (=> b!236871 (=> (not res!116095) (not e!153828))))

(declare-fun b!236872 () Bool)

(declare-fun e!153831 () Bool)

(declare-fun e!153829 () Bool)

(assert (=> b!236872 (= e!153831 e!153829)))

(declare-fun res!116101 () Bool)

(assert (=> b!236872 (=> (not res!116101) (not e!153829))))

(declare-fun lt!119682 () ListLongMap!3535)

(assert (=> b!236872 (= res!116101 (contains!1668 lt!119682 (select (arr!5566 (_keys!6484 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236872 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5906 (_keys!6484 thiss!1504))))))

(declare-fun b!236873 () Bool)

(declare-fun e!153820 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!236873 (= e!153820 (validKeyInArray!0 (select (arr!5566 (_keys!6484 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236874 () Bool)

(declare-fun e!153826 () Bool)

(declare-fun e!153821 () Bool)

(assert (=> b!236874 (= e!153826 e!153821)))

(declare-fun res!116099 () Bool)

(declare-fun call!22013 () Bool)

(assert (=> b!236874 (= res!116099 call!22013)))

(assert (=> b!236874 (=> (not res!116099) (not e!153821))))

(declare-fun bm!22006 () Bool)

(assert (=> bm!22006 (= call!22011 (getCurrentListMapNoExtraKeys!531 (_keys!6484 thiss!1504) (_values!4381 thiss!1504) (mask!10398 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)))))

(declare-fun b!236875 () Bool)

(declare-fun e!153824 () ListLongMap!3535)

(declare-fun call!22008 () ListLongMap!3535)

(assert (=> b!236875 (= e!153824 call!22008)))

(declare-fun b!236876 () Bool)

(declare-fun e!153822 () Bool)

(assert (=> b!236876 (= e!153822 e!153826)))

(declare-fun c!39480 () Bool)

(assert (=> b!236876 (= c!39480 (not (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!236877 () Bool)

(assert (=> b!236877 (= e!153821 (= (apply!215 lt!119682 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4239 thiss!1504)))))

(declare-fun b!236878 () Bool)

(declare-fun res!116094 () Bool)

(assert (=> b!236878 (=> (not res!116094) (not e!153822))))

(assert (=> b!236878 (= res!116094 e!153831)))

(declare-fun res!116100 () Bool)

(assert (=> b!236878 (=> res!116100 e!153831)))

(declare-fun e!153827 () Bool)

(assert (=> b!236878 (= res!116100 (not e!153827))))

(declare-fun res!116102 () Bool)

(assert (=> b!236878 (=> (not res!116102) (not e!153827))))

(assert (=> b!236878 (= res!116102 (bvslt #b00000000000000000000000000000000 (size!5906 (_keys!6484 thiss!1504))))))

(declare-fun d!59377 () Bool)

(assert (=> d!59377 e!153822))

(declare-fun res!116098 () Bool)

(assert (=> d!59377 (=> (not res!116098) (not e!153822))))

(assert (=> d!59377 (= res!116098 (or (bvsge #b00000000000000000000000000000000 (size!5906 (_keys!6484 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5906 (_keys!6484 thiss!1504))))))))

(declare-fun lt!119691 () ListLongMap!3535)

(assert (=> d!59377 (= lt!119682 lt!119691)))

(declare-fun lt!119680 () Unit!7280)

(assert (=> d!59377 (= lt!119680 e!153819)))

(declare-fun c!39479 () Bool)

(assert (=> d!59377 (= c!39479 e!153820)))

(declare-fun res!116097 () Bool)

(assert (=> d!59377 (=> (not res!116097) (not e!153820))))

(assert (=> d!59377 (= res!116097 (bvslt #b00000000000000000000000000000000 (size!5906 (_keys!6484 thiss!1504))))))

(declare-fun e!153823 () ListLongMap!3535)

(assert (=> d!59377 (= lt!119691 e!153823)))

(declare-fun c!39481 () Bool)

(assert (=> d!59377 (= c!39481 (and (not (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59377 (validMask!0 (mask!10398 thiss!1504))))

(assert (=> d!59377 (= (getCurrentListMap!1292 (_keys!6484 thiss!1504) (_values!4381 thiss!1504) (mask!10398 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)) lt!119682)))

(declare-fun b!236879 () Bool)

(assert (=> b!236879 (= e!153830 (not call!22010))))

(declare-fun b!236880 () Bool)

(declare-fun res!116096 () Bool)

(assert (=> b!236880 (=> (not res!116096) (not e!153822))))

(assert (=> b!236880 (= res!116096 e!153830)))

(declare-fun c!39484 () Bool)

(assert (=> b!236880 (= c!39484 (not (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!236881 () Bool)

(declare-fun e!153825 () ListLongMap!3535)

(assert (=> b!236881 (= e!153825 call!22008)))

(declare-fun bm!22007 () Bool)

(declare-fun call!22014 () ListLongMap!3535)

(assert (=> bm!22007 (= call!22008 call!22014)))

(declare-fun b!236882 () Bool)

(assert (=> b!236882 (= e!153826 (not call!22013))))

(declare-fun b!236883 () Bool)

(declare-fun Unit!7283 () Unit!7280)

(assert (=> b!236883 (= e!153819 Unit!7283)))

(declare-fun b!236884 () Bool)

(assert (=> b!236884 (= e!153828 (= (apply!215 lt!119682 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4239 thiss!1504)))))

(declare-fun bm!22008 () Bool)

(assert (=> bm!22008 (= call!22013 (contains!1668 lt!119682 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236885 () Bool)

(declare-fun get!2862 (ValueCell!2771 V!7953) V!7953)

(declare-fun dynLambda!549 (Int (_ BitVec 64)) V!7953)

(assert (=> b!236885 (= e!153829 (= (apply!215 lt!119682 (select (arr!5566 (_keys!6484 thiss!1504)) #b00000000000000000000000000000000)) (get!2862 (select (arr!5565 (_values!4381 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!549 (defaultEntry!4398 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!236885 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5905 (_values!4381 thiss!1504))))))

(assert (=> b!236885 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5906 (_keys!6484 thiss!1504))))))

(declare-fun b!236886 () Bool)

(assert (=> b!236886 (= e!153823 (+!648 call!22014 (tuple2!4633 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4239 thiss!1504))))))

(declare-fun bm!22009 () Bool)

(assert (=> bm!22009 (= call!22010 (contains!1668 lt!119682 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22010 () Bool)

(declare-fun call!22009 () ListLongMap!3535)

(assert (=> bm!22010 (= call!22009 call!22012)))

(declare-fun b!236887 () Bool)

(assert (=> b!236887 (= e!153827 (validKeyInArray!0 (select (arr!5566 (_keys!6484 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236888 () Bool)

(declare-fun c!39483 () Bool)

(assert (=> b!236888 (= c!39483 (and (not (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!236888 (= e!153825 e!153824)))

(declare-fun b!236889 () Bool)

(assert (=> b!236889 (= e!153824 call!22009)))

(declare-fun c!39482 () Bool)

(declare-fun bm!22011 () Bool)

(assert (=> bm!22011 (= call!22014 (+!648 (ite c!39481 call!22011 (ite c!39482 call!22012 call!22009)) (ite (or c!39481 c!39482) (tuple2!4633 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4239 thiss!1504)) (tuple2!4633 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4239 thiss!1504)))))))

(declare-fun b!236890 () Bool)

(assert (=> b!236890 (= e!153823 e!153825)))

(assert (=> b!236890 (= c!39482 (and (not (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!59377 c!39481) b!236886))

(assert (= (and d!59377 (not c!39481)) b!236890))

(assert (= (and b!236890 c!39482) b!236881))

(assert (= (and b!236890 (not c!39482)) b!236888))

(assert (= (and b!236888 c!39483) b!236875))

(assert (= (and b!236888 (not c!39483)) b!236889))

(assert (= (or b!236875 b!236889) bm!22010))

(assert (= (or b!236881 bm!22010) bm!22005))

(assert (= (or b!236881 b!236875) bm!22007))

(assert (= (or b!236886 bm!22005) bm!22006))

(assert (= (or b!236886 bm!22007) bm!22011))

(assert (= (and d!59377 res!116097) b!236873))

(assert (= (and d!59377 c!39479) b!236870))

(assert (= (and d!59377 (not c!39479)) b!236883))

(assert (= (and d!59377 res!116098) b!236878))

(assert (= (and b!236878 res!116102) b!236887))

(assert (= (and b!236878 (not res!116100)) b!236872))

(assert (= (and b!236872 res!116101) b!236885))

(assert (= (and b!236878 res!116094) b!236880))

(assert (= (and b!236880 c!39484) b!236871))

(assert (= (and b!236880 (not c!39484)) b!236879))

(assert (= (and b!236871 res!116095) b!236884))

(assert (= (or b!236871 b!236879) bm!22009))

(assert (= (and b!236880 res!116096) b!236876))

(assert (= (and b!236876 c!39480) b!236874))

(assert (= (and b!236876 (not c!39480)) b!236882))

(assert (= (and b!236874 res!116099) b!236877))

(assert (= (or b!236874 b!236882) bm!22008))

(declare-fun b_lambda!7921 () Bool)

(assert (=> (not b_lambda!7921) (not b!236885)))

(declare-fun t!8529 () Bool)

(declare-fun tb!2935 () Bool)

(assert (=> (and b!236736 (= (defaultEntry!4398 thiss!1504) (defaultEntry!4398 thiss!1504)) t!8529) tb!2935))

(declare-fun result!5143 () Bool)

(assert (=> tb!2935 (= result!5143 tp_is_empty!6229)))

(assert (=> b!236885 t!8529))

(declare-fun b_and!13293 () Bool)

(assert (= b_and!13287 (and (=> t!8529 result!5143) b_and!13293)))

(declare-fun m!257189 () Bool)

(assert (=> bm!22009 m!257189))

(declare-fun m!257191 () Bool)

(assert (=> b!236873 m!257191))

(assert (=> b!236873 m!257191))

(declare-fun m!257193 () Bool)

(assert (=> b!236873 m!257193))

(declare-fun m!257195 () Bool)

(assert (=> b!236884 m!257195))

(declare-fun m!257197 () Bool)

(assert (=> bm!22008 m!257197))

(declare-fun m!257199 () Bool)

(assert (=> bm!22006 m!257199))

(declare-fun m!257201 () Bool)

(assert (=> b!236886 m!257201))

(assert (=> b!236870 m!257199))

(declare-fun m!257203 () Bool)

(assert (=> b!236870 m!257203))

(declare-fun m!257205 () Bool)

(assert (=> b!236870 m!257205))

(declare-fun m!257207 () Bool)

(assert (=> b!236870 m!257207))

(assert (=> b!236870 m!257203))

(declare-fun m!257209 () Bool)

(assert (=> b!236870 m!257209))

(declare-fun m!257211 () Bool)

(assert (=> b!236870 m!257211))

(declare-fun m!257213 () Bool)

(assert (=> b!236870 m!257213))

(declare-fun m!257215 () Bool)

(assert (=> b!236870 m!257215))

(assert (=> b!236870 m!257205))

(declare-fun m!257217 () Bool)

(assert (=> b!236870 m!257217))

(declare-fun m!257219 () Bool)

(assert (=> b!236870 m!257219))

(declare-fun m!257221 () Bool)

(assert (=> b!236870 m!257221))

(declare-fun m!257223 () Bool)

(assert (=> b!236870 m!257223))

(declare-fun m!257225 () Bool)

(assert (=> b!236870 m!257225))

(declare-fun m!257227 () Bool)

(assert (=> b!236870 m!257227))

(assert (=> b!236870 m!257211))

(declare-fun m!257229 () Bool)

(assert (=> b!236870 m!257229))

(assert (=> b!236870 m!257191))

(assert (=> b!236870 m!257221))

(declare-fun m!257231 () Bool)

(assert (=> b!236870 m!257231))

(assert (=> b!236887 m!257191))

(assert (=> b!236887 m!257191))

(assert (=> b!236887 m!257193))

(declare-fun m!257233 () Bool)

(assert (=> bm!22011 m!257233))

(assert (=> b!236872 m!257191))

(assert (=> b!236872 m!257191))

(declare-fun m!257235 () Bool)

(assert (=> b!236872 m!257235))

(assert (=> d!59377 m!257113))

(assert (=> b!236885 m!257191))

(declare-fun m!257237 () Bool)

(assert (=> b!236885 m!257237))

(declare-fun m!257239 () Bool)

(assert (=> b!236885 m!257239))

(declare-fun m!257241 () Bool)

(assert (=> b!236885 m!257241))

(assert (=> b!236885 m!257239))

(assert (=> b!236885 m!257237))

(assert (=> b!236885 m!257191))

(declare-fun m!257243 () Bool)

(assert (=> b!236885 m!257243))

(declare-fun m!257245 () Bool)

(assert (=> b!236877 m!257245))

(assert (=> b!236735 d!59377))

(declare-fun d!59379 () Bool)

(assert (=> d!59379 (= (validMask!0 (mask!10398 thiss!1504)) (and (or (= (mask!10398 thiss!1504) #b00000000000000000000000000000111) (= (mask!10398 thiss!1504) #b00000000000000000000000000001111) (= (mask!10398 thiss!1504) #b00000000000000000000000000011111) (= (mask!10398 thiss!1504) #b00000000000000000000000000111111) (= (mask!10398 thiss!1504) #b00000000000000000000000001111111) (= (mask!10398 thiss!1504) #b00000000000000000000000011111111) (= (mask!10398 thiss!1504) #b00000000000000000000000111111111) (= (mask!10398 thiss!1504) #b00000000000000000000001111111111) (= (mask!10398 thiss!1504) #b00000000000000000000011111111111) (= (mask!10398 thiss!1504) #b00000000000000000000111111111111) (= (mask!10398 thiss!1504) #b00000000000000000001111111111111) (= (mask!10398 thiss!1504) #b00000000000000000011111111111111) (= (mask!10398 thiss!1504) #b00000000000000000111111111111111) (= (mask!10398 thiss!1504) #b00000000000000001111111111111111) (= (mask!10398 thiss!1504) #b00000000000000011111111111111111) (= (mask!10398 thiss!1504) #b00000000000000111111111111111111) (= (mask!10398 thiss!1504) #b00000000000001111111111111111111) (= (mask!10398 thiss!1504) #b00000000000011111111111111111111) (= (mask!10398 thiss!1504) #b00000000000111111111111111111111) (= (mask!10398 thiss!1504) #b00000000001111111111111111111111) (= (mask!10398 thiss!1504) #b00000000011111111111111111111111) (= (mask!10398 thiss!1504) #b00000000111111111111111111111111) (= (mask!10398 thiss!1504) #b00000001111111111111111111111111) (= (mask!10398 thiss!1504) #b00000011111111111111111111111111) (= (mask!10398 thiss!1504) #b00000111111111111111111111111111) (= (mask!10398 thiss!1504) #b00001111111111111111111111111111) (= (mask!10398 thiss!1504) #b00011111111111111111111111111111) (= (mask!10398 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10398 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!236729 d!59379))

(declare-fun mapNonEmpty!10564 () Bool)

(declare-fun mapRes!10564 () Bool)

(declare-fun tp!22300 () Bool)

(declare-fun e!153837 () Bool)

(assert (=> mapNonEmpty!10564 (= mapRes!10564 (and tp!22300 e!153837))))

(declare-fun mapKey!10564 () (_ BitVec 32))

(declare-fun mapRest!10564 () (Array (_ BitVec 32) ValueCell!2771))

(declare-fun mapValue!10564 () ValueCell!2771)

(assert (=> mapNonEmpty!10564 (= mapRest!10555 (store mapRest!10564 mapKey!10564 mapValue!10564))))

(declare-fun mapIsEmpty!10564 () Bool)

(assert (=> mapIsEmpty!10564 mapRes!10564))

(declare-fun b!236899 () Bool)

(assert (=> b!236899 (= e!153837 tp_is_empty!6229)))

(declare-fun b!236900 () Bool)

(declare-fun e!153836 () Bool)

(assert (=> b!236900 (= e!153836 tp_is_empty!6229)))

(declare-fun condMapEmpty!10564 () Bool)

(declare-fun mapDefault!10564 () ValueCell!2771)

(assert (=> mapNonEmpty!10555 (= condMapEmpty!10564 (= mapRest!10555 ((as const (Array (_ BitVec 32) ValueCell!2771)) mapDefault!10564)))))

(assert (=> mapNonEmpty!10555 (= tp!22285 (and e!153836 mapRes!10564))))

(assert (= (and mapNonEmpty!10555 condMapEmpty!10564) mapIsEmpty!10564))

(assert (= (and mapNonEmpty!10555 (not condMapEmpty!10564)) mapNonEmpty!10564))

(assert (= (and mapNonEmpty!10564 ((_ is ValueCellFull!2771) mapValue!10564)) b!236899))

(assert (= (and mapNonEmpty!10555 ((_ is ValueCellFull!2771) mapDefault!10564)) b!236900))

(declare-fun m!257247 () Bool)

(assert (=> mapNonEmpty!10564 m!257247))

(declare-fun b_lambda!7923 () Bool)

(assert (= b_lambda!7921 (or (and b!236736 b_free!6367) b_lambda!7923)))

(check-sat (not bm!22009) (not b!236800) (not bm!22011) (not b_lambda!7923) (not d!59371) (not b!236818) (not b!236825) (not b_next!6367) (not b!236887) tp_is_empty!6229 (not b!236872) (not b!236798) (not d!59375) (not b!236870) (not b!236886) (not d!59377) (not d!59373) (not bm!22006) (not b!236799) (not b!236827) (not bm!22008) (not b!236884) (not b!236885) (not mapNonEmpty!10564) (not b!236877) b_and!13293 (not b!236873))
(check-sat b_and!13293 (not b_next!6367))
