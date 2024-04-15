; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18440 () Bool)

(assert start!18440)

(declare-fun b!182752 () Bool)

(declare-fun b_free!4513 () Bool)

(declare-fun b_next!4513 () Bool)

(assert (=> b!182752 (= b_free!4513 (not b_next!4513))))

(declare-fun tp!16303 () Bool)

(declare-fun b_and!11053 () Bool)

(assert (=> b!182752 (= tp!16303 b_and!11053)))

(declare-fun res!86485 () Bool)

(declare-fun e!120316 () Bool)

(assert (=> start!18440 (=> (not res!86485) (not e!120316))))

(declare-datatypes ((V!5361 0))(
  ( (V!5362 (val!2187 Int)) )
))
(declare-datatypes ((ValueCell!1799 0))(
  ( (ValueCellFull!1799 (v!4082 V!5361)) (EmptyCell!1799) )
))
(declare-datatypes ((array!7739 0))(
  ( (array!7740 (arr!3658 (Array (_ BitVec 32) (_ BitVec 64))) (size!3971 (_ BitVec 32))) )
))
(declare-datatypes ((array!7741 0))(
  ( (array!7742 (arr!3659 (Array (_ BitVec 32) ValueCell!1799)) (size!3972 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2506 0))(
  ( (LongMapFixedSize!2507 (defaultEntry!3741 Int) (mask!8793 (_ BitVec 32)) (extraKeys!3478 (_ BitVec 32)) (zeroValue!3582 V!5361) (minValue!3582 V!5361) (_size!1302 (_ BitVec 32)) (_keys!5655 array!7739) (_values!3724 array!7741) (_vacant!1302 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2506)

(declare-fun valid!1056 (LongMapFixedSize!2506) Bool)

(assert (=> start!18440 (= res!86485 (valid!1056 thiss!1248))))

(assert (=> start!18440 e!120316))

(declare-fun e!120313 () Bool)

(assert (=> start!18440 e!120313))

(assert (=> start!18440 true))

(declare-fun b!182744 () Bool)

(declare-fun e!120314 () Bool)

(declare-fun tp_is_empty!4285 () Bool)

(assert (=> b!182744 (= e!120314 tp_is_empty!4285)))

(declare-fun b!182745 () Bool)

(declare-fun res!86484 () Bool)

(declare-fun e!120317 () Bool)

(assert (=> b!182745 (=> (not res!86484) (not e!120317))))

(assert (=> b!182745 (= res!86484 (and (= (size!3972 (_values!3724 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8793 thiss!1248))) (= (size!3971 (_keys!5655 thiss!1248)) (size!3972 (_values!3724 thiss!1248))) (bvsge (mask!8793 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3478 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3478 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!182746 () Bool)

(assert (=> b!182746 (= e!120316 e!120317)))

(declare-fun res!86480 () Bool)

(assert (=> b!182746 (=> (not res!86480) (not e!120317))))

(declare-datatypes ((SeekEntryResult!620 0))(
  ( (MissingZero!620 (index!4650 (_ BitVec 32))) (Found!620 (index!4651 (_ BitVec 32))) (Intermediate!620 (undefined!1432 Bool) (index!4652 (_ BitVec 32)) (x!19937 (_ BitVec 32))) (Undefined!620) (MissingVacant!620 (index!4653 (_ BitVec 32))) )
))
(declare-fun lt!90237 () SeekEntryResult!620)

(get-info :version)

(assert (=> b!182746 (= res!86480 (and (not ((_ is Undefined!620) lt!90237)) (not ((_ is MissingVacant!620) lt!90237)) (not ((_ is MissingZero!620) lt!90237)) ((_ is Found!620) lt!90237)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7739 (_ BitVec 32)) SeekEntryResult!620)

(assert (=> b!182746 (= lt!90237 (seekEntryOrOpen!0 key!828 (_keys!5655 thiss!1248) (mask!8793 thiss!1248)))))

(declare-fun b!182747 () Bool)

(declare-fun res!86482 () Bool)

(assert (=> b!182747 (=> (not res!86482) (not e!120316))))

(assert (=> b!182747 (= res!86482 (not (= key!828 (bvneg key!828))))))

(declare-fun b!182748 () Bool)

(declare-fun res!86479 () Bool)

(assert (=> b!182748 (=> (not res!86479) (not e!120317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182748 (= res!86479 (validMask!0 (mask!8793 thiss!1248)))))

(declare-fun b!182749 () Bool)

(declare-fun res!86481 () Bool)

(assert (=> b!182749 (=> (not res!86481) (not e!120317))))

(declare-datatypes ((tuple2!3382 0))(
  ( (tuple2!3383 (_1!1702 (_ BitVec 64)) (_2!1702 V!5361)) )
))
(declare-datatypes ((List!2323 0))(
  ( (Nil!2320) (Cons!2319 (h!2948 tuple2!3382) (t!7178 List!2323)) )
))
(declare-datatypes ((ListLongMap!2291 0))(
  ( (ListLongMap!2292 (toList!1161 List!2323)) )
))
(declare-fun contains!1252 (ListLongMap!2291 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!794 (array!7739 array!7741 (_ BitVec 32) (_ BitVec 32) V!5361 V!5361 (_ BitVec 32) Int) ListLongMap!2291)

(assert (=> b!182749 (= res!86481 (contains!1252 (getCurrentListMap!794 (_keys!5655 thiss!1248) (_values!3724 thiss!1248) (mask!8793 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)) key!828))))

(declare-fun b!182750 () Bool)

(declare-fun res!86478 () Bool)

(assert (=> b!182750 (=> (not res!86478) (not e!120317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7739 (_ BitVec 32)) Bool)

(assert (=> b!182750 (= res!86478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5655 thiss!1248) (mask!8793 thiss!1248)))))

(declare-fun b!182751 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!182751 (= e!120317 (not (validKeyInArray!0 key!828)))))

(declare-fun e!120315 () Bool)

(declare-fun array_inv!2365 (array!7739) Bool)

(declare-fun array_inv!2366 (array!7741) Bool)

(assert (=> b!182752 (= e!120313 (and tp!16303 tp_is_empty!4285 (array_inv!2365 (_keys!5655 thiss!1248)) (array_inv!2366 (_values!3724 thiss!1248)) e!120315))))

(declare-fun b!182753 () Bool)

(declare-fun res!86483 () Bool)

(assert (=> b!182753 (=> (not res!86483) (not e!120317))))

(declare-datatypes ((List!2324 0))(
  ( (Nil!2321) (Cons!2320 (h!2949 (_ BitVec 64)) (t!7179 List!2324)) )
))
(declare-fun arrayNoDuplicates!0 (array!7739 (_ BitVec 32) List!2324) Bool)

(assert (=> b!182753 (= res!86483 (arrayNoDuplicates!0 (_keys!5655 thiss!1248) #b00000000000000000000000000000000 Nil!2321))))

(declare-fun b!182754 () Bool)

(declare-fun mapRes!7355 () Bool)

(assert (=> b!182754 (= e!120315 (and e!120314 mapRes!7355))))

(declare-fun condMapEmpty!7355 () Bool)

(declare-fun mapDefault!7355 () ValueCell!1799)

(assert (=> b!182754 (= condMapEmpty!7355 (= (arr!3659 (_values!3724 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1799)) mapDefault!7355)))))

(declare-fun b!182755 () Bool)

(declare-fun e!120312 () Bool)

(assert (=> b!182755 (= e!120312 tp_is_empty!4285)))

(declare-fun mapIsEmpty!7355 () Bool)

(assert (=> mapIsEmpty!7355 mapRes!7355))

(declare-fun mapNonEmpty!7355 () Bool)

(declare-fun tp!16304 () Bool)

(assert (=> mapNonEmpty!7355 (= mapRes!7355 (and tp!16304 e!120312))))

(declare-fun mapValue!7355 () ValueCell!1799)

(declare-fun mapRest!7355 () (Array (_ BitVec 32) ValueCell!1799))

(declare-fun mapKey!7355 () (_ BitVec 32))

(assert (=> mapNonEmpty!7355 (= (arr!3659 (_values!3724 thiss!1248)) (store mapRest!7355 mapKey!7355 mapValue!7355))))

(assert (= (and start!18440 res!86485) b!182747))

(assert (= (and b!182747 res!86482) b!182746))

(assert (= (and b!182746 res!86480) b!182749))

(assert (= (and b!182749 res!86481) b!182748))

(assert (= (and b!182748 res!86479) b!182745))

(assert (= (and b!182745 res!86484) b!182750))

(assert (= (and b!182750 res!86478) b!182753))

(assert (= (and b!182753 res!86483) b!182751))

(assert (= (and b!182754 condMapEmpty!7355) mapIsEmpty!7355))

(assert (= (and b!182754 (not condMapEmpty!7355)) mapNonEmpty!7355))

(assert (= (and mapNonEmpty!7355 ((_ is ValueCellFull!1799) mapValue!7355)) b!182755))

(assert (= (and b!182754 ((_ is ValueCellFull!1799) mapDefault!7355)) b!182744))

(assert (= b!182752 b!182754))

(assert (= start!18440 b!182752))

(declare-fun m!209913 () Bool)

(assert (=> b!182752 m!209913))

(declare-fun m!209915 () Bool)

(assert (=> b!182752 m!209915))

(declare-fun m!209917 () Bool)

(assert (=> mapNonEmpty!7355 m!209917))

(declare-fun m!209919 () Bool)

(assert (=> b!182749 m!209919))

(assert (=> b!182749 m!209919))

(declare-fun m!209921 () Bool)

(assert (=> b!182749 m!209921))

(declare-fun m!209923 () Bool)

(assert (=> b!182751 m!209923))

(declare-fun m!209925 () Bool)

(assert (=> start!18440 m!209925))

(declare-fun m!209927 () Bool)

(assert (=> b!182748 m!209927))

(declare-fun m!209929 () Bool)

(assert (=> b!182746 m!209929))

(declare-fun m!209931 () Bool)

(assert (=> b!182753 m!209931))

(declare-fun m!209933 () Bool)

(assert (=> b!182750 m!209933))

(check-sat (not b!182746) b_and!11053 (not b_next!4513) (not b!182749) (not mapNonEmpty!7355) (not b!182752) (not start!18440) (not b!182753) (not b!182751) (not b!182750) (not b!182748) tp_is_empty!4285)
(check-sat b_and!11053 (not b_next!4513))
(get-model)

(declare-fun b!182838 () Bool)

(declare-fun e!120369 () Bool)

(declare-fun contains!1254 (List!2324 (_ BitVec 64)) Bool)

(assert (=> b!182838 (= e!120369 (contains!1254 Nil!2321 (select (arr!3658 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18436 () Bool)

(declare-fun call!18439 () Bool)

(declare-fun c!32758 () Bool)

(assert (=> bm!18436 (= call!18439 (arrayNoDuplicates!0 (_keys!5655 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32758 (Cons!2320 (select (arr!3658 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000) Nil!2321) Nil!2321)))))

(declare-fun b!182839 () Bool)

(declare-fun e!120372 () Bool)

(declare-fun e!120371 () Bool)

(assert (=> b!182839 (= e!120372 e!120371)))

(declare-fun res!86542 () Bool)

(assert (=> b!182839 (=> (not res!86542) (not e!120371))))

(assert (=> b!182839 (= res!86542 (not e!120369))))

(declare-fun res!86540 () Bool)

(assert (=> b!182839 (=> (not res!86540) (not e!120369))))

(assert (=> b!182839 (= res!86540 (validKeyInArray!0 (select (arr!3658 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54517 () Bool)

(declare-fun res!86541 () Bool)

(assert (=> d!54517 (=> res!86541 e!120372)))

(assert (=> d!54517 (= res!86541 (bvsge #b00000000000000000000000000000000 (size!3971 (_keys!5655 thiss!1248))))))

(assert (=> d!54517 (= (arrayNoDuplicates!0 (_keys!5655 thiss!1248) #b00000000000000000000000000000000 Nil!2321) e!120372)))

(declare-fun b!182840 () Bool)

(declare-fun e!120370 () Bool)

(assert (=> b!182840 (= e!120371 e!120370)))

(assert (=> b!182840 (= c!32758 (validKeyInArray!0 (select (arr!3658 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182841 () Bool)

(assert (=> b!182841 (= e!120370 call!18439)))

(declare-fun b!182842 () Bool)

(assert (=> b!182842 (= e!120370 call!18439)))

(assert (= (and d!54517 (not res!86541)) b!182839))

(assert (= (and b!182839 res!86540) b!182838))

(assert (= (and b!182839 res!86542) b!182840))

(assert (= (and b!182840 c!32758) b!182841))

(assert (= (and b!182840 (not c!32758)) b!182842))

(assert (= (or b!182841 b!182842) bm!18436))

(declare-fun m!209979 () Bool)

(assert (=> b!182838 m!209979))

(assert (=> b!182838 m!209979))

(declare-fun m!209981 () Bool)

(assert (=> b!182838 m!209981))

(assert (=> bm!18436 m!209979))

(declare-fun m!209983 () Bool)

(assert (=> bm!18436 m!209983))

(assert (=> b!182839 m!209979))

(assert (=> b!182839 m!209979))

(declare-fun m!209985 () Bool)

(assert (=> b!182839 m!209985))

(assert (=> b!182840 m!209979))

(assert (=> b!182840 m!209979))

(assert (=> b!182840 m!209985))

(assert (=> b!182753 d!54517))

(declare-fun d!54519 () Bool)

(declare-fun res!86549 () Bool)

(declare-fun e!120375 () Bool)

(assert (=> d!54519 (=> (not res!86549) (not e!120375))))

(declare-fun simpleValid!173 (LongMapFixedSize!2506) Bool)

(assert (=> d!54519 (= res!86549 (simpleValid!173 thiss!1248))))

(assert (=> d!54519 (= (valid!1056 thiss!1248) e!120375)))

(declare-fun b!182849 () Bool)

(declare-fun res!86550 () Bool)

(assert (=> b!182849 (=> (not res!86550) (not e!120375))))

(declare-fun arrayCountValidKeys!0 (array!7739 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!182849 (= res!86550 (= (arrayCountValidKeys!0 (_keys!5655 thiss!1248) #b00000000000000000000000000000000 (size!3971 (_keys!5655 thiss!1248))) (_size!1302 thiss!1248)))))

(declare-fun b!182850 () Bool)

(declare-fun res!86551 () Bool)

(assert (=> b!182850 (=> (not res!86551) (not e!120375))))

(assert (=> b!182850 (= res!86551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5655 thiss!1248) (mask!8793 thiss!1248)))))

(declare-fun b!182851 () Bool)

(assert (=> b!182851 (= e!120375 (arrayNoDuplicates!0 (_keys!5655 thiss!1248) #b00000000000000000000000000000000 Nil!2321))))

(assert (= (and d!54519 res!86549) b!182849))

(assert (= (and b!182849 res!86550) b!182850))

(assert (= (and b!182850 res!86551) b!182851))

(declare-fun m!209987 () Bool)

(assert (=> d!54519 m!209987))

(declare-fun m!209989 () Bool)

(assert (=> b!182849 m!209989))

(assert (=> b!182850 m!209933))

(assert (=> b!182851 m!209931))

(assert (=> start!18440 d!54519))

(declare-fun d!54521 () Bool)

(assert (=> d!54521 (= (validMask!0 (mask!8793 thiss!1248)) (and (or (= (mask!8793 thiss!1248) #b00000000000000000000000000000111) (= (mask!8793 thiss!1248) #b00000000000000000000000000001111) (= (mask!8793 thiss!1248) #b00000000000000000000000000011111) (= (mask!8793 thiss!1248) #b00000000000000000000000000111111) (= (mask!8793 thiss!1248) #b00000000000000000000000001111111) (= (mask!8793 thiss!1248) #b00000000000000000000000011111111) (= (mask!8793 thiss!1248) #b00000000000000000000000111111111) (= (mask!8793 thiss!1248) #b00000000000000000000001111111111) (= (mask!8793 thiss!1248) #b00000000000000000000011111111111) (= (mask!8793 thiss!1248) #b00000000000000000000111111111111) (= (mask!8793 thiss!1248) #b00000000000000000001111111111111) (= (mask!8793 thiss!1248) #b00000000000000000011111111111111) (= (mask!8793 thiss!1248) #b00000000000000000111111111111111) (= (mask!8793 thiss!1248) #b00000000000000001111111111111111) (= (mask!8793 thiss!1248) #b00000000000000011111111111111111) (= (mask!8793 thiss!1248) #b00000000000000111111111111111111) (= (mask!8793 thiss!1248) #b00000000000001111111111111111111) (= (mask!8793 thiss!1248) #b00000000000011111111111111111111) (= (mask!8793 thiss!1248) #b00000000000111111111111111111111) (= (mask!8793 thiss!1248) #b00000000001111111111111111111111) (= (mask!8793 thiss!1248) #b00000000011111111111111111111111) (= (mask!8793 thiss!1248) #b00000000111111111111111111111111) (= (mask!8793 thiss!1248) #b00000001111111111111111111111111) (= (mask!8793 thiss!1248) #b00000011111111111111111111111111) (= (mask!8793 thiss!1248) #b00000111111111111111111111111111) (= (mask!8793 thiss!1248) #b00001111111111111111111111111111) (= (mask!8793 thiss!1248) #b00011111111111111111111111111111) (= (mask!8793 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8793 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!182748 d!54521))

(declare-fun d!54523 () Bool)

(assert (=> d!54523 (= (array_inv!2365 (_keys!5655 thiss!1248)) (bvsge (size!3971 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182752 d!54523))

(declare-fun d!54525 () Bool)

(assert (=> d!54525 (= (array_inv!2366 (_values!3724 thiss!1248)) (bvsge (size!3972 (_values!3724 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182752 d!54525))

(declare-fun d!54527 () Bool)

(assert (=> d!54527 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!182751 d!54527))

(declare-fun b!182864 () Bool)

(declare-fun e!120382 () SeekEntryResult!620)

(declare-fun e!120384 () SeekEntryResult!620)

(assert (=> b!182864 (= e!120382 e!120384)))

(declare-fun lt!90251 () (_ BitVec 64))

(declare-fun lt!90252 () SeekEntryResult!620)

(assert (=> b!182864 (= lt!90251 (select (arr!3658 (_keys!5655 thiss!1248)) (index!4652 lt!90252)))))

(declare-fun c!32766 () Bool)

(assert (=> b!182864 (= c!32766 (= lt!90251 key!828))))

(declare-fun b!182865 () Bool)

(assert (=> b!182865 (= e!120384 (Found!620 (index!4652 lt!90252)))))

(declare-fun b!182866 () Bool)

(declare-fun c!32767 () Bool)

(assert (=> b!182866 (= c!32767 (= lt!90251 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!120383 () SeekEntryResult!620)

(assert (=> b!182866 (= e!120384 e!120383)))

(declare-fun b!182867 () Bool)

(assert (=> b!182867 (= e!120383 (MissingZero!620 (index!4652 lt!90252)))))

(declare-fun d!54529 () Bool)

(declare-fun lt!90250 () SeekEntryResult!620)

(assert (=> d!54529 (and (or ((_ is Undefined!620) lt!90250) (not ((_ is Found!620) lt!90250)) (and (bvsge (index!4651 lt!90250) #b00000000000000000000000000000000) (bvslt (index!4651 lt!90250) (size!3971 (_keys!5655 thiss!1248))))) (or ((_ is Undefined!620) lt!90250) ((_ is Found!620) lt!90250) (not ((_ is MissingZero!620) lt!90250)) (and (bvsge (index!4650 lt!90250) #b00000000000000000000000000000000) (bvslt (index!4650 lt!90250) (size!3971 (_keys!5655 thiss!1248))))) (or ((_ is Undefined!620) lt!90250) ((_ is Found!620) lt!90250) ((_ is MissingZero!620) lt!90250) (not ((_ is MissingVacant!620) lt!90250)) (and (bvsge (index!4653 lt!90250) #b00000000000000000000000000000000) (bvslt (index!4653 lt!90250) (size!3971 (_keys!5655 thiss!1248))))) (or ((_ is Undefined!620) lt!90250) (ite ((_ is Found!620) lt!90250) (= (select (arr!3658 (_keys!5655 thiss!1248)) (index!4651 lt!90250)) key!828) (ite ((_ is MissingZero!620) lt!90250) (= (select (arr!3658 (_keys!5655 thiss!1248)) (index!4650 lt!90250)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!620) lt!90250) (= (select (arr!3658 (_keys!5655 thiss!1248)) (index!4653 lt!90250)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54529 (= lt!90250 e!120382)))

(declare-fun c!32765 () Bool)

(assert (=> d!54529 (= c!32765 (and ((_ is Intermediate!620) lt!90252) (undefined!1432 lt!90252)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7739 (_ BitVec 32)) SeekEntryResult!620)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54529 (= lt!90252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8793 thiss!1248)) key!828 (_keys!5655 thiss!1248) (mask!8793 thiss!1248)))))

(assert (=> d!54529 (validMask!0 (mask!8793 thiss!1248))))

(assert (=> d!54529 (= (seekEntryOrOpen!0 key!828 (_keys!5655 thiss!1248) (mask!8793 thiss!1248)) lt!90250)))

(declare-fun b!182868 () Bool)

(assert (=> b!182868 (= e!120382 Undefined!620)))

(declare-fun b!182869 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7739 (_ BitVec 32)) SeekEntryResult!620)

(assert (=> b!182869 (= e!120383 (seekKeyOrZeroReturnVacant!0 (x!19937 lt!90252) (index!4652 lt!90252) (index!4652 lt!90252) key!828 (_keys!5655 thiss!1248) (mask!8793 thiss!1248)))))

(assert (= (and d!54529 c!32765) b!182868))

(assert (= (and d!54529 (not c!32765)) b!182864))

(assert (= (and b!182864 c!32766) b!182865))

(assert (= (and b!182864 (not c!32766)) b!182866))

(assert (= (and b!182866 c!32767) b!182867))

(assert (= (and b!182866 (not c!32767)) b!182869))

(declare-fun m!209991 () Bool)

(assert (=> b!182864 m!209991))

(declare-fun m!209993 () Bool)

(assert (=> d!54529 m!209993))

(declare-fun m!209995 () Bool)

(assert (=> d!54529 m!209995))

(declare-fun m!209997 () Bool)

(assert (=> d!54529 m!209997))

(assert (=> d!54529 m!209927))

(assert (=> d!54529 m!209993))

(declare-fun m!209999 () Bool)

(assert (=> d!54529 m!209999))

(declare-fun m!210001 () Bool)

(assert (=> d!54529 m!210001))

(declare-fun m!210003 () Bool)

(assert (=> b!182869 m!210003))

(assert (=> b!182746 d!54529))

(declare-fun d!54531 () Bool)

(declare-fun e!120390 () Bool)

(assert (=> d!54531 e!120390))

(declare-fun res!86554 () Bool)

(assert (=> d!54531 (=> res!86554 e!120390)))

(declare-fun lt!90263 () Bool)

(assert (=> d!54531 (= res!86554 (not lt!90263))))

(declare-fun lt!90262 () Bool)

(assert (=> d!54531 (= lt!90263 lt!90262)))

(declare-datatypes ((Unit!5511 0))(
  ( (Unit!5512) )
))
(declare-fun lt!90261 () Unit!5511)

(declare-fun e!120389 () Unit!5511)

(assert (=> d!54531 (= lt!90261 e!120389)))

(declare-fun c!32770 () Bool)

(assert (=> d!54531 (= c!32770 lt!90262)))

(declare-fun containsKey!216 (List!2323 (_ BitVec 64)) Bool)

(assert (=> d!54531 (= lt!90262 (containsKey!216 (toList!1161 (getCurrentListMap!794 (_keys!5655 thiss!1248) (_values!3724 thiss!1248) (mask!8793 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248))) key!828))))

(assert (=> d!54531 (= (contains!1252 (getCurrentListMap!794 (_keys!5655 thiss!1248) (_values!3724 thiss!1248) (mask!8793 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)) key!828) lt!90263)))

(declare-fun b!182876 () Bool)

(declare-fun lt!90264 () Unit!5511)

(assert (=> b!182876 (= e!120389 lt!90264)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!165 (List!2323 (_ BitVec 64)) Unit!5511)

(assert (=> b!182876 (= lt!90264 (lemmaContainsKeyImpliesGetValueByKeyDefined!165 (toList!1161 (getCurrentListMap!794 (_keys!5655 thiss!1248) (_values!3724 thiss!1248) (mask!8793 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248))) key!828))))

(declare-datatypes ((Option!218 0))(
  ( (Some!217 (v!4085 V!5361)) (None!216) )
))
(declare-fun isDefined!166 (Option!218) Bool)

(declare-fun getValueByKey!212 (List!2323 (_ BitVec 64)) Option!218)

(assert (=> b!182876 (isDefined!166 (getValueByKey!212 (toList!1161 (getCurrentListMap!794 (_keys!5655 thiss!1248) (_values!3724 thiss!1248) (mask!8793 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248))) key!828))))

(declare-fun b!182877 () Bool)

(declare-fun Unit!5513 () Unit!5511)

(assert (=> b!182877 (= e!120389 Unit!5513)))

(declare-fun b!182878 () Bool)

(assert (=> b!182878 (= e!120390 (isDefined!166 (getValueByKey!212 (toList!1161 (getCurrentListMap!794 (_keys!5655 thiss!1248) (_values!3724 thiss!1248) (mask!8793 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248))) key!828)))))

(assert (= (and d!54531 c!32770) b!182876))

(assert (= (and d!54531 (not c!32770)) b!182877))

(assert (= (and d!54531 (not res!86554)) b!182878))

(declare-fun m!210005 () Bool)

(assert (=> d!54531 m!210005))

(declare-fun m!210007 () Bool)

(assert (=> b!182876 m!210007))

(declare-fun m!210009 () Bool)

(assert (=> b!182876 m!210009))

(assert (=> b!182876 m!210009))

(declare-fun m!210011 () Bool)

(assert (=> b!182876 m!210011))

(assert (=> b!182878 m!210009))

(assert (=> b!182878 m!210009))

(assert (=> b!182878 m!210011))

(assert (=> b!182749 d!54531))

(declare-fun b!182921 () Bool)

(declare-fun c!32786 () Bool)

(assert (=> b!182921 (= c!32786 (and (not (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!120423 () ListLongMap!2291)

(declare-fun e!120429 () ListLongMap!2291)

(assert (=> b!182921 (= e!120423 e!120429)))

(declare-fun b!182922 () Bool)

(declare-fun e!120421 () Bool)

(declare-fun lt!90330 () ListLongMap!2291)

(declare-fun apply!157 (ListLongMap!2291 (_ BitVec 64)) V!5361)

(declare-fun get!2096 (ValueCell!1799 V!5361) V!5361)

(declare-fun dynLambda!491 (Int (_ BitVec 64)) V!5361)

(assert (=> b!182922 (= e!120421 (= (apply!157 lt!90330 (select (arr!3658 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000)) (get!2096 (select (arr!3659 (_values!3724 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!491 (defaultEntry!3741 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!182922 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3972 (_values!3724 thiss!1248))))))

(assert (=> b!182922 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3971 (_keys!5655 thiss!1248))))))

(declare-fun bm!18451 () Bool)

(declare-fun call!18460 () ListLongMap!2291)

(declare-fun call!18457 () ListLongMap!2291)

(assert (=> bm!18451 (= call!18460 call!18457)))

(declare-fun b!182923 () Bool)

(declare-fun e!120418 () Bool)

(declare-fun call!18459 () Bool)

(assert (=> b!182923 (= e!120418 (not call!18459))))

(declare-fun call!18458 () ListLongMap!2291)

(declare-fun bm!18452 () Bool)

(declare-fun call!18456 () ListLongMap!2291)

(declare-fun c!32787 () Bool)

(declare-fun c!32785 () Bool)

(declare-fun +!274 (ListLongMap!2291 tuple2!3382) ListLongMap!2291)

(assert (=> bm!18452 (= call!18456 (+!274 (ite c!32785 call!18458 (ite c!32787 call!18457 call!18460)) (ite (or c!32785 c!32787) (tuple2!3383 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3582 thiss!1248)) (tuple2!3383 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3582 thiss!1248)))))))

(declare-fun b!182924 () Bool)

(declare-fun e!120420 () ListLongMap!2291)

(assert (=> b!182924 (= e!120420 (+!274 call!18456 (tuple2!3383 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3582 thiss!1248))))))

(declare-fun b!182925 () Bool)

(assert (=> b!182925 (= e!120420 e!120423)))

(assert (=> b!182925 (= c!32787 (and (not (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!182926 () Bool)

(declare-fun res!86578 () Bool)

(declare-fun e!120417 () Bool)

(assert (=> b!182926 (=> (not res!86578) (not e!120417))))

(declare-fun e!120424 () Bool)

(assert (=> b!182926 (= res!86578 e!120424)))

(declare-fun res!86575 () Bool)

(assert (=> b!182926 (=> res!86575 e!120424)))

(declare-fun e!120422 () Bool)

(assert (=> b!182926 (= res!86575 (not e!120422))))

(declare-fun res!86573 () Bool)

(assert (=> b!182926 (=> (not res!86573) (not e!120422))))

(assert (=> b!182926 (= res!86573 (bvslt #b00000000000000000000000000000000 (size!3971 (_keys!5655 thiss!1248))))))

(declare-fun d!54533 () Bool)

(assert (=> d!54533 e!120417))

(declare-fun res!86579 () Bool)

(assert (=> d!54533 (=> (not res!86579) (not e!120417))))

(assert (=> d!54533 (= res!86579 (or (bvsge #b00000000000000000000000000000000 (size!3971 (_keys!5655 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3971 (_keys!5655 thiss!1248))))))))

(declare-fun lt!90312 () ListLongMap!2291)

(assert (=> d!54533 (= lt!90330 lt!90312)))

(declare-fun lt!90323 () Unit!5511)

(declare-fun e!120426 () Unit!5511)

(assert (=> d!54533 (= lt!90323 e!120426)))

(declare-fun c!32788 () Bool)

(declare-fun e!120428 () Bool)

(assert (=> d!54533 (= c!32788 e!120428)))

(declare-fun res!86580 () Bool)

(assert (=> d!54533 (=> (not res!86580) (not e!120428))))

(assert (=> d!54533 (= res!86580 (bvslt #b00000000000000000000000000000000 (size!3971 (_keys!5655 thiss!1248))))))

(assert (=> d!54533 (= lt!90312 e!120420)))

(assert (=> d!54533 (= c!32785 (and (not (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54533 (validMask!0 (mask!8793 thiss!1248))))

(assert (=> d!54533 (= (getCurrentListMap!794 (_keys!5655 thiss!1248) (_values!3724 thiss!1248) (mask!8793 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)) lt!90330)))

(declare-fun b!182927 () Bool)

(declare-fun lt!90326 () Unit!5511)

(assert (=> b!182927 (= e!120426 lt!90326)))

(declare-fun lt!90325 () ListLongMap!2291)

(declare-fun getCurrentListMapNoExtraKeys!178 (array!7739 array!7741 (_ BitVec 32) (_ BitVec 32) V!5361 V!5361 (_ BitVec 32) Int) ListLongMap!2291)

(assert (=> b!182927 (= lt!90325 (getCurrentListMapNoExtraKeys!178 (_keys!5655 thiss!1248) (_values!3724 thiss!1248) (mask!8793 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)))))

(declare-fun lt!90329 () (_ BitVec 64))

(assert (=> b!182927 (= lt!90329 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90314 () (_ BitVec 64))

(assert (=> b!182927 (= lt!90314 (select (arr!3658 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90327 () Unit!5511)

(declare-fun addStillContains!133 (ListLongMap!2291 (_ BitVec 64) V!5361 (_ BitVec 64)) Unit!5511)

(assert (=> b!182927 (= lt!90327 (addStillContains!133 lt!90325 lt!90329 (zeroValue!3582 thiss!1248) lt!90314))))

(assert (=> b!182927 (contains!1252 (+!274 lt!90325 (tuple2!3383 lt!90329 (zeroValue!3582 thiss!1248))) lt!90314)))

(declare-fun lt!90313 () Unit!5511)

(assert (=> b!182927 (= lt!90313 lt!90327)))

(declare-fun lt!90311 () ListLongMap!2291)

(assert (=> b!182927 (= lt!90311 (getCurrentListMapNoExtraKeys!178 (_keys!5655 thiss!1248) (_values!3724 thiss!1248) (mask!8793 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)))))

(declare-fun lt!90319 () (_ BitVec 64))

(assert (=> b!182927 (= lt!90319 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90309 () (_ BitVec 64))

(assert (=> b!182927 (= lt!90309 (select (arr!3658 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90321 () Unit!5511)

(declare-fun addApplyDifferent!133 (ListLongMap!2291 (_ BitVec 64) V!5361 (_ BitVec 64)) Unit!5511)

(assert (=> b!182927 (= lt!90321 (addApplyDifferent!133 lt!90311 lt!90319 (minValue!3582 thiss!1248) lt!90309))))

(assert (=> b!182927 (= (apply!157 (+!274 lt!90311 (tuple2!3383 lt!90319 (minValue!3582 thiss!1248))) lt!90309) (apply!157 lt!90311 lt!90309))))

(declare-fun lt!90317 () Unit!5511)

(assert (=> b!182927 (= lt!90317 lt!90321)))

(declare-fun lt!90318 () ListLongMap!2291)

(assert (=> b!182927 (= lt!90318 (getCurrentListMapNoExtraKeys!178 (_keys!5655 thiss!1248) (_values!3724 thiss!1248) (mask!8793 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)))))

(declare-fun lt!90324 () (_ BitVec 64))

(assert (=> b!182927 (= lt!90324 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90320 () (_ BitVec 64))

(assert (=> b!182927 (= lt!90320 (select (arr!3658 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90310 () Unit!5511)

(assert (=> b!182927 (= lt!90310 (addApplyDifferent!133 lt!90318 lt!90324 (zeroValue!3582 thiss!1248) lt!90320))))

(assert (=> b!182927 (= (apply!157 (+!274 lt!90318 (tuple2!3383 lt!90324 (zeroValue!3582 thiss!1248))) lt!90320) (apply!157 lt!90318 lt!90320))))

(declare-fun lt!90322 () Unit!5511)

(assert (=> b!182927 (= lt!90322 lt!90310)))

(declare-fun lt!90316 () ListLongMap!2291)

(assert (=> b!182927 (= lt!90316 (getCurrentListMapNoExtraKeys!178 (_keys!5655 thiss!1248) (_values!3724 thiss!1248) (mask!8793 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)))))

(declare-fun lt!90328 () (_ BitVec 64))

(assert (=> b!182927 (= lt!90328 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90315 () (_ BitVec 64))

(assert (=> b!182927 (= lt!90315 (select (arr!3658 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182927 (= lt!90326 (addApplyDifferent!133 lt!90316 lt!90328 (minValue!3582 thiss!1248) lt!90315))))

(assert (=> b!182927 (= (apply!157 (+!274 lt!90316 (tuple2!3383 lt!90328 (minValue!3582 thiss!1248))) lt!90315) (apply!157 lt!90316 lt!90315))))

(declare-fun b!182928 () Bool)

(declare-fun e!120425 () Bool)

(declare-fun e!120427 () Bool)

(assert (=> b!182928 (= e!120425 e!120427)))

(declare-fun res!86574 () Bool)

(declare-fun call!18454 () Bool)

(assert (=> b!182928 (= res!86574 call!18454)))

(assert (=> b!182928 (=> (not res!86574) (not e!120427))))

(declare-fun bm!18453 () Bool)

(assert (=> bm!18453 (= call!18457 call!18458)))

(declare-fun b!182929 () Bool)

(declare-fun e!120419 () Bool)

(assert (=> b!182929 (= e!120419 (= (apply!157 lt!90330 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3582 thiss!1248)))))

(declare-fun b!182930 () Bool)

(declare-fun Unit!5514 () Unit!5511)

(assert (=> b!182930 (= e!120426 Unit!5514)))

(declare-fun bm!18454 () Bool)

(assert (=> bm!18454 (= call!18459 (contains!1252 lt!90330 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18455 () Bool)

(declare-fun call!18455 () ListLongMap!2291)

(assert (=> bm!18455 (= call!18455 call!18456)))

(declare-fun b!182931 () Bool)

(assert (=> b!182931 (= e!120428 (validKeyInArray!0 (select (arr!3658 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182932 () Bool)

(assert (=> b!182932 (= e!120429 call!18455)))

(declare-fun b!182933 () Bool)

(assert (=> b!182933 (= e!120429 call!18460)))

(declare-fun b!182934 () Bool)

(assert (=> b!182934 (= e!120427 (= (apply!157 lt!90330 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3582 thiss!1248)))))

(declare-fun b!182935 () Bool)

(assert (=> b!182935 (= e!120425 (not call!18454))))

(declare-fun b!182936 () Bool)

(assert (=> b!182936 (= e!120424 e!120421)))

(declare-fun res!86577 () Bool)

(assert (=> b!182936 (=> (not res!86577) (not e!120421))))

(assert (=> b!182936 (= res!86577 (contains!1252 lt!90330 (select (arr!3658 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182936 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3971 (_keys!5655 thiss!1248))))))

(declare-fun b!182937 () Bool)

(assert (=> b!182937 (= e!120423 call!18455)))

(declare-fun b!182938 () Bool)

(assert (=> b!182938 (= e!120417 e!120425)))

(declare-fun c!32783 () Bool)

(assert (=> b!182938 (= c!32783 (not (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!182939 () Bool)

(assert (=> b!182939 (= e!120422 (validKeyInArray!0 (select (arr!3658 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18456 () Bool)

(assert (=> bm!18456 (= call!18458 (getCurrentListMapNoExtraKeys!178 (_keys!5655 thiss!1248) (_values!3724 thiss!1248) (mask!8793 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)))))

(declare-fun b!182940 () Bool)

(declare-fun res!86581 () Bool)

(assert (=> b!182940 (=> (not res!86581) (not e!120417))))

(assert (=> b!182940 (= res!86581 e!120418)))

(declare-fun c!32784 () Bool)

(assert (=> b!182940 (= c!32784 (not (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!18457 () Bool)

(assert (=> bm!18457 (= call!18454 (contains!1252 lt!90330 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182941 () Bool)

(assert (=> b!182941 (= e!120418 e!120419)))

(declare-fun res!86576 () Bool)

(assert (=> b!182941 (= res!86576 call!18459)))

(assert (=> b!182941 (=> (not res!86576) (not e!120419))))

(assert (= (and d!54533 c!32785) b!182924))

(assert (= (and d!54533 (not c!32785)) b!182925))

(assert (= (and b!182925 c!32787) b!182937))

(assert (= (and b!182925 (not c!32787)) b!182921))

(assert (= (and b!182921 c!32786) b!182932))

(assert (= (and b!182921 (not c!32786)) b!182933))

(assert (= (or b!182932 b!182933) bm!18451))

(assert (= (or b!182937 bm!18451) bm!18453))

(assert (= (or b!182937 b!182932) bm!18455))

(assert (= (or b!182924 bm!18453) bm!18456))

(assert (= (or b!182924 bm!18455) bm!18452))

(assert (= (and d!54533 res!86580) b!182931))

(assert (= (and d!54533 c!32788) b!182927))

(assert (= (and d!54533 (not c!32788)) b!182930))

(assert (= (and d!54533 res!86579) b!182926))

(assert (= (and b!182926 res!86573) b!182939))

(assert (= (and b!182926 (not res!86575)) b!182936))

(assert (= (and b!182936 res!86577) b!182922))

(assert (= (and b!182926 res!86578) b!182940))

(assert (= (and b!182940 c!32784) b!182941))

(assert (= (and b!182940 (not c!32784)) b!182923))

(assert (= (and b!182941 res!86576) b!182929))

(assert (= (or b!182941 b!182923) bm!18454))

(assert (= (and b!182940 res!86581) b!182938))

(assert (= (and b!182938 c!32783) b!182928))

(assert (= (and b!182938 (not c!32783)) b!182935))

(assert (= (and b!182928 res!86574) b!182934))

(assert (= (or b!182928 b!182935) bm!18457))

(declare-fun b_lambda!7165 () Bool)

(assert (=> (not b_lambda!7165) (not b!182922)))

(declare-fun t!7183 () Bool)

(declare-fun tb!2817 () Bool)

(assert (=> (and b!182752 (= (defaultEntry!3741 thiss!1248) (defaultEntry!3741 thiss!1248)) t!7183) tb!2817))

(declare-fun result!4745 () Bool)

(assert (=> tb!2817 (= result!4745 tp_is_empty!4285)))

(assert (=> b!182922 t!7183))

(declare-fun b_and!11059 () Bool)

(assert (= b_and!11053 (and (=> t!7183 result!4745) b_and!11059)))

(declare-fun m!210013 () Bool)

(assert (=> b!182929 m!210013))

(assert (=> b!182936 m!209979))

(assert (=> b!182936 m!209979))

(declare-fun m!210015 () Bool)

(assert (=> b!182936 m!210015))

(assert (=> d!54533 m!209927))

(assert (=> b!182939 m!209979))

(assert (=> b!182939 m!209979))

(assert (=> b!182939 m!209985))

(declare-fun m!210017 () Bool)

(assert (=> bm!18456 m!210017))

(declare-fun m!210019 () Bool)

(assert (=> bm!18452 m!210019))

(declare-fun m!210021 () Bool)

(assert (=> b!182934 m!210021))

(declare-fun m!210023 () Bool)

(assert (=> bm!18457 m!210023))

(declare-fun m!210025 () Bool)

(assert (=> b!182922 m!210025))

(assert (=> b!182922 m!210025))

(declare-fun m!210027 () Bool)

(assert (=> b!182922 m!210027))

(declare-fun m!210029 () Bool)

(assert (=> b!182922 m!210029))

(assert (=> b!182922 m!210027))

(assert (=> b!182922 m!209979))

(declare-fun m!210031 () Bool)

(assert (=> b!182922 m!210031))

(assert (=> b!182922 m!209979))

(assert (=> b!182931 m!209979))

(assert (=> b!182931 m!209979))

(assert (=> b!182931 m!209985))

(declare-fun m!210033 () Bool)

(assert (=> b!182924 m!210033))

(declare-fun m!210035 () Bool)

(assert (=> bm!18454 m!210035))

(declare-fun m!210037 () Bool)

(assert (=> b!182927 m!210037))

(declare-fun m!210039 () Bool)

(assert (=> b!182927 m!210039))

(declare-fun m!210041 () Bool)

(assert (=> b!182927 m!210041))

(declare-fun m!210043 () Bool)

(assert (=> b!182927 m!210043))

(declare-fun m!210045 () Bool)

(assert (=> b!182927 m!210045))

(assert (=> b!182927 m!209979))

(assert (=> b!182927 m!210041))

(declare-fun m!210047 () Bool)

(assert (=> b!182927 m!210047))

(declare-fun m!210049 () Bool)

(assert (=> b!182927 m!210049))

(declare-fun m!210051 () Bool)

(assert (=> b!182927 m!210051))

(declare-fun m!210053 () Bool)

(assert (=> b!182927 m!210053))

(declare-fun m!210055 () Bool)

(assert (=> b!182927 m!210055))

(assert (=> b!182927 m!210053))

(declare-fun m!210057 () Bool)

(assert (=> b!182927 m!210057))

(declare-fun m!210059 () Bool)

(assert (=> b!182927 m!210059))

(declare-fun m!210061 () Bool)

(assert (=> b!182927 m!210061))

(declare-fun m!210063 () Bool)

(assert (=> b!182927 m!210063))

(assert (=> b!182927 m!210059))

(declare-fun m!210065 () Bool)

(assert (=> b!182927 m!210065))

(assert (=> b!182927 m!210017))

(assert (=> b!182927 m!210049))

(assert (=> b!182749 d!54533))

(declare-fun b!182952 () Bool)

(declare-fun e!120438 () Bool)

(declare-fun call!18463 () Bool)

(assert (=> b!182952 (= e!120438 call!18463)))

(declare-fun b!182953 () Bool)

(declare-fun e!120436 () Bool)

(assert (=> b!182953 (= e!120436 call!18463)))

(declare-fun b!182954 () Bool)

(assert (=> b!182954 (= e!120438 e!120436)))

(declare-fun lt!90338 () (_ BitVec 64))

(assert (=> b!182954 (= lt!90338 (select (arr!3658 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90339 () Unit!5511)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7739 (_ BitVec 64) (_ BitVec 32)) Unit!5511)

(assert (=> b!182954 (= lt!90339 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5655 thiss!1248) lt!90338 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!182954 (arrayContainsKey!0 (_keys!5655 thiss!1248) lt!90338 #b00000000000000000000000000000000)))

(declare-fun lt!90337 () Unit!5511)

(assert (=> b!182954 (= lt!90337 lt!90339)))

(declare-fun res!86586 () Bool)

(assert (=> b!182954 (= res!86586 (= (seekEntryOrOpen!0 (select (arr!3658 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000) (_keys!5655 thiss!1248) (mask!8793 thiss!1248)) (Found!620 #b00000000000000000000000000000000)))))

(assert (=> b!182954 (=> (not res!86586) (not e!120436))))

(declare-fun d!54535 () Bool)

(declare-fun res!86587 () Bool)

(declare-fun e!120437 () Bool)

(assert (=> d!54535 (=> res!86587 e!120437)))

(assert (=> d!54535 (= res!86587 (bvsge #b00000000000000000000000000000000 (size!3971 (_keys!5655 thiss!1248))))))

(assert (=> d!54535 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5655 thiss!1248) (mask!8793 thiss!1248)) e!120437)))

(declare-fun bm!18460 () Bool)

(assert (=> bm!18460 (= call!18463 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5655 thiss!1248) (mask!8793 thiss!1248)))))

(declare-fun b!182955 () Bool)

(assert (=> b!182955 (= e!120437 e!120438)))

(declare-fun c!32791 () Bool)

(assert (=> b!182955 (= c!32791 (validKeyInArray!0 (select (arr!3658 (_keys!5655 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54535 (not res!86587)) b!182955))

(assert (= (and b!182955 c!32791) b!182954))

(assert (= (and b!182955 (not c!32791)) b!182952))

(assert (= (and b!182954 res!86586) b!182953))

(assert (= (or b!182953 b!182952) bm!18460))

(assert (=> b!182954 m!209979))

(declare-fun m!210067 () Bool)

(assert (=> b!182954 m!210067))

(declare-fun m!210069 () Bool)

(assert (=> b!182954 m!210069))

(assert (=> b!182954 m!209979))

(declare-fun m!210071 () Bool)

(assert (=> b!182954 m!210071))

(declare-fun m!210073 () Bool)

(assert (=> bm!18460 m!210073))

(assert (=> b!182955 m!209979))

(assert (=> b!182955 m!209979))

(assert (=> b!182955 m!209985))

(assert (=> b!182750 d!54535))

(declare-fun mapNonEmpty!7364 () Bool)

(declare-fun mapRes!7364 () Bool)

(declare-fun tp!16319 () Bool)

(declare-fun e!120443 () Bool)

(assert (=> mapNonEmpty!7364 (= mapRes!7364 (and tp!16319 e!120443))))

(declare-fun mapRest!7364 () (Array (_ BitVec 32) ValueCell!1799))

(declare-fun mapValue!7364 () ValueCell!1799)

(declare-fun mapKey!7364 () (_ BitVec 32))

(assert (=> mapNonEmpty!7364 (= mapRest!7355 (store mapRest!7364 mapKey!7364 mapValue!7364))))

(declare-fun mapIsEmpty!7364 () Bool)

(assert (=> mapIsEmpty!7364 mapRes!7364))

(declare-fun b!182962 () Bool)

(assert (=> b!182962 (= e!120443 tp_is_empty!4285)))

(declare-fun b!182963 () Bool)

(declare-fun e!120444 () Bool)

(assert (=> b!182963 (= e!120444 tp_is_empty!4285)))

(declare-fun condMapEmpty!7364 () Bool)

(declare-fun mapDefault!7364 () ValueCell!1799)

(assert (=> mapNonEmpty!7355 (= condMapEmpty!7364 (= mapRest!7355 ((as const (Array (_ BitVec 32) ValueCell!1799)) mapDefault!7364)))))

(assert (=> mapNonEmpty!7355 (= tp!16304 (and e!120444 mapRes!7364))))

(assert (= (and mapNonEmpty!7355 condMapEmpty!7364) mapIsEmpty!7364))

(assert (= (and mapNonEmpty!7355 (not condMapEmpty!7364)) mapNonEmpty!7364))

(assert (= (and mapNonEmpty!7364 ((_ is ValueCellFull!1799) mapValue!7364)) b!182962))

(assert (= (and mapNonEmpty!7355 ((_ is ValueCellFull!1799) mapDefault!7364)) b!182963))

(declare-fun m!210075 () Bool)

(assert (=> mapNonEmpty!7364 m!210075))

(declare-fun b_lambda!7167 () Bool)

(assert (= b_lambda!7165 (or (and b!182752 b_free!4513) b_lambda!7167)))

(check-sat tp_is_empty!4285 (not b!182838) (not bm!18457) (not b!182955) (not b!182931) (not bm!18460) (not d!54529) (not b!182876) (not b!182929) (not b!182922) (not b!182839) (not b!182869) (not b!182850) (not bm!18452) (not b_lambda!7167) (not b_next!4513) (not b!182924) (not b!182954) b_and!11059 (not b!182849) (not b!182939) (not bm!18456) (not d!54531) (not bm!18454) (not b!182878) (not d!54533) (not mapNonEmpty!7364) (not b!182927) (not d!54519) (not bm!18436) (not b!182936) (not b!182840) (not b!182851) (not b!182934))
(check-sat b_and!11059 (not b_next!4513))
