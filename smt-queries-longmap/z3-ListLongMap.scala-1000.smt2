; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21588 () Bool)

(assert start!21588)

(declare-fun b!216345 () Bool)

(declare-fun b_free!5751 () Bool)

(declare-fun b_next!5751 () Bool)

(assert (=> b!216345 (= b_free!5751 (not b_next!5751))))

(declare-fun tp!20384 () Bool)

(declare-fun b_and!12641 () Bool)

(assert (=> b!216345 (= tp!20384 b_and!12641)))

(declare-fun b!216341 () Bool)

(declare-fun res!105792 () Bool)

(declare-fun e!140755 () Bool)

(assert (=> b!216341 (=> (not res!105792) (not e!140755))))

(declare-datatypes ((V!7131 0))(
  ( (V!7132 (val!2851 Int)) )
))
(declare-datatypes ((ValueCell!2463 0))(
  ( (ValueCellFull!2463 (v!4869 V!7131)) (EmptyCell!2463) )
))
(declare-datatypes ((array!10463 0))(
  ( (array!10464 (arr!4954 (Array (_ BitVec 32) ValueCell!2463)) (size!5286 (_ BitVec 32))) )
))
(declare-datatypes ((array!10465 0))(
  ( (array!10466 (arr!4955 (Array (_ BitVec 32) (_ BitVec 64))) (size!5287 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2826 0))(
  ( (LongMapFixedSize!2827 (defaultEntry!4063 Int) (mask!9795 (_ BitVec 32)) (extraKeys!3800 (_ BitVec 32)) (zeroValue!3904 V!7131) (minValue!3904 V!7131) (_size!1462 (_ BitVec 32)) (_keys!6110 array!10465) (_values!4046 array!10463) (_vacant!1462 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2826)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10465 (_ BitVec 32)) Bool)

(assert (=> b!216341 (= res!105792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6110 thiss!1504) (mask!9795 thiss!1504)))))

(declare-fun b!216342 () Bool)

(declare-fun e!140759 () Bool)

(assert (=> b!216342 (= e!140759 e!140755)))

(declare-fun res!105791 () Bool)

(assert (=> b!216342 (=> (not res!105791) (not e!140755))))

(declare-datatypes ((SeekEntryResult!743 0))(
  ( (MissingZero!743 (index!5142 (_ BitVec 32))) (Found!743 (index!5143 (_ BitVec 32))) (Intermediate!743 (undefined!1555 Bool) (index!5144 (_ BitVec 32)) (x!22623 (_ BitVec 32))) (Undefined!743) (MissingVacant!743 (index!5145 (_ BitVec 32))) )
))
(declare-fun lt!111144 () SeekEntryResult!743)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216342 (= res!105791 (or (= lt!111144 (MissingZero!743 index!297)) (= lt!111144 (MissingVacant!743 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10465 (_ BitVec 32)) SeekEntryResult!743)

(assert (=> b!216342 (= lt!111144 (seekEntryOrOpen!0 key!932 (_keys!6110 thiss!1504) (mask!9795 thiss!1504)))))

(declare-fun b!216344 () Bool)

(declare-fun res!105786 () Bool)

(assert (=> b!216344 (=> (not res!105786) (not e!140759))))

(assert (=> b!216344 (= res!105786 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!140757 () Bool)

(declare-fun e!140761 () Bool)

(declare-fun tp_is_empty!5613 () Bool)

(declare-fun array_inv!3277 (array!10465) Bool)

(declare-fun array_inv!3278 (array!10463) Bool)

(assert (=> b!216345 (= e!140757 (and tp!20384 tp_is_empty!5613 (array_inv!3277 (_keys!6110 thiss!1504)) (array_inv!3278 (_values!4046 thiss!1504)) e!140761))))

(declare-fun b!216346 () Bool)

(declare-fun e!140760 () Bool)

(assert (=> b!216346 (= e!140760 tp_is_empty!5613)))

(declare-fun b!216347 () Bool)

(declare-fun e!140756 () Bool)

(assert (=> b!216347 (= e!140756 tp_is_empty!5613)))

(declare-fun mapIsEmpty!9579 () Bool)

(declare-fun mapRes!9579 () Bool)

(assert (=> mapIsEmpty!9579 mapRes!9579))

(declare-fun mapNonEmpty!9579 () Bool)

(declare-fun tp!20385 () Bool)

(assert (=> mapNonEmpty!9579 (= mapRes!9579 (and tp!20385 e!140756))))

(declare-fun mapValue!9579 () ValueCell!2463)

(declare-fun mapKey!9579 () (_ BitVec 32))

(declare-fun mapRest!9579 () (Array (_ BitVec 32) ValueCell!2463))

(assert (=> mapNonEmpty!9579 (= (arr!4954 (_values!4046 thiss!1504)) (store mapRest!9579 mapKey!9579 mapValue!9579))))

(declare-fun b!216348 () Bool)

(assert (=> b!216348 (= e!140761 (and e!140760 mapRes!9579))))

(declare-fun condMapEmpty!9579 () Bool)

(declare-fun mapDefault!9579 () ValueCell!2463)

(assert (=> b!216348 (= condMapEmpty!9579 (= (arr!4954 (_values!4046 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2463)) mapDefault!9579)))))

(declare-fun b!216343 () Bool)

(declare-fun res!105789 () Bool)

(assert (=> b!216343 (=> (not res!105789) (not e!140755))))

(assert (=> b!216343 (= res!105789 (and (= (size!5286 (_values!4046 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9795 thiss!1504))) (= (size!5287 (_keys!6110 thiss!1504)) (size!5286 (_values!4046 thiss!1504))) (bvsge (mask!9795 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3800 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3800 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!105790 () Bool)

(assert (=> start!21588 (=> (not res!105790) (not e!140759))))

(declare-fun valid!1148 (LongMapFixedSize!2826) Bool)

(assert (=> start!21588 (= res!105790 (valid!1148 thiss!1504))))

(assert (=> start!21588 e!140759))

(assert (=> start!21588 e!140757))

(assert (=> start!21588 true))

(declare-fun b!216349 () Bool)

(declare-fun res!105788 () Bool)

(assert (=> b!216349 (=> (not res!105788) (not e!140755))))

(declare-datatypes ((List!3145 0))(
  ( (Nil!3142) (Cons!3141 (h!3788 (_ BitVec 64)) (t!8100 List!3145)) )
))
(declare-fun arrayNoDuplicates!0 (array!10465 (_ BitVec 32) List!3145) Bool)

(assert (=> b!216349 (= res!105788 (arrayNoDuplicates!0 (_keys!6110 thiss!1504) #b00000000000000000000000000000000 Nil!3142))))

(declare-fun b!216350 () Bool)

(declare-fun res!105787 () Bool)

(assert (=> b!216350 (=> (not res!105787) (not e!140755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216350 (= res!105787 (validMask!0 (mask!9795 thiss!1504)))))

(declare-fun b!216351 () Bool)

(assert (=> b!216351 (= e!140755 (bvsgt #b00000000000000000000000000000000 (size!5287 (_keys!6110 thiss!1504))))))

(assert (= (and start!21588 res!105790) b!216344))

(assert (= (and b!216344 res!105786) b!216342))

(assert (= (and b!216342 res!105791) b!216350))

(assert (= (and b!216350 res!105787) b!216343))

(assert (= (and b!216343 res!105789) b!216341))

(assert (= (and b!216341 res!105792) b!216349))

(assert (= (and b!216349 res!105788) b!216351))

(assert (= (and b!216348 condMapEmpty!9579) mapIsEmpty!9579))

(assert (= (and b!216348 (not condMapEmpty!9579)) mapNonEmpty!9579))

(get-info :version)

(assert (= (and mapNonEmpty!9579 ((_ is ValueCellFull!2463) mapValue!9579)) b!216347))

(assert (= (and b!216348 ((_ is ValueCellFull!2463) mapDefault!9579)) b!216346))

(assert (= b!216345 b!216348))

(assert (= start!21588 b!216345))

(declare-fun m!243101 () Bool)

(assert (=> b!216349 m!243101))

(declare-fun m!243103 () Bool)

(assert (=> b!216341 m!243103))

(declare-fun m!243105 () Bool)

(assert (=> b!216345 m!243105))

(declare-fun m!243107 () Bool)

(assert (=> b!216345 m!243107))

(declare-fun m!243109 () Bool)

(assert (=> mapNonEmpty!9579 m!243109))

(declare-fun m!243111 () Bool)

(assert (=> b!216342 m!243111))

(declare-fun m!243113 () Bool)

(assert (=> b!216350 m!243113))

(declare-fun m!243115 () Bool)

(assert (=> start!21588 m!243115))

(check-sat (not b!216345) (not mapNonEmpty!9579) (not b!216342) (not b_next!5751) tp_is_empty!5613 (not b!216341) (not b!216349) (not start!21588) (not b!216350) b_and!12641)
(check-sat b_and!12641 (not b_next!5751))
(get-model)

(declare-fun d!58541 () Bool)

(declare-fun res!105820 () Bool)

(declare-fun e!140785 () Bool)

(assert (=> d!58541 (=> (not res!105820) (not e!140785))))

(declare-fun simpleValid!223 (LongMapFixedSize!2826) Bool)

(assert (=> d!58541 (= res!105820 (simpleValid!223 thiss!1504))))

(assert (=> d!58541 (= (valid!1148 thiss!1504) e!140785)))

(declare-fun b!216391 () Bool)

(declare-fun res!105821 () Bool)

(assert (=> b!216391 (=> (not res!105821) (not e!140785))))

(declare-fun arrayCountValidKeys!0 (array!10465 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!216391 (= res!105821 (= (arrayCountValidKeys!0 (_keys!6110 thiss!1504) #b00000000000000000000000000000000 (size!5287 (_keys!6110 thiss!1504))) (_size!1462 thiss!1504)))))

(declare-fun b!216392 () Bool)

(declare-fun res!105822 () Bool)

(assert (=> b!216392 (=> (not res!105822) (not e!140785))))

(assert (=> b!216392 (= res!105822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6110 thiss!1504) (mask!9795 thiss!1504)))))

(declare-fun b!216393 () Bool)

(assert (=> b!216393 (= e!140785 (arrayNoDuplicates!0 (_keys!6110 thiss!1504) #b00000000000000000000000000000000 Nil!3142))))

(assert (= (and d!58541 res!105820) b!216391))

(assert (= (and b!216391 res!105821) b!216392))

(assert (= (and b!216392 res!105822) b!216393))

(declare-fun m!243133 () Bool)

(assert (=> d!58541 m!243133))

(declare-fun m!243135 () Bool)

(assert (=> b!216391 m!243135))

(assert (=> b!216392 m!243103))

(assert (=> b!216393 m!243101))

(assert (=> start!21588 d!58541))

(declare-fun d!58543 () Bool)

(declare-fun lt!111154 () SeekEntryResult!743)

(assert (=> d!58543 (and (or ((_ is Undefined!743) lt!111154) (not ((_ is Found!743) lt!111154)) (and (bvsge (index!5143 lt!111154) #b00000000000000000000000000000000) (bvslt (index!5143 lt!111154) (size!5287 (_keys!6110 thiss!1504))))) (or ((_ is Undefined!743) lt!111154) ((_ is Found!743) lt!111154) (not ((_ is MissingZero!743) lt!111154)) (and (bvsge (index!5142 lt!111154) #b00000000000000000000000000000000) (bvslt (index!5142 lt!111154) (size!5287 (_keys!6110 thiss!1504))))) (or ((_ is Undefined!743) lt!111154) ((_ is Found!743) lt!111154) ((_ is MissingZero!743) lt!111154) (not ((_ is MissingVacant!743) lt!111154)) (and (bvsge (index!5145 lt!111154) #b00000000000000000000000000000000) (bvslt (index!5145 lt!111154) (size!5287 (_keys!6110 thiss!1504))))) (or ((_ is Undefined!743) lt!111154) (ite ((_ is Found!743) lt!111154) (= (select (arr!4955 (_keys!6110 thiss!1504)) (index!5143 lt!111154)) key!932) (ite ((_ is MissingZero!743) lt!111154) (= (select (arr!4955 (_keys!6110 thiss!1504)) (index!5142 lt!111154)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!743) lt!111154) (= (select (arr!4955 (_keys!6110 thiss!1504)) (index!5145 lt!111154)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!140792 () SeekEntryResult!743)

(assert (=> d!58543 (= lt!111154 e!140792)))

(declare-fun c!36323 () Bool)

(declare-fun lt!111155 () SeekEntryResult!743)

(assert (=> d!58543 (= c!36323 (and ((_ is Intermediate!743) lt!111155) (undefined!1555 lt!111155)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10465 (_ BitVec 32)) SeekEntryResult!743)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58543 (= lt!111155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9795 thiss!1504)) key!932 (_keys!6110 thiss!1504) (mask!9795 thiss!1504)))))

(assert (=> d!58543 (validMask!0 (mask!9795 thiss!1504))))

(assert (=> d!58543 (= (seekEntryOrOpen!0 key!932 (_keys!6110 thiss!1504) (mask!9795 thiss!1504)) lt!111154)))

(declare-fun b!216406 () Bool)

(declare-fun c!36322 () Bool)

(declare-fun lt!111156 () (_ BitVec 64))

(assert (=> b!216406 (= c!36322 (= lt!111156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140794 () SeekEntryResult!743)

(declare-fun e!140793 () SeekEntryResult!743)

(assert (=> b!216406 (= e!140794 e!140793)))

(declare-fun b!216407 () Bool)

(assert (=> b!216407 (= e!140794 (Found!743 (index!5144 lt!111155)))))

(declare-fun b!216408 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10465 (_ BitVec 32)) SeekEntryResult!743)

(assert (=> b!216408 (= e!140793 (seekKeyOrZeroReturnVacant!0 (x!22623 lt!111155) (index!5144 lt!111155) (index!5144 lt!111155) key!932 (_keys!6110 thiss!1504) (mask!9795 thiss!1504)))))

(declare-fun b!216409 () Bool)

(assert (=> b!216409 (= e!140793 (MissingZero!743 (index!5144 lt!111155)))))

(declare-fun b!216410 () Bool)

(assert (=> b!216410 (= e!140792 e!140794)))

(assert (=> b!216410 (= lt!111156 (select (arr!4955 (_keys!6110 thiss!1504)) (index!5144 lt!111155)))))

(declare-fun c!36321 () Bool)

(assert (=> b!216410 (= c!36321 (= lt!111156 key!932))))

(declare-fun b!216411 () Bool)

(assert (=> b!216411 (= e!140792 Undefined!743)))

(assert (= (and d!58543 c!36323) b!216411))

(assert (= (and d!58543 (not c!36323)) b!216410))

(assert (= (and b!216410 c!36321) b!216407))

(assert (= (and b!216410 (not c!36321)) b!216406))

(assert (= (and b!216406 c!36322) b!216409))

(assert (= (and b!216406 (not c!36322)) b!216408))

(declare-fun m!243137 () Bool)

(assert (=> d!58543 m!243137))

(declare-fun m!243139 () Bool)

(assert (=> d!58543 m!243139))

(declare-fun m!243141 () Bool)

(assert (=> d!58543 m!243141))

(declare-fun m!243143 () Bool)

(assert (=> d!58543 m!243143))

(declare-fun m!243145 () Bool)

(assert (=> d!58543 m!243145))

(assert (=> d!58543 m!243113))

(assert (=> d!58543 m!243137))

(declare-fun m!243147 () Bool)

(assert (=> b!216408 m!243147))

(declare-fun m!243149 () Bool)

(assert (=> b!216410 m!243149))

(assert (=> b!216342 d!58543))

(declare-fun b!216420 () Bool)

(declare-fun e!140803 () Bool)

(declare-fun e!140801 () Bool)

(assert (=> b!216420 (= e!140803 e!140801)))

(declare-fun lt!111165 () (_ BitVec 64))

(assert (=> b!216420 (= lt!111165 (select (arr!4955 (_keys!6110 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6506 0))(
  ( (Unit!6507) )
))
(declare-fun lt!111164 () Unit!6506)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10465 (_ BitVec 64) (_ BitVec 32)) Unit!6506)

(assert (=> b!216420 (= lt!111164 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6110 thiss!1504) lt!111165 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!216420 (arrayContainsKey!0 (_keys!6110 thiss!1504) lt!111165 #b00000000000000000000000000000000)))

(declare-fun lt!111163 () Unit!6506)

(assert (=> b!216420 (= lt!111163 lt!111164)))

(declare-fun res!105828 () Bool)

(assert (=> b!216420 (= res!105828 (= (seekEntryOrOpen!0 (select (arr!4955 (_keys!6110 thiss!1504)) #b00000000000000000000000000000000) (_keys!6110 thiss!1504) (mask!9795 thiss!1504)) (Found!743 #b00000000000000000000000000000000)))))

(assert (=> b!216420 (=> (not res!105828) (not e!140801))))

(declare-fun b!216421 () Bool)

(declare-fun e!140802 () Bool)

(assert (=> b!216421 (= e!140802 e!140803)))

(declare-fun c!36326 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!216421 (= c!36326 (validKeyInArray!0 (select (arr!4955 (_keys!6110 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20376 () Bool)

(declare-fun call!20379 () Bool)

(assert (=> bm!20376 (= call!20379 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6110 thiss!1504) (mask!9795 thiss!1504)))))

(declare-fun b!216422 () Bool)

(assert (=> b!216422 (= e!140803 call!20379)))

(declare-fun b!216423 () Bool)

(assert (=> b!216423 (= e!140801 call!20379)))

(declare-fun d!58545 () Bool)

(declare-fun res!105827 () Bool)

(assert (=> d!58545 (=> res!105827 e!140802)))

(assert (=> d!58545 (= res!105827 (bvsge #b00000000000000000000000000000000 (size!5287 (_keys!6110 thiss!1504))))))

(assert (=> d!58545 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6110 thiss!1504) (mask!9795 thiss!1504)) e!140802)))

(assert (= (and d!58545 (not res!105827)) b!216421))

(assert (= (and b!216421 c!36326) b!216420))

(assert (= (and b!216421 (not c!36326)) b!216422))

(assert (= (and b!216420 res!105828) b!216423))

(assert (= (or b!216423 b!216422) bm!20376))

(declare-fun m!243151 () Bool)

(assert (=> b!216420 m!243151))

(declare-fun m!243153 () Bool)

(assert (=> b!216420 m!243153))

(declare-fun m!243155 () Bool)

(assert (=> b!216420 m!243155))

(assert (=> b!216420 m!243151))

(declare-fun m!243157 () Bool)

(assert (=> b!216420 m!243157))

(assert (=> b!216421 m!243151))

(assert (=> b!216421 m!243151))

(declare-fun m!243159 () Bool)

(assert (=> b!216421 m!243159))

(declare-fun m!243161 () Bool)

(assert (=> bm!20376 m!243161))

(assert (=> b!216341 d!58545))

(declare-fun d!58547 () Bool)

(assert (=> d!58547 (= (validMask!0 (mask!9795 thiss!1504)) (and (or (= (mask!9795 thiss!1504) #b00000000000000000000000000000111) (= (mask!9795 thiss!1504) #b00000000000000000000000000001111) (= (mask!9795 thiss!1504) #b00000000000000000000000000011111) (= (mask!9795 thiss!1504) #b00000000000000000000000000111111) (= (mask!9795 thiss!1504) #b00000000000000000000000001111111) (= (mask!9795 thiss!1504) #b00000000000000000000000011111111) (= (mask!9795 thiss!1504) #b00000000000000000000000111111111) (= (mask!9795 thiss!1504) #b00000000000000000000001111111111) (= (mask!9795 thiss!1504) #b00000000000000000000011111111111) (= (mask!9795 thiss!1504) #b00000000000000000000111111111111) (= (mask!9795 thiss!1504) #b00000000000000000001111111111111) (= (mask!9795 thiss!1504) #b00000000000000000011111111111111) (= (mask!9795 thiss!1504) #b00000000000000000111111111111111) (= (mask!9795 thiss!1504) #b00000000000000001111111111111111) (= (mask!9795 thiss!1504) #b00000000000000011111111111111111) (= (mask!9795 thiss!1504) #b00000000000000111111111111111111) (= (mask!9795 thiss!1504) #b00000000000001111111111111111111) (= (mask!9795 thiss!1504) #b00000000000011111111111111111111) (= (mask!9795 thiss!1504) #b00000000000111111111111111111111) (= (mask!9795 thiss!1504) #b00000000001111111111111111111111) (= (mask!9795 thiss!1504) #b00000000011111111111111111111111) (= (mask!9795 thiss!1504) #b00000000111111111111111111111111) (= (mask!9795 thiss!1504) #b00000001111111111111111111111111) (= (mask!9795 thiss!1504) #b00000011111111111111111111111111) (= (mask!9795 thiss!1504) #b00000111111111111111111111111111) (= (mask!9795 thiss!1504) #b00001111111111111111111111111111) (= (mask!9795 thiss!1504) #b00011111111111111111111111111111) (= (mask!9795 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9795 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!216350 d!58547))

(declare-fun d!58549 () Bool)

(assert (=> d!58549 (= (array_inv!3277 (_keys!6110 thiss!1504)) (bvsge (size!5287 (_keys!6110 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216345 d!58549))

(declare-fun d!58551 () Bool)

(assert (=> d!58551 (= (array_inv!3278 (_values!4046 thiss!1504)) (bvsge (size!5286 (_values!4046 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216345 d!58551))

(declare-fun b!216434 () Bool)

(declare-fun e!140813 () Bool)

(declare-fun contains!1433 (List!3145 (_ BitVec 64)) Bool)

(assert (=> b!216434 (= e!140813 (contains!1433 Nil!3142 (select (arr!4955 (_keys!6110 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!216435 () Bool)

(declare-fun e!140812 () Bool)

(declare-fun e!140814 () Bool)

(assert (=> b!216435 (= e!140812 e!140814)))

(declare-fun c!36329 () Bool)

(assert (=> b!216435 (= c!36329 (validKeyInArray!0 (select (arr!4955 (_keys!6110 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!216436 () Bool)

(declare-fun call!20382 () Bool)

(assert (=> b!216436 (= e!140814 call!20382)))

(declare-fun b!216437 () Bool)

(assert (=> b!216437 (= e!140814 call!20382)))

(declare-fun bm!20379 () Bool)

(assert (=> bm!20379 (= call!20382 (arrayNoDuplicates!0 (_keys!6110 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36329 (Cons!3141 (select (arr!4955 (_keys!6110 thiss!1504)) #b00000000000000000000000000000000) Nil!3142) Nil!3142)))))

(declare-fun b!216438 () Bool)

(declare-fun e!140815 () Bool)

(assert (=> b!216438 (= e!140815 e!140812)))

(declare-fun res!105837 () Bool)

(assert (=> b!216438 (=> (not res!105837) (not e!140812))))

(assert (=> b!216438 (= res!105837 (not e!140813))))

(declare-fun res!105836 () Bool)

(assert (=> b!216438 (=> (not res!105836) (not e!140813))))

(assert (=> b!216438 (= res!105836 (validKeyInArray!0 (select (arr!4955 (_keys!6110 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58553 () Bool)

(declare-fun res!105835 () Bool)

(assert (=> d!58553 (=> res!105835 e!140815)))

(assert (=> d!58553 (= res!105835 (bvsge #b00000000000000000000000000000000 (size!5287 (_keys!6110 thiss!1504))))))

(assert (=> d!58553 (= (arrayNoDuplicates!0 (_keys!6110 thiss!1504) #b00000000000000000000000000000000 Nil!3142) e!140815)))

(assert (= (and d!58553 (not res!105835)) b!216438))

(assert (= (and b!216438 res!105836) b!216434))

(assert (= (and b!216438 res!105837) b!216435))

(assert (= (and b!216435 c!36329) b!216437))

(assert (= (and b!216435 (not c!36329)) b!216436))

(assert (= (or b!216437 b!216436) bm!20379))

(assert (=> b!216434 m!243151))

(assert (=> b!216434 m!243151))

(declare-fun m!243163 () Bool)

(assert (=> b!216434 m!243163))

(assert (=> b!216435 m!243151))

(assert (=> b!216435 m!243151))

(assert (=> b!216435 m!243159))

(assert (=> bm!20379 m!243151))

(declare-fun m!243165 () Bool)

(assert (=> bm!20379 m!243165))

(assert (=> b!216438 m!243151))

(assert (=> b!216438 m!243151))

(assert (=> b!216438 m!243159))

(assert (=> b!216349 d!58553))

(declare-fun condMapEmpty!9585 () Bool)

(declare-fun mapDefault!9585 () ValueCell!2463)

(assert (=> mapNonEmpty!9579 (= condMapEmpty!9585 (= mapRest!9579 ((as const (Array (_ BitVec 32) ValueCell!2463)) mapDefault!9585)))))

(declare-fun e!140820 () Bool)

(declare-fun mapRes!9585 () Bool)

(assert (=> mapNonEmpty!9579 (= tp!20385 (and e!140820 mapRes!9585))))

(declare-fun mapIsEmpty!9585 () Bool)

(assert (=> mapIsEmpty!9585 mapRes!9585))

(declare-fun b!216446 () Bool)

(assert (=> b!216446 (= e!140820 tp_is_empty!5613)))

(declare-fun b!216445 () Bool)

(declare-fun e!140821 () Bool)

(assert (=> b!216445 (= e!140821 tp_is_empty!5613)))

(declare-fun mapNonEmpty!9585 () Bool)

(declare-fun tp!20394 () Bool)

(assert (=> mapNonEmpty!9585 (= mapRes!9585 (and tp!20394 e!140821))))

(declare-fun mapRest!9585 () (Array (_ BitVec 32) ValueCell!2463))

(declare-fun mapKey!9585 () (_ BitVec 32))

(declare-fun mapValue!9585 () ValueCell!2463)

(assert (=> mapNonEmpty!9585 (= mapRest!9579 (store mapRest!9585 mapKey!9585 mapValue!9585))))

(assert (= (and mapNonEmpty!9579 condMapEmpty!9585) mapIsEmpty!9585))

(assert (= (and mapNonEmpty!9579 (not condMapEmpty!9585)) mapNonEmpty!9585))

(assert (= (and mapNonEmpty!9585 ((_ is ValueCellFull!2463) mapValue!9585)) b!216445))

(assert (= (and mapNonEmpty!9579 ((_ is ValueCellFull!2463) mapDefault!9585)) b!216446))

(declare-fun m!243167 () Bool)

(assert (=> mapNonEmpty!9585 m!243167))

(check-sat (not d!58543) (not b!216420) (not mapNonEmpty!9585) (not b!216435) (not b!216393) (not d!58541) (not b!216421) (not b!216392) b_and!12641 (not bm!20376) (not b_next!5751) (not b!216438) tp_is_empty!5613 (not b!216408) (not b!216391) (not bm!20379) (not b!216434))
(check-sat b_and!12641 (not b_next!5751))
