; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15770 () Bool)

(assert start!15770)

(declare-fun b!157376 () Bool)

(declare-fun b_free!3433 () Bool)

(declare-fun b_next!3433 () Bool)

(assert (=> b!157376 (= b_free!3433 (not b_next!3433))))

(declare-fun tp!12823 () Bool)

(declare-fun b_and!9861 () Bool)

(assert (=> b!157376 (= tp!12823 b_and!9861)))

(declare-fun tp_is_empty!3235 () Bool)

(declare-fun e!103035 () Bool)

(declare-datatypes ((V!3961 0))(
  ( (V!3962 (val!1662 Int)) )
))
(declare-datatypes ((ValueCell!1274 0))(
  ( (ValueCellFull!1274 (v!3528 V!3961)) (EmptyCell!1274) )
))
(declare-datatypes ((array!5509 0))(
  ( (array!5510 (arr!2612 (Array (_ BitVec 32) (_ BitVec 64))) (size!2890 (_ BitVec 32))) )
))
(declare-datatypes ((array!5511 0))(
  ( (array!5512 (arr!2613 (Array (_ BitVec 32) ValueCell!1274)) (size!2891 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1456 0))(
  ( (LongMapFixedSize!1457 (defaultEntry!3170 Int) (mask!7647 (_ BitVec 32)) (extraKeys!2911 (_ BitVec 32)) (zeroValue!3013 V!3961) (minValue!3013 V!3961) (_size!777 (_ BitVec 32)) (_keys!4945 array!5509) (_values!3153 array!5511) (_vacant!777 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1456)

(declare-fun e!103031 () Bool)

(declare-fun array_inv!1661 (array!5509) Bool)

(declare-fun array_inv!1662 (array!5511) Bool)

(assert (=> b!157376 (= e!103031 (and tp!12823 tp_is_empty!3235 (array_inv!1661 (_keys!4945 thiss!1248)) (array_inv!1662 (_values!3153 thiss!1248)) e!103035))))

(declare-fun mapNonEmpty!5495 () Bool)

(declare-fun mapRes!5495 () Bool)

(declare-fun tp!12824 () Bool)

(declare-fun e!103032 () Bool)

(assert (=> mapNonEmpty!5495 (= mapRes!5495 (and tp!12824 e!103032))))

(declare-fun mapKey!5495 () (_ BitVec 32))

(declare-fun mapValue!5495 () ValueCell!1274)

(declare-fun mapRest!5495 () (Array (_ BitVec 32) ValueCell!1274))

(assert (=> mapNonEmpty!5495 (= (arr!2613 (_values!3153 thiss!1248)) (store mapRest!5495 mapKey!5495 mapValue!5495))))

(declare-fun b!157377 () Bool)

(declare-fun e!103033 () Bool)

(assert (=> b!157377 (= e!103035 (and e!103033 mapRes!5495))))

(declare-fun condMapEmpty!5495 () Bool)

(declare-fun mapDefault!5495 () ValueCell!1274)

(assert (=> b!157377 (= condMapEmpty!5495 (= (arr!2613 (_values!3153 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1274)) mapDefault!5495)))))

(declare-fun res!74376 () Bool)

(declare-fun e!103034 () Bool)

(assert (=> start!15770 (=> (not res!74376) (not e!103034))))

(declare-fun valid!712 (LongMapFixedSize!1456) Bool)

(assert (=> start!15770 (= res!74376 (valid!712 thiss!1248))))

(assert (=> start!15770 e!103034))

(assert (=> start!15770 e!103031))

(assert (=> start!15770 true))

(declare-fun b!157378 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157378 (= e!103034 (not (validMask!0 (mask!7647 thiss!1248))))))

(declare-fun mapIsEmpty!5495 () Bool)

(assert (=> mapIsEmpty!5495 mapRes!5495))

(declare-fun b!157379 () Bool)

(assert (=> b!157379 (= e!103033 tp_is_empty!3235)))

(declare-fun b!157380 () Bool)

(assert (=> b!157380 (= e!103032 tp_is_empty!3235)))

(declare-fun b!157381 () Bool)

(declare-fun res!74377 () Bool)

(assert (=> b!157381 (=> (not res!74377) (not e!103034))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157381 (= res!74377 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!15770 res!74376) b!157381))

(assert (= (and b!157381 res!74377) b!157378))

(assert (= (and b!157377 condMapEmpty!5495) mapIsEmpty!5495))

(assert (= (and b!157377 (not condMapEmpty!5495)) mapNonEmpty!5495))

(get-info :version)

(assert (= (and mapNonEmpty!5495 ((_ is ValueCellFull!1274) mapValue!5495)) b!157380))

(assert (= (and b!157377 ((_ is ValueCellFull!1274) mapDefault!5495)) b!157379))

(assert (= b!157376 b!157377))

(assert (= start!15770 b!157376))

(declare-fun m!190793 () Bool)

(assert (=> b!157376 m!190793))

(declare-fun m!190795 () Bool)

(assert (=> b!157376 m!190795))

(declare-fun m!190797 () Bool)

(assert (=> mapNonEmpty!5495 m!190797))

(declare-fun m!190799 () Bool)

(assert (=> start!15770 m!190799))

(declare-fun m!190801 () Bool)

(assert (=> b!157378 m!190801))

(check-sat (not b!157378) tp_is_empty!3235 (not start!15770) (not b_next!3433) (not mapNonEmpty!5495) (not b!157376) b_and!9861)
(check-sat b_and!9861 (not b_next!3433))
(get-model)

(declare-fun d!51113 () Bool)

(assert (=> d!51113 (= (array_inv!1661 (_keys!4945 thiss!1248)) (bvsge (size!2890 (_keys!4945 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157376 d!51113))

(declare-fun d!51115 () Bool)

(assert (=> d!51115 (= (array_inv!1662 (_values!3153 thiss!1248)) (bvsge (size!2891 (_values!3153 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157376 d!51115))

(declare-fun d!51117 () Bool)

(assert (=> d!51117 (= (validMask!0 (mask!7647 thiss!1248)) (and (or (= (mask!7647 thiss!1248) #b00000000000000000000000000000111) (= (mask!7647 thiss!1248) #b00000000000000000000000000001111) (= (mask!7647 thiss!1248) #b00000000000000000000000000011111) (= (mask!7647 thiss!1248) #b00000000000000000000000000111111) (= (mask!7647 thiss!1248) #b00000000000000000000000001111111) (= (mask!7647 thiss!1248) #b00000000000000000000000011111111) (= (mask!7647 thiss!1248) #b00000000000000000000000111111111) (= (mask!7647 thiss!1248) #b00000000000000000000001111111111) (= (mask!7647 thiss!1248) #b00000000000000000000011111111111) (= (mask!7647 thiss!1248) #b00000000000000000000111111111111) (= (mask!7647 thiss!1248) #b00000000000000000001111111111111) (= (mask!7647 thiss!1248) #b00000000000000000011111111111111) (= (mask!7647 thiss!1248) #b00000000000000000111111111111111) (= (mask!7647 thiss!1248) #b00000000000000001111111111111111) (= (mask!7647 thiss!1248) #b00000000000000011111111111111111) (= (mask!7647 thiss!1248) #b00000000000000111111111111111111) (= (mask!7647 thiss!1248) #b00000000000001111111111111111111) (= (mask!7647 thiss!1248) #b00000000000011111111111111111111) (= (mask!7647 thiss!1248) #b00000000000111111111111111111111) (= (mask!7647 thiss!1248) #b00000000001111111111111111111111) (= (mask!7647 thiss!1248) #b00000000011111111111111111111111) (= (mask!7647 thiss!1248) #b00000000111111111111111111111111) (= (mask!7647 thiss!1248) #b00000001111111111111111111111111) (= (mask!7647 thiss!1248) #b00000011111111111111111111111111) (= (mask!7647 thiss!1248) #b00000111111111111111111111111111) (= (mask!7647 thiss!1248) #b00001111111111111111111111111111) (= (mask!7647 thiss!1248) #b00011111111111111111111111111111) (= (mask!7647 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7647 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157378 d!51117))

(declare-fun d!51119 () Bool)

(declare-fun res!74396 () Bool)

(declare-fun e!103074 () Bool)

(assert (=> d!51119 (=> (not res!74396) (not e!103074))))

(declare-fun simpleValid!105 (LongMapFixedSize!1456) Bool)

(assert (=> d!51119 (= res!74396 (simpleValid!105 thiss!1248))))

(assert (=> d!51119 (= (valid!712 thiss!1248) e!103074)))

(declare-fun b!157424 () Bool)

(declare-fun res!74397 () Bool)

(assert (=> b!157424 (=> (not res!74397) (not e!103074))))

(declare-fun arrayCountValidKeys!0 (array!5509 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157424 (= res!74397 (= (arrayCountValidKeys!0 (_keys!4945 thiss!1248) #b00000000000000000000000000000000 (size!2890 (_keys!4945 thiss!1248))) (_size!777 thiss!1248)))))

(declare-fun b!157425 () Bool)

(declare-fun res!74398 () Bool)

(assert (=> b!157425 (=> (not res!74398) (not e!103074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5509 (_ BitVec 32)) Bool)

(assert (=> b!157425 (= res!74398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4945 thiss!1248) (mask!7647 thiss!1248)))))

(declare-fun b!157426 () Bool)

(declare-datatypes ((List!1866 0))(
  ( (Nil!1863) (Cons!1862 (h!2471 (_ BitVec 64)) (t!6660 List!1866)) )
))
(declare-fun arrayNoDuplicates!0 (array!5509 (_ BitVec 32) List!1866) Bool)

(assert (=> b!157426 (= e!103074 (arrayNoDuplicates!0 (_keys!4945 thiss!1248) #b00000000000000000000000000000000 Nil!1863))))

(assert (= (and d!51119 res!74396) b!157424))

(assert (= (and b!157424 res!74397) b!157425))

(assert (= (and b!157425 res!74398) b!157426))

(declare-fun m!190823 () Bool)

(assert (=> d!51119 m!190823))

(declare-fun m!190825 () Bool)

(assert (=> b!157424 m!190825))

(declare-fun m!190827 () Bool)

(assert (=> b!157425 m!190827))

(declare-fun m!190829 () Bool)

(assert (=> b!157426 m!190829))

(assert (=> start!15770 d!51119))

(declare-fun b!157433 () Bool)

(declare-fun e!103080 () Bool)

(assert (=> b!157433 (= e!103080 tp_is_empty!3235)))

(declare-fun b!157434 () Bool)

(declare-fun e!103079 () Bool)

(assert (=> b!157434 (= e!103079 tp_is_empty!3235)))

(declare-fun condMapEmpty!5504 () Bool)

(declare-fun mapDefault!5504 () ValueCell!1274)

(assert (=> mapNonEmpty!5495 (= condMapEmpty!5504 (= mapRest!5495 ((as const (Array (_ BitVec 32) ValueCell!1274)) mapDefault!5504)))))

(declare-fun mapRes!5504 () Bool)

(assert (=> mapNonEmpty!5495 (= tp!12824 (and e!103079 mapRes!5504))))

(declare-fun mapIsEmpty!5504 () Bool)

(assert (=> mapIsEmpty!5504 mapRes!5504))

(declare-fun mapNonEmpty!5504 () Bool)

(declare-fun tp!12839 () Bool)

(assert (=> mapNonEmpty!5504 (= mapRes!5504 (and tp!12839 e!103080))))

(declare-fun mapKey!5504 () (_ BitVec 32))

(declare-fun mapRest!5504 () (Array (_ BitVec 32) ValueCell!1274))

(declare-fun mapValue!5504 () ValueCell!1274)

(assert (=> mapNonEmpty!5504 (= mapRest!5495 (store mapRest!5504 mapKey!5504 mapValue!5504))))

(assert (= (and mapNonEmpty!5495 condMapEmpty!5504) mapIsEmpty!5504))

(assert (= (and mapNonEmpty!5495 (not condMapEmpty!5504)) mapNonEmpty!5504))

(assert (= (and mapNonEmpty!5504 ((_ is ValueCellFull!1274) mapValue!5504)) b!157433))

(assert (= (and mapNonEmpty!5495 ((_ is ValueCellFull!1274) mapDefault!5504)) b!157434))

(declare-fun m!190831 () Bool)

(assert (=> mapNonEmpty!5504 m!190831))

(check-sat tp_is_empty!3235 (not b!157425) b_and!9861 (not b!157424) (not d!51119) (not b!157426) (not mapNonEmpty!5504) (not b_next!3433))
(check-sat b_and!9861 (not b_next!3433))
(get-model)

(declare-fun b!157445 () Bool)

(declare-fun e!103091 () Bool)

(declare-fun e!103089 () Bool)

(assert (=> b!157445 (= e!103091 e!103089)))

(declare-fun c!29708 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!157445 (= c!29708 (validKeyInArray!0 (select (arr!2612 (_keys!4945 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51121 () Bool)

(declare-fun res!74405 () Bool)

(declare-fun e!103092 () Bool)

(assert (=> d!51121 (=> res!74405 e!103092)))

(assert (=> d!51121 (= res!74405 (bvsge #b00000000000000000000000000000000 (size!2890 (_keys!4945 thiss!1248))))))

(assert (=> d!51121 (= (arrayNoDuplicates!0 (_keys!4945 thiss!1248) #b00000000000000000000000000000000 Nil!1863) e!103092)))

(declare-fun b!157446 () Bool)

(declare-fun call!17206 () Bool)

(assert (=> b!157446 (= e!103089 call!17206)))

(declare-fun bm!17203 () Bool)

(assert (=> bm!17203 (= call!17206 (arrayNoDuplicates!0 (_keys!4945 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29708 (Cons!1862 (select (arr!2612 (_keys!4945 thiss!1248)) #b00000000000000000000000000000000) Nil!1863) Nil!1863)))))

(declare-fun b!157447 () Bool)

(assert (=> b!157447 (= e!103092 e!103091)))

(declare-fun res!74406 () Bool)

(assert (=> b!157447 (=> (not res!74406) (not e!103091))))

(declare-fun e!103090 () Bool)

(assert (=> b!157447 (= res!74406 (not e!103090))))

(declare-fun res!74407 () Bool)

(assert (=> b!157447 (=> (not res!74407) (not e!103090))))

(assert (=> b!157447 (= res!74407 (validKeyInArray!0 (select (arr!2612 (_keys!4945 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157448 () Bool)

(declare-fun contains!960 (List!1866 (_ BitVec 64)) Bool)

(assert (=> b!157448 (= e!103090 (contains!960 Nil!1863 (select (arr!2612 (_keys!4945 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157449 () Bool)

(assert (=> b!157449 (= e!103089 call!17206)))

(assert (= (and d!51121 (not res!74405)) b!157447))

(assert (= (and b!157447 res!74407) b!157448))

(assert (= (and b!157447 res!74406) b!157445))

(assert (= (and b!157445 c!29708) b!157446))

(assert (= (and b!157445 (not c!29708)) b!157449))

(assert (= (or b!157446 b!157449) bm!17203))

(declare-fun m!190833 () Bool)

(assert (=> b!157445 m!190833))

(assert (=> b!157445 m!190833))

(declare-fun m!190835 () Bool)

(assert (=> b!157445 m!190835))

(assert (=> bm!17203 m!190833))

(declare-fun m!190837 () Bool)

(assert (=> bm!17203 m!190837))

(assert (=> b!157447 m!190833))

(assert (=> b!157447 m!190833))

(assert (=> b!157447 m!190835))

(assert (=> b!157448 m!190833))

(assert (=> b!157448 m!190833))

(declare-fun m!190839 () Bool)

(assert (=> b!157448 m!190839))

(assert (=> b!157426 d!51121))

(declare-fun b!157458 () Bool)

(declare-fun e!103098 () (_ BitVec 32))

(declare-fun call!17209 () (_ BitVec 32))

(assert (=> b!157458 (= e!103098 call!17209)))

(declare-fun d!51123 () Bool)

(declare-fun lt!81786 () (_ BitVec 32))

(assert (=> d!51123 (and (bvsge lt!81786 #b00000000000000000000000000000000) (bvsle lt!81786 (bvsub (size!2890 (_keys!4945 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!103097 () (_ BitVec 32))

(assert (=> d!51123 (= lt!81786 e!103097)))

(declare-fun c!29714 () Bool)

(assert (=> d!51123 (= c!29714 (bvsge #b00000000000000000000000000000000 (size!2890 (_keys!4945 thiss!1248))))))

(assert (=> d!51123 (and (bvsle #b00000000000000000000000000000000 (size!2890 (_keys!4945 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2890 (_keys!4945 thiss!1248)) (size!2890 (_keys!4945 thiss!1248))))))

(assert (=> d!51123 (= (arrayCountValidKeys!0 (_keys!4945 thiss!1248) #b00000000000000000000000000000000 (size!2890 (_keys!4945 thiss!1248))) lt!81786)))

(declare-fun b!157459 () Bool)

(assert (=> b!157459 (= e!103097 e!103098)))

(declare-fun c!29713 () Bool)

(assert (=> b!157459 (= c!29713 (validKeyInArray!0 (select (arr!2612 (_keys!4945 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157460 () Bool)

(assert (=> b!157460 (= e!103098 (bvadd #b00000000000000000000000000000001 call!17209))))

(declare-fun bm!17206 () Bool)

(assert (=> bm!17206 (= call!17209 (arrayCountValidKeys!0 (_keys!4945 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2890 (_keys!4945 thiss!1248))))))

(declare-fun b!157461 () Bool)

(assert (=> b!157461 (= e!103097 #b00000000000000000000000000000000)))

(assert (= (and d!51123 c!29714) b!157461))

(assert (= (and d!51123 (not c!29714)) b!157459))

(assert (= (and b!157459 c!29713) b!157460))

(assert (= (and b!157459 (not c!29713)) b!157458))

(assert (= (or b!157460 b!157458) bm!17206))

(assert (=> b!157459 m!190833))

(assert (=> b!157459 m!190833))

(assert (=> b!157459 m!190835))

(declare-fun m!190841 () Bool)

(assert (=> bm!17206 m!190841))

(assert (=> b!157424 d!51123))

(declare-fun b!157472 () Bool)

(declare-fun res!74418 () Bool)

(declare-fun e!103101 () Bool)

(assert (=> b!157472 (=> (not res!74418) (not e!103101))))

(declare-fun size!2896 (LongMapFixedSize!1456) (_ BitVec 32))

(assert (=> b!157472 (= res!74418 (= (size!2896 thiss!1248) (bvadd (_size!777 thiss!1248) (bvsdiv (bvadd (extraKeys!2911 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!157471 () Bool)

(declare-fun res!74417 () Bool)

(assert (=> b!157471 (=> (not res!74417) (not e!103101))))

(assert (=> b!157471 (= res!74417 (bvsge (size!2896 thiss!1248) (_size!777 thiss!1248)))))

(declare-fun d!51125 () Bool)

(declare-fun res!74419 () Bool)

(assert (=> d!51125 (=> (not res!74419) (not e!103101))))

(assert (=> d!51125 (= res!74419 (validMask!0 (mask!7647 thiss!1248)))))

(assert (=> d!51125 (= (simpleValid!105 thiss!1248) e!103101)))

(declare-fun b!157473 () Bool)

(assert (=> b!157473 (= e!103101 (and (bvsge (extraKeys!2911 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2911 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!777 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!157470 () Bool)

(declare-fun res!74416 () Bool)

(assert (=> b!157470 (=> (not res!74416) (not e!103101))))

(assert (=> b!157470 (= res!74416 (and (= (size!2891 (_values!3153 thiss!1248)) (bvadd (mask!7647 thiss!1248) #b00000000000000000000000000000001)) (= (size!2890 (_keys!4945 thiss!1248)) (size!2891 (_values!3153 thiss!1248))) (bvsge (_size!777 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!777 thiss!1248) (bvadd (mask!7647 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!51125 res!74419) b!157470))

(assert (= (and b!157470 res!74416) b!157471))

(assert (= (and b!157471 res!74417) b!157472))

(assert (= (and b!157472 res!74418) b!157473))

(declare-fun m!190843 () Bool)

(assert (=> b!157472 m!190843))

(assert (=> b!157471 m!190843))

(assert (=> d!51125 m!190801))

(assert (=> d!51119 d!51125))

(declare-fun d!51127 () Bool)

(declare-fun res!74424 () Bool)

(declare-fun e!103109 () Bool)

(assert (=> d!51127 (=> res!74424 e!103109)))

(assert (=> d!51127 (= res!74424 (bvsge #b00000000000000000000000000000000 (size!2890 (_keys!4945 thiss!1248))))))

(assert (=> d!51127 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4945 thiss!1248) (mask!7647 thiss!1248)) e!103109)))

(declare-fun b!157482 () Bool)

(declare-fun e!103108 () Bool)

(declare-fun e!103110 () Bool)

(assert (=> b!157482 (= e!103108 e!103110)))

(declare-fun lt!81794 () (_ BitVec 64))

(assert (=> b!157482 (= lt!81794 (select (arr!2612 (_keys!4945 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4983 0))(
  ( (Unit!4984) )
))
(declare-fun lt!81793 () Unit!4983)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5509 (_ BitVec 64) (_ BitVec 32)) Unit!4983)

(assert (=> b!157482 (= lt!81793 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4945 thiss!1248) lt!81794 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157482 (arrayContainsKey!0 (_keys!4945 thiss!1248) lt!81794 #b00000000000000000000000000000000)))

(declare-fun lt!81795 () Unit!4983)

(assert (=> b!157482 (= lt!81795 lt!81793)))

(declare-fun res!74425 () Bool)

(declare-datatypes ((SeekEntryResult!281 0))(
  ( (MissingZero!281 (index!3292 (_ BitVec 32))) (Found!281 (index!3293 (_ BitVec 32))) (Intermediate!281 (undefined!1093 Bool) (index!3294 (_ BitVec 32)) (x!17319 (_ BitVec 32))) (Undefined!281) (MissingVacant!281 (index!3295 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5509 (_ BitVec 32)) SeekEntryResult!281)

(assert (=> b!157482 (= res!74425 (= (seekEntryOrOpen!0 (select (arr!2612 (_keys!4945 thiss!1248)) #b00000000000000000000000000000000) (_keys!4945 thiss!1248) (mask!7647 thiss!1248)) (Found!281 #b00000000000000000000000000000000)))))

(assert (=> b!157482 (=> (not res!74425) (not e!103110))))

(declare-fun b!157483 () Bool)

(declare-fun call!17212 () Bool)

(assert (=> b!157483 (= e!103110 call!17212)))

(declare-fun bm!17209 () Bool)

(assert (=> bm!17209 (= call!17212 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4945 thiss!1248) (mask!7647 thiss!1248)))))

(declare-fun b!157484 () Bool)

(assert (=> b!157484 (= e!103109 e!103108)))

(declare-fun c!29717 () Bool)

(assert (=> b!157484 (= c!29717 (validKeyInArray!0 (select (arr!2612 (_keys!4945 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157485 () Bool)

(assert (=> b!157485 (= e!103108 call!17212)))

(assert (= (and d!51127 (not res!74424)) b!157484))

(assert (= (and b!157484 c!29717) b!157482))

(assert (= (and b!157484 (not c!29717)) b!157485))

(assert (= (and b!157482 res!74425) b!157483))

(assert (= (or b!157483 b!157485) bm!17209))

(assert (=> b!157482 m!190833))

(declare-fun m!190845 () Bool)

(assert (=> b!157482 m!190845))

(declare-fun m!190847 () Bool)

(assert (=> b!157482 m!190847))

(assert (=> b!157482 m!190833))

(declare-fun m!190849 () Bool)

(assert (=> b!157482 m!190849))

(declare-fun m!190851 () Bool)

(assert (=> bm!17209 m!190851))

(assert (=> b!157484 m!190833))

(assert (=> b!157484 m!190833))

(assert (=> b!157484 m!190835))

(assert (=> b!157425 d!51127))

(declare-fun b!157486 () Bool)

(declare-fun e!103112 () Bool)

(assert (=> b!157486 (= e!103112 tp_is_empty!3235)))

(declare-fun b!157487 () Bool)

(declare-fun e!103111 () Bool)

(assert (=> b!157487 (= e!103111 tp_is_empty!3235)))

(declare-fun condMapEmpty!5505 () Bool)

(declare-fun mapDefault!5505 () ValueCell!1274)

(assert (=> mapNonEmpty!5504 (= condMapEmpty!5505 (= mapRest!5504 ((as const (Array (_ BitVec 32) ValueCell!1274)) mapDefault!5505)))))

(declare-fun mapRes!5505 () Bool)

(assert (=> mapNonEmpty!5504 (= tp!12839 (and e!103111 mapRes!5505))))

(declare-fun mapIsEmpty!5505 () Bool)

(assert (=> mapIsEmpty!5505 mapRes!5505))

(declare-fun mapNonEmpty!5505 () Bool)

(declare-fun tp!12840 () Bool)

(assert (=> mapNonEmpty!5505 (= mapRes!5505 (and tp!12840 e!103112))))

(declare-fun mapValue!5505 () ValueCell!1274)

(declare-fun mapRest!5505 () (Array (_ BitVec 32) ValueCell!1274))

(declare-fun mapKey!5505 () (_ BitVec 32))

(assert (=> mapNonEmpty!5505 (= mapRest!5504 (store mapRest!5505 mapKey!5505 mapValue!5505))))

(assert (= (and mapNonEmpty!5504 condMapEmpty!5505) mapIsEmpty!5505))

(assert (= (and mapNonEmpty!5504 (not condMapEmpty!5505)) mapNonEmpty!5505))

(assert (= (and mapNonEmpty!5505 ((_ is ValueCellFull!1274) mapValue!5505)) b!157486))

(assert (= (and mapNonEmpty!5504 ((_ is ValueCellFull!1274) mapDefault!5505)) b!157487))

(declare-fun m!190853 () Bool)

(assert (=> mapNonEmpty!5505 m!190853))

(check-sat (not b!157445) (not bm!17203) tp_is_empty!3235 (not b!157484) (not b!157447) (not bm!17209) (not b!157448) (not b!157482) (not b_next!3433) (not b!157471) (not mapNonEmpty!5505) b_and!9861 (not b!157472) (not b!157459) (not d!51125) (not bm!17206))
(check-sat b_and!9861 (not b_next!3433))
