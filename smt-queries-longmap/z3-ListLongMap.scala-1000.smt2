; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21590 () Bool)

(assert start!21590)

(declare-fun b!216165 () Bool)

(declare-fun b_free!5749 () Bool)

(declare-fun b_next!5749 () Bool)

(assert (=> b!216165 (= b_free!5749 (not b_next!5749))))

(declare-fun tp!20378 () Bool)

(declare-fun b_and!12613 () Bool)

(assert (=> b!216165 (= tp!20378 b_and!12613)))

(declare-fun b!216161 () Bool)

(declare-fun e!140635 () Bool)

(declare-fun e!140636 () Bool)

(assert (=> b!216161 (= e!140635 e!140636)))

(declare-fun res!105673 () Bool)

(assert (=> b!216161 (=> (not res!105673) (not e!140636))))

(declare-datatypes ((SeekEntryResult!737 0))(
  ( (MissingZero!737 (index!5118 (_ BitVec 32))) (Found!737 (index!5119 (_ BitVec 32))) (Intermediate!737 (undefined!1549 Bool) (index!5120 (_ BitVec 32)) (x!22616 (_ BitVec 32))) (Undefined!737) (MissingVacant!737 (index!5121 (_ BitVec 32))) )
))
(declare-fun lt!110960 () SeekEntryResult!737)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216161 (= res!105673 (or (= lt!110960 (MissingZero!737 index!297)) (= lt!110960 (MissingVacant!737 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7129 0))(
  ( (V!7130 (val!2850 Int)) )
))
(declare-datatypes ((ValueCell!2462 0))(
  ( (ValueCellFull!2462 (v!4862 V!7129)) (EmptyCell!2462) )
))
(declare-datatypes ((array!10451 0))(
  ( (array!10452 (arr!4947 (Array (_ BitVec 32) ValueCell!2462)) (size!5280 (_ BitVec 32))) )
))
(declare-datatypes ((array!10453 0))(
  ( (array!10454 (arr!4948 (Array (_ BitVec 32) (_ BitVec 64))) (size!5281 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2824 0))(
  ( (LongMapFixedSize!2825 (defaultEntry!4062 Int) (mask!9793 (_ BitVec 32)) (extraKeys!3799 (_ BitVec 32)) (zeroValue!3903 V!7129) (minValue!3903 V!7129) (_size!1461 (_ BitVec 32)) (_keys!6108 array!10453) (_values!4045 array!10451) (_vacant!1461 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2824)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10453 (_ BitVec 32)) SeekEntryResult!737)

(assert (=> b!216161 (= lt!110960 (seekEntryOrOpen!0 key!932 (_keys!6108 thiss!1504) (mask!9793 thiss!1504)))))

(declare-fun b!216162 () Bool)

(declare-fun e!140638 () Bool)

(declare-fun e!140639 () Bool)

(declare-fun mapRes!9576 () Bool)

(assert (=> b!216162 (= e!140638 (and e!140639 mapRes!9576))))

(declare-fun condMapEmpty!9576 () Bool)

(declare-fun mapDefault!9576 () ValueCell!2462)

(assert (=> b!216162 (= condMapEmpty!9576 (= (arr!4947 (_values!4045 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2462)) mapDefault!9576)))))

(declare-fun mapIsEmpty!9576 () Bool)

(assert (=> mapIsEmpty!9576 mapRes!9576))

(declare-fun b!216163 () Bool)

(declare-fun res!105676 () Bool)

(assert (=> b!216163 (=> (not res!105676) (not e!140636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10453 (_ BitVec 32)) Bool)

(assert (=> b!216163 (= res!105676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6108 thiss!1504) (mask!9793 thiss!1504)))))

(declare-fun tp_is_empty!5611 () Bool)

(declare-fun e!140637 () Bool)

(declare-fun array_inv!3255 (array!10453) Bool)

(declare-fun array_inv!3256 (array!10451) Bool)

(assert (=> b!216165 (= e!140637 (and tp!20378 tp_is_empty!5611 (array_inv!3255 (_keys!6108 thiss!1504)) (array_inv!3256 (_values!4045 thiss!1504)) e!140638))))

(declare-fun b!216166 () Bool)

(declare-fun res!105670 () Bool)

(assert (=> b!216166 (=> (not res!105670) (not e!140635))))

(assert (=> b!216166 (= res!105670 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216167 () Bool)

(assert (=> b!216167 (= e!140639 tp_is_empty!5611)))

(declare-fun b!216168 () Bool)

(declare-fun res!105674 () Bool)

(assert (=> b!216168 (=> (not res!105674) (not e!140636))))

(assert (=> b!216168 (= res!105674 (and (= (size!5280 (_values!4045 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9793 thiss!1504))) (= (size!5281 (_keys!6108 thiss!1504)) (size!5280 (_values!4045 thiss!1504))) (bvsge (mask!9793 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3799 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3799 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!105675 () Bool)

(assert (=> start!21590 (=> (not res!105675) (not e!140635))))

(declare-fun valid!1166 (LongMapFixedSize!2824) Bool)

(assert (=> start!21590 (= res!105675 (valid!1166 thiss!1504))))

(assert (=> start!21590 e!140635))

(assert (=> start!21590 e!140637))

(assert (=> start!21590 true))

(declare-fun b!216164 () Bool)

(assert (=> b!216164 (= e!140636 (bvsgt #b00000000000000000000000000000000 (size!5281 (_keys!6108 thiss!1504))))))

(declare-fun b!216169 () Bool)

(declare-fun res!105671 () Bool)

(assert (=> b!216169 (=> (not res!105671) (not e!140636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216169 (= res!105671 (validMask!0 (mask!9793 thiss!1504)))))

(declare-fun b!216170 () Bool)

(declare-fun res!105672 () Bool)

(assert (=> b!216170 (=> (not res!105672) (not e!140636))))

(declare-datatypes ((List!3129 0))(
  ( (Nil!3126) (Cons!3125 (h!3772 (_ BitVec 64)) (t!8075 List!3129)) )
))
(declare-fun arrayNoDuplicates!0 (array!10453 (_ BitVec 32) List!3129) Bool)

(assert (=> b!216170 (= res!105672 (arrayNoDuplicates!0 (_keys!6108 thiss!1504) #b00000000000000000000000000000000 Nil!3126))))

(declare-fun b!216171 () Bool)

(declare-fun e!140634 () Bool)

(assert (=> b!216171 (= e!140634 tp_is_empty!5611)))

(declare-fun mapNonEmpty!9576 () Bool)

(declare-fun tp!20379 () Bool)

(assert (=> mapNonEmpty!9576 (= mapRes!9576 (and tp!20379 e!140634))))

(declare-fun mapValue!9576 () ValueCell!2462)

(declare-fun mapRest!9576 () (Array (_ BitVec 32) ValueCell!2462))

(declare-fun mapKey!9576 () (_ BitVec 32))

(assert (=> mapNonEmpty!9576 (= (arr!4947 (_values!4045 thiss!1504)) (store mapRest!9576 mapKey!9576 mapValue!9576))))

(assert (= (and start!21590 res!105675) b!216166))

(assert (= (and b!216166 res!105670) b!216161))

(assert (= (and b!216161 res!105673) b!216169))

(assert (= (and b!216169 res!105671) b!216168))

(assert (= (and b!216168 res!105674) b!216163))

(assert (= (and b!216163 res!105676) b!216170))

(assert (= (and b!216170 res!105672) b!216164))

(assert (= (and b!216162 condMapEmpty!9576) mapIsEmpty!9576))

(assert (= (and b!216162 (not condMapEmpty!9576)) mapNonEmpty!9576))

(get-info :version)

(assert (= (and mapNonEmpty!9576 ((_ is ValueCellFull!2462) mapValue!9576)) b!216171))

(assert (= (and b!216162 ((_ is ValueCellFull!2462) mapDefault!9576)) b!216167))

(assert (= b!216165 b!216162))

(assert (= start!21590 b!216165))

(declare-fun m!242469 () Bool)

(assert (=> start!21590 m!242469))

(declare-fun m!242471 () Bool)

(assert (=> b!216165 m!242471))

(declare-fun m!242473 () Bool)

(assert (=> b!216165 m!242473))

(declare-fun m!242475 () Bool)

(assert (=> b!216169 m!242475))

(declare-fun m!242477 () Bool)

(assert (=> b!216161 m!242477))

(declare-fun m!242479 () Bool)

(assert (=> b!216170 m!242479))

(declare-fun m!242481 () Bool)

(assert (=> b!216163 m!242481))

(declare-fun m!242483 () Bool)

(assert (=> mapNonEmpty!9576 m!242483))

(check-sat (not b!216161) (not b_next!5749) tp_is_empty!5611 (not b!216170) (not b!216163) b_and!12613 (not b!216165) (not start!21590) (not b!216169) (not mapNonEmpty!9576))
(check-sat b_and!12613 (not b_next!5749))
(get-model)

(declare-fun b!216250 () Bool)

(declare-fun e!140690 () SeekEntryResult!737)

(declare-fun e!140689 () SeekEntryResult!737)

(assert (=> b!216250 (= e!140690 e!140689)))

(declare-fun lt!110974 () (_ BitVec 64))

(declare-fun lt!110975 () SeekEntryResult!737)

(assert (=> b!216250 (= lt!110974 (select (arr!4948 (_keys!6108 thiss!1504)) (index!5120 lt!110975)))))

(declare-fun c!36295 () Bool)

(assert (=> b!216250 (= c!36295 (= lt!110974 key!932))))

(declare-fun b!216251 () Bool)

(declare-fun c!36297 () Bool)

(assert (=> b!216251 (= c!36297 (= lt!110974 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140688 () SeekEntryResult!737)

(assert (=> b!216251 (= e!140689 e!140688)))

(declare-fun b!216252 () Bool)

(assert (=> b!216252 (= e!140688 (MissingZero!737 (index!5120 lt!110975)))))

(declare-fun d!58393 () Bool)

(declare-fun lt!110973 () SeekEntryResult!737)

(assert (=> d!58393 (and (or ((_ is Undefined!737) lt!110973) (not ((_ is Found!737) lt!110973)) (and (bvsge (index!5119 lt!110973) #b00000000000000000000000000000000) (bvslt (index!5119 lt!110973) (size!5281 (_keys!6108 thiss!1504))))) (or ((_ is Undefined!737) lt!110973) ((_ is Found!737) lt!110973) (not ((_ is MissingZero!737) lt!110973)) (and (bvsge (index!5118 lt!110973) #b00000000000000000000000000000000) (bvslt (index!5118 lt!110973) (size!5281 (_keys!6108 thiss!1504))))) (or ((_ is Undefined!737) lt!110973) ((_ is Found!737) lt!110973) ((_ is MissingZero!737) lt!110973) (not ((_ is MissingVacant!737) lt!110973)) (and (bvsge (index!5121 lt!110973) #b00000000000000000000000000000000) (bvslt (index!5121 lt!110973) (size!5281 (_keys!6108 thiss!1504))))) (or ((_ is Undefined!737) lt!110973) (ite ((_ is Found!737) lt!110973) (= (select (arr!4948 (_keys!6108 thiss!1504)) (index!5119 lt!110973)) key!932) (ite ((_ is MissingZero!737) lt!110973) (= (select (arr!4948 (_keys!6108 thiss!1504)) (index!5118 lt!110973)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!737) lt!110973) (= (select (arr!4948 (_keys!6108 thiss!1504)) (index!5121 lt!110973)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58393 (= lt!110973 e!140690)))

(declare-fun c!36296 () Bool)

(assert (=> d!58393 (= c!36296 (and ((_ is Intermediate!737) lt!110975) (undefined!1549 lt!110975)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10453 (_ BitVec 32)) SeekEntryResult!737)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58393 (= lt!110975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9793 thiss!1504)) key!932 (_keys!6108 thiss!1504) (mask!9793 thiss!1504)))))

(assert (=> d!58393 (validMask!0 (mask!9793 thiss!1504))))

(assert (=> d!58393 (= (seekEntryOrOpen!0 key!932 (_keys!6108 thiss!1504) (mask!9793 thiss!1504)) lt!110973)))

(declare-fun b!216253 () Bool)

(assert (=> b!216253 (= e!140689 (Found!737 (index!5120 lt!110975)))))

(declare-fun b!216254 () Bool)

(assert (=> b!216254 (= e!140690 Undefined!737)))

(declare-fun b!216255 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10453 (_ BitVec 32)) SeekEntryResult!737)

(assert (=> b!216255 (= e!140688 (seekKeyOrZeroReturnVacant!0 (x!22616 lt!110975) (index!5120 lt!110975) (index!5120 lt!110975) key!932 (_keys!6108 thiss!1504) (mask!9793 thiss!1504)))))

(assert (= (and d!58393 c!36296) b!216254))

(assert (= (and d!58393 (not c!36296)) b!216250))

(assert (= (and b!216250 c!36295) b!216253))

(assert (= (and b!216250 (not c!36295)) b!216251))

(assert (= (and b!216251 c!36297) b!216252))

(assert (= (and b!216251 (not c!36297)) b!216255))

(declare-fun m!242517 () Bool)

(assert (=> b!216250 m!242517))

(declare-fun m!242519 () Bool)

(assert (=> d!58393 m!242519))

(declare-fun m!242521 () Bool)

(assert (=> d!58393 m!242521))

(declare-fun m!242523 () Bool)

(assert (=> d!58393 m!242523))

(declare-fun m!242525 () Bool)

(assert (=> d!58393 m!242525))

(assert (=> d!58393 m!242475))

(assert (=> d!58393 m!242523))

(declare-fun m!242527 () Bool)

(assert (=> d!58393 m!242527))

(declare-fun m!242529 () Bool)

(assert (=> b!216255 m!242529))

(assert (=> b!216161 d!58393))

(declare-fun d!58395 () Bool)

(assert (=> d!58395 (= (array_inv!3255 (_keys!6108 thiss!1504)) (bvsge (size!5281 (_keys!6108 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216165 d!58395))

(declare-fun d!58397 () Bool)

(assert (=> d!58397 (= (array_inv!3256 (_values!4045 thiss!1504)) (bvsge (size!5280 (_values!4045 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216165 d!58397))

(declare-fun b!216266 () Bool)

(declare-fun e!140701 () Bool)

(declare-fun call!20355 () Bool)

(assert (=> b!216266 (= e!140701 call!20355)))

(declare-fun bm!20352 () Bool)

(declare-fun c!36300 () Bool)

(assert (=> bm!20352 (= call!20355 (arrayNoDuplicates!0 (_keys!6108 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36300 (Cons!3125 (select (arr!4948 (_keys!6108 thiss!1504)) #b00000000000000000000000000000000) Nil!3126) Nil!3126)))))

(declare-fun b!216267 () Bool)

(declare-fun e!140700 () Bool)

(declare-fun contains!1411 (List!3129 (_ BitVec 64)) Bool)

(assert (=> b!216267 (= e!140700 (contains!1411 Nil!3126 (select (arr!4948 (_keys!6108 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!216269 () Bool)

(assert (=> b!216269 (= e!140701 call!20355)))

(declare-fun b!216270 () Bool)

(declare-fun e!140699 () Bool)

(declare-fun e!140702 () Bool)

(assert (=> b!216270 (= e!140699 e!140702)))

(declare-fun res!105727 () Bool)

(assert (=> b!216270 (=> (not res!105727) (not e!140702))))

(assert (=> b!216270 (= res!105727 (not e!140700))))

(declare-fun res!105725 () Bool)

(assert (=> b!216270 (=> (not res!105725) (not e!140700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!216270 (= res!105725 (validKeyInArray!0 (select (arr!4948 (_keys!6108 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58399 () Bool)

(declare-fun res!105726 () Bool)

(assert (=> d!58399 (=> res!105726 e!140699)))

(assert (=> d!58399 (= res!105726 (bvsge #b00000000000000000000000000000000 (size!5281 (_keys!6108 thiss!1504))))))

(assert (=> d!58399 (= (arrayNoDuplicates!0 (_keys!6108 thiss!1504) #b00000000000000000000000000000000 Nil!3126) e!140699)))

(declare-fun b!216268 () Bool)

(assert (=> b!216268 (= e!140702 e!140701)))

(assert (=> b!216268 (= c!36300 (validKeyInArray!0 (select (arr!4948 (_keys!6108 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58399 (not res!105726)) b!216270))

(assert (= (and b!216270 res!105725) b!216267))

(assert (= (and b!216270 res!105727) b!216268))

(assert (= (and b!216268 c!36300) b!216269))

(assert (= (and b!216268 (not c!36300)) b!216266))

(assert (= (or b!216269 b!216266) bm!20352))

(declare-fun m!242531 () Bool)

(assert (=> bm!20352 m!242531))

(declare-fun m!242533 () Bool)

(assert (=> bm!20352 m!242533))

(assert (=> b!216267 m!242531))

(assert (=> b!216267 m!242531))

(declare-fun m!242535 () Bool)

(assert (=> b!216267 m!242535))

(assert (=> b!216270 m!242531))

(assert (=> b!216270 m!242531))

(declare-fun m!242537 () Bool)

(assert (=> b!216270 m!242537))

(assert (=> b!216268 m!242531))

(assert (=> b!216268 m!242531))

(assert (=> b!216268 m!242537))

(assert (=> b!216170 d!58399))

(declare-fun d!58401 () Bool)

(assert (=> d!58401 (= (validMask!0 (mask!9793 thiss!1504)) (and (or (= (mask!9793 thiss!1504) #b00000000000000000000000000000111) (= (mask!9793 thiss!1504) #b00000000000000000000000000001111) (= (mask!9793 thiss!1504) #b00000000000000000000000000011111) (= (mask!9793 thiss!1504) #b00000000000000000000000000111111) (= (mask!9793 thiss!1504) #b00000000000000000000000001111111) (= (mask!9793 thiss!1504) #b00000000000000000000000011111111) (= (mask!9793 thiss!1504) #b00000000000000000000000111111111) (= (mask!9793 thiss!1504) #b00000000000000000000001111111111) (= (mask!9793 thiss!1504) #b00000000000000000000011111111111) (= (mask!9793 thiss!1504) #b00000000000000000000111111111111) (= (mask!9793 thiss!1504) #b00000000000000000001111111111111) (= (mask!9793 thiss!1504) #b00000000000000000011111111111111) (= (mask!9793 thiss!1504) #b00000000000000000111111111111111) (= (mask!9793 thiss!1504) #b00000000000000001111111111111111) (= (mask!9793 thiss!1504) #b00000000000000011111111111111111) (= (mask!9793 thiss!1504) #b00000000000000111111111111111111) (= (mask!9793 thiss!1504) #b00000000000001111111111111111111) (= (mask!9793 thiss!1504) #b00000000000011111111111111111111) (= (mask!9793 thiss!1504) #b00000000000111111111111111111111) (= (mask!9793 thiss!1504) #b00000000001111111111111111111111) (= (mask!9793 thiss!1504) #b00000000011111111111111111111111) (= (mask!9793 thiss!1504) #b00000000111111111111111111111111) (= (mask!9793 thiss!1504) #b00000001111111111111111111111111) (= (mask!9793 thiss!1504) #b00000011111111111111111111111111) (= (mask!9793 thiss!1504) #b00000111111111111111111111111111) (= (mask!9793 thiss!1504) #b00001111111111111111111111111111) (= (mask!9793 thiss!1504) #b00011111111111111111111111111111) (= (mask!9793 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9793 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!216169 d!58401))

(declare-fun d!58403 () Bool)

(declare-fun res!105734 () Bool)

(declare-fun e!140705 () Bool)

(assert (=> d!58403 (=> (not res!105734) (not e!140705))))

(declare-fun simpleValid!223 (LongMapFixedSize!2824) Bool)

(assert (=> d!58403 (= res!105734 (simpleValid!223 thiss!1504))))

(assert (=> d!58403 (= (valid!1166 thiss!1504) e!140705)))

(declare-fun b!216277 () Bool)

(declare-fun res!105735 () Bool)

(assert (=> b!216277 (=> (not res!105735) (not e!140705))))

(declare-fun arrayCountValidKeys!0 (array!10453 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!216277 (= res!105735 (= (arrayCountValidKeys!0 (_keys!6108 thiss!1504) #b00000000000000000000000000000000 (size!5281 (_keys!6108 thiss!1504))) (_size!1461 thiss!1504)))))

(declare-fun b!216278 () Bool)

(declare-fun res!105736 () Bool)

(assert (=> b!216278 (=> (not res!105736) (not e!140705))))

(assert (=> b!216278 (= res!105736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6108 thiss!1504) (mask!9793 thiss!1504)))))

(declare-fun b!216279 () Bool)

(assert (=> b!216279 (= e!140705 (arrayNoDuplicates!0 (_keys!6108 thiss!1504) #b00000000000000000000000000000000 Nil!3126))))

(assert (= (and d!58403 res!105734) b!216277))

(assert (= (and b!216277 res!105735) b!216278))

(assert (= (and b!216278 res!105736) b!216279))

(declare-fun m!242539 () Bool)

(assert (=> d!58403 m!242539))

(declare-fun m!242541 () Bool)

(assert (=> b!216277 m!242541))

(assert (=> b!216278 m!242481))

(assert (=> b!216279 m!242479))

(assert (=> start!21590 d!58403))

(declare-fun b!216288 () Bool)

(declare-fun e!140713 () Bool)

(declare-fun e!140714 () Bool)

(assert (=> b!216288 (= e!140713 e!140714)))

(declare-fun lt!110983 () (_ BitVec 64))

(assert (=> b!216288 (= lt!110983 (select (arr!4948 (_keys!6108 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6464 0))(
  ( (Unit!6465) )
))
(declare-fun lt!110984 () Unit!6464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10453 (_ BitVec 64) (_ BitVec 32)) Unit!6464)

(assert (=> b!216288 (= lt!110984 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6108 thiss!1504) lt!110983 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!216288 (arrayContainsKey!0 (_keys!6108 thiss!1504) lt!110983 #b00000000000000000000000000000000)))

(declare-fun lt!110982 () Unit!6464)

(assert (=> b!216288 (= lt!110982 lt!110984)))

(declare-fun res!105742 () Bool)

(assert (=> b!216288 (= res!105742 (= (seekEntryOrOpen!0 (select (arr!4948 (_keys!6108 thiss!1504)) #b00000000000000000000000000000000) (_keys!6108 thiss!1504) (mask!9793 thiss!1504)) (Found!737 #b00000000000000000000000000000000)))))

(assert (=> b!216288 (=> (not res!105742) (not e!140714))))

(declare-fun d!58405 () Bool)

(declare-fun res!105741 () Bool)

(declare-fun e!140712 () Bool)

(assert (=> d!58405 (=> res!105741 e!140712)))

(assert (=> d!58405 (= res!105741 (bvsge #b00000000000000000000000000000000 (size!5281 (_keys!6108 thiss!1504))))))

(assert (=> d!58405 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6108 thiss!1504) (mask!9793 thiss!1504)) e!140712)))

(declare-fun b!216289 () Bool)

(assert (=> b!216289 (= e!140712 e!140713)))

(declare-fun c!36303 () Bool)

(assert (=> b!216289 (= c!36303 (validKeyInArray!0 (select (arr!4948 (_keys!6108 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!216290 () Bool)

(declare-fun call!20358 () Bool)

(assert (=> b!216290 (= e!140714 call!20358)))

(declare-fun bm!20355 () Bool)

(assert (=> bm!20355 (= call!20358 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6108 thiss!1504) (mask!9793 thiss!1504)))))

(declare-fun b!216291 () Bool)

(assert (=> b!216291 (= e!140713 call!20358)))

(assert (= (and d!58405 (not res!105741)) b!216289))

(assert (= (and b!216289 c!36303) b!216288))

(assert (= (and b!216289 (not c!36303)) b!216291))

(assert (= (and b!216288 res!105742) b!216290))

(assert (= (or b!216290 b!216291) bm!20355))

(assert (=> b!216288 m!242531))

(declare-fun m!242543 () Bool)

(assert (=> b!216288 m!242543))

(declare-fun m!242545 () Bool)

(assert (=> b!216288 m!242545))

(assert (=> b!216288 m!242531))

(declare-fun m!242547 () Bool)

(assert (=> b!216288 m!242547))

(assert (=> b!216289 m!242531))

(assert (=> b!216289 m!242531))

(assert (=> b!216289 m!242537))

(declare-fun m!242549 () Bool)

(assert (=> bm!20355 m!242549))

(assert (=> b!216163 d!58405))

(declare-fun mapNonEmpty!9585 () Bool)

(declare-fun mapRes!9585 () Bool)

(declare-fun tp!20394 () Bool)

(declare-fun e!140719 () Bool)

(assert (=> mapNonEmpty!9585 (= mapRes!9585 (and tp!20394 e!140719))))

(declare-fun mapKey!9585 () (_ BitVec 32))

(declare-fun mapRest!9585 () (Array (_ BitVec 32) ValueCell!2462))

(declare-fun mapValue!9585 () ValueCell!2462)

(assert (=> mapNonEmpty!9585 (= mapRest!9576 (store mapRest!9585 mapKey!9585 mapValue!9585))))

(declare-fun mapIsEmpty!9585 () Bool)

(assert (=> mapIsEmpty!9585 mapRes!9585))

(declare-fun b!216299 () Bool)

(declare-fun e!140720 () Bool)

(assert (=> b!216299 (= e!140720 tp_is_empty!5611)))

(declare-fun condMapEmpty!9585 () Bool)

(declare-fun mapDefault!9585 () ValueCell!2462)

(assert (=> mapNonEmpty!9576 (= condMapEmpty!9585 (= mapRest!9576 ((as const (Array (_ BitVec 32) ValueCell!2462)) mapDefault!9585)))))

(assert (=> mapNonEmpty!9576 (= tp!20379 (and e!140720 mapRes!9585))))

(declare-fun b!216298 () Bool)

(assert (=> b!216298 (= e!140719 tp_is_empty!5611)))

(assert (= (and mapNonEmpty!9576 condMapEmpty!9585) mapIsEmpty!9585))

(assert (= (and mapNonEmpty!9576 (not condMapEmpty!9585)) mapNonEmpty!9585))

(assert (= (and mapNonEmpty!9585 ((_ is ValueCellFull!2462) mapValue!9585)) b!216298))

(assert (= (and mapNonEmpty!9576 ((_ is ValueCellFull!2462) mapDefault!9585)) b!216299))

(declare-fun m!242551 () Bool)

(assert (=> mapNonEmpty!9585 m!242551))

(check-sat (not b!216277) (not b!216268) tp_is_empty!5611 (not b!216267) (not b!216270) (not d!58393) (not mapNonEmpty!9585) (not bm!20355) (not b!216279) (not d!58403) (not b!216278) (not b!216289) (not b_next!5749) (not bm!20352) (not b!216288) b_and!12613 (not b!216255))
(check-sat b_and!12613 (not b_next!5749))
