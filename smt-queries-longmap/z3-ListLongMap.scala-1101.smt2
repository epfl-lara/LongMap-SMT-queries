; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22586 () Bool)

(assert start!22586)

(declare-fun b!236138 () Bool)

(declare-fun b_free!6357 () Bool)

(declare-fun b_next!6357 () Bool)

(assert (=> b!236138 (= b_free!6357 (not b_next!6357))))

(declare-fun tp!22246 () Bool)

(declare-fun b_and!13291 () Bool)

(assert (=> b!236138 (= tp!22246 b_and!13291)))

(declare-fun mapIsEmpty!10532 () Bool)

(declare-fun mapRes!10532 () Bool)

(assert (=> mapIsEmpty!10532 mapRes!10532))

(declare-fun res!115806 () Bool)

(declare-fun e!153367 () Bool)

(assert (=> start!22586 (=> (not res!115806) (not e!153367))))

(declare-datatypes ((V!7939 0))(
  ( (V!7940 (val!3154 Int)) )
))
(declare-datatypes ((ValueCell!2766 0))(
  ( (ValueCellFull!2766 (v!5184 V!7939)) (EmptyCell!2766) )
))
(declare-datatypes ((array!11701 0))(
  ( (array!11702 (arr!5560 (Array (_ BitVec 32) ValueCell!2766)) (size!5897 (_ BitVec 32))) )
))
(declare-datatypes ((array!11703 0))(
  ( (array!11704 (arr!5561 (Array (_ BitVec 32) (_ BitVec 64))) (size!5898 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3432 0))(
  ( (LongMapFixedSize!3433 (defaultEntry!4389 Int) (mask!10374 (_ BitVec 32)) (extraKeys!4126 (_ BitVec 32)) (zeroValue!4230 V!7939) (minValue!4230 V!7939) (_size!1765 (_ BitVec 32)) (_keys!6468 array!11703) (_values!4372 array!11701) (_vacant!1765 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3432)

(declare-fun valid!1355 (LongMapFixedSize!3432) Bool)

(assert (=> start!22586 (= res!115806 (valid!1355 thiss!1504))))

(assert (=> start!22586 e!153367))

(declare-fun e!153369 () Bool)

(assert (=> start!22586 e!153369))

(assert (=> start!22586 true))

(declare-fun b!236131 () Bool)

(declare-fun e!153368 () Bool)

(declare-fun tp_is_empty!6219 () Bool)

(assert (=> b!236131 (= e!153368 tp_is_empty!6219)))

(declare-fun b!236132 () Bool)

(declare-fun res!115805 () Bool)

(declare-fun e!153366 () Bool)

(assert (=> b!236132 (=> (not res!115805) (not e!153366))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4648 0))(
  ( (tuple2!4649 (_1!2335 (_ BitVec 64)) (_2!2335 V!7939)) )
))
(declare-datatypes ((List!3553 0))(
  ( (Nil!3550) (Cons!3549 (h!4201 tuple2!4648) (t!8532 List!3553)) )
))
(declare-datatypes ((ListLongMap!3561 0))(
  ( (ListLongMap!3562 (toList!1796 List!3553)) )
))
(declare-fun contains!1674 (ListLongMap!3561 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1324 (array!11703 array!11701 (_ BitVec 32) (_ BitVec 32) V!7939 V!7939 (_ BitVec 32) Int) ListLongMap!3561)

(assert (=> b!236132 (= res!115805 (not (contains!1674 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)) key!932)))))

(declare-fun b!236133 () Bool)

(assert (=> b!236133 (= e!153367 e!153366)))

(declare-fun res!115809 () Bool)

(assert (=> b!236133 (=> (not res!115809) (not e!153366))))

(declare-datatypes ((SeekEntryResult!1000 0))(
  ( (MissingZero!1000 (index!6170 (_ BitVec 32))) (Found!1000 (index!6171 (_ BitVec 32))) (Intermediate!1000 (undefined!1812 Bool) (index!6172 (_ BitVec 32)) (x!23856 (_ BitVec 32))) (Undefined!1000) (MissingVacant!1000 (index!6173 (_ BitVec 32))) )
))
(declare-fun lt!119374 () SeekEntryResult!1000)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!236133 (= res!115809 (or (= lt!119374 (MissingZero!1000 index!297)) (= lt!119374 (MissingVacant!1000 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11703 (_ BitVec 32)) SeekEntryResult!1000)

(assert (=> b!236133 (= lt!119374 (seekEntryOrOpen!0 key!932 (_keys!6468 thiss!1504) (mask!10374 thiss!1504)))))

(declare-fun b!236134 () Bool)

(assert (=> b!236134 (= e!153366 (not (= (size!5897 (_values!4372 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10374 thiss!1504)))))))

(declare-fun b!236135 () Bool)

(declare-fun e!153364 () Bool)

(assert (=> b!236135 (= e!153364 (and e!153368 mapRes!10532))))

(declare-fun condMapEmpty!10532 () Bool)

(declare-fun mapDefault!10532 () ValueCell!2766)

(assert (=> b!236135 (= condMapEmpty!10532 (= (arr!5560 (_values!4372 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2766)) mapDefault!10532)))))

(declare-fun b!236136 () Bool)

(declare-fun e!153365 () Bool)

(assert (=> b!236136 (= e!153365 tp_is_empty!6219)))

(declare-fun b!236137 () Bool)

(declare-fun res!115808 () Bool)

(assert (=> b!236137 (=> (not res!115808) (not e!153366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!236137 (= res!115808 (validMask!0 (mask!10374 thiss!1504)))))

(declare-fun array_inv!3667 (array!11703) Bool)

(declare-fun array_inv!3668 (array!11701) Bool)

(assert (=> b!236138 (= e!153369 (and tp!22246 tp_is_empty!6219 (array_inv!3667 (_keys!6468 thiss!1504)) (array_inv!3668 (_values!4372 thiss!1504)) e!153364))))

(declare-fun b!236139 () Bool)

(declare-fun res!115807 () Bool)

(assert (=> b!236139 (=> (not res!115807) (not e!153367))))

(assert (=> b!236139 (= res!115807 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10532 () Bool)

(declare-fun tp!22247 () Bool)

(assert (=> mapNonEmpty!10532 (= mapRes!10532 (and tp!22247 e!153365))))

(declare-fun mapKey!10532 () (_ BitVec 32))

(declare-fun mapRest!10532 () (Array (_ BitVec 32) ValueCell!2766))

(declare-fun mapValue!10532 () ValueCell!2766)

(assert (=> mapNonEmpty!10532 (= (arr!5560 (_values!4372 thiss!1504)) (store mapRest!10532 mapKey!10532 mapValue!10532))))

(assert (= (and start!22586 res!115806) b!236139))

(assert (= (and b!236139 res!115807) b!236133))

(assert (= (and b!236133 res!115809) b!236132))

(assert (= (and b!236132 res!115805) b!236137))

(assert (= (and b!236137 res!115808) b!236134))

(assert (= (and b!236135 condMapEmpty!10532) mapIsEmpty!10532))

(assert (= (and b!236135 (not condMapEmpty!10532)) mapNonEmpty!10532))

(get-info :version)

(assert (= (and mapNonEmpty!10532 ((_ is ValueCellFull!2766) mapValue!10532)) b!236136))

(assert (= (and b!236135 ((_ is ValueCellFull!2766) mapDefault!10532)) b!236131))

(assert (= b!236138 b!236135))

(assert (= start!22586 b!236138))

(declare-fun m!257031 () Bool)

(assert (=> start!22586 m!257031))

(declare-fun m!257033 () Bool)

(assert (=> b!236133 m!257033))

(declare-fun m!257035 () Bool)

(assert (=> b!236138 m!257035))

(declare-fun m!257037 () Bool)

(assert (=> b!236138 m!257037))

(declare-fun m!257039 () Bool)

(assert (=> b!236132 m!257039))

(assert (=> b!236132 m!257039))

(declare-fun m!257041 () Bool)

(assert (=> b!236132 m!257041))

(declare-fun m!257043 () Bool)

(assert (=> mapNonEmpty!10532 m!257043))

(declare-fun m!257045 () Bool)

(assert (=> b!236137 m!257045))

(check-sat (not b!236133) tp_is_empty!6219 (not mapNonEmpty!10532) (not b!236138) (not start!22586) (not b_next!6357) (not b!236137) b_and!13291 (not b!236132))
(check-sat b_and!13291 (not b_next!6357))
(get-model)

(declare-fun b!236180 () Bool)

(declare-fun e!153400 () SeekEntryResult!1000)

(declare-fun e!153399 () SeekEntryResult!1000)

(assert (=> b!236180 (= e!153400 e!153399)))

(declare-fun lt!119386 () (_ BitVec 64))

(declare-fun lt!119384 () SeekEntryResult!1000)

(assert (=> b!236180 (= lt!119386 (select (arr!5561 (_keys!6468 thiss!1504)) (index!6172 lt!119384)))))

(declare-fun c!39319 () Bool)

(assert (=> b!236180 (= c!39319 (= lt!119386 key!932))))

(declare-fun b!236181 () Bool)

(declare-fun c!39318 () Bool)

(assert (=> b!236181 (= c!39318 (= lt!119386 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!153398 () SeekEntryResult!1000)

(assert (=> b!236181 (= e!153399 e!153398)))

(declare-fun b!236182 () Bool)

(assert (=> b!236182 (= e!153400 Undefined!1000)))

(declare-fun b!236183 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11703 (_ BitVec 32)) SeekEntryResult!1000)

(assert (=> b!236183 (= e!153398 (seekKeyOrZeroReturnVacant!0 (x!23856 lt!119384) (index!6172 lt!119384) (index!6172 lt!119384) key!932 (_keys!6468 thiss!1504) (mask!10374 thiss!1504)))))

(declare-fun b!236184 () Bool)

(assert (=> b!236184 (= e!153398 (MissingZero!1000 (index!6172 lt!119384)))))

(declare-fun b!236179 () Bool)

(assert (=> b!236179 (= e!153399 (Found!1000 (index!6172 lt!119384)))))

(declare-fun d!59335 () Bool)

(declare-fun lt!119385 () SeekEntryResult!1000)

(assert (=> d!59335 (and (or ((_ is Undefined!1000) lt!119385) (not ((_ is Found!1000) lt!119385)) (and (bvsge (index!6171 lt!119385) #b00000000000000000000000000000000) (bvslt (index!6171 lt!119385) (size!5898 (_keys!6468 thiss!1504))))) (or ((_ is Undefined!1000) lt!119385) ((_ is Found!1000) lt!119385) (not ((_ is MissingZero!1000) lt!119385)) (and (bvsge (index!6170 lt!119385) #b00000000000000000000000000000000) (bvslt (index!6170 lt!119385) (size!5898 (_keys!6468 thiss!1504))))) (or ((_ is Undefined!1000) lt!119385) ((_ is Found!1000) lt!119385) ((_ is MissingZero!1000) lt!119385) (not ((_ is MissingVacant!1000) lt!119385)) (and (bvsge (index!6173 lt!119385) #b00000000000000000000000000000000) (bvslt (index!6173 lt!119385) (size!5898 (_keys!6468 thiss!1504))))) (or ((_ is Undefined!1000) lt!119385) (ite ((_ is Found!1000) lt!119385) (= (select (arr!5561 (_keys!6468 thiss!1504)) (index!6171 lt!119385)) key!932) (ite ((_ is MissingZero!1000) lt!119385) (= (select (arr!5561 (_keys!6468 thiss!1504)) (index!6170 lt!119385)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1000) lt!119385) (= (select (arr!5561 (_keys!6468 thiss!1504)) (index!6173 lt!119385)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59335 (= lt!119385 e!153400)))

(declare-fun c!39317 () Bool)

(assert (=> d!59335 (= c!39317 (and ((_ is Intermediate!1000) lt!119384) (undefined!1812 lt!119384)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11703 (_ BitVec 32)) SeekEntryResult!1000)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59335 (= lt!119384 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10374 thiss!1504)) key!932 (_keys!6468 thiss!1504) (mask!10374 thiss!1504)))))

(assert (=> d!59335 (validMask!0 (mask!10374 thiss!1504))))

(assert (=> d!59335 (= (seekEntryOrOpen!0 key!932 (_keys!6468 thiss!1504) (mask!10374 thiss!1504)) lt!119385)))

(assert (= (and d!59335 c!39317) b!236182))

(assert (= (and d!59335 (not c!39317)) b!236180))

(assert (= (and b!236180 c!39319) b!236179))

(assert (= (and b!236180 (not c!39319)) b!236181))

(assert (= (and b!236181 c!39318) b!236184))

(assert (= (and b!236181 (not c!39318)) b!236183))

(declare-fun m!257063 () Bool)

(assert (=> b!236180 m!257063))

(declare-fun m!257065 () Bool)

(assert (=> b!236183 m!257065))

(declare-fun m!257067 () Bool)

(assert (=> d!59335 m!257067))

(declare-fun m!257069 () Bool)

(assert (=> d!59335 m!257069))

(assert (=> d!59335 m!257067))

(declare-fun m!257071 () Bool)

(assert (=> d!59335 m!257071))

(declare-fun m!257073 () Bool)

(assert (=> d!59335 m!257073))

(assert (=> d!59335 m!257045))

(declare-fun m!257075 () Bool)

(assert (=> d!59335 m!257075))

(assert (=> b!236133 d!59335))

(declare-fun d!59337 () Bool)

(assert (=> d!59337 (= (array_inv!3667 (_keys!6468 thiss!1504)) (bvsge (size!5898 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236138 d!59337))

(declare-fun d!59339 () Bool)

(assert (=> d!59339 (= (array_inv!3668 (_values!4372 thiss!1504)) (bvsge (size!5897 (_values!4372 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236138 d!59339))

(declare-fun d!59341 () Bool)

(declare-fun res!115831 () Bool)

(declare-fun e!153403 () Bool)

(assert (=> d!59341 (=> (not res!115831) (not e!153403))))

(declare-fun simpleValid!236 (LongMapFixedSize!3432) Bool)

(assert (=> d!59341 (= res!115831 (simpleValid!236 thiss!1504))))

(assert (=> d!59341 (= (valid!1355 thiss!1504) e!153403)))

(declare-fun b!236191 () Bool)

(declare-fun res!115832 () Bool)

(assert (=> b!236191 (=> (not res!115832) (not e!153403))))

(declare-fun arrayCountValidKeys!0 (array!11703 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!236191 (= res!115832 (= (arrayCountValidKeys!0 (_keys!6468 thiss!1504) #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))) (_size!1765 thiss!1504)))))

(declare-fun b!236192 () Bool)

(declare-fun res!115833 () Bool)

(assert (=> b!236192 (=> (not res!115833) (not e!153403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11703 (_ BitVec 32)) Bool)

(assert (=> b!236192 (= res!115833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6468 thiss!1504) (mask!10374 thiss!1504)))))

(declare-fun b!236193 () Bool)

(declare-datatypes ((List!3555 0))(
  ( (Nil!3552) (Cons!3551 (h!4203 (_ BitVec 64)) (t!8536 List!3555)) )
))
(declare-fun arrayNoDuplicates!0 (array!11703 (_ BitVec 32) List!3555) Bool)

(assert (=> b!236193 (= e!153403 (arrayNoDuplicates!0 (_keys!6468 thiss!1504) #b00000000000000000000000000000000 Nil!3552))))

(assert (= (and d!59341 res!115831) b!236191))

(assert (= (and b!236191 res!115832) b!236192))

(assert (= (and b!236192 res!115833) b!236193))

(declare-fun m!257077 () Bool)

(assert (=> d!59341 m!257077))

(declare-fun m!257079 () Bool)

(assert (=> b!236191 m!257079))

(declare-fun m!257081 () Bool)

(assert (=> b!236192 m!257081))

(declare-fun m!257083 () Bool)

(assert (=> b!236193 m!257083))

(assert (=> start!22586 d!59341))

(declare-fun d!59343 () Bool)

(declare-fun e!153408 () Bool)

(assert (=> d!59343 e!153408))

(declare-fun res!115836 () Bool)

(assert (=> d!59343 (=> res!115836 e!153408)))

(declare-fun lt!119395 () Bool)

(assert (=> d!59343 (= res!115836 (not lt!119395))))

(declare-fun lt!119396 () Bool)

(assert (=> d!59343 (= lt!119395 lt!119396)))

(declare-datatypes ((Unit!7272 0))(
  ( (Unit!7273) )
))
(declare-fun lt!119398 () Unit!7272)

(declare-fun e!153409 () Unit!7272)

(assert (=> d!59343 (= lt!119398 e!153409)))

(declare-fun c!39322 () Bool)

(assert (=> d!59343 (= c!39322 lt!119396)))

(declare-fun containsKey!263 (List!3553 (_ BitVec 64)) Bool)

(assert (=> d!59343 (= lt!119396 (containsKey!263 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))) key!932))))

(assert (=> d!59343 (= (contains!1674 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)) key!932) lt!119395)))

(declare-fun b!236200 () Bool)

(declare-fun lt!119397 () Unit!7272)

(assert (=> b!236200 (= e!153409 lt!119397)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!211 (List!3553 (_ BitVec 64)) Unit!7272)

(assert (=> b!236200 (= lt!119397 (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))) key!932))))

(declare-datatypes ((Option!277 0))(
  ( (Some!276 (v!5186 V!7939)) (None!275) )
))
(declare-fun isDefined!212 (Option!277) Bool)

(declare-fun getValueByKey!271 (List!3553 (_ BitVec 64)) Option!277)

(assert (=> b!236200 (isDefined!212 (getValueByKey!271 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))) key!932))))

(declare-fun b!236201 () Bool)

(declare-fun Unit!7274 () Unit!7272)

(assert (=> b!236201 (= e!153409 Unit!7274)))

(declare-fun b!236202 () Bool)

(assert (=> b!236202 (= e!153408 (isDefined!212 (getValueByKey!271 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))) key!932)))))

(assert (= (and d!59343 c!39322) b!236200))

(assert (= (and d!59343 (not c!39322)) b!236201))

(assert (= (and d!59343 (not res!115836)) b!236202))

(declare-fun m!257085 () Bool)

(assert (=> d!59343 m!257085))

(declare-fun m!257087 () Bool)

(assert (=> b!236200 m!257087))

(declare-fun m!257089 () Bool)

(assert (=> b!236200 m!257089))

(assert (=> b!236200 m!257089))

(declare-fun m!257091 () Bool)

(assert (=> b!236200 m!257091))

(assert (=> b!236202 m!257089))

(assert (=> b!236202 m!257089))

(assert (=> b!236202 m!257091))

(assert (=> b!236132 d!59343))

(declare-fun b!236245 () Bool)

(declare-fun e!153445 () ListLongMap!3561)

(declare-fun call!21966 () ListLongMap!3561)

(assert (=> b!236245 (= e!153445 call!21966)))

(declare-fun b!236246 () Bool)

(declare-fun e!153442 () Unit!7272)

(declare-fun lt!119444 () Unit!7272)

(assert (=> b!236246 (= e!153442 lt!119444)))

(declare-fun lt!119459 () ListLongMap!3561)

(declare-fun getCurrentListMapNoExtraKeys!535 (array!11703 array!11701 (_ BitVec 32) (_ BitVec 32) V!7939 V!7939 (_ BitVec 32) Int) ListLongMap!3561)

(assert (=> b!236246 (= lt!119459 (getCurrentListMapNoExtraKeys!535 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)))))

(declare-fun lt!119451 () (_ BitVec 64))

(assert (=> b!236246 (= lt!119451 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119464 () (_ BitVec 64))

(assert (=> b!236246 (= lt!119464 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119450 () Unit!7272)

(declare-fun addStillContains!189 (ListLongMap!3561 (_ BitVec 64) V!7939 (_ BitVec 64)) Unit!7272)

(assert (=> b!236246 (= lt!119450 (addStillContains!189 lt!119459 lt!119451 (zeroValue!4230 thiss!1504) lt!119464))))

(declare-fun +!640 (ListLongMap!3561 tuple2!4648) ListLongMap!3561)

(assert (=> b!236246 (contains!1674 (+!640 lt!119459 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504))) lt!119464)))

(declare-fun lt!119458 () Unit!7272)

(assert (=> b!236246 (= lt!119458 lt!119450)))

(declare-fun lt!119453 () ListLongMap!3561)

(assert (=> b!236246 (= lt!119453 (getCurrentListMapNoExtraKeys!535 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)))))

(declare-fun lt!119456 () (_ BitVec 64))

(assert (=> b!236246 (= lt!119456 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119460 () (_ BitVec 64))

(assert (=> b!236246 (= lt!119460 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119461 () Unit!7272)

(declare-fun addApplyDifferent!189 (ListLongMap!3561 (_ BitVec 64) V!7939 (_ BitVec 64)) Unit!7272)

(assert (=> b!236246 (= lt!119461 (addApplyDifferent!189 lt!119453 lt!119456 (minValue!4230 thiss!1504) lt!119460))))

(declare-fun apply!213 (ListLongMap!3561 (_ BitVec 64)) V!7939)

(assert (=> b!236246 (= (apply!213 (+!640 lt!119453 (tuple2!4649 lt!119456 (minValue!4230 thiss!1504))) lt!119460) (apply!213 lt!119453 lt!119460))))

(declare-fun lt!119445 () Unit!7272)

(assert (=> b!236246 (= lt!119445 lt!119461)))

(declare-fun lt!119454 () ListLongMap!3561)

(assert (=> b!236246 (= lt!119454 (getCurrentListMapNoExtraKeys!535 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)))))

(declare-fun lt!119463 () (_ BitVec 64))

(assert (=> b!236246 (= lt!119463 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119446 () (_ BitVec 64))

(assert (=> b!236246 (= lt!119446 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119457 () Unit!7272)

(assert (=> b!236246 (= lt!119457 (addApplyDifferent!189 lt!119454 lt!119463 (zeroValue!4230 thiss!1504) lt!119446))))

(assert (=> b!236246 (= (apply!213 (+!640 lt!119454 (tuple2!4649 lt!119463 (zeroValue!4230 thiss!1504))) lt!119446) (apply!213 lt!119454 lt!119446))))

(declare-fun lt!119448 () Unit!7272)

(assert (=> b!236246 (= lt!119448 lt!119457)))

(declare-fun lt!119447 () ListLongMap!3561)

(assert (=> b!236246 (= lt!119447 (getCurrentListMapNoExtraKeys!535 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)))))

(declare-fun lt!119452 () (_ BitVec 64))

(assert (=> b!236246 (= lt!119452 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119449 () (_ BitVec 64))

(assert (=> b!236246 (= lt!119449 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236246 (= lt!119444 (addApplyDifferent!189 lt!119447 lt!119452 (minValue!4230 thiss!1504) lt!119449))))

(assert (=> b!236246 (= (apply!213 (+!640 lt!119447 (tuple2!4649 lt!119452 (minValue!4230 thiss!1504))) lt!119449) (apply!213 lt!119447 lt!119449))))

(declare-fun bm!21963 () Bool)

(declare-fun call!21969 () ListLongMap!3561)

(declare-fun call!21967 () ListLongMap!3561)

(assert (=> bm!21963 (= call!21969 call!21967)))

(declare-fun d!59345 () Bool)

(declare-fun e!153438 () Bool)

(assert (=> d!59345 e!153438))

(declare-fun res!115861 () Bool)

(assert (=> d!59345 (=> (not res!115861) (not e!153438))))

(assert (=> d!59345 (= res!115861 (or (bvsge #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))))))))

(declare-fun lt!119455 () ListLongMap!3561)

(declare-fun lt!119443 () ListLongMap!3561)

(assert (=> d!59345 (= lt!119455 lt!119443)))

(declare-fun lt!119462 () Unit!7272)

(assert (=> d!59345 (= lt!119462 e!153442)))

(declare-fun c!39336 () Bool)

(declare-fun e!153439 () Bool)

(assert (=> d!59345 (= c!39336 e!153439)))

(declare-fun res!115862 () Bool)

(assert (=> d!59345 (=> (not res!115862) (not e!153439))))

(assert (=> d!59345 (= res!115862 (bvslt #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))))))

(declare-fun e!153446 () ListLongMap!3561)

(assert (=> d!59345 (= lt!119443 e!153446)))

(declare-fun c!39339 () Bool)

(assert (=> d!59345 (= c!39339 (and (not (= (bvand (extraKeys!4126 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4126 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59345 (validMask!0 (mask!10374 thiss!1504))))

(assert (=> d!59345 (= (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)) lt!119455)))

(declare-fun b!236247 () Bool)

(declare-fun e!153443 () Bool)

(declare-fun e!153436 () Bool)

(assert (=> b!236247 (= e!153443 e!153436)))

(declare-fun res!115859 () Bool)

(declare-fun call!21972 () Bool)

(assert (=> b!236247 (= res!115859 call!21972)))

(assert (=> b!236247 (=> (not res!115859) (not e!153436))))

(declare-fun b!236248 () Bool)

(declare-fun e!153437 () Bool)

(declare-fun e!153448 () Bool)

(assert (=> b!236248 (= e!153437 e!153448)))

(declare-fun res!115855 () Bool)

(assert (=> b!236248 (=> (not res!115855) (not e!153448))))

(assert (=> b!236248 (= res!115855 (contains!1674 lt!119455 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236248 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))))))

(declare-fun b!236249 () Bool)

(declare-fun c!39338 () Bool)

(assert (=> b!236249 (= c!39338 (and (not (= (bvand (extraKeys!4126 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4126 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!153441 () ListLongMap!3561)

(assert (=> b!236249 (= e!153445 e!153441)))

(declare-fun b!236250 () Bool)

(declare-fun e!153447 () Bool)

(declare-fun e!153444 () Bool)

(assert (=> b!236250 (= e!153447 e!153444)))

(declare-fun res!115860 () Bool)

(declare-fun call!21968 () Bool)

(assert (=> b!236250 (= res!115860 call!21968)))

(assert (=> b!236250 (=> (not res!115860) (not e!153444))))

(declare-fun b!236251 () Bool)

(assert (=> b!236251 (= e!153443 (not call!21972))))

(declare-fun b!236252 () Bool)

(declare-fun Unit!7275 () Unit!7272)

(assert (=> b!236252 (= e!153442 Unit!7275)))

(declare-fun call!21971 () ListLongMap!3561)

(declare-fun c!39337 () Bool)

(declare-fun call!21970 () ListLongMap!3561)

(declare-fun bm!21964 () Bool)

(assert (=> bm!21964 (= call!21971 (+!640 (ite c!39339 call!21967 (ite c!39337 call!21969 call!21970)) (ite (or c!39339 c!39337) (tuple2!4649 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4230 thiss!1504)) (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504)))))))

(declare-fun b!236253 () Bool)

(assert (=> b!236253 (= e!153441 call!21966)))

(declare-fun b!236254 () Bool)

(declare-fun res!115863 () Bool)

(assert (=> b!236254 (=> (not res!115863) (not e!153438))))

(assert (=> b!236254 (= res!115863 e!153437)))

(declare-fun res!115856 () Bool)

(assert (=> b!236254 (=> res!115856 e!153437)))

(declare-fun e!153440 () Bool)

(assert (=> b!236254 (= res!115856 (not e!153440))))

(declare-fun res!115857 () Bool)

(assert (=> b!236254 (=> (not res!115857) (not e!153440))))

(assert (=> b!236254 (= res!115857 (bvslt #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))))))

(declare-fun b!236255 () Bool)

(assert (=> b!236255 (= e!153441 call!21970)))

(declare-fun b!236256 () Bool)

(assert (=> b!236256 (= e!153447 (not call!21968))))

(declare-fun b!236257 () Bool)

(declare-fun res!115858 () Bool)

(assert (=> b!236257 (=> (not res!115858) (not e!153438))))

(assert (=> b!236257 (= res!115858 e!153447)))

(declare-fun c!39335 () Bool)

(assert (=> b!236257 (= c!39335 (not (= (bvand (extraKeys!4126 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!236258 () Bool)

(assert (=> b!236258 (= e!153446 (+!640 call!21971 (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504))))))

(declare-fun b!236259 () Bool)

(assert (=> b!236259 (= e!153444 (= (apply!213 lt!119455 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4230 thiss!1504)))))

(declare-fun b!236260 () Bool)

(assert (=> b!236260 (= e!153436 (= (apply!213 lt!119455 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4230 thiss!1504)))))

(declare-fun b!236261 () Bool)

(declare-fun get!2856 (ValueCell!2766 V!7939) V!7939)

(declare-fun dynLambda!556 (Int (_ BitVec 64)) V!7939)

(assert (=> b!236261 (= e!153448 (= (apply!213 lt!119455 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)) (get!2856 (select (arr!5560 (_values!4372 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!556 (defaultEntry!4389 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!236261 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5897 (_values!4372 thiss!1504))))))

(assert (=> b!236261 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))))))

(declare-fun bm!21965 () Bool)

(assert (=> bm!21965 (= call!21966 call!21971)))

(declare-fun b!236262 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!236262 (= e!153440 (validKeyInArray!0 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236263 () Bool)

(assert (=> b!236263 (= e!153438 e!153443)))

(declare-fun c!39340 () Bool)

(assert (=> b!236263 (= c!39340 (not (= (bvand (extraKeys!4126 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21966 () Bool)

(assert (=> bm!21966 (= call!21968 (contains!1674 lt!119455 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21967 () Bool)

(assert (=> bm!21967 (= call!21972 (contains!1674 lt!119455 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236264 () Bool)

(assert (=> b!236264 (= e!153446 e!153445)))

(assert (=> b!236264 (= c!39337 (and (not (= (bvand (extraKeys!4126 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4126 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21968 () Bool)

(assert (=> bm!21968 (= call!21967 (getCurrentListMapNoExtraKeys!535 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)))))

(declare-fun bm!21969 () Bool)

(assert (=> bm!21969 (= call!21970 call!21969)))

(declare-fun b!236265 () Bool)

(assert (=> b!236265 (= e!153439 (validKeyInArray!0 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59345 c!39339) b!236258))

(assert (= (and d!59345 (not c!39339)) b!236264))

(assert (= (and b!236264 c!39337) b!236245))

(assert (= (and b!236264 (not c!39337)) b!236249))

(assert (= (and b!236249 c!39338) b!236253))

(assert (= (and b!236249 (not c!39338)) b!236255))

(assert (= (or b!236253 b!236255) bm!21969))

(assert (= (or b!236245 bm!21969) bm!21963))

(assert (= (or b!236245 b!236253) bm!21965))

(assert (= (or b!236258 bm!21963) bm!21968))

(assert (= (or b!236258 bm!21965) bm!21964))

(assert (= (and d!59345 res!115862) b!236265))

(assert (= (and d!59345 c!39336) b!236246))

(assert (= (and d!59345 (not c!39336)) b!236252))

(assert (= (and d!59345 res!115861) b!236254))

(assert (= (and b!236254 res!115857) b!236262))

(assert (= (and b!236254 (not res!115856)) b!236248))

(assert (= (and b!236248 res!115855) b!236261))

(assert (= (and b!236254 res!115863) b!236257))

(assert (= (and b!236257 c!39335) b!236250))

(assert (= (and b!236257 (not c!39335)) b!236256))

(assert (= (and b!236250 res!115860) b!236259))

(assert (= (or b!236250 b!236256) bm!21966))

(assert (= (and b!236257 res!115858) b!236263))

(assert (= (and b!236263 c!39340) b!236247))

(assert (= (and b!236263 (not c!39340)) b!236251))

(assert (= (and b!236247 res!115859) b!236260))

(assert (= (or b!236247 b!236251) bm!21967))

(declare-fun b_lambda!7915 () Bool)

(assert (=> (not b_lambda!7915) (not b!236261)))

(declare-fun t!8535 () Bool)

(declare-fun tb!2939 () Bool)

(assert (=> (and b!236138 (= (defaultEntry!4389 thiss!1504) (defaultEntry!4389 thiss!1504)) t!8535) tb!2939))

(declare-fun result!5139 () Bool)

(assert (=> tb!2939 (= result!5139 tp_is_empty!6219)))

(assert (=> b!236261 t!8535))

(declare-fun b_and!13295 () Bool)

(assert (= b_and!13291 (and (=> t!8535 result!5139) b_and!13295)))

(declare-fun m!257093 () Bool)

(assert (=> bm!21966 m!257093))

(declare-fun m!257095 () Bool)

(assert (=> b!236259 m!257095))

(declare-fun m!257097 () Bool)

(assert (=> b!236248 m!257097))

(assert (=> b!236248 m!257097))

(declare-fun m!257099 () Bool)

(assert (=> b!236248 m!257099))

(assert (=> b!236265 m!257097))

(assert (=> b!236265 m!257097))

(declare-fun m!257101 () Bool)

(assert (=> b!236265 m!257101))

(assert (=> d!59345 m!257045))

(declare-fun m!257103 () Bool)

(assert (=> b!236246 m!257103))

(declare-fun m!257105 () Bool)

(assert (=> b!236246 m!257105))

(declare-fun m!257107 () Bool)

(assert (=> b!236246 m!257107))

(declare-fun m!257109 () Bool)

(assert (=> b!236246 m!257109))

(declare-fun m!257111 () Bool)

(assert (=> b!236246 m!257111))

(declare-fun m!257113 () Bool)

(assert (=> b!236246 m!257113))

(declare-fun m!257115 () Bool)

(assert (=> b!236246 m!257115))

(assert (=> b!236246 m!257097))

(declare-fun m!257117 () Bool)

(assert (=> b!236246 m!257117))

(declare-fun m!257119 () Bool)

(assert (=> b!236246 m!257119))

(declare-fun m!257121 () Bool)

(assert (=> b!236246 m!257121))

(declare-fun m!257123 () Bool)

(assert (=> b!236246 m!257123))

(declare-fun m!257125 () Bool)

(assert (=> b!236246 m!257125))

(assert (=> b!236246 m!257113))

(declare-fun m!257127 () Bool)

(assert (=> b!236246 m!257127))

(declare-fun m!257129 () Bool)

(assert (=> b!236246 m!257129))

(assert (=> b!236246 m!257115))

(declare-fun m!257131 () Bool)

(assert (=> b!236246 m!257131))

(assert (=> b!236246 m!257123))

(declare-fun m!257133 () Bool)

(assert (=> b!236246 m!257133))

(assert (=> b!236246 m!257109))

(declare-fun m!257135 () Bool)

(assert (=> bm!21964 m!257135))

(declare-fun m!257137 () Bool)

(assert (=> b!236261 m!257137))

(declare-fun m!257139 () Bool)

(assert (=> b!236261 m!257139))

(assert (=> b!236261 m!257097))

(declare-fun m!257141 () Bool)

(assert (=> b!236261 m!257141))

(assert (=> b!236261 m!257097))

(assert (=> b!236261 m!257137))

(assert (=> b!236261 m!257139))

(declare-fun m!257143 () Bool)

(assert (=> b!236261 m!257143))

(assert (=> b!236262 m!257097))

(assert (=> b!236262 m!257097))

(assert (=> b!236262 m!257101))

(declare-fun m!257145 () Bool)

(assert (=> b!236258 m!257145))

(assert (=> bm!21968 m!257129))

(declare-fun m!257147 () Bool)

(assert (=> b!236260 m!257147))

(declare-fun m!257149 () Bool)

(assert (=> bm!21967 m!257149))

(assert (=> b!236132 d!59345))

(declare-fun d!59347 () Bool)

(assert (=> d!59347 (= (validMask!0 (mask!10374 thiss!1504)) (and (or (= (mask!10374 thiss!1504) #b00000000000000000000000000000111) (= (mask!10374 thiss!1504) #b00000000000000000000000000001111) (= (mask!10374 thiss!1504) #b00000000000000000000000000011111) (= (mask!10374 thiss!1504) #b00000000000000000000000000111111) (= (mask!10374 thiss!1504) #b00000000000000000000000001111111) (= (mask!10374 thiss!1504) #b00000000000000000000000011111111) (= (mask!10374 thiss!1504) #b00000000000000000000000111111111) (= (mask!10374 thiss!1504) #b00000000000000000000001111111111) (= (mask!10374 thiss!1504) #b00000000000000000000011111111111) (= (mask!10374 thiss!1504) #b00000000000000000000111111111111) (= (mask!10374 thiss!1504) #b00000000000000000001111111111111) (= (mask!10374 thiss!1504) #b00000000000000000011111111111111) (= (mask!10374 thiss!1504) #b00000000000000000111111111111111) (= (mask!10374 thiss!1504) #b00000000000000001111111111111111) (= (mask!10374 thiss!1504) #b00000000000000011111111111111111) (= (mask!10374 thiss!1504) #b00000000000000111111111111111111) (= (mask!10374 thiss!1504) #b00000000000001111111111111111111) (= (mask!10374 thiss!1504) #b00000000000011111111111111111111) (= (mask!10374 thiss!1504) #b00000000000111111111111111111111) (= (mask!10374 thiss!1504) #b00000000001111111111111111111111) (= (mask!10374 thiss!1504) #b00000000011111111111111111111111) (= (mask!10374 thiss!1504) #b00000000111111111111111111111111) (= (mask!10374 thiss!1504) #b00000001111111111111111111111111) (= (mask!10374 thiss!1504) #b00000011111111111111111111111111) (= (mask!10374 thiss!1504) #b00000111111111111111111111111111) (= (mask!10374 thiss!1504) #b00001111111111111111111111111111) (= (mask!10374 thiss!1504) #b00011111111111111111111111111111) (= (mask!10374 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10374 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!236137 d!59347))

(declare-fun b!236275 () Bool)

(declare-fun e!153454 () Bool)

(assert (=> b!236275 (= e!153454 tp_is_empty!6219)))

(declare-fun mapNonEmpty!10538 () Bool)

(declare-fun mapRes!10538 () Bool)

(declare-fun tp!22256 () Bool)

(declare-fun e!153453 () Bool)

(assert (=> mapNonEmpty!10538 (= mapRes!10538 (and tp!22256 e!153453))))

(declare-fun mapValue!10538 () ValueCell!2766)

(declare-fun mapKey!10538 () (_ BitVec 32))

(declare-fun mapRest!10538 () (Array (_ BitVec 32) ValueCell!2766))

(assert (=> mapNonEmpty!10538 (= mapRest!10532 (store mapRest!10538 mapKey!10538 mapValue!10538))))

(declare-fun condMapEmpty!10538 () Bool)

(declare-fun mapDefault!10538 () ValueCell!2766)

(assert (=> mapNonEmpty!10532 (= condMapEmpty!10538 (= mapRest!10532 ((as const (Array (_ BitVec 32) ValueCell!2766)) mapDefault!10538)))))

(assert (=> mapNonEmpty!10532 (= tp!22247 (and e!153454 mapRes!10538))))

(declare-fun mapIsEmpty!10538 () Bool)

(assert (=> mapIsEmpty!10538 mapRes!10538))

(declare-fun b!236274 () Bool)

(assert (=> b!236274 (= e!153453 tp_is_empty!6219)))

(assert (= (and mapNonEmpty!10532 condMapEmpty!10538) mapIsEmpty!10538))

(assert (= (and mapNonEmpty!10532 (not condMapEmpty!10538)) mapNonEmpty!10538))

(assert (= (and mapNonEmpty!10538 ((_ is ValueCellFull!2766) mapValue!10538)) b!236274))

(assert (= (and mapNonEmpty!10532 ((_ is ValueCellFull!2766) mapDefault!10538)) b!236275))

(declare-fun m!257151 () Bool)

(assert (=> mapNonEmpty!10538 m!257151))

(declare-fun b_lambda!7917 () Bool)

(assert (= b_lambda!7915 (or (and b!236138 b_free!6357) b_lambda!7917)))

(check-sat (not mapNonEmpty!10538) (not b!236192) (not b!236191) (not b_lambda!7917) tp_is_empty!6219 (not b!236248) (not d!59343) (not d!59341) (not b!236246) (not bm!21967) (not bm!21964) (not b_next!6357) (not bm!21966) (not b!236200) (not b!236261) b_and!13295 (not b!236202) (not b!236183) (not b!236258) (not b!236259) (not b!236193) (not b!236260) (not b!236262) (not d!59335) (not d!59345) (not b!236265) (not bm!21968))
(check-sat b_and!13295 (not b_next!6357))
(get-model)

(declare-fun d!59349 () Bool)

(assert (=> d!59349 (= (apply!213 (+!640 lt!119447 (tuple2!4649 lt!119452 (minValue!4230 thiss!1504))) lt!119449) (apply!213 lt!119447 lt!119449))))

(declare-fun lt!119467 () Unit!7272)

(declare-fun choose!1104 (ListLongMap!3561 (_ BitVec 64) V!7939 (_ BitVec 64)) Unit!7272)

(assert (=> d!59349 (= lt!119467 (choose!1104 lt!119447 lt!119452 (minValue!4230 thiss!1504) lt!119449))))

(declare-fun e!153457 () Bool)

(assert (=> d!59349 e!153457))

(declare-fun res!115866 () Bool)

(assert (=> d!59349 (=> (not res!115866) (not e!153457))))

(assert (=> d!59349 (= res!115866 (contains!1674 lt!119447 lt!119449))))

(assert (=> d!59349 (= (addApplyDifferent!189 lt!119447 lt!119452 (minValue!4230 thiss!1504) lt!119449) lt!119467)))

(declare-fun b!236279 () Bool)

(assert (=> b!236279 (= e!153457 (not (= lt!119449 lt!119452)))))

(assert (= (and d!59349 res!115866) b!236279))

(assert (=> d!59349 m!257113))

(assert (=> d!59349 m!257113))

(assert (=> d!59349 m!257127))

(declare-fun m!257153 () Bool)

(assert (=> d!59349 m!257153))

(declare-fun m!257155 () Bool)

(assert (=> d!59349 m!257155))

(assert (=> d!59349 m!257107))

(assert (=> b!236246 d!59349))

(declare-fun d!59351 () Bool)

(assert (=> d!59351 (= (apply!213 (+!640 lt!119453 (tuple2!4649 lt!119456 (minValue!4230 thiss!1504))) lt!119460) (apply!213 lt!119453 lt!119460))))

(declare-fun lt!119468 () Unit!7272)

(assert (=> d!59351 (= lt!119468 (choose!1104 lt!119453 lt!119456 (minValue!4230 thiss!1504) lt!119460))))

(declare-fun e!153458 () Bool)

(assert (=> d!59351 e!153458))

(declare-fun res!115867 () Bool)

(assert (=> d!59351 (=> (not res!115867) (not e!153458))))

(assert (=> d!59351 (= res!115867 (contains!1674 lt!119453 lt!119460))))

(assert (=> d!59351 (= (addApplyDifferent!189 lt!119453 lt!119456 (minValue!4230 thiss!1504) lt!119460) lt!119468)))

(declare-fun b!236280 () Bool)

(assert (=> b!236280 (= e!153458 (not (= lt!119460 lt!119456)))))

(assert (= (and d!59351 res!115867) b!236280))

(assert (=> d!59351 m!257123))

(assert (=> d!59351 m!257123))

(assert (=> d!59351 m!257133))

(declare-fun m!257157 () Bool)

(assert (=> d!59351 m!257157))

(declare-fun m!257159 () Bool)

(assert (=> d!59351 m!257159))

(assert (=> d!59351 m!257119))

(assert (=> b!236246 d!59351))

(declare-fun d!59353 () Bool)

(declare-fun e!153461 () Bool)

(assert (=> d!59353 e!153461))

(declare-fun res!115873 () Bool)

(assert (=> d!59353 (=> (not res!115873) (not e!153461))))

(declare-fun lt!119479 () ListLongMap!3561)

(assert (=> d!59353 (= res!115873 (contains!1674 lt!119479 (_1!2335 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504)))))))

(declare-fun lt!119480 () List!3553)

(assert (=> d!59353 (= lt!119479 (ListLongMap!3562 lt!119480))))

(declare-fun lt!119477 () Unit!7272)

(declare-fun lt!119478 () Unit!7272)

(assert (=> d!59353 (= lt!119477 lt!119478)))

(assert (=> d!59353 (= (getValueByKey!271 lt!119480 (_1!2335 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504)))) (Some!276 (_2!2335 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!151 (List!3553 (_ BitVec 64) V!7939) Unit!7272)

(assert (=> d!59353 (= lt!119478 (lemmaContainsTupThenGetReturnValue!151 lt!119480 (_1!2335 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504))) (_2!2335 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504)))))))

(declare-fun insertStrictlySorted!154 (List!3553 (_ BitVec 64) V!7939) List!3553)

(assert (=> d!59353 (= lt!119480 (insertStrictlySorted!154 (toList!1796 lt!119459) (_1!2335 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504))) (_2!2335 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504)))))))

(assert (=> d!59353 (= (+!640 lt!119459 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504))) lt!119479)))

(declare-fun b!236285 () Bool)

(declare-fun res!115872 () Bool)

(assert (=> b!236285 (=> (not res!115872) (not e!153461))))

(assert (=> b!236285 (= res!115872 (= (getValueByKey!271 (toList!1796 lt!119479) (_1!2335 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504)))) (Some!276 (_2!2335 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504))))))))

(declare-fun b!236286 () Bool)

(declare-fun contains!1676 (List!3553 tuple2!4648) Bool)

(assert (=> b!236286 (= e!153461 (contains!1676 (toList!1796 lt!119479) (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504))))))

(assert (= (and d!59353 res!115873) b!236285))

(assert (= (and b!236285 res!115872) b!236286))

(declare-fun m!257161 () Bool)

(assert (=> d!59353 m!257161))

(declare-fun m!257163 () Bool)

(assert (=> d!59353 m!257163))

(declare-fun m!257165 () Bool)

(assert (=> d!59353 m!257165))

(declare-fun m!257167 () Bool)

(assert (=> d!59353 m!257167))

(declare-fun m!257169 () Bool)

(assert (=> b!236285 m!257169))

(declare-fun m!257171 () Bool)

(assert (=> b!236286 m!257171))

(assert (=> b!236246 d!59353))

(declare-fun d!59355 () Bool)

(declare-fun get!2857 (Option!277) V!7939)

(assert (=> d!59355 (= (apply!213 (+!640 lt!119453 (tuple2!4649 lt!119456 (minValue!4230 thiss!1504))) lt!119460) (get!2857 (getValueByKey!271 (toList!1796 (+!640 lt!119453 (tuple2!4649 lt!119456 (minValue!4230 thiss!1504)))) lt!119460)))))

(declare-fun bs!8727 () Bool)

(assert (= bs!8727 d!59355))

(declare-fun m!257173 () Bool)

(assert (=> bs!8727 m!257173))

(assert (=> bs!8727 m!257173))

(declare-fun m!257175 () Bool)

(assert (=> bs!8727 m!257175))

(assert (=> b!236246 d!59355))

(declare-fun d!59357 () Bool)

(declare-fun e!153462 () Bool)

(assert (=> d!59357 e!153462))

(declare-fun res!115875 () Bool)

(assert (=> d!59357 (=> (not res!115875) (not e!153462))))

(declare-fun lt!119483 () ListLongMap!3561)

(assert (=> d!59357 (= res!115875 (contains!1674 lt!119483 (_1!2335 (tuple2!4649 lt!119452 (minValue!4230 thiss!1504)))))))

(declare-fun lt!119484 () List!3553)

(assert (=> d!59357 (= lt!119483 (ListLongMap!3562 lt!119484))))

(declare-fun lt!119481 () Unit!7272)

(declare-fun lt!119482 () Unit!7272)

(assert (=> d!59357 (= lt!119481 lt!119482)))

(assert (=> d!59357 (= (getValueByKey!271 lt!119484 (_1!2335 (tuple2!4649 lt!119452 (minValue!4230 thiss!1504)))) (Some!276 (_2!2335 (tuple2!4649 lt!119452 (minValue!4230 thiss!1504)))))))

(assert (=> d!59357 (= lt!119482 (lemmaContainsTupThenGetReturnValue!151 lt!119484 (_1!2335 (tuple2!4649 lt!119452 (minValue!4230 thiss!1504))) (_2!2335 (tuple2!4649 lt!119452 (minValue!4230 thiss!1504)))))))

(assert (=> d!59357 (= lt!119484 (insertStrictlySorted!154 (toList!1796 lt!119447) (_1!2335 (tuple2!4649 lt!119452 (minValue!4230 thiss!1504))) (_2!2335 (tuple2!4649 lt!119452 (minValue!4230 thiss!1504)))))))

(assert (=> d!59357 (= (+!640 lt!119447 (tuple2!4649 lt!119452 (minValue!4230 thiss!1504))) lt!119483)))

(declare-fun b!236287 () Bool)

(declare-fun res!115874 () Bool)

(assert (=> b!236287 (=> (not res!115874) (not e!153462))))

(assert (=> b!236287 (= res!115874 (= (getValueByKey!271 (toList!1796 lt!119483) (_1!2335 (tuple2!4649 lt!119452 (minValue!4230 thiss!1504)))) (Some!276 (_2!2335 (tuple2!4649 lt!119452 (minValue!4230 thiss!1504))))))))

(declare-fun b!236288 () Bool)

(assert (=> b!236288 (= e!153462 (contains!1676 (toList!1796 lt!119483) (tuple2!4649 lt!119452 (minValue!4230 thiss!1504))))))

(assert (= (and d!59357 res!115875) b!236287))

(assert (= (and b!236287 res!115874) b!236288))

(declare-fun m!257177 () Bool)

(assert (=> d!59357 m!257177))

(declare-fun m!257179 () Bool)

(assert (=> d!59357 m!257179))

(declare-fun m!257181 () Bool)

(assert (=> d!59357 m!257181))

(declare-fun m!257183 () Bool)

(assert (=> d!59357 m!257183))

(declare-fun m!257185 () Bool)

(assert (=> b!236287 m!257185))

(declare-fun m!257187 () Bool)

(assert (=> b!236288 m!257187))

(assert (=> b!236246 d!59357))

(declare-fun d!59359 () Bool)

(assert (=> d!59359 (contains!1674 (+!640 lt!119459 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504))) lt!119464)))

(declare-fun lt!119487 () Unit!7272)

(declare-fun choose!1105 (ListLongMap!3561 (_ BitVec 64) V!7939 (_ BitVec 64)) Unit!7272)

(assert (=> d!59359 (= lt!119487 (choose!1105 lt!119459 lt!119451 (zeroValue!4230 thiss!1504) lt!119464))))

(assert (=> d!59359 (contains!1674 lt!119459 lt!119464)))

(assert (=> d!59359 (= (addStillContains!189 lt!119459 lt!119451 (zeroValue!4230 thiss!1504) lt!119464) lt!119487)))

(declare-fun bs!8728 () Bool)

(assert (= bs!8728 d!59359))

(assert (=> bs!8728 m!257109))

(assert (=> bs!8728 m!257109))

(assert (=> bs!8728 m!257111))

(declare-fun m!257189 () Bool)

(assert (=> bs!8728 m!257189))

(declare-fun m!257191 () Bool)

(assert (=> bs!8728 m!257191))

(assert (=> b!236246 d!59359))

(declare-fun b!236314 () Bool)

(declare-fun e!153479 () ListLongMap!3561)

(assert (=> b!236314 (= e!153479 (ListLongMap!3562 Nil!3550))))

(declare-fun b!236315 () Bool)

(declare-fun lt!119505 () Unit!7272)

(declare-fun lt!119502 () Unit!7272)

(assert (=> b!236315 (= lt!119505 lt!119502)))

(declare-fun lt!119503 () (_ BitVec 64))

(declare-fun lt!119507 () (_ BitVec 64))

(declare-fun lt!119508 () ListLongMap!3561)

(declare-fun lt!119506 () V!7939)

(assert (=> b!236315 (not (contains!1674 (+!640 lt!119508 (tuple2!4649 lt!119507 lt!119506)) lt!119503))))

(declare-fun addStillNotContains!115 (ListLongMap!3561 (_ BitVec 64) V!7939 (_ BitVec 64)) Unit!7272)

(assert (=> b!236315 (= lt!119502 (addStillNotContains!115 lt!119508 lt!119507 lt!119506 lt!119503))))

(assert (=> b!236315 (= lt!119503 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!236315 (= lt!119506 (get!2856 (select (arr!5560 (_values!4372 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!556 (defaultEntry!4389 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236315 (= lt!119507 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!21975 () ListLongMap!3561)

(assert (=> b!236315 (= lt!119508 call!21975)))

(declare-fun e!153483 () ListLongMap!3561)

(assert (=> b!236315 (= e!153483 (+!640 call!21975 (tuple2!4649 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000) (get!2856 (select (arr!5560 (_values!4372 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!556 (defaultEntry!4389 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!236316 () Bool)

(declare-fun e!153481 () Bool)

(declare-fun e!153477 () Bool)

(assert (=> b!236316 (= e!153481 e!153477)))

(declare-fun c!39352 () Bool)

(declare-fun e!153482 () Bool)

(assert (=> b!236316 (= c!39352 e!153482)))

(declare-fun res!115887 () Bool)

(assert (=> b!236316 (=> (not res!115887) (not e!153482))))

(assert (=> b!236316 (= res!115887 (bvslt #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))))))

(declare-fun b!236317 () Bool)

(declare-fun e!153478 () Bool)

(declare-fun lt!119504 () ListLongMap!3561)

(assert (=> b!236317 (= e!153478 (= lt!119504 (getCurrentListMapNoExtraKeys!535 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4389 thiss!1504))))))

(declare-fun d!59361 () Bool)

(assert (=> d!59361 e!153481))

(declare-fun res!115886 () Bool)

(assert (=> d!59361 (=> (not res!115886) (not e!153481))))

(assert (=> d!59361 (= res!115886 (not (contains!1674 lt!119504 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59361 (= lt!119504 e!153479)))

(declare-fun c!39350 () Bool)

(assert (=> d!59361 (= c!39350 (bvsge #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))))))

(assert (=> d!59361 (validMask!0 (mask!10374 thiss!1504))))

(assert (=> d!59361 (= (getCurrentListMapNoExtraKeys!535 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)) lt!119504)))

(declare-fun b!236318 () Bool)

(assert (=> b!236318 (= e!153483 call!21975)))

(declare-fun b!236319 () Bool)

(assert (=> b!236319 (= e!153479 e!153483)))

(declare-fun c!39351 () Bool)

(assert (=> b!236319 (= c!39351 (validKeyInArray!0 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236320 () Bool)

(declare-fun e!153480 () Bool)

(assert (=> b!236320 (= e!153477 e!153480)))

(assert (=> b!236320 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))))))

(declare-fun res!115885 () Bool)

(assert (=> b!236320 (= res!115885 (contains!1674 lt!119504 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236320 (=> (not res!115885) (not e!153480))))

(declare-fun b!236321 () Bool)

(assert (=> b!236321 (= e!153477 e!153478)))

(declare-fun c!39349 () Bool)

(assert (=> b!236321 (= c!39349 (bvslt #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))))))

(declare-fun b!236322 () Bool)

(assert (=> b!236322 (= e!153482 (validKeyInArray!0 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236322 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!21972 () Bool)

(assert (=> bm!21972 (= call!21975 (getCurrentListMapNoExtraKeys!535 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4389 thiss!1504)))))

(declare-fun b!236323 () Bool)

(assert (=> b!236323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))))))

(assert (=> b!236323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5897 (_values!4372 thiss!1504))))))

(assert (=> b!236323 (= e!153480 (= (apply!213 lt!119504 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)) (get!2856 (select (arr!5560 (_values!4372 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!556 (defaultEntry!4389 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!236324 () Bool)

(declare-fun res!115884 () Bool)

(assert (=> b!236324 (=> (not res!115884) (not e!153481))))

(assert (=> b!236324 (= res!115884 (not (contains!1674 lt!119504 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236325 () Bool)

(declare-fun isEmpty!512 (ListLongMap!3561) Bool)

(assert (=> b!236325 (= e!153478 (isEmpty!512 lt!119504))))

(assert (= (and d!59361 c!39350) b!236314))

(assert (= (and d!59361 (not c!39350)) b!236319))

(assert (= (and b!236319 c!39351) b!236315))

(assert (= (and b!236319 (not c!39351)) b!236318))

(assert (= (or b!236315 b!236318) bm!21972))

(assert (= (and d!59361 res!115886) b!236324))

(assert (= (and b!236324 res!115884) b!236316))

(assert (= (and b!236316 res!115887) b!236322))

(assert (= (and b!236316 c!39352) b!236320))

(assert (= (and b!236316 (not c!39352)) b!236321))

(assert (= (and b!236320 res!115885) b!236323))

(assert (= (and b!236321 c!39349) b!236317))

(assert (= (and b!236321 (not c!39349)) b!236325))

(declare-fun b_lambda!7919 () Bool)

(assert (=> (not b_lambda!7919) (not b!236315)))

(assert (=> b!236315 t!8535))

(declare-fun b_and!13297 () Bool)

(assert (= b_and!13295 (and (=> t!8535 result!5139) b_and!13297)))

(declare-fun b_lambda!7921 () Bool)

(assert (=> (not b_lambda!7921) (not b!236323)))

(assert (=> b!236323 t!8535))

(declare-fun b_and!13299 () Bool)

(assert (= b_and!13297 (and (=> t!8535 result!5139) b_and!13299)))

(declare-fun m!257193 () Bool)

(assert (=> bm!21972 m!257193))

(assert (=> b!236320 m!257097))

(assert (=> b!236320 m!257097))

(declare-fun m!257195 () Bool)

(assert (=> b!236320 m!257195))

(declare-fun m!257197 () Bool)

(assert (=> b!236315 m!257197))

(declare-fun m!257199 () Bool)

(assert (=> b!236315 m!257199))

(assert (=> b!236315 m!257137))

(assert (=> b!236315 m!257137))

(assert (=> b!236315 m!257139))

(assert (=> b!236315 m!257143))

(declare-fun m!257201 () Bool)

(assert (=> b!236315 m!257201))

(assert (=> b!236315 m!257097))

(assert (=> b!236315 m!257139))

(declare-fun m!257203 () Bool)

(assert (=> b!236315 m!257203))

(assert (=> b!236315 m!257197))

(declare-fun m!257205 () Bool)

(assert (=> d!59361 m!257205))

(assert (=> d!59361 m!257045))

(declare-fun m!257207 () Bool)

(assert (=> b!236325 m!257207))

(assert (=> b!236322 m!257097))

(assert (=> b!236322 m!257097))

(assert (=> b!236322 m!257101))

(assert (=> b!236319 m!257097))

(assert (=> b!236319 m!257097))

(assert (=> b!236319 m!257101))

(assert (=> b!236317 m!257193))

(declare-fun m!257209 () Bool)

(assert (=> b!236324 m!257209))

(assert (=> b!236323 m!257137))

(assert (=> b!236323 m!257137))

(assert (=> b!236323 m!257139))

(assert (=> b!236323 m!257143))

(assert (=> b!236323 m!257097))

(assert (=> b!236323 m!257139))

(assert (=> b!236323 m!257097))

(declare-fun m!257211 () Bool)

(assert (=> b!236323 m!257211))

(assert (=> b!236246 d!59361))

(declare-fun d!59363 () Bool)

(declare-fun e!153484 () Bool)

(assert (=> d!59363 e!153484))

(declare-fun res!115889 () Bool)

(assert (=> d!59363 (=> (not res!115889) (not e!153484))))

(declare-fun lt!119511 () ListLongMap!3561)

(assert (=> d!59363 (= res!115889 (contains!1674 lt!119511 (_1!2335 (tuple2!4649 lt!119463 (zeroValue!4230 thiss!1504)))))))

(declare-fun lt!119512 () List!3553)

(assert (=> d!59363 (= lt!119511 (ListLongMap!3562 lt!119512))))

(declare-fun lt!119509 () Unit!7272)

(declare-fun lt!119510 () Unit!7272)

(assert (=> d!59363 (= lt!119509 lt!119510)))

(assert (=> d!59363 (= (getValueByKey!271 lt!119512 (_1!2335 (tuple2!4649 lt!119463 (zeroValue!4230 thiss!1504)))) (Some!276 (_2!2335 (tuple2!4649 lt!119463 (zeroValue!4230 thiss!1504)))))))

(assert (=> d!59363 (= lt!119510 (lemmaContainsTupThenGetReturnValue!151 lt!119512 (_1!2335 (tuple2!4649 lt!119463 (zeroValue!4230 thiss!1504))) (_2!2335 (tuple2!4649 lt!119463 (zeroValue!4230 thiss!1504)))))))

(assert (=> d!59363 (= lt!119512 (insertStrictlySorted!154 (toList!1796 lt!119454) (_1!2335 (tuple2!4649 lt!119463 (zeroValue!4230 thiss!1504))) (_2!2335 (tuple2!4649 lt!119463 (zeroValue!4230 thiss!1504)))))))

(assert (=> d!59363 (= (+!640 lt!119454 (tuple2!4649 lt!119463 (zeroValue!4230 thiss!1504))) lt!119511)))

(declare-fun b!236326 () Bool)

(declare-fun res!115888 () Bool)

(assert (=> b!236326 (=> (not res!115888) (not e!153484))))

(assert (=> b!236326 (= res!115888 (= (getValueByKey!271 (toList!1796 lt!119511) (_1!2335 (tuple2!4649 lt!119463 (zeroValue!4230 thiss!1504)))) (Some!276 (_2!2335 (tuple2!4649 lt!119463 (zeroValue!4230 thiss!1504))))))))

(declare-fun b!236327 () Bool)

(assert (=> b!236327 (= e!153484 (contains!1676 (toList!1796 lt!119511) (tuple2!4649 lt!119463 (zeroValue!4230 thiss!1504))))))

(assert (= (and d!59363 res!115889) b!236326))

(assert (= (and b!236326 res!115888) b!236327))

(declare-fun m!257213 () Bool)

(assert (=> d!59363 m!257213))

(declare-fun m!257215 () Bool)

(assert (=> d!59363 m!257215))

(declare-fun m!257217 () Bool)

(assert (=> d!59363 m!257217))

(declare-fun m!257219 () Bool)

(assert (=> d!59363 m!257219))

(declare-fun m!257221 () Bool)

(assert (=> b!236326 m!257221))

(declare-fun m!257223 () Bool)

(assert (=> b!236327 m!257223))

(assert (=> b!236246 d!59363))

(declare-fun d!59365 () Bool)

(declare-fun e!153485 () Bool)

(assert (=> d!59365 e!153485))

(declare-fun res!115891 () Bool)

(assert (=> d!59365 (=> (not res!115891) (not e!153485))))

(declare-fun lt!119515 () ListLongMap!3561)

(assert (=> d!59365 (= res!115891 (contains!1674 lt!119515 (_1!2335 (tuple2!4649 lt!119456 (minValue!4230 thiss!1504)))))))

(declare-fun lt!119516 () List!3553)

(assert (=> d!59365 (= lt!119515 (ListLongMap!3562 lt!119516))))

(declare-fun lt!119513 () Unit!7272)

(declare-fun lt!119514 () Unit!7272)

(assert (=> d!59365 (= lt!119513 lt!119514)))

(assert (=> d!59365 (= (getValueByKey!271 lt!119516 (_1!2335 (tuple2!4649 lt!119456 (minValue!4230 thiss!1504)))) (Some!276 (_2!2335 (tuple2!4649 lt!119456 (minValue!4230 thiss!1504)))))))

(assert (=> d!59365 (= lt!119514 (lemmaContainsTupThenGetReturnValue!151 lt!119516 (_1!2335 (tuple2!4649 lt!119456 (minValue!4230 thiss!1504))) (_2!2335 (tuple2!4649 lt!119456 (minValue!4230 thiss!1504)))))))

(assert (=> d!59365 (= lt!119516 (insertStrictlySorted!154 (toList!1796 lt!119453) (_1!2335 (tuple2!4649 lt!119456 (minValue!4230 thiss!1504))) (_2!2335 (tuple2!4649 lt!119456 (minValue!4230 thiss!1504)))))))

(assert (=> d!59365 (= (+!640 lt!119453 (tuple2!4649 lt!119456 (minValue!4230 thiss!1504))) lt!119515)))

(declare-fun b!236328 () Bool)

(declare-fun res!115890 () Bool)

(assert (=> b!236328 (=> (not res!115890) (not e!153485))))

(assert (=> b!236328 (= res!115890 (= (getValueByKey!271 (toList!1796 lt!119515) (_1!2335 (tuple2!4649 lt!119456 (minValue!4230 thiss!1504)))) (Some!276 (_2!2335 (tuple2!4649 lt!119456 (minValue!4230 thiss!1504))))))))

(declare-fun b!236329 () Bool)

(assert (=> b!236329 (= e!153485 (contains!1676 (toList!1796 lt!119515) (tuple2!4649 lt!119456 (minValue!4230 thiss!1504))))))

(assert (= (and d!59365 res!115891) b!236328))

(assert (= (and b!236328 res!115890) b!236329))

(declare-fun m!257225 () Bool)

(assert (=> d!59365 m!257225))

(declare-fun m!257227 () Bool)

(assert (=> d!59365 m!257227))

(declare-fun m!257229 () Bool)

(assert (=> d!59365 m!257229))

(declare-fun m!257231 () Bool)

(assert (=> d!59365 m!257231))

(declare-fun m!257233 () Bool)

(assert (=> b!236328 m!257233))

(declare-fun m!257235 () Bool)

(assert (=> b!236329 m!257235))

(assert (=> b!236246 d!59365))

(declare-fun d!59367 () Bool)

(assert (=> d!59367 (= (apply!213 lt!119447 lt!119449) (get!2857 (getValueByKey!271 (toList!1796 lt!119447) lt!119449)))))

(declare-fun bs!8729 () Bool)

(assert (= bs!8729 d!59367))

(declare-fun m!257237 () Bool)

(assert (=> bs!8729 m!257237))

(assert (=> bs!8729 m!257237))

(declare-fun m!257239 () Bool)

(assert (=> bs!8729 m!257239))

(assert (=> b!236246 d!59367))

(declare-fun d!59369 () Bool)

(assert (=> d!59369 (= (apply!213 (+!640 lt!119447 (tuple2!4649 lt!119452 (minValue!4230 thiss!1504))) lt!119449) (get!2857 (getValueByKey!271 (toList!1796 (+!640 lt!119447 (tuple2!4649 lt!119452 (minValue!4230 thiss!1504)))) lt!119449)))))

(declare-fun bs!8730 () Bool)

(assert (= bs!8730 d!59369))

(declare-fun m!257241 () Bool)

(assert (=> bs!8730 m!257241))

(assert (=> bs!8730 m!257241))

(declare-fun m!257243 () Bool)

(assert (=> bs!8730 m!257243))

(assert (=> b!236246 d!59369))

(declare-fun d!59371 () Bool)

(assert (=> d!59371 (= (apply!213 (+!640 lt!119454 (tuple2!4649 lt!119463 (zeroValue!4230 thiss!1504))) lt!119446) (apply!213 lt!119454 lt!119446))))

(declare-fun lt!119517 () Unit!7272)

(assert (=> d!59371 (= lt!119517 (choose!1104 lt!119454 lt!119463 (zeroValue!4230 thiss!1504) lt!119446))))

(declare-fun e!153486 () Bool)

(assert (=> d!59371 e!153486))

(declare-fun res!115892 () Bool)

(assert (=> d!59371 (=> (not res!115892) (not e!153486))))

(assert (=> d!59371 (= res!115892 (contains!1674 lt!119454 lt!119446))))

(assert (=> d!59371 (= (addApplyDifferent!189 lt!119454 lt!119463 (zeroValue!4230 thiss!1504) lt!119446) lt!119517)))

(declare-fun b!236330 () Bool)

(assert (=> b!236330 (= e!153486 (not (= lt!119446 lt!119463)))))

(assert (= (and d!59371 res!115892) b!236330))

(assert (=> d!59371 m!257115))

(assert (=> d!59371 m!257115))

(assert (=> d!59371 m!257131))

(declare-fun m!257245 () Bool)

(assert (=> d!59371 m!257245))

(declare-fun m!257247 () Bool)

(assert (=> d!59371 m!257247))

(assert (=> d!59371 m!257117))

(assert (=> b!236246 d!59371))

(declare-fun d!59373 () Bool)

(declare-fun e!153487 () Bool)

(assert (=> d!59373 e!153487))

(declare-fun res!115893 () Bool)

(assert (=> d!59373 (=> res!115893 e!153487)))

(declare-fun lt!119518 () Bool)

(assert (=> d!59373 (= res!115893 (not lt!119518))))

(declare-fun lt!119519 () Bool)

(assert (=> d!59373 (= lt!119518 lt!119519)))

(declare-fun lt!119521 () Unit!7272)

(declare-fun e!153488 () Unit!7272)

(assert (=> d!59373 (= lt!119521 e!153488)))

(declare-fun c!39353 () Bool)

(assert (=> d!59373 (= c!39353 lt!119519)))

(assert (=> d!59373 (= lt!119519 (containsKey!263 (toList!1796 (+!640 lt!119459 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504)))) lt!119464))))

(assert (=> d!59373 (= (contains!1674 (+!640 lt!119459 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504))) lt!119464) lt!119518)))

(declare-fun b!236331 () Bool)

(declare-fun lt!119520 () Unit!7272)

(assert (=> b!236331 (= e!153488 lt!119520)))

(assert (=> b!236331 (= lt!119520 (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1796 (+!640 lt!119459 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504)))) lt!119464))))

(assert (=> b!236331 (isDefined!212 (getValueByKey!271 (toList!1796 (+!640 lt!119459 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504)))) lt!119464))))

(declare-fun b!236332 () Bool)

(declare-fun Unit!7276 () Unit!7272)

(assert (=> b!236332 (= e!153488 Unit!7276)))

(declare-fun b!236333 () Bool)

(assert (=> b!236333 (= e!153487 (isDefined!212 (getValueByKey!271 (toList!1796 (+!640 lt!119459 (tuple2!4649 lt!119451 (zeroValue!4230 thiss!1504)))) lt!119464)))))

(assert (= (and d!59373 c!39353) b!236331))

(assert (= (and d!59373 (not c!39353)) b!236332))

(assert (= (and d!59373 (not res!115893)) b!236333))

(declare-fun m!257249 () Bool)

(assert (=> d!59373 m!257249))

(declare-fun m!257251 () Bool)

(assert (=> b!236331 m!257251))

(declare-fun m!257253 () Bool)

(assert (=> b!236331 m!257253))

(assert (=> b!236331 m!257253))

(declare-fun m!257255 () Bool)

(assert (=> b!236331 m!257255))

(assert (=> b!236333 m!257253))

(assert (=> b!236333 m!257253))

(assert (=> b!236333 m!257255))

(assert (=> b!236246 d!59373))

(declare-fun d!59375 () Bool)

(assert (=> d!59375 (= (apply!213 (+!640 lt!119454 (tuple2!4649 lt!119463 (zeroValue!4230 thiss!1504))) lt!119446) (get!2857 (getValueByKey!271 (toList!1796 (+!640 lt!119454 (tuple2!4649 lt!119463 (zeroValue!4230 thiss!1504)))) lt!119446)))))

(declare-fun bs!8731 () Bool)

(assert (= bs!8731 d!59375))

(declare-fun m!257257 () Bool)

(assert (=> bs!8731 m!257257))

(assert (=> bs!8731 m!257257))

(declare-fun m!257259 () Bool)

(assert (=> bs!8731 m!257259))

(assert (=> b!236246 d!59375))

(declare-fun d!59377 () Bool)

(assert (=> d!59377 (= (apply!213 lt!119454 lt!119446) (get!2857 (getValueByKey!271 (toList!1796 lt!119454) lt!119446)))))

(declare-fun bs!8732 () Bool)

(assert (= bs!8732 d!59377))

(declare-fun m!257261 () Bool)

(assert (=> bs!8732 m!257261))

(assert (=> bs!8732 m!257261))

(declare-fun m!257263 () Bool)

(assert (=> bs!8732 m!257263))

(assert (=> b!236246 d!59377))

(declare-fun d!59379 () Bool)

(assert (=> d!59379 (= (apply!213 lt!119453 lt!119460) (get!2857 (getValueByKey!271 (toList!1796 lt!119453) lt!119460)))))

(declare-fun bs!8733 () Bool)

(assert (= bs!8733 d!59379))

(declare-fun m!257265 () Bool)

(assert (=> bs!8733 m!257265))

(assert (=> bs!8733 m!257265))

(declare-fun m!257267 () Bool)

(assert (=> bs!8733 m!257267))

(assert (=> b!236246 d!59379))

(declare-fun b!236343 () Bool)

(declare-fun res!115905 () Bool)

(declare-fun e!153491 () Bool)

(assert (=> b!236343 (=> (not res!115905) (not e!153491))))

(declare-fun size!5901 (LongMapFixedSize!3432) (_ BitVec 32))

(assert (=> b!236343 (= res!115905 (bvsge (size!5901 thiss!1504) (_size!1765 thiss!1504)))))

(declare-fun b!236342 () Bool)

(declare-fun res!115903 () Bool)

(assert (=> b!236342 (=> (not res!115903) (not e!153491))))

(assert (=> b!236342 (= res!115903 (and (= (size!5897 (_values!4372 thiss!1504)) (bvadd (mask!10374 thiss!1504) #b00000000000000000000000000000001)) (= (size!5898 (_keys!6468 thiss!1504)) (size!5897 (_values!4372 thiss!1504))) (bvsge (_size!1765 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1765 thiss!1504) (bvadd (mask!10374 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!59381 () Bool)

(declare-fun res!115902 () Bool)

(assert (=> d!59381 (=> (not res!115902) (not e!153491))))

(assert (=> d!59381 (= res!115902 (validMask!0 (mask!10374 thiss!1504)))))

(assert (=> d!59381 (= (simpleValid!236 thiss!1504) e!153491)))

(declare-fun b!236345 () Bool)

(assert (=> b!236345 (= e!153491 (and (bvsge (extraKeys!4126 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4126 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1765 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!236344 () Bool)

(declare-fun res!115904 () Bool)

(assert (=> b!236344 (=> (not res!115904) (not e!153491))))

(assert (=> b!236344 (= res!115904 (= (size!5901 thiss!1504) (bvadd (_size!1765 thiss!1504) (bvsdiv (bvadd (extraKeys!4126 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!59381 res!115902) b!236342))

(assert (= (and b!236342 res!115903) b!236343))

(assert (= (and b!236343 res!115905) b!236344))

(assert (= (and b!236344 res!115904) b!236345))

(declare-fun m!257269 () Bool)

(assert (=> b!236343 m!257269))

(assert (=> d!59381 m!257045))

(assert (=> b!236344 m!257269))

(assert (=> d!59341 d!59381))

(declare-fun d!59383 () Bool)

(declare-fun e!153492 () Bool)

(assert (=> d!59383 e!153492))

(declare-fun res!115906 () Bool)

(assert (=> d!59383 (=> res!115906 e!153492)))

(declare-fun lt!119522 () Bool)

(assert (=> d!59383 (= res!115906 (not lt!119522))))

(declare-fun lt!119523 () Bool)

(assert (=> d!59383 (= lt!119522 lt!119523)))

(declare-fun lt!119525 () Unit!7272)

(declare-fun e!153493 () Unit!7272)

(assert (=> d!59383 (= lt!119525 e!153493)))

(declare-fun c!39354 () Bool)

(assert (=> d!59383 (= c!39354 lt!119523)))

(assert (=> d!59383 (= lt!119523 (containsKey!263 (toList!1796 lt!119455) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59383 (= (contains!1674 lt!119455 #b0000000000000000000000000000000000000000000000000000000000000000) lt!119522)))

(declare-fun b!236346 () Bool)

(declare-fun lt!119524 () Unit!7272)

(assert (=> b!236346 (= e!153493 lt!119524)))

(assert (=> b!236346 (= lt!119524 (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1796 lt!119455) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236346 (isDefined!212 (getValueByKey!271 (toList!1796 lt!119455) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236347 () Bool)

(declare-fun Unit!7277 () Unit!7272)

(assert (=> b!236347 (= e!153493 Unit!7277)))

(declare-fun b!236348 () Bool)

(assert (=> b!236348 (= e!153492 (isDefined!212 (getValueByKey!271 (toList!1796 lt!119455) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59383 c!39354) b!236346))

(assert (= (and d!59383 (not c!39354)) b!236347))

(assert (= (and d!59383 (not res!115906)) b!236348))

(declare-fun m!257271 () Bool)

(assert (=> d!59383 m!257271))

(declare-fun m!257273 () Bool)

(assert (=> b!236346 m!257273))

(declare-fun m!257275 () Bool)

(assert (=> b!236346 m!257275))

(assert (=> b!236346 m!257275))

(declare-fun m!257277 () Bool)

(assert (=> b!236346 m!257277))

(assert (=> b!236348 m!257275))

(assert (=> b!236348 m!257275))

(assert (=> b!236348 m!257277))

(assert (=> bm!21966 d!59383))

(declare-fun d!59385 () Bool)

(assert (=> d!59385 (= (validKeyInArray!0 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!236262 d!59385))

(declare-fun d!59387 () Bool)

(declare-fun e!153494 () Bool)

(assert (=> d!59387 e!153494))

(declare-fun res!115908 () Bool)

(assert (=> d!59387 (=> (not res!115908) (not e!153494))))

(declare-fun lt!119528 () ListLongMap!3561)

(assert (=> d!59387 (= res!115908 (contains!1674 lt!119528 (_1!2335 (ite (or c!39339 c!39337) (tuple2!4649 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4230 thiss!1504)) (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504))))))))

(declare-fun lt!119529 () List!3553)

(assert (=> d!59387 (= lt!119528 (ListLongMap!3562 lt!119529))))

(declare-fun lt!119526 () Unit!7272)

(declare-fun lt!119527 () Unit!7272)

(assert (=> d!59387 (= lt!119526 lt!119527)))

(assert (=> d!59387 (= (getValueByKey!271 lt!119529 (_1!2335 (ite (or c!39339 c!39337) (tuple2!4649 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4230 thiss!1504)) (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504))))) (Some!276 (_2!2335 (ite (or c!39339 c!39337) (tuple2!4649 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4230 thiss!1504)) (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504))))))))

(assert (=> d!59387 (= lt!119527 (lemmaContainsTupThenGetReturnValue!151 lt!119529 (_1!2335 (ite (or c!39339 c!39337) (tuple2!4649 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4230 thiss!1504)) (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504)))) (_2!2335 (ite (or c!39339 c!39337) (tuple2!4649 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4230 thiss!1504)) (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504))))))))

(assert (=> d!59387 (= lt!119529 (insertStrictlySorted!154 (toList!1796 (ite c!39339 call!21967 (ite c!39337 call!21969 call!21970))) (_1!2335 (ite (or c!39339 c!39337) (tuple2!4649 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4230 thiss!1504)) (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504)))) (_2!2335 (ite (or c!39339 c!39337) (tuple2!4649 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4230 thiss!1504)) (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504))))))))

(assert (=> d!59387 (= (+!640 (ite c!39339 call!21967 (ite c!39337 call!21969 call!21970)) (ite (or c!39339 c!39337) (tuple2!4649 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4230 thiss!1504)) (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504)))) lt!119528)))

(declare-fun b!236349 () Bool)

(declare-fun res!115907 () Bool)

(assert (=> b!236349 (=> (not res!115907) (not e!153494))))

(assert (=> b!236349 (= res!115907 (= (getValueByKey!271 (toList!1796 lt!119528) (_1!2335 (ite (or c!39339 c!39337) (tuple2!4649 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4230 thiss!1504)) (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504))))) (Some!276 (_2!2335 (ite (or c!39339 c!39337) (tuple2!4649 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4230 thiss!1504)) (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504)))))))))

(declare-fun b!236350 () Bool)

(assert (=> b!236350 (= e!153494 (contains!1676 (toList!1796 lt!119528) (ite (or c!39339 c!39337) (tuple2!4649 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4230 thiss!1504)) (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504)))))))

(assert (= (and d!59387 res!115908) b!236349))

(assert (= (and b!236349 res!115907) b!236350))

(declare-fun m!257279 () Bool)

(assert (=> d!59387 m!257279))

(declare-fun m!257281 () Bool)

(assert (=> d!59387 m!257281))

(declare-fun m!257283 () Bool)

(assert (=> d!59387 m!257283))

(declare-fun m!257285 () Bool)

(assert (=> d!59387 m!257285))

(declare-fun m!257287 () Bool)

(assert (=> b!236349 m!257287))

(declare-fun m!257289 () Bool)

(assert (=> b!236350 m!257289))

(assert (=> bm!21964 d!59387))

(declare-fun d!59389 () Bool)

(declare-fun isEmpty!513 (Option!277) Bool)

(assert (=> d!59389 (= (isDefined!212 (getValueByKey!271 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))) key!932)) (not (isEmpty!513 (getValueByKey!271 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))) key!932))))))

(declare-fun bs!8734 () Bool)

(assert (= bs!8734 d!59389))

(assert (=> bs!8734 m!257089))

(declare-fun m!257291 () Bool)

(assert (=> bs!8734 m!257291))

(assert (=> b!236202 d!59389))

(declare-fun b!236362 () Bool)

(declare-fun e!153500 () Option!277)

(assert (=> b!236362 (= e!153500 None!275)))

(declare-fun b!236360 () Bool)

(declare-fun e!153499 () Option!277)

(assert (=> b!236360 (= e!153499 e!153500)))

(declare-fun c!39360 () Bool)

(assert (=> b!236360 (= c!39360 (and ((_ is Cons!3549) (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)))) (not (= (_1!2335 (h!4201 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))))) key!932))))))

(declare-fun b!236361 () Bool)

(assert (=> b!236361 (= e!153500 (getValueByKey!271 (t!8532 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)))) key!932))))

(declare-fun b!236359 () Bool)

(assert (=> b!236359 (= e!153499 (Some!276 (_2!2335 (h!4201 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)))))))))

(declare-fun d!59391 () Bool)

(declare-fun c!39359 () Bool)

(assert (=> d!59391 (= c!39359 (and ((_ is Cons!3549) (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)))) (= (_1!2335 (h!4201 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))))) key!932)))))

(assert (=> d!59391 (= (getValueByKey!271 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))) key!932) e!153499)))

(assert (= (and d!59391 c!39359) b!236359))

(assert (= (and d!59391 (not c!39359)) b!236360))

(assert (= (and b!236360 c!39360) b!236361))

(assert (= (and b!236360 (not c!39360)) b!236362))

(declare-fun m!257293 () Bool)

(assert (=> b!236361 m!257293))

(assert (=> b!236202 d!59391))

(declare-fun d!59393 () Bool)

(assert (=> d!59393 (= (apply!213 lt!119455 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)) (get!2857 (getValueByKey!271 (toList!1796 lt!119455) (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8735 () Bool)

(assert (= bs!8735 d!59393))

(assert (=> bs!8735 m!257097))

(declare-fun m!257295 () Bool)

(assert (=> bs!8735 m!257295))

(assert (=> bs!8735 m!257295))

(declare-fun m!257297 () Bool)

(assert (=> bs!8735 m!257297))

(assert (=> b!236261 d!59393))

(declare-fun d!59395 () Bool)

(declare-fun c!39363 () Bool)

(assert (=> d!59395 (= c!39363 ((_ is ValueCellFull!2766) (select (arr!5560 (_values!4372 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!153503 () V!7939)

(assert (=> d!59395 (= (get!2856 (select (arr!5560 (_values!4372 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!556 (defaultEntry!4389 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!153503)))

(declare-fun b!236367 () Bool)

(declare-fun get!2858 (ValueCell!2766 V!7939) V!7939)

(assert (=> b!236367 (= e!153503 (get!2858 (select (arr!5560 (_values!4372 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!556 (defaultEntry!4389 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236368 () Bool)

(declare-fun get!2859 (ValueCell!2766 V!7939) V!7939)

(assert (=> b!236368 (= e!153503 (get!2859 (select (arr!5560 (_values!4372 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!556 (defaultEntry!4389 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59395 c!39363) b!236367))

(assert (= (and d!59395 (not c!39363)) b!236368))

(assert (=> b!236367 m!257137))

(assert (=> b!236367 m!257139))

(declare-fun m!257299 () Bool)

(assert (=> b!236367 m!257299))

(assert (=> b!236368 m!257137))

(assert (=> b!236368 m!257139))

(declare-fun m!257301 () Bool)

(assert (=> b!236368 m!257301))

(assert (=> b!236261 d!59395))

(assert (=> d!59345 d!59347))

(declare-fun b!236387 () Bool)

(declare-fun e!153514 () SeekEntryResult!1000)

(declare-fun e!153516 () SeekEntryResult!1000)

(assert (=> b!236387 (= e!153514 e!153516)))

(declare-fun c!39372 () Bool)

(declare-fun lt!119535 () (_ BitVec 64))

(assert (=> b!236387 (= c!39372 (or (= lt!119535 key!932) (= (bvadd lt!119535 lt!119535) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236388 () Bool)

(declare-fun lt!119534 () SeekEntryResult!1000)

(assert (=> b!236388 (and (bvsge (index!6172 lt!119534) #b00000000000000000000000000000000) (bvslt (index!6172 lt!119534) (size!5898 (_keys!6468 thiss!1504))))))

(declare-fun res!115916 () Bool)

(assert (=> b!236388 (= res!115916 (= (select (arr!5561 (_keys!6468 thiss!1504)) (index!6172 lt!119534)) key!932))))

(declare-fun e!153518 () Bool)

(assert (=> b!236388 (=> res!115916 e!153518)))

(declare-fun e!153515 () Bool)

(assert (=> b!236388 (= e!153515 e!153518)))

(declare-fun b!236389 () Bool)

(assert (=> b!236389 (and (bvsge (index!6172 lt!119534) #b00000000000000000000000000000000) (bvslt (index!6172 lt!119534) (size!5898 (_keys!6468 thiss!1504))))))

(assert (=> b!236389 (= e!153518 (= (select (arr!5561 (_keys!6468 thiss!1504)) (index!6172 lt!119534)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236390 () Bool)

(declare-fun e!153517 () Bool)

(assert (=> b!236390 (= e!153517 e!153515)))

(declare-fun res!115917 () Bool)

(assert (=> b!236390 (= res!115917 (and ((_ is Intermediate!1000) lt!119534) (not (undefined!1812 lt!119534)) (bvslt (x!23856 lt!119534) #b01111111111111111111111111111110) (bvsge (x!23856 lt!119534) #b00000000000000000000000000000000) (bvsge (x!23856 lt!119534) #b00000000000000000000000000000000)))))

(assert (=> b!236390 (=> (not res!115917) (not e!153515))))

(declare-fun b!236391 () Bool)

(assert (=> b!236391 (= e!153517 (bvsge (x!23856 lt!119534) #b01111111111111111111111111111110))))

(declare-fun b!236392 () Bool)

(assert (=> b!236392 (= e!153516 (Intermediate!1000 false (toIndex!0 key!932 (mask!10374 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!236393 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!236393 (= e!153516 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10374 thiss!1504)) #b00000000000000000000000000000000 (mask!10374 thiss!1504)) key!932 (_keys!6468 thiss!1504) (mask!10374 thiss!1504)))))

(declare-fun d!59397 () Bool)

(assert (=> d!59397 e!153517))

(declare-fun c!39370 () Bool)

(assert (=> d!59397 (= c!39370 (and ((_ is Intermediate!1000) lt!119534) (undefined!1812 lt!119534)))))

(assert (=> d!59397 (= lt!119534 e!153514)))

(declare-fun c!39371 () Bool)

(assert (=> d!59397 (= c!39371 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!59397 (= lt!119535 (select (arr!5561 (_keys!6468 thiss!1504)) (toIndex!0 key!932 (mask!10374 thiss!1504))))))

(assert (=> d!59397 (validMask!0 (mask!10374 thiss!1504))))

(assert (=> d!59397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10374 thiss!1504)) key!932 (_keys!6468 thiss!1504) (mask!10374 thiss!1504)) lt!119534)))

(declare-fun b!236394 () Bool)

(assert (=> b!236394 (= e!153514 (Intermediate!1000 true (toIndex!0 key!932 (mask!10374 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!236395 () Bool)

(assert (=> b!236395 (and (bvsge (index!6172 lt!119534) #b00000000000000000000000000000000) (bvslt (index!6172 lt!119534) (size!5898 (_keys!6468 thiss!1504))))))

(declare-fun res!115915 () Bool)

(assert (=> b!236395 (= res!115915 (= (select (arr!5561 (_keys!6468 thiss!1504)) (index!6172 lt!119534)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236395 (=> res!115915 e!153518)))

(assert (= (and d!59397 c!39371) b!236394))

(assert (= (and d!59397 (not c!39371)) b!236387))

(assert (= (and b!236387 c!39372) b!236392))

(assert (= (and b!236387 (not c!39372)) b!236393))

(assert (= (and d!59397 c!39370) b!236391))

(assert (= (and d!59397 (not c!39370)) b!236390))

(assert (= (and b!236390 res!115917) b!236388))

(assert (= (and b!236388 (not res!115916)) b!236395))

(assert (= (and b!236395 (not res!115915)) b!236389))

(assert (=> b!236393 m!257067))

(declare-fun m!257303 () Bool)

(assert (=> b!236393 m!257303))

(assert (=> b!236393 m!257303))

(declare-fun m!257305 () Bool)

(assert (=> b!236393 m!257305))

(declare-fun m!257307 () Bool)

(assert (=> b!236388 m!257307))

(assert (=> d!59397 m!257067))

(declare-fun m!257309 () Bool)

(assert (=> d!59397 m!257309))

(assert (=> d!59397 m!257045))

(assert (=> b!236395 m!257307))

(assert (=> b!236389 m!257307))

(assert (=> d!59335 d!59397))

(declare-fun d!59399 () Bool)

(declare-fun lt!119541 () (_ BitVec 32))

(declare-fun lt!119540 () (_ BitVec 32))

(assert (=> d!59399 (= lt!119541 (bvmul (bvxor lt!119540 (bvlshr lt!119540 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59399 (= lt!119540 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59399 (and (bvsge (mask!10374 thiss!1504) #b00000000000000000000000000000000) (let ((res!115918 (let ((h!4204 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23873 (bvmul (bvxor h!4204 (bvlshr h!4204 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23873 (bvlshr x!23873 #b00000000000000000000000000001101)) (mask!10374 thiss!1504)))))) (and (bvslt res!115918 (bvadd (mask!10374 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!115918 #b00000000000000000000000000000000))))))

(assert (=> d!59399 (= (toIndex!0 key!932 (mask!10374 thiss!1504)) (bvand (bvxor lt!119541 (bvlshr lt!119541 #b00000000000000000000000000001101)) (mask!10374 thiss!1504)))))

(assert (=> d!59335 d!59399))

(assert (=> d!59335 d!59347))

(declare-fun d!59401 () Bool)

(assert (=> d!59401 (= (apply!213 lt!119455 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2857 (getValueByKey!271 (toList!1796 lt!119455) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8736 () Bool)

(assert (= bs!8736 d!59401))

(declare-fun m!257311 () Bool)

(assert (=> bs!8736 m!257311))

(assert (=> bs!8736 m!257311))

(declare-fun m!257313 () Bool)

(assert (=> bs!8736 m!257313))

(assert (=> b!236260 d!59401))

(declare-fun d!59403 () Bool)

(assert (=> d!59403 (isDefined!212 (getValueByKey!271 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))) key!932))))

(declare-fun lt!119544 () Unit!7272)

(declare-fun choose!1106 (List!3553 (_ BitVec 64)) Unit!7272)

(assert (=> d!59403 (= lt!119544 (choose!1106 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))) key!932))))

(declare-fun e!153521 () Bool)

(assert (=> d!59403 e!153521))

(declare-fun res!115921 () Bool)

(assert (=> d!59403 (=> (not res!115921) (not e!153521))))

(declare-fun isStrictlySorted!363 (List!3553) Bool)

(assert (=> d!59403 (= res!115921 (isStrictlySorted!363 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)))))))

(assert (=> d!59403 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))) key!932) lt!119544)))

(declare-fun b!236398 () Bool)

(assert (=> b!236398 (= e!153521 (containsKey!263 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))) key!932))))

(assert (= (and d!59403 res!115921) b!236398))

(assert (=> d!59403 m!257089))

(assert (=> d!59403 m!257089))

(assert (=> d!59403 m!257091))

(declare-fun m!257315 () Bool)

(assert (=> d!59403 m!257315))

(declare-fun m!257317 () Bool)

(assert (=> d!59403 m!257317))

(assert (=> b!236398 m!257085))

(assert (=> b!236200 d!59403))

(assert (=> b!236200 d!59389))

(assert (=> b!236200 d!59391))

(declare-fun b!236411 () Bool)

(declare-fun e!153529 () SeekEntryResult!1000)

(declare-fun e!153528 () SeekEntryResult!1000)

(assert (=> b!236411 (= e!153529 e!153528)))

(declare-fun c!39380 () Bool)

(declare-fun lt!119549 () (_ BitVec 64))

(assert (=> b!236411 (= c!39380 (= lt!119549 key!932))))

(declare-fun d!59405 () Bool)

(declare-fun lt!119550 () SeekEntryResult!1000)

(assert (=> d!59405 (and (or ((_ is Undefined!1000) lt!119550) (not ((_ is Found!1000) lt!119550)) (and (bvsge (index!6171 lt!119550) #b00000000000000000000000000000000) (bvslt (index!6171 lt!119550) (size!5898 (_keys!6468 thiss!1504))))) (or ((_ is Undefined!1000) lt!119550) ((_ is Found!1000) lt!119550) (not ((_ is MissingVacant!1000) lt!119550)) (not (= (index!6173 lt!119550) (index!6172 lt!119384))) (and (bvsge (index!6173 lt!119550) #b00000000000000000000000000000000) (bvslt (index!6173 lt!119550) (size!5898 (_keys!6468 thiss!1504))))) (or ((_ is Undefined!1000) lt!119550) (ite ((_ is Found!1000) lt!119550) (= (select (arr!5561 (_keys!6468 thiss!1504)) (index!6171 lt!119550)) key!932) (and ((_ is MissingVacant!1000) lt!119550) (= (index!6173 lt!119550) (index!6172 lt!119384)) (= (select (arr!5561 (_keys!6468 thiss!1504)) (index!6173 lt!119550)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59405 (= lt!119550 e!153529)))

(declare-fun c!39381 () Bool)

(assert (=> d!59405 (= c!39381 (bvsge (x!23856 lt!119384) #b01111111111111111111111111111110))))

(assert (=> d!59405 (= lt!119549 (select (arr!5561 (_keys!6468 thiss!1504)) (index!6172 lt!119384)))))

(assert (=> d!59405 (validMask!0 (mask!10374 thiss!1504))))

(assert (=> d!59405 (= (seekKeyOrZeroReturnVacant!0 (x!23856 lt!119384) (index!6172 lt!119384) (index!6172 lt!119384) key!932 (_keys!6468 thiss!1504) (mask!10374 thiss!1504)) lt!119550)))

(declare-fun b!236412 () Bool)

(declare-fun e!153530 () SeekEntryResult!1000)

(assert (=> b!236412 (= e!153530 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23856 lt!119384) #b00000000000000000000000000000001) (nextIndex!0 (index!6172 lt!119384) (x!23856 lt!119384) (mask!10374 thiss!1504)) (index!6172 lt!119384) key!932 (_keys!6468 thiss!1504) (mask!10374 thiss!1504)))))

(declare-fun b!236413 () Bool)

(assert (=> b!236413 (= e!153528 (Found!1000 (index!6172 lt!119384)))))

(declare-fun b!236414 () Bool)

(assert (=> b!236414 (= e!153530 (MissingVacant!1000 (index!6172 lt!119384)))))

(declare-fun b!236415 () Bool)

(assert (=> b!236415 (= e!153529 Undefined!1000)))

(declare-fun b!236416 () Bool)

(declare-fun c!39379 () Bool)

(assert (=> b!236416 (= c!39379 (= lt!119549 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236416 (= e!153528 e!153530)))

(assert (= (and d!59405 c!39381) b!236415))

(assert (= (and d!59405 (not c!39381)) b!236411))

(assert (= (and b!236411 c!39380) b!236413))

(assert (= (and b!236411 (not c!39380)) b!236416))

(assert (= (and b!236416 c!39379) b!236414))

(assert (= (and b!236416 (not c!39379)) b!236412))

(declare-fun m!257319 () Bool)

(assert (=> d!59405 m!257319))

(declare-fun m!257321 () Bool)

(assert (=> d!59405 m!257321))

(assert (=> d!59405 m!257063))

(assert (=> d!59405 m!257045))

(declare-fun m!257323 () Bool)

(assert (=> b!236412 m!257323))

(assert (=> b!236412 m!257323))

(declare-fun m!257325 () Bool)

(assert (=> b!236412 m!257325))

(assert (=> b!236183 d!59405))

(assert (=> b!236265 d!59385))

(declare-fun d!59407 () Bool)

(assert (=> d!59407 (= (apply!213 lt!119455 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2857 (getValueByKey!271 (toList!1796 lt!119455) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8737 () Bool)

(assert (= bs!8737 d!59407))

(assert (=> bs!8737 m!257275))

(assert (=> bs!8737 m!257275))

(declare-fun m!257327 () Bool)

(assert (=> bs!8737 m!257327))

(assert (=> b!236259 d!59407))

(declare-fun d!59409 () Bool)

(declare-fun e!153531 () Bool)

(assert (=> d!59409 e!153531))

(declare-fun res!115923 () Bool)

(assert (=> d!59409 (=> (not res!115923) (not e!153531))))

(declare-fun lt!119553 () ListLongMap!3561)

(assert (=> d!59409 (= res!115923 (contains!1674 lt!119553 (_1!2335 (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504)))))))

(declare-fun lt!119554 () List!3553)

(assert (=> d!59409 (= lt!119553 (ListLongMap!3562 lt!119554))))

(declare-fun lt!119551 () Unit!7272)

(declare-fun lt!119552 () Unit!7272)

(assert (=> d!59409 (= lt!119551 lt!119552)))

(assert (=> d!59409 (= (getValueByKey!271 lt!119554 (_1!2335 (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504)))) (Some!276 (_2!2335 (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504)))))))

(assert (=> d!59409 (= lt!119552 (lemmaContainsTupThenGetReturnValue!151 lt!119554 (_1!2335 (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504))) (_2!2335 (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504)))))))

(assert (=> d!59409 (= lt!119554 (insertStrictlySorted!154 (toList!1796 call!21971) (_1!2335 (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504))) (_2!2335 (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504)))))))

(assert (=> d!59409 (= (+!640 call!21971 (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504))) lt!119553)))

(declare-fun b!236417 () Bool)

(declare-fun res!115922 () Bool)

(assert (=> b!236417 (=> (not res!115922) (not e!153531))))

(assert (=> b!236417 (= res!115922 (= (getValueByKey!271 (toList!1796 lt!119553) (_1!2335 (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504)))) (Some!276 (_2!2335 (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504))))))))

(declare-fun b!236418 () Bool)

(assert (=> b!236418 (= e!153531 (contains!1676 (toList!1796 lt!119553) (tuple2!4649 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4230 thiss!1504))))))

(assert (= (and d!59409 res!115923) b!236417))

(assert (= (and b!236417 res!115922) b!236418))

(declare-fun m!257329 () Bool)

(assert (=> d!59409 m!257329))

(declare-fun m!257331 () Bool)

(assert (=> d!59409 m!257331))

(declare-fun m!257333 () Bool)

(assert (=> d!59409 m!257333))

(declare-fun m!257335 () Bool)

(assert (=> d!59409 m!257335))

(declare-fun m!257337 () Bool)

(assert (=> b!236417 m!257337))

(declare-fun m!257339 () Bool)

(assert (=> b!236418 m!257339))

(assert (=> b!236258 d!59409))

(declare-fun d!59411 () Bool)

(declare-fun e!153532 () Bool)

(assert (=> d!59411 e!153532))

(declare-fun res!115924 () Bool)

(assert (=> d!59411 (=> res!115924 e!153532)))

(declare-fun lt!119555 () Bool)

(assert (=> d!59411 (= res!115924 (not lt!119555))))

(declare-fun lt!119556 () Bool)

(assert (=> d!59411 (= lt!119555 lt!119556)))

(declare-fun lt!119558 () Unit!7272)

(declare-fun e!153533 () Unit!7272)

(assert (=> d!59411 (= lt!119558 e!153533)))

(declare-fun c!39382 () Bool)

(assert (=> d!59411 (= c!39382 lt!119556)))

(assert (=> d!59411 (= lt!119556 (containsKey!263 (toList!1796 lt!119455) (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59411 (= (contains!1674 lt!119455 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)) lt!119555)))

(declare-fun b!236419 () Bool)

(declare-fun lt!119557 () Unit!7272)

(assert (=> b!236419 (= e!153533 lt!119557)))

(assert (=> b!236419 (= lt!119557 (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1796 lt!119455) (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236419 (isDefined!212 (getValueByKey!271 (toList!1796 lt!119455) (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236420 () Bool)

(declare-fun Unit!7278 () Unit!7272)

(assert (=> b!236420 (= e!153533 Unit!7278)))

(declare-fun b!236421 () Bool)

(assert (=> b!236421 (= e!153532 (isDefined!212 (getValueByKey!271 (toList!1796 lt!119455) (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59411 c!39382) b!236419))

(assert (= (and d!59411 (not c!39382)) b!236420))

(assert (= (and d!59411 (not res!115924)) b!236421))

(assert (=> d!59411 m!257097))

(declare-fun m!257341 () Bool)

(assert (=> d!59411 m!257341))

(assert (=> b!236419 m!257097))

(declare-fun m!257343 () Bool)

(assert (=> b!236419 m!257343))

(assert (=> b!236419 m!257097))

(assert (=> b!236419 m!257295))

(assert (=> b!236419 m!257295))

(declare-fun m!257345 () Bool)

(assert (=> b!236419 m!257345))

(assert (=> b!236421 m!257097))

(assert (=> b!236421 m!257295))

(assert (=> b!236421 m!257295))

(assert (=> b!236421 m!257345))

(assert (=> b!236248 d!59411))

(assert (=> bm!21968 d!59361))

(declare-fun b!236433 () Bool)

(declare-fun e!153543 () Bool)

(declare-fun contains!1677 (List!3555 (_ BitVec 64)) Bool)

(assert (=> b!236433 (= e!153543 (contains!1677 Nil!3552 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236434 () Bool)

(declare-fun e!153542 () Bool)

(declare-fun call!21978 () Bool)

(assert (=> b!236434 (= e!153542 call!21978)))

(declare-fun b!236435 () Bool)

(declare-fun e!153544 () Bool)

(declare-fun e!153545 () Bool)

(assert (=> b!236435 (= e!153544 e!153545)))

(declare-fun res!115932 () Bool)

(assert (=> b!236435 (=> (not res!115932) (not e!153545))))

(assert (=> b!236435 (= res!115932 (not e!153543))))

(declare-fun res!115933 () Bool)

(assert (=> b!236435 (=> (not res!115933) (not e!153543))))

(assert (=> b!236435 (= res!115933 (validKeyInArray!0 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236436 () Bool)

(assert (=> b!236436 (= e!153542 call!21978)))

(declare-fun bm!21975 () Bool)

(declare-fun c!39385 () Bool)

(assert (=> bm!21975 (= call!21978 (arrayNoDuplicates!0 (_keys!6468 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39385 (Cons!3551 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000) Nil!3552) Nil!3552)))))

(declare-fun b!236432 () Bool)

(assert (=> b!236432 (= e!153545 e!153542)))

(assert (=> b!236432 (= c!39385 (validKeyInArray!0 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59413 () Bool)

(declare-fun res!115931 () Bool)

(assert (=> d!59413 (=> res!115931 e!153544)))

(assert (=> d!59413 (= res!115931 (bvsge #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))))))

(assert (=> d!59413 (= (arrayNoDuplicates!0 (_keys!6468 thiss!1504) #b00000000000000000000000000000000 Nil!3552) e!153544)))

(assert (= (and d!59413 (not res!115931)) b!236435))

(assert (= (and b!236435 res!115933) b!236433))

(assert (= (and b!236435 res!115932) b!236432))

(assert (= (and b!236432 c!39385) b!236436))

(assert (= (and b!236432 (not c!39385)) b!236434))

(assert (= (or b!236436 b!236434) bm!21975))

(assert (=> b!236433 m!257097))

(assert (=> b!236433 m!257097))

(declare-fun m!257347 () Bool)

(assert (=> b!236433 m!257347))

(assert (=> b!236435 m!257097))

(assert (=> b!236435 m!257097))

(assert (=> b!236435 m!257101))

(assert (=> bm!21975 m!257097))

(declare-fun m!257349 () Bool)

(assert (=> bm!21975 m!257349))

(assert (=> b!236432 m!257097))

(assert (=> b!236432 m!257097))

(assert (=> b!236432 m!257101))

(assert (=> b!236193 d!59413))

(declare-fun d!59415 () Bool)

(declare-fun res!115938 () Bool)

(declare-fun e!153550 () Bool)

(assert (=> d!59415 (=> res!115938 e!153550)))

(assert (=> d!59415 (= res!115938 (and ((_ is Cons!3549) (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)))) (= (_1!2335 (h!4201 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))))) key!932)))))

(assert (=> d!59415 (= (containsKey!263 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))) key!932) e!153550)))

(declare-fun b!236441 () Bool)

(declare-fun e!153551 () Bool)

(assert (=> b!236441 (= e!153550 e!153551)))

(declare-fun res!115939 () Bool)

(assert (=> b!236441 (=> (not res!115939) (not e!153551))))

(assert (=> b!236441 (= res!115939 (and (or (not ((_ is Cons!3549) (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))))) (bvsle (_1!2335 (h!4201 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))))) key!932)) ((_ is Cons!3549) (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)))) (bvslt (_1!2335 (h!4201 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504))))) key!932)))))

(declare-fun b!236442 () Bool)

(assert (=> b!236442 (= e!153551 (containsKey!263 (t!8532 (toList!1796 (getCurrentListMap!1324 (_keys!6468 thiss!1504) (_values!4372 thiss!1504) (mask!10374 thiss!1504) (extraKeys!4126 thiss!1504) (zeroValue!4230 thiss!1504) (minValue!4230 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4389 thiss!1504)))) key!932))))

(assert (= (and d!59415 (not res!115938)) b!236441))

(assert (= (and b!236441 res!115939) b!236442))

(declare-fun m!257351 () Bool)

(assert (=> b!236442 m!257351))

(assert (=> d!59343 d!59415))

(declare-fun b!236451 () Bool)

(declare-fun e!153559 () Bool)

(declare-fun e!153558 () Bool)

(assert (=> b!236451 (= e!153559 e!153558)))

(declare-fun c!39388 () Bool)

(assert (=> b!236451 (= c!39388 (validKeyInArray!0 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21978 () Bool)

(declare-fun call!21981 () Bool)

(assert (=> bm!21978 (= call!21981 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6468 thiss!1504) (mask!10374 thiss!1504)))))

(declare-fun b!236452 () Bool)

(declare-fun e!153560 () Bool)

(assert (=> b!236452 (= e!153558 e!153560)))

(declare-fun lt!119567 () (_ BitVec 64))

(assert (=> b!236452 (= lt!119567 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119566 () Unit!7272)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11703 (_ BitVec 64) (_ BitVec 32)) Unit!7272)

(assert (=> b!236452 (= lt!119566 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6468 thiss!1504) lt!119567 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!236452 (arrayContainsKey!0 (_keys!6468 thiss!1504) lt!119567 #b00000000000000000000000000000000)))

(declare-fun lt!119565 () Unit!7272)

(assert (=> b!236452 (= lt!119565 lt!119566)))

(declare-fun res!115944 () Bool)

(assert (=> b!236452 (= res!115944 (= (seekEntryOrOpen!0 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000) (_keys!6468 thiss!1504) (mask!10374 thiss!1504)) (Found!1000 #b00000000000000000000000000000000)))))

(assert (=> b!236452 (=> (not res!115944) (not e!153560))))

(declare-fun d!59417 () Bool)

(declare-fun res!115945 () Bool)

(assert (=> d!59417 (=> res!115945 e!153559)))

(assert (=> d!59417 (= res!115945 (bvsge #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))))))

(assert (=> d!59417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6468 thiss!1504) (mask!10374 thiss!1504)) e!153559)))

(declare-fun b!236453 () Bool)

(assert (=> b!236453 (= e!153558 call!21981)))

(declare-fun b!236454 () Bool)

(assert (=> b!236454 (= e!153560 call!21981)))

(assert (= (and d!59417 (not res!115945)) b!236451))

(assert (= (and b!236451 c!39388) b!236452))

(assert (= (and b!236451 (not c!39388)) b!236453))

(assert (= (and b!236452 res!115944) b!236454))

(assert (= (or b!236454 b!236453) bm!21978))

(assert (=> b!236451 m!257097))

(assert (=> b!236451 m!257097))

(assert (=> b!236451 m!257101))

(declare-fun m!257353 () Bool)

(assert (=> bm!21978 m!257353))

(assert (=> b!236452 m!257097))

(declare-fun m!257355 () Bool)

(assert (=> b!236452 m!257355))

(declare-fun m!257357 () Bool)

(assert (=> b!236452 m!257357))

(assert (=> b!236452 m!257097))

(declare-fun m!257359 () Bool)

(assert (=> b!236452 m!257359))

(assert (=> b!236192 d!59417))

(declare-fun d!59419 () Bool)

(declare-fun e!153561 () Bool)

(assert (=> d!59419 e!153561))

(declare-fun res!115946 () Bool)

(assert (=> d!59419 (=> res!115946 e!153561)))

(declare-fun lt!119568 () Bool)

(assert (=> d!59419 (= res!115946 (not lt!119568))))

(declare-fun lt!119569 () Bool)

(assert (=> d!59419 (= lt!119568 lt!119569)))

(declare-fun lt!119571 () Unit!7272)

(declare-fun e!153562 () Unit!7272)

(assert (=> d!59419 (= lt!119571 e!153562)))

(declare-fun c!39389 () Bool)

(assert (=> d!59419 (= c!39389 lt!119569)))

(assert (=> d!59419 (= lt!119569 (containsKey!263 (toList!1796 lt!119455) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59419 (= (contains!1674 lt!119455 #b1000000000000000000000000000000000000000000000000000000000000000) lt!119568)))

(declare-fun b!236455 () Bool)

(declare-fun lt!119570 () Unit!7272)

(assert (=> b!236455 (= e!153562 lt!119570)))

(assert (=> b!236455 (= lt!119570 (lemmaContainsKeyImpliesGetValueByKeyDefined!211 (toList!1796 lt!119455) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236455 (isDefined!212 (getValueByKey!271 (toList!1796 lt!119455) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236456 () Bool)

(declare-fun Unit!7279 () Unit!7272)

(assert (=> b!236456 (= e!153562 Unit!7279)))

(declare-fun b!236457 () Bool)

(assert (=> b!236457 (= e!153561 (isDefined!212 (getValueByKey!271 (toList!1796 lt!119455) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59419 c!39389) b!236455))

(assert (= (and d!59419 (not c!39389)) b!236456))

(assert (= (and d!59419 (not res!115946)) b!236457))

(declare-fun m!257361 () Bool)

(assert (=> d!59419 m!257361))

(declare-fun m!257363 () Bool)

(assert (=> b!236455 m!257363))

(assert (=> b!236455 m!257311))

(assert (=> b!236455 m!257311))

(declare-fun m!257365 () Bool)

(assert (=> b!236455 m!257365))

(assert (=> b!236457 m!257311))

(assert (=> b!236457 m!257311))

(assert (=> b!236457 m!257365))

(assert (=> bm!21967 d!59419))

(declare-fun b!236466 () Bool)

(declare-fun e!153567 () (_ BitVec 32))

(assert (=> b!236466 (= e!153567 #b00000000000000000000000000000000)))

(declare-fun b!236467 () Bool)

(declare-fun e!153568 () (_ BitVec 32))

(declare-fun call!21984 () (_ BitVec 32))

(assert (=> b!236467 (= e!153568 (bvadd #b00000000000000000000000000000001 call!21984))))

(declare-fun b!236468 () Bool)

(assert (=> b!236468 (= e!153568 call!21984)))

(declare-fun bm!21981 () Bool)

(assert (=> bm!21981 (= call!21984 (arrayCountValidKeys!0 (_keys!6468 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5898 (_keys!6468 thiss!1504))))))

(declare-fun b!236469 () Bool)

(assert (=> b!236469 (= e!153567 e!153568)))

(declare-fun c!39395 () Bool)

(assert (=> b!236469 (= c!39395 (validKeyInArray!0 (select (arr!5561 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59421 () Bool)

(declare-fun lt!119574 () (_ BitVec 32))

(assert (=> d!59421 (and (bvsge lt!119574 #b00000000000000000000000000000000) (bvsle lt!119574 (bvsub (size!5898 (_keys!6468 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59421 (= lt!119574 e!153567)))

(declare-fun c!39394 () Bool)

(assert (=> d!59421 (= c!39394 (bvsge #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))))))

(assert (=> d!59421 (and (bvsle #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5898 (_keys!6468 thiss!1504)) (size!5898 (_keys!6468 thiss!1504))))))

(assert (=> d!59421 (= (arrayCountValidKeys!0 (_keys!6468 thiss!1504) #b00000000000000000000000000000000 (size!5898 (_keys!6468 thiss!1504))) lt!119574)))

(assert (= (and d!59421 c!39394) b!236466))

(assert (= (and d!59421 (not c!39394)) b!236469))

(assert (= (and b!236469 c!39395) b!236467))

(assert (= (and b!236469 (not c!39395)) b!236468))

(assert (= (or b!236467 b!236468) bm!21981))

(declare-fun m!257367 () Bool)

(assert (=> bm!21981 m!257367))

(assert (=> b!236469 m!257097))

(assert (=> b!236469 m!257097))

(assert (=> b!236469 m!257101))

(assert (=> b!236191 d!59421))

(declare-fun b!236471 () Bool)

(declare-fun e!153570 () Bool)

(assert (=> b!236471 (= e!153570 tp_is_empty!6219)))

(declare-fun mapNonEmpty!10539 () Bool)

(declare-fun mapRes!10539 () Bool)

(declare-fun tp!22257 () Bool)

(declare-fun e!153569 () Bool)

(assert (=> mapNonEmpty!10539 (= mapRes!10539 (and tp!22257 e!153569))))

(declare-fun mapKey!10539 () (_ BitVec 32))

(declare-fun mapRest!10539 () (Array (_ BitVec 32) ValueCell!2766))

(declare-fun mapValue!10539 () ValueCell!2766)

(assert (=> mapNonEmpty!10539 (= mapRest!10538 (store mapRest!10539 mapKey!10539 mapValue!10539))))

(declare-fun condMapEmpty!10539 () Bool)

(declare-fun mapDefault!10539 () ValueCell!2766)

(assert (=> mapNonEmpty!10538 (= condMapEmpty!10539 (= mapRest!10538 ((as const (Array (_ BitVec 32) ValueCell!2766)) mapDefault!10539)))))

(assert (=> mapNonEmpty!10538 (= tp!22256 (and e!153570 mapRes!10539))))

(declare-fun mapIsEmpty!10539 () Bool)

(assert (=> mapIsEmpty!10539 mapRes!10539))

(declare-fun b!236470 () Bool)

(assert (=> b!236470 (= e!153569 tp_is_empty!6219)))

(assert (= (and mapNonEmpty!10538 condMapEmpty!10539) mapIsEmpty!10539))

(assert (= (and mapNonEmpty!10538 (not condMapEmpty!10539)) mapNonEmpty!10539))

(assert (= (and mapNonEmpty!10539 ((_ is ValueCellFull!2766) mapValue!10539)) b!236470))

(assert (= (and mapNonEmpty!10538 ((_ is ValueCellFull!2766) mapDefault!10539)) b!236471))

(declare-fun m!257369 () Bool)

(assert (=> mapNonEmpty!10539 m!257369))

(declare-fun b_lambda!7923 () Bool)

(assert (= b_lambda!7921 (or (and b!236138 b_free!6357) b_lambda!7923)))

(declare-fun b_lambda!7925 () Bool)

(assert (= b_lambda!7919 (or (and b!236138 b_free!6357) b_lambda!7925)))

(check-sat (not d!59349) (not b_lambda!7917) (not b!236346) (not d!59393) (not b_next!6357) (not b!236317) (not b!236433) (not d!59351) (not b!236451) (not b!236285) (not b!236432) (not d!59387) (not d!59381) (not b!236419) (not d!59409) (not b!236393) (not bm!21975) (not b!236367) (not b!236452) (not b!236421) (not b!236329) (not b!236326) (not d!59379) (not b!236412) (not mapNonEmpty!10539) (not b_lambda!7925) (not b!236361) (not d!59355) (not b!236455) (not b!236288) (not b!236331) tp_is_empty!6219 (not b!236469) (not d!59373) (not d!59383) (not b!236349) (not b!236343) (not d!59401) (not b!236328) (not b!236320) (not b!236286) (not b!236348) (not bm!21972) (not d!59353) (not d!59375) (not d!59397) (not b!236398) (not b!236315) (not bm!21981) (not b!236457) (not b!236333) (not d!59365) (not d!59407) (not d!59363) (not d!59361) (not d!59405) (not b!236319) (not b_lambda!7923) (not b!236418) (not b!236327) (not d!59389) (not d!59403) (not b!236435) (not d!59369) (not d!59377) (not b!236322) (not d!59411) (not d!59367) (not d!59357) (not b!236287) (not b!236323) (not b!236344) (not d!59371) (not b!236325) (not d!59359) (not b!236442) (not b!236417) (not b!236368) (not d!59419) (not b!236324) (not b!236350) b_and!13299 (not bm!21978))
(check-sat b_and!13299 (not b_next!6357))
