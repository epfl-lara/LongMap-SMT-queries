; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22588 () Bool)

(assert start!22588)

(declare-fun b!236152 () Bool)

(declare-fun b_free!6355 () Bool)

(declare-fun b_next!6355 () Bool)

(assert (=> b!236152 (= b_free!6355 (not b_next!6355))))

(declare-fun tp!22240 () Bool)

(declare-fun b_and!13303 () Bool)

(assert (=> b!236152 (= tp!22240 b_and!13303)))

(declare-fun b!236151 () Bool)

(declare-fun res!115811 () Bool)

(declare-fun e!153370 () Bool)

(assert (=> b!236151 (=> (not res!115811) (not e!153370))))

(declare-datatypes ((V!7937 0))(
  ( (V!7938 (val!3153 Int)) )
))
(declare-datatypes ((ValueCell!2765 0))(
  ( (ValueCellFull!2765 (v!5184 V!7937)) (EmptyCell!2765) )
))
(declare-datatypes ((array!11695 0))(
  ( (array!11696 (arr!5557 (Array (_ BitVec 32) ValueCell!2765)) (size!5894 (_ BitVec 32))) )
))
(declare-datatypes ((array!11697 0))(
  ( (array!11698 (arr!5558 (Array (_ BitVec 32) (_ BitVec 64))) (size!5895 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3430 0))(
  ( (LongMapFixedSize!3431 (defaultEntry!4388 Int) (mask!10373 (_ BitVec 32)) (extraKeys!4125 (_ BitVec 32)) (zeroValue!4229 V!7937) (minValue!4229 V!7937) (_size!1764 (_ BitVec 32)) (_keys!6467 array!11697) (_values!4371 array!11695) (_vacant!1764 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3430)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!236151 (= res!115811 (validMask!0 (mask!10373 thiss!1504)))))

(declare-fun mapNonEmpty!10529 () Bool)

(declare-fun mapRes!10529 () Bool)

(declare-fun tp!22241 () Bool)

(declare-fun e!153367 () Bool)

(assert (=> mapNonEmpty!10529 (= mapRes!10529 (and tp!22241 e!153367))))

(declare-fun mapRest!10529 () (Array (_ BitVec 32) ValueCell!2765))

(declare-fun mapValue!10529 () ValueCell!2765)

(declare-fun mapKey!10529 () (_ BitVec 32))

(assert (=> mapNonEmpty!10529 (= (arr!5557 (_values!4371 thiss!1504)) (store mapRest!10529 mapKey!10529 mapValue!10529))))

(declare-fun e!153369 () Bool)

(declare-fun e!153368 () Bool)

(declare-fun tp_is_empty!6217 () Bool)

(declare-fun array_inv!3653 (array!11697) Bool)

(declare-fun array_inv!3654 (array!11695) Bool)

(assert (=> b!236152 (= e!153368 (and tp!22240 tp_is_empty!6217 (array_inv!3653 (_keys!6467 thiss!1504)) (array_inv!3654 (_values!4371 thiss!1504)) e!153369))))

(declare-fun b!236153 () Bool)

(declare-fun e!153372 () Bool)

(assert (=> b!236153 (= e!153372 tp_is_empty!6217)))

(declare-fun b!236154 () Bool)

(declare-fun res!115813 () Bool)

(declare-fun e!153373 () Bool)

(assert (=> b!236154 (=> (not res!115813) (not e!153373))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!236154 (= res!115813 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!236155 () Bool)

(assert (=> b!236155 (= e!153367 tp_is_empty!6217)))

(declare-fun b!236156 () Bool)

(declare-fun res!115815 () Bool)

(assert (=> b!236156 (=> (not res!115815) (not e!153370))))

(declare-datatypes ((tuple2!4574 0))(
  ( (tuple2!4575 (_1!2298 (_ BitVec 64)) (_2!2298 V!7937)) )
))
(declare-datatypes ((List!3473 0))(
  ( (Nil!3470) (Cons!3469 (h!4121 tuple2!4574) (t!8444 List!3473)) )
))
(declare-datatypes ((ListLongMap!3489 0))(
  ( (ListLongMap!3490 (toList!1760 List!3473)) )
))
(declare-fun contains!1652 (ListLongMap!3489 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1292 (array!11697 array!11695 (_ BitVec 32) (_ BitVec 32) V!7937 V!7937 (_ BitVec 32) Int) ListLongMap!3489)

(assert (=> b!236156 (= res!115815 (not (contains!1652 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)) key!932)))))

(declare-fun mapIsEmpty!10529 () Bool)

(assert (=> mapIsEmpty!10529 mapRes!10529))

(declare-fun b!236157 () Bool)

(assert (=> b!236157 (= e!153370 (not (= (size!5894 (_values!4371 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10373 thiss!1504)))))))

(declare-fun b!236158 () Bool)

(assert (=> b!236158 (= e!153373 e!153370)))

(declare-fun res!115814 () Bool)

(assert (=> b!236158 (=> (not res!115814) (not e!153370))))

(declare-datatypes ((SeekEntryResult!972 0))(
  ( (MissingZero!972 (index!6058 (_ BitVec 32))) (Found!972 (index!6059 (_ BitVec 32))) (Intermediate!972 (undefined!1784 Bool) (index!6060 (_ BitVec 32)) (x!23828 (_ BitVec 32))) (Undefined!972) (MissingVacant!972 (index!6061 (_ BitVec 32))) )
))
(declare-fun lt!119430 () SeekEntryResult!972)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!236158 (= res!115814 (or (= lt!119430 (MissingZero!972 index!297)) (= lt!119430 (MissingVacant!972 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11697 (_ BitVec 32)) SeekEntryResult!972)

(assert (=> b!236158 (= lt!119430 (seekEntryOrOpen!0 key!932 (_keys!6467 thiss!1504) (mask!10373 thiss!1504)))))

(declare-fun b!236159 () Bool)

(assert (=> b!236159 (= e!153369 (and e!153372 mapRes!10529))))

(declare-fun condMapEmpty!10529 () Bool)

(declare-fun mapDefault!10529 () ValueCell!2765)

(assert (=> b!236159 (= condMapEmpty!10529 (= (arr!5557 (_values!4371 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2765)) mapDefault!10529)))))

(declare-fun res!115812 () Bool)

(assert (=> start!22588 (=> (not res!115812) (not e!153373))))

(declare-fun valid!1369 (LongMapFixedSize!3430) Bool)

(assert (=> start!22588 (= res!115812 (valid!1369 thiss!1504))))

(assert (=> start!22588 e!153373))

(assert (=> start!22588 e!153368))

(assert (=> start!22588 true))

(assert (= (and start!22588 res!115812) b!236154))

(assert (= (and b!236154 res!115813) b!236158))

(assert (= (and b!236158 res!115814) b!236156))

(assert (= (and b!236156 res!115815) b!236151))

(assert (= (and b!236151 res!115811) b!236157))

(assert (= (and b!236159 condMapEmpty!10529) mapIsEmpty!10529))

(assert (= (and b!236159 (not condMapEmpty!10529)) mapNonEmpty!10529))

(get-info :version)

(assert (= (and mapNonEmpty!10529 ((_ is ValueCellFull!2765) mapValue!10529)) b!236155))

(assert (= (and b!236159 ((_ is ValueCellFull!2765) mapDefault!10529)) b!236153))

(assert (= b!236152 b!236159))

(assert (= start!22588 b!236152))

(declare-fun m!257197 () Bool)

(assert (=> start!22588 m!257197))

(declare-fun m!257199 () Bool)

(assert (=> b!236156 m!257199))

(assert (=> b!236156 m!257199))

(declare-fun m!257201 () Bool)

(assert (=> b!236156 m!257201))

(declare-fun m!257203 () Bool)

(assert (=> b!236151 m!257203))

(declare-fun m!257205 () Bool)

(assert (=> b!236158 m!257205))

(declare-fun m!257207 () Bool)

(assert (=> b!236152 m!257207))

(declare-fun m!257209 () Bool)

(assert (=> b!236152 m!257209))

(declare-fun m!257211 () Bool)

(assert (=> mapNonEmpty!10529 m!257211))

(check-sat b_and!13303 (not b_next!6355) (not b!236152) (not start!22588) (not b!236158) tp_is_empty!6217 (not mapNonEmpty!10529) (not b!236151) (not b!236156))
(check-sat b_and!13303 (not b_next!6355))
(get-model)

(declare-fun d!59409 () Bool)

(assert (=> d!59409 (= (array_inv!3653 (_keys!6467 thiss!1504)) (bvsge (size!5895 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236152 d!59409))

(declare-fun d!59411 () Bool)

(assert (=> d!59411 (= (array_inv!3654 (_values!4371 thiss!1504)) (bvsge (size!5894 (_values!4371 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236152 d!59411))

(declare-fun d!59413 () Bool)

(declare-fun res!115852 () Bool)

(declare-fun e!153418 () Bool)

(assert (=> d!59413 (=> (not res!115852) (not e!153418))))

(declare-fun simpleValid!236 (LongMapFixedSize!3430) Bool)

(assert (=> d!59413 (= res!115852 (simpleValid!236 thiss!1504))))

(assert (=> d!59413 (= (valid!1369 thiss!1504) e!153418)))

(declare-fun b!236220 () Bool)

(declare-fun res!115853 () Bool)

(assert (=> b!236220 (=> (not res!115853) (not e!153418))))

(declare-fun arrayCountValidKeys!0 (array!11697 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!236220 (= res!115853 (= (arrayCountValidKeys!0 (_keys!6467 thiss!1504) #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))) (_size!1764 thiss!1504)))))

(declare-fun b!236221 () Bool)

(declare-fun res!115854 () Bool)

(assert (=> b!236221 (=> (not res!115854) (not e!153418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11697 (_ BitVec 32)) Bool)

(assert (=> b!236221 (= res!115854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6467 thiss!1504) (mask!10373 thiss!1504)))))

(declare-fun b!236222 () Bool)

(declare-datatypes ((List!3474 0))(
  ( (Nil!3471) (Cons!3470 (h!4122 (_ BitVec 64)) (t!8447 List!3474)) )
))
(declare-fun arrayNoDuplicates!0 (array!11697 (_ BitVec 32) List!3474) Bool)

(assert (=> b!236222 (= e!153418 (arrayNoDuplicates!0 (_keys!6467 thiss!1504) #b00000000000000000000000000000000 Nil!3471))))

(assert (= (and d!59413 res!115852) b!236220))

(assert (= (and b!236220 res!115853) b!236221))

(assert (= (and b!236221 res!115854) b!236222))

(declare-fun m!257245 () Bool)

(assert (=> d!59413 m!257245))

(declare-fun m!257247 () Bool)

(assert (=> b!236220 m!257247))

(declare-fun m!257249 () Bool)

(assert (=> b!236221 m!257249))

(declare-fun m!257251 () Bool)

(assert (=> b!236222 m!257251))

(assert (=> start!22588 d!59413))

(declare-fun e!153427 () SeekEntryResult!972)

(declare-fun b!236235 () Bool)

(declare-fun lt!119445 () SeekEntryResult!972)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11697 (_ BitVec 32)) SeekEntryResult!972)

(assert (=> b!236235 (= e!153427 (seekKeyOrZeroReturnVacant!0 (x!23828 lt!119445) (index!6060 lt!119445) (index!6060 lt!119445) key!932 (_keys!6467 thiss!1504) (mask!10373 thiss!1504)))))

(declare-fun b!236236 () Bool)

(assert (=> b!236236 (= e!153427 (MissingZero!972 (index!6060 lt!119445)))))

(declare-fun b!236237 () Bool)

(declare-fun e!153426 () SeekEntryResult!972)

(assert (=> b!236237 (= e!153426 Undefined!972)))

(declare-fun b!236238 () Bool)

(declare-fun e!153425 () SeekEntryResult!972)

(assert (=> b!236238 (= e!153425 (Found!972 (index!6060 lt!119445)))))

(declare-fun b!236239 () Bool)

(assert (=> b!236239 (= e!153426 e!153425)))

(declare-fun lt!119443 () (_ BitVec 64))

(assert (=> b!236239 (= lt!119443 (select (arr!5558 (_keys!6467 thiss!1504)) (index!6060 lt!119445)))))

(declare-fun c!39330 () Bool)

(assert (=> b!236239 (= c!39330 (= lt!119443 key!932))))

(declare-fun b!236240 () Bool)

(declare-fun c!39331 () Bool)

(assert (=> b!236240 (= c!39331 (= lt!119443 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236240 (= e!153425 e!153427)))

(declare-fun d!59415 () Bool)

(declare-fun lt!119444 () SeekEntryResult!972)

(assert (=> d!59415 (and (or ((_ is Undefined!972) lt!119444) (not ((_ is Found!972) lt!119444)) (and (bvsge (index!6059 lt!119444) #b00000000000000000000000000000000) (bvslt (index!6059 lt!119444) (size!5895 (_keys!6467 thiss!1504))))) (or ((_ is Undefined!972) lt!119444) ((_ is Found!972) lt!119444) (not ((_ is MissingZero!972) lt!119444)) (and (bvsge (index!6058 lt!119444) #b00000000000000000000000000000000) (bvslt (index!6058 lt!119444) (size!5895 (_keys!6467 thiss!1504))))) (or ((_ is Undefined!972) lt!119444) ((_ is Found!972) lt!119444) ((_ is MissingZero!972) lt!119444) (not ((_ is MissingVacant!972) lt!119444)) (and (bvsge (index!6061 lt!119444) #b00000000000000000000000000000000) (bvslt (index!6061 lt!119444) (size!5895 (_keys!6467 thiss!1504))))) (or ((_ is Undefined!972) lt!119444) (ite ((_ is Found!972) lt!119444) (= (select (arr!5558 (_keys!6467 thiss!1504)) (index!6059 lt!119444)) key!932) (ite ((_ is MissingZero!972) lt!119444) (= (select (arr!5558 (_keys!6467 thiss!1504)) (index!6058 lt!119444)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!972) lt!119444) (= (select (arr!5558 (_keys!6467 thiss!1504)) (index!6061 lt!119444)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59415 (= lt!119444 e!153426)))

(declare-fun c!39332 () Bool)

(assert (=> d!59415 (= c!39332 (and ((_ is Intermediate!972) lt!119445) (undefined!1784 lt!119445)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11697 (_ BitVec 32)) SeekEntryResult!972)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59415 (= lt!119445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10373 thiss!1504)) key!932 (_keys!6467 thiss!1504) (mask!10373 thiss!1504)))))

(assert (=> d!59415 (validMask!0 (mask!10373 thiss!1504))))

(assert (=> d!59415 (= (seekEntryOrOpen!0 key!932 (_keys!6467 thiss!1504) (mask!10373 thiss!1504)) lt!119444)))

(assert (= (and d!59415 c!39332) b!236237))

(assert (= (and d!59415 (not c!39332)) b!236239))

(assert (= (and b!236239 c!39330) b!236238))

(assert (= (and b!236239 (not c!39330)) b!236240))

(assert (= (and b!236240 c!39331) b!236236))

(assert (= (and b!236240 (not c!39331)) b!236235))

(declare-fun m!257253 () Bool)

(assert (=> b!236235 m!257253))

(declare-fun m!257255 () Bool)

(assert (=> b!236239 m!257255))

(declare-fun m!257257 () Bool)

(assert (=> d!59415 m!257257))

(declare-fun m!257259 () Bool)

(assert (=> d!59415 m!257259))

(declare-fun m!257261 () Bool)

(assert (=> d!59415 m!257261))

(assert (=> d!59415 m!257261))

(declare-fun m!257263 () Bool)

(assert (=> d!59415 m!257263))

(assert (=> d!59415 m!257203))

(declare-fun m!257265 () Bool)

(assert (=> d!59415 m!257265))

(assert (=> b!236158 d!59415))

(declare-fun d!59417 () Bool)

(assert (=> d!59417 (= (validMask!0 (mask!10373 thiss!1504)) (and (or (= (mask!10373 thiss!1504) #b00000000000000000000000000000111) (= (mask!10373 thiss!1504) #b00000000000000000000000000001111) (= (mask!10373 thiss!1504) #b00000000000000000000000000011111) (= (mask!10373 thiss!1504) #b00000000000000000000000000111111) (= (mask!10373 thiss!1504) #b00000000000000000000000001111111) (= (mask!10373 thiss!1504) #b00000000000000000000000011111111) (= (mask!10373 thiss!1504) #b00000000000000000000000111111111) (= (mask!10373 thiss!1504) #b00000000000000000000001111111111) (= (mask!10373 thiss!1504) #b00000000000000000000011111111111) (= (mask!10373 thiss!1504) #b00000000000000000000111111111111) (= (mask!10373 thiss!1504) #b00000000000000000001111111111111) (= (mask!10373 thiss!1504) #b00000000000000000011111111111111) (= (mask!10373 thiss!1504) #b00000000000000000111111111111111) (= (mask!10373 thiss!1504) #b00000000000000001111111111111111) (= (mask!10373 thiss!1504) #b00000000000000011111111111111111) (= (mask!10373 thiss!1504) #b00000000000000111111111111111111) (= (mask!10373 thiss!1504) #b00000000000001111111111111111111) (= (mask!10373 thiss!1504) #b00000000000011111111111111111111) (= (mask!10373 thiss!1504) #b00000000000111111111111111111111) (= (mask!10373 thiss!1504) #b00000000001111111111111111111111) (= (mask!10373 thiss!1504) #b00000000011111111111111111111111) (= (mask!10373 thiss!1504) #b00000000111111111111111111111111) (= (mask!10373 thiss!1504) #b00000001111111111111111111111111) (= (mask!10373 thiss!1504) #b00000011111111111111111111111111) (= (mask!10373 thiss!1504) #b00000111111111111111111111111111) (= (mask!10373 thiss!1504) #b00001111111111111111111111111111) (= (mask!10373 thiss!1504) #b00011111111111111111111111111111) (= (mask!10373 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10373 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!236151 d!59417))

(declare-fun d!59419 () Bool)

(declare-fun e!153432 () Bool)

(assert (=> d!59419 e!153432))

(declare-fun res!115857 () Bool)

(assert (=> d!59419 (=> res!115857 e!153432)))

(declare-fun lt!119454 () Bool)

(assert (=> d!59419 (= res!115857 (not lt!119454))))

(declare-fun lt!119455 () Bool)

(assert (=> d!59419 (= lt!119454 lt!119455)))

(declare-datatypes ((Unit!7259 0))(
  ( (Unit!7260) )
))
(declare-fun lt!119457 () Unit!7259)

(declare-fun e!153433 () Unit!7259)

(assert (=> d!59419 (= lt!119457 e!153433)))

(declare-fun c!39335 () Bool)

(assert (=> d!59419 (= c!39335 lt!119455)))

(declare-fun containsKey!263 (List!3473 (_ BitVec 64)) Bool)

(assert (=> d!59419 (= lt!119455 (containsKey!263 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932))))

(assert (=> d!59419 (= (contains!1652 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)) key!932) lt!119454)))

(declare-fun b!236247 () Bool)

(declare-fun lt!119456 () Unit!7259)

(assert (=> b!236247 (= e!153433 lt!119456)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!211 (List!3473 (_ BitVec 64)) Unit!7259)

(assert (=> b!236247 (= lt!119456 (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932))))

(declare-datatypes ((Option!278 0))(
  ( (Some!277 (v!5187 V!7937)) (None!276) )
))
(declare-fun isDefined!212 (Option!278) Bool)

(declare-fun getValueByKey!272 (List!3473 (_ BitVec 64)) Option!278)

(assert (=> b!236247 (isDefined!212 (getValueByKey!272 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932))))

(declare-fun b!236248 () Bool)

(declare-fun Unit!7261 () Unit!7259)

(assert (=> b!236248 (= e!153433 Unit!7261)))

(declare-fun b!236249 () Bool)

(assert (=> b!236249 (= e!153432 (isDefined!212 (getValueByKey!272 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932)))))

(assert (= (and d!59419 c!39335) b!236247))

(assert (= (and d!59419 (not c!39335)) b!236248))

(assert (= (and d!59419 (not res!115857)) b!236249))

(declare-fun m!257267 () Bool)

(assert (=> d!59419 m!257267))

(declare-fun m!257269 () Bool)

(assert (=> b!236247 m!257269))

(declare-fun m!257271 () Bool)

(assert (=> b!236247 m!257271))

(assert (=> b!236247 m!257271))

(declare-fun m!257273 () Bool)

(assert (=> b!236247 m!257273))

(assert (=> b!236249 m!257271))

(assert (=> b!236249 m!257271))

(assert (=> b!236249 m!257273))

(assert (=> b!236156 d!59419))

(declare-fun b!236292 () Bool)

(declare-fun e!153465 () Bool)

(declare-fun call!21959 () Bool)

(assert (=> b!236292 (= e!153465 (not call!21959))))

(declare-fun bm!21951 () Bool)

(declare-fun lt!119522 () ListLongMap!3489)

(assert (=> bm!21951 (= call!21959 (contains!1652 lt!119522 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236293 () Bool)

(declare-fun e!153461 () Unit!7259)

(declare-fun Unit!7262 () Unit!7259)

(assert (=> b!236293 (= e!153461 Unit!7262)))

(declare-fun b!236294 () Bool)

(declare-fun e!153466 () Bool)

(declare-fun call!21954 () Bool)

(assert (=> b!236294 (= e!153466 (not call!21954))))

(declare-fun b!236295 () Bool)

(declare-fun e!153470 () ListLongMap!3489)

(declare-fun e!153460 () ListLongMap!3489)

(assert (=> b!236295 (= e!153470 e!153460)))

(declare-fun c!39350 () Bool)

(assert (=> b!236295 (= c!39350 (and (not (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!236296 () Bool)

(declare-fun call!21955 () ListLongMap!3489)

(assert (=> b!236296 (= e!153460 call!21955)))

(declare-fun b!236297 () Bool)

(declare-fun e!153462 () Bool)

(declare-fun apply!213 (ListLongMap!3489 (_ BitVec 64)) V!7937)

(assert (=> b!236297 (= e!153462 (= (apply!213 lt!119522 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4229 thiss!1504)))))

(declare-fun b!236298 () Bool)

(declare-fun e!153463 () Bool)

(assert (=> b!236298 (= e!153463 (= (apply!213 lt!119522 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4229 thiss!1504)))))

(declare-fun bm!21952 () Bool)

(declare-fun call!21958 () ListLongMap!3489)

(declare-fun call!21956 () ListLongMap!3489)

(assert (=> bm!21952 (= call!21958 call!21956)))

(declare-fun b!236299 () Bool)

(declare-fun lt!119515 () Unit!7259)

(assert (=> b!236299 (= e!153461 lt!119515)))

(declare-fun lt!119511 () ListLongMap!3489)

(declare-fun getCurrentListMapNoExtraKeys!529 (array!11697 array!11695 (_ BitVec 32) (_ BitVec 32) V!7937 V!7937 (_ BitVec 32) Int) ListLongMap!3489)

(assert (=> b!236299 (= lt!119511 (getCurrentListMapNoExtraKeys!529 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))))

(declare-fun lt!119518 () (_ BitVec 64))

(assert (=> b!236299 (= lt!119518 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119514 () (_ BitVec 64))

(assert (=> b!236299 (= lt!119514 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119512 () Unit!7259)

(declare-fun addStillContains!189 (ListLongMap!3489 (_ BitVec 64) V!7937 (_ BitVec 64)) Unit!7259)

(assert (=> b!236299 (= lt!119512 (addStillContains!189 lt!119511 lt!119518 (zeroValue!4229 thiss!1504) lt!119514))))

(declare-fun +!640 (ListLongMap!3489 tuple2!4574) ListLongMap!3489)

(assert (=> b!236299 (contains!1652 (+!640 lt!119511 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504))) lt!119514)))

(declare-fun lt!119503 () Unit!7259)

(assert (=> b!236299 (= lt!119503 lt!119512)))

(declare-fun lt!119516 () ListLongMap!3489)

(assert (=> b!236299 (= lt!119516 (getCurrentListMapNoExtraKeys!529 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))))

(declare-fun lt!119520 () (_ BitVec 64))

(assert (=> b!236299 (= lt!119520 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119508 () (_ BitVec 64))

(assert (=> b!236299 (= lt!119508 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119510 () Unit!7259)

(declare-fun addApplyDifferent!189 (ListLongMap!3489 (_ BitVec 64) V!7937 (_ BitVec 64)) Unit!7259)

(assert (=> b!236299 (= lt!119510 (addApplyDifferent!189 lt!119516 lt!119520 (minValue!4229 thiss!1504) lt!119508))))

(assert (=> b!236299 (= (apply!213 (+!640 lt!119516 (tuple2!4575 lt!119520 (minValue!4229 thiss!1504))) lt!119508) (apply!213 lt!119516 lt!119508))))

(declare-fun lt!119502 () Unit!7259)

(assert (=> b!236299 (= lt!119502 lt!119510)))

(declare-fun lt!119513 () ListLongMap!3489)

(assert (=> b!236299 (= lt!119513 (getCurrentListMapNoExtraKeys!529 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))))

(declare-fun lt!119505 () (_ BitVec 64))

(assert (=> b!236299 (= lt!119505 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119504 () (_ BitVec 64))

(assert (=> b!236299 (= lt!119504 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119517 () Unit!7259)

(assert (=> b!236299 (= lt!119517 (addApplyDifferent!189 lt!119513 lt!119505 (zeroValue!4229 thiss!1504) lt!119504))))

(assert (=> b!236299 (= (apply!213 (+!640 lt!119513 (tuple2!4575 lt!119505 (zeroValue!4229 thiss!1504))) lt!119504) (apply!213 lt!119513 lt!119504))))

(declare-fun lt!119509 () Unit!7259)

(assert (=> b!236299 (= lt!119509 lt!119517)))

(declare-fun lt!119521 () ListLongMap!3489)

(assert (=> b!236299 (= lt!119521 (getCurrentListMapNoExtraKeys!529 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))))

(declare-fun lt!119519 () (_ BitVec 64))

(assert (=> b!236299 (= lt!119519 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119507 () (_ BitVec 64))

(assert (=> b!236299 (= lt!119507 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236299 (= lt!119515 (addApplyDifferent!189 lt!119521 lt!119519 (minValue!4229 thiss!1504) lt!119507))))

(assert (=> b!236299 (= (apply!213 (+!640 lt!119521 (tuple2!4575 lt!119519 (minValue!4229 thiss!1504))) lt!119507) (apply!213 lt!119521 lt!119507))))

(declare-fun bm!21953 () Bool)

(assert (=> bm!21953 (= call!21954 (contains!1652 lt!119522 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!59421 () Bool)

(declare-fun e!153471 () Bool)

(assert (=> d!59421 e!153471))

(declare-fun res!115877 () Bool)

(assert (=> d!59421 (=> (not res!115877) (not e!153471))))

(assert (=> d!59421 (= res!115877 (or (bvsge #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))))))))

(declare-fun lt!119506 () ListLongMap!3489)

(assert (=> d!59421 (= lt!119522 lt!119506)))

(declare-fun lt!119523 () Unit!7259)

(assert (=> d!59421 (= lt!119523 e!153461)))

(declare-fun c!39353 () Bool)

(declare-fun e!153469 () Bool)

(assert (=> d!59421 (= c!39353 e!153469)))

(declare-fun res!115881 () Bool)

(assert (=> d!59421 (=> (not res!115881) (not e!153469))))

(assert (=> d!59421 (= res!115881 (bvslt #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))))))

(assert (=> d!59421 (= lt!119506 e!153470)))

(declare-fun c!39348 () Bool)

(assert (=> d!59421 (= c!39348 (and (not (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59421 (validMask!0 (mask!10373 thiss!1504))))

(assert (=> d!59421 (= (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)) lt!119522)))

(declare-fun b!236300 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!236300 (= e!153469 (validKeyInArray!0 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236301 () Bool)

(declare-fun e!153468 () ListLongMap!3489)

(assert (=> b!236301 (= e!153468 call!21955)))

(declare-fun bm!21954 () Bool)

(declare-fun call!21957 () ListLongMap!3489)

(assert (=> bm!21954 (= call!21957 call!21958)))

(declare-fun bm!21955 () Bool)

(declare-fun call!21960 () ListLongMap!3489)

(assert (=> bm!21955 (= call!21960 (+!640 (ite c!39348 call!21956 (ite c!39350 call!21958 call!21957)) (ite (or c!39348 c!39350) (tuple2!4575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))))))

(declare-fun b!236302 () Bool)

(declare-fun res!115880 () Bool)

(assert (=> b!236302 (=> (not res!115880) (not e!153471))))

(assert (=> b!236302 (= res!115880 e!153465)))

(declare-fun c!39352 () Bool)

(assert (=> b!236302 (= c!39352 (not (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!236303 () Bool)

(declare-fun e!153467 () Bool)

(declare-fun e!153472 () Bool)

(assert (=> b!236303 (= e!153467 e!153472)))

(declare-fun res!115884 () Bool)

(assert (=> b!236303 (=> (not res!115884) (not e!153472))))

(assert (=> b!236303 (= res!115884 (contains!1652 lt!119522 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))))))

(declare-fun b!236304 () Bool)

(assert (=> b!236304 (= e!153466 e!153463)))

(declare-fun res!115879 () Bool)

(assert (=> b!236304 (= res!115879 call!21954)))

(assert (=> b!236304 (=> (not res!115879) (not e!153463))))

(declare-fun b!236305 () Bool)

(assert (=> b!236305 (= e!153471 e!153466)))

(declare-fun c!39351 () Bool)

(assert (=> b!236305 (= c!39351 (not (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!236306 () Bool)

(declare-fun e!153464 () Bool)

(assert (=> b!236306 (= e!153464 (validKeyInArray!0 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236307 () Bool)

(declare-fun c!39349 () Bool)

(assert (=> b!236307 (= c!39349 (and (not (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4125 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!236307 (= e!153460 e!153468)))

(declare-fun b!236308 () Bool)

(assert (=> b!236308 (= e!153470 (+!640 call!21960 (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))))

(declare-fun bm!21956 () Bool)

(assert (=> bm!21956 (= call!21956 (getCurrentListMapNoExtraKeys!529 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))))

(declare-fun b!236309 () Bool)

(declare-fun get!2862 (ValueCell!2765 V!7937) V!7937)

(declare-fun dynLambda!556 (Int (_ BitVec 64)) V!7937)

(assert (=> b!236309 (= e!153472 (= (apply!213 lt!119522 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)) (get!2862 (select (arr!5557 (_values!4371 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!556 (defaultEntry!4388 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!236309 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5894 (_values!4371 thiss!1504))))))

(assert (=> b!236309 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))))))

(declare-fun bm!21957 () Bool)

(assert (=> bm!21957 (= call!21955 call!21960)))

(declare-fun b!236310 () Bool)

(assert (=> b!236310 (= e!153468 call!21957)))

(declare-fun b!236311 () Bool)

(assert (=> b!236311 (= e!153465 e!153462)))

(declare-fun res!115883 () Bool)

(assert (=> b!236311 (= res!115883 call!21959)))

(assert (=> b!236311 (=> (not res!115883) (not e!153462))))

(declare-fun b!236312 () Bool)

(declare-fun res!115876 () Bool)

(assert (=> b!236312 (=> (not res!115876) (not e!153471))))

(assert (=> b!236312 (= res!115876 e!153467)))

(declare-fun res!115878 () Bool)

(assert (=> b!236312 (=> res!115878 e!153467)))

(assert (=> b!236312 (= res!115878 (not e!153464))))

(declare-fun res!115882 () Bool)

(assert (=> b!236312 (=> (not res!115882) (not e!153464))))

(assert (=> b!236312 (= res!115882 (bvslt #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))))))

(assert (= (and d!59421 c!39348) b!236308))

(assert (= (and d!59421 (not c!39348)) b!236295))

(assert (= (and b!236295 c!39350) b!236296))

(assert (= (and b!236295 (not c!39350)) b!236307))

(assert (= (and b!236307 c!39349) b!236301))

(assert (= (and b!236307 (not c!39349)) b!236310))

(assert (= (or b!236301 b!236310) bm!21954))

(assert (= (or b!236296 bm!21954) bm!21952))

(assert (= (or b!236296 b!236301) bm!21957))

(assert (= (or b!236308 bm!21952) bm!21956))

(assert (= (or b!236308 bm!21957) bm!21955))

(assert (= (and d!59421 res!115881) b!236300))

(assert (= (and d!59421 c!39353) b!236299))

(assert (= (and d!59421 (not c!39353)) b!236293))

(assert (= (and d!59421 res!115877) b!236312))

(assert (= (and b!236312 res!115882) b!236306))

(assert (= (and b!236312 (not res!115878)) b!236303))

(assert (= (and b!236303 res!115884) b!236309))

(assert (= (and b!236312 res!115876) b!236302))

(assert (= (and b!236302 c!39352) b!236311))

(assert (= (and b!236302 (not c!39352)) b!236292))

(assert (= (and b!236311 res!115883) b!236297))

(assert (= (or b!236311 b!236292) bm!21951))

(assert (= (and b!236302 res!115880) b!236305))

(assert (= (and b!236305 c!39351) b!236304))

(assert (= (and b!236305 (not c!39351)) b!236294))

(assert (= (and b!236304 res!115879) b!236298))

(assert (= (or b!236304 b!236294) bm!21953))

(declare-fun b_lambda!7937 () Bool)

(assert (=> (not b_lambda!7937) (not b!236309)))

(declare-fun t!8446 () Bool)

(declare-fun tb!2931 () Bool)

(assert (=> (and b!236152 (= (defaultEntry!4388 thiss!1504) (defaultEntry!4388 thiss!1504)) t!8446) tb!2931))

(declare-fun result!5131 () Bool)

(assert (=> tb!2931 (= result!5131 tp_is_empty!6217)))

(assert (=> b!236309 t!8446))

(declare-fun b_and!13309 () Bool)

(assert (= b_and!13303 (and (=> t!8446 result!5131) b_and!13309)))

(declare-fun m!257275 () Bool)

(assert (=> b!236303 m!257275))

(assert (=> b!236303 m!257275))

(declare-fun m!257277 () Bool)

(assert (=> b!236303 m!257277))

(declare-fun m!257279 () Bool)

(assert (=> b!236299 m!257279))

(declare-fun m!257281 () Bool)

(assert (=> b!236299 m!257281))

(declare-fun m!257283 () Bool)

(assert (=> b!236299 m!257283))

(declare-fun m!257285 () Bool)

(assert (=> b!236299 m!257285))

(declare-fun m!257287 () Bool)

(assert (=> b!236299 m!257287))

(declare-fun m!257289 () Bool)

(assert (=> b!236299 m!257289))

(declare-fun m!257291 () Bool)

(assert (=> b!236299 m!257291))

(declare-fun m!257293 () Bool)

(assert (=> b!236299 m!257293))

(declare-fun m!257295 () Bool)

(assert (=> b!236299 m!257295))

(declare-fun m!257297 () Bool)

(assert (=> b!236299 m!257297))

(declare-fun m!257299 () Bool)

(assert (=> b!236299 m!257299))

(assert (=> b!236299 m!257289))

(declare-fun m!257301 () Bool)

(assert (=> b!236299 m!257301))

(assert (=> b!236299 m!257285))

(assert (=> b!236299 m!257281))

(declare-fun m!257303 () Bool)

(assert (=> b!236299 m!257303))

(assert (=> b!236299 m!257275))

(assert (=> b!236299 m!257297))

(declare-fun m!257305 () Bool)

(assert (=> b!236299 m!257305))

(declare-fun m!257307 () Bool)

(assert (=> b!236299 m!257307))

(declare-fun m!257309 () Bool)

(assert (=> b!236299 m!257309))

(declare-fun m!257311 () Bool)

(assert (=> bm!21955 m!257311))

(assert (=> bm!21956 m!257293))

(declare-fun m!257313 () Bool)

(assert (=> bm!21951 m!257313))

(declare-fun m!257315 () Bool)

(assert (=> b!236309 m!257315))

(declare-fun m!257317 () Bool)

(assert (=> b!236309 m!257317))

(declare-fun m!257319 () Bool)

(assert (=> b!236309 m!257319))

(assert (=> b!236309 m!257315))

(assert (=> b!236309 m!257275))

(declare-fun m!257321 () Bool)

(assert (=> b!236309 m!257321))

(assert (=> b!236309 m!257275))

(assert (=> b!236309 m!257317))

(declare-fun m!257323 () Bool)

(assert (=> b!236308 m!257323))

(assert (=> b!236300 m!257275))

(assert (=> b!236300 m!257275))

(declare-fun m!257325 () Bool)

(assert (=> b!236300 m!257325))

(declare-fun m!257327 () Bool)

(assert (=> bm!21953 m!257327))

(declare-fun m!257329 () Bool)

(assert (=> b!236298 m!257329))

(declare-fun m!257331 () Bool)

(assert (=> b!236297 m!257331))

(assert (=> d!59421 m!257203))

(assert (=> b!236306 m!257275))

(assert (=> b!236306 m!257275))

(assert (=> b!236306 m!257325))

(assert (=> b!236156 d!59421))

(declare-fun b!236322 () Bool)

(declare-fun e!153477 () Bool)

(assert (=> b!236322 (= e!153477 tp_is_empty!6217)))

(declare-fun mapIsEmpty!10538 () Bool)

(declare-fun mapRes!10538 () Bool)

(assert (=> mapIsEmpty!10538 mapRes!10538))

(declare-fun mapNonEmpty!10538 () Bool)

(declare-fun tp!22256 () Bool)

(declare-fun e!153478 () Bool)

(assert (=> mapNonEmpty!10538 (= mapRes!10538 (and tp!22256 e!153478))))

(declare-fun mapValue!10538 () ValueCell!2765)

(declare-fun mapKey!10538 () (_ BitVec 32))

(declare-fun mapRest!10538 () (Array (_ BitVec 32) ValueCell!2765))

(assert (=> mapNonEmpty!10538 (= mapRest!10529 (store mapRest!10538 mapKey!10538 mapValue!10538))))

(declare-fun condMapEmpty!10538 () Bool)

(declare-fun mapDefault!10538 () ValueCell!2765)

(assert (=> mapNonEmpty!10529 (= condMapEmpty!10538 (= mapRest!10529 ((as const (Array (_ BitVec 32) ValueCell!2765)) mapDefault!10538)))))

(assert (=> mapNonEmpty!10529 (= tp!22241 (and e!153477 mapRes!10538))))

(declare-fun b!236321 () Bool)

(assert (=> b!236321 (= e!153478 tp_is_empty!6217)))

(assert (= (and mapNonEmpty!10529 condMapEmpty!10538) mapIsEmpty!10538))

(assert (= (and mapNonEmpty!10529 (not condMapEmpty!10538)) mapNonEmpty!10538))

(assert (= (and mapNonEmpty!10538 ((_ is ValueCellFull!2765) mapValue!10538)) b!236321))

(assert (= (and mapNonEmpty!10529 ((_ is ValueCellFull!2765) mapDefault!10538)) b!236322))

(declare-fun m!257333 () Bool)

(assert (=> mapNonEmpty!10538 m!257333))

(declare-fun b_lambda!7939 () Bool)

(assert (= b_lambda!7937 (or (and b!236152 b_free!6355) b_lambda!7939)))

(check-sat (not b!236235) (not bm!21956) (not b!236298) (not b_next!6355) (not b!236308) (not b!236299) (not d!59421) (not b_lambda!7939) (not b!236309) (not b!236303) (not b!236247) (not bm!21955) (not bm!21953) (not b!236306) (not b!236249) (not b!236221) (not b!236300) (not b!236297) (not b!236222) (not b!236220) (not d!59413) (not mapNonEmpty!10538) (not bm!21951) (not d!59415) tp_is_empty!6217 (not d!59419) b_and!13309)
(check-sat b_and!13309 (not b_next!6355))
(get-model)

(declare-fun d!59423 () Bool)

(declare-fun res!115893 () Bool)

(declare-fun e!153490 () Bool)

(assert (=> d!59423 (=> res!115893 e!153490)))

(assert (=> d!59423 (= res!115893 (bvsge #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))))))

(assert (=> d!59423 (= (arrayNoDuplicates!0 (_keys!6467 thiss!1504) #b00000000000000000000000000000000 Nil!3471) e!153490)))

(declare-fun b!236333 () Bool)

(declare-fun e!153487 () Bool)

(declare-fun call!21963 () Bool)

(assert (=> b!236333 (= e!153487 call!21963)))

(declare-fun b!236334 () Bool)

(assert (=> b!236334 (= e!153487 call!21963)))

(declare-fun b!236335 () Bool)

(declare-fun e!153488 () Bool)

(declare-fun contains!1653 (List!3474 (_ BitVec 64)) Bool)

(assert (=> b!236335 (= e!153488 (contains!1653 Nil!3471 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236336 () Bool)

(declare-fun e!153489 () Bool)

(assert (=> b!236336 (= e!153489 e!153487)))

(declare-fun c!39356 () Bool)

(assert (=> b!236336 (= c!39356 (validKeyInArray!0 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21960 () Bool)

(assert (=> bm!21960 (= call!21963 (arrayNoDuplicates!0 (_keys!6467 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39356 (Cons!3470 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000) Nil!3471) Nil!3471)))))

(declare-fun b!236337 () Bool)

(assert (=> b!236337 (= e!153490 e!153489)))

(declare-fun res!115891 () Bool)

(assert (=> b!236337 (=> (not res!115891) (not e!153489))))

(assert (=> b!236337 (= res!115891 (not e!153488))))

(declare-fun res!115892 () Bool)

(assert (=> b!236337 (=> (not res!115892) (not e!153488))))

(assert (=> b!236337 (= res!115892 (validKeyInArray!0 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59423 (not res!115893)) b!236337))

(assert (= (and b!236337 res!115892) b!236335))

(assert (= (and b!236337 res!115891) b!236336))

(assert (= (and b!236336 c!39356) b!236334))

(assert (= (and b!236336 (not c!39356)) b!236333))

(assert (= (or b!236334 b!236333) bm!21960))

(assert (=> b!236335 m!257275))

(assert (=> b!236335 m!257275))

(declare-fun m!257335 () Bool)

(assert (=> b!236335 m!257335))

(assert (=> b!236336 m!257275))

(assert (=> b!236336 m!257275))

(assert (=> b!236336 m!257325))

(assert (=> bm!21960 m!257275))

(declare-fun m!257337 () Bool)

(assert (=> bm!21960 m!257337))

(assert (=> b!236337 m!257275))

(assert (=> b!236337 m!257275))

(assert (=> b!236337 m!257325))

(assert (=> b!236222 d!59423))

(declare-fun d!59425 () Bool)

(declare-fun e!153493 () Bool)

(assert (=> d!59425 e!153493))

(declare-fun res!115898 () Bool)

(assert (=> d!59425 (=> (not res!115898) (not e!153493))))

(declare-fun lt!119532 () ListLongMap!3489)

(assert (=> d!59425 (= res!115898 (contains!1652 lt!119532 (_1!2298 (ite (or c!39348 c!39350) (tuple2!4575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))))))

(declare-fun lt!119535 () List!3473)

(assert (=> d!59425 (= lt!119532 (ListLongMap!3490 lt!119535))))

(declare-fun lt!119534 () Unit!7259)

(declare-fun lt!119533 () Unit!7259)

(assert (=> d!59425 (= lt!119534 lt!119533)))

(assert (=> d!59425 (= (getValueByKey!272 lt!119535 (_1!2298 (ite (or c!39348 c!39350) (tuple2!4575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))) (Some!277 (_2!2298 (ite (or c!39348 c!39350) (tuple2!4575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!152 (List!3473 (_ BitVec 64) V!7937) Unit!7259)

(assert (=> d!59425 (= lt!119533 (lemmaContainsTupThenGetReturnValue!152 lt!119535 (_1!2298 (ite (or c!39348 c!39350) (tuple2!4575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))) (_2!2298 (ite (or c!39348 c!39350) (tuple2!4575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))))))

(declare-fun insertStrictlySorted!155 (List!3473 (_ BitVec 64) V!7937) List!3473)

(assert (=> d!59425 (= lt!119535 (insertStrictlySorted!155 (toList!1760 (ite c!39348 call!21956 (ite c!39350 call!21958 call!21957))) (_1!2298 (ite (or c!39348 c!39350) (tuple2!4575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))) (_2!2298 (ite (or c!39348 c!39350) (tuple2!4575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))))))

(assert (=> d!59425 (= (+!640 (ite c!39348 call!21956 (ite c!39350 call!21958 call!21957)) (ite (or c!39348 c!39350) (tuple2!4575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))) lt!119532)))

(declare-fun b!236342 () Bool)

(declare-fun res!115899 () Bool)

(assert (=> b!236342 (=> (not res!115899) (not e!153493))))

(assert (=> b!236342 (= res!115899 (= (getValueByKey!272 (toList!1760 lt!119532) (_1!2298 (ite (or c!39348 c!39350) (tuple2!4575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))) (Some!277 (_2!2298 (ite (or c!39348 c!39350) (tuple2!4575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))))))))

(declare-fun b!236343 () Bool)

(declare-fun contains!1654 (List!3473 tuple2!4574) Bool)

(assert (=> b!236343 (= e!153493 (contains!1654 (toList!1760 lt!119532) (ite (or c!39348 c!39350) (tuple2!4575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4229 thiss!1504)) (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))))))

(assert (= (and d!59425 res!115898) b!236342))

(assert (= (and b!236342 res!115899) b!236343))

(declare-fun m!257339 () Bool)

(assert (=> d!59425 m!257339))

(declare-fun m!257341 () Bool)

(assert (=> d!59425 m!257341))

(declare-fun m!257343 () Bool)

(assert (=> d!59425 m!257343))

(declare-fun m!257345 () Bool)

(assert (=> d!59425 m!257345))

(declare-fun m!257347 () Bool)

(assert (=> b!236342 m!257347))

(declare-fun m!257349 () Bool)

(assert (=> b!236343 m!257349))

(assert (=> bm!21955 d!59425))

(declare-fun d!59427 () Bool)

(declare-fun res!115904 () Bool)

(declare-fun e!153498 () Bool)

(assert (=> d!59427 (=> res!115904 e!153498)))

(assert (=> d!59427 (= res!115904 (and ((_ is Cons!3469) (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))) (= (_1!2298 (h!4121 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))))) key!932)))))

(assert (=> d!59427 (= (containsKey!263 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932) e!153498)))

(declare-fun b!236348 () Bool)

(declare-fun e!153499 () Bool)

(assert (=> b!236348 (= e!153498 e!153499)))

(declare-fun res!115905 () Bool)

(assert (=> b!236348 (=> (not res!115905) (not e!153499))))

(assert (=> b!236348 (= res!115905 (and (or (not ((_ is Cons!3469) (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))))) (bvsle (_1!2298 (h!4121 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))))) key!932)) ((_ is Cons!3469) (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))) (bvslt (_1!2298 (h!4121 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))))) key!932)))))

(declare-fun b!236349 () Bool)

(assert (=> b!236349 (= e!153499 (containsKey!263 (t!8444 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))) key!932))))

(assert (= (and d!59427 (not res!115904)) b!236348))

(assert (= (and b!236348 res!115905) b!236349))

(declare-fun m!257351 () Bool)

(assert (=> b!236349 m!257351))

(assert (=> d!59419 d!59427))

(declare-fun d!59429 () Bool)

(declare-fun get!2863 (Option!278) V!7937)

(assert (=> d!59429 (= (apply!213 lt!119522 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)) (get!2863 (getValueByKey!272 (toList!1760 lt!119522) (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8746 () Bool)

(assert (= bs!8746 d!59429))

(assert (=> bs!8746 m!257275))

(declare-fun m!257353 () Bool)

(assert (=> bs!8746 m!257353))

(assert (=> bs!8746 m!257353))

(declare-fun m!257355 () Bool)

(assert (=> bs!8746 m!257355))

(assert (=> b!236309 d!59429))

(declare-fun d!59431 () Bool)

(declare-fun c!39359 () Bool)

(assert (=> d!59431 (= c!39359 ((_ is ValueCellFull!2765) (select (arr!5557 (_values!4371 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!153502 () V!7937)

(assert (=> d!59431 (= (get!2862 (select (arr!5557 (_values!4371 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!556 (defaultEntry!4388 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!153502)))

(declare-fun b!236354 () Bool)

(declare-fun get!2864 (ValueCell!2765 V!7937) V!7937)

(assert (=> b!236354 (= e!153502 (get!2864 (select (arr!5557 (_values!4371 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!556 (defaultEntry!4388 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236355 () Bool)

(declare-fun get!2865 (ValueCell!2765 V!7937) V!7937)

(assert (=> b!236355 (= e!153502 (get!2865 (select (arr!5557 (_values!4371 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!556 (defaultEntry!4388 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59431 c!39359) b!236354))

(assert (= (and d!59431 (not c!39359)) b!236355))

(assert (=> b!236354 m!257315))

(assert (=> b!236354 m!257317))

(declare-fun m!257357 () Bool)

(assert (=> b!236354 m!257357))

(assert (=> b!236355 m!257315))

(assert (=> b!236355 m!257317))

(declare-fun m!257359 () Bool)

(assert (=> b!236355 m!257359))

(assert (=> b!236309 d!59431))

(declare-fun d!59433 () Bool)

(declare-fun e!153503 () Bool)

(assert (=> d!59433 e!153503))

(declare-fun res!115906 () Bool)

(assert (=> d!59433 (=> res!115906 e!153503)))

(declare-fun lt!119536 () Bool)

(assert (=> d!59433 (= res!115906 (not lt!119536))))

(declare-fun lt!119537 () Bool)

(assert (=> d!59433 (= lt!119536 lt!119537)))

(declare-fun lt!119539 () Unit!7259)

(declare-fun e!153504 () Unit!7259)

(assert (=> d!59433 (= lt!119539 e!153504)))

(declare-fun c!39360 () Bool)

(assert (=> d!59433 (= c!39360 lt!119537)))

(assert (=> d!59433 (= lt!119537 (containsKey!263 (toList!1760 lt!119522) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59433 (= (contains!1652 lt!119522 #b0000000000000000000000000000000000000000000000000000000000000000) lt!119536)))

(declare-fun b!236356 () Bool)

(declare-fun lt!119538 () Unit!7259)

(assert (=> b!236356 (= e!153504 lt!119538)))

(assert (=> b!236356 (= lt!119538 (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1760 lt!119522) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236356 (isDefined!212 (getValueByKey!272 (toList!1760 lt!119522) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236357 () Bool)

(declare-fun Unit!7263 () Unit!7259)

(assert (=> b!236357 (= e!153504 Unit!7263)))

(declare-fun b!236358 () Bool)

(assert (=> b!236358 (= e!153503 (isDefined!212 (getValueByKey!272 (toList!1760 lt!119522) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59433 c!39360) b!236356))

(assert (= (and d!59433 (not c!39360)) b!236357))

(assert (= (and d!59433 (not res!115906)) b!236358))

(declare-fun m!257361 () Bool)

(assert (=> d!59433 m!257361))

(declare-fun m!257363 () Bool)

(assert (=> b!236356 m!257363))

(declare-fun m!257365 () Bool)

(assert (=> b!236356 m!257365))

(assert (=> b!236356 m!257365))

(declare-fun m!257367 () Bool)

(assert (=> b!236356 m!257367))

(assert (=> b!236358 m!257365))

(assert (=> b!236358 m!257365))

(assert (=> b!236358 m!257367))

(assert (=> bm!21951 d!59433))

(declare-fun b!236383 () Bool)

(declare-fun e!153520 () ListLongMap!3489)

(declare-fun call!21966 () ListLongMap!3489)

(assert (=> b!236383 (= e!153520 call!21966)))

(declare-fun b!236384 () Bool)

(declare-fun res!115917 () Bool)

(declare-fun e!153519 () Bool)

(assert (=> b!236384 (=> (not res!115917) (not e!153519))))

(declare-fun lt!119559 () ListLongMap!3489)

(assert (=> b!236384 (= res!115917 (not (contains!1652 lt!119559 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236385 () Bool)

(declare-fun e!153524 () Bool)

(declare-fun e!153522 () Bool)

(assert (=> b!236385 (= e!153524 e!153522)))

(declare-fun c!39372 () Bool)

(assert (=> b!236385 (= c!39372 (bvslt #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))))))

(declare-fun b!236386 () Bool)

(declare-fun lt!119560 () Unit!7259)

(declare-fun lt!119556 () Unit!7259)

(assert (=> b!236386 (= lt!119560 lt!119556)))

(declare-fun lt!119555 () V!7937)

(declare-fun lt!119554 () (_ BitVec 64))

(declare-fun lt!119558 () ListLongMap!3489)

(declare-fun lt!119557 () (_ BitVec 64))

(assert (=> b!236386 (not (contains!1652 (+!640 lt!119558 (tuple2!4575 lt!119554 lt!119555)) lt!119557))))

(declare-fun addStillNotContains!117 (ListLongMap!3489 (_ BitVec 64) V!7937 (_ BitVec 64)) Unit!7259)

(assert (=> b!236386 (= lt!119556 (addStillNotContains!117 lt!119558 lt!119554 lt!119555 lt!119557))))

(assert (=> b!236386 (= lt!119557 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!236386 (= lt!119555 (get!2862 (select (arr!5557 (_values!4371 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!556 (defaultEntry!4388 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236386 (= lt!119554 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236386 (= lt!119558 call!21966)))

(assert (=> b!236386 (= e!153520 (+!640 call!21966 (tuple2!4575 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000) (get!2862 (select (arr!5557 (_values!4371 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!556 (defaultEntry!4388 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!21963 () Bool)

(assert (=> bm!21963 (= call!21966 (getCurrentListMapNoExtraKeys!529 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4388 thiss!1504)))))

(declare-fun b!236387 () Bool)

(declare-fun e!153525 () Bool)

(assert (=> b!236387 (= e!153524 e!153525)))

(assert (=> b!236387 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))))))

(declare-fun res!115918 () Bool)

(assert (=> b!236387 (= res!115918 (contains!1652 lt!119559 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236387 (=> (not res!115918) (not e!153525))))

(declare-fun b!236388 () Bool)

(assert (=> b!236388 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))))))

(assert (=> b!236388 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5894 (_values!4371 thiss!1504))))))

(assert (=> b!236388 (= e!153525 (= (apply!213 lt!119559 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)) (get!2862 (select (arr!5557 (_values!4371 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!556 (defaultEntry!4388 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!236389 () Bool)

(assert (=> b!236389 (= e!153522 (= lt!119559 (getCurrentListMapNoExtraKeys!529 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4388 thiss!1504))))))

(declare-fun b!236390 () Bool)

(assert (=> b!236390 (= e!153519 e!153524)))

(declare-fun c!39371 () Bool)

(declare-fun e!153521 () Bool)

(assert (=> b!236390 (= c!39371 e!153521)))

(declare-fun res!115915 () Bool)

(assert (=> b!236390 (=> (not res!115915) (not e!153521))))

(assert (=> b!236390 (= res!115915 (bvslt #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))))))

(declare-fun d!59435 () Bool)

(assert (=> d!59435 e!153519))

(declare-fun res!115916 () Bool)

(assert (=> d!59435 (=> (not res!115916) (not e!153519))))

(assert (=> d!59435 (= res!115916 (not (contains!1652 lt!119559 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!153523 () ListLongMap!3489)

(assert (=> d!59435 (= lt!119559 e!153523)))

(declare-fun c!39369 () Bool)

(assert (=> d!59435 (= c!39369 (bvsge #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))))))

(assert (=> d!59435 (validMask!0 (mask!10373 thiss!1504))))

(assert (=> d!59435 (= (getCurrentListMapNoExtraKeys!529 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)) lt!119559)))

(declare-fun b!236391 () Bool)

(assert (=> b!236391 (= e!153523 e!153520)))

(declare-fun c!39370 () Bool)

(assert (=> b!236391 (= c!39370 (validKeyInArray!0 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236392 () Bool)

(assert (=> b!236392 (= e!153523 (ListLongMap!3490 Nil!3470))))

(declare-fun b!236393 () Bool)

(declare-fun isEmpty!518 (ListLongMap!3489) Bool)

(assert (=> b!236393 (= e!153522 (isEmpty!518 lt!119559))))

(declare-fun b!236394 () Bool)

(assert (=> b!236394 (= e!153521 (validKeyInArray!0 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236394 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!59435 c!39369) b!236392))

(assert (= (and d!59435 (not c!39369)) b!236391))

(assert (= (and b!236391 c!39370) b!236386))

(assert (= (and b!236391 (not c!39370)) b!236383))

(assert (= (or b!236386 b!236383) bm!21963))

(assert (= (and d!59435 res!115916) b!236384))

(assert (= (and b!236384 res!115917) b!236390))

(assert (= (and b!236390 res!115915) b!236394))

(assert (= (and b!236390 c!39371) b!236387))

(assert (= (and b!236390 (not c!39371)) b!236385))

(assert (= (and b!236387 res!115918) b!236388))

(assert (= (and b!236385 c!39372) b!236389))

(assert (= (and b!236385 (not c!39372)) b!236393))

(declare-fun b_lambda!7941 () Bool)

(assert (=> (not b_lambda!7941) (not b!236386)))

(assert (=> b!236386 t!8446))

(declare-fun b_and!13311 () Bool)

(assert (= b_and!13309 (and (=> t!8446 result!5131) b_and!13311)))

(declare-fun b_lambda!7943 () Bool)

(assert (=> (not b_lambda!7943) (not b!236388)))

(assert (=> b!236388 t!8446))

(declare-fun b_and!13313 () Bool)

(assert (= b_and!13311 (and (=> t!8446 result!5131) b_and!13313)))

(declare-fun m!257369 () Bool)

(assert (=> b!236389 m!257369))

(assert (=> bm!21963 m!257369))

(declare-fun m!257371 () Bool)

(assert (=> b!236384 m!257371))

(declare-fun m!257373 () Bool)

(assert (=> d!59435 m!257373))

(assert (=> d!59435 m!257203))

(assert (=> b!236387 m!257275))

(assert (=> b!236387 m!257275))

(declare-fun m!257375 () Bool)

(assert (=> b!236387 m!257375))

(declare-fun m!257377 () Bool)

(assert (=> b!236386 m!257377))

(assert (=> b!236386 m!257275))

(declare-fun m!257379 () Bool)

(assert (=> b!236386 m!257379))

(assert (=> b!236386 m!257315))

(assert (=> b!236386 m!257315))

(assert (=> b!236386 m!257317))

(assert (=> b!236386 m!257319))

(declare-fun m!257381 () Bool)

(assert (=> b!236386 m!257381))

(assert (=> b!236386 m!257317))

(assert (=> b!236386 m!257377))

(declare-fun m!257383 () Bool)

(assert (=> b!236386 m!257383))

(assert (=> b!236391 m!257275))

(assert (=> b!236391 m!257275))

(assert (=> b!236391 m!257325))

(assert (=> b!236394 m!257275))

(assert (=> b!236394 m!257275))

(assert (=> b!236394 m!257325))

(declare-fun m!257385 () Bool)

(assert (=> b!236393 m!257385))

(assert (=> b!236388 m!257275))

(declare-fun m!257387 () Bool)

(assert (=> b!236388 m!257387))

(assert (=> b!236388 m!257275))

(assert (=> b!236388 m!257315))

(assert (=> b!236388 m!257315))

(assert (=> b!236388 m!257317))

(assert (=> b!236388 m!257319))

(assert (=> b!236388 m!257317))

(assert (=> bm!21956 d!59435))

(declare-fun d!59437 () Bool)

(assert (=> d!59437 (= (validKeyInArray!0 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!236300 d!59437))

(declare-fun d!59439 () Bool)

(declare-fun e!153526 () Bool)

(assert (=> d!59439 e!153526))

(declare-fun res!115919 () Bool)

(assert (=> d!59439 (=> (not res!115919) (not e!153526))))

(declare-fun lt!119561 () ListLongMap!3489)

(assert (=> d!59439 (= res!115919 (contains!1652 lt!119561 (_1!2298 (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))))))

(declare-fun lt!119564 () List!3473)

(assert (=> d!59439 (= lt!119561 (ListLongMap!3490 lt!119564))))

(declare-fun lt!119563 () Unit!7259)

(declare-fun lt!119562 () Unit!7259)

(assert (=> d!59439 (= lt!119563 lt!119562)))

(assert (=> d!59439 (= (getValueByKey!272 lt!119564 (_1!2298 (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))) (Some!277 (_2!2298 (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))))))

(assert (=> d!59439 (= lt!119562 (lemmaContainsTupThenGetReturnValue!152 lt!119564 (_1!2298 (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))) (_2!2298 (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))))))

(assert (=> d!59439 (= lt!119564 (insertStrictlySorted!155 (toList!1760 call!21960) (_1!2298 (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))) (_2!2298 (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))))))

(assert (=> d!59439 (= (+!640 call!21960 (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))) lt!119561)))

(declare-fun b!236395 () Bool)

(declare-fun res!115920 () Bool)

(assert (=> b!236395 (=> (not res!115920) (not e!153526))))

(assert (=> b!236395 (= res!115920 (= (getValueByKey!272 (toList!1760 lt!119561) (_1!2298 (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504)))) (Some!277 (_2!2298 (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))))))

(declare-fun b!236396 () Bool)

(assert (=> b!236396 (= e!153526 (contains!1654 (toList!1760 lt!119561) (tuple2!4575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4229 thiss!1504))))))

(assert (= (and d!59439 res!115919) b!236395))

(assert (= (and b!236395 res!115920) b!236396))

(declare-fun m!257389 () Bool)

(assert (=> d!59439 m!257389))

(declare-fun m!257391 () Bool)

(assert (=> d!59439 m!257391))

(declare-fun m!257393 () Bool)

(assert (=> d!59439 m!257393))

(declare-fun m!257395 () Bool)

(assert (=> d!59439 m!257395))

(declare-fun m!257397 () Bool)

(assert (=> b!236395 m!257397))

(declare-fun m!257399 () Bool)

(assert (=> b!236396 m!257399))

(assert (=> b!236308 d!59439))

(declare-fun d!59441 () Bool)

(declare-fun e!153527 () Bool)

(assert (=> d!59441 e!153527))

(declare-fun res!115921 () Bool)

(assert (=> d!59441 (=> res!115921 e!153527)))

(declare-fun lt!119565 () Bool)

(assert (=> d!59441 (= res!115921 (not lt!119565))))

(declare-fun lt!119566 () Bool)

(assert (=> d!59441 (= lt!119565 lt!119566)))

(declare-fun lt!119568 () Unit!7259)

(declare-fun e!153528 () Unit!7259)

(assert (=> d!59441 (= lt!119568 e!153528)))

(declare-fun c!39373 () Bool)

(assert (=> d!59441 (= c!39373 lt!119566)))

(assert (=> d!59441 (= lt!119566 (containsKey!263 (toList!1760 lt!119522) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59441 (= (contains!1652 lt!119522 #b1000000000000000000000000000000000000000000000000000000000000000) lt!119565)))

(declare-fun b!236397 () Bool)

(declare-fun lt!119567 () Unit!7259)

(assert (=> b!236397 (= e!153528 lt!119567)))

(assert (=> b!236397 (= lt!119567 (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1760 lt!119522) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236397 (isDefined!212 (getValueByKey!272 (toList!1760 lt!119522) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236398 () Bool)

(declare-fun Unit!7264 () Unit!7259)

(assert (=> b!236398 (= e!153528 Unit!7264)))

(declare-fun b!236399 () Bool)

(assert (=> b!236399 (= e!153527 (isDefined!212 (getValueByKey!272 (toList!1760 lt!119522) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59441 c!39373) b!236397))

(assert (= (and d!59441 (not c!39373)) b!236398))

(assert (= (and d!59441 (not res!115921)) b!236399))

(declare-fun m!257401 () Bool)

(assert (=> d!59441 m!257401))

(declare-fun m!257403 () Bool)

(assert (=> b!236397 m!257403))

(declare-fun m!257405 () Bool)

(assert (=> b!236397 m!257405))

(assert (=> b!236397 m!257405))

(declare-fun m!257407 () Bool)

(assert (=> b!236397 m!257407))

(assert (=> b!236399 m!257405))

(assert (=> b!236399 m!257405))

(assert (=> b!236399 m!257407))

(assert (=> bm!21953 d!59441))

(declare-fun d!59443 () Bool)

(assert (=> d!59443 (= (apply!213 (+!640 lt!119513 (tuple2!4575 lt!119505 (zeroValue!4229 thiss!1504))) lt!119504) (apply!213 lt!119513 lt!119504))))

(declare-fun lt!119571 () Unit!7259)

(declare-fun choose!1111 (ListLongMap!3489 (_ BitVec 64) V!7937 (_ BitVec 64)) Unit!7259)

(assert (=> d!59443 (= lt!119571 (choose!1111 lt!119513 lt!119505 (zeroValue!4229 thiss!1504) lt!119504))))

(declare-fun e!153531 () Bool)

(assert (=> d!59443 e!153531))

(declare-fun res!115924 () Bool)

(assert (=> d!59443 (=> (not res!115924) (not e!153531))))

(assert (=> d!59443 (= res!115924 (contains!1652 lt!119513 lt!119504))))

(assert (=> d!59443 (= (addApplyDifferent!189 lt!119513 lt!119505 (zeroValue!4229 thiss!1504) lt!119504) lt!119571)))

(declare-fun b!236403 () Bool)

(assert (=> b!236403 (= e!153531 (not (= lt!119504 lt!119505)))))

(assert (= (and d!59443 res!115924) b!236403))

(assert (=> d!59443 m!257307))

(assert (=> d!59443 m!257285))

(assert (=> d!59443 m!257287))

(assert (=> d!59443 m!257285))

(declare-fun m!257409 () Bool)

(assert (=> d!59443 m!257409))

(declare-fun m!257411 () Bool)

(assert (=> d!59443 m!257411))

(assert (=> b!236299 d!59443))

(declare-fun d!59445 () Bool)

(assert (=> d!59445 (= (apply!213 (+!640 lt!119516 (tuple2!4575 lt!119520 (minValue!4229 thiss!1504))) lt!119508) (apply!213 lt!119516 lt!119508))))

(declare-fun lt!119572 () Unit!7259)

(assert (=> d!59445 (= lt!119572 (choose!1111 lt!119516 lt!119520 (minValue!4229 thiss!1504) lt!119508))))

(declare-fun e!153532 () Bool)

(assert (=> d!59445 e!153532))

(declare-fun res!115925 () Bool)

(assert (=> d!59445 (=> (not res!115925) (not e!153532))))

(assert (=> d!59445 (= res!115925 (contains!1652 lt!119516 lt!119508))))

(assert (=> d!59445 (= (addApplyDifferent!189 lt!119516 lt!119520 (minValue!4229 thiss!1504) lt!119508) lt!119572)))

(declare-fun b!236404 () Bool)

(assert (=> b!236404 (= e!153532 (not (= lt!119508 lt!119520)))))

(assert (= (and d!59445 res!115925) b!236404))

(assert (=> d!59445 m!257309))

(assert (=> d!59445 m!257289))

(assert (=> d!59445 m!257301))

(assert (=> d!59445 m!257289))

(declare-fun m!257413 () Bool)

(assert (=> d!59445 m!257413))

(declare-fun m!257415 () Bool)

(assert (=> d!59445 m!257415))

(assert (=> b!236299 d!59445))

(declare-fun d!59447 () Bool)

(assert (=> d!59447 (= (apply!213 (+!640 lt!119513 (tuple2!4575 lt!119505 (zeroValue!4229 thiss!1504))) lt!119504) (get!2863 (getValueByKey!272 (toList!1760 (+!640 lt!119513 (tuple2!4575 lt!119505 (zeroValue!4229 thiss!1504)))) lt!119504)))))

(declare-fun bs!8747 () Bool)

(assert (= bs!8747 d!59447))

(declare-fun m!257417 () Bool)

(assert (=> bs!8747 m!257417))

(assert (=> bs!8747 m!257417))

(declare-fun m!257419 () Bool)

(assert (=> bs!8747 m!257419))

(assert (=> b!236299 d!59447))

(declare-fun d!59449 () Bool)

(assert (=> d!59449 (= (apply!213 (+!640 lt!119521 (tuple2!4575 lt!119519 (minValue!4229 thiss!1504))) lt!119507) (get!2863 (getValueByKey!272 (toList!1760 (+!640 lt!119521 (tuple2!4575 lt!119519 (minValue!4229 thiss!1504)))) lt!119507)))))

(declare-fun bs!8748 () Bool)

(assert (= bs!8748 d!59449))

(declare-fun m!257421 () Bool)

(assert (=> bs!8748 m!257421))

(assert (=> bs!8748 m!257421))

(declare-fun m!257423 () Bool)

(assert (=> bs!8748 m!257423))

(assert (=> b!236299 d!59449))

(declare-fun d!59451 () Bool)

(assert (=> d!59451 (contains!1652 (+!640 lt!119511 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504))) lt!119514)))

(declare-fun lt!119575 () Unit!7259)

(declare-fun choose!1112 (ListLongMap!3489 (_ BitVec 64) V!7937 (_ BitVec 64)) Unit!7259)

(assert (=> d!59451 (= lt!119575 (choose!1112 lt!119511 lt!119518 (zeroValue!4229 thiss!1504) lt!119514))))

(assert (=> d!59451 (contains!1652 lt!119511 lt!119514)))

(assert (=> d!59451 (= (addStillContains!189 lt!119511 lt!119518 (zeroValue!4229 thiss!1504) lt!119514) lt!119575)))

(declare-fun bs!8749 () Bool)

(assert (= bs!8749 d!59451))

(assert (=> bs!8749 m!257281))

(assert (=> bs!8749 m!257281))

(assert (=> bs!8749 m!257303))

(declare-fun m!257425 () Bool)

(assert (=> bs!8749 m!257425))

(declare-fun m!257427 () Bool)

(assert (=> bs!8749 m!257427))

(assert (=> b!236299 d!59451))

(declare-fun d!59453 () Bool)

(declare-fun e!153533 () Bool)

(assert (=> d!59453 e!153533))

(declare-fun res!115926 () Bool)

(assert (=> d!59453 (=> (not res!115926) (not e!153533))))

(declare-fun lt!119576 () ListLongMap!3489)

(assert (=> d!59453 (= res!115926 (contains!1652 lt!119576 (_1!2298 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504)))))))

(declare-fun lt!119579 () List!3473)

(assert (=> d!59453 (= lt!119576 (ListLongMap!3490 lt!119579))))

(declare-fun lt!119578 () Unit!7259)

(declare-fun lt!119577 () Unit!7259)

(assert (=> d!59453 (= lt!119578 lt!119577)))

(assert (=> d!59453 (= (getValueByKey!272 lt!119579 (_1!2298 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504)))) (Some!277 (_2!2298 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504)))))))

(assert (=> d!59453 (= lt!119577 (lemmaContainsTupThenGetReturnValue!152 lt!119579 (_1!2298 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504))) (_2!2298 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504)))))))

(assert (=> d!59453 (= lt!119579 (insertStrictlySorted!155 (toList!1760 lt!119511) (_1!2298 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504))) (_2!2298 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504)))))))

(assert (=> d!59453 (= (+!640 lt!119511 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504))) lt!119576)))

(declare-fun b!236406 () Bool)

(declare-fun res!115927 () Bool)

(assert (=> b!236406 (=> (not res!115927) (not e!153533))))

(assert (=> b!236406 (= res!115927 (= (getValueByKey!272 (toList!1760 lt!119576) (_1!2298 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504)))) (Some!277 (_2!2298 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504))))))))

(declare-fun b!236407 () Bool)

(assert (=> b!236407 (= e!153533 (contains!1654 (toList!1760 lt!119576) (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504))))))

(assert (= (and d!59453 res!115926) b!236406))

(assert (= (and b!236406 res!115927) b!236407))

(declare-fun m!257429 () Bool)

(assert (=> d!59453 m!257429))

(declare-fun m!257431 () Bool)

(assert (=> d!59453 m!257431))

(declare-fun m!257433 () Bool)

(assert (=> d!59453 m!257433))

(declare-fun m!257435 () Bool)

(assert (=> d!59453 m!257435))

(declare-fun m!257437 () Bool)

(assert (=> b!236406 m!257437))

(declare-fun m!257439 () Bool)

(assert (=> b!236407 m!257439))

(assert (=> b!236299 d!59453))

(declare-fun d!59455 () Bool)

(assert (=> d!59455 (= (apply!213 (+!640 lt!119521 (tuple2!4575 lt!119519 (minValue!4229 thiss!1504))) lt!119507) (apply!213 lt!119521 lt!119507))))

(declare-fun lt!119580 () Unit!7259)

(assert (=> d!59455 (= lt!119580 (choose!1111 lt!119521 lt!119519 (minValue!4229 thiss!1504) lt!119507))))

(declare-fun e!153534 () Bool)

(assert (=> d!59455 e!153534))

(declare-fun res!115928 () Bool)

(assert (=> d!59455 (=> (not res!115928) (not e!153534))))

(assert (=> d!59455 (= res!115928 (contains!1652 lt!119521 lt!119507))))

(assert (=> d!59455 (= (addApplyDifferent!189 lt!119521 lt!119519 (minValue!4229 thiss!1504) lt!119507) lt!119580)))

(declare-fun b!236408 () Bool)

(assert (=> b!236408 (= e!153534 (not (= lt!119507 lt!119519)))))

(assert (= (and d!59455 res!115928) b!236408))

(assert (=> d!59455 m!257279))

(assert (=> d!59455 m!257297))

(assert (=> d!59455 m!257305))

(assert (=> d!59455 m!257297))

(declare-fun m!257441 () Bool)

(assert (=> d!59455 m!257441))

(declare-fun m!257443 () Bool)

(assert (=> d!59455 m!257443))

(assert (=> b!236299 d!59455))

(declare-fun d!59457 () Bool)

(declare-fun e!153535 () Bool)

(assert (=> d!59457 e!153535))

(declare-fun res!115929 () Bool)

(assert (=> d!59457 (=> (not res!115929) (not e!153535))))

(declare-fun lt!119581 () ListLongMap!3489)

(assert (=> d!59457 (= res!115929 (contains!1652 lt!119581 (_1!2298 (tuple2!4575 lt!119519 (minValue!4229 thiss!1504)))))))

(declare-fun lt!119584 () List!3473)

(assert (=> d!59457 (= lt!119581 (ListLongMap!3490 lt!119584))))

(declare-fun lt!119583 () Unit!7259)

(declare-fun lt!119582 () Unit!7259)

(assert (=> d!59457 (= lt!119583 lt!119582)))

(assert (=> d!59457 (= (getValueByKey!272 lt!119584 (_1!2298 (tuple2!4575 lt!119519 (minValue!4229 thiss!1504)))) (Some!277 (_2!2298 (tuple2!4575 lt!119519 (minValue!4229 thiss!1504)))))))

(assert (=> d!59457 (= lt!119582 (lemmaContainsTupThenGetReturnValue!152 lt!119584 (_1!2298 (tuple2!4575 lt!119519 (minValue!4229 thiss!1504))) (_2!2298 (tuple2!4575 lt!119519 (minValue!4229 thiss!1504)))))))

(assert (=> d!59457 (= lt!119584 (insertStrictlySorted!155 (toList!1760 lt!119521) (_1!2298 (tuple2!4575 lt!119519 (minValue!4229 thiss!1504))) (_2!2298 (tuple2!4575 lt!119519 (minValue!4229 thiss!1504)))))))

(assert (=> d!59457 (= (+!640 lt!119521 (tuple2!4575 lt!119519 (minValue!4229 thiss!1504))) lt!119581)))

(declare-fun b!236409 () Bool)

(declare-fun res!115930 () Bool)

(assert (=> b!236409 (=> (not res!115930) (not e!153535))))

(assert (=> b!236409 (= res!115930 (= (getValueByKey!272 (toList!1760 lt!119581) (_1!2298 (tuple2!4575 lt!119519 (minValue!4229 thiss!1504)))) (Some!277 (_2!2298 (tuple2!4575 lt!119519 (minValue!4229 thiss!1504))))))))

(declare-fun b!236410 () Bool)

(assert (=> b!236410 (= e!153535 (contains!1654 (toList!1760 lt!119581) (tuple2!4575 lt!119519 (minValue!4229 thiss!1504))))))

(assert (= (and d!59457 res!115929) b!236409))

(assert (= (and b!236409 res!115930) b!236410))

(declare-fun m!257445 () Bool)

(assert (=> d!59457 m!257445))

(declare-fun m!257447 () Bool)

(assert (=> d!59457 m!257447))

(declare-fun m!257449 () Bool)

(assert (=> d!59457 m!257449))

(declare-fun m!257451 () Bool)

(assert (=> d!59457 m!257451))

(declare-fun m!257453 () Bool)

(assert (=> b!236409 m!257453))

(declare-fun m!257455 () Bool)

(assert (=> b!236410 m!257455))

(assert (=> b!236299 d!59457))

(assert (=> b!236299 d!59435))

(declare-fun d!59459 () Bool)

(declare-fun e!153536 () Bool)

(assert (=> d!59459 e!153536))

(declare-fun res!115931 () Bool)

(assert (=> d!59459 (=> (not res!115931) (not e!153536))))

(declare-fun lt!119585 () ListLongMap!3489)

(assert (=> d!59459 (= res!115931 (contains!1652 lt!119585 (_1!2298 (tuple2!4575 lt!119505 (zeroValue!4229 thiss!1504)))))))

(declare-fun lt!119588 () List!3473)

(assert (=> d!59459 (= lt!119585 (ListLongMap!3490 lt!119588))))

(declare-fun lt!119587 () Unit!7259)

(declare-fun lt!119586 () Unit!7259)

(assert (=> d!59459 (= lt!119587 lt!119586)))

(assert (=> d!59459 (= (getValueByKey!272 lt!119588 (_1!2298 (tuple2!4575 lt!119505 (zeroValue!4229 thiss!1504)))) (Some!277 (_2!2298 (tuple2!4575 lt!119505 (zeroValue!4229 thiss!1504)))))))

(assert (=> d!59459 (= lt!119586 (lemmaContainsTupThenGetReturnValue!152 lt!119588 (_1!2298 (tuple2!4575 lt!119505 (zeroValue!4229 thiss!1504))) (_2!2298 (tuple2!4575 lt!119505 (zeroValue!4229 thiss!1504)))))))

(assert (=> d!59459 (= lt!119588 (insertStrictlySorted!155 (toList!1760 lt!119513) (_1!2298 (tuple2!4575 lt!119505 (zeroValue!4229 thiss!1504))) (_2!2298 (tuple2!4575 lt!119505 (zeroValue!4229 thiss!1504)))))))

(assert (=> d!59459 (= (+!640 lt!119513 (tuple2!4575 lt!119505 (zeroValue!4229 thiss!1504))) lt!119585)))

(declare-fun b!236411 () Bool)

(declare-fun res!115932 () Bool)

(assert (=> b!236411 (=> (not res!115932) (not e!153536))))

(assert (=> b!236411 (= res!115932 (= (getValueByKey!272 (toList!1760 lt!119585) (_1!2298 (tuple2!4575 lt!119505 (zeroValue!4229 thiss!1504)))) (Some!277 (_2!2298 (tuple2!4575 lt!119505 (zeroValue!4229 thiss!1504))))))))

(declare-fun b!236412 () Bool)

(assert (=> b!236412 (= e!153536 (contains!1654 (toList!1760 lt!119585) (tuple2!4575 lt!119505 (zeroValue!4229 thiss!1504))))))

(assert (= (and d!59459 res!115931) b!236411))

(assert (= (and b!236411 res!115932) b!236412))

(declare-fun m!257457 () Bool)

(assert (=> d!59459 m!257457))

(declare-fun m!257459 () Bool)

(assert (=> d!59459 m!257459))

(declare-fun m!257461 () Bool)

(assert (=> d!59459 m!257461))

(declare-fun m!257463 () Bool)

(assert (=> d!59459 m!257463))

(declare-fun m!257465 () Bool)

(assert (=> b!236411 m!257465))

(declare-fun m!257467 () Bool)

(assert (=> b!236412 m!257467))

(assert (=> b!236299 d!59459))

(declare-fun d!59461 () Bool)

(assert (=> d!59461 (= (apply!213 lt!119516 lt!119508) (get!2863 (getValueByKey!272 (toList!1760 lt!119516) lt!119508)))))

(declare-fun bs!8750 () Bool)

(assert (= bs!8750 d!59461))

(declare-fun m!257469 () Bool)

(assert (=> bs!8750 m!257469))

(assert (=> bs!8750 m!257469))

(declare-fun m!257471 () Bool)

(assert (=> bs!8750 m!257471))

(assert (=> b!236299 d!59461))

(declare-fun d!59463 () Bool)

(assert (=> d!59463 (= (apply!213 lt!119521 lt!119507) (get!2863 (getValueByKey!272 (toList!1760 lt!119521) lt!119507)))))

(declare-fun bs!8751 () Bool)

(assert (= bs!8751 d!59463))

(declare-fun m!257473 () Bool)

(assert (=> bs!8751 m!257473))

(assert (=> bs!8751 m!257473))

(declare-fun m!257475 () Bool)

(assert (=> bs!8751 m!257475))

(assert (=> b!236299 d!59463))

(declare-fun d!59465 () Bool)

(assert (=> d!59465 (= (apply!213 lt!119513 lt!119504) (get!2863 (getValueByKey!272 (toList!1760 lt!119513) lt!119504)))))

(declare-fun bs!8752 () Bool)

(assert (= bs!8752 d!59465))

(declare-fun m!257477 () Bool)

(assert (=> bs!8752 m!257477))

(assert (=> bs!8752 m!257477))

(declare-fun m!257479 () Bool)

(assert (=> bs!8752 m!257479))

(assert (=> b!236299 d!59465))

(declare-fun d!59467 () Bool)

(assert (=> d!59467 (= (apply!213 (+!640 lt!119516 (tuple2!4575 lt!119520 (minValue!4229 thiss!1504))) lt!119508) (get!2863 (getValueByKey!272 (toList!1760 (+!640 lt!119516 (tuple2!4575 lt!119520 (minValue!4229 thiss!1504)))) lt!119508)))))

(declare-fun bs!8753 () Bool)

(assert (= bs!8753 d!59467))

(declare-fun m!257481 () Bool)

(assert (=> bs!8753 m!257481))

(assert (=> bs!8753 m!257481))

(declare-fun m!257483 () Bool)

(assert (=> bs!8753 m!257483))

(assert (=> b!236299 d!59467))

(declare-fun d!59469 () Bool)

(declare-fun e!153537 () Bool)

(assert (=> d!59469 e!153537))

(declare-fun res!115933 () Bool)

(assert (=> d!59469 (=> (not res!115933) (not e!153537))))

(declare-fun lt!119589 () ListLongMap!3489)

(assert (=> d!59469 (= res!115933 (contains!1652 lt!119589 (_1!2298 (tuple2!4575 lt!119520 (minValue!4229 thiss!1504)))))))

(declare-fun lt!119592 () List!3473)

(assert (=> d!59469 (= lt!119589 (ListLongMap!3490 lt!119592))))

(declare-fun lt!119591 () Unit!7259)

(declare-fun lt!119590 () Unit!7259)

(assert (=> d!59469 (= lt!119591 lt!119590)))

(assert (=> d!59469 (= (getValueByKey!272 lt!119592 (_1!2298 (tuple2!4575 lt!119520 (minValue!4229 thiss!1504)))) (Some!277 (_2!2298 (tuple2!4575 lt!119520 (minValue!4229 thiss!1504)))))))

(assert (=> d!59469 (= lt!119590 (lemmaContainsTupThenGetReturnValue!152 lt!119592 (_1!2298 (tuple2!4575 lt!119520 (minValue!4229 thiss!1504))) (_2!2298 (tuple2!4575 lt!119520 (minValue!4229 thiss!1504)))))))

(assert (=> d!59469 (= lt!119592 (insertStrictlySorted!155 (toList!1760 lt!119516) (_1!2298 (tuple2!4575 lt!119520 (minValue!4229 thiss!1504))) (_2!2298 (tuple2!4575 lt!119520 (minValue!4229 thiss!1504)))))))

(assert (=> d!59469 (= (+!640 lt!119516 (tuple2!4575 lt!119520 (minValue!4229 thiss!1504))) lt!119589)))

(declare-fun b!236413 () Bool)

(declare-fun res!115934 () Bool)

(assert (=> b!236413 (=> (not res!115934) (not e!153537))))

(assert (=> b!236413 (= res!115934 (= (getValueByKey!272 (toList!1760 lt!119589) (_1!2298 (tuple2!4575 lt!119520 (minValue!4229 thiss!1504)))) (Some!277 (_2!2298 (tuple2!4575 lt!119520 (minValue!4229 thiss!1504))))))))

(declare-fun b!236414 () Bool)

(assert (=> b!236414 (= e!153537 (contains!1654 (toList!1760 lt!119589) (tuple2!4575 lt!119520 (minValue!4229 thiss!1504))))))

(assert (= (and d!59469 res!115933) b!236413))

(assert (= (and b!236413 res!115934) b!236414))

(declare-fun m!257485 () Bool)

(assert (=> d!59469 m!257485))

(declare-fun m!257487 () Bool)

(assert (=> d!59469 m!257487))

(declare-fun m!257489 () Bool)

(assert (=> d!59469 m!257489))

(declare-fun m!257491 () Bool)

(assert (=> d!59469 m!257491))

(declare-fun m!257493 () Bool)

(assert (=> b!236413 m!257493))

(declare-fun m!257495 () Bool)

(assert (=> b!236414 m!257495))

(assert (=> b!236299 d!59469))

(declare-fun d!59471 () Bool)

(declare-fun e!153538 () Bool)

(assert (=> d!59471 e!153538))

(declare-fun res!115935 () Bool)

(assert (=> d!59471 (=> res!115935 e!153538)))

(declare-fun lt!119593 () Bool)

(assert (=> d!59471 (= res!115935 (not lt!119593))))

(declare-fun lt!119594 () Bool)

(assert (=> d!59471 (= lt!119593 lt!119594)))

(declare-fun lt!119596 () Unit!7259)

(declare-fun e!153539 () Unit!7259)

(assert (=> d!59471 (= lt!119596 e!153539)))

(declare-fun c!39374 () Bool)

(assert (=> d!59471 (= c!39374 lt!119594)))

(assert (=> d!59471 (= lt!119594 (containsKey!263 (toList!1760 (+!640 lt!119511 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504)))) lt!119514))))

(assert (=> d!59471 (= (contains!1652 (+!640 lt!119511 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504))) lt!119514) lt!119593)))

(declare-fun b!236415 () Bool)

(declare-fun lt!119595 () Unit!7259)

(assert (=> b!236415 (= e!153539 lt!119595)))

(assert (=> b!236415 (= lt!119595 (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1760 (+!640 lt!119511 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504)))) lt!119514))))

(assert (=> b!236415 (isDefined!212 (getValueByKey!272 (toList!1760 (+!640 lt!119511 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504)))) lt!119514))))

(declare-fun b!236416 () Bool)

(declare-fun Unit!7265 () Unit!7259)

(assert (=> b!236416 (= e!153539 Unit!7265)))

(declare-fun b!236417 () Bool)

(assert (=> b!236417 (= e!153538 (isDefined!212 (getValueByKey!272 (toList!1760 (+!640 lt!119511 (tuple2!4575 lt!119518 (zeroValue!4229 thiss!1504)))) lt!119514)))))

(assert (= (and d!59471 c!39374) b!236415))

(assert (= (and d!59471 (not c!39374)) b!236416))

(assert (= (and d!59471 (not res!115935)) b!236417))

(declare-fun m!257497 () Bool)

(assert (=> d!59471 m!257497))

(declare-fun m!257499 () Bool)

(assert (=> b!236415 m!257499))

(declare-fun m!257501 () Bool)

(assert (=> b!236415 m!257501))

(assert (=> b!236415 m!257501))

(declare-fun m!257503 () Bool)

(assert (=> b!236415 m!257503))

(assert (=> b!236417 m!257501))

(assert (=> b!236417 m!257501))

(assert (=> b!236417 m!257503))

(assert (=> b!236299 d!59471))

(declare-fun b!236430 () Bool)

(declare-fun e!153548 () SeekEntryResult!972)

(declare-fun e!153546 () SeekEntryResult!972)

(assert (=> b!236430 (= e!153548 e!153546)))

(declare-fun c!39381 () Bool)

(declare-fun lt!119602 () (_ BitVec 64))

(assert (=> b!236430 (= c!39381 (= lt!119602 key!932))))

(declare-fun d!59473 () Bool)

(declare-fun lt!119601 () SeekEntryResult!972)

(assert (=> d!59473 (and (or ((_ is Undefined!972) lt!119601) (not ((_ is Found!972) lt!119601)) (and (bvsge (index!6059 lt!119601) #b00000000000000000000000000000000) (bvslt (index!6059 lt!119601) (size!5895 (_keys!6467 thiss!1504))))) (or ((_ is Undefined!972) lt!119601) ((_ is Found!972) lt!119601) (not ((_ is MissingVacant!972) lt!119601)) (not (= (index!6061 lt!119601) (index!6060 lt!119445))) (and (bvsge (index!6061 lt!119601) #b00000000000000000000000000000000) (bvslt (index!6061 lt!119601) (size!5895 (_keys!6467 thiss!1504))))) (or ((_ is Undefined!972) lt!119601) (ite ((_ is Found!972) lt!119601) (= (select (arr!5558 (_keys!6467 thiss!1504)) (index!6059 lt!119601)) key!932) (and ((_ is MissingVacant!972) lt!119601) (= (index!6061 lt!119601) (index!6060 lt!119445)) (= (select (arr!5558 (_keys!6467 thiss!1504)) (index!6061 lt!119601)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59473 (= lt!119601 e!153548)))

(declare-fun c!39382 () Bool)

(assert (=> d!59473 (= c!39382 (bvsge (x!23828 lt!119445) #b01111111111111111111111111111110))))

(assert (=> d!59473 (= lt!119602 (select (arr!5558 (_keys!6467 thiss!1504)) (index!6060 lt!119445)))))

(assert (=> d!59473 (validMask!0 (mask!10373 thiss!1504))))

(assert (=> d!59473 (= (seekKeyOrZeroReturnVacant!0 (x!23828 lt!119445) (index!6060 lt!119445) (index!6060 lt!119445) key!932 (_keys!6467 thiss!1504) (mask!10373 thiss!1504)) lt!119601)))

(declare-fun b!236431 () Bool)

(declare-fun e!153547 () SeekEntryResult!972)

(assert (=> b!236431 (= e!153547 (MissingVacant!972 (index!6060 lt!119445)))))

(declare-fun b!236432 () Bool)

(assert (=> b!236432 (= e!153548 Undefined!972)))

(declare-fun b!236433 () Bool)

(declare-fun c!39383 () Bool)

(assert (=> b!236433 (= c!39383 (= lt!119602 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236433 (= e!153546 e!153547)))

(declare-fun b!236434 () Bool)

(assert (=> b!236434 (= e!153546 (Found!972 (index!6060 lt!119445)))))

(declare-fun b!236435 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!236435 (= e!153547 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23828 lt!119445) #b00000000000000000000000000000001) (nextIndex!0 (index!6060 lt!119445) (bvadd (x!23828 lt!119445) #b00000000000000000000000000000001) (mask!10373 thiss!1504)) (index!6060 lt!119445) key!932 (_keys!6467 thiss!1504) (mask!10373 thiss!1504)))))

(assert (= (and d!59473 c!39382) b!236432))

(assert (= (and d!59473 (not c!39382)) b!236430))

(assert (= (and b!236430 c!39381) b!236434))

(assert (= (and b!236430 (not c!39381)) b!236433))

(assert (= (and b!236433 c!39383) b!236431))

(assert (= (and b!236433 (not c!39383)) b!236435))

(declare-fun m!257505 () Bool)

(assert (=> d!59473 m!257505))

(declare-fun m!257507 () Bool)

(assert (=> d!59473 m!257507))

(assert (=> d!59473 m!257255))

(assert (=> d!59473 m!257203))

(declare-fun m!257509 () Bool)

(assert (=> b!236435 m!257509))

(assert (=> b!236435 m!257509))

(declare-fun m!257511 () Bool)

(assert (=> b!236435 m!257511))

(assert (=> b!236235 d!59473))

(assert (=> b!236306 d!59437))

(declare-fun d!59475 () Bool)

(declare-fun isEmpty!519 (Option!278) Bool)

(assert (=> d!59475 (= (isDefined!212 (getValueByKey!272 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932)) (not (isEmpty!519 (getValueByKey!272 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932))))))

(declare-fun bs!8754 () Bool)

(assert (= bs!8754 d!59475))

(assert (=> bs!8754 m!257271))

(declare-fun m!257513 () Bool)

(assert (=> bs!8754 m!257513))

(assert (=> b!236249 d!59475))

(declare-fun d!59477 () Bool)

(declare-fun c!39388 () Bool)

(assert (=> d!59477 (= c!39388 (and ((_ is Cons!3469) (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))) (= (_1!2298 (h!4121 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))))) key!932)))))

(declare-fun e!153553 () Option!278)

(assert (=> d!59477 (= (getValueByKey!272 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932) e!153553)))

(declare-fun b!236446 () Bool)

(declare-fun e!153554 () Option!278)

(assert (=> b!236446 (= e!153554 (getValueByKey!272 (t!8444 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))) key!932))))

(declare-fun b!236445 () Bool)

(assert (=> b!236445 (= e!153553 e!153554)))

(declare-fun c!39389 () Bool)

(assert (=> b!236445 (= c!39389 (and ((_ is Cons!3469) (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))) (not (= (_1!2298 (h!4121 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))))) key!932))))))

(declare-fun b!236447 () Bool)

(assert (=> b!236447 (= e!153554 None!276)))

(declare-fun b!236444 () Bool)

(assert (=> b!236444 (= e!153553 (Some!277 (_2!2298 (h!4121 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))))))))

(assert (= (and d!59477 c!39388) b!236444))

(assert (= (and d!59477 (not c!39388)) b!236445))

(assert (= (and b!236445 c!39389) b!236446))

(assert (= (and b!236445 (not c!39389)) b!236447))

(declare-fun m!257515 () Bool)

(assert (=> b!236446 m!257515))

(assert (=> b!236249 d!59477))

(assert (=> d!59421 d!59417))

(declare-fun d!59479 () Bool)

(assert (=> d!59479 (= (apply!213 lt!119522 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2863 (getValueByKey!272 (toList!1760 lt!119522) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8755 () Bool)

(assert (= bs!8755 d!59479))

(assert (=> bs!8755 m!257405))

(assert (=> bs!8755 m!257405))

(declare-fun m!257517 () Bool)

(assert (=> bs!8755 m!257517))

(assert (=> b!236298 d!59479))

(declare-fun b!236456 () Bool)

(declare-fun res!115947 () Bool)

(declare-fun e!153557 () Bool)

(assert (=> b!236456 (=> (not res!115947) (not e!153557))))

(assert (=> b!236456 (= res!115947 (and (= (size!5894 (_values!4371 thiss!1504)) (bvadd (mask!10373 thiss!1504) #b00000000000000000000000000000001)) (= (size!5895 (_keys!6467 thiss!1504)) (size!5894 (_values!4371 thiss!1504))) (bvsge (_size!1764 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1764 thiss!1504) (bvadd (mask!10373 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!59481 () Bool)

(declare-fun res!115945 () Bool)

(assert (=> d!59481 (=> (not res!115945) (not e!153557))))

(assert (=> d!59481 (= res!115945 (validMask!0 (mask!10373 thiss!1504)))))

(assert (=> d!59481 (= (simpleValid!236 thiss!1504) e!153557)))

(declare-fun b!236459 () Bool)

(assert (=> b!236459 (= e!153557 (and (bvsge (extraKeys!4125 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4125 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1764 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!236457 () Bool)

(declare-fun res!115946 () Bool)

(assert (=> b!236457 (=> (not res!115946) (not e!153557))))

(declare-fun size!5900 (LongMapFixedSize!3430) (_ BitVec 32))

(assert (=> b!236457 (= res!115946 (bvsge (size!5900 thiss!1504) (_size!1764 thiss!1504)))))

(declare-fun b!236458 () Bool)

(declare-fun res!115944 () Bool)

(assert (=> b!236458 (=> (not res!115944) (not e!153557))))

(assert (=> b!236458 (= res!115944 (= (size!5900 thiss!1504) (bvadd (_size!1764 thiss!1504) (bvsdiv (bvadd (extraKeys!4125 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!59481 res!115945) b!236456))

(assert (= (and b!236456 res!115947) b!236457))

(assert (= (and b!236457 res!115946) b!236458))

(assert (= (and b!236458 res!115944) b!236459))

(assert (=> d!59481 m!257203))

(declare-fun m!257519 () Bool)

(assert (=> b!236457 m!257519))

(assert (=> b!236458 m!257519))

(assert (=> d!59413 d!59481))

(declare-fun b!236468 () Bool)

(declare-fun e!153562 () (_ BitVec 32))

(declare-fun e!153563 () (_ BitVec 32))

(assert (=> b!236468 (= e!153562 e!153563)))

(declare-fun c!39395 () Bool)

(assert (=> b!236468 (= c!39395 (validKeyInArray!0 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59483 () Bool)

(declare-fun lt!119605 () (_ BitVec 32))

(assert (=> d!59483 (and (bvsge lt!119605 #b00000000000000000000000000000000) (bvsle lt!119605 (bvsub (size!5895 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59483 (= lt!119605 e!153562)))

(declare-fun c!39394 () Bool)

(assert (=> d!59483 (= c!39394 (bvsge #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))))))

(assert (=> d!59483 (and (bvsle #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5895 (_keys!6467 thiss!1504)) (size!5895 (_keys!6467 thiss!1504))))))

(assert (=> d!59483 (= (arrayCountValidKeys!0 (_keys!6467 thiss!1504) #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))) lt!119605)))

(declare-fun bm!21966 () Bool)

(declare-fun call!21969 () (_ BitVec 32))

(assert (=> bm!21966 (= call!21969 (arrayCountValidKeys!0 (_keys!6467 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5895 (_keys!6467 thiss!1504))))))

(declare-fun b!236469 () Bool)

(assert (=> b!236469 (= e!153563 call!21969)))

(declare-fun b!236470 () Bool)

(assert (=> b!236470 (= e!153563 (bvadd #b00000000000000000000000000000001 call!21969))))

(declare-fun b!236471 () Bool)

(assert (=> b!236471 (= e!153562 #b00000000000000000000000000000000)))

(assert (= (and d!59483 c!39394) b!236471))

(assert (= (and d!59483 (not c!39394)) b!236468))

(assert (= (and b!236468 c!39395) b!236470))

(assert (= (and b!236468 (not c!39395)) b!236469))

(assert (= (or b!236470 b!236469) bm!21966))

(assert (=> b!236468 m!257275))

(assert (=> b!236468 m!257275))

(assert (=> b!236468 m!257325))

(declare-fun m!257521 () Bool)

(assert (=> bm!21966 m!257521))

(assert (=> b!236220 d!59483))

(declare-fun d!59485 () Bool)

(assert (=> d!59485 (= (apply!213 lt!119522 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2863 (getValueByKey!272 (toList!1760 lt!119522) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8756 () Bool)

(assert (= bs!8756 d!59485))

(assert (=> bs!8756 m!257365))

(assert (=> bs!8756 m!257365))

(declare-fun m!257523 () Bool)

(assert (=> bs!8756 m!257523))

(assert (=> b!236297 d!59485))

(declare-fun d!59487 () Bool)

(assert (=> d!59487 (isDefined!212 (getValueByKey!272 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932))))

(declare-fun lt!119608 () Unit!7259)

(declare-fun choose!1113 (List!3473 (_ BitVec 64)) Unit!7259)

(assert (=> d!59487 (= lt!119608 (choose!1113 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932))))

(declare-fun e!153566 () Bool)

(assert (=> d!59487 e!153566))

(declare-fun res!115950 () Bool)

(assert (=> d!59487 (=> (not res!115950) (not e!153566))))

(declare-fun isStrictlySorted!350 (List!3473) Bool)

(assert (=> d!59487 (= res!115950 (isStrictlySorted!350 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504)))))))

(assert (=> d!59487 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932) lt!119608)))

(declare-fun b!236474 () Bool)

(assert (=> b!236474 (= e!153566 (containsKey!263 (toList!1760 (getCurrentListMap!1292 (_keys!6467 thiss!1504) (_values!4371 thiss!1504) (mask!10373 thiss!1504) (extraKeys!4125 thiss!1504) (zeroValue!4229 thiss!1504) (minValue!4229 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4388 thiss!1504))) key!932))))

(assert (= (and d!59487 res!115950) b!236474))

(assert (=> d!59487 m!257271))

(assert (=> d!59487 m!257271))

(assert (=> d!59487 m!257273))

(declare-fun m!257525 () Bool)

(assert (=> d!59487 m!257525))

(declare-fun m!257527 () Bool)

(assert (=> d!59487 m!257527))

(assert (=> b!236474 m!257267))

(assert (=> b!236247 d!59487))

(assert (=> b!236247 d!59475))

(assert (=> b!236247 d!59477))

(declare-fun d!59489 () Bool)

(declare-fun e!153567 () Bool)

(assert (=> d!59489 e!153567))

(declare-fun res!115951 () Bool)

(assert (=> d!59489 (=> res!115951 e!153567)))

(declare-fun lt!119609 () Bool)

(assert (=> d!59489 (= res!115951 (not lt!119609))))

(declare-fun lt!119610 () Bool)

(assert (=> d!59489 (= lt!119609 lt!119610)))

(declare-fun lt!119612 () Unit!7259)

(declare-fun e!153568 () Unit!7259)

(assert (=> d!59489 (= lt!119612 e!153568)))

(declare-fun c!39396 () Bool)

(assert (=> d!59489 (= c!39396 lt!119610)))

(assert (=> d!59489 (= lt!119610 (containsKey!263 (toList!1760 lt!119522) (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59489 (= (contains!1652 lt!119522 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)) lt!119609)))

(declare-fun b!236475 () Bool)

(declare-fun lt!119611 () Unit!7259)

(assert (=> b!236475 (= e!153568 lt!119611)))

(assert (=> b!236475 (= lt!119611 (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1760 lt!119522) (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236475 (isDefined!212 (getValueByKey!272 (toList!1760 lt!119522) (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236476 () Bool)

(declare-fun Unit!7266 () Unit!7259)

(assert (=> b!236476 (= e!153568 Unit!7266)))

(declare-fun b!236477 () Bool)

(assert (=> b!236477 (= e!153567 (isDefined!212 (getValueByKey!272 (toList!1760 lt!119522) (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59489 c!39396) b!236475))

(assert (= (and d!59489 (not c!39396)) b!236476))

(assert (= (and d!59489 (not res!115951)) b!236477))

(assert (=> d!59489 m!257275))

(declare-fun m!257529 () Bool)

(assert (=> d!59489 m!257529))

(assert (=> b!236475 m!257275))

(declare-fun m!257531 () Bool)

(assert (=> b!236475 m!257531))

(assert (=> b!236475 m!257275))

(assert (=> b!236475 m!257353))

(assert (=> b!236475 m!257353))

(declare-fun m!257533 () Bool)

(assert (=> b!236475 m!257533))

(assert (=> b!236477 m!257275))

(assert (=> b!236477 m!257353))

(assert (=> b!236477 m!257353))

(assert (=> b!236477 m!257533))

(assert (=> b!236303 d!59489))

(declare-fun b!236486 () Bool)

(declare-fun e!153575 () Bool)

(declare-fun e!153576 () Bool)

(assert (=> b!236486 (= e!153575 e!153576)))

(declare-fun c!39399 () Bool)

(assert (=> b!236486 (= c!39399 (validKeyInArray!0 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236487 () Bool)

(declare-fun call!21972 () Bool)

(assert (=> b!236487 (= e!153576 call!21972)))

(declare-fun bm!21969 () Bool)

(assert (=> bm!21969 (= call!21972 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6467 thiss!1504) (mask!10373 thiss!1504)))))

(declare-fun b!236489 () Bool)

(declare-fun e!153577 () Bool)

(assert (=> b!236489 (= e!153577 call!21972)))

(declare-fun d!59491 () Bool)

(declare-fun res!115956 () Bool)

(assert (=> d!59491 (=> res!115956 e!153575)))

(assert (=> d!59491 (= res!115956 (bvsge #b00000000000000000000000000000000 (size!5895 (_keys!6467 thiss!1504))))))

(assert (=> d!59491 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6467 thiss!1504) (mask!10373 thiss!1504)) e!153575)))

(declare-fun b!236488 () Bool)

(assert (=> b!236488 (= e!153576 e!153577)))

(declare-fun lt!119620 () (_ BitVec 64))

(assert (=> b!236488 (= lt!119620 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119621 () Unit!7259)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11697 (_ BitVec 64) (_ BitVec 32)) Unit!7259)

(assert (=> b!236488 (= lt!119621 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6467 thiss!1504) lt!119620 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!236488 (arrayContainsKey!0 (_keys!6467 thiss!1504) lt!119620 #b00000000000000000000000000000000)))

(declare-fun lt!119619 () Unit!7259)

(assert (=> b!236488 (= lt!119619 lt!119621)))

(declare-fun res!115957 () Bool)

(assert (=> b!236488 (= res!115957 (= (seekEntryOrOpen!0 (select (arr!5558 (_keys!6467 thiss!1504)) #b00000000000000000000000000000000) (_keys!6467 thiss!1504) (mask!10373 thiss!1504)) (Found!972 #b00000000000000000000000000000000)))))

(assert (=> b!236488 (=> (not res!115957) (not e!153577))))

(assert (= (and d!59491 (not res!115956)) b!236486))

(assert (= (and b!236486 c!39399) b!236488))

(assert (= (and b!236486 (not c!39399)) b!236487))

(assert (= (and b!236488 res!115957) b!236489))

(assert (= (or b!236489 b!236487) bm!21969))

(assert (=> b!236486 m!257275))

(assert (=> b!236486 m!257275))

(assert (=> b!236486 m!257325))

(declare-fun m!257535 () Bool)

(assert (=> bm!21969 m!257535))

(assert (=> b!236488 m!257275))

(declare-fun m!257537 () Bool)

(assert (=> b!236488 m!257537))

(declare-fun m!257539 () Bool)

(assert (=> b!236488 m!257539))

(assert (=> b!236488 m!257275))

(declare-fun m!257541 () Bool)

(assert (=> b!236488 m!257541))

(assert (=> b!236221 d!59491))

(declare-fun b!236508 () Bool)

(declare-fun lt!119627 () SeekEntryResult!972)

(assert (=> b!236508 (and (bvsge (index!6060 lt!119627) #b00000000000000000000000000000000) (bvslt (index!6060 lt!119627) (size!5895 (_keys!6467 thiss!1504))))))

(declare-fun e!153590 () Bool)

(assert (=> b!236508 (= e!153590 (= (select (arr!5558 (_keys!6467 thiss!1504)) (index!6060 lt!119627)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236510 () Bool)

(declare-fun e!153592 () SeekEntryResult!972)

(assert (=> b!236510 (= e!153592 (Intermediate!972 true (toIndex!0 key!932 (mask!10373 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!236511 () Bool)

(declare-fun e!153588 () Bool)

(declare-fun e!153589 () Bool)

(assert (=> b!236511 (= e!153588 e!153589)))

(declare-fun res!115966 () Bool)

(assert (=> b!236511 (= res!115966 (and ((_ is Intermediate!972) lt!119627) (not (undefined!1784 lt!119627)) (bvslt (x!23828 lt!119627) #b01111111111111111111111111111110) (bvsge (x!23828 lt!119627) #b00000000000000000000000000000000) (bvsge (x!23828 lt!119627) #b00000000000000000000000000000000)))))

(assert (=> b!236511 (=> (not res!115966) (not e!153589))))

(declare-fun b!236512 () Bool)

(declare-fun e!153591 () SeekEntryResult!972)

(assert (=> b!236512 (= e!153591 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10373 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!10373 thiss!1504)) key!932 (_keys!6467 thiss!1504) (mask!10373 thiss!1504)))))

(declare-fun b!236513 () Bool)

(assert (=> b!236513 (= e!153588 (bvsge (x!23828 lt!119627) #b01111111111111111111111111111110))))

(declare-fun b!236514 () Bool)

(assert (=> b!236514 (and (bvsge (index!6060 lt!119627) #b00000000000000000000000000000000) (bvslt (index!6060 lt!119627) (size!5895 (_keys!6467 thiss!1504))))))

(declare-fun res!115965 () Bool)

(assert (=> b!236514 (= res!115965 (= (select (arr!5558 (_keys!6467 thiss!1504)) (index!6060 lt!119627)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236514 (=> res!115965 e!153590)))

(declare-fun d!59493 () Bool)

(assert (=> d!59493 e!153588))

(declare-fun c!39407 () Bool)

(assert (=> d!59493 (= c!39407 (and ((_ is Intermediate!972) lt!119627) (undefined!1784 lt!119627)))))

(assert (=> d!59493 (= lt!119627 e!153592)))

(declare-fun c!39406 () Bool)

(assert (=> d!59493 (= c!39406 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!119626 () (_ BitVec 64))

(assert (=> d!59493 (= lt!119626 (select (arr!5558 (_keys!6467 thiss!1504)) (toIndex!0 key!932 (mask!10373 thiss!1504))))))

(assert (=> d!59493 (validMask!0 (mask!10373 thiss!1504))))

(assert (=> d!59493 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10373 thiss!1504)) key!932 (_keys!6467 thiss!1504) (mask!10373 thiss!1504)) lt!119627)))

(declare-fun b!236509 () Bool)

(assert (=> b!236509 (and (bvsge (index!6060 lt!119627) #b00000000000000000000000000000000) (bvslt (index!6060 lt!119627) (size!5895 (_keys!6467 thiss!1504))))))

(declare-fun res!115964 () Bool)

(assert (=> b!236509 (= res!115964 (= (select (arr!5558 (_keys!6467 thiss!1504)) (index!6060 lt!119627)) key!932))))

(assert (=> b!236509 (=> res!115964 e!153590)))

(assert (=> b!236509 (= e!153589 e!153590)))

(declare-fun b!236515 () Bool)

(assert (=> b!236515 (= e!153592 e!153591)))

(declare-fun c!39408 () Bool)

(assert (=> b!236515 (= c!39408 (or (= lt!119626 key!932) (= (bvadd lt!119626 lt!119626) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236516 () Bool)

(assert (=> b!236516 (= e!153591 (Intermediate!972 false (toIndex!0 key!932 (mask!10373 thiss!1504)) #b00000000000000000000000000000000))))

(assert (= (and d!59493 c!39406) b!236510))

(assert (= (and d!59493 (not c!39406)) b!236515))

(assert (= (and b!236515 c!39408) b!236516))

(assert (= (and b!236515 (not c!39408)) b!236512))

(assert (= (and d!59493 c!39407) b!236513))

(assert (= (and d!59493 (not c!39407)) b!236511))

(assert (= (and b!236511 res!115966) b!236509))

(assert (= (and b!236509 (not res!115964)) b!236514))

(assert (= (and b!236514 (not res!115965)) b!236508))

(declare-fun m!257543 () Bool)

(assert (=> b!236509 m!257543))

(assert (=> d!59493 m!257261))

(declare-fun m!257545 () Bool)

(assert (=> d!59493 m!257545))

(assert (=> d!59493 m!257203))

(assert (=> b!236512 m!257261))

(declare-fun m!257547 () Bool)

(assert (=> b!236512 m!257547))

(assert (=> b!236512 m!257547))

(declare-fun m!257549 () Bool)

(assert (=> b!236512 m!257549))

(assert (=> b!236514 m!257543))

(assert (=> b!236508 m!257543))

(assert (=> d!59415 d!59493))

(declare-fun d!59495 () Bool)

(declare-fun lt!119633 () (_ BitVec 32))

(declare-fun lt!119632 () (_ BitVec 32))

(assert (=> d!59495 (= lt!119633 (bvmul (bvxor lt!119632 (bvlshr lt!119632 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59495 (= lt!119632 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59495 (and (bvsge (mask!10373 thiss!1504) #b00000000000000000000000000000000) (let ((res!115967 (let ((h!4123 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23846 (bvmul (bvxor h!4123 (bvlshr h!4123 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23846 (bvlshr x!23846 #b00000000000000000000000000001101)) (mask!10373 thiss!1504)))))) (and (bvslt res!115967 (bvadd (mask!10373 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!115967 #b00000000000000000000000000000000))))))

(assert (=> d!59495 (= (toIndex!0 key!932 (mask!10373 thiss!1504)) (bvand (bvxor lt!119633 (bvlshr lt!119633 #b00000000000000000000000000001101)) (mask!10373 thiss!1504)))))

(assert (=> d!59415 d!59495))

(assert (=> d!59415 d!59417))

(declare-fun b!236518 () Bool)

(declare-fun e!153593 () Bool)

(assert (=> b!236518 (= e!153593 tp_is_empty!6217)))

(declare-fun mapIsEmpty!10539 () Bool)

(declare-fun mapRes!10539 () Bool)

(assert (=> mapIsEmpty!10539 mapRes!10539))

(declare-fun mapNonEmpty!10539 () Bool)

(declare-fun tp!22257 () Bool)

(declare-fun e!153594 () Bool)

(assert (=> mapNonEmpty!10539 (= mapRes!10539 (and tp!22257 e!153594))))

(declare-fun mapKey!10539 () (_ BitVec 32))

(declare-fun mapRest!10539 () (Array (_ BitVec 32) ValueCell!2765))

(declare-fun mapValue!10539 () ValueCell!2765)

(assert (=> mapNonEmpty!10539 (= mapRest!10538 (store mapRest!10539 mapKey!10539 mapValue!10539))))

(declare-fun condMapEmpty!10539 () Bool)

(declare-fun mapDefault!10539 () ValueCell!2765)

(assert (=> mapNonEmpty!10538 (= condMapEmpty!10539 (= mapRest!10538 ((as const (Array (_ BitVec 32) ValueCell!2765)) mapDefault!10539)))))

(assert (=> mapNonEmpty!10538 (= tp!22256 (and e!153593 mapRes!10539))))

(declare-fun b!236517 () Bool)

(assert (=> b!236517 (= e!153594 tp_is_empty!6217)))

(assert (= (and mapNonEmpty!10538 condMapEmpty!10539) mapIsEmpty!10539))

(assert (= (and mapNonEmpty!10538 (not condMapEmpty!10539)) mapNonEmpty!10539))

(assert (= (and mapNonEmpty!10539 ((_ is ValueCellFull!2765) mapValue!10539)) b!236517))

(assert (= (and mapNonEmpty!10538 ((_ is ValueCellFull!2765) mapDefault!10539)) b!236518))

(declare-fun m!257551 () Bool)

(assert (=> mapNonEmpty!10539 m!257551))

(declare-fun b_lambda!7945 () Bool)

(assert (= b_lambda!7943 (or (and b!236152 b_free!6355) b_lambda!7945)))

(declare-fun b_lambda!7947 () Bool)

(assert (= b_lambda!7941 (or (and b!236152 b_free!6355) b_lambda!7947)))

(check-sat (not b!236395) (not b!236512) (not b!236446) (not d!59455) (not d!59447) b_and!13313 (not d!59451) (not b!236409) (not mapNonEmpty!10539) (not b!236488) (not b!236397) (not b!236415) (not d!59453) (not b!236475) (not b!236412) (not d!59465) (not d!59481) (not b!236386) (not b_next!6355) (not d!59435) (not d!59467) (not b!236414) (not d!59459) (not b!236343) (not b!236399) (not bm!21969) (not b!236389) (not b!236477) (not d!59493) (not d!59489) (not bm!21960) (not b!236391) (not b!236388) (not b!236355) (not b!236413) (not d!59471) (not b!236458) (not b!236358) (not b_lambda!7947) (not bm!21963) (not d!59443) (not b_lambda!7939) (not d!59475) (not b!236468) (not b!236417) (not b!236394) (not d!59445) (not b!236410) (not b!236349) (not b!236406) (not d!59439) (not b!236474) (not d!59449) (not d!59473) (not d!59425) (not b!236486) (not b!236354) (not b!236387) (not b!236396) (not b!236335) (not d!59433) (not b!236356) (not b!236407) (not d!59485) (not b!236435) (not b!236336) (not b!236384) tp_is_empty!6217 (not d!59463) (not b!236457) (not bm!21966) (not d!59457) (not b!236393) (not d!59479) (not d!59487) (not b!236342) (not b!236411) (not b!236337) (not d!59441) (not b_lambda!7945) (not d!59429) (not d!59469) (not d!59461))
(check-sat b_and!13313 (not b_next!6355))
