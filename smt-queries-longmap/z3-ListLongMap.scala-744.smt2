; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17268 () Bool)

(assert start!17268)

(declare-fun b!173169 () Bool)

(declare-fun b_free!4305 () Bool)

(declare-fun b_next!4305 () Bool)

(assert (=> b!173169 (= b_free!4305 (not b_next!4305))))

(declare-fun tp!15575 () Bool)

(declare-fun b_and!10745 () Bool)

(assert (=> b!173169 (= tp!15575 b_and!10745)))

(declare-fun mapNonEmpty!6939 () Bool)

(declare-fun mapRes!6939 () Bool)

(declare-fun tp!15576 () Bool)

(declare-fun e!114385 () Bool)

(assert (=> mapNonEmpty!6939 (= mapRes!6939 (and tp!15576 e!114385))))

(declare-datatypes ((V!5083 0))(
  ( (V!5084 (val!2083 Int)) )
))
(declare-datatypes ((ValueCell!1695 0))(
  ( (ValueCellFull!1695 (v!3951 V!5083)) (EmptyCell!1695) )
))
(declare-fun mapRest!6939 () (Array (_ BitVec 32) ValueCell!1695))

(declare-fun mapKey!6939 () (_ BitVec 32))

(declare-fun mapValue!6939 () ValueCell!1695)

(declare-datatypes ((array!7283 0))(
  ( (array!7284 (arr!3461 (Array (_ BitVec 32) (_ BitVec 64))) (size!3760 (_ BitVec 32))) )
))
(declare-datatypes ((array!7285 0))(
  ( (array!7286 (arr!3462 (Array (_ BitVec 32) ValueCell!1695)) (size!3761 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2298 0))(
  ( (LongMapFixedSize!2299 (defaultEntry!3595 Int) (mask!8463 (_ BitVec 32)) (extraKeys!3334 (_ BitVec 32)) (zeroValue!3436 V!5083) (minValue!3438 V!5083) (_size!1198 (_ BitVec 32)) (_keys!5435 array!7283) (_values!3578 array!7285) (_vacant!1198 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2298)

(assert (=> mapNonEmpty!6939 (= (arr!3462 (_values!3578 thiss!1248)) (store mapRest!6939 mapKey!6939 mapValue!6939))))

(declare-fun tp_is_empty!4077 () Bool)

(declare-fun e!114383 () Bool)

(declare-fun e!114386 () Bool)

(declare-fun array_inv!2215 (array!7283) Bool)

(declare-fun array_inv!2216 (array!7285) Bool)

(assert (=> b!173169 (= e!114383 (and tp!15575 tp_is_empty!4077 (array_inv!2215 (_keys!5435 thiss!1248)) (array_inv!2216 (_values!3578 thiss!1248)) e!114386))))

(declare-fun res!82220 () Bool)

(declare-fun e!114381 () Bool)

(assert (=> start!17268 (=> (not res!82220) (not e!114381))))

(declare-fun valid!971 (LongMapFixedSize!2298) Bool)

(assert (=> start!17268 (= res!82220 (valid!971 thiss!1248))))

(assert (=> start!17268 e!114381))

(assert (=> start!17268 e!114383))

(assert (=> start!17268 true))

(declare-fun b!173170 () Bool)

(declare-fun e!114382 () Bool)

(assert (=> b!173170 (= e!114382 tp_is_empty!4077)))

(declare-fun b!173171 () Bool)

(declare-fun res!82221 () Bool)

(assert (=> b!173171 (=> (not res!82221) (not e!114381))))

(assert (=> b!173171 (= res!82221 (and (= (size!3761 (_values!3578 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8463 thiss!1248))) (= (size!3760 (_keys!5435 thiss!1248)) (size!3761 (_values!3578 thiss!1248))) (bvsge (mask!8463 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3334 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3334 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3334 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3334 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!3334 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3334 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!3334 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!173172 () Bool)

(declare-fun res!82222 () Bool)

(assert (=> b!173172 (=> (not res!82222) (not e!114381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7283 (_ BitVec 32)) Bool)

(assert (=> b!173172 (= res!82222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5435 thiss!1248) (mask!8463 thiss!1248)))))

(declare-fun b!173173 () Bool)

(declare-fun res!82223 () Bool)

(assert (=> b!173173 (=> (not res!82223) (not e!114381))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!173173 (= res!82223 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!6939 () Bool)

(assert (=> mapIsEmpty!6939 mapRes!6939))

(declare-fun b!173174 () Bool)

(declare-datatypes ((List!2204 0))(
  ( (Nil!2201) (Cons!2200 (h!2817 (_ BitVec 64)) (t!7011 List!2204)) )
))
(declare-fun arrayNoDuplicates!0 (array!7283 (_ BitVec 32) List!2204) Bool)

(assert (=> b!173174 (= e!114381 (not (arrayNoDuplicates!0 (_keys!5435 thiss!1248) #b00000000000000000000000000000000 Nil!2201)))))

(declare-fun b!173175 () Bool)

(assert (=> b!173175 (= e!114385 tp_is_empty!4077)))

(declare-fun b!173176 () Bool)

(assert (=> b!173176 (= e!114386 (and e!114382 mapRes!6939))))

(declare-fun condMapEmpty!6939 () Bool)

(declare-fun mapDefault!6939 () ValueCell!1695)

(assert (=> b!173176 (= condMapEmpty!6939 (= (arr!3462 (_values!3578 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1695)) mapDefault!6939)))))

(declare-fun b!173177 () Bool)

(declare-fun res!82224 () Bool)

(assert (=> b!173177 (=> (not res!82224) (not e!114381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!173177 (= res!82224 (validMask!0 (mask!8463 thiss!1248)))))

(assert (= (and start!17268 res!82220) b!173173))

(assert (= (and b!173173 res!82223) b!173177))

(assert (= (and b!173177 res!82224) b!173171))

(assert (= (and b!173171 res!82221) b!173172))

(assert (= (and b!173172 res!82222) b!173174))

(assert (= (and b!173176 condMapEmpty!6939) mapIsEmpty!6939))

(assert (= (and b!173176 (not condMapEmpty!6939)) mapNonEmpty!6939))

(get-info :version)

(assert (= (and mapNonEmpty!6939 ((_ is ValueCellFull!1695) mapValue!6939)) b!173175))

(assert (= (and b!173176 ((_ is ValueCellFull!1695) mapDefault!6939)) b!173170))

(assert (= b!173169 b!173176))

(assert (= start!17268 b!173169))

(declare-fun m!201583 () Bool)

(assert (=> b!173174 m!201583))

(declare-fun m!201585 () Bool)

(assert (=> mapNonEmpty!6939 m!201585))

(declare-fun m!201587 () Bool)

(assert (=> start!17268 m!201587))

(declare-fun m!201589 () Bool)

(assert (=> b!173177 m!201589))

(declare-fun m!201591 () Bool)

(assert (=> b!173172 m!201591))

(declare-fun m!201593 () Bool)

(assert (=> b!173169 m!201593))

(declare-fun m!201595 () Bool)

(assert (=> b!173169 m!201595))

(check-sat b_and!10745 tp_is_empty!4077 (not b!173169) (not b_next!4305) (not b!173174) (not b!173177) (not mapNonEmpty!6939) (not b!173172) (not start!17268))
(check-sat b_and!10745 (not b_next!4305))
(get-model)

(declare-fun d!52575 () Bool)

(declare-fun res!82246 () Bool)

(declare-fun e!114407 () Bool)

(assert (=> d!52575 (=> (not res!82246) (not e!114407))))

(declare-fun simpleValid!143 (LongMapFixedSize!2298) Bool)

(assert (=> d!52575 (= res!82246 (simpleValid!143 thiss!1248))))

(assert (=> d!52575 (= (valid!971 thiss!1248) e!114407)))

(declare-fun b!173211 () Bool)

(declare-fun res!82247 () Bool)

(assert (=> b!173211 (=> (not res!82247) (not e!114407))))

(declare-fun arrayCountValidKeys!0 (array!7283 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!173211 (= res!82247 (= (arrayCountValidKeys!0 (_keys!5435 thiss!1248) #b00000000000000000000000000000000 (size!3760 (_keys!5435 thiss!1248))) (_size!1198 thiss!1248)))))

(declare-fun b!173212 () Bool)

(declare-fun res!82248 () Bool)

(assert (=> b!173212 (=> (not res!82248) (not e!114407))))

(assert (=> b!173212 (= res!82248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5435 thiss!1248) (mask!8463 thiss!1248)))))

(declare-fun b!173213 () Bool)

(assert (=> b!173213 (= e!114407 (arrayNoDuplicates!0 (_keys!5435 thiss!1248) #b00000000000000000000000000000000 Nil!2201))))

(assert (= (and d!52575 res!82246) b!173211))

(assert (= (and b!173211 res!82247) b!173212))

(assert (= (and b!173212 res!82248) b!173213))

(declare-fun m!201611 () Bool)

(assert (=> d!52575 m!201611))

(declare-fun m!201613 () Bool)

(assert (=> b!173211 m!201613))

(assert (=> b!173212 m!201591))

(assert (=> b!173213 m!201583))

(assert (=> start!17268 d!52575))

(declare-fun d!52577 () Bool)

(assert (=> d!52577 (= (validMask!0 (mask!8463 thiss!1248)) (and (or (= (mask!8463 thiss!1248) #b00000000000000000000000000000111) (= (mask!8463 thiss!1248) #b00000000000000000000000000001111) (= (mask!8463 thiss!1248) #b00000000000000000000000000011111) (= (mask!8463 thiss!1248) #b00000000000000000000000000111111) (= (mask!8463 thiss!1248) #b00000000000000000000000001111111) (= (mask!8463 thiss!1248) #b00000000000000000000000011111111) (= (mask!8463 thiss!1248) #b00000000000000000000000111111111) (= (mask!8463 thiss!1248) #b00000000000000000000001111111111) (= (mask!8463 thiss!1248) #b00000000000000000000011111111111) (= (mask!8463 thiss!1248) #b00000000000000000000111111111111) (= (mask!8463 thiss!1248) #b00000000000000000001111111111111) (= (mask!8463 thiss!1248) #b00000000000000000011111111111111) (= (mask!8463 thiss!1248) #b00000000000000000111111111111111) (= (mask!8463 thiss!1248) #b00000000000000001111111111111111) (= (mask!8463 thiss!1248) #b00000000000000011111111111111111) (= (mask!8463 thiss!1248) #b00000000000000111111111111111111) (= (mask!8463 thiss!1248) #b00000000000001111111111111111111) (= (mask!8463 thiss!1248) #b00000000000011111111111111111111) (= (mask!8463 thiss!1248) #b00000000000111111111111111111111) (= (mask!8463 thiss!1248) #b00000000001111111111111111111111) (= (mask!8463 thiss!1248) #b00000000011111111111111111111111) (= (mask!8463 thiss!1248) #b00000000111111111111111111111111) (= (mask!8463 thiss!1248) #b00000001111111111111111111111111) (= (mask!8463 thiss!1248) #b00000011111111111111111111111111) (= (mask!8463 thiss!1248) #b00000111111111111111111111111111) (= (mask!8463 thiss!1248) #b00001111111111111111111111111111) (= (mask!8463 thiss!1248) #b00011111111111111111111111111111) (= (mask!8463 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8463 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!173177 d!52577))

(declare-fun b!173222 () Bool)

(declare-fun e!114416 () Bool)

(declare-fun call!17554 () Bool)

(assert (=> b!173222 (= e!114416 call!17554)))

(declare-fun b!173223 () Bool)

(declare-fun e!114415 () Bool)

(assert (=> b!173223 (= e!114416 e!114415)))

(declare-fun lt!85711 () (_ BitVec 64))

(assert (=> b!173223 (= lt!85711 (select (arr!3461 (_keys!5435 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5312 0))(
  ( (Unit!5313) )
))
(declare-fun lt!85710 () Unit!5312)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7283 (_ BitVec 64) (_ BitVec 32)) Unit!5312)

(assert (=> b!173223 (= lt!85710 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5435 thiss!1248) lt!85711 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!173223 (arrayContainsKey!0 (_keys!5435 thiss!1248) lt!85711 #b00000000000000000000000000000000)))

(declare-fun lt!85709 () Unit!5312)

(assert (=> b!173223 (= lt!85709 lt!85710)))

(declare-fun res!82253 () Bool)

(declare-datatypes ((SeekEntryResult!541 0))(
  ( (MissingZero!541 (index!4332 (_ BitVec 32))) (Found!541 (index!4333 (_ BitVec 32))) (Intermediate!541 (undefined!1353 Bool) (index!4334 (_ BitVec 32)) (x!19164 (_ BitVec 32))) (Undefined!541) (MissingVacant!541 (index!4335 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7283 (_ BitVec 32)) SeekEntryResult!541)

(assert (=> b!173223 (= res!82253 (= (seekEntryOrOpen!0 (select (arr!3461 (_keys!5435 thiss!1248)) #b00000000000000000000000000000000) (_keys!5435 thiss!1248) (mask!8463 thiss!1248)) (Found!541 #b00000000000000000000000000000000)))))

(assert (=> b!173223 (=> (not res!82253) (not e!114415))))

(declare-fun b!173224 () Bool)

(assert (=> b!173224 (= e!114415 call!17554)))

(declare-fun b!173225 () Bool)

(declare-fun e!114414 () Bool)

(assert (=> b!173225 (= e!114414 e!114416)))

(declare-fun c!30893 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!173225 (= c!30893 (validKeyInArray!0 (select (arr!3461 (_keys!5435 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52579 () Bool)

(declare-fun res!82254 () Bool)

(assert (=> d!52579 (=> res!82254 e!114414)))

(assert (=> d!52579 (= res!82254 (bvsge #b00000000000000000000000000000000 (size!3760 (_keys!5435 thiss!1248))))))

(assert (=> d!52579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5435 thiss!1248) (mask!8463 thiss!1248)) e!114414)))

(declare-fun bm!17551 () Bool)

(assert (=> bm!17551 (= call!17554 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5435 thiss!1248) (mask!8463 thiss!1248)))))

(assert (= (and d!52579 (not res!82254)) b!173225))

(assert (= (and b!173225 c!30893) b!173223))

(assert (= (and b!173225 (not c!30893)) b!173222))

(assert (= (and b!173223 res!82253) b!173224))

(assert (= (or b!173224 b!173222) bm!17551))

(declare-fun m!201615 () Bool)

(assert (=> b!173223 m!201615))

(declare-fun m!201617 () Bool)

(assert (=> b!173223 m!201617))

(declare-fun m!201619 () Bool)

(assert (=> b!173223 m!201619))

(assert (=> b!173223 m!201615))

(declare-fun m!201621 () Bool)

(assert (=> b!173223 m!201621))

(assert (=> b!173225 m!201615))

(assert (=> b!173225 m!201615))

(declare-fun m!201623 () Bool)

(assert (=> b!173225 m!201623))

(declare-fun m!201625 () Bool)

(assert (=> bm!17551 m!201625))

(assert (=> b!173172 d!52579))

(declare-fun d!52581 () Bool)

(assert (=> d!52581 (= (array_inv!2215 (_keys!5435 thiss!1248)) (bvsge (size!3760 (_keys!5435 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173169 d!52581))

(declare-fun d!52583 () Bool)

(assert (=> d!52583 (= (array_inv!2216 (_values!3578 thiss!1248)) (bvsge (size!3761 (_values!3578 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173169 d!52583))

(declare-fun b!173236 () Bool)

(declare-fun e!114425 () Bool)

(declare-fun e!114428 () Bool)

(assert (=> b!173236 (= e!114425 e!114428)))

(declare-fun res!82261 () Bool)

(assert (=> b!173236 (=> (not res!82261) (not e!114428))))

(declare-fun e!114427 () Bool)

(assert (=> b!173236 (= res!82261 (not e!114427))))

(declare-fun res!82263 () Bool)

(assert (=> b!173236 (=> (not res!82263) (not e!114427))))

(assert (=> b!173236 (= res!82263 (validKeyInArray!0 (select (arr!3461 (_keys!5435 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17554 () Bool)

(declare-fun call!17557 () Bool)

(declare-fun c!30896 () Bool)

(assert (=> bm!17554 (= call!17557 (arrayNoDuplicates!0 (_keys!5435 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30896 (Cons!2200 (select (arr!3461 (_keys!5435 thiss!1248)) #b00000000000000000000000000000000) Nil!2201) Nil!2201)))))

(declare-fun b!173237 () Bool)

(declare-fun e!114426 () Bool)

(assert (=> b!173237 (= e!114426 call!17557)))

(declare-fun b!173238 () Bool)

(declare-fun contains!1153 (List!2204 (_ BitVec 64)) Bool)

(assert (=> b!173238 (= e!114427 (contains!1153 Nil!2201 (select (arr!3461 (_keys!5435 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52585 () Bool)

(declare-fun res!82262 () Bool)

(assert (=> d!52585 (=> res!82262 e!114425)))

(assert (=> d!52585 (= res!82262 (bvsge #b00000000000000000000000000000000 (size!3760 (_keys!5435 thiss!1248))))))

(assert (=> d!52585 (= (arrayNoDuplicates!0 (_keys!5435 thiss!1248) #b00000000000000000000000000000000 Nil!2201) e!114425)))

(declare-fun b!173239 () Bool)

(assert (=> b!173239 (= e!114426 call!17557)))

(declare-fun b!173240 () Bool)

(assert (=> b!173240 (= e!114428 e!114426)))

(assert (=> b!173240 (= c!30896 (validKeyInArray!0 (select (arr!3461 (_keys!5435 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52585 (not res!82262)) b!173236))

(assert (= (and b!173236 res!82263) b!173238))

(assert (= (and b!173236 res!82261) b!173240))

(assert (= (and b!173240 c!30896) b!173239))

(assert (= (and b!173240 (not c!30896)) b!173237))

(assert (= (or b!173239 b!173237) bm!17554))

(assert (=> b!173236 m!201615))

(assert (=> b!173236 m!201615))

(assert (=> b!173236 m!201623))

(assert (=> bm!17554 m!201615))

(declare-fun m!201627 () Bool)

(assert (=> bm!17554 m!201627))

(assert (=> b!173238 m!201615))

(assert (=> b!173238 m!201615))

(declare-fun m!201629 () Bool)

(assert (=> b!173238 m!201629))

(assert (=> b!173240 m!201615))

(assert (=> b!173240 m!201615))

(assert (=> b!173240 m!201623))

(assert (=> b!173174 d!52585))

(declare-fun mapNonEmpty!6945 () Bool)

(declare-fun mapRes!6945 () Bool)

(declare-fun tp!15585 () Bool)

(declare-fun e!114434 () Bool)

(assert (=> mapNonEmpty!6945 (= mapRes!6945 (and tp!15585 e!114434))))

(declare-fun mapKey!6945 () (_ BitVec 32))

(declare-fun mapRest!6945 () (Array (_ BitVec 32) ValueCell!1695))

(declare-fun mapValue!6945 () ValueCell!1695)

(assert (=> mapNonEmpty!6945 (= mapRest!6939 (store mapRest!6945 mapKey!6945 mapValue!6945))))

(declare-fun mapIsEmpty!6945 () Bool)

(assert (=> mapIsEmpty!6945 mapRes!6945))

(declare-fun b!173247 () Bool)

(assert (=> b!173247 (= e!114434 tp_is_empty!4077)))

(declare-fun b!173248 () Bool)

(declare-fun e!114433 () Bool)

(assert (=> b!173248 (= e!114433 tp_is_empty!4077)))

(declare-fun condMapEmpty!6945 () Bool)

(declare-fun mapDefault!6945 () ValueCell!1695)

(assert (=> mapNonEmpty!6939 (= condMapEmpty!6945 (= mapRest!6939 ((as const (Array (_ BitVec 32) ValueCell!1695)) mapDefault!6945)))))

(assert (=> mapNonEmpty!6939 (= tp!15576 (and e!114433 mapRes!6945))))

(assert (= (and mapNonEmpty!6939 condMapEmpty!6945) mapIsEmpty!6945))

(assert (= (and mapNonEmpty!6939 (not condMapEmpty!6945)) mapNonEmpty!6945))

(assert (= (and mapNonEmpty!6945 ((_ is ValueCellFull!1695) mapValue!6945)) b!173247))

(assert (= (and mapNonEmpty!6939 ((_ is ValueCellFull!1695) mapDefault!6945)) b!173248))

(declare-fun m!201631 () Bool)

(assert (=> mapNonEmpty!6945 m!201631))

(check-sat (not bm!17554) b_and!10745 (not bm!17551) (not b!173213) (not b!173223) (not b!173225) (not b_next!4305) (not b!173240) tp_is_empty!4077 (not d!52575) (not b!173211) (not b!173236) (not b!173238) (not mapNonEmpty!6945) (not b!173212))
(check-sat b_and!10745 (not b_next!4305))
