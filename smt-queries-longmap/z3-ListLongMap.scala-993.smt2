; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21416 () Bool)

(assert start!21416)

(declare-fun b!215149 () Bool)

(declare-fun b_free!5707 () Bool)

(declare-fun b_next!5707 () Bool)

(assert (=> b!215149 (= b_free!5707 (not b_next!5707))))

(declare-fun tp!20228 () Bool)

(declare-fun b_and!12611 () Bool)

(assert (=> b!215149 (= tp!20228 b_and!12611)))

(declare-fun mapIsEmpty!9488 () Bool)

(declare-fun mapRes!9488 () Bool)

(assert (=> mapIsEmpty!9488 mapRes!9488))

(declare-fun b!215142 () Bool)

(declare-fun res!105270 () Bool)

(declare-fun e!139939 () Bool)

(assert (=> b!215142 (=> (not res!105270) (not e!139939))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!215142 (= res!105270 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!9488 () Bool)

(declare-fun tp!20227 () Bool)

(declare-fun e!139940 () Bool)

(assert (=> mapNonEmpty!9488 (= mapRes!9488 (and tp!20227 e!139940))))

(declare-datatypes ((V!7073 0))(
  ( (V!7074 (val!2829 Int)) )
))
(declare-datatypes ((ValueCell!2441 0))(
  ( (ValueCellFull!2441 (v!4848 V!7073)) (EmptyCell!2441) )
))
(declare-fun mapRest!9488 () (Array (_ BitVec 32) ValueCell!2441))

(declare-datatypes ((array!10359 0))(
  ( (array!10360 (arr!4909 (Array (_ BitVec 32) ValueCell!2441)) (size!5237 (_ BitVec 32))) )
))
(declare-datatypes ((array!10361 0))(
  ( (array!10362 (arr!4910 (Array (_ BitVec 32) (_ BitVec 64))) (size!5238 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2782 0))(
  ( (LongMapFixedSize!2783 (defaultEntry!4041 Int) (mask!9727 (_ BitVec 32)) (extraKeys!3778 (_ BitVec 32)) (zeroValue!3882 V!7073) (minValue!3882 V!7073) (_size!1440 (_ BitVec 32)) (_keys!6067 array!10361) (_values!4024 array!10359) (_vacant!1440 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2782)

(declare-fun mapKey!9488 () (_ BitVec 32))

(declare-fun mapValue!9488 () ValueCell!2441)

(assert (=> mapNonEmpty!9488 (= (arr!4909 (_values!4024 thiss!1504)) (store mapRest!9488 mapKey!9488 mapValue!9488))))

(declare-fun b!215143 () Bool)

(declare-fun e!139938 () Bool)

(declare-fun e!139937 () Bool)

(assert (=> b!215143 (= e!139938 (and e!139937 mapRes!9488))))

(declare-fun condMapEmpty!9488 () Bool)

(declare-fun mapDefault!9488 () ValueCell!2441)

(assert (=> b!215143 (= condMapEmpty!9488 (= (arr!4909 (_values!4024 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2441)) mapDefault!9488)))))

(declare-fun b!215144 () Bool)

(declare-fun e!139941 () Bool)

(assert (=> b!215144 (= e!139939 e!139941)))

(declare-fun res!105269 () Bool)

(assert (=> b!215144 (=> (not res!105269) (not e!139941))))

(declare-datatypes ((SeekEntryResult!717 0))(
  ( (MissingZero!717 (index!5038 (_ BitVec 32))) (Found!717 (index!5039 (_ BitVec 32))) (Intermediate!717 (undefined!1529 Bool) (index!5040 (_ BitVec 32)) (x!22449 (_ BitVec 32))) (Undefined!717) (MissingVacant!717 (index!5041 (_ BitVec 32))) )
))
(declare-fun lt!110936 () SeekEntryResult!717)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215144 (= res!105269 (or (= lt!110936 (MissingZero!717 index!297)) (= lt!110936 (MissingVacant!717 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10361 (_ BitVec 32)) SeekEntryResult!717)

(assert (=> b!215144 (= lt!110936 (seekEntryOrOpen!0 key!932 (_keys!6067 thiss!1504) (mask!9727 thiss!1504)))))

(declare-fun res!105271 () Bool)

(assert (=> start!21416 (=> (not res!105271) (not e!139939))))

(declare-fun valid!1155 (LongMapFixedSize!2782) Bool)

(assert (=> start!21416 (= res!105271 (valid!1155 thiss!1504))))

(assert (=> start!21416 e!139939))

(declare-fun e!139943 () Bool)

(assert (=> start!21416 e!139943))

(assert (=> start!21416 true))

(declare-fun b!215145 () Bool)

(assert (=> b!215145 (= e!139941 (not (= (size!5237 (_values!4024 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9727 thiss!1504)))))))

(declare-fun b!215146 () Bool)

(declare-fun tp_is_empty!5569 () Bool)

(assert (=> b!215146 (= e!139937 tp_is_empty!5569)))

(declare-fun b!215147 () Bool)

(declare-fun res!105272 () Bool)

(assert (=> b!215147 (=> (not res!105272) (not e!139941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215147 (= res!105272 (validMask!0 (mask!9727 thiss!1504)))))

(declare-fun b!215148 () Bool)

(assert (=> b!215148 (= e!139940 tp_is_empty!5569)))

(declare-fun array_inv!3225 (array!10361) Bool)

(declare-fun array_inv!3226 (array!10359) Bool)

(assert (=> b!215149 (= e!139943 (and tp!20228 tp_is_empty!5569 (array_inv!3225 (_keys!6067 thiss!1504)) (array_inv!3226 (_values!4024 thiss!1504)) e!139938))))

(assert (= (and start!21416 res!105271) b!215142))

(assert (= (and b!215142 res!105270) b!215144))

(assert (= (and b!215144 res!105269) b!215147))

(assert (= (and b!215147 res!105272) b!215145))

(assert (= (and b!215143 condMapEmpty!9488) mapIsEmpty!9488))

(assert (= (and b!215143 (not condMapEmpty!9488)) mapNonEmpty!9488))

(get-info :version)

(assert (= (and mapNonEmpty!9488 ((_ is ValueCellFull!2441) mapValue!9488)) b!215148))

(assert (= (and b!215143 ((_ is ValueCellFull!2441) mapDefault!9488)) b!215146))

(assert (= b!215149 b!215143))

(assert (= start!21416 b!215149))

(declare-fun m!242655 () Bool)

(assert (=> b!215147 m!242655))

(declare-fun m!242657 () Bool)

(assert (=> start!21416 m!242657))

(declare-fun m!242659 () Bool)

(assert (=> mapNonEmpty!9488 m!242659))

(declare-fun m!242661 () Bool)

(assert (=> b!215144 m!242661))

(declare-fun m!242663 () Bool)

(assert (=> b!215149 m!242663))

(declare-fun m!242665 () Bool)

(assert (=> b!215149 m!242665))

(check-sat b_and!12611 (not b!215147) tp_is_empty!5569 (not start!21416) (not mapNonEmpty!9488) (not b!215149) (not b_next!5707) (not b!215144))
(check-sat b_and!12611 (not b_next!5707))
(get-model)

(declare-fun d!58469 () Bool)

(assert (=> d!58469 (= (validMask!0 (mask!9727 thiss!1504)) (and (or (= (mask!9727 thiss!1504) #b00000000000000000000000000000111) (= (mask!9727 thiss!1504) #b00000000000000000000000000001111) (= (mask!9727 thiss!1504) #b00000000000000000000000000011111) (= (mask!9727 thiss!1504) #b00000000000000000000000000111111) (= (mask!9727 thiss!1504) #b00000000000000000000000001111111) (= (mask!9727 thiss!1504) #b00000000000000000000000011111111) (= (mask!9727 thiss!1504) #b00000000000000000000000111111111) (= (mask!9727 thiss!1504) #b00000000000000000000001111111111) (= (mask!9727 thiss!1504) #b00000000000000000000011111111111) (= (mask!9727 thiss!1504) #b00000000000000000000111111111111) (= (mask!9727 thiss!1504) #b00000000000000000001111111111111) (= (mask!9727 thiss!1504) #b00000000000000000011111111111111) (= (mask!9727 thiss!1504) #b00000000000000000111111111111111) (= (mask!9727 thiss!1504) #b00000000000000001111111111111111) (= (mask!9727 thiss!1504) #b00000000000000011111111111111111) (= (mask!9727 thiss!1504) #b00000000000000111111111111111111) (= (mask!9727 thiss!1504) #b00000000000001111111111111111111) (= (mask!9727 thiss!1504) #b00000000000011111111111111111111) (= (mask!9727 thiss!1504) #b00000000000111111111111111111111) (= (mask!9727 thiss!1504) #b00000000001111111111111111111111) (= (mask!9727 thiss!1504) #b00000000011111111111111111111111) (= (mask!9727 thiss!1504) #b00000000111111111111111111111111) (= (mask!9727 thiss!1504) #b00000001111111111111111111111111) (= (mask!9727 thiss!1504) #b00000011111111111111111111111111) (= (mask!9727 thiss!1504) #b00000111111111111111111111111111) (= (mask!9727 thiss!1504) #b00001111111111111111111111111111) (= (mask!9727 thiss!1504) #b00011111111111111111111111111111) (= (mask!9727 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9727 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215147 d!58469))

(declare-fun d!58471 () Bool)

(declare-fun res!105303 () Bool)

(declare-fun e!139988 () Bool)

(assert (=> d!58471 (=> (not res!105303) (not e!139988))))

(declare-fun simpleValid!216 (LongMapFixedSize!2782) Bool)

(assert (=> d!58471 (= res!105303 (simpleValid!216 thiss!1504))))

(assert (=> d!58471 (= (valid!1155 thiss!1504) e!139988)))

(declare-fun b!215204 () Bool)

(declare-fun res!105304 () Bool)

(assert (=> b!215204 (=> (not res!105304) (not e!139988))))

(declare-fun arrayCountValidKeys!0 (array!10361 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215204 (= res!105304 (= (arrayCountValidKeys!0 (_keys!6067 thiss!1504) #b00000000000000000000000000000000 (size!5238 (_keys!6067 thiss!1504))) (_size!1440 thiss!1504)))))

(declare-fun b!215205 () Bool)

(declare-fun res!105305 () Bool)

(assert (=> b!215205 (=> (not res!105305) (not e!139988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10361 (_ BitVec 32)) Bool)

(assert (=> b!215205 (= res!105305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6067 thiss!1504) (mask!9727 thiss!1504)))))

(declare-fun b!215206 () Bool)

(declare-datatypes ((List!3070 0))(
  ( (Nil!3067) (Cons!3066 (h!3709 (_ BitVec 64)) (t!8017 List!3070)) )
))
(declare-fun arrayNoDuplicates!0 (array!10361 (_ BitVec 32) List!3070) Bool)

(assert (=> b!215206 (= e!139988 (arrayNoDuplicates!0 (_keys!6067 thiss!1504) #b00000000000000000000000000000000 Nil!3067))))

(assert (= (and d!58471 res!105303) b!215204))

(assert (= (and b!215204 res!105304) b!215205))

(assert (= (and b!215205 res!105305) b!215206))

(declare-fun m!242691 () Bool)

(assert (=> d!58471 m!242691))

(declare-fun m!242693 () Bool)

(assert (=> b!215204 m!242693))

(declare-fun m!242695 () Bool)

(assert (=> b!215205 m!242695))

(declare-fun m!242697 () Bool)

(assert (=> b!215206 m!242697))

(assert (=> start!21416 d!58471))

(declare-fun d!58473 () Bool)

(assert (=> d!58473 (= (array_inv!3225 (_keys!6067 thiss!1504)) (bvsge (size!5238 (_keys!6067 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215149 d!58473))

(declare-fun d!58475 () Bool)

(assert (=> d!58475 (= (array_inv!3226 (_values!4024 thiss!1504)) (bvsge (size!5237 (_values!4024 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215149 d!58475))

(declare-fun b!215219 () Bool)

(declare-fun e!139997 () SeekEntryResult!717)

(declare-fun lt!110951 () SeekEntryResult!717)

(assert (=> b!215219 (= e!139997 (MissingZero!717 (index!5040 lt!110951)))))

(declare-fun b!215220 () Bool)

(declare-fun e!139996 () SeekEntryResult!717)

(assert (=> b!215220 (= e!139996 Undefined!717)))

(declare-fun b!215221 () Bool)

(declare-fun c!36144 () Bool)

(declare-fun lt!110950 () (_ BitVec 64))

(assert (=> b!215221 (= c!36144 (= lt!110950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!139995 () SeekEntryResult!717)

(assert (=> b!215221 (= e!139995 e!139997)))

(declare-fun b!215222 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10361 (_ BitVec 32)) SeekEntryResult!717)

(assert (=> b!215222 (= e!139997 (seekKeyOrZeroReturnVacant!0 (x!22449 lt!110951) (index!5040 lt!110951) (index!5040 lt!110951) key!932 (_keys!6067 thiss!1504) (mask!9727 thiss!1504)))))

(declare-fun b!215223 () Bool)

(assert (=> b!215223 (= e!139996 e!139995)))

(assert (=> b!215223 (= lt!110950 (select (arr!4910 (_keys!6067 thiss!1504)) (index!5040 lt!110951)))))

(declare-fun c!36142 () Bool)

(assert (=> b!215223 (= c!36142 (= lt!110950 key!932))))

(declare-fun d!58477 () Bool)

(declare-fun lt!110949 () SeekEntryResult!717)

(assert (=> d!58477 (and (or ((_ is Undefined!717) lt!110949) (not ((_ is Found!717) lt!110949)) (and (bvsge (index!5039 lt!110949) #b00000000000000000000000000000000) (bvslt (index!5039 lt!110949) (size!5238 (_keys!6067 thiss!1504))))) (or ((_ is Undefined!717) lt!110949) ((_ is Found!717) lt!110949) (not ((_ is MissingZero!717) lt!110949)) (and (bvsge (index!5038 lt!110949) #b00000000000000000000000000000000) (bvslt (index!5038 lt!110949) (size!5238 (_keys!6067 thiss!1504))))) (or ((_ is Undefined!717) lt!110949) ((_ is Found!717) lt!110949) ((_ is MissingZero!717) lt!110949) (not ((_ is MissingVacant!717) lt!110949)) (and (bvsge (index!5041 lt!110949) #b00000000000000000000000000000000) (bvslt (index!5041 lt!110949) (size!5238 (_keys!6067 thiss!1504))))) (or ((_ is Undefined!717) lt!110949) (ite ((_ is Found!717) lt!110949) (= (select (arr!4910 (_keys!6067 thiss!1504)) (index!5039 lt!110949)) key!932) (ite ((_ is MissingZero!717) lt!110949) (= (select (arr!4910 (_keys!6067 thiss!1504)) (index!5038 lt!110949)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!717) lt!110949) (= (select (arr!4910 (_keys!6067 thiss!1504)) (index!5041 lt!110949)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58477 (= lt!110949 e!139996)))

(declare-fun c!36143 () Bool)

(assert (=> d!58477 (= c!36143 (and ((_ is Intermediate!717) lt!110951) (undefined!1529 lt!110951)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10361 (_ BitVec 32)) SeekEntryResult!717)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58477 (= lt!110951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9727 thiss!1504)) key!932 (_keys!6067 thiss!1504) (mask!9727 thiss!1504)))))

(assert (=> d!58477 (validMask!0 (mask!9727 thiss!1504))))

(assert (=> d!58477 (= (seekEntryOrOpen!0 key!932 (_keys!6067 thiss!1504) (mask!9727 thiss!1504)) lt!110949)))

(declare-fun b!215224 () Bool)

(assert (=> b!215224 (= e!139995 (Found!717 (index!5040 lt!110951)))))

(assert (= (and d!58477 c!36143) b!215220))

(assert (= (and d!58477 (not c!36143)) b!215223))

(assert (= (and b!215223 c!36142) b!215224))

(assert (= (and b!215223 (not c!36142)) b!215221))

(assert (= (and b!215221 c!36144) b!215219))

(assert (= (and b!215221 (not c!36144)) b!215222))

(declare-fun m!242699 () Bool)

(assert (=> b!215222 m!242699))

(declare-fun m!242701 () Bool)

(assert (=> b!215223 m!242701))

(declare-fun m!242703 () Bool)

(assert (=> d!58477 m!242703))

(declare-fun m!242705 () Bool)

(assert (=> d!58477 m!242705))

(assert (=> d!58477 m!242705))

(declare-fun m!242707 () Bool)

(assert (=> d!58477 m!242707))

(declare-fun m!242709 () Bool)

(assert (=> d!58477 m!242709))

(declare-fun m!242711 () Bool)

(assert (=> d!58477 m!242711))

(assert (=> d!58477 m!242655))

(assert (=> b!215144 d!58477))

(declare-fun b!215232 () Bool)

(declare-fun e!140002 () Bool)

(assert (=> b!215232 (= e!140002 tp_is_empty!5569)))

(declare-fun mapNonEmpty!9497 () Bool)

(declare-fun mapRes!9497 () Bool)

(declare-fun tp!20243 () Bool)

(declare-fun e!140003 () Bool)

(assert (=> mapNonEmpty!9497 (= mapRes!9497 (and tp!20243 e!140003))))

(declare-fun mapKey!9497 () (_ BitVec 32))

(declare-fun mapRest!9497 () (Array (_ BitVec 32) ValueCell!2441))

(declare-fun mapValue!9497 () ValueCell!2441)

(assert (=> mapNonEmpty!9497 (= mapRest!9488 (store mapRest!9497 mapKey!9497 mapValue!9497))))

(declare-fun b!215231 () Bool)

(assert (=> b!215231 (= e!140003 tp_is_empty!5569)))

(declare-fun condMapEmpty!9497 () Bool)

(declare-fun mapDefault!9497 () ValueCell!2441)

(assert (=> mapNonEmpty!9488 (= condMapEmpty!9497 (= mapRest!9488 ((as const (Array (_ BitVec 32) ValueCell!2441)) mapDefault!9497)))))

(assert (=> mapNonEmpty!9488 (= tp!20227 (and e!140002 mapRes!9497))))

(declare-fun mapIsEmpty!9497 () Bool)

(assert (=> mapIsEmpty!9497 mapRes!9497))

(assert (= (and mapNonEmpty!9488 condMapEmpty!9497) mapIsEmpty!9497))

(assert (= (and mapNonEmpty!9488 (not condMapEmpty!9497)) mapNonEmpty!9497))

(assert (= (and mapNonEmpty!9497 ((_ is ValueCellFull!2441) mapValue!9497)) b!215231))

(assert (= (and mapNonEmpty!9488 ((_ is ValueCellFull!2441) mapDefault!9497)) b!215232))

(declare-fun m!242713 () Bool)

(assert (=> mapNonEmpty!9497 m!242713))

(check-sat b_and!12611 tp_is_empty!5569 (not mapNonEmpty!9497) (not b!215205) (not b!215222) (not b_next!5707) (not d!58471) (not b!215206) (not b!215204) (not d!58477))
(check-sat b_and!12611 (not b_next!5707))
(get-model)

(declare-fun b!215243 () Bool)

(declare-fun e!140014 () Bool)

(declare-fun contains!1411 (List!3070 (_ BitVec 64)) Bool)

(assert (=> b!215243 (= e!140014 (contains!1411 Nil!3067 (select (arr!4910 (_keys!6067 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215244 () Bool)

(declare-fun e!140015 () Bool)

(declare-fun e!140013 () Bool)

(assert (=> b!215244 (= e!140015 e!140013)))

(declare-fun c!36147 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!215244 (= c!36147 (validKeyInArray!0 (select (arr!4910 (_keys!6067 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215245 () Bool)

(declare-fun call!20322 () Bool)

(assert (=> b!215245 (= e!140013 call!20322)))

(declare-fun d!58479 () Bool)

(declare-fun res!105314 () Bool)

(declare-fun e!140012 () Bool)

(assert (=> d!58479 (=> res!105314 e!140012)))

(assert (=> d!58479 (= res!105314 (bvsge #b00000000000000000000000000000000 (size!5238 (_keys!6067 thiss!1504))))))

(assert (=> d!58479 (= (arrayNoDuplicates!0 (_keys!6067 thiss!1504) #b00000000000000000000000000000000 Nil!3067) e!140012)))

(declare-fun bm!20319 () Bool)

(assert (=> bm!20319 (= call!20322 (arrayNoDuplicates!0 (_keys!6067 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36147 (Cons!3066 (select (arr!4910 (_keys!6067 thiss!1504)) #b00000000000000000000000000000000) Nil!3067) Nil!3067)))))

(declare-fun b!215246 () Bool)

(assert (=> b!215246 (= e!140013 call!20322)))

(declare-fun b!215247 () Bool)

(assert (=> b!215247 (= e!140012 e!140015)))

(declare-fun res!105312 () Bool)

(assert (=> b!215247 (=> (not res!105312) (not e!140015))))

(assert (=> b!215247 (= res!105312 (not e!140014))))

(declare-fun res!105313 () Bool)

(assert (=> b!215247 (=> (not res!105313) (not e!140014))))

(assert (=> b!215247 (= res!105313 (validKeyInArray!0 (select (arr!4910 (_keys!6067 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58479 (not res!105314)) b!215247))

(assert (= (and b!215247 res!105313) b!215243))

(assert (= (and b!215247 res!105312) b!215244))

(assert (= (and b!215244 c!36147) b!215245))

(assert (= (and b!215244 (not c!36147)) b!215246))

(assert (= (or b!215245 b!215246) bm!20319))

(declare-fun m!242715 () Bool)

(assert (=> b!215243 m!242715))

(assert (=> b!215243 m!242715))

(declare-fun m!242717 () Bool)

(assert (=> b!215243 m!242717))

(assert (=> b!215244 m!242715))

(assert (=> b!215244 m!242715))

(declare-fun m!242719 () Bool)

(assert (=> b!215244 m!242719))

(assert (=> bm!20319 m!242715))

(declare-fun m!242721 () Bool)

(assert (=> bm!20319 m!242721))

(assert (=> b!215247 m!242715))

(assert (=> b!215247 m!242715))

(assert (=> b!215247 m!242719))

(assert (=> b!215206 d!58479))

(declare-fun b!215260 () Bool)

(declare-fun e!140023 () SeekEntryResult!717)

(declare-fun e!140024 () SeekEntryResult!717)

(assert (=> b!215260 (= e!140023 e!140024)))

(declare-fun c!36154 () Bool)

(declare-fun lt!110956 () (_ BitVec 64))

(assert (=> b!215260 (= c!36154 (= lt!110956 key!932))))

(declare-fun b!215261 () Bool)

(declare-fun e!140022 () SeekEntryResult!717)

(assert (=> b!215261 (= e!140022 (MissingVacant!717 (index!5040 lt!110951)))))

(declare-fun b!215262 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215262 (= e!140022 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22449 lt!110951) #b00000000000000000000000000000001) (nextIndex!0 (index!5040 lt!110951) (bvadd (x!22449 lt!110951) #b00000000000000000000000000000001) (mask!9727 thiss!1504)) (index!5040 lt!110951) key!932 (_keys!6067 thiss!1504) (mask!9727 thiss!1504)))))

(declare-fun d!58481 () Bool)

(declare-fun lt!110957 () SeekEntryResult!717)

(assert (=> d!58481 (and (or ((_ is Undefined!717) lt!110957) (not ((_ is Found!717) lt!110957)) (and (bvsge (index!5039 lt!110957) #b00000000000000000000000000000000) (bvslt (index!5039 lt!110957) (size!5238 (_keys!6067 thiss!1504))))) (or ((_ is Undefined!717) lt!110957) ((_ is Found!717) lt!110957) (not ((_ is MissingVacant!717) lt!110957)) (not (= (index!5041 lt!110957) (index!5040 lt!110951))) (and (bvsge (index!5041 lt!110957) #b00000000000000000000000000000000) (bvslt (index!5041 lt!110957) (size!5238 (_keys!6067 thiss!1504))))) (or ((_ is Undefined!717) lt!110957) (ite ((_ is Found!717) lt!110957) (= (select (arr!4910 (_keys!6067 thiss!1504)) (index!5039 lt!110957)) key!932) (and ((_ is MissingVacant!717) lt!110957) (= (index!5041 lt!110957) (index!5040 lt!110951)) (= (select (arr!4910 (_keys!6067 thiss!1504)) (index!5041 lt!110957)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58481 (= lt!110957 e!140023)))

(declare-fun c!36156 () Bool)

(assert (=> d!58481 (= c!36156 (bvsge (x!22449 lt!110951) #b01111111111111111111111111111110))))

(assert (=> d!58481 (= lt!110956 (select (arr!4910 (_keys!6067 thiss!1504)) (index!5040 lt!110951)))))

(assert (=> d!58481 (validMask!0 (mask!9727 thiss!1504))))

(assert (=> d!58481 (= (seekKeyOrZeroReturnVacant!0 (x!22449 lt!110951) (index!5040 lt!110951) (index!5040 lt!110951) key!932 (_keys!6067 thiss!1504) (mask!9727 thiss!1504)) lt!110957)))

(declare-fun b!215263 () Bool)

(assert (=> b!215263 (= e!140024 (Found!717 (index!5040 lt!110951)))))

(declare-fun b!215264 () Bool)

(declare-fun c!36155 () Bool)

(assert (=> b!215264 (= c!36155 (= lt!110956 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215264 (= e!140024 e!140022)))

(declare-fun b!215265 () Bool)

(assert (=> b!215265 (= e!140023 Undefined!717)))

(assert (= (and d!58481 c!36156) b!215265))

(assert (= (and d!58481 (not c!36156)) b!215260))

(assert (= (and b!215260 c!36154) b!215263))

(assert (= (and b!215260 (not c!36154)) b!215264))

(assert (= (and b!215264 c!36155) b!215261))

(assert (= (and b!215264 (not c!36155)) b!215262))

(declare-fun m!242723 () Bool)

(assert (=> b!215262 m!242723))

(assert (=> b!215262 m!242723))

(declare-fun m!242725 () Bool)

(assert (=> b!215262 m!242725))

(declare-fun m!242727 () Bool)

(assert (=> d!58481 m!242727))

(declare-fun m!242729 () Bool)

(assert (=> d!58481 m!242729))

(assert (=> d!58481 m!242701))

(assert (=> d!58481 m!242655))

(assert (=> b!215222 d!58481))

(declare-fun b!215274 () Bool)

(declare-fun res!105324 () Bool)

(declare-fun e!140027 () Bool)

(assert (=> b!215274 (=> (not res!105324) (not e!140027))))

(assert (=> b!215274 (= res!105324 (and (= (size!5237 (_values!4024 thiss!1504)) (bvadd (mask!9727 thiss!1504) #b00000000000000000000000000000001)) (= (size!5238 (_keys!6067 thiss!1504)) (size!5237 (_values!4024 thiss!1504))) (bvsge (_size!1440 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1440 thiss!1504) (bvadd (mask!9727 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!58483 () Bool)

(declare-fun res!105326 () Bool)

(assert (=> d!58483 (=> (not res!105326) (not e!140027))))

(assert (=> d!58483 (= res!105326 (validMask!0 (mask!9727 thiss!1504)))))

(assert (=> d!58483 (= (simpleValid!216 thiss!1504) e!140027)))

(declare-fun b!215275 () Bool)

(declare-fun res!105325 () Bool)

(assert (=> b!215275 (=> (not res!105325) (not e!140027))))

(declare-fun size!5243 (LongMapFixedSize!2782) (_ BitVec 32))

(assert (=> b!215275 (= res!105325 (bvsge (size!5243 thiss!1504) (_size!1440 thiss!1504)))))

(declare-fun b!215277 () Bool)

(assert (=> b!215277 (= e!140027 (and (bvsge (extraKeys!3778 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3778 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1440 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215276 () Bool)

(declare-fun res!105323 () Bool)

(assert (=> b!215276 (=> (not res!105323) (not e!140027))))

(assert (=> b!215276 (= res!105323 (= (size!5243 thiss!1504) (bvadd (_size!1440 thiss!1504) (bvsdiv (bvadd (extraKeys!3778 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!58483 res!105326) b!215274))

(assert (= (and b!215274 res!105324) b!215275))

(assert (= (and b!215275 res!105325) b!215276))

(assert (= (and b!215276 res!105323) b!215277))

(assert (=> d!58483 m!242655))

(declare-fun m!242731 () Bool)

(assert (=> b!215275 m!242731))

(assert (=> b!215276 m!242731))

(assert (=> d!58471 d!58483))

(declare-fun d!58485 () Bool)

(declare-fun res!105331 () Bool)

(declare-fun e!140036 () Bool)

(assert (=> d!58485 (=> res!105331 e!140036)))

(assert (=> d!58485 (= res!105331 (bvsge #b00000000000000000000000000000000 (size!5238 (_keys!6067 thiss!1504))))))

(assert (=> d!58485 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6067 thiss!1504) (mask!9727 thiss!1504)) e!140036)))

(declare-fun b!215286 () Bool)

(declare-fun e!140034 () Bool)

(declare-fun call!20325 () Bool)

(assert (=> b!215286 (= e!140034 call!20325)))

(declare-fun b!215287 () Bool)

(declare-fun e!140035 () Bool)

(assert (=> b!215287 (= e!140036 e!140035)))

(declare-fun c!36159 () Bool)

(assert (=> b!215287 (= c!36159 (validKeyInArray!0 (select (arr!4910 (_keys!6067 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20322 () Bool)

(assert (=> bm!20322 (= call!20325 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6067 thiss!1504) (mask!9727 thiss!1504)))))

(declare-fun b!215288 () Bool)

(assert (=> b!215288 (= e!140035 e!140034)))

(declare-fun lt!110964 () (_ BitVec 64))

(assert (=> b!215288 (= lt!110964 (select (arr!4910 (_keys!6067 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6480 0))(
  ( (Unit!6481) )
))
(declare-fun lt!110965 () Unit!6480)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10361 (_ BitVec 64) (_ BitVec 32)) Unit!6480)

(assert (=> b!215288 (= lt!110965 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6067 thiss!1504) lt!110964 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!215288 (arrayContainsKey!0 (_keys!6067 thiss!1504) lt!110964 #b00000000000000000000000000000000)))

(declare-fun lt!110966 () Unit!6480)

(assert (=> b!215288 (= lt!110966 lt!110965)))

(declare-fun res!105332 () Bool)

(assert (=> b!215288 (= res!105332 (= (seekEntryOrOpen!0 (select (arr!4910 (_keys!6067 thiss!1504)) #b00000000000000000000000000000000) (_keys!6067 thiss!1504) (mask!9727 thiss!1504)) (Found!717 #b00000000000000000000000000000000)))))

(assert (=> b!215288 (=> (not res!105332) (not e!140034))))

(declare-fun b!215289 () Bool)

(assert (=> b!215289 (= e!140035 call!20325)))

(assert (= (and d!58485 (not res!105331)) b!215287))

(assert (= (and b!215287 c!36159) b!215288))

(assert (= (and b!215287 (not c!36159)) b!215289))

(assert (= (and b!215288 res!105332) b!215286))

(assert (= (or b!215286 b!215289) bm!20322))

(assert (=> b!215287 m!242715))

(assert (=> b!215287 m!242715))

(assert (=> b!215287 m!242719))

(declare-fun m!242733 () Bool)

(assert (=> bm!20322 m!242733))

(assert (=> b!215288 m!242715))

(declare-fun m!242735 () Bool)

(assert (=> b!215288 m!242735))

(declare-fun m!242737 () Bool)

(assert (=> b!215288 m!242737))

(assert (=> b!215288 m!242715))

(declare-fun m!242739 () Bool)

(assert (=> b!215288 m!242739))

(assert (=> b!215205 d!58485))

(declare-fun b!215308 () Bool)

(declare-fun e!140050 () SeekEntryResult!717)

(declare-fun e!140051 () SeekEntryResult!717)

(assert (=> b!215308 (= e!140050 e!140051)))

(declare-fun c!36166 () Bool)

(declare-fun lt!110971 () (_ BitVec 64))

(assert (=> b!215308 (= c!36166 (or (= lt!110971 key!932) (= (bvadd lt!110971 lt!110971) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!215309 () Bool)

(declare-fun lt!110972 () SeekEntryResult!717)

(assert (=> b!215309 (and (bvsge (index!5040 lt!110972) #b00000000000000000000000000000000) (bvslt (index!5040 lt!110972) (size!5238 (_keys!6067 thiss!1504))))))

(declare-fun e!140049 () Bool)

(assert (=> b!215309 (= e!140049 (= (select (arr!4910 (_keys!6067 thiss!1504)) (index!5040 lt!110972)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!215310 () Bool)

(declare-fun e!140048 () Bool)

(assert (=> b!215310 (= e!140048 (bvsge (x!22449 lt!110972) #b01111111111111111111111111111110))))

(declare-fun b!215311 () Bool)

(assert (=> b!215311 (= e!140051 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9727 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9727 thiss!1504)) key!932 (_keys!6067 thiss!1504) (mask!9727 thiss!1504)))))

(declare-fun b!215312 () Bool)

(assert (=> b!215312 (= e!140051 (Intermediate!717 false (toIndex!0 key!932 (mask!9727 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215313 () Bool)

(assert (=> b!215313 (= e!140050 (Intermediate!717 true (toIndex!0 key!932 (mask!9727 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215314 () Bool)

(declare-fun e!140047 () Bool)

(assert (=> b!215314 (= e!140048 e!140047)))

(declare-fun res!105341 () Bool)

(assert (=> b!215314 (= res!105341 (and ((_ is Intermediate!717) lt!110972) (not (undefined!1529 lt!110972)) (bvslt (x!22449 lt!110972) #b01111111111111111111111111111110) (bvsge (x!22449 lt!110972) #b00000000000000000000000000000000) (bvsge (x!22449 lt!110972) #b00000000000000000000000000000000)))))

(assert (=> b!215314 (=> (not res!105341) (not e!140047))))

(declare-fun b!215316 () Bool)

(assert (=> b!215316 (and (bvsge (index!5040 lt!110972) #b00000000000000000000000000000000) (bvslt (index!5040 lt!110972) (size!5238 (_keys!6067 thiss!1504))))))

(declare-fun res!105340 () Bool)

(assert (=> b!215316 (= res!105340 (= (select (arr!4910 (_keys!6067 thiss!1504)) (index!5040 lt!110972)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215316 (=> res!105340 e!140049)))

(declare-fun b!215315 () Bool)

(assert (=> b!215315 (and (bvsge (index!5040 lt!110972) #b00000000000000000000000000000000) (bvslt (index!5040 lt!110972) (size!5238 (_keys!6067 thiss!1504))))))

(declare-fun res!105339 () Bool)

(assert (=> b!215315 (= res!105339 (= (select (arr!4910 (_keys!6067 thiss!1504)) (index!5040 lt!110972)) key!932))))

(assert (=> b!215315 (=> res!105339 e!140049)))

(assert (=> b!215315 (= e!140047 e!140049)))

(declare-fun d!58487 () Bool)

(assert (=> d!58487 e!140048))

(declare-fun c!36167 () Bool)

(assert (=> d!58487 (= c!36167 (and ((_ is Intermediate!717) lt!110972) (undefined!1529 lt!110972)))))

(assert (=> d!58487 (= lt!110972 e!140050)))

(declare-fun c!36168 () Bool)

(assert (=> d!58487 (= c!36168 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!58487 (= lt!110971 (select (arr!4910 (_keys!6067 thiss!1504)) (toIndex!0 key!932 (mask!9727 thiss!1504))))))

(assert (=> d!58487 (validMask!0 (mask!9727 thiss!1504))))

(assert (=> d!58487 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9727 thiss!1504)) key!932 (_keys!6067 thiss!1504) (mask!9727 thiss!1504)) lt!110972)))

(assert (= (and d!58487 c!36168) b!215313))

(assert (= (and d!58487 (not c!36168)) b!215308))

(assert (= (and b!215308 c!36166) b!215312))

(assert (= (and b!215308 (not c!36166)) b!215311))

(assert (= (and d!58487 c!36167) b!215310))

(assert (= (and d!58487 (not c!36167)) b!215314))

(assert (= (and b!215314 res!105341) b!215315))

(assert (= (and b!215315 (not res!105339)) b!215316))

(assert (= (and b!215316 (not res!105340)) b!215309))

(assert (=> b!215311 m!242705))

(declare-fun m!242741 () Bool)

(assert (=> b!215311 m!242741))

(assert (=> b!215311 m!242741))

(declare-fun m!242743 () Bool)

(assert (=> b!215311 m!242743))

(declare-fun m!242745 () Bool)

(assert (=> b!215315 m!242745))

(assert (=> d!58487 m!242705))

(declare-fun m!242747 () Bool)

(assert (=> d!58487 m!242747))

(assert (=> d!58487 m!242655))

(assert (=> b!215309 m!242745))

(assert (=> b!215316 m!242745))

(assert (=> d!58477 d!58487))

(declare-fun d!58489 () Bool)

(declare-fun lt!110978 () (_ BitVec 32))

(declare-fun lt!110977 () (_ BitVec 32))

(assert (=> d!58489 (= lt!110978 (bvmul (bvxor lt!110977 (bvlshr lt!110977 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58489 (= lt!110977 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58489 (and (bvsge (mask!9727 thiss!1504) #b00000000000000000000000000000000) (let ((res!105342 (let ((h!3710 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22467 (bvmul (bvxor h!3710 (bvlshr h!3710 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22467 (bvlshr x!22467 #b00000000000000000000000000001101)) (mask!9727 thiss!1504)))))) (and (bvslt res!105342 (bvadd (mask!9727 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!105342 #b00000000000000000000000000000000))))))

(assert (=> d!58489 (= (toIndex!0 key!932 (mask!9727 thiss!1504)) (bvand (bvxor lt!110978 (bvlshr lt!110978 #b00000000000000000000000000001101)) (mask!9727 thiss!1504)))))

(assert (=> d!58477 d!58489))

(assert (=> d!58477 d!58469))

(declare-fun b!215325 () Bool)

(declare-fun e!140056 () (_ BitVec 32))

(declare-fun e!140057 () (_ BitVec 32))

(assert (=> b!215325 (= e!140056 e!140057)))

(declare-fun c!36173 () Bool)

(assert (=> b!215325 (= c!36173 (validKeyInArray!0 (select (arr!4910 (_keys!6067 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215326 () Bool)

(declare-fun call!20328 () (_ BitVec 32))

(assert (=> b!215326 (= e!140057 call!20328)))

(declare-fun b!215327 () Bool)

(assert (=> b!215327 (= e!140057 (bvadd #b00000000000000000000000000000001 call!20328))))

(declare-fun bm!20325 () Bool)

(assert (=> bm!20325 (= call!20328 (arrayCountValidKeys!0 (_keys!6067 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5238 (_keys!6067 thiss!1504))))))

(declare-fun d!58491 () Bool)

(declare-fun lt!110981 () (_ BitVec 32))

(assert (=> d!58491 (and (bvsge lt!110981 #b00000000000000000000000000000000) (bvsle lt!110981 (bvsub (size!5238 (_keys!6067 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58491 (= lt!110981 e!140056)))

(declare-fun c!36174 () Bool)

(assert (=> d!58491 (= c!36174 (bvsge #b00000000000000000000000000000000 (size!5238 (_keys!6067 thiss!1504))))))

(assert (=> d!58491 (and (bvsle #b00000000000000000000000000000000 (size!5238 (_keys!6067 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5238 (_keys!6067 thiss!1504)) (size!5238 (_keys!6067 thiss!1504))))))

(assert (=> d!58491 (= (arrayCountValidKeys!0 (_keys!6067 thiss!1504) #b00000000000000000000000000000000 (size!5238 (_keys!6067 thiss!1504))) lt!110981)))

(declare-fun b!215328 () Bool)

(assert (=> b!215328 (= e!140056 #b00000000000000000000000000000000)))

(assert (= (and d!58491 c!36174) b!215328))

(assert (= (and d!58491 (not c!36174)) b!215325))

(assert (= (and b!215325 c!36173) b!215327))

(assert (= (and b!215325 (not c!36173)) b!215326))

(assert (= (or b!215327 b!215326) bm!20325))

(assert (=> b!215325 m!242715))

(assert (=> b!215325 m!242715))

(assert (=> b!215325 m!242719))

(declare-fun m!242749 () Bool)

(assert (=> bm!20325 m!242749))

(assert (=> b!215204 d!58491))

(declare-fun b!215330 () Bool)

(declare-fun e!140058 () Bool)

(assert (=> b!215330 (= e!140058 tp_is_empty!5569)))

(declare-fun mapNonEmpty!9498 () Bool)

(declare-fun mapRes!9498 () Bool)

(declare-fun tp!20244 () Bool)

(declare-fun e!140059 () Bool)

(assert (=> mapNonEmpty!9498 (= mapRes!9498 (and tp!20244 e!140059))))

(declare-fun mapValue!9498 () ValueCell!2441)

(declare-fun mapKey!9498 () (_ BitVec 32))

(declare-fun mapRest!9498 () (Array (_ BitVec 32) ValueCell!2441))

(assert (=> mapNonEmpty!9498 (= mapRest!9497 (store mapRest!9498 mapKey!9498 mapValue!9498))))

(declare-fun b!215329 () Bool)

(assert (=> b!215329 (= e!140059 tp_is_empty!5569)))

(declare-fun condMapEmpty!9498 () Bool)

(declare-fun mapDefault!9498 () ValueCell!2441)

(assert (=> mapNonEmpty!9497 (= condMapEmpty!9498 (= mapRest!9497 ((as const (Array (_ BitVec 32) ValueCell!2441)) mapDefault!9498)))))

(assert (=> mapNonEmpty!9497 (= tp!20243 (and e!140058 mapRes!9498))))

(declare-fun mapIsEmpty!9498 () Bool)

(assert (=> mapIsEmpty!9498 mapRes!9498))

(assert (= (and mapNonEmpty!9497 condMapEmpty!9498) mapIsEmpty!9498))

(assert (= (and mapNonEmpty!9497 (not condMapEmpty!9498)) mapNonEmpty!9498))

(assert (= (and mapNonEmpty!9498 ((_ is ValueCellFull!2441) mapValue!9498)) b!215329))

(assert (= (and mapNonEmpty!9497 ((_ is ValueCellFull!2441) mapDefault!9498)) b!215330))

(declare-fun m!242751 () Bool)

(assert (=> mapNonEmpty!9498 m!242751))

(check-sat (not b!215247) (not b!215244) (not b!215275) (not d!58483) (not b!215243) (not b_next!5707) (not bm!20319) (not b!215325) (not bm!20325) (not mapNonEmpty!9498) (not b!215311) b_and!12611 (not b!215262) (not b!215287) (not b!215288) tp_is_empty!5569 (not bm!20322) (not d!58481) (not d!58487) (not b!215276))
(check-sat b_and!12611 (not b_next!5707))
