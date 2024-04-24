; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15920 () Bool)

(assert start!15920)

(declare-fun b!158320 () Bool)

(declare-fun b_free!3475 () Bool)

(declare-fun b_next!3475 () Bool)

(assert (=> b!158320 (= b_free!3475 (not b_next!3475))))

(declare-fun tp!12974 () Bool)

(declare-fun b_and!9903 () Bool)

(assert (=> b!158320 (= tp!12974 b_and!9903)))

(declare-fun mapNonEmpty!5583 () Bool)

(declare-fun mapRes!5583 () Bool)

(declare-fun tp!12975 () Bool)

(declare-fun e!103679 () Bool)

(assert (=> mapNonEmpty!5583 (= mapRes!5583 (and tp!12975 e!103679))))

(declare-datatypes ((V!4017 0))(
  ( (V!4018 (val!1683 Int)) )
))
(declare-datatypes ((ValueCell!1295 0))(
  ( (ValueCellFull!1295 (v!3549 V!4017)) (EmptyCell!1295) )
))
(declare-fun mapValue!5583 () ValueCell!1295)

(declare-datatypes ((array!5607 0))(
  ( (array!5608 (arr!2654 (Array (_ BitVec 32) (_ BitVec 64))) (size!2936 (_ BitVec 32))) )
))
(declare-datatypes ((array!5609 0))(
  ( (array!5610 (arr!2655 (Array (_ BitVec 32) ValueCell!1295)) (size!2937 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1498 0))(
  ( (LongMapFixedSize!1499 (defaultEntry!3191 Int) (mask!7702 (_ BitVec 32)) (extraKeys!2932 (_ BitVec 32)) (zeroValue!3034 V!4017) (minValue!3034 V!4017) (_size!798 (_ BitVec 32)) (_keys!4977 array!5607) (_values!3174 array!5609) (_vacant!798 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1498)

(declare-fun mapRest!5583 () (Array (_ BitVec 32) ValueCell!1295))

(declare-fun mapKey!5583 () (_ BitVec 32))

(assert (=> mapNonEmpty!5583 (= (arr!2655 (_values!3174 thiss!1248)) (store mapRest!5583 mapKey!5583 mapValue!5583))))

(declare-fun b!158314 () Bool)

(declare-fun e!103676 () Bool)

(declare-fun tp_is_empty!3277 () Bool)

(assert (=> b!158314 (= e!103676 tp_is_empty!3277)))

(declare-fun mapIsEmpty!5583 () Bool)

(assert (=> mapIsEmpty!5583 mapRes!5583))

(declare-fun b!158315 () Bool)

(declare-fun e!103675 () Bool)

(assert (=> b!158315 (= e!103675 (and e!103676 mapRes!5583))))

(declare-fun condMapEmpty!5583 () Bool)

(declare-fun mapDefault!5583 () ValueCell!1295)

(assert (=> b!158315 (= condMapEmpty!5583 (= (arr!2655 (_values!3174 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1295)) mapDefault!5583)))))

(declare-fun b!158316 () Bool)

(declare-fun e!103677 () Bool)

(assert (=> b!158316 (= e!103677 (and (= (size!2937 (_values!3174 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7702 thiss!1248))) (= (size!2936 (_keys!4977 thiss!1248)) (size!2937 (_values!3174 thiss!1248))) (bvslt (mask!7702 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun res!74780 () Bool)

(assert (=> start!15920 (=> (not res!74780) (not e!103677))))

(declare-fun valid!725 (LongMapFixedSize!1498) Bool)

(assert (=> start!15920 (= res!74780 (valid!725 thiss!1248))))

(assert (=> start!15920 e!103677))

(declare-fun e!103674 () Bool)

(assert (=> start!15920 e!103674))

(assert (=> start!15920 true))

(declare-fun b!158317 () Bool)

(declare-fun res!74778 () Bool)

(assert (=> b!158317 (=> (not res!74778) (not e!103677))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!158317 (= res!74778 (not (= key!828 (bvneg key!828))))))

(declare-fun b!158318 () Bool)

(declare-fun res!74781 () Bool)

(assert (=> b!158318 (=> (not res!74781) (not e!103677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158318 (= res!74781 (validMask!0 (mask!7702 thiss!1248)))))

(declare-fun b!158319 () Bool)

(assert (=> b!158319 (= e!103679 tp_is_empty!3277)))

(declare-fun array_inv!1693 (array!5607) Bool)

(declare-fun array_inv!1694 (array!5609) Bool)

(assert (=> b!158320 (= e!103674 (and tp!12974 tp_is_empty!3277 (array_inv!1693 (_keys!4977 thiss!1248)) (array_inv!1694 (_values!3174 thiss!1248)) e!103675))))

(declare-fun b!158321 () Bool)

(declare-fun res!74779 () Bool)

(assert (=> b!158321 (=> (not res!74779) (not e!103677))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!289 0))(
  ( (MissingZero!289 (index!3324 (_ BitVec 32))) (Found!289 (index!3325 (_ BitVec 32))) (Intermediate!289 (undefined!1101 Bool) (index!3326 (_ BitVec 32)) (x!17455 (_ BitVec 32))) (Undefined!289) (MissingVacant!289 (index!3327 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5607 (_ BitVec 32)) SeekEntryResult!289)

(assert (=> b!158321 (= res!74779 ((_ is Undefined!289) (seekEntryOrOpen!0 key!828 (_keys!4977 thiss!1248) (mask!7702 thiss!1248))))))

(assert (= (and start!15920 res!74780) b!158317))

(assert (= (and b!158317 res!74778) b!158321))

(assert (= (and b!158321 res!74779) b!158318))

(assert (= (and b!158318 res!74781) b!158316))

(assert (= (and b!158315 condMapEmpty!5583) mapIsEmpty!5583))

(assert (= (and b!158315 (not condMapEmpty!5583)) mapNonEmpty!5583))

(assert (= (and mapNonEmpty!5583 ((_ is ValueCellFull!1295) mapValue!5583)) b!158319))

(assert (= (and b!158315 ((_ is ValueCellFull!1295) mapDefault!5583)) b!158314))

(assert (= b!158320 b!158315))

(assert (= start!15920 b!158320))

(declare-fun m!191259 () Bool)

(assert (=> start!15920 m!191259))

(declare-fun m!191261 () Bool)

(assert (=> b!158321 m!191261))

(declare-fun m!191263 () Bool)

(assert (=> mapNonEmpty!5583 m!191263))

(declare-fun m!191265 () Bool)

(assert (=> b!158320 m!191265))

(declare-fun m!191267 () Bool)

(assert (=> b!158320 m!191267))

(declare-fun m!191269 () Bool)

(assert (=> b!158318 m!191269))

(check-sat (not b!158318) (not b_next!3475) b_and!9903 (not b!158321) (not b!158320) tp_is_empty!3277 (not mapNonEmpty!5583) (not start!15920))
(check-sat b_and!9903 (not b_next!3475))
(get-model)

(declare-fun d!51235 () Bool)

(declare-fun res!74812 () Bool)

(declare-fun e!103718 () Bool)

(assert (=> d!51235 (=> (not res!74812) (not e!103718))))

(declare-fun simpleValid!112 (LongMapFixedSize!1498) Bool)

(assert (=> d!51235 (= res!74812 (simpleValid!112 thiss!1248))))

(assert (=> d!51235 (= (valid!725 thiss!1248) e!103718)))

(declare-fun b!158376 () Bool)

(declare-fun res!74813 () Bool)

(assert (=> b!158376 (=> (not res!74813) (not e!103718))))

(declare-fun arrayCountValidKeys!0 (array!5607 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158376 (= res!74813 (= (arrayCountValidKeys!0 (_keys!4977 thiss!1248) #b00000000000000000000000000000000 (size!2936 (_keys!4977 thiss!1248))) (_size!798 thiss!1248)))))

(declare-fun b!158377 () Bool)

(declare-fun res!74814 () Bool)

(assert (=> b!158377 (=> (not res!74814) (not e!103718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5607 (_ BitVec 32)) Bool)

(assert (=> b!158377 (= res!74814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4977 thiss!1248) (mask!7702 thiss!1248)))))

(declare-fun b!158378 () Bool)

(declare-datatypes ((List!1873 0))(
  ( (Nil!1870) (Cons!1869 (h!2480 (_ BitVec 64)) (t!6667 List!1873)) )
))
(declare-fun arrayNoDuplicates!0 (array!5607 (_ BitVec 32) List!1873) Bool)

(assert (=> b!158378 (= e!103718 (arrayNoDuplicates!0 (_keys!4977 thiss!1248) #b00000000000000000000000000000000 Nil!1870))))

(assert (= (and d!51235 res!74812) b!158376))

(assert (= (and b!158376 res!74813) b!158377))

(assert (= (and b!158377 res!74814) b!158378))

(declare-fun m!191295 () Bool)

(assert (=> d!51235 m!191295))

(declare-fun m!191297 () Bool)

(assert (=> b!158376 m!191297))

(declare-fun m!191299 () Bool)

(assert (=> b!158377 m!191299))

(declare-fun m!191301 () Bool)

(assert (=> b!158378 m!191301))

(assert (=> start!15920 d!51235))

(declare-fun d!51237 () Bool)

(assert (=> d!51237 (= (array_inv!1693 (_keys!4977 thiss!1248)) (bvsge (size!2936 (_keys!4977 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158320 d!51237))

(declare-fun d!51239 () Bool)

(assert (=> d!51239 (= (array_inv!1694 (_values!3174 thiss!1248)) (bvsge (size!2937 (_values!3174 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158320 d!51239))

(declare-fun d!51241 () Bool)

(assert (=> d!51241 (= (validMask!0 (mask!7702 thiss!1248)) (and (or (= (mask!7702 thiss!1248) #b00000000000000000000000000000111) (= (mask!7702 thiss!1248) #b00000000000000000000000000001111) (= (mask!7702 thiss!1248) #b00000000000000000000000000011111) (= (mask!7702 thiss!1248) #b00000000000000000000000000111111) (= (mask!7702 thiss!1248) #b00000000000000000000000001111111) (= (mask!7702 thiss!1248) #b00000000000000000000000011111111) (= (mask!7702 thiss!1248) #b00000000000000000000000111111111) (= (mask!7702 thiss!1248) #b00000000000000000000001111111111) (= (mask!7702 thiss!1248) #b00000000000000000000011111111111) (= (mask!7702 thiss!1248) #b00000000000000000000111111111111) (= (mask!7702 thiss!1248) #b00000000000000000001111111111111) (= (mask!7702 thiss!1248) #b00000000000000000011111111111111) (= (mask!7702 thiss!1248) #b00000000000000000111111111111111) (= (mask!7702 thiss!1248) #b00000000000000001111111111111111) (= (mask!7702 thiss!1248) #b00000000000000011111111111111111) (= (mask!7702 thiss!1248) #b00000000000000111111111111111111) (= (mask!7702 thiss!1248) #b00000000000001111111111111111111) (= (mask!7702 thiss!1248) #b00000000000011111111111111111111) (= (mask!7702 thiss!1248) #b00000000000111111111111111111111) (= (mask!7702 thiss!1248) #b00000000001111111111111111111111) (= (mask!7702 thiss!1248) #b00000000011111111111111111111111) (= (mask!7702 thiss!1248) #b00000000111111111111111111111111) (= (mask!7702 thiss!1248) #b00000001111111111111111111111111) (= (mask!7702 thiss!1248) #b00000011111111111111111111111111) (= (mask!7702 thiss!1248) #b00000111111111111111111111111111) (= (mask!7702 thiss!1248) #b00001111111111111111111111111111) (= (mask!7702 thiss!1248) #b00011111111111111111111111111111) (= (mask!7702 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7702 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158318 d!51241))

(declare-fun b!158391 () Bool)

(declare-fun e!103726 () SeekEntryResult!289)

(declare-fun e!103727 () SeekEntryResult!289)

(assert (=> b!158391 (= e!103726 e!103727)))

(declare-fun lt!81903 () (_ BitVec 64))

(declare-fun lt!81901 () SeekEntryResult!289)

(assert (=> b!158391 (= lt!81903 (select (arr!2654 (_keys!4977 thiss!1248)) (index!3326 lt!81901)))))

(declare-fun c!29824 () Bool)

(assert (=> b!158391 (= c!29824 (= lt!81903 key!828))))

(declare-fun b!158392 () Bool)

(declare-fun e!103725 () SeekEntryResult!289)

(assert (=> b!158392 (= e!103725 (MissingZero!289 (index!3326 lt!81901)))))

(declare-fun b!158393 () Bool)

(assert (=> b!158393 (= e!103727 (Found!289 (index!3326 lt!81901)))))

(declare-fun b!158394 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5607 (_ BitVec 32)) SeekEntryResult!289)

(assert (=> b!158394 (= e!103725 (seekKeyOrZeroReturnVacant!0 (x!17455 lt!81901) (index!3326 lt!81901) (index!3326 lt!81901) key!828 (_keys!4977 thiss!1248) (mask!7702 thiss!1248)))))

(declare-fun d!51243 () Bool)

(declare-fun lt!81902 () SeekEntryResult!289)

(assert (=> d!51243 (and (or ((_ is Undefined!289) lt!81902) (not ((_ is Found!289) lt!81902)) (and (bvsge (index!3325 lt!81902) #b00000000000000000000000000000000) (bvslt (index!3325 lt!81902) (size!2936 (_keys!4977 thiss!1248))))) (or ((_ is Undefined!289) lt!81902) ((_ is Found!289) lt!81902) (not ((_ is MissingZero!289) lt!81902)) (and (bvsge (index!3324 lt!81902) #b00000000000000000000000000000000) (bvslt (index!3324 lt!81902) (size!2936 (_keys!4977 thiss!1248))))) (or ((_ is Undefined!289) lt!81902) ((_ is Found!289) lt!81902) ((_ is MissingZero!289) lt!81902) (not ((_ is MissingVacant!289) lt!81902)) (and (bvsge (index!3327 lt!81902) #b00000000000000000000000000000000) (bvslt (index!3327 lt!81902) (size!2936 (_keys!4977 thiss!1248))))) (or ((_ is Undefined!289) lt!81902) (ite ((_ is Found!289) lt!81902) (= (select (arr!2654 (_keys!4977 thiss!1248)) (index!3325 lt!81902)) key!828) (ite ((_ is MissingZero!289) lt!81902) (= (select (arr!2654 (_keys!4977 thiss!1248)) (index!3324 lt!81902)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!289) lt!81902) (= (select (arr!2654 (_keys!4977 thiss!1248)) (index!3327 lt!81902)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51243 (= lt!81902 e!103726)))

(declare-fun c!29823 () Bool)

(assert (=> d!51243 (= c!29823 (and ((_ is Intermediate!289) lt!81901) (undefined!1101 lt!81901)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5607 (_ BitVec 32)) SeekEntryResult!289)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51243 (= lt!81901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7702 thiss!1248)) key!828 (_keys!4977 thiss!1248) (mask!7702 thiss!1248)))))

(assert (=> d!51243 (validMask!0 (mask!7702 thiss!1248))))

(assert (=> d!51243 (= (seekEntryOrOpen!0 key!828 (_keys!4977 thiss!1248) (mask!7702 thiss!1248)) lt!81902)))

(declare-fun b!158395 () Bool)

(assert (=> b!158395 (= e!103726 Undefined!289)))

(declare-fun b!158396 () Bool)

(declare-fun c!29825 () Bool)

(assert (=> b!158396 (= c!29825 (= lt!81903 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158396 (= e!103727 e!103725)))

(assert (= (and d!51243 c!29823) b!158395))

(assert (= (and d!51243 (not c!29823)) b!158391))

(assert (= (and b!158391 c!29824) b!158393))

(assert (= (and b!158391 (not c!29824)) b!158396))

(assert (= (and b!158396 c!29825) b!158392))

(assert (= (and b!158396 (not c!29825)) b!158394))

(declare-fun m!191303 () Bool)

(assert (=> b!158391 m!191303))

(declare-fun m!191305 () Bool)

(assert (=> b!158394 m!191305))

(assert (=> d!51243 m!191269))

(declare-fun m!191307 () Bool)

(assert (=> d!51243 m!191307))

(declare-fun m!191309 () Bool)

(assert (=> d!51243 m!191309))

(declare-fun m!191311 () Bool)

(assert (=> d!51243 m!191311))

(assert (=> d!51243 m!191309))

(declare-fun m!191313 () Bool)

(assert (=> d!51243 m!191313))

(declare-fun m!191315 () Bool)

(assert (=> d!51243 m!191315))

(assert (=> b!158321 d!51243))

(declare-fun b!158403 () Bool)

(declare-fun e!103732 () Bool)

(assert (=> b!158403 (= e!103732 tp_is_empty!3277)))

(declare-fun b!158404 () Bool)

(declare-fun e!103733 () Bool)

(assert (=> b!158404 (= e!103733 tp_is_empty!3277)))

(declare-fun condMapEmpty!5592 () Bool)

(declare-fun mapDefault!5592 () ValueCell!1295)

(assert (=> mapNonEmpty!5583 (= condMapEmpty!5592 (= mapRest!5583 ((as const (Array (_ BitVec 32) ValueCell!1295)) mapDefault!5592)))))

(declare-fun mapRes!5592 () Bool)

(assert (=> mapNonEmpty!5583 (= tp!12975 (and e!103733 mapRes!5592))))

(declare-fun mapNonEmpty!5592 () Bool)

(declare-fun tp!12990 () Bool)

(assert (=> mapNonEmpty!5592 (= mapRes!5592 (and tp!12990 e!103732))))

(declare-fun mapRest!5592 () (Array (_ BitVec 32) ValueCell!1295))

(declare-fun mapValue!5592 () ValueCell!1295)

(declare-fun mapKey!5592 () (_ BitVec 32))

(assert (=> mapNonEmpty!5592 (= mapRest!5583 (store mapRest!5592 mapKey!5592 mapValue!5592))))

(declare-fun mapIsEmpty!5592 () Bool)

(assert (=> mapIsEmpty!5592 mapRes!5592))

(assert (= (and mapNonEmpty!5583 condMapEmpty!5592) mapIsEmpty!5592))

(assert (= (and mapNonEmpty!5583 (not condMapEmpty!5592)) mapNonEmpty!5592))

(assert (= (and mapNonEmpty!5592 ((_ is ValueCellFull!1295) mapValue!5592)) b!158403))

(assert (= (and mapNonEmpty!5583 ((_ is ValueCellFull!1295) mapDefault!5592)) b!158404))

(declare-fun m!191317 () Bool)

(assert (=> mapNonEmpty!5592 m!191317))

(check-sat (not b!158378) (not d!51235) (not b_next!3475) (not b!158376) b_and!9903 tp_is_empty!3277 (not d!51243) (not b!158377) (not mapNonEmpty!5592) (not b!158394))
(check-sat b_and!9903 (not b_next!3475))
