; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21446 () Bool)

(assert start!21446)

(declare-fun b!215348 () Bool)

(declare-fun b_free!5713 () Bool)

(declare-fun b_next!5713 () Bool)

(assert (=> b!215348 (= b_free!5713 (not b_next!5713))))

(declare-fun tp!20249 () Bool)

(declare-fun b_and!12617 () Bool)

(assert (=> b!215348 (= tp!20249 b_and!12617)))

(declare-fun b!215347 () Bool)

(declare-fun e!140078 () Bool)

(declare-datatypes ((V!7081 0))(
  ( (V!7082 (val!2832 Int)) )
))
(declare-datatypes ((ValueCell!2444 0))(
  ( (ValueCellFull!2444 (v!4851 V!7081)) (EmptyCell!2444) )
))
(declare-datatypes ((array!10373 0))(
  ( (array!10374 (arr!4915 (Array (_ BitVec 32) ValueCell!2444)) (size!5244 (_ BitVec 32))) )
))
(declare-datatypes ((array!10375 0))(
  ( (array!10376 (arr!4916 (Array (_ BitVec 32) (_ BitVec 64))) (size!5245 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2788 0))(
  ( (LongMapFixedSize!2789 (defaultEntry!4044 Int) (mask!9738 (_ BitVec 32)) (extraKeys!3781 (_ BitVec 32)) (zeroValue!3885 V!7081) (minValue!3885 V!7081) (_size!1443 (_ BitVec 32)) (_keys!6074 array!10375) (_values!4027 array!10373) (_vacant!1443 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2788)

(assert (=> b!215347 (= e!140078 (and (= (size!5244 (_values!4027 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9738 thiss!1504))) (not (= (size!5245 (_keys!6074 thiss!1504)) (size!5244 (_values!4027 thiss!1504))))))))

(declare-fun e!140077 () Bool)

(declare-fun e!140074 () Bool)

(declare-fun tp_is_empty!5575 () Bool)

(declare-fun array_inv!3231 (array!10375) Bool)

(declare-fun array_inv!3232 (array!10373) Bool)

(assert (=> b!215348 (= e!140077 (and tp!20249 tp_is_empty!5575 (array_inv!3231 (_keys!6074 thiss!1504)) (array_inv!3232 (_values!4027 thiss!1504)) e!140074))))

(declare-fun b!215349 () Bool)

(declare-fun res!105351 () Bool)

(assert (=> b!215349 (=> (not res!105351) (not e!140078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215349 (= res!105351 (validMask!0 (mask!9738 thiss!1504)))))

(declare-fun b!215350 () Bool)

(declare-fun res!105352 () Bool)

(declare-fun e!140079 () Bool)

(assert (=> b!215350 (=> (not res!105352) (not e!140079))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!215350 (= res!105352 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!215352 () Bool)

(assert (=> b!215352 (= e!140079 e!140078)))

(declare-fun res!105354 () Bool)

(assert (=> b!215352 (=> (not res!105354) (not e!140078))))

(declare-datatypes ((SeekEntryResult!719 0))(
  ( (MissingZero!719 (index!5046 (_ BitVec 32))) (Found!719 (index!5047 (_ BitVec 32))) (Intermediate!719 (undefined!1531 Bool) (index!5048 (_ BitVec 32)) (x!22476 (_ BitVec 32))) (Undefined!719) (MissingVacant!719 (index!5049 (_ BitVec 32))) )
))
(declare-fun lt!110984 () SeekEntryResult!719)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215352 (= res!105354 (or (= lt!110984 (MissingZero!719 index!297)) (= lt!110984 (MissingVacant!719 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10375 (_ BitVec 32)) SeekEntryResult!719)

(assert (=> b!215352 (= lt!110984 (seekEntryOrOpen!0 key!932 (_keys!6074 thiss!1504) (mask!9738 thiss!1504)))))

(declare-fun b!215353 () Bool)

(declare-fun e!140080 () Bool)

(assert (=> b!215353 (= e!140080 tp_is_empty!5575)))

(declare-fun mapNonEmpty!9501 () Bool)

(declare-fun mapRes!9501 () Bool)

(declare-fun tp!20250 () Bool)

(assert (=> mapNonEmpty!9501 (= mapRes!9501 (and tp!20250 e!140080))))

(declare-fun mapKey!9501 () (_ BitVec 32))

(declare-fun mapValue!9501 () ValueCell!2444)

(declare-fun mapRest!9501 () (Array (_ BitVec 32) ValueCell!2444))

(assert (=> mapNonEmpty!9501 (= (arr!4915 (_values!4027 thiss!1504)) (store mapRest!9501 mapKey!9501 mapValue!9501))))

(declare-fun b!215354 () Bool)

(declare-fun e!140076 () Bool)

(assert (=> b!215354 (= e!140074 (and e!140076 mapRes!9501))))

(declare-fun condMapEmpty!9501 () Bool)

(declare-fun mapDefault!9501 () ValueCell!2444)

(assert (=> b!215354 (= condMapEmpty!9501 (= (arr!4915 (_values!4027 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2444)) mapDefault!9501)))))

(declare-fun mapIsEmpty!9501 () Bool)

(assert (=> mapIsEmpty!9501 mapRes!9501))

(declare-fun b!215351 () Bool)

(assert (=> b!215351 (= e!140076 tp_is_empty!5575)))

(declare-fun res!105353 () Bool)

(assert (=> start!21446 (=> (not res!105353) (not e!140079))))

(declare-fun valid!1158 (LongMapFixedSize!2788) Bool)

(assert (=> start!21446 (= res!105353 (valid!1158 thiss!1504))))

(assert (=> start!21446 e!140079))

(assert (=> start!21446 e!140077))

(assert (=> start!21446 true))

(assert (= (and start!21446 res!105353) b!215350))

(assert (= (and b!215350 res!105352) b!215352))

(assert (= (and b!215352 res!105354) b!215349))

(assert (= (and b!215349 res!105351) b!215347))

(assert (= (and b!215354 condMapEmpty!9501) mapIsEmpty!9501))

(assert (= (and b!215354 (not condMapEmpty!9501)) mapNonEmpty!9501))

(get-info :version)

(assert (= (and mapNonEmpty!9501 ((_ is ValueCellFull!2444) mapValue!9501)) b!215353))

(assert (= (and b!215354 ((_ is ValueCellFull!2444) mapDefault!9501)) b!215351))

(assert (= b!215348 b!215354))

(assert (= start!21446 b!215348))

(declare-fun m!242753 () Bool)

(assert (=> start!21446 m!242753))

(declare-fun m!242755 () Bool)

(assert (=> b!215349 m!242755))

(declare-fun m!242757 () Bool)

(assert (=> b!215352 m!242757))

(declare-fun m!242759 () Bool)

(assert (=> b!215348 m!242759))

(declare-fun m!242761 () Bool)

(assert (=> b!215348 m!242761))

(declare-fun m!242763 () Bool)

(assert (=> mapNonEmpty!9501 m!242763))

(check-sat (not b!215349) (not b!215352) (not mapNonEmpty!9501) (not b!215348) (not b_next!5713) (not start!21446) b_and!12617 tp_is_empty!5575)
(check-sat b_and!12617 (not b_next!5713))
(get-model)

(declare-fun b!215415 () Bool)

(declare-fun e!140130 () SeekEntryResult!719)

(declare-fun lt!110998 () SeekEntryResult!719)

(assert (=> b!215415 (= e!140130 (MissingZero!719 (index!5048 lt!110998)))))

(declare-fun b!215416 () Bool)

(declare-fun c!36182 () Bool)

(declare-fun lt!110999 () (_ BitVec 64))

(assert (=> b!215416 (= c!36182 (= lt!110999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140131 () SeekEntryResult!719)

(assert (=> b!215416 (= e!140131 e!140130)))

(declare-fun b!215417 () Bool)

(declare-fun e!140129 () SeekEntryResult!719)

(assert (=> b!215417 (= e!140129 Undefined!719)))

(declare-fun d!58495 () Bool)

(declare-fun lt!110997 () SeekEntryResult!719)

(assert (=> d!58495 (and (or ((_ is Undefined!719) lt!110997) (not ((_ is Found!719) lt!110997)) (and (bvsge (index!5047 lt!110997) #b00000000000000000000000000000000) (bvslt (index!5047 lt!110997) (size!5245 (_keys!6074 thiss!1504))))) (or ((_ is Undefined!719) lt!110997) ((_ is Found!719) lt!110997) (not ((_ is MissingZero!719) lt!110997)) (and (bvsge (index!5046 lt!110997) #b00000000000000000000000000000000) (bvslt (index!5046 lt!110997) (size!5245 (_keys!6074 thiss!1504))))) (or ((_ is Undefined!719) lt!110997) ((_ is Found!719) lt!110997) ((_ is MissingZero!719) lt!110997) (not ((_ is MissingVacant!719) lt!110997)) (and (bvsge (index!5049 lt!110997) #b00000000000000000000000000000000) (bvslt (index!5049 lt!110997) (size!5245 (_keys!6074 thiss!1504))))) (or ((_ is Undefined!719) lt!110997) (ite ((_ is Found!719) lt!110997) (= (select (arr!4916 (_keys!6074 thiss!1504)) (index!5047 lt!110997)) key!932) (ite ((_ is MissingZero!719) lt!110997) (= (select (arr!4916 (_keys!6074 thiss!1504)) (index!5046 lt!110997)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!719) lt!110997) (= (select (arr!4916 (_keys!6074 thiss!1504)) (index!5049 lt!110997)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58495 (= lt!110997 e!140129)))

(declare-fun c!36181 () Bool)

(assert (=> d!58495 (= c!36181 (and ((_ is Intermediate!719) lt!110998) (undefined!1531 lt!110998)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10375 (_ BitVec 32)) SeekEntryResult!719)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58495 (= lt!110998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9738 thiss!1504)) key!932 (_keys!6074 thiss!1504) (mask!9738 thiss!1504)))))

(assert (=> d!58495 (validMask!0 (mask!9738 thiss!1504))))

(assert (=> d!58495 (= (seekEntryOrOpen!0 key!932 (_keys!6074 thiss!1504) (mask!9738 thiss!1504)) lt!110997)))

(declare-fun b!215418 () Bool)

(assert (=> b!215418 (= e!140129 e!140131)))

(assert (=> b!215418 (= lt!110999 (select (arr!4916 (_keys!6074 thiss!1504)) (index!5048 lt!110998)))))

(declare-fun c!36183 () Bool)

(assert (=> b!215418 (= c!36183 (= lt!110999 key!932))))

(declare-fun b!215419 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10375 (_ BitVec 32)) SeekEntryResult!719)

(assert (=> b!215419 (= e!140130 (seekKeyOrZeroReturnVacant!0 (x!22476 lt!110998) (index!5048 lt!110998) (index!5048 lt!110998) key!932 (_keys!6074 thiss!1504) (mask!9738 thiss!1504)))))

(declare-fun b!215420 () Bool)

(assert (=> b!215420 (= e!140131 (Found!719 (index!5048 lt!110998)))))

(assert (= (and d!58495 c!36181) b!215417))

(assert (= (and d!58495 (not c!36181)) b!215418))

(assert (= (and b!215418 c!36183) b!215420))

(assert (= (and b!215418 (not c!36183)) b!215416))

(assert (= (and b!215416 c!36182) b!215415))

(assert (= (and b!215416 (not c!36182)) b!215419))

(declare-fun m!242789 () Bool)

(assert (=> d!58495 m!242789))

(declare-fun m!242791 () Bool)

(assert (=> d!58495 m!242791))

(declare-fun m!242793 () Bool)

(assert (=> d!58495 m!242793))

(declare-fun m!242795 () Bool)

(assert (=> d!58495 m!242795))

(assert (=> d!58495 m!242755))

(assert (=> d!58495 m!242793))

(declare-fun m!242797 () Bool)

(assert (=> d!58495 m!242797))

(declare-fun m!242799 () Bool)

(assert (=> b!215418 m!242799))

(declare-fun m!242801 () Bool)

(assert (=> b!215419 m!242801))

(assert (=> b!215352 d!58495))

(declare-fun d!58497 () Bool)

(assert (=> d!58497 (= (array_inv!3231 (_keys!6074 thiss!1504)) (bvsge (size!5245 (_keys!6074 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215348 d!58497))

(declare-fun d!58499 () Bool)

(assert (=> d!58499 (= (array_inv!3232 (_values!4027 thiss!1504)) (bvsge (size!5244 (_values!4027 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215348 d!58499))

(declare-fun d!58501 () Bool)

(declare-fun res!105385 () Bool)

(declare-fun e!140134 () Bool)

(assert (=> d!58501 (=> (not res!105385) (not e!140134))))

(declare-fun simpleValid!217 (LongMapFixedSize!2788) Bool)

(assert (=> d!58501 (= res!105385 (simpleValid!217 thiss!1504))))

(assert (=> d!58501 (= (valid!1158 thiss!1504) e!140134)))

(declare-fun b!215427 () Bool)

(declare-fun res!105386 () Bool)

(assert (=> b!215427 (=> (not res!105386) (not e!140134))))

(declare-fun arrayCountValidKeys!0 (array!10375 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215427 (= res!105386 (= (arrayCountValidKeys!0 (_keys!6074 thiss!1504) #b00000000000000000000000000000000 (size!5245 (_keys!6074 thiss!1504))) (_size!1443 thiss!1504)))))

(declare-fun b!215428 () Bool)

(declare-fun res!105387 () Bool)

(assert (=> b!215428 (=> (not res!105387) (not e!140134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10375 (_ BitVec 32)) Bool)

(assert (=> b!215428 (= res!105387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6074 thiss!1504) (mask!9738 thiss!1504)))))

(declare-fun b!215429 () Bool)

(declare-datatypes ((List!3071 0))(
  ( (Nil!3068) (Cons!3067 (h!3711 (_ BitVec 64)) (t!8018 List!3071)) )
))
(declare-fun arrayNoDuplicates!0 (array!10375 (_ BitVec 32) List!3071) Bool)

(assert (=> b!215429 (= e!140134 (arrayNoDuplicates!0 (_keys!6074 thiss!1504) #b00000000000000000000000000000000 Nil!3068))))

(assert (= (and d!58501 res!105385) b!215427))

(assert (= (and b!215427 res!105386) b!215428))

(assert (= (and b!215428 res!105387) b!215429))

(declare-fun m!242803 () Bool)

(assert (=> d!58501 m!242803))

(declare-fun m!242805 () Bool)

(assert (=> b!215427 m!242805))

(declare-fun m!242807 () Bool)

(assert (=> b!215428 m!242807))

(declare-fun m!242809 () Bool)

(assert (=> b!215429 m!242809))

(assert (=> start!21446 d!58501))

(declare-fun d!58503 () Bool)

(assert (=> d!58503 (= (validMask!0 (mask!9738 thiss!1504)) (and (or (= (mask!9738 thiss!1504) #b00000000000000000000000000000111) (= (mask!9738 thiss!1504) #b00000000000000000000000000001111) (= (mask!9738 thiss!1504) #b00000000000000000000000000011111) (= (mask!9738 thiss!1504) #b00000000000000000000000000111111) (= (mask!9738 thiss!1504) #b00000000000000000000000001111111) (= (mask!9738 thiss!1504) #b00000000000000000000000011111111) (= (mask!9738 thiss!1504) #b00000000000000000000000111111111) (= (mask!9738 thiss!1504) #b00000000000000000000001111111111) (= (mask!9738 thiss!1504) #b00000000000000000000011111111111) (= (mask!9738 thiss!1504) #b00000000000000000000111111111111) (= (mask!9738 thiss!1504) #b00000000000000000001111111111111) (= (mask!9738 thiss!1504) #b00000000000000000011111111111111) (= (mask!9738 thiss!1504) #b00000000000000000111111111111111) (= (mask!9738 thiss!1504) #b00000000000000001111111111111111) (= (mask!9738 thiss!1504) #b00000000000000011111111111111111) (= (mask!9738 thiss!1504) #b00000000000000111111111111111111) (= (mask!9738 thiss!1504) #b00000000000001111111111111111111) (= (mask!9738 thiss!1504) #b00000000000011111111111111111111) (= (mask!9738 thiss!1504) #b00000000000111111111111111111111) (= (mask!9738 thiss!1504) #b00000000001111111111111111111111) (= (mask!9738 thiss!1504) #b00000000011111111111111111111111) (= (mask!9738 thiss!1504) #b00000000111111111111111111111111) (= (mask!9738 thiss!1504) #b00000001111111111111111111111111) (= (mask!9738 thiss!1504) #b00000011111111111111111111111111) (= (mask!9738 thiss!1504) #b00000111111111111111111111111111) (= (mask!9738 thiss!1504) #b00001111111111111111111111111111) (= (mask!9738 thiss!1504) #b00011111111111111111111111111111) (= (mask!9738 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9738 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215349 d!58503))

(declare-fun mapIsEmpty!9510 () Bool)

(declare-fun mapRes!9510 () Bool)

(assert (=> mapIsEmpty!9510 mapRes!9510))

(declare-fun mapNonEmpty!9510 () Bool)

(declare-fun tp!20265 () Bool)

(declare-fun e!140139 () Bool)

(assert (=> mapNonEmpty!9510 (= mapRes!9510 (and tp!20265 e!140139))))

(declare-fun mapKey!9510 () (_ BitVec 32))

(declare-fun mapRest!9510 () (Array (_ BitVec 32) ValueCell!2444))

(declare-fun mapValue!9510 () ValueCell!2444)

(assert (=> mapNonEmpty!9510 (= mapRest!9501 (store mapRest!9510 mapKey!9510 mapValue!9510))))

(declare-fun condMapEmpty!9510 () Bool)

(declare-fun mapDefault!9510 () ValueCell!2444)

(assert (=> mapNonEmpty!9501 (= condMapEmpty!9510 (= mapRest!9501 ((as const (Array (_ BitVec 32) ValueCell!2444)) mapDefault!9510)))))

(declare-fun e!140140 () Bool)

(assert (=> mapNonEmpty!9501 (= tp!20250 (and e!140140 mapRes!9510))))

(declare-fun b!215437 () Bool)

(assert (=> b!215437 (= e!140140 tp_is_empty!5575)))

(declare-fun b!215436 () Bool)

(assert (=> b!215436 (= e!140139 tp_is_empty!5575)))

(assert (= (and mapNonEmpty!9501 condMapEmpty!9510) mapIsEmpty!9510))

(assert (= (and mapNonEmpty!9501 (not condMapEmpty!9510)) mapNonEmpty!9510))

(assert (= (and mapNonEmpty!9510 ((_ is ValueCellFull!2444) mapValue!9510)) b!215436))

(assert (= (and mapNonEmpty!9501 ((_ is ValueCellFull!2444) mapDefault!9510)) b!215437))

(declare-fun m!242811 () Bool)

(assert (=> mapNonEmpty!9510 m!242811))

(check-sat (not d!58495) (not b!215427) (not b!215428) (not d!58501) (not b_next!5713) (not b!215419) (not mapNonEmpty!9510) (not b!215429) b_and!12617 tp_is_empty!5575)
(check-sat b_and!12617 (not b_next!5713))
(get-model)

(declare-fun d!58505 () Bool)

(declare-fun lt!111005 () SeekEntryResult!719)

(assert (=> d!58505 (and (or ((_ is Undefined!719) lt!111005) (not ((_ is Found!719) lt!111005)) (and (bvsge (index!5047 lt!111005) #b00000000000000000000000000000000) (bvslt (index!5047 lt!111005) (size!5245 (_keys!6074 thiss!1504))))) (or ((_ is Undefined!719) lt!111005) ((_ is Found!719) lt!111005) (not ((_ is MissingVacant!719) lt!111005)) (not (= (index!5049 lt!111005) (index!5048 lt!110998))) (and (bvsge (index!5049 lt!111005) #b00000000000000000000000000000000) (bvslt (index!5049 lt!111005) (size!5245 (_keys!6074 thiss!1504))))) (or ((_ is Undefined!719) lt!111005) (ite ((_ is Found!719) lt!111005) (= (select (arr!4916 (_keys!6074 thiss!1504)) (index!5047 lt!111005)) key!932) (and ((_ is MissingVacant!719) lt!111005) (= (index!5049 lt!111005) (index!5048 lt!110998)) (= (select (arr!4916 (_keys!6074 thiss!1504)) (index!5049 lt!111005)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!140149 () SeekEntryResult!719)

(assert (=> d!58505 (= lt!111005 e!140149)))

(declare-fun c!36190 () Bool)

(assert (=> d!58505 (= c!36190 (bvsge (x!22476 lt!110998) #b01111111111111111111111111111110))))

(declare-fun lt!111004 () (_ BitVec 64))

(assert (=> d!58505 (= lt!111004 (select (arr!4916 (_keys!6074 thiss!1504)) (index!5048 lt!110998)))))

(assert (=> d!58505 (validMask!0 (mask!9738 thiss!1504))))

(assert (=> d!58505 (= (seekKeyOrZeroReturnVacant!0 (x!22476 lt!110998) (index!5048 lt!110998) (index!5048 lt!110998) key!932 (_keys!6074 thiss!1504) (mask!9738 thiss!1504)) lt!111005)))

(declare-fun b!215450 () Bool)

(declare-fun c!36191 () Bool)

(assert (=> b!215450 (= c!36191 (= lt!111004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140148 () SeekEntryResult!719)

(declare-fun e!140147 () SeekEntryResult!719)

(assert (=> b!215450 (= e!140148 e!140147)))

(declare-fun b!215451 () Bool)

(assert (=> b!215451 (= e!140148 (Found!719 (index!5048 lt!110998)))))

(declare-fun b!215452 () Bool)

(assert (=> b!215452 (= e!140149 e!140148)))

(declare-fun c!36192 () Bool)

(assert (=> b!215452 (= c!36192 (= lt!111004 key!932))))

(declare-fun b!215453 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215453 (= e!140147 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22476 lt!110998) #b00000000000000000000000000000001) (nextIndex!0 (index!5048 lt!110998) (bvadd (x!22476 lt!110998) #b00000000000000000000000000000001) (mask!9738 thiss!1504)) (index!5048 lt!110998) key!932 (_keys!6074 thiss!1504) (mask!9738 thiss!1504)))))

(declare-fun b!215454 () Bool)

(assert (=> b!215454 (= e!140149 Undefined!719)))

(declare-fun b!215455 () Bool)

(assert (=> b!215455 (= e!140147 (MissingVacant!719 (index!5048 lt!110998)))))

(assert (= (and d!58505 c!36190) b!215454))

(assert (= (and d!58505 (not c!36190)) b!215452))

(assert (= (and b!215452 c!36192) b!215451))

(assert (= (and b!215452 (not c!36192)) b!215450))

(assert (= (and b!215450 c!36191) b!215455))

(assert (= (and b!215450 (not c!36191)) b!215453))

(declare-fun m!242813 () Bool)

(assert (=> d!58505 m!242813))

(declare-fun m!242815 () Bool)

(assert (=> d!58505 m!242815))

(assert (=> d!58505 m!242799))

(assert (=> d!58505 m!242755))

(declare-fun m!242817 () Bool)

(assert (=> b!215453 m!242817))

(assert (=> b!215453 m!242817))

(declare-fun m!242819 () Bool)

(assert (=> b!215453 m!242819))

(assert (=> b!215419 d!58505))

(declare-fun b!215465 () Bool)

(declare-fun res!105399 () Bool)

(declare-fun e!140152 () Bool)

(assert (=> b!215465 (=> (not res!105399) (not e!140152))))

(declare-fun size!5250 (LongMapFixedSize!2788) (_ BitVec 32))

(assert (=> b!215465 (= res!105399 (bvsge (size!5250 thiss!1504) (_size!1443 thiss!1504)))))

(declare-fun d!58507 () Bool)

(declare-fun res!105396 () Bool)

(assert (=> d!58507 (=> (not res!105396) (not e!140152))))

(assert (=> d!58507 (= res!105396 (validMask!0 (mask!9738 thiss!1504)))))

(assert (=> d!58507 (= (simpleValid!217 thiss!1504) e!140152)))

(declare-fun b!215464 () Bool)

(declare-fun res!105397 () Bool)

(assert (=> b!215464 (=> (not res!105397) (not e!140152))))

(assert (=> b!215464 (= res!105397 (and (= (size!5244 (_values!4027 thiss!1504)) (bvadd (mask!9738 thiss!1504) #b00000000000000000000000000000001)) (= (size!5245 (_keys!6074 thiss!1504)) (size!5244 (_values!4027 thiss!1504))) (bvsge (_size!1443 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1443 thiss!1504) (bvadd (mask!9738 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!215466 () Bool)

(declare-fun res!105398 () Bool)

(assert (=> b!215466 (=> (not res!105398) (not e!140152))))

(assert (=> b!215466 (= res!105398 (= (size!5250 thiss!1504) (bvadd (_size!1443 thiss!1504) (bvsdiv (bvadd (extraKeys!3781 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!215467 () Bool)

(assert (=> b!215467 (= e!140152 (and (bvsge (extraKeys!3781 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3781 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1443 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and d!58507 res!105396) b!215464))

(assert (= (and b!215464 res!105397) b!215465))

(assert (= (and b!215465 res!105399) b!215466))

(assert (= (and b!215466 res!105398) b!215467))

(declare-fun m!242821 () Bool)

(assert (=> b!215465 m!242821))

(assert (=> d!58507 m!242755))

(assert (=> b!215466 m!242821))

(assert (=> d!58501 d!58507))

(declare-fun b!215486 () Bool)

(declare-fun e!140164 () SeekEntryResult!719)

(assert (=> b!215486 (= e!140164 (Intermediate!719 false (toIndex!0 key!932 (mask!9738 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215487 () Bool)

(declare-fun e!140165 () Bool)

(declare-fun e!140166 () Bool)

(assert (=> b!215487 (= e!140165 e!140166)))

(declare-fun res!105406 () Bool)

(declare-fun lt!111010 () SeekEntryResult!719)

(assert (=> b!215487 (= res!105406 (and ((_ is Intermediate!719) lt!111010) (not (undefined!1531 lt!111010)) (bvslt (x!22476 lt!111010) #b01111111111111111111111111111110) (bvsge (x!22476 lt!111010) #b00000000000000000000000000000000) (bvsge (x!22476 lt!111010) #b00000000000000000000000000000000)))))

(assert (=> b!215487 (=> (not res!105406) (not e!140166))))

(declare-fun b!215488 () Bool)

(assert (=> b!215488 (and (bvsge (index!5048 lt!111010) #b00000000000000000000000000000000) (bvslt (index!5048 lt!111010) (size!5245 (_keys!6074 thiss!1504))))))

(declare-fun e!140167 () Bool)

(assert (=> b!215488 (= e!140167 (= (select (arr!4916 (_keys!6074 thiss!1504)) (index!5048 lt!111010)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!58509 () Bool)

(assert (=> d!58509 e!140165))

(declare-fun c!36199 () Bool)

(assert (=> d!58509 (= c!36199 (and ((_ is Intermediate!719) lt!111010) (undefined!1531 lt!111010)))))

(declare-fun e!140163 () SeekEntryResult!719)

(assert (=> d!58509 (= lt!111010 e!140163)))

(declare-fun c!36201 () Bool)

(assert (=> d!58509 (= c!36201 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!111011 () (_ BitVec 64))

(assert (=> d!58509 (= lt!111011 (select (arr!4916 (_keys!6074 thiss!1504)) (toIndex!0 key!932 (mask!9738 thiss!1504))))))

(assert (=> d!58509 (validMask!0 (mask!9738 thiss!1504))))

(assert (=> d!58509 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9738 thiss!1504)) key!932 (_keys!6074 thiss!1504) (mask!9738 thiss!1504)) lt!111010)))

(declare-fun b!215489 () Bool)

(assert (=> b!215489 (and (bvsge (index!5048 lt!111010) #b00000000000000000000000000000000) (bvslt (index!5048 lt!111010) (size!5245 (_keys!6074 thiss!1504))))))

(declare-fun res!105408 () Bool)

(assert (=> b!215489 (= res!105408 (= (select (arr!4916 (_keys!6074 thiss!1504)) (index!5048 lt!111010)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215489 (=> res!105408 e!140167)))

(declare-fun b!215490 () Bool)

(assert (=> b!215490 (= e!140163 (Intermediate!719 true (toIndex!0 key!932 (mask!9738 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215491 () Bool)

(assert (=> b!215491 (= e!140163 e!140164)))

(declare-fun c!36200 () Bool)

(assert (=> b!215491 (= c!36200 (or (= lt!111011 key!932) (= (bvadd lt!111011 lt!111011) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!215492 () Bool)

(assert (=> b!215492 (and (bvsge (index!5048 lt!111010) #b00000000000000000000000000000000) (bvslt (index!5048 lt!111010) (size!5245 (_keys!6074 thiss!1504))))))

(declare-fun res!105407 () Bool)

(assert (=> b!215492 (= res!105407 (= (select (arr!4916 (_keys!6074 thiss!1504)) (index!5048 lt!111010)) key!932))))

(assert (=> b!215492 (=> res!105407 e!140167)))

(assert (=> b!215492 (= e!140166 e!140167)))

(declare-fun b!215493 () Bool)

(assert (=> b!215493 (= e!140165 (bvsge (x!22476 lt!111010) #b01111111111111111111111111111110))))

(declare-fun b!215494 () Bool)

(assert (=> b!215494 (= e!140164 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9738 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9738 thiss!1504)) key!932 (_keys!6074 thiss!1504) (mask!9738 thiss!1504)))))

(assert (= (and d!58509 c!36201) b!215490))

(assert (= (and d!58509 (not c!36201)) b!215491))

(assert (= (and b!215491 c!36200) b!215486))

(assert (= (and b!215491 (not c!36200)) b!215494))

(assert (= (and d!58509 c!36199) b!215493))

(assert (= (and d!58509 (not c!36199)) b!215487))

(assert (= (and b!215487 res!105406) b!215492))

(assert (= (and b!215492 (not res!105407)) b!215489))

(assert (= (and b!215489 (not res!105408)) b!215488))

(declare-fun m!242823 () Bool)

(assert (=> b!215489 m!242823))

(assert (=> d!58509 m!242793))

(declare-fun m!242825 () Bool)

(assert (=> d!58509 m!242825))

(assert (=> d!58509 m!242755))

(assert (=> b!215488 m!242823))

(assert (=> b!215492 m!242823))

(assert (=> b!215494 m!242793))

(declare-fun m!242827 () Bool)

(assert (=> b!215494 m!242827))

(assert (=> b!215494 m!242827))

(declare-fun m!242829 () Bool)

(assert (=> b!215494 m!242829))

(assert (=> d!58495 d!58509))

(declare-fun d!58511 () Bool)

(declare-fun lt!111017 () (_ BitVec 32))

(declare-fun lt!111016 () (_ BitVec 32))

(assert (=> d!58511 (= lt!111017 (bvmul (bvxor lt!111016 (bvlshr lt!111016 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58511 (= lt!111016 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58511 (and (bvsge (mask!9738 thiss!1504) #b00000000000000000000000000000000) (let ((res!105409 (let ((h!3712 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22495 (bvmul (bvxor h!3712 (bvlshr h!3712 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22495 (bvlshr x!22495 #b00000000000000000000000000001101)) (mask!9738 thiss!1504)))))) (and (bvslt res!105409 (bvadd (mask!9738 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!105409 #b00000000000000000000000000000000))))))

(assert (=> d!58511 (= (toIndex!0 key!932 (mask!9738 thiss!1504)) (bvand (bvxor lt!111017 (bvlshr lt!111017 #b00000000000000000000000000001101)) (mask!9738 thiss!1504)))))

(assert (=> d!58495 d!58511))

(assert (=> d!58495 d!58503))

(declare-fun d!58513 () Bool)

(declare-fun lt!111020 () (_ BitVec 32))

(assert (=> d!58513 (and (bvsge lt!111020 #b00000000000000000000000000000000) (bvsle lt!111020 (bvsub (size!5245 (_keys!6074 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!140172 () (_ BitVec 32))

(assert (=> d!58513 (= lt!111020 e!140172)))

(declare-fun c!36207 () Bool)

(assert (=> d!58513 (= c!36207 (bvsge #b00000000000000000000000000000000 (size!5245 (_keys!6074 thiss!1504))))))

(assert (=> d!58513 (and (bvsle #b00000000000000000000000000000000 (size!5245 (_keys!6074 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5245 (_keys!6074 thiss!1504)) (size!5245 (_keys!6074 thiss!1504))))))

(assert (=> d!58513 (= (arrayCountValidKeys!0 (_keys!6074 thiss!1504) #b00000000000000000000000000000000 (size!5245 (_keys!6074 thiss!1504))) lt!111020)))

(declare-fun b!215503 () Bool)

(declare-fun e!140173 () (_ BitVec 32))

(assert (=> b!215503 (= e!140172 e!140173)))

(declare-fun c!36206 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!215503 (= c!36206 (validKeyInArray!0 (select (arr!4916 (_keys!6074 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215504 () Bool)

(declare-fun call!20331 () (_ BitVec 32))

(assert (=> b!215504 (= e!140173 (bvadd #b00000000000000000000000000000001 call!20331))))

(declare-fun b!215505 () Bool)

(assert (=> b!215505 (= e!140173 call!20331)))

(declare-fun bm!20328 () Bool)

(assert (=> bm!20328 (= call!20331 (arrayCountValidKeys!0 (_keys!6074 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5245 (_keys!6074 thiss!1504))))))

(declare-fun b!215506 () Bool)

(assert (=> b!215506 (= e!140172 #b00000000000000000000000000000000)))

(assert (= (and d!58513 c!36207) b!215506))

(assert (= (and d!58513 (not c!36207)) b!215503))

(assert (= (and b!215503 c!36206) b!215504))

(assert (= (and b!215503 (not c!36206)) b!215505))

(assert (= (or b!215504 b!215505) bm!20328))

(declare-fun m!242831 () Bool)

(assert (=> b!215503 m!242831))

(assert (=> b!215503 m!242831))

(declare-fun m!242833 () Bool)

(assert (=> b!215503 m!242833))

(declare-fun m!242835 () Bool)

(assert (=> bm!20328 m!242835))

(assert (=> b!215427 d!58513))

(declare-fun bm!20331 () Bool)

(declare-fun call!20334 () Bool)

(declare-fun c!36210 () Bool)

(assert (=> bm!20331 (= call!20334 (arrayNoDuplicates!0 (_keys!6074 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36210 (Cons!3067 (select (arr!4916 (_keys!6074 thiss!1504)) #b00000000000000000000000000000000) Nil!3068) Nil!3068)))))

(declare-fun b!215517 () Bool)

(declare-fun e!140185 () Bool)

(declare-fun e!140184 () Bool)

(assert (=> b!215517 (= e!140185 e!140184)))

(assert (=> b!215517 (= c!36210 (validKeyInArray!0 (select (arr!4916 (_keys!6074 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215518 () Bool)

(assert (=> b!215518 (= e!140184 call!20334)))

(declare-fun b!215519 () Bool)

(assert (=> b!215519 (= e!140184 call!20334)))

(declare-fun b!215520 () Bool)

(declare-fun e!140182 () Bool)

(assert (=> b!215520 (= e!140182 e!140185)))

(declare-fun res!105418 () Bool)

(assert (=> b!215520 (=> (not res!105418) (not e!140185))))

(declare-fun e!140183 () Bool)

(assert (=> b!215520 (= res!105418 (not e!140183))))

(declare-fun res!105416 () Bool)

(assert (=> b!215520 (=> (not res!105416) (not e!140183))))

(assert (=> b!215520 (= res!105416 (validKeyInArray!0 (select (arr!4916 (_keys!6074 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58515 () Bool)

(declare-fun res!105417 () Bool)

(assert (=> d!58515 (=> res!105417 e!140182)))

(assert (=> d!58515 (= res!105417 (bvsge #b00000000000000000000000000000000 (size!5245 (_keys!6074 thiss!1504))))))

(assert (=> d!58515 (= (arrayNoDuplicates!0 (_keys!6074 thiss!1504) #b00000000000000000000000000000000 Nil!3068) e!140182)))

(declare-fun b!215521 () Bool)

(declare-fun contains!1412 (List!3071 (_ BitVec 64)) Bool)

(assert (=> b!215521 (= e!140183 (contains!1412 Nil!3068 (select (arr!4916 (_keys!6074 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58515 (not res!105417)) b!215520))

(assert (= (and b!215520 res!105416) b!215521))

(assert (= (and b!215520 res!105418) b!215517))

(assert (= (and b!215517 c!36210) b!215518))

(assert (= (and b!215517 (not c!36210)) b!215519))

(assert (= (or b!215518 b!215519) bm!20331))

(assert (=> bm!20331 m!242831))

(declare-fun m!242837 () Bool)

(assert (=> bm!20331 m!242837))

(assert (=> b!215517 m!242831))

(assert (=> b!215517 m!242831))

(assert (=> b!215517 m!242833))

(assert (=> b!215520 m!242831))

(assert (=> b!215520 m!242831))

(assert (=> b!215520 m!242833))

(assert (=> b!215521 m!242831))

(assert (=> b!215521 m!242831))

(declare-fun m!242839 () Bool)

(assert (=> b!215521 m!242839))

(assert (=> b!215429 d!58515))

(declare-fun b!215530 () Bool)

(declare-fun e!140194 () Bool)

(declare-fun call!20337 () Bool)

(assert (=> b!215530 (= e!140194 call!20337)))

(declare-fun b!215531 () Bool)

(declare-fun e!140193 () Bool)

(assert (=> b!215531 (= e!140193 e!140194)))

(declare-fun c!36213 () Bool)

(assert (=> b!215531 (= c!36213 (validKeyInArray!0 (select (arr!4916 (_keys!6074 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215532 () Bool)

(declare-fun e!140192 () Bool)

(assert (=> b!215532 (= e!140192 call!20337)))

(declare-fun d!58517 () Bool)

(declare-fun res!105423 () Bool)

(assert (=> d!58517 (=> res!105423 e!140193)))

(assert (=> d!58517 (= res!105423 (bvsge #b00000000000000000000000000000000 (size!5245 (_keys!6074 thiss!1504))))))

(assert (=> d!58517 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6074 thiss!1504) (mask!9738 thiss!1504)) e!140193)))

(declare-fun bm!20334 () Bool)

(assert (=> bm!20334 (= call!20337 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6074 thiss!1504) (mask!9738 thiss!1504)))))

(declare-fun b!215533 () Bool)

(assert (=> b!215533 (= e!140194 e!140192)))

(declare-fun lt!111029 () (_ BitVec 64))

(assert (=> b!215533 (= lt!111029 (select (arr!4916 (_keys!6074 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6482 0))(
  ( (Unit!6483) )
))
(declare-fun lt!111028 () Unit!6482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10375 (_ BitVec 64) (_ BitVec 32)) Unit!6482)

(assert (=> b!215533 (= lt!111028 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6074 thiss!1504) lt!111029 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!215533 (arrayContainsKey!0 (_keys!6074 thiss!1504) lt!111029 #b00000000000000000000000000000000)))

(declare-fun lt!111027 () Unit!6482)

(assert (=> b!215533 (= lt!111027 lt!111028)))

(declare-fun res!105424 () Bool)

(assert (=> b!215533 (= res!105424 (= (seekEntryOrOpen!0 (select (arr!4916 (_keys!6074 thiss!1504)) #b00000000000000000000000000000000) (_keys!6074 thiss!1504) (mask!9738 thiss!1504)) (Found!719 #b00000000000000000000000000000000)))))

(assert (=> b!215533 (=> (not res!105424) (not e!140192))))

(assert (= (and d!58517 (not res!105423)) b!215531))

(assert (= (and b!215531 c!36213) b!215533))

(assert (= (and b!215531 (not c!36213)) b!215530))

(assert (= (and b!215533 res!105424) b!215532))

(assert (= (or b!215532 b!215530) bm!20334))

(assert (=> b!215531 m!242831))

(assert (=> b!215531 m!242831))

(assert (=> b!215531 m!242833))

(declare-fun m!242841 () Bool)

(assert (=> bm!20334 m!242841))

(assert (=> b!215533 m!242831))

(declare-fun m!242843 () Bool)

(assert (=> b!215533 m!242843))

(declare-fun m!242845 () Bool)

(assert (=> b!215533 m!242845))

(assert (=> b!215533 m!242831))

(declare-fun m!242847 () Bool)

(assert (=> b!215533 m!242847))

(assert (=> b!215428 d!58517))

(declare-fun mapIsEmpty!9511 () Bool)

(declare-fun mapRes!9511 () Bool)

(assert (=> mapIsEmpty!9511 mapRes!9511))

(declare-fun mapNonEmpty!9511 () Bool)

(declare-fun tp!20266 () Bool)

(declare-fun e!140195 () Bool)

(assert (=> mapNonEmpty!9511 (= mapRes!9511 (and tp!20266 e!140195))))

(declare-fun mapKey!9511 () (_ BitVec 32))

(declare-fun mapValue!9511 () ValueCell!2444)

(declare-fun mapRest!9511 () (Array (_ BitVec 32) ValueCell!2444))

(assert (=> mapNonEmpty!9511 (= mapRest!9510 (store mapRest!9511 mapKey!9511 mapValue!9511))))

(declare-fun condMapEmpty!9511 () Bool)

(declare-fun mapDefault!9511 () ValueCell!2444)

(assert (=> mapNonEmpty!9510 (= condMapEmpty!9511 (= mapRest!9510 ((as const (Array (_ BitVec 32) ValueCell!2444)) mapDefault!9511)))))

(declare-fun e!140196 () Bool)

(assert (=> mapNonEmpty!9510 (= tp!20265 (and e!140196 mapRes!9511))))

(declare-fun b!215535 () Bool)

(assert (=> b!215535 (= e!140196 tp_is_empty!5575)))

(declare-fun b!215534 () Bool)

(assert (=> b!215534 (= e!140195 tp_is_empty!5575)))

(assert (= (and mapNonEmpty!9510 condMapEmpty!9511) mapIsEmpty!9511))

(assert (= (and mapNonEmpty!9510 (not condMapEmpty!9511)) mapNonEmpty!9511))

(assert (= (and mapNonEmpty!9511 ((_ is ValueCellFull!2444) mapValue!9511)) b!215534))

(assert (= (and mapNonEmpty!9510 ((_ is ValueCellFull!2444) mapDefault!9511)) b!215535))

(declare-fun m!242849 () Bool)

(assert (=> mapNonEmpty!9511 m!242849))

(check-sat (not b!215453) (not b!215466) (not d!58505) (not bm!20334) (not b!215533) (not d!58507) (not b!215517) (not mapNonEmpty!9511) (not bm!20331) (not d!58509) (not b!215494) (not b!215520) (not b!215521) (not b!215531) (not b_next!5713) (not b!215503) b_and!12617 tp_is_empty!5575 (not b!215465) (not bm!20328))
(check-sat b_and!12617 (not b_next!5713))
