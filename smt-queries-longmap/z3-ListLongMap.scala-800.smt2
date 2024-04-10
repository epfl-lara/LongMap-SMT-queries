; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19224 () Bool)

(assert start!19224)

(declare-fun b!189147 () Bool)

(declare-fun b_free!4641 () Bool)

(declare-fun b_next!4641 () Bool)

(assert (=> b!189147 (= b_free!4641 (not b_next!4641))))

(declare-fun tp!16753 () Bool)

(declare-fun b_and!11277 () Bool)

(assert (=> b!189147 (= tp!16753 b_and!11277)))

(declare-fun mapIsEmpty!7612 () Bool)

(declare-fun mapRes!7612 () Bool)

(assert (=> mapIsEmpty!7612 mapRes!7612))

(declare-fun b!189143 () Bool)

(declare-fun e!124482 () Bool)

(declare-fun tp_is_empty!4413 () Bool)

(assert (=> b!189143 (= e!124482 tp_is_empty!4413)))

(declare-fun b!189144 () Bool)

(declare-fun e!124477 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!189144 (= e!124477 (not (validKeyInArray!0 key!828)))))

(declare-fun b!189145 () Bool)

(declare-datatypes ((Unit!5703 0))(
  ( (Unit!5704) )
))
(declare-fun e!124478 () Unit!5703)

(declare-fun lt!93617 () Unit!5703)

(assert (=> b!189145 (= e!124478 lt!93617)))

(declare-datatypes ((V!5531 0))(
  ( (V!5532 (val!2251 Int)) )
))
(declare-datatypes ((ValueCell!1863 0))(
  ( (ValueCellFull!1863 (v!4171 V!5531)) (EmptyCell!1863) )
))
(declare-datatypes ((array!8053 0))(
  ( (array!8054 (arr!3797 (Array (_ BitVec 32) (_ BitVec 64))) (size!4117 (_ BitVec 32))) )
))
(declare-datatypes ((array!8055 0))(
  ( (array!8056 (arr!3798 (Array (_ BitVec 32) ValueCell!1863)) (size!4118 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2634 0))(
  ( (LongMapFixedSize!2635 (defaultEntry!3858 Int) (mask!9039 (_ BitVec 32)) (extraKeys!3595 (_ BitVec 32)) (zeroValue!3699 V!5531) (minValue!3699 V!5531) (_size!1366 (_ BitVec 32)) (_keys!5823 array!8053) (_values!3841 array!8055) (_vacant!1366 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2634)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!161 (array!8053 array!8055 (_ BitVec 32) (_ BitVec 32) V!5531 V!5531 (_ BitVec 64) Int) Unit!5703)

(assert (=> b!189145 (= lt!93617 (lemmaInListMapThenSeekEntryOrOpenFindsIt!161 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) key!828 (defaultEntry!3858 thiss!1248)))))

(declare-fun res!89425 () Bool)

(declare-datatypes ((SeekEntryResult!660 0))(
  ( (MissingZero!660 (index!4810 (_ BitVec 32))) (Found!660 (index!4811 (_ BitVec 32))) (Intermediate!660 (undefined!1472 Bool) (index!4812 (_ BitVec 32)) (x!20400 (_ BitVec 32))) (Undefined!660) (MissingVacant!660 (index!4813 (_ BitVec 32))) )
))
(declare-fun lt!93616 () SeekEntryResult!660)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189145 (= res!89425 (inRange!0 (index!4811 lt!93616) (mask!9039 thiss!1248)))))

(declare-fun e!124473 () Bool)

(assert (=> b!189145 (=> (not res!89425) (not e!124473))))

(assert (=> b!189145 e!124473))

(declare-fun b!189146 () Bool)

(declare-fun e!124476 () Bool)

(declare-fun e!124480 () Bool)

(assert (=> b!189146 (= e!124476 e!124480)))

(declare-fun res!89424 () Bool)

(assert (=> b!189146 (=> (not res!89424) (not e!124480))))

(get-info :version)

(assert (=> b!189146 (= res!89424 (and (not ((_ is Undefined!660) lt!93616)) (not ((_ is MissingVacant!660) lt!93616)) (not ((_ is MissingZero!660) lt!93616)) ((_ is Found!660) lt!93616)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8053 (_ BitVec 32)) SeekEntryResult!660)

(assert (=> b!189146 (= lt!93616 (seekEntryOrOpen!0 key!828 (_keys!5823 thiss!1248) (mask!9039 thiss!1248)))))

(declare-fun e!124481 () Bool)

(declare-fun e!124479 () Bool)

(declare-fun array_inv!2461 (array!8053) Bool)

(declare-fun array_inv!2462 (array!8055) Bool)

(assert (=> b!189147 (= e!124481 (and tp!16753 tp_is_empty!4413 (array_inv!2461 (_keys!5823 thiss!1248)) (array_inv!2462 (_values!3841 thiss!1248)) e!124479))))

(declare-fun b!189148 () Bool)

(assert (=> b!189148 (= e!124473 (= (select (arr!3797 (_keys!5823 thiss!1248)) (index!4811 lt!93616)) key!828))))

(declare-fun b!189149 () Bool)

(declare-fun res!89431 () Bool)

(assert (=> b!189149 (=> (not res!89431) (not e!124476))))

(assert (=> b!189149 (= res!89431 (not (= key!828 (bvneg key!828))))))

(declare-fun res!89428 () Bool)

(assert (=> start!19224 (=> (not res!89428) (not e!124476))))

(declare-fun valid!1083 (LongMapFixedSize!2634) Bool)

(assert (=> start!19224 (= res!89428 (valid!1083 thiss!1248))))

(assert (=> start!19224 e!124476))

(assert (=> start!19224 e!124481))

(assert (=> start!19224 true))

(declare-fun mapNonEmpty!7612 () Bool)

(declare-fun tp!16752 () Bool)

(declare-fun e!124474 () Bool)

(assert (=> mapNonEmpty!7612 (= mapRes!7612 (and tp!16752 e!124474))))

(declare-fun mapKey!7612 () (_ BitVec 32))

(declare-fun mapValue!7612 () ValueCell!1863)

(declare-fun mapRest!7612 () (Array (_ BitVec 32) ValueCell!1863))

(assert (=> mapNonEmpty!7612 (= (arr!3798 (_values!3841 thiss!1248)) (store mapRest!7612 mapKey!7612 mapValue!7612))))

(declare-fun b!189150 () Bool)

(declare-fun res!89430 () Bool)

(assert (=> b!189150 (=> (not res!89430) (not e!124477))))

(assert (=> b!189150 (= res!89430 (and (= (size!4118 (_values!3841 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9039 thiss!1248))) (= (size!4117 (_keys!5823 thiss!1248)) (size!4118 (_values!3841 thiss!1248))) (bvsge (mask!9039 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3595 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3595 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!189151 () Bool)

(assert (=> b!189151 (= e!124480 e!124477)))

(declare-fun res!89429 () Bool)

(assert (=> b!189151 (=> (not res!89429) (not e!124477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!189151 (= res!89429 (validMask!0 (mask!9039 thiss!1248)))))

(declare-fun lt!93614 () Unit!5703)

(assert (=> b!189151 (= lt!93614 e!124478)))

(declare-fun c!33992 () Bool)

(declare-datatypes ((tuple2!3504 0))(
  ( (tuple2!3505 (_1!1763 (_ BitVec 64)) (_2!1763 V!5531)) )
))
(declare-datatypes ((List!2403 0))(
  ( (Nil!2400) (Cons!2399 (h!3036 tuple2!3504) (t!7305 List!2403)) )
))
(declare-datatypes ((ListLongMap!2421 0))(
  ( (ListLongMap!2422 (toList!1226 List!2403)) )
))
(declare-fun contains!1332 (ListLongMap!2421 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!874 (array!8053 array!8055 (_ BitVec 32) (_ BitVec 32) V!5531 V!5531 (_ BitVec 32) Int) ListLongMap!2421)

(assert (=> b!189151 (= c!33992 (contains!1332 (getCurrentListMap!874 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3858 thiss!1248)) key!828))))

(declare-fun b!189152 () Bool)

(assert (=> b!189152 (= e!124474 tp_is_empty!4413)))

(declare-fun b!189153 () Bool)

(declare-fun res!89423 () Bool)

(assert (=> b!189153 (=> (not res!89423) (not e!124477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8053 (_ BitVec 32)) Bool)

(assert (=> b!189153 (= res!89423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5823 thiss!1248) (mask!9039 thiss!1248)))))

(declare-fun b!189154 () Bool)

(declare-fun Unit!5705 () Unit!5703)

(assert (=> b!189154 (= e!124478 Unit!5705)))

(declare-fun lt!93615 () Unit!5703)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!164 (array!8053 array!8055 (_ BitVec 32) (_ BitVec 32) V!5531 V!5531 (_ BitVec 64) Int) Unit!5703)

(assert (=> b!189154 (= lt!93615 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!164 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) key!828 (defaultEntry!3858 thiss!1248)))))

(assert (=> b!189154 false))

(declare-fun b!189155 () Bool)

(declare-fun res!89427 () Bool)

(assert (=> b!189155 (=> (not res!89427) (not e!124477))))

(assert (=> b!189155 (= res!89427 (and (bvsge (index!4811 lt!93616) #b00000000000000000000000000000000) (bvslt (index!4811 lt!93616) (size!4117 (_keys!5823 thiss!1248)))))))

(declare-fun b!189156 () Bool)

(declare-fun res!89426 () Bool)

(assert (=> b!189156 (=> (not res!89426) (not e!124477))))

(declare-datatypes ((List!2404 0))(
  ( (Nil!2401) (Cons!2400 (h!3037 (_ BitVec 64)) (t!7306 List!2404)) )
))
(declare-fun arrayNoDuplicates!0 (array!8053 (_ BitVec 32) List!2404) Bool)

(assert (=> b!189156 (= res!89426 (arrayNoDuplicates!0 (_keys!5823 thiss!1248) #b00000000000000000000000000000000 Nil!2401))))

(declare-fun b!189157 () Bool)

(assert (=> b!189157 (= e!124479 (and e!124482 mapRes!7612))))

(declare-fun condMapEmpty!7612 () Bool)

(declare-fun mapDefault!7612 () ValueCell!1863)

(assert (=> b!189157 (= condMapEmpty!7612 (= (arr!3798 (_values!3841 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1863)) mapDefault!7612)))))

(assert (= (and start!19224 res!89428) b!189149))

(assert (= (and b!189149 res!89431) b!189146))

(assert (= (and b!189146 res!89424) b!189151))

(assert (= (and b!189151 c!33992) b!189145))

(assert (= (and b!189151 (not c!33992)) b!189154))

(assert (= (and b!189145 res!89425) b!189148))

(assert (= (and b!189151 res!89429) b!189150))

(assert (= (and b!189150 res!89430) b!189153))

(assert (= (and b!189153 res!89423) b!189156))

(assert (= (and b!189156 res!89426) b!189155))

(assert (= (and b!189155 res!89427) b!189144))

(assert (= (and b!189157 condMapEmpty!7612) mapIsEmpty!7612))

(assert (= (and b!189157 (not condMapEmpty!7612)) mapNonEmpty!7612))

(assert (= (and mapNonEmpty!7612 ((_ is ValueCellFull!1863) mapValue!7612)) b!189152))

(assert (= (and b!189157 ((_ is ValueCellFull!1863) mapDefault!7612)) b!189143))

(assert (= b!189147 b!189157))

(assert (= start!19224 b!189147))

(declare-fun m!215577 () Bool)

(assert (=> b!189145 m!215577))

(declare-fun m!215579 () Bool)

(assert (=> b!189145 m!215579))

(declare-fun m!215581 () Bool)

(assert (=> b!189154 m!215581))

(declare-fun m!215583 () Bool)

(assert (=> b!189144 m!215583))

(declare-fun m!215585 () Bool)

(assert (=> mapNonEmpty!7612 m!215585))

(declare-fun m!215587 () Bool)

(assert (=> b!189148 m!215587))

(declare-fun m!215589 () Bool)

(assert (=> b!189156 m!215589))

(declare-fun m!215591 () Bool)

(assert (=> start!19224 m!215591))

(declare-fun m!215593 () Bool)

(assert (=> b!189146 m!215593))

(declare-fun m!215595 () Bool)

(assert (=> b!189151 m!215595))

(declare-fun m!215597 () Bool)

(assert (=> b!189151 m!215597))

(assert (=> b!189151 m!215597))

(declare-fun m!215599 () Bool)

(assert (=> b!189151 m!215599))

(declare-fun m!215601 () Bool)

(assert (=> b!189147 m!215601))

(declare-fun m!215603 () Bool)

(assert (=> b!189147 m!215603))

(declare-fun m!215605 () Bool)

(assert (=> b!189153 m!215605))

(check-sat (not b_next!4641) (not b!189147) (not b!189145) (not start!19224) tp_is_empty!4413 (not b!189144) (not b!189156) (not b!189153) b_and!11277 (not mapNonEmpty!7612) (not b!189151) (not b!189154) (not b!189146))
(check-sat b_and!11277 (not b_next!4641))
(get-model)

(declare-fun lt!93638 () SeekEntryResult!660)

(declare-fun e!124521 () SeekEntryResult!660)

(declare-fun b!189215 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8053 (_ BitVec 32)) SeekEntryResult!660)

(assert (=> b!189215 (= e!124521 (seekKeyOrZeroReturnVacant!0 (x!20400 lt!93638) (index!4812 lt!93638) (index!4812 lt!93638) key!828 (_keys!5823 thiss!1248) (mask!9039 thiss!1248)))))

(declare-fun b!189216 () Bool)

(declare-fun e!124520 () SeekEntryResult!660)

(assert (=> b!189216 (= e!124520 Undefined!660)))

(declare-fun b!189217 () Bool)

(declare-fun e!124519 () SeekEntryResult!660)

(assert (=> b!189217 (= e!124519 (Found!660 (index!4812 lt!93638)))))

(declare-fun b!189218 () Bool)

(assert (=> b!189218 (= e!124520 e!124519)))

(declare-fun lt!93637 () (_ BitVec 64))

(assert (=> b!189218 (= lt!93637 (select (arr!3797 (_keys!5823 thiss!1248)) (index!4812 lt!93638)))))

(declare-fun c!34004 () Bool)

(assert (=> b!189218 (= c!34004 (= lt!93637 key!828))))

(declare-fun b!189219 () Bool)

(assert (=> b!189219 (= e!124521 (MissingZero!660 (index!4812 lt!93638)))))

(declare-fun d!55687 () Bool)

(declare-fun lt!93636 () SeekEntryResult!660)

(assert (=> d!55687 (and (or ((_ is Undefined!660) lt!93636) (not ((_ is Found!660) lt!93636)) (and (bvsge (index!4811 lt!93636) #b00000000000000000000000000000000) (bvslt (index!4811 lt!93636) (size!4117 (_keys!5823 thiss!1248))))) (or ((_ is Undefined!660) lt!93636) ((_ is Found!660) lt!93636) (not ((_ is MissingZero!660) lt!93636)) (and (bvsge (index!4810 lt!93636) #b00000000000000000000000000000000) (bvslt (index!4810 lt!93636) (size!4117 (_keys!5823 thiss!1248))))) (or ((_ is Undefined!660) lt!93636) ((_ is Found!660) lt!93636) ((_ is MissingZero!660) lt!93636) (not ((_ is MissingVacant!660) lt!93636)) (and (bvsge (index!4813 lt!93636) #b00000000000000000000000000000000) (bvslt (index!4813 lt!93636) (size!4117 (_keys!5823 thiss!1248))))) (or ((_ is Undefined!660) lt!93636) (ite ((_ is Found!660) lt!93636) (= (select (arr!3797 (_keys!5823 thiss!1248)) (index!4811 lt!93636)) key!828) (ite ((_ is MissingZero!660) lt!93636) (= (select (arr!3797 (_keys!5823 thiss!1248)) (index!4810 lt!93636)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!660) lt!93636) (= (select (arr!3797 (_keys!5823 thiss!1248)) (index!4813 lt!93636)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55687 (= lt!93636 e!124520)))

(declare-fun c!34002 () Bool)

(assert (=> d!55687 (= c!34002 (and ((_ is Intermediate!660) lt!93638) (undefined!1472 lt!93638)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8053 (_ BitVec 32)) SeekEntryResult!660)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55687 (= lt!93638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9039 thiss!1248)) key!828 (_keys!5823 thiss!1248) (mask!9039 thiss!1248)))))

(assert (=> d!55687 (validMask!0 (mask!9039 thiss!1248))))

(assert (=> d!55687 (= (seekEntryOrOpen!0 key!828 (_keys!5823 thiss!1248) (mask!9039 thiss!1248)) lt!93636)))

(declare-fun b!189220 () Bool)

(declare-fun c!34003 () Bool)

(assert (=> b!189220 (= c!34003 (= lt!93637 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189220 (= e!124519 e!124521)))

(assert (= (and d!55687 c!34002) b!189216))

(assert (= (and d!55687 (not c!34002)) b!189218))

(assert (= (and b!189218 c!34004) b!189217))

(assert (= (and b!189218 (not c!34004)) b!189220))

(assert (= (and b!189220 c!34003) b!189219))

(assert (= (and b!189220 (not c!34003)) b!189215))

(declare-fun m!215637 () Bool)

(assert (=> b!189215 m!215637))

(declare-fun m!215639 () Bool)

(assert (=> b!189218 m!215639))

(declare-fun m!215641 () Bool)

(assert (=> d!55687 m!215641))

(assert (=> d!55687 m!215595))

(declare-fun m!215643 () Bool)

(assert (=> d!55687 m!215643))

(declare-fun m!215645 () Bool)

(assert (=> d!55687 m!215645))

(declare-fun m!215647 () Bool)

(assert (=> d!55687 m!215647))

(assert (=> d!55687 m!215647))

(declare-fun m!215649 () Bool)

(assert (=> d!55687 m!215649))

(assert (=> b!189146 d!55687))

(declare-fun b!189231 () Bool)

(declare-fun e!124530 () Bool)

(declare-fun contains!1333 (List!2404 (_ BitVec 64)) Bool)

(assert (=> b!189231 (= e!124530 (contains!1333 Nil!2401 (select (arr!3797 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19069 () Bool)

(declare-fun call!19072 () Bool)

(declare-fun c!34007 () Bool)

(assert (=> bm!19069 (= call!19072 (arrayNoDuplicates!0 (_keys!5823 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34007 (Cons!2400 (select (arr!3797 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000) Nil!2401) Nil!2401)))))

(declare-fun d!55689 () Bool)

(declare-fun res!89466 () Bool)

(declare-fun e!124531 () Bool)

(assert (=> d!55689 (=> res!89466 e!124531)))

(assert (=> d!55689 (= res!89466 (bvsge #b00000000000000000000000000000000 (size!4117 (_keys!5823 thiss!1248))))))

(assert (=> d!55689 (= (arrayNoDuplicates!0 (_keys!5823 thiss!1248) #b00000000000000000000000000000000 Nil!2401) e!124531)))

(declare-fun b!189232 () Bool)

(declare-fun e!124533 () Bool)

(assert (=> b!189232 (= e!124531 e!124533)))

(declare-fun res!89465 () Bool)

(assert (=> b!189232 (=> (not res!89465) (not e!124533))))

(assert (=> b!189232 (= res!89465 (not e!124530))))

(declare-fun res!89467 () Bool)

(assert (=> b!189232 (=> (not res!89467) (not e!124530))))

(assert (=> b!189232 (= res!89467 (validKeyInArray!0 (select (arr!3797 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189233 () Bool)

(declare-fun e!124532 () Bool)

(assert (=> b!189233 (= e!124532 call!19072)))

(declare-fun b!189234 () Bool)

(assert (=> b!189234 (= e!124532 call!19072)))

(declare-fun b!189235 () Bool)

(assert (=> b!189235 (= e!124533 e!124532)))

(assert (=> b!189235 (= c!34007 (validKeyInArray!0 (select (arr!3797 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55689 (not res!89466)) b!189232))

(assert (= (and b!189232 res!89467) b!189231))

(assert (= (and b!189232 res!89465) b!189235))

(assert (= (and b!189235 c!34007) b!189234))

(assert (= (and b!189235 (not c!34007)) b!189233))

(assert (= (or b!189234 b!189233) bm!19069))

(declare-fun m!215651 () Bool)

(assert (=> b!189231 m!215651))

(assert (=> b!189231 m!215651))

(declare-fun m!215653 () Bool)

(assert (=> b!189231 m!215653))

(assert (=> bm!19069 m!215651))

(declare-fun m!215655 () Bool)

(assert (=> bm!19069 m!215655))

(assert (=> b!189232 m!215651))

(assert (=> b!189232 m!215651))

(declare-fun m!215657 () Bool)

(assert (=> b!189232 m!215657))

(assert (=> b!189235 m!215651))

(assert (=> b!189235 m!215651))

(assert (=> b!189235 m!215657))

(assert (=> b!189156 d!55689))

(declare-fun d!55691 () Bool)

(assert (=> d!55691 (= (validMask!0 (mask!9039 thiss!1248)) (and (or (= (mask!9039 thiss!1248) #b00000000000000000000000000000111) (= (mask!9039 thiss!1248) #b00000000000000000000000000001111) (= (mask!9039 thiss!1248) #b00000000000000000000000000011111) (= (mask!9039 thiss!1248) #b00000000000000000000000000111111) (= (mask!9039 thiss!1248) #b00000000000000000000000001111111) (= (mask!9039 thiss!1248) #b00000000000000000000000011111111) (= (mask!9039 thiss!1248) #b00000000000000000000000111111111) (= (mask!9039 thiss!1248) #b00000000000000000000001111111111) (= (mask!9039 thiss!1248) #b00000000000000000000011111111111) (= (mask!9039 thiss!1248) #b00000000000000000000111111111111) (= (mask!9039 thiss!1248) #b00000000000000000001111111111111) (= (mask!9039 thiss!1248) #b00000000000000000011111111111111) (= (mask!9039 thiss!1248) #b00000000000000000111111111111111) (= (mask!9039 thiss!1248) #b00000000000000001111111111111111) (= (mask!9039 thiss!1248) #b00000000000000011111111111111111) (= (mask!9039 thiss!1248) #b00000000000000111111111111111111) (= (mask!9039 thiss!1248) #b00000000000001111111111111111111) (= (mask!9039 thiss!1248) #b00000000000011111111111111111111) (= (mask!9039 thiss!1248) #b00000000000111111111111111111111) (= (mask!9039 thiss!1248) #b00000000001111111111111111111111) (= (mask!9039 thiss!1248) #b00000000011111111111111111111111) (= (mask!9039 thiss!1248) #b00000000111111111111111111111111) (= (mask!9039 thiss!1248) #b00000001111111111111111111111111) (= (mask!9039 thiss!1248) #b00000011111111111111111111111111) (= (mask!9039 thiss!1248) #b00000111111111111111111111111111) (= (mask!9039 thiss!1248) #b00001111111111111111111111111111) (= (mask!9039 thiss!1248) #b00011111111111111111111111111111) (= (mask!9039 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9039 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!189151 d!55691))

(declare-fun d!55693 () Bool)

(declare-fun e!124539 () Bool)

(assert (=> d!55693 e!124539))

(declare-fun res!89470 () Bool)

(assert (=> d!55693 (=> res!89470 e!124539)))

(declare-fun lt!93647 () Bool)

(assert (=> d!55693 (= res!89470 (not lt!93647))))

(declare-fun lt!93649 () Bool)

(assert (=> d!55693 (= lt!93647 lt!93649)))

(declare-fun lt!93648 () Unit!5703)

(declare-fun e!124538 () Unit!5703)

(assert (=> d!55693 (= lt!93648 e!124538)))

(declare-fun c!34010 () Bool)

(assert (=> d!55693 (= c!34010 lt!93649)))

(declare-fun containsKey!237 (List!2403 (_ BitVec 64)) Bool)

(assert (=> d!55693 (= lt!93649 (containsKey!237 (toList!1226 (getCurrentListMap!874 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3858 thiss!1248))) key!828))))

(assert (=> d!55693 (= (contains!1332 (getCurrentListMap!874 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3858 thiss!1248)) key!828) lt!93647)))

(declare-fun b!189242 () Bool)

(declare-fun lt!93650 () Unit!5703)

(assert (=> b!189242 (= e!124538 lt!93650)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!185 (List!2403 (_ BitVec 64)) Unit!5703)

(assert (=> b!189242 (= lt!93650 (lemmaContainsKeyImpliesGetValueByKeyDefined!185 (toList!1226 (getCurrentListMap!874 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3858 thiss!1248))) key!828))))

(declare-datatypes ((Option!239 0))(
  ( (Some!238 (v!4173 V!5531)) (None!237) )
))
(declare-fun isDefined!186 (Option!239) Bool)

(declare-fun getValueByKey!233 (List!2403 (_ BitVec 64)) Option!239)

(assert (=> b!189242 (isDefined!186 (getValueByKey!233 (toList!1226 (getCurrentListMap!874 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3858 thiss!1248))) key!828))))

(declare-fun b!189243 () Bool)

(declare-fun Unit!5709 () Unit!5703)

(assert (=> b!189243 (= e!124538 Unit!5709)))

(declare-fun b!189244 () Bool)

(assert (=> b!189244 (= e!124539 (isDefined!186 (getValueByKey!233 (toList!1226 (getCurrentListMap!874 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3858 thiss!1248))) key!828)))))

(assert (= (and d!55693 c!34010) b!189242))

(assert (= (and d!55693 (not c!34010)) b!189243))

(assert (= (and d!55693 (not res!89470)) b!189244))

(declare-fun m!215659 () Bool)

(assert (=> d!55693 m!215659))

(declare-fun m!215661 () Bool)

(assert (=> b!189242 m!215661))

(declare-fun m!215663 () Bool)

(assert (=> b!189242 m!215663))

(assert (=> b!189242 m!215663))

(declare-fun m!215665 () Bool)

(assert (=> b!189242 m!215665))

(assert (=> b!189244 m!215663))

(assert (=> b!189244 m!215663))

(assert (=> b!189244 m!215665))

(assert (=> b!189151 d!55693))

(declare-fun b!189287 () Bool)

(declare-fun e!124570 () Bool)

(declare-fun e!124571 () Bool)

(assert (=> b!189287 (= e!124570 e!124571)))

(declare-fun res!89490 () Bool)

(assert (=> b!189287 (=> (not res!89490) (not e!124571))))

(declare-fun lt!93714 () ListLongMap!2421)

(assert (=> b!189287 (= res!89490 (contains!1332 lt!93714 (select (arr!3797 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189287 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4117 (_keys!5823 thiss!1248))))))

(declare-fun b!189288 () Bool)

(declare-fun e!124566 () Unit!5703)

(declare-fun Unit!5710 () Unit!5703)

(assert (=> b!189288 (= e!124566 Unit!5710)))

(declare-fun b!189289 () Bool)

(declare-fun e!124572 () ListLongMap!2421)

(declare-fun call!19087 () ListLongMap!2421)

(declare-fun +!296 (ListLongMap!2421 tuple2!3504) ListLongMap!2421)

(assert (=> b!189289 (= e!124572 (+!296 call!19087 (tuple2!3505 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3699 thiss!1248))))))

(declare-fun b!189290 () Bool)

(declare-fun e!124577 () Bool)

(declare-fun call!19089 () Bool)

(assert (=> b!189290 (= e!124577 (not call!19089))))

(declare-fun b!189291 () Bool)

(declare-fun e!124574 () Bool)

(assert (=> b!189291 (= e!124574 (validKeyInArray!0 (select (arr!3797 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189292 () Bool)

(declare-fun lt!93705 () Unit!5703)

(assert (=> b!189292 (= e!124566 lt!93705)))

(declare-fun lt!93697 () ListLongMap!2421)

(declare-fun getCurrentListMapNoExtraKeys!209 (array!8053 array!8055 (_ BitVec 32) (_ BitVec 32) V!5531 V!5531 (_ BitVec 32) Int) ListLongMap!2421)

(assert (=> b!189292 (= lt!93697 (getCurrentListMapNoExtraKeys!209 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3858 thiss!1248)))))

(declare-fun lt!93709 () (_ BitVec 64))

(assert (=> b!189292 (= lt!93709 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93696 () (_ BitVec 64))

(assert (=> b!189292 (= lt!93696 (select (arr!3797 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93701 () Unit!5703)

(declare-fun addStillContains!152 (ListLongMap!2421 (_ BitVec 64) V!5531 (_ BitVec 64)) Unit!5703)

(assert (=> b!189292 (= lt!93701 (addStillContains!152 lt!93697 lt!93709 (zeroValue!3699 thiss!1248) lt!93696))))

(assert (=> b!189292 (contains!1332 (+!296 lt!93697 (tuple2!3505 lt!93709 (zeroValue!3699 thiss!1248))) lt!93696)))

(declare-fun lt!93702 () Unit!5703)

(assert (=> b!189292 (= lt!93702 lt!93701)))

(declare-fun lt!93712 () ListLongMap!2421)

(assert (=> b!189292 (= lt!93712 (getCurrentListMapNoExtraKeys!209 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3858 thiss!1248)))))

(declare-fun lt!93711 () (_ BitVec 64))

(assert (=> b!189292 (= lt!93711 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93704 () (_ BitVec 64))

(assert (=> b!189292 (= lt!93704 (select (arr!3797 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93706 () Unit!5703)

(declare-fun addApplyDifferent!152 (ListLongMap!2421 (_ BitVec 64) V!5531 (_ BitVec 64)) Unit!5703)

(assert (=> b!189292 (= lt!93706 (addApplyDifferent!152 lt!93712 lt!93711 (minValue!3699 thiss!1248) lt!93704))))

(declare-fun apply!176 (ListLongMap!2421 (_ BitVec 64)) V!5531)

(assert (=> b!189292 (= (apply!176 (+!296 lt!93712 (tuple2!3505 lt!93711 (minValue!3699 thiss!1248))) lt!93704) (apply!176 lt!93712 lt!93704))))

(declare-fun lt!93713 () Unit!5703)

(assert (=> b!189292 (= lt!93713 lt!93706)))

(declare-fun lt!93700 () ListLongMap!2421)

(assert (=> b!189292 (= lt!93700 (getCurrentListMapNoExtraKeys!209 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3858 thiss!1248)))))

(declare-fun lt!93710 () (_ BitVec 64))

(assert (=> b!189292 (= lt!93710 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93703 () (_ BitVec 64))

(assert (=> b!189292 (= lt!93703 (select (arr!3797 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93707 () Unit!5703)

(assert (=> b!189292 (= lt!93707 (addApplyDifferent!152 lt!93700 lt!93710 (zeroValue!3699 thiss!1248) lt!93703))))

(assert (=> b!189292 (= (apply!176 (+!296 lt!93700 (tuple2!3505 lt!93710 (zeroValue!3699 thiss!1248))) lt!93703) (apply!176 lt!93700 lt!93703))))

(declare-fun lt!93695 () Unit!5703)

(assert (=> b!189292 (= lt!93695 lt!93707)))

(declare-fun lt!93708 () ListLongMap!2421)

(assert (=> b!189292 (= lt!93708 (getCurrentListMapNoExtraKeys!209 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3858 thiss!1248)))))

(declare-fun lt!93699 () (_ BitVec 64))

(assert (=> b!189292 (= lt!93699 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93698 () (_ BitVec 64))

(assert (=> b!189292 (= lt!93698 (select (arr!3797 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189292 (= lt!93705 (addApplyDifferent!152 lt!93708 lt!93699 (minValue!3699 thiss!1248) lt!93698))))

(assert (=> b!189292 (= (apply!176 (+!296 lt!93708 (tuple2!3505 lt!93699 (minValue!3699 thiss!1248))) lt!93698) (apply!176 lt!93708 lt!93698))))

(declare-fun b!189293 () Bool)

(declare-fun e!124575 () ListLongMap!2421)

(declare-fun call!19092 () ListLongMap!2421)

(assert (=> b!189293 (= e!124575 call!19092)))

(declare-fun bm!19084 () Bool)

(declare-fun call!19093 () ListLongMap!2421)

(assert (=> bm!19084 (= call!19092 call!19093)))

(declare-fun b!189294 () Bool)

(declare-fun e!124573 () Bool)

(declare-fun e!124569 () Bool)

(assert (=> b!189294 (= e!124573 e!124569)))

(declare-fun res!89491 () Bool)

(declare-fun call!19088 () Bool)

(assert (=> b!189294 (= res!89491 call!19088)))

(assert (=> b!189294 (=> (not res!89491) (not e!124569))))

(declare-fun d!55695 () Bool)

(declare-fun e!124578 () Bool)

(assert (=> d!55695 e!124578))

(declare-fun res!89497 () Bool)

(assert (=> d!55695 (=> (not res!89497) (not e!124578))))

(assert (=> d!55695 (= res!89497 (or (bvsge #b00000000000000000000000000000000 (size!4117 (_keys!5823 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4117 (_keys!5823 thiss!1248))))))))

(declare-fun lt!93715 () ListLongMap!2421)

(assert (=> d!55695 (= lt!93714 lt!93715)))

(declare-fun lt!93716 () Unit!5703)

(assert (=> d!55695 (= lt!93716 e!124566)))

(declare-fun c!34027 () Bool)

(assert (=> d!55695 (= c!34027 e!124574)))

(declare-fun res!89493 () Bool)

(assert (=> d!55695 (=> (not res!89493) (not e!124574))))

(assert (=> d!55695 (= res!89493 (bvslt #b00000000000000000000000000000000 (size!4117 (_keys!5823 thiss!1248))))))

(assert (=> d!55695 (= lt!93715 e!124572)))

(declare-fun c!34024 () Bool)

(assert (=> d!55695 (= c!34024 (and (not (= (bvand (extraKeys!3595 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3595 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55695 (validMask!0 (mask!9039 thiss!1248))))

(assert (=> d!55695 (= (getCurrentListMap!874 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3858 thiss!1248)) lt!93714)))

(declare-fun b!189295 () Bool)

(declare-fun res!89495 () Bool)

(assert (=> b!189295 (=> (not res!89495) (not e!124578))))

(assert (=> b!189295 (= res!89495 e!124570)))

(declare-fun res!89496 () Bool)

(assert (=> b!189295 (=> res!89496 e!124570)))

(declare-fun e!124576 () Bool)

(assert (=> b!189295 (= res!89496 (not e!124576))))

(declare-fun res!89492 () Bool)

(assert (=> b!189295 (=> (not res!89492) (not e!124576))))

(assert (=> b!189295 (= res!89492 (bvslt #b00000000000000000000000000000000 (size!4117 (_keys!5823 thiss!1248))))))

(declare-fun b!189296 () Bool)

(declare-fun e!124567 () Bool)

(assert (=> b!189296 (= e!124567 (= (apply!176 lt!93714 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3699 thiss!1248)))))

(declare-fun bm!19085 () Bool)

(declare-fun call!19090 () ListLongMap!2421)

(assert (=> bm!19085 (= call!19090 (getCurrentListMapNoExtraKeys!209 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3858 thiss!1248)))))

(declare-fun b!189297 () Bool)

(declare-fun c!34028 () Bool)

(assert (=> b!189297 (= c!34028 (and (not (= (bvand (extraKeys!3595 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3595 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!124568 () ListLongMap!2421)

(assert (=> b!189297 (= e!124568 e!124575)))

(declare-fun bm!19086 () Bool)

(assert (=> bm!19086 (= call!19088 (contains!1332 lt!93714 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189298 () Bool)

(assert (=> b!189298 (= e!124569 (= (apply!176 lt!93714 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3699 thiss!1248)))))

(declare-fun b!189299 () Bool)

(assert (=> b!189299 (= e!124578 e!124577)))

(declare-fun c!34023 () Bool)

(assert (=> b!189299 (= c!34023 (not (= (bvand (extraKeys!3595 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19087 () Bool)

(declare-fun c!34026 () Bool)

(assert (=> bm!19087 (= call!19087 (+!296 (ite c!34024 call!19090 (ite c!34026 call!19093 call!19092)) (ite (or c!34024 c!34026) (tuple2!3505 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3699 thiss!1248)) (tuple2!3505 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3699 thiss!1248)))))))

(declare-fun b!189300 () Bool)

(declare-fun call!19091 () ListLongMap!2421)

(assert (=> b!189300 (= e!124568 call!19091)))

(declare-fun b!189301 () Bool)

(assert (=> b!189301 (= e!124577 e!124567)))

(declare-fun res!89494 () Bool)

(assert (=> b!189301 (= res!89494 call!19089)))

(assert (=> b!189301 (=> (not res!89494) (not e!124567))))

(declare-fun b!189302 () Bool)

(assert (=> b!189302 (= e!124572 e!124568)))

(assert (=> b!189302 (= c!34026 (and (not (= (bvand (extraKeys!3595 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3595 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19088 () Bool)

(assert (=> bm!19088 (= call!19089 (contains!1332 lt!93714 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189303 () Bool)

(assert (=> b!189303 (= e!124573 (not call!19088))))

(declare-fun b!189304 () Bool)

(assert (=> b!189304 (= e!124575 call!19091)))

(declare-fun bm!19089 () Bool)

(assert (=> bm!19089 (= call!19091 call!19087)))

(declare-fun bm!19090 () Bool)

(assert (=> bm!19090 (= call!19093 call!19090)))

(declare-fun b!189305 () Bool)

(declare-fun get!2187 (ValueCell!1863 V!5531) V!5531)

(declare-fun dynLambda!519 (Int (_ BitVec 64)) V!5531)

(assert (=> b!189305 (= e!124571 (= (apply!176 lt!93714 (select (arr!3797 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000)) (get!2187 (select (arr!3798 (_values!3841 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!519 (defaultEntry!3858 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4118 (_values!3841 thiss!1248))))))

(assert (=> b!189305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4117 (_keys!5823 thiss!1248))))))

(declare-fun b!189306 () Bool)

(declare-fun res!89489 () Bool)

(assert (=> b!189306 (=> (not res!89489) (not e!124578))))

(assert (=> b!189306 (= res!89489 e!124573)))

(declare-fun c!34025 () Bool)

(assert (=> b!189306 (= c!34025 (not (= (bvand (extraKeys!3595 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!189307 () Bool)

(assert (=> b!189307 (= e!124576 (validKeyInArray!0 (select (arr!3797 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55695 c!34024) b!189289))

(assert (= (and d!55695 (not c!34024)) b!189302))

(assert (= (and b!189302 c!34026) b!189300))

(assert (= (and b!189302 (not c!34026)) b!189297))

(assert (= (and b!189297 c!34028) b!189304))

(assert (= (and b!189297 (not c!34028)) b!189293))

(assert (= (or b!189304 b!189293) bm!19084))

(assert (= (or b!189300 bm!19084) bm!19090))

(assert (= (or b!189300 b!189304) bm!19089))

(assert (= (or b!189289 bm!19090) bm!19085))

(assert (= (or b!189289 bm!19089) bm!19087))

(assert (= (and d!55695 res!89493) b!189291))

(assert (= (and d!55695 c!34027) b!189292))

(assert (= (and d!55695 (not c!34027)) b!189288))

(assert (= (and d!55695 res!89497) b!189295))

(assert (= (and b!189295 res!89492) b!189307))

(assert (= (and b!189295 (not res!89496)) b!189287))

(assert (= (and b!189287 res!89490) b!189305))

(assert (= (and b!189295 res!89495) b!189306))

(assert (= (and b!189306 c!34025) b!189294))

(assert (= (and b!189306 (not c!34025)) b!189303))

(assert (= (and b!189294 res!89491) b!189298))

(assert (= (or b!189294 b!189303) bm!19086))

(assert (= (and b!189306 res!89489) b!189299))

(assert (= (and b!189299 c!34023) b!189301))

(assert (= (and b!189299 (not c!34023)) b!189290))

(assert (= (and b!189301 res!89494) b!189296))

(assert (= (or b!189301 b!189290) bm!19088))

(declare-fun b_lambda!7323 () Bool)

(assert (=> (not b_lambda!7323) (not b!189305)))

(declare-fun t!7309 () Bool)

(declare-fun tb!2863 () Bool)

(assert (=> (and b!189147 (= (defaultEntry!3858 thiss!1248) (defaultEntry!3858 thiss!1248)) t!7309) tb!2863))

(declare-fun result!4867 () Bool)

(assert (=> tb!2863 (= result!4867 tp_is_empty!4413)))

(assert (=> b!189305 t!7309))

(declare-fun b_and!11281 () Bool)

(assert (= b_and!11277 (and (=> t!7309 result!4867) b_and!11281)))

(assert (=> b!189291 m!215651))

(assert (=> b!189291 m!215651))

(assert (=> b!189291 m!215657))

(declare-fun m!215667 () Bool)

(assert (=> bm!19087 m!215667))

(declare-fun m!215669 () Bool)

(assert (=> bm!19086 m!215669))

(assert (=> d!55695 m!215595))

(declare-fun m!215671 () Bool)

(assert (=> b!189298 m!215671))

(declare-fun m!215673 () Bool)

(assert (=> bm!19085 m!215673))

(declare-fun m!215675 () Bool)

(assert (=> bm!19088 m!215675))

(declare-fun m!215677 () Bool)

(assert (=> b!189296 m!215677))

(declare-fun m!215679 () Bool)

(assert (=> b!189292 m!215679))

(declare-fun m!215681 () Bool)

(assert (=> b!189292 m!215681))

(declare-fun m!215683 () Bool)

(assert (=> b!189292 m!215683))

(declare-fun m!215685 () Bool)

(assert (=> b!189292 m!215685))

(declare-fun m!215687 () Bool)

(assert (=> b!189292 m!215687))

(declare-fun m!215689 () Bool)

(assert (=> b!189292 m!215689))

(declare-fun m!215691 () Bool)

(assert (=> b!189292 m!215691))

(declare-fun m!215693 () Bool)

(assert (=> b!189292 m!215693))

(declare-fun m!215695 () Bool)

(assert (=> b!189292 m!215695))

(declare-fun m!215697 () Bool)

(assert (=> b!189292 m!215697))

(assert (=> b!189292 m!215693))

(declare-fun m!215699 () Bool)

(assert (=> b!189292 m!215699))

(assert (=> b!189292 m!215651))

(assert (=> b!189292 m!215673))

(assert (=> b!189292 m!215689))

(declare-fun m!215701 () Bool)

(assert (=> b!189292 m!215701))

(assert (=> b!189292 m!215679))

(declare-fun m!215703 () Bool)

(assert (=> b!189292 m!215703))

(assert (=> b!189292 m!215703))

(declare-fun m!215705 () Bool)

(assert (=> b!189292 m!215705))

(declare-fun m!215707 () Bool)

(assert (=> b!189292 m!215707))

(assert (=> b!189287 m!215651))

(assert (=> b!189287 m!215651))

(declare-fun m!215709 () Bool)

(assert (=> b!189287 m!215709))

(declare-fun m!215711 () Bool)

(assert (=> b!189289 m!215711))

(assert (=> b!189307 m!215651))

(assert (=> b!189307 m!215651))

(assert (=> b!189307 m!215657))

(declare-fun m!215713 () Bool)

(assert (=> b!189305 m!215713))

(declare-fun m!215715 () Bool)

(assert (=> b!189305 m!215715))

(assert (=> b!189305 m!215651))

(declare-fun m!215717 () Bool)

(assert (=> b!189305 m!215717))

(assert (=> b!189305 m!215651))

(assert (=> b!189305 m!215715))

(assert (=> b!189305 m!215713))

(declare-fun m!215719 () Bool)

(assert (=> b!189305 m!215719))

(assert (=> b!189151 d!55695))

(declare-fun d!55697 () Bool)

(assert (=> d!55697 (= (array_inv!2461 (_keys!5823 thiss!1248)) (bvsge (size!4117 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189147 d!55697))

(declare-fun d!55699 () Bool)

(assert (=> d!55699 (= (array_inv!2462 (_values!3841 thiss!1248)) (bvsge (size!4118 (_values!3841 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189147 d!55699))

(declare-fun d!55701 () Bool)

(declare-fun res!89504 () Bool)

(declare-fun e!124581 () Bool)

(assert (=> d!55701 (=> (not res!89504) (not e!124581))))

(declare-fun simpleValid!192 (LongMapFixedSize!2634) Bool)

(assert (=> d!55701 (= res!89504 (simpleValid!192 thiss!1248))))

(assert (=> d!55701 (= (valid!1083 thiss!1248) e!124581)))

(declare-fun b!189316 () Bool)

(declare-fun res!89505 () Bool)

(assert (=> b!189316 (=> (not res!89505) (not e!124581))))

(declare-fun arrayCountValidKeys!0 (array!8053 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!189316 (= res!89505 (= (arrayCountValidKeys!0 (_keys!5823 thiss!1248) #b00000000000000000000000000000000 (size!4117 (_keys!5823 thiss!1248))) (_size!1366 thiss!1248)))))

(declare-fun b!189317 () Bool)

(declare-fun res!89506 () Bool)

(assert (=> b!189317 (=> (not res!89506) (not e!124581))))

(assert (=> b!189317 (= res!89506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5823 thiss!1248) (mask!9039 thiss!1248)))))

(declare-fun b!189318 () Bool)

(assert (=> b!189318 (= e!124581 (arrayNoDuplicates!0 (_keys!5823 thiss!1248) #b00000000000000000000000000000000 Nil!2401))))

(assert (= (and d!55701 res!89504) b!189316))

(assert (= (and b!189316 res!89505) b!189317))

(assert (= (and b!189317 res!89506) b!189318))

(declare-fun m!215721 () Bool)

(assert (=> d!55701 m!215721))

(declare-fun m!215723 () Bool)

(assert (=> b!189316 m!215723))

(assert (=> b!189317 m!215605))

(assert (=> b!189318 m!215589))

(assert (=> start!19224 d!55701))

(declare-fun bm!19093 () Bool)

(declare-fun call!19096 () Bool)

(assert (=> bm!19093 (= call!19096 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5823 thiss!1248) (mask!9039 thiss!1248)))))

(declare-fun d!55703 () Bool)

(declare-fun res!89511 () Bool)

(declare-fun e!124589 () Bool)

(assert (=> d!55703 (=> res!89511 e!124589)))

(assert (=> d!55703 (= res!89511 (bvsge #b00000000000000000000000000000000 (size!4117 (_keys!5823 thiss!1248))))))

(assert (=> d!55703 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5823 thiss!1248) (mask!9039 thiss!1248)) e!124589)))

(declare-fun b!189327 () Bool)

(declare-fun e!124590 () Bool)

(assert (=> b!189327 (= e!124589 e!124590)))

(declare-fun c!34031 () Bool)

(assert (=> b!189327 (= c!34031 (validKeyInArray!0 (select (arr!3797 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189328 () Bool)

(declare-fun e!124588 () Bool)

(assert (=> b!189328 (= e!124588 call!19096)))

(declare-fun b!189329 () Bool)

(assert (=> b!189329 (= e!124590 e!124588)))

(declare-fun lt!93723 () (_ BitVec 64))

(assert (=> b!189329 (= lt!93723 (select (arr!3797 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93725 () Unit!5703)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8053 (_ BitVec 64) (_ BitVec 32)) Unit!5703)

(assert (=> b!189329 (= lt!93725 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5823 thiss!1248) lt!93723 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!189329 (arrayContainsKey!0 (_keys!5823 thiss!1248) lt!93723 #b00000000000000000000000000000000)))

(declare-fun lt!93724 () Unit!5703)

(assert (=> b!189329 (= lt!93724 lt!93725)))

(declare-fun res!89512 () Bool)

(assert (=> b!189329 (= res!89512 (= (seekEntryOrOpen!0 (select (arr!3797 (_keys!5823 thiss!1248)) #b00000000000000000000000000000000) (_keys!5823 thiss!1248) (mask!9039 thiss!1248)) (Found!660 #b00000000000000000000000000000000)))))

(assert (=> b!189329 (=> (not res!89512) (not e!124588))))

(declare-fun b!189330 () Bool)

(assert (=> b!189330 (= e!124590 call!19096)))

(assert (= (and d!55703 (not res!89511)) b!189327))

(assert (= (and b!189327 c!34031) b!189329))

(assert (= (and b!189327 (not c!34031)) b!189330))

(assert (= (and b!189329 res!89512) b!189328))

(assert (= (or b!189328 b!189330) bm!19093))

(declare-fun m!215725 () Bool)

(assert (=> bm!19093 m!215725))

(assert (=> b!189327 m!215651))

(assert (=> b!189327 m!215651))

(assert (=> b!189327 m!215657))

(assert (=> b!189329 m!215651))

(declare-fun m!215727 () Bool)

(assert (=> b!189329 m!215727))

(declare-fun m!215729 () Bool)

(assert (=> b!189329 m!215729))

(assert (=> b!189329 m!215651))

(declare-fun m!215731 () Bool)

(assert (=> b!189329 m!215731))

(assert (=> b!189153 d!55703))

(declare-fun d!55705 () Bool)

(assert (=> d!55705 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189144 d!55705))

(declare-fun b!189347 () Bool)

(declare-fun e!124599 () Bool)

(declare-fun call!19102 () Bool)

(assert (=> b!189347 (= e!124599 (not call!19102))))

(declare-fun b!189348 () Bool)

(declare-fun e!124600 () Bool)

(assert (=> b!189348 (= e!124600 e!124599)))

(declare-fun res!89522 () Bool)

(declare-fun call!19101 () Bool)

(assert (=> b!189348 (= res!89522 call!19101)))

(assert (=> b!189348 (=> (not res!89522) (not e!124599))))

(declare-fun d!55707 () Bool)

(assert (=> d!55707 e!124600))

(declare-fun c!34037 () Bool)

(declare-fun lt!93730 () SeekEntryResult!660)

(assert (=> d!55707 (= c!34037 ((_ is MissingZero!660) lt!93730))))

(assert (=> d!55707 (= lt!93730 (seekEntryOrOpen!0 key!828 (_keys!5823 thiss!1248) (mask!9039 thiss!1248)))))

(declare-fun lt!93731 () Unit!5703)

(declare-fun choose!1012 (array!8053 array!8055 (_ BitVec 32) (_ BitVec 32) V!5531 V!5531 (_ BitVec 64) Int) Unit!5703)

(assert (=> d!55707 (= lt!93731 (choose!1012 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) key!828 (defaultEntry!3858 thiss!1248)))))

(assert (=> d!55707 (validMask!0 (mask!9039 thiss!1248))))

(assert (=> d!55707 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!164 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) key!828 (defaultEntry!3858 thiss!1248)) lt!93731)))

(declare-fun b!189349 () Bool)

(declare-fun e!124602 () Bool)

(assert (=> b!189349 (= e!124600 e!124602)))

(declare-fun c!34036 () Bool)

(assert (=> b!189349 (= c!34036 ((_ is MissingVacant!660) lt!93730))))

(declare-fun b!189350 () Bool)

(declare-fun e!124601 () Bool)

(assert (=> b!189350 (= e!124601 (not call!19102))))

(declare-fun b!189351 () Bool)

(declare-fun res!89524 () Bool)

(assert (=> b!189351 (=> (not res!89524) (not e!124601))))

(assert (=> b!189351 (= res!89524 call!19101)))

(assert (=> b!189351 (= e!124602 e!124601)))

(declare-fun bm!19098 () Bool)

(assert (=> bm!19098 (= call!19101 (inRange!0 (ite c!34037 (index!4810 lt!93730) (index!4813 lt!93730)) (mask!9039 thiss!1248)))))

(declare-fun b!189352 () Bool)

(assert (=> b!189352 (= e!124602 ((_ is Undefined!660) lt!93730))))

(declare-fun b!189353 () Bool)

(assert (=> b!189353 (and (bvsge (index!4810 lt!93730) #b00000000000000000000000000000000) (bvslt (index!4810 lt!93730) (size!4117 (_keys!5823 thiss!1248))))))

(declare-fun res!89523 () Bool)

(assert (=> b!189353 (= res!89523 (= (select (arr!3797 (_keys!5823 thiss!1248)) (index!4810 lt!93730)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189353 (=> (not res!89523) (not e!124599))))

(declare-fun b!189354 () Bool)

(declare-fun res!89521 () Bool)

(assert (=> b!189354 (=> (not res!89521) (not e!124601))))

(assert (=> b!189354 (= res!89521 (= (select (arr!3797 (_keys!5823 thiss!1248)) (index!4813 lt!93730)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189354 (and (bvsge (index!4813 lt!93730) #b00000000000000000000000000000000) (bvslt (index!4813 lt!93730) (size!4117 (_keys!5823 thiss!1248))))))

(declare-fun bm!19099 () Bool)

(assert (=> bm!19099 (= call!19102 (arrayContainsKey!0 (_keys!5823 thiss!1248) key!828 #b00000000000000000000000000000000))))

(assert (= (and d!55707 c!34037) b!189348))

(assert (= (and d!55707 (not c!34037)) b!189349))

(assert (= (and b!189348 res!89522) b!189353))

(assert (= (and b!189353 res!89523) b!189347))

(assert (= (and b!189349 c!34036) b!189351))

(assert (= (and b!189349 (not c!34036)) b!189352))

(assert (= (and b!189351 res!89524) b!189354))

(assert (= (and b!189354 res!89521) b!189350))

(assert (= (or b!189348 b!189351) bm!19098))

(assert (= (or b!189347 b!189350) bm!19099))

(assert (=> d!55707 m!215593))

(declare-fun m!215733 () Bool)

(assert (=> d!55707 m!215733))

(assert (=> d!55707 m!215595))

(declare-fun m!215735 () Bool)

(assert (=> b!189354 m!215735))

(declare-fun m!215737 () Bool)

(assert (=> b!189353 m!215737))

(declare-fun m!215739 () Bool)

(assert (=> bm!19099 m!215739))

(declare-fun m!215741 () Bool)

(assert (=> bm!19098 m!215741))

(assert (=> b!189154 d!55707))

(declare-fun d!55709 () Bool)

(declare-fun e!124605 () Bool)

(assert (=> d!55709 e!124605))

(declare-fun res!89530 () Bool)

(assert (=> d!55709 (=> (not res!89530) (not e!124605))))

(declare-fun lt!93736 () SeekEntryResult!660)

(assert (=> d!55709 (= res!89530 ((_ is Found!660) lt!93736))))

(assert (=> d!55709 (= lt!93736 (seekEntryOrOpen!0 key!828 (_keys!5823 thiss!1248) (mask!9039 thiss!1248)))))

(declare-fun lt!93737 () Unit!5703)

(declare-fun choose!1013 (array!8053 array!8055 (_ BitVec 32) (_ BitVec 32) V!5531 V!5531 (_ BitVec 64) Int) Unit!5703)

(assert (=> d!55709 (= lt!93737 (choose!1013 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) key!828 (defaultEntry!3858 thiss!1248)))))

(assert (=> d!55709 (validMask!0 (mask!9039 thiss!1248))))

(assert (=> d!55709 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!161 (_keys!5823 thiss!1248) (_values!3841 thiss!1248) (mask!9039 thiss!1248) (extraKeys!3595 thiss!1248) (zeroValue!3699 thiss!1248) (minValue!3699 thiss!1248) key!828 (defaultEntry!3858 thiss!1248)) lt!93737)))

(declare-fun b!189359 () Bool)

(declare-fun res!89529 () Bool)

(assert (=> b!189359 (=> (not res!89529) (not e!124605))))

(assert (=> b!189359 (= res!89529 (inRange!0 (index!4811 lt!93736) (mask!9039 thiss!1248)))))

(declare-fun b!189360 () Bool)

(assert (=> b!189360 (= e!124605 (= (select (arr!3797 (_keys!5823 thiss!1248)) (index!4811 lt!93736)) key!828))))

(assert (=> b!189360 (and (bvsge (index!4811 lt!93736) #b00000000000000000000000000000000) (bvslt (index!4811 lt!93736) (size!4117 (_keys!5823 thiss!1248))))))

(assert (= (and d!55709 res!89530) b!189359))

(assert (= (and b!189359 res!89529) b!189360))

(assert (=> d!55709 m!215593))

(declare-fun m!215743 () Bool)

(assert (=> d!55709 m!215743))

(assert (=> d!55709 m!215595))

(declare-fun m!215745 () Bool)

(assert (=> b!189359 m!215745))

(declare-fun m!215747 () Bool)

(assert (=> b!189360 m!215747))

(assert (=> b!189145 d!55709))

(declare-fun d!55711 () Bool)

(assert (=> d!55711 (= (inRange!0 (index!4811 lt!93616) (mask!9039 thiss!1248)) (and (bvsge (index!4811 lt!93616) #b00000000000000000000000000000000) (bvslt (index!4811 lt!93616) (bvadd (mask!9039 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!189145 d!55711))

(declare-fun mapNonEmpty!7618 () Bool)

(declare-fun mapRes!7618 () Bool)

(declare-fun tp!16762 () Bool)

(declare-fun e!124611 () Bool)

(assert (=> mapNonEmpty!7618 (= mapRes!7618 (and tp!16762 e!124611))))

(declare-fun mapKey!7618 () (_ BitVec 32))

(declare-fun mapValue!7618 () ValueCell!1863)

(declare-fun mapRest!7618 () (Array (_ BitVec 32) ValueCell!1863))

(assert (=> mapNonEmpty!7618 (= mapRest!7612 (store mapRest!7618 mapKey!7618 mapValue!7618))))

(declare-fun condMapEmpty!7618 () Bool)

(declare-fun mapDefault!7618 () ValueCell!1863)

(assert (=> mapNonEmpty!7612 (= condMapEmpty!7618 (= mapRest!7612 ((as const (Array (_ BitVec 32) ValueCell!1863)) mapDefault!7618)))))

(declare-fun e!124610 () Bool)

(assert (=> mapNonEmpty!7612 (= tp!16752 (and e!124610 mapRes!7618))))

(declare-fun b!189368 () Bool)

(assert (=> b!189368 (= e!124610 tp_is_empty!4413)))

(declare-fun b!189367 () Bool)

(assert (=> b!189367 (= e!124611 tp_is_empty!4413)))

(declare-fun mapIsEmpty!7618 () Bool)

(assert (=> mapIsEmpty!7618 mapRes!7618))

(assert (= (and mapNonEmpty!7612 condMapEmpty!7618) mapIsEmpty!7618))

(assert (= (and mapNonEmpty!7612 (not condMapEmpty!7618)) mapNonEmpty!7618))

(assert (= (and mapNonEmpty!7618 ((_ is ValueCellFull!1863) mapValue!7618)) b!189367))

(assert (= (and mapNonEmpty!7612 ((_ is ValueCellFull!1863) mapDefault!7618)) b!189368))

(declare-fun m!215749 () Bool)

(assert (=> mapNonEmpty!7618 m!215749))

(declare-fun b_lambda!7325 () Bool)

(assert (= b_lambda!7323 (or (and b!189147 b_free!4641) b_lambda!7325)))

(check-sat (not b!189327) (not bm!19085) (not b!189232) (not bm!19088) (not b!189287) (not bm!19093) (not d!55687) (not bm!19099) (not b!189305) tp_is_empty!4413 (not bm!19087) (not b!189231) b_and!11281 (not b!189291) (not b!189318) (not b!189317) (not b!189298) (not b!189235) (not d!55701) (not d!55693) (not b_next!4641) (not b_lambda!7325) (not b!189329) (not b!189296) (not d!55709) (not bm!19069) (not b!189215) (not b!189307) (not b!189244) (not bm!19086) (not d!55695) (not d!55707) (not b!189289) (not b!189316) (not bm!19098) (not b!189359) (not b!189292) (not mapNonEmpty!7618) (not b!189242))
(check-sat b_and!11281 (not b_next!4641))
