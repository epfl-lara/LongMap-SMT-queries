; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16388 () Bool)

(assert start!16388)

(declare-fun b!163110 () Bool)

(declare-fun b_free!3787 () Bool)

(declare-fun b_next!3787 () Bool)

(assert (=> b!163110 (= b_free!3787 (not b_next!3787))))

(declare-fun tp!13941 () Bool)

(declare-fun b_and!10175 () Bool)

(assert (=> b!163110 (= tp!13941 b_and!10175)))

(declare-fun b!163105 () Bool)

(declare-fun e!106998 () Bool)

(declare-datatypes ((V!4433 0))(
  ( (V!4434 (val!1839 Int)) )
))
(declare-datatypes ((ValueCell!1451 0))(
  ( (ValueCellFull!1451 (v!3698 V!4433)) (EmptyCell!1451) )
))
(declare-datatypes ((array!6243 0))(
  ( (array!6244 (arr!2962 (Array (_ BitVec 32) (_ BitVec 64))) (size!3249 (_ BitVec 32))) )
))
(declare-datatypes ((array!6245 0))(
  ( (array!6246 (arr!2963 (Array (_ BitVec 32) ValueCell!1451)) (size!3250 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1810 0))(
  ( (LongMapFixedSize!1811 (defaultEntry!3347 Int) (mask!7998 (_ BitVec 32)) (extraKeys!3088 (_ BitVec 32)) (zeroValue!3190 V!4433) (minValue!3190 V!4433) (_size!954 (_ BitVec 32)) (_keys!5156 array!6243) (_values!3330 array!6245) (_vacant!954 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1810)

(assert (=> b!163105 (= e!106998 (and (= (size!3250 (_values!3330 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7998 thiss!1248))) (= (size!3249 (_keys!5156 thiss!1248)) (size!3250 (_values!3330 thiss!1248))) (bvslt (mask!7998 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6082 () Bool)

(declare-fun mapRes!6082 () Bool)

(declare-fun tp!13942 () Bool)

(declare-fun e!106999 () Bool)

(assert (=> mapNonEmpty!6082 (= mapRes!6082 (and tp!13942 e!106999))))

(declare-fun mapKey!6082 () (_ BitVec 32))

(declare-fun mapValue!6082 () ValueCell!1451)

(declare-fun mapRest!6082 () (Array (_ BitVec 32) ValueCell!1451))

(assert (=> mapNonEmpty!6082 (= (arr!2963 (_values!3330 thiss!1248)) (store mapRest!6082 mapKey!6082 mapValue!6082))))

(declare-fun b!163106 () Bool)

(declare-fun e!106997 () Bool)

(assert (=> b!163106 (= e!106997 e!106998)))

(declare-fun res!77180 () Bool)

(assert (=> b!163106 (=> (not res!77180) (not e!106998))))

(declare-datatypes ((SeekEntryResult!408 0))(
  ( (MissingZero!408 (index!3800 (_ BitVec 32))) (Found!408 (index!3801 (_ BitVec 32))) (Intermediate!408 (undefined!1220 Bool) (index!3802 (_ BitVec 32)) (x!18097 (_ BitVec 32))) (Undefined!408) (MissingVacant!408 (index!3803 (_ BitVec 32))) )
))
(declare-fun lt!82470 () SeekEntryResult!408)

(get-info :version)

(assert (=> b!163106 (= res!77180 (and (not ((_ is Undefined!408) lt!82470)) (not ((_ is MissingVacant!408) lt!82470)) (not ((_ is MissingZero!408) lt!82470)) ((_ is Found!408) lt!82470)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6243 (_ BitVec 32)) SeekEntryResult!408)

(assert (=> b!163106 (= lt!82470 (seekEntryOrOpen!0 key!828 (_keys!5156 thiss!1248) (mask!7998 thiss!1248)))))

(declare-fun b!163107 () Bool)

(declare-fun e!106994 () Bool)

(declare-fun tp_is_empty!3589 () Bool)

(assert (=> b!163107 (= e!106994 tp_is_empty!3589)))

(declare-fun b!163108 () Bool)

(declare-fun res!77178 () Bool)

(assert (=> b!163108 (=> (not res!77178) (not e!106998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163108 (= res!77178 (validMask!0 (mask!7998 thiss!1248)))))

(declare-fun res!77177 () Bool)

(assert (=> start!16388 (=> (not res!77177) (not e!106997))))

(declare-fun valid!818 (LongMapFixedSize!1810) Bool)

(assert (=> start!16388 (= res!77177 (valid!818 thiss!1248))))

(assert (=> start!16388 e!106997))

(declare-fun e!106996 () Bool)

(assert (=> start!16388 e!106996))

(assert (=> start!16388 true))

(declare-fun b!163109 () Bool)

(declare-fun e!106995 () Bool)

(assert (=> b!163109 (= e!106995 (and e!106994 mapRes!6082))))

(declare-fun condMapEmpty!6082 () Bool)

(declare-fun mapDefault!6082 () ValueCell!1451)

(assert (=> b!163109 (= condMapEmpty!6082 (= (arr!2963 (_values!3330 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1451)) mapDefault!6082)))))

(declare-fun array_inv!1907 (array!6243) Bool)

(declare-fun array_inv!1908 (array!6245) Bool)

(assert (=> b!163110 (= e!106996 (and tp!13941 tp_is_empty!3589 (array_inv!1907 (_keys!5156 thiss!1248)) (array_inv!1908 (_values!3330 thiss!1248)) e!106995))))

(declare-fun b!163111 () Bool)

(assert (=> b!163111 (= e!106999 tp_is_empty!3589)))

(declare-fun mapIsEmpty!6082 () Bool)

(assert (=> mapIsEmpty!6082 mapRes!6082))

(declare-fun b!163112 () Bool)

(declare-fun res!77179 () Bool)

(assert (=> b!163112 (=> (not res!77179) (not e!106997))))

(assert (=> b!163112 (= res!77179 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16388 res!77177) b!163112))

(assert (= (and b!163112 res!77179) b!163106))

(assert (= (and b!163106 res!77180) b!163108))

(assert (= (and b!163108 res!77178) b!163105))

(assert (= (and b!163109 condMapEmpty!6082) mapIsEmpty!6082))

(assert (= (and b!163109 (not condMapEmpty!6082)) mapNonEmpty!6082))

(assert (= (and mapNonEmpty!6082 ((_ is ValueCellFull!1451) mapValue!6082)) b!163111))

(assert (= (and b!163109 ((_ is ValueCellFull!1451) mapDefault!6082)) b!163107))

(assert (= b!163110 b!163109))

(assert (= start!16388 b!163110))

(declare-fun m!193391 () Bool)

(assert (=> b!163106 m!193391))

(declare-fun m!193393 () Bool)

(assert (=> b!163110 m!193393))

(declare-fun m!193395 () Bool)

(assert (=> b!163110 m!193395))

(declare-fun m!193397 () Bool)

(assert (=> b!163108 m!193397))

(declare-fun m!193399 () Bool)

(assert (=> start!16388 m!193399))

(declare-fun m!193401 () Bool)

(assert (=> mapNonEmpty!6082 m!193401))

(check-sat (not start!16388) b_and!10175 (not b!163110) (not b!163106) tp_is_empty!3589 (not mapNonEmpty!6082) (not b_next!3787) (not b!163108))
(check-sat b_and!10175 (not b_next!3787))
(get-model)

(declare-fun d!51273 () Bool)

(declare-fun res!77211 () Bool)

(declare-fun e!107045 () Bool)

(assert (=> d!51273 (=> (not res!77211) (not e!107045))))

(declare-fun simpleValid!121 (LongMapFixedSize!1810) Bool)

(assert (=> d!51273 (= res!77211 (simpleValid!121 thiss!1248))))

(assert (=> d!51273 (= (valid!818 thiss!1248) e!107045)))

(declare-fun b!163167 () Bool)

(declare-fun res!77212 () Bool)

(assert (=> b!163167 (=> (not res!77212) (not e!107045))))

(declare-fun arrayCountValidKeys!0 (array!6243 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163167 (= res!77212 (= (arrayCountValidKeys!0 (_keys!5156 thiss!1248) #b00000000000000000000000000000000 (size!3249 (_keys!5156 thiss!1248))) (_size!954 thiss!1248)))))

(declare-fun b!163168 () Bool)

(declare-fun res!77213 () Bool)

(assert (=> b!163168 (=> (not res!77213) (not e!107045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6243 (_ BitVec 32)) Bool)

(assert (=> b!163168 (= res!77213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5156 thiss!1248) (mask!7998 thiss!1248)))))

(declare-fun b!163169 () Bool)

(declare-datatypes ((List!1996 0))(
  ( (Nil!1993) (Cons!1992 (h!2607 (_ BitVec 64)) (t!6789 List!1996)) )
))
(declare-fun arrayNoDuplicates!0 (array!6243 (_ BitVec 32) List!1996) Bool)

(assert (=> b!163169 (= e!107045 (arrayNoDuplicates!0 (_keys!5156 thiss!1248) #b00000000000000000000000000000000 Nil!1993))))

(assert (= (and d!51273 res!77211) b!163167))

(assert (= (and b!163167 res!77212) b!163168))

(assert (= (and b!163168 res!77213) b!163169))

(declare-fun m!193427 () Bool)

(assert (=> d!51273 m!193427))

(declare-fun m!193429 () Bool)

(assert (=> b!163167 m!193429))

(declare-fun m!193431 () Bool)

(assert (=> b!163168 m!193431))

(declare-fun m!193433 () Bool)

(assert (=> b!163169 m!193433))

(assert (=> start!16388 d!51273))

(declare-fun d!51275 () Bool)

(declare-fun lt!82483 () SeekEntryResult!408)

(assert (=> d!51275 (and (or ((_ is Undefined!408) lt!82483) (not ((_ is Found!408) lt!82483)) (and (bvsge (index!3801 lt!82483) #b00000000000000000000000000000000) (bvslt (index!3801 lt!82483) (size!3249 (_keys!5156 thiss!1248))))) (or ((_ is Undefined!408) lt!82483) ((_ is Found!408) lt!82483) (not ((_ is MissingZero!408) lt!82483)) (and (bvsge (index!3800 lt!82483) #b00000000000000000000000000000000) (bvslt (index!3800 lt!82483) (size!3249 (_keys!5156 thiss!1248))))) (or ((_ is Undefined!408) lt!82483) ((_ is Found!408) lt!82483) ((_ is MissingZero!408) lt!82483) (not ((_ is MissingVacant!408) lt!82483)) (and (bvsge (index!3803 lt!82483) #b00000000000000000000000000000000) (bvslt (index!3803 lt!82483) (size!3249 (_keys!5156 thiss!1248))))) (or ((_ is Undefined!408) lt!82483) (ite ((_ is Found!408) lt!82483) (= (select (arr!2962 (_keys!5156 thiss!1248)) (index!3801 lt!82483)) key!828) (ite ((_ is MissingZero!408) lt!82483) (= (select (arr!2962 (_keys!5156 thiss!1248)) (index!3800 lt!82483)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!408) lt!82483) (= (select (arr!2962 (_keys!5156 thiss!1248)) (index!3803 lt!82483)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!107054 () SeekEntryResult!408)

(assert (=> d!51275 (= lt!82483 e!107054)))

(declare-fun c!30046 () Bool)

(declare-fun lt!82485 () SeekEntryResult!408)

(assert (=> d!51275 (= c!30046 (and ((_ is Intermediate!408) lt!82485) (undefined!1220 lt!82485)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6243 (_ BitVec 32)) SeekEntryResult!408)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51275 (= lt!82485 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7998 thiss!1248)) key!828 (_keys!5156 thiss!1248) (mask!7998 thiss!1248)))))

(assert (=> d!51275 (validMask!0 (mask!7998 thiss!1248))))

(assert (=> d!51275 (= (seekEntryOrOpen!0 key!828 (_keys!5156 thiss!1248) (mask!7998 thiss!1248)) lt!82483)))

(declare-fun e!107052 () SeekEntryResult!408)

(declare-fun b!163182 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6243 (_ BitVec 32)) SeekEntryResult!408)

(assert (=> b!163182 (= e!107052 (seekKeyOrZeroReturnVacant!0 (x!18097 lt!82485) (index!3802 lt!82485) (index!3802 lt!82485) key!828 (_keys!5156 thiss!1248) (mask!7998 thiss!1248)))))

(declare-fun b!163183 () Bool)

(assert (=> b!163183 (= e!107054 Undefined!408)))

(declare-fun b!163184 () Bool)

(assert (=> b!163184 (= e!107052 (MissingZero!408 (index!3802 lt!82485)))))

(declare-fun b!163185 () Bool)

(declare-fun e!107053 () SeekEntryResult!408)

(assert (=> b!163185 (= e!107053 (Found!408 (index!3802 lt!82485)))))

(declare-fun b!163186 () Bool)

(assert (=> b!163186 (= e!107054 e!107053)))

(declare-fun lt!82484 () (_ BitVec 64))

(assert (=> b!163186 (= lt!82484 (select (arr!2962 (_keys!5156 thiss!1248)) (index!3802 lt!82485)))))

(declare-fun c!30045 () Bool)

(assert (=> b!163186 (= c!30045 (= lt!82484 key!828))))

(declare-fun b!163187 () Bool)

(declare-fun c!30047 () Bool)

(assert (=> b!163187 (= c!30047 (= lt!82484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163187 (= e!107053 e!107052)))

(assert (= (and d!51275 c!30046) b!163183))

(assert (= (and d!51275 (not c!30046)) b!163186))

(assert (= (and b!163186 c!30045) b!163185))

(assert (= (and b!163186 (not c!30045)) b!163187))

(assert (= (and b!163187 c!30047) b!163184))

(assert (= (and b!163187 (not c!30047)) b!163182))

(assert (=> d!51275 m!193397))

(declare-fun m!193435 () Bool)

(assert (=> d!51275 m!193435))

(declare-fun m!193437 () Bool)

(assert (=> d!51275 m!193437))

(declare-fun m!193439 () Bool)

(assert (=> d!51275 m!193439))

(declare-fun m!193441 () Bool)

(assert (=> d!51275 m!193441))

(assert (=> d!51275 m!193435))

(declare-fun m!193443 () Bool)

(assert (=> d!51275 m!193443))

(declare-fun m!193445 () Bool)

(assert (=> b!163182 m!193445))

(declare-fun m!193447 () Bool)

(assert (=> b!163186 m!193447))

(assert (=> b!163106 d!51275))

(declare-fun d!51277 () Bool)

(assert (=> d!51277 (= (array_inv!1907 (_keys!5156 thiss!1248)) (bvsge (size!3249 (_keys!5156 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163110 d!51277))

(declare-fun d!51279 () Bool)

(assert (=> d!51279 (= (array_inv!1908 (_values!3330 thiss!1248)) (bvsge (size!3250 (_values!3330 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163110 d!51279))

(declare-fun d!51281 () Bool)

(assert (=> d!51281 (= (validMask!0 (mask!7998 thiss!1248)) (and (or (= (mask!7998 thiss!1248) #b00000000000000000000000000000111) (= (mask!7998 thiss!1248) #b00000000000000000000000000001111) (= (mask!7998 thiss!1248) #b00000000000000000000000000011111) (= (mask!7998 thiss!1248) #b00000000000000000000000000111111) (= (mask!7998 thiss!1248) #b00000000000000000000000001111111) (= (mask!7998 thiss!1248) #b00000000000000000000000011111111) (= (mask!7998 thiss!1248) #b00000000000000000000000111111111) (= (mask!7998 thiss!1248) #b00000000000000000000001111111111) (= (mask!7998 thiss!1248) #b00000000000000000000011111111111) (= (mask!7998 thiss!1248) #b00000000000000000000111111111111) (= (mask!7998 thiss!1248) #b00000000000000000001111111111111) (= (mask!7998 thiss!1248) #b00000000000000000011111111111111) (= (mask!7998 thiss!1248) #b00000000000000000111111111111111) (= (mask!7998 thiss!1248) #b00000000000000001111111111111111) (= (mask!7998 thiss!1248) #b00000000000000011111111111111111) (= (mask!7998 thiss!1248) #b00000000000000111111111111111111) (= (mask!7998 thiss!1248) #b00000000000001111111111111111111) (= (mask!7998 thiss!1248) #b00000000000011111111111111111111) (= (mask!7998 thiss!1248) #b00000000000111111111111111111111) (= (mask!7998 thiss!1248) #b00000000001111111111111111111111) (= (mask!7998 thiss!1248) #b00000000011111111111111111111111) (= (mask!7998 thiss!1248) #b00000000111111111111111111111111) (= (mask!7998 thiss!1248) #b00000001111111111111111111111111) (= (mask!7998 thiss!1248) #b00000011111111111111111111111111) (= (mask!7998 thiss!1248) #b00000111111111111111111111111111) (= (mask!7998 thiss!1248) #b00001111111111111111111111111111) (= (mask!7998 thiss!1248) #b00011111111111111111111111111111) (= (mask!7998 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7998 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163108 d!51281))

(declare-fun b!163195 () Bool)

(declare-fun e!107060 () Bool)

(assert (=> b!163195 (= e!107060 tp_is_empty!3589)))

(declare-fun mapIsEmpty!6091 () Bool)

(declare-fun mapRes!6091 () Bool)

(assert (=> mapIsEmpty!6091 mapRes!6091))

(declare-fun b!163194 () Bool)

(declare-fun e!107059 () Bool)

(assert (=> b!163194 (= e!107059 tp_is_empty!3589)))

(declare-fun mapNonEmpty!6091 () Bool)

(declare-fun tp!13957 () Bool)

(assert (=> mapNonEmpty!6091 (= mapRes!6091 (and tp!13957 e!107059))))

(declare-fun mapValue!6091 () ValueCell!1451)

(declare-fun mapKey!6091 () (_ BitVec 32))

(declare-fun mapRest!6091 () (Array (_ BitVec 32) ValueCell!1451))

(assert (=> mapNonEmpty!6091 (= mapRest!6082 (store mapRest!6091 mapKey!6091 mapValue!6091))))

(declare-fun condMapEmpty!6091 () Bool)

(declare-fun mapDefault!6091 () ValueCell!1451)

(assert (=> mapNonEmpty!6082 (= condMapEmpty!6091 (= mapRest!6082 ((as const (Array (_ BitVec 32) ValueCell!1451)) mapDefault!6091)))))

(assert (=> mapNonEmpty!6082 (= tp!13942 (and e!107060 mapRes!6091))))

(assert (= (and mapNonEmpty!6082 condMapEmpty!6091) mapIsEmpty!6091))

(assert (= (and mapNonEmpty!6082 (not condMapEmpty!6091)) mapNonEmpty!6091))

(assert (= (and mapNonEmpty!6091 ((_ is ValueCellFull!1451) mapValue!6091)) b!163194))

(assert (= (and mapNonEmpty!6082 ((_ is ValueCellFull!1451) mapDefault!6091)) b!163195))

(declare-fun m!193449 () Bool)

(assert (=> mapNonEmpty!6091 m!193449))

(check-sat (not b!163168) (not b!163182) (not b!163169) tp_is_empty!3589 b_and!10175 (not b_next!3787) (not b!163167) (not d!51273) (not mapNonEmpty!6091) (not d!51275))
(check-sat b_and!10175 (not b_next!3787))
