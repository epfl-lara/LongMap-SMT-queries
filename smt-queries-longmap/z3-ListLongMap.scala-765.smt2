; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18042 () Bool)

(assert start!18042)

(declare-fun b!179657 () Bool)

(declare-fun b_free!4429 () Bool)

(declare-fun b_next!4429 () Bool)

(assert (=> b!179657 (= b_free!4429 (not b_next!4429))))

(declare-fun tp!16015 () Bool)

(declare-fun b_and!10975 () Bool)

(assert (=> b!179657 (= tp!16015 b_and!10975)))

(declare-fun b!179648 () Bool)

(declare-fun res!85091 () Bool)

(declare-fun e!118334 () Bool)

(assert (=> b!179648 (=> (not res!85091) (not e!118334))))

(declare-datatypes ((V!5249 0))(
  ( (V!5250 (val!2145 Int)) )
))
(declare-datatypes ((ValueCell!1757 0))(
  ( (ValueCellFull!1757 (v!4034 V!5249)) (EmptyCell!1757) )
))
(declare-datatypes ((array!7555 0))(
  ( (array!7556 (arr!3578 (Array (_ BitVec 32) (_ BitVec 64))) (size!3886 (_ BitVec 32))) )
))
(declare-datatypes ((array!7557 0))(
  ( (array!7558 (arr!3579 (Array (_ BitVec 32) ValueCell!1757)) (size!3887 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2422 0))(
  ( (LongMapFixedSize!2423 (defaultEntry!3686 Int) (mask!8672 (_ BitVec 32)) (extraKeys!3423 (_ BitVec 32)) (zeroValue!3527 V!5249) (minValue!3527 V!5249) (_size!1260 (_ BitVec 32)) (_keys!5575 array!7555) (_values!3669 array!7557) (_vacant!1260 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2422)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7555 (_ BitVec 32)) Bool)

(assert (=> b!179648 (= res!85091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5575 thiss!1248) (mask!8672 thiss!1248)))))

(declare-fun b!179649 () Bool)

(declare-fun e!118333 () Bool)

(declare-fun tp_is_empty!4201 () Bool)

(assert (=> b!179649 (= e!118333 tp_is_empty!4201)))

(declare-fun b!179650 () Bool)

(declare-fun res!85089 () Bool)

(assert (=> b!179650 (=> (not res!85089) (not e!118334))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!577 0))(
  ( (MissingZero!577 (index!4476 (_ BitVec 32))) (Found!577 (index!4477 (_ BitVec 32))) (Intermediate!577 (undefined!1389 Bool) (index!4478 (_ BitVec 32)) (x!19633 (_ BitVec 32))) (Undefined!577) (MissingVacant!577 (index!4479 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7555 (_ BitVec 32)) SeekEntryResult!577)

(assert (=> b!179650 (= res!85089 ((_ is Undefined!577) (seekEntryOrOpen!0 key!828 (_keys!5575 thiss!1248) (mask!8672 thiss!1248))))))

(declare-fun b!179651 () Bool)

(declare-fun res!85090 () Bool)

(assert (=> b!179651 (=> (not res!85090) (not e!118334))))

(assert (=> b!179651 (= res!85090 (and (= (size!3887 (_values!3669 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8672 thiss!1248))) (= (size!3886 (_keys!5575 thiss!1248)) (size!3887 (_values!3669 thiss!1248))) (bvsge (mask!8672 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3423 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3423 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7192 () Bool)

(declare-fun mapRes!7192 () Bool)

(assert (=> mapIsEmpty!7192 mapRes!7192))

(declare-fun res!85087 () Bool)

(assert (=> start!18042 (=> (not res!85087) (not e!118334))))

(declare-fun valid!1032 (LongMapFixedSize!2422) Bool)

(assert (=> start!18042 (= res!85087 (valid!1032 thiss!1248))))

(assert (=> start!18042 e!118334))

(declare-fun e!118332 () Bool)

(assert (=> start!18042 e!118332))

(assert (=> start!18042 true))

(declare-fun b!179652 () Bool)

(declare-fun e!118331 () Bool)

(assert (=> b!179652 (= e!118331 tp_is_empty!4201)))

(declare-fun b!179653 () Bool)

(declare-fun res!85086 () Bool)

(assert (=> b!179653 (=> (not res!85086) (not e!118334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179653 (= res!85086 (validMask!0 (mask!8672 thiss!1248)))))

(declare-fun b!179654 () Bool)

(declare-fun res!85092 () Bool)

(assert (=> b!179654 (=> (not res!85092) (not e!118334))))

(declare-datatypes ((List!2250 0))(
  ( (Nil!2247) (Cons!2246 (h!2871 (_ BitVec 64)) (t!7088 List!2250)) )
))
(declare-fun arrayNoDuplicates!0 (array!7555 (_ BitVec 32) List!2250) Bool)

(assert (=> b!179654 (= res!85092 (arrayNoDuplicates!0 (_keys!5575 thiss!1248) #b00000000000000000000000000000000 Nil!2247))))

(declare-fun b!179655 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!179655 (= e!118334 (not (validKeyInArray!0 key!828)))))

(declare-fun mapNonEmpty!7192 () Bool)

(declare-fun tp!16014 () Bool)

(assert (=> mapNonEmpty!7192 (= mapRes!7192 (and tp!16014 e!118333))))

(declare-fun mapRest!7192 () (Array (_ BitVec 32) ValueCell!1757))

(declare-fun mapValue!7192 () ValueCell!1757)

(declare-fun mapKey!7192 () (_ BitVec 32))

(assert (=> mapNonEmpty!7192 (= (arr!3579 (_values!3669 thiss!1248)) (store mapRest!7192 mapKey!7192 mapValue!7192))))

(declare-fun b!179656 () Bool)

(declare-fun e!118336 () Bool)

(assert (=> b!179656 (= e!118336 (and e!118331 mapRes!7192))))

(declare-fun condMapEmpty!7192 () Bool)

(declare-fun mapDefault!7192 () ValueCell!1757)

(assert (=> b!179656 (= condMapEmpty!7192 (= (arr!3579 (_values!3669 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1757)) mapDefault!7192)))))

(declare-fun array_inv!2311 (array!7555) Bool)

(declare-fun array_inv!2312 (array!7557) Bool)

(assert (=> b!179657 (= e!118332 (and tp!16015 tp_is_empty!4201 (array_inv!2311 (_keys!5575 thiss!1248)) (array_inv!2312 (_values!3669 thiss!1248)) e!118336))))

(declare-fun b!179658 () Bool)

(declare-fun res!85093 () Bool)

(assert (=> b!179658 (=> (not res!85093) (not e!118334))))

(declare-datatypes ((tuple2!3286 0))(
  ( (tuple2!3287 (_1!1654 (_ BitVec 64)) (_2!1654 V!5249)) )
))
(declare-datatypes ((List!2251 0))(
  ( (Nil!2248) (Cons!2247 (h!2872 tuple2!3286) (t!7089 List!2251)) )
))
(declare-datatypes ((ListLongMap!2219 0))(
  ( (ListLongMap!2220 (toList!1125 List!2251)) )
))
(declare-fun contains!1211 (ListLongMap!2219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!780 (array!7555 array!7557 (_ BitVec 32) (_ BitVec 32) V!5249 V!5249 (_ BitVec 32) Int) ListLongMap!2219)

(assert (=> b!179658 (= res!85093 (not (contains!1211 (getCurrentListMap!780 (_keys!5575 thiss!1248) (_values!3669 thiss!1248) (mask!8672 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)) key!828)))))

(declare-fun b!179659 () Bool)

(declare-fun res!85088 () Bool)

(assert (=> b!179659 (=> (not res!85088) (not e!118334))))

(assert (=> b!179659 (= res!85088 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!18042 res!85087) b!179659))

(assert (= (and b!179659 res!85088) b!179650))

(assert (= (and b!179650 res!85089) b!179658))

(assert (= (and b!179658 res!85093) b!179653))

(assert (= (and b!179653 res!85086) b!179651))

(assert (= (and b!179651 res!85090) b!179648))

(assert (= (and b!179648 res!85091) b!179654))

(assert (= (and b!179654 res!85092) b!179655))

(assert (= (and b!179656 condMapEmpty!7192) mapIsEmpty!7192))

(assert (= (and b!179656 (not condMapEmpty!7192)) mapNonEmpty!7192))

(assert (= (and mapNonEmpty!7192 ((_ is ValueCellFull!1757) mapValue!7192)) b!179649))

(assert (= (and b!179656 ((_ is ValueCellFull!1757) mapDefault!7192)) b!179652))

(assert (= b!179657 b!179656))

(assert (= start!18042 b!179657))

(declare-fun m!207983 () Bool)

(assert (=> mapNonEmpty!7192 m!207983))

(declare-fun m!207985 () Bool)

(assert (=> b!179653 m!207985))

(declare-fun m!207987 () Bool)

(assert (=> start!18042 m!207987))

(declare-fun m!207989 () Bool)

(assert (=> b!179657 m!207989))

(declare-fun m!207991 () Bool)

(assert (=> b!179657 m!207991))

(declare-fun m!207993 () Bool)

(assert (=> b!179658 m!207993))

(assert (=> b!179658 m!207993))

(declare-fun m!207995 () Bool)

(assert (=> b!179658 m!207995))

(declare-fun m!207997 () Bool)

(assert (=> b!179655 m!207997))

(declare-fun m!207999 () Bool)

(assert (=> b!179654 m!207999))

(declare-fun m!208001 () Bool)

(assert (=> b!179650 m!208001))

(declare-fun m!208003 () Bool)

(assert (=> b!179648 m!208003))

(check-sat (not b!179657) tp_is_empty!4201 (not b!179648) (not b_next!4429) (not b!179658) (not start!18042) (not mapNonEmpty!7192) (not b!179654) (not b!179655) (not b!179653) (not b!179650) b_and!10975)
(check-sat b_and!10975 (not b_next!4429))
(get-model)

(declare-fun d!54237 () Bool)

(assert (=> d!54237 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!179655 d!54237))

(declare-fun b!179742 () Bool)

(declare-fun e!118383 () Bool)

(declare-fun contains!1213 (List!2250 (_ BitVec 64)) Bool)

(assert (=> b!179742 (= e!118383 (contains!1213 Nil!2247 (select (arr!3578 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179743 () Bool)

(declare-fun e!118382 () Bool)

(declare-fun e!118381 () Bool)

(assert (=> b!179743 (= e!118382 e!118381)))

(declare-fun res!85150 () Bool)

(assert (=> b!179743 (=> (not res!85150) (not e!118381))))

(assert (=> b!179743 (= res!85150 (not e!118383))))

(declare-fun res!85149 () Bool)

(assert (=> b!179743 (=> (not res!85149) (not e!118383))))

(assert (=> b!179743 (= res!85149 (validKeyInArray!0 (select (arr!3578 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179744 () Bool)

(declare-fun e!118384 () Bool)

(declare-fun call!18139 () Bool)

(assert (=> b!179744 (= e!118384 call!18139)))

(declare-fun bm!18136 () Bool)

(declare-fun c!32217 () Bool)

(assert (=> bm!18136 (= call!18139 (arrayNoDuplicates!0 (_keys!5575 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32217 (Cons!2246 (select (arr!3578 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000) Nil!2247) Nil!2247)))))

(declare-fun b!179745 () Bool)

(assert (=> b!179745 (= e!118381 e!118384)))

(assert (=> b!179745 (= c!32217 (validKeyInArray!0 (select (arr!3578 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179746 () Bool)

(assert (=> b!179746 (= e!118384 call!18139)))

(declare-fun d!54239 () Bool)

(declare-fun res!85148 () Bool)

(assert (=> d!54239 (=> res!85148 e!118382)))

(assert (=> d!54239 (= res!85148 (bvsge #b00000000000000000000000000000000 (size!3886 (_keys!5575 thiss!1248))))))

(assert (=> d!54239 (= (arrayNoDuplicates!0 (_keys!5575 thiss!1248) #b00000000000000000000000000000000 Nil!2247) e!118382)))

(assert (= (and d!54239 (not res!85148)) b!179743))

(assert (= (and b!179743 res!85149) b!179742))

(assert (= (and b!179743 res!85150) b!179745))

(assert (= (and b!179745 c!32217) b!179744))

(assert (= (and b!179745 (not c!32217)) b!179746))

(assert (= (or b!179744 b!179746) bm!18136))

(declare-fun m!208049 () Bool)

(assert (=> b!179742 m!208049))

(assert (=> b!179742 m!208049))

(declare-fun m!208051 () Bool)

(assert (=> b!179742 m!208051))

(assert (=> b!179743 m!208049))

(assert (=> b!179743 m!208049))

(declare-fun m!208053 () Bool)

(assert (=> b!179743 m!208053))

(assert (=> bm!18136 m!208049))

(declare-fun m!208055 () Bool)

(assert (=> bm!18136 m!208055))

(assert (=> b!179745 m!208049))

(assert (=> b!179745 m!208049))

(assert (=> b!179745 m!208053))

(assert (=> b!179654 d!54239))

(declare-fun b!179759 () Bool)

(declare-fun e!118392 () SeekEntryResult!577)

(declare-fun lt!88805 () SeekEntryResult!577)

(assert (=> b!179759 (= e!118392 (MissingZero!577 (index!4478 lt!88805)))))

(declare-fun b!179760 () Bool)

(declare-fun c!32226 () Bool)

(declare-fun lt!88806 () (_ BitVec 64))

(assert (=> b!179760 (= c!32226 (= lt!88806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118393 () SeekEntryResult!577)

(assert (=> b!179760 (= e!118393 e!118392)))

(declare-fun d!54241 () Bool)

(declare-fun lt!88807 () SeekEntryResult!577)

(assert (=> d!54241 (and (or ((_ is Undefined!577) lt!88807) (not ((_ is Found!577) lt!88807)) (and (bvsge (index!4477 lt!88807) #b00000000000000000000000000000000) (bvslt (index!4477 lt!88807) (size!3886 (_keys!5575 thiss!1248))))) (or ((_ is Undefined!577) lt!88807) ((_ is Found!577) lt!88807) (not ((_ is MissingZero!577) lt!88807)) (and (bvsge (index!4476 lt!88807) #b00000000000000000000000000000000) (bvslt (index!4476 lt!88807) (size!3886 (_keys!5575 thiss!1248))))) (or ((_ is Undefined!577) lt!88807) ((_ is Found!577) lt!88807) ((_ is MissingZero!577) lt!88807) (not ((_ is MissingVacant!577) lt!88807)) (and (bvsge (index!4479 lt!88807) #b00000000000000000000000000000000) (bvslt (index!4479 lt!88807) (size!3886 (_keys!5575 thiss!1248))))) (or ((_ is Undefined!577) lt!88807) (ite ((_ is Found!577) lt!88807) (= (select (arr!3578 (_keys!5575 thiss!1248)) (index!4477 lt!88807)) key!828) (ite ((_ is MissingZero!577) lt!88807) (= (select (arr!3578 (_keys!5575 thiss!1248)) (index!4476 lt!88807)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!577) lt!88807) (= (select (arr!3578 (_keys!5575 thiss!1248)) (index!4479 lt!88807)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!118391 () SeekEntryResult!577)

(assert (=> d!54241 (= lt!88807 e!118391)))

(declare-fun c!32224 () Bool)

(assert (=> d!54241 (= c!32224 (and ((_ is Intermediate!577) lt!88805) (undefined!1389 lt!88805)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7555 (_ BitVec 32)) SeekEntryResult!577)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54241 (= lt!88805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8672 thiss!1248)) key!828 (_keys!5575 thiss!1248) (mask!8672 thiss!1248)))))

(assert (=> d!54241 (validMask!0 (mask!8672 thiss!1248))))

(assert (=> d!54241 (= (seekEntryOrOpen!0 key!828 (_keys!5575 thiss!1248) (mask!8672 thiss!1248)) lt!88807)))

(declare-fun b!179761 () Bool)

(assert (=> b!179761 (= e!118393 (Found!577 (index!4478 lt!88805)))))

(declare-fun b!179762 () Bool)

(assert (=> b!179762 (= e!118391 e!118393)))

(assert (=> b!179762 (= lt!88806 (select (arr!3578 (_keys!5575 thiss!1248)) (index!4478 lt!88805)))))

(declare-fun c!32225 () Bool)

(assert (=> b!179762 (= c!32225 (= lt!88806 key!828))))

(declare-fun b!179763 () Bool)

(assert (=> b!179763 (= e!118391 Undefined!577)))

(declare-fun b!179764 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7555 (_ BitVec 32)) SeekEntryResult!577)

(assert (=> b!179764 (= e!118392 (seekKeyOrZeroReturnVacant!0 (x!19633 lt!88805) (index!4478 lt!88805) (index!4478 lt!88805) key!828 (_keys!5575 thiss!1248) (mask!8672 thiss!1248)))))

(assert (= (and d!54241 c!32224) b!179763))

(assert (= (and d!54241 (not c!32224)) b!179762))

(assert (= (and b!179762 c!32225) b!179761))

(assert (= (and b!179762 (not c!32225)) b!179760))

(assert (= (and b!179760 c!32226) b!179759))

(assert (= (and b!179760 (not c!32226)) b!179764))

(declare-fun m!208057 () Bool)

(assert (=> d!54241 m!208057))

(declare-fun m!208059 () Bool)

(assert (=> d!54241 m!208059))

(assert (=> d!54241 m!208059))

(declare-fun m!208061 () Bool)

(assert (=> d!54241 m!208061))

(declare-fun m!208063 () Bool)

(assert (=> d!54241 m!208063))

(declare-fun m!208065 () Bool)

(assert (=> d!54241 m!208065))

(assert (=> d!54241 m!207985))

(declare-fun m!208067 () Bool)

(assert (=> b!179762 m!208067))

(declare-fun m!208069 () Bool)

(assert (=> b!179764 m!208069))

(assert (=> b!179650 d!54241))

(declare-fun d!54243 () Bool)

(declare-fun e!118398 () Bool)

(assert (=> d!54243 e!118398))

(declare-fun res!85153 () Bool)

(assert (=> d!54243 (=> res!85153 e!118398)))

(declare-fun lt!88817 () Bool)

(assert (=> d!54243 (= res!85153 (not lt!88817))))

(declare-fun lt!88818 () Bool)

(assert (=> d!54243 (= lt!88817 lt!88818)))

(declare-datatypes ((Unit!5467 0))(
  ( (Unit!5468) )
))
(declare-fun lt!88819 () Unit!5467)

(declare-fun e!118399 () Unit!5467)

(assert (=> d!54243 (= lt!88819 e!118399)))

(declare-fun c!32229 () Bool)

(assert (=> d!54243 (= c!32229 lt!88818)))

(declare-fun containsKey!207 (List!2251 (_ BitVec 64)) Bool)

(assert (=> d!54243 (= lt!88818 (containsKey!207 (toList!1125 (getCurrentListMap!780 (_keys!5575 thiss!1248) (_values!3669 thiss!1248) (mask!8672 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248))) key!828))))

(assert (=> d!54243 (= (contains!1211 (getCurrentListMap!780 (_keys!5575 thiss!1248) (_values!3669 thiss!1248) (mask!8672 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)) key!828) lt!88817)))

(declare-fun b!179771 () Bool)

(declare-fun lt!88816 () Unit!5467)

(assert (=> b!179771 (= e!118399 lt!88816)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!155 (List!2251 (_ BitVec 64)) Unit!5467)

(assert (=> b!179771 (= lt!88816 (lemmaContainsKeyImpliesGetValueByKeyDefined!155 (toList!1125 (getCurrentListMap!780 (_keys!5575 thiss!1248) (_values!3669 thiss!1248) (mask!8672 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248))) key!828))))

(declare-datatypes ((Option!210 0))(
  ( (Some!209 (v!4037 V!5249)) (None!208) )
))
(declare-fun isDefined!156 (Option!210) Bool)

(declare-fun getValueByKey!204 (List!2251 (_ BitVec 64)) Option!210)

(assert (=> b!179771 (isDefined!156 (getValueByKey!204 (toList!1125 (getCurrentListMap!780 (_keys!5575 thiss!1248) (_values!3669 thiss!1248) (mask!8672 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248))) key!828))))

(declare-fun b!179772 () Bool)

(declare-fun Unit!5469 () Unit!5467)

(assert (=> b!179772 (= e!118399 Unit!5469)))

(declare-fun b!179773 () Bool)

(assert (=> b!179773 (= e!118398 (isDefined!156 (getValueByKey!204 (toList!1125 (getCurrentListMap!780 (_keys!5575 thiss!1248) (_values!3669 thiss!1248) (mask!8672 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248))) key!828)))))

(assert (= (and d!54243 c!32229) b!179771))

(assert (= (and d!54243 (not c!32229)) b!179772))

(assert (= (and d!54243 (not res!85153)) b!179773))

(declare-fun m!208071 () Bool)

(assert (=> d!54243 m!208071))

(declare-fun m!208073 () Bool)

(assert (=> b!179771 m!208073))

(declare-fun m!208075 () Bool)

(assert (=> b!179771 m!208075))

(assert (=> b!179771 m!208075))

(declare-fun m!208077 () Bool)

(assert (=> b!179771 m!208077))

(assert (=> b!179773 m!208075))

(assert (=> b!179773 m!208075))

(assert (=> b!179773 m!208077))

(assert (=> b!179658 d!54243))

(declare-fun b!179816 () Bool)

(declare-fun res!85178 () Bool)

(declare-fun e!118436 () Bool)

(assert (=> b!179816 (=> (not res!85178) (not e!118436))))

(declare-fun e!118435 () Bool)

(assert (=> b!179816 (= res!85178 e!118435)))

(declare-fun res!85174 () Bool)

(assert (=> b!179816 (=> res!85174 e!118435)))

(declare-fun e!118432 () Bool)

(assert (=> b!179816 (= res!85174 (not e!118432))))

(declare-fun res!85179 () Bool)

(assert (=> b!179816 (=> (not res!85179) (not e!118432))))

(assert (=> b!179816 (= res!85179 (bvslt #b00000000000000000000000000000000 (size!3886 (_keys!5575 thiss!1248))))))

(declare-fun b!179817 () Bool)

(declare-fun e!118434 () ListLongMap!2219)

(declare-fun call!18159 () ListLongMap!2219)

(declare-fun +!265 (ListLongMap!2219 tuple2!3286) ListLongMap!2219)

(assert (=> b!179817 (= e!118434 (+!265 call!18159 (tuple2!3287 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3527 thiss!1248))))))

(declare-fun b!179818 () Bool)

(declare-fun e!118438 () Unit!5467)

(declare-fun Unit!5470 () Unit!5467)

(assert (=> b!179818 (= e!118438 Unit!5470)))

(declare-fun b!179819 () Bool)

(declare-fun lt!88868 () Unit!5467)

(assert (=> b!179819 (= e!118438 lt!88868)))

(declare-fun lt!88872 () ListLongMap!2219)

(declare-fun getCurrentListMapNoExtraKeys!179 (array!7555 array!7557 (_ BitVec 32) (_ BitVec 32) V!5249 V!5249 (_ BitVec 32) Int) ListLongMap!2219)

(assert (=> b!179819 (= lt!88872 (getCurrentListMapNoExtraKeys!179 (_keys!5575 thiss!1248) (_values!3669 thiss!1248) (mask!8672 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)))))

(declare-fun lt!88882 () (_ BitVec 64))

(assert (=> b!179819 (= lt!88882 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88873 () (_ BitVec 64))

(assert (=> b!179819 (= lt!88873 (select (arr!3578 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88864 () Unit!5467)

(declare-fun addStillContains!124 (ListLongMap!2219 (_ BitVec 64) V!5249 (_ BitVec 64)) Unit!5467)

(assert (=> b!179819 (= lt!88864 (addStillContains!124 lt!88872 lt!88882 (zeroValue!3527 thiss!1248) lt!88873))))

(assert (=> b!179819 (contains!1211 (+!265 lt!88872 (tuple2!3287 lt!88882 (zeroValue!3527 thiss!1248))) lt!88873)))

(declare-fun lt!88876 () Unit!5467)

(assert (=> b!179819 (= lt!88876 lt!88864)))

(declare-fun lt!88880 () ListLongMap!2219)

(assert (=> b!179819 (= lt!88880 (getCurrentListMapNoExtraKeys!179 (_keys!5575 thiss!1248) (_values!3669 thiss!1248) (mask!8672 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)))))

(declare-fun lt!88867 () (_ BitVec 64))

(assert (=> b!179819 (= lt!88867 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88884 () (_ BitVec 64))

(assert (=> b!179819 (= lt!88884 (select (arr!3578 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88885 () Unit!5467)

(declare-fun addApplyDifferent!124 (ListLongMap!2219 (_ BitVec 64) V!5249 (_ BitVec 64)) Unit!5467)

(assert (=> b!179819 (= lt!88885 (addApplyDifferent!124 lt!88880 lt!88867 (minValue!3527 thiss!1248) lt!88884))))

(declare-fun apply!148 (ListLongMap!2219 (_ BitVec 64)) V!5249)

(assert (=> b!179819 (= (apply!148 (+!265 lt!88880 (tuple2!3287 lt!88867 (minValue!3527 thiss!1248))) lt!88884) (apply!148 lt!88880 lt!88884))))

(declare-fun lt!88874 () Unit!5467)

(assert (=> b!179819 (= lt!88874 lt!88885)))

(declare-fun lt!88875 () ListLongMap!2219)

(assert (=> b!179819 (= lt!88875 (getCurrentListMapNoExtraKeys!179 (_keys!5575 thiss!1248) (_values!3669 thiss!1248) (mask!8672 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)))))

(declare-fun lt!88866 () (_ BitVec 64))

(assert (=> b!179819 (= lt!88866 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88870 () (_ BitVec 64))

(assert (=> b!179819 (= lt!88870 (select (arr!3578 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88869 () Unit!5467)

(assert (=> b!179819 (= lt!88869 (addApplyDifferent!124 lt!88875 lt!88866 (zeroValue!3527 thiss!1248) lt!88870))))

(assert (=> b!179819 (= (apply!148 (+!265 lt!88875 (tuple2!3287 lt!88866 (zeroValue!3527 thiss!1248))) lt!88870) (apply!148 lt!88875 lt!88870))))

(declare-fun lt!88883 () Unit!5467)

(assert (=> b!179819 (= lt!88883 lt!88869)))

(declare-fun lt!88879 () ListLongMap!2219)

(assert (=> b!179819 (= lt!88879 (getCurrentListMapNoExtraKeys!179 (_keys!5575 thiss!1248) (_values!3669 thiss!1248) (mask!8672 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)))))

(declare-fun lt!88871 () (_ BitVec 64))

(assert (=> b!179819 (= lt!88871 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88865 () (_ BitVec 64))

(assert (=> b!179819 (= lt!88865 (select (arr!3578 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179819 (= lt!88868 (addApplyDifferent!124 lt!88879 lt!88871 (minValue!3527 thiss!1248) lt!88865))))

(assert (=> b!179819 (= (apply!148 (+!265 lt!88879 (tuple2!3287 lt!88871 (minValue!3527 thiss!1248))) lt!88865) (apply!148 lt!88879 lt!88865))))

(declare-fun b!179820 () Bool)

(declare-fun e!118428 () Bool)

(assert (=> b!179820 (= e!118435 e!118428)))

(declare-fun res!85177 () Bool)

(assert (=> b!179820 (=> (not res!85177) (not e!118428))))

(declare-fun lt!88877 () ListLongMap!2219)

(assert (=> b!179820 (= res!85177 (contains!1211 lt!88877 (select (arr!3578 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!179820 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3886 (_keys!5575 thiss!1248))))))

(declare-fun d!54245 () Bool)

(assert (=> d!54245 e!118436))

(declare-fun res!85180 () Bool)

(assert (=> d!54245 (=> (not res!85180) (not e!118436))))

(assert (=> d!54245 (= res!85180 (or (bvsge #b00000000000000000000000000000000 (size!3886 (_keys!5575 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3886 (_keys!5575 thiss!1248))))))))

(declare-fun lt!88878 () ListLongMap!2219)

(assert (=> d!54245 (= lt!88877 lt!88878)))

(declare-fun lt!88881 () Unit!5467)

(assert (=> d!54245 (= lt!88881 e!118438)))

(declare-fun c!32244 () Bool)

(declare-fun e!118429 () Bool)

(assert (=> d!54245 (= c!32244 e!118429)))

(declare-fun res!85176 () Bool)

(assert (=> d!54245 (=> (not res!85176) (not e!118429))))

(assert (=> d!54245 (= res!85176 (bvslt #b00000000000000000000000000000000 (size!3886 (_keys!5575 thiss!1248))))))

(assert (=> d!54245 (= lt!88878 e!118434)))

(declare-fun c!32246 () Bool)

(assert (=> d!54245 (= c!32246 (and (not (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54245 (validMask!0 (mask!8672 thiss!1248))))

(assert (=> d!54245 (= (getCurrentListMap!780 (_keys!5575 thiss!1248) (_values!3669 thiss!1248) (mask!8672 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)) lt!88877)))

(declare-fun b!179821 () Bool)

(declare-fun e!118433 () Bool)

(declare-fun e!118431 () Bool)

(assert (=> b!179821 (= e!118433 e!118431)))

(declare-fun res!85173 () Bool)

(declare-fun call!18158 () Bool)

(assert (=> b!179821 (= res!85173 call!18158)))

(assert (=> b!179821 (=> (not res!85173) (not e!118431))))

(declare-fun bm!18151 () Bool)

(declare-fun call!18155 () Bool)

(assert (=> bm!18151 (= call!18155 (contains!1211 lt!88877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18152 () Bool)

(declare-fun call!18156 () ListLongMap!2219)

(declare-fun call!18157 () ListLongMap!2219)

(assert (=> bm!18152 (= call!18156 call!18157)))

(declare-fun b!179822 () Bool)

(declare-fun e!118426 () Bool)

(assert (=> b!179822 (= e!118426 (not call!18155))))

(declare-fun b!179823 () Bool)

(declare-fun get!2059 (ValueCell!1757 V!5249) V!5249)

(declare-fun dynLambda!491 (Int (_ BitVec 64)) V!5249)

(assert (=> b!179823 (= e!118428 (= (apply!148 lt!88877 (select (arr!3578 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000)) (get!2059 (select (arr!3579 (_values!3669 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!491 (defaultEntry!3686 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!179823 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3887 (_values!3669 thiss!1248))))))

(assert (=> b!179823 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3886 (_keys!5575 thiss!1248))))))

(declare-fun b!179824 () Bool)

(declare-fun e!118427 () Bool)

(assert (=> b!179824 (= e!118426 e!118427)))

(declare-fun res!85175 () Bool)

(assert (=> b!179824 (= res!85175 call!18155)))

(assert (=> b!179824 (=> (not res!85175) (not e!118427))))

(declare-fun b!179825 () Bool)

(assert (=> b!179825 (= e!118431 (= (apply!148 lt!88877 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3527 thiss!1248)))))

(declare-fun bm!18153 () Bool)

(declare-fun call!18160 () ListLongMap!2219)

(assert (=> bm!18153 (= call!18160 call!18159)))

(declare-fun bm!18154 () Bool)

(declare-fun c!32243 () Bool)

(declare-fun call!18154 () ListLongMap!2219)

(assert (=> bm!18154 (= call!18159 (+!265 (ite c!32246 call!18157 (ite c!32243 call!18156 call!18154)) (ite (or c!32246 c!32243) (tuple2!3287 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3527 thiss!1248)) (tuple2!3287 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3527 thiss!1248)))))))

(declare-fun b!179826 () Bool)

(assert (=> b!179826 (= e!118433 (not call!18158))))

(declare-fun bm!18155 () Bool)

(assert (=> bm!18155 (= call!18158 (contains!1211 lt!88877 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18156 () Bool)

(assert (=> bm!18156 (= call!18154 call!18156)))

(declare-fun bm!18157 () Bool)

(assert (=> bm!18157 (= call!18157 (getCurrentListMapNoExtraKeys!179 (_keys!5575 thiss!1248) (_values!3669 thiss!1248) (mask!8672 thiss!1248) (extraKeys!3423 thiss!1248) (zeroValue!3527 thiss!1248) (minValue!3527 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3686 thiss!1248)))))

(declare-fun b!179827 () Bool)

(declare-fun e!118430 () ListLongMap!2219)

(assert (=> b!179827 (= e!118430 call!18160)))

(declare-fun b!179828 () Bool)

(declare-fun res!85172 () Bool)

(assert (=> b!179828 (=> (not res!85172) (not e!118436))))

(assert (=> b!179828 (= res!85172 e!118426)))

(declare-fun c!32247 () Bool)

(assert (=> b!179828 (= c!32247 (not (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!179829 () Bool)

(assert (=> b!179829 (= e!118436 e!118433)))

(declare-fun c!32245 () Bool)

(assert (=> b!179829 (= c!32245 (not (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!179830 () Bool)

(declare-fun e!118437 () ListLongMap!2219)

(assert (=> b!179830 (= e!118437 call!18160)))

(declare-fun b!179831 () Bool)

(declare-fun c!32242 () Bool)

(assert (=> b!179831 (= c!32242 (and (not (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!179831 (= e!118430 e!118437)))

(declare-fun b!179832 () Bool)

(assert (=> b!179832 (= e!118429 (validKeyInArray!0 (select (arr!3578 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179833 () Bool)

(assert (=> b!179833 (= e!118437 call!18154)))

(declare-fun b!179834 () Bool)

(assert (=> b!179834 (= e!118427 (= (apply!148 lt!88877 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3527 thiss!1248)))))

(declare-fun b!179835 () Bool)

(assert (=> b!179835 (= e!118432 (validKeyInArray!0 (select (arr!3578 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179836 () Bool)

(assert (=> b!179836 (= e!118434 e!118430)))

(assert (=> b!179836 (= c!32243 (and (not (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3423 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!54245 c!32246) b!179817))

(assert (= (and d!54245 (not c!32246)) b!179836))

(assert (= (and b!179836 c!32243) b!179827))

(assert (= (and b!179836 (not c!32243)) b!179831))

(assert (= (and b!179831 c!32242) b!179830))

(assert (= (and b!179831 (not c!32242)) b!179833))

(assert (= (or b!179830 b!179833) bm!18156))

(assert (= (or b!179827 bm!18156) bm!18152))

(assert (= (or b!179827 b!179830) bm!18153))

(assert (= (or b!179817 bm!18152) bm!18157))

(assert (= (or b!179817 bm!18153) bm!18154))

(assert (= (and d!54245 res!85176) b!179832))

(assert (= (and d!54245 c!32244) b!179819))

(assert (= (and d!54245 (not c!32244)) b!179818))

(assert (= (and d!54245 res!85180) b!179816))

(assert (= (and b!179816 res!85179) b!179835))

(assert (= (and b!179816 (not res!85174)) b!179820))

(assert (= (and b!179820 res!85177) b!179823))

(assert (= (and b!179816 res!85178) b!179828))

(assert (= (and b!179828 c!32247) b!179824))

(assert (= (and b!179828 (not c!32247)) b!179822))

(assert (= (and b!179824 res!85175) b!179834))

(assert (= (or b!179824 b!179822) bm!18151))

(assert (= (and b!179828 res!85172) b!179829))

(assert (= (and b!179829 c!32245) b!179821))

(assert (= (and b!179829 (not c!32245)) b!179826))

(assert (= (and b!179821 res!85173) b!179825))

(assert (= (or b!179821 b!179826) bm!18155))

(declare-fun b_lambda!7137 () Bool)

(assert (=> (not b_lambda!7137) (not b!179823)))

(declare-fun t!7092 () Bool)

(declare-fun tb!2799 () Bool)

(assert (=> (and b!179657 (= (defaultEntry!3686 thiss!1248) (defaultEntry!3686 thiss!1248)) t!7092) tb!2799))

(declare-fun result!4687 () Bool)

(assert (=> tb!2799 (= result!4687 tp_is_empty!4201)))

(assert (=> b!179823 t!7092))

(declare-fun b_and!10981 () Bool)

(assert (= b_and!10975 (and (=> t!7092 result!4687) b_and!10981)))

(declare-fun m!208079 () Bool)

(assert (=> b!179817 m!208079))

(assert (=> b!179832 m!208049))

(assert (=> b!179832 m!208049))

(assert (=> b!179832 m!208053))

(declare-fun m!208081 () Bool)

(assert (=> b!179825 m!208081))

(assert (=> b!179835 m!208049))

(assert (=> b!179835 m!208049))

(assert (=> b!179835 m!208053))

(declare-fun m!208083 () Bool)

(assert (=> b!179819 m!208083))

(declare-fun m!208085 () Bool)

(assert (=> b!179819 m!208085))

(declare-fun m!208087 () Bool)

(assert (=> b!179819 m!208087))

(declare-fun m!208089 () Bool)

(assert (=> b!179819 m!208089))

(assert (=> b!179819 m!208049))

(declare-fun m!208091 () Bool)

(assert (=> b!179819 m!208091))

(declare-fun m!208093 () Bool)

(assert (=> b!179819 m!208093))

(assert (=> b!179819 m!208083))

(declare-fun m!208095 () Bool)

(assert (=> b!179819 m!208095))

(declare-fun m!208097 () Bool)

(assert (=> b!179819 m!208097))

(assert (=> b!179819 m!208091))

(declare-fun m!208099 () Bool)

(assert (=> b!179819 m!208099))

(declare-fun m!208101 () Bool)

(assert (=> b!179819 m!208101))

(declare-fun m!208103 () Bool)

(assert (=> b!179819 m!208103))

(assert (=> b!179819 m!208089))

(declare-fun m!208105 () Bool)

(assert (=> b!179819 m!208105))

(declare-fun m!208107 () Bool)

(assert (=> b!179819 m!208107))

(assert (=> b!179819 m!208097))

(declare-fun m!208109 () Bool)

(assert (=> b!179819 m!208109))

(declare-fun m!208111 () Bool)

(assert (=> b!179819 m!208111))

(declare-fun m!208113 () Bool)

(assert (=> b!179819 m!208113))

(declare-fun m!208115 () Bool)

(assert (=> bm!18151 m!208115))

(assert (=> b!179823 m!208049))

(declare-fun m!208117 () Bool)

(assert (=> b!179823 m!208117))

(assert (=> b!179823 m!208049))

(declare-fun m!208119 () Bool)

(assert (=> b!179823 m!208119))

(declare-fun m!208121 () Bool)

(assert (=> b!179823 m!208121))

(declare-fun m!208123 () Bool)

(assert (=> b!179823 m!208123))

(assert (=> b!179823 m!208119))

(assert (=> b!179823 m!208121))

(assert (=> b!179820 m!208049))

(assert (=> b!179820 m!208049))

(declare-fun m!208125 () Bool)

(assert (=> b!179820 m!208125))

(declare-fun m!208127 () Bool)

(assert (=> b!179834 m!208127))

(assert (=> d!54245 m!207985))

(declare-fun m!208129 () Bool)

(assert (=> bm!18154 m!208129))

(assert (=> bm!18157 m!208093))

(declare-fun m!208131 () Bool)

(assert (=> bm!18155 m!208131))

(assert (=> b!179658 d!54245))

(declare-fun d!54247 () Bool)

(assert (=> d!54247 (= (array_inv!2311 (_keys!5575 thiss!1248)) (bvsge (size!3886 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179657 d!54247))

(declare-fun d!54249 () Bool)

(assert (=> d!54249 (= (array_inv!2312 (_values!3669 thiss!1248)) (bvsge (size!3887 (_values!3669 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179657 d!54249))

(declare-fun d!54251 () Bool)

(assert (=> d!54251 (= (validMask!0 (mask!8672 thiss!1248)) (and (or (= (mask!8672 thiss!1248) #b00000000000000000000000000000111) (= (mask!8672 thiss!1248) #b00000000000000000000000000001111) (= (mask!8672 thiss!1248) #b00000000000000000000000000011111) (= (mask!8672 thiss!1248) #b00000000000000000000000000111111) (= (mask!8672 thiss!1248) #b00000000000000000000000001111111) (= (mask!8672 thiss!1248) #b00000000000000000000000011111111) (= (mask!8672 thiss!1248) #b00000000000000000000000111111111) (= (mask!8672 thiss!1248) #b00000000000000000000001111111111) (= (mask!8672 thiss!1248) #b00000000000000000000011111111111) (= (mask!8672 thiss!1248) #b00000000000000000000111111111111) (= (mask!8672 thiss!1248) #b00000000000000000001111111111111) (= (mask!8672 thiss!1248) #b00000000000000000011111111111111) (= (mask!8672 thiss!1248) #b00000000000000000111111111111111) (= (mask!8672 thiss!1248) #b00000000000000001111111111111111) (= (mask!8672 thiss!1248) #b00000000000000011111111111111111) (= (mask!8672 thiss!1248) #b00000000000000111111111111111111) (= (mask!8672 thiss!1248) #b00000000000001111111111111111111) (= (mask!8672 thiss!1248) #b00000000000011111111111111111111) (= (mask!8672 thiss!1248) #b00000000000111111111111111111111) (= (mask!8672 thiss!1248) #b00000000001111111111111111111111) (= (mask!8672 thiss!1248) #b00000000011111111111111111111111) (= (mask!8672 thiss!1248) #b00000000111111111111111111111111) (= (mask!8672 thiss!1248) #b00000001111111111111111111111111) (= (mask!8672 thiss!1248) #b00000011111111111111111111111111) (= (mask!8672 thiss!1248) #b00000111111111111111111111111111) (= (mask!8672 thiss!1248) #b00001111111111111111111111111111) (= (mask!8672 thiss!1248) #b00011111111111111111111111111111) (= (mask!8672 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8672 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!179653 d!54251))

(declare-fun b!179848 () Bool)

(declare-fun e!118446 () Bool)

(declare-fun call!18163 () Bool)

(assert (=> b!179848 (= e!118446 call!18163)))

(declare-fun b!179849 () Bool)

(declare-fun e!118445 () Bool)

(assert (=> b!179849 (= e!118445 call!18163)))

(declare-fun bm!18160 () Bool)

(assert (=> bm!18160 (= call!18163 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5575 thiss!1248) (mask!8672 thiss!1248)))))

(declare-fun b!179850 () Bool)

(declare-fun e!118447 () Bool)

(assert (=> b!179850 (= e!118447 e!118446)))

(declare-fun c!32250 () Bool)

(assert (=> b!179850 (= c!32250 (validKeyInArray!0 (select (arr!3578 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179847 () Bool)

(assert (=> b!179847 (= e!118446 e!118445)))

(declare-fun lt!88893 () (_ BitVec 64))

(assert (=> b!179847 (= lt!88893 (select (arr!3578 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88894 () Unit!5467)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7555 (_ BitVec 64) (_ BitVec 32)) Unit!5467)

(assert (=> b!179847 (= lt!88894 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5575 thiss!1248) lt!88893 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!179847 (arrayContainsKey!0 (_keys!5575 thiss!1248) lt!88893 #b00000000000000000000000000000000)))

(declare-fun lt!88892 () Unit!5467)

(assert (=> b!179847 (= lt!88892 lt!88894)))

(declare-fun res!85185 () Bool)

(assert (=> b!179847 (= res!85185 (= (seekEntryOrOpen!0 (select (arr!3578 (_keys!5575 thiss!1248)) #b00000000000000000000000000000000) (_keys!5575 thiss!1248) (mask!8672 thiss!1248)) (Found!577 #b00000000000000000000000000000000)))))

(assert (=> b!179847 (=> (not res!85185) (not e!118445))))

(declare-fun d!54253 () Bool)

(declare-fun res!85186 () Bool)

(assert (=> d!54253 (=> res!85186 e!118447)))

(assert (=> d!54253 (= res!85186 (bvsge #b00000000000000000000000000000000 (size!3886 (_keys!5575 thiss!1248))))))

(assert (=> d!54253 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5575 thiss!1248) (mask!8672 thiss!1248)) e!118447)))

(assert (= (and d!54253 (not res!85186)) b!179850))

(assert (= (and b!179850 c!32250) b!179847))

(assert (= (and b!179850 (not c!32250)) b!179848))

(assert (= (and b!179847 res!85185) b!179849))

(assert (= (or b!179849 b!179848) bm!18160))

(declare-fun m!208133 () Bool)

(assert (=> bm!18160 m!208133))

(assert (=> b!179850 m!208049))

(assert (=> b!179850 m!208049))

(assert (=> b!179850 m!208053))

(assert (=> b!179847 m!208049))

(declare-fun m!208135 () Bool)

(assert (=> b!179847 m!208135))

(declare-fun m!208137 () Bool)

(assert (=> b!179847 m!208137))

(assert (=> b!179847 m!208049))

(declare-fun m!208139 () Bool)

(assert (=> b!179847 m!208139))

(assert (=> b!179648 d!54253))

(declare-fun d!54255 () Bool)

(declare-fun res!85193 () Bool)

(declare-fun e!118450 () Bool)

(assert (=> d!54255 (=> (not res!85193) (not e!118450))))

(declare-fun simpleValid!162 (LongMapFixedSize!2422) Bool)

(assert (=> d!54255 (= res!85193 (simpleValid!162 thiss!1248))))

(assert (=> d!54255 (= (valid!1032 thiss!1248) e!118450)))

(declare-fun b!179857 () Bool)

(declare-fun res!85194 () Bool)

(assert (=> b!179857 (=> (not res!85194) (not e!118450))))

(declare-fun arrayCountValidKeys!0 (array!7555 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!179857 (= res!85194 (= (arrayCountValidKeys!0 (_keys!5575 thiss!1248) #b00000000000000000000000000000000 (size!3886 (_keys!5575 thiss!1248))) (_size!1260 thiss!1248)))))

(declare-fun b!179858 () Bool)

(declare-fun res!85195 () Bool)

(assert (=> b!179858 (=> (not res!85195) (not e!118450))))

(assert (=> b!179858 (= res!85195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5575 thiss!1248) (mask!8672 thiss!1248)))))

(declare-fun b!179859 () Bool)

(assert (=> b!179859 (= e!118450 (arrayNoDuplicates!0 (_keys!5575 thiss!1248) #b00000000000000000000000000000000 Nil!2247))))

(assert (= (and d!54255 res!85193) b!179857))

(assert (= (and b!179857 res!85194) b!179858))

(assert (= (and b!179858 res!85195) b!179859))

(declare-fun m!208141 () Bool)

(assert (=> d!54255 m!208141))

(declare-fun m!208143 () Bool)

(assert (=> b!179857 m!208143))

(assert (=> b!179858 m!208003))

(assert (=> b!179859 m!207999))

(assert (=> start!18042 d!54255))

(declare-fun b!179866 () Bool)

(declare-fun e!118456 () Bool)

(assert (=> b!179866 (= e!118456 tp_is_empty!4201)))

(declare-fun b!179867 () Bool)

(declare-fun e!118455 () Bool)

(assert (=> b!179867 (= e!118455 tp_is_empty!4201)))

(declare-fun condMapEmpty!7201 () Bool)

(declare-fun mapDefault!7201 () ValueCell!1757)

(assert (=> mapNonEmpty!7192 (= condMapEmpty!7201 (= mapRest!7192 ((as const (Array (_ BitVec 32) ValueCell!1757)) mapDefault!7201)))))

(declare-fun mapRes!7201 () Bool)

(assert (=> mapNonEmpty!7192 (= tp!16014 (and e!118455 mapRes!7201))))

(declare-fun mapIsEmpty!7201 () Bool)

(assert (=> mapIsEmpty!7201 mapRes!7201))

(declare-fun mapNonEmpty!7201 () Bool)

(declare-fun tp!16030 () Bool)

(assert (=> mapNonEmpty!7201 (= mapRes!7201 (and tp!16030 e!118456))))

(declare-fun mapValue!7201 () ValueCell!1757)

(declare-fun mapKey!7201 () (_ BitVec 32))

(declare-fun mapRest!7201 () (Array (_ BitVec 32) ValueCell!1757))

(assert (=> mapNonEmpty!7201 (= mapRest!7192 (store mapRest!7201 mapKey!7201 mapValue!7201))))

(assert (= (and mapNonEmpty!7192 condMapEmpty!7201) mapIsEmpty!7201))

(assert (= (and mapNonEmpty!7192 (not condMapEmpty!7201)) mapNonEmpty!7201))

(assert (= (and mapNonEmpty!7201 ((_ is ValueCellFull!1757) mapValue!7201)) b!179866))

(assert (= (and mapNonEmpty!7192 ((_ is ValueCellFull!1757) mapDefault!7201)) b!179867))

(declare-fun m!208145 () Bool)

(assert (=> mapNonEmpty!7201 m!208145))

(declare-fun b_lambda!7139 () Bool)

(assert (= b_lambda!7137 (or (and b!179657 b_free!4429) b_lambda!7139)))

(check-sat tp_is_empty!4201 (not bm!18157) (not b!179820) (not b!179742) (not bm!18155) (not b!179847) (not b!179857) b_and!10981 (not bm!18154) (not b!179823) (not b!179743) (not b!179825) (not b!179764) (not bm!18136) (not b!179819) (not mapNonEmpty!7201) (not b!179745) (not d!54241) (not b_lambda!7139) (not d!54245) (not b!179850) (not b!179832) (not b_next!4429) (not b!179834) (not b!179859) (not d!54243) (not d!54255) (not b!179771) (not b!179858) (not bm!18160) (not b!179817) (not bm!18151) (not b!179835) (not b!179773))
(check-sat b_and!10981 (not b_next!4429))
