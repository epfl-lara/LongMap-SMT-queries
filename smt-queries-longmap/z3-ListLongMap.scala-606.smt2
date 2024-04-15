; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15806 () Bool)

(assert start!15806)

(declare-fun b!157394 () Bool)

(declare-fun b_free!3445 () Bool)

(declare-fun b_next!3445 () Bool)

(assert (=> b!157394 (= b_free!3445 (not b_next!3445))))

(declare-fun tp!12867 () Bool)

(declare-fun b_and!9833 () Bool)

(assert (=> b!157394 (= tp!12867 b_and!9833)))

(declare-fun res!74353 () Bool)

(declare-fun e!103068 () Bool)

(assert (=> start!15806 (=> (not res!74353) (not e!103068))))

(declare-datatypes ((V!3977 0))(
  ( (V!3978 (val!1668 Int)) )
))
(declare-datatypes ((ValueCell!1280 0))(
  ( (ValueCellFull!1280 (v!3527 V!3977)) (EmptyCell!1280) )
))
(declare-datatypes ((array!5531 0))(
  ( (array!5532 (arr!2620 (Array (_ BitVec 32) (_ BitVec 64))) (size!2900 (_ BitVec 32))) )
))
(declare-datatypes ((array!5533 0))(
  ( (array!5534 (arr!2621 (Array (_ BitVec 32) ValueCell!1280)) (size!2901 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1468 0))(
  ( (LongMapFixedSize!1469 (defaultEntry!3176 Int) (mask!7659 (_ BitVec 32)) (extraKeys!2917 (_ BitVec 32)) (zeroValue!3019 V!3977) (minValue!3019 V!3977) (_size!783 (_ BitVec 32)) (_keys!4951 array!5531) (_values!3159 array!5533) (_vacant!783 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1468)

(declare-fun valid!702 (LongMapFixedSize!1468) Bool)

(assert (=> start!15806 (= res!74353 (valid!702 thiss!1248))))

(assert (=> start!15806 e!103068))

(declare-fun e!103065 () Bool)

(assert (=> start!15806 e!103065))

(assert (=> start!15806 true))

(declare-fun mapNonEmpty!5520 () Bool)

(declare-fun mapRes!5520 () Bool)

(declare-fun tp!12866 () Bool)

(declare-fun e!103066 () Bool)

(assert (=> mapNonEmpty!5520 (= mapRes!5520 (and tp!12866 e!103066))))

(declare-fun mapKey!5520 () (_ BitVec 32))

(declare-fun mapValue!5520 () ValueCell!1280)

(declare-fun mapRest!5520 () (Array (_ BitVec 32) ValueCell!1280))

(assert (=> mapNonEmpty!5520 (= (arr!2621 (_values!3159 thiss!1248)) (store mapRest!5520 mapKey!5520 mapValue!5520))))

(declare-fun mapIsEmpty!5520 () Bool)

(assert (=> mapIsEmpty!5520 mapRes!5520))

(declare-fun b!157388 () Bool)

(declare-fun res!74352 () Bool)

(assert (=> b!157388 (=> (not res!74352) (not e!103068))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157388 (= res!74352 (not (= key!828 (bvneg key!828))))))

(declare-fun b!157389 () Bool)

(declare-fun e!103063 () Bool)

(declare-fun tp_is_empty!3247 () Bool)

(assert (=> b!157389 (= e!103063 tp_is_empty!3247)))

(declare-fun b!157390 () Bool)

(assert (=> b!157390 (= e!103068 (and (bvsge (mask!7659 thiss!1248) #b00000000000000000000000000000000) (not (= (size!2900 (_keys!4951 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7659 thiss!1248))))))))

(declare-fun b!157391 () Bool)

(assert (=> b!157391 (= e!103066 tp_is_empty!3247)))

(declare-fun b!157392 () Bool)

(declare-fun res!74354 () Bool)

(assert (=> b!157392 (=> (not res!74354) (not e!103068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157392 (= res!74354 (validMask!0 (mask!7659 thiss!1248)))))

(declare-fun b!157393 () Bool)

(declare-fun e!103067 () Bool)

(assert (=> b!157393 (= e!103067 (and e!103063 mapRes!5520))))

(declare-fun condMapEmpty!5520 () Bool)

(declare-fun mapDefault!5520 () ValueCell!1280)

(assert (=> b!157393 (= condMapEmpty!5520 (= (arr!2621 (_values!3159 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1280)) mapDefault!5520)))))

(declare-fun array_inv!1685 (array!5531) Bool)

(declare-fun array_inv!1686 (array!5533) Bool)

(assert (=> b!157394 (= e!103065 (and tp!12867 tp_is_empty!3247 (array_inv!1685 (_keys!4951 thiss!1248)) (array_inv!1686 (_values!3159 thiss!1248)) e!103067))))

(assert (= (and start!15806 res!74353) b!157388))

(assert (= (and b!157388 res!74352) b!157392))

(assert (= (and b!157392 res!74354) b!157390))

(assert (= (and b!157393 condMapEmpty!5520) mapIsEmpty!5520))

(assert (= (and b!157393 (not condMapEmpty!5520)) mapNonEmpty!5520))

(get-info :version)

(assert (= (and mapNonEmpty!5520 ((_ is ValueCellFull!1280) mapValue!5520)) b!157391))

(assert (= (and b!157393 ((_ is ValueCellFull!1280) mapDefault!5520)) b!157389))

(assert (= b!157394 b!157393))

(assert (= start!15806 b!157394))

(declare-fun m!190093 () Bool)

(assert (=> start!15806 m!190093))

(declare-fun m!190095 () Bool)

(assert (=> mapNonEmpty!5520 m!190095))

(declare-fun m!190097 () Bool)

(assert (=> b!157392 m!190097))

(declare-fun m!190099 () Bool)

(assert (=> b!157394 m!190099))

(declare-fun m!190101 () Bool)

(assert (=> b!157394 m!190101))

(check-sat (not b_next!3445) (not start!15806) tp_is_empty!3247 b_and!9833 (not b!157392) (not mapNonEmpty!5520) (not b!157394))
(check-sat b_and!9833 (not b_next!3445))
(get-model)

(declare-fun d!50919 () Bool)

(assert (=> d!50919 (= (array_inv!1685 (_keys!4951 thiss!1248)) (bvsge (size!2900 (_keys!4951 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157394 d!50919))

(declare-fun d!50921 () Bool)

(assert (=> d!50921 (= (array_inv!1686 (_values!3159 thiss!1248)) (bvsge (size!2901 (_values!3159 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157394 d!50921))

(declare-fun d!50923 () Bool)

(declare-fun res!74379 () Bool)

(declare-fun e!103107 () Bool)

(assert (=> d!50923 (=> (not res!74379) (not e!103107))))

(declare-fun simpleValid!107 (LongMapFixedSize!1468) Bool)

(assert (=> d!50923 (= res!74379 (simpleValid!107 thiss!1248))))

(assert (=> d!50923 (= (valid!702 thiss!1248) e!103107)))

(declare-fun b!157443 () Bool)

(declare-fun res!74380 () Bool)

(assert (=> b!157443 (=> (not res!74380) (not e!103107))))

(declare-fun arrayCountValidKeys!0 (array!5531 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157443 (= res!74380 (= (arrayCountValidKeys!0 (_keys!4951 thiss!1248) #b00000000000000000000000000000000 (size!2900 (_keys!4951 thiss!1248))) (_size!783 thiss!1248)))))

(declare-fun b!157444 () Bool)

(declare-fun res!74381 () Bool)

(assert (=> b!157444 (=> (not res!74381) (not e!103107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5531 (_ BitVec 32)) Bool)

(assert (=> b!157444 (= res!74381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4951 thiss!1248) (mask!7659 thiss!1248)))))

(declare-fun b!157445 () Bool)

(declare-datatypes ((List!1881 0))(
  ( (Nil!1878) (Cons!1877 (h!2486 (_ BitVec 64)) (t!6674 List!1881)) )
))
(declare-fun arrayNoDuplicates!0 (array!5531 (_ BitVec 32) List!1881) Bool)

(assert (=> b!157445 (= e!103107 (arrayNoDuplicates!0 (_keys!4951 thiss!1248) #b00000000000000000000000000000000 Nil!1878))))

(assert (= (and d!50923 res!74379) b!157443))

(assert (= (and b!157443 res!74380) b!157444))

(assert (= (and b!157444 res!74381) b!157445))

(declare-fun m!190123 () Bool)

(assert (=> d!50923 m!190123))

(declare-fun m!190125 () Bool)

(assert (=> b!157443 m!190125))

(declare-fun m!190127 () Bool)

(assert (=> b!157444 m!190127))

(declare-fun m!190129 () Bool)

(assert (=> b!157445 m!190129))

(assert (=> start!15806 d!50923))

(declare-fun d!50925 () Bool)

(assert (=> d!50925 (= (validMask!0 (mask!7659 thiss!1248)) (and (or (= (mask!7659 thiss!1248) #b00000000000000000000000000000111) (= (mask!7659 thiss!1248) #b00000000000000000000000000001111) (= (mask!7659 thiss!1248) #b00000000000000000000000000011111) (= (mask!7659 thiss!1248) #b00000000000000000000000000111111) (= (mask!7659 thiss!1248) #b00000000000000000000000001111111) (= (mask!7659 thiss!1248) #b00000000000000000000000011111111) (= (mask!7659 thiss!1248) #b00000000000000000000000111111111) (= (mask!7659 thiss!1248) #b00000000000000000000001111111111) (= (mask!7659 thiss!1248) #b00000000000000000000011111111111) (= (mask!7659 thiss!1248) #b00000000000000000000111111111111) (= (mask!7659 thiss!1248) #b00000000000000000001111111111111) (= (mask!7659 thiss!1248) #b00000000000000000011111111111111) (= (mask!7659 thiss!1248) #b00000000000000000111111111111111) (= (mask!7659 thiss!1248) #b00000000000000001111111111111111) (= (mask!7659 thiss!1248) #b00000000000000011111111111111111) (= (mask!7659 thiss!1248) #b00000000000000111111111111111111) (= (mask!7659 thiss!1248) #b00000000000001111111111111111111) (= (mask!7659 thiss!1248) #b00000000000011111111111111111111) (= (mask!7659 thiss!1248) #b00000000000111111111111111111111) (= (mask!7659 thiss!1248) #b00000000001111111111111111111111) (= (mask!7659 thiss!1248) #b00000000011111111111111111111111) (= (mask!7659 thiss!1248) #b00000000111111111111111111111111) (= (mask!7659 thiss!1248) #b00000001111111111111111111111111) (= (mask!7659 thiss!1248) #b00000011111111111111111111111111) (= (mask!7659 thiss!1248) #b00000111111111111111111111111111) (= (mask!7659 thiss!1248) #b00001111111111111111111111111111) (= (mask!7659 thiss!1248) #b00011111111111111111111111111111) (= (mask!7659 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7659 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157392 d!50925))

(declare-fun b!157452 () Bool)

(declare-fun e!103112 () Bool)

(assert (=> b!157452 (= e!103112 tp_is_empty!3247)))

(declare-fun mapNonEmpty!5529 () Bool)

(declare-fun mapRes!5529 () Bool)

(declare-fun tp!12882 () Bool)

(assert (=> mapNonEmpty!5529 (= mapRes!5529 (and tp!12882 e!103112))))

(declare-fun mapKey!5529 () (_ BitVec 32))

(declare-fun mapValue!5529 () ValueCell!1280)

(declare-fun mapRest!5529 () (Array (_ BitVec 32) ValueCell!1280))

(assert (=> mapNonEmpty!5529 (= mapRest!5520 (store mapRest!5529 mapKey!5529 mapValue!5529))))

(declare-fun condMapEmpty!5529 () Bool)

(declare-fun mapDefault!5529 () ValueCell!1280)

(assert (=> mapNonEmpty!5520 (= condMapEmpty!5529 (= mapRest!5520 ((as const (Array (_ BitVec 32) ValueCell!1280)) mapDefault!5529)))))

(declare-fun e!103113 () Bool)

(assert (=> mapNonEmpty!5520 (= tp!12866 (and e!103113 mapRes!5529))))

(declare-fun b!157453 () Bool)

(assert (=> b!157453 (= e!103113 tp_is_empty!3247)))

(declare-fun mapIsEmpty!5529 () Bool)

(assert (=> mapIsEmpty!5529 mapRes!5529))

(assert (= (and mapNonEmpty!5520 condMapEmpty!5529) mapIsEmpty!5529))

(assert (= (and mapNonEmpty!5520 (not condMapEmpty!5529)) mapNonEmpty!5529))

(assert (= (and mapNonEmpty!5529 ((_ is ValueCellFull!1280) mapValue!5529)) b!157452))

(assert (= (and mapNonEmpty!5520 ((_ is ValueCellFull!1280) mapDefault!5529)) b!157453))

(declare-fun m!190131 () Bool)

(assert (=> mapNonEmpty!5529 m!190131))

(check-sat (not b!157444) (not b!157443) (not mapNonEmpty!5529) tp_is_empty!3247 b_and!9833 (not b!157445) (not b_next!3445) (not d!50923))
(check-sat b_and!9833 (not b_next!3445))
(get-model)

(declare-fun d!50927 () Bool)

(declare-fun res!74388 () Bool)

(declare-fun e!103124 () Bool)

(assert (=> d!50927 (=> res!74388 e!103124)))

(assert (=> d!50927 (= res!74388 (bvsge #b00000000000000000000000000000000 (size!2900 (_keys!4951 thiss!1248))))))

(assert (=> d!50927 (= (arrayNoDuplicates!0 (_keys!4951 thiss!1248) #b00000000000000000000000000000000 Nil!1878) e!103124)))

(declare-fun bm!17200 () Bool)

(declare-fun call!17203 () Bool)

(declare-fun c!29681 () Bool)

(assert (=> bm!17200 (= call!17203 (arrayNoDuplicates!0 (_keys!4951 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29681 (Cons!1877 (select (arr!2620 (_keys!4951 thiss!1248)) #b00000000000000000000000000000000) Nil!1878) Nil!1878)))))

(declare-fun b!157464 () Bool)

(declare-fun e!103123 () Bool)

(assert (=> b!157464 (= e!103124 e!103123)))

(declare-fun res!74390 () Bool)

(assert (=> b!157464 (=> (not res!74390) (not e!103123))))

(declare-fun e!103125 () Bool)

(assert (=> b!157464 (= res!74390 (not e!103125))))

(declare-fun res!74389 () Bool)

(assert (=> b!157464 (=> (not res!74389) (not e!103125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!157464 (= res!74389 (validKeyInArray!0 (select (arr!2620 (_keys!4951 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157465 () Bool)

(declare-fun e!103122 () Bool)

(assert (=> b!157465 (= e!103122 call!17203)))

(declare-fun b!157466 () Bool)

(declare-fun contains!963 (List!1881 (_ BitVec 64)) Bool)

(assert (=> b!157466 (= e!103125 (contains!963 Nil!1878 (select (arr!2620 (_keys!4951 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157467 () Bool)

(assert (=> b!157467 (= e!103122 call!17203)))

(declare-fun b!157468 () Bool)

(assert (=> b!157468 (= e!103123 e!103122)))

(assert (=> b!157468 (= c!29681 (validKeyInArray!0 (select (arr!2620 (_keys!4951 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!50927 (not res!74388)) b!157464))

(assert (= (and b!157464 res!74389) b!157466))

(assert (= (and b!157464 res!74390) b!157468))

(assert (= (and b!157468 c!29681) b!157465))

(assert (= (and b!157468 (not c!29681)) b!157467))

(assert (= (or b!157465 b!157467) bm!17200))

(declare-fun m!190133 () Bool)

(assert (=> bm!17200 m!190133))

(declare-fun m!190135 () Bool)

(assert (=> bm!17200 m!190135))

(assert (=> b!157464 m!190133))

(assert (=> b!157464 m!190133))

(declare-fun m!190137 () Bool)

(assert (=> b!157464 m!190137))

(assert (=> b!157466 m!190133))

(assert (=> b!157466 m!190133))

(declare-fun m!190139 () Bool)

(assert (=> b!157466 m!190139))

(assert (=> b!157468 m!190133))

(assert (=> b!157468 m!190133))

(assert (=> b!157468 m!190137))

(assert (=> b!157445 d!50927))

(declare-fun d!50929 () Bool)

(declare-fun lt!81558 () (_ BitVec 32))

(assert (=> d!50929 (and (bvsge lt!81558 #b00000000000000000000000000000000) (bvsle lt!81558 (bvsub (size!2900 (_keys!4951 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!103130 () (_ BitVec 32))

(assert (=> d!50929 (= lt!81558 e!103130)))

(declare-fun c!29687 () Bool)

(assert (=> d!50929 (= c!29687 (bvsge #b00000000000000000000000000000000 (size!2900 (_keys!4951 thiss!1248))))))

(assert (=> d!50929 (and (bvsle #b00000000000000000000000000000000 (size!2900 (_keys!4951 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2900 (_keys!4951 thiss!1248)) (size!2900 (_keys!4951 thiss!1248))))))

(assert (=> d!50929 (= (arrayCountValidKeys!0 (_keys!4951 thiss!1248) #b00000000000000000000000000000000 (size!2900 (_keys!4951 thiss!1248))) lt!81558)))

(declare-fun b!157477 () Bool)

(declare-fun e!103131 () (_ BitVec 32))

(assert (=> b!157477 (= e!103130 e!103131)))

(declare-fun c!29686 () Bool)

(assert (=> b!157477 (= c!29686 (validKeyInArray!0 (select (arr!2620 (_keys!4951 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157478 () Bool)

(declare-fun call!17206 () (_ BitVec 32))

(assert (=> b!157478 (= e!103131 (bvadd #b00000000000000000000000000000001 call!17206))))

(declare-fun bm!17203 () Bool)

(assert (=> bm!17203 (= call!17206 (arrayCountValidKeys!0 (_keys!4951 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2900 (_keys!4951 thiss!1248))))))

(declare-fun b!157479 () Bool)

(assert (=> b!157479 (= e!103131 call!17206)))

(declare-fun b!157480 () Bool)

(assert (=> b!157480 (= e!103130 #b00000000000000000000000000000000)))

(assert (= (and d!50929 c!29687) b!157480))

(assert (= (and d!50929 (not c!29687)) b!157477))

(assert (= (and b!157477 c!29686) b!157478))

(assert (= (and b!157477 (not c!29686)) b!157479))

(assert (= (or b!157478 b!157479) bm!17203))

(assert (=> b!157477 m!190133))

(assert (=> b!157477 m!190133))

(assert (=> b!157477 m!190137))

(declare-fun m!190141 () Bool)

(assert (=> bm!17203 m!190141))

(assert (=> b!157443 d!50929))

(declare-fun b!157491 () Bool)

(declare-fun res!74402 () Bool)

(declare-fun e!103134 () Bool)

(assert (=> b!157491 (=> (not res!74402) (not e!103134))))

(declare-fun size!2906 (LongMapFixedSize!1468) (_ BitVec 32))

(assert (=> b!157491 (= res!74402 (= (size!2906 thiss!1248) (bvadd (_size!783 thiss!1248) (bvsdiv (bvadd (extraKeys!2917 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!157490 () Bool)

(declare-fun res!74400 () Bool)

(assert (=> b!157490 (=> (not res!74400) (not e!103134))))

(assert (=> b!157490 (= res!74400 (bvsge (size!2906 thiss!1248) (_size!783 thiss!1248)))))

(declare-fun b!157492 () Bool)

(assert (=> b!157492 (= e!103134 (and (bvsge (extraKeys!2917 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2917 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!783 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!50931 () Bool)

(declare-fun res!74401 () Bool)

(assert (=> d!50931 (=> (not res!74401) (not e!103134))))

(assert (=> d!50931 (= res!74401 (validMask!0 (mask!7659 thiss!1248)))))

(assert (=> d!50931 (= (simpleValid!107 thiss!1248) e!103134)))

(declare-fun b!157489 () Bool)

(declare-fun res!74399 () Bool)

(assert (=> b!157489 (=> (not res!74399) (not e!103134))))

(assert (=> b!157489 (= res!74399 (and (= (size!2901 (_values!3159 thiss!1248)) (bvadd (mask!7659 thiss!1248) #b00000000000000000000000000000001)) (= (size!2900 (_keys!4951 thiss!1248)) (size!2901 (_values!3159 thiss!1248))) (bvsge (_size!783 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!783 thiss!1248) (bvadd (mask!7659 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!50931 res!74401) b!157489))

(assert (= (and b!157489 res!74399) b!157490))

(assert (= (and b!157490 res!74400) b!157491))

(assert (= (and b!157491 res!74402) b!157492))

(declare-fun m!190143 () Bool)

(assert (=> b!157491 m!190143))

(assert (=> b!157490 m!190143))

(assert (=> d!50931 m!190097))

(assert (=> d!50923 d!50931))

(declare-fun b!157501 () Bool)

(declare-fun e!103142 () Bool)

(declare-fun e!103143 () Bool)

(assert (=> b!157501 (= e!103142 e!103143)))

(declare-fun c!29690 () Bool)

(assert (=> b!157501 (= c!29690 (validKeyInArray!0 (select (arr!2620 (_keys!4951 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!50933 () Bool)

(declare-fun res!74408 () Bool)

(assert (=> d!50933 (=> res!74408 e!103142)))

(assert (=> d!50933 (= res!74408 (bvsge #b00000000000000000000000000000000 (size!2900 (_keys!4951 thiss!1248))))))

(assert (=> d!50933 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4951 thiss!1248) (mask!7659 thiss!1248)) e!103142)))

(declare-fun b!157502 () Bool)

(declare-fun e!103141 () Bool)

(assert (=> b!157502 (= e!103143 e!103141)))

(declare-fun lt!81565 () (_ BitVec 64))

(assert (=> b!157502 (= lt!81565 (select (arr!2620 (_keys!4951 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4956 0))(
  ( (Unit!4957) )
))
(declare-fun lt!81567 () Unit!4956)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5531 (_ BitVec 64) (_ BitVec 32)) Unit!4956)

(assert (=> b!157502 (= lt!81567 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4951 thiss!1248) lt!81565 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157502 (arrayContainsKey!0 (_keys!4951 thiss!1248) lt!81565 #b00000000000000000000000000000000)))

(declare-fun lt!81566 () Unit!4956)

(assert (=> b!157502 (= lt!81566 lt!81567)))

(declare-fun res!74407 () Bool)

(declare-datatypes ((SeekEntryResult!291 0))(
  ( (MissingZero!291 (index!3332 (_ BitVec 32))) (Found!291 (index!3333 (_ BitVec 32))) (Intermediate!291 (undefined!1103 Bool) (index!3334 (_ BitVec 32)) (x!17366 (_ BitVec 32))) (Undefined!291) (MissingVacant!291 (index!3335 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5531 (_ BitVec 32)) SeekEntryResult!291)

(assert (=> b!157502 (= res!74407 (= (seekEntryOrOpen!0 (select (arr!2620 (_keys!4951 thiss!1248)) #b00000000000000000000000000000000) (_keys!4951 thiss!1248) (mask!7659 thiss!1248)) (Found!291 #b00000000000000000000000000000000)))))

(assert (=> b!157502 (=> (not res!74407) (not e!103141))))

(declare-fun b!157503 () Bool)

(declare-fun call!17209 () Bool)

(assert (=> b!157503 (= e!103143 call!17209)))

(declare-fun b!157504 () Bool)

(assert (=> b!157504 (= e!103141 call!17209)))

(declare-fun bm!17206 () Bool)

(assert (=> bm!17206 (= call!17209 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4951 thiss!1248) (mask!7659 thiss!1248)))))

(assert (= (and d!50933 (not res!74408)) b!157501))

(assert (= (and b!157501 c!29690) b!157502))

(assert (= (and b!157501 (not c!29690)) b!157503))

(assert (= (and b!157502 res!74407) b!157504))

(assert (= (or b!157504 b!157503) bm!17206))

(assert (=> b!157501 m!190133))

(assert (=> b!157501 m!190133))

(assert (=> b!157501 m!190137))

(assert (=> b!157502 m!190133))

(declare-fun m!190145 () Bool)

(assert (=> b!157502 m!190145))

(declare-fun m!190147 () Bool)

(assert (=> b!157502 m!190147))

(assert (=> b!157502 m!190133))

(declare-fun m!190149 () Bool)

(assert (=> b!157502 m!190149))

(declare-fun m!190151 () Bool)

(assert (=> bm!17206 m!190151))

(assert (=> b!157444 d!50933))

(declare-fun b!157505 () Bool)

(declare-fun e!103144 () Bool)

(assert (=> b!157505 (= e!103144 tp_is_empty!3247)))

(declare-fun mapNonEmpty!5530 () Bool)

(declare-fun mapRes!5530 () Bool)

(declare-fun tp!12883 () Bool)

(assert (=> mapNonEmpty!5530 (= mapRes!5530 (and tp!12883 e!103144))))

(declare-fun mapValue!5530 () ValueCell!1280)

(declare-fun mapKey!5530 () (_ BitVec 32))

(declare-fun mapRest!5530 () (Array (_ BitVec 32) ValueCell!1280))

(assert (=> mapNonEmpty!5530 (= mapRest!5529 (store mapRest!5530 mapKey!5530 mapValue!5530))))

(declare-fun condMapEmpty!5530 () Bool)

(declare-fun mapDefault!5530 () ValueCell!1280)

(assert (=> mapNonEmpty!5529 (= condMapEmpty!5530 (= mapRest!5529 ((as const (Array (_ BitVec 32) ValueCell!1280)) mapDefault!5530)))))

(declare-fun e!103145 () Bool)

(assert (=> mapNonEmpty!5529 (= tp!12882 (and e!103145 mapRes!5530))))

(declare-fun b!157506 () Bool)

(assert (=> b!157506 (= e!103145 tp_is_empty!3247)))

(declare-fun mapIsEmpty!5530 () Bool)

(assert (=> mapIsEmpty!5530 mapRes!5530))

(assert (= (and mapNonEmpty!5529 condMapEmpty!5530) mapIsEmpty!5530))

(assert (= (and mapNonEmpty!5529 (not condMapEmpty!5530)) mapNonEmpty!5530))

(assert (= (and mapNonEmpty!5530 ((_ is ValueCellFull!1280) mapValue!5530)) b!157505))

(assert (= (and mapNonEmpty!5529 ((_ is ValueCellFull!1280) mapDefault!5530)) b!157506))

(declare-fun m!190153 () Bool)

(assert (=> mapNonEmpty!5530 m!190153))

(check-sat (not bm!17206) (not b_next!3445) (not d!50931) (not bm!17200) (not b!157502) tp_is_empty!3247 (not b!157491) (not b!157464) (not bm!17203) (not b!157490) (not b!157477) (not b!157468) b_and!9833 (not b!157501) (not b!157466) (not mapNonEmpty!5530))
(check-sat b_and!9833 (not b_next!3445))
