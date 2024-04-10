; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17126 () Bool)

(assert start!17126)

(declare-fun b!172199 () Bool)

(declare-fun b_free!4245 () Bool)

(declare-fun b_next!4245 () Bool)

(assert (=> b!172199 (= b_free!4245 (not b_next!4245))))

(declare-fun tp!15373 () Bool)

(declare-fun b_and!10685 () Bool)

(assert (=> b!172199 (= tp!15373 b_and!10685)))

(declare-fun b!172194 () Bool)

(declare-fun res!81765 () Bool)

(declare-fun e!113653 () Bool)

(assert (=> b!172194 (=> (not res!81765) (not e!113653))))

(declare-datatypes ((V!5003 0))(
  ( (V!5004 (val!2053 Int)) )
))
(declare-datatypes ((ValueCell!1665 0))(
  ( (ValueCellFull!1665 (v!3921 V!5003)) (EmptyCell!1665) )
))
(declare-datatypes ((array!7151 0))(
  ( (array!7152 (arr!3401 (Array (_ BitVec 32) (_ BitVec 64))) (size!3696 (_ BitVec 32))) )
))
(declare-datatypes ((array!7153 0))(
  ( (array!7154 (arr!3402 (Array (_ BitVec 32) ValueCell!1665)) (size!3697 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2238 0))(
  ( (LongMapFixedSize!2239 (defaultEntry!3565 Int) (mask!8402 (_ BitVec 32)) (extraKeys!3304 (_ BitVec 32)) (zeroValue!3406 V!5003) (minValue!3408 V!5003) (_size!1168 (_ BitVec 32)) (_keys!5400 array!7151) (_values!3548 array!7153) (_vacant!1168 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2238)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172194 (= res!81765 (validMask!0 (mask!8402 thiss!1248)))))

(declare-fun b!172196 () Bool)

(declare-fun res!81763 () Bool)

(assert (=> b!172196 (=> (not res!81763) (not e!113653))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172196 (= res!81763 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!6827 () Bool)

(declare-fun mapRes!6827 () Bool)

(assert (=> mapIsEmpty!6827 mapRes!6827))

(declare-fun b!172197 () Bool)

(declare-fun e!113652 () Bool)

(declare-fun tp_is_empty!4017 () Bool)

(assert (=> b!172197 (= e!113652 tp_is_empty!4017)))

(declare-fun res!81764 () Bool)

(assert (=> start!17126 (=> (not res!81764) (not e!113653))))

(declare-fun valid!951 (LongMapFixedSize!2238) Bool)

(assert (=> start!17126 (= res!81764 (valid!951 thiss!1248))))

(assert (=> start!17126 e!113653))

(declare-fun e!113654 () Bool)

(assert (=> start!17126 e!113654))

(assert (=> start!17126 true))

(declare-fun b!172195 () Bool)

(declare-fun e!113650 () Bool)

(assert (=> b!172195 (= e!113650 tp_is_empty!4017)))

(declare-fun b!172198 () Bool)

(declare-fun e!113655 () Bool)

(assert (=> b!172198 (= e!113655 (and e!113650 mapRes!6827))))

(declare-fun condMapEmpty!6827 () Bool)

(declare-fun mapDefault!6827 () ValueCell!1665)

(assert (=> b!172198 (= condMapEmpty!6827 (= (arr!3402 (_values!3548 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1665)) mapDefault!6827)))))

(declare-fun array_inv!2177 (array!7151) Bool)

(declare-fun array_inv!2178 (array!7153) Bool)

(assert (=> b!172199 (= e!113654 (and tp!15373 tp_is_empty!4017 (array_inv!2177 (_keys!5400 thiss!1248)) (array_inv!2178 (_values!3548 thiss!1248)) e!113655))))

(declare-fun mapNonEmpty!6827 () Bool)

(declare-fun tp!15374 () Bool)

(assert (=> mapNonEmpty!6827 (= mapRes!6827 (and tp!15374 e!113652))))

(declare-fun mapValue!6827 () ValueCell!1665)

(declare-fun mapKey!6827 () (_ BitVec 32))

(declare-fun mapRest!6827 () (Array (_ BitVec 32) ValueCell!1665))

(assert (=> mapNonEmpty!6827 (= (arr!3402 (_values!3548 thiss!1248)) (store mapRest!6827 mapKey!6827 mapValue!6827))))

(declare-fun b!172200 () Bool)

(assert (=> b!172200 (= e!113653 (not (= (size!3697 (_values!3548 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8402 thiss!1248)))))))

(assert (= (and start!17126 res!81764) b!172196))

(assert (= (and b!172196 res!81763) b!172194))

(assert (= (and b!172194 res!81765) b!172200))

(assert (= (and b!172198 condMapEmpty!6827) mapIsEmpty!6827))

(assert (= (and b!172198 (not condMapEmpty!6827)) mapNonEmpty!6827))

(get-info :version)

(assert (= (and mapNonEmpty!6827 ((_ is ValueCellFull!1665) mapValue!6827)) b!172197))

(assert (= (and b!172198 ((_ is ValueCellFull!1665) mapDefault!6827)) b!172195))

(assert (= b!172199 b!172198))

(assert (= start!17126 b!172199))

(declare-fun m!201115 () Bool)

(assert (=> b!172194 m!201115))

(declare-fun m!201117 () Bool)

(assert (=> start!17126 m!201117))

(declare-fun m!201119 () Bool)

(assert (=> b!172199 m!201119))

(declare-fun m!201121 () Bool)

(assert (=> b!172199 m!201121))

(declare-fun m!201123 () Bool)

(assert (=> mapNonEmpty!6827 m!201123))

(check-sat (not b!172199) tp_is_empty!4017 (not b!172194) (not mapNonEmpty!6827) (not b_next!4245) b_and!10685 (not start!17126))
(check-sat b_and!10685 (not b_next!4245))
(get-model)

(declare-fun d!52473 () Bool)

(assert (=> d!52473 (= (validMask!0 (mask!8402 thiss!1248)) (and (or (= (mask!8402 thiss!1248) #b00000000000000000000000000000111) (= (mask!8402 thiss!1248) #b00000000000000000000000000001111) (= (mask!8402 thiss!1248) #b00000000000000000000000000011111) (= (mask!8402 thiss!1248) #b00000000000000000000000000111111) (= (mask!8402 thiss!1248) #b00000000000000000000000001111111) (= (mask!8402 thiss!1248) #b00000000000000000000000011111111) (= (mask!8402 thiss!1248) #b00000000000000000000000111111111) (= (mask!8402 thiss!1248) #b00000000000000000000001111111111) (= (mask!8402 thiss!1248) #b00000000000000000000011111111111) (= (mask!8402 thiss!1248) #b00000000000000000000111111111111) (= (mask!8402 thiss!1248) #b00000000000000000001111111111111) (= (mask!8402 thiss!1248) #b00000000000000000011111111111111) (= (mask!8402 thiss!1248) #b00000000000000000111111111111111) (= (mask!8402 thiss!1248) #b00000000000000001111111111111111) (= (mask!8402 thiss!1248) #b00000000000000011111111111111111) (= (mask!8402 thiss!1248) #b00000000000000111111111111111111) (= (mask!8402 thiss!1248) #b00000000000001111111111111111111) (= (mask!8402 thiss!1248) #b00000000000011111111111111111111) (= (mask!8402 thiss!1248) #b00000000000111111111111111111111) (= (mask!8402 thiss!1248) #b00000000001111111111111111111111) (= (mask!8402 thiss!1248) #b00000000011111111111111111111111) (= (mask!8402 thiss!1248) #b00000000111111111111111111111111) (= (mask!8402 thiss!1248) #b00000001111111111111111111111111) (= (mask!8402 thiss!1248) #b00000011111111111111111111111111) (= (mask!8402 thiss!1248) #b00000111111111111111111111111111) (= (mask!8402 thiss!1248) #b00001111111111111111111111111111) (= (mask!8402 thiss!1248) #b00011111111111111111111111111111) (= (mask!8402 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8402 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172194 d!52473))

(declare-fun d!52475 () Bool)

(assert (=> d!52475 (= (array_inv!2177 (_keys!5400 thiss!1248)) (bvsge (size!3696 (_keys!5400 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172199 d!52475))

(declare-fun d!52477 () Bool)

(assert (=> d!52477 (= (array_inv!2178 (_values!3548 thiss!1248)) (bvsge (size!3697 (_values!3548 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172199 d!52477))

(declare-fun d!52479 () Bool)

(declare-fun res!81781 () Bool)

(declare-fun e!113676 () Bool)

(assert (=> d!52479 (=> (not res!81781) (not e!113676))))

(declare-fun simpleValid!137 (LongMapFixedSize!2238) Bool)

(assert (=> d!52479 (= res!81781 (simpleValid!137 thiss!1248))))

(assert (=> d!52479 (= (valid!951 thiss!1248) e!113676)))

(declare-fun b!172228 () Bool)

(declare-fun res!81782 () Bool)

(assert (=> b!172228 (=> (not res!81782) (not e!113676))))

(declare-fun arrayCountValidKeys!0 (array!7151 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172228 (= res!81782 (= (arrayCountValidKeys!0 (_keys!5400 thiss!1248) #b00000000000000000000000000000000 (size!3696 (_keys!5400 thiss!1248))) (_size!1168 thiss!1248)))))

(declare-fun b!172229 () Bool)

(declare-fun res!81783 () Bool)

(assert (=> b!172229 (=> (not res!81783) (not e!113676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7151 (_ BitVec 32)) Bool)

(assert (=> b!172229 (= res!81783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5400 thiss!1248) (mask!8402 thiss!1248)))))

(declare-fun b!172230 () Bool)

(declare-datatypes ((List!2197 0))(
  ( (Nil!2194) (Cons!2193 (h!2810 (_ BitVec 64)) (t!7004 List!2197)) )
))
(declare-fun arrayNoDuplicates!0 (array!7151 (_ BitVec 32) List!2197) Bool)

(assert (=> b!172230 (= e!113676 (arrayNoDuplicates!0 (_keys!5400 thiss!1248) #b00000000000000000000000000000000 Nil!2194))))

(assert (= (and d!52479 res!81781) b!172228))

(assert (= (and b!172228 res!81782) b!172229))

(assert (= (and b!172229 res!81783) b!172230))

(declare-fun m!201135 () Bool)

(assert (=> d!52479 m!201135))

(declare-fun m!201137 () Bool)

(assert (=> b!172228 m!201137))

(declare-fun m!201139 () Bool)

(assert (=> b!172229 m!201139))

(declare-fun m!201141 () Bool)

(assert (=> b!172230 m!201141))

(assert (=> start!17126 d!52479))

(declare-fun b!172238 () Bool)

(declare-fun e!113681 () Bool)

(assert (=> b!172238 (= e!113681 tp_is_empty!4017)))

(declare-fun b!172237 () Bool)

(declare-fun e!113682 () Bool)

(assert (=> b!172237 (= e!113682 tp_is_empty!4017)))

(declare-fun mapIsEmpty!6833 () Bool)

(declare-fun mapRes!6833 () Bool)

(assert (=> mapIsEmpty!6833 mapRes!6833))

(declare-fun condMapEmpty!6833 () Bool)

(declare-fun mapDefault!6833 () ValueCell!1665)

(assert (=> mapNonEmpty!6827 (= condMapEmpty!6833 (= mapRest!6827 ((as const (Array (_ BitVec 32) ValueCell!1665)) mapDefault!6833)))))

(assert (=> mapNonEmpty!6827 (= tp!15374 (and e!113681 mapRes!6833))))

(declare-fun mapNonEmpty!6833 () Bool)

(declare-fun tp!15383 () Bool)

(assert (=> mapNonEmpty!6833 (= mapRes!6833 (and tp!15383 e!113682))))

(declare-fun mapKey!6833 () (_ BitVec 32))

(declare-fun mapValue!6833 () ValueCell!1665)

(declare-fun mapRest!6833 () (Array (_ BitVec 32) ValueCell!1665))

(assert (=> mapNonEmpty!6833 (= mapRest!6827 (store mapRest!6833 mapKey!6833 mapValue!6833))))

(assert (= (and mapNonEmpty!6827 condMapEmpty!6833) mapIsEmpty!6833))

(assert (= (and mapNonEmpty!6827 (not condMapEmpty!6833)) mapNonEmpty!6833))

(assert (= (and mapNonEmpty!6833 ((_ is ValueCellFull!1665) mapValue!6833)) b!172237))

(assert (= (and mapNonEmpty!6827 ((_ is ValueCellFull!1665) mapDefault!6833)) b!172238))

(declare-fun m!201143 () Bool)

(assert (=> mapNonEmpty!6833 m!201143))

(check-sat tp_is_empty!4017 (not b!172230) (not mapNonEmpty!6833) (not b!172229) (not d!52479) (not b!172228) b_and!10685 (not b_next!4245))
(check-sat b_and!10685 (not b_next!4245))
(get-model)

(declare-fun d!52481 () Bool)

(declare-fun res!81792 () Bool)

(declare-fun e!113691 () Bool)

(assert (=> d!52481 (=> res!81792 e!113691)))

(assert (=> d!52481 (= res!81792 (bvsge #b00000000000000000000000000000000 (size!3696 (_keys!5400 thiss!1248))))))

(assert (=> d!52481 (= (arrayNoDuplicates!0 (_keys!5400 thiss!1248) #b00000000000000000000000000000000 Nil!2194) e!113691)))

(declare-fun b!172249 () Bool)

(declare-fun e!113693 () Bool)

(declare-fun contains!1149 (List!2197 (_ BitVec 64)) Bool)

(assert (=> b!172249 (= e!113693 (contains!1149 Nil!2194 (select (arr!3401 (_keys!5400 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17512 () Bool)

(declare-fun call!17515 () Bool)

(declare-fun c!30842 () Bool)

(assert (=> bm!17512 (= call!17515 (arrayNoDuplicates!0 (_keys!5400 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30842 (Cons!2193 (select (arr!3401 (_keys!5400 thiss!1248)) #b00000000000000000000000000000000) Nil!2194) Nil!2194)))))

(declare-fun b!172250 () Bool)

(declare-fun e!113694 () Bool)

(assert (=> b!172250 (= e!113691 e!113694)))

(declare-fun res!81791 () Bool)

(assert (=> b!172250 (=> (not res!81791) (not e!113694))))

(assert (=> b!172250 (= res!81791 (not e!113693))))

(declare-fun res!81790 () Bool)

(assert (=> b!172250 (=> (not res!81790) (not e!113693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!172250 (= res!81790 (validKeyInArray!0 (select (arr!3401 (_keys!5400 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172251 () Bool)

(declare-fun e!113692 () Bool)

(assert (=> b!172251 (= e!113692 call!17515)))

(declare-fun b!172252 () Bool)

(assert (=> b!172252 (= e!113692 call!17515)))

(declare-fun b!172253 () Bool)

(assert (=> b!172253 (= e!113694 e!113692)))

(assert (=> b!172253 (= c!30842 (validKeyInArray!0 (select (arr!3401 (_keys!5400 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52481 (not res!81792)) b!172250))

(assert (= (and b!172250 res!81790) b!172249))

(assert (= (and b!172250 res!81791) b!172253))

(assert (= (and b!172253 c!30842) b!172251))

(assert (= (and b!172253 (not c!30842)) b!172252))

(assert (= (or b!172251 b!172252) bm!17512))

(declare-fun m!201145 () Bool)

(assert (=> b!172249 m!201145))

(assert (=> b!172249 m!201145))

(declare-fun m!201147 () Bool)

(assert (=> b!172249 m!201147))

(assert (=> bm!17512 m!201145))

(declare-fun m!201149 () Bool)

(assert (=> bm!17512 m!201149))

(assert (=> b!172250 m!201145))

(assert (=> b!172250 m!201145))

(declare-fun m!201151 () Bool)

(assert (=> b!172250 m!201151))

(assert (=> b!172253 m!201145))

(assert (=> b!172253 m!201145))

(assert (=> b!172253 m!201151))

(assert (=> b!172230 d!52481))

(declare-fun b!172264 () Bool)

(declare-fun res!81802 () Bool)

(declare-fun e!113697 () Bool)

(assert (=> b!172264 (=> (not res!81802) (not e!113697))))

(declare-fun size!3700 (LongMapFixedSize!2238) (_ BitVec 32))

(assert (=> b!172264 (= res!81802 (= (size!3700 thiss!1248) (bvadd (_size!1168 thiss!1248) (bvsdiv (bvadd (extraKeys!3304 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!172262 () Bool)

(declare-fun res!81803 () Bool)

(assert (=> b!172262 (=> (not res!81803) (not e!113697))))

(assert (=> b!172262 (= res!81803 (and (= (size!3697 (_values!3548 thiss!1248)) (bvadd (mask!8402 thiss!1248) #b00000000000000000000000000000001)) (= (size!3696 (_keys!5400 thiss!1248)) (size!3697 (_values!3548 thiss!1248))) (bvsge (_size!1168 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1168 thiss!1248) (bvadd (mask!8402 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!172265 () Bool)

(assert (=> b!172265 (= e!113697 (and (bvsge (extraKeys!3304 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3304 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1168 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!52483 () Bool)

(declare-fun res!81801 () Bool)

(assert (=> d!52483 (=> (not res!81801) (not e!113697))))

(assert (=> d!52483 (= res!81801 (validMask!0 (mask!8402 thiss!1248)))))

(assert (=> d!52483 (= (simpleValid!137 thiss!1248) e!113697)))

(declare-fun b!172263 () Bool)

(declare-fun res!81804 () Bool)

(assert (=> b!172263 (=> (not res!81804) (not e!113697))))

(assert (=> b!172263 (= res!81804 (bvsge (size!3700 thiss!1248) (_size!1168 thiss!1248)))))

(assert (= (and d!52483 res!81801) b!172262))

(assert (= (and b!172262 res!81803) b!172263))

(assert (= (and b!172263 res!81804) b!172264))

(assert (= (and b!172264 res!81802) b!172265))

(declare-fun m!201153 () Bool)

(assert (=> b!172264 m!201153))

(assert (=> d!52483 m!201115))

(assert (=> b!172263 m!201153))

(assert (=> d!52479 d!52483))

(declare-fun bm!17515 () Bool)

(declare-fun call!17518 () (_ BitVec 32))

(assert (=> bm!17515 (= call!17518 (arrayCountValidKeys!0 (_keys!5400 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3696 (_keys!5400 thiss!1248))))))

(declare-fun b!172274 () Bool)

(declare-fun e!113703 () (_ BitVec 32))

(declare-fun e!113702 () (_ BitVec 32))

(assert (=> b!172274 (= e!113703 e!113702)))

(declare-fun c!30847 () Bool)

(assert (=> b!172274 (= c!30847 (validKeyInArray!0 (select (arr!3401 (_keys!5400 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172275 () Bool)

(assert (=> b!172275 (= e!113702 (bvadd #b00000000000000000000000000000001 call!17518))))

(declare-fun b!172276 () Bool)

(assert (=> b!172276 (= e!113703 #b00000000000000000000000000000000)))

(declare-fun d!52485 () Bool)

(declare-fun lt!85648 () (_ BitVec 32))

(assert (=> d!52485 (and (bvsge lt!85648 #b00000000000000000000000000000000) (bvsle lt!85648 (bvsub (size!3696 (_keys!5400 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52485 (= lt!85648 e!113703)))

(declare-fun c!30848 () Bool)

(assert (=> d!52485 (= c!30848 (bvsge #b00000000000000000000000000000000 (size!3696 (_keys!5400 thiss!1248))))))

(assert (=> d!52485 (and (bvsle #b00000000000000000000000000000000 (size!3696 (_keys!5400 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3696 (_keys!5400 thiss!1248)) (size!3696 (_keys!5400 thiss!1248))))))

(assert (=> d!52485 (= (arrayCountValidKeys!0 (_keys!5400 thiss!1248) #b00000000000000000000000000000000 (size!3696 (_keys!5400 thiss!1248))) lt!85648)))

(declare-fun b!172277 () Bool)

(assert (=> b!172277 (= e!113702 call!17518)))

(assert (= (and d!52485 c!30848) b!172276))

(assert (= (and d!52485 (not c!30848)) b!172274))

(assert (= (and b!172274 c!30847) b!172275))

(assert (= (and b!172274 (not c!30847)) b!172277))

(assert (= (or b!172275 b!172277) bm!17515))

(declare-fun m!201155 () Bool)

(assert (=> bm!17515 m!201155))

(assert (=> b!172274 m!201145))

(assert (=> b!172274 m!201145))

(assert (=> b!172274 m!201151))

(assert (=> b!172228 d!52485))

(declare-fun b!172286 () Bool)

(declare-fun e!113712 () Bool)

(declare-fun e!113711 () Bool)

(assert (=> b!172286 (= e!113712 e!113711)))

(declare-fun lt!85657 () (_ BitVec 64))

(assert (=> b!172286 (= lt!85657 (select (arr!3401 (_keys!5400 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5302 0))(
  ( (Unit!5303) )
))
(declare-fun lt!85655 () Unit!5302)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7151 (_ BitVec 64) (_ BitVec 32)) Unit!5302)

(assert (=> b!172286 (= lt!85655 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5400 thiss!1248) lt!85657 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172286 (arrayContainsKey!0 (_keys!5400 thiss!1248) lt!85657 #b00000000000000000000000000000000)))

(declare-fun lt!85656 () Unit!5302)

(assert (=> b!172286 (= lt!85656 lt!85655)))

(declare-fun res!81810 () Bool)

(declare-datatypes ((SeekEntryResult!536 0))(
  ( (MissingZero!536 (index!4312 (_ BitVec 32))) (Found!536 (index!4313 (_ BitVec 32))) (Intermediate!536 (undefined!1348 Bool) (index!4314 (_ BitVec 32)) (x!19013 (_ BitVec 32))) (Undefined!536) (MissingVacant!536 (index!4315 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7151 (_ BitVec 32)) SeekEntryResult!536)

(assert (=> b!172286 (= res!81810 (= (seekEntryOrOpen!0 (select (arr!3401 (_keys!5400 thiss!1248)) #b00000000000000000000000000000000) (_keys!5400 thiss!1248) (mask!8402 thiss!1248)) (Found!536 #b00000000000000000000000000000000)))))

(assert (=> b!172286 (=> (not res!81810) (not e!113711))))

(declare-fun b!172287 () Bool)

(declare-fun e!113710 () Bool)

(assert (=> b!172287 (= e!113710 e!113712)))

(declare-fun c!30851 () Bool)

(assert (=> b!172287 (= c!30851 (validKeyInArray!0 (select (arr!3401 (_keys!5400 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17518 () Bool)

(declare-fun call!17521 () Bool)

(assert (=> bm!17518 (= call!17521 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5400 thiss!1248) (mask!8402 thiss!1248)))))

(declare-fun d!52487 () Bool)

(declare-fun res!81809 () Bool)

(assert (=> d!52487 (=> res!81809 e!113710)))

(assert (=> d!52487 (= res!81809 (bvsge #b00000000000000000000000000000000 (size!3696 (_keys!5400 thiss!1248))))))

(assert (=> d!52487 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5400 thiss!1248) (mask!8402 thiss!1248)) e!113710)))

(declare-fun b!172288 () Bool)

(assert (=> b!172288 (= e!113712 call!17521)))

(declare-fun b!172289 () Bool)

(assert (=> b!172289 (= e!113711 call!17521)))

(assert (= (and d!52487 (not res!81809)) b!172287))

(assert (= (and b!172287 c!30851) b!172286))

(assert (= (and b!172287 (not c!30851)) b!172288))

(assert (= (and b!172286 res!81810) b!172289))

(assert (= (or b!172289 b!172288) bm!17518))

(assert (=> b!172286 m!201145))

(declare-fun m!201157 () Bool)

(assert (=> b!172286 m!201157))

(declare-fun m!201159 () Bool)

(assert (=> b!172286 m!201159))

(assert (=> b!172286 m!201145))

(declare-fun m!201161 () Bool)

(assert (=> b!172286 m!201161))

(assert (=> b!172287 m!201145))

(assert (=> b!172287 m!201145))

(assert (=> b!172287 m!201151))

(declare-fun m!201163 () Bool)

(assert (=> bm!17518 m!201163))

(assert (=> b!172229 d!52487))

(declare-fun b!172291 () Bool)

(declare-fun e!113713 () Bool)

(assert (=> b!172291 (= e!113713 tp_is_empty!4017)))

(declare-fun b!172290 () Bool)

(declare-fun e!113714 () Bool)

(assert (=> b!172290 (= e!113714 tp_is_empty!4017)))

(declare-fun mapIsEmpty!6834 () Bool)

(declare-fun mapRes!6834 () Bool)

(assert (=> mapIsEmpty!6834 mapRes!6834))

(declare-fun condMapEmpty!6834 () Bool)

(declare-fun mapDefault!6834 () ValueCell!1665)

(assert (=> mapNonEmpty!6833 (= condMapEmpty!6834 (= mapRest!6833 ((as const (Array (_ BitVec 32) ValueCell!1665)) mapDefault!6834)))))

(assert (=> mapNonEmpty!6833 (= tp!15383 (and e!113713 mapRes!6834))))

(declare-fun mapNonEmpty!6834 () Bool)

(declare-fun tp!15384 () Bool)

(assert (=> mapNonEmpty!6834 (= mapRes!6834 (and tp!15384 e!113714))))

(declare-fun mapRest!6834 () (Array (_ BitVec 32) ValueCell!1665))

(declare-fun mapKey!6834 () (_ BitVec 32))

(declare-fun mapValue!6834 () ValueCell!1665)

(assert (=> mapNonEmpty!6834 (= mapRest!6833 (store mapRest!6834 mapKey!6834 mapValue!6834))))

(assert (= (and mapNonEmpty!6833 condMapEmpty!6834) mapIsEmpty!6834))

(assert (= (and mapNonEmpty!6833 (not condMapEmpty!6834)) mapNonEmpty!6834))

(assert (= (and mapNonEmpty!6834 ((_ is ValueCellFull!1665) mapValue!6834)) b!172290))

(assert (= (and mapNonEmpty!6833 ((_ is ValueCellFull!1665) mapDefault!6834)) b!172291))

(declare-fun m!201165 () Bool)

(assert (=> mapNonEmpty!6834 m!201165))

(check-sat (not b!172286) (not b!172253) (not b!172250) (not bm!17512) (not b!172287) (not b!172274) b_and!10685 (not b!172264) (not bm!17515) (not b_next!4245) tp_is_empty!4017 (not b!172263) (not mapNonEmpty!6834) (not bm!17518) (not d!52483) (not b!172249))
(check-sat b_and!10685 (not b_next!4245))
