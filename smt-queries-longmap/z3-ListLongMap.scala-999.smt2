; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21568 () Bool)

(assert start!21568)

(declare-fun b!216188 () Bool)

(declare-fun b_free!5745 () Bool)

(declare-fun b_next!5745 () Bool)

(assert (=> b!216188 (= b_free!5745 (not b_next!5745))))

(declare-fun tp!20363 () Bool)

(declare-fun b_and!12635 () Bool)

(assert (=> b!216188 (= tp!20363 b_and!12635)))

(declare-fun b!216184 () Bool)

(declare-fun e!140656 () Bool)

(declare-fun e!140657 () Bool)

(assert (=> b!216184 (= e!140656 e!140657)))

(declare-fun res!105703 () Bool)

(assert (=> b!216184 (=> (not res!105703) (not e!140657))))

(declare-datatypes ((SeekEntryResult!741 0))(
  ( (MissingZero!741 (index!5134 (_ BitVec 32))) (Found!741 (index!5135 (_ BitVec 32))) (Intermediate!741 (undefined!1553 Bool) (index!5136 (_ BitVec 32)) (x!22605 (_ BitVec 32))) (Undefined!741) (MissingVacant!741 (index!5137 (_ BitVec 32))) )
))
(declare-fun lt!111117 () SeekEntryResult!741)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216184 (= res!105703 (or (= lt!111117 (MissingZero!741 index!297)) (= lt!111117 (MissingVacant!741 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7123 0))(
  ( (V!7124 (val!2848 Int)) )
))
(declare-datatypes ((ValueCell!2460 0))(
  ( (ValueCellFull!2460 (v!4866 V!7123)) (EmptyCell!2460) )
))
(declare-datatypes ((array!10449 0))(
  ( (array!10450 (arr!4948 (Array (_ BitVec 32) ValueCell!2460)) (size!5280 (_ BitVec 32))) )
))
(declare-datatypes ((array!10451 0))(
  ( (array!10452 (arr!4949 (Array (_ BitVec 32) (_ BitVec 64))) (size!5281 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2820 0))(
  ( (LongMapFixedSize!2821 (defaultEntry!4060 Int) (mask!9787 (_ BitVec 32)) (extraKeys!3797 (_ BitVec 32)) (zeroValue!3901 V!7123) (minValue!3901 V!7123) (_size!1459 (_ BitVec 32)) (_keys!6105 array!10451) (_values!4043 array!10449) (_vacant!1459 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2820)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10451 (_ BitVec 32)) SeekEntryResult!741)

(assert (=> b!216184 (= lt!111117 (seekEntryOrOpen!0 key!932 (_keys!6105 thiss!1504) (mask!9787 thiss!1504)))))

(declare-fun res!105707 () Bool)

(assert (=> start!21568 (=> (not res!105707) (not e!140656))))

(declare-fun valid!1146 (LongMapFixedSize!2820) Bool)

(assert (=> start!21568 (= res!105707 (valid!1146 thiss!1504))))

(assert (=> start!21568 e!140656))

(declare-fun e!140658 () Bool)

(assert (=> start!21568 e!140658))

(assert (=> start!21568 true))

(declare-fun b!216185 () Bool)

(declare-fun e!140655 () Bool)

(declare-fun e!140654 () Bool)

(declare-fun mapRes!9567 () Bool)

(assert (=> b!216185 (= e!140655 (and e!140654 mapRes!9567))))

(declare-fun condMapEmpty!9567 () Bool)

(declare-fun mapDefault!9567 () ValueCell!2460)

(assert (=> b!216185 (= condMapEmpty!9567 (= (arr!4948 (_values!4043 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2460)) mapDefault!9567)))))

(declare-fun b!216186 () Bool)

(declare-fun res!105708 () Bool)

(assert (=> b!216186 (=> (not res!105708) (not e!140657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216186 (= res!105708 (validMask!0 (mask!9787 thiss!1504)))))

(declare-fun b!216187 () Bool)

(declare-fun res!105705 () Bool)

(assert (=> b!216187 (=> (not res!105705) (not e!140657))))

(assert (=> b!216187 (= res!105705 (and (= (size!5280 (_values!4043 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9787 thiss!1504))) (= (size!5281 (_keys!6105 thiss!1504)) (size!5280 (_values!4043 thiss!1504))) (bvsge (mask!9787 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3797 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3797 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun tp_is_empty!5607 () Bool)

(declare-fun array_inv!3273 (array!10451) Bool)

(declare-fun array_inv!3274 (array!10449) Bool)

(assert (=> b!216188 (= e!140658 (and tp!20363 tp_is_empty!5607 (array_inv!3273 (_keys!6105 thiss!1504)) (array_inv!3274 (_values!4043 thiss!1504)) e!140655))))

(declare-fun b!216189 () Bool)

(assert (=> b!216189 (= e!140654 tp_is_empty!5607)))

(declare-fun b!216190 () Bool)

(declare-fun res!105706 () Bool)

(assert (=> b!216190 (=> (not res!105706) (not e!140657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10451 (_ BitVec 32)) Bool)

(assert (=> b!216190 (= res!105706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6105 thiss!1504) (mask!9787 thiss!1504)))))

(declare-fun mapIsEmpty!9567 () Bool)

(assert (=> mapIsEmpty!9567 mapRes!9567))

(declare-fun mapNonEmpty!9567 () Bool)

(declare-fun tp!20364 () Bool)

(declare-fun e!140653 () Bool)

(assert (=> mapNonEmpty!9567 (= mapRes!9567 (and tp!20364 e!140653))))

(declare-fun mapKey!9567 () (_ BitVec 32))

(declare-fun mapValue!9567 () ValueCell!2460)

(declare-fun mapRest!9567 () (Array (_ BitVec 32) ValueCell!2460))

(assert (=> mapNonEmpty!9567 (= (arr!4948 (_values!4043 thiss!1504)) (store mapRest!9567 mapKey!9567 mapValue!9567))))

(declare-fun b!216191 () Bool)

(declare-datatypes ((List!3142 0))(
  ( (Nil!3139) (Cons!3138 (h!3785 (_ BitVec 64)) (t!8097 List!3142)) )
))
(declare-fun arrayNoDuplicates!0 (array!10451 (_ BitVec 32) List!3142) Bool)

(assert (=> b!216191 (= e!140657 (not (arrayNoDuplicates!0 (_keys!6105 thiss!1504) #b00000000000000000000000000000000 Nil!3139)))))

(declare-fun b!216192 () Bool)

(declare-fun res!105704 () Bool)

(assert (=> b!216192 (=> (not res!105704) (not e!140656))))

(assert (=> b!216192 (= res!105704 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216193 () Bool)

(assert (=> b!216193 (= e!140653 tp_is_empty!5607)))

(assert (= (and start!21568 res!105707) b!216192))

(assert (= (and b!216192 res!105704) b!216184))

(assert (= (and b!216184 res!105703) b!216186))

(assert (= (and b!216186 res!105708) b!216187))

(assert (= (and b!216187 res!105705) b!216190))

(assert (= (and b!216190 res!105706) b!216191))

(assert (= (and b!216185 condMapEmpty!9567) mapIsEmpty!9567))

(assert (= (and b!216185 (not condMapEmpty!9567)) mapNonEmpty!9567))

(get-info :version)

(assert (= (and mapNonEmpty!9567 ((_ is ValueCellFull!2460) mapValue!9567)) b!216193))

(assert (= (and b!216185 ((_ is ValueCellFull!2460) mapDefault!9567)) b!216189))

(assert (= b!216188 b!216185))

(assert (= start!21568 b!216188))

(declare-fun m!243017 () Bool)

(assert (=> b!216190 m!243017))

(declare-fun m!243019 () Bool)

(assert (=> b!216191 m!243019))

(declare-fun m!243021 () Bool)

(assert (=> mapNonEmpty!9567 m!243021))

(declare-fun m!243023 () Bool)

(assert (=> b!216188 m!243023))

(declare-fun m!243025 () Bool)

(assert (=> b!216188 m!243025))

(declare-fun m!243027 () Bool)

(assert (=> b!216186 m!243027))

(declare-fun m!243029 () Bool)

(assert (=> start!21568 m!243029))

(declare-fun m!243031 () Bool)

(assert (=> b!216184 m!243031))

(check-sat (not b!216188) (not b!216190) (not b!216184) b_and!12635 (not b!216186) (not b!216191) tp_is_empty!5607 (not b_next!5745) (not start!21568) (not mapNonEmpty!9567))
(check-sat b_and!12635 (not b_next!5745))
(get-model)

(declare-fun d!58525 () Bool)

(declare-fun res!105733 () Bool)

(declare-fun e!140691 () Bool)

(assert (=> d!58525 (=> res!105733 e!140691)))

(assert (=> d!58525 (= res!105733 (bvsge #b00000000000000000000000000000000 (size!5281 (_keys!6105 thiss!1504))))))

(assert (=> d!58525 (= (arrayNoDuplicates!0 (_keys!6105 thiss!1504) #b00000000000000000000000000000000 Nil!3139) e!140691)))

(declare-fun b!216234 () Bool)

(declare-fun e!140690 () Bool)

(assert (=> b!216234 (= e!140691 e!140690)))

(declare-fun res!105735 () Bool)

(assert (=> b!216234 (=> (not res!105735) (not e!140690))))

(declare-fun e!140689 () Bool)

(assert (=> b!216234 (= res!105735 (not e!140689))))

(declare-fun res!105734 () Bool)

(assert (=> b!216234 (=> (not res!105734) (not e!140689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!216234 (= res!105734 (validKeyInArray!0 (select (arr!4949 (_keys!6105 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!216235 () Bool)

(declare-fun e!140692 () Bool)

(declare-fun call!20373 () Bool)

(assert (=> b!216235 (= e!140692 call!20373)))

(declare-fun bm!20370 () Bool)

(declare-fun c!36302 () Bool)

(assert (=> bm!20370 (= call!20373 (arrayNoDuplicates!0 (_keys!6105 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36302 (Cons!3138 (select (arr!4949 (_keys!6105 thiss!1504)) #b00000000000000000000000000000000) Nil!3139) Nil!3139)))))

(declare-fun b!216236 () Bool)

(assert (=> b!216236 (= e!140692 call!20373)))

(declare-fun b!216237 () Bool)

(assert (=> b!216237 (= e!140690 e!140692)))

(assert (=> b!216237 (= c!36302 (validKeyInArray!0 (select (arr!4949 (_keys!6105 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!216238 () Bool)

(declare-fun contains!1432 (List!3142 (_ BitVec 64)) Bool)

(assert (=> b!216238 (= e!140689 (contains!1432 Nil!3139 (select (arr!4949 (_keys!6105 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58525 (not res!105733)) b!216234))

(assert (= (and b!216234 res!105734) b!216238))

(assert (= (and b!216234 res!105735) b!216237))

(assert (= (and b!216237 c!36302) b!216235))

(assert (= (and b!216237 (not c!36302)) b!216236))

(assert (= (or b!216235 b!216236) bm!20370))

(declare-fun m!243049 () Bool)

(assert (=> b!216234 m!243049))

(assert (=> b!216234 m!243049))

(declare-fun m!243051 () Bool)

(assert (=> b!216234 m!243051))

(assert (=> bm!20370 m!243049))

(declare-fun m!243053 () Bool)

(assert (=> bm!20370 m!243053))

(assert (=> b!216237 m!243049))

(assert (=> b!216237 m!243049))

(assert (=> b!216237 m!243051))

(assert (=> b!216238 m!243049))

(assert (=> b!216238 m!243049))

(declare-fun m!243055 () Bool)

(assert (=> b!216238 m!243055))

(assert (=> b!216191 d!58525))

(declare-fun d!58527 () Bool)

(assert (=> d!58527 (= (array_inv!3273 (_keys!6105 thiss!1504)) (bvsge (size!5281 (_keys!6105 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216188 d!58527))

(declare-fun d!58529 () Bool)

(assert (=> d!58529 (= (array_inv!3274 (_values!4043 thiss!1504)) (bvsge (size!5280 (_values!4043 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216188 d!58529))

(declare-fun d!58531 () Bool)

(declare-fun res!105742 () Bool)

(declare-fun e!140695 () Bool)

(assert (=> d!58531 (=> (not res!105742) (not e!140695))))

(declare-fun simpleValid!222 (LongMapFixedSize!2820) Bool)

(assert (=> d!58531 (= res!105742 (simpleValid!222 thiss!1504))))

(assert (=> d!58531 (= (valid!1146 thiss!1504) e!140695)))

(declare-fun b!216245 () Bool)

(declare-fun res!105743 () Bool)

(assert (=> b!216245 (=> (not res!105743) (not e!140695))))

(declare-fun arrayCountValidKeys!0 (array!10451 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!216245 (= res!105743 (= (arrayCountValidKeys!0 (_keys!6105 thiss!1504) #b00000000000000000000000000000000 (size!5281 (_keys!6105 thiss!1504))) (_size!1459 thiss!1504)))))

(declare-fun b!216246 () Bool)

(declare-fun res!105744 () Bool)

(assert (=> b!216246 (=> (not res!105744) (not e!140695))))

(assert (=> b!216246 (= res!105744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6105 thiss!1504) (mask!9787 thiss!1504)))))

(declare-fun b!216247 () Bool)

(assert (=> b!216247 (= e!140695 (arrayNoDuplicates!0 (_keys!6105 thiss!1504) #b00000000000000000000000000000000 Nil!3139))))

(assert (= (and d!58531 res!105742) b!216245))

(assert (= (and b!216245 res!105743) b!216246))

(assert (= (and b!216246 res!105744) b!216247))

(declare-fun m!243057 () Bool)

(assert (=> d!58531 m!243057))

(declare-fun m!243059 () Bool)

(assert (=> b!216245 m!243059))

(assert (=> b!216246 m!243017))

(assert (=> b!216247 m!243019))

(assert (=> start!21568 d!58531))

(declare-fun d!58533 () Bool)

(assert (=> d!58533 (= (validMask!0 (mask!9787 thiss!1504)) (and (or (= (mask!9787 thiss!1504) #b00000000000000000000000000000111) (= (mask!9787 thiss!1504) #b00000000000000000000000000001111) (= (mask!9787 thiss!1504) #b00000000000000000000000000011111) (= (mask!9787 thiss!1504) #b00000000000000000000000000111111) (= (mask!9787 thiss!1504) #b00000000000000000000000001111111) (= (mask!9787 thiss!1504) #b00000000000000000000000011111111) (= (mask!9787 thiss!1504) #b00000000000000000000000111111111) (= (mask!9787 thiss!1504) #b00000000000000000000001111111111) (= (mask!9787 thiss!1504) #b00000000000000000000011111111111) (= (mask!9787 thiss!1504) #b00000000000000000000111111111111) (= (mask!9787 thiss!1504) #b00000000000000000001111111111111) (= (mask!9787 thiss!1504) #b00000000000000000011111111111111) (= (mask!9787 thiss!1504) #b00000000000000000111111111111111) (= (mask!9787 thiss!1504) #b00000000000000001111111111111111) (= (mask!9787 thiss!1504) #b00000000000000011111111111111111) (= (mask!9787 thiss!1504) #b00000000000000111111111111111111) (= (mask!9787 thiss!1504) #b00000000000001111111111111111111) (= (mask!9787 thiss!1504) #b00000000000011111111111111111111) (= (mask!9787 thiss!1504) #b00000000000111111111111111111111) (= (mask!9787 thiss!1504) #b00000000001111111111111111111111) (= (mask!9787 thiss!1504) #b00000000011111111111111111111111) (= (mask!9787 thiss!1504) #b00000000111111111111111111111111) (= (mask!9787 thiss!1504) #b00000001111111111111111111111111) (= (mask!9787 thiss!1504) #b00000011111111111111111111111111) (= (mask!9787 thiss!1504) #b00000111111111111111111111111111) (= (mask!9787 thiss!1504) #b00001111111111111111111111111111) (= (mask!9787 thiss!1504) #b00011111111111111111111111111111) (= (mask!9787 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9787 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!216186 d!58533))

(declare-fun b!216256 () Bool)

(declare-fun e!140704 () Bool)

(declare-fun call!20376 () Bool)

(assert (=> b!216256 (= e!140704 call!20376)))

(declare-fun d!58535 () Bool)

(declare-fun res!105749 () Bool)

(declare-fun e!140702 () Bool)

(assert (=> d!58535 (=> res!105749 e!140702)))

(assert (=> d!58535 (= res!105749 (bvsge #b00000000000000000000000000000000 (size!5281 (_keys!6105 thiss!1504))))))

(assert (=> d!58535 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6105 thiss!1504) (mask!9787 thiss!1504)) e!140702)))

(declare-fun b!216257 () Bool)

(declare-fun e!140703 () Bool)

(assert (=> b!216257 (= e!140703 call!20376)))

(declare-fun b!216258 () Bool)

(assert (=> b!216258 (= e!140702 e!140703)))

(declare-fun c!36305 () Bool)

(assert (=> b!216258 (= c!36305 (validKeyInArray!0 (select (arr!4949 (_keys!6105 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20373 () Bool)

(assert (=> bm!20373 (= call!20376 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6105 thiss!1504) (mask!9787 thiss!1504)))))

(declare-fun b!216259 () Bool)

(assert (=> b!216259 (= e!140703 e!140704)))

(declare-fun lt!111129 () (_ BitVec 64))

(assert (=> b!216259 (= lt!111129 (select (arr!4949 (_keys!6105 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6504 0))(
  ( (Unit!6505) )
))
(declare-fun lt!111128 () Unit!6504)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10451 (_ BitVec 64) (_ BitVec 32)) Unit!6504)

(assert (=> b!216259 (= lt!111128 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6105 thiss!1504) lt!111129 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!216259 (arrayContainsKey!0 (_keys!6105 thiss!1504) lt!111129 #b00000000000000000000000000000000)))

(declare-fun lt!111127 () Unit!6504)

(assert (=> b!216259 (= lt!111127 lt!111128)))

(declare-fun res!105750 () Bool)

(assert (=> b!216259 (= res!105750 (= (seekEntryOrOpen!0 (select (arr!4949 (_keys!6105 thiss!1504)) #b00000000000000000000000000000000) (_keys!6105 thiss!1504) (mask!9787 thiss!1504)) (Found!741 #b00000000000000000000000000000000)))))

(assert (=> b!216259 (=> (not res!105750) (not e!140704))))

(assert (= (and d!58535 (not res!105749)) b!216258))

(assert (= (and b!216258 c!36305) b!216259))

(assert (= (and b!216258 (not c!36305)) b!216257))

(assert (= (and b!216259 res!105750) b!216256))

(assert (= (or b!216256 b!216257) bm!20373))

(assert (=> b!216258 m!243049))

(assert (=> b!216258 m!243049))

(assert (=> b!216258 m!243051))

(declare-fun m!243061 () Bool)

(assert (=> bm!20373 m!243061))

(assert (=> b!216259 m!243049))

(declare-fun m!243063 () Bool)

(assert (=> b!216259 m!243063))

(declare-fun m!243065 () Bool)

(assert (=> b!216259 m!243065))

(assert (=> b!216259 m!243049))

(declare-fun m!243067 () Bool)

(assert (=> b!216259 m!243067))

(assert (=> b!216190 d!58535))

(declare-fun lt!111137 () SeekEntryResult!741)

(declare-fun e!140711 () SeekEntryResult!741)

(declare-fun b!216272 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10451 (_ BitVec 32)) SeekEntryResult!741)

(assert (=> b!216272 (= e!140711 (seekKeyOrZeroReturnVacant!0 (x!22605 lt!111137) (index!5136 lt!111137) (index!5136 lt!111137) key!932 (_keys!6105 thiss!1504) (mask!9787 thiss!1504)))))

(declare-fun b!216273 () Bool)

(declare-fun e!140712 () SeekEntryResult!741)

(assert (=> b!216273 (= e!140712 Undefined!741)))

(declare-fun b!216275 () Bool)

(assert (=> b!216275 (= e!140711 (MissingZero!741 (index!5136 lt!111137)))))

(declare-fun b!216276 () Bool)

(declare-fun e!140713 () SeekEntryResult!741)

(assert (=> b!216276 (= e!140713 (Found!741 (index!5136 lt!111137)))))

(declare-fun b!216277 () Bool)

(declare-fun c!36312 () Bool)

(declare-fun lt!111138 () (_ BitVec 64))

(assert (=> b!216277 (= c!36312 (= lt!111138 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!216277 (= e!140713 e!140711)))

(declare-fun b!216274 () Bool)

(assert (=> b!216274 (= e!140712 e!140713)))

(assert (=> b!216274 (= lt!111138 (select (arr!4949 (_keys!6105 thiss!1504)) (index!5136 lt!111137)))))

(declare-fun c!36314 () Bool)

(assert (=> b!216274 (= c!36314 (= lt!111138 key!932))))

(declare-fun d!58537 () Bool)

(declare-fun lt!111136 () SeekEntryResult!741)

(assert (=> d!58537 (and (or ((_ is Undefined!741) lt!111136) (not ((_ is Found!741) lt!111136)) (and (bvsge (index!5135 lt!111136) #b00000000000000000000000000000000) (bvslt (index!5135 lt!111136) (size!5281 (_keys!6105 thiss!1504))))) (or ((_ is Undefined!741) lt!111136) ((_ is Found!741) lt!111136) (not ((_ is MissingZero!741) lt!111136)) (and (bvsge (index!5134 lt!111136) #b00000000000000000000000000000000) (bvslt (index!5134 lt!111136) (size!5281 (_keys!6105 thiss!1504))))) (or ((_ is Undefined!741) lt!111136) ((_ is Found!741) lt!111136) ((_ is MissingZero!741) lt!111136) (not ((_ is MissingVacant!741) lt!111136)) (and (bvsge (index!5137 lt!111136) #b00000000000000000000000000000000) (bvslt (index!5137 lt!111136) (size!5281 (_keys!6105 thiss!1504))))) (or ((_ is Undefined!741) lt!111136) (ite ((_ is Found!741) lt!111136) (= (select (arr!4949 (_keys!6105 thiss!1504)) (index!5135 lt!111136)) key!932) (ite ((_ is MissingZero!741) lt!111136) (= (select (arr!4949 (_keys!6105 thiss!1504)) (index!5134 lt!111136)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!741) lt!111136) (= (select (arr!4949 (_keys!6105 thiss!1504)) (index!5137 lt!111136)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58537 (= lt!111136 e!140712)))

(declare-fun c!36313 () Bool)

(assert (=> d!58537 (= c!36313 (and ((_ is Intermediate!741) lt!111137) (undefined!1553 lt!111137)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10451 (_ BitVec 32)) SeekEntryResult!741)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58537 (= lt!111137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9787 thiss!1504)) key!932 (_keys!6105 thiss!1504) (mask!9787 thiss!1504)))))

(assert (=> d!58537 (validMask!0 (mask!9787 thiss!1504))))

(assert (=> d!58537 (= (seekEntryOrOpen!0 key!932 (_keys!6105 thiss!1504) (mask!9787 thiss!1504)) lt!111136)))

(assert (= (and d!58537 c!36313) b!216273))

(assert (= (and d!58537 (not c!36313)) b!216274))

(assert (= (and b!216274 c!36314) b!216276))

(assert (= (and b!216274 (not c!36314)) b!216277))

(assert (= (and b!216277 c!36312) b!216275))

(assert (= (and b!216277 (not c!36312)) b!216272))

(declare-fun m!243069 () Bool)

(assert (=> b!216272 m!243069))

(declare-fun m!243071 () Bool)

(assert (=> b!216274 m!243071))

(declare-fun m!243073 () Bool)

(assert (=> d!58537 m!243073))

(declare-fun m!243075 () Bool)

(assert (=> d!58537 m!243075))

(declare-fun m!243077 () Bool)

(assert (=> d!58537 m!243077))

(assert (=> d!58537 m!243027))

(assert (=> d!58537 m!243075))

(declare-fun m!243079 () Bool)

(assert (=> d!58537 m!243079))

(declare-fun m!243081 () Bool)

(assert (=> d!58537 m!243081))

(assert (=> b!216184 d!58537))

(declare-fun b!216284 () Bool)

(declare-fun e!140719 () Bool)

(assert (=> b!216284 (= e!140719 tp_is_empty!5607)))

(declare-fun b!216285 () Bool)

(declare-fun e!140718 () Bool)

(assert (=> b!216285 (= e!140718 tp_is_empty!5607)))

(declare-fun condMapEmpty!9573 () Bool)

(declare-fun mapDefault!9573 () ValueCell!2460)

(assert (=> mapNonEmpty!9567 (= condMapEmpty!9573 (= mapRest!9567 ((as const (Array (_ BitVec 32) ValueCell!2460)) mapDefault!9573)))))

(declare-fun mapRes!9573 () Bool)

(assert (=> mapNonEmpty!9567 (= tp!20364 (and e!140718 mapRes!9573))))

(declare-fun mapIsEmpty!9573 () Bool)

(assert (=> mapIsEmpty!9573 mapRes!9573))

(declare-fun mapNonEmpty!9573 () Bool)

(declare-fun tp!20373 () Bool)

(assert (=> mapNonEmpty!9573 (= mapRes!9573 (and tp!20373 e!140719))))

(declare-fun mapRest!9573 () (Array (_ BitVec 32) ValueCell!2460))

(declare-fun mapValue!9573 () ValueCell!2460)

(declare-fun mapKey!9573 () (_ BitVec 32))

(assert (=> mapNonEmpty!9573 (= mapRest!9567 (store mapRest!9573 mapKey!9573 mapValue!9573))))

(assert (= (and mapNonEmpty!9567 condMapEmpty!9573) mapIsEmpty!9573))

(assert (= (and mapNonEmpty!9567 (not condMapEmpty!9573)) mapNonEmpty!9573))

(assert (= (and mapNonEmpty!9573 ((_ is ValueCellFull!2460) mapValue!9573)) b!216284))

(assert (= (and mapNonEmpty!9567 ((_ is ValueCellFull!2460) mapDefault!9573)) b!216285))

(declare-fun m!243083 () Bool)

(assert (=> mapNonEmpty!9573 m!243083))

(check-sat (not b!216258) b_and!12635 (not d!58531) (not b!216238) (not d!58537) (not b!216246) (not bm!20370) (not b!216245) (not b!216234) (not b!216272) (not b!216259) tp_is_empty!5607 (not mapNonEmpty!9573) (not b!216237) (not b!216247) (not b_next!5745) (not bm!20373))
(check-sat b_and!12635 (not b_next!5745))
