; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17884 () Bool)

(assert start!17884)

(declare-fun b!178428 () Bool)

(declare-fun b_free!4405 () Bool)

(declare-fun b_next!4405 () Bool)

(assert (=> b!178428 (= b_free!4405 (not b_next!4405))))

(declare-fun tp!15928 () Bool)

(declare-fun b_and!10935 () Bool)

(assert (=> b!178428 (= tp!15928 b_and!10935)))

(declare-fun res!84531 () Bool)

(declare-fun e!117601 () Bool)

(assert (=> start!17884 (=> (not res!84531) (not e!117601))))

(declare-datatypes ((V!5217 0))(
  ( (V!5218 (val!2133 Int)) )
))
(declare-datatypes ((ValueCell!1745 0))(
  ( (ValueCellFull!1745 (v!4018 V!5217)) (EmptyCell!1745) )
))
(declare-datatypes ((array!7499 0))(
  ( (array!7500 (arr!3554 (Array (_ BitVec 32) (_ BitVec 64))) (size!3860 (_ BitVec 32))) )
))
(declare-datatypes ((array!7501 0))(
  ( (array!7502 (arr!3555 (Array (_ BitVec 32) ValueCell!1745)) (size!3861 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2398 0))(
  ( (LongMapFixedSize!2399 (defaultEntry!3668 Int) (mask!8628 (_ BitVec 32)) (extraKeys!3405 (_ BitVec 32)) (zeroValue!3509 V!5217) (minValue!3509 V!5217) (_size!1248 (_ BitVec 32)) (_keys!5545 array!7499) (_values!3651 array!7501) (_vacant!1248 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2398)

(declare-fun valid!1026 (LongMapFixedSize!2398) Bool)

(assert (=> start!17884 (= res!84531 (valid!1026 thiss!1248))))

(assert (=> start!17884 e!117601))

(declare-fun e!117606 () Bool)

(assert (=> start!17884 e!117606))

(assert (=> start!17884 true))

(declare-fun b!178424 () Bool)

(declare-fun res!84533 () Bool)

(assert (=> b!178424 (=> (not res!84533) (not e!117601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!178424 (= res!84533 (validMask!0 (mask!8628 thiss!1248)))))

(declare-fun b!178425 () Bool)

(declare-fun e!117604 () Bool)

(declare-fun tp_is_empty!4177 () Bool)

(assert (=> b!178425 (= e!117604 tp_is_empty!4177)))

(declare-fun mapNonEmpty!7142 () Bool)

(declare-fun mapRes!7142 () Bool)

(declare-fun tp!15929 () Bool)

(assert (=> mapNonEmpty!7142 (= mapRes!7142 (and tp!15929 e!117604))))

(declare-fun mapValue!7142 () ValueCell!1745)

(declare-fun mapKey!7142 () (_ BitVec 32))

(declare-fun mapRest!7142 () (Array (_ BitVec 32) ValueCell!1745))

(assert (=> mapNonEmpty!7142 (= (arr!3555 (_values!3651 thiss!1248)) (store mapRest!7142 mapKey!7142 mapValue!7142))))

(declare-fun b!178426 () Bool)

(declare-fun res!84532 () Bool)

(assert (=> b!178426 (=> (not res!84532) (not e!117601))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!572 0))(
  ( (MissingZero!572 (index!4456 (_ BitVec 32))) (Found!572 (index!4457 (_ BitVec 32))) (Intermediate!572 (undefined!1384 Bool) (index!4458 (_ BitVec 32)) (x!19540 (_ BitVec 32))) (Undefined!572) (MissingVacant!572 (index!4459 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7499 (_ BitVec 32)) SeekEntryResult!572)

(assert (=> b!178426 (= res!84532 ((_ is Undefined!572) (seekEntryOrOpen!0 key!828 (_keys!5545 thiss!1248) (mask!8628 thiss!1248))))))

(declare-fun b!178427 () Bool)

(declare-fun e!117602 () Bool)

(declare-fun e!117603 () Bool)

(assert (=> b!178427 (= e!117602 (and e!117603 mapRes!7142))))

(declare-fun condMapEmpty!7142 () Bool)

(declare-fun mapDefault!7142 () ValueCell!1745)

(assert (=> b!178427 (= condMapEmpty!7142 (= (arr!3555 (_values!3651 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1745)) mapDefault!7142)))))

(declare-fun array_inv!2299 (array!7499) Bool)

(declare-fun array_inv!2300 (array!7501) Bool)

(assert (=> b!178428 (= e!117606 (and tp!15928 tp_is_empty!4177 (array_inv!2299 (_keys!5545 thiss!1248)) (array_inv!2300 (_values!3651 thiss!1248)) e!117602))))

(declare-fun b!178429 () Bool)

(declare-fun res!84530 () Bool)

(assert (=> b!178429 (=> (not res!84530) (not e!117601))))

(assert (=> b!178429 (= res!84530 (not (= key!828 (bvneg key!828))))))

(declare-fun b!178430 () Bool)

(assert (=> b!178430 (= e!117601 (and (= (size!3861 (_values!3651 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8628 thiss!1248))) (= (size!3860 (_keys!5545 thiss!1248)) (size!3861 (_values!3651 thiss!1248))) (bvsge (mask!8628 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3405 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!178431 () Bool)

(assert (=> b!178431 (= e!117603 tp_is_empty!4177)))

(declare-fun b!178432 () Bool)

(declare-fun res!84534 () Bool)

(assert (=> b!178432 (=> (not res!84534) (not e!117601))))

(declare-datatypes ((tuple2!3274 0))(
  ( (tuple2!3275 (_1!1648 (_ BitVec 64)) (_2!1648 V!5217)) )
))
(declare-datatypes ((List!2240 0))(
  ( (Nil!2237) (Cons!2236 (h!2859 tuple2!3274) (t!7070 List!2240)) )
))
(declare-datatypes ((ListLongMap!2207 0))(
  ( (ListLongMap!2208 (toList!1119 List!2240)) )
))
(declare-fun contains!1200 (ListLongMap!2207 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!774 (array!7499 array!7501 (_ BitVec 32) (_ BitVec 32) V!5217 V!5217 (_ BitVec 32) Int) ListLongMap!2207)

(assert (=> b!178432 (= res!84534 (not (contains!1200 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!7142 () Bool)

(assert (=> mapIsEmpty!7142 mapRes!7142))

(assert (= (and start!17884 res!84531) b!178429))

(assert (= (and b!178429 res!84530) b!178426))

(assert (= (and b!178426 res!84532) b!178432))

(assert (= (and b!178432 res!84534) b!178424))

(assert (= (and b!178424 res!84533) b!178430))

(assert (= (and b!178427 condMapEmpty!7142) mapIsEmpty!7142))

(assert (= (and b!178427 (not condMapEmpty!7142)) mapNonEmpty!7142))

(assert (= (and mapNonEmpty!7142 ((_ is ValueCellFull!1745) mapValue!7142)) b!178425))

(assert (= (and b!178427 ((_ is ValueCellFull!1745) mapDefault!7142)) b!178431))

(assert (= b!178428 b!178427))

(assert (= start!17884 b!178428))

(declare-fun m!206963 () Bool)

(assert (=> b!178432 m!206963))

(assert (=> b!178432 m!206963))

(declare-fun m!206965 () Bool)

(assert (=> b!178432 m!206965))

(declare-fun m!206967 () Bool)

(assert (=> b!178426 m!206967))

(declare-fun m!206969 () Bool)

(assert (=> b!178428 m!206969))

(declare-fun m!206971 () Bool)

(assert (=> b!178428 m!206971))

(declare-fun m!206973 () Bool)

(assert (=> b!178424 m!206973))

(declare-fun m!206975 () Bool)

(assert (=> start!17884 m!206975))

(declare-fun m!206977 () Bool)

(assert (=> mapNonEmpty!7142 m!206977))

(check-sat (not start!17884) (not b!178432) b_and!10935 (not b!178426) tp_is_empty!4177 (not mapNonEmpty!7142) (not b!178428) (not b_next!4405) (not b!178424))
(check-sat b_and!10935 (not b_next!4405))
(get-model)

(declare-fun d!54019 () Bool)

(assert (=> d!54019 (= (array_inv!2299 (_keys!5545 thiss!1248)) (bvsge (size!3860 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178428 d!54019))

(declare-fun d!54021 () Bool)

(assert (=> d!54021 (= (array_inv!2300 (_values!3651 thiss!1248)) (bvsge (size!3861 (_values!3651 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178428 d!54021))

(declare-fun d!54023 () Bool)

(assert (=> d!54023 (= (validMask!0 (mask!8628 thiss!1248)) (and (or (= (mask!8628 thiss!1248) #b00000000000000000000000000000111) (= (mask!8628 thiss!1248) #b00000000000000000000000000001111) (= (mask!8628 thiss!1248) #b00000000000000000000000000011111) (= (mask!8628 thiss!1248) #b00000000000000000000000000111111) (= (mask!8628 thiss!1248) #b00000000000000000000000001111111) (= (mask!8628 thiss!1248) #b00000000000000000000000011111111) (= (mask!8628 thiss!1248) #b00000000000000000000000111111111) (= (mask!8628 thiss!1248) #b00000000000000000000001111111111) (= (mask!8628 thiss!1248) #b00000000000000000000011111111111) (= (mask!8628 thiss!1248) #b00000000000000000000111111111111) (= (mask!8628 thiss!1248) #b00000000000000000001111111111111) (= (mask!8628 thiss!1248) #b00000000000000000011111111111111) (= (mask!8628 thiss!1248) #b00000000000000000111111111111111) (= (mask!8628 thiss!1248) #b00000000000000001111111111111111) (= (mask!8628 thiss!1248) #b00000000000000011111111111111111) (= (mask!8628 thiss!1248) #b00000000000000111111111111111111) (= (mask!8628 thiss!1248) #b00000000000001111111111111111111) (= (mask!8628 thiss!1248) #b00000000000011111111111111111111) (= (mask!8628 thiss!1248) #b00000000000111111111111111111111) (= (mask!8628 thiss!1248) #b00000000001111111111111111111111) (= (mask!8628 thiss!1248) #b00000000011111111111111111111111) (= (mask!8628 thiss!1248) #b00000000111111111111111111111111) (= (mask!8628 thiss!1248) #b00000001111111111111111111111111) (= (mask!8628 thiss!1248) #b00000011111111111111111111111111) (= (mask!8628 thiss!1248) #b00000111111111111111111111111111) (= (mask!8628 thiss!1248) #b00001111111111111111111111111111) (= (mask!8628 thiss!1248) #b00011111111111111111111111111111) (= (mask!8628 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8628 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!178424 d!54023))

(declare-fun d!54025 () Bool)

(declare-fun lt!88221 () SeekEntryResult!572)

(assert (=> d!54025 (and (or ((_ is Undefined!572) lt!88221) (not ((_ is Found!572) lt!88221)) (and (bvsge (index!4457 lt!88221) #b00000000000000000000000000000000) (bvslt (index!4457 lt!88221) (size!3860 (_keys!5545 thiss!1248))))) (or ((_ is Undefined!572) lt!88221) ((_ is Found!572) lt!88221) (not ((_ is MissingZero!572) lt!88221)) (and (bvsge (index!4456 lt!88221) #b00000000000000000000000000000000) (bvslt (index!4456 lt!88221) (size!3860 (_keys!5545 thiss!1248))))) (or ((_ is Undefined!572) lt!88221) ((_ is Found!572) lt!88221) ((_ is MissingZero!572) lt!88221) (not ((_ is MissingVacant!572) lt!88221)) (and (bvsge (index!4459 lt!88221) #b00000000000000000000000000000000) (bvslt (index!4459 lt!88221) (size!3860 (_keys!5545 thiss!1248))))) (or ((_ is Undefined!572) lt!88221) (ite ((_ is Found!572) lt!88221) (= (select (arr!3554 (_keys!5545 thiss!1248)) (index!4457 lt!88221)) key!828) (ite ((_ is MissingZero!572) lt!88221) (= (select (arr!3554 (_keys!5545 thiss!1248)) (index!4456 lt!88221)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!572) lt!88221) (= (select (arr!3554 (_keys!5545 thiss!1248)) (index!4459 lt!88221)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!117650 () SeekEntryResult!572)

(assert (=> d!54025 (= lt!88221 e!117650)))

(declare-fun c!31983 () Bool)

(declare-fun lt!88220 () SeekEntryResult!572)

(assert (=> d!54025 (= c!31983 (and ((_ is Intermediate!572) lt!88220) (undefined!1384 lt!88220)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7499 (_ BitVec 32)) SeekEntryResult!572)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54025 (= lt!88220 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8628 thiss!1248)) key!828 (_keys!5545 thiss!1248) (mask!8628 thiss!1248)))))

(assert (=> d!54025 (validMask!0 (mask!8628 thiss!1248))))

(assert (=> d!54025 (= (seekEntryOrOpen!0 key!828 (_keys!5545 thiss!1248) (mask!8628 thiss!1248)) lt!88221)))

(declare-fun b!178499 () Bool)

(declare-fun e!117651 () SeekEntryResult!572)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7499 (_ BitVec 32)) SeekEntryResult!572)

(assert (=> b!178499 (= e!117651 (seekKeyOrZeroReturnVacant!0 (x!19540 lt!88220) (index!4458 lt!88220) (index!4458 lt!88220) key!828 (_keys!5545 thiss!1248) (mask!8628 thiss!1248)))))

(declare-fun b!178500 () Bool)

(assert (=> b!178500 (= e!117651 (MissingZero!572 (index!4458 lt!88220)))))

(declare-fun b!178501 () Bool)

(assert (=> b!178501 (= e!117650 Undefined!572)))

(declare-fun b!178502 () Bool)

(declare-fun e!117649 () SeekEntryResult!572)

(assert (=> b!178502 (= e!117650 e!117649)))

(declare-fun lt!88219 () (_ BitVec 64))

(assert (=> b!178502 (= lt!88219 (select (arr!3554 (_keys!5545 thiss!1248)) (index!4458 lt!88220)))))

(declare-fun c!31984 () Bool)

(assert (=> b!178502 (= c!31984 (= lt!88219 key!828))))

(declare-fun b!178503 () Bool)

(assert (=> b!178503 (= e!117649 (Found!572 (index!4458 lt!88220)))))

(declare-fun b!178504 () Bool)

(declare-fun c!31982 () Bool)

(assert (=> b!178504 (= c!31982 (= lt!88219 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178504 (= e!117649 e!117651)))

(assert (= (and d!54025 c!31983) b!178501))

(assert (= (and d!54025 (not c!31983)) b!178502))

(assert (= (and b!178502 c!31984) b!178503))

(assert (= (and b!178502 (not c!31984)) b!178504))

(assert (= (and b!178504 c!31982) b!178500))

(assert (= (and b!178504 (not c!31982)) b!178499))

(declare-fun m!207011 () Bool)

(assert (=> d!54025 m!207011))

(declare-fun m!207013 () Bool)

(assert (=> d!54025 m!207013))

(assert (=> d!54025 m!206973))

(declare-fun m!207015 () Bool)

(assert (=> d!54025 m!207015))

(declare-fun m!207017 () Bool)

(assert (=> d!54025 m!207017))

(assert (=> d!54025 m!207011))

(declare-fun m!207019 () Bool)

(assert (=> d!54025 m!207019))

(declare-fun m!207021 () Bool)

(assert (=> b!178499 m!207021))

(declare-fun m!207023 () Bool)

(assert (=> b!178502 m!207023))

(assert (=> b!178426 d!54025))

(declare-fun d!54027 () Bool)

(declare-fun res!84571 () Bool)

(declare-fun e!117654 () Bool)

(assert (=> d!54027 (=> (not res!84571) (not e!117654))))

(declare-fun simpleValid!158 (LongMapFixedSize!2398) Bool)

(assert (=> d!54027 (= res!84571 (simpleValid!158 thiss!1248))))

(assert (=> d!54027 (= (valid!1026 thiss!1248) e!117654)))

(declare-fun b!178511 () Bool)

(declare-fun res!84572 () Bool)

(assert (=> b!178511 (=> (not res!84572) (not e!117654))))

(declare-fun arrayCountValidKeys!0 (array!7499 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178511 (= res!84572 (= (arrayCountValidKeys!0 (_keys!5545 thiss!1248) #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))) (_size!1248 thiss!1248)))))

(declare-fun b!178512 () Bool)

(declare-fun res!84573 () Bool)

(assert (=> b!178512 (=> (not res!84573) (not e!117654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7499 (_ BitVec 32)) Bool)

(assert (=> b!178512 (= res!84573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5545 thiss!1248) (mask!8628 thiss!1248)))))

(declare-fun b!178513 () Bool)

(declare-datatypes ((List!2242 0))(
  ( (Nil!2239) (Cons!2238 (h!2861 (_ BitVec 64)) (t!7074 List!2242)) )
))
(declare-fun arrayNoDuplicates!0 (array!7499 (_ BitVec 32) List!2242) Bool)

(assert (=> b!178513 (= e!117654 (arrayNoDuplicates!0 (_keys!5545 thiss!1248) #b00000000000000000000000000000000 Nil!2239))))

(assert (= (and d!54027 res!84571) b!178511))

(assert (= (and b!178511 res!84572) b!178512))

(assert (= (and b!178512 res!84573) b!178513))

(declare-fun m!207025 () Bool)

(assert (=> d!54027 m!207025))

(declare-fun m!207027 () Bool)

(assert (=> b!178511 m!207027))

(declare-fun m!207029 () Bool)

(assert (=> b!178512 m!207029))

(declare-fun m!207031 () Bool)

(assert (=> b!178513 m!207031))

(assert (=> start!17884 d!54027))

(declare-fun d!54029 () Bool)

(declare-fun e!117660 () Bool)

(assert (=> d!54029 e!117660))

(declare-fun res!84576 () Bool)

(assert (=> d!54029 (=> res!84576 e!117660)))

(declare-fun lt!88232 () Bool)

(assert (=> d!54029 (= res!84576 (not lt!88232))))

(declare-fun lt!88233 () Bool)

(assert (=> d!54029 (= lt!88232 lt!88233)))

(declare-datatypes ((Unit!5443 0))(
  ( (Unit!5444) )
))
(declare-fun lt!88230 () Unit!5443)

(declare-fun e!117659 () Unit!5443)

(assert (=> d!54029 (= lt!88230 e!117659)))

(declare-fun c!31987 () Bool)

(assert (=> d!54029 (= c!31987 lt!88233)))

(declare-fun containsKey!203 (List!2240 (_ BitVec 64)) Bool)

(assert (=> d!54029 (= lt!88233 (containsKey!203 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828))))

(assert (=> d!54029 (= (contains!1200 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)) key!828) lt!88232)))

(declare-fun b!178520 () Bool)

(declare-fun lt!88231 () Unit!5443)

(assert (=> b!178520 (= e!117659 lt!88231)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!151 (List!2240 (_ BitVec 64)) Unit!5443)

(assert (=> b!178520 (= lt!88231 (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828))))

(declare-datatypes ((Option!206 0))(
  ( (Some!205 (v!4021 V!5217)) (None!204) )
))
(declare-fun isDefined!152 (Option!206) Bool)

(declare-fun getValueByKey!200 (List!2240 (_ BitVec 64)) Option!206)

(assert (=> b!178520 (isDefined!152 (getValueByKey!200 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828))))

(declare-fun b!178521 () Bool)

(declare-fun Unit!5445 () Unit!5443)

(assert (=> b!178521 (= e!117659 Unit!5445)))

(declare-fun b!178522 () Bool)

(assert (=> b!178522 (= e!117660 (isDefined!152 (getValueByKey!200 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828)))))

(assert (= (and d!54029 c!31987) b!178520))

(assert (= (and d!54029 (not c!31987)) b!178521))

(assert (= (and d!54029 (not res!84576)) b!178522))

(declare-fun m!207033 () Bool)

(assert (=> d!54029 m!207033))

(declare-fun m!207035 () Bool)

(assert (=> b!178520 m!207035))

(declare-fun m!207037 () Bool)

(assert (=> b!178520 m!207037))

(assert (=> b!178520 m!207037))

(declare-fun m!207039 () Bool)

(assert (=> b!178520 m!207039))

(assert (=> b!178522 m!207037))

(assert (=> b!178522 m!207037))

(assert (=> b!178522 m!207039))

(assert (=> b!178432 d!54029))

(declare-fun b!178565 () Bool)

(declare-fun e!117697 () Bool)

(declare-fun e!117687 () Bool)

(assert (=> b!178565 (= e!117697 e!117687)))

(declare-fun res!84596 () Bool)

(declare-fun call!18037 () Bool)

(assert (=> b!178565 (= res!84596 call!18037)))

(assert (=> b!178565 (=> (not res!84596) (not e!117687))))

(declare-fun call!18040 () ListLongMap!2207)

(declare-fun c!32004 () Bool)

(declare-fun call!18039 () ListLongMap!2207)

(declare-fun call!18038 () ListLongMap!2207)

(declare-fun c!32001 () Bool)

(declare-fun call!18035 () ListLongMap!2207)

(declare-fun bm!18031 () Bool)

(declare-fun +!261 (ListLongMap!2207 tuple2!3274) ListLongMap!2207)

(assert (=> bm!18031 (= call!18035 (+!261 (ite c!32004 call!18040 (ite c!32001 call!18038 call!18039)) (ite (or c!32004 c!32001) (tuple2!3275 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))))))

(declare-fun b!178566 () Bool)

(declare-fun e!117690 () Bool)

(declare-fun call!18036 () Bool)

(assert (=> b!178566 (= e!117690 (not call!18036))))

(declare-fun b!178567 () Bool)

(declare-fun res!84600 () Bool)

(declare-fun e!117699 () Bool)

(assert (=> b!178567 (=> (not res!84600) (not e!117699))))

(declare-fun e!117692 () Bool)

(assert (=> b!178567 (= res!84600 e!117692)))

(declare-fun res!84597 () Bool)

(assert (=> b!178567 (=> res!84597 e!117692)))

(declare-fun e!117688 () Bool)

(assert (=> b!178567 (= res!84597 (not e!117688))))

(declare-fun res!84595 () Bool)

(assert (=> b!178567 (=> (not res!84595) (not e!117688))))

(assert (=> b!178567 (= res!84595 (bvslt #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))))))

(declare-fun b!178568 () Bool)

(declare-fun e!117693 () ListLongMap!2207)

(assert (=> b!178568 (= e!117693 (+!261 call!18035 (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))))

(declare-fun b!178569 () Bool)

(declare-fun e!117698 () Bool)

(declare-fun lt!88299 () ListLongMap!2207)

(declare-fun apply!144 (ListLongMap!2207 (_ BitVec 64)) V!5217)

(declare-fun get!2041 (ValueCell!1745 V!5217) V!5217)

(declare-fun dynLambda!487 (Int (_ BitVec 64)) V!5217)

(assert (=> b!178569 (= e!117698 (= (apply!144 lt!88299 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)) (get!2041 (select (arr!3555 (_values!3651 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3668 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!178569 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3861 (_values!3651 thiss!1248))))))

(assert (=> b!178569 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))))))

(declare-fun b!178570 () Bool)

(declare-fun e!117694 () ListLongMap!2207)

(assert (=> b!178570 (= e!117693 e!117694)))

(assert (=> b!178570 (= c!32001 (and (not (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!178571 () Bool)

(declare-fun e!117689 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!178571 (= e!117689 (validKeyInArray!0 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18032 () Bool)

(declare-fun call!18034 () ListLongMap!2207)

(assert (=> bm!18032 (= call!18034 call!18035)))

(declare-fun b!178572 () Bool)

(declare-fun res!84603 () Bool)

(assert (=> b!178572 (=> (not res!84603) (not e!117699))))

(assert (=> b!178572 (= res!84603 e!117690)))

(declare-fun c!32000 () Bool)

(assert (=> b!178572 (= c!32000 (not (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!178573 () Bool)

(declare-fun c!32002 () Bool)

(assert (=> b!178573 (= c!32002 (and (not (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!117691 () ListLongMap!2207)

(assert (=> b!178573 (= e!117694 e!117691)))

(declare-fun b!178574 () Bool)

(assert (=> b!178574 (= e!117694 call!18034)))

(declare-fun b!178575 () Bool)

(assert (=> b!178575 (= e!117688 (validKeyInArray!0 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178576 () Bool)

(declare-fun e!117696 () Unit!5443)

(declare-fun Unit!5446 () Unit!5443)

(assert (=> b!178576 (= e!117696 Unit!5446)))

(declare-fun b!178577 () Bool)

(assert (=> b!178577 (= e!117691 call!18034)))

(declare-fun b!178578 () Bool)

(assert (=> b!178578 (= e!117692 e!117698)))

(declare-fun res!84598 () Bool)

(assert (=> b!178578 (=> (not res!84598) (not e!117698))))

(assert (=> b!178578 (= res!84598 (contains!1200 lt!88299 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178578 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))))))

(declare-fun bm!18033 () Bool)

(assert (=> bm!18033 (= call!18036 (contains!1200 lt!88299 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178580 () Bool)

(declare-fun e!117695 () Bool)

(assert (=> b!178580 (= e!117690 e!117695)))

(declare-fun res!84599 () Bool)

(assert (=> b!178580 (= res!84599 call!18036)))

(assert (=> b!178580 (=> (not res!84599) (not e!117695))))

(declare-fun b!178579 () Bool)

(assert (=> b!178579 (= e!117691 call!18039)))

(declare-fun d!54031 () Bool)

(assert (=> d!54031 e!117699))

(declare-fun res!84601 () Bool)

(assert (=> d!54031 (=> (not res!84601) (not e!117699))))

(assert (=> d!54031 (= res!84601 (or (bvsge #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))))))))

(declare-fun lt!88288 () ListLongMap!2207)

(assert (=> d!54031 (= lt!88299 lt!88288)))

(declare-fun lt!88285 () Unit!5443)

(assert (=> d!54031 (= lt!88285 e!117696)))

(declare-fun c!32003 () Bool)

(assert (=> d!54031 (= c!32003 e!117689)))

(declare-fun res!84602 () Bool)

(assert (=> d!54031 (=> (not res!84602) (not e!117689))))

(assert (=> d!54031 (= res!84602 (bvslt #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))))))

(assert (=> d!54031 (= lt!88288 e!117693)))

(assert (=> d!54031 (= c!32004 (and (not (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54031 (validMask!0 (mask!8628 thiss!1248))))

(assert (=> d!54031 (= (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)) lt!88299)))

(declare-fun b!178581 () Bool)

(declare-fun lt!88279 () Unit!5443)

(assert (=> b!178581 (= e!117696 lt!88279)))

(declare-fun lt!88294 () ListLongMap!2207)

(declare-fun getCurrentListMapNoExtraKeys!175 (array!7499 array!7501 (_ BitVec 32) (_ BitVec 32) V!5217 V!5217 (_ BitVec 32) Int) ListLongMap!2207)

(assert (=> b!178581 (= lt!88294 (getCurrentListMapNoExtraKeys!175 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))))

(declare-fun lt!88298 () (_ BitVec 64))

(assert (=> b!178581 (= lt!88298 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88284 () (_ BitVec 64))

(assert (=> b!178581 (= lt!88284 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88281 () Unit!5443)

(declare-fun addStillContains!120 (ListLongMap!2207 (_ BitVec 64) V!5217 (_ BitVec 64)) Unit!5443)

(assert (=> b!178581 (= lt!88281 (addStillContains!120 lt!88294 lt!88298 (zeroValue!3509 thiss!1248) lt!88284))))

(assert (=> b!178581 (contains!1200 (+!261 lt!88294 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248))) lt!88284)))

(declare-fun lt!88296 () Unit!5443)

(assert (=> b!178581 (= lt!88296 lt!88281)))

(declare-fun lt!88278 () ListLongMap!2207)

(assert (=> b!178581 (= lt!88278 (getCurrentListMapNoExtraKeys!175 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))))

(declare-fun lt!88287 () (_ BitVec 64))

(assert (=> b!178581 (= lt!88287 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88280 () (_ BitVec 64))

(assert (=> b!178581 (= lt!88280 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88291 () Unit!5443)

(declare-fun addApplyDifferent!120 (ListLongMap!2207 (_ BitVec 64) V!5217 (_ BitVec 64)) Unit!5443)

(assert (=> b!178581 (= lt!88291 (addApplyDifferent!120 lt!88278 lt!88287 (minValue!3509 thiss!1248) lt!88280))))

(assert (=> b!178581 (= (apply!144 (+!261 lt!88278 (tuple2!3275 lt!88287 (minValue!3509 thiss!1248))) lt!88280) (apply!144 lt!88278 lt!88280))))

(declare-fun lt!88289 () Unit!5443)

(assert (=> b!178581 (= lt!88289 lt!88291)))

(declare-fun lt!88283 () ListLongMap!2207)

(assert (=> b!178581 (= lt!88283 (getCurrentListMapNoExtraKeys!175 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))))

(declare-fun lt!88297 () (_ BitVec 64))

(assert (=> b!178581 (= lt!88297 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88286 () (_ BitVec 64))

(assert (=> b!178581 (= lt!88286 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88290 () Unit!5443)

(assert (=> b!178581 (= lt!88290 (addApplyDifferent!120 lt!88283 lt!88297 (zeroValue!3509 thiss!1248) lt!88286))))

(assert (=> b!178581 (= (apply!144 (+!261 lt!88283 (tuple2!3275 lt!88297 (zeroValue!3509 thiss!1248))) lt!88286) (apply!144 lt!88283 lt!88286))))

(declare-fun lt!88293 () Unit!5443)

(assert (=> b!178581 (= lt!88293 lt!88290)))

(declare-fun lt!88282 () ListLongMap!2207)

(assert (=> b!178581 (= lt!88282 (getCurrentListMapNoExtraKeys!175 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))))

(declare-fun lt!88295 () (_ BitVec 64))

(assert (=> b!178581 (= lt!88295 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88292 () (_ BitVec 64))

(assert (=> b!178581 (= lt!88292 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178581 (= lt!88279 (addApplyDifferent!120 lt!88282 lt!88295 (minValue!3509 thiss!1248) lt!88292))))

(assert (=> b!178581 (= (apply!144 (+!261 lt!88282 (tuple2!3275 lt!88295 (minValue!3509 thiss!1248))) lt!88292) (apply!144 lt!88282 lt!88292))))

(declare-fun b!178582 () Bool)

(assert (=> b!178582 (= e!117695 (= (apply!144 lt!88299 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3509 thiss!1248)))))

(declare-fun bm!18034 () Bool)

(assert (=> bm!18034 (= call!18039 call!18038)))

(declare-fun b!178583 () Bool)

(assert (=> b!178583 (= e!117697 (not call!18037))))

(declare-fun b!178584 () Bool)

(assert (=> b!178584 (= e!117699 e!117697)))

(declare-fun c!32005 () Bool)

(assert (=> b!178584 (= c!32005 (not (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18035 () Bool)

(assert (=> bm!18035 (= call!18038 call!18040)))

(declare-fun bm!18036 () Bool)

(assert (=> bm!18036 (= call!18040 (getCurrentListMapNoExtraKeys!175 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))))

(declare-fun bm!18037 () Bool)

(assert (=> bm!18037 (= call!18037 (contains!1200 lt!88299 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178585 () Bool)

(assert (=> b!178585 (= e!117687 (= (apply!144 lt!88299 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3509 thiss!1248)))))

(assert (= (and d!54031 c!32004) b!178568))

(assert (= (and d!54031 (not c!32004)) b!178570))

(assert (= (and b!178570 c!32001) b!178574))

(assert (= (and b!178570 (not c!32001)) b!178573))

(assert (= (and b!178573 c!32002) b!178577))

(assert (= (and b!178573 (not c!32002)) b!178579))

(assert (= (or b!178577 b!178579) bm!18034))

(assert (= (or b!178574 bm!18034) bm!18035))

(assert (= (or b!178574 b!178577) bm!18032))

(assert (= (or b!178568 bm!18035) bm!18036))

(assert (= (or b!178568 bm!18032) bm!18031))

(assert (= (and d!54031 res!84602) b!178571))

(assert (= (and d!54031 c!32003) b!178581))

(assert (= (and d!54031 (not c!32003)) b!178576))

(assert (= (and d!54031 res!84601) b!178567))

(assert (= (and b!178567 res!84595) b!178575))

(assert (= (and b!178567 (not res!84597)) b!178578))

(assert (= (and b!178578 res!84598) b!178569))

(assert (= (and b!178567 res!84600) b!178572))

(assert (= (and b!178572 c!32000) b!178580))

(assert (= (and b!178572 (not c!32000)) b!178566))

(assert (= (and b!178580 res!84599) b!178582))

(assert (= (or b!178580 b!178566) bm!18033))

(assert (= (and b!178572 res!84603) b!178584))

(assert (= (and b!178584 c!32005) b!178565))

(assert (= (and b!178584 (not c!32005)) b!178583))

(assert (= (and b!178565 res!84596) b!178585))

(assert (= (or b!178565 b!178583) bm!18037))

(declare-fun b_lambda!7105 () Bool)

(assert (=> (not b_lambda!7105) (not b!178569)))

(declare-fun t!7073 () Bool)

(declare-fun tb!2791 () Bool)

(assert (=> (and b!178428 (= (defaultEntry!3668 thiss!1248) (defaultEntry!3668 thiss!1248)) t!7073) tb!2791))

(declare-fun result!4663 () Bool)

(assert (=> tb!2791 (= result!4663 tp_is_empty!4177)))

(assert (=> b!178569 t!7073))

(declare-fun b_and!10941 () Bool)

(assert (= b_and!10935 (and (=> t!7073 result!4663) b_and!10941)))

(declare-fun m!207041 () Bool)

(assert (=> bm!18036 m!207041))

(declare-fun m!207043 () Bool)

(assert (=> b!178582 m!207043))

(declare-fun m!207045 () Bool)

(assert (=> b!178569 m!207045))

(assert (=> b!178569 m!207045))

(declare-fun m!207047 () Bool)

(assert (=> b!178569 m!207047))

(declare-fun m!207049 () Bool)

(assert (=> b!178569 m!207049))

(declare-fun m!207051 () Bool)

(assert (=> b!178569 m!207051))

(declare-fun m!207053 () Bool)

(assert (=> b!178569 m!207053))

(assert (=> b!178569 m!207049))

(assert (=> b!178569 m!207051))

(assert (=> b!178581 m!207045))

(declare-fun m!207055 () Bool)

(assert (=> b!178581 m!207055))

(declare-fun m!207057 () Bool)

(assert (=> b!178581 m!207057))

(declare-fun m!207059 () Bool)

(assert (=> b!178581 m!207059))

(assert (=> b!178581 m!207055))

(declare-fun m!207061 () Bool)

(assert (=> b!178581 m!207061))

(declare-fun m!207063 () Bool)

(assert (=> b!178581 m!207063))

(declare-fun m!207065 () Bool)

(assert (=> b!178581 m!207065))

(declare-fun m!207067 () Bool)

(assert (=> b!178581 m!207067))

(declare-fun m!207069 () Bool)

(assert (=> b!178581 m!207069))

(declare-fun m!207071 () Bool)

(assert (=> b!178581 m!207071))

(declare-fun m!207073 () Bool)

(assert (=> b!178581 m!207073))

(assert (=> b!178581 m!207041))

(declare-fun m!207075 () Bool)

(assert (=> b!178581 m!207075))

(declare-fun m!207077 () Bool)

(assert (=> b!178581 m!207077))

(assert (=> b!178581 m!207071))

(assert (=> b!178581 m!207063))

(declare-fun m!207079 () Bool)

(assert (=> b!178581 m!207079))

(declare-fun m!207081 () Bool)

(assert (=> b!178581 m!207081))

(assert (=> b!178581 m!207075))

(declare-fun m!207083 () Bool)

(assert (=> b!178581 m!207083))

(declare-fun m!207085 () Bool)

(assert (=> b!178568 m!207085))

(assert (=> b!178578 m!207045))

(assert (=> b!178578 m!207045))

(declare-fun m!207087 () Bool)

(assert (=> b!178578 m!207087))

(declare-fun m!207089 () Bool)

(assert (=> b!178585 m!207089))

(assert (=> d!54031 m!206973))

(assert (=> b!178575 m!207045))

(assert (=> b!178575 m!207045))

(declare-fun m!207091 () Bool)

(assert (=> b!178575 m!207091))

(declare-fun m!207093 () Bool)

(assert (=> bm!18037 m!207093))

(declare-fun m!207095 () Bool)

(assert (=> bm!18031 m!207095))

(declare-fun m!207097 () Bool)

(assert (=> bm!18033 m!207097))

(assert (=> b!178571 m!207045))

(assert (=> b!178571 m!207045))

(assert (=> b!178571 m!207091))

(assert (=> b!178432 d!54031))

(declare-fun b!178595 () Bool)

(declare-fun e!117705 () Bool)

(assert (=> b!178595 (= e!117705 tp_is_empty!4177)))

(declare-fun b!178594 () Bool)

(declare-fun e!117704 () Bool)

(assert (=> b!178594 (= e!117704 tp_is_empty!4177)))

(declare-fun mapIsEmpty!7151 () Bool)

(declare-fun mapRes!7151 () Bool)

(assert (=> mapIsEmpty!7151 mapRes!7151))

(declare-fun condMapEmpty!7151 () Bool)

(declare-fun mapDefault!7151 () ValueCell!1745)

(assert (=> mapNonEmpty!7142 (= condMapEmpty!7151 (= mapRest!7142 ((as const (Array (_ BitVec 32) ValueCell!1745)) mapDefault!7151)))))

(assert (=> mapNonEmpty!7142 (= tp!15929 (and e!117705 mapRes!7151))))

(declare-fun mapNonEmpty!7151 () Bool)

(declare-fun tp!15944 () Bool)

(assert (=> mapNonEmpty!7151 (= mapRes!7151 (and tp!15944 e!117704))))

(declare-fun mapKey!7151 () (_ BitVec 32))

(declare-fun mapRest!7151 () (Array (_ BitVec 32) ValueCell!1745))

(declare-fun mapValue!7151 () ValueCell!1745)

(assert (=> mapNonEmpty!7151 (= mapRest!7142 (store mapRest!7151 mapKey!7151 mapValue!7151))))

(assert (= (and mapNonEmpty!7142 condMapEmpty!7151) mapIsEmpty!7151))

(assert (= (and mapNonEmpty!7142 (not condMapEmpty!7151)) mapNonEmpty!7151))

(assert (= (and mapNonEmpty!7151 ((_ is ValueCellFull!1745) mapValue!7151)) b!178594))

(assert (= (and mapNonEmpty!7142 ((_ is ValueCellFull!1745) mapDefault!7151)) b!178595))

(declare-fun m!207099 () Bool)

(assert (=> mapNonEmpty!7151 m!207099))

(declare-fun b_lambda!7107 () Bool)

(assert (= b_lambda!7105 (or (and b!178428 b_free!4405) b_lambda!7107)))

(check-sat (not b!178520) (not b!178499) (not b!178511) (not b!178582) b_and!10941 (not b!178568) (not bm!18036) (not d!54031) (not mapNonEmpty!7151) (not b!178581) (not b!178569) (not d!54029) (not b!178575) (not b_lambda!7107) tp_is_empty!4177 (not b!178512) (not d!54025) (not b!178585) (not b!178522) (not b!178571) (not b!178578) (not b_next!4405) (not d!54027) (not bm!18031) (not bm!18033) (not b!178513) (not bm!18037))
(check-sat b_and!10941 (not b_next!4405))
(get-model)

(declare-fun b!178604 () Bool)

(declare-fun e!117714 () Bool)

(declare-fun e!117712 () Bool)

(assert (=> b!178604 (= e!117714 e!117712)))

(declare-fun c!32008 () Bool)

(assert (=> b!178604 (= c!32008 (validKeyInArray!0 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178605 () Bool)

(declare-fun e!117713 () Bool)

(declare-fun call!18043 () Bool)

(assert (=> b!178605 (= e!117713 call!18043)))

(declare-fun b!178606 () Bool)

(assert (=> b!178606 (= e!117712 e!117713)))

(declare-fun lt!88307 () (_ BitVec 64))

(assert (=> b!178606 (= lt!88307 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88308 () Unit!5443)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7499 (_ BitVec 64) (_ BitVec 32)) Unit!5443)

(assert (=> b!178606 (= lt!88308 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5545 thiss!1248) lt!88307 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!178606 (arrayContainsKey!0 (_keys!5545 thiss!1248) lt!88307 #b00000000000000000000000000000000)))

(declare-fun lt!88306 () Unit!5443)

(assert (=> b!178606 (= lt!88306 lt!88308)))

(declare-fun res!84609 () Bool)

(assert (=> b!178606 (= res!84609 (= (seekEntryOrOpen!0 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000) (_keys!5545 thiss!1248) (mask!8628 thiss!1248)) (Found!572 #b00000000000000000000000000000000)))))

(assert (=> b!178606 (=> (not res!84609) (not e!117713))))

(declare-fun bm!18040 () Bool)

(assert (=> bm!18040 (= call!18043 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5545 thiss!1248) (mask!8628 thiss!1248)))))

(declare-fun d!54033 () Bool)

(declare-fun res!84608 () Bool)

(assert (=> d!54033 (=> res!84608 e!117714)))

(assert (=> d!54033 (= res!84608 (bvsge #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))))))

(assert (=> d!54033 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5545 thiss!1248) (mask!8628 thiss!1248)) e!117714)))

(declare-fun b!178607 () Bool)

(assert (=> b!178607 (= e!117712 call!18043)))

(assert (= (and d!54033 (not res!84608)) b!178604))

(assert (= (and b!178604 c!32008) b!178606))

(assert (= (and b!178604 (not c!32008)) b!178607))

(assert (= (and b!178606 res!84609) b!178605))

(assert (= (or b!178605 b!178607) bm!18040))

(assert (=> b!178604 m!207045))

(assert (=> b!178604 m!207045))

(assert (=> b!178604 m!207091))

(assert (=> b!178606 m!207045))

(declare-fun m!207101 () Bool)

(assert (=> b!178606 m!207101))

(declare-fun m!207103 () Bool)

(assert (=> b!178606 m!207103))

(assert (=> b!178606 m!207045))

(declare-fun m!207105 () Bool)

(assert (=> b!178606 m!207105))

(declare-fun m!207107 () Bool)

(assert (=> bm!18040 m!207107))

(assert (=> b!178512 d!54033))

(declare-fun d!54035 () Bool)

(declare-fun res!84614 () Bool)

(declare-fun e!117719 () Bool)

(assert (=> d!54035 (=> res!84614 e!117719)))

(assert (=> d!54035 (= res!84614 (and ((_ is Cons!2236) (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))) (= (_1!1648 (h!2859 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))))) key!828)))))

(assert (=> d!54035 (= (containsKey!203 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828) e!117719)))

(declare-fun b!178612 () Bool)

(declare-fun e!117720 () Bool)

(assert (=> b!178612 (= e!117719 e!117720)))

(declare-fun res!84615 () Bool)

(assert (=> b!178612 (=> (not res!84615) (not e!117720))))

(assert (=> b!178612 (= res!84615 (and (or (not ((_ is Cons!2236) (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))))) (bvsle (_1!1648 (h!2859 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))))) key!828)) ((_ is Cons!2236) (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))) (bvslt (_1!1648 (h!2859 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))))) key!828)))))

(declare-fun b!178613 () Bool)

(assert (=> b!178613 (= e!117720 (containsKey!203 (t!7070 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))) key!828))))

(assert (= (and d!54035 (not res!84614)) b!178612))

(assert (= (and b!178612 res!84615) b!178613))

(declare-fun m!207109 () Bool)

(assert (=> b!178613 m!207109))

(assert (=> d!54029 d!54035))

(declare-fun d!54037 () Bool)

(assert (=> d!54037 (= (validKeyInArray!0 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!178575 d!54037))

(declare-fun d!54039 () Bool)

(declare-fun e!117723 () Bool)

(assert (=> d!54039 e!117723))

(declare-fun res!84620 () Bool)

(assert (=> d!54039 (=> (not res!84620) (not e!117723))))

(declare-fun lt!88317 () ListLongMap!2207)

(assert (=> d!54039 (= res!84620 (contains!1200 lt!88317 (_1!1648 (ite (or c!32004 c!32001) (tuple2!3275 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))))))

(declare-fun lt!88319 () List!2240)

(assert (=> d!54039 (= lt!88317 (ListLongMap!2208 lt!88319))))

(declare-fun lt!88318 () Unit!5443)

(declare-fun lt!88320 () Unit!5443)

(assert (=> d!54039 (= lt!88318 lt!88320)))

(assert (=> d!54039 (= (getValueByKey!200 lt!88319 (_1!1648 (ite (or c!32004 c!32001) (tuple2!3275 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))) (Some!205 (_2!1648 (ite (or c!32004 c!32001) (tuple2!3275 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!106 (List!2240 (_ BitVec 64) V!5217) Unit!5443)

(assert (=> d!54039 (= lt!88320 (lemmaContainsTupThenGetReturnValue!106 lt!88319 (_1!1648 (ite (or c!32004 c!32001) (tuple2!3275 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))) (_2!1648 (ite (or c!32004 c!32001) (tuple2!3275 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))))))

(declare-fun insertStrictlySorted!109 (List!2240 (_ BitVec 64) V!5217) List!2240)

(assert (=> d!54039 (= lt!88319 (insertStrictlySorted!109 (toList!1119 (ite c!32004 call!18040 (ite c!32001 call!18038 call!18039))) (_1!1648 (ite (or c!32004 c!32001) (tuple2!3275 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))) (_2!1648 (ite (or c!32004 c!32001) (tuple2!3275 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))))))

(assert (=> d!54039 (= (+!261 (ite c!32004 call!18040 (ite c!32001 call!18038 call!18039)) (ite (or c!32004 c!32001) (tuple2!3275 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))) lt!88317)))

(declare-fun b!178618 () Bool)

(declare-fun res!84621 () Bool)

(assert (=> b!178618 (=> (not res!84621) (not e!117723))))

(assert (=> b!178618 (= res!84621 (= (getValueByKey!200 (toList!1119 lt!88317) (_1!1648 (ite (or c!32004 c!32001) (tuple2!3275 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))) (Some!205 (_2!1648 (ite (or c!32004 c!32001) (tuple2!3275 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))))))))

(declare-fun b!178619 () Bool)

(declare-fun contains!1202 (List!2240 tuple2!3274) Bool)

(assert (=> b!178619 (= e!117723 (contains!1202 (toList!1119 lt!88317) (ite (or c!32004 c!32001) (tuple2!3275 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))))))

(assert (= (and d!54039 res!84620) b!178618))

(assert (= (and b!178618 res!84621) b!178619))

(declare-fun m!207111 () Bool)

(assert (=> d!54039 m!207111))

(declare-fun m!207113 () Bool)

(assert (=> d!54039 m!207113))

(declare-fun m!207115 () Bool)

(assert (=> d!54039 m!207115))

(declare-fun m!207117 () Bool)

(assert (=> d!54039 m!207117))

(declare-fun m!207119 () Bool)

(assert (=> b!178618 m!207119))

(declare-fun m!207121 () Bool)

(assert (=> b!178619 m!207121))

(assert (=> bm!18031 d!54039))

(declare-fun b!178629 () Bool)

(declare-fun res!84632 () Bool)

(declare-fun e!117726 () Bool)

(assert (=> b!178629 (=> (not res!84632) (not e!117726))))

(declare-fun size!3866 (LongMapFixedSize!2398) (_ BitVec 32))

(assert (=> b!178629 (= res!84632 (bvsge (size!3866 thiss!1248) (_size!1248 thiss!1248)))))

(declare-fun b!178630 () Bool)

(declare-fun res!84631 () Bool)

(assert (=> b!178630 (=> (not res!84631) (not e!117726))))

(assert (=> b!178630 (= res!84631 (= (size!3866 thiss!1248) (bvadd (_size!1248 thiss!1248) (bvsdiv (bvadd (extraKeys!3405 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!54041 () Bool)

(declare-fun res!84630 () Bool)

(assert (=> d!54041 (=> (not res!84630) (not e!117726))))

(assert (=> d!54041 (= res!84630 (validMask!0 (mask!8628 thiss!1248)))))

(assert (=> d!54041 (= (simpleValid!158 thiss!1248) e!117726)))

(declare-fun b!178628 () Bool)

(declare-fun res!84633 () Bool)

(assert (=> b!178628 (=> (not res!84633) (not e!117726))))

(assert (=> b!178628 (= res!84633 (and (= (size!3861 (_values!3651 thiss!1248)) (bvadd (mask!8628 thiss!1248) #b00000000000000000000000000000001)) (= (size!3860 (_keys!5545 thiss!1248)) (size!3861 (_values!3651 thiss!1248))) (bvsge (_size!1248 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1248 thiss!1248) (bvadd (mask!8628 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!178631 () Bool)

(assert (=> b!178631 (= e!117726 (and (bvsge (extraKeys!3405 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3405 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1248 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!54041 res!84630) b!178628))

(assert (= (and b!178628 res!84633) b!178629))

(assert (= (and b!178629 res!84632) b!178630))

(assert (= (and b!178630 res!84631) b!178631))

(declare-fun m!207123 () Bool)

(assert (=> b!178629 m!207123))

(assert (=> b!178630 m!207123))

(assert (=> d!54041 m!206973))

(assert (=> d!54027 d!54041))

(declare-fun b!178644 () Bool)

(declare-fun c!32015 () Bool)

(declare-fun lt!88325 () (_ BitVec 64))

(assert (=> b!178644 (= c!32015 (= lt!88325 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!117734 () SeekEntryResult!572)

(declare-fun e!117735 () SeekEntryResult!572)

(assert (=> b!178644 (= e!117734 e!117735)))

(declare-fun d!54043 () Bool)

(declare-fun lt!88326 () SeekEntryResult!572)

(assert (=> d!54043 (and (or ((_ is Undefined!572) lt!88326) (not ((_ is Found!572) lt!88326)) (and (bvsge (index!4457 lt!88326) #b00000000000000000000000000000000) (bvslt (index!4457 lt!88326) (size!3860 (_keys!5545 thiss!1248))))) (or ((_ is Undefined!572) lt!88326) ((_ is Found!572) lt!88326) (not ((_ is MissingVacant!572) lt!88326)) (not (= (index!4459 lt!88326) (index!4458 lt!88220))) (and (bvsge (index!4459 lt!88326) #b00000000000000000000000000000000) (bvslt (index!4459 lt!88326) (size!3860 (_keys!5545 thiss!1248))))) (or ((_ is Undefined!572) lt!88326) (ite ((_ is Found!572) lt!88326) (= (select (arr!3554 (_keys!5545 thiss!1248)) (index!4457 lt!88326)) key!828) (and ((_ is MissingVacant!572) lt!88326) (= (index!4459 lt!88326) (index!4458 lt!88220)) (= (select (arr!3554 (_keys!5545 thiss!1248)) (index!4459 lt!88326)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!117733 () SeekEntryResult!572)

(assert (=> d!54043 (= lt!88326 e!117733)))

(declare-fun c!32017 () Bool)

(assert (=> d!54043 (= c!32017 (bvsge (x!19540 lt!88220) #b01111111111111111111111111111110))))

(assert (=> d!54043 (= lt!88325 (select (arr!3554 (_keys!5545 thiss!1248)) (index!4458 lt!88220)))))

(assert (=> d!54043 (validMask!0 (mask!8628 thiss!1248))))

(assert (=> d!54043 (= (seekKeyOrZeroReturnVacant!0 (x!19540 lt!88220) (index!4458 lt!88220) (index!4458 lt!88220) key!828 (_keys!5545 thiss!1248) (mask!8628 thiss!1248)) lt!88326)))

(declare-fun b!178645 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178645 (= e!117735 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19540 lt!88220) #b00000000000000000000000000000001) (nextIndex!0 (index!4458 lt!88220) (bvadd (x!19540 lt!88220) #b00000000000000000000000000000001) (mask!8628 thiss!1248)) (index!4458 lt!88220) key!828 (_keys!5545 thiss!1248) (mask!8628 thiss!1248)))))

(declare-fun b!178646 () Bool)

(assert (=> b!178646 (= e!117734 (Found!572 (index!4458 lt!88220)))))

(declare-fun b!178647 () Bool)

(assert (=> b!178647 (= e!117733 Undefined!572)))

(declare-fun b!178648 () Bool)

(assert (=> b!178648 (= e!117733 e!117734)))

(declare-fun c!32016 () Bool)

(assert (=> b!178648 (= c!32016 (= lt!88325 key!828))))

(declare-fun b!178649 () Bool)

(assert (=> b!178649 (= e!117735 (MissingVacant!572 (index!4458 lt!88220)))))

(assert (= (and d!54043 c!32017) b!178647))

(assert (= (and d!54043 (not c!32017)) b!178648))

(assert (= (and b!178648 c!32016) b!178646))

(assert (= (and b!178648 (not c!32016)) b!178644))

(assert (= (and b!178644 c!32015) b!178649))

(assert (= (and b!178644 (not c!32015)) b!178645))

(declare-fun m!207125 () Bool)

(assert (=> d!54043 m!207125))

(declare-fun m!207127 () Bool)

(assert (=> d!54043 m!207127))

(assert (=> d!54043 m!207023))

(assert (=> d!54043 m!206973))

(declare-fun m!207129 () Bool)

(assert (=> b!178645 m!207129))

(assert (=> b!178645 m!207129))

(declare-fun m!207131 () Bool)

(assert (=> b!178645 m!207131))

(assert (=> b!178499 d!54043))

(declare-fun b!178658 () Bool)

(declare-fun e!117740 () (_ BitVec 32))

(assert (=> b!178658 (= e!117740 #b00000000000000000000000000000000)))

(declare-fun bm!18043 () Bool)

(declare-fun call!18046 () (_ BitVec 32))

(assert (=> bm!18043 (= call!18046 (arrayCountValidKeys!0 (_keys!5545 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3860 (_keys!5545 thiss!1248))))))

(declare-fun b!178659 () Bool)

(declare-fun e!117741 () (_ BitVec 32))

(assert (=> b!178659 (= e!117741 call!18046)))

(declare-fun d!54045 () Bool)

(declare-fun lt!88329 () (_ BitVec 32))

(assert (=> d!54045 (and (bvsge lt!88329 #b00000000000000000000000000000000) (bvsle lt!88329 (bvsub (size!3860 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54045 (= lt!88329 e!117740)))

(declare-fun c!32022 () Bool)

(assert (=> d!54045 (= c!32022 (bvsge #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))))))

(assert (=> d!54045 (and (bvsle #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3860 (_keys!5545 thiss!1248)) (size!3860 (_keys!5545 thiss!1248))))))

(assert (=> d!54045 (= (arrayCountValidKeys!0 (_keys!5545 thiss!1248) #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))) lt!88329)))

(declare-fun b!178660 () Bool)

(assert (=> b!178660 (= e!117740 e!117741)))

(declare-fun c!32023 () Bool)

(assert (=> b!178660 (= c!32023 (validKeyInArray!0 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178661 () Bool)

(assert (=> b!178661 (= e!117741 (bvadd #b00000000000000000000000000000001 call!18046))))

(assert (= (and d!54045 c!32022) b!178658))

(assert (= (and d!54045 (not c!32022)) b!178660))

(assert (= (and b!178660 c!32023) b!178661))

(assert (= (and b!178660 (not c!32023)) b!178659))

(assert (= (or b!178661 b!178659) bm!18043))

(declare-fun m!207133 () Bool)

(assert (=> bm!18043 m!207133))

(assert (=> b!178660 m!207045))

(assert (=> b!178660 m!207045))

(assert (=> b!178660 m!207091))

(assert (=> b!178511 d!54045))

(declare-fun d!54047 () Bool)

(declare-fun get!2042 (Option!206) V!5217)

(assert (=> d!54047 (= (apply!144 lt!88299 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2042 (getValueByKey!200 (toList!1119 lt!88299) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7343 () Bool)

(assert (= bs!7343 d!54047))

(declare-fun m!207135 () Bool)

(assert (=> bs!7343 m!207135))

(assert (=> bs!7343 m!207135))

(declare-fun m!207137 () Bool)

(assert (=> bs!7343 m!207137))

(assert (=> b!178582 d!54047))

(declare-fun d!54049 () Bool)

(declare-fun isEmpty!457 (Option!206) Bool)

(assert (=> d!54049 (= (isDefined!152 (getValueByKey!200 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828)) (not (isEmpty!457 (getValueByKey!200 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828))))))

(declare-fun bs!7344 () Bool)

(assert (= bs!7344 d!54049))

(assert (=> bs!7344 m!207037))

(declare-fun m!207139 () Bool)

(assert (=> bs!7344 m!207139))

(assert (=> b!178522 d!54049))

(declare-fun b!178672 () Bool)

(declare-fun e!117747 () Option!206)

(assert (=> b!178672 (= e!117747 (getValueByKey!200 (t!7070 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))) key!828))))

(declare-fun b!178673 () Bool)

(assert (=> b!178673 (= e!117747 None!204)))

(declare-fun b!178671 () Bool)

(declare-fun e!117746 () Option!206)

(assert (=> b!178671 (= e!117746 e!117747)))

(declare-fun c!32029 () Bool)

(assert (=> b!178671 (= c!32029 (and ((_ is Cons!2236) (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))) (not (= (_1!1648 (h!2859 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))))) key!828))))))

(declare-fun d!54051 () Bool)

(declare-fun c!32028 () Bool)

(assert (=> d!54051 (= c!32028 (and ((_ is Cons!2236) (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))) (= (_1!1648 (h!2859 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))))) key!828)))))

(assert (=> d!54051 (= (getValueByKey!200 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828) e!117746)))

(declare-fun b!178670 () Bool)

(assert (=> b!178670 (= e!117746 (Some!205 (_2!1648 (h!2859 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))))))))

(assert (= (and d!54051 c!32028) b!178670))

(assert (= (and d!54051 (not c!32028)) b!178671))

(assert (= (and b!178671 c!32029) b!178672))

(assert (= (and b!178671 (not c!32029)) b!178673))

(declare-fun m!207141 () Bool)

(assert (=> b!178672 m!207141))

(assert (=> b!178522 d!54051))

(assert (=> b!178571 d!54037))

(declare-fun b!178692 () Bool)

(declare-fun e!117761 () SeekEntryResult!572)

(assert (=> b!178692 (= e!117761 (Intermediate!572 false (toIndex!0 key!828 (mask!8628 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!178693 () Bool)

(declare-fun lt!88334 () SeekEntryResult!572)

(assert (=> b!178693 (and (bvsge (index!4458 lt!88334) #b00000000000000000000000000000000) (bvslt (index!4458 lt!88334) (size!3860 (_keys!5545 thiss!1248))))))

(declare-fun e!117760 () Bool)

(assert (=> b!178693 (= e!117760 (= (select (arr!3554 (_keys!5545 thiss!1248)) (index!4458 lt!88334)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178694 () Bool)

(declare-fun e!117762 () SeekEntryResult!572)

(assert (=> b!178694 (= e!117762 e!117761)))

(declare-fun c!32038 () Bool)

(declare-fun lt!88335 () (_ BitVec 64))

(assert (=> b!178694 (= c!32038 (or (= lt!88335 key!828) (= (bvadd lt!88335 lt!88335) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!54053 () Bool)

(declare-fun e!117758 () Bool)

(assert (=> d!54053 e!117758))

(declare-fun c!32036 () Bool)

(assert (=> d!54053 (= c!32036 (and ((_ is Intermediate!572) lt!88334) (undefined!1384 lt!88334)))))

(assert (=> d!54053 (= lt!88334 e!117762)))

(declare-fun c!32037 () Bool)

(assert (=> d!54053 (= c!32037 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!54053 (= lt!88335 (select (arr!3554 (_keys!5545 thiss!1248)) (toIndex!0 key!828 (mask!8628 thiss!1248))))))

(assert (=> d!54053 (validMask!0 (mask!8628 thiss!1248))))

(assert (=> d!54053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8628 thiss!1248)) key!828 (_keys!5545 thiss!1248) (mask!8628 thiss!1248)) lt!88334)))

(declare-fun b!178695 () Bool)

(assert (=> b!178695 (and (bvsge (index!4458 lt!88334) #b00000000000000000000000000000000) (bvslt (index!4458 lt!88334) (size!3860 (_keys!5545 thiss!1248))))))

(declare-fun res!84642 () Bool)

(assert (=> b!178695 (= res!84642 (= (select (arr!3554 (_keys!5545 thiss!1248)) (index!4458 lt!88334)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178695 (=> res!84642 e!117760)))

(declare-fun b!178696 () Bool)

(assert (=> b!178696 (= e!117758 (bvsge (x!19540 lt!88334) #b01111111111111111111111111111110))))

(declare-fun b!178697 () Bool)

(assert (=> b!178697 (and (bvsge (index!4458 lt!88334) #b00000000000000000000000000000000) (bvslt (index!4458 lt!88334) (size!3860 (_keys!5545 thiss!1248))))))

(declare-fun res!84641 () Bool)

(assert (=> b!178697 (= res!84641 (= (select (arr!3554 (_keys!5545 thiss!1248)) (index!4458 lt!88334)) key!828))))

(assert (=> b!178697 (=> res!84641 e!117760)))

(declare-fun e!117759 () Bool)

(assert (=> b!178697 (= e!117759 e!117760)))

(declare-fun b!178698 () Bool)

(assert (=> b!178698 (= e!117761 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8628 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8628 thiss!1248)) key!828 (_keys!5545 thiss!1248) (mask!8628 thiss!1248)))))

(declare-fun b!178699 () Bool)

(assert (=> b!178699 (= e!117758 e!117759)))

(declare-fun res!84640 () Bool)

(assert (=> b!178699 (= res!84640 (and ((_ is Intermediate!572) lt!88334) (not (undefined!1384 lt!88334)) (bvslt (x!19540 lt!88334) #b01111111111111111111111111111110) (bvsge (x!19540 lt!88334) #b00000000000000000000000000000000) (bvsge (x!19540 lt!88334) #b00000000000000000000000000000000)))))

(assert (=> b!178699 (=> (not res!84640) (not e!117759))))

(declare-fun b!178700 () Bool)

(assert (=> b!178700 (= e!117762 (Intermediate!572 true (toIndex!0 key!828 (mask!8628 thiss!1248)) #b00000000000000000000000000000000))))

(assert (= (and d!54053 c!32037) b!178700))

(assert (= (and d!54053 (not c!32037)) b!178694))

(assert (= (and b!178694 c!32038) b!178692))

(assert (= (and b!178694 (not c!32038)) b!178698))

(assert (= (and d!54053 c!32036) b!178696))

(assert (= (and d!54053 (not c!32036)) b!178699))

(assert (= (and b!178699 res!84640) b!178697))

(assert (= (and b!178697 (not res!84641)) b!178695))

(assert (= (and b!178695 (not res!84642)) b!178693))

(assert (=> b!178698 m!207011))

(declare-fun m!207143 () Bool)

(assert (=> b!178698 m!207143))

(assert (=> b!178698 m!207143))

(declare-fun m!207145 () Bool)

(assert (=> b!178698 m!207145))

(declare-fun m!207147 () Bool)

(assert (=> b!178697 m!207147))

(assert (=> d!54053 m!207011))

(declare-fun m!207149 () Bool)

(assert (=> d!54053 m!207149))

(assert (=> d!54053 m!206973))

(assert (=> b!178695 m!207147))

(assert (=> b!178693 m!207147))

(assert (=> d!54025 d!54053))

(declare-fun d!54055 () Bool)

(declare-fun lt!88341 () (_ BitVec 32))

(declare-fun lt!88340 () (_ BitVec 32))

(assert (=> d!54055 (= lt!88341 (bvmul (bvxor lt!88340 (bvlshr lt!88340 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54055 (= lt!88340 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54055 (and (bvsge (mask!8628 thiss!1248) #b00000000000000000000000000000000) (let ((res!84643 (let ((h!2862 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19557 (bvmul (bvxor h!2862 (bvlshr h!2862 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19557 (bvlshr x!19557 #b00000000000000000000000000001101)) (mask!8628 thiss!1248)))))) (and (bvslt res!84643 (bvadd (mask!8628 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!84643 #b00000000000000000000000000000000))))))

(assert (=> d!54055 (= (toIndex!0 key!828 (mask!8628 thiss!1248)) (bvand (bvxor lt!88341 (bvlshr lt!88341 #b00000000000000000000000000001101)) (mask!8628 thiss!1248)))))

(assert (=> d!54025 d!54055))

(assert (=> d!54025 d!54023))

(declare-fun d!54057 () Bool)

(declare-fun e!117763 () Bool)

(assert (=> d!54057 e!117763))

(declare-fun res!84644 () Bool)

(assert (=> d!54057 (=> (not res!84644) (not e!117763))))

(declare-fun lt!88342 () ListLongMap!2207)

(assert (=> d!54057 (= res!84644 (contains!1200 lt!88342 (_1!1648 (tuple2!3275 lt!88287 (minValue!3509 thiss!1248)))))))

(declare-fun lt!88344 () List!2240)

(assert (=> d!54057 (= lt!88342 (ListLongMap!2208 lt!88344))))

(declare-fun lt!88343 () Unit!5443)

(declare-fun lt!88345 () Unit!5443)

(assert (=> d!54057 (= lt!88343 lt!88345)))

(assert (=> d!54057 (= (getValueByKey!200 lt!88344 (_1!1648 (tuple2!3275 lt!88287 (minValue!3509 thiss!1248)))) (Some!205 (_2!1648 (tuple2!3275 lt!88287 (minValue!3509 thiss!1248)))))))

(assert (=> d!54057 (= lt!88345 (lemmaContainsTupThenGetReturnValue!106 lt!88344 (_1!1648 (tuple2!3275 lt!88287 (minValue!3509 thiss!1248))) (_2!1648 (tuple2!3275 lt!88287 (minValue!3509 thiss!1248)))))))

(assert (=> d!54057 (= lt!88344 (insertStrictlySorted!109 (toList!1119 lt!88278) (_1!1648 (tuple2!3275 lt!88287 (minValue!3509 thiss!1248))) (_2!1648 (tuple2!3275 lt!88287 (minValue!3509 thiss!1248)))))))

(assert (=> d!54057 (= (+!261 lt!88278 (tuple2!3275 lt!88287 (minValue!3509 thiss!1248))) lt!88342)))

(declare-fun b!178701 () Bool)

(declare-fun res!84645 () Bool)

(assert (=> b!178701 (=> (not res!84645) (not e!117763))))

(assert (=> b!178701 (= res!84645 (= (getValueByKey!200 (toList!1119 lt!88342) (_1!1648 (tuple2!3275 lt!88287 (minValue!3509 thiss!1248)))) (Some!205 (_2!1648 (tuple2!3275 lt!88287 (minValue!3509 thiss!1248))))))))

(declare-fun b!178702 () Bool)

(assert (=> b!178702 (= e!117763 (contains!1202 (toList!1119 lt!88342) (tuple2!3275 lt!88287 (minValue!3509 thiss!1248))))))

(assert (= (and d!54057 res!84644) b!178701))

(assert (= (and b!178701 res!84645) b!178702))

(declare-fun m!207151 () Bool)

(assert (=> d!54057 m!207151))

(declare-fun m!207153 () Bool)

(assert (=> d!54057 m!207153))

(declare-fun m!207155 () Bool)

(assert (=> d!54057 m!207155))

(declare-fun m!207157 () Bool)

(assert (=> d!54057 m!207157))

(declare-fun m!207159 () Bool)

(assert (=> b!178701 m!207159))

(declare-fun m!207161 () Bool)

(assert (=> b!178702 m!207161))

(assert (=> b!178581 d!54057))

(declare-fun d!54059 () Bool)

(declare-fun e!117764 () Bool)

(assert (=> d!54059 e!117764))

(declare-fun res!84646 () Bool)

(assert (=> d!54059 (=> (not res!84646) (not e!117764))))

(declare-fun lt!88346 () ListLongMap!2207)

(assert (=> d!54059 (= res!84646 (contains!1200 lt!88346 (_1!1648 (tuple2!3275 lt!88295 (minValue!3509 thiss!1248)))))))

(declare-fun lt!88348 () List!2240)

(assert (=> d!54059 (= lt!88346 (ListLongMap!2208 lt!88348))))

(declare-fun lt!88347 () Unit!5443)

(declare-fun lt!88349 () Unit!5443)

(assert (=> d!54059 (= lt!88347 lt!88349)))

(assert (=> d!54059 (= (getValueByKey!200 lt!88348 (_1!1648 (tuple2!3275 lt!88295 (minValue!3509 thiss!1248)))) (Some!205 (_2!1648 (tuple2!3275 lt!88295 (minValue!3509 thiss!1248)))))))

(assert (=> d!54059 (= lt!88349 (lemmaContainsTupThenGetReturnValue!106 lt!88348 (_1!1648 (tuple2!3275 lt!88295 (minValue!3509 thiss!1248))) (_2!1648 (tuple2!3275 lt!88295 (minValue!3509 thiss!1248)))))))

(assert (=> d!54059 (= lt!88348 (insertStrictlySorted!109 (toList!1119 lt!88282) (_1!1648 (tuple2!3275 lt!88295 (minValue!3509 thiss!1248))) (_2!1648 (tuple2!3275 lt!88295 (minValue!3509 thiss!1248)))))))

(assert (=> d!54059 (= (+!261 lt!88282 (tuple2!3275 lt!88295 (minValue!3509 thiss!1248))) lt!88346)))

(declare-fun b!178703 () Bool)

(declare-fun res!84647 () Bool)

(assert (=> b!178703 (=> (not res!84647) (not e!117764))))

(assert (=> b!178703 (= res!84647 (= (getValueByKey!200 (toList!1119 lt!88346) (_1!1648 (tuple2!3275 lt!88295 (minValue!3509 thiss!1248)))) (Some!205 (_2!1648 (tuple2!3275 lt!88295 (minValue!3509 thiss!1248))))))))

(declare-fun b!178704 () Bool)

(assert (=> b!178704 (= e!117764 (contains!1202 (toList!1119 lt!88346) (tuple2!3275 lt!88295 (minValue!3509 thiss!1248))))))

(assert (= (and d!54059 res!84646) b!178703))

(assert (= (and b!178703 res!84647) b!178704))

(declare-fun m!207163 () Bool)

(assert (=> d!54059 m!207163))

(declare-fun m!207165 () Bool)

(assert (=> d!54059 m!207165))

(declare-fun m!207167 () Bool)

(assert (=> d!54059 m!207167))

(declare-fun m!207169 () Bool)

(assert (=> d!54059 m!207169))

(declare-fun m!207171 () Bool)

(assert (=> b!178703 m!207171))

(declare-fun m!207173 () Bool)

(assert (=> b!178704 m!207173))

(assert (=> b!178581 d!54059))

(declare-fun d!54061 () Bool)

(assert (=> d!54061 (= (apply!144 lt!88283 lt!88286) (get!2042 (getValueByKey!200 (toList!1119 lt!88283) lt!88286)))))

(declare-fun bs!7345 () Bool)

(assert (= bs!7345 d!54061))

(declare-fun m!207175 () Bool)

(assert (=> bs!7345 m!207175))

(assert (=> bs!7345 m!207175))

(declare-fun m!207177 () Bool)

(assert (=> bs!7345 m!207177))

(assert (=> b!178581 d!54061))

(declare-fun d!54063 () Bool)

(assert (=> d!54063 (contains!1200 (+!261 lt!88294 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248))) lt!88284)))

(declare-fun lt!88352 () Unit!5443)

(declare-fun choose!959 (ListLongMap!2207 (_ BitVec 64) V!5217 (_ BitVec 64)) Unit!5443)

(assert (=> d!54063 (= lt!88352 (choose!959 lt!88294 lt!88298 (zeroValue!3509 thiss!1248) lt!88284))))

(assert (=> d!54063 (contains!1200 lt!88294 lt!88284)))

(assert (=> d!54063 (= (addStillContains!120 lt!88294 lt!88298 (zeroValue!3509 thiss!1248) lt!88284) lt!88352)))

(declare-fun bs!7346 () Bool)

(assert (= bs!7346 d!54063))

(assert (=> bs!7346 m!207055))

(assert (=> bs!7346 m!207055))

(assert (=> bs!7346 m!207061))

(declare-fun m!207179 () Bool)

(assert (=> bs!7346 m!207179))

(declare-fun m!207181 () Bool)

(assert (=> bs!7346 m!207181))

(assert (=> b!178581 d!54063))

(declare-fun d!54065 () Bool)

(assert (=> d!54065 (= (apply!144 (+!261 lt!88278 (tuple2!3275 lt!88287 (minValue!3509 thiss!1248))) lt!88280) (apply!144 lt!88278 lt!88280))))

(declare-fun lt!88355 () Unit!5443)

(declare-fun choose!960 (ListLongMap!2207 (_ BitVec 64) V!5217 (_ BitVec 64)) Unit!5443)

(assert (=> d!54065 (= lt!88355 (choose!960 lt!88278 lt!88287 (minValue!3509 thiss!1248) lt!88280))))

(declare-fun e!117767 () Bool)

(assert (=> d!54065 e!117767))

(declare-fun res!84650 () Bool)

(assert (=> d!54065 (=> (not res!84650) (not e!117767))))

(assert (=> d!54065 (= res!84650 (contains!1200 lt!88278 lt!88280))))

(assert (=> d!54065 (= (addApplyDifferent!120 lt!88278 lt!88287 (minValue!3509 thiss!1248) lt!88280) lt!88355)))

(declare-fun b!178709 () Bool)

(assert (=> b!178709 (= e!117767 (not (= lt!88280 lt!88287)))))

(assert (= (and d!54065 res!84650) b!178709))

(assert (=> d!54065 m!207059))

(declare-fun m!207183 () Bool)

(assert (=> d!54065 m!207183))

(declare-fun m!207185 () Bool)

(assert (=> d!54065 m!207185))

(assert (=> d!54065 m!207063))

(assert (=> d!54065 m!207063))

(assert (=> d!54065 m!207079))

(assert (=> b!178581 d!54065))

(declare-fun d!54067 () Bool)

(assert (=> d!54067 (= (apply!144 (+!261 lt!88282 (tuple2!3275 lt!88295 (minValue!3509 thiss!1248))) lt!88292) (apply!144 lt!88282 lt!88292))))

(declare-fun lt!88356 () Unit!5443)

(assert (=> d!54067 (= lt!88356 (choose!960 lt!88282 lt!88295 (minValue!3509 thiss!1248) lt!88292))))

(declare-fun e!117768 () Bool)

(assert (=> d!54067 e!117768))

(declare-fun res!84651 () Bool)

(assert (=> d!54067 (=> (not res!84651) (not e!117768))))

(assert (=> d!54067 (= res!84651 (contains!1200 lt!88282 lt!88292))))

(assert (=> d!54067 (= (addApplyDifferent!120 lt!88282 lt!88295 (minValue!3509 thiss!1248) lt!88292) lt!88356)))

(declare-fun b!178710 () Bool)

(assert (=> b!178710 (= e!117768 (not (= lt!88292 lt!88295)))))

(assert (= (and d!54067 res!84651) b!178710))

(assert (=> d!54067 m!207065))

(declare-fun m!207187 () Bool)

(assert (=> d!54067 m!207187))

(declare-fun m!207189 () Bool)

(assert (=> d!54067 m!207189))

(assert (=> d!54067 m!207071))

(assert (=> d!54067 m!207071))

(assert (=> d!54067 m!207073))

(assert (=> b!178581 d!54067))

(declare-fun d!54069 () Bool)

(declare-fun e!117769 () Bool)

(assert (=> d!54069 e!117769))

(declare-fun res!84652 () Bool)

(assert (=> d!54069 (=> (not res!84652) (not e!117769))))

(declare-fun lt!88357 () ListLongMap!2207)

(assert (=> d!54069 (= res!84652 (contains!1200 lt!88357 (_1!1648 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248)))))))

(declare-fun lt!88359 () List!2240)

(assert (=> d!54069 (= lt!88357 (ListLongMap!2208 lt!88359))))

(declare-fun lt!88358 () Unit!5443)

(declare-fun lt!88360 () Unit!5443)

(assert (=> d!54069 (= lt!88358 lt!88360)))

(assert (=> d!54069 (= (getValueByKey!200 lt!88359 (_1!1648 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248)))) (Some!205 (_2!1648 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248)))))))

(assert (=> d!54069 (= lt!88360 (lemmaContainsTupThenGetReturnValue!106 lt!88359 (_1!1648 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248))) (_2!1648 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248)))))))

(assert (=> d!54069 (= lt!88359 (insertStrictlySorted!109 (toList!1119 lt!88294) (_1!1648 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248))) (_2!1648 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248)))))))

(assert (=> d!54069 (= (+!261 lt!88294 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248))) lt!88357)))

(declare-fun b!178711 () Bool)

(declare-fun res!84653 () Bool)

(assert (=> b!178711 (=> (not res!84653) (not e!117769))))

(assert (=> b!178711 (= res!84653 (= (getValueByKey!200 (toList!1119 lt!88357) (_1!1648 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248)))) (Some!205 (_2!1648 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248))))))))

(declare-fun b!178712 () Bool)

(assert (=> b!178712 (= e!117769 (contains!1202 (toList!1119 lt!88357) (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248))))))

(assert (= (and d!54069 res!84652) b!178711))

(assert (= (and b!178711 res!84653) b!178712))

(declare-fun m!207191 () Bool)

(assert (=> d!54069 m!207191))

(declare-fun m!207193 () Bool)

(assert (=> d!54069 m!207193))

(declare-fun m!207195 () Bool)

(assert (=> d!54069 m!207195))

(declare-fun m!207197 () Bool)

(assert (=> d!54069 m!207197))

(declare-fun m!207199 () Bool)

(assert (=> b!178711 m!207199))

(declare-fun m!207201 () Bool)

(assert (=> b!178712 m!207201))

(assert (=> b!178581 d!54069))

(declare-fun d!54071 () Bool)

(assert (=> d!54071 (= (apply!144 (+!261 lt!88278 (tuple2!3275 lt!88287 (minValue!3509 thiss!1248))) lt!88280) (get!2042 (getValueByKey!200 (toList!1119 (+!261 lt!88278 (tuple2!3275 lt!88287 (minValue!3509 thiss!1248)))) lt!88280)))))

(declare-fun bs!7347 () Bool)

(assert (= bs!7347 d!54071))

(declare-fun m!207203 () Bool)

(assert (=> bs!7347 m!207203))

(assert (=> bs!7347 m!207203))

(declare-fun m!207205 () Bool)

(assert (=> bs!7347 m!207205))

(assert (=> b!178581 d!54071))

(declare-fun d!54073 () Bool)

(assert (=> d!54073 (= (apply!144 (+!261 lt!88282 (tuple2!3275 lt!88295 (minValue!3509 thiss!1248))) lt!88292) (get!2042 (getValueByKey!200 (toList!1119 (+!261 lt!88282 (tuple2!3275 lt!88295 (minValue!3509 thiss!1248)))) lt!88292)))))

(declare-fun bs!7348 () Bool)

(assert (= bs!7348 d!54073))

(declare-fun m!207207 () Bool)

(assert (=> bs!7348 m!207207))

(assert (=> bs!7348 m!207207))

(declare-fun m!207209 () Bool)

(assert (=> bs!7348 m!207209))

(assert (=> b!178581 d!54073))

(declare-fun d!54075 () Bool)

(assert (=> d!54075 (= (apply!144 (+!261 lt!88283 (tuple2!3275 lt!88297 (zeroValue!3509 thiss!1248))) lt!88286) (apply!144 lt!88283 lt!88286))))

(declare-fun lt!88361 () Unit!5443)

(assert (=> d!54075 (= lt!88361 (choose!960 lt!88283 lt!88297 (zeroValue!3509 thiss!1248) lt!88286))))

(declare-fun e!117770 () Bool)

(assert (=> d!54075 e!117770))

(declare-fun res!84654 () Bool)

(assert (=> d!54075 (=> (not res!84654) (not e!117770))))

(assert (=> d!54075 (= res!84654 (contains!1200 lt!88283 lt!88286))))

(assert (=> d!54075 (= (addApplyDifferent!120 lt!88283 lt!88297 (zeroValue!3509 thiss!1248) lt!88286) lt!88361)))

(declare-fun b!178713 () Bool)

(assert (=> b!178713 (= e!117770 (not (= lt!88286 lt!88297)))))

(assert (= (and d!54075 res!84654) b!178713))

(assert (=> d!54075 m!207057))

(declare-fun m!207211 () Bool)

(assert (=> d!54075 m!207211))

(declare-fun m!207213 () Bool)

(assert (=> d!54075 m!207213))

(assert (=> d!54075 m!207075))

(assert (=> d!54075 m!207075))

(assert (=> d!54075 m!207083))

(assert (=> b!178581 d!54075))

(declare-fun d!54077 () Bool)

(assert (=> d!54077 (= (apply!144 lt!88282 lt!88292) (get!2042 (getValueByKey!200 (toList!1119 lt!88282) lt!88292)))))

(declare-fun bs!7349 () Bool)

(assert (= bs!7349 d!54077))

(declare-fun m!207215 () Bool)

(assert (=> bs!7349 m!207215))

(assert (=> bs!7349 m!207215))

(declare-fun m!207217 () Bool)

(assert (=> bs!7349 m!207217))

(assert (=> b!178581 d!54077))

(declare-fun d!54079 () Bool)

(declare-fun e!117771 () Bool)

(assert (=> d!54079 e!117771))

(declare-fun res!84655 () Bool)

(assert (=> d!54079 (=> (not res!84655) (not e!117771))))

(declare-fun lt!88362 () ListLongMap!2207)

(assert (=> d!54079 (= res!84655 (contains!1200 lt!88362 (_1!1648 (tuple2!3275 lt!88297 (zeroValue!3509 thiss!1248)))))))

(declare-fun lt!88364 () List!2240)

(assert (=> d!54079 (= lt!88362 (ListLongMap!2208 lt!88364))))

(declare-fun lt!88363 () Unit!5443)

(declare-fun lt!88365 () Unit!5443)

(assert (=> d!54079 (= lt!88363 lt!88365)))

(assert (=> d!54079 (= (getValueByKey!200 lt!88364 (_1!1648 (tuple2!3275 lt!88297 (zeroValue!3509 thiss!1248)))) (Some!205 (_2!1648 (tuple2!3275 lt!88297 (zeroValue!3509 thiss!1248)))))))

(assert (=> d!54079 (= lt!88365 (lemmaContainsTupThenGetReturnValue!106 lt!88364 (_1!1648 (tuple2!3275 lt!88297 (zeroValue!3509 thiss!1248))) (_2!1648 (tuple2!3275 lt!88297 (zeroValue!3509 thiss!1248)))))))

(assert (=> d!54079 (= lt!88364 (insertStrictlySorted!109 (toList!1119 lt!88283) (_1!1648 (tuple2!3275 lt!88297 (zeroValue!3509 thiss!1248))) (_2!1648 (tuple2!3275 lt!88297 (zeroValue!3509 thiss!1248)))))))

(assert (=> d!54079 (= (+!261 lt!88283 (tuple2!3275 lt!88297 (zeroValue!3509 thiss!1248))) lt!88362)))

(declare-fun b!178714 () Bool)

(declare-fun res!84656 () Bool)

(assert (=> b!178714 (=> (not res!84656) (not e!117771))))

(assert (=> b!178714 (= res!84656 (= (getValueByKey!200 (toList!1119 lt!88362) (_1!1648 (tuple2!3275 lt!88297 (zeroValue!3509 thiss!1248)))) (Some!205 (_2!1648 (tuple2!3275 lt!88297 (zeroValue!3509 thiss!1248))))))))

(declare-fun b!178715 () Bool)

(assert (=> b!178715 (= e!117771 (contains!1202 (toList!1119 lt!88362) (tuple2!3275 lt!88297 (zeroValue!3509 thiss!1248))))))

(assert (= (and d!54079 res!84655) b!178714))

(assert (= (and b!178714 res!84656) b!178715))

(declare-fun m!207219 () Bool)

(assert (=> d!54079 m!207219))

(declare-fun m!207221 () Bool)

(assert (=> d!54079 m!207221))

(declare-fun m!207223 () Bool)

(assert (=> d!54079 m!207223))

(declare-fun m!207225 () Bool)

(assert (=> d!54079 m!207225))

(declare-fun m!207227 () Bool)

(assert (=> b!178714 m!207227))

(declare-fun m!207229 () Bool)

(assert (=> b!178715 m!207229))

(assert (=> b!178581 d!54079))

(declare-fun d!54081 () Bool)

(assert (=> d!54081 (= (apply!144 lt!88278 lt!88280) (get!2042 (getValueByKey!200 (toList!1119 lt!88278) lt!88280)))))

(declare-fun bs!7350 () Bool)

(assert (= bs!7350 d!54081))

(declare-fun m!207231 () Bool)

(assert (=> bs!7350 m!207231))

(assert (=> bs!7350 m!207231))

(declare-fun m!207233 () Bool)

(assert (=> bs!7350 m!207233))

(assert (=> b!178581 d!54081))

(declare-fun b!178740 () Bool)

(assert (=> b!178740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))))))

(assert (=> b!178740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3861 (_values!3651 thiss!1248))))))

(declare-fun e!117788 () Bool)

(declare-fun lt!88384 () ListLongMap!2207)

(assert (=> b!178740 (= e!117788 (= (apply!144 lt!88384 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)) (get!2041 (select (arr!3555 (_values!3651 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3668 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!178741 () Bool)

(declare-fun e!117792 () Bool)

(assert (=> b!178741 (= e!117792 (validKeyInArray!0 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178741 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!178742 () Bool)

(declare-fun e!117791 () ListLongMap!2207)

(assert (=> b!178742 (= e!117791 (ListLongMap!2208 Nil!2237))))

(declare-fun b!178743 () Bool)

(declare-fun e!117786 () Bool)

(declare-fun e!117789 () Bool)

(assert (=> b!178743 (= e!117786 e!117789)))

(declare-fun c!32049 () Bool)

(assert (=> b!178743 (= c!32049 (bvslt #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))))))

(declare-fun b!178744 () Bool)

(declare-fun lt!88386 () Unit!5443)

(declare-fun lt!88383 () Unit!5443)

(assert (=> b!178744 (= lt!88386 lt!88383)))

(declare-fun lt!88382 () (_ BitVec 64))

(declare-fun lt!88385 () (_ BitVec 64))

(declare-fun lt!88381 () ListLongMap!2207)

(declare-fun lt!88380 () V!5217)

(assert (=> b!178744 (not (contains!1200 (+!261 lt!88381 (tuple2!3275 lt!88385 lt!88380)) lt!88382))))

(declare-fun addStillNotContains!81 (ListLongMap!2207 (_ BitVec 64) V!5217 (_ BitVec 64)) Unit!5443)

(assert (=> b!178744 (= lt!88383 (addStillNotContains!81 lt!88381 lt!88385 lt!88380 lt!88382))))

(assert (=> b!178744 (= lt!88382 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!178744 (= lt!88380 (get!2041 (select (arr!3555 (_values!3651 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3668 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178744 (= lt!88385 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!18049 () ListLongMap!2207)

(assert (=> b!178744 (= lt!88381 call!18049)))

(declare-fun e!117790 () ListLongMap!2207)

(assert (=> b!178744 (= e!117790 (+!261 call!18049 (tuple2!3275 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000) (get!2041 (select (arr!3555 (_values!3651 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3668 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!178746 () Bool)

(declare-fun e!117787 () Bool)

(assert (=> b!178746 (= e!117787 e!117786)))

(declare-fun c!32048 () Bool)

(assert (=> b!178746 (= c!32048 e!117792)))

(declare-fun res!84666 () Bool)

(assert (=> b!178746 (=> (not res!84666) (not e!117792))))

(assert (=> b!178746 (= res!84666 (bvslt #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))))))

(declare-fun bm!18046 () Bool)

(assert (=> bm!18046 (= call!18049 (getCurrentListMapNoExtraKeys!175 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3668 thiss!1248)))))

(declare-fun b!178747 () Bool)

(assert (=> b!178747 (= e!117791 e!117790)))

(declare-fun c!32050 () Bool)

(assert (=> b!178747 (= c!32050 (validKeyInArray!0 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54083 () Bool)

(assert (=> d!54083 e!117787))

(declare-fun res!84668 () Bool)

(assert (=> d!54083 (=> (not res!84668) (not e!117787))))

(assert (=> d!54083 (= res!84668 (not (contains!1200 lt!88384 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54083 (= lt!88384 e!117791)))

(declare-fun c!32047 () Bool)

(assert (=> d!54083 (= c!32047 (bvsge #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))))))

(assert (=> d!54083 (validMask!0 (mask!8628 thiss!1248))))

(assert (=> d!54083 (= (getCurrentListMapNoExtraKeys!175 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)) lt!88384)))

(declare-fun b!178745 () Bool)

(assert (=> b!178745 (= e!117789 (= lt!88384 (getCurrentListMapNoExtraKeys!175 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3668 thiss!1248))))))

(declare-fun b!178748 () Bool)

(assert (=> b!178748 (= e!117790 call!18049)))

(declare-fun b!178749 () Bool)

(assert (=> b!178749 (= e!117786 e!117788)))

(assert (=> b!178749 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))))))

(declare-fun res!84665 () Bool)

(assert (=> b!178749 (= res!84665 (contains!1200 lt!88384 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178749 (=> (not res!84665) (not e!117788))))

(declare-fun b!178750 () Bool)

(declare-fun isEmpty!458 (ListLongMap!2207) Bool)

(assert (=> b!178750 (= e!117789 (isEmpty!458 lt!88384))))

(declare-fun b!178751 () Bool)

(declare-fun res!84667 () Bool)

(assert (=> b!178751 (=> (not res!84667) (not e!117787))))

(assert (=> b!178751 (= res!84667 (not (contains!1200 lt!88384 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54083 c!32047) b!178742))

(assert (= (and d!54083 (not c!32047)) b!178747))

(assert (= (and b!178747 c!32050) b!178744))

(assert (= (and b!178747 (not c!32050)) b!178748))

(assert (= (or b!178744 b!178748) bm!18046))

(assert (= (and d!54083 res!84668) b!178751))

(assert (= (and b!178751 res!84667) b!178746))

(assert (= (and b!178746 res!84666) b!178741))

(assert (= (and b!178746 c!32048) b!178749))

(assert (= (and b!178746 (not c!32048)) b!178743))

(assert (= (and b!178749 res!84665) b!178740))

(assert (= (and b!178743 c!32049) b!178745))

(assert (= (and b!178743 (not c!32049)) b!178750))

(declare-fun b_lambda!7109 () Bool)

(assert (=> (not b_lambda!7109) (not b!178740)))

(assert (=> b!178740 t!7073))

(declare-fun b_and!10943 () Bool)

(assert (= b_and!10941 (and (=> t!7073 result!4663) b_and!10943)))

(declare-fun b_lambda!7111 () Bool)

(assert (=> (not b_lambda!7111) (not b!178744)))

(assert (=> b!178744 t!7073))

(declare-fun b_and!10945 () Bool)

(assert (= b_and!10943 (and (=> t!7073 result!4663) b_and!10945)))

(assert (=> b!178740 m!207049))

(assert (=> b!178740 m!207051))

(assert (=> b!178740 m!207053))

(assert (=> b!178740 m!207049))

(assert (=> b!178740 m!207045))

(declare-fun m!207235 () Bool)

(assert (=> b!178740 m!207235))

(assert (=> b!178740 m!207045))

(assert (=> b!178740 m!207051))

(declare-fun m!207237 () Bool)

(assert (=> d!54083 m!207237))

(assert (=> d!54083 m!206973))

(declare-fun m!207239 () Bool)

(assert (=> b!178751 m!207239))

(declare-fun m!207241 () Bool)

(assert (=> b!178745 m!207241))

(assert (=> b!178741 m!207045))

(assert (=> b!178741 m!207045))

(assert (=> b!178741 m!207091))

(declare-fun m!207243 () Bool)

(assert (=> b!178750 m!207243))

(assert (=> b!178747 m!207045))

(assert (=> b!178747 m!207045))

(assert (=> b!178747 m!207091))

(assert (=> b!178744 m!207049))

(assert (=> b!178744 m!207051))

(assert (=> b!178744 m!207053))

(declare-fun m!207245 () Bool)

(assert (=> b!178744 m!207245))

(declare-fun m!207247 () Bool)

(assert (=> b!178744 m!207247))

(declare-fun m!207249 () Bool)

(assert (=> b!178744 m!207249))

(assert (=> b!178744 m!207049))

(declare-fun m!207251 () Bool)

(assert (=> b!178744 m!207251))

(assert (=> b!178744 m!207045))

(assert (=> b!178744 m!207051))

(assert (=> b!178744 m!207245))

(assert (=> bm!18046 m!207241))

(assert (=> b!178749 m!207045))

(assert (=> b!178749 m!207045))

(declare-fun m!207253 () Bool)

(assert (=> b!178749 m!207253))

(assert (=> b!178581 d!54083))

(declare-fun d!54085 () Bool)

(declare-fun e!117794 () Bool)

(assert (=> d!54085 e!117794))

(declare-fun res!84669 () Bool)

(assert (=> d!54085 (=> res!84669 e!117794)))

(declare-fun lt!88389 () Bool)

(assert (=> d!54085 (= res!84669 (not lt!88389))))

(declare-fun lt!88390 () Bool)

(assert (=> d!54085 (= lt!88389 lt!88390)))

(declare-fun lt!88387 () Unit!5443)

(declare-fun e!117793 () Unit!5443)

(assert (=> d!54085 (= lt!88387 e!117793)))

(declare-fun c!32051 () Bool)

(assert (=> d!54085 (= c!32051 lt!88390)))

(assert (=> d!54085 (= lt!88390 (containsKey!203 (toList!1119 (+!261 lt!88294 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248)))) lt!88284))))

(assert (=> d!54085 (= (contains!1200 (+!261 lt!88294 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248))) lt!88284) lt!88389)))

(declare-fun b!178752 () Bool)

(declare-fun lt!88388 () Unit!5443)

(assert (=> b!178752 (= e!117793 lt!88388)))

(assert (=> b!178752 (= lt!88388 (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1119 (+!261 lt!88294 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248)))) lt!88284))))

(assert (=> b!178752 (isDefined!152 (getValueByKey!200 (toList!1119 (+!261 lt!88294 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248)))) lt!88284))))

(declare-fun b!178753 () Bool)

(declare-fun Unit!5447 () Unit!5443)

(assert (=> b!178753 (= e!117793 Unit!5447)))

(declare-fun b!178754 () Bool)

(assert (=> b!178754 (= e!117794 (isDefined!152 (getValueByKey!200 (toList!1119 (+!261 lt!88294 (tuple2!3275 lt!88298 (zeroValue!3509 thiss!1248)))) lt!88284)))))

(assert (= (and d!54085 c!32051) b!178752))

(assert (= (and d!54085 (not c!32051)) b!178753))

(assert (= (and d!54085 (not res!84669)) b!178754))

(declare-fun m!207255 () Bool)

(assert (=> d!54085 m!207255))

(declare-fun m!207257 () Bool)

(assert (=> b!178752 m!207257))

(declare-fun m!207259 () Bool)

(assert (=> b!178752 m!207259))

(assert (=> b!178752 m!207259))

(declare-fun m!207261 () Bool)

(assert (=> b!178752 m!207261))

(assert (=> b!178754 m!207259))

(assert (=> b!178754 m!207259))

(assert (=> b!178754 m!207261))

(assert (=> b!178581 d!54085))

(declare-fun d!54087 () Bool)

(assert (=> d!54087 (= (apply!144 (+!261 lt!88283 (tuple2!3275 lt!88297 (zeroValue!3509 thiss!1248))) lt!88286) (get!2042 (getValueByKey!200 (toList!1119 (+!261 lt!88283 (tuple2!3275 lt!88297 (zeroValue!3509 thiss!1248)))) lt!88286)))))

(declare-fun bs!7351 () Bool)

(assert (= bs!7351 d!54087))

(declare-fun m!207263 () Bool)

(assert (=> bs!7351 m!207263))

(assert (=> bs!7351 m!207263))

(declare-fun m!207265 () Bool)

(assert (=> bs!7351 m!207265))

(assert (=> b!178581 d!54087))

(assert (=> d!54031 d!54023))

(declare-fun d!54089 () Bool)

(declare-fun e!117796 () Bool)

(assert (=> d!54089 e!117796))

(declare-fun res!84670 () Bool)

(assert (=> d!54089 (=> res!84670 e!117796)))

(declare-fun lt!88393 () Bool)

(assert (=> d!54089 (= res!84670 (not lt!88393))))

(declare-fun lt!88394 () Bool)

(assert (=> d!54089 (= lt!88393 lt!88394)))

(declare-fun lt!88391 () Unit!5443)

(declare-fun e!117795 () Unit!5443)

(assert (=> d!54089 (= lt!88391 e!117795)))

(declare-fun c!32052 () Bool)

(assert (=> d!54089 (= c!32052 lt!88394)))

(assert (=> d!54089 (= lt!88394 (containsKey!203 (toList!1119 lt!88299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54089 (= (contains!1200 lt!88299 #b1000000000000000000000000000000000000000000000000000000000000000) lt!88393)))

(declare-fun b!178755 () Bool)

(declare-fun lt!88392 () Unit!5443)

(assert (=> b!178755 (= e!117795 lt!88392)))

(assert (=> b!178755 (= lt!88392 (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1119 lt!88299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178755 (isDefined!152 (getValueByKey!200 (toList!1119 lt!88299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178756 () Bool)

(declare-fun Unit!5448 () Unit!5443)

(assert (=> b!178756 (= e!117795 Unit!5448)))

(declare-fun b!178757 () Bool)

(assert (=> b!178757 (= e!117796 (isDefined!152 (getValueByKey!200 (toList!1119 lt!88299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54089 c!32052) b!178755))

(assert (= (and d!54089 (not c!32052)) b!178756))

(assert (= (and d!54089 (not res!84670)) b!178757))

(declare-fun m!207267 () Bool)

(assert (=> d!54089 m!207267))

(declare-fun m!207269 () Bool)

(assert (=> b!178755 m!207269))

(declare-fun m!207271 () Bool)

(assert (=> b!178755 m!207271))

(assert (=> b!178755 m!207271))

(declare-fun m!207273 () Bool)

(assert (=> b!178755 m!207273))

(assert (=> b!178757 m!207271))

(assert (=> b!178757 m!207271))

(assert (=> b!178757 m!207273))

(assert (=> bm!18037 d!54089))

(declare-fun d!54091 () Bool)

(declare-fun e!117798 () Bool)

(assert (=> d!54091 e!117798))

(declare-fun res!84671 () Bool)

(assert (=> d!54091 (=> res!84671 e!117798)))

(declare-fun lt!88397 () Bool)

(assert (=> d!54091 (= res!84671 (not lt!88397))))

(declare-fun lt!88398 () Bool)

(assert (=> d!54091 (= lt!88397 lt!88398)))

(declare-fun lt!88395 () Unit!5443)

(declare-fun e!117797 () Unit!5443)

(assert (=> d!54091 (= lt!88395 e!117797)))

(declare-fun c!32053 () Bool)

(assert (=> d!54091 (= c!32053 lt!88398)))

(assert (=> d!54091 (= lt!88398 (containsKey!203 (toList!1119 lt!88299) (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54091 (= (contains!1200 lt!88299 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)) lt!88397)))

(declare-fun b!178758 () Bool)

(declare-fun lt!88396 () Unit!5443)

(assert (=> b!178758 (= e!117797 lt!88396)))

(assert (=> b!178758 (= lt!88396 (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1119 lt!88299) (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178758 (isDefined!152 (getValueByKey!200 (toList!1119 lt!88299) (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178759 () Bool)

(declare-fun Unit!5449 () Unit!5443)

(assert (=> b!178759 (= e!117797 Unit!5449)))

(declare-fun b!178760 () Bool)

(assert (=> b!178760 (= e!117798 (isDefined!152 (getValueByKey!200 (toList!1119 lt!88299) (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54091 c!32053) b!178758))

(assert (= (and d!54091 (not c!32053)) b!178759))

(assert (= (and d!54091 (not res!84671)) b!178760))

(assert (=> d!54091 m!207045))

(declare-fun m!207275 () Bool)

(assert (=> d!54091 m!207275))

(assert (=> b!178758 m!207045))

(declare-fun m!207277 () Bool)

(assert (=> b!178758 m!207277))

(assert (=> b!178758 m!207045))

(declare-fun m!207279 () Bool)

(assert (=> b!178758 m!207279))

(assert (=> b!178758 m!207279))

(declare-fun m!207281 () Bool)

(assert (=> b!178758 m!207281))

(assert (=> b!178760 m!207045))

(assert (=> b!178760 m!207279))

(assert (=> b!178760 m!207279))

(assert (=> b!178760 m!207281))

(assert (=> b!178578 d!54091))

(declare-fun d!54093 () Bool)

(declare-fun e!117799 () Bool)

(assert (=> d!54093 e!117799))

(declare-fun res!84672 () Bool)

(assert (=> d!54093 (=> (not res!84672) (not e!117799))))

(declare-fun lt!88399 () ListLongMap!2207)

(assert (=> d!54093 (= res!84672 (contains!1200 lt!88399 (_1!1648 (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))))))

(declare-fun lt!88401 () List!2240)

(assert (=> d!54093 (= lt!88399 (ListLongMap!2208 lt!88401))))

(declare-fun lt!88400 () Unit!5443)

(declare-fun lt!88402 () Unit!5443)

(assert (=> d!54093 (= lt!88400 lt!88402)))

(assert (=> d!54093 (= (getValueByKey!200 lt!88401 (_1!1648 (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))) (Some!205 (_2!1648 (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))))))

(assert (=> d!54093 (= lt!88402 (lemmaContainsTupThenGetReturnValue!106 lt!88401 (_1!1648 (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))) (_2!1648 (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))))))

(assert (=> d!54093 (= lt!88401 (insertStrictlySorted!109 (toList!1119 call!18035) (_1!1648 (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))) (_2!1648 (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))))))

(assert (=> d!54093 (= (+!261 call!18035 (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))) lt!88399)))

(declare-fun b!178761 () Bool)

(declare-fun res!84673 () Bool)

(assert (=> b!178761 (=> (not res!84673) (not e!117799))))

(assert (=> b!178761 (= res!84673 (= (getValueByKey!200 (toList!1119 lt!88399) (_1!1648 (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))) (Some!205 (_2!1648 (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))))))

(declare-fun b!178762 () Bool)

(assert (=> b!178762 (= e!117799 (contains!1202 (toList!1119 lt!88399) (tuple2!3275 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))))

(assert (= (and d!54093 res!84672) b!178761))

(assert (= (and b!178761 res!84673) b!178762))

(declare-fun m!207283 () Bool)

(assert (=> d!54093 m!207283))

(declare-fun m!207285 () Bool)

(assert (=> d!54093 m!207285))

(declare-fun m!207287 () Bool)

(assert (=> d!54093 m!207287))

(declare-fun m!207289 () Bool)

(assert (=> d!54093 m!207289))

(declare-fun m!207291 () Bool)

(assert (=> b!178761 m!207291))

(declare-fun m!207293 () Bool)

(assert (=> b!178762 m!207293))

(assert (=> b!178568 d!54093))

(declare-fun d!54095 () Bool)

(assert (=> d!54095 (isDefined!152 (getValueByKey!200 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828))))

(declare-fun lt!88405 () Unit!5443)

(declare-fun choose!961 (List!2240 (_ BitVec 64)) Unit!5443)

(assert (=> d!54095 (= lt!88405 (choose!961 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828))))

(declare-fun e!117802 () Bool)

(assert (=> d!54095 e!117802))

(declare-fun res!84676 () Bool)

(assert (=> d!54095 (=> (not res!84676) (not e!117802))))

(declare-fun isStrictlySorted!326 (List!2240) Bool)

(assert (=> d!54095 (= res!84676 (isStrictlySorted!326 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))))))

(assert (=> d!54095 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828) lt!88405)))

(declare-fun b!178765 () Bool)

(assert (=> b!178765 (= e!117802 (containsKey!203 (toList!1119 (getCurrentListMap!774 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828))))

(assert (= (and d!54095 res!84676) b!178765))

(assert (=> d!54095 m!207037))

(assert (=> d!54095 m!207037))

(assert (=> d!54095 m!207039))

(declare-fun m!207295 () Bool)

(assert (=> d!54095 m!207295))

(declare-fun m!207297 () Bool)

(assert (=> d!54095 m!207297))

(assert (=> b!178765 m!207033))

(assert (=> b!178520 d!54095))

(assert (=> b!178520 d!54049))

(assert (=> b!178520 d!54051))

(assert (=> bm!18036 d!54083))

(declare-fun b!178776 () Bool)

(declare-fun e!117814 () Bool)

(declare-fun contains!1203 (List!2242 (_ BitVec 64)) Bool)

(assert (=> b!178776 (= e!117814 (contains!1203 Nil!2239 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54097 () Bool)

(declare-fun res!84685 () Bool)

(declare-fun e!117813 () Bool)

(assert (=> d!54097 (=> res!84685 e!117813)))

(assert (=> d!54097 (= res!84685 (bvsge #b00000000000000000000000000000000 (size!3860 (_keys!5545 thiss!1248))))))

(assert (=> d!54097 (= (arrayNoDuplicates!0 (_keys!5545 thiss!1248) #b00000000000000000000000000000000 Nil!2239) e!117813)))

(declare-fun b!178777 () Bool)

(declare-fun e!117812 () Bool)

(assert (=> b!178777 (= e!117813 e!117812)))

(declare-fun res!84684 () Bool)

(assert (=> b!178777 (=> (not res!84684) (not e!117812))))

(assert (=> b!178777 (= res!84684 (not e!117814))))

(declare-fun res!84683 () Bool)

(assert (=> b!178777 (=> (not res!84683) (not e!117814))))

(assert (=> b!178777 (= res!84683 (validKeyInArray!0 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178778 () Bool)

(declare-fun e!117811 () Bool)

(declare-fun call!18052 () Bool)

(assert (=> b!178778 (= e!117811 call!18052)))

(declare-fun b!178779 () Bool)

(assert (=> b!178779 (= e!117811 call!18052)))

(declare-fun bm!18049 () Bool)

(declare-fun c!32056 () Bool)

(assert (=> bm!18049 (= call!18052 (arrayNoDuplicates!0 (_keys!5545 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32056 (Cons!2238 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000) Nil!2239) Nil!2239)))))

(declare-fun b!178780 () Bool)

(assert (=> b!178780 (= e!117812 e!117811)))

(assert (=> b!178780 (= c!32056 (validKeyInArray!0 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54097 (not res!84685)) b!178777))

(assert (= (and b!178777 res!84683) b!178776))

(assert (= (and b!178777 res!84684) b!178780))

(assert (= (and b!178780 c!32056) b!178779))

(assert (= (and b!178780 (not c!32056)) b!178778))

(assert (= (or b!178779 b!178778) bm!18049))

(assert (=> b!178776 m!207045))

(assert (=> b!178776 m!207045))

(declare-fun m!207299 () Bool)

(assert (=> b!178776 m!207299))

(assert (=> b!178777 m!207045))

(assert (=> b!178777 m!207045))

(assert (=> b!178777 m!207091))

(assert (=> bm!18049 m!207045))

(declare-fun m!207301 () Bool)

(assert (=> bm!18049 m!207301))

(assert (=> b!178780 m!207045))

(assert (=> b!178780 m!207045))

(assert (=> b!178780 m!207091))

(assert (=> b!178513 d!54097))

(declare-fun d!54099 () Bool)

(assert (=> d!54099 (= (apply!144 lt!88299 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2042 (getValueByKey!200 (toList!1119 lt!88299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7352 () Bool)

(assert (= bs!7352 d!54099))

(assert (=> bs!7352 m!207271))

(assert (=> bs!7352 m!207271))

(declare-fun m!207303 () Bool)

(assert (=> bs!7352 m!207303))

(assert (=> b!178585 d!54099))

(declare-fun d!54101 () Bool)

(declare-fun e!117816 () Bool)

(assert (=> d!54101 e!117816))

(declare-fun res!84686 () Bool)

(assert (=> d!54101 (=> res!84686 e!117816)))

(declare-fun lt!88408 () Bool)

(assert (=> d!54101 (= res!84686 (not lt!88408))))

(declare-fun lt!88409 () Bool)

(assert (=> d!54101 (= lt!88408 lt!88409)))

(declare-fun lt!88406 () Unit!5443)

(declare-fun e!117815 () Unit!5443)

(assert (=> d!54101 (= lt!88406 e!117815)))

(declare-fun c!32057 () Bool)

(assert (=> d!54101 (= c!32057 lt!88409)))

(assert (=> d!54101 (= lt!88409 (containsKey!203 (toList!1119 lt!88299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54101 (= (contains!1200 lt!88299 #b0000000000000000000000000000000000000000000000000000000000000000) lt!88408)))

(declare-fun b!178781 () Bool)

(declare-fun lt!88407 () Unit!5443)

(assert (=> b!178781 (= e!117815 lt!88407)))

(assert (=> b!178781 (= lt!88407 (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1119 lt!88299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178781 (isDefined!152 (getValueByKey!200 (toList!1119 lt!88299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178782 () Bool)

(declare-fun Unit!5450 () Unit!5443)

(assert (=> b!178782 (= e!117815 Unit!5450)))

(declare-fun b!178783 () Bool)

(assert (=> b!178783 (= e!117816 (isDefined!152 (getValueByKey!200 (toList!1119 lt!88299) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54101 c!32057) b!178781))

(assert (= (and d!54101 (not c!32057)) b!178782))

(assert (= (and d!54101 (not res!84686)) b!178783))

(declare-fun m!207305 () Bool)

(assert (=> d!54101 m!207305))

(declare-fun m!207307 () Bool)

(assert (=> b!178781 m!207307))

(assert (=> b!178781 m!207135))

(assert (=> b!178781 m!207135))

(declare-fun m!207309 () Bool)

(assert (=> b!178781 m!207309))

(assert (=> b!178783 m!207135))

(assert (=> b!178783 m!207135))

(assert (=> b!178783 m!207309))

(assert (=> bm!18033 d!54101))

(declare-fun d!54103 () Bool)

(assert (=> d!54103 (= (apply!144 lt!88299 (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000)) (get!2042 (getValueByKey!200 (toList!1119 lt!88299) (select (arr!3554 (_keys!5545 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7353 () Bool)

(assert (= bs!7353 d!54103))

(assert (=> bs!7353 m!207045))

(assert (=> bs!7353 m!207279))

(assert (=> bs!7353 m!207279))

(declare-fun m!207311 () Bool)

(assert (=> bs!7353 m!207311))

(assert (=> b!178569 d!54103))

(declare-fun d!54105 () Bool)

(declare-fun c!32060 () Bool)

(assert (=> d!54105 (= c!32060 ((_ is ValueCellFull!1745) (select (arr!3555 (_values!3651 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!117819 () V!5217)

(assert (=> d!54105 (= (get!2041 (select (arr!3555 (_values!3651 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3668 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!117819)))

(declare-fun b!178788 () Bool)

(declare-fun get!2043 (ValueCell!1745 V!5217) V!5217)

(assert (=> b!178788 (= e!117819 (get!2043 (select (arr!3555 (_values!3651 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3668 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178789 () Bool)

(declare-fun get!2044 (ValueCell!1745 V!5217) V!5217)

(assert (=> b!178789 (= e!117819 (get!2044 (select (arr!3555 (_values!3651 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3668 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54105 c!32060) b!178788))

(assert (= (and d!54105 (not c!32060)) b!178789))

(assert (=> b!178788 m!207049))

(assert (=> b!178788 m!207051))

(declare-fun m!207313 () Bool)

(assert (=> b!178788 m!207313))

(assert (=> b!178789 m!207049))

(assert (=> b!178789 m!207051))

(declare-fun m!207315 () Bool)

(assert (=> b!178789 m!207315))

(assert (=> b!178569 d!54105))

(declare-fun b!178791 () Bool)

(declare-fun e!117821 () Bool)

(assert (=> b!178791 (= e!117821 tp_is_empty!4177)))

(declare-fun b!178790 () Bool)

(declare-fun e!117820 () Bool)

(assert (=> b!178790 (= e!117820 tp_is_empty!4177)))

(declare-fun mapIsEmpty!7152 () Bool)

(declare-fun mapRes!7152 () Bool)

(assert (=> mapIsEmpty!7152 mapRes!7152))

(declare-fun condMapEmpty!7152 () Bool)

(declare-fun mapDefault!7152 () ValueCell!1745)

(assert (=> mapNonEmpty!7151 (= condMapEmpty!7152 (= mapRest!7151 ((as const (Array (_ BitVec 32) ValueCell!1745)) mapDefault!7152)))))

(assert (=> mapNonEmpty!7151 (= tp!15944 (and e!117821 mapRes!7152))))

(declare-fun mapNonEmpty!7152 () Bool)

(declare-fun tp!15945 () Bool)

(assert (=> mapNonEmpty!7152 (= mapRes!7152 (and tp!15945 e!117820))))

(declare-fun mapKey!7152 () (_ BitVec 32))

(declare-fun mapValue!7152 () ValueCell!1745)

(declare-fun mapRest!7152 () (Array (_ BitVec 32) ValueCell!1745))

(assert (=> mapNonEmpty!7152 (= mapRest!7151 (store mapRest!7152 mapKey!7152 mapValue!7152))))

(assert (= (and mapNonEmpty!7151 condMapEmpty!7152) mapIsEmpty!7152))

(assert (= (and mapNonEmpty!7151 (not condMapEmpty!7152)) mapNonEmpty!7152))

(assert (= (and mapNonEmpty!7152 ((_ is ValueCellFull!1745) mapValue!7152)) b!178790))

(assert (= (and mapNonEmpty!7151 ((_ is ValueCellFull!1745) mapDefault!7152)) b!178791))

(declare-fun m!207317 () Bool)

(assert (=> mapNonEmpty!7152 m!207317))

(declare-fun b_lambda!7113 () Bool)

(assert (= b_lambda!7109 (or (and b!178428 b_free!4405) b_lambda!7113)))

(declare-fun b_lambda!7115 () Bool)

(assert (= b_lambda!7111 (or (and b!178428 b_free!4405) b_lambda!7115)))

(check-sat (not b!178630) (not d!54053) (not b!178715) (not d!54061) (not d!54069) (not b_lambda!7115) (not b!178789) (not d!54101) (not d!54067) (not b!178776) (not b!178760) (not bm!18043) (not b_lambda!7113) (not d!54093) (not d!54103) (not b!178752) (not b!178788) (not b!178754) (not b!178698) (not d!54049) (not b!178703) (not b!178714) (not bm!18049) (not b!178747) (not d!54041) (not b!178604) (not d!54043) (not b!178781) (not b!178783) (not d!54081) (not d!54039) (not d!54077) (not b!178751) (not b!178613) (not mapNonEmpty!7152) (not b!178741) (not b!178755) b_and!10945 (not d!54063) (not d!54085) (not d!54047) (not d!54079) (not b!178757) (not b!178740) (not d!54089) (not b!178711) (not b!178704) (not b!178749) (not d!54059) (not b!178745) (not d!54087) (not b_next!4405) (not b!178606) (not b!178761) (not b!178765) (not d!54071) (not d!54073) (not d!54083) (not b!178619) (not d!54057) (not b!178744) (not d!54095) (not b!178672) (not b!178660) (not b!178702) (not b!178762) (not b!178750) (not b!178701) (not b!178618) (not d!54099) (not b!178758) (not b!178645) (not b_lambda!7107) (not d!54075) (not b!178777) (not d!54065) (not bm!18046) (not b!178629) (not d!54091) tp_is_empty!4177 (not b!178780) (not bm!18040) (not b!178712))
(check-sat b_and!10945 (not b_next!4405))
