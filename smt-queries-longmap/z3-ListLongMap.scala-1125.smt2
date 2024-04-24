; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23088 () Bool)

(assert start!23088)

(declare-fun b!242020 () Bool)

(declare-fun b_free!6499 () Bool)

(declare-fun b_next!6499 () Bool)

(assert (=> b!242020 (= b_free!6499 (not b_next!6499))))

(declare-fun tp!22708 () Bool)

(declare-fun b_and!13487 () Bool)

(assert (=> b!242020 (= tp!22708 b_and!13487)))

(declare-fun mapNonEmpty!10780 () Bool)

(declare-fun mapRes!10780 () Bool)

(declare-fun tp!22707 () Bool)

(declare-fun e!157061 () Bool)

(assert (=> mapNonEmpty!10780 (= mapRes!10780 (and tp!22707 e!157061))))

(declare-fun mapKey!10780 () (_ BitVec 32))

(declare-datatypes ((V!8129 0))(
  ( (V!8130 (val!3225 Int)) )
))
(declare-datatypes ((ValueCell!2837 0))(
  ( (ValueCellFull!2837 (v!5266 V!8129)) (EmptyCell!2837) )
))
(declare-datatypes ((array!12003 0))(
  ( (array!12004 (arr!5701 (Array (_ BitVec 32) ValueCell!2837)) (size!6043 (_ BitVec 32))) )
))
(declare-datatypes ((array!12005 0))(
  ( (array!12006 (arr!5702 (Array (_ BitVec 32) (_ BitVec 64))) (size!6044 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3574 0))(
  ( (LongMapFixedSize!3575 (defaultEntry!4484 Int) (mask!10561 (_ BitVec 32)) (extraKeys!4221 (_ BitVec 32)) (zeroValue!4325 V!8129) (minValue!4325 V!8129) (_size!1836 (_ BitVec 32)) (_keys!6591 array!12005) (_values!4467 array!12003) (_vacant!1836 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3574)

(declare-fun mapValue!10780 () ValueCell!2837)

(declare-fun mapRest!10780 () (Array (_ BitVec 32) ValueCell!2837))

(assert (=> mapNonEmpty!10780 (= (arr!5701 (_values!4467 thiss!1504)) (store mapRest!10780 mapKey!10780 mapValue!10780))))

(declare-fun b!242006 () Bool)

(declare-fun e!157056 () Bool)

(declare-fun e!157065 () Bool)

(assert (=> b!242006 (= e!157056 e!157065)))

(declare-fun res!118599 () Bool)

(assert (=> b!242006 (=> (not res!118599) (not e!157065))))

(declare-datatypes ((SeekEntryResult!1028 0))(
  ( (MissingZero!1028 (index!6282 (_ BitVec 32))) (Found!1028 (index!6283 (_ BitVec 32))) (Intermediate!1028 (undefined!1840 Bool) (index!6284 (_ BitVec 32)) (x!24216 (_ BitVec 32))) (Undefined!1028) (MissingVacant!1028 (index!6285 (_ BitVec 32))) )
))
(declare-fun lt!121637 () SeekEntryResult!1028)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!242006 (= res!118599 (or (= lt!121637 (MissingZero!1028 index!297)) (= lt!121637 (MissingVacant!1028 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12005 (_ BitVec 32)) SeekEntryResult!1028)

(assert (=> b!242006 (= lt!121637 (seekEntryOrOpen!0 key!932 (_keys!6591 thiss!1504) (mask!10561 thiss!1504)))))

(declare-fun b!242007 () Bool)

(declare-datatypes ((Unit!7436 0))(
  ( (Unit!7437) )
))
(declare-fun e!157057 () Unit!7436)

(declare-fun Unit!7438 () Unit!7436)

(assert (=> b!242007 (= e!157057 Unit!7438)))

(declare-fun lt!121636 () Unit!7436)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!353 (array!12005 array!12003 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 64) Int) Unit!7436)

(assert (=> b!242007 (= lt!121636 (lemmaInListMapThenSeekEntryOrOpenFindsIt!353 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 (defaultEntry!4484 thiss!1504)))))

(assert (=> b!242007 false))

(declare-fun b!242008 () Bool)

(declare-fun e!157052 () Bool)

(declare-datatypes ((List!3550 0))(
  ( (Nil!3547) (Cons!3546 (h!4203 (_ BitVec 64)) (t!8541 List!3550)) )
))
(declare-fun noDuplicate!86 (List!3550) Bool)

(assert (=> b!242008 (= e!157052 (not (noDuplicate!86 Nil!3547)))))

(declare-fun b!242009 () Bool)

(declare-fun e!157062 () Bool)

(declare-fun tp_is_empty!6361 () Bool)

(assert (=> b!242009 (= e!157062 tp_is_empty!6361)))

(declare-fun b!242010 () Bool)

(declare-fun e!157055 () Bool)

(assert (=> b!242010 (= e!157065 e!157055)))

(declare-fun res!118595 () Bool)

(assert (=> b!242010 (=> (not res!118595) (not e!157055))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242010 (= res!118595 (inRange!0 index!297 (mask!10561 thiss!1504)))))

(declare-fun lt!121635 () Unit!7436)

(assert (=> b!242010 (= lt!121635 e!157057)))

(declare-fun c!40374 () Bool)

(declare-datatypes ((tuple2!4680 0))(
  ( (tuple2!4681 (_1!2351 (_ BitVec 64)) (_2!2351 V!8129)) )
))
(declare-datatypes ((List!3551 0))(
  ( (Nil!3548) (Cons!3547 (h!4204 tuple2!4680) (t!8542 List!3551)) )
))
(declare-datatypes ((ListLongMap!3595 0))(
  ( (ListLongMap!3596 (toList!1813 List!3551)) )
))
(declare-fun contains!1717 (ListLongMap!3595 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1345 (array!12005 array!12003 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 32) Int) ListLongMap!3595)

(assert (=> b!242010 (= c!40374 (contains!1717 (getCurrentListMap!1345 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)) key!932))))

(declare-fun b!242011 () Bool)

(declare-fun lt!121634 () Unit!7436)

(assert (=> b!242011 (= e!157057 lt!121634)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!345 (array!12005 array!12003 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 64) Int) Unit!7436)

(assert (=> b!242011 (= lt!121634 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!345 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 (defaultEntry!4484 thiss!1504)))))

(declare-fun c!40372 () Bool)

(get-info :version)

(assert (=> b!242011 (= c!40372 ((_ is MissingZero!1028) lt!121637))))

(declare-fun e!157063 () Bool)

(assert (=> b!242011 e!157063))

(declare-fun b!242012 () Bool)

(declare-fun e!157066 () Bool)

(assert (=> b!242012 (= e!157066 ((_ is Undefined!1028) lt!121637))))

(declare-fun b!242013 () Bool)

(declare-fun e!157053 () Bool)

(assert (=> b!242013 (= e!157066 e!157053)))

(declare-fun res!118596 () Bool)

(declare-fun call!22518 () Bool)

(assert (=> b!242013 (= res!118596 call!22518)))

(assert (=> b!242013 (=> (not res!118596) (not e!157053))))

(declare-fun b!242014 () Bool)

(declare-fun res!118591 () Bool)

(assert (=> b!242014 (= res!118591 (= (select (arr!5702 (_keys!6591 thiss!1504)) (index!6285 lt!121637)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242014 (=> (not res!118591) (not e!157053))))

(declare-fun b!242015 () Bool)

(declare-fun e!157059 () Unit!7436)

(declare-fun Unit!7439 () Unit!7436)

(assert (=> b!242015 (= e!157059 Unit!7439)))

(declare-fun lt!121638 () Unit!7436)

(declare-fun lemmaArrayContainsKeyThenInListMap!167 (array!12005 array!12003 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 64) (_ BitVec 32) Int) Unit!7436)

(assert (=> b!242015 (= lt!121638 (lemmaArrayContainsKeyThenInListMap!167 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)))))

(assert (=> b!242015 false))

(declare-fun b!242016 () Bool)

(declare-fun Unit!7440 () Unit!7436)

(assert (=> b!242016 (= e!157059 Unit!7440)))

(declare-fun b!242017 () Bool)

(assert (=> b!242017 (= e!157061 tp_is_empty!6361)))

(declare-fun b!242018 () Bool)

(declare-fun call!22517 () Bool)

(assert (=> b!242018 (= e!157053 (not call!22517))))

(declare-fun b!242019 () Bool)

(declare-fun res!118592 () Bool)

(assert (=> b!242019 (=> (not res!118592) (not e!157056))))

(assert (=> b!242019 (= res!118592 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!157058 () Bool)

(declare-fun e!157054 () Bool)

(declare-fun array_inv!3747 (array!12005) Bool)

(declare-fun array_inv!3748 (array!12003) Bool)

(assert (=> b!242020 (= e!157058 (and tp!22708 tp_is_empty!6361 (array_inv!3747 (_keys!6591 thiss!1504)) (array_inv!3748 (_values!4467 thiss!1504)) e!157054))))

(declare-fun b!242021 () Bool)

(declare-fun c!40373 () Bool)

(assert (=> b!242021 (= c!40373 ((_ is MissingVacant!1028) lt!121637))))

(assert (=> b!242021 (= e!157063 e!157066)))

(declare-fun b!242022 () Bool)

(declare-fun res!118598 () Bool)

(declare-fun e!157060 () Bool)

(assert (=> b!242022 (=> (not res!118598) (not e!157060))))

(assert (=> b!242022 (= res!118598 call!22518)))

(assert (=> b!242022 (= e!157063 e!157060)))

(declare-fun b!242023 () Bool)

(declare-fun res!118593 () Bool)

(assert (=> b!242023 (=> (not res!118593) (not e!157060))))

(assert (=> b!242023 (= res!118593 (= (select (arr!5702 (_keys!6591 thiss!1504)) (index!6282 lt!121637)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242024 () Bool)

(assert (=> b!242024 (= e!157055 e!157052)))

(declare-fun res!118594 () Bool)

(assert (=> b!242024 (=> (not res!118594) (not e!157052))))

(assert (=> b!242024 (= res!118594 (and (bvslt (size!6044 (_keys!6591 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6044 (_keys!6591 thiss!1504)))))))

(declare-fun lt!121639 () Unit!7436)

(assert (=> b!242024 (= lt!121639 e!157059)))

(declare-fun c!40375 () Bool)

(declare-fun arrayContainsKey!0 (array!12005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!242024 (= c!40375 (arrayContainsKey!0 (_keys!6591 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242025 () Bool)

(assert (=> b!242025 (= e!157054 (and e!157062 mapRes!10780))))

(declare-fun condMapEmpty!10780 () Bool)

(declare-fun mapDefault!10780 () ValueCell!2837)

(assert (=> b!242025 (= condMapEmpty!10780 (= (arr!5701 (_values!4467 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2837)) mapDefault!10780)))))

(declare-fun b!242026 () Bool)

(assert (=> b!242026 (= e!157060 (not call!22517))))

(declare-fun mapIsEmpty!10780 () Bool)

(assert (=> mapIsEmpty!10780 mapRes!10780))

(declare-fun res!118597 () Bool)

(assert (=> start!23088 (=> (not res!118597) (not e!157056))))

(declare-fun valid!1415 (LongMapFixedSize!3574) Bool)

(assert (=> start!23088 (= res!118597 (valid!1415 thiss!1504))))

(assert (=> start!23088 e!157056))

(assert (=> start!23088 e!157058))

(assert (=> start!23088 true))

(declare-fun bm!22514 () Bool)

(assert (=> bm!22514 (= call!22518 (inRange!0 (ite c!40372 (index!6282 lt!121637) (index!6285 lt!121637)) (mask!10561 thiss!1504)))))

(declare-fun bm!22515 () Bool)

(assert (=> bm!22515 (= call!22517 (arrayContainsKey!0 (_keys!6591 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!23088 res!118597) b!242019))

(assert (= (and b!242019 res!118592) b!242006))

(assert (= (and b!242006 res!118599) b!242010))

(assert (= (and b!242010 c!40374) b!242007))

(assert (= (and b!242010 (not c!40374)) b!242011))

(assert (= (and b!242011 c!40372) b!242022))

(assert (= (and b!242011 (not c!40372)) b!242021))

(assert (= (and b!242022 res!118598) b!242023))

(assert (= (and b!242023 res!118593) b!242026))

(assert (= (and b!242021 c!40373) b!242013))

(assert (= (and b!242021 (not c!40373)) b!242012))

(assert (= (and b!242013 res!118596) b!242014))

(assert (= (and b!242014 res!118591) b!242018))

(assert (= (or b!242022 b!242013) bm!22514))

(assert (= (or b!242026 b!242018) bm!22515))

(assert (= (and b!242010 res!118595) b!242024))

(assert (= (and b!242024 c!40375) b!242015))

(assert (= (and b!242024 (not c!40375)) b!242016))

(assert (= (and b!242024 res!118594) b!242008))

(assert (= (and b!242025 condMapEmpty!10780) mapIsEmpty!10780))

(assert (= (and b!242025 (not condMapEmpty!10780)) mapNonEmpty!10780))

(assert (= (and mapNonEmpty!10780 ((_ is ValueCellFull!2837) mapValue!10780)) b!242017))

(assert (= (and b!242025 ((_ is ValueCellFull!2837) mapDefault!10780)) b!242009))

(assert (= b!242020 b!242025))

(assert (= start!23088 b!242020))

(declare-fun m!261159 () Bool)

(assert (=> bm!22514 m!261159))

(declare-fun m!261161 () Bool)

(assert (=> b!242011 m!261161))

(declare-fun m!261163 () Bool)

(assert (=> b!242014 m!261163))

(declare-fun m!261165 () Bool)

(assert (=> b!242024 m!261165))

(declare-fun m!261167 () Bool)

(assert (=> b!242006 m!261167))

(declare-fun m!261169 () Bool)

(assert (=> start!23088 m!261169))

(declare-fun m!261171 () Bool)

(assert (=> b!242023 m!261171))

(declare-fun m!261173 () Bool)

(assert (=> b!242008 m!261173))

(declare-fun m!261175 () Bool)

(assert (=> b!242015 m!261175))

(declare-fun m!261177 () Bool)

(assert (=> b!242007 m!261177))

(declare-fun m!261179 () Bool)

(assert (=> b!242020 m!261179))

(declare-fun m!261181 () Bool)

(assert (=> b!242020 m!261181))

(declare-fun m!261183 () Bool)

(assert (=> mapNonEmpty!10780 m!261183))

(assert (=> bm!22515 m!261165))

(declare-fun m!261185 () Bool)

(assert (=> b!242010 m!261185))

(declare-fun m!261187 () Bool)

(assert (=> b!242010 m!261187))

(assert (=> b!242010 m!261187))

(declare-fun m!261189 () Bool)

(assert (=> b!242010 m!261189))

(check-sat (not b!242008) b_and!13487 (not b!242020) (not b!242024) (not bm!22515) (not bm!22514) (not mapNonEmpty!10780) tp_is_empty!6361 (not b_next!6499) (not start!23088) (not b!242007) (not b!242011) (not b!242015) (not b!242006) (not b!242010))
(check-sat b_and!13487 (not b_next!6499))
(get-model)

(declare-fun b!242169 () Bool)

(declare-fun res!118663 () Bool)

(declare-fun e!157168 () Bool)

(assert (=> b!242169 (=> (not res!118663) (not e!157168))))

(declare-fun lt!121680 () SeekEntryResult!1028)

(assert (=> b!242169 (= res!118663 (= (select (arr!5702 (_keys!6591 thiss!1504)) (index!6285 lt!121680)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242169 (and (bvsge (index!6285 lt!121680) #b00000000000000000000000000000000) (bvslt (index!6285 lt!121680) (size!6044 (_keys!6591 thiss!1504))))))

(declare-fun bm!22532 () Bool)

(declare-fun call!22535 () Bool)

(declare-fun c!40404 () Bool)

(assert (=> bm!22532 (= call!22535 (inRange!0 (ite c!40404 (index!6282 lt!121680) (index!6285 lt!121680)) (mask!10561 thiss!1504)))))

(declare-fun b!242170 () Bool)

(declare-fun e!157167 () Bool)

(declare-fun call!22536 () Bool)

(assert (=> b!242170 (= e!157167 (not call!22536))))

(declare-fun b!242171 () Bool)

(assert (=> b!242171 (and (bvsge (index!6282 lt!121680) #b00000000000000000000000000000000) (bvslt (index!6282 lt!121680) (size!6044 (_keys!6591 thiss!1504))))))

(declare-fun res!118662 () Bool)

(assert (=> b!242171 (= res!118662 (= (select (arr!5702 (_keys!6591 thiss!1504)) (index!6282 lt!121680)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242171 (=> (not res!118662) (not e!157167))))

(declare-fun b!242172 () Bool)

(assert (=> b!242172 (= e!157168 (not call!22536))))

(declare-fun b!242173 () Bool)

(declare-fun e!157165 () Bool)

(assert (=> b!242173 (= e!157165 e!157167)))

(declare-fun res!118665 () Bool)

(assert (=> b!242173 (= res!118665 call!22535)))

(assert (=> b!242173 (=> (not res!118665) (not e!157167))))

(declare-fun b!242174 () Bool)

(declare-fun e!157166 () Bool)

(assert (=> b!242174 (= e!157165 e!157166)))

(declare-fun c!40405 () Bool)

(assert (=> b!242174 (= c!40405 ((_ is MissingVacant!1028) lt!121680))))

(declare-fun d!60013 () Bool)

(assert (=> d!60013 e!157165))

(assert (=> d!60013 (= c!40404 ((_ is MissingZero!1028) lt!121680))))

(assert (=> d!60013 (= lt!121680 (seekEntryOrOpen!0 key!932 (_keys!6591 thiss!1504) (mask!10561 thiss!1504)))))

(declare-fun lt!121681 () Unit!7436)

(declare-fun choose!1132 (array!12005 array!12003 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 64) Int) Unit!7436)

(assert (=> d!60013 (= lt!121681 (choose!1132 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 (defaultEntry!4484 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!60013 (validMask!0 (mask!10561 thiss!1504))))

(assert (=> d!60013 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!345 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 (defaultEntry!4484 thiss!1504)) lt!121681)))

(declare-fun bm!22533 () Bool)

(assert (=> bm!22533 (= call!22536 (arrayContainsKey!0 (_keys!6591 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242175 () Bool)

(declare-fun res!118664 () Bool)

(assert (=> b!242175 (=> (not res!118664) (not e!157168))))

(assert (=> b!242175 (= res!118664 call!22535)))

(assert (=> b!242175 (= e!157166 e!157168)))

(declare-fun b!242176 () Bool)

(assert (=> b!242176 (= e!157166 ((_ is Undefined!1028) lt!121680))))

(assert (= (and d!60013 c!40404) b!242173))

(assert (= (and d!60013 (not c!40404)) b!242174))

(assert (= (and b!242173 res!118665) b!242171))

(assert (= (and b!242171 res!118662) b!242170))

(assert (= (and b!242174 c!40405) b!242175))

(assert (= (and b!242174 (not c!40405)) b!242176))

(assert (= (and b!242175 res!118664) b!242169))

(assert (= (and b!242169 res!118663) b!242172))

(assert (= (or b!242173 b!242175) bm!22532))

(assert (= (or b!242170 b!242172) bm!22533))

(assert (=> bm!22533 m!261165))

(assert (=> d!60013 m!261167))

(declare-fun m!261255 () Bool)

(assert (=> d!60013 m!261255))

(declare-fun m!261257 () Bool)

(assert (=> d!60013 m!261257))

(declare-fun m!261259 () Bool)

(assert (=> b!242169 m!261259))

(declare-fun m!261261 () Bool)

(assert (=> b!242171 m!261261))

(declare-fun m!261263 () Bool)

(assert (=> bm!22532 m!261263))

(assert (=> b!242011 d!60013))

(declare-fun d!60015 () Bool)

(declare-fun res!118672 () Bool)

(declare-fun e!157171 () Bool)

(assert (=> d!60015 (=> (not res!118672) (not e!157171))))

(declare-fun simpleValid!246 (LongMapFixedSize!3574) Bool)

(assert (=> d!60015 (= res!118672 (simpleValid!246 thiss!1504))))

(assert (=> d!60015 (= (valid!1415 thiss!1504) e!157171)))

(declare-fun b!242183 () Bool)

(declare-fun res!118673 () Bool)

(assert (=> b!242183 (=> (not res!118673) (not e!157171))))

(declare-fun arrayCountValidKeys!0 (array!12005 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!242183 (= res!118673 (= (arrayCountValidKeys!0 (_keys!6591 thiss!1504) #b00000000000000000000000000000000 (size!6044 (_keys!6591 thiss!1504))) (_size!1836 thiss!1504)))))

(declare-fun b!242184 () Bool)

(declare-fun res!118674 () Bool)

(assert (=> b!242184 (=> (not res!118674) (not e!157171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12005 (_ BitVec 32)) Bool)

(assert (=> b!242184 (= res!118674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6591 thiss!1504) (mask!10561 thiss!1504)))))

(declare-fun b!242185 () Bool)

(declare-fun arrayNoDuplicates!0 (array!12005 (_ BitVec 32) List!3550) Bool)

(assert (=> b!242185 (= e!157171 (arrayNoDuplicates!0 (_keys!6591 thiss!1504) #b00000000000000000000000000000000 Nil!3547))))

(assert (= (and d!60015 res!118672) b!242183))

(assert (= (and b!242183 res!118673) b!242184))

(assert (= (and b!242184 res!118674) b!242185))

(declare-fun m!261265 () Bool)

(assert (=> d!60015 m!261265))

(declare-fun m!261267 () Bool)

(assert (=> b!242183 m!261267))

(declare-fun m!261269 () Bool)

(assert (=> b!242184 m!261269))

(declare-fun m!261271 () Bool)

(assert (=> b!242185 m!261271))

(assert (=> start!23088 d!60015))

(declare-fun d!60017 () Bool)

(declare-fun res!118679 () Bool)

(declare-fun e!157176 () Bool)

(assert (=> d!60017 (=> res!118679 e!157176)))

(assert (=> d!60017 (= res!118679 (= (select (arr!5702 (_keys!6591 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60017 (= (arrayContainsKey!0 (_keys!6591 thiss!1504) key!932 #b00000000000000000000000000000000) e!157176)))

(declare-fun b!242190 () Bool)

(declare-fun e!157177 () Bool)

(assert (=> b!242190 (= e!157176 e!157177)))

(declare-fun res!118680 () Bool)

(assert (=> b!242190 (=> (not res!118680) (not e!157177))))

(assert (=> b!242190 (= res!118680 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6044 (_keys!6591 thiss!1504))))))

(declare-fun b!242191 () Bool)

(assert (=> b!242191 (= e!157177 (arrayContainsKey!0 (_keys!6591 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60017 (not res!118679)) b!242190))

(assert (= (and b!242190 res!118680) b!242191))

(declare-fun m!261273 () Bool)

(assert (=> d!60017 m!261273))

(declare-fun m!261275 () Bool)

(assert (=> b!242191 m!261275))

(assert (=> b!242024 d!60017))

(declare-fun d!60019 () Bool)

(assert (=> d!60019 (contains!1717 (getCurrentListMap!1345 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)) key!932)))

(declare-fun lt!121684 () Unit!7436)

(declare-fun choose!1133 (array!12005 array!12003 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 64) (_ BitVec 32) Int) Unit!7436)

(assert (=> d!60019 (= lt!121684 (choose!1133 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)))))

(assert (=> d!60019 (validMask!0 (mask!10561 thiss!1504))))

(assert (=> d!60019 (= (lemmaArrayContainsKeyThenInListMap!167 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)) lt!121684)))

(declare-fun bs!8876 () Bool)

(assert (= bs!8876 d!60019))

(assert (=> bs!8876 m!261187))

(assert (=> bs!8876 m!261187))

(assert (=> bs!8876 m!261189))

(declare-fun m!261277 () Bool)

(assert (=> bs!8876 m!261277))

(assert (=> bs!8876 m!261257))

(assert (=> b!242015 d!60019))

(declare-fun b!242204 () Bool)

(declare-fun c!40414 () Bool)

(declare-fun lt!121691 () (_ BitVec 64))

(assert (=> b!242204 (= c!40414 (= lt!121691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157185 () SeekEntryResult!1028)

(declare-fun e!157186 () SeekEntryResult!1028)

(assert (=> b!242204 (= e!157185 e!157186)))

(declare-fun b!242205 () Bool)

(declare-fun e!157184 () SeekEntryResult!1028)

(assert (=> b!242205 (= e!157184 e!157185)))

(declare-fun lt!121693 () SeekEntryResult!1028)

(assert (=> b!242205 (= lt!121691 (select (arr!5702 (_keys!6591 thiss!1504)) (index!6284 lt!121693)))))

(declare-fun c!40413 () Bool)

(assert (=> b!242205 (= c!40413 (= lt!121691 key!932))))

(declare-fun b!242206 () Bool)

(assert (=> b!242206 (= e!157184 Undefined!1028)))

(declare-fun b!242207 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12005 (_ BitVec 32)) SeekEntryResult!1028)

(assert (=> b!242207 (= e!157186 (seekKeyOrZeroReturnVacant!0 (x!24216 lt!121693) (index!6284 lt!121693) (index!6284 lt!121693) key!932 (_keys!6591 thiss!1504) (mask!10561 thiss!1504)))))

(declare-fun d!60021 () Bool)

(declare-fun lt!121692 () SeekEntryResult!1028)

(assert (=> d!60021 (and (or ((_ is Undefined!1028) lt!121692) (not ((_ is Found!1028) lt!121692)) (and (bvsge (index!6283 lt!121692) #b00000000000000000000000000000000) (bvslt (index!6283 lt!121692) (size!6044 (_keys!6591 thiss!1504))))) (or ((_ is Undefined!1028) lt!121692) ((_ is Found!1028) lt!121692) (not ((_ is MissingZero!1028) lt!121692)) (and (bvsge (index!6282 lt!121692) #b00000000000000000000000000000000) (bvslt (index!6282 lt!121692) (size!6044 (_keys!6591 thiss!1504))))) (or ((_ is Undefined!1028) lt!121692) ((_ is Found!1028) lt!121692) ((_ is MissingZero!1028) lt!121692) (not ((_ is MissingVacant!1028) lt!121692)) (and (bvsge (index!6285 lt!121692) #b00000000000000000000000000000000) (bvslt (index!6285 lt!121692) (size!6044 (_keys!6591 thiss!1504))))) (or ((_ is Undefined!1028) lt!121692) (ite ((_ is Found!1028) lt!121692) (= (select (arr!5702 (_keys!6591 thiss!1504)) (index!6283 lt!121692)) key!932) (ite ((_ is MissingZero!1028) lt!121692) (= (select (arr!5702 (_keys!6591 thiss!1504)) (index!6282 lt!121692)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1028) lt!121692) (= (select (arr!5702 (_keys!6591 thiss!1504)) (index!6285 lt!121692)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60021 (= lt!121692 e!157184)))

(declare-fun c!40412 () Bool)

(assert (=> d!60021 (= c!40412 (and ((_ is Intermediate!1028) lt!121693) (undefined!1840 lt!121693)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12005 (_ BitVec 32)) SeekEntryResult!1028)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60021 (= lt!121693 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10561 thiss!1504)) key!932 (_keys!6591 thiss!1504) (mask!10561 thiss!1504)))))

(assert (=> d!60021 (validMask!0 (mask!10561 thiss!1504))))

(assert (=> d!60021 (= (seekEntryOrOpen!0 key!932 (_keys!6591 thiss!1504) (mask!10561 thiss!1504)) lt!121692)))

(declare-fun b!242208 () Bool)

(assert (=> b!242208 (= e!157185 (Found!1028 (index!6284 lt!121693)))))

(declare-fun b!242209 () Bool)

(assert (=> b!242209 (= e!157186 (MissingZero!1028 (index!6284 lt!121693)))))

(assert (= (and d!60021 c!40412) b!242206))

(assert (= (and d!60021 (not c!40412)) b!242205))

(assert (= (and b!242205 c!40413) b!242208))

(assert (= (and b!242205 (not c!40413)) b!242204))

(assert (= (and b!242204 c!40414) b!242209))

(assert (= (and b!242204 (not c!40414)) b!242207))

(declare-fun m!261279 () Bool)

(assert (=> b!242205 m!261279))

(declare-fun m!261281 () Bool)

(assert (=> b!242207 m!261281))

(declare-fun m!261283 () Bool)

(assert (=> d!60021 m!261283))

(assert (=> d!60021 m!261257))

(declare-fun m!261285 () Bool)

(assert (=> d!60021 m!261285))

(declare-fun m!261287 () Bool)

(assert (=> d!60021 m!261287))

(declare-fun m!261289 () Bool)

(assert (=> d!60021 m!261289))

(assert (=> d!60021 m!261287))

(declare-fun m!261291 () Bool)

(assert (=> d!60021 m!261291))

(assert (=> b!242006 d!60021))

(declare-fun d!60023 () Bool)

(declare-fun e!157189 () Bool)

(assert (=> d!60023 e!157189))

(declare-fun res!118685 () Bool)

(assert (=> d!60023 (=> (not res!118685) (not e!157189))))

(declare-fun lt!121698 () SeekEntryResult!1028)

(assert (=> d!60023 (= res!118685 ((_ is Found!1028) lt!121698))))

(assert (=> d!60023 (= lt!121698 (seekEntryOrOpen!0 key!932 (_keys!6591 thiss!1504) (mask!10561 thiss!1504)))))

(declare-fun lt!121699 () Unit!7436)

(declare-fun choose!1134 (array!12005 array!12003 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 64) Int) Unit!7436)

(assert (=> d!60023 (= lt!121699 (choose!1134 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 (defaultEntry!4484 thiss!1504)))))

(assert (=> d!60023 (validMask!0 (mask!10561 thiss!1504))))

(assert (=> d!60023 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!353 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 (defaultEntry!4484 thiss!1504)) lt!121699)))

(declare-fun b!242214 () Bool)

(declare-fun res!118686 () Bool)

(assert (=> b!242214 (=> (not res!118686) (not e!157189))))

(assert (=> b!242214 (= res!118686 (inRange!0 (index!6283 lt!121698) (mask!10561 thiss!1504)))))

(declare-fun b!242215 () Bool)

(assert (=> b!242215 (= e!157189 (= (select (arr!5702 (_keys!6591 thiss!1504)) (index!6283 lt!121698)) key!932))))

(assert (=> b!242215 (and (bvsge (index!6283 lt!121698) #b00000000000000000000000000000000) (bvslt (index!6283 lt!121698) (size!6044 (_keys!6591 thiss!1504))))))

(assert (= (and d!60023 res!118685) b!242214))

(assert (= (and b!242214 res!118686) b!242215))

(assert (=> d!60023 m!261167))

(declare-fun m!261293 () Bool)

(assert (=> d!60023 m!261293))

(assert (=> d!60023 m!261257))

(declare-fun m!261295 () Bool)

(assert (=> b!242214 m!261295))

(declare-fun m!261297 () Bool)

(assert (=> b!242215 m!261297))

(assert (=> b!242007 d!60023))

(declare-fun d!60025 () Bool)

(assert (=> d!60025 (= (inRange!0 (ite c!40372 (index!6282 lt!121637) (index!6285 lt!121637)) (mask!10561 thiss!1504)) (and (bvsge (ite c!40372 (index!6282 lt!121637) (index!6285 lt!121637)) #b00000000000000000000000000000000) (bvslt (ite c!40372 (index!6282 lt!121637) (index!6285 lt!121637)) (bvadd (mask!10561 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22514 d!60025))

(assert (=> bm!22515 d!60017))

(declare-fun d!60027 () Bool)

(declare-fun res!118691 () Bool)

(declare-fun e!157194 () Bool)

(assert (=> d!60027 (=> res!118691 e!157194)))

(assert (=> d!60027 (= res!118691 ((_ is Nil!3547) Nil!3547))))

(assert (=> d!60027 (= (noDuplicate!86 Nil!3547) e!157194)))

(declare-fun b!242220 () Bool)

(declare-fun e!157195 () Bool)

(assert (=> b!242220 (= e!157194 e!157195)))

(declare-fun res!118692 () Bool)

(assert (=> b!242220 (=> (not res!118692) (not e!157195))))

(declare-fun contains!1720 (List!3550 (_ BitVec 64)) Bool)

(assert (=> b!242220 (= res!118692 (not (contains!1720 (t!8541 Nil!3547) (h!4203 Nil!3547))))))

(declare-fun b!242221 () Bool)

(assert (=> b!242221 (= e!157195 (noDuplicate!86 (t!8541 Nil!3547)))))

(assert (= (and d!60027 (not res!118691)) b!242220))

(assert (= (and b!242220 res!118692) b!242221))

(declare-fun m!261299 () Bool)

(assert (=> b!242220 m!261299))

(declare-fun m!261301 () Bool)

(assert (=> b!242221 m!261301))

(assert (=> b!242008 d!60027))

(declare-fun d!60029 () Bool)

(assert (=> d!60029 (= (array_inv!3747 (_keys!6591 thiss!1504)) (bvsge (size!6044 (_keys!6591 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242020 d!60029))

(declare-fun d!60031 () Bool)

(assert (=> d!60031 (= (array_inv!3748 (_values!4467 thiss!1504)) (bvsge (size!6043 (_values!4467 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242020 d!60031))

(declare-fun d!60033 () Bool)

(assert (=> d!60033 (= (inRange!0 index!297 (mask!10561 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10561 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!242010 d!60033))

(declare-fun d!60035 () Bool)

(declare-fun e!157201 () Bool)

(assert (=> d!60035 e!157201))

(declare-fun res!118695 () Bool)

(assert (=> d!60035 (=> res!118695 e!157201)))

(declare-fun lt!121709 () Bool)

(assert (=> d!60035 (= res!118695 (not lt!121709))))

(declare-fun lt!121708 () Bool)

(assert (=> d!60035 (= lt!121709 lt!121708)))

(declare-fun lt!121710 () Unit!7436)

(declare-fun e!157200 () Unit!7436)

(assert (=> d!60035 (= lt!121710 e!157200)))

(declare-fun c!40417 () Bool)

(assert (=> d!60035 (= c!40417 lt!121708)))

(declare-fun containsKey!273 (List!3551 (_ BitVec 64)) Bool)

(assert (=> d!60035 (= lt!121708 (containsKey!273 (toList!1813 (getCurrentListMap!1345 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504))) key!932))))

(assert (=> d!60035 (= (contains!1717 (getCurrentListMap!1345 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)) key!932) lt!121709)))

(declare-fun b!242228 () Bool)

(declare-fun lt!121711 () Unit!7436)

(assert (=> b!242228 (= e!157200 lt!121711)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!221 (List!3551 (_ BitVec 64)) Unit!7436)

(assert (=> b!242228 (= lt!121711 (lemmaContainsKeyImpliesGetValueByKeyDefined!221 (toList!1813 (getCurrentListMap!1345 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504))) key!932))))

(declare-datatypes ((Option!288 0))(
  ( (Some!287 (v!5269 V!8129)) (None!286) )
))
(declare-fun isDefined!222 (Option!288) Bool)

(declare-fun getValueByKey!282 (List!3551 (_ BitVec 64)) Option!288)

(assert (=> b!242228 (isDefined!222 (getValueByKey!282 (toList!1813 (getCurrentListMap!1345 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504))) key!932))))

(declare-fun b!242229 () Bool)

(declare-fun Unit!7448 () Unit!7436)

(assert (=> b!242229 (= e!157200 Unit!7448)))

(declare-fun b!242230 () Bool)

(assert (=> b!242230 (= e!157201 (isDefined!222 (getValueByKey!282 (toList!1813 (getCurrentListMap!1345 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504))) key!932)))))

(assert (= (and d!60035 c!40417) b!242228))

(assert (= (and d!60035 (not c!40417)) b!242229))

(assert (= (and d!60035 (not res!118695)) b!242230))

(declare-fun m!261303 () Bool)

(assert (=> d!60035 m!261303))

(declare-fun m!261305 () Bool)

(assert (=> b!242228 m!261305))

(declare-fun m!261307 () Bool)

(assert (=> b!242228 m!261307))

(assert (=> b!242228 m!261307))

(declare-fun m!261309 () Bool)

(assert (=> b!242228 m!261309))

(assert (=> b!242230 m!261307))

(assert (=> b!242230 m!261307))

(assert (=> b!242230 m!261309))

(assert (=> b!242010 d!60035))

(declare-fun b!242273 () Bool)

(declare-fun e!157228 () ListLongMap!3595)

(declare-fun e!157235 () ListLongMap!3595)

(assert (=> b!242273 (= e!157228 e!157235)))

(declare-fun c!40431 () Bool)

(assert (=> b!242273 (= c!40431 (and (not (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22548 () Bool)

(declare-fun call!22554 () ListLongMap!3595)

(declare-fun call!22555 () ListLongMap!3595)

(assert (=> bm!22548 (= call!22554 call!22555)))

(declare-fun bm!22549 () Bool)

(declare-fun call!22553 () Bool)

(declare-fun lt!121765 () ListLongMap!3595)

(assert (=> bm!22549 (= call!22553 (contains!1717 lt!121765 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!40434 () Bool)

(declare-fun bm!22550 () Bool)

(declare-fun call!22552 () ListLongMap!3595)

(declare-fun call!22556 () ListLongMap!3595)

(declare-fun +!650 (ListLongMap!3595 tuple2!4680) ListLongMap!3595)

(assert (=> bm!22550 (= call!22552 (+!650 (ite c!40434 call!22556 (ite c!40431 call!22555 call!22554)) (ite (or c!40434 c!40431) (tuple2!4681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4325 thiss!1504)) (tuple2!4681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4325 thiss!1504)))))))

(declare-fun b!242274 () Bool)

(declare-fun e!157238 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!242274 (= e!157238 (validKeyInArray!0 (select (arr!5702 (_keys!6591 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!242275 () Bool)

(declare-fun e!157233 () Bool)

(assert (=> b!242275 (= e!157233 (validKeyInArray!0 (select (arr!5702 (_keys!6591 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22551 () Bool)

(declare-fun call!22557 () ListLongMap!3595)

(assert (=> bm!22551 (= call!22557 call!22552)))

(declare-fun b!242277 () Bool)

(declare-fun c!40432 () Bool)

(assert (=> b!242277 (= c!40432 (and (not (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!157234 () ListLongMap!3595)

(assert (=> b!242277 (= e!157235 e!157234)))

(declare-fun b!242278 () Bool)

(assert (=> b!242278 (= e!157235 call!22557)))

(declare-fun b!242279 () Bool)

(declare-fun e!157237 () Bool)

(declare-fun apply!223 (ListLongMap!3595 (_ BitVec 64)) V!8129)

(declare-fun get!2935 (ValueCell!2837 V!8129) V!8129)

(declare-fun dynLambda!566 (Int (_ BitVec 64)) V!8129)

(assert (=> b!242279 (= e!157237 (= (apply!223 lt!121765 (select (arr!5702 (_keys!6591 thiss!1504)) #b00000000000000000000000000000000)) (get!2935 (select (arr!5701 (_values!4467 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!566 (defaultEntry!4484 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!242279 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6043 (_values!4467 thiss!1504))))))

(assert (=> b!242279 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6044 (_keys!6591 thiss!1504))))))

(declare-fun b!242280 () Bool)

(assert (=> b!242280 (= e!157234 call!22557)))

(declare-fun b!242281 () Bool)

(declare-fun e!157232 () Bool)

(declare-fun e!157230 () Bool)

(assert (=> b!242281 (= e!157232 e!157230)))

(declare-fun c!40435 () Bool)

(assert (=> b!242281 (= c!40435 (not (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22552 () Bool)

(assert (=> bm!22552 (= call!22555 call!22556)))

(declare-fun b!242282 () Bool)

(declare-fun e!157239 () Bool)

(assert (=> b!242282 (= e!157239 (= (apply!223 lt!121765 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4325 thiss!1504)))))

(declare-fun b!242283 () Bool)

(assert (=> b!242283 (= e!157228 (+!650 call!22552 (tuple2!4681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4325 thiss!1504))))))

(declare-fun b!242284 () Bool)

(declare-fun e!157229 () Bool)

(declare-fun call!22551 () Bool)

(assert (=> b!242284 (= e!157229 (not call!22551))))

(declare-fun b!242285 () Bool)

(declare-fun e!157240 () Bool)

(assert (=> b!242285 (= e!157240 (= (apply!223 lt!121765 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4325 thiss!1504)))))

(declare-fun b!242286 () Bool)

(assert (=> b!242286 (= e!157229 e!157239)))

(declare-fun res!118715 () Bool)

(assert (=> b!242286 (= res!118715 call!22551)))

(assert (=> b!242286 (=> (not res!118715) (not e!157239))))

(declare-fun b!242287 () Bool)

(declare-fun e!157231 () Bool)

(assert (=> b!242287 (= e!157231 e!157237)))

(declare-fun res!118721 () Bool)

(assert (=> b!242287 (=> (not res!118721) (not e!157237))))

(assert (=> b!242287 (= res!118721 (contains!1717 lt!121765 (select (arr!5702 (_keys!6591 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!242287 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6044 (_keys!6591 thiss!1504))))))

(declare-fun bm!22553 () Bool)

(assert (=> bm!22553 (= call!22551 (contains!1717 lt!121765 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242288 () Bool)

(assert (=> b!242288 (= e!157234 call!22554)))

(declare-fun b!242289 () Bool)

(declare-fun e!157236 () Unit!7436)

(declare-fun lt!121775 () Unit!7436)

(assert (=> b!242289 (= e!157236 lt!121775)))

(declare-fun lt!121764 () ListLongMap!3595)

(declare-fun getCurrentListMapNoExtraKeys!539 (array!12005 array!12003 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 32) Int) ListLongMap!3595)

(assert (=> b!242289 (= lt!121764 (getCurrentListMapNoExtraKeys!539 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)))))

(declare-fun lt!121756 () (_ BitVec 64))

(assert (=> b!242289 (= lt!121756 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121763 () (_ BitVec 64))

(assert (=> b!242289 (= lt!121763 (select (arr!5702 (_keys!6591 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121760 () Unit!7436)

(declare-fun addStillContains!199 (ListLongMap!3595 (_ BitVec 64) V!8129 (_ BitVec 64)) Unit!7436)

(assert (=> b!242289 (= lt!121760 (addStillContains!199 lt!121764 lt!121756 (zeroValue!4325 thiss!1504) lt!121763))))

(assert (=> b!242289 (contains!1717 (+!650 lt!121764 (tuple2!4681 lt!121756 (zeroValue!4325 thiss!1504))) lt!121763)))

(declare-fun lt!121767 () Unit!7436)

(assert (=> b!242289 (= lt!121767 lt!121760)))

(declare-fun lt!121761 () ListLongMap!3595)

(assert (=> b!242289 (= lt!121761 (getCurrentListMapNoExtraKeys!539 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)))))

(declare-fun lt!121766 () (_ BitVec 64))

(assert (=> b!242289 (= lt!121766 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121776 () (_ BitVec 64))

(assert (=> b!242289 (= lt!121776 (select (arr!5702 (_keys!6591 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121774 () Unit!7436)

(declare-fun addApplyDifferent!199 (ListLongMap!3595 (_ BitVec 64) V!8129 (_ BitVec 64)) Unit!7436)

(assert (=> b!242289 (= lt!121774 (addApplyDifferent!199 lt!121761 lt!121766 (minValue!4325 thiss!1504) lt!121776))))

(assert (=> b!242289 (= (apply!223 (+!650 lt!121761 (tuple2!4681 lt!121766 (minValue!4325 thiss!1504))) lt!121776) (apply!223 lt!121761 lt!121776))))

(declare-fun lt!121770 () Unit!7436)

(assert (=> b!242289 (= lt!121770 lt!121774)))

(declare-fun lt!121758 () ListLongMap!3595)

(assert (=> b!242289 (= lt!121758 (getCurrentListMapNoExtraKeys!539 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)))))

(declare-fun lt!121762 () (_ BitVec 64))

(assert (=> b!242289 (= lt!121762 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121757 () (_ BitVec 64))

(assert (=> b!242289 (= lt!121757 (select (arr!5702 (_keys!6591 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121771 () Unit!7436)

(assert (=> b!242289 (= lt!121771 (addApplyDifferent!199 lt!121758 lt!121762 (zeroValue!4325 thiss!1504) lt!121757))))

(assert (=> b!242289 (= (apply!223 (+!650 lt!121758 (tuple2!4681 lt!121762 (zeroValue!4325 thiss!1504))) lt!121757) (apply!223 lt!121758 lt!121757))))

(declare-fun lt!121759 () Unit!7436)

(assert (=> b!242289 (= lt!121759 lt!121771)))

(declare-fun lt!121773 () ListLongMap!3595)

(assert (=> b!242289 (= lt!121773 (getCurrentListMapNoExtraKeys!539 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)))))

(declare-fun lt!121769 () (_ BitVec 64))

(assert (=> b!242289 (= lt!121769 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121772 () (_ BitVec 64))

(assert (=> b!242289 (= lt!121772 (select (arr!5702 (_keys!6591 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242289 (= lt!121775 (addApplyDifferent!199 lt!121773 lt!121769 (minValue!4325 thiss!1504) lt!121772))))

(assert (=> b!242289 (= (apply!223 (+!650 lt!121773 (tuple2!4681 lt!121769 (minValue!4325 thiss!1504))) lt!121772) (apply!223 lt!121773 lt!121772))))

(declare-fun b!242290 () Bool)

(declare-fun Unit!7449 () Unit!7436)

(assert (=> b!242290 (= e!157236 Unit!7449)))

(declare-fun b!242291 () Bool)

(declare-fun res!118716 () Bool)

(assert (=> b!242291 (=> (not res!118716) (not e!157232))))

(assert (=> b!242291 (= res!118716 e!157231)))

(declare-fun res!118714 () Bool)

(assert (=> b!242291 (=> res!118714 e!157231)))

(assert (=> b!242291 (= res!118714 (not e!157238))))

(declare-fun res!118720 () Bool)

(assert (=> b!242291 (=> (not res!118720) (not e!157238))))

(assert (=> b!242291 (= res!118720 (bvslt #b00000000000000000000000000000000 (size!6044 (_keys!6591 thiss!1504))))))

(declare-fun b!242276 () Bool)

(assert (=> b!242276 (= e!157230 e!157240)))

(declare-fun res!118719 () Bool)

(assert (=> b!242276 (= res!118719 call!22553)))

(assert (=> b!242276 (=> (not res!118719) (not e!157240))))

(declare-fun d!60037 () Bool)

(assert (=> d!60037 e!157232))

(declare-fun res!118718 () Bool)

(assert (=> d!60037 (=> (not res!118718) (not e!157232))))

(assert (=> d!60037 (= res!118718 (or (bvsge #b00000000000000000000000000000000 (size!6044 (_keys!6591 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6044 (_keys!6591 thiss!1504))))))))

(declare-fun lt!121777 () ListLongMap!3595)

(assert (=> d!60037 (= lt!121765 lt!121777)))

(declare-fun lt!121768 () Unit!7436)

(assert (=> d!60037 (= lt!121768 e!157236)))

(declare-fun c!40433 () Bool)

(assert (=> d!60037 (= c!40433 e!157233)))

(declare-fun res!118722 () Bool)

(assert (=> d!60037 (=> (not res!118722) (not e!157233))))

(assert (=> d!60037 (= res!118722 (bvslt #b00000000000000000000000000000000 (size!6044 (_keys!6591 thiss!1504))))))

(assert (=> d!60037 (= lt!121777 e!157228)))

(assert (=> d!60037 (= c!40434 (and (not (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60037 (validMask!0 (mask!10561 thiss!1504))))

(assert (=> d!60037 (= (getCurrentListMap!1345 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)) lt!121765)))

(declare-fun b!242292 () Bool)

(assert (=> b!242292 (= e!157230 (not call!22553))))

(declare-fun bm!22554 () Bool)

(assert (=> bm!22554 (= call!22556 (getCurrentListMapNoExtraKeys!539 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)))))

(declare-fun b!242293 () Bool)

(declare-fun res!118717 () Bool)

(assert (=> b!242293 (=> (not res!118717) (not e!157232))))

(assert (=> b!242293 (= res!118717 e!157229)))

(declare-fun c!40430 () Bool)

(assert (=> b!242293 (= c!40430 (not (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!60037 c!40434) b!242283))

(assert (= (and d!60037 (not c!40434)) b!242273))

(assert (= (and b!242273 c!40431) b!242278))

(assert (= (and b!242273 (not c!40431)) b!242277))

(assert (= (and b!242277 c!40432) b!242280))

(assert (= (and b!242277 (not c!40432)) b!242288))

(assert (= (or b!242280 b!242288) bm!22548))

(assert (= (or b!242278 bm!22548) bm!22552))

(assert (= (or b!242278 b!242280) bm!22551))

(assert (= (or b!242283 bm!22552) bm!22554))

(assert (= (or b!242283 bm!22551) bm!22550))

(assert (= (and d!60037 res!118722) b!242275))

(assert (= (and d!60037 c!40433) b!242289))

(assert (= (and d!60037 (not c!40433)) b!242290))

(assert (= (and d!60037 res!118718) b!242291))

(assert (= (and b!242291 res!118720) b!242274))

(assert (= (and b!242291 (not res!118714)) b!242287))

(assert (= (and b!242287 res!118721) b!242279))

(assert (= (and b!242291 res!118716) b!242293))

(assert (= (and b!242293 c!40430) b!242286))

(assert (= (and b!242293 (not c!40430)) b!242284))

(assert (= (and b!242286 res!118715) b!242282))

(assert (= (or b!242286 b!242284) bm!22553))

(assert (= (and b!242293 res!118717) b!242281))

(assert (= (and b!242281 c!40435) b!242276))

(assert (= (and b!242281 (not c!40435)) b!242292))

(assert (= (and b!242276 res!118719) b!242285))

(assert (= (or b!242276 b!242292) bm!22549))

(declare-fun b_lambda!8017 () Bool)

(assert (=> (not b_lambda!8017) (not b!242279)))

(declare-fun t!8547 () Bool)

(declare-fun tb!2951 () Bool)

(assert (=> (and b!242020 (= (defaultEntry!4484 thiss!1504) (defaultEntry!4484 thiss!1504)) t!8547) tb!2951))

(declare-fun result!5191 () Bool)

(assert (=> tb!2951 (= result!5191 tp_is_empty!6361)))

(assert (=> b!242279 t!8547))

(declare-fun b_and!13493 () Bool)

(assert (= b_and!13487 (and (=> t!8547 result!5191) b_and!13493)))

(declare-fun m!261311 () Bool)

(assert (=> b!242283 m!261311))

(assert (=> b!242287 m!261273))

(assert (=> b!242287 m!261273))

(declare-fun m!261313 () Bool)

(assert (=> b!242287 m!261313))

(declare-fun m!261315 () Bool)

(assert (=> bm!22550 m!261315))

(declare-fun m!261317 () Bool)

(assert (=> bm!22549 m!261317))

(assert (=> b!242275 m!261273))

(assert (=> b!242275 m!261273))

(declare-fun m!261319 () Bool)

(assert (=> b!242275 m!261319))

(declare-fun m!261321 () Bool)

(assert (=> b!242282 m!261321))

(declare-fun m!261323 () Bool)

(assert (=> bm!22554 m!261323))

(assert (=> d!60037 m!261257))

(declare-fun m!261325 () Bool)

(assert (=> bm!22553 m!261325))

(assert (=> b!242279 m!261273))

(declare-fun m!261327 () Bool)

(assert (=> b!242279 m!261327))

(declare-fun m!261329 () Bool)

(assert (=> b!242279 m!261329))

(declare-fun m!261331 () Bool)

(assert (=> b!242279 m!261331))

(assert (=> b!242279 m!261331))

(assert (=> b!242279 m!261329))

(declare-fun m!261333 () Bool)

(assert (=> b!242279 m!261333))

(assert (=> b!242279 m!261273))

(declare-fun m!261335 () Bool)

(assert (=> b!242285 m!261335))

(assert (=> b!242274 m!261273))

(assert (=> b!242274 m!261273))

(assert (=> b!242274 m!261319))

(declare-fun m!261337 () Bool)

(assert (=> b!242289 m!261337))

(declare-fun m!261339 () Bool)

(assert (=> b!242289 m!261339))

(declare-fun m!261341 () Bool)

(assert (=> b!242289 m!261341))

(assert (=> b!242289 m!261323))

(declare-fun m!261343 () Bool)

(assert (=> b!242289 m!261343))

(declare-fun m!261345 () Bool)

(assert (=> b!242289 m!261345))

(declare-fun m!261347 () Bool)

(assert (=> b!242289 m!261347))

(declare-fun m!261349 () Bool)

(assert (=> b!242289 m!261349))

(assert (=> b!242289 m!261345))

(declare-fun m!261351 () Bool)

(assert (=> b!242289 m!261351))

(declare-fun m!261353 () Bool)

(assert (=> b!242289 m!261353))

(declare-fun m!261355 () Bool)

(assert (=> b!242289 m!261355))

(declare-fun m!261357 () Bool)

(assert (=> b!242289 m!261357))

(declare-fun m!261359 () Bool)

(assert (=> b!242289 m!261359))

(declare-fun m!261361 () Bool)

(assert (=> b!242289 m!261361))

(assert (=> b!242289 m!261349))

(declare-fun m!261363 () Bool)

(assert (=> b!242289 m!261363))

(assert (=> b!242289 m!261357))

(assert (=> b!242289 m!261337))

(declare-fun m!261365 () Bool)

(assert (=> b!242289 m!261365))

(assert (=> b!242289 m!261273))

(assert (=> b!242010 d!60037))

(declare-fun b!242302 () Bool)

(declare-fun e!157246 () Bool)

(assert (=> b!242302 (= e!157246 tp_is_empty!6361)))

(declare-fun mapIsEmpty!10789 () Bool)

(declare-fun mapRes!10789 () Bool)

(assert (=> mapIsEmpty!10789 mapRes!10789))

(declare-fun condMapEmpty!10789 () Bool)

(declare-fun mapDefault!10789 () ValueCell!2837)

(assert (=> mapNonEmpty!10780 (= condMapEmpty!10789 (= mapRest!10780 ((as const (Array (_ BitVec 32) ValueCell!2837)) mapDefault!10789)))))

(declare-fun e!157245 () Bool)

(assert (=> mapNonEmpty!10780 (= tp!22707 (and e!157245 mapRes!10789))))

(declare-fun mapNonEmpty!10789 () Bool)

(declare-fun tp!22723 () Bool)

(assert (=> mapNonEmpty!10789 (= mapRes!10789 (and tp!22723 e!157246))))

(declare-fun mapRest!10789 () (Array (_ BitVec 32) ValueCell!2837))

(declare-fun mapKey!10789 () (_ BitVec 32))

(declare-fun mapValue!10789 () ValueCell!2837)

(assert (=> mapNonEmpty!10789 (= mapRest!10780 (store mapRest!10789 mapKey!10789 mapValue!10789))))

(declare-fun b!242303 () Bool)

(assert (=> b!242303 (= e!157245 tp_is_empty!6361)))

(assert (= (and mapNonEmpty!10780 condMapEmpty!10789) mapIsEmpty!10789))

(assert (= (and mapNonEmpty!10780 (not condMapEmpty!10789)) mapNonEmpty!10789))

(assert (= (and mapNonEmpty!10789 ((_ is ValueCellFull!2837) mapValue!10789)) b!242302))

(assert (= (and mapNonEmpty!10780 ((_ is ValueCellFull!2837) mapDefault!10789)) b!242303))

(declare-fun m!261367 () Bool)

(assert (=> mapNonEmpty!10789 m!261367))

(declare-fun b_lambda!8019 () Bool)

(assert (= b_lambda!8017 (or (and b!242020 b_free!6499) b_lambda!8019)))

(check-sat (not b_lambda!8019) (not bm!22553) (not b!242274) (not b!242289) (not d!60035) (not b!242230) (not bm!22532) (not b!242185) b_and!13493 tp_is_empty!6361 (not b_next!6499) (not b!242282) (not bm!22549) (not b!242221) (not d!60013) (not mapNonEmpty!10789) (not bm!22554) (not b!242184) (not d!60037) (not b!242183) (not b!242285) (not d!60015) (not bm!22550) (not b!242220) (not b!242191) (not b!242283) (not bm!22533) (not b!242228) (not b!242279) (not b!242214) (not d!60021) (not b!242207) (not d!60023) (not d!60019) (not b!242275) (not b!242287))
(check-sat b_and!13493 (not b_next!6499))
