; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17270 () Bool)

(assert start!17270)

(declare-fun b!173192 () Bool)

(declare-fun b_free!4303 () Bool)

(declare-fun b_next!4303 () Bool)

(assert (=> b!173192 (= b_free!4303 (not b_next!4303))))

(declare-fun tp!15570 () Bool)

(declare-fun b_and!10757 () Bool)

(assert (=> b!173192 (= tp!15570 b_and!10757)))

(declare-fun mapNonEmpty!6936 () Bool)

(declare-fun mapRes!6936 () Bool)

(declare-fun tp!15569 () Bool)

(declare-fun e!114390 () Bool)

(assert (=> mapNonEmpty!6936 (= mapRes!6936 (and tp!15569 e!114390))))

(declare-datatypes ((V!5081 0))(
  ( (V!5082 (val!2082 Int)) )
))
(declare-datatypes ((ValueCell!1694 0))(
  ( (ValueCellFull!1694 (v!3951 V!5081)) (EmptyCell!1694) )
))
(declare-fun mapRest!6936 () (Array (_ BitVec 32) ValueCell!1694))

(declare-fun mapKey!6936 () (_ BitVec 32))

(declare-fun mapValue!6936 () ValueCell!1694)

(declare-datatypes ((array!7265 0))(
  ( (array!7266 (arr!3452 (Array (_ BitVec 32) (_ BitVec 64))) (size!3751 (_ BitVec 32))) )
))
(declare-datatypes ((array!7267 0))(
  ( (array!7268 (arr!3453 (Array (_ BitVec 32) ValueCell!1694)) (size!3752 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2296 0))(
  ( (LongMapFixedSize!2297 (defaultEntry!3594 Int) (mask!8462 (_ BitVec 32)) (extraKeys!3333 (_ BitVec 32)) (zeroValue!3435 V!5081) (minValue!3437 V!5081) (_size!1197 (_ BitVec 32)) (_keys!5434 array!7265) (_values!3577 array!7267) (_vacant!1197 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2296)

(assert (=> mapNonEmpty!6936 (= (arr!3453 (_values!3577 thiss!1248)) (store mapRest!6936 mapKey!6936 mapValue!6936))))

(declare-fun b!173189 () Bool)

(declare-fun res!82226 () Bool)

(declare-fun e!114392 () Bool)

(assert (=> b!173189 (=> (not res!82226) (not e!114392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!173189 (= res!82226 (validMask!0 (mask!8462 thiss!1248)))))

(declare-fun b!173191 () Bool)

(declare-fun tp_is_empty!4075 () Bool)

(assert (=> b!173191 (= e!114390 tp_is_empty!4075)))

(declare-fun e!114389 () Bool)

(declare-fun e!114391 () Bool)

(declare-fun array_inv!2225 (array!7265) Bool)

(declare-fun array_inv!2226 (array!7267) Bool)

(assert (=> b!173192 (= e!114391 (and tp!15570 tp_is_empty!4075 (array_inv!2225 (_keys!5434 thiss!1248)) (array_inv!2226 (_values!3577 thiss!1248)) e!114389))))

(declare-fun b!173193 () Bool)

(declare-fun e!114387 () Bool)

(assert (=> b!173193 (= e!114389 (and e!114387 mapRes!6936))))

(declare-fun condMapEmpty!6936 () Bool)

(declare-fun mapDefault!6936 () ValueCell!1694)

(assert (=> b!173193 (= condMapEmpty!6936 (= (arr!3453 (_values!3577 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1694)) mapDefault!6936)))))

(declare-fun b!173194 () Bool)

(assert (=> b!173194 (= e!114387 tp_is_empty!4075)))

(declare-fun b!173195 () Bool)

(declare-fun res!82230 () Bool)

(assert (=> b!173195 (=> (not res!82230) (not e!114392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7265 (_ BitVec 32)) Bool)

(assert (=> b!173195 (= res!82230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5434 thiss!1248) (mask!8462 thiss!1248)))))

(declare-fun b!173196 () Bool)

(declare-datatypes ((List!2186 0))(
  ( (Nil!2183) (Cons!2182 (h!2799 (_ BitVec 64)) (t!6985 List!2186)) )
))
(declare-fun arrayNoDuplicates!0 (array!7265 (_ BitVec 32) List!2186) Bool)

(assert (=> b!173196 (= e!114392 (not (arrayNoDuplicates!0 (_keys!5434 thiss!1248) #b00000000000000000000000000000000 Nil!2183)))))

(declare-fun b!173197 () Bool)

(declare-fun res!82227 () Bool)

(assert (=> b!173197 (=> (not res!82227) (not e!114392))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!173197 (= res!82227 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!6936 () Bool)

(assert (=> mapIsEmpty!6936 mapRes!6936))

(declare-fun b!173190 () Bool)

(declare-fun res!82228 () Bool)

(assert (=> b!173190 (=> (not res!82228) (not e!114392))))

(assert (=> b!173190 (= res!82228 (and (= (size!3752 (_values!3577 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8462 thiss!1248))) (= (size!3751 (_keys!5434 thiss!1248)) (size!3752 (_values!3577 thiss!1248))) (bvsge (mask!8462 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3333 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3333 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3333 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3333 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!3333 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3333 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!3333 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!82229 () Bool)

(assert (=> start!17270 (=> (not res!82229) (not e!114392))))

(declare-fun valid!985 (LongMapFixedSize!2296) Bool)

(assert (=> start!17270 (= res!82229 (valid!985 thiss!1248))))

(assert (=> start!17270 e!114392))

(assert (=> start!17270 e!114391))

(assert (=> start!17270 true))

(assert (= (and start!17270 res!82229) b!173197))

(assert (= (and b!173197 res!82227) b!173189))

(assert (= (and b!173189 res!82226) b!173190))

(assert (= (and b!173190 res!82228) b!173195))

(assert (= (and b!173195 res!82230) b!173196))

(assert (= (and b!173193 condMapEmpty!6936) mapIsEmpty!6936))

(assert (= (and b!173193 (not condMapEmpty!6936)) mapNonEmpty!6936))

(get-info :version)

(assert (= (and mapNonEmpty!6936 ((_ is ValueCellFull!1694) mapValue!6936)) b!173191))

(assert (= (and b!173193 ((_ is ValueCellFull!1694) mapDefault!6936)) b!173194))

(assert (= b!173192 b!173193))

(assert (= start!17270 b!173192))

(declare-fun m!201751 () Bool)

(assert (=> b!173196 m!201751))

(declare-fun m!201753 () Bool)

(assert (=> start!17270 m!201753))

(declare-fun m!201755 () Bool)

(assert (=> b!173195 m!201755))

(declare-fun m!201757 () Bool)

(assert (=> mapNonEmpty!6936 m!201757))

(declare-fun m!201759 () Bool)

(assert (=> b!173189 m!201759))

(declare-fun m!201761 () Bool)

(assert (=> b!173192 m!201761))

(declare-fun m!201763 () Bool)

(assert (=> b!173192 m!201763))

(check-sat b_and!10757 (not mapNonEmpty!6936) (not b!173195) (not b!173189) tp_is_empty!4075 (not b!173192) (not b_next!4303) (not start!17270) (not b!173196))
(check-sat b_and!10757 (not b_next!4303))
(get-model)

(declare-fun d!52649 () Bool)

(assert (=> d!52649 (= (validMask!0 (mask!8462 thiss!1248)) (and (or (= (mask!8462 thiss!1248) #b00000000000000000000000000000111) (= (mask!8462 thiss!1248) #b00000000000000000000000000001111) (= (mask!8462 thiss!1248) #b00000000000000000000000000011111) (= (mask!8462 thiss!1248) #b00000000000000000000000000111111) (= (mask!8462 thiss!1248) #b00000000000000000000000001111111) (= (mask!8462 thiss!1248) #b00000000000000000000000011111111) (= (mask!8462 thiss!1248) #b00000000000000000000000111111111) (= (mask!8462 thiss!1248) #b00000000000000000000001111111111) (= (mask!8462 thiss!1248) #b00000000000000000000011111111111) (= (mask!8462 thiss!1248) #b00000000000000000000111111111111) (= (mask!8462 thiss!1248) #b00000000000000000001111111111111) (= (mask!8462 thiss!1248) #b00000000000000000011111111111111) (= (mask!8462 thiss!1248) #b00000000000000000111111111111111) (= (mask!8462 thiss!1248) #b00000000000000001111111111111111) (= (mask!8462 thiss!1248) #b00000000000000011111111111111111) (= (mask!8462 thiss!1248) #b00000000000000111111111111111111) (= (mask!8462 thiss!1248) #b00000000000001111111111111111111) (= (mask!8462 thiss!1248) #b00000000000011111111111111111111) (= (mask!8462 thiss!1248) #b00000000000111111111111111111111) (= (mask!8462 thiss!1248) #b00000000001111111111111111111111) (= (mask!8462 thiss!1248) #b00000000011111111111111111111111) (= (mask!8462 thiss!1248) #b00000000111111111111111111111111) (= (mask!8462 thiss!1248) #b00000001111111111111111111111111) (= (mask!8462 thiss!1248) #b00000011111111111111111111111111) (= (mask!8462 thiss!1248) #b00000111111111111111111111111111) (= (mask!8462 thiss!1248) #b00001111111111111111111111111111) (= (mask!8462 thiss!1248) #b00011111111111111111111111111111) (= (mask!8462 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8462 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!173189 d!52649))

(declare-fun b!173262 () Bool)

(declare-fun e!114440 () Bool)

(declare-fun call!17542 () Bool)

(assert (=> b!173262 (= e!114440 call!17542)))

(declare-fun b!173263 () Bool)

(declare-fun e!114439 () Bool)

(assert (=> b!173263 (= e!114439 e!114440)))

(declare-fun c!30906 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!173263 (= c!30906 (validKeyInArray!0 (select (arr!3452 (_keys!5434 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52651 () Bool)

(declare-fun res!82267 () Bool)

(declare-fun e!114438 () Bool)

(assert (=> d!52651 (=> res!82267 e!114438)))

(assert (=> d!52651 (= res!82267 (bvsge #b00000000000000000000000000000000 (size!3751 (_keys!5434 thiss!1248))))))

(assert (=> d!52651 (= (arrayNoDuplicates!0 (_keys!5434 thiss!1248) #b00000000000000000000000000000000 Nil!2183) e!114438)))

(declare-fun b!173264 () Bool)

(assert (=> b!173264 (= e!114438 e!114439)))

(declare-fun res!82269 () Bool)

(assert (=> b!173264 (=> (not res!82269) (not e!114439))))

(declare-fun e!114437 () Bool)

(assert (=> b!173264 (= res!82269 (not e!114437))))

(declare-fun res!82268 () Bool)

(assert (=> b!173264 (=> (not res!82268) (not e!114437))))

(assert (=> b!173264 (= res!82268 (validKeyInArray!0 (select (arr!3452 (_keys!5434 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173265 () Bool)

(assert (=> b!173265 (= e!114440 call!17542)))

(declare-fun bm!17539 () Bool)

(assert (=> bm!17539 (= call!17542 (arrayNoDuplicates!0 (_keys!5434 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30906 (Cons!2182 (select (arr!3452 (_keys!5434 thiss!1248)) #b00000000000000000000000000000000) Nil!2183) Nil!2183)))))

(declare-fun b!173266 () Bool)

(declare-fun contains!1148 (List!2186 (_ BitVec 64)) Bool)

(assert (=> b!173266 (= e!114437 (contains!1148 Nil!2183 (select (arr!3452 (_keys!5434 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52651 (not res!82267)) b!173264))

(assert (= (and b!173264 res!82268) b!173266))

(assert (= (and b!173264 res!82269) b!173263))

(assert (= (and b!173263 c!30906) b!173265))

(assert (= (and b!173263 (not c!30906)) b!173262))

(assert (= (or b!173265 b!173262) bm!17539))

(declare-fun m!201793 () Bool)

(assert (=> b!173263 m!201793))

(assert (=> b!173263 m!201793))

(declare-fun m!201795 () Bool)

(assert (=> b!173263 m!201795))

(assert (=> b!173264 m!201793))

(assert (=> b!173264 m!201793))

(assert (=> b!173264 m!201795))

(assert (=> bm!17539 m!201793))

(declare-fun m!201797 () Bool)

(assert (=> bm!17539 m!201797))

(assert (=> b!173266 m!201793))

(assert (=> b!173266 m!201793))

(declare-fun m!201799 () Bool)

(assert (=> b!173266 m!201799))

(assert (=> b!173196 d!52651))

(declare-fun d!52653 () Bool)

(declare-fun res!82275 () Bool)

(declare-fun e!114449 () Bool)

(assert (=> d!52653 (=> res!82275 e!114449)))

(assert (=> d!52653 (= res!82275 (bvsge #b00000000000000000000000000000000 (size!3751 (_keys!5434 thiss!1248))))))

(assert (=> d!52653 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5434 thiss!1248) (mask!8462 thiss!1248)) e!114449)))

(declare-fun b!173275 () Bool)

(declare-fun e!114448 () Bool)

(declare-fun call!17545 () Bool)

(assert (=> b!173275 (= e!114448 call!17545)))

(declare-fun b!173276 () Bool)

(declare-fun e!114447 () Bool)

(assert (=> b!173276 (= e!114448 e!114447)))

(declare-fun lt!85770 () (_ BitVec 64))

(assert (=> b!173276 (= lt!85770 (select (arr!3452 (_keys!5434 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5313 0))(
  ( (Unit!5314) )
))
(declare-fun lt!85769 () Unit!5313)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7265 (_ BitVec 64) (_ BitVec 32)) Unit!5313)

(assert (=> b!173276 (= lt!85769 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5434 thiss!1248) lt!85770 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!173276 (arrayContainsKey!0 (_keys!5434 thiss!1248) lt!85770 #b00000000000000000000000000000000)))

(declare-fun lt!85768 () Unit!5313)

(assert (=> b!173276 (= lt!85768 lt!85769)))

(declare-fun res!82274 () Bool)

(declare-datatypes ((SeekEntryResult!535 0))(
  ( (MissingZero!535 (index!4308 (_ BitVec 32))) (Found!535 (index!4309 (_ BitVec 32))) (Intermediate!535 (undefined!1347 Bool) (index!4310 (_ BitVec 32)) (x!19158 (_ BitVec 32))) (Undefined!535) (MissingVacant!535 (index!4311 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7265 (_ BitVec 32)) SeekEntryResult!535)

(assert (=> b!173276 (= res!82274 (= (seekEntryOrOpen!0 (select (arr!3452 (_keys!5434 thiss!1248)) #b00000000000000000000000000000000) (_keys!5434 thiss!1248) (mask!8462 thiss!1248)) (Found!535 #b00000000000000000000000000000000)))))

(assert (=> b!173276 (=> (not res!82274) (not e!114447))))

(declare-fun b!173277 () Bool)

(assert (=> b!173277 (= e!114447 call!17545)))

(declare-fun bm!17542 () Bool)

(assert (=> bm!17542 (= call!17545 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5434 thiss!1248) (mask!8462 thiss!1248)))))

(declare-fun b!173278 () Bool)

(assert (=> b!173278 (= e!114449 e!114448)))

(declare-fun c!30909 () Bool)

(assert (=> b!173278 (= c!30909 (validKeyInArray!0 (select (arr!3452 (_keys!5434 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52653 (not res!82275)) b!173278))

(assert (= (and b!173278 c!30909) b!173276))

(assert (= (and b!173278 (not c!30909)) b!173275))

(assert (= (and b!173276 res!82274) b!173277))

(assert (= (or b!173277 b!173275) bm!17542))

(assert (=> b!173276 m!201793))

(declare-fun m!201801 () Bool)

(assert (=> b!173276 m!201801))

(declare-fun m!201803 () Bool)

(assert (=> b!173276 m!201803))

(assert (=> b!173276 m!201793))

(declare-fun m!201805 () Bool)

(assert (=> b!173276 m!201805))

(declare-fun m!201807 () Bool)

(assert (=> bm!17542 m!201807))

(assert (=> b!173278 m!201793))

(assert (=> b!173278 m!201793))

(assert (=> b!173278 m!201795))

(assert (=> b!173195 d!52653))

(declare-fun d!52655 () Bool)

(assert (=> d!52655 (= (array_inv!2225 (_keys!5434 thiss!1248)) (bvsge (size!3751 (_keys!5434 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173192 d!52655))

(declare-fun d!52657 () Bool)

(assert (=> d!52657 (= (array_inv!2226 (_values!3577 thiss!1248)) (bvsge (size!3752 (_values!3577 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173192 d!52657))

(declare-fun d!52659 () Bool)

(declare-fun res!82282 () Bool)

(declare-fun e!114452 () Bool)

(assert (=> d!52659 (=> (not res!82282) (not e!114452))))

(declare-fun simpleValid!143 (LongMapFixedSize!2296) Bool)

(assert (=> d!52659 (= res!82282 (simpleValid!143 thiss!1248))))

(assert (=> d!52659 (= (valid!985 thiss!1248) e!114452)))

(declare-fun b!173285 () Bool)

(declare-fun res!82283 () Bool)

(assert (=> b!173285 (=> (not res!82283) (not e!114452))))

(declare-fun arrayCountValidKeys!0 (array!7265 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!173285 (= res!82283 (= (arrayCountValidKeys!0 (_keys!5434 thiss!1248) #b00000000000000000000000000000000 (size!3751 (_keys!5434 thiss!1248))) (_size!1197 thiss!1248)))))

(declare-fun b!173286 () Bool)

(declare-fun res!82284 () Bool)

(assert (=> b!173286 (=> (not res!82284) (not e!114452))))

(assert (=> b!173286 (= res!82284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5434 thiss!1248) (mask!8462 thiss!1248)))))

(declare-fun b!173287 () Bool)

(assert (=> b!173287 (= e!114452 (arrayNoDuplicates!0 (_keys!5434 thiss!1248) #b00000000000000000000000000000000 Nil!2183))))

(assert (= (and d!52659 res!82282) b!173285))

(assert (= (and b!173285 res!82283) b!173286))

(assert (= (and b!173286 res!82284) b!173287))

(declare-fun m!201809 () Bool)

(assert (=> d!52659 m!201809))

(declare-fun m!201811 () Bool)

(assert (=> b!173285 m!201811))

(assert (=> b!173286 m!201755))

(assert (=> b!173287 m!201751))

(assert (=> start!17270 d!52659))

(declare-fun condMapEmpty!6945 () Bool)

(declare-fun mapDefault!6945 () ValueCell!1694)

(assert (=> mapNonEmpty!6936 (= condMapEmpty!6945 (= mapRest!6936 ((as const (Array (_ BitVec 32) ValueCell!1694)) mapDefault!6945)))))

(declare-fun e!114457 () Bool)

(declare-fun mapRes!6945 () Bool)

(assert (=> mapNonEmpty!6936 (= tp!15569 (and e!114457 mapRes!6945))))

(declare-fun mapIsEmpty!6945 () Bool)

(assert (=> mapIsEmpty!6945 mapRes!6945))

(declare-fun mapNonEmpty!6945 () Bool)

(declare-fun tp!15585 () Bool)

(declare-fun e!114458 () Bool)

(assert (=> mapNonEmpty!6945 (= mapRes!6945 (and tp!15585 e!114458))))

(declare-fun mapKey!6945 () (_ BitVec 32))

(declare-fun mapValue!6945 () ValueCell!1694)

(declare-fun mapRest!6945 () (Array (_ BitVec 32) ValueCell!1694))

(assert (=> mapNonEmpty!6945 (= mapRest!6936 (store mapRest!6945 mapKey!6945 mapValue!6945))))

(declare-fun b!173294 () Bool)

(assert (=> b!173294 (= e!114458 tp_is_empty!4075)))

(declare-fun b!173295 () Bool)

(assert (=> b!173295 (= e!114457 tp_is_empty!4075)))

(assert (= (and mapNonEmpty!6936 condMapEmpty!6945) mapIsEmpty!6945))

(assert (= (and mapNonEmpty!6936 (not condMapEmpty!6945)) mapNonEmpty!6945))

(assert (= (and mapNonEmpty!6945 ((_ is ValueCellFull!1694) mapValue!6945)) b!173294))

(assert (= (and mapNonEmpty!6936 ((_ is ValueCellFull!1694) mapDefault!6945)) b!173295))

(declare-fun m!201813 () Bool)

(assert (=> mapNonEmpty!6945 m!201813))

(check-sat (not b!173266) (not b!173264) (not mapNonEmpty!6945) tp_is_empty!4075 (not bm!17542) (not bm!17539) (not b!173285) (not b!173286) (not b!173263) b_and!10757 (not d!52659) (not b!173278) (not b!173276) (not b!173287) (not b_next!4303))
(check-sat b_and!10757 (not b_next!4303))
