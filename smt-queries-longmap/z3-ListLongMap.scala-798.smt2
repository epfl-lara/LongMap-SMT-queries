; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19164 () Bool)

(assert start!19164)

(declare-fun b!188560 () Bool)

(declare-fun b_free!4629 () Bool)

(declare-fun b_next!4629 () Bool)

(assert (=> b!188560 (= b_free!4629 (not b_next!4629))))

(declare-fun tp!16711 () Bool)

(declare-fun b_and!11261 () Bool)

(assert (=> b!188560 (= tp!16711 b_and!11261)))

(declare-fun b!188558 () Bool)

(declare-fun e!124096 () Bool)

(declare-fun e!124101 () Bool)

(assert (=> b!188558 (= e!124096 e!124101)))

(declare-fun res!89134 () Bool)

(assert (=> b!188558 (=> (not res!89134) (not e!124101))))

(declare-datatypes ((SeekEntryResult!655 0))(
  ( (MissingZero!655 (index!4790 (_ BitVec 32))) (Found!655 (index!4791 (_ BitVec 32))) (Intermediate!655 (undefined!1467 Bool) (index!4792 (_ BitVec 32)) (x!20359 (_ BitVec 32))) (Undefined!655) (MissingVacant!655 (index!4793 (_ BitVec 32))) )
))
(declare-fun lt!93329 () SeekEntryResult!655)

(get-info :version)

(assert (=> b!188558 (= res!89134 (and (not ((_ is Undefined!655) lt!93329)) (not ((_ is MissingVacant!655) lt!93329)) (not ((_ is MissingZero!655) lt!93329)) ((_ is Found!655) lt!93329)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5515 0))(
  ( (V!5516 (val!2245 Int)) )
))
(declare-datatypes ((ValueCell!1857 0))(
  ( (ValueCellFull!1857 (v!4163 V!5515)) (EmptyCell!1857) )
))
(declare-datatypes ((array!8025 0))(
  ( (array!8026 (arr!3785 (Array (_ BitVec 32) (_ BitVec 64))) (size!4105 (_ BitVec 32))) )
))
(declare-datatypes ((array!8027 0))(
  ( (array!8028 (arr!3786 (Array (_ BitVec 32) ValueCell!1857)) (size!4106 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2622 0))(
  ( (LongMapFixedSize!2623 (defaultEntry!3846 Int) (mask!9015 (_ BitVec 32)) (extraKeys!3583 (_ BitVec 32)) (zeroValue!3687 V!5515) (minValue!3687 V!5515) (_size!1360 (_ BitVec 32)) (_keys!5807 array!8025) (_values!3829 array!8027) (_vacant!1360 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2622)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8025 (_ BitVec 32)) SeekEntryResult!655)

(assert (=> b!188558 (= lt!93329 (seekEntryOrOpen!0 key!828 (_keys!5807 thiss!1248) (mask!9015 thiss!1248)))))

(declare-fun b!188559 () Bool)

(declare-fun e!124097 () Bool)

(declare-fun tp_is_empty!4401 () Bool)

(assert (=> b!188559 (= e!124097 tp_is_empty!4401)))

(declare-fun e!124102 () Bool)

(declare-fun e!124099 () Bool)

(declare-fun array_inv!2451 (array!8025) Bool)

(declare-fun array_inv!2452 (array!8027) Bool)

(assert (=> b!188560 (= e!124102 (and tp!16711 tp_is_empty!4401 (array_inv!2451 (_keys!5807 thiss!1248)) (array_inv!2452 (_values!3829 thiss!1248)) e!124099))))

(declare-fun b!188561 () Bool)

(declare-fun e!124095 () Bool)

(assert (=> b!188561 (= e!124101 e!124095)))

(declare-fun res!89140 () Bool)

(assert (=> b!188561 (=> (not res!89140) (not e!124095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!188561 (= res!89140 (validMask!0 (mask!9015 thiss!1248)))))

(declare-datatypes ((Unit!5686 0))(
  ( (Unit!5687) )
))
(declare-fun lt!93326 () Unit!5686)

(declare-fun e!124104 () Unit!5686)

(assert (=> b!188561 (= lt!93326 e!124104)))

(declare-fun c!33890 () Bool)

(declare-datatypes ((tuple2!3494 0))(
  ( (tuple2!3495 (_1!1758 (_ BitVec 64)) (_2!1758 V!5515)) )
))
(declare-datatypes ((List!2393 0))(
  ( (Nil!2390) (Cons!2389 (h!3026 tuple2!3494) (t!7291 List!2393)) )
))
(declare-datatypes ((ListLongMap!2411 0))(
  ( (ListLongMap!2412 (toList!1221 List!2393)) )
))
(declare-fun contains!1325 (ListLongMap!2411 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!869 (array!8025 array!8027 (_ BitVec 32) (_ BitVec 32) V!5515 V!5515 (_ BitVec 32) Int) ListLongMap!2411)

(assert (=> b!188561 (= c!33890 (contains!1325 (getCurrentListMap!869 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3846 thiss!1248)) key!828))))

(declare-fun res!89136 () Bool)

(assert (=> start!19164 (=> (not res!89136) (not e!124096))))

(declare-fun valid!1079 (LongMapFixedSize!2622) Bool)

(assert (=> start!19164 (= res!89136 (valid!1079 thiss!1248))))

(assert (=> start!19164 e!124096))

(assert (=> start!19164 e!124102))

(assert (=> start!19164 true))

(declare-fun b!188562 () Bool)

(declare-datatypes ((List!2394 0))(
  ( (Nil!2391) (Cons!2390 (h!3027 (_ BitVec 64)) (t!7292 List!2394)) )
))
(declare-fun arrayNoDuplicates!0 (array!8025 (_ BitVec 32) List!2394) Bool)

(assert (=> b!188562 (= e!124095 (not (arrayNoDuplicates!0 (_keys!5807 thiss!1248) #b00000000000000000000000000000000 Nil!2391)))))

(declare-fun b!188563 () Bool)

(declare-fun Unit!5688 () Unit!5686)

(assert (=> b!188563 (= e!124104 Unit!5688)))

(declare-fun lt!93327 () Unit!5686)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!161 (array!8025 array!8027 (_ BitVec 32) (_ BitVec 32) V!5515 V!5515 (_ BitVec 64) Int) Unit!5686)

(assert (=> b!188563 (= lt!93327 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!161 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) key!828 (defaultEntry!3846 thiss!1248)))))

(assert (=> b!188563 false))

(declare-fun mapNonEmpty!7588 () Bool)

(declare-fun mapRes!7588 () Bool)

(declare-fun tp!16710 () Bool)

(declare-fun e!124098 () Bool)

(assert (=> mapNonEmpty!7588 (= mapRes!7588 (and tp!16710 e!124098))))

(declare-fun mapRest!7588 () (Array (_ BitVec 32) ValueCell!1857))

(declare-fun mapKey!7588 () (_ BitVec 32))

(declare-fun mapValue!7588 () ValueCell!1857)

(assert (=> mapNonEmpty!7588 (= (arr!3786 (_values!3829 thiss!1248)) (store mapRest!7588 mapKey!7588 mapValue!7588))))

(declare-fun b!188564 () Bool)

(declare-fun lt!93328 () Unit!5686)

(assert (=> b!188564 (= e!124104 lt!93328)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!157 (array!8025 array!8027 (_ BitVec 32) (_ BitVec 32) V!5515 V!5515 (_ BitVec 64) Int) Unit!5686)

(assert (=> b!188564 (= lt!93328 (lemmaInListMapThenSeekEntryOrOpenFindsIt!157 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) key!828 (defaultEntry!3846 thiss!1248)))))

(declare-fun res!89137 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188564 (= res!89137 (inRange!0 (index!4791 lt!93329) (mask!9015 thiss!1248)))))

(declare-fun e!124100 () Bool)

(assert (=> b!188564 (=> (not res!89137) (not e!124100))))

(assert (=> b!188564 e!124100))

(declare-fun mapIsEmpty!7588 () Bool)

(assert (=> mapIsEmpty!7588 mapRes!7588))

(declare-fun b!188565 () Bool)

(declare-fun res!89139 () Bool)

(assert (=> b!188565 (=> (not res!89139) (not e!124096))))

(assert (=> b!188565 (= res!89139 (not (= key!828 (bvneg key!828))))))

(declare-fun b!188566 () Bool)

(assert (=> b!188566 (= e!124099 (and e!124097 mapRes!7588))))

(declare-fun condMapEmpty!7588 () Bool)

(declare-fun mapDefault!7588 () ValueCell!1857)

(assert (=> b!188566 (= condMapEmpty!7588 (= (arr!3786 (_values!3829 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1857)) mapDefault!7588)))))

(declare-fun b!188567 () Bool)

(assert (=> b!188567 (= e!124100 (= (select (arr!3785 (_keys!5807 thiss!1248)) (index!4791 lt!93329)) key!828))))

(declare-fun b!188568 () Bool)

(declare-fun res!89138 () Bool)

(assert (=> b!188568 (=> (not res!89138) (not e!124095))))

(assert (=> b!188568 (= res!89138 (and (= (size!4106 (_values!3829 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9015 thiss!1248))) (= (size!4105 (_keys!5807 thiss!1248)) (size!4106 (_values!3829 thiss!1248))) (bvsge (mask!9015 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3583 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3583 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!188569 () Bool)

(assert (=> b!188569 (= e!124098 tp_is_empty!4401)))

(declare-fun b!188570 () Bool)

(declare-fun res!89135 () Bool)

(assert (=> b!188570 (=> (not res!89135) (not e!124095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8025 (_ BitVec 32)) Bool)

(assert (=> b!188570 (= res!89135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5807 thiss!1248) (mask!9015 thiss!1248)))))

(assert (= (and start!19164 res!89136) b!188565))

(assert (= (and b!188565 res!89139) b!188558))

(assert (= (and b!188558 res!89134) b!188561))

(assert (= (and b!188561 c!33890) b!188564))

(assert (= (and b!188561 (not c!33890)) b!188563))

(assert (= (and b!188564 res!89137) b!188567))

(assert (= (and b!188561 res!89140) b!188568))

(assert (= (and b!188568 res!89138) b!188570))

(assert (= (and b!188570 res!89135) b!188562))

(assert (= (and b!188566 condMapEmpty!7588) mapIsEmpty!7588))

(assert (= (and b!188566 (not condMapEmpty!7588)) mapNonEmpty!7588))

(assert (= (and mapNonEmpty!7588 ((_ is ValueCellFull!1857) mapValue!7588)) b!188569))

(assert (= (and b!188566 ((_ is ValueCellFull!1857) mapDefault!7588)) b!188559))

(assert (= b!188560 b!188566))

(assert (= start!19164 b!188560))

(declare-fun m!215179 () Bool)

(assert (=> b!188560 m!215179))

(declare-fun m!215181 () Bool)

(assert (=> b!188560 m!215181))

(declare-fun m!215183 () Bool)

(assert (=> b!188558 m!215183))

(declare-fun m!215185 () Bool)

(assert (=> b!188562 m!215185))

(declare-fun m!215187 () Bool)

(assert (=> start!19164 m!215187))

(declare-fun m!215189 () Bool)

(assert (=> mapNonEmpty!7588 m!215189))

(declare-fun m!215191 () Bool)

(assert (=> b!188570 m!215191))

(declare-fun m!215193 () Bool)

(assert (=> b!188561 m!215193))

(declare-fun m!215195 () Bool)

(assert (=> b!188561 m!215195))

(assert (=> b!188561 m!215195))

(declare-fun m!215197 () Bool)

(assert (=> b!188561 m!215197))

(declare-fun m!215199 () Bool)

(assert (=> b!188564 m!215199))

(declare-fun m!215201 () Bool)

(assert (=> b!188564 m!215201))

(declare-fun m!215203 () Bool)

(assert (=> b!188563 m!215203))

(declare-fun m!215205 () Bool)

(assert (=> b!188567 m!215205))

(check-sat (not b!188570) (not b!188564) (not b!188562) (not mapNonEmpty!7588) tp_is_empty!4401 (not b!188560) (not b!188563) (not b!188561) (not b!188558) (not start!19164) (not b_next!4629) b_and!11261)
(check-sat b_and!11261 (not b_next!4629))
(get-model)

(declare-fun d!55635 () Bool)

(assert (=> d!55635 (= (array_inv!2451 (_keys!5807 thiss!1248)) (bvsge (size!4105 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188560 d!55635))

(declare-fun d!55637 () Bool)

(assert (=> d!55637 (= (array_inv!2452 (_values!3829 thiss!1248)) (bvsge (size!4106 (_values!3829 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188560 d!55637))

(declare-fun d!55639 () Bool)

(declare-fun e!124137 () Bool)

(assert (=> d!55639 e!124137))

(declare-fun res!89167 () Bool)

(assert (=> d!55639 (=> (not res!89167) (not e!124137))))

(declare-fun lt!93346 () SeekEntryResult!655)

(assert (=> d!55639 (= res!89167 ((_ is Found!655) lt!93346))))

(assert (=> d!55639 (= lt!93346 (seekEntryOrOpen!0 key!828 (_keys!5807 thiss!1248) (mask!9015 thiss!1248)))))

(declare-fun lt!93347 () Unit!5686)

(declare-fun choose!1008 (array!8025 array!8027 (_ BitVec 32) (_ BitVec 32) V!5515 V!5515 (_ BitVec 64) Int) Unit!5686)

(assert (=> d!55639 (= lt!93347 (choose!1008 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) key!828 (defaultEntry!3846 thiss!1248)))))

(assert (=> d!55639 (validMask!0 (mask!9015 thiss!1248))))

(assert (=> d!55639 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!157 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) key!828 (defaultEntry!3846 thiss!1248)) lt!93347)))

(declare-fun b!188614 () Bool)

(declare-fun res!89166 () Bool)

(assert (=> b!188614 (=> (not res!89166) (not e!124137))))

(assert (=> b!188614 (= res!89166 (inRange!0 (index!4791 lt!93346) (mask!9015 thiss!1248)))))

(declare-fun b!188615 () Bool)

(assert (=> b!188615 (= e!124137 (= (select (arr!3785 (_keys!5807 thiss!1248)) (index!4791 lt!93346)) key!828))))

(assert (=> b!188615 (and (bvsge (index!4791 lt!93346) #b00000000000000000000000000000000) (bvslt (index!4791 lt!93346) (size!4105 (_keys!5807 thiss!1248))))))

(assert (= (and d!55639 res!89167) b!188614))

(assert (= (and b!188614 res!89166) b!188615))

(assert (=> d!55639 m!215183))

(declare-fun m!215235 () Bool)

(assert (=> d!55639 m!215235))

(assert (=> d!55639 m!215193))

(declare-fun m!215237 () Bool)

(assert (=> b!188614 m!215237))

(declare-fun m!215239 () Bool)

(assert (=> b!188615 m!215239))

(assert (=> b!188564 d!55639))

(declare-fun d!55641 () Bool)

(assert (=> d!55641 (= (inRange!0 (index!4791 lt!93329) (mask!9015 thiss!1248)) (and (bvsge (index!4791 lt!93329) #b00000000000000000000000000000000) (bvslt (index!4791 lt!93329) (bvadd (mask!9015 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!188564 d!55641))

(declare-fun d!55643 () Bool)

(declare-fun res!89172 () Bool)

(declare-fun e!124144 () Bool)

(assert (=> d!55643 (=> res!89172 e!124144)))

(assert (=> d!55643 (= res!89172 (bvsge #b00000000000000000000000000000000 (size!4105 (_keys!5807 thiss!1248))))))

(assert (=> d!55643 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5807 thiss!1248) (mask!9015 thiss!1248)) e!124144)))

(declare-fun b!188624 () Bool)

(declare-fun e!124146 () Bool)

(declare-fun call!19006 () Bool)

(assert (=> b!188624 (= e!124146 call!19006)))

(declare-fun b!188625 () Bool)

(declare-fun e!124145 () Bool)

(assert (=> b!188625 (= e!124145 e!124146)))

(declare-fun lt!93355 () (_ BitVec 64))

(assert (=> b!188625 (= lt!93355 (select (arr!3785 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93356 () Unit!5686)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8025 (_ BitVec 64) (_ BitVec 32)) Unit!5686)

(assert (=> b!188625 (= lt!93356 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5807 thiss!1248) lt!93355 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!188625 (arrayContainsKey!0 (_keys!5807 thiss!1248) lt!93355 #b00000000000000000000000000000000)))

(declare-fun lt!93354 () Unit!5686)

(assert (=> b!188625 (= lt!93354 lt!93356)))

(declare-fun res!89173 () Bool)

(assert (=> b!188625 (= res!89173 (= (seekEntryOrOpen!0 (select (arr!3785 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000) (_keys!5807 thiss!1248) (mask!9015 thiss!1248)) (Found!655 #b00000000000000000000000000000000)))))

(assert (=> b!188625 (=> (not res!89173) (not e!124146))))

(declare-fun b!188626 () Bool)

(assert (=> b!188626 (= e!124145 call!19006)))

(declare-fun bm!19003 () Bool)

(assert (=> bm!19003 (= call!19006 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5807 thiss!1248) (mask!9015 thiss!1248)))))

(declare-fun b!188627 () Bool)

(assert (=> b!188627 (= e!124144 e!124145)))

(declare-fun c!33896 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!188627 (= c!33896 (validKeyInArray!0 (select (arr!3785 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55643 (not res!89172)) b!188627))

(assert (= (and b!188627 c!33896) b!188625))

(assert (= (and b!188627 (not c!33896)) b!188626))

(assert (= (and b!188625 res!89173) b!188624))

(assert (= (or b!188624 b!188626) bm!19003))

(declare-fun m!215241 () Bool)

(assert (=> b!188625 m!215241))

(declare-fun m!215243 () Bool)

(assert (=> b!188625 m!215243))

(declare-fun m!215245 () Bool)

(assert (=> b!188625 m!215245))

(assert (=> b!188625 m!215241))

(declare-fun m!215247 () Bool)

(assert (=> b!188625 m!215247))

(declare-fun m!215249 () Bool)

(assert (=> bm!19003 m!215249))

(assert (=> b!188627 m!215241))

(assert (=> b!188627 m!215241))

(declare-fun m!215251 () Bool)

(assert (=> b!188627 m!215251))

(assert (=> b!188570 d!55643))

(declare-fun d!55645 () Bool)

(assert (=> d!55645 (= (validMask!0 (mask!9015 thiss!1248)) (and (or (= (mask!9015 thiss!1248) #b00000000000000000000000000000111) (= (mask!9015 thiss!1248) #b00000000000000000000000000001111) (= (mask!9015 thiss!1248) #b00000000000000000000000000011111) (= (mask!9015 thiss!1248) #b00000000000000000000000000111111) (= (mask!9015 thiss!1248) #b00000000000000000000000001111111) (= (mask!9015 thiss!1248) #b00000000000000000000000011111111) (= (mask!9015 thiss!1248) #b00000000000000000000000111111111) (= (mask!9015 thiss!1248) #b00000000000000000000001111111111) (= (mask!9015 thiss!1248) #b00000000000000000000011111111111) (= (mask!9015 thiss!1248) #b00000000000000000000111111111111) (= (mask!9015 thiss!1248) #b00000000000000000001111111111111) (= (mask!9015 thiss!1248) #b00000000000000000011111111111111) (= (mask!9015 thiss!1248) #b00000000000000000111111111111111) (= (mask!9015 thiss!1248) #b00000000000000001111111111111111) (= (mask!9015 thiss!1248) #b00000000000000011111111111111111) (= (mask!9015 thiss!1248) #b00000000000000111111111111111111) (= (mask!9015 thiss!1248) #b00000000000001111111111111111111) (= (mask!9015 thiss!1248) #b00000000000011111111111111111111) (= (mask!9015 thiss!1248) #b00000000000111111111111111111111) (= (mask!9015 thiss!1248) #b00000000001111111111111111111111) (= (mask!9015 thiss!1248) #b00000000011111111111111111111111) (= (mask!9015 thiss!1248) #b00000000111111111111111111111111) (= (mask!9015 thiss!1248) #b00000001111111111111111111111111) (= (mask!9015 thiss!1248) #b00000011111111111111111111111111) (= (mask!9015 thiss!1248) #b00000111111111111111111111111111) (= (mask!9015 thiss!1248) #b00001111111111111111111111111111) (= (mask!9015 thiss!1248) #b00011111111111111111111111111111) (= (mask!9015 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9015 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!188561 d!55645))

(declare-fun d!55647 () Bool)

(declare-fun e!124151 () Bool)

(assert (=> d!55647 e!124151))

(declare-fun res!89176 () Bool)

(assert (=> d!55647 (=> res!89176 e!124151)))

(declare-fun lt!93368 () Bool)

(assert (=> d!55647 (= res!89176 (not lt!93368))))

(declare-fun lt!93366 () Bool)

(assert (=> d!55647 (= lt!93368 lt!93366)))

(declare-fun lt!93365 () Unit!5686)

(declare-fun e!124152 () Unit!5686)

(assert (=> d!55647 (= lt!93365 e!124152)))

(declare-fun c!33899 () Bool)

(assert (=> d!55647 (= c!33899 lt!93366)))

(declare-fun containsKey!235 (List!2393 (_ BitVec 64)) Bool)

(assert (=> d!55647 (= lt!93366 (containsKey!235 (toList!1221 (getCurrentListMap!869 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3846 thiss!1248))) key!828))))

(assert (=> d!55647 (= (contains!1325 (getCurrentListMap!869 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3846 thiss!1248)) key!828) lt!93368)))

(declare-fun b!188634 () Bool)

(declare-fun lt!93367 () Unit!5686)

(assert (=> b!188634 (= e!124152 lt!93367)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!183 (List!2393 (_ BitVec 64)) Unit!5686)

(assert (=> b!188634 (= lt!93367 (lemmaContainsKeyImpliesGetValueByKeyDefined!183 (toList!1221 (getCurrentListMap!869 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3846 thiss!1248))) key!828))))

(declare-datatypes ((Option!237 0))(
  ( (Some!236 (v!4165 V!5515)) (None!235) )
))
(declare-fun isDefined!184 (Option!237) Bool)

(declare-fun getValueByKey!231 (List!2393 (_ BitVec 64)) Option!237)

(assert (=> b!188634 (isDefined!184 (getValueByKey!231 (toList!1221 (getCurrentListMap!869 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3846 thiss!1248))) key!828))))

(declare-fun b!188635 () Bool)

(declare-fun Unit!5689 () Unit!5686)

(assert (=> b!188635 (= e!124152 Unit!5689)))

(declare-fun b!188636 () Bool)

(assert (=> b!188636 (= e!124151 (isDefined!184 (getValueByKey!231 (toList!1221 (getCurrentListMap!869 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3846 thiss!1248))) key!828)))))

(assert (= (and d!55647 c!33899) b!188634))

(assert (= (and d!55647 (not c!33899)) b!188635))

(assert (= (and d!55647 (not res!89176)) b!188636))

(declare-fun m!215253 () Bool)

(assert (=> d!55647 m!215253))

(declare-fun m!215255 () Bool)

(assert (=> b!188634 m!215255))

(declare-fun m!215257 () Bool)

(assert (=> b!188634 m!215257))

(assert (=> b!188634 m!215257))

(declare-fun m!215259 () Bool)

(assert (=> b!188634 m!215259))

(assert (=> b!188636 m!215257))

(assert (=> b!188636 m!215257))

(assert (=> b!188636 m!215259))

(assert (=> b!188561 d!55647))

(declare-fun b!188679 () Bool)

(declare-fun e!124189 () Bool)

(declare-fun call!19021 () Bool)

(assert (=> b!188679 (= e!124189 (not call!19021))))

(declare-fun b!188680 () Bool)

(declare-fun e!124185 () Unit!5686)

(declare-fun lt!93432 () Unit!5686)

(assert (=> b!188680 (= e!124185 lt!93432)))

(declare-fun lt!93423 () ListLongMap!2411)

(declare-fun getCurrentListMapNoExtraKeys!207 (array!8025 array!8027 (_ BitVec 32) (_ BitVec 32) V!5515 V!5515 (_ BitVec 32) Int) ListLongMap!2411)

(assert (=> b!188680 (= lt!93423 (getCurrentListMapNoExtraKeys!207 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3846 thiss!1248)))))

(declare-fun lt!93422 () (_ BitVec 64))

(assert (=> b!188680 (= lt!93422 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93419 () (_ BitVec 64))

(assert (=> b!188680 (= lt!93419 (select (arr!3785 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93427 () Unit!5686)

(declare-fun addStillContains!150 (ListLongMap!2411 (_ BitVec 64) V!5515 (_ BitVec 64)) Unit!5686)

(assert (=> b!188680 (= lt!93427 (addStillContains!150 lt!93423 lt!93422 (zeroValue!3687 thiss!1248) lt!93419))))

(declare-fun +!294 (ListLongMap!2411 tuple2!3494) ListLongMap!2411)

(assert (=> b!188680 (contains!1325 (+!294 lt!93423 (tuple2!3495 lt!93422 (zeroValue!3687 thiss!1248))) lt!93419)))

(declare-fun lt!93431 () Unit!5686)

(assert (=> b!188680 (= lt!93431 lt!93427)))

(declare-fun lt!93417 () ListLongMap!2411)

(assert (=> b!188680 (= lt!93417 (getCurrentListMapNoExtraKeys!207 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3846 thiss!1248)))))

(declare-fun lt!93420 () (_ BitVec 64))

(assert (=> b!188680 (= lt!93420 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93430 () (_ BitVec 64))

(assert (=> b!188680 (= lt!93430 (select (arr!3785 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93421 () Unit!5686)

(declare-fun addApplyDifferent!150 (ListLongMap!2411 (_ BitVec 64) V!5515 (_ BitVec 64)) Unit!5686)

(assert (=> b!188680 (= lt!93421 (addApplyDifferent!150 lt!93417 lt!93420 (minValue!3687 thiss!1248) lt!93430))))

(declare-fun apply!174 (ListLongMap!2411 (_ BitVec 64)) V!5515)

(assert (=> b!188680 (= (apply!174 (+!294 lt!93417 (tuple2!3495 lt!93420 (minValue!3687 thiss!1248))) lt!93430) (apply!174 lt!93417 lt!93430))))

(declare-fun lt!93418 () Unit!5686)

(assert (=> b!188680 (= lt!93418 lt!93421)))

(declare-fun lt!93414 () ListLongMap!2411)

(assert (=> b!188680 (= lt!93414 (getCurrentListMapNoExtraKeys!207 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3846 thiss!1248)))))

(declare-fun lt!93416 () (_ BitVec 64))

(assert (=> b!188680 (= lt!93416 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93426 () (_ BitVec 64))

(assert (=> b!188680 (= lt!93426 (select (arr!3785 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93434 () Unit!5686)

(assert (=> b!188680 (= lt!93434 (addApplyDifferent!150 lt!93414 lt!93416 (zeroValue!3687 thiss!1248) lt!93426))))

(assert (=> b!188680 (= (apply!174 (+!294 lt!93414 (tuple2!3495 lt!93416 (zeroValue!3687 thiss!1248))) lt!93426) (apply!174 lt!93414 lt!93426))))

(declare-fun lt!93433 () Unit!5686)

(assert (=> b!188680 (= lt!93433 lt!93434)))

(declare-fun lt!93424 () ListLongMap!2411)

(assert (=> b!188680 (= lt!93424 (getCurrentListMapNoExtraKeys!207 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3846 thiss!1248)))))

(declare-fun lt!93413 () (_ BitVec 64))

(assert (=> b!188680 (= lt!93413 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93425 () (_ BitVec 64))

(assert (=> b!188680 (= lt!93425 (select (arr!3785 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188680 (= lt!93432 (addApplyDifferent!150 lt!93424 lt!93413 (minValue!3687 thiss!1248) lt!93425))))

(assert (=> b!188680 (= (apply!174 (+!294 lt!93424 (tuple2!3495 lt!93413 (minValue!3687 thiss!1248))) lt!93425) (apply!174 lt!93424 lt!93425))))

(declare-fun b!188681 () Bool)

(declare-fun e!124188 () Bool)

(declare-fun lt!93429 () ListLongMap!2411)

(declare-fun get!2181 (ValueCell!1857 V!5515) V!5515)

(declare-fun dynLambda!517 (Int (_ BitVec 64)) V!5515)

(assert (=> b!188681 (= e!124188 (= (apply!174 lt!93429 (select (arr!3785 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000)) (get!2181 (select (arr!3786 (_values!3829 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3846 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!188681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4106 (_values!3829 thiss!1248))))))

(assert (=> b!188681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4105 (_keys!5807 thiss!1248))))))

(declare-fun b!188682 () Bool)

(declare-fun e!124186 () Bool)

(assert (=> b!188682 (= e!124186 (= (apply!174 lt!93429 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3687 thiss!1248)))))

(declare-fun bm!19018 () Bool)

(declare-fun call!19024 () ListLongMap!2411)

(assert (=> bm!19018 (= call!19024 (getCurrentListMapNoExtraKeys!207 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3846 thiss!1248)))))

(declare-fun b!188683 () Bool)

(declare-fun e!124190 () Bool)

(assert (=> b!188683 (= e!124190 e!124188)))

(declare-fun res!89199 () Bool)

(assert (=> b!188683 (=> (not res!89199) (not e!124188))))

(assert (=> b!188683 (= res!89199 (contains!1325 lt!93429 (select (arr!3785 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!188683 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4105 (_keys!5807 thiss!1248))))))

(declare-fun b!188684 () Bool)

(declare-fun e!124182 () ListLongMap!2411)

(declare-fun call!19025 () ListLongMap!2411)

(assert (=> b!188684 (= e!124182 call!19025)))

(declare-fun b!188685 () Bool)

(declare-fun e!124180 () ListLongMap!2411)

(assert (=> b!188685 (= e!124180 e!124182)))

(declare-fun c!33913 () Bool)

(assert (=> b!188685 (= c!33913 (and (not (= (bvand (extraKeys!3583 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3583 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19019 () Bool)

(declare-fun call!19027 () Bool)

(assert (=> bm!19019 (= call!19027 (contains!1325 lt!93429 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188686 () Bool)

(declare-fun Unit!5690 () Unit!5686)

(assert (=> b!188686 (= e!124185 Unit!5690)))

(declare-fun b!188687 () Bool)

(declare-fun e!124181 () ListLongMap!2411)

(assert (=> b!188687 (= e!124181 call!19025)))

(declare-fun b!188688 () Bool)

(declare-fun e!124179 () Bool)

(assert (=> b!188688 (= e!124179 (validKeyInArray!0 (select (arr!3785 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun call!19023 () ListLongMap!2411)

(declare-fun bm!19020 () Bool)

(declare-fun c!33912 () Bool)

(declare-fun call!19022 () ListLongMap!2411)

(declare-fun call!19026 () ListLongMap!2411)

(assert (=> bm!19020 (= call!19023 (+!294 (ite c!33912 call!19024 (ite c!33913 call!19026 call!19022)) (ite (or c!33912 c!33913) (tuple2!3495 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3687 thiss!1248)) (tuple2!3495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3687 thiss!1248)))))))

(declare-fun d!55649 () Bool)

(declare-fun e!124184 () Bool)

(assert (=> d!55649 e!124184))

(declare-fun res!89201 () Bool)

(assert (=> d!55649 (=> (not res!89201) (not e!124184))))

(assert (=> d!55649 (= res!89201 (or (bvsge #b00000000000000000000000000000000 (size!4105 (_keys!5807 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4105 (_keys!5807 thiss!1248))))))))

(declare-fun lt!93428 () ListLongMap!2411)

(assert (=> d!55649 (= lt!93429 lt!93428)))

(declare-fun lt!93415 () Unit!5686)

(assert (=> d!55649 (= lt!93415 e!124185)))

(declare-fun c!33917 () Bool)

(declare-fun e!124183 () Bool)

(assert (=> d!55649 (= c!33917 e!124183)))

(declare-fun res!89195 () Bool)

(assert (=> d!55649 (=> (not res!89195) (not e!124183))))

(assert (=> d!55649 (= res!89195 (bvslt #b00000000000000000000000000000000 (size!4105 (_keys!5807 thiss!1248))))))

(assert (=> d!55649 (= lt!93428 e!124180)))

(assert (=> d!55649 (= c!33912 (and (not (= (bvand (extraKeys!3583 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3583 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55649 (validMask!0 (mask!9015 thiss!1248))))

(assert (=> d!55649 (= (getCurrentListMap!869 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3846 thiss!1248)) lt!93429)))

(declare-fun b!188689 () Bool)

(assert (=> b!188689 (= e!124183 (validKeyInArray!0 (select (arr!3785 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188690 () Bool)

(assert (=> b!188690 (= e!124180 (+!294 call!19023 (tuple2!3495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3687 thiss!1248))))))

(declare-fun bm!19021 () Bool)

(assert (=> bm!19021 (= call!19022 call!19026)))

(declare-fun b!188691 () Bool)

(assert (=> b!188691 (= e!124181 call!19022)))

(declare-fun b!188692 () Bool)

(declare-fun c!33915 () Bool)

(assert (=> b!188692 (= c!33915 (and (not (= (bvand (extraKeys!3583 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3583 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!188692 (= e!124182 e!124181)))

(declare-fun b!188693 () Bool)

(declare-fun e!124191 () Bool)

(assert (=> b!188693 (= e!124191 e!124186)))

(declare-fun res!89200 () Bool)

(assert (=> b!188693 (= res!89200 call!19027)))

(assert (=> b!188693 (=> (not res!89200) (not e!124186))))

(declare-fun b!188694 () Bool)

(assert (=> b!188694 (= e!124191 (not call!19027))))

(declare-fun b!188695 () Bool)

(declare-fun e!124187 () Bool)

(assert (=> b!188695 (= e!124189 e!124187)))

(declare-fun res!89202 () Bool)

(assert (=> b!188695 (= res!89202 call!19021)))

(assert (=> b!188695 (=> (not res!89202) (not e!124187))))

(declare-fun b!188696 () Bool)

(declare-fun res!89203 () Bool)

(assert (=> b!188696 (=> (not res!89203) (not e!124184))))

(assert (=> b!188696 (= res!89203 e!124190)))

(declare-fun res!89196 () Bool)

(assert (=> b!188696 (=> res!89196 e!124190)))

(assert (=> b!188696 (= res!89196 (not e!124179))))

(declare-fun res!89197 () Bool)

(assert (=> b!188696 (=> (not res!89197) (not e!124179))))

(assert (=> b!188696 (= res!89197 (bvslt #b00000000000000000000000000000000 (size!4105 (_keys!5807 thiss!1248))))))

(declare-fun bm!19022 () Bool)

(assert (=> bm!19022 (= call!19026 call!19024)))

(declare-fun b!188697 () Bool)

(assert (=> b!188697 (= e!124187 (= (apply!174 lt!93429 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3687 thiss!1248)))))

(declare-fun bm!19023 () Bool)

(assert (=> bm!19023 (= call!19021 (contains!1325 lt!93429 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19024 () Bool)

(assert (=> bm!19024 (= call!19025 call!19023)))

(declare-fun b!188698 () Bool)

(assert (=> b!188698 (= e!124184 e!124191)))

(declare-fun c!33914 () Bool)

(assert (=> b!188698 (= c!33914 (not (= (bvand (extraKeys!3583 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!188699 () Bool)

(declare-fun res!89198 () Bool)

(assert (=> b!188699 (=> (not res!89198) (not e!124184))))

(assert (=> b!188699 (= res!89198 e!124189)))

(declare-fun c!33916 () Bool)

(assert (=> b!188699 (= c!33916 (not (= (bvand (extraKeys!3583 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!55649 c!33912) b!188690))

(assert (= (and d!55649 (not c!33912)) b!188685))

(assert (= (and b!188685 c!33913) b!188684))

(assert (= (and b!188685 (not c!33913)) b!188692))

(assert (= (and b!188692 c!33915) b!188687))

(assert (= (and b!188692 (not c!33915)) b!188691))

(assert (= (or b!188687 b!188691) bm!19021))

(assert (= (or b!188684 bm!19021) bm!19022))

(assert (= (or b!188684 b!188687) bm!19024))

(assert (= (or b!188690 bm!19022) bm!19018))

(assert (= (or b!188690 bm!19024) bm!19020))

(assert (= (and d!55649 res!89195) b!188689))

(assert (= (and d!55649 c!33917) b!188680))

(assert (= (and d!55649 (not c!33917)) b!188686))

(assert (= (and d!55649 res!89201) b!188696))

(assert (= (and b!188696 res!89197) b!188688))

(assert (= (and b!188696 (not res!89196)) b!188683))

(assert (= (and b!188683 res!89199) b!188681))

(assert (= (and b!188696 res!89203) b!188699))

(assert (= (and b!188699 c!33916) b!188695))

(assert (= (and b!188699 (not c!33916)) b!188679))

(assert (= (and b!188695 res!89202) b!188697))

(assert (= (or b!188695 b!188679) bm!19023))

(assert (= (and b!188699 res!89198) b!188698))

(assert (= (and b!188698 c!33914) b!188693))

(assert (= (and b!188698 (not c!33914)) b!188694))

(assert (= (and b!188693 res!89200) b!188682))

(assert (= (or b!188693 b!188694) bm!19019))

(declare-fun b_lambda!7315 () Bool)

(assert (=> (not b_lambda!7315) (not b!188681)))

(declare-fun t!7294 () Bool)

(declare-fun tb!2859 () Bool)

(assert (=> (and b!188560 (= (defaultEntry!3846 thiss!1248) (defaultEntry!3846 thiss!1248)) t!7294) tb!2859))

(declare-fun result!4855 () Bool)

(assert (=> tb!2859 (= result!4855 tp_is_empty!4401)))

(assert (=> b!188681 t!7294))

(declare-fun b_and!11265 () Bool)

(assert (= b_and!11261 (and (=> t!7294 result!4855) b_and!11265)))

(declare-fun m!215261 () Bool)

(assert (=> b!188690 m!215261))

(declare-fun m!215263 () Bool)

(assert (=> bm!19019 m!215263))

(assert (=> b!188689 m!215241))

(assert (=> b!188689 m!215241))

(assert (=> b!188689 m!215251))

(declare-fun m!215265 () Bool)

(assert (=> b!188680 m!215265))

(declare-fun m!215267 () Bool)

(assert (=> b!188680 m!215267))

(declare-fun m!215269 () Bool)

(assert (=> b!188680 m!215269))

(declare-fun m!215271 () Bool)

(assert (=> b!188680 m!215271))

(declare-fun m!215273 () Bool)

(assert (=> b!188680 m!215273))

(declare-fun m!215275 () Bool)

(assert (=> b!188680 m!215275))

(assert (=> b!188680 m!215241))

(declare-fun m!215277 () Bool)

(assert (=> b!188680 m!215277))

(declare-fun m!215279 () Bool)

(assert (=> b!188680 m!215279))

(assert (=> b!188680 m!215277))

(assert (=> b!188680 m!215269))

(assert (=> b!188680 m!215265))

(declare-fun m!215281 () Bool)

(assert (=> b!188680 m!215281))

(declare-fun m!215283 () Bool)

(assert (=> b!188680 m!215283))

(declare-fun m!215285 () Bool)

(assert (=> b!188680 m!215285))

(declare-fun m!215287 () Bool)

(assert (=> b!188680 m!215287))

(declare-fun m!215289 () Bool)

(assert (=> b!188680 m!215289))

(declare-fun m!215291 () Bool)

(assert (=> b!188680 m!215291))

(declare-fun m!215293 () Bool)

(assert (=> b!188680 m!215293))

(declare-fun m!215295 () Bool)

(assert (=> b!188680 m!215295))

(assert (=> b!188680 m!215273))

(assert (=> d!55649 m!215193))

(declare-fun m!215297 () Bool)

(assert (=> bm!19020 m!215297))

(assert (=> b!188683 m!215241))

(assert (=> b!188683 m!215241))

(declare-fun m!215299 () Bool)

(assert (=> b!188683 m!215299))

(declare-fun m!215301 () Bool)

(assert (=> b!188682 m!215301))

(assert (=> b!188681 m!215241))

(assert (=> b!188681 m!215241))

(declare-fun m!215303 () Bool)

(assert (=> b!188681 m!215303))

(declare-fun m!215305 () Bool)

(assert (=> b!188681 m!215305))

(declare-fun m!215307 () Bool)

(assert (=> b!188681 m!215307))

(declare-fun m!215309 () Bool)

(assert (=> b!188681 m!215309))

(assert (=> b!188681 m!215305))

(assert (=> b!188681 m!215307))

(declare-fun m!215311 () Bool)

(assert (=> b!188697 m!215311))

(declare-fun m!215313 () Bool)

(assert (=> bm!19023 m!215313))

(assert (=> b!188688 m!215241))

(assert (=> b!188688 m!215241))

(assert (=> b!188688 m!215251))

(assert (=> bm!19018 m!215293))

(assert (=> b!188561 d!55649))

(declare-fun call!19032 () Bool)

(declare-fun lt!93439 () SeekEntryResult!655)

(declare-fun bm!19029 () Bool)

(declare-fun c!33923 () Bool)

(assert (=> bm!19029 (= call!19032 (inRange!0 (ite c!33923 (index!4790 lt!93439) (index!4793 lt!93439)) (mask!9015 thiss!1248)))))

(declare-fun b!188718 () Bool)

(assert (=> b!188718 (and (bvsge (index!4790 lt!93439) #b00000000000000000000000000000000) (bvslt (index!4790 lt!93439) (size!4105 (_keys!5807 thiss!1248))))))

(declare-fun res!89212 () Bool)

(assert (=> b!188718 (= res!89212 (= (select (arr!3785 (_keys!5807 thiss!1248)) (index!4790 lt!93439)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!124203 () Bool)

(assert (=> b!188718 (=> (not res!89212) (not e!124203))))

(declare-fun b!188719 () Bool)

(declare-fun res!89213 () Bool)

(declare-fun e!124201 () Bool)

(assert (=> b!188719 (=> (not res!89213) (not e!124201))))

(assert (=> b!188719 (= res!89213 call!19032)))

(declare-fun e!124202 () Bool)

(assert (=> b!188719 (= e!124202 e!124201)))

(declare-fun b!188720 () Bool)

(declare-fun call!19033 () Bool)

(assert (=> b!188720 (= e!124203 (not call!19033))))

(declare-fun b!188722 () Bool)

(declare-fun e!124200 () Bool)

(assert (=> b!188722 (= e!124200 e!124202)))

(declare-fun c!33922 () Bool)

(assert (=> b!188722 (= c!33922 ((_ is MissingVacant!655) lt!93439))))

(declare-fun b!188723 () Bool)

(assert (=> b!188723 (= e!124200 e!124203)))

(declare-fun res!89215 () Bool)

(assert (=> b!188723 (= res!89215 call!19032)))

(assert (=> b!188723 (=> (not res!89215) (not e!124203))))

(declare-fun b!188724 () Bool)

(assert (=> b!188724 (= e!124202 ((_ is Undefined!655) lt!93439))))

(declare-fun bm!19030 () Bool)

(assert (=> bm!19030 (= call!19033 (arrayContainsKey!0 (_keys!5807 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!188725 () Bool)

(assert (=> b!188725 (= e!124201 (not call!19033))))

(declare-fun b!188721 () Bool)

(declare-fun res!89214 () Bool)

(assert (=> b!188721 (=> (not res!89214) (not e!124201))))

(assert (=> b!188721 (= res!89214 (= (select (arr!3785 (_keys!5807 thiss!1248)) (index!4793 lt!93439)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188721 (and (bvsge (index!4793 lt!93439) #b00000000000000000000000000000000) (bvslt (index!4793 lt!93439) (size!4105 (_keys!5807 thiss!1248))))))

(declare-fun d!55651 () Bool)

(assert (=> d!55651 e!124200))

(assert (=> d!55651 (= c!33923 ((_ is MissingZero!655) lt!93439))))

(assert (=> d!55651 (= lt!93439 (seekEntryOrOpen!0 key!828 (_keys!5807 thiss!1248) (mask!9015 thiss!1248)))))

(declare-fun lt!93440 () Unit!5686)

(declare-fun choose!1009 (array!8025 array!8027 (_ BitVec 32) (_ BitVec 32) V!5515 V!5515 (_ BitVec 64) Int) Unit!5686)

(assert (=> d!55651 (= lt!93440 (choose!1009 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) key!828 (defaultEntry!3846 thiss!1248)))))

(assert (=> d!55651 (validMask!0 (mask!9015 thiss!1248))))

(assert (=> d!55651 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!161 (_keys!5807 thiss!1248) (_values!3829 thiss!1248) (mask!9015 thiss!1248) (extraKeys!3583 thiss!1248) (zeroValue!3687 thiss!1248) (minValue!3687 thiss!1248) key!828 (defaultEntry!3846 thiss!1248)) lt!93440)))

(assert (= (and d!55651 c!33923) b!188723))

(assert (= (and d!55651 (not c!33923)) b!188722))

(assert (= (and b!188723 res!89215) b!188718))

(assert (= (and b!188718 res!89212) b!188720))

(assert (= (and b!188722 c!33922) b!188719))

(assert (= (and b!188722 (not c!33922)) b!188724))

(assert (= (and b!188719 res!89213) b!188721))

(assert (= (and b!188721 res!89214) b!188725))

(assert (= (or b!188723 b!188719) bm!19029))

(assert (= (or b!188720 b!188725) bm!19030))

(declare-fun m!215315 () Bool)

(assert (=> bm!19030 m!215315))

(assert (=> d!55651 m!215183))

(declare-fun m!215317 () Bool)

(assert (=> d!55651 m!215317))

(assert (=> d!55651 m!215193))

(declare-fun m!215319 () Bool)

(assert (=> bm!19029 m!215319))

(declare-fun m!215321 () Bool)

(assert (=> b!188721 m!215321))

(declare-fun m!215323 () Bool)

(assert (=> b!188718 m!215323))

(assert (=> b!188563 d!55651))

(declare-fun d!55653 () Bool)

(declare-fun res!89222 () Bool)

(declare-fun e!124206 () Bool)

(assert (=> d!55653 (=> (not res!89222) (not e!124206))))

(declare-fun simpleValid!190 (LongMapFixedSize!2622) Bool)

(assert (=> d!55653 (= res!89222 (simpleValid!190 thiss!1248))))

(assert (=> d!55653 (= (valid!1079 thiss!1248) e!124206)))

(declare-fun b!188732 () Bool)

(declare-fun res!89223 () Bool)

(assert (=> b!188732 (=> (not res!89223) (not e!124206))))

(declare-fun arrayCountValidKeys!0 (array!8025 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!188732 (= res!89223 (= (arrayCountValidKeys!0 (_keys!5807 thiss!1248) #b00000000000000000000000000000000 (size!4105 (_keys!5807 thiss!1248))) (_size!1360 thiss!1248)))))

(declare-fun b!188733 () Bool)

(declare-fun res!89224 () Bool)

(assert (=> b!188733 (=> (not res!89224) (not e!124206))))

(assert (=> b!188733 (= res!89224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5807 thiss!1248) (mask!9015 thiss!1248)))))

(declare-fun b!188734 () Bool)

(assert (=> b!188734 (= e!124206 (arrayNoDuplicates!0 (_keys!5807 thiss!1248) #b00000000000000000000000000000000 Nil!2391))))

(assert (= (and d!55653 res!89222) b!188732))

(assert (= (and b!188732 res!89223) b!188733))

(assert (= (and b!188733 res!89224) b!188734))

(declare-fun m!215325 () Bool)

(assert (=> d!55653 m!215325))

(declare-fun m!215327 () Bool)

(assert (=> b!188732 m!215327))

(assert (=> b!188733 m!215191))

(assert (=> b!188734 m!215185))

(assert (=> start!19164 d!55653))

(declare-fun b!188745 () Bool)

(declare-fun e!124215 () Bool)

(declare-fun e!124218 () Bool)

(assert (=> b!188745 (= e!124215 e!124218)))

(declare-fun res!89233 () Bool)

(assert (=> b!188745 (=> (not res!89233) (not e!124218))))

(declare-fun e!124216 () Bool)

(assert (=> b!188745 (= res!89233 (not e!124216))))

(declare-fun res!89232 () Bool)

(assert (=> b!188745 (=> (not res!89232) (not e!124216))))

(assert (=> b!188745 (= res!89232 (validKeyInArray!0 (select (arr!3785 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188746 () Bool)

(declare-fun e!124217 () Bool)

(declare-fun call!19036 () Bool)

(assert (=> b!188746 (= e!124217 call!19036)))

(declare-fun b!188747 () Bool)

(assert (=> b!188747 (= e!124218 e!124217)))

(declare-fun c!33926 () Bool)

(assert (=> b!188747 (= c!33926 (validKeyInArray!0 (select (arr!3785 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188748 () Bool)

(declare-fun contains!1326 (List!2394 (_ BitVec 64)) Bool)

(assert (=> b!188748 (= e!124216 (contains!1326 Nil!2391 (select (arr!3785 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55655 () Bool)

(declare-fun res!89231 () Bool)

(assert (=> d!55655 (=> res!89231 e!124215)))

(assert (=> d!55655 (= res!89231 (bvsge #b00000000000000000000000000000000 (size!4105 (_keys!5807 thiss!1248))))))

(assert (=> d!55655 (= (arrayNoDuplicates!0 (_keys!5807 thiss!1248) #b00000000000000000000000000000000 Nil!2391) e!124215)))

(declare-fun bm!19033 () Bool)

(assert (=> bm!19033 (= call!19036 (arrayNoDuplicates!0 (_keys!5807 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33926 (Cons!2390 (select (arr!3785 (_keys!5807 thiss!1248)) #b00000000000000000000000000000000) Nil!2391) Nil!2391)))))

(declare-fun b!188749 () Bool)

(assert (=> b!188749 (= e!124217 call!19036)))

(assert (= (and d!55655 (not res!89231)) b!188745))

(assert (= (and b!188745 res!89232) b!188748))

(assert (= (and b!188745 res!89233) b!188747))

(assert (= (and b!188747 c!33926) b!188746))

(assert (= (and b!188747 (not c!33926)) b!188749))

(assert (= (or b!188746 b!188749) bm!19033))

(assert (=> b!188745 m!215241))

(assert (=> b!188745 m!215241))

(assert (=> b!188745 m!215251))

(assert (=> b!188747 m!215241))

(assert (=> b!188747 m!215241))

(assert (=> b!188747 m!215251))

(assert (=> b!188748 m!215241))

(assert (=> b!188748 m!215241))

(declare-fun m!215329 () Bool)

(assert (=> b!188748 m!215329))

(assert (=> bm!19033 m!215241))

(declare-fun m!215331 () Bool)

(assert (=> bm!19033 m!215331))

(assert (=> b!188562 d!55655))

(declare-fun lt!93449 () SeekEntryResult!655)

(declare-fun b!188762 () Bool)

(declare-fun e!124226 () SeekEntryResult!655)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8025 (_ BitVec 32)) SeekEntryResult!655)

(assert (=> b!188762 (= e!124226 (seekKeyOrZeroReturnVacant!0 (x!20359 lt!93449) (index!4792 lt!93449) (index!4792 lt!93449) key!828 (_keys!5807 thiss!1248) (mask!9015 thiss!1248)))))

(declare-fun b!188763 () Bool)

(assert (=> b!188763 (= e!124226 (MissingZero!655 (index!4792 lt!93449)))))

(declare-fun b!188764 () Bool)

(declare-fun e!124225 () SeekEntryResult!655)

(assert (=> b!188764 (= e!124225 Undefined!655)))

(declare-fun b!188765 () Bool)

(declare-fun e!124227 () SeekEntryResult!655)

(assert (=> b!188765 (= e!124225 e!124227)))

(declare-fun lt!93447 () (_ BitVec 64))

(assert (=> b!188765 (= lt!93447 (select (arr!3785 (_keys!5807 thiss!1248)) (index!4792 lt!93449)))))

(declare-fun c!33934 () Bool)

(assert (=> b!188765 (= c!33934 (= lt!93447 key!828))))

(declare-fun b!188766 () Bool)

(assert (=> b!188766 (= e!124227 (Found!655 (index!4792 lt!93449)))))

(declare-fun d!55657 () Bool)

(declare-fun lt!93448 () SeekEntryResult!655)

(assert (=> d!55657 (and (or ((_ is Undefined!655) lt!93448) (not ((_ is Found!655) lt!93448)) (and (bvsge (index!4791 lt!93448) #b00000000000000000000000000000000) (bvslt (index!4791 lt!93448) (size!4105 (_keys!5807 thiss!1248))))) (or ((_ is Undefined!655) lt!93448) ((_ is Found!655) lt!93448) (not ((_ is MissingZero!655) lt!93448)) (and (bvsge (index!4790 lt!93448) #b00000000000000000000000000000000) (bvslt (index!4790 lt!93448) (size!4105 (_keys!5807 thiss!1248))))) (or ((_ is Undefined!655) lt!93448) ((_ is Found!655) lt!93448) ((_ is MissingZero!655) lt!93448) (not ((_ is MissingVacant!655) lt!93448)) (and (bvsge (index!4793 lt!93448) #b00000000000000000000000000000000) (bvslt (index!4793 lt!93448) (size!4105 (_keys!5807 thiss!1248))))) (or ((_ is Undefined!655) lt!93448) (ite ((_ is Found!655) lt!93448) (= (select (arr!3785 (_keys!5807 thiss!1248)) (index!4791 lt!93448)) key!828) (ite ((_ is MissingZero!655) lt!93448) (= (select (arr!3785 (_keys!5807 thiss!1248)) (index!4790 lt!93448)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!655) lt!93448) (= (select (arr!3785 (_keys!5807 thiss!1248)) (index!4793 lt!93448)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55657 (= lt!93448 e!124225)))

(declare-fun c!33933 () Bool)

(assert (=> d!55657 (= c!33933 (and ((_ is Intermediate!655) lt!93449) (undefined!1467 lt!93449)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8025 (_ BitVec 32)) SeekEntryResult!655)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55657 (= lt!93449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9015 thiss!1248)) key!828 (_keys!5807 thiss!1248) (mask!9015 thiss!1248)))))

(assert (=> d!55657 (validMask!0 (mask!9015 thiss!1248))))

(assert (=> d!55657 (= (seekEntryOrOpen!0 key!828 (_keys!5807 thiss!1248) (mask!9015 thiss!1248)) lt!93448)))

(declare-fun b!188767 () Bool)

(declare-fun c!33935 () Bool)

(assert (=> b!188767 (= c!33935 (= lt!93447 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188767 (= e!124227 e!124226)))

(assert (= (and d!55657 c!33933) b!188764))

(assert (= (and d!55657 (not c!33933)) b!188765))

(assert (= (and b!188765 c!33934) b!188766))

(assert (= (and b!188765 (not c!33934)) b!188767))

(assert (= (and b!188767 c!33935) b!188763))

(assert (= (and b!188767 (not c!33935)) b!188762))

(declare-fun m!215333 () Bool)

(assert (=> b!188762 m!215333))

(declare-fun m!215335 () Bool)

(assert (=> b!188765 m!215335))

(declare-fun m!215337 () Bool)

(assert (=> d!55657 m!215337))

(declare-fun m!215339 () Bool)

(assert (=> d!55657 m!215339))

(assert (=> d!55657 m!215193))

(declare-fun m!215341 () Bool)

(assert (=> d!55657 m!215341))

(assert (=> d!55657 m!215339))

(declare-fun m!215343 () Bool)

(assert (=> d!55657 m!215343))

(declare-fun m!215345 () Bool)

(assert (=> d!55657 m!215345))

(assert (=> b!188558 d!55657))

(declare-fun b!188774 () Bool)

(declare-fun e!124233 () Bool)

(assert (=> b!188774 (= e!124233 tp_is_empty!4401)))

(declare-fun condMapEmpty!7594 () Bool)

(declare-fun mapDefault!7594 () ValueCell!1857)

(assert (=> mapNonEmpty!7588 (= condMapEmpty!7594 (= mapRest!7588 ((as const (Array (_ BitVec 32) ValueCell!1857)) mapDefault!7594)))))

(declare-fun e!124232 () Bool)

(declare-fun mapRes!7594 () Bool)

(assert (=> mapNonEmpty!7588 (= tp!16710 (and e!124232 mapRes!7594))))

(declare-fun b!188775 () Bool)

(assert (=> b!188775 (= e!124232 tp_is_empty!4401)))

(declare-fun mapIsEmpty!7594 () Bool)

(assert (=> mapIsEmpty!7594 mapRes!7594))

(declare-fun mapNonEmpty!7594 () Bool)

(declare-fun tp!16720 () Bool)

(assert (=> mapNonEmpty!7594 (= mapRes!7594 (and tp!16720 e!124233))))

(declare-fun mapKey!7594 () (_ BitVec 32))

(declare-fun mapValue!7594 () ValueCell!1857)

(declare-fun mapRest!7594 () (Array (_ BitVec 32) ValueCell!1857))

(assert (=> mapNonEmpty!7594 (= mapRest!7588 (store mapRest!7594 mapKey!7594 mapValue!7594))))

(assert (= (and mapNonEmpty!7588 condMapEmpty!7594) mapIsEmpty!7594))

(assert (= (and mapNonEmpty!7588 (not condMapEmpty!7594)) mapNonEmpty!7594))

(assert (= (and mapNonEmpty!7594 ((_ is ValueCellFull!1857) mapValue!7594)) b!188774))

(assert (= (and mapNonEmpty!7588 ((_ is ValueCellFull!1857) mapDefault!7594)) b!188775))

(declare-fun m!215347 () Bool)

(assert (=> mapNonEmpty!7594 m!215347))

(declare-fun b_lambda!7317 () Bool)

(assert (= b_lambda!7315 (or (and b!188560 b_free!4629) b_lambda!7317)))

(check-sat (not d!55639) (not b!188614) (not b!188747) (not b!188733) (not bm!19018) (not bm!19019) (not b!188732) (not b!188680) (not b!188697) (not b!188625) (not b!188689) (not bm!19033) (not d!55657) (not d!55651) (not d!55649) (not b!188688) (not b!188762) (not b!188745) (not b!188690) (not b!188748) (not bm!19023) (not b!188634) (not bm!19003) tp_is_empty!4401 (not b!188734) (not bm!19029) (not b!188682) (not d!55653) (not b!188681) (not b!188627) (not b!188683) (not b!188636) b_and!11265 (not bm!19020) (not d!55647) (not bm!19030) (not b_next!4629) (not b_lambda!7317) (not mapNonEmpty!7594))
(check-sat b_and!11265 (not b_next!4629))
