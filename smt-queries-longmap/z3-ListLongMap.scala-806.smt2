; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19478 () Bool)

(assert start!19478)

(declare-fun b!191094 () Bool)

(declare-fun b_free!4675 () Bool)

(declare-fun b_next!4675 () Bool)

(assert (=> b!191094 (= b_free!4675 (not b_next!4675))))

(declare-fun tp!16872 () Bool)

(declare-fun b_and!11319 () Bool)

(assert (=> b!191094 (= tp!16872 b_and!11319)))

(declare-fun mapIsEmpty!7680 () Bool)

(declare-fun mapRes!7680 () Bool)

(assert (=> mapIsEmpty!7680 mapRes!7680))

(declare-datatypes ((SeekEntryResult!679 0))(
  ( (MissingZero!679 (index!4886 (_ BitVec 32))) (Found!679 (index!4887 (_ BitVec 32))) (Intermediate!679 (undefined!1491 Bool) (index!4888 (_ BitVec 32)) (x!20532 (_ BitVec 32))) (Undefined!679) (MissingVacant!679 (index!4889 (_ BitVec 32))) )
))
(declare-fun lt!94721 () SeekEntryResult!679)

(declare-fun e!125735 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5577 0))(
  ( (V!5578 (val!2268 Int)) )
))
(declare-datatypes ((ValueCell!1880 0))(
  ( (ValueCellFull!1880 (v!4199 V!5577)) (EmptyCell!1880) )
))
(declare-datatypes ((array!8111 0))(
  ( (array!8112 (arr!3820 (Array (_ BitVec 32) (_ BitVec 64))) (size!4143 (_ BitVec 32))) )
))
(declare-datatypes ((array!8113 0))(
  ( (array!8114 (arr!3821 (Array (_ BitVec 32) ValueCell!1880)) (size!4144 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2668 0))(
  ( (LongMapFixedSize!2669 (defaultEntry!3902 Int) (mask!9117 (_ BitVec 32)) (extraKeys!3639 (_ BitVec 32)) (zeroValue!3743 V!5577) (minValue!3743 V!5577) (_size!1383 (_ BitVec 32)) (_keys!5878 array!8111) (_values!3885 array!8113) (_vacant!1383 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2668)

(declare-fun b!191090 () Bool)

(assert (=> b!191090 (= e!125735 (= (select (arr!3820 (_keys!5878 thiss!1248)) (index!4887 lt!94721)) key!828))))

(declare-fun b!191091 () Bool)

(declare-fun res!90293 () Bool)

(declare-fun e!125734 () Bool)

(assert (=> b!191091 (=> (not res!90293) (not e!125734))))

(assert (=> b!191091 (= res!90293 (not (= key!828 (bvneg key!828))))))

(declare-fun b!191092 () Bool)

(declare-fun e!125741 () Bool)

(assert (=> b!191092 (= e!125734 e!125741)))

(declare-fun res!90296 () Bool)

(assert (=> b!191092 (=> (not res!90296) (not e!125741))))

(get-info :version)

(assert (=> b!191092 (= res!90296 (and (not ((_ is Undefined!679) lt!94721)) (not ((_ is MissingVacant!679) lt!94721)) (not ((_ is MissingZero!679) lt!94721)) ((_ is Found!679) lt!94721)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8111 (_ BitVec 32)) SeekEntryResult!679)

(assert (=> b!191092 (= lt!94721 (seekEntryOrOpen!0 key!828 (_keys!5878 thiss!1248) (mask!9117 thiss!1248)))))

(declare-fun mapNonEmpty!7680 () Bool)

(declare-fun tp!16871 () Bool)

(declare-fun e!125742 () Bool)

(assert (=> mapNonEmpty!7680 (= mapRes!7680 (and tp!16871 e!125742))))

(declare-fun mapValue!7680 () ValueCell!1880)

(declare-fun mapRest!7680 () (Array (_ BitVec 32) ValueCell!1880))

(declare-fun mapKey!7680 () (_ BitVec 32))

(assert (=> mapNonEmpty!7680 (= (arr!3821 (_values!3885 thiss!1248)) (store mapRest!7680 mapKey!7680 mapValue!7680))))

(declare-fun b!191093 () Bool)

(declare-fun e!125733 () Bool)

(declare-fun tp_is_empty!4447 () Bool)

(assert (=> b!191093 (= e!125733 tp_is_empty!4447)))

(declare-fun res!90292 () Bool)

(assert (=> start!19478 (=> (not res!90292) (not e!125734))))

(declare-fun valid!1113 (LongMapFixedSize!2668) Bool)

(assert (=> start!19478 (= res!90292 (valid!1113 thiss!1248))))

(assert (=> start!19478 e!125734))

(declare-fun e!125736 () Bool)

(assert (=> start!19478 e!125736))

(assert (=> start!19478 true))

(assert (=> start!19478 tp_is_empty!4447))

(declare-fun e!125740 () Bool)

(declare-fun array_inv!2479 (array!8111) Bool)

(declare-fun array_inv!2480 (array!8113) Bool)

(assert (=> b!191094 (= e!125736 (and tp!16872 tp_is_empty!4447 (array_inv!2479 (_keys!5878 thiss!1248)) (array_inv!2480 (_values!3885 thiss!1248)) e!125740))))

(declare-fun b!191095 () Bool)

(declare-fun e!125738 () Bool)

(assert (=> b!191095 (= e!125738 (or (not (= (size!4144 (_values!3885 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9117 thiss!1248)))) (not (= (size!4143 (_keys!5878 thiss!1248)) (size!4144 (_values!3885 thiss!1248)))) (bvsge (mask!9117 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!191096 () Bool)

(assert (=> b!191096 (= e!125742 tp_is_empty!4447)))

(declare-fun b!191097 () Bool)

(declare-datatypes ((Unit!5734 0))(
  ( (Unit!5735) )
))
(declare-fun e!125737 () Unit!5734)

(declare-fun lt!94718 () Unit!5734)

(assert (=> b!191097 (= e!125737 lt!94718)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!170 (array!8111 array!8113 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 64) Int) Unit!5734)

(assert (=> b!191097 (= lt!94718 (lemmaInListMapThenSeekEntryOrOpenFindsIt!170 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) key!828 (defaultEntry!3902 thiss!1248)))))

(declare-fun res!90295 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!191097 (= res!90295 (inRange!0 (index!4887 lt!94721) (mask!9117 thiss!1248)))))

(assert (=> b!191097 (=> (not res!90295) (not e!125735))))

(assert (=> b!191097 e!125735))

(declare-fun b!191098 () Bool)

(assert (=> b!191098 (= e!125741 (not e!125738))))

(declare-fun res!90294 () Bool)

(assert (=> b!191098 (=> res!90294 e!125738)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!191098 (= res!90294 (not (validMask!0 (mask!9117 thiss!1248))))))

(declare-datatypes ((tuple2!3480 0))(
  ( (tuple2!3481 (_1!1751 (_ BitVec 64)) (_2!1751 V!5577)) )
))
(declare-datatypes ((List!2402 0))(
  ( (Nil!2399) (Cons!2398 (h!3037 tuple2!3480) (t!7305 List!2402)) )
))
(declare-datatypes ((ListLongMap!2389 0))(
  ( (ListLongMap!2390 (toList!1210 List!2402)) )
))
(declare-fun lt!94719 () ListLongMap!2389)

(declare-fun v!309 () V!5577)

(declare-fun +!302 (ListLongMap!2389 tuple2!3480) ListLongMap!2389)

(declare-fun getCurrentListMap!843 (array!8111 array!8113 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 32) Int) ListLongMap!2389)

(assert (=> b!191098 (= (+!302 lt!94719 (tuple2!3481 key!828 v!309)) (getCurrentListMap!843 (_keys!5878 thiss!1248) (array!8114 (store (arr!3821 (_values!3885 thiss!1248)) (index!4887 lt!94721) (ValueCellFull!1880 v!309)) (size!4144 (_values!3885 thiss!1248))) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!94722 () Unit!5734)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!118 (array!8111 array!8113 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 32) (_ BitVec 64) V!5577 Int) Unit!5734)

(assert (=> b!191098 (= lt!94722 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!118 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) (index!4887 lt!94721) key!828 v!309 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!94717 () Unit!5734)

(assert (=> b!191098 (= lt!94717 e!125737)))

(declare-fun c!34401 () Bool)

(declare-fun contains!1329 (ListLongMap!2389 (_ BitVec 64)) Bool)

(assert (=> b!191098 (= c!34401 (contains!1329 lt!94719 key!828))))

(assert (=> b!191098 (= lt!94719 (getCurrentListMap!843 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun b!191099 () Bool)

(assert (=> b!191099 (= e!125740 (and e!125733 mapRes!7680))))

(declare-fun condMapEmpty!7680 () Bool)

(declare-fun mapDefault!7680 () ValueCell!1880)

(assert (=> b!191099 (= condMapEmpty!7680 (= (arr!3821 (_values!3885 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1880)) mapDefault!7680)))))

(declare-fun b!191100 () Bool)

(declare-fun Unit!5736 () Unit!5734)

(assert (=> b!191100 (= e!125737 Unit!5736)))

(declare-fun lt!94720 () Unit!5734)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!168 (array!8111 array!8113 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 64) Int) Unit!5734)

(assert (=> b!191100 (= lt!94720 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!168 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) key!828 (defaultEntry!3902 thiss!1248)))))

(assert (=> b!191100 false))

(assert (= (and start!19478 res!90292) b!191091))

(assert (= (and b!191091 res!90293) b!191092))

(assert (= (and b!191092 res!90296) b!191098))

(assert (= (and b!191098 c!34401) b!191097))

(assert (= (and b!191098 (not c!34401)) b!191100))

(assert (= (and b!191097 res!90295) b!191090))

(assert (= (and b!191098 (not res!90294)) b!191095))

(assert (= (and b!191099 condMapEmpty!7680) mapIsEmpty!7680))

(assert (= (and b!191099 (not condMapEmpty!7680)) mapNonEmpty!7680))

(assert (= (and mapNonEmpty!7680 ((_ is ValueCellFull!1880) mapValue!7680)) b!191096))

(assert (= (and b!191099 ((_ is ValueCellFull!1880) mapDefault!7680)) b!191093))

(assert (= b!191094 b!191099))

(assert (= start!19478 b!191094))

(declare-fun m!217201 () Bool)

(assert (=> mapNonEmpty!7680 m!217201))

(declare-fun m!217203 () Bool)

(assert (=> b!191094 m!217203))

(declare-fun m!217205 () Bool)

(assert (=> b!191094 m!217205))

(declare-fun m!217207 () Bool)

(assert (=> b!191098 m!217207))

(declare-fun m!217209 () Bool)

(assert (=> b!191098 m!217209))

(declare-fun m!217211 () Bool)

(assert (=> b!191098 m!217211))

(declare-fun m!217213 () Bool)

(assert (=> b!191098 m!217213))

(declare-fun m!217215 () Bool)

(assert (=> b!191098 m!217215))

(declare-fun m!217217 () Bool)

(assert (=> b!191098 m!217217))

(declare-fun m!217219 () Bool)

(assert (=> b!191098 m!217219))

(declare-fun m!217221 () Bool)

(assert (=> b!191092 m!217221))

(declare-fun m!217223 () Bool)

(assert (=> start!19478 m!217223))

(declare-fun m!217225 () Bool)

(assert (=> b!191097 m!217225))

(declare-fun m!217227 () Bool)

(assert (=> b!191097 m!217227))

(declare-fun m!217229 () Bool)

(assert (=> b!191090 m!217229))

(declare-fun m!217231 () Bool)

(assert (=> b!191100 m!217231))

(check-sat tp_is_empty!4447 (not mapNonEmpty!7680) (not b_next!4675) (not b!191097) (not b!191094) (not start!19478) (not b!191098) (not b!191092) b_and!11319 (not b!191100))
(check-sat b_and!11319 (not b_next!4675))
(get-model)

(declare-fun d!55979 () Bool)

(declare-fun e!125805 () Bool)

(assert (=> d!55979 e!125805))

(declare-fun res!90332 () Bool)

(assert (=> d!55979 (=> (not res!90332) (not e!125805))))

(declare-fun lt!94764 () SeekEntryResult!679)

(assert (=> d!55979 (= res!90332 ((_ is Found!679) lt!94764))))

(assert (=> d!55979 (= lt!94764 (seekEntryOrOpen!0 key!828 (_keys!5878 thiss!1248) (mask!9117 thiss!1248)))))

(declare-fun lt!94763 () Unit!5734)

(declare-fun choose!1041 (array!8111 array!8113 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 64) Int) Unit!5734)

(assert (=> d!55979 (= lt!94763 (choose!1041 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) key!828 (defaultEntry!3902 thiss!1248)))))

(assert (=> d!55979 (validMask!0 (mask!9117 thiss!1248))))

(assert (=> d!55979 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!170 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) key!828 (defaultEntry!3902 thiss!1248)) lt!94763)))

(declare-fun b!191171 () Bool)

(declare-fun res!90331 () Bool)

(assert (=> b!191171 (=> (not res!90331) (not e!125805))))

(assert (=> b!191171 (= res!90331 (inRange!0 (index!4887 lt!94764) (mask!9117 thiss!1248)))))

(declare-fun b!191172 () Bool)

(assert (=> b!191172 (= e!125805 (= (select (arr!3820 (_keys!5878 thiss!1248)) (index!4887 lt!94764)) key!828))))

(assert (=> b!191172 (and (bvsge (index!4887 lt!94764) #b00000000000000000000000000000000) (bvslt (index!4887 lt!94764) (size!4143 (_keys!5878 thiss!1248))))))

(assert (= (and d!55979 res!90332) b!191171))

(assert (= (and b!191171 res!90331) b!191172))

(assert (=> d!55979 m!217221))

(declare-fun m!217297 () Bool)

(assert (=> d!55979 m!217297))

(assert (=> d!55979 m!217219))

(declare-fun m!217299 () Bool)

(assert (=> b!191171 m!217299))

(declare-fun m!217301 () Bool)

(assert (=> b!191172 m!217301))

(assert (=> b!191097 d!55979))

(declare-fun d!55981 () Bool)

(assert (=> d!55981 (= (inRange!0 (index!4887 lt!94721) (mask!9117 thiss!1248)) (and (bvsge (index!4887 lt!94721) #b00000000000000000000000000000000) (bvslt (index!4887 lt!94721) (bvadd (mask!9117 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!191097 d!55981))

(declare-fun d!55983 () Bool)

(declare-fun res!90339 () Bool)

(declare-fun e!125808 () Bool)

(assert (=> d!55983 (=> (not res!90339) (not e!125808))))

(declare-fun simpleValid!197 (LongMapFixedSize!2668) Bool)

(assert (=> d!55983 (= res!90339 (simpleValid!197 thiss!1248))))

(assert (=> d!55983 (= (valid!1113 thiss!1248) e!125808)))

(declare-fun b!191179 () Bool)

(declare-fun res!90340 () Bool)

(assert (=> b!191179 (=> (not res!90340) (not e!125808))))

(declare-fun arrayCountValidKeys!0 (array!8111 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!191179 (= res!90340 (= (arrayCountValidKeys!0 (_keys!5878 thiss!1248) #b00000000000000000000000000000000 (size!4143 (_keys!5878 thiss!1248))) (_size!1383 thiss!1248)))))

(declare-fun b!191180 () Bool)

(declare-fun res!90341 () Bool)

(assert (=> b!191180 (=> (not res!90341) (not e!125808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8111 (_ BitVec 32)) Bool)

(assert (=> b!191180 (= res!90341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5878 thiss!1248) (mask!9117 thiss!1248)))))

(declare-fun b!191181 () Bool)

(declare-datatypes ((List!2404 0))(
  ( (Nil!2401) (Cons!2400 (h!3039 (_ BitVec 64)) (t!7309 List!2404)) )
))
(declare-fun arrayNoDuplicates!0 (array!8111 (_ BitVec 32) List!2404) Bool)

(assert (=> b!191181 (= e!125808 (arrayNoDuplicates!0 (_keys!5878 thiss!1248) #b00000000000000000000000000000000 Nil!2401))))

(assert (= (and d!55983 res!90339) b!191179))

(assert (= (and b!191179 res!90340) b!191180))

(assert (= (and b!191180 res!90341) b!191181))

(declare-fun m!217303 () Bool)

(assert (=> d!55983 m!217303))

(declare-fun m!217305 () Bool)

(assert (=> b!191179 m!217305))

(declare-fun m!217307 () Bool)

(assert (=> b!191180 m!217307))

(declare-fun m!217309 () Bool)

(assert (=> b!191181 m!217309))

(assert (=> start!19478 d!55983))

(declare-fun d!55985 () Bool)

(assert (=> d!55985 (= (validMask!0 (mask!9117 thiss!1248)) (and (or (= (mask!9117 thiss!1248) #b00000000000000000000000000000111) (= (mask!9117 thiss!1248) #b00000000000000000000000000001111) (= (mask!9117 thiss!1248) #b00000000000000000000000000011111) (= (mask!9117 thiss!1248) #b00000000000000000000000000111111) (= (mask!9117 thiss!1248) #b00000000000000000000000001111111) (= (mask!9117 thiss!1248) #b00000000000000000000000011111111) (= (mask!9117 thiss!1248) #b00000000000000000000000111111111) (= (mask!9117 thiss!1248) #b00000000000000000000001111111111) (= (mask!9117 thiss!1248) #b00000000000000000000011111111111) (= (mask!9117 thiss!1248) #b00000000000000000000111111111111) (= (mask!9117 thiss!1248) #b00000000000000000001111111111111) (= (mask!9117 thiss!1248) #b00000000000000000011111111111111) (= (mask!9117 thiss!1248) #b00000000000000000111111111111111) (= (mask!9117 thiss!1248) #b00000000000000001111111111111111) (= (mask!9117 thiss!1248) #b00000000000000011111111111111111) (= (mask!9117 thiss!1248) #b00000000000000111111111111111111) (= (mask!9117 thiss!1248) #b00000000000001111111111111111111) (= (mask!9117 thiss!1248) #b00000000000011111111111111111111) (= (mask!9117 thiss!1248) #b00000000000111111111111111111111) (= (mask!9117 thiss!1248) #b00000000001111111111111111111111) (= (mask!9117 thiss!1248) #b00000000011111111111111111111111) (= (mask!9117 thiss!1248) #b00000000111111111111111111111111) (= (mask!9117 thiss!1248) #b00000001111111111111111111111111) (= (mask!9117 thiss!1248) #b00000011111111111111111111111111) (= (mask!9117 thiss!1248) #b00000111111111111111111111111111) (= (mask!9117 thiss!1248) #b00001111111111111111111111111111) (= (mask!9117 thiss!1248) #b00011111111111111111111111111111) (= (mask!9117 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9117 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!191098 d!55985))

(declare-fun d!55987 () Bool)

(declare-fun e!125811 () Bool)

(assert (=> d!55987 e!125811))

(declare-fun res!90347 () Bool)

(assert (=> d!55987 (=> (not res!90347) (not e!125811))))

(declare-fun lt!94773 () ListLongMap!2389)

(assert (=> d!55987 (= res!90347 (contains!1329 lt!94773 (_1!1751 (tuple2!3481 key!828 v!309))))))

(declare-fun lt!94775 () List!2402)

(assert (=> d!55987 (= lt!94773 (ListLongMap!2390 lt!94775))))

(declare-fun lt!94776 () Unit!5734)

(declare-fun lt!94774 () Unit!5734)

(assert (=> d!55987 (= lt!94776 lt!94774)))

(declare-datatypes ((Option!242 0))(
  ( (Some!241 (v!4204 V!5577)) (None!240) )
))
(declare-fun getValueByKey!236 (List!2402 (_ BitVec 64)) Option!242)

(assert (=> d!55987 (= (getValueByKey!236 lt!94775 (_1!1751 (tuple2!3481 key!828 v!309))) (Some!241 (_2!1751 (tuple2!3481 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!126 (List!2402 (_ BitVec 64) V!5577) Unit!5734)

(assert (=> d!55987 (= lt!94774 (lemmaContainsTupThenGetReturnValue!126 lt!94775 (_1!1751 (tuple2!3481 key!828 v!309)) (_2!1751 (tuple2!3481 key!828 v!309))))))

(declare-fun insertStrictlySorted!129 (List!2402 (_ BitVec 64) V!5577) List!2402)

(assert (=> d!55987 (= lt!94775 (insertStrictlySorted!129 (toList!1210 lt!94719) (_1!1751 (tuple2!3481 key!828 v!309)) (_2!1751 (tuple2!3481 key!828 v!309))))))

(assert (=> d!55987 (= (+!302 lt!94719 (tuple2!3481 key!828 v!309)) lt!94773)))

(declare-fun b!191186 () Bool)

(declare-fun res!90346 () Bool)

(assert (=> b!191186 (=> (not res!90346) (not e!125811))))

(assert (=> b!191186 (= res!90346 (= (getValueByKey!236 (toList!1210 lt!94773) (_1!1751 (tuple2!3481 key!828 v!309))) (Some!241 (_2!1751 (tuple2!3481 key!828 v!309)))))))

(declare-fun b!191187 () Bool)

(declare-fun contains!1331 (List!2402 tuple2!3480) Bool)

(assert (=> b!191187 (= e!125811 (contains!1331 (toList!1210 lt!94773) (tuple2!3481 key!828 v!309)))))

(assert (= (and d!55987 res!90347) b!191186))

(assert (= (and b!191186 res!90346) b!191187))

(declare-fun m!217311 () Bool)

(assert (=> d!55987 m!217311))

(declare-fun m!217313 () Bool)

(assert (=> d!55987 m!217313))

(declare-fun m!217315 () Bool)

(assert (=> d!55987 m!217315))

(declare-fun m!217317 () Bool)

(assert (=> d!55987 m!217317))

(declare-fun m!217319 () Bool)

(assert (=> b!191186 m!217319))

(declare-fun m!217321 () Bool)

(assert (=> b!191187 m!217321))

(assert (=> b!191098 d!55987))

(declare-fun d!55989 () Bool)

(declare-fun e!125817 () Bool)

(assert (=> d!55989 e!125817))

(declare-fun res!90350 () Bool)

(assert (=> d!55989 (=> res!90350 e!125817)))

(declare-fun lt!94787 () Bool)

(assert (=> d!55989 (= res!90350 (not lt!94787))))

(declare-fun lt!94785 () Bool)

(assert (=> d!55989 (= lt!94787 lt!94785)))

(declare-fun lt!94786 () Unit!5734)

(declare-fun e!125816 () Unit!5734)

(assert (=> d!55989 (= lt!94786 e!125816)))

(declare-fun c!34410 () Bool)

(assert (=> d!55989 (= c!34410 lt!94785)))

(declare-fun containsKey!240 (List!2402 (_ BitVec 64)) Bool)

(assert (=> d!55989 (= lt!94785 (containsKey!240 (toList!1210 lt!94719) key!828))))

(assert (=> d!55989 (= (contains!1329 lt!94719 key!828) lt!94787)))

(declare-fun b!191194 () Bool)

(declare-fun lt!94788 () Unit!5734)

(assert (=> b!191194 (= e!125816 lt!94788)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!189 (List!2402 (_ BitVec 64)) Unit!5734)

(assert (=> b!191194 (= lt!94788 (lemmaContainsKeyImpliesGetValueByKeyDefined!189 (toList!1210 lt!94719) key!828))))

(declare-fun isDefined!190 (Option!242) Bool)

(assert (=> b!191194 (isDefined!190 (getValueByKey!236 (toList!1210 lt!94719) key!828))))

(declare-fun b!191195 () Bool)

(declare-fun Unit!5740 () Unit!5734)

(assert (=> b!191195 (= e!125816 Unit!5740)))

(declare-fun b!191196 () Bool)

(assert (=> b!191196 (= e!125817 (isDefined!190 (getValueByKey!236 (toList!1210 lt!94719) key!828)))))

(assert (= (and d!55989 c!34410) b!191194))

(assert (= (and d!55989 (not c!34410)) b!191195))

(assert (= (and d!55989 (not res!90350)) b!191196))

(declare-fun m!217323 () Bool)

(assert (=> d!55989 m!217323))

(declare-fun m!217325 () Bool)

(assert (=> b!191194 m!217325))

(declare-fun m!217327 () Bool)

(assert (=> b!191194 m!217327))

(assert (=> b!191194 m!217327))

(declare-fun m!217329 () Bool)

(assert (=> b!191194 m!217329))

(assert (=> b!191196 m!217327))

(assert (=> b!191196 m!217327))

(assert (=> b!191196 m!217329))

(assert (=> b!191098 d!55989))

(declare-fun b!191239 () Bool)

(declare-fun e!125855 () Bool)

(declare-fun lt!94844 () ListLongMap!2389)

(declare-fun apply!181 (ListLongMap!2389 (_ BitVec 64)) V!5577)

(assert (=> b!191239 (= e!125855 (= (apply!181 lt!94844 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3743 thiss!1248)))))

(declare-fun b!191241 () Bool)

(declare-fun res!90373 () Bool)

(declare-fun e!125847 () Bool)

(assert (=> b!191241 (=> (not res!90373) (not e!125847))))

(declare-fun e!125844 () Bool)

(assert (=> b!191241 (= res!90373 e!125844)))

(declare-fun res!90377 () Bool)

(assert (=> b!191241 (=> res!90377 e!125844)))

(declare-fun e!125856 () Bool)

(assert (=> b!191241 (= res!90377 (not e!125856))))

(declare-fun res!90370 () Bool)

(assert (=> b!191241 (=> (not res!90370) (not e!125856))))

(assert (=> b!191241 (= res!90370 (bvslt #b00000000000000000000000000000000 (size!4143 (_keys!5878 thiss!1248))))))

(declare-fun bm!19282 () Bool)

(declare-fun call!19290 () ListLongMap!2389)

(declare-fun getCurrentListMapNoExtraKeys!202 (array!8111 array!8113 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 32) Int) ListLongMap!2389)

(assert (=> bm!19282 (= call!19290 (getCurrentListMapNoExtraKeys!202 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun bm!19283 () Bool)

(declare-fun call!19288 () Bool)

(assert (=> bm!19283 (= call!19288 (contains!1329 lt!94844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19284 () Bool)

(declare-fun call!19289 () ListLongMap!2389)

(declare-fun call!19285 () ListLongMap!2389)

(assert (=> bm!19284 (= call!19289 call!19285)))

(declare-fun b!191242 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!191242 (= e!125856 (validKeyInArray!0 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191243 () Bool)

(declare-fun e!125850 () Bool)

(assert (=> b!191243 (= e!125850 (not call!19288))))

(declare-fun b!191244 () Bool)

(declare-fun e!125854 () ListLongMap!2389)

(declare-fun e!125846 () ListLongMap!2389)

(assert (=> b!191244 (= e!125854 e!125846)))

(declare-fun c!34423 () Bool)

(assert (=> b!191244 (= c!34423 (and (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!191245 () Bool)

(declare-fun call!19286 () ListLongMap!2389)

(assert (=> b!191245 (= e!125846 call!19286)))

(declare-fun b!191246 () Bool)

(declare-fun call!19291 () ListLongMap!2389)

(assert (=> b!191246 (= e!125854 (+!302 call!19291 (tuple2!3481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3743 thiss!1248))))))

(declare-fun c!34426 () Bool)

(declare-fun bm!19285 () Bool)

(assert (=> bm!19285 (= call!19291 (+!302 (ite c!34426 call!19290 (ite c!34423 call!19285 call!19289)) (ite (or c!34426 c!34423) (tuple2!3481 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3743 thiss!1248)) (tuple2!3481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3743 thiss!1248)))))))

(declare-fun bm!19286 () Bool)

(assert (=> bm!19286 (= call!19285 call!19290)))

(declare-fun b!191247 () Bool)

(declare-fun e!125848 () Bool)

(assert (=> b!191247 (= e!125848 e!125855)))

(declare-fun res!90372 () Bool)

(declare-fun call!19287 () Bool)

(assert (=> b!191247 (= res!90372 call!19287)))

(assert (=> b!191247 (=> (not res!90372) (not e!125855))))

(declare-fun b!191248 () Bool)

(declare-fun e!125845 () Unit!5734)

(declare-fun lt!94834 () Unit!5734)

(assert (=> b!191248 (= e!125845 lt!94834)))

(declare-fun lt!94850 () ListLongMap!2389)

(assert (=> b!191248 (= lt!94850 (getCurrentListMapNoExtraKeys!202 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!94838 () (_ BitVec 64))

(assert (=> b!191248 (= lt!94838 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94833 () (_ BitVec 64))

(assert (=> b!191248 (= lt!94833 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94851 () Unit!5734)

(declare-fun addStillContains!157 (ListLongMap!2389 (_ BitVec 64) V!5577 (_ BitVec 64)) Unit!5734)

(assert (=> b!191248 (= lt!94851 (addStillContains!157 lt!94850 lt!94838 (zeroValue!3743 thiss!1248) lt!94833))))

(assert (=> b!191248 (contains!1329 (+!302 lt!94850 (tuple2!3481 lt!94838 (zeroValue!3743 thiss!1248))) lt!94833)))

(declare-fun lt!94848 () Unit!5734)

(assert (=> b!191248 (= lt!94848 lt!94851)))

(declare-fun lt!94852 () ListLongMap!2389)

(assert (=> b!191248 (= lt!94852 (getCurrentListMapNoExtraKeys!202 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!94849 () (_ BitVec 64))

(assert (=> b!191248 (= lt!94849 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94841 () (_ BitVec 64))

(assert (=> b!191248 (= lt!94841 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94835 () Unit!5734)

(declare-fun addApplyDifferent!157 (ListLongMap!2389 (_ BitVec 64) V!5577 (_ BitVec 64)) Unit!5734)

(assert (=> b!191248 (= lt!94835 (addApplyDifferent!157 lt!94852 lt!94849 (minValue!3743 thiss!1248) lt!94841))))

(assert (=> b!191248 (= (apply!181 (+!302 lt!94852 (tuple2!3481 lt!94849 (minValue!3743 thiss!1248))) lt!94841) (apply!181 lt!94852 lt!94841))))

(declare-fun lt!94843 () Unit!5734)

(assert (=> b!191248 (= lt!94843 lt!94835)))

(declare-fun lt!94854 () ListLongMap!2389)

(assert (=> b!191248 (= lt!94854 (getCurrentListMapNoExtraKeys!202 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!94842 () (_ BitVec 64))

(assert (=> b!191248 (= lt!94842 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94837 () (_ BitVec 64))

(assert (=> b!191248 (= lt!94837 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94845 () Unit!5734)

(assert (=> b!191248 (= lt!94845 (addApplyDifferent!157 lt!94854 lt!94842 (zeroValue!3743 thiss!1248) lt!94837))))

(assert (=> b!191248 (= (apply!181 (+!302 lt!94854 (tuple2!3481 lt!94842 (zeroValue!3743 thiss!1248))) lt!94837) (apply!181 lt!94854 lt!94837))))

(declare-fun lt!94839 () Unit!5734)

(assert (=> b!191248 (= lt!94839 lt!94845)))

(declare-fun lt!94846 () ListLongMap!2389)

(assert (=> b!191248 (= lt!94846 (getCurrentListMapNoExtraKeys!202 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!94836 () (_ BitVec 64))

(assert (=> b!191248 (= lt!94836 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94847 () (_ BitVec 64))

(assert (=> b!191248 (= lt!94847 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191248 (= lt!94834 (addApplyDifferent!157 lt!94846 lt!94836 (minValue!3743 thiss!1248) lt!94847))))

(assert (=> b!191248 (= (apply!181 (+!302 lt!94846 (tuple2!3481 lt!94836 (minValue!3743 thiss!1248))) lt!94847) (apply!181 lt!94846 lt!94847))))

(declare-fun b!191240 () Bool)

(declare-fun e!125849 () Bool)

(assert (=> b!191240 (= e!125850 e!125849)))

(declare-fun res!90375 () Bool)

(assert (=> b!191240 (= res!90375 call!19288)))

(assert (=> b!191240 (=> (not res!90375) (not e!125849))))

(declare-fun d!55991 () Bool)

(assert (=> d!55991 e!125847))

(declare-fun res!90371 () Bool)

(assert (=> d!55991 (=> (not res!90371) (not e!125847))))

(assert (=> d!55991 (= res!90371 (or (bvsge #b00000000000000000000000000000000 (size!4143 (_keys!5878 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4143 (_keys!5878 thiss!1248))))))))

(declare-fun lt!94853 () ListLongMap!2389)

(assert (=> d!55991 (= lt!94844 lt!94853)))

(declare-fun lt!94840 () Unit!5734)

(assert (=> d!55991 (= lt!94840 e!125845)))

(declare-fun c!34428 () Bool)

(declare-fun e!125851 () Bool)

(assert (=> d!55991 (= c!34428 e!125851)))

(declare-fun res!90369 () Bool)

(assert (=> d!55991 (=> (not res!90369) (not e!125851))))

(assert (=> d!55991 (= res!90369 (bvslt #b00000000000000000000000000000000 (size!4143 (_keys!5878 thiss!1248))))))

(assert (=> d!55991 (= lt!94853 e!125854)))

(assert (=> d!55991 (= c!34426 (and (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55991 (validMask!0 (mask!9117 thiss!1248))))

(assert (=> d!55991 (= (getCurrentListMap!843 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)) lt!94844)))

(declare-fun b!191249 () Bool)

(declare-fun Unit!5741 () Unit!5734)

(assert (=> b!191249 (= e!125845 Unit!5741)))

(declare-fun bm!19287 () Bool)

(assert (=> bm!19287 (= call!19286 call!19291)))

(declare-fun b!191250 () Bool)

(assert (=> b!191250 (= e!125849 (= (apply!181 lt!94844 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3743 thiss!1248)))))

(declare-fun b!191251 () Bool)

(declare-fun e!125852 () ListLongMap!2389)

(assert (=> b!191251 (= e!125852 call!19289)))

(declare-fun b!191252 () Bool)

(assert (=> b!191252 (= e!125852 call!19286)))

(declare-fun b!191253 () Bool)

(declare-fun e!125853 () Bool)

(declare-fun get!2204 (ValueCell!1880 V!5577) V!5577)

(declare-fun dynLambda!515 (Int (_ BitVec 64)) V!5577)

(assert (=> b!191253 (= e!125853 (= (apply!181 lt!94844 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000)) (get!2204 (select (arr!3821 (_values!3885 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3902 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!191253 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4144 (_values!3885 thiss!1248))))))

(assert (=> b!191253 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4143 (_keys!5878 thiss!1248))))))

(declare-fun b!191254 () Bool)

(assert (=> b!191254 (= e!125851 (validKeyInArray!0 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191255 () Bool)

(assert (=> b!191255 (= e!125848 (not call!19287))))

(declare-fun b!191256 () Bool)

(declare-fun res!90374 () Bool)

(assert (=> b!191256 (=> (not res!90374) (not e!125847))))

(assert (=> b!191256 (= res!90374 e!125850)))

(declare-fun c!34427 () Bool)

(assert (=> b!191256 (= c!34427 (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!191257 () Bool)

(declare-fun c!34424 () Bool)

(assert (=> b!191257 (= c!34424 (and (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!191257 (= e!125846 e!125852)))

(declare-fun b!191258 () Bool)

(assert (=> b!191258 (= e!125847 e!125848)))

(declare-fun c!34425 () Bool)

(assert (=> b!191258 (= c!34425 (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19288 () Bool)

(assert (=> bm!19288 (= call!19287 (contains!1329 lt!94844 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191259 () Bool)

(assert (=> b!191259 (= e!125844 e!125853)))

(declare-fun res!90376 () Bool)

(assert (=> b!191259 (=> (not res!90376) (not e!125853))))

(assert (=> b!191259 (= res!90376 (contains!1329 lt!94844 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191259 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4143 (_keys!5878 thiss!1248))))))

(assert (= (and d!55991 c!34426) b!191246))

(assert (= (and d!55991 (not c!34426)) b!191244))

(assert (= (and b!191244 c!34423) b!191245))

(assert (= (and b!191244 (not c!34423)) b!191257))

(assert (= (and b!191257 c!34424) b!191252))

(assert (= (and b!191257 (not c!34424)) b!191251))

(assert (= (or b!191252 b!191251) bm!19284))

(assert (= (or b!191245 bm!19284) bm!19286))

(assert (= (or b!191245 b!191252) bm!19287))

(assert (= (or b!191246 bm!19286) bm!19282))

(assert (= (or b!191246 bm!19287) bm!19285))

(assert (= (and d!55991 res!90369) b!191254))

(assert (= (and d!55991 c!34428) b!191248))

(assert (= (and d!55991 (not c!34428)) b!191249))

(assert (= (and d!55991 res!90371) b!191241))

(assert (= (and b!191241 res!90370) b!191242))

(assert (= (and b!191241 (not res!90377)) b!191259))

(assert (= (and b!191259 res!90376) b!191253))

(assert (= (and b!191241 res!90373) b!191256))

(assert (= (and b!191256 c!34427) b!191240))

(assert (= (and b!191256 (not c!34427)) b!191243))

(assert (= (and b!191240 res!90375) b!191250))

(assert (= (or b!191240 b!191243) bm!19283))

(assert (= (and b!191256 res!90374) b!191258))

(assert (= (and b!191258 c!34425) b!191247))

(assert (= (and b!191258 (not c!34425)) b!191255))

(assert (= (and b!191247 res!90372) b!191239))

(assert (= (or b!191247 b!191255) bm!19288))

(declare-fun b_lambda!7373 () Bool)

(assert (=> (not b_lambda!7373) (not b!191253)))

(declare-fun t!7308 () Bool)

(declare-fun tb!2865 () Bool)

(assert (=> (and b!191094 (= (defaultEntry!3902 thiss!1248) (defaultEntry!3902 thiss!1248)) t!7308) tb!2865))

(declare-fun result!4889 () Bool)

(assert (=> tb!2865 (= result!4889 tp_is_empty!4447)))

(assert (=> b!191253 t!7308))

(declare-fun b_and!11325 () Bool)

(assert (= b_and!11319 (and (=> t!7308 result!4889) b_and!11325)))

(declare-fun m!217331 () Bool)

(assert (=> b!191239 m!217331))

(declare-fun m!217333 () Bool)

(assert (=> bm!19282 m!217333))

(declare-fun m!217335 () Bool)

(assert (=> b!191246 m!217335))

(declare-fun m!217337 () Bool)

(assert (=> bm!19285 m!217337))

(declare-fun m!217339 () Bool)

(assert (=> b!191248 m!217339))

(declare-fun m!217341 () Bool)

(assert (=> b!191248 m!217341))

(declare-fun m!217343 () Bool)

(assert (=> b!191248 m!217343))

(declare-fun m!217345 () Bool)

(assert (=> b!191248 m!217345))

(declare-fun m!217347 () Bool)

(assert (=> b!191248 m!217347))

(declare-fun m!217349 () Bool)

(assert (=> b!191248 m!217349))

(declare-fun m!217351 () Bool)

(assert (=> b!191248 m!217351))

(declare-fun m!217353 () Bool)

(assert (=> b!191248 m!217353))

(declare-fun m!217355 () Bool)

(assert (=> b!191248 m!217355))

(assert (=> b!191248 m!217333))

(declare-fun m!217357 () Bool)

(assert (=> b!191248 m!217357))

(declare-fun m!217359 () Bool)

(assert (=> b!191248 m!217359))

(declare-fun m!217361 () Bool)

(assert (=> b!191248 m!217361))

(assert (=> b!191248 m!217355))

(declare-fun m!217363 () Bool)

(assert (=> b!191248 m!217363))

(declare-fun m!217365 () Bool)

(assert (=> b!191248 m!217365))

(assert (=> b!191248 m!217345))

(assert (=> b!191248 m!217357))

(declare-fun m!217367 () Bool)

(assert (=> b!191248 m!217367))

(assert (=> b!191248 m!217351))

(declare-fun m!217369 () Bool)

(assert (=> b!191248 m!217369))

(declare-fun m!217371 () Bool)

(assert (=> bm!19288 m!217371))

(assert (=> d!55991 m!217219))

(declare-fun m!217373 () Bool)

(assert (=> b!191253 m!217373))

(assert (=> b!191253 m!217341))

(declare-fun m!217375 () Bool)

(assert (=> b!191253 m!217375))

(assert (=> b!191253 m!217373))

(declare-fun m!217377 () Bool)

(assert (=> b!191253 m!217377))

(assert (=> b!191253 m!217341))

(declare-fun m!217379 () Bool)

(assert (=> b!191253 m!217379))

(assert (=> b!191253 m!217375))

(assert (=> b!191259 m!217341))

(assert (=> b!191259 m!217341))

(declare-fun m!217381 () Bool)

(assert (=> b!191259 m!217381))

(assert (=> b!191254 m!217341))

(assert (=> b!191254 m!217341))

(declare-fun m!217383 () Bool)

(assert (=> b!191254 m!217383))

(declare-fun m!217385 () Bool)

(assert (=> b!191250 m!217385))

(assert (=> b!191242 m!217341))

(assert (=> b!191242 m!217341))

(assert (=> b!191242 m!217383))

(declare-fun m!217387 () Bool)

(assert (=> bm!19283 m!217387))

(assert (=> b!191098 d!55991))

(declare-fun b!191262 () Bool)

(declare-fun e!125868 () Bool)

(declare-fun lt!94866 () ListLongMap!2389)

(assert (=> b!191262 (= e!125868 (= (apply!181 lt!94866 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3743 thiss!1248)))))

(declare-fun b!191264 () Bool)

(declare-fun res!90382 () Bool)

(declare-fun e!125860 () Bool)

(assert (=> b!191264 (=> (not res!90382) (not e!125860))))

(declare-fun e!125857 () Bool)

(assert (=> b!191264 (= res!90382 e!125857)))

(declare-fun res!90386 () Bool)

(assert (=> b!191264 (=> res!90386 e!125857)))

(declare-fun e!125869 () Bool)

(assert (=> b!191264 (= res!90386 (not e!125869))))

(declare-fun res!90379 () Bool)

(assert (=> b!191264 (=> (not res!90379) (not e!125869))))

(assert (=> b!191264 (= res!90379 (bvslt #b00000000000000000000000000000000 (size!4143 (_keys!5878 thiss!1248))))))

(declare-fun bm!19289 () Bool)

(declare-fun call!19297 () ListLongMap!2389)

(assert (=> bm!19289 (= call!19297 (getCurrentListMapNoExtraKeys!202 (_keys!5878 thiss!1248) (array!8114 (store (arr!3821 (_values!3885 thiss!1248)) (index!4887 lt!94721) (ValueCellFull!1880 v!309)) (size!4144 (_values!3885 thiss!1248))) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun bm!19290 () Bool)

(declare-fun call!19295 () Bool)

(assert (=> bm!19290 (= call!19295 (contains!1329 lt!94866 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19291 () Bool)

(declare-fun call!19296 () ListLongMap!2389)

(declare-fun call!19292 () ListLongMap!2389)

(assert (=> bm!19291 (= call!19296 call!19292)))

(declare-fun b!191265 () Bool)

(assert (=> b!191265 (= e!125869 (validKeyInArray!0 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191266 () Bool)

(declare-fun e!125863 () Bool)

(assert (=> b!191266 (= e!125863 (not call!19295))))

(declare-fun b!191267 () Bool)

(declare-fun e!125867 () ListLongMap!2389)

(declare-fun e!125859 () ListLongMap!2389)

(assert (=> b!191267 (= e!125867 e!125859)))

(declare-fun c!34429 () Bool)

(assert (=> b!191267 (= c!34429 (and (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!191268 () Bool)

(declare-fun call!19293 () ListLongMap!2389)

(assert (=> b!191268 (= e!125859 call!19293)))

(declare-fun b!191269 () Bool)

(declare-fun call!19298 () ListLongMap!2389)

(assert (=> b!191269 (= e!125867 (+!302 call!19298 (tuple2!3481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3743 thiss!1248))))))

(declare-fun bm!19292 () Bool)

(declare-fun c!34432 () Bool)

(assert (=> bm!19292 (= call!19298 (+!302 (ite c!34432 call!19297 (ite c!34429 call!19292 call!19296)) (ite (or c!34432 c!34429) (tuple2!3481 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3743 thiss!1248)) (tuple2!3481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3743 thiss!1248)))))))

(declare-fun bm!19293 () Bool)

(assert (=> bm!19293 (= call!19292 call!19297)))

(declare-fun b!191270 () Bool)

(declare-fun e!125861 () Bool)

(assert (=> b!191270 (= e!125861 e!125868)))

(declare-fun res!90381 () Bool)

(declare-fun call!19294 () Bool)

(assert (=> b!191270 (= res!90381 call!19294)))

(assert (=> b!191270 (=> (not res!90381) (not e!125868))))

(declare-fun b!191271 () Bool)

(declare-fun e!125858 () Unit!5734)

(declare-fun lt!94856 () Unit!5734)

(assert (=> b!191271 (= e!125858 lt!94856)))

(declare-fun lt!94872 () ListLongMap!2389)

(assert (=> b!191271 (= lt!94872 (getCurrentListMapNoExtraKeys!202 (_keys!5878 thiss!1248) (array!8114 (store (arr!3821 (_values!3885 thiss!1248)) (index!4887 lt!94721) (ValueCellFull!1880 v!309)) (size!4144 (_values!3885 thiss!1248))) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!94860 () (_ BitVec 64))

(assert (=> b!191271 (= lt!94860 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94855 () (_ BitVec 64))

(assert (=> b!191271 (= lt!94855 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94873 () Unit!5734)

(assert (=> b!191271 (= lt!94873 (addStillContains!157 lt!94872 lt!94860 (zeroValue!3743 thiss!1248) lt!94855))))

(assert (=> b!191271 (contains!1329 (+!302 lt!94872 (tuple2!3481 lt!94860 (zeroValue!3743 thiss!1248))) lt!94855)))

(declare-fun lt!94870 () Unit!5734)

(assert (=> b!191271 (= lt!94870 lt!94873)))

(declare-fun lt!94874 () ListLongMap!2389)

(assert (=> b!191271 (= lt!94874 (getCurrentListMapNoExtraKeys!202 (_keys!5878 thiss!1248) (array!8114 (store (arr!3821 (_values!3885 thiss!1248)) (index!4887 lt!94721) (ValueCellFull!1880 v!309)) (size!4144 (_values!3885 thiss!1248))) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!94871 () (_ BitVec 64))

(assert (=> b!191271 (= lt!94871 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94863 () (_ BitVec 64))

(assert (=> b!191271 (= lt!94863 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94857 () Unit!5734)

(assert (=> b!191271 (= lt!94857 (addApplyDifferent!157 lt!94874 lt!94871 (minValue!3743 thiss!1248) lt!94863))))

(assert (=> b!191271 (= (apply!181 (+!302 lt!94874 (tuple2!3481 lt!94871 (minValue!3743 thiss!1248))) lt!94863) (apply!181 lt!94874 lt!94863))))

(declare-fun lt!94865 () Unit!5734)

(assert (=> b!191271 (= lt!94865 lt!94857)))

(declare-fun lt!94876 () ListLongMap!2389)

(assert (=> b!191271 (= lt!94876 (getCurrentListMapNoExtraKeys!202 (_keys!5878 thiss!1248) (array!8114 (store (arr!3821 (_values!3885 thiss!1248)) (index!4887 lt!94721) (ValueCellFull!1880 v!309)) (size!4144 (_values!3885 thiss!1248))) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!94864 () (_ BitVec 64))

(assert (=> b!191271 (= lt!94864 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94859 () (_ BitVec 64))

(assert (=> b!191271 (= lt!94859 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94867 () Unit!5734)

(assert (=> b!191271 (= lt!94867 (addApplyDifferent!157 lt!94876 lt!94864 (zeroValue!3743 thiss!1248) lt!94859))))

(assert (=> b!191271 (= (apply!181 (+!302 lt!94876 (tuple2!3481 lt!94864 (zeroValue!3743 thiss!1248))) lt!94859) (apply!181 lt!94876 lt!94859))))

(declare-fun lt!94861 () Unit!5734)

(assert (=> b!191271 (= lt!94861 lt!94867)))

(declare-fun lt!94868 () ListLongMap!2389)

(assert (=> b!191271 (= lt!94868 (getCurrentListMapNoExtraKeys!202 (_keys!5878 thiss!1248) (array!8114 (store (arr!3821 (_values!3885 thiss!1248)) (index!4887 lt!94721) (ValueCellFull!1880 v!309)) (size!4144 (_values!3885 thiss!1248))) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!94858 () (_ BitVec 64))

(assert (=> b!191271 (= lt!94858 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94869 () (_ BitVec 64))

(assert (=> b!191271 (= lt!94869 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191271 (= lt!94856 (addApplyDifferent!157 lt!94868 lt!94858 (minValue!3743 thiss!1248) lt!94869))))

(assert (=> b!191271 (= (apply!181 (+!302 lt!94868 (tuple2!3481 lt!94858 (minValue!3743 thiss!1248))) lt!94869) (apply!181 lt!94868 lt!94869))))

(declare-fun b!191263 () Bool)

(declare-fun e!125862 () Bool)

(assert (=> b!191263 (= e!125863 e!125862)))

(declare-fun res!90384 () Bool)

(assert (=> b!191263 (= res!90384 call!19295)))

(assert (=> b!191263 (=> (not res!90384) (not e!125862))))

(declare-fun d!55993 () Bool)

(assert (=> d!55993 e!125860))

(declare-fun res!90380 () Bool)

(assert (=> d!55993 (=> (not res!90380) (not e!125860))))

(assert (=> d!55993 (= res!90380 (or (bvsge #b00000000000000000000000000000000 (size!4143 (_keys!5878 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4143 (_keys!5878 thiss!1248))))))))

(declare-fun lt!94875 () ListLongMap!2389)

(assert (=> d!55993 (= lt!94866 lt!94875)))

(declare-fun lt!94862 () Unit!5734)

(assert (=> d!55993 (= lt!94862 e!125858)))

(declare-fun c!34434 () Bool)

(declare-fun e!125864 () Bool)

(assert (=> d!55993 (= c!34434 e!125864)))

(declare-fun res!90378 () Bool)

(assert (=> d!55993 (=> (not res!90378) (not e!125864))))

(assert (=> d!55993 (= res!90378 (bvslt #b00000000000000000000000000000000 (size!4143 (_keys!5878 thiss!1248))))))

(assert (=> d!55993 (= lt!94875 e!125867)))

(assert (=> d!55993 (= c!34432 (and (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55993 (validMask!0 (mask!9117 thiss!1248))))

(assert (=> d!55993 (= (getCurrentListMap!843 (_keys!5878 thiss!1248) (array!8114 (store (arr!3821 (_values!3885 thiss!1248)) (index!4887 lt!94721) (ValueCellFull!1880 v!309)) (size!4144 (_values!3885 thiss!1248))) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)) lt!94866)))

(declare-fun b!191272 () Bool)

(declare-fun Unit!5742 () Unit!5734)

(assert (=> b!191272 (= e!125858 Unit!5742)))

(declare-fun bm!19294 () Bool)

(assert (=> bm!19294 (= call!19293 call!19298)))

(declare-fun b!191273 () Bool)

(assert (=> b!191273 (= e!125862 (= (apply!181 lt!94866 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3743 thiss!1248)))))

(declare-fun b!191274 () Bool)

(declare-fun e!125865 () ListLongMap!2389)

(assert (=> b!191274 (= e!125865 call!19296)))

(declare-fun b!191275 () Bool)

(assert (=> b!191275 (= e!125865 call!19293)))

(declare-fun e!125866 () Bool)

(declare-fun b!191276 () Bool)

(assert (=> b!191276 (= e!125866 (= (apply!181 lt!94866 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000)) (get!2204 (select (arr!3821 (array!8114 (store (arr!3821 (_values!3885 thiss!1248)) (index!4887 lt!94721) (ValueCellFull!1880 v!309)) (size!4144 (_values!3885 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3902 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!191276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4144 (array!8114 (store (arr!3821 (_values!3885 thiss!1248)) (index!4887 lt!94721) (ValueCellFull!1880 v!309)) (size!4144 (_values!3885 thiss!1248))))))))

(assert (=> b!191276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4143 (_keys!5878 thiss!1248))))))

(declare-fun b!191277 () Bool)

(assert (=> b!191277 (= e!125864 (validKeyInArray!0 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191278 () Bool)

(assert (=> b!191278 (= e!125861 (not call!19294))))

(declare-fun b!191279 () Bool)

(declare-fun res!90383 () Bool)

(assert (=> b!191279 (=> (not res!90383) (not e!125860))))

(assert (=> b!191279 (= res!90383 e!125863)))

(declare-fun c!34433 () Bool)

(assert (=> b!191279 (= c!34433 (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!191280 () Bool)

(declare-fun c!34430 () Bool)

(assert (=> b!191280 (= c!34430 (and (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!191280 (= e!125859 e!125865)))

(declare-fun b!191281 () Bool)

(assert (=> b!191281 (= e!125860 e!125861)))

(declare-fun c!34431 () Bool)

(assert (=> b!191281 (= c!34431 (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19295 () Bool)

(assert (=> bm!19295 (= call!19294 (contains!1329 lt!94866 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191282 () Bool)

(assert (=> b!191282 (= e!125857 e!125866)))

(declare-fun res!90385 () Bool)

(assert (=> b!191282 (=> (not res!90385) (not e!125866))))

(assert (=> b!191282 (= res!90385 (contains!1329 lt!94866 (select (arr!3820 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191282 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4143 (_keys!5878 thiss!1248))))))

(assert (= (and d!55993 c!34432) b!191269))

(assert (= (and d!55993 (not c!34432)) b!191267))

(assert (= (and b!191267 c!34429) b!191268))

(assert (= (and b!191267 (not c!34429)) b!191280))

(assert (= (and b!191280 c!34430) b!191275))

(assert (= (and b!191280 (not c!34430)) b!191274))

(assert (= (or b!191275 b!191274) bm!19291))

(assert (= (or b!191268 bm!19291) bm!19293))

(assert (= (or b!191268 b!191275) bm!19294))

(assert (= (or b!191269 bm!19293) bm!19289))

(assert (= (or b!191269 bm!19294) bm!19292))

(assert (= (and d!55993 res!90378) b!191277))

(assert (= (and d!55993 c!34434) b!191271))

(assert (= (and d!55993 (not c!34434)) b!191272))

(assert (= (and d!55993 res!90380) b!191264))

(assert (= (and b!191264 res!90379) b!191265))

(assert (= (and b!191264 (not res!90386)) b!191282))

(assert (= (and b!191282 res!90385) b!191276))

(assert (= (and b!191264 res!90382) b!191279))

(assert (= (and b!191279 c!34433) b!191263))

(assert (= (and b!191279 (not c!34433)) b!191266))

(assert (= (and b!191263 res!90384) b!191273))

(assert (= (or b!191263 b!191266) bm!19290))

(assert (= (and b!191279 res!90383) b!191281))

(assert (= (and b!191281 c!34431) b!191270))

(assert (= (and b!191281 (not c!34431)) b!191278))

(assert (= (and b!191270 res!90381) b!191262))

(assert (= (or b!191270 b!191278) bm!19295))

(declare-fun b_lambda!7375 () Bool)

(assert (=> (not b_lambda!7375) (not b!191276)))

(assert (=> b!191276 t!7308))

(declare-fun b_and!11327 () Bool)

(assert (= b_and!11325 (and (=> t!7308 result!4889) b_and!11327)))

(declare-fun m!217389 () Bool)

(assert (=> b!191262 m!217389))

(declare-fun m!217391 () Bool)

(assert (=> bm!19289 m!217391))

(declare-fun m!217393 () Bool)

(assert (=> b!191269 m!217393))

(declare-fun m!217395 () Bool)

(assert (=> bm!19292 m!217395))

(declare-fun m!217397 () Bool)

(assert (=> b!191271 m!217397))

(assert (=> b!191271 m!217341))

(declare-fun m!217399 () Bool)

(assert (=> b!191271 m!217399))

(declare-fun m!217401 () Bool)

(assert (=> b!191271 m!217401))

(declare-fun m!217403 () Bool)

(assert (=> b!191271 m!217403))

(declare-fun m!217405 () Bool)

(assert (=> b!191271 m!217405))

(declare-fun m!217407 () Bool)

(assert (=> b!191271 m!217407))

(declare-fun m!217409 () Bool)

(assert (=> b!191271 m!217409))

(declare-fun m!217411 () Bool)

(assert (=> b!191271 m!217411))

(assert (=> b!191271 m!217391))

(declare-fun m!217413 () Bool)

(assert (=> b!191271 m!217413))

(declare-fun m!217415 () Bool)

(assert (=> b!191271 m!217415))

(declare-fun m!217417 () Bool)

(assert (=> b!191271 m!217417))

(assert (=> b!191271 m!217411))

(declare-fun m!217419 () Bool)

(assert (=> b!191271 m!217419))

(declare-fun m!217421 () Bool)

(assert (=> b!191271 m!217421))

(assert (=> b!191271 m!217401))

(assert (=> b!191271 m!217413))

(declare-fun m!217423 () Bool)

(assert (=> b!191271 m!217423))

(assert (=> b!191271 m!217407))

(declare-fun m!217425 () Bool)

(assert (=> b!191271 m!217425))

(declare-fun m!217427 () Bool)

(assert (=> bm!19295 m!217427))

(assert (=> d!55993 m!217219))

(assert (=> b!191276 m!217373))

(assert (=> b!191276 m!217341))

(declare-fun m!217429 () Bool)

(assert (=> b!191276 m!217429))

(assert (=> b!191276 m!217373))

(declare-fun m!217431 () Bool)

(assert (=> b!191276 m!217431))

(assert (=> b!191276 m!217341))

(declare-fun m!217433 () Bool)

(assert (=> b!191276 m!217433))

(assert (=> b!191276 m!217429))

(assert (=> b!191282 m!217341))

(assert (=> b!191282 m!217341))

(declare-fun m!217435 () Bool)

(assert (=> b!191282 m!217435))

(assert (=> b!191277 m!217341))

(assert (=> b!191277 m!217341))

(assert (=> b!191277 m!217383))

(declare-fun m!217437 () Bool)

(assert (=> b!191273 m!217437))

(assert (=> b!191265 m!217341))

(assert (=> b!191265 m!217341))

(assert (=> b!191265 m!217383))

(declare-fun m!217439 () Bool)

(assert (=> bm!19290 m!217439))

(assert (=> b!191098 d!55993))

(declare-fun d!55995 () Bool)

(declare-fun e!125872 () Bool)

(assert (=> d!55995 e!125872))

(declare-fun res!90389 () Bool)

(assert (=> d!55995 (=> (not res!90389) (not e!125872))))

(assert (=> d!55995 (= res!90389 (and (bvsge (index!4887 lt!94721) #b00000000000000000000000000000000) (bvslt (index!4887 lt!94721) (size!4144 (_values!3885 thiss!1248)))))))

(declare-fun lt!94879 () Unit!5734)

(declare-fun choose!1042 (array!8111 array!8113 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 32) (_ BitVec 64) V!5577 Int) Unit!5734)

(assert (=> d!55995 (= lt!94879 (choose!1042 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) (index!4887 lt!94721) key!828 v!309 (defaultEntry!3902 thiss!1248)))))

(assert (=> d!55995 (validMask!0 (mask!9117 thiss!1248))))

(assert (=> d!55995 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!118 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) (index!4887 lt!94721) key!828 v!309 (defaultEntry!3902 thiss!1248)) lt!94879)))

(declare-fun b!191285 () Bool)

(assert (=> b!191285 (= e!125872 (= (+!302 (getCurrentListMap!843 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)) (tuple2!3481 key!828 v!309)) (getCurrentListMap!843 (_keys!5878 thiss!1248) (array!8114 (store (arr!3821 (_values!3885 thiss!1248)) (index!4887 lt!94721) (ValueCellFull!1880 v!309)) (size!4144 (_values!3885 thiss!1248))) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248))))))

(assert (= (and d!55995 res!90389) b!191285))

(declare-fun m!217441 () Bool)

(assert (=> d!55995 m!217441))

(assert (=> d!55995 m!217219))

(assert (=> b!191285 m!217209))

(assert (=> b!191285 m!217209))

(declare-fun m!217443 () Bool)

(assert (=> b!191285 m!217443))

(assert (=> b!191285 m!217215))

(assert (=> b!191285 m!217217))

(assert (=> b!191098 d!55995))

(declare-fun d!55997 () Bool)

(declare-fun lt!94887 () SeekEntryResult!679)

(assert (=> d!55997 (and (or ((_ is Undefined!679) lt!94887) (not ((_ is Found!679) lt!94887)) (and (bvsge (index!4887 lt!94887) #b00000000000000000000000000000000) (bvslt (index!4887 lt!94887) (size!4143 (_keys!5878 thiss!1248))))) (or ((_ is Undefined!679) lt!94887) ((_ is Found!679) lt!94887) (not ((_ is MissingZero!679) lt!94887)) (and (bvsge (index!4886 lt!94887) #b00000000000000000000000000000000) (bvslt (index!4886 lt!94887) (size!4143 (_keys!5878 thiss!1248))))) (or ((_ is Undefined!679) lt!94887) ((_ is Found!679) lt!94887) ((_ is MissingZero!679) lt!94887) (not ((_ is MissingVacant!679) lt!94887)) (and (bvsge (index!4889 lt!94887) #b00000000000000000000000000000000) (bvslt (index!4889 lt!94887) (size!4143 (_keys!5878 thiss!1248))))) (or ((_ is Undefined!679) lt!94887) (ite ((_ is Found!679) lt!94887) (= (select (arr!3820 (_keys!5878 thiss!1248)) (index!4887 lt!94887)) key!828) (ite ((_ is MissingZero!679) lt!94887) (= (select (arr!3820 (_keys!5878 thiss!1248)) (index!4886 lt!94887)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!679) lt!94887) (= (select (arr!3820 (_keys!5878 thiss!1248)) (index!4889 lt!94887)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!125880 () SeekEntryResult!679)

(assert (=> d!55997 (= lt!94887 e!125880)))

(declare-fun c!34442 () Bool)

(declare-fun lt!94888 () SeekEntryResult!679)

(assert (=> d!55997 (= c!34442 (and ((_ is Intermediate!679) lt!94888) (undefined!1491 lt!94888)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8111 (_ BitVec 32)) SeekEntryResult!679)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55997 (= lt!94888 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9117 thiss!1248)) key!828 (_keys!5878 thiss!1248) (mask!9117 thiss!1248)))))

(assert (=> d!55997 (validMask!0 (mask!9117 thiss!1248))))

(assert (=> d!55997 (= (seekEntryOrOpen!0 key!828 (_keys!5878 thiss!1248) (mask!9117 thiss!1248)) lt!94887)))

(declare-fun b!191298 () Bool)

(declare-fun e!125879 () SeekEntryResult!679)

(assert (=> b!191298 (= e!125880 e!125879)))

(declare-fun lt!94886 () (_ BitVec 64))

(assert (=> b!191298 (= lt!94886 (select (arr!3820 (_keys!5878 thiss!1248)) (index!4888 lt!94888)))))

(declare-fun c!34443 () Bool)

(assert (=> b!191298 (= c!34443 (= lt!94886 key!828))))

(declare-fun e!125881 () SeekEntryResult!679)

(declare-fun b!191299 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8111 (_ BitVec 32)) SeekEntryResult!679)

(assert (=> b!191299 (= e!125881 (seekKeyOrZeroReturnVacant!0 (x!20532 lt!94888) (index!4888 lt!94888) (index!4888 lt!94888) key!828 (_keys!5878 thiss!1248) (mask!9117 thiss!1248)))))

(declare-fun b!191300 () Bool)

(assert (=> b!191300 (= e!125879 (Found!679 (index!4888 lt!94888)))))

(declare-fun b!191301 () Bool)

(assert (=> b!191301 (= e!125880 Undefined!679)))

(declare-fun b!191302 () Bool)

(declare-fun c!34441 () Bool)

(assert (=> b!191302 (= c!34441 (= lt!94886 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191302 (= e!125879 e!125881)))

(declare-fun b!191303 () Bool)

(assert (=> b!191303 (= e!125881 (MissingZero!679 (index!4888 lt!94888)))))

(assert (= (and d!55997 c!34442) b!191301))

(assert (= (and d!55997 (not c!34442)) b!191298))

(assert (= (and b!191298 c!34443) b!191300))

(assert (= (and b!191298 (not c!34443)) b!191302))

(assert (= (and b!191302 c!34441) b!191303))

(assert (= (and b!191302 (not c!34441)) b!191299))

(declare-fun m!217445 () Bool)

(assert (=> d!55997 m!217445))

(declare-fun m!217447 () Bool)

(assert (=> d!55997 m!217447))

(declare-fun m!217449 () Bool)

(assert (=> d!55997 m!217449))

(declare-fun m!217451 () Bool)

(assert (=> d!55997 m!217451))

(assert (=> d!55997 m!217219))

(assert (=> d!55997 m!217445))

(declare-fun m!217453 () Bool)

(assert (=> d!55997 m!217453))

(declare-fun m!217455 () Bool)

(assert (=> b!191298 m!217455))

(declare-fun m!217457 () Bool)

(assert (=> b!191299 m!217457))

(assert (=> b!191092 d!55997))

(declare-fun b!191320 () Bool)

(declare-fun e!125892 () Bool)

(declare-fun lt!94894 () SeekEntryResult!679)

(assert (=> b!191320 (= e!125892 ((_ is Undefined!679) lt!94894))))

(declare-fun b!191321 () Bool)

(declare-fun e!125890 () Bool)

(declare-fun e!125893 () Bool)

(assert (=> b!191321 (= e!125890 e!125893)))

(declare-fun res!90401 () Bool)

(declare-fun call!19304 () Bool)

(assert (=> b!191321 (= res!90401 call!19304)))

(assert (=> b!191321 (=> (not res!90401) (not e!125893))))

(declare-fun b!191322 () Bool)

(assert (=> b!191322 (and (bvsge (index!4886 lt!94894) #b00000000000000000000000000000000) (bvslt (index!4886 lt!94894) (size!4143 (_keys!5878 thiss!1248))))))

(declare-fun res!90400 () Bool)

(assert (=> b!191322 (= res!90400 (= (select (arr!3820 (_keys!5878 thiss!1248)) (index!4886 lt!94894)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191322 (=> (not res!90400) (not e!125893))))

(declare-fun d!55999 () Bool)

(assert (=> d!55999 e!125890))

(declare-fun c!34448 () Bool)

(assert (=> d!55999 (= c!34448 ((_ is MissingZero!679) lt!94894))))

(assert (=> d!55999 (= lt!94894 (seekEntryOrOpen!0 key!828 (_keys!5878 thiss!1248) (mask!9117 thiss!1248)))))

(declare-fun lt!94893 () Unit!5734)

(declare-fun choose!1043 (array!8111 array!8113 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 64) Int) Unit!5734)

(assert (=> d!55999 (= lt!94893 (choose!1043 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) key!828 (defaultEntry!3902 thiss!1248)))))

(assert (=> d!55999 (validMask!0 (mask!9117 thiss!1248))))

(assert (=> d!55999 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!168 (_keys!5878 thiss!1248) (_values!3885 thiss!1248) (mask!9117 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) key!828 (defaultEntry!3902 thiss!1248)) lt!94893)))

(declare-fun bm!19300 () Bool)

(assert (=> bm!19300 (= call!19304 (inRange!0 (ite c!34448 (index!4886 lt!94894) (index!4889 lt!94894)) (mask!9117 thiss!1248)))))

(declare-fun b!191323 () Bool)

(declare-fun call!19303 () Bool)

(assert (=> b!191323 (= e!125893 (not call!19303))))

(declare-fun b!191324 () Bool)

(declare-fun res!90398 () Bool)

(declare-fun e!125891 () Bool)

(assert (=> b!191324 (=> (not res!90398) (not e!125891))))

(assert (=> b!191324 (= res!90398 (= (select (arr!3820 (_keys!5878 thiss!1248)) (index!4889 lt!94894)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191324 (and (bvsge (index!4889 lt!94894) #b00000000000000000000000000000000) (bvslt (index!4889 lt!94894) (size!4143 (_keys!5878 thiss!1248))))))

(declare-fun b!191325 () Bool)

(declare-fun res!90399 () Bool)

(assert (=> b!191325 (=> (not res!90399) (not e!125891))))

(assert (=> b!191325 (= res!90399 call!19304)))

(assert (=> b!191325 (= e!125892 e!125891)))

(declare-fun b!191326 () Bool)

(assert (=> b!191326 (= e!125891 (not call!19303))))

(declare-fun b!191327 () Bool)

(assert (=> b!191327 (= e!125890 e!125892)))

(declare-fun c!34449 () Bool)

(assert (=> b!191327 (= c!34449 ((_ is MissingVacant!679) lt!94894))))

(declare-fun bm!19301 () Bool)

(declare-fun arrayContainsKey!0 (array!8111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19301 (= call!19303 (arrayContainsKey!0 (_keys!5878 thiss!1248) key!828 #b00000000000000000000000000000000))))

(assert (= (and d!55999 c!34448) b!191321))

(assert (= (and d!55999 (not c!34448)) b!191327))

(assert (= (and b!191321 res!90401) b!191322))

(assert (= (and b!191322 res!90400) b!191323))

(assert (= (and b!191327 c!34449) b!191325))

(assert (= (and b!191327 (not c!34449)) b!191320))

(assert (= (and b!191325 res!90399) b!191324))

(assert (= (and b!191324 res!90398) b!191326))

(assert (= (or b!191321 b!191325) bm!19300))

(assert (= (or b!191323 b!191326) bm!19301))

(assert (=> d!55999 m!217221))

(declare-fun m!217459 () Bool)

(assert (=> d!55999 m!217459))

(assert (=> d!55999 m!217219))

(declare-fun m!217461 () Bool)

(assert (=> bm!19301 m!217461))

(declare-fun m!217463 () Bool)

(assert (=> bm!19300 m!217463))

(declare-fun m!217465 () Bool)

(assert (=> b!191324 m!217465))

(declare-fun m!217467 () Bool)

(assert (=> b!191322 m!217467))

(assert (=> b!191100 d!55999))

(declare-fun d!56001 () Bool)

(assert (=> d!56001 (= (array_inv!2479 (_keys!5878 thiss!1248)) (bvsge (size!4143 (_keys!5878 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191094 d!56001))

(declare-fun d!56003 () Bool)

(assert (=> d!56003 (= (array_inv!2480 (_values!3885 thiss!1248)) (bvsge (size!4144 (_values!3885 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191094 d!56003))

(declare-fun b!191334 () Bool)

(declare-fun e!125898 () Bool)

(assert (=> b!191334 (= e!125898 tp_is_empty!4447)))

(declare-fun b!191335 () Bool)

(declare-fun e!125899 () Bool)

(assert (=> b!191335 (= e!125899 tp_is_empty!4447)))

(declare-fun mapIsEmpty!7689 () Bool)

(declare-fun mapRes!7689 () Bool)

(assert (=> mapIsEmpty!7689 mapRes!7689))

(declare-fun condMapEmpty!7689 () Bool)

(declare-fun mapDefault!7689 () ValueCell!1880)

(assert (=> mapNonEmpty!7680 (= condMapEmpty!7689 (= mapRest!7680 ((as const (Array (_ BitVec 32) ValueCell!1880)) mapDefault!7689)))))

(assert (=> mapNonEmpty!7680 (= tp!16871 (and e!125899 mapRes!7689))))

(declare-fun mapNonEmpty!7689 () Bool)

(declare-fun tp!16887 () Bool)

(assert (=> mapNonEmpty!7689 (= mapRes!7689 (and tp!16887 e!125898))))

(declare-fun mapValue!7689 () ValueCell!1880)

(declare-fun mapRest!7689 () (Array (_ BitVec 32) ValueCell!1880))

(declare-fun mapKey!7689 () (_ BitVec 32))

(assert (=> mapNonEmpty!7689 (= mapRest!7680 (store mapRest!7689 mapKey!7689 mapValue!7689))))

(assert (= (and mapNonEmpty!7680 condMapEmpty!7689) mapIsEmpty!7689))

(assert (= (and mapNonEmpty!7680 (not condMapEmpty!7689)) mapNonEmpty!7689))

(assert (= (and mapNonEmpty!7689 ((_ is ValueCellFull!1880) mapValue!7689)) b!191334))

(assert (= (and mapNonEmpty!7680 ((_ is ValueCellFull!1880) mapDefault!7689)) b!191335))

(declare-fun m!217469 () Bool)

(assert (=> mapNonEmpty!7689 m!217469))

(declare-fun b_lambda!7377 () Bool)

(assert (= b_lambda!7375 (or (and b!191094 b_free!4675) b_lambda!7377)))

(declare-fun b_lambda!7379 () Bool)

(assert (= b_lambda!7373 (or (and b!191094 b_free!4675) b_lambda!7379)))

(check-sat (not b!191179) b_and!11327 (not b_next!4675) (not b!191265) (not b!191285) (not bm!19300) (not b!191171) (not b!191299) (not d!55995) (not b!191277) (not b!191282) (not b!191276) (not b!191271) (not b_lambda!7379) (not b!191180) (not d!55989) (not b_lambda!7377) (not b!191250) (not d!55999) (not bm!19285) tp_is_empty!4447 (not d!55993) (not bm!19290) (not bm!19282) (not b!191262) (not b!191248) (not d!55991) (not d!55997) (not bm!19295) (not mapNonEmpty!7689) (not b!191259) (not bm!19283) (not b!191253) (not b!191194) (not b!191181) (not bm!19301) (not b!191239) (not bm!19289) (not b!191254) (not b!191242) (not b!191246) (not d!55979) (not b!191269) (not d!55983) (not b!191187) (not d!55987) (not bm!19292) (not b!191196) (not b!191186) (not bm!19288) (not b!191273))
(check-sat b_and!11327 (not b_next!4675))
