; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16012 () Bool)

(assert start!16012)

(declare-fun b!158955 () Bool)

(declare-fun b_free!3501 () Bool)

(declare-fun b_next!3501 () Bool)

(assert (=> b!158955 (= b_free!3501 (not b_next!3501))))

(declare-fun tp!13067 () Bool)

(declare-fun b_and!9915 () Bool)

(assert (=> b!158955 (= tp!13067 b_and!9915)))

(declare-fun b!158946 () Bool)

(declare-fun e!104078 () Bool)

(declare-fun tp_is_empty!3303 () Bool)

(assert (=> b!158946 (= e!104078 tp_is_empty!3303)))

(declare-fun b!158947 () Bool)

(declare-fun res!75053 () Bool)

(declare-fun e!104079 () Bool)

(assert (=> b!158947 (=> (not res!75053) (not e!104079))))

(declare-datatypes ((V!4051 0))(
  ( (V!4052 (val!1696 Int)) )
))
(declare-datatypes ((ValueCell!1308 0))(
  ( (ValueCellFull!1308 (v!3561 V!4051)) (EmptyCell!1308) )
))
(declare-datatypes ((array!5681 0))(
  ( (array!5682 (arr!2687 (Array (_ BitVec 32) (_ BitVec 64))) (size!2971 (_ BitVec 32))) )
))
(declare-datatypes ((array!5683 0))(
  ( (array!5684 (arr!2688 (Array (_ BitVec 32) ValueCell!1308)) (size!2972 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1524 0))(
  ( (LongMapFixedSize!1525 (defaultEntry!3204 Int) (mask!7740 (_ BitVec 32)) (extraKeys!2945 (_ BitVec 32)) (zeroValue!3047 V!4051) (minValue!3047 V!4051) (_size!811 (_ BitVec 32)) (_keys!5001 array!5681) (_values!3187 array!5683) (_vacant!811 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1524)

(assert (=> b!158947 (= res!75053 (and (= (size!2972 (_values!3187 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7740 thiss!1248))) (= (size!2971 (_keys!5001 thiss!1248)) (size!2972 (_values!3187 thiss!1248))) (bvsge (mask!7740 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2945 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2945 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!75050 () Bool)

(assert (=> start!16012 (=> (not res!75050) (not e!104079))))

(declare-fun valid!716 (LongMapFixedSize!1524) Bool)

(assert (=> start!16012 (= res!75050 (valid!716 thiss!1248))))

(assert (=> start!16012 e!104079))

(declare-fun e!104080 () Bool)

(assert (=> start!16012 e!104080))

(assert (=> start!16012 true))

(declare-fun b!158948 () Bool)

(declare-datatypes ((List!1894 0))(
  ( (Nil!1891) (Cons!1890 (h!2503 (_ BitVec 64)) (t!6696 List!1894)) )
))
(declare-fun arrayNoDuplicates!0 (array!5681 (_ BitVec 32) List!1894) Bool)

(assert (=> b!158948 (= e!104079 (not (arrayNoDuplicates!0 (_keys!5001 thiss!1248) #b00000000000000000000000000000000 Nil!1891)))))

(declare-fun mapNonEmpty!5636 () Bool)

(declare-fun mapRes!5636 () Bool)

(declare-fun tp!13066 () Bool)

(assert (=> mapNonEmpty!5636 (= mapRes!5636 (and tp!13066 e!104078))))

(declare-fun mapKey!5636 () (_ BitVec 32))

(declare-fun mapRest!5636 () (Array (_ BitVec 32) ValueCell!1308))

(declare-fun mapValue!5636 () ValueCell!1308)

(assert (=> mapNonEmpty!5636 (= (arr!2688 (_values!3187 thiss!1248)) (store mapRest!5636 mapKey!5636 mapValue!5636))))

(declare-fun b!158949 () Bool)

(declare-fun res!75051 () Bool)

(assert (=> b!158949 (=> (not res!75051) (not e!104079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158949 (= res!75051 (validMask!0 (mask!7740 thiss!1248)))))

(declare-fun mapIsEmpty!5636 () Bool)

(assert (=> mapIsEmpty!5636 mapRes!5636))

(declare-fun b!158950 () Bool)

(declare-fun res!75052 () Bool)

(assert (=> b!158950 (=> (not res!75052) (not e!104079))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!158950 (= res!75052 (not (= key!828 (bvneg key!828))))))

(declare-fun b!158951 () Bool)

(declare-fun e!104081 () Bool)

(assert (=> b!158951 (= e!104081 tp_is_empty!3303)))

(declare-fun b!158952 () Bool)

(declare-fun res!75048 () Bool)

(assert (=> b!158952 (=> (not res!75048) (not e!104079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5681 (_ BitVec 32)) Bool)

(assert (=> b!158952 (= res!75048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5001 thiss!1248) (mask!7740 thiss!1248)))))

(declare-fun b!158953 () Bool)

(declare-fun res!75049 () Bool)

(assert (=> b!158953 (=> (not res!75049) (not e!104079))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!303 0))(
  ( (MissingZero!303 (index!3380 (_ BitVec 32))) (Found!303 (index!3381 (_ BitVec 32))) (Intermediate!303 (undefined!1115 Bool) (index!3382 (_ BitVec 32)) (x!17551 (_ BitVec 32))) (Undefined!303) (MissingVacant!303 (index!3383 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5681 (_ BitVec 32)) SeekEntryResult!303)

(assert (=> b!158953 (= res!75049 ((_ is Undefined!303) (seekEntryOrOpen!0 key!828 (_keys!5001 thiss!1248) (mask!7740 thiss!1248))))))

(declare-fun b!158954 () Bool)

(declare-fun e!104082 () Bool)

(assert (=> b!158954 (= e!104082 (and e!104081 mapRes!5636))))

(declare-fun condMapEmpty!5636 () Bool)

(declare-fun mapDefault!5636 () ValueCell!1308)

(assert (=> b!158954 (= condMapEmpty!5636 (= (arr!2688 (_values!3187 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1308)) mapDefault!5636)))))

(declare-fun array_inv!1709 (array!5681) Bool)

(declare-fun array_inv!1710 (array!5683) Bool)

(assert (=> b!158955 (= e!104080 (and tp!13067 tp_is_empty!3303 (array_inv!1709 (_keys!5001 thiss!1248)) (array_inv!1710 (_values!3187 thiss!1248)) e!104082))))

(assert (= (and start!16012 res!75050) b!158950))

(assert (= (and b!158950 res!75052) b!158953))

(assert (= (and b!158953 res!75049) b!158949))

(assert (= (and b!158949 res!75051) b!158947))

(assert (= (and b!158947 res!75053) b!158952))

(assert (= (and b!158952 res!75048) b!158948))

(assert (= (and b!158954 condMapEmpty!5636) mapIsEmpty!5636))

(assert (= (and b!158954 (not condMapEmpty!5636)) mapNonEmpty!5636))

(assert (= (and mapNonEmpty!5636 ((_ is ValueCellFull!1308) mapValue!5636)) b!158946))

(assert (= (and b!158954 ((_ is ValueCellFull!1308) mapDefault!5636)) b!158951))

(assert (= b!158955 b!158954))

(assert (= start!16012 b!158955))

(declare-fun m!191425 () Bool)

(assert (=> b!158948 m!191425))

(declare-fun m!191427 () Bool)

(assert (=> b!158955 m!191427))

(declare-fun m!191429 () Bool)

(assert (=> b!158955 m!191429))

(declare-fun m!191431 () Bool)

(assert (=> b!158953 m!191431))

(declare-fun m!191433 () Bool)

(assert (=> start!16012 m!191433))

(declare-fun m!191435 () Bool)

(assert (=> mapNonEmpty!5636 m!191435))

(declare-fun m!191437 () Bool)

(assert (=> b!158949 m!191437))

(declare-fun m!191439 () Bool)

(assert (=> b!158952 m!191439))

(check-sat b_and!9915 (not mapNonEmpty!5636) (not b!158949) tp_is_empty!3303 (not b!158953) (not b_next!3501) (not start!16012) (not b!158952) (not b!158955) (not b!158948))
(check-sat b_and!9915 (not b_next!3501))
(get-model)

(declare-fun b!158994 () Bool)

(declare-fun e!104108 () Bool)

(declare-fun call!17275 () Bool)

(assert (=> b!158994 (= e!104108 call!17275)))

(declare-fun bm!17272 () Bool)

(assert (=> bm!17272 (= call!17275 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5001 thiss!1248) (mask!7740 thiss!1248)))))

(declare-fun b!158995 () Bool)

(declare-fun e!104107 () Bool)

(assert (=> b!158995 (= e!104107 e!104108)))

(declare-fun c!29905 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!158995 (= c!29905 (validKeyInArray!0 (select (arr!2687 (_keys!5001 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158996 () Bool)

(declare-fun e!104109 () Bool)

(assert (=> b!158996 (= e!104109 call!17275)))

(declare-fun d!51239 () Bool)

(declare-fun res!75076 () Bool)

(assert (=> d!51239 (=> res!75076 e!104107)))

(assert (=> d!51239 (= res!75076 (bvsge #b00000000000000000000000000000000 (size!2971 (_keys!5001 thiss!1248))))))

(assert (=> d!51239 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5001 thiss!1248) (mask!7740 thiss!1248)) e!104107)))

(declare-fun b!158997 () Bool)

(assert (=> b!158997 (= e!104108 e!104109)))

(declare-fun lt!81947 () (_ BitVec 64))

(assert (=> b!158997 (= lt!81947 (select (arr!2687 (_keys!5001 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4992 0))(
  ( (Unit!4993) )
))
(declare-fun lt!81949 () Unit!4992)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5681 (_ BitVec 64) (_ BitVec 32)) Unit!4992)

(assert (=> b!158997 (= lt!81949 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5001 thiss!1248) lt!81947 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158997 (arrayContainsKey!0 (_keys!5001 thiss!1248) lt!81947 #b00000000000000000000000000000000)))

(declare-fun lt!81948 () Unit!4992)

(assert (=> b!158997 (= lt!81948 lt!81949)))

(declare-fun res!75077 () Bool)

(assert (=> b!158997 (= res!75077 (= (seekEntryOrOpen!0 (select (arr!2687 (_keys!5001 thiss!1248)) #b00000000000000000000000000000000) (_keys!5001 thiss!1248) (mask!7740 thiss!1248)) (Found!303 #b00000000000000000000000000000000)))))

(assert (=> b!158997 (=> (not res!75077) (not e!104109))))

(assert (= (and d!51239 (not res!75076)) b!158995))

(assert (= (and b!158995 c!29905) b!158997))

(assert (= (and b!158995 (not c!29905)) b!158994))

(assert (= (and b!158997 res!75077) b!158996))

(assert (= (or b!158996 b!158994) bm!17272))

(declare-fun m!191457 () Bool)

(assert (=> bm!17272 m!191457))

(declare-fun m!191459 () Bool)

(assert (=> b!158995 m!191459))

(assert (=> b!158995 m!191459))

(declare-fun m!191461 () Bool)

(assert (=> b!158995 m!191461))

(assert (=> b!158997 m!191459))

(declare-fun m!191463 () Bool)

(assert (=> b!158997 m!191463))

(declare-fun m!191465 () Bool)

(assert (=> b!158997 m!191465))

(assert (=> b!158997 m!191459))

(declare-fun m!191467 () Bool)

(assert (=> b!158997 m!191467))

(assert (=> b!158952 d!51239))

(declare-fun d!51241 () Bool)

(assert (=> d!51241 (= (validMask!0 (mask!7740 thiss!1248)) (and (or (= (mask!7740 thiss!1248) #b00000000000000000000000000000111) (= (mask!7740 thiss!1248) #b00000000000000000000000000001111) (= (mask!7740 thiss!1248) #b00000000000000000000000000011111) (= (mask!7740 thiss!1248) #b00000000000000000000000000111111) (= (mask!7740 thiss!1248) #b00000000000000000000000001111111) (= (mask!7740 thiss!1248) #b00000000000000000000000011111111) (= (mask!7740 thiss!1248) #b00000000000000000000000111111111) (= (mask!7740 thiss!1248) #b00000000000000000000001111111111) (= (mask!7740 thiss!1248) #b00000000000000000000011111111111) (= (mask!7740 thiss!1248) #b00000000000000000000111111111111) (= (mask!7740 thiss!1248) #b00000000000000000001111111111111) (= (mask!7740 thiss!1248) #b00000000000000000011111111111111) (= (mask!7740 thiss!1248) #b00000000000000000111111111111111) (= (mask!7740 thiss!1248) #b00000000000000001111111111111111) (= (mask!7740 thiss!1248) #b00000000000000011111111111111111) (= (mask!7740 thiss!1248) #b00000000000000111111111111111111) (= (mask!7740 thiss!1248) #b00000000000001111111111111111111) (= (mask!7740 thiss!1248) #b00000000000011111111111111111111) (= (mask!7740 thiss!1248) #b00000000000111111111111111111111) (= (mask!7740 thiss!1248) #b00000000001111111111111111111111) (= (mask!7740 thiss!1248) #b00000000011111111111111111111111) (= (mask!7740 thiss!1248) #b00000000111111111111111111111111) (= (mask!7740 thiss!1248) #b00000001111111111111111111111111) (= (mask!7740 thiss!1248) #b00000011111111111111111111111111) (= (mask!7740 thiss!1248) #b00000111111111111111111111111111) (= (mask!7740 thiss!1248) #b00001111111111111111111111111111) (= (mask!7740 thiss!1248) #b00011111111111111111111111111111) (= (mask!7740 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7740 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158949 d!51241))

(declare-fun d!51243 () Bool)

(declare-fun res!75084 () Bool)

(declare-fun e!104112 () Bool)

(assert (=> d!51243 (=> (not res!75084) (not e!104112))))

(declare-fun simpleValid!116 (LongMapFixedSize!1524) Bool)

(assert (=> d!51243 (= res!75084 (simpleValid!116 thiss!1248))))

(assert (=> d!51243 (= (valid!716 thiss!1248) e!104112)))

(declare-fun b!159004 () Bool)

(declare-fun res!75085 () Bool)

(assert (=> b!159004 (=> (not res!75085) (not e!104112))))

(declare-fun arrayCountValidKeys!0 (array!5681 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!159004 (= res!75085 (= (arrayCountValidKeys!0 (_keys!5001 thiss!1248) #b00000000000000000000000000000000 (size!2971 (_keys!5001 thiss!1248))) (_size!811 thiss!1248)))))

(declare-fun b!159005 () Bool)

(declare-fun res!75086 () Bool)

(assert (=> b!159005 (=> (not res!75086) (not e!104112))))

(assert (=> b!159005 (= res!75086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5001 thiss!1248) (mask!7740 thiss!1248)))))

(declare-fun b!159006 () Bool)

(assert (=> b!159006 (= e!104112 (arrayNoDuplicates!0 (_keys!5001 thiss!1248) #b00000000000000000000000000000000 Nil!1891))))

(assert (= (and d!51243 res!75084) b!159004))

(assert (= (and b!159004 res!75085) b!159005))

(assert (= (and b!159005 res!75086) b!159006))

(declare-fun m!191469 () Bool)

(assert (=> d!51243 m!191469))

(declare-fun m!191471 () Bool)

(assert (=> b!159004 m!191471))

(assert (=> b!159005 m!191439))

(assert (=> b!159006 m!191425))

(assert (=> start!16012 d!51243))

(declare-fun d!51245 () Bool)

(declare-fun lt!81956 () SeekEntryResult!303)

(assert (=> d!51245 (and (or ((_ is Undefined!303) lt!81956) (not ((_ is Found!303) lt!81956)) (and (bvsge (index!3381 lt!81956) #b00000000000000000000000000000000) (bvslt (index!3381 lt!81956) (size!2971 (_keys!5001 thiss!1248))))) (or ((_ is Undefined!303) lt!81956) ((_ is Found!303) lt!81956) (not ((_ is MissingZero!303) lt!81956)) (and (bvsge (index!3380 lt!81956) #b00000000000000000000000000000000) (bvslt (index!3380 lt!81956) (size!2971 (_keys!5001 thiss!1248))))) (or ((_ is Undefined!303) lt!81956) ((_ is Found!303) lt!81956) ((_ is MissingZero!303) lt!81956) (not ((_ is MissingVacant!303) lt!81956)) (and (bvsge (index!3383 lt!81956) #b00000000000000000000000000000000) (bvslt (index!3383 lt!81956) (size!2971 (_keys!5001 thiss!1248))))) (or ((_ is Undefined!303) lt!81956) (ite ((_ is Found!303) lt!81956) (= (select (arr!2687 (_keys!5001 thiss!1248)) (index!3381 lt!81956)) key!828) (ite ((_ is MissingZero!303) lt!81956) (= (select (arr!2687 (_keys!5001 thiss!1248)) (index!3380 lt!81956)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!303) lt!81956) (= (select (arr!2687 (_keys!5001 thiss!1248)) (index!3383 lt!81956)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!104119 () SeekEntryResult!303)

(assert (=> d!51245 (= lt!81956 e!104119)))

(declare-fun c!29914 () Bool)

(declare-fun lt!81958 () SeekEntryResult!303)

(assert (=> d!51245 (= c!29914 (and ((_ is Intermediate!303) lt!81958) (undefined!1115 lt!81958)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5681 (_ BitVec 32)) SeekEntryResult!303)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51245 (= lt!81958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7740 thiss!1248)) key!828 (_keys!5001 thiss!1248) (mask!7740 thiss!1248)))))

(assert (=> d!51245 (validMask!0 (mask!7740 thiss!1248))))

(assert (=> d!51245 (= (seekEntryOrOpen!0 key!828 (_keys!5001 thiss!1248) (mask!7740 thiss!1248)) lt!81956)))

(declare-fun e!104120 () SeekEntryResult!303)

(declare-fun b!159019 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5681 (_ BitVec 32)) SeekEntryResult!303)

(assert (=> b!159019 (= e!104120 (seekKeyOrZeroReturnVacant!0 (x!17551 lt!81958) (index!3382 lt!81958) (index!3382 lt!81958) key!828 (_keys!5001 thiss!1248) (mask!7740 thiss!1248)))))

(declare-fun b!159020 () Bool)

(declare-fun e!104121 () SeekEntryResult!303)

(assert (=> b!159020 (= e!104119 e!104121)))

(declare-fun lt!81957 () (_ BitVec 64))

(assert (=> b!159020 (= lt!81957 (select (arr!2687 (_keys!5001 thiss!1248)) (index!3382 lt!81958)))))

(declare-fun c!29913 () Bool)

(assert (=> b!159020 (= c!29913 (= lt!81957 key!828))))

(declare-fun b!159021 () Bool)

(assert (=> b!159021 (= e!104121 (Found!303 (index!3382 lt!81958)))))

(declare-fun b!159022 () Bool)

(assert (=> b!159022 (= e!104120 (MissingZero!303 (index!3382 lt!81958)))))

(declare-fun b!159023 () Bool)

(assert (=> b!159023 (= e!104119 Undefined!303)))

(declare-fun b!159024 () Bool)

(declare-fun c!29912 () Bool)

(assert (=> b!159024 (= c!29912 (= lt!81957 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!159024 (= e!104121 e!104120)))

(assert (= (and d!51245 c!29914) b!159023))

(assert (= (and d!51245 (not c!29914)) b!159020))

(assert (= (and b!159020 c!29913) b!159021))

(assert (= (and b!159020 (not c!29913)) b!159024))

(assert (= (and b!159024 c!29912) b!159022))

(assert (= (and b!159024 (not c!29912)) b!159019))

(declare-fun m!191473 () Bool)

(assert (=> d!51245 m!191473))

(declare-fun m!191475 () Bool)

(assert (=> d!51245 m!191475))

(declare-fun m!191477 () Bool)

(assert (=> d!51245 m!191477))

(declare-fun m!191479 () Bool)

(assert (=> d!51245 m!191479))

(assert (=> d!51245 m!191437))

(assert (=> d!51245 m!191477))

(declare-fun m!191481 () Bool)

(assert (=> d!51245 m!191481))

(declare-fun m!191483 () Bool)

(assert (=> b!159019 m!191483))

(declare-fun m!191485 () Bool)

(assert (=> b!159020 m!191485))

(assert (=> b!158953 d!51245))

(declare-fun d!51247 () Bool)

(assert (=> d!51247 (= (array_inv!1709 (_keys!5001 thiss!1248)) (bvsge (size!2971 (_keys!5001 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158955 d!51247))

(declare-fun d!51249 () Bool)

(assert (=> d!51249 (= (array_inv!1710 (_values!3187 thiss!1248)) (bvsge (size!2972 (_values!3187 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158955 d!51249))

(declare-fun b!159035 () Bool)

(declare-fun e!104132 () Bool)

(declare-fun e!104133 () Bool)

(assert (=> b!159035 (= e!104132 e!104133)))

(declare-fun c!29917 () Bool)

(assert (=> b!159035 (= c!29917 (validKeyInArray!0 (select (arr!2687 (_keys!5001 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51251 () Bool)

(declare-fun res!75094 () Bool)

(declare-fun e!104131 () Bool)

(assert (=> d!51251 (=> res!75094 e!104131)))

(assert (=> d!51251 (= res!75094 (bvsge #b00000000000000000000000000000000 (size!2971 (_keys!5001 thiss!1248))))))

(assert (=> d!51251 (= (arrayNoDuplicates!0 (_keys!5001 thiss!1248) #b00000000000000000000000000000000 Nil!1891) e!104131)))

(declare-fun b!159036 () Bool)

(assert (=> b!159036 (= e!104131 e!104132)))

(declare-fun res!75093 () Bool)

(assert (=> b!159036 (=> (not res!75093) (not e!104132))))

(declare-fun e!104130 () Bool)

(assert (=> b!159036 (= res!75093 (not e!104130))))

(declare-fun res!75095 () Bool)

(assert (=> b!159036 (=> (not res!75095) (not e!104130))))

(assert (=> b!159036 (= res!75095 (validKeyInArray!0 (select (arr!2687 (_keys!5001 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!159037 () Bool)

(declare-fun contains!983 (List!1894 (_ BitVec 64)) Bool)

(assert (=> b!159037 (= e!104130 (contains!983 Nil!1891 (select (arr!2687 (_keys!5001 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17275 () Bool)

(declare-fun call!17278 () Bool)

(assert (=> bm!17275 (= call!17278 (arrayNoDuplicates!0 (_keys!5001 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29917 (Cons!1890 (select (arr!2687 (_keys!5001 thiss!1248)) #b00000000000000000000000000000000) Nil!1891) Nil!1891)))))

(declare-fun b!159038 () Bool)

(assert (=> b!159038 (= e!104133 call!17278)))

(declare-fun b!159039 () Bool)

(assert (=> b!159039 (= e!104133 call!17278)))

(assert (= (and d!51251 (not res!75094)) b!159036))

(assert (= (and b!159036 res!75095) b!159037))

(assert (= (and b!159036 res!75093) b!159035))

(assert (= (and b!159035 c!29917) b!159038))

(assert (= (and b!159035 (not c!29917)) b!159039))

(assert (= (or b!159038 b!159039) bm!17275))

(assert (=> b!159035 m!191459))

(assert (=> b!159035 m!191459))

(assert (=> b!159035 m!191461))

(assert (=> b!159036 m!191459))

(assert (=> b!159036 m!191459))

(assert (=> b!159036 m!191461))

(assert (=> b!159037 m!191459))

(assert (=> b!159037 m!191459))

(declare-fun m!191487 () Bool)

(assert (=> b!159037 m!191487))

(assert (=> bm!17275 m!191459))

(declare-fun m!191489 () Bool)

(assert (=> bm!17275 m!191489))

(assert (=> b!158948 d!51251))

(declare-fun mapNonEmpty!5642 () Bool)

(declare-fun mapRes!5642 () Bool)

(declare-fun tp!13076 () Bool)

(declare-fun e!104138 () Bool)

(assert (=> mapNonEmpty!5642 (= mapRes!5642 (and tp!13076 e!104138))))

(declare-fun mapRest!5642 () (Array (_ BitVec 32) ValueCell!1308))

(declare-fun mapValue!5642 () ValueCell!1308)

(declare-fun mapKey!5642 () (_ BitVec 32))

(assert (=> mapNonEmpty!5642 (= mapRest!5636 (store mapRest!5642 mapKey!5642 mapValue!5642))))

(declare-fun mapIsEmpty!5642 () Bool)

(assert (=> mapIsEmpty!5642 mapRes!5642))

(declare-fun condMapEmpty!5642 () Bool)

(declare-fun mapDefault!5642 () ValueCell!1308)

(assert (=> mapNonEmpty!5636 (= condMapEmpty!5642 (= mapRest!5636 ((as const (Array (_ BitVec 32) ValueCell!1308)) mapDefault!5642)))))

(declare-fun e!104139 () Bool)

(assert (=> mapNonEmpty!5636 (= tp!13066 (and e!104139 mapRes!5642))))

(declare-fun b!159046 () Bool)

(assert (=> b!159046 (= e!104138 tp_is_empty!3303)))

(declare-fun b!159047 () Bool)

(assert (=> b!159047 (= e!104139 tp_is_empty!3303)))

(assert (= (and mapNonEmpty!5636 condMapEmpty!5642) mapIsEmpty!5642))

(assert (= (and mapNonEmpty!5636 (not condMapEmpty!5642)) mapNonEmpty!5642))

(assert (= (and mapNonEmpty!5642 ((_ is ValueCellFull!1308) mapValue!5642)) b!159046))

(assert (= (and mapNonEmpty!5636 ((_ is ValueCellFull!1308) mapDefault!5642)) b!159047))

(declare-fun m!191491 () Bool)

(assert (=> mapNonEmpty!5642 m!191491))

(check-sat (not b_next!3501) (not d!51245) (not b!159019) (not bm!17272) tp_is_empty!3303 (not b!159035) (not bm!17275) (not d!51243) (not mapNonEmpty!5642) (not b!159005) (not b!159004) (not b!159036) (not b!159006) (not b!158995) b_and!9915 (not b!159037) (not b!158997))
(check-sat b_and!9915 (not b_next!3501))
