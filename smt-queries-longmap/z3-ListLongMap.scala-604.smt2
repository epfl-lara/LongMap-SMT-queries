; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15768 () Bool)

(assert start!15768)

(declare-fun b!157352 () Bool)

(declare-fun b_free!3435 () Bool)

(declare-fun b_next!3435 () Bool)

(assert (=> b!157352 (= b_free!3435 (not b_next!3435))))

(declare-fun tp!12829 () Bool)

(declare-fun b_and!9849 () Bool)

(assert (=> b!157352 (= tp!12829 b_and!9849)))

(declare-fun res!74362 () Bool)

(declare-fun e!103024 () Bool)

(assert (=> start!15768 (=> (not res!74362) (not e!103024))))

(declare-datatypes ((V!3963 0))(
  ( (V!3964 (val!1663 Int)) )
))
(declare-datatypes ((ValueCell!1275 0))(
  ( (ValueCellFull!1275 (v!3528 V!3963)) (EmptyCell!1275) )
))
(declare-datatypes ((array!5527 0))(
  ( (array!5528 (arr!2621 (Array (_ BitVec 32) (_ BitVec 64))) (size!2899 (_ BitVec 32))) )
))
(declare-datatypes ((array!5529 0))(
  ( (array!5530 (arr!2622 (Array (_ BitVec 32) ValueCell!1275)) (size!2900 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1458 0))(
  ( (LongMapFixedSize!1459 (defaultEntry!3171 Int) (mask!7648 (_ BitVec 32)) (extraKeys!2912 (_ BitVec 32)) (zeroValue!3014 V!3963) (minValue!3014 V!3963) (_size!778 (_ BitVec 32)) (_keys!4946 array!5527) (_values!3154 array!5529) (_vacant!778 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1458)

(declare-fun valid!692 (LongMapFixedSize!1458) Bool)

(assert (=> start!15768 (= res!74362 (valid!692 thiss!1248))))

(assert (=> start!15768 e!103024))

(declare-fun e!103028 () Bool)

(assert (=> start!15768 e!103028))

(assert (=> start!15768 true))

(declare-fun b!157347 () Bool)

(declare-fun e!103027 () Bool)

(declare-fun tp_is_empty!3237 () Bool)

(assert (=> b!157347 (= e!103027 tp_is_empty!3237)))

(declare-fun mapIsEmpty!5498 () Bool)

(declare-fun mapRes!5498 () Bool)

(assert (=> mapIsEmpty!5498 mapRes!5498))

(declare-fun b!157348 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157348 (= e!103024 (not (validMask!0 (mask!7648 thiss!1248))))))

(declare-fun b!157349 () Bool)

(declare-fun e!103026 () Bool)

(declare-fun e!103029 () Bool)

(assert (=> b!157349 (= e!103026 (and e!103029 mapRes!5498))))

(declare-fun condMapEmpty!5498 () Bool)

(declare-fun mapDefault!5498 () ValueCell!1275)

(assert (=> b!157349 (= condMapEmpty!5498 (= (arr!2622 (_values!3154 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1275)) mapDefault!5498)))))

(declare-fun b!157350 () Bool)

(declare-fun res!74361 () Bool)

(assert (=> b!157350 (=> (not res!74361) (not e!103024))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157350 (= res!74361 (not (= key!828 (bvneg key!828))))))

(declare-fun b!157351 () Bool)

(assert (=> b!157351 (= e!103029 tp_is_empty!3237)))

(declare-fun array_inv!1661 (array!5527) Bool)

(declare-fun array_inv!1662 (array!5529) Bool)

(assert (=> b!157352 (= e!103028 (and tp!12829 tp_is_empty!3237 (array_inv!1661 (_keys!4946 thiss!1248)) (array_inv!1662 (_values!3154 thiss!1248)) e!103026))))

(declare-fun mapNonEmpty!5498 () Bool)

(declare-fun tp!12830 () Bool)

(assert (=> mapNonEmpty!5498 (= mapRes!5498 (and tp!12830 e!103027))))

(declare-fun mapValue!5498 () ValueCell!1275)

(declare-fun mapKey!5498 () (_ BitVec 32))

(declare-fun mapRest!5498 () (Array (_ BitVec 32) ValueCell!1275))

(assert (=> mapNonEmpty!5498 (= (arr!2622 (_values!3154 thiss!1248)) (store mapRest!5498 mapKey!5498 mapValue!5498))))

(assert (= (and start!15768 res!74362) b!157350))

(assert (= (and b!157350 res!74361) b!157348))

(assert (= (and b!157349 condMapEmpty!5498) mapIsEmpty!5498))

(assert (= (and b!157349 (not condMapEmpty!5498)) mapNonEmpty!5498))

(get-info :version)

(assert (= (and mapNonEmpty!5498 ((_ is ValueCellFull!1275) mapValue!5498)) b!157347))

(assert (= (and b!157349 ((_ is ValueCellFull!1275) mapDefault!5498)) b!157351))

(assert (= b!157352 b!157349))

(assert (= start!15768 b!157352))

(declare-fun m!190621 () Bool)

(assert (=> start!15768 m!190621))

(declare-fun m!190623 () Bool)

(assert (=> b!157348 m!190623))

(declare-fun m!190625 () Bool)

(assert (=> b!157352 m!190625))

(declare-fun m!190627 () Bool)

(assert (=> b!157352 m!190627))

(declare-fun m!190629 () Bool)

(assert (=> mapNonEmpty!5498 m!190629))

(check-sat b_and!9849 (not b!157352) (not b!157348) (not b_next!3435) (not mapNonEmpty!5498) (not start!15768) tp_is_empty!3237)
(check-sat b_and!9849 (not b_next!3435))
(get-model)

(declare-fun d!51039 () Bool)

(assert (=> d!51039 (= (array_inv!1661 (_keys!4946 thiss!1248)) (bvsge (size!2899 (_keys!4946 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157352 d!51039))

(declare-fun d!51041 () Bool)

(assert (=> d!51041 (= (array_inv!1662 (_values!3154 thiss!1248)) (bvsge (size!2900 (_values!3154 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157352 d!51041))

(declare-fun d!51043 () Bool)

(assert (=> d!51043 (= (validMask!0 (mask!7648 thiss!1248)) (and (or (= (mask!7648 thiss!1248) #b00000000000000000000000000000111) (= (mask!7648 thiss!1248) #b00000000000000000000000000001111) (= (mask!7648 thiss!1248) #b00000000000000000000000000011111) (= (mask!7648 thiss!1248) #b00000000000000000000000000111111) (= (mask!7648 thiss!1248) #b00000000000000000000000001111111) (= (mask!7648 thiss!1248) #b00000000000000000000000011111111) (= (mask!7648 thiss!1248) #b00000000000000000000000111111111) (= (mask!7648 thiss!1248) #b00000000000000000000001111111111) (= (mask!7648 thiss!1248) #b00000000000000000000011111111111) (= (mask!7648 thiss!1248) #b00000000000000000000111111111111) (= (mask!7648 thiss!1248) #b00000000000000000001111111111111) (= (mask!7648 thiss!1248) #b00000000000000000011111111111111) (= (mask!7648 thiss!1248) #b00000000000000000111111111111111) (= (mask!7648 thiss!1248) #b00000000000000001111111111111111) (= (mask!7648 thiss!1248) #b00000000000000011111111111111111) (= (mask!7648 thiss!1248) #b00000000000000111111111111111111) (= (mask!7648 thiss!1248) #b00000000000001111111111111111111) (= (mask!7648 thiss!1248) #b00000000000011111111111111111111) (= (mask!7648 thiss!1248) #b00000000000111111111111111111111) (= (mask!7648 thiss!1248) #b00000000001111111111111111111111) (= (mask!7648 thiss!1248) #b00000000011111111111111111111111) (= (mask!7648 thiss!1248) #b00000000111111111111111111111111) (= (mask!7648 thiss!1248) #b00000001111111111111111111111111) (= (mask!7648 thiss!1248) #b00000011111111111111111111111111) (= (mask!7648 thiss!1248) #b00000111111111111111111111111111) (= (mask!7648 thiss!1248) #b00001111111111111111111111111111) (= (mask!7648 thiss!1248) #b00011111111111111111111111111111) (= (mask!7648 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7648 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157348 d!51043))

(declare-fun d!51045 () Bool)

(declare-fun res!74375 () Bool)

(declare-fun e!103050 () Bool)

(assert (=> d!51045 (=> (not res!74375) (not e!103050))))

(declare-fun simpleValid!105 (LongMapFixedSize!1458) Bool)

(assert (=> d!51045 (= res!74375 (simpleValid!105 thiss!1248))))

(assert (=> d!51045 (= (valid!692 thiss!1248) e!103050)))

(declare-fun b!157377 () Bool)

(declare-fun res!74376 () Bool)

(assert (=> b!157377 (=> (not res!74376) (not e!103050))))

(declare-fun arrayCountValidKeys!0 (array!5527 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157377 (= res!74376 (= (arrayCountValidKeys!0 (_keys!4946 thiss!1248) #b00000000000000000000000000000000 (size!2899 (_keys!4946 thiss!1248))) (_size!778 thiss!1248)))))

(declare-fun b!157378 () Bool)

(declare-fun res!74377 () Bool)

(assert (=> b!157378 (=> (not res!74377) (not e!103050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5527 (_ BitVec 32)) Bool)

(assert (=> b!157378 (= res!74377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4946 thiss!1248) (mask!7648 thiss!1248)))))

(declare-fun b!157379 () Bool)

(declare-datatypes ((List!1882 0))(
  ( (Nil!1879) (Cons!1878 (h!2487 (_ BitVec 64)) (t!6684 List!1882)) )
))
(declare-fun arrayNoDuplicates!0 (array!5527 (_ BitVec 32) List!1882) Bool)

(assert (=> b!157379 (= e!103050 (arrayNoDuplicates!0 (_keys!4946 thiss!1248) #b00000000000000000000000000000000 Nil!1879))))

(assert (= (and d!51045 res!74375) b!157377))

(assert (= (and b!157377 res!74376) b!157378))

(assert (= (and b!157378 res!74377) b!157379))

(declare-fun m!190641 () Bool)

(assert (=> d!51045 m!190641))

(declare-fun m!190643 () Bool)

(assert (=> b!157377 m!190643))

(declare-fun m!190645 () Bool)

(assert (=> b!157378 m!190645))

(declare-fun m!190647 () Bool)

(assert (=> b!157379 m!190647))

(assert (=> start!15768 d!51045))

(declare-fun b!157386 () Bool)

(declare-fun e!103056 () Bool)

(assert (=> b!157386 (= e!103056 tp_is_empty!3237)))

(declare-fun b!157387 () Bool)

(declare-fun e!103055 () Bool)

(assert (=> b!157387 (= e!103055 tp_is_empty!3237)))

(declare-fun condMapEmpty!5504 () Bool)

(declare-fun mapDefault!5504 () ValueCell!1275)

(assert (=> mapNonEmpty!5498 (= condMapEmpty!5504 (= mapRest!5498 ((as const (Array (_ BitVec 32) ValueCell!1275)) mapDefault!5504)))))

(declare-fun mapRes!5504 () Bool)

(assert (=> mapNonEmpty!5498 (= tp!12830 (and e!103055 mapRes!5504))))

(declare-fun mapIsEmpty!5504 () Bool)

(assert (=> mapIsEmpty!5504 mapRes!5504))

(declare-fun mapNonEmpty!5504 () Bool)

(declare-fun tp!12839 () Bool)

(assert (=> mapNonEmpty!5504 (= mapRes!5504 (and tp!12839 e!103056))))

(declare-fun mapKey!5504 () (_ BitVec 32))

(declare-fun mapRest!5504 () (Array (_ BitVec 32) ValueCell!1275))

(declare-fun mapValue!5504 () ValueCell!1275)

(assert (=> mapNonEmpty!5504 (= mapRest!5498 (store mapRest!5504 mapKey!5504 mapValue!5504))))

(assert (= (and mapNonEmpty!5498 condMapEmpty!5504) mapIsEmpty!5504))

(assert (= (and mapNonEmpty!5498 (not condMapEmpty!5504)) mapNonEmpty!5504))

(assert (= (and mapNonEmpty!5504 ((_ is ValueCellFull!1275) mapValue!5504)) b!157386))

(assert (= (and mapNonEmpty!5498 ((_ is ValueCellFull!1275) mapDefault!5504)) b!157387))

(declare-fun m!190649 () Bool)

(assert (=> mapNonEmpty!5504 m!190649))

(check-sat tp_is_empty!3237 (not b!157378) (not mapNonEmpty!5504) (not b_next!3435) (not b!157377) (not d!51045) b_and!9849 (not b!157379))
(check-sat b_and!9849 (not b_next!3435))
(get-model)

(declare-fun b!157398 () Bool)

(declare-fun e!103067 () Bool)

(declare-fun e!103065 () Bool)

(assert (=> b!157398 (= e!103067 e!103065)))

(declare-fun c!29695 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!157398 (= c!29695 (validKeyInArray!0 (select (arr!2621 (_keys!4946 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51047 () Bool)

(declare-fun res!74384 () Bool)

(declare-fun e!103068 () Bool)

(assert (=> d!51047 (=> res!74384 e!103068)))

(assert (=> d!51047 (= res!74384 (bvsge #b00000000000000000000000000000000 (size!2899 (_keys!4946 thiss!1248))))))

(assert (=> d!51047 (= (arrayNoDuplicates!0 (_keys!4946 thiss!1248) #b00000000000000000000000000000000 Nil!1879) e!103068)))

(declare-fun b!157399 () Bool)

(declare-fun call!17218 () Bool)

(assert (=> b!157399 (= e!103065 call!17218)))

(declare-fun bm!17215 () Bool)

(assert (=> bm!17215 (= call!17218 (arrayNoDuplicates!0 (_keys!4946 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29695 (Cons!1878 (select (arr!2621 (_keys!4946 thiss!1248)) #b00000000000000000000000000000000) Nil!1879) Nil!1879)))))

(declare-fun b!157400 () Bool)

(assert (=> b!157400 (= e!103068 e!103067)))

(declare-fun res!74385 () Bool)

(assert (=> b!157400 (=> (not res!74385) (not e!103067))))

(declare-fun e!103066 () Bool)

(assert (=> b!157400 (= res!74385 (not e!103066))))

(declare-fun res!74386 () Bool)

(assert (=> b!157400 (=> (not res!74386) (not e!103066))))

(assert (=> b!157400 (= res!74386 (validKeyInArray!0 (select (arr!2621 (_keys!4946 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157401 () Bool)

(declare-fun contains!977 (List!1882 (_ BitVec 64)) Bool)

(assert (=> b!157401 (= e!103066 (contains!977 Nil!1879 (select (arr!2621 (_keys!4946 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157402 () Bool)

(assert (=> b!157402 (= e!103065 call!17218)))

(assert (= (and d!51047 (not res!74384)) b!157400))

(assert (= (and b!157400 res!74386) b!157401))

(assert (= (and b!157400 res!74385) b!157398))

(assert (= (and b!157398 c!29695) b!157399))

(assert (= (and b!157398 (not c!29695)) b!157402))

(assert (= (or b!157399 b!157402) bm!17215))

(declare-fun m!190651 () Bool)

(assert (=> b!157398 m!190651))

(assert (=> b!157398 m!190651))

(declare-fun m!190653 () Bool)

(assert (=> b!157398 m!190653))

(assert (=> bm!17215 m!190651))

(declare-fun m!190655 () Bool)

(assert (=> bm!17215 m!190655))

(assert (=> b!157400 m!190651))

(assert (=> b!157400 m!190651))

(assert (=> b!157400 m!190653))

(assert (=> b!157401 m!190651))

(assert (=> b!157401 m!190651))

(declare-fun m!190657 () Bool)

(assert (=> b!157401 m!190657))

(assert (=> b!157379 d!51047))

(declare-fun b!157411 () Bool)

(declare-fun e!103074 () (_ BitVec 32))

(declare-fun call!17221 () (_ BitVec 32))

(assert (=> b!157411 (= e!103074 call!17221)))

(declare-fun d!51049 () Bool)

(declare-fun lt!81727 () (_ BitVec 32))

(assert (=> d!51049 (and (bvsge lt!81727 #b00000000000000000000000000000000) (bvsle lt!81727 (bvsub (size!2899 (_keys!4946 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!103073 () (_ BitVec 32))

(assert (=> d!51049 (= lt!81727 e!103073)))

(declare-fun c!29701 () Bool)

(assert (=> d!51049 (= c!29701 (bvsge #b00000000000000000000000000000000 (size!2899 (_keys!4946 thiss!1248))))))

(assert (=> d!51049 (and (bvsle #b00000000000000000000000000000000 (size!2899 (_keys!4946 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2899 (_keys!4946 thiss!1248)) (size!2899 (_keys!4946 thiss!1248))))))

(assert (=> d!51049 (= (arrayCountValidKeys!0 (_keys!4946 thiss!1248) #b00000000000000000000000000000000 (size!2899 (_keys!4946 thiss!1248))) lt!81727)))

(declare-fun b!157412 () Bool)

(assert (=> b!157412 (= e!103073 e!103074)))

(declare-fun c!29700 () Bool)

(assert (=> b!157412 (= c!29700 (validKeyInArray!0 (select (arr!2621 (_keys!4946 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157413 () Bool)

(assert (=> b!157413 (= e!103074 (bvadd #b00000000000000000000000000000001 call!17221))))

(declare-fun bm!17218 () Bool)

(assert (=> bm!17218 (= call!17221 (arrayCountValidKeys!0 (_keys!4946 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2899 (_keys!4946 thiss!1248))))))

(declare-fun b!157414 () Bool)

(assert (=> b!157414 (= e!103073 #b00000000000000000000000000000000)))

(assert (= (and d!51049 c!29701) b!157414))

(assert (= (and d!51049 (not c!29701)) b!157412))

(assert (= (and b!157412 c!29700) b!157413))

(assert (= (and b!157412 (not c!29700)) b!157411))

(assert (= (or b!157413 b!157411) bm!17218))

(assert (=> b!157412 m!190651))

(assert (=> b!157412 m!190651))

(assert (=> b!157412 m!190653))

(declare-fun m!190659 () Bool)

(assert (=> bm!17218 m!190659))

(assert (=> b!157377 d!51049))

(declare-fun b!157425 () Bool)

(declare-fun res!74397 () Bool)

(declare-fun e!103077 () Bool)

(assert (=> b!157425 (=> (not res!74397) (not e!103077))))

(declare-fun size!2903 (LongMapFixedSize!1458) (_ BitVec 32))

(assert (=> b!157425 (= res!74397 (= (size!2903 thiss!1248) (bvadd (_size!778 thiss!1248) (bvsdiv (bvadd (extraKeys!2912 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!157424 () Bool)

(declare-fun res!74396 () Bool)

(assert (=> b!157424 (=> (not res!74396) (not e!103077))))

(assert (=> b!157424 (= res!74396 (bvsge (size!2903 thiss!1248) (_size!778 thiss!1248)))))

(declare-fun d!51051 () Bool)

(declare-fun res!74398 () Bool)

(assert (=> d!51051 (=> (not res!74398) (not e!103077))))

(assert (=> d!51051 (= res!74398 (validMask!0 (mask!7648 thiss!1248)))))

(assert (=> d!51051 (= (simpleValid!105 thiss!1248) e!103077)))

(declare-fun b!157426 () Bool)

(assert (=> b!157426 (= e!103077 (and (bvsge (extraKeys!2912 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2912 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!778 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!157423 () Bool)

(declare-fun res!74395 () Bool)

(assert (=> b!157423 (=> (not res!74395) (not e!103077))))

(assert (=> b!157423 (= res!74395 (and (= (size!2900 (_values!3154 thiss!1248)) (bvadd (mask!7648 thiss!1248) #b00000000000000000000000000000001)) (= (size!2899 (_keys!4946 thiss!1248)) (size!2900 (_values!3154 thiss!1248))) (bvsge (_size!778 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!778 thiss!1248) (bvadd (mask!7648 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!51051 res!74398) b!157423))

(assert (= (and b!157423 res!74395) b!157424))

(assert (= (and b!157424 res!74396) b!157425))

(assert (= (and b!157425 res!74397) b!157426))

(declare-fun m!190661 () Bool)

(assert (=> b!157425 m!190661))

(assert (=> b!157424 m!190661))

(assert (=> d!51051 m!190623))

(assert (=> d!51045 d!51051))

(declare-fun d!51053 () Bool)

(declare-fun res!74403 () Bool)

(declare-fun e!103085 () Bool)

(assert (=> d!51053 (=> res!74403 e!103085)))

(assert (=> d!51053 (= res!74403 (bvsge #b00000000000000000000000000000000 (size!2899 (_keys!4946 thiss!1248))))))

(assert (=> d!51053 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4946 thiss!1248) (mask!7648 thiss!1248)) e!103085)))

(declare-fun b!157435 () Bool)

(declare-fun e!103084 () Bool)

(declare-fun e!103086 () Bool)

(assert (=> b!157435 (= e!103084 e!103086)))

(declare-fun lt!81735 () (_ BitVec 64))

(assert (=> b!157435 (= lt!81735 (select (arr!2621 (_keys!4946 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4978 0))(
  ( (Unit!4979) )
))
(declare-fun lt!81734 () Unit!4978)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5527 (_ BitVec 64) (_ BitVec 32)) Unit!4978)

(assert (=> b!157435 (= lt!81734 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4946 thiss!1248) lt!81735 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157435 (arrayContainsKey!0 (_keys!4946 thiss!1248) lt!81735 #b00000000000000000000000000000000)))

(declare-fun lt!81736 () Unit!4978)

(assert (=> b!157435 (= lt!81736 lt!81734)))

(declare-fun res!74404 () Bool)

(declare-datatypes ((SeekEntryResult!287 0))(
  ( (MissingZero!287 (index!3316 (_ BitVec 32))) (Found!287 (index!3317 (_ BitVec 32))) (Intermediate!287 (undefined!1099 Bool) (index!3318 (_ BitVec 32)) (x!17325 (_ BitVec 32))) (Undefined!287) (MissingVacant!287 (index!3319 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5527 (_ BitVec 32)) SeekEntryResult!287)

(assert (=> b!157435 (= res!74404 (= (seekEntryOrOpen!0 (select (arr!2621 (_keys!4946 thiss!1248)) #b00000000000000000000000000000000) (_keys!4946 thiss!1248) (mask!7648 thiss!1248)) (Found!287 #b00000000000000000000000000000000)))))

(assert (=> b!157435 (=> (not res!74404) (not e!103086))))

(declare-fun b!157436 () Bool)

(declare-fun call!17224 () Bool)

(assert (=> b!157436 (= e!103086 call!17224)))

(declare-fun bm!17221 () Bool)

(assert (=> bm!17221 (= call!17224 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4946 thiss!1248) (mask!7648 thiss!1248)))))

(declare-fun b!157437 () Bool)

(assert (=> b!157437 (= e!103085 e!103084)))

(declare-fun c!29704 () Bool)

(assert (=> b!157437 (= c!29704 (validKeyInArray!0 (select (arr!2621 (_keys!4946 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157438 () Bool)

(assert (=> b!157438 (= e!103084 call!17224)))

(assert (= (and d!51053 (not res!74403)) b!157437))

(assert (= (and b!157437 c!29704) b!157435))

(assert (= (and b!157437 (not c!29704)) b!157438))

(assert (= (and b!157435 res!74404) b!157436))

(assert (= (or b!157436 b!157438) bm!17221))

(assert (=> b!157435 m!190651))

(declare-fun m!190663 () Bool)

(assert (=> b!157435 m!190663))

(declare-fun m!190665 () Bool)

(assert (=> b!157435 m!190665))

(assert (=> b!157435 m!190651))

(declare-fun m!190667 () Bool)

(assert (=> b!157435 m!190667))

(declare-fun m!190669 () Bool)

(assert (=> bm!17221 m!190669))

(assert (=> b!157437 m!190651))

(assert (=> b!157437 m!190651))

(assert (=> b!157437 m!190653))

(assert (=> b!157378 d!51053))

(declare-fun b!157439 () Bool)

(declare-fun e!103088 () Bool)

(assert (=> b!157439 (= e!103088 tp_is_empty!3237)))

(declare-fun b!157440 () Bool)

(declare-fun e!103087 () Bool)

(assert (=> b!157440 (= e!103087 tp_is_empty!3237)))

(declare-fun condMapEmpty!5505 () Bool)

(declare-fun mapDefault!5505 () ValueCell!1275)

(assert (=> mapNonEmpty!5504 (= condMapEmpty!5505 (= mapRest!5504 ((as const (Array (_ BitVec 32) ValueCell!1275)) mapDefault!5505)))))

(declare-fun mapRes!5505 () Bool)

(assert (=> mapNonEmpty!5504 (= tp!12839 (and e!103087 mapRes!5505))))

(declare-fun mapIsEmpty!5505 () Bool)

(assert (=> mapIsEmpty!5505 mapRes!5505))

(declare-fun mapNonEmpty!5505 () Bool)

(declare-fun tp!12840 () Bool)

(assert (=> mapNonEmpty!5505 (= mapRes!5505 (and tp!12840 e!103088))))

(declare-fun mapValue!5505 () ValueCell!1275)

(declare-fun mapRest!5505 () (Array (_ BitVec 32) ValueCell!1275))

(declare-fun mapKey!5505 () (_ BitVec 32))

(assert (=> mapNonEmpty!5505 (= mapRest!5504 (store mapRest!5505 mapKey!5505 mapValue!5505))))

(assert (= (and mapNonEmpty!5504 condMapEmpty!5505) mapIsEmpty!5505))

(assert (= (and mapNonEmpty!5504 (not condMapEmpty!5505)) mapNonEmpty!5505))

(assert (= (and mapNonEmpty!5505 ((_ is ValueCellFull!1275) mapValue!5505)) b!157439))

(assert (= (and mapNonEmpty!5504 ((_ is ValueCellFull!1275) mapDefault!5505)) b!157440))

(declare-fun m!190671 () Bool)

(assert (=> mapNonEmpty!5505 m!190671))

(check-sat tp_is_empty!3237 (not bm!17215) (not b!157437) (not b!157400) (not bm!17221) (not b!157401) (not b!157435) (not mapNonEmpty!5505) (not b!157425) (not b!157412) b_and!9849 (not b!157398) (not b!157424) (not b_next!3435) (not d!51051) (not bm!17218))
(check-sat b_and!9849 (not b_next!3435))
