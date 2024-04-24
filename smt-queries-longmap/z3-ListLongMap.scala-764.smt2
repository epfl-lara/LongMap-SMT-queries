; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18018 () Bool)

(assert start!18018)

(declare-fun b!179415 () Bool)

(declare-fun b_free!4423 () Bool)

(declare-fun b_next!4423 () Bool)

(assert (=> b!179415 (= b_free!4423 (not b_next!4423))))

(declare-fun tp!15994 () Bool)

(declare-fun b_and!10967 () Bool)

(assert (=> b!179415 (= tp!15994 b_and!10967)))

(declare-fun b!179411 () Bool)

(declare-fun e!118195 () Bool)

(declare-fun tp_is_empty!4195 () Bool)

(assert (=> b!179411 (= e!118195 tp_is_empty!4195)))

(declare-fun res!84973 () Bool)

(declare-fun e!118193 () Bool)

(assert (=> start!18018 (=> (not res!84973) (not e!118193))))

(declare-datatypes ((V!5241 0))(
  ( (V!5242 (val!2142 Int)) )
))
(declare-datatypes ((ValueCell!1754 0))(
  ( (ValueCellFull!1754 (v!4030 V!5241)) (EmptyCell!1754) )
))
(declare-datatypes ((array!7541 0))(
  ( (array!7542 (arr!3572 (Array (_ BitVec 32) (_ BitVec 64))) (size!3880 (_ BitVec 32))) )
))
(declare-datatypes ((array!7543 0))(
  ( (array!7544 (arr!3573 (Array (_ BitVec 32) ValueCell!1754)) (size!3881 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2416 0))(
  ( (LongMapFixedSize!2417 (defaultEntry!3682 Int) (mask!8663 (_ BitVec 32)) (extraKeys!3419 (_ BitVec 32)) (zeroValue!3523 V!5241) (minValue!3523 V!5241) (_size!1257 (_ BitVec 32)) (_keys!5569 array!7541) (_values!3665 array!7543) (_vacant!1257 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2416)

(declare-fun valid!1031 (LongMapFixedSize!2416) Bool)

(assert (=> start!18018 (= res!84973 (valid!1031 thiss!1248))))

(assert (=> start!18018 e!118193))

(declare-fun e!118198 () Bool)

(assert (=> start!18018 e!118198))

(assert (=> start!18018 true))

(declare-fun b!179412 () Bool)

(declare-fun res!84971 () Bool)

(assert (=> b!179412 (=> (not res!84971) (not e!118193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7541 (_ BitVec 32)) Bool)

(assert (=> b!179412 (= res!84971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5569 thiss!1248) (mask!8663 thiss!1248)))))

(declare-fun b!179413 () Bool)

(declare-fun res!84969 () Bool)

(assert (=> b!179413 (=> (not res!84969) (not e!118193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179413 (= res!84969 (validMask!0 (mask!8663 thiss!1248)))))

(declare-fun mapIsEmpty!7180 () Bool)

(declare-fun mapRes!7180 () Bool)

(assert (=> mapIsEmpty!7180 mapRes!7180))

(declare-fun b!179414 () Bool)

(declare-fun e!118197 () Bool)

(assert (=> b!179414 (= e!118197 tp_is_empty!4195)))

(declare-fun e!118196 () Bool)

(declare-fun array_inv!2309 (array!7541) Bool)

(declare-fun array_inv!2310 (array!7543) Bool)

(assert (=> b!179415 (= e!118198 (and tp!15994 tp_is_empty!4195 (array_inv!2309 (_keys!5569 thiss!1248)) (array_inv!2310 (_values!3665 thiss!1248)) e!118196))))

(declare-fun b!179416 () Bool)

(declare-datatypes ((List!2248 0))(
  ( (Nil!2245) (Cons!2244 (h!2869 (_ BitVec 64)) (t!7084 List!2248)) )
))
(declare-fun arrayNoDuplicates!0 (array!7541 (_ BitVec 32) List!2248) Bool)

(assert (=> b!179416 (= e!118193 (not (arrayNoDuplicates!0 (_keys!5569 thiss!1248) #b00000000000000000000000000000000 Nil!2245)))))

(declare-fun b!179417 () Bool)

(declare-fun res!84967 () Bool)

(assert (=> b!179417 (=> (not res!84967) (not e!118193))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!576 0))(
  ( (MissingZero!576 (index!4472 (_ BitVec 32))) (Found!576 (index!4473 (_ BitVec 32))) (Intermediate!576 (undefined!1388 Bool) (index!4474 (_ BitVec 32)) (x!19614 (_ BitVec 32))) (Undefined!576) (MissingVacant!576 (index!4475 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7541 (_ BitVec 32)) SeekEntryResult!576)

(assert (=> b!179417 (= res!84967 ((_ is Undefined!576) (seekEntryOrOpen!0 key!828 (_keys!5569 thiss!1248) (mask!8663 thiss!1248))))))

(declare-fun b!179418 () Bool)

(assert (=> b!179418 (= e!118196 (and e!118197 mapRes!7180))))

(declare-fun condMapEmpty!7180 () Bool)

(declare-fun mapDefault!7180 () ValueCell!1754)

(assert (=> b!179418 (= condMapEmpty!7180 (= (arr!3573 (_values!3665 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1754)) mapDefault!7180)))))

(declare-fun mapNonEmpty!7180 () Bool)

(declare-fun tp!15993 () Bool)

(assert (=> mapNonEmpty!7180 (= mapRes!7180 (and tp!15993 e!118195))))

(declare-fun mapValue!7180 () ValueCell!1754)

(declare-fun mapKey!7180 () (_ BitVec 32))

(declare-fun mapRest!7180 () (Array (_ BitVec 32) ValueCell!1754))

(assert (=> mapNonEmpty!7180 (= (arr!3573 (_values!3665 thiss!1248)) (store mapRest!7180 mapKey!7180 mapValue!7180))))

(declare-fun b!179419 () Bool)

(declare-fun res!84972 () Bool)

(assert (=> b!179419 (=> (not res!84972) (not e!118193))))

(assert (=> b!179419 (= res!84972 (and (= (size!3881 (_values!3665 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8663 thiss!1248))) (= (size!3880 (_keys!5569 thiss!1248)) (size!3881 (_values!3665 thiss!1248))) (bvsge (mask!8663 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3419 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3419 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!179420 () Bool)

(declare-fun res!84968 () Bool)

(assert (=> b!179420 (=> (not res!84968) (not e!118193))))

(assert (=> b!179420 (= res!84968 (not (= key!828 (bvneg key!828))))))

(declare-fun b!179421 () Bool)

(declare-fun res!84970 () Bool)

(assert (=> b!179421 (=> (not res!84970) (not e!118193))))

(declare-datatypes ((tuple2!3284 0))(
  ( (tuple2!3285 (_1!1653 (_ BitVec 64)) (_2!1653 V!5241)) )
))
(declare-datatypes ((List!2249 0))(
  ( (Nil!2246) (Cons!2245 (h!2870 tuple2!3284) (t!7085 List!2249)) )
))
(declare-datatypes ((ListLongMap!2217 0))(
  ( (ListLongMap!2218 (toList!1124 List!2249)) )
))
(declare-fun contains!1209 (ListLongMap!2217 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!779 (array!7541 array!7543 (_ BitVec 32) (_ BitVec 32) V!5241 V!5241 (_ BitVec 32) Int) ListLongMap!2217)

(assert (=> b!179421 (= res!84970 (not (contains!1209 (getCurrentListMap!779 (_keys!5569 thiss!1248) (_values!3665 thiss!1248) (mask!8663 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)) key!828)))))

(assert (= (and start!18018 res!84973) b!179420))

(assert (= (and b!179420 res!84968) b!179417))

(assert (= (and b!179417 res!84967) b!179421))

(assert (= (and b!179421 res!84970) b!179413))

(assert (= (and b!179413 res!84969) b!179419))

(assert (= (and b!179419 res!84972) b!179412))

(assert (= (and b!179412 res!84971) b!179416))

(assert (= (and b!179418 condMapEmpty!7180) mapIsEmpty!7180))

(assert (= (and b!179418 (not condMapEmpty!7180)) mapNonEmpty!7180))

(assert (= (and mapNonEmpty!7180 ((_ is ValueCellFull!1754) mapValue!7180)) b!179411))

(assert (= (and b!179418 ((_ is ValueCellFull!1754) mapDefault!7180)) b!179414))

(assert (= b!179415 b!179418))

(assert (= start!18018 b!179415))

(declare-fun m!207825 () Bool)

(assert (=> b!179412 m!207825))

(declare-fun m!207827 () Bool)

(assert (=> b!179413 m!207827))

(declare-fun m!207829 () Bool)

(assert (=> b!179415 m!207829))

(declare-fun m!207831 () Bool)

(assert (=> b!179415 m!207831))

(declare-fun m!207833 () Bool)

(assert (=> b!179417 m!207833))

(declare-fun m!207835 () Bool)

(assert (=> b!179416 m!207835))

(declare-fun m!207837 () Bool)

(assert (=> b!179421 m!207837))

(assert (=> b!179421 m!207837))

(declare-fun m!207839 () Bool)

(assert (=> b!179421 m!207839))

(declare-fun m!207841 () Bool)

(assert (=> mapNonEmpty!7180 m!207841))

(declare-fun m!207843 () Bool)

(assert (=> start!18018 m!207843))

(check-sat (not b!179413) (not mapNonEmpty!7180) (not b!179421) (not b!179416) b_and!10967 (not b!179412) tp_is_empty!4195 (not start!18018) (not b!179417) (not b!179415) (not b_next!4423))
(check-sat b_and!10967 (not b_next!4423))
(get-model)

(declare-fun d!54217 () Bool)

(assert (=> d!54217 (= (array_inv!2309 (_keys!5569 thiss!1248)) (bvsge (size!3880 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179415 d!54217))

(declare-fun d!54219 () Bool)

(assert (=> d!54219 (= (array_inv!2310 (_values!3665 thiss!1248)) (bvsge (size!3881 (_values!3665 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179415 d!54219))

(declare-fun d!54221 () Bool)

(declare-fun res!85022 () Bool)

(declare-fun e!118237 () Bool)

(assert (=> d!54221 (=> (not res!85022) (not e!118237))))

(declare-fun simpleValid!161 (LongMapFixedSize!2416) Bool)

(assert (=> d!54221 (= res!85022 (simpleValid!161 thiss!1248))))

(assert (=> d!54221 (= (valid!1031 thiss!1248) e!118237)))

(declare-fun b!179494 () Bool)

(declare-fun res!85023 () Bool)

(assert (=> b!179494 (=> (not res!85023) (not e!118237))))

(declare-fun arrayCountValidKeys!0 (array!7541 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!179494 (= res!85023 (= (arrayCountValidKeys!0 (_keys!5569 thiss!1248) #b00000000000000000000000000000000 (size!3880 (_keys!5569 thiss!1248))) (_size!1257 thiss!1248)))))

(declare-fun b!179495 () Bool)

(declare-fun res!85024 () Bool)

(assert (=> b!179495 (=> (not res!85024) (not e!118237))))

(assert (=> b!179495 (= res!85024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5569 thiss!1248) (mask!8663 thiss!1248)))))

(declare-fun b!179496 () Bool)

(assert (=> b!179496 (= e!118237 (arrayNoDuplicates!0 (_keys!5569 thiss!1248) #b00000000000000000000000000000000 Nil!2245))))

(assert (= (and d!54221 res!85022) b!179494))

(assert (= (and b!179494 res!85023) b!179495))

(assert (= (and b!179495 res!85024) b!179496))

(declare-fun m!207885 () Bool)

(assert (=> d!54221 m!207885))

(declare-fun m!207887 () Bool)

(assert (=> b!179494 m!207887))

(assert (=> b!179495 m!207825))

(assert (=> b!179496 m!207835))

(assert (=> start!18018 d!54221))

(declare-fun d!54223 () Bool)

(assert (=> d!54223 (= (validMask!0 (mask!8663 thiss!1248)) (and (or (= (mask!8663 thiss!1248) #b00000000000000000000000000000111) (= (mask!8663 thiss!1248) #b00000000000000000000000000001111) (= (mask!8663 thiss!1248) #b00000000000000000000000000011111) (= (mask!8663 thiss!1248) #b00000000000000000000000000111111) (= (mask!8663 thiss!1248) #b00000000000000000000000001111111) (= (mask!8663 thiss!1248) #b00000000000000000000000011111111) (= (mask!8663 thiss!1248) #b00000000000000000000000111111111) (= (mask!8663 thiss!1248) #b00000000000000000000001111111111) (= (mask!8663 thiss!1248) #b00000000000000000000011111111111) (= (mask!8663 thiss!1248) #b00000000000000000000111111111111) (= (mask!8663 thiss!1248) #b00000000000000000001111111111111) (= (mask!8663 thiss!1248) #b00000000000000000011111111111111) (= (mask!8663 thiss!1248) #b00000000000000000111111111111111) (= (mask!8663 thiss!1248) #b00000000000000001111111111111111) (= (mask!8663 thiss!1248) #b00000000000000011111111111111111) (= (mask!8663 thiss!1248) #b00000000000000111111111111111111) (= (mask!8663 thiss!1248) #b00000000000001111111111111111111) (= (mask!8663 thiss!1248) #b00000000000011111111111111111111) (= (mask!8663 thiss!1248) #b00000000000111111111111111111111) (= (mask!8663 thiss!1248) #b00000000001111111111111111111111) (= (mask!8663 thiss!1248) #b00000000011111111111111111111111) (= (mask!8663 thiss!1248) #b00000000111111111111111111111111) (= (mask!8663 thiss!1248) #b00000001111111111111111111111111) (= (mask!8663 thiss!1248) #b00000011111111111111111111111111) (= (mask!8663 thiss!1248) #b00000111111111111111111111111111) (= (mask!8663 thiss!1248) #b00001111111111111111111111111111) (= (mask!8663 thiss!1248) #b00011111111111111111111111111111) (= (mask!8663 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8663 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!179413 d!54223))

(declare-fun b!179509 () Bool)

(declare-fun e!118246 () SeekEntryResult!576)

(assert (=> b!179509 (= e!118246 Undefined!576)))

(declare-fun b!179510 () Bool)

(declare-fun e!118244 () SeekEntryResult!576)

(declare-fun lt!88710 () SeekEntryResult!576)

(assert (=> b!179510 (= e!118244 (MissingZero!576 (index!4474 lt!88710)))))

(declare-fun b!179511 () Bool)

(declare-fun c!32186 () Bool)

(declare-fun lt!88711 () (_ BitVec 64))

(assert (=> b!179511 (= c!32186 (= lt!88711 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118245 () SeekEntryResult!576)

(assert (=> b!179511 (= e!118245 e!118244)))

(declare-fun b!179512 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7541 (_ BitVec 32)) SeekEntryResult!576)

(assert (=> b!179512 (= e!118244 (seekKeyOrZeroReturnVacant!0 (x!19614 lt!88710) (index!4474 lt!88710) (index!4474 lt!88710) key!828 (_keys!5569 thiss!1248) (mask!8663 thiss!1248)))))

(declare-fun d!54225 () Bool)

(declare-fun lt!88709 () SeekEntryResult!576)

(assert (=> d!54225 (and (or ((_ is Undefined!576) lt!88709) (not ((_ is Found!576) lt!88709)) (and (bvsge (index!4473 lt!88709) #b00000000000000000000000000000000) (bvslt (index!4473 lt!88709) (size!3880 (_keys!5569 thiss!1248))))) (or ((_ is Undefined!576) lt!88709) ((_ is Found!576) lt!88709) (not ((_ is MissingZero!576) lt!88709)) (and (bvsge (index!4472 lt!88709) #b00000000000000000000000000000000) (bvslt (index!4472 lt!88709) (size!3880 (_keys!5569 thiss!1248))))) (or ((_ is Undefined!576) lt!88709) ((_ is Found!576) lt!88709) ((_ is MissingZero!576) lt!88709) (not ((_ is MissingVacant!576) lt!88709)) (and (bvsge (index!4475 lt!88709) #b00000000000000000000000000000000) (bvslt (index!4475 lt!88709) (size!3880 (_keys!5569 thiss!1248))))) (or ((_ is Undefined!576) lt!88709) (ite ((_ is Found!576) lt!88709) (= (select (arr!3572 (_keys!5569 thiss!1248)) (index!4473 lt!88709)) key!828) (ite ((_ is MissingZero!576) lt!88709) (= (select (arr!3572 (_keys!5569 thiss!1248)) (index!4472 lt!88709)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!576) lt!88709) (= (select (arr!3572 (_keys!5569 thiss!1248)) (index!4475 lt!88709)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54225 (= lt!88709 e!118246)))

(declare-fun c!32185 () Bool)

(assert (=> d!54225 (= c!32185 (and ((_ is Intermediate!576) lt!88710) (undefined!1388 lt!88710)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7541 (_ BitVec 32)) SeekEntryResult!576)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54225 (= lt!88710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8663 thiss!1248)) key!828 (_keys!5569 thiss!1248) (mask!8663 thiss!1248)))))

(assert (=> d!54225 (validMask!0 (mask!8663 thiss!1248))))

(assert (=> d!54225 (= (seekEntryOrOpen!0 key!828 (_keys!5569 thiss!1248) (mask!8663 thiss!1248)) lt!88709)))

(declare-fun b!179513 () Bool)

(assert (=> b!179513 (= e!118245 (Found!576 (index!4474 lt!88710)))))

(declare-fun b!179514 () Bool)

(assert (=> b!179514 (= e!118246 e!118245)))

(assert (=> b!179514 (= lt!88711 (select (arr!3572 (_keys!5569 thiss!1248)) (index!4474 lt!88710)))))

(declare-fun c!32187 () Bool)

(assert (=> b!179514 (= c!32187 (= lt!88711 key!828))))

(assert (= (and d!54225 c!32185) b!179509))

(assert (= (and d!54225 (not c!32185)) b!179514))

(assert (= (and b!179514 c!32187) b!179513))

(assert (= (and b!179514 (not c!32187)) b!179511))

(assert (= (and b!179511 c!32186) b!179510))

(assert (= (and b!179511 (not c!32186)) b!179512))

(declare-fun m!207889 () Bool)

(assert (=> b!179512 m!207889))

(declare-fun m!207891 () Bool)

(assert (=> d!54225 m!207891))

(declare-fun m!207893 () Bool)

(assert (=> d!54225 m!207893))

(declare-fun m!207895 () Bool)

(assert (=> d!54225 m!207895))

(assert (=> d!54225 m!207827))

(declare-fun m!207897 () Bool)

(assert (=> d!54225 m!207897))

(declare-fun m!207899 () Bool)

(assert (=> d!54225 m!207899))

(assert (=> d!54225 m!207893))

(declare-fun m!207901 () Bool)

(assert (=> b!179514 m!207901))

(assert (=> b!179417 d!54225))

(declare-fun d!54227 () Bool)

(declare-fun e!118252 () Bool)

(assert (=> d!54227 e!118252))

(declare-fun res!85027 () Bool)

(assert (=> d!54227 (=> res!85027 e!118252)))

(declare-fun lt!88722 () Bool)

(assert (=> d!54227 (= res!85027 (not lt!88722))))

(declare-fun lt!88721 () Bool)

(assert (=> d!54227 (= lt!88722 lt!88721)))

(declare-datatypes ((Unit!5463 0))(
  ( (Unit!5464) )
))
(declare-fun lt!88723 () Unit!5463)

(declare-fun e!118251 () Unit!5463)

(assert (=> d!54227 (= lt!88723 e!118251)))

(declare-fun c!32190 () Bool)

(assert (=> d!54227 (= c!32190 lt!88721)))

(declare-fun containsKey!206 (List!2249 (_ BitVec 64)) Bool)

(assert (=> d!54227 (= lt!88721 (containsKey!206 (toList!1124 (getCurrentListMap!779 (_keys!5569 thiss!1248) (_values!3665 thiss!1248) (mask!8663 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248))) key!828))))

(assert (=> d!54227 (= (contains!1209 (getCurrentListMap!779 (_keys!5569 thiss!1248) (_values!3665 thiss!1248) (mask!8663 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)) key!828) lt!88722)))

(declare-fun b!179521 () Bool)

(declare-fun lt!88720 () Unit!5463)

(assert (=> b!179521 (= e!118251 lt!88720)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!154 (List!2249 (_ BitVec 64)) Unit!5463)

(assert (=> b!179521 (= lt!88720 (lemmaContainsKeyImpliesGetValueByKeyDefined!154 (toList!1124 (getCurrentListMap!779 (_keys!5569 thiss!1248) (_values!3665 thiss!1248) (mask!8663 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248))) key!828))))

(declare-datatypes ((Option!209 0))(
  ( (Some!208 (v!4033 V!5241)) (None!207) )
))
(declare-fun isDefined!155 (Option!209) Bool)

(declare-fun getValueByKey!203 (List!2249 (_ BitVec 64)) Option!209)

(assert (=> b!179521 (isDefined!155 (getValueByKey!203 (toList!1124 (getCurrentListMap!779 (_keys!5569 thiss!1248) (_values!3665 thiss!1248) (mask!8663 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248))) key!828))))

(declare-fun b!179522 () Bool)

(declare-fun Unit!5465 () Unit!5463)

(assert (=> b!179522 (= e!118251 Unit!5465)))

(declare-fun b!179523 () Bool)

(assert (=> b!179523 (= e!118252 (isDefined!155 (getValueByKey!203 (toList!1124 (getCurrentListMap!779 (_keys!5569 thiss!1248) (_values!3665 thiss!1248) (mask!8663 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248))) key!828)))))

(assert (= (and d!54227 c!32190) b!179521))

(assert (= (and d!54227 (not c!32190)) b!179522))

(assert (= (and d!54227 (not res!85027)) b!179523))

(declare-fun m!207903 () Bool)

(assert (=> d!54227 m!207903))

(declare-fun m!207905 () Bool)

(assert (=> b!179521 m!207905))

(declare-fun m!207907 () Bool)

(assert (=> b!179521 m!207907))

(assert (=> b!179521 m!207907))

(declare-fun m!207909 () Bool)

(assert (=> b!179521 m!207909))

(assert (=> b!179523 m!207907))

(assert (=> b!179523 m!207907))

(assert (=> b!179523 m!207909))

(assert (=> b!179421 d!54227))

(declare-fun b!179566 () Bool)

(declare-fun c!32208 () Bool)

(assert (=> b!179566 (= c!32208 (and (not (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!118290 () ListLongMap!2217)

(declare-fun e!118286 () ListLongMap!2217)

(assert (=> b!179566 (= e!118290 e!118286)))

(declare-fun bm!18121 () Bool)

(declare-fun call!18125 () ListLongMap!2217)

(declare-fun getCurrentListMapNoExtraKeys!178 (array!7541 array!7543 (_ BitVec 32) (_ BitVec 32) V!5241 V!5241 (_ BitVec 32) Int) ListLongMap!2217)

(assert (=> bm!18121 (= call!18125 (getCurrentListMapNoExtraKeys!178 (_keys!5569 thiss!1248) (_values!3665 thiss!1248) (mask!8663 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)))))

(declare-fun b!179568 () Bool)

(declare-fun e!118282 () Unit!5463)

(declare-fun lt!88785 () Unit!5463)

(assert (=> b!179568 (= e!118282 lt!88785)))

(declare-fun lt!88781 () ListLongMap!2217)

(assert (=> b!179568 (= lt!88781 (getCurrentListMapNoExtraKeys!178 (_keys!5569 thiss!1248) (_values!3665 thiss!1248) (mask!8663 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)))))

(declare-fun lt!88789 () (_ BitVec 64))

(assert (=> b!179568 (= lt!88789 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88787 () (_ BitVec 64))

(assert (=> b!179568 (= lt!88787 (select (arr!3572 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88779 () Unit!5463)

(declare-fun addStillContains!123 (ListLongMap!2217 (_ BitVec 64) V!5241 (_ BitVec 64)) Unit!5463)

(assert (=> b!179568 (= lt!88779 (addStillContains!123 lt!88781 lt!88789 (zeroValue!3523 thiss!1248) lt!88787))))

(declare-fun +!264 (ListLongMap!2217 tuple2!3284) ListLongMap!2217)

(assert (=> b!179568 (contains!1209 (+!264 lt!88781 (tuple2!3285 lt!88789 (zeroValue!3523 thiss!1248))) lt!88787)))

(declare-fun lt!88786 () Unit!5463)

(assert (=> b!179568 (= lt!88786 lt!88779)))

(declare-fun lt!88768 () ListLongMap!2217)

(assert (=> b!179568 (= lt!88768 (getCurrentListMapNoExtraKeys!178 (_keys!5569 thiss!1248) (_values!3665 thiss!1248) (mask!8663 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)))))

(declare-fun lt!88771 () (_ BitVec 64))

(assert (=> b!179568 (= lt!88771 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88775 () (_ BitVec 64))

(assert (=> b!179568 (= lt!88775 (select (arr!3572 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88778 () Unit!5463)

(declare-fun addApplyDifferent!123 (ListLongMap!2217 (_ BitVec 64) V!5241 (_ BitVec 64)) Unit!5463)

(assert (=> b!179568 (= lt!88778 (addApplyDifferent!123 lt!88768 lt!88771 (minValue!3523 thiss!1248) lt!88775))))

(declare-fun apply!147 (ListLongMap!2217 (_ BitVec 64)) V!5241)

(assert (=> b!179568 (= (apply!147 (+!264 lt!88768 (tuple2!3285 lt!88771 (minValue!3523 thiss!1248))) lt!88775) (apply!147 lt!88768 lt!88775))))

(declare-fun lt!88776 () Unit!5463)

(assert (=> b!179568 (= lt!88776 lt!88778)))

(declare-fun lt!88770 () ListLongMap!2217)

(assert (=> b!179568 (= lt!88770 (getCurrentListMapNoExtraKeys!178 (_keys!5569 thiss!1248) (_values!3665 thiss!1248) (mask!8663 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)))))

(declare-fun lt!88788 () (_ BitVec 64))

(assert (=> b!179568 (= lt!88788 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88782 () (_ BitVec 64))

(assert (=> b!179568 (= lt!88782 (select (arr!3572 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88783 () Unit!5463)

(assert (=> b!179568 (= lt!88783 (addApplyDifferent!123 lt!88770 lt!88788 (zeroValue!3523 thiss!1248) lt!88782))))

(assert (=> b!179568 (= (apply!147 (+!264 lt!88770 (tuple2!3285 lt!88788 (zeroValue!3523 thiss!1248))) lt!88782) (apply!147 lt!88770 lt!88782))))

(declare-fun lt!88769 () Unit!5463)

(assert (=> b!179568 (= lt!88769 lt!88783)))

(declare-fun lt!88784 () ListLongMap!2217)

(assert (=> b!179568 (= lt!88784 (getCurrentListMapNoExtraKeys!178 (_keys!5569 thiss!1248) (_values!3665 thiss!1248) (mask!8663 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)))))

(declare-fun lt!88772 () (_ BitVec 64))

(assert (=> b!179568 (= lt!88772 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88777 () (_ BitVec 64))

(assert (=> b!179568 (= lt!88777 (select (arr!3572 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179568 (= lt!88785 (addApplyDifferent!123 lt!88784 lt!88772 (minValue!3523 thiss!1248) lt!88777))))

(assert (=> b!179568 (= (apply!147 (+!264 lt!88784 (tuple2!3285 lt!88772 (minValue!3523 thiss!1248))) lt!88777) (apply!147 lt!88784 lt!88777))))

(declare-fun b!179569 () Bool)

(declare-fun e!118284 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!179569 (= e!118284 (validKeyInArray!0 (select (arr!3572 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun call!18128 () ListLongMap!2217)

(declare-fun call!18126 () ListLongMap!2217)

(declare-fun c!32205 () Bool)

(declare-fun bm!18122 () Bool)

(declare-fun call!18124 () ListLongMap!2217)

(declare-fun c!32206 () Bool)

(assert (=> bm!18122 (= call!18128 (+!264 (ite c!32206 call!18125 (ite c!32205 call!18126 call!18124)) (ite (or c!32206 c!32205) (tuple2!3285 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3523 thiss!1248)) (tuple2!3285 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3523 thiss!1248)))))))

(declare-fun b!179570 () Bool)

(declare-fun e!118288 () Bool)

(declare-fun call!18127 () Bool)

(assert (=> b!179570 (= e!118288 (not call!18127))))

(declare-fun b!179571 () Bool)

(declare-fun call!18129 () ListLongMap!2217)

(assert (=> b!179571 (= e!118290 call!18129)))

(declare-fun b!179572 () Bool)

(declare-fun e!118289 () Bool)

(declare-fun lt!88780 () ListLongMap!2217)

(assert (=> b!179572 (= e!118289 (= (apply!147 lt!88780 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3523 thiss!1248)))))

(declare-fun b!179567 () Bool)

(declare-fun res!85049 () Bool)

(declare-fun e!118281 () Bool)

(assert (=> b!179567 (=> (not res!85049) (not e!118281))))

(assert (=> b!179567 (= res!85049 e!118288)))

(declare-fun c!32204 () Bool)

(assert (=> b!179567 (= c!32204 (not (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!54229 () Bool)

(assert (=> d!54229 e!118281))

(declare-fun res!85048 () Bool)

(assert (=> d!54229 (=> (not res!85048) (not e!118281))))

(assert (=> d!54229 (= res!85048 (or (bvsge #b00000000000000000000000000000000 (size!3880 (_keys!5569 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3880 (_keys!5569 thiss!1248))))))))

(declare-fun lt!88774 () ListLongMap!2217)

(assert (=> d!54229 (= lt!88780 lt!88774)))

(declare-fun lt!88773 () Unit!5463)

(assert (=> d!54229 (= lt!88773 e!118282)))

(declare-fun c!32207 () Bool)

(declare-fun e!118291 () Bool)

(assert (=> d!54229 (= c!32207 e!118291)))

(declare-fun res!85051 () Bool)

(assert (=> d!54229 (=> (not res!85051) (not e!118291))))

(assert (=> d!54229 (= res!85051 (bvslt #b00000000000000000000000000000000 (size!3880 (_keys!5569 thiss!1248))))))

(declare-fun e!118283 () ListLongMap!2217)

(assert (=> d!54229 (= lt!88774 e!118283)))

(assert (=> d!54229 (= c!32206 (and (not (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54229 (validMask!0 (mask!8663 thiss!1248))))

(assert (=> d!54229 (= (getCurrentListMap!779 (_keys!5569 thiss!1248) (_values!3665 thiss!1248) (mask!8663 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)) lt!88780)))

(declare-fun b!179573 () Bool)

(assert (=> b!179573 (= e!118283 (+!264 call!18128 (tuple2!3285 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3523 thiss!1248))))))

(declare-fun bm!18123 () Bool)

(assert (=> bm!18123 (= call!18126 call!18125)))

(declare-fun bm!18124 () Bool)

(assert (=> bm!18124 (= call!18129 call!18128)))

(declare-fun b!179574 () Bool)

(declare-fun e!118285 () Bool)

(assert (=> b!179574 (= e!118288 e!118285)))

(declare-fun res!85052 () Bool)

(assert (=> b!179574 (= res!85052 call!18127)))

(assert (=> b!179574 (=> (not res!85052) (not e!118285))))

(declare-fun b!179575 () Bool)

(assert (=> b!179575 (= e!118286 call!18124)))

(declare-fun bm!18125 () Bool)

(declare-fun call!18130 () Bool)

(assert (=> bm!18125 (= call!18130 (contains!1209 lt!88780 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179576 () Bool)

(declare-fun e!118279 () Bool)

(assert (=> b!179576 (= e!118279 e!118289)))

(declare-fun res!85053 () Bool)

(assert (=> b!179576 (= res!85053 call!18130)))

(assert (=> b!179576 (=> (not res!85053) (not e!118289))))

(declare-fun b!179577 () Bool)

(declare-fun e!118287 () Bool)

(declare-fun get!2056 (ValueCell!1754 V!5241) V!5241)

(declare-fun dynLambda!490 (Int (_ BitVec 64)) V!5241)

(assert (=> b!179577 (= e!118287 (= (apply!147 lt!88780 (select (arr!3572 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000)) (get!2056 (select (arr!3573 (_values!3665 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!490 (defaultEntry!3682 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!179577 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3881 (_values!3665 thiss!1248))))))

(assert (=> b!179577 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3880 (_keys!5569 thiss!1248))))))

(declare-fun b!179578 () Bool)

(assert (=> b!179578 (= e!118286 call!18129)))

(declare-fun b!179579 () Bool)

(assert (=> b!179579 (= e!118283 e!118290)))

(assert (=> b!179579 (= c!32205 (and (not (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!179580 () Bool)

(assert (=> b!179580 (= e!118285 (= (apply!147 lt!88780 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3523 thiss!1248)))))

(declare-fun bm!18126 () Bool)

(assert (=> bm!18126 (= call!18124 call!18126)))

(declare-fun b!179581 () Bool)

(declare-fun Unit!5466 () Unit!5463)

(assert (=> b!179581 (= e!118282 Unit!5466)))

(declare-fun b!179582 () Bool)

(assert (=> b!179582 (= e!118281 e!118279)))

(declare-fun c!32203 () Bool)

(assert (=> b!179582 (= c!32203 (not (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!179583 () Bool)

(assert (=> b!179583 (= e!118279 (not call!18130))))

(declare-fun b!179584 () Bool)

(assert (=> b!179584 (= e!118291 (validKeyInArray!0 (select (arr!3572 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179585 () Bool)

(declare-fun res!85046 () Bool)

(assert (=> b!179585 (=> (not res!85046) (not e!118281))))

(declare-fun e!118280 () Bool)

(assert (=> b!179585 (= res!85046 e!118280)))

(declare-fun res!85054 () Bool)

(assert (=> b!179585 (=> res!85054 e!118280)))

(assert (=> b!179585 (= res!85054 (not e!118284))))

(declare-fun res!85050 () Bool)

(assert (=> b!179585 (=> (not res!85050) (not e!118284))))

(assert (=> b!179585 (= res!85050 (bvslt #b00000000000000000000000000000000 (size!3880 (_keys!5569 thiss!1248))))))

(declare-fun b!179586 () Bool)

(assert (=> b!179586 (= e!118280 e!118287)))

(declare-fun res!85047 () Bool)

(assert (=> b!179586 (=> (not res!85047) (not e!118287))))

(assert (=> b!179586 (= res!85047 (contains!1209 lt!88780 (select (arr!3572 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!179586 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3880 (_keys!5569 thiss!1248))))))

(declare-fun bm!18127 () Bool)

(assert (=> bm!18127 (= call!18127 (contains!1209 lt!88780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!54229 c!32206) b!179573))

(assert (= (and d!54229 (not c!32206)) b!179579))

(assert (= (and b!179579 c!32205) b!179571))

(assert (= (and b!179579 (not c!32205)) b!179566))

(assert (= (and b!179566 c!32208) b!179578))

(assert (= (and b!179566 (not c!32208)) b!179575))

(assert (= (or b!179578 b!179575) bm!18126))

(assert (= (or b!179571 bm!18126) bm!18123))

(assert (= (or b!179571 b!179578) bm!18124))

(assert (= (or b!179573 bm!18123) bm!18121))

(assert (= (or b!179573 bm!18124) bm!18122))

(assert (= (and d!54229 res!85051) b!179584))

(assert (= (and d!54229 c!32207) b!179568))

(assert (= (and d!54229 (not c!32207)) b!179581))

(assert (= (and d!54229 res!85048) b!179585))

(assert (= (and b!179585 res!85050) b!179569))

(assert (= (and b!179585 (not res!85054)) b!179586))

(assert (= (and b!179586 res!85047) b!179577))

(assert (= (and b!179585 res!85046) b!179567))

(assert (= (and b!179567 c!32204) b!179574))

(assert (= (and b!179567 (not c!32204)) b!179570))

(assert (= (and b!179574 res!85052) b!179580))

(assert (= (or b!179574 b!179570) bm!18127))

(assert (= (and b!179567 res!85049) b!179582))

(assert (= (and b!179582 c!32203) b!179576))

(assert (= (and b!179582 (not c!32203)) b!179583))

(assert (= (and b!179576 res!85053) b!179572))

(assert (= (or b!179576 b!179583) bm!18125))

(declare-fun b_lambda!7133 () Bool)

(assert (=> (not b_lambda!7133) (not b!179577)))

(declare-fun t!7087 () Bool)

(declare-fun tb!2797 () Bool)

(assert (=> (and b!179415 (= (defaultEntry!3682 thiss!1248) (defaultEntry!3682 thiss!1248)) t!7087) tb!2797))

(declare-fun result!4681 () Bool)

(assert (=> tb!2797 (= result!4681 tp_is_empty!4195)))

(assert (=> b!179577 t!7087))

(declare-fun b_and!10973 () Bool)

(assert (= b_and!10967 (and (=> t!7087 result!4681) b_and!10973)))

(declare-fun m!207911 () Bool)

(assert (=> bm!18125 m!207911))

(declare-fun m!207913 () Bool)

(assert (=> b!179568 m!207913))

(declare-fun m!207915 () Bool)

(assert (=> b!179568 m!207915))

(declare-fun m!207917 () Bool)

(assert (=> b!179568 m!207917))

(declare-fun m!207919 () Bool)

(assert (=> b!179568 m!207919))

(declare-fun m!207921 () Bool)

(assert (=> b!179568 m!207921))

(declare-fun m!207923 () Bool)

(assert (=> b!179568 m!207923))

(declare-fun m!207925 () Bool)

(assert (=> b!179568 m!207925))

(declare-fun m!207927 () Bool)

(assert (=> b!179568 m!207927))

(declare-fun m!207929 () Bool)

(assert (=> b!179568 m!207929))

(declare-fun m!207931 () Bool)

(assert (=> b!179568 m!207931))

(declare-fun m!207933 () Bool)

(assert (=> b!179568 m!207933))

(assert (=> b!179568 m!207915))

(declare-fun m!207935 () Bool)

(assert (=> b!179568 m!207935))

(assert (=> b!179568 m!207917))

(declare-fun m!207937 () Bool)

(assert (=> b!179568 m!207937))

(declare-fun m!207939 () Bool)

(assert (=> b!179568 m!207939))

(assert (=> b!179568 m!207929))

(declare-fun m!207941 () Bool)

(assert (=> b!179568 m!207941))

(declare-fun m!207943 () Bool)

(assert (=> b!179568 m!207943))

(assert (=> b!179568 m!207927))

(declare-fun m!207945 () Bool)

(assert (=> b!179568 m!207945))

(declare-fun m!207947 () Bool)

(assert (=> bm!18127 m!207947))

(declare-fun m!207949 () Bool)

(assert (=> bm!18122 m!207949))

(assert (=> bm!18121 m!207941))

(assert (=> b!179584 m!207923))

(assert (=> b!179584 m!207923))

(declare-fun m!207951 () Bool)

(assert (=> b!179584 m!207951))

(assert (=> b!179586 m!207923))

(assert (=> b!179586 m!207923))

(declare-fun m!207953 () Bool)

(assert (=> b!179586 m!207953))

(declare-fun m!207955 () Bool)

(assert (=> b!179573 m!207955))

(assert (=> b!179569 m!207923))

(assert (=> b!179569 m!207923))

(assert (=> b!179569 m!207951))

(declare-fun m!207957 () Bool)

(assert (=> b!179577 m!207957))

(assert (=> b!179577 m!207923))

(assert (=> b!179577 m!207957))

(declare-fun m!207959 () Bool)

(assert (=> b!179577 m!207959))

(declare-fun m!207961 () Bool)

(assert (=> b!179577 m!207961))

(assert (=> b!179577 m!207923))

(declare-fun m!207963 () Bool)

(assert (=> b!179577 m!207963))

(assert (=> b!179577 m!207959))

(assert (=> d!54229 m!207827))

(declare-fun m!207965 () Bool)

(assert (=> b!179580 m!207965))

(declare-fun m!207967 () Bool)

(assert (=> b!179572 m!207967))

(assert (=> b!179421 d!54229))

(declare-fun b!179597 () Bool)

(declare-fun e!118298 () Bool)

(declare-fun call!18133 () Bool)

(assert (=> b!179597 (= e!118298 call!18133)))

(declare-fun b!179598 () Bool)

(declare-fun e!118300 () Bool)

(assert (=> b!179598 (= e!118300 e!118298)))

(declare-fun lt!88798 () (_ BitVec 64))

(assert (=> b!179598 (= lt!88798 (select (arr!3572 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88796 () Unit!5463)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7541 (_ BitVec 64) (_ BitVec 32)) Unit!5463)

(assert (=> b!179598 (= lt!88796 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5569 thiss!1248) lt!88798 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!179598 (arrayContainsKey!0 (_keys!5569 thiss!1248) lt!88798 #b00000000000000000000000000000000)))

(declare-fun lt!88797 () Unit!5463)

(assert (=> b!179598 (= lt!88797 lt!88796)))

(declare-fun res!85059 () Bool)

(assert (=> b!179598 (= res!85059 (= (seekEntryOrOpen!0 (select (arr!3572 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000) (_keys!5569 thiss!1248) (mask!8663 thiss!1248)) (Found!576 #b00000000000000000000000000000000)))))

(assert (=> b!179598 (=> (not res!85059) (not e!118298))))

(declare-fun bm!18130 () Bool)

(assert (=> bm!18130 (= call!18133 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5569 thiss!1248) (mask!8663 thiss!1248)))))

(declare-fun b!179599 () Bool)

(declare-fun e!118299 () Bool)

(assert (=> b!179599 (= e!118299 e!118300)))

(declare-fun c!32211 () Bool)

(assert (=> b!179599 (= c!32211 (validKeyInArray!0 (select (arr!3572 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54231 () Bool)

(declare-fun res!85060 () Bool)

(assert (=> d!54231 (=> res!85060 e!118299)))

(assert (=> d!54231 (= res!85060 (bvsge #b00000000000000000000000000000000 (size!3880 (_keys!5569 thiss!1248))))))

(assert (=> d!54231 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5569 thiss!1248) (mask!8663 thiss!1248)) e!118299)))

(declare-fun b!179600 () Bool)

(assert (=> b!179600 (= e!118300 call!18133)))

(assert (= (and d!54231 (not res!85060)) b!179599))

(assert (= (and b!179599 c!32211) b!179598))

(assert (= (and b!179599 (not c!32211)) b!179600))

(assert (= (and b!179598 res!85059) b!179597))

(assert (= (or b!179597 b!179600) bm!18130))

(assert (=> b!179598 m!207923))

(declare-fun m!207969 () Bool)

(assert (=> b!179598 m!207969))

(declare-fun m!207971 () Bool)

(assert (=> b!179598 m!207971))

(assert (=> b!179598 m!207923))

(declare-fun m!207973 () Bool)

(assert (=> b!179598 m!207973))

(declare-fun m!207975 () Bool)

(assert (=> bm!18130 m!207975))

(assert (=> b!179599 m!207923))

(assert (=> b!179599 m!207923))

(assert (=> b!179599 m!207951))

(assert (=> b!179412 d!54231))

(declare-fun b!179611 () Bool)

(declare-fun e!118312 () Bool)

(declare-fun call!18136 () Bool)

(assert (=> b!179611 (= e!118312 call!18136)))

(declare-fun d!54233 () Bool)

(declare-fun res!85068 () Bool)

(declare-fun e!118311 () Bool)

(assert (=> d!54233 (=> res!85068 e!118311)))

(assert (=> d!54233 (= res!85068 (bvsge #b00000000000000000000000000000000 (size!3880 (_keys!5569 thiss!1248))))))

(assert (=> d!54233 (= (arrayNoDuplicates!0 (_keys!5569 thiss!1248) #b00000000000000000000000000000000 Nil!2245) e!118311)))

(declare-fun b!179612 () Bool)

(assert (=> b!179612 (= e!118312 call!18136)))

(declare-fun b!179613 () Bool)

(declare-fun e!118309 () Bool)

(assert (=> b!179613 (= e!118311 e!118309)))

(declare-fun res!85069 () Bool)

(assert (=> b!179613 (=> (not res!85069) (not e!118309))))

(declare-fun e!118310 () Bool)

(assert (=> b!179613 (= res!85069 (not e!118310))))

(declare-fun res!85067 () Bool)

(assert (=> b!179613 (=> (not res!85067) (not e!118310))))

(assert (=> b!179613 (= res!85067 (validKeyInArray!0 (select (arr!3572 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179614 () Bool)

(declare-fun contains!1210 (List!2248 (_ BitVec 64)) Bool)

(assert (=> b!179614 (= e!118310 (contains!1210 Nil!2245 (select (arr!3572 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18133 () Bool)

(declare-fun c!32214 () Bool)

(assert (=> bm!18133 (= call!18136 (arrayNoDuplicates!0 (_keys!5569 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32214 (Cons!2244 (select (arr!3572 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000) Nil!2245) Nil!2245)))))

(declare-fun b!179615 () Bool)

(assert (=> b!179615 (= e!118309 e!118312)))

(assert (=> b!179615 (= c!32214 (validKeyInArray!0 (select (arr!3572 (_keys!5569 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54233 (not res!85068)) b!179613))

(assert (= (and b!179613 res!85067) b!179614))

(assert (= (and b!179613 res!85069) b!179615))

(assert (= (and b!179615 c!32214) b!179611))

(assert (= (and b!179615 (not c!32214)) b!179612))

(assert (= (or b!179611 b!179612) bm!18133))

(assert (=> b!179613 m!207923))

(assert (=> b!179613 m!207923))

(assert (=> b!179613 m!207951))

(assert (=> b!179614 m!207923))

(assert (=> b!179614 m!207923))

(declare-fun m!207977 () Bool)

(assert (=> b!179614 m!207977))

(assert (=> bm!18133 m!207923))

(declare-fun m!207979 () Bool)

(assert (=> bm!18133 m!207979))

(assert (=> b!179615 m!207923))

(assert (=> b!179615 m!207923))

(assert (=> b!179615 m!207951))

(assert (=> b!179416 d!54233))

(declare-fun b!179622 () Bool)

(declare-fun e!118318 () Bool)

(assert (=> b!179622 (= e!118318 tp_is_empty!4195)))

(declare-fun condMapEmpty!7189 () Bool)

(declare-fun mapDefault!7189 () ValueCell!1754)

(assert (=> mapNonEmpty!7180 (= condMapEmpty!7189 (= mapRest!7180 ((as const (Array (_ BitVec 32) ValueCell!1754)) mapDefault!7189)))))

(declare-fun e!118317 () Bool)

(declare-fun mapRes!7189 () Bool)

(assert (=> mapNonEmpty!7180 (= tp!15993 (and e!118317 mapRes!7189))))

(declare-fun mapIsEmpty!7189 () Bool)

(assert (=> mapIsEmpty!7189 mapRes!7189))

(declare-fun b!179623 () Bool)

(assert (=> b!179623 (= e!118317 tp_is_empty!4195)))

(declare-fun mapNonEmpty!7189 () Bool)

(declare-fun tp!16009 () Bool)

(assert (=> mapNonEmpty!7189 (= mapRes!7189 (and tp!16009 e!118318))))

(declare-fun mapKey!7189 () (_ BitVec 32))

(declare-fun mapValue!7189 () ValueCell!1754)

(declare-fun mapRest!7189 () (Array (_ BitVec 32) ValueCell!1754))

(assert (=> mapNonEmpty!7189 (= mapRest!7180 (store mapRest!7189 mapKey!7189 mapValue!7189))))

(assert (= (and mapNonEmpty!7180 condMapEmpty!7189) mapIsEmpty!7189))

(assert (= (and mapNonEmpty!7180 (not condMapEmpty!7189)) mapNonEmpty!7189))

(assert (= (and mapNonEmpty!7189 ((_ is ValueCellFull!1754) mapValue!7189)) b!179622))

(assert (= (and mapNonEmpty!7180 ((_ is ValueCellFull!1754) mapDefault!7189)) b!179623))

(declare-fun m!207981 () Bool)

(assert (=> mapNonEmpty!7189 m!207981))

(declare-fun b_lambda!7135 () Bool)

(assert (= b_lambda!7133 (or (and b!179415 b_free!4423) b_lambda!7135)))

(check-sat (not b!179613) (not b!179614) (not b!179580) (not b!179573) (not b!179523) (not b!179615) (not b_next!4423) b_and!10973 (not b!179569) (not b!179599) (not b!179521) (not bm!18122) (not d!54225) (not b!179584) (not mapNonEmpty!7189) (not b!179495) (not b!179512) (not b!179577) (not b!179586) (not bm!18130) (not bm!18127) (not d!54229) (not d!54221) (not bm!18133) (not b!179496) tp_is_empty!4195 (not bm!18125) (not b!179568) (not d!54227) (not b!179598) (not b!179494) (not b_lambda!7135) (not b!179572) (not bm!18121))
(check-sat b_and!10973 (not b_next!4423))
