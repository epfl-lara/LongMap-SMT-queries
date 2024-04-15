; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17808 () Bool)

(assert start!17808)

(declare-fun b!177660 () Bool)

(declare-fun b_free!4393 () Bool)

(declare-fun b_next!4393 () Bool)

(assert (=> b!177660 (= b_free!4393 (not b_next!4393))))

(declare-fun tp!15886 () Bool)

(declare-fun b_and!10875 () Bool)

(assert (=> b!177660 (= tp!15886 b_and!10875)))

(declare-fun mapNonEmpty!7117 () Bool)

(declare-fun mapRes!7117 () Bool)

(declare-fun tp!15885 () Bool)

(declare-fun e!117131 () Bool)

(assert (=> mapNonEmpty!7117 (= mapRes!7117 (and tp!15885 e!117131))))

(declare-datatypes ((V!5201 0))(
  ( (V!5202 (val!2127 Int)) )
))
(declare-datatypes ((ValueCell!1739 0))(
  ( (ValueCellFull!1739 (v!4003 V!5201)) (EmptyCell!1739) )
))
(declare-fun mapRest!7117 () (Array (_ BitVec 32) ValueCell!1739))

(declare-fun mapKey!7117 () (_ BitVec 32))

(declare-datatypes ((array!7465 0))(
  ( (array!7466 (arr!3538 (Array (_ BitVec 32) (_ BitVec 64))) (size!3844 (_ BitVec 32))) )
))
(declare-datatypes ((array!7467 0))(
  ( (array!7468 (arr!3539 (Array (_ BitVec 32) ValueCell!1739)) (size!3845 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2386 0))(
  ( (LongMapFixedSize!2387 (defaultEntry!3659 Int) (mask!8606 (_ BitVec 32)) (extraKeys!3396 (_ BitVec 32)) (zeroValue!3500 V!5201) (minValue!3500 V!5201) (_size!1242 (_ BitVec 32)) (_keys!5530 array!7465) (_values!3642 array!7467) (_vacant!1242 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2386)

(declare-fun mapValue!7117 () ValueCell!1739)

(assert (=> mapNonEmpty!7117 (= (arr!3539 (_values!3642 thiss!1248)) (store mapRest!7117 mapKey!7117 mapValue!7117))))

(declare-fun b!177654 () Bool)

(declare-fun res!84167 () Bool)

(declare-fun e!117127 () Bool)

(assert (=> b!177654 (=> (not res!84167) (not e!117127))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3292 0))(
  ( (tuple2!3293 (_1!1657 (_ BitVec 64)) (_2!1657 V!5201)) )
))
(declare-datatypes ((List!2259 0))(
  ( (Nil!2256) (Cons!2255 (h!2877 tuple2!3292) (t!7084 List!2259)) )
))
(declare-datatypes ((ListLongMap!2211 0))(
  ( (ListLongMap!2212 (toList!1121 List!2259)) )
))
(declare-fun contains!1194 (ListLongMap!2211 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!757 (array!7465 array!7467 (_ BitVec 32) (_ BitVec 32) V!5201 V!5201 (_ BitVec 32) Int) ListLongMap!2211)

(assert (=> b!177654 (= res!84167 (not (contains!1194 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)) key!828)))))

(declare-fun b!177655 () Bool)

(declare-fun res!84166 () Bool)

(assert (=> b!177655 (=> (not res!84166) (not e!117127))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!580 0))(
  ( (MissingZero!580 (index!4488 (_ BitVec 32))) (Found!580 (index!4489 (_ BitVec 32))) (Intermediate!580 (undefined!1392 Bool) (index!4490 (_ BitVec 32)) (x!19503 (_ BitVec 32))) (Undefined!580) (MissingVacant!580 (index!4491 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7465 (_ BitVec 32)) SeekEntryResult!580)

(assert (=> b!177655 (= res!84166 ((_ is Undefined!580) (seekEntryOrOpen!0 key!828 (_keys!5530 thiss!1248) (mask!8606 thiss!1248))))))

(declare-fun b!177656 () Bool)

(declare-fun tp_is_empty!4165 () Bool)

(assert (=> b!177656 (= e!117131 tp_is_empty!4165)))

(declare-fun res!84165 () Bool)

(assert (=> start!17808 (=> (not res!84165) (not e!117127))))

(declare-fun valid!1015 (LongMapFixedSize!2386) Bool)

(assert (=> start!17808 (= res!84165 (valid!1015 thiss!1248))))

(assert (=> start!17808 e!117127))

(declare-fun e!117129 () Bool)

(assert (=> start!17808 e!117129))

(assert (=> start!17808 true))

(declare-fun b!177657 () Bool)

(declare-fun e!117128 () Bool)

(declare-fun e!117130 () Bool)

(assert (=> b!177657 (= e!117128 (and e!117130 mapRes!7117))))

(declare-fun condMapEmpty!7117 () Bool)

(declare-fun mapDefault!7117 () ValueCell!1739)

(assert (=> b!177657 (= condMapEmpty!7117 (= (arr!3539 (_values!3642 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1739)) mapDefault!7117)))))

(declare-fun b!177658 () Bool)

(assert (=> b!177658 (= e!117127 (and (= (size!3845 (_values!3642 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8606 thiss!1248))) (not (= (size!3844 (_keys!5530 thiss!1248)) (size!3845 (_values!3642 thiss!1248))))))))

(declare-fun b!177659 () Bool)

(declare-fun res!84163 () Bool)

(assert (=> b!177659 (=> (not res!84163) (not e!117127))))

(assert (=> b!177659 (= res!84163 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!2283 (array!7465) Bool)

(declare-fun array_inv!2284 (array!7467) Bool)

(assert (=> b!177660 (= e!117129 (and tp!15886 tp_is_empty!4165 (array_inv!2283 (_keys!5530 thiss!1248)) (array_inv!2284 (_values!3642 thiss!1248)) e!117128))))

(declare-fun b!177661 () Bool)

(assert (=> b!177661 (= e!117130 tp_is_empty!4165)))

(declare-fun b!177662 () Bool)

(declare-fun res!84164 () Bool)

(assert (=> b!177662 (=> (not res!84164) (not e!117127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!177662 (= res!84164 (validMask!0 (mask!8606 thiss!1248)))))

(declare-fun mapIsEmpty!7117 () Bool)

(assert (=> mapIsEmpty!7117 mapRes!7117))

(assert (= (and start!17808 res!84165) b!177659))

(assert (= (and b!177659 res!84163) b!177655))

(assert (= (and b!177655 res!84166) b!177654))

(assert (= (and b!177654 res!84167) b!177662))

(assert (= (and b!177662 res!84164) b!177658))

(assert (= (and b!177657 condMapEmpty!7117) mapIsEmpty!7117))

(assert (= (and b!177657 (not condMapEmpty!7117)) mapNonEmpty!7117))

(assert (= (and mapNonEmpty!7117 ((_ is ValueCellFull!1739) mapValue!7117)) b!177656))

(assert (= (and b!177657 ((_ is ValueCellFull!1739) mapDefault!7117)) b!177661))

(assert (= b!177660 b!177657))

(assert (= start!17808 b!177660))

(declare-fun m!205667 () Bool)

(assert (=> b!177654 m!205667))

(assert (=> b!177654 m!205667))

(declare-fun m!205669 () Bool)

(assert (=> b!177654 m!205669))

(declare-fun m!205671 () Bool)

(assert (=> b!177660 m!205671))

(declare-fun m!205673 () Bool)

(assert (=> b!177660 m!205673))

(declare-fun m!205675 () Bool)

(assert (=> start!17808 m!205675))

(declare-fun m!205677 () Bool)

(assert (=> b!177655 m!205677))

(declare-fun m!205679 () Bool)

(assert (=> b!177662 m!205679))

(declare-fun m!205681 () Bool)

(assert (=> mapNonEmpty!7117 m!205681))

(check-sat (not start!17808) (not b_next!4393) (not b!177655) b_and!10875 (not mapNonEmpty!7117) (not b!177660) (not b!177654) tp_is_empty!4165 (not b!177662))
(check-sat b_and!10875 (not b_next!4393))
(get-model)

(declare-fun d!53691 () Bool)

(declare-fun e!117172 () Bool)

(assert (=> d!53691 e!117172))

(declare-fun res!84200 () Bool)

(assert (=> d!53691 (=> res!84200 e!117172)))

(declare-fun lt!87698 () Bool)

(assert (=> d!53691 (= res!84200 (not lt!87698))))

(declare-fun lt!87697 () Bool)

(assert (=> d!53691 (= lt!87698 lt!87697)))

(declare-datatypes ((Unit!5405 0))(
  ( (Unit!5406) )
))
(declare-fun lt!87699 () Unit!5405)

(declare-fun e!117173 () Unit!5405)

(assert (=> d!53691 (= lt!87699 e!117173)))

(declare-fun c!31824 () Bool)

(assert (=> d!53691 (= c!31824 lt!87697)))

(declare-fun containsKey!199 (List!2259 (_ BitVec 64)) Bool)

(assert (=> d!53691 (= lt!87697 (containsKey!199 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828))))

(assert (=> d!53691 (= (contains!1194 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)) key!828) lt!87698)))

(declare-fun b!177723 () Bool)

(declare-fun lt!87700 () Unit!5405)

(assert (=> b!177723 (= e!117173 lt!87700)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!148 (List!2259 (_ BitVec 64)) Unit!5405)

(assert (=> b!177723 (= lt!87700 (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828))))

(declare-datatypes ((Option!201 0))(
  ( (Some!200 (v!4006 V!5201)) (None!199) )
))
(declare-fun isDefined!149 (Option!201) Bool)

(declare-fun getValueByKey!195 (List!2259 (_ BitVec 64)) Option!201)

(assert (=> b!177723 (isDefined!149 (getValueByKey!195 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828))))

(declare-fun b!177724 () Bool)

(declare-fun Unit!5407 () Unit!5405)

(assert (=> b!177724 (= e!117173 Unit!5407)))

(declare-fun b!177725 () Bool)

(assert (=> b!177725 (= e!117172 (isDefined!149 (getValueByKey!195 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828)))))

(assert (= (and d!53691 c!31824) b!177723))

(assert (= (and d!53691 (not c!31824)) b!177724))

(assert (= (and d!53691 (not res!84200)) b!177725))

(declare-fun m!205715 () Bool)

(assert (=> d!53691 m!205715))

(declare-fun m!205717 () Bool)

(assert (=> b!177723 m!205717))

(declare-fun m!205719 () Bool)

(assert (=> b!177723 m!205719))

(assert (=> b!177723 m!205719))

(declare-fun m!205721 () Bool)

(assert (=> b!177723 m!205721))

(assert (=> b!177725 m!205719))

(assert (=> b!177725 m!205719))

(assert (=> b!177725 m!205721))

(assert (=> b!177654 d!53691))

(declare-fun b!177768 () Bool)

(declare-fun e!117211 () Bool)

(declare-fun e!117203 () Bool)

(assert (=> b!177768 (= e!117211 e!117203)))

(declare-fun c!31837 () Bool)

(assert (=> b!177768 (= c!31837 (not (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177770 () Bool)

(declare-fun e!117202 () Unit!5405)

(declare-fun Unit!5408 () Unit!5405)

(assert (=> b!177770 (= e!117202 Unit!5408)))

(declare-fun b!177771 () Bool)

(declare-fun e!117206 () Bool)

(assert (=> b!177771 (= e!117203 e!117206)))

(declare-fun res!84219 () Bool)

(declare-fun call!17973 () Bool)

(assert (=> b!177771 (= res!84219 call!17973)))

(assert (=> b!177771 (=> (not res!84219) (not e!117206))))

(declare-fun bm!17965 () Bool)

(declare-fun lt!87763 () ListLongMap!2211)

(assert (=> bm!17965 (= call!17973 (contains!1194 lt!87763 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177772 () Bool)

(declare-fun e!117207 () ListLongMap!2211)

(declare-fun call!17974 () ListLongMap!2211)

(declare-fun +!254 (ListLongMap!2211 tuple2!3292) ListLongMap!2211)

(assert (=> b!177772 (= e!117207 (+!254 call!17974 (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))))

(declare-fun bm!17966 () Bool)

(declare-fun call!17971 () ListLongMap!2211)

(declare-fun getCurrentListMapNoExtraKeys!163 (array!7465 array!7467 (_ BitVec 32) (_ BitVec 32) V!5201 V!5201 (_ BitVec 32) Int) ListLongMap!2211)

(assert (=> bm!17966 (= call!17971 (getCurrentListMapNoExtraKeys!163 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))))

(declare-fun c!31842 () Bool)

(declare-fun c!31839 () Bool)

(declare-fun call!17970 () ListLongMap!2211)

(declare-fun call!17972 () ListLongMap!2211)

(declare-fun bm!17967 () Bool)

(assert (=> bm!17967 (= call!17974 (+!254 (ite c!31839 call!17971 (ite c!31842 call!17970 call!17972)) (ite (or c!31839 c!31842) (tuple2!3293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))))))

(declare-fun b!177773 () Bool)

(declare-fun e!117208 () ListLongMap!2211)

(declare-fun call!17968 () ListLongMap!2211)

(assert (=> b!177773 (= e!117208 call!17968)))

(declare-fun b!177774 () Bool)

(declare-fun e!117200 () ListLongMap!2211)

(assert (=> b!177774 (= e!117207 e!117200)))

(assert (=> b!177774 (= c!31842 (and (not (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177775 () Bool)

(declare-fun e!117210 () Bool)

(declare-fun apply!142 (ListLongMap!2211 (_ BitVec 64)) V!5201)

(assert (=> b!177775 (= e!117210 (= (apply!142 lt!87763 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3500 thiss!1248)))))

(declare-fun b!177776 () Bool)

(declare-fun e!117204 () Bool)

(assert (=> b!177776 (= e!117204 e!117210)))

(declare-fun res!84222 () Bool)

(declare-fun call!17969 () Bool)

(assert (=> b!177776 (= res!84222 call!17969)))

(assert (=> b!177776 (=> (not res!84222) (not e!117210))))

(declare-fun b!177777 () Bool)

(assert (=> b!177777 (= e!117203 (not call!17973))))

(declare-fun b!177778 () Bool)

(assert (=> b!177778 (= e!117200 call!17968)))

(declare-fun b!177779 () Bool)

(declare-fun e!117201 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!177779 (= e!117201 (validKeyInArray!0 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53693 () Bool)

(assert (=> d!53693 e!117211))

(declare-fun res!84226 () Bool)

(assert (=> d!53693 (=> (not res!84226) (not e!117211))))

(assert (=> d!53693 (= res!84226 (or (bvsge #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))))))))

(declare-fun lt!87759 () ListLongMap!2211)

(assert (=> d!53693 (= lt!87763 lt!87759)))

(declare-fun lt!87749 () Unit!5405)

(assert (=> d!53693 (= lt!87749 e!117202)))

(declare-fun c!31838 () Bool)

(declare-fun e!117209 () Bool)

(assert (=> d!53693 (= c!31838 e!117209)))

(declare-fun res!84227 () Bool)

(assert (=> d!53693 (=> (not res!84227) (not e!117209))))

(assert (=> d!53693 (= res!84227 (bvslt #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))))))

(assert (=> d!53693 (= lt!87759 e!117207)))

(assert (=> d!53693 (= c!31839 (and (not (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53693 (validMask!0 (mask!8606 thiss!1248))))

(assert (=> d!53693 (= (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)) lt!87763)))

(declare-fun b!177769 () Bool)

(assert (=> b!177769 (= e!117204 (not call!17969))))

(declare-fun bm!17968 () Bool)

(assert (=> bm!17968 (= call!17969 (contains!1194 lt!87763 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177780 () Bool)

(declare-fun lt!87755 () Unit!5405)

(assert (=> b!177780 (= e!117202 lt!87755)))

(declare-fun lt!87760 () ListLongMap!2211)

(assert (=> b!177780 (= lt!87760 (getCurrentListMapNoExtraKeys!163 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))))

(declare-fun lt!87756 () (_ BitVec 64))

(assert (=> b!177780 (= lt!87756 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87764 () (_ BitVec 64))

(assert (=> b!177780 (= lt!87764 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87748 () Unit!5405)

(declare-fun addStillContains!118 (ListLongMap!2211 (_ BitVec 64) V!5201 (_ BitVec 64)) Unit!5405)

(assert (=> b!177780 (= lt!87748 (addStillContains!118 lt!87760 lt!87756 (zeroValue!3500 thiss!1248) lt!87764))))

(assert (=> b!177780 (contains!1194 (+!254 lt!87760 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248))) lt!87764)))

(declare-fun lt!87761 () Unit!5405)

(assert (=> b!177780 (= lt!87761 lt!87748)))

(declare-fun lt!87765 () ListLongMap!2211)

(assert (=> b!177780 (= lt!87765 (getCurrentListMapNoExtraKeys!163 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))))

(declare-fun lt!87766 () (_ BitVec 64))

(assert (=> b!177780 (= lt!87766 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87750 () (_ BitVec 64))

(assert (=> b!177780 (= lt!87750 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87758 () Unit!5405)

(declare-fun addApplyDifferent!118 (ListLongMap!2211 (_ BitVec 64) V!5201 (_ BitVec 64)) Unit!5405)

(assert (=> b!177780 (= lt!87758 (addApplyDifferent!118 lt!87765 lt!87766 (minValue!3500 thiss!1248) lt!87750))))

(assert (=> b!177780 (= (apply!142 (+!254 lt!87765 (tuple2!3293 lt!87766 (minValue!3500 thiss!1248))) lt!87750) (apply!142 lt!87765 lt!87750))))

(declare-fun lt!87752 () Unit!5405)

(assert (=> b!177780 (= lt!87752 lt!87758)))

(declare-fun lt!87753 () ListLongMap!2211)

(assert (=> b!177780 (= lt!87753 (getCurrentListMapNoExtraKeys!163 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))))

(declare-fun lt!87746 () (_ BitVec 64))

(assert (=> b!177780 (= lt!87746 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87747 () (_ BitVec 64))

(assert (=> b!177780 (= lt!87747 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87745 () Unit!5405)

(assert (=> b!177780 (= lt!87745 (addApplyDifferent!118 lt!87753 lt!87746 (zeroValue!3500 thiss!1248) lt!87747))))

(assert (=> b!177780 (= (apply!142 (+!254 lt!87753 (tuple2!3293 lt!87746 (zeroValue!3500 thiss!1248))) lt!87747) (apply!142 lt!87753 lt!87747))))

(declare-fun lt!87754 () Unit!5405)

(assert (=> b!177780 (= lt!87754 lt!87745)))

(declare-fun lt!87757 () ListLongMap!2211)

(assert (=> b!177780 (= lt!87757 (getCurrentListMapNoExtraKeys!163 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))))

(declare-fun lt!87751 () (_ BitVec 64))

(assert (=> b!177780 (= lt!87751 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87762 () (_ BitVec 64))

(assert (=> b!177780 (= lt!87762 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177780 (= lt!87755 (addApplyDifferent!118 lt!87757 lt!87751 (minValue!3500 thiss!1248) lt!87762))))

(assert (=> b!177780 (= (apply!142 (+!254 lt!87757 (tuple2!3293 lt!87751 (minValue!3500 thiss!1248))) lt!87762) (apply!142 lt!87757 lt!87762))))

(declare-fun bm!17969 () Bool)

(assert (=> bm!17969 (= call!17968 call!17974)))

(declare-fun b!177781 () Bool)

(declare-fun res!84224 () Bool)

(assert (=> b!177781 (=> (not res!84224) (not e!117211))))

(declare-fun e!117205 () Bool)

(assert (=> b!177781 (= res!84224 e!117205)))

(declare-fun res!84223 () Bool)

(assert (=> b!177781 (=> res!84223 e!117205)))

(assert (=> b!177781 (= res!84223 (not e!117201))))

(declare-fun res!84225 () Bool)

(assert (=> b!177781 (=> (not res!84225) (not e!117201))))

(assert (=> b!177781 (= res!84225 (bvslt #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))))))

(declare-fun bm!17970 () Bool)

(assert (=> bm!17970 (= call!17970 call!17971)))

(declare-fun b!177782 () Bool)

(declare-fun c!31841 () Bool)

(assert (=> b!177782 (= c!31841 (and (not (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!177782 (= e!117200 e!117208)))

(declare-fun b!177783 () Bool)

(assert (=> b!177783 (= e!117206 (= (apply!142 lt!87763 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3500 thiss!1248)))))

(declare-fun b!177784 () Bool)

(assert (=> b!177784 (= e!117209 (validKeyInArray!0 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177785 () Bool)

(declare-fun e!117212 () Bool)

(assert (=> b!177785 (= e!117205 e!117212)))

(declare-fun res!84220 () Bool)

(assert (=> b!177785 (=> (not res!84220) (not e!117212))))

(assert (=> b!177785 (= res!84220 (contains!1194 lt!87763 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177785 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))))))

(declare-fun b!177786 () Bool)

(assert (=> b!177786 (= e!117208 call!17972)))

(declare-fun bm!17971 () Bool)

(assert (=> bm!17971 (= call!17972 call!17970)))

(declare-fun b!177787 () Bool)

(declare-fun res!84221 () Bool)

(assert (=> b!177787 (=> (not res!84221) (not e!117211))))

(assert (=> b!177787 (= res!84221 e!117204)))

(declare-fun c!31840 () Bool)

(assert (=> b!177787 (= c!31840 (not (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!177788 () Bool)

(declare-fun get!2020 (ValueCell!1739 V!5201) V!5201)

(declare-fun dynLambda!476 (Int (_ BitVec 64)) V!5201)

(assert (=> b!177788 (= e!117212 (= (apply!142 lt!87763 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)) (get!2020 (select (arr!3539 (_values!3642 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3659 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177788 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3845 (_values!3642 thiss!1248))))))

(assert (=> b!177788 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))))))

(assert (= (and d!53693 c!31839) b!177772))

(assert (= (and d!53693 (not c!31839)) b!177774))

(assert (= (and b!177774 c!31842) b!177778))

(assert (= (and b!177774 (not c!31842)) b!177782))

(assert (= (and b!177782 c!31841) b!177773))

(assert (= (and b!177782 (not c!31841)) b!177786))

(assert (= (or b!177773 b!177786) bm!17971))

(assert (= (or b!177778 bm!17971) bm!17970))

(assert (= (or b!177778 b!177773) bm!17969))

(assert (= (or b!177772 bm!17970) bm!17966))

(assert (= (or b!177772 bm!17969) bm!17967))

(assert (= (and d!53693 res!84227) b!177784))

(assert (= (and d!53693 c!31838) b!177780))

(assert (= (and d!53693 (not c!31838)) b!177770))

(assert (= (and d!53693 res!84226) b!177781))

(assert (= (and b!177781 res!84225) b!177779))

(assert (= (and b!177781 (not res!84223)) b!177785))

(assert (= (and b!177785 res!84220) b!177788))

(assert (= (and b!177781 res!84224) b!177787))

(assert (= (and b!177787 c!31840) b!177776))

(assert (= (and b!177787 (not c!31840)) b!177769))

(assert (= (and b!177776 res!84222) b!177775))

(assert (= (or b!177776 b!177769) bm!17968))

(assert (= (and b!177787 res!84221) b!177768))

(assert (= (and b!177768 c!31837) b!177771))

(assert (= (and b!177768 (not c!31837)) b!177777))

(assert (= (and b!177771 res!84219) b!177783))

(assert (= (or b!177771 b!177777) bm!17965))

(declare-fun b_lambda!7049 () Bool)

(assert (=> (not b_lambda!7049) (not b!177788)))

(declare-fun t!7086 () Bool)

(declare-fun tb!2787 () Bool)

(assert (=> (and b!177660 (= (defaultEntry!3659 thiss!1248) (defaultEntry!3659 thiss!1248)) t!7086) tb!2787))

(declare-fun result!4651 () Bool)

(assert (=> tb!2787 (= result!4651 tp_is_empty!4165)))

(assert (=> b!177788 t!7086))

(declare-fun b_and!10881 () Bool)

(assert (= b_and!10875 (and (=> t!7086 result!4651) b_and!10881)))

(declare-fun m!205723 () Bool)

(assert (=> bm!17966 m!205723))

(declare-fun m!205725 () Bool)

(assert (=> b!177775 m!205725))

(declare-fun m!205727 () Bool)

(assert (=> bm!17968 m!205727))

(declare-fun m!205729 () Bool)

(assert (=> b!177788 m!205729))

(declare-fun m!205731 () Bool)

(assert (=> b!177788 m!205731))

(assert (=> b!177788 m!205729))

(declare-fun m!205733 () Bool)

(assert (=> b!177788 m!205733))

(declare-fun m!205735 () Bool)

(assert (=> b!177788 m!205735))

(assert (=> b!177788 m!205733))

(declare-fun m!205737 () Bool)

(assert (=> b!177788 m!205737))

(assert (=> b!177788 m!205735))

(declare-fun m!205739 () Bool)

(assert (=> b!177772 m!205739))

(assert (=> b!177784 m!205729))

(assert (=> b!177784 m!205729))

(declare-fun m!205741 () Bool)

(assert (=> b!177784 m!205741))

(declare-fun m!205743 () Bool)

(assert (=> bm!17965 m!205743))

(declare-fun m!205745 () Bool)

(assert (=> bm!17967 m!205745))

(assert (=> b!177779 m!205729))

(assert (=> b!177779 m!205729))

(assert (=> b!177779 m!205741))

(assert (=> b!177780 m!205723))

(declare-fun m!205747 () Bool)

(assert (=> b!177780 m!205747))

(declare-fun m!205749 () Bool)

(assert (=> b!177780 m!205749))

(declare-fun m!205751 () Bool)

(assert (=> b!177780 m!205751))

(declare-fun m!205753 () Bool)

(assert (=> b!177780 m!205753))

(assert (=> b!177780 m!205747))

(declare-fun m!205755 () Bool)

(assert (=> b!177780 m!205755))

(declare-fun m!205757 () Bool)

(assert (=> b!177780 m!205757))

(declare-fun m!205759 () Bool)

(assert (=> b!177780 m!205759))

(declare-fun m!205761 () Bool)

(assert (=> b!177780 m!205761))

(declare-fun m!205763 () Bool)

(assert (=> b!177780 m!205763))

(declare-fun m!205765 () Bool)

(assert (=> b!177780 m!205765))

(declare-fun m!205767 () Bool)

(assert (=> b!177780 m!205767))

(assert (=> b!177780 m!205729))

(declare-fun m!205769 () Bool)

(assert (=> b!177780 m!205769))

(declare-fun m!205771 () Bool)

(assert (=> b!177780 m!205771))

(declare-fun m!205773 () Bool)

(assert (=> b!177780 m!205773))

(assert (=> b!177780 m!205751))

(assert (=> b!177780 m!205763))

(assert (=> b!177780 m!205749))

(declare-fun m!205775 () Bool)

(assert (=> b!177780 m!205775))

(assert (=> b!177785 m!205729))

(assert (=> b!177785 m!205729))

(declare-fun m!205777 () Bool)

(assert (=> b!177785 m!205777))

(assert (=> d!53693 m!205679))

(declare-fun m!205779 () Bool)

(assert (=> b!177783 m!205779))

(assert (=> b!177654 d!53693))

(declare-fun d!53695 () Bool)

(assert (=> d!53695 (= (array_inv!2283 (_keys!5530 thiss!1248)) (bvsge (size!3844 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177660 d!53695))

(declare-fun d!53697 () Bool)

(assert (=> d!53697 (= (array_inv!2284 (_values!3642 thiss!1248)) (bvsge (size!3845 (_values!3642 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177660 d!53697))

(declare-fun b!177803 () Bool)

(declare-fun e!117220 () SeekEntryResult!580)

(declare-fun e!117221 () SeekEntryResult!580)

(assert (=> b!177803 (= e!117220 e!117221)))

(declare-fun lt!87775 () (_ BitVec 64))

(declare-fun lt!87774 () SeekEntryResult!580)

(assert (=> b!177803 (= lt!87775 (select (arr!3538 (_keys!5530 thiss!1248)) (index!4490 lt!87774)))))

(declare-fun c!31849 () Bool)

(assert (=> b!177803 (= c!31849 (= lt!87775 key!828))))

(declare-fun b!177804 () Bool)

(declare-fun c!31851 () Bool)

(assert (=> b!177804 (= c!31851 (= lt!87775 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!117219 () SeekEntryResult!580)

(assert (=> b!177804 (= e!117221 e!117219)))

(declare-fun b!177805 () Bool)

(assert (=> b!177805 (= e!117220 Undefined!580)))

(declare-fun b!177807 () Bool)

(assert (=> b!177807 (= e!117221 (Found!580 (index!4490 lt!87774)))))

(declare-fun b!177808 () Bool)

(assert (=> b!177808 (= e!117219 (MissingZero!580 (index!4490 lt!87774)))))

(declare-fun b!177806 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7465 (_ BitVec 32)) SeekEntryResult!580)

(assert (=> b!177806 (= e!117219 (seekKeyOrZeroReturnVacant!0 (x!19503 lt!87774) (index!4490 lt!87774) (index!4490 lt!87774) key!828 (_keys!5530 thiss!1248) (mask!8606 thiss!1248)))))

(declare-fun d!53699 () Bool)

(declare-fun lt!87773 () SeekEntryResult!580)

(assert (=> d!53699 (and (or ((_ is Undefined!580) lt!87773) (not ((_ is Found!580) lt!87773)) (and (bvsge (index!4489 lt!87773) #b00000000000000000000000000000000) (bvslt (index!4489 lt!87773) (size!3844 (_keys!5530 thiss!1248))))) (or ((_ is Undefined!580) lt!87773) ((_ is Found!580) lt!87773) (not ((_ is MissingZero!580) lt!87773)) (and (bvsge (index!4488 lt!87773) #b00000000000000000000000000000000) (bvslt (index!4488 lt!87773) (size!3844 (_keys!5530 thiss!1248))))) (or ((_ is Undefined!580) lt!87773) ((_ is Found!580) lt!87773) ((_ is MissingZero!580) lt!87773) (not ((_ is MissingVacant!580) lt!87773)) (and (bvsge (index!4491 lt!87773) #b00000000000000000000000000000000) (bvslt (index!4491 lt!87773) (size!3844 (_keys!5530 thiss!1248))))) (or ((_ is Undefined!580) lt!87773) (ite ((_ is Found!580) lt!87773) (= (select (arr!3538 (_keys!5530 thiss!1248)) (index!4489 lt!87773)) key!828) (ite ((_ is MissingZero!580) lt!87773) (= (select (arr!3538 (_keys!5530 thiss!1248)) (index!4488 lt!87773)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!580) lt!87773) (= (select (arr!3538 (_keys!5530 thiss!1248)) (index!4491 lt!87773)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53699 (= lt!87773 e!117220)))

(declare-fun c!31850 () Bool)

(assert (=> d!53699 (= c!31850 (and ((_ is Intermediate!580) lt!87774) (undefined!1392 lt!87774)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7465 (_ BitVec 32)) SeekEntryResult!580)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53699 (= lt!87774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8606 thiss!1248)) key!828 (_keys!5530 thiss!1248) (mask!8606 thiss!1248)))))

(assert (=> d!53699 (validMask!0 (mask!8606 thiss!1248))))

(assert (=> d!53699 (= (seekEntryOrOpen!0 key!828 (_keys!5530 thiss!1248) (mask!8606 thiss!1248)) lt!87773)))

(assert (= (and d!53699 c!31850) b!177805))

(assert (= (and d!53699 (not c!31850)) b!177803))

(assert (= (and b!177803 c!31849) b!177807))

(assert (= (and b!177803 (not c!31849)) b!177804))

(assert (= (and b!177804 c!31851) b!177808))

(assert (= (and b!177804 (not c!31851)) b!177806))

(declare-fun m!205781 () Bool)

(assert (=> b!177803 m!205781))

(declare-fun m!205783 () Bool)

(assert (=> b!177806 m!205783))

(assert (=> d!53699 m!205679))

(declare-fun m!205785 () Bool)

(assert (=> d!53699 m!205785))

(declare-fun m!205787 () Bool)

(assert (=> d!53699 m!205787))

(assert (=> d!53699 m!205785))

(declare-fun m!205789 () Bool)

(assert (=> d!53699 m!205789))

(declare-fun m!205791 () Bool)

(assert (=> d!53699 m!205791))

(declare-fun m!205793 () Bool)

(assert (=> d!53699 m!205793))

(assert (=> b!177655 d!53699))

(declare-fun d!53701 () Bool)

(assert (=> d!53701 (= (validMask!0 (mask!8606 thiss!1248)) (and (or (= (mask!8606 thiss!1248) #b00000000000000000000000000000111) (= (mask!8606 thiss!1248) #b00000000000000000000000000001111) (= (mask!8606 thiss!1248) #b00000000000000000000000000011111) (= (mask!8606 thiss!1248) #b00000000000000000000000000111111) (= (mask!8606 thiss!1248) #b00000000000000000000000001111111) (= (mask!8606 thiss!1248) #b00000000000000000000000011111111) (= (mask!8606 thiss!1248) #b00000000000000000000000111111111) (= (mask!8606 thiss!1248) #b00000000000000000000001111111111) (= (mask!8606 thiss!1248) #b00000000000000000000011111111111) (= (mask!8606 thiss!1248) #b00000000000000000000111111111111) (= (mask!8606 thiss!1248) #b00000000000000000001111111111111) (= (mask!8606 thiss!1248) #b00000000000000000011111111111111) (= (mask!8606 thiss!1248) #b00000000000000000111111111111111) (= (mask!8606 thiss!1248) #b00000000000000001111111111111111) (= (mask!8606 thiss!1248) #b00000000000000011111111111111111) (= (mask!8606 thiss!1248) #b00000000000000111111111111111111) (= (mask!8606 thiss!1248) #b00000000000001111111111111111111) (= (mask!8606 thiss!1248) #b00000000000011111111111111111111) (= (mask!8606 thiss!1248) #b00000000000111111111111111111111) (= (mask!8606 thiss!1248) #b00000000001111111111111111111111) (= (mask!8606 thiss!1248) #b00000000011111111111111111111111) (= (mask!8606 thiss!1248) #b00000000111111111111111111111111) (= (mask!8606 thiss!1248) #b00000001111111111111111111111111) (= (mask!8606 thiss!1248) #b00000011111111111111111111111111) (= (mask!8606 thiss!1248) #b00000111111111111111111111111111) (= (mask!8606 thiss!1248) #b00001111111111111111111111111111) (= (mask!8606 thiss!1248) #b00011111111111111111111111111111) (= (mask!8606 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8606 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!177662 d!53701))

(declare-fun d!53703 () Bool)

(declare-fun res!84234 () Bool)

(declare-fun e!117224 () Bool)

(assert (=> d!53703 (=> (not res!84234) (not e!117224))))

(declare-fun simpleValid!156 (LongMapFixedSize!2386) Bool)

(assert (=> d!53703 (= res!84234 (simpleValid!156 thiss!1248))))

(assert (=> d!53703 (= (valid!1015 thiss!1248) e!117224)))

(declare-fun b!177815 () Bool)

(declare-fun res!84235 () Bool)

(assert (=> b!177815 (=> (not res!84235) (not e!117224))))

(declare-fun arrayCountValidKeys!0 (array!7465 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!177815 (= res!84235 (= (arrayCountValidKeys!0 (_keys!5530 thiss!1248) #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))) (_size!1242 thiss!1248)))))

(declare-fun b!177816 () Bool)

(declare-fun res!84236 () Bool)

(assert (=> b!177816 (=> (not res!84236) (not e!117224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7465 (_ BitVec 32)) Bool)

(assert (=> b!177816 (= res!84236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5530 thiss!1248) (mask!8606 thiss!1248)))))

(declare-fun b!177817 () Bool)

(declare-datatypes ((List!2260 0))(
  ( (Nil!2257) (Cons!2256 (h!2878 (_ BitVec 64)) (t!7087 List!2260)) )
))
(declare-fun arrayNoDuplicates!0 (array!7465 (_ BitVec 32) List!2260) Bool)

(assert (=> b!177817 (= e!117224 (arrayNoDuplicates!0 (_keys!5530 thiss!1248) #b00000000000000000000000000000000 Nil!2257))))

(assert (= (and d!53703 res!84234) b!177815))

(assert (= (and b!177815 res!84235) b!177816))

(assert (= (and b!177816 res!84236) b!177817))

(declare-fun m!205795 () Bool)

(assert (=> d!53703 m!205795))

(declare-fun m!205797 () Bool)

(assert (=> b!177815 m!205797))

(declare-fun m!205799 () Bool)

(assert (=> b!177816 m!205799))

(declare-fun m!205801 () Bool)

(assert (=> b!177817 m!205801))

(assert (=> start!17808 d!53703))

(declare-fun mapIsEmpty!7126 () Bool)

(declare-fun mapRes!7126 () Bool)

(assert (=> mapIsEmpty!7126 mapRes!7126))

(declare-fun b!177825 () Bool)

(declare-fun e!117230 () Bool)

(assert (=> b!177825 (= e!117230 tp_is_empty!4165)))

(declare-fun condMapEmpty!7126 () Bool)

(declare-fun mapDefault!7126 () ValueCell!1739)

(assert (=> mapNonEmpty!7117 (= condMapEmpty!7126 (= mapRest!7117 ((as const (Array (_ BitVec 32) ValueCell!1739)) mapDefault!7126)))))

(assert (=> mapNonEmpty!7117 (= tp!15885 (and e!117230 mapRes!7126))))

(declare-fun mapNonEmpty!7126 () Bool)

(declare-fun tp!15901 () Bool)

(declare-fun e!117229 () Bool)

(assert (=> mapNonEmpty!7126 (= mapRes!7126 (and tp!15901 e!117229))))

(declare-fun mapRest!7126 () (Array (_ BitVec 32) ValueCell!1739))

(declare-fun mapKey!7126 () (_ BitVec 32))

(declare-fun mapValue!7126 () ValueCell!1739)

(assert (=> mapNonEmpty!7126 (= mapRest!7117 (store mapRest!7126 mapKey!7126 mapValue!7126))))

(declare-fun b!177824 () Bool)

(assert (=> b!177824 (= e!117229 tp_is_empty!4165)))

(assert (= (and mapNonEmpty!7117 condMapEmpty!7126) mapIsEmpty!7126))

(assert (= (and mapNonEmpty!7117 (not condMapEmpty!7126)) mapNonEmpty!7126))

(assert (= (and mapNonEmpty!7126 ((_ is ValueCellFull!1739) mapValue!7126)) b!177824))

(assert (= (and mapNonEmpty!7117 ((_ is ValueCellFull!1739) mapDefault!7126)) b!177825))

(declare-fun m!205803 () Bool)

(assert (=> mapNonEmpty!7126 m!205803))

(declare-fun b_lambda!7051 () Bool)

(assert (= b_lambda!7049 (or (and b!177660 b_free!4393) b_lambda!7051)))

(check-sat (not b!177779) (not b!177785) (not b_next!4393) (not b!177780) (not b!177788) (not d!53699) (not b!177783) (not bm!17965) (not b!177817) (not b!177806) b_and!10881 (not b!177815) (not bm!17967) (not b!177775) (not b!177816) (not d!53703) (not d!53691) (not bm!17966) (not b_lambda!7051) (not bm!17968) (not b!177725) (not b!177723) (not b!177772) tp_is_empty!4165 (not mapNonEmpty!7126) (not b!177784) (not d!53693))
(check-sat b_and!10881 (not b_next!4393))
(get-model)

(declare-fun d!53705 () Bool)

(declare-fun e!117231 () Bool)

(assert (=> d!53705 e!117231))

(declare-fun res!84237 () Bool)

(assert (=> d!53705 (=> res!84237 e!117231)))

(declare-fun lt!87777 () Bool)

(assert (=> d!53705 (= res!84237 (not lt!87777))))

(declare-fun lt!87776 () Bool)

(assert (=> d!53705 (= lt!87777 lt!87776)))

(declare-fun lt!87778 () Unit!5405)

(declare-fun e!117232 () Unit!5405)

(assert (=> d!53705 (= lt!87778 e!117232)))

(declare-fun c!31852 () Bool)

(assert (=> d!53705 (= c!31852 lt!87776)))

(assert (=> d!53705 (= lt!87776 (containsKey!199 (toList!1121 lt!87763) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53705 (= (contains!1194 lt!87763 #b0000000000000000000000000000000000000000000000000000000000000000) lt!87777)))

(declare-fun b!177826 () Bool)

(declare-fun lt!87779 () Unit!5405)

(assert (=> b!177826 (= e!117232 lt!87779)))

(assert (=> b!177826 (= lt!87779 (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1121 lt!87763) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!177826 (isDefined!149 (getValueByKey!195 (toList!1121 lt!87763) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177827 () Bool)

(declare-fun Unit!5409 () Unit!5405)

(assert (=> b!177827 (= e!117232 Unit!5409)))

(declare-fun b!177828 () Bool)

(assert (=> b!177828 (= e!117231 (isDefined!149 (getValueByKey!195 (toList!1121 lt!87763) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53705 c!31852) b!177826))

(assert (= (and d!53705 (not c!31852)) b!177827))

(assert (= (and d!53705 (not res!84237)) b!177828))

(declare-fun m!205805 () Bool)

(assert (=> d!53705 m!205805))

(declare-fun m!205807 () Bool)

(assert (=> b!177826 m!205807))

(declare-fun m!205809 () Bool)

(assert (=> b!177826 m!205809))

(assert (=> b!177826 m!205809))

(declare-fun m!205811 () Bool)

(assert (=> b!177826 m!205811))

(assert (=> b!177828 m!205809))

(assert (=> b!177828 m!205809))

(assert (=> b!177828 m!205811))

(assert (=> bm!17968 d!53705))

(declare-fun d!53707 () Bool)

(declare-fun e!117235 () Bool)

(assert (=> d!53707 e!117235))

(declare-fun res!84243 () Bool)

(assert (=> d!53707 (=> (not res!84243) (not e!117235))))

(declare-fun lt!87791 () ListLongMap!2211)

(assert (=> d!53707 (= res!84243 (contains!1194 lt!87791 (_1!1657 (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))))))

(declare-fun lt!87790 () List!2259)

(assert (=> d!53707 (= lt!87791 (ListLongMap!2212 lt!87790))))

(declare-fun lt!87789 () Unit!5405)

(declare-fun lt!87788 () Unit!5405)

(assert (=> d!53707 (= lt!87789 lt!87788)))

(assert (=> d!53707 (= (getValueByKey!195 lt!87790 (_1!1657 (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))) (Some!200 (_2!1657 (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!105 (List!2259 (_ BitVec 64) V!5201) Unit!5405)

(assert (=> d!53707 (= lt!87788 (lemmaContainsTupThenGetReturnValue!105 lt!87790 (_1!1657 (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))) (_2!1657 (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))))))

(declare-fun insertStrictlySorted!108 (List!2259 (_ BitVec 64) V!5201) List!2259)

(assert (=> d!53707 (= lt!87790 (insertStrictlySorted!108 (toList!1121 call!17974) (_1!1657 (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))) (_2!1657 (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))))))

(assert (=> d!53707 (= (+!254 call!17974 (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))) lt!87791)))

(declare-fun b!177833 () Bool)

(declare-fun res!84242 () Bool)

(assert (=> b!177833 (=> (not res!84242) (not e!117235))))

(assert (=> b!177833 (= res!84242 (= (getValueByKey!195 (toList!1121 lt!87791) (_1!1657 (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))) (Some!200 (_2!1657 (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))))))

(declare-fun b!177834 () Bool)

(declare-fun contains!1195 (List!2259 tuple2!3292) Bool)

(assert (=> b!177834 (= e!117235 (contains!1195 (toList!1121 lt!87791) (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))))

(assert (= (and d!53707 res!84243) b!177833))

(assert (= (and b!177833 res!84242) b!177834))

(declare-fun m!205813 () Bool)

(assert (=> d!53707 m!205813))

(declare-fun m!205815 () Bool)

(assert (=> d!53707 m!205815))

(declare-fun m!205817 () Bool)

(assert (=> d!53707 m!205817))

(declare-fun m!205819 () Bool)

(assert (=> d!53707 m!205819))

(declare-fun m!205821 () Bool)

(assert (=> b!177833 m!205821))

(declare-fun m!205823 () Bool)

(assert (=> b!177834 m!205823))

(assert (=> b!177772 d!53707))

(declare-fun d!53709 () Bool)

(assert (=> d!53709 (= (apply!142 (+!254 lt!87753 (tuple2!3293 lt!87746 (zeroValue!3500 thiss!1248))) lt!87747) (apply!142 lt!87753 lt!87747))))

(declare-fun lt!87794 () Unit!5405)

(declare-fun choose!956 (ListLongMap!2211 (_ BitVec 64) V!5201 (_ BitVec 64)) Unit!5405)

(assert (=> d!53709 (= lt!87794 (choose!956 lt!87753 lt!87746 (zeroValue!3500 thiss!1248) lt!87747))))

(declare-fun e!117238 () Bool)

(assert (=> d!53709 e!117238))

(declare-fun res!84246 () Bool)

(assert (=> d!53709 (=> (not res!84246) (not e!117238))))

(assert (=> d!53709 (= res!84246 (contains!1194 lt!87753 lt!87747))))

(assert (=> d!53709 (= (addApplyDifferent!118 lt!87753 lt!87746 (zeroValue!3500 thiss!1248) lt!87747) lt!87794)))

(declare-fun b!177838 () Bool)

(assert (=> b!177838 (= e!117238 (not (= lt!87747 lt!87746)))))

(assert (= (and d!53709 res!84246) b!177838))

(assert (=> d!53709 m!205747))

(assert (=> d!53709 m!205755))

(declare-fun m!205825 () Bool)

(assert (=> d!53709 m!205825))

(assert (=> d!53709 m!205761))

(assert (=> d!53709 m!205747))

(declare-fun m!205827 () Bool)

(assert (=> d!53709 m!205827))

(assert (=> b!177780 d!53709))

(declare-fun d!53711 () Bool)

(assert (=> d!53711 (= (apply!142 (+!254 lt!87757 (tuple2!3293 lt!87751 (minValue!3500 thiss!1248))) lt!87762) (apply!142 lt!87757 lt!87762))))

(declare-fun lt!87795 () Unit!5405)

(assert (=> d!53711 (= lt!87795 (choose!956 lt!87757 lt!87751 (minValue!3500 thiss!1248) lt!87762))))

(declare-fun e!117239 () Bool)

(assert (=> d!53711 e!117239))

(declare-fun res!84247 () Bool)

(assert (=> d!53711 (=> (not res!84247) (not e!117239))))

(assert (=> d!53711 (= res!84247 (contains!1194 lt!87757 lt!87762))))

(assert (=> d!53711 (= (addApplyDifferent!118 lt!87757 lt!87751 (minValue!3500 thiss!1248) lt!87762) lt!87795)))

(declare-fun b!177839 () Bool)

(assert (=> b!177839 (= e!117239 (not (= lt!87762 lt!87751)))))

(assert (= (and d!53711 res!84247) b!177839))

(assert (=> d!53711 m!205751))

(assert (=> d!53711 m!205753))

(declare-fun m!205829 () Bool)

(assert (=> d!53711 m!205829))

(assert (=> d!53711 m!205759))

(assert (=> d!53711 m!205751))

(declare-fun m!205831 () Bool)

(assert (=> d!53711 m!205831))

(assert (=> b!177780 d!53711))

(declare-fun d!53713 () Bool)

(declare-fun get!2021 (Option!201) V!5201)

(assert (=> d!53713 (= (apply!142 (+!254 lt!87765 (tuple2!3293 lt!87766 (minValue!3500 thiss!1248))) lt!87750) (get!2021 (getValueByKey!195 (toList!1121 (+!254 lt!87765 (tuple2!3293 lt!87766 (minValue!3500 thiss!1248)))) lt!87750)))))

(declare-fun bs!7282 () Bool)

(assert (= bs!7282 d!53713))

(declare-fun m!205833 () Bool)

(assert (=> bs!7282 m!205833))

(assert (=> bs!7282 m!205833))

(declare-fun m!205835 () Bool)

(assert (=> bs!7282 m!205835))

(assert (=> b!177780 d!53713))

(declare-fun d!53715 () Bool)

(declare-fun e!117240 () Bool)

(assert (=> d!53715 e!117240))

(declare-fun res!84249 () Bool)

(assert (=> d!53715 (=> (not res!84249) (not e!117240))))

(declare-fun lt!87799 () ListLongMap!2211)

(assert (=> d!53715 (= res!84249 (contains!1194 lt!87799 (_1!1657 (tuple2!3293 lt!87751 (minValue!3500 thiss!1248)))))))

(declare-fun lt!87798 () List!2259)

(assert (=> d!53715 (= lt!87799 (ListLongMap!2212 lt!87798))))

(declare-fun lt!87797 () Unit!5405)

(declare-fun lt!87796 () Unit!5405)

(assert (=> d!53715 (= lt!87797 lt!87796)))

(assert (=> d!53715 (= (getValueByKey!195 lt!87798 (_1!1657 (tuple2!3293 lt!87751 (minValue!3500 thiss!1248)))) (Some!200 (_2!1657 (tuple2!3293 lt!87751 (minValue!3500 thiss!1248)))))))

(assert (=> d!53715 (= lt!87796 (lemmaContainsTupThenGetReturnValue!105 lt!87798 (_1!1657 (tuple2!3293 lt!87751 (minValue!3500 thiss!1248))) (_2!1657 (tuple2!3293 lt!87751 (minValue!3500 thiss!1248)))))))

(assert (=> d!53715 (= lt!87798 (insertStrictlySorted!108 (toList!1121 lt!87757) (_1!1657 (tuple2!3293 lt!87751 (minValue!3500 thiss!1248))) (_2!1657 (tuple2!3293 lt!87751 (minValue!3500 thiss!1248)))))))

(assert (=> d!53715 (= (+!254 lt!87757 (tuple2!3293 lt!87751 (minValue!3500 thiss!1248))) lt!87799)))

(declare-fun b!177840 () Bool)

(declare-fun res!84248 () Bool)

(assert (=> b!177840 (=> (not res!84248) (not e!117240))))

(assert (=> b!177840 (= res!84248 (= (getValueByKey!195 (toList!1121 lt!87799) (_1!1657 (tuple2!3293 lt!87751 (minValue!3500 thiss!1248)))) (Some!200 (_2!1657 (tuple2!3293 lt!87751 (minValue!3500 thiss!1248))))))))

(declare-fun b!177841 () Bool)

(assert (=> b!177841 (= e!117240 (contains!1195 (toList!1121 lt!87799) (tuple2!3293 lt!87751 (minValue!3500 thiss!1248))))))

(assert (= (and d!53715 res!84249) b!177840))

(assert (= (and b!177840 res!84248) b!177841))

(declare-fun m!205837 () Bool)

(assert (=> d!53715 m!205837))

(declare-fun m!205839 () Bool)

(assert (=> d!53715 m!205839))

(declare-fun m!205841 () Bool)

(assert (=> d!53715 m!205841))

(declare-fun m!205843 () Bool)

(assert (=> d!53715 m!205843))

(declare-fun m!205845 () Bool)

(assert (=> b!177840 m!205845))

(declare-fun m!205847 () Bool)

(assert (=> b!177841 m!205847))

(assert (=> b!177780 d!53715))

(declare-fun d!53717 () Bool)

(declare-fun e!117241 () Bool)

(assert (=> d!53717 e!117241))

(declare-fun res!84251 () Bool)

(assert (=> d!53717 (=> (not res!84251) (not e!117241))))

(declare-fun lt!87803 () ListLongMap!2211)

(assert (=> d!53717 (= res!84251 (contains!1194 lt!87803 (_1!1657 (tuple2!3293 lt!87766 (minValue!3500 thiss!1248)))))))

(declare-fun lt!87802 () List!2259)

(assert (=> d!53717 (= lt!87803 (ListLongMap!2212 lt!87802))))

(declare-fun lt!87801 () Unit!5405)

(declare-fun lt!87800 () Unit!5405)

(assert (=> d!53717 (= lt!87801 lt!87800)))

(assert (=> d!53717 (= (getValueByKey!195 lt!87802 (_1!1657 (tuple2!3293 lt!87766 (minValue!3500 thiss!1248)))) (Some!200 (_2!1657 (tuple2!3293 lt!87766 (minValue!3500 thiss!1248)))))))

(assert (=> d!53717 (= lt!87800 (lemmaContainsTupThenGetReturnValue!105 lt!87802 (_1!1657 (tuple2!3293 lt!87766 (minValue!3500 thiss!1248))) (_2!1657 (tuple2!3293 lt!87766 (minValue!3500 thiss!1248)))))))

(assert (=> d!53717 (= lt!87802 (insertStrictlySorted!108 (toList!1121 lt!87765) (_1!1657 (tuple2!3293 lt!87766 (minValue!3500 thiss!1248))) (_2!1657 (tuple2!3293 lt!87766 (minValue!3500 thiss!1248)))))))

(assert (=> d!53717 (= (+!254 lt!87765 (tuple2!3293 lt!87766 (minValue!3500 thiss!1248))) lt!87803)))

(declare-fun b!177842 () Bool)

(declare-fun res!84250 () Bool)

(assert (=> b!177842 (=> (not res!84250) (not e!117241))))

(assert (=> b!177842 (= res!84250 (= (getValueByKey!195 (toList!1121 lt!87803) (_1!1657 (tuple2!3293 lt!87766 (minValue!3500 thiss!1248)))) (Some!200 (_2!1657 (tuple2!3293 lt!87766 (minValue!3500 thiss!1248))))))))

(declare-fun b!177843 () Bool)

(assert (=> b!177843 (= e!117241 (contains!1195 (toList!1121 lt!87803) (tuple2!3293 lt!87766 (minValue!3500 thiss!1248))))))

(assert (= (and d!53717 res!84251) b!177842))

(assert (= (and b!177842 res!84250) b!177843))

(declare-fun m!205849 () Bool)

(assert (=> d!53717 m!205849))

(declare-fun m!205851 () Bool)

(assert (=> d!53717 m!205851))

(declare-fun m!205853 () Bool)

(assert (=> d!53717 m!205853))

(declare-fun m!205855 () Bool)

(assert (=> d!53717 m!205855))

(declare-fun m!205857 () Bool)

(assert (=> b!177842 m!205857))

(declare-fun m!205859 () Bool)

(assert (=> b!177843 m!205859))

(assert (=> b!177780 d!53717))

(declare-fun d!53719 () Bool)

(assert (=> d!53719 (contains!1194 (+!254 lt!87760 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248))) lt!87764)))

(declare-fun lt!87806 () Unit!5405)

(declare-fun choose!957 (ListLongMap!2211 (_ BitVec 64) V!5201 (_ BitVec 64)) Unit!5405)

(assert (=> d!53719 (= lt!87806 (choose!957 lt!87760 lt!87756 (zeroValue!3500 thiss!1248) lt!87764))))

(assert (=> d!53719 (contains!1194 lt!87760 lt!87764)))

(assert (=> d!53719 (= (addStillContains!118 lt!87760 lt!87756 (zeroValue!3500 thiss!1248) lt!87764) lt!87806)))

(declare-fun bs!7283 () Bool)

(assert (= bs!7283 d!53719))

(assert (=> bs!7283 m!205763))

(assert (=> bs!7283 m!205763))

(assert (=> bs!7283 m!205765))

(declare-fun m!205861 () Bool)

(assert (=> bs!7283 m!205861))

(declare-fun m!205863 () Bool)

(assert (=> bs!7283 m!205863))

(assert (=> b!177780 d!53719))

(declare-fun d!53721 () Bool)

(assert (=> d!53721 (= (apply!142 lt!87757 lt!87762) (get!2021 (getValueByKey!195 (toList!1121 lt!87757) lt!87762)))))

(declare-fun bs!7284 () Bool)

(assert (= bs!7284 d!53721))

(declare-fun m!205865 () Bool)

(assert (=> bs!7284 m!205865))

(assert (=> bs!7284 m!205865))

(declare-fun m!205867 () Bool)

(assert (=> bs!7284 m!205867))

(assert (=> b!177780 d!53721))

(declare-fun d!53723 () Bool)

(assert (=> d!53723 (= (apply!142 lt!87753 lt!87747) (get!2021 (getValueByKey!195 (toList!1121 lt!87753) lt!87747)))))

(declare-fun bs!7285 () Bool)

(assert (= bs!7285 d!53723))

(declare-fun m!205869 () Bool)

(assert (=> bs!7285 m!205869))

(assert (=> bs!7285 m!205869))

(declare-fun m!205871 () Bool)

(assert (=> bs!7285 m!205871))

(assert (=> b!177780 d!53723))

(declare-fun d!53725 () Bool)

(declare-fun e!117242 () Bool)

(assert (=> d!53725 e!117242))

(declare-fun res!84253 () Bool)

(assert (=> d!53725 (=> (not res!84253) (not e!117242))))

(declare-fun lt!87810 () ListLongMap!2211)

(assert (=> d!53725 (= res!84253 (contains!1194 lt!87810 (_1!1657 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248)))))))

(declare-fun lt!87809 () List!2259)

(assert (=> d!53725 (= lt!87810 (ListLongMap!2212 lt!87809))))

(declare-fun lt!87808 () Unit!5405)

(declare-fun lt!87807 () Unit!5405)

(assert (=> d!53725 (= lt!87808 lt!87807)))

(assert (=> d!53725 (= (getValueByKey!195 lt!87809 (_1!1657 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248)))) (Some!200 (_2!1657 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248)))))))

(assert (=> d!53725 (= lt!87807 (lemmaContainsTupThenGetReturnValue!105 lt!87809 (_1!1657 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248))) (_2!1657 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248)))))))

(assert (=> d!53725 (= lt!87809 (insertStrictlySorted!108 (toList!1121 lt!87760) (_1!1657 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248))) (_2!1657 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248)))))))

(assert (=> d!53725 (= (+!254 lt!87760 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248))) lt!87810)))

(declare-fun b!177845 () Bool)

(declare-fun res!84252 () Bool)

(assert (=> b!177845 (=> (not res!84252) (not e!117242))))

(assert (=> b!177845 (= res!84252 (= (getValueByKey!195 (toList!1121 lt!87810) (_1!1657 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248)))) (Some!200 (_2!1657 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248))))))))

(declare-fun b!177846 () Bool)

(assert (=> b!177846 (= e!117242 (contains!1195 (toList!1121 lt!87810) (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248))))))

(assert (= (and d!53725 res!84253) b!177845))

(assert (= (and b!177845 res!84252) b!177846))

(declare-fun m!205873 () Bool)

(assert (=> d!53725 m!205873))

(declare-fun m!205875 () Bool)

(assert (=> d!53725 m!205875))

(declare-fun m!205877 () Bool)

(assert (=> d!53725 m!205877))

(declare-fun m!205879 () Bool)

(assert (=> d!53725 m!205879))

(declare-fun m!205881 () Bool)

(assert (=> b!177845 m!205881))

(declare-fun m!205883 () Bool)

(assert (=> b!177846 m!205883))

(assert (=> b!177780 d!53725))

(declare-fun d!53727 () Bool)

(assert (=> d!53727 (= (apply!142 (+!254 lt!87753 (tuple2!3293 lt!87746 (zeroValue!3500 thiss!1248))) lt!87747) (get!2021 (getValueByKey!195 (toList!1121 (+!254 lt!87753 (tuple2!3293 lt!87746 (zeroValue!3500 thiss!1248)))) lt!87747)))))

(declare-fun bs!7286 () Bool)

(assert (= bs!7286 d!53727))

(declare-fun m!205885 () Bool)

(assert (=> bs!7286 m!205885))

(assert (=> bs!7286 m!205885))

(declare-fun m!205887 () Bool)

(assert (=> bs!7286 m!205887))

(assert (=> b!177780 d!53727))

(declare-fun d!53729 () Bool)

(assert (=> d!53729 (= (apply!142 lt!87765 lt!87750) (get!2021 (getValueByKey!195 (toList!1121 lt!87765) lt!87750)))))

(declare-fun bs!7287 () Bool)

(assert (= bs!7287 d!53729))

(declare-fun m!205889 () Bool)

(assert (=> bs!7287 m!205889))

(assert (=> bs!7287 m!205889))

(declare-fun m!205891 () Bool)

(assert (=> bs!7287 m!205891))

(assert (=> b!177780 d!53729))

(declare-fun d!53731 () Bool)

(assert (=> d!53731 (= (apply!142 (+!254 lt!87765 (tuple2!3293 lt!87766 (minValue!3500 thiss!1248))) lt!87750) (apply!142 lt!87765 lt!87750))))

(declare-fun lt!87811 () Unit!5405)

(assert (=> d!53731 (= lt!87811 (choose!956 lt!87765 lt!87766 (minValue!3500 thiss!1248) lt!87750))))

(declare-fun e!117243 () Bool)

(assert (=> d!53731 e!117243))

(declare-fun res!84254 () Bool)

(assert (=> d!53731 (=> (not res!84254) (not e!117243))))

(assert (=> d!53731 (= res!84254 (contains!1194 lt!87765 lt!87750))))

(assert (=> d!53731 (= (addApplyDifferent!118 lt!87765 lt!87766 (minValue!3500 thiss!1248) lt!87750) lt!87811)))

(declare-fun b!177847 () Bool)

(assert (=> b!177847 (= e!117243 (not (= lt!87750 lt!87766)))))

(assert (= (and d!53731 res!84254) b!177847))

(assert (=> d!53731 m!205749))

(assert (=> d!53731 m!205775))

(declare-fun m!205893 () Bool)

(assert (=> d!53731 m!205893))

(assert (=> d!53731 m!205771))

(assert (=> d!53731 m!205749))

(declare-fun m!205895 () Bool)

(assert (=> d!53731 m!205895))

(assert (=> b!177780 d!53731))

(declare-fun d!53733 () Bool)

(assert (=> d!53733 (= (apply!142 (+!254 lt!87757 (tuple2!3293 lt!87751 (minValue!3500 thiss!1248))) lt!87762) (get!2021 (getValueByKey!195 (toList!1121 (+!254 lt!87757 (tuple2!3293 lt!87751 (minValue!3500 thiss!1248)))) lt!87762)))))

(declare-fun bs!7288 () Bool)

(assert (= bs!7288 d!53733))

(declare-fun m!205897 () Bool)

(assert (=> bs!7288 m!205897))

(assert (=> bs!7288 m!205897))

(declare-fun m!205899 () Bool)

(assert (=> bs!7288 m!205899))

(assert (=> b!177780 d!53733))

(declare-fun b!177872 () Bool)

(declare-fun e!117262 () Bool)

(declare-fun e!117263 () Bool)

(assert (=> b!177872 (= e!117262 e!117263)))

(assert (=> b!177872 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))))))

(declare-fun res!84263 () Bool)

(declare-fun lt!87830 () ListLongMap!2211)

(assert (=> b!177872 (= res!84263 (contains!1194 lt!87830 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177872 (=> (not res!84263) (not e!117263))))

(declare-fun b!177873 () Bool)

(declare-fun e!117264 () ListLongMap!2211)

(assert (=> b!177873 (= e!117264 (ListLongMap!2212 Nil!2256))))

(declare-fun b!177874 () Bool)

(declare-fun e!117261 () Bool)

(assert (=> b!177874 (= e!117261 (validKeyInArray!0 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177874 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!177875 () Bool)

(declare-fun e!117259 () Bool)

(declare-fun isEmpty!453 (ListLongMap!2211) Bool)

(assert (=> b!177875 (= e!117259 (isEmpty!453 lt!87830))))

(declare-fun bm!17974 () Bool)

(declare-fun call!17977 () ListLongMap!2211)

(assert (=> bm!17974 (= call!17977 (getCurrentListMapNoExtraKeys!163 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3659 thiss!1248)))))

(declare-fun b!177876 () Bool)

(declare-fun e!117260 () ListLongMap!2211)

(assert (=> b!177876 (= e!117260 call!17977)))

(declare-fun b!177877 () Bool)

(assert (=> b!177877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))))))

(assert (=> b!177877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3845 (_values!3642 thiss!1248))))))

(assert (=> b!177877 (= e!117263 (= (apply!142 lt!87830 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)) (get!2020 (select (arr!3539 (_values!3642 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3659 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!53735 () Bool)

(declare-fun e!117258 () Bool)

(assert (=> d!53735 e!117258))

(declare-fun res!84266 () Bool)

(assert (=> d!53735 (=> (not res!84266) (not e!117258))))

(assert (=> d!53735 (= res!84266 (not (contains!1194 lt!87830 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53735 (= lt!87830 e!117264)))

(declare-fun c!31862 () Bool)

(assert (=> d!53735 (= c!31862 (bvsge #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))))))

(assert (=> d!53735 (validMask!0 (mask!8606 thiss!1248))))

(assert (=> d!53735 (= (getCurrentListMapNoExtraKeys!163 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)) lt!87830)))

(declare-fun b!177878 () Bool)

(assert (=> b!177878 (= e!117264 e!117260)))

(declare-fun c!31861 () Bool)

(assert (=> b!177878 (= c!31861 (validKeyInArray!0 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177879 () Bool)

(declare-fun lt!87831 () Unit!5405)

(declare-fun lt!87827 () Unit!5405)

(assert (=> b!177879 (= lt!87831 lt!87827)))

(declare-fun lt!87829 () ListLongMap!2211)

(declare-fun lt!87832 () V!5201)

(declare-fun lt!87826 () (_ BitVec 64))

(declare-fun lt!87828 () (_ BitVec 64))

(assert (=> b!177879 (not (contains!1194 (+!254 lt!87829 (tuple2!3293 lt!87828 lt!87832)) lt!87826))))

(declare-fun addStillNotContains!79 (ListLongMap!2211 (_ BitVec 64) V!5201 (_ BitVec 64)) Unit!5405)

(assert (=> b!177879 (= lt!87827 (addStillNotContains!79 lt!87829 lt!87828 lt!87832 lt!87826))))

(assert (=> b!177879 (= lt!87826 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!177879 (= lt!87832 (get!2020 (select (arr!3539 (_values!3642 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3659 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177879 (= lt!87828 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177879 (= lt!87829 call!17977)))

(assert (=> b!177879 (= e!117260 (+!254 call!17977 (tuple2!3293 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000) (get!2020 (select (arr!3539 (_values!3642 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3659 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!177880 () Bool)

(assert (=> b!177880 (= e!117262 e!117259)))

(declare-fun c!31863 () Bool)

(assert (=> b!177880 (= c!31863 (bvslt #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))))))

(declare-fun b!177881 () Bool)

(assert (=> b!177881 (= e!117259 (= lt!87830 (getCurrentListMapNoExtraKeys!163 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3659 thiss!1248))))))

(declare-fun b!177882 () Bool)

(assert (=> b!177882 (= e!117258 e!117262)))

(declare-fun c!31864 () Bool)

(assert (=> b!177882 (= c!31864 e!117261)))

(declare-fun res!84265 () Bool)

(assert (=> b!177882 (=> (not res!84265) (not e!117261))))

(assert (=> b!177882 (= res!84265 (bvslt #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))))))

(declare-fun b!177883 () Bool)

(declare-fun res!84264 () Bool)

(assert (=> b!177883 (=> (not res!84264) (not e!117258))))

(assert (=> b!177883 (= res!84264 (not (contains!1194 lt!87830 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53735 c!31862) b!177873))

(assert (= (and d!53735 (not c!31862)) b!177878))

(assert (= (and b!177878 c!31861) b!177879))

(assert (= (and b!177878 (not c!31861)) b!177876))

(assert (= (or b!177879 b!177876) bm!17974))

(assert (= (and d!53735 res!84266) b!177883))

(assert (= (and b!177883 res!84264) b!177882))

(assert (= (and b!177882 res!84265) b!177874))

(assert (= (and b!177882 c!31864) b!177872))

(assert (= (and b!177882 (not c!31864)) b!177880))

(assert (= (and b!177872 res!84263) b!177877))

(assert (= (and b!177880 c!31863) b!177881))

(assert (= (and b!177880 (not c!31863)) b!177875))

(declare-fun b_lambda!7053 () Bool)

(assert (=> (not b_lambda!7053) (not b!177877)))

(assert (=> b!177877 t!7086))

(declare-fun b_and!10883 () Bool)

(assert (= b_and!10881 (and (=> t!7086 result!4651) b_and!10883)))

(declare-fun b_lambda!7055 () Bool)

(assert (=> (not b_lambda!7055) (not b!177879)))

(assert (=> b!177879 t!7086))

(declare-fun b_and!10885 () Bool)

(assert (= b_and!10883 (and (=> t!7086 result!4651) b_and!10885)))

(declare-fun m!205901 () Bool)

(assert (=> d!53735 m!205901))

(assert (=> d!53735 m!205679))

(declare-fun m!205903 () Bool)

(assert (=> b!177881 m!205903))

(assert (=> bm!17974 m!205903))

(assert (=> b!177877 m!205729))

(assert (=> b!177877 m!205735))

(assert (=> b!177877 m!205733))

(assert (=> b!177877 m!205737))

(assert (=> b!177877 m!205733))

(assert (=> b!177877 m!205729))

(declare-fun m!205905 () Bool)

(assert (=> b!177877 m!205905))

(assert (=> b!177877 m!205735))

(assert (=> b!177879 m!205729))

(assert (=> b!177879 m!205735))

(assert (=> b!177879 m!205733))

(assert (=> b!177879 m!205737))

(declare-fun m!205907 () Bool)

(assert (=> b!177879 m!205907))

(declare-fun m!205909 () Bool)

(assert (=> b!177879 m!205909))

(assert (=> b!177879 m!205909))

(declare-fun m!205911 () Bool)

(assert (=> b!177879 m!205911))

(assert (=> b!177879 m!205735))

(assert (=> b!177879 m!205733))

(declare-fun m!205913 () Bool)

(assert (=> b!177879 m!205913))

(declare-fun m!205915 () Bool)

(assert (=> b!177875 m!205915))

(assert (=> b!177878 m!205729))

(assert (=> b!177878 m!205729))

(assert (=> b!177878 m!205741))

(assert (=> b!177872 m!205729))

(assert (=> b!177872 m!205729))

(declare-fun m!205917 () Bool)

(assert (=> b!177872 m!205917))

(assert (=> b!177874 m!205729))

(assert (=> b!177874 m!205729))

(assert (=> b!177874 m!205741))

(declare-fun m!205919 () Bool)

(assert (=> b!177883 m!205919))

(assert (=> b!177780 d!53735))

(declare-fun d!53737 () Bool)

(declare-fun e!117265 () Bool)

(assert (=> d!53737 e!117265))

(declare-fun res!84268 () Bool)

(assert (=> d!53737 (=> (not res!84268) (not e!117265))))

(declare-fun lt!87836 () ListLongMap!2211)

(assert (=> d!53737 (= res!84268 (contains!1194 lt!87836 (_1!1657 (tuple2!3293 lt!87746 (zeroValue!3500 thiss!1248)))))))

(declare-fun lt!87835 () List!2259)

(assert (=> d!53737 (= lt!87836 (ListLongMap!2212 lt!87835))))

(declare-fun lt!87834 () Unit!5405)

(declare-fun lt!87833 () Unit!5405)

(assert (=> d!53737 (= lt!87834 lt!87833)))

(assert (=> d!53737 (= (getValueByKey!195 lt!87835 (_1!1657 (tuple2!3293 lt!87746 (zeroValue!3500 thiss!1248)))) (Some!200 (_2!1657 (tuple2!3293 lt!87746 (zeroValue!3500 thiss!1248)))))))

(assert (=> d!53737 (= lt!87833 (lemmaContainsTupThenGetReturnValue!105 lt!87835 (_1!1657 (tuple2!3293 lt!87746 (zeroValue!3500 thiss!1248))) (_2!1657 (tuple2!3293 lt!87746 (zeroValue!3500 thiss!1248)))))))

(assert (=> d!53737 (= lt!87835 (insertStrictlySorted!108 (toList!1121 lt!87753) (_1!1657 (tuple2!3293 lt!87746 (zeroValue!3500 thiss!1248))) (_2!1657 (tuple2!3293 lt!87746 (zeroValue!3500 thiss!1248)))))))

(assert (=> d!53737 (= (+!254 lt!87753 (tuple2!3293 lt!87746 (zeroValue!3500 thiss!1248))) lt!87836)))

(declare-fun b!177884 () Bool)

(declare-fun res!84267 () Bool)

(assert (=> b!177884 (=> (not res!84267) (not e!117265))))

(assert (=> b!177884 (= res!84267 (= (getValueByKey!195 (toList!1121 lt!87836) (_1!1657 (tuple2!3293 lt!87746 (zeroValue!3500 thiss!1248)))) (Some!200 (_2!1657 (tuple2!3293 lt!87746 (zeroValue!3500 thiss!1248))))))))

(declare-fun b!177885 () Bool)

(assert (=> b!177885 (= e!117265 (contains!1195 (toList!1121 lt!87836) (tuple2!3293 lt!87746 (zeroValue!3500 thiss!1248))))))

(assert (= (and d!53737 res!84268) b!177884))

(assert (= (and b!177884 res!84267) b!177885))

(declare-fun m!205921 () Bool)

(assert (=> d!53737 m!205921))

(declare-fun m!205923 () Bool)

(assert (=> d!53737 m!205923))

(declare-fun m!205925 () Bool)

(assert (=> d!53737 m!205925))

(declare-fun m!205927 () Bool)

(assert (=> d!53737 m!205927))

(declare-fun m!205929 () Bool)

(assert (=> b!177884 m!205929))

(declare-fun m!205931 () Bool)

(assert (=> b!177885 m!205931))

(assert (=> b!177780 d!53737))

(declare-fun d!53739 () Bool)

(declare-fun e!117266 () Bool)

(assert (=> d!53739 e!117266))

(declare-fun res!84269 () Bool)

(assert (=> d!53739 (=> res!84269 e!117266)))

(declare-fun lt!87838 () Bool)

(assert (=> d!53739 (= res!84269 (not lt!87838))))

(declare-fun lt!87837 () Bool)

(assert (=> d!53739 (= lt!87838 lt!87837)))

(declare-fun lt!87839 () Unit!5405)

(declare-fun e!117267 () Unit!5405)

(assert (=> d!53739 (= lt!87839 e!117267)))

(declare-fun c!31865 () Bool)

(assert (=> d!53739 (= c!31865 lt!87837)))

(assert (=> d!53739 (= lt!87837 (containsKey!199 (toList!1121 (+!254 lt!87760 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248)))) lt!87764))))

(assert (=> d!53739 (= (contains!1194 (+!254 lt!87760 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248))) lt!87764) lt!87838)))

(declare-fun b!177886 () Bool)

(declare-fun lt!87840 () Unit!5405)

(assert (=> b!177886 (= e!117267 lt!87840)))

(assert (=> b!177886 (= lt!87840 (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1121 (+!254 lt!87760 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248)))) lt!87764))))

(assert (=> b!177886 (isDefined!149 (getValueByKey!195 (toList!1121 (+!254 lt!87760 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248)))) lt!87764))))

(declare-fun b!177887 () Bool)

(declare-fun Unit!5410 () Unit!5405)

(assert (=> b!177887 (= e!117267 Unit!5410)))

(declare-fun b!177888 () Bool)

(assert (=> b!177888 (= e!117266 (isDefined!149 (getValueByKey!195 (toList!1121 (+!254 lt!87760 (tuple2!3293 lt!87756 (zeroValue!3500 thiss!1248)))) lt!87764)))))

(assert (= (and d!53739 c!31865) b!177886))

(assert (= (and d!53739 (not c!31865)) b!177887))

(assert (= (and d!53739 (not res!84269)) b!177888))

(declare-fun m!205933 () Bool)

(assert (=> d!53739 m!205933))

(declare-fun m!205935 () Bool)

(assert (=> b!177886 m!205935))

(declare-fun m!205937 () Bool)

(assert (=> b!177886 m!205937))

(assert (=> b!177886 m!205937))

(declare-fun m!205939 () Bool)

(assert (=> b!177886 m!205939))

(assert (=> b!177888 m!205937))

(assert (=> b!177888 m!205937))

(assert (=> b!177888 m!205939))

(assert (=> b!177780 d!53739))

(declare-fun d!53741 () Bool)

(assert (=> d!53741 (isDefined!149 (getValueByKey!195 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828))))

(declare-fun lt!87843 () Unit!5405)

(declare-fun choose!958 (List!2259 (_ BitVec 64)) Unit!5405)

(assert (=> d!53741 (= lt!87843 (choose!958 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828))))

(declare-fun e!117270 () Bool)

(assert (=> d!53741 e!117270))

(declare-fun res!84272 () Bool)

(assert (=> d!53741 (=> (not res!84272) (not e!117270))))

(declare-fun isStrictlySorted!333 (List!2259) Bool)

(assert (=> d!53741 (= res!84272 (isStrictlySorted!333 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))))))

(assert (=> d!53741 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828) lt!87843)))

(declare-fun b!177891 () Bool)

(assert (=> b!177891 (= e!117270 (containsKey!199 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828))))

(assert (= (and d!53741 res!84272) b!177891))

(assert (=> d!53741 m!205719))

(assert (=> d!53741 m!205719))

(assert (=> d!53741 m!205721))

(declare-fun m!205941 () Bool)

(assert (=> d!53741 m!205941))

(declare-fun m!205943 () Bool)

(assert (=> d!53741 m!205943))

(assert (=> b!177891 m!205715))

(assert (=> b!177723 d!53741))

(declare-fun d!53743 () Bool)

(declare-fun isEmpty!454 (Option!201) Bool)

(assert (=> d!53743 (= (isDefined!149 (getValueByKey!195 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828)) (not (isEmpty!454 (getValueByKey!195 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828))))))

(declare-fun bs!7289 () Bool)

(assert (= bs!7289 d!53743))

(assert (=> bs!7289 m!205719))

(declare-fun m!205945 () Bool)

(assert (=> bs!7289 m!205945))

(assert (=> b!177723 d!53743))

(declare-fun b!177900 () Bool)

(declare-fun e!117275 () Option!201)

(assert (=> b!177900 (= e!117275 (Some!200 (_2!1657 (h!2877 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))))))))

(declare-fun b!177902 () Bool)

(declare-fun e!117276 () Option!201)

(assert (=> b!177902 (= e!117276 (getValueByKey!195 (t!7084 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))) key!828))))

(declare-fun b!177901 () Bool)

(assert (=> b!177901 (= e!117275 e!117276)))

(declare-fun c!31871 () Bool)

(assert (=> b!177901 (= c!31871 (and ((_ is Cons!2255) (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))) (not (= (_1!1657 (h!2877 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))))) key!828))))))

(declare-fun d!53745 () Bool)

(declare-fun c!31870 () Bool)

(assert (=> d!53745 (= c!31870 (and ((_ is Cons!2255) (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))) (= (_1!1657 (h!2877 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))))) key!828)))))

(assert (=> d!53745 (= (getValueByKey!195 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828) e!117275)))

(declare-fun b!177903 () Bool)

(assert (=> b!177903 (= e!117276 None!199)))

(assert (= (and d!53745 c!31870) b!177900))

(assert (= (and d!53745 (not c!31870)) b!177901))

(assert (= (and b!177901 c!31871) b!177902))

(assert (= (and b!177901 (not c!31871)) b!177903))

(declare-fun m!205947 () Bool)

(assert (=> b!177902 m!205947))

(assert (=> b!177723 d!53745))

(declare-fun b!177912 () Bool)

(declare-fun res!84281 () Bool)

(declare-fun e!117279 () Bool)

(assert (=> b!177912 (=> (not res!84281) (not e!117279))))

(assert (=> b!177912 (= res!84281 (and (= (size!3845 (_values!3642 thiss!1248)) (bvadd (mask!8606 thiss!1248) #b00000000000000000000000000000001)) (= (size!3844 (_keys!5530 thiss!1248)) (size!3845 (_values!3642 thiss!1248))) (bvsge (_size!1242 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1242 thiss!1248) (bvadd (mask!8606 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!177914 () Bool)

(declare-fun res!84282 () Bool)

(assert (=> b!177914 (=> (not res!84282) (not e!117279))))

(declare-fun size!3850 (LongMapFixedSize!2386) (_ BitVec 32))

(assert (=> b!177914 (= res!84282 (= (size!3850 thiss!1248) (bvadd (_size!1242 thiss!1248) (bvsdiv (bvadd (extraKeys!3396 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!53747 () Bool)

(declare-fun res!84284 () Bool)

(assert (=> d!53747 (=> (not res!84284) (not e!117279))))

(assert (=> d!53747 (= res!84284 (validMask!0 (mask!8606 thiss!1248)))))

(assert (=> d!53747 (= (simpleValid!156 thiss!1248) e!117279)))

(declare-fun b!177915 () Bool)

(assert (=> b!177915 (= e!117279 (and (bvsge (extraKeys!3396 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3396 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1242 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!177913 () Bool)

(declare-fun res!84283 () Bool)

(assert (=> b!177913 (=> (not res!84283) (not e!117279))))

(assert (=> b!177913 (= res!84283 (bvsge (size!3850 thiss!1248) (_size!1242 thiss!1248)))))

(assert (= (and d!53747 res!84284) b!177912))

(assert (= (and b!177912 res!84281) b!177913))

(assert (= (and b!177913 res!84283) b!177914))

(assert (= (and b!177914 res!84282) b!177915))

(declare-fun m!205949 () Bool)

(assert (=> b!177914 m!205949))

(assert (=> d!53747 m!205679))

(assert (=> b!177913 m!205949))

(assert (=> d!53703 d!53747))

(declare-fun d!53749 () Bool)

(assert (=> d!53749 (= (apply!142 lt!87763 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)) (get!2021 (getValueByKey!195 (toList!1121 lt!87763) (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7290 () Bool)

(assert (= bs!7290 d!53749))

(assert (=> bs!7290 m!205729))

(declare-fun m!205951 () Bool)

(assert (=> bs!7290 m!205951))

(assert (=> bs!7290 m!205951))

(declare-fun m!205953 () Bool)

(assert (=> bs!7290 m!205953))

(assert (=> b!177788 d!53749))

(declare-fun d!53751 () Bool)

(declare-fun c!31874 () Bool)

(assert (=> d!53751 (= c!31874 ((_ is ValueCellFull!1739) (select (arr!3539 (_values!3642 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!117282 () V!5201)

(assert (=> d!53751 (= (get!2020 (select (arr!3539 (_values!3642 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3659 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!117282)))

(declare-fun b!177920 () Bool)

(declare-fun get!2022 (ValueCell!1739 V!5201) V!5201)

(assert (=> b!177920 (= e!117282 (get!2022 (select (arr!3539 (_values!3642 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3659 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177921 () Bool)

(declare-fun get!2023 (ValueCell!1739 V!5201) V!5201)

(assert (=> b!177921 (= e!117282 (get!2023 (select (arr!3539 (_values!3642 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3659 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53751 c!31874) b!177920))

(assert (= (and d!53751 (not c!31874)) b!177921))

(assert (=> b!177920 m!205735))

(assert (=> b!177920 m!205733))

(declare-fun m!205955 () Bool)

(assert (=> b!177920 m!205955))

(assert (=> b!177921 m!205735))

(assert (=> b!177921 m!205733))

(declare-fun m!205957 () Bool)

(assert (=> b!177921 m!205957))

(assert (=> b!177788 d!53751))

(assert (=> bm!17966 d!53735))

(declare-fun b!177930 () Bool)

(declare-fun e!117287 () (_ BitVec 32))

(declare-fun e!117288 () (_ BitVec 32))

(assert (=> b!177930 (= e!117287 e!117288)))

(declare-fun c!31880 () Bool)

(assert (=> b!177930 (= c!31880 (validKeyInArray!0 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177931 () Bool)

(assert (=> b!177931 (= e!117287 #b00000000000000000000000000000000)))

(declare-fun b!177932 () Bool)

(declare-fun call!17980 () (_ BitVec 32))

(assert (=> b!177932 (= e!117288 call!17980)))

(declare-fun b!177933 () Bool)

(assert (=> b!177933 (= e!117288 (bvadd #b00000000000000000000000000000001 call!17980))))

(declare-fun bm!17977 () Bool)

(assert (=> bm!17977 (= call!17980 (arrayCountValidKeys!0 (_keys!5530 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3844 (_keys!5530 thiss!1248))))))

(declare-fun d!53753 () Bool)

(declare-fun lt!87846 () (_ BitVec 32))

(assert (=> d!53753 (and (bvsge lt!87846 #b00000000000000000000000000000000) (bvsle lt!87846 (bvsub (size!3844 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53753 (= lt!87846 e!117287)))

(declare-fun c!31879 () Bool)

(assert (=> d!53753 (= c!31879 (bvsge #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))))))

(assert (=> d!53753 (and (bvsle #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3844 (_keys!5530 thiss!1248)) (size!3844 (_keys!5530 thiss!1248))))))

(assert (=> d!53753 (= (arrayCountValidKeys!0 (_keys!5530 thiss!1248) #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))) lt!87846)))

(assert (= (and d!53753 c!31879) b!177931))

(assert (= (and d!53753 (not c!31879)) b!177930))

(assert (= (and b!177930 c!31880) b!177933))

(assert (= (and b!177930 (not c!31880)) b!177932))

(assert (= (or b!177933 b!177932) bm!17977))

(assert (=> b!177930 m!205729))

(assert (=> b!177930 m!205729))

(assert (=> b!177930 m!205741))

(declare-fun m!205959 () Bool)

(assert (=> bm!17977 m!205959))

(assert (=> b!177815 d!53753))

(declare-fun b!177952 () Bool)

(declare-fun e!117301 () SeekEntryResult!580)

(assert (=> b!177952 (= e!117301 (Intermediate!580 true (toIndex!0 key!828 (mask!8606 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!177953 () Bool)

(declare-fun lt!87852 () SeekEntryResult!580)

(assert (=> b!177953 (and (bvsge (index!4490 lt!87852) #b00000000000000000000000000000000) (bvslt (index!4490 lt!87852) (size!3844 (_keys!5530 thiss!1248))))))

(declare-fun res!84291 () Bool)

(assert (=> b!177953 (= res!84291 (= (select (arr!3538 (_keys!5530 thiss!1248)) (index!4490 lt!87852)) key!828))))

(declare-fun e!117300 () Bool)

(assert (=> b!177953 (=> res!84291 e!117300)))

(declare-fun e!117299 () Bool)

(assert (=> b!177953 (= e!117299 e!117300)))

(declare-fun b!177954 () Bool)

(assert (=> b!177954 (and (bvsge (index!4490 lt!87852) #b00000000000000000000000000000000) (bvslt (index!4490 lt!87852) (size!3844 (_keys!5530 thiss!1248))))))

(assert (=> b!177954 (= e!117300 (= (select (arr!3538 (_keys!5530 thiss!1248)) (index!4490 lt!87852)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177955 () Bool)

(assert (=> b!177955 (and (bvsge (index!4490 lt!87852) #b00000000000000000000000000000000) (bvslt (index!4490 lt!87852) (size!3844 (_keys!5530 thiss!1248))))))

(declare-fun res!84292 () Bool)

(assert (=> b!177955 (= res!84292 (= (select (arr!3538 (_keys!5530 thiss!1248)) (index!4490 lt!87852)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!177955 (=> res!84292 e!117300)))

(declare-fun d!53755 () Bool)

(declare-fun e!117303 () Bool)

(assert (=> d!53755 e!117303))

(declare-fun c!31888 () Bool)

(assert (=> d!53755 (= c!31888 (and ((_ is Intermediate!580) lt!87852) (undefined!1392 lt!87852)))))

(assert (=> d!53755 (= lt!87852 e!117301)))

(declare-fun c!31887 () Bool)

(assert (=> d!53755 (= c!31887 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!87851 () (_ BitVec 64))

(assert (=> d!53755 (= lt!87851 (select (arr!3538 (_keys!5530 thiss!1248)) (toIndex!0 key!828 (mask!8606 thiss!1248))))))

(assert (=> d!53755 (validMask!0 (mask!8606 thiss!1248))))

(assert (=> d!53755 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8606 thiss!1248)) key!828 (_keys!5530 thiss!1248) (mask!8606 thiss!1248)) lt!87852)))

(declare-fun b!177956 () Bool)

(declare-fun e!117302 () SeekEntryResult!580)

(assert (=> b!177956 (= e!117301 e!117302)))

(declare-fun c!31889 () Bool)

(assert (=> b!177956 (= c!31889 (or (= lt!87851 key!828) (= (bvadd lt!87851 lt!87851) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177957 () Bool)

(assert (=> b!177957 (= e!117303 (bvsge (x!19503 lt!87852) #b01111111111111111111111111111110))))

(declare-fun b!177958 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!177958 (= e!117302 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8606 thiss!1248)) #b00000000000000000000000000000000 (mask!8606 thiss!1248)) key!828 (_keys!5530 thiss!1248) (mask!8606 thiss!1248)))))

(declare-fun b!177959 () Bool)

(assert (=> b!177959 (= e!117302 (Intermediate!580 false (toIndex!0 key!828 (mask!8606 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!177960 () Bool)

(assert (=> b!177960 (= e!117303 e!117299)))

(declare-fun res!84293 () Bool)

(assert (=> b!177960 (= res!84293 (and ((_ is Intermediate!580) lt!87852) (not (undefined!1392 lt!87852)) (bvslt (x!19503 lt!87852) #b01111111111111111111111111111110) (bvsge (x!19503 lt!87852) #b00000000000000000000000000000000) (bvsge (x!19503 lt!87852) #b00000000000000000000000000000000)))))

(assert (=> b!177960 (=> (not res!84293) (not e!117299))))

(assert (= (and d!53755 c!31887) b!177952))

(assert (= (and d!53755 (not c!31887)) b!177956))

(assert (= (and b!177956 c!31889) b!177959))

(assert (= (and b!177956 (not c!31889)) b!177958))

(assert (= (and d!53755 c!31888) b!177957))

(assert (= (and d!53755 (not c!31888)) b!177960))

(assert (= (and b!177960 res!84293) b!177953))

(assert (= (and b!177953 (not res!84291)) b!177955))

(assert (= (and b!177955 (not res!84292)) b!177954))

(declare-fun m!205961 () Bool)

(assert (=> b!177954 m!205961))

(assert (=> b!177955 m!205961))

(assert (=> b!177953 m!205961))

(assert (=> d!53755 m!205785))

(declare-fun m!205963 () Bool)

(assert (=> d!53755 m!205963))

(assert (=> d!53755 m!205679))

(assert (=> b!177958 m!205785))

(declare-fun m!205965 () Bool)

(assert (=> b!177958 m!205965))

(assert (=> b!177958 m!205965))

(declare-fun m!205967 () Bool)

(assert (=> b!177958 m!205967))

(assert (=> d!53699 d!53755))

(declare-fun d!53757 () Bool)

(declare-fun lt!87858 () (_ BitVec 32))

(declare-fun lt!87857 () (_ BitVec 32))

(assert (=> d!53757 (= lt!87858 (bvmul (bvxor lt!87857 (bvlshr lt!87857 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53757 (= lt!87857 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53757 (and (bvsge (mask!8606 thiss!1248) #b00000000000000000000000000000000) (let ((res!84294 (let ((h!2879 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19521 (bvmul (bvxor h!2879 (bvlshr h!2879 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19521 (bvlshr x!19521 #b00000000000000000000000000001101)) (mask!8606 thiss!1248)))))) (and (bvslt res!84294 (bvadd (mask!8606 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!84294 #b00000000000000000000000000000000))))))

(assert (=> d!53757 (= (toIndex!0 key!828 (mask!8606 thiss!1248)) (bvand (bvxor lt!87858 (bvlshr lt!87858 #b00000000000000000000000000001101)) (mask!8606 thiss!1248)))))

(assert (=> d!53699 d!53757))

(assert (=> d!53699 d!53701))

(assert (=> d!53693 d!53701))

(declare-fun d!53759 () Bool)

(declare-fun e!117304 () Bool)

(assert (=> d!53759 e!117304))

(declare-fun res!84296 () Bool)

(assert (=> d!53759 (=> (not res!84296) (not e!117304))))

(declare-fun lt!87862 () ListLongMap!2211)

(assert (=> d!53759 (= res!84296 (contains!1194 lt!87862 (_1!1657 (ite (or c!31839 c!31842) (tuple2!3293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))))))

(declare-fun lt!87861 () List!2259)

(assert (=> d!53759 (= lt!87862 (ListLongMap!2212 lt!87861))))

(declare-fun lt!87860 () Unit!5405)

(declare-fun lt!87859 () Unit!5405)

(assert (=> d!53759 (= lt!87860 lt!87859)))

(assert (=> d!53759 (= (getValueByKey!195 lt!87861 (_1!1657 (ite (or c!31839 c!31842) (tuple2!3293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))) (Some!200 (_2!1657 (ite (or c!31839 c!31842) (tuple2!3293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))))))

(assert (=> d!53759 (= lt!87859 (lemmaContainsTupThenGetReturnValue!105 lt!87861 (_1!1657 (ite (or c!31839 c!31842) (tuple2!3293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))) (_2!1657 (ite (or c!31839 c!31842) (tuple2!3293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))))))

(assert (=> d!53759 (= lt!87861 (insertStrictlySorted!108 (toList!1121 (ite c!31839 call!17971 (ite c!31842 call!17970 call!17972))) (_1!1657 (ite (or c!31839 c!31842) (tuple2!3293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))) (_2!1657 (ite (or c!31839 c!31842) (tuple2!3293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))))))

(assert (=> d!53759 (= (+!254 (ite c!31839 call!17971 (ite c!31842 call!17970 call!17972)) (ite (or c!31839 c!31842) (tuple2!3293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))) lt!87862)))

(declare-fun b!177961 () Bool)

(declare-fun res!84295 () Bool)

(assert (=> b!177961 (=> (not res!84295) (not e!117304))))

(assert (=> b!177961 (= res!84295 (= (getValueByKey!195 (toList!1121 lt!87862) (_1!1657 (ite (or c!31839 c!31842) (tuple2!3293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))) (Some!200 (_2!1657 (ite (or c!31839 c!31842) (tuple2!3293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))))))))

(declare-fun b!177962 () Bool)

(assert (=> b!177962 (= e!117304 (contains!1195 (toList!1121 lt!87862) (ite (or c!31839 c!31842) (tuple2!3293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3293 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))))))

(assert (= (and d!53759 res!84296) b!177961))

(assert (= (and b!177961 res!84295) b!177962))

(declare-fun m!205969 () Bool)

(assert (=> d!53759 m!205969))

(declare-fun m!205971 () Bool)

(assert (=> d!53759 m!205971))

(declare-fun m!205973 () Bool)

(assert (=> d!53759 m!205973))

(declare-fun m!205975 () Bool)

(assert (=> d!53759 m!205975))

(declare-fun m!205977 () Bool)

(assert (=> b!177961 m!205977))

(declare-fun m!205979 () Bool)

(assert (=> b!177962 m!205979))

(assert (=> bm!17967 d!53759))

(declare-fun bm!17980 () Bool)

(declare-fun call!17983 () Bool)

(assert (=> bm!17980 (= call!17983 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5530 thiss!1248) (mask!8606 thiss!1248)))))

(declare-fun b!177971 () Bool)

(declare-fun e!117311 () Bool)

(assert (=> b!177971 (= e!117311 call!17983)))

(declare-fun b!177972 () Bool)

(declare-fun e!117312 () Bool)

(assert (=> b!177972 (= e!117312 e!117311)))

(declare-fun lt!87869 () (_ BitVec 64))

(assert (=> b!177972 (= lt!87869 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87871 () Unit!5405)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7465 (_ BitVec 64) (_ BitVec 32)) Unit!5405)

(assert (=> b!177972 (= lt!87871 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5530 thiss!1248) lt!87869 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!177972 (arrayContainsKey!0 (_keys!5530 thiss!1248) lt!87869 #b00000000000000000000000000000000)))

(declare-fun lt!87870 () Unit!5405)

(assert (=> b!177972 (= lt!87870 lt!87871)))

(declare-fun res!84302 () Bool)

(assert (=> b!177972 (= res!84302 (= (seekEntryOrOpen!0 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000) (_keys!5530 thiss!1248) (mask!8606 thiss!1248)) (Found!580 #b00000000000000000000000000000000)))))

(assert (=> b!177972 (=> (not res!84302) (not e!117311))))

(declare-fun b!177973 () Bool)

(assert (=> b!177973 (= e!117312 call!17983)))

(declare-fun d!53761 () Bool)

(declare-fun res!84301 () Bool)

(declare-fun e!117313 () Bool)

(assert (=> d!53761 (=> res!84301 e!117313)))

(assert (=> d!53761 (= res!84301 (bvsge #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))))))

(assert (=> d!53761 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5530 thiss!1248) (mask!8606 thiss!1248)) e!117313)))

(declare-fun b!177974 () Bool)

(assert (=> b!177974 (= e!117313 e!117312)))

(declare-fun c!31892 () Bool)

(assert (=> b!177974 (= c!31892 (validKeyInArray!0 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53761 (not res!84301)) b!177974))

(assert (= (and b!177974 c!31892) b!177972))

(assert (= (and b!177974 (not c!31892)) b!177973))

(assert (= (and b!177972 res!84302) b!177971))

(assert (= (or b!177971 b!177973) bm!17980))

(declare-fun m!205981 () Bool)

(assert (=> bm!17980 m!205981))

(assert (=> b!177972 m!205729))

(declare-fun m!205983 () Bool)

(assert (=> b!177972 m!205983))

(declare-fun m!205985 () Bool)

(assert (=> b!177972 m!205985))

(assert (=> b!177972 m!205729))

(declare-fun m!205987 () Bool)

(assert (=> b!177972 m!205987))

(assert (=> b!177974 m!205729))

(assert (=> b!177974 m!205729))

(assert (=> b!177974 m!205741))

(assert (=> b!177816 d!53761))

(assert (=> b!177725 d!53743))

(assert (=> b!177725 d!53745))

(declare-fun bm!17983 () Bool)

(declare-fun call!17986 () Bool)

(declare-fun c!31895 () Bool)

(assert (=> bm!17983 (= call!17986 (arrayNoDuplicates!0 (_keys!5530 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31895 (Cons!2256 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000) Nil!2257) Nil!2257)))))

(declare-fun b!177985 () Bool)

(declare-fun e!117325 () Bool)

(declare-fun e!117324 () Bool)

(assert (=> b!177985 (= e!117325 e!117324)))

(declare-fun res!84311 () Bool)

(assert (=> b!177985 (=> (not res!84311) (not e!117324))))

(declare-fun e!117323 () Bool)

(assert (=> b!177985 (= res!84311 (not e!117323))))

(declare-fun res!84309 () Bool)

(assert (=> b!177985 (=> (not res!84309) (not e!117323))))

(assert (=> b!177985 (= res!84309 (validKeyInArray!0 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177986 () Bool)

(declare-fun e!117322 () Bool)

(assert (=> b!177986 (= e!117322 call!17986)))

(declare-fun b!177987 () Bool)

(assert (=> b!177987 (= e!117322 call!17986)))

(declare-fun b!177988 () Bool)

(assert (=> b!177988 (= e!117324 e!117322)))

(assert (=> b!177988 (= c!31895 (validKeyInArray!0 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177989 () Bool)

(declare-fun contains!1196 (List!2260 (_ BitVec 64)) Bool)

(assert (=> b!177989 (= e!117323 (contains!1196 Nil!2257 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53763 () Bool)

(declare-fun res!84310 () Bool)

(assert (=> d!53763 (=> res!84310 e!117325)))

(assert (=> d!53763 (= res!84310 (bvsge #b00000000000000000000000000000000 (size!3844 (_keys!5530 thiss!1248))))))

(assert (=> d!53763 (= (arrayNoDuplicates!0 (_keys!5530 thiss!1248) #b00000000000000000000000000000000 Nil!2257) e!117325)))

(assert (= (and d!53763 (not res!84310)) b!177985))

(assert (= (and b!177985 res!84309) b!177989))

(assert (= (and b!177985 res!84311) b!177988))

(assert (= (and b!177988 c!31895) b!177987))

(assert (= (and b!177988 (not c!31895)) b!177986))

(assert (= (or b!177987 b!177986) bm!17983))

(assert (=> bm!17983 m!205729))

(declare-fun m!205989 () Bool)

(assert (=> bm!17983 m!205989))

(assert (=> b!177985 m!205729))

(assert (=> b!177985 m!205729))

(assert (=> b!177985 m!205741))

(assert (=> b!177988 m!205729))

(assert (=> b!177988 m!205729))

(assert (=> b!177988 m!205741))

(assert (=> b!177989 m!205729))

(assert (=> b!177989 m!205729))

(declare-fun m!205991 () Bool)

(assert (=> b!177989 m!205991))

(assert (=> b!177817 d!53763))

(declare-fun d!53765 () Bool)

(assert (=> d!53765 (= (apply!142 lt!87763 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2021 (getValueByKey!195 (toList!1121 lt!87763) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7291 () Bool)

(assert (= bs!7291 d!53765))

(assert (=> bs!7291 m!205809))

(assert (=> bs!7291 m!205809))

(declare-fun m!205993 () Bool)

(assert (=> bs!7291 m!205993))

(assert (=> b!177775 d!53765))

(declare-fun d!53767 () Bool)

(assert (=> d!53767 (= (apply!142 lt!87763 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2021 (getValueByKey!195 (toList!1121 lt!87763) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7292 () Bool)

(assert (= bs!7292 d!53767))

(declare-fun m!205995 () Bool)

(assert (=> bs!7292 m!205995))

(assert (=> bs!7292 m!205995))

(declare-fun m!205997 () Bool)

(assert (=> bs!7292 m!205997))

(assert (=> b!177783 d!53767))

(declare-fun d!53769 () Bool)

(assert (=> d!53769 (= (validKeyInArray!0 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177784 d!53769))

(declare-fun d!53771 () Bool)

(declare-fun e!117326 () Bool)

(assert (=> d!53771 e!117326))

(declare-fun res!84312 () Bool)

(assert (=> d!53771 (=> res!84312 e!117326)))

(declare-fun lt!87873 () Bool)

(assert (=> d!53771 (= res!84312 (not lt!87873))))

(declare-fun lt!87872 () Bool)

(assert (=> d!53771 (= lt!87873 lt!87872)))

(declare-fun lt!87874 () Unit!5405)

(declare-fun e!117327 () Unit!5405)

(assert (=> d!53771 (= lt!87874 e!117327)))

(declare-fun c!31896 () Bool)

(assert (=> d!53771 (= c!31896 lt!87872)))

(assert (=> d!53771 (= lt!87872 (containsKey!199 (toList!1121 lt!87763) (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53771 (= (contains!1194 lt!87763 (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)) lt!87873)))

(declare-fun b!177990 () Bool)

(declare-fun lt!87875 () Unit!5405)

(assert (=> b!177990 (= e!117327 lt!87875)))

(assert (=> b!177990 (= lt!87875 (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1121 lt!87763) (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177990 (isDefined!149 (getValueByKey!195 (toList!1121 lt!87763) (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177991 () Bool)

(declare-fun Unit!5411 () Unit!5405)

(assert (=> b!177991 (= e!117327 Unit!5411)))

(declare-fun b!177992 () Bool)

(assert (=> b!177992 (= e!117326 (isDefined!149 (getValueByKey!195 (toList!1121 lt!87763) (select (arr!3538 (_keys!5530 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53771 c!31896) b!177990))

(assert (= (and d!53771 (not c!31896)) b!177991))

(assert (= (and d!53771 (not res!84312)) b!177992))

(assert (=> d!53771 m!205729))

(declare-fun m!205999 () Bool)

(assert (=> d!53771 m!205999))

(assert (=> b!177990 m!205729))

(declare-fun m!206001 () Bool)

(assert (=> b!177990 m!206001))

(assert (=> b!177990 m!205729))

(assert (=> b!177990 m!205951))

(assert (=> b!177990 m!205951))

(declare-fun m!206003 () Bool)

(assert (=> b!177990 m!206003))

(assert (=> b!177992 m!205729))

(assert (=> b!177992 m!205951))

(assert (=> b!177992 m!205951))

(assert (=> b!177992 m!206003))

(assert (=> b!177785 d!53771))

(declare-fun d!53773 () Bool)

(declare-fun res!84317 () Bool)

(declare-fun e!117332 () Bool)

(assert (=> d!53773 (=> res!84317 e!117332)))

(assert (=> d!53773 (= res!84317 (and ((_ is Cons!2255) (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))) (= (_1!1657 (h!2877 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))))) key!828)))))

(assert (=> d!53773 (= (containsKey!199 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828) e!117332)))

(declare-fun b!177997 () Bool)

(declare-fun e!117333 () Bool)

(assert (=> b!177997 (= e!117332 e!117333)))

(declare-fun res!84318 () Bool)

(assert (=> b!177997 (=> (not res!84318) (not e!117333))))

(assert (=> b!177997 (= res!84318 (and (or (not ((_ is Cons!2255) (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))))) (bvsle (_1!1657 (h!2877 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))))) key!828)) ((_ is Cons!2255) (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))) (bvslt (_1!1657 (h!2877 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))))) key!828)))))

(declare-fun b!177998 () Bool)

(assert (=> b!177998 (= e!117333 (containsKey!199 (t!7084 (toList!1121 (getCurrentListMap!757 (_keys!5530 thiss!1248) (_values!3642 thiss!1248) (mask!8606 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))) key!828))))

(assert (= (and d!53773 (not res!84317)) b!177997))

(assert (= (and b!177997 res!84318) b!177998))

(declare-fun m!206005 () Bool)

(assert (=> b!177998 m!206005))

(assert (=> d!53691 d!53773))

(assert (=> b!177779 d!53769))

(declare-fun b!178011 () Bool)

(declare-fun c!31905 () Bool)

(declare-fun lt!87881 () (_ BitVec 64))

(assert (=> b!178011 (= c!31905 (= lt!87881 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!117340 () SeekEntryResult!580)

(declare-fun e!117342 () SeekEntryResult!580)

(assert (=> b!178011 (= e!117340 e!117342)))

(declare-fun b!178012 () Bool)

(assert (=> b!178012 (= e!117342 (MissingVacant!580 (index!4490 lt!87774)))))

(declare-fun lt!87880 () SeekEntryResult!580)

(declare-fun d!53775 () Bool)

(assert (=> d!53775 (and (or ((_ is Undefined!580) lt!87880) (not ((_ is Found!580) lt!87880)) (and (bvsge (index!4489 lt!87880) #b00000000000000000000000000000000) (bvslt (index!4489 lt!87880) (size!3844 (_keys!5530 thiss!1248))))) (or ((_ is Undefined!580) lt!87880) ((_ is Found!580) lt!87880) (not ((_ is MissingVacant!580) lt!87880)) (not (= (index!4491 lt!87880) (index!4490 lt!87774))) (and (bvsge (index!4491 lt!87880) #b00000000000000000000000000000000) (bvslt (index!4491 lt!87880) (size!3844 (_keys!5530 thiss!1248))))) (or ((_ is Undefined!580) lt!87880) (ite ((_ is Found!580) lt!87880) (= (select (arr!3538 (_keys!5530 thiss!1248)) (index!4489 lt!87880)) key!828) (and ((_ is MissingVacant!580) lt!87880) (= (index!4491 lt!87880) (index!4490 lt!87774)) (= (select (arr!3538 (_keys!5530 thiss!1248)) (index!4491 lt!87880)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!117341 () SeekEntryResult!580)

(assert (=> d!53775 (= lt!87880 e!117341)))

(declare-fun c!31904 () Bool)

(assert (=> d!53775 (= c!31904 (bvsge (x!19503 lt!87774) #b01111111111111111111111111111110))))

(assert (=> d!53775 (= lt!87881 (select (arr!3538 (_keys!5530 thiss!1248)) (index!4490 lt!87774)))))

(assert (=> d!53775 (validMask!0 (mask!8606 thiss!1248))))

(assert (=> d!53775 (= (seekKeyOrZeroReturnVacant!0 (x!19503 lt!87774) (index!4490 lt!87774) (index!4490 lt!87774) key!828 (_keys!5530 thiss!1248) (mask!8606 thiss!1248)) lt!87880)))

(declare-fun b!178013 () Bool)

(assert (=> b!178013 (= e!117341 Undefined!580)))

(declare-fun b!178014 () Bool)

(assert (=> b!178014 (= e!117341 e!117340)))

(declare-fun c!31903 () Bool)

(assert (=> b!178014 (= c!31903 (= lt!87881 key!828))))

(declare-fun b!178015 () Bool)

(assert (=> b!178015 (= e!117342 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19503 lt!87774) #b00000000000000000000000000000001) (nextIndex!0 (index!4490 lt!87774) (x!19503 lt!87774) (mask!8606 thiss!1248)) (index!4490 lt!87774) key!828 (_keys!5530 thiss!1248) (mask!8606 thiss!1248)))))

(declare-fun b!178016 () Bool)

(assert (=> b!178016 (= e!117340 (Found!580 (index!4490 lt!87774)))))

(assert (= (and d!53775 c!31904) b!178013))

(assert (= (and d!53775 (not c!31904)) b!178014))

(assert (= (and b!178014 c!31903) b!178016))

(assert (= (and b!178014 (not c!31903)) b!178011))

(assert (= (and b!178011 c!31905) b!178012))

(assert (= (and b!178011 (not c!31905)) b!178015))

(declare-fun m!206007 () Bool)

(assert (=> d!53775 m!206007))

(declare-fun m!206009 () Bool)

(assert (=> d!53775 m!206009))

(assert (=> d!53775 m!205781))

(assert (=> d!53775 m!205679))

(declare-fun m!206011 () Bool)

(assert (=> b!178015 m!206011))

(assert (=> b!178015 m!206011))

(declare-fun m!206013 () Bool)

(assert (=> b!178015 m!206013))

(assert (=> b!177806 d!53775))

(declare-fun d!53777 () Bool)

(declare-fun e!117343 () Bool)

(assert (=> d!53777 e!117343))

(declare-fun res!84319 () Bool)

(assert (=> d!53777 (=> res!84319 e!117343)))

(declare-fun lt!87883 () Bool)

(assert (=> d!53777 (= res!84319 (not lt!87883))))

(declare-fun lt!87882 () Bool)

(assert (=> d!53777 (= lt!87883 lt!87882)))

(declare-fun lt!87884 () Unit!5405)

(declare-fun e!117344 () Unit!5405)

(assert (=> d!53777 (= lt!87884 e!117344)))

(declare-fun c!31906 () Bool)

(assert (=> d!53777 (= c!31906 lt!87882)))

(assert (=> d!53777 (= lt!87882 (containsKey!199 (toList!1121 lt!87763) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53777 (= (contains!1194 lt!87763 #b1000000000000000000000000000000000000000000000000000000000000000) lt!87883)))

(declare-fun b!178017 () Bool)

(declare-fun lt!87885 () Unit!5405)

(assert (=> b!178017 (= e!117344 lt!87885)))

(assert (=> b!178017 (= lt!87885 (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1121 lt!87763) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178017 (isDefined!149 (getValueByKey!195 (toList!1121 lt!87763) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178018 () Bool)

(declare-fun Unit!5412 () Unit!5405)

(assert (=> b!178018 (= e!117344 Unit!5412)))

(declare-fun b!178019 () Bool)

(assert (=> b!178019 (= e!117343 (isDefined!149 (getValueByKey!195 (toList!1121 lt!87763) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53777 c!31906) b!178017))

(assert (= (and d!53777 (not c!31906)) b!178018))

(assert (= (and d!53777 (not res!84319)) b!178019))

(declare-fun m!206015 () Bool)

(assert (=> d!53777 m!206015))

(declare-fun m!206017 () Bool)

(assert (=> b!178017 m!206017))

(assert (=> b!178017 m!205995))

(assert (=> b!178017 m!205995))

(declare-fun m!206019 () Bool)

(assert (=> b!178017 m!206019))

(assert (=> b!178019 m!205995))

(assert (=> b!178019 m!205995))

(assert (=> b!178019 m!206019))

(assert (=> bm!17965 d!53777))

(declare-fun mapIsEmpty!7127 () Bool)

(declare-fun mapRes!7127 () Bool)

(assert (=> mapIsEmpty!7127 mapRes!7127))

(declare-fun b!178021 () Bool)

(declare-fun e!117346 () Bool)

(assert (=> b!178021 (= e!117346 tp_is_empty!4165)))

(declare-fun condMapEmpty!7127 () Bool)

(declare-fun mapDefault!7127 () ValueCell!1739)

(assert (=> mapNonEmpty!7126 (= condMapEmpty!7127 (= mapRest!7126 ((as const (Array (_ BitVec 32) ValueCell!1739)) mapDefault!7127)))))

(assert (=> mapNonEmpty!7126 (= tp!15901 (and e!117346 mapRes!7127))))

(declare-fun mapNonEmpty!7127 () Bool)

(declare-fun tp!15902 () Bool)

(declare-fun e!117345 () Bool)

(assert (=> mapNonEmpty!7127 (= mapRes!7127 (and tp!15902 e!117345))))

(declare-fun mapValue!7127 () ValueCell!1739)

(declare-fun mapRest!7127 () (Array (_ BitVec 32) ValueCell!1739))

(declare-fun mapKey!7127 () (_ BitVec 32))

(assert (=> mapNonEmpty!7127 (= mapRest!7126 (store mapRest!7127 mapKey!7127 mapValue!7127))))

(declare-fun b!178020 () Bool)

(assert (=> b!178020 (= e!117345 tp_is_empty!4165)))

(assert (= (and mapNonEmpty!7126 condMapEmpty!7127) mapIsEmpty!7127))

(assert (= (and mapNonEmpty!7126 (not condMapEmpty!7127)) mapNonEmpty!7127))

(assert (= (and mapNonEmpty!7127 ((_ is ValueCellFull!1739) mapValue!7127)) b!178020))

(assert (= (and mapNonEmpty!7126 ((_ is ValueCellFull!1739) mapDefault!7127)) b!178021))

(declare-fun m!206021 () Bool)

(assert (=> mapNonEmpty!7127 m!206021))

(declare-fun b_lambda!7057 () Bool)

(assert (= b_lambda!7055 (or (and b!177660 b_free!4393) b_lambda!7057)))

(declare-fun b_lambda!7059 () Bool)

(assert (= b_lambda!7053 (or (and b!177660 b_free!4393) b_lambda!7059)))

(check-sat (not b_lambda!7059) (not b!177888) (not b!177930) (not d!53711) (not b!177992) (not b!177842) (not d!53723) tp_is_empty!4165 (not b!177828) (not b!177974) (not b!177962) (not mapNonEmpty!7127) (not b!177834) (not d!53717) (not b!177875) (not b_next!4393) (not b!177841) (not d!53733) (not d!53713) (not b!177998) (not d!53727) (not b!177886) (not d!53737) (not d!53771) (not b!177920) (not b!177884) (not d!53743) (not b!177878) (not b!177883) (not b!177913) (not b!177972) (not d!53747) (not b!177879) (not d!53739) (not d!53721) (not b!177961) (not b!177833) (not d!53777) (not b!177846) (not b_lambda!7051) (not d!53707) (not d!53709) (not b!177990) (not d!53729) (not d!53759) (not d!53731) (not d!53715) (not d!53755) (not d!53775) b_and!10885 (not bm!17974) (not b!177902) (not b!177845) (not d!53741) (not d!53705) (not d!53725) (not d!53749) (not bm!17977) (not b!177914) (not b!177872) (not b_lambda!7057) (not b!177985) (not b!178017) (not b!177877) (not b!177881) (not b!177840) (not d!53735) (not bm!17983) (not d!53719) (not b!177958) (not b!177921) (not d!53767) (not b!177826) (not b!178019) (not b!177988) (not b!177989) (not b!177874) (not bm!17980) (not d!53765) (not b!177843) (not b!177885) (not b!178015) (not b!177891))
(check-sat b_and!10885 (not b_next!4393))
