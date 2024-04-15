; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15770 () Bool)

(assert start!15770)

(declare-fun b!157183 () Bool)

(declare-fun b_free!3433 () Bool)

(declare-fun b_next!3433 () Bool)

(assert (=> b!157183 (= b_free!3433 (not b_next!3433))))

(declare-fun tp!12824 () Bool)

(declare-fun b_and!9821 () Bool)

(assert (=> b!157183 (= tp!12824 b_and!9821)))

(declare-fun b!157182 () Bool)

(declare-fun e!102909 () Bool)

(declare-datatypes ((V!3961 0))(
  ( (V!3962 (val!1662 Int)) )
))
(declare-datatypes ((ValueCell!1274 0))(
  ( (ValueCellFull!1274 (v!3521 V!3961)) (EmptyCell!1274) )
))
(declare-datatypes ((array!5503 0))(
  ( (array!5504 (arr!2608 (Array (_ BitVec 32) (_ BitVec 64))) (size!2887 (_ BitVec 32))) )
))
(declare-datatypes ((array!5505 0))(
  ( (array!5506 (arr!2609 (Array (_ BitVec 32) ValueCell!1274)) (size!2888 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1456 0))(
  ( (LongMapFixedSize!1457 (defaultEntry!3170 Int) (mask!7646 (_ BitVec 32)) (extraKeys!2911 (_ BitVec 32)) (zeroValue!3013 V!3961) (minValue!3013 V!3961) (_size!777 (_ BitVec 32)) (_keys!4944 array!5503) (_values!3153 array!5505) (_vacant!777 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1456)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157182 (= e!102909 (not (validMask!0 (mask!7646 thiss!1248))))))

(declare-fun e!102905 () Bool)

(declare-fun tp_is_empty!3235 () Bool)

(declare-fun e!102906 () Bool)

(declare-fun array_inv!1677 (array!5503) Bool)

(declare-fun array_inv!1678 (array!5505) Bool)

(assert (=> b!157183 (= e!102906 (and tp!12824 tp_is_empty!3235 (array_inv!1677 (_keys!4944 thiss!1248)) (array_inv!1678 (_values!3153 thiss!1248)) e!102905))))

(declare-fun mapNonEmpty!5495 () Bool)

(declare-fun mapRes!5495 () Bool)

(declare-fun tp!12823 () Bool)

(declare-fun e!102910 () Bool)

(assert (=> mapNonEmpty!5495 (= mapRes!5495 (and tp!12823 e!102910))))

(declare-fun mapValue!5495 () ValueCell!1274)

(declare-fun mapKey!5495 () (_ BitVec 32))

(declare-fun mapRest!5495 () (Array (_ BitVec 32) ValueCell!1274))

(assert (=> mapNonEmpty!5495 (= (arr!2609 (_values!3153 thiss!1248)) (store mapRest!5495 mapKey!5495 mapValue!5495))))

(declare-fun b!157184 () Bool)

(assert (=> b!157184 (= e!102910 tp_is_empty!3235)))

(declare-fun b!157185 () Bool)

(declare-fun res!74260 () Bool)

(assert (=> b!157185 (=> (not res!74260) (not e!102909))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157185 (= res!74260 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5495 () Bool)

(assert (=> mapIsEmpty!5495 mapRes!5495))

(declare-fun res!74261 () Bool)

(assert (=> start!15770 (=> (not res!74261) (not e!102909))))

(declare-fun valid!698 (LongMapFixedSize!1456) Bool)

(assert (=> start!15770 (= res!74261 (valid!698 thiss!1248))))

(assert (=> start!15770 e!102909))

(assert (=> start!15770 e!102906))

(assert (=> start!15770 true))

(declare-fun b!157186 () Bool)

(declare-fun e!102907 () Bool)

(assert (=> b!157186 (= e!102905 (and e!102907 mapRes!5495))))

(declare-fun condMapEmpty!5495 () Bool)

(declare-fun mapDefault!5495 () ValueCell!1274)

(assert (=> b!157186 (= condMapEmpty!5495 (= (arr!2609 (_values!3153 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1274)) mapDefault!5495)))))

(declare-fun b!157187 () Bool)

(assert (=> b!157187 (= e!102907 tp_is_empty!3235)))

(assert (= (and start!15770 res!74261) b!157185))

(assert (= (and b!157185 res!74260) b!157182))

(assert (= (and b!157186 condMapEmpty!5495) mapIsEmpty!5495))

(assert (= (and b!157186 (not condMapEmpty!5495)) mapNonEmpty!5495))

(get-info :version)

(assert (= (and mapNonEmpty!5495 ((_ is ValueCellFull!1274) mapValue!5495)) b!157184))

(assert (= (and b!157186 ((_ is ValueCellFull!1274) mapDefault!5495)) b!157187))

(assert (= b!157183 b!157186))

(assert (= start!15770 b!157183))

(declare-fun m!189991 () Bool)

(assert (=> b!157182 m!189991))

(declare-fun m!189993 () Bool)

(assert (=> b!157183 m!189993))

(declare-fun m!189995 () Bool)

(assert (=> b!157183 m!189995))

(declare-fun m!189997 () Bool)

(assert (=> mapNonEmpty!5495 m!189997))

(declare-fun m!189999 () Bool)

(assert (=> start!15770 m!189999))

(check-sat (not mapNonEmpty!5495) (not b!157182) (not b_next!3433) (not start!15770) b_and!9821 tp_is_empty!3235 (not b!157183))
(check-sat b_and!9821 (not b_next!3433))
(get-model)

(declare-fun d!50891 () Bool)

(assert (=> d!50891 (= (validMask!0 (mask!7646 thiss!1248)) (and (or (= (mask!7646 thiss!1248) #b00000000000000000000000000000111) (= (mask!7646 thiss!1248) #b00000000000000000000000000001111) (= (mask!7646 thiss!1248) #b00000000000000000000000000011111) (= (mask!7646 thiss!1248) #b00000000000000000000000000111111) (= (mask!7646 thiss!1248) #b00000000000000000000000001111111) (= (mask!7646 thiss!1248) #b00000000000000000000000011111111) (= (mask!7646 thiss!1248) #b00000000000000000000000111111111) (= (mask!7646 thiss!1248) #b00000000000000000000001111111111) (= (mask!7646 thiss!1248) #b00000000000000000000011111111111) (= (mask!7646 thiss!1248) #b00000000000000000000111111111111) (= (mask!7646 thiss!1248) #b00000000000000000001111111111111) (= (mask!7646 thiss!1248) #b00000000000000000011111111111111) (= (mask!7646 thiss!1248) #b00000000000000000111111111111111) (= (mask!7646 thiss!1248) #b00000000000000001111111111111111) (= (mask!7646 thiss!1248) #b00000000000000011111111111111111) (= (mask!7646 thiss!1248) #b00000000000000111111111111111111) (= (mask!7646 thiss!1248) #b00000000000001111111111111111111) (= (mask!7646 thiss!1248) #b00000000000011111111111111111111) (= (mask!7646 thiss!1248) #b00000000000111111111111111111111) (= (mask!7646 thiss!1248) #b00000000001111111111111111111111) (= (mask!7646 thiss!1248) #b00000000011111111111111111111111) (= (mask!7646 thiss!1248) #b00000000111111111111111111111111) (= (mask!7646 thiss!1248) #b00000001111111111111111111111111) (= (mask!7646 thiss!1248) #b00000011111111111111111111111111) (= (mask!7646 thiss!1248) #b00000111111111111111111111111111) (= (mask!7646 thiss!1248) #b00001111111111111111111111111111) (= (mask!7646 thiss!1248) #b00011111111111111111111111111111) (= (mask!7646 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7646 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157182 d!50891))

(declare-fun d!50893 () Bool)

(declare-fun res!74280 () Bool)

(declare-fun e!102949 () Bool)

(assert (=> d!50893 (=> (not res!74280) (not e!102949))))

(declare-fun simpleValid!105 (LongMapFixedSize!1456) Bool)

(assert (=> d!50893 (= res!74280 (simpleValid!105 thiss!1248))))

(assert (=> d!50893 (= (valid!698 thiss!1248) e!102949)))

(declare-fun b!157230 () Bool)

(declare-fun res!74281 () Bool)

(assert (=> b!157230 (=> (not res!74281) (not e!102949))))

(declare-fun arrayCountValidKeys!0 (array!5503 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157230 (= res!74281 (= (arrayCountValidKeys!0 (_keys!4944 thiss!1248) #b00000000000000000000000000000000 (size!2887 (_keys!4944 thiss!1248))) (_size!777 thiss!1248)))))

(declare-fun b!157231 () Bool)

(declare-fun res!74282 () Bool)

(assert (=> b!157231 (=> (not res!74282) (not e!102949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5503 (_ BitVec 32)) Bool)

(assert (=> b!157231 (= res!74282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4944 thiss!1248) (mask!7646 thiss!1248)))))

(declare-fun b!157232 () Bool)

(declare-datatypes ((List!1879 0))(
  ( (Nil!1876) (Cons!1875 (h!2484 (_ BitVec 64)) (t!6672 List!1879)) )
))
(declare-fun arrayNoDuplicates!0 (array!5503 (_ BitVec 32) List!1879) Bool)

(assert (=> b!157232 (= e!102949 (arrayNoDuplicates!0 (_keys!4944 thiss!1248) #b00000000000000000000000000000000 Nil!1876))))

(assert (= (and d!50893 res!74280) b!157230))

(assert (= (and b!157230 res!74281) b!157231))

(assert (= (and b!157231 res!74282) b!157232))

(declare-fun m!190021 () Bool)

(assert (=> d!50893 m!190021))

(declare-fun m!190023 () Bool)

(assert (=> b!157230 m!190023))

(declare-fun m!190025 () Bool)

(assert (=> b!157231 m!190025))

(declare-fun m!190027 () Bool)

(assert (=> b!157232 m!190027))

(assert (=> start!15770 d!50893))

(declare-fun d!50895 () Bool)

(assert (=> d!50895 (= (array_inv!1677 (_keys!4944 thiss!1248)) (bvsge (size!2887 (_keys!4944 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157183 d!50895))

(declare-fun d!50897 () Bool)

(assert (=> d!50897 (= (array_inv!1678 (_values!3153 thiss!1248)) (bvsge (size!2888 (_values!3153 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157183 d!50897))

(declare-fun condMapEmpty!5504 () Bool)

(declare-fun mapDefault!5504 () ValueCell!1274)

(assert (=> mapNonEmpty!5495 (= condMapEmpty!5504 (= mapRest!5495 ((as const (Array (_ BitVec 32) ValueCell!1274)) mapDefault!5504)))))

(declare-fun e!102955 () Bool)

(declare-fun mapRes!5504 () Bool)

(assert (=> mapNonEmpty!5495 (= tp!12823 (and e!102955 mapRes!5504))))

(declare-fun b!157240 () Bool)

(assert (=> b!157240 (= e!102955 tp_is_empty!3235)))

(declare-fun mapNonEmpty!5504 () Bool)

(declare-fun tp!12839 () Bool)

(declare-fun e!102954 () Bool)

(assert (=> mapNonEmpty!5504 (= mapRes!5504 (and tp!12839 e!102954))))

(declare-fun mapKey!5504 () (_ BitVec 32))

(declare-fun mapRest!5504 () (Array (_ BitVec 32) ValueCell!1274))

(declare-fun mapValue!5504 () ValueCell!1274)

(assert (=> mapNonEmpty!5504 (= mapRest!5495 (store mapRest!5504 mapKey!5504 mapValue!5504))))

(declare-fun mapIsEmpty!5504 () Bool)

(assert (=> mapIsEmpty!5504 mapRes!5504))

(declare-fun b!157239 () Bool)

(assert (=> b!157239 (= e!102954 tp_is_empty!3235)))

(assert (= (and mapNonEmpty!5495 condMapEmpty!5504) mapIsEmpty!5504))

(assert (= (and mapNonEmpty!5495 (not condMapEmpty!5504)) mapNonEmpty!5504))

(assert (= (and mapNonEmpty!5504 ((_ is ValueCellFull!1274) mapValue!5504)) b!157239))

(assert (= (and mapNonEmpty!5495 ((_ is ValueCellFull!1274) mapDefault!5504)) b!157240))

(declare-fun m!190029 () Bool)

(assert (=> mapNonEmpty!5504 m!190029))

(check-sat (not b!157232) (not d!50893) (not b_next!3433) (not mapNonEmpty!5504) (not b!157230) b_and!9821 tp_is_empty!3235 (not b!157231))
(check-sat b_and!9821 (not b_next!3433))
(get-model)

(declare-fun d!50899 () Bool)

(declare-fun res!74287 () Bool)

(declare-fun e!102964 () Bool)

(assert (=> d!50899 (=> res!74287 e!102964)))

(assert (=> d!50899 (= res!74287 (bvsge #b00000000000000000000000000000000 (size!2887 (_keys!4944 thiss!1248))))))

(assert (=> d!50899 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4944 thiss!1248) (mask!7646 thiss!1248)) e!102964)))

(declare-fun b!157249 () Bool)

(declare-fun e!102963 () Bool)

(assert (=> b!157249 (= e!102964 e!102963)))

(declare-fun c!29669 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!157249 (= c!29669 (validKeyInArray!0 (select (arr!2608 (_keys!4944 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157250 () Bool)

(declare-fun e!102962 () Bool)

(declare-fun call!17194 () Bool)

(assert (=> b!157250 (= e!102962 call!17194)))

(declare-fun bm!17191 () Bool)

(assert (=> bm!17191 (= call!17194 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4944 thiss!1248) (mask!7646 thiss!1248)))))

(declare-fun b!157251 () Bool)

(assert (=> b!157251 (= e!102963 call!17194)))

(declare-fun b!157252 () Bool)

(assert (=> b!157252 (= e!102963 e!102962)))

(declare-fun lt!81550 () (_ BitVec 64))

(assert (=> b!157252 (= lt!81550 (select (arr!2608 (_keys!4944 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4954 0))(
  ( (Unit!4955) )
))
(declare-fun lt!81551 () Unit!4954)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5503 (_ BitVec 64) (_ BitVec 32)) Unit!4954)

(assert (=> b!157252 (= lt!81551 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4944 thiss!1248) lt!81550 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157252 (arrayContainsKey!0 (_keys!4944 thiss!1248) lt!81550 #b00000000000000000000000000000000)))

(declare-fun lt!81552 () Unit!4954)

(assert (=> b!157252 (= lt!81552 lt!81551)))

(declare-fun res!74288 () Bool)

(declare-datatypes ((SeekEntryResult!290 0))(
  ( (MissingZero!290 (index!3328 (_ BitVec 32))) (Found!290 (index!3329 (_ BitVec 32))) (Intermediate!290 (undefined!1102 Bool) (index!3330 (_ BitVec 32)) (x!17327 (_ BitVec 32))) (Undefined!290) (MissingVacant!290 (index!3331 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5503 (_ BitVec 32)) SeekEntryResult!290)

(assert (=> b!157252 (= res!74288 (= (seekEntryOrOpen!0 (select (arr!2608 (_keys!4944 thiss!1248)) #b00000000000000000000000000000000) (_keys!4944 thiss!1248) (mask!7646 thiss!1248)) (Found!290 #b00000000000000000000000000000000)))))

(assert (=> b!157252 (=> (not res!74288) (not e!102962))))

(assert (= (and d!50899 (not res!74287)) b!157249))

(assert (= (and b!157249 c!29669) b!157252))

(assert (= (and b!157249 (not c!29669)) b!157251))

(assert (= (and b!157252 res!74288) b!157250))

(assert (= (or b!157250 b!157251) bm!17191))

(declare-fun m!190031 () Bool)

(assert (=> b!157249 m!190031))

(assert (=> b!157249 m!190031))

(declare-fun m!190033 () Bool)

(assert (=> b!157249 m!190033))

(declare-fun m!190035 () Bool)

(assert (=> bm!17191 m!190035))

(assert (=> b!157252 m!190031))

(declare-fun m!190037 () Bool)

(assert (=> b!157252 m!190037))

(declare-fun m!190039 () Bool)

(assert (=> b!157252 m!190039))

(assert (=> b!157252 m!190031))

(declare-fun m!190041 () Bool)

(assert (=> b!157252 m!190041))

(assert (=> b!157231 d!50899))

(declare-fun bm!17194 () Bool)

(declare-fun call!17197 () Bool)

(declare-fun c!29672 () Bool)

(assert (=> bm!17194 (= call!17197 (arrayNoDuplicates!0 (_keys!4944 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29672 (Cons!1875 (select (arr!2608 (_keys!4944 thiss!1248)) #b00000000000000000000000000000000) Nil!1876) Nil!1876)))))

(declare-fun b!157263 () Bool)

(declare-fun e!102973 () Bool)

(declare-fun e!102974 () Bool)

(assert (=> b!157263 (= e!102973 e!102974)))

(assert (=> b!157263 (= c!29672 (validKeyInArray!0 (select (arr!2608 (_keys!4944 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157264 () Bool)

(assert (=> b!157264 (= e!102974 call!17197)))

(declare-fun b!157265 () Bool)

(declare-fun e!102975 () Bool)

(declare-fun contains!962 (List!1879 (_ BitVec 64)) Bool)

(assert (=> b!157265 (= e!102975 (contains!962 Nil!1876 (select (arr!2608 (_keys!4944 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!50901 () Bool)

(declare-fun res!74296 () Bool)

(declare-fun e!102976 () Bool)

(assert (=> d!50901 (=> res!74296 e!102976)))

(assert (=> d!50901 (= res!74296 (bvsge #b00000000000000000000000000000000 (size!2887 (_keys!4944 thiss!1248))))))

(assert (=> d!50901 (= (arrayNoDuplicates!0 (_keys!4944 thiss!1248) #b00000000000000000000000000000000 Nil!1876) e!102976)))

(declare-fun b!157266 () Bool)

(assert (=> b!157266 (= e!102974 call!17197)))

(declare-fun b!157267 () Bool)

(assert (=> b!157267 (= e!102976 e!102973)))

(declare-fun res!74297 () Bool)

(assert (=> b!157267 (=> (not res!74297) (not e!102973))))

(assert (=> b!157267 (= res!74297 (not e!102975))))

(declare-fun res!74295 () Bool)

(assert (=> b!157267 (=> (not res!74295) (not e!102975))))

(assert (=> b!157267 (= res!74295 (validKeyInArray!0 (select (arr!2608 (_keys!4944 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!50901 (not res!74296)) b!157267))

(assert (= (and b!157267 res!74295) b!157265))

(assert (= (and b!157267 res!74297) b!157263))

(assert (= (and b!157263 c!29672) b!157264))

(assert (= (and b!157263 (not c!29672)) b!157266))

(assert (= (or b!157264 b!157266) bm!17194))

(assert (=> bm!17194 m!190031))

(declare-fun m!190043 () Bool)

(assert (=> bm!17194 m!190043))

(assert (=> b!157263 m!190031))

(assert (=> b!157263 m!190031))

(assert (=> b!157263 m!190033))

(assert (=> b!157265 m!190031))

(assert (=> b!157265 m!190031))

(declare-fun m!190045 () Bool)

(assert (=> b!157265 m!190045))

(assert (=> b!157267 m!190031))

(assert (=> b!157267 m!190031))

(assert (=> b!157267 m!190033))

(assert (=> b!157232 d!50901))

(declare-fun b!157276 () Bool)

(declare-fun e!102981 () (_ BitVec 32))

(declare-fun call!17200 () (_ BitVec 32))

(assert (=> b!157276 (= e!102981 (bvadd #b00000000000000000000000000000001 call!17200))))

(declare-fun b!157277 () Bool)

(declare-fun e!102982 () (_ BitVec 32))

(assert (=> b!157277 (= e!102982 e!102981)))

(declare-fun c!29677 () Bool)

(assert (=> b!157277 (= c!29677 (validKeyInArray!0 (select (arr!2608 (_keys!4944 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157278 () Bool)

(assert (=> b!157278 (= e!102981 call!17200)))

(declare-fun bm!17197 () Bool)

(assert (=> bm!17197 (= call!17200 (arrayCountValidKeys!0 (_keys!4944 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2887 (_keys!4944 thiss!1248))))))

(declare-fun d!50903 () Bool)

(declare-fun lt!81555 () (_ BitVec 32))

(assert (=> d!50903 (and (bvsge lt!81555 #b00000000000000000000000000000000) (bvsle lt!81555 (bvsub (size!2887 (_keys!4944 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!50903 (= lt!81555 e!102982)))

(declare-fun c!29678 () Bool)

(assert (=> d!50903 (= c!29678 (bvsge #b00000000000000000000000000000000 (size!2887 (_keys!4944 thiss!1248))))))

(assert (=> d!50903 (and (bvsle #b00000000000000000000000000000000 (size!2887 (_keys!4944 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2887 (_keys!4944 thiss!1248)) (size!2887 (_keys!4944 thiss!1248))))))

(assert (=> d!50903 (= (arrayCountValidKeys!0 (_keys!4944 thiss!1248) #b00000000000000000000000000000000 (size!2887 (_keys!4944 thiss!1248))) lt!81555)))

(declare-fun b!157279 () Bool)

(assert (=> b!157279 (= e!102982 #b00000000000000000000000000000000)))

(assert (= (and d!50903 c!29678) b!157279))

(assert (= (and d!50903 (not c!29678)) b!157277))

(assert (= (and b!157277 c!29677) b!157276))

(assert (= (and b!157277 (not c!29677)) b!157278))

(assert (= (or b!157276 b!157278) bm!17197))

(assert (=> b!157277 m!190031))

(assert (=> b!157277 m!190031))

(assert (=> b!157277 m!190033))

(declare-fun m!190047 () Bool)

(assert (=> bm!17197 m!190047))

(assert (=> b!157230 d!50903))

(declare-fun d!50905 () Bool)

(declare-fun res!74308 () Bool)

(declare-fun e!102985 () Bool)

(assert (=> d!50905 (=> (not res!74308) (not e!102985))))

(assert (=> d!50905 (= res!74308 (validMask!0 (mask!7646 thiss!1248)))))

(assert (=> d!50905 (= (simpleValid!105 thiss!1248) e!102985)))

(declare-fun b!157288 () Bool)

(declare-fun res!74306 () Bool)

(assert (=> b!157288 (=> (not res!74306) (not e!102985))))

(assert (=> b!157288 (= res!74306 (and (= (size!2888 (_values!3153 thiss!1248)) (bvadd (mask!7646 thiss!1248) #b00000000000000000000000000000001)) (= (size!2887 (_keys!4944 thiss!1248)) (size!2888 (_values!3153 thiss!1248))) (bvsge (_size!777 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!777 thiss!1248) (bvadd (mask!7646 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!157289 () Bool)

(declare-fun res!74309 () Bool)

(assert (=> b!157289 (=> (not res!74309) (not e!102985))))

(declare-fun size!2893 (LongMapFixedSize!1456) (_ BitVec 32))

(assert (=> b!157289 (= res!74309 (bvsge (size!2893 thiss!1248) (_size!777 thiss!1248)))))

(declare-fun b!157290 () Bool)

(declare-fun res!74307 () Bool)

(assert (=> b!157290 (=> (not res!74307) (not e!102985))))

(assert (=> b!157290 (= res!74307 (= (size!2893 thiss!1248) (bvadd (_size!777 thiss!1248) (bvsdiv (bvadd (extraKeys!2911 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!157291 () Bool)

(assert (=> b!157291 (= e!102985 (and (bvsge (extraKeys!2911 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2911 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!777 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!50905 res!74308) b!157288))

(assert (= (and b!157288 res!74306) b!157289))

(assert (= (and b!157289 res!74309) b!157290))

(assert (= (and b!157290 res!74307) b!157291))

(assert (=> d!50905 m!189991))

(declare-fun m!190049 () Bool)

(assert (=> b!157289 m!190049))

(assert (=> b!157290 m!190049))

(assert (=> d!50893 d!50905))

(declare-fun condMapEmpty!5505 () Bool)

(declare-fun mapDefault!5505 () ValueCell!1274)

(assert (=> mapNonEmpty!5504 (= condMapEmpty!5505 (= mapRest!5504 ((as const (Array (_ BitVec 32) ValueCell!1274)) mapDefault!5505)))))

(declare-fun e!102987 () Bool)

(declare-fun mapRes!5505 () Bool)

(assert (=> mapNonEmpty!5504 (= tp!12839 (and e!102987 mapRes!5505))))

(declare-fun b!157293 () Bool)

(assert (=> b!157293 (= e!102987 tp_is_empty!3235)))

(declare-fun mapNonEmpty!5505 () Bool)

(declare-fun tp!12840 () Bool)

(declare-fun e!102986 () Bool)

(assert (=> mapNonEmpty!5505 (= mapRes!5505 (and tp!12840 e!102986))))

(declare-fun mapKey!5505 () (_ BitVec 32))

(declare-fun mapValue!5505 () ValueCell!1274)

(declare-fun mapRest!5505 () (Array (_ BitVec 32) ValueCell!1274))

(assert (=> mapNonEmpty!5505 (= mapRest!5504 (store mapRest!5505 mapKey!5505 mapValue!5505))))

(declare-fun mapIsEmpty!5505 () Bool)

(assert (=> mapIsEmpty!5505 mapRes!5505))

(declare-fun b!157292 () Bool)

(assert (=> b!157292 (= e!102986 tp_is_empty!3235)))

(assert (= (and mapNonEmpty!5504 condMapEmpty!5505) mapIsEmpty!5505))

(assert (= (and mapNonEmpty!5504 (not condMapEmpty!5505)) mapNonEmpty!5505))

(assert (= (and mapNonEmpty!5505 ((_ is ValueCellFull!1274) mapValue!5505)) b!157292))

(assert (= (and mapNonEmpty!5504 ((_ is ValueCellFull!1274) mapDefault!5505)) b!157293))

(declare-fun m!190051 () Bool)

(assert (=> mapNonEmpty!5505 m!190051))

(check-sat (not bm!17197) (not b!157290) (not bm!17194) (not d!50905) (not bm!17191) (not b!157277) (not mapNonEmpty!5505) (not b!157267) tp_is_empty!3235 (not b!157252) (not b!157289) (not b!157265) (not b_next!3433) (not b!157263) (not b!157249) b_and!9821)
(check-sat b_and!9821 (not b_next!3433))
