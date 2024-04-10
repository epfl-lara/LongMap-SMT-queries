; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18078 () Bool)

(assert start!18078)

(declare-fun b!180063 () Bool)

(declare-fun b_free!4449 () Bool)

(declare-fun b_next!4449 () Bool)

(assert (=> b!180063 (= b_free!4449 (not b_next!4449))))

(declare-fun tp!16077 () Bool)

(declare-fun b_and!10983 () Bool)

(assert (=> b!180063 (= tp!16077 b_and!10983)))

(declare-fun b!180056 () Bool)

(declare-fun e!118600 () Bool)

(declare-fun e!118603 () Bool)

(assert (=> b!180056 (= e!118600 e!118603)))

(declare-fun res!85292 () Bool)

(assert (=> b!180056 (=> res!85292 e!118603)))

(declare-datatypes ((V!5275 0))(
  ( (V!5276 (val!2155 Int)) )
))
(declare-datatypes ((ValueCell!1767 0))(
  ( (ValueCellFull!1767 (v!4044 V!5275)) (EmptyCell!1767) )
))
(declare-datatypes ((array!7611 0))(
  ( (array!7612 (arr!3605 (Array (_ BitVec 32) (_ BitVec 64))) (size!3913 (_ BitVec 32))) )
))
(declare-datatypes ((array!7613 0))(
  ( (array!7614 (arr!3606 (Array (_ BitVec 32) ValueCell!1767)) (size!3914 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2442 0))(
  ( (LongMapFixedSize!2443 (defaultEntry!3697 Int) (mask!8692 (_ BitVec 32)) (extraKeys!3434 (_ BitVec 32)) (zeroValue!3538 V!5275) (minValue!3538 V!5275) (_size!1270 (_ BitVec 32)) (_keys!5588 array!7611) (_values!3680 array!7613) (_vacant!1270 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3352 0))(
  ( (tuple2!3353 (_1!1687 Bool) (_2!1687 LongMapFixedSize!2442)) )
))
(declare-fun lt!88889 () tuple2!3352)

(declare-fun valid!1016 (LongMapFixedSize!2442) Bool)

(assert (=> b!180056 (= res!85292 (not (valid!1016 (_2!1687 lt!88889))))))

(declare-datatypes ((SeekEntryResult!589 0))(
  ( (MissingZero!589 (index!4524 (_ BitVec 32))) (Found!589 (index!4525 (_ BitVec 32))) (Intermediate!589 (undefined!1401 Bool) (index!4526 (_ BitVec 32)) (x!19679 (_ BitVec 32))) (Undefined!589) (MissingVacant!589 (index!4527 (_ BitVec 32))) )
))
(declare-fun lt!88887 () SeekEntryResult!589)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!5275)

(declare-fun thiss!1248 () LongMapFixedSize!2442)

(declare-fun updateHelperNewKey!87 (LongMapFixedSize!2442 (_ BitVec 64) V!5275 (_ BitVec 32)) tuple2!3352)

(assert (=> b!180056 (= lt!88889 (updateHelperNewKey!87 thiss!1248 key!828 v!309 (index!4527 lt!88887)))))

(declare-fun res!85290 () Bool)

(declare-fun e!118605 () Bool)

(assert (=> start!18078 (=> (not res!85290) (not e!118605))))

(assert (=> start!18078 (= res!85290 (valid!1016 thiss!1248))))

(assert (=> start!18078 e!118605))

(declare-fun e!118606 () Bool)

(assert (=> start!18078 e!118606))

(assert (=> start!18078 true))

(declare-fun tp_is_empty!4221 () Bool)

(assert (=> start!18078 tp_is_empty!4221))

(declare-fun b!180057 () Bool)

(declare-fun e!118608 () Bool)

(declare-datatypes ((tuple2!3354 0))(
  ( (tuple2!3355 (_1!1688 (_ BitVec 64)) (_2!1688 V!5275)) )
))
(declare-datatypes ((List!2289 0))(
  ( (Nil!2286) (Cons!2285 (h!2910 tuple2!3354) (t!7137 List!2289)) )
))
(declare-datatypes ((ListLongMap!2277 0))(
  ( (ListLongMap!2278 (toList!1154 List!2289)) )
))
(declare-fun call!18187 () ListLongMap!2277)

(declare-fun call!18186 () ListLongMap!2277)

(assert (=> b!180057 (= e!118608 (not (= call!18187 call!18186)))))

(declare-fun b!180058 () Bool)

(assert (=> b!180058 (= e!118603 e!118608)))

(declare-fun c!32252 () Bool)

(assert (=> b!180058 (= c!32252 (_1!1687 lt!88889))))

(declare-fun b!180059 () Bool)

(declare-fun e!118604 () Bool)

(declare-fun lt!88888 () ListLongMap!2277)

(declare-fun +!266 (ListLongMap!2277 tuple2!3354) ListLongMap!2277)

(assert (=> b!180059 (= e!118604 (not (= lt!88888 (+!266 call!18186 (tuple2!3355 key!828 v!309)))))))

(declare-fun b!180060 () Bool)

(assert (=> b!180060 (= e!118608 e!118604)))

(assert (=> b!180060 (= lt!88888 call!18187)))

(declare-fun res!85291 () Bool)

(declare-fun contains!1229 (ListLongMap!2277 (_ BitVec 64)) Bool)

(assert (=> b!180060 (= res!85291 (not (contains!1229 lt!88888 key!828)))))

(assert (=> b!180060 (=> res!85291 e!118604)))

(declare-fun b!180061 () Bool)

(declare-fun e!118607 () Bool)

(declare-fun e!118602 () Bool)

(declare-fun mapRes!7225 () Bool)

(assert (=> b!180061 (= e!118607 (and e!118602 mapRes!7225))))

(declare-fun condMapEmpty!7225 () Bool)

(declare-fun mapDefault!7225 () ValueCell!1767)

(assert (=> b!180061 (= condMapEmpty!7225 (= (arr!3606 (_values!3680 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1767)) mapDefault!7225)))))

(declare-fun mapNonEmpty!7225 () Bool)

(declare-fun tp!16078 () Bool)

(declare-fun e!118601 () Bool)

(assert (=> mapNonEmpty!7225 (= mapRes!7225 (and tp!16078 e!118601))))

(declare-fun mapKey!7225 () (_ BitVec 32))

(declare-fun mapRest!7225 () (Array (_ BitVec 32) ValueCell!1767))

(declare-fun mapValue!7225 () ValueCell!1767)

(assert (=> mapNonEmpty!7225 (= (arr!3606 (_values!3680 thiss!1248)) (store mapRest!7225 mapKey!7225 mapValue!7225))))

(declare-fun b!180062 () Bool)

(declare-fun res!85294 () Bool)

(assert (=> b!180062 (=> (not res!85294) (not e!118605))))

(assert (=> b!180062 (= res!85294 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!2321 (array!7611) Bool)

(declare-fun array_inv!2322 (array!7613) Bool)

(assert (=> b!180063 (= e!118606 (and tp!16077 tp_is_empty!4221 (array_inv!2321 (_keys!5588 thiss!1248)) (array_inv!2322 (_values!3680 thiss!1248)) e!118607))))

(declare-fun bm!18183 () Bool)

(declare-fun map!1933 (LongMapFixedSize!2442) ListLongMap!2277)

(assert (=> bm!18183 (= call!18186 (map!1933 thiss!1248))))

(declare-fun bm!18184 () Bool)

(assert (=> bm!18184 (= call!18187 (map!1933 (_2!1687 lt!88889)))))

(declare-fun mapIsEmpty!7225 () Bool)

(assert (=> mapIsEmpty!7225 mapRes!7225))

(declare-fun b!180064 () Bool)

(assert (=> b!180064 (= e!118605 e!118600)))

(declare-fun res!85293 () Bool)

(assert (=> b!180064 (=> (not res!85293) (not e!118600))))

(get-info :version)

(assert (=> b!180064 (= res!85293 (and (not ((_ is Undefined!589) lt!88887)) ((_ is MissingVacant!589) lt!88887)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7611 (_ BitVec 32)) SeekEntryResult!589)

(assert (=> b!180064 (= lt!88887 (seekEntryOrOpen!0 key!828 (_keys!5588 thiss!1248) (mask!8692 thiss!1248)))))

(declare-fun b!180065 () Bool)

(assert (=> b!180065 (= e!118602 tp_is_empty!4221)))

(declare-fun b!180066 () Bool)

(assert (=> b!180066 (= e!118601 tp_is_empty!4221)))

(assert (= (and start!18078 res!85290) b!180062))

(assert (= (and b!180062 res!85294) b!180064))

(assert (= (and b!180064 res!85293) b!180056))

(assert (= (and b!180056 (not res!85292)) b!180058))

(assert (= (and b!180058 c!32252) b!180060))

(assert (= (and b!180058 (not c!32252)) b!180057))

(assert (= (and b!180060 (not res!85291)) b!180059))

(assert (= (or b!180059 b!180057) bm!18183))

(assert (= (or b!180060 b!180057) bm!18184))

(assert (= (and b!180061 condMapEmpty!7225) mapIsEmpty!7225))

(assert (= (and b!180061 (not condMapEmpty!7225)) mapNonEmpty!7225))

(assert (= (and mapNonEmpty!7225 ((_ is ValueCellFull!1767) mapValue!7225)) b!180066))

(assert (= (and b!180061 ((_ is ValueCellFull!1767) mapDefault!7225)) b!180065))

(assert (= b!180063 b!180061))

(assert (= start!18078 b!180063))

(declare-fun m!208107 () Bool)

(assert (=> mapNonEmpty!7225 m!208107))

(declare-fun m!208109 () Bool)

(assert (=> b!180064 m!208109))

(declare-fun m!208111 () Bool)

(assert (=> bm!18184 m!208111))

(declare-fun m!208113 () Bool)

(assert (=> b!180060 m!208113))

(declare-fun m!208115 () Bool)

(assert (=> start!18078 m!208115))

(declare-fun m!208117 () Bool)

(assert (=> b!180056 m!208117))

(declare-fun m!208119 () Bool)

(assert (=> b!180056 m!208119))

(declare-fun m!208121 () Bool)

(assert (=> bm!18183 m!208121))

(declare-fun m!208123 () Bool)

(assert (=> b!180063 m!208123))

(declare-fun m!208125 () Bool)

(assert (=> b!180063 m!208125))

(declare-fun m!208127 () Bool)

(assert (=> b!180059 m!208127))

(check-sat (not bm!18183) (not start!18078) tp_is_empty!4221 (not mapNonEmpty!7225) (not b_next!4449) (not b!180060) (not b!180063) (not bm!18184) b_and!10983 (not b!180056) (not b!180059) (not b!180064))
(check-sat b_and!10983 (not b_next!4449))
(get-model)

(declare-fun d!54189 () Bool)

(declare-fun e!118642 () Bool)

(assert (=> d!54189 e!118642))

(declare-fun res!85315 () Bool)

(assert (=> d!54189 (=> (not res!85315) (not e!118642))))

(declare-fun lt!88910 () ListLongMap!2277)

(assert (=> d!54189 (= res!85315 (contains!1229 lt!88910 (_1!1688 (tuple2!3355 key!828 v!309))))))

(declare-fun lt!88909 () List!2289)

(assert (=> d!54189 (= lt!88910 (ListLongMap!2278 lt!88909))))

(declare-datatypes ((Unit!5480 0))(
  ( (Unit!5481) )
))
(declare-fun lt!88908 () Unit!5480)

(declare-fun lt!88907 () Unit!5480)

(assert (=> d!54189 (= lt!88908 lt!88907)))

(declare-datatypes ((Option!210 0))(
  ( (Some!209 (v!4047 V!5275)) (None!208) )
))
(declare-fun getValueByKey!204 (List!2289 (_ BitVec 64)) Option!210)

(assert (=> d!54189 (= (getValueByKey!204 lt!88909 (_1!1688 (tuple2!3355 key!828 v!309))) (Some!209 (_2!1688 (tuple2!3355 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!107 (List!2289 (_ BitVec 64) V!5275) Unit!5480)

(assert (=> d!54189 (= lt!88907 (lemmaContainsTupThenGetReturnValue!107 lt!88909 (_1!1688 (tuple2!3355 key!828 v!309)) (_2!1688 (tuple2!3355 key!828 v!309))))))

(declare-fun insertStrictlySorted!110 (List!2289 (_ BitVec 64) V!5275) List!2289)

(assert (=> d!54189 (= lt!88909 (insertStrictlySorted!110 (toList!1154 call!18186) (_1!1688 (tuple2!3355 key!828 v!309)) (_2!1688 (tuple2!3355 key!828 v!309))))))

(assert (=> d!54189 (= (+!266 call!18186 (tuple2!3355 key!828 v!309)) lt!88910)))

(declare-fun b!180104 () Bool)

(declare-fun res!85314 () Bool)

(assert (=> b!180104 (=> (not res!85314) (not e!118642))))

(assert (=> b!180104 (= res!85314 (= (getValueByKey!204 (toList!1154 lt!88910) (_1!1688 (tuple2!3355 key!828 v!309))) (Some!209 (_2!1688 (tuple2!3355 key!828 v!309)))))))

(declare-fun b!180105 () Bool)

(declare-fun contains!1230 (List!2289 tuple2!3354) Bool)

(assert (=> b!180105 (= e!118642 (contains!1230 (toList!1154 lt!88910) (tuple2!3355 key!828 v!309)))))

(assert (= (and d!54189 res!85315) b!180104))

(assert (= (and b!180104 res!85314) b!180105))

(declare-fun m!208151 () Bool)

(assert (=> d!54189 m!208151))

(declare-fun m!208153 () Bool)

(assert (=> d!54189 m!208153))

(declare-fun m!208155 () Bool)

(assert (=> d!54189 m!208155))

(declare-fun m!208157 () Bool)

(assert (=> d!54189 m!208157))

(declare-fun m!208159 () Bool)

(assert (=> b!180104 m!208159))

(declare-fun m!208161 () Bool)

(assert (=> b!180105 m!208161))

(assert (=> b!180059 d!54189))

(declare-fun d!54191 () Bool)

(assert (=> d!54191 (= (array_inv!2321 (_keys!5588 thiss!1248)) (bvsge (size!3913 (_keys!5588 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180063 d!54191))

(declare-fun d!54193 () Bool)

(assert (=> d!54193 (= (array_inv!2322 (_values!3680 thiss!1248)) (bvsge (size!3914 (_values!3680 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180063 d!54193))

(declare-fun d!54195 () Bool)

(declare-fun res!85322 () Bool)

(declare-fun e!118645 () Bool)

(assert (=> d!54195 (=> (not res!85322) (not e!118645))))

(declare-fun simpleValid!163 (LongMapFixedSize!2442) Bool)

(assert (=> d!54195 (= res!85322 (simpleValid!163 thiss!1248))))

(assert (=> d!54195 (= (valid!1016 thiss!1248) e!118645)))

(declare-fun b!180112 () Bool)

(declare-fun res!85323 () Bool)

(assert (=> b!180112 (=> (not res!85323) (not e!118645))))

(declare-fun arrayCountValidKeys!0 (array!7611 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!180112 (= res!85323 (= (arrayCountValidKeys!0 (_keys!5588 thiss!1248) #b00000000000000000000000000000000 (size!3913 (_keys!5588 thiss!1248))) (_size!1270 thiss!1248)))))

(declare-fun b!180113 () Bool)

(declare-fun res!85324 () Bool)

(assert (=> b!180113 (=> (not res!85324) (not e!118645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7611 (_ BitVec 32)) Bool)

(assert (=> b!180113 (= res!85324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5588 thiss!1248) (mask!8692 thiss!1248)))))

(declare-fun b!180114 () Bool)

(declare-datatypes ((List!2291 0))(
  ( (Nil!2288) (Cons!2287 (h!2912 (_ BitVec 64)) (t!7139 List!2291)) )
))
(declare-fun arrayNoDuplicates!0 (array!7611 (_ BitVec 32) List!2291) Bool)

(assert (=> b!180114 (= e!118645 (arrayNoDuplicates!0 (_keys!5588 thiss!1248) #b00000000000000000000000000000000 Nil!2288))))

(assert (= (and d!54195 res!85322) b!180112))

(assert (= (and b!180112 res!85323) b!180113))

(assert (= (and b!180113 res!85324) b!180114))

(declare-fun m!208163 () Bool)

(assert (=> d!54195 m!208163))

(declare-fun m!208165 () Bool)

(assert (=> b!180112 m!208165))

(declare-fun m!208167 () Bool)

(assert (=> b!180113 m!208167))

(declare-fun m!208169 () Bool)

(assert (=> b!180114 m!208169))

(assert (=> start!18078 d!54195))

(declare-fun d!54197 () Bool)

(declare-fun e!118651 () Bool)

(assert (=> d!54197 e!118651))

(declare-fun res!85327 () Bool)

(assert (=> d!54197 (=> res!85327 e!118651)))

(declare-fun lt!88921 () Bool)

(assert (=> d!54197 (= res!85327 (not lt!88921))))

(declare-fun lt!88919 () Bool)

(assert (=> d!54197 (= lt!88921 lt!88919)))

(declare-fun lt!88920 () Unit!5480)

(declare-fun e!118650 () Unit!5480)

(assert (=> d!54197 (= lt!88920 e!118650)))

(declare-fun c!32258 () Bool)

(assert (=> d!54197 (= c!32258 lt!88919)))

(declare-fun containsKey!208 (List!2289 (_ BitVec 64)) Bool)

(assert (=> d!54197 (= lt!88919 (containsKey!208 (toList!1154 lt!88888) key!828))))

(assert (=> d!54197 (= (contains!1229 lt!88888 key!828) lt!88921)))

(declare-fun b!180121 () Bool)

(declare-fun lt!88922 () Unit!5480)

(assert (=> b!180121 (= e!118650 lt!88922)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!156 (List!2289 (_ BitVec 64)) Unit!5480)

(assert (=> b!180121 (= lt!88922 (lemmaContainsKeyImpliesGetValueByKeyDefined!156 (toList!1154 lt!88888) key!828))))

(declare-fun isDefined!157 (Option!210) Bool)

(assert (=> b!180121 (isDefined!157 (getValueByKey!204 (toList!1154 lt!88888) key!828))))

(declare-fun b!180122 () Bool)

(declare-fun Unit!5482 () Unit!5480)

(assert (=> b!180122 (= e!118650 Unit!5482)))

(declare-fun b!180123 () Bool)

(assert (=> b!180123 (= e!118651 (isDefined!157 (getValueByKey!204 (toList!1154 lt!88888) key!828)))))

(assert (= (and d!54197 c!32258) b!180121))

(assert (= (and d!54197 (not c!32258)) b!180122))

(assert (= (and d!54197 (not res!85327)) b!180123))

(declare-fun m!208171 () Bool)

(assert (=> d!54197 m!208171))

(declare-fun m!208173 () Bool)

(assert (=> b!180121 m!208173))

(declare-fun m!208175 () Bool)

(assert (=> b!180121 m!208175))

(assert (=> b!180121 m!208175))

(declare-fun m!208177 () Bool)

(assert (=> b!180121 m!208177))

(assert (=> b!180123 m!208175))

(assert (=> b!180123 m!208175))

(assert (=> b!180123 m!208177))

(assert (=> b!180060 d!54197))

(declare-fun d!54199 () Bool)

(declare-fun getCurrentListMap!805 (array!7611 array!7613 (_ BitVec 32) (_ BitVec 32) V!5275 V!5275 (_ BitVec 32) Int) ListLongMap!2277)

(assert (=> d!54199 (= (map!1933 thiss!1248) (getCurrentListMap!805 (_keys!5588 thiss!1248) (_values!3680 thiss!1248) (mask!8692 thiss!1248) (extraKeys!3434 thiss!1248) (zeroValue!3538 thiss!1248) (minValue!3538 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3697 thiss!1248)))))

(declare-fun bs!7367 () Bool)

(assert (= bs!7367 d!54199))

(declare-fun m!208179 () Bool)

(assert (=> bs!7367 m!208179))

(assert (=> bm!18183 d!54199))

(declare-fun d!54201 () Bool)

(declare-fun res!85328 () Bool)

(declare-fun e!118652 () Bool)

(assert (=> d!54201 (=> (not res!85328) (not e!118652))))

(assert (=> d!54201 (= res!85328 (simpleValid!163 (_2!1687 lt!88889)))))

(assert (=> d!54201 (= (valid!1016 (_2!1687 lt!88889)) e!118652)))

(declare-fun b!180124 () Bool)

(declare-fun res!85329 () Bool)

(assert (=> b!180124 (=> (not res!85329) (not e!118652))))

(assert (=> b!180124 (= res!85329 (= (arrayCountValidKeys!0 (_keys!5588 (_2!1687 lt!88889)) #b00000000000000000000000000000000 (size!3913 (_keys!5588 (_2!1687 lt!88889)))) (_size!1270 (_2!1687 lt!88889))))))

(declare-fun b!180125 () Bool)

(declare-fun res!85330 () Bool)

(assert (=> b!180125 (=> (not res!85330) (not e!118652))))

(assert (=> b!180125 (= res!85330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5588 (_2!1687 lt!88889)) (mask!8692 (_2!1687 lt!88889))))))

(declare-fun b!180126 () Bool)

(assert (=> b!180126 (= e!118652 (arrayNoDuplicates!0 (_keys!5588 (_2!1687 lt!88889)) #b00000000000000000000000000000000 Nil!2288))))

(assert (= (and d!54201 res!85328) b!180124))

(assert (= (and b!180124 res!85329) b!180125))

(assert (= (and b!180125 res!85330) b!180126))

(declare-fun m!208181 () Bool)

(assert (=> d!54201 m!208181))

(declare-fun m!208183 () Bool)

(assert (=> b!180124 m!208183))

(declare-fun m!208185 () Bool)

(assert (=> b!180125 m!208185))

(declare-fun m!208187 () Bool)

(assert (=> b!180126 m!208187))

(assert (=> b!180056 d!54201))

(declare-fun b!180161 () Bool)

(declare-fun e!118674 () Bool)

(declare-fun lt!88986 () SeekEntryResult!589)

(assert (=> b!180161 (= e!118674 ((_ is Undefined!589) lt!88986))))

(declare-fun b!180162 () Bool)

(declare-fun res!85349 () Bool)

(declare-fun e!118676 () Bool)

(assert (=> b!180162 (=> (not res!85349) (not e!118676))))

(assert (=> b!180162 (= res!85349 (= (select (arr!3605 (_keys!5588 thiss!1248)) (index!4524 lt!88986)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180163 () Bool)

(declare-fun res!85352 () Bool)

(declare-fun e!118671 () Bool)

(assert (=> b!180163 (=> (not res!85352) (not e!118671))))

(declare-fun lt!88997 () tuple2!3352)

(assert (=> b!180163 (= res!85352 (valid!1016 (_2!1687 lt!88997)))))

(declare-fun b!180164 () Bool)

(declare-fun res!85356 () Bool)

(assert (=> b!180164 (= res!85356 (= (select (arr!3605 (_keys!5588 thiss!1248)) (index!4527 lt!88986)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118675 () Bool)

(assert (=> b!180164 (=> (not res!85356) (not e!118675))))

(declare-fun bm!18199 () Bool)

(declare-fun c!32270 () Bool)

(declare-fun c!32268 () Bool)

(declare-fun lt!88995 () SeekEntryResult!589)

(declare-fun call!18202 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!18199 (= call!18202 (inRange!0 (ite c!32268 (index!4525 lt!88995) (ite c!32270 (index!4524 lt!88986) (index!4527 lt!88986))) (mask!8692 thiss!1248)))))

(declare-fun b!180165 () Bool)

(declare-fun call!18203 () Bool)

(assert (=> b!180165 (= e!118675 (not call!18203))))

(declare-fun b!180166 () Bool)

(declare-fun e!118670 () Unit!5480)

(declare-fun Unit!5483 () Unit!5480)

(assert (=> b!180166 (= e!118670 Unit!5483)))

(declare-fun b!180167 () Bool)

(assert (=> b!180167 (= e!118671 (= (map!1933 (_2!1687 lt!88997)) (+!266 (map!1933 thiss!1248) (tuple2!3355 key!828 v!309))))))

(declare-fun b!180168 () Bool)

(assert (=> b!180168 (= e!118674 e!118675)))

(declare-fun res!85354 () Bool)

(declare-fun call!18205 () Bool)

(assert (=> b!180168 (= res!85354 call!18205)))

(assert (=> b!180168 (=> (not res!85354) (not e!118675))))

(declare-fun b!180169 () Bool)

(declare-fun e!118672 () Unit!5480)

(declare-fun lt!88992 () Unit!5480)

(assert (=> b!180169 (= e!118672 lt!88992)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!141 (array!7611 array!7613 (_ BitVec 32) (_ BitVec 32) V!5275 V!5275 (_ BitVec 64) Int) Unit!5480)

(assert (=> b!180169 (= lt!88992 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!141 (_keys!5588 thiss!1248) (_values!3680 thiss!1248) (mask!8692 thiss!1248) (extraKeys!3434 thiss!1248) (zeroValue!3538 thiss!1248) (minValue!3538 thiss!1248) key!828 (defaultEntry!3697 thiss!1248)))))

(declare-fun call!18204 () SeekEntryResult!589)

(assert (=> b!180169 (= lt!88986 call!18204)))

(assert (=> b!180169 (= c!32270 ((_ is MissingZero!589) lt!88986))))

(declare-fun e!118673 () Bool)

(assert (=> b!180169 e!118673))

(declare-fun bm!18200 () Bool)

(declare-fun arrayContainsKey!0 (array!7611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18200 (= call!18203 (arrayContainsKey!0 (_keys!5588 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun bm!18201 () Bool)

(assert (=> bm!18201 (= call!18204 (seekEntryOrOpen!0 key!828 (_keys!5588 thiss!1248) (mask!8692 thiss!1248)))))

(declare-fun b!180170 () Bool)

(declare-fun res!85351 () Bool)

(assert (=> b!180170 (=> (not res!85351) (not e!118676))))

(assert (=> b!180170 (= res!85351 call!18205)))

(assert (=> b!180170 (= e!118673 e!118676)))

(declare-fun b!180171 () Bool)

(declare-fun Unit!5484 () Unit!5480)

(assert (=> b!180171 (= e!118670 Unit!5484)))

(declare-fun lt!89007 () Unit!5480)

(declare-fun lemmaArrayContainsKeyThenInListMap!50 (array!7611 array!7613 (_ BitVec 32) (_ BitVec 32) V!5275 V!5275 (_ BitVec 64) (_ BitVec 32) Int) Unit!5480)

(assert (=> b!180171 (= lt!89007 (lemmaArrayContainsKeyThenInListMap!50 (_keys!5588 thiss!1248) (_values!3680 thiss!1248) (mask!8692 thiss!1248) (extraKeys!3434 thiss!1248) (zeroValue!3538 thiss!1248) (minValue!3538 thiss!1248) key!828 #b00000000000000000000000000000000 (defaultEntry!3697 thiss!1248)))))

(assert (=> b!180171 (contains!1229 (getCurrentListMap!805 (_keys!5588 thiss!1248) (_values!3680 thiss!1248) (mask!8692 thiss!1248) (extraKeys!3434 thiss!1248) (zeroValue!3538 thiss!1248) (minValue!3538 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3697 thiss!1248)) key!828)))

(declare-fun lt!89003 () Unit!5480)

(assert (=> b!180171 (= lt!89003 lt!89007)))

(assert (=> b!180171 false))

(declare-fun b!180172 () Bool)

(assert (=> b!180172 (= e!118676 (not call!18203))))

(declare-fun b!180173 () Bool)

(declare-fun res!85353 () Bool)

(assert (=> b!180173 (=> (not res!85353) (not e!118671))))

(assert (=> b!180173 (= res!85353 (contains!1229 (map!1933 (_2!1687 lt!88997)) key!828))))

(declare-fun d!54203 () Bool)

(assert (=> d!54203 e!118671))

(declare-fun res!85357 () Bool)

(assert (=> d!54203 (=> (not res!85357) (not e!118671))))

(assert (=> d!54203 (= res!85357 (_1!1687 lt!88997))))

(assert (=> d!54203 (= lt!88997 (tuple2!3353 true (LongMapFixedSize!2443 (defaultEntry!3697 thiss!1248) (mask!8692 thiss!1248) (extraKeys!3434 thiss!1248) (zeroValue!3538 thiss!1248) (minValue!3538 thiss!1248) (bvadd (_size!1270 thiss!1248) #b00000000000000000000000000000001) (array!7612 (store (arr!3605 (_keys!5588 thiss!1248)) (index!4527 lt!88887) key!828) (size!3913 (_keys!5588 thiss!1248))) (array!7614 (store (arr!3606 (_values!3680 thiss!1248)) (index!4527 lt!88887) (ValueCellFull!1767 v!309)) (size!3914 (_values!3680 thiss!1248))) (_vacant!1270 thiss!1248))))))

(declare-fun lt!89006 () Unit!5480)

(declare-fun lt!89004 () Unit!5480)

(assert (=> d!54203 (= lt!89006 lt!89004)))

(declare-fun lt!88991 () array!7613)

(declare-fun lt!88996 () array!7611)

(assert (=> d!54203 (contains!1229 (getCurrentListMap!805 lt!88996 lt!88991 (mask!8692 thiss!1248) (extraKeys!3434 thiss!1248) (zeroValue!3538 thiss!1248) (minValue!3538 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3697 thiss!1248)) (select (store (arr!3605 (_keys!5588 thiss!1248)) (index!4527 lt!88887) key!828) (index!4527 lt!88887)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!144 (array!7611 array!7613 (_ BitVec 32) (_ BitVec 32) V!5275 V!5275 (_ BitVec 32) Int) Unit!5480)

(assert (=> d!54203 (= lt!89004 (lemmaValidKeyInArrayIsInListMap!144 lt!88996 lt!88991 (mask!8692 thiss!1248) (extraKeys!3434 thiss!1248) (zeroValue!3538 thiss!1248) (minValue!3538 thiss!1248) (index!4527 lt!88887) (defaultEntry!3697 thiss!1248)))))

(assert (=> d!54203 (= lt!88991 (array!7614 (store (arr!3606 (_values!3680 thiss!1248)) (index!4527 lt!88887) (ValueCellFull!1767 v!309)) (size!3914 (_values!3680 thiss!1248))))))

(assert (=> d!54203 (= lt!88996 (array!7612 (store (arr!3605 (_keys!5588 thiss!1248)) (index!4527 lt!88887) key!828) (size!3913 (_keys!5588 thiss!1248))))))

(declare-fun lt!88990 () Unit!5480)

(declare-fun lt!89001 () Unit!5480)

(assert (=> d!54203 (= lt!88990 lt!89001)))

(declare-fun lt!88998 () array!7611)

(assert (=> d!54203 (= (arrayCountValidKeys!0 lt!88998 (index!4527 lt!88887) (bvadd (index!4527 lt!88887) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!7611 (_ BitVec 32)) Unit!5480)

(assert (=> d!54203 (= lt!89001 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!88998 (index!4527 lt!88887)))))

(assert (=> d!54203 (= lt!88998 (array!7612 (store (arr!3605 (_keys!5588 thiss!1248)) (index!4527 lt!88887) key!828) (size!3913 (_keys!5588 thiss!1248))))))

(declare-fun lt!88988 () Unit!5480)

(declare-fun lt!89009 () Unit!5480)

(assert (=> d!54203 (= lt!88988 lt!89009)))

(declare-fun lt!89002 () array!7611)

(assert (=> d!54203 (arrayContainsKey!0 lt!89002 key!828 #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7611 (_ BitVec 64) (_ BitVec 32)) Unit!5480)

(assert (=> d!54203 (= lt!89009 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!89002 key!828 (index!4527 lt!88887)))))

(assert (=> d!54203 (= lt!89002 (array!7612 (store (arr!3605 (_keys!5588 thiss!1248)) (index!4527 lt!88887) key!828) (size!3913 (_keys!5588 thiss!1248))))))

(declare-fun lt!89005 () Unit!5480)

(declare-fun lt!88983 () Unit!5480)

(assert (=> d!54203 (= lt!89005 lt!88983)))

(assert (=> d!54203 (= (+!266 (getCurrentListMap!805 (_keys!5588 thiss!1248) (_values!3680 thiss!1248) (mask!8692 thiss!1248) (extraKeys!3434 thiss!1248) (zeroValue!3538 thiss!1248) (minValue!3538 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3697 thiss!1248)) (tuple2!3355 key!828 v!309)) (getCurrentListMap!805 (array!7612 (store (arr!3605 (_keys!5588 thiss!1248)) (index!4527 lt!88887) key!828) (size!3913 (_keys!5588 thiss!1248))) (array!7614 (store (arr!3606 (_values!3680 thiss!1248)) (index!4527 lt!88887) (ValueCellFull!1767 v!309)) (size!3914 (_values!3680 thiss!1248))) (mask!8692 thiss!1248) (extraKeys!3434 thiss!1248) (zeroValue!3538 thiss!1248) (minValue!3538 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3697 thiss!1248)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!50 (array!7611 array!7613 (_ BitVec 32) (_ BitVec 32) V!5275 V!5275 (_ BitVec 32) (_ BitVec 64) V!5275 Int) Unit!5480)

(assert (=> d!54203 (= lt!88983 (lemmaAddValidKeyToArrayThenAddPairToListMap!50 (_keys!5588 thiss!1248) (_values!3680 thiss!1248) (mask!8692 thiss!1248) (extraKeys!3434 thiss!1248) (zeroValue!3538 thiss!1248) (minValue!3538 thiss!1248) (index!4527 lt!88887) key!828 v!309 (defaultEntry!3697 thiss!1248)))))

(declare-fun lt!88999 () Unit!5480)

(declare-fun lt!88989 () Unit!5480)

(assert (=> d!54203 (= lt!88999 lt!88989)))

(assert (=> d!54203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!7612 (store (arr!3605 (_keys!5588 thiss!1248)) (index!4527 lt!88887) key!828) (size!3913 (_keys!5588 thiss!1248))) (mask!8692 thiss!1248))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!7611 (_ BitVec 32) (_ BitVec 32)) Unit!5480)

(assert (=> d!54203 (= lt!88989 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!828 (_keys!5588 thiss!1248) (index!4527 lt!88887) (mask!8692 thiss!1248)))))

(declare-fun lt!88984 () Unit!5480)

(declare-fun lt!89011 () Unit!5480)

(assert (=> d!54203 (= lt!88984 lt!89011)))

(assert (=> d!54203 (= (arrayCountValidKeys!0 (array!7612 (store (arr!3605 (_keys!5588 thiss!1248)) (index!4527 lt!88887) key!828) (size!3913 (_keys!5588 thiss!1248))) #b00000000000000000000000000000000 (size!3913 (_keys!5588 thiss!1248))) (bvadd (arrayCountValidKeys!0 (_keys!5588 thiss!1248) #b00000000000000000000000000000000 (size!3913 (_keys!5588 thiss!1248))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!7611 (_ BitVec 32) (_ BitVec 64)) Unit!5480)

(assert (=> d!54203 (= lt!89011 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!5588 thiss!1248) (index!4527 lt!88887) key!828))))

(declare-fun lt!88987 () Unit!5480)

(declare-fun lt!88985 () Unit!5480)

(assert (=> d!54203 (= lt!88987 lt!88985)))

(declare-fun lt!88993 () List!2291)

(declare-fun lt!89008 () (_ BitVec 32))

(assert (=> d!54203 (arrayNoDuplicates!0 (array!7612 (store (arr!3605 (_keys!5588 thiss!1248)) (index!4527 lt!88887) key!828) (size!3913 (_keys!5588 thiss!1248))) lt!89008 lt!88993)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!7611 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!2291) Unit!5480)

(assert (=> d!54203 (= lt!88985 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!5588 thiss!1248) key!828 (index!4527 lt!88887) lt!89008 lt!88993))))

(assert (=> d!54203 (= lt!88993 Nil!2288)))

(assert (=> d!54203 (= lt!89008 #b00000000000000000000000000000000)))

(declare-fun lt!89010 () Unit!5480)

(assert (=> d!54203 (= lt!89010 e!118670)))

(declare-fun c!32269 () Bool)

(assert (=> d!54203 (= c!32269 (arrayContainsKey!0 (_keys!5588 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun lt!89000 () Unit!5480)

(assert (=> d!54203 (= lt!89000 e!118672)))

(assert (=> d!54203 (= c!32268 (contains!1229 (getCurrentListMap!805 (_keys!5588 thiss!1248) (_values!3680 thiss!1248) (mask!8692 thiss!1248) (extraKeys!3434 thiss!1248) (zeroValue!3538 thiss!1248) (minValue!3538 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3697 thiss!1248)) key!828))))

(assert (=> d!54203 (valid!1016 thiss!1248)))

(assert (=> d!54203 (= (updateHelperNewKey!87 thiss!1248 key!828 v!309 (index!4527 lt!88887)) lt!88997)))

(declare-fun b!180174 () Bool)

(declare-fun res!85350 () Bool)

(assert (=> b!180174 (= res!85350 call!18202)))

(declare-fun e!118669 () Bool)

(assert (=> b!180174 (=> (not res!85350) (not e!118669))))

(declare-fun b!180175 () Bool)

(declare-fun Unit!5485 () Unit!5480)

(assert (=> b!180175 (= e!118672 Unit!5485)))

(declare-fun lt!89012 () Unit!5480)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!140 (array!7611 array!7613 (_ BitVec 32) (_ BitVec 32) V!5275 V!5275 (_ BitVec 64) Int) Unit!5480)

(assert (=> b!180175 (= lt!89012 (lemmaInListMapThenSeekEntryOrOpenFindsIt!140 (_keys!5588 thiss!1248) (_values!3680 thiss!1248) (mask!8692 thiss!1248) (extraKeys!3434 thiss!1248) (zeroValue!3538 thiss!1248) (minValue!3538 thiss!1248) key!828 (defaultEntry!3697 thiss!1248)))))

(assert (=> b!180175 (= lt!88995 call!18204)))

(declare-fun res!85355 () Bool)

(assert (=> b!180175 (= res!85355 ((_ is Found!589) lt!88995))))

(assert (=> b!180175 (=> (not res!85355) (not e!118669))))

(assert (=> b!180175 e!118669))

(declare-fun lt!88994 () Unit!5480)

(assert (=> b!180175 (= lt!88994 lt!89012)))

(assert (=> b!180175 false))

(declare-fun bm!18202 () Bool)

(assert (=> bm!18202 (= call!18205 call!18202)))

(declare-fun b!180176 () Bool)

(assert (=> b!180176 (= e!118669 (= (select (arr!3605 (_keys!5588 thiss!1248)) (index!4525 lt!88995)) key!828))))

(declare-fun b!180177 () Bool)

(declare-fun c!32267 () Bool)

(assert (=> b!180177 (= c!32267 ((_ is MissingVacant!589) lt!88986))))

(assert (=> b!180177 (= e!118673 e!118674)))

(assert (= (and d!54203 c!32268) b!180175))

(assert (= (and d!54203 (not c!32268)) b!180169))

(assert (= (and b!180175 res!85355) b!180174))

(assert (= (and b!180174 res!85350) b!180176))

(assert (= (and b!180169 c!32270) b!180170))

(assert (= (and b!180169 (not c!32270)) b!180177))

(assert (= (and b!180170 res!85351) b!180162))

(assert (= (and b!180162 res!85349) b!180172))

(assert (= (and b!180177 c!32267) b!180168))

(assert (= (and b!180177 (not c!32267)) b!180161))

(assert (= (and b!180168 res!85354) b!180164))

(assert (= (and b!180164 res!85356) b!180165))

(assert (= (or b!180170 b!180168) bm!18202))

(assert (= (or b!180172 b!180165) bm!18200))

(assert (= (or b!180174 bm!18202) bm!18199))

(assert (= (or b!180175 b!180169) bm!18201))

(assert (= (and d!54203 c!32269) b!180171))

(assert (= (and d!54203 (not c!32269)) b!180166))

(assert (= (and d!54203 res!85357) b!180163))

(assert (= (and b!180163 res!85352) b!180173))

(assert (= (and b!180173 res!85353) b!180167))

(declare-fun m!208189 () Bool)

(assert (=> b!180163 m!208189))

(declare-fun m!208191 () Bool)

(assert (=> bm!18200 m!208191))

(declare-fun m!208193 () Bool)

(assert (=> d!54203 m!208193))

(declare-fun m!208195 () Bool)

(assert (=> d!54203 m!208195))

(declare-fun m!208197 () Bool)

(assert (=> d!54203 m!208197))

(declare-fun m!208199 () Bool)

(assert (=> d!54203 m!208199))

(declare-fun m!208201 () Bool)

(assert (=> d!54203 m!208201))

(declare-fun m!208203 () Bool)

(assert (=> d!54203 m!208203))

(assert (=> d!54203 m!208165))

(declare-fun m!208205 () Bool)

(assert (=> d!54203 m!208205))

(declare-fun m!208207 () Bool)

(assert (=> d!54203 m!208207))

(declare-fun m!208209 () Bool)

(assert (=> d!54203 m!208209))

(declare-fun m!208211 () Bool)

(assert (=> d!54203 m!208211))

(declare-fun m!208213 () Bool)

(assert (=> d!54203 m!208213))

(declare-fun m!208215 () Bool)

(assert (=> d!54203 m!208215))

(assert (=> d!54203 m!208179))

(assert (=> d!54203 m!208191))

(declare-fun m!208217 () Bool)

(assert (=> d!54203 m!208217))

(declare-fun m!208219 () Bool)

(assert (=> d!54203 m!208219))

(assert (=> d!54203 m!208179))

(declare-fun m!208221 () Bool)

(assert (=> d!54203 m!208221))

(assert (=> d!54203 m!208179))

(declare-fun m!208223 () Bool)

(assert (=> d!54203 m!208223))

(assert (=> d!54203 m!208201))

(declare-fun m!208225 () Bool)

(assert (=> d!54203 m!208225))

(assert (=> d!54203 m!208199))

(declare-fun m!208227 () Bool)

(assert (=> d!54203 m!208227))

(declare-fun m!208229 () Bool)

(assert (=> d!54203 m!208229))

(assert (=> d!54203 m!208115))

(declare-fun m!208231 () Bool)

(assert (=> d!54203 m!208231))

(declare-fun m!208233 () Bool)

(assert (=> b!180169 m!208233))

(declare-fun m!208235 () Bool)

(assert (=> b!180162 m!208235))

(declare-fun m!208237 () Bool)

(assert (=> b!180175 m!208237))

(declare-fun m!208239 () Bool)

(assert (=> b!180164 m!208239))

(assert (=> bm!18201 m!208109))

(declare-fun m!208241 () Bool)

(assert (=> b!180171 m!208241))

(assert (=> b!180171 m!208179))

(assert (=> b!180171 m!208179))

(assert (=> b!180171 m!208221))

(declare-fun m!208243 () Bool)

(assert (=> b!180173 m!208243))

(assert (=> b!180173 m!208243))

(declare-fun m!208245 () Bool)

(assert (=> b!180173 m!208245))

(declare-fun m!208247 () Bool)

(assert (=> b!180176 m!208247))

(assert (=> b!180167 m!208243))

(assert (=> b!180167 m!208121))

(assert (=> b!180167 m!208121))

(declare-fun m!208249 () Bool)

(assert (=> b!180167 m!208249))

(declare-fun m!208251 () Bool)

(assert (=> bm!18199 m!208251))

(assert (=> b!180056 d!54203))

(declare-fun d!54205 () Bool)

(assert (=> d!54205 (= (map!1933 (_2!1687 lt!88889)) (getCurrentListMap!805 (_keys!5588 (_2!1687 lt!88889)) (_values!3680 (_2!1687 lt!88889)) (mask!8692 (_2!1687 lt!88889)) (extraKeys!3434 (_2!1687 lt!88889)) (zeroValue!3538 (_2!1687 lt!88889)) (minValue!3538 (_2!1687 lt!88889)) #b00000000000000000000000000000000 (defaultEntry!3697 (_2!1687 lt!88889))))))

(declare-fun bs!7368 () Bool)

(assert (= bs!7368 d!54205))

(declare-fun m!208253 () Bool)

(assert (=> bs!7368 m!208253))

(assert (=> bm!18184 d!54205))

(declare-fun b!180190 () Bool)

(declare-fun e!118684 () SeekEntryResult!589)

(declare-fun lt!89021 () SeekEntryResult!589)

(assert (=> b!180190 (= e!118684 (Found!589 (index!4526 lt!89021)))))

(declare-fun b!180191 () Bool)

(declare-fun e!118685 () SeekEntryResult!589)

(assert (=> b!180191 (= e!118685 e!118684)))

(declare-fun lt!89020 () (_ BitVec 64))

(assert (=> b!180191 (= lt!89020 (select (arr!3605 (_keys!5588 thiss!1248)) (index!4526 lt!89021)))))

(declare-fun c!32278 () Bool)

(assert (=> b!180191 (= c!32278 (= lt!89020 key!828))))

(declare-fun b!180192 () Bool)

(assert (=> b!180192 (= e!118685 Undefined!589)))

(declare-fun b!180193 () Bool)

(declare-fun c!32279 () Bool)

(assert (=> b!180193 (= c!32279 (= lt!89020 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118683 () SeekEntryResult!589)

(assert (=> b!180193 (= e!118684 e!118683)))

(declare-fun d!54207 () Bool)

(declare-fun lt!89019 () SeekEntryResult!589)

(assert (=> d!54207 (and (or ((_ is Undefined!589) lt!89019) (not ((_ is Found!589) lt!89019)) (and (bvsge (index!4525 lt!89019) #b00000000000000000000000000000000) (bvslt (index!4525 lt!89019) (size!3913 (_keys!5588 thiss!1248))))) (or ((_ is Undefined!589) lt!89019) ((_ is Found!589) lt!89019) (not ((_ is MissingZero!589) lt!89019)) (and (bvsge (index!4524 lt!89019) #b00000000000000000000000000000000) (bvslt (index!4524 lt!89019) (size!3913 (_keys!5588 thiss!1248))))) (or ((_ is Undefined!589) lt!89019) ((_ is Found!589) lt!89019) ((_ is MissingZero!589) lt!89019) (not ((_ is MissingVacant!589) lt!89019)) (and (bvsge (index!4527 lt!89019) #b00000000000000000000000000000000) (bvslt (index!4527 lt!89019) (size!3913 (_keys!5588 thiss!1248))))) (or ((_ is Undefined!589) lt!89019) (ite ((_ is Found!589) lt!89019) (= (select (arr!3605 (_keys!5588 thiss!1248)) (index!4525 lt!89019)) key!828) (ite ((_ is MissingZero!589) lt!89019) (= (select (arr!3605 (_keys!5588 thiss!1248)) (index!4524 lt!89019)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!589) lt!89019) (= (select (arr!3605 (_keys!5588 thiss!1248)) (index!4527 lt!89019)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54207 (= lt!89019 e!118685)))

(declare-fun c!32277 () Bool)

(assert (=> d!54207 (= c!32277 (and ((_ is Intermediate!589) lt!89021) (undefined!1401 lt!89021)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7611 (_ BitVec 32)) SeekEntryResult!589)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54207 (= lt!89021 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8692 thiss!1248)) key!828 (_keys!5588 thiss!1248) (mask!8692 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!54207 (validMask!0 (mask!8692 thiss!1248))))

(assert (=> d!54207 (= (seekEntryOrOpen!0 key!828 (_keys!5588 thiss!1248) (mask!8692 thiss!1248)) lt!89019)))

(declare-fun b!180194 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7611 (_ BitVec 32)) SeekEntryResult!589)

(assert (=> b!180194 (= e!118683 (seekKeyOrZeroReturnVacant!0 (x!19679 lt!89021) (index!4526 lt!89021) (index!4526 lt!89021) key!828 (_keys!5588 thiss!1248) (mask!8692 thiss!1248)))))

(declare-fun b!180195 () Bool)

(assert (=> b!180195 (= e!118683 (MissingZero!589 (index!4526 lt!89021)))))

(assert (= (and d!54207 c!32277) b!180192))

(assert (= (and d!54207 (not c!32277)) b!180191))

(assert (= (and b!180191 c!32278) b!180190))

(assert (= (and b!180191 (not c!32278)) b!180193))

(assert (= (and b!180193 c!32279) b!180195))

(assert (= (and b!180193 (not c!32279)) b!180194))

(declare-fun m!208255 () Bool)

(assert (=> b!180191 m!208255))

(declare-fun m!208257 () Bool)

(assert (=> d!54207 m!208257))

(declare-fun m!208259 () Bool)

(assert (=> d!54207 m!208259))

(declare-fun m!208261 () Bool)

(assert (=> d!54207 m!208261))

(declare-fun m!208263 () Bool)

(assert (=> d!54207 m!208263))

(declare-fun m!208265 () Bool)

(assert (=> d!54207 m!208265))

(declare-fun m!208267 () Bool)

(assert (=> d!54207 m!208267))

(assert (=> d!54207 m!208257))

(declare-fun m!208269 () Bool)

(assert (=> b!180194 m!208269))

(assert (=> b!180064 d!54207))

(declare-fun b!180203 () Bool)

(declare-fun e!118691 () Bool)

(assert (=> b!180203 (= e!118691 tp_is_empty!4221)))

(declare-fun mapIsEmpty!7231 () Bool)

(declare-fun mapRes!7231 () Bool)

(assert (=> mapIsEmpty!7231 mapRes!7231))

(declare-fun condMapEmpty!7231 () Bool)

(declare-fun mapDefault!7231 () ValueCell!1767)

(assert (=> mapNonEmpty!7225 (= condMapEmpty!7231 (= mapRest!7225 ((as const (Array (_ BitVec 32) ValueCell!1767)) mapDefault!7231)))))

(assert (=> mapNonEmpty!7225 (= tp!16078 (and e!118691 mapRes!7231))))

(declare-fun b!180202 () Bool)

(declare-fun e!118690 () Bool)

(assert (=> b!180202 (= e!118690 tp_is_empty!4221)))

(declare-fun mapNonEmpty!7231 () Bool)

(declare-fun tp!16087 () Bool)

(assert (=> mapNonEmpty!7231 (= mapRes!7231 (and tp!16087 e!118690))))

(declare-fun mapRest!7231 () (Array (_ BitVec 32) ValueCell!1767))

(declare-fun mapValue!7231 () ValueCell!1767)

(declare-fun mapKey!7231 () (_ BitVec 32))

(assert (=> mapNonEmpty!7231 (= mapRest!7225 (store mapRest!7231 mapKey!7231 mapValue!7231))))

(assert (= (and mapNonEmpty!7225 condMapEmpty!7231) mapIsEmpty!7231))

(assert (= (and mapNonEmpty!7225 (not condMapEmpty!7231)) mapNonEmpty!7231))

(assert (= (and mapNonEmpty!7231 ((_ is ValueCellFull!1767) mapValue!7231)) b!180202))

(assert (= (and mapNonEmpty!7225 ((_ is ValueCellFull!1767) mapDefault!7231)) b!180203))

(declare-fun m!208271 () Bool)

(assert (=> mapNonEmpty!7231 m!208271))

(check-sat (not b!180113) (not b!180104) (not b!180123) (not b!180175) (not b_next!4449) (not b!180163) (not b!180112) (not d!54195) (not d!54201) (not b!180194) (not d!54207) b_and!10983 (not mapNonEmpty!7231) (not b!180167) (not b!180114) (not b!180121) (not d!54199) (not d!54203) tp_is_empty!4221 (not d!54205) (not b!180125) (not bm!18199) (not bm!18201) (not b!180126) (not d!54189) (not b!180124) (not b!180171) (not d!54197) (not b!180105) (not b!180173) (not b!180169) (not bm!18200))
(check-sat b_and!10983 (not b_next!4449))
