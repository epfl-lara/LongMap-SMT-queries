; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16388 () Bool)

(assert start!16388)

(declare-fun b!163304 () Bool)

(declare-fun b_free!3787 () Bool)

(declare-fun b_next!3787 () Bool)

(assert (=> b!163304 (= b_free!3787 (not b_next!3787))))

(declare-fun tp!13942 () Bool)

(declare-fun b_and!10215 () Bool)

(assert (=> b!163304 (= tp!13942 b_and!10215)))

(declare-fun mapNonEmpty!6082 () Bool)

(declare-fun mapRes!6082 () Bool)

(declare-fun tp!13941 () Bool)

(declare-fun e!107123 () Bool)

(assert (=> mapNonEmpty!6082 (= mapRes!6082 (and tp!13941 e!107123))))

(declare-datatypes ((V!4433 0))(
  ( (V!4434 (val!1839 Int)) )
))
(declare-datatypes ((ValueCell!1451 0))(
  ( (ValueCellFull!1451 (v!3705 V!4433)) (EmptyCell!1451) )
))
(declare-fun mapRest!6082 () (Array (_ BitVec 32) ValueCell!1451))

(declare-datatypes ((array!6249 0))(
  ( (array!6250 (arr!2966 (Array (_ BitVec 32) (_ BitVec 64))) (size!3252 (_ BitVec 32))) )
))
(declare-datatypes ((array!6251 0))(
  ( (array!6252 (arr!2967 (Array (_ BitVec 32) ValueCell!1451)) (size!3253 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1810 0))(
  ( (LongMapFixedSize!1811 (defaultEntry!3347 Int) (mask!7999 (_ BitVec 32)) (extraKeys!3088 (_ BitVec 32)) (zeroValue!3190 V!4433) (minValue!3190 V!4433) (_size!954 (_ BitVec 32)) (_keys!5157 array!6249) (_values!3330 array!6251) (_vacant!954 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1810)

(declare-fun mapKey!6082 () (_ BitVec 32))

(declare-fun mapValue!6082 () ValueCell!1451)

(assert (=> mapNonEmpty!6082 (= (arr!2967 (_values!3330 thiss!1248)) (store mapRest!6082 mapKey!6082 mapValue!6082))))

(declare-fun b!163299 () Bool)

(declare-fun res!77293 () Bool)

(declare-fun e!107124 () Bool)

(assert (=> b!163299 (=> (not res!77293) (not e!107124))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!163299 (= res!77293 (not (= key!828 (bvneg key!828))))))

(declare-fun b!163300 () Bool)

(declare-fun e!107125 () Bool)

(assert (=> b!163300 (= e!107125 (and (= (size!3253 (_values!3330 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7999 thiss!1248))) (= (size!3252 (_keys!5157 thiss!1248)) (size!3253 (_values!3330 thiss!1248))) (bvslt (mask!7999 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!163301 () Bool)

(assert (=> b!163301 (= e!107124 e!107125)))

(declare-fun res!77294 () Bool)

(assert (=> b!163301 (=> (not res!77294) (not e!107125))))

(declare-datatypes ((SeekEntryResult!398 0))(
  ( (MissingZero!398 (index!3760 (_ BitVec 32))) (Found!398 (index!3761 (_ BitVec 32))) (Intermediate!398 (undefined!1210 Bool) (index!3762 (_ BitVec 32)) (x!18088 (_ BitVec 32))) (Undefined!398) (MissingVacant!398 (index!3763 (_ BitVec 32))) )
))
(declare-fun lt!82710 () SeekEntryResult!398)

(get-info :version)

(assert (=> b!163301 (= res!77294 (and (not ((_ is Undefined!398) lt!82710)) (not ((_ is MissingVacant!398) lt!82710)) (not ((_ is MissingZero!398) lt!82710)) ((_ is Found!398) lt!82710)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6249 (_ BitVec 32)) SeekEntryResult!398)

(assert (=> b!163301 (= lt!82710 (seekEntryOrOpen!0 key!828 (_keys!5157 thiss!1248) (mask!7999 thiss!1248)))))

(declare-fun b!163302 () Bool)

(declare-fun e!107121 () Bool)

(declare-fun tp_is_empty!3589 () Bool)

(assert (=> b!163302 (= e!107121 tp_is_empty!3589)))

(declare-fun b!163303 () Bool)

(declare-fun e!107119 () Bool)

(assert (=> b!163303 (= e!107119 (and e!107121 mapRes!6082))))

(declare-fun condMapEmpty!6082 () Bool)

(declare-fun mapDefault!6082 () ValueCell!1451)

(assert (=> b!163303 (= condMapEmpty!6082 (= (arr!2967 (_values!3330 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1451)) mapDefault!6082)))))

(declare-fun res!77296 () Bool)

(assert (=> start!16388 (=> (not res!77296) (not e!107124))))

(declare-fun valid!834 (LongMapFixedSize!1810) Bool)

(assert (=> start!16388 (= res!77296 (valid!834 thiss!1248))))

(assert (=> start!16388 e!107124))

(declare-fun e!107120 () Bool)

(assert (=> start!16388 e!107120))

(assert (=> start!16388 true))

(declare-fun array_inv!1907 (array!6249) Bool)

(declare-fun array_inv!1908 (array!6251) Bool)

(assert (=> b!163304 (= e!107120 (and tp!13942 tp_is_empty!3589 (array_inv!1907 (_keys!5157 thiss!1248)) (array_inv!1908 (_values!3330 thiss!1248)) e!107119))))

(declare-fun b!163305 () Bool)

(declare-fun res!77295 () Bool)

(assert (=> b!163305 (=> (not res!77295) (not e!107125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163305 (= res!77295 (validMask!0 (mask!7999 thiss!1248)))))

(declare-fun mapIsEmpty!6082 () Bool)

(assert (=> mapIsEmpty!6082 mapRes!6082))

(declare-fun b!163306 () Bool)

(assert (=> b!163306 (= e!107123 tp_is_empty!3589)))

(assert (= (and start!16388 res!77296) b!163299))

(assert (= (and b!163299 res!77293) b!163301))

(assert (= (and b!163301 res!77294) b!163305))

(assert (= (and b!163305 res!77295) b!163300))

(assert (= (and b!163303 condMapEmpty!6082) mapIsEmpty!6082))

(assert (= (and b!163303 (not condMapEmpty!6082)) mapNonEmpty!6082))

(assert (= (and mapNonEmpty!6082 ((_ is ValueCellFull!1451) mapValue!6082)) b!163306))

(assert (= (and b!163303 ((_ is ValueCellFull!1451) mapDefault!6082)) b!163302))

(assert (= b!163304 b!163303))

(assert (= start!16388 b!163304))

(declare-fun m!194193 () Bool)

(assert (=> start!16388 m!194193))

(declare-fun m!194195 () Bool)

(assert (=> b!163304 m!194195))

(declare-fun m!194197 () Bool)

(assert (=> b!163304 m!194197))

(declare-fun m!194199 () Bool)

(assert (=> b!163301 m!194199))

(declare-fun m!194201 () Bool)

(assert (=> b!163305 m!194201))

(declare-fun m!194203 () Bool)

(assert (=> mapNonEmpty!6082 m!194203))

(check-sat b_and!10215 tp_is_empty!3589 (not b!163301) (not start!16388) (not mapNonEmpty!6082) (not b!163305) (not b!163304) (not b_next!3787))
(check-sat b_and!10215 (not b_next!3787))
(get-model)

(declare-fun d!51495 () Bool)

(assert (=> d!51495 (= (array_inv!1907 (_keys!5157 thiss!1248)) (bvsge (size!3252 (_keys!5157 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163304 d!51495))

(declare-fun d!51497 () Bool)

(assert (=> d!51497 (= (array_inv!1908 (_values!3330 thiss!1248)) (bvsge (size!3253 (_values!3330 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163304 d!51497))

(declare-fun d!51499 () Bool)

(declare-fun res!77327 () Bool)

(declare-fun e!107170 () Bool)

(assert (=> d!51499 (=> (not res!77327) (not e!107170))))

(declare-fun simpleValid!121 (LongMapFixedSize!1810) Bool)

(assert (=> d!51499 (= res!77327 (simpleValid!121 thiss!1248))))

(assert (=> d!51499 (= (valid!834 thiss!1248) e!107170)))

(declare-fun b!163361 () Bool)

(declare-fun res!77328 () Bool)

(assert (=> b!163361 (=> (not res!77328) (not e!107170))))

(declare-fun arrayCountValidKeys!0 (array!6249 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163361 (= res!77328 (= (arrayCountValidKeys!0 (_keys!5157 thiss!1248) #b00000000000000000000000000000000 (size!3252 (_keys!5157 thiss!1248))) (_size!954 thiss!1248)))))

(declare-fun b!163362 () Bool)

(declare-fun res!77329 () Bool)

(assert (=> b!163362 (=> (not res!77329) (not e!107170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6249 (_ BitVec 32)) Bool)

(assert (=> b!163362 (= res!77329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5157 thiss!1248) (mask!7999 thiss!1248)))))

(declare-fun b!163363 () Bool)

(declare-datatypes ((List!1986 0))(
  ( (Nil!1983) (Cons!1982 (h!2597 (_ BitVec 64)) (t!6780 List!1986)) )
))
(declare-fun arrayNoDuplicates!0 (array!6249 (_ BitVec 32) List!1986) Bool)

(assert (=> b!163363 (= e!107170 (arrayNoDuplicates!0 (_keys!5157 thiss!1248) #b00000000000000000000000000000000 Nil!1983))))

(assert (= (and d!51499 res!77327) b!163361))

(assert (= (and b!163361 res!77328) b!163362))

(assert (= (and b!163362 res!77329) b!163363))

(declare-fun m!194229 () Bool)

(assert (=> d!51499 m!194229))

(declare-fun m!194231 () Bool)

(assert (=> b!163361 m!194231))

(declare-fun m!194233 () Bool)

(assert (=> b!163362 m!194233))

(declare-fun m!194235 () Bool)

(assert (=> b!163363 m!194235))

(assert (=> start!16388 d!51499))

(declare-fun d!51501 () Bool)

(assert (=> d!51501 (= (validMask!0 (mask!7999 thiss!1248)) (and (or (= (mask!7999 thiss!1248) #b00000000000000000000000000000111) (= (mask!7999 thiss!1248) #b00000000000000000000000000001111) (= (mask!7999 thiss!1248) #b00000000000000000000000000011111) (= (mask!7999 thiss!1248) #b00000000000000000000000000111111) (= (mask!7999 thiss!1248) #b00000000000000000000000001111111) (= (mask!7999 thiss!1248) #b00000000000000000000000011111111) (= (mask!7999 thiss!1248) #b00000000000000000000000111111111) (= (mask!7999 thiss!1248) #b00000000000000000000001111111111) (= (mask!7999 thiss!1248) #b00000000000000000000011111111111) (= (mask!7999 thiss!1248) #b00000000000000000000111111111111) (= (mask!7999 thiss!1248) #b00000000000000000001111111111111) (= (mask!7999 thiss!1248) #b00000000000000000011111111111111) (= (mask!7999 thiss!1248) #b00000000000000000111111111111111) (= (mask!7999 thiss!1248) #b00000000000000001111111111111111) (= (mask!7999 thiss!1248) #b00000000000000011111111111111111) (= (mask!7999 thiss!1248) #b00000000000000111111111111111111) (= (mask!7999 thiss!1248) #b00000000000001111111111111111111) (= (mask!7999 thiss!1248) #b00000000000011111111111111111111) (= (mask!7999 thiss!1248) #b00000000000111111111111111111111) (= (mask!7999 thiss!1248) #b00000000001111111111111111111111) (= (mask!7999 thiss!1248) #b00000000011111111111111111111111) (= (mask!7999 thiss!1248) #b00000000111111111111111111111111) (= (mask!7999 thiss!1248) #b00000001111111111111111111111111) (= (mask!7999 thiss!1248) #b00000011111111111111111111111111) (= (mask!7999 thiss!1248) #b00000111111111111111111111111111) (= (mask!7999 thiss!1248) #b00001111111111111111111111111111) (= (mask!7999 thiss!1248) #b00011111111111111111111111111111) (= (mask!7999 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7999 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163305 d!51501))

(declare-fun b!163376 () Bool)

(declare-fun e!107177 () SeekEntryResult!398)

(declare-fun e!107178 () SeekEntryResult!398)

(assert (=> b!163376 (= e!107177 e!107178)))

(declare-fun lt!82724 () (_ BitVec 64))

(declare-fun lt!82725 () SeekEntryResult!398)

(assert (=> b!163376 (= lt!82724 (select (arr!2966 (_keys!5157 thiss!1248)) (index!3762 lt!82725)))))

(declare-fun c!30086 () Bool)

(assert (=> b!163376 (= c!30086 (= lt!82724 key!828))))

(declare-fun d!51503 () Bool)

(declare-fun lt!82723 () SeekEntryResult!398)

(assert (=> d!51503 (and (or ((_ is Undefined!398) lt!82723) (not ((_ is Found!398) lt!82723)) (and (bvsge (index!3761 lt!82723) #b00000000000000000000000000000000) (bvslt (index!3761 lt!82723) (size!3252 (_keys!5157 thiss!1248))))) (or ((_ is Undefined!398) lt!82723) ((_ is Found!398) lt!82723) (not ((_ is MissingZero!398) lt!82723)) (and (bvsge (index!3760 lt!82723) #b00000000000000000000000000000000) (bvslt (index!3760 lt!82723) (size!3252 (_keys!5157 thiss!1248))))) (or ((_ is Undefined!398) lt!82723) ((_ is Found!398) lt!82723) ((_ is MissingZero!398) lt!82723) (not ((_ is MissingVacant!398) lt!82723)) (and (bvsge (index!3763 lt!82723) #b00000000000000000000000000000000) (bvslt (index!3763 lt!82723) (size!3252 (_keys!5157 thiss!1248))))) (or ((_ is Undefined!398) lt!82723) (ite ((_ is Found!398) lt!82723) (= (select (arr!2966 (_keys!5157 thiss!1248)) (index!3761 lt!82723)) key!828) (ite ((_ is MissingZero!398) lt!82723) (= (select (arr!2966 (_keys!5157 thiss!1248)) (index!3760 lt!82723)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!398) lt!82723) (= (select (arr!2966 (_keys!5157 thiss!1248)) (index!3763 lt!82723)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51503 (= lt!82723 e!107177)))

(declare-fun c!30084 () Bool)

(assert (=> d!51503 (= c!30084 (and ((_ is Intermediate!398) lt!82725) (undefined!1210 lt!82725)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6249 (_ BitVec 32)) SeekEntryResult!398)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51503 (= lt!82725 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7999 thiss!1248)) key!828 (_keys!5157 thiss!1248) (mask!7999 thiss!1248)))))

(assert (=> d!51503 (validMask!0 (mask!7999 thiss!1248))))

(assert (=> d!51503 (= (seekEntryOrOpen!0 key!828 (_keys!5157 thiss!1248) (mask!7999 thiss!1248)) lt!82723)))

(declare-fun b!163377 () Bool)

(assert (=> b!163377 (= e!107178 (Found!398 (index!3762 lt!82725)))))

(declare-fun b!163378 () Bool)

(assert (=> b!163378 (= e!107177 Undefined!398)))

(declare-fun e!107179 () SeekEntryResult!398)

(declare-fun b!163379 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6249 (_ BitVec 32)) SeekEntryResult!398)

(assert (=> b!163379 (= e!107179 (seekKeyOrZeroReturnVacant!0 (x!18088 lt!82725) (index!3762 lt!82725) (index!3762 lt!82725) key!828 (_keys!5157 thiss!1248) (mask!7999 thiss!1248)))))

(declare-fun b!163380 () Bool)

(declare-fun c!30085 () Bool)

(assert (=> b!163380 (= c!30085 (= lt!82724 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163380 (= e!107178 e!107179)))

(declare-fun b!163381 () Bool)

(assert (=> b!163381 (= e!107179 (MissingZero!398 (index!3762 lt!82725)))))

(assert (= (and d!51503 c!30084) b!163378))

(assert (= (and d!51503 (not c!30084)) b!163376))

(assert (= (and b!163376 c!30086) b!163377))

(assert (= (and b!163376 (not c!30086)) b!163380))

(assert (= (and b!163380 c!30085) b!163381))

(assert (= (and b!163380 (not c!30085)) b!163379))

(declare-fun m!194237 () Bool)

(assert (=> b!163376 m!194237))

(declare-fun m!194239 () Bool)

(assert (=> d!51503 m!194239))

(declare-fun m!194241 () Bool)

(assert (=> d!51503 m!194241))

(declare-fun m!194243 () Bool)

(assert (=> d!51503 m!194243))

(declare-fun m!194245 () Bool)

(assert (=> d!51503 m!194245))

(declare-fun m!194247 () Bool)

(assert (=> d!51503 m!194247))

(assert (=> d!51503 m!194241))

(assert (=> d!51503 m!194201))

(declare-fun m!194249 () Bool)

(assert (=> b!163379 m!194249))

(assert (=> b!163301 d!51503))

(declare-fun b!163389 () Bool)

(declare-fun e!107184 () Bool)

(assert (=> b!163389 (= e!107184 tp_is_empty!3589)))

(declare-fun condMapEmpty!6091 () Bool)

(declare-fun mapDefault!6091 () ValueCell!1451)

(assert (=> mapNonEmpty!6082 (= condMapEmpty!6091 (= mapRest!6082 ((as const (Array (_ BitVec 32) ValueCell!1451)) mapDefault!6091)))))

(declare-fun mapRes!6091 () Bool)

(assert (=> mapNonEmpty!6082 (= tp!13941 (and e!107184 mapRes!6091))))

(declare-fun mapIsEmpty!6091 () Bool)

(assert (=> mapIsEmpty!6091 mapRes!6091))

(declare-fun b!163388 () Bool)

(declare-fun e!107185 () Bool)

(assert (=> b!163388 (= e!107185 tp_is_empty!3589)))

(declare-fun mapNonEmpty!6091 () Bool)

(declare-fun tp!13957 () Bool)

(assert (=> mapNonEmpty!6091 (= mapRes!6091 (and tp!13957 e!107185))))

(declare-fun mapValue!6091 () ValueCell!1451)

(declare-fun mapKey!6091 () (_ BitVec 32))

(declare-fun mapRest!6091 () (Array (_ BitVec 32) ValueCell!1451))

(assert (=> mapNonEmpty!6091 (= mapRest!6082 (store mapRest!6091 mapKey!6091 mapValue!6091))))

(assert (= (and mapNonEmpty!6082 condMapEmpty!6091) mapIsEmpty!6091))

(assert (= (and mapNonEmpty!6082 (not condMapEmpty!6091)) mapNonEmpty!6091))

(assert (= (and mapNonEmpty!6091 ((_ is ValueCellFull!1451) mapValue!6091)) b!163388))

(assert (= (and mapNonEmpty!6082 ((_ is ValueCellFull!1451) mapDefault!6091)) b!163389))

(declare-fun m!194251 () Bool)

(assert (=> mapNonEmpty!6091 m!194251))

(check-sat b_and!10215 tp_is_empty!3589 (not b!163379) (not b!163361) (not d!51503) (not mapNonEmpty!6091) (not b_next!3787) (not b!163363) (not b!163362) (not d!51499))
(check-sat b_and!10215 (not b_next!3787))
