; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21446 () Bool)

(assert start!21446)

(declare-fun b!215155 () Bool)

(declare-fun b_free!5713 () Bool)

(declare-fun b_next!5713 () Bool)

(assert (=> b!215155 (= b_free!5713 (not b_next!5713))))

(declare-fun tp!20250 () Bool)

(declare-fun b_and!12577 () Bool)

(assert (=> b!215155 (= tp!20250 b_and!12577)))

(declare-fun b!215153 () Bool)

(declare-fun res!105236 () Bool)

(declare-fun e!139949 () Bool)

(assert (=> b!215153 (=> (not res!105236) (not e!139949))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!215153 (= res!105236 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!5575 () Bool)

(declare-fun e!139953 () Bool)

(declare-datatypes ((V!7081 0))(
  ( (V!7082 (val!2832 Int)) )
))
(declare-datatypes ((ValueCell!2444 0))(
  ( (ValueCellFull!2444 (v!4844 V!7081)) (EmptyCell!2444) )
))
(declare-datatypes ((array!10367 0))(
  ( (array!10368 (arr!4911 (Array (_ BitVec 32) ValueCell!2444)) (size!5241 (_ BitVec 32))) )
))
(declare-datatypes ((array!10369 0))(
  ( (array!10370 (arr!4912 (Array (_ BitVec 32) (_ BitVec 64))) (size!5242 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2788 0))(
  ( (LongMapFixedSize!2789 (defaultEntry!4044 Int) (mask!9737 (_ BitVec 32)) (extraKeys!3781 (_ BitVec 32)) (zeroValue!3885 V!7081) (minValue!3885 V!7081) (_size!1443 (_ BitVec 32)) (_keys!6073 array!10369) (_values!4027 array!10367) (_vacant!1443 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2788)

(declare-fun e!139955 () Bool)

(declare-fun array_inv!3231 (array!10369) Bool)

(declare-fun array_inv!3232 (array!10367) Bool)

(assert (=> b!215155 (= e!139953 (and tp!20250 tp_is_empty!5575 (array_inv!3231 (_keys!6073 thiss!1504)) (array_inv!3232 (_values!4027 thiss!1504)) e!139955))))

(declare-fun b!215156 () Bool)

(declare-fun e!139954 () Bool)

(assert (=> b!215156 (= e!139949 e!139954)))

(declare-fun res!105237 () Bool)

(assert (=> b!215156 (=> (not res!105237) (not e!139954))))

(declare-datatypes ((SeekEntryResult!728 0))(
  ( (MissingZero!728 (index!5082 (_ BitVec 32))) (Found!728 (index!5083 (_ BitVec 32))) (Intermediate!728 (undefined!1540 Bool) (index!5084 (_ BitVec 32)) (x!22484 (_ BitVec 32))) (Undefined!728) (MissingVacant!728 (index!5085 (_ BitVec 32))) )
))
(declare-fun lt!110744 () SeekEntryResult!728)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215156 (= res!105237 (or (= lt!110744 (MissingZero!728 index!297)) (= lt!110744 (MissingVacant!728 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10369 (_ BitVec 32)) SeekEntryResult!728)

(assert (=> b!215156 (= lt!110744 (seekEntryOrOpen!0 key!932 (_keys!6073 thiss!1504) (mask!9737 thiss!1504)))))

(declare-fun b!215157 () Bool)

(assert (=> b!215157 (= e!139954 (and (= (size!5241 (_values!4027 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9737 thiss!1504))) (not (= (size!5242 (_keys!6073 thiss!1504)) (size!5241 (_values!4027 thiss!1504))))))))

(declare-fun b!215158 () Bool)

(declare-fun e!139951 () Bool)

(declare-fun mapRes!9501 () Bool)

(assert (=> b!215158 (= e!139955 (and e!139951 mapRes!9501))))

(declare-fun condMapEmpty!9501 () Bool)

(declare-fun mapDefault!9501 () ValueCell!2444)

(assert (=> b!215158 (= condMapEmpty!9501 (= (arr!4911 (_values!4027 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2444)) mapDefault!9501)))))

(declare-fun b!215159 () Bool)

(assert (=> b!215159 (= e!139951 tp_is_empty!5575)))

(declare-fun mapIsEmpty!9501 () Bool)

(assert (=> mapIsEmpty!9501 mapRes!9501))

(declare-fun mapNonEmpty!9501 () Bool)

(declare-fun tp!20249 () Bool)

(declare-fun e!139952 () Bool)

(assert (=> mapNonEmpty!9501 (= mapRes!9501 (and tp!20249 e!139952))))

(declare-fun mapRest!9501 () (Array (_ BitVec 32) ValueCell!2444))

(declare-fun mapKey!9501 () (_ BitVec 32))

(declare-fun mapValue!9501 () ValueCell!2444)

(assert (=> mapNonEmpty!9501 (= (arr!4911 (_values!4027 thiss!1504)) (store mapRest!9501 mapKey!9501 mapValue!9501))))

(declare-fun b!215160 () Bool)

(assert (=> b!215160 (= e!139952 tp_is_empty!5575)))

(declare-fun b!215154 () Bool)

(declare-fun res!105235 () Bool)

(assert (=> b!215154 (=> (not res!105235) (not e!139954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215154 (= res!105235 (validMask!0 (mask!9737 thiss!1504)))))

(declare-fun res!105238 () Bool)

(assert (=> start!21446 (=> (not res!105238) (not e!139949))))

(declare-fun valid!1157 (LongMapFixedSize!2788) Bool)

(assert (=> start!21446 (= res!105238 (valid!1157 thiss!1504))))

(assert (=> start!21446 e!139949))

(assert (=> start!21446 e!139953))

(assert (=> start!21446 true))

(assert (= (and start!21446 res!105238) b!215153))

(assert (= (and b!215153 res!105236) b!215156))

(assert (= (and b!215156 res!105237) b!215154))

(assert (= (and b!215154 res!105235) b!215157))

(assert (= (and b!215158 condMapEmpty!9501) mapIsEmpty!9501))

(assert (= (and b!215158 (not condMapEmpty!9501)) mapNonEmpty!9501))

(get-info :version)

(assert (= (and mapNonEmpty!9501 ((_ is ValueCellFull!2444) mapValue!9501)) b!215160))

(assert (= (and b!215158 ((_ is ValueCellFull!2444) mapDefault!9501)) b!215159))

(assert (= b!215155 b!215158))

(assert (= start!21446 b!215155))

(declare-fun m!241955 () Bool)

(assert (=> start!21446 m!241955))

(declare-fun m!241957 () Bool)

(assert (=> mapNonEmpty!9501 m!241957))

(declare-fun m!241959 () Bool)

(assert (=> b!215154 m!241959))

(declare-fun m!241961 () Bool)

(assert (=> b!215156 m!241961))

(declare-fun m!241963 () Bool)

(assert (=> b!215155 m!241963))

(declare-fun m!241965 () Bool)

(assert (=> b!215155 m!241965))

(check-sat (not b!215154) (not mapNonEmpty!9501) (not b_next!5713) (not start!21446) tp_is_empty!5575 (not b!215156) (not b!215155) b_and!12577)
(check-sat b_and!12577 (not b_next!5713))
(get-model)

(declare-fun b!215221 () Bool)

(declare-fun e!140006 () SeekEntryResult!728)

(assert (=> b!215221 (= e!140006 Undefined!728)))

(declare-fun b!215222 () Bool)

(declare-fun e!140004 () SeekEntryResult!728)

(declare-fun lt!110759 () SeekEntryResult!728)

(assert (=> b!215222 (= e!140004 (Found!728 (index!5084 lt!110759)))))

(declare-fun b!215223 () Bool)

(assert (=> b!215223 (= e!140006 e!140004)))

(declare-fun lt!110758 () (_ BitVec 64))

(assert (=> b!215223 (= lt!110758 (select (arr!4912 (_keys!6073 thiss!1504)) (index!5084 lt!110759)))))

(declare-fun c!36144 () Bool)

(assert (=> b!215223 (= c!36144 (= lt!110758 key!932))))

(declare-fun b!215224 () Bool)

(declare-fun e!140005 () SeekEntryResult!728)

(assert (=> b!215224 (= e!140005 (MissingZero!728 (index!5084 lt!110759)))))

(declare-fun b!215225 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10369 (_ BitVec 32)) SeekEntryResult!728)

(assert (=> b!215225 (= e!140005 (seekKeyOrZeroReturnVacant!0 (x!22484 lt!110759) (index!5084 lt!110759) (index!5084 lt!110759) key!932 (_keys!6073 thiss!1504) (mask!9737 thiss!1504)))))

(declare-fun d!58273 () Bool)

(declare-fun lt!110757 () SeekEntryResult!728)

(assert (=> d!58273 (and (or ((_ is Undefined!728) lt!110757) (not ((_ is Found!728) lt!110757)) (and (bvsge (index!5083 lt!110757) #b00000000000000000000000000000000) (bvslt (index!5083 lt!110757) (size!5242 (_keys!6073 thiss!1504))))) (or ((_ is Undefined!728) lt!110757) ((_ is Found!728) lt!110757) (not ((_ is MissingZero!728) lt!110757)) (and (bvsge (index!5082 lt!110757) #b00000000000000000000000000000000) (bvslt (index!5082 lt!110757) (size!5242 (_keys!6073 thiss!1504))))) (or ((_ is Undefined!728) lt!110757) ((_ is Found!728) lt!110757) ((_ is MissingZero!728) lt!110757) (not ((_ is MissingVacant!728) lt!110757)) (and (bvsge (index!5085 lt!110757) #b00000000000000000000000000000000) (bvslt (index!5085 lt!110757) (size!5242 (_keys!6073 thiss!1504))))) (or ((_ is Undefined!728) lt!110757) (ite ((_ is Found!728) lt!110757) (= (select (arr!4912 (_keys!6073 thiss!1504)) (index!5083 lt!110757)) key!932) (ite ((_ is MissingZero!728) lt!110757) (= (select (arr!4912 (_keys!6073 thiss!1504)) (index!5082 lt!110757)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!728) lt!110757) (= (select (arr!4912 (_keys!6073 thiss!1504)) (index!5085 lt!110757)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58273 (= lt!110757 e!140006)))

(declare-fun c!36142 () Bool)

(assert (=> d!58273 (= c!36142 (and ((_ is Intermediate!728) lt!110759) (undefined!1540 lt!110759)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10369 (_ BitVec 32)) SeekEntryResult!728)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58273 (= lt!110759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9737 thiss!1504)) key!932 (_keys!6073 thiss!1504) (mask!9737 thiss!1504)))))

(assert (=> d!58273 (validMask!0 (mask!9737 thiss!1504))))

(assert (=> d!58273 (= (seekEntryOrOpen!0 key!932 (_keys!6073 thiss!1504) (mask!9737 thiss!1504)) lt!110757)))

(declare-fun b!215226 () Bool)

(declare-fun c!36143 () Bool)

(assert (=> b!215226 (= c!36143 (= lt!110758 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215226 (= e!140004 e!140005)))

(assert (= (and d!58273 c!36142) b!215221))

(assert (= (and d!58273 (not c!36142)) b!215223))

(assert (= (and b!215223 c!36144) b!215222))

(assert (= (and b!215223 (not c!36144)) b!215226))

(assert (= (and b!215226 c!36143) b!215224))

(assert (= (and b!215226 (not c!36143)) b!215225))

(declare-fun m!241991 () Bool)

(assert (=> b!215223 m!241991))

(declare-fun m!241993 () Bool)

(assert (=> b!215225 m!241993))

(assert (=> d!58273 m!241959))

(declare-fun m!241995 () Bool)

(assert (=> d!58273 m!241995))

(declare-fun m!241997 () Bool)

(assert (=> d!58273 m!241997))

(declare-fun m!241999 () Bool)

(assert (=> d!58273 m!241999))

(declare-fun m!242001 () Bool)

(assert (=> d!58273 m!242001))

(declare-fun m!242003 () Bool)

(assert (=> d!58273 m!242003))

(assert (=> d!58273 m!241997))

(assert (=> b!215156 d!58273))

(declare-fun d!58275 () Bool)

(assert (=> d!58275 (= (array_inv!3231 (_keys!6073 thiss!1504)) (bvsge (size!5242 (_keys!6073 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215155 d!58275))

(declare-fun d!58277 () Bool)

(assert (=> d!58277 (= (array_inv!3232 (_values!4027 thiss!1504)) (bvsge (size!5241 (_values!4027 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215155 d!58277))

(declare-fun d!58279 () Bool)

(declare-fun res!105269 () Bool)

(declare-fun e!140009 () Bool)

(assert (=> d!58279 (=> (not res!105269) (not e!140009))))

(declare-fun simpleValid!217 (LongMapFixedSize!2788) Bool)

(assert (=> d!58279 (= res!105269 (simpleValid!217 thiss!1504))))

(assert (=> d!58279 (= (valid!1157 thiss!1504) e!140009)))

(declare-fun b!215233 () Bool)

(declare-fun res!105270 () Bool)

(assert (=> b!215233 (=> (not res!105270) (not e!140009))))

(declare-fun arrayCountValidKeys!0 (array!10369 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215233 (= res!105270 (= (arrayCountValidKeys!0 (_keys!6073 thiss!1504) #b00000000000000000000000000000000 (size!5242 (_keys!6073 thiss!1504))) (_size!1443 thiss!1504)))))

(declare-fun b!215234 () Bool)

(declare-fun res!105271 () Bool)

(assert (=> b!215234 (=> (not res!105271) (not e!140009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10369 (_ BitVec 32)) Bool)

(assert (=> b!215234 (= res!105271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6073 thiss!1504) (mask!9737 thiss!1504)))))

(declare-fun b!215235 () Bool)

(declare-datatypes ((List!3123 0))(
  ( (Nil!3120) (Cons!3119 (h!3763 (_ BitVec 64)) (t!8069 List!3123)) )
))
(declare-fun arrayNoDuplicates!0 (array!10369 (_ BitVec 32) List!3123) Bool)

(assert (=> b!215235 (= e!140009 (arrayNoDuplicates!0 (_keys!6073 thiss!1504) #b00000000000000000000000000000000 Nil!3120))))

(assert (= (and d!58279 res!105269) b!215233))

(assert (= (and b!215233 res!105270) b!215234))

(assert (= (and b!215234 res!105271) b!215235))

(declare-fun m!242005 () Bool)

(assert (=> d!58279 m!242005))

(declare-fun m!242007 () Bool)

(assert (=> b!215233 m!242007))

(declare-fun m!242009 () Bool)

(assert (=> b!215234 m!242009))

(declare-fun m!242011 () Bool)

(assert (=> b!215235 m!242011))

(assert (=> start!21446 d!58279))

(declare-fun d!58281 () Bool)

(assert (=> d!58281 (= (validMask!0 (mask!9737 thiss!1504)) (and (or (= (mask!9737 thiss!1504) #b00000000000000000000000000000111) (= (mask!9737 thiss!1504) #b00000000000000000000000000001111) (= (mask!9737 thiss!1504) #b00000000000000000000000000011111) (= (mask!9737 thiss!1504) #b00000000000000000000000000111111) (= (mask!9737 thiss!1504) #b00000000000000000000000001111111) (= (mask!9737 thiss!1504) #b00000000000000000000000011111111) (= (mask!9737 thiss!1504) #b00000000000000000000000111111111) (= (mask!9737 thiss!1504) #b00000000000000000000001111111111) (= (mask!9737 thiss!1504) #b00000000000000000000011111111111) (= (mask!9737 thiss!1504) #b00000000000000000000111111111111) (= (mask!9737 thiss!1504) #b00000000000000000001111111111111) (= (mask!9737 thiss!1504) #b00000000000000000011111111111111) (= (mask!9737 thiss!1504) #b00000000000000000111111111111111) (= (mask!9737 thiss!1504) #b00000000000000001111111111111111) (= (mask!9737 thiss!1504) #b00000000000000011111111111111111) (= (mask!9737 thiss!1504) #b00000000000000111111111111111111) (= (mask!9737 thiss!1504) #b00000000000001111111111111111111) (= (mask!9737 thiss!1504) #b00000000000011111111111111111111) (= (mask!9737 thiss!1504) #b00000000000111111111111111111111) (= (mask!9737 thiss!1504) #b00000000001111111111111111111111) (= (mask!9737 thiss!1504) #b00000000011111111111111111111111) (= (mask!9737 thiss!1504) #b00000000111111111111111111111111) (= (mask!9737 thiss!1504) #b00000001111111111111111111111111) (= (mask!9737 thiss!1504) #b00000011111111111111111111111111) (= (mask!9737 thiss!1504) #b00000111111111111111111111111111) (= (mask!9737 thiss!1504) #b00001111111111111111111111111111) (= (mask!9737 thiss!1504) #b00011111111111111111111111111111) (= (mask!9737 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9737 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215154 d!58281))

(declare-fun condMapEmpty!9510 () Bool)

(declare-fun mapDefault!9510 () ValueCell!2444)

(assert (=> mapNonEmpty!9501 (= condMapEmpty!9510 (= mapRest!9501 ((as const (Array (_ BitVec 32) ValueCell!2444)) mapDefault!9510)))))

(declare-fun e!140014 () Bool)

(declare-fun mapRes!9510 () Bool)

(assert (=> mapNonEmpty!9501 (= tp!20249 (and e!140014 mapRes!9510))))

(declare-fun mapIsEmpty!9510 () Bool)

(assert (=> mapIsEmpty!9510 mapRes!9510))

(declare-fun b!215242 () Bool)

(declare-fun e!140015 () Bool)

(assert (=> b!215242 (= e!140015 tp_is_empty!5575)))

(declare-fun mapNonEmpty!9510 () Bool)

(declare-fun tp!20265 () Bool)

(assert (=> mapNonEmpty!9510 (= mapRes!9510 (and tp!20265 e!140015))))

(declare-fun mapValue!9510 () ValueCell!2444)

(declare-fun mapKey!9510 () (_ BitVec 32))

(declare-fun mapRest!9510 () (Array (_ BitVec 32) ValueCell!2444))

(assert (=> mapNonEmpty!9510 (= mapRest!9501 (store mapRest!9510 mapKey!9510 mapValue!9510))))

(declare-fun b!215243 () Bool)

(assert (=> b!215243 (= e!140014 tp_is_empty!5575)))

(assert (= (and mapNonEmpty!9501 condMapEmpty!9510) mapIsEmpty!9510))

(assert (= (and mapNonEmpty!9501 (not condMapEmpty!9510)) mapNonEmpty!9510))

(assert (= (and mapNonEmpty!9510 ((_ is ValueCellFull!2444) mapValue!9510)) b!215242))

(assert (= (and mapNonEmpty!9501 ((_ is ValueCellFull!2444) mapDefault!9510)) b!215243))

(declare-fun m!242013 () Bool)

(assert (=> mapNonEmpty!9510 m!242013))

(check-sat tp_is_empty!5575 (not b!215234) (not d!58273) (not b!215233) (not b_next!5713) (not b!215235) (not d!58279) (not b!215225) (not mapNonEmpty!9510) b_and!12577)
(check-sat b_and!12577 (not b_next!5713))
(get-model)

(declare-fun lt!110765 () SeekEntryResult!728)

(declare-fun d!58283 () Bool)

(assert (=> d!58283 (and (or ((_ is Undefined!728) lt!110765) (not ((_ is Found!728) lt!110765)) (and (bvsge (index!5083 lt!110765) #b00000000000000000000000000000000) (bvslt (index!5083 lt!110765) (size!5242 (_keys!6073 thiss!1504))))) (or ((_ is Undefined!728) lt!110765) ((_ is Found!728) lt!110765) (not ((_ is MissingVacant!728) lt!110765)) (not (= (index!5085 lt!110765) (index!5084 lt!110759))) (and (bvsge (index!5085 lt!110765) #b00000000000000000000000000000000) (bvslt (index!5085 lt!110765) (size!5242 (_keys!6073 thiss!1504))))) (or ((_ is Undefined!728) lt!110765) (ite ((_ is Found!728) lt!110765) (= (select (arr!4912 (_keys!6073 thiss!1504)) (index!5083 lt!110765)) key!932) (and ((_ is MissingVacant!728) lt!110765) (= (index!5085 lt!110765) (index!5084 lt!110759)) (= (select (arr!4912 (_keys!6073 thiss!1504)) (index!5085 lt!110765)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!140022 () SeekEntryResult!728)

(assert (=> d!58283 (= lt!110765 e!140022)))

(declare-fun c!36151 () Bool)

(assert (=> d!58283 (= c!36151 (bvsge (x!22484 lt!110759) #b01111111111111111111111111111110))))

(declare-fun lt!110764 () (_ BitVec 64))

(assert (=> d!58283 (= lt!110764 (select (arr!4912 (_keys!6073 thiss!1504)) (index!5084 lt!110759)))))

(assert (=> d!58283 (validMask!0 (mask!9737 thiss!1504))))

(assert (=> d!58283 (= (seekKeyOrZeroReturnVacant!0 (x!22484 lt!110759) (index!5084 lt!110759) (index!5084 lt!110759) key!932 (_keys!6073 thiss!1504) (mask!9737 thiss!1504)) lt!110765)))

(declare-fun b!215256 () Bool)

(declare-fun e!140023 () SeekEntryResult!728)

(assert (=> b!215256 (= e!140022 e!140023)))

(declare-fun c!36152 () Bool)

(assert (=> b!215256 (= c!36152 (= lt!110764 key!932))))

(declare-fun b!215257 () Bool)

(declare-fun c!36153 () Bool)

(assert (=> b!215257 (= c!36153 (= lt!110764 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140024 () SeekEntryResult!728)

(assert (=> b!215257 (= e!140023 e!140024)))

(declare-fun b!215258 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215258 (= e!140024 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22484 lt!110759) #b00000000000000000000000000000001) (nextIndex!0 (index!5084 lt!110759) (x!22484 lt!110759) (mask!9737 thiss!1504)) (index!5084 lt!110759) key!932 (_keys!6073 thiss!1504) (mask!9737 thiss!1504)))))

(declare-fun b!215259 () Bool)

(assert (=> b!215259 (= e!140022 Undefined!728)))

(declare-fun b!215260 () Bool)

(assert (=> b!215260 (= e!140023 (Found!728 (index!5084 lt!110759)))))

(declare-fun b!215261 () Bool)

(assert (=> b!215261 (= e!140024 (MissingVacant!728 (index!5084 lt!110759)))))

(assert (= (and d!58283 c!36151) b!215259))

(assert (= (and d!58283 (not c!36151)) b!215256))

(assert (= (and b!215256 c!36152) b!215260))

(assert (= (and b!215256 (not c!36152)) b!215257))

(assert (= (and b!215257 c!36153) b!215261))

(assert (= (and b!215257 (not c!36153)) b!215258))

(declare-fun m!242015 () Bool)

(assert (=> d!58283 m!242015))

(declare-fun m!242017 () Bool)

(assert (=> d!58283 m!242017))

(assert (=> d!58283 m!241991))

(assert (=> d!58283 m!241959))

(declare-fun m!242019 () Bool)

(assert (=> b!215258 m!242019))

(assert (=> b!215258 m!242019))

(declare-fun m!242021 () Bool)

(assert (=> b!215258 m!242021))

(assert (=> b!215225 d!58283))

(declare-fun b!215270 () Bool)

(declare-fun res!105282 () Bool)

(declare-fun e!140027 () Bool)

(assert (=> b!215270 (=> (not res!105282) (not e!140027))))

(assert (=> b!215270 (= res!105282 (and (= (size!5241 (_values!4027 thiss!1504)) (bvadd (mask!9737 thiss!1504) #b00000000000000000000000000000001)) (= (size!5242 (_keys!6073 thiss!1504)) (size!5241 (_values!4027 thiss!1504))) (bvsge (_size!1443 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1443 thiss!1504) (bvadd (mask!9737 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!215273 () Bool)

(assert (=> b!215273 (= e!140027 (and (bvsge (extraKeys!3781 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3781 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1443 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215272 () Bool)

(declare-fun res!105281 () Bool)

(assert (=> b!215272 (=> (not res!105281) (not e!140027))))

(declare-fun size!5247 (LongMapFixedSize!2788) (_ BitVec 32))

(assert (=> b!215272 (= res!105281 (= (size!5247 thiss!1504) (bvadd (_size!1443 thiss!1504) (bvsdiv (bvadd (extraKeys!3781 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!58285 () Bool)

(declare-fun res!105280 () Bool)

(assert (=> d!58285 (=> (not res!105280) (not e!140027))))

(assert (=> d!58285 (= res!105280 (validMask!0 (mask!9737 thiss!1504)))))

(assert (=> d!58285 (= (simpleValid!217 thiss!1504) e!140027)))

(declare-fun b!215271 () Bool)

(declare-fun res!105283 () Bool)

(assert (=> b!215271 (=> (not res!105283) (not e!140027))))

(assert (=> b!215271 (= res!105283 (bvsge (size!5247 thiss!1504) (_size!1443 thiss!1504)))))

(assert (= (and d!58285 res!105280) b!215270))

(assert (= (and b!215270 res!105282) b!215271))

(assert (= (and b!215271 res!105283) b!215272))

(assert (= (and b!215272 res!105281) b!215273))

(declare-fun m!242023 () Bool)

(assert (=> b!215272 m!242023))

(assert (=> d!58285 m!241959))

(assert (=> b!215271 m!242023))

(assert (=> d!58279 d!58285))

(declare-fun b!215285 () Bool)

(declare-fun e!140036 () Bool)

(declare-fun e!140038 () Bool)

(assert (=> b!215285 (= e!140036 e!140038)))

(declare-fun c!36156 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!215285 (= c!36156 (validKeyInArray!0 (select (arr!4912 (_keys!6073 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215286 () Bool)

(declare-fun e!140039 () Bool)

(declare-fun contains!1407 (List!3123 (_ BitVec 64)) Bool)

(assert (=> b!215286 (= e!140039 (contains!1407 Nil!3120 (select (arr!4912 (_keys!6073 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215287 () Bool)

(declare-fun call!20319 () Bool)

(assert (=> b!215287 (= e!140038 call!20319)))

(declare-fun d!58287 () Bool)

(declare-fun res!105291 () Bool)

(declare-fun e!140037 () Bool)

(assert (=> d!58287 (=> res!105291 e!140037)))

(assert (=> d!58287 (= res!105291 (bvsge #b00000000000000000000000000000000 (size!5242 (_keys!6073 thiss!1504))))))

(assert (=> d!58287 (= (arrayNoDuplicates!0 (_keys!6073 thiss!1504) #b00000000000000000000000000000000 Nil!3120) e!140037)))

(declare-fun b!215284 () Bool)

(assert (=> b!215284 (= e!140037 e!140036)))

(declare-fun res!105292 () Bool)

(assert (=> b!215284 (=> (not res!105292) (not e!140036))))

(assert (=> b!215284 (= res!105292 (not e!140039))))

(declare-fun res!105290 () Bool)

(assert (=> b!215284 (=> (not res!105290) (not e!140039))))

(assert (=> b!215284 (= res!105290 (validKeyInArray!0 (select (arr!4912 (_keys!6073 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20316 () Bool)

(assert (=> bm!20316 (= call!20319 (arrayNoDuplicates!0 (_keys!6073 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36156 (Cons!3119 (select (arr!4912 (_keys!6073 thiss!1504)) #b00000000000000000000000000000000) Nil!3120) Nil!3120)))))

(declare-fun b!215288 () Bool)

(assert (=> b!215288 (= e!140038 call!20319)))

(assert (= (and d!58287 (not res!105291)) b!215284))

(assert (= (and b!215284 res!105290) b!215286))

(assert (= (and b!215284 res!105292) b!215285))

(assert (= (and b!215285 c!36156) b!215287))

(assert (= (and b!215285 (not c!36156)) b!215288))

(assert (= (or b!215287 b!215288) bm!20316))

(declare-fun m!242025 () Bool)

(assert (=> b!215285 m!242025))

(assert (=> b!215285 m!242025))

(declare-fun m!242027 () Bool)

(assert (=> b!215285 m!242027))

(assert (=> b!215286 m!242025))

(assert (=> b!215286 m!242025))

(declare-fun m!242029 () Bool)

(assert (=> b!215286 m!242029))

(assert (=> b!215284 m!242025))

(assert (=> b!215284 m!242025))

(assert (=> b!215284 m!242027))

(assert (=> bm!20316 m!242025))

(declare-fun m!242031 () Bool)

(assert (=> bm!20316 m!242031))

(assert (=> b!215235 d!58287))

(declare-fun b!215297 () Bool)

(declare-fun e!140044 () (_ BitVec 32))

(declare-fun call!20322 () (_ BitVec 32))

(assert (=> b!215297 (= e!140044 (bvadd #b00000000000000000000000000000001 call!20322))))

(declare-fun bm!20319 () Bool)

(assert (=> bm!20319 (= call!20322 (arrayCountValidKeys!0 (_keys!6073 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5242 (_keys!6073 thiss!1504))))))

(declare-fun b!215298 () Bool)

(assert (=> b!215298 (= e!140044 call!20322)))

(declare-fun b!215299 () Bool)

(declare-fun e!140045 () (_ BitVec 32))

(assert (=> b!215299 (= e!140045 #b00000000000000000000000000000000)))

(declare-fun d!58289 () Bool)

(declare-fun lt!110768 () (_ BitVec 32))

(assert (=> d!58289 (and (bvsge lt!110768 #b00000000000000000000000000000000) (bvsle lt!110768 (bvsub (size!5242 (_keys!6073 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58289 (= lt!110768 e!140045)))

(declare-fun c!36161 () Bool)

(assert (=> d!58289 (= c!36161 (bvsge #b00000000000000000000000000000000 (size!5242 (_keys!6073 thiss!1504))))))

(assert (=> d!58289 (and (bvsle #b00000000000000000000000000000000 (size!5242 (_keys!6073 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5242 (_keys!6073 thiss!1504)) (size!5242 (_keys!6073 thiss!1504))))))

(assert (=> d!58289 (= (arrayCountValidKeys!0 (_keys!6073 thiss!1504) #b00000000000000000000000000000000 (size!5242 (_keys!6073 thiss!1504))) lt!110768)))

(declare-fun b!215300 () Bool)

(assert (=> b!215300 (= e!140045 e!140044)))

(declare-fun c!36162 () Bool)

(assert (=> b!215300 (= c!36162 (validKeyInArray!0 (select (arr!4912 (_keys!6073 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58289 c!36161) b!215299))

(assert (= (and d!58289 (not c!36161)) b!215300))

(assert (= (and b!215300 c!36162) b!215297))

(assert (= (and b!215300 (not c!36162)) b!215298))

(assert (= (or b!215297 b!215298) bm!20319))

(declare-fun m!242033 () Bool)

(assert (=> bm!20319 m!242033))

(assert (=> b!215300 m!242025))

(assert (=> b!215300 m!242025))

(assert (=> b!215300 m!242027))

(assert (=> b!215233 d!58289))

(declare-fun d!58291 () Bool)

(declare-fun e!140057 () Bool)

(assert (=> d!58291 e!140057))

(declare-fun c!36170 () Bool)

(declare-fun lt!110774 () SeekEntryResult!728)

(assert (=> d!58291 (= c!36170 (and ((_ is Intermediate!728) lt!110774) (undefined!1540 lt!110774)))))

(declare-fun e!140058 () SeekEntryResult!728)

(assert (=> d!58291 (= lt!110774 e!140058)))

(declare-fun c!36171 () Bool)

(assert (=> d!58291 (= c!36171 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!110773 () (_ BitVec 64))

(assert (=> d!58291 (= lt!110773 (select (arr!4912 (_keys!6073 thiss!1504)) (toIndex!0 key!932 (mask!9737 thiss!1504))))))

(assert (=> d!58291 (validMask!0 (mask!9737 thiss!1504))))

(assert (=> d!58291 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9737 thiss!1504)) key!932 (_keys!6073 thiss!1504) (mask!9737 thiss!1504)) lt!110774)))

(declare-fun b!215319 () Bool)

(declare-fun e!140056 () SeekEntryResult!728)

(assert (=> b!215319 (= e!140056 (Intermediate!728 false (toIndex!0 key!932 (mask!9737 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215320 () Bool)

(assert (=> b!215320 (and (bvsge (index!5084 lt!110774) #b00000000000000000000000000000000) (bvslt (index!5084 lt!110774) (size!5242 (_keys!6073 thiss!1504))))))

(declare-fun res!105301 () Bool)

(assert (=> b!215320 (= res!105301 (= (select (arr!4912 (_keys!6073 thiss!1504)) (index!5084 lt!110774)) key!932))))

(declare-fun e!140060 () Bool)

(assert (=> b!215320 (=> res!105301 e!140060)))

(declare-fun e!140059 () Bool)

(assert (=> b!215320 (= e!140059 e!140060)))

(declare-fun b!215321 () Bool)

(assert (=> b!215321 (= e!140058 (Intermediate!728 true (toIndex!0 key!932 (mask!9737 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215322 () Bool)

(assert (=> b!215322 (= e!140057 (bvsge (x!22484 lt!110774) #b01111111111111111111111111111110))))

(declare-fun b!215323 () Bool)

(assert (=> b!215323 (= e!140057 e!140059)))

(declare-fun res!105300 () Bool)

(assert (=> b!215323 (= res!105300 (and ((_ is Intermediate!728) lt!110774) (not (undefined!1540 lt!110774)) (bvslt (x!22484 lt!110774) #b01111111111111111111111111111110) (bvsge (x!22484 lt!110774) #b00000000000000000000000000000000) (bvsge (x!22484 lt!110774) #b00000000000000000000000000000000)))))

(assert (=> b!215323 (=> (not res!105300) (not e!140059))))

(declare-fun b!215324 () Bool)

(assert (=> b!215324 (= e!140056 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9737 thiss!1504)) #b00000000000000000000000000000000 (mask!9737 thiss!1504)) key!932 (_keys!6073 thiss!1504) (mask!9737 thiss!1504)))))

(declare-fun b!215325 () Bool)

(assert (=> b!215325 (and (bvsge (index!5084 lt!110774) #b00000000000000000000000000000000) (bvslt (index!5084 lt!110774) (size!5242 (_keys!6073 thiss!1504))))))

(assert (=> b!215325 (= e!140060 (= (select (arr!4912 (_keys!6073 thiss!1504)) (index!5084 lt!110774)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!215326 () Bool)

(assert (=> b!215326 (= e!140058 e!140056)))

(declare-fun c!36169 () Bool)

(assert (=> b!215326 (= c!36169 (or (= lt!110773 key!932) (= (bvadd lt!110773 lt!110773) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!215327 () Bool)

(assert (=> b!215327 (and (bvsge (index!5084 lt!110774) #b00000000000000000000000000000000) (bvslt (index!5084 lt!110774) (size!5242 (_keys!6073 thiss!1504))))))

(declare-fun res!105299 () Bool)

(assert (=> b!215327 (= res!105299 (= (select (arr!4912 (_keys!6073 thiss!1504)) (index!5084 lt!110774)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215327 (=> res!105299 e!140060)))

(assert (= (and d!58291 c!36171) b!215321))

(assert (= (and d!58291 (not c!36171)) b!215326))

(assert (= (and b!215326 c!36169) b!215319))

(assert (= (and b!215326 (not c!36169)) b!215324))

(assert (= (and d!58291 c!36170) b!215322))

(assert (= (and d!58291 (not c!36170)) b!215323))

(assert (= (and b!215323 res!105300) b!215320))

(assert (= (and b!215320 (not res!105301)) b!215327))

(assert (= (and b!215327 (not res!105299)) b!215325))

(assert (=> b!215324 m!241997))

(declare-fun m!242035 () Bool)

(assert (=> b!215324 m!242035))

(assert (=> b!215324 m!242035))

(declare-fun m!242037 () Bool)

(assert (=> b!215324 m!242037))

(declare-fun m!242039 () Bool)

(assert (=> b!215327 m!242039))

(assert (=> b!215325 m!242039))

(assert (=> d!58291 m!241997))

(declare-fun m!242041 () Bool)

(assert (=> d!58291 m!242041))

(assert (=> d!58291 m!241959))

(assert (=> b!215320 m!242039))

(assert (=> d!58273 d!58291))

(declare-fun d!58293 () Bool)

(declare-fun lt!110780 () (_ BitVec 32))

(declare-fun lt!110779 () (_ BitVec 32))

(assert (=> d!58293 (= lt!110780 (bvmul (bvxor lt!110779 (bvlshr lt!110779 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58293 (= lt!110779 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58293 (and (bvsge (mask!9737 thiss!1504) #b00000000000000000000000000000000) (let ((res!105302 (let ((h!3764 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22502 (bvmul (bvxor h!3764 (bvlshr h!3764 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22502 (bvlshr x!22502 #b00000000000000000000000000001101)) (mask!9737 thiss!1504)))))) (and (bvslt res!105302 (bvadd (mask!9737 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!105302 #b00000000000000000000000000000000))))))

(assert (=> d!58293 (= (toIndex!0 key!932 (mask!9737 thiss!1504)) (bvand (bvxor lt!110780 (bvlshr lt!110780 #b00000000000000000000000000001101)) (mask!9737 thiss!1504)))))

(assert (=> d!58273 d!58293))

(assert (=> d!58273 d!58281))

(declare-fun b!215336 () Bool)

(declare-fun e!140069 () Bool)

(declare-fun call!20325 () Bool)

(assert (=> b!215336 (= e!140069 call!20325)))

(declare-fun b!215337 () Bool)

(declare-fun e!140067 () Bool)

(assert (=> b!215337 (= e!140067 call!20325)))

(declare-fun b!215338 () Bool)

(assert (=> b!215338 (= e!140067 e!140069)))

(declare-fun lt!110787 () (_ BitVec 64))

(assert (=> b!215338 (= lt!110787 (select (arr!4912 (_keys!6073 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6454 0))(
  ( (Unit!6455) )
))
(declare-fun lt!110789 () Unit!6454)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10369 (_ BitVec 64) (_ BitVec 32)) Unit!6454)

(assert (=> b!215338 (= lt!110789 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6073 thiss!1504) lt!110787 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!215338 (arrayContainsKey!0 (_keys!6073 thiss!1504) lt!110787 #b00000000000000000000000000000000)))

(declare-fun lt!110788 () Unit!6454)

(assert (=> b!215338 (= lt!110788 lt!110789)))

(declare-fun res!105307 () Bool)

(assert (=> b!215338 (= res!105307 (= (seekEntryOrOpen!0 (select (arr!4912 (_keys!6073 thiss!1504)) #b00000000000000000000000000000000) (_keys!6073 thiss!1504) (mask!9737 thiss!1504)) (Found!728 #b00000000000000000000000000000000)))))

(assert (=> b!215338 (=> (not res!105307) (not e!140069))))

(declare-fun bm!20322 () Bool)

(assert (=> bm!20322 (= call!20325 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6073 thiss!1504) (mask!9737 thiss!1504)))))

(declare-fun b!215339 () Bool)

(declare-fun e!140068 () Bool)

(assert (=> b!215339 (= e!140068 e!140067)))

(declare-fun c!36174 () Bool)

(assert (=> b!215339 (= c!36174 (validKeyInArray!0 (select (arr!4912 (_keys!6073 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58295 () Bool)

(declare-fun res!105308 () Bool)

(assert (=> d!58295 (=> res!105308 e!140068)))

(assert (=> d!58295 (= res!105308 (bvsge #b00000000000000000000000000000000 (size!5242 (_keys!6073 thiss!1504))))))

(assert (=> d!58295 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6073 thiss!1504) (mask!9737 thiss!1504)) e!140068)))

(assert (= (and d!58295 (not res!105308)) b!215339))

(assert (= (and b!215339 c!36174) b!215338))

(assert (= (and b!215339 (not c!36174)) b!215337))

(assert (= (and b!215338 res!105307) b!215336))

(assert (= (or b!215336 b!215337) bm!20322))

(assert (=> b!215338 m!242025))

(declare-fun m!242043 () Bool)

(assert (=> b!215338 m!242043))

(declare-fun m!242045 () Bool)

(assert (=> b!215338 m!242045))

(assert (=> b!215338 m!242025))

(declare-fun m!242047 () Bool)

(assert (=> b!215338 m!242047))

(declare-fun m!242049 () Bool)

(assert (=> bm!20322 m!242049))

(assert (=> b!215339 m!242025))

(assert (=> b!215339 m!242025))

(assert (=> b!215339 m!242027))

(assert (=> b!215234 d!58295))

(declare-fun condMapEmpty!9511 () Bool)

(declare-fun mapDefault!9511 () ValueCell!2444)

(assert (=> mapNonEmpty!9510 (= condMapEmpty!9511 (= mapRest!9510 ((as const (Array (_ BitVec 32) ValueCell!2444)) mapDefault!9511)))))

(declare-fun e!140070 () Bool)

(declare-fun mapRes!9511 () Bool)

(assert (=> mapNonEmpty!9510 (= tp!20265 (and e!140070 mapRes!9511))))

(declare-fun mapIsEmpty!9511 () Bool)

(assert (=> mapIsEmpty!9511 mapRes!9511))

(declare-fun b!215340 () Bool)

(declare-fun e!140071 () Bool)

(assert (=> b!215340 (= e!140071 tp_is_empty!5575)))

(declare-fun mapNonEmpty!9511 () Bool)

(declare-fun tp!20266 () Bool)

(assert (=> mapNonEmpty!9511 (= mapRes!9511 (and tp!20266 e!140071))))

(declare-fun mapValue!9511 () ValueCell!2444)

(declare-fun mapKey!9511 () (_ BitVec 32))

(declare-fun mapRest!9511 () (Array (_ BitVec 32) ValueCell!2444))

(assert (=> mapNonEmpty!9511 (= mapRest!9510 (store mapRest!9511 mapKey!9511 mapValue!9511))))

(declare-fun b!215341 () Bool)

(assert (=> b!215341 (= e!140070 tp_is_empty!5575)))

(assert (= (and mapNonEmpty!9510 condMapEmpty!9511) mapIsEmpty!9511))

(assert (= (and mapNonEmpty!9510 (not condMapEmpty!9511)) mapNonEmpty!9511))

(assert (= (and mapNonEmpty!9511 ((_ is ValueCellFull!2444) mapValue!9511)) b!215340))

(assert (= (and mapNonEmpty!9510 ((_ is ValueCellFull!2444) mapDefault!9511)) b!215341))

(declare-fun m!242051 () Bool)

(assert (=> mapNonEmpty!9511 m!242051))

(check-sat tp_is_empty!5575 (not b!215286) (not bm!20316) (not mapNonEmpty!9511) (not b!215272) (not b!215339) (not b!215258) (not bm!20322) (not b!215338) (not b!215285) (not b!215284) (not d!58283) (not d!58285) (not bm!20319) b_and!12577 (not b!215300) (not b!215324) (not d!58291) (not b!215271) (not b_next!5713))
(check-sat b_and!12577 (not b_next!5713))
