; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16404 () Bool)

(assert start!16404)

(declare-fun b!163408 () Bool)

(declare-fun b_free!3793 () Bool)

(declare-fun b_next!3793 () Bool)

(assert (=> b!163408 (= b_free!3793 (not b_next!3793))))

(declare-fun tp!13963 () Bool)

(declare-fun b_and!10221 () Bool)

(assert (=> b!163408 (= tp!13963 b_and!10221)))

(declare-fun b!163406 () Bool)

(declare-fun e!107200 () Bool)

(declare-fun e!107202 () Bool)

(declare-fun mapRes!6094 () Bool)

(assert (=> b!163406 (= e!107200 (and e!107202 mapRes!6094))))

(declare-fun condMapEmpty!6094 () Bool)

(declare-datatypes ((V!4441 0))(
  ( (V!4442 (val!1842 Int)) )
))
(declare-datatypes ((ValueCell!1454 0))(
  ( (ValueCellFull!1454 (v!3708 V!4441)) (EmptyCell!1454) )
))
(declare-datatypes ((array!6263 0))(
  ( (array!6264 (arr!2972 (Array (_ BitVec 32) (_ BitVec 64))) (size!3258 (_ BitVec 32))) )
))
(declare-datatypes ((array!6265 0))(
  ( (array!6266 (arr!2973 (Array (_ BitVec 32) ValueCell!1454)) (size!3259 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1816 0))(
  ( (LongMapFixedSize!1817 (defaultEntry!3350 Int) (mask!8006 (_ BitVec 32)) (extraKeys!3091 (_ BitVec 32)) (zeroValue!3193 V!4441) (minValue!3193 V!4441) (_size!957 (_ BitVec 32)) (_keys!5161 array!6263) (_values!3333 array!6265) (_vacant!957 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1816)

(declare-fun mapDefault!6094 () ValueCell!1454)

(assert (=> b!163406 (= condMapEmpty!6094 (= (arr!2973 (_values!3333 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1454)) mapDefault!6094)))))

(declare-fun b!163407 () Bool)

(declare-fun e!107205 () Bool)

(declare-fun e!107204 () Bool)

(assert (=> b!163407 (= e!107205 e!107204)))

(declare-fun res!77340 () Bool)

(assert (=> b!163407 (=> (not res!77340) (not e!107204))))

(declare-datatypes ((SeekEntryResult!399 0))(
  ( (MissingZero!399 (index!3764 (_ BitVec 32))) (Found!399 (index!3765 (_ BitVec 32))) (Intermediate!399 (undefined!1211 Bool) (index!3766 (_ BitVec 32)) (x!18105 (_ BitVec 32))) (Undefined!399) (MissingVacant!399 (index!3767 (_ BitVec 32))) )
))
(declare-fun lt!82728 () SeekEntryResult!399)

(get-info :version)

(assert (=> b!163407 (= res!77340 (and (not ((_ is Undefined!399) lt!82728)) (not ((_ is MissingVacant!399) lt!82728)) (not ((_ is MissingZero!399) lt!82728)) ((_ is Found!399) lt!82728)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6263 (_ BitVec 32)) SeekEntryResult!399)

(assert (=> b!163407 (= lt!82728 (seekEntryOrOpen!0 key!828 (_keys!5161 thiss!1248) (mask!8006 thiss!1248)))))

(declare-fun mapIsEmpty!6094 () Bool)

(assert (=> mapIsEmpty!6094 mapRes!6094))

(declare-fun mapNonEmpty!6094 () Bool)

(declare-fun tp!13962 () Bool)

(declare-fun e!107203 () Bool)

(assert (=> mapNonEmpty!6094 (= mapRes!6094 (and tp!13962 e!107203))))

(declare-fun mapKey!6094 () (_ BitVec 32))

(declare-fun mapValue!6094 () ValueCell!1454)

(declare-fun mapRest!6094 () (Array (_ BitVec 32) ValueCell!1454))

(assert (=> mapNonEmpty!6094 (= (arr!2973 (_values!3333 thiss!1248)) (store mapRest!6094 mapKey!6094 mapValue!6094))))

(declare-fun e!107206 () Bool)

(declare-fun tp_is_empty!3595 () Bool)

(declare-fun array_inv!1909 (array!6263) Bool)

(declare-fun array_inv!1910 (array!6265) Bool)

(assert (=> b!163408 (= e!107206 (and tp!13963 tp_is_empty!3595 (array_inv!1909 (_keys!5161 thiss!1248)) (array_inv!1910 (_values!3333 thiss!1248)) e!107200))))

(declare-fun res!77338 () Bool)

(assert (=> start!16404 (=> (not res!77338) (not e!107205))))

(declare-fun valid!835 (LongMapFixedSize!1816) Bool)

(assert (=> start!16404 (= res!77338 (valid!835 thiss!1248))))

(assert (=> start!16404 e!107205))

(assert (=> start!16404 e!107206))

(assert (=> start!16404 true))

(declare-fun b!163409 () Bool)

(assert (=> b!163409 (= e!107204 (and (= (size!3259 (_values!3333 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8006 thiss!1248))) (= (size!3258 (_keys!5161 thiss!1248)) (size!3259 (_values!3333 thiss!1248))) (bvsge (mask!8006 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3091 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!163410 () Bool)

(assert (=> b!163410 (= e!107202 tp_is_empty!3595)))

(declare-fun b!163411 () Bool)

(assert (=> b!163411 (= e!107203 tp_is_empty!3595)))

(declare-fun b!163412 () Bool)

(declare-fun res!77341 () Bool)

(assert (=> b!163412 (=> (not res!77341) (not e!107204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163412 (= res!77341 (validMask!0 (mask!8006 thiss!1248)))))

(declare-fun b!163413 () Bool)

(declare-fun res!77339 () Bool)

(assert (=> b!163413 (=> (not res!77339) (not e!107205))))

(assert (=> b!163413 (= res!77339 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16404 res!77338) b!163413))

(assert (= (and b!163413 res!77339) b!163407))

(assert (= (and b!163407 res!77340) b!163412))

(assert (= (and b!163412 res!77341) b!163409))

(assert (= (and b!163406 condMapEmpty!6094) mapIsEmpty!6094))

(assert (= (and b!163406 (not condMapEmpty!6094)) mapNonEmpty!6094))

(assert (= (and mapNonEmpty!6094 ((_ is ValueCellFull!1454) mapValue!6094)) b!163411))

(assert (= (and b!163406 ((_ is ValueCellFull!1454) mapDefault!6094)) b!163410))

(assert (= b!163408 b!163406))

(assert (= start!16404 b!163408))

(declare-fun m!194253 () Bool)

(assert (=> b!163412 m!194253))

(declare-fun m!194255 () Bool)

(assert (=> b!163408 m!194255))

(declare-fun m!194257 () Bool)

(assert (=> b!163408 m!194257))

(declare-fun m!194259 () Bool)

(assert (=> start!16404 m!194259))

(declare-fun m!194261 () Bool)

(assert (=> b!163407 m!194261))

(declare-fun m!194263 () Bool)

(assert (=> mapNonEmpty!6094 m!194263))

(check-sat (not b!163412) (not b_next!3793) b_and!10221 (not b!163408) tp_is_empty!3595 (not mapNonEmpty!6094) (not start!16404) (not b!163407))
(check-sat b_and!10221 (not b_next!3793))
(get-model)

(declare-fun b!163474 () Bool)

(declare-fun e!107255 () SeekEntryResult!399)

(declare-fun e!107257 () SeekEntryResult!399)

(assert (=> b!163474 (= e!107255 e!107257)))

(declare-fun lt!82741 () (_ BitVec 64))

(declare-fun lt!82742 () SeekEntryResult!399)

(assert (=> b!163474 (= lt!82741 (select (arr!2972 (_keys!5161 thiss!1248)) (index!3766 lt!82742)))))

(declare-fun c!30094 () Bool)

(assert (=> b!163474 (= c!30094 (= lt!82741 key!828))))

(declare-fun b!163475 () Bool)

(assert (=> b!163475 (= e!107257 (Found!399 (index!3766 lt!82742)))))

(declare-fun b!163476 () Bool)

(assert (=> b!163476 (= e!107255 Undefined!399)))

(declare-fun d!51507 () Bool)

(declare-fun lt!82743 () SeekEntryResult!399)

(assert (=> d!51507 (and (or ((_ is Undefined!399) lt!82743) (not ((_ is Found!399) lt!82743)) (and (bvsge (index!3765 lt!82743) #b00000000000000000000000000000000) (bvslt (index!3765 lt!82743) (size!3258 (_keys!5161 thiss!1248))))) (or ((_ is Undefined!399) lt!82743) ((_ is Found!399) lt!82743) (not ((_ is MissingZero!399) lt!82743)) (and (bvsge (index!3764 lt!82743) #b00000000000000000000000000000000) (bvslt (index!3764 lt!82743) (size!3258 (_keys!5161 thiss!1248))))) (or ((_ is Undefined!399) lt!82743) ((_ is Found!399) lt!82743) ((_ is MissingZero!399) lt!82743) (not ((_ is MissingVacant!399) lt!82743)) (and (bvsge (index!3767 lt!82743) #b00000000000000000000000000000000) (bvslt (index!3767 lt!82743) (size!3258 (_keys!5161 thiss!1248))))) (or ((_ is Undefined!399) lt!82743) (ite ((_ is Found!399) lt!82743) (= (select (arr!2972 (_keys!5161 thiss!1248)) (index!3765 lt!82743)) key!828) (ite ((_ is MissingZero!399) lt!82743) (= (select (arr!2972 (_keys!5161 thiss!1248)) (index!3764 lt!82743)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!399) lt!82743) (= (select (arr!2972 (_keys!5161 thiss!1248)) (index!3767 lt!82743)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51507 (= lt!82743 e!107255)))

(declare-fun c!30093 () Bool)

(assert (=> d!51507 (= c!30093 (and ((_ is Intermediate!399) lt!82742) (undefined!1211 lt!82742)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6263 (_ BitVec 32)) SeekEntryResult!399)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51507 (= lt!82742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8006 thiss!1248)) key!828 (_keys!5161 thiss!1248) (mask!8006 thiss!1248)))))

(assert (=> d!51507 (validMask!0 (mask!8006 thiss!1248))))

(assert (=> d!51507 (= (seekEntryOrOpen!0 key!828 (_keys!5161 thiss!1248) (mask!8006 thiss!1248)) lt!82743)))

(declare-fun b!163477 () Bool)

(declare-fun e!107256 () SeekEntryResult!399)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6263 (_ BitVec 32)) SeekEntryResult!399)

(assert (=> b!163477 (= e!107256 (seekKeyOrZeroReturnVacant!0 (x!18105 lt!82742) (index!3766 lt!82742) (index!3766 lt!82742) key!828 (_keys!5161 thiss!1248) (mask!8006 thiss!1248)))))

(declare-fun b!163478 () Bool)

(declare-fun c!30095 () Bool)

(assert (=> b!163478 (= c!30095 (= lt!82741 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163478 (= e!107257 e!107256)))

(declare-fun b!163479 () Bool)

(assert (=> b!163479 (= e!107256 (MissingZero!399 (index!3766 lt!82742)))))

(assert (= (and d!51507 c!30093) b!163476))

(assert (= (and d!51507 (not c!30093)) b!163474))

(assert (= (and b!163474 c!30094) b!163475))

(assert (= (and b!163474 (not c!30094)) b!163478))

(assert (= (and b!163478 c!30095) b!163479))

(assert (= (and b!163478 (not c!30095)) b!163477))

(declare-fun m!194289 () Bool)

(assert (=> b!163474 m!194289))

(declare-fun m!194291 () Bool)

(assert (=> d!51507 m!194291))

(declare-fun m!194293 () Bool)

(assert (=> d!51507 m!194293))

(declare-fun m!194295 () Bool)

(assert (=> d!51507 m!194295))

(declare-fun m!194297 () Bool)

(assert (=> d!51507 m!194297))

(assert (=> d!51507 m!194295))

(declare-fun m!194299 () Bool)

(assert (=> d!51507 m!194299))

(assert (=> d!51507 m!194253))

(declare-fun m!194301 () Bool)

(assert (=> b!163477 m!194301))

(assert (=> b!163407 d!51507))

(declare-fun d!51509 () Bool)

(declare-fun res!77372 () Bool)

(declare-fun e!107260 () Bool)

(assert (=> d!51509 (=> (not res!77372) (not e!107260))))

(declare-fun simpleValid!122 (LongMapFixedSize!1816) Bool)

(assert (=> d!51509 (= res!77372 (simpleValid!122 thiss!1248))))

(assert (=> d!51509 (= (valid!835 thiss!1248) e!107260)))

(declare-fun b!163486 () Bool)

(declare-fun res!77373 () Bool)

(assert (=> b!163486 (=> (not res!77373) (not e!107260))))

(declare-fun arrayCountValidKeys!0 (array!6263 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163486 (= res!77373 (= (arrayCountValidKeys!0 (_keys!5161 thiss!1248) #b00000000000000000000000000000000 (size!3258 (_keys!5161 thiss!1248))) (_size!957 thiss!1248)))))

(declare-fun b!163487 () Bool)

(declare-fun res!77374 () Bool)

(assert (=> b!163487 (=> (not res!77374) (not e!107260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6263 (_ BitVec 32)) Bool)

(assert (=> b!163487 (= res!77374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5161 thiss!1248) (mask!8006 thiss!1248)))))

(declare-fun b!163488 () Bool)

(declare-datatypes ((List!1987 0))(
  ( (Nil!1984) (Cons!1983 (h!2598 (_ BitVec 64)) (t!6781 List!1987)) )
))
(declare-fun arrayNoDuplicates!0 (array!6263 (_ BitVec 32) List!1987) Bool)

(assert (=> b!163488 (= e!107260 (arrayNoDuplicates!0 (_keys!5161 thiss!1248) #b00000000000000000000000000000000 Nil!1984))))

(assert (= (and d!51509 res!77372) b!163486))

(assert (= (and b!163486 res!77373) b!163487))

(assert (= (and b!163487 res!77374) b!163488))

(declare-fun m!194303 () Bool)

(assert (=> d!51509 m!194303))

(declare-fun m!194305 () Bool)

(assert (=> b!163486 m!194305))

(declare-fun m!194307 () Bool)

(assert (=> b!163487 m!194307))

(declare-fun m!194309 () Bool)

(assert (=> b!163488 m!194309))

(assert (=> start!16404 d!51509))

(declare-fun d!51511 () Bool)

(assert (=> d!51511 (= (validMask!0 (mask!8006 thiss!1248)) (and (or (= (mask!8006 thiss!1248) #b00000000000000000000000000000111) (= (mask!8006 thiss!1248) #b00000000000000000000000000001111) (= (mask!8006 thiss!1248) #b00000000000000000000000000011111) (= (mask!8006 thiss!1248) #b00000000000000000000000000111111) (= (mask!8006 thiss!1248) #b00000000000000000000000001111111) (= (mask!8006 thiss!1248) #b00000000000000000000000011111111) (= (mask!8006 thiss!1248) #b00000000000000000000000111111111) (= (mask!8006 thiss!1248) #b00000000000000000000001111111111) (= (mask!8006 thiss!1248) #b00000000000000000000011111111111) (= (mask!8006 thiss!1248) #b00000000000000000000111111111111) (= (mask!8006 thiss!1248) #b00000000000000000001111111111111) (= (mask!8006 thiss!1248) #b00000000000000000011111111111111) (= (mask!8006 thiss!1248) #b00000000000000000111111111111111) (= (mask!8006 thiss!1248) #b00000000000000001111111111111111) (= (mask!8006 thiss!1248) #b00000000000000011111111111111111) (= (mask!8006 thiss!1248) #b00000000000000111111111111111111) (= (mask!8006 thiss!1248) #b00000000000001111111111111111111) (= (mask!8006 thiss!1248) #b00000000000011111111111111111111) (= (mask!8006 thiss!1248) #b00000000000111111111111111111111) (= (mask!8006 thiss!1248) #b00000000001111111111111111111111) (= (mask!8006 thiss!1248) #b00000000011111111111111111111111) (= (mask!8006 thiss!1248) #b00000000111111111111111111111111) (= (mask!8006 thiss!1248) #b00000001111111111111111111111111) (= (mask!8006 thiss!1248) #b00000011111111111111111111111111) (= (mask!8006 thiss!1248) #b00000111111111111111111111111111) (= (mask!8006 thiss!1248) #b00001111111111111111111111111111) (= (mask!8006 thiss!1248) #b00011111111111111111111111111111) (= (mask!8006 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8006 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163412 d!51511))

(declare-fun d!51513 () Bool)

(assert (=> d!51513 (= (array_inv!1909 (_keys!5161 thiss!1248)) (bvsge (size!3258 (_keys!5161 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163408 d!51513))

(declare-fun d!51515 () Bool)

(assert (=> d!51515 (= (array_inv!1910 (_values!3333 thiss!1248)) (bvsge (size!3259 (_values!3333 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163408 d!51515))

(declare-fun condMapEmpty!6103 () Bool)

(declare-fun mapDefault!6103 () ValueCell!1454)

(assert (=> mapNonEmpty!6094 (= condMapEmpty!6103 (= mapRest!6094 ((as const (Array (_ BitVec 32) ValueCell!1454)) mapDefault!6103)))))

(declare-fun e!107266 () Bool)

(declare-fun mapRes!6103 () Bool)

(assert (=> mapNonEmpty!6094 (= tp!13962 (and e!107266 mapRes!6103))))

(declare-fun mapIsEmpty!6103 () Bool)

(assert (=> mapIsEmpty!6103 mapRes!6103))

(declare-fun b!163495 () Bool)

(declare-fun e!107265 () Bool)

(assert (=> b!163495 (= e!107265 tp_is_empty!3595)))

(declare-fun b!163496 () Bool)

(assert (=> b!163496 (= e!107266 tp_is_empty!3595)))

(declare-fun mapNonEmpty!6103 () Bool)

(declare-fun tp!13978 () Bool)

(assert (=> mapNonEmpty!6103 (= mapRes!6103 (and tp!13978 e!107265))))

(declare-fun mapRest!6103 () (Array (_ BitVec 32) ValueCell!1454))

(declare-fun mapValue!6103 () ValueCell!1454)

(declare-fun mapKey!6103 () (_ BitVec 32))

(assert (=> mapNonEmpty!6103 (= mapRest!6094 (store mapRest!6103 mapKey!6103 mapValue!6103))))

(assert (= (and mapNonEmpty!6094 condMapEmpty!6103) mapIsEmpty!6103))

(assert (= (and mapNonEmpty!6094 (not condMapEmpty!6103)) mapNonEmpty!6103))

(assert (= (and mapNonEmpty!6103 ((_ is ValueCellFull!1454) mapValue!6103)) b!163495))

(assert (= (and mapNonEmpty!6094 ((_ is ValueCellFull!1454) mapDefault!6103)) b!163496))

(declare-fun m!194311 () Bool)

(assert (=> mapNonEmpty!6103 m!194311))

(check-sat (not d!51509) (not b_next!3793) (not mapNonEmpty!6103) b_and!10221 (not b!163486) (not d!51507) tp_is_empty!3595 (not b!163487) (not b!163488) (not b!163477))
(check-sat b_and!10221 (not b_next!3793))
(get-model)

(declare-fun d!51517 () Bool)

(declare-fun res!77382 () Bool)

(declare-fun e!107278 () Bool)

(assert (=> d!51517 (=> res!77382 e!107278)))

(assert (=> d!51517 (= res!77382 (bvsge #b00000000000000000000000000000000 (size!3258 (_keys!5161 thiss!1248))))))

(assert (=> d!51517 (= (arrayNoDuplicates!0 (_keys!5161 thiss!1248) #b00000000000000000000000000000000 Nil!1984) e!107278)))

(declare-fun b!163507 () Bool)

(declare-fun e!107275 () Bool)

(declare-fun call!17293 () Bool)

(assert (=> b!163507 (= e!107275 call!17293)))

(declare-fun b!163508 () Bool)

(declare-fun e!107277 () Bool)

(assert (=> b!163508 (= e!107278 e!107277)))

(declare-fun res!77383 () Bool)

(assert (=> b!163508 (=> (not res!77383) (not e!107277))))

(declare-fun e!107276 () Bool)

(assert (=> b!163508 (= res!77383 (not e!107276))))

(declare-fun res!77381 () Bool)

(assert (=> b!163508 (=> (not res!77381) (not e!107276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!163508 (= res!77381 (validKeyInArray!0 (select (arr!2972 (_keys!5161 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163509 () Bool)

(assert (=> b!163509 (= e!107277 e!107275)))

(declare-fun c!30098 () Bool)

(assert (=> b!163509 (= c!30098 (validKeyInArray!0 (select (arr!2972 (_keys!5161 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163510 () Bool)

(assert (=> b!163510 (= e!107275 call!17293)))

(declare-fun b!163511 () Bool)

(declare-fun contains!1030 (List!1987 (_ BitVec 64)) Bool)

(assert (=> b!163511 (= e!107276 (contains!1030 Nil!1984 (select (arr!2972 (_keys!5161 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17290 () Bool)

(assert (=> bm!17290 (= call!17293 (arrayNoDuplicates!0 (_keys!5161 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30098 (Cons!1983 (select (arr!2972 (_keys!5161 thiss!1248)) #b00000000000000000000000000000000) Nil!1984) Nil!1984)))))

(assert (= (and d!51517 (not res!77382)) b!163508))

(assert (= (and b!163508 res!77381) b!163511))

(assert (= (and b!163508 res!77383) b!163509))

(assert (= (and b!163509 c!30098) b!163510))

(assert (= (and b!163509 (not c!30098)) b!163507))

(assert (= (or b!163510 b!163507) bm!17290))

(declare-fun m!194313 () Bool)

(assert (=> b!163508 m!194313))

(assert (=> b!163508 m!194313))

(declare-fun m!194315 () Bool)

(assert (=> b!163508 m!194315))

(assert (=> b!163509 m!194313))

(assert (=> b!163509 m!194313))

(assert (=> b!163509 m!194315))

(assert (=> b!163511 m!194313))

(assert (=> b!163511 m!194313))

(declare-fun m!194317 () Bool)

(assert (=> b!163511 m!194317))

(assert (=> bm!17290 m!194313))

(declare-fun m!194319 () Bool)

(assert (=> bm!17290 m!194319))

(assert (=> b!163488 d!51517))

(declare-fun b!163524 () Bool)

(declare-fun e!107287 () SeekEntryResult!399)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163524 (= e!107287 (seekKeyOrZeroReturnVacant!0 (bvadd (x!18105 lt!82742) #b00000000000000000000000000000001) (nextIndex!0 (index!3766 lt!82742) (bvadd (x!18105 lt!82742) #b00000000000000000000000000000001) (mask!8006 thiss!1248)) (index!3766 lt!82742) key!828 (_keys!5161 thiss!1248) (mask!8006 thiss!1248)))))

(declare-fun b!163525 () Bool)

(declare-fun c!30105 () Bool)

(declare-fun lt!82749 () (_ BitVec 64))

(assert (=> b!163525 (= c!30105 (= lt!82749 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107285 () SeekEntryResult!399)

(assert (=> b!163525 (= e!107285 e!107287)))

(declare-fun b!163526 () Bool)

(assert (=> b!163526 (= e!107285 (Found!399 (index!3766 lt!82742)))))

(declare-fun b!163527 () Bool)

(declare-fun e!107286 () SeekEntryResult!399)

(assert (=> b!163527 (= e!107286 Undefined!399)))

(declare-fun d!51519 () Bool)

(declare-fun lt!82748 () SeekEntryResult!399)

(assert (=> d!51519 (and (or ((_ is Undefined!399) lt!82748) (not ((_ is Found!399) lt!82748)) (and (bvsge (index!3765 lt!82748) #b00000000000000000000000000000000) (bvslt (index!3765 lt!82748) (size!3258 (_keys!5161 thiss!1248))))) (or ((_ is Undefined!399) lt!82748) ((_ is Found!399) lt!82748) (not ((_ is MissingVacant!399) lt!82748)) (not (= (index!3767 lt!82748) (index!3766 lt!82742))) (and (bvsge (index!3767 lt!82748) #b00000000000000000000000000000000) (bvslt (index!3767 lt!82748) (size!3258 (_keys!5161 thiss!1248))))) (or ((_ is Undefined!399) lt!82748) (ite ((_ is Found!399) lt!82748) (= (select (arr!2972 (_keys!5161 thiss!1248)) (index!3765 lt!82748)) key!828) (and ((_ is MissingVacant!399) lt!82748) (= (index!3767 lt!82748) (index!3766 lt!82742)) (= (select (arr!2972 (_keys!5161 thiss!1248)) (index!3767 lt!82748)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!51519 (= lt!82748 e!107286)))

(declare-fun c!30106 () Bool)

(assert (=> d!51519 (= c!30106 (bvsge (x!18105 lt!82742) #b01111111111111111111111111111110))))

(assert (=> d!51519 (= lt!82749 (select (arr!2972 (_keys!5161 thiss!1248)) (index!3766 lt!82742)))))

(assert (=> d!51519 (validMask!0 (mask!8006 thiss!1248))))

(assert (=> d!51519 (= (seekKeyOrZeroReturnVacant!0 (x!18105 lt!82742) (index!3766 lt!82742) (index!3766 lt!82742) key!828 (_keys!5161 thiss!1248) (mask!8006 thiss!1248)) lt!82748)))

(declare-fun b!163528 () Bool)

(assert (=> b!163528 (= e!107286 e!107285)))

(declare-fun c!30107 () Bool)

(assert (=> b!163528 (= c!30107 (= lt!82749 key!828))))

(declare-fun b!163529 () Bool)

(assert (=> b!163529 (= e!107287 (MissingVacant!399 (index!3766 lt!82742)))))

(assert (= (and d!51519 c!30106) b!163527))

(assert (= (and d!51519 (not c!30106)) b!163528))

(assert (= (and b!163528 c!30107) b!163526))

(assert (= (and b!163528 (not c!30107)) b!163525))

(assert (= (and b!163525 c!30105) b!163529))

(assert (= (and b!163525 (not c!30105)) b!163524))

(declare-fun m!194321 () Bool)

(assert (=> b!163524 m!194321))

(assert (=> b!163524 m!194321))

(declare-fun m!194323 () Bool)

(assert (=> b!163524 m!194323))

(declare-fun m!194325 () Bool)

(assert (=> d!51519 m!194325))

(declare-fun m!194327 () Bool)

(assert (=> d!51519 m!194327))

(assert (=> d!51519 m!194289))

(assert (=> d!51519 m!194253))

(assert (=> b!163477 d!51519))

(declare-fun b!163548 () Bool)

(declare-fun e!107301 () SeekEntryResult!399)

(declare-fun e!107299 () SeekEntryResult!399)

(assert (=> b!163548 (= e!107301 e!107299)))

(declare-fun c!30116 () Bool)

(declare-fun lt!82754 () (_ BitVec 64))

(assert (=> b!163548 (= c!30116 (or (= lt!82754 key!828) (= (bvadd lt!82754 lt!82754) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!163549 () Bool)

(assert (=> b!163549 (= e!107301 (Intermediate!399 true (toIndex!0 key!828 (mask!8006 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163550 () Bool)

(declare-fun lt!82755 () SeekEntryResult!399)

(assert (=> b!163550 (and (bvsge (index!3766 lt!82755) #b00000000000000000000000000000000) (bvslt (index!3766 lt!82755) (size!3258 (_keys!5161 thiss!1248))))))

(declare-fun res!77392 () Bool)

(assert (=> b!163550 (= res!77392 (= (select (arr!2972 (_keys!5161 thiss!1248)) (index!3766 lt!82755)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107298 () Bool)

(assert (=> b!163550 (=> res!77392 e!107298)))

(declare-fun b!163551 () Bool)

(assert (=> b!163551 (= e!107299 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8006 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8006 thiss!1248)) key!828 (_keys!5161 thiss!1248) (mask!8006 thiss!1248)))))

(declare-fun d!51521 () Bool)

(declare-fun e!107300 () Bool)

(assert (=> d!51521 e!107300))

(declare-fun c!30115 () Bool)

(assert (=> d!51521 (= c!30115 (and ((_ is Intermediate!399) lt!82755) (undefined!1211 lt!82755)))))

(assert (=> d!51521 (= lt!82755 e!107301)))

(declare-fun c!30114 () Bool)

(assert (=> d!51521 (= c!30114 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!51521 (= lt!82754 (select (arr!2972 (_keys!5161 thiss!1248)) (toIndex!0 key!828 (mask!8006 thiss!1248))))))

(assert (=> d!51521 (validMask!0 (mask!8006 thiss!1248))))

(assert (=> d!51521 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8006 thiss!1248)) key!828 (_keys!5161 thiss!1248) (mask!8006 thiss!1248)) lt!82755)))

(declare-fun b!163552 () Bool)

(assert (=> b!163552 (and (bvsge (index!3766 lt!82755) #b00000000000000000000000000000000) (bvslt (index!3766 lt!82755) (size!3258 (_keys!5161 thiss!1248))))))

(assert (=> b!163552 (= e!107298 (= (select (arr!2972 (_keys!5161 thiss!1248)) (index!3766 lt!82755)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!163553 () Bool)

(assert (=> b!163553 (= e!107299 (Intermediate!399 false (toIndex!0 key!828 (mask!8006 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163554 () Bool)

(assert (=> b!163554 (and (bvsge (index!3766 lt!82755) #b00000000000000000000000000000000) (bvslt (index!3766 lt!82755) (size!3258 (_keys!5161 thiss!1248))))))

(declare-fun res!77390 () Bool)

(assert (=> b!163554 (= res!77390 (= (select (arr!2972 (_keys!5161 thiss!1248)) (index!3766 lt!82755)) key!828))))

(assert (=> b!163554 (=> res!77390 e!107298)))

(declare-fun e!107302 () Bool)

(assert (=> b!163554 (= e!107302 e!107298)))

(declare-fun b!163555 () Bool)

(assert (=> b!163555 (= e!107300 (bvsge (x!18105 lt!82755) #b01111111111111111111111111111110))))

(declare-fun b!163556 () Bool)

(assert (=> b!163556 (= e!107300 e!107302)))

(declare-fun res!77391 () Bool)

(assert (=> b!163556 (= res!77391 (and ((_ is Intermediate!399) lt!82755) (not (undefined!1211 lt!82755)) (bvslt (x!18105 lt!82755) #b01111111111111111111111111111110) (bvsge (x!18105 lt!82755) #b00000000000000000000000000000000) (bvsge (x!18105 lt!82755) #b00000000000000000000000000000000)))))

(assert (=> b!163556 (=> (not res!77391) (not e!107302))))

(assert (= (and d!51521 c!30114) b!163549))

(assert (= (and d!51521 (not c!30114)) b!163548))

(assert (= (and b!163548 c!30116) b!163553))

(assert (= (and b!163548 (not c!30116)) b!163551))

(assert (= (and d!51521 c!30115) b!163555))

(assert (= (and d!51521 (not c!30115)) b!163556))

(assert (= (and b!163556 res!77391) b!163554))

(assert (= (and b!163554 (not res!77390)) b!163550))

(assert (= (and b!163550 (not res!77392)) b!163552))

(assert (=> d!51521 m!194295))

(declare-fun m!194329 () Bool)

(assert (=> d!51521 m!194329))

(assert (=> d!51521 m!194253))

(declare-fun m!194331 () Bool)

(assert (=> b!163550 m!194331))

(assert (=> b!163551 m!194295))

(declare-fun m!194333 () Bool)

(assert (=> b!163551 m!194333))

(assert (=> b!163551 m!194333))

(declare-fun m!194335 () Bool)

(assert (=> b!163551 m!194335))

(assert (=> b!163554 m!194331))

(assert (=> b!163552 m!194331))

(assert (=> d!51507 d!51521))

(declare-fun d!51523 () Bool)

(declare-fun lt!82761 () (_ BitVec 32))

(declare-fun lt!82760 () (_ BitVec 32))

(assert (=> d!51523 (= lt!82761 (bvmul (bvxor lt!82760 (bvlshr lt!82760 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51523 (= lt!82760 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51523 (and (bvsge (mask!8006 thiss!1248) #b00000000000000000000000000000000) (let ((res!77393 (let ((h!2599 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!18123 (bvmul (bvxor h!2599 (bvlshr h!2599 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!18123 (bvlshr x!18123 #b00000000000000000000000000001101)) (mask!8006 thiss!1248)))))) (and (bvslt res!77393 (bvadd (mask!8006 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!77393 #b00000000000000000000000000000000))))))

(assert (=> d!51523 (= (toIndex!0 key!828 (mask!8006 thiss!1248)) (bvand (bvxor lt!82761 (bvlshr lt!82761 #b00000000000000000000000000001101)) (mask!8006 thiss!1248)))))

(assert (=> d!51507 d!51523))

(assert (=> d!51507 d!51511))

(declare-fun d!51525 () Bool)

(declare-fun res!77405 () Bool)

(declare-fun e!107305 () Bool)

(assert (=> d!51525 (=> (not res!77405) (not e!107305))))

(assert (=> d!51525 (= res!77405 (validMask!0 (mask!8006 thiss!1248)))))

(assert (=> d!51525 (= (simpleValid!122 thiss!1248) e!107305)))

(declare-fun b!163565 () Bool)

(declare-fun res!77404 () Bool)

(assert (=> b!163565 (=> (not res!77404) (not e!107305))))

(assert (=> b!163565 (= res!77404 (and (= (size!3259 (_values!3333 thiss!1248)) (bvadd (mask!8006 thiss!1248) #b00000000000000000000000000000001)) (= (size!3258 (_keys!5161 thiss!1248)) (size!3259 (_values!3333 thiss!1248))) (bvsge (_size!957 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!957 thiss!1248) (bvadd (mask!8006 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!163568 () Bool)

(assert (=> b!163568 (= e!107305 (and (bvsge (extraKeys!3091 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3091 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!957 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!163567 () Bool)

(declare-fun res!77402 () Bool)

(assert (=> b!163567 (=> (not res!77402) (not e!107305))))

(declare-fun size!3264 (LongMapFixedSize!1816) (_ BitVec 32))

(assert (=> b!163567 (= res!77402 (= (size!3264 thiss!1248) (bvadd (_size!957 thiss!1248) (bvsdiv (bvadd (extraKeys!3091 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!163566 () Bool)

(declare-fun res!77403 () Bool)

(assert (=> b!163566 (=> (not res!77403) (not e!107305))))

(assert (=> b!163566 (= res!77403 (bvsge (size!3264 thiss!1248) (_size!957 thiss!1248)))))

(assert (= (and d!51525 res!77405) b!163565))

(assert (= (and b!163565 res!77404) b!163566))

(assert (= (and b!163566 res!77403) b!163567))

(assert (= (and b!163567 res!77402) b!163568))

(assert (=> d!51525 m!194253))

(declare-fun m!194337 () Bool)

(assert (=> b!163567 m!194337))

(assert (=> b!163566 m!194337))

(assert (=> d!51509 d!51525))

(declare-fun b!163577 () Bool)

(declare-fun e!107310 () (_ BitVec 32))

(assert (=> b!163577 (= e!107310 #b00000000000000000000000000000000)))

(declare-fun b!163578 () Bool)

(declare-fun e!107311 () (_ BitVec 32))

(declare-fun call!17296 () (_ BitVec 32))

(assert (=> b!163578 (= e!107311 (bvadd #b00000000000000000000000000000001 call!17296))))

(declare-fun b!163579 () Bool)

(assert (=> b!163579 (= e!107310 e!107311)))

(declare-fun c!30121 () Bool)

(assert (=> b!163579 (= c!30121 (validKeyInArray!0 (select (arr!2972 (_keys!5161 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163580 () Bool)

(assert (=> b!163580 (= e!107311 call!17296)))

(declare-fun d!51527 () Bool)

(declare-fun lt!82764 () (_ BitVec 32))

(assert (=> d!51527 (and (bvsge lt!82764 #b00000000000000000000000000000000) (bvsle lt!82764 (bvsub (size!3258 (_keys!5161 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51527 (= lt!82764 e!107310)))

(declare-fun c!30122 () Bool)

(assert (=> d!51527 (= c!30122 (bvsge #b00000000000000000000000000000000 (size!3258 (_keys!5161 thiss!1248))))))

(assert (=> d!51527 (and (bvsle #b00000000000000000000000000000000 (size!3258 (_keys!5161 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3258 (_keys!5161 thiss!1248)) (size!3258 (_keys!5161 thiss!1248))))))

(assert (=> d!51527 (= (arrayCountValidKeys!0 (_keys!5161 thiss!1248) #b00000000000000000000000000000000 (size!3258 (_keys!5161 thiss!1248))) lt!82764)))

(declare-fun bm!17293 () Bool)

(assert (=> bm!17293 (= call!17296 (arrayCountValidKeys!0 (_keys!5161 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3258 (_keys!5161 thiss!1248))))))

(assert (= (and d!51527 c!30122) b!163577))

(assert (= (and d!51527 (not c!30122)) b!163579))

(assert (= (and b!163579 c!30121) b!163578))

(assert (= (and b!163579 (not c!30121)) b!163580))

(assert (= (or b!163578 b!163580) bm!17293))

(assert (=> b!163579 m!194313))

(assert (=> b!163579 m!194313))

(assert (=> b!163579 m!194315))

(declare-fun m!194339 () Bool)

(assert (=> bm!17293 m!194339))

(assert (=> b!163486 d!51527))

(declare-fun b!163589 () Bool)

(declare-fun e!107320 () Bool)

(declare-fun e!107318 () Bool)

(assert (=> b!163589 (= e!107320 e!107318)))

(declare-fun lt!82771 () (_ BitVec 64))

(assert (=> b!163589 (= lt!82771 (select (arr!2972 (_keys!5161 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5046 0))(
  ( (Unit!5047) )
))
(declare-fun lt!82772 () Unit!5046)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6263 (_ BitVec 64) (_ BitVec 32)) Unit!5046)

(assert (=> b!163589 (= lt!82772 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5161 thiss!1248) lt!82771 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!163589 (arrayContainsKey!0 (_keys!5161 thiss!1248) lt!82771 #b00000000000000000000000000000000)))

(declare-fun lt!82773 () Unit!5046)

(assert (=> b!163589 (= lt!82773 lt!82772)))

(declare-fun res!77411 () Bool)

(assert (=> b!163589 (= res!77411 (= (seekEntryOrOpen!0 (select (arr!2972 (_keys!5161 thiss!1248)) #b00000000000000000000000000000000) (_keys!5161 thiss!1248) (mask!8006 thiss!1248)) (Found!399 #b00000000000000000000000000000000)))))

(assert (=> b!163589 (=> (not res!77411) (not e!107318))))

(declare-fun bm!17296 () Bool)

(declare-fun call!17299 () Bool)

(assert (=> bm!17296 (= call!17299 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5161 thiss!1248) (mask!8006 thiss!1248)))))

(declare-fun d!51529 () Bool)

(declare-fun res!77410 () Bool)

(declare-fun e!107319 () Bool)

(assert (=> d!51529 (=> res!77410 e!107319)))

(assert (=> d!51529 (= res!77410 (bvsge #b00000000000000000000000000000000 (size!3258 (_keys!5161 thiss!1248))))))

(assert (=> d!51529 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5161 thiss!1248) (mask!8006 thiss!1248)) e!107319)))

(declare-fun b!163590 () Bool)

(assert (=> b!163590 (= e!107320 call!17299)))

(declare-fun b!163591 () Bool)

(assert (=> b!163591 (= e!107319 e!107320)))

(declare-fun c!30125 () Bool)

(assert (=> b!163591 (= c!30125 (validKeyInArray!0 (select (arr!2972 (_keys!5161 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163592 () Bool)

(assert (=> b!163592 (= e!107318 call!17299)))

(assert (= (and d!51529 (not res!77410)) b!163591))

(assert (= (and b!163591 c!30125) b!163589))

(assert (= (and b!163591 (not c!30125)) b!163590))

(assert (= (and b!163589 res!77411) b!163592))

(assert (= (or b!163592 b!163590) bm!17296))

(assert (=> b!163589 m!194313))

(declare-fun m!194341 () Bool)

(assert (=> b!163589 m!194341))

(declare-fun m!194343 () Bool)

(assert (=> b!163589 m!194343))

(assert (=> b!163589 m!194313))

(declare-fun m!194345 () Bool)

(assert (=> b!163589 m!194345))

(declare-fun m!194347 () Bool)

(assert (=> bm!17296 m!194347))

(assert (=> b!163591 m!194313))

(assert (=> b!163591 m!194313))

(assert (=> b!163591 m!194315))

(assert (=> b!163487 d!51529))

(declare-fun condMapEmpty!6104 () Bool)

(declare-fun mapDefault!6104 () ValueCell!1454)

(assert (=> mapNonEmpty!6103 (= condMapEmpty!6104 (= mapRest!6103 ((as const (Array (_ BitVec 32) ValueCell!1454)) mapDefault!6104)))))

(declare-fun e!107322 () Bool)

(declare-fun mapRes!6104 () Bool)

(assert (=> mapNonEmpty!6103 (= tp!13978 (and e!107322 mapRes!6104))))

(declare-fun mapIsEmpty!6104 () Bool)

(assert (=> mapIsEmpty!6104 mapRes!6104))

(declare-fun b!163593 () Bool)

(declare-fun e!107321 () Bool)

(assert (=> b!163593 (= e!107321 tp_is_empty!3595)))

(declare-fun b!163594 () Bool)

(assert (=> b!163594 (= e!107322 tp_is_empty!3595)))

(declare-fun mapNonEmpty!6104 () Bool)

(declare-fun tp!13979 () Bool)

(assert (=> mapNonEmpty!6104 (= mapRes!6104 (and tp!13979 e!107321))))

(declare-fun mapValue!6104 () ValueCell!1454)

(declare-fun mapKey!6104 () (_ BitVec 32))

(declare-fun mapRest!6104 () (Array (_ BitVec 32) ValueCell!1454))

(assert (=> mapNonEmpty!6104 (= mapRest!6103 (store mapRest!6104 mapKey!6104 mapValue!6104))))

(assert (= (and mapNonEmpty!6103 condMapEmpty!6104) mapIsEmpty!6104))

(assert (= (and mapNonEmpty!6103 (not condMapEmpty!6104)) mapNonEmpty!6104))

(assert (= (and mapNonEmpty!6104 ((_ is ValueCellFull!1454) mapValue!6104)) b!163593))

(assert (= (and mapNonEmpty!6103 ((_ is ValueCellFull!1454) mapDefault!6104)) b!163594))

(declare-fun m!194349 () Bool)

(assert (=> mapNonEmpty!6104 m!194349))

(check-sat (not b!163509) (not b_next!3793) (not mapNonEmpty!6104) (not b!163591) (not b!163567) b_and!10221 (not b!163511) tp_is_empty!3595 (not bm!17296) (not d!51521) (not d!51519) (not b!163508) (not b!163589) (not b!163566) (not b!163524) (not bm!17290) (not d!51525) (not bm!17293) (not b!163551) (not b!163579))
(check-sat b_and!10221 (not b_next!3793))
