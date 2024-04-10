; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15918 () Bool)

(assert start!15918)

(declare-fun b!158294 () Bool)

(declare-fun b_free!3477 () Bool)

(declare-fun b_next!3477 () Bool)

(assert (=> b!158294 (= b_free!3477 (not b_next!3477))))

(declare-fun tp!12980 () Bool)

(declare-fun b_and!9891 () Bool)

(assert (=> b!158294 (= tp!12980 b_and!9891)))

(declare-fun b!158291 () Bool)

(declare-fun res!74770 () Bool)

(declare-fun e!103672 () Bool)

(assert (=> b!158291 (=> (not res!74770) (not e!103672))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!158291 (= res!74770 (not (= key!828 (bvneg key!828))))))

(declare-fun res!74772 () Bool)

(assert (=> start!15918 (=> (not res!74772) (not e!103672))))

(declare-datatypes ((V!4019 0))(
  ( (V!4020 (val!1684 Int)) )
))
(declare-datatypes ((ValueCell!1296 0))(
  ( (ValueCellFull!1296 (v!3549 V!4019)) (EmptyCell!1296) )
))
(declare-datatypes ((array!5625 0))(
  ( (array!5626 (arr!2663 (Array (_ BitVec 32) (_ BitVec 64))) (size!2945 (_ BitVec 32))) )
))
(declare-datatypes ((array!5627 0))(
  ( (array!5628 (arr!2664 (Array (_ BitVec 32) ValueCell!1296)) (size!2946 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1500 0))(
  ( (LongMapFixedSize!1501 (defaultEntry!3192 Int) (mask!7703 (_ BitVec 32)) (extraKeys!2933 (_ BitVec 32)) (zeroValue!3035 V!4019) (minValue!3035 V!4019) (_size!799 (_ BitVec 32)) (_keys!4978 array!5625) (_values!3175 array!5627) (_vacant!799 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1500)

(declare-fun valid!706 (LongMapFixedSize!1500) Bool)

(assert (=> start!15918 (= res!74772 (valid!706 thiss!1248))))

(assert (=> start!15918 e!103672))

(declare-fun e!103669 () Bool)

(assert (=> start!15918 e!103669))

(assert (=> start!15918 true))

(declare-fun mapIsEmpty!5586 () Bool)

(declare-fun mapRes!5586 () Bool)

(assert (=> mapIsEmpty!5586 mapRes!5586))

(declare-fun b!158292 () Bool)

(declare-fun e!103673 () Bool)

(declare-fun tp_is_empty!3279 () Bool)

(assert (=> b!158292 (= e!103673 tp_is_empty!3279)))

(declare-fun b!158293 () Bool)

(declare-fun res!74769 () Bool)

(assert (=> b!158293 (=> (not res!74769) (not e!103672))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!293 0))(
  ( (MissingZero!293 (index!3340 (_ BitVec 32))) (Found!293 (index!3341 (_ BitVec 32))) (Intermediate!293 (undefined!1105 Bool) (index!3342 (_ BitVec 32)) (x!17459 (_ BitVec 32))) (Undefined!293) (MissingVacant!293 (index!3343 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5625 (_ BitVec 32)) SeekEntryResult!293)

(assert (=> b!158293 (= res!74769 ((_ is Undefined!293) (seekEntryOrOpen!0 key!828 (_keys!4978 thiss!1248) (mask!7703 thiss!1248))))))

(declare-fun e!103668 () Bool)

(declare-fun array_inv!1693 (array!5625) Bool)

(declare-fun array_inv!1694 (array!5627) Bool)

(assert (=> b!158294 (= e!103669 (and tp!12980 tp_is_empty!3279 (array_inv!1693 (_keys!4978 thiss!1248)) (array_inv!1694 (_values!3175 thiss!1248)) e!103668))))

(declare-fun b!158295 () Bool)

(declare-fun e!103671 () Bool)

(assert (=> b!158295 (= e!103668 (and e!103671 mapRes!5586))))

(declare-fun condMapEmpty!5586 () Bool)

(declare-fun mapDefault!5586 () ValueCell!1296)

(assert (=> b!158295 (= condMapEmpty!5586 (= (arr!2664 (_values!3175 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1296)) mapDefault!5586)))))

(declare-fun mapNonEmpty!5586 () Bool)

(declare-fun tp!12981 () Bool)

(assert (=> mapNonEmpty!5586 (= mapRes!5586 (and tp!12981 e!103673))))

(declare-fun mapValue!5586 () ValueCell!1296)

(declare-fun mapKey!5586 () (_ BitVec 32))

(declare-fun mapRest!5586 () (Array (_ BitVec 32) ValueCell!1296))

(assert (=> mapNonEmpty!5586 (= (arr!2664 (_values!3175 thiss!1248)) (store mapRest!5586 mapKey!5586 mapValue!5586))))

(declare-fun b!158296 () Bool)

(assert (=> b!158296 (= e!103672 (and (= (size!2946 (_values!3175 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7703 thiss!1248))) (= (size!2945 (_keys!4978 thiss!1248)) (size!2946 (_values!3175 thiss!1248))) (bvslt (mask!7703 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!158297 () Bool)

(assert (=> b!158297 (= e!103671 tp_is_empty!3279)))

(declare-fun b!158298 () Bool)

(declare-fun res!74771 () Bool)

(assert (=> b!158298 (=> (not res!74771) (not e!103672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158298 (= res!74771 (validMask!0 (mask!7703 thiss!1248)))))

(assert (= (and start!15918 res!74772) b!158291))

(assert (= (and b!158291 res!74770) b!158293))

(assert (= (and b!158293 res!74769) b!158298))

(assert (= (and b!158298 res!74771) b!158296))

(assert (= (and b!158295 condMapEmpty!5586) mapIsEmpty!5586))

(assert (= (and b!158295 (not condMapEmpty!5586)) mapNonEmpty!5586))

(assert (= (and mapNonEmpty!5586 ((_ is ValueCellFull!1296) mapValue!5586)) b!158292))

(assert (= (and b!158295 ((_ is ValueCellFull!1296) mapDefault!5586)) b!158297))

(assert (= b!158294 b!158295))

(assert (= start!15918 b!158294))

(declare-fun m!191089 () Bool)

(assert (=> b!158294 m!191089))

(declare-fun m!191091 () Bool)

(assert (=> b!158294 m!191091))

(declare-fun m!191093 () Bool)

(assert (=> start!15918 m!191093))

(declare-fun m!191095 () Bool)

(assert (=> b!158293 m!191095))

(declare-fun m!191097 () Bool)

(assert (=> mapNonEmpty!5586 m!191097))

(declare-fun m!191099 () Bool)

(assert (=> b!158298 m!191099))

(check-sat (not b_next!3477) (not b!158294) (not b!158298) b_and!9891 (not mapNonEmpty!5586) (not start!15918) tp_is_empty!3279 (not b!158293))
(check-sat b_and!9891 (not b_next!3477))
(get-model)

(declare-fun d!51161 () Bool)

(assert (=> d!51161 (= (array_inv!1693 (_keys!4978 thiss!1248)) (bvsge (size!2945 (_keys!4978 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158294 d!51161))

(declare-fun d!51163 () Bool)

(assert (=> d!51163 (= (array_inv!1694 (_values!3175 thiss!1248)) (bvsge (size!2946 (_values!3175 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158294 d!51163))

(declare-fun d!51165 () Bool)

(declare-fun res!74791 () Bool)

(declare-fun e!103694 () Bool)

(assert (=> d!51165 (=> (not res!74791) (not e!103694))))

(declare-fun simpleValid!112 (LongMapFixedSize!1500) Bool)

(assert (=> d!51165 (= res!74791 (simpleValid!112 thiss!1248))))

(assert (=> d!51165 (= (valid!706 thiss!1248) e!103694)))

(declare-fun b!158329 () Bool)

(declare-fun res!74792 () Bool)

(assert (=> b!158329 (=> (not res!74792) (not e!103694))))

(declare-fun arrayCountValidKeys!0 (array!5625 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158329 (= res!74792 (= (arrayCountValidKeys!0 (_keys!4978 thiss!1248) #b00000000000000000000000000000000 (size!2945 (_keys!4978 thiss!1248))) (_size!799 thiss!1248)))))

(declare-fun b!158330 () Bool)

(declare-fun res!74793 () Bool)

(assert (=> b!158330 (=> (not res!74793) (not e!103694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5625 (_ BitVec 32)) Bool)

(assert (=> b!158330 (= res!74793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4978 thiss!1248) (mask!7703 thiss!1248)))))

(declare-fun b!158331 () Bool)

(declare-datatypes ((List!1889 0))(
  ( (Nil!1886) (Cons!1885 (h!2496 (_ BitVec 64)) (t!6691 List!1889)) )
))
(declare-fun arrayNoDuplicates!0 (array!5625 (_ BitVec 32) List!1889) Bool)

(assert (=> b!158331 (= e!103694 (arrayNoDuplicates!0 (_keys!4978 thiss!1248) #b00000000000000000000000000000000 Nil!1886))))

(assert (= (and d!51165 res!74791) b!158329))

(assert (= (and b!158329 res!74792) b!158330))

(assert (= (and b!158330 res!74793) b!158331))

(declare-fun m!191113 () Bool)

(assert (=> d!51165 m!191113))

(declare-fun m!191115 () Bool)

(assert (=> b!158329 m!191115))

(declare-fun m!191117 () Bool)

(assert (=> b!158330 m!191117))

(declare-fun m!191119 () Bool)

(assert (=> b!158331 m!191119))

(assert (=> start!15918 d!51165))

(declare-fun b!158344 () Bool)

(declare-fun e!103703 () SeekEntryResult!293)

(declare-fun lt!81844 () SeekEntryResult!293)

(assert (=> b!158344 (= e!103703 (Found!293 (index!3342 lt!81844)))))

(declare-fun b!158345 () Bool)

(declare-fun e!103702 () SeekEntryResult!293)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5625 (_ BitVec 32)) SeekEntryResult!293)

(assert (=> b!158345 (= e!103702 (seekKeyOrZeroReturnVacant!0 (x!17459 lt!81844) (index!3342 lt!81844) (index!3342 lt!81844) key!828 (_keys!4978 thiss!1248) (mask!7703 thiss!1248)))))

(declare-fun b!158346 () Bool)

(assert (=> b!158346 (= e!103702 (MissingZero!293 (index!3342 lt!81844)))))

(declare-fun d!51167 () Bool)

(declare-fun lt!81842 () SeekEntryResult!293)

(assert (=> d!51167 (and (or ((_ is Undefined!293) lt!81842) (not ((_ is Found!293) lt!81842)) (and (bvsge (index!3341 lt!81842) #b00000000000000000000000000000000) (bvslt (index!3341 lt!81842) (size!2945 (_keys!4978 thiss!1248))))) (or ((_ is Undefined!293) lt!81842) ((_ is Found!293) lt!81842) (not ((_ is MissingZero!293) lt!81842)) (and (bvsge (index!3340 lt!81842) #b00000000000000000000000000000000) (bvslt (index!3340 lt!81842) (size!2945 (_keys!4978 thiss!1248))))) (or ((_ is Undefined!293) lt!81842) ((_ is Found!293) lt!81842) ((_ is MissingZero!293) lt!81842) (not ((_ is MissingVacant!293) lt!81842)) (and (bvsge (index!3343 lt!81842) #b00000000000000000000000000000000) (bvslt (index!3343 lt!81842) (size!2945 (_keys!4978 thiss!1248))))) (or ((_ is Undefined!293) lt!81842) (ite ((_ is Found!293) lt!81842) (= (select (arr!2663 (_keys!4978 thiss!1248)) (index!3341 lt!81842)) key!828) (ite ((_ is MissingZero!293) lt!81842) (= (select (arr!2663 (_keys!4978 thiss!1248)) (index!3340 lt!81842)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!293) lt!81842) (= (select (arr!2663 (_keys!4978 thiss!1248)) (index!3343 lt!81842)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!103701 () SeekEntryResult!293)

(assert (=> d!51167 (= lt!81842 e!103701)))

(declare-fun c!29812 () Bool)

(assert (=> d!51167 (= c!29812 (and ((_ is Intermediate!293) lt!81844) (undefined!1105 lt!81844)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5625 (_ BitVec 32)) SeekEntryResult!293)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51167 (= lt!81844 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7703 thiss!1248)) key!828 (_keys!4978 thiss!1248) (mask!7703 thiss!1248)))))

(assert (=> d!51167 (validMask!0 (mask!7703 thiss!1248))))

(assert (=> d!51167 (= (seekEntryOrOpen!0 key!828 (_keys!4978 thiss!1248) (mask!7703 thiss!1248)) lt!81842)))

(declare-fun b!158347 () Bool)

(assert (=> b!158347 (= e!103701 Undefined!293)))

(declare-fun b!158348 () Bool)

(assert (=> b!158348 (= e!103701 e!103703)))

(declare-fun lt!81843 () (_ BitVec 64))

(assert (=> b!158348 (= lt!81843 (select (arr!2663 (_keys!4978 thiss!1248)) (index!3342 lt!81844)))))

(declare-fun c!29811 () Bool)

(assert (=> b!158348 (= c!29811 (= lt!81843 key!828))))

(declare-fun b!158349 () Bool)

(declare-fun c!29810 () Bool)

(assert (=> b!158349 (= c!29810 (= lt!81843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158349 (= e!103703 e!103702)))

(assert (= (and d!51167 c!29812) b!158347))

(assert (= (and d!51167 (not c!29812)) b!158348))

(assert (= (and b!158348 c!29811) b!158344))

(assert (= (and b!158348 (not c!29811)) b!158349))

(assert (= (and b!158349 c!29810) b!158346))

(assert (= (and b!158349 (not c!29810)) b!158345))

(declare-fun m!191121 () Bool)

(assert (=> b!158345 m!191121))

(declare-fun m!191123 () Bool)

(assert (=> d!51167 m!191123))

(declare-fun m!191125 () Bool)

(assert (=> d!51167 m!191125))

(declare-fun m!191127 () Bool)

(assert (=> d!51167 m!191127))

(declare-fun m!191129 () Bool)

(assert (=> d!51167 m!191129))

(declare-fun m!191131 () Bool)

(assert (=> d!51167 m!191131))

(assert (=> d!51167 m!191099))

(assert (=> d!51167 m!191123))

(declare-fun m!191133 () Bool)

(assert (=> b!158348 m!191133))

(assert (=> b!158293 d!51167))

(declare-fun d!51169 () Bool)

(assert (=> d!51169 (= (validMask!0 (mask!7703 thiss!1248)) (and (or (= (mask!7703 thiss!1248) #b00000000000000000000000000000111) (= (mask!7703 thiss!1248) #b00000000000000000000000000001111) (= (mask!7703 thiss!1248) #b00000000000000000000000000011111) (= (mask!7703 thiss!1248) #b00000000000000000000000000111111) (= (mask!7703 thiss!1248) #b00000000000000000000000001111111) (= (mask!7703 thiss!1248) #b00000000000000000000000011111111) (= (mask!7703 thiss!1248) #b00000000000000000000000111111111) (= (mask!7703 thiss!1248) #b00000000000000000000001111111111) (= (mask!7703 thiss!1248) #b00000000000000000000011111111111) (= (mask!7703 thiss!1248) #b00000000000000000000111111111111) (= (mask!7703 thiss!1248) #b00000000000000000001111111111111) (= (mask!7703 thiss!1248) #b00000000000000000011111111111111) (= (mask!7703 thiss!1248) #b00000000000000000111111111111111) (= (mask!7703 thiss!1248) #b00000000000000001111111111111111) (= (mask!7703 thiss!1248) #b00000000000000011111111111111111) (= (mask!7703 thiss!1248) #b00000000000000111111111111111111) (= (mask!7703 thiss!1248) #b00000000000001111111111111111111) (= (mask!7703 thiss!1248) #b00000000000011111111111111111111) (= (mask!7703 thiss!1248) #b00000000000111111111111111111111) (= (mask!7703 thiss!1248) #b00000000001111111111111111111111) (= (mask!7703 thiss!1248) #b00000000011111111111111111111111) (= (mask!7703 thiss!1248) #b00000000111111111111111111111111) (= (mask!7703 thiss!1248) #b00000001111111111111111111111111) (= (mask!7703 thiss!1248) #b00000011111111111111111111111111) (= (mask!7703 thiss!1248) #b00000111111111111111111111111111) (= (mask!7703 thiss!1248) #b00001111111111111111111111111111) (= (mask!7703 thiss!1248) #b00011111111111111111111111111111) (= (mask!7703 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7703 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158298 d!51169))

(declare-fun condMapEmpty!5592 () Bool)

(declare-fun mapDefault!5592 () ValueCell!1296)

(assert (=> mapNonEmpty!5586 (= condMapEmpty!5592 (= mapRest!5586 ((as const (Array (_ BitVec 32) ValueCell!1296)) mapDefault!5592)))))

(declare-fun e!103709 () Bool)

(declare-fun mapRes!5592 () Bool)

(assert (=> mapNonEmpty!5586 (= tp!12981 (and e!103709 mapRes!5592))))

(declare-fun mapNonEmpty!5592 () Bool)

(declare-fun tp!12990 () Bool)

(declare-fun e!103708 () Bool)

(assert (=> mapNonEmpty!5592 (= mapRes!5592 (and tp!12990 e!103708))))

(declare-fun mapValue!5592 () ValueCell!1296)

(declare-fun mapRest!5592 () (Array (_ BitVec 32) ValueCell!1296))

(declare-fun mapKey!5592 () (_ BitVec 32))

(assert (=> mapNonEmpty!5592 (= mapRest!5586 (store mapRest!5592 mapKey!5592 mapValue!5592))))

(declare-fun mapIsEmpty!5592 () Bool)

(assert (=> mapIsEmpty!5592 mapRes!5592))

(declare-fun b!158357 () Bool)

(assert (=> b!158357 (= e!103709 tp_is_empty!3279)))

(declare-fun b!158356 () Bool)

(assert (=> b!158356 (= e!103708 tp_is_empty!3279)))

(assert (= (and mapNonEmpty!5586 condMapEmpty!5592) mapIsEmpty!5592))

(assert (= (and mapNonEmpty!5586 (not condMapEmpty!5592)) mapNonEmpty!5592))

(assert (= (and mapNonEmpty!5592 ((_ is ValueCellFull!1296) mapValue!5592)) b!158356))

(assert (= (and mapNonEmpty!5586 ((_ is ValueCellFull!1296) mapDefault!5592)) b!158357))

(declare-fun m!191135 () Bool)

(assert (=> mapNonEmpty!5592 m!191135))

(check-sat (not b!158345) (not d!51167) b_and!9891 (not b!158330) (not b!158329) (not d!51165) tp_is_empty!3279 (not b!158331) (not mapNonEmpty!5592) (not b_next!3477))
(check-sat b_and!9891 (not b_next!3477))
