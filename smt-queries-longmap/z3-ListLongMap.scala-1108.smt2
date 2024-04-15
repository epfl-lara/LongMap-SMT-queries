; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22878 () Bool)

(assert start!22878)

(declare-fun b!238143 () Bool)

(declare-fun b_free!6397 () Bool)

(declare-fun b_next!6397 () Bool)

(assert (=> b!238143 (= b_free!6397 (not b_next!6397))))

(declare-fun tp!22392 () Bool)

(declare-fun b_and!13335 () Bool)

(assert (=> b!238143 (= tp!22392 b_and!13335)))

(declare-fun mapIsEmpty!10617 () Bool)

(declare-fun mapRes!10617 () Bool)

(assert (=> mapIsEmpty!10617 mapRes!10617))

(declare-fun res!116674 () Bool)

(declare-fun e!154619 () Bool)

(assert (=> start!22878 (=> (not res!116674) (not e!154619))))

(declare-datatypes ((V!7993 0))(
  ( (V!7994 (val!3174 Int)) )
))
(declare-datatypes ((ValueCell!2786 0))(
  ( (ValueCellFull!2786 (v!5205 V!7993)) (EmptyCell!2786) )
))
(declare-datatypes ((array!11787 0))(
  ( (array!11788 (arr!5595 (Array (_ BitVec 32) ValueCell!2786)) (size!5937 (_ BitVec 32))) )
))
(declare-datatypes ((array!11789 0))(
  ( (array!11790 (arr!5596 (Array (_ BitVec 32) (_ BitVec 64))) (size!5938 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3472 0))(
  ( (LongMapFixedSize!3473 (defaultEntry!4420 Int) (mask!10450 (_ BitVec 32)) (extraKeys!4157 (_ BitVec 32)) (zeroValue!4261 V!7993) (minValue!4261 V!7993) (_size!1785 (_ BitVec 32)) (_keys!6519 array!11789) (_values!4403 array!11787) (_vacant!1785 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3472)

(declare-fun valid!1376 (LongMapFixedSize!3472) Bool)

(assert (=> start!22878 (= res!116674 (valid!1376 thiss!1504))))

(assert (=> start!22878 e!154619))

(declare-fun e!154620 () Bool)

(assert (=> start!22878 e!154620))

(assert (=> start!22878 true))

(declare-fun e!154623 () Bool)

(declare-fun tp_is_empty!6259 () Bool)

(declare-fun array_inv!3695 (array!11789) Bool)

(declare-fun array_inv!3696 (array!11787) Bool)

(assert (=> b!238143 (= e!154620 (and tp!22392 tp_is_empty!6259 (array_inv!3695 (_keys!6519 thiss!1504)) (array_inv!3696 (_values!4403 thiss!1504)) e!154623))))

(declare-fun b!238144 () Bool)

(declare-fun res!116675 () Bool)

(declare-fun e!154624 () Bool)

(assert (=> b!238144 (=> (not res!116675) (not e!154624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11789 (_ BitVec 32)) Bool)

(assert (=> b!238144 (= res!116675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6519 thiss!1504) (mask!10450 thiss!1504)))))

(declare-fun mapNonEmpty!10617 () Bool)

(declare-fun tp!22391 () Bool)

(declare-fun e!154622 () Bool)

(assert (=> mapNonEmpty!10617 (= mapRes!10617 (and tp!22391 e!154622))))

(declare-fun mapRest!10617 () (Array (_ BitVec 32) ValueCell!2786))

(declare-fun mapValue!10617 () ValueCell!2786)

(declare-fun mapKey!10617 () (_ BitVec 32))

(assert (=> mapNonEmpty!10617 (= (arr!5595 (_values!4403 thiss!1504)) (store mapRest!10617 mapKey!10617 mapValue!10617))))

(declare-fun b!238145 () Bool)

(declare-fun e!154618 () Bool)

(assert (=> b!238145 (= e!154623 (and e!154618 mapRes!10617))))

(declare-fun condMapEmpty!10617 () Bool)

(declare-fun mapDefault!10617 () ValueCell!2786)

(assert (=> b!238145 (= condMapEmpty!10617 (= (arr!5595 (_values!4403 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2786)) mapDefault!10617)))))

(declare-fun b!238146 () Bool)

(declare-fun res!116669 () Bool)

(assert (=> b!238146 (=> (not res!116669) (not e!154624))))

(declare-datatypes ((List!3569 0))(
  ( (Nil!3566) (Cons!3565 (h!4221 (_ BitVec 64)) (t!8553 List!3569)) )
))
(declare-fun arrayNoDuplicates!0 (array!11789 (_ BitVec 32) List!3569) Bool)

(assert (=> b!238146 (= res!116669 (arrayNoDuplicates!0 (_keys!6519 thiss!1504) #b00000000000000000000000000000000 Nil!3566))))

(declare-fun b!238147 () Bool)

(assert (=> b!238147 (= e!154619 e!154624)))

(declare-fun res!116673 () Bool)

(assert (=> b!238147 (=> (not res!116673) (not e!154624))))

(declare-datatypes ((SeekEntryResult!1013 0))(
  ( (MissingZero!1013 (index!6222 (_ BitVec 32))) (Found!1013 (index!6223 (_ BitVec 32))) (Intermediate!1013 (undefined!1825 Bool) (index!6224 (_ BitVec 32)) (x!24026 (_ BitVec 32))) (Undefined!1013) (MissingVacant!1013 (index!6225 (_ BitVec 32))) )
))
(declare-fun lt!120320 () SeekEntryResult!1013)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238147 (= res!116673 (or (= lt!120320 (MissingZero!1013 index!297)) (= lt!120320 (MissingVacant!1013 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11789 (_ BitVec 32)) SeekEntryResult!1013)

(assert (=> b!238147 (= lt!120320 (seekEntryOrOpen!0 key!932 (_keys!6519 thiss!1504) (mask!10450 thiss!1504)))))

(declare-fun b!238148 () Bool)

(declare-fun res!116672 () Bool)

(assert (=> b!238148 (=> (not res!116672) (not e!154624))))

(assert (=> b!238148 (= res!116672 (and (= (size!5937 (_values!4403 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10450 thiss!1504))) (= (size!5938 (_keys!6519 thiss!1504)) (size!5937 (_values!4403 thiss!1504))) (bvsge (mask!10450 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4157 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4157 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!238149 () Bool)

(assert (=> b!238149 (= e!154622 tp_is_empty!6259)))

(declare-fun b!238150 () Bool)

(declare-fun res!116671 () Bool)

(assert (=> b!238150 (=> (not res!116671) (not e!154624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238150 (= res!116671 (validMask!0 (mask!10450 thiss!1504)))))

(declare-fun b!238151 () Bool)

(declare-fun res!116676 () Bool)

(assert (=> b!238151 (=> (not res!116676) (not e!154619))))

(assert (=> b!238151 (= res!116676 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!238152 () Bool)

(declare-fun res!116670 () Bool)

(assert (=> b!238152 (=> (not res!116670) (not e!154624))))

(declare-datatypes ((tuple2!4658 0))(
  ( (tuple2!4659 (_1!2340 (_ BitVec 64)) (_2!2340 V!7993)) )
))
(declare-datatypes ((List!3570 0))(
  ( (Nil!3567) (Cons!3566 (h!4222 tuple2!4658) (t!8554 List!3570)) )
))
(declare-datatypes ((ListLongMap!3561 0))(
  ( (ListLongMap!3562 (toList!1796 List!3570)) )
))
(declare-fun contains!1686 (ListLongMap!3561 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1305 (array!11789 array!11787 (_ BitVec 32) (_ BitVec 32) V!7993 V!7993 (_ BitVec 32) Int) ListLongMap!3561)

(assert (=> b!238152 (= res!116670 (not (contains!1686 (getCurrentListMap!1305 (_keys!6519 thiss!1504) (_values!4403 thiss!1504) (mask!10450 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)) key!932)))))

(declare-fun b!238153 () Bool)

(assert (=> b!238153 (= e!154618 tp_is_empty!6259)))

(declare-fun b!238154 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!238154 (= e!154624 (not (validKeyInArray!0 key!932)))))

(assert (= (and start!22878 res!116674) b!238151))

(assert (= (and b!238151 res!116676) b!238147))

(assert (= (and b!238147 res!116673) b!238152))

(assert (= (and b!238152 res!116670) b!238150))

(assert (= (and b!238150 res!116671) b!238148))

(assert (= (and b!238148 res!116672) b!238144))

(assert (= (and b!238144 res!116675) b!238146))

(assert (= (and b!238146 res!116669) b!238154))

(assert (= (and b!238145 condMapEmpty!10617) mapIsEmpty!10617))

(assert (= (and b!238145 (not condMapEmpty!10617)) mapNonEmpty!10617))

(get-info :version)

(assert (= (and mapNonEmpty!10617 ((_ is ValueCellFull!2786) mapValue!10617)) b!238149))

(assert (= (and b!238145 ((_ is ValueCellFull!2786) mapDefault!10617)) b!238153))

(assert (= b!238143 b!238145))

(assert (= start!22878 b!238143))

(declare-fun m!258269 () Bool)

(assert (=> b!238154 m!258269))

(declare-fun m!258271 () Bool)

(assert (=> start!22878 m!258271))

(declare-fun m!258273 () Bool)

(assert (=> b!238146 m!258273))

(declare-fun m!258275 () Bool)

(assert (=> b!238152 m!258275))

(assert (=> b!238152 m!258275))

(declare-fun m!258277 () Bool)

(assert (=> b!238152 m!258277))

(declare-fun m!258279 () Bool)

(assert (=> mapNonEmpty!10617 m!258279))

(declare-fun m!258281 () Bool)

(assert (=> b!238143 m!258281))

(declare-fun m!258283 () Bool)

(assert (=> b!238143 m!258283))

(declare-fun m!258285 () Bool)

(assert (=> b!238150 m!258285))

(declare-fun m!258287 () Bool)

(assert (=> b!238147 m!258287))

(declare-fun m!258289 () Bool)

(assert (=> b!238144 m!258289))

(check-sat (not start!22878) (not b!238150) (not b!238146) (not b!238154) b_and!13335 (not b!238143) (not b!238144) (not b_next!6397) tp_is_empty!6259 (not b!238147) (not mapNonEmpty!10617) (not b!238152))
(check-sat b_and!13335 (not b_next!6397))
(get-model)

(declare-fun d!59601 () Bool)

(assert (=> d!59601 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!238154 d!59601))

(declare-fun d!59603 () Bool)

(assert (=> d!59603 (= (array_inv!3695 (_keys!6519 thiss!1504)) (bvsge (size!5938 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238143 d!59603))

(declare-fun d!59605 () Bool)

(assert (=> d!59605 (= (array_inv!3696 (_values!4403 thiss!1504)) (bvsge (size!5937 (_values!4403 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238143 d!59605))

(declare-fun d!59607 () Bool)

(declare-fun res!116730 () Bool)

(declare-fun e!154673 () Bool)

(assert (=> d!59607 (=> res!116730 e!154673)))

(assert (=> d!59607 (= res!116730 (bvsge #b00000000000000000000000000000000 (size!5938 (_keys!6519 thiss!1504))))))

(assert (=> d!59607 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6519 thiss!1504) (mask!10450 thiss!1504)) e!154673)))

(declare-fun b!238235 () Bool)

(declare-fun e!154675 () Bool)

(declare-fun call!22134 () Bool)

(assert (=> b!238235 (= e!154675 call!22134)))

(declare-fun b!238236 () Bool)

(declare-fun e!154674 () Bool)

(assert (=> b!238236 (= e!154675 e!154674)))

(declare-fun lt!120333 () (_ BitVec 64))

(assert (=> b!238236 (= lt!120333 (select (arr!5596 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!7308 0))(
  ( (Unit!7309) )
))
(declare-fun lt!120335 () Unit!7308)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11789 (_ BitVec 64) (_ BitVec 32)) Unit!7308)

(assert (=> b!238236 (= lt!120335 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6519 thiss!1504) lt!120333 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!238236 (arrayContainsKey!0 (_keys!6519 thiss!1504) lt!120333 #b00000000000000000000000000000000)))

(declare-fun lt!120334 () Unit!7308)

(assert (=> b!238236 (= lt!120334 lt!120335)))

(declare-fun res!116729 () Bool)

(assert (=> b!238236 (= res!116729 (= (seekEntryOrOpen!0 (select (arr!5596 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000) (_keys!6519 thiss!1504) (mask!10450 thiss!1504)) (Found!1013 #b00000000000000000000000000000000)))))

(assert (=> b!238236 (=> (not res!116729) (not e!154674))))

(declare-fun bm!22131 () Bool)

(assert (=> bm!22131 (= call!22134 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6519 thiss!1504) (mask!10450 thiss!1504)))))

(declare-fun b!238237 () Bool)

(assert (=> b!238237 (= e!154674 call!22134)))

(declare-fun b!238238 () Bool)

(assert (=> b!238238 (= e!154673 e!154675)))

(declare-fun c!39726 () Bool)

(assert (=> b!238238 (= c!39726 (validKeyInArray!0 (select (arr!5596 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59607 (not res!116730)) b!238238))

(assert (= (and b!238238 c!39726) b!238236))

(assert (= (and b!238238 (not c!39726)) b!238235))

(assert (= (and b!238236 res!116729) b!238237))

(assert (= (or b!238237 b!238235) bm!22131))

(declare-fun m!258335 () Bool)

(assert (=> b!238236 m!258335))

(declare-fun m!258337 () Bool)

(assert (=> b!238236 m!258337))

(declare-fun m!258339 () Bool)

(assert (=> b!238236 m!258339))

(assert (=> b!238236 m!258335))

(declare-fun m!258341 () Bool)

(assert (=> b!238236 m!258341))

(declare-fun m!258343 () Bool)

(assert (=> bm!22131 m!258343))

(assert (=> b!238238 m!258335))

(assert (=> b!238238 m!258335))

(declare-fun m!258345 () Bool)

(assert (=> b!238238 m!258345))

(assert (=> b!238144 d!59607))

(declare-fun d!59609 () Bool)

(declare-fun res!116737 () Bool)

(declare-fun e!154686 () Bool)

(assert (=> d!59609 (=> res!116737 e!154686)))

(assert (=> d!59609 (= res!116737 (bvsge #b00000000000000000000000000000000 (size!5938 (_keys!6519 thiss!1504))))))

(assert (=> d!59609 (= (arrayNoDuplicates!0 (_keys!6519 thiss!1504) #b00000000000000000000000000000000 Nil!3566) e!154686)))

(declare-fun b!238249 () Bool)

(declare-fun e!154684 () Bool)

(declare-fun call!22137 () Bool)

(assert (=> b!238249 (= e!154684 call!22137)))

(declare-fun b!238250 () Bool)

(declare-fun e!154687 () Bool)

(assert (=> b!238250 (= e!154686 e!154687)))

(declare-fun res!116738 () Bool)

(assert (=> b!238250 (=> (not res!116738) (not e!154687))))

(declare-fun e!154685 () Bool)

(assert (=> b!238250 (= res!116738 (not e!154685))))

(declare-fun res!116739 () Bool)

(assert (=> b!238250 (=> (not res!116739) (not e!154685))))

(assert (=> b!238250 (= res!116739 (validKeyInArray!0 (select (arr!5596 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238251 () Bool)

(assert (=> b!238251 (= e!154687 e!154684)))

(declare-fun c!39729 () Bool)

(assert (=> b!238251 (= c!39729 (validKeyInArray!0 (select (arr!5596 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238252 () Bool)

(declare-fun contains!1688 (List!3569 (_ BitVec 64)) Bool)

(assert (=> b!238252 (= e!154685 (contains!1688 Nil!3566 (select (arr!5596 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238253 () Bool)

(assert (=> b!238253 (= e!154684 call!22137)))

(declare-fun bm!22134 () Bool)

(assert (=> bm!22134 (= call!22137 (arrayNoDuplicates!0 (_keys!6519 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39729 (Cons!3565 (select (arr!5596 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000) Nil!3566) Nil!3566)))))

(assert (= (and d!59609 (not res!116737)) b!238250))

(assert (= (and b!238250 res!116739) b!238252))

(assert (= (and b!238250 res!116738) b!238251))

(assert (= (and b!238251 c!39729) b!238253))

(assert (= (and b!238251 (not c!39729)) b!238249))

(assert (= (or b!238253 b!238249) bm!22134))

(assert (=> b!238250 m!258335))

(assert (=> b!238250 m!258335))

(assert (=> b!238250 m!258345))

(assert (=> b!238251 m!258335))

(assert (=> b!238251 m!258335))

(assert (=> b!238251 m!258345))

(assert (=> b!238252 m!258335))

(assert (=> b!238252 m!258335))

(declare-fun m!258347 () Bool)

(assert (=> b!238252 m!258347))

(assert (=> bm!22134 m!258335))

(declare-fun m!258349 () Bool)

(assert (=> bm!22134 m!258349))

(assert (=> b!238146 d!59609))

(declare-fun b!238266 () Bool)

(declare-fun e!154696 () SeekEntryResult!1013)

(assert (=> b!238266 (= e!154696 Undefined!1013)))

(declare-fun b!238267 () Bool)

(declare-fun e!154695 () SeekEntryResult!1013)

(declare-fun lt!120343 () SeekEntryResult!1013)

(assert (=> b!238267 (= e!154695 (MissingZero!1013 (index!6224 lt!120343)))))

(declare-fun b!238268 () Bool)

(declare-fun e!154694 () SeekEntryResult!1013)

(assert (=> b!238268 (= e!154696 e!154694)))

(declare-fun lt!120342 () (_ BitVec 64))

(assert (=> b!238268 (= lt!120342 (select (arr!5596 (_keys!6519 thiss!1504)) (index!6224 lt!120343)))))

(declare-fun c!39737 () Bool)

(assert (=> b!238268 (= c!39737 (= lt!120342 key!932))))

(declare-fun b!238269 () Bool)

(declare-fun c!39738 () Bool)

(assert (=> b!238269 (= c!39738 (= lt!120342 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!238269 (= e!154694 e!154695)))

(declare-fun b!238270 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11789 (_ BitVec 32)) SeekEntryResult!1013)

(assert (=> b!238270 (= e!154695 (seekKeyOrZeroReturnVacant!0 (x!24026 lt!120343) (index!6224 lt!120343) (index!6224 lt!120343) key!932 (_keys!6519 thiss!1504) (mask!10450 thiss!1504)))))

(declare-fun d!59611 () Bool)

(declare-fun lt!120344 () SeekEntryResult!1013)

(assert (=> d!59611 (and (or ((_ is Undefined!1013) lt!120344) (not ((_ is Found!1013) lt!120344)) (and (bvsge (index!6223 lt!120344) #b00000000000000000000000000000000) (bvslt (index!6223 lt!120344) (size!5938 (_keys!6519 thiss!1504))))) (or ((_ is Undefined!1013) lt!120344) ((_ is Found!1013) lt!120344) (not ((_ is MissingZero!1013) lt!120344)) (and (bvsge (index!6222 lt!120344) #b00000000000000000000000000000000) (bvslt (index!6222 lt!120344) (size!5938 (_keys!6519 thiss!1504))))) (or ((_ is Undefined!1013) lt!120344) ((_ is Found!1013) lt!120344) ((_ is MissingZero!1013) lt!120344) (not ((_ is MissingVacant!1013) lt!120344)) (and (bvsge (index!6225 lt!120344) #b00000000000000000000000000000000) (bvslt (index!6225 lt!120344) (size!5938 (_keys!6519 thiss!1504))))) (or ((_ is Undefined!1013) lt!120344) (ite ((_ is Found!1013) lt!120344) (= (select (arr!5596 (_keys!6519 thiss!1504)) (index!6223 lt!120344)) key!932) (ite ((_ is MissingZero!1013) lt!120344) (= (select (arr!5596 (_keys!6519 thiss!1504)) (index!6222 lt!120344)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1013) lt!120344) (= (select (arr!5596 (_keys!6519 thiss!1504)) (index!6225 lt!120344)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59611 (= lt!120344 e!154696)))

(declare-fun c!39736 () Bool)

(assert (=> d!59611 (= c!39736 (and ((_ is Intermediate!1013) lt!120343) (undefined!1825 lt!120343)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11789 (_ BitVec 32)) SeekEntryResult!1013)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59611 (= lt!120343 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10450 thiss!1504)) key!932 (_keys!6519 thiss!1504) (mask!10450 thiss!1504)))))

(assert (=> d!59611 (validMask!0 (mask!10450 thiss!1504))))

(assert (=> d!59611 (= (seekEntryOrOpen!0 key!932 (_keys!6519 thiss!1504) (mask!10450 thiss!1504)) lt!120344)))

(declare-fun b!238271 () Bool)

(assert (=> b!238271 (= e!154694 (Found!1013 (index!6224 lt!120343)))))

(assert (= (and d!59611 c!39736) b!238266))

(assert (= (and d!59611 (not c!39736)) b!238268))

(assert (= (and b!238268 c!39737) b!238271))

(assert (= (and b!238268 (not c!39737)) b!238269))

(assert (= (and b!238269 c!39738) b!238267))

(assert (= (and b!238269 (not c!39738)) b!238270))

(declare-fun m!258351 () Bool)

(assert (=> b!238268 m!258351))

(declare-fun m!258353 () Bool)

(assert (=> b!238270 m!258353))

(declare-fun m!258355 () Bool)

(assert (=> d!59611 m!258355))

(declare-fun m!258357 () Bool)

(assert (=> d!59611 m!258357))

(assert (=> d!59611 m!258285))

(declare-fun m!258359 () Bool)

(assert (=> d!59611 m!258359))

(declare-fun m!258361 () Bool)

(assert (=> d!59611 m!258361))

(assert (=> d!59611 m!258357))

(declare-fun m!258363 () Bool)

(assert (=> d!59611 m!258363))

(assert (=> b!238147 d!59611))

(declare-fun d!59613 () Bool)

(declare-fun e!154702 () Bool)

(assert (=> d!59613 e!154702))

(declare-fun res!116742 () Bool)

(assert (=> d!59613 (=> res!116742 e!154702)))

(declare-fun lt!120356 () Bool)

(assert (=> d!59613 (= res!116742 (not lt!120356))))

(declare-fun lt!120354 () Bool)

(assert (=> d!59613 (= lt!120356 lt!120354)))

(declare-fun lt!120353 () Unit!7308)

(declare-fun e!154701 () Unit!7308)

(assert (=> d!59613 (= lt!120353 e!154701)))

(declare-fun c!39741 () Bool)

(assert (=> d!59613 (= c!39741 lt!120354)))

(declare-fun containsKey!268 (List!3570 (_ BitVec 64)) Bool)

(assert (=> d!59613 (= lt!120354 (containsKey!268 (toList!1796 (getCurrentListMap!1305 (_keys!6519 thiss!1504) (_values!4403 thiss!1504) (mask!10450 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504))) key!932))))

(assert (=> d!59613 (= (contains!1686 (getCurrentListMap!1305 (_keys!6519 thiss!1504) (_values!4403 thiss!1504) (mask!10450 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)) key!932) lt!120356)))

(declare-fun b!238278 () Bool)

(declare-fun lt!120355 () Unit!7308)

(assert (=> b!238278 (= e!154701 lt!120355)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!217 (List!3570 (_ BitVec 64)) Unit!7308)

(assert (=> b!238278 (= lt!120355 (lemmaContainsKeyImpliesGetValueByKeyDefined!217 (toList!1796 (getCurrentListMap!1305 (_keys!6519 thiss!1504) (_values!4403 thiss!1504) (mask!10450 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504))) key!932))))

(declare-datatypes ((Option!282 0))(
  ( (Some!281 (v!5208 V!7993)) (None!280) )
))
(declare-fun isDefined!218 (Option!282) Bool)

(declare-fun getValueByKey!276 (List!3570 (_ BitVec 64)) Option!282)

(assert (=> b!238278 (isDefined!218 (getValueByKey!276 (toList!1796 (getCurrentListMap!1305 (_keys!6519 thiss!1504) (_values!4403 thiss!1504) (mask!10450 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504))) key!932))))

(declare-fun b!238279 () Bool)

(declare-fun Unit!7310 () Unit!7308)

(assert (=> b!238279 (= e!154701 Unit!7310)))

(declare-fun b!238280 () Bool)

(assert (=> b!238280 (= e!154702 (isDefined!218 (getValueByKey!276 (toList!1796 (getCurrentListMap!1305 (_keys!6519 thiss!1504) (_values!4403 thiss!1504) (mask!10450 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504))) key!932)))))

(assert (= (and d!59613 c!39741) b!238278))

(assert (= (and d!59613 (not c!39741)) b!238279))

(assert (= (and d!59613 (not res!116742)) b!238280))

(declare-fun m!258365 () Bool)

(assert (=> d!59613 m!258365))

(declare-fun m!258367 () Bool)

(assert (=> b!238278 m!258367))

(declare-fun m!258369 () Bool)

(assert (=> b!238278 m!258369))

(assert (=> b!238278 m!258369))

(declare-fun m!258371 () Bool)

(assert (=> b!238278 m!258371))

(assert (=> b!238280 m!258369))

(assert (=> b!238280 m!258369))

(assert (=> b!238280 m!258371))

(assert (=> b!238152 d!59613))

(declare-fun b!238323 () Bool)

(declare-fun e!154735 () Bool)

(declare-fun call!22158 () Bool)

(assert (=> b!238323 (= e!154735 (not call!22158))))

(declare-fun b!238324 () Bool)

(declare-fun e!154734 () Bool)

(assert (=> b!238324 (= e!154734 e!154735)))

(declare-fun c!39756 () Bool)

(assert (=> b!238324 (= c!39756 (not (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!238325 () Bool)

(declare-fun e!154738 () Bool)

(declare-fun e!154739 () Bool)

(assert (=> b!238325 (= e!154738 e!154739)))

(declare-fun res!116765 () Bool)

(declare-fun call!22156 () Bool)

(assert (=> b!238325 (= res!116765 call!22156)))

(assert (=> b!238325 (=> (not res!116765) (not e!154739))))

(declare-fun b!238326 () Bool)

(declare-fun e!154740 () Unit!7308)

(declare-fun lt!120414 () Unit!7308)

(assert (=> b!238326 (= e!154740 lt!120414)))

(declare-fun lt!120402 () ListLongMap!3561)

(declare-fun getCurrentListMapNoExtraKeys!536 (array!11789 array!11787 (_ BitVec 32) (_ BitVec 32) V!7993 V!7993 (_ BitVec 32) Int) ListLongMap!3561)

(assert (=> b!238326 (= lt!120402 (getCurrentListMapNoExtraKeys!536 (_keys!6519 thiss!1504) (_values!4403 thiss!1504) (mask!10450 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)))))

(declare-fun lt!120416 () (_ BitVec 64))

(assert (=> b!238326 (= lt!120416 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120407 () (_ BitVec 64))

(assert (=> b!238326 (= lt!120407 (select (arr!5596 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120401 () Unit!7308)

(declare-fun addStillContains!196 (ListLongMap!3561 (_ BitVec 64) V!7993 (_ BitVec 64)) Unit!7308)

(assert (=> b!238326 (= lt!120401 (addStillContains!196 lt!120402 lt!120416 (zeroValue!4261 thiss!1504) lt!120407))))

(declare-fun +!653 (ListLongMap!3561 tuple2!4658) ListLongMap!3561)

(assert (=> b!238326 (contains!1686 (+!653 lt!120402 (tuple2!4659 lt!120416 (zeroValue!4261 thiss!1504))) lt!120407)))

(declare-fun lt!120413 () Unit!7308)

(assert (=> b!238326 (= lt!120413 lt!120401)))

(declare-fun lt!120409 () ListLongMap!3561)

(assert (=> b!238326 (= lt!120409 (getCurrentListMapNoExtraKeys!536 (_keys!6519 thiss!1504) (_values!4403 thiss!1504) (mask!10450 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)))))

(declare-fun lt!120410 () (_ BitVec 64))

(assert (=> b!238326 (= lt!120410 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120403 () (_ BitVec 64))

(assert (=> b!238326 (= lt!120403 (select (arr!5596 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120405 () Unit!7308)

(declare-fun addApplyDifferent!196 (ListLongMap!3561 (_ BitVec 64) V!7993 (_ BitVec 64)) Unit!7308)

(assert (=> b!238326 (= lt!120405 (addApplyDifferent!196 lt!120409 lt!120410 (minValue!4261 thiss!1504) lt!120403))))

(declare-fun apply!220 (ListLongMap!3561 (_ BitVec 64)) V!7993)

(assert (=> b!238326 (= (apply!220 (+!653 lt!120409 (tuple2!4659 lt!120410 (minValue!4261 thiss!1504))) lt!120403) (apply!220 lt!120409 lt!120403))))

(declare-fun lt!120412 () Unit!7308)

(assert (=> b!238326 (= lt!120412 lt!120405)))

(declare-fun lt!120421 () ListLongMap!3561)

(assert (=> b!238326 (= lt!120421 (getCurrentListMapNoExtraKeys!536 (_keys!6519 thiss!1504) (_values!4403 thiss!1504) (mask!10450 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)))))

(declare-fun lt!120422 () (_ BitVec 64))

(assert (=> b!238326 (= lt!120422 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120408 () (_ BitVec 64))

(assert (=> b!238326 (= lt!120408 (select (arr!5596 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120411 () Unit!7308)

(assert (=> b!238326 (= lt!120411 (addApplyDifferent!196 lt!120421 lt!120422 (zeroValue!4261 thiss!1504) lt!120408))))

(assert (=> b!238326 (= (apply!220 (+!653 lt!120421 (tuple2!4659 lt!120422 (zeroValue!4261 thiss!1504))) lt!120408) (apply!220 lt!120421 lt!120408))))

(declare-fun lt!120419 () Unit!7308)

(assert (=> b!238326 (= lt!120419 lt!120411)))

(declare-fun lt!120420 () ListLongMap!3561)

(assert (=> b!238326 (= lt!120420 (getCurrentListMapNoExtraKeys!536 (_keys!6519 thiss!1504) (_values!4403 thiss!1504) (mask!10450 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)))))

(declare-fun lt!120406 () (_ BitVec 64))

(assert (=> b!238326 (= lt!120406 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120418 () (_ BitVec 64))

(assert (=> b!238326 (= lt!120418 (select (arr!5596 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238326 (= lt!120414 (addApplyDifferent!196 lt!120420 lt!120406 (minValue!4261 thiss!1504) lt!120418))))

(assert (=> b!238326 (= (apply!220 (+!653 lt!120420 (tuple2!4659 lt!120406 (minValue!4261 thiss!1504))) lt!120418) (apply!220 lt!120420 lt!120418))))

(declare-fun d!59615 () Bool)

(assert (=> d!59615 e!154734))

(declare-fun res!116769 () Bool)

(assert (=> d!59615 (=> (not res!116769) (not e!154734))))

(assert (=> d!59615 (= res!116769 (or (bvsge #b00000000000000000000000000000000 (size!5938 (_keys!6519 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5938 (_keys!6519 thiss!1504))))))))

(declare-fun lt!120415 () ListLongMap!3561)

(declare-fun lt!120417 () ListLongMap!3561)

(assert (=> d!59615 (= lt!120415 lt!120417)))

(declare-fun lt!120404 () Unit!7308)

(assert (=> d!59615 (= lt!120404 e!154740)))

(declare-fun c!39754 () Bool)

(declare-fun e!154737 () Bool)

(assert (=> d!59615 (= c!39754 e!154737)))

(declare-fun res!116764 () Bool)

(assert (=> d!59615 (=> (not res!116764) (not e!154737))))

(assert (=> d!59615 (= res!116764 (bvslt #b00000000000000000000000000000000 (size!5938 (_keys!6519 thiss!1504))))))

(declare-fun e!154736 () ListLongMap!3561)

(assert (=> d!59615 (= lt!120417 e!154736)))

(declare-fun c!39758 () Bool)

(assert (=> d!59615 (= c!39758 (and (not (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59615 (validMask!0 (mask!10450 thiss!1504))))

(assert (=> d!59615 (= (getCurrentListMap!1305 (_keys!6519 thiss!1504) (_values!4403 thiss!1504) (mask!10450 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)) lt!120415)))

(declare-fun b!238327 () Bool)

(declare-fun e!154741 () Bool)

(assert (=> b!238327 (= e!154741 (= (apply!220 lt!120415 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4261 thiss!1504)))))

(declare-fun b!238328 () Bool)

(declare-fun e!154729 () ListLongMap!3561)

(declare-fun call!22153 () ListLongMap!3561)

(assert (=> b!238328 (= e!154729 call!22153)))

(declare-fun bm!22149 () Bool)

(assert (=> bm!22149 (= call!22156 (contains!1686 lt!120415 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238329 () Bool)

(declare-fun call!22152 () ListLongMap!3561)

(assert (=> b!238329 (= e!154736 (+!653 call!22152 (tuple2!4659 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4261 thiss!1504))))))

(declare-fun b!238330 () Bool)

(declare-fun e!154731 () Bool)

(declare-fun e!154730 () Bool)

(assert (=> b!238330 (= e!154731 e!154730)))

(declare-fun res!116766 () Bool)

(assert (=> b!238330 (=> (not res!116766) (not e!154730))))

(assert (=> b!238330 (= res!116766 (contains!1686 lt!120415 (select (arr!5596 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!238330 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5938 (_keys!6519 thiss!1504))))))

(declare-fun bm!22150 () Bool)

(declare-fun call!22154 () ListLongMap!3561)

(assert (=> bm!22150 (= call!22153 call!22154)))

(declare-fun bm!22151 () Bool)

(declare-fun call!22155 () ListLongMap!3561)

(assert (=> bm!22151 (= call!22155 call!22152)))

(declare-fun b!238331 () Bool)

(declare-fun Unit!7311 () Unit!7308)

(assert (=> b!238331 (= e!154740 Unit!7311)))

(declare-fun b!238332 () Bool)

(declare-fun get!2883 (ValueCell!2786 V!7993) V!7993)

(declare-fun dynLambda!554 (Int (_ BitVec 64)) V!7993)

(assert (=> b!238332 (= e!154730 (= (apply!220 lt!120415 (select (arr!5596 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000)) (get!2883 (select (arr!5595 (_values!4403 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!554 (defaultEntry!4420 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!238332 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5937 (_values!4403 thiss!1504))))))

(assert (=> b!238332 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5938 (_keys!6519 thiss!1504))))))

(declare-fun b!238333 () Bool)

(declare-fun res!116763 () Bool)

(assert (=> b!238333 (=> (not res!116763) (not e!154734))))

(assert (=> b!238333 (= res!116763 e!154738)))

(declare-fun c!39759 () Bool)

(assert (=> b!238333 (= c!39759 (not (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!22152 () Bool)

(assert (=> bm!22152 (= call!22158 (contains!1686 lt!120415 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238334 () Bool)

(assert (=> b!238334 (= e!154735 e!154741)))

(declare-fun res!116762 () Bool)

(assert (=> b!238334 (= res!116762 call!22158)))

(assert (=> b!238334 (=> (not res!116762) (not e!154741))))

(declare-fun b!238335 () Bool)

(assert (=> b!238335 (= e!154738 (not call!22156))))

(declare-fun b!238336 () Bool)

(declare-fun e!154732 () ListLongMap!3561)

(assert (=> b!238336 (= e!154732 call!22155)))

(declare-fun bm!22153 () Bool)

(declare-fun c!39755 () Bool)

(declare-fun call!22157 () ListLongMap!3561)

(assert (=> bm!22153 (= call!22152 (+!653 (ite c!39758 call!22157 (ite c!39755 call!22154 call!22153)) (ite (or c!39758 c!39755) (tuple2!4659 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4261 thiss!1504)) (tuple2!4659 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4261 thiss!1504)))))))

(declare-fun b!238337 () Bool)

(assert (=> b!238337 (= e!154737 (validKeyInArray!0 (select (arr!5596 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238338 () Bool)

(assert (=> b!238338 (= e!154729 call!22155)))

(declare-fun b!238339 () Bool)

(declare-fun res!116767 () Bool)

(assert (=> b!238339 (=> (not res!116767) (not e!154734))))

(assert (=> b!238339 (= res!116767 e!154731)))

(declare-fun res!116761 () Bool)

(assert (=> b!238339 (=> res!116761 e!154731)))

(declare-fun e!154733 () Bool)

(assert (=> b!238339 (= res!116761 (not e!154733))))

(declare-fun res!116768 () Bool)

(assert (=> b!238339 (=> (not res!116768) (not e!154733))))

(assert (=> b!238339 (= res!116768 (bvslt #b00000000000000000000000000000000 (size!5938 (_keys!6519 thiss!1504))))))

(declare-fun b!238340 () Bool)

(declare-fun c!39757 () Bool)

(assert (=> b!238340 (= c!39757 (and (not (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!238340 (= e!154732 e!154729)))

(declare-fun bm!22154 () Bool)

(assert (=> bm!22154 (= call!22154 call!22157)))

(declare-fun b!238341 () Bool)

(assert (=> b!238341 (= e!154739 (= (apply!220 lt!120415 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4261 thiss!1504)))))

(declare-fun b!238342 () Bool)

(assert (=> b!238342 (= e!154736 e!154732)))

(assert (=> b!238342 (= c!39755 (and (not (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22155 () Bool)

(assert (=> bm!22155 (= call!22157 (getCurrentListMapNoExtraKeys!536 (_keys!6519 thiss!1504) (_values!4403 thiss!1504) (mask!10450 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)))))

(declare-fun b!238343 () Bool)

(assert (=> b!238343 (= e!154733 (validKeyInArray!0 (select (arr!5596 (_keys!6519 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59615 c!39758) b!238329))

(assert (= (and d!59615 (not c!39758)) b!238342))

(assert (= (and b!238342 c!39755) b!238336))

(assert (= (and b!238342 (not c!39755)) b!238340))

(assert (= (and b!238340 c!39757) b!238338))

(assert (= (and b!238340 (not c!39757)) b!238328))

(assert (= (or b!238338 b!238328) bm!22150))

(assert (= (or b!238336 bm!22150) bm!22154))

(assert (= (or b!238336 b!238338) bm!22151))

(assert (= (or b!238329 bm!22154) bm!22155))

(assert (= (or b!238329 bm!22151) bm!22153))

(assert (= (and d!59615 res!116764) b!238337))

(assert (= (and d!59615 c!39754) b!238326))

(assert (= (and d!59615 (not c!39754)) b!238331))

(assert (= (and d!59615 res!116769) b!238339))

(assert (= (and b!238339 res!116768) b!238343))

(assert (= (and b!238339 (not res!116761)) b!238330))

(assert (= (and b!238330 res!116766) b!238332))

(assert (= (and b!238339 res!116767) b!238333))

(assert (= (and b!238333 c!39759) b!238325))

(assert (= (and b!238333 (not c!39759)) b!238335))

(assert (= (and b!238325 res!116765) b!238341))

(assert (= (or b!238325 b!238335) bm!22149))

(assert (= (and b!238333 res!116763) b!238324))

(assert (= (and b!238324 c!39756) b!238334))

(assert (= (and b!238324 (not c!39756)) b!238323))

(assert (= (and b!238334 res!116762) b!238327))

(assert (= (or b!238334 b!238323) bm!22152))

(declare-fun b_lambda!7957 () Bool)

(assert (=> (not b_lambda!7957) (not b!238332)))

(declare-fun t!8558 () Bool)

(declare-fun tb!2945 () Bool)

(assert (=> (and b!238143 (= (defaultEntry!4420 thiss!1504) (defaultEntry!4420 thiss!1504)) t!8558) tb!2945))

(declare-fun result!5173 () Bool)

(assert (=> tb!2945 (= result!5173 tp_is_empty!6259)))

(assert (=> b!238332 t!8558))

(declare-fun b_and!13341 () Bool)

(assert (= b_and!13335 (and (=> t!8558 result!5173) b_and!13341)))

(declare-fun m!258373 () Bool)

(assert (=> b!238326 m!258373))

(declare-fun m!258375 () Bool)

(assert (=> b!238326 m!258375))

(declare-fun m!258377 () Bool)

(assert (=> b!238326 m!258377))

(declare-fun m!258379 () Bool)

(assert (=> b!238326 m!258379))

(declare-fun m!258381 () Bool)

(assert (=> b!238326 m!258381))

(declare-fun m!258383 () Bool)

(assert (=> b!238326 m!258383))

(declare-fun m!258385 () Bool)

(assert (=> b!238326 m!258385))

(declare-fun m!258387 () Bool)

(assert (=> b!238326 m!258387))

(declare-fun m!258389 () Bool)

(assert (=> b!238326 m!258389))

(declare-fun m!258391 () Bool)

(assert (=> b!238326 m!258391))

(assert (=> b!238326 m!258387))

(assert (=> b!238326 m!258383))

(declare-fun m!258393 () Bool)

(assert (=> b!238326 m!258393))

(declare-fun m!258395 () Bool)

(assert (=> b!238326 m!258395))

(assert (=> b!238326 m!258335))

(declare-fun m!258397 () Bool)

(assert (=> b!238326 m!258397))

(declare-fun m!258399 () Bool)

(assert (=> b!238326 m!258399))

(assert (=> b!238326 m!258397))

(declare-fun m!258401 () Bool)

(assert (=> b!238326 m!258401))

(declare-fun m!258403 () Bool)

(assert (=> b!238326 m!258403))

(assert (=> b!238326 m!258379))

(assert (=> b!238330 m!258335))

(assert (=> b!238330 m!258335))

(declare-fun m!258405 () Bool)

(assert (=> b!238330 m!258405))

(declare-fun m!258407 () Bool)

(assert (=> bm!22153 m!258407))

(declare-fun m!258409 () Bool)

(assert (=> b!238332 m!258409))

(assert (=> b!238332 m!258335))

(assert (=> b!238332 m!258409))

(declare-fun m!258411 () Bool)

(assert (=> b!238332 m!258411))

(declare-fun m!258413 () Bool)

(assert (=> b!238332 m!258413))

(assert (=> b!238332 m!258411))

(assert (=> b!238332 m!258335))

(declare-fun m!258415 () Bool)

(assert (=> b!238332 m!258415))

(declare-fun m!258417 () Bool)

(assert (=> b!238329 m!258417))

(declare-fun m!258419 () Bool)

(assert (=> bm!22152 m!258419))

(assert (=> d!59615 m!258285))

(declare-fun m!258421 () Bool)

(assert (=> bm!22149 m!258421))

(assert (=> b!238337 m!258335))

(assert (=> b!238337 m!258335))

(assert (=> b!238337 m!258345))

(assert (=> bm!22155 m!258403))

(assert (=> b!238343 m!258335))

(assert (=> b!238343 m!258335))

(assert (=> b!238343 m!258345))

(declare-fun m!258423 () Bool)

(assert (=> b!238341 m!258423))

(declare-fun m!258425 () Bool)

(assert (=> b!238327 m!258425))

(assert (=> b!238152 d!59615))

(declare-fun d!59617 () Bool)

(assert (=> d!59617 (= (validMask!0 (mask!10450 thiss!1504)) (and (or (= (mask!10450 thiss!1504) #b00000000000000000000000000000111) (= (mask!10450 thiss!1504) #b00000000000000000000000000001111) (= (mask!10450 thiss!1504) #b00000000000000000000000000011111) (= (mask!10450 thiss!1504) #b00000000000000000000000000111111) (= (mask!10450 thiss!1504) #b00000000000000000000000001111111) (= (mask!10450 thiss!1504) #b00000000000000000000000011111111) (= (mask!10450 thiss!1504) #b00000000000000000000000111111111) (= (mask!10450 thiss!1504) #b00000000000000000000001111111111) (= (mask!10450 thiss!1504) #b00000000000000000000011111111111) (= (mask!10450 thiss!1504) #b00000000000000000000111111111111) (= (mask!10450 thiss!1504) #b00000000000000000001111111111111) (= (mask!10450 thiss!1504) #b00000000000000000011111111111111) (= (mask!10450 thiss!1504) #b00000000000000000111111111111111) (= (mask!10450 thiss!1504) #b00000000000000001111111111111111) (= (mask!10450 thiss!1504) #b00000000000000011111111111111111) (= (mask!10450 thiss!1504) #b00000000000000111111111111111111) (= (mask!10450 thiss!1504) #b00000000000001111111111111111111) (= (mask!10450 thiss!1504) #b00000000000011111111111111111111) (= (mask!10450 thiss!1504) #b00000000000111111111111111111111) (= (mask!10450 thiss!1504) #b00000000001111111111111111111111) (= (mask!10450 thiss!1504) #b00000000011111111111111111111111) (= (mask!10450 thiss!1504) #b00000000111111111111111111111111) (= (mask!10450 thiss!1504) #b00000001111111111111111111111111) (= (mask!10450 thiss!1504) #b00000011111111111111111111111111) (= (mask!10450 thiss!1504) #b00000111111111111111111111111111) (= (mask!10450 thiss!1504) #b00001111111111111111111111111111) (= (mask!10450 thiss!1504) #b00011111111111111111111111111111) (= (mask!10450 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10450 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!238150 d!59617))

(declare-fun d!59619 () Bool)

(declare-fun res!116776 () Bool)

(declare-fun e!154744 () Bool)

(assert (=> d!59619 (=> (not res!116776) (not e!154744))))

(declare-fun simpleValid!243 (LongMapFixedSize!3472) Bool)

(assert (=> d!59619 (= res!116776 (simpleValid!243 thiss!1504))))

(assert (=> d!59619 (= (valid!1376 thiss!1504) e!154744)))

(declare-fun b!238352 () Bool)

(declare-fun res!116777 () Bool)

(assert (=> b!238352 (=> (not res!116777) (not e!154744))))

(declare-fun arrayCountValidKeys!0 (array!11789 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!238352 (= res!116777 (= (arrayCountValidKeys!0 (_keys!6519 thiss!1504) #b00000000000000000000000000000000 (size!5938 (_keys!6519 thiss!1504))) (_size!1785 thiss!1504)))))

(declare-fun b!238353 () Bool)

(declare-fun res!116778 () Bool)

(assert (=> b!238353 (=> (not res!116778) (not e!154744))))

(assert (=> b!238353 (= res!116778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6519 thiss!1504) (mask!10450 thiss!1504)))))

(declare-fun b!238354 () Bool)

(assert (=> b!238354 (= e!154744 (arrayNoDuplicates!0 (_keys!6519 thiss!1504) #b00000000000000000000000000000000 Nil!3566))))

(assert (= (and d!59619 res!116776) b!238352))

(assert (= (and b!238352 res!116777) b!238353))

(assert (= (and b!238353 res!116778) b!238354))

(declare-fun m!258427 () Bool)

(assert (=> d!59619 m!258427))

(declare-fun m!258429 () Bool)

(assert (=> b!238352 m!258429))

(assert (=> b!238353 m!258289))

(assert (=> b!238354 m!258273))

(assert (=> start!22878 d!59619))

(declare-fun b!238361 () Bool)

(declare-fun e!154750 () Bool)

(assert (=> b!238361 (= e!154750 tp_is_empty!6259)))

(declare-fun condMapEmpty!10626 () Bool)

(declare-fun mapDefault!10626 () ValueCell!2786)

(assert (=> mapNonEmpty!10617 (= condMapEmpty!10626 (= mapRest!10617 ((as const (Array (_ BitVec 32) ValueCell!2786)) mapDefault!10626)))))

(declare-fun e!154749 () Bool)

(declare-fun mapRes!10626 () Bool)

(assert (=> mapNonEmpty!10617 (= tp!22391 (and e!154749 mapRes!10626))))

(declare-fun mapIsEmpty!10626 () Bool)

(assert (=> mapIsEmpty!10626 mapRes!10626))

(declare-fun b!238362 () Bool)

(assert (=> b!238362 (= e!154749 tp_is_empty!6259)))

(declare-fun mapNonEmpty!10626 () Bool)

(declare-fun tp!22407 () Bool)

(assert (=> mapNonEmpty!10626 (= mapRes!10626 (and tp!22407 e!154750))))

(declare-fun mapRest!10626 () (Array (_ BitVec 32) ValueCell!2786))

(declare-fun mapKey!10626 () (_ BitVec 32))

(declare-fun mapValue!10626 () ValueCell!2786)

(assert (=> mapNonEmpty!10626 (= mapRest!10617 (store mapRest!10626 mapKey!10626 mapValue!10626))))

(assert (= (and mapNonEmpty!10617 condMapEmpty!10626) mapIsEmpty!10626))

(assert (= (and mapNonEmpty!10617 (not condMapEmpty!10626)) mapNonEmpty!10626))

(assert (= (and mapNonEmpty!10626 ((_ is ValueCellFull!2786) mapValue!10626)) b!238361))

(assert (= (and mapNonEmpty!10617 ((_ is ValueCellFull!2786) mapDefault!10626)) b!238362))

(declare-fun m!258431 () Bool)

(assert (=> mapNonEmpty!10626 m!258431))

(declare-fun b_lambda!7959 () Bool)

(assert (= b_lambda!7957 (or (and b!238143 b_free!6397) b_lambda!7959)))

(check-sat (not bm!22153) (not b!238343) (not b!238250) (not d!59613) (not b!238238) (not b!238337) (not bm!22152) (not b!238341) (not b!238327) (not b!238278) (not b!238270) (not b!238330) (not b!238280) (not mapNonEmpty!10626) (not b!238332) (not b!238326) (not d!59619) (not b!238252) (not d!59615) (not bm!22155) (not b!238353) (not b!238329) (not b!238352) (not b!238354) (not b_lambda!7959) (not b_next!6397) tp_is_empty!6259 (not d!59611) (not bm!22131) (not bm!22149) (not bm!22134) b_and!13341 (not b!238236) (not b!238251))
(check-sat b_and!13341 (not b_next!6397))
