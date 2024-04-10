; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16402 () Bool)

(assert start!16402)

(declare-fun b!163387 () Bool)

(declare-fun b_free!3795 () Bool)

(declare-fun b_next!3795 () Bool)

(assert (=> b!163387 (= b_free!3795 (not b_next!3795))))

(declare-fun tp!13968 () Bool)

(declare-fun b_and!10209 () Bool)

(assert (=> b!163387 (= tp!13968 b_and!10209)))

(declare-fun mapIsEmpty!6097 () Bool)

(declare-fun mapRes!6097 () Bool)

(assert (=> mapIsEmpty!6097 mapRes!6097))

(declare-fun b!163383 () Bool)

(declare-fun res!77330 () Bool)

(declare-fun e!107203 () Bool)

(assert (=> b!163383 (=> (not res!77330) (not e!107203))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!163383 (= res!77330 (not (= key!828 (bvneg key!828))))))

(declare-fun res!77331 () Bool)

(assert (=> start!16402 (=> (not res!77331) (not e!107203))))

(declare-datatypes ((V!4443 0))(
  ( (V!4444 (val!1843 Int)) )
))
(declare-datatypes ((ValueCell!1455 0))(
  ( (ValueCellFull!1455 (v!3708 V!4443)) (EmptyCell!1455) )
))
(declare-datatypes ((array!6281 0))(
  ( (array!6282 (arr!2981 (Array (_ BitVec 32) (_ BitVec 64))) (size!3267 (_ BitVec 32))) )
))
(declare-datatypes ((array!6283 0))(
  ( (array!6284 (arr!2982 (Array (_ BitVec 32) ValueCell!1455)) (size!3268 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1818 0))(
  ( (LongMapFixedSize!1819 (defaultEntry!3351 Int) (mask!8007 (_ BitVec 32)) (extraKeys!3092 (_ BitVec 32)) (zeroValue!3194 V!4443) (minValue!3194 V!4443) (_size!958 (_ BitVec 32)) (_keys!5162 array!6281) (_values!3334 array!6283) (_vacant!958 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1818)

(declare-fun valid!815 (LongMapFixedSize!1818) Bool)

(assert (=> start!16402 (= res!77331 (valid!815 thiss!1248))))

(assert (=> start!16402 e!107203))

(declare-fun e!107199 () Bool)

(assert (=> start!16402 e!107199))

(assert (=> start!16402 true))

(declare-fun b!163384 () Bool)

(declare-fun e!107201 () Bool)

(declare-fun tp_is_empty!3597 () Bool)

(assert (=> b!163384 (= e!107201 tp_is_empty!3597)))

(declare-fun b!163385 () Bool)

(declare-fun e!107202 () Bool)

(assert (=> b!163385 (= e!107202 (and e!107201 mapRes!6097))))

(declare-fun condMapEmpty!6097 () Bool)

(declare-fun mapDefault!6097 () ValueCell!1455)

(assert (=> b!163385 (= condMapEmpty!6097 (= (arr!2982 (_values!3334 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1455)) mapDefault!6097)))))

(declare-fun b!163386 () Bool)

(declare-fun e!107198 () Bool)

(assert (=> b!163386 (= e!107198 (and (= (size!3268 (_values!3334 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8007 thiss!1248))) (= (size!3267 (_keys!5162 thiss!1248)) (size!3268 (_values!3334 thiss!1248))) (bvsge (mask!8007 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3092 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun array_inv!1909 (array!6281) Bool)

(declare-fun array_inv!1910 (array!6283) Bool)

(assert (=> b!163387 (= e!107199 (and tp!13968 tp_is_empty!3597 (array_inv!1909 (_keys!5162 thiss!1248)) (array_inv!1910 (_values!3334 thiss!1248)) e!107202))))

(declare-fun mapNonEmpty!6097 () Bool)

(declare-fun tp!13969 () Bool)

(declare-fun e!107200 () Bool)

(assert (=> mapNonEmpty!6097 (= mapRes!6097 (and tp!13969 e!107200))))

(declare-fun mapKey!6097 () (_ BitVec 32))

(declare-fun mapRest!6097 () (Array (_ BitVec 32) ValueCell!1455))

(declare-fun mapValue!6097 () ValueCell!1455)

(assert (=> mapNonEmpty!6097 (= (arr!2982 (_values!3334 thiss!1248)) (store mapRest!6097 mapKey!6097 mapValue!6097))))

(declare-fun b!163388 () Bool)

(declare-fun res!77329 () Bool)

(assert (=> b!163388 (=> (not res!77329) (not e!107198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163388 (= res!77329 (validMask!0 (mask!8007 thiss!1248)))))

(declare-fun b!163389 () Bool)

(assert (=> b!163389 (= e!107203 e!107198)))

(declare-fun res!77332 () Bool)

(assert (=> b!163389 (=> (not res!77332) (not e!107198))))

(declare-datatypes ((SeekEntryResult!400 0))(
  ( (MissingZero!400 (index!3768 (_ BitVec 32))) (Found!400 (index!3769 (_ BitVec 32))) (Intermediate!400 (undefined!1212 Bool) (index!3770 (_ BitVec 32)) (x!18106 (_ BitVec 32))) (Undefined!400) (MissingVacant!400 (index!3771 (_ BitVec 32))) )
))
(declare-fun lt!82672 () SeekEntryResult!400)

(get-info :version)

(assert (=> b!163389 (= res!77332 (and (not ((_ is Undefined!400) lt!82672)) (not ((_ is MissingVacant!400) lt!82672)) (not ((_ is MissingZero!400) lt!82672)) ((_ is Found!400) lt!82672)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6281 (_ BitVec 32)) SeekEntryResult!400)

(assert (=> b!163389 (= lt!82672 (seekEntryOrOpen!0 key!828 (_keys!5162 thiss!1248) (mask!8007 thiss!1248)))))

(declare-fun b!163390 () Bool)

(assert (=> b!163390 (= e!107200 tp_is_empty!3597)))

(assert (= (and start!16402 res!77331) b!163383))

(assert (= (and b!163383 res!77330) b!163389))

(assert (= (and b!163389 res!77332) b!163388))

(assert (= (and b!163388 res!77329) b!163386))

(assert (= (and b!163385 condMapEmpty!6097) mapIsEmpty!6097))

(assert (= (and b!163385 (not condMapEmpty!6097)) mapNonEmpty!6097))

(assert (= (and mapNonEmpty!6097 ((_ is ValueCellFull!1455) mapValue!6097)) b!163390))

(assert (= (and b!163385 ((_ is ValueCellFull!1455) mapDefault!6097)) b!163384))

(assert (= b!163387 b!163385))

(assert (= start!16402 b!163387))

(declare-fun m!194083 () Bool)

(assert (=> b!163389 m!194083))

(declare-fun m!194085 () Bool)

(assert (=> start!16402 m!194085))

(declare-fun m!194087 () Bool)

(assert (=> mapNonEmpty!6097 m!194087))

(declare-fun m!194089 () Bool)

(assert (=> b!163388 m!194089))

(declare-fun m!194091 () Bool)

(assert (=> b!163387 m!194091))

(declare-fun m!194093 () Bool)

(assert (=> b!163387 m!194093))

(check-sat (not b!163388) (not start!16402) b_and!10209 (not b!163389) (not b!163387) (not b_next!3795) (not mapNonEmpty!6097) tp_is_empty!3597)
(check-sat b_and!10209 (not b_next!3795))
(get-model)

(declare-fun d!51433 () Bool)

(assert (=> d!51433 (= (array_inv!1909 (_keys!5162 thiss!1248)) (bvsge (size!3267 (_keys!5162 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163387 d!51433))

(declare-fun d!51435 () Bool)

(assert (=> d!51435 (= (array_inv!1910 (_values!3334 thiss!1248)) (bvsge (size!3268 (_values!3334 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163387 d!51435))

(declare-fun d!51437 () Bool)

(declare-fun res!77351 () Bool)

(declare-fun e!107227 () Bool)

(assert (=> d!51437 (=> (not res!77351) (not e!107227))))

(declare-fun simpleValid!122 (LongMapFixedSize!1818) Bool)

(assert (=> d!51437 (= res!77351 (simpleValid!122 thiss!1248))))

(assert (=> d!51437 (= (valid!815 thiss!1248) e!107227)))

(declare-fun b!163421 () Bool)

(declare-fun res!77352 () Bool)

(assert (=> b!163421 (=> (not res!77352) (not e!107227))))

(declare-fun arrayCountValidKeys!0 (array!6281 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163421 (= res!77352 (= (arrayCountValidKeys!0 (_keys!5162 thiss!1248) #b00000000000000000000000000000000 (size!3267 (_keys!5162 thiss!1248))) (_size!958 thiss!1248)))))

(declare-fun b!163422 () Bool)

(declare-fun res!77353 () Bool)

(assert (=> b!163422 (=> (not res!77353) (not e!107227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6281 (_ BitVec 32)) Bool)

(assert (=> b!163422 (= res!77353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5162 thiss!1248) (mask!8007 thiss!1248)))))

(declare-fun b!163423 () Bool)

(declare-datatypes ((List!1991 0))(
  ( (Nil!1988) (Cons!1987 (h!2602 (_ BitVec 64)) (t!6793 List!1991)) )
))
(declare-fun arrayNoDuplicates!0 (array!6281 (_ BitVec 32) List!1991) Bool)

(assert (=> b!163423 (= e!107227 (arrayNoDuplicates!0 (_keys!5162 thiss!1248) #b00000000000000000000000000000000 Nil!1988))))

(assert (= (and d!51437 res!77351) b!163421))

(assert (= (and b!163421 res!77352) b!163422))

(assert (= (and b!163422 res!77353) b!163423))

(declare-fun m!194107 () Bool)

(assert (=> d!51437 m!194107))

(declare-fun m!194109 () Bool)

(assert (=> b!163421 m!194109))

(declare-fun m!194111 () Bool)

(assert (=> b!163422 m!194111))

(declare-fun m!194113 () Bool)

(assert (=> b!163423 m!194113))

(assert (=> start!16402 d!51437))

(declare-fun d!51439 () Bool)

(assert (=> d!51439 (= (validMask!0 (mask!8007 thiss!1248)) (and (or (= (mask!8007 thiss!1248) #b00000000000000000000000000000111) (= (mask!8007 thiss!1248) #b00000000000000000000000000001111) (= (mask!8007 thiss!1248) #b00000000000000000000000000011111) (= (mask!8007 thiss!1248) #b00000000000000000000000000111111) (= (mask!8007 thiss!1248) #b00000000000000000000000001111111) (= (mask!8007 thiss!1248) #b00000000000000000000000011111111) (= (mask!8007 thiss!1248) #b00000000000000000000000111111111) (= (mask!8007 thiss!1248) #b00000000000000000000001111111111) (= (mask!8007 thiss!1248) #b00000000000000000000011111111111) (= (mask!8007 thiss!1248) #b00000000000000000000111111111111) (= (mask!8007 thiss!1248) #b00000000000000000001111111111111) (= (mask!8007 thiss!1248) #b00000000000000000011111111111111) (= (mask!8007 thiss!1248) #b00000000000000000111111111111111) (= (mask!8007 thiss!1248) #b00000000000000001111111111111111) (= (mask!8007 thiss!1248) #b00000000000000011111111111111111) (= (mask!8007 thiss!1248) #b00000000000000111111111111111111) (= (mask!8007 thiss!1248) #b00000000000001111111111111111111) (= (mask!8007 thiss!1248) #b00000000000011111111111111111111) (= (mask!8007 thiss!1248) #b00000000000111111111111111111111) (= (mask!8007 thiss!1248) #b00000000001111111111111111111111) (= (mask!8007 thiss!1248) #b00000000011111111111111111111111) (= (mask!8007 thiss!1248) #b00000000111111111111111111111111) (= (mask!8007 thiss!1248) #b00000001111111111111111111111111) (= (mask!8007 thiss!1248) #b00000011111111111111111111111111) (= (mask!8007 thiss!1248) #b00000111111111111111111111111111) (= (mask!8007 thiss!1248) #b00001111111111111111111111111111) (= (mask!8007 thiss!1248) #b00011111111111111111111111111111) (= (mask!8007 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8007 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163388 d!51439))

(declare-fun b!163436 () Bool)

(declare-fun c!30082 () Bool)

(declare-fun lt!82683 () (_ BitVec 64))

(assert (=> b!163436 (= c!30082 (= lt!82683 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107235 () SeekEntryResult!400)

(declare-fun e!107236 () SeekEntryResult!400)

(assert (=> b!163436 (= e!107235 e!107236)))

(declare-fun b!163437 () Bool)

(declare-fun e!107234 () SeekEntryResult!400)

(assert (=> b!163437 (= e!107234 e!107235)))

(declare-fun lt!82684 () SeekEntryResult!400)

(assert (=> b!163437 (= lt!82683 (select (arr!2981 (_keys!5162 thiss!1248)) (index!3770 lt!82684)))))

(declare-fun c!30081 () Bool)

(assert (=> b!163437 (= c!30081 (= lt!82683 key!828))))

(declare-fun b!163438 () Bool)

(assert (=> b!163438 (= e!107235 (Found!400 (index!3770 lt!82684)))))

(declare-fun b!163439 () Bool)

(assert (=> b!163439 (= e!107236 (MissingZero!400 (index!3770 lt!82684)))))

(declare-fun b!163441 () Bool)

(assert (=> b!163441 (= e!107234 Undefined!400)))

(declare-fun b!163440 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6281 (_ BitVec 32)) SeekEntryResult!400)

(assert (=> b!163440 (= e!107236 (seekKeyOrZeroReturnVacant!0 (x!18106 lt!82684) (index!3770 lt!82684) (index!3770 lt!82684) key!828 (_keys!5162 thiss!1248) (mask!8007 thiss!1248)))))

(declare-fun d!51441 () Bool)

(declare-fun lt!82682 () SeekEntryResult!400)

(assert (=> d!51441 (and (or ((_ is Undefined!400) lt!82682) (not ((_ is Found!400) lt!82682)) (and (bvsge (index!3769 lt!82682) #b00000000000000000000000000000000) (bvslt (index!3769 lt!82682) (size!3267 (_keys!5162 thiss!1248))))) (or ((_ is Undefined!400) lt!82682) ((_ is Found!400) lt!82682) (not ((_ is MissingZero!400) lt!82682)) (and (bvsge (index!3768 lt!82682) #b00000000000000000000000000000000) (bvslt (index!3768 lt!82682) (size!3267 (_keys!5162 thiss!1248))))) (or ((_ is Undefined!400) lt!82682) ((_ is Found!400) lt!82682) ((_ is MissingZero!400) lt!82682) (not ((_ is MissingVacant!400) lt!82682)) (and (bvsge (index!3771 lt!82682) #b00000000000000000000000000000000) (bvslt (index!3771 lt!82682) (size!3267 (_keys!5162 thiss!1248))))) (or ((_ is Undefined!400) lt!82682) (ite ((_ is Found!400) lt!82682) (= (select (arr!2981 (_keys!5162 thiss!1248)) (index!3769 lt!82682)) key!828) (ite ((_ is MissingZero!400) lt!82682) (= (select (arr!2981 (_keys!5162 thiss!1248)) (index!3768 lt!82682)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!400) lt!82682) (= (select (arr!2981 (_keys!5162 thiss!1248)) (index!3771 lt!82682)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51441 (= lt!82682 e!107234)))

(declare-fun c!30080 () Bool)

(assert (=> d!51441 (= c!30080 (and ((_ is Intermediate!400) lt!82684) (undefined!1212 lt!82684)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6281 (_ BitVec 32)) SeekEntryResult!400)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51441 (= lt!82684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8007 thiss!1248)) key!828 (_keys!5162 thiss!1248) (mask!8007 thiss!1248)))))

(assert (=> d!51441 (validMask!0 (mask!8007 thiss!1248))))

(assert (=> d!51441 (= (seekEntryOrOpen!0 key!828 (_keys!5162 thiss!1248) (mask!8007 thiss!1248)) lt!82682)))

(assert (= (and d!51441 c!30080) b!163441))

(assert (= (and d!51441 (not c!30080)) b!163437))

(assert (= (and b!163437 c!30081) b!163438))

(assert (= (and b!163437 (not c!30081)) b!163436))

(assert (= (and b!163436 c!30082) b!163439))

(assert (= (and b!163436 (not c!30082)) b!163440))

(declare-fun m!194115 () Bool)

(assert (=> b!163437 m!194115))

(declare-fun m!194117 () Bool)

(assert (=> b!163440 m!194117))

(declare-fun m!194119 () Bool)

(assert (=> d!51441 m!194119))

(declare-fun m!194121 () Bool)

(assert (=> d!51441 m!194121))

(assert (=> d!51441 m!194119))

(declare-fun m!194123 () Bool)

(assert (=> d!51441 m!194123))

(assert (=> d!51441 m!194089))

(declare-fun m!194125 () Bool)

(assert (=> d!51441 m!194125))

(declare-fun m!194127 () Bool)

(assert (=> d!51441 m!194127))

(assert (=> b!163389 d!51441))

(declare-fun b!163448 () Bool)

(declare-fun e!107241 () Bool)

(assert (=> b!163448 (= e!107241 tp_is_empty!3597)))

(declare-fun b!163449 () Bool)

(declare-fun e!107242 () Bool)

(assert (=> b!163449 (= e!107242 tp_is_empty!3597)))

(declare-fun condMapEmpty!6103 () Bool)

(declare-fun mapDefault!6103 () ValueCell!1455)

(assert (=> mapNonEmpty!6097 (= condMapEmpty!6103 (= mapRest!6097 ((as const (Array (_ BitVec 32) ValueCell!1455)) mapDefault!6103)))))

(declare-fun mapRes!6103 () Bool)

(assert (=> mapNonEmpty!6097 (= tp!13969 (and e!107242 mapRes!6103))))

(declare-fun mapIsEmpty!6103 () Bool)

(assert (=> mapIsEmpty!6103 mapRes!6103))

(declare-fun mapNonEmpty!6103 () Bool)

(declare-fun tp!13978 () Bool)

(assert (=> mapNonEmpty!6103 (= mapRes!6103 (and tp!13978 e!107241))))

(declare-fun mapRest!6103 () (Array (_ BitVec 32) ValueCell!1455))

(declare-fun mapValue!6103 () ValueCell!1455)

(declare-fun mapKey!6103 () (_ BitVec 32))

(assert (=> mapNonEmpty!6103 (= mapRest!6097 (store mapRest!6103 mapKey!6103 mapValue!6103))))

(assert (= (and mapNonEmpty!6097 condMapEmpty!6103) mapIsEmpty!6103))

(assert (= (and mapNonEmpty!6097 (not condMapEmpty!6103)) mapNonEmpty!6103))

(assert (= (and mapNonEmpty!6103 ((_ is ValueCellFull!1455) mapValue!6103)) b!163448))

(assert (= (and mapNonEmpty!6097 ((_ is ValueCellFull!1455) mapDefault!6103)) b!163449))

(declare-fun m!194129 () Bool)

(assert (=> mapNonEmpty!6103 m!194129))

(check-sat (not b!163440) (not d!51437) (not d!51441) (not b!163422) (not mapNonEmpty!6103) (not b!163423) (not b!163421) b_and!10209 (not b_next!3795) tp_is_empty!3597)
(check-sat b_and!10209 (not b_next!3795))
(get-model)

(declare-fun b!163460 () Bool)

(declare-fun e!107252 () Bool)

(declare-fun contains!1038 (List!1991 (_ BitVec 64)) Bool)

(assert (=> b!163460 (= e!107252 (contains!1038 Nil!1988 (select (arr!2981 (_keys!5162 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51443 () Bool)

(declare-fun res!77362 () Bool)

(declare-fun e!107251 () Bool)

(assert (=> d!51443 (=> res!77362 e!107251)))

(assert (=> d!51443 (= res!77362 (bvsge #b00000000000000000000000000000000 (size!3267 (_keys!5162 thiss!1248))))))

(assert (=> d!51443 (= (arrayNoDuplicates!0 (_keys!5162 thiss!1248) #b00000000000000000000000000000000 Nil!1988) e!107251)))

(declare-fun b!163461 () Bool)

(declare-fun e!107253 () Bool)

(assert (=> b!163461 (= e!107251 e!107253)))

(declare-fun res!77360 () Bool)

(assert (=> b!163461 (=> (not res!77360) (not e!107253))))

(assert (=> b!163461 (= res!77360 (not e!107252))))

(declare-fun res!77361 () Bool)

(assert (=> b!163461 (=> (not res!77361) (not e!107252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!163461 (= res!77361 (validKeyInArray!0 (select (arr!2981 (_keys!5162 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163462 () Bool)

(declare-fun e!107254 () Bool)

(declare-fun call!17305 () Bool)

(assert (=> b!163462 (= e!107254 call!17305)))

(declare-fun bm!17302 () Bool)

(declare-fun c!30085 () Bool)

(assert (=> bm!17302 (= call!17305 (arrayNoDuplicates!0 (_keys!5162 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30085 (Cons!1987 (select (arr!2981 (_keys!5162 thiss!1248)) #b00000000000000000000000000000000) Nil!1988) Nil!1988)))))

(declare-fun b!163463 () Bool)

(assert (=> b!163463 (= e!107253 e!107254)))

(assert (=> b!163463 (= c!30085 (validKeyInArray!0 (select (arr!2981 (_keys!5162 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163464 () Bool)

(assert (=> b!163464 (= e!107254 call!17305)))

(assert (= (and d!51443 (not res!77362)) b!163461))

(assert (= (and b!163461 res!77361) b!163460))

(assert (= (and b!163461 res!77360) b!163463))

(assert (= (and b!163463 c!30085) b!163464))

(assert (= (and b!163463 (not c!30085)) b!163462))

(assert (= (or b!163464 b!163462) bm!17302))

(declare-fun m!194131 () Bool)

(assert (=> b!163460 m!194131))

(assert (=> b!163460 m!194131))

(declare-fun m!194133 () Bool)

(assert (=> b!163460 m!194133))

(assert (=> b!163461 m!194131))

(assert (=> b!163461 m!194131))

(declare-fun m!194135 () Bool)

(assert (=> b!163461 m!194135))

(assert (=> bm!17302 m!194131))

(declare-fun m!194137 () Bool)

(assert (=> bm!17302 m!194137))

(assert (=> b!163463 m!194131))

(assert (=> b!163463 m!194131))

(assert (=> b!163463 m!194135))

(assert (=> b!163423 d!51443))

(declare-fun b!163473 () Bool)

(declare-fun res!77371 () Bool)

(declare-fun e!107257 () Bool)

(assert (=> b!163473 (=> (not res!77371) (not e!107257))))

(assert (=> b!163473 (= res!77371 (and (= (size!3268 (_values!3334 thiss!1248)) (bvadd (mask!8007 thiss!1248) #b00000000000000000000000000000001)) (= (size!3267 (_keys!5162 thiss!1248)) (size!3268 (_values!3334 thiss!1248))) (bvsge (_size!958 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!958 thiss!1248) (bvadd (mask!8007 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!163474 () Bool)

(declare-fun res!77373 () Bool)

(assert (=> b!163474 (=> (not res!77373) (not e!107257))))

(declare-fun size!3271 (LongMapFixedSize!1818) (_ BitVec 32))

(assert (=> b!163474 (= res!77373 (bvsge (size!3271 thiss!1248) (_size!958 thiss!1248)))))

(declare-fun b!163475 () Bool)

(declare-fun res!77372 () Bool)

(assert (=> b!163475 (=> (not res!77372) (not e!107257))))

(assert (=> b!163475 (= res!77372 (= (size!3271 thiss!1248) (bvadd (_size!958 thiss!1248) (bvsdiv (bvadd (extraKeys!3092 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!163476 () Bool)

(assert (=> b!163476 (= e!107257 (and (bvsge (extraKeys!3092 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3092 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!958 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!51445 () Bool)

(declare-fun res!77374 () Bool)

(assert (=> d!51445 (=> (not res!77374) (not e!107257))))

(assert (=> d!51445 (= res!77374 (validMask!0 (mask!8007 thiss!1248)))))

(assert (=> d!51445 (= (simpleValid!122 thiss!1248) e!107257)))

(assert (= (and d!51445 res!77374) b!163473))

(assert (= (and b!163473 res!77371) b!163474))

(assert (= (and b!163474 res!77373) b!163475))

(assert (= (and b!163475 res!77372) b!163476))

(declare-fun m!194139 () Bool)

(assert (=> b!163474 m!194139))

(assert (=> b!163475 m!194139))

(assert (=> d!51445 m!194089))

(assert (=> d!51437 d!51445))

(declare-fun b!163489 () Bool)

(declare-fun e!107265 () SeekEntryResult!400)

(assert (=> b!163489 (= e!107265 (Found!400 (index!3770 lt!82684)))))

(declare-fun b!163490 () Bool)

(declare-fun e!107266 () SeekEntryResult!400)

(assert (=> b!163490 (= e!107266 (MissingVacant!400 (index!3770 lt!82684)))))

(declare-fun b!163491 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163491 (= e!107266 (seekKeyOrZeroReturnVacant!0 (bvadd (x!18106 lt!82684) #b00000000000000000000000000000001) (nextIndex!0 (index!3770 lt!82684) (x!18106 lt!82684) (mask!8007 thiss!1248)) (index!3770 lt!82684) key!828 (_keys!5162 thiss!1248) (mask!8007 thiss!1248)))))

(declare-fun lt!82689 () SeekEntryResult!400)

(declare-fun d!51447 () Bool)

(assert (=> d!51447 (and (or ((_ is Undefined!400) lt!82689) (not ((_ is Found!400) lt!82689)) (and (bvsge (index!3769 lt!82689) #b00000000000000000000000000000000) (bvslt (index!3769 lt!82689) (size!3267 (_keys!5162 thiss!1248))))) (or ((_ is Undefined!400) lt!82689) ((_ is Found!400) lt!82689) (not ((_ is MissingVacant!400) lt!82689)) (not (= (index!3771 lt!82689) (index!3770 lt!82684))) (and (bvsge (index!3771 lt!82689) #b00000000000000000000000000000000) (bvslt (index!3771 lt!82689) (size!3267 (_keys!5162 thiss!1248))))) (or ((_ is Undefined!400) lt!82689) (ite ((_ is Found!400) lt!82689) (= (select (arr!2981 (_keys!5162 thiss!1248)) (index!3769 lt!82689)) key!828) (and ((_ is MissingVacant!400) lt!82689) (= (index!3771 lt!82689) (index!3770 lt!82684)) (= (select (arr!2981 (_keys!5162 thiss!1248)) (index!3771 lt!82689)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!107264 () SeekEntryResult!400)

(assert (=> d!51447 (= lt!82689 e!107264)))

(declare-fun c!30092 () Bool)

(assert (=> d!51447 (= c!30092 (bvsge (x!18106 lt!82684) #b01111111111111111111111111111110))))

(declare-fun lt!82690 () (_ BitVec 64))

(assert (=> d!51447 (= lt!82690 (select (arr!2981 (_keys!5162 thiss!1248)) (index!3770 lt!82684)))))

(assert (=> d!51447 (validMask!0 (mask!8007 thiss!1248))))

(assert (=> d!51447 (= (seekKeyOrZeroReturnVacant!0 (x!18106 lt!82684) (index!3770 lt!82684) (index!3770 lt!82684) key!828 (_keys!5162 thiss!1248) (mask!8007 thiss!1248)) lt!82689)))

(declare-fun b!163492 () Bool)

(declare-fun c!30093 () Bool)

(assert (=> b!163492 (= c!30093 (= lt!82690 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163492 (= e!107265 e!107266)))

(declare-fun b!163493 () Bool)

(assert (=> b!163493 (= e!107264 e!107265)))

(declare-fun c!30094 () Bool)

(assert (=> b!163493 (= c!30094 (= lt!82690 key!828))))

(declare-fun b!163494 () Bool)

(assert (=> b!163494 (= e!107264 Undefined!400)))

(assert (= (and d!51447 c!30092) b!163494))

(assert (= (and d!51447 (not c!30092)) b!163493))

(assert (= (and b!163493 c!30094) b!163489))

(assert (= (and b!163493 (not c!30094)) b!163492))

(assert (= (and b!163492 c!30093) b!163490))

(assert (= (and b!163492 (not c!30093)) b!163491))

(declare-fun m!194141 () Bool)

(assert (=> b!163491 m!194141))

(assert (=> b!163491 m!194141))

(declare-fun m!194143 () Bool)

(assert (=> b!163491 m!194143))

(declare-fun m!194145 () Bool)

(assert (=> d!51447 m!194145))

(declare-fun m!194147 () Bool)

(assert (=> d!51447 m!194147))

(assert (=> d!51447 m!194115))

(assert (=> d!51447 m!194089))

(assert (=> b!163440 d!51447))

(declare-fun b!163503 () Bool)

(declare-fun e!107275 () Bool)

(declare-fun call!17308 () Bool)

(assert (=> b!163503 (= e!107275 call!17308)))

(declare-fun b!163504 () Bool)

(declare-fun e!107273 () Bool)

(assert (=> b!163504 (= e!107273 e!107275)))

(declare-fun c!30097 () Bool)

(assert (=> b!163504 (= c!30097 (validKeyInArray!0 (select (arr!2981 (_keys!5162 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51449 () Bool)

(declare-fun res!77379 () Bool)

(assert (=> d!51449 (=> res!77379 e!107273)))

(assert (=> d!51449 (= res!77379 (bvsge #b00000000000000000000000000000000 (size!3267 (_keys!5162 thiss!1248))))))

(assert (=> d!51449 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5162 thiss!1248) (mask!8007 thiss!1248)) e!107273)))

(declare-fun b!163505 () Bool)

(declare-fun e!107274 () Bool)

(assert (=> b!163505 (= e!107275 e!107274)))

(declare-fun lt!82698 () (_ BitVec 64))

(assert (=> b!163505 (= lt!82698 (select (arr!2981 (_keys!5162 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5039 0))(
  ( (Unit!5040) )
))
(declare-fun lt!82697 () Unit!5039)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6281 (_ BitVec 64) (_ BitVec 32)) Unit!5039)

(assert (=> b!163505 (= lt!82697 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5162 thiss!1248) lt!82698 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!163505 (arrayContainsKey!0 (_keys!5162 thiss!1248) lt!82698 #b00000000000000000000000000000000)))

(declare-fun lt!82699 () Unit!5039)

(assert (=> b!163505 (= lt!82699 lt!82697)))

(declare-fun res!77380 () Bool)

(assert (=> b!163505 (= res!77380 (= (seekEntryOrOpen!0 (select (arr!2981 (_keys!5162 thiss!1248)) #b00000000000000000000000000000000) (_keys!5162 thiss!1248) (mask!8007 thiss!1248)) (Found!400 #b00000000000000000000000000000000)))))

(assert (=> b!163505 (=> (not res!77380) (not e!107274))))

(declare-fun bm!17305 () Bool)

(assert (=> bm!17305 (= call!17308 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5162 thiss!1248) (mask!8007 thiss!1248)))))

(declare-fun b!163506 () Bool)

(assert (=> b!163506 (= e!107274 call!17308)))

(assert (= (and d!51449 (not res!77379)) b!163504))

(assert (= (and b!163504 c!30097) b!163505))

(assert (= (and b!163504 (not c!30097)) b!163503))

(assert (= (and b!163505 res!77380) b!163506))

(assert (= (or b!163506 b!163503) bm!17305))

(assert (=> b!163504 m!194131))

(assert (=> b!163504 m!194131))

(assert (=> b!163504 m!194135))

(assert (=> b!163505 m!194131))

(declare-fun m!194149 () Bool)

(assert (=> b!163505 m!194149))

(declare-fun m!194151 () Bool)

(assert (=> b!163505 m!194151))

(assert (=> b!163505 m!194131))

(declare-fun m!194153 () Bool)

(assert (=> b!163505 m!194153))

(declare-fun m!194155 () Bool)

(assert (=> bm!17305 m!194155))

(assert (=> b!163422 d!51449))

(declare-fun b!163525 () Bool)

(declare-fun e!107287 () SeekEntryResult!400)

(assert (=> b!163525 (= e!107287 (Intermediate!400 true (toIndex!0 key!828 (mask!8007 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163526 () Bool)

(declare-fun e!107288 () Bool)

(declare-fun e!107286 () Bool)

(assert (=> b!163526 (= e!107288 e!107286)))

(declare-fun res!77388 () Bool)

(declare-fun lt!82704 () SeekEntryResult!400)

(assert (=> b!163526 (= res!77388 (and ((_ is Intermediate!400) lt!82704) (not (undefined!1212 lt!82704)) (bvslt (x!18106 lt!82704) #b01111111111111111111111111111110) (bvsge (x!18106 lt!82704) #b00000000000000000000000000000000) (bvsge (x!18106 lt!82704) #b00000000000000000000000000000000)))))

(assert (=> b!163526 (=> (not res!77388) (not e!107286))))

(declare-fun b!163527 () Bool)

(declare-fun e!107290 () SeekEntryResult!400)

(assert (=> b!163527 (= e!107290 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8007 thiss!1248)) #b00000000000000000000000000000000 (mask!8007 thiss!1248)) key!828 (_keys!5162 thiss!1248) (mask!8007 thiss!1248)))))

(declare-fun d!51451 () Bool)

(assert (=> d!51451 e!107288))

(declare-fun c!30105 () Bool)

(assert (=> d!51451 (= c!30105 (and ((_ is Intermediate!400) lt!82704) (undefined!1212 lt!82704)))))

(assert (=> d!51451 (= lt!82704 e!107287)))

(declare-fun c!30106 () Bool)

(assert (=> d!51451 (= c!30106 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!82705 () (_ BitVec 64))

(assert (=> d!51451 (= lt!82705 (select (arr!2981 (_keys!5162 thiss!1248)) (toIndex!0 key!828 (mask!8007 thiss!1248))))))

(assert (=> d!51451 (validMask!0 (mask!8007 thiss!1248))))

(assert (=> d!51451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8007 thiss!1248)) key!828 (_keys!5162 thiss!1248) (mask!8007 thiss!1248)) lt!82704)))

(declare-fun b!163528 () Bool)

(assert (=> b!163528 (= e!107290 (Intermediate!400 false (toIndex!0 key!828 (mask!8007 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163529 () Bool)

(assert (=> b!163529 (and (bvsge (index!3770 lt!82704) #b00000000000000000000000000000000) (bvslt (index!3770 lt!82704) (size!3267 (_keys!5162 thiss!1248))))))

(declare-fun res!77387 () Bool)

(assert (=> b!163529 (= res!77387 (= (select (arr!2981 (_keys!5162 thiss!1248)) (index!3770 lt!82704)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107289 () Bool)

(assert (=> b!163529 (=> res!77387 e!107289)))

(declare-fun b!163530 () Bool)

(assert (=> b!163530 (= e!107288 (bvsge (x!18106 lt!82704) #b01111111111111111111111111111110))))

(declare-fun b!163531 () Bool)

(assert (=> b!163531 (and (bvsge (index!3770 lt!82704) #b00000000000000000000000000000000) (bvslt (index!3770 lt!82704) (size!3267 (_keys!5162 thiss!1248))))))

(declare-fun res!77389 () Bool)

(assert (=> b!163531 (= res!77389 (= (select (arr!2981 (_keys!5162 thiss!1248)) (index!3770 lt!82704)) key!828))))

(assert (=> b!163531 (=> res!77389 e!107289)))

(assert (=> b!163531 (= e!107286 e!107289)))

(declare-fun b!163532 () Bool)

(assert (=> b!163532 (= e!107287 e!107290)))

(declare-fun c!30104 () Bool)

(assert (=> b!163532 (= c!30104 (or (= lt!82705 key!828) (= (bvadd lt!82705 lt!82705) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!163533 () Bool)

(assert (=> b!163533 (and (bvsge (index!3770 lt!82704) #b00000000000000000000000000000000) (bvslt (index!3770 lt!82704) (size!3267 (_keys!5162 thiss!1248))))))

(assert (=> b!163533 (= e!107289 (= (select (arr!2981 (_keys!5162 thiss!1248)) (index!3770 lt!82704)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!51451 c!30106) b!163525))

(assert (= (and d!51451 (not c!30106)) b!163532))

(assert (= (and b!163532 c!30104) b!163528))

(assert (= (and b!163532 (not c!30104)) b!163527))

(assert (= (and d!51451 c!30105) b!163530))

(assert (= (and d!51451 (not c!30105)) b!163526))

(assert (= (and b!163526 res!77388) b!163531))

(assert (= (and b!163531 (not res!77389)) b!163529))

(assert (= (and b!163529 (not res!77387)) b!163533))

(assert (=> d!51451 m!194119))

(declare-fun m!194157 () Bool)

(assert (=> d!51451 m!194157))

(assert (=> d!51451 m!194089))

(declare-fun m!194159 () Bool)

(assert (=> b!163533 m!194159))

(assert (=> b!163531 m!194159))

(assert (=> b!163527 m!194119))

(declare-fun m!194161 () Bool)

(assert (=> b!163527 m!194161))

(assert (=> b!163527 m!194161))

(declare-fun m!194163 () Bool)

(assert (=> b!163527 m!194163))

(assert (=> b!163529 m!194159))

(assert (=> d!51441 d!51451))

(declare-fun d!51453 () Bool)

(declare-fun lt!82711 () (_ BitVec 32))

(declare-fun lt!82710 () (_ BitVec 32))

(assert (=> d!51453 (= lt!82711 (bvmul (bvxor lt!82710 (bvlshr lt!82710 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51453 (= lt!82710 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51453 (and (bvsge (mask!8007 thiss!1248) #b00000000000000000000000000000000) (let ((res!77390 (let ((h!2603 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!18123 (bvmul (bvxor h!2603 (bvlshr h!2603 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!18123 (bvlshr x!18123 #b00000000000000000000000000001101)) (mask!8007 thiss!1248)))))) (and (bvslt res!77390 (bvadd (mask!8007 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!77390 #b00000000000000000000000000000000))))))

(assert (=> d!51453 (= (toIndex!0 key!828 (mask!8007 thiss!1248)) (bvand (bvxor lt!82711 (bvlshr lt!82711 #b00000000000000000000000000001101)) (mask!8007 thiss!1248)))))

(assert (=> d!51441 d!51453))

(assert (=> d!51441 d!51439))

(declare-fun b!163542 () Bool)

(declare-fun e!107295 () (_ BitVec 32))

(assert (=> b!163542 (= e!107295 #b00000000000000000000000000000000)))

(declare-fun b!163543 () Bool)

(declare-fun e!107296 () (_ BitVec 32))

(declare-fun call!17311 () (_ BitVec 32))

(assert (=> b!163543 (= e!107296 (bvadd #b00000000000000000000000000000001 call!17311))))

(declare-fun d!51455 () Bool)

(declare-fun lt!82714 () (_ BitVec 32))

(assert (=> d!51455 (and (bvsge lt!82714 #b00000000000000000000000000000000) (bvsle lt!82714 (bvsub (size!3267 (_keys!5162 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51455 (= lt!82714 e!107295)))

(declare-fun c!30112 () Bool)

(assert (=> d!51455 (= c!30112 (bvsge #b00000000000000000000000000000000 (size!3267 (_keys!5162 thiss!1248))))))

(assert (=> d!51455 (and (bvsle #b00000000000000000000000000000000 (size!3267 (_keys!5162 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3267 (_keys!5162 thiss!1248)) (size!3267 (_keys!5162 thiss!1248))))))

(assert (=> d!51455 (= (arrayCountValidKeys!0 (_keys!5162 thiss!1248) #b00000000000000000000000000000000 (size!3267 (_keys!5162 thiss!1248))) lt!82714)))

(declare-fun b!163544 () Bool)

(assert (=> b!163544 (= e!107296 call!17311)))

(declare-fun bm!17308 () Bool)

(assert (=> bm!17308 (= call!17311 (arrayCountValidKeys!0 (_keys!5162 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3267 (_keys!5162 thiss!1248))))))

(declare-fun b!163545 () Bool)

(assert (=> b!163545 (= e!107295 e!107296)))

(declare-fun c!30111 () Bool)

(assert (=> b!163545 (= c!30111 (validKeyInArray!0 (select (arr!2981 (_keys!5162 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51455 c!30112) b!163542))

(assert (= (and d!51455 (not c!30112)) b!163545))

(assert (= (and b!163545 c!30111) b!163543))

(assert (= (and b!163545 (not c!30111)) b!163544))

(assert (= (or b!163543 b!163544) bm!17308))

(declare-fun m!194165 () Bool)

(assert (=> bm!17308 m!194165))

(assert (=> b!163545 m!194131))

(assert (=> b!163545 m!194131))

(assert (=> b!163545 m!194135))

(assert (=> b!163421 d!51455))

(declare-fun b!163546 () Bool)

(declare-fun e!107297 () Bool)

(assert (=> b!163546 (= e!107297 tp_is_empty!3597)))

(declare-fun b!163547 () Bool)

(declare-fun e!107298 () Bool)

(assert (=> b!163547 (= e!107298 tp_is_empty!3597)))

(declare-fun condMapEmpty!6104 () Bool)

(declare-fun mapDefault!6104 () ValueCell!1455)

(assert (=> mapNonEmpty!6103 (= condMapEmpty!6104 (= mapRest!6103 ((as const (Array (_ BitVec 32) ValueCell!1455)) mapDefault!6104)))))

(declare-fun mapRes!6104 () Bool)

(assert (=> mapNonEmpty!6103 (= tp!13978 (and e!107298 mapRes!6104))))

(declare-fun mapIsEmpty!6104 () Bool)

(assert (=> mapIsEmpty!6104 mapRes!6104))

(declare-fun mapNonEmpty!6104 () Bool)

(declare-fun tp!13979 () Bool)

(assert (=> mapNonEmpty!6104 (= mapRes!6104 (and tp!13979 e!107297))))

(declare-fun mapValue!6104 () ValueCell!1455)

(declare-fun mapRest!6104 () (Array (_ BitVec 32) ValueCell!1455))

(declare-fun mapKey!6104 () (_ BitVec 32))

(assert (=> mapNonEmpty!6104 (= mapRest!6103 (store mapRest!6104 mapKey!6104 mapValue!6104))))

(assert (= (and mapNonEmpty!6103 condMapEmpty!6104) mapIsEmpty!6104))

(assert (= (and mapNonEmpty!6103 (not condMapEmpty!6104)) mapNonEmpty!6104))

(assert (= (and mapNonEmpty!6104 ((_ is ValueCellFull!1455) mapValue!6104)) b!163546))

(assert (= (and mapNonEmpty!6103 ((_ is ValueCellFull!1455) mapDefault!6104)) b!163547))

(declare-fun m!194167 () Bool)

(assert (=> mapNonEmpty!6104 m!194167))

(check-sat (not b!163460) (not b!163505) (not mapNonEmpty!6104) (not b!163491) (not b!163527) (not d!51451) (not b!163545) (not b!163463) (not b!163504) (not d!51445) (not b!163474) b_and!10209 (not b!163475) (not d!51447) (not b_next!3795) tp_is_empty!3597 (not b!163461) (not bm!17302) (not bm!17305) (not bm!17308))
(check-sat b_and!10209 (not b_next!3795))
