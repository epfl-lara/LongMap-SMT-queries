; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21552 () Bool)

(assert start!21552)

(declare-fun b!216076 () Bool)

(declare-fun b_free!5737 () Bool)

(declare-fun b_next!5737 () Bool)

(assert (=> b!216076 (= b_free!5737 (not b_next!5737))))

(declare-fun tp!20336 () Bool)

(declare-fun b_and!12641 () Bool)

(assert (=> b!216076 (= tp!20336 b_and!12641)))

(declare-fun b!216071 () Bool)

(declare-fun res!105644 () Bool)

(declare-fun e!140568 () Bool)

(assert (=> b!216071 (=> (not res!105644) (not e!140568))))

(declare-datatypes ((V!7113 0))(
  ( (V!7114 (val!2844 Int)) )
))
(declare-datatypes ((ValueCell!2456 0))(
  ( (ValueCellFull!2456 (v!4863 V!7113)) (EmptyCell!2456) )
))
(declare-datatypes ((array!10429 0))(
  ( (array!10430 (arr!4939 (Array (_ BitVec 32) ValueCell!2456)) (size!5271 (_ BitVec 32))) )
))
(declare-datatypes ((array!10431 0))(
  ( (array!10432 (arr!4940 (Array (_ BitVec 32) (_ BitVec 64))) (size!5272 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2812 0))(
  ( (LongMapFixedSize!2813 (defaultEntry!4056 Int) (mask!9778 (_ BitVec 32)) (extraKeys!3793 (_ BitVec 32)) (zeroValue!3897 V!7113) (minValue!3897 V!7113) (_size!1455 (_ BitVec 32)) (_keys!6099 array!10431) (_values!4039 array!10429) (_vacant!1455 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2812)

(assert (=> b!216071 (= res!105644 (and (= (size!5271 (_values!4039 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9778 thiss!1504))) (= (size!5272 (_keys!6099 thiss!1504)) (size!5271 (_values!4039 thiss!1504))) (bvsge (mask!9778 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3793 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3793 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216072 () Bool)

(declare-fun e!140569 () Bool)

(declare-fun e!140572 () Bool)

(declare-fun mapRes!9552 () Bool)

(assert (=> b!216072 (= e!140569 (and e!140572 mapRes!9552))))

(declare-fun condMapEmpty!9552 () Bool)

(declare-fun mapDefault!9552 () ValueCell!2456)

(assert (=> b!216072 (= condMapEmpty!9552 (= (arr!4939 (_values!4039 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2456)) mapDefault!9552)))))

(declare-fun b!216073 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10431 (_ BitVec 32)) Bool)

(assert (=> b!216073 (= e!140568 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6099 thiss!1504) (mask!9778 thiss!1504))))))

(declare-fun mapIsEmpty!9552 () Bool)

(assert (=> mapIsEmpty!9552 mapRes!9552))

(declare-fun b!216074 () Bool)

(declare-fun res!105647 () Bool)

(assert (=> b!216074 (=> (not res!105647) (not e!140568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216074 (= res!105647 (validMask!0 (mask!9778 thiss!1504)))))

(declare-fun b!216075 () Bool)

(declare-fun res!105648 () Bool)

(declare-fun e!140570 () Bool)

(assert (=> b!216075 (=> (not res!105648) (not e!140570))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!216075 (= res!105648 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!140566 () Bool)

(declare-fun tp_is_empty!5599 () Bool)

(declare-fun array_inv!3247 (array!10431) Bool)

(declare-fun array_inv!3248 (array!10429) Bool)

(assert (=> b!216076 (= e!140566 (and tp!20336 tp_is_empty!5599 (array_inv!3247 (_keys!6099 thiss!1504)) (array_inv!3248 (_values!4039 thiss!1504)) e!140569))))

(declare-fun b!216077 () Bool)

(assert (=> b!216077 (= e!140572 tp_is_empty!5599)))

(declare-fun mapNonEmpty!9552 () Bool)

(declare-fun tp!20337 () Bool)

(declare-fun e!140567 () Bool)

(assert (=> mapNonEmpty!9552 (= mapRes!9552 (and tp!20337 e!140567))))

(declare-fun mapRest!9552 () (Array (_ BitVec 32) ValueCell!2456))

(declare-fun mapValue!9552 () ValueCell!2456)

(declare-fun mapKey!9552 () (_ BitVec 32))

(assert (=> mapNonEmpty!9552 (= (arr!4939 (_values!4039 thiss!1504)) (store mapRest!9552 mapKey!9552 mapValue!9552))))

(declare-fun res!105646 () Bool)

(assert (=> start!21552 (=> (not res!105646) (not e!140570))))

(declare-fun valid!1165 (LongMapFixedSize!2812) Bool)

(assert (=> start!21552 (= res!105646 (valid!1165 thiss!1504))))

(assert (=> start!21552 e!140570))

(assert (=> start!21552 e!140566))

(assert (=> start!21552 true))

(declare-fun b!216078 () Bool)

(assert (=> b!216078 (= e!140570 e!140568)))

(declare-fun res!105645 () Bool)

(assert (=> b!216078 (=> (not res!105645) (not e!140568))))

(declare-datatypes ((SeekEntryResult!727 0))(
  ( (MissingZero!727 (index!5078 (_ BitVec 32))) (Found!727 (index!5079 (_ BitVec 32))) (Intermediate!727 (undefined!1539 Bool) (index!5080 (_ BitVec 32)) (x!22575 (_ BitVec 32))) (Undefined!727) (MissingVacant!727 (index!5081 (_ BitVec 32))) )
))
(declare-fun lt!111146 () SeekEntryResult!727)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216078 (= res!105645 (or (= lt!111146 (MissingZero!727 index!297)) (= lt!111146 (MissingVacant!727 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10431 (_ BitVec 32)) SeekEntryResult!727)

(assert (=> b!216078 (= lt!111146 (seekEntryOrOpen!0 key!932 (_keys!6099 thiss!1504) (mask!9778 thiss!1504)))))

(declare-fun b!216079 () Bool)

(assert (=> b!216079 (= e!140567 tp_is_empty!5599)))

(assert (= (and start!21552 res!105646) b!216075))

(assert (= (and b!216075 res!105648) b!216078))

(assert (= (and b!216078 res!105645) b!216074))

(assert (= (and b!216074 res!105647) b!216071))

(assert (= (and b!216071 res!105644) b!216073))

(assert (= (and b!216072 condMapEmpty!9552) mapIsEmpty!9552))

(assert (= (and b!216072 (not condMapEmpty!9552)) mapNonEmpty!9552))

(get-info :version)

(assert (= (and mapNonEmpty!9552 ((_ is ValueCellFull!2456) mapValue!9552)) b!216079))

(assert (= (and b!216072 ((_ is ValueCellFull!2456) mapDefault!9552)) b!216077))

(assert (= b!216076 b!216072))

(assert (= start!21552 b!216076))

(declare-fun m!243107 () Bool)

(assert (=> b!216073 m!243107))

(declare-fun m!243109 () Bool)

(assert (=> b!216078 m!243109))

(declare-fun m!243111 () Bool)

(assert (=> mapNonEmpty!9552 m!243111))

(declare-fun m!243113 () Bool)

(assert (=> start!21552 m!243113))

(declare-fun m!243115 () Bool)

(assert (=> b!216076 m!243115))

(declare-fun m!243117 () Bool)

(assert (=> b!216076 m!243117))

(declare-fun m!243119 () Bool)

(assert (=> b!216074 m!243119))

(check-sat (not b_next!5737) b_and!12641 (not b!216078) (not b!216074) (not b!216076) tp_is_empty!5599 (not b!216073) (not mapNonEmpty!9552) (not start!21552))
(check-sat b_and!12641 (not b_next!5737))
(get-model)

(declare-fun d!58585 () Bool)

(assert (=> d!58585 (= (validMask!0 (mask!9778 thiss!1504)) (and (or (= (mask!9778 thiss!1504) #b00000000000000000000000000000111) (= (mask!9778 thiss!1504) #b00000000000000000000000000001111) (= (mask!9778 thiss!1504) #b00000000000000000000000000011111) (= (mask!9778 thiss!1504) #b00000000000000000000000000111111) (= (mask!9778 thiss!1504) #b00000000000000000000000001111111) (= (mask!9778 thiss!1504) #b00000000000000000000000011111111) (= (mask!9778 thiss!1504) #b00000000000000000000000111111111) (= (mask!9778 thiss!1504) #b00000000000000000000001111111111) (= (mask!9778 thiss!1504) #b00000000000000000000011111111111) (= (mask!9778 thiss!1504) #b00000000000000000000111111111111) (= (mask!9778 thiss!1504) #b00000000000000000001111111111111) (= (mask!9778 thiss!1504) #b00000000000000000011111111111111) (= (mask!9778 thiss!1504) #b00000000000000000111111111111111) (= (mask!9778 thiss!1504) #b00000000000000001111111111111111) (= (mask!9778 thiss!1504) #b00000000000000011111111111111111) (= (mask!9778 thiss!1504) #b00000000000000111111111111111111) (= (mask!9778 thiss!1504) #b00000000000001111111111111111111) (= (mask!9778 thiss!1504) #b00000000000011111111111111111111) (= (mask!9778 thiss!1504) #b00000000000111111111111111111111) (= (mask!9778 thiss!1504) #b00000000001111111111111111111111) (= (mask!9778 thiss!1504) #b00000000011111111111111111111111) (= (mask!9778 thiss!1504) #b00000000111111111111111111111111) (= (mask!9778 thiss!1504) #b00000001111111111111111111111111) (= (mask!9778 thiss!1504) #b00000011111111111111111111111111) (= (mask!9778 thiss!1504) #b00000111111111111111111111111111) (= (mask!9778 thiss!1504) #b00001111111111111111111111111111) (= (mask!9778 thiss!1504) #b00011111111111111111111111111111) (= (mask!9778 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9778 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!216074 d!58585))

(declare-fun b!216146 () Bool)

(declare-fun e!140622 () SeekEntryResult!727)

(declare-fun lt!111161 () SeekEntryResult!727)

(assert (=> b!216146 (= e!140622 (MissingZero!727 (index!5080 lt!111161)))))

(declare-fun d!58587 () Bool)

(declare-fun lt!111159 () SeekEntryResult!727)

(assert (=> d!58587 (and (or ((_ is Undefined!727) lt!111159) (not ((_ is Found!727) lt!111159)) (and (bvsge (index!5079 lt!111159) #b00000000000000000000000000000000) (bvslt (index!5079 lt!111159) (size!5272 (_keys!6099 thiss!1504))))) (or ((_ is Undefined!727) lt!111159) ((_ is Found!727) lt!111159) (not ((_ is MissingZero!727) lt!111159)) (and (bvsge (index!5078 lt!111159) #b00000000000000000000000000000000) (bvslt (index!5078 lt!111159) (size!5272 (_keys!6099 thiss!1504))))) (or ((_ is Undefined!727) lt!111159) ((_ is Found!727) lt!111159) ((_ is MissingZero!727) lt!111159) (not ((_ is MissingVacant!727) lt!111159)) (and (bvsge (index!5081 lt!111159) #b00000000000000000000000000000000) (bvslt (index!5081 lt!111159) (size!5272 (_keys!6099 thiss!1504))))) (or ((_ is Undefined!727) lt!111159) (ite ((_ is Found!727) lt!111159) (= (select (arr!4940 (_keys!6099 thiss!1504)) (index!5079 lt!111159)) key!932) (ite ((_ is MissingZero!727) lt!111159) (= (select (arr!4940 (_keys!6099 thiss!1504)) (index!5078 lt!111159)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!727) lt!111159) (= (select (arr!4940 (_keys!6099 thiss!1504)) (index!5081 lt!111159)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!140623 () SeekEntryResult!727)

(assert (=> d!58587 (= lt!111159 e!140623)))

(declare-fun c!36307 () Bool)

(assert (=> d!58587 (= c!36307 (and ((_ is Intermediate!727) lt!111161) (undefined!1539 lt!111161)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10431 (_ BitVec 32)) SeekEntryResult!727)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58587 (= lt!111161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9778 thiss!1504)) key!932 (_keys!6099 thiss!1504) (mask!9778 thiss!1504)))))

(assert (=> d!58587 (validMask!0 (mask!9778 thiss!1504))))

(assert (=> d!58587 (= (seekEntryOrOpen!0 key!932 (_keys!6099 thiss!1504) (mask!9778 thiss!1504)) lt!111159)))

(declare-fun b!216147 () Bool)

(declare-fun e!140621 () SeekEntryResult!727)

(assert (=> b!216147 (= e!140621 (Found!727 (index!5080 lt!111161)))))

(declare-fun b!216148 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10431 (_ BitVec 32)) SeekEntryResult!727)

(assert (=> b!216148 (= e!140622 (seekKeyOrZeroReturnVacant!0 (x!22575 lt!111161) (index!5080 lt!111161) (index!5080 lt!111161) key!932 (_keys!6099 thiss!1504) (mask!9778 thiss!1504)))))

(declare-fun b!216149 () Bool)

(assert (=> b!216149 (= e!140623 Undefined!727)))

(declare-fun b!216150 () Bool)

(declare-fun c!36308 () Bool)

(declare-fun lt!111160 () (_ BitVec 64))

(assert (=> b!216150 (= c!36308 (= lt!111160 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!216150 (= e!140621 e!140622)))

(declare-fun b!216151 () Bool)

(assert (=> b!216151 (= e!140623 e!140621)))

(assert (=> b!216151 (= lt!111160 (select (arr!4940 (_keys!6099 thiss!1504)) (index!5080 lt!111161)))))

(declare-fun c!36309 () Bool)

(assert (=> b!216151 (= c!36309 (= lt!111160 key!932))))

(assert (= (and d!58587 c!36307) b!216149))

(assert (= (and d!58587 (not c!36307)) b!216151))

(assert (= (and b!216151 c!36309) b!216147))

(assert (= (and b!216151 (not c!36309)) b!216150))

(assert (= (and b!216150 c!36308) b!216146))

(assert (= (and b!216150 (not c!36308)) b!216148))

(declare-fun m!243149 () Bool)

(assert (=> d!58587 m!243149))

(assert (=> d!58587 m!243119))

(declare-fun m!243151 () Bool)

(assert (=> d!58587 m!243151))

(declare-fun m!243153 () Bool)

(assert (=> d!58587 m!243153))

(declare-fun m!243155 () Bool)

(assert (=> d!58587 m!243155))

(declare-fun m!243157 () Bool)

(assert (=> d!58587 m!243157))

(assert (=> d!58587 m!243153))

(declare-fun m!243159 () Bool)

(assert (=> b!216148 m!243159))

(declare-fun m!243161 () Bool)

(assert (=> b!216151 m!243161))

(assert (=> b!216078 d!58587))

(declare-fun d!58589 () Bool)

(declare-fun res!105685 () Bool)

(declare-fun e!140626 () Bool)

(assert (=> d!58589 (=> (not res!105685) (not e!140626))))

(declare-fun simpleValid!221 (LongMapFixedSize!2812) Bool)

(assert (=> d!58589 (= res!105685 (simpleValid!221 thiss!1504))))

(assert (=> d!58589 (= (valid!1165 thiss!1504) e!140626)))

(declare-fun b!216158 () Bool)

(declare-fun res!105686 () Bool)

(assert (=> b!216158 (=> (not res!105686) (not e!140626))))

(declare-fun arrayCountValidKeys!0 (array!10431 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!216158 (= res!105686 (= (arrayCountValidKeys!0 (_keys!6099 thiss!1504) #b00000000000000000000000000000000 (size!5272 (_keys!6099 thiss!1504))) (_size!1455 thiss!1504)))))

(declare-fun b!216159 () Bool)

(declare-fun res!105687 () Bool)

(assert (=> b!216159 (=> (not res!105687) (not e!140626))))

(assert (=> b!216159 (= res!105687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6099 thiss!1504) (mask!9778 thiss!1504)))))

(declare-fun b!216160 () Bool)

(declare-datatypes ((List!3075 0))(
  ( (Nil!3072) (Cons!3071 (h!3718 (_ BitVec 64)) (t!8022 List!3075)) )
))
(declare-fun arrayNoDuplicates!0 (array!10431 (_ BitVec 32) List!3075) Bool)

(assert (=> b!216160 (= e!140626 (arrayNoDuplicates!0 (_keys!6099 thiss!1504) #b00000000000000000000000000000000 Nil!3072))))

(assert (= (and d!58589 res!105685) b!216158))

(assert (= (and b!216158 res!105686) b!216159))

(assert (= (and b!216159 res!105687) b!216160))

(declare-fun m!243163 () Bool)

(assert (=> d!58589 m!243163))

(declare-fun m!243165 () Bool)

(assert (=> b!216158 m!243165))

(assert (=> b!216159 m!243107))

(declare-fun m!243167 () Bool)

(assert (=> b!216160 m!243167))

(assert (=> start!21552 d!58589))

(declare-fun bm!20355 () Bool)

(declare-fun call!20358 () Bool)

(assert (=> bm!20355 (= call!20358 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6099 thiss!1504) (mask!9778 thiss!1504)))))

(declare-fun b!216169 () Bool)

(declare-fun e!140635 () Bool)

(assert (=> b!216169 (= e!140635 call!20358)))

(declare-fun b!216170 () Bool)

(declare-fun e!140634 () Bool)

(assert (=> b!216170 (= e!140634 call!20358)))

(declare-fun d!58591 () Bool)

(declare-fun res!105692 () Bool)

(declare-fun e!140633 () Bool)

(assert (=> d!58591 (=> res!105692 e!140633)))

(assert (=> d!58591 (= res!105692 (bvsge #b00000000000000000000000000000000 (size!5272 (_keys!6099 thiss!1504))))))

(assert (=> d!58591 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6099 thiss!1504) (mask!9778 thiss!1504)) e!140633)))

(declare-fun b!216171 () Bool)

(assert (=> b!216171 (= e!140635 e!140634)))

(declare-fun lt!111169 () (_ BitVec 64))

(assert (=> b!216171 (= lt!111169 (select (arr!4940 (_keys!6099 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6488 0))(
  ( (Unit!6489) )
))
(declare-fun lt!111170 () Unit!6488)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10431 (_ BitVec 64) (_ BitVec 32)) Unit!6488)

(assert (=> b!216171 (= lt!111170 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6099 thiss!1504) lt!111169 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!216171 (arrayContainsKey!0 (_keys!6099 thiss!1504) lt!111169 #b00000000000000000000000000000000)))

(declare-fun lt!111168 () Unit!6488)

(assert (=> b!216171 (= lt!111168 lt!111170)))

(declare-fun res!105693 () Bool)

(assert (=> b!216171 (= res!105693 (= (seekEntryOrOpen!0 (select (arr!4940 (_keys!6099 thiss!1504)) #b00000000000000000000000000000000) (_keys!6099 thiss!1504) (mask!9778 thiss!1504)) (Found!727 #b00000000000000000000000000000000)))))

(assert (=> b!216171 (=> (not res!105693) (not e!140634))))

(declare-fun b!216172 () Bool)

(assert (=> b!216172 (= e!140633 e!140635)))

(declare-fun c!36312 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!216172 (= c!36312 (validKeyInArray!0 (select (arr!4940 (_keys!6099 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58591 (not res!105692)) b!216172))

(assert (= (and b!216172 c!36312) b!216171))

(assert (= (and b!216172 (not c!36312)) b!216169))

(assert (= (and b!216171 res!105693) b!216170))

(assert (= (or b!216170 b!216169) bm!20355))

(declare-fun m!243169 () Bool)

(assert (=> bm!20355 m!243169))

(declare-fun m!243171 () Bool)

(assert (=> b!216171 m!243171))

(declare-fun m!243173 () Bool)

(assert (=> b!216171 m!243173))

(declare-fun m!243175 () Bool)

(assert (=> b!216171 m!243175))

(assert (=> b!216171 m!243171))

(declare-fun m!243177 () Bool)

(assert (=> b!216171 m!243177))

(assert (=> b!216172 m!243171))

(assert (=> b!216172 m!243171))

(declare-fun m!243179 () Bool)

(assert (=> b!216172 m!243179))

(assert (=> b!216073 d!58591))

(declare-fun d!58593 () Bool)

(assert (=> d!58593 (= (array_inv!3247 (_keys!6099 thiss!1504)) (bvsge (size!5272 (_keys!6099 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216076 d!58593))

(declare-fun d!58595 () Bool)

(assert (=> d!58595 (= (array_inv!3248 (_values!4039 thiss!1504)) (bvsge (size!5271 (_values!4039 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216076 d!58595))

(declare-fun condMapEmpty!9561 () Bool)

(declare-fun mapDefault!9561 () ValueCell!2456)

(assert (=> mapNonEmpty!9552 (= condMapEmpty!9561 (= mapRest!9552 ((as const (Array (_ BitVec 32) ValueCell!2456)) mapDefault!9561)))))

(declare-fun e!140641 () Bool)

(declare-fun mapRes!9561 () Bool)

(assert (=> mapNonEmpty!9552 (= tp!20337 (and e!140641 mapRes!9561))))

(declare-fun b!216180 () Bool)

(assert (=> b!216180 (= e!140641 tp_is_empty!5599)))

(declare-fun mapIsEmpty!9561 () Bool)

(assert (=> mapIsEmpty!9561 mapRes!9561))

(declare-fun mapNonEmpty!9561 () Bool)

(declare-fun tp!20352 () Bool)

(declare-fun e!140640 () Bool)

(assert (=> mapNonEmpty!9561 (= mapRes!9561 (and tp!20352 e!140640))))

(declare-fun mapValue!9561 () ValueCell!2456)

(declare-fun mapKey!9561 () (_ BitVec 32))

(declare-fun mapRest!9561 () (Array (_ BitVec 32) ValueCell!2456))

(assert (=> mapNonEmpty!9561 (= mapRest!9552 (store mapRest!9561 mapKey!9561 mapValue!9561))))

(declare-fun b!216179 () Bool)

(assert (=> b!216179 (= e!140640 tp_is_empty!5599)))

(assert (= (and mapNonEmpty!9552 condMapEmpty!9561) mapIsEmpty!9561))

(assert (= (and mapNonEmpty!9552 (not condMapEmpty!9561)) mapNonEmpty!9561))

(assert (= (and mapNonEmpty!9561 ((_ is ValueCellFull!2456) mapValue!9561)) b!216179))

(assert (= (and mapNonEmpty!9552 ((_ is ValueCellFull!2456) mapDefault!9561)) b!216180))

(declare-fun m!243181 () Bool)

(assert (=> mapNonEmpty!9561 m!243181))

(check-sat (not b_next!5737) (not b!216158) (not b!216148) (not b!216159) (not b!216171) (not b!216160) tp_is_empty!5599 (not b!216172) (not d!58589) (not bm!20355) (not mapNonEmpty!9561) b_and!12641 (not d!58587))
(check-sat b_and!12641 (not b_next!5737))
