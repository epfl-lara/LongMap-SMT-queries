; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17996 () Bool)

(assert start!17996)

(declare-fun b!179201 () Bool)

(declare-fun b_free!4417 () Bool)

(declare-fun b_next!4417 () Bool)

(assert (=> b!179201 (= b_free!4417 (not b_next!4417))))

(declare-fun tp!15973 () Bool)

(declare-fun b_and!10959 () Bool)

(assert (=> b!179201 (= tp!15973 b_and!10959)))

(declare-fun b!179198 () Bool)

(declare-fun res!84867 () Bool)

(declare-fun e!118072 () Bool)

(assert (=> b!179198 (=> (not res!84867) (not e!118072))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5233 0))(
  ( (V!5234 (val!2139 Int)) )
))
(declare-datatypes ((ValueCell!1751 0))(
  ( (ValueCellFull!1751 (v!4026 V!5233)) (EmptyCell!1751) )
))
(declare-datatypes ((array!7527 0))(
  ( (array!7528 (arr!3566 (Array (_ BitVec 32) (_ BitVec 64))) (size!3874 (_ BitVec 32))) )
))
(declare-datatypes ((array!7529 0))(
  ( (array!7530 (arr!3567 (Array (_ BitVec 32) ValueCell!1751)) (size!3875 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2410 0))(
  ( (LongMapFixedSize!2411 (defaultEntry!3678 Int) (mask!8654 (_ BitVec 32)) (extraKeys!3415 (_ BitVec 32)) (zeroValue!3519 V!5233) (minValue!3519 V!5233) (_size!1254 (_ BitVec 32)) (_keys!5563 array!7527) (_values!3661 array!7529) (_vacant!1254 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2410)

(get-info :version)

(declare-datatypes ((SeekEntryResult!574 0))(
  ( (MissingZero!574 (index!4464 (_ BitVec 32))) (Found!574 (index!4465 (_ BitVec 32))) (Intermediate!574 (undefined!1386 Bool) (index!4466 (_ BitVec 32)) (x!19594 (_ BitVec 32))) (Undefined!574) (MissingVacant!574 (index!4467 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7527 (_ BitVec 32)) SeekEntryResult!574)

(assert (=> b!179198 (= res!84867 ((_ is Undefined!574) (seekEntryOrOpen!0 key!828 (_keys!5563 thiss!1248) (mask!8654 thiss!1248))))))

(declare-fun b!179200 () Bool)

(declare-fun res!84870 () Bool)

(assert (=> b!179200 (=> (not res!84870) (not e!118072))))

(assert (=> b!179200 (= res!84870 (and (= (size!3875 (_values!3661 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8654 thiss!1248))) (= (size!3874 (_keys!5563 thiss!1248)) (size!3875 (_values!3661 thiss!1248))) (bvsge (mask!8654 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3415 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3415 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun e!118071 () Bool)

(declare-fun tp_is_empty!4189 () Bool)

(declare-fun e!118069 () Bool)

(declare-fun array_inv!2305 (array!7527) Bool)

(declare-fun array_inv!2306 (array!7529) Bool)

(assert (=> b!179201 (= e!118069 (and tp!15973 tp_is_empty!4189 (array_inv!2305 (_keys!5563 thiss!1248)) (array_inv!2306 (_values!3661 thiss!1248)) e!118071))))

(declare-fun b!179202 () Bool)

(declare-fun res!84869 () Bool)

(assert (=> b!179202 (=> (not res!84869) (not e!118072))))

(declare-datatypes ((tuple2!3280 0))(
  ( (tuple2!3281 (_1!1651 (_ BitVec 64)) (_2!1651 V!5233)) )
))
(declare-datatypes ((List!2245 0))(
  ( (Nil!2242) (Cons!2241 (h!2866 tuple2!3280) (t!7079 List!2245)) )
))
(declare-datatypes ((ListLongMap!2213 0))(
  ( (ListLongMap!2214 (toList!1122 List!2245)) )
))
(declare-fun contains!1207 (ListLongMap!2213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!777 (array!7527 array!7529 (_ BitVec 32) (_ BitVec 32) V!5233 V!5233 (_ BitVec 32) Int) ListLongMap!2213)

(assert (=> b!179202 (= res!84869 (not (contains!1207 (getCurrentListMap!777 (_keys!5563 thiss!1248) (_values!3661 thiss!1248) (mask!8654 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)) key!828)))))

(declare-fun b!179203 () Bool)

(declare-fun e!118068 () Bool)

(declare-fun mapRes!7168 () Bool)

(assert (=> b!179203 (= e!118071 (and e!118068 mapRes!7168))))

(declare-fun condMapEmpty!7168 () Bool)

(declare-fun mapDefault!7168 () ValueCell!1751)

(assert (=> b!179203 (= condMapEmpty!7168 (= (arr!3567 (_values!3661 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1751)) mapDefault!7168)))))

(declare-fun mapNonEmpty!7168 () Bool)

(declare-fun tp!15972 () Bool)

(declare-fun e!118067 () Bool)

(assert (=> mapNonEmpty!7168 (= mapRes!7168 (and tp!15972 e!118067))))

(declare-fun mapKey!7168 () (_ BitVec 32))

(declare-fun mapValue!7168 () ValueCell!1751)

(declare-fun mapRest!7168 () (Array (_ BitVec 32) ValueCell!1751))

(assert (=> mapNonEmpty!7168 (= (arr!3567 (_values!3661 thiss!1248)) (store mapRest!7168 mapKey!7168 mapValue!7168))))

(declare-fun b!179204 () Bool)

(assert (=> b!179204 (= e!118067 tp_is_empty!4189)))

(declare-fun b!179199 () Bool)

(assert (=> b!179199 (= e!118068 tp_is_empty!4189)))

(declare-fun res!84868 () Bool)

(assert (=> start!17996 (=> (not res!84868) (not e!118072))))

(declare-fun valid!1029 (LongMapFixedSize!2410) Bool)

(assert (=> start!17996 (= res!84868 (valid!1029 thiss!1248))))

(assert (=> start!17996 e!118072))

(assert (=> start!17996 e!118069))

(assert (=> start!17996 true))

(declare-fun b!179205 () Bool)

(declare-fun res!84866 () Bool)

(assert (=> b!179205 (=> (not res!84866) (not e!118072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179205 (= res!84866 (validMask!0 (mask!8654 thiss!1248)))))

(declare-fun b!179206 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7527 (_ BitVec 32)) Bool)

(assert (=> b!179206 (= e!118072 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5563 thiss!1248) (mask!8654 thiss!1248))))))

(declare-fun b!179207 () Bool)

(declare-fun res!84871 () Bool)

(assert (=> b!179207 (=> (not res!84871) (not e!118072))))

(assert (=> b!179207 (= res!84871 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7168 () Bool)

(assert (=> mapIsEmpty!7168 mapRes!7168))

(assert (= (and start!17996 res!84868) b!179207))

(assert (= (and b!179207 res!84871) b!179198))

(assert (= (and b!179198 res!84867) b!179202))

(assert (= (and b!179202 res!84869) b!179205))

(assert (= (and b!179205 res!84866) b!179200))

(assert (= (and b!179200 res!84870) b!179206))

(assert (= (and b!179203 condMapEmpty!7168) mapIsEmpty!7168))

(assert (= (and b!179203 (not condMapEmpty!7168)) mapNonEmpty!7168))

(assert (= (and mapNonEmpty!7168 ((_ is ValueCellFull!1751) mapValue!7168)) b!179204))

(assert (= (and b!179203 ((_ is ValueCellFull!1751) mapDefault!7168)) b!179199))

(assert (= b!179201 b!179203))

(assert (= start!17996 b!179201))

(declare-fun m!207675 () Bool)

(assert (=> b!179206 m!207675))

(declare-fun m!207677 () Bool)

(assert (=> b!179205 m!207677))

(declare-fun m!207679 () Bool)

(assert (=> b!179201 m!207679))

(declare-fun m!207681 () Bool)

(assert (=> b!179201 m!207681))

(declare-fun m!207683 () Bool)

(assert (=> b!179202 m!207683))

(assert (=> b!179202 m!207683))

(declare-fun m!207685 () Bool)

(assert (=> b!179202 m!207685))

(declare-fun m!207687 () Bool)

(assert (=> start!17996 m!207687))

(declare-fun m!207689 () Bool)

(assert (=> b!179198 m!207689))

(declare-fun m!207691 () Bool)

(assert (=> mapNonEmpty!7168 m!207691))

(check-sat (not b_next!4417) (not b!179202) b_and!10959 (not b!179201) (not b!179198) (not b!179206) (not start!17996) (not b!179205) tp_is_empty!4189 (not mapNonEmpty!7168))
(check-sat b_and!10959 (not b_next!4417))
(get-model)

(declare-fun d!54199 () Bool)

(assert (=> d!54199 (= (validMask!0 (mask!8654 thiss!1248)) (and (or (= (mask!8654 thiss!1248) #b00000000000000000000000000000111) (= (mask!8654 thiss!1248) #b00000000000000000000000000001111) (= (mask!8654 thiss!1248) #b00000000000000000000000000011111) (= (mask!8654 thiss!1248) #b00000000000000000000000000111111) (= (mask!8654 thiss!1248) #b00000000000000000000000001111111) (= (mask!8654 thiss!1248) #b00000000000000000000000011111111) (= (mask!8654 thiss!1248) #b00000000000000000000000111111111) (= (mask!8654 thiss!1248) #b00000000000000000000001111111111) (= (mask!8654 thiss!1248) #b00000000000000000000011111111111) (= (mask!8654 thiss!1248) #b00000000000000000000111111111111) (= (mask!8654 thiss!1248) #b00000000000000000001111111111111) (= (mask!8654 thiss!1248) #b00000000000000000011111111111111) (= (mask!8654 thiss!1248) #b00000000000000000111111111111111) (= (mask!8654 thiss!1248) #b00000000000000001111111111111111) (= (mask!8654 thiss!1248) #b00000000000000011111111111111111) (= (mask!8654 thiss!1248) #b00000000000000111111111111111111) (= (mask!8654 thiss!1248) #b00000000000001111111111111111111) (= (mask!8654 thiss!1248) #b00000000000011111111111111111111) (= (mask!8654 thiss!1248) #b00000000000111111111111111111111) (= (mask!8654 thiss!1248) #b00000000001111111111111111111111) (= (mask!8654 thiss!1248) #b00000000011111111111111111111111) (= (mask!8654 thiss!1248) #b00000000111111111111111111111111) (= (mask!8654 thiss!1248) #b00000001111111111111111111111111) (= (mask!8654 thiss!1248) #b00000011111111111111111111111111) (= (mask!8654 thiss!1248) #b00000111111111111111111111111111) (= (mask!8654 thiss!1248) #b00001111111111111111111111111111) (= (mask!8654 thiss!1248) #b00011111111111111111111111111111) (= (mask!8654 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8654 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!179205 d!54199))

(declare-fun d!54201 () Bool)

(assert (=> d!54201 (= (array_inv!2305 (_keys!5563 thiss!1248)) (bvsge (size!3874 (_keys!5563 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179201 d!54201))

(declare-fun d!54203 () Bool)

(assert (=> d!54203 (= (array_inv!2306 (_values!3661 thiss!1248)) (bvsge (size!3875 (_values!3661 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179201 d!54203))

(declare-fun d!54205 () Bool)

(declare-fun res!84914 () Bool)

(declare-fun e!118111 () Bool)

(assert (=> d!54205 (=> (not res!84914) (not e!118111))))

(declare-fun simpleValid!160 (LongMapFixedSize!2410) Bool)

(assert (=> d!54205 (= res!84914 (simpleValid!160 thiss!1248))))

(assert (=> d!54205 (= (valid!1029 thiss!1248) e!118111)))

(declare-fun b!179274 () Bool)

(declare-fun res!84915 () Bool)

(assert (=> b!179274 (=> (not res!84915) (not e!118111))))

(declare-fun arrayCountValidKeys!0 (array!7527 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!179274 (= res!84915 (= (arrayCountValidKeys!0 (_keys!5563 thiss!1248) #b00000000000000000000000000000000 (size!3874 (_keys!5563 thiss!1248))) (_size!1254 thiss!1248)))))

(declare-fun b!179275 () Bool)

(declare-fun res!84916 () Bool)

(assert (=> b!179275 (=> (not res!84916) (not e!118111))))

(assert (=> b!179275 (= res!84916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5563 thiss!1248) (mask!8654 thiss!1248)))))

(declare-fun b!179276 () Bool)

(declare-datatypes ((List!2247 0))(
  ( (Nil!2244) (Cons!2243 (h!2868 (_ BitVec 64)) (t!7083 List!2247)) )
))
(declare-fun arrayNoDuplicates!0 (array!7527 (_ BitVec 32) List!2247) Bool)

(assert (=> b!179276 (= e!118111 (arrayNoDuplicates!0 (_keys!5563 thiss!1248) #b00000000000000000000000000000000 Nil!2244))))

(assert (= (and d!54205 res!84914) b!179274))

(assert (= (and b!179274 res!84915) b!179275))

(assert (= (and b!179275 res!84916) b!179276))

(declare-fun m!207729 () Bool)

(assert (=> d!54205 m!207729))

(declare-fun m!207731 () Bool)

(assert (=> b!179274 m!207731))

(assert (=> b!179275 m!207675))

(declare-fun m!207733 () Bool)

(assert (=> b!179276 m!207733))

(assert (=> start!17996 d!54205))

(declare-fun d!54207 () Bool)

(declare-fun res!84922 () Bool)

(declare-fun e!118119 () Bool)

(assert (=> d!54207 (=> res!84922 e!118119)))

(assert (=> d!54207 (= res!84922 (bvsge #b00000000000000000000000000000000 (size!3874 (_keys!5563 thiss!1248))))))

(assert (=> d!54207 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5563 thiss!1248) (mask!8654 thiss!1248)) e!118119)))

(declare-fun b!179285 () Bool)

(declare-fun e!118120 () Bool)

(declare-fun call!18088 () Bool)

(assert (=> b!179285 (= e!118120 call!18088)))

(declare-fun b!179286 () Bool)

(declare-fun e!118118 () Bool)

(assert (=> b!179286 (= e!118120 e!118118)))

(declare-fun lt!88613 () (_ BitVec 64))

(assert (=> b!179286 (= lt!88613 (select (arr!3566 (_keys!5563 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5459 0))(
  ( (Unit!5460) )
))
(declare-fun lt!88614 () Unit!5459)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7527 (_ BitVec 64) (_ BitVec 32)) Unit!5459)

(assert (=> b!179286 (= lt!88614 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5563 thiss!1248) lt!88613 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!179286 (arrayContainsKey!0 (_keys!5563 thiss!1248) lt!88613 #b00000000000000000000000000000000)))

(declare-fun lt!88615 () Unit!5459)

(assert (=> b!179286 (= lt!88615 lt!88614)))

(declare-fun res!84921 () Bool)

(assert (=> b!179286 (= res!84921 (= (seekEntryOrOpen!0 (select (arr!3566 (_keys!5563 thiss!1248)) #b00000000000000000000000000000000) (_keys!5563 thiss!1248) (mask!8654 thiss!1248)) (Found!574 #b00000000000000000000000000000000)))))

(assert (=> b!179286 (=> (not res!84921) (not e!118118))))

(declare-fun b!179287 () Bool)

(assert (=> b!179287 (= e!118119 e!118120)))

(declare-fun c!32148 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!179287 (= c!32148 (validKeyInArray!0 (select (arr!3566 (_keys!5563 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18085 () Bool)

(assert (=> bm!18085 (= call!18088 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5563 thiss!1248) (mask!8654 thiss!1248)))))

(declare-fun b!179288 () Bool)

(assert (=> b!179288 (= e!118118 call!18088)))

(assert (= (and d!54207 (not res!84922)) b!179287))

(assert (= (and b!179287 c!32148) b!179286))

(assert (= (and b!179287 (not c!32148)) b!179285))

(assert (= (and b!179286 res!84921) b!179288))

(assert (= (or b!179288 b!179285) bm!18085))

(declare-fun m!207735 () Bool)

(assert (=> b!179286 m!207735))

(declare-fun m!207737 () Bool)

(assert (=> b!179286 m!207737))

(declare-fun m!207739 () Bool)

(assert (=> b!179286 m!207739))

(assert (=> b!179286 m!207735))

(declare-fun m!207741 () Bool)

(assert (=> b!179286 m!207741))

(assert (=> b!179287 m!207735))

(assert (=> b!179287 m!207735))

(declare-fun m!207743 () Bool)

(assert (=> b!179287 m!207743))

(declare-fun m!207745 () Bool)

(assert (=> bm!18085 m!207745))

(assert (=> b!179206 d!54207))

(declare-fun d!54209 () Bool)

(declare-fun e!118126 () Bool)

(assert (=> d!54209 e!118126))

(declare-fun res!84925 () Bool)

(assert (=> d!54209 (=> res!84925 e!118126)))

(declare-fun lt!88624 () Bool)

(assert (=> d!54209 (= res!84925 (not lt!88624))))

(declare-fun lt!88625 () Bool)

(assert (=> d!54209 (= lt!88624 lt!88625)))

(declare-fun lt!88627 () Unit!5459)

(declare-fun e!118125 () Unit!5459)

(assert (=> d!54209 (= lt!88627 e!118125)))

(declare-fun c!32151 () Bool)

(assert (=> d!54209 (= c!32151 lt!88625)))

(declare-fun containsKey!205 (List!2245 (_ BitVec 64)) Bool)

(assert (=> d!54209 (= lt!88625 (containsKey!205 (toList!1122 (getCurrentListMap!777 (_keys!5563 thiss!1248) (_values!3661 thiss!1248) (mask!8654 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248))) key!828))))

(assert (=> d!54209 (= (contains!1207 (getCurrentListMap!777 (_keys!5563 thiss!1248) (_values!3661 thiss!1248) (mask!8654 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)) key!828) lt!88624)))

(declare-fun b!179295 () Bool)

(declare-fun lt!88626 () Unit!5459)

(assert (=> b!179295 (= e!118125 lt!88626)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!153 (List!2245 (_ BitVec 64)) Unit!5459)

(assert (=> b!179295 (= lt!88626 (lemmaContainsKeyImpliesGetValueByKeyDefined!153 (toList!1122 (getCurrentListMap!777 (_keys!5563 thiss!1248) (_values!3661 thiss!1248) (mask!8654 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248))) key!828))))

(declare-datatypes ((Option!208 0))(
  ( (Some!207 (v!4029 V!5233)) (None!206) )
))
(declare-fun isDefined!154 (Option!208) Bool)

(declare-fun getValueByKey!202 (List!2245 (_ BitVec 64)) Option!208)

(assert (=> b!179295 (isDefined!154 (getValueByKey!202 (toList!1122 (getCurrentListMap!777 (_keys!5563 thiss!1248) (_values!3661 thiss!1248) (mask!8654 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248))) key!828))))

(declare-fun b!179296 () Bool)

(declare-fun Unit!5461 () Unit!5459)

(assert (=> b!179296 (= e!118125 Unit!5461)))

(declare-fun b!179297 () Bool)

(assert (=> b!179297 (= e!118126 (isDefined!154 (getValueByKey!202 (toList!1122 (getCurrentListMap!777 (_keys!5563 thiss!1248) (_values!3661 thiss!1248) (mask!8654 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248))) key!828)))))

(assert (= (and d!54209 c!32151) b!179295))

(assert (= (and d!54209 (not c!32151)) b!179296))

(assert (= (and d!54209 (not res!84925)) b!179297))

(declare-fun m!207747 () Bool)

(assert (=> d!54209 m!207747))

(declare-fun m!207749 () Bool)

(assert (=> b!179295 m!207749))

(declare-fun m!207751 () Bool)

(assert (=> b!179295 m!207751))

(assert (=> b!179295 m!207751))

(declare-fun m!207753 () Bool)

(assert (=> b!179295 m!207753))

(assert (=> b!179297 m!207751))

(assert (=> b!179297 m!207751))

(assert (=> b!179297 m!207753))

(assert (=> b!179202 d!54209))

(declare-fun b!179340 () Bool)

(declare-fun e!118163 () ListLongMap!2213)

(declare-fun call!18103 () ListLongMap!2213)

(assert (=> b!179340 (= e!118163 call!18103)))

(declare-fun bm!18100 () Bool)

(declare-fun call!18108 () ListLongMap!2213)

(declare-fun call!18106 () ListLongMap!2213)

(assert (=> bm!18100 (= call!18108 call!18106)))

(declare-fun bm!18101 () Bool)

(declare-fun call!18104 () ListLongMap!2213)

(assert (=> bm!18101 (= call!18104 call!18108)))

(declare-fun b!179341 () Bool)

(declare-fun e!118156 () Bool)

(declare-fun e!118153 () Bool)

(assert (=> b!179341 (= e!118156 e!118153)))

(declare-fun res!84950 () Bool)

(assert (=> b!179341 (=> (not res!84950) (not e!118153))))

(declare-fun lt!88675 () ListLongMap!2213)

(assert (=> b!179341 (= res!84950 (contains!1207 lt!88675 (select (arr!3566 (_keys!5563 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!179341 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3874 (_keys!5563 thiss!1248))))))

(declare-fun bm!18102 () Bool)

(declare-fun call!18107 () ListLongMap!2213)

(assert (=> bm!18102 (= call!18103 call!18107)))

(declare-fun b!179343 () Bool)

(declare-fun e!118161 () Bool)

(assert (=> b!179343 (= e!118161 (validKeyInArray!0 (select (arr!3566 (_keys!5563 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179344 () Bool)

(declare-fun res!84946 () Bool)

(declare-fun e!118165 () Bool)

(assert (=> b!179344 (=> (not res!84946) (not e!118165))))

(declare-fun e!118164 () Bool)

(assert (=> b!179344 (= res!84946 e!118164)))

(declare-fun c!32164 () Bool)

(assert (=> b!179344 (= c!32164 (not (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!179345 () Bool)

(declare-fun e!118157 () Bool)

(declare-fun apply!146 (ListLongMap!2213 (_ BitVec 64)) V!5233)

(assert (=> b!179345 (= e!118157 (= (apply!146 lt!88675 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3519 thiss!1248)))))

(declare-fun b!179346 () Bool)

(declare-fun e!118154 () Bool)

(declare-fun call!18109 () Bool)

(assert (=> b!179346 (= e!118154 (not call!18109))))

(declare-fun b!179347 () Bool)

(declare-fun get!2053 (ValueCell!1751 V!5233) V!5233)

(declare-fun dynLambda!489 (Int (_ BitVec 64)) V!5233)

(assert (=> b!179347 (= e!118153 (= (apply!146 lt!88675 (select (arr!3566 (_keys!5563 thiss!1248)) #b00000000000000000000000000000000)) (get!2053 (select (arr!3567 (_values!3661 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!489 (defaultEntry!3678 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!179347 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3875 (_values!3661 thiss!1248))))))

(assert (=> b!179347 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3874 (_keys!5563 thiss!1248))))))

(declare-fun b!179348 () Bool)

(assert (=> b!179348 (= e!118164 e!118157)))

(declare-fun res!84949 () Bool)

(declare-fun call!18105 () Bool)

(assert (=> b!179348 (= res!84949 call!18105)))

(assert (=> b!179348 (=> (not res!84949) (not e!118157))))

(declare-fun b!179349 () Bool)

(declare-fun e!118158 () Unit!5459)

(declare-fun Unit!5462 () Unit!5459)

(assert (=> b!179349 (= e!118158 Unit!5462)))

(declare-fun b!179350 () Bool)

(declare-fun e!118160 () ListLongMap!2213)

(assert (=> b!179350 (= e!118160 call!18103)))

(declare-fun b!179351 () Bool)

(declare-fun e!118159 () ListLongMap!2213)

(declare-fun +!263 (ListLongMap!2213 tuple2!3280) ListLongMap!2213)

(assert (=> b!179351 (= e!118159 (+!263 call!18107 (tuple2!3281 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3519 thiss!1248))))))

(declare-fun bm!18103 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!177 (array!7527 array!7529 (_ BitVec 32) (_ BitVec 32) V!5233 V!5233 (_ BitVec 32) Int) ListLongMap!2213)

(assert (=> bm!18103 (= call!18106 (getCurrentListMapNoExtraKeys!177 (_keys!5563 thiss!1248) (_values!3661 thiss!1248) (mask!8654 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)))))

(declare-fun b!179352 () Bool)

(assert (=> b!179352 (= e!118159 e!118160)))

(declare-fun c!32165 () Bool)

(assert (=> b!179352 (= c!32165 (and (not (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18104 () Bool)

(assert (=> bm!18104 (= call!18105 (contains!1207 lt!88675 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18105 () Bool)

(assert (=> bm!18105 (= call!18109 (contains!1207 lt!88675 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!32169 () Bool)

(declare-fun bm!18106 () Bool)

(assert (=> bm!18106 (= call!18107 (+!263 (ite c!32169 call!18106 (ite c!32165 call!18108 call!18104)) (ite (or c!32169 c!32165) (tuple2!3281 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3519 thiss!1248)) (tuple2!3281 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3519 thiss!1248)))))))

(declare-fun b!179353 () Bool)

(declare-fun e!118155 () Bool)

(assert (=> b!179353 (= e!118155 (= (apply!146 lt!88675 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3519 thiss!1248)))))

(declare-fun b!179342 () Bool)

(declare-fun lt!88686 () Unit!5459)

(assert (=> b!179342 (= e!118158 lt!88686)))

(declare-fun lt!88678 () ListLongMap!2213)

(assert (=> b!179342 (= lt!88678 (getCurrentListMapNoExtraKeys!177 (_keys!5563 thiss!1248) (_values!3661 thiss!1248) (mask!8654 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)))))

(declare-fun lt!88687 () (_ BitVec 64))

(assert (=> b!179342 (= lt!88687 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88688 () (_ BitVec 64))

(assert (=> b!179342 (= lt!88688 (select (arr!3566 (_keys!5563 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88693 () Unit!5459)

(declare-fun addStillContains!122 (ListLongMap!2213 (_ BitVec 64) V!5233 (_ BitVec 64)) Unit!5459)

(assert (=> b!179342 (= lt!88693 (addStillContains!122 lt!88678 lt!88687 (zeroValue!3519 thiss!1248) lt!88688))))

(assert (=> b!179342 (contains!1207 (+!263 lt!88678 (tuple2!3281 lt!88687 (zeroValue!3519 thiss!1248))) lt!88688)))

(declare-fun lt!88680 () Unit!5459)

(assert (=> b!179342 (= lt!88680 lt!88693)))

(declare-fun lt!88690 () ListLongMap!2213)

(assert (=> b!179342 (= lt!88690 (getCurrentListMapNoExtraKeys!177 (_keys!5563 thiss!1248) (_values!3661 thiss!1248) (mask!8654 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)))))

(declare-fun lt!88685 () (_ BitVec 64))

(assert (=> b!179342 (= lt!88685 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88691 () (_ BitVec 64))

(assert (=> b!179342 (= lt!88691 (select (arr!3566 (_keys!5563 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88681 () Unit!5459)

(declare-fun addApplyDifferent!122 (ListLongMap!2213 (_ BitVec 64) V!5233 (_ BitVec 64)) Unit!5459)

(assert (=> b!179342 (= lt!88681 (addApplyDifferent!122 lt!88690 lt!88685 (minValue!3519 thiss!1248) lt!88691))))

(assert (=> b!179342 (= (apply!146 (+!263 lt!88690 (tuple2!3281 lt!88685 (minValue!3519 thiss!1248))) lt!88691) (apply!146 lt!88690 lt!88691))))

(declare-fun lt!88692 () Unit!5459)

(assert (=> b!179342 (= lt!88692 lt!88681)))

(declare-fun lt!88672 () ListLongMap!2213)

(assert (=> b!179342 (= lt!88672 (getCurrentListMapNoExtraKeys!177 (_keys!5563 thiss!1248) (_values!3661 thiss!1248) (mask!8654 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)))))

(declare-fun lt!88679 () (_ BitVec 64))

(assert (=> b!179342 (= lt!88679 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88673 () (_ BitVec 64))

(assert (=> b!179342 (= lt!88673 (select (arr!3566 (_keys!5563 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88674 () Unit!5459)

(assert (=> b!179342 (= lt!88674 (addApplyDifferent!122 lt!88672 lt!88679 (zeroValue!3519 thiss!1248) lt!88673))))

(assert (=> b!179342 (= (apply!146 (+!263 lt!88672 (tuple2!3281 lt!88679 (zeroValue!3519 thiss!1248))) lt!88673) (apply!146 lt!88672 lt!88673))))

(declare-fun lt!88682 () Unit!5459)

(assert (=> b!179342 (= lt!88682 lt!88674)))

(declare-fun lt!88683 () ListLongMap!2213)

(assert (=> b!179342 (= lt!88683 (getCurrentListMapNoExtraKeys!177 (_keys!5563 thiss!1248) (_values!3661 thiss!1248) (mask!8654 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)))))

(declare-fun lt!88689 () (_ BitVec 64))

(assert (=> b!179342 (= lt!88689 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88684 () (_ BitVec 64))

(assert (=> b!179342 (= lt!88684 (select (arr!3566 (_keys!5563 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179342 (= lt!88686 (addApplyDifferent!122 lt!88683 lt!88689 (minValue!3519 thiss!1248) lt!88684))))

(assert (=> b!179342 (= (apply!146 (+!263 lt!88683 (tuple2!3281 lt!88689 (minValue!3519 thiss!1248))) lt!88684) (apply!146 lt!88683 lt!88684))))

(declare-fun d!54211 () Bool)

(assert (=> d!54211 e!118165))

(declare-fun res!84944 () Bool)

(assert (=> d!54211 (=> (not res!84944) (not e!118165))))

(assert (=> d!54211 (= res!84944 (or (bvsge #b00000000000000000000000000000000 (size!3874 (_keys!5563 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3874 (_keys!5563 thiss!1248))))))))

(declare-fun lt!88676 () ListLongMap!2213)

(assert (=> d!54211 (= lt!88675 lt!88676)))

(declare-fun lt!88677 () Unit!5459)

(assert (=> d!54211 (= lt!88677 e!118158)))

(declare-fun c!32167 () Bool)

(assert (=> d!54211 (= c!32167 e!118161)))

(declare-fun res!84951 () Bool)

(assert (=> d!54211 (=> (not res!84951) (not e!118161))))

(assert (=> d!54211 (= res!84951 (bvslt #b00000000000000000000000000000000 (size!3874 (_keys!5563 thiss!1248))))))

(assert (=> d!54211 (= lt!88676 e!118159)))

(assert (=> d!54211 (= c!32169 (and (not (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54211 (validMask!0 (mask!8654 thiss!1248))))

(assert (=> d!54211 (= (getCurrentListMap!777 (_keys!5563 thiss!1248) (_values!3661 thiss!1248) (mask!8654 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)) lt!88675)))

(declare-fun b!179354 () Bool)

(declare-fun res!84948 () Bool)

(assert (=> b!179354 (=> (not res!84948) (not e!118165))))

(assert (=> b!179354 (= res!84948 e!118156)))

(declare-fun res!84945 () Bool)

(assert (=> b!179354 (=> res!84945 e!118156)))

(declare-fun e!118162 () Bool)

(assert (=> b!179354 (= res!84945 (not e!118162))))

(declare-fun res!84947 () Bool)

(assert (=> b!179354 (=> (not res!84947) (not e!118162))))

(assert (=> b!179354 (= res!84947 (bvslt #b00000000000000000000000000000000 (size!3874 (_keys!5563 thiss!1248))))))

(declare-fun b!179355 () Bool)

(assert (=> b!179355 (= e!118162 (validKeyInArray!0 (select (arr!3566 (_keys!5563 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179356 () Bool)

(assert (=> b!179356 (= e!118165 e!118154)))

(declare-fun c!32166 () Bool)

(assert (=> b!179356 (= c!32166 (not (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!179357 () Bool)

(assert (=> b!179357 (= e!118163 call!18104)))

(declare-fun b!179358 () Bool)

(assert (=> b!179358 (= e!118154 e!118155)))

(declare-fun res!84952 () Bool)

(assert (=> b!179358 (= res!84952 call!18109)))

(assert (=> b!179358 (=> (not res!84952) (not e!118155))))

(declare-fun b!179359 () Bool)

(assert (=> b!179359 (= e!118164 (not call!18105))))

(declare-fun b!179360 () Bool)

(declare-fun c!32168 () Bool)

(assert (=> b!179360 (= c!32168 (and (not (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!179360 (= e!118160 e!118163)))

(assert (= (and d!54211 c!32169) b!179351))

(assert (= (and d!54211 (not c!32169)) b!179352))

(assert (= (and b!179352 c!32165) b!179350))

(assert (= (and b!179352 (not c!32165)) b!179360))

(assert (= (and b!179360 c!32168) b!179340))

(assert (= (and b!179360 (not c!32168)) b!179357))

(assert (= (or b!179340 b!179357) bm!18101))

(assert (= (or b!179350 bm!18101) bm!18100))

(assert (= (or b!179350 b!179340) bm!18102))

(assert (= (or b!179351 bm!18100) bm!18103))

(assert (= (or b!179351 bm!18102) bm!18106))

(assert (= (and d!54211 res!84951) b!179343))

(assert (= (and d!54211 c!32167) b!179342))

(assert (= (and d!54211 (not c!32167)) b!179349))

(assert (= (and d!54211 res!84944) b!179354))

(assert (= (and b!179354 res!84947) b!179355))

(assert (= (and b!179354 (not res!84945)) b!179341))

(assert (= (and b!179341 res!84950) b!179347))

(assert (= (and b!179354 res!84948) b!179344))

(assert (= (and b!179344 c!32164) b!179348))

(assert (= (and b!179344 (not c!32164)) b!179359))

(assert (= (and b!179348 res!84949) b!179345))

(assert (= (or b!179348 b!179359) bm!18104))

(assert (= (and b!179344 res!84946) b!179356))

(assert (= (and b!179356 c!32166) b!179358))

(assert (= (and b!179356 (not c!32166)) b!179346))

(assert (= (and b!179358 res!84952) b!179353))

(assert (= (or b!179358 b!179346) bm!18105))

(declare-fun b_lambda!7129 () Bool)

(assert (=> (not b_lambda!7129) (not b!179347)))

(declare-fun t!7082 () Bool)

(declare-fun tb!2795 () Bool)

(assert (=> (and b!179201 (= (defaultEntry!3678 thiss!1248) (defaultEntry!3678 thiss!1248)) t!7082) tb!2795))

(declare-fun result!4675 () Bool)

(assert (=> tb!2795 (= result!4675 tp_is_empty!4189)))

(assert (=> b!179347 t!7082))

(declare-fun b_and!10965 () Bool)

(assert (= b_and!10959 (and (=> t!7082 result!4675) b_and!10965)))

(assert (=> b!179341 m!207735))

(assert (=> b!179341 m!207735))

(declare-fun m!207755 () Bool)

(assert (=> b!179341 m!207755))

(declare-fun m!207757 () Bool)

(assert (=> bm!18104 m!207757))

(declare-fun m!207759 () Bool)

(assert (=> b!179351 m!207759))

(declare-fun m!207761 () Bool)

(assert (=> bm!18106 m!207761))

(declare-fun m!207763 () Bool)

(assert (=> bm!18105 m!207763))

(declare-fun m!207765 () Bool)

(assert (=> b!179345 m!207765))

(assert (=> b!179355 m!207735))

(assert (=> b!179355 m!207735))

(assert (=> b!179355 m!207743))

(declare-fun m!207767 () Bool)

(assert (=> b!179342 m!207767))

(declare-fun m!207769 () Bool)

(assert (=> b!179342 m!207769))

(declare-fun m!207771 () Bool)

(assert (=> b!179342 m!207771))

(declare-fun m!207773 () Bool)

(assert (=> b!179342 m!207773))

(declare-fun m!207775 () Bool)

(assert (=> b!179342 m!207775))

(assert (=> b!179342 m!207771))

(declare-fun m!207777 () Bool)

(assert (=> b!179342 m!207777))

(declare-fun m!207779 () Bool)

(assert (=> b!179342 m!207779))

(declare-fun m!207781 () Bool)

(assert (=> b!179342 m!207781))

(declare-fun m!207783 () Bool)

(assert (=> b!179342 m!207783))

(declare-fun m!207785 () Bool)

(assert (=> b!179342 m!207785))

(assert (=> b!179342 m!207781))

(declare-fun m!207787 () Bool)

(assert (=> b!179342 m!207787))

(declare-fun m!207789 () Bool)

(assert (=> b!179342 m!207789))

(declare-fun m!207791 () Bool)

(assert (=> b!179342 m!207791))

(assert (=> b!179342 m!207735))

(declare-fun m!207793 () Bool)

(assert (=> b!179342 m!207793))

(assert (=> b!179342 m!207787))

(declare-fun m!207795 () Bool)

(assert (=> b!179342 m!207795))

(assert (=> b!179342 m!207775))

(declare-fun m!207797 () Bool)

(assert (=> b!179342 m!207797))

(assert (=> d!54211 m!207677))

(assert (=> b!179343 m!207735))

(assert (=> b!179343 m!207735))

(assert (=> b!179343 m!207743))

(declare-fun m!207799 () Bool)

(assert (=> b!179353 m!207799))

(assert (=> bm!18103 m!207773))

(assert (=> b!179347 m!207735))

(declare-fun m!207801 () Bool)

(assert (=> b!179347 m!207801))

(declare-fun m!207803 () Bool)

(assert (=> b!179347 m!207803))

(assert (=> b!179347 m!207735))

(assert (=> b!179347 m!207803))

(declare-fun m!207805 () Bool)

(assert (=> b!179347 m!207805))

(declare-fun m!207807 () Bool)

(assert (=> b!179347 m!207807))

(assert (=> b!179347 m!207805))

(assert (=> b!179202 d!54211))

(declare-fun d!54213 () Bool)

(declare-fun lt!88700 () SeekEntryResult!574)

(assert (=> d!54213 (and (or ((_ is Undefined!574) lt!88700) (not ((_ is Found!574) lt!88700)) (and (bvsge (index!4465 lt!88700) #b00000000000000000000000000000000) (bvslt (index!4465 lt!88700) (size!3874 (_keys!5563 thiss!1248))))) (or ((_ is Undefined!574) lt!88700) ((_ is Found!574) lt!88700) (not ((_ is MissingZero!574) lt!88700)) (and (bvsge (index!4464 lt!88700) #b00000000000000000000000000000000) (bvslt (index!4464 lt!88700) (size!3874 (_keys!5563 thiss!1248))))) (or ((_ is Undefined!574) lt!88700) ((_ is Found!574) lt!88700) ((_ is MissingZero!574) lt!88700) (not ((_ is MissingVacant!574) lt!88700)) (and (bvsge (index!4467 lt!88700) #b00000000000000000000000000000000) (bvslt (index!4467 lt!88700) (size!3874 (_keys!5563 thiss!1248))))) (or ((_ is Undefined!574) lt!88700) (ite ((_ is Found!574) lt!88700) (= (select (arr!3566 (_keys!5563 thiss!1248)) (index!4465 lt!88700)) key!828) (ite ((_ is MissingZero!574) lt!88700) (= (select (arr!3566 (_keys!5563 thiss!1248)) (index!4464 lt!88700)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!574) lt!88700) (= (select (arr!3566 (_keys!5563 thiss!1248)) (index!4467 lt!88700)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!118173 () SeekEntryResult!574)

(assert (=> d!54213 (= lt!88700 e!118173)))

(declare-fun c!32176 () Bool)

(declare-fun lt!88702 () SeekEntryResult!574)

(assert (=> d!54213 (= c!32176 (and ((_ is Intermediate!574) lt!88702) (undefined!1386 lt!88702)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7527 (_ BitVec 32)) SeekEntryResult!574)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54213 (= lt!88702 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8654 thiss!1248)) key!828 (_keys!5563 thiss!1248) (mask!8654 thiss!1248)))))

(assert (=> d!54213 (validMask!0 (mask!8654 thiss!1248))))

(assert (=> d!54213 (= (seekEntryOrOpen!0 key!828 (_keys!5563 thiss!1248) (mask!8654 thiss!1248)) lt!88700)))

(declare-fun b!179375 () Bool)

(declare-fun e!118174 () SeekEntryResult!574)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7527 (_ BitVec 32)) SeekEntryResult!574)

(assert (=> b!179375 (= e!118174 (seekKeyOrZeroReturnVacant!0 (x!19594 lt!88702) (index!4466 lt!88702) (index!4466 lt!88702) key!828 (_keys!5563 thiss!1248) (mask!8654 thiss!1248)))))

(declare-fun b!179376 () Bool)

(assert (=> b!179376 (= e!118173 Undefined!574)))

(declare-fun b!179377 () Bool)

(assert (=> b!179377 (= e!118174 (MissingZero!574 (index!4466 lt!88702)))))

(declare-fun b!179378 () Bool)

(declare-fun c!32178 () Bool)

(declare-fun lt!88701 () (_ BitVec 64))

(assert (=> b!179378 (= c!32178 (= lt!88701 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118172 () SeekEntryResult!574)

(assert (=> b!179378 (= e!118172 e!118174)))

(declare-fun b!179379 () Bool)

(assert (=> b!179379 (= e!118173 e!118172)))

(assert (=> b!179379 (= lt!88701 (select (arr!3566 (_keys!5563 thiss!1248)) (index!4466 lt!88702)))))

(declare-fun c!32177 () Bool)

(assert (=> b!179379 (= c!32177 (= lt!88701 key!828))))

(declare-fun b!179380 () Bool)

(assert (=> b!179380 (= e!118172 (Found!574 (index!4466 lt!88702)))))

(assert (= (and d!54213 c!32176) b!179376))

(assert (= (and d!54213 (not c!32176)) b!179379))

(assert (= (and b!179379 c!32177) b!179380))

(assert (= (and b!179379 (not c!32177)) b!179378))

(assert (= (and b!179378 c!32178) b!179377))

(assert (= (and b!179378 (not c!32178)) b!179375))

(declare-fun m!207809 () Bool)

(assert (=> d!54213 m!207809))

(declare-fun m!207811 () Bool)

(assert (=> d!54213 m!207811))

(assert (=> d!54213 m!207677))

(assert (=> d!54213 m!207809))

(declare-fun m!207813 () Bool)

(assert (=> d!54213 m!207813))

(declare-fun m!207815 () Bool)

(assert (=> d!54213 m!207815))

(declare-fun m!207817 () Bool)

(assert (=> d!54213 m!207817))

(declare-fun m!207819 () Bool)

(assert (=> b!179375 m!207819))

(declare-fun m!207821 () Bool)

(assert (=> b!179379 m!207821))

(assert (=> b!179198 d!54213))

(declare-fun mapNonEmpty!7177 () Bool)

(declare-fun mapRes!7177 () Bool)

(declare-fun tp!15988 () Bool)

(declare-fun e!118180 () Bool)

(assert (=> mapNonEmpty!7177 (= mapRes!7177 (and tp!15988 e!118180))))

(declare-fun mapRest!7177 () (Array (_ BitVec 32) ValueCell!1751))

(declare-fun mapKey!7177 () (_ BitVec 32))

(declare-fun mapValue!7177 () ValueCell!1751)

(assert (=> mapNonEmpty!7177 (= mapRest!7168 (store mapRest!7177 mapKey!7177 mapValue!7177))))

(declare-fun mapIsEmpty!7177 () Bool)

(assert (=> mapIsEmpty!7177 mapRes!7177))

(declare-fun b!179387 () Bool)

(assert (=> b!179387 (= e!118180 tp_is_empty!4189)))

(declare-fun b!179388 () Bool)

(declare-fun e!118179 () Bool)

(assert (=> b!179388 (= e!118179 tp_is_empty!4189)))

(declare-fun condMapEmpty!7177 () Bool)

(declare-fun mapDefault!7177 () ValueCell!1751)

(assert (=> mapNonEmpty!7168 (= condMapEmpty!7177 (= mapRest!7168 ((as const (Array (_ BitVec 32) ValueCell!1751)) mapDefault!7177)))))

(assert (=> mapNonEmpty!7168 (= tp!15972 (and e!118179 mapRes!7177))))

(assert (= (and mapNonEmpty!7168 condMapEmpty!7177) mapIsEmpty!7177))

(assert (= (and mapNonEmpty!7168 (not condMapEmpty!7177)) mapNonEmpty!7177))

(assert (= (and mapNonEmpty!7177 ((_ is ValueCellFull!1751) mapValue!7177)) b!179387))

(assert (= (and mapNonEmpty!7168 ((_ is ValueCellFull!1751) mapDefault!7177)) b!179388))

(declare-fun m!207823 () Bool)

(assert (=> mapNonEmpty!7177 m!207823))

(declare-fun b_lambda!7131 () Bool)

(assert (= b_lambda!7129 (or (and b!179201 b_free!4417) b_lambda!7131)))

(check-sat (not b_next!4417) (not b!179276) (not b!179343) (not mapNonEmpty!7177) (not bm!18105) (not d!54209) (not b!179297) (not b!179351) (not b!179345) (not b!179355) (not b!179275) (not b!179295) (not b!179287) (not b!179353) (not b!179342) (not b!179375) (not b!179286) (not bm!18104) (not d!54213) (not bm!18106) (not d!54211) tp_is_empty!4189 (not b!179274) b_and!10965 (not b!179341) (not bm!18085) (not b_lambda!7131) (not bm!18103) (not d!54205) (not b!179347))
(check-sat b_and!10965 (not b_next!4417))
