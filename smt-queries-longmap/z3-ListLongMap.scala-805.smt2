; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19398 () Bool)

(assert start!19398)

(declare-fun b!190684 () Bool)

(declare-fun b_free!4671 () Bool)

(declare-fun b_next!4671 () Bool)

(assert (=> b!190684 (= b_free!4671 (not b_next!4671))))

(declare-fun tp!16856 () Bool)

(declare-fun b_and!11329 () Bool)

(assert (=> b!190684 (= tp!16856 b_and!11329)))

(declare-fun b!190678 () Bool)

(declare-fun e!125488 () Bool)

(declare-fun e!125493 () Bool)

(assert (=> b!190678 (= e!125488 (not e!125493))))

(declare-fun res!90137 () Bool)

(assert (=> b!190678 (=> res!90137 e!125493)))

(declare-datatypes ((V!5571 0))(
  ( (V!5572 (val!2266 Int)) )
))
(declare-datatypes ((ValueCell!1878 0))(
  ( (ValueCellFull!1878 (v!4198 V!5571)) (EmptyCell!1878) )
))
(declare-datatypes ((array!8121 0))(
  ( (array!8122 (arr!3827 (Array (_ BitVec 32) (_ BitVec 64))) (size!4148 (_ BitVec 32))) )
))
(declare-datatypes ((array!8123 0))(
  ( (array!8124 (arr!3828 (Array (_ BitVec 32) ValueCell!1878)) (size!4149 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2664 0))(
  ( (LongMapFixedSize!2665 (defaultEntry!3892 Int) (mask!9099 (_ BitVec 32)) (extraKeys!3629 (_ BitVec 32)) (zeroValue!3733 V!5571) (minValue!3733 V!5571) (_size!1381 (_ BitVec 32)) (_keys!5865 array!8121) (_values!3875 array!8123) (_vacant!1381 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2664)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!190678 (= res!90137 (not (validMask!0 (mask!9099 thiss!1248))))))

(declare-datatypes ((SeekEntryResult!674 0))(
  ( (MissingZero!674 (index!4866 (_ BitVec 32))) (Found!674 (index!4867 (_ BitVec 32))) (Intermediate!674 (undefined!1486 Bool) (index!4868 (_ BitVec 32)) (x!20502 (_ BitVec 32))) (Undefined!674) (MissingVacant!674 (index!4869 (_ BitVec 32))) )
))
(declare-fun lt!94551 () SeekEntryResult!674)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!5571)

(declare-datatypes ((tuple2!3522 0))(
  ( (tuple2!3523 (_1!1772 (_ BitVec 64)) (_2!1772 V!5571)) )
))
(declare-datatypes ((List!2418 0))(
  ( (Nil!2415) (Cons!2414 (h!3052 tuple2!3522) (t!7328 List!2418)) )
))
(declare-datatypes ((ListLongMap!2439 0))(
  ( (ListLongMap!2440 (toList!1235 List!2418)) )
))
(declare-fun lt!94553 () ListLongMap!2439)

(declare-fun +!303 (ListLongMap!2439 tuple2!3522) ListLongMap!2439)

(declare-fun getCurrentListMap!883 (array!8121 array!8123 (_ BitVec 32) (_ BitVec 32) V!5571 V!5571 (_ BitVec 32) Int) ListLongMap!2439)

(assert (=> b!190678 (= (+!303 lt!94553 (tuple2!3523 key!828 v!309)) (getCurrentListMap!883 (_keys!5865 thiss!1248) (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248))) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)))))

(declare-datatypes ((Unit!5764 0))(
  ( (Unit!5765) )
))
(declare-fun lt!94550 () Unit!5764)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!104 (array!8121 array!8123 (_ BitVec 32) (_ BitVec 32) V!5571 V!5571 (_ BitVec 32) (_ BitVec 64) V!5571 Int) Unit!5764)

(assert (=> b!190678 (= lt!94550 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!104 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) (index!4867 lt!94551) key!828 v!309 (defaultEntry!3892 thiss!1248)))))

(declare-fun lt!94554 () Unit!5764)

(declare-fun e!125486 () Unit!5764)

(assert (=> b!190678 (= lt!94554 e!125486)))

(declare-fun c!34292 () Bool)

(declare-fun contains!1346 (ListLongMap!2439 (_ BitVec 64)) Bool)

(assert (=> b!190678 (= c!34292 (contains!1346 lt!94553 key!828))))

(assert (=> b!190678 (= lt!94553 (getCurrentListMap!883 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)))))

(declare-fun b!190679 () Bool)

(assert (=> b!190679 (= e!125493 (or (not (= (size!4149 (_values!3875 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9099 thiss!1248)))) (= (size!4148 (_keys!5865 thiss!1248)) (size!4149 (_values!3875 thiss!1248)))))))

(declare-fun mapIsEmpty!7670 () Bool)

(declare-fun mapRes!7670 () Bool)

(assert (=> mapIsEmpty!7670 mapRes!7670))

(declare-fun b!190680 () Bool)

(declare-fun e!125489 () Bool)

(assert (=> b!190680 (= e!125489 e!125488)))

(declare-fun res!90136 () Bool)

(assert (=> b!190680 (=> (not res!90136) (not e!125488))))

(get-info :version)

(assert (=> b!190680 (= res!90136 (and (not ((_ is Undefined!674) lt!94551)) (not ((_ is MissingVacant!674) lt!94551)) (not ((_ is MissingZero!674) lt!94551)) ((_ is Found!674) lt!94551)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8121 (_ BitVec 32)) SeekEntryResult!674)

(assert (=> b!190680 (= lt!94551 (seekEntryOrOpen!0 key!828 (_keys!5865 thiss!1248) (mask!9099 thiss!1248)))))

(declare-fun b!190682 () Bool)

(declare-fun Unit!5766 () Unit!5764)

(assert (=> b!190682 (= e!125486 Unit!5766)))

(declare-fun lt!94552 () Unit!5764)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!177 (array!8121 array!8123 (_ BitVec 32) (_ BitVec 32) V!5571 V!5571 (_ BitVec 64) Int) Unit!5764)

(assert (=> b!190682 (= lt!94552 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!177 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) key!828 (defaultEntry!3892 thiss!1248)))))

(assert (=> b!190682 false))

(declare-fun b!190683 () Bool)

(declare-fun lt!94555 () Unit!5764)

(assert (=> b!190683 (= e!125486 lt!94555)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!171 (array!8121 array!8123 (_ BitVec 32) (_ BitVec 32) V!5571 V!5571 (_ BitVec 64) Int) Unit!5764)

(assert (=> b!190683 (= lt!94555 (lemmaInListMapThenSeekEntryOrOpenFindsIt!171 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) key!828 (defaultEntry!3892 thiss!1248)))))

(declare-fun res!90139 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!190683 (= res!90139 (inRange!0 (index!4867 lt!94551) (mask!9099 thiss!1248)))))

(declare-fun e!125495 () Bool)

(assert (=> b!190683 (=> (not res!90139) (not e!125495))))

(assert (=> b!190683 e!125495))

(declare-fun tp_is_empty!4443 () Bool)

(declare-fun e!125491 () Bool)

(declare-fun e!125487 () Bool)

(declare-fun array_inv!2483 (array!8121) Bool)

(declare-fun array_inv!2484 (array!8123) Bool)

(assert (=> b!190684 (= e!125491 (and tp!16856 tp_is_empty!4443 (array_inv!2483 (_keys!5865 thiss!1248)) (array_inv!2484 (_values!3875 thiss!1248)) e!125487))))

(declare-fun b!190681 () Bool)

(declare-fun e!125494 () Bool)

(assert (=> b!190681 (= e!125494 tp_is_empty!4443)))

(declare-fun res!90138 () Bool)

(assert (=> start!19398 (=> (not res!90138) (not e!125489))))

(declare-fun valid!1094 (LongMapFixedSize!2664) Bool)

(assert (=> start!19398 (= res!90138 (valid!1094 thiss!1248))))

(assert (=> start!19398 e!125489))

(assert (=> start!19398 e!125491))

(assert (=> start!19398 true))

(assert (=> start!19398 tp_is_empty!4443))

(declare-fun b!190685 () Bool)

(declare-fun e!125492 () Bool)

(assert (=> b!190685 (= e!125492 tp_is_empty!4443)))

(declare-fun b!190686 () Bool)

(assert (=> b!190686 (= e!125487 (and e!125492 mapRes!7670))))

(declare-fun condMapEmpty!7670 () Bool)

(declare-fun mapDefault!7670 () ValueCell!1878)

(assert (=> b!190686 (= condMapEmpty!7670 (= (arr!3828 (_values!3875 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1878)) mapDefault!7670)))))

(declare-fun b!190687 () Bool)

(assert (=> b!190687 (= e!125495 (= (select (arr!3827 (_keys!5865 thiss!1248)) (index!4867 lt!94551)) key!828))))

(declare-fun b!190688 () Bool)

(declare-fun res!90135 () Bool)

(assert (=> b!190688 (=> (not res!90135) (not e!125489))))

(assert (=> b!190688 (= res!90135 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7670 () Bool)

(declare-fun tp!16855 () Bool)

(assert (=> mapNonEmpty!7670 (= mapRes!7670 (and tp!16855 e!125494))))

(declare-fun mapRest!7670 () (Array (_ BitVec 32) ValueCell!1878))

(declare-fun mapKey!7670 () (_ BitVec 32))

(declare-fun mapValue!7670 () ValueCell!1878)

(assert (=> mapNonEmpty!7670 (= (arr!3828 (_values!3875 thiss!1248)) (store mapRest!7670 mapKey!7670 mapValue!7670))))

(assert (= (and start!19398 res!90138) b!190688))

(assert (= (and b!190688 res!90135) b!190680))

(assert (= (and b!190680 res!90136) b!190678))

(assert (= (and b!190678 c!34292) b!190683))

(assert (= (and b!190678 (not c!34292)) b!190682))

(assert (= (and b!190683 res!90139) b!190687))

(assert (= (and b!190678 (not res!90137)) b!190679))

(assert (= (and b!190686 condMapEmpty!7670) mapIsEmpty!7670))

(assert (= (and b!190686 (not condMapEmpty!7670)) mapNonEmpty!7670))

(assert (= (and mapNonEmpty!7670 ((_ is ValueCellFull!1878) mapValue!7670)) b!190681))

(assert (= (and b!190686 ((_ is ValueCellFull!1878) mapDefault!7670)) b!190685))

(assert (= b!190684 b!190686))

(assert (= start!19398 b!190684))

(declare-fun m!217129 () Bool)

(assert (=> b!190682 m!217129))

(declare-fun m!217131 () Bool)

(assert (=> b!190680 m!217131))

(declare-fun m!217133 () Bool)

(assert (=> b!190684 m!217133))

(declare-fun m!217135 () Bool)

(assert (=> b!190684 m!217135))

(declare-fun m!217137 () Bool)

(assert (=> b!190683 m!217137))

(declare-fun m!217139 () Bool)

(assert (=> b!190683 m!217139))

(declare-fun m!217141 () Bool)

(assert (=> b!190687 m!217141))

(declare-fun m!217143 () Bool)

(assert (=> start!19398 m!217143))

(declare-fun m!217145 () Bool)

(assert (=> b!190678 m!217145))

(declare-fun m!217147 () Bool)

(assert (=> b!190678 m!217147))

(declare-fun m!217149 () Bool)

(assert (=> b!190678 m!217149))

(declare-fun m!217151 () Bool)

(assert (=> b!190678 m!217151))

(declare-fun m!217153 () Bool)

(assert (=> b!190678 m!217153))

(declare-fun m!217155 () Bool)

(assert (=> b!190678 m!217155))

(declare-fun m!217157 () Bool)

(assert (=> b!190678 m!217157))

(declare-fun m!217159 () Bool)

(assert (=> mapNonEmpty!7670 m!217159))

(check-sat (not b!190683) (not b!190678) (not b!190684) tp_is_empty!4443 (not mapNonEmpty!7670) (not b!190680) b_and!11329 (not b!190682) (not start!19398) (not b_next!4671))
(check-sat b_and!11329 (not b_next!4671))
(get-model)

(declare-fun d!55949 () Bool)

(assert (=> d!55949 (= (array_inv!2483 (_keys!5865 thiss!1248)) (bvsge (size!4148 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190684 d!55949))

(declare-fun d!55951 () Bool)

(assert (=> d!55951 (= (array_inv!2484 (_values!3875 thiss!1248)) (bvsge (size!4149 (_values!3875 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190684 d!55951))

(declare-fun d!55953 () Bool)

(declare-fun e!125528 () Bool)

(assert (=> d!55953 e!125528))

(declare-fun res!90159 () Bool)

(assert (=> d!55953 (=> (not res!90159) (not e!125528))))

(declare-fun lt!94579 () SeekEntryResult!674)

(assert (=> d!55953 (= res!90159 ((_ is Found!674) lt!94579))))

(assert (=> d!55953 (= lt!94579 (seekEntryOrOpen!0 key!828 (_keys!5865 thiss!1248) (mask!9099 thiss!1248)))))

(declare-fun lt!94578 () Unit!5764)

(declare-fun choose!1027 (array!8121 array!8123 (_ BitVec 32) (_ BitVec 32) V!5571 V!5571 (_ BitVec 64) Int) Unit!5764)

(assert (=> d!55953 (= lt!94578 (choose!1027 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) key!828 (defaultEntry!3892 thiss!1248)))))

(assert (=> d!55953 (validMask!0 (mask!9099 thiss!1248))))

(assert (=> d!55953 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!171 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) key!828 (defaultEntry!3892 thiss!1248)) lt!94578)))

(declare-fun b!190726 () Bool)

(declare-fun res!90160 () Bool)

(assert (=> b!190726 (=> (not res!90160) (not e!125528))))

(assert (=> b!190726 (= res!90160 (inRange!0 (index!4867 lt!94579) (mask!9099 thiss!1248)))))

(declare-fun b!190727 () Bool)

(assert (=> b!190727 (= e!125528 (= (select (arr!3827 (_keys!5865 thiss!1248)) (index!4867 lt!94579)) key!828))))

(assert (=> b!190727 (and (bvsge (index!4867 lt!94579) #b00000000000000000000000000000000) (bvslt (index!4867 lt!94579) (size!4148 (_keys!5865 thiss!1248))))))

(assert (= (and d!55953 res!90159) b!190726))

(assert (= (and b!190726 res!90160) b!190727))

(assert (=> d!55953 m!217131))

(declare-fun m!217193 () Bool)

(assert (=> d!55953 m!217193))

(assert (=> d!55953 m!217153))

(declare-fun m!217195 () Bool)

(assert (=> b!190726 m!217195))

(declare-fun m!217197 () Bool)

(assert (=> b!190727 m!217197))

(assert (=> b!190683 d!55953))

(declare-fun d!55955 () Bool)

(assert (=> d!55955 (= (inRange!0 (index!4867 lt!94551) (mask!9099 thiss!1248)) (and (bvsge (index!4867 lt!94551) #b00000000000000000000000000000000) (bvslt (index!4867 lt!94551) (bvadd (mask!9099 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!190683 d!55955))

(declare-fun d!55957 () Bool)

(assert (=> d!55957 (= (validMask!0 (mask!9099 thiss!1248)) (and (or (= (mask!9099 thiss!1248) #b00000000000000000000000000000111) (= (mask!9099 thiss!1248) #b00000000000000000000000000001111) (= (mask!9099 thiss!1248) #b00000000000000000000000000011111) (= (mask!9099 thiss!1248) #b00000000000000000000000000111111) (= (mask!9099 thiss!1248) #b00000000000000000000000001111111) (= (mask!9099 thiss!1248) #b00000000000000000000000011111111) (= (mask!9099 thiss!1248) #b00000000000000000000000111111111) (= (mask!9099 thiss!1248) #b00000000000000000000001111111111) (= (mask!9099 thiss!1248) #b00000000000000000000011111111111) (= (mask!9099 thiss!1248) #b00000000000000000000111111111111) (= (mask!9099 thiss!1248) #b00000000000000000001111111111111) (= (mask!9099 thiss!1248) #b00000000000000000011111111111111) (= (mask!9099 thiss!1248) #b00000000000000000111111111111111) (= (mask!9099 thiss!1248) #b00000000000000001111111111111111) (= (mask!9099 thiss!1248) #b00000000000000011111111111111111) (= (mask!9099 thiss!1248) #b00000000000000111111111111111111) (= (mask!9099 thiss!1248) #b00000000000001111111111111111111) (= (mask!9099 thiss!1248) #b00000000000011111111111111111111) (= (mask!9099 thiss!1248) #b00000000000111111111111111111111) (= (mask!9099 thiss!1248) #b00000000001111111111111111111111) (= (mask!9099 thiss!1248) #b00000000011111111111111111111111) (= (mask!9099 thiss!1248) #b00000000111111111111111111111111) (= (mask!9099 thiss!1248) #b00000001111111111111111111111111) (= (mask!9099 thiss!1248) #b00000011111111111111111111111111) (= (mask!9099 thiss!1248) #b00000111111111111111111111111111) (= (mask!9099 thiss!1248) #b00001111111111111111111111111111) (= (mask!9099 thiss!1248) #b00011111111111111111111111111111) (= (mask!9099 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9099 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!190678 d!55957))

(declare-fun d!55959 () Bool)

(declare-fun e!125531 () Bool)

(assert (=> d!55959 e!125531))

(declare-fun res!90166 () Bool)

(assert (=> d!55959 (=> (not res!90166) (not e!125531))))

(declare-fun lt!94591 () ListLongMap!2439)

(assert (=> d!55959 (= res!90166 (contains!1346 lt!94591 (_1!1772 (tuple2!3523 key!828 v!309))))))

(declare-fun lt!94588 () List!2418)

(assert (=> d!55959 (= lt!94591 (ListLongMap!2440 lt!94588))))

(declare-fun lt!94589 () Unit!5764)

(declare-fun lt!94590 () Unit!5764)

(assert (=> d!55959 (= lt!94589 lt!94590)))

(declare-datatypes ((Option!243 0))(
  ( (Some!242 (v!4202 V!5571)) (None!241) )
))
(declare-fun getValueByKey!237 (List!2418 (_ BitVec 64)) Option!243)

(assert (=> d!55959 (= (getValueByKey!237 lt!94588 (_1!1772 (tuple2!3523 key!828 v!309))) (Some!242 (_2!1772 (tuple2!3523 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!124 (List!2418 (_ BitVec 64) V!5571) Unit!5764)

(assert (=> d!55959 (= lt!94590 (lemmaContainsTupThenGetReturnValue!124 lt!94588 (_1!1772 (tuple2!3523 key!828 v!309)) (_2!1772 (tuple2!3523 key!828 v!309))))))

(declare-fun insertStrictlySorted!127 (List!2418 (_ BitVec 64) V!5571) List!2418)

(assert (=> d!55959 (= lt!94588 (insertStrictlySorted!127 (toList!1235 lt!94553) (_1!1772 (tuple2!3523 key!828 v!309)) (_2!1772 (tuple2!3523 key!828 v!309))))))

(assert (=> d!55959 (= (+!303 lt!94553 (tuple2!3523 key!828 v!309)) lt!94591)))

(declare-fun b!190732 () Bool)

(declare-fun res!90165 () Bool)

(assert (=> b!190732 (=> (not res!90165) (not e!125531))))

(assert (=> b!190732 (= res!90165 (= (getValueByKey!237 (toList!1235 lt!94591) (_1!1772 (tuple2!3523 key!828 v!309))) (Some!242 (_2!1772 (tuple2!3523 key!828 v!309)))))))

(declare-fun b!190733 () Bool)

(declare-fun contains!1348 (List!2418 tuple2!3522) Bool)

(assert (=> b!190733 (= e!125531 (contains!1348 (toList!1235 lt!94591) (tuple2!3523 key!828 v!309)))))

(assert (= (and d!55959 res!90166) b!190732))

(assert (= (and b!190732 res!90165) b!190733))

(declare-fun m!217199 () Bool)

(assert (=> d!55959 m!217199))

(declare-fun m!217201 () Bool)

(assert (=> d!55959 m!217201))

(declare-fun m!217203 () Bool)

(assert (=> d!55959 m!217203))

(declare-fun m!217205 () Bool)

(assert (=> d!55959 m!217205))

(declare-fun m!217207 () Bool)

(assert (=> b!190732 m!217207))

(declare-fun m!217209 () Bool)

(assert (=> b!190733 m!217209))

(assert (=> b!190678 d!55959))

(declare-fun d!55961 () Bool)

(declare-fun e!125537 () Bool)

(assert (=> d!55961 e!125537))

(declare-fun res!90169 () Bool)

(assert (=> d!55961 (=> res!90169 e!125537)))

(declare-fun lt!94601 () Bool)

(assert (=> d!55961 (= res!90169 (not lt!94601))))

(declare-fun lt!94600 () Bool)

(assert (=> d!55961 (= lt!94601 lt!94600)))

(declare-fun lt!94602 () Unit!5764)

(declare-fun e!125536 () Unit!5764)

(assert (=> d!55961 (= lt!94602 e!125536)))

(declare-fun c!34298 () Bool)

(assert (=> d!55961 (= c!34298 lt!94600)))

(declare-fun containsKey!241 (List!2418 (_ BitVec 64)) Bool)

(assert (=> d!55961 (= lt!94600 (containsKey!241 (toList!1235 lt!94553) key!828))))

(assert (=> d!55961 (= (contains!1346 lt!94553 key!828) lt!94601)))

(declare-fun b!190740 () Bool)

(declare-fun lt!94603 () Unit!5764)

(assert (=> b!190740 (= e!125536 lt!94603)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!189 (List!2418 (_ BitVec 64)) Unit!5764)

(assert (=> b!190740 (= lt!94603 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1235 lt!94553) key!828))))

(declare-fun isDefined!190 (Option!243) Bool)

(assert (=> b!190740 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94553) key!828))))

(declare-fun b!190741 () Bool)

(declare-fun Unit!5770 () Unit!5764)

(assert (=> b!190741 (= e!125536 Unit!5770)))

(declare-fun b!190742 () Bool)

(assert (=> b!190742 (= e!125537 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94553) key!828)))))

(assert (= (and d!55961 c!34298) b!190740))

(assert (= (and d!55961 (not c!34298)) b!190741))

(assert (= (and d!55961 (not res!90169)) b!190742))

(declare-fun m!217211 () Bool)

(assert (=> d!55961 m!217211))

(declare-fun m!217213 () Bool)

(assert (=> b!190740 m!217213))

(declare-fun m!217215 () Bool)

(assert (=> b!190740 m!217215))

(assert (=> b!190740 m!217215))

(declare-fun m!217217 () Bool)

(assert (=> b!190740 m!217217))

(assert (=> b!190742 m!217215))

(assert (=> b!190742 m!217215))

(assert (=> b!190742 m!217217))

(assert (=> b!190678 d!55961))

(declare-fun b!190785 () Bool)

(declare-fun e!125574 () Unit!5764)

(declare-fun lt!94653 () Unit!5764)

(assert (=> b!190785 (= e!125574 lt!94653)))

(declare-fun lt!94650 () ListLongMap!2439)

(declare-fun getCurrentListMapNoExtraKeys!213 (array!8121 array!8123 (_ BitVec 32) (_ BitVec 32) V!5571 V!5571 (_ BitVec 32) Int) ListLongMap!2439)

(assert (=> b!190785 (= lt!94650 (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)))))

(declare-fun lt!94654 () (_ BitVec 64))

(assert (=> b!190785 (= lt!94654 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94665 () (_ BitVec 64))

(assert (=> b!190785 (= lt!94665 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94655 () Unit!5764)

(declare-fun addStillContains!156 (ListLongMap!2439 (_ BitVec 64) V!5571 (_ BitVec 64)) Unit!5764)

(assert (=> b!190785 (= lt!94655 (addStillContains!156 lt!94650 lt!94654 (zeroValue!3733 thiss!1248) lt!94665))))

(assert (=> b!190785 (contains!1346 (+!303 lt!94650 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248))) lt!94665)))

(declare-fun lt!94648 () Unit!5764)

(assert (=> b!190785 (= lt!94648 lt!94655)))

(declare-fun lt!94663 () ListLongMap!2439)

(assert (=> b!190785 (= lt!94663 (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)))))

(declare-fun lt!94666 () (_ BitVec 64))

(assert (=> b!190785 (= lt!94666 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94661 () (_ BitVec 64))

(assert (=> b!190785 (= lt!94661 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94667 () Unit!5764)

(declare-fun addApplyDifferent!156 (ListLongMap!2439 (_ BitVec 64) V!5571 (_ BitVec 64)) Unit!5764)

(assert (=> b!190785 (= lt!94667 (addApplyDifferent!156 lt!94663 lt!94666 (minValue!3733 thiss!1248) lt!94661))))

(declare-fun apply!180 (ListLongMap!2439 (_ BitVec 64)) V!5571)

(assert (=> b!190785 (= (apply!180 (+!303 lt!94663 (tuple2!3523 lt!94666 (minValue!3733 thiss!1248))) lt!94661) (apply!180 lt!94663 lt!94661))))

(declare-fun lt!94658 () Unit!5764)

(assert (=> b!190785 (= lt!94658 lt!94667)))

(declare-fun lt!94669 () ListLongMap!2439)

(assert (=> b!190785 (= lt!94669 (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)))))

(declare-fun lt!94662 () (_ BitVec 64))

(assert (=> b!190785 (= lt!94662 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94649 () (_ BitVec 64))

(assert (=> b!190785 (= lt!94649 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94657 () Unit!5764)

(assert (=> b!190785 (= lt!94657 (addApplyDifferent!156 lt!94669 lt!94662 (zeroValue!3733 thiss!1248) lt!94649))))

(assert (=> b!190785 (= (apply!180 (+!303 lt!94669 (tuple2!3523 lt!94662 (zeroValue!3733 thiss!1248))) lt!94649) (apply!180 lt!94669 lt!94649))))

(declare-fun lt!94651 () Unit!5764)

(assert (=> b!190785 (= lt!94651 lt!94657)))

(declare-fun lt!94656 () ListLongMap!2439)

(assert (=> b!190785 (= lt!94656 (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)))))

(declare-fun lt!94664 () (_ BitVec 64))

(assert (=> b!190785 (= lt!94664 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94652 () (_ BitVec 64))

(assert (=> b!190785 (= lt!94652 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190785 (= lt!94653 (addApplyDifferent!156 lt!94656 lt!94664 (minValue!3733 thiss!1248) lt!94652))))

(assert (=> b!190785 (= (apply!180 (+!303 lt!94656 (tuple2!3523 lt!94664 (minValue!3733 thiss!1248))) lt!94652) (apply!180 lt!94656 lt!94652))))

(declare-fun b!190786 () Bool)

(declare-fun e!125565 () Bool)

(declare-fun e!125572 () Bool)

(assert (=> b!190786 (= e!125565 e!125572)))

(declare-fun res!90194 () Bool)

(declare-fun call!19253 () Bool)

(assert (=> b!190786 (= res!90194 call!19253)))

(assert (=> b!190786 (=> (not res!90194) (not e!125572))))

(declare-fun b!190787 () Bool)

(declare-fun e!125570 () ListLongMap!2439)

(declare-fun call!19248 () ListLongMap!2439)

(assert (=> b!190787 (= e!125570 call!19248)))

(declare-fun b!190788 () Bool)

(declare-fun res!90188 () Bool)

(declare-fun e!125575 () Bool)

(assert (=> b!190788 (=> (not res!90188) (not e!125575))))

(assert (=> b!190788 (= res!90188 e!125565)))

(declare-fun c!34311 () Bool)

(assert (=> b!190788 (= c!34311 (not (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!190789 () Bool)

(declare-fun e!125573 () Bool)

(declare-fun call!19251 () Bool)

(assert (=> b!190789 (= e!125573 (not call!19251))))

(declare-fun b!190790 () Bool)

(declare-fun lt!94668 () ListLongMap!2439)

(assert (=> b!190790 (= e!125572 (= (apply!180 lt!94668 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3733 thiss!1248)))))

(declare-fun b!190791 () Bool)

(declare-fun e!125566 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!190791 (= e!125566 (validKeyInArray!0 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190792 () Bool)

(assert (=> b!190792 (= e!125565 (not call!19253))))

(declare-fun bm!19244 () Bool)

(assert (=> bm!19244 (= call!19251 (contains!1346 lt!94668 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19245 () Bool)

(declare-fun call!19249 () ListLongMap!2439)

(assert (=> bm!19245 (= call!19248 call!19249)))

(declare-fun b!190793 () Bool)

(assert (=> b!190793 (= e!125575 e!125573)))

(declare-fun c!34313 () Bool)

(assert (=> b!190793 (= c!34313 (not (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190794 () Bool)

(declare-fun e!125576 () Bool)

(declare-fun e!125567 () Bool)

(assert (=> b!190794 (= e!125576 e!125567)))

(declare-fun res!90196 () Bool)

(assert (=> b!190794 (=> (not res!90196) (not e!125567))))

(assert (=> b!190794 (= res!90196 (contains!1346 lt!94668 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190794 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(declare-fun bm!19246 () Bool)

(assert (=> bm!19246 (= call!19253 (contains!1346 lt!94668 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190795 () Bool)

(declare-fun e!125569 () Bool)

(assert (=> b!190795 (= e!125569 (validKeyInArray!0 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190796 () Bool)

(declare-fun e!125568 () ListLongMap!2439)

(assert (=> b!190796 (= e!125568 (+!303 call!19249 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))))

(declare-fun bm!19247 () Bool)

(declare-fun call!19247 () ListLongMap!2439)

(declare-fun call!19252 () ListLongMap!2439)

(assert (=> bm!19247 (= call!19247 call!19252)))

(declare-fun b!190797 () Bool)

(declare-fun res!90192 () Bool)

(assert (=> b!190797 (=> (not res!90192) (not e!125575))))

(assert (=> b!190797 (= res!90192 e!125576)))

(declare-fun res!90189 () Bool)

(assert (=> b!190797 (=> res!90189 e!125576)))

(assert (=> b!190797 (= res!90189 (not e!125566))))

(declare-fun res!90191 () Bool)

(assert (=> b!190797 (=> (not res!90191) (not e!125566))))

(assert (=> b!190797 (= res!90191 (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(declare-fun b!190798 () Bool)

(declare-fun e!125571 () ListLongMap!2439)

(assert (=> b!190798 (= e!125571 call!19248)))

(declare-fun b!190799 () Bool)

(declare-fun c!34314 () Bool)

(assert (=> b!190799 (= c!34314 (and (not (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!190799 (= e!125571 e!125570)))

(declare-fun d!55963 () Bool)

(assert (=> d!55963 e!125575))

(declare-fun res!90190 () Bool)

(assert (=> d!55963 (=> (not res!90190) (not e!125575))))

(assert (=> d!55963 (= res!90190 (or (bvsge #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))))

(declare-fun lt!94659 () ListLongMap!2439)

(assert (=> d!55963 (= lt!94668 lt!94659)))

(declare-fun lt!94660 () Unit!5764)

(assert (=> d!55963 (= lt!94660 e!125574)))

(declare-fun c!34316 () Bool)

(assert (=> d!55963 (= c!34316 e!125569)))

(declare-fun res!90193 () Bool)

(assert (=> d!55963 (=> (not res!90193) (not e!125569))))

(assert (=> d!55963 (= res!90193 (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(assert (=> d!55963 (= lt!94659 e!125568)))

(declare-fun c!34312 () Bool)

(assert (=> d!55963 (= c!34312 (and (not (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55963 (validMask!0 (mask!9099 thiss!1248))))

(assert (=> d!55963 (= (getCurrentListMap!883 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)) lt!94668)))

(declare-fun bm!19248 () Bool)

(assert (=> bm!19248 (= call!19252 (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)))))

(declare-fun c!34315 () Bool)

(declare-fun call!19250 () ListLongMap!2439)

(declare-fun bm!19249 () Bool)

(assert (=> bm!19249 (= call!19249 (+!303 (ite c!34312 call!19252 (ite c!34315 call!19247 call!19250)) (ite (or c!34312 c!34315) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))))))

(declare-fun b!190800 () Bool)

(assert (=> b!190800 (= e!125568 e!125571)))

(assert (=> b!190800 (= c!34315 (and (not (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190801 () Bool)

(declare-fun e!125564 () Bool)

(assert (=> b!190801 (= e!125573 e!125564)))

(declare-fun res!90195 () Bool)

(assert (=> b!190801 (= res!90195 call!19251)))

(assert (=> b!190801 (=> (not res!90195) (not e!125564))))

(declare-fun b!190802 () Bool)

(assert (=> b!190802 (= e!125570 call!19250)))

(declare-fun b!190803 () Bool)

(declare-fun Unit!5771 () Unit!5764)

(assert (=> b!190803 (= e!125574 Unit!5771)))

(declare-fun b!190804 () Bool)

(assert (=> b!190804 (= e!125564 (= (apply!180 lt!94668 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3733 thiss!1248)))))

(declare-fun bm!19250 () Bool)

(assert (=> bm!19250 (= call!19250 call!19247)))

(declare-fun b!190805 () Bool)

(declare-fun get!2204 (ValueCell!1878 V!5571) V!5571)

(declare-fun dynLambda!523 (Int (_ BitVec 64)) V!5571)

(assert (=> b!190805 (= e!125567 (= (apply!180 lt!94668 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)) (get!2204 (select (arr!3828 (_values!3875 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3892 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190805 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4149 (_values!3875 thiss!1248))))))

(assert (=> b!190805 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(assert (= (and d!55963 c!34312) b!190796))

(assert (= (and d!55963 (not c!34312)) b!190800))

(assert (= (and b!190800 c!34315) b!190798))

(assert (= (and b!190800 (not c!34315)) b!190799))

(assert (= (and b!190799 c!34314) b!190787))

(assert (= (and b!190799 (not c!34314)) b!190802))

(assert (= (or b!190787 b!190802) bm!19250))

(assert (= (or b!190798 bm!19250) bm!19247))

(assert (= (or b!190798 b!190787) bm!19245))

(assert (= (or b!190796 bm!19247) bm!19248))

(assert (= (or b!190796 bm!19245) bm!19249))

(assert (= (and d!55963 res!90193) b!190795))

(assert (= (and d!55963 c!34316) b!190785))

(assert (= (and d!55963 (not c!34316)) b!190803))

(assert (= (and d!55963 res!90190) b!190797))

(assert (= (and b!190797 res!90191) b!190791))

(assert (= (and b!190797 (not res!90189)) b!190794))

(assert (= (and b!190794 res!90196) b!190805))

(assert (= (and b!190797 res!90192) b!190788))

(assert (= (and b!190788 c!34311) b!190786))

(assert (= (and b!190788 (not c!34311)) b!190792))

(assert (= (and b!190786 res!90194) b!190790))

(assert (= (or b!190786 b!190792) bm!19246))

(assert (= (and b!190788 res!90188) b!190793))

(assert (= (and b!190793 c!34313) b!190801))

(assert (= (and b!190793 (not c!34313)) b!190789))

(assert (= (and b!190801 res!90195) b!190804))

(assert (= (or b!190801 b!190789) bm!19244))

(declare-fun b_lambda!7367 () Bool)

(assert (=> (not b_lambda!7367) (not b!190805)))

(declare-fun t!7331 () Bool)

(declare-fun tb!2871 () Bool)

(assert (=> (and b!190684 (= (defaultEntry!3892 thiss!1248) (defaultEntry!3892 thiss!1248)) t!7331) tb!2871))

(declare-fun result!4891 () Bool)

(assert (=> tb!2871 (= result!4891 tp_is_empty!4443)))

(assert (=> b!190805 t!7331))

(declare-fun b_and!11333 () Bool)

(assert (= b_and!11329 (and (=> t!7331 result!4891) b_and!11333)))

(declare-fun m!217219 () Bool)

(assert (=> b!190794 m!217219))

(assert (=> b!190794 m!217219))

(declare-fun m!217221 () Bool)

(assert (=> b!190794 m!217221))

(assert (=> b!190805 m!217219))

(declare-fun m!217223 () Bool)

(assert (=> b!190805 m!217223))

(declare-fun m!217225 () Bool)

(assert (=> b!190805 m!217225))

(declare-fun m!217227 () Bool)

(assert (=> b!190805 m!217227))

(assert (=> b!190805 m!217219))

(assert (=> b!190805 m!217225))

(assert (=> b!190805 m!217227))

(declare-fun m!217229 () Bool)

(assert (=> b!190805 m!217229))

(declare-fun m!217231 () Bool)

(assert (=> bm!19246 m!217231))

(declare-fun m!217233 () Bool)

(assert (=> bm!19248 m!217233))

(declare-fun m!217235 () Bool)

(assert (=> b!190790 m!217235))

(declare-fun m!217237 () Bool)

(assert (=> b!190804 m!217237))

(declare-fun m!217239 () Bool)

(assert (=> b!190796 m!217239))

(declare-fun m!217241 () Bool)

(assert (=> bm!19244 m!217241))

(assert (=> b!190791 m!217219))

(assert (=> b!190791 m!217219))

(declare-fun m!217243 () Bool)

(assert (=> b!190791 m!217243))

(declare-fun m!217245 () Bool)

(assert (=> b!190785 m!217245))

(declare-fun m!217247 () Bool)

(assert (=> b!190785 m!217247))

(declare-fun m!217249 () Bool)

(assert (=> b!190785 m!217249))

(declare-fun m!217251 () Bool)

(assert (=> b!190785 m!217251))

(declare-fun m!217253 () Bool)

(assert (=> b!190785 m!217253))

(assert (=> b!190785 m!217249))

(declare-fun m!217255 () Bool)

(assert (=> b!190785 m!217255))

(declare-fun m!217257 () Bool)

(assert (=> b!190785 m!217257))

(assert (=> b!190785 m!217255))

(declare-fun m!217259 () Bool)

(assert (=> b!190785 m!217259))

(declare-fun m!217261 () Bool)

(assert (=> b!190785 m!217261))

(declare-fun m!217263 () Bool)

(assert (=> b!190785 m!217263))

(assert (=> b!190785 m!217219))

(declare-fun m!217265 () Bool)

(assert (=> b!190785 m!217265))

(declare-fun m!217267 () Bool)

(assert (=> b!190785 m!217267))

(assert (=> b!190785 m!217261))

(declare-fun m!217269 () Bool)

(assert (=> b!190785 m!217269))

(assert (=> b!190785 m!217259))

(declare-fun m!217271 () Bool)

(assert (=> b!190785 m!217271))

(declare-fun m!217273 () Bool)

(assert (=> b!190785 m!217273))

(assert (=> b!190785 m!217233))

(assert (=> b!190795 m!217219))

(assert (=> b!190795 m!217219))

(assert (=> b!190795 m!217243))

(assert (=> d!55963 m!217153))

(declare-fun m!217275 () Bool)

(assert (=> bm!19249 m!217275))

(assert (=> b!190678 d!55963))

(declare-fun d!55965 () Bool)

(declare-fun e!125579 () Bool)

(assert (=> d!55965 e!125579))

(declare-fun res!90199 () Bool)

(assert (=> d!55965 (=> (not res!90199) (not e!125579))))

(assert (=> d!55965 (= res!90199 (and (bvsge (index!4867 lt!94551) #b00000000000000000000000000000000) (bvslt (index!4867 lt!94551) (size!4149 (_values!3875 thiss!1248)))))))

(declare-fun lt!94672 () Unit!5764)

(declare-fun choose!1028 (array!8121 array!8123 (_ BitVec 32) (_ BitVec 32) V!5571 V!5571 (_ BitVec 32) (_ BitVec 64) V!5571 Int) Unit!5764)

(assert (=> d!55965 (= lt!94672 (choose!1028 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) (index!4867 lt!94551) key!828 v!309 (defaultEntry!3892 thiss!1248)))))

(assert (=> d!55965 (validMask!0 (mask!9099 thiss!1248))))

(assert (=> d!55965 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!104 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) (index!4867 lt!94551) key!828 v!309 (defaultEntry!3892 thiss!1248)) lt!94672)))

(declare-fun b!190810 () Bool)

(assert (=> b!190810 (= e!125579 (= (+!303 (getCurrentListMap!883 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)) (tuple2!3523 key!828 v!309)) (getCurrentListMap!883 (_keys!5865 thiss!1248) (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248))) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248))))))

(assert (= (and d!55965 res!90199) b!190810))

(declare-fun m!217277 () Bool)

(assert (=> d!55965 m!217277))

(assert (=> d!55965 m!217153))

(assert (=> b!190810 m!217149))

(assert (=> b!190810 m!217149))

(declare-fun m!217279 () Bool)

(assert (=> b!190810 m!217279))

(assert (=> b!190810 m!217151))

(assert (=> b!190810 m!217157))

(assert (=> b!190678 d!55965))

(declare-fun b!190811 () Bool)

(declare-fun e!125590 () Unit!5764)

(declare-fun lt!94678 () Unit!5764)

(assert (=> b!190811 (= e!125590 lt!94678)))

(declare-fun lt!94675 () ListLongMap!2439)

(assert (=> b!190811 (= lt!94675 (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248))) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)))))

(declare-fun lt!94679 () (_ BitVec 64))

(assert (=> b!190811 (= lt!94679 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94690 () (_ BitVec 64))

(assert (=> b!190811 (= lt!94690 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94680 () Unit!5764)

(assert (=> b!190811 (= lt!94680 (addStillContains!156 lt!94675 lt!94679 (zeroValue!3733 thiss!1248) lt!94690))))

(assert (=> b!190811 (contains!1346 (+!303 lt!94675 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248))) lt!94690)))

(declare-fun lt!94673 () Unit!5764)

(assert (=> b!190811 (= lt!94673 lt!94680)))

(declare-fun lt!94688 () ListLongMap!2439)

(assert (=> b!190811 (= lt!94688 (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248))) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)))))

(declare-fun lt!94691 () (_ BitVec 64))

(assert (=> b!190811 (= lt!94691 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94686 () (_ BitVec 64))

(assert (=> b!190811 (= lt!94686 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94692 () Unit!5764)

(assert (=> b!190811 (= lt!94692 (addApplyDifferent!156 lt!94688 lt!94691 (minValue!3733 thiss!1248) lt!94686))))

(assert (=> b!190811 (= (apply!180 (+!303 lt!94688 (tuple2!3523 lt!94691 (minValue!3733 thiss!1248))) lt!94686) (apply!180 lt!94688 lt!94686))))

(declare-fun lt!94683 () Unit!5764)

(assert (=> b!190811 (= lt!94683 lt!94692)))

(declare-fun lt!94694 () ListLongMap!2439)

(assert (=> b!190811 (= lt!94694 (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248))) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)))))

(declare-fun lt!94687 () (_ BitVec 64))

(assert (=> b!190811 (= lt!94687 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94674 () (_ BitVec 64))

(assert (=> b!190811 (= lt!94674 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94682 () Unit!5764)

(assert (=> b!190811 (= lt!94682 (addApplyDifferent!156 lt!94694 lt!94687 (zeroValue!3733 thiss!1248) lt!94674))))

(assert (=> b!190811 (= (apply!180 (+!303 lt!94694 (tuple2!3523 lt!94687 (zeroValue!3733 thiss!1248))) lt!94674) (apply!180 lt!94694 lt!94674))))

(declare-fun lt!94676 () Unit!5764)

(assert (=> b!190811 (= lt!94676 lt!94682)))

(declare-fun lt!94681 () ListLongMap!2439)

(assert (=> b!190811 (= lt!94681 (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248))) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)))))

(declare-fun lt!94689 () (_ BitVec 64))

(assert (=> b!190811 (= lt!94689 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94677 () (_ BitVec 64))

(assert (=> b!190811 (= lt!94677 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190811 (= lt!94678 (addApplyDifferent!156 lt!94681 lt!94689 (minValue!3733 thiss!1248) lt!94677))))

(assert (=> b!190811 (= (apply!180 (+!303 lt!94681 (tuple2!3523 lt!94689 (minValue!3733 thiss!1248))) lt!94677) (apply!180 lt!94681 lt!94677))))

(declare-fun b!190812 () Bool)

(declare-fun e!125581 () Bool)

(declare-fun e!125588 () Bool)

(assert (=> b!190812 (= e!125581 e!125588)))

(declare-fun res!90206 () Bool)

(declare-fun call!19260 () Bool)

(assert (=> b!190812 (= res!90206 call!19260)))

(assert (=> b!190812 (=> (not res!90206) (not e!125588))))

(declare-fun b!190813 () Bool)

(declare-fun e!125586 () ListLongMap!2439)

(declare-fun call!19255 () ListLongMap!2439)

(assert (=> b!190813 (= e!125586 call!19255)))

(declare-fun b!190814 () Bool)

(declare-fun res!90200 () Bool)

(declare-fun e!125591 () Bool)

(assert (=> b!190814 (=> (not res!90200) (not e!125591))))

(assert (=> b!190814 (= res!90200 e!125581)))

(declare-fun c!34317 () Bool)

(assert (=> b!190814 (= c!34317 (not (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!190815 () Bool)

(declare-fun e!125589 () Bool)

(declare-fun call!19258 () Bool)

(assert (=> b!190815 (= e!125589 (not call!19258))))

(declare-fun b!190816 () Bool)

(declare-fun lt!94693 () ListLongMap!2439)

(assert (=> b!190816 (= e!125588 (= (apply!180 lt!94693 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3733 thiss!1248)))))

(declare-fun b!190817 () Bool)

(declare-fun e!125582 () Bool)

(assert (=> b!190817 (= e!125582 (validKeyInArray!0 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190818 () Bool)

(assert (=> b!190818 (= e!125581 (not call!19260))))

(declare-fun bm!19251 () Bool)

(assert (=> bm!19251 (= call!19258 (contains!1346 lt!94693 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19252 () Bool)

(declare-fun call!19256 () ListLongMap!2439)

(assert (=> bm!19252 (= call!19255 call!19256)))

(declare-fun b!190819 () Bool)

(assert (=> b!190819 (= e!125591 e!125589)))

(declare-fun c!34319 () Bool)

(assert (=> b!190819 (= c!34319 (not (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190820 () Bool)

(declare-fun e!125592 () Bool)

(declare-fun e!125583 () Bool)

(assert (=> b!190820 (= e!125592 e!125583)))

(declare-fun res!90208 () Bool)

(assert (=> b!190820 (=> (not res!90208) (not e!125583))))

(assert (=> b!190820 (= res!90208 (contains!1346 lt!94693 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190820 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(declare-fun bm!19253 () Bool)

(assert (=> bm!19253 (= call!19260 (contains!1346 lt!94693 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190821 () Bool)

(declare-fun e!125585 () Bool)

(assert (=> b!190821 (= e!125585 (validKeyInArray!0 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190822 () Bool)

(declare-fun e!125584 () ListLongMap!2439)

(assert (=> b!190822 (= e!125584 (+!303 call!19256 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))))

(declare-fun bm!19254 () Bool)

(declare-fun call!19254 () ListLongMap!2439)

(declare-fun call!19259 () ListLongMap!2439)

(assert (=> bm!19254 (= call!19254 call!19259)))

(declare-fun b!190823 () Bool)

(declare-fun res!90204 () Bool)

(assert (=> b!190823 (=> (not res!90204) (not e!125591))))

(assert (=> b!190823 (= res!90204 e!125592)))

(declare-fun res!90201 () Bool)

(assert (=> b!190823 (=> res!90201 e!125592)))

(assert (=> b!190823 (= res!90201 (not e!125582))))

(declare-fun res!90203 () Bool)

(assert (=> b!190823 (=> (not res!90203) (not e!125582))))

(assert (=> b!190823 (= res!90203 (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(declare-fun b!190824 () Bool)

(declare-fun e!125587 () ListLongMap!2439)

(assert (=> b!190824 (= e!125587 call!19255)))

(declare-fun b!190825 () Bool)

(declare-fun c!34320 () Bool)

(assert (=> b!190825 (= c!34320 (and (not (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!190825 (= e!125587 e!125586)))

(declare-fun d!55967 () Bool)

(assert (=> d!55967 e!125591))

(declare-fun res!90202 () Bool)

(assert (=> d!55967 (=> (not res!90202) (not e!125591))))

(assert (=> d!55967 (= res!90202 (or (bvsge #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))))

(declare-fun lt!94684 () ListLongMap!2439)

(assert (=> d!55967 (= lt!94693 lt!94684)))

(declare-fun lt!94685 () Unit!5764)

(assert (=> d!55967 (= lt!94685 e!125590)))

(declare-fun c!34322 () Bool)

(assert (=> d!55967 (= c!34322 e!125585)))

(declare-fun res!90205 () Bool)

(assert (=> d!55967 (=> (not res!90205) (not e!125585))))

(assert (=> d!55967 (= res!90205 (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(assert (=> d!55967 (= lt!94684 e!125584)))

(declare-fun c!34318 () Bool)

(assert (=> d!55967 (= c!34318 (and (not (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55967 (validMask!0 (mask!9099 thiss!1248))))

(assert (=> d!55967 (= (getCurrentListMap!883 (_keys!5865 thiss!1248) (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248))) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)) lt!94693)))

(declare-fun bm!19255 () Bool)

(assert (=> bm!19255 (= call!19259 (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248))) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)))))

(declare-fun call!19257 () ListLongMap!2439)

(declare-fun c!34321 () Bool)

(declare-fun bm!19256 () Bool)

(assert (=> bm!19256 (= call!19256 (+!303 (ite c!34318 call!19259 (ite c!34321 call!19254 call!19257)) (ite (or c!34318 c!34321) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))))))

(declare-fun b!190826 () Bool)

(assert (=> b!190826 (= e!125584 e!125587)))

(assert (=> b!190826 (= c!34321 (and (not (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3629 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190827 () Bool)

(declare-fun e!125580 () Bool)

(assert (=> b!190827 (= e!125589 e!125580)))

(declare-fun res!90207 () Bool)

(assert (=> b!190827 (= res!90207 call!19258)))

(assert (=> b!190827 (=> (not res!90207) (not e!125580))))

(declare-fun b!190828 () Bool)

(assert (=> b!190828 (= e!125586 call!19257)))

(declare-fun b!190829 () Bool)

(declare-fun Unit!5772 () Unit!5764)

(assert (=> b!190829 (= e!125590 Unit!5772)))

(declare-fun b!190830 () Bool)

(assert (=> b!190830 (= e!125580 (= (apply!180 lt!94693 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3733 thiss!1248)))))

(declare-fun bm!19257 () Bool)

(assert (=> bm!19257 (= call!19257 call!19254)))

(declare-fun b!190831 () Bool)

(assert (=> b!190831 (= e!125583 (= (apply!180 lt!94693 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)) (get!2204 (select (arr!3828 (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3892 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190831 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4149 (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248))))))))

(assert (=> b!190831 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(assert (= (and d!55967 c!34318) b!190822))

(assert (= (and d!55967 (not c!34318)) b!190826))

(assert (= (and b!190826 c!34321) b!190824))

(assert (= (and b!190826 (not c!34321)) b!190825))

(assert (= (and b!190825 c!34320) b!190813))

(assert (= (and b!190825 (not c!34320)) b!190828))

(assert (= (or b!190813 b!190828) bm!19257))

(assert (= (or b!190824 bm!19257) bm!19254))

(assert (= (or b!190824 b!190813) bm!19252))

(assert (= (or b!190822 bm!19254) bm!19255))

(assert (= (or b!190822 bm!19252) bm!19256))

(assert (= (and d!55967 res!90205) b!190821))

(assert (= (and d!55967 c!34322) b!190811))

(assert (= (and d!55967 (not c!34322)) b!190829))

(assert (= (and d!55967 res!90202) b!190823))

(assert (= (and b!190823 res!90203) b!190817))

(assert (= (and b!190823 (not res!90201)) b!190820))

(assert (= (and b!190820 res!90208) b!190831))

(assert (= (and b!190823 res!90204) b!190814))

(assert (= (and b!190814 c!34317) b!190812))

(assert (= (and b!190814 (not c!34317)) b!190818))

(assert (= (and b!190812 res!90206) b!190816))

(assert (= (or b!190812 b!190818) bm!19253))

(assert (= (and b!190814 res!90200) b!190819))

(assert (= (and b!190819 c!34319) b!190827))

(assert (= (and b!190819 (not c!34319)) b!190815))

(assert (= (and b!190827 res!90207) b!190830))

(assert (= (or b!190827 b!190815) bm!19251))

(declare-fun b_lambda!7369 () Bool)

(assert (=> (not b_lambda!7369) (not b!190831)))

(assert (=> b!190831 t!7331))

(declare-fun b_and!11335 () Bool)

(assert (= b_and!11333 (and (=> t!7331 result!4891) b_and!11335)))

(assert (=> b!190820 m!217219))

(assert (=> b!190820 m!217219))

(declare-fun m!217281 () Bool)

(assert (=> b!190820 m!217281))

(assert (=> b!190831 m!217219))

(declare-fun m!217283 () Bool)

(assert (=> b!190831 m!217283))

(declare-fun m!217285 () Bool)

(assert (=> b!190831 m!217285))

(assert (=> b!190831 m!217227))

(assert (=> b!190831 m!217219))

(assert (=> b!190831 m!217285))

(assert (=> b!190831 m!217227))

(declare-fun m!217287 () Bool)

(assert (=> b!190831 m!217287))

(declare-fun m!217289 () Bool)

(assert (=> bm!19253 m!217289))

(declare-fun m!217291 () Bool)

(assert (=> bm!19255 m!217291))

(declare-fun m!217293 () Bool)

(assert (=> b!190816 m!217293))

(declare-fun m!217295 () Bool)

(assert (=> b!190830 m!217295))

(declare-fun m!217297 () Bool)

(assert (=> b!190822 m!217297))

(declare-fun m!217299 () Bool)

(assert (=> bm!19251 m!217299))

(assert (=> b!190817 m!217219))

(assert (=> b!190817 m!217219))

(assert (=> b!190817 m!217243))

(declare-fun m!217301 () Bool)

(assert (=> b!190811 m!217301))

(declare-fun m!217303 () Bool)

(assert (=> b!190811 m!217303))

(declare-fun m!217305 () Bool)

(assert (=> b!190811 m!217305))

(declare-fun m!217307 () Bool)

(assert (=> b!190811 m!217307))

(declare-fun m!217309 () Bool)

(assert (=> b!190811 m!217309))

(assert (=> b!190811 m!217305))

(declare-fun m!217311 () Bool)

(assert (=> b!190811 m!217311))

(declare-fun m!217313 () Bool)

(assert (=> b!190811 m!217313))

(assert (=> b!190811 m!217311))

(declare-fun m!217315 () Bool)

(assert (=> b!190811 m!217315))

(declare-fun m!217317 () Bool)

(assert (=> b!190811 m!217317))

(declare-fun m!217319 () Bool)

(assert (=> b!190811 m!217319))

(assert (=> b!190811 m!217219))

(declare-fun m!217321 () Bool)

(assert (=> b!190811 m!217321))

(declare-fun m!217323 () Bool)

(assert (=> b!190811 m!217323))

(assert (=> b!190811 m!217317))

(declare-fun m!217325 () Bool)

(assert (=> b!190811 m!217325))

(assert (=> b!190811 m!217315))

(declare-fun m!217327 () Bool)

(assert (=> b!190811 m!217327))

(declare-fun m!217329 () Bool)

(assert (=> b!190811 m!217329))

(assert (=> b!190811 m!217291))

(assert (=> b!190821 m!217219))

(assert (=> b!190821 m!217219))

(assert (=> b!190821 m!217243))

(assert (=> d!55967 m!217153))

(declare-fun m!217331 () Bool)

(assert (=> bm!19256 m!217331))

(assert (=> b!190678 d!55967))

(declare-fun b!190848 () Bool)

(declare-fun res!90218 () Bool)

(declare-fun e!125604 () Bool)

(assert (=> b!190848 (=> (not res!90218) (not e!125604))))

(declare-fun call!19266 () Bool)

(assert (=> b!190848 (= res!90218 call!19266)))

(declare-fun e!125601 () Bool)

(assert (=> b!190848 (= e!125601 e!125604)))

(declare-fun b!190849 () Bool)

(declare-fun call!19265 () Bool)

(assert (=> b!190849 (= e!125604 (not call!19265))))

(declare-fun b!190850 () Bool)

(declare-fun res!90219 () Bool)

(assert (=> b!190850 (=> (not res!90219) (not e!125604))))

(declare-fun lt!94699 () SeekEntryResult!674)

(assert (=> b!190850 (= res!90219 (= (select (arr!3827 (_keys!5865 thiss!1248)) (index!4869 lt!94699)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190850 (and (bvsge (index!4869 lt!94699) #b00000000000000000000000000000000) (bvslt (index!4869 lt!94699) (size!4148 (_keys!5865 thiss!1248))))))

(declare-fun d!55969 () Bool)

(declare-fun e!125602 () Bool)

(assert (=> d!55969 e!125602))

(declare-fun c!34327 () Bool)

(assert (=> d!55969 (= c!34327 ((_ is MissingZero!674) lt!94699))))

(assert (=> d!55969 (= lt!94699 (seekEntryOrOpen!0 key!828 (_keys!5865 thiss!1248) (mask!9099 thiss!1248)))))

(declare-fun lt!94700 () Unit!5764)

(declare-fun choose!1029 (array!8121 array!8123 (_ BitVec 32) (_ BitVec 32) V!5571 V!5571 (_ BitVec 64) Int) Unit!5764)

(assert (=> d!55969 (= lt!94700 (choose!1029 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) key!828 (defaultEntry!3892 thiss!1248)))))

(assert (=> d!55969 (validMask!0 (mask!9099 thiss!1248))))

(assert (=> d!55969 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!177 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) key!828 (defaultEntry!3892 thiss!1248)) lt!94700)))

(declare-fun b!190851 () Bool)

(declare-fun e!125603 () Bool)

(assert (=> b!190851 (= e!125602 e!125603)))

(declare-fun res!90217 () Bool)

(assert (=> b!190851 (= res!90217 call!19266)))

(assert (=> b!190851 (=> (not res!90217) (not e!125603))))

(declare-fun b!190852 () Bool)

(assert (=> b!190852 (= e!125603 (not call!19265))))

(declare-fun b!190853 () Bool)

(assert (=> b!190853 (and (bvsge (index!4866 lt!94699) #b00000000000000000000000000000000) (bvslt (index!4866 lt!94699) (size!4148 (_keys!5865 thiss!1248))))))

(declare-fun res!90220 () Bool)

(assert (=> b!190853 (= res!90220 (= (select (arr!3827 (_keys!5865 thiss!1248)) (index!4866 lt!94699)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190853 (=> (not res!90220) (not e!125603))))

(declare-fun b!190854 () Bool)

(assert (=> b!190854 (= e!125602 e!125601)))

(declare-fun c!34328 () Bool)

(assert (=> b!190854 (= c!34328 ((_ is MissingVacant!674) lt!94699))))

(declare-fun bm!19262 () Bool)

(declare-fun arrayContainsKey!0 (array!8121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19262 (= call!19265 (arrayContainsKey!0 (_keys!5865 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun bm!19263 () Bool)

(assert (=> bm!19263 (= call!19266 (inRange!0 (ite c!34327 (index!4866 lt!94699) (index!4869 lt!94699)) (mask!9099 thiss!1248)))))

(declare-fun b!190855 () Bool)

(assert (=> b!190855 (= e!125601 ((_ is Undefined!674) lt!94699))))

(assert (= (and d!55969 c!34327) b!190851))

(assert (= (and d!55969 (not c!34327)) b!190854))

(assert (= (and b!190851 res!90217) b!190853))

(assert (= (and b!190853 res!90220) b!190852))

(assert (= (and b!190854 c!34328) b!190848))

(assert (= (and b!190854 (not c!34328)) b!190855))

(assert (= (and b!190848 res!90218) b!190850))

(assert (= (and b!190850 res!90219) b!190849))

(assert (= (or b!190851 b!190848) bm!19263))

(assert (= (or b!190852 b!190849) bm!19262))

(assert (=> d!55969 m!217131))

(declare-fun m!217333 () Bool)

(assert (=> d!55969 m!217333))

(assert (=> d!55969 m!217153))

(declare-fun m!217335 () Bool)

(assert (=> b!190850 m!217335))

(declare-fun m!217337 () Bool)

(assert (=> b!190853 m!217337))

(declare-fun m!217339 () Bool)

(assert (=> bm!19262 m!217339))

(declare-fun m!217341 () Bool)

(assert (=> bm!19263 m!217341))

(assert (=> b!190682 d!55969))

(declare-fun d!55971 () Bool)

(declare-fun res!90227 () Bool)

(declare-fun e!125607 () Bool)

(assert (=> d!55971 (=> (not res!90227) (not e!125607))))

(declare-fun simpleValid!196 (LongMapFixedSize!2664) Bool)

(assert (=> d!55971 (= res!90227 (simpleValid!196 thiss!1248))))

(assert (=> d!55971 (= (valid!1094 thiss!1248) e!125607)))

(declare-fun b!190862 () Bool)

(declare-fun res!90228 () Bool)

(assert (=> b!190862 (=> (not res!90228) (not e!125607))))

(declare-fun arrayCountValidKeys!0 (array!8121 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!190862 (= res!90228 (= (arrayCountValidKeys!0 (_keys!5865 thiss!1248) #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))) (_size!1381 thiss!1248)))))

(declare-fun b!190863 () Bool)

(declare-fun res!90229 () Bool)

(assert (=> b!190863 (=> (not res!90229) (not e!125607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8121 (_ BitVec 32)) Bool)

(assert (=> b!190863 (= res!90229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5865 thiss!1248) (mask!9099 thiss!1248)))))

(declare-fun b!190864 () Bool)

(declare-datatypes ((List!2420 0))(
  ( (Nil!2417) (Cons!2416 (h!3054 (_ BitVec 64)) (t!7332 List!2420)) )
))
(declare-fun arrayNoDuplicates!0 (array!8121 (_ BitVec 32) List!2420) Bool)

(assert (=> b!190864 (= e!125607 (arrayNoDuplicates!0 (_keys!5865 thiss!1248) #b00000000000000000000000000000000 Nil!2417))))

(assert (= (and d!55971 res!90227) b!190862))

(assert (= (and b!190862 res!90228) b!190863))

(assert (= (and b!190863 res!90229) b!190864))

(declare-fun m!217343 () Bool)

(assert (=> d!55971 m!217343))

(declare-fun m!217345 () Bool)

(assert (=> b!190862 m!217345))

(declare-fun m!217347 () Bool)

(assert (=> b!190863 m!217347))

(declare-fun m!217349 () Bool)

(assert (=> b!190864 m!217349))

(assert (=> start!19398 d!55971))

(declare-fun b!190877 () Bool)

(declare-fun c!34335 () Bool)

(declare-fun lt!94709 () (_ BitVec 64))

(assert (=> b!190877 (= c!34335 (= lt!94709 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!125615 () SeekEntryResult!674)

(declare-fun e!125614 () SeekEntryResult!674)

(assert (=> b!190877 (= e!125615 e!125614)))

(declare-fun b!190878 () Bool)

(declare-fun e!125616 () SeekEntryResult!674)

(assert (=> b!190878 (= e!125616 e!125615)))

(declare-fun lt!94707 () SeekEntryResult!674)

(assert (=> b!190878 (= lt!94709 (select (arr!3827 (_keys!5865 thiss!1248)) (index!4868 lt!94707)))))

(declare-fun c!34337 () Bool)

(assert (=> b!190878 (= c!34337 (= lt!94709 key!828))))

(declare-fun b!190879 () Bool)

(assert (=> b!190879 (= e!125616 Undefined!674)))

(declare-fun d!55973 () Bool)

(declare-fun lt!94708 () SeekEntryResult!674)

(assert (=> d!55973 (and (or ((_ is Undefined!674) lt!94708) (not ((_ is Found!674) lt!94708)) (and (bvsge (index!4867 lt!94708) #b00000000000000000000000000000000) (bvslt (index!4867 lt!94708) (size!4148 (_keys!5865 thiss!1248))))) (or ((_ is Undefined!674) lt!94708) ((_ is Found!674) lt!94708) (not ((_ is MissingZero!674) lt!94708)) (and (bvsge (index!4866 lt!94708) #b00000000000000000000000000000000) (bvslt (index!4866 lt!94708) (size!4148 (_keys!5865 thiss!1248))))) (or ((_ is Undefined!674) lt!94708) ((_ is Found!674) lt!94708) ((_ is MissingZero!674) lt!94708) (not ((_ is MissingVacant!674) lt!94708)) (and (bvsge (index!4869 lt!94708) #b00000000000000000000000000000000) (bvslt (index!4869 lt!94708) (size!4148 (_keys!5865 thiss!1248))))) (or ((_ is Undefined!674) lt!94708) (ite ((_ is Found!674) lt!94708) (= (select (arr!3827 (_keys!5865 thiss!1248)) (index!4867 lt!94708)) key!828) (ite ((_ is MissingZero!674) lt!94708) (= (select (arr!3827 (_keys!5865 thiss!1248)) (index!4866 lt!94708)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!674) lt!94708) (= (select (arr!3827 (_keys!5865 thiss!1248)) (index!4869 lt!94708)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55973 (= lt!94708 e!125616)))

(declare-fun c!34336 () Bool)

(assert (=> d!55973 (= c!34336 (and ((_ is Intermediate!674) lt!94707) (undefined!1486 lt!94707)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8121 (_ BitVec 32)) SeekEntryResult!674)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55973 (= lt!94707 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9099 thiss!1248)) key!828 (_keys!5865 thiss!1248) (mask!9099 thiss!1248)))))

(assert (=> d!55973 (validMask!0 (mask!9099 thiss!1248))))

(assert (=> d!55973 (= (seekEntryOrOpen!0 key!828 (_keys!5865 thiss!1248) (mask!9099 thiss!1248)) lt!94708)))

(declare-fun b!190880 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8121 (_ BitVec 32)) SeekEntryResult!674)

(assert (=> b!190880 (= e!125614 (seekKeyOrZeroReturnVacant!0 (x!20502 lt!94707) (index!4868 lt!94707) (index!4868 lt!94707) key!828 (_keys!5865 thiss!1248) (mask!9099 thiss!1248)))))

(declare-fun b!190881 () Bool)

(assert (=> b!190881 (= e!125614 (MissingZero!674 (index!4868 lt!94707)))))

(declare-fun b!190882 () Bool)

(assert (=> b!190882 (= e!125615 (Found!674 (index!4868 lt!94707)))))

(assert (= (and d!55973 c!34336) b!190879))

(assert (= (and d!55973 (not c!34336)) b!190878))

(assert (= (and b!190878 c!34337) b!190882))

(assert (= (and b!190878 (not c!34337)) b!190877))

(assert (= (and b!190877 c!34335) b!190881))

(assert (= (and b!190877 (not c!34335)) b!190880))

(declare-fun m!217351 () Bool)

(assert (=> b!190878 m!217351))

(assert (=> d!55973 m!217153))

(declare-fun m!217353 () Bool)

(assert (=> d!55973 m!217353))

(declare-fun m!217355 () Bool)

(assert (=> d!55973 m!217355))

(declare-fun m!217357 () Bool)

(assert (=> d!55973 m!217357))

(declare-fun m!217359 () Bool)

(assert (=> d!55973 m!217359))

(declare-fun m!217361 () Bool)

(assert (=> d!55973 m!217361))

(assert (=> d!55973 m!217355))

(declare-fun m!217363 () Bool)

(assert (=> b!190880 m!217363))

(assert (=> b!190680 d!55973))

(declare-fun mapIsEmpty!7676 () Bool)

(declare-fun mapRes!7676 () Bool)

(assert (=> mapIsEmpty!7676 mapRes!7676))

(declare-fun condMapEmpty!7676 () Bool)

(declare-fun mapDefault!7676 () ValueCell!1878)

(assert (=> mapNonEmpty!7670 (= condMapEmpty!7676 (= mapRest!7670 ((as const (Array (_ BitVec 32) ValueCell!1878)) mapDefault!7676)))))

(declare-fun e!125621 () Bool)

(assert (=> mapNonEmpty!7670 (= tp!16855 (and e!125621 mapRes!7676))))

(declare-fun b!190890 () Bool)

(assert (=> b!190890 (= e!125621 tp_is_empty!4443)))

(declare-fun mapNonEmpty!7676 () Bool)

(declare-fun tp!16865 () Bool)

(declare-fun e!125622 () Bool)

(assert (=> mapNonEmpty!7676 (= mapRes!7676 (and tp!16865 e!125622))))

(declare-fun mapValue!7676 () ValueCell!1878)

(declare-fun mapKey!7676 () (_ BitVec 32))

(declare-fun mapRest!7676 () (Array (_ BitVec 32) ValueCell!1878))

(assert (=> mapNonEmpty!7676 (= mapRest!7670 (store mapRest!7676 mapKey!7676 mapValue!7676))))

(declare-fun b!190889 () Bool)

(assert (=> b!190889 (= e!125622 tp_is_empty!4443)))

(assert (= (and mapNonEmpty!7670 condMapEmpty!7676) mapIsEmpty!7676))

(assert (= (and mapNonEmpty!7670 (not condMapEmpty!7676)) mapNonEmpty!7676))

(assert (= (and mapNonEmpty!7676 ((_ is ValueCellFull!1878) mapValue!7676)) b!190889))

(assert (= (and mapNonEmpty!7670 ((_ is ValueCellFull!1878) mapDefault!7676)) b!190890))

(declare-fun m!217365 () Bool)

(assert (=> mapNonEmpty!7676 m!217365))

(declare-fun b_lambda!7371 () Bool)

(assert (= b_lambda!7369 (or (and b!190684 b_free!4671) b_lambda!7371)))

(declare-fun b_lambda!7373 () Bool)

(assert (= b_lambda!7367 (or (and b!190684 b_free!4671) b_lambda!7373)))

(check-sat (not b_lambda!7371) (not d!55953) (not b!190817) (not b!190820) (not d!55967) (not b!190733) (not b!190794) (not b!190795) (not bm!19263) (not b!190785) (not b!190822) (not d!55961) (not b_lambda!7373) (not b!190796) (not d!55959) (not bm!19248) (not b!190742) (not bm!19262) (not bm!19255) (not d!55965) (not b_next!4671) (not b!190862) (not b!190864) tp_is_empty!4443 (not d!55973) (not b!190732) (not bm!19249) (not b!190863) (not b!190726) (not b!190804) (not b!190740) (not bm!19246) (not b!190816) (not bm!19251) (not b!190811) (not bm!19256) (not b!190880) (not b!190810) b_and!11335 (not b!190830) (not b!190805) (not b!190831) (not mapNonEmpty!7676) (not b!190790) (not d!55971) (not b!190821) (not d!55963) (not bm!19244) (not d!55969) (not b!190791) (not bm!19253))
(check-sat b_and!11335 (not b_next!4671))
(get-model)

(declare-fun d!55975 () Bool)

(assert (=> d!55975 (= (+!303 (getCurrentListMap!883 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)) (tuple2!3523 key!828 v!309)) (getCurrentListMap!883 (_keys!5865 thiss!1248) (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248))) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)))))

(assert (=> d!55975 true))

(declare-fun _$5!149 () Unit!5764)

(assert (=> d!55975 (= (choose!1028 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) (index!4867 lt!94551) key!828 v!309 (defaultEntry!3892 thiss!1248)) _$5!149)))

(declare-fun bs!7636 () Bool)

(assert (= bs!7636 d!55975))

(assert (=> bs!7636 m!217149))

(assert (=> bs!7636 m!217149))

(assert (=> bs!7636 m!217279))

(assert (=> bs!7636 m!217151))

(assert (=> bs!7636 m!217157))

(assert (=> d!55965 d!55975))

(assert (=> d!55965 d!55957))

(declare-fun b!190915 () Bool)

(assert (=> b!190915 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(assert (=> b!190915 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4149 (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248))))))))

(declare-fun lt!94728 () ListLongMap!2439)

(declare-fun e!125639 () Bool)

(assert (=> b!190915 (= e!125639 (= (apply!180 lt!94728 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)) (get!2204 (select (arr!3828 (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3892 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!190916 () Bool)

(declare-fun e!125637 () ListLongMap!2439)

(declare-fun call!19269 () ListLongMap!2439)

(assert (=> b!190916 (= e!125637 call!19269)))

(declare-fun d!55977 () Bool)

(declare-fun e!125642 () Bool)

(assert (=> d!55977 e!125642))

(declare-fun res!90241 () Bool)

(assert (=> d!55977 (=> (not res!90241) (not e!125642))))

(assert (=> d!55977 (= res!90241 (not (contains!1346 lt!94728 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!125640 () ListLongMap!2439)

(assert (=> d!55977 (= lt!94728 e!125640)))

(declare-fun c!34347 () Bool)

(assert (=> d!55977 (= c!34347 (bvsge #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(assert (=> d!55977 (validMask!0 (mask!9099 thiss!1248))))

(assert (=> d!55977 (= (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248))) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)) lt!94728)))

(declare-fun bm!19266 () Bool)

(assert (=> bm!19266 (= call!19269 (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248))) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3892 thiss!1248)))))

(declare-fun b!190917 () Bool)

(assert (=> b!190917 (= e!125640 (ListLongMap!2440 Nil!2415))))

(declare-fun b!190918 () Bool)

(assert (=> b!190918 (= e!125640 e!125637)))

(declare-fun c!34346 () Bool)

(assert (=> b!190918 (= c!34346 (validKeyInArray!0 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190919 () Bool)

(declare-fun e!125641 () Bool)

(declare-fun isEmpty!481 (ListLongMap!2439) Bool)

(assert (=> b!190919 (= e!125641 (isEmpty!481 lt!94728))))

(declare-fun b!190920 () Bool)

(declare-fun e!125638 () Bool)

(assert (=> b!190920 (= e!125642 e!125638)))

(declare-fun c!34349 () Bool)

(declare-fun e!125643 () Bool)

(assert (=> b!190920 (= c!34349 e!125643)))

(declare-fun res!90239 () Bool)

(assert (=> b!190920 (=> (not res!90239) (not e!125643))))

(assert (=> b!190920 (= res!90239 (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(declare-fun b!190921 () Bool)

(assert (=> b!190921 (= e!125638 e!125639)))

(assert (=> b!190921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(declare-fun res!90238 () Bool)

(assert (=> b!190921 (= res!90238 (contains!1346 lt!94728 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190921 (=> (not res!90238) (not e!125639))))

(declare-fun b!190922 () Bool)

(declare-fun lt!94729 () Unit!5764)

(declare-fun lt!94727 () Unit!5764)

(assert (=> b!190922 (= lt!94729 lt!94727)))

(declare-fun lt!94726 () ListLongMap!2439)

(declare-fun lt!94725 () (_ BitVec 64))

(declare-fun lt!94724 () V!5571)

(declare-fun lt!94730 () (_ BitVec 64))

(assert (=> b!190922 (not (contains!1346 (+!303 lt!94726 (tuple2!3523 lt!94730 lt!94724)) lt!94725))))

(declare-fun addStillNotContains!94 (ListLongMap!2439 (_ BitVec 64) V!5571 (_ BitVec 64)) Unit!5764)

(assert (=> b!190922 (= lt!94727 (addStillNotContains!94 lt!94726 lt!94730 lt!94724 lt!94725))))

(assert (=> b!190922 (= lt!94725 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!190922 (= lt!94724 (get!2204 (select (arr!3828 (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3892 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190922 (= lt!94730 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190922 (= lt!94726 call!19269)))

(assert (=> b!190922 (= e!125637 (+!303 call!19269 (tuple2!3523 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000) (get!2204 (select (arr!3828 (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3892 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!190923 () Bool)

(assert (=> b!190923 (= e!125641 (= lt!94728 (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248))) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3892 thiss!1248))))))

(declare-fun b!190924 () Bool)

(assert (=> b!190924 (= e!125643 (validKeyInArray!0 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190924 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!190925 () Bool)

(declare-fun res!90240 () Bool)

(assert (=> b!190925 (=> (not res!90240) (not e!125642))))

(assert (=> b!190925 (= res!90240 (not (contains!1346 lt!94728 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190926 () Bool)

(assert (=> b!190926 (= e!125638 e!125641)))

(declare-fun c!34348 () Bool)

(assert (=> b!190926 (= c!34348 (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(assert (= (and d!55977 c!34347) b!190917))

(assert (= (and d!55977 (not c!34347)) b!190918))

(assert (= (and b!190918 c!34346) b!190922))

(assert (= (and b!190918 (not c!34346)) b!190916))

(assert (= (or b!190922 b!190916) bm!19266))

(assert (= (and d!55977 res!90241) b!190925))

(assert (= (and b!190925 res!90240) b!190920))

(assert (= (and b!190920 res!90239) b!190924))

(assert (= (and b!190920 c!34349) b!190921))

(assert (= (and b!190920 (not c!34349)) b!190926))

(assert (= (and b!190921 res!90238) b!190915))

(assert (= (and b!190926 c!34348) b!190923))

(assert (= (and b!190926 (not c!34348)) b!190919))

(declare-fun b_lambda!7375 () Bool)

(assert (=> (not b_lambda!7375) (not b!190915)))

(assert (=> b!190915 t!7331))

(declare-fun b_and!11337 () Bool)

(assert (= b_and!11335 (and (=> t!7331 result!4891) b_and!11337)))

(declare-fun b_lambda!7377 () Bool)

(assert (=> (not b_lambda!7377) (not b!190922)))

(assert (=> b!190922 t!7331))

(declare-fun b_and!11339 () Bool)

(assert (= b_and!11337 (and (=> t!7331 result!4891) b_and!11339)))

(assert (=> b!190924 m!217219))

(assert (=> b!190924 m!217219))

(assert (=> b!190924 m!217243))

(declare-fun m!217367 () Bool)

(assert (=> b!190922 m!217367))

(declare-fun m!217369 () Bool)

(assert (=> b!190922 m!217369))

(assert (=> b!190922 m!217227))

(declare-fun m!217371 () Bool)

(assert (=> b!190922 m!217371))

(declare-fun m!217373 () Bool)

(assert (=> b!190922 m!217373))

(assert (=> b!190922 m!217219))

(assert (=> b!190922 m!217285))

(assert (=> b!190922 m!217227))

(assert (=> b!190922 m!217287))

(assert (=> b!190922 m!217285))

(assert (=> b!190922 m!217371))

(assert (=> b!190918 m!217219))

(assert (=> b!190918 m!217219))

(assert (=> b!190918 m!217243))

(assert (=> b!190921 m!217219))

(assert (=> b!190921 m!217219))

(declare-fun m!217375 () Bool)

(assert (=> b!190921 m!217375))

(assert (=> b!190915 m!217227))

(assert (=> b!190915 m!217219))

(declare-fun m!217377 () Bool)

(assert (=> b!190915 m!217377))

(assert (=> b!190915 m!217219))

(assert (=> b!190915 m!217285))

(assert (=> b!190915 m!217227))

(assert (=> b!190915 m!217287))

(assert (=> b!190915 m!217285))

(declare-fun m!217379 () Bool)

(assert (=> b!190923 m!217379))

(declare-fun m!217381 () Bool)

(assert (=> d!55977 m!217381))

(assert (=> d!55977 m!217153))

(assert (=> bm!19266 m!217379))

(declare-fun m!217383 () Bool)

(assert (=> b!190919 m!217383))

(declare-fun m!217385 () Bool)

(assert (=> b!190925 m!217385))

(assert (=> bm!19255 d!55977))

(declare-fun b!190927 () Bool)

(assert (=> b!190927 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(assert (=> b!190927 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4149 (_values!3875 thiss!1248))))))

(declare-fun e!125646 () Bool)

(declare-fun lt!94735 () ListLongMap!2439)

(assert (=> b!190927 (= e!125646 (= (apply!180 lt!94735 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)) (get!2204 (select (arr!3828 (_values!3875 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3892 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!190928 () Bool)

(declare-fun e!125644 () ListLongMap!2439)

(declare-fun call!19270 () ListLongMap!2439)

(assert (=> b!190928 (= e!125644 call!19270)))

(declare-fun d!55979 () Bool)

(declare-fun e!125649 () Bool)

(assert (=> d!55979 e!125649))

(declare-fun res!90245 () Bool)

(assert (=> d!55979 (=> (not res!90245) (not e!125649))))

(assert (=> d!55979 (= res!90245 (not (contains!1346 lt!94735 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!125647 () ListLongMap!2439)

(assert (=> d!55979 (= lt!94735 e!125647)))

(declare-fun c!34351 () Bool)

(assert (=> d!55979 (= c!34351 (bvsge #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(assert (=> d!55979 (validMask!0 (mask!9099 thiss!1248))))

(assert (=> d!55979 (= (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)) lt!94735)))

(declare-fun bm!19267 () Bool)

(assert (=> bm!19267 (= call!19270 (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3892 thiss!1248)))))

(declare-fun b!190929 () Bool)

(assert (=> b!190929 (= e!125647 (ListLongMap!2440 Nil!2415))))

(declare-fun b!190930 () Bool)

(assert (=> b!190930 (= e!125647 e!125644)))

(declare-fun c!34350 () Bool)

(assert (=> b!190930 (= c!34350 (validKeyInArray!0 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190931 () Bool)

(declare-fun e!125648 () Bool)

(assert (=> b!190931 (= e!125648 (isEmpty!481 lt!94735))))

(declare-fun b!190932 () Bool)

(declare-fun e!125645 () Bool)

(assert (=> b!190932 (= e!125649 e!125645)))

(declare-fun c!34353 () Bool)

(declare-fun e!125650 () Bool)

(assert (=> b!190932 (= c!34353 e!125650)))

(declare-fun res!90243 () Bool)

(assert (=> b!190932 (=> (not res!90243) (not e!125650))))

(assert (=> b!190932 (= res!90243 (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(declare-fun b!190933 () Bool)

(assert (=> b!190933 (= e!125645 e!125646)))

(assert (=> b!190933 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(declare-fun res!90242 () Bool)

(assert (=> b!190933 (= res!90242 (contains!1346 lt!94735 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190933 (=> (not res!90242) (not e!125646))))

(declare-fun b!190934 () Bool)

(declare-fun lt!94736 () Unit!5764)

(declare-fun lt!94734 () Unit!5764)

(assert (=> b!190934 (= lt!94736 lt!94734)))

(declare-fun lt!94737 () (_ BitVec 64))

(declare-fun lt!94733 () ListLongMap!2439)

(declare-fun lt!94731 () V!5571)

(declare-fun lt!94732 () (_ BitVec 64))

(assert (=> b!190934 (not (contains!1346 (+!303 lt!94733 (tuple2!3523 lt!94737 lt!94731)) lt!94732))))

(assert (=> b!190934 (= lt!94734 (addStillNotContains!94 lt!94733 lt!94737 lt!94731 lt!94732))))

(assert (=> b!190934 (= lt!94732 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!190934 (= lt!94731 (get!2204 (select (arr!3828 (_values!3875 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3892 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190934 (= lt!94737 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190934 (= lt!94733 call!19270)))

(assert (=> b!190934 (= e!125644 (+!303 call!19270 (tuple2!3523 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000) (get!2204 (select (arr!3828 (_values!3875 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3892 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!190935 () Bool)

(assert (=> b!190935 (= e!125648 (= lt!94735 (getCurrentListMapNoExtraKeys!213 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3892 thiss!1248))))))

(declare-fun b!190936 () Bool)

(assert (=> b!190936 (= e!125650 (validKeyInArray!0 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190936 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!190937 () Bool)

(declare-fun res!90244 () Bool)

(assert (=> b!190937 (=> (not res!90244) (not e!125649))))

(assert (=> b!190937 (= res!90244 (not (contains!1346 lt!94735 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190938 () Bool)

(assert (=> b!190938 (= e!125645 e!125648)))

(declare-fun c!34352 () Bool)

(assert (=> b!190938 (= c!34352 (bvslt #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(assert (= (and d!55979 c!34351) b!190929))

(assert (= (and d!55979 (not c!34351)) b!190930))

(assert (= (and b!190930 c!34350) b!190934))

(assert (= (and b!190930 (not c!34350)) b!190928))

(assert (= (or b!190934 b!190928) bm!19267))

(assert (= (and d!55979 res!90245) b!190937))

(assert (= (and b!190937 res!90244) b!190932))

(assert (= (and b!190932 res!90243) b!190936))

(assert (= (and b!190932 c!34353) b!190933))

(assert (= (and b!190932 (not c!34353)) b!190938))

(assert (= (and b!190933 res!90242) b!190927))

(assert (= (and b!190938 c!34352) b!190935))

(assert (= (and b!190938 (not c!34352)) b!190931))

(declare-fun b_lambda!7379 () Bool)

(assert (=> (not b_lambda!7379) (not b!190927)))

(assert (=> b!190927 t!7331))

(declare-fun b_and!11341 () Bool)

(assert (= b_and!11339 (and (=> t!7331 result!4891) b_and!11341)))

(declare-fun b_lambda!7381 () Bool)

(assert (=> (not b_lambda!7381) (not b!190934)))

(assert (=> b!190934 t!7331))

(declare-fun b_and!11343 () Bool)

(assert (= b_and!11341 (and (=> t!7331 result!4891) b_and!11343)))

(assert (=> b!190936 m!217219))

(assert (=> b!190936 m!217219))

(assert (=> b!190936 m!217243))

(declare-fun m!217387 () Bool)

(assert (=> b!190934 m!217387))

(declare-fun m!217389 () Bool)

(assert (=> b!190934 m!217389))

(assert (=> b!190934 m!217227))

(declare-fun m!217391 () Bool)

(assert (=> b!190934 m!217391))

(declare-fun m!217393 () Bool)

(assert (=> b!190934 m!217393))

(assert (=> b!190934 m!217219))

(assert (=> b!190934 m!217225))

(assert (=> b!190934 m!217227))

(assert (=> b!190934 m!217229))

(assert (=> b!190934 m!217225))

(assert (=> b!190934 m!217391))

(assert (=> b!190930 m!217219))

(assert (=> b!190930 m!217219))

(assert (=> b!190930 m!217243))

(assert (=> b!190933 m!217219))

(assert (=> b!190933 m!217219))

(declare-fun m!217395 () Bool)

(assert (=> b!190933 m!217395))

(assert (=> b!190927 m!217227))

(assert (=> b!190927 m!217219))

(declare-fun m!217397 () Bool)

(assert (=> b!190927 m!217397))

(assert (=> b!190927 m!217219))

(assert (=> b!190927 m!217225))

(assert (=> b!190927 m!217227))

(assert (=> b!190927 m!217229))

(assert (=> b!190927 m!217225))

(declare-fun m!217399 () Bool)

(assert (=> b!190935 m!217399))

(declare-fun m!217401 () Bool)

(assert (=> d!55979 m!217401))

(assert (=> d!55979 m!217153))

(assert (=> bm!19267 m!217399))

(declare-fun m!217403 () Bool)

(assert (=> b!190931 m!217403))

(declare-fun m!217405 () Bool)

(assert (=> b!190937 m!217405))

(assert (=> bm!19248 d!55979))

(assert (=> d!55963 d!55957))

(declare-fun d!55981 () Bool)

(assert (=> d!55981 (= (inRange!0 (ite c!34327 (index!4866 lt!94699) (index!4869 lt!94699)) (mask!9099 thiss!1248)) (and (bvsge (ite c!34327 (index!4866 lt!94699) (index!4869 lt!94699)) #b00000000000000000000000000000000) (bvslt (ite c!34327 (index!4866 lt!94699) (index!4869 lt!94699)) (bvadd (mask!9099 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19263 d!55981))

(declare-fun b!190957 () Bool)

(declare-fun lt!94742 () SeekEntryResult!674)

(assert (=> b!190957 (and (bvsge (index!4868 lt!94742) #b00000000000000000000000000000000) (bvslt (index!4868 lt!94742) (size!4148 (_keys!5865 thiss!1248))))))

(declare-fun e!125665 () Bool)

(assert (=> b!190957 (= e!125665 (= (select (arr!3827 (_keys!5865 thiss!1248)) (index!4868 lt!94742)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190958 () Bool)

(declare-fun e!125662 () SeekEntryResult!674)

(assert (=> b!190958 (= e!125662 (Intermediate!674 false (toIndex!0 key!828 (mask!9099 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!190959 () Bool)

(declare-fun e!125664 () Bool)

(declare-fun e!125661 () Bool)

(assert (=> b!190959 (= e!125664 e!125661)))

(declare-fun res!90252 () Bool)

(assert (=> b!190959 (= res!90252 (and ((_ is Intermediate!674) lt!94742) (not (undefined!1486 lt!94742)) (bvslt (x!20502 lt!94742) #b01111111111111111111111111111110) (bvsge (x!20502 lt!94742) #b00000000000000000000000000000000) (bvsge (x!20502 lt!94742) #b00000000000000000000000000000000)))))

(assert (=> b!190959 (=> (not res!90252) (not e!125661))))

(declare-fun b!190960 () Bool)

(declare-fun e!125663 () SeekEntryResult!674)

(assert (=> b!190960 (= e!125663 (Intermediate!674 true (toIndex!0 key!828 (mask!9099 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!190961 () Bool)

(assert (=> b!190961 (= e!125664 (bvsge (x!20502 lt!94742) #b01111111111111111111111111111110))))

(declare-fun d!55983 () Bool)

(assert (=> d!55983 e!125664))

(declare-fun c!34362 () Bool)

(assert (=> d!55983 (= c!34362 (and ((_ is Intermediate!674) lt!94742) (undefined!1486 lt!94742)))))

(assert (=> d!55983 (= lt!94742 e!125663)))

(declare-fun c!34360 () Bool)

(assert (=> d!55983 (= c!34360 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!94743 () (_ BitVec 64))

(assert (=> d!55983 (= lt!94743 (select (arr!3827 (_keys!5865 thiss!1248)) (toIndex!0 key!828 (mask!9099 thiss!1248))))))

(assert (=> d!55983 (validMask!0 (mask!9099 thiss!1248))))

(assert (=> d!55983 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9099 thiss!1248)) key!828 (_keys!5865 thiss!1248) (mask!9099 thiss!1248)) lt!94742)))

(declare-fun b!190962 () Bool)

(assert (=> b!190962 (= e!125663 e!125662)))

(declare-fun c!34361 () Bool)

(assert (=> b!190962 (= c!34361 (or (= lt!94743 key!828) (= (bvadd lt!94743 lt!94743) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190963 () Bool)

(assert (=> b!190963 (and (bvsge (index!4868 lt!94742) #b00000000000000000000000000000000) (bvslt (index!4868 lt!94742) (size!4148 (_keys!5865 thiss!1248))))))

(declare-fun res!90253 () Bool)

(assert (=> b!190963 (= res!90253 (= (select (arr!3827 (_keys!5865 thiss!1248)) (index!4868 lt!94742)) key!828))))

(assert (=> b!190963 (=> res!90253 e!125665)))

(assert (=> b!190963 (= e!125661 e!125665)))

(declare-fun b!190964 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!190964 (= e!125662 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9099 thiss!1248)) #b00000000000000000000000000000000 (mask!9099 thiss!1248)) key!828 (_keys!5865 thiss!1248) (mask!9099 thiss!1248)))))

(declare-fun b!190965 () Bool)

(assert (=> b!190965 (and (bvsge (index!4868 lt!94742) #b00000000000000000000000000000000) (bvslt (index!4868 lt!94742) (size!4148 (_keys!5865 thiss!1248))))))

(declare-fun res!90254 () Bool)

(assert (=> b!190965 (= res!90254 (= (select (arr!3827 (_keys!5865 thiss!1248)) (index!4868 lt!94742)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190965 (=> res!90254 e!125665)))

(assert (= (and d!55983 c!34360) b!190960))

(assert (= (and d!55983 (not c!34360)) b!190962))

(assert (= (and b!190962 c!34361) b!190958))

(assert (= (and b!190962 (not c!34361)) b!190964))

(assert (= (and d!55983 c!34362) b!190961))

(assert (= (and d!55983 (not c!34362)) b!190959))

(assert (= (and b!190959 res!90252) b!190963))

(assert (= (and b!190963 (not res!90253)) b!190965))

(assert (= (and b!190965 (not res!90254)) b!190957))

(declare-fun m!217407 () Bool)

(assert (=> b!190963 m!217407))

(assert (=> d!55983 m!217355))

(declare-fun m!217409 () Bool)

(assert (=> d!55983 m!217409))

(assert (=> d!55983 m!217153))

(assert (=> b!190965 m!217407))

(assert (=> b!190964 m!217355))

(declare-fun m!217411 () Bool)

(assert (=> b!190964 m!217411))

(assert (=> b!190964 m!217411))

(declare-fun m!217413 () Bool)

(assert (=> b!190964 m!217413))

(assert (=> b!190957 m!217407))

(assert (=> d!55973 d!55983))

(declare-fun d!55985 () Bool)

(declare-fun lt!94749 () (_ BitVec 32))

(declare-fun lt!94748 () (_ BitVec 32))

(assert (=> d!55985 (= lt!94749 (bvmul (bvxor lt!94748 (bvlshr lt!94748 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55985 (= lt!94748 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55985 (and (bvsge (mask!9099 thiss!1248) #b00000000000000000000000000000000) (let ((res!90255 (let ((h!3055 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20520 (bvmul (bvxor h!3055 (bvlshr h!3055 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20520 (bvlshr x!20520 #b00000000000000000000000000001101)) (mask!9099 thiss!1248)))))) (and (bvslt res!90255 (bvadd (mask!9099 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!90255 #b00000000000000000000000000000000))))))

(assert (=> d!55985 (= (toIndex!0 key!828 (mask!9099 thiss!1248)) (bvand (bvxor lt!94749 (bvlshr lt!94749 #b00000000000000000000000000001101)) (mask!9099 thiss!1248)))))

(assert (=> d!55973 d!55985))

(assert (=> d!55973 d!55957))

(assert (=> d!55969 d!55973))

(declare-fun d!55987 () Bool)

(declare-fun e!125677 () Bool)

(assert (=> d!55987 e!125677))

(declare-fun c!34368 () Bool)

(declare-fun lt!94752 () SeekEntryResult!674)

(assert (=> d!55987 (= c!34368 ((_ is MissingZero!674) lt!94752))))

(assert (=> d!55987 (= lt!94752 (seekEntryOrOpen!0 key!828 (_keys!5865 thiss!1248) (mask!9099 thiss!1248)))))

(assert (=> d!55987 true))

(declare-fun _$34!1078 () Unit!5764)

(assert (=> d!55987 (= (choose!1029 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) key!828 (defaultEntry!3892 thiss!1248)) _$34!1078)))

(declare-fun b!190982 () Bool)

(declare-fun res!90267 () Bool)

(assert (=> b!190982 (= res!90267 (= (select (arr!3827 (_keys!5865 thiss!1248)) (index!4866 lt!94752)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!125674 () Bool)

(assert (=> b!190982 (=> (not res!90267) (not e!125674))))

(declare-fun b!190983 () Bool)

(declare-fun e!125676 () Bool)

(declare-fun call!19275 () Bool)

(assert (=> b!190983 (= e!125676 (not call!19275))))

(declare-fun b!190984 () Bool)

(assert (=> b!190984 (= e!125677 e!125674)))

(declare-fun res!90265 () Bool)

(declare-fun call!19276 () Bool)

(assert (=> b!190984 (= res!90265 call!19276)))

(assert (=> b!190984 (=> (not res!90265) (not e!125674))))

(declare-fun b!190985 () Bool)

(declare-fun e!125675 () Bool)

(assert (=> b!190985 (= e!125675 ((_ is Undefined!674) lt!94752))))

(declare-fun b!190986 () Bool)

(assert (=> b!190986 (= e!125674 (not call!19275))))

(declare-fun bm!19272 () Bool)

(assert (=> bm!19272 (= call!19276 (inRange!0 (ite c!34368 (index!4866 lt!94752) (index!4869 lt!94752)) (mask!9099 thiss!1248)))))

(declare-fun bm!19273 () Bool)

(assert (=> bm!19273 (= call!19275 (arrayContainsKey!0 (_keys!5865 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!190987 () Bool)

(declare-fun res!90264 () Bool)

(assert (=> b!190987 (=> (not res!90264) (not e!125676))))

(assert (=> b!190987 (= res!90264 (= (select (arr!3827 (_keys!5865 thiss!1248)) (index!4869 lt!94752)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190988 () Bool)

(assert (=> b!190988 (= e!125677 e!125675)))

(declare-fun c!34367 () Bool)

(assert (=> b!190988 (= c!34367 ((_ is MissingVacant!674) lt!94752))))

(declare-fun b!190989 () Bool)

(declare-fun res!90266 () Bool)

(assert (=> b!190989 (=> (not res!90266) (not e!125676))))

(assert (=> b!190989 (= res!90266 call!19276)))

(assert (=> b!190989 (= e!125675 e!125676)))

(assert (= (and d!55987 c!34368) b!190984))

(assert (= (and d!55987 (not c!34368)) b!190988))

(assert (= (and b!190984 res!90265) b!190982))

(assert (= (and b!190982 res!90267) b!190986))

(assert (= (and b!190988 c!34367) b!190989))

(assert (= (and b!190988 (not c!34367)) b!190985))

(assert (= (and b!190989 res!90266) b!190987))

(assert (= (and b!190987 res!90264) b!190983))

(assert (= (or b!190984 b!190989) bm!19272))

(assert (= (or b!190986 b!190983) bm!19273))

(assert (=> d!55987 m!217131))

(declare-fun m!217415 () Bool)

(assert (=> bm!19272 m!217415))

(declare-fun m!217417 () Bool)

(assert (=> b!190987 m!217417))

(declare-fun m!217419 () Bool)

(assert (=> b!190982 m!217419))

(assert (=> bm!19273 m!217339))

(assert (=> d!55969 d!55987))

(assert (=> d!55969 d!55957))

(declare-fun lt!94755 () Bool)

(declare-fun d!55989 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!152 (List!2418) (InoxSet tuple2!3522))

(assert (=> d!55989 (= lt!94755 (select (content!152 (toList!1235 lt!94591)) (tuple2!3523 key!828 v!309)))))

(declare-fun e!125682 () Bool)

(assert (=> d!55989 (= lt!94755 e!125682)))

(declare-fun res!90272 () Bool)

(assert (=> d!55989 (=> (not res!90272) (not e!125682))))

(assert (=> d!55989 (= res!90272 ((_ is Cons!2414) (toList!1235 lt!94591)))))

(assert (=> d!55989 (= (contains!1348 (toList!1235 lt!94591) (tuple2!3523 key!828 v!309)) lt!94755)))

(declare-fun b!190994 () Bool)

(declare-fun e!125683 () Bool)

(assert (=> b!190994 (= e!125682 e!125683)))

(declare-fun res!90273 () Bool)

(assert (=> b!190994 (=> res!90273 e!125683)))

(assert (=> b!190994 (= res!90273 (= (h!3052 (toList!1235 lt!94591)) (tuple2!3523 key!828 v!309)))))

(declare-fun b!190995 () Bool)

(assert (=> b!190995 (= e!125683 (contains!1348 (t!7328 (toList!1235 lt!94591)) (tuple2!3523 key!828 v!309)))))

(assert (= (and d!55989 res!90272) b!190994))

(assert (= (and b!190994 (not res!90273)) b!190995))

(declare-fun m!217421 () Bool)

(assert (=> d!55989 m!217421))

(declare-fun m!217423 () Bool)

(assert (=> d!55989 m!217423))

(declare-fun m!217425 () Bool)

(assert (=> b!190995 m!217425))

(assert (=> b!190733 d!55989))

(declare-fun d!55991 () Bool)

(assert (=> d!55991 (= (apply!180 (+!303 lt!94688 (tuple2!3523 lt!94691 (minValue!3733 thiss!1248))) lt!94686) (apply!180 lt!94688 lt!94686))))

(declare-fun lt!94758 () Unit!5764)

(declare-fun choose!1030 (ListLongMap!2439 (_ BitVec 64) V!5571 (_ BitVec 64)) Unit!5764)

(assert (=> d!55991 (= lt!94758 (choose!1030 lt!94688 lt!94691 (minValue!3733 thiss!1248) lt!94686))))

(declare-fun e!125686 () Bool)

(assert (=> d!55991 e!125686))

(declare-fun res!90276 () Bool)

(assert (=> d!55991 (=> (not res!90276) (not e!125686))))

(assert (=> d!55991 (= res!90276 (contains!1346 lt!94688 lt!94686))))

(assert (=> d!55991 (= (addApplyDifferent!156 lt!94688 lt!94691 (minValue!3733 thiss!1248) lt!94686) lt!94758)))

(declare-fun b!190999 () Bool)

(assert (=> b!190999 (= e!125686 (not (= lt!94686 lt!94691)))))

(assert (= (and d!55991 res!90276) b!190999))

(declare-fun m!217427 () Bool)

(assert (=> d!55991 m!217427))

(assert (=> d!55991 m!217305))

(assert (=> d!55991 m!217307))

(assert (=> d!55991 m!217303))

(declare-fun m!217429 () Bool)

(assert (=> d!55991 m!217429))

(assert (=> d!55991 m!217305))

(assert (=> b!190811 d!55991))

(declare-fun d!55993 () Bool)

(assert (=> d!55993 (= (apply!180 (+!303 lt!94694 (tuple2!3523 lt!94687 (zeroValue!3733 thiss!1248))) lt!94674) (apply!180 lt!94694 lt!94674))))

(declare-fun lt!94759 () Unit!5764)

(assert (=> d!55993 (= lt!94759 (choose!1030 lt!94694 lt!94687 (zeroValue!3733 thiss!1248) lt!94674))))

(declare-fun e!125687 () Bool)

(assert (=> d!55993 e!125687))

(declare-fun res!90277 () Bool)

(assert (=> d!55993 (=> (not res!90277) (not e!125687))))

(assert (=> d!55993 (= res!90277 (contains!1346 lt!94694 lt!94674))))

(assert (=> d!55993 (= (addApplyDifferent!156 lt!94694 lt!94687 (zeroValue!3733 thiss!1248) lt!94674) lt!94759)))

(declare-fun b!191000 () Bool)

(assert (=> b!191000 (= e!125687 (not (= lt!94674 lt!94687)))))

(assert (= (and d!55993 res!90277) b!191000))

(declare-fun m!217431 () Bool)

(assert (=> d!55993 m!217431))

(assert (=> d!55993 m!217315))

(assert (=> d!55993 m!217327))

(assert (=> d!55993 m!217301))

(declare-fun m!217433 () Bool)

(assert (=> d!55993 m!217433))

(assert (=> d!55993 m!217315))

(assert (=> b!190811 d!55993))

(declare-fun d!55995 () Bool)

(declare-fun e!125688 () Bool)

(assert (=> d!55995 e!125688))

(declare-fun res!90279 () Bool)

(assert (=> d!55995 (=> (not res!90279) (not e!125688))))

(declare-fun lt!94763 () ListLongMap!2439)

(assert (=> d!55995 (= res!90279 (contains!1346 lt!94763 (_1!1772 (tuple2!3523 lt!94689 (minValue!3733 thiss!1248)))))))

(declare-fun lt!94760 () List!2418)

(assert (=> d!55995 (= lt!94763 (ListLongMap!2440 lt!94760))))

(declare-fun lt!94761 () Unit!5764)

(declare-fun lt!94762 () Unit!5764)

(assert (=> d!55995 (= lt!94761 lt!94762)))

(assert (=> d!55995 (= (getValueByKey!237 lt!94760 (_1!1772 (tuple2!3523 lt!94689 (minValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94689 (minValue!3733 thiss!1248)))))))

(assert (=> d!55995 (= lt!94762 (lemmaContainsTupThenGetReturnValue!124 lt!94760 (_1!1772 (tuple2!3523 lt!94689 (minValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94689 (minValue!3733 thiss!1248)))))))

(assert (=> d!55995 (= lt!94760 (insertStrictlySorted!127 (toList!1235 lt!94681) (_1!1772 (tuple2!3523 lt!94689 (minValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94689 (minValue!3733 thiss!1248)))))))

(assert (=> d!55995 (= (+!303 lt!94681 (tuple2!3523 lt!94689 (minValue!3733 thiss!1248))) lt!94763)))

(declare-fun b!191001 () Bool)

(declare-fun res!90278 () Bool)

(assert (=> b!191001 (=> (not res!90278) (not e!125688))))

(assert (=> b!191001 (= res!90278 (= (getValueByKey!237 (toList!1235 lt!94763) (_1!1772 (tuple2!3523 lt!94689 (minValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94689 (minValue!3733 thiss!1248))))))))

(declare-fun b!191002 () Bool)

(assert (=> b!191002 (= e!125688 (contains!1348 (toList!1235 lt!94763) (tuple2!3523 lt!94689 (minValue!3733 thiss!1248))))))

(assert (= (and d!55995 res!90279) b!191001))

(assert (= (and b!191001 res!90278) b!191002))

(declare-fun m!217435 () Bool)

(assert (=> d!55995 m!217435))

(declare-fun m!217437 () Bool)

(assert (=> d!55995 m!217437))

(declare-fun m!217439 () Bool)

(assert (=> d!55995 m!217439))

(declare-fun m!217441 () Bool)

(assert (=> d!55995 m!217441))

(declare-fun m!217443 () Bool)

(assert (=> b!191001 m!217443))

(declare-fun m!217445 () Bool)

(assert (=> b!191002 m!217445))

(assert (=> b!190811 d!55995))

(declare-fun d!55997 () Bool)

(declare-fun e!125690 () Bool)

(assert (=> d!55997 e!125690))

(declare-fun res!90280 () Bool)

(assert (=> d!55997 (=> res!90280 e!125690)))

(declare-fun lt!94765 () Bool)

(assert (=> d!55997 (= res!90280 (not lt!94765))))

(declare-fun lt!94764 () Bool)

(assert (=> d!55997 (= lt!94765 lt!94764)))

(declare-fun lt!94766 () Unit!5764)

(declare-fun e!125689 () Unit!5764)

(assert (=> d!55997 (= lt!94766 e!125689)))

(declare-fun c!34369 () Bool)

(assert (=> d!55997 (= c!34369 lt!94764)))

(assert (=> d!55997 (= lt!94764 (containsKey!241 (toList!1235 (+!303 lt!94675 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248)))) lt!94690))))

(assert (=> d!55997 (= (contains!1346 (+!303 lt!94675 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248))) lt!94690) lt!94765)))

(declare-fun b!191003 () Bool)

(declare-fun lt!94767 () Unit!5764)

(assert (=> b!191003 (= e!125689 lt!94767)))

(assert (=> b!191003 (= lt!94767 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1235 (+!303 lt!94675 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248)))) lt!94690))))

(assert (=> b!191003 (isDefined!190 (getValueByKey!237 (toList!1235 (+!303 lt!94675 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248)))) lt!94690))))

(declare-fun b!191004 () Bool)

(declare-fun Unit!5773 () Unit!5764)

(assert (=> b!191004 (= e!125689 Unit!5773)))

(declare-fun b!191005 () Bool)

(assert (=> b!191005 (= e!125690 (isDefined!190 (getValueByKey!237 (toList!1235 (+!303 lt!94675 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248)))) lt!94690)))))

(assert (= (and d!55997 c!34369) b!191003))

(assert (= (and d!55997 (not c!34369)) b!191004))

(assert (= (and d!55997 (not res!90280)) b!191005))

(declare-fun m!217447 () Bool)

(assert (=> d!55997 m!217447))

(declare-fun m!217449 () Bool)

(assert (=> b!191003 m!217449))

(declare-fun m!217451 () Bool)

(assert (=> b!191003 m!217451))

(assert (=> b!191003 m!217451))

(declare-fun m!217453 () Bool)

(assert (=> b!191003 m!217453))

(assert (=> b!191005 m!217451))

(assert (=> b!191005 m!217451))

(assert (=> b!191005 m!217453))

(assert (=> b!190811 d!55997))

(declare-fun d!55999 () Bool)

(declare-fun e!125691 () Bool)

(assert (=> d!55999 e!125691))

(declare-fun res!90282 () Bool)

(assert (=> d!55999 (=> (not res!90282) (not e!125691))))

(declare-fun lt!94771 () ListLongMap!2439)

(assert (=> d!55999 (= res!90282 (contains!1346 lt!94771 (_1!1772 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248)))))))

(declare-fun lt!94768 () List!2418)

(assert (=> d!55999 (= lt!94771 (ListLongMap!2440 lt!94768))))

(declare-fun lt!94769 () Unit!5764)

(declare-fun lt!94770 () Unit!5764)

(assert (=> d!55999 (= lt!94769 lt!94770)))

(assert (=> d!55999 (= (getValueByKey!237 lt!94768 (_1!1772 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248)))))))

(assert (=> d!55999 (= lt!94770 (lemmaContainsTupThenGetReturnValue!124 lt!94768 (_1!1772 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248)))))))

(assert (=> d!55999 (= lt!94768 (insertStrictlySorted!127 (toList!1235 lt!94675) (_1!1772 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248)))))))

(assert (=> d!55999 (= (+!303 lt!94675 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248))) lt!94771)))

(declare-fun b!191006 () Bool)

(declare-fun res!90281 () Bool)

(assert (=> b!191006 (=> (not res!90281) (not e!125691))))

(assert (=> b!191006 (= res!90281 (= (getValueByKey!237 (toList!1235 lt!94771) (_1!1772 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248))))))))

(declare-fun b!191007 () Bool)

(assert (=> b!191007 (= e!125691 (contains!1348 (toList!1235 lt!94771) (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248))))))

(assert (= (and d!55999 res!90282) b!191006))

(assert (= (and b!191006 res!90281) b!191007))

(declare-fun m!217455 () Bool)

(assert (=> d!55999 m!217455))

(declare-fun m!217457 () Bool)

(assert (=> d!55999 m!217457))

(declare-fun m!217459 () Bool)

(assert (=> d!55999 m!217459))

(declare-fun m!217461 () Bool)

(assert (=> d!55999 m!217461))

(declare-fun m!217463 () Bool)

(assert (=> b!191006 m!217463))

(declare-fun m!217465 () Bool)

(assert (=> b!191007 m!217465))

(assert (=> b!190811 d!55999))

(declare-fun d!56001 () Bool)

(declare-fun e!125692 () Bool)

(assert (=> d!56001 e!125692))

(declare-fun res!90284 () Bool)

(assert (=> d!56001 (=> (not res!90284) (not e!125692))))

(declare-fun lt!94775 () ListLongMap!2439)

(assert (=> d!56001 (= res!90284 (contains!1346 lt!94775 (_1!1772 (tuple2!3523 lt!94687 (zeroValue!3733 thiss!1248)))))))

(declare-fun lt!94772 () List!2418)

(assert (=> d!56001 (= lt!94775 (ListLongMap!2440 lt!94772))))

(declare-fun lt!94773 () Unit!5764)

(declare-fun lt!94774 () Unit!5764)

(assert (=> d!56001 (= lt!94773 lt!94774)))

(assert (=> d!56001 (= (getValueByKey!237 lt!94772 (_1!1772 (tuple2!3523 lt!94687 (zeroValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94687 (zeroValue!3733 thiss!1248)))))))

(assert (=> d!56001 (= lt!94774 (lemmaContainsTupThenGetReturnValue!124 lt!94772 (_1!1772 (tuple2!3523 lt!94687 (zeroValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94687 (zeroValue!3733 thiss!1248)))))))

(assert (=> d!56001 (= lt!94772 (insertStrictlySorted!127 (toList!1235 lt!94694) (_1!1772 (tuple2!3523 lt!94687 (zeroValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94687 (zeroValue!3733 thiss!1248)))))))

(assert (=> d!56001 (= (+!303 lt!94694 (tuple2!3523 lt!94687 (zeroValue!3733 thiss!1248))) lt!94775)))

(declare-fun b!191008 () Bool)

(declare-fun res!90283 () Bool)

(assert (=> b!191008 (=> (not res!90283) (not e!125692))))

(assert (=> b!191008 (= res!90283 (= (getValueByKey!237 (toList!1235 lt!94775) (_1!1772 (tuple2!3523 lt!94687 (zeroValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94687 (zeroValue!3733 thiss!1248))))))))

(declare-fun b!191009 () Bool)

(assert (=> b!191009 (= e!125692 (contains!1348 (toList!1235 lt!94775) (tuple2!3523 lt!94687 (zeroValue!3733 thiss!1248))))))

(assert (= (and d!56001 res!90284) b!191008))

(assert (= (and b!191008 res!90283) b!191009))

(declare-fun m!217467 () Bool)

(assert (=> d!56001 m!217467))

(declare-fun m!217469 () Bool)

(assert (=> d!56001 m!217469))

(declare-fun m!217471 () Bool)

(assert (=> d!56001 m!217471))

(declare-fun m!217473 () Bool)

(assert (=> d!56001 m!217473))

(declare-fun m!217475 () Bool)

(assert (=> b!191008 m!217475))

(declare-fun m!217477 () Bool)

(assert (=> b!191009 m!217477))

(assert (=> b!190811 d!56001))

(declare-fun d!56003 () Bool)

(assert (=> d!56003 (contains!1346 (+!303 lt!94675 (tuple2!3523 lt!94679 (zeroValue!3733 thiss!1248))) lt!94690)))

(declare-fun lt!94778 () Unit!5764)

(declare-fun choose!1031 (ListLongMap!2439 (_ BitVec 64) V!5571 (_ BitVec 64)) Unit!5764)

(assert (=> d!56003 (= lt!94778 (choose!1031 lt!94675 lt!94679 (zeroValue!3733 thiss!1248) lt!94690))))

(assert (=> d!56003 (contains!1346 lt!94675 lt!94690)))

(assert (=> d!56003 (= (addStillContains!156 lt!94675 lt!94679 (zeroValue!3733 thiss!1248) lt!94690) lt!94778)))

(declare-fun bs!7637 () Bool)

(assert (= bs!7637 d!56003))

(assert (=> bs!7637 m!217317))

(assert (=> bs!7637 m!217317))

(assert (=> bs!7637 m!217325))

(declare-fun m!217479 () Bool)

(assert (=> bs!7637 m!217479))

(declare-fun m!217481 () Bool)

(assert (=> bs!7637 m!217481))

(assert (=> b!190811 d!56003))

(declare-fun d!56005 () Bool)

(declare-fun get!2205 (Option!243) V!5571)

(assert (=> d!56005 (= (apply!180 (+!303 lt!94681 (tuple2!3523 lt!94689 (minValue!3733 thiss!1248))) lt!94677) (get!2205 (getValueByKey!237 (toList!1235 (+!303 lt!94681 (tuple2!3523 lt!94689 (minValue!3733 thiss!1248)))) lt!94677)))))

(declare-fun bs!7638 () Bool)

(assert (= bs!7638 d!56005))

(declare-fun m!217483 () Bool)

(assert (=> bs!7638 m!217483))

(assert (=> bs!7638 m!217483))

(declare-fun m!217485 () Bool)

(assert (=> bs!7638 m!217485))

(assert (=> b!190811 d!56005))

(declare-fun d!56007 () Bool)

(assert (=> d!56007 (= (apply!180 (+!303 lt!94681 (tuple2!3523 lt!94689 (minValue!3733 thiss!1248))) lt!94677) (apply!180 lt!94681 lt!94677))))

(declare-fun lt!94779 () Unit!5764)

(assert (=> d!56007 (= lt!94779 (choose!1030 lt!94681 lt!94689 (minValue!3733 thiss!1248) lt!94677))))

(declare-fun e!125693 () Bool)

(assert (=> d!56007 e!125693))

(declare-fun res!90285 () Bool)

(assert (=> d!56007 (=> (not res!90285) (not e!125693))))

(assert (=> d!56007 (= res!90285 (contains!1346 lt!94681 lt!94677))))

(assert (=> d!56007 (= (addApplyDifferent!156 lt!94681 lt!94689 (minValue!3733 thiss!1248) lt!94677) lt!94779)))

(declare-fun b!191011 () Bool)

(assert (=> b!191011 (= e!125693 (not (= lt!94677 lt!94689)))))

(assert (= (and d!56007 res!90285) b!191011))

(declare-fun m!217487 () Bool)

(assert (=> d!56007 m!217487))

(assert (=> d!56007 m!217311))

(assert (=> d!56007 m!217313))

(assert (=> d!56007 m!217321))

(declare-fun m!217489 () Bool)

(assert (=> d!56007 m!217489))

(assert (=> d!56007 m!217311))

(assert (=> b!190811 d!56007))

(declare-fun d!56009 () Bool)

(assert (=> d!56009 (= (apply!180 lt!94694 lt!94674) (get!2205 (getValueByKey!237 (toList!1235 lt!94694) lt!94674)))))

(declare-fun bs!7639 () Bool)

(assert (= bs!7639 d!56009))

(declare-fun m!217491 () Bool)

(assert (=> bs!7639 m!217491))

(assert (=> bs!7639 m!217491))

(declare-fun m!217493 () Bool)

(assert (=> bs!7639 m!217493))

(assert (=> b!190811 d!56009))

(declare-fun d!56011 () Bool)

(assert (=> d!56011 (= (apply!180 lt!94688 lt!94686) (get!2205 (getValueByKey!237 (toList!1235 lt!94688) lt!94686)))))

(declare-fun bs!7640 () Bool)

(assert (= bs!7640 d!56011))

(declare-fun m!217495 () Bool)

(assert (=> bs!7640 m!217495))

(assert (=> bs!7640 m!217495))

(declare-fun m!217497 () Bool)

(assert (=> bs!7640 m!217497))

(assert (=> b!190811 d!56011))

(declare-fun d!56013 () Bool)

(declare-fun e!125694 () Bool)

(assert (=> d!56013 e!125694))

(declare-fun res!90287 () Bool)

(assert (=> d!56013 (=> (not res!90287) (not e!125694))))

(declare-fun lt!94783 () ListLongMap!2439)

(assert (=> d!56013 (= res!90287 (contains!1346 lt!94783 (_1!1772 (tuple2!3523 lt!94691 (minValue!3733 thiss!1248)))))))

(declare-fun lt!94780 () List!2418)

(assert (=> d!56013 (= lt!94783 (ListLongMap!2440 lt!94780))))

(declare-fun lt!94781 () Unit!5764)

(declare-fun lt!94782 () Unit!5764)

(assert (=> d!56013 (= lt!94781 lt!94782)))

(assert (=> d!56013 (= (getValueByKey!237 lt!94780 (_1!1772 (tuple2!3523 lt!94691 (minValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94691 (minValue!3733 thiss!1248)))))))

(assert (=> d!56013 (= lt!94782 (lemmaContainsTupThenGetReturnValue!124 lt!94780 (_1!1772 (tuple2!3523 lt!94691 (minValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94691 (minValue!3733 thiss!1248)))))))

(assert (=> d!56013 (= lt!94780 (insertStrictlySorted!127 (toList!1235 lt!94688) (_1!1772 (tuple2!3523 lt!94691 (minValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94691 (minValue!3733 thiss!1248)))))))

(assert (=> d!56013 (= (+!303 lt!94688 (tuple2!3523 lt!94691 (minValue!3733 thiss!1248))) lt!94783)))

(declare-fun b!191012 () Bool)

(declare-fun res!90286 () Bool)

(assert (=> b!191012 (=> (not res!90286) (not e!125694))))

(assert (=> b!191012 (= res!90286 (= (getValueByKey!237 (toList!1235 lt!94783) (_1!1772 (tuple2!3523 lt!94691 (minValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94691 (minValue!3733 thiss!1248))))))))

(declare-fun b!191013 () Bool)

(assert (=> b!191013 (= e!125694 (contains!1348 (toList!1235 lt!94783) (tuple2!3523 lt!94691 (minValue!3733 thiss!1248))))))

(assert (= (and d!56013 res!90287) b!191012))

(assert (= (and b!191012 res!90286) b!191013))

(declare-fun m!217499 () Bool)

(assert (=> d!56013 m!217499))

(declare-fun m!217501 () Bool)

(assert (=> d!56013 m!217501))

(declare-fun m!217503 () Bool)

(assert (=> d!56013 m!217503))

(declare-fun m!217505 () Bool)

(assert (=> d!56013 m!217505))

(declare-fun m!217507 () Bool)

(assert (=> b!191012 m!217507))

(declare-fun m!217509 () Bool)

(assert (=> b!191013 m!217509))

(assert (=> b!190811 d!56013))

(declare-fun d!56015 () Bool)

(assert (=> d!56015 (= (apply!180 (+!303 lt!94688 (tuple2!3523 lt!94691 (minValue!3733 thiss!1248))) lt!94686) (get!2205 (getValueByKey!237 (toList!1235 (+!303 lt!94688 (tuple2!3523 lt!94691 (minValue!3733 thiss!1248)))) lt!94686)))))

(declare-fun bs!7641 () Bool)

(assert (= bs!7641 d!56015))

(declare-fun m!217511 () Bool)

(assert (=> bs!7641 m!217511))

(assert (=> bs!7641 m!217511))

(declare-fun m!217513 () Bool)

(assert (=> bs!7641 m!217513))

(assert (=> b!190811 d!56015))

(declare-fun d!56017 () Bool)

(assert (=> d!56017 (= (apply!180 (+!303 lt!94694 (tuple2!3523 lt!94687 (zeroValue!3733 thiss!1248))) lt!94674) (get!2205 (getValueByKey!237 (toList!1235 (+!303 lt!94694 (tuple2!3523 lt!94687 (zeroValue!3733 thiss!1248)))) lt!94674)))))

(declare-fun bs!7642 () Bool)

(assert (= bs!7642 d!56017))

(declare-fun m!217515 () Bool)

(assert (=> bs!7642 m!217515))

(assert (=> bs!7642 m!217515))

(declare-fun m!217517 () Bool)

(assert (=> bs!7642 m!217517))

(assert (=> b!190811 d!56017))

(assert (=> b!190811 d!55977))

(declare-fun d!56019 () Bool)

(assert (=> d!56019 (= (apply!180 lt!94681 lt!94677) (get!2205 (getValueByKey!237 (toList!1235 lt!94681) lt!94677)))))

(declare-fun bs!7643 () Bool)

(assert (= bs!7643 d!56019))

(declare-fun m!217519 () Bool)

(assert (=> bs!7643 m!217519))

(assert (=> bs!7643 m!217519))

(declare-fun m!217521 () Bool)

(assert (=> bs!7643 m!217521))

(assert (=> b!190811 d!56019))

(declare-fun d!56021 () Bool)

(declare-fun e!125695 () Bool)

(assert (=> d!56021 e!125695))

(declare-fun res!90289 () Bool)

(assert (=> d!56021 (=> (not res!90289) (not e!125695))))

(declare-fun lt!94787 () ListLongMap!2439)

(assert (=> d!56021 (= res!90289 (contains!1346 lt!94787 (_1!1772 (tuple2!3523 key!828 v!309))))))

(declare-fun lt!94784 () List!2418)

(assert (=> d!56021 (= lt!94787 (ListLongMap!2440 lt!94784))))

(declare-fun lt!94785 () Unit!5764)

(declare-fun lt!94786 () Unit!5764)

(assert (=> d!56021 (= lt!94785 lt!94786)))

(assert (=> d!56021 (= (getValueByKey!237 lt!94784 (_1!1772 (tuple2!3523 key!828 v!309))) (Some!242 (_2!1772 (tuple2!3523 key!828 v!309))))))

(assert (=> d!56021 (= lt!94786 (lemmaContainsTupThenGetReturnValue!124 lt!94784 (_1!1772 (tuple2!3523 key!828 v!309)) (_2!1772 (tuple2!3523 key!828 v!309))))))

(assert (=> d!56021 (= lt!94784 (insertStrictlySorted!127 (toList!1235 (getCurrentListMap!883 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248))) (_1!1772 (tuple2!3523 key!828 v!309)) (_2!1772 (tuple2!3523 key!828 v!309))))))

(assert (=> d!56021 (= (+!303 (getCurrentListMap!883 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3892 thiss!1248)) (tuple2!3523 key!828 v!309)) lt!94787)))

(declare-fun b!191014 () Bool)

(declare-fun res!90288 () Bool)

(assert (=> b!191014 (=> (not res!90288) (not e!125695))))

(assert (=> b!191014 (= res!90288 (= (getValueByKey!237 (toList!1235 lt!94787) (_1!1772 (tuple2!3523 key!828 v!309))) (Some!242 (_2!1772 (tuple2!3523 key!828 v!309)))))))

(declare-fun b!191015 () Bool)

(assert (=> b!191015 (= e!125695 (contains!1348 (toList!1235 lt!94787) (tuple2!3523 key!828 v!309)))))

(assert (= (and d!56021 res!90289) b!191014))

(assert (= (and b!191014 res!90288) b!191015))

(declare-fun m!217523 () Bool)

(assert (=> d!56021 m!217523))

(declare-fun m!217525 () Bool)

(assert (=> d!56021 m!217525))

(declare-fun m!217527 () Bool)

(assert (=> d!56021 m!217527))

(declare-fun m!217529 () Bool)

(assert (=> d!56021 m!217529))

(declare-fun m!217531 () Bool)

(assert (=> b!191014 m!217531))

(declare-fun m!217533 () Bool)

(assert (=> b!191015 m!217533))

(assert (=> b!190810 d!56021))

(assert (=> b!190810 d!55963))

(assert (=> b!190810 d!55967))

(declare-fun d!56023 () Bool)

(assert (=> d!56023 (= (apply!180 (+!303 lt!94656 (tuple2!3523 lt!94664 (minValue!3733 thiss!1248))) lt!94652) (apply!180 lt!94656 lt!94652))))

(declare-fun lt!94788 () Unit!5764)

(assert (=> d!56023 (= lt!94788 (choose!1030 lt!94656 lt!94664 (minValue!3733 thiss!1248) lt!94652))))

(declare-fun e!125696 () Bool)

(assert (=> d!56023 e!125696))

(declare-fun res!90290 () Bool)

(assert (=> d!56023 (=> (not res!90290) (not e!125696))))

(assert (=> d!56023 (= res!90290 (contains!1346 lt!94656 lt!94652))))

(assert (=> d!56023 (= (addApplyDifferent!156 lt!94656 lt!94664 (minValue!3733 thiss!1248) lt!94652) lt!94788)))

(declare-fun b!191016 () Bool)

(assert (=> b!191016 (= e!125696 (not (= lt!94652 lt!94664)))))

(assert (= (and d!56023 res!90290) b!191016))

(declare-fun m!217535 () Bool)

(assert (=> d!56023 m!217535))

(assert (=> d!56023 m!217255))

(assert (=> d!56023 m!217257))

(assert (=> d!56023 m!217265))

(declare-fun m!217537 () Bool)

(assert (=> d!56023 m!217537))

(assert (=> d!56023 m!217255))

(assert (=> b!190785 d!56023))

(declare-fun d!56025 () Bool)

(assert (=> d!56025 (= (apply!180 lt!94663 lt!94661) (get!2205 (getValueByKey!237 (toList!1235 lt!94663) lt!94661)))))

(declare-fun bs!7644 () Bool)

(assert (= bs!7644 d!56025))

(declare-fun m!217539 () Bool)

(assert (=> bs!7644 m!217539))

(assert (=> bs!7644 m!217539))

(declare-fun m!217541 () Bool)

(assert (=> bs!7644 m!217541))

(assert (=> b!190785 d!56025))

(declare-fun d!56027 () Bool)

(declare-fun e!125697 () Bool)

(assert (=> d!56027 e!125697))

(declare-fun res!90292 () Bool)

(assert (=> d!56027 (=> (not res!90292) (not e!125697))))

(declare-fun lt!94792 () ListLongMap!2439)

(assert (=> d!56027 (= res!90292 (contains!1346 lt!94792 (_1!1772 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248)))))))

(declare-fun lt!94789 () List!2418)

(assert (=> d!56027 (= lt!94792 (ListLongMap!2440 lt!94789))))

(declare-fun lt!94790 () Unit!5764)

(declare-fun lt!94791 () Unit!5764)

(assert (=> d!56027 (= lt!94790 lt!94791)))

(assert (=> d!56027 (= (getValueByKey!237 lt!94789 (_1!1772 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248)))))))

(assert (=> d!56027 (= lt!94791 (lemmaContainsTupThenGetReturnValue!124 lt!94789 (_1!1772 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248)))))))

(assert (=> d!56027 (= lt!94789 (insertStrictlySorted!127 (toList!1235 lt!94650) (_1!1772 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248)))))))

(assert (=> d!56027 (= (+!303 lt!94650 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248))) lt!94792)))

(declare-fun b!191017 () Bool)

(declare-fun res!90291 () Bool)

(assert (=> b!191017 (=> (not res!90291) (not e!125697))))

(assert (=> b!191017 (= res!90291 (= (getValueByKey!237 (toList!1235 lt!94792) (_1!1772 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248))))))))

(declare-fun b!191018 () Bool)

(assert (=> b!191018 (= e!125697 (contains!1348 (toList!1235 lt!94792) (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248))))))

(assert (= (and d!56027 res!90292) b!191017))

(assert (= (and b!191017 res!90291) b!191018))

(declare-fun m!217543 () Bool)

(assert (=> d!56027 m!217543))

(declare-fun m!217545 () Bool)

(assert (=> d!56027 m!217545))

(declare-fun m!217547 () Bool)

(assert (=> d!56027 m!217547))

(declare-fun m!217549 () Bool)

(assert (=> d!56027 m!217549))

(declare-fun m!217551 () Bool)

(assert (=> b!191017 m!217551))

(declare-fun m!217553 () Bool)

(assert (=> b!191018 m!217553))

(assert (=> b!190785 d!56027))

(declare-fun d!56029 () Bool)

(declare-fun e!125698 () Bool)

(assert (=> d!56029 e!125698))

(declare-fun res!90294 () Bool)

(assert (=> d!56029 (=> (not res!90294) (not e!125698))))

(declare-fun lt!94796 () ListLongMap!2439)

(assert (=> d!56029 (= res!90294 (contains!1346 lt!94796 (_1!1772 (tuple2!3523 lt!94662 (zeroValue!3733 thiss!1248)))))))

(declare-fun lt!94793 () List!2418)

(assert (=> d!56029 (= lt!94796 (ListLongMap!2440 lt!94793))))

(declare-fun lt!94794 () Unit!5764)

(declare-fun lt!94795 () Unit!5764)

(assert (=> d!56029 (= lt!94794 lt!94795)))

(assert (=> d!56029 (= (getValueByKey!237 lt!94793 (_1!1772 (tuple2!3523 lt!94662 (zeroValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94662 (zeroValue!3733 thiss!1248)))))))

(assert (=> d!56029 (= lt!94795 (lemmaContainsTupThenGetReturnValue!124 lt!94793 (_1!1772 (tuple2!3523 lt!94662 (zeroValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94662 (zeroValue!3733 thiss!1248)))))))

(assert (=> d!56029 (= lt!94793 (insertStrictlySorted!127 (toList!1235 lt!94669) (_1!1772 (tuple2!3523 lt!94662 (zeroValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94662 (zeroValue!3733 thiss!1248)))))))

(assert (=> d!56029 (= (+!303 lt!94669 (tuple2!3523 lt!94662 (zeroValue!3733 thiss!1248))) lt!94796)))

(declare-fun b!191019 () Bool)

(declare-fun res!90293 () Bool)

(assert (=> b!191019 (=> (not res!90293) (not e!125698))))

(assert (=> b!191019 (= res!90293 (= (getValueByKey!237 (toList!1235 lt!94796) (_1!1772 (tuple2!3523 lt!94662 (zeroValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94662 (zeroValue!3733 thiss!1248))))))))

(declare-fun b!191020 () Bool)

(assert (=> b!191020 (= e!125698 (contains!1348 (toList!1235 lt!94796) (tuple2!3523 lt!94662 (zeroValue!3733 thiss!1248))))))

(assert (= (and d!56029 res!90294) b!191019))

(assert (= (and b!191019 res!90293) b!191020))

(declare-fun m!217555 () Bool)

(assert (=> d!56029 m!217555))

(declare-fun m!217557 () Bool)

(assert (=> d!56029 m!217557))

(declare-fun m!217559 () Bool)

(assert (=> d!56029 m!217559))

(declare-fun m!217561 () Bool)

(assert (=> d!56029 m!217561))

(declare-fun m!217563 () Bool)

(assert (=> b!191019 m!217563))

(declare-fun m!217565 () Bool)

(assert (=> b!191020 m!217565))

(assert (=> b!190785 d!56029))

(declare-fun d!56031 () Bool)

(assert (=> d!56031 (= (apply!180 (+!303 lt!94663 (tuple2!3523 lt!94666 (minValue!3733 thiss!1248))) lt!94661) (get!2205 (getValueByKey!237 (toList!1235 (+!303 lt!94663 (tuple2!3523 lt!94666 (minValue!3733 thiss!1248)))) lt!94661)))))

(declare-fun bs!7645 () Bool)

(assert (= bs!7645 d!56031))

(declare-fun m!217567 () Bool)

(assert (=> bs!7645 m!217567))

(assert (=> bs!7645 m!217567))

(declare-fun m!217569 () Bool)

(assert (=> bs!7645 m!217569))

(assert (=> b!190785 d!56031))

(declare-fun d!56033 () Bool)

(assert (=> d!56033 (= (apply!180 lt!94656 lt!94652) (get!2205 (getValueByKey!237 (toList!1235 lt!94656) lt!94652)))))

(declare-fun bs!7646 () Bool)

(assert (= bs!7646 d!56033))

(declare-fun m!217571 () Bool)

(assert (=> bs!7646 m!217571))

(assert (=> bs!7646 m!217571))

(declare-fun m!217573 () Bool)

(assert (=> bs!7646 m!217573))

(assert (=> b!190785 d!56033))

(declare-fun d!56035 () Bool)

(assert (=> d!56035 (= (apply!180 (+!303 lt!94656 (tuple2!3523 lt!94664 (minValue!3733 thiss!1248))) lt!94652) (get!2205 (getValueByKey!237 (toList!1235 (+!303 lt!94656 (tuple2!3523 lt!94664 (minValue!3733 thiss!1248)))) lt!94652)))))

(declare-fun bs!7647 () Bool)

(assert (= bs!7647 d!56035))

(declare-fun m!217575 () Bool)

(assert (=> bs!7647 m!217575))

(assert (=> bs!7647 m!217575))

(declare-fun m!217577 () Bool)

(assert (=> bs!7647 m!217577))

(assert (=> b!190785 d!56035))

(declare-fun d!56037 () Bool)

(assert (=> d!56037 (contains!1346 (+!303 lt!94650 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248))) lt!94665)))

(declare-fun lt!94797 () Unit!5764)

(assert (=> d!56037 (= lt!94797 (choose!1031 lt!94650 lt!94654 (zeroValue!3733 thiss!1248) lt!94665))))

(assert (=> d!56037 (contains!1346 lt!94650 lt!94665)))

(assert (=> d!56037 (= (addStillContains!156 lt!94650 lt!94654 (zeroValue!3733 thiss!1248) lt!94665) lt!94797)))

(declare-fun bs!7648 () Bool)

(assert (= bs!7648 d!56037))

(assert (=> bs!7648 m!217261))

(assert (=> bs!7648 m!217261))

(assert (=> bs!7648 m!217269))

(declare-fun m!217579 () Bool)

(assert (=> bs!7648 m!217579))

(declare-fun m!217581 () Bool)

(assert (=> bs!7648 m!217581))

(assert (=> b!190785 d!56037))

(assert (=> b!190785 d!55979))

(declare-fun d!56039 () Bool)

(assert (=> d!56039 (= (apply!180 lt!94669 lt!94649) (get!2205 (getValueByKey!237 (toList!1235 lt!94669) lt!94649)))))

(declare-fun bs!7649 () Bool)

(assert (= bs!7649 d!56039))

(declare-fun m!217583 () Bool)

(assert (=> bs!7649 m!217583))

(assert (=> bs!7649 m!217583))

(declare-fun m!217585 () Bool)

(assert (=> bs!7649 m!217585))

(assert (=> b!190785 d!56039))

(declare-fun d!56041 () Bool)

(assert (=> d!56041 (= (apply!180 (+!303 lt!94663 (tuple2!3523 lt!94666 (minValue!3733 thiss!1248))) lt!94661) (apply!180 lt!94663 lt!94661))))

(declare-fun lt!94798 () Unit!5764)

(assert (=> d!56041 (= lt!94798 (choose!1030 lt!94663 lt!94666 (minValue!3733 thiss!1248) lt!94661))))

(declare-fun e!125699 () Bool)

(assert (=> d!56041 e!125699))

(declare-fun res!90295 () Bool)

(assert (=> d!56041 (=> (not res!90295) (not e!125699))))

(assert (=> d!56041 (= res!90295 (contains!1346 lt!94663 lt!94661))))

(assert (=> d!56041 (= (addApplyDifferent!156 lt!94663 lt!94666 (minValue!3733 thiss!1248) lt!94661) lt!94798)))

(declare-fun b!191021 () Bool)

(assert (=> b!191021 (= e!125699 (not (= lt!94661 lt!94666)))))

(assert (= (and d!56041 res!90295) b!191021))

(declare-fun m!217587 () Bool)

(assert (=> d!56041 m!217587))

(assert (=> d!56041 m!217249))

(assert (=> d!56041 m!217251))

(assert (=> d!56041 m!217247))

(declare-fun m!217589 () Bool)

(assert (=> d!56041 m!217589))

(assert (=> d!56041 m!217249))

(assert (=> b!190785 d!56041))

(declare-fun d!56043 () Bool)

(declare-fun e!125700 () Bool)

(assert (=> d!56043 e!125700))

(declare-fun res!90297 () Bool)

(assert (=> d!56043 (=> (not res!90297) (not e!125700))))

(declare-fun lt!94802 () ListLongMap!2439)

(assert (=> d!56043 (= res!90297 (contains!1346 lt!94802 (_1!1772 (tuple2!3523 lt!94664 (minValue!3733 thiss!1248)))))))

(declare-fun lt!94799 () List!2418)

(assert (=> d!56043 (= lt!94802 (ListLongMap!2440 lt!94799))))

(declare-fun lt!94800 () Unit!5764)

(declare-fun lt!94801 () Unit!5764)

(assert (=> d!56043 (= lt!94800 lt!94801)))

(assert (=> d!56043 (= (getValueByKey!237 lt!94799 (_1!1772 (tuple2!3523 lt!94664 (minValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94664 (minValue!3733 thiss!1248)))))))

(assert (=> d!56043 (= lt!94801 (lemmaContainsTupThenGetReturnValue!124 lt!94799 (_1!1772 (tuple2!3523 lt!94664 (minValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94664 (minValue!3733 thiss!1248)))))))

(assert (=> d!56043 (= lt!94799 (insertStrictlySorted!127 (toList!1235 lt!94656) (_1!1772 (tuple2!3523 lt!94664 (minValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94664 (minValue!3733 thiss!1248)))))))

(assert (=> d!56043 (= (+!303 lt!94656 (tuple2!3523 lt!94664 (minValue!3733 thiss!1248))) lt!94802)))

(declare-fun b!191022 () Bool)

(declare-fun res!90296 () Bool)

(assert (=> b!191022 (=> (not res!90296) (not e!125700))))

(assert (=> b!191022 (= res!90296 (= (getValueByKey!237 (toList!1235 lt!94802) (_1!1772 (tuple2!3523 lt!94664 (minValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94664 (minValue!3733 thiss!1248))))))))

(declare-fun b!191023 () Bool)

(assert (=> b!191023 (= e!125700 (contains!1348 (toList!1235 lt!94802) (tuple2!3523 lt!94664 (minValue!3733 thiss!1248))))))

(assert (= (and d!56043 res!90297) b!191022))

(assert (= (and b!191022 res!90296) b!191023))

(declare-fun m!217591 () Bool)

(assert (=> d!56043 m!217591))

(declare-fun m!217593 () Bool)

(assert (=> d!56043 m!217593))

(declare-fun m!217595 () Bool)

(assert (=> d!56043 m!217595))

(declare-fun m!217597 () Bool)

(assert (=> d!56043 m!217597))

(declare-fun m!217599 () Bool)

(assert (=> b!191022 m!217599))

(declare-fun m!217601 () Bool)

(assert (=> b!191023 m!217601))

(assert (=> b!190785 d!56043))

(declare-fun d!56045 () Bool)

(assert (=> d!56045 (= (apply!180 (+!303 lt!94669 (tuple2!3523 lt!94662 (zeroValue!3733 thiss!1248))) lt!94649) (apply!180 lt!94669 lt!94649))))

(declare-fun lt!94803 () Unit!5764)

(assert (=> d!56045 (= lt!94803 (choose!1030 lt!94669 lt!94662 (zeroValue!3733 thiss!1248) lt!94649))))

(declare-fun e!125701 () Bool)

(assert (=> d!56045 e!125701))

(declare-fun res!90298 () Bool)

(assert (=> d!56045 (=> (not res!90298) (not e!125701))))

(assert (=> d!56045 (= res!90298 (contains!1346 lt!94669 lt!94649))))

(assert (=> d!56045 (= (addApplyDifferent!156 lt!94669 lt!94662 (zeroValue!3733 thiss!1248) lt!94649) lt!94803)))

(declare-fun b!191024 () Bool)

(assert (=> b!191024 (= e!125701 (not (= lt!94649 lt!94662)))))

(assert (= (and d!56045 res!90298) b!191024))

(declare-fun m!217603 () Bool)

(assert (=> d!56045 m!217603))

(assert (=> d!56045 m!217259))

(assert (=> d!56045 m!217271))

(assert (=> d!56045 m!217245))

(declare-fun m!217605 () Bool)

(assert (=> d!56045 m!217605))

(assert (=> d!56045 m!217259))

(assert (=> b!190785 d!56045))

(declare-fun d!56047 () Bool)

(declare-fun e!125703 () Bool)

(assert (=> d!56047 e!125703))

(declare-fun res!90299 () Bool)

(assert (=> d!56047 (=> res!90299 e!125703)))

(declare-fun lt!94805 () Bool)

(assert (=> d!56047 (= res!90299 (not lt!94805))))

(declare-fun lt!94804 () Bool)

(assert (=> d!56047 (= lt!94805 lt!94804)))

(declare-fun lt!94806 () Unit!5764)

(declare-fun e!125702 () Unit!5764)

(assert (=> d!56047 (= lt!94806 e!125702)))

(declare-fun c!34370 () Bool)

(assert (=> d!56047 (= c!34370 lt!94804)))

(assert (=> d!56047 (= lt!94804 (containsKey!241 (toList!1235 (+!303 lt!94650 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248)))) lt!94665))))

(assert (=> d!56047 (= (contains!1346 (+!303 lt!94650 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248))) lt!94665) lt!94805)))

(declare-fun b!191025 () Bool)

(declare-fun lt!94807 () Unit!5764)

(assert (=> b!191025 (= e!125702 lt!94807)))

(assert (=> b!191025 (= lt!94807 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1235 (+!303 lt!94650 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248)))) lt!94665))))

(assert (=> b!191025 (isDefined!190 (getValueByKey!237 (toList!1235 (+!303 lt!94650 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248)))) lt!94665))))

(declare-fun b!191026 () Bool)

(declare-fun Unit!5774 () Unit!5764)

(assert (=> b!191026 (= e!125702 Unit!5774)))

(declare-fun b!191027 () Bool)

(assert (=> b!191027 (= e!125703 (isDefined!190 (getValueByKey!237 (toList!1235 (+!303 lt!94650 (tuple2!3523 lt!94654 (zeroValue!3733 thiss!1248)))) lt!94665)))))

(assert (= (and d!56047 c!34370) b!191025))

(assert (= (and d!56047 (not c!34370)) b!191026))

(assert (= (and d!56047 (not res!90299)) b!191027))

(declare-fun m!217607 () Bool)

(assert (=> d!56047 m!217607))

(declare-fun m!217609 () Bool)

(assert (=> b!191025 m!217609))

(declare-fun m!217611 () Bool)

(assert (=> b!191025 m!217611))

(assert (=> b!191025 m!217611))

(declare-fun m!217613 () Bool)

(assert (=> b!191025 m!217613))

(assert (=> b!191027 m!217611))

(assert (=> b!191027 m!217611))

(assert (=> b!191027 m!217613))

(assert (=> b!190785 d!56047))

(declare-fun d!56049 () Bool)

(assert (=> d!56049 (= (apply!180 (+!303 lt!94669 (tuple2!3523 lt!94662 (zeroValue!3733 thiss!1248))) lt!94649) (get!2205 (getValueByKey!237 (toList!1235 (+!303 lt!94669 (tuple2!3523 lt!94662 (zeroValue!3733 thiss!1248)))) lt!94649)))))

(declare-fun bs!7650 () Bool)

(assert (= bs!7650 d!56049))

(declare-fun m!217615 () Bool)

(assert (=> bs!7650 m!217615))

(assert (=> bs!7650 m!217615))

(declare-fun m!217617 () Bool)

(assert (=> bs!7650 m!217617))

(assert (=> b!190785 d!56049))

(declare-fun d!56051 () Bool)

(declare-fun e!125704 () Bool)

(assert (=> d!56051 e!125704))

(declare-fun res!90301 () Bool)

(assert (=> d!56051 (=> (not res!90301) (not e!125704))))

(declare-fun lt!94811 () ListLongMap!2439)

(assert (=> d!56051 (= res!90301 (contains!1346 lt!94811 (_1!1772 (tuple2!3523 lt!94666 (minValue!3733 thiss!1248)))))))

(declare-fun lt!94808 () List!2418)

(assert (=> d!56051 (= lt!94811 (ListLongMap!2440 lt!94808))))

(declare-fun lt!94809 () Unit!5764)

(declare-fun lt!94810 () Unit!5764)

(assert (=> d!56051 (= lt!94809 lt!94810)))

(assert (=> d!56051 (= (getValueByKey!237 lt!94808 (_1!1772 (tuple2!3523 lt!94666 (minValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94666 (minValue!3733 thiss!1248)))))))

(assert (=> d!56051 (= lt!94810 (lemmaContainsTupThenGetReturnValue!124 lt!94808 (_1!1772 (tuple2!3523 lt!94666 (minValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94666 (minValue!3733 thiss!1248)))))))

(assert (=> d!56051 (= lt!94808 (insertStrictlySorted!127 (toList!1235 lt!94663) (_1!1772 (tuple2!3523 lt!94666 (minValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 lt!94666 (minValue!3733 thiss!1248)))))))

(assert (=> d!56051 (= (+!303 lt!94663 (tuple2!3523 lt!94666 (minValue!3733 thiss!1248))) lt!94811)))

(declare-fun b!191028 () Bool)

(declare-fun res!90300 () Bool)

(assert (=> b!191028 (=> (not res!90300) (not e!125704))))

(assert (=> b!191028 (= res!90300 (= (getValueByKey!237 (toList!1235 lt!94811) (_1!1772 (tuple2!3523 lt!94666 (minValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 lt!94666 (minValue!3733 thiss!1248))))))))

(declare-fun b!191029 () Bool)

(assert (=> b!191029 (= e!125704 (contains!1348 (toList!1235 lt!94811) (tuple2!3523 lt!94666 (minValue!3733 thiss!1248))))))

(assert (= (and d!56051 res!90301) b!191028))

(assert (= (and b!191028 res!90300) b!191029))

(declare-fun m!217619 () Bool)

(assert (=> d!56051 m!217619))

(declare-fun m!217621 () Bool)

(assert (=> d!56051 m!217621))

(declare-fun m!217623 () Bool)

(assert (=> d!56051 m!217623))

(declare-fun m!217625 () Bool)

(assert (=> d!56051 m!217625))

(declare-fun m!217627 () Bool)

(assert (=> b!191028 m!217627))

(declare-fun m!217629 () Bool)

(assert (=> b!191029 m!217629))

(assert (=> b!190785 d!56051))

(declare-fun d!56053 () Bool)

(declare-fun e!125705 () Bool)

(assert (=> d!56053 e!125705))

(declare-fun res!90303 () Bool)

(assert (=> d!56053 (=> (not res!90303) (not e!125705))))

(declare-fun lt!94815 () ListLongMap!2439)

(assert (=> d!56053 (= res!90303 (contains!1346 lt!94815 (_1!1772 (ite (or c!34318 c!34321) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))))))

(declare-fun lt!94812 () List!2418)

(assert (=> d!56053 (= lt!94815 (ListLongMap!2440 lt!94812))))

(declare-fun lt!94813 () Unit!5764)

(declare-fun lt!94814 () Unit!5764)

(assert (=> d!56053 (= lt!94813 lt!94814)))

(assert (=> d!56053 (= (getValueByKey!237 lt!94812 (_1!1772 (ite (or c!34318 c!34321) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))) (Some!242 (_2!1772 (ite (or c!34318 c!34321) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))))))

(assert (=> d!56053 (= lt!94814 (lemmaContainsTupThenGetReturnValue!124 lt!94812 (_1!1772 (ite (or c!34318 c!34321) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))) (_2!1772 (ite (or c!34318 c!34321) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))))))

(assert (=> d!56053 (= lt!94812 (insertStrictlySorted!127 (toList!1235 (ite c!34318 call!19259 (ite c!34321 call!19254 call!19257))) (_1!1772 (ite (or c!34318 c!34321) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))) (_2!1772 (ite (or c!34318 c!34321) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))))))

(assert (=> d!56053 (= (+!303 (ite c!34318 call!19259 (ite c!34321 call!19254 call!19257)) (ite (or c!34318 c!34321) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))) lt!94815)))

(declare-fun b!191030 () Bool)

(declare-fun res!90302 () Bool)

(assert (=> b!191030 (=> (not res!90302) (not e!125705))))

(assert (=> b!191030 (= res!90302 (= (getValueByKey!237 (toList!1235 lt!94815) (_1!1772 (ite (or c!34318 c!34321) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))) (Some!242 (_2!1772 (ite (or c!34318 c!34321) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))))))))

(declare-fun b!191031 () Bool)

(assert (=> b!191031 (= e!125705 (contains!1348 (toList!1235 lt!94815) (ite (or c!34318 c!34321) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))))))

(assert (= (and d!56053 res!90303) b!191030))

(assert (= (and b!191030 res!90302) b!191031))

(declare-fun m!217631 () Bool)

(assert (=> d!56053 m!217631))

(declare-fun m!217633 () Bool)

(assert (=> d!56053 m!217633))

(declare-fun m!217635 () Bool)

(assert (=> d!56053 m!217635))

(declare-fun m!217637 () Bool)

(assert (=> d!56053 m!217637))

(declare-fun m!217639 () Bool)

(assert (=> b!191030 m!217639))

(declare-fun m!217641 () Bool)

(assert (=> b!191031 m!217641))

(assert (=> bm!19256 d!56053))

(declare-fun d!56055 () Bool)

(declare-fun e!125706 () Bool)

(assert (=> d!56055 e!125706))

(declare-fun res!90305 () Bool)

(assert (=> d!56055 (=> (not res!90305) (not e!125706))))

(declare-fun lt!94819 () ListLongMap!2439)

(assert (=> d!56055 (= res!90305 (contains!1346 lt!94819 (_1!1772 (ite (or c!34312 c!34315) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))))))

(declare-fun lt!94816 () List!2418)

(assert (=> d!56055 (= lt!94819 (ListLongMap!2440 lt!94816))))

(declare-fun lt!94817 () Unit!5764)

(declare-fun lt!94818 () Unit!5764)

(assert (=> d!56055 (= lt!94817 lt!94818)))

(assert (=> d!56055 (= (getValueByKey!237 lt!94816 (_1!1772 (ite (or c!34312 c!34315) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))) (Some!242 (_2!1772 (ite (or c!34312 c!34315) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))))))

(assert (=> d!56055 (= lt!94818 (lemmaContainsTupThenGetReturnValue!124 lt!94816 (_1!1772 (ite (or c!34312 c!34315) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))) (_2!1772 (ite (or c!34312 c!34315) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))))))

(assert (=> d!56055 (= lt!94816 (insertStrictlySorted!127 (toList!1235 (ite c!34312 call!19252 (ite c!34315 call!19247 call!19250))) (_1!1772 (ite (or c!34312 c!34315) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))) (_2!1772 (ite (or c!34312 c!34315) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))))))

(assert (=> d!56055 (= (+!303 (ite c!34312 call!19252 (ite c!34315 call!19247 call!19250)) (ite (or c!34312 c!34315) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))) lt!94819)))

(declare-fun b!191032 () Bool)

(declare-fun res!90304 () Bool)

(assert (=> b!191032 (=> (not res!90304) (not e!125706))))

(assert (=> b!191032 (= res!90304 (= (getValueByKey!237 (toList!1235 lt!94819) (_1!1772 (ite (or c!34312 c!34315) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))) (Some!242 (_2!1772 (ite (or c!34312 c!34315) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))))))))

(declare-fun b!191033 () Bool)

(assert (=> b!191033 (= e!125706 (contains!1348 (toList!1235 lt!94819) (ite (or c!34312 c!34315) (tuple2!3523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3733 thiss!1248)) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))))))

(assert (= (and d!56055 res!90305) b!191032))

(assert (= (and b!191032 res!90304) b!191033))

(declare-fun m!217643 () Bool)

(assert (=> d!56055 m!217643))

(declare-fun m!217645 () Bool)

(assert (=> d!56055 m!217645))

(declare-fun m!217647 () Bool)

(assert (=> d!56055 m!217647))

(declare-fun m!217649 () Bool)

(assert (=> d!56055 m!217649))

(declare-fun m!217651 () Bool)

(assert (=> b!191032 m!217651))

(declare-fun m!217653 () Bool)

(assert (=> b!191033 m!217653))

(assert (=> bm!19249 d!56055))

(declare-fun d!56057 () Bool)

(declare-fun c!34375 () Bool)

(assert (=> d!56057 (= c!34375 (and ((_ is Cons!2414) (toList!1235 lt!94591)) (= (_1!1772 (h!3052 (toList!1235 lt!94591))) (_1!1772 (tuple2!3523 key!828 v!309)))))))

(declare-fun e!125711 () Option!243)

(assert (=> d!56057 (= (getValueByKey!237 (toList!1235 lt!94591) (_1!1772 (tuple2!3523 key!828 v!309))) e!125711)))

(declare-fun b!191043 () Bool)

(declare-fun e!125712 () Option!243)

(assert (=> b!191043 (= e!125711 e!125712)))

(declare-fun c!34376 () Bool)

(assert (=> b!191043 (= c!34376 (and ((_ is Cons!2414) (toList!1235 lt!94591)) (not (= (_1!1772 (h!3052 (toList!1235 lt!94591))) (_1!1772 (tuple2!3523 key!828 v!309))))))))

(declare-fun b!191044 () Bool)

(assert (=> b!191044 (= e!125712 (getValueByKey!237 (t!7328 (toList!1235 lt!94591)) (_1!1772 (tuple2!3523 key!828 v!309))))))

(declare-fun b!191045 () Bool)

(assert (=> b!191045 (= e!125712 None!241)))

(declare-fun b!191042 () Bool)

(assert (=> b!191042 (= e!125711 (Some!242 (_2!1772 (h!3052 (toList!1235 lt!94591)))))))

(assert (= (and d!56057 c!34375) b!191042))

(assert (= (and d!56057 (not c!34375)) b!191043))

(assert (= (and b!191043 c!34376) b!191044))

(assert (= (and b!191043 (not c!34376)) b!191045))

(declare-fun m!217655 () Bool)

(assert (=> b!191044 m!217655))

(assert (=> b!190732 d!56057))

(declare-fun d!56059 () Bool)

(assert (=> d!56059 (= (validKeyInArray!0 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190821 d!56059))

(assert (=> b!190795 d!56059))

(declare-fun d!56061 () Bool)

(assert (=> d!56061 (= (inRange!0 (index!4867 lt!94579) (mask!9099 thiss!1248)) (and (bvsge (index!4867 lt!94579) #b00000000000000000000000000000000) (bvslt (index!4867 lt!94579) (bvadd (mask!9099 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!190726 d!56061))

(declare-fun d!56063 () Bool)

(declare-fun e!125714 () Bool)

(assert (=> d!56063 e!125714))

(declare-fun res!90306 () Bool)

(assert (=> d!56063 (=> res!90306 e!125714)))

(declare-fun lt!94821 () Bool)

(assert (=> d!56063 (= res!90306 (not lt!94821))))

(declare-fun lt!94820 () Bool)

(assert (=> d!56063 (= lt!94821 lt!94820)))

(declare-fun lt!94822 () Unit!5764)

(declare-fun e!125713 () Unit!5764)

(assert (=> d!56063 (= lt!94822 e!125713)))

(declare-fun c!34377 () Bool)

(assert (=> d!56063 (= c!34377 lt!94820)))

(assert (=> d!56063 (= lt!94820 (containsKey!241 (toList!1235 lt!94693) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56063 (= (contains!1346 lt!94693 #b0000000000000000000000000000000000000000000000000000000000000000) lt!94821)))

(declare-fun b!191046 () Bool)

(declare-fun lt!94823 () Unit!5764)

(assert (=> b!191046 (= e!125713 lt!94823)))

(assert (=> b!191046 (= lt!94823 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1235 lt!94693) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191046 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94693) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191047 () Bool)

(declare-fun Unit!5775 () Unit!5764)

(assert (=> b!191047 (= e!125713 Unit!5775)))

(declare-fun b!191048 () Bool)

(assert (=> b!191048 (= e!125714 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94693) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56063 c!34377) b!191046))

(assert (= (and d!56063 (not c!34377)) b!191047))

(assert (= (and d!56063 (not res!90306)) b!191048))

(declare-fun m!217657 () Bool)

(assert (=> d!56063 m!217657))

(declare-fun m!217659 () Bool)

(assert (=> b!191046 m!217659))

(declare-fun m!217661 () Bool)

(assert (=> b!191046 m!217661))

(assert (=> b!191046 m!217661))

(declare-fun m!217663 () Bool)

(assert (=> b!191046 m!217663))

(assert (=> b!191048 m!217661))

(assert (=> b!191048 m!217661))

(assert (=> b!191048 m!217663))

(assert (=> bm!19253 d!56063))

(declare-fun d!56065 () Bool)

(declare-fun e!125716 () Bool)

(assert (=> d!56065 e!125716))

(declare-fun res!90307 () Bool)

(assert (=> d!56065 (=> res!90307 e!125716)))

(declare-fun lt!94825 () Bool)

(assert (=> d!56065 (= res!90307 (not lt!94825))))

(declare-fun lt!94824 () Bool)

(assert (=> d!56065 (= lt!94825 lt!94824)))

(declare-fun lt!94826 () Unit!5764)

(declare-fun e!125715 () Unit!5764)

(assert (=> d!56065 (= lt!94826 e!125715)))

(declare-fun c!34378 () Bool)

(assert (=> d!56065 (= c!34378 lt!94824)))

(assert (=> d!56065 (= lt!94824 (containsKey!241 (toList!1235 lt!94668) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56065 (= (contains!1346 lt!94668 #b0000000000000000000000000000000000000000000000000000000000000000) lt!94825)))

(declare-fun b!191049 () Bool)

(declare-fun lt!94827 () Unit!5764)

(assert (=> b!191049 (= e!125715 lt!94827)))

(assert (=> b!191049 (= lt!94827 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1235 lt!94668) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191049 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94668) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191050 () Bool)

(declare-fun Unit!5776 () Unit!5764)

(assert (=> b!191050 (= e!125715 Unit!5776)))

(declare-fun b!191051 () Bool)

(assert (=> b!191051 (= e!125716 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94668) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56065 c!34378) b!191049))

(assert (= (and d!56065 (not c!34378)) b!191050))

(assert (= (and d!56065 (not res!90307)) b!191051))

(declare-fun m!217665 () Bool)

(assert (=> d!56065 m!217665))

(declare-fun m!217667 () Bool)

(assert (=> b!191049 m!217667))

(declare-fun m!217669 () Bool)

(assert (=> b!191049 m!217669))

(assert (=> b!191049 m!217669))

(declare-fun m!217671 () Bool)

(assert (=> b!191049 m!217671))

(assert (=> b!191051 m!217669))

(assert (=> b!191051 m!217669))

(assert (=> b!191051 m!217671))

(assert (=> bm!19246 d!56065))

(declare-fun bm!19276 () Bool)

(declare-fun call!19279 () Bool)

(declare-fun c!34381 () Bool)

(assert (=> bm!19276 (= call!19279 (arrayNoDuplicates!0 (_keys!5865 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34381 (Cons!2416 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000) Nil!2417) Nil!2417)))))

(declare-fun b!191062 () Bool)

(declare-fun e!125728 () Bool)

(declare-fun e!125726 () Bool)

(assert (=> b!191062 (= e!125728 e!125726)))

(declare-fun res!90315 () Bool)

(assert (=> b!191062 (=> (not res!90315) (not e!125726))))

(declare-fun e!125727 () Bool)

(assert (=> b!191062 (= res!90315 (not e!125727))))

(declare-fun res!90316 () Bool)

(assert (=> b!191062 (=> (not res!90316) (not e!125727))))

(assert (=> b!191062 (= res!90316 (validKeyInArray!0 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191064 () Bool)

(declare-fun contains!1349 (List!2420 (_ BitVec 64)) Bool)

(assert (=> b!191064 (= e!125727 (contains!1349 Nil!2417 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191065 () Bool)

(declare-fun e!125725 () Bool)

(assert (=> b!191065 (= e!125725 call!19279)))

(declare-fun b!191066 () Bool)

(assert (=> b!191066 (= e!125726 e!125725)))

(assert (=> b!191066 (= c!34381 (validKeyInArray!0 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191063 () Bool)

(assert (=> b!191063 (= e!125725 call!19279)))

(declare-fun d!56067 () Bool)

(declare-fun res!90314 () Bool)

(assert (=> d!56067 (=> res!90314 e!125728)))

(assert (=> d!56067 (= res!90314 (bvsge #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(assert (=> d!56067 (= (arrayNoDuplicates!0 (_keys!5865 thiss!1248) #b00000000000000000000000000000000 Nil!2417) e!125728)))

(assert (= (and d!56067 (not res!90314)) b!191062))

(assert (= (and b!191062 res!90316) b!191064))

(assert (= (and b!191062 res!90315) b!191066))

(assert (= (and b!191066 c!34381) b!191063))

(assert (= (and b!191066 (not c!34381)) b!191065))

(assert (= (or b!191063 b!191065) bm!19276))

(assert (=> bm!19276 m!217219))

(declare-fun m!217673 () Bool)

(assert (=> bm!19276 m!217673))

(assert (=> b!191062 m!217219))

(assert (=> b!191062 m!217219))

(assert (=> b!191062 m!217243))

(assert (=> b!191064 m!217219))

(assert (=> b!191064 m!217219))

(declare-fun m!217675 () Bool)

(assert (=> b!191064 m!217675))

(assert (=> b!191066 m!217219))

(assert (=> b!191066 m!217219))

(assert (=> b!191066 m!217243))

(assert (=> b!190864 d!56067))

(declare-fun d!56069 () Bool)

(declare-fun e!125730 () Bool)

(assert (=> d!56069 e!125730))

(declare-fun res!90317 () Bool)

(assert (=> d!56069 (=> res!90317 e!125730)))

(declare-fun lt!94829 () Bool)

(assert (=> d!56069 (= res!90317 (not lt!94829))))

(declare-fun lt!94828 () Bool)

(assert (=> d!56069 (= lt!94829 lt!94828)))

(declare-fun lt!94830 () Unit!5764)

(declare-fun e!125729 () Unit!5764)

(assert (=> d!56069 (= lt!94830 e!125729)))

(declare-fun c!34382 () Bool)

(assert (=> d!56069 (= c!34382 lt!94828)))

(assert (=> d!56069 (= lt!94828 (containsKey!241 (toList!1235 lt!94693) (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56069 (= (contains!1346 lt!94693 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)) lt!94829)))

(declare-fun b!191067 () Bool)

(declare-fun lt!94831 () Unit!5764)

(assert (=> b!191067 (= e!125729 lt!94831)))

(assert (=> b!191067 (= lt!94831 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1235 lt!94693) (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191067 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94693) (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191068 () Bool)

(declare-fun Unit!5777 () Unit!5764)

(assert (=> b!191068 (= e!125729 Unit!5777)))

(declare-fun b!191069 () Bool)

(assert (=> b!191069 (= e!125730 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94693) (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56069 c!34382) b!191067))

(assert (= (and d!56069 (not c!34382)) b!191068))

(assert (= (and d!56069 (not res!90317)) b!191069))

(assert (=> d!56069 m!217219))

(declare-fun m!217677 () Bool)

(assert (=> d!56069 m!217677))

(assert (=> b!191067 m!217219))

(declare-fun m!217679 () Bool)

(assert (=> b!191067 m!217679))

(assert (=> b!191067 m!217219))

(declare-fun m!217681 () Bool)

(assert (=> b!191067 m!217681))

(assert (=> b!191067 m!217681))

(declare-fun m!217683 () Bool)

(assert (=> b!191067 m!217683))

(assert (=> b!191069 m!217219))

(assert (=> b!191069 m!217681))

(assert (=> b!191069 m!217681))

(assert (=> b!191069 m!217683))

(assert (=> b!190820 d!56069))

(declare-fun d!56071 () Bool)

(declare-fun e!125732 () Bool)

(assert (=> d!56071 e!125732))

(declare-fun res!90318 () Bool)

(assert (=> d!56071 (=> res!90318 e!125732)))

(declare-fun lt!94833 () Bool)

(assert (=> d!56071 (= res!90318 (not lt!94833))))

(declare-fun lt!94832 () Bool)

(assert (=> d!56071 (= lt!94833 lt!94832)))

(declare-fun lt!94834 () Unit!5764)

(declare-fun e!125731 () Unit!5764)

(assert (=> d!56071 (= lt!94834 e!125731)))

(declare-fun c!34383 () Bool)

(assert (=> d!56071 (= c!34383 lt!94832)))

(assert (=> d!56071 (= lt!94832 (containsKey!241 (toList!1235 lt!94668) (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56071 (= (contains!1346 lt!94668 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)) lt!94833)))

(declare-fun b!191070 () Bool)

(declare-fun lt!94835 () Unit!5764)

(assert (=> b!191070 (= e!125731 lt!94835)))

(assert (=> b!191070 (= lt!94835 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1235 lt!94668) (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191070 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94668) (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191071 () Bool)

(declare-fun Unit!5778 () Unit!5764)

(assert (=> b!191071 (= e!125731 Unit!5778)))

(declare-fun b!191072 () Bool)

(assert (=> b!191072 (= e!125732 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94668) (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56071 c!34383) b!191070))

(assert (= (and d!56071 (not c!34383)) b!191071))

(assert (= (and d!56071 (not res!90318)) b!191072))

(assert (=> d!56071 m!217219))

(declare-fun m!217685 () Bool)

(assert (=> d!56071 m!217685))

(assert (=> b!191070 m!217219))

(declare-fun m!217687 () Bool)

(assert (=> b!191070 m!217687))

(assert (=> b!191070 m!217219))

(declare-fun m!217689 () Bool)

(assert (=> b!191070 m!217689))

(assert (=> b!191070 m!217689))

(declare-fun m!217691 () Bool)

(assert (=> b!191070 m!217691))

(assert (=> b!191072 m!217219))

(assert (=> b!191072 m!217689))

(assert (=> b!191072 m!217689))

(assert (=> b!191072 m!217691))

(assert (=> b!190794 d!56071))

(declare-fun d!56073 () Bool)

(declare-fun e!125734 () Bool)

(assert (=> d!56073 e!125734))

(declare-fun res!90319 () Bool)

(assert (=> d!56073 (=> res!90319 e!125734)))

(declare-fun lt!94837 () Bool)

(assert (=> d!56073 (= res!90319 (not lt!94837))))

(declare-fun lt!94836 () Bool)

(assert (=> d!56073 (= lt!94837 lt!94836)))

(declare-fun lt!94838 () Unit!5764)

(declare-fun e!125733 () Unit!5764)

(assert (=> d!56073 (= lt!94838 e!125733)))

(declare-fun c!34384 () Bool)

(assert (=> d!56073 (= c!34384 lt!94836)))

(assert (=> d!56073 (= lt!94836 (containsKey!241 (toList!1235 lt!94591) (_1!1772 (tuple2!3523 key!828 v!309))))))

(assert (=> d!56073 (= (contains!1346 lt!94591 (_1!1772 (tuple2!3523 key!828 v!309))) lt!94837)))

(declare-fun b!191073 () Bool)

(declare-fun lt!94839 () Unit!5764)

(assert (=> b!191073 (= e!125733 lt!94839)))

(assert (=> b!191073 (= lt!94839 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1235 lt!94591) (_1!1772 (tuple2!3523 key!828 v!309))))))

(assert (=> b!191073 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94591) (_1!1772 (tuple2!3523 key!828 v!309))))))

(declare-fun b!191074 () Bool)

(declare-fun Unit!5779 () Unit!5764)

(assert (=> b!191074 (= e!125733 Unit!5779)))

(declare-fun b!191075 () Bool)

(assert (=> b!191075 (= e!125734 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94591) (_1!1772 (tuple2!3523 key!828 v!309)))))))

(assert (= (and d!56073 c!34384) b!191073))

(assert (= (and d!56073 (not c!34384)) b!191074))

(assert (= (and d!56073 (not res!90319)) b!191075))

(declare-fun m!217693 () Bool)

(assert (=> d!56073 m!217693))

(declare-fun m!217695 () Bool)

(assert (=> b!191073 m!217695))

(assert (=> b!191073 m!217207))

(assert (=> b!191073 m!217207))

(declare-fun m!217697 () Bool)

(assert (=> b!191073 m!217697))

(assert (=> b!191075 m!217207))

(assert (=> b!191075 m!217207))

(assert (=> b!191075 m!217697))

(assert (=> d!55959 d!56073))

(declare-fun d!56075 () Bool)

(declare-fun c!34385 () Bool)

(assert (=> d!56075 (= c!34385 (and ((_ is Cons!2414) lt!94588) (= (_1!1772 (h!3052 lt!94588)) (_1!1772 (tuple2!3523 key!828 v!309)))))))

(declare-fun e!125735 () Option!243)

(assert (=> d!56075 (= (getValueByKey!237 lt!94588 (_1!1772 (tuple2!3523 key!828 v!309))) e!125735)))

(declare-fun b!191077 () Bool)

(declare-fun e!125736 () Option!243)

(assert (=> b!191077 (= e!125735 e!125736)))

(declare-fun c!34386 () Bool)

(assert (=> b!191077 (= c!34386 (and ((_ is Cons!2414) lt!94588) (not (= (_1!1772 (h!3052 lt!94588)) (_1!1772 (tuple2!3523 key!828 v!309))))))))

(declare-fun b!191078 () Bool)

(assert (=> b!191078 (= e!125736 (getValueByKey!237 (t!7328 lt!94588) (_1!1772 (tuple2!3523 key!828 v!309))))))

(declare-fun b!191079 () Bool)

(assert (=> b!191079 (= e!125736 None!241)))

(declare-fun b!191076 () Bool)

(assert (=> b!191076 (= e!125735 (Some!242 (_2!1772 (h!3052 lt!94588))))))

(assert (= (and d!56075 c!34385) b!191076))

(assert (= (and d!56075 (not c!34385)) b!191077))

(assert (= (and b!191077 c!34386) b!191078))

(assert (= (and b!191077 (not c!34386)) b!191079))

(declare-fun m!217699 () Bool)

(assert (=> b!191078 m!217699))

(assert (=> d!55959 d!56075))

(declare-fun d!56077 () Bool)

(assert (=> d!56077 (= (getValueByKey!237 lt!94588 (_1!1772 (tuple2!3523 key!828 v!309))) (Some!242 (_2!1772 (tuple2!3523 key!828 v!309))))))

(declare-fun lt!94842 () Unit!5764)

(declare-fun choose!1032 (List!2418 (_ BitVec 64) V!5571) Unit!5764)

(assert (=> d!56077 (= lt!94842 (choose!1032 lt!94588 (_1!1772 (tuple2!3523 key!828 v!309)) (_2!1772 (tuple2!3523 key!828 v!309))))))

(declare-fun e!125739 () Bool)

(assert (=> d!56077 e!125739))

(declare-fun res!90324 () Bool)

(assert (=> d!56077 (=> (not res!90324) (not e!125739))))

(declare-fun isStrictlySorted!354 (List!2418) Bool)

(assert (=> d!56077 (= res!90324 (isStrictlySorted!354 lt!94588))))

(assert (=> d!56077 (= (lemmaContainsTupThenGetReturnValue!124 lt!94588 (_1!1772 (tuple2!3523 key!828 v!309)) (_2!1772 (tuple2!3523 key!828 v!309))) lt!94842)))

(declare-fun b!191084 () Bool)

(declare-fun res!90325 () Bool)

(assert (=> b!191084 (=> (not res!90325) (not e!125739))))

(assert (=> b!191084 (= res!90325 (containsKey!241 lt!94588 (_1!1772 (tuple2!3523 key!828 v!309))))))

(declare-fun b!191085 () Bool)

(assert (=> b!191085 (= e!125739 (contains!1348 lt!94588 (tuple2!3523 (_1!1772 (tuple2!3523 key!828 v!309)) (_2!1772 (tuple2!3523 key!828 v!309)))))))

(assert (= (and d!56077 res!90324) b!191084))

(assert (= (and b!191084 res!90325) b!191085))

(assert (=> d!56077 m!217201))

(declare-fun m!217701 () Bool)

(assert (=> d!56077 m!217701))

(declare-fun m!217703 () Bool)

(assert (=> d!56077 m!217703))

(declare-fun m!217705 () Bool)

(assert (=> b!191084 m!217705))

(declare-fun m!217707 () Bool)

(assert (=> b!191085 m!217707))

(assert (=> d!55959 d!56077))

(declare-fun e!125753 () List!2418)

(declare-fun call!19288 () List!2418)

(declare-fun c!34395 () Bool)

(declare-fun bm!19283 () Bool)

(declare-fun $colon$colon!100 (List!2418 tuple2!3522) List!2418)

(assert (=> bm!19283 (= call!19288 ($colon$colon!100 e!125753 (ite c!34395 (h!3052 (toList!1235 lt!94553)) (tuple2!3523 (_1!1772 (tuple2!3523 key!828 v!309)) (_2!1772 (tuple2!3523 key!828 v!309))))))))

(declare-fun c!34397 () Bool)

(assert (=> bm!19283 (= c!34397 c!34395)))

(declare-fun c!34398 () Bool)

(declare-fun b!191106 () Bool)

(assert (=> b!191106 (= c!34398 (and ((_ is Cons!2414) (toList!1235 lt!94553)) (bvsgt (_1!1772 (h!3052 (toList!1235 lt!94553))) (_1!1772 (tuple2!3523 key!828 v!309)))))))

(declare-fun e!125750 () List!2418)

(declare-fun e!125752 () List!2418)

(assert (=> b!191106 (= e!125750 e!125752)))

(declare-fun b!191107 () Bool)

(assert (=> b!191107 (= e!125753 (insertStrictlySorted!127 (t!7328 (toList!1235 lt!94553)) (_1!1772 (tuple2!3523 key!828 v!309)) (_2!1772 (tuple2!3523 key!828 v!309))))))

(declare-fun c!34396 () Bool)

(declare-fun b!191108 () Bool)

(assert (=> b!191108 (= e!125753 (ite c!34396 (t!7328 (toList!1235 lt!94553)) (ite c!34398 (Cons!2414 (h!3052 (toList!1235 lt!94553)) (t!7328 (toList!1235 lt!94553))) Nil!2415)))))

(declare-fun e!125751 () Bool)

(declare-fun b!191109 () Bool)

(declare-fun lt!94845 () List!2418)

(assert (=> b!191109 (= e!125751 (contains!1348 lt!94845 (tuple2!3523 (_1!1772 (tuple2!3523 key!828 v!309)) (_2!1772 (tuple2!3523 key!828 v!309)))))))

(declare-fun bm!19284 () Bool)

(declare-fun call!19287 () List!2418)

(assert (=> bm!19284 (= call!19287 call!19288)))

(declare-fun b!191110 () Bool)

(declare-fun e!125754 () List!2418)

(assert (=> b!191110 (= e!125754 call!19288)))

(declare-fun d!56079 () Bool)

(assert (=> d!56079 e!125751))

(declare-fun res!90330 () Bool)

(assert (=> d!56079 (=> (not res!90330) (not e!125751))))

(assert (=> d!56079 (= res!90330 (isStrictlySorted!354 lt!94845))))

(assert (=> d!56079 (= lt!94845 e!125754)))

(assert (=> d!56079 (= c!34395 (and ((_ is Cons!2414) (toList!1235 lt!94553)) (bvslt (_1!1772 (h!3052 (toList!1235 lt!94553))) (_1!1772 (tuple2!3523 key!828 v!309)))))))

(assert (=> d!56079 (isStrictlySorted!354 (toList!1235 lt!94553))))

(assert (=> d!56079 (= (insertStrictlySorted!127 (toList!1235 lt!94553) (_1!1772 (tuple2!3523 key!828 v!309)) (_2!1772 (tuple2!3523 key!828 v!309))) lt!94845)))

(declare-fun b!191111 () Bool)

(assert (=> b!191111 (= e!125750 call!19287)))

(declare-fun bm!19285 () Bool)

(declare-fun call!19286 () List!2418)

(assert (=> bm!19285 (= call!19286 call!19287)))

(declare-fun b!191112 () Bool)

(declare-fun res!90331 () Bool)

(assert (=> b!191112 (=> (not res!90331) (not e!125751))))

(assert (=> b!191112 (= res!90331 (containsKey!241 lt!94845 (_1!1772 (tuple2!3523 key!828 v!309))))))

(declare-fun b!191113 () Bool)

(assert (=> b!191113 (= e!125752 call!19286)))

(declare-fun b!191114 () Bool)

(assert (=> b!191114 (= e!125754 e!125750)))

(assert (=> b!191114 (= c!34396 (and ((_ is Cons!2414) (toList!1235 lt!94553)) (= (_1!1772 (h!3052 (toList!1235 lt!94553))) (_1!1772 (tuple2!3523 key!828 v!309)))))))

(declare-fun b!191115 () Bool)

(assert (=> b!191115 (= e!125752 call!19286)))

(assert (= (and d!56079 c!34395) b!191110))

(assert (= (and d!56079 (not c!34395)) b!191114))

(assert (= (and b!191114 c!34396) b!191111))

(assert (= (and b!191114 (not c!34396)) b!191106))

(assert (= (and b!191106 c!34398) b!191115))

(assert (= (and b!191106 (not c!34398)) b!191113))

(assert (= (or b!191115 b!191113) bm!19285))

(assert (= (or b!191111 bm!19285) bm!19284))

(assert (= (or b!191110 bm!19284) bm!19283))

(assert (= (and bm!19283 c!34397) b!191107))

(assert (= (and bm!19283 (not c!34397)) b!191108))

(assert (= (and d!56079 res!90330) b!191112))

(assert (= (and b!191112 res!90331) b!191109))

(declare-fun m!217709 () Bool)

(assert (=> bm!19283 m!217709))

(declare-fun m!217711 () Bool)

(assert (=> d!56079 m!217711))

(declare-fun m!217713 () Bool)

(assert (=> d!56079 m!217713))

(declare-fun m!217715 () Bool)

(assert (=> b!191107 m!217715))

(declare-fun m!217717 () Bool)

(assert (=> b!191112 m!217717))

(declare-fun m!217719 () Bool)

(assert (=> b!191109 m!217719))

(assert (=> d!55959 d!56079))

(declare-fun d!56081 () Bool)

(declare-fun res!90336 () Bool)

(declare-fun e!125759 () Bool)

(assert (=> d!56081 (=> res!90336 e!125759)))

(assert (=> d!56081 (= res!90336 (= (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!56081 (= (arrayContainsKey!0 (_keys!5865 thiss!1248) key!828 #b00000000000000000000000000000000) e!125759)))

(declare-fun b!191120 () Bool)

(declare-fun e!125760 () Bool)

(assert (=> b!191120 (= e!125759 e!125760)))

(declare-fun res!90337 () Bool)

(assert (=> b!191120 (=> (not res!90337) (not e!125760))))

(assert (=> b!191120 (= res!90337 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4148 (_keys!5865 thiss!1248))))))

(declare-fun b!191121 () Bool)

(assert (=> b!191121 (= e!125760 (arrayContainsKey!0 (_keys!5865 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!56081 (not res!90336)) b!191120))

(assert (= (and b!191120 res!90337) b!191121))

(assert (=> d!56081 m!217219))

(declare-fun m!217721 () Bool)

(assert (=> b!191121 m!217721))

(assert (=> bm!19262 d!56081))

(declare-fun d!56083 () Bool)

(declare-fun res!90342 () Bool)

(declare-fun e!125765 () Bool)

(assert (=> d!56083 (=> res!90342 e!125765)))

(assert (=> d!56083 (= res!90342 (and ((_ is Cons!2414) (toList!1235 lt!94553)) (= (_1!1772 (h!3052 (toList!1235 lt!94553))) key!828)))))

(assert (=> d!56083 (= (containsKey!241 (toList!1235 lt!94553) key!828) e!125765)))

(declare-fun b!191126 () Bool)

(declare-fun e!125766 () Bool)

(assert (=> b!191126 (= e!125765 e!125766)))

(declare-fun res!90343 () Bool)

(assert (=> b!191126 (=> (not res!90343) (not e!125766))))

(assert (=> b!191126 (= res!90343 (and (or (not ((_ is Cons!2414) (toList!1235 lt!94553))) (bvsle (_1!1772 (h!3052 (toList!1235 lt!94553))) key!828)) ((_ is Cons!2414) (toList!1235 lt!94553)) (bvslt (_1!1772 (h!3052 (toList!1235 lt!94553))) key!828)))))

(declare-fun b!191127 () Bool)

(assert (=> b!191127 (= e!125766 (containsKey!241 (t!7328 (toList!1235 lt!94553)) key!828))))

(assert (= (and d!56083 (not res!90342)) b!191126))

(assert (= (and b!191126 res!90343) b!191127))

(declare-fun m!217723 () Bool)

(assert (=> b!191127 m!217723))

(assert (=> d!55961 d!56083))

(declare-fun d!56085 () Bool)

(declare-fun e!125767 () Bool)

(assert (=> d!56085 e!125767))

(declare-fun res!90345 () Bool)

(assert (=> d!56085 (=> (not res!90345) (not e!125767))))

(declare-fun lt!94849 () ListLongMap!2439)

(assert (=> d!56085 (= res!90345 (contains!1346 lt!94849 (_1!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))))))

(declare-fun lt!94846 () List!2418)

(assert (=> d!56085 (= lt!94849 (ListLongMap!2440 lt!94846))))

(declare-fun lt!94847 () Unit!5764)

(declare-fun lt!94848 () Unit!5764)

(assert (=> d!56085 (= lt!94847 lt!94848)))

(assert (=> d!56085 (= (getValueByKey!237 lt!94846 (_1!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))))))

(assert (=> d!56085 (= lt!94848 (lemmaContainsTupThenGetReturnValue!124 lt!94846 (_1!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))))))

(assert (=> d!56085 (= lt!94846 (insertStrictlySorted!127 (toList!1235 call!19256) (_1!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))))))

(assert (=> d!56085 (= (+!303 call!19256 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))) lt!94849)))

(declare-fun b!191128 () Bool)

(declare-fun res!90344 () Bool)

(assert (=> b!191128 (=> (not res!90344) (not e!125767))))

(assert (=> b!191128 (= res!90344 (= (getValueByKey!237 (toList!1235 lt!94849) (_1!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))))))

(declare-fun b!191129 () Bool)

(assert (=> b!191129 (= e!125767 (contains!1348 (toList!1235 lt!94849) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))))

(assert (= (and d!56085 res!90345) b!191128))

(assert (= (and b!191128 res!90344) b!191129))

(declare-fun m!217725 () Bool)

(assert (=> d!56085 m!217725))

(declare-fun m!217727 () Bool)

(assert (=> d!56085 m!217727))

(declare-fun m!217729 () Bool)

(assert (=> d!56085 m!217729))

(declare-fun m!217731 () Bool)

(assert (=> d!56085 m!217731))

(declare-fun m!217733 () Bool)

(assert (=> b!191128 m!217733))

(declare-fun m!217735 () Bool)

(assert (=> b!191129 m!217735))

(assert (=> b!190822 d!56085))

(declare-fun d!56087 () Bool)

(declare-fun e!125768 () Bool)

(assert (=> d!56087 e!125768))

(declare-fun res!90347 () Bool)

(assert (=> d!56087 (=> (not res!90347) (not e!125768))))

(declare-fun lt!94853 () ListLongMap!2439)

(assert (=> d!56087 (= res!90347 (contains!1346 lt!94853 (_1!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))))))

(declare-fun lt!94850 () List!2418)

(assert (=> d!56087 (= lt!94853 (ListLongMap!2440 lt!94850))))

(declare-fun lt!94851 () Unit!5764)

(declare-fun lt!94852 () Unit!5764)

(assert (=> d!56087 (= lt!94851 lt!94852)))

(assert (=> d!56087 (= (getValueByKey!237 lt!94850 (_1!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))))))

(assert (=> d!56087 (= lt!94852 (lemmaContainsTupThenGetReturnValue!124 lt!94850 (_1!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))))))

(assert (=> d!56087 (= lt!94850 (insertStrictlySorted!127 (toList!1235 call!19249) (_1!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))) (_2!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))))))

(assert (=> d!56087 (= (+!303 call!19249 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))) lt!94853)))

(declare-fun b!191130 () Bool)

(declare-fun res!90346 () Bool)

(assert (=> b!191130 (=> (not res!90346) (not e!125768))))

(assert (=> b!191130 (= res!90346 (= (getValueByKey!237 (toList!1235 lt!94853) (_1!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248)))) (Some!242 (_2!1772 (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))))))

(declare-fun b!191131 () Bool)

(assert (=> b!191131 (= e!125768 (contains!1348 (toList!1235 lt!94853) (tuple2!3523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3733 thiss!1248))))))

(assert (= (and d!56087 res!90347) b!191130))

(assert (= (and b!191130 res!90346) b!191131))

(declare-fun m!217737 () Bool)

(assert (=> d!56087 m!217737))

(declare-fun m!217739 () Bool)

(assert (=> d!56087 m!217739))

(declare-fun m!217741 () Bool)

(assert (=> d!56087 m!217741))

(declare-fun m!217743 () Bool)

(assert (=> d!56087 m!217743))

(declare-fun m!217745 () Bool)

(assert (=> b!191130 m!217745))

(declare-fun m!217747 () Bool)

(assert (=> b!191131 m!217747))

(assert (=> b!190796 d!56087))

(declare-fun b!191145 () Bool)

(declare-fun e!125777 () SeekEntryResult!674)

(assert (=> b!191145 (= e!125777 (MissingVacant!674 (index!4868 lt!94707)))))

(declare-fun b!191146 () Bool)

(declare-fun c!34405 () Bool)

(declare-fun lt!94858 () (_ BitVec 64))

(assert (=> b!191146 (= c!34405 (= lt!94858 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!125775 () SeekEntryResult!674)

(assert (=> b!191146 (= e!125775 e!125777)))

(declare-fun b!191147 () Bool)

(declare-fun e!125776 () SeekEntryResult!674)

(assert (=> b!191147 (= e!125776 Undefined!674)))

(declare-fun b!191148 () Bool)

(assert (=> b!191148 (= e!125776 e!125775)))

(declare-fun c!34407 () Bool)

(assert (=> b!191148 (= c!34407 (= lt!94858 key!828))))

(declare-fun b!191149 () Bool)

(assert (=> b!191149 (= e!125775 (Found!674 (index!4868 lt!94707)))))

(declare-fun lt!94859 () SeekEntryResult!674)

(declare-fun d!56089 () Bool)

(assert (=> d!56089 (and (or ((_ is Undefined!674) lt!94859) (not ((_ is Found!674) lt!94859)) (and (bvsge (index!4867 lt!94859) #b00000000000000000000000000000000) (bvslt (index!4867 lt!94859) (size!4148 (_keys!5865 thiss!1248))))) (or ((_ is Undefined!674) lt!94859) ((_ is Found!674) lt!94859) (not ((_ is MissingVacant!674) lt!94859)) (not (= (index!4869 lt!94859) (index!4868 lt!94707))) (and (bvsge (index!4869 lt!94859) #b00000000000000000000000000000000) (bvslt (index!4869 lt!94859) (size!4148 (_keys!5865 thiss!1248))))) (or ((_ is Undefined!674) lt!94859) (ite ((_ is Found!674) lt!94859) (= (select (arr!3827 (_keys!5865 thiss!1248)) (index!4867 lt!94859)) key!828) (and ((_ is MissingVacant!674) lt!94859) (= (index!4869 lt!94859) (index!4868 lt!94707)) (= (select (arr!3827 (_keys!5865 thiss!1248)) (index!4869 lt!94859)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!56089 (= lt!94859 e!125776)))

(declare-fun c!34406 () Bool)

(assert (=> d!56089 (= c!34406 (bvsge (x!20502 lt!94707) #b01111111111111111111111111111110))))

(assert (=> d!56089 (= lt!94858 (select (arr!3827 (_keys!5865 thiss!1248)) (index!4868 lt!94707)))))

(assert (=> d!56089 (validMask!0 (mask!9099 thiss!1248))))

(assert (=> d!56089 (= (seekKeyOrZeroReturnVacant!0 (x!20502 lt!94707) (index!4868 lt!94707) (index!4868 lt!94707) key!828 (_keys!5865 thiss!1248) (mask!9099 thiss!1248)) lt!94859)))

(declare-fun b!191144 () Bool)

(assert (=> b!191144 (= e!125777 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20502 lt!94707) #b00000000000000000000000000000001) (nextIndex!0 (index!4868 lt!94707) (x!20502 lt!94707) (mask!9099 thiss!1248)) (index!4868 lt!94707) key!828 (_keys!5865 thiss!1248) (mask!9099 thiss!1248)))))

(assert (= (and d!56089 c!34406) b!191147))

(assert (= (and d!56089 (not c!34406)) b!191148))

(assert (= (and b!191148 c!34407) b!191149))

(assert (= (and b!191148 (not c!34407)) b!191146))

(assert (= (and b!191146 c!34405) b!191145))

(assert (= (and b!191146 (not c!34405)) b!191144))

(declare-fun m!217749 () Bool)

(assert (=> d!56089 m!217749))

(declare-fun m!217751 () Bool)

(assert (=> d!56089 m!217751))

(assert (=> d!56089 m!217351))

(assert (=> d!56089 m!217153))

(declare-fun m!217753 () Bool)

(assert (=> b!191144 m!217753))

(assert (=> b!191144 m!217753))

(declare-fun m!217755 () Bool)

(assert (=> b!191144 m!217755))

(assert (=> b!190880 d!56089))

(declare-fun d!56091 () Bool)

(declare-fun e!125779 () Bool)

(assert (=> d!56091 e!125779))

(declare-fun res!90348 () Bool)

(assert (=> d!56091 (=> res!90348 e!125779)))

(declare-fun lt!94861 () Bool)

(assert (=> d!56091 (= res!90348 (not lt!94861))))

(declare-fun lt!94860 () Bool)

(assert (=> d!56091 (= lt!94861 lt!94860)))

(declare-fun lt!94862 () Unit!5764)

(declare-fun e!125778 () Unit!5764)

(assert (=> d!56091 (= lt!94862 e!125778)))

(declare-fun c!34408 () Bool)

(assert (=> d!56091 (= c!34408 lt!94860)))

(assert (=> d!56091 (= lt!94860 (containsKey!241 (toList!1235 lt!94693) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56091 (= (contains!1346 lt!94693 #b1000000000000000000000000000000000000000000000000000000000000000) lt!94861)))

(declare-fun b!191150 () Bool)

(declare-fun lt!94863 () Unit!5764)

(assert (=> b!191150 (= e!125778 lt!94863)))

(assert (=> b!191150 (= lt!94863 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1235 lt!94693) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191150 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94693) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191151 () Bool)

(declare-fun Unit!5780 () Unit!5764)

(assert (=> b!191151 (= e!125778 Unit!5780)))

(declare-fun b!191152 () Bool)

(assert (=> b!191152 (= e!125779 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94693) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56091 c!34408) b!191150))

(assert (= (and d!56091 (not c!34408)) b!191151))

(assert (= (and d!56091 (not res!90348)) b!191152))

(declare-fun m!217757 () Bool)

(assert (=> d!56091 m!217757))

(declare-fun m!217759 () Bool)

(assert (=> b!191150 m!217759))

(declare-fun m!217761 () Bool)

(assert (=> b!191150 m!217761))

(assert (=> b!191150 m!217761))

(declare-fun m!217763 () Bool)

(assert (=> b!191150 m!217763))

(assert (=> b!191152 m!217761))

(assert (=> b!191152 m!217761))

(assert (=> b!191152 m!217763))

(assert (=> bm!19251 d!56091))

(declare-fun d!56093 () Bool)

(declare-fun e!125781 () Bool)

(assert (=> d!56093 e!125781))

(declare-fun res!90349 () Bool)

(assert (=> d!56093 (=> res!90349 e!125781)))

(declare-fun lt!94865 () Bool)

(assert (=> d!56093 (= res!90349 (not lt!94865))))

(declare-fun lt!94864 () Bool)

(assert (=> d!56093 (= lt!94865 lt!94864)))

(declare-fun lt!94866 () Unit!5764)

(declare-fun e!125780 () Unit!5764)

(assert (=> d!56093 (= lt!94866 e!125780)))

(declare-fun c!34409 () Bool)

(assert (=> d!56093 (= c!34409 lt!94864)))

(assert (=> d!56093 (= lt!94864 (containsKey!241 (toList!1235 lt!94668) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56093 (= (contains!1346 lt!94668 #b1000000000000000000000000000000000000000000000000000000000000000) lt!94865)))

(declare-fun b!191153 () Bool)

(declare-fun lt!94867 () Unit!5764)

(assert (=> b!191153 (= e!125780 lt!94867)))

(assert (=> b!191153 (= lt!94867 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1235 lt!94668) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191153 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94668) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191154 () Bool)

(declare-fun Unit!5781 () Unit!5764)

(assert (=> b!191154 (= e!125780 Unit!5781)))

(declare-fun b!191155 () Bool)

(assert (=> b!191155 (= e!125781 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94668) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56093 c!34409) b!191153))

(assert (= (and d!56093 (not c!34409)) b!191154))

(assert (= (and d!56093 (not res!90349)) b!191155))

(declare-fun m!217765 () Bool)

(assert (=> d!56093 m!217765))

(declare-fun m!217767 () Bool)

(assert (=> b!191153 m!217767))

(declare-fun m!217769 () Bool)

(assert (=> b!191153 m!217769))

(assert (=> b!191153 m!217769))

(declare-fun m!217771 () Bool)

(assert (=> b!191153 m!217771))

(assert (=> b!191155 m!217769))

(assert (=> b!191155 m!217769))

(assert (=> b!191155 m!217771))

(assert (=> bm!19244 d!56093))

(declare-fun d!56095 () Bool)

(declare-fun isEmpty!482 (Option!243) Bool)

(assert (=> d!56095 (= (isDefined!190 (getValueByKey!237 (toList!1235 lt!94553) key!828)) (not (isEmpty!482 (getValueByKey!237 (toList!1235 lt!94553) key!828))))))

(declare-fun bs!7651 () Bool)

(assert (= bs!7651 d!56095))

(assert (=> bs!7651 m!217215))

(declare-fun m!217773 () Bool)

(assert (=> bs!7651 m!217773))

(assert (=> b!190742 d!56095))

(declare-fun d!56097 () Bool)

(declare-fun c!34410 () Bool)

(assert (=> d!56097 (= c!34410 (and ((_ is Cons!2414) (toList!1235 lt!94553)) (= (_1!1772 (h!3052 (toList!1235 lt!94553))) key!828)))))

(declare-fun e!125782 () Option!243)

(assert (=> d!56097 (= (getValueByKey!237 (toList!1235 lt!94553) key!828) e!125782)))

(declare-fun b!191157 () Bool)

(declare-fun e!125783 () Option!243)

(assert (=> b!191157 (= e!125782 e!125783)))

(declare-fun c!34411 () Bool)

(assert (=> b!191157 (= c!34411 (and ((_ is Cons!2414) (toList!1235 lt!94553)) (not (= (_1!1772 (h!3052 (toList!1235 lt!94553))) key!828))))))

(declare-fun b!191158 () Bool)

(assert (=> b!191158 (= e!125783 (getValueByKey!237 (t!7328 (toList!1235 lt!94553)) key!828))))

(declare-fun b!191159 () Bool)

(assert (=> b!191159 (= e!125783 None!241)))

(declare-fun b!191156 () Bool)

(assert (=> b!191156 (= e!125782 (Some!242 (_2!1772 (h!3052 (toList!1235 lt!94553)))))))

(assert (= (and d!56097 c!34410) b!191156))

(assert (= (and d!56097 (not c!34410)) b!191157))

(assert (= (and b!191157 c!34411) b!191158))

(assert (= (and b!191157 (not c!34411)) b!191159))

(declare-fun m!217775 () Bool)

(assert (=> b!191158 m!217775))

(assert (=> b!190742 d!56097))

(declare-fun d!56099 () Bool)

(assert (=> d!56099 (= (apply!180 lt!94693 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)) (get!2205 (getValueByKey!237 (toList!1235 lt!94693) (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7652 () Bool)

(assert (= bs!7652 d!56099))

(assert (=> bs!7652 m!217219))

(assert (=> bs!7652 m!217681))

(assert (=> bs!7652 m!217681))

(declare-fun m!217777 () Bool)

(assert (=> bs!7652 m!217777))

(assert (=> b!190831 d!56099))

(declare-fun c!34414 () Bool)

(declare-fun d!56101 () Bool)

(assert (=> d!56101 (= c!34414 ((_ is ValueCellFull!1878) (select (arr!3828 (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248)))) #b00000000000000000000000000000000)))))

(declare-fun e!125786 () V!5571)

(assert (=> d!56101 (= (get!2204 (select (arr!3828 (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3892 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!125786)))

(declare-fun b!191164 () Bool)

(declare-fun get!2206 (ValueCell!1878 V!5571) V!5571)

(assert (=> b!191164 (= e!125786 (get!2206 (select (arr!3828 (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3892 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!191165 () Bool)

(declare-fun get!2207 (ValueCell!1878 V!5571) V!5571)

(assert (=> b!191165 (= e!125786 (get!2207 (select (arr!3828 (array!8124 (store (arr!3828 (_values!3875 thiss!1248)) (index!4867 lt!94551) (ValueCellFull!1878 v!309)) (size!4149 (_values!3875 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3892 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56101 c!34414) b!191164))

(assert (= (and d!56101 (not c!34414)) b!191165))

(assert (=> b!191164 m!217285))

(assert (=> b!191164 m!217227))

(declare-fun m!217779 () Bool)

(assert (=> b!191164 m!217779))

(assert (=> b!191165 m!217285))

(assert (=> b!191165 m!217227))

(declare-fun m!217781 () Bool)

(assert (=> b!191165 m!217781))

(assert (=> b!190831 d!56101))

(declare-fun d!56103 () Bool)

(assert (=> d!56103 (= (apply!180 lt!94668 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)) (get!2205 (getValueByKey!237 (toList!1235 lt!94668) (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7653 () Bool)

(assert (= bs!7653 d!56103))

(assert (=> bs!7653 m!217219))

(assert (=> bs!7653 m!217689))

(assert (=> bs!7653 m!217689))

(declare-fun m!217783 () Bool)

(assert (=> bs!7653 m!217783))

(assert (=> b!190805 d!56103))

(declare-fun d!56105 () Bool)

(declare-fun c!34415 () Bool)

(assert (=> d!56105 (= c!34415 ((_ is ValueCellFull!1878) (select (arr!3828 (_values!3875 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!125787 () V!5571)

(assert (=> d!56105 (= (get!2204 (select (arr!3828 (_values!3875 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3892 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!125787)))

(declare-fun b!191166 () Bool)

(assert (=> b!191166 (= e!125787 (get!2206 (select (arr!3828 (_values!3875 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3892 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!191167 () Bool)

(assert (=> b!191167 (= e!125787 (get!2207 (select (arr!3828 (_values!3875 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!523 (defaultEntry!3892 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56105 c!34415) b!191166))

(assert (= (and d!56105 (not c!34415)) b!191167))

(assert (=> b!191166 m!217225))

(assert (=> b!191166 m!217227))

(declare-fun m!217785 () Bool)

(assert (=> b!191166 m!217785))

(assert (=> b!191167 m!217225))

(assert (=> b!191167 m!217227))

(declare-fun m!217787 () Bool)

(assert (=> b!191167 m!217787))

(assert (=> b!190805 d!56105))

(assert (=> b!190817 d!56059))

(assert (=> d!55967 d!55957))

(assert (=> b!190791 d!56059))

(declare-fun d!56107 () Bool)

(assert (=> d!56107 (isDefined!190 (getValueByKey!237 (toList!1235 lt!94553) key!828))))

(declare-fun lt!94870 () Unit!5764)

(declare-fun choose!1033 (List!2418 (_ BitVec 64)) Unit!5764)

(assert (=> d!56107 (= lt!94870 (choose!1033 (toList!1235 lt!94553) key!828))))

(declare-fun e!125790 () Bool)

(assert (=> d!56107 e!125790))

(declare-fun res!90352 () Bool)

(assert (=> d!56107 (=> (not res!90352) (not e!125790))))

(assert (=> d!56107 (= res!90352 (isStrictlySorted!354 (toList!1235 lt!94553)))))

(assert (=> d!56107 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1235 lt!94553) key!828) lt!94870)))

(declare-fun b!191170 () Bool)

(assert (=> b!191170 (= e!125790 (containsKey!241 (toList!1235 lt!94553) key!828))))

(assert (= (and d!56107 res!90352) b!191170))

(assert (=> d!56107 m!217215))

(assert (=> d!56107 m!217215))

(assert (=> d!56107 m!217217))

(declare-fun m!217789 () Bool)

(assert (=> d!56107 m!217789))

(assert (=> d!56107 m!217713))

(assert (=> b!191170 m!217211))

(assert (=> b!190740 d!56107))

(assert (=> b!190740 d!56095))

(assert (=> b!190740 d!56097))

(declare-fun b!191179 () Bool)

(declare-fun e!125798 () Bool)

(declare-fun e!125799 () Bool)

(assert (=> b!191179 (= e!125798 e!125799)))

(declare-fun lt!94878 () (_ BitVec 64))

(assert (=> b!191179 (= lt!94878 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94879 () Unit!5764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8121 (_ BitVec 64) (_ BitVec 32)) Unit!5764)

(assert (=> b!191179 (= lt!94879 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5865 thiss!1248) lt!94878 #b00000000000000000000000000000000))))

(assert (=> b!191179 (arrayContainsKey!0 (_keys!5865 thiss!1248) lt!94878 #b00000000000000000000000000000000)))

(declare-fun lt!94877 () Unit!5764)

(assert (=> b!191179 (= lt!94877 lt!94879)))

(declare-fun res!90357 () Bool)

(assert (=> b!191179 (= res!90357 (= (seekEntryOrOpen!0 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000) (_keys!5865 thiss!1248) (mask!9099 thiss!1248)) (Found!674 #b00000000000000000000000000000000)))))

(assert (=> b!191179 (=> (not res!90357) (not e!125799))))

(declare-fun bm!19288 () Bool)

(declare-fun call!19291 () Bool)

(assert (=> bm!19288 (= call!19291 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5865 thiss!1248) (mask!9099 thiss!1248)))))

(declare-fun b!191180 () Bool)

(declare-fun e!125797 () Bool)

(assert (=> b!191180 (= e!125797 e!125798)))

(declare-fun c!34418 () Bool)

(assert (=> b!191180 (= c!34418 (validKeyInArray!0 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56109 () Bool)

(declare-fun res!90358 () Bool)

(assert (=> d!56109 (=> res!90358 e!125797)))

(assert (=> d!56109 (= res!90358 (bvsge #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(assert (=> d!56109 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5865 thiss!1248) (mask!9099 thiss!1248)) e!125797)))

(declare-fun b!191181 () Bool)

(assert (=> b!191181 (= e!125799 call!19291)))

(declare-fun b!191182 () Bool)

(assert (=> b!191182 (= e!125798 call!19291)))

(assert (= (and d!56109 (not res!90358)) b!191180))

(assert (= (and b!191180 c!34418) b!191179))

(assert (= (and b!191180 (not c!34418)) b!191182))

(assert (= (and b!191179 res!90357) b!191181))

(assert (= (or b!191181 b!191182) bm!19288))

(assert (=> b!191179 m!217219))

(declare-fun m!217791 () Bool)

(assert (=> b!191179 m!217791))

(declare-fun m!217793 () Bool)

(assert (=> b!191179 m!217793))

(assert (=> b!191179 m!217219))

(declare-fun m!217795 () Bool)

(assert (=> b!191179 m!217795))

(declare-fun m!217797 () Bool)

(assert (=> bm!19288 m!217797))

(assert (=> b!191180 m!217219))

(assert (=> b!191180 m!217219))

(assert (=> b!191180 m!217243))

(assert (=> b!190863 d!56109))

(declare-fun d!56111 () Bool)

(declare-fun lt!94882 () (_ BitVec 32))

(assert (=> d!56111 (and (bvsge lt!94882 #b00000000000000000000000000000000) (bvsle lt!94882 (bvsub (size!4148 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!125805 () (_ BitVec 32))

(assert (=> d!56111 (= lt!94882 e!125805)))

(declare-fun c!34423 () Bool)

(assert (=> d!56111 (= c!34423 (bvsge #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))))))

(assert (=> d!56111 (and (bvsle #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4148 (_keys!5865 thiss!1248)) (size!4148 (_keys!5865 thiss!1248))))))

(assert (=> d!56111 (= (arrayCountValidKeys!0 (_keys!5865 thiss!1248) #b00000000000000000000000000000000 (size!4148 (_keys!5865 thiss!1248))) lt!94882)))

(declare-fun b!191191 () Bool)

(declare-fun e!125804 () (_ BitVec 32))

(declare-fun call!19294 () (_ BitVec 32))

(assert (=> b!191191 (= e!125804 call!19294)))

(declare-fun b!191192 () Bool)

(assert (=> b!191192 (= e!125805 #b00000000000000000000000000000000)))

(declare-fun b!191193 () Bool)

(assert (=> b!191193 (= e!125805 e!125804)))

(declare-fun c!34424 () Bool)

(assert (=> b!191193 (= c!34424 (validKeyInArray!0 (select (arr!3827 (_keys!5865 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191194 () Bool)

(assert (=> b!191194 (= e!125804 (bvadd #b00000000000000000000000000000001 call!19294))))

(declare-fun bm!19291 () Bool)

(assert (=> bm!19291 (= call!19294 (arrayCountValidKeys!0 (_keys!5865 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4148 (_keys!5865 thiss!1248))))))

(assert (= (and d!56111 c!34423) b!191192))

(assert (= (and d!56111 (not c!34423)) b!191193))

(assert (= (and b!191193 c!34424) b!191194))

(assert (= (and b!191193 (not c!34424)) b!191191))

(assert (= (or b!191194 b!191191) bm!19291))

(assert (=> b!191193 m!217219))

(assert (=> b!191193 m!217219))

(assert (=> b!191193 m!217243))

(declare-fun m!217799 () Bool)

(assert (=> bm!19291 m!217799))

(assert (=> b!190862 d!56111))

(declare-fun d!56113 () Bool)

(declare-fun res!90368 () Bool)

(declare-fun e!125808 () Bool)

(assert (=> d!56113 (=> (not res!90368) (not e!125808))))

(assert (=> d!56113 (= res!90368 (validMask!0 (mask!9099 thiss!1248)))))

(assert (=> d!56113 (= (simpleValid!196 thiss!1248) e!125808)))

(declare-fun b!191203 () Bool)

(declare-fun res!90369 () Bool)

(assert (=> b!191203 (=> (not res!90369) (not e!125808))))

(assert (=> b!191203 (= res!90369 (and (= (size!4149 (_values!3875 thiss!1248)) (bvadd (mask!9099 thiss!1248) #b00000000000000000000000000000001)) (= (size!4148 (_keys!5865 thiss!1248)) (size!4149 (_values!3875 thiss!1248))) (bvsge (_size!1381 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1381 thiss!1248) (bvadd (mask!9099 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!191205 () Bool)

(declare-fun res!90370 () Bool)

(assert (=> b!191205 (=> (not res!90370) (not e!125808))))

(declare-fun size!4152 (LongMapFixedSize!2664) (_ BitVec 32))

(assert (=> b!191205 (= res!90370 (= (size!4152 thiss!1248) (bvadd (_size!1381 thiss!1248) (bvsdiv (bvadd (extraKeys!3629 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!191204 () Bool)

(declare-fun res!90367 () Bool)

(assert (=> b!191204 (=> (not res!90367) (not e!125808))))

(assert (=> b!191204 (= res!90367 (bvsge (size!4152 thiss!1248) (_size!1381 thiss!1248)))))

(declare-fun b!191206 () Bool)

(assert (=> b!191206 (= e!125808 (and (bvsge (extraKeys!3629 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3629 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1381 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!56113 res!90368) b!191203))

(assert (= (and b!191203 res!90369) b!191204))

(assert (= (and b!191204 res!90367) b!191205))

(assert (= (and b!191205 res!90370) b!191206))

(assert (=> d!56113 m!217153))

(declare-fun m!217801 () Bool)

(assert (=> b!191205 m!217801))

(assert (=> b!191204 m!217801))

(assert (=> d!55971 d!56113))

(declare-fun d!56115 () Bool)

(assert (=> d!56115 (= (apply!180 lt!94693 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2205 (getValueByKey!237 (toList!1235 lt!94693) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7654 () Bool)

(assert (= bs!7654 d!56115))

(assert (=> bs!7654 m!217661))

(assert (=> bs!7654 m!217661))

(declare-fun m!217803 () Bool)

(assert (=> bs!7654 m!217803))

(assert (=> b!190816 d!56115))

(declare-fun d!56117 () Bool)

(assert (=> d!56117 (= (apply!180 lt!94668 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2205 (getValueByKey!237 (toList!1235 lt!94668) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7655 () Bool)

(assert (= bs!7655 d!56117))

(assert (=> bs!7655 m!217669))

(assert (=> bs!7655 m!217669))

(declare-fun m!217805 () Bool)

(assert (=> bs!7655 m!217805))

(assert (=> b!190790 d!56117))

(declare-fun d!56119 () Bool)

(assert (=> d!56119 (= (apply!180 lt!94693 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2205 (getValueByKey!237 (toList!1235 lt!94693) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7656 () Bool)

(assert (= bs!7656 d!56119))

(assert (=> bs!7656 m!217761))

(assert (=> bs!7656 m!217761))

(declare-fun m!217807 () Bool)

(assert (=> bs!7656 m!217807))

(assert (=> b!190830 d!56119))

(declare-fun d!56121 () Bool)

(assert (=> d!56121 (= (apply!180 lt!94668 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2205 (getValueByKey!237 (toList!1235 lt!94668) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7657 () Bool)

(assert (= bs!7657 d!56121))

(assert (=> bs!7657 m!217769))

(assert (=> bs!7657 m!217769))

(declare-fun m!217809 () Bool)

(assert (=> bs!7657 m!217809))

(assert (=> b!190804 d!56121))

(assert (=> d!55953 d!55973))

(declare-fun d!56123 () Bool)

(declare-fun e!125811 () Bool)

(assert (=> d!56123 e!125811))

(declare-fun res!90375 () Bool)

(assert (=> d!56123 (=> (not res!90375) (not e!125811))))

(declare-fun lt!94885 () SeekEntryResult!674)

(assert (=> d!56123 (= res!90375 ((_ is Found!674) lt!94885))))

(assert (=> d!56123 (= lt!94885 (seekEntryOrOpen!0 key!828 (_keys!5865 thiss!1248) (mask!9099 thiss!1248)))))

(assert (=> d!56123 true))

(declare-fun _$33!141 () Unit!5764)

(assert (=> d!56123 (= (choose!1027 (_keys!5865 thiss!1248) (_values!3875 thiss!1248) (mask!9099 thiss!1248) (extraKeys!3629 thiss!1248) (zeroValue!3733 thiss!1248) (minValue!3733 thiss!1248) key!828 (defaultEntry!3892 thiss!1248)) _$33!141)))

(declare-fun b!191211 () Bool)

(declare-fun res!90376 () Bool)

(assert (=> b!191211 (=> (not res!90376) (not e!125811))))

(assert (=> b!191211 (= res!90376 (inRange!0 (index!4867 lt!94885) (mask!9099 thiss!1248)))))

(declare-fun b!191212 () Bool)

(assert (=> b!191212 (= e!125811 (= (select (arr!3827 (_keys!5865 thiss!1248)) (index!4867 lt!94885)) key!828))))

(assert (= (and d!56123 res!90375) b!191211))

(assert (= (and b!191211 res!90376) b!191212))

(assert (=> d!56123 m!217131))

(declare-fun m!217811 () Bool)

(assert (=> b!191211 m!217811))

(declare-fun m!217813 () Bool)

(assert (=> b!191212 m!217813))

(assert (=> d!55953 d!56123))

(assert (=> d!55953 d!55957))

(declare-fun mapIsEmpty!7677 () Bool)

(declare-fun mapRes!7677 () Bool)

(assert (=> mapIsEmpty!7677 mapRes!7677))

(declare-fun condMapEmpty!7677 () Bool)

(declare-fun mapDefault!7677 () ValueCell!1878)

(assert (=> mapNonEmpty!7676 (= condMapEmpty!7677 (= mapRest!7676 ((as const (Array (_ BitVec 32) ValueCell!1878)) mapDefault!7677)))))

(declare-fun e!125812 () Bool)

(assert (=> mapNonEmpty!7676 (= tp!16865 (and e!125812 mapRes!7677))))

(declare-fun b!191214 () Bool)

(assert (=> b!191214 (= e!125812 tp_is_empty!4443)))

(declare-fun mapNonEmpty!7677 () Bool)

(declare-fun tp!16866 () Bool)

(declare-fun e!125813 () Bool)

(assert (=> mapNonEmpty!7677 (= mapRes!7677 (and tp!16866 e!125813))))

(declare-fun mapValue!7677 () ValueCell!1878)

(declare-fun mapRest!7677 () (Array (_ BitVec 32) ValueCell!1878))

(declare-fun mapKey!7677 () (_ BitVec 32))

(assert (=> mapNonEmpty!7677 (= mapRest!7676 (store mapRest!7677 mapKey!7677 mapValue!7677))))

(declare-fun b!191213 () Bool)

(assert (=> b!191213 (= e!125813 tp_is_empty!4443)))

(assert (= (and mapNonEmpty!7676 condMapEmpty!7677) mapIsEmpty!7677))

(assert (= (and mapNonEmpty!7676 (not condMapEmpty!7677)) mapNonEmpty!7677))

(assert (= (and mapNonEmpty!7677 ((_ is ValueCellFull!1878) mapValue!7677)) b!191213))

(assert (= (and mapNonEmpty!7676 ((_ is ValueCellFull!1878) mapDefault!7677)) b!191214))

(declare-fun m!217815 () Bool)

(assert (=> mapNonEmpty!7677 m!217815))

(declare-fun b_lambda!7383 () Bool)

(assert (= b_lambda!7381 (or (and b!190684 b_free!4671) b_lambda!7383)))

(declare-fun b_lambda!7385 () Bool)

(assert (= b_lambda!7379 (or (and b!190684 b_free!4671) b_lambda!7385)))

(declare-fun b_lambda!7387 () Bool)

(assert (= b_lambda!7377 (or (and b!190684 b_free!4671) b_lambda!7387)))

(declare-fun b_lambda!7389 () Bool)

(assert (= b_lambda!7375 (or (and b!190684 b_free!4671) b_lambda!7389)))

(check-sat (not b!191029) (not b!191002) (not b!190918) (not b!191166) (not b!191127) (not b!191064) (not b_lambda!7371) (not d!56117) (not b!191006) (not b!190923) (not d!56051) (not d!56055) (not b!191131) (not d!56003) (not b!191193) (not d!55987) (not b!191144) (not b_lambda!7373) (not b!191070) (not b!191072) (not b!191013) (not d!56047) (not d!56041) (not b!191051) (not b!191107) (not d!56049) (not b!191069) (not d!55975) (not b!191030) (not b!190937) (not d!56073) (not d!56087) (not d!56079) (not b!191031) (not b!191158) (not d!56113) (not b!191019) (not b!191129) (not b!191008) (not d!56063) (not d!56005) (not d!55995) (not d!56013) (not b!191048) (not b!191204) (not b!191046) (not d!56045) (not b!190919) (not b!191179) (not bm!19266) (not d!56053) (not d!55991) (not d!56029) b_and!11343 (not b!191155) (not d!56121) (not bm!19283) (not b!191009) (not b!191167) (not d!56027) (not d!56031) (not b!191023) (not d!56089) (not b!191075) (not b_next!4671) (not b!191003) (not b!191027) (not mapNonEmpty!7677) (not d!56099) (not b!191007) (not b!190925) (not b!191211) tp_is_empty!4443 (not b!191020) (not d!56071) (not b!191001) (not d!56077) (not b!190935) (not bm!19267) (not d!56033) (not bm!19291) (not b!191032) (not d!56091) (not b!190931) (not d!56035) (not b!191073) (not b!190922) (not d!55999) (not d!56085) (not b!190915) (not b!190924) (not d!56021) (not b!191067) (not b_lambda!7389) (not b_lambda!7383) (not b!191017) (not b!191150) (not bm!19273) (not b!191084) (not d!56107) (not b!191062) (not d!56103) (not d!56001) (not b!191170) (not b!191005) (not d!56011) (not d!55977) (not bm!19288) (not b!191028) (not b!191180) (not d!56037) (not b!191085) (not b!191078) (not b_lambda!7385) (not b!191205) (not b!191066) (not bm!19276) (not b!191164) (not d!56019) (not d!55997) (not b!191112) (not b!190936) (not b!191025) (not b!191109) (not b!191012) (not b!191014) (not bm!19272) (not b!190933) (not b!190927) (not d!56009) (not d!56065) (not d!55989) (not d!56093) (not d!56095) (not b!191018) (not b!190934) (not b!191121) (not d!56023) (not b!191130) (not d!56015) (not d!56043) (not b!190921) (not b!191044) (not b!191152) (not b!191049) (not d!56025) (not d!56039) (not b!190995) (not b!191128) (not d!55979) (not b!191165) (not b!191015) (not b!191022) (not d!55993) (not b!190964) (not d!56115) (not b!191033) (not b!191153) (not d!56123) (not d!56069) (not b_lambda!7387) (not d!56119) (not b!190930) (not d!56017) (not d!56007) (not d!55983))
(check-sat b_and!11343 (not b_next!4671))
