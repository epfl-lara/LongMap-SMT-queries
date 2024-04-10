; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18016 () Bool)

(assert start!18016)

(declare-fun b!179400 () Bool)

(declare-fun b_free!4425 () Bool)

(declare-fun b_next!4425 () Bool)

(assert (=> b!179400 (= b_free!4425 (not b_next!4425))))

(declare-fun tp!16000 () Bool)

(declare-fun b_and!10955 () Bool)

(assert (=> b!179400 (= tp!16000 b_and!10955)))

(declare-fun b!179397 () Bool)

(declare-fun res!84971 () Bool)

(declare-fun e!118188 () Bool)

(assert (=> b!179397 (=> (not res!84971) (not e!118188))))

(declare-datatypes ((V!5243 0))(
  ( (V!5244 (val!2143 Int)) )
))
(declare-datatypes ((ValueCell!1755 0))(
  ( (ValueCellFull!1755 (v!4030 V!5243)) (EmptyCell!1755) )
))
(declare-datatypes ((array!7559 0))(
  ( (array!7560 (arr!3581 (Array (_ BitVec 32) (_ BitVec 64))) (size!3889 (_ BitVec 32))) )
))
(declare-datatypes ((array!7561 0))(
  ( (array!7562 (arr!3582 (Array (_ BitVec 32) ValueCell!1755)) (size!3890 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2418 0))(
  ( (LongMapFixedSize!2419 (defaultEntry!3683 Int) (mask!8664 (_ BitVec 32)) (extraKeys!3420 (_ BitVec 32)) (zeroValue!3524 V!5243) (minValue!3524 V!5243) (_size!1258 (_ BitVec 32)) (_keys!5570 array!7559) (_values!3666 array!7561) (_vacant!1258 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2418)

(assert (=> b!179397 (= res!84971 (and (= (size!3890 (_values!3666 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8664 thiss!1248))) (= (size!3889 (_keys!5570 thiss!1248)) (size!3890 (_values!3666 thiss!1248))) (bvsge (mask!8664 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3420 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3420 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!179398 () Bool)

(declare-fun res!84969 () Bool)

(assert (=> b!179398 (=> (not res!84969) (not e!118188))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3332 0))(
  ( (tuple2!3333 (_1!1677 (_ BitVec 64)) (_2!1677 V!5243)) )
))
(declare-datatypes ((List!2275 0))(
  ( (Nil!2272) (Cons!2271 (h!2896 tuple2!3332) (t!7119 List!2275)) )
))
(declare-datatypes ((ListLongMap!2259 0))(
  ( (ListLongMap!2260 (toList!1145 List!2275)) )
))
(declare-fun contains!1219 (ListLongMap!2259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!797 (array!7559 array!7561 (_ BitVec 32) (_ BitVec 32) V!5243 V!5243 (_ BitVec 32) Int) ListLongMap!2259)

(assert (=> b!179398 (= res!84969 (not (contains!1219 (getCurrentListMap!797 (_keys!5570 thiss!1248) (_values!3666 thiss!1248) (mask!8664 thiss!1248) (extraKeys!3420 thiss!1248) (zeroValue!3524 thiss!1248) (minValue!3524 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3683 thiss!1248)) key!828)))))

(declare-fun b!179399 () Bool)

(declare-fun e!118192 () Bool)

(declare-fun tp_is_empty!4197 () Bool)

(assert (=> b!179399 (= e!118192 tp_is_empty!4197)))

(declare-fun e!118189 () Bool)

(declare-fun e!118190 () Bool)

(declare-fun array_inv!2307 (array!7559) Bool)

(declare-fun array_inv!2308 (array!7561) Bool)

(assert (=> b!179400 (= e!118189 (and tp!16000 tp_is_empty!4197 (array_inv!2307 (_keys!5570 thiss!1248)) (array_inv!2308 (_values!3666 thiss!1248)) e!118190))))

(declare-fun mapNonEmpty!7183 () Bool)

(declare-fun mapRes!7183 () Bool)

(declare-fun tp!15999 () Bool)

(assert (=> mapNonEmpty!7183 (= mapRes!7183 (and tp!15999 e!118192))))

(declare-fun mapRest!7183 () (Array (_ BitVec 32) ValueCell!1755))

(declare-fun mapValue!7183 () ValueCell!1755)

(declare-fun mapKey!7183 () (_ BitVec 32))

(assert (=> mapNonEmpty!7183 (= (arr!3582 (_values!3666 thiss!1248)) (store mapRest!7183 mapKey!7183 mapValue!7183))))

(declare-fun b!179401 () Bool)

(declare-fun res!84968 () Bool)

(assert (=> b!179401 (=> (not res!84968) (not e!118188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179401 (= res!84968 (validMask!0 (mask!8664 thiss!1248)))))

(declare-fun b!179402 () Bool)

(declare-fun res!84967 () Bool)

(assert (=> b!179402 (=> (not res!84967) (not e!118188))))

(assert (=> b!179402 (= res!84967 (not (= key!828 (bvneg key!828))))))

(declare-fun b!179403 () Bool)

(declare-fun res!84970 () Bool)

(assert (=> b!179403 (=> (not res!84970) (not e!118188))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!582 0))(
  ( (MissingZero!582 (index!4496 (_ BitVec 32))) (Found!582 (index!4497 (_ BitVec 32))) (Intermediate!582 (undefined!1394 Bool) (index!4498 (_ BitVec 32)) (x!19620 (_ BitVec 32))) (Undefined!582) (MissingVacant!582 (index!4499 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7559 (_ BitVec 32)) SeekEntryResult!582)

(assert (=> b!179403 (= res!84970 ((_ is Undefined!582) (seekEntryOrOpen!0 key!828 (_keys!5570 thiss!1248) (mask!8664 thiss!1248))))))

(declare-fun mapIsEmpty!7183 () Bool)

(assert (=> mapIsEmpty!7183 mapRes!7183))

(declare-fun res!84972 () Bool)

(assert (=> start!18016 (=> (not res!84972) (not e!118188))))

(declare-fun valid!1011 (LongMapFixedSize!2418) Bool)

(assert (=> start!18016 (= res!84972 (valid!1011 thiss!1248))))

(assert (=> start!18016 e!118188))

(assert (=> start!18016 e!118189))

(assert (=> start!18016 true))

(declare-fun b!179404 () Bool)

(declare-datatypes ((List!2276 0))(
  ( (Nil!2273) (Cons!2272 (h!2897 (_ BitVec 64)) (t!7120 List!2276)) )
))
(declare-fun arrayNoDuplicates!0 (array!7559 (_ BitVec 32) List!2276) Bool)

(assert (=> b!179404 (= e!118188 (not (arrayNoDuplicates!0 (_keys!5570 thiss!1248) #b00000000000000000000000000000000 Nil!2273)))))

(declare-fun b!179405 () Bool)

(declare-fun e!118187 () Bool)

(assert (=> b!179405 (= e!118187 tp_is_empty!4197)))

(declare-fun b!179406 () Bool)

(assert (=> b!179406 (= e!118190 (and e!118187 mapRes!7183))))

(declare-fun condMapEmpty!7183 () Bool)

(declare-fun mapDefault!7183 () ValueCell!1755)

(assert (=> b!179406 (= condMapEmpty!7183 (= (arr!3582 (_values!3666 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1755)) mapDefault!7183)))))

(declare-fun b!179407 () Bool)

(declare-fun res!84973 () Bool)

(assert (=> b!179407 (=> (not res!84973) (not e!118188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7559 (_ BitVec 32)) Bool)

(assert (=> b!179407 (= res!84973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5570 thiss!1248) (mask!8664 thiss!1248)))))

(assert (= (and start!18016 res!84972) b!179402))

(assert (= (and b!179402 res!84967) b!179403))

(assert (= (and b!179403 res!84970) b!179398))

(assert (= (and b!179398 res!84969) b!179401))

(assert (= (and b!179401 res!84968) b!179397))

(assert (= (and b!179397 res!84971) b!179407))

(assert (= (and b!179407 res!84973) b!179404))

(assert (= (and b!179406 condMapEmpty!7183) mapIsEmpty!7183))

(assert (= (and b!179406 (not condMapEmpty!7183)) mapNonEmpty!7183))

(assert (= (and mapNonEmpty!7183 ((_ is ValueCellFull!1755) mapValue!7183)) b!179399))

(assert (= (and b!179406 ((_ is ValueCellFull!1755) mapDefault!7183)) b!179405))

(assert (= b!179400 b!179406))

(assert (= start!18016 b!179400))

(declare-fun m!207663 () Bool)

(assert (=> b!179407 m!207663))

(declare-fun m!207665 () Bool)

(assert (=> b!179398 m!207665))

(assert (=> b!179398 m!207665))

(declare-fun m!207667 () Bool)

(assert (=> b!179398 m!207667))

(declare-fun m!207669 () Bool)

(assert (=> mapNonEmpty!7183 m!207669))

(declare-fun m!207671 () Bool)

(assert (=> b!179400 m!207671))

(declare-fun m!207673 () Bool)

(assert (=> b!179400 m!207673))

(declare-fun m!207675 () Bool)

(assert (=> b!179404 m!207675))

(declare-fun m!207677 () Bool)

(assert (=> b!179403 m!207677))

(declare-fun m!207679 () Bool)

(assert (=> start!18016 m!207679))

(declare-fun m!207681 () Bool)

(assert (=> b!179401 m!207681))

(check-sat (not b!179403) tp_is_empty!4197 (not b!179400) (not start!18016) (not b!179404) (not b!179401) b_and!10955 (not b!179398) (not b!179407) (not b_next!4425) (not mapNonEmpty!7183))
(check-sat b_and!10955 (not b_next!4425))
(get-model)

(declare-fun d!54143 () Bool)

(declare-fun res!85001 () Bool)

(declare-fun e!118213 () Bool)

(assert (=> d!54143 (=> (not res!85001) (not e!118213))))

(declare-fun simpleValid!161 (LongMapFixedSize!2418) Bool)

(assert (=> d!54143 (= res!85001 (simpleValid!161 thiss!1248))))

(assert (=> d!54143 (= (valid!1011 thiss!1248) e!118213)))

(declare-fun b!179447 () Bool)

(declare-fun res!85002 () Bool)

(assert (=> b!179447 (=> (not res!85002) (not e!118213))))

(declare-fun arrayCountValidKeys!0 (array!7559 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!179447 (= res!85002 (= (arrayCountValidKeys!0 (_keys!5570 thiss!1248) #b00000000000000000000000000000000 (size!3889 (_keys!5570 thiss!1248))) (_size!1258 thiss!1248)))))

(declare-fun b!179448 () Bool)

(declare-fun res!85003 () Bool)

(assert (=> b!179448 (=> (not res!85003) (not e!118213))))

(assert (=> b!179448 (= res!85003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5570 thiss!1248) (mask!8664 thiss!1248)))))

(declare-fun b!179449 () Bool)

(assert (=> b!179449 (= e!118213 (arrayNoDuplicates!0 (_keys!5570 thiss!1248) #b00000000000000000000000000000000 Nil!2273))))

(assert (= (and d!54143 res!85001) b!179447))

(assert (= (and b!179447 res!85002) b!179448))

(assert (= (and b!179448 res!85003) b!179449))

(declare-fun m!207703 () Bool)

(assert (=> d!54143 m!207703))

(declare-fun m!207705 () Bool)

(assert (=> b!179447 m!207705))

(assert (=> b!179448 m!207663))

(assert (=> b!179449 m!207675))

(assert (=> start!18016 d!54143))

(declare-fun bm!18121 () Bool)

(declare-fun call!18124 () Bool)

(declare-fun c!32168 () Bool)

(assert (=> bm!18121 (= call!18124 (arrayNoDuplicates!0 (_keys!5570 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32168 (Cons!2272 (select (arr!3581 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000) Nil!2273) Nil!2273)))))

(declare-fun b!179460 () Bool)

(declare-fun e!118225 () Bool)

(declare-fun contains!1221 (List!2276 (_ BitVec 64)) Bool)

(assert (=> b!179460 (= e!118225 (contains!1221 Nil!2273 (select (arr!3581 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179461 () Bool)

(declare-fun e!118224 () Bool)

(assert (=> b!179461 (= e!118224 call!18124)))

(declare-fun b!179462 () Bool)

(declare-fun e!118222 () Bool)

(assert (=> b!179462 (= e!118222 e!118224)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!179462 (= c!32168 (validKeyInArray!0 (select (arr!3581 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54145 () Bool)

(declare-fun res!85011 () Bool)

(declare-fun e!118223 () Bool)

(assert (=> d!54145 (=> res!85011 e!118223)))

(assert (=> d!54145 (= res!85011 (bvsge #b00000000000000000000000000000000 (size!3889 (_keys!5570 thiss!1248))))))

(assert (=> d!54145 (= (arrayNoDuplicates!0 (_keys!5570 thiss!1248) #b00000000000000000000000000000000 Nil!2273) e!118223)))

(declare-fun b!179463 () Bool)

(assert (=> b!179463 (= e!118223 e!118222)))

(declare-fun res!85010 () Bool)

(assert (=> b!179463 (=> (not res!85010) (not e!118222))))

(assert (=> b!179463 (= res!85010 (not e!118225))))

(declare-fun res!85012 () Bool)

(assert (=> b!179463 (=> (not res!85012) (not e!118225))))

(assert (=> b!179463 (= res!85012 (validKeyInArray!0 (select (arr!3581 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179464 () Bool)

(assert (=> b!179464 (= e!118224 call!18124)))

(assert (= (and d!54145 (not res!85011)) b!179463))

(assert (= (and b!179463 res!85012) b!179460))

(assert (= (and b!179463 res!85010) b!179462))

(assert (= (and b!179462 c!32168) b!179461))

(assert (= (and b!179462 (not c!32168)) b!179464))

(assert (= (or b!179461 b!179464) bm!18121))

(declare-fun m!207707 () Bool)

(assert (=> bm!18121 m!207707))

(declare-fun m!207709 () Bool)

(assert (=> bm!18121 m!207709))

(assert (=> b!179460 m!207707))

(assert (=> b!179460 m!207707))

(declare-fun m!207711 () Bool)

(assert (=> b!179460 m!207711))

(assert (=> b!179462 m!207707))

(assert (=> b!179462 m!207707))

(declare-fun m!207713 () Bool)

(assert (=> b!179462 m!207713))

(assert (=> b!179463 m!207707))

(assert (=> b!179463 m!207707))

(assert (=> b!179463 m!207713))

(assert (=> b!179404 d!54145))

(declare-fun d!54147 () Bool)

(assert (=> d!54147 (= (array_inv!2307 (_keys!5570 thiss!1248)) (bvsge (size!3889 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179400 d!54147))

(declare-fun d!54149 () Bool)

(assert (=> d!54149 (= (array_inv!2308 (_values!3666 thiss!1248)) (bvsge (size!3890 (_values!3666 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179400 d!54149))

(declare-fun b!179477 () Bool)

(declare-fun e!118232 () SeekEntryResult!582)

(assert (=> b!179477 (= e!118232 Undefined!582)))

(declare-fun b!179478 () Bool)

(declare-fun c!32175 () Bool)

(declare-fun lt!88650 () (_ BitVec 64))

(assert (=> b!179478 (= c!32175 (= lt!88650 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118233 () SeekEntryResult!582)

(declare-fun e!118234 () SeekEntryResult!582)

(assert (=> b!179478 (= e!118233 e!118234)))

(declare-fun b!179479 () Bool)

(assert (=> b!179479 (= e!118232 e!118233)))

(declare-fun lt!88651 () SeekEntryResult!582)

(assert (=> b!179479 (= lt!88650 (select (arr!3581 (_keys!5570 thiss!1248)) (index!4498 lt!88651)))))

(declare-fun c!32176 () Bool)

(assert (=> b!179479 (= c!32176 (= lt!88650 key!828))))

(declare-fun b!179480 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7559 (_ BitVec 32)) SeekEntryResult!582)

(assert (=> b!179480 (= e!118234 (seekKeyOrZeroReturnVacant!0 (x!19620 lt!88651) (index!4498 lt!88651) (index!4498 lt!88651) key!828 (_keys!5570 thiss!1248) (mask!8664 thiss!1248)))))

(declare-fun b!179481 () Bool)

(assert (=> b!179481 (= e!118233 (Found!582 (index!4498 lt!88651)))))

(declare-fun d!54151 () Bool)

(declare-fun lt!88652 () SeekEntryResult!582)

(assert (=> d!54151 (and (or ((_ is Undefined!582) lt!88652) (not ((_ is Found!582) lt!88652)) (and (bvsge (index!4497 lt!88652) #b00000000000000000000000000000000) (bvslt (index!4497 lt!88652) (size!3889 (_keys!5570 thiss!1248))))) (or ((_ is Undefined!582) lt!88652) ((_ is Found!582) lt!88652) (not ((_ is MissingZero!582) lt!88652)) (and (bvsge (index!4496 lt!88652) #b00000000000000000000000000000000) (bvslt (index!4496 lt!88652) (size!3889 (_keys!5570 thiss!1248))))) (or ((_ is Undefined!582) lt!88652) ((_ is Found!582) lt!88652) ((_ is MissingZero!582) lt!88652) (not ((_ is MissingVacant!582) lt!88652)) (and (bvsge (index!4499 lt!88652) #b00000000000000000000000000000000) (bvslt (index!4499 lt!88652) (size!3889 (_keys!5570 thiss!1248))))) (or ((_ is Undefined!582) lt!88652) (ite ((_ is Found!582) lt!88652) (= (select (arr!3581 (_keys!5570 thiss!1248)) (index!4497 lt!88652)) key!828) (ite ((_ is MissingZero!582) lt!88652) (= (select (arr!3581 (_keys!5570 thiss!1248)) (index!4496 lt!88652)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!582) lt!88652) (= (select (arr!3581 (_keys!5570 thiss!1248)) (index!4499 lt!88652)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54151 (= lt!88652 e!118232)))

(declare-fun c!32177 () Bool)

(assert (=> d!54151 (= c!32177 (and ((_ is Intermediate!582) lt!88651) (undefined!1394 lt!88651)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7559 (_ BitVec 32)) SeekEntryResult!582)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54151 (= lt!88651 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8664 thiss!1248)) key!828 (_keys!5570 thiss!1248) (mask!8664 thiss!1248)))))

(assert (=> d!54151 (validMask!0 (mask!8664 thiss!1248))))

(assert (=> d!54151 (= (seekEntryOrOpen!0 key!828 (_keys!5570 thiss!1248) (mask!8664 thiss!1248)) lt!88652)))

(declare-fun b!179482 () Bool)

(assert (=> b!179482 (= e!118234 (MissingZero!582 (index!4498 lt!88651)))))

(assert (= (and d!54151 c!32177) b!179477))

(assert (= (and d!54151 (not c!32177)) b!179479))

(assert (= (and b!179479 c!32176) b!179481))

(assert (= (and b!179479 (not c!32176)) b!179478))

(assert (= (and b!179478 c!32175) b!179482))

(assert (= (and b!179478 (not c!32175)) b!179480))

(declare-fun m!207715 () Bool)

(assert (=> b!179479 m!207715))

(declare-fun m!207717 () Bool)

(assert (=> b!179480 m!207717))

(declare-fun m!207719 () Bool)

(assert (=> d!54151 m!207719))

(declare-fun m!207721 () Bool)

(assert (=> d!54151 m!207721))

(declare-fun m!207723 () Bool)

(assert (=> d!54151 m!207723))

(declare-fun m!207725 () Bool)

(assert (=> d!54151 m!207725))

(assert (=> d!54151 m!207719))

(assert (=> d!54151 m!207681))

(declare-fun m!207727 () Bool)

(assert (=> d!54151 m!207727))

(assert (=> b!179403 d!54151))

(declare-fun b!179491 () Bool)

(declare-fun e!118243 () Bool)

(declare-fun call!18127 () Bool)

(assert (=> b!179491 (= e!118243 call!18127)))

(declare-fun d!54153 () Bool)

(declare-fun res!85018 () Bool)

(declare-fun e!118241 () Bool)

(assert (=> d!54153 (=> res!85018 e!118241)))

(assert (=> d!54153 (= res!85018 (bvsge #b00000000000000000000000000000000 (size!3889 (_keys!5570 thiss!1248))))))

(assert (=> d!54153 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5570 thiss!1248) (mask!8664 thiss!1248)) e!118241)))

(declare-fun bm!18124 () Bool)

(assert (=> bm!18124 (= call!18127 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5570 thiss!1248) (mask!8664 thiss!1248)))))

(declare-fun b!179492 () Bool)

(assert (=> b!179492 (= e!118241 e!118243)))

(declare-fun c!32180 () Bool)

(assert (=> b!179492 (= c!32180 (validKeyInArray!0 (select (arr!3581 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179493 () Bool)

(declare-fun e!118242 () Bool)

(assert (=> b!179493 (= e!118242 call!18127)))

(declare-fun b!179494 () Bool)

(assert (=> b!179494 (= e!118243 e!118242)))

(declare-fun lt!88660 () (_ BitVec 64))

(assert (=> b!179494 (= lt!88660 (select (arr!3581 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5464 0))(
  ( (Unit!5465) )
))
(declare-fun lt!88661 () Unit!5464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7559 (_ BitVec 64) (_ BitVec 32)) Unit!5464)

(assert (=> b!179494 (= lt!88661 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5570 thiss!1248) lt!88660 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!179494 (arrayContainsKey!0 (_keys!5570 thiss!1248) lt!88660 #b00000000000000000000000000000000)))

(declare-fun lt!88659 () Unit!5464)

(assert (=> b!179494 (= lt!88659 lt!88661)))

(declare-fun res!85017 () Bool)

(assert (=> b!179494 (= res!85017 (= (seekEntryOrOpen!0 (select (arr!3581 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000) (_keys!5570 thiss!1248) (mask!8664 thiss!1248)) (Found!582 #b00000000000000000000000000000000)))))

(assert (=> b!179494 (=> (not res!85017) (not e!118242))))

(assert (= (and d!54153 (not res!85018)) b!179492))

(assert (= (and b!179492 c!32180) b!179494))

(assert (= (and b!179492 (not c!32180)) b!179491))

(assert (= (and b!179494 res!85017) b!179493))

(assert (= (or b!179493 b!179491) bm!18124))

(declare-fun m!207729 () Bool)

(assert (=> bm!18124 m!207729))

(assert (=> b!179492 m!207707))

(assert (=> b!179492 m!207707))

(assert (=> b!179492 m!207713))

(assert (=> b!179494 m!207707))

(declare-fun m!207731 () Bool)

(assert (=> b!179494 m!207731))

(declare-fun m!207733 () Bool)

(assert (=> b!179494 m!207733))

(assert (=> b!179494 m!207707))

(declare-fun m!207735 () Bool)

(assert (=> b!179494 m!207735))

(assert (=> b!179407 d!54153))

(declare-fun d!54155 () Bool)

(declare-fun e!118248 () Bool)

(assert (=> d!54155 e!118248))

(declare-fun res!85021 () Bool)

(assert (=> d!54155 (=> res!85021 e!118248)))

(declare-fun lt!88672 () Bool)

(assert (=> d!54155 (= res!85021 (not lt!88672))))

(declare-fun lt!88673 () Bool)

(assert (=> d!54155 (= lt!88672 lt!88673)))

(declare-fun lt!88671 () Unit!5464)

(declare-fun e!118249 () Unit!5464)

(assert (=> d!54155 (= lt!88671 e!118249)))

(declare-fun c!32183 () Bool)

(assert (=> d!54155 (= c!32183 lt!88673)))

(declare-fun containsKey!206 (List!2275 (_ BitVec 64)) Bool)

(assert (=> d!54155 (= lt!88673 (containsKey!206 (toList!1145 (getCurrentListMap!797 (_keys!5570 thiss!1248) (_values!3666 thiss!1248) (mask!8664 thiss!1248) (extraKeys!3420 thiss!1248) (zeroValue!3524 thiss!1248) (minValue!3524 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3683 thiss!1248))) key!828))))

(assert (=> d!54155 (= (contains!1219 (getCurrentListMap!797 (_keys!5570 thiss!1248) (_values!3666 thiss!1248) (mask!8664 thiss!1248) (extraKeys!3420 thiss!1248) (zeroValue!3524 thiss!1248) (minValue!3524 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3683 thiss!1248)) key!828) lt!88672)))

(declare-fun b!179501 () Bool)

(declare-fun lt!88670 () Unit!5464)

(assert (=> b!179501 (= e!118249 lt!88670)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!154 (List!2275 (_ BitVec 64)) Unit!5464)

(assert (=> b!179501 (= lt!88670 (lemmaContainsKeyImpliesGetValueByKeyDefined!154 (toList!1145 (getCurrentListMap!797 (_keys!5570 thiss!1248) (_values!3666 thiss!1248) (mask!8664 thiss!1248) (extraKeys!3420 thiss!1248) (zeroValue!3524 thiss!1248) (minValue!3524 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3683 thiss!1248))) key!828))))

(declare-datatypes ((Option!208 0))(
  ( (Some!207 (v!4032 V!5243)) (None!206) )
))
(declare-fun isDefined!155 (Option!208) Bool)

(declare-fun getValueByKey!202 (List!2275 (_ BitVec 64)) Option!208)

(assert (=> b!179501 (isDefined!155 (getValueByKey!202 (toList!1145 (getCurrentListMap!797 (_keys!5570 thiss!1248) (_values!3666 thiss!1248) (mask!8664 thiss!1248) (extraKeys!3420 thiss!1248) (zeroValue!3524 thiss!1248) (minValue!3524 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3683 thiss!1248))) key!828))))

(declare-fun b!179502 () Bool)

(declare-fun Unit!5466 () Unit!5464)

(assert (=> b!179502 (= e!118249 Unit!5466)))

(declare-fun b!179503 () Bool)

(assert (=> b!179503 (= e!118248 (isDefined!155 (getValueByKey!202 (toList!1145 (getCurrentListMap!797 (_keys!5570 thiss!1248) (_values!3666 thiss!1248) (mask!8664 thiss!1248) (extraKeys!3420 thiss!1248) (zeroValue!3524 thiss!1248) (minValue!3524 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3683 thiss!1248))) key!828)))))

(assert (= (and d!54155 c!32183) b!179501))

(assert (= (and d!54155 (not c!32183)) b!179502))

(assert (= (and d!54155 (not res!85021)) b!179503))

(declare-fun m!207737 () Bool)

(assert (=> d!54155 m!207737))

(declare-fun m!207739 () Bool)

(assert (=> b!179501 m!207739))

(declare-fun m!207741 () Bool)

(assert (=> b!179501 m!207741))

(assert (=> b!179501 m!207741))

(declare-fun m!207743 () Bool)

(assert (=> b!179501 m!207743))

(assert (=> b!179503 m!207741))

(assert (=> b!179503 m!207741))

(assert (=> b!179503 m!207743))

(assert (=> b!179398 d!54155))

(declare-fun b!179546 () Bool)

(declare-fun e!118284 () ListLongMap!2259)

(declare-fun call!18143 () ListLongMap!2259)

(assert (=> b!179546 (= e!118284 call!18143)))

(declare-fun b!179547 () Bool)

(declare-fun e!118280 () Bool)

(declare-fun lt!88734 () ListLongMap!2259)

(declare-fun apply!147 (ListLongMap!2259 (_ BitVec 64)) V!5243)

(assert (=> b!179547 (= e!118280 (= (apply!147 lt!88734 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3524 thiss!1248)))))

(declare-fun b!179548 () Bool)

(declare-fun e!118278 () Bool)

(assert (=> b!179548 (= e!118278 (= (apply!147 lt!88734 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3524 thiss!1248)))))

(declare-fun b!179549 () Bool)

(declare-fun e!118279 () Unit!5464)

(declare-fun Unit!5467 () Unit!5464)

(assert (=> b!179549 (= e!118279 Unit!5467)))

(declare-fun b!179550 () Bool)

(declare-fun res!85048 () Bool)

(declare-fun e!118281 () Bool)

(assert (=> b!179550 (=> (not res!85048) (not e!118281))))

(declare-fun e!118286 () Bool)

(assert (=> b!179550 (= res!85048 e!118286)))

(declare-fun res!85044 () Bool)

(assert (=> b!179550 (=> res!85044 e!118286)))

(declare-fun e!118282 () Bool)

(assert (=> b!179550 (= res!85044 (not e!118282))))

(declare-fun res!85041 () Bool)

(assert (=> b!179550 (=> (not res!85041) (not e!118282))))

(assert (=> b!179550 (= res!85041 (bvslt #b00000000000000000000000000000000 (size!3889 (_keys!5570 thiss!1248))))))

(declare-fun d!54157 () Bool)

(assert (=> d!54157 e!118281))

(declare-fun res!85047 () Bool)

(assert (=> d!54157 (=> (not res!85047) (not e!118281))))

(assert (=> d!54157 (= res!85047 (or (bvsge #b00000000000000000000000000000000 (size!3889 (_keys!5570 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3889 (_keys!5570 thiss!1248))))))))

(declare-fun lt!88730 () ListLongMap!2259)

(assert (=> d!54157 (= lt!88734 lt!88730)))

(declare-fun lt!88737 () Unit!5464)

(assert (=> d!54157 (= lt!88737 e!118279)))

(declare-fun c!32197 () Bool)

(declare-fun e!118287 () Bool)

(assert (=> d!54157 (= c!32197 e!118287)))

(declare-fun res!85045 () Bool)

(assert (=> d!54157 (=> (not res!85045) (not e!118287))))

(assert (=> d!54157 (= res!85045 (bvslt #b00000000000000000000000000000000 (size!3889 (_keys!5570 thiss!1248))))))

(declare-fun e!118283 () ListLongMap!2259)

(assert (=> d!54157 (= lt!88730 e!118283)))

(declare-fun c!32201 () Bool)

(assert (=> d!54157 (= c!32201 (and (not (= (bvand (extraKeys!3420 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3420 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54157 (validMask!0 (mask!8664 thiss!1248))))

(assert (=> d!54157 (= (getCurrentListMap!797 (_keys!5570 thiss!1248) (_values!3666 thiss!1248) (mask!8664 thiss!1248) (extraKeys!3420 thiss!1248) (zeroValue!3524 thiss!1248) (minValue!3524 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3683 thiss!1248)) lt!88734)))

(declare-fun b!179551 () Bool)

(declare-fun e!118277 () Bool)

(declare-fun call!18142 () Bool)

(assert (=> b!179551 (= e!118277 (not call!18142))))

(declare-fun b!179552 () Bool)

(declare-fun call!18147 () ListLongMap!2259)

(declare-fun +!264 (ListLongMap!2259 tuple2!3332) ListLongMap!2259)

(assert (=> b!179552 (= e!118283 (+!264 call!18147 (tuple2!3333 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3524 thiss!1248))))))

(declare-fun b!179553 () Bool)

(assert (=> b!179553 (= e!118281 e!118277)))

(declare-fun c!32199 () Bool)

(assert (=> b!179553 (= c!32199 (not (= (bvand (extraKeys!3420 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!179554 () Bool)

(declare-fun e!118276 () Bool)

(declare-fun get!2050 (ValueCell!1755 V!5243) V!5243)

(declare-fun dynLambda!490 (Int (_ BitVec 64)) V!5243)

(assert (=> b!179554 (= e!118276 (= (apply!147 lt!88734 (select (arr!3581 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000)) (get!2050 (select (arr!3582 (_values!3666 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!490 (defaultEntry!3683 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!179554 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3890 (_values!3666 thiss!1248))))))

(assert (=> b!179554 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3889 (_keys!5570 thiss!1248))))))

(declare-fun b!179555 () Bool)

(declare-fun call!18144 () ListLongMap!2259)

(assert (=> b!179555 (= e!118284 call!18144)))

(declare-fun bm!18139 () Bool)

(declare-fun call!18146 () ListLongMap!2259)

(declare-fun call!18148 () ListLongMap!2259)

(assert (=> bm!18139 (= call!18146 call!18148)))

(declare-fun b!179556 () Bool)

(declare-fun e!118288 () ListLongMap!2259)

(assert (=> b!179556 (= e!118283 e!118288)))

(declare-fun c!32196 () Bool)

(assert (=> b!179556 (= c!32196 (and (not (= (bvand (extraKeys!3420 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3420 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18140 () Bool)

(declare-fun call!18145 () Bool)

(assert (=> bm!18140 (= call!18145 (contains!1219 lt!88734 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179557 () Bool)

(assert (=> b!179557 (= e!118288 call!18143)))

(declare-fun bm!18141 () Bool)

(assert (=> bm!18141 (= call!18143 call!18147)))

(declare-fun b!179558 () Bool)

(assert (=> b!179558 (= e!118277 e!118280)))

(declare-fun res!85043 () Bool)

(assert (=> b!179558 (= res!85043 call!18142)))

(assert (=> b!179558 (=> (not res!85043) (not e!118280))))

(declare-fun b!179559 () Bool)

(declare-fun c!32200 () Bool)

(assert (=> b!179559 (= c!32200 (and (not (= (bvand (extraKeys!3420 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3420 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!179559 (= e!118288 e!118284)))

(declare-fun bm!18142 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!180 (array!7559 array!7561 (_ BitVec 32) (_ BitVec 32) V!5243 V!5243 (_ BitVec 32) Int) ListLongMap!2259)

(assert (=> bm!18142 (= call!18148 (getCurrentListMapNoExtraKeys!180 (_keys!5570 thiss!1248) (_values!3666 thiss!1248) (mask!8664 thiss!1248) (extraKeys!3420 thiss!1248) (zeroValue!3524 thiss!1248) (minValue!3524 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3683 thiss!1248)))))

(declare-fun bm!18143 () Bool)

(assert (=> bm!18143 (= call!18147 (+!264 (ite c!32201 call!18148 (ite c!32196 call!18146 call!18144)) (ite (or c!32201 c!32196) (tuple2!3333 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3524 thiss!1248)) (tuple2!3333 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3524 thiss!1248)))))))

(declare-fun b!179560 () Bool)

(assert (=> b!179560 (= e!118287 (validKeyInArray!0 (select (arr!3581 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179561 () Bool)

(assert (=> b!179561 (= e!118286 e!118276)))

(declare-fun res!85040 () Bool)

(assert (=> b!179561 (=> (not res!85040) (not e!118276))))

(assert (=> b!179561 (= res!85040 (contains!1219 lt!88734 (select (arr!3581 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!179561 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3889 (_keys!5570 thiss!1248))))))

(declare-fun b!179562 () Bool)

(declare-fun lt!88725 () Unit!5464)

(assert (=> b!179562 (= e!118279 lt!88725)))

(declare-fun lt!88727 () ListLongMap!2259)

(assert (=> b!179562 (= lt!88727 (getCurrentListMapNoExtraKeys!180 (_keys!5570 thiss!1248) (_values!3666 thiss!1248) (mask!8664 thiss!1248) (extraKeys!3420 thiss!1248) (zeroValue!3524 thiss!1248) (minValue!3524 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3683 thiss!1248)))))

(declare-fun lt!88721 () (_ BitVec 64))

(assert (=> b!179562 (= lt!88721 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88724 () (_ BitVec 64))

(assert (=> b!179562 (= lt!88724 (select (arr!3581 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88718 () Unit!5464)

(declare-fun addStillContains!123 (ListLongMap!2259 (_ BitVec 64) V!5243 (_ BitVec 64)) Unit!5464)

(assert (=> b!179562 (= lt!88718 (addStillContains!123 lt!88727 lt!88721 (zeroValue!3524 thiss!1248) lt!88724))))

(assert (=> b!179562 (contains!1219 (+!264 lt!88727 (tuple2!3333 lt!88721 (zeroValue!3524 thiss!1248))) lt!88724)))

(declare-fun lt!88731 () Unit!5464)

(assert (=> b!179562 (= lt!88731 lt!88718)))

(declare-fun lt!88738 () ListLongMap!2259)

(assert (=> b!179562 (= lt!88738 (getCurrentListMapNoExtraKeys!180 (_keys!5570 thiss!1248) (_values!3666 thiss!1248) (mask!8664 thiss!1248) (extraKeys!3420 thiss!1248) (zeroValue!3524 thiss!1248) (minValue!3524 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3683 thiss!1248)))))

(declare-fun lt!88729 () (_ BitVec 64))

(assert (=> b!179562 (= lt!88729 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88723 () (_ BitVec 64))

(assert (=> b!179562 (= lt!88723 (select (arr!3581 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88732 () Unit!5464)

(declare-fun addApplyDifferent!123 (ListLongMap!2259 (_ BitVec 64) V!5243 (_ BitVec 64)) Unit!5464)

(assert (=> b!179562 (= lt!88732 (addApplyDifferent!123 lt!88738 lt!88729 (minValue!3524 thiss!1248) lt!88723))))

(assert (=> b!179562 (= (apply!147 (+!264 lt!88738 (tuple2!3333 lt!88729 (minValue!3524 thiss!1248))) lt!88723) (apply!147 lt!88738 lt!88723))))

(declare-fun lt!88720 () Unit!5464)

(assert (=> b!179562 (= lt!88720 lt!88732)))

(declare-fun lt!88728 () ListLongMap!2259)

(assert (=> b!179562 (= lt!88728 (getCurrentListMapNoExtraKeys!180 (_keys!5570 thiss!1248) (_values!3666 thiss!1248) (mask!8664 thiss!1248) (extraKeys!3420 thiss!1248) (zeroValue!3524 thiss!1248) (minValue!3524 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3683 thiss!1248)))))

(declare-fun lt!88733 () (_ BitVec 64))

(assert (=> b!179562 (= lt!88733 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88739 () (_ BitVec 64))

(assert (=> b!179562 (= lt!88739 (select (arr!3581 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88726 () Unit!5464)

(assert (=> b!179562 (= lt!88726 (addApplyDifferent!123 lt!88728 lt!88733 (zeroValue!3524 thiss!1248) lt!88739))))

(assert (=> b!179562 (= (apply!147 (+!264 lt!88728 (tuple2!3333 lt!88733 (zeroValue!3524 thiss!1248))) lt!88739) (apply!147 lt!88728 lt!88739))))

(declare-fun lt!88735 () Unit!5464)

(assert (=> b!179562 (= lt!88735 lt!88726)))

(declare-fun lt!88719 () ListLongMap!2259)

(assert (=> b!179562 (= lt!88719 (getCurrentListMapNoExtraKeys!180 (_keys!5570 thiss!1248) (_values!3666 thiss!1248) (mask!8664 thiss!1248) (extraKeys!3420 thiss!1248) (zeroValue!3524 thiss!1248) (minValue!3524 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3683 thiss!1248)))))

(declare-fun lt!88736 () (_ BitVec 64))

(assert (=> b!179562 (= lt!88736 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88722 () (_ BitVec 64))

(assert (=> b!179562 (= lt!88722 (select (arr!3581 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179562 (= lt!88725 (addApplyDifferent!123 lt!88719 lt!88736 (minValue!3524 thiss!1248) lt!88722))))

(assert (=> b!179562 (= (apply!147 (+!264 lt!88719 (tuple2!3333 lt!88736 (minValue!3524 thiss!1248))) lt!88722) (apply!147 lt!88719 lt!88722))))

(declare-fun bm!18144 () Bool)

(assert (=> bm!18144 (= call!18142 (contains!1219 lt!88734 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179563 () Bool)

(assert (=> b!179563 (= e!118282 (validKeyInArray!0 (select (arr!3581 (_keys!5570 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18145 () Bool)

(assert (=> bm!18145 (= call!18144 call!18146)))

(declare-fun b!179564 () Bool)

(declare-fun res!85046 () Bool)

(assert (=> b!179564 (=> (not res!85046) (not e!118281))))

(declare-fun e!118285 () Bool)

(assert (=> b!179564 (= res!85046 e!118285)))

(declare-fun c!32198 () Bool)

(assert (=> b!179564 (= c!32198 (not (= (bvand (extraKeys!3420 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!179565 () Bool)

(assert (=> b!179565 (= e!118285 e!118278)))

(declare-fun res!85042 () Bool)

(assert (=> b!179565 (= res!85042 call!18145)))

(assert (=> b!179565 (=> (not res!85042) (not e!118278))))

(declare-fun b!179566 () Bool)

(assert (=> b!179566 (= e!118285 (not call!18145))))

(assert (= (and d!54157 c!32201) b!179552))

(assert (= (and d!54157 (not c!32201)) b!179556))

(assert (= (and b!179556 c!32196) b!179557))

(assert (= (and b!179556 (not c!32196)) b!179559))

(assert (= (and b!179559 c!32200) b!179546))

(assert (= (and b!179559 (not c!32200)) b!179555))

(assert (= (or b!179546 b!179555) bm!18145))

(assert (= (or b!179557 bm!18145) bm!18139))

(assert (= (or b!179557 b!179546) bm!18141))

(assert (= (or b!179552 bm!18139) bm!18142))

(assert (= (or b!179552 bm!18141) bm!18143))

(assert (= (and d!54157 res!85045) b!179560))

(assert (= (and d!54157 c!32197) b!179562))

(assert (= (and d!54157 (not c!32197)) b!179549))

(assert (= (and d!54157 res!85047) b!179550))

(assert (= (and b!179550 res!85041) b!179563))

(assert (= (and b!179550 (not res!85044)) b!179561))

(assert (= (and b!179561 res!85040) b!179554))

(assert (= (and b!179550 res!85048) b!179564))

(assert (= (and b!179564 c!32198) b!179565))

(assert (= (and b!179564 (not c!32198)) b!179566))

(assert (= (and b!179565 res!85042) b!179548))

(assert (= (or b!179565 b!179566) bm!18140))

(assert (= (and b!179564 res!85046) b!179553))

(assert (= (and b!179553 c!32199) b!179558))

(assert (= (and b!179553 (not c!32199)) b!179551))

(assert (= (and b!179558 res!85043) b!179547))

(assert (= (or b!179558 b!179551) bm!18144))

(declare-fun b_lambda!7111 () Bool)

(assert (=> (not b_lambda!7111) (not b!179554)))

(declare-fun t!7124 () Bool)

(declare-fun tb!2805 () Bool)

(assert (=> (and b!179400 (= (defaultEntry!3683 thiss!1248) (defaultEntry!3683 thiss!1248)) t!7124) tb!2805))

(declare-fun result!4689 () Bool)

(assert (=> tb!2805 (= result!4689 tp_is_empty!4197)))

(assert (=> b!179554 t!7124))

(declare-fun b_and!10959 () Bool)

(assert (= b_and!10955 (and (=> t!7124 result!4689) b_and!10959)))

(assert (=> b!179554 m!207707))

(declare-fun m!207745 () Bool)

(assert (=> b!179554 m!207745))

(assert (=> b!179554 m!207745))

(declare-fun m!207747 () Bool)

(assert (=> b!179554 m!207747))

(declare-fun m!207749 () Bool)

(assert (=> b!179554 m!207749))

(assert (=> b!179554 m!207747))

(assert (=> b!179554 m!207707))

(declare-fun m!207751 () Bool)

(assert (=> b!179554 m!207751))

(assert (=> b!179563 m!207707))

(assert (=> b!179563 m!207707))

(assert (=> b!179563 m!207713))

(declare-fun m!207753 () Bool)

(assert (=> b!179552 m!207753))

(declare-fun m!207755 () Bool)

(assert (=> b!179562 m!207755))

(declare-fun m!207757 () Bool)

(assert (=> b!179562 m!207757))

(declare-fun m!207759 () Bool)

(assert (=> b!179562 m!207759))

(declare-fun m!207761 () Bool)

(assert (=> b!179562 m!207761))

(declare-fun m!207763 () Bool)

(assert (=> b!179562 m!207763))

(declare-fun m!207765 () Bool)

(assert (=> b!179562 m!207765))

(declare-fun m!207767 () Bool)

(assert (=> b!179562 m!207767))

(declare-fun m!207769 () Bool)

(assert (=> b!179562 m!207769))

(declare-fun m!207771 () Bool)

(assert (=> b!179562 m!207771))

(declare-fun m!207773 () Bool)

(assert (=> b!179562 m!207773))

(declare-fun m!207775 () Bool)

(assert (=> b!179562 m!207775))

(declare-fun m!207777 () Bool)

(assert (=> b!179562 m!207777))

(assert (=> b!179562 m!207707))

(assert (=> b!179562 m!207763))

(declare-fun m!207779 () Bool)

(assert (=> b!179562 m!207779))

(assert (=> b!179562 m!207769))

(assert (=> b!179562 m!207761))

(declare-fun m!207781 () Bool)

(assert (=> b!179562 m!207781))

(declare-fun m!207783 () Bool)

(assert (=> b!179562 m!207783))

(assert (=> b!179562 m!207757))

(declare-fun m!207785 () Bool)

(assert (=> b!179562 m!207785))

(declare-fun m!207787 () Bool)

(assert (=> b!179548 m!207787))

(assert (=> b!179560 m!207707))

(assert (=> b!179560 m!207707))

(assert (=> b!179560 m!207713))

(declare-fun m!207789 () Bool)

(assert (=> bm!18140 m!207789))

(declare-fun m!207791 () Bool)

(assert (=> bm!18144 m!207791))

(declare-fun m!207793 () Bool)

(assert (=> b!179547 m!207793))

(assert (=> d!54157 m!207681))

(declare-fun m!207795 () Bool)

(assert (=> bm!18143 m!207795))

(assert (=> bm!18142 m!207783))

(assert (=> b!179561 m!207707))

(assert (=> b!179561 m!207707))

(declare-fun m!207797 () Bool)

(assert (=> b!179561 m!207797))

(assert (=> b!179398 d!54157))

(declare-fun d!54159 () Bool)

(assert (=> d!54159 (= (validMask!0 (mask!8664 thiss!1248)) (and (or (= (mask!8664 thiss!1248) #b00000000000000000000000000000111) (= (mask!8664 thiss!1248) #b00000000000000000000000000001111) (= (mask!8664 thiss!1248) #b00000000000000000000000000011111) (= (mask!8664 thiss!1248) #b00000000000000000000000000111111) (= (mask!8664 thiss!1248) #b00000000000000000000000001111111) (= (mask!8664 thiss!1248) #b00000000000000000000000011111111) (= (mask!8664 thiss!1248) #b00000000000000000000000111111111) (= (mask!8664 thiss!1248) #b00000000000000000000001111111111) (= (mask!8664 thiss!1248) #b00000000000000000000011111111111) (= (mask!8664 thiss!1248) #b00000000000000000000111111111111) (= (mask!8664 thiss!1248) #b00000000000000000001111111111111) (= (mask!8664 thiss!1248) #b00000000000000000011111111111111) (= (mask!8664 thiss!1248) #b00000000000000000111111111111111) (= (mask!8664 thiss!1248) #b00000000000000001111111111111111) (= (mask!8664 thiss!1248) #b00000000000000011111111111111111) (= (mask!8664 thiss!1248) #b00000000000000111111111111111111) (= (mask!8664 thiss!1248) #b00000000000001111111111111111111) (= (mask!8664 thiss!1248) #b00000000000011111111111111111111) (= (mask!8664 thiss!1248) #b00000000000111111111111111111111) (= (mask!8664 thiss!1248) #b00000000001111111111111111111111) (= (mask!8664 thiss!1248) #b00000000011111111111111111111111) (= (mask!8664 thiss!1248) #b00000000111111111111111111111111) (= (mask!8664 thiss!1248) #b00000001111111111111111111111111) (= (mask!8664 thiss!1248) #b00000011111111111111111111111111) (= (mask!8664 thiss!1248) #b00000111111111111111111111111111) (= (mask!8664 thiss!1248) #b00001111111111111111111111111111) (= (mask!8664 thiss!1248) #b00011111111111111111111111111111) (= (mask!8664 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8664 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!179401 d!54159))

(declare-fun mapNonEmpty!7189 () Bool)

(declare-fun mapRes!7189 () Bool)

(declare-fun tp!16009 () Bool)

(declare-fun e!118294 () Bool)

(assert (=> mapNonEmpty!7189 (= mapRes!7189 (and tp!16009 e!118294))))

(declare-fun mapRest!7189 () (Array (_ BitVec 32) ValueCell!1755))

(declare-fun mapValue!7189 () ValueCell!1755)

(declare-fun mapKey!7189 () (_ BitVec 32))

(assert (=> mapNonEmpty!7189 (= mapRest!7183 (store mapRest!7189 mapKey!7189 mapValue!7189))))

(declare-fun b!179575 () Bool)

(assert (=> b!179575 (= e!118294 tp_is_empty!4197)))

(declare-fun mapIsEmpty!7189 () Bool)

(assert (=> mapIsEmpty!7189 mapRes!7189))

(declare-fun condMapEmpty!7189 () Bool)

(declare-fun mapDefault!7189 () ValueCell!1755)

(assert (=> mapNonEmpty!7183 (= condMapEmpty!7189 (= mapRest!7183 ((as const (Array (_ BitVec 32) ValueCell!1755)) mapDefault!7189)))))

(declare-fun e!118293 () Bool)

(assert (=> mapNonEmpty!7183 (= tp!15999 (and e!118293 mapRes!7189))))

(declare-fun b!179576 () Bool)

(assert (=> b!179576 (= e!118293 tp_is_empty!4197)))

(assert (= (and mapNonEmpty!7183 condMapEmpty!7189) mapIsEmpty!7189))

(assert (= (and mapNonEmpty!7183 (not condMapEmpty!7189)) mapNonEmpty!7189))

(assert (= (and mapNonEmpty!7189 ((_ is ValueCellFull!1755) mapValue!7189)) b!179575))

(assert (= (and mapNonEmpty!7183 ((_ is ValueCellFull!1755) mapDefault!7189)) b!179576))

(declare-fun m!207799 () Bool)

(assert (=> mapNonEmpty!7189 m!207799))

(declare-fun b_lambda!7113 () Bool)

(assert (= b_lambda!7111 (or (and b!179400 b_free!4425) b_lambda!7113)))

(check-sat (not bm!18143) (not d!54151) tp_is_empty!4197 (not b!179548) (not b_lambda!7113) (not b!179447) (not d!54157) (not b_next!4425) (not d!54155) (not b!179552) (not b!179561) (not bm!18144) (not b!179494) (not b!179562) (not b!179547) (not bm!18121) (not b!179501) (not b!179560) (not b!179503) (not b!179563) (not bm!18142) (not b!179492) (not bm!18124) (not b!179460) (not mapNonEmpty!7189) (not b!179448) (not b!179449) (not b!179554) (not d!54143) (not b!179480) b_and!10959 (not b!179463) (not b!179462) (not bm!18140))
(check-sat b_and!10959 (not b_next!4425))
