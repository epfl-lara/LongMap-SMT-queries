; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16032 () Bool)

(assert start!16032)

(declare-fun b!159104 () Bool)

(declare-fun b_free!3507 () Bool)

(declare-fun b_next!3507 () Bool)

(assert (=> b!159104 (= b_free!3507 (not b_next!3507))))

(declare-fun tp!13088 () Bool)

(declare-fun b_and!9921 () Bool)

(assert (=> b!159104 (= tp!13088 b_and!9921)))

(declare-fun mapNonEmpty!5648 () Bool)

(declare-fun mapRes!5648 () Bool)

(declare-fun tp!13087 () Bool)

(declare-fun e!104171 () Bool)

(assert (=> mapNonEmpty!5648 (= mapRes!5648 (and tp!13087 e!104171))))

(declare-datatypes ((V!4059 0))(
  ( (V!4060 (val!1699 Int)) )
))
(declare-datatypes ((ValueCell!1311 0))(
  ( (ValueCellFull!1311 (v!3564 V!4059)) (EmptyCell!1311) )
))
(declare-fun mapValue!5648 () ValueCell!1311)

(declare-datatypes ((array!5695 0))(
  ( (array!5696 (arr!2693 (Array (_ BitVec 32) (_ BitVec 64))) (size!2977 (_ BitVec 32))) )
))
(declare-datatypes ((array!5697 0))(
  ( (array!5698 (arr!2694 (Array (_ BitVec 32) ValueCell!1311)) (size!2978 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1530 0))(
  ( (LongMapFixedSize!1531 (defaultEntry!3207 Int) (mask!7748 (_ BitVec 32)) (extraKeys!2948 (_ BitVec 32)) (zeroValue!3050 V!4059) (minValue!3050 V!4059) (_size!814 (_ BitVec 32)) (_keys!5006 array!5695) (_values!3190 array!5697) (_vacant!814 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1530)

(declare-fun mapRest!5648 () (Array (_ BitVec 32) ValueCell!1311))

(declare-fun mapKey!5648 () (_ BitVec 32))

(assert (=> mapNonEmpty!5648 (= (arr!2694 (_values!3190 thiss!1248)) (store mapRest!5648 mapKey!5648 mapValue!5648))))

(declare-fun b!159103 () Bool)

(declare-fun res!75137 () Bool)

(declare-fun e!104173 () Bool)

(assert (=> b!159103 (=> (not res!75137) (not e!104173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5695 (_ BitVec 32)) Bool)

(assert (=> b!159103 (= res!75137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5006 thiss!1248) (mask!7748 thiss!1248)))))

(declare-fun e!104170 () Bool)

(declare-fun e!104172 () Bool)

(declare-fun tp_is_empty!3309 () Bool)

(declare-fun array_inv!1713 (array!5695) Bool)

(declare-fun array_inv!1714 (array!5697) Bool)

(assert (=> b!159104 (= e!104170 (and tp!13088 tp_is_empty!3309 (array_inv!1713 (_keys!5006 thiss!1248)) (array_inv!1714 (_values!3190 thiss!1248)) e!104172))))

(declare-fun b!159105 () Bool)

(declare-fun res!75133 () Bool)

(assert (=> b!159105 (=> (not res!75133) (not e!104173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159105 (= res!75133 (validMask!0 (mask!7748 thiss!1248)))))

(declare-fun b!159106 () Bool)

(declare-fun res!75131 () Bool)

(assert (=> b!159106 (=> (not res!75131) (not e!104173))))

(assert (=> b!159106 (= res!75131 (and (= (size!2978 (_values!3190 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7748 thiss!1248))) (= (size!2977 (_keys!5006 thiss!1248)) (size!2978 (_values!3190 thiss!1248))) (bvsge (mask!7748 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2948 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2948 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159107 () Bool)

(declare-fun res!75134 () Bool)

(assert (=> b!159107 (=> (not res!75134) (not e!104173))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!159107 (= res!75134 (not (= key!828 (bvneg key!828))))))

(declare-fun res!75135 () Bool)

(assert (=> start!16032 (=> (not res!75135) (not e!104173))))

(declare-fun valid!718 (LongMapFixedSize!1530) Bool)

(assert (=> start!16032 (= res!75135 (valid!718 thiss!1248))))

(assert (=> start!16032 e!104173))

(assert (=> start!16032 e!104170))

(assert (=> start!16032 true))

(declare-fun b!159108 () Bool)

(declare-fun e!104175 () Bool)

(assert (=> b!159108 (= e!104172 (and e!104175 mapRes!5648))))

(declare-fun condMapEmpty!5648 () Bool)

(declare-fun mapDefault!5648 () ValueCell!1311)

(assert (=> b!159108 (= condMapEmpty!5648 (= (arr!2694 (_values!3190 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1311)) mapDefault!5648)))))

(declare-fun b!159109 () Bool)

(declare-fun res!75132 () Bool)

(assert (=> b!159109 (=> (not res!75132) (not e!104173))))

(declare-datatypes ((List!1896 0))(
  ( (Nil!1893) (Cons!1892 (h!2505 (_ BitVec 64)) (t!6698 List!1896)) )
))
(declare-fun arrayNoDuplicates!0 (array!5695 (_ BitVec 32) List!1896) Bool)

(assert (=> b!159109 (= res!75132 (arrayNoDuplicates!0 (_keys!5006 thiss!1248) #b00000000000000000000000000000000 Nil!1893))))

(declare-fun b!159110 () Bool)

(assert (=> b!159110 (= e!104175 tp_is_empty!3309)))

(declare-fun b!159111 () Bool)

(declare-fun res!75136 () Bool)

(assert (=> b!159111 (=> (not res!75136) (not e!104173))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!306 0))(
  ( (MissingZero!306 (index!3392 (_ BitVec 32))) (Found!306 (index!3393 (_ BitVec 32))) (Intermediate!306 (undefined!1118 Bool) (index!3394 (_ BitVec 32)) (x!17570 (_ BitVec 32))) (Undefined!306) (MissingVacant!306 (index!3395 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5695 (_ BitVec 32)) SeekEntryResult!306)

(assert (=> b!159111 (= res!75136 ((_ is Undefined!306) (seekEntryOrOpen!0 key!828 (_keys!5006 thiss!1248) (mask!7748 thiss!1248))))))

(declare-fun b!159112 () Bool)

(assert (=> b!159112 (= e!104171 tp_is_empty!3309)))

(declare-fun b!159113 () Bool)

(assert (=> b!159113 (= e!104173 (bvsgt #b00000000000000000000000000000000 (size!2977 (_keys!5006 thiss!1248))))))

(declare-fun mapIsEmpty!5648 () Bool)

(assert (=> mapIsEmpty!5648 mapRes!5648))

(assert (= (and start!16032 res!75135) b!159107))

(assert (= (and b!159107 res!75134) b!159111))

(assert (= (and b!159111 res!75136) b!159105))

(assert (= (and b!159105 res!75133) b!159106))

(assert (= (and b!159106 res!75131) b!159103))

(assert (= (and b!159103 res!75137) b!159109))

(assert (= (and b!159109 res!75132) b!159113))

(assert (= (and b!159108 condMapEmpty!5648) mapIsEmpty!5648))

(assert (= (and b!159108 (not condMapEmpty!5648)) mapNonEmpty!5648))

(assert (= (and mapNonEmpty!5648 ((_ is ValueCellFull!1311) mapValue!5648)) b!159112))

(assert (= (and b!159108 ((_ is ValueCellFull!1311) mapDefault!5648)) b!159110))

(assert (= b!159104 b!159108))

(assert (= start!16032 b!159104))

(declare-fun m!191509 () Bool)

(assert (=> b!159111 m!191509))

(declare-fun m!191511 () Bool)

(assert (=> b!159105 m!191511))

(declare-fun m!191513 () Bool)

(assert (=> b!159109 m!191513))

(declare-fun m!191515 () Bool)

(assert (=> start!16032 m!191515))

(declare-fun m!191517 () Bool)

(assert (=> b!159104 m!191517))

(declare-fun m!191519 () Bool)

(assert (=> b!159104 m!191519))

(declare-fun m!191521 () Bool)

(assert (=> b!159103 m!191521))

(declare-fun m!191523 () Bool)

(assert (=> mapNonEmpty!5648 m!191523))

(check-sat (not b!159105) b_and!9921 (not mapNonEmpty!5648) (not b!159104) (not b_next!3507) (not b!159111) (not start!16032) (not b!159103) (not b!159109) tp_is_empty!3309)
(check-sat b_and!9921 (not b_next!3507))
(get-model)

(declare-fun d!51255 () Bool)

(assert (=> d!51255 (= (validMask!0 (mask!7748 thiss!1248)) (and (or (= (mask!7748 thiss!1248) #b00000000000000000000000000000111) (= (mask!7748 thiss!1248) #b00000000000000000000000000001111) (= (mask!7748 thiss!1248) #b00000000000000000000000000011111) (= (mask!7748 thiss!1248) #b00000000000000000000000000111111) (= (mask!7748 thiss!1248) #b00000000000000000000000001111111) (= (mask!7748 thiss!1248) #b00000000000000000000000011111111) (= (mask!7748 thiss!1248) #b00000000000000000000000111111111) (= (mask!7748 thiss!1248) #b00000000000000000000001111111111) (= (mask!7748 thiss!1248) #b00000000000000000000011111111111) (= (mask!7748 thiss!1248) #b00000000000000000000111111111111) (= (mask!7748 thiss!1248) #b00000000000000000001111111111111) (= (mask!7748 thiss!1248) #b00000000000000000011111111111111) (= (mask!7748 thiss!1248) #b00000000000000000111111111111111) (= (mask!7748 thiss!1248) #b00000000000000001111111111111111) (= (mask!7748 thiss!1248) #b00000000000000011111111111111111) (= (mask!7748 thiss!1248) #b00000000000000111111111111111111) (= (mask!7748 thiss!1248) #b00000000000001111111111111111111) (= (mask!7748 thiss!1248) #b00000000000011111111111111111111) (= (mask!7748 thiss!1248) #b00000000000111111111111111111111) (= (mask!7748 thiss!1248) #b00000000001111111111111111111111) (= (mask!7748 thiss!1248) #b00000000011111111111111111111111) (= (mask!7748 thiss!1248) #b00000000111111111111111111111111) (= (mask!7748 thiss!1248) #b00000001111111111111111111111111) (= (mask!7748 thiss!1248) #b00000011111111111111111111111111) (= (mask!7748 thiss!1248) #b00000111111111111111111111111111) (= (mask!7748 thiss!1248) #b00001111111111111111111111111111) (= (mask!7748 thiss!1248) #b00011111111111111111111111111111) (= (mask!7748 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7748 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!159105 d!51255))

(declare-fun b!159159 () Bool)

(declare-fun e!104200 () SeekEntryResult!306)

(declare-fun lt!81966 () SeekEntryResult!306)

(assert (=> b!159159 (= e!104200 (Found!306 (index!3394 lt!81966)))))

(declare-fun b!159160 () Bool)

(declare-fun e!104201 () SeekEntryResult!306)

(assert (=> b!159160 (= e!104201 (MissingZero!306 (index!3394 lt!81966)))))

(declare-fun b!159161 () Bool)

(declare-fun e!104202 () SeekEntryResult!306)

(assert (=> b!159161 (= e!104202 e!104200)))

(declare-fun lt!81965 () (_ BitVec 64))

(assert (=> b!159161 (= lt!81965 (select (arr!2693 (_keys!5006 thiss!1248)) (index!3394 lt!81966)))))

(declare-fun c!29925 () Bool)

(assert (=> b!159161 (= c!29925 (= lt!81965 key!828))))

(declare-fun b!159162 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5695 (_ BitVec 32)) SeekEntryResult!306)

(assert (=> b!159162 (= e!104201 (seekKeyOrZeroReturnVacant!0 (x!17570 lt!81966) (index!3394 lt!81966) (index!3394 lt!81966) key!828 (_keys!5006 thiss!1248) (mask!7748 thiss!1248)))))

(declare-fun b!159163 () Bool)

(declare-fun c!29924 () Bool)

(assert (=> b!159163 (= c!29924 (= lt!81965 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!159163 (= e!104200 e!104201)))

(declare-fun b!159164 () Bool)

(assert (=> b!159164 (= e!104202 Undefined!306)))

(declare-fun d!51257 () Bool)

(declare-fun lt!81967 () SeekEntryResult!306)

(assert (=> d!51257 (and (or ((_ is Undefined!306) lt!81967) (not ((_ is Found!306) lt!81967)) (and (bvsge (index!3393 lt!81967) #b00000000000000000000000000000000) (bvslt (index!3393 lt!81967) (size!2977 (_keys!5006 thiss!1248))))) (or ((_ is Undefined!306) lt!81967) ((_ is Found!306) lt!81967) (not ((_ is MissingZero!306) lt!81967)) (and (bvsge (index!3392 lt!81967) #b00000000000000000000000000000000) (bvslt (index!3392 lt!81967) (size!2977 (_keys!5006 thiss!1248))))) (or ((_ is Undefined!306) lt!81967) ((_ is Found!306) lt!81967) ((_ is MissingZero!306) lt!81967) (not ((_ is MissingVacant!306) lt!81967)) (and (bvsge (index!3395 lt!81967) #b00000000000000000000000000000000) (bvslt (index!3395 lt!81967) (size!2977 (_keys!5006 thiss!1248))))) (or ((_ is Undefined!306) lt!81967) (ite ((_ is Found!306) lt!81967) (= (select (arr!2693 (_keys!5006 thiss!1248)) (index!3393 lt!81967)) key!828) (ite ((_ is MissingZero!306) lt!81967) (= (select (arr!2693 (_keys!5006 thiss!1248)) (index!3392 lt!81967)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!306) lt!81967) (= (select (arr!2693 (_keys!5006 thiss!1248)) (index!3395 lt!81967)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51257 (= lt!81967 e!104202)))

(declare-fun c!29926 () Bool)

(assert (=> d!51257 (= c!29926 (and ((_ is Intermediate!306) lt!81966) (undefined!1118 lt!81966)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5695 (_ BitVec 32)) SeekEntryResult!306)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51257 (= lt!81966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7748 thiss!1248)) key!828 (_keys!5006 thiss!1248) (mask!7748 thiss!1248)))))

(assert (=> d!51257 (validMask!0 (mask!7748 thiss!1248))))

(assert (=> d!51257 (= (seekEntryOrOpen!0 key!828 (_keys!5006 thiss!1248) (mask!7748 thiss!1248)) lt!81967)))

(assert (= (and d!51257 c!29926) b!159164))

(assert (= (and d!51257 (not c!29926)) b!159161))

(assert (= (and b!159161 c!29925) b!159159))

(assert (= (and b!159161 (not c!29925)) b!159163))

(assert (= (and b!159163 c!29924) b!159160))

(assert (= (and b!159163 (not c!29924)) b!159162))

(declare-fun m!191541 () Bool)

(assert (=> b!159161 m!191541))

(declare-fun m!191543 () Bool)

(assert (=> b!159162 m!191543))

(declare-fun m!191545 () Bool)

(assert (=> d!51257 m!191545))

(declare-fun m!191547 () Bool)

(assert (=> d!51257 m!191547))

(declare-fun m!191549 () Bool)

(assert (=> d!51257 m!191549))

(assert (=> d!51257 m!191549))

(declare-fun m!191551 () Bool)

(assert (=> d!51257 m!191551))

(assert (=> d!51257 m!191511))

(declare-fun m!191553 () Bool)

(assert (=> d!51257 m!191553))

(assert (=> b!159111 d!51257))

(declare-fun d!51259 () Bool)

(declare-fun res!75165 () Bool)

(declare-fun e!104205 () Bool)

(assert (=> d!51259 (=> (not res!75165) (not e!104205))))

(declare-fun simpleValid!117 (LongMapFixedSize!1530) Bool)

(assert (=> d!51259 (= res!75165 (simpleValid!117 thiss!1248))))

(assert (=> d!51259 (= (valid!718 thiss!1248) e!104205)))

(declare-fun b!159171 () Bool)

(declare-fun res!75166 () Bool)

(assert (=> b!159171 (=> (not res!75166) (not e!104205))))

(declare-fun arrayCountValidKeys!0 (array!5695 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!159171 (= res!75166 (= (arrayCountValidKeys!0 (_keys!5006 thiss!1248) #b00000000000000000000000000000000 (size!2977 (_keys!5006 thiss!1248))) (_size!814 thiss!1248)))))

(declare-fun b!159172 () Bool)

(declare-fun res!75167 () Bool)

(assert (=> b!159172 (=> (not res!75167) (not e!104205))))

(assert (=> b!159172 (= res!75167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5006 thiss!1248) (mask!7748 thiss!1248)))))

(declare-fun b!159173 () Bool)

(assert (=> b!159173 (= e!104205 (arrayNoDuplicates!0 (_keys!5006 thiss!1248) #b00000000000000000000000000000000 Nil!1893))))

(assert (= (and d!51259 res!75165) b!159171))

(assert (= (and b!159171 res!75166) b!159172))

(assert (= (and b!159172 res!75167) b!159173))

(declare-fun m!191555 () Bool)

(assert (=> d!51259 m!191555))

(declare-fun m!191557 () Bool)

(assert (=> b!159171 m!191557))

(assert (=> b!159172 m!191521))

(assert (=> b!159173 m!191513))

(assert (=> start!16032 d!51259))

(declare-fun b!159182 () Bool)

(declare-fun e!104214 () Bool)

(declare-fun e!104212 () Bool)

(assert (=> b!159182 (= e!104214 e!104212)))

(declare-fun lt!81975 () (_ BitVec 64))

(assert (=> b!159182 (= lt!81975 (select (arr!2693 (_keys!5006 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4994 0))(
  ( (Unit!4995) )
))
(declare-fun lt!81976 () Unit!4994)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5695 (_ BitVec 64) (_ BitVec 32)) Unit!4994)

(assert (=> b!159182 (= lt!81976 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5006 thiss!1248) lt!81975 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!159182 (arrayContainsKey!0 (_keys!5006 thiss!1248) lt!81975 #b00000000000000000000000000000000)))

(declare-fun lt!81974 () Unit!4994)

(assert (=> b!159182 (= lt!81974 lt!81976)))

(declare-fun res!75172 () Bool)

(assert (=> b!159182 (= res!75172 (= (seekEntryOrOpen!0 (select (arr!2693 (_keys!5006 thiss!1248)) #b00000000000000000000000000000000) (_keys!5006 thiss!1248) (mask!7748 thiss!1248)) (Found!306 #b00000000000000000000000000000000)))))

(assert (=> b!159182 (=> (not res!75172) (not e!104212))))

(declare-fun b!159183 () Bool)

(declare-fun call!17281 () Bool)

(assert (=> b!159183 (= e!104212 call!17281)))

(declare-fun d!51261 () Bool)

(declare-fun res!75173 () Bool)

(declare-fun e!104213 () Bool)

(assert (=> d!51261 (=> res!75173 e!104213)))

(assert (=> d!51261 (= res!75173 (bvsge #b00000000000000000000000000000000 (size!2977 (_keys!5006 thiss!1248))))))

(assert (=> d!51261 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5006 thiss!1248) (mask!7748 thiss!1248)) e!104213)))

(declare-fun bm!17278 () Bool)

(assert (=> bm!17278 (= call!17281 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5006 thiss!1248) (mask!7748 thiss!1248)))))

(declare-fun b!159184 () Bool)

(assert (=> b!159184 (= e!104213 e!104214)))

(declare-fun c!29929 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!159184 (= c!29929 (validKeyInArray!0 (select (arr!2693 (_keys!5006 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!159185 () Bool)

(assert (=> b!159185 (= e!104214 call!17281)))

(assert (= (and d!51261 (not res!75173)) b!159184))

(assert (= (and b!159184 c!29929) b!159182))

(assert (= (and b!159184 (not c!29929)) b!159185))

(assert (= (and b!159182 res!75172) b!159183))

(assert (= (or b!159183 b!159185) bm!17278))

(declare-fun m!191559 () Bool)

(assert (=> b!159182 m!191559))

(declare-fun m!191561 () Bool)

(assert (=> b!159182 m!191561))

(declare-fun m!191563 () Bool)

(assert (=> b!159182 m!191563))

(assert (=> b!159182 m!191559))

(declare-fun m!191565 () Bool)

(assert (=> b!159182 m!191565))

(declare-fun m!191567 () Bool)

(assert (=> bm!17278 m!191567))

(assert (=> b!159184 m!191559))

(assert (=> b!159184 m!191559))

(declare-fun m!191569 () Bool)

(assert (=> b!159184 m!191569))

(assert (=> b!159103 d!51261))

(declare-fun b!159196 () Bool)

(declare-fun e!104223 () Bool)

(declare-fun call!17284 () Bool)

(assert (=> b!159196 (= e!104223 call!17284)))

(declare-fun b!159197 () Bool)

(declare-fun e!104225 () Bool)

(assert (=> b!159197 (= e!104225 e!104223)))

(declare-fun c!29932 () Bool)

(assert (=> b!159197 (= c!29932 (validKeyInArray!0 (select (arr!2693 (_keys!5006 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!159198 () Bool)

(declare-fun e!104224 () Bool)

(declare-fun contains!984 (List!1896 (_ BitVec 64)) Bool)

(assert (=> b!159198 (= e!104224 (contains!984 Nil!1893 (select (arr!2693 (_keys!5006 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!159199 () Bool)

(declare-fun e!104226 () Bool)

(assert (=> b!159199 (= e!104226 e!104225)))

(declare-fun res!75180 () Bool)

(assert (=> b!159199 (=> (not res!75180) (not e!104225))))

(assert (=> b!159199 (= res!75180 (not e!104224))))

(declare-fun res!75182 () Bool)

(assert (=> b!159199 (=> (not res!75182) (not e!104224))))

(assert (=> b!159199 (= res!75182 (validKeyInArray!0 (select (arr!2693 (_keys!5006 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51263 () Bool)

(declare-fun res!75181 () Bool)

(assert (=> d!51263 (=> res!75181 e!104226)))

(assert (=> d!51263 (= res!75181 (bvsge #b00000000000000000000000000000000 (size!2977 (_keys!5006 thiss!1248))))))

(assert (=> d!51263 (= (arrayNoDuplicates!0 (_keys!5006 thiss!1248) #b00000000000000000000000000000000 Nil!1893) e!104226)))

(declare-fun bm!17281 () Bool)

(assert (=> bm!17281 (= call!17284 (arrayNoDuplicates!0 (_keys!5006 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29932 (Cons!1892 (select (arr!2693 (_keys!5006 thiss!1248)) #b00000000000000000000000000000000) Nil!1893) Nil!1893)))))

(declare-fun b!159200 () Bool)

(assert (=> b!159200 (= e!104223 call!17284)))

(assert (= (and d!51263 (not res!75181)) b!159199))

(assert (= (and b!159199 res!75182) b!159198))

(assert (= (and b!159199 res!75180) b!159197))

(assert (= (and b!159197 c!29932) b!159200))

(assert (= (and b!159197 (not c!29932)) b!159196))

(assert (= (or b!159200 b!159196) bm!17281))

(assert (=> b!159197 m!191559))

(assert (=> b!159197 m!191559))

(assert (=> b!159197 m!191569))

(assert (=> b!159198 m!191559))

(assert (=> b!159198 m!191559))

(declare-fun m!191571 () Bool)

(assert (=> b!159198 m!191571))

(assert (=> b!159199 m!191559))

(assert (=> b!159199 m!191559))

(assert (=> b!159199 m!191569))

(assert (=> bm!17281 m!191559))

(declare-fun m!191573 () Bool)

(assert (=> bm!17281 m!191573))

(assert (=> b!159109 d!51263))

(declare-fun d!51265 () Bool)

(assert (=> d!51265 (= (array_inv!1713 (_keys!5006 thiss!1248)) (bvsge (size!2977 (_keys!5006 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!159104 d!51265))

(declare-fun d!51267 () Bool)

(assert (=> d!51267 (= (array_inv!1714 (_values!3190 thiss!1248)) (bvsge (size!2978 (_values!3190 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!159104 d!51267))

(declare-fun mapIsEmpty!5654 () Bool)

(declare-fun mapRes!5654 () Bool)

(assert (=> mapIsEmpty!5654 mapRes!5654))

(declare-fun b!159207 () Bool)

(declare-fun e!104232 () Bool)

(assert (=> b!159207 (= e!104232 tp_is_empty!3309)))

(declare-fun condMapEmpty!5654 () Bool)

(declare-fun mapDefault!5654 () ValueCell!1311)

(assert (=> mapNonEmpty!5648 (= condMapEmpty!5654 (= mapRest!5648 ((as const (Array (_ BitVec 32) ValueCell!1311)) mapDefault!5654)))))

(declare-fun e!104231 () Bool)

(assert (=> mapNonEmpty!5648 (= tp!13087 (and e!104231 mapRes!5654))))

(declare-fun mapNonEmpty!5654 () Bool)

(declare-fun tp!13097 () Bool)

(assert (=> mapNonEmpty!5654 (= mapRes!5654 (and tp!13097 e!104232))))

(declare-fun mapRest!5654 () (Array (_ BitVec 32) ValueCell!1311))

(declare-fun mapKey!5654 () (_ BitVec 32))

(declare-fun mapValue!5654 () ValueCell!1311)

(assert (=> mapNonEmpty!5654 (= mapRest!5648 (store mapRest!5654 mapKey!5654 mapValue!5654))))

(declare-fun b!159208 () Bool)

(assert (=> b!159208 (= e!104231 tp_is_empty!3309)))

(assert (= (and mapNonEmpty!5648 condMapEmpty!5654) mapIsEmpty!5654))

(assert (= (and mapNonEmpty!5648 (not condMapEmpty!5654)) mapNonEmpty!5654))

(assert (= (and mapNonEmpty!5654 ((_ is ValueCellFull!1311) mapValue!5654)) b!159207))

(assert (= (and mapNonEmpty!5648 ((_ is ValueCellFull!1311) mapDefault!5654)) b!159208))

(declare-fun m!191575 () Bool)

(assert (=> mapNonEmpty!5654 m!191575))

(check-sat (not b!159171) (not mapNonEmpty!5654) (not b!159198) (not b!159173) (not b!159182) (not d!51257) (not b!159199) (not b!159162) (not d!51259) (not b!159197) (not bm!17278) (not bm!17281) b_and!9921 (not b_next!3507) (not b!159172) (not b!159184) tp_is_empty!3309)
(check-sat b_and!9921 (not b_next!3507))
