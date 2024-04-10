; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22294 () Bool)

(assert start!22294)

(declare-fun b!233726 () Bool)

(declare-fun b_free!6297 () Bool)

(declare-fun b_next!6297 () Bool)

(assert (=> b!233726 (= b_free!6297 (not b_next!6297))))

(declare-fun tp!22039 () Bool)

(declare-fun b_and!13203 () Bool)

(assert (=> b!233726 (= tp!22039 b_and!13203)))

(declare-fun b!233723 () Bool)

(declare-fun e!151823 () Bool)

(declare-fun tp_is_empty!6159 () Bool)

(assert (=> b!233723 (= e!151823 tp_is_empty!6159)))

(declare-fun b!233724 () Bool)

(declare-fun res!114687 () Bool)

(declare-fun e!151827 () Bool)

(assert (=> b!233724 (=> (not res!114687) (not e!151827))))

(declare-datatypes ((V!7859 0))(
  ( (V!7860 (val!3124 Int)) )
))
(declare-datatypes ((ValueCell!2736 0))(
  ( (ValueCellFull!2736 (v!5146 V!7859)) (EmptyCell!2736) )
))
(declare-datatypes ((array!11565 0))(
  ( (array!11566 (arr!5500 (Array (_ BitVec 32) ValueCell!2736)) (size!5834 (_ BitVec 32))) )
))
(declare-datatypes ((array!11567 0))(
  ( (array!11568 (arr!5501 (Array (_ BitVec 32) (_ BitVec 64))) (size!5835 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3372 0))(
  ( (LongMapFixedSize!3373 (defaultEntry!4348 Int) (mask!10282 (_ BitVec 32)) (extraKeys!4085 (_ BitVec 32)) (zeroValue!4189 V!7859) (minValue!4189 V!7859) (_size!1735 (_ BitVec 32)) (_keys!6407 array!11567) (_values!4331 array!11565) (_vacant!1735 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3372)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!233724 (= res!114687 (validMask!0 (mask!10282 thiss!1504)))))

(declare-fun b!233725 () Bool)

(declare-fun e!151826 () Bool)

(declare-fun e!151822 () Bool)

(declare-fun mapRes!10415 () Bool)

(assert (=> b!233725 (= e!151826 (and e!151822 mapRes!10415))))

(declare-fun condMapEmpty!10415 () Bool)

(declare-fun mapDefault!10415 () ValueCell!2736)

(assert (=> b!233725 (= condMapEmpty!10415 (= (arr!5500 (_values!4331 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2736)) mapDefault!10415)))))

(declare-fun e!151824 () Bool)

(declare-fun array_inv!3625 (array!11567) Bool)

(declare-fun array_inv!3626 (array!11565) Bool)

(assert (=> b!233726 (= e!151824 (and tp!22039 tp_is_empty!6159 (array_inv!3625 (_keys!6407 thiss!1504)) (array_inv!3626 (_values!4331 thiss!1504)) e!151826))))

(declare-fun res!114690 () Bool)

(declare-fun e!151825 () Bool)

(assert (=> start!22294 (=> (not res!114690) (not e!151825))))

(declare-fun valid!1331 (LongMapFixedSize!3372) Bool)

(assert (=> start!22294 (= res!114690 (valid!1331 thiss!1504))))

(assert (=> start!22294 e!151825))

(assert (=> start!22294 e!151824))

(assert (=> start!22294 true))

(declare-fun mapNonEmpty!10415 () Bool)

(declare-fun tp!22040 () Bool)

(assert (=> mapNonEmpty!10415 (= mapRes!10415 (and tp!22040 e!151823))))

(declare-fun mapRest!10415 () (Array (_ BitVec 32) ValueCell!2736))

(declare-fun mapKey!10415 () (_ BitVec 32))

(declare-fun mapValue!10415 () ValueCell!2736)

(assert (=> mapNonEmpty!10415 (= (arr!5500 (_values!4331 thiss!1504)) (store mapRest!10415 mapKey!10415 mapValue!10415))))

(declare-fun mapIsEmpty!10415 () Bool)

(assert (=> mapIsEmpty!10415 mapRes!10415))

(declare-fun b!233727 () Bool)

(declare-fun res!114688 () Bool)

(assert (=> b!233727 (=> (not res!114688) (not e!151827))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4608 0))(
  ( (tuple2!4609 (_1!2315 (_ BitVec 64)) (_2!2315 V!7859)) )
))
(declare-datatypes ((List!3519 0))(
  ( (Nil!3516) (Cons!3515 (h!4164 tuple2!4608) (t!8482 List!3519)) )
))
(declare-datatypes ((ListLongMap!3521 0))(
  ( (ListLongMap!3522 (toList!1776 List!3519)) )
))
(declare-fun contains!1646 (ListLongMap!3521 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1304 (array!11567 array!11565 (_ BitVec 32) (_ BitVec 32) V!7859 V!7859 (_ BitVec 32) Int) ListLongMap!3521)

(assert (=> b!233727 (= res!114688 (contains!1646 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)) key!932))))

(declare-fun b!233728 () Bool)

(declare-fun res!114689 () Bool)

(assert (=> b!233728 (=> (not res!114689) (not e!151825))))

(assert (=> b!233728 (= res!114689 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!233729 () Bool)

(assert (=> b!233729 (= e!151827 (and (= (size!5834 (_values!4331 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10282 thiss!1504))) (not (= (size!5835 (_keys!6407 thiss!1504)) (size!5834 (_values!4331 thiss!1504))))))))

(declare-fun b!233730 () Bool)

(assert (=> b!233730 (= e!151822 tp_is_empty!6159)))

(declare-fun b!233731 () Bool)

(assert (=> b!233731 (= e!151825 e!151827)))

(declare-fun res!114686 () Bool)

(assert (=> b!233731 (=> (not res!114686) (not e!151827))))

(declare-datatypes ((SeekEntryResult!977 0))(
  ( (MissingZero!977 (index!6078 (_ BitVec 32))) (Found!977 (index!6079 (_ BitVec 32))) (Intermediate!977 (undefined!1789 Bool) (index!6080 (_ BitVec 32)) (x!23649 (_ BitVec 32))) (Undefined!977) (MissingVacant!977 (index!6081 (_ BitVec 32))) )
))
(declare-fun lt!118213 () SeekEntryResult!977)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!233731 (= res!114686 (or (= lt!118213 (MissingZero!977 index!297)) (= lt!118213 (MissingVacant!977 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11567 (_ BitVec 32)) SeekEntryResult!977)

(assert (=> b!233731 (= lt!118213 (seekEntryOrOpen!0 key!932 (_keys!6407 thiss!1504) (mask!10282 thiss!1504)))))

(assert (= (and start!22294 res!114690) b!233728))

(assert (= (and b!233728 res!114689) b!233731))

(assert (= (and b!233731 res!114686) b!233727))

(assert (= (and b!233727 res!114688) b!233724))

(assert (= (and b!233724 res!114687) b!233729))

(assert (= (and b!233725 condMapEmpty!10415) mapIsEmpty!10415))

(assert (= (and b!233725 (not condMapEmpty!10415)) mapNonEmpty!10415))

(get-info :version)

(assert (= (and mapNonEmpty!10415 ((_ is ValueCellFull!2736) mapValue!10415)) b!233723))

(assert (= (and b!233725 ((_ is ValueCellFull!2736) mapDefault!10415)) b!233730))

(assert (= b!233726 b!233725))

(assert (= start!22294 b!233726))

(declare-fun m!255095 () Bool)

(assert (=> b!233731 m!255095))

(declare-fun m!255097 () Bool)

(assert (=> mapNonEmpty!10415 m!255097))

(declare-fun m!255099 () Bool)

(assert (=> b!233724 m!255099))

(declare-fun m!255101 () Bool)

(assert (=> start!22294 m!255101))

(declare-fun m!255103 () Bool)

(assert (=> b!233726 m!255103))

(declare-fun m!255105 () Bool)

(assert (=> b!233726 m!255105))

(declare-fun m!255107 () Bool)

(assert (=> b!233727 m!255107))

(assert (=> b!233727 m!255107))

(declare-fun m!255109 () Bool)

(assert (=> b!233727 m!255109))

(check-sat (not b!233731) (not start!22294) (not b!233727) (not mapNonEmpty!10415) (not b!233726) (not b_next!6297) (not b!233724) tp_is_empty!6159 b_and!13203)
(check-sat b_and!13203 (not b_next!6297))
(get-model)

(declare-fun d!58969 () Bool)

(assert (=> d!58969 (= (array_inv!3625 (_keys!6407 thiss!1504)) (bvsge (size!5835 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233726 d!58969))

(declare-fun d!58971 () Bool)

(assert (=> d!58971 (= (array_inv!3626 (_values!4331 thiss!1504)) (bvsge (size!5834 (_values!4331 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233726 d!58971))

(declare-fun d!58973 () Bool)

(declare-fun res!114712 () Bool)

(declare-fun e!151852 () Bool)

(assert (=> d!58973 (=> (not res!114712) (not e!151852))))

(declare-fun simpleValid!228 (LongMapFixedSize!3372) Bool)

(assert (=> d!58973 (= res!114712 (simpleValid!228 thiss!1504))))

(assert (=> d!58973 (= (valid!1331 thiss!1504) e!151852)))

(declare-fun b!233765 () Bool)

(declare-fun res!114713 () Bool)

(assert (=> b!233765 (=> (not res!114713) (not e!151852))))

(declare-fun arrayCountValidKeys!0 (array!11567 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!233765 (= res!114713 (= (arrayCountValidKeys!0 (_keys!6407 thiss!1504) #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))) (_size!1735 thiss!1504)))))

(declare-fun b!233766 () Bool)

(declare-fun res!114714 () Bool)

(assert (=> b!233766 (=> (not res!114714) (not e!151852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11567 (_ BitVec 32)) Bool)

(assert (=> b!233766 (= res!114714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6407 thiss!1504) (mask!10282 thiss!1504)))))

(declare-fun b!233767 () Bool)

(declare-datatypes ((List!3520 0))(
  ( (Nil!3517) (Cons!3516 (h!4165 (_ BitVec 64)) (t!8485 List!3520)) )
))
(declare-fun arrayNoDuplicates!0 (array!11567 (_ BitVec 32) List!3520) Bool)

(assert (=> b!233767 (= e!151852 (arrayNoDuplicates!0 (_keys!6407 thiss!1504) #b00000000000000000000000000000000 Nil!3517))))

(assert (= (and d!58973 res!114712) b!233765))

(assert (= (and b!233765 res!114713) b!233766))

(assert (= (and b!233766 res!114714) b!233767))

(declare-fun m!255127 () Bool)

(assert (=> d!58973 m!255127))

(declare-fun m!255129 () Bool)

(assert (=> b!233765 m!255129))

(declare-fun m!255131 () Bool)

(assert (=> b!233766 m!255131))

(declare-fun m!255133 () Bool)

(assert (=> b!233767 m!255133))

(assert (=> start!22294 d!58973))

(declare-fun d!58975 () Bool)

(declare-fun e!151857 () Bool)

(assert (=> d!58975 e!151857))

(declare-fun res!114717 () Bool)

(assert (=> d!58975 (=> res!114717 e!151857)))

(declare-fun lt!118228 () Bool)

(assert (=> d!58975 (= res!114717 (not lt!118228))))

(declare-fun lt!118226 () Bool)

(assert (=> d!58975 (= lt!118228 lt!118226)))

(declare-datatypes ((Unit!7222 0))(
  ( (Unit!7223) )
))
(declare-fun lt!118225 () Unit!7222)

(declare-fun e!151858 () Unit!7222)

(assert (=> d!58975 (= lt!118225 e!151858)))

(declare-fun c!38893 () Bool)

(assert (=> d!58975 (= c!38893 lt!118226)))

(declare-fun containsKey!255 (List!3519 (_ BitVec 64)) Bool)

(assert (=> d!58975 (= lt!118226 (containsKey!255 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))) key!932))))

(assert (=> d!58975 (= (contains!1646 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)) key!932) lt!118228)))

(declare-fun b!233774 () Bool)

(declare-fun lt!118227 () Unit!7222)

(assert (=> b!233774 (= e!151858 lt!118227)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!203 (List!3519 (_ BitVec 64)) Unit!7222)

(assert (=> b!233774 (= lt!118227 (lemmaContainsKeyImpliesGetValueByKeyDefined!203 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))) key!932))))

(declare-datatypes ((Option!269 0))(
  ( (Some!268 (v!5148 V!7859)) (None!267) )
))
(declare-fun isDefined!204 (Option!269) Bool)

(declare-fun getValueByKey!263 (List!3519 (_ BitVec 64)) Option!269)

(assert (=> b!233774 (isDefined!204 (getValueByKey!263 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))) key!932))))

(declare-fun b!233775 () Bool)

(declare-fun Unit!7224 () Unit!7222)

(assert (=> b!233775 (= e!151858 Unit!7224)))

(declare-fun b!233776 () Bool)

(assert (=> b!233776 (= e!151857 (isDefined!204 (getValueByKey!263 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))) key!932)))))

(assert (= (and d!58975 c!38893) b!233774))

(assert (= (and d!58975 (not c!38893)) b!233775))

(assert (= (and d!58975 (not res!114717)) b!233776))

(declare-fun m!255135 () Bool)

(assert (=> d!58975 m!255135))

(declare-fun m!255137 () Bool)

(assert (=> b!233774 m!255137))

(declare-fun m!255139 () Bool)

(assert (=> b!233774 m!255139))

(assert (=> b!233774 m!255139))

(declare-fun m!255141 () Bool)

(assert (=> b!233774 m!255141))

(assert (=> b!233776 m!255139))

(assert (=> b!233776 m!255139))

(assert (=> b!233776 m!255141))

(assert (=> b!233727 d!58975))

(declare-fun b!233819 () Bool)

(declare-fun res!114743 () Bool)

(declare-fun e!151889 () Bool)

(assert (=> b!233819 (=> (not res!114743) (not e!151889))))

(declare-fun e!151895 () Bool)

(assert (=> b!233819 (= res!114743 e!151895)))

(declare-fun c!38909 () Bool)

(assert (=> b!233819 (= c!38909 (not (= (bvand (extraKeys!4085 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!233820 () Bool)

(declare-fun call!21748 () Bool)

(assert (=> b!233820 (= e!151895 (not call!21748))))

(declare-fun call!21752 () ListLongMap!3521)

(declare-fun c!38910 () Bool)

(declare-fun bm!21744 () Bool)

(declare-fun call!21751 () ListLongMap!3521)

(declare-fun call!21753 () ListLongMap!3521)

(declare-fun call!21747 () ListLongMap!3521)

(declare-fun c!38911 () Bool)

(declare-fun +!632 (ListLongMap!3521 tuple2!4608) ListLongMap!3521)

(assert (=> bm!21744 (= call!21751 (+!632 (ite c!38911 call!21747 (ite c!38910 call!21752 call!21753)) (ite (or c!38911 c!38910) (tuple2!4609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4189 thiss!1504)) (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504)))))))

(declare-fun b!233821 () Bool)

(declare-fun e!151886 () Bool)

(declare-fun lt!118289 () ListLongMap!3521)

(declare-fun apply!205 (ListLongMap!3521 (_ BitVec 64)) V!7859)

(assert (=> b!233821 (= e!151886 (= (apply!205 lt!118289 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4189 thiss!1504)))))

(declare-fun b!233822 () Bool)

(declare-fun e!151897 () Bool)

(assert (=> b!233822 (= e!151895 e!151897)))

(declare-fun res!114739 () Bool)

(assert (=> b!233822 (= res!114739 call!21748)))

(assert (=> b!233822 (=> (not res!114739) (not e!151897))))

(declare-fun b!233823 () Bool)

(declare-fun e!151896 () Unit!7222)

(declare-fun Unit!7225 () Unit!7222)

(assert (=> b!233823 (= e!151896 Unit!7225)))

(declare-fun bm!21745 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!527 (array!11567 array!11565 (_ BitVec 32) (_ BitVec 32) V!7859 V!7859 (_ BitVec 32) Int) ListLongMap!3521)

(assert (=> bm!21745 (= call!21747 (getCurrentListMapNoExtraKeys!527 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)))))

(declare-fun b!233824 () Bool)

(declare-fun lt!118286 () Unit!7222)

(assert (=> b!233824 (= e!151896 lt!118286)))

(declare-fun lt!118280 () ListLongMap!3521)

(assert (=> b!233824 (= lt!118280 (getCurrentListMapNoExtraKeys!527 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)))))

(declare-fun lt!118291 () (_ BitVec 64))

(assert (=> b!233824 (= lt!118291 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118293 () (_ BitVec 64))

(assert (=> b!233824 (= lt!118293 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118287 () Unit!7222)

(declare-fun addStillContains!181 (ListLongMap!3521 (_ BitVec 64) V!7859 (_ BitVec 64)) Unit!7222)

(assert (=> b!233824 (= lt!118287 (addStillContains!181 lt!118280 lt!118291 (zeroValue!4189 thiss!1504) lt!118293))))

(assert (=> b!233824 (contains!1646 (+!632 lt!118280 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504))) lt!118293)))

(declare-fun lt!118273 () Unit!7222)

(assert (=> b!233824 (= lt!118273 lt!118287)))

(declare-fun lt!118279 () ListLongMap!3521)

(assert (=> b!233824 (= lt!118279 (getCurrentListMapNoExtraKeys!527 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)))))

(declare-fun lt!118294 () (_ BitVec 64))

(assert (=> b!233824 (= lt!118294 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118281 () (_ BitVec 64))

(assert (=> b!233824 (= lt!118281 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118276 () Unit!7222)

(declare-fun addApplyDifferent!181 (ListLongMap!3521 (_ BitVec 64) V!7859 (_ BitVec 64)) Unit!7222)

(assert (=> b!233824 (= lt!118276 (addApplyDifferent!181 lt!118279 lt!118294 (minValue!4189 thiss!1504) lt!118281))))

(assert (=> b!233824 (= (apply!205 (+!632 lt!118279 (tuple2!4609 lt!118294 (minValue!4189 thiss!1504))) lt!118281) (apply!205 lt!118279 lt!118281))))

(declare-fun lt!118274 () Unit!7222)

(assert (=> b!233824 (= lt!118274 lt!118276)))

(declare-fun lt!118282 () ListLongMap!3521)

(assert (=> b!233824 (= lt!118282 (getCurrentListMapNoExtraKeys!527 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)))))

(declare-fun lt!118283 () (_ BitVec 64))

(assert (=> b!233824 (= lt!118283 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118277 () (_ BitVec 64))

(assert (=> b!233824 (= lt!118277 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118285 () Unit!7222)

(assert (=> b!233824 (= lt!118285 (addApplyDifferent!181 lt!118282 lt!118283 (zeroValue!4189 thiss!1504) lt!118277))))

(assert (=> b!233824 (= (apply!205 (+!632 lt!118282 (tuple2!4609 lt!118283 (zeroValue!4189 thiss!1504))) lt!118277) (apply!205 lt!118282 lt!118277))))

(declare-fun lt!118275 () Unit!7222)

(assert (=> b!233824 (= lt!118275 lt!118285)))

(declare-fun lt!118290 () ListLongMap!3521)

(assert (=> b!233824 (= lt!118290 (getCurrentListMapNoExtraKeys!527 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)))))

(declare-fun lt!118288 () (_ BitVec 64))

(assert (=> b!233824 (= lt!118288 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118278 () (_ BitVec 64))

(assert (=> b!233824 (= lt!118278 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233824 (= lt!118286 (addApplyDifferent!181 lt!118290 lt!118288 (minValue!4189 thiss!1504) lt!118278))))

(assert (=> b!233824 (= (apply!205 (+!632 lt!118290 (tuple2!4609 lt!118288 (minValue!4189 thiss!1504))) lt!118278) (apply!205 lt!118290 lt!118278))))

(declare-fun b!233825 () Bool)

(declare-fun c!38906 () Bool)

(assert (=> b!233825 (= c!38906 (and (not (= (bvand (extraKeys!4085 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4085 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!151888 () ListLongMap!3521)

(declare-fun e!151885 () ListLongMap!3521)

(assert (=> b!233825 (= e!151888 e!151885)))

(declare-fun b!233826 () Bool)

(declare-fun call!21749 () ListLongMap!3521)

(assert (=> b!233826 (= e!151885 call!21749)))

(declare-fun b!233827 () Bool)

(assert (=> b!233827 (= e!151888 call!21749)))

(declare-fun bm!21746 () Bool)

(assert (=> bm!21746 (= call!21752 call!21747)))

(declare-fun b!233828 () Bool)

(declare-fun e!151894 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!233828 (= e!151894 (validKeyInArray!0 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233829 () Bool)

(declare-fun e!151893 () Bool)

(assert (=> b!233829 (= e!151889 e!151893)))

(declare-fun c!38907 () Bool)

(assert (=> b!233829 (= c!38907 (not (= (bvand (extraKeys!4085 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21747 () Bool)

(declare-fun call!21750 () Bool)

(assert (=> bm!21747 (= call!21750 (contains!1646 lt!118289 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233830 () Bool)

(assert (=> b!233830 (= e!151885 call!21753)))

(declare-fun d!58977 () Bool)

(assert (=> d!58977 e!151889))

(declare-fun res!114741 () Bool)

(assert (=> d!58977 (=> (not res!114741) (not e!151889))))

(assert (=> d!58977 (= res!114741 (or (bvsge #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))))))))

(declare-fun lt!118292 () ListLongMap!3521)

(assert (=> d!58977 (= lt!118289 lt!118292)))

(declare-fun lt!118284 () Unit!7222)

(assert (=> d!58977 (= lt!118284 e!151896)))

(declare-fun c!38908 () Bool)

(assert (=> d!58977 (= c!38908 e!151894)))

(declare-fun res!114740 () Bool)

(assert (=> d!58977 (=> (not res!114740) (not e!151894))))

(assert (=> d!58977 (= res!114740 (bvslt #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))))))

(declare-fun e!151887 () ListLongMap!3521)

(assert (=> d!58977 (= lt!118292 e!151887)))

(assert (=> d!58977 (= c!38911 (and (not (= (bvand (extraKeys!4085 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4085 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58977 (validMask!0 (mask!10282 thiss!1504))))

(assert (=> d!58977 (= (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)) lt!118289)))

(declare-fun b!233831 () Bool)

(declare-fun res!114737 () Bool)

(assert (=> b!233831 (=> (not res!114737) (not e!151889))))

(declare-fun e!151891 () Bool)

(assert (=> b!233831 (= res!114737 e!151891)))

(declare-fun res!114736 () Bool)

(assert (=> b!233831 (=> res!114736 e!151891)))

(declare-fun e!151890 () Bool)

(assert (=> b!233831 (= res!114736 (not e!151890))))

(declare-fun res!114744 () Bool)

(assert (=> b!233831 (=> (not res!114744) (not e!151890))))

(assert (=> b!233831 (= res!114744 (bvslt #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))))))

(declare-fun b!233832 () Bool)

(declare-fun e!151892 () Bool)

(assert (=> b!233832 (= e!151891 e!151892)))

(declare-fun res!114738 () Bool)

(assert (=> b!233832 (=> (not res!114738) (not e!151892))))

(assert (=> b!233832 (= res!114738 (contains!1646 lt!118289 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233832 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))))))

(declare-fun b!233833 () Bool)

(assert (=> b!233833 (= e!151893 e!151886)))

(declare-fun res!114742 () Bool)

(assert (=> b!233833 (= res!114742 call!21750)))

(assert (=> b!233833 (=> (not res!114742) (not e!151886))))

(declare-fun b!233834 () Bool)

(assert (=> b!233834 (= e!151890 (validKeyInArray!0 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21748 () Bool)

(assert (=> bm!21748 (= call!21749 call!21751)))

(declare-fun b!233835 () Bool)

(assert (=> b!233835 (= e!151893 (not call!21750))))

(declare-fun b!233836 () Bool)

(declare-fun get!2819 (ValueCell!2736 V!7859) V!7859)

(declare-fun dynLambda!548 (Int (_ BitVec 64)) V!7859)

(assert (=> b!233836 (= e!151892 (= (apply!205 lt!118289 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)) (get!2819 (select (arr!5500 (_values!4331 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4348 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!233836 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5834 (_values!4331 thiss!1504))))))

(assert (=> b!233836 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))))))

(declare-fun b!233837 () Bool)

(assert (=> b!233837 (= e!151897 (= (apply!205 lt!118289 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4189 thiss!1504)))))

(declare-fun bm!21749 () Bool)

(assert (=> bm!21749 (= call!21748 (contains!1646 lt!118289 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233838 () Bool)

(assert (=> b!233838 (= e!151887 (+!632 call!21751 (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504))))))

(declare-fun bm!21750 () Bool)

(assert (=> bm!21750 (= call!21753 call!21752)))

(declare-fun b!233839 () Bool)

(assert (=> b!233839 (= e!151887 e!151888)))

(assert (=> b!233839 (= c!38910 (and (not (= (bvand (extraKeys!4085 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4085 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!58977 c!38911) b!233838))

(assert (= (and d!58977 (not c!38911)) b!233839))

(assert (= (and b!233839 c!38910) b!233827))

(assert (= (and b!233839 (not c!38910)) b!233825))

(assert (= (and b!233825 c!38906) b!233826))

(assert (= (and b!233825 (not c!38906)) b!233830))

(assert (= (or b!233826 b!233830) bm!21750))

(assert (= (or b!233827 bm!21750) bm!21746))

(assert (= (or b!233827 b!233826) bm!21748))

(assert (= (or b!233838 bm!21746) bm!21745))

(assert (= (or b!233838 bm!21748) bm!21744))

(assert (= (and d!58977 res!114740) b!233828))

(assert (= (and d!58977 c!38908) b!233824))

(assert (= (and d!58977 (not c!38908)) b!233823))

(assert (= (and d!58977 res!114741) b!233831))

(assert (= (and b!233831 res!114744) b!233834))

(assert (= (and b!233831 (not res!114736)) b!233832))

(assert (= (and b!233832 res!114738) b!233836))

(assert (= (and b!233831 res!114737) b!233819))

(assert (= (and b!233819 c!38909) b!233822))

(assert (= (and b!233819 (not c!38909)) b!233820))

(assert (= (and b!233822 res!114739) b!233837))

(assert (= (or b!233822 b!233820) bm!21749))

(assert (= (and b!233819 res!114743) b!233829))

(assert (= (and b!233829 c!38907) b!233833))

(assert (= (and b!233829 (not c!38907)) b!233835))

(assert (= (and b!233833 res!114742) b!233821))

(assert (= (or b!233833 b!233835) bm!21747))

(declare-fun b_lambda!7859 () Bool)

(assert (=> (not b_lambda!7859) (not b!233836)))

(declare-fun t!8484 () Bool)

(declare-fun tb!2923 () Bool)

(assert (=> (and b!233726 (= (defaultEntry!4348 thiss!1504) (defaultEntry!4348 thiss!1504)) t!8484) tb!2923))

(declare-fun result!5091 () Bool)

(assert (=> tb!2923 (= result!5091 tp_is_empty!6159)))

(assert (=> b!233836 t!8484))

(declare-fun b_and!13207 () Bool)

(assert (= b_and!13203 (and (=> t!8484 result!5091) b_and!13207)))

(declare-fun m!255143 () Bool)

(assert (=> bm!21744 m!255143))

(declare-fun m!255145 () Bool)

(assert (=> b!233836 m!255145))

(declare-fun m!255147 () Bool)

(assert (=> b!233836 m!255147))

(declare-fun m!255149 () Bool)

(assert (=> b!233836 m!255149))

(declare-fun m!255151 () Bool)

(assert (=> b!233836 m!255151))

(assert (=> b!233836 m!255149))

(declare-fun m!255153 () Bool)

(assert (=> b!233836 m!255153))

(assert (=> b!233836 m!255151))

(assert (=> b!233836 m!255145))

(declare-fun m!255155 () Bool)

(assert (=> bm!21749 m!255155))

(assert (=> b!233832 m!255145))

(assert (=> b!233832 m!255145))

(declare-fun m!255157 () Bool)

(assert (=> b!233832 m!255157))

(assert (=> b!233834 m!255145))

(assert (=> b!233834 m!255145))

(declare-fun m!255159 () Bool)

(assert (=> b!233834 m!255159))

(declare-fun m!255161 () Bool)

(assert (=> b!233824 m!255161))

(declare-fun m!255163 () Bool)

(assert (=> b!233824 m!255163))

(declare-fun m!255165 () Bool)

(assert (=> b!233824 m!255165))

(declare-fun m!255167 () Bool)

(assert (=> b!233824 m!255167))

(declare-fun m!255169 () Bool)

(assert (=> b!233824 m!255169))

(assert (=> b!233824 m!255167))

(declare-fun m!255171 () Bool)

(assert (=> b!233824 m!255171))

(assert (=> b!233824 m!255169))

(declare-fun m!255173 () Bool)

(assert (=> b!233824 m!255173))

(declare-fun m!255175 () Bool)

(assert (=> b!233824 m!255175))

(assert (=> b!233824 m!255163))

(declare-fun m!255177 () Bool)

(assert (=> b!233824 m!255177))

(declare-fun m!255179 () Bool)

(assert (=> b!233824 m!255179))

(declare-fun m!255181 () Bool)

(assert (=> b!233824 m!255181))

(declare-fun m!255183 () Bool)

(assert (=> b!233824 m!255183))

(declare-fun m!255185 () Bool)

(assert (=> b!233824 m!255185))

(declare-fun m!255187 () Bool)

(assert (=> b!233824 m!255187))

(declare-fun m!255189 () Bool)

(assert (=> b!233824 m!255189))

(declare-fun m!255191 () Bool)

(assert (=> b!233824 m!255191))

(assert (=> b!233824 m!255179))

(assert (=> b!233824 m!255145))

(assert (=> b!233828 m!255145))

(assert (=> b!233828 m!255145))

(assert (=> b!233828 m!255159))

(assert (=> bm!21745 m!255189))

(declare-fun m!255193 () Bool)

(assert (=> b!233821 m!255193))

(assert (=> d!58977 m!255099))

(declare-fun m!255195 () Bool)

(assert (=> b!233838 m!255195))

(declare-fun m!255197 () Bool)

(assert (=> bm!21747 m!255197))

(declare-fun m!255199 () Bool)

(assert (=> b!233837 m!255199))

(assert (=> b!233727 d!58977))

(declare-fun d!58979 () Bool)

(assert (=> d!58979 (= (validMask!0 (mask!10282 thiss!1504)) (and (or (= (mask!10282 thiss!1504) #b00000000000000000000000000000111) (= (mask!10282 thiss!1504) #b00000000000000000000000000001111) (= (mask!10282 thiss!1504) #b00000000000000000000000000011111) (= (mask!10282 thiss!1504) #b00000000000000000000000000111111) (= (mask!10282 thiss!1504) #b00000000000000000000000001111111) (= (mask!10282 thiss!1504) #b00000000000000000000000011111111) (= (mask!10282 thiss!1504) #b00000000000000000000000111111111) (= (mask!10282 thiss!1504) #b00000000000000000000001111111111) (= (mask!10282 thiss!1504) #b00000000000000000000011111111111) (= (mask!10282 thiss!1504) #b00000000000000000000111111111111) (= (mask!10282 thiss!1504) #b00000000000000000001111111111111) (= (mask!10282 thiss!1504) #b00000000000000000011111111111111) (= (mask!10282 thiss!1504) #b00000000000000000111111111111111) (= (mask!10282 thiss!1504) #b00000000000000001111111111111111) (= (mask!10282 thiss!1504) #b00000000000000011111111111111111) (= (mask!10282 thiss!1504) #b00000000000000111111111111111111) (= (mask!10282 thiss!1504) #b00000000000001111111111111111111) (= (mask!10282 thiss!1504) #b00000000000011111111111111111111) (= (mask!10282 thiss!1504) #b00000000000111111111111111111111) (= (mask!10282 thiss!1504) #b00000000001111111111111111111111) (= (mask!10282 thiss!1504) #b00000000011111111111111111111111) (= (mask!10282 thiss!1504) #b00000000111111111111111111111111) (= (mask!10282 thiss!1504) #b00000001111111111111111111111111) (= (mask!10282 thiss!1504) #b00000011111111111111111111111111) (= (mask!10282 thiss!1504) #b00000111111111111111111111111111) (= (mask!10282 thiss!1504) #b00001111111111111111111111111111) (= (mask!10282 thiss!1504) #b00011111111111111111111111111111) (= (mask!10282 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10282 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!233724 d!58979))

(declare-fun d!58981 () Bool)

(declare-fun lt!118301 () SeekEntryResult!977)

(assert (=> d!58981 (and (or ((_ is Undefined!977) lt!118301) (not ((_ is Found!977) lt!118301)) (and (bvsge (index!6079 lt!118301) #b00000000000000000000000000000000) (bvslt (index!6079 lt!118301) (size!5835 (_keys!6407 thiss!1504))))) (or ((_ is Undefined!977) lt!118301) ((_ is Found!977) lt!118301) (not ((_ is MissingZero!977) lt!118301)) (and (bvsge (index!6078 lt!118301) #b00000000000000000000000000000000) (bvslt (index!6078 lt!118301) (size!5835 (_keys!6407 thiss!1504))))) (or ((_ is Undefined!977) lt!118301) ((_ is Found!977) lt!118301) ((_ is MissingZero!977) lt!118301) (not ((_ is MissingVacant!977) lt!118301)) (and (bvsge (index!6081 lt!118301) #b00000000000000000000000000000000) (bvslt (index!6081 lt!118301) (size!5835 (_keys!6407 thiss!1504))))) (or ((_ is Undefined!977) lt!118301) (ite ((_ is Found!977) lt!118301) (= (select (arr!5501 (_keys!6407 thiss!1504)) (index!6079 lt!118301)) key!932) (ite ((_ is MissingZero!977) lt!118301) (= (select (arr!5501 (_keys!6407 thiss!1504)) (index!6078 lt!118301)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!977) lt!118301) (= (select (arr!5501 (_keys!6407 thiss!1504)) (index!6081 lt!118301)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!151906 () SeekEntryResult!977)

(assert (=> d!58981 (= lt!118301 e!151906)))

(declare-fun c!38918 () Bool)

(declare-fun lt!118303 () SeekEntryResult!977)

(assert (=> d!58981 (= c!38918 (and ((_ is Intermediate!977) lt!118303) (undefined!1789 lt!118303)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11567 (_ BitVec 32)) SeekEntryResult!977)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58981 (= lt!118303 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10282 thiss!1504)) key!932 (_keys!6407 thiss!1504) (mask!10282 thiss!1504)))))

(assert (=> d!58981 (validMask!0 (mask!10282 thiss!1504))))

(assert (=> d!58981 (= (seekEntryOrOpen!0 key!932 (_keys!6407 thiss!1504) (mask!10282 thiss!1504)) lt!118301)))

(declare-fun b!233854 () Bool)

(declare-fun c!38920 () Bool)

(declare-fun lt!118302 () (_ BitVec 64))

(assert (=> b!233854 (= c!38920 (= lt!118302 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!151905 () SeekEntryResult!977)

(declare-fun e!151904 () SeekEntryResult!977)

(assert (=> b!233854 (= e!151905 e!151904)))

(declare-fun b!233855 () Bool)

(assert (=> b!233855 (= e!151904 (MissingZero!977 (index!6080 lt!118303)))))

(declare-fun b!233856 () Bool)

(assert (=> b!233856 (= e!151905 (Found!977 (index!6080 lt!118303)))))

(declare-fun b!233857 () Bool)

(assert (=> b!233857 (= e!151906 Undefined!977)))

(declare-fun b!233858 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11567 (_ BitVec 32)) SeekEntryResult!977)

(assert (=> b!233858 (= e!151904 (seekKeyOrZeroReturnVacant!0 (x!23649 lt!118303) (index!6080 lt!118303) (index!6080 lt!118303) key!932 (_keys!6407 thiss!1504) (mask!10282 thiss!1504)))))

(declare-fun b!233859 () Bool)

(assert (=> b!233859 (= e!151906 e!151905)))

(assert (=> b!233859 (= lt!118302 (select (arr!5501 (_keys!6407 thiss!1504)) (index!6080 lt!118303)))))

(declare-fun c!38919 () Bool)

(assert (=> b!233859 (= c!38919 (= lt!118302 key!932))))

(assert (= (and d!58981 c!38918) b!233857))

(assert (= (and d!58981 (not c!38918)) b!233859))

(assert (= (and b!233859 c!38919) b!233856))

(assert (= (and b!233859 (not c!38919)) b!233854))

(assert (= (and b!233854 c!38920) b!233855))

(assert (= (and b!233854 (not c!38920)) b!233858))

(assert (=> d!58981 m!255099))

(declare-fun m!255201 () Bool)

(assert (=> d!58981 m!255201))

(declare-fun m!255203 () Bool)

(assert (=> d!58981 m!255203))

(declare-fun m!255205 () Bool)

(assert (=> d!58981 m!255205))

(assert (=> d!58981 m!255205))

(declare-fun m!255207 () Bool)

(assert (=> d!58981 m!255207))

(declare-fun m!255209 () Bool)

(assert (=> d!58981 m!255209))

(declare-fun m!255211 () Bool)

(assert (=> b!233858 m!255211))

(declare-fun m!255213 () Bool)

(assert (=> b!233859 m!255213))

(assert (=> b!233731 d!58981))

(declare-fun b!233867 () Bool)

(declare-fun e!151911 () Bool)

(assert (=> b!233867 (= e!151911 tp_is_empty!6159)))

(declare-fun mapIsEmpty!10421 () Bool)

(declare-fun mapRes!10421 () Bool)

(assert (=> mapIsEmpty!10421 mapRes!10421))

(declare-fun condMapEmpty!10421 () Bool)

(declare-fun mapDefault!10421 () ValueCell!2736)

(assert (=> mapNonEmpty!10415 (= condMapEmpty!10421 (= mapRest!10415 ((as const (Array (_ BitVec 32) ValueCell!2736)) mapDefault!10421)))))

(assert (=> mapNonEmpty!10415 (= tp!22040 (and e!151911 mapRes!10421))))

(declare-fun b!233866 () Bool)

(declare-fun e!151912 () Bool)

(assert (=> b!233866 (= e!151912 tp_is_empty!6159)))

(declare-fun mapNonEmpty!10421 () Bool)

(declare-fun tp!22049 () Bool)

(assert (=> mapNonEmpty!10421 (= mapRes!10421 (and tp!22049 e!151912))))

(declare-fun mapKey!10421 () (_ BitVec 32))

(declare-fun mapValue!10421 () ValueCell!2736)

(declare-fun mapRest!10421 () (Array (_ BitVec 32) ValueCell!2736))

(assert (=> mapNonEmpty!10421 (= mapRest!10415 (store mapRest!10421 mapKey!10421 mapValue!10421))))

(assert (= (and mapNonEmpty!10415 condMapEmpty!10421) mapIsEmpty!10421))

(assert (= (and mapNonEmpty!10415 (not condMapEmpty!10421)) mapNonEmpty!10421))

(assert (= (and mapNonEmpty!10421 ((_ is ValueCellFull!2736) mapValue!10421)) b!233866))

(assert (= (and mapNonEmpty!10415 ((_ is ValueCellFull!2736) mapDefault!10421)) b!233867))

(declare-fun m!255215 () Bool)

(assert (=> mapNonEmpty!10421 m!255215))

(declare-fun b_lambda!7861 () Bool)

(assert (= b_lambda!7859 (or (and b!233726 b_free!6297) b_lambda!7861)))

(check-sat (not d!58981) (not bm!21744) (not b!233767) (not b!233832) (not b_lambda!7861) tp_is_empty!6159 (not bm!21747) (not b!233766) (not d!58977) (not b!233765) (not bm!21749) (not bm!21745) (not b!233774) (not d!58975) (not b!233838) (not b!233834) (not b!233837) b_and!13207 (not b!233836) (not mapNonEmpty!10421) (not b!233776) (not b!233858) (not b!233824) (not b!233821) (not b!233828) (not b_next!6297) (not d!58973))
(check-sat b_and!13207 (not b_next!6297))
(get-model)

(declare-fun d!58983 () Bool)

(declare-fun get!2820 (Option!269) V!7859)

(assert (=> d!58983 (= (apply!205 lt!118289 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2820 (getValueByKey!263 (toList!1776 lt!118289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8664 () Bool)

(assert (= bs!8664 d!58983))

(declare-fun m!255217 () Bool)

(assert (=> bs!8664 m!255217))

(assert (=> bs!8664 m!255217))

(declare-fun m!255219 () Bool)

(assert (=> bs!8664 m!255219))

(assert (=> b!233821 d!58983))

(declare-fun d!58985 () Bool)

(declare-fun res!114749 () Bool)

(declare-fun e!151917 () Bool)

(assert (=> d!58985 (=> res!114749 e!151917)))

(assert (=> d!58985 (= res!114749 (and ((_ is Cons!3515) (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)))) (= (_1!2315 (h!4164 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))))) key!932)))))

(assert (=> d!58985 (= (containsKey!255 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))) key!932) e!151917)))

(declare-fun b!233872 () Bool)

(declare-fun e!151918 () Bool)

(assert (=> b!233872 (= e!151917 e!151918)))

(declare-fun res!114750 () Bool)

(assert (=> b!233872 (=> (not res!114750) (not e!151918))))

(assert (=> b!233872 (= res!114750 (and (or (not ((_ is Cons!3515) (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))))) (bvsle (_1!2315 (h!4164 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))))) key!932)) ((_ is Cons!3515) (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)))) (bvslt (_1!2315 (h!4164 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))))) key!932)))))

(declare-fun b!233873 () Bool)

(assert (=> b!233873 (= e!151918 (containsKey!255 (t!8482 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)))) key!932))))

(assert (= (and d!58985 (not res!114749)) b!233872))

(assert (= (and b!233872 res!114750) b!233873))

(declare-fun m!255221 () Bool)

(assert (=> b!233873 m!255221))

(assert (=> d!58975 d!58985))

(declare-fun d!58987 () Bool)

(declare-fun e!151919 () Bool)

(assert (=> d!58987 e!151919))

(declare-fun res!114751 () Bool)

(assert (=> d!58987 (=> res!114751 e!151919)))

(declare-fun lt!118307 () Bool)

(assert (=> d!58987 (= res!114751 (not lt!118307))))

(declare-fun lt!118305 () Bool)

(assert (=> d!58987 (= lt!118307 lt!118305)))

(declare-fun lt!118304 () Unit!7222)

(declare-fun e!151920 () Unit!7222)

(assert (=> d!58987 (= lt!118304 e!151920)))

(declare-fun c!38921 () Bool)

(assert (=> d!58987 (= c!38921 lt!118305)))

(assert (=> d!58987 (= lt!118305 (containsKey!255 (toList!1776 lt!118289) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58987 (= (contains!1646 lt!118289 #b1000000000000000000000000000000000000000000000000000000000000000) lt!118307)))

(declare-fun b!233874 () Bool)

(declare-fun lt!118306 () Unit!7222)

(assert (=> b!233874 (= e!151920 lt!118306)))

(assert (=> b!233874 (= lt!118306 (lemmaContainsKeyImpliesGetValueByKeyDefined!203 (toList!1776 lt!118289) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233874 (isDefined!204 (getValueByKey!263 (toList!1776 lt!118289) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233875 () Bool)

(declare-fun Unit!7226 () Unit!7222)

(assert (=> b!233875 (= e!151920 Unit!7226)))

(declare-fun b!233876 () Bool)

(assert (=> b!233876 (= e!151919 (isDefined!204 (getValueByKey!263 (toList!1776 lt!118289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58987 c!38921) b!233874))

(assert (= (and d!58987 (not c!38921)) b!233875))

(assert (= (and d!58987 (not res!114751)) b!233876))

(declare-fun m!255223 () Bool)

(assert (=> d!58987 m!255223))

(declare-fun m!255225 () Bool)

(assert (=> b!233874 m!255225))

(assert (=> b!233874 m!255217))

(assert (=> b!233874 m!255217))

(declare-fun m!255227 () Bool)

(assert (=> b!233874 m!255227))

(assert (=> b!233876 m!255217))

(assert (=> b!233876 m!255217))

(assert (=> b!233876 m!255227))

(assert (=> bm!21747 d!58987))

(declare-fun d!58989 () Bool)

(declare-fun e!151923 () Bool)

(assert (=> d!58989 e!151923))

(declare-fun res!114756 () Bool)

(assert (=> d!58989 (=> (not res!114756) (not e!151923))))

(declare-fun lt!118318 () ListLongMap!3521)

(assert (=> d!58989 (= res!114756 (contains!1646 lt!118318 (_1!2315 (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504)))))))

(declare-fun lt!118316 () List!3519)

(assert (=> d!58989 (= lt!118318 (ListLongMap!3522 lt!118316))))

(declare-fun lt!118319 () Unit!7222)

(declare-fun lt!118317 () Unit!7222)

(assert (=> d!58989 (= lt!118319 lt!118317)))

(assert (=> d!58989 (= (getValueByKey!263 lt!118316 (_1!2315 (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504)))) (Some!268 (_2!2315 (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!148 (List!3519 (_ BitVec 64) V!7859) Unit!7222)

(assert (=> d!58989 (= lt!118317 (lemmaContainsTupThenGetReturnValue!148 lt!118316 (_1!2315 (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504))) (_2!2315 (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504)))))))

(declare-fun insertStrictlySorted!151 (List!3519 (_ BitVec 64) V!7859) List!3519)

(assert (=> d!58989 (= lt!118316 (insertStrictlySorted!151 (toList!1776 call!21751) (_1!2315 (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504))) (_2!2315 (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504)))))))

(assert (=> d!58989 (= (+!632 call!21751 (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504))) lt!118318)))

(declare-fun b!233881 () Bool)

(declare-fun res!114757 () Bool)

(assert (=> b!233881 (=> (not res!114757) (not e!151923))))

(assert (=> b!233881 (= res!114757 (= (getValueByKey!263 (toList!1776 lt!118318) (_1!2315 (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504)))) (Some!268 (_2!2315 (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504))))))))

(declare-fun b!233882 () Bool)

(declare-fun contains!1647 (List!3519 tuple2!4608) Bool)

(assert (=> b!233882 (= e!151923 (contains!1647 (toList!1776 lt!118318) (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504))))))

(assert (= (and d!58989 res!114756) b!233881))

(assert (= (and b!233881 res!114757) b!233882))

(declare-fun m!255229 () Bool)

(assert (=> d!58989 m!255229))

(declare-fun m!255231 () Bool)

(assert (=> d!58989 m!255231))

(declare-fun m!255233 () Bool)

(assert (=> d!58989 m!255233))

(declare-fun m!255235 () Bool)

(assert (=> d!58989 m!255235))

(declare-fun m!255237 () Bool)

(assert (=> b!233881 m!255237))

(declare-fun m!255239 () Bool)

(assert (=> b!233882 m!255239))

(assert (=> b!233838 d!58989))

(declare-fun bm!21753 () Bool)

(declare-fun call!21756 () Bool)

(declare-fun c!38924 () Bool)

(assert (=> bm!21753 (= call!21756 (arrayNoDuplicates!0 (_keys!6407 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!38924 (Cons!3516 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000) Nil!3517) Nil!3517)))))

(declare-fun b!233893 () Bool)

(declare-fun e!151933 () Bool)

(declare-fun e!151935 () Bool)

(assert (=> b!233893 (= e!151933 e!151935)))

(assert (=> b!233893 (= c!38924 (validKeyInArray!0 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233894 () Bool)

(declare-fun e!151934 () Bool)

(assert (=> b!233894 (= e!151934 e!151933)))

(declare-fun res!114765 () Bool)

(assert (=> b!233894 (=> (not res!114765) (not e!151933))))

(declare-fun e!151932 () Bool)

(assert (=> b!233894 (= res!114765 (not e!151932))))

(declare-fun res!114766 () Bool)

(assert (=> b!233894 (=> (not res!114766) (not e!151932))))

(assert (=> b!233894 (= res!114766 (validKeyInArray!0 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233895 () Bool)

(assert (=> b!233895 (= e!151935 call!21756)))

(declare-fun b!233896 () Bool)

(assert (=> b!233896 (= e!151935 call!21756)))

(declare-fun d!58991 () Bool)

(declare-fun res!114764 () Bool)

(assert (=> d!58991 (=> res!114764 e!151934)))

(assert (=> d!58991 (= res!114764 (bvsge #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))))))

(assert (=> d!58991 (= (arrayNoDuplicates!0 (_keys!6407 thiss!1504) #b00000000000000000000000000000000 Nil!3517) e!151934)))

(declare-fun b!233897 () Bool)

(declare-fun contains!1648 (List!3520 (_ BitVec 64)) Bool)

(assert (=> b!233897 (= e!151932 (contains!1648 Nil!3517 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58991 (not res!114764)) b!233894))

(assert (= (and b!233894 res!114766) b!233897))

(assert (= (and b!233894 res!114765) b!233893))

(assert (= (and b!233893 c!38924) b!233896))

(assert (= (and b!233893 (not c!38924)) b!233895))

(assert (= (or b!233896 b!233895) bm!21753))

(assert (=> bm!21753 m!255145))

(declare-fun m!255241 () Bool)

(assert (=> bm!21753 m!255241))

(assert (=> b!233893 m!255145))

(assert (=> b!233893 m!255145))

(assert (=> b!233893 m!255159))

(assert (=> b!233894 m!255145))

(assert (=> b!233894 m!255145))

(assert (=> b!233894 m!255159))

(assert (=> b!233897 m!255145))

(assert (=> b!233897 m!255145))

(declare-fun m!255243 () Bool)

(assert (=> b!233897 m!255243))

(assert (=> b!233767 d!58991))

(declare-fun d!58993 () Bool)

(assert (=> d!58993 (= (apply!205 lt!118289 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2820 (getValueByKey!263 (toList!1776 lt!118289) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8665 () Bool)

(assert (= bs!8665 d!58993))

(declare-fun m!255245 () Bool)

(assert (=> bs!8665 m!255245))

(assert (=> bs!8665 m!255245))

(declare-fun m!255247 () Bool)

(assert (=> bs!8665 m!255247))

(assert (=> b!233837 d!58993))

(declare-fun b!233906 () Bool)

(declare-fun e!151941 () (_ BitVec 32))

(declare-fun e!151940 () (_ BitVec 32))

(assert (=> b!233906 (= e!151941 e!151940)))

(declare-fun c!38929 () Bool)

(assert (=> b!233906 (= c!38929 (validKeyInArray!0 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58995 () Bool)

(declare-fun lt!118322 () (_ BitVec 32))

(assert (=> d!58995 (and (bvsge lt!118322 #b00000000000000000000000000000000) (bvsle lt!118322 (bvsub (size!5835 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58995 (= lt!118322 e!151941)))

(declare-fun c!38930 () Bool)

(assert (=> d!58995 (= c!38930 (bvsge #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))))))

(assert (=> d!58995 (and (bvsle #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5835 (_keys!6407 thiss!1504)) (size!5835 (_keys!6407 thiss!1504))))))

(assert (=> d!58995 (= (arrayCountValidKeys!0 (_keys!6407 thiss!1504) #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))) lt!118322)))

(declare-fun b!233907 () Bool)

(assert (=> b!233907 (= e!151941 #b00000000000000000000000000000000)))

(declare-fun bm!21756 () Bool)

(declare-fun call!21759 () (_ BitVec 32))

(assert (=> bm!21756 (= call!21759 (arrayCountValidKeys!0 (_keys!6407 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5835 (_keys!6407 thiss!1504))))))

(declare-fun b!233908 () Bool)

(assert (=> b!233908 (= e!151940 call!21759)))

(declare-fun b!233909 () Bool)

(assert (=> b!233909 (= e!151940 (bvadd #b00000000000000000000000000000001 call!21759))))

(assert (= (and d!58995 c!38930) b!233907))

(assert (= (and d!58995 (not c!38930)) b!233906))

(assert (= (and b!233906 c!38929) b!233909))

(assert (= (and b!233906 (not c!38929)) b!233908))

(assert (= (or b!233909 b!233908) bm!21756))

(assert (=> b!233906 m!255145))

(assert (=> b!233906 m!255145))

(assert (=> b!233906 m!255159))

(declare-fun m!255249 () Bool)

(assert (=> bm!21756 m!255249))

(assert (=> b!233765 d!58995))

(declare-fun d!58997 () Bool)

(declare-fun e!151942 () Bool)

(assert (=> d!58997 e!151942))

(declare-fun res!114767 () Bool)

(assert (=> d!58997 (=> (not res!114767) (not e!151942))))

(declare-fun lt!118325 () ListLongMap!3521)

(assert (=> d!58997 (= res!114767 (contains!1646 lt!118325 (_1!2315 (ite (or c!38911 c!38910) (tuple2!4609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4189 thiss!1504)) (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504))))))))

(declare-fun lt!118323 () List!3519)

(assert (=> d!58997 (= lt!118325 (ListLongMap!3522 lt!118323))))

(declare-fun lt!118326 () Unit!7222)

(declare-fun lt!118324 () Unit!7222)

(assert (=> d!58997 (= lt!118326 lt!118324)))

(assert (=> d!58997 (= (getValueByKey!263 lt!118323 (_1!2315 (ite (or c!38911 c!38910) (tuple2!4609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4189 thiss!1504)) (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504))))) (Some!268 (_2!2315 (ite (or c!38911 c!38910) (tuple2!4609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4189 thiss!1504)) (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504))))))))

(assert (=> d!58997 (= lt!118324 (lemmaContainsTupThenGetReturnValue!148 lt!118323 (_1!2315 (ite (or c!38911 c!38910) (tuple2!4609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4189 thiss!1504)) (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504)))) (_2!2315 (ite (or c!38911 c!38910) (tuple2!4609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4189 thiss!1504)) (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504))))))))

(assert (=> d!58997 (= lt!118323 (insertStrictlySorted!151 (toList!1776 (ite c!38911 call!21747 (ite c!38910 call!21752 call!21753))) (_1!2315 (ite (or c!38911 c!38910) (tuple2!4609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4189 thiss!1504)) (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504)))) (_2!2315 (ite (or c!38911 c!38910) (tuple2!4609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4189 thiss!1504)) (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504))))))))

(assert (=> d!58997 (= (+!632 (ite c!38911 call!21747 (ite c!38910 call!21752 call!21753)) (ite (or c!38911 c!38910) (tuple2!4609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4189 thiss!1504)) (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504)))) lt!118325)))

(declare-fun b!233910 () Bool)

(declare-fun res!114768 () Bool)

(assert (=> b!233910 (=> (not res!114768) (not e!151942))))

(assert (=> b!233910 (= res!114768 (= (getValueByKey!263 (toList!1776 lt!118325) (_1!2315 (ite (or c!38911 c!38910) (tuple2!4609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4189 thiss!1504)) (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504))))) (Some!268 (_2!2315 (ite (or c!38911 c!38910) (tuple2!4609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4189 thiss!1504)) (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504)))))))))

(declare-fun b!233911 () Bool)

(assert (=> b!233911 (= e!151942 (contains!1647 (toList!1776 lt!118325) (ite (or c!38911 c!38910) (tuple2!4609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4189 thiss!1504)) (tuple2!4609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4189 thiss!1504)))))))

(assert (= (and d!58997 res!114767) b!233910))

(assert (= (and b!233910 res!114768) b!233911))

(declare-fun m!255251 () Bool)

(assert (=> d!58997 m!255251))

(declare-fun m!255253 () Bool)

(assert (=> d!58997 m!255253))

(declare-fun m!255255 () Bool)

(assert (=> d!58997 m!255255))

(declare-fun m!255257 () Bool)

(assert (=> d!58997 m!255257))

(declare-fun m!255259 () Bool)

(assert (=> b!233910 m!255259))

(declare-fun m!255261 () Bool)

(assert (=> b!233911 m!255261))

(assert (=> bm!21744 d!58997))

(declare-fun b!233920 () Bool)

(declare-fun e!151950 () Bool)

(declare-fun call!21762 () Bool)

(assert (=> b!233920 (= e!151950 call!21762)))

(declare-fun b!233921 () Bool)

(declare-fun e!151951 () Bool)

(assert (=> b!233921 (= e!151951 call!21762)))

(declare-fun bm!21759 () Bool)

(assert (=> bm!21759 (= call!21762 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6407 thiss!1504) (mask!10282 thiss!1504)))))

(declare-fun b!233923 () Bool)

(assert (=> b!233923 (= e!151951 e!151950)))

(declare-fun lt!118335 () (_ BitVec 64))

(assert (=> b!233923 (= lt!118335 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118333 () Unit!7222)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11567 (_ BitVec 64) (_ BitVec 32)) Unit!7222)

(assert (=> b!233923 (= lt!118333 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6407 thiss!1504) lt!118335 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233923 (arrayContainsKey!0 (_keys!6407 thiss!1504) lt!118335 #b00000000000000000000000000000000)))

(declare-fun lt!118334 () Unit!7222)

(assert (=> b!233923 (= lt!118334 lt!118333)))

(declare-fun res!114774 () Bool)

(assert (=> b!233923 (= res!114774 (= (seekEntryOrOpen!0 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000) (_keys!6407 thiss!1504) (mask!10282 thiss!1504)) (Found!977 #b00000000000000000000000000000000)))))

(assert (=> b!233923 (=> (not res!114774) (not e!151950))))

(declare-fun d!58999 () Bool)

(declare-fun res!114773 () Bool)

(declare-fun e!151949 () Bool)

(assert (=> d!58999 (=> res!114773 e!151949)))

(assert (=> d!58999 (= res!114773 (bvsge #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))))))

(assert (=> d!58999 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6407 thiss!1504) (mask!10282 thiss!1504)) e!151949)))

(declare-fun b!233922 () Bool)

(assert (=> b!233922 (= e!151949 e!151951)))

(declare-fun c!38933 () Bool)

(assert (=> b!233922 (= c!38933 (validKeyInArray!0 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58999 (not res!114773)) b!233922))

(assert (= (and b!233922 c!38933) b!233923))

(assert (= (and b!233922 (not c!38933)) b!233921))

(assert (= (and b!233923 res!114774) b!233920))

(assert (= (or b!233920 b!233921) bm!21759))

(declare-fun m!255263 () Bool)

(assert (=> bm!21759 m!255263))

(assert (=> b!233923 m!255145))

(declare-fun m!255265 () Bool)

(assert (=> b!233923 m!255265))

(declare-fun m!255267 () Bool)

(assert (=> b!233923 m!255267))

(assert (=> b!233923 m!255145))

(declare-fun m!255269 () Bool)

(assert (=> b!233923 m!255269))

(assert (=> b!233922 m!255145))

(assert (=> b!233922 m!255145))

(assert (=> b!233922 m!255159))

(assert (=> b!233766 d!58999))

(declare-fun d!59001 () Bool)

(declare-fun e!151952 () Bool)

(assert (=> d!59001 e!151952))

(declare-fun res!114775 () Bool)

(assert (=> d!59001 (=> res!114775 e!151952)))

(declare-fun lt!118339 () Bool)

(assert (=> d!59001 (= res!114775 (not lt!118339))))

(declare-fun lt!118337 () Bool)

(assert (=> d!59001 (= lt!118339 lt!118337)))

(declare-fun lt!118336 () Unit!7222)

(declare-fun e!151953 () Unit!7222)

(assert (=> d!59001 (= lt!118336 e!151953)))

(declare-fun c!38934 () Bool)

(assert (=> d!59001 (= c!38934 lt!118337)))

(assert (=> d!59001 (= lt!118337 (containsKey!255 (toList!1776 lt!118289) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59001 (= (contains!1646 lt!118289 #b0000000000000000000000000000000000000000000000000000000000000000) lt!118339)))

(declare-fun b!233924 () Bool)

(declare-fun lt!118338 () Unit!7222)

(assert (=> b!233924 (= e!151953 lt!118338)))

(assert (=> b!233924 (= lt!118338 (lemmaContainsKeyImpliesGetValueByKeyDefined!203 (toList!1776 lt!118289) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233924 (isDefined!204 (getValueByKey!263 (toList!1776 lt!118289) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233925 () Bool)

(declare-fun Unit!7227 () Unit!7222)

(assert (=> b!233925 (= e!151953 Unit!7227)))

(declare-fun b!233926 () Bool)

(assert (=> b!233926 (= e!151952 (isDefined!204 (getValueByKey!263 (toList!1776 lt!118289) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59001 c!38934) b!233924))

(assert (= (and d!59001 (not c!38934)) b!233925))

(assert (= (and d!59001 (not res!114775)) b!233926))

(declare-fun m!255271 () Bool)

(assert (=> d!59001 m!255271))

(declare-fun m!255273 () Bool)

(assert (=> b!233924 m!255273))

(assert (=> b!233924 m!255245))

(assert (=> b!233924 m!255245))

(declare-fun m!255275 () Bool)

(assert (=> b!233924 m!255275))

(assert (=> b!233926 m!255245))

(assert (=> b!233926 m!255245))

(assert (=> b!233926 m!255275))

(assert (=> bm!21749 d!59001))

(declare-fun d!59003 () Bool)

(assert (=> d!59003 (= (apply!205 lt!118289 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)) (get!2820 (getValueByKey!263 (toList!1776 lt!118289) (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8666 () Bool)

(assert (= bs!8666 d!59003))

(assert (=> bs!8666 m!255145))

(declare-fun m!255277 () Bool)

(assert (=> bs!8666 m!255277))

(assert (=> bs!8666 m!255277))

(declare-fun m!255279 () Bool)

(assert (=> bs!8666 m!255279))

(assert (=> b!233836 d!59003))

(declare-fun d!59005 () Bool)

(declare-fun c!38937 () Bool)

(assert (=> d!59005 (= c!38937 ((_ is ValueCellFull!2736) (select (arr!5500 (_values!4331 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!151956 () V!7859)

(assert (=> d!59005 (= (get!2819 (select (arr!5500 (_values!4331 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4348 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!151956)))

(declare-fun b!233931 () Bool)

(declare-fun get!2821 (ValueCell!2736 V!7859) V!7859)

(assert (=> b!233931 (= e!151956 (get!2821 (select (arr!5500 (_values!4331 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4348 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!233932 () Bool)

(declare-fun get!2822 (ValueCell!2736 V!7859) V!7859)

(assert (=> b!233932 (= e!151956 (get!2822 (select (arr!5500 (_values!4331 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4348 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59005 c!38937) b!233931))

(assert (= (and d!59005 (not c!38937)) b!233932))

(assert (=> b!233931 m!255151))

(assert (=> b!233931 m!255149))

(declare-fun m!255281 () Bool)

(assert (=> b!233931 m!255281))

(assert (=> b!233932 m!255151))

(assert (=> b!233932 m!255149))

(declare-fun m!255283 () Bool)

(assert (=> b!233932 m!255283))

(assert (=> b!233836 d!59005))

(declare-fun b!233942 () Bool)

(declare-fun res!114784 () Bool)

(declare-fun e!151959 () Bool)

(assert (=> b!233942 (=> (not res!114784) (not e!151959))))

(declare-fun size!5838 (LongMapFixedSize!3372) (_ BitVec 32))

(assert (=> b!233942 (= res!114784 (bvsge (size!5838 thiss!1504) (_size!1735 thiss!1504)))))

(declare-fun b!233943 () Bool)

(declare-fun res!114786 () Bool)

(assert (=> b!233943 (=> (not res!114786) (not e!151959))))

(assert (=> b!233943 (= res!114786 (= (size!5838 thiss!1504) (bvadd (_size!1735 thiss!1504) (bvsdiv (bvadd (extraKeys!4085 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!233941 () Bool)

(declare-fun res!114787 () Bool)

(assert (=> b!233941 (=> (not res!114787) (not e!151959))))

(assert (=> b!233941 (= res!114787 (and (= (size!5834 (_values!4331 thiss!1504)) (bvadd (mask!10282 thiss!1504) #b00000000000000000000000000000001)) (= (size!5835 (_keys!6407 thiss!1504)) (size!5834 (_values!4331 thiss!1504))) (bvsge (_size!1735 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1735 thiss!1504) (bvadd (mask!10282 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!233944 () Bool)

(assert (=> b!233944 (= e!151959 (and (bvsge (extraKeys!4085 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4085 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1735 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun d!59007 () Bool)

(declare-fun res!114785 () Bool)

(assert (=> d!59007 (=> (not res!114785) (not e!151959))))

(assert (=> d!59007 (= res!114785 (validMask!0 (mask!10282 thiss!1504)))))

(assert (=> d!59007 (= (simpleValid!228 thiss!1504) e!151959)))

(assert (= (and d!59007 res!114785) b!233941))

(assert (= (and b!233941 res!114787) b!233942))

(assert (= (and b!233942 res!114784) b!233943))

(assert (= (and b!233943 res!114786) b!233944))

(declare-fun m!255285 () Bool)

(assert (=> b!233942 m!255285))

(assert (=> b!233943 m!255285))

(assert (=> d!59007 m!255099))

(assert (=> d!58973 d!59007))

(declare-fun b!233963 () Bool)

(declare-fun e!151971 () SeekEntryResult!977)

(assert (=> b!233963 (= e!151971 (Intermediate!977 false (toIndex!0 key!932 (mask!10282 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!233964 () Bool)

(declare-fun e!151972 () Bool)

(declare-fun e!151973 () Bool)

(assert (=> b!233964 (= e!151972 e!151973)))

(declare-fun res!114795 () Bool)

(declare-fun lt!118345 () SeekEntryResult!977)

(assert (=> b!233964 (= res!114795 (and ((_ is Intermediate!977) lt!118345) (not (undefined!1789 lt!118345)) (bvslt (x!23649 lt!118345) #b01111111111111111111111111111110) (bvsge (x!23649 lt!118345) #b00000000000000000000000000000000) (bvsge (x!23649 lt!118345) #b00000000000000000000000000000000)))))

(assert (=> b!233964 (=> (not res!114795) (not e!151973))))

(declare-fun b!233965 () Bool)

(assert (=> b!233965 (and (bvsge (index!6080 lt!118345) #b00000000000000000000000000000000) (bvslt (index!6080 lt!118345) (size!5835 (_keys!6407 thiss!1504))))))

(declare-fun res!114794 () Bool)

(assert (=> b!233965 (= res!114794 (= (select (arr!5501 (_keys!6407 thiss!1504)) (index!6080 lt!118345)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!151970 () Bool)

(assert (=> b!233965 (=> res!114794 e!151970)))

(declare-fun d!59009 () Bool)

(assert (=> d!59009 e!151972))

(declare-fun c!38946 () Bool)

(assert (=> d!59009 (= c!38946 (and ((_ is Intermediate!977) lt!118345) (undefined!1789 lt!118345)))))

(declare-fun e!151974 () SeekEntryResult!977)

(assert (=> d!59009 (= lt!118345 e!151974)))

(declare-fun c!38945 () Bool)

(assert (=> d!59009 (= c!38945 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!118344 () (_ BitVec 64))

(assert (=> d!59009 (= lt!118344 (select (arr!5501 (_keys!6407 thiss!1504)) (toIndex!0 key!932 (mask!10282 thiss!1504))))))

(assert (=> d!59009 (validMask!0 (mask!10282 thiss!1504))))

(assert (=> d!59009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10282 thiss!1504)) key!932 (_keys!6407 thiss!1504) (mask!10282 thiss!1504)) lt!118345)))

(declare-fun b!233966 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!233966 (= e!151971 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10282 thiss!1504)) #b00000000000000000000000000000000 (mask!10282 thiss!1504)) key!932 (_keys!6407 thiss!1504) (mask!10282 thiss!1504)))))

(declare-fun b!233967 () Bool)

(assert (=> b!233967 (= e!151974 (Intermediate!977 true (toIndex!0 key!932 (mask!10282 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!233968 () Bool)

(assert (=> b!233968 (and (bvsge (index!6080 lt!118345) #b00000000000000000000000000000000) (bvslt (index!6080 lt!118345) (size!5835 (_keys!6407 thiss!1504))))))

(assert (=> b!233968 (= e!151970 (= (select (arr!5501 (_keys!6407 thiss!1504)) (index!6080 lt!118345)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233969 () Bool)

(assert (=> b!233969 (and (bvsge (index!6080 lt!118345) #b00000000000000000000000000000000) (bvslt (index!6080 lt!118345) (size!5835 (_keys!6407 thiss!1504))))))

(declare-fun res!114796 () Bool)

(assert (=> b!233969 (= res!114796 (= (select (arr!5501 (_keys!6407 thiss!1504)) (index!6080 lt!118345)) key!932))))

(assert (=> b!233969 (=> res!114796 e!151970)))

(assert (=> b!233969 (= e!151973 e!151970)))

(declare-fun b!233970 () Bool)

(assert (=> b!233970 (= e!151972 (bvsge (x!23649 lt!118345) #b01111111111111111111111111111110))))

(declare-fun b!233971 () Bool)

(assert (=> b!233971 (= e!151974 e!151971)))

(declare-fun c!38944 () Bool)

(assert (=> b!233971 (= c!38944 (or (= lt!118344 key!932) (= (bvadd lt!118344 lt!118344) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59009 c!38945) b!233967))

(assert (= (and d!59009 (not c!38945)) b!233971))

(assert (= (and b!233971 c!38944) b!233963))

(assert (= (and b!233971 (not c!38944)) b!233966))

(assert (= (and d!59009 c!38946) b!233970))

(assert (= (and d!59009 (not c!38946)) b!233964))

(assert (= (and b!233964 res!114795) b!233969))

(assert (= (and b!233969 (not res!114796)) b!233965))

(assert (= (and b!233965 (not res!114794)) b!233968))

(declare-fun m!255287 () Bool)

(assert (=> b!233969 m!255287))

(assert (=> d!59009 m!255205))

(declare-fun m!255289 () Bool)

(assert (=> d!59009 m!255289))

(assert (=> d!59009 m!255099))

(assert (=> b!233966 m!255205))

(declare-fun m!255291 () Bool)

(assert (=> b!233966 m!255291))

(assert (=> b!233966 m!255291))

(declare-fun m!255293 () Bool)

(assert (=> b!233966 m!255293))

(assert (=> b!233965 m!255287))

(assert (=> b!233968 m!255287))

(assert (=> d!58981 d!59009))

(declare-fun d!59011 () Bool)

(declare-fun lt!118351 () (_ BitVec 32))

(declare-fun lt!118350 () (_ BitVec 32))

(assert (=> d!59011 (= lt!118351 (bvmul (bvxor lt!118350 (bvlshr lt!118350 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59011 (= lt!118350 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59011 (and (bvsge (mask!10282 thiss!1504) #b00000000000000000000000000000000) (let ((res!114797 (let ((h!4166 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23665 (bvmul (bvxor h!4166 (bvlshr h!4166 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23665 (bvlshr x!23665 #b00000000000000000000000000001101)) (mask!10282 thiss!1504)))))) (and (bvslt res!114797 (bvadd (mask!10282 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!114797 #b00000000000000000000000000000000))))))

(assert (=> d!59011 (= (toIndex!0 key!932 (mask!10282 thiss!1504)) (bvand (bvxor lt!118351 (bvlshr lt!118351 #b00000000000000000000000000001101)) (mask!10282 thiss!1504)))))

(assert (=> d!58981 d!59011))

(assert (=> d!58981 d!58979))

(declare-fun d!59013 () Bool)

(assert (=> d!59013 (= (validKeyInArray!0 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!233828 d!59013))

(declare-fun e!151982 () SeekEntryResult!977)

(declare-fun b!233984 () Bool)

(assert (=> b!233984 (= e!151982 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23649 lt!118303) #b00000000000000000000000000000001) (nextIndex!0 (index!6080 lt!118303) (x!23649 lt!118303) (mask!10282 thiss!1504)) (index!6080 lt!118303) key!932 (_keys!6407 thiss!1504) (mask!10282 thiss!1504)))))

(declare-fun b!233985 () Bool)

(declare-fun e!151983 () SeekEntryResult!977)

(declare-fun e!151981 () SeekEntryResult!977)

(assert (=> b!233985 (= e!151983 e!151981)))

(declare-fun c!38955 () Bool)

(declare-fun lt!118356 () (_ BitVec 64))

(assert (=> b!233985 (= c!38955 (= lt!118356 key!932))))

(declare-fun b!233986 () Bool)

(assert (=> b!233986 (= e!151981 (Found!977 (index!6080 lt!118303)))))

(declare-fun d!59015 () Bool)

(declare-fun lt!118357 () SeekEntryResult!977)

(assert (=> d!59015 (and (or ((_ is Undefined!977) lt!118357) (not ((_ is Found!977) lt!118357)) (and (bvsge (index!6079 lt!118357) #b00000000000000000000000000000000) (bvslt (index!6079 lt!118357) (size!5835 (_keys!6407 thiss!1504))))) (or ((_ is Undefined!977) lt!118357) ((_ is Found!977) lt!118357) (not ((_ is MissingVacant!977) lt!118357)) (not (= (index!6081 lt!118357) (index!6080 lt!118303))) (and (bvsge (index!6081 lt!118357) #b00000000000000000000000000000000) (bvslt (index!6081 lt!118357) (size!5835 (_keys!6407 thiss!1504))))) (or ((_ is Undefined!977) lt!118357) (ite ((_ is Found!977) lt!118357) (= (select (arr!5501 (_keys!6407 thiss!1504)) (index!6079 lt!118357)) key!932) (and ((_ is MissingVacant!977) lt!118357) (= (index!6081 lt!118357) (index!6080 lt!118303)) (= (select (arr!5501 (_keys!6407 thiss!1504)) (index!6081 lt!118357)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59015 (= lt!118357 e!151983)))

(declare-fun c!38953 () Bool)

(assert (=> d!59015 (= c!38953 (bvsge (x!23649 lt!118303) #b01111111111111111111111111111110))))

(assert (=> d!59015 (= lt!118356 (select (arr!5501 (_keys!6407 thiss!1504)) (index!6080 lt!118303)))))

(assert (=> d!59015 (validMask!0 (mask!10282 thiss!1504))))

(assert (=> d!59015 (= (seekKeyOrZeroReturnVacant!0 (x!23649 lt!118303) (index!6080 lt!118303) (index!6080 lt!118303) key!932 (_keys!6407 thiss!1504) (mask!10282 thiss!1504)) lt!118357)))

(declare-fun b!233987 () Bool)

(declare-fun c!38954 () Bool)

(assert (=> b!233987 (= c!38954 (= lt!118356 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233987 (= e!151981 e!151982)))

(declare-fun b!233988 () Bool)

(assert (=> b!233988 (= e!151983 Undefined!977)))

(declare-fun b!233989 () Bool)

(assert (=> b!233989 (= e!151982 (MissingVacant!977 (index!6080 lt!118303)))))

(assert (= (and d!59015 c!38953) b!233988))

(assert (= (and d!59015 (not c!38953)) b!233985))

(assert (= (and b!233985 c!38955) b!233986))

(assert (= (and b!233985 (not c!38955)) b!233987))

(assert (= (and b!233987 c!38954) b!233989))

(assert (= (and b!233987 (not c!38954)) b!233984))

(declare-fun m!255295 () Bool)

(assert (=> b!233984 m!255295))

(assert (=> b!233984 m!255295))

(declare-fun m!255297 () Bool)

(assert (=> b!233984 m!255297))

(declare-fun m!255299 () Bool)

(assert (=> d!59015 m!255299))

(declare-fun m!255301 () Bool)

(assert (=> d!59015 m!255301))

(assert (=> d!59015 m!255213))

(assert (=> d!59015 m!255099))

(assert (=> b!233858 d!59015))

(assert (=> b!233834 d!59013))

(assert (=> d!58977 d!58979))

(declare-fun d!59017 () Bool)

(assert (=> d!59017 (contains!1646 (+!632 lt!118280 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504))) lt!118293)))

(declare-fun lt!118360 () Unit!7222)

(declare-fun choose!1095 (ListLongMap!3521 (_ BitVec 64) V!7859 (_ BitVec 64)) Unit!7222)

(assert (=> d!59017 (= lt!118360 (choose!1095 lt!118280 lt!118291 (zeroValue!4189 thiss!1504) lt!118293))))

(assert (=> d!59017 (contains!1646 lt!118280 lt!118293)))

(assert (=> d!59017 (= (addStillContains!181 lt!118280 lt!118291 (zeroValue!4189 thiss!1504) lt!118293) lt!118360)))

(declare-fun bs!8667 () Bool)

(assert (= bs!8667 d!59017))

(assert (=> bs!8667 m!255169))

(assert (=> bs!8667 m!255169))

(assert (=> bs!8667 m!255173))

(declare-fun m!255303 () Bool)

(assert (=> bs!8667 m!255303))

(declare-fun m!255305 () Bool)

(assert (=> bs!8667 m!255305))

(assert (=> b!233824 d!59017))

(declare-fun d!59019 () Bool)

(declare-fun e!151984 () Bool)

(assert (=> d!59019 e!151984))

(declare-fun res!114798 () Bool)

(assert (=> d!59019 (=> (not res!114798) (not e!151984))))

(declare-fun lt!118363 () ListLongMap!3521)

(assert (=> d!59019 (= res!114798 (contains!1646 lt!118363 (_1!2315 (tuple2!4609 lt!118283 (zeroValue!4189 thiss!1504)))))))

(declare-fun lt!118361 () List!3519)

(assert (=> d!59019 (= lt!118363 (ListLongMap!3522 lt!118361))))

(declare-fun lt!118364 () Unit!7222)

(declare-fun lt!118362 () Unit!7222)

(assert (=> d!59019 (= lt!118364 lt!118362)))

(assert (=> d!59019 (= (getValueByKey!263 lt!118361 (_1!2315 (tuple2!4609 lt!118283 (zeroValue!4189 thiss!1504)))) (Some!268 (_2!2315 (tuple2!4609 lt!118283 (zeroValue!4189 thiss!1504)))))))

(assert (=> d!59019 (= lt!118362 (lemmaContainsTupThenGetReturnValue!148 lt!118361 (_1!2315 (tuple2!4609 lt!118283 (zeroValue!4189 thiss!1504))) (_2!2315 (tuple2!4609 lt!118283 (zeroValue!4189 thiss!1504)))))))

(assert (=> d!59019 (= lt!118361 (insertStrictlySorted!151 (toList!1776 lt!118282) (_1!2315 (tuple2!4609 lt!118283 (zeroValue!4189 thiss!1504))) (_2!2315 (tuple2!4609 lt!118283 (zeroValue!4189 thiss!1504)))))))

(assert (=> d!59019 (= (+!632 lt!118282 (tuple2!4609 lt!118283 (zeroValue!4189 thiss!1504))) lt!118363)))

(declare-fun b!233991 () Bool)

(declare-fun res!114799 () Bool)

(assert (=> b!233991 (=> (not res!114799) (not e!151984))))

(assert (=> b!233991 (= res!114799 (= (getValueByKey!263 (toList!1776 lt!118363) (_1!2315 (tuple2!4609 lt!118283 (zeroValue!4189 thiss!1504)))) (Some!268 (_2!2315 (tuple2!4609 lt!118283 (zeroValue!4189 thiss!1504))))))))

(declare-fun b!233992 () Bool)

(assert (=> b!233992 (= e!151984 (contains!1647 (toList!1776 lt!118363) (tuple2!4609 lt!118283 (zeroValue!4189 thiss!1504))))))

(assert (= (and d!59019 res!114798) b!233991))

(assert (= (and b!233991 res!114799) b!233992))

(declare-fun m!255307 () Bool)

(assert (=> d!59019 m!255307))

(declare-fun m!255309 () Bool)

(assert (=> d!59019 m!255309))

(declare-fun m!255311 () Bool)

(assert (=> d!59019 m!255311))

(declare-fun m!255313 () Bool)

(assert (=> d!59019 m!255313))

(declare-fun m!255315 () Bool)

(assert (=> b!233991 m!255315))

(declare-fun m!255317 () Bool)

(assert (=> b!233992 m!255317))

(assert (=> b!233824 d!59019))

(declare-fun d!59021 () Bool)

(declare-fun e!151985 () Bool)

(assert (=> d!59021 e!151985))

(declare-fun res!114800 () Bool)

(assert (=> d!59021 (=> (not res!114800) (not e!151985))))

(declare-fun lt!118367 () ListLongMap!3521)

(assert (=> d!59021 (= res!114800 (contains!1646 lt!118367 (_1!2315 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504)))))))

(declare-fun lt!118365 () List!3519)

(assert (=> d!59021 (= lt!118367 (ListLongMap!3522 lt!118365))))

(declare-fun lt!118368 () Unit!7222)

(declare-fun lt!118366 () Unit!7222)

(assert (=> d!59021 (= lt!118368 lt!118366)))

(assert (=> d!59021 (= (getValueByKey!263 lt!118365 (_1!2315 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504)))) (Some!268 (_2!2315 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504)))))))

(assert (=> d!59021 (= lt!118366 (lemmaContainsTupThenGetReturnValue!148 lt!118365 (_1!2315 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504))) (_2!2315 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504)))))))

(assert (=> d!59021 (= lt!118365 (insertStrictlySorted!151 (toList!1776 lt!118280) (_1!2315 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504))) (_2!2315 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504)))))))

(assert (=> d!59021 (= (+!632 lt!118280 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504))) lt!118367)))

(declare-fun b!233993 () Bool)

(declare-fun res!114801 () Bool)

(assert (=> b!233993 (=> (not res!114801) (not e!151985))))

(assert (=> b!233993 (= res!114801 (= (getValueByKey!263 (toList!1776 lt!118367) (_1!2315 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504)))) (Some!268 (_2!2315 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504))))))))

(declare-fun b!233994 () Bool)

(assert (=> b!233994 (= e!151985 (contains!1647 (toList!1776 lt!118367) (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504))))))

(assert (= (and d!59021 res!114800) b!233993))

(assert (= (and b!233993 res!114801) b!233994))

(declare-fun m!255319 () Bool)

(assert (=> d!59021 m!255319))

(declare-fun m!255321 () Bool)

(assert (=> d!59021 m!255321))

(declare-fun m!255323 () Bool)

(assert (=> d!59021 m!255323))

(declare-fun m!255325 () Bool)

(assert (=> d!59021 m!255325))

(declare-fun m!255327 () Bool)

(assert (=> b!233993 m!255327))

(declare-fun m!255329 () Bool)

(assert (=> b!233994 m!255329))

(assert (=> b!233824 d!59021))

(declare-fun d!59023 () Bool)

(assert (=> d!59023 (= (apply!205 lt!118290 lt!118278) (get!2820 (getValueByKey!263 (toList!1776 lt!118290) lt!118278)))))

(declare-fun bs!8668 () Bool)

(assert (= bs!8668 d!59023))

(declare-fun m!255331 () Bool)

(assert (=> bs!8668 m!255331))

(assert (=> bs!8668 m!255331))

(declare-fun m!255333 () Bool)

(assert (=> bs!8668 m!255333))

(assert (=> b!233824 d!59023))

(declare-fun d!59025 () Bool)

(assert (=> d!59025 (= (apply!205 (+!632 lt!118290 (tuple2!4609 lt!118288 (minValue!4189 thiss!1504))) lt!118278) (apply!205 lt!118290 lt!118278))))

(declare-fun lt!118371 () Unit!7222)

(declare-fun choose!1096 (ListLongMap!3521 (_ BitVec 64) V!7859 (_ BitVec 64)) Unit!7222)

(assert (=> d!59025 (= lt!118371 (choose!1096 lt!118290 lt!118288 (minValue!4189 thiss!1504) lt!118278))))

(declare-fun e!151988 () Bool)

(assert (=> d!59025 e!151988))

(declare-fun res!114804 () Bool)

(assert (=> d!59025 (=> (not res!114804) (not e!151988))))

(assert (=> d!59025 (= res!114804 (contains!1646 lt!118290 lt!118278))))

(assert (=> d!59025 (= (addApplyDifferent!181 lt!118290 lt!118288 (minValue!4189 thiss!1504) lt!118278) lt!118371)))

(declare-fun b!233998 () Bool)

(assert (=> b!233998 (= e!151988 (not (= lt!118278 lt!118288)))))

(assert (= (and d!59025 res!114804) b!233998))

(assert (=> d!59025 m!255179))

(assert (=> d!59025 m!255181))

(assert (=> d!59025 m!255161))

(assert (=> d!59025 m!255179))

(declare-fun m!255335 () Bool)

(assert (=> d!59025 m!255335))

(declare-fun m!255337 () Bool)

(assert (=> d!59025 m!255337))

(assert (=> b!233824 d!59025))

(declare-fun b!234023 () Bool)

(assert (=> b!234023 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))))))

(assert (=> b!234023 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5834 (_values!4331 thiss!1504))))))

(declare-fun e!152006 () Bool)

(declare-fun lt!118387 () ListLongMap!3521)

(assert (=> b!234023 (= e!152006 (= (apply!205 lt!118387 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)) (get!2819 (select (arr!5500 (_values!4331 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4348 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234024 () Bool)

(declare-fun res!114813 () Bool)

(declare-fun e!152008 () Bool)

(assert (=> b!234024 (=> (not res!114813) (not e!152008))))

(assert (=> b!234024 (= res!114813 (not (contains!1646 lt!118387 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!59027 () Bool)

(assert (=> d!59027 e!152008))

(declare-fun res!114815 () Bool)

(assert (=> d!59027 (=> (not res!114815) (not e!152008))))

(assert (=> d!59027 (= res!114815 (not (contains!1646 lt!118387 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!152005 () ListLongMap!3521)

(assert (=> d!59027 (= lt!118387 e!152005)))

(declare-fun c!38966 () Bool)

(assert (=> d!59027 (= c!38966 (bvsge #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))))))

(assert (=> d!59027 (validMask!0 (mask!10282 thiss!1504))))

(assert (=> d!59027 (= (getCurrentListMapNoExtraKeys!527 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)) lt!118387)))

(declare-fun b!234025 () Bool)

(declare-fun e!152003 () Bool)

(declare-fun isEmpty!506 (ListLongMap!3521) Bool)

(assert (=> b!234025 (= e!152003 (isEmpty!506 lt!118387))))

(declare-fun b!234026 () Bool)

(declare-fun e!152004 () ListLongMap!3521)

(declare-fun call!21765 () ListLongMap!3521)

(assert (=> b!234026 (= e!152004 call!21765)))

(declare-fun bm!21762 () Bool)

(assert (=> bm!21762 (= call!21765 (getCurrentListMapNoExtraKeys!527 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4348 thiss!1504)))))

(declare-fun b!234027 () Bool)

(declare-fun e!152009 () Bool)

(assert (=> b!234027 (= e!152009 e!152006)))

(assert (=> b!234027 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))))))

(declare-fun res!114816 () Bool)

(assert (=> b!234027 (= res!114816 (contains!1646 lt!118387 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234027 (=> (not res!114816) (not e!152006))))

(declare-fun b!234028 () Bool)

(assert (=> b!234028 (= e!152003 (= lt!118387 (getCurrentListMapNoExtraKeys!527 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4348 thiss!1504))))))

(declare-fun b!234029 () Bool)

(assert (=> b!234029 (= e!152005 e!152004)))

(declare-fun c!38967 () Bool)

(assert (=> b!234029 (= c!38967 (validKeyInArray!0 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234030 () Bool)

(assert (=> b!234030 (= e!152005 (ListLongMap!3522 Nil!3516))))

(declare-fun b!234031 () Bool)

(assert (=> b!234031 (= e!152008 e!152009)))

(declare-fun c!38964 () Bool)

(declare-fun e!152007 () Bool)

(assert (=> b!234031 (= c!38964 e!152007)))

(declare-fun res!114814 () Bool)

(assert (=> b!234031 (=> (not res!114814) (not e!152007))))

(assert (=> b!234031 (= res!114814 (bvslt #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))))))

(declare-fun b!234032 () Bool)

(declare-fun lt!118386 () Unit!7222)

(declare-fun lt!118388 () Unit!7222)

(assert (=> b!234032 (= lt!118386 lt!118388)))

(declare-fun lt!118389 () V!7859)

(declare-fun lt!118392 () (_ BitVec 64))

(declare-fun lt!118390 () ListLongMap!3521)

(declare-fun lt!118391 () (_ BitVec 64))

(assert (=> b!234032 (not (contains!1646 (+!632 lt!118390 (tuple2!4609 lt!118392 lt!118389)) lt!118391))))

(declare-fun addStillNotContains!112 (ListLongMap!3521 (_ BitVec 64) V!7859 (_ BitVec 64)) Unit!7222)

(assert (=> b!234032 (= lt!118388 (addStillNotContains!112 lt!118390 lt!118392 lt!118389 lt!118391))))

(assert (=> b!234032 (= lt!118391 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!234032 (= lt!118389 (get!2819 (select (arr!5500 (_values!4331 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4348 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234032 (= lt!118392 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234032 (= lt!118390 call!21765)))

(assert (=> b!234032 (= e!152004 (+!632 call!21765 (tuple2!4609 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000) (get!2819 (select (arr!5500 (_values!4331 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4348 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!234033 () Bool)

(assert (=> b!234033 (= e!152007 (validKeyInArray!0 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234033 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!234034 () Bool)

(assert (=> b!234034 (= e!152009 e!152003)))

(declare-fun c!38965 () Bool)

(assert (=> b!234034 (= c!38965 (bvslt #b00000000000000000000000000000000 (size!5835 (_keys!6407 thiss!1504))))))

(assert (= (and d!59027 c!38966) b!234030))

(assert (= (and d!59027 (not c!38966)) b!234029))

(assert (= (and b!234029 c!38967) b!234032))

(assert (= (and b!234029 (not c!38967)) b!234026))

(assert (= (or b!234032 b!234026) bm!21762))

(assert (= (and d!59027 res!114815) b!234024))

(assert (= (and b!234024 res!114813) b!234031))

(assert (= (and b!234031 res!114814) b!234033))

(assert (= (and b!234031 c!38964) b!234027))

(assert (= (and b!234031 (not c!38964)) b!234034))

(assert (= (and b!234027 res!114816) b!234023))

(assert (= (and b!234034 c!38965) b!234028))

(assert (= (and b!234034 (not c!38965)) b!234025))

(declare-fun b_lambda!7863 () Bool)

(assert (=> (not b_lambda!7863) (not b!234023)))

(assert (=> b!234023 t!8484))

(declare-fun b_and!13209 () Bool)

(assert (= b_and!13207 (and (=> t!8484 result!5091) b_and!13209)))

(declare-fun b_lambda!7865 () Bool)

(assert (=> (not b_lambda!7865) (not b!234032)))

(assert (=> b!234032 t!8484))

(declare-fun b_and!13211 () Bool)

(assert (= b_and!13209 (and (=> t!8484 result!5091) b_and!13211)))

(assert (=> b!234023 m!255145))

(assert (=> b!234023 m!255151))

(assert (=> b!234023 m!255145))

(declare-fun m!255339 () Bool)

(assert (=> b!234023 m!255339))

(assert (=> b!234023 m!255151))

(assert (=> b!234023 m!255149))

(assert (=> b!234023 m!255153))

(assert (=> b!234023 m!255149))

(declare-fun m!255341 () Bool)

(assert (=> b!234025 m!255341))

(declare-fun m!255343 () Bool)

(assert (=> bm!21762 m!255343))

(assert (=> b!234029 m!255145))

(assert (=> b!234029 m!255145))

(assert (=> b!234029 m!255159))

(declare-fun m!255345 () Bool)

(assert (=> b!234024 m!255345))

(declare-fun m!255347 () Bool)

(assert (=> d!59027 m!255347))

(assert (=> d!59027 m!255099))

(assert (=> b!234027 m!255145))

(assert (=> b!234027 m!255145))

(declare-fun m!255349 () Bool)

(assert (=> b!234027 m!255349))

(assert (=> b!234032 m!255145))

(declare-fun m!255351 () Bool)

(assert (=> b!234032 m!255351))

(assert (=> b!234032 m!255151))

(assert (=> b!234032 m!255149))

(assert (=> b!234032 m!255153))

(declare-fun m!255353 () Bool)

(assert (=> b!234032 m!255353))

(assert (=> b!234032 m!255149))

(declare-fun m!255355 () Bool)

(assert (=> b!234032 m!255355))

(declare-fun m!255357 () Bool)

(assert (=> b!234032 m!255357))

(assert (=> b!234032 m!255151))

(assert (=> b!234032 m!255355))

(assert (=> b!234033 m!255145))

(assert (=> b!234033 m!255145))

(assert (=> b!234033 m!255159))

(assert (=> b!234028 m!255343))

(assert (=> b!233824 d!59027))

(declare-fun d!59029 () Bool)

(declare-fun e!152010 () Bool)

(assert (=> d!59029 e!152010))

(declare-fun res!114817 () Bool)

(assert (=> d!59029 (=> (not res!114817) (not e!152010))))

(declare-fun lt!118395 () ListLongMap!3521)

(assert (=> d!59029 (= res!114817 (contains!1646 lt!118395 (_1!2315 (tuple2!4609 lt!118294 (minValue!4189 thiss!1504)))))))

(declare-fun lt!118393 () List!3519)

(assert (=> d!59029 (= lt!118395 (ListLongMap!3522 lt!118393))))

(declare-fun lt!118396 () Unit!7222)

(declare-fun lt!118394 () Unit!7222)

(assert (=> d!59029 (= lt!118396 lt!118394)))

(assert (=> d!59029 (= (getValueByKey!263 lt!118393 (_1!2315 (tuple2!4609 lt!118294 (minValue!4189 thiss!1504)))) (Some!268 (_2!2315 (tuple2!4609 lt!118294 (minValue!4189 thiss!1504)))))))

(assert (=> d!59029 (= lt!118394 (lemmaContainsTupThenGetReturnValue!148 lt!118393 (_1!2315 (tuple2!4609 lt!118294 (minValue!4189 thiss!1504))) (_2!2315 (tuple2!4609 lt!118294 (minValue!4189 thiss!1504)))))))

(assert (=> d!59029 (= lt!118393 (insertStrictlySorted!151 (toList!1776 lt!118279) (_1!2315 (tuple2!4609 lt!118294 (minValue!4189 thiss!1504))) (_2!2315 (tuple2!4609 lt!118294 (minValue!4189 thiss!1504)))))))

(assert (=> d!59029 (= (+!632 lt!118279 (tuple2!4609 lt!118294 (minValue!4189 thiss!1504))) lt!118395)))

(declare-fun b!234035 () Bool)

(declare-fun res!114818 () Bool)

(assert (=> b!234035 (=> (not res!114818) (not e!152010))))

(assert (=> b!234035 (= res!114818 (= (getValueByKey!263 (toList!1776 lt!118395) (_1!2315 (tuple2!4609 lt!118294 (minValue!4189 thiss!1504)))) (Some!268 (_2!2315 (tuple2!4609 lt!118294 (minValue!4189 thiss!1504))))))))

(declare-fun b!234036 () Bool)

(assert (=> b!234036 (= e!152010 (contains!1647 (toList!1776 lt!118395) (tuple2!4609 lt!118294 (minValue!4189 thiss!1504))))))

(assert (= (and d!59029 res!114817) b!234035))

(assert (= (and b!234035 res!114818) b!234036))

(declare-fun m!255359 () Bool)

(assert (=> d!59029 m!255359))

(declare-fun m!255361 () Bool)

(assert (=> d!59029 m!255361))

(declare-fun m!255363 () Bool)

(assert (=> d!59029 m!255363))

(declare-fun m!255365 () Bool)

(assert (=> d!59029 m!255365))

(declare-fun m!255367 () Bool)

(assert (=> b!234035 m!255367))

(declare-fun m!255369 () Bool)

(assert (=> b!234036 m!255369))

(assert (=> b!233824 d!59029))

(declare-fun d!59031 () Bool)

(declare-fun e!152011 () Bool)

(assert (=> d!59031 e!152011))

(declare-fun res!114819 () Bool)

(assert (=> d!59031 (=> (not res!114819) (not e!152011))))

(declare-fun lt!118399 () ListLongMap!3521)

(assert (=> d!59031 (= res!114819 (contains!1646 lt!118399 (_1!2315 (tuple2!4609 lt!118288 (minValue!4189 thiss!1504)))))))

(declare-fun lt!118397 () List!3519)

(assert (=> d!59031 (= lt!118399 (ListLongMap!3522 lt!118397))))

(declare-fun lt!118400 () Unit!7222)

(declare-fun lt!118398 () Unit!7222)

(assert (=> d!59031 (= lt!118400 lt!118398)))

(assert (=> d!59031 (= (getValueByKey!263 lt!118397 (_1!2315 (tuple2!4609 lt!118288 (minValue!4189 thiss!1504)))) (Some!268 (_2!2315 (tuple2!4609 lt!118288 (minValue!4189 thiss!1504)))))))

(assert (=> d!59031 (= lt!118398 (lemmaContainsTupThenGetReturnValue!148 lt!118397 (_1!2315 (tuple2!4609 lt!118288 (minValue!4189 thiss!1504))) (_2!2315 (tuple2!4609 lt!118288 (minValue!4189 thiss!1504)))))))

(assert (=> d!59031 (= lt!118397 (insertStrictlySorted!151 (toList!1776 lt!118290) (_1!2315 (tuple2!4609 lt!118288 (minValue!4189 thiss!1504))) (_2!2315 (tuple2!4609 lt!118288 (minValue!4189 thiss!1504)))))))

(assert (=> d!59031 (= (+!632 lt!118290 (tuple2!4609 lt!118288 (minValue!4189 thiss!1504))) lt!118399)))

(declare-fun b!234037 () Bool)

(declare-fun res!114820 () Bool)

(assert (=> b!234037 (=> (not res!114820) (not e!152011))))

(assert (=> b!234037 (= res!114820 (= (getValueByKey!263 (toList!1776 lt!118399) (_1!2315 (tuple2!4609 lt!118288 (minValue!4189 thiss!1504)))) (Some!268 (_2!2315 (tuple2!4609 lt!118288 (minValue!4189 thiss!1504))))))))

(declare-fun b!234038 () Bool)

(assert (=> b!234038 (= e!152011 (contains!1647 (toList!1776 lt!118399) (tuple2!4609 lt!118288 (minValue!4189 thiss!1504))))))

(assert (= (and d!59031 res!114819) b!234037))

(assert (= (and b!234037 res!114820) b!234038))

(declare-fun m!255371 () Bool)

(assert (=> d!59031 m!255371))

(declare-fun m!255373 () Bool)

(assert (=> d!59031 m!255373))

(declare-fun m!255375 () Bool)

(assert (=> d!59031 m!255375))

(declare-fun m!255377 () Bool)

(assert (=> d!59031 m!255377))

(declare-fun m!255379 () Bool)

(assert (=> b!234037 m!255379))

(declare-fun m!255381 () Bool)

(assert (=> b!234038 m!255381))

(assert (=> b!233824 d!59031))

(declare-fun d!59033 () Bool)

(assert (=> d!59033 (= (apply!205 (+!632 lt!118282 (tuple2!4609 lt!118283 (zeroValue!4189 thiss!1504))) lt!118277) (get!2820 (getValueByKey!263 (toList!1776 (+!632 lt!118282 (tuple2!4609 lt!118283 (zeroValue!4189 thiss!1504)))) lt!118277)))))

(declare-fun bs!8669 () Bool)

(assert (= bs!8669 d!59033))

(declare-fun m!255383 () Bool)

(assert (=> bs!8669 m!255383))

(assert (=> bs!8669 m!255383))

(declare-fun m!255385 () Bool)

(assert (=> bs!8669 m!255385))

(assert (=> b!233824 d!59033))

(declare-fun d!59035 () Bool)

(assert (=> d!59035 (= (apply!205 (+!632 lt!118290 (tuple2!4609 lt!118288 (minValue!4189 thiss!1504))) lt!118278) (get!2820 (getValueByKey!263 (toList!1776 (+!632 lt!118290 (tuple2!4609 lt!118288 (minValue!4189 thiss!1504)))) lt!118278)))))

(declare-fun bs!8670 () Bool)

(assert (= bs!8670 d!59035))

(declare-fun m!255387 () Bool)

(assert (=> bs!8670 m!255387))

(assert (=> bs!8670 m!255387))

(declare-fun m!255389 () Bool)

(assert (=> bs!8670 m!255389))

(assert (=> b!233824 d!59035))

(declare-fun d!59037 () Bool)

(assert (=> d!59037 (= (apply!205 (+!632 lt!118279 (tuple2!4609 lt!118294 (minValue!4189 thiss!1504))) lt!118281) (apply!205 lt!118279 lt!118281))))

(declare-fun lt!118401 () Unit!7222)

(assert (=> d!59037 (= lt!118401 (choose!1096 lt!118279 lt!118294 (minValue!4189 thiss!1504) lt!118281))))

(declare-fun e!152012 () Bool)

(assert (=> d!59037 e!152012))

(declare-fun res!114821 () Bool)

(assert (=> d!59037 (=> (not res!114821) (not e!152012))))

(assert (=> d!59037 (= res!114821 (contains!1646 lt!118279 lt!118281))))

(assert (=> d!59037 (= (addApplyDifferent!181 lt!118279 lt!118294 (minValue!4189 thiss!1504) lt!118281) lt!118401)))

(declare-fun b!234039 () Bool)

(assert (=> b!234039 (= e!152012 (not (= lt!118281 lt!118294)))))

(assert (= (and d!59037 res!114821) b!234039))

(assert (=> d!59037 m!255163))

(assert (=> d!59037 m!255177))

(assert (=> d!59037 m!255191))

(assert (=> d!59037 m!255163))

(declare-fun m!255391 () Bool)

(assert (=> d!59037 m!255391))

(declare-fun m!255393 () Bool)

(assert (=> d!59037 m!255393))

(assert (=> b!233824 d!59037))

(declare-fun d!59039 () Bool)

(assert (=> d!59039 (= (apply!205 lt!118282 lt!118277) (get!2820 (getValueByKey!263 (toList!1776 lt!118282) lt!118277)))))

(declare-fun bs!8671 () Bool)

(assert (= bs!8671 d!59039))

(declare-fun m!255395 () Bool)

(assert (=> bs!8671 m!255395))

(assert (=> bs!8671 m!255395))

(declare-fun m!255397 () Bool)

(assert (=> bs!8671 m!255397))

(assert (=> b!233824 d!59039))

(declare-fun d!59041 () Bool)

(assert (=> d!59041 (= (apply!205 lt!118279 lt!118281) (get!2820 (getValueByKey!263 (toList!1776 lt!118279) lt!118281)))))

(declare-fun bs!8672 () Bool)

(assert (= bs!8672 d!59041))

(declare-fun m!255399 () Bool)

(assert (=> bs!8672 m!255399))

(assert (=> bs!8672 m!255399))

(declare-fun m!255401 () Bool)

(assert (=> bs!8672 m!255401))

(assert (=> b!233824 d!59041))

(declare-fun d!59043 () Bool)

(assert (=> d!59043 (= (apply!205 (+!632 lt!118279 (tuple2!4609 lt!118294 (minValue!4189 thiss!1504))) lt!118281) (get!2820 (getValueByKey!263 (toList!1776 (+!632 lt!118279 (tuple2!4609 lt!118294 (minValue!4189 thiss!1504)))) lt!118281)))))

(declare-fun bs!8673 () Bool)

(assert (= bs!8673 d!59043))

(declare-fun m!255403 () Bool)

(assert (=> bs!8673 m!255403))

(assert (=> bs!8673 m!255403))

(declare-fun m!255405 () Bool)

(assert (=> bs!8673 m!255405))

(assert (=> b!233824 d!59043))

(declare-fun d!59045 () Bool)

(assert (=> d!59045 (= (apply!205 (+!632 lt!118282 (tuple2!4609 lt!118283 (zeroValue!4189 thiss!1504))) lt!118277) (apply!205 lt!118282 lt!118277))))

(declare-fun lt!118402 () Unit!7222)

(assert (=> d!59045 (= lt!118402 (choose!1096 lt!118282 lt!118283 (zeroValue!4189 thiss!1504) lt!118277))))

(declare-fun e!152013 () Bool)

(assert (=> d!59045 e!152013))

(declare-fun res!114822 () Bool)

(assert (=> d!59045 (=> (not res!114822) (not e!152013))))

(assert (=> d!59045 (= res!114822 (contains!1646 lt!118282 lt!118277))))

(assert (=> d!59045 (= (addApplyDifferent!181 lt!118282 lt!118283 (zeroValue!4189 thiss!1504) lt!118277) lt!118402)))

(declare-fun b!234040 () Bool)

(assert (=> b!234040 (= e!152013 (not (= lt!118277 lt!118283)))))

(assert (= (and d!59045 res!114822) b!234040))

(assert (=> d!59045 m!255167))

(assert (=> d!59045 m!255171))

(assert (=> d!59045 m!255185))

(assert (=> d!59045 m!255167))

(declare-fun m!255407 () Bool)

(assert (=> d!59045 m!255407))

(declare-fun m!255409 () Bool)

(assert (=> d!59045 m!255409))

(assert (=> b!233824 d!59045))

(declare-fun d!59047 () Bool)

(declare-fun e!152014 () Bool)

(assert (=> d!59047 e!152014))

(declare-fun res!114823 () Bool)

(assert (=> d!59047 (=> res!114823 e!152014)))

(declare-fun lt!118406 () Bool)

(assert (=> d!59047 (= res!114823 (not lt!118406))))

(declare-fun lt!118404 () Bool)

(assert (=> d!59047 (= lt!118406 lt!118404)))

(declare-fun lt!118403 () Unit!7222)

(declare-fun e!152015 () Unit!7222)

(assert (=> d!59047 (= lt!118403 e!152015)))

(declare-fun c!38968 () Bool)

(assert (=> d!59047 (= c!38968 lt!118404)))

(assert (=> d!59047 (= lt!118404 (containsKey!255 (toList!1776 (+!632 lt!118280 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504)))) lt!118293))))

(assert (=> d!59047 (= (contains!1646 (+!632 lt!118280 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504))) lt!118293) lt!118406)))

(declare-fun b!234041 () Bool)

(declare-fun lt!118405 () Unit!7222)

(assert (=> b!234041 (= e!152015 lt!118405)))

(assert (=> b!234041 (= lt!118405 (lemmaContainsKeyImpliesGetValueByKeyDefined!203 (toList!1776 (+!632 lt!118280 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504)))) lt!118293))))

(assert (=> b!234041 (isDefined!204 (getValueByKey!263 (toList!1776 (+!632 lt!118280 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504)))) lt!118293))))

(declare-fun b!234042 () Bool)

(declare-fun Unit!7228 () Unit!7222)

(assert (=> b!234042 (= e!152015 Unit!7228)))

(declare-fun b!234043 () Bool)

(assert (=> b!234043 (= e!152014 (isDefined!204 (getValueByKey!263 (toList!1776 (+!632 lt!118280 (tuple2!4609 lt!118291 (zeroValue!4189 thiss!1504)))) lt!118293)))))

(assert (= (and d!59047 c!38968) b!234041))

(assert (= (and d!59047 (not c!38968)) b!234042))

(assert (= (and d!59047 (not res!114823)) b!234043))

(declare-fun m!255411 () Bool)

(assert (=> d!59047 m!255411))

(declare-fun m!255413 () Bool)

(assert (=> b!234041 m!255413))

(declare-fun m!255415 () Bool)

(assert (=> b!234041 m!255415))

(assert (=> b!234041 m!255415))

(declare-fun m!255417 () Bool)

(assert (=> b!234041 m!255417))

(assert (=> b!234043 m!255415))

(assert (=> b!234043 m!255415))

(assert (=> b!234043 m!255417))

(assert (=> b!233824 d!59047))

(declare-fun d!59049 () Bool)

(declare-fun isEmpty!507 (Option!269) Bool)

(assert (=> d!59049 (= (isDefined!204 (getValueByKey!263 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))) key!932)) (not (isEmpty!507 (getValueByKey!263 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))) key!932))))))

(declare-fun bs!8674 () Bool)

(assert (= bs!8674 d!59049))

(assert (=> bs!8674 m!255139))

(declare-fun m!255419 () Bool)

(assert (=> bs!8674 m!255419))

(assert (=> b!233776 d!59049))

(declare-fun b!234054 () Bool)

(declare-fun e!152021 () Option!269)

(assert (=> b!234054 (= e!152021 (getValueByKey!263 (t!8482 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)))) key!932))))

(declare-fun b!234055 () Bool)

(assert (=> b!234055 (= e!152021 None!267)))

(declare-fun b!234053 () Bool)

(declare-fun e!152020 () Option!269)

(assert (=> b!234053 (= e!152020 e!152021)))

(declare-fun c!38974 () Bool)

(assert (=> b!234053 (= c!38974 (and ((_ is Cons!3515) (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)))) (not (= (_1!2315 (h!4164 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))))) key!932))))))

(declare-fun d!59051 () Bool)

(declare-fun c!38973 () Bool)

(assert (=> d!59051 (= c!38973 (and ((_ is Cons!3515) (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)))) (= (_1!2315 (h!4164 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))))) key!932)))))

(assert (=> d!59051 (= (getValueByKey!263 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))) key!932) e!152020)))

(declare-fun b!234052 () Bool)

(assert (=> b!234052 (= e!152020 (Some!268 (_2!2315 (h!4164 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)))))))))

(assert (= (and d!59051 c!38973) b!234052))

(assert (= (and d!59051 (not c!38973)) b!234053))

(assert (= (and b!234053 c!38974) b!234054))

(assert (= (and b!234053 (not c!38974)) b!234055))

(declare-fun m!255421 () Bool)

(assert (=> b!234054 m!255421))

(assert (=> b!233776 d!59051))

(declare-fun d!59053 () Bool)

(assert (=> d!59053 (isDefined!204 (getValueByKey!263 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))) key!932))))

(declare-fun lt!118409 () Unit!7222)

(declare-fun choose!1097 (List!3519 (_ BitVec 64)) Unit!7222)

(assert (=> d!59053 (= lt!118409 (choose!1097 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))) key!932))))

(declare-fun e!152024 () Bool)

(assert (=> d!59053 e!152024))

(declare-fun res!114826 () Bool)

(assert (=> d!59053 (=> (not res!114826) (not e!152024))))

(declare-fun isStrictlySorted!360 (List!3519) Bool)

(assert (=> d!59053 (= res!114826 (isStrictlySorted!360 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504)))))))

(assert (=> d!59053 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!203 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))) key!932) lt!118409)))

(declare-fun b!234058 () Bool)

(assert (=> b!234058 (= e!152024 (containsKey!255 (toList!1776 (getCurrentListMap!1304 (_keys!6407 thiss!1504) (_values!4331 thiss!1504) (mask!10282 thiss!1504) (extraKeys!4085 thiss!1504) (zeroValue!4189 thiss!1504) (minValue!4189 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4348 thiss!1504))) key!932))))

(assert (= (and d!59053 res!114826) b!234058))

(assert (=> d!59053 m!255139))

(assert (=> d!59053 m!255139))

(assert (=> d!59053 m!255141))

(declare-fun m!255423 () Bool)

(assert (=> d!59053 m!255423))

(declare-fun m!255425 () Bool)

(assert (=> d!59053 m!255425))

(assert (=> b!234058 m!255135))

(assert (=> b!233774 d!59053))

(assert (=> b!233774 d!59049))

(assert (=> b!233774 d!59051))

(assert (=> bm!21745 d!59027))

(declare-fun d!59055 () Bool)

(declare-fun e!152025 () Bool)

(assert (=> d!59055 e!152025))

(declare-fun res!114827 () Bool)

(assert (=> d!59055 (=> res!114827 e!152025)))

(declare-fun lt!118413 () Bool)

(assert (=> d!59055 (= res!114827 (not lt!118413))))

(declare-fun lt!118411 () Bool)

(assert (=> d!59055 (= lt!118413 lt!118411)))

(declare-fun lt!118410 () Unit!7222)

(declare-fun e!152026 () Unit!7222)

(assert (=> d!59055 (= lt!118410 e!152026)))

(declare-fun c!38975 () Bool)

(assert (=> d!59055 (= c!38975 lt!118411)))

(assert (=> d!59055 (= lt!118411 (containsKey!255 (toList!1776 lt!118289) (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59055 (= (contains!1646 lt!118289 (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)) lt!118413)))

(declare-fun b!234059 () Bool)

(declare-fun lt!118412 () Unit!7222)

(assert (=> b!234059 (= e!152026 lt!118412)))

(assert (=> b!234059 (= lt!118412 (lemmaContainsKeyImpliesGetValueByKeyDefined!203 (toList!1776 lt!118289) (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234059 (isDefined!204 (getValueByKey!263 (toList!1776 lt!118289) (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234060 () Bool)

(declare-fun Unit!7229 () Unit!7222)

(assert (=> b!234060 (= e!152026 Unit!7229)))

(declare-fun b!234061 () Bool)

(assert (=> b!234061 (= e!152025 (isDefined!204 (getValueByKey!263 (toList!1776 lt!118289) (select (arr!5501 (_keys!6407 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59055 c!38975) b!234059))

(assert (= (and d!59055 (not c!38975)) b!234060))

(assert (= (and d!59055 (not res!114827)) b!234061))

(assert (=> d!59055 m!255145))

(declare-fun m!255427 () Bool)

(assert (=> d!59055 m!255427))

(assert (=> b!234059 m!255145))

(declare-fun m!255429 () Bool)

(assert (=> b!234059 m!255429))

(assert (=> b!234059 m!255145))

(assert (=> b!234059 m!255277))

(assert (=> b!234059 m!255277))

(declare-fun m!255431 () Bool)

(assert (=> b!234059 m!255431))

(assert (=> b!234061 m!255145))

(assert (=> b!234061 m!255277))

(assert (=> b!234061 m!255277))

(assert (=> b!234061 m!255431))

(assert (=> b!233832 d!59055))

(declare-fun b!234063 () Bool)

(declare-fun e!152027 () Bool)

(assert (=> b!234063 (= e!152027 tp_is_empty!6159)))

(declare-fun mapIsEmpty!10422 () Bool)

(declare-fun mapRes!10422 () Bool)

(assert (=> mapIsEmpty!10422 mapRes!10422))

(declare-fun condMapEmpty!10422 () Bool)

(declare-fun mapDefault!10422 () ValueCell!2736)

(assert (=> mapNonEmpty!10421 (= condMapEmpty!10422 (= mapRest!10421 ((as const (Array (_ BitVec 32) ValueCell!2736)) mapDefault!10422)))))

(assert (=> mapNonEmpty!10421 (= tp!22049 (and e!152027 mapRes!10422))))

(declare-fun b!234062 () Bool)

(declare-fun e!152028 () Bool)

(assert (=> b!234062 (= e!152028 tp_is_empty!6159)))

(declare-fun mapNonEmpty!10422 () Bool)

(declare-fun tp!22050 () Bool)

(assert (=> mapNonEmpty!10422 (= mapRes!10422 (and tp!22050 e!152028))))

(declare-fun mapValue!10422 () ValueCell!2736)

(declare-fun mapRest!10422 () (Array (_ BitVec 32) ValueCell!2736))

(declare-fun mapKey!10422 () (_ BitVec 32))

(assert (=> mapNonEmpty!10422 (= mapRest!10421 (store mapRest!10422 mapKey!10422 mapValue!10422))))

(assert (= (and mapNonEmpty!10421 condMapEmpty!10422) mapIsEmpty!10422))

(assert (= (and mapNonEmpty!10421 (not condMapEmpty!10422)) mapNonEmpty!10422))

(assert (= (and mapNonEmpty!10422 ((_ is ValueCellFull!2736) mapValue!10422)) b!234062))

(assert (= (and mapNonEmpty!10421 ((_ is ValueCellFull!2736) mapDefault!10422)) b!234063))

(declare-fun m!255433 () Bool)

(assert (=> mapNonEmpty!10422 m!255433))

(declare-fun b_lambda!7867 () Bool)

(assert (= b_lambda!7863 (or (and b!233726 b_free!6297) b_lambda!7867)))

(declare-fun b_lambda!7869 () Bool)

(assert (= b_lambda!7865 (or (and b!233726 b_free!6297) b_lambda!7869)))

(check-sat (not b!234032) (not b!233926) (not b!233910) (not d!59037) b_and!13211 (not d!59015) (not b!233984) (not b!234054) (not d!59029) (not d!59055) (not d!59003) (not b!233911) (not b!233876) (not b!233897) (not b!233882) (not b!233966) (not bm!21759) (not b!233992) (not b!234029) (not bm!21756) (not b!234033) (not b!233942) (not b!234035) (not b!233873) (not d!59053) (not b!234041) (not b!233931) (not d!58989) (not b_lambda!7869) (not b!233893) (not d!59001) (not d!58983) (not b!233881) (not d!59047) (not d!59039) (not b!233922) (not d!59021) (not d!59049) (not b!233906) (not d!59019) (not b!233874) (not b!233993) (not d!59033) (not d!59027) (not d!58993) (not d!58987) (not b!234059) (not d!59035) (not b!234036) (not b!233994) (not d!59023) (not b!234038) (not b_lambda!7861) (not d!59009) (not b!234061) tp_is_empty!6159 (not b!234028) (not d!59007) (not b!234025) (not b!233991) (not b!234058) (not b_lambda!7867) (not b!234043) (not d!58997) (not b!234024) (not d!59017) (not b!233943) (not d!59025) (not b_next!6297) (not d!59031) (not bm!21753) (not b!233924) (not mapNonEmpty!10422) (not bm!21762) (not b!233923) (not d!59041) (not d!59043) (not b!234027) (not d!59045) (not b!233932) (not b!233894) (not b!234037) (not b!234023))
(check-sat b_and!13211 (not b_next!6297))
