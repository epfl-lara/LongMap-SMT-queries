; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18618 () Bool)

(assert start!18618)

(declare-fun b!184130 () Bool)

(declare-fun b_free!4543 () Bool)

(declare-fun b_next!4543 () Bool)

(assert (=> b!184130 (= b_free!4543 (not b_next!4543))))

(declare-fun tp!16411 () Bool)

(declare-fun b_and!11101 () Bool)

(assert (=> b!184130 (= tp!16411 b_and!11101)))

(declare-fun b!184125 () Bool)

(declare-fun res!87092 () Bool)

(declare-fun e!121201 () Bool)

(assert (=> b!184125 (=> (not res!87092) (not e!121201))))

(declare-datatypes ((V!5401 0))(
  ( (V!5402 (val!2202 Int)) )
))
(declare-datatypes ((ValueCell!1814 0))(
  ( (ValueCellFull!1814 (v!4102 V!5401)) (EmptyCell!1814) )
))
(declare-datatypes ((array!7809 0))(
  ( (array!7810 (arr!3688 (Array (_ BitVec 32) (_ BitVec 64))) (size!4003 (_ BitVec 32))) )
))
(declare-datatypes ((array!7811 0))(
  ( (array!7812 (arr!3689 (Array (_ BitVec 32) ValueCell!1814)) (size!4004 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2536 0))(
  ( (LongMapFixedSize!2537 (defaultEntry!3763 Int) (mask!8844 (_ BitVec 32)) (extraKeys!3500 (_ BitVec 32)) (zeroValue!3604 V!5401) (minValue!3604 V!5401) (_size!1317 (_ BitVec 32)) (_keys!5689 array!7809) (_values!3746 array!7811) (_vacant!1317 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2536)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3398 0))(
  ( (tuple2!3399 (_1!1710 (_ BitVec 64)) (_2!1710 V!5401)) )
))
(declare-datatypes ((List!2337 0))(
  ( (Nil!2334) (Cons!2333 (h!2964 tuple2!3398) (t!7202 List!2337)) )
))
(declare-datatypes ((ListLongMap!2307 0))(
  ( (ListLongMap!2308 (toList!1169 List!2337)) )
))
(declare-fun contains!1265 (ListLongMap!2307 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!802 (array!7809 array!7811 (_ BitVec 32) (_ BitVec 32) V!5401 V!5401 (_ BitVec 32) Int) ListLongMap!2307)

(assert (=> b!184125 (= res!87092 (not (contains!1265 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)) key!828)))))

(declare-fun b!184126 () Bool)

(declare-fun res!87094 () Bool)

(declare-fun e!121200 () Bool)

(assert (=> b!184126 (=> (not res!87094) (not e!121200))))

(assert (=> b!184126 (= res!87094 (not (= key!828 (bvneg key!828))))))

(declare-fun b!184127 () Bool)

(declare-fun e!121199 () Bool)

(declare-fun tp_is_empty!4315 () Bool)

(assert (=> b!184127 (= e!121199 tp_is_empty!4315)))

(declare-fun mapNonEmpty!7417 () Bool)

(declare-fun mapRes!7417 () Bool)

(declare-fun tp!16410 () Bool)

(assert (=> mapNonEmpty!7417 (= mapRes!7417 (and tp!16410 e!121199))))

(declare-fun mapRest!7417 () (Array (_ BitVec 32) ValueCell!1814))

(declare-fun mapKey!7417 () (_ BitVec 32))

(declare-fun mapValue!7417 () ValueCell!1814)

(assert (=> mapNonEmpty!7417 (= (arr!3689 (_values!3746 thiss!1248)) (store mapRest!7417 mapKey!7417 mapValue!7417))))

(declare-fun b!184128 () Bool)

(assert (=> b!184128 (= e!121201 (and (= (size!4004 (_values!3746 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8844 thiss!1248))) (= (size!4003 (_keys!5689 thiss!1248)) (size!4004 (_values!3746 thiss!1248))) (bvsge (mask!8844 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3500 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!184129 () Bool)

(declare-fun e!121197 () Bool)

(assert (=> b!184129 (= e!121197 tp_is_empty!4315)))

(declare-fun mapIsEmpty!7417 () Bool)

(assert (=> mapIsEmpty!7417 mapRes!7417))

(declare-fun res!87095 () Bool)

(assert (=> start!18618 (=> (not res!87095) (not e!121200))))

(declare-fun valid!1065 (LongMapFixedSize!2536) Bool)

(assert (=> start!18618 (= res!87095 (valid!1065 thiss!1248))))

(assert (=> start!18618 e!121200))

(declare-fun e!121198 () Bool)

(assert (=> start!18618 e!121198))

(assert (=> start!18618 true))

(declare-fun e!121196 () Bool)

(declare-fun array_inv!2385 (array!7809) Bool)

(declare-fun array_inv!2386 (array!7811) Bool)

(assert (=> b!184130 (= e!121198 (and tp!16411 tp_is_empty!4315 (array_inv!2385 (_keys!5689 thiss!1248)) (array_inv!2386 (_values!3746 thiss!1248)) e!121196))))

(declare-fun b!184131 () Bool)

(assert (=> b!184131 (= e!121200 e!121201)))

(declare-fun res!87093 () Bool)

(assert (=> b!184131 (=> (not res!87093) (not e!121201))))

(declare-datatypes ((SeekEntryResult!626 0))(
  ( (MissingZero!626 (index!4674 (_ BitVec 32))) (Found!626 (index!4675 (_ BitVec 32))) (Intermediate!626 (undefined!1438 Bool) (index!4676 (_ BitVec 32)) (x!20049 (_ BitVec 32))) (Undefined!626) (MissingVacant!626 (index!4677 (_ BitVec 32))) )
))
(declare-fun lt!90946 () SeekEntryResult!626)

(get-info :version)

(assert (=> b!184131 (= res!87093 (and (not ((_ is Undefined!626) lt!90946)) (not ((_ is MissingVacant!626) lt!90946)) (not ((_ is MissingZero!626) lt!90946)) ((_ is Found!626) lt!90946)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7809 (_ BitVec 32)) SeekEntryResult!626)

(assert (=> b!184131 (= lt!90946 (seekEntryOrOpen!0 key!828 (_keys!5689 thiss!1248) (mask!8844 thiss!1248)))))

(declare-fun b!184132 () Bool)

(assert (=> b!184132 (= e!121196 (and e!121197 mapRes!7417))))

(declare-fun condMapEmpty!7417 () Bool)

(declare-fun mapDefault!7417 () ValueCell!1814)

(assert (=> b!184132 (= condMapEmpty!7417 (= (arr!3689 (_values!3746 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1814)) mapDefault!7417)))))

(declare-fun b!184133 () Bool)

(declare-fun res!87091 () Bool)

(assert (=> b!184133 (=> (not res!87091) (not e!121201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!184133 (= res!87091 (validMask!0 (mask!8844 thiss!1248)))))

(assert (= (and start!18618 res!87095) b!184126))

(assert (= (and b!184126 res!87094) b!184131))

(assert (= (and b!184131 res!87093) b!184125))

(assert (= (and b!184125 res!87092) b!184133))

(assert (= (and b!184133 res!87091) b!184128))

(assert (= (and b!184132 condMapEmpty!7417) mapIsEmpty!7417))

(assert (= (and b!184132 (not condMapEmpty!7417)) mapNonEmpty!7417))

(assert (= (and mapNonEmpty!7417 ((_ is ValueCellFull!1814) mapValue!7417)) b!184127))

(assert (= (and b!184132 ((_ is ValueCellFull!1814) mapDefault!7417)) b!184129))

(assert (= b!184130 b!184132))

(assert (= start!18618 b!184130))

(declare-fun m!211065 () Bool)

(assert (=> b!184125 m!211065))

(assert (=> b!184125 m!211065))

(declare-fun m!211067 () Bool)

(assert (=> b!184125 m!211067))

(declare-fun m!211069 () Bool)

(assert (=> b!184130 m!211069))

(declare-fun m!211071 () Bool)

(assert (=> b!184130 m!211071))

(declare-fun m!211073 () Bool)

(assert (=> b!184133 m!211073))

(declare-fun m!211075 () Bool)

(assert (=> b!184131 m!211075))

(declare-fun m!211077 () Bool)

(assert (=> start!18618 m!211077))

(declare-fun m!211079 () Bool)

(assert (=> mapNonEmpty!7417 m!211079))

(check-sat (not b!184130) (not start!18618) (not b!184131) (not b_next!4543) b_and!11101 (not b!184133) (not b!184125) (not mapNonEmpty!7417) tp_is_empty!4315)
(check-sat b_and!11101 (not b_next!4543))
(get-model)

(declare-fun d!54751 () Bool)

(assert (=> d!54751 (= (array_inv!2385 (_keys!5689 thiss!1248)) (bvsge (size!4003 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184130 d!54751))

(declare-fun d!54753 () Bool)

(assert (=> d!54753 (= (array_inv!2386 (_values!3746 thiss!1248)) (bvsge (size!4004 (_values!3746 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184130 d!54753))

(declare-fun d!54755 () Bool)

(declare-fun res!87132 () Bool)

(declare-fun e!121246 () Bool)

(assert (=> d!54755 (=> (not res!87132) (not e!121246))))

(declare-fun simpleValid!178 (LongMapFixedSize!2536) Bool)

(assert (=> d!54755 (= res!87132 (simpleValid!178 thiss!1248))))

(assert (=> d!54755 (= (valid!1065 thiss!1248) e!121246)))

(declare-fun b!184194 () Bool)

(declare-fun res!87133 () Bool)

(assert (=> b!184194 (=> (not res!87133) (not e!121246))))

(declare-fun arrayCountValidKeys!0 (array!7809 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184194 (= res!87133 (= (arrayCountValidKeys!0 (_keys!5689 thiss!1248) #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))) (_size!1317 thiss!1248)))))

(declare-fun b!184195 () Bool)

(declare-fun res!87134 () Bool)

(assert (=> b!184195 (=> (not res!87134) (not e!121246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7809 (_ BitVec 32)) Bool)

(assert (=> b!184195 (= res!87134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5689 thiss!1248) (mask!8844 thiss!1248)))))

(declare-fun b!184196 () Bool)

(declare-datatypes ((List!2339 0))(
  ( (Nil!2336) (Cons!2335 (h!2966 (_ BitVec 64)) (t!7206 List!2339)) )
))
(declare-fun arrayNoDuplicates!0 (array!7809 (_ BitVec 32) List!2339) Bool)

(assert (=> b!184196 (= e!121246 (arrayNoDuplicates!0 (_keys!5689 thiss!1248) #b00000000000000000000000000000000 Nil!2336))))

(assert (= (and d!54755 res!87132) b!184194))

(assert (= (and b!184194 res!87133) b!184195))

(assert (= (and b!184195 res!87134) b!184196))

(declare-fun m!211113 () Bool)

(assert (=> d!54755 m!211113))

(declare-fun m!211115 () Bool)

(assert (=> b!184194 m!211115))

(declare-fun m!211117 () Bool)

(assert (=> b!184195 m!211117))

(declare-fun m!211119 () Bool)

(assert (=> b!184196 m!211119))

(assert (=> start!18618 d!54755))

(declare-fun b!184209 () Bool)

(declare-fun e!121255 () SeekEntryResult!626)

(declare-fun lt!90960 () SeekEntryResult!626)

(assert (=> b!184209 (= e!121255 (Found!626 (index!4676 lt!90960)))))

(declare-fun b!184210 () Bool)

(declare-fun c!33028 () Bool)

(declare-fun lt!90959 () (_ BitVec 64))

(assert (=> b!184210 (= c!33028 (= lt!90959 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!121254 () SeekEntryResult!626)

(assert (=> b!184210 (= e!121255 e!121254)))

(declare-fun b!184211 () Bool)

(declare-fun e!121253 () SeekEntryResult!626)

(assert (=> b!184211 (= e!121253 e!121255)))

(assert (=> b!184211 (= lt!90959 (select (arr!3688 (_keys!5689 thiss!1248)) (index!4676 lt!90960)))))

(declare-fun c!33030 () Bool)

(assert (=> b!184211 (= c!33030 (= lt!90959 key!828))))

(declare-fun d!54757 () Bool)

(declare-fun lt!90961 () SeekEntryResult!626)

(assert (=> d!54757 (and (or ((_ is Undefined!626) lt!90961) (not ((_ is Found!626) lt!90961)) (and (bvsge (index!4675 lt!90961) #b00000000000000000000000000000000) (bvslt (index!4675 lt!90961) (size!4003 (_keys!5689 thiss!1248))))) (or ((_ is Undefined!626) lt!90961) ((_ is Found!626) lt!90961) (not ((_ is MissingZero!626) lt!90961)) (and (bvsge (index!4674 lt!90961) #b00000000000000000000000000000000) (bvslt (index!4674 lt!90961) (size!4003 (_keys!5689 thiss!1248))))) (or ((_ is Undefined!626) lt!90961) ((_ is Found!626) lt!90961) ((_ is MissingZero!626) lt!90961) (not ((_ is MissingVacant!626) lt!90961)) (and (bvsge (index!4677 lt!90961) #b00000000000000000000000000000000) (bvslt (index!4677 lt!90961) (size!4003 (_keys!5689 thiss!1248))))) (or ((_ is Undefined!626) lt!90961) (ite ((_ is Found!626) lt!90961) (= (select (arr!3688 (_keys!5689 thiss!1248)) (index!4675 lt!90961)) key!828) (ite ((_ is MissingZero!626) lt!90961) (= (select (arr!3688 (_keys!5689 thiss!1248)) (index!4674 lt!90961)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!626) lt!90961) (= (select (arr!3688 (_keys!5689 thiss!1248)) (index!4677 lt!90961)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54757 (= lt!90961 e!121253)))

(declare-fun c!33029 () Bool)

(assert (=> d!54757 (= c!33029 (and ((_ is Intermediate!626) lt!90960) (undefined!1438 lt!90960)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7809 (_ BitVec 32)) SeekEntryResult!626)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54757 (= lt!90960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8844 thiss!1248)) key!828 (_keys!5689 thiss!1248) (mask!8844 thiss!1248)))))

(assert (=> d!54757 (validMask!0 (mask!8844 thiss!1248))))

(assert (=> d!54757 (= (seekEntryOrOpen!0 key!828 (_keys!5689 thiss!1248) (mask!8844 thiss!1248)) lt!90961)))

(declare-fun b!184212 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7809 (_ BitVec 32)) SeekEntryResult!626)

(assert (=> b!184212 (= e!121254 (seekKeyOrZeroReturnVacant!0 (x!20049 lt!90960) (index!4676 lt!90960) (index!4676 lt!90960) key!828 (_keys!5689 thiss!1248) (mask!8844 thiss!1248)))))

(declare-fun b!184213 () Bool)

(assert (=> b!184213 (= e!121254 (MissingZero!626 (index!4676 lt!90960)))))

(declare-fun b!184214 () Bool)

(assert (=> b!184214 (= e!121253 Undefined!626)))

(assert (= (and d!54757 c!33029) b!184214))

(assert (= (and d!54757 (not c!33029)) b!184211))

(assert (= (and b!184211 c!33030) b!184209))

(assert (= (and b!184211 (not c!33030)) b!184210))

(assert (= (and b!184210 c!33028) b!184213))

(assert (= (and b!184210 (not c!33028)) b!184212))

(declare-fun m!211121 () Bool)

(assert (=> b!184211 m!211121))

(declare-fun m!211123 () Bool)

(assert (=> d!54757 m!211123))

(declare-fun m!211125 () Bool)

(assert (=> d!54757 m!211125))

(declare-fun m!211127 () Bool)

(assert (=> d!54757 m!211127))

(declare-fun m!211129 () Bool)

(assert (=> d!54757 m!211129))

(assert (=> d!54757 m!211123))

(declare-fun m!211131 () Bool)

(assert (=> d!54757 m!211131))

(assert (=> d!54757 m!211073))

(declare-fun m!211133 () Bool)

(assert (=> b!184212 m!211133))

(assert (=> b!184131 d!54757))

(declare-fun d!54759 () Bool)

(assert (=> d!54759 (= (validMask!0 (mask!8844 thiss!1248)) (and (or (= (mask!8844 thiss!1248) #b00000000000000000000000000000111) (= (mask!8844 thiss!1248) #b00000000000000000000000000001111) (= (mask!8844 thiss!1248) #b00000000000000000000000000011111) (= (mask!8844 thiss!1248) #b00000000000000000000000000111111) (= (mask!8844 thiss!1248) #b00000000000000000000000001111111) (= (mask!8844 thiss!1248) #b00000000000000000000000011111111) (= (mask!8844 thiss!1248) #b00000000000000000000000111111111) (= (mask!8844 thiss!1248) #b00000000000000000000001111111111) (= (mask!8844 thiss!1248) #b00000000000000000000011111111111) (= (mask!8844 thiss!1248) #b00000000000000000000111111111111) (= (mask!8844 thiss!1248) #b00000000000000000001111111111111) (= (mask!8844 thiss!1248) #b00000000000000000011111111111111) (= (mask!8844 thiss!1248) #b00000000000000000111111111111111) (= (mask!8844 thiss!1248) #b00000000000000001111111111111111) (= (mask!8844 thiss!1248) #b00000000000000011111111111111111) (= (mask!8844 thiss!1248) #b00000000000000111111111111111111) (= (mask!8844 thiss!1248) #b00000000000001111111111111111111) (= (mask!8844 thiss!1248) #b00000000000011111111111111111111) (= (mask!8844 thiss!1248) #b00000000000111111111111111111111) (= (mask!8844 thiss!1248) #b00000000001111111111111111111111) (= (mask!8844 thiss!1248) #b00000000011111111111111111111111) (= (mask!8844 thiss!1248) #b00000000111111111111111111111111) (= (mask!8844 thiss!1248) #b00000001111111111111111111111111) (= (mask!8844 thiss!1248) #b00000011111111111111111111111111) (= (mask!8844 thiss!1248) #b00000111111111111111111111111111) (= (mask!8844 thiss!1248) #b00001111111111111111111111111111) (= (mask!8844 thiss!1248) #b00011111111111111111111111111111) (= (mask!8844 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8844 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!184133 d!54759))

(declare-fun d!54761 () Bool)

(declare-fun e!121261 () Bool)

(assert (=> d!54761 e!121261))

(declare-fun res!87137 () Bool)

(assert (=> d!54761 (=> res!87137 e!121261)))

(declare-fun lt!90971 () Bool)

(assert (=> d!54761 (= res!87137 (not lt!90971))))

(declare-fun lt!90970 () Bool)

(assert (=> d!54761 (= lt!90971 lt!90970)))

(declare-datatypes ((Unit!5539 0))(
  ( (Unit!5540) )
))
(declare-fun lt!90973 () Unit!5539)

(declare-fun e!121260 () Unit!5539)

(assert (=> d!54761 (= lt!90973 e!121260)))

(declare-fun c!33033 () Bool)

(assert (=> d!54761 (= c!33033 lt!90970)))

(declare-fun containsKey!221 (List!2337 (_ BitVec 64)) Bool)

(assert (=> d!54761 (= lt!90970 (containsKey!221 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828))))

(assert (=> d!54761 (= (contains!1265 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)) key!828) lt!90971)))

(declare-fun b!184221 () Bool)

(declare-fun lt!90972 () Unit!5539)

(assert (=> b!184221 (= e!121260 lt!90972)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!170 (List!2337 (_ BitVec 64)) Unit!5539)

(assert (=> b!184221 (= lt!90972 (lemmaContainsKeyImpliesGetValueByKeyDefined!170 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828))))

(declare-datatypes ((Option!223 0))(
  ( (Some!222 (v!4105 V!5401)) (None!221) )
))
(declare-fun isDefined!171 (Option!223) Bool)

(declare-fun getValueByKey!217 (List!2337 (_ BitVec 64)) Option!223)

(assert (=> b!184221 (isDefined!171 (getValueByKey!217 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828))))

(declare-fun b!184222 () Bool)

(declare-fun Unit!5541 () Unit!5539)

(assert (=> b!184222 (= e!121260 Unit!5541)))

(declare-fun b!184223 () Bool)

(assert (=> b!184223 (= e!121261 (isDefined!171 (getValueByKey!217 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828)))))

(assert (= (and d!54761 c!33033) b!184221))

(assert (= (and d!54761 (not c!33033)) b!184222))

(assert (= (and d!54761 (not res!87137)) b!184223))

(declare-fun m!211135 () Bool)

(assert (=> d!54761 m!211135))

(declare-fun m!211137 () Bool)

(assert (=> b!184221 m!211137))

(declare-fun m!211139 () Bool)

(assert (=> b!184221 m!211139))

(assert (=> b!184221 m!211139))

(declare-fun m!211141 () Bool)

(assert (=> b!184221 m!211141))

(assert (=> b!184223 m!211139))

(assert (=> b!184223 m!211139))

(assert (=> b!184223 m!211141))

(assert (=> b!184125 d!54761))

(declare-fun b!184267 () Bool)

(declare-fun c!33047 () Bool)

(assert (=> b!184267 (= c!33047 (and (not (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!121289 () ListLongMap!2307)

(declare-fun e!121294 () ListLongMap!2307)

(assert (=> b!184267 (= e!121289 e!121294)))

(declare-fun bm!18583 () Bool)

(declare-fun call!18587 () ListLongMap!2307)

(declare-fun call!18588 () ListLongMap!2307)

(assert (=> bm!18583 (= call!18587 call!18588)))

(declare-fun b!184268 () Bool)

(declare-fun e!121290 () ListLongMap!2307)

(declare-fun call!18586 () ListLongMap!2307)

(declare-fun +!279 (ListLongMap!2307 tuple2!3398) ListLongMap!2307)

(assert (=> b!184268 (= e!121290 (+!279 call!18586 (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))))

(declare-fun b!184269 () Bool)

(declare-fun e!121291 () Bool)

(declare-fun lt!91021 () ListLongMap!2307)

(declare-fun apply!162 (ListLongMap!2307 (_ BitVec 64)) V!5401)

(assert (=> b!184269 (= e!121291 (= (apply!162 lt!91021 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3604 thiss!1248)))))

(declare-fun b!184270 () Bool)

(declare-fun e!121298 () Bool)

(declare-fun e!121296 () Bool)

(assert (=> b!184270 (= e!121298 e!121296)))

(declare-fun res!87158 () Bool)

(assert (=> b!184270 (=> (not res!87158) (not e!121296))))

(assert (=> b!184270 (= res!87158 (contains!1265 lt!91021 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184270 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))))))

(declare-fun bm!18584 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!183 (array!7809 array!7811 (_ BitVec 32) (_ BitVec 32) V!5401 V!5401 (_ BitVec 32) Int) ListLongMap!2307)

(assert (=> bm!18584 (= call!18588 (getCurrentListMapNoExtraKeys!183 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))))

(declare-fun bm!18585 () Bool)

(declare-fun call!18591 () Bool)

(assert (=> bm!18585 (= call!18591 (contains!1265 lt!91021 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184271 () Bool)

(declare-fun e!121299 () Bool)

(assert (=> b!184271 (= e!121299 e!121291)))

(declare-fun res!87164 () Bool)

(assert (=> b!184271 (= res!87164 call!18591)))

(assert (=> b!184271 (=> (not res!87164) (not e!121291))))

(declare-fun b!184272 () Bool)

(declare-fun e!121300 () Bool)

(declare-fun e!121295 () Bool)

(assert (=> b!184272 (= e!121300 e!121295)))

(declare-fun c!33046 () Bool)

(assert (=> b!184272 (= c!33046 (not (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184273 () Bool)

(declare-fun call!18589 () ListLongMap!2307)

(assert (=> b!184273 (= e!121289 call!18589)))

(declare-fun b!184274 () Bool)

(declare-fun e!121297 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!184274 (= e!121297 (validKeyInArray!0 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184275 () Bool)

(declare-fun call!18590 () Bool)

(assert (=> b!184275 (= e!121295 (not call!18590))))

(declare-fun b!184276 () Bool)

(declare-fun get!2117 (ValueCell!1814 V!5401) V!5401)

(declare-fun dynLambda!496 (Int (_ BitVec 64)) V!5401)

(assert (=> b!184276 (= e!121296 (= (apply!162 lt!91021 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)) (get!2117 (select (arr!3689 (_values!3746 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3763 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!184276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4004 (_values!3746 thiss!1248))))))

(assert (=> b!184276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))))))

(declare-fun b!184266 () Bool)

(declare-fun res!87161 () Bool)

(assert (=> b!184266 (=> (not res!87161) (not e!121300))))

(assert (=> b!184266 (= res!87161 e!121298)))

(declare-fun res!87159 () Bool)

(assert (=> b!184266 (=> res!87159 e!121298)))

(assert (=> b!184266 (= res!87159 (not e!121297))))

(declare-fun res!87156 () Bool)

(assert (=> b!184266 (=> (not res!87156) (not e!121297))))

(assert (=> b!184266 (= res!87156 (bvslt #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))))))

(declare-fun d!54763 () Bool)

(assert (=> d!54763 e!121300))

(declare-fun res!87157 () Bool)

(assert (=> d!54763 (=> (not res!87157) (not e!121300))))

(assert (=> d!54763 (= res!87157 (or (bvsge #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))))))))

(declare-fun lt!91019 () ListLongMap!2307)

(assert (=> d!54763 (= lt!91021 lt!91019)))

(declare-fun lt!91038 () Unit!5539)

(declare-fun e!121288 () Unit!5539)

(assert (=> d!54763 (= lt!91038 e!121288)))

(declare-fun c!33048 () Bool)

(declare-fun e!121293 () Bool)

(assert (=> d!54763 (= c!33048 e!121293)))

(declare-fun res!87162 () Bool)

(assert (=> d!54763 (=> (not res!87162) (not e!121293))))

(assert (=> d!54763 (= res!87162 (bvslt #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))))))

(assert (=> d!54763 (= lt!91019 e!121290)))

(declare-fun c!33051 () Bool)

(assert (=> d!54763 (= c!33051 (and (not (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54763 (validMask!0 (mask!8844 thiss!1248))))

(assert (=> d!54763 (= (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)) lt!91021)))

(declare-fun b!184277 () Bool)

(declare-fun e!121292 () Bool)

(assert (=> b!184277 (= e!121295 e!121292)))

(declare-fun res!87163 () Bool)

(assert (=> b!184277 (= res!87163 call!18590)))

(assert (=> b!184277 (=> (not res!87163) (not e!121292))))

(declare-fun bm!18586 () Bool)

(assert (=> bm!18586 (= call!18589 call!18586)))

(declare-fun b!184278 () Bool)

(assert (=> b!184278 (= e!121294 call!18589)))

(declare-fun bm!18587 () Bool)

(assert (=> bm!18587 (= call!18590 (contains!1265 lt!91021 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184279 () Bool)

(assert (=> b!184279 (= e!121299 (not call!18591))))

(declare-fun bm!18588 () Bool)

(declare-fun c!33049 () Bool)

(declare-fun call!18592 () ListLongMap!2307)

(assert (=> bm!18588 (= call!18586 (+!279 (ite c!33051 call!18588 (ite c!33049 call!18587 call!18592)) (ite (or c!33051 c!33049) (tuple2!3399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))))))

(declare-fun b!184280 () Bool)

(declare-fun res!87160 () Bool)

(assert (=> b!184280 (=> (not res!87160) (not e!121300))))

(assert (=> b!184280 (= res!87160 e!121299)))

(declare-fun c!33050 () Bool)

(assert (=> b!184280 (= c!33050 (not (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!184281 () Bool)

(declare-fun lt!91022 () Unit!5539)

(assert (=> b!184281 (= e!121288 lt!91022)))

(declare-fun lt!91035 () ListLongMap!2307)

(assert (=> b!184281 (= lt!91035 (getCurrentListMapNoExtraKeys!183 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))))

(declare-fun lt!91032 () (_ BitVec 64))

(assert (=> b!184281 (= lt!91032 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91033 () (_ BitVec 64))

(assert (=> b!184281 (= lt!91033 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91031 () Unit!5539)

(declare-fun addStillContains!138 (ListLongMap!2307 (_ BitVec 64) V!5401 (_ BitVec 64)) Unit!5539)

(assert (=> b!184281 (= lt!91031 (addStillContains!138 lt!91035 lt!91032 (zeroValue!3604 thiss!1248) lt!91033))))

(assert (=> b!184281 (contains!1265 (+!279 lt!91035 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248))) lt!91033)))

(declare-fun lt!91030 () Unit!5539)

(assert (=> b!184281 (= lt!91030 lt!91031)))

(declare-fun lt!91039 () ListLongMap!2307)

(assert (=> b!184281 (= lt!91039 (getCurrentListMapNoExtraKeys!183 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))))

(declare-fun lt!91036 () (_ BitVec 64))

(assert (=> b!184281 (= lt!91036 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91020 () (_ BitVec 64))

(assert (=> b!184281 (= lt!91020 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91037 () Unit!5539)

(declare-fun addApplyDifferent!138 (ListLongMap!2307 (_ BitVec 64) V!5401 (_ BitVec 64)) Unit!5539)

(assert (=> b!184281 (= lt!91037 (addApplyDifferent!138 lt!91039 lt!91036 (minValue!3604 thiss!1248) lt!91020))))

(assert (=> b!184281 (= (apply!162 (+!279 lt!91039 (tuple2!3399 lt!91036 (minValue!3604 thiss!1248))) lt!91020) (apply!162 lt!91039 lt!91020))))

(declare-fun lt!91029 () Unit!5539)

(assert (=> b!184281 (= lt!91029 lt!91037)))

(declare-fun lt!91028 () ListLongMap!2307)

(assert (=> b!184281 (= lt!91028 (getCurrentListMapNoExtraKeys!183 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))))

(declare-fun lt!91034 () (_ BitVec 64))

(assert (=> b!184281 (= lt!91034 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91025 () (_ BitVec 64))

(assert (=> b!184281 (= lt!91025 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91027 () Unit!5539)

(assert (=> b!184281 (= lt!91027 (addApplyDifferent!138 lt!91028 lt!91034 (zeroValue!3604 thiss!1248) lt!91025))))

(assert (=> b!184281 (= (apply!162 (+!279 lt!91028 (tuple2!3399 lt!91034 (zeroValue!3604 thiss!1248))) lt!91025) (apply!162 lt!91028 lt!91025))))

(declare-fun lt!91024 () Unit!5539)

(assert (=> b!184281 (= lt!91024 lt!91027)))

(declare-fun lt!91026 () ListLongMap!2307)

(assert (=> b!184281 (= lt!91026 (getCurrentListMapNoExtraKeys!183 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))))

(declare-fun lt!91018 () (_ BitVec 64))

(assert (=> b!184281 (= lt!91018 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91023 () (_ BitVec 64))

(assert (=> b!184281 (= lt!91023 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184281 (= lt!91022 (addApplyDifferent!138 lt!91026 lt!91018 (minValue!3604 thiss!1248) lt!91023))))

(assert (=> b!184281 (= (apply!162 (+!279 lt!91026 (tuple2!3399 lt!91018 (minValue!3604 thiss!1248))) lt!91023) (apply!162 lt!91026 lt!91023))))

(declare-fun b!184282 () Bool)

(assert (=> b!184282 (= e!121293 (validKeyInArray!0 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184283 () Bool)

(declare-fun Unit!5542 () Unit!5539)

(assert (=> b!184283 (= e!121288 Unit!5542)))

(declare-fun bm!18589 () Bool)

(assert (=> bm!18589 (= call!18592 call!18587)))

(declare-fun b!184284 () Bool)

(assert (=> b!184284 (= e!121292 (= (apply!162 lt!91021 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3604 thiss!1248)))))

(declare-fun b!184285 () Bool)

(assert (=> b!184285 (= e!121290 e!121289)))

(assert (=> b!184285 (= c!33049 (and (not (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184286 () Bool)

(assert (=> b!184286 (= e!121294 call!18592)))

(assert (= (and d!54763 c!33051) b!184268))

(assert (= (and d!54763 (not c!33051)) b!184285))

(assert (= (and b!184285 c!33049) b!184273))

(assert (= (and b!184285 (not c!33049)) b!184267))

(assert (= (and b!184267 c!33047) b!184278))

(assert (= (and b!184267 (not c!33047)) b!184286))

(assert (= (or b!184278 b!184286) bm!18589))

(assert (= (or b!184273 bm!18589) bm!18583))

(assert (= (or b!184273 b!184278) bm!18586))

(assert (= (or b!184268 bm!18583) bm!18584))

(assert (= (or b!184268 bm!18586) bm!18588))

(assert (= (and d!54763 res!87162) b!184282))

(assert (= (and d!54763 c!33048) b!184281))

(assert (= (and d!54763 (not c!33048)) b!184283))

(assert (= (and d!54763 res!87157) b!184266))

(assert (= (and b!184266 res!87156) b!184274))

(assert (= (and b!184266 (not res!87159)) b!184270))

(assert (= (and b!184270 res!87158) b!184276))

(assert (= (and b!184266 res!87161) b!184280))

(assert (= (and b!184280 c!33050) b!184271))

(assert (= (and b!184280 (not c!33050)) b!184279))

(assert (= (and b!184271 res!87164) b!184269))

(assert (= (or b!184271 b!184279) bm!18585))

(assert (= (and b!184280 res!87160) b!184272))

(assert (= (and b!184272 c!33046) b!184277))

(assert (= (and b!184272 (not c!33046)) b!184275))

(assert (= (and b!184277 res!87163) b!184284))

(assert (= (or b!184277 b!184275) bm!18587))

(declare-fun b_lambda!7201 () Bool)

(assert (=> (not b_lambda!7201) (not b!184276)))

(declare-fun t!7205 () Bool)

(declare-fun tb!2827 () Bool)

(assert (=> (and b!184130 (= (defaultEntry!3763 thiss!1248) (defaultEntry!3763 thiss!1248)) t!7205) tb!2827))

(declare-fun result!4775 () Bool)

(assert (=> tb!2827 (= result!4775 tp_is_empty!4315)))

(assert (=> b!184276 t!7205))

(declare-fun b_and!11107 () Bool)

(assert (= b_and!11101 (and (=> t!7205 result!4775) b_and!11107)))

(declare-fun m!211143 () Bool)

(assert (=> b!184284 m!211143))

(declare-fun m!211145 () Bool)

(assert (=> bm!18588 m!211145))

(declare-fun m!211147 () Bool)

(assert (=> b!184281 m!211147))

(declare-fun m!211149 () Bool)

(assert (=> b!184281 m!211149))

(declare-fun m!211151 () Bool)

(assert (=> b!184281 m!211151))

(declare-fun m!211153 () Bool)

(assert (=> b!184281 m!211153))

(declare-fun m!211155 () Bool)

(assert (=> b!184281 m!211155))

(declare-fun m!211157 () Bool)

(assert (=> b!184281 m!211157))

(declare-fun m!211159 () Bool)

(assert (=> b!184281 m!211159))

(declare-fun m!211161 () Bool)

(assert (=> b!184281 m!211161))

(declare-fun m!211163 () Bool)

(assert (=> b!184281 m!211163))

(declare-fun m!211165 () Bool)

(assert (=> b!184281 m!211165))

(assert (=> b!184281 m!211151))

(declare-fun m!211167 () Bool)

(assert (=> b!184281 m!211167))

(assert (=> b!184281 m!211153))

(declare-fun m!211169 () Bool)

(assert (=> b!184281 m!211169))

(declare-fun m!211171 () Bool)

(assert (=> b!184281 m!211171))

(declare-fun m!211173 () Bool)

(assert (=> b!184281 m!211173))

(declare-fun m!211175 () Bool)

(assert (=> b!184281 m!211175))

(assert (=> b!184281 m!211171))

(declare-fun m!211177 () Bool)

(assert (=> b!184281 m!211177))

(assert (=> b!184281 m!211147))

(declare-fun m!211179 () Bool)

(assert (=> b!184281 m!211179))

(assert (=> b!184274 m!211163))

(assert (=> b!184274 m!211163))

(declare-fun m!211181 () Bool)

(assert (=> b!184274 m!211181))

(assert (=> b!184276 m!211163))

(declare-fun m!211183 () Bool)

(assert (=> b!184276 m!211183))

(assert (=> b!184276 m!211163))

(declare-fun m!211185 () Bool)

(assert (=> b!184276 m!211185))

(declare-fun m!211187 () Bool)

(assert (=> b!184276 m!211187))

(assert (=> b!184276 m!211187))

(assert (=> b!184276 m!211183))

(declare-fun m!211189 () Bool)

(assert (=> b!184276 m!211189))

(assert (=> b!184270 m!211163))

(assert (=> b!184270 m!211163))

(declare-fun m!211191 () Bool)

(assert (=> b!184270 m!211191))

(declare-fun m!211193 () Bool)

(assert (=> b!184268 m!211193))

(assert (=> b!184282 m!211163))

(assert (=> b!184282 m!211163))

(assert (=> b!184282 m!211181))

(declare-fun m!211195 () Bool)

(assert (=> b!184269 m!211195))

(assert (=> d!54763 m!211073))

(declare-fun m!211197 () Bool)

(assert (=> bm!18587 m!211197))

(assert (=> bm!18584 m!211175))

(declare-fun m!211199 () Bool)

(assert (=> bm!18585 m!211199))

(assert (=> b!184125 d!54763))

(declare-fun condMapEmpty!7426 () Bool)

(declare-fun mapDefault!7426 () ValueCell!1814)

(assert (=> mapNonEmpty!7417 (= condMapEmpty!7426 (= mapRest!7417 ((as const (Array (_ BitVec 32) ValueCell!1814)) mapDefault!7426)))))

(declare-fun e!121305 () Bool)

(declare-fun mapRes!7426 () Bool)

(assert (=> mapNonEmpty!7417 (= tp!16410 (and e!121305 mapRes!7426))))

(declare-fun mapNonEmpty!7426 () Bool)

(declare-fun tp!16426 () Bool)

(declare-fun e!121306 () Bool)

(assert (=> mapNonEmpty!7426 (= mapRes!7426 (and tp!16426 e!121306))))

(declare-fun mapRest!7426 () (Array (_ BitVec 32) ValueCell!1814))

(declare-fun mapValue!7426 () ValueCell!1814)

(declare-fun mapKey!7426 () (_ BitVec 32))

(assert (=> mapNonEmpty!7426 (= mapRest!7417 (store mapRest!7426 mapKey!7426 mapValue!7426))))

(declare-fun b!184296 () Bool)

(assert (=> b!184296 (= e!121305 tp_is_empty!4315)))

(declare-fun mapIsEmpty!7426 () Bool)

(assert (=> mapIsEmpty!7426 mapRes!7426))

(declare-fun b!184295 () Bool)

(assert (=> b!184295 (= e!121306 tp_is_empty!4315)))

(assert (= (and mapNonEmpty!7417 condMapEmpty!7426) mapIsEmpty!7426))

(assert (= (and mapNonEmpty!7417 (not condMapEmpty!7426)) mapNonEmpty!7426))

(assert (= (and mapNonEmpty!7426 ((_ is ValueCellFull!1814) mapValue!7426)) b!184295))

(assert (= (and mapNonEmpty!7417 ((_ is ValueCellFull!1814) mapDefault!7426)) b!184296))

(declare-fun m!211201 () Bool)

(assert (=> mapNonEmpty!7426 m!211201))

(declare-fun b_lambda!7203 () Bool)

(assert (= b_lambda!7201 (or (and b!184130 b_free!4543) b_lambda!7203)))

(check-sat (not bm!18585) (not bm!18584) (not b!184269) (not mapNonEmpty!7426) tp_is_empty!4315 (not b!184270) (not b!184195) (not b!184194) (not bm!18587) (not b!184212) (not d!54763) (not d!54755) (not b!184282) (not b!184274) b_and!11107 (not bm!18588) (not d!54761) (not b!184268) (not b!184284) (not b!184281) (not b!184223) (not b!184276) (not b_next!4543) (not b!184221) (not d!54757) (not b_lambda!7203) (not b!184196))
(check-sat b_and!11107 (not b_next!4543))
(get-model)

(declare-fun d!54765 () Bool)

(declare-fun get!2118 (Option!223) V!5401)

(assert (=> d!54765 (= (apply!162 lt!91021 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2118 (getValueByKey!217 (toList!1169 lt!91021) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7460 () Bool)

(assert (= bs!7460 d!54765))

(declare-fun m!211203 () Bool)

(assert (=> bs!7460 m!211203))

(assert (=> bs!7460 m!211203))

(declare-fun m!211205 () Bool)

(assert (=> bs!7460 m!211205))

(assert (=> b!184269 d!54765))

(declare-fun d!54767 () Bool)

(assert (=> d!54767 (= (apply!162 lt!91021 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2118 (getValueByKey!217 (toList!1169 lt!91021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7461 () Bool)

(assert (= bs!7461 d!54767))

(declare-fun m!211207 () Bool)

(assert (=> bs!7461 m!211207))

(assert (=> bs!7461 m!211207))

(declare-fun m!211209 () Bool)

(assert (=> bs!7461 m!211209))

(assert (=> b!184284 d!54767))

(declare-fun b!184305 () Bool)

(declare-fun e!121315 () Bool)

(declare-fun e!121314 () Bool)

(assert (=> b!184305 (= e!121315 e!121314)))

(declare-fun c!33054 () Bool)

(assert (=> b!184305 (= c!33054 (validKeyInArray!0 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54769 () Bool)

(declare-fun res!87170 () Bool)

(assert (=> d!54769 (=> res!87170 e!121315)))

(assert (=> d!54769 (= res!87170 (bvsge #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))))))

(assert (=> d!54769 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5689 thiss!1248) (mask!8844 thiss!1248)) e!121315)))

(declare-fun b!184306 () Bool)

(declare-fun call!18595 () Bool)

(assert (=> b!184306 (= e!121314 call!18595)))

(declare-fun b!184307 () Bool)

(declare-fun e!121313 () Bool)

(assert (=> b!184307 (= e!121314 e!121313)))

(declare-fun lt!91047 () (_ BitVec 64))

(assert (=> b!184307 (= lt!91047 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91048 () Unit!5539)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7809 (_ BitVec 64) (_ BitVec 32)) Unit!5539)

(assert (=> b!184307 (= lt!91048 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5689 thiss!1248) lt!91047 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!184307 (arrayContainsKey!0 (_keys!5689 thiss!1248) lt!91047 #b00000000000000000000000000000000)))

(declare-fun lt!91046 () Unit!5539)

(assert (=> b!184307 (= lt!91046 lt!91048)))

(declare-fun res!87169 () Bool)

(assert (=> b!184307 (= res!87169 (= (seekEntryOrOpen!0 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000) (_keys!5689 thiss!1248) (mask!8844 thiss!1248)) (Found!626 #b00000000000000000000000000000000)))))

(assert (=> b!184307 (=> (not res!87169) (not e!121313))))

(declare-fun bm!18592 () Bool)

(assert (=> bm!18592 (= call!18595 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5689 thiss!1248) (mask!8844 thiss!1248)))))

(declare-fun b!184308 () Bool)

(assert (=> b!184308 (= e!121313 call!18595)))

(assert (= (and d!54769 (not res!87170)) b!184305))

(assert (= (and b!184305 c!33054) b!184307))

(assert (= (and b!184305 (not c!33054)) b!184306))

(assert (= (and b!184307 res!87169) b!184308))

(assert (= (or b!184308 b!184306) bm!18592))

(assert (=> b!184305 m!211163))

(assert (=> b!184305 m!211163))

(assert (=> b!184305 m!211181))

(assert (=> b!184307 m!211163))

(declare-fun m!211211 () Bool)

(assert (=> b!184307 m!211211))

(declare-fun m!211213 () Bool)

(assert (=> b!184307 m!211213))

(assert (=> b!184307 m!211163))

(declare-fun m!211215 () Bool)

(assert (=> b!184307 m!211215))

(declare-fun m!211217 () Bool)

(assert (=> bm!18592 m!211217))

(assert (=> b!184195 d!54769))

(declare-fun b!184327 () Bool)

(declare-fun e!121327 () SeekEntryResult!626)

(declare-fun e!121326 () SeekEntryResult!626)

(assert (=> b!184327 (= e!121327 e!121326)))

(declare-fun c!33061 () Bool)

(declare-fun lt!91054 () (_ BitVec 64))

(assert (=> b!184327 (= c!33061 (or (= lt!91054 key!828) (= (bvadd lt!91054 lt!91054) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184328 () Bool)

(assert (=> b!184328 (= e!121326 (Intermediate!626 false (toIndex!0 key!828 (mask!8844 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!184329 () Bool)

(declare-fun lt!91053 () SeekEntryResult!626)

(assert (=> b!184329 (and (bvsge (index!4676 lt!91053) #b00000000000000000000000000000000) (bvslt (index!4676 lt!91053) (size!4003 (_keys!5689 thiss!1248))))))

(declare-fun e!121328 () Bool)

(assert (=> b!184329 (= e!121328 (= (select (arr!3688 (_keys!5689 thiss!1248)) (index!4676 lt!91053)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184330 () Bool)

(assert (=> b!184330 (and (bvsge (index!4676 lt!91053) #b00000000000000000000000000000000) (bvslt (index!4676 lt!91053) (size!4003 (_keys!5689 thiss!1248))))))

(declare-fun res!87179 () Bool)

(assert (=> b!184330 (= res!87179 (= (select (arr!3688 (_keys!5689 thiss!1248)) (index!4676 lt!91053)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184330 (=> res!87179 e!121328)))

(declare-fun b!184331 () Bool)

(declare-fun e!121329 () Bool)

(declare-fun e!121330 () Bool)

(assert (=> b!184331 (= e!121329 e!121330)))

(declare-fun res!87177 () Bool)

(assert (=> b!184331 (= res!87177 (and ((_ is Intermediate!626) lt!91053) (not (undefined!1438 lt!91053)) (bvslt (x!20049 lt!91053) #b01111111111111111111111111111110) (bvsge (x!20049 lt!91053) #b00000000000000000000000000000000) (bvsge (x!20049 lt!91053) #b00000000000000000000000000000000)))))

(assert (=> b!184331 (=> (not res!87177) (not e!121330))))

(declare-fun b!184332 () Bool)

(assert (=> b!184332 (= e!121329 (bvsge (x!20049 lt!91053) #b01111111111111111111111111111110))))

(declare-fun b!184333 () Bool)

(assert (=> b!184333 (and (bvsge (index!4676 lt!91053) #b00000000000000000000000000000000) (bvslt (index!4676 lt!91053) (size!4003 (_keys!5689 thiss!1248))))))

(declare-fun res!87178 () Bool)

(assert (=> b!184333 (= res!87178 (= (select (arr!3688 (_keys!5689 thiss!1248)) (index!4676 lt!91053)) key!828))))

(assert (=> b!184333 (=> res!87178 e!121328)))

(assert (=> b!184333 (= e!121330 e!121328)))

(declare-fun d!54771 () Bool)

(assert (=> d!54771 e!121329))

(declare-fun c!33063 () Bool)

(assert (=> d!54771 (= c!33063 (and ((_ is Intermediate!626) lt!91053) (undefined!1438 lt!91053)))))

(assert (=> d!54771 (= lt!91053 e!121327)))

(declare-fun c!33062 () Bool)

(assert (=> d!54771 (= c!33062 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!54771 (= lt!91054 (select (arr!3688 (_keys!5689 thiss!1248)) (toIndex!0 key!828 (mask!8844 thiss!1248))))))

(assert (=> d!54771 (validMask!0 (mask!8844 thiss!1248))))

(assert (=> d!54771 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8844 thiss!1248)) key!828 (_keys!5689 thiss!1248) (mask!8844 thiss!1248)) lt!91053)))

(declare-fun b!184334 () Bool)

(assert (=> b!184334 (= e!121327 (Intermediate!626 true (toIndex!0 key!828 (mask!8844 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!184335 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184335 (= e!121326 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8844 thiss!1248)) #b00000000000000000000000000000000 (mask!8844 thiss!1248)) key!828 (_keys!5689 thiss!1248) (mask!8844 thiss!1248)))))

(assert (= (and d!54771 c!33062) b!184334))

(assert (= (and d!54771 (not c!33062)) b!184327))

(assert (= (and b!184327 c!33061) b!184328))

(assert (= (and b!184327 (not c!33061)) b!184335))

(assert (= (and d!54771 c!33063) b!184332))

(assert (= (and d!54771 (not c!33063)) b!184331))

(assert (= (and b!184331 res!87177) b!184333))

(assert (= (and b!184333 (not res!87178)) b!184330))

(assert (= (and b!184330 (not res!87179)) b!184329))

(declare-fun m!211219 () Bool)

(assert (=> b!184330 m!211219))

(assert (=> b!184333 m!211219))

(assert (=> d!54771 m!211123))

(declare-fun m!211221 () Bool)

(assert (=> d!54771 m!211221))

(assert (=> d!54771 m!211073))

(assert (=> b!184329 m!211219))

(assert (=> b!184335 m!211123))

(declare-fun m!211223 () Bool)

(assert (=> b!184335 m!211223))

(assert (=> b!184335 m!211223))

(declare-fun m!211225 () Bool)

(assert (=> b!184335 m!211225))

(assert (=> d!54757 d!54771))

(declare-fun d!54773 () Bool)

(declare-fun lt!91060 () (_ BitVec 32))

(declare-fun lt!91059 () (_ BitVec 32))

(assert (=> d!54773 (= lt!91060 (bvmul (bvxor lt!91059 (bvlshr lt!91059 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54773 (= lt!91059 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54773 (and (bvsge (mask!8844 thiss!1248) #b00000000000000000000000000000000) (let ((res!87180 (let ((h!2967 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20066 (bvmul (bvxor h!2967 (bvlshr h!2967 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20066 (bvlshr x!20066 #b00000000000000000000000000001101)) (mask!8844 thiss!1248)))))) (and (bvslt res!87180 (bvadd (mask!8844 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!87180 #b00000000000000000000000000000000))))))

(assert (=> d!54773 (= (toIndex!0 key!828 (mask!8844 thiss!1248)) (bvand (bvxor lt!91060 (bvlshr lt!91060 #b00000000000000000000000000001101)) (mask!8844 thiss!1248)))))

(assert (=> d!54757 d!54773))

(assert (=> d!54757 d!54759))

(declare-fun d!54775 () Bool)

(declare-fun e!121332 () Bool)

(assert (=> d!54775 e!121332))

(declare-fun res!87181 () Bool)

(assert (=> d!54775 (=> res!87181 e!121332)))

(declare-fun lt!91062 () Bool)

(assert (=> d!54775 (= res!87181 (not lt!91062))))

(declare-fun lt!91061 () Bool)

(assert (=> d!54775 (= lt!91062 lt!91061)))

(declare-fun lt!91064 () Unit!5539)

(declare-fun e!121331 () Unit!5539)

(assert (=> d!54775 (= lt!91064 e!121331)))

(declare-fun c!33064 () Bool)

(assert (=> d!54775 (= c!33064 lt!91061)))

(assert (=> d!54775 (= lt!91061 (containsKey!221 (toList!1169 lt!91021) (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54775 (= (contains!1265 lt!91021 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)) lt!91062)))

(declare-fun b!184336 () Bool)

(declare-fun lt!91063 () Unit!5539)

(assert (=> b!184336 (= e!121331 lt!91063)))

(assert (=> b!184336 (= lt!91063 (lemmaContainsKeyImpliesGetValueByKeyDefined!170 (toList!1169 lt!91021) (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184336 (isDefined!171 (getValueByKey!217 (toList!1169 lt!91021) (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184337 () Bool)

(declare-fun Unit!5543 () Unit!5539)

(assert (=> b!184337 (= e!121331 Unit!5543)))

(declare-fun b!184338 () Bool)

(assert (=> b!184338 (= e!121332 (isDefined!171 (getValueByKey!217 (toList!1169 lt!91021) (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54775 c!33064) b!184336))

(assert (= (and d!54775 (not c!33064)) b!184337))

(assert (= (and d!54775 (not res!87181)) b!184338))

(assert (=> d!54775 m!211163))

(declare-fun m!211227 () Bool)

(assert (=> d!54775 m!211227))

(assert (=> b!184336 m!211163))

(declare-fun m!211229 () Bool)

(assert (=> b!184336 m!211229))

(assert (=> b!184336 m!211163))

(declare-fun m!211231 () Bool)

(assert (=> b!184336 m!211231))

(assert (=> b!184336 m!211231))

(declare-fun m!211233 () Bool)

(assert (=> b!184336 m!211233))

(assert (=> b!184338 m!211163))

(assert (=> b!184338 m!211231))

(assert (=> b!184338 m!211231))

(assert (=> b!184338 m!211233))

(assert (=> b!184270 d!54775))

(declare-fun bm!18595 () Bool)

(declare-fun call!18598 () Bool)

(declare-fun c!33067 () Bool)

(assert (=> bm!18595 (= call!18598 (arrayNoDuplicates!0 (_keys!5689 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33067 (Cons!2335 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000) Nil!2336) Nil!2336)))))

(declare-fun b!184349 () Bool)

(declare-fun e!121344 () Bool)

(declare-fun e!121342 () Bool)

(assert (=> b!184349 (= e!121344 e!121342)))

(declare-fun res!87190 () Bool)

(assert (=> b!184349 (=> (not res!87190) (not e!121342))))

(declare-fun e!121341 () Bool)

(assert (=> b!184349 (= res!87190 (not e!121341))))

(declare-fun res!87189 () Bool)

(assert (=> b!184349 (=> (not res!87189) (not e!121341))))

(assert (=> b!184349 (= res!87189 (validKeyInArray!0 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184350 () Bool)

(declare-fun e!121343 () Bool)

(assert (=> b!184350 (= e!121342 e!121343)))

(assert (=> b!184350 (= c!33067 (validKeyInArray!0 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54777 () Bool)

(declare-fun res!87188 () Bool)

(assert (=> d!54777 (=> res!87188 e!121344)))

(assert (=> d!54777 (= res!87188 (bvsge #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))))))

(assert (=> d!54777 (= (arrayNoDuplicates!0 (_keys!5689 thiss!1248) #b00000000000000000000000000000000 Nil!2336) e!121344)))

(declare-fun b!184351 () Bool)

(declare-fun contains!1267 (List!2339 (_ BitVec 64)) Bool)

(assert (=> b!184351 (= e!121341 (contains!1267 Nil!2336 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184352 () Bool)

(assert (=> b!184352 (= e!121343 call!18598)))

(declare-fun b!184353 () Bool)

(assert (=> b!184353 (= e!121343 call!18598)))

(assert (= (and d!54777 (not res!87188)) b!184349))

(assert (= (and b!184349 res!87189) b!184351))

(assert (= (and b!184349 res!87190) b!184350))

(assert (= (and b!184350 c!33067) b!184352))

(assert (= (and b!184350 (not c!33067)) b!184353))

(assert (= (or b!184352 b!184353) bm!18595))

(assert (=> bm!18595 m!211163))

(declare-fun m!211235 () Bool)

(assert (=> bm!18595 m!211235))

(assert (=> b!184349 m!211163))

(assert (=> b!184349 m!211163))

(assert (=> b!184349 m!211181))

(assert (=> b!184350 m!211163))

(assert (=> b!184350 m!211163))

(assert (=> b!184350 m!211181))

(assert (=> b!184351 m!211163))

(assert (=> b!184351 m!211163))

(declare-fun m!211237 () Bool)

(assert (=> b!184351 m!211237))

(assert (=> b!184196 d!54777))

(declare-fun d!54779 () Bool)

(declare-fun lt!91067 () (_ BitVec 32))

(assert (=> d!54779 (and (bvsge lt!91067 #b00000000000000000000000000000000) (bvsle lt!91067 (bvsub (size!4003 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!121350 () (_ BitVec 32))

(assert (=> d!54779 (= lt!91067 e!121350)))

(declare-fun c!33072 () Bool)

(assert (=> d!54779 (= c!33072 (bvsge #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))))))

(assert (=> d!54779 (and (bvsle #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4003 (_keys!5689 thiss!1248)) (size!4003 (_keys!5689 thiss!1248))))))

(assert (=> d!54779 (= (arrayCountValidKeys!0 (_keys!5689 thiss!1248) #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))) lt!91067)))

(declare-fun b!184362 () Bool)

(declare-fun e!121349 () (_ BitVec 32))

(declare-fun call!18601 () (_ BitVec 32))

(assert (=> b!184362 (= e!121349 (bvadd #b00000000000000000000000000000001 call!18601))))

(declare-fun b!184363 () Bool)

(assert (=> b!184363 (= e!121350 e!121349)))

(declare-fun c!33073 () Bool)

(assert (=> b!184363 (= c!33073 (validKeyInArray!0 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184364 () Bool)

(assert (=> b!184364 (= e!121349 call!18601)))

(declare-fun b!184365 () Bool)

(assert (=> b!184365 (= e!121350 #b00000000000000000000000000000000)))

(declare-fun bm!18598 () Bool)

(assert (=> bm!18598 (= call!18601 (arrayCountValidKeys!0 (_keys!5689 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4003 (_keys!5689 thiss!1248))))))

(assert (= (and d!54779 c!33072) b!184365))

(assert (= (and d!54779 (not c!33072)) b!184363))

(assert (= (and b!184363 c!33073) b!184362))

(assert (= (and b!184363 (not c!33073)) b!184364))

(assert (= (or b!184362 b!184364) bm!18598))

(assert (=> b!184363 m!211163))

(assert (=> b!184363 m!211163))

(assert (=> b!184363 m!211181))

(declare-fun m!211239 () Bool)

(assert (=> bm!18598 m!211239))

(assert (=> b!184194 d!54779))

(declare-fun d!54781 () Bool)

(declare-fun res!87195 () Bool)

(declare-fun e!121355 () Bool)

(assert (=> d!54781 (=> res!87195 e!121355)))

(assert (=> d!54781 (= res!87195 (and ((_ is Cons!2333) (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))) (= (_1!1710 (h!2964 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))))) key!828)))))

(assert (=> d!54781 (= (containsKey!221 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828) e!121355)))

(declare-fun b!184370 () Bool)

(declare-fun e!121356 () Bool)

(assert (=> b!184370 (= e!121355 e!121356)))

(declare-fun res!87196 () Bool)

(assert (=> b!184370 (=> (not res!87196) (not e!121356))))

(assert (=> b!184370 (= res!87196 (and (or (not ((_ is Cons!2333) (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))))) (bvsle (_1!1710 (h!2964 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))))) key!828)) ((_ is Cons!2333) (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))) (bvslt (_1!1710 (h!2964 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))))) key!828)))))

(declare-fun b!184371 () Bool)

(assert (=> b!184371 (= e!121356 (containsKey!221 (t!7202 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))) key!828))))

(assert (= (and d!54781 (not res!87195)) b!184370))

(assert (= (and b!184370 res!87196) b!184371))

(declare-fun m!211241 () Bool)

(assert (=> b!184371 m!211241))

(assert (=> d!54761 d!54781))

(declare-fun d!54783 () Bool)

(assert (=> d!54783 (= (validKeyInArray!0 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!184282 d!54783))

(declare-fun d!54785 () Bool)

(declare-fun e!121359 () Bool)

(assert (=> d!54785 e!121359))

(declare-fun res!87201 () Bool)

(assert (=> d!54785 (=> (not res!87201) (not e!121359))))

(declare-fun lt!91079 () ListLongMap!2307)

(assert (=> d!54785 (= res!87201 (contains!1265 lt!91079 (_1!1710 (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))))))

(declare-fun lt!91077 () List!2337)

(assert (=> d!54785 (= lt!91079 (ListLongMap!2308 lt!91077))))

(declare-fun lt!91078 () Unit!5539)

(declare-fun lt!91076 () Unit!5539)

(assert (=> d!54785 (= lt!91078 lt!91076)))

(assert (=> d!54785 (= (getValueByKey!217 lt!91077 (_1!1710 (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))) (Some!222 (_2!1710 (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!116 (List!2337 (_ BitVec 64) V!5401) Unit!5539)

(assert (=> d!54785 (= lt!91076 (lemmaContainsTupThenGetReturnValue!116 lt!91077 (_1!1710 (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))) (_2!1710 (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))))))

(declare-fun insertStrictlySorted!119 (List!2337 (_ BitVec 64) V!5401) List!2337)

(assert (=> d!54785 (= lt!91077 (insertStrictlySorted!119 (toList!1169 call!18586) (_1!1710 (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))) (_2!1710 (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))))))

(assert (=> d!54785 (= (+!279 call!18586 (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))) lt!91079)))

(declare-fun b!184376 () Bool)

(declare-fun res!87202 () Bool)

(assert (=> b!184376 (=> (not res!87202) (not e!121359))))

(assert (=> b!184376 (= res!87202 (= (getValueByKey!217 (toList!1169 lt!91079) (_1!1710 (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))) (Some!222 (_2!1710 (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))))))

(declare-fun b!184377 () Bool)

(declare-fun contains!1268 (List!2337 tuple2!3398) Bool)

(assert (=> b!184377 (= e!121359 (contains!1268 (toList!1169 lt!91079) (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))))

(assert (= (and d!54785 res!87201) b!184376))

(assert (= (and b!184376 res!87202) b!184377))

(declare-fun m!211243 () Bool)

(assert (=> d!54785 m!211243))

(declare-fun m!211245 () Bool)

(assert (=> d!54785 m!211245))

(declare-fun m!211247 () Bool)

(assert (=> d!54785 m!211247))

(declare-fun m!211249 () Bool)

(assert (=> d!54785 m!211249))

(declare-fun m!211251 () Bool)

(assert (=> b!184376 m!211251))

(declare-fun m!211253 () Bool)

(assert (=> b!184377 m!211253))

(assert (=> b!184268 d!54785))

(declare-fun b!184390 () Bool)

(declare-fun e!121368 () SeekEntryResult!626)

(assert (=> b!184390 (= e!121368 Undefined!626)))

(declare-fun b!184392 () Bool)

(declare-fun c!33080 () Bool)

(declare-fun lt!91085 () (_ BitVec 64))

(assert (=> b!184392 (= c!33080 (= lt!91085 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!121367 () SeekEntryResult!626)

(declare-fun e!121366 () SeekEntryResult!626)

(assert (=> b!184392 (= e!121367 e!121366)))

(declare-fun b!184393 () Bool)

(assert (=> b!184393 (= e!121366 (MissingVacant!626 (index!4676 lt!90960)))))

(declare-fun b!184394 () Bool)

(assert (=> b!184394 (= e!121368 e!121367)))

(declare-fun c!33082 () Bool)

(assert (=> b!184394 (= c!33082 (= lt!91085 key!828))))

(declare-fun b!184395 () Bool)

(assert (=> b!184395 (= e!121367 (Found!626 (index!4676 lt!90960)))))

(declare-fun d!54787 () Bool)

(declare-fun lt!91084 () SeekEntryResult!626)

(assert (=> d!54787 (and (or ((_ is Undefined!626) lt!91084) (not ((_ is Found!626) lt!91084)) (and (bvsge (index!4675 lt!91084) #b00000000000000000000000000000000) (bvslt (index!4675 lt!91084) (size!4003 (_keys!5689 thiss!1248))))) (or ((_ is Undefined!626) lt!91084) ((_ is Found!626) lt!91084) (not ((_ is MissingVacant!626) lt!91084)) (not (= (index!4677 lt!91084) (index!4676 lt!90960))) (and (bvsge (index!4677 lt!91084) #b00000000000000000000000000000000) (bvslt (index!4677 lt!91084) (size!4003 (_keys!5689 thiss!1248))))) (or ((_ is Undefined!626) lt!91084) (ite ((_ is Found!626) lt!91084) (= (select (arr!3688 (_keys!5689 thiss!1248)) (index!4675 lt!91084)) key!828) (and ((_ is MissingVacant!626) lt!91084) (= (index!4677 lt!91084) (index!4676 lt!90960)) (= (select (arr!3688 (_keys!5689 thiss!1248)) (index!4677 lt!91084)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!54787 (= lt!91084 e!121368)))

(declare-fun c!33081 () Bool)

(assert (=> d!54787 (= c!33081 (bvsge (x!20049 lt!90960) #b01111111111111111111111111111110))))

(assert (=> d!54787 (= lt!91085 (select (arr!3688 (_keys!5689 thiss!1248)) (index!4676 lt!90960)))))

(assert (=> d!54787 (validMask!0 (mask!8844 thiss!1248))))

(assert (=> d!54787 (= (seekKeyOrZeroReturnVacant!0 (x!20049 lt!90960) (index!4676 lt!90960) (index!4676 lt!90960) key!828 (_keys!5689 thiss!1248) (mask!8844 thiss!1248)) lt!91084)))

(declare-fun b!184391 () Bool)

(assert (=> b!184391 (= e!121366 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20049 lt!90960) #b00000000000000000000000000000001) (nextIndex!0 (index!4676 lt!90960) (x!20049 lt!90960) (mask!8844 thiss!1248)) (index!4676 lt!90960) key!828 (_keys!5689 thiss!1248) (mask!8844 thiss!1248)))))

(assert (= (and d!54787 c!33081) b!184390))

(assert (= (and d!54787 (not c!33081)) b!184394))

(assert (= (and b!184394 c!33082) b!184395))

(assert (= (and b!184394 (not c!33082)) b!184392))

(assert (= (and b!184392 c!33080) b!184393))

(assert (= (and b!184392 (not c!33080)) b!184391))

(declare-fun m!211255 () Bool)

(assert (=> d!54787 m!211255))

(declare-fun m!211257 () Bool)

(assert (=> d!54787 m!211257))

(assert (=> d!54787 m!211121))

(assert (=> d!54787 m!211073))

(declare-fun m!211259 () Bool)

(assert (=> b!184391 m!211259))

(assert (=> b!184391 m!211259))

(declare-fun m!211261 () Bool)

(assert (=> b!184391 m!211261))

(assert (=> b!184212 d!54787))

(declare-fun d!54789 () Bool)

(assert (=> d!54789 (= (apply!162 lt!91021 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)) (get!2118 (getValueByKey!217 (toList!1169 lt!91021) (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7462 () Bool)

(assert (= bs!7462 d!54789))

(assert (=> bs!7462 m!211163))

(assert (=> bs!7462 m!211231))

(assert (=> bs!7462 m!211231))

(declare-fun m!211263 () Bool)

(assert (=> bs!7462 m!211263))

(assert (=> b!184276 d!54789))

(declare-fun d!54791 () Bool)

(declare-fun c!33085 () Bool)

(assert (=> d!54791 (= c!33085 ((_ is ValueCellFull!1814) (select (arr!3689 (_values!3746 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!121371 () V!5401)

(assert (=> d!54791 (= (get!2117 (select (arr!3689 (_values!3746 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3763 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!121371)))

(declare-fun b!184400 () Bool)

(declare-fun get!2119 (ValueCell!1814 V!5401) V!5401)

(assert (=> b!184400 (= e!121371 (get!2119 (select (arr!3689 (_values!3746 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3763 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184401 () Bool)

(declare-fun get!2120 (ValueCell!1814 V!5401) V!5401)

(assert (=> b!184401 (= e!121371 (get!2120 (select (arr!3689 (_values!3746 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3763 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54791 c!33085) b!184400))

(assert (= (and d!54791 (not c!33085)) b!184401))

(assert (=> b!184400 m!211187))

(assert (=> b!184400 m!211183))

(declare-fun m!211265 () Bool)

(assert (=> b!184400 m!211265))

(assert (=> b!184401 m!211187))

(assert (=> b!184401 m!211183))

(declare-fun m!211267 () Bool)

(assert (=> b!184401 m!211267))

(assert (=> b!184276 d!54791))

(declare-fun d!54793 () Bool)

(declare-fun res!87214 () Bool)

(declare-fun e!121374 () Bool)

(assert (=> d!54793 (=> (not res!87214) (not e!121374))))

(assert (=> d!54793 (= res!87214 (validMask!0 (mask!8844 thiss!1248)))))

(assert (=> d!54793 (= (simpleValid!178 thiss!1248) e!121374)))

(declare-fun b!184413 () Bool)

(assert (=> b!184413 (= e!121374 (and (bvsge (extraKeys!3500 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3500 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1317 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!184412 () Bool)

(declare-fun res!87211 () Bool)

(assert (=> b!184412 (=> (not res!87211) (not e!121374))))

(declare-fun size!4009 (LongMapFixedSize!2536) (_ BitVec 32))

(assert (=> b!184412 (= res!87211 (= (size!4009 thiss!1248) (bvadd (_size!1317 thiss!1248) (bvsdiv (bvadd (extraKeys!3500 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!184410 () Bool)

(declare-fun res!87213 () Bool)

(assert (=> b!184410 (=> (not res!87213) (not e!121374))))

(assert (=> b!184410 (= res!87213 (and (= (size!4004 (_values!3746 thiss!1248)) (bvadd (mask!8844 thiss!1248) #b00000000000000000000000000000001)) (= (size!4003 (_keys!5689 thiss!1248)) (size!4004 (_values!3746 thiss!1248))) (bvsge (_size!1317 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1317 thiss!1248) (bvadd (mask!8844 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!184411 () Bool)

(declare-fun res!87212 () Bool)

(assert (=> b!184411 (=> (not res!87212) (not e!121374))))

(assert (=> b!184411 (= res!87212 (bvsge (size!4009 thiss!1248) (_size!1317 thiss!1248)))))

(assert (= (and d!54793 res!87214) b!184410))

(assert (= (and b!184410 res!87213) b!184411))

(assert (= (and b!184411 res!87212) b!184412))

(assert (= (and b!184412 res!87211) b!184413))

(assert (=> d!54793 m!211073))

(declare-fun m!211269 () Bool)

(assert (=> b!184412 m!211269))

(assert (=> b!184411 m!211269))

(assert (=> d!54755 d!54793))

(assert (=> b!184274 d!54783))

(declare-fun b!184438 () Bool)

(declare-fun e!121392 () Bool)

(declare-fun lt!91104 () ListLongMap!2307)

(declare-fun isEmpty!471 (ListLongMap!2307) Bool)

(assert (=> b!184438 (= e!121392 (isEmpty!471 lt!91104))))

(declare-fun bm!18601 () Bool)

(declare-fun call!18604 () ListLongMap!2307)

(assert (=> bm!18601 (= call!18604 (getCurrentListMapNoExtraKeys!183 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3763 thiss!1248)))))

(declare-fun b!184440 () Bool)

(declare-fun e!121391 () ListLongMap!2307)

(assert (=> b!184440 (= e!121391 (ListLongMap!2308 Nil!2334))))

(declare-fun b!184441 () Bool)

(declare-fun res!87225 () Bool)

(declare-fun e!121389 () Bool)

(assert (=> b!184441 (=> (not res!87225) (not e!121389))))

(assert (=> b!184441 (= res!87225 (not (contains!1265 lt!91104 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184442 () Bool)

(assert (=> b!184442 (= e!121392 (= lt!91104 (getCurrentListMapNoExtraKeys!183 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3763 thiss!1248))))))

(declare-fun b!184443 () Bool)

(declare-fun e!121390 () Bool)

(assert (=> b!184443 (= e!121390 e!121392)))

(declare-fun c!33097 () Bool)

(assert (=> b!184443 (= c!33097 (bvslt #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))))))

(declare-fun b!184444 () Bool)

(assert (=> b!184444 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))))))

(assert (=> b!184444 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4004 (_values!3746 thiss!1248))))))

(declare-fun e!121395 () Bool)

(assert (=> b!184444 (= e!121395 (= (apply!162 lt!91104 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)) (get!2117 (select (arr!3689 (_values!3746 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3763 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!184445 () Bool)

(assert (=> b!184445 (= e!121390 e!121395)))

(assert (=> b!184445 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))))))

(declare-fun res!87224 () Bool)

(assert (=> b!184445 (= res!87224 (contains!1265 lt!91104 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184445 (=> (not res!87224) (not e!121395))))

(declare-fun b!184446 () Bool)

(declare-fun lt!91100 () Unit!5539)

(declare-fun lt!91103 () Unit!5539)

(assert (=> b!184446 (= lt!91100 lt!91103)))

(declare-fun lt!91106 () V!5401)

(declare-fun lt!91101 () ListLongMap!2307)

(declare-fun lt!91105 () (_ BitVec 64))

(declare-fun lt!91102 () (_ BitVec 64))

(assert (=> b!184446 (not (contains!1265 (+!279 lt!91101 (tuple2!3399 lt!91102 lt!91106)) lt!91105))))

(declare-fun addStillNotContains!88 (ListLongMap!2307 (_ BitVec 64) V!5401 (_ BitVec 64)) Unit!5539)

(assert (=> b!184446 (= lt!91103 (addStillNotContains!88 lt!91101 lt!91102 lt!91106 lt!91105))))

(assert (=> b!184446 (= lt!91105 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!184446 (= lt!91106 (get!2117 (select (arr!3689 (_values!3746 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3763 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184446 (= lt!91102 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184446 (= lt!91101 call!18604)))

(declare-fun e!121393 () ListLongMap!2307)

(assert (=> b!184446 (= e!121393 (+!279 call!18604 (tuple2!3399 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000) (get!2117 (select (arr!3689 (_values!3746 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3763 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!184447 () Bool)

(declare-fun e!121394 () Bool)

(assert (=> b!184447 (= e!121394 (validKeyInArray!0 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184447 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!184439 () Bool)

(assert (=> b!184439 (= e!121389 e!121390)))

(declare-fun c!33095 () Bool)

(assert (=> b!184439 (= c!33095 e!121394)))

(declare-fun res!87223 () Bool)

(assert (=> b!184439 (=> (not res!87223) (not e!121394))))

(assert (=> b!184439 (= res!87223 (bvslt #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))))))

(declare-fun d!54795 () Bool)

(assert (=> d!54795 e!121389))

(declare-fun res!87226 () Bool)

(assert (=> d!54795 (=> (not res!87226) (not e!121389))))

(assert (=> d!54795 (= res!87226 (not (contains!1265 lt!91104 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54795 (= lt!91104 e!121391)))

(declare-fun c!33096 () Bool)

(assert (=> d!54795 (= c!33096 (bvsge #b00000000000000000000000000000000 (size!4003 (_keys!5689 thiss!1248))))))

(assert (=> d!54795 (validMask!0 (mask!8844 thiss!1248))))

(assert (=> d!54795 (= (getCurrentListMapNoExtraKeys!183 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)) lt!91104)))

(declare-fun b!184448 () Bool)

(assert (=> b!184448 (= e!121393 call!18604)))

(declare-fun b!184449 () Bool)

(assert (=> b!184449 (= e!121391 e!121393)))

(declare-fun c!33094 () Bool)

(assert (=> b!184449 (= c!33094 (validKeyInArray!0 (select (arr!3688 (_keys!5689 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54795 c!33096) b!184440))

(assert (= (and d!54795 (not c!33096)) b!184449))

(assert (= (and b!184449 c!33094) b!184446))

(assert (= (and b!184449 (not c!33094)) b!184448))

(assert (= (or b!184446 b!184448) bm!18601))

(assert (= (and d!54795 res!87226) b!184441))

(assert (= (and b!184441 res!87225) b!184439))

(assert (= (and b!184439 res!87223) b!184447))

(assert (= (and b!184439 c!33095) b!184445))

(assert (= (and b!184439 (not c!33095)) b!184443))

(assert (= (and b!184445 res!87224) b!184444))

(assert (= (and b!184443 c!33097) b!184442))

(assert (= (and b!184443 (not c!33097)) b!184438))

(declare-fun b_lambda!7205 () Bool)

(assert (=> (not b_lambda!7205) (not b!184444)))

(assert (=> b!184444 t!7205))

(declare-fun b_and!11109 () Bool)

(assert (= b_and!11107 (and (=> t!7205 result!4775) b_and!11109)))

(declare-fun b_lambda!7207 () Bool)

(assert (=> (not b_lambda!7207) (not b!184446)))

(assert (=> b!184446 t!7205))

(declare-fun b_and!11111 () Bool)

(assert (= b_and!11109 (and (=> t!7205 result!4775) b_and!11111)))

(assert (=> b!184446 m!211183))

(declare-fun m!211271 () Bool)

(assert (=> b!184446 m!211271))

(assert (=> b!184446 m!211187))

(assert (=> b!184446 m!211187))

(assert (=> b!184446 m!211183))

(assert (=> b!184446 m!211189))

(assert (=> b!184446 m!211271))

(declare-fun m!211273 () Bool)

(assert (=> b!184446 m!211273))

(assert (=> b!184446 m!211163))

(declare-fun m!211275 () Bool)

(assert (=> b!184446 m!211275))

(declare-fun m!211277 () Bool)

(assert (=> b!184446 m!211277))

(declare-fun m!211279 () Bool)

(assert (=> bm!18601 m!211279))

(declare-fun m!211281 () Bool)

(assert (=> d!54795 m!211281))

(assert (=> d!54795 m!211073))

(assert (=> b!184442 m!211279))

(declare-fun m!211283 () Bool)

(assert (=> b!184438 m!211283))

(assert (=> b!184447 m!211163))

(assert (=> b!184447 m!211163))

(assert (=> b!184447 m!211181))

(declare-fun m!211285 () Bool)

(assert (=> b!184441 m!211285))

(assert (=> b!184445 m!211163))

(assert (=> b!184445 m!211163))

(declare-fun m!211287 () Bool)

(assert (=> b!184445 m!211287))

(assert (=> b!184449 m!211163))

(assert (=> b!184449 m!211163))

(assert (=> b!184449 m!211181))

(assert (=> b!184444 m!211163))

(declare-fun m!211289 () Bool)

(assert (=> b!184444 m!211289))

(assert (=> b!184444 m!211183))

(assert (=> b!184444 m!211187))

(assert (=> b!184444 m!211187))

(assert (=> b!184444 m!211183))

(assert (=> b!184444 m!211189))

(assert (=> b!184444 m!211163))

(assert (=> b!184281 d!54795))

(declare-fun d!54797 () Bool)

(declare-fun e!121397 () Bool)

(assert (=> d!54797 e!121397))

(declare-fun res!87227 () Bool)

(assert (=> d!54797 (=> res!87227 e!121397)))

(declare-fun lt!91108 () Bool)

(assert (=> d!54797 (= res!87227 (not lt!91108))))

(declare-fun lt!91107 () Bool)

(assert (=> d!54797 (= lt!91108 lt!91107)))

(declare-fun lt!91110 () Unit!5539)

(declare-fun e!121396 () Unit!5539)

(assert (=> d!54797 (= lt!91110 e!121396)))

(declare-fun c!33098 () Bool)

(assert (=> d!54797 (= c!33098 lt!91107)))

(assert (=> d!54797 (= lt!91107 (containsKey!221 (toList!1169 (+!279 lt!91035 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248)))) lt!91033))))

(assert (=> d!54797 (= (contains!1265 (+!279 lt!91035 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248))) lt!91033) lt!91108)))

(declare-fun b!184450 () Bool)

(declare-fun lt!91109 () Unit!5539)

(assert (=> b!184450 (= e!121396 lt!91109)))

(assert (=> b!184450 (= lt!91109 (lemmaContainsKeyImpliesGetValueByKeyDefined!170 (toList!1169 (+!279 lt!91035 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248)))) lt!91033))))

(assert (=> b!184450 (isDefined!171 (getValueByKey!217 (toList!1169 (+!279 lt!91035 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248)))) lt!91033))))

(declare-fun b!184451 () Bool)

(declare-fun Unit!5544 () Unit!5539)

(assert (=> b!184451 (= e!121396 Unit!5544)))

(declare-fun b!184452 () Bool)

(assert (=> b!184452 (= e!121397 (isDefined!171 (getValueByKey!217 (toList!1169 (+!279 lt!91035 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248)))) lt!91033)))))

(assert (= (and d!54797 c!33098) b!184450))

(assert (= (and d!54797 (not c!33098)) b!184451))

(assert (= (and d!54797 (not res!87227)) b!184452))

(declare-fun m!211291 () Bool)

(assert (=> d!54797 m!211291))

(declare-fun m!211293 () Bool)

(assert (=> b!184450 m!211293))

(declare-fun m!211295 () Bool)

(assert (=> b!184450 m!211295))

(assert (=> b!184450 m!211295))

(declare-fun m!211297 () Bool)

(assert (=> b!184450 m!211297))

(assert (=> b!184452 m!211295))

(assert (=> b!184452 m!211295))

(assert (=> b!184452 m!211297))

(assert (=> b!184281 d!54797))

(declare-fun d!54799 () Bool)

(assert (=> d!54799 (contains!1265 (+!279 lt!91035 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248))) lt!91033)))

(declare-fun lt!91113 () Unit!5539)

(declare-fun choose!983 (ListLongMap!2307 (_ BitVec 64) V!5401 (_ BitVec 64)) Unit!5539)

(assert (=> d!54799 (= lt!91113 (choose!983 lt!91035 lt!91032 (zeroValue!3604 thiss!1248) lt!91033))))

(assert (=> d!54799 (contains!1265 lt!91035 lt!91033)))

(assert (=> d!54799 (= (addStillContains!138 lt!91035 lt!91032 (zeroValue!3604 thiss!1248) lt!91033) lt!91113)))

(declare-fun bs!7463 () Bool)

(assert (= bs!7463 d!54799))

(assert (=> bs!7463 m!211153))

(assert (=> bs!7463 m!211153))

(assert (=> bs!7463 m!211155))

(declare-fun m!211299 () Bool)

(assert (=> bs!7463 m!211299))

(declare-fun m!211301 () Bool)

(assert (=> bs!7463 m!211301))

(assert (=> b!184281 d!54799))

(declare-fun d!54801 () Bool)

(assert (=> d!54801 (= (apply!162 (+!279 lt!91026 (tuple2!3399 lt!91018 (minValue!3604 thiss!1248))) lt!91023) (apply!162 lt!91026 lt!91023))))

(declare-fun lt!91116 () Unit!5539)

(declare-fun choose!984 (ListLongMap!2307 (_ BitVec 64) V!5401 (_ BitVec 64)) Unit!5539)

(assert (=> d!54801 (= lt!91116 (choose!984 lt!91026 lt!91018 (minValue!3604 thiss!1248) lt!91023))))

(declare-fun e!121400 () Bool)

(assert (=> d!54801 e!121400))

(declare-fun res!87230 () Bool)

(assert (=> d!54801 (=> (not res!87230) (not e!121400))))

(assert (=> d!54801 (= res!87230 (contains!1265 lt!91026 lt!91023))))

(assert (=> d!54801 (= (addApplyDifferent!138 lt!91026 lt!91018 (minValue!3604 thiss!1248) lt!91023) lt!91116)))

(declare-fun b!184457 () Bool)

(assert (=> b!184457 (= e!121400 (not (= lt!91023 lt!91018)))))

(assert (= (and d!54801 res!87230) b!184457))

(assert (=> d!54801 m!211151))

(assert (=> d!54801 m!211151))

(assert (=> d!54801 m!211167))

(assert (=> d!54801 m!211149))

(declare-fun m!211303 () Bool)

(assert (=> d!54801 m!211303))

(declare-fun m!211305 () Bool)

(assert (=> d!54801 m!211305))

(assert (=> b!184281 d!54801))

(declare-fun d!54803 () Bool)

(assert (=> d!54803 (= (apply!162 (+!279 lt!91028 (tuple2!3399 lt!91034 (zeroValue!3604 thiss!1248))) lt!91025) (apply!162 lt!91028 lt!91025))))

(declare-fun lt!91117 () Unit!5539)

(assert (=> d!54803 (= lt!91117 (choose!984 lt!91028 lt!91034 (zeroValue!3604 thiss!1248) lt!91025))))

(declare-fun e!121401 () Bool)

(assert (=> d!54803 e!121401))

(declare-fun res!87231 () Bool)

(assert (=> d!54803 (=> (not res!87231) (not e!121401))))

(assert (=> d!54803 (= res!87231 (contains!1265 lt!91028 lt!91025))))

(assert (=> d!54803 (= (addApplyDifferent!138 lt!91028 lt!91034 (zeroValue!3604 thiss!1248) lt!91025) lt!91117)))

(declare-fun b!184458 () Bool)

(assert (=> b!184458 (= e!121401 (not (= lt!91025 lt!91034)))))

(assert (= (and d!54803 res!87231) b!184458))

(assert (=> d!54803 m!211171))

(assert (=> d!54803 m!211171))

(assert (=> d!54803 m!211173))

(assert (=> d!54803 m!211177))

(declare-fun m!211307 () Bool)

(assert (=> d!54803 m!211307))

(declare-fun m!211309 () Bool)

(assert (=> d!54803 m!211309))

(assert (=> b!184281 d!54803))

(declare-fun d!54805 () Bool)

(declare-fun e!121402 () Bool)

(assert (=> d!54805 e!121402))

(declare-fun res!87232 () Bool)

(assert (=> d!54805 (=> (not res!87232) (not e!121402))))

(declare-fun lt!91121 () ListLongMap!2307)

(assert (=> d!54805 (= res!87232 (contains!1265 lt!91121 (_1!1710 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248)))))))

(declare-fun lt!91119 () List!2337)

(assert (=> d!54805 (= lt!91121 (ListLongMap!2308 lt!91119))))

(declare-fun lt!91120 () Unit!5539)

(declare-fun lt!91118 () Unit!5539)

(assert (=> d!54805 (= lt!91120 lt!91118)))

(assert (=> d!54805 (= (getValueByKey!217 lt!91119 (_1!1710 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248)))) (Some!222 (_2!1710 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248)))))))

(assert (=> d!54805 (= lt!91118 (lemmaContainsTupThenGetReturnValue!116 lt!91119 (_1!1710 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248))) (_2!1710 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248)))))))

(assert (=> d!54805 (= lt!91119 (insertStrictlySorted!119 (toList!1169 lt!91035) (_1!1710 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248))) (_2!1710 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248)))))))

(assert (=> d!54805 (= (+!279 lt!91035 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248))) lt!91121)))

(declare-fun b!184459 () Bool)

(declare-fun res!87233 () Bool)

(assert (=> b!184459 (=> (not res!87233) (not e!121402))))

(assert (=> b!184459 (= res!87233 (= (getValueByKey!217 (toList!1169 lt!91121) (_1!1710 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248)))) (Some!222 (_2!1710 (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248))))))))

(declare-fun b!184460 () Bool)

(assert (=> b!184460 (= e!121402 (contains!1268 (toList!1169 lt!91121) (tuple2!3399 lt!91032 (zeroValue!3604 thiss!1248))))))

(assert (= (and d!54805 res!87232) b!184459))

(assert (= (and b!184459 res!87233) b!184460))

(declare-fun m!211311 () Bool)

(assert (=> d!54805 m!211311))

(declare-fun m!211313 () Bool)

(assert (=> d!54805 m!211313))

(declare-fun m!211315 () Bool)

(assert (=> d!54805 m!211315))

(declare-fun m!211317 () Bool)

(assert (=> d!54805 m!211317))

(declare-fun m!211319 () Bool)

(assert (=> b!184459 m!211319))

(declare-fun m!211321 () Bool)

(assert (=> b!184460 m!211321))

(assert (=> b!184281 d!54805))

(declare-fun d!54807 () Bool)

(assert (=> d!54807 (= (apply!162 lt!91026 lt!91023) (get!2118 (getValueByKey!217 (toList!1169 lt!91026) lt!91023)))))

(declare-fun bs!7464 () Bool)

(assert (= bs!7464 d!54807))

(declare-fun m!211323 () Bool)

(assert (=> bs!7464 m!211323))

(assert (=> bs!7464 m!211323))

(declare-fun m!211325 () Bool)

(assert (=> bs!7464 m!211325))

(assert (=> b!184281 d!54807))

(declare-fun d!54809 () Bool)

(declare-fun e!121403 () Bool)

(assert (=> d!54809 e!121403))

(declare-fun res!87234 () Bool)

(assert (=> d!54809 (=> (not res!87234) (not e!121403))))

(declare-fun lt!91125 () ListLongMap!2307)

(assert (=> d!54809 (= res!87234 (contains!1265 lt!91125 (_1!1710 (tuple2!3399 lt!91018 (minValue!3604 thiss!1248)))))))

(declare-fun lt!91123 () List!2337)

(assert (=> d!54809 (= lt!91125 (ListLongMap!2308 lt!91123))))

(declare-fun lt!91124 () Unit!5539)

(declare-fun lt!91122 () Unit!5539)

(assert (=> d!54809 (= lt!91124 lt!91122)))

(assert (=> d!54809 (= (getValueByKey!217 lt!91123 (_1!1710 (tuple2!3399 lt!91018 (minValue!3604 thiss!1248)))) (Some!222 (_2!1710 (tuple2!3399 lt!91018 (minValue!3604 thiss!1248)))))))

(assert (=> d!54809 (= lt!91122 (lemmaContainsTupThenGetReturnValue!116 lt!91123 (_1!1710 (tuple2!3399 lt!91018 (minValue!3604 thiss!1248))) (_2!1710 (tuple2!3399 lt!91018 (minValue!3604 thiss!1248)))))))

(assert (=> d!54809 (= lt!91123 (insertStrictlySorted!119 (toList!1169 lt!91026) (_1!1710 (tuple2!3399 lt!91018 (minValue!3604 thiss!1248))) (_2!1710 (tuple2!3399 lt!91018 (minValue!3604 thiss!1248)))))))

(assert (=> d!54809 (= (+!279 lt!91026 (tuple2!3399 lt!91018 (minValue!3604 thiss!1248))) lt!91125)))

(declare-fun b!184461 () Bool)

(declare-fun res!87235 () Bool)

(assert (=> b!184461 (=> (not res!87235) (not e!121403))))

(assert (=> b!184461 (= res!87235 (= (getValueByKey!217 (toList!1169 lt!91125) (_1!1710 (tuple2!3399 lt!91018 (minValue!3604 thiss!1248)))) (Some!222 (_2!1710 (tuple2!3399 lt!91018 (minValue!3604 thiss!1248))))))))

(declare-fun b!184462 () Bool)

(assert (=> b!184462 (= e!121403 (contains!1268 (toList!1169 lt!91125) (tuple2!3399 lt!91018 (minValue!3604 thiss!1248))))))

(assert (= (and d!54809 res!87234) b!184461))

(assert (= (and b!184461 res!87235) b!184462))

(declare-fun m!211327 () Bool)

(assert (=> d!54809 m!211327))

(declare-fun m!211329 () Bool)

(assert (=> d!54809 m!211329))

(declare-fun m!211331 () Bool)

(assert (=> d!54809 m!211331))

(declare-fun m!211333 () Bool)

(assert (=> d!54809 m!211333))

(declare-fun m!211335 () Bool)

(assert (=> b!184461 m!211335))

(declare-fun m!211337 () Bool)

(assert (=> b!184462 m!211337))

(assert (=> b!184281 d!54809))

(declare-fun d!54811 () Bool)

(declare-fun e!121404 () Bool)

(assert (=> d!54811 e!121404))

(declare-fun res!87236 () Bool)

(assert (=> d!54811 (=> (not res!87236) (not e!121404))))

(declare-fun lt!91129 () ListLongMap!2307)

(assert (=> d!54811 (= res!87236 (contains!1265 lt!91129 (_1!1710 (tuple2!3399 lt!91034 (zeroValue!3604 thiss!1248)))))))

(declare-fun lt!91127 () List!2337)

(assert (=> d!54811 (= lt!91129 (ListLongMap!2308 lt!91127))))

(declare-fun lt!91128 () Unit!5539)

(declare-fun lt!91126 () Unit!5539)

(assert (=> d!54811 (= lt!91128 lt!91126)))

(assert (=> d!54811 (= (getValueByKey!217 lt!91127 (_1!1710 (tuple2!3399 lt!91034 (zeroValue!3604 thiss!1248)))) (Some!222 (_2!1710 (tuple2!3399 lt!91034 (zeroValue!3604 thiss!1248)))))))

(assert (=> d!54811 (= lt!91126 (lemmaContainsTupThenGetReturnValue!116 lt!91127 (_1!1710 (tuple2!3399 lt!91034 (zeroValue!3604 thiss!1248))) (_2!1710 (tuple2!3399 lt!91034 (zeroValue!3604 thiss!1248)))))))

(assert (=> d!54811 (= lt!91127 (insertStrictlySorted!119 (toList!1169 lt!91028) (_1!1710 (tuple2!3399 lt!91034 (zeroValue!3604 thiss!1248))) (_2!1710 (tuple2!3399 lt!91034 (zeroValue!3604 thiss!1248)))))))

(assert (=> d!54811 (= (+!279 lt!91028 (tuple2!3399 lt!91034 (zeroValue!3604 thiss!1248))) lt!91129)))

(declare-fun b!184463 () Bool)

(declare-fun res!87237 () Bool)

(assert (=> b!184463 (=> (not res!87237) (not e!121404))))

(assert (=> b!184463 (= res!87237 (= (getValueByKey!217 (toList!1169 lt!91129) (_1!1710 (tuple2!3399 lt!91034 (zeroValue!3604 thiss!1248)))) (Some!222 (_2!1710 (tuple2!3399 lt!91034 (zeroValue!3604 thiss!1248))))))))

(declare-fun b!184464 () Bool)

(assert (=> b!184464 (= e!121404 (contains!1268 (toList!1169 lt!91129) (tuple2!3399 lt!91034 (zeroValue!3604 thiss!1248))))))

(assert (= (and d!54811 res!87236) b!184463))

(assert (= (and b!184463 res!87237) b!184464))

(declare-fun m!211339 () Bool)

(assert (=> d!54811 m!211339))

(declare-fun m!211341 () Bool)

(assert (=> d!54811 m!211341))

(declare-fun m!211343 () Bool)

(assert (=> d!54811 m!211343))

(declare-fun m!211345 () Bool)

(assert (=> d!54811 m!211345))

(declare-fun m!211347 () Bool)

(assert (=> b!184463 m!211347))

(declare-fun m!211349 () Bool)

(assert (=> b!184464 m!211349))

(assert (=> b!184281 d!54811))

(declare-fun d!54813 () Bool)

(assert (=> d!54813 (= (apply!162 (+!279 lt!91028 (tuple2!3399 lt!91034 (zeroValue!3604 thiss!1248))) lt!91025) (get!2118 (getValueByKey!217 (toList!1169 (+!279 lt!91028 (tuple2!3399 lt!91034 (zeroValue!3604 thiss!1248)))) lt!91025)))))

(declare-fun bs!7465 () Bool)

(assert (= bs!7465 d!54813))

(declare-fun m!211351 () Bool)

(assert (=> bs!7465 m!211351))

(assert (=> bs!7465 m!211351))

(declare-fun m!211353 () Bool)

(assert (=> bs!7465 m!211353))

(assert (=> b!184281 d!54813))

(declare-fun d!54815 () Bool)

(assert (=> d!54815 (= (apply!162 (+!279 lt!91039 (tuple2!3399 lt!91036 (minValue!3604 thiss!1248))) lt!91020) (get!2118 (getValueByKey!217 (toList!1169 (+!279 lt!91039 (tuple2!3399 lt!91036 (minValue!3604 thiss!1248)))) lt!91020)))))

(declare-fun bs!7466 () Bool)

(assert (= bs!7466 d!54815))

(declare-fun m!211355 () Bool)

(assert (=> bs!7466 m!211355))

(assert (=> bs!7466 m!211355))

(declare-fun m!211357 () Bool)

(assert (=> bs!7466 m!211357))

(assert (=> b!184281 d!54815))

(declare-fun d!54817 () Bool)

(declare-fun e!121405 () Bool)

(assert (=> d!54817 e!121405))

(declare-fun res!87238 () Bool)

(assert (=> d!54817 (=> (not res!87238) (not e!121405))))

(declare-fun lt!91133 () ListLongMap!2307)

(assert (=> d!54817 (= res!87238 (contains!1265 lt!91133 (_1!1710 (tuple2!3399 lt!91036 (minValue!3604 thiss!1248)))))))

(declare-fun lt!91131 () List!2337)

(assert (=> d!54817 (= lt!91133 (ListLongMap!2308 lt!91131))))

(declare-fun lt!91132 () Unit!5539)

(declare-fun lt!91130 () Unit!5539)

(assert (=> d!54817 (= lt!91132 lt!91130)))

(assert (=> d!54817 (= (getValueByKey!217 lt!91131 (_1!1710 (tuple2!3399 lt!91036 (minValue!3604 thiss!1248)))) (Some!222 (_2!1710 (tuple2!3399 lt!91036 (minValue!3604 thiss!1248)))))))

(assert (=> d!54817 (= lt!91130 (lemmaContainsTupThenGetReturnValue!116 lt!91131 (_1!1710 (tuple2!3399 lt!91036 (minValue!3604 thiss!1248))) (_2!1710 (tuple2!3399 lt!91036 (minValue!3604 thiss!1248)))))))

(assert (=> d!54817 (= lt!91131 (insertStrictlySorted!119 (toList!1169 lt!91039) (_1!1710 (tuple2!3399 lt!91036 (minValue!3604 thiss!1248))) (_2!1710 (tuple2!3399 lt!91036 (minValue!3604 thiss!1248)))))))

(assert (=> d!54817 (= (+!279 lt!91039 (tuple2!3399 lt!91036 (minValue!3604 thiss!1248))) lt!91133)))

(declare-fun b!184465 () Bool)

(declare-fun res!87239 () Bool)

(assert (=> b!184465 (=> (not res!87239) (not e!121405))))

(assert (=> b!184465 (= res!87239 (= (getValueByKey!217 (toList!1169 lt!91133) (_1!1710 (tuple2!3399 lt!91036 (minValue!3604 thiss!1248)))) (Some!222 (_2!1710 (tuple2!3399 lt!91036 (minValue!3604 thiss!1248))))))))

(declare-fun b!184466 () Bool)

(assert (=> b!184466 (= e!121405 (contains!1268 (toList!1169 lt!91133) (tuple2!3399 lt!91036 (minValue!3604 thiss!1248))))))

(assert (= (and d!54817 res!87238) b!184465))

(assert (= (and b!184465 res!87239) b!184466))

(declare-fun m!211359 () Bool)

(assert (=> d!54817 m!211359))

(declare-fun m!211361 () Bool)

(assert (=> d!54817 m!211361))

(declare-fun m!211363 () Bool)

(assert (=> d!54817 m!211363))

(declare-fun m!211365 () Bool)

(assert (=> d!54817 m!211365))

(declare-fun m!211367 () Bool)

(assert (=> b!184465 m!211367))

(declare-fun m!211369 () Bool)

(assert (=> b!184466 m!211369))

(assert (=> b!184281 d!54817))

(declare-fun d!54819 () Bool)

(assert (=> d!54819 (= (apply!162 lt!91028 lt!91025) (get!2118 (getValueByKey!217 (toList!1169 lt!91028) lt!91025)))))

(declare-fun bs!7467 () Bool)

(assert (= bs!7467 d!54819))

(declare-fun m!211371 () Bool)

(assert (=> bs!7467 m!211371))

(assert (=> bs!7467 m!211371))

(declare-fun m!211373 () Bool)

(assert (=> bs!7467 m!211373))

(assert (=> b!184281 d!54819))

(declare-fun d!54821 () Bool)

(assert (=> d!54821 (= (apply!162 (+!279 lt!91026 (tuple2!3399 lt!91018 (minValue!3604 thiss!1248))) lt!91023) (get!2118 (getValueByKey!217 (toList!1169 (+!279 lt!91026 (tuple2!3399 lt!91018 (minValue!3604 thiss!1248)))) lt!91023)))))

(declare-fun bs!7468 () Bool)

(assert (= bs!7468 d!54821))

(declare-fun m!211375 () Bool)

(assert (=> bs!7468 m!211375))

(assert (=> bs!7468 m!211375))

(declare-fun m!211377 () Bool)

(assert (=> bs!7468 m!211377))

(assert (=> b!184281 d!54821))

(declare-fun d!54823 () Bool)

(assert (=> d!54823 (= (apply!162 (+!279 lt!91039 (tuple2!3399 lt!91036 (minValue!3604 thiss!1248))) lt!91020) (apply!162 lt!91039 lt!91020))))

(declare-fun lt!91134 () Unit!5539)

(assert (=> d!54823 (= lt!91134 (choose!984 lt!91039 lt!91036 (minValue!3604 thiss!1248) lt!91020))))

(declare-fun e!121406 () Bool)

(assert (=> d!54823 e!121406))

(declare-fun res!87240 () Bool)

(assert (=> d!54823 (=> (not res!87240) (not e!121406))))

(assert (=> d!54823 (= res!87240 (contains!1265 lt!91039 lt!91020))))

(assert (=> d!54823 (= (addApplyDifferent!138 lt!91039 lt!91036 (minValue!3604 thiss!1248) lt!91020) lt!91134)))

(declare-fun b!184467 () Bool)

(assert (=> b!184467 (= e!121406 (not (= lt!91020 lt!91036)))))

(assert (= (and d!54823 res!87240) b!184467))

(assert (=> d!54823 m!211147))

(assert (=> d!54823 m!211147))

(assert (=> d!54823 m!211179))

(assert (=> d!54823 m!211169))

(declare-fun m!211379 () Bool)

(assert (=> d!54823 m!211379))

(declare-fun m!211381 () Bool)

(assert (=> d!54823 m!211381))

(assert (=> b!184281 d!54823))

(declare-fun d!54825 () Bool)

(assert (=> d!54825 (= (apply!162 lt!91039 lt!91020) (get!2118 (getValueByKey!217 (toList!1169 lt!91039) lt!91020)))))

(declare-fun bs!7469 () Bool)

(assert (= bs!7469 d!54825))

(declare-fun m!211383 () Bool)

(assert (=> bs!7469 m!211383))

(assert (=> bs!7469 m!211383))

(declare-fun m!211385 () Bool)

(assert (=> bs!7469 m!211385))

(assert (=> b!184281 d!54825))

(assert (=> d!54763 d!54759))

(declare-fun d!54827 () Bool)

(declare-fun e!121408 () Bool)

(assert (=> d!54827 e!121408))

(declare-fun res!87241 () Bool)

(assert (=> d!54827 (=> res!87241 e!121408)))

(declare-fun lt!91136 () Bool)

(assert (=> d!54827 (= res!87241 (not lt!91136))))

(declare-fun lt!91135 () Bool)

(assert (=> d!54827 (= lt!91136 lt!91135)))

(declare-fun lt!91138 () Unit!5539)

(declare-fun e!121407 () Unit!5539)

(assert (=> d!54827 (= lt!91138 e!121407)))

(declare-fun c!33099 () Bool)

(assert (=> d!54827 (= c!33099 lt!91135)))

(assert (=> d!54827 (= lt!91135 (containsKey!221 (toList!1169 lt!91021) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54827 (= (contains!1265 lt!91021 #b0000000000000000000000000000000000000000000000000000000000000000) lt!91136)))

(declare-fun b!184468 () Bool)

(declare-fun lt!91137 () Unit!5539)

(assert (=> b!184468 (= e!121407 lt!91137)))

(assert (=> b!184468 (= lt!91137 (lemmaContainsKeyImpliesGetValueByKeyDefined!170 (toList!1169 lt!91021) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184468 (isDefined!171 (getValueByKey!217 (toList!1169 lt!91021) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184469 () Bool)

(declare-fun Unit!5545 () Unit!5539)

(assert (=> b!184469 (= e!121407 Unit!5545)))

(declare-fun b!184470 () Bool)

(assert (=> b!184470 (= e!121408 (isDefined!171 (getValueByKey!217 (toList!1169 lt!91021) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54827 c!33099) b!184468))

(assert (= (and d!54827 (not c!33099)) b!184469))

(assert (= (and d!54827 (not res!87241)) b!184470))

(declare-fun m!211387 () Bool)

(assert (=> d!54827 m!211387))

(declare-fun m!211389 () Bool)

(assert (=> b!184468 m!211389))

(assert (=> b!184468 m!211203))

(assert (=> b!184468 m!211203))

(declare-fun m!211391 () Bool)

(assert (=> b!184468 m!211391))

(assert (=> b!184470 m!211203))

(assert (=> b!184470 m!211203))

(assert (=> b!184470 m!211391))

(assert (=> bm!18585 d!54827))

(declare-fun d!54829 () Bool)

(declare-fun isEmpty!472 (Option!223) Bool)

(assert (=> d!54829 (= (isDefined!171 (getValueByKey!217 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828)) (not (isEmpty!472 (getValueByKey!217 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828))))))

(declare-fun bs!7470 () Bool)

(assert (= bs!7470 d!54829))

(assert (=> bs!7470 m!211139))

(declare-fun m!211393 () Bool)

(assert (=> bs!7470 m!211393))

(assert (=> b!184223 d!54829))

(declare-fun b!184480 () Bool)

(declare-fun e!121413 () Option!223)

(declare-fun e!121414 () Option!223)

(assert (=> b!184480 (= e!121413 e!121414)))

(declare-fun c!33105 () Bool)

(assert (=> b!184480 (= c!33105 (and ((_ is Cons!2333) (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))) (not (= (_1!1710 (h!2964 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))))) key!828))))))

(declare-fun b!184481 () Bool)

(assert (=> b!184481 (= e!121414 (getValueByKey!217 (t!7202 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))) key!828))))

(declare-fun b!184482 () Bool)

(assert (=> b!184482 (= e!121414 None!221)))

(declare-fun d!54831 () Bool)

(declare-fun c!33104 () Bool)

(assert (=> d!54831 (= c!33104 (and ((_ is Cons!2333) (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))) (= (_1!1710 (h!2964 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))))) key!828)))))

(assert (=> d!54831 (= (getValueByKey!217 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828) e!121413)))

(declare-fun b!184479 () Bool)

(assert (=> b!184479 (= e!121413 (Some!222 (_2!1710 (h!2964 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))))))))

(assert (= (and d!54831 c!33104) b!184479))

(assert (= (and d!54831 (not c!33104)) b!184480))

(assert (= (and b!184480 c!33105) b!184481))

(assert (= (and b!184480 (not c!33105)) b!184482))

(declare-fun m!211395 () Bool)

(assert (=> b!184481 m!211395))

(assert (=> b!184223 d!54831))

(declare-fun d!54833 () Bool)

(declare-fun e!121416 () Bool)

(assert (=> d!54833 e!121416))

(declare-fun res!87242 () Bool)

(assert (=> d!54833 (=> res!87242 e!121416)))

(declare-fun lt!91140 () Bool)

(assert (=> d!54833 (= res!87242 (not lt!91140))))

(declare-fun lt!91139 () Bool)

(assert (=> d!54833 (= lt!91140 lt!91139)))

(declare-fun lt!91142 () Unit!5539)

(declare-fun e!121415 () Unit!5539)

(assert (=> d!54833 (= lt!91142 e!121415)))

(declare-fun c!33106 () Bool)

(assert (=> d!54833 (= c!33106 lt!91139)))

(assert (=> d!54833 (= lt!91139 (containsKey!221 (toList!1169 lt!91021) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54833 (= (contains!1265 lt!91021 #b1000000000000000000000000000000000000000000000000000000000000000) lt!91140)))

(declare-fun b!184483 () Bool)

(declare-fun lt!91141 () Unit!5539)

(assert (=> b!184483 (= e!121415 lt!91141)))

(assert (=> b!184483 (= lt!91141 (lemmaContainsKeyImpliesGetValueByKeyDefined!170 (toList!1169 lt!91021) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184483 (isDefined!171 (getValueByKey!217 (toList!1169 lt!91021) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184484 () Bool)

(declare-fun Unit!5546 () Unit!5539)

(assert (=> b!184484 (= e!121415 Unit!5546)))

(declare-fun b!184485 () Bool)

(assert (=> b!184485 (= e!121416 (isDefined!171 (getValueByKey!217 (toList!1169 lt!91021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54833 c!33106) b!184483))

(assert (= (and d!54833 (not c!33106)) b!184484))

(assert (= (and d!54833 (not res!87242)) b!184485))

(declare-fun m!211397 () Bool)

(assert (=> d!54833 m!211397))

(declare-fun m!211399 () Bool)

(assert (=> b!184483 m!211399))

(assert (=> b!184483 m!211207))

(assert (=> b!184483 m!211207))

(declare-fun m!211401 () Bool)

(assert (=> b!184483 m!211401))

(assert (=> b!184485 m!211207))

(assert (=> b!184485 m!211207))

(assert (=> b!184485 m!211401))

(assert (=> bm!18587 d!54833))

(assert (=> bm!18584 d!54795))

(declare-fun d!54835 () Bool)

(assert (=> d!54835 (isDefined!171 (getValueByKey!217 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828))))

(declare-fun lt!91145 () Unit!5539)

(declare-fun choose!985 (List!2337 (_ BitVec 64)) Unit!5539)

(assert (=> d!54835 (= lt!91145 (choose!985 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828))))

(declare-fun e!121419 () Bool)

(assert (=> d!54835 e!121419))

(declare-fun res!87245 () Bool)

(assert (=> d!54835 (=> (not res!87245) (not e!121419))))

(declare-fun isStrictlySorted!342 (List!2337) Bool)

(assert (=> d!54835 (= res!87245 (isStrictlySorted!342 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))))))

(assert (=> d!54835 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!170 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828) lt!91145)))

(declare-fun b!184488 () Bool)

(assert (=> b!184488 (= e!121419 (containsKey!221 (toList!1169 (getCurrentListMap!802 (_keys!5689 thiss!1248) (_values!3746 thiss!1248) (mask!8844 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828))))

(assert (= (and d!54835 res!87245) b!184488))

(assert (=> d!54835 m!211139))

(assert (=> d!54835 m!211139))

(assert (=> d!54835 m!211141))

(declare-fun m!211403 () Bool)

(assert (=> d!54835 m!211403))

(declare-fun m!211405 () Bool)

(assert (=> d!54835 m!211405))

(assert (=> b!184488 m!211135))

(assert (=> b!184221 d!54835))

(assert (=> b!184221 d!54829))

(assert (=> b!184221 d!54831))

(declare-fun d!54837 () Bool)

(declare-fun e!121420 () Bool)

(assert (=> d!54837 e!121420))

(declare-fun res!87246 () Bool)

(assert (=> d!54837 (=> (not res!87246) (not e!121420))))

(declare-fun lt!91149 () ListLongMap!2307)

(assert (=> d!54837 (= res!87246 (contains!1265 lt!91149 (_1!1710 (ite (or c!33051 c!33049) (tuple2!3399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))))))

(declare-fun lt!91147 () List!2337)

(assert (=> d!54837 (= lt!91149 (ListLongMap!2308 lt!91147))))

(declare-fun lt!91148 () Unit!5539)

(declare-fun lt!91146 () Unit!5539)

(assert (=> d!54837 (= lt!91148 lt!91146)))

(assert (=> d!54837 (= (getValueByKey!217 lt!91147 (_1!1710 (ite (or c!33051 c!33049) (tuple2!3399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))) (Some!222 (_2!1710 (ite (or c!33051 c!33049) (tuple2!3399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))))))

(assert (=> d!54837 (= lt!91146 (lemmaContainsTupThenGetReturnValue!116 lt!91147 (_1!1710 (ite (or c!33051 c!33049) (tuple2!3399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))) (_2!1710 (ite (or c!33051 c!33049) (tuple2!3399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))))))

(assert (=> d!54837 (= lt!91147 (insertStrictlySorted!119 (toList!1169 (ite c!33051 call!18588 (ite c!33049 call!18587 call!18592))) (_1!1710 (ite (or c!33051 c!33049) (tuple2!3399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))) (_2!1710 (ite (or c!33051 c!33049) (tuple2!3399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))))))

(assert (=> d!54837 (= (+!279 (ite c!33051 call!18588 (ite c!33049 call!18587 call!18592)) (ite (or c!33051 c!33049) (tuple2!3399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))) lt!91149)))

(declare-fun b!184489 () Bool)

(declare-fun res!87247 () Bool)

(assert (=> b!184489 (=> (not res!87247) (not e!121420))))

(assert (=> b!184489 (= res!87247 (= (getValueByKey!217 (toList!1169 lt!91149) (_1!1710 (ite (or c!33051 c!33049) (tuple2!3399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))) (Some!222 (_2!1710 (ite (or c!33051 c!33049) (tuple2!3399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))))))))

(declare-fun b!184490 () Bool)

(assert (=> b!184490 (= e!121420 (contains!1268 (toList!1169 lt!91149) (ite (or c!33051 c!33049) (tuple2!3399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))))))

(assert (= (and d!54837 res!87246) b!184489))

(assert (= (and b!184489 res!87247) b!184490))

(declare-fun m!211407 () Bool)

(assert (=> d!54837 m!211407))

(declare-fun m!211409 () Bool)

(assert (=> d!54837 m!211409))

(declare-fun m!211411 () Bool)

(assert (=> d!54837 m!211411))

(declare-fun m!211413 () Bool)

(assert (=> d!54837 m!211413))

(declare-fun m!211415 () Bool)

(assert (=> b!184489 m!211415))

(declare-fun m!211417 () Bool)

(assert (=> b!184490 m!211417))

(assert (=> bm!18588 d!54837))

(declare-fun condMapEmpty!7427 () Bool)

(declare-fun mapDefault!7427 () ValueCell!1814)

(assert (=> mapNonEmpty!7426 (= condMapEmpty!7427 (= mapRest!7426 ((as const (Array (_ BitVec 32) ValueCell!1814)) mapDefault!7427)))))

(declare-fun e!121421 () Bool)

(declare-fun mapRes!7427 () Bool)

(assert (=> mapNonEmpty!7426 (= tp!16426 (and e!121421 mapRes!7427))))

(declare-fun mapNonEmpty!7427 () Bool)

(declare-fun tp!16427 () Bool)

(declare-fun e!121422 () Bool)

(assert (=> mapNonEmpty!7427 (= mapRes!7427 (and tp!16427 e!121422))))

(declare-fun mapValue!7427 () ValueCell!1814)

(declare-fun mapRest!7427 () (Array (_ BitVec 32) ValueCell!1814))

(declare-fun mapKey!7427 () (_ BitVec 32))

(assert (=> mapNonEmpty!7427 (= mapRest!7426 (store mapRest!7427 mapKey!7427 mapValue!7427))))

(declare-fun b!184492 () Bool)

(assert (=> b!184492 (= e!121421 tp_is_empty!4315)))

(declare-fun mapIsEmpty!7427 () Bool)

(assert (=> mapIsEmpty!7427 mapRes!7427))

(declare-fun b!184491 () Bool)

(assert (=> b!184491 (= e!121422 tp_is_empty!4315)))

(assert (= (and mapNonEmpty!7426 condMapEmpty!7427) mapIsEmpty!7427))

(assert (= (and mapNonEmpty!7426 (not condMapEmpty!7427)) mapNonEmpty!7427))

(assert (= (and mapNonEmpty!7427 ((_ is ValueCellFull!1814) mapValue!7427)) b!184491))

(assert (= (and mapNonEmpty!7426 ((_ is ValueCellFull!1814) mapDefault!7427)) b!184492))

(declare-fun m!211419 () Bool)

(assert (=> mapNonEmpty!7427 m!211419))

(declare-fun b_lambda!7209 () Bool)

(assert (= b_lambda!7207 (or (and b!184130 b_free!4543) b_lambda!7209)))

(declare-fun b_lambda!7211 () Bool)

(assert (= b_lambda!7205 (or (and b!184130 b_free!4543) b_lambda!7211)))

(check-sat (not b_lambda!7209) (not bm!18601) (not b!184400) (not b!184490) (not d!54833) (not b!184351) (not d!54813) (not bm!18592) (not b!184489) (not d!54789) (not d!54771) (not b!184401) (not d!54805) (not b!184438) (not b!184470) (not b!184483) (not b!184461) (not b!184452) (not d!54821) (not b!184460) (not bm!18595) (not b!184336) b_and!11111 (not b!184485) tp_is_empty!4315 (not b!184350) (not d!54795) (not d!54799) (not b!184462) (not d!54803) (not d!54819) (not d!54785) (not b!184363) (not d!54835) (not b!184468) (not b_lambda!7211) (not b!184446) (not b!184377) (not d!54817) (not b!184305) (not b!184466) (not b!184442) (not b!184445) (not d!54827) (not d!54807) (not b!184441) (not b!184465) (not d!54815) (not b!184335) (not b!184449) (not b_next!4543) (not b!184371) (not b!184376) (not b!184464) (not d!54767) (not d!54823) (not b!184463) (not d!54829) (not b_lambda!7203) (not d!54811) (not mapNonEmpty!7427) (not b!184450) (not b!184459) (not b!184481) (not b!184412) (not d!54787) (not d!54775) (not d!54797) (not b!184307) (not d!54809) (not d!54837) (not bm!18598) (not d!54765) (not d!54793) (not b!184488) (not d!54825) (not b!184338) (not b!184349) (not b!184391) (not b!184444) (not b!184447) (not b!184411) (not d!54801))
(check-sat b_and!11111 (not b_next!4543))
