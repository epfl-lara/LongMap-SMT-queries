; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22482 () Bool)

(assert start!22482)

(declare-fun b!235085 () Bool)

(declare-fun b_free!6321 () Bool)

(declare-fun b_next!6321 () Bool)

(assert (=> b!235085 (= b_free!6321 (not b_next!6321))))

(declare-fun tp!22127 () Bool)

(declare-fun b_and!13247 () Bool)

(assert (=> b!235085 (= tp!22127 b_and!13247)))

(declare-fun b!235076 () Bool)

(declare-fun e!152680 () Bool)

(declare-fun tp_is_empty!6183 () Bool)

(assert (=> b!235076 (= e!152680 tp_is_empty!6183)))

(declare-fun b!235077 () Bool)

(declare-fun res!115279 () Bool)

(declare-fun e!152678 () Bool)

(assert (=> b!235077 (=> (not res!115279) (not e!152678))))

(declare-datatypes ((V!7891 0))(
  ( (V!7892 (val!3136 Int)) )
))
(declare-datatypes ((ValueCell!2748 0))(
  ( (ValueCellFull!2748 (v!5162 V!7891)) (EmptyCell!2748) )
))
(declare-datatypes ((array!11621 0))(
  ( (array!11622 (arr!5524 (Array (_ BitVec 32) ValueCell!2748)) (size!5861 (_ BitVec 32))) )
))
(declare-datatypes ((array!11623 0))(
  ( (array!11624 (arr!5525 (Array (_ BitVec 32) (_ BitVec 64))) (size!5862 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3396 0))(
  ( (LongMapFixedSize!3397 (defaultEntry!4367 Int) (mask!10329 (_ BitVec 32)) (extraKeys!4104 (_ BitVec 32)) (zeroValue!4208 V!7891) (minValue!4208 V!7891) (_size!1747 (_ BitVec 32)) (_keys!6439 array!11623) (_values!4350 array!11621) (_vacant!1747 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3396)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4622 0))(
  ( (tuple2!4623 (_1!2322 (_ BitVec 64)) (_2!2322 V!7891)) )
))
(declare-datatypes ((List!3530 0))(
  ( (Nil!3527) (Cons!3526 (h!4178 tuple2!4622) (t!8501 List!3530)) )
))
(declare-datatypes ((ListLongMap!3535 0))(
  ( (ListLongMap!3536 (toList!1783 List!3530)) )
))
(declare-fun contains!1659 (ListLongMap!3535 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1311 (array!11623 array!11621 (_ BitVec 32) (_ BitVec 32) V!7891 V!7891 (_ BitVec 32) Int) ListLongMap!3535)

(assert (=> b!235077 (= res!115279 (contains!1659 (getCurrentListMap!1311 (_keys!6439 thiss!1504) (_values!4350 thiss!1504) (mask!10329 thiss!1504) (extraKeys!4104 thiss!1504) (zeroValue!4208 thiss!1504) (minValue!4208 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4367 thiss!1504)) key!932))))

(declare-fun b!235078 () Bool)

(declare-fun res!115280 () Bool)

(assert (=> b!235078 (=> (not res!115280) (not e!152678))))

(assert (=> b!235078 (= res!115280 (and (= (size!5861 (_values!4350 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10329 thiss!1504))) (= (size!5862 (_keys!6439 thiss!1504)) (size!5861 (_values!4350 thiss!1504))) (bvsge (mask!10329 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4104 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4104 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!10466 () Bool)

(declare-fun mapRes!10466 () Bool)

(assert (=> mapIsEmpty!10466 mapRes!10466))

(declare-fun res!115277 () Bool)

(declare-fun e!152677 () Bool)

(assert (=> start!22482 (=> (not res!115277) (not e!152677))))

(declare-fun valid!1340 (LongMapFixedSize!3396) Bool)

(assert (=> start!22482 (= res!115277 (valid!1340 thiss!1504))))

(assert (=> start!22482 e!152677))

(declare-fun e!152679 () Bool)

(assert (=> start!22482 e!152679))

(assert (=> start!22482 true))

(declare-fun b!235079 () Bool)

(assert (=> b!235079 (= e!152677 e!152678)))

(declare-fun res!115276 () Bool)

(assert (=> b!235079 (=> (not res!115276) (not e!152678))))

(declare-datatypes ((SeekEntryResult!984 0))(
  ( (MissingZero!984 (index!6106 (_ BitVec 32))) (Found!984 (index!6107 (_ BitVec 32))) (Intermediate!984 (undefined!1796 Bool) (index!6108 (_ BitVec 32)) (x!23752 (_ BitVec 32))) (Undefined!984) (MissingVacant!984 (index!6109 (_ BitVec 32))) )
))
(declare-fun lt!118927 () SeekEntryResult!984)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235079 (= res!115276 (or (= lt!118927 (MissingZero!984 index!297)) (= lt!118927 (MissingVacant!984 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11623 (_ BitVec 32)) SeekEntryResult!984)

(assert (=> b!235079 (= lt!118927 (seekEntryOrOpen!0 key!932 (_keys!6439 thiss!1504) (mask!10329 thiss!1504)))))

(declare-fun b!235080 () Bool)

(declare-fun res!115281 () Bool)

(assert (=> b!235080 (=> (not res!115281) (not e!152677))))

(assert (=> b!235080 (= res!115281 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235081 () Bool)

(declare-fun e!152675 () Bool)

(declare-fun e!152676 () Bool)

(assert (=> b!235081 (= e!152675 (and e!152676 mapRes!10466))))

(declare-fun condMapEmpty!10466 () Bool)

(declare-fun mapDefault!10466 () ValueCell!2748)

(assert (=> b!235081 (= condMapEmpty!10466 (= (arr!5524 (_values!4350 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2748)) mapDefault!10466)))))

(declare-fun b!235082 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11623 (_ BitVec 32)) Bool)

(assert (=> b!235082 (= e!152678 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6439 thiss!1504) (mask!10329 thiss!1504))))))

(declare-fun mapNonEmpty!10466 () Bool)

(declare-fun tp!22126 () Bool)

(assert (=> mapNonEmpty!10466 (= mapRes!10466 (and tp!22126 e!152680))))

(declare-fun mapRest!10466 () (Array (_ BitVec 32) ValueCell!2748))

(declare-fun mapKey!10466 () (_ BitVec 32))

(declare-fun mapValue!10466 () ValueCell!2748)

(assert (=> mapNonEmpty!10466 (= (arr!5524 (_values!4350 thiss!1504)) (store mapRest!10466 mapKey!10466 mapValue!10466))))

(declare-fun b!235083 () Bool)

(declare-fun res!115278 () Bool)

(assert (=> b!235083 (=> (not res!115278) (not e!152678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235083 (= res!115278 (validMask!0 (mask!10329 thiss!1504)))))

(declare-fun b!235084 () Bool)

(assert (=> b!235084 (= e!152676 tp_is_empty!6183)))

(declare-fun array_inv!3641 (array!11623) Bool)

(declare-fun array_inv!3642 (array!11621) Bool)

(assert (=> b!235085 (= e!152679 (and tp!22127 tp_is_empty!6183 (array_inv!3641 (_keys!6439 thiss!1504)) (array_inv!3642 (_values!4350 thiss!1504)) e!152675))))

(assert (= (and start!22482 res!115277) b!235080))

(assert (= (and b!235080 res!115281) b!235079))

(assert (= (and b!235079 res!115276) b!235077))

(assert (= (and b!235077 res!115279) b!235083))

(assert (= (and b!235083 res!115278) b!235078))

(assert (= (and b!235078 res!115280) b!235082))

(assert (= (and b!235081 condMapEmpty!10466) mapIsEmpty!10466))

(assert (= (and b!235081 (not condMapEmpty!10466)) mapNonEmpty!10466))

(get-info :version)

(assert (= (and mapNonEmpty!10466 ((_ is ValueCellFull!2748) mapValue!10466)) b!235076))

(assert (= (and b!235081 ((_ is ValueCellFull!2748) mapDefault!10466)) b!235084))

(assert (= b!235085 b!235081))

(assert (= start!22482 b!235085))

(declare-fun m!256303 () Bool)

(assert (=> b!235077 m!256303))

(assert (=> b!235077 m!256303))

(declare-fun m!256305 () Bool)

(assert (=> b!235077 m!256305))

(declare-fun m!256307 () Bool)

(assert (=> b!235082 m!256307))

(declare-fun m!256309 () Bool)

(assert (=> b!235083 m!256309))

(declare-fun m!256311 () Bool)

(assert (=> mapNonEmpty!10466 m!256311))

(declare-fun m!256313 () Bool)

(assert (=> start!22482 m!256313))

(declare-fun m!256315 () Bool)

(assert (=> b!235079 m!256315))

(declare-fun m!256317 () Bool)

(assert (=> b!235085 m!256317))

(declare-fun m!256319 () Bool)

(assert (=> b!235085 m!256319))

(check-sat (not b!235082) (not start!22482) (not b!235077) (not b_next!6321) (not b!235083) (not b!235079) tp_is_empty!6183 b_and!13247 (not b!235085) (not mapNonEmpty!10466))
(check-sat b_and!13247 (not b_next!6321))
(get-model)

(declare-fun bm!21852 () Bool)

(declare-fun call!21855 () Bool)

(assert (=> bm!21852 (= call!21855 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6439 thiss!1504) (mask!10329 thiss!1504)))))

(declare-fun d!59255 () Bool)

(declare-fun res!115304 () Bool)

(declare-fun e!152710 () Bool)

(assert (=> d!59255 (=> res!115304 e!152710)))

(assert (=> d!59255 (= res!115304 (bvsge #b00000000000000000000000000000000 (size!5862 (_keys!6439 thiss!1504))))))

(assert (=> d!59255 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6439 thiss!1504) (mask!10329 thiss!1504)) e!152710)))

(declare-fun b!235124 () Bool)

(declare-fun e!152708 () Bool)

(assert (=> b!235124 (= e!152708 call!21855)))

(declare-fun b!235125 () Bool)

(declare-fun e!152709 () Bool)

(assert (=> b!235125 (= e!152709 call!21855)))

(declare-fun b!235126 () Bool)

(assert (=> b!235126 (= e!152708 e!152709)))

(declare-fun lt!118938 () (_ BitVec 64))

(assert (=> b!235126 (= lt!118938 (select (arr!5525 (_keys!6439 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!7250 0))(
  ( (Unit!7251) )
))
(declare-fun lt!118937 () Unit!7250)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11623 (_ BitVec 64) (_ BitVec 32)) Unit!7250)

(assert (=> b!235126 (= lt!118937 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6439 thiss!1504) lt!118938 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!235126 (arrayContainsKey!0 (_keys!6439 thiss!1504) lt!118938 #b00000000000000000000000000000000)))

(declare-fun lt!118939 () Unit!7250)

(assert (=> b!235126 (= lt!118939 lt!118937)))

(declare-fun res!115305 () Bool)

(assert (=> b!235126 (= res!115305 (= (seekEntryOrOpen!0 (select (arr!5525 (_keys!6439 thiss!1504)) #b00000000000000000000000000000000) (_keys!6439 thiss!1504) (mask!10329 thiss!1504)) (Found!984 #b00000000000000000000000000000000)))))

(assert (=> b!235126 (=> (not res!115305) (not e!152709))))

(declare-fun b!235127 () Bool)

(assert (=> b!235127 (= e!152710 e!152708)))

(declare-fun c!39178 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!235127 (= c!39178 (validKeyInArray!0 (select (arr!5525 (_keys!6439 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59255 (not res!115304)) b!235127))

(assert (= (and b!235127 c!39178) b!235126))

(assert (= (and b!235127 (not c!39178)) b!235124))

(assert (= (and b!235126 res!115305) b!235125))

(assert (= (or b!235125 b!235124) bm!21852))

(declare-fun m!256339 () Bool)

(assert (=> bm!21852 m!256339))

(declare-fun m!256341 () Bool)

(assert (=> b!235126 m!256341))

(declare-fun m!256343 () Bool)

(assert (=> b!235126 m!256343))

(declare-fun m!256345 () Bool)

(assert (=> b!235126 m!256345))

(assert (=> b!235126 m!256341))

(declare-fun m!256347 () Bool)

(assert (=> b!235126 m!256347))

(assert (=> b!235127 m!256341))

(assert (=> b!235127 m!256341))

(declare-fun m!256349 () Bool)

(assert (=> b!235127 m!256349))

(assert (=> b!235082 d!59255))

(declare-fun d!59257 () Bool)

(declare-fun e!152715 () Bool)

(assert (=> d!59257 e!152715))

(declare-fun res!115308 () Bool)

(assert (=> d!59257 (=> res!115308 e!152715)))

(declare-fun lt!118949 () Bool)

(assert (=> d!59257 (= res!115308 (not lt!118949))))

(declare-fun lt!118950 () Bool)

(assert (=> d!59257 (= lt!118949 lt!118950)))

(declare-fun lt!118951 () Unit!7250)

(declare-fun e!152716 () Unit!7250)

(assert (=> d!59257 (= lt!118951 e!152716)))

(declare-fun c!39181 () Bool)

(assert (=> d!59257 (= c!39181 lt!118950)))

(declare-fun containsKey!259 (List!3530 (_ BitVec 64)) Bool)

(assert (=> d!59257 (= lt!118950 (containsKey!259 (toList!1783 (getCurrentListMap!1311 (_keys!6439 thiss!1504) (_values!4350 thiss!1504) (mask!10329 thiss!1504) (extraKeys!4104 thiss!1504) (zeroValue!4208 thiss!1504) (minValue!4208 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4367 thiss!1504))) key!932))))

(assert (=> d!59257 (= (contains!1659 (getCurrentListMap!1311 (_keys!6439 thiss!1504) (_values!4350 thiss!1504) (mask!10329 thiss!1504) (extraKeys!4104 thiss!1504) (zeroValue!4208 thiss!1504) (minValue!4208 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4367 thiss!1504)) key!932) lt!118949)))

(declare-fun b!235134 () Bool)

(declare-fun lt!118948 () Unit!7250)

(assert (=> b!235134 (= e!152716 lt!118948)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!207 (List!3530 (_ BitVec 64)) Unit!7250)

(assert (=> b!235134 (= lt!118948 (lemmaContainsKeyImpliesGetValueByKeyDefined!207 (toList!1783 (getCurrentListMap!1311 (_keys!6439 thiss!1504) (_values!4350 thiss!1504) (mask!10329 thiss!1504) (extraKeys!4104 thiss!1504) (zeroValue!4208 thiss!1504) (minValue!4208 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4367 thiss!1504))) key!932))))

(declare-datatypes ((Option!273 0))(
  ( (Some!272 (v!5164 V!7891)) (None!271) )
))
(declare-fun isDefined!208 (Option!273) Bool)

(declare-fun getValueByKey!267 (List!3530 (_ BitVec 64)) Option!273)

(assert (=> b!235134 (isDefined!208 (getValueByKey!267 (toList!1783 (getCurrentListMap!1311 (_keys!6439 thiss!1504) (_values!4350 thiss!1504) (mask!10329 thiss!1504) (extraKeys!4104 thiss!1504) (zeroValue!4208 thiss!1504) (minValue!4208 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4367 thiss!1504))) key!932))))

(declare-fun b!235135 () Bool)

(declare-fun Unit!7252 () Unit!7250)

(assert (=> b!235135 (= e!152716 Unit!7252)))

(declare-fun b!235136 () Bool)

(assert (=> b!235136 (= e!152715 (isDefined!208 (getValueByKey!267 (toList!1783 (getCurrentListMap!1311 (_keys!6439 thiss!1504) (_values!4350 thiss!1504) (mask!10329 thiss!1504) (extraKeys!4104 thiss!1504) (zeroValue!4208 thiss!1504) (minValue!4208 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4367 thiss!1504))) key!932)))))

(assert (= (and d!59257 c!39181) b!235134))

(assert (= (and d!59257 (not c!39181)) b!235135))

(assert (= (and d!59257 (not res!115308)) b!235136))

(declare-fun m!256351 () Bool)

(assert (=> d!59257 m!256351))

(declare-fun m!256353 () Bool)

(assert (=> b!235134 m!256353))

(declare-fun m!256355 () Bool)

(assert (=> b!235134 m!256355))

(assert (=> b!235134 m!256355))

(declare-fun m!256357 () Bool)

(assert (=> b!235134 m!256357))

(assert (=> b!235136 m!256355))

(assert (=> b!235136 m!256355))

(assert (=> b!235136 m!256357))

(assert (=> b!235077 d!59257))

(declare-fun b!235179 () Bool)

(declare-fun e!152749 () Bool)

(declare-fun e!152747 () Bool)

(assert (=> b!235179 (= e!152749 e!152747)))

(declare-fun c!39198 () Bool)

(assert (=> b!235179 (= c!39198 (not (= (bvand (extraKeys!4104 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!235180 () Bool)

(declare-fun e!152754 () ListLongMap!3535)

(declare-fun e!152744 () ListLongMap!3535)

(assert (=> b!235180 (= e!152754 e!152744)))

(declare-fun c!39199 () Bool)

(assert (=> b!235180 (= c!39199 (and (not (= (bvand (extraKeys!4104 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4104 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!235181 () Bool)

(declare-fun e!152746 () Bool)

(declare-fun lt!119007 () ListLongMap!3535)

(declare-fun apply!209 (ListLongMap!3535 (_ BitVec 64)) V!7891)

(assert (=> b!235181 (= e!152746 (= (apply!209 lt!119007 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4208 thiss!1504)))))

(declare-fun b!235182 () Bool)

(declare-fun e!152750 () Bool)

(declare-fun e!152753 () Bool)

(assert (=> b!235182 (= e!152750 e!152753)))

(declare-fun res!115327 () Bool)

(declare-fun call!21875 () Bool)

(assert (=> b!235182 (= res!115327 call!21875)))

(assert (=> b!235182 (=> (not res!115327) (not e!152753))))

(declare-fun b!235183 () Bool)

(declare-fun e!152755 () Unit!7250)

(declare-fun Unit!7253 () Unit!7250)

(assert (=> b!235183 (= e!152755 Unit!7253)))

(declare-fun bm!21867 () Bool)

(declare-fun call!21871 () ListLongMap!3535)

(declare-fun call!21874 () ListLongMap!3535)

(assert (=> bm!21867 (= call!21871 call!21874)))

(declare-fun bm!21868 () Bool)

(declare-fun call!21872 () Bool)

(assert (=> bm!21868 (= call!21872 (contains!1659 lt!119007 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!59259 () Bool)

(assert (=> d!59259 e!152749))

(declare-fun res!115334 () Bool)

(assert (=> d!59259 (=> (not res!115334) (not e!152749))))

(assert (=> d!59259 (= res!115334 (or (bvsge #b00000000000000000000000000000000 (size!5862 (_keys!6439 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5862 (_keys!6439 thiss!1504))))))))

(declare-fun lt!118999 () ListLongMap!3535)

(assert (=> d!59259 (= lt!119007 lt!118999)))

(declare-fun lt!118998 () Unit!7250)

(assert (=> d!59259 (= lt!118998 e!152755)))

(declare-fun c!39194 () Bool)

(declare-fun e!152743 () Bool)

(assert (=> d!59259 (= c!39194 e!152743)))

(declare-fun res!115335 () Bool)

(assert (=> d!59259 (=> (not res!115335) (not e!152743))))

(assert (=> d!59259 (= res!115335 (bvslt #b00000000000000000000000000000000 (size!5862 (_keys!6439 thiss!1504))))))

(assert (=> d!59259 (= lt!118999 e!152754)))

(declare-fun c!39195 () Bool)

(assert (=> d!59259 (= c!39195 (and (not (= (bvand (extraKeys!4104 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4104 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59259 (validMask!0 (mask!10329 thiss!1504))))

(assert (=> d!59259 (= (getCurrentListMap!1311 (_keys!6439 thiss!1504) (_values!4350 thiss!1504) (mask!10329 thiss!1504) (extraKeys!4104 thiss!1504) (zeroValue!4208 thiss!1504) (minValue!4208 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4367 thiss!1504)) lt!119007)))

(declare-fun bm!21869 () Bool)

(declare-fun call!21876 () ListLongMap!3535)

(assert (=> bm!21869 (= call!21874 call!21876)))

(declare-fun b!235184 () Bool)

(declare-fun e!152745 () ListLongMap!3535)

(declare-fun call!21870 () ListLongMap!3535)

(assert (=> b!235184 (= e!152745 call!21870)))

(declare-fun b!235185 () Bool)

(assert (=> b!235185 (= e!152750 (not call!21875))))

(declare-fun b!235186 () Bool)

(assert (=> b!235186 (= e!152747 e!152746)))

(declare-fun res!115329 () Bool)

(assert (=> b!235186 (= res!115329 call!21872)))

(assert (=> b!235186 (=> (not res!115329) (not e!152746))))

(declare-fun b!235187 () Bool)

(declare-fun e!152748 () Bool)

(declare-fun get!2840 (ValueCell!2748 V!7891) V!7891)

(declare-fun dynLambda!552 (Int (_ BitVec 64)) V!7891)

(assert (=> b!235187 (= e!152748 (= (apply!209 lt!119007 (select (arr!5525 (_keys!6439 thiss!1504)) #b00000000000000000000000000000000)) (get!2840 (select (arr!5524 (_values!4350 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!552 (defaultEntry!4367 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!235187 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5861 (_values!4350 thiss!1504))))))

(assert (=> b!235187 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5862 (_keys!6439 thiss!1504))))))

(declare-fun b!235188 () Bool)

(declare-fun lt!119003 () Unit!7250)

(assert (=> b!235188 (= e!152755 lt!119003)))

(declare-fun lt!119011 () ListLongMap!3535)

(declare-fun getCurrentListMapNoExtraKeys!531 (array!11623 array!11621 (_ BitVec 32) (_ BitVec 32) V!7891 V!7891 (_ BitVec 32) Int) ListLongMap!3535)

(assert (=> b!235188 (= lt!119011 (getCurrentListMapNoExtraKeys!531 (_keys!6439 thiss!1504) (_values!4350 thiss!1504) (mask!10329 thiss!1504) (extraKeys!4104 thiss!1504) (zeroValue!4208 thiss!1504) (minValue!4208 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4367 thiss!1504)))))

(declare-fun lt!118996 () (_ BitVec 64))

(assert (=> b!235188 (= lt!118996 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119008 () (_ BitVec 64))

(assert (=> b!235188 (= lt!119008 (select (arr!5525 (_keys!6439 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119001 () Unit!7250)

(declare-fun addStillContains!185 (ListLongMap!3535 (_ BitVec 64) V!7891 (_ BitVec 64)) Unit!7250)

(assert (=> b!235188 (= lt!119001 (addStillContains!185 lt!119011 lt!118996 (zeroValue!4208 thiss!1504) lt!119008))))

(declare-fun +!636 (ListLongMap!3535 tuple2!4622) ListLongMap!3535)

(assert (=> b!235188 (contains!1659 (+!636 lt!119011 (tuple2!4623 lt!118996 (zeroValue!4208 thiss!1504))) lt!119008)))

(declare-fun lt!119005 () Unit!7250)

(assert (=> b!235188 (= lt!119005 lt!119001)))

(declare-fun lt!119009 () ListLongMap!3535)

(assert (=> b!235188 (= lt!119009 (getCurrentListMapNoExtraKeys!531 (_keys!6439 thiss!1504) (_values!4350 thiss!1504) (mask!10329 thiss!1504) (extraKeys!4104 thiss!1504) (zeroValue!4208 thiss!1504) (minValue!4208 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4367 thiss!1504)))))

(declare-fun lt!119004 () (_ BitVec 64))

(assert (=> b!235188 (= lt!119004 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118997 () (_ BitVec 64))

(assert (=> b!235188 (= lt!118997 (select (arr!5525 (_keys!6439 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119014 () Unit!7250)

(declare-fun addApplyDifferent!185 (ListLongMap!3535 (_ BitVec 64) V!7891 (_ BitVec 64)) Unit!7250)

(assert (=> b!235188 (= lt!119014 (addApplyDifferent!185 lt!119009 lt!119004 (minValue!4208 thiss!1504) lt!118997))))

(assert (=> b!235188 (= (apply!209 (+!636 lt!119009 (tuple2!4623 lt!119004 (minValue!4208 thiss!1504))) lt!118997) (apply!209 lt!119009 lt!118997))))

(declare-fun lt!119010 () Unit!7250)

(assert (=> b!235188 (= lt!119010 lt!119014)))

(declare-fun lt!119006 () ListLongMap!3535)

(assert (=> b!235188 (= lt!119006 (getCurrentListMapNoExtraKeys!531 (_keys!6439 thiss!1504) (_values!4350 thiss!1504) (mask!10329 thiss!1504) (extraKeys!4104 thiss!1504) (zeroValue!4208 thiss!1504) (minValue!4208 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4367 thiss!1504)))))

(declare-fun lt!119000 () (_ BitVec 64))

(assert (=> b!235188 (= lt!119000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119017 () (_ BitVec 64))

(assert (=> b!235188 (= lt!119017 (select (arr!5525 (_keys!6439 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119016 () Unit!7250)

(assert (=> b!235188 (= lt!119016 (addApplyDifferent!185 lt!119006 lt!119000 (zeroValue!4208 thiss!1504) lt!119017))))

(assert (=> b!235188 (= (apply!209 (+!636 lt!119006 (tuple2!4623 lt!119000 (zeroValue!4208 thiss!1504))) lt!119017) (apply!209 lt!119006 lt!119017))))

(declare-fun lt!119013 () Unit!7250)

(assert (=> b!235188 (= lt!119013 lt!119016)))

(declare-fun lt!119012 () ListLongMap!3535)

(assert (=> b!235188 (= lt!119012 (getCurrentListMapNoExtraKeys!531 (_keys!6439 thiss!1504) (_values!4350 thiss!1504) (mask!10329 thiss!1504) (extraKeys!4104 thiss!1504) (zeroValue!4208 thiss!1504) (minValue!4208 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4367 thiss!1504)))))

(declare-fun lt!119015 () (_ BitVec 64))

(assert (=> b!235188 (= lt!119015 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119002 () (_ BitVec 64))

(assert (=> b!235188 (= lt!119002 (select (arr!5525 (_keys!6439 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235188 (= lt!119003 (addApplyDifferent!185 lt!119012 lt!119015 (minValue!4208 thiss!1504) lt!119002))))

(assert (=> b!235188 (= (apply!209 (+!636 lt!119012 (tuple2!4623 lt!119015 (minValue!4208 thiss!1504))) lt!119002) (apply!209 lt!119012 lt!119002))))

(declare-fun b!235189 () Bool)

(declare-fun e!152752 () Bool)

(assert (=> b!235189 (= e!152752 e!152748)))

(declare-fun res!115331 () Bool)

(assert (=> b!235189 (=> (not res!115331) (not e!152748))))

(assert (=> b!235189 (= res!115331 (contains!1659 lt!119007 (select (arr!5525 (_keys!6439 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!235189 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5862 (_keys!6439 thiss!1504))))))

(declare-fun b!235190 () Bool)

(assert (=> b!235190 (= e!152744 call!21870)))

(declare-fun b!235191 () Bool)

(declare-fun res!115330 () Bool)

(assert (=> b!235191 (=> (not res!115330) (not e!152749))))

(assert (=> b!235191 (= res!115330 e!152750)))

(declare-fun c!39197 () Bool)

(assert (=> b!235191 (= c!39197 (not (= (bvand (extraKeys!4104 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!235192 () Bool)

(assert (=> b!235192 (= e!152743 (validKeyInArray!0 (select (arr!5525 (_keys!6439 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235193 () Bool)

(assert (=> b!235193 (= e!152753 (= (apply!209 lt!119007 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4208 thiss!1504)))))

(declare-fun b!235194 () Bool)

(declare-fun res!115333 () Bool)

(assert (=> b!235194 (=> (not res!115333) (not e!152749))))

(assert (=> b!235194 (= res!115333 e!152752)))

(declare-fun res!115328 () Bool)

(assert (=> b!235194 (=> res!115328 e!152752)))

(declare-fun e!152751 () Bool)

(assert (=> b!235194 (= res!115328 (not e!152751))))

(declare-fun res!115332 () Bool)

(assert (=> b!235194 (=> (not res!115332) (not e!152751))))

(assert (=> b!235194 (= res!115332 (bvslt #b00000000000000000000000000000000 (size!5862 (_keys!6439 thiss!1504))))))

(declare-fun b!235195 () Bool)

(assert (=> b!235195 (= e!152747 (not call!21872))))

(declare-fun call!21873 () ListLongMap!3535)

(declare-fun bm!21870 () Bool)

(assert (=> bm!21870 (= call!21873 (+!636 (ite c!39195 call!21876 (ite c!39199 call!21874 call!21871)) (ite (or c!39195 c!39199) (tuple2!4623 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4208 thiss!1504)) (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4208 thiss!1504)))))))

(declare-fun b!235196 () Bool)

(assert (=> b!235196 (= e!152751 (validKeyInArray!0 (select (arr!5525 (_keys!6439 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21871 () Bool)

(assert (=> bm!21871 (= call!21876 (getCurrentListMapNoExtraKeys!531 (_keys!6439 thiss!1504) (_values!4350 thiss!1504) (mask!10329 thiss!1504) (extraKeys!4104 thiss!1504) (zeroValue!4208 thiss!1504) (minValue!4208 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4367 thiss!1504)))))

(declare-fun b!235197 () Bool)

(declare-fun c!39196 () Bool)

(assert (=> b!235197 (= c!39196 (and (not (= (bvand (extraKeys!4104 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4104 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!235197 (= e!152744 e!152745)))

(declare-fun b!235198 () Bool)

(assert (=> b!235198 (= e!152745 call!21871)))

(declare-fun b!235199 () Bool)

(assert (=> b!235199 (= e!152754 (+!636 call!21873 (tuple2!4623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4208 thiss!1504))))))

(declare-fun bm!21872 () Bool)

(assert (=> bm!21872 (= call!21870 call!21873)))

(declare-fun bm!21873 () Bool)

(assert (=> bm!21873 (= call!21875 (contains!1659 lt!119007 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59259 c!39195) b!235199))

(assert (= (and d!59259 (not c!39195)) b!235180))

(assert (= (and b!235180 c!39199) b!235190))

(assert (= (and b!235180 (not c!39199)) b!235197))

(assert (= (and b!235197 c!39196) b!235184))

(assert (= (and b!235197 (not c!39196)) b!235198))

(assert (= (or b!235184 b!235198) bm!21867))

(assert (= (or b!235190 bm!21867) bm!21869))

(assert (= (or b!235190 b!235184) bm!21872))

(assert (= (or b!235199 bm!21869) bm!21871))

(assert (= (or b!235199 bm!21872) bm!21870))

(assert (= (and d!59259 res!115335) b!235192))

(assert (= (and d!59259 c!39194) b!235188))

(assert (= (and d!59259 (not c!39194)) b!235183))

(assert (= (and d!59259 res!115334) b!235194))

(assert (= (and b!235194 res!115332) b!235196))

(assert (= (and b!235194 (not res!115328)) b!235189))

(assert (= (and b!235189 res!115331) b!235187))

(assert (= (and b!235194 res!115333) b!235191))

(assert (= (and b!235191 c!39197) b!235182))

(assert (= (and b!235191 (not c!39197)) b!235185))

(assert (= (and b!235182 res!115327) b!235193))

(assert (= (or b!235182 b!235185) bm!21873))

(assert (= (and b!235191 res!115330) b!235179))

(assert (= (and b!235179 c!39198) b!235186))

(assert (= (and b!235179 (not c!39198)) b!235195))

(assert (= (and b!235186 res!115329) b!235181))

(assert (= (or b!235186 b!235195) bm!21868))

(declare-fun b_lambda!7899 () Bool)

(assert (=> (not b_lambda!7899) (not b!235187)))

(declare-fun t!8503 () Bool)

(declare-fun tb!2931 () Bool)

(assert (=> (and b!235085 (= (defaultEntry!4367 thiss!1504) (defaultEntry!4367 thiss!1504)) t!8503) tb!2931))

(declare-fun result!5115 () Bool)

(assert (=> tb!2931 (= result!5115 tp_is_empty!6183)))

(assert (=> b!235187 t!8503))

(declare-fun b_and!13251 () Bool)

(assert (= b_and!13247 (and (=> t!8503 result!5115) b_and!13251)))

(declare-fun m!256359 () Bool)

(assert (=> bm!21870 m!256359))

(declare-fun m!256361 () Bool)

(assert (=> bm!21868 m!256361))

(assert (=> b!235196 m!256341))

(assert (=> b!235196 m!256341))

(assert (=> b!235196 m!256349))

(declare-fun m!256363 () Bool)

(assert (=> b!235187 m!256363))

(assert (=> b!235187 m!256363))

(declare-fun m!256365 () Bool)

(assert (=> b!235187 m!256365))

(declare-fun m!256367 () Bool)

(assert (=> b!235187 m!256367))

(assert (=> b!235187 m!256341))

(declare-fun m!256369 () Bool)

(assert (=> b!235187 m!256369))

(assert (=> b!235187 m!256341))

(assert (=> b!235187 m!256365))

(declare-fun m!256371 () Bool)

(assert (=> b!235199 m!256371))

(assert (=> d!59259 m!256309))

(assert (=> b!235189 m!256341))

(assert (=> b!235189 m!256341))

(declare-fun m!256373 () Bool)

(assert (=> b!235189 m!256373))

(declare-fun m!256375 () Bool)

(assert (=> b!235188 m!256375))

(declare-fun m!256377 () Bool)

(assert (=> b!235188 m!256377))

(declare-fun m!256379 () Bool)

(assert (=> b!235188 m!256379))

(declare-fun m!256381 () Bool)

(assert (=> b!235188 m!256381))

(declare-fun m!256383 () Bool)

(assert (=> b!235188 m!256383))

(declare-fun m!256385 () Bool)

(assert (=> b!235188 m!256385))

(assert (=> b!235188 m!256377))

(declare-fun m!256387 () Bool)

(assert (=> b!235188 m!256387))

(declare-fun m!256389 () Bool)

(assert (=> b!235188 m!256389))

(declare-fun m!256391 () Bool)

(assert (=> b!235188 m!256391))

(declare-fun m!256393 () Bool)

(assert (=> b!235188 m!256393))

(assert (=> b!235188 m!256341))

(declare-fun m!256395 () Bool)

(assert (=> b!235188 m!256395))

(assert (=> b!235188 m!256387))

(declare-fun m!256397 () Bool)

(assert (=> b!235188 m!256397))

(declare-fun m!256399 () Bool)

(assert (=> b!235188 m!256399))

(declare-fun m!256401 () Bool)

(assert (=> b!235188 m!256401))

(declare-fun m!256403 () Bool)

(assert (=> b!235188 m!256403))

(assert (=> b!235188 m!256391))

(declare-fun m!256405 () Bool)

(assert (=> b!235188 m!256405))

(assert (=> b!235188 m!256399))

(assert (=> b!235192 m!256341))

(assert (=> b!235192 m!256341))

(assert (=> b!235192 m!256349))

(declare-fun m!256407 () Bool)

(assert (=> bm!21873 m!256407))

(declare-fun m!256409 () Bool)

(assert (=> b!235181 m!256409))

(assert (=> bm!21871 m!256403))

(declare-fun m!256411 () Bool)

(assert (=> b!235193 m!256411))

(assert (=> b!235077 d!59259))

(declare-fun d!59261 () Bool)

(assert (=> d!59261 (= (array_inv!3641 (_keys!6439 thiss!1504)) (bvsge (size!5862 (_keys!6439 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235085 d!59261))

(declare-fun d!59263 () Bool)

(assert (=> d!59263 (= (array_inv!3642 (_values!4350 thiss!1504)) (bvsge (size!5861 (_values!4350 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235085 d!59263))

(declare-fun d!59265 () Bool)

(assert (=> d!59265 (= (validMask!0 (mask!10329 thiss!1504)) (and (or (= (mask!10329 thiss!1504) #b00000000000000000000000000000111) (= (mask!10329 thiss!1504) #b00000000000000000000000000001111) (= (mask!10329 thiss!1504) #b00000000000000000000000000011111) (= (mask!10329 thiss!1504) #b00000000000000000000000000111111) (= (mask!10329 thiss!1504) #b00000000000000000000000001111111) (= (mask!10329 thiss!1504) #b00000000000000000000000011111111) (= (mask!10329 thiss!1504) #b00000000000000000000000111111111) (= (mask!10329 thiss!1504) #b00000000000000000000001111111111) (= (mask!10329 thiss!1504) #b00000000000000000000011111111111) (= (mask!10329 thiss!1504) #b00000000000000000000111111111111) (= (mask!10329 thiss!1504) #b00000000000000000001111111111111) (= (mask!10329 thiss!1504) #b00000000000000000011111111111111) (= (mask!10329 thiss!1504) #b00000000000000000111111111111111) (= (mask!10329 thiss!1504) #b00000000000000001111111111111111) (= (mask!10329 thiss!1504) #b00000000000000011111111111111111) (= (mask!10329 thiss!1504) #b00000000000000111111111111111111) (= (mask!10329 thiss!1504) #b00000000000001111111111111111111) (= (mask!10329 thiss!1504) #b00000000000011111111111111111111) (= (mask!10329 thiss!1504) #b00000000000111111111111111111111) (= (mask!10329 thiss!1504) #b00000000001111111111111111111111) (= (mask!10329 thiss!1504) #b00000000011111111111111111111111) (= (mask!10329 thiss!1504) #b00000000111111111111111111111111) (= (mask!10329 thiss!1504) #b00000001111111111111111111111111) (= (mask!10329 thiss!1504) #b00000011111111111111111111111111) (= (mask!10329 thiss!1504) #b00000111111111111111111111111111) (= (mask!10329 thiss!1504) #b00001111111111111111111111111111) (= (mask!10329 thiss!1504) #b00011111111111111111111111111111) (= (mask!10329 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10329 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!235083 d!59265))

(declare-fun b!235214 () Bool)

(declare-fun c!39207 () Bool)

(declare-fun lt!119025 () (_ BitVec 64))

(assert (=> b!235214 (= c!39207 (= lt!119025 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!152763 () SeekEntryResult!984)

(declare-fun e!152762 () SeekEntryResult!984)

(assert (=> b!235214 (= e!152763 e!152762)))

(declare-fun b!235215 () Bool)

(declare-fun lt!119024 () SeekEntryResult!984)

(assert (=> b!235215 (= e!152763 (Found!984 (index!6108 lt!119024)))))

(declare-fun b!235217 () Bool)

(declare-fun e!152764 () SeekEntryResult!984)

(assert (=> b!235217 (= e!152764 Undefined!984)))

(declare-fun b!235218 () Bool)

(assert (=> b!235218 (= e!152762 (MissingZero!984 (index!6108 lt!119024)))))

(declare-fun b!235219 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11623 (_ BitVec 32)) SeekEntryResult!984)

(assert (=> b!235219 (= e!152762 (seekKeyOrZeroReturnVacant!0 (x!23752 lt!119024) (index!6108 lt!119024) (index!6108 lt!119024) key!932 (_keys!6439 thiss!1504) (mask!10329 thiss!1504)))))

(declare-fun b!235216 () Bool)

(assert (=> b!235216 (= e!152764 e!152763)))

(assert (=> b!235216 (= lt!119025 (select (arr!5525 (_keys!6439 thiss!1504)) (index!6108 lt!119024)))))

(declare-fun c!39208 () Bool)

(assert (=> b!235216 (= c!39208 (= lt!119025 key!932))))

(declare-fun d!59267 () Bool)

(declare-fun lt!119026 () SeekEntryResult!984)

(assert (=> d!59267 (and (or ((_ is Undefined!984) lt!119026) (not ((_ is Found!984) lt!119026)) (and (bvsge (index!6107 lt!119026) #b00000000000000000000000000000000) (bvslt (index!6107 lt!119026) (size!5862 (_keys!6439 thiss!1504))))) (or ((_ is Undefined!984) lt!119026) ((_ is Found!984) lt!119026) (not ((_ is MissingZero!984) lt!119026)) (and (bvsge (index!6106 lt!119026) #b00000000000000000000000000000000) (bvslt (index!6106 lt!119026) (size!5862 (_keys!6439 thiss!1504))))) (or ((_ is Undefined!984) lt!119026) ((_ is Found!984) lt!119026) ((_ is MissingZero!984) lt!119026) (not ((_ is MissingVacant!984) lt!119026)) (and (bvsge (index!6109 lt!119026) #b00000000000000000000000000000000) (bvslt (index!6109 lt!119026) (size!5862 (_keys!6439 thiss!1504))))) (or ((_ is Undefined!984) lt!119026) (ite ((_ is Found!984) lt!119026) (= (select (arr!5525 (_keys!6439 thiss!1504)) (index!6107 lt!119026)) key!932) (ite ((_ is MissingZero!984) lt!119026) (= (select (arr!5525 (_keys!6439 thiss!1504)) (index!6106 lt!119026)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!984) lt!119026) (= (select (arr!5525 (_keys!6439 thiss!1504)) (index!6109 lt!119026)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59267 (= lt!119026 e!152764)))

(declare-fun c!39206 () Bool)

(assert (=> d!59267 (= c!39206 (and ((_ is Intermediate!984) lt!119024) (undefined!1796 lt!119024)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11623 (_ BitVec 32)) SeekEntryResult!984)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59267 (= lt!119024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10329 thiss!1504)) key!932 (_keys!6439 thiss!1504) (mask!10329 thiss!1504)))))

(assert (=> d!59267 (validMask!0 (mask!10329 thiss!1504))))

(assert (=> d!59267 (= (seekEntryOrOpen!0 key!932 (_keys!6439 thiss!1504) (mask!10329 thiss!1504)) lt!119026)))

(assert (= (and d!59267 c!39206) b!235217))

(assert (= (and d!59267 (not c!39206)) b!235216))

(assert (= (and b!235216 c!39208) b!235215))

(assert (= (and b!235216 (not c!39208)) b!235214))

(assert (= (and b!235214 c!39207) b!235218))

(assert (= (and b!235214 (not c!39207)) b!235219))

(declare-fun m!256413 () Bool)

(assert (=> b!235219 m!256413))

(declare-fun m!256415 () Bool)

(assert (=> b!235216 m!256415))

(declare-fun m!256417 () Bool)

(assert (=> d!59267 m!256417))

(declare-fun m!256419 () Bool)

(assert (=> d!59267 m!256419))

(declare-fun m!256421 () Bool)

(assert (=> d!59267 m!256421))

(assert (=> d!59267 m!256309))

(declare-fun m!256423 () Bool)

(assert (=> d!59267 m!256423))

(assert (=> d!59267 m!256419))

(declare-fun m!256425 () Bool)

(assert (=> d!59267 m!256425))

(assert (=> b!235079 d!59267))

(declare-fun d!59269 () Bool)

(declare-fun res!115342 () Bool)

(declare-fun e!152767 () Bool)

(assert (=> d!59269 (=> (not res!115342) (not e!152767))))

(declare-fun simpleValid!232 (LongMapFixedSize!3396) Bool)

(assert (=> d!59269 (= res!115342 (simpleValid!232 thiss!1504))))

(assert (=> d!59269 (= (valid!1340 thiss!1504) e!152767)))

(declare-fun b!235226 () Bool)

(declare-fun res!115343 () Bool)

(assert (=> b!235226 (=> (not res!115343) (not e!152767))))

(declare-fun arrayCountValidKeys!0 (array!11623 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!235226 (= res!115343 (= (arrayCountValidKeys!0 (_keys!6439 thiss!1504) #b00000000000000000000000000000000 (size!5862 (_keys!6439 thiss!1504))) (_size!1747 thiss!1504)))))

(declare-fun b!235227 () Bool)

(declare-fun res!115344 () Bool)

(assert (=> b!235227 (=> (not res!115344) (not e!152767))))

(assert (=> b!235227 (= res!115344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6439 thiss!1504) (mask!10329 thiss!1504)))))

(declare-fun b!235228 () Bool)

(declare-datatypes ((List!3531 0))(
  ( (Nil!3528) (Cons!3527 (h!4179 (_ BitVec 64)) (t!8504 List!3531)) )
))
(declare-fun arrayNoDuplicates!0 (array!11623 (_ BitVec 32) List!3531) Bool)

(assert (=> b!235228 (= e!152767 (arrayNoDuplicates!0 (_keys!6439 thiss!1504) #b00000000000000000000000000000000 Nil!3528))))

(assert (= (and d!59269 res!115342) b!235226))

(assert (= (and b!235226 res!115343) b!235227))

(assert (= (and b!235227 res!115344) b!235228))

(declare-fun m!256427 () Bool)

(assert (=> d!59269 m!256427))

(declare-fun m!256429 () Bool)

(assert (=> b!235226 m!256429))

(assert (=> b!235227 m!256307))

(declare-fun m!256431 () Bool)

(assert (=> b!235228 m!256431))

(assert (=> start!22482 d!59269))

(declare-fun mapIsEmpty!10472 () Bool)

(declare-fun mapRes!10472 () Bool)

(assert (=> mapIsEmpty!10472 mapRes!10472))

(declare-fun mapNonEmpty!10472 () Bool)

(declare-fun tp!22136 () Bool)

(declare-fun e!152772 () Bool)

(assert (=> mapNonEmpty!10472 (= mapRes!10472 (and tp!22136 e!152772))))

(declare-fun mapRest!10472 () (Array (_ BitVec 32) ValueCell!2748))

(declare-fun mapValue!10472 () ValueCell!2748)

(declare-fun mapKey!10472 () (_ BitVec 32))

(assert (=> mapNonEmpty!10472 (= mapRest!10466 (store mapRest!10472 mapKey!10472 mapValue!10472))))

(declare-fun condMapEmpty!10472 () Bool)

(declare-fun mapDefault!10472 () ValueCell!2748)

(assert (=> mapNonEmpty!10466 (= condMapEmpty!10472 (= mapRest!10466 ((as const (Array (_ BitVec 32) ValueCell!2748)) mapDefault!10472)))))

(declare-fun e!152773 () Bool)

(assert (=> mapNonEmpty!10466 (= tp!22126 (and e!152773 mapRes!10472))))

(declare-fun b!235236 () Bool)

(assert (=> b!235236 (= e!152773 tp_is_empty!6183)))

(declare-fun b!235235 () Bool)

(assert (=> b!235235 (= e!152772 tp_is_empty!6183)))

(assert (= (and mapNonEmpty!10466 condMapEmpty!10472) mapIsEmpty!10472))

(assert (= (and mapNonEmpty!10466 (not condMapEmpty!10472)) mapNonEmpty!10472))

(assert (= (and mapNonEmpty!10472 ((_ is ValueCellFull!2748) mapValue!10472)) b!235235))

(assert (= (and mapNonEmpty!10466 ((_ is ValueCellFull!2748) mapDefault!10472)) b!235236))

(declare-fun m!256433 () Bool)

(assert (=> mapNonEmpty!10472 m!256433))

(declare-fun b_lambda!7901 () Bool)

(assert (= b_lambda!7899 (or (and b!235085 b_free!6321) b_lambda!7901)))

(check-sat (not b!235187) (not b!235227) (not b_next!6321) (not b_lambda!7901) (not bm!21870) (not b!235181) (not b!235226) (not b!235189) (not b!235188) (not d!59269) (not b!235127) (not b!235228) (not d!59257) (not b!235134) (not mapNonEmpty!10472) b_and!13251 (not b!235136) (not b!235192) (not bm!21868) (not bm!21871) (not b!235126) (not d!59267) (not b!235193) (not b!235196) (not bm!21873) (not b!235219) (not b!235199) tp_is_empty!6183 (not d!59259) (not bm!21852))
(check-sat b_and!13251 (not b_next!6321))
