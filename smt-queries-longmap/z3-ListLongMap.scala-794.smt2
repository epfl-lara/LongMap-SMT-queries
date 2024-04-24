; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18976 () Bool)

(assert start!18976)

(declare-fun b!187125 () Bool)

(declare-fun b_free!4603 () Bool)

(declare-fun b_next!4603 () Bool)

(assert (=> b!187125 (= b_free!4603 (not b_next!4603))))

(declare-fun tp!16619 () Bool)

(declare-fun b_and!11233 () Bool)

(assert (=> b!187125 (= tp!16619 b_and!11233)))

(declare-fun e!123142 () Bool)

(declare-datatypes ((V!5481 0))(
  ( (V!5482 (val!2232 Int)) )
))
(declare-datatypes ((ValueCell!1844 0))(
  ( (ValueCellFull!1844 (v!4147 V!5481)) (EmptyCell!1844) )
))
(declare-datatypes ((array!7951 0))(
  ( (array!7952 (arr!3752 (Array (_ BitVec 32) (_ BitVec 64))) (size!4070 (_ BitVec 32))) )
))
(declare-datatypes ((array!7953 0))(
  ( (array!7954 (arr!3753 (Array (_ BitVec 32) ValueCell!1844)) (size!4071 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2596 0))(
  ( (LongMapFixedSize!2597 (defaultEntry!3815 Int) (mask!8955 (_ BitVec 32)) (extraKeys!3552 (_ BitVec 32)) (zeroValue!3656 V!5481) (minValue!3656 V!5481) (_size!1347 (_ BitVec 32)) (_keys!5765 array!7951) (_values!3798 array!7953) (_vacant!1347 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2596)

(declare-fun tp_is_empty!4375 () Bool)

(declare-fun e!123141 () Bool)

(declare-fun array_inv!2421 (array!7951) Bool)

(declare-fun array_inv!2422 (array!7953) Bool)

(assert (=> b!187125 (= e!123141 (and tp!16619 tp_is_empty!4375 (array_inv!2421 (_keys!5765 thiss!1248)) (array_inv!2422 (_values!3798 thiss!1248)) e!123142))))

(declare-fun b!187126 () Bool)

(declare-fun e!123139 () Bool)

(declare-fun mapRes!7535 () Bool)

(assert (=> b!187126 (= e!123142 (and e!123139 mapRes!7535))))

(declare-fun condMapEmpty!7535 () Bool)

(declare-fun mapDefault!7535 () ValueCell!1844)

(assert (=> b!187126 (= condMapEmpty!7535 (= (arr!3753 (_values!3798 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1844)) mapDefault!7535)))))

(declare-fun b!187127 () Bool)

(declare-fun e!123135 () Bool)

(assert (=> b!187127 (= e!123135 tp_is_empty!4375)))

(declare-fun b!187128 () Bool)

(assert (=> b!187128 (= e!123139 tp_is_empty!4375)))

(declare-fun b!187129 () Bool)

(declare-fun e!123134 () Bool)

(declare-fun e!123137 () Bool)

(assert (=> b!187129 (= e!123134 e!123137)))

(declare-fun res!88493 () Bool)

(assert (=> b!187129 (=> (not res!88493) (not e!123137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!187129 (= res!88493 (validMask!0 (mask!8955 thiss!1248)))))

(declare-datatypes ((Unit!5640 0))(
  ( (Unit!5641) )
))
(declare-fun lt!92592 () Unit!5640)

(declare-fun e!123143 () Unit!5640)

(assert (=> b!187129 (= lt!92592 e!123143)))

(declare-fun c!33595 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3424 0))(
  ( (tuple2!3425 (_1!1723 (_ BitVec 64)) (_2!1723 V!5481)) )
))
(declare-datatypes ((List!2347 0))(
  ( (Nil!2344) (Cons!2343 (h!2978 tuple2!3424) (t!7229 List!2347)) )
))
(declare-datatypes ((ListLongMap!2345 0))(
  ( (ListLongMap!2346 (toList!1188 List!2347)) )
))
(declare-fun contains!1300 (ListLongMap!2345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!840 (array!7951 array!7953 (_ BitVec 32) (_ BitVec 32) V!5481 V!5481 (_ BitVec 32) Int) ListLongMap!2345)

(assert (=> b!187129 (= c!33595 (contains!1300 (getCurrentListMap!840 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)) key!828))))

(declare-fun b!187130 () Bool)

(assert (=> b!187130 (= e!123137 (and (= (size!4071 (_values!3798 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8955 thiss!1248))) (= (size!4070 (_keys!5765 thiss!1248)) (size!4071 (_values!3798 thiss!1248))) (bvslt (mask!8955 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!187131 () Bool)

(declare-fun Unit!5642 () Unit!5640)

(assert (=> b!187131 (= e!123143 Unit!5642)))

(declare-fun lt!92594 () Unit!5640)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!145 (array!7951 array!7953 (_ BitVec 32) (_ BitVec 32) V!5481 V!5481 (_ BitVec 64) Int) Unit!5640)

(assert (=> b!187131 (= lt!92594 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!145 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) key!828 (defaultEntry!3815 thiss!1248)))))

(assert (=> b!187131 false))

(declare-fun b!187132 () Bool)

(declare-fun lt!92595 () Unit!5640)

(assert (=> b!187132 (= e!123143 lt!92595)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!152 (array!7951 array!7953 (_ BitVec 32) (_ BitVec 32) V!5481 V!5481 (_ BitVec 64) Int) Unit!5640)

(assert (=> b!187132 (= lt!92595 (lemmaInListMapThenSeekEntryOrOpenFindsIt!152 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) key!828 (defaultEntry!3815 thiss!1248)))))

(declare-fun res!88495 () Bool)

(declare-datatypes ((SeekEntryResult!636 0))(
  ( (MissingZero!636 (index!4714 (_ BitVec 32))) (Found!636 (index!4715 (_ BitVec 32))) (Intermediate!636 (undefined!1448 Bool) (index!4716 (_ BitVec 32)) (x!20252 (_ BitVec 32))) (Undefined!636) (MissingVacant!636 (index!4717 (_ BitVec 32))) )
))
(declare-fun lt!92593 () SeekEntryResult!636)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187132 (= res!88495 (inRange!0 (index!4715 lt!92593) (mask!8955 thiss!1248)))))

(declare-fun e!123136 () Bool)

(assert (=> b!187132 (=> (not res!88495) (not e!123136))))

(assert (=> b!187132 e!123136))

(declare-fun mapIsEmpty!7535 () Bool)

(assert (=> mapIsEmpty!7535 mapRes!7535))

(declare-fun res!88496 () Bool)

(declare-fun e!123138 () Bool)

(assert (=> start!18976 (=> (not res!88496) (not e!123138))))

(declare-fun valid!1094 (LongMapFixedSize!2596) Bool)

(assert (=> start!18976 (= res!88496 (valid!1094 thiss!1248))))

(assert (=> start!18976 e!123138))

(assert (=> start!18976 e!123141))

(assert (=> start!18976 true))

(declare-fun mapNonEmpty!7535 () Bool)

(declare-fun tp!16618 () Bool)

(assert (=> mapNonEmpty!7535 (= mapRes!7535 (and tp!16618 e!123135))))

(declare-fun mapKey!7535 () (_ BitVec 32))

(declare-fun mapValue!7535 () ValueCell!1844)

(declare-fun mapRest!7535 () (Array (_ BitVec 32) ValueCell!1844))

(assert (=> mapNonEmpty!7535 (= (arr!3753 (_values!3798 thiss!1248)) (store mapRest!7535 mapKey!7535 mapValue!7535))))

(declare-fun b!187133 () Bool)

(assert (=> b!187133 (= e!123138 e!123134)))

(declare-fun res!88494 () Bool)

(assert (=> b!187133 (=> (not res!88494) (not e!123134))))

(get-info :version)

(assert (=> b!187133 (= res!88494 (and (not ((_ is Undefined!636) lt!92593)) (not ((_ is MissingVacant!636) lt!92593)) (not ((_ is MissingZero!636) lt!92593)) ((_ is Found!636) lt!92593)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7951 (_ BitVec 32)) SeekEntryResult!636)

(assert (=> b!187133 (= lt!92593 (seekEntryOrOpen!0 key!828 (_keys!5765 thiss!1248) (mask!8955 thiss!1248)))))

(declare-fun b!187134 () Bool)

(assert (=> b!187134 (= e!123136 (= (select (arr!3752 (_keys!5765 thiss!1248)) (index!4715 lt!92593)) key!828))))

(declare-fun b!187135 () Bool)

(declare-fun res!88497 () Bool)

(assert (=> b!187135 (=> (not res!88497) (not e!123138))))

(assert (=> b!187135 (= res!88497 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!18976 res!88496) b!187135))

(assert (= (and b!187135 res!88497) b!187133))

(assert (= (and b!187133 res!88494) b!187129))

(assert (= (and b!187129 c!33595) b!187132))

(assert (= (and b!187129 (not c!33595)) b!187131))

(assert (= (and b!187132 res!88495) b!187134))

(assert (= (and b!187129 res!88493) b!187130))

(assert (= (and b!187126 condMapEmpty!7535) mapIsEmpty!7535))

(assert (= (and b!187126 (not condMapEmpty!7535)) mapNonEmpty!7535))

(assert (= (and mapNonEmpty!7535 ((_ is ValueCellFull!1844) mapValue!7535)) b!187127))

(assert (= (and b!187126 ((_ is ValueCellFull!1844) mapDefault!7535)) b!187128))

(assert (= b!187125 b!187126))

(assert (= start!18976 b!187125))

(declare-fun m!214149 () Bool)

(assert (=> b!187125 m!214149))

(declare-fun m!214151 () Bool)

(assert (=> b!187125 m!214151))

(declare-fun m!214153 () Bool)

(assert (=> start!18976 m!214153))

(declare-fun m!214155 () Bool)

(assert (=> b!187133 m!214155))

(declare-fun m!214157 () Bool)

(assert (=> mapNonEmpty!7535 m!214157))

(declare-fun m!214159 () Bool)

(assert (=> b!187134 m!214159))

(declare-fun m!214161 () Bool)

(assert (=> b!187129 m!214161))

(declare-fun m!214163 () Bool)

(assert (=> b!187129 m!214163))

(assert (=> b!187129 m!214163))

(declare-fun m!214165 () Bool)

(assert (=> b!187129 m!214165))

(declare-fun m!214167 () Bool)

(assert (=> b!187132 m!214167))

(declare-fun m!214169 () Bool)

(assert (=> b!187132 m!214169))

(declare-fun m!214171 () Bool)

(assert (=> b!187131 m!214171))

(check-sat (not b!187129) (not b!187132) (not b!187125) b_and!11233 (not b_next!4603) (not b!187131) (not start!18976) (not b!187133) (not mapNonEmpty!7535) tp_is_empty!4375)
(check-sat b_and!11233 (not b_next!4603))
(get-model)

(declare-fun d!55451 () Bool)

(declare-fun res!88534 () Bool)

(declare-fun e!123206 () Bool)

(assert (=> d!55451 (=> (not res!88534) (not e!123206))))

(declare-fun simpleValid!186 (LongMapFixedSize!2596) Bool)

(assert (=> d!55451 (= res!88534 (simpleValid!186 thiss!1248))))

(assert (=> d!55451 (= (valid!1094 thiss!1248) e!123206)))

(declare-fun b!187208 () Bool)

(declare-fun res!88535 () Bool)

(assert (=> b!187208 (=> (not res!88535) (not e!123206))))

(declare-fun arrayCountValidKeys!0 (array!7951 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!187208 (= res!88535 (= (arrayCountValidKeys!0 (_keys!5765 thiss!1248) #b00000000000000000000000000000000 (size!4070 (_keys!5765 thiss!1248))) (_size!1347 thiss!1248)))))

(declare-fun b!187209 () Bool)

(declare-fun res!88536 () Bool)

(assert (=> b!187209 (=> (not res!88536) (not e!123206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7951 (_ BitVec 32)) Bool)

(assert (=> b!187209 (= res!88536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5765 thiss!1248) (mask!8955 thiss!1248)))))

(declare-fun b!187210 () Bool)

(declare-datatypes ((List!2348 0))(
  ( (Nil!2345) (Cons!2344 (h!2979 (_ BitVec 64)) (t!7232 List!2348)) )
))
(declare-fun arrayNoDuplicates!0 (array!7951 (_ BitVec 32) List!2348) Bool)

(assert (=> b!187210 (= e!123206 (arrayNoDuplicates!0 (_keys!5765 thiss!1248) #b00000000000000000000000000000000 Nil!2345))))

(assert (= (and d!55451 res!88534) b!187208))

(assert (= (and b!187208 res!88535) b!187209))

(assert (= (and b!187209 res!88536) b!187210))

(declare-fun m!214221 () Bool)

(assert (=> d!55451 m!214221))

(declare-fun m!214223 () Bool)

(assert (=> b!187208 m!214223))

(declare-fun m!214225 () Bool)

(assert (=> b!187209 m!214225))

(declare-fun m!214227 () Bool)

(assert (=> b!187210 m!214227))

(assert (=> start!18976 d!55451))

(declare-fun d!55453 () Bool)

(assert (=> d!55453 (= (validMask!0 (mask!8955 thiss!1248)) (and (or (= (mask!8955 thiss!1248) #b00000000000000000000000000000111) (= (mask!8955 thiss!1248) #b00000000000000000000000000001111) (= (mask!8955 thiss!1248) #b00000000000000000000000000011111) (= (mask!8955 thiss!1248) #b00000000000000000000000000111111) (= (mask!8955 thiss!1248) #b00000000000000000000000001111111) (= (mask!8955 thiss!1248) #b00000000000000000000000011111111) (= (mask!8955 thiss!1248) #b00000000000000000000000111111111) (= (mask!8955 thiss!1248) #b00000000000000000000001111111111) (= (mask!8955 thiss!1248) #b00000000000000000000011111111111) (= (mask!8955 thiss!1248) #b00000000000000000000111111111111) (= (mask!8955 thiss!1248) #b00000000000000000001111111111111) (= (mask!8955 thiss!1248) #b00000000000000000011111111111111) (= (mask!8955 thiss!1248) #b00000000000000000111111111111111) (= (mask!8955 thiss!1248) #b00000000000000001111111111111111) (= (mask!8955 thiss!1248) #b00000000000000011111111111111111) (= (mask!8955 thiss!1248) #b00000000000000111111111111111111) (= (mask!8955 thiss!1248) #b00000000000001111111111111111111) (= (mask!8955 thiss!1248) #b00000000000011111111111111111111) (= (mask!8955 thiss!1248) #b00000000000111111111111111111111) (= (mask!8955 thiss!1248) #b00000000001111111111111111111111) (= (mask!8955 thiss!1248) #b00000000011111111111111111111111) (= (mask!8955 thiss!1248) #b00000000111111111111111111111111) (= (mask!8955 thiss!1248) #b00000001111111111111111111111111) (= (mask!8955 thiss!1248) #b00000011111111111111111111111111) (= (mask!8955 thiss!1248) #b00000111111111111111111111111111) (= (mask!8955 thiss!1248) #b00001111111111111111111111111111) (= (mask!8955 thiss!1248) #b00011111111111111111111111111111) (= (mask!8955 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8955 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!187129 d!55453))

(declare-fun d!55455 () Bool)

(declare-fun e!123212 () Bool)

(assert (=> d!55455 e!123212))

(declare-fun res!88539 () Bool)

(assert (=> d!55455 (=> res!88539 e!123212)))

(declare-fun lt!92630 () Bool)

(assert (=> d!55455 (= res!88539 (not lt!92630))))

(declare-fun lt!92628 () Bool)

(assert (=> d!55455 (= lt!92630 lt!92628)))

(declare-fun lt!92631 () Unit!5640)

(declare-fun e!123211 () Unit!5640)

(assert (=> d!55455 (= lt!92631 e!123211)))

(declare-fun c!33604 () Bool)

(assert (=> d!55455 (= c!33604 lt!92628)))

(declare-fun containsKey!231 (List!2347 (_ BitVec 64)) Bool)

(assert (=> d!55455 (= lt!92628 (containsKey!231 (toList!1188 (getCurrentListMap!840 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248))) key!828))))

(assert (=> d!55455 (= (contains!1300 (getCurrentListMap!840 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)) key!828) lt!92630)))

(declare-fun b!187217 () Bool)

(declare-fun lt!92629 () Unit!5640)

(assert (=> b!187217 (= e!123211 lt!92629)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!179 (List!2347 (_ BitVec 64)) Unit!5640)

(assert (=> b!187217 (= lt!92629 (lemmaContainsKeyImpliesGetValueByKeyDefined!179 (toList!1188 (getCurrentListMap!840 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248))) key!828))))

(declare-datatypes ((Option!234 0))(
  ( (Some!233 (v!4150 V!5481)) (None!232) )
))
(declare-fun isDefined!180 (Option!234) Bool)

(declare-fun getValueByKey!228 (List!2347 (_ BitVec 64)) Option!234)

(assert (=> b!187217 (isDefined!180 (getValueByKey!228 (toList!1188 (getCurrentListMap!840 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248))) key!828))))

(declare-fun b!187218 () Bool)

(declare-fun Unit!5649 () Unit!5640)

(assert (=> b!187218 (= e!123211 Unit!5649)))

(declare-fun b!187219 () Bool)

(assert (=> b!187219 (= e!123212 (isDefined!180 (getValueByKey!228 (toList!1188 (getCurrentListMap!840 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248))) key!828)))))

(assert (= (and d!55455 c!33604) b!187217))

(assert (= (and d!55455 (not c!33604)) b!187218))

(assert (= (and d!55455 (not res!88539)) b!187219))

(declare-fun m!214229 () Bool)

(assert (=> d!55455 m!214229))

(declare-fun m!214231 () Bool)

(assert (=> b!187217 m!214231))

(declare-fun m!214233 () Bool)

(assert (=> b!187217 m!214233))

(assert (=> b!187217 m!214233))

(declare-fun m!214235 () Bool)

(assert (=> b!187217 m!214235))

(assert (=> b!187219 m!214233))

(assert (=> b!187219 m!214233))

(assert (=> b!187219 m!214235))

(assert (=> b!187129 d!55455))

(declare-fun b!187262 () Bool)

(declare-fun res!88559 () Bool)

(declare-fun e!123247 () Bool)

(assert (=> b!187262 (=> (not res!88559) (not e!123247))))

(declare-fun e!123242 () Bool)

(assert (=> b!187262 (= res!88559 e!123242)))

(declare-fun c!33622 () Bool)

(assert (=> b!187262 (= c!33622 (not (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!187263 () Bool)

(declare-fun e!123240 () Unit!5640)

(declare-fun Unit!5650 () Unit!5640)

(assert (=> b!187263 (= e!123240 Unit!5650)))

(declare-fun b!187264 () Bool)

(declare-fun e!123251 () Bool)

(assert (=> b!187264 (= e!123242 e!123251)))

(declare-fun res!88562 () Bool)

(declare-fun call!18863 () Bool)

(assert (=> b!187264 (= res!88562 call!18863)))

(assert (=> b!187264 (=> (not res!88562) (not e!123251))))

(declare-fun bm!18856 () Bool)

(declare-fun lt!92680 () ListLongMap!2345)

(assert (=> bm!18856 (= call!18863 (contains!1300 lt!92680 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187265 () Bool)

(declare-fun e!123241 () ListLongMap!2345)

(declare-fun e!123243 () ListLongMap!2345)

(assert (=> b!187265 (= e!123241 e!123243)))

(declare-fun c!33621 () Bool)

(assert (=> b!187265 (= c!33621 (and (not (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!187266 () Bool)

(declare-fun call!18859 () ListLongMap!2345)

(assert (=> b!187266 (= e!123243 call!18859)))

(declare-fun bm!18858 () Bool)

(declare-fun call!18862 () Bool)

(assert (=> bm!18858 (= call!18862 (contains!1300 lt!92680 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187267 () Bool)

(declare-fun c!33617 () Bool)

(assert (=> b!187267 (= c!33617 (and (not (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!123244 () ListLongMap!2345)

(assert (=> b!187267 (= e!123243 e!123244)))

(declare-fun b!187268 () Bool)

(declare-fun e!123250 () Bool)

(assert (=> b!187268 (= e!123247 e!123250)))

(declare-fun c!33620 () Bool)

(assert (=> b!187268 (= c!33620 (not (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!187269 () Bool)

(assert (=> b!187269 (= e!123242 (not call!18863))))

(declare-fun b!187270 () Bool)

(declare-fun e!123246 () Bool)

(assert (=> b!187270 (= e!123250 e!123246)))

(declare-fun res!88563 () Bool)

(assert (=> b!187270 (= res!88563 call!18862)))

(assert (=> b!187270 (=> (not res!88563) (not e!123246))))

(declare-fun b!187271 () Bool)

(declare-fun apply!170 (ListLongMap!2345 (_ BitVec 64)) V!5481)

(assert (=> b!187271 (= e!123251 (= (apply!170 lt!92680 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3656 thiss!1248)))))

(declare-fun bm!18859 () Bool)

(declare-fun call!18860 () ListLongMap!2345)

(declare-fun getCurrentListMapNoExtraKeys!201 (array!7951 array!7953 (_ BitVec 32) (_ BitVec 32) V!5481 V!5481 (_ BitVec 32) Int) ListLongMap!2345)

(assert (=> bm!18859 (= call!18860 (getCurrentListMapNoExtraKeys!201 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)))))

(declare-fun b!187272 () Bool)

(declare-fun call!18864 () ListLongMap!2345)

(assert (=> b!187272 (= e!123244 call!18864)))

(declare-fun bm!18860 () Bool)

(declare-fun call!18861 () ListLongMap!2345)

(assert (=> bm!18860 (= call!18859 call!18861)))

(declare-fun b!187273 () Bool)

(assert (=> b!187273 (= e!123244 call!18859)))

(declare-fun b!187274 () Bool)

(assert (=> b!187274 (= e!123250 (not call!18862))))

(declare-fun bm!18857 () Bool)

(declare-fun call!18865 () ListLongMap!2345)

(assert (=> bm!18857 (= call!18865 call!18860)))

(declare-fun d!55457 () Bool)

(assert (=> d!55457 e!123247))

(declare-fun res!88560 () Bool)

(assert (=> d!55457 (=> (not res!88560) (not e!123247))))

(assert (=> d!55457 (= res!88560 (or (bvsge #b00000000000000000000000000000000 (size!4070 (_keys!5765 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4070 (_keys!5765 thiss!1248))))))))

(declare-fun lt!92694 () ListLongMap!2345)

(assert (=> d!55457 (= lt!92680 lt!92694)))

(declare-fun lt!92684 () Unit!5640)

(assert (=> d!55457 (= lt!92684 e!123240)))

(declare-fun c!33618 () Bool)

(declare-fun e!123249 () Bool)

(assert (=> d!55457 (= c!33618 e!123249)))

(declare-fun res!88558 () Bool)

(assert (=> d!55457 (=> (not res!88558) (not e!123249))))

(assert (=> d!55457 (= res!88558 (bvslt #b00000000000000000000000000000000 (size!4070 (_keys!5765 thiss!1248))))))

(assert (=> d!55457 (= lt!92694 e!123241)))

(declare-fun c!33619 () Bool)

(assert (=> d!55457 (= c!33619 (and (not (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55457 (validMask!0 (mask!8955 thiss!1248))))

(assert (=> d!55457 (= (getCurrentListMap!840 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)) lt!92680)))

(declare-fun b!187275 () Bool)

(declare-fun e!123245 () Bool)

(declare-fun e!123248 () Bool)

(assert (=> b!187275 (= e!123245 e!123248)))

(declare-fun res!88566 () Bool)

(assert (=> b!187275 (=> (not res!88566) (not e!123248))))

(assert (=> b!187275 (= res!88566 (contains!1300 lt!92680 (select (arr!3752 (_keys!5765 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187275 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4070 (_keys!5765 thiss!1248))))))

(declare-fun b!187276 () Bool)

(declare-fun get!2169 (ValueCell!1844 V!5481) V!5481)

(declare-fun dynLambda!513 (Int (_ BitVec 64)) V!5481)

(assert (=> b!187276 (= e!123248 (= (apply!170 lt!92680 (select (arr!3752 (_keys!5765 thiss!1248)) #b00000000000000000000000000000000)) (get!2169 (select (arr!3753 (_values!3798 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3815 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!187276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4071 (_values!3798 thiss!1248))))))

(assert (=> b!187276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4070 (_keys!5765 thiss!1248))))))

(declare-fun b!187277 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!187277 (= e!123249 (validKeyInArray!0 (select (arr!3752 (_keys!5765 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18861 () Bool)

(assert (=> bm!18861 (= call!18864 call!18865)))

(declare-fun b!187278 () Bool)

(assert (=> b!187278 (= e!123246 (= (apply!170 lt!92680 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3656 thiss!1248)))))

(declare-fun b!187279 () Bool)

(declare-fun lt!92692 () Unit!5640)

(assert (=> b!187279 (= e!123240 lt!92692)))

(declare-fun lt!92688 () ListLongMap!2345)

(assert (=> b!187279 (= lt!92688 (getCurrentListMapNoExtraKeys!201 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)))))

(declare-fun lt!92681 () (_ BitVec 64))

(assert (=> b!187279 (= lt!92681 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92695 () (_ BitVec 64))

(assert (=> b!187279 (= lt!92695 (select (arr!3752 (_keys!5765 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92676 () Unit!5640)

(declare-fun addStillContains!146 (ListLongMap!2345 (_ BitVec 64) V!5481 (_ BitVec 64)) Unit!5640)

(assert (=> b!187279 (= lt!92676 (addStillContains!146 lt!92688 lt!92681 (zeroValue!3656 thiss!1248) lt!92695))))

(declare-fun +!290 (ListLongMap!2345 tuple2!3424) ListLongMap!2345)

(assert (=> b!187279 (contains!1300 (+!290 lt!92688 (tuple2!3425 lt!92681 (zeroValue!3656 thiss!1248))) lt!92695)))

(declare-fun lt!92682 () Unit!5640)

(assert (=> b!187279 (= lt!92682 lt!92676)))

(declare-fun lt!92687 () ListLongMap!2345)

(assert (=> b!187279 (= lt!92687 (getCurrentListMapNoExtraKeys!201 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)))))

(declare-fun lt!92697 () (_ BitVec 64))

(assert (=> b!187279 (= lt!92697 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92677 () (_ BitVec 64))

(assert (=> b!187279 (= lt!92677 (select (arr!3752 (_keys!5765 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92685 () Unit!5640)

(declare-fun addApplyDifferent!146 (ListLongMap!2345 (_ BitVec 64) V!5481 (_ BitVec 64)) Unit!5640)

(assert (=> b!187279 (= lt!92685 (addApplyDifferent!146 lt!92687 lt!92697 (minValue!3656 thiss!1248) lt!92677))))

(assert (=> b!187279 (= (apply!170 (+!290 lt!92687 (tuple2!3425 lt!92697 (minValue!3656 thiss!1248))) lt!92677) (apply!170 lt!92687 lt!92677))))

(declare-fun lt!92689 () Unit!5640)

(assert (=> b!187279 (= lt!92689 lt!92685)))

(declare-fun lt!92686 () ListLongMap!2345)

(assert (=> b!187279 (= lt!92686 (getCurrentListMapNoExtraKeys!201 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)))))

(declare-fun lt!92696 () (_ BitVec 64))

(assert (=> b!187279 (= lt!92696 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92693 () (_ BitVec 64))

(assert (=> b!187279 (= lt!92693 (select (arr!3752 (_keys!5765 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92691 () Unit!5640)

(assert (=> b!187279 (= lt!92691 (addApplyDifferent!146 lt!92686 lt!92696 (zeroValue!3656 thiss!1248) lt!92693))))

(assert (=> b!187279 (= (apply!170 (+!290 lt!92686 (tuple2!3425 lt!92696 (zeroValue!3656 thiss!1248))) lt!92693) (apply!170 lt!92686 lt!92693))))

(declare-fun lt!92683 () Unit!5640)

(assert (=> b!187279 (= lt!92683 lt!92691)))

(declare-fun lt!92679 () ListLongMap!2345)

(assert (=> b!187279 (= lt!92679 (getCurrentListMapNoExtraKeys!201 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)))))

(declare-fun lt!92678 () (_ BitVec 64))

(assert (=> b!187279 (= lt!92678 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92690 () (_ BitVec 64))

(assert (=> b!187279 (= lt!92690 (select (arr!3752 (_keys!5765 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187279 (= lt!92692 (addApplyDifferent!146 lt!92679 lt!92678 (minValue!3656 thiss!1248) lt!92690))))

(assert (=> b!187279 (= (apply!170 (+!290 lt!92679 (tuple2!3425 lt!92678 (minValue!3656 thiss!1248))) lt!92690) (apply!170 lt!92679 lt!92690))))

(declare-fun b!187280 () Bool)

(assert (=> b!187280 (= e!123241 (+!290 call!18861 (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3656 thiss!1248))))))

(declare-fun b!187281 () Bool)

(declare-fun res!88564 () Bool)

(assert (=> b!187281 (=> (not res!88564) (not e!123247))))

(assert (=> b!187281 (= res!88564 e!123245)))

(declare-fun res!88565 () Bool)

(assert (=> b!187281 (=> res!88565 e!123245)))

(declare-fun e!123239 () Bool)

(assert (=> b!187281 (= res!88565 (not e!123239))))

(declare-fun res!88561 () Bool)

(assert (=> b!187281 (=> (not res!88561) (not e!123239))))

(assert (=> b!187281 (= res!88561 (bvslt #b00000000000000000000000000000000 (size!4070 (_keys!5765 thiss!1248))))))

(declare-fun b!187282 () Bool)

(assert (=> b!187282 (= e!123239 (validKeyInArray!0 (select (arr!3752 (_keys!5765 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18862 () Bool)

(assert (=> bm!18862 (= call!18861 (+!290 (ite c!33619 call!18860 (ite c!33621 call!18865 call!18864)) (ite (or c!33619 c!33621) (tuple2!3425 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3656 thiss!1248)) (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3656 thiss!1248)))))))

(assert (= (and d!55457 c!33619) b!187280))

(assert (= (and d!55457 (not c!33619)) b!187265))

(assert (= (and b!187265 c!33621) b!187266))

(assert (= (and b!187265 (not c!33621)) b!187267))

(assert (= (and b!187267 c!33617) b!187273))

(assert (= (and b!187267 (not c!33617)) b!187272))

(assert (= (or b!187273 b!187272) bm!18861))

(assert (= (or b!187266 bm!18861) bm!18857))

(assert (= (or b!187266 b!187273) bm!18860))

(assert (= (or b!187280 bm!18857) bm!18859))

(assert (= (or b!187280 bm!18860) bm!18862))

(assert (= (and d!55457 res!88558) b!187277))

(assert (= (and d!55457 c!33618) b!187279))

(assert (= (and d!55457 (not c!33618)) b!187263))

(assert (= (and d!55457 res!88560) b!187281))

(assert (= (and b!187281 res!88561) b!187282))

(assert (= (and b!187281 (not res!88565)) b!187275))

(assert (= (and b!187275 res!88566) b!187276))

(assert (= (and b!187281 res!88564) b!187262))

(assert (= (and b!187262 c!33622) b!187264))

(assert (= (and b!187262 (not c!33622)) b!187269))

(assert (= (and b!187264 res!88562) b!187271))

(assert (= (or b!187264 b!187269) bm!18856))

(assert (= (and b!187262 res!88559) b!187268))

(assert (= (and b!187268 c!33620) b!187270))

(assert (= (and b!187268 (not c!33620)) b!187274))

(assert (= (and b!187270 res!88563) b!187278))

(assert (= (or b!187270 b!187274) bm!18858))

(declare-fun b_lambda!7305 () Bool)

(assert (=> (not b_lambda!7305) (not b!187276)))

(declare-fun t!7231 () Bool)

(declare-fun tb!2843 () Bool)

(assert (=> (and b!187125 (= (defaultEntry!3815 thiss!1248) (defaultEntry!3815 thiss!1248)) t!7231) tb!2843))

(declare-fun result!4823 () Bool)

(assert (=> tb!2843 (= result!4823 tp_is_empty!4375)))

(assert (=> b!187276 t!7231))

(declare-fun b_and!11239 () Bool)

(assert (= b_and!11233 (and (=> t!7231 result!4823) b_and!11239)))

(declare-fun m!214237 () Bool)

(assert (=> b!187279 m!214237))

(declare-fun m!214239 () Bool)

(assert (=> b!187279 m!214239))

(declare-fun m!214241 () Bool)

(assert (=> b!187279 m!214241))

(declare-fun m!214243 () Bool)

(assert (=> b!187279 m!214243))

(declare-fun m!214245 () Bool)

(assert (=> b!187279 m!214245))

(assert (=> b!187279 m!214243))

(declare-fun m!214247 () Bool)

(assert (=> b!187279 m!214247))

(declare-fun m!214249 () Bool)

(assert (=> b!187279 m!214249))

(declare-fun m!214251 () Bool)

(assert (=> b!187279 m!214251))

(declare-fun m!214253 () Bool)

(assert (=> b!187279 m!214253))

(assert (=> b!187279 m!214237))

(declare-fun m!214255 () Bool)

(assert (=> b!187279 m!214255))

(declare-fun m!214257 () Bool)

(assert (=> b!187279 m!214257))

(declare-fun m!214259 () Bool)

(assert (=> b!187279 m!214259))

(declare-fun m!214261 () Bool)

(assert (=> b!187279 m!214261))

(declare-fun m!214263 () Bool)

(assert (=> b!187279 m!214263))

(assert (=> b!187279 m!214247))

(declare-fun m!214265 () Bool)

(assert (=> b!187279 m!214265))

(assert (=> b!187279 m!214263))

(declare-fun m!214267 () Bool)

(assert (=> b!187279 m!214267))

(declare-fun m!214269 () Bool)

(assert (=> b!187279 m!214269))

(assert (=> b!187282 m!214261))

(assert (=> b!187282 m!214261))

(declare-fun m!214271 () Bool)

(assert (=> b!187282 m!214271))

(declare-fun m!214273 () Bool)

(assert (=> bm!18856 m!214273))

(assert (=> b!187277 m!214261))

(assert (=> b!187277 m!214261))

(assert (=> b!187277 m!214271))

(declare-fun m!214275 () Bool)

(assert (=> b!187280 m!214275))

(declare-fun m!214277 () Bool)

(assert (=> b!187271 m!214277))

(assert (=> b!187275 m!214261))

(assert (=> b!187275 m!214261))

(declare-fun m!214279 () Bool)

(assert (=> b!187275 m!214279))

(declare-fun m!214281 () Bool)

(assert (=> bm!18858 m!214281))

(assert (=> d!55457 m!214161))

(assert (=> b!187276 m!214261))

(declare-fun m!214283 () Bool)

(assert (=> b!187276 m!214283))

(declare-fun m!214285 () Bool)

(assert (=> b!187276 m!214285))

(declare-fun m!214287 () Bool)

(assert (=> b!187276 m!214287))

(declare-fun m!214289 () Bool)

(assert (=> b!187276 m!214289))

(assert (=> b!187276 m!214261))

(assert (=> b!187276 m!214285))

(assert (=> b!187276 m!214287))

(declare-fun m!214291 () Bool)

(assert (=> bm!18862 m!214291))

(declare-fun m!214293 () Bool)

(assert (=> b!187278 m!214293))

(assert (=> bm!18859 m!214269))

(assert (=> b!187129 d!55457))

(declare-fun d!55459 () Bool)

(assert (=> d!55459 (= (array_inv!2421 (_keys!5765 thiss!1248)) (bvsge (size!4070 (_keys!5765 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187125 d!55459))

(declare-fun d!55461 () Bool)

(assert (=> d!55461 (= (array_inv!2422 (_values!3798 thiss!1248)) (bvsge (size!4071 (_values!3798 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187125 d!55461))

(declare-fun b!187297 () Bool)

(declare-fun e!123258 () SeekEntryResult!636)

(declare-fun e!123260 () SeekEntryResult!636)

(assert (=> b!187297 (= e!123258 e!123260)))

(declare-fun lt!92706 () (_ BitVec 64))

(declare-fun lt!92705 () SeekEntryResult!636)

(assert (=> b!187297 (= lt!92706 (select (arr!3752 (_keys!5765 thiss!1248)) (index!4716 lt!92705)))))

(declare-fun c!33631 () Bool)

(assert (=> b!187297 (= c!33631 (= lt!92706 key!828))))

(declare-fun e!123259 () SeekEntryResult!636)

(declare-fun b!187298 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7951 (_ BitVec 32)) SeekEntryResult!636)

(assert (=> b!187298 (= e!123259 (seekKeyOrZeroReturnVacant!0 (x!20252 lt!92705) (index!4716 lt!92705) (index!4716 lt!92705) key!828 (_keys!5765 thiss!1248) (mask!8955 thiss!1248)))))

(declare-fun b!187299 () Bool)

(assert (=> b!187299 (= e!123258 Undefined!636)))

(declare-fun d!55463 () Bool)

(declare-fun lt!92704 () SeekEntryResult!636)

(assert (=> d!55463 (and (or ((_ is Undefined!636) lt!92704) (not ((_ is Found!636) lt!92704)) (and (bvsge (index!4715 lt!92704) #b00000000000000000000000000000000) (bvslt (index!4715 lt!92704) (size!4070 (_keys!5765 thiss!1248))))) (or ((_ is Undefined!636) lt!92704) ((_ is Found!636) lt!92704) (not ((_ is MissingZero!636) lt!92704)) (and (bvsge (index!4714 lt!92704) #b00000000000000000000000000000000) (bvslt (index!4714 lt!92704) (size!4070 (_keys!5765 thiss!1248))))) (or ((_ is Undefined!636) lt!92704) ((_ is Found!636) lt!92704) ((_ is MissingZero!636) lt!92704) (not ((_ is MissingVacant!636) lt!92704)) (and (bvsge (index!4717 lt!92704) #b00000000000000000000000000000000) (bvslt (index!4717 lt!92704) (size!4070 (_keys!5765 thiss!1248))))) (or ((_ is Undefined!636) lt!92704) (ite ((_ is Found!636) lt!92704) (= (select (arr!3752 (_keys!5765 thiss!1248)) (index!4715 lt!92704)) key!828) (ite ((_ is MissingZero!636) lt!92704) (= (select (arr!3752 (_keys!5765 thiss!1248)) (index!4714 lt!92704)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!636) lt!92704) (= (select (arr!3752 (_keys!5765 thiss!1248)) (index!4717 lt!92704)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55463 (= lt!92704 e!123258)))

(declare-fun c!33629 () Bool)

(assert (=> d!55463 (= c!33629 (and ((_ is Intermediate!636) lt!92705) (undefined!1448 lt!92705)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7951 (_ BitVec 32)) SeekEntryResult!636)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55463 (= lt!92705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8955 thiss!1248)) key!828 (_keys!5765 thiss!1248) (mask!8955 thiss!1248)))))

(assert (=> d!55463 (validMask!0 (mask!8955 thiss!1248))))

(assert (=> d!55463 (= (seekEntryOrOpen!0 key!828 (_keys!5765 thiss!1248) (mask!8955 thiss!1248)) lt!92704)))

(declare-fun b!187300 () Bool)

(declare-fun c!33630 () Bool)

(assert (=> b!187300 (= c!33630 (= lt!92706 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187300 (= e!123260 e!123259)))

(declare-fun b!187301 () Bool)

(assert (=> b!187301 (= e!123259 (MissingZero!636 (index!4716 lt!92705)))))

(declare-fun b!187302 () Bool)

(assert (=> b!187302 (= e!123260 (Found!636 (index!4716 lt!92705)))))

(assert (= (and d!55463 c!33629) b!187299))

(assert (= (and d!55463 (not c!33629)) b!187297))

(assert (= (and b!187297 c!33631) b!187302))

(assert (= (and b!187297 (not c!33631)) b!187300))

(assert (= (and b!187300 c!33630) b!187301))

(assert (= (and b!187300 (not c!33630)) b!187298))

(declare-fun m!214295 () Bool)

(assert (=> b!187297 m!214295))

(declare-fun m!214297 () Bool)

(assert (=> b!187298 m!214297))

(declare-fun m!214299 () Bool)

(assert (=> d!55463 m!214299))

(declare-fun m!214301 () Bool)

(assert (=> d!55463 m!214301))

(declare-fun m!214303 () Bool)

(assert (=> d!55463 m!214303))

(declare-fun m!214305 () Bool)

(assert (=> d!55463 m!214305))

(assert (=> d!55463 m!214161))

(declare-fun m!214307 () Bool)

(assert (=> d!55463 m!214307))

(assert (=> d!55463 m!214301))

(assert (=> b!187133 d!55463))

(declare-fun d!55465 () Bool)

(declare-fun e!123263 () Bool)

(assert (=> d!55465 e!123263))

(declare-fun res!88572 () Bool)

(assert (=> d!55465 (=> (not res!88572) (not e!123263))))

(declare-fun lt!92712 () SeekEntryResult!636)

(assert (=> d!55465 (= res!88572 ((_ is Found!636) lt!92712))))

(assert (=> d!55465 (= lt!92712 (seekEntryOrOpen!0 key!828 (_keys!5765 thiss!1248) (mask!8955 thiss!1248)))))

(declare-fun lt!92711 () Unit!5640)

(declare-fun choose!1001 (array!7951 array!7953 (_ BitVec 32) (_ BitVec 32) V!5481 V!5481 (_ BitVec 64) Int) Unit!5640)

(assert (=> d!55465 (= lt!92711 (choose!1001 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) key!828 (defaultEntry!3815 thiss!1248)))))

(assert (=> d!55465 (validMask!0 (mask!8955 thiss!1248))))

(assert (=> d!55465 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!152 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) key!828 (defaultEntry!3815 thiss!1248)) lt!92711)))

(declare-fun b!187307 () Bool)

(declare-fun res!88571 () Bool)

(assert (=> b!187307 (=> (not res!88571) (not e!123263))))

(assert (=> b!187307 (= res!88571 (inRange!0 (index!4715 lt!92712) (mask!8955 thiss!1248)))))

(declare-fun b!187308 () Bool)

(assert (=> b!187308 (= e!123263 (= (select (arr!3752 (_keys!5765 thiss!1248)) (index!4715 lt!92712)) key!828))))

(assert (=> b!187308 (and (bvsge (index!4715 lt!92712) #b00000000000000000000000000000000) (bvslt (index!4715 lt!92712) (size!4070 (_keys!5765 thiss!1248))))))

(assert (= (and d!55465 res!88572) b!187307))

(assert (= (and b!187307 res!88571) b!187308))

(assert (=> d!55465 m!214155))

(declare-fun m!214309 () Bool)

(assert (=> d!55465 m!214309))

(assert (=> d!55465 m!214161))

(declare-fun m!214311 () Bool)

(assert (=> b!187307 m!214311))

(declare-fun m!214313 () Bool)

(assert (=> b!187308 m!214313))

(assert (=> b!187132 d!55465))

(declare-fun d!55467 () Bool)

(assert (=> d!55467 (= (inRange!0 (index!4715 lt!92593) (mask!8955 thiss!1248)) (and (bvsge (index!4715 lt!92593) #b00000000000000000000000000000000) (bvslt (index!4715 lt!92593) (bvadd (mask!8955 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!187132 d!55467))

(declare-fun bm!18867 () Bool)

(declare-fun call!18871 () Bool)

(declare-fun arrayContainsKey!0 (array!7951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18867 (= call!18871 (arrayContainsKey!0 (_keys!5765 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!187325 () Bool)

(declare-fun res!88582 () Bool)

(declare-fun e!123274 () Bool)

(assert (=> b!187325 (=> (not res!88582) (not e!123274))))

(declare-fun lt!92718 () SeekEntryResult!636)

(assert (=> b!187325 (= res!88582 (= (select (arr!3752 (_keys!5765 thiss!1248)) (index!4717 lt!92718)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187325 (and (bvsge (index!4717 lt!92718) #b00000000000000000000000000000000) (bvslt (index!4717 lt!92718) (size!4070 (_keys!5765 thiss!1248))))))

(declare-fun b!187326 () Bool)

(declare-fun e!123272 () Bool)

(assert (=> b!187326 (= e!123272 (not call!18871))))

(declare-fun d!55469 () Bool)

(declare-fun e!123273 () Bool)

(assert (=> d!55469 e!123273))

(declare-fun c!33636 () Bool)

(assert (=> d!55469 (= c!33636 ((_ is MissingZero!636) lt!92718))))

(assert (=> d!55469 (= lt!92718 (seekEntryOrOpen!0 key!828 (_keys!5765 thiss!1248) (mask!8955 thiss!1248)))))

(declare-fun lt!92717 () Unit!5640)

(declare-fun choose!1002 (array!7951 array!7953 (_ BitVec 32) (_ BitVec 32) V!5481 V!5481 (_ BitVec 64) Int) Unit!5640)

(assert (=> d!55469 (= lt!92717 (choose!1002 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) key!828 (defaultEntry!3815 thiss!1248)))))

(assert (=> d!55469 (validMask!0 (mask!8955 thiss!1248))))

(assert (=> d!55469 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!145 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) key!828 (defaultEntry!3815 thiss!1248)) lt!92717)))

(declare-fun b!187327 () Bool)

(declare-fun res!88581 () Bool)

(assert (=> b!187327 (=> (not res!88581) (not e!123274))))

(declare-fun call!18870 () Bool)

(assert (=> b!187327 (= res!88581 call!18870)))

(declare-fun e!123275 () Bool)

(assert (=> b!187327 (= e!123275 e!123274)))

(declare-fun b!187328 () Bool)

(assert (=> b!187328 (= e!123273 e!123275)))

(declare-fun c!33637 () Bool)

(assert (=> b!187328 (= c!33637 ((_ is MissingVacant!636) lt!92718))))

(declare-fun b!187329 () Bool)

(assert (=> b!187329 (= e!123273 e!123272)))

(declare-fun res!88584 () Bool)

(assert (=> b!187329 (= res!88584 call!18870)))

(assert (=> b!187329 (=> (not res!88584) (not e!123272))))

(declare-fun b!187330 () Bool)

(assert (=> b!187330 (= e!123274 (not call!18871))))

(declare-fun b!187331 () Bool)

(assert (=> b!187331 (= e!123275 ((_ is Undefined!636) lt!92718))))

(declare-fun bm!18868 () Bool)

(assert (=> bm!18868 (= call!18870 (inRange!0 (ite c!33636 (index!4714 lt!92718) (index!4717 lt!92718)) (mask!8955 thiss!1248)))))

(declare-fun b!187332 () Bool)

(assert (=> b!187332 (and (bvsge (index!4714 lt!92718) #b00000000000000000000000000000000) (bvslt (index!4714 lt!92718) (size!4070 (_keys!5765 thiss!1248))))))

(declare-fun res!88583 () Bool)

(assert (=> b!187332 (= res!88583 (= (select (arr!3752 (_keys!5765 thiss!1248)) (index!4714 lt!92718)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187332 (=> (not res!88583) (not e!123272))))

(assert (= (and d!55469 c!33636) b!187329))

(assert (= (and d!55469 (not c!33636)) b!187328))

(assert (= (and b!187329 res!88584) b!187332))

(assert (= (and b!187332 res!88583) b!187326))

(assert (= (and b!187328 c!33637) b!187327))

(assert (= (and b!187328 (not c!33637)) b!187331))

(assert (= (and b!187327 res!88581) b!187325))

(assert (= (and b!187325 res!88582) b!187330))

(assert (= (or b!187329 b!187327) bm!18868))

(assert (= (or b!187326 b!187330) bm!18867))

(declare-fun m!214315 () Bool)

(assert (=> b!187332 m!214315))

(declare-fun m!214317 () Bool)

(assert (=> bm!18867 m!214317))

(assert (=> d!55469 m!214155))

(declare-fun m!214319 () Bool)

(assert (=> d!55469 m!214319))

(assert (=> d!55469 m!214161))

(declare-fun m!214321 () Bool)

(assert (=> b!187325 m!214321))

(declare-fun m!214323 () Bool)

(assert (=> bm!18868 m!214323))

(assert (=> b!187131 d!55469))

(declare-fun mapNonEmpty!7544 () Bool)

(declare-fun mapRes!7544 () Bool)

(declare-fun tp!16634 () Bool)

(declare-fun e!123281 () Bool)

(assert (=> mapNonEmpty!7544 (= mapRes!7544 (and tp!16634 e!123281))))

(declare-fun mapKey!7544 () (_ BitVec 32))

(declare-fun mapValue!7544 () ValueCell!1844)

(declare-fun mapRest!7544 () (Array (_ BitVec 32) ValueCell!1844))

(assert (=> mapNonEmpty!7544 (= mapRest!7535 (store mapRest!7544 mapKey!7544 mapValue!7544))))

(declare-fun condMapEmpty!7544 () Bool)

(declare-fun mapDefault!7544 () ValueCell!1844)

(assert (=> mapNonEmpty!7535 (= condMapEmpty!7544 (= mapRest!7535 ((as const (Array (_ BitVec 32) ValueCell!1844)) mapDefault!7544)))))

(declare-fun e!123280 () Bool)

(assert (=> mapNonEmpty!7535 (= tp!16618 (and e!123280 mapRes!7544))))

(declare-fun b!187340 () Bool)

(assert (=> b!187340 (= e!123280 tp_is_empty!4375)))

(declare-fun b!187339 () Bool)

(assert (=> b!187339 (= e!123281 tp_is_empty!4375)))

(declare-fun mapIsEmpty!7544 () Bool)

(assert (=> mapIsEmpty!7544 mapRes!7544))

(assert (= (and mapNonEmpty!7535 condMapEmpty!7544) mapIsEmpty!7544))

(assert (= (and mapNonEmpty!7535 (not condMapEmpty!7544)) mapNonEmpty!7544))

(assert (= (and mapNonEmpty!7544 ((_ is ValueCellFull!1844) mapValue!7544)) b!187339))

(assert (= (and mapNonEmpty!7535 ((_ is ValueCellFull!1844) mapDefault!7544)) b!187340))

(declare-fun m!214325 () Bool)

(assert (=> mapNonEmpty!7544 m!214325))

(declare-fun b_lambda!7307 () Bool)

(assert (= b_lambda!7305 (or (and b!187125 b_free!4603) b_lambda!7307)))

(check-sat (not d!55465) (not mapNonEmpty!7544) (not d!55463) (not b!187208) (not b!187282) (not b!187217) (not b!187307) b_and!11239 (not bm!18868) (not d!55451) (not b_lambda!7307) (not bm!18856) (not b!187219) (not bm!18858) (not d!55455) (not b!187276) (not b!187280) (not bm!18862) (not b!187279) (not bm!18859) (not b!187275) (not b_next!4603) (not b!187277) (not b!187278) (not b!187210) (not b!187298) (not b!187209) tp_is_empty!4375 (not b!187271) (not bm!18867) (not d!55457) (not d!55469))
(check-sat b_and!11239 (not b_next!4603))
