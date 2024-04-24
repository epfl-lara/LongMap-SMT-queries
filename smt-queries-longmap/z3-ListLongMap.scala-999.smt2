; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21570 () Bool)

(assert start!21570)

(declare-fun b!216208 () Bool)

(declare-fun b_free!5743 () Bool)

(declare-fun b_next!5743 () Bool)

(assert (=> b!216208 (= b_free!5743 (not b_next!5743))))

(declare-fun tp!20358 () Bool)

(declare-fun b_and!12647 () Bool)

(assert (=> b!216208 (= tp!20358 b_and!12647)))

(declare-fun b!216201 () Bool)

(declare-fun res!105708 () Bool)

(declare-fun e!140658 () Bool)

(assert (=> b!216201 (=> (not res!105708) (not e!140658))))

(declare-datatypes ((V!7121 0))(
  ( (V!7122 (val!2847 Int)) )
))
(declare-datatypes ((ValueCell!2459 0))(
  ( (ValueCellFull!2459 (v!4866 V!7121)) (EmptyCell!2459) )
))
(declare-datatypes ((array!10443 0))(
  ( (array!10444 (arr!4945 (Array (_ BitVec 32) ValueCell!2459)) (size!5277 (_ BitVec 32))) )
))
(declare-datatypes ((array!10445 0))(
  ( (array!10446 (arr!4946 (Array (_ BitVec 32) (_ BitVec 64))) (size!5278 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2818 0))(
  ( (LongMapFixedSize!2819 (defaultEntry!4059 Int) (mask!9786 (_ BitVec 32)) (extraKeys!3796 (_ BitVec 32)) (zeroValue!3900 V!7121) (minValue!3900 V!7121) (_size!1458 (_ BitVec 32)) (_keys!6104 array!10445) (_values!4042 array!10443) (_vacant!1458 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2818)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10445 (_ BitVec 32)) Bool)

(assert (=> b!216201 (= res!105708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6104 thiss!1504) (mask!9786 thiss!1504)))))

(declare-fun res!105709 () Bool)

(declare-fun e!140657 () Bool)

(assert (=> start!21570 (=> (not res!105709) (not e!140657))))

(declare-fun valid!1166 (LongMapFixedSize!2818) Bool)

(assert (=> start!21570 (= res!105709 (valid!1166 thiss!1504))))

(assert (=> start!21570 e!140657))

(declare-fun e!140660 () Bool)

(assert (=> start!21570 e!140660))

(assert (=> start!21570 true))

(declare-fun mapNonEmpty!9564 () Bool)

(declare-fun mapRes!9564 () Bool)

(declare-fun tp!20357 () Bool)

(declare-fun e!140659 () Bool)

(assert (=> mapNonEmpty!9564 (= mapRes!9564 (and tp!20357 e!140659))))

(declare-fun mapValue!9564 () ValueCell!2459)

(declare-fun mapRest!9564 () (Array (_ BitVec 32) ValueCell!2459))

(declare-fun mapKey!9564 () (_ BitVec 32))

(assert (=> mapNonEmpty!9564 (= (arr!4945 (_values!4042 thiss!1504)) (store mapRest!9564 mapKey!9564 mapValue!9564))))

(declare-fun b!216202 () Bool)

(declare-fun res!105706 () Bool)

(assert (=> b!216202 (=> (not res!105706) (not e!140658))))

(assert (=> b!216202 (= res!105706 (and (= (size!5277 (_values!4042 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9786 thiss!1504))) (= (size!5278 (_keys!6104 thiss!1504)) (size!5277 (_values!4042 thiss!1504))) (bvsge (mask!9786 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3796 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3796 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216203 () Bool)

(declare-fun e!140662 () Bool)

(declare-fun tp_is_empty!5605 () Bool)

(assert (=> b!216203 (= e!140662 tp_is_empty!5605)))

(declare-fun b!216204 () Bool)

(assert (=> b!216204 (= e!140657 e!140658)))

(declare-fun res!105707 () Bool)

(assert (=> b!216204 (=> (not res!105707) (not e!140658))))

(declare-datatypes ((SeekEntryResult!729 0))(
  ( (MissingZero!729 (index!5086 (_ BitVec 32))) (Found!729 (index!5087 (_ BitVec 32))) (Intermediate!729 (undefined!1541 Bool) (index!5088 (_ BitVec 32)) (x!22593 (_ BitVec 32))) (Undefined!729) (MissingVacant!729 (index!5089 (_ BitVec 32))) )
))
(declare-fun lt!111173 () SeekEntryResult!729)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216204 (= res!105707 (or (= lt!111173 (MissingZero!729 index!297)) (= lt!111173 (MissingVacant!729 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10445 (_ BitVec 32)) SeekEntryResult!729)

(assert (=> b!216204 (= lt!111173 (seekEntryOrOpen!0 key!932 (_keys!6104 thiss!1504) (mask!9786 thiss!1504)))))

(declare-fun b!216205 () Bool)

(declare-fun res!105711 () Bool)

(assert (=> b!216205 (=> (not res!105711) (not e!140658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216205 (= res!105711 (validMask!0 (mask!9786 thiss!1504)))))

(declare-fun b!216206 () Bool)

(declare-fun res!105710 () Bool)

(assert (=> b!216206 (=> (not res!105710) (not e!140657))))

(assert (=> b!216206 (= res!105710 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216207 () Bool)

(assert (=> b!216207 (= e!140659 tp_is_empty!5605)))

(declare-fun e!140661 () Bool)

(declare-fun array_inv!3249 (array!10445) Bool)

(declare-fun array_inv!3250 (array!10443) Bool)

(assert (=> b!216208 (= e!140660 (and tp!20358 tp_is_empty!5605 (array_inv!3249 (_keys!6104 thiss!1504)) (array_inv!3250 (_values!4042 thiss!1504)) e!140661))))

(declare-fun mapIsEmpty!9564 () Bool)

(assert (=> mapIsEmpty!9564 mapRes!9564))

(declare-fun b!216209 () Bool)

(declare-datatypes ((List!3076 0))(
  ( (Nil!3073) (Cons!3072 (h!3719 (_ BitVec 64)) (t!8023 List!3076)) )
))
(declare-fun arrayNoDuplicates!0 (array!10445 (_ BitVec 32) List!3076) Bool)

(assert (=> b!216209 (= e!140658 (not (arrayNoDuplicates!0 (_keys!6104 thiss!1504) #b00000000000000000000000000000000 Nil!3073)))))

(declare-fun b!216210 () Bool)

(assert (=> b!216210 (= e!140661 (and e!140662 mapRes!9564))))

(declare-fun condMapEmpty!9564 () Bool)

(declare-fun mapDefault!9564 () ValueCell!2459)

(assert (=> b!216210 (= condMapEmpty!9564 (= (arr!4945 (_values!4042 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2459)) mapDefault!9564)))))

(assert (= (and start!21570 res!105709) b!216206))

(assert (= (and b!216206 res!105710) b!216204))

(assert (= (and b!216204 res!105707) b!216205))

(assert (= (and b!216205 res!105711) b!216202))

(assert (= (and b!216202 res!105706) b!216201))

(assert (= (and b!216201 res!105708) b!216209))

(assert (= (and b!216210 condMapEmpty!9564) mapIsEmpty!9564))

(assert (= (and b!216210 (not condMapEmpty!9564)) mapNonEmpty!9564))

(get-info :version)

(assert (= (and mapNonEmpty!9564 ((_ is ValueCellFull!2459) mapValue!9564)) b!216207))

(assert (= (and b!216210 ((_ is ValueCellFull!2459) mapDefault!9564)) b!216203))

(assert (= b!216208 b!216210))

(assert (= start!21570 b!216208))

(declare-fun m!243183 () Bool)

(assert (=> b!216209 m!243183))

(declare-fun m!243185 () Bool)

(assert (=> b!216205 m!243185))

(declare-fun m!243187 () Bool)

(assert (=> start!21570 m!243187))

(declare-fun m!243189 () Bool)

(assert (=> b!216204 m!243189))

(declare-fun m!243191 () Bool)

(assert (=> b!216208 m!243191))

(declare-fun m!243193 () Bool)

(assert (=> b!216208 m!243193))

(declare-fun m!243195 () Bool)

(assert (=> b!216201 m!243195))

(declare-fun m!243197 () Bool)

(assert (=> mapNonEmpty!9564 m!243197))

(check-sat (not b!216204) (not mapNonEmpty!9564) tp_is_empty!5605 (not b!216201) (not b!216205) (not b!216208) (not start!21570) (not b_next!5743) b_and!12647 (not b!216209))
(check-sat b_and!12647 (not b_next!5743))
(get-model)

(declare-fun bm!20358 () Bool)

(declare-fun call!20361 () Bool)

(assert (=> bm!20358 (= call!20361 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6104 thiss!1504) (mask!9786 thiss!1504)))))

(declare-fun b!216279 () Bool)

(declare-fun e!140713 () Bool)

(assert (=> b!216279 (= e!140713 call!20361)))

(declare-fun b!216280 () Bool)

(declare-fun e!140711 () Bool)

(assert (=> b!216280 (= e!140711 e!140713)))

(declare-fun lt!111188 () (_ BitVec 64))

(assert (=> b!216280 (= lt!111188 (select (arr!4946 (_keys!6104 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6490 0))(
  ( (Unit!6491) )
))
(declare-fun lt!111187 () Unit!6490)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10445 (_ BitVec 64) (_ BitVec 32)) Unit!6490)

(assert (=> b!216280 (= lt!111187 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6104 thiss!1504) lt!111188 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!216280 (arrayContainsKey!0 (_keys!6104 thiss!1504) lt!111188 #b00000000000000000000000000000000)))

(declare-fun lt!111186 () Unit!6490)

(assert (=> b!216280 (= lt!111186 lt!111187)))

(declare-fun res!105752 () Bool)

(assert (=> b!216280 (= res!105752 (= (seekEntryOrOpen!0 (select (arr!4946 (_keys!6104 thiss!1504)) #b00000000000000000000000000000000) (_keys!6104 thiss!1504) (mask!9786 thiss!1504)) (Found!729 #b00000000000000000000000000000000)))))

(assert (=> b!216280 (=> (not res!105752) (not e!140713))))

(declare-fun b!216281 () Bool)

(declare-fun e!140712 () Bool)

(assert (=> b!216281 (= e!140712 e!140711)))

(declare-fun c!36315 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!216281 (= c!36315 (validKeyInArray!0 (select (arr!4946 (_keys!6104 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58599 () Bool)

(declare-fun res!105753 () Bool)

(assert (=> d!58599 (=> res!105753 e!140712)))

(assert (=> d!58599 (= res!105753 (bvsge #b00000000000000000000000000000000 (size!5278 (_keys!6104 thiss!1504))))))

(assert (=> d!58599 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6104 thiss!1504) (mask!9786 thiss!1504)) e!140712)))

(declare-fun b!216282 () Bool)

(assert (=> b!216282 (= e!140711 call!20361)))

(assert (= (and d!58599 (not res!105753)) b!216281))

(assert (= (and b!216281 c!36315) b!216280))

(assert (= (and b!216281 (not c!36315)) b!216282))

(assert (= (and b!216280 res!105752) b!216279))

(assert (= (or b!216279 b!216282) bm!20358))

(declare-fun m!243231 () Bool)

(assert (=> bm!20358 m!243231))

(declare-fun m!243233 () Bool)

(assert (=> b!216280 m!243233))

(declare-fun m!243235 () Bool)

(assert (=> b!216280 m!243235))

(declare-fun m!243237 () Bool)

(assert (=> b!216280 m!243237))

(assert (=> b!216280 m!243233))

(declare-fun m!243239 () Bool)

(assert (=> b!216280 m!243239))

(assert (=> b!216281 m!243233))

(assert (=> b!216281 m!243233))

(declare-fun m!243241 () Bool)

(assert (=> b!216281 m!243241))

(assert (=> b!216201 d!58599))

(declare-fun b!216293 () Bool)

(declare-fun e!140723 () Bool)

(declare-fun contains!1415 (List!3076 (_ BitVec 64)) Bool)

(assert (=> b!216293 (= e!140723 (contains!1415 Nil!3073 (select (arr!4946 (_keys!6104 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!216294 () Bool)

(declare-fun e!140724 () Bool)

(declare-fun call!20364 () Bool)

(assert (=> b!216294 (= e!140724 call!20364)))

(declare-fun b!216295 () Bool)

(assert (=> b!216295 (= e!140724 call!20364)))

(declare-fun d!58601 () Bool)

(declare-fun res!105761 () Bool)

(declare-fun e!140725 () Bool)

(assert (=> d!58601 (=> res!105761 e!140725)))

(assert (=> d!58601 (= res!105761 (bvsge #b00000000000000000000000000000000 (size!5278 (_keys!6104 thiss!1504))))))

(assert (=> d!58601 (= (arrayNoDuplicates!0 (_keys!6104 thiss!1504) #b00000000000000000000000000000000 Nil!3073) e!140725)))

(declare-fun b!216296 () Bool)

(declare-fun e!140722 () Bool)

(assert (=> b!216296 (= e!140725 e!140722)))

(declare-fun res!105762 () Bool)

(assert (=> b!216296 (=> (not res!105762) (not e!140722))))

(assert (=> b!216296 (= res!105762 (not e!140723))))

(declare-fun res!105760 () Bool)

(assert (=> b!216296 (=> (not res!105760) (not e!140723))))

(assert (=> b!216296 (= res!105760 (validKeyInArray!0 (select (arr!4946 (_keys!6104 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!216297 () Bool)

(assert (=> b!216297 (= e!140722 e!140724)))

(declare-fun c!36318 () Bool)

(assert (=> b!216297 (= c!36318 (validKeyInArray!0 (select (arr!4946 (_keys!6104 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20361 () Bool)

(assert (=> bm!20361 (= call!20364 (arrayNoDuplicates!0 (_keys!6104 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36318 (Cons!3072 (select (arr!4946 (_keys!6104 thiss!1504)) #b00000000000000000000000000000000) Nil!3073) Nil!3073)))))

(assert (= (and d!58601 (not res!105761)) b!216296))

(assert (= (and b!216296 res!105760) b!216293))

(assert (= (and b!216296 res!105762) b!216297))

(assert (= (and b!216297 c!36318) b!216295))

(assert (= (and b!216297 (not c!36318)) b!216294))

(assert (= (or b!216295 b!216294) bm!20361))

(assert (=> b!216293 m!243233))

(assert (=> b!216293 m!243233))

(declare-fun m!243243 () Bool)

(assert (=> b!216293 m!243243))

(assert (=> b!216296 m!243233))

(assert (=> b!216296 m!243233))

(assert (=> b!216296 m!243241))

(assert (=> b!216297 m!243233))

(assert (=> b!216297 m!243233))

(assert (=> b!216297 m!243241))

(assert (=> bm!20361 m!243233))

(declare-fun m!243245 () Bool)

(assert (=> bm!20361 m!243245))

(assert (=> b!216209 d!58601))

(declare-fun d!58603 () Bool)

(assert (=> d!58603 (= (validMask!0 (mask!9786 thiss!1504)) (and (or (= (mask!9786 thiss!1504) #b00000000000000000000000000000111) (= (mask!9786 thiss!1504) #b00000000000000000000000000001111) (= (mask!9786 thiss!1504) #b00000000000000000000000000011111) (= (mask!9786 thiss!1504) #b00000000000000000000000000111111) (= (mask!9786 thiss!1504) #b00000000000000000000000001111111) (= (mask!9786 thiss!1504) #b00000000000000000000000011111111) (= (mask!9786 thiss!1504) #b00000000000000000000000111111111) (= (mask!9786 thiss!1504) #b00000000000000000000001111111111) (= (mask!9786 thiss!1504) #b00000000000000000000011111111111) (= (mask!9786 thiss!1504) #b00000000000000000000111111111111) (= (mask!9786 thiss!1504) #b00000000000000000001111111111111) (= (mask!9786 thiss!1504) #b00000000000000000011111111111111) (= (mask!9786 thiss!1504) #b00000000000000000111111111111111) (= (mask!9786 thiss!1504) #b00000000000000001111111111111111) (= (mask!9786 thiss!1504) #b00000000000000011111111111111111) (= (mask!9786 thiss!1504) #b00000000000000111111111111111111) (= (mask!9786 thiss!1504) #b00000000000001111111111111111111) (= (mask!9786 thiss!1504) #b00000000000011111111111111111111) (= (mask!9786 thiss!1504) #b00000000000111111111111111111111) (= (mask!9786 thiss!1504) #b00000000001111111111111111111111) (= (mask!9786 thiss!1504) #b00000000011111111111111111111111) (= (mask!9786 thiss!1504) #b00000000111111111111111111111111) (= (mask!9786 thiss!1504) #b00000001111111111111111111111111) (= (mask!9786 thiss!1504) #b00000011111111111111111111111111) (= (mask!9786 thiss!1504) #b00000111111111111111111111111111) (= (mask!9786 thiss!1504) #b00001111111111111111111111111111) (= (mask!9786 thiss!1504) #b00011111111111111111111111111111) (= (mask!9786 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9786 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!216205 d!58603))

(declare-fun d!58605 () Bool)

(declare-fun lt!111196 () SeekEntryResult!729)

(assert (=> d!58605 (and (or ((_ is Undefined!729) lt!111196) (not ((_ is Found!729) lt!111196)) (and (bvsge (index!5087 lt!111196) #b00000000000000000000000000000000) (bvslt (index!5087 lt!111196) (size!5278 (_keys!6104 thiss!1504))))) (or ((_ is Undefined!729) lt!111196) ((_ is Found!729) lt!111196) (not ((_ is MissingZero!729) lt!111196)) (and (bvsge (index!5086 lt!111196) #b00000000000000000000000000000000) (bvslt (index!5086 lt!111196) (size!5278 (_keys!6104 thiss!1504))))) (or ((_ is Undefined!729) lt!111196) ((_ is Found!729) lt!111196) ((_ is MissingZero!729) lt!111196) (not ((_ is MissingVacant!729) lt!111196)) (and (bvsge (index!5089 lt!111196) #b00000000000000000000000000000000) (bvslt (index!5089 lt!111196) (size!5278 (_keys!6104 thiss!1504))))) (or ((_ is Undefined!729) lt!111196) (ite ((_ is Found!729) lt!111196) (= (select (arr!4946 (_keys!6104 thiss!1504)) (index!5087 lt!111196)) key!932) (ite ((_ is MissingZero!729) lt!111196) (= (select (arr!4946 (_keys!6104 thiss!1504)) (index!5086 lt!111196)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!729) lt!111196) (= (select (arr!4946 (_keys!6104 thiss!1504)) (index!5089 lt!111196)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!140732 () SeekEntryResult!729)

(assert (=> d!58605 (= lt!111196 e!140732)))

(declare-fun c!36326 () Bool)

(declare-fun lt!111197 () SeekEntryResult!729)

(assert (=> d!58605 (= c!36326 (and ((_ is Intermediate!729) lt!111197) (undefined!1541 lt!111197)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10445 (_ BitVec 32)) SeekEntryResult!729)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58605 (= lt!111197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9786 thiss!1504)) key!932 (_keys!6104 thiss!1504) (mask!9786 thiss!1504)))))

(assert (=> d!58605 (validMask!0 (mask!9786 thiss!1504))))

(assert (=> d!58605 (= (seekEntryOrOpen!0 key!932 (_keys!6104 thiss!1504) (mask!9786 thiss!1504)) lt!111196)))

(declare-fun b!216310 () Bool)

(declare-fun c!36325 () Bool)

(declare-fun lt!111195 () (_ BitVec 64))

(assert (=> b!216310 (= c!36325 (= lt!111195 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140733 () SeekEntryResult!729)

(declare-fun e!140734 () SeekEntryResult!729)

(assert (=> b!216310 (= e!140733 e!140734)))

(declare-fun b!216311 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10445 (_ BitVec 32)) SeekEntryResult!729)

(assert (=> b!216311 (= e!140734 (seekKeyOrZeroReturnVacant!0 (x!22593 lt!111197) (index!5088 lt!111197) (index!5088 lt!111197) key!932 (_keys!6104 thiss!1504) (mask!9786 thiss!1504)))))

(declare-fun b!216312 () Bool)

(assert (=> b!216312 (= e!140733 (Found!729 (index!5088 lt!111197)))))

(declare-fun b!216313 () Bool)

(assert (=> b!216313 (= e!140734 (MissingZero!729 (index!5088 lt!111197)))))

(declare-fun b!216314 () Bool)

(assert (=> b!216314 (= e!140732 Undefined!729)))

(declare-fun b!216315 () Bool)

(assert (=> b!216315 (= e!140732 e!140733)))

(assert (=> b!216315 (= lt!111195 (select (arr!4946 (_keys!6104 thiss!1504)) (index!5088 lt!111197)))))

(declare-fun c!36327 () Bool)

(assert (=> b!216315 (= c!36327 (= lt!111195 key!932))))

(assert (= (and d!58605 c!36326) b!216314))

(assert (= (and d!58605 (not c!36326)) b!216315))

(assert (= (and b!216315 c!36327) b!216312))

(assert (= (and b!216315 (not c!36327)) b!216310))

(assert (= (and b!216310 c!36325) b!216313))

(assert (= (and b!216310 (not c!36325)) b!216311))

(declare-fun m!243247 () Bool)

(assert (=> d!58605 m!243247))

(assert (=> d!58605 m!243185))

(declare-fun m!243249 () Bool)

(assert (=> d!58605 m!243249))

(declare-fun m!243251 () Bool)

(assert (=> d!58605 m!243251))

(assert (=> d!58605 m!243251))

(declare-fun m!243253 () Bool)

(assert (=> d!58605 m!243253))

(declare-fun m!243255 () Bool)

(assert (=> d!58605 m!243255))

(declare-fun m!243257 () Bool)

(assert (=> b!216311 m!243257))

(declare-fun m!243259 () Bool)

(assert (=> b!216315 m!243259))

(assert (=> b!216204 d!58605))

(declare-fun d!58607 () Bool)

(assert (=> d!58607 (= (array_inv!3249 (_keys!6104 thiss!1504)) (bvsge (size!5278 (_keys!6104 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216208 d!58607))

(declare-fun d!58609 () Bool)

(assert (=> d!58609 (= (array_inv!3250 (_values!4042 thiss!1504)) (bvsge (size!5277 (_values!4042 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216208 d!58609))

(declare-fun d!58611 () Bool)

(declare-fun res!105769 () Bool)

(declare-fun e!140737 () Bool)

(assert (=> d!58611 (=> (not res!105769) (not e!140737))))

(declare-fun simpleValid!222 (LongMapFixedSize!2818) Bool)

(assert (=> d!58611 (= res!105769 (simpleValid!222 thiss!1504))))

(assert (=> d!58611 (= (valid!1166 thiss!1504) e!140737)))

(declare-fun b!216322 () Bool)

(declare-fun res!105770 () Bool)

(assert (=> b!216322 (=> (not res!105770) (not e!140737))))

(declare-fun arrayCountValidKeys!0 (array!10445 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!216322 (= res!105770 (= (arrayCountValidKeys!0 (_keys!6104 thiss!1504) #b00000000000000000000000000000000 (size!5278 (_keys!6104 thiss!1504))) (_size!1458 thiss!1504)))))

(declare-fun b!216323 () Bool)

(declare-fun res!105771 () Bool)

(assert (=> b!216323 (=> (not res!105771) (not e!140737))))

(assert (=> b!216323 (= res!105771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6104 thiss!1504) (mask!9786 thiss!1504)))))

(declare-fun b!216324 () Bool)

(assert (=> b!216324 (= e!140737 (arrayNoDuplicates!0 (_keys!6104 thiss!1504) #b00000000000000000000000000000000 Nil!3073))))

(assert (= (and d!58611 res!105769) b!216322))

(assert (= (and b!216322 res!105770) b!216323))

(assert (= (and b!216323 res!105771) b!216324))

(declare-fun m!243261 () Bool)

(assert (=> d!58611 m!243261))

(declare-fun m!243263 () Bool)

(assert (=> b!216322 m!243263))

(assert (=> b!216323 m!243195))

(assert (=> b!216324 m!243183))

(assert (=> start!21570 d!58611))

(declare-fun condMapEmpty!9573 () Bool)

(declare-fun mapDefault!9573 () ValueCell!2459)

(assert (=> mapNonEmpty!9564 (= condMapEmpty!9573 (= mapRest!9564 ((as const (Array (_ BitVec 32) ValueCell!2459)) mapDefault!9573)))))

(declare-fun e!140743 () Bool)

(declare-fun mapRes!9573 () Bool)

(assert (=> mapNonEmpty!9564 (= tp!20357 (and e!140743 mapRes!9573))))

(declare-fun b!216332 () Bool)

(assert (=> b!216332 (= e!140743 tp_is_empty!5605)))

(declare-fun mapIsEmpty!9573 () Bool)

(assert (=> mapIsEmpty!9573 mapRes!9573))

(declare-fun mapNonEmpty!9573 () Bool)

(declare-fun tp!20373 () Bool)

(declare-fun e!140742 () Bool)

(assert (=> mapNonEmpty!9573 (= mapRes!9573 (and tp!20373 e!140742))))

(declare-fun mapKey!9573 () (_ BitVec 32))

(declare-fun mapValue!9573 () ValueCell!2459)

(declare-fun mapRest!9573 () (Array (_ BitVec 32) ValueCell!2459))

(assert (=> mapNonEmpty!9573 (= mapRest!9564 (store mapRest!9573 mapKey!9573 mapValue!9573))))

(declare-fun b!216331 () Bool)

(assert (=> b!216331 (= e!140742 tp_is_empty!5605)))

(assert (= (and mapNonEmpty!9564 condMapEmpty!9573) mapIsEmpty!9573))

(assert (= (and mapNonEmpty!9564 (not condMapEmpty!9573)) mapNonEmpty!9573))

(assert (= (and mapNonEmpty!9573 ((_ is ValueCellFull!2459) mapValue!9573)) b!216331))

(assert (= (and mapNonEmpty!9564 ((_ is ValueCellFull!2459) mapDefault!9573)) b!216332))

(declare-fun m!243265 () Bool)

(assert (=> mapNonEmpty!9573 m!243265))

(check-sat (not b!216281) tp_is_empty!5605 (not b!216323) (not b!216322) (not b!216311) b_and!12647 (not bm!20361) (not d!58611) (not b!216297) (not d!58605) (not mapNonEmpty!9573) (not b!216280) (not b!216293) (not bm!20358) (not b_next!5743) (not b!216324) (not b!216296))
(check-sat b_and!12647 (not b_next!5743))
