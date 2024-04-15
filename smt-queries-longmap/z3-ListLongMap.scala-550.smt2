; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14590 () Bool)

(assert start!14590)

(declare-fun b!138344 () Bool)

(declare-fun b_free!2989 () Bool)

(declare-fun b_next!2989 () Bool)

(assert (=> b!138344 (= b_free!2989 (not b_next!2989))))

(declare-fun tp!11429 () Bool)

(declare-fun b_and!8593 () Bool)

(assert (=> b!138344 (= tp!11429 b_and!8593)))

(declare-fun b!138351 () Bool)

(declare-fun b_free!2991 () Bool)

(declare-fun b_next!2991 () Bool)

(assert (=> b!138351 (= b_free!2991 (not b_next!2991))))

(declare-fun tp!11428 () Bool)

(declare-fun b_and!8595 () Bool)

(assert (=> b!138351 (= tp!11428 b_and!8595)))

(declare-fun res!66172 () Bool)

(declare-fun e!90146 () Bool)

(assert (=> start!14590 (=> (not res!66172) (not e!90146))))

(declare-datatypes ((V!3529 0))(
  ( (V!3530 (val!1500 Int)) )
))
(declare-datatypes ((array!4833 0))(
  ( (array!4834 (arr!2284 (Array (_ BitVec 32) (_ BitVec 64))) (size!2556 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1112 0))(
  ( (ValueCellFull!1112 (v!3247 V!3529)) (EmptyCell!1112) )
))
(declare-datatypes ((array!4835 0))(
  ( (array!4836 (arr!2285 (Array (_ BitVec 32) ValueCell!1112)) (size!2557 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1132 0))(
  ( (LongMapFixedSize!1133 (defaultEntry!2918 Int) (mask!7247 (_ BitVec 32)) (extraKeys!2675 (_ BitVec 32)) (zeroValue!2769 V!3529) (minValue!2769 V!3529) (_size!615 (_ BitVec 32)) (_keys!4674 array!4833) (_values!2901 array!4835) (_vacant!615 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!914 0))(
  ( (Cell!915 (v!3248 LongMapFixedSize!1132)) )
))
(declare-datatypes ((LongMap!914 0))(
  ( (LongMap!915 (underlying!468 Cell!914)) )
))
(declare-fun thiss!992 () LongMap!914)

(declare-fun valid!549 (LongMap!914) Bool)

(assert (=> start!14590 (= res!66172 (valid!549 thiss!992))))

(assert (=> start!14590 e!90146))

(declare-fun e!90142 () Bool)

(assert (=> start!14590 e!90142))

(assert (=> start!14590 true))

(declare-fun e!90141 () Bool)

(assert (=> start!14590 e!90141))

(declare-fun b!138341 () Bool)

(declare-fun e!90154 () Bool)

(declare-fun tp_is_empty!2911 () Bool)

(assert (=> b!138341 (= e!90154 tp_is_empty!2911)))

(declare-fun b!138342 () Bool)

(declare-fun res!66173 () Bool)

(assert (=> b!138342 (=> (not res!66173) (not e!90146))))

(declare-fun newMap!16 () LongMapFixedSize!1132)

(declare-fun valid!550 (LongMapFixedSize!1132) Bool)

(assert (=> b!138342 (= res!66173 (valid!550 newMap!16))))

(declare-fun b!138343 () Bool)

(declare-fun e!90150 () Bool)

(assert (=> b!138343 (= e!90142 e!90150)))

(declare-fun e!90147 () Bool)

(declare-fun e!90152 () Bool)

(declare-fun array_inv!1457 (array!4833) Bool)

(declare-fun array_inv!1458 (array!4835) Bool)

(assert (=> b!138344 (= e!90152 (and tp!11429 tp_is_empty!2911 (array_inv!1457 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (array_inv!1458 (_values!2901 (v!3248 (underlying!468 thiss!992)))) e!90147))))

(declare-fun mapNonEmpty!4763 () Bool)

(declare-fun mapRes!4764 () Bool)

(declare-fun tp!11427 () Bool)

(declare-fun e!90143 () Bool)

(assert (=> mapNonEmpty!4763 (= mapRes!4764 (and tp!11427 e!90143))))

(declare-fun mapKey!4764 () (_ BitVec 32))

(declare-fun mapRest!4763 () (Array (_ BitVec 32) ValueCell!1112))

(declare-fun mapValue!4764 () ValueCell!1112)

(assert (=> mapNonEmpty!4763 (= (arr!2285 (_values!2901 newMap!16)) (store mapRest!4763 mapKey!4764 mapValue!4764))))

(declare-fun b!138345 () Bool)

(declare-fun e!90153 () Bool)

(assert (=> b!138345 (= e!90153 tp_is_empty!2911)))

(declare-fun b!138346 () Bool)

(declare-fun e!90145 () Bool)

(assert (=> b!138346 (= e!90145 (and e!90153 mapRes!4764))))

(declare-fun condMapEmpty!4763 () Bool)

(declare-fun mapDefault!4764 () ValueCell!1112)

(assert (=> b!138346 (= condMapEmpty!4763 (= (arr!2285 (_values!2901 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1112)) mapDefault!4764)))))

(declare-fun mapIsEmpty!4763 () Bool)

(declare-fun mapRes!4763 () Bool)

(assert (=> mapIsEmpty!4763 mapRes!4763))

(declare-fun b!138347 () Bool)

(declare-fun res!66175 () Bool)

(assert (=> b!138347 (=> (not res!66175) (not e!90146))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!138347 (= res!66175 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992)))))))))

(declare-fun b!138348 () Bool)

(declare-fun e!90144 () Bool)

(declare-fun e!90148 () Bool)

(assert (=> b!138348 (= e!90144 (not e!90148))))

(declare-fun res!66174 () Bool)

(assert (=> b!138348 (=> res!66174 e!90148)))

(assert (=> b!138348 (= res!66174 (or (bvsge (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))) (bvsgt from!355 (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!4833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138348 (arrayContainsKey!0 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4358 0))(
  ( (Unit!4359) )
))
(declare-fun lt!72159 () Unit!4358)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!137 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 64) (_ BitVec 32) Int) Unit!4358)

(assert (=> b!138348 (= lt!72159 (lemmaListMapContainsThenArrayContainsFrom!137 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (_values!2901 (v!3248 (underlying!468 thiss!992))) (mask!7247 (v!3248 (underlying!468 thiss!992))) (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) (minValue!2769 (v!3248 (underlying!468 thiss!992))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun mapNonEmpty!4764 () Bool)

(declare-fun tp!11430 () Bool)

(assert (=> mapNonEmpty!4764 (= mapRes!4763 (and tp!11430 e!90154))))

(declare-fun mapKey!4763 () (_ BitVec 32))

(declare-fun mapRest!4764 () (Array (_ BitVec 32) ValueCell!1112))

(declare-fun mapValue!4763 () ValueCell!1112)

(assert (=> mapNonEmpty!4764 (= (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) (store mapRest!4764 mapKey!4763 mapValue!4763))))

(declare-fun b!138349 () Bool)

(assert (=> b!138349 (= e!90150 e!90152)))

(declare-fun b!138350 () Bool)

(declare-datatypes ((List!1725 0))(
  ( (Nil!1722) (Cons!1721 (h!2328 (_ BitVec 64)) (t!6260 List!1725)) )
))
(declare-fun arrayNoDuplicates!0 (array!4833 (_ BitVec 32) List!1725) Bool)

(assert (=> b!138350 (= e!90148 (arrayNoDuplicates!0 (_keys!4674 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000000 Nil!1722))))

(assert (=> b!138351 (= e!90141 (and tp!11428 tp_is_empty!2911 (array_inv!1457 (_keys!4674 newMap!16)) (array_inv!1458 (_values!2901 newMap!16)) e!90145))))

(declare-fun b!138352 () Bool)

(declare-fun e!90149 () Bool)

(assert (=> b!138352 (= e!90149 tp_is_empty!2911)))

(declare-fun mapIsEmpty!4764 () Bool)

(assert (=> mapIsEmpty!4764 mapRes!4764))

(declare-fun b!138353 () Bool)

(declare-fun e!90151 () Bool)

(assert (=> b!138353 (= e!90151 e!90144)))

(declare-fun res!66177 () Bool)

(assert (=> b!138353 (=> (not res!66177) (not e!90144))))

(declare-datatypes ((tuple2!2630 0))(
  ( (tuple2!2631 (_1!1326 (_ BitVec 64)) (_2!1326 V!3529)) )
))
(declare-datatypes ((List!1726 0))(
  ( (Nil!1723) (Cons!1722 (h!2329 tuple2!2630) (t!6261 List!1726)) )
))
(declare-datatypes ((ListLongMap!1695 0))(
  ( (ListLongMap!1696 (toList!863 List!1726)) )
))
(declare-fun lt!72157 () ListLongMap!1695)

(declare-fun contains!902 (ListLongMap!1695 (_ BitVec 64)) Bool)

(assert (=> b!138353 (= res!66177 (contains!902 lt!72157 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2632 0))(
  ( (tuple2!2633 (_1!1327 Bool) (_2!1327 LongMapFixedSize!1132)) )
))
(declare-fun lt!72158 () tuple2!2632)

(declare-fun update!203 (LongMapFixedSize!1132 (_ BitVec 64) V!3529) tuple2!2632)

(declare-fun get!1507 (ValueCell!1112 V!3529) V!3529)

(declare-fun dynLambda!429 (Int (_ BitVec 64)) V!3529)

(assert (=> b!138353 (= lt!72158 (update!203 newMap!16 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!138354 () Bool)

(assert (=> b!138354 (= e!90143 tp_is_empty!2911)))

(declare-fun b!138355 () Bool)

(assert (=> b!138355 (= e!90146 e!90151)))

(declare-fun res!66176 () Bool)

(assert (=> b!138355 (=> (not res!66176) (not e!90151))))

(declare-fun lt!72156 () ListLongMap!1695)

(assert (=> b!138355 (= res!66176 (and (= lt!72156 lt!72157) (not (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1411 (LongMapFixedSize!1132) ListLongMap!1695)

(assert (=> b!138355 (= lt!72157 (map!1411 newMap!16))))

(declare-fun getCurrentListMap!527 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 32) Int) ListLongMap!1695)

(assert (=> b!138355 (= lt!72156 (getCurrentListMap!527 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (_values!2901 (v!3248 (underlying!468 thiss!992))) (mask!7247 (v!3248 (underlying!468 thiss!992))) (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) (minValue!2769 (v!3248 (underlying!468 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun b!138356 () Bool)

(assert (=> b!138356 (= e!90147 (and e!90149 mapRes!4763))))

(declare-fun condMapEmpty!4764 () Bool)

(declare-fun mapDefault!4763 () ValueCell!1112)

(assert (=> b!138356 (= condMapEmpty!4764 (= (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1112)) mapDefault!4763)))))

(declare-fun b!138357 () Bool)

(declare-fun res!66178 () Bool)

(assert (=> b!138357 (=> (not res!66178) (not e!90146))))

(assert (=> b!138357 (= res!66178 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7247 newMap!16)) (_size!615 (v!3248 (underlying!468 thiss!992)))))))

(assert (= (and start!14590 res!66172) b!138347))

(assert (= (and b!138347 res!66175) b!138342))

(assert (= (and b!138342 res!66173) b!138357))

(assert (= (and b!138357 res!66178) b!138355))

(assert (= (and b!138355 res!66176) b!138353))

(assert (= (and b!138353 res!66177) b!138348))

(assert (= (and b!138348 (not res!66174)) b!138350))

(assert (= (and b!138356 condMapEmpty!4764) mapIsEmpty!4763))

(assert (= (and b!138356 (not condMapEmpty!4764)) mapNonEmpty!4764))

(get-info :version)

(assert (= (and mapNonEmpty!4764 ((_ is ValueCellFull!1112) mapValue!4763)) b!138341))

(assert (= (and b!138356 ((_ is ValueCellFull!1112) mapDefault!4763)) b!138352))

(assert (= b!138344 b!138356))

(assert (= b!138349 b!138344))

(assert (= b!138343 b!138349))

(assert (= start!14590 b!138343))

(assert (= (and b!138346 condMapEmpty!4763) mapIsEmpty!4764))

(assert (= (and b!138346 (not condMapEmpty!4763)) mapNonEmpty!4763))

(assert (= (and mapNonEmpty!4763 ((_ is ValueCellFull!1112) mapValue!4764)) b!138354))

(assert (= (and b!138346 ((_ is ValueCellFull!1112) mapDefault!4764)) b!138345))

(assert (= b!138351 b!138346))

(assert (= start!14590 b!138351))

(declare-fun b_lambda!6185 () Bool)

(assert (=> (not b_lambda!6185) (not b!138353)))

(declare-fun t!6257 () Bool)

(declare-fun tb!2497 () Bool)

(assert (=> (and b!138344 (= (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992)))) t!6257) tb!2497))

(declare-fun result!4105 () Bool)

(assert (=> tb!2497 (= result!4105 tp_is_empty!2911)))

(assert (=> b!138353 t!6257))

(declare-fun b_and!8597 () Bool)

(assert (= b_and!8593 (and (=> t!6257 result!4105) b_and!8597)))

(declare-fun tb!2499 () Bool)

(declare-fun t!6259 () Bool)

(assert (=> (and b!138351 (= (defaultEntry!2918 newMap!16) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992)))) t!6259) tb!2499))

(declare-fun result!4109 () Bool)

(assert (= result!4109 result!4105))

(assert (=> b!138353 t!6259))

(declare-fun b_and!8599 () Bool)

(assert (= b_and!8595 (and (=> t!6259 result!4109) b_and!8599)))

(declare-fun m!165183 () Bool)

(assert (=> b!138344 m!165183))

(declare-fun m!165185 () Bool)

(assert (=> b!138344 m!165185))

(declare-fun m!165187 () Bool)

(assert (=> mapNonEmpty!4763 m!165187))

(declare-fun m!165189 () Bool)

(assert (=> b!138353 m!165189))

(declare-fun m!165191 () Bool)

(assert (=> b!138353 m!165191))

(declare-fun m!165193 () Bool)

(assert (=> b!138353 m!165193))

(declare-fun m!165195 () Bool)

(assert (=> b!138353 m!165195))

(assert (=> b!138353 m!165191))

(assert (=> b!138353 m!165195))

(declare-fun m!165197 () Bool)

(assert (=> b!138353 m!165197))

(assert (=> b!138353 m!165195))

(assert (=> b!138353 m!165193))

(declare-fun m!165199 () Bool)

(assert (=> b!138353 m!165199))

(assert (=> b!138353 m!165189))

(assert (=> b!138355 m!165195))

(declare-fun m!165201 () Bool)

(assert (=> b!138355 m!165201))

(declare-fun m!165203 () Bool)

(assert (=> b!138355 m!165203))

(declare-fun m!165205 () Bool)

(assert (=> b!138350 m!165205))

(assert (=> b!138348 m!165195))

(assert (=> b!138348 m!165195))

(declare-fun m!165207 () Bool)

(assert (=> b!138348 m!165207))

(assert (=> b!138348 m!165195))

(declare-fun m!165209 () Bool)

(assert (=> b!138348 m!165209))

(declare-fun m!165211 () Bool)

(assert (=> mapNonEmpty!4764 m!165211))

(declare-fun m!165213 () Bool)

(assert (=> b!138342 m!165213))

(declare-fun m!165215 () Bool)

(assert (=> b!138351 m!165215))

(declare-fun m!165217 () Bool)

(assert (=> b!138351 m!165217))

(declare-fun m!165219 () Bool)

(assert (=> start!14590 m!165219))

(check-sat tp_is_empty!2911 (not b!138351) b_and!8597 (not b!138353) (not b!138342) (not b!138350) (not b_lambda!6185) (not b_next!2991) (not b!138348) (not b!138355) (not start!14590) (not b!138344) b_and!8599 (not mapNonEmpty!4763) (not mapNonEmpty!4764) (not b_next!2989))
(check-sat b_and!8597 b_and!8599 (not b_next!2989) (not b_next!2991))
(get-model)

(declare-fun b_lambda!6191 () Bool)

(assert (= b_lambda!6185 (or (and b!138344 b_free!2989) (and b!138351 b_free!2991 (= (defaultEntry!2918 newMap!16) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))))) b_lambda!6191)))

(check-sat tp_is_empty!2911 (not b!138351) b_and!8597 (not b!138353) (not b!138342) (not b!138350) (not b_lambda!6191) (not b_next!2991) (not b!138348) (not b!138355) (not start!14590) (not b!138344) b_and!8599 (not mapNonEmpty!4763) (not mapNonEmpty!4764) (not b_next!2989))
(check-sat b_and!8597 b_and!8599 (not b_next!2989) (not b_next!2991))
(get-model)

(declare-fun d!43349 () Bool)

(declare-fun res!66227 () Bool)

(declare-fun e!90255 () Bool)

(assert (=> d!43349 (=> (not res!66227) (not e!90255))))

(declare-fun simpleValid!94 (LongMapFixedSize!1132) Bool)

(assert (=> d!43349 (= res!66227 (simpleValid!94 newMap!16))))

(assert (=> d!43349 (= (valid!550 newMap!16) e!90255)))

(declare-fun b!138472 () Bool)

(declare-fun res!66228 () Bool)

(assert (=> b!138472 (=> (not res!66228) (not e!90255))))

(declare-fun arrayCountValidKeys!0 (array!4833 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!138472 (= res!66228 (= (arrayCountValidKeys!0 (_keys!4674 newMap!16) #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))) (_size!615 newMap!16)))))

(declare-fun b!138473 () Bool)

(declare-fun res!66229 () Bool)

(assert (=> b!138473 (=> (not res!66229) (not e!90255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4833 (_ BitVec 32)) Bool)

(assert (=> b!138473 (= res!66229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4674 newMap!16) (mask!7247 newMap!16)))))

(declare-fun b!138474 () Bool)

(assert (=> b!138474 (= e!90255 (arrayNoDuplicates!0 (_keys!4674 newMap!16) #b00000000000000000000000000000000 Nil!1722))))

(assert (= (and d!43349 res!66227) b!138472))

(assert (= (and b!138472 res!66228) b!138473))

(assert (= (and b!138473 res!66229) b!138474))

(declare-fun m!165297 () Bool)

(assert (=> d!43349 m!165297))

(declare-fun m!165299 () Bool)

(assert (=> b!138472 m!165299))

(declare-fun m!165301 () Bool)

(assert (=> b!138473 m!165301))

(declare-fun m!165303 () Bool)

(assert (=> b!138474 m!165303))

(assert (=> b!138342 d!43349))

(declare-fun b!138485 () Bool)

(declare-fun e!90267 () Bool)

(declare-fun call!15176 () Bool)

(assert (=> b!138485 (= e!90267 call!15176)))

(declare-fun d!43351 () Bool)

(declare-fun res!66237 () Bool)

(declare-fun e!90264 () Bool)

(assert (=> d!43351 (=> res!66237 e!90264)))

(assert (=> d!43351 (= res!66237 (bvsge #b00000000000000000000000000000000 (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))))))

(assert (=> d!43351 (= (arrayNoDuplicates!0 (_keys!4674 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000000 Nil!1722) e!90264)))

(declare-fun b!138486 () Bool)

(declare-fun e!90265 () Bool)

(assert (=> b!138486 (= e!90265 e!90267)))

(declare-fun c!25942 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!138486 (= c!25942 (validKeyInArray!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!15173 () Bool)

(assert (=> bm!15173 (= call!15176 (arrayNoDuplicates!0 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!25942 (Cons!1721 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000) Nil!1722) Nil!1722)))))

(declare-fun b!138487 () Bool)

(declare-fun e!90266 () Bool)

(declare-fun contains!904 (List!1725 (_ BitVec 64)) Bool)

(assert (=> b!138487 (= e!90266 (contains!904 Nil!1722 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!138488 () Bool)

(assert (=> b!138488 (= e!90264 e!90265)))

(declare-fun res!66236 () Bool)

(assert (=> b!138488 (=> (not res!66236) (not e!90265))))

(assert (=> b!138488 (= res!66236 (not e!90266))))

(declare-fun res!66238 () Bool)

(assert (=> b!138488 (=> (not res!66238) (not e!90266))))

(assert (=> b!138488 (= res!66238 (validKeyInArray!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!138489 () Bool)

(assert (=> b!138489 (= e!90267 call!15176)))

(assert (= (and d!43351 (not res!66237)) b!138488))

(assert (= (and b!138488 res!66238) b!138487))

(assert (= (and b!138488 res!66236) b!138486))

(assert (= (and b!138486 c!25942) b!138485))

(assert (= (and b!138486 (not c!25942)) b!138489))

(assert (= (or b!138485 b!138489) bm!15173))

(declare-fun m!165305 () Bool)

(assert (=> b!138486 m!165305))

(assert (=> b!138486 m!165305))

(declare-fun m!165307 () Bool)

(assert (=> b!138486 m!165307))

(assert (=> bm!15173 m!165305))

(declare-fun m!165309 () Bool)

(assert (=> bm!15173 m!165309))

(assert (=> b!138487 m!165305))

(assert (=> b!138487 m!165305))

(declare-fun m!165311 () Bool)

(assert (=> b!138487 m!165311))

(assert (=> b!138488 m!165305))

(assert (=> b!138488 m!165305))

(assert (=> b!138488 m!165307))

(assert (=> b!138350 d!43351))

(declare-fun d!43353 () Bool)

(declare-fun e!90273 () Bool)

(assert (=> d!43353 e!90273))

(declare-fun res!66241 () Bool)

(assert (=> d!43353 (=> res!66241 e!90273)))

(declare-fun lt!72192 () Bool)

(assert (=> d!43353 (= res!66241 (not lt!72192))))

(declare-fun lt!72195 () Bool)

(assert (=> d!43353 (= lt!72192 lt!72195)))

(declare-fun lt!72194 () Unit!4358)

(declare-fun e!90272 () Unit!4358)

(assert (=> d!43353 (= lt!72194 e!90272)))

(declare-fun c!25945 () Bool)

(assert (=> d!43353 (= c!25945 lt!72195)))

(declare-fun containsKey!176 (List!1726 (_ BitVec 64)) Bool)

(assert (=> d!43353 (= lt!72195 (containsKey!176 (toList!863 lt!72157) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(assert (=> d!43353 (= (contains!902 lt!72157 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) lt!72192)))

(declare-fun b!138496 () Bool)

(declare-fun lt!72193 () Unit!4358)

(assert (=> b!138496 (= e!90272 lt!72193)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!125 (List!1726 (_ BitVec 64)) Unit!4358)

(assert (=> b!138496 (= lt!72193 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!863 lt!72157) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-datatypes ((Option!178 0))(
  ( (Some!177 (v!3253 V!3529)) (None!176) )
))
(declare-fun isDefined!126 (Option!178) Bool)

(declare-fun getValueByKey!172 (List!1726 (_ BitVec 64)) Option!178)

(assert (=> b!138496 (isDefined!126 (getValueByKey!172 (toList!863 lt!72157) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-fun b!138497 () Bool)

(declare-fun Unit!4362 () Unit!4358)

(assert (=> b!138497 (= e!90272 Unit!4362)))

(declare-fun b!138498 () Bool)

(assert (=> b!138498 (= e!90273 (isDefined!126 (getValueByKey!172 (toList!863 lt!72157) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355))))))

(assert (= (and d!43353 c!25945) b!138496))

(assert (= (and d!43353 (not c!25945)) b!138497))

(assert (= (and d!43353 (not res!66241)) b!138498))

(assert (=> d!43353 m!165195))

(declare-fun m!165313 () Bool)

(assert (=> d!43353 m!165313))

(assert (=> b!138496 m!165195))

(declare-fun m!165315 () Bool)

(assert (=> b!138496 m!165315))

(assert (=> b!138496 m!165195))

(declare-fun m!165317 () Bool)

(assert (=> b!138496 m!165317))

(assert (=> b!138496 m!165317))

(declare-fun m!165319 () Bool)

(assert (=> b!138496 m!165319))

(assert (=> b!138498 m!165195))

(assert (=> b!138498 m!165317))

(assert (=> b!138498 m!165317))

(assert (=> b!138498 m!165319))

(assert (=> b!138353 d!43353))

(declare-fun b!138583 () Bool)

(declare-fun c!25980 () Bool)

(declare-datatypes ((SeekEntryResult!280 0))(
  ( (MissingZero!280 (index!3282 (_ BitVec 32))) (Found!280 (index!3283 (_ BitVec 32))) (Intermediate!280 (undefined!1092 Bool) (index!3284 (_ BitVec 32)) (x!15993 (_ BitVec 32))) (Undefined!280) (MissingVacant!280 (index!3285 (_ BitVec 32))) )
))
(declare-fun lt!72267 () SeekEntryResult!280)

(assert (=> b!138583 (= c!25980 ((_ is MissingVacant!280) lt!72267))))

(declare-fun e!90330 () tuple2!2632)

(declare-fun e!90322 () tuple2!2632)

(assert (=> b!138583 (= e!90330 e!90322)))

(declare-fun bm!15222 () Bool)

(declare-fun call!15234 () Bool)

(assert (=> bm!15222 (= call!15234 (arrayContainsKey!0 (_keys!4674 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!138584 () Bool)

(declare-fun c!25974 () Bool)

(declare-fun lt!72276 () SeekEntryResult!280)

(assert (=> b!138584 (= c!25974 ((_ is MissingVacant!280) lt!72276))))

(declare-fun e!90329 () Bool)

(declare-fun e!90332 () Bool)

(assert (=> b!138584 (= e!90329 e!90332)))

(declare-fun call!15230 () ListLongMap!1695)

(declare-fun b!138585 () Bool)

(declare-fun call!15231 () ListLongMap!1695)

(declare-fun e!90318 () Bool)

(declare-fun +!165 (ListLongMap!1695 tuple2!2630) ListLongMap!1695)

(assert (=> b!138585 (= e!90318 (= call!15230 (+!165 call!15231 (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!15223 () Bool)

(declare-fun call!15237 () Bool)

(declare-fun call!15238 () Bool)

(assert (=> bm!15223 (= call!15237 call!15238)))

(declare-fun b!138586 () Bool)

(declare-fun res!66273 () Bool)

(declare-fun e!90323 () Bool)

(assert (=> b!138586 (=> (not res!66273) (not e!90323))))

(declare-fun lt!72265 () SeekEntryResult!280)

(assert (=> b!138586 (= res!66273 (= (select (arr!2284 (_keys!4674 newMap!16)) (index!3282 lt!72265)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138587 () Bool)

(declare-fun e!90327 () Bool)

(assert (=> b!138587 (= e!90332 e!90327)))

(declare-fun res!66279 () Bool)

(declare-fun call!15236 () Bool)

(assert (=> b!138587 (= res!66279 call!15236)))

(assert (=> b!138587 (=> (not res!66279) (not e!90327))))

(declare-fun b!138588 () Bool)

(declare-fun res!66283 () Bool)

(assert (=> b!138588 (= res!66283 (= (select (arr!2284 (_keys!4674 newMap!16)) (index!3285 lt!72265)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!90324 () Bool)

(assert (=> b!138588 (=> (not res!66283) (not e!90324))))

(declare-fun b!138589 () Bool)

(declare-fun res!66277 () Bool)

(assert (=> b!138589 (= res!66277 (= (select (arr!2284 (_keys!4674 newMap!16)) (index!3285 lt!72276)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138589 (=> (not res!66277) (not e!90327))))

(declare-fun bm!15224 () Bool)

(declare-fun call!15244 () Bool)

(assert (=> bm!15224 (= call!15244 call!15234)))

(declare-fun b!138590 () Bool)

(declare-fun res!66275 () Bool)

(declare-fun call!15245 () Bool)

(assert (=> b!138590 (= res!66275 call!15245)))

(declare-fun e!90333 () Bool)

(assert (=> b!138590 (=> (not res!66275) (not e!90333))))

(declare-fun b!138591 () Bool)

(declare-fun e!90325 () Unit!4358)

(declare-fun Unit!4363 () Unit!4358)

(assert (=> b!138591 (= e!90325 Unit!4363)))

(declare-fun lt!72259 () Unit!4358)

(declare-fun call!15246 () Unit!4358)

(assert (=> b!138591 (= lt!72259 call!15246)))

(declare-fun lt!72254 () SeekEntryResult!280)

(declare-fun call!15247 () SeekEntryResult!280)

(assert (=> b!138591 (= lt!72254 call!15247)))

(declare-fun res!66274 () Bool)

(assert (=> b!138591 (= res!66274 ((_ is Found!280) lt!72254))))

(assert (=> b!138591 (=> (not res!66274) (not e!90333))))

(assert (=> b!138591 e!90333))

(declare-fun lt!72274 () Unit!4358)

(assert (=> b!138591 (= lt!72274 lt!72259)))

(assert (=> b!138591 false))

(declare-fun b!138592 () Bool)

(declare-fun e!90334 () Bool)

(assert (=> b!138592 (= e!90334 e!90324)))

(declare-fun res!66271 () Bool)

(declare-fun call!15235 () Bool)

(assert (=> b!138592 (= res!66271 call!15235)))

(assert (=> b!138592 (=> (not res!66271) (not e!90324))))

(declare-fun bm!15225 () Bool)

(declare-fun call!15248 () ListLongMap!1695)

(declare-fun call!15242 () ListLongMap!1695)

(assert (=> bm!15225 (= call!15248 call!15242)))

(declare-fun call!15225 () Unit!4358)

(declare-fun bm!15226 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!63 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 64) Int) Unit!4358)

(assert (=> bm!15226 (= call!15225 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!63 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)))))

(declare-fun bm!15227 () Bool)

(declare-fun c!25985 () Bool)

(declare-fun lt!72270 () SeekEntryResult!280)

(declare-fun c!25976 () Bool)

(declare-fun c!25975 () Bool)

(declare-fun c!25987 () Bool)

(declare-fun c!25979 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!15227 (= call!15238 (inRange!0 (ite c!25985 (ite c!25975 (index!3283 lt!72254) (ite c!25976 (index!3282 lt!72276) (index!3285 lt!72276))) (ite c!25987 (index!3283 lt!72270) (ite c!25979 (index!3282 lt!72265) (index!3285 lt!72265)))) (mask!7247 newMap!16)))))

(declare-fun bm!15228 () Bool)

(declare-fun lt!72266 () tuple2!2632)

(assert (=> bm!15228 (= call!15230 (map!1411 (_2!1327 lt!72266)))))

(declare-fun bm!15229 () Bool)

(declare-fun c!25977 () Bool)

(declare-fun c!25983 () Bool)

(declare-fun call!15227 () ListLongMap!1695)

(declare-fun e!90337 () ListLongMap!1695)

(assert (=> bm!15229 (= call!15227 (+!165 e!90337 (ite c!25983 (ite c!25977 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!25982 () Bool)

(assert (=> bm!15229 (= c!25982 c!25983)))

(declare-fun b!138593 () Bool)

(declare-fun e!90328 () tuple2!2632)

(assert (=> b!138593 (= e!90328 e!90330)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4833 (_ BitVec 32)) SeekEntryResult!280)

(assert (=> b!138593 (= lt!72267 (seekEntryOrOpen!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (_keys!4674 newMap!16) (mask!7247 newMap!16)))))

(assert (=> b!138593 (= c!25985 ((_ is Undefined!280) lt!72267))))

(declare-fun b!138594 () Bool)

(declare-fun res!66276 () Bool)

(assert (=> b!138594 (=> (not res!66276) (not e!90323))))

(assert (=> b!138594 (= res!66276 call!15235)))

(declare-fun e!90326 () Bool)

(assert (=> b!138594 (= e!90326 e!90323)))

(declare-fun b!138595 () Bool)

(declare-fun lt!72272 () tuple2!2632)

(assert (=> b!138595 (= e!90322 (tuple2!2633 (_1!1327 lt!72272) (_2!1327 lt!72272)))))

(declare-fun call!15240 () tuple2!2632)

(assert (=> b!138595 (= lt!72272 call!15240)))

(declare-fun b!138596 () Bool)

(declare-fun e!90331 () Bool)

(declare-fun call!15229 () Bool)

(assert (=> b!138596 (= e!90331 (not call!15229))))

(declare-fun b!138597 () Bool)

(declare-fun c!25978 () Bool)

(assert (=> b!138597 (= c!25978 ((_ is MissingVacant!280) lt!72265))))

(assert (=> b!138597 (= e!90326 e!90334)))

(declare-fun b!138598 () Bool)

(declare-fun e!90336 () Bool)

(assert (=> b!138598 (= e!90336 (= call!15230 call!15231))))

(declare-fun bm!15230 () Bool)

(declare-fun updateHelperNewKey!63 (LongMapFixedSize!1132 (_ BitVec 64) V!3529 (_ BitVec 32)) tuple2!2632)

(assert (=> bm!15230 (= call!15240 (updateHelperNewKey!63 newMap!16 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267))))))

(declare-fun bm!15231 () Bool)

(declare-fun call!15243 () ListLongMap!1695)

(assert (=> bm!15231 (= call!15243 call!15227)))

(declare-fun bm!15232 () Bool)

(assert (=> bm!15232 (= call!15231 (map!1411 newMap!16))))

(declare-fun b!138599 () Bool)

(declare-fun e!90320 () Unit!4358)

(declare-fun lt!72256 () Unit!4358)

(assert (=> b!138599 (= e!90320 lt!72256)))

(assert (=> b!138599 (= lt!72256 call!15246)))

(declare-fun call!15226 () SeekEntryResult!280)

(assert (=> b!138599 (= lt!72270 call!15226)))

(declare-fun res!66272 () Bool)

(assert (=> b!138599 (= res!66272 ((_ is Found!280) lt!72270))))

(declare-fun e!90335 () Bool)

(assert (=> b!138599 (=> (not res!66272) (not e!90335))))

(assert (=> b!138599 e!90335))

(declare-fun b!138600 () Bool)

(assert (=> b!138600 (= e!90337 (getCurrentListMap!527 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun bm!15233 () Bool)

(declare-fun call!15241 () SeekEntryResult!280)

(assert (=> bm!15233 (= call!15226 call!15241)))

(declare-fun b!138601 () Bool)

(assert (=> b!138601 (= e!90332 ((_ is Undefined!280) lt!72276))))

(declare-fun b!138602 () Bool)

(declare-fun lt!72252 () Unit!4358)

(assert (=> b!138602 (= lt!72252 e!90325)))

(declare-fun call!15233 () Bool)

(assert (=> b!138602 (= c!25975 call!15233)))

(assert (=> b!138602 (= e!90330 (tuple2!2633 false newMap!16))))

(declare-fun bm!15234 () Bool)

(assert (=> bm!15234 (= call!15229 call!15234)))

(declare-fun b!138603 () Bool)

(assert (=> b!138603 (= e!90333 (= (select (arr!2284 (_keys!4674 newMap!16)) (index!3283 lt!72254)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-fun b!138604 () Bool)

(assert (=> b!138604 (= e!90336 e!90318)))

(declare-fun res!66270 () Bool)

(assert (=> b!138604 (= res!66270 (contains!902 call!15230 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(assert (=> b!138604 (=> (not res!66270) (not e!90318))))

(declare-fun b!138605 () Bool)

(declare-fun Unit!4364 () Unit!4358)

(assert (=> b!138605 (= e!90320 Unit!4364)))

(declare-fun lt!72275 () Unit!4358)

(assert (=> b!138605 (= lt!72275 call!15225)))

(assert (=> b!138605 (= lt!72265 call!15226)))

(assert (=> b!138605 (= c!25979 ((_ is MissingZero!280) lt!72265))))

(assert (=> b!138605 e!90326))

(declare-fun lt!72255 () Unit!4358)

(assert (=> b!138605 (= lt!72255 lt!72275)))

(assert (=> b!138605 false))

(declare-fun bm!15235 () Bool)

(declare-fun call!15232 () ListLongMap!1695)

(assert (=> bm!15235 (= call!15232 call!15242)))

(declare-fun bm!15236 () Bool)

(declare-fun call!15239 () ListLongMap!1695)

(declare-fun call!15228 () ListLongMap!1695)

(assert (=> bm!15236 (= call!15239 call!15228)))

(declare-fun b!138606 () Bool)

(declare-fun lt!72271 () Unit!4358)

(assert (=> b!138606 (= e!90325 lt!72271)))

(assert (=> b!138606 (= lt!72271 call!15225)))

(assert (=> b!138606 (= lt!72276 call!15247)))

(assert (=> b!138606 (= c!25976 ((_ is MissingZero!280) lt!72276))))

(assert (=> b!138606 e!90329))

(declare-fun bm!15237 () Bool)

(assert (=> bm!15237 (= call!15247 call!15241)))

(declare-fun b!138607 () Bool)

(assert (=> b!138607 (= e!90327 (not call!15229))))

(declare-fun bm!15238 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!63 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 64) Int) Unit!4358)

(assert (=> bm!15238 (= call!15246 (lemmaInListMapThenSeekEntryOrOpenFindsIt!63 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)))))

(declare-fun b!138608 () Bool)

(declare-fun e!90321 () tuple2!2632)

(assert (=> b!138608 (= e!90328 e!90321)))

(assert (=> b!138608 (= c!25977 (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15239 () Bool)

(declare-fun lt!72257 () (_ BitVec 32))

(declare-fun lt!72273 () array!4835)

(assert (=> bm!15239 (= call!15242 (getCurrentListMap!527 (_keys!4674 newMap!16) (ite (or c!25983 c!25985) (_values!2901 newMap!16) lt!72273) (mask!7247 newMap!16) (ite (and c!25983 c!25977) lt!72257 (extraKeys!2675 newMap!16)) (ite (and c!25983 c!25977) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun b!138609 () Bool)

(assert (=> b!138609 (= e!90337 (ite c!25977 call!15239 call!15248))))

(declare-fun b!138610 () Bool)

(declare-fun res!66280 () Bool)

(assert (=> b!138610 (=> (not res!66280) (not e!90331))))

(assert (=> b!138610 (= res!66280 call!15236)))

(assert (=> b!138610 (= e!90329 e!90331)))

(declare-fun bm!15240 () Bool)

(assert (=> bm!15240 (= call!15236 call!15245)))

(declare-fun d!43355 () Bool)

(declare-fun e!90338 () Bool)

(assert (=> d!43355 e!90338))

(declare-fun res!66282 () Bool)

(assert (=> d!43355 (=> (not res!66282) (not e!90338))))

(assert (=> d!43355 (= res!66282 (valid!550 (_2!1327 lt!72266)))))

(assert (=> d!43355 (= lt!72266 e!90328)))

(assert (=> d!43355 (= c!25983 (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (bvneg (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355))))))

(assert (=> d!43355 (valid!550 newMap!16)))

(assert (=> d!43355 (= (update!203 newMap!16 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!72266)))

(declare-fun bm!15241 () Bool)

(assert (=> bm!15241 (= call!15245 call!15238)))

(declare-fun b!138611 () Bool)

(assert (=> b!138611 (= e!90323 (not call!15244))))

(declare-fun b!138612 () Bool)

(declare-fun lt!72253 () Unit!4358)

(declare-fun lt!72261 () Unit!4358)

(assert (=> b!138612 (= lt!72253 lt!72261)))

(assert (=> b!138612 (= call!15243 call!15239)))

(declare-fun lt!72262 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!63 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 V!3529 Int) Unit!4358)

(assert (=> b!138612 (= lt!72261 (lemmaChangeLongMinValueKeyThenAddPairToListMap!63 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) lt!72262 (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2918 newMap!16)))))

(assert (=> b!138612 (= lt!72262 (bvor (extraKeys!2675 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!138612 (= e!90321 (tuple2!2633 true (LongMapFixedSize!1133 (defaultEntry!2918 newMap!16) (mask!7247 newMap!16) (bvor (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) (zeroValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!615 newMap!16) (_keys!4674 newMap!16) (_values!2901 newMap!16) (_vacant!615 newMap!16))))))

(declare-fun b!138613 () Bool)

(declare-fun res!66278 () Bool)

(assert (=> b!138613 (=> (not res!66278) (not e!90331))))

(assert (=> b!138613 (= res!66278 (= (select (arr!2284 (_keys!4674 newMap!16)) (index!3282 lt!72276)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138614 () Bool)

(assert (=> b!138614 (= e!90324 (not call!15244))))

(declare-fun b!138615 () Bool)

(declare-fun e!90319 () tuple2!2632)

(assert (=> b!138615 (= e!90322 e!90319)))

(declare-fun c!25984 () Bool)

(assert (=> b!138615 (= c!25984 ((_ is MissingZero!280) lt!72267))))

(declare-fun b!138616 () Bool)

(declare-fun res!66281 () Bool)

(assert (=> b!138616 (= res!66281 call!15237)))

(assert (=> b!138616 (=> (not res!66281) (not e!90335))))

(declare-fun b!138617 () Bool)

(declare-fun e!90339 () ListLongMap!1695)

(assert (=> b!138617 (= e!90339 call!15232)))

(declare-fun bm!15242 () Bool)

(assert (=> bm!15242 (= call!15235 call!15237)))

(declare-fun bm!15243 () Bool)

(assert (=> bm!15243 (= call!15241 (seekEntryOrOpen!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (_keys!4674 newMap!16) (mask!7247 newMap!16)))))

(declare-fun b!138618 () Bool)

(declare-fun lt!72263 () Unit!4358)

(declare-fun lt!72258 () Unit!4358)

(assert (=> b!138618 (= lt!72263 lt!72258)))

(assert (=> b!138618 (contains!902 call!15232 (select (arr!2284 (_keys!4674 newMap!16)) (index!3283 lt!72267)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!122 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 32) Int) Unit!4358)

(assert (=> b!138618 (= lt!72258 (lemmaValidKeyInArrayIsInListMap!122 (_keys!4674 newMap!16) lt!72273 (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (index!3283 lt!72267) (defaultEntry!2918 newMap!16)))))

(assert (=> b!138618 (= lt!72273 (array!4836 (store (arr!2285 (_values!2901 newMap!16)) (index!3283 lt!72267) (ValueCellFull!1112 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2557 (_values!2901 newMap!16))))))

(declare-fun lt!72264 () Unit!4358)

(declare-fun lt!72260 () Unit!4358)

(assert (=> b!138618 (= lt!72264 lt!72260)))

(assert (=> b!138618 (= call!15227 call!15228)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!63 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 32) (_ BitVec 64) V!3529 Int) Unit!4358)

(assert (=> b!138618 (= lt!72260 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!63 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (index!3283 lt!72267) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72250 () Unit!4358)

(assert (=> b!138618 (= lt!72250 e!90320)))

(assert (=> b!138618 (= c!25987 call!15233)))

(assert (=> b!138618 (= e!90319 (tuple2!2633 true (LongMapFixedSize!1133 (defaultEntry!2918 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (_size!615 newMap!16) (_keys!4674 newMap!16) (array!4836 (store (arr!2285 (_values!2901 newMap!16)) (index!3283 lt!72267) (ValueCellFull!1112 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2557 (_values!2901 newMap!16))) (_vacant!615 newMap!16))))))

(declare-fun bm!15244 () Bool)

(assert (=> bm!15244 (= call!15228 (getCurrentListMap!527 (_keys!4674 newMap!16) (ite c!25983 (_values!2901 newMap!16) (array!4836 (store (arr!2285 (_values!2901 newMap!16)) (index!3283 lt!72267) (ValueCellFull!1112 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2557 (_values!2901 newMap!16)))) (mask!7247 newMap!16) (ite c!25983 (ite c!25977 (extraKeys!2675 newMap!16) lt!72262) (extraKeys!2675 newMap!16)) (zeroValue!2769 newMap!16) (ite c!25983 (ite c!25977 (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun b!138619 () Bool)

(assert (=> b!138619 (= e!90334 ((_ is Undefined!280) lt!72265))))

(declare-fun bm!15245 () Bool)

(declare-fun c!25986 () Bool)

(assert (=> bm!15245 (= c!25986 c!25985)))

(assert (=> bm!15245 (= call!15233 (contains!902 e!90339 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-fun b!138620 () Bool)

(declare-fun lt!72269 () Unit!4358)

(declare-fun lt!72268 () Unit!4358)

(assert (=> b!138620 (= lt!72269 lt!72268)))

(assert (=> b!138620 (= call!15243 call!15248)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!63 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 V!3529 Int) Unit!4358)

(assert (=> b!138620 (= lt!72268 (lemmaChangeZeroKeyThenAddPairToListMap!63 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) lt!72257 (zeroValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2769 newMap!16) (defaultEntry!2918 newMap!16)))))

(assert (=> b!138620 (= lt!72257 (bvor (extraKeys!2675 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!138620 (= e!90321 (tuple2!2633 true (LongMapFixedSize!1133 (defaultEntry!2918 newMap!16) (mask!7247 newMap!16) (bvor (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2769 newMap!16) (_size!615 newMap!16) (_keys!4674 newMap!16) (_values!2901 newMap!16) (_vacant!615 newMap!16))))))

(declare-fun b!138621 () Bool)

(assert (=> b!138621 (= e!90335 (= (select (arr!2284 (_keys!4674 newMap!16)) (index!3283 lt!72270)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-fun b!138622 () Bool)

(declare-fun lt!72251 () tuple2!2632)

(assert (=> b!138622 (= lt!72251 call!15240)))

(assert (=> b!138622 (= e!90319 (tuple2!2633 (_1!1327 lt!72251) (_2!1327 lt!72251)))))

(declare-fun b!138623 () Bool)

(assert (=> b!138623 (= e!90338 e!90336)))

(declare-fun c!25981 () Bool)

(assert (=> b!138623 (= c!25981 (_1!1327 lt!72266))))

(declare-fun b!138624 () Bool)

(assert (=> b!138624 (= e!90339 (getCurrentListMap!527 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(assert (= (and d!43355 c!25983) b!138608))

(assert (= (and d!43355 (not c!25983)) b!138593))

(assert (= (and b!138608 c!25977) b!138620))

(assert (= (and b!138608 (not c!25977)) b!138612))

(assert (= (or b!138620 b!138612) bm!15225))

(assert (= (or b!138620 b!138612) bm!15236))

(assert (= (or b!138620 b!138612) bm!15231))

(assert (= (and b!138593 c!25985) b!138602))

(assert (= (and b!138593 (not c!25985)) b!138583))

(assert (= (and b!138602 c!25975) b!138591))

(assert (= (and b!138602 (not c!25975)) b!138606))

(assert (= (and b!138591 res!66274) b!138590))

(assert (= (and b!138590 res!66275) b!138603))

(assert (= (and b!138606 c!25976) b!138610))

(assert (= (and b!138606 (not c!25976)) b!138584))

(assert (= (and b!138610 res!66280) b!138613))

(assert (= (and b!138613 res!66278) b!138596))

(assert (= (and b!138584 c!25974) b!138587))

(assert (= (and b!138584 (not c!25974)) b!138601))

(assert (= (and b!138587 res!66279) b!138589))

(assert (= (and b!138589 res!66277) b!138607))

(assert (= (or b!138610 b!138587) bm!15240))

(assert (= (or b!138596 b!138607) bm!15234))

(assert (= (or b!138590 bm!15240) bm!15241))

(assert (= (or b!138591 b!138606) bm!15237))

(assert (= (and b!138583 c!25980) b!138595))

(assert (= (and b!138583 (not c!25980)) b!138615))

(assert (= (and b!138615 c!25984) b!138622))

(assert (= (and b!138615 (not c!25984)) b!138618))

(assert (= (and b!138618 c!25987) b!138599))

(assert (= (and b!138618 (not c!25987)) b!138605))

(assert (= (and b!138599 res!66272) b!138616))

(assert (= (and b!138616 res!66281) b!138621))

(assert (= (and b!138605 c!25979) b!138594))

(assert (= (and b!138605 (not c!25979)) b!138597))

(assert (= (and b!138594 res!66276) b!138586))

(assert (= (and b!138586 res!66273) b!138611))

(assert (= (and b!138597 c!25978) b!138592))

(assert (= (and b!138597 (not c!25978)) b!138619))

(assert (= (and b!138592 res!66271) b!138588))

(assert (= (and b!138588 res!66283) b!138614))

(assert (= (or b!138594 b!138592) bm!15242))

(assert (= (or b!138611 b!138614) bm!15224))

(assert (= (or b!138616 bm!15242) bm!15223))

(assert (= (or b!138599 b!138605) bm!15233))

(assert (= (or b!138595 b!138622) bm!15230))

(assert (= (or b!138606 b!138605) bm!15226))

(assert (= (or b!138602 b!138618) bm!15235))

(assert (= (or bm!15234 bm!15224) bm!15222))

(assert (= (or b!138591 b!138599) bm!15238))

(assert (= (or bm!15241 bm!15223) bm!15227))

(assert (= (or bm!15237 bm!15233) bm!15243))

(assert (= (or b!138602 b!138618) bm!15245))

(assert (= (and bm!15245 c!25986) b!138617))

(assert (= (and bm!15245 (not c!25986)) b!138624))

(assert (= (or bm!15236 b!138618) bm!15244))

(assert (= (or bm!15225 bm!15235) bm!15239))

(assert (= (or bm!15231 b!138618) bm!15229))

(assert (= (and bm!15229 c!25982) b!138609))

(assert (= (and bm!15229 (not c!25982)) b!138600))

(assert (= (and d!43355 res!66282) b!138623))

(assert (= (and b!138623 c!25981) b!138604))

(assert (= (and b!138623 (not c!25981)) b!138598))

(assert (= (and b!138604 res!66270) b!138585))

(assert (= (or b!138604 b!138585 b!138598) bm!15228))

(assert (= (or b!138585 b!138598) bm!15232))

(assert (=> b!138620 m!165193))

(declare-fun m!165321 () Bool)

(assert (=> b!138620 m!165321))

(assert (=> b!138593 m!165195))

(declare-fun m!165323 () Bool)

(assert (=> b!138593 m!165323))

(declare-fun m!165325 () Bool)

(assert (=> b!138600 m!165325))

(declare-fun m!165327 () Bool)

(assert (=> b!138588 m!165327))

(declare-fun m!165329 () Bool)

(assert (=> b!138618 m!165329))

(assert (=> b!138618 m!165195))

(assert (=> b!138618 m!165193))

(declare-fun m!165331 () Bool)

(assert (=> b!138618 m!165331))

(declare-fun m!165333 () Bool)

(assert (=> b!138618 m!165333))

(declare-fun m!165335 () Bool)

(assert (=> b!138618 m!165335))

(assert (=> b!138618 m!165329))

(declare-fun m!165337 () Bool)

(assert (=> b!138618 m!165337))

(declare-fun m!165339 () Bool)

(assert (=> d!43355 m!165339))

(assert (=> d!43355 m!165213))

(assert (=> bm!15222 m!165195))

(declare-fun m!165341 () Bool)

(assert (=> bm!15222 m!165341))

(assert (=> b!138612 m!165193))

(declare-fun m!165343 () Bool)

(assert (=> b!138612 m!165343))

(assert (=> b!138604 m!165195))

(declare-fun m!165345 () Bool)

(assert (=> b!138604 m!165345))

(assert (=> bm!15232 m!165201))

(declare-fun m!165347 () Bool)

(assert (=> b!138585 m!165347))

(assert (=> bm!15238 m!165195))

(declare-fun m!165349 () Bool)

(assert (=> bm!15238 m!165349))

(assert (=> b!138624 m!165325))

(assert (=> bm!15230 m!165195))

(assert (=> bm!15230 m!165193))

(declare-fun m!165351 () Bool)

(assert (=> bm!15230 m!165351))

(declare-fun m!165353 () Bool)

(assert (=> bm!15228 m!165353))

(declare-fun m!165355 () Bool)

(assert (=> bm!15229 m!165355))

(assert (=> bm!15243 m!165195))

(assert (=> bm!15243 m!165323))

(declare-fun m!165357 () Bool)

(assert (=> b!138589 m!165357))

(assert (=> bm!15226 m!165195))

(declare-fun m!165359 () Bool)

(assert (=> bm!15226 m!165359))

(assert (=> bm!15244 m!165333))

(declare-fun m!165361 () Bool)

(assert (=> bm!15244 m!165361))

(declare-fun m!165363 () Bool)

(assert (=> b!138586 m!165363))

(declare-fun m!165365 () Bool)

(assert (=> bm!15227 m!165365))

(declare-fun m!165367 () Bool)

(assert (=> b!138621 m!165367))

(declare-fun m!165369 () Bool)

(assert (=> bm!15239 m!165369))

(assert (=> bm!15245 m!165195))

(declare-fun m!165371 () Bool)

(assert (=> bm!15245 m!165371))

(declare-fun m!165373 () Bool)

(assert (=> b!138613 m!165373))

(declare-fun m!165375 () Bool)

(assert (=> b!138603 m!165375))

(assert (=> b!138353 d!43355))

(declare-fun d!43357 () Bool)

(declare-fun c!25990 () Bool)

(assert (=> d!43357 (= c!25990 ((_ is ValueCellFull!1112) (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-fun e!90342 () V!3529)

(assert (=> d!43357 (= (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!90342)))

(declare-fun b!138629 () Bool)

(declare-fun get!1509 (ValueCell!1112 V!3529) V!3529)

(assert (=> b!138629 (= e!90342 (get!1509 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!138630 () Bool)

(declare-fun get!1510 (ValueCell!1112 V!3529) V!3529)

(assert (=> b!138630 (= e!90342 (get!1510 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43357 c!25990) b!138629))

(assert (= (and d!43357 (not c!25990)) b!138630))

(assert (=> b!138629 m!165189))

(assert (=> b!138629 m!165191))

(declare-fun m!165377 () Bool)

(assert (=> b!138629 m!165377))

(assert (=> b!138630 m!165189))

(assert (=> b!138630 m!165191))

(declare-fun m!165379 () Bool)

(assert (=> b!138630 m!165379))

(assert (=> b!138353 d!43357))

(declare-fun d!43359 () Bool)

(assert (=> d!43359 (= (array_inv!1457 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvsge (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!138344 d!43359))

(declare-fun d!43361 () Bool)

(assert (=> d!43361 (= (array_inv!1458 (_values!2901 (v!3248 (underlying!468 thiss!992)))) (bvsge (size!2557 (_values!2901 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!138344 d!43361))

(declare-fun d!43363 () Bool)

(declare-fun res!66288 () Bool)

(declare-fun e!90347 () Bool)

(assert (=> d!43363 (=> res!66288 e!90347)))

(assert (=> d!43363 (= res!66288 (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(assert (=> d!43363 (= (arrayContainsKey!0 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!90347)))

(declare-fun b!138635 () Bool)

(declare-fun e!90348 () Bool)

(assert (=> b!138635 (= e!90347 e!90348)))

(declare-fun res!66289 () Bool)

(assert (=> b!138635 (=> (not res!66289) (not e!90348))))

(assert (=> b!138635 (= res!66289 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))))))

(declare-fun b!138636 () Bool)

(assert (=> b!138636 (= e!90348 (arrayContainsKey!0 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!43363 (not res!66288)) b!138635))

(assert (= (and b!138635 res!66289) b!138636))

(declare-fun m!165381 () Bool)

(assert (=> d!43363 m!165381))

(assert (=> b!138636 m!165195))

(declare-fun m!165383 () Bool)

(assert (=> b!138636 m!165383))

(assert (=> b!138348 d!43363))

(declare-fun d!43365 () Bool)

(declare-fun e!90351 () Bool)

(assert (=> d!43365 e!90351))

(declare-fun c!25993 () Bool)

(assert (=> d!43365 (= c!25993 (and (not (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!72279 () Unit!4358)

(declare-fun choose!851 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 64) (_ BitVec 32) Int) Unit!4358)

(assert (=> d!43365 (= lt!72279 (choose!851 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (_values!2901 (v!3248 (underlying!468 thiss!992))) (mask!7247 (v!3248 (underlying!468 thiss!992))) (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) (minValue!2769 (v!3248 (underlying!468 thiss!992))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!43365 (validMask!0 (mask!7247 (v!3248 (underlying!468 thiss!992))))))

(assert (=> d!43365 (= (lemmaListMapContainsThenArrayContainsFrom!137 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (_values!2901 (v!3248 (underlying!468 thiss!992))) (mask!7247 (v!3248 (underlying!468 thiss!992))) (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) (minValue!2769 (v!3248 (underlying!468 thiss!992))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992)))) lt!72279)))

(declare-fun b!138641 () Bool)

(assert (=> b!138641 (= e!90351 (arrayContainsKey!0 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!138642 () Bool)

(assert (=> b!138642 (= e!90351 (ite (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!43365 c!25993) b!138641))

(assert (= (and d!43365 (not c!25993)) b!138642))

(assert (=> d!43365 m!165195))

(declare-fun m!165385 () Bool)

(assert (=> d!43365 m!165385))

(declare-fun m!165387 () Bool)

(assert (=> d!43365 m!165387))

(assert (=> b!138641 m!165195))

(assert (=> b!138641 m!165207))

(assert (=> b!138348 d!43365))

(declare-fun d!43367 () Bool)

(assert (=> d!43367 (= (map!1411 newMap!16) (getCurrentListMap!527 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun bs!5794 () Bool)

(assert (= bs!5794 d!43367))

(assert (=> bs!5794 m!165325))

(assert (=> b!138355 d!43367))

(declare-fun bm!15260 () Bool)

(declare-fun call!15266 () ListLongMap!1695)

(declare-fun getCurrentListMapNoExtraKeys!130 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 32) Int) ListLongMap!1695)

(assert (=> bm!15260 (= call!15266 (getCurrentListMapNoExtraKeys!130 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (_values!2901 (v!3248 (underlying!468 thiss!992))) (mask!7247 (v!3248 (underlying!468 thiss!992))) (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) (minValue!2769 (v!3248 (underlying!468 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun b!138685 () Bool)

(declare-fun e!90386 () ListLongMap!1695)

(declare-fun call!15263 () ListLongMap!1695)

(assert (=> b!138685 (= e!90386 call!15263)))

(declare-fun b!138686 () Bool)

(declare-fun e!90383 () ListLongMap!1695)

(declare-fun call!15264 () ListLongMap!1695)

(assert (=> b!138686 (= e!90383 call!15264)))

(declare-fun call!15268 () ListLongMap!1695)

(declare-fun call!15265 () ListLongMap!1695)

(declare-fun c!26006 () Bool)

(declare-fun bm!15261 () Bool)

(declare-fun c!26009 () Bool)

(assert (=> bm!15261 (= call!15265 (+!165 (ite c!26009 call!15266 (ite c!26006 call!15268 call!15263)) (ite (or c!26009 c!26006) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(declare-fun b!138687 () Bool)

(declare-fun e!90389 () Bool)

(declare-fun e!90384 () Bool)

(assert (=> b!138687 (= e!90389 e!90384)))

(declare-fun res!66311 () Bool)

(declare-fun call!15269 () Bool)

(assert (=> b!138687 (= res!66311 call!15269)))

(assert (=> b!138687 (=> (not res!66311) (not e!90384))))

(declare-fun b!138688 () Bool)

(declare-fun e!90385 () ListLongMap!1695)

(assert (=> b!138688 (= e!90385 (+!165 call!15265 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992))))))))

(declare-fun b!138689 () Bool)

(assert (=> b!138689 (= e!90386 call!15264)))

(declare-fun bm!15262 () Bool)

(assert (=> bm!15262 (= call!15263 call!15268)))

(declare-fun d!43369 () Bool)

(declare-fun e!90381 () Bool)

(assert (=> d!43369 e!90381))

(declare-fun res!66313 () Bool)

(assert (=> d!43369 (=> (not res!66313) (not e!90381))))

(assert (=> d!43369 (= res!66313 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))))))))

(declare-fun lt!72331 () ListLongMap!1695)

(declare-fun lt!72326 () ListLongMap!1695)

(assert (=> d!43369 (= lt!72331 lt!72326)))

(declare-fun lt!72341 () Unit!4358)

(declare-fun e!90388 () Unit!4358)

(assert (=> d!43369 (= lt!72341 e!90388)))

(declare-fun c!26007 () Bool)

(declare-fun e!90390 () Bool)

(assert (=> d!43369 (= c!26007 e!90390)))

(declare-fun res!66309 () Bool)

(assert (=> d!43369 (=> (not res!66309) (not e!90390))))

(assert (=> d!43369 (= res!66309 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))))))

(assert (=> d!43369 (= lt!72326 e!90385)))

(assert (=> d!43369 (= c!26009 (and (not (= (bvand (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!43369 (validMask!0 (mask!7247 (v!3248 (underlying!468 thiss!992))))))

(assert (=> d!43369 (= (getCurrentListMap!527 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (_values!2901 (v!3248 (underlying!468 thiss!992))) (mask!7247 (v!3248 (underlying!468 thiss!992))) (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) (minValue!2769 (v!3248 (underlying!468 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992)))) lt!72331)))

(declare-fun b!138690 () Bool)

(declare-fun res!66316 () Bool)

(assert (=> b!138690 (=> (not res!66316) (not e!90381))))

(assert (=> b!138690 (= res!66316 e!90389)))

(declare-fun c!26011 () Bool)

(assert (=> b!138690 (= c!26011 (not (= (bvand (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!15263 () Bool)

(assert (=> bm!15263 (= call!15264 call!15265)))

(declare-fun b!138691 () Bool)

(declare-fun e!90379 () Bool)

(declare-fun e!90382 () Bool)

(assert (=> b!138691 (= e!90379 e!90382)))

(declare-fun res!66314 () Bool)

(declare-fun call!15267 () Bool)

(assert (=> b!138691 (= res!66314 call!15267)))

(assert (=> b!138691 (=> (not res!66314) (not e!90382))))

(declare-fun b!138692 () Bool)

(declare-fun e!90378 () Bool)

(assert (=> b!138692 (= e!90378 (validKeyInArray!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!138693 () Bool)

(declare-fun Unit!4365 () Unit!4358)

(assert (=> b!138693 (= e!90388 Unit!4365)))

(declare-fun b!138694 () Bool)

(assert (=> b!138694 (= e!90385 e!90383)))

(assert (=> b!138694 (= c!26006 (and (not (= (bvand (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!138695 () Bool)

(declare-fun lt!72327 () Unit!4358)

(assert (=> b!138695 (= e!90388 lt!72327)))

(declare-fun lt!72329 () ListLongMap!1695)

(assert (=> b!138695 (= lt!72329 (getCurrentListMapNoExtraKeys!130 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (_values!2901 (v!3248 (underlying!468 thiss!992))) (mask!7247 (v!3248 (underlying!468 thiss!992))) (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) (minValue!2769 (v!3248 (underlying!468 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun lt!72324 () (_ BitVec 64))

(assert (=> b!138695 (= lt!72324 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72328 () (_ BitVec 64))

(assert (=> b!138695 (= lt!72328 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72337 () Unit!4358)

(declare-fun addStillContains!94 (ListLongMap!1695 (_ BitVec 64) V!3529 (_ BitVec 64)) Unit!4358)

(assert (=> b!138695 (= lt!72337 (addStillContains!94 lt!72329 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) lt!72328))))

(assert (=> b!138695 (contains!902 (+!165 lt!72329 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72328)))

(declare-fun lt!72344 () Unit!4358)

(assert (=> b!138695 (= lt!72344 lt!72337)))

(declare-fun lt!72333 () ListLongMap!1695)

(assert (=> b!138695 (= lt!72333 (getCurrentListMapNoExtraKeys!130 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (_values!2901 (v!3248 (underlying!468 thiss!992))) (mask!7247 (v!3248 (underlying!468 thiss!992))) (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) (minValue!2769 (v!3248 (underlying!468 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun lt!72342 () (_ BitVec 64))

(assert (=> b!138695 (= lt!72342 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72325 () (_ BitVec 64))

(assert (=> b!138695 (= lt!72325 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72340 () Unit!4358)

(declare-fun addApplyDifferent!94 (ListLongMap!1695 (_ BitVec 64) V!3529 (_ BitVec 64)) Unit!4358)

(assert (=> b!138695 (= lt!72340 (addApplyDifferent!94 lt!72333 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992))) lt!72325))))

(declare-fun apply!118 (ListLongMap!1695 (_ BitVec 64)) V!3529)

(assert (=> b!138695 (= (apply!118 (+!165 lt!72333 (tuple2!2631 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72325) (apply!118 lt!72333 lt!72325))))

(declare-fun lt!72330 () Unit!4358)

(assert (=> b!138695 (= lt!72330 lt!72340)))

(declare-fun lt!72338 () ListLongMap!1695)

(assert (=> b!138695 (= lt!72338 (getCurrentListMapNoExtraKeys!130 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (_values!2901 (v!3248 (underlying!468 thiss!992))) (mask!7247 (v!3248 (underlying!468 thiss!992))) (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) (minValue!2769 (v!3248 (underlying!468 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun lt!72343 () (_ BitVec 64))

(assert (=> b!138695 (= lt!72343 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72335 () (_ BitVec 64))

(assert (=> b!138695 (= lt!72335 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72336 () Unit!4358)

(assert (=> b!138695 (= lt!72336 (addApplyDifferent!94 lt!72338 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) lt!72335))))

(assert (=> b!138695 (= (apply!118 (+!165 lt!72338 (tuple2!2631 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72335) (apply!118 lt!72338 lt!72335))))

(declare-fun lt!72339 () Unit!4358)

(assert (=> b!138695 (= lt!72339 lt!72336)))

(declare-fun lt!72332 () ListLongMap!1695)

(assert (=> b!138695 (= lt!72332 (getCurrentListMapNoExtraKeys!130 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (_values!2901 (v!3248 (underlying!468 thiss!992))) (mask!7247 (v!3248 (underlying!468 thiss!992))) (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) (minValue!2769 (v!3248 (underlying!468 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun lt!72345 () (_ BitVec 64))

(assert (=> b!138695 (= lt!72345 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72334 () (_ BitVec 64))

(assert (=> b!138695 (= lt!72334 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!138695 (= lt!72327 (addApplyDifferent!94 lt!72332 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992))) lt!72334))))

(assert (=> b!138695 (= (apply!118 (+!165 lt!72332 (tuple2!2631 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72334) (apply!118 lt!72332 lt!72334))))

(declare-fun bm!15264 () Bool)

(assert (=> bm!15264 (= call!15267 (contains!902 lt!72331 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15265 () Bool)

(assert (=> bm!15265 (= call!15269 (contains!902 lt!72331 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138696 () Bool)

(declare-fun c!26010 () Bool)

(assert (=> b!138696 (= c!26010 (and (not (= (bvand (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!138696 (= e!90383 e!90386)))

(declare-fun b!138697 () Bool)

(declare-fun e!90387 () Bool)

(declare-fun e!90380 () Bool)

(assert (=> b!138697 (= e!90387 e!90380)))

(declare-fun res!66312 () Bool)

(assert (=> b!138697 (=> (not res!66312) (not e!90380))))

(assert (=> b!138697 (= res!66312 (contains!902 lt!72331 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!138697 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))))))

(declare-fun b!138698 () Bool)

(assert (=> b!138698 (= e!90380 (= (apply!118 lt!72331 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138698 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2557 (_values!2901 (v!3248 (underlying!468 thiss!992))))))))

(assert (=> b!138698 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))))))

(declare-fun b!138699 () Bool)

(assert (=> b!138699 (= e!90382 (= (apply!118 lt!72331 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun b!138700 () Bool)

(assert (=> b!138700 (= e!90381 e!90379)))

(declare-fun c!26008 () Bool)

(assert (=> b!138700 (= c!26008 (not (= (bvand (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15266 () Bool)

(assert (=> bm!15266 (= call!15268 call!15266)))

(declare-fun b!138701 () Bool)

(assert (=> b!138701 (= e!90389 (not call!15269))))

(declare-fun b!138702 () Bool)

(assert (=> b!138702 (= e!90379 (not call!15267))))

(declare-fun b!138703 () Bool)

(assert (=> b!138703 (= e!90384 (= (apply!118 lt!72331 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun b!138704 () Bool)

(assert (=> b!138704 (= e!90390 (validKeyInArray!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!138705 () Bool)

(declare-fun res!66310 () Bool)

(assert (=> b!138705 (=> (not res!66310) (not e!90381))))

(assert (=> b!138705 (= res!66310 e!90387)))

(declare-fun res!66315 () Bool)

(assert (=> b!138705 (=> res!66315 e!90387)))

(assert (=> b!138705 (= res!66315 (not e!90378))))

(declare-fun res!66308 () Bool)

(assert (=> b!138705 (=> (not res!66308) (not e!90378))))

(assert (=> b!138705 (= res!66308 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))))))

(assert (= (and d!43369 c!26009) b!138688))

(assert (= (and d!43369 (not c!26009)) b!138694))

(assert (= (and b!138694 c!26006) b!138686))

(assert (= (and b!138694 (not c!26006)) b!138696))

(assert (= (and b!138696 c!26010) b!138689))

(assert (= (and b!138696 (not c!26010)) b!138685))

(assert (= (or b!138689 b!138685) bm!15262))

(assert (= (or b!138686 bm!15262) bm!15266))

(assert (= (or b!138686 b!138689) bm!15263))

(assert (= (or b!138688 bm!15266) bm!15260))

(assert (= (or b!138688 bm!15263) bm!15261))

(assert (= (and d!43369 res!66309) b!138704))

(assert (= (and d!43369 c!26007) b!138695))

(assert (= (and d!43369 (not c!26007)) b!138693))

(assert (= (and d!43369 res!66313) b!138705))

(assert (= (and b!138705 res!66308) b!138692))

(assert (= (and b!138705 (not res!66315)) b!138697))

(assert (= (and b!138697 res!66312) b!138698))

(assert (= (and b!138705 res!66310) b!138690))

(assert (= (and b!138690 c!26011) b!138687))

(assert (= (and b!138690 (not c!26011)) b!138701))

(assert (= (and b!138687 res!66311) b!138703))

(assert (= (or b!138687 b!138701) bm!15265))

(assert (= (and b!138690 res!66316) b!138700))

(assert (= (and b!138700 c!26008) b!138691))

(assert (= (and b!138700 (not c!26008)) b!138702))

(assert (= (and b!138691 res!66314) b!138699))

(assert (= (or b!138691 b!138702) bm!15264))

(declare-fun b_lambda!6193 () Bool)

(assert (=> (not b_lambda!6193) (not b!138698)))

(assert (=> b!138698 t!6257))

(declare-fun b_and!8617 () Bool)

(assert (= b_and!8597 (and (=> t!6257 result!4105) b_and!8617)))

(assert (=> b!138698 t!6259))

(declare-fun b_and!8619 () Bool)

(assert (= b_and!8599 (and (=> t!6259 result!4109) b_and!8619)))

(declare-fun m!165389 () Bool)

(assert (=> b!138703 m!165389))

(assert (=> b!138692 m!165381))

(assert (=> b!138692 m!165381))

(declare-fun m!165391 () Bool)

(assert (=> b!138692 m!165391))

(declare-fun m!165393 () Bool)

(assert (=> bm!15261 m!165393))

(declare-fun m!165395 () Bool)

(assert (=> bm!15260 m!165395))

(assert (=> d!43369 m!165387))

(declare-fun m!165397 () Bool)

(assert (=> b!138699 m!165397))

(declare-fun m!165399 () Bool)

(assert (=> b!138695 m!165399))

(declare-fun m!165401 () Bool)

(assert (=> b!138695 m!165401))

(declare-fun m!165403 () Bool)

(assert (=> b!138695 m!165403))

(declare-fun m!165405 () Bool)

(assert (=> b!138695 m!165405))

(assert (=> b!138695 m!165381))

(declare-fun m!165407 () Bool)

(assert (=> b!138695 m!165407))

(declare-fun m!165409 () Bool)

(assert (=> b!138695 m!165409))

(declare-fun m!165411 () Bool)

(assert (=> b!138695 m!165411))

(assert (=> b!138695 m!165407))

(declare-fun m!165413 () Bool)

(assert (=> b!138695 m!165413))

(declare-fun m!165415 () Bool)

(assert (=> b!138695 m!165415))

(declare-fun m!165417 () Bool)

(assert (=> b!138695 m!165417))

(assert (=> b!138695 m!165409))

(assert (=> b!138695 m!165403))

(assert (=> b!138695 m!165401))

(declare-fun m!165419 () Bool)

(assert (=> b!138695 m!165419))

(assert (=> b!138695 m!165395))

(declare-fun m!165421 () Bool)

(assert (=> b!138695 m!165421))

(declare-fun m!165423 () Bool)

(assert (=> b!138695 m!165423))

(declare-fun m!165425 () Bool)

(assert (=> b!138695 m!165425))

(declare-fun m!165427 () Bool)

(assert (=> b!138695 m!165427))

(assert (=> b!138704 m!165381))

(assert (=> b!138704 m!165381))

(assert (=> b!138704 m!165391))

(declare-fun m!165429 () Bool)

(assert (=> bm!15264 m!165429))

(assert (=> b!138698 m!165381))

(declare-fun m!165431 () Bool)

(assert (=> b!138698 m!165431))

(assert (=> b!138698 m!165191))

(declare-fun m!165433 () Bool)

(assert (=> b!138698 m!165433))

(assert (=> b!138698 m!165431))

(assert (=> b!138698 m!165191))

(assert (=> b!138698 m!165381))

(declare-fun m!165435 () Bool)

(assert (=> b!138698 m!165435))

(declare-fun m!165437 () Bool)

(assert (=> bm!15265 m!165437))

(assert (=> b!138697 m!165381))

(assert (=> b!138697 m!165381))

(declare-fun m!165439 () Bool)

(assert (=> b!138697 m!165439))

(declare-fun m!165441 () Bool)

(assert (=> b!138688 m!165441))

(assert (=> b!138355 d!43369))

(declare-fun d!43371 () Bool)

(assert (=> d!43371 (= (valid!549 thiss!992) (valid!550 (v!3248 (underlying!468 thiss!992))))))

(declare-fun bs!5795 () Bool)

(assert (= bs!5795 d!43371))

(declare-fun m!165443 () Bool)

(assert (=> bs!5795 m!165443))

(assert (=> start!14590 d!43371))

(declare-fun d!43373 () Bool)

(assert (=> d!43373 (= (array_inv!1457 (_keys!4674 newMap!16)) (bvsge (size!2556 (_keys!4674 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138351 d!43373))

(declare-fun d!43375 () Bool)

(assert (=> d!43375 (= (array_inv!1458 (_values!2901 newMap!16)) (bvsge (size!2557 (_values!2901 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138351 d!43375))

(declare-fun b!138712 () Bool)

(declare-fun e!90396 () Bool)

(assert (=> b!138712 (= e!90396 tp_is_empty!2911)))

(declare-fun condMapEmpty!4779 () Bool)

(declare-fun mapDefault!4779 () ValueCell!1112)

(assert (=> mapNonEmpty!4764 (= condMapEmpty!4779 (= mapRest!4764 ((as const (Array (_ BitVec 32) ValueCell!1112)) mapDefault!4779)))))

(declare-fun e!90395 () Bool)

(declare-fun mapRes!4779 () Bool)

(assert (=> mapNonEmpty!4764 (= tp!11430 (and e!90395 mapRes!4779))))

(declare-fun mapNonEmpty!4779 () Bool)

(declare-fun tp!11457 () Bool)

(assert (=> mapNonEmpty!4779 (= mapRes!4779 (and tp!11457 e!90396))))

(declare-fun mapRest!4779 () (Array (_ BitVec 32) ValueCell!1112))

(declare-fun mapKey!4779 () (_ BitVec 32))

(declare-fun mapValue!4779 () ValueCell!1112)

(assert (=> mapNonEmpty!4779 (= mapRest!4764 (store mapRest!4779 mapKey!4779 mapValue!4779))))

(declare-fun mapIsEmpty!4779 () Bool)

(assert (=> mapIsEmpty!4779 mapRes!4779))

(declare-fun b!138713 () Bool)

(assert (=> b!138713 (= e!90395 tp_is_empty!2911)))

(assert (= (and mapNonEmpty!4764 condMapEmpty!4779) mapIsEmpty!4779))

(assert (= (and mapNonEmpty!4764 (not condMapEmpty!4779)) mapNonEmpty!4779))

(assert (= (and mapNonEmpty!4779 ((_ is ValueCellFull!1112) mapValue!4779)) b!138712))

(assert (= (and mapNonEmpty!4764 ((_ is ValueCellFull!1112) mapDefault!4779)) b!138713))

(declare-fun m!165445 () Bool)

(assert (=> mapNonEmpty!4779 m!165445))

(declare-fun b!138714 () Bool)

(declare-fun e!90398 () Bool)

(assert (=> b!138714 (= e!90398 tp_is_empty!2911)))

(declare-fun condMapEmpty!4780 () Bool)

(declare-fun mapDefault!4780 () ValueCell!1112)

(assert (=> mapNonEmpty!4763 (= condMapEmpty!4780 (= mapRest!4763 ((as const (Array (_ BitVec 32) ValueCell!1112)) mapDefault!4780)))))

(declare-fun e!90397 () Bool)

(declare-fun mapRes!4780 () Bool)

(assert (=> mapNonEmpty!4763 (= tp!11427 (and e!90397 mapRes!4780))))

(declare-fun mapNonEmpty!4780 () Bool)

(declare-fun tp!11458 () Bool)

(assert (=> mapNonEmpty!4780 (= mapRes!4780 (and tp!11458 e!90398))))

(declare-fun mapRest!4780 () (Array (_ BitVec 32) ValueCell!1112))

(declare-fun mapKey!4780 () (_ BitVec 32))

(declare-fun mapValue!4780 () ValueCell!1112)

(assert (=> mapNonEmpty!4780 (= mapRest!4763 (store mapRest!4780 mapKey!4780 mapValue!4780))))

(declare-fun mapIsEmpty!4780 () Bool)

(assert (=> mapIsEmpty!4780 mapRes!4780))

(declare-fun b!138715 () Bool)

(assert (=> b!138715 (= e!90397 tp_is_empty!2911)))

(assert (= (and mapNonEmpty!4763 condMapEmpty!4780) mapIsEmpty!4780))

(assert (= (and mapNonEmpty!4763 (not condMapEmpty!4780)) mapNonEmpty!4780))

(assert (= (and mapNonEmpty!4780 ((_ is ValueCellFull!1112) mapValue!4780)) b!138714))

(assert (= (and mapNonEmpty!4763 ((_ is ValueCellFull!1112) mapDefault!4780)) b!138715))

(declare-fun m!165447 () Bool)

(assert (=> mapNonEmpty!4780 m!165447))

(declare-fun b_lambda!6195 () Bool)

(assert (= b_lambda!6193 (or (and b!138344 b_free!2989) (and b!138351 b_free!2991 (= (defaultEntry!2918 newMap!16) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))))) b_lambda!6195)))

(check-sat (not bm!15243) (not bm!15265) (not bm!15230) (not b_lambda!6191) (not b!138604) (not bm!15222) (not b!138697) (not bm!15238) (not d!43355) (not b!138496) (not b!138641) tp_is_empty!2911 (not b!138498) (not d!43353) (not bm!15264) b_and!8619 (not b!138704) (not b!138698) (not bm!15261) (not d!43365) (not b!138688) (not b!138629) (not b!138699) (not d!43349) (not bm!15232) (not b!138692) (not bm!15173) (not b!138612) (not b!138636) (not d!43371) (not b!138473) (not bm!15245) (not b!138630) (not b!138600) (not d!43367) (not bm!15228) (not bm!15229) (not mapNonEmpty!4780) (not b!138620) (not b!138703) (not bm!15226) (not b!138593) (not bm!15244) (not b!138618) (not bm!15239) b_and!8617 (not b_next!2989) (not b!138487) (not b!138486) (not bm!15227) (not b!138472) (not b!138474) (not d!43369) (not b_next!2991) (not mapNonEmpty!4779) (not b!138624) (not b!138488) (not b!138585) (not b_lambda!6195) (not b!138695) (not bm!15260))
(check-sat b_and!8617 b_and!8619 (not b_next!2989) (not b_next!2991))
(get-model)

(declare-fun d!43377 () Bool)

(declare-fun e!90401 () Bool)

(assert (=> d!43377 e!90401))

(declare-fun res!66322 () Bool)

(assert (=> d!43377 (=> (not res!66322) (not e!90401))))

(declare-fun lt!72355 () ListLongMap!1695)

(assert (=> d!43377 (= res!66322 (contains!902 lt!72355 (_1!1326 (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!72356 () List!1726)

(assert (=> d!43377 (= lt!72355 (ListLongMap!1696 lt!72356))))

(declare-fun lt!72354 () Unit!4358)

(declare-fun lt!72357 () Unit!4358)

(assert (=> d!43377 (= lt!72354 lt!72357)))

(assert (=> d!43377 (= (getValueByKey!172 lt!72356 (_1!1326 (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!177 (_2!1326 (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!90 (List!1726 (_ BitVec 64) V!3529) Unit!4358)

(assert (=> d!43377 (= lt!72357 (lemmaContainsTupThenGetReturnValue!90 lt!72356 (_1!1326 (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1326 (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!93 (List!1726 (_ BitVec 64) V!3529) List!1726)

(assert (=> d!43377 (= lt!72356 (insertStrictlySorted!93 (toList!863 call!15231) (_1!1326 (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1326 (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!43377 (= (+!165 call!15231 (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!72355)))

(declare-fun b!138720 () Bool)

(declare-fun res!66321 () Bool)

(assert (=> b!138720 (=> (not res!66321) (not e!90401))))

(assert (=> b!138720 (= res!66321 (= (getValueByKey!172 (toList!863 lt!72355) (_1!1326 (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!177 (_2!1326 (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!138721 () Bool)

(declare-fun contains!905 (List!1726 tuple2!2630) Bool)

(assert (=> b!138721 (= e!90401 (contains!905 (toList!863 lt!72355) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!43377 res!66322) b!138720))

(assert (= (and b!138720 res!66321) b!138721))

(declare-fun m!165449 () Bool)

(assert (=> d!43377 m!165449))

(declare-fun m!165451 () Bool)

(assert (=> d!43377 m!165451))

(declare-fun m!165453 () Bool)

(assert (=> d!43377 m!165453))

(declare-fun m!165455 () Bool)

(assert (=> d!43377 m!165455))

(declare-fun m!165457 () Bool)

(assert (=> b!138720 m!165457))

(declare-fun m!165459 () Bool)

(assert (=> b!138721 m!165459))

(assert (=> b!138585 d!43377))

(declare-fun d!43379 () Bool)

(declare-fun e!90425 () Bool)

(assert (=> d!43379 e!90425))

(declare-fun res!66349 () Bool)

(assert (=> d!43379 (=> (not res!66349) (not e!90425))))

(declare-fun lt!72437 () tuple2!2632)

(assert (=> d!43379 (= res!66349 (_1!1327 lt!72437))))

(assert (=> d!43379 (= lt!72437 (tuple2!2633 true (LongMapFixedSize!1133 (defaultEntry!2918 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (bvadd (_size!615 newMap!16) #b00000000000000000000000000000001) (array!4834 (store (arr!2284 (_keys!4674 newMap!16)) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) (size!2556 (_keys!4674 newMap!16))) (array!4836 (store (arr!2285 (_values!2901 newMap!16)) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (ValueCellFull!1112 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2557 (_values!2901 newMap!16))) (_vacant!615 newMap!16))))))

(declare-fun lt!72425 () Unit!4358)

(declare-fun lt!72429 () Unit!4358)

(assert (=> d!43379 (= lt!72425 lt!72429)))

(declare-fun lt!72428 () array!4835)

(declare-fun lt!72435 () array!4833)

(assert (=> d!43379 (contains!902 (getCurrentListMap!527 lt!72435 lt!72428 (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (select (store (arr!2284 (_keys!4674 newMap!16)) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267))))))

(assert (=> d!43379 (= lt!72429 (lemmaValidKeyInArrayIsInListMap!122 lt!72435 lt!72428 (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (defaultEntry!2918 newMap!16)))))

(assert (=> d!43379 (= lt!72428 (array!4836 (store (arr!2285 (_values!2901 newMap!16)) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (ValueCellFull!1112 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2557 (_values!2901 newMap!16))))))

(assert (=> d!43379 (= lt!72435 (array!4834 (store (arr!2284 (_keys!4674 newMap!16)) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) (size!2556 (_keys!4674 newMap!16))))))

(declare-fun lt!72441 () Unit!4358)

(declare-fun lt!72418 () Unit!4358)

(assert (=> d!43379 (= lt!72441 lt!72418)))

(declare-fun lt!72420 () array!4833)

(assert (=> d!43379 (= (arrayCountValidKeys!0 lt!72420 (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (bvadd (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4833 (_ BitVec 32)) Unit!4358)

(assert (=> d!43379 (= lt!72418 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!72420 (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267))))))

(assert (=> d!43379 (= lt!72420 (array!4834 (store (arr!2284 (_keys!4674 newMap!16)) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) (size!2556 (_keys!4674 newMap!16))))))

(declare-fun lt!72443 () Unit!4358)

(declare-fun lt!72430 () Unit!4358)

(assert (=> d!43379 (= lt!72443 lt!72430)))

(declare-fun lt!72438 () array!4833)

(assert (=> d!43379 (arrayContainsKey!0 lt!72438 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4833 (_ BitVec 64) (_ BitVec 32)) Unit!4358)

(assert (=> d!43379 (= lt!72430 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!72438 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267))))))

(assert (=> d!43379 (= lt!72438 (array!4834 (store (arr!2284 (_keys!4674 newMap!16)) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) (size!2556 (_keys!4674 newMap!16))))))

(declare-fun lt!72421 () Unit!4358)

(declare-fun lt!72432 () Unit!4358)

(assert (=> d!43379 (= lt!72421 lt!72432)))

(assert (=> d!43379 (= (+!165 (getCurrentListMap!527 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!527 (array!4834 (store (arr!2284 (_keys!4674 newMap!16)) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) (size!2556 (_keys!4674 newMap!16))) (array!4836 (store (arr!2285 (_values!2901 newMap!16)) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (ValueCellFull!1112 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2557 (_values!2901 newMap!16))) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!44 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 32) (_ BitVec 64) V!3529 Int) Unit!4358)

(assert (=> d!43379 (= lt!72432 (lemmaAddValidKeyToArrayThenAddPairToListMap!44 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72436 () Unit!4358)

(declare-fun lt!72422 () Unit!4358)

(assert (=> d!43379 (= lt!72436 lt!72422)))

(assert (=> d!43379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4834 (store (arr!2284 (_keys!4674 newMap!16)) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) (size!2556 (_keys!4674 newMap!16))) (mask!7247 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4833 (_ BitVec 32) (_ BitVec 32)) Unit!4358)

(assert (=> d!43379 (= lt!72422 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (_keys!4674 newMap!16) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (mask!7247 newMap!16)))))

(declare-fun lt!72424 () Unit!4358)

(declare-fun lt!72419 () Unit!4358)

(assert (=> d!43379 (= lt!72424 lt!72419)))

(assert (=> d!43379 (= (arrayCountValidKeys!0 (array!4834 (store (arr!2284 (_keys!4674 newMap!16)) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) (size!2556 (_keys!4674 newMap!16))) #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4674 newMap!16) #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4833 (_ BitVec 32) (_ BitVec 64)) Unit!4358)

(assert (=> d!43379 (= lt!72419 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4674 newMap!16) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-fun lt!72431 () Unit!4358)

(declare-fun lt!72426 () Unit!4358)

(assert (=> d!43379 (= lt!72431 lt!72426)))

(declare-fun lt!72434 () List!1725)

(declare-fun lt!72440 () (_ BitVec 32))

(assert (=> d!43379 (arrayNoDuplicates!0 (array!4834 (store (arr!2284 (_keys!4674 newMap!16)) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) (size!2556 (_keys!4674 newMap!16))) lt!72440 lt!72434)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4833 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1725) Unit!4358)

(assert (=> d!43379 (= lt!72426 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4674 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267)) lt!72440 lt!72434))))

(assert (=> d!43379 (= lt!72434 Nil!1722)))

(assert (=> d!43379 (= lt!72440 #b00000000000000000000000000000000)))

(declare-fun lt!72427 () Unit!4358)

(declare-fun e!90418 () Unit!4358)

(assert (=> d!43379 (= lt!72427 e!90418)))

(declare-fun c!26021 () Bool)

(assert (=> d!43379 (= c!26021 (arrayContainsKey!0 (_keys!4674 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!72442 () Unit!4358)

(declare-fun e!90422 () Unit!4358)

(assert (=> d!43379 (= lt!72442 e!90422)))

(declare-fun c!26020 () Bool)

(assert (=> d!43379 (= c!26020 (contains!902 (getCurrentListMap!527 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(assert (=> d!43379 (valid!550 newMap!16)))

(assert (=> d!43379 (= (updateHelperNewKey!63 newMap!16 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!25980 (index!3285 lt!72267) (index!3282 lt!72267))) lt!72437)))

(declare-fun b!138756 () Bool)

(assert (=> b!138756 (= e!90425 (= (map!1411 (_2!1327 lt!72437)) (+!165 (map!1411 newMap!16) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!138757 () Bool)

(declare-fun e!90421 () Bool)

(declare-fun call!15281 () Bool)

(assert (=> b!138757 (= e!90421 (not call!15281))))

(declare-fun b!138758 () Bool)

(declare-fun res!66348 () Bool)

(declare-fun call!15278 () Bool)

(assert (=> b!138758 (= res!66348 call!15278)))

(declare-fun e!90424 () Bool)

(assert (=> b!138758 (=> (not res!66348) (not e!90424))))

(declare-fun b!138759 () Bool)

(declare-fun lt!72433 () Unit!4358)

(assert (=> b!138759 (= e!90422 lt!72433)))

(assert (=> b!138759 (= lt!72433 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!63 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72439 () SeekEntryResult!280)

(declare-fun call!15279 () SeekEntryResult!280)

(assert (=> b!138759 (= lt!72439 call!15279)))

(declare-fun c!26022 () Bool)

(assert (=> b!138759 (= c!26022 ((_ is MissingZero!280) lt!72439))))

(declare-fun e!90420 () Bool)

(assert (=> b!138759 e!90420))

(declare-fun b!138760 () Bool)

(declare-fun res!66343 () Bool)

(declare-fun e!90419 () Bool)

(assert (=> b!138760 (=> (not res!66343) (not e!90419))))

(declare-fun call!15280 () Bool)

(assert (=> b!138760 (= res!66343 call!15280)))

(assert (=> b!138760 (= e!90420 e!90419)))

(declare-fun b!138761 () Bool)

(declare-fun e!90423 () Bool)

(assert (=> b!138761 (= e!90423 e!90421)))

(declare-fun res!66346 () Bool)

(assert (=> b!138761 (= res!66346 call!15280)))

(assert (=> b!138761 (=> (not res!66346) (not e!90421))))

(declare-fun lt!72446 () SeekEntryResult!280)

(declare-fun bm!15275 () Bool)

(assert (=> bm!15275 (= call!15278 (inRange!0 (ite c!26020 (index!3283 lt!72446) (ite c!26022 (index!3282 lt!72439) (index!3285 lt!72439))) (mask!7247 newMap!16)))))

(declare-fun b!138762 () Bool)

(declare-fun res!66345 () Bool)

(assert (=> b!138762 (= res!66345 (= (select (arr!2284 (_keys!4674 newMap!16)) (index!3285 lt!72439)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138762 (=> (not res!66345) (not e!90421))))

(declare-fun b!138763 () Bool)

(declare-fun c!26023 () Bool)

(assert (=> b!138763 (= c!26023 ((_ is MissingVacant!280) lt!72439))))

(assert (=> b!138763 (= e!90420 e!90423)))

(declare-fun b!138764 () Bool)

(declare-fun res!66347 () Bool)

(assert (=> b!138764 (=> (not res!66347) (not e!90419))))

(assert (=> b!138764 (= res!66347 (= (select (arr!2284 (_keys!4674 newMap!16)) (index!3282 lt!72439)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15276 () Bool)

(assert (=> bm!15276 (= call!15279 (seekEntryOrOpen!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (_keys!4674 newMap!16) (mask!7247 newMap!16)))))

(declare-fun b!138765 () Bool)

(declare-fun res!66344 () Bool)

(assert (=> b!138765 (=> (not res!66344) (not e!90425))))

(assert (=> b!138765 (= res!66344 (contains!902 (map!1411 (_2!1327 lt!72437)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-fun b!138766 () Bool)

(assert (=> b!138766 (= e!90423 ((_ is Undefined!280) lt!72439))))

(declare-fun b!138767 () Bool)

(assert (=> b!138767 (= e!90424 (= (select (arr!2284 (_keys!4674 newMap!16)) (index!3283 lt!72446)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-fun bm!15277 () Bool)

(assert (=> bm!15277 (= call!15280 call!15278)))

(declare-fun b!138768 () Bool)

(declare-fun res!66341 () Bool)

(assert (=> b!138768 (=> (not res!66341) (not e!90425))))

(assert (=> b!138768 (= res!66341 (valid!550 (_2!1327 lt!72437)))))

(declare-fun b!138769 () Bool)

(declare-fun Unit!4366 () Unit!4358)

(assert (=> b!138769 (= e!90418 Unit!4366)))

(declare-fun lt!72445 () Unit!4358)

(declare-fun lemmaArrayContainsKeyThenInListMap!44 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 64) (_ BitVec 32) Int) Unit!4358)

(assert (=> b!138769 (= lt!72445 (lemmaArrayContainsKeyThenInListMap!44 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(assert (=> b!138769 (contains!902 (getCurrentListMap!527 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355))))

(declare-fun lt!72444 () Unit!4358)

(assert (=> b!138769 (= lt!72444 lt!72445)))

(assert (=> b!138769 false))

(declare-fun bm!15278 () Bool)

(assert (=> bm!15278 (= call!15281 (arrayContainsKey!0 (_keys!4674 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!138770 () Bool)

(assert (=> b!138770 (= e!90419 (not call!15281))))

(declare-fun b!138771 () Bool)

(declare-fun Unit!4367 () Unit!4358)

(assert (=> b!138771 (= e!90422 Unit!4367)))

(declare-fun lt!72423 () Unit!4358)

(assert (=> b!138771 (= lt!72423 (lemmaInListMapThenSeekEntryOrOpenFindsIt!63 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)))))

(assert (=> b!138771 (= lt!72446 call!15279)))

(declare-fun res!66342 () Bool)

(assert (=> b!138771 (= res!66342 ((_ is Found!280) lt!72446))))

(assert (=> b!138771 (=> (not res!66342) (not e!90424))))

(assert (=> b!138771 e!90424))

(declare-fun lt!72447 () Unit!4358)

(assert (=> b!138771 (= lt!72447 lt!72423)))

(assert (=> b!138771 false))

(declare-fun b!138772 () Bool)

(declare-fun Unit!4368 () Unit!4358)

(assert (=> b!138772 (= e!90418 Unit!4368)))

(assert (= (and d!43379 c!26020) b!138771))

(assert (= (and d!43379 (not c!26020)) b!138759))

(assert (= (and b!138771 res!66342) b!138758))

(assert (= (and b!138758 res!66348) b!138767))

(assert (= (and b!138759 c!26022) b!138760))

(assert (= (and b!138759 (not c!26022)) b!138763))

(assert (= (and b!138760 res!66343) b!138764))

(assert (= (and b!138764 res!66347) b!138770))

(assert (= (and b!138763 c!26023) b!138761))

(assert (= (and b!138763 (not c!26023)) b!138766))

(assert (= (and b!138761 res!66346) b!138762))

(assert (= (and b!138762 res!66345) b!138757))

(assert (= (or b!138760 b!138761) bm!15277))

(assert (= (or b!138770 b!138757) bm!15278))

(assert (= (or b!138758 bm!15277) bm!15275))

(assert (= (or b!138771 b!138759) bm!15276))

(assert (= (and d!43379 c!26021) b!138769))

(assert (= (and d!43379 (not c!26021)) b!138772))

(assert (= (and d!43379 res!66349) b!138768))

(assert (= (and b!138768 res!66341) b!138765))

(assert (= (and b!138765 res!66344) b!138756))

(assert (=> b!138759 m!165195))

(assert (=> b!138759 m!165359))

(declare-fun m!165461 () Bool)

(assert (=> b!138764 m!165461))

(assert (=> bm!15276 m!165195))

(assert (=> bm!15276 m!165323))

(declare-fun m!165463 () Bool)

(assert (=> b!138762 m!165463))

(declare-fun m!165465 () Bool)

(assert (=> b!138765 m!165465))

(assert (=> b!138765 m!165465))

(assert (=> b!138765 m!165195))

(declare-fun m!165467 () Bool)

(assert (=> b!138765 m!165467))

(assert (=> b!138756 m!165465))

(assert (=> b!138756 m!165201))

(assert (=> b!138756 m!165201))

(declare-fun m!165469 () Bool)

(assert (=> b!138756 m!165469))

(assert (=> b!138771 m!165195))

(assert (=> b!138771 m!165349))

(declare-fun m!165471 () Bool)

(assert (=> bm!15275 m!165471))

(declare-fun m!165473 () Bool)

(assert (=> b!138767 m!165473))

(declare-fun m!165475 () Bool)

(assert (=> b!138768 m!165475))

(declare-fun m!165477 () Bool)

(assert (=> d!43379 m!165477))

(assert (=> d!43379 m!165325))

(assert (=> d!43379 m!165195))

(declare-fun m!165479 () Bool)

(assert (=> d!43379 m!165479))

(assert (=> d!43379 m!165195))

(declare-fun m!165481 () Bool)

(assert (=> d!43379 m!165481))

(assert (=> d!43379 m!165299))

(assert (=> d!43379 m!165195))

(assert (=> d!43379 m!165193))

(declare-fun m!165483 () Bool)

(assert (=> d!43379 m!165483))

(assert (=> d!43379 m!165213))

(declare-fun m!165485 () Bool)

(assert (=> d!43379 m!165485))

(declare-fun m!165487 () Bool)

(assert (=> d!43379 m!165487))

(declare-fun m!165489 () Bool)

(assert (=> d!43379 m!165489))

(declare-fun m!165491 () Bool)

(assert (=> d!43379 m!165491))

(assert (=> d!43379 m!165195))

(assert (=> d!43379 m!165341))

(assert (=> d!43379 m!165489))

(declare-fun m!165493 () Bool)

(assert (=> d!43379 m!165493))

(declare-fun m!165495 () Bool)

(assert (=> d!43379 m!165495))

(declare-fun m!165497 () Bool)

(assert (=> d!43379 m!165497))

(declare-fun m!165499 () Bool)

(assert (=> d!43379 m!165499))

(declare-fun m!165501 () Bool)

(assert (=> d!43379 m!165501))

(declare-fun m!165503 () Bool)

(assert (=> d!43379 m!165503))

(assert (=> d!43379 m!165493))

(assert (=> d!43379 m!165195))

(declare-fun m!165505 () Bool)

(assert (=> d!43379 m!165505))

(assert (=> d!43379 m!165325))

(declare-fun m!165507 () Bool)

(assert (=> d!43379 m!165507))

(assert (=> d!43379 m!165325))

(assert (=> d!43379 m!165195))

(declare-fun m!165509 () Bool)

(assert (=> d!43379 m!165509))

(assert (=> d!43379 m!165195))

(declare-fun m!165511 () Bool)

(assert (=> d!43379 m!165511))

(declare-fun m!165513 () Bool)

(assert (=> d!43379 m!165513))

(assert (=> d!43379 m!165195))

(declare-fun m!165515 () Bool)

(assert (=> d!43379 m!165515))

(assert (=> b!138769 m!165195))

(declare-fun m!165517 () Bool)

(assert (=> b!138769 m!165517))

(assert (=> b!138769 m!165325))

(assert (=> b!138769 m!165325))

(assert (=> b!138769 m!165195))

(assert (=> b!138769 m!165479))

(assert (=> bm!15278 m!165195))

(assert (=> bm!15278 m!165341))

(assert (=> bm!15230 d!43379))

(declare-fun d!43381 () Bool)

(declare-fun res!66354 () Bool)

(declare-fun e!90430 () Bool)

(assert (=> d!43381 (=> res!66354 e!90430)))

(assert (=> d!43381 (= res!66354 (and ((_ is Cons!1722) (toList!863 lt!72157)) (= (_1!1326 (h!2329 (toList!863 lt!72157))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355))))))

(assert (=> d!43381 (= (containsKey!176 (toList!863 lt!72157) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) e!90430)))

(declare-fun b!138777 () Bool)

(declare-fun e!90431 () Bool)

(assert (=> b!138777 (= e!90430 e!90431)))

(declare-fun res!66355 () Bool)

(assert (=> b!138777 (=> (not res!66355) (not e!90431))))

(assert (=> b!138777 (= res!66355 (and (or (not ((_ is Cons!1722) (toList!863 lt!72157))) (bvsle (_1!1326 (h!2329 (toList!863 lt!72157))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355))) ((_ is Cons!1722) (toList!863 lt!72157)) (bvslt (_1!1326 (h!2329 (toList!863 lt!72157))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355))))))

(declare-fun b!138778 () Bool)

(assert (=> b!138778 (= e!90431 (containsKey!176 (t!6261 (toList!863 lt!72157)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(assert (= (and d!43381 (not res!66354)) b!138777))

(assert (= (and b!138777 res!66355) b!138778))

(assert (=> b!138778 m!165195))

(declare-fun m!165519 () Bool)

(assert (=> b!138778 m!165519))

(assert (=> d!43353 d!43381))

(assert (=> bm!15232 d!43367))

(declare-fun d!43383 () Bool)

(declare-fun e!90433 () Bool)

(assert (=> d!43383 e!90433))

(declare-fun res!66356 () Bool)

(assert (=> d!43383 (=> res!66356 e!90433)))

(declare-fun lt!72448 () Bool)

(assert (=> d!43383 (= res!66356 (not lt!72448))))

(declare-fun lt!72451 () Bool)

(assert (=> d!43383 (= lt!72448 lt!72451)))

(declare-fun lt!72450 () Unit!4358)

(declare-fun e!90432 () Unit!4358)

(assert (=> d!43383 (= lt!72450 e!90432)))

(declare-fun c!26024 () Bool)

(assert (=> d!43383 (= c!26024 lt!72451)))

(assert (=> d!43383 (= lt!72451 (containsKey!176 (toList!863 lt!72331) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!43383 (= (contains!902 lt!72331 #b1000000000000000000000000000000000000000000000000000000000000000) lt!72448)))

(declare-fun b!138779 () Bool)

(declare-fun lt!72449 () Unit!4358)

(assert (=> b!138779 (= e!90432 lt!72449)))

(assert (=> b!138779 (= lt!72449 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!863 lt!72331) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138779 (isDefined!126 (getValueByKey!172 (toList!863 lt!72331) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138780 () Bool)

(declare-fun Unit!4369 () Unit!4358)

(assert (=> b!138780 (= e!90432 Unit!4369)))

(declare-fun b!138781 () Bool)

(assert (=> b!138781 (= e!90433 (isDefined!126 (getValueByKey!172 (toList!863 lt!72331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43383 c!26024) b!138779))

(assert (= (and d!43383 (not c!26024)) b!138780))

(assert (= (and d!43383 (not res!66356)) b!138781))

(declare-fun m!165521 () Bool)

(assert (=> d!43383 m!165521))

(declare-fun m!165523 () Bool)

(assert (=> b!138779 m!165523))

(declare-fun m!165525 () Bool)

(assert (=> b!138779 m!165525))

(assert (=> b!138779 m!165525))

(declare-fun m!165527 () Bool)

(assert (=> b!138779 m!165527))

(assert (=> b!138781 m!165525))

(assert (=> b!138781 m!165525))

(assert (=> b!138781 m!165527))

(assert (=> bm!15264 d!43383))

(declare-fun bm!15279 () Bool)

(declare-fun call!15285 () ListLongMap!1695)

(assert (=> bm!15279 (= call!15285 (getCurrentListMapNoExtraKeys!130 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun b!138782 () Bool)

(declare-fun e!90442 () ListLongMap!1695)

(declare-fun call!15282 () ListLongMap!1695)

(assert (=> b!138782 (= e!90442 call!15282)))

(declare-fun b!138783 () Bool)

(declare-fun e!90439 () ListLongMap!1695)

(declare-fun call!15283 () ListLongMap!1695)

(assert (=> b!138783 (= e!90439 call!15283)))

(declare-fun c!26025 () Bool)

(declare-fun call!15284 () ListLongMap!1695)

(declare-fun c!26028 () Bool)

(declare-fun call!15287 () ListLongMap!1695)

(declare-fun bm!15280 () Bool)

(assert (=> bm!15280 (= call!15284 (+!165 (ite c!26028 call!15285 (ite c!26025 call!15287 call!15282)) (ite (or c!26028 c!26025) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 newMap!16)) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 newMap!16)))))))

(declare-fun b!138784 () Bool)

(declare-fun e!90445 () Bool)

(declare-fun e!90440 () Bool)

(assert (=> b!138784 (= e!90445 e!90440)))

(declare-fun res!66360 () Bool)

(declare-fun call!15288 () Bool)

(assert (=> b!138784 (= res!66360 call!15288)))

(assert (=> b!138784 (=> (not res!66360) (not e!90440))))

(declare-fun b!138785 () Bool)

(declare-fun e!90441 () ListLongMap!1695)

(assert (=> b!138785 (= e!90441 (+!165 call!15284 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 newMap!16))))))

(declare-fun b!138786 () Bool)

(assert (=> b!138786 (= e!90442 call!15283)))

(declare-fun bm!15281 () Bool)

(assert (=> bm!15281 (= call!15282 call!15287)))

(declare-fun d!43385 () Bool)

(declare-fun e!90437 () Bool)

(assert (=> d!43385 e!90437))

(declare-fun res!66362 () Bool)

(assert (=> d!43385 (=> (not res!66362) (not e!90437))))

(assert (=> d!43385 (= res!66362 (or (bvsge #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))))

(declare-fun lt!72459 () ListLongMap!1695)

(declare-fun lt!72454 () ListLongMap!1695)

(assert (=> d!43385 (= lt!72459 lt!72454)))

(declare-fun lt!72469 () Unit!4358)

(declare-fun e!90444 () Unit!4358)

(assert (=> d!43385 (= lt!72469 e!90444)))

(declare-fun c!26026 () Bool)

(declare-fun e!90446 () Bool)

(assert (=> d!43385 (= c!26026 e!90446)))

(declare-fun res!66358 () Bool)

(assert (=> d!43385 (=> (not res!66358) (not e!90446))))

(assert (=> d!43385 (= res!66358 (bvslt #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))

(assert (=> d!43385 (= lt!72454 e!90441)))

(assert (=> d!43385 (= c!26028 (and (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!43385 (validMask!0 (mask!7247 newMap!16))))

(assert (=> d!43385 (= (getCurrentListMap!527 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) lt!72459)))

(declare-fun b!138787 () Bool)

(declare-fun res!66365 () Bool)

(assert (=> b!138787 (=> (not res!66365) (not e!90437))))

(assert (=> b!138787 (= res!66365 e!90445)))

(declare-fun c!26030 () Bool)

(assert (=> b!138787 (= c!26030 (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!15282 () Bool)

(assert (=> bm!15282 (= call!15283 call!15284)))

(declare-fun b!138788 () Bool)

(declare-fun e!90435 () Bool)

(declare-fun e!90438 () Bool)

(assert (=> b!138788 (= e!90435 e!90438)))

(declare-fun res!66363 () Bool)

(declare-fun call!15286 () Bool)

(assert (=> b!138788 (= res!66363 call!15286)))

(assert (=> b!138788 (=> (not res!66363) (not e!90438))))

(declare-fun b!138789 () Bool)

(declare-fun e!90434 () Bool)

(assert (=> b!138789 (= e!90434 (validKeyInArray!0 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138790 () Bool)

(declare-fun Unit!4370 () Unit!4358)

(assert (=> b!138790 (= e!90444 Unit!4370)))

(declare-fun b!138791 () Bool)

(assert (=> b!138791 (= e!90441 e!90439)))

(assert (=> b!138791 (= c!26025 (and (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!138792 () Bool)

(declare-fun lt!72455 () Unit!4358)

(assert (=> b!138792 (= e!90444 lt!72455)))

(declare-fun lt!72457 () ListLongMap!1695)

(assert (=> b!138792 (= lt!72457 (getCurrentListMapNoExtraKeys!130 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72452 () (_ BitVec 64))

(assert (=> b!138792 (= lt!72452 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72456 () (_ BitVec 64))

(assert (=> b!138792 (= lt!72456 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72465 () Unit!4358)

(assert (=> b!138792 (= lt!72465 (addStillContains!94 lt!72457 lt!72452 (zeroValue!2769 newMap!16) lt!72456))))

(assert (=> b!138792 (contains!902 (+!165 lt!72457 (tuple2!2631 lt!72452 (zeroValue!2769 newMap!16))) lt!72456)))

(declare-fun lt!72472 () Unit!4358)

(assert (=> b!138792 (= lt!72472 lt!72465)))

(declare-fun lt!72461 () ListLongMap!1695)

(assert (=> b!138792 (= lt!72461 (getCurrentListMapNoExtraKeys!130 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72470 () (_ BitVec 64))

(assert (=> b!138792 (= lt!72470 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72453 () (_ BitVec 64))

(assert (=> b!138792 (= lt!72453 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72468 () Unit!4358)

(assert (=> b!138792 (= lt!72468 (addApplyDifferent!94 lt!72461 lt!72470 (minValue!2769 newMap!16) lt!72453))))

(assert (=> b!138792 (= (apply!118 (+!165 lt!72461 (tuple2!2631 lt!72470 (minValue!2769 newMap!16))) lt!72453) (apply!118 lt!72461 lt!72453))))

(declare-fun lt!72458 () Unit!4358)

(assert (=> b!138792 (= lt!72458 lt!72468)))

(declare-fun lt!72466 () ListLongMap!1695)

(assert (=> b!138792 (= lt!72466 (getCurrentListMapNoExtraKeys!130 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72471 () (_ BitVec 64))

(assert (=> b!138792 (= lt!72471 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72463 () (_ BitVec 64))

(assert (=> b!138792 (= lt!72463 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72464 () Unit!4358)

(assert (=> b!138792 (= lt!72464 (addApplyDifferent!94 lt!72466 lt!72471 (zeroValue!2769 newMap!16) lt!72463))))

(assert (=> b!138792 (= (apply!118 (+!165 lt!72466 (tuple2!2631 lt!72471 (zeroValue!2769 newMap!16))) lt!72463) (apply!118 lt!72466 lt!72463))))

(declare-fun lt!72467 () Unit!4358)

(assert (=> b!138792 (= lt!72467 lt!72464)))

(declare-fun lt!72460 () ListLongMap!1695)

(assert (=> b!138792 (= lt!72460 (getCurrentListMapNoExtraKeys!130 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72473 () (_ BitVec 64))

(assert (=> b!138792 (= lt!72473 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72462 () (_ BitVec 64))

(assert (=> b!138792 (= lt!72462 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138792 (= lt!72455 (addApplyDifferent!94 lt!72460 lt!72473 (minValue!2769 newMap!16) lt!72462))))

(assert (=> b!138792 (= (apply!118 (+!165 lt!72460 (tuple2!2631 lt!72473 (minValue!2769 newMap!16))) lt!72462) (apply!118 lt!72460 lt!72462))))

(declare-fun bm!15283 () Bool)

(assert (=> bm!15283 (= call!15286 (contains!902 lt!72459 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15284 () Bool)

(assert (=> bm!15284 (= call!15288 (contains!902 lt!72459 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138793 () Bool)

(declare-fun c!26029 () Bool)

(assert (=> b!138793 (= c!26029 (and (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!138793 (= e!90439 e!90442)))

(declare-fun b!138794 () Bool)

(declare-fun e!90443 () Bool)

(declare-fun e!90436 () Bool)

(assert (=> b!138794 (= e!90443 e!90436)))

(declare-fun res!66361 () Bool)

(assert (=> b!138794 (=> (not res!66361) (not e!90436))))

(assert (=> b!138794 (= res!66361 (contains!902 lt!72459 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!138794 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))

(declare-fun b!138795 () Bool)

(assert (=> b!138795 (= e!90436 (= (apply!118 lt!72459 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)) (get!1507 (select (arr!2285 (_values!2901 newMap!16)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2918 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2557 (_values!2901 newMap!16))))))

(assert (=> b!138795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))

(declare-fun b!138796 () Bool)

(assert (=> b!138796 (= e!90438 (= (apply!118 lt!72459 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2769 newMap!16)))))

(declare-fun b!138797 () Bool)

(assert (=> b!138797 (= e!90437 e!90435)))

(declare-fun c!26027 () Bool)

(assert (=> b!138797 (= c!26027 (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15285 () Bool)

(assert (=> bm!15285 (= call!15287 call!15285)))

(declare-fun b!138798 () Bool)

(assert (=> b!138798 (= e!90445 (not call!15288))))

(declare-fun b!138799 () Bool)

(assert (=> b!138799 (= e!90435 (not call!15286))))

(declare-fun b!138800 () Bool)

(assert (=> b!138800 (= e!90440 (= (apply!118 lt!72459 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2769 newMap!16)))))

(declare-fun b!138801 () Bool)

(assert (=> b!138801 (= e!90446 (validKeyInArray!0 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138802 () Bool)

(declare-fun res!66359 () Bool)

(assert (=> b!138802 (=> (not res!66359) (not e!90437))))

(assert (=> b!138802 (= res!66359 e!90443)))

(declare-fun res!66364 () Bool)

(assert (=> b!138802 (=> res!66364 e!90443)))

(assert (=> b!138802 (= res!66364 (not e!90434))))

(declare-fun res!66357 () Bool)

(assert (=> b!138802 (=> (not res!66357) (not e!90434))))

(assert (=> b!138802 (= res!66357 (bvslt #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))

(assert (= (and d!43385 c!26028) b!138785))

(assert (= (and d!43385 (not c!26028)) b!138791))

(assert (= (and b!138791 c!26025) b!138783))

(assert (= (and b!138791 (not c!26025)) b!138793))

(assert (= (and b!138793 c!26029) b!138786))

(assert (= (and b!138793 (not c!26029)) b!138782))

(assert (= (or b!138786 b!138782) bm!15281))

(assert (= (or b!138783 bm!15281) bm!15285))

(assert (= (or b!138783 b!138786) bm!15282))

(assert (= (or b!138785 bm!15285) bm!15279))

(assert (= (or b!138785 bm!15282) bm!15280))

(assert (= (and d!43385 res!66358) b!138801))

(assert (= (and d!43385 c!26026) b!138792))

(assert (= (and d!43385 (not c!26026)) b!138790))

(assert (= (and d!43385 res!66362) b!138802))

(assert (= (and b!138802 res!66357) b!138789))

(assert (= (and b!138802 (not res!66364)) b!138794))

(assert (= (and b!138794 res!66361) b!138795))

(assert (= (and b!138802 res!66359) b!138787))

(assert (= (and b!138787 c!26030) b!138784))

(assert (= (and b!138787 (not c!26030)) b!138798))

(assert (= (and b!138784 res!66360) b!138800))

(assert (= (or b!138784 b!138798) bm!15284))

(assert (= (and b!138787 res!66365) b!138797))

(assert (= (and b!138797 c!26027) b!138788))

(assert (= (and b!138797 (not c!26027)) b!138799))

(assert (= (and b!138788 res!66363) b!138796))

(assert (= (or b!138788 b!138799) bm!15283))

(declare-fun b_lambda!6197 () Bool)

(assert (=> (not b_lambda!6197) (not b!138795)))

(declare-fun tb!2509 () Bool)

(declare-fun t!6272 () Bool)

(assert (=> (and b!138344 (= (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) (defaultEntry!2918 newMap!16)) t!6272) tb!2509))

(declare-fun result!4125 () Bool)

(assert (=> tb!2509 (= result!4125 tp_is_empty!2911)))

(assert (=> b!138795 t!6272))

(declare-fun b_and!8621 () Bool)

(assert (= b_and!8617 (and (=> t!6272 result!4125) b_and!8621)))

(declare-fun t!6274 () Bool)

(declare-fun tb!2511 () Bool)

(assert (=> (and b!138351 (= (defaultEntry!2918 newMap!16) (defaultEntry!2918 newMap!16)) t!6274) tb!2511))

(declare-fun result!4127 () Bool)

(assert (= result!4127 result!4125))

(assert (=> b!138795 t!6274))

(declare-fun b_and!8623 () Bool)

(assert (= b_and!8619 (and (=> t!6274 result!4127) b_and!8623)))

(declare-fun m!165529 () Bool)

(assert (=> b!138800 m!165529))

(declare-fun m!165531 () Bool)

(assert (=> b!138789 m!165531))

(assert (=> b!138789 m!165531))

(declare-fun m!165533 () Bool)

(assert (=> b!138789 m!165533))

(declare-fun m!165535 () Bool)

(assert (=> bm!15280 m!165535))

(declare-fun m!165537 () Bool)

(assert (=> bm!15279 m!165537))

(declare-fun m!165539 () Bool)

(assert (=> d!43385 m!165539))

(declare-fun m!165541 () Bool)

(assert (=> b!138796 m!165541))

(declare-fun m!165543 () Bool)

(assert (=> b!138792 m!165543))

(declare-fun m!165545 () Bool)

(assert (=> b!138792 m!165545))

(declare-fun m!165547 () Bool)

(assert (=> b!138792 m!165547))

(declare-fun m!165549 () Bool)

(assert (=> b!138792 m!165549))

(assert (=> b!138792 m!165531))

(declare-fun m!165551 () Bool)

(assert (=> b!138792 m!165551))

(declare-fun m!165553 () Bool)

(assert (=> b!138792 m!165553))

(declare-fun m!165555 () Bool)

(assert (=> b!138792 m!165555))

(assert (=> b!138792 m!165551))

(declare-fun m!165557 () Bool)

(assert (=> b!138792 m!165557))

(declare-fun m!165559 () Bool)

(assert (=> b!138792 m!165559))

(declare-fun m!165561 () Bool)

(assert (=> b!138792 m!165561))

(assert (=> b!138792 m!165553))

(assert (=> b!138792 m!165547))

(assert (=> b!138792 m!165545))

(declare-fun m!165563 () Bool)

(assert (=> b!138792 m!165563))

(assert (=> b!138792 m!165537))

(declare-fun m!165565 () Bool)

(assert (=> b!138792 m!165565))

(declare-fun m!165567 () Bool)

(assert (=> b!138792 m!165567))

(declare-fun m!165569 () Bool)

(assert (=> b!138792 m!165569))

(declare-fun m!165571 () Bool)

(assert (=> b!138792 m!165571))

(assert (=> b!138801 m!165531))

(assert (=> b!138801 m!165531))

(assert (=> b!138801 m!165533))

(declare-fun m!165573 () Bool)

(assert (=> bm!15283 m!165573))

(assert (=> b!138795 m!165531))

(declare-fun m!165575 () Bool)

(assert (=> b!138795 m!165575))

(declare-fun m!165577 () Bool)

(assert (=> b!138795 m!165577))

(declare-fun m!165579 () Bool)

(assert (=> b!138795 m!165579))

(assert (=> b!138795 m!165575))

(assert (=> b!138795 m!165577))

(assert (=> b!138795 m!165531))

(declare-fun m!165581 () Bool)

(assert (=> b!138795 m!165581))

(declare-fun m!165583 () Bool)

(assert (=> bm!15284 m!165583))

(assert (=> b!138794 m!165531))

(assert (=> b!138794 m!165531))

(declare-fun m!165585 () Bool)

(assert (=> b!138794 m!165585))

(declare-fun m!165587 () Bool)

(assert (=> b!138785 m!165587))

(assert (=> b!138600 d!43385))

(declare-fun d!43387 () Bool)

(assert (=> d!43387 (= (+!165 (getCurrentListMap!527 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!527 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) lt!72262 (zeroValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72476 () Unit!4358)

(declare-fun choose!852 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 V!3529 Int) Unit!4358)

(assert (=> d!43387 (= lt!72476 (choose!852 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) lt!72262 (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2918 newMap!16)))))

(assert (=> d!43387 (validMask!0 (mask!7247 newMap!16))))

(assert (=> d!43387 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!63 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) lt!72262 (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2918 newMap!16)) lt!72476)))

(declare-fun bs!5796 () Bool)

(assert (= bs!5796 d!43387))

(assert (=> bs!5796 m!165193))

(declare-fun m!165589 () Bool)

(assert (=> bs!5796 m!165589))

(assert (=> bs!5796 m!165325))

(declare-fun m!165591 () Bool)

(assert (=> bs!5796 m!165591))

(assert (=> bs!5796 m!165325))

(assert (=> bs!5796 m!165193))

(declare-fun m!165593 () Bool)

(assert (=> bs!5796 m!165593))

(assert (=> bs!5796 m!165539))

(assert (=> b!138612 d!43387))

(declare-fun d!43389 () Bool)

(declare-fun e!90449 () Bool)

(assert (=> d!43389 e!90449))

(declare-fun res!66371 () Bool)

(assert (=> d!43389 (=> (not res!66371) (not e!90449))))

(declare-fun lt!72482 () SeekEntryResult!280)

(assert (=> d!43389 (= res!66371 ((_ is Found!280) lt!72482))))

(assert (=> d!43389 (= lt!72482 (seekEntryOrOpen!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (_keys!4674 newMap!16) (mask!7247 newMap!16)))))

(declare-fun lt!72481 () Unit!4358)

(declare-fun choose!853 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 64) Int) Unit!4358)

(assert (=> d!43389 (= lt!72481 (choose!853 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)))))

(assert (=> d!43389 (validMask!0 (mask!7247 newMap!16))))

(assert (=> d!43389 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!63 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)) lt!72481)))

(declare-fun b!138807 () Bool)

(declare-fun res!66370 () Bool)

(assert (=> b!138807 (=> (not res!66370) (not e!90449))))

(assert (=> b!138807 (= res!66370 (inRange!0 (index!3283 lt!72482) (mask!7247 newMap!16)))))

(declare-fun b!138808 () Bool)

(assert (=> b!138808 (= e!90449 (= (select (arr!2284 (_keys!4674 newMap!16)) (index!3283 lt!72482)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(assert (=> b!138808 (and (bvsge (index!3283 lt!72482) #b00000000000000000000000000000000) (bvslt (index!3283 lt!72482) (size!2556 (_keys!4674 newMap!16))))))

(assert (= (and d!43389 res!66371) b!138807))

(assert (= (and b!138807 res!66370) b!138808))

(assert (=> d!43389 m!165195))

(assert (=> d!43389 m!165323))

(assert (=> d!43389 m!165195))

(declare-fun m!165595 () Bool)

(assert (=> d!43389 m!165595))

(assert (=> d!43389 m!165539))

(declare-fun m!165597 () Bool)

(assert (=> b!138807 m!165597))

(declare-fun m!165599 () Bool)

(assert (=> b!138808 m!165599))

(assert (=> bm!15238 d!43389))

(declare-fun bm!15286 () Bool)

(declare-fun call!15292 () ListLongMap!1695)

(assert (=> bm!15286 (= call!15292 (getCurrentListMapNoExtraKeys!130 (_keys!4674 newMap!16) (ite (or c!25983 c!25985) (_values!2901 newMap!16) lt!72273) (mask!7247 newMap!16) (ite (and c!25983 c!25977) lt!72257 (extraKeys!2675 newMap!16)) (ite (and c!25983 c!25977) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun b!138809 () Bool)

(declare-fun e!90458 () ListLongMap!1695)

(declare-fun call!15289 () ListLongMap!1695)

(assert (=> b!138809 (= e!90458 call!15289)))

(declare-fun b!138810 () Bool)

(declare-fun e!90455 () ListLongMap!1695)

(declare-fun call!15290 () ListLongMap!1695)

(assert (=> b!138810 (= e!90455 call!15290)))

(declare-fun call!15294 () ListLongMap!1695)

(declare-fun bm!15287 () Bool)

(declare-fun c!26034 () Bool)

(declare-fun call!15291 () ListLongMap!1695)

(declare-fun c!26031 () Bool)

(assert (=> bm!15287 (= call!15291 (+!165 (ite c!26034 call!15292 (ite c!26031 call!15294 call!15289)) (ite (or c!26034 c!26031) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!25983 c!25977) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 newMap!16)))))))

(declare-fun b!138811 () Bool)

(declare-fun e!90461 () Bool)

(declare-fun e!90456 () Bool)

(assert (=> b!138811 (= e!90461 e!90456)))

(declare-fun res!66375 () Bool)

(declare-fun call!15295 () Bool)

(assert (=> b!138811 (= res!66375 call!15295)))

(assert (=> b!138811 (=> (not res!66375) (not e!90456))))

(declare-fun b!138812 () Bool)

(declare-fun e!90457 () ListLongMap!1695)

(assert (=> b!138812 (= e!90457 (+!165 call!15291 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 newMap!16))))))

(declare-fun b!138813 () Bool)

(assert (=> b!138813 (= e!90458 call!15290)))

(declare-fun bm!15288 () Bool)

(assert (=> bm!15288 (= call!15289 call!15294)))

(declare-fun d!43391 () Bool)

(declare-fun e!90453 () Bool)

(assert (=> d!43391 e!90453))

(declare-fun res!66377 () Bool)

(assert (=> d!43391 (=> (not res!66377) (not e!90453))))

(assert (=> d!43391 (= res!66377 (or (bvsge #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))))

(declare-fun lt!72490 () ListLongMap!1695)

(declare-fun lt!72485 () ListLongMap!1695)

(assert (=> d!43391 (= lt!72490 lt!72485)))

(declare-fun lt!72500 () Unit!4358)

(declare-fun e!90460 () Unit!4358)

(assert (=> d!43391 (= lt!72500 e!90460)))

(declare-fun c!26032 () Bool)

(declare-fun e!90462 () Bool)

(assert (=> d!43391 (= c!26032 e!90462)))

(declare-fun res!66373 () Bool)

(assert (=> d!43391 (=> (not res!66373) (not e!90462))))

(assert (=> d!43391 (= res!66373 (bvslt #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))

(assert (=> d!43391 (= lt!72485 e!90457)))

(assert (=> d!43391 (= c!26034 (and (not (= (bvand (ite (and c!25983 c!25977) lt!72257 (extraKeys!2675 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!25983 c!25977) lt!72257 (extraKeys!2675 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!43391 (validMask!0 (mask!7247 newMap!16))))

(assert (=> d!43391 (= (getCurrentListMap!527 (_keys!4674 newMap!16) (ite (or c!25983 c!25985) (_values!2901 newMap!16) lt!72273) (mask!7247 newMap!16) (ite (and c!25983 c!25977) lt!72257 (extraKeys!2675 newMap!16)) (ite (and c!25983 c!25977) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) lt!72490)))

(declare-fun b!138814 () Bool)

(declare-fun res!66380 () Bool)

(assert (=> b!138814 (=> (not res!66380) (not e!90453))))

(assert (=> b!138814 (= res!66380 e!90461)))

(declare-fun c!26036 () Bool)

(assert (=> b!138814 (= c!26036 (not (= (bvand (ite (and c!25983 c!25977) lt!72257 (extraKeys!2675 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!15289 () Bool)

(assert (=> bm!15289 (= call!15290 call!15291)))

(declare-fun b!138815 () Bool)

(declare-fun e!90451 () Bool)

(declare-fun e!90454 () Bool)

(assert (=> b!138815 (= e!90451 e!90454)))

(declare-fun res!66378 () Bool)

(declare-fun call!15293 () Bool)

(assert (=> b!138815 (= res!66378 call!15293)))

(assert (=> b!138815 (=> (not res!66378) (not e!90454))))

(declare-fun b!138816 () Bool)

(declare-fun e!90450 () Bool)

(assert (=> b!138816 (= e!90450 (validKeyInArray!0 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138817 () Bool)

(declare-fun Unit!4371 () Unit!4358)

(assert (=> b!138817 (= e!90460 Unit!4371)))

(declare-fun b!138818 () Bool)

(assert (=> b!138818 (= e!90457 e!90455)))

(assert (=> b!138818 (= c!26031 (and (not (= (bvand (ite (and c!25983 c!25977) lt!72257 (extraKeys!2675 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!25983 c!25977) lt!72257 (extraKeys!2675 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!138819 () Bool)

(declare-fun lt!72486 () Unit!4358)

(assert (=> b!138819 (= e!90460 lt!72486)))

(declare-fun lt!72488 () ListLongMap!1695)

(assert (=> b!138819 (= lt!72488 (getCurrentListMapNoExtraKeys!130 (_keys!4674 newMap!16) (ite (or c!25983 c!25985) (_values!2901 newMap!16) lt!72273) (mask!7247 newMap!16) (ite (and c!25983 c!25977) lt!72257 (extraKeys!2675 newMap!16)) (ite (and c!25983 c!25977) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72483 () (_ BitVec 64))

(assert (=> b!138819 (= lt!72483 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72487 () (_ BitVec 64))

(assert (=> b!138819 (= lt!72487 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72496 () Unit!4358)

(assert (=> b!138819 (= lt!72496 (addStillContains!94 lt!72488 lt!72483 (ite (and c!25983 c!25977) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) lt!72487))))

(assert (=> b!138819 (contains!902 (+!165 lt!72488 (tuple2!2631 lt!72483 (ite (and c!25983 c!25977) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)))) lt!72487)))

(declare-fun lt!72503 () Unit!4358)

(assert (=> b!138819 (= lt!72503 lt!72496)))

(declare-fun lt!72492 () ListLongMap!1695)

(assert (=> b!138819 (= lt!72492 (getCurrentListMapNoExtraKeys!130 (_keys!4674 newMap!16) (ite (or c!25983 c!25985) (_values!2901 newMap!16) lt!72273) (mask!7247 newMap!16) (ite (and c!25983 c!25977) lt!72257 (extraKeys!2675 newMap!16)) (ite (and c!25983 c!25977) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72501 () (_ BitVec 64))

(assert (=> b!138819 (= lt!72501 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72484 () (_ BitVec 64))

(assert (=> b!138819 (= lt!72484 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72499 () Unit!4358)

(assert (=> b!138819 (= lt!72499 (addApplyDifferent!94 lt!72492 lt!72501 (minValue!2769 newMap!16) lt!72484))))

(assert (=> b!138819 (= (apply!118 (+!165 lt!72492 (tuple2!2631 lt!72501 (minValue!2769 newMap!16))) lt!72484) (apply!118 lt!72492 lt!72484))))

(declare-fun lt!72489 () Unit!4358)

(assert (=> b!138819 (= lt!72489 lt!72499)))

(declare-fun lt!72497 () ListLongMap!1695)

(assert (=> b!138819 (= lt!72497 (getCurrentListMapNoExtraKeys!130 (_keys!4674 newMap!16) (ite (or c!25983 c!25985) (_values!2901 newMap!16) lt!72273) (mask!7247 newMap!16) (ite (and c!25983 c!25977) lt!72257 (extraKeys!2675 newMap!16)) (ite (and c!25983 c!25977) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72502 () (_ BitVec 64))

(assert (=> b!138819 (= lt!72502 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72494 () (_ BitVec 64))

(assert (=> b!138819 (= lt!72494 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72495 () Unit!4358)

(assert (=> b!138819 (= lt!72495 (addApplyDifferent!94 lt!72497 lt!72502 (ite (and c!25983 c!25977) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) lt!72494))))

(assert (=> b!138819 (= (apply!118 (+!165 lt!72497 (tuple2!2631 lt!72502 (ite (and c!25983 c!25977) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)))) lt!72494) (apply!118 lt!72497 lt!72494))))

(declare-fun lt!72498 () Unit!4358)

(assert (=> b!138819 (= lt!72498 lt!72495)))

(declare-fun lt!72491 () ListLongMap!1695)

(assert (=> b!138819 (= lt!72491 (getCurrentListMapNoExtraKeys!130 (_keys!4674 newMap!16) (ite (or c!25983 c!25985) (_values!2901 newMap!16) lt!72273) (mask!7247 newMap!16) (ite (and c!25983 c!25977) lt!72257 (extraKeys!2675 newMap!16)) (ite (and c!25983 c!25977) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72504 () (_ BitVec 64))

(assert (=> b!138819 (= lt!72504 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72493 () (_ BitVec 64))

(assert (=> b!138819 (= lt!72493 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138819 (= lt!72486 (addApplyDifferent!94 lt!72491 lt!72504 (minValue!2769 newMap!16) lt!72493))))

(assert (=> b!138819 (= (apply!118 (+!165 lt!72491 (tuple2!2631 lt!72504 (minValue!2769 newMap!16))) lt!72493) (apply!118 lt!72491 lt!72493))))

(declare-fun bm!15290 () Bool)

(assert (=> bm!15290 (= call!15293 (contains!902 lt!72490 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15291 () Bool)

(assert (=> bm!15291 (= call!15295 (contains!902 lt!72490 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!26035 () Bool)

(declare-fun b!138820 () Bool)

(assert (=> b!138820 (= c!26035 (and (not (= (bvand (ite (and c!25983 c!25977) lt!72257 (extraKeys!2675 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!25983 c!25977) lt!72257 (extraKeys!2675 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!138820 (= e!90455 e!90458)))

(declare-fun b!138821 () Bool)

(declare-fun e!90459 () Bool)

(declare-fun e!90452 () Bool)

(assert (=> b!138821 (= e!90459 e!90452)))

(declare-fun res!66376 () Bool)

(assert (=> b!138821 (=> (not res!66376) (not e!90452))))

(assert (=> b!138821 (= res!66376 (contains!902 lt!72490 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!138821 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))

(declare-fun b!138822 () Bool)

(assert (=> b!138822 (= e!90452 (= (apply!118 lt!72490 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)) (get!1507 (select (arr!2285 (ite (or c!25983 c!25985) (_values!2901 newMap!16) lt!72273)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2918 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138822 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2557 (ite (or c!25983 c!25985) (_values!2901 newMap!16) lt!72273))))))

(assert (=> b!138822 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))

(declare-fun b!138823 () Bool)

(assert (=> b!138823 (= e!90454 (= (apply!118 lt!72490 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2769 newMap!16)))))

(declare-fun b!138824 () Bool)

(assert (=> b!138824 (= e!90453 e!90451)))

(declare-fun c!26033 () Bool)

(assert (=> b!138824 (= c!26033 (not (= (bvand (ite (and c!25983 c!25977) lt!72257 (extraKeys!2675 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15292 () Bool)

(assert (=> bm!15292 (= call!15294 call!15292)))

(declare-fun b!138825 () Bool)

(assert (=> b!138825 (= e!90461 (not call!15295))))

(declare-fun b!138826 () Bool)

(assert (=> b!138826 (= e!90451 (not call!15293))))

(declare-fun b!138827 () Bool)

(assert (=> b!138827 (= e!90456 (= (apply!118 lt!72490 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!25983 c!25977) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16))))))

(declare-fun b!138828 () Bool)

(assert (=> b!138828 (= e!90462 (validKeyInArray!0 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138829 () Bool)

(declare-fun res!66374 () Bool)

(assert (=> b!138829 (=> (not res!66374) (not e!90453))))

(assert (=> b!138829 (= res!66374 e!90459)))

(declare-fun res!66379 () Bool)

(assert (=> b!138829 (=> res!66379 e!90459)))

(assert (=> b!138829 (= res!66379 (not e!90450))))

(declare-fun res!66372 () Bool)

(assert (=> b!138829 (=> (not res!66372) (not e!90450))))

(assert (=> b!138829 (= res!66372 (bvslt #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))

(assert (= (and d!43391 c!26034) b!138812))

(assert (= (and d!43391 (not c!26034)) b!138818))

(assert (= (and b!138818 c!26031) b!138810))

(assert (= (and b!138818 (not c!26031)) b!138820))

(assert (= (and b!138820 c!26035) b!138813))

(assert (= (and b!138820 (not c!26035)) b!138809))

(assert (= (or b!138813 b!138809) bm!15288))

(assert (= (or b!138810 bm!15288) bm!15292))

(assert (= (or b!138810 b!138813) bm!15289))

(assert (= (or b!138812 bm!15292) bm!15286))

(assert (= (or b!138812 bm!15289) bm!15287))

(assert (= (and d!43391 res!66373) b!138828))

(assert (= (and d!43391 c!26032) b!138819))

(assert (= (and d!43391 (not c!26032)) b!138817))

(assert (= (and d!43391 res!66377) b!138829))

(assert (= (and b!138829 res!66372) b!138816))

(assert (= (and b!138829 (not res!66379)) b!138821))

(assert (= (and b!138821 res!66376) b!138822))

(assert (= (and b!138829 res!66374) b!138814))

(assert (= (and b!138814 c!26036) b!138811))

(assert (= (and b!138814 (not c!26036)) b!138825))

(assert (= (and b!138811 res!66375) b!138827))

(assert (= (or b!138811 b!138825) bm!15291))

(assert (= (and b!138814 res!66380) b!138824))

(assert (= (and b!138824 c!26033) b!138815))

(assert (= (and b!138824 (not c!26033)) b!138826))

(assert (= (and b!138815 res!66378) b!138823))

(assert (= (or b!138815 b!138826) bm!15290))

(declare-fun b_lambda!6199 () Bool)

(assert (=> (not b_lambda!6199) (not b!138822)))

(assert (=> b!138822 t!6272))

(declare-fun b_and!8625 () Bool)

(assert (= b_and!8621 (and (=> t!6272 result!4125) b_and!8625)))

(assert (=> b!138822 t!6274))

(declare-fun b_and!8627 () Bool)

(assert (= b_and!8623 (and (=> t!6274 result!4127) b_and!8627)))

(declare-fun m!165601 () Bool)

(assert (=> b!138827 m!165601))

(assert (=> b!138816 m!165531))

(assert (=> b!138816 m!165531))

(assert (=> b!138816 m!165533))

(declare-fun m!165603 () Bool)

(assert (=> bm!15287 m!165603))

(declare-fun m!165605 () Bool)

(assert (=> bm!15286 m!165605))

(assert (=> d!43391 m!165539))

(declare-fun m!165607 () Bool)

(assert (=> b!138823 m!165607))

(declare-fun m!165609 () Bool)

(assert (=> b!138819 m!165609))

(declare-fun m!165611 () Bool)

(assert (=> b!138819 m!165611))

(declare-fun m!165613 () Bool)

(assert (=> b!138819 m!165613))

(declare-fun m!165615 () Bool)

(assert (=> b!138819 m!165615))

(assert (=> b!138819 m!165531))

(declare-fun m!165617 () Bool)

(assert (=> b!138819 m!165617))

(declare-fun m!165619 () Bool)

(assert (=> b!138819 m!165619))

(declare-fun m!165621 () Bool)

(assert (=> b!138819 m!165621))

(assert (=> b!138819 m!165617))

(declare-fun m!165623 () Bool)

(assert (=> b!138819 m!165623))

(declare-fun m!165625 () Bool)

(assert (=> b!138819 m!165625))

(declare-fun m!165627 () Bool)

(assert (=> b!138819 m!165627))

(assert (=> b!138819 m!165619))

(assert (=> b!138819 m!165613))

(assert (=> b!138819 m!165611))

(declare-fun m!165629 () Bool)

(assert (=> b!138819 m!165629))

(assert (=> b!138819 m!165605))

(declare-fun m!165631 () Bool)

(assert (=> b!138819 m!165631))

(declare-fun m!165633 () Bool)

(assert (=> b!138819 m!165633))

(declare-fun m!165635 () Bool)

(assert (=> b!138819 m!165635))

(declare-fun m!165637 () Bool)

(assert (=> b!138819 m!165637))

(assert (=> b!138828 m!165531))

(assert (=> b!138828 m!165531))

(assert (=> b!138828 m!165533))

(declare-fun m!165639 () Bool)

(assert (=> bm!15290 m!165639))

(assert (=> b!138822 m!165531))

(declare-fun m!165641 () Bool)

(assert (=> b!138822 m!165641))

(assert (=> b!138822 m!165577))

(declare-fun m!165643 () Bool)

(assert (=> b!138822 m!165643))

(assert (=> b!138822 m!165641))

(assert (=> b!138822 m!165577))

(assert (=> b!138822 m!165531))

(declare-fun m!165645 () Bool)

(assert (=> b!138822 m!165645))

(declare-fun m!165647 () Bool)

(assert (=> bm!15291 m!165647))

(assert (=> b!138821 m!165531))

(assert (=> b!138821 m!165531))

(declare-fun m!165649 () Bool)

(assert (=> b!138821 m!165649))

(declare-fun m!165651 () Bool)

(assert (=> b!138812 m!165651))

(assert (=> bm!15239 d!43391))

(declare-fun d!43393 () Bool)

(assert (=> d!43393 (= (validKeyInArray!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138692 d!43393))

(declare-fun d!43395 () Bool)

(declare-fun res!66381 () Bool)

(declare-fun e!90463 () Bool)

(assert (=> d!43395 (=> res!66381 e!90463)))

(assert (=> d!43395 (= res!66381 (= (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(assert (=> d!43395 (= (arrayContainsKey!0 (_keys!4674 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b00000000000000000000000000000000) e!90463)))

(declare-fun b!138830 () Bool)

(declare-fun e!90464 () Bool)

(assert (=> b!138830 (= e!90463 e!90464)))

(declare-fun res!66382 () Bool)

(assert (=> b!138830 (=> (not res!66382) (not e!90464))))

(assert (=> b!138830 (= res!66382 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2556 (_keys!4674 newMap!16))))))

(declare-fun b!138831 () Bool)

(assert (=> b!138831 (= e!90464 (arrayContainsKey!0 (_keys!4674 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!43395 (not res!66381)) b!138830))

(assert (= (and b!138830 res!66382) b!138831))

(assert (=> d!43395 m!165531))

(assert (=> b!138831 m!165195))

(declare-fun m!165653 () Bool)

(assert (=> b!138831 m!165653))

(assert (=> bm!15222 d!43395))

(declare-fun b!138848 () Bool)

(declare-fun res!66393 () Bool)

(declare-fun e!90476 () Bool)

(assert (=> b!138848 (=> (not res!66393) (not e!90476))))

(declare-fun call!15301 () Bool)

(assert (=> b!138848 (= res!66393 call!15301)))

(declare-fun e!90474 () Bool)

(assert (=> b!138848 (= e!90474 e!90476)))

(declare-fun b!138849 () Bool)

(declare-fun lt!72509 () SeekEntryResult!280)

(assert (=> b!138849 (and (bvsge (index!3282 lt!72509) #b00000000000000000000000000000000) (bvslt (index!3282 lt!72509) (size!2556 (_keys!4674 newMap!16))))))

(declare-fun res!66392 () Bool)

(assert (=> b!138849 (= res!66392 (= (select (arr!2284 (_keys!4674 newMap!16)) (index!3282 lt!72509)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!90473 () Bool)

(assert (=> b!138849 (=> (not res!66392) (not e!90473))))

(declare-fun b!138850 () Bool)

(declare-fun call!15300 () Bool)

(assert (=> b!138850 (= e!90476 (not call!15300))))

(declare-fun c!26041 () Bool)

(declare-fun bm!15297 () Bool)

(assert (=> bm!15297 (= call!15301 (inRange!0 (ite c!26041 (index!3282 lt!72509) (index!3285 lt!72509)) (mask!7247 newMap!16)))))

(declare-fun d!43397 () Bool)

(declare-fun e!90475 () Bool)

(assert (=> d!43397 e!90475))

(assert (=> d!43397 (= c!26041 ((_ is MissingZero!280) lt!72509))))

(assert (=> d!43397 (= lt!72509 (seekEntryOrOpen!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (_keys!4674 newMap!16) (mask!7247 newMap!16)))))

(declare-fun lt!72510 () Unit!4358)

(declare-fun choose!854 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 64) Int) Unit!4358)

(assert (=> d!43397 (= lt!72510 (choose!854 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)))))

(assert (=> d!43397 (validMask!0 (mask!7247 newMap!16))))

(assert (=> d!43397 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!63 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)) lt!72510)))

(declare-fun bm!15298 () Bool)

(assert (=> bm!15298 (= call!15300 (arrayContainsKey!0 (_keys!4674 newMap!16) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!138851 () Bool)

(assert (=> b!138851 (= e!90475 e!90474)))

(declare-fun c!26042 () Bool)

(assert (=> b!138851 (= c!26042 ((_ is MissingVacant!280) lt!72509))))

(declare-fun b!138852 () Bool)

(assert (=> b!138852 (= e!90474 ((_ is Undefined!280) lt!72509))))

(declare-fun b!138853 () Bool)

(assert (=> b!138853 (= e!90475 e!90473)))

(declare-fun res!66391 () Bool)

(assert (=> b!138853 (= res!66391 call!15301)))

(assert (=> b!138853 (=> (not res!66391) (not e!90473))))

(declare-fun b!138854 () Bool)

(declare-fun res!66394 () Bool)

(assert (=> b!138854 (=> (not res!66394) (not e!90476))))

(assert (=> b!138854 (= res!66394 (= (select (arr!2284 (_keys!4674 newMap!16)) (index!3285 lt!72509)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138854 (and (bvsge (index!3285 lt!72509) #b00000000000000000000000000000000) (bvslt (index!3285 lt!72509) (size!2556 (_keys!4674 newMap!16))))))

(declare-fun b!138855 () Bool)

(assert (=> b!138855 (= e!90473 (not call!15300))))

(assert (= (and d!43397 c!26041) b!138853))

(assert (= (and d!43397 (not c!26041)) b!138851))

(assert (= (and b!138853 res!66391) b!138849))

(assert (= (and b!138849 res!66392) b!138855))

(assert (= (and b!138851 c!26042) b!138848))

(assert (= (and b!138851 (not c!26042)) b!138852))

(assert (= (and b!138848 res!66393) b!138854))

(assert (= (and b!138854 res!66394) b!138850))

(assert (= (or b!138853 b!138848) bm!15297))

(assert (= (or b!138855 b!138850) bm!15298))

(assert (=> bm!15298 m!165195))

(assert (=> bm!15298 m!165341))

(assert (=> d!43397 m!165195))

(assert (=> d!43397 m!165323))

(assert (=> d!43397 m!165195))

(declare-fun m!165655 () Bool)

(assert (=> d!43397 m!165655))

(assert (=> d!43397 m!165539))

(declare-fun m!165657 () Bool)

(assert (=> bm!15297 m!165657))

(declare-fun m!165659 () Bool)

(assert (=> b!138854 m!165659))

(declare-fun m!165661 () Bool)

(assert (=> b!138849 m!165661))

(assert (=> bm!15226 d!43397))

(declare-fun b!138868 () Bool)

(declare-fun e!90484 () SeekEntryResult!280)

(declare-fun e!90483 () SeekEntryResult!280)

(assert (=> b!138868 (= e!90484 e!90483)))

(declare-fun lt!72517 () (_ BitVec 64))

(declare-fun lt!72518 () SeekEntryResult!280)

(assert (=> b!138868 (= lt!72517 (select (arr!2284 (_keys!4674 newMap!16)) (index!3284 lt!72518)))))

(declare-fun c!26051 () Bool)

(assert (=> b!138868 (= c!26051 (= lt!72517 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-fun b!138870 () Bool)

(assert (=> b!138870 (= e!90483 (Found!280 (index!3284 lt!72518)))))

(declare-fun b!138871 () Bool)

(declare-fun e!90485 () SeekEntryResult!280)

(assert (=> b!138871 (= e!90485 (MissingZero!280 (index!3284 lt!72518)))))

(declare-fun b!138872 () Bool)

(declare-fun c!26049 () Bool)

(assert (=> b!138872 (= c!26049 (= lt!72517 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138872 (= e!90483 e!90485)))

(declare-fun b!138873 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4833 (_ BitVec 32)) SeekEntryResult!280)

(assert (=> b!138873 (= e!90485 (seekKeyOrZeroReturnVacant!0 (x!15993 lt!72518) (index!3284 lt!72518) (index!3284 lt!72518) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (_keys!4674 newMap!16) (mask!7247 newMap!16)))))

(declare-fun b!138869 () Bool)

(assert (=> b!138869 (= e!90484 Undefined!280)))

(declare-fun lt!72519 () SeekEntryResult!280)

(declare-fun d!43399 () Bool)

(assert (=> d!43399 (and (or ((_ is Undefined!280) lt!72519) (not ((_ is Found!280) lt!72519)) (and (bvsge (index!3283 lt!72519) #b00000000000000000000000000000000) (bvslt (index!3283 lt!72519) (size!2556 (_keys!4674 newMap!16))))) (or ((_ is Undefined!280) lt!72519) ((_ is Found!280) lt!72519) (not ((_ is MissingZero!280) lt!72519)) (and (bvsge (index!3282 lt!72519) #b00000000000000000000000000000000) (bvslt (index!3282 lt!72519) (size!2556 (_keys!4674 newMap!16))))) (or ((_ is Undefined!280) lt!72519) ((_ is Found!280) lt!72519) ((_ is MissingZero!280) lt!72519) (not ((_ is MissingVacant!280) lt!72519)) (and (bvsge (index!3285 lt!72519) #b00000000000000000000000000000000) (bvslt (index!3285 lt!72519) (size!2556 (_keys!4674 newMap!16))))) (or ((_ is Undefined!280) lt!72519) (ite ((_ is Found!280) lt!72519) (= (select (arr!2284 (_keys!4674 newMap!16)) (index!3283 lt!72519)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) (ite ((_ is MissingZero!280) lt!72519) (= (select (arr!2284 (_keys!4674 newMap!16)) (index!3282 lt!72519)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!280) lt!72519) (= (select (arr!2284 (_keys!4674 newMap!16)) (index!3285 lt!72519)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!43399 (= lt!72519 e!90484)))

(declare-fun c!26050 () Bool)

(assert (=> d!43399 (= c!26050 (and ((_ is Intermediate!280) lt!72518) (undefined!1092 lt!72518)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4833 (_ BitVec 32)) SeekEntryResult!280)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!43399 (= lt!72518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (mask!7247 newMap!16)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (_keys!4674 newMap!16) (mask!7247 newMap!16)))))

(assert (=> d!43399 (validMask!0 (mask!7247 newMap!16))))

(assert (=> d!43399 (= (seekEntryOrOpen!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (_keys!4674 newMap!16) (mask!7247 newMap!16)) lt!72519)))

(assert (= (and d!43399 c!26050) b!138869))

(assert (= (and d!43399 (not c!26050)) b!138868))

(assert (= (and b!138868 c!26051) b!138870))

(assert (= (and b!138868 (not c!26051)) b!138872))

(assert (= (and b!138872 c!26049) b!138871))

(assert (= (and b!138872 (not c!26049)) b!138873))

(declare-fun m!165663 () Bool)

(assert (=> b!138868 m!165663))

(assert (=> b!138873 m!165195))

(declare-fun m!165665 () Bool)

(assert (=> b!138873 m!165665))

(declare-fun m!165667 () Bool)

(assert (=> d!43399 m!165667))

(declare-fun m!165669 () Bool)

(assert (=> d!43399 m!165669))

(assert (=> d!43399 m!165195))

(declare-fun m!165671 () Bool)

(assert (=> d!43399 m!165671))

(declare-fun m!165673 () Bool)

(assert (=> d!43399 m!165673))

(assert (=> d!43399 m!165539))

(declare-fun m!165675 () Bool)

(assert (=> d!43399 m!165675))

(assert (=> d!43399 m!165195))

(assert (=> d!43399 m!165669))

(assert (=> bm!15243 d!43399))

(declare-fun d!43401 () Bool)

(declare-fun e!90488 () Bool)

(assert (=> d!43401 e!90488))

(declare-fun c!26054 () Bool)

(assert (=> d!43401 (= c!26054 (and (not (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!43401 true))

(declare-fun _$29!162 () Unit!4358)

(assert (=> d!43401 (= (choose!851 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (_values!2901 (v!3248 (underlying!468 thiss!992))) (mask!7247 (v!3248 (underlying!468 thiss!992))) (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) (minValue!2769 (v!3248 (underlying!468 thiss!992))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992)))) _$29!162)))

(declare-fun b!138878 () Bool)

(assert (=> b!138878 (= e!90488 (arrayContainsKey!0 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!138879 () Bool)

(assert (=> b!138879 (= e!90488 (ite (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!43401 c!26054) b!138878))

(assert (= (and d!43401 (not c!26054)) b!138879))

(assert (=> b!138878 m!165195))

(assert (=> b!138878 m!165207))

(assert (=> d!43365 d!43401))

(declare-fun d!43403 () Bool)

(assert (=> d!43403 (= (validMask!0 (mask!7247 (v!3248 (underlying!468 thiss!992)))) (and (or (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000001111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000011111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000001111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000011111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000001111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000011111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000000001111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000000011111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000000111111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000001111111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000011111111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000000111111111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000001111111111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000011111111111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000000111111111111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000001111111111111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000011111111111111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000000111111111111111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000001111111111111111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000011111111111111111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00000111111111111111111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00001111111111111111111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00011111111111111111111111111111) (= (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7247 (v!3248 (underlying!468 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!43365 d!43403))

(declare-fun bm!15299 () Bool)

(declare-fun call!15305 () ListLongMap!1695)

(assert (=> bm!15299 (= call!15305 (getCurrentListMapNoExtraKeys!130 (_keys!4674 newMap!16) (ite c!25983 (_values!2901 newMap!16) (array!4836 (store (arr!2285 (_values!2901 newMap!16)) (index!3283 lt!72267) (ValueCellFull!1112 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2557 (_values!2901 newMap!16)))) (mask!7247 newMap!16) (ite c!25983 (ite c!25977 (extraKeys!2675 newMap!16) lt!72262) (extraKeys!2675 newMap!16)) (zeroValue!2769 newMap!16) (ite c!25983 (ite c!25977 (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun b!138880 () Bool)

(declare-fun e!90497 () ListLongMap!1695)

(declare-fun call!15302 () ListLongMap!1695)

(assert (=> b!138880 (= e!90497 call!15302)))

(declare-fun b!138881 () Bool)

(declare-fun e!90494 () ListLongMap!1695)

(declare-fun call!15303 () ListLongMap!1695)

(assert (=> b!138881 (= e!90494 call!15303)))

(declare-fun call!15304 () ListLongMap!1695)

(declare-fun call!15307 () ListLongMap!1695)

(declare-fun c!26058 () Bool)

(declare-fun c!26055 () Bool)

(declare-fun bm!15300 () Bool)

(assert (=> bm!15300 (= call!15304 (+!165 (ite c!26058 call!15305 (ite c!26055 call!15307 call!15302)) (ite (or c!26058 c!26055) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 newMap!16)) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25983 (ite c!25977 (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16))))))))

(declare-fun b!138882 () Bool)

(declare-fun e!90500 () Bool)

(declare-fun e!90495 () Bool)

(assert (=> b!138882 (= e!90500 e!90495)))

(declare-fun res!66398 () Bool)

(declare-fun call!15308 () Bool)

(assert (=> b!138882 (= res!66398 call!15308)))

(assert (=> b!138882 (=> (not res!66398) (not e!90495))))

(declare-fun e!90496 () ListLongMap!1695)

(declare-fun b!138883 () Bool)

(assert (=> b!138883 (= e!90496 (+!165 call!15304 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25983 (ite c!25977 (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)))))))

(declare-fun b!138884 () Bool)

(assert (=> b!138884 (= e!90497 call!15303)))

(declare-fun bm!15301 () Bool)

(assert (=> bm!15301 (= call!15302 call!15307)))

(declare-fun d!43405 () Bool)

(declare-fun e!90492 () Bool)

(assert (=> d!43405 e!90492))

(declare-fun res!66400 () Bool)

(assert (=> d!43405 (=> (not res!66400) (not e!90492))))

(assert (=> d!43405 (= res!66400 (or (bvsge #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))))

(declare-fun lt!72527 () ListLongMap!1695)

(declare-fun lt!72522 () ListLongMap!1695)

(assert (=> d!43405 (= lt!72527 lt!72522)))

(declare-fun lt!72537 () Unit!4358)

(declare-fun e!90499 () Unit!4358)

(assert (=> d!43405 (= lt!72537 e!90499)))

(declare-fun c!26056 () Bool)

(declare-fun e!90501 () Bool)

(assert (=> d!43405 (= c!26056 e!90501)))

(declare-fun res!66396 () Bool)

(assert (=> d!43405 (=> (not res!66396) (not e!90501))))

(assert (=> d!43405 (= res!66396 (bvslt #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))

(assert (=> d!43405 (= lt!72522 e!90496)))

(assert (=> d!43405 (= c!26058 (and (not (= (bvand (ite c!25983 (ite c!25977 (extraKeys!2675 newMap!16) lt!72262) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!25983 (ite c!25977 (extraKeys!2675 newMap!16) lt!72262) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!43405 (validMask!0 (mask!7247 newMap!16))))

(assert (=> d!43405 (= (getCurrentListMap!527 (_keys!4674 newMap!16) (ite c!25983 (_values!2901 newMap!16) (array!4836 (store (arr!2285 (_values!2901 newMap!16)) (index!3283 lt!72267) (ValueCellFull!1112 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2557 (_values!2901 newMap!16)))) (mask!7247 newMap!16) (ite c!25983 (ite c!25977 (extraKeys!2675 newMap!16) lt!72262) (extraKeys!2675 newMap!16)) (zeroValue!2769 newMap!16) (ite c!25983 (ite c!25977 (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) lt!72527)))

(declare-fun b!138885 () Bool)

(declare-fun res!66403 () Bool)

(assert (=> b!138885 (=> (not res!66403) (not e!90492))))

(assert (=> b!138885 (= res!66403 e!90500)))

(declare-fun c!26060 () Bool)

(assert (=> b!138885 (= c!26060 (not (= (bvand (ite c!25983 (ite c!25977 (extraKeys!2675 newMap!16) lt!72262) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!15302 () Bool)

(assert (=> bm!15302 (= call!15303 call!15304)))

(declare-fun b!138886 () Bool)

(declare-fun e!90490 () Bool)

(declare-fun e!90493 () Bool)

(assert (=> b!138886 (= e!90490 e!90493)))

(declare-fun res!66401 () Bool)

(declare-fun call!15306 () Bool)

(assert (=> b!138886 (= res!66401 call!15306)))

(assert (=> b!138886 (=> (not res!66401) (not e!90493))))

(declare-fun b!138887 () Bool)

(declare-fun e!90489 () Bool)

(assert (=> b!138887 (= e!90489 (validKeyInArray!0 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138888 () Bool)

(declare-fun Unit!4372 () Unit!4358)

(assert (=> b!138888 (= e!90499 Unit!4372)))

(declare-fun b!138889 () Bool)

(assert (=> b!138889 (= e!90496 e!90494)))

(assert (=> b!138889 (= c!26055 (and (not (= (bvand (ite c!25983 (ite c!25977 (extraKeys!2675 newMap!16) lt!72262) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!25983 (ite c!25977 (extraKeys!2675 newMap!16) lt!72262) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!138890 () Bool)

(declare-fun lt!72523 () Unit!4358)

(assert (=> b!138890 (= e!90499 lt!72523)))

(declare-fun lt!72525 () ListLongMap!1695)

(assert (=> b!138890 (= lt!72525 (getCurrentListMapNoExtraKeys!130 (_keys!4674 newMap!16) (ite c!25983 (_values!2901 newMap!16) (array!4836 (store (arr!2285 (_values!2901 newMap!16)) (index!3283 lt!72267) (ValueCellFull!1112 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2557 (_values!2901 newMap!16)))) (mask!7247 newMap!16) (ite c!25983 (ite c!25977 (extraKeys!2675 newMap!16) lt!72262) (extraKeys!2675 newMap!16)) (zeroValue!2769 newMap!16) (ite c!25983 (ite c!25977 (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72520 () (_ BitVec 64))

(assert (=> b!138890 (= lt!72520 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72524 () (_ BitVec 64))

(assert (=> b!138890 (= lt!72524 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72533 () Unit!4358)

(assert (=> b!138890 (= lt!72533 (addStillContains!94 lt!72525 lt!72520 (zeroValue!2769 newMap!16) lt!72524))))

(assert (=> b!138890 (contains!902 (+!165 lt!72525 (tuple2!2631 lt!72520 (zeroValue!2769 newMap!16))) lt!72524)))

(declare-fun lt!72540 () Unit!4358)

(assert (=> b!138890 (= lt!72540 lt!72533)))

(declare-fun lt!72529 () ListLongMap!1695)

(assert (=> b!138890 (= lt!72529 (getCurrentListMapNoExtraKeys!130 (_keys!4674 newMap!16) (ite c!25983 (_values!2901 newMap!16) (array!4836 (store (arr!2285 (_values!2901 newMap!16)) (index!3283 lt!72267) (ValueCellFull!1112 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2557 (_values!2901 newMap!16)))) (mask!7247 newMap!16) (ite c!25983 (ite c!25977 (extraKeys!2675 newMap!16) lt!72262) (extraKeys!2675 newMap!16)) (zeroValue!2769 newMap!16) (ite c!25983 (ite c!25977 (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72538 () (_ BitVec 64))

(assert (=> b!138890 (= lt!72538 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72521 () (_ BitVec 64))

(assert (=> b!138890 (= lt!72521 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72536 () Unit!4358)

(assert (=> b!138890 (= lt!72536 (addApplyDifferent!94 lt!72529 lt!72538 (ite c!25983 (ite c!25977 (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) lt!72521))))

(assert (=> b!138890 (= (apply!118 (+!165 lt!72529 (tuple2!2631 lt!72538 (ite c!25983 (ite c!25977 (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)))) lt!72521) (apply!118 lt!72529 lt!72521))))

(declare-fun lt!72526 () Unit!4358)

(assert (=> b!138890 (= lt!72526 lt!72536)))

(declare-fun lt!72534 () ListLongMap!1695)

(assert (=> b!138890 (= lt!72534 (getCurrentListMapNoExtraKeys!130 (_keys!4674 newMap!16) (ite c!25983 (_values!2901 newMap!16) (array!4836 (store (arr!2285 (_values!2901 newMap!16)) (index!3283 lt!72267) (ValueCellFull!1112 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2557 (_values!2901 newMap!16)))) (mask!7247 newMap!16) (ite c!25983 (ite c!25977 (extraKeys!2675 newMap!16) lt!72262) (extraKeys!2675 newMap!16)) (zeroValue!2769 newMap!16) (ite c!25983 (ite c!25977 (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72539 () (_ BitVec 64))

(assert (=> b!138890 (= lt!72539 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72531 () (_ BitVec 64))

(assert (=> b!138890 (= lt!72531 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72532 () Unit!4358)

(assert (=> b!138890 (= lt!72532 (addApplyDifferent!94 lt!72534 lt!72539 (zeroValue!2769 newMap!16) lt!72531))))

(assert (=> b!138890 (= (apply!118 (+!165 lt!72534 (tuple2!2631 lt!72539 (zeroValue!2769 newMap!16))) lt!72531) (apply!118 lt!72534 lt!72531))))

(declare-fun lt!72535 () Unit!4358)

(assert (=> b!138890 (= lt!72535 lt!72532)))

(declare-fun lt!72528 () ListLongMap!1695)

(assert (=> b!138890 (= lt!72528 (getCurrentListMapNoExtraKeys!130 (_keys!4674 newMap!16) (ite c!25983 (_values!2901 newMap!16) (array!4836 (store (arr!2285 (_values!2901 newMap!16)) (index!3283 lt!72267) (ValueCellFull!1112 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2557 (_values!2901 newMap!16)))) (mask!7247 newMap!16) (ite c!25983 (ite c!25977 (extraKeys!2675 newMap!16) lt!72262) (extraKeys!2675 newMap!16)) (zeroValue!2769 newMap!16) (ite c!25983 (ite c!25977 (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72541 () (_ BitVec 64))

(assert (=> b!138890 (= lt!72541 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72530 () (_ BitVec 64))

(assert (=> b!138890 (= lt!72530 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138890 (= lt!72523 (addApplyDifferent!94 lt!72528 lt!72541 (ite c!25983 (ite c!25977 (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) lt!72530))))

(assert (=> b!138890 (= (apply!118 (+!165 lt!72528 (tuple2!2631 lt!72541 (ite c!25983 (ite c!25977 (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)))) lt!72530) (apply!118 lt!72528 lt!72530))))

(declare-fun bm!15303 () Bool)

(assert (=> bm!15303 (= call!15306 (contains!902 lt!72527 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15304 () Bool)

(assert (=> bm!15304 (= call!15308 (contains!902 lt!72527 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!26059 () Bool)

(declare-fun b!138891 () Bool)

(assert (=> b!138891 (= c!26059 (and (not (= (bvand (ite c!25983 (ite c!25977 (extraKeys!2675 newMap!16) lt!72262) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!25983 (ite c!25977 (extraKeys!2675 newMap!16) lt!72262) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!138891 (= e!90494 e!90497)))

(declare-fun b!138892 () Bool)

(declare-fun e!90498 () Bool)

(declare-fun e!90491 () Bool)

(assert (=> b!138892 (= e!90498 e!90491)))

(declare-fun res!66399 () Bool)

(assert (=> b!138892 (=> (not res!66399) (not e!90491))))

(assert (=> b!138892 (= res!66399 (contains!902 lt!72527 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!138892 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))

(declare-fun b!138893 () Bool)

(assert (=> b!138893 (= e!90491 (= (apply!118 lt!72527 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)) (get!1507 (select (arr!2285 (ite c!25983 (_values!2901 newMap!16) (array!4836 (store (arr!2285 (_values!2901 newMap!16)) (index!3283 lt!72267) (ValueCellFull!1112 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2557 (_values!2901 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2918 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138893 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2557 (ite c!25983 (_values!2901 newMap!16) (array!4836 (store (arr!2285 (_values!2901 newMap!16)) (index!3283 lt!72267) (ValueCellFull!1112 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2557 (_values!2901 newMap!16)))))))))

(assert (=> b!138893 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))

(declare-fun b!138894 () Bool)

(assert (=> b!138894 (= e!90493 (= (apply!118 lt!72527 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!25983 (ite c!25977 (minValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16))))))

(declare-fun b!138895 () Bool)

(assert (=> b!138895 (= e!90492 e!90490)))

(declare-fun c!26057 () Bool)

(assert (=> b!138895 (= c!26057 (not (= (bvand (ite c!25983 (ite c!25977 (extraKeys!2675 newMap!16) lt!72262) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15305 () Bool)

(assert (=> bm!15305 (= call!15307 call!15305)))

(declare-fun b!138896 () Bool)

(assert (=> b!138896 (= e!90500 (not call!15308))))

(declare-fun b!138897 () Bool)

(assert (=> b!138897 (= e!90490 (not call!15306))))

(declare-fun b!138898 () Bool)

(assert (=> b!138898 (= e!90495 (= (apply!118 lt!72527 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2769 newMap!16)))))

(declare-fun b!138899 () Bool)

(assert (=> b!138899 (= e!90501 (validKeyInArray!0 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138900 () Bool)

(declare-fun res!66397 () Bool)

(assert (=> b!138900 (=> (not res!66397) (not e!90492))))

(assert (=> b!138900 (= res!66397 e!90498)))

(declare-fun res!66402 () Bool)

(assert (=> b!138900 (=> res!66402 e!90498)))

(assert (=> b!138900 (= res!66402 (not e!90489))))

(declare-fun res!66395 () Bool)

(assert (=> b!138900 (=> (not res!66395) (not e!90489))))

(assert (=> b!138900 (= res!66395 (bvslt #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))

(assert (= (and d!43405 c!26058) b!138883))

(assert (= (and d!43405 (not c!26058)) b!138889))

(assert (= (and b!138889 c!26055) b!138881))

(assert (= (and b!138889 (not c!26055)) b!138891))

(assert (= (and b!138891 c!26059) b!138884))

(assert (= (and b!138891 (not c!26059)) b!138880))

(assert (= (or b!138884 b!138880) bm!15301))

(assert (= (or b!138881 bm!15301) bm!15305))

(assert (= (or b!138881 b!138884) bm!15302))

(assert (= (or b!138883 bm!15305) bm!15299))

(assert (= (or b!138883 bm!15302) bm!15300))

(assert (= (and d!43405 res!66396) b!138899))

(assert (= (and d!43405 c!26056) b!138890))

(assert (= (and d!43405 (not c!26056)) b!138888))

(assert (= (and d!43405 res!66400) b!138900))

(assert (= (and b!138900 res!66395) b!138887))

(assert (= (and b!138900 (not res!66402)) b!138892))

(assert (= (and b!138892 res!66399) b!138893))

(assert (= (and b!138900 res!66397) b!138885))

(assert (= (and b!138885 c!26060) b!138882))

(assert (= (and b!138885 (not c!26060)) b!138896))

(assert (= (and b!138882 res!66398) b!138898))

(assert (= (or b!138882 b!138896) bm!15304))

(assert (= (and b!138885 res!66403) b!138895))

(assert (= (and b!138895 c!26057) b!138886))

(assert (= (and b!138895 (not c!26057)) b!138897))

(assert (= (and b!138886 res!66401) b!138894))

(assert (= (or b!138886 b!138897) bm!15303))

(declare-fun b_lambda!6201 () Bool)

(assert (=> (not b_lambda!6201) (not b!138893)))

(assert (=> b!138893 t!6272))

(declare-fun b_and!8629 () Bool)

(assert (= b_and!8625 (and (=> t!6272 result!4125) b_and!8629)))

(assert (=> b!138893 t!6274))

(declare-fun b_and!8631 () Bool)

(assert (= b_and!8627 (and (=> t!6274 result!4127) b_and!8631)))

(declare-fun m!165677 () Bool)

(assert (=> b!138898 m!165677))

(assert (=> b!138887 m!165531))

(assert (=> b!138887 m!165531))

(assert (=> b!138887 m!165533))

(declare-fun m!165679 () Bool)

(assert (=> bm!15300 m!165679))

(declare-fun m!165681 () Bool)

(assert (=> bm!15299 m!165681))

(assert (=> d!43405 m!165539))

(declare-fun m!165683 () Bool)

(assert (=> b!138894 m!165683))

(declare-fun m!165685 () Bool)

(assert (=> b!138890 m!165685))

(declare-fun m!165687 () Bool)

(assert (=> b!138890 m!165687))

(declare-fun m!165689 () Bool)

(assert (=> b!138890 m!165689))

(declare-fun m!165691 () Bool)

(assert (=> b!138890 m!165691))

(assert (=> b!138890 m!165531))

(declare-fun m!165693 () Bool)

(assert (=> b!138890 m!165693))

(declare-fun m!165695 () Bool)

(assert (=> b!138890 m!165695))

(declare-fun m!165697 () Bool)

(assert (=> b!138890 m!165697))

(assert (=> b!138890 m!165693))

(declare-fun m!165699 () Bool)

(assert (=> b!138890 m!165699))

(declare-fun m!165701 () Bool)

(assert (=> b!138890 m!165701))

(declare-fun m!165703 () Bool)

(assert (=> b!138890 m!165703))

(assert (=> b!138890 m!165695))

(assert (=> b!138890 m!165689))

(assert (=> b!138890 m!165687))

(declare-fun m!165705 () Bool)

(assert (=> b!138890 m!165705))

(assert (=> b!138890 m!165681))

(declare-fun m!165707 () Bool)

(assert (=> b!138890 m!165707))

(declare-fun m!165709 () Bool)

(assert (=> b!138890 m!165709))

(declare-fun m!165711 () Bool)

(assert (=> b!138890 m!165711))

(declare-fun m!165713 () Bool)

(assert (=> b!138890 m!165713))

(assert (=> b!138899 m!165531))

(assert (=> b!138899 m!165531))

(assert (=> b!138899 m!165533))

(declare-fun m!165715 () Bool)

(assert (=> bm!15303 m!165715))

(assert (=> b!138893 m!165531))

(declare-fun m!165717 () Bool)

(assert (=> b!138893 m!165717))

(assert (=> b!138893 m!165577))

(declare-fun m!165719 () Bool)

(assert (=> b!138893 m!165719))

(assert (=> b!138893 m!165717))

(assert (=> b!138893 m!165577))

(assert (=> b!138893 m!165531))

(declare-fun m!165721 () Bool)

(assert (=> b!138893 m!165721))

(declare-fun m!165723 () Bool)

(assert (=> bm!15304 m!165723))

(assert (=> b!138892 m!165531))

(assert (=> b!138892 m!165531))

(declare-fun m!165725 () Bool)

(assert (=> b!138892 m!165725))

(declare-fun m!165727 () Bool)

(assert (=> b!138883 m!165727))

(assert (=> bm!15244 d!43405))

(declare-fun b!138909 () Bool)

(declare-fun res!66415 () Bool)

(declare-fun e!90504 () Bool)

(assert (=> b!138909 (=> (not res!66415) (not e!90504))))

(assert (=> b!138909 (= res!66415 (and (= (size!2557 (_values!2901 newMap!16)) (bvadd (mask!7247 newMap!16) #b00000000000000000000000000000001)) (= (size!2556 (_keys!4674 newMap!16)) (size!2557 (_values!2901 newMap!16))) (bvsge (_size!615 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!615 newMap!16) (bvadd (mask!7247 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!138910 () Bool)

(declare-fun res!66414 () Bool)

(assert (=> b!138910 (=> (not res!66414) (not e!90504))))

(declare-fun size!2562 (LongMapFixedSize!1132) (_ BitVec 32))

(assert (=> b!138910 (= res!66414 (bvsge (size!2562 newMap!16) (_size!615 newMap!16)))))

(declare-fun b!138912 () Bool)

(assert (=> b!138912 (= e!90504 (and (bvsge (extraKeys!2675 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2675 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!615 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!138911 () Bool)

(declare-fun res!66413 () Bool)

(assert (=> b!138911 (=> (not res!66413) (not e!90504))))

(assert (=> b!138911 (= res!66413 (= (size!2562 newMap!16) (bvadd (_size!615 newMap!16) (bvsdiv (bvadd (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!43407 () Bool)

(declare-fun res!66412 () Bool)

(assert (=> d!43407 (=> (not res!66412) (not e!90504))))

(assert (=> d!43407 (= res!66412 (validMask!0 (mask!7247 newMap!16)))))

(assert (=> d!43407 (= (simpleValid!94 newMap!16) e!90504)))

(assert (= (and d!43407 res!66412) b!138909))

(assert (= (and b!138909 res!66415) b!138910))

(assert (= (and b!138910 res!66414) b!138911))

(assert (= (and b!138911 res!66413) b!138912))

(declare-fun m!165729 () Bool)

(assert (=> b!138910 m!165729))

(assert (=> b!138911 m!165729))

(assert (=> d!43407 m!165539))

(assert (=> d!43349 d!43407))

(declare-fun d!43409 () Bool)

(declare-fun e!90505 () Bool)

(assert (=> d!43409 e!90505))

(declare-fun res!66417 () Bool)

(assert (=> d!43409 (=> (not res!66417) (not e!90505))))

(declare-fun lt!72543 () ListLongMap!1695)

(assert (=> d!43409 (= res!66417 (contains!902 lt!72543 (_1!1326 (ite (or c!26009 c!26006) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992))))))))))

(declare-fun lt!72544 () List!1726)

(assert (=> d!43409 (= lt!72543 (ListLongMap!1696 lt!72544))))

(declare-fun lt!72542 () Unit!4358)

(declare-fun lt!72545 () Unit!4358)

(assert (=> d!43409 (= lt!72542 lt!72545)))

(assert (=> d!43409 (= (getValueByKey!172 lt!72544 (_1!1326 (ite (or c!26009 c!26006) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992))))))) (Some!177 (_2!1326 (ite (or c!26009 c!26006) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992))))))))))

(assert (=> d!43409 (= lt!72545 (lemmaContainsTupThenGetReturnValue!90 lt!72544 (_1!1326 (ite (or c!26009 c!26006) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))) (_2!1326 (ite (or c!26009 c!26006) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992))))))))))

(assert (=> d!43409 (= lt!72544 (insertStrictlySorted!93 (toList!863 (ite c!26009 call!15266 (ite c!26006 call!15268 call!15263))) (_1!1326 (ite (or c!26009 c!26006) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))) (_2!1326 (ite (or c!26009 c!26006) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992))))))))))

(assert (=> d!43409 (= (+!165 (ite c!26009 call!15266 (ite c!26006 call!15268 call!15263)) (ite (or c!26009 c!26006) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))) lt!72543)))

(declare-fun b!138913 () Bool)

(declare-fun res!66416 () Bool)

(assert (=> b!138913 (=> (not res!66416) (not e!90505))))

(assert (=> b!138913 (= res!66416 (= (getValueByKey!172 (toList!863 lt!72543) (_1!1326 (ite (or c!26009 c!26006) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992))))))) (Some!177 (_2!1326 (ite (or c!26009 c!26006) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))))))

(declare-fun b!138914 () Bool)

(assert (=> b!138914 (= e!90505 (contains!905 (toList!863 lt!72543) (ite (or c!26009 c!26006) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (= (and d!43409 res!66417) b!138913))

(assert (= (and b!138913 res!66416) b!138914))

(declare-fun m!165731 () Bool)

(assert (=> d!43409 m!165731))

(declare-fun m!165733 () Bool)

(assert (=> d!43409 m!165733))

(declare-fun m!165735 () Bool)

(assert (=> d!43409 m!165735))

(declare-fun m!165737 () Bool)

(assert (=> d!43409 m!165737))

(declare-fun m!165739 () Bool)

(assert (=> b!138913 m!165739))

(declare-fun m!165741 () Bool)

(assert (=> b!138914 m!165741))

(assert (=> bm!15261 d!43409))

(assert (=> b!138704 d!43393))

(declare-fun d!43411 () Bool)

(assert (=> d!43411 (= (map!1411 (_2!1327 lt!72266)) (getCurrentListMap!527 (_keys!4674 (_2!1327 lt!72266)) (_values!2901 (_2!1327 lt!72266)) (mask!7247 (_2!1327 lt!72266)) (extraKeys!2675 (_2!1327 lt!72266)) (zeroValue!2769 (_2!1327 lt!72266)) (minValue!2769 (_2!1327 lt!72266)) #b00000000000000000000000000000000 (defaultEntry!2918 (_2!1327 lt!72266))))))

(declare-fun bs!5797 () Bool)

(assert (= bs!5797 d!43411))

(declare-fun m!165743 () Bool)

(assert (=> bs!5797 m!165743))

(assert (=> bm!15228 d!43411))

(declare-fun d!43413 () Bool)

(declare-fun res!66418 () Bool)

(declare-fun e!90506 () Bool)

(assert (=> d!43413 (=> (not res!66418) (not e!90506))))

(assert (=> d!43413 (= res!66418 (simpleValid!94 (v!3248 (underlying!468 thiss!992))))))

(assert (=> d!43413 (= (valid!550 (v!3248 (underlying!468 thiss!992))) e!90506)))

(declare-fun b!138915 () Bool)

(declare-fun res!66419 () Bool)

(assert (=> b!138915 (=> (not res!66419) (not e!90506))))

(assert (=> b!138915 (= res!66419 (= (arrayCountValidKeys!0 (_keys!4674 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000000 (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))) (_size!615 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun b!138916 () Bool)

(declare-fun res!66420 () Bool)

(assert (=> b!138916 (=> (not res!66420) (not e!90506))))

(assert (=> b!138916 (= res!66420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (mask!7247 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun b!138917 () Bool)

(assert (=> b!138917 (= e!90506 (arrayNoDuplicates!0 (_keys!4674 (v!3248 (underlying!468 thiss!992))) #b00000000000000000000000000000000 Nil!1722))))

(assert (= (and d!43413 res!66418) b!138915))

(assert (= (and b!138915 res!66419) b!138916))

(assert (= (and b!138916 res!66420) b!138917))

(declare-fun m!165745 () Bool)

(assert (=> d!43413 m!165745))

(declare-fun m!165747 () Bool)

(assert (=> b!138915 m!165747))

(declare-fun m!165749 () Bool)

(assert (=> b!138916 m!165749))

(assert (=> b!138917 m!165205))

(assert (=> d!43371 d!43413))

(assert (=> b!138593 d!43399))

(declare-fun d!43415 () Bool)

(declare-fun e!90508 () Bool)

(assert (=> d!43415 e!90508))

(declare-fun res!66421 () Bool)

(assert (=> d!43415 (=> res!66421 e!90508)))

(declare-fun lt!72546 () Bool)

(assert (=> d!43415 (= res!66421 (not lt!72546))))

(declare-fun lt!72549 () Bool)

(assert (=> d!43415 (= lt!72546 lt!72549)))

(declare-fun lt!72548 () Unit!4358)

(declare-fun e!90507 () Unit!4358)

(assert (=> d!43415 (= lt!72548 e!90507)))

(declare-fun c!26061 () Bool)

(assert (=> d!43415 (= c!26061 lt!72549)))

(assert (=> d!43415 (= lt!72549 (containsKey!176 (toList!863 e!90339) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(assert (=> d!43415 (= (contains!902 e!90339 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) lt!72546)))

(declare-fun b!138918 () Bool)

(declare-fun lt!72547 () Unit!4358)

(assert (=> b!138918 (= e!90507 lt!72547)))

(assert (=> b!138918 (= lt!72547 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!863 e!90339) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(assert (=> b!138918 (isDefined!126 (getValueByKey!172 (toList!863 e!90339) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-fun b!138919 () Bool)

(declare-fun Unit!4373 () Unit!4358)

(assert (=> b!138919 (= e!90507 Unit!4373)))

(declare-fun b!138920 () Bool)

(assert (=> b!138920 (= e!90508 (isDefined!126 (getValueByKey!172 (toList!863 e!90339) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355))))))

(assert (= (and d!43415 c!26061) b!138918))

(assert (= (and d!43415 (not c!26061)) b!138919))

(assert (= (and d!43415 (not res!66421)) b!138920))

(assert (=> d!43415 m!165195))

(declare-fun m!165751 () Bool)

(assert (=> d!43415 m!165751))

(assert (=> b!138918 m!165195))

(declare-fun m!165753 () Bool)

(assert (=> b!138918 m!165753))

(assert (=> b!138918 m!165195))

(declare-fun m!165755 () Bool)

(assert (=> b!138918 m!165755))

(assert (=> b!138918 m!165755))

(declare-fun m!165757 () Bool)

(assert (=> b!138918 m!165757))

(assert (=> b!138920 m!165195))

(assert (=> b!138920 m!165755))

(assert (=> b!138920 m!165755))

(assert (=> b!138920 m!165757))

(assert (=> bm!15245 d!43415))

(declare-fun d!43417 () Bool)

(declare-fun e!90509 () Bool)

(assert (=> d!43417 e!90509))

(declare-fun res!66423 () Bool)

(assert (=> d!43417 (=> (not res!66423) (not e!90509))))

(declare-fun lt!72551 () ListLongMap!1695)

(assert (=> d!43417 (= res!66423 (contains!902 lt!72551 (_1!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(declare-fun lt!72552 () List!1726)

(assert (=> d!43417 (= lt!72551 (ListLongMap!1696 lt!72552))))

(declare-fun lt!72550 () Unit!4358)

(declare-fun lt!72553 () Unit!4358)

(assert (=> d!43417 (= lt!72550 lt!72553)))

(assert (=> d!43417 (= (getValueByKey!172 lt!72552 (_1!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))) (Some!177 (_2!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (=> d!43417 (= lt!72553 (lemmaContainsTupThenGetReturnValue!90 lt!72552 (_1!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992))))) (_2!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (=> d!43417 (= lt!72552 (insertStrictlySorted!93 (toList!863 call!15265) (_1!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992))))) (_2!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (=> d!43417 (= (+!165 call!15265 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72551)))

(declare-fun b!138921 () Bool)

(declare-fun res!66422 () Bool)

(assert (=> b!138921 (=> (not res!66422) (not e!90509))))

(assert (=> b!138921 (= res!66422 (= (getValueByKey!172 (toList!863 lt!72551) (_1!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))) (Some!177 (_2!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992))))))))))

(declare-fun b!138922 () Bool)

(assert (=> b!138922 (= e!90509 (contains!905 (toList!863 lt!72551) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3248 (underlying!468 thiss!992))))))))

(assert (= (and d!43417 res!66423) b!138921))

(assert (= (and b!138921 res!66422) b!138922))

(declare-fun m!165759 () Bool)

(assert (=> d!43417 m!165759))

(declare-fun m!165761 () Bool)

(assert (=> d!43417 m!165761))

(declare-fun m!165763 () Bool)

(assert (=> d!43417 m!165763))

(declare-fun m!165765 () Bool)

(assert (=> d!43417 m!165765))

(declare-fun m!165767 () Bool)

(assert (=> b!138921 m!165767))

(declare-fun m!165769 () Bool)

(assert (=> b!138922 m!165769))

(assert (=> b!138688 d!43417))

(assert (=> b!138641 d!43363))

(declare-fun b!138931 () Bool)

(declare-fun e!90517 () Bool)

(declare-fun e!90516 () Bool)

(assert (=> b!138931 (= e!90517 e!90516)))

(declare-fun c!26064 () Bool)

(assert (=> b!138931 (= c!26064 (validKeyInArray!0 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138932 () Bool)

(declare-fun call!15311 () Bool)

(assert (=> b!138932 (= e!90516 call!15311)))

(declare-fun bm!15308 () Bool)

(assert (=> bm!15308 (= call!15311 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4674 newMap!16) (mask!7247 newMap!16)))))

(declare-fun d!43419 () Bool)

(declare-fun res!66429 () Bool)

(assert (=> d!43419 (=> res!66429 e!90517)))

(assert (=> d!43419 (= res!66429 (bvsge #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))

(assert (=> d!43419 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4674 newMap!16) (mask!7247 newMap!16)) e!90517)))

(declare-fun b!138933 () Bool)

(declare-fun e!90518 () Bool)

(assert (=> b!138933 (= e!90516 e!90518)))

(declare-fun lt!72562 () (_ BitVec 64))

(assert (=> b!138933 (= lt!72562 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72560 () Unit!4358)

(assert (=> b!138933 (= lt!72560 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4674 newMap!16) lt!72562 #b00000000000000000000000000000000))))

(assert (=> b!138933 (arrayContainsKey!0 (_keys!4674 newMap!16) lt!72562 #b00000000000000000000000000000000)))

(declare-fun lt!72561 () Unit!4358)

(assert (=> b!138933 (= lt!72561 lt!72560)))

(declare-fun res!66428 () Bool)

(assert (=> b!138933 (= res!66428 (= (seekEntryOrOpen!0 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000) (_keys!4674 newMap!16) (mask!7247 newMap!16)) (Found!280 #b00000000000000000000000000000000)))))

(assert (=> b!138933 (=> (not res!66428) (not e!90518))))

(declare-fun b!138934 () Bool)

(assert (=> b!138934 (= e!90518 call!15311)))

(assert (= (and d!43419 (not res!66429)) b!138931))

(assert (= (and b!138931 c!26064) b!138933))

(assert (= (and b!138931 (not c!26064)) b!138932))

(assert (= (and b!138933 res!66428) b!138934))

(assert (= (or b!138934 b!138932) bm!15308))

(assert (=> b!138931 m!165531))

(assert (=> b!138931 m!165531))

(assert (=> b!138931 m!165533))

(declare-fun m!165771 () Bool)

(assert (=> bm!15308 m!165771))

(assert (=> b!138933 m!165531))

(declare-fun m!165773 () Bool)

(assert (=> b!138933 m!165773))

(declare-fun m!165775 () Bool)

(assert (=> b!138933 m!165775))

(assert (=> b!138933 m!165531))

(declare-fun m!165777 () Bool)

(assert (=> b!138933 m!165777))

(assert (=> b!138473 d!43419))

(assert (=> d!43369 d!43403))

(declare-fun d!43421 () Bool)

(declare-fun e!90520 () Bool)

(assert (=> d!43421 e!90520))

(declare-fun res!66430 () Bool)

(assert (=> d!43421 (=> res!66430 e!90520)))

(declare-fun lt!72563 () Bool)

(assert (=> d!43421 (= res!66430 (not lt!72563))))

(declare-fun lt!72566 () Bool)

(assert (=> d!43421 (= lt!72563 lt!72566)))

(declare-fun lt!72565 () Unit!4358)

(declare-fun e!90519 () Unit!4358)

(assert (=> d!43421 (= lt!72565 e!90519)))

(declare-fun c!26065 () Bool)

(assert (=> d!43421 (= c!26065 lt!72566)))

(assert (=> d!43421 (= lt!72566 (containsKey!176 (toList!863 lt!72331) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!43421 (= (contains!902 lt!72331 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!72563)))

(declare-fun b!138935 () Bool)

(declare-fun lt!72564 () Unit!4358)

(assert (=> b!138935 (= e!90519 lt!72564)))

(assert (=> b!138935 (= lt!72564 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!863 lt!72331) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!138935 (isDefined!126 (getValueByKey!172 (toList!863 lt!72331) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!138936 () Bool)

(declare-fun Unit!4374 () Unit!4358)

(assert (=> b!138936 (= e!90519 Unit!4374)))

(declare-fun b!138937 () Bool)

(assert (=> b!138937 (= e!90520 (isDefined!126 (getValueByKey!172 (toList!863 lt!72331) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!43421 c!26065) b!138935))

(assert (= (and d!43421 (not c!26065)) b!138936))

(assert (= (and d!43421 (not res!66430)) b!138937))

(assert (=> d!43421 m!165381))

(declare-fun m!165779 () Bool)

(assert (=> d!43421 m!165779))

(assert (=> b!138935 m!165381))

(declare-fun m!165781 () Bool)

(assert (=> b!138935 m!165781))

(assert (=> b!138935 m!165381))

(declare-fun m!165783 () Bool)

(assert (=> b!138935 m!165783))

(assert (=> b!138935 m!165783))

(declare-fun m!165785 () Bool)

(assert (=> b!138935 m!165785))

(assert (=> b!138937 m!165381))

(assert (=> b!138937 m!165783))

(assert (=> b!138937 m!165783))

(assert (=> b!138937 m!165785))

(assert (=> b!138697 d!43421))

(declare-fun d!43423 () Bool)

(assert (=> d!43423 (= (get!1509 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3247 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(assert (=> b!138629 d!43423))

(declare-fun d!43425 () Bool)

(assert (=> d!43425 (= (validKeyInArray!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138486 d!43425))

(declare-fun d!43427 () Bool)

(declare-fun get!1511 (Option!178) V!3529)

(assert (=> d!43427 (= (apply!118 lt!72331 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1511 (getValueByKey!172 (toList!863 lt!72331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5798 () Bool)

(assert (= bs!5798 d!43427))

(assert (=> bs!5798 m!165525))

(assert (=> bs!5798 m!165525))

(declare-fun m!165787 () Bool)

(assert (=> bs!5798 m!165787))

(assert (=> b!138699 d!43427))

(declare-fun d!43429 () Bool)

(declare-fun lt!72569 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!136 (List!1725) (InoxSet (_ BitVec 64)))

(assert (=> d!43429 (= lt!72569 (select (content!136 Nil!1722) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!90525 () Bool)

(assert (=> d!43429 (= lt!72569 e!90525)))

(declare-fun res!66435 () Bool)

(assert (=> d!43429 (=> (not res!66435) (not e!90525))))

(assert (=> d!43429 (= res!66435 ((_ is Cons!1721) Nil!1722))))

(assert (=> d!43429 (= (contains!904 Nil!1722 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000)) lt!72569)))

(declare-fun b!138942 () Bool)

(declare-fun e!90526 () Bool)

(assert (=> b!138942 (= e!90525 e!90526)))

(declare-fun res!66436 () Bool)

(assert (=> b!138942 (=> res!66436 e!90526)))

(assert (=> b!138942 (= res!66436 (= (h!2328 Nil!1722) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!138943 () Bool)

(assert (=> b!138943 (= e!90526 (contains!904 (t!6260 Nil!1722) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!43429 res!66435) b!138942))

(assert (= (and b!138942 (not res!66436)) b!138943))

(declare-fun m!165789 () Bool)

(assert (=> d!43429 m!165789))

(assert (=> d!43429 m!165305))

(declare-fun m!165791 () Bool)

(assert (=> d!43429 m!165791))

(assert (=> b!138943 m!165305))

(declare-fun m!165793 () Bool)

(assert (=> b!138943 m!165793))

(assert (=> b!138487 d!43429))

(assert (=> d!43367 d!43385))

(declare-fun d!43431 () Bool)

(declare-fun e!90527 () Bool)

(assert (=> d!43431 e!90527))

(declare-fun res!66438 () Bool)

(assert (=> d!43431 (=> (not res!66438) (not e!90527))))

(declare-fun lt!72571 () ListLongMap!1695)

(assert (=> d!43431 (= res!66438 (contains!902 lt!72571 (_1!1326 (tuple2!2631 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(declare-fun lt!72572 () List!1726)

(assert (=> d!43431 (= lt!72571 (ListLongMap!1696 lt!72572))))

(declare-fun lt!72570 () Unit!4358)

(declare-fun lt!72573 () Unit!4358)

(assert (=> d!43431 (= lt!72570 lt!72573)))

(assert (=> d!43431 (= (getValueByKey!172 lt!72572 (_1!1326 (tuple2!2631 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))) (Some!177 (_2!1326 (tuple2!2631 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (=> d!43431 (= lt!72573 (lemmaContainsTupThenGetReturnValue!90 lt!72572 (_1!1326 (tuple2!2631 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992))))) (_2!1326 (tuple2!2631 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (=> d!43431 (= lt!72572 (insertStrictlySorted!93 (toList!863 lt!72333) (_1!1326 (tuple2!2631 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992))))) (_2!1326 (tuple2!2631 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (=> d!43431 (= (+!165 lt!72333 (tuple2!2631 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72571)))

(declare-fun b!138944 () Bool)

(declare-fun res!66437 () Bool)

(assert (=> b!138944 (=> (not res!66437) (not e!90527))))

(assert (=> b!138944 (= res!66437 (= (getValueByKey!172 (toList!863 lt!72571) (_1!1326 (tuple2!2631 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))) (Some!177 (_2!1326 (tuple2!2631 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992))))))))))

(declare-fun b!138945 () Bool)

(assert (=> b!138945 (= e!90527 (contains!905 (toList!863 lt!72571) (tuple2!2631 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992))))))))

(assert (= (and d!43431 res!66438) b!138944))

(assert (= (and b!138944 res!66437) b!138945))

(declare-fun m!165795 () Bool)

(assert (=> d!43431 m!165795))

(declare-fun m!165797 () Bool)

(assert (=> d!43431 m!165797))

(declare-fun m!165799 () Bool)

(assert (=> d!43431 m!165799))

(declare-fun m!165801 () Bool)

(assert (=> d!43431 m!165801))

(declare-fun m!165803 () Bool)

(assert (=> b!138944 m!165803))

(declare-fun m!165805 () Bool)

(assert (=> b!138945 m!165805))

(assert (=> b!138695 d!43431))

(declare-fun d!43433 () Bool)

(assert (=> d!43433 (= (apply!118 lt!72338 lt!72335) (get!1511 (getValueByKey!172 (toList!863 lt!72338) lt!72335)))))

(declare-fun bs!5799 () Bool)

(assert (= bs!5799 d!43433))

(declare-fun m!165807 () Bool)

(assert (=> bs!5799 m!165807))

(assert (=> bs!5799 m!165807))

(declare-fun m!165809 () Bool)

(assert (=> bs!5799 m!165809))

(assert (=> b!138695 d!43433))

(declare-fun d!43435 () Bool)

(assert (=> d!43435 (= (apply!118 lt!72333 lt!72325) (get!1511 (getValueByKey!172 (toList!863 lt!72333) lt!72325)))))

(declare-fun bs!5800 () Bool)

(assert (= bs!5800 d!43435))

(declare-fun m!165811 () Bool)

(assert (=> bs!5800 m!165811))

(assert (=> bs!5800 m!165811))

(declare-fun m!165813 () Bool)

(assert (=> bs!5800 m!165813))

(assert (=> b!138695 d!43435))

(declare-fun d!43437 () Bool)

(declare-fun e!90528 () Bool)

(assert (=> d!43437 e!90528))

(declare-fun res!66440 () Bool)

(assert (=> d!43437 (=> (not res!66440) (not e!90528))))

(declare-fun lt!72575 () ListLongMap!1695)

(assert (=> d!43437 (= res!66440 (contains!902 lt!72575 (_1!1326 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(declare-fun lt!72576 () List!1726)

(assert (=> d!43437 (= lt!72575 (ListLongMap!1696 lt!72576))))

(declare-fun lt!72574 () Unit!4358)

(declare-fun lt!72577 () Unit!4358)

(assert (=> d!43437 (= lt!72574 lt!72577)))

(assert (=> d!43437 (= (getValueByKey!172 lt!72576 (_1!1326 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))) (Some!177 (_2!1326 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (=> d!43437 (= lt!72577 (lemmaContainsTupThenGetReturnValue!90 lt!72576 (_1!1326 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))) (_2!1326 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (=> d!43437 (= lt!72576 (insertStrictlySorted!93 (toList!863 lt!72329) (_1!1326 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))) (_2!1326 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (=> d!43437 (= (+!165 lt!72329 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72575)))

(declare-fun b!138946 () Bool)

(declare-fun res!66439 () Bool)

(assert (=> b!138946 (=> (not res!66439) (not e!90528))))

(assert (=> b!138946 (= res!66439 (= (getValueByKey!172 (toList!863 lt!72575) (_1!1326 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))) (Some!177 (_2!1326 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))))))))

(declare-fun b!138947 () Bool)

(assert (=> b!138947 (= e!90528 (contains!905 (toList!863 lt!72575) (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))))))

(assert (= (and d!43437 res!66440) b!138946))

(assert (= (and b!138946 res!66439) b!138947))

(declare-fun m!165815 () Bool)

(assert (=> d!43437 m!165815))

(declare-fun m!165817 () Bool)

(assert (=> d!43437 m!165817))

(declare-fun m!165819 () Bool)

(assert (=> d!43437 m!165819))

(declare-fun m!165821 () Bool)

(assert (=> d!43437 m!165821))

(declare-fun m!165823 () Bool)

(assert (=> b!138946 m!165823))

(declare-fun m!165825 () Bool)

(assert (=> b!138947 m!165825))

(assert (=> b!138695 d!43437))

(declare-fun d!43439 () Bool)

(declare-fun e!90529 () Bool)

(assert (=> d!43439 e!90529))

(declare-fun res!66442 () Bool)

(assert (=> d!43439 (=> (not res!66442) (not e!90529))))

(declare-fun lt!72579 () ListLongMap!1695)

(assert (=> d!43439 (= res!66442 (contains!902 lt!72579 (_1!1326 (tuple2!2631 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(declare-fun lt!72580 () List!1726)

(assert (=> d!43439 (= lt!72579 (ListLongMap!1696 lt!72580))))

(declare-fun lt!72578 () Unit!4358)

(declare-fun lt!72581 () Unit!4358)

(assert (=> d!43439 (= lt!72578 lt!72581)))

(assert (=> d!43439 (= (getValueByKey!172 lt!72580 (_1!1326 (tuple2!2631 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))) (Some!177 (_2!1326 (tuple2!2631 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (=> d!43439 (= lt!72581 (lemmaContainsTupThenGetReturnValue!90 lt!72580 (_1!1326 (tuple2!2631 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))) (_2!1326 (tuple2!2631 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (=> d!43439 (= lt!72580 (insertStrictlySorted!93 (toList!863 lt!72338) (_1!1326 (tuple2!2631 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))) (_2!1326 (tuple2!2631 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (=> d!43439 (= (+!165 lt!72338 (tuple2!2631 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72579)))

(declare-fun b!138948 () Bool)

(declare-fun res!66441 () Bool)

(assert (=> b!138948 (=> (not res!66441) (not e!90529))))

(assert (=> b!138948 (= res!66441 (= (getValueByKey!172 (toList!863 lt!72579) (_1!1326 (tuple2!2631 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))) (Some!177 (_2!1326 (tuple2!2631 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))))))))

(declare-fun b!138949 () Bool)

(assert (=> b!138949 (= e!90529 (contains!905 (toList!863 lt!72579) (tuple2!2631 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))))))

(assert (= (and d!43439 res!66442) b!138948))

(assert (= (and b!138948 res!66441) b!138949))

(declare-fun m!165827 () Bool)

(assert (=> d!43439 m!165827))

(declare-fun m!165829 () Bool)

(assert (=> d!43439 m!165829))

(declare-fun m!165831 () Bool)

(assert (=> d!43439 m!165831))

(declare-fun m!165833 () Bool)

(assert (=> d!43439 m!165833))

(declare-fun m!165835 () Bool)

(assert (=> b!138948 m!165835))

(declare-fun m!165837 () Bool)

(assert (=> b!138949 m!165837))

(assert (=> b!138695 d!43439))

(declare-fun d!43441 () Bool)

(assert (=> d!43441 (= (apply!118 (+!165 lt!72338 (tuple2!2631 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72335) (get!1511 (getValueByKey!172 (toList!863 (+!165 lt!72338 (tuple2!2631 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))) lt!72335)))))

(declare-fun bs!5801 () Bool)

(assert (= bs!5801 d!43441))

(declare-fun m!165839 () Bool)

(assert (=> bs!5801 m!165839))

(assert (=> bs!5801 m!165839))

(declare-fun m!165841 () Bool)

(assert (=> bs!5801 m!165841))

(assert (=> b!138695 d!43441))

(declare-fun d!43443 () Bool)

(assert (=> d!43443 (contains!902 (+!165 lt!72329 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72328)))

(declare-fun lt!72584 () Unit!4358)

(declare-fun choose!855 (ListLongMap!1695 (_ BitVec 64) V!3529 (_ BitVec 64)) Unit!4358)

(assert (=> d!43443 (= lt!72584 (choose!855 lt!72329 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) lt!72328))))

(assert (=> d!43443 (contains!902 lt!72329 lt!72328)))

(assert (=> d!43443 (= (addStillContains!94 lt!72329 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) lt!72328) lt!72584)))

(declare-fun bs!5802 () Bool)

(assert (= bs!5802 d!43443))

(assert (=> bs!5802 m!165407))

(assert (=> bs!5802 m!165407))

(assert (=> bs!5802 m!165413))

(declare-fun m!165843 () Bool)

(assert (=> bs!5802 m!165843))

(declare-fun m!165845 () Bool)

(assert (=> bs!5802 m!165845))

(assert (=> b!138695 d!43443))

(declare-fun d!43445 () Bool)

(declare-fun e!90531 () Bool)

(assert (=> d!43445 e!90531))

(declare-fun res!66443 () Bool)

(assert (=> d!43445 (=> res!66443 e!90531)))

(declare-fun lt!72585 () Bool)

(assert (=> d!43445 (= res!66443 (not lt!72585))))

(declare-fun lt!72588 () Bool)

(assert (=> d!43445 (= lt!72585 lt!72588)))

(declare-fun lt!72587 () Unit!4358)

(declare-fun e!90530 () Unit!4358)

(assert (=> d!43445 (= lt!72587 e!90530)))

(declare-fun c!26066 () Bool)

(assert (=> d!43445 (= c!26066 lt!72588)))

(assert (=> d!43445 (= lt!72588 (containsKey!176 (toList!863 (+!165 lt!72329 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))) lt!72328))))

(assert (=> d!43445 (= (contains!902 (+!165 lt!72329 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72328) lt!72585)))

(declare-fun b!138951 () Bool)

(declare-fun lt!72586 () Unit!4358)

(assert (=> b!138951 (= e!90530 lt!72586)))

(assert (=> b!138951 (= lt!72586 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!863 (+!165 lt!72329 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))) lt!72328))))

(assert (=> b!138951 (isDefined!126 (getValueByKey!172 (toList!863 (+!165 lt!72329 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))) lt!72328))))

(declare-fun b!138952 () Bool)

(declare-fun Unit!4375 () Unit!4358)

(assert (=> b!138952 (= e!90530 Unit!4375)))

(declare-fun b!138953 () Bool)

(assert (=> b!138953 (= e!90531 (isDefined!126 (getValueByKey!172 (toList!863 (+!165 lt!72329 (tuple2!2631 lt!72324 (zeroValue!2769 (v!3248 (underlying!468 thiss!992)))))) lt!72328)))))

(assert (= (and d!43445 c!26066) b!138951))

(assert (= (and d!43445 (not c!26066)) b!138952))

(assert (= (and d!43445 (not res!66443)) b!138953))

(declare-fun m!165847 () Bool)

(assert (=> d!43445 m!165847))

(declare-fun m!165849 () Bool)

(assert (=> b!138951 m!165849))

(declare-fun m!165851 () Bool)

(assert (=> b!138951 m!165851))

(assert (=> b!138951 m!165851))

(declare-fun m!165853 () Bool)

(assert (=> b!138951 m!165853))

(assert (=> b!138953 m!165851))

(assert (=> b!138953 m!165851))

(assert (=> b!138953 m!165853))

(assert (=> b!138695 d!43445))

(declare-fun d!43447 () Bool)

(assert (=> d!43447 (= (apply!118 (+!165 lt!72332 (tuple2!2631 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72334) (get!1511 (getValueByKey!172 (toList!863 (+!165 lt!72332 (tuple2!2631 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))) lt!72334)))))

(declare-fun bs!5803 () Bool)

(assert (= bs!5803 d!43447))

(declare-fun m!165855 () Bool)

(assert (=> bs!5803 m!165855))

(assert (=> bs!5803 m!165855))

(declare-fun m!165857 () Bool)

(assert (=> bs!5803 m!165857))

(assert (=> b!138695 d!43447))

(declare-fun d!43449 () Bool)

(assert (=> d!43449 (= (apply!118 (+!165 lt!72338 (tuple2!2631 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72335) (apply!118 lt!72338 lt!72335))))

(declare-fun lt!72591 () Unit!4358)

(declare-fun choose!856 (ListLongMap!1695 (_ BitVec 64) V!3529 (_ BitVec 64)) Unit!4358)

(assert (=> d!43449 (= lt!72591 (choose!856 lt!72338 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) lt!72335))))

(declare-fun e!90534 () Bool)

(assert (=> d!43449 e!90534))

(declare-fun res!66446 () Bool)

(assert (=> d!43449 (=> (not res!66446) (not e!90534))))

(assert (=> d!43449 (= res!66446 (contains!902 lt!72338 lt!72335))))

(assert (=> d!43449 (= (addApplyDifferent!94 lt!72338 lt!72343 (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) lt!72335) lt!72591)))

(declare-fun b!138957 () Bool)

(assert (=> b!138957 (= e!90534 (not (= lt!72335 lt!72343)))))

(assert (= (and d!43449 res!66446) b!138957))

(assert (=> d!43449 m!165409))

(assert (=> d!43449 m!165399))

(assert (=> d!43449 m!165409))

(assert (=> d!43449 m!165411))

(declare-fun m!165859 () Bool)

(assert (=> d!43449 m!165859))

(declare-fun m!165861 () Bool)

(assert (=> d!43449 m!165861))

(assert (=> b!138695 d!43449))

(declare-fun d!43451 () Bool)

(assert (=> d!43451 (= (apply!118 (+!165 lt!72332 (tuple2!2631 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72334) (apply!118 lt!72332 lt!72334))))

(declare-fun lt!72592 () Unit!4358)

(assert (=> d!43451 (= lt!72592 (choose!856 lt!72332 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992))) lt!72334))))

(declare-fun e!90535 () Bool)

(assert (=> d!43451 e!90535))

(declare-fun res!66447 () Bool)

(assert (=> d!43451 (=> (not res!66447) (not e!90535))))

(assert (=> d!43451 (= res!66447 (contains!902 lt!72332 lt!72334))))

(assert (=> d!43451 (= (addApplyDifferent!94 lt!72332 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992))) lt!72334) lt!72592)))

(declare-fun b!138958 () Bool)

(assert (=> b!138958 (= e!90535 (not (= lt!72334 lt!72345)))))

(assert (= (and d!43451 res!66447) b!138958))

(assert (=> d!43451 m!165403))

(assert (=> d!43451 m!165425))

(assert (=> d!43451 m!165403))

(assert (=> d!43451 m!165405))

(declare-fun m!165863 () Bool)

(assert (=> d!43451 m!165863))

(declare-fun m!165865 () Bool)

(assert (=> d!43451 m!165865))

(assert (=> b!138695 d!43451))

(declare-fun d!43453 () Bool)

(assert (=> d!43453 (= (apply!118 (+!165 lt!72333 (tuple2!2631 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72325) (apply!118 lt!72333 lt!72325))))

(declare-fun lt!72593 () Unit!4358)

(assert (=> d!43453 (= lt!72593 (choose!856 lt!72333 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992))) lt!72325))))

(declare-fun e!90536 () Bool)

(assert (=> d!43453 e!90536))

(declare-fun res!66448 () Bool)

(assert (=> d!43453 (=> (not res!66448) (not e!90536))))

(assert (=> d!43453 (= res!66448 (contains!902 lt!72333 lt!72325))))

(assert (=> d!43453 (= (addApplyDifferent!94 lt!72333 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992))) lt!72325) lt!72593)))

(declare-fun b!138959 () Bool)

(assert (=> b!138959 (= e!90536 (not (= lt!72325 lt!72342)))))

(assert (= (and d!43453 res!66448) b!138959))

(assert (=> d!43453 m!165401))

(assert (=> d!43453 m!165417))

(assert (=> d!43453 m!165401))

(assert (=> d!43453 m!165419))

(declare-fun m!165867 () Bool)

(assert (=> d!43453 m!165867))

(declare-fun m!165869 () Bool)

(assert (=> d!43453 m!165869))

(assert (=> b!138695 d!43453))

(declare-fun b!138984 () Bool)

(declare-fun e!90551 () ListLongMap!1695)

(declare-fun call!15314 () ListLongMap!1695)

(assert (=> b!138984 (= e!90551 call!15314)))

(declare-fun lt!72608 () ListLongMap!1695)

(declare-fun b!138985 () Bool)

(declare-fun e!90552 () Bool)

(assert (=> b!138985 (= e!90552 (= lt!72608 (getCurrentListMapNoExtraKeys!130 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (_values!2901 (v!3248 (underlying!468 thiss!992))) (mask!7247 (v!3248 (underlying!468 thiss!992))) (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) (minValue!2769 (v!3248 (underlying!468 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))))))))

(declare-fun bm!15311 () Bool)

(assert (=> bm!15311 (= call!15314 (getCurrentListMapNoExtraKeys!130 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (_values!2901 (v!3248 (underlying!468 thiss!992))) (mask!7247 (v!3248 (underlying!468 thiss!992))) (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) (minValue!2769 (v!3248 (underlying!468 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun b!138986 () Bool)

(declare-fun e!90554 () ListLongMap!1695)

(assert (=> b!138986 (= e!90554 (ListLongMap!1696 Nil!1723))))

(declare-fun b!138987 () Bool)

(declare-fun e!90557 () Bool)

(assert (=> b!138987 (= e!90557 (validKeyInArray!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!138987 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!138988 () Bool)

(assert (=> b!138988 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))))))

(assert (=> b!138988 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2557 (_values!2901 (v!3248 (underlying!468 thiss!992))))))))

(declare-fun e!90556 () Bool)

(assert (=> b!138988 (= e!90556 (= (apply!118 lt!72608 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!138989 () Bool)

(declare-fun e!90553 () Bool)

(declare-fun e!90555 () Bool)

(assert (=> b!138989 (= e!90553 e!90555)))

(declare-fun c!26078 () Bool)

(assert (=> b!138989 (= c!26078 e!90557)))

(declare-fun res!66460 () Bool)

(assert (=> b!138989 (=> (not res!66460) (not e!90557))))

(assert (=> b!138989 (= res!66460 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))))))

(declare-fun b!138990 () Bool)

(assert (=> b!138990 (= e!90554 e!90551)))

(declare-fun c!26077 () Bool)

(assert (=> b!138990 (= c!26077 (validKeyInArray!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!43455 () Bool)

(assert (=> d!43455 e!90553))

(declare-fun res!66457 () Bool)

(assert (=> d!43455 (=> (not res!66457) (not e!90553))))

(assert (=> d!43455 (= res!66457 (not (contains!902 lt!72608 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43455 (= lt!72608 e!90554)))

(declare-fun c!26076 () Bool)

(assert (=> d!43455 (= c!26076 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))))))

(assert (=> d!43455 (validMask!0 (mask!7247 (v!3248 (underlying!468 thiss!992))))))

(assert (=> d!43455 (= (getCurrentListMapNoExtraKeys!130 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (_values!2901 (v!3248 (underlying!468 thiss!992))) (mask!7247 (v!3248 (underlying!468 thiss!992))) (extraKeys!2675 (v!3248 (underlying!468 thiss!992))) (zeroValue!2769 (v!3248 (underlying!468 thiss!992))) (minValue!2769 (v!3248 (underlying!468 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992)))) lt!72608)))

(declare-fun b!138991 () Bool)

(declare-fun res!66458 () Bool)

(assert (=> b!138991 (=> (not res!66458) (not e!90553))))

(assert (=> b!138991 (= res!66458 (not (contains!902 lt!72608 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!138992 () Bool)

(declare-fun lt!72612 () Unit!4358)

(declare-fun lt!72610 () Unit!4358)

(assert (=> b!138992 (= lt!72612 lt!72610)))

(declare-fun lt!72609 () ListLongMap!1695)

(declare-fun lt!72614 () V!3529)

(declare-fun lt!72613 () (_ BitVec 64))

(declare-fun lt!72611 () (_ BitVec 64))

(assert (=> b!138992 (not (contains!902 (+!165 lt!72609 (tuple2!2631 lt!72611 lt!72614)) lt!72613))))

(declare-fun addStillNotContains!64 (ListLongMap!1695 (_ BitVec 64) V!3529 (_ BitVec 64)) Unit!4358)

(assert (=> b!138992 (= lt!72610 (addStillNotContains!64 lt!72609 lt!72611 lt!72614 lt!72613))))

(assert (=> b!138992 (= lt!72613 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!138992 (= lt!72614 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138992 (= lt!72611 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!138992 (= lt!72609 call!15314)))

(assert (=> b!138992 (= e!90551 (+!165 call!15314 (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!138993 () Bool)

(assert (=> b!138993 (= e!90555 e!90556)))

(assert (=> b!138993 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))))))

(declare-fun res!66459 () Bool)

(assert (=> b!138993 (= res!66459 (contains!902 lt!72608 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!138993 (=> (not res!66459) (not e!90556))))

(declare-fun b!138994 () Bool)

(declare-fun isEmpty!419 (ListLongMap!1695) Bool)

(assert (=> b!138994 (= e!90552 (isEmpty!419 lt!72608))))

(declare-fun b!138995 () Bool)

(assert (=> b!138995 (= e!90555 e!90552)))

(declare-fun c!26075 () Bool)

(assert (=> b!138995 (= c!26075 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))))))

(assert (= (and d!43455 c!26076) b!138986))

(assert (= (and d!43455 (not c!26076)) b!138990))

(assert (= (and b!138990 c!26077) b!138992))

(assert (= (and b!138990 (not c!26077)) b!138984))

(assert (= (or b!138992 b!138984) bm!15311))

(assert (= (and d!43455 res!66457) b!138991))

(assert (= (and b!138991 res!66458) b!138989))

(assert (= (and b!138989 res!66460) b!138987))

(assert (= (and b!138989 c!26078) b!138993))

(assert (= (and b!138989 (not c!26078)) b!138995))

(assert (= (and b!138993 res!66459) b!138988))

(assert (= (and b!138995 c!26075) b!138985))

(assert (= (and b!138995 (not c!26075)) b!138994))

(declare-fun b_lambda!6203 () Bool)

(assert (=> (not b_lambda!6203) (not b!138988)))

(assert (=> b!138988 t!6257))

(declare-fun b_and!8633 () Bool)

(assert (= b_and!8629 (and (=> t!6257 result!4105) b_and!8633)))

(assert (=> b!138988 t!6259))

(declare-fun b_and!8635 () Bool)

(assert (= b_and!8631 (and (=> t!6259 result!4109) b_and!8635)))

(declare-fun b_lambda!6205 () Bool)

(assert (=> (not b_lambda!6205) (not b!138992)))

(assert (=> b!138992 t!6257))

(declare-fun b_and!8637 () Bool)

(assert (= b_and!8633 (and (=> t!6257 result!4105) b_and!8637)))

(assert (=> b!138992 t!6259))

(declare-fun b_and!8639 () Bool)

(assert (= b_and!8635 (and (=> t!6259 result!4109) b_and!8639)))

(assert (=> b!138993 m!165381))

(assert (=> b!138993 m!165381))

(declare-fun m!165871 () Bool)

(assert (=> b!138993 m!165871))

(declare-fun m!165873 () Bool)

(assert (=> b!138985 m!165873))

(declare-fun m!165875 () Bool)

(assert (=> b!138991 m!165875))

(assert (=> b!138988 m!165431))

(assert (=> b!138988 m!165431))

(assert (=> b!138988 m!165191))

(assert (=> b!138988 m!165433))

(assert (=> b!138988 m!165381))

(assert (=> b!138988 m!165381))

(declare-fun m!165877 () Bool)

(assert (=> b!138988 m!165877))

(assert (=> b!138988 m!165191))

(declare-fun m!165879 () Bool)

(assert (=> d!43455 m!165879))

(assert (=> d!43455 m!165387))

(assert (=> bm!15311 m!165873))

(declare-fun m!165881 () Bool)

(assert (=> b!138994 m!165881))

(assert (=> b!138990 m!165381))

(assert (=> b!138990 m!165381))

(assert (=> b!138990 m!165391))

(assert (=> b!138992 m!165431))

(declare-fun m!165883 () Bool)

(assert (=> b!138992 m!165883))

(assert (=> b!138992 m!165381))

(declare-fun m!165885 () Bool)

(assert (=> b!138992 m!165885))

(assert (=> b!138992 m!165883))

(declare-fun m!165887 () Bool)

(assert (=> b!138992 m!165887))

(assert (=> b!138992 m!165191))

(declare-fun m!165889 () Bool)

(assert (=> b!138992 m!165889))

(assert (=> b!138992 m!165431))

(assert (=> b!138992 m!165191))

(assert (=> b!138992 m!165433))

(assert (=> b!138987 m!165381))

(assert (=> b!138987 m!165381))

(assert (=> b!138987 m!165391))

(assert (=> b!138695 d!43455))

(declare-fun d!43457 () Bool)

(assert (=> d!43457 (= (apply!118 (+!165 lt!72333 (tuple2!2631 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72325) (get!1511 (getValueByKey!172 (toList!863 (+!165 lt!72333 (tuple2!2631 lt!72342 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))) lt!72325)))))

(declare-fun bs!5804 () Bool)

(assert (= bs!5804 d!43457))

(declare-fun m!165891 () Bool)

(assert (=> bs!5804 m!165891))

(assert (=> bs!5804 m!165891))

(declare-fun m!165893 () Bool)

(assert (=> bs!5804 m!165893))

(assert (=> b!138695 d!43457))

(declare-fun d!43459 () Bool)

(assert (=> d!43459 (= (apply!118 lt!72332 lt!72334) (get!1511 (getValueByKey!172 (toList!863 lt!72332) lt!72334)))))

(declare-fun bs!5805 () Bool)

(assert (= bs!5805 d!43459))

(declare-fun m!165895 () Bool)

(assert (=> bs!5805 m!165895))

(assert (=> bs!5805 m!165895))

(declare-fun m!165897 () Bool)

(assert (=> bs!5805 m!165897))

(assert (=> b!138695 d!43459))

(declare-fun d!43461 () Bool)

(declare-fun e!90558 () Bool)

(assert (=> d!43461 e!90558))

(declare-fun res!66462 () Bool)

(assert (=> d!43461 (=> (not res!66462) (not e!90558))))

(declare-fun lt!72616 () ListLongMap!1695)

(assert (=> d!43461 (= res!66462 (contains!902 lt!72616 (_1!1326 (tuple2!2631 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(declare-fun lt!72617 () List!1726)

(assert (=> d!43461 (= lt!72616 (ListLongMap!1696 lt!72617))))

(declare-fun lt!72615 () Unit!4358)

(declare-fun lt!72618 () Unit!4358)

(assert (=> d!43461 (= lt!72615 lt!72618)))

(assert (=> d!43461 (= (getValueByKey!172 lt!72617 (_1!1326 (tuple2!2631 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))) (Some!177 (_2!1326 (tuple2!2631 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (=> d!43461 (= lt!72618 (lemmaContainsTupThenGetReturnValue!90 lt!72617 (_1!1326 (tuple2!2631 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992))))) (_2!1326 (tuple2!2631 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (=> d!43461 (= lt!72617 (insertStrictlySorted!93 (toList!863 lt!72332) (_1!1326 (tuple2!2631 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992))))) (_2!1326 (tuple2!2631 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))))))

(assert (=> d!43461 (= (+!165 lt!72332 (tuple2!2631 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992))))) lt!72616)))

(declare-fun b!138996 () Bool)

(declare-fun res!66461 () Bool)

(assert (=> b!138996 (=> (not res!66461) (not e!90558))))

(assert (=> b!138996 (= res!66461 (= (getValueByKey!172 (toList!863 lt!72616) (_1!1326 (tuple2!2631 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992)))))) (Some!177 (_2!1326 (tuple2!2631 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992))))))))))

(declare-fun b!138997 () Bool)

(assert (=> b!138997 (= e!90558 (contains!905 (toList!863 lt!72616) (tuple2!2631 lt!72345 (minValue!2769 (v!3248 (underlying!468 thiss!992))))))))

(assert (= (and d!43461 res!66462) b!138996))

(assert (= (and b!138996 res!66461) b!138997))

(declare-fun m!165899 () Bool)

(assert (=> d!43461 m!165899))

(declare-fun m!165901 () Bool)

(assert (=> d!43461 m!165901))

(declare-fun m!165903 () Bool)

(assert (=> d!43461 m!165903))

(declare-fun m!165905 () Bool)

(assert (=> d!43461 m!165905))

(declare-fun m!165907 () Bool)

(assert (=> b!138996 m!165907))

(declare-fun m!165909 () Bool)

(assert (=> b!138997 m!165909))

(assert (=> b!138695 d!43461))

(declare-fun d!43463 () Bool)

(declare-fun res!66463 () Bool)

(declare-fun e!90559 () Bool)

(assert (=> d!43463 (=> res!66463 e!90559)))

(assert (=> d!43463 (= res!66463 (= (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(assert (=> d!43463 (= (arrayContainsKey!0 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!90559)))

(declare-fun b!138998 () Bool)

(declare-fun e!90560 () Bool)

(assert (=> b!138998 (= e!90559 e!90560)))

(declare-fun res!66464 () Bool)

(assert (=> b!138998 (=> (not res!66464) (not e!90560))))

(assert (=> b!138998 (= res!66464 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))))))

(declare-fun b!138999 () Bool)

(assert (=> b!138999 (= e!90560 (arrayContainsKey!0 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!43463 (not res!66463)) b!138998))

(assert (= (and b!138998 res!66464) b!138999))

(declare-fun m!165911 () Bool)

(assert (=> d!43463 m!165911))

(assert (=> b!138999 m!165195))

(declare-fun m!165913 () Bool)

(assert (=> b!138999 m!165913))

(assert (=> b!138636 d!43463))

(declare-fun d!43465 () Bool)

(declare-fun res!66465 () Bool)

(declare-fun e!90561 () Bool)

(assert (=> d!43465 (=> (not res!66465) (not e!90561))))

(assert (=> d!43465 (= res!66465 (simpleValid!94 (_2!1327 lt!72266)))))

(assert (=> d!43465 (= (valid!550 (_2!1327 lt!72266)) e!90561)))

(declare-fun b!139000 () Bool)

(declare-fun res!66466 () Bool)

(assert (=> b!139000 (=> (not res!66466) (not e!90561))))

(assert (=> b!139000 (= res!66466 (= (arrayCountValidKeys!0 (_keys!4674 (_2!1327 lt!72266)) #b00000000000000000000000000000000 (size!2556 (_keys!4674 (_2!1327 lt!72266)))) (_size!615 (_2!1327 lt!72266))))))

(declare-fun b!139001 () Bool)

(declare-fun res!66467 () Bool)

(assert (=> b!139001 (=> (not res!66467) (not e!90561))))

(assert (=> b!139001 (= res!66467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4674 (_2!1327 lt!72266)) (mask!7247 (_2!1327 lt!72266))))))

(declare-fun b!139002 () Bool)

(assert (=> b!139002 (= e!90561 (arrayNoDuplicates!0 (_keys!4674 (_2!1327 lt!72266)) #b00000000000000000000000000000000 Nil!1722))))

(assert (= (and d!43465 res!66465) b!139000))

(assert (= (and b!139000 res!66466) b!139001))

(assert (= (and b!139001 res!66467) b!139002))

(declare-fun m!165915 () Bool)

(assert (=> d!43465 m!165915))

(declare-fun m!165917 () Bool)

(assert (=> b!139000 m!165917))

(declare-fun m!165919 () Bool)

(assert (=> b!139001 m!165919))

(declare-fun m!165921 () Bool)

(assert (=> b!139002 m!165921))

(assert (=> d!43355 d!43465))

(assert (=> d!43355 d!43349))

(declare-fun d!43467 () Bool)

(declare-fun e!90563 () Bool)

(assert (=> d!43467 e!90563))

(declare-fun res!66468 () Bool)

(assert (=> d!43467 (=> res!66468 e!90563)))

(declare-fun lt!72619 () Bool)

(assert (=> d!43467 (= res!66468 (not lt!72619))))

(declare-fun lt!72622 () Bool)

(assert (=> d!43467 (= lt!72619 lt!72622)))

(declare-fun lt!72621 () Unit!4358)

(declare-fun e!90562 () Unit!4358)

(assert (=> d!43467 (= lt!72621 e!90562)))

(declare-fun c!26079 () Bool)

(assert (=> d!43467 (= c!26079 lt!72622)))

(assert (=> d!43467 (= lt!72622 (containsKey!176 (toList!863 lt!72331) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!43467 (= (contains!902 lt!72331 #b0000000000000000000000000000000000000000000000000000000000000000) lt!72619)))

(declare-fun b!139003 () Bool)

(declare-fun lt!72620 () Unit!4358)

(assert (=> b!139003 (= e!90562 lt!72620)))

(assert (=> b!139003 (= lt!72620 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!863 lt!72331) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!139003 (isDefined!126 (getValueByKey!172 (toList!863 lt!72331) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!139004 () Bool)

(declare-fun Unit!4376 () Unit!4358)

(assert (=> b!139004 (= e!90562 Unit!4376)))

(declare-fun b!139005 () Bool)

(assert (=> b!139005 (= e!90563 (isDefined!126 (getValueByKey!172 (toList!863 lt!72331) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43467 c!26079) b!139003))

(assert (= (and d!43467 (not c!26079)) b!139004))

(assert (= (and d!43467 (not res!66468)) b!139005))

(declare-fun m!165923 () Bool)

(assert (=> d!43467 m!165923))

(declare-fun m!165925 () Bool)

(assert (=> b!139003 m!165925))

(declare-fun m!165927 () Bool)

(assert (=> b!139003 m!165927))

(assert (=> b!139003 m!165927))

(declare-fun m!165929 () Bool)

(assert (=> b!139003 m!165929))

(assert (=> b!139005 m!165927))

(assert (=> b!139005 m!165927))

(assert (=> b!139005 m!165929))

(assert (=> bm!15265 d!43467))

(declare-fun d!43469 () Bool)

(assert (=> d!43469 (= (+!165 (getCurrentListMap!527 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!527 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) lt!72257 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72625 () Unit!4358)

(declare-fun choose!857 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 V!3529 Int) Unit!4358)

(assert (=> d!43469 (= lt!72625 (choose!857 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) lt!72257 (zeroValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2769 newMap!16) (defaultEntry!2918 newMap!16)))))

(assert (=> d!43469 (validMask!0 (mask!7247 newMap!16))))

(assert (=> d!43469 (= (lemmaChangeZeroKeyThenAddPairToListMap!63 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) lt!72257 (zeroValue!2769 newMap!16) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2769 newMap!16) (defaultEntry!2918 newMap!16)) lt!72625)))

(declare-fun bs!5806 () Bool)

(assert (= bs!5806 d!43469))

(assert (=> bs!5806 m!165539))

(assert (=> bs!5806 m!165325))

(assert (=> bs!5806 m!165193))

(declare-fun m!165931 () Bool)

(assert (=> bs!5806 m!165931))

(assert (=> bs!5806 m!165193))

(declare-fun m!165933 () Bool)

(assert (=> bs!5806 m!165933))

(assert (=> bs!5806 m!165325))

(declare-fun m!165935 () Bool)

(assert (=> bs!5806 m!165935))

(assert (=> b!138620 d!43469))

(declare-fun d!43471 () Bool)

(declare-fun isEmpty!420 (Option!178) Bool)

(assert (=> d!43471 (= (isDefined!126 (getValueByKey!172 (toList!863 lt!72157) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355))) (not (isEmpty!420 (getValueByKey!172 (toList!863 lt!72157) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))))

(declare-fun bs!5807 () Bool)

(assert (= bs!5807 d!43471))

(assert (=> bs!5807 m!165317))

(declare-fun m!165937 () Bool)

(assert (=> bs!5807 m!165937))

(assert (=> b!138498 d!43471))

(declare-fun b!139014 () Bool)

(declare-fun e!90568 () Option!178)

(assert (=> b!139014 (= e!90568 (Some!177 (_2!1326 (h!2329 (toList!863 lt!72157)))))))

(declare-fun e!90569 () Option!178)

(declare-fun b!139016 () Bool)

(assert (=> b!139016 (= e!90569 (getValueByKey!172 (t!6261 (toList!863 lt!72157)) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-fun d!43473 () Bool)

(declare-fun c!26084 () Bool)

(assert (=> d!43473 (= c!26084 (and ((_ is Cons!1722) (toList!863 lt!72157)) (= (_1!1326 (h!2329 (toList!863 lt!72157))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355))))))

(assert (=> d!43473 (= (getValueByKey!172 (toList!863 lt!72157) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) e!90568)))

(declare-fun b!139017 () Bool)

(assert (=> b!139017 (= e!90569 None!176)))

(declare-fun b!139015 () Bool)

(assert (=> b!139015 (= e!90568 e!90569)))

(declare-fun c!26085 () Bool)

(assert (=> b!139015 (= c!26085 (and ((_ is Cons!1722) (toList!863 lt!72157)) (not (= (_1!1326 (h!2329 (toList!863 lt!72157))) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))))

(assert (= (and d!43473 c!26084) b!139014))

(assert (= (and d!43473 (not c!26084)) b!139015))

(assert (= (and b!139015 c!26085) b!139016))

(assert (= (and b!139015 (not c!26085)) b!139017))

(assert (=> b!139016 m!165195))

(declare-fun m!165939 () Bool)

(assert (=> b!139016 m!165939))

(assert (=> b!138498 d!43473))

(assert (=> b!138624 d!43385))

(assert (=> b!138488 d!43425))

(declare-fun d!43475 () Bool)

(assert (=> d!43475 (= (inRange!0 (ite c!25985 (ite c!25975 (index!3283 lt!72254) (ite c!25976 (index!3282 lt!72276) (index!3285 lt!72276))) (ite c!25987 (index!3283 lt!72270) (ite c!25979 (index!3282 lt!72265) (index!3285 lt!72265)))) (mask!7247 newMap!16)) (and (bvsge (ite c!25985 (ite c!25975 (index!3283 lt!72254) (ite c!25976 (index!3282 lt!72276) (index!3285 lt!72276))) (ite c!25987 (index!3283 lt!72270) (ite c!25979 (index!3282 lt!72265) (index!3285 lt!72265)))) #b00000000000000000000000000000000) (bvslt (ite c!25985 (ite c!25975 (index!3283 lt!72254) (ite c!25976 (index!3282 lt!72276) (index!3285 lt!72276))) (ite c!25987 (index!3283 lt!72270) (ite c!25979 (index!3282 lt!72265) (index!3285 lt!72265)))) (bvadd (mask!7247 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!15227 d!43475))

(declare-fun d!43477 () Bool)

(declare-fun e!90571 () Bool)

(assert (=> d!43477 e!90571))

(declare-fun res!66469 () Bool)

(assert (=> d!43477 (=> res!66469 e!90571)))

(declare-fun lt!72626 () Bool)

(assert (=> d!43477 (= res!66469 (not lt!72626))))

(declare-fun lt!72629 () Bool)

(assert (=> d!43477 (= lt!72626 lt!72629)))

(declare-fun lt!72628 () Unit!4358)

(declare-fun e!90570 () Unit!4358)

(assert (=> d!43477 (= lt!72628 e!90570)))

(declare-fun c!26086 () Bool)

(assert (=> d!43477 (= c!26086 lt!72629)))

(assert (=> d!43477 (= lt!72629 (containsKey!176 (toList!863 call!15232) (select (arr!2284 (_keys!4674 newMap!16)) (index!3283 lt!72267))))))

(assert (=> d!43477 (= (contains!902 call!15232 (select (arr!2284 (_keys!4674 newMap!16)) (index!3283 lt!72267))) lt!72626)))

(declare-fun b!139018 () Bool)

(declare-fun lt!72627 () Unit!4358)

(assert (=> b!139018 (= e!90570 lt!72627)))

(assert (=> b!139018 (= lt!72627 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!863 call!15232) (select (arr!2284 (_keys!4674 newMap!16)) (index!3283 lt!72267))))))

(assert (=> b!139018 (isDefined!126 (getValueByKey!172 (toList!863 call!15232) (select (arr!2284 (_keys!4674 newMap!16)) (index!3283 lt!72267))))))

(declare-fun b!139019 () Bool)

(declare-fun Unit!4377 () Unit!4358)

(assert (=> b!139019 (= e!90570 Unit!4377)))

(declare-fun b!139020 () Bool)

(assert (=> b!139020 (= e!90571 (isDefined!126 (getValueByKey!172 (toList!863 call!15232) (select (arr!2284 (_keys!4674 newMap!16)) (index!3283 lt!72267)))))))

(assert (= (and d!43477 c!26086) b!139018))

(assert (= (and d!43477 (not c!26086)) b!139019))

(assert (= (and d!43477 (not res!66469)) b!139020))

(assert (=> d!43477 m!165329))

(declare-fun m!165941 () Bool)

(assert (=> d!43477 m!165941))

(assert (=> b!139018 m!165329))

(declare-fun m!165943 () Bool)

(assert (=> b!139018 m!165943))

(assert (=> b!139018 m!165329))

(declare-fun m!165945 () Bool)

(assert (=> b!139018 m!165945))

(assert (=> b!139018 m!165945))

(declare-fun m!165947 () Bool)

(assert (=> b!139018 m!165947))

(assert (=> b!139020 m!165329))

(assert (=> b!139020 m!165945))

(assert (=> b!139020 m!165945))

(assert (=> b!139020 m!165947))

(assert (=> b!138618 d!43477))

(declare-fun d!43479 () Bool)

(declare-fun e!90574 () Bool)

(assert (=> d!43479 e!90574))

(declare-fun res!66472 () Bool)

(assert (=> d!43479 (=> (not res!66472) (not e!90574))))

(assert (=> d!43479 (= res!66472 (and (bvsge (index!3283 lt!72267) #b00000000000000000000000000000000) (bvslt (index!3283 lt!72267) (size!2556 (_keys!4674 newMap!16)))))))

(declare-fun lt!72632 () Unit!4358)

(declare-fun choose!858 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 32) Int) Unit!4358)

(assert (=> d!43479 (= lt!72632 (choose!858 (_keys!4674 newMap!16) lt!72273 (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (index!3283 lt!72267) (defaultEntry!2918 newMap!16)))))

(assert (=> d!43479 (validMask!0 (mask!7247 newMap!16))))

(assert (=> d!43479 (= (lemmaValidKeyInArrayIsInListMap!122 (_keys!4674 newMap!16) lt!72273 (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (index!3283 lt!72267) (defaultEntry!2918 newMap!16)) lt!72632)))

(declare-fun b!139023 () Bool)

(assert (=> b!139023 (= e!90574 (contains!902 (getCurrentListMap!527 (_keys!4674 newMap!16) lt!72273 (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (select (arr!2284 (_keys!4674 newMap!16)) (index!3283 lt!72267))))))

(assert (= (and d!43479 res!66472) b!139023))

(declare-fun m!165949 () Bool)

(assert (=> d!43479 m!165949))

(assert (=> d!43479 m!165539))

(declare-fun m!165951 () Bool)

(assert (=> b!139023 m!165951))

(assert (=> b!139023 m!165329))

(assert (=> b!139023 m!165951))

(assert (=> b!139023 m!165329))

(declare-fun m!165953 () Bool)

(assert (=> b!139023 m!165953))

(assert (=> b!138618 d!43479))

(declare-fun d!43481 () Bool)

(declare-fun e!90577 () Bool)

(assert (=> d!43481 e!90577))

(declare-fun res!66475 () Bool)

(assert (=> d!43481 (=> (not res!66475) (not e!90577))))

(assert (=> d!43481 (= res!66475 (and (bvsge (index!3283 lt!72267) #b00000000000000000000000000000000) (bvslt (index!3283 lt!72267) (size!2557 (_values!2901 newMap!16)))))))

(declare-fun lt!72635 () Unit!4358)

(declare-fun choose!859 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 32) (_ BitVec 64) V!3529 Int) Unit!4358)

(assert (=> d!43481 (= lt!72635 (choose!859 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (index!3283 lt!72267) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2918 newMap!16)))))

(assert (=> d!43481 (validMask!0 (mask!7247 newMap!16))))

(assert (=> d!43481 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!63 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (index!3283 lt!72267) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2918 newMap!16)) lt!72635)))

(declare-fun b!139026 () Bool)

(assert (=> b!139026 (= e!90577 (= (+!165 (getCurrentListMap!527 (_keys!4674 newMap!16) (_values!2901 newMap!16) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!527 (_keys!4674 newMap!16) (array!4836 (store (arr!2285 (_values!2901 newMap!16)) (index!3283 lt!72267) (ValueCellFull!1112 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2557 (_values!2901 newMap!16))) (mask!7247 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16))))))

(assert (= (and d!43481 res!66475) b!139026))

(assert (=> d!43481 m!165195))

(assert (=> d!43481 m!165193))

(declare-fun m!165955 () Bool)

(assert (=> d!43481 m!165955))

(assert (=> d!43481 m!165539))

(assert (=> b!139026 m!165325))

(assert (=> b!139026 m!165325))

(assert (=> b!139026 m!165507))

(assert (=> b!139026 m!165333))

(declare-fun m!165957 () Bool)

(assert (=> b!139026 m!165957))

(assert (=> b!138618 d!43481))

(declare-fun d!43483 () Bool)

(assert (=> d!43483 (isDefined!126 (getValueByKey!172 (toList!863 lt!72157) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-fun lt!72638 () Unit!4358)

(declare-fun choose!860 (List!1726 (_ BitVec 64)) Unit!4358)

(assert (=> d!43483 (= lt!72638 (choose!860 (toList!863 lt!72157) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-fun e!90580 () Bool)

(assert (=> d!43483 e!90580))

(declare-fun res!66478 () Bool)

(assert (=> d!43483 (=> (not res!66478) (not e!90580))))

(declare-fun isStrictlySorted!319 (List!1726) Bool)

(assert (=> d!43483 (= res!66478 (isStrictlySorted!319 (toList!863 lt!72157)))))

(assert (=> d!43483 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!863 lt!72157) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) lt!72638)))

(declare-fun b!139029 () Bool)

(assert (=> b!139029 (= e!90580 (containsKey!176 (toList!863 lt!72157) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(assert (= (and d!43483 res!66478) b!139029))

(assert (=> d!43483 m!165195))

(assert (=> d!43483 m!165317))

(assert (=> d!43483 m!165317))

(assert (=> d!43483 m!165319))

(assert (=> d!43483 m!165195))

(declare-fun m!165959 () Bool)

(assert (=> d!43483 m!165959))

(declare-fun m!165961 () Bool)

(assert (=> d!43483 m!165961))

(assert (=> b!139029 m!165195))

(assert (=> b!139029 m!165313))

(assert (=> b!138496 d!43483))

(assert (=> b!138496 d!43471))

(assert (=> b!138496 d!43473))

(declare-fun b!139038 () Bool)

(declare-fun e!90586 () (_ BitVec 32))

(declare-fun call!15317 () (_ BitVec 32))

(assert (=> b!139038 (= e!90586 call!15317)))

(declare-fun b!139039 () Bool)

(assert (=> b!139039 (= e!90586 (bvadd #b00000000000000000000000000000001 call!15317))))

(declare-fun b!139040 () Bool)

(declare-fun e!90585 () (_ BitVec 32))

(assert (=> b!139040 (= e!90585 #b00000000000000000000000000000000)))

(declare-fun bm!15314 () Bool)

(assert (=> bm!15314 (= call!15317 (arrayCountValidKeys!0 (_keys!4674 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2556 (_keys!4674 newMap!16))))))

(declare-fun d!43485 () Bool)

(declare-fun lt!72641 () (_ BitVec 32))

(assert (=> d!43485 (and (bvsge lt!72641 #b00000000000000000000000000000000) (bvsle lt!72641 (bvsub (size!2556 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!43485 (= lt!72641 e!90585)))

(declare-fun c!26092 () Bool)

(assert (=> d!43485 (= c!26092 (bvsge #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))

(assert (=> d!43485 (and (bvsle #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2556 (_keys!4674 newMap!16)) (size!2556 (_keys!4674 newMap!16))))))

(assert (=> d!43485 (= (arrayCountValidKeys!0 (_keys!4674 newMap!16) #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))) lt!72641)))

(declare-fun b!139041 () Bool)

(assert (=> b!139041 (= e!90585 e!90586)))

(declare-fun c!26091 () Bool)

(assert (=> b!139041 (= c!26091 (validKeyInArray!0 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!43485 c!26092) b!139040))

(assert (= (and d!43485 (not c!26092)) b!139041))

(assert (= (and b!139041 c!26091) b!139039))

(assert (= (and b!139041 (not c!26091)) b!139038))

(assert (= (or b!139039 b!139038) bm!15314))

(declare-fun m!165963 () Bool)

(assert (=> bm!15314 m!165963))

(assert (=> b!139041 m!165531))

(assert (=> b!139041 m!165531))

(assert (=> b!139041 m!165533))

(assert (=> b!138472 d!43485))

(declare-fun d!43487 () Bool)

(assert (=> d!43487 (= (apply!118 lt!72331 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1511 (getValueByKey!172 (toList!863 lt!72331) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5808 () Bool)

(assert (= bs!5808 d!43487))

(assert (=> bs!5808 m!165927))

(assert (=> bs!5808 m!165927))

(declare-fun m!165965 () Bool)

(assert (=> bs!5808 m!165965))

(assert (=> b!138703 d!43487))

(declare-fun b!139042 () Bool)

(declare-fun e!90590 () Bool)

(declare-fun call!15318 () Bool)

(assert (=> b!139042 (= e!90590 call!15318)))

(declare-fun d!43489 () Bool)

(declare-fun res!66480 () Bool)

(declare-fun e!90587 () Bool)

(assert (=> d!43489 (=> res!66480 e!90587)))

(assert (=> d!43489 (= res!66480 (bvsge #b00000000000000000000000000000000 (size!2556 (_keys!4674 newMap!16))))))

(assert (=> d!43489 (= (arrayNoDuplicates!0 (_keys!4674 newMap!16) #b00000000000000000000000000000000 Nil!1722) e!90587)))

(declare-fun b!139043 () Bool)

(declare-fun e!90588 () Bool)

(assert (=> b!139043 (= e!90588 e!90590)))

(declare-fun c!26093 () Bool)

(assert (=> b!139043 (= c!26093 (validKeyInArray!0 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15315 () Bool)

(assert (=> bm!15315 (= call!15318 (arrayNoDuplicates!0 (_keys!4674 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!26093 (Cons!1721 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000) Nil!1722) Nil!1722)))))

(declare-fun b!139044 () Bool)

(declare-fun e!90589 () Bool)

(assert (=> b!139044 (= e!90589 (contains!904 Nil!1722 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!139045 () Bool)

(assert (=> b!139045 (= e!90587 e!90588)))

(declare-fun res!66479 () Bool)

(assert (=> b!139045 (=> (not res!66479) (not e!90588))))

(assert (=> b!139045 (= res!66479 (not e!90589))))

(declare-fun res!66481 () Bool)

(assert (=> b!139045 (=> (not res!66481) (not e!90589))))

(assert (=> b!139045 (= res!66481 (validKeyInArray!0 (select (arr!2284 (_keys!4674 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!139046 () Bool)

(assert (=> b!139046 (= e!90590 call!15318)))

(assert (= (and d!43489 (not res!66480)) b!139045))

(assert (= (and b!139045 res!66481) b!139044))

(assert (= (and b!139045 res!66479) b!139043))

(assert (= (and b!139043 c!26093) b!139042))

(assert (= (and b!139043 (not c!26093)) b!139046))

(assert (= (or b!139042 b!139046) bm!15315))

(assert (=> b!139043 m!165531))

(assert (=> b!139043 m!165531))

(assert (=> b!139043 m!165533))

(assert (=> bm!15315 m!165531))

(declare-fun m!165967 () Bool)

(assert (=> bm!15315 m!165967))

(assert (=> b!139044 m!165531))

(assert (=> b!139044 m!165531))

(declare-fun m!165969 () Bool)

(assert (=> b!139044 m!165969))

(assert (=> b!139045 m!165531))

(assert (=> b!139045 m!165531))

(assert (=> b!139045 m!165533))

(assert (=> b!138474 d!43489))

(declare-fun d!43491 () Bool)

(declare-fun e!90591 () Bool)

(assert (=> d!43491 e!90591))

(declare-fun res!66483 () Bool)

(assert (=> d!43491 (=> (not res!66483) (not e!90591))))

(declare-fun lt!72643 () ListLongMap!1695)

(assert (=> d!43491 (= res!66483 (contains!902 lt!72643 (_1!1326 (ite c!25983 (ite c!25977 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!72644 () List!1726)

(assert (=> d!43491 (= lt!72643 (ListLongMap!1696 lt!72644))))

(declare-fun lt!72642 () Unit!4358)

(declare-fun lt!72645 () Unit!4358)

(assert (=> d!43491 (= lt!72642 lt!72645)))

(assert (=> d!43491 (= (getValueByKey!172 lt!72644 (_1!1326 (ite c!25983 (ite c!25977 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!177 (_2!1326 (ite c!25983 (ite c!25977 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!43491 (= lt!72645 (lemmaContainsTupThenGetReturnValue!90 lt!72644 (_1!1326 (ite c!25983 (ite c!25977 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1326 (ite c!25983 (ite c!25977 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!43491 (= lt!72644 (insertStrictlySorted!93 (toList!863 e!90337) (_1!1326 (ite c!25983 (ite c!25977 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1326 (ite c!25983 (ite c!25977 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!43491 (= (+!165 e!90337 (ite c!25983 (ite c!25977 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!72643)))

(declare-fun b!139047 () Bool)

(declare-fun res!66482 () Bool)

(assert (=> b!139047 (=> (not res!66482) (not e!90591))))

(assert (=> b!139047 (= res!66482 (= (getValueByKey!172 (toList!863 lt!72643) (_1!1326 (ite c!25983 (ite c!25977 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!177 (_2!1326 (ite c!25983 (ite c!25977 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!139048 () Bool)

(assert (=> b!139048 (= e!90591 (contains!905 (toList!863 lt!72643) (ite c!25983 (ite c!25977 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!43491 res!66483) b!139047))

(assert (= (and b!139047 res!66482) b!139048))

(declare-fun m!165971 () Bool)

(assert (=> d!43491 m!165971))

(declare-fun m!165973 () Bool)

(assert (=> d!43491 m!165973))

(declare-fun m!165975 () Bool)

(assert (=> d!43491 m!165975))

(declare-fun m!165977 () Bool)

(assert (=> d!43491 m!165977))

(declare-fun m!165979 () Bool)

(assert (=> b!139047 m!165979))

(declare-fun m!165981 () Bool)

(assert (=> b!139048 m!165981))

(assert (=> bm!15229 d!43491))

(declare-fun d!43493 () Bool)

(assert (=> d!43493 (= (apply!118 lt!72331 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1511 (getValueByKey!172 (toList!863 lt!72331) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5809 () Bool)

(assert (= bs!5809 d!43493))

(assert (=> bs!5809 m!165381))

(assert (=> bs!5809 m!165783))

(assert (=> bs!5809 m!165783))

(declare-fun m!165983 () Bool)

(assert (=> bs!5809 m!165983))

(assert (=> b!138698 d!43493))

(declare-fun d!43495 () Bool)

(declare-fun c!26094 () Bool)

(assert (=> d!43495 (= c!26094 ((_ is ValueCellFull!1112) (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!90592 () V!3529)

(assert (=> d!43495 (= (get!1507 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!90592)))

(declare-fun b!139049 () Bool)

(assert (=> b!139049 (= e!90592 (get!1509 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!139050 () Bool)

(assert (=> b!139050 (= e!90592 (get!1510 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43495 c!26094) b!139049))

(assert (= (and d!43495 (not c!26094)) b!139050))

(assert (=> b!139049 m!165431))

(assert (=> b!139049 m!165191))

(declare-fun m!165985 () Bool)

(assert (=> b!139049 m!165985))

(assert (=> b!139050 m!165431))

(assert (=> b!139050 m!165191))

(declare-fun m!165987 () Bool)

(assert (=> b!139050 m!165987))

(assert (=> b!138698 d!43495))

(declare-fun d!43497 () Bool)

(assert (=> d!43497 (= (get!1510 (select (arr!2285 (_values!2901 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!429 (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138630 d!43497))

(declare-fun b!139051 () Bool)

(declare-fun e!90596 () Bool)

(declare-fun call!15319 () Bool)

(assert (=> b!139051 (= e!90596 call!15319)))

(declare-fun d!43499 () Bool)

(declare-fun res!66485 () Bool)

(declare-fun e!90593 () Bool)

(assert (=> d!43499 (=> res!66485 e!90593)))

(assert (=> d!43499 (= res!66485 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2556 (_keys!4674 (v!3248 (underlying!468 thiss!992))))))))

(assert (=> d!43499 (= (arrayNoDuplicates!0 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!25942 (Cons!1721 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000) Nil!1722) Nil!1722)) e!90593)))

(declare-fun b!139052 () Bool)

(declare-fun e!90594 () Bool)

(assert (=> b!139052 (= e!90594 e!90596)))

(declare-fun c!26095 () Bool)

(assert (=> b!139052 (= c!26095 (validKeyInArray!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!15316 () Bool)

(assert (=> bm!15316 (= call!15319 (arrayNoDuplicates!0 (_keys!4674 (v!3248 (underlying!468 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!26095 (Cons!1721 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!25942 (Cons!1721 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000) Nil!1722) Nil!1722)) (ite c!25942 (Cons!1721 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000) Nil!1722) Nil!1722))))))

(declare-fun b!139053 () Bool)

(declare-fun e!90595 () Bool)

(assert (=> b!139053 (= e!90595 (contains!904 (ite c!25942 (Cons!1721 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) #b00000000000000000000000000000000) Nil!1722) Nil!1722) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!139054 () Bool)

(assert (=> b!139054 (= e!90593 e!90594)))

(declare-fun res!66484 () Bool)

(assert (=> b!139054 (=> (not res!66484) (not e!90594))))

(assert (=> b!139054 (= res!66484 (not e!90595))))

(declare-fun res!66486 () Bool)

(assert (=> b!139054 (=> (not res!66486) (not e!90595))))

(assert (=> b!139054 (= res!66486 (validKeyInArray!0 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!139055 () Bool)

(assert (=> b!139055 (= e!90596 call!15319)))

(assert (= (and d!43499 (not res!66485)) b!139054))

(assert (= (and b!139054 res!66486) b!139053))

(assert (= (and b!139054 res!66484) b!139052))

(assert (= (and b!139052 c!26095) b!139051))

(assert (= (and b!139052 (not c!26095)) b!139055))

(assert (= (or b!139051 b!139055) bm!15316))

(declare-fun m!165989 () Bool)

(assert (=> b!139052 m!165989))

(assert (=> b!139052 m!165989))

(declare-fun m!165991 () Bool)

(assert (=> b!139052 m!165991))

(assert (=> bm!15316 m!165989))

(declare-fun m!165993 () Bool)

(assert (=> bm!15316 m!165993))

(assert (=> b!139053 m!165989))

(assert (=> b!139053 m!165989))

(declare-fun m!165995 () Bool)

(assert (=> b!139053 m!165995))

(assert (=> b!139054 m!165989))

(assert (=> b!139054 m!165989))

(assert (=> b!139054 m!165991))

(assert (=> bm!15173 d!43499))

(declare-fun d!43501 () Bool)

(declare-fun e!90598 () Bool)

(assert (=> d!43501 e!90598))

(declare-fun res!66487 () Bool)

(assert (=> d!43501 (=> res!66487 e!90598)))

(declare-fun lt!72646 () Bool)

(assert (=> d!43501 (= res!66487 (not lt!72646))))

(declare-fun lt!72649 () Bool)

(assert (=> d!43501 (= lt!72646 lt!72649)))

(declare-fun lt!72648 () Unit!4358)

(declare-fun e!90597 () Unit!4358)

(assert (=> d!43501 (= lt!72648 e!90597)))

(declare-fun c!26096 () Bool)

(assert (=> d!43501 (= c!26096 lt!72649)))

(assert (=> d!43501 (= lt!72649 (containsKey!176 (toList!863 call!15230) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(assert (=> d!43501 (= (contains!902 call!15230 (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)) lt!72646)))

(declare-fun b!139056 () Bool)

(declare-fun lt!72647 () Unit!4358)

(assert (=> b!139056 (= e!90597 lt!72647)))

(assert (=> b!139056 (= lt!72647 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!863 call!15230) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(assert (=> b!139056 (isDefined!126 (getValueByKey!172 (toList!863 call!15230) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-fun b!139057 () Bool)

(declare-fun Unit!4378 () Unit!4358)

(assert (=> b!139057 (= e!90597 Unit!4378)))

(declare-fun b!139058 () Bool)

(assert (=> b!139058 (= e!90598 (isDefined!126 (getValueByKey!172 (toList!863 call!15230) (select (arr!2284 (_keys!4674 (v!3248 (underlying!468 thiss!992)))) from!355))))))

(assert (= (and d!43501 c!26096) b!139056))

(assert (= (and d!43501 (not c!26096)) b!139057))

(assert (= (and d!43501 (not res!66487)) b!139058))

(assert (=> d!43501 m!165195))

(declare-fun m!165997 () Bool)

(assert (=> d!43501 m!165997))

(assert (=> b!139056 m!165195))

(declare-fun m!165999 () Bool)

(assert (=> b!139056 m!165999))

(assert (=> b!139056 m!165195))

(declare-fun m!166001 () Bool)

(assert (=> b!139056 m!166001))

(assert (=> b!139056 m!166001))

(declare-fun m!166003 () Bool)

(assert (=> b!139056 m!166003))

(assert (=> b!139058 m!165195))

(assert (=> b!139058 m!166001))

(assert (=> b!139058 m!166001))

(assert (=> b!139058 m!166003))

(assert (=> b!138604 d!43501))

(assert (=> bm!15260 d!43455))

(declare-fun b!139059 () Bool)

(declare-fun e!90600 () Bool)

(assert (=> b!139059 (= e!90600 tp_is_empty!2911)))

(declare-fun condMapEmpty!4781 () Bool)

(declare-fun mapDefault!4781 () ValueCell!1112)

(assert (=> mapNonEmpty!4779 (= condMapEmpty!4781 (= mapRest!4779 ((as const (Array (_ BitVec 32) ValueCell!1112)) mapDefault!4781)))))

(declare-fun e!90599 () Bool)

(declare-fun mapRes!4781 () Bool)

(assert (=> mapNonEmpty!4779 (= tp!11457 (and e!90599 mapRes!4781))))

(declare-fun mapNonEmpty!4781 () Bool)

(declare-fun tp!11459 () Bool)

(assert (=> mapNonEmpty!4781 (= mapRes!4781 (and tp!11459 e!90600))))

(declare-fun mapValue!4781 () ValueCell!1112)

(declare-fun mapKey!4781 () (_ BitVec 32))

(declare-fun mapRest!4781 () (Array (_ BitVec 32) ValueCell!1112))

(assert (=> mapNonEmpty!4781 (= mapRest!4779 (store mapRest!4781 mapKey!4781 mapValue!4781))))

(declare-fun mapIsEmpty!4781 () Bool)

(assert (=> mapIsEmpty!4781 mapRes!4781))

(declare-fun b!139060 () Bool)

(assert (=> b!139060 (= e!90599 tp_is_empty!2911)))

(assert (= (and mapNonEmpty!4779 condMapEmpty!4781) mapIsEmpty!4781))

(assert (= (and mapNonEmpty!4779 (not condMapEmpty!4781)) mapNonEmpty!4781))

(assert (= (and mapNonEmpty!4781 ((_ is ValueCellFull!1112) mapValue!4781)) b!139059))

(assert (= (and mapNonEmpty!4779 ((_ is ValueCellFull!1112) mapDefault!4781)) b!139060))

(declare-fun m!166005 () Bool)

(assert (=> mapNonEmpty!4781 m!166005))

(declare-fun b!139061 () Bool)

(declare-fun e!90602 () Bool)

(assert (=> b!139061 (= e!90602 tp_is_empty!2911)))

(declare-fun condMapEmpty!4782 () Bool)

(declare-fun mapDefault!4782 () ValueCell!1112)

(assert (=> mapNonEmpty!4780 (= condMapEmpty!4782 (= mapRest!4780 ((as const (Array (_ BitVec 32) ValueCell!1112)) mapDefault!4782)))))

(declare-fun e!90601 () Bool)

(declare-fun mapRes!4782 () Bool)

(assert (=> mapNonEmpty!4780 (= tp!11458 (and e!90601 mapRes!4782))))

(declare-fun mapNonEmpty!4782 () Bool)

(declare-fun tp!11460 () Bool)

(assert (=> mapNonEmpty!4782 (= mapRes!4782 (and tp!11460 e!90602))))

(declare-fun mapRest!4782 () (Array (_ BitVec 32) ValueCell!1112))

(declare-fun mapValue!4782 () ValueCell!1112)

(declare-fun mapKey!4782 () (_ BitVec 32))

(assert (=> mapNonEmpty!4782 (= mapRest!4780 (store mapRest!4782 mapKey!4782 mapValue!4782))))

(declare-fun mapIsEmpty!4782 () Bool)

(assert (=> mapIsEmpty!4782 mapRes!4782))

(declare-fun b!139062 () Bool)

(assert (=> b!139062 (= e!90601 tp_is_empty!2911)))

(assert (= (and mapNonEmpty!4780 condMapEmpty!4782) mapIsEmpty!4782))

(assert (= (and mapNonEmpty!4780 (not condMapEmpty!4782)) mapNonEmpty!4782))

(assert (= (and mapNonEmpty!4782 ((_ is ValueCellFull!1112) mapValue!4782)) b!139061))

(assert (= (and mapNonEmpty!4780 ((_ is ValueCellFull!1112) mapDefault!4782)) b!139062))

(declare-fun m!166007 () Bool)

(assert (=> mapNonEmpty!4782 m!166007))

(declare-fun b_lambda!6207 () Bool)

(assert (= b_lambda!6205 (or (and b!138344 b_free!2989) (and b!138351 b_free!2991 (= (defaultEntry!2918 newMap!16) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))))) b_lambda!6207)))

(declare-fun b_lambda!6209 () Bool)

(assert (= b_lambda!6201 (or (and b!138344 b_free!2989 (= (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) (defaultEntry!2918 newMap!16))) (and b!138351 b_free!2991) b_lambda!6209)))

(declare-fun b_lambda!6211 () Bool)

(assert (= b_lambda!6203 (or (and b!138344 b_free!2989) (and b!138351 b_free!2991 (= (defaultEntry!2918 newMap!16) (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))))) b_lambda!6211)))

(declare-fun b_lambda!6213 () Bool)

(assert (= b_lambda!6199 (or (and b!138344 b_free!2989 (= (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) (defaultEntry!2918 newMap!16))) (and b!138351 b_free!2991) b_lambda!6213)))

(declare-fun b_lambda!6215 () Bool)

(assert (= b_lambda!6197 (or (and b!138344 b_free!2989 (= (defaultEntry!2918 (v!3248 (underlying!468 thiss!992))) (defaultEntry!2918 newMap!16))) (and b!138351 b_free!2991) b_lambda!6215)))

(check-sat (not b!139029) (not bm!15316) (not b!138947) (not d!43427) b_and!8639 (not b!139026) (not b!138759) (not b!139005) (not d!43451) (not b!138948) (not b!139041) (not b!139000) (not b_lambda!6209) (not b!138949) (not d!43501) (not d!43483) tp_is_empty!2911 (not b!138778) (not b!138921) (not b!138931) (not bm!15300) (not b!139058) (not b!138792) (not d!43421) (not b!138800) (not b!138991) (not b!139043) (not b!138951) (not b!138893) (not d!43471) (not b!138765) (not d!43447) (not d!43437) (not b!138988) (not b_lambda!6207) (not bm!15276) (not b_lambda!6211) (not b!138913) (not b_lambda!6215) (not b!139053) (not bm!15284) (not b!138779) (not b!138918) (not d!43387) (not d!43415) (not d!43383) (not d!43455) (not b!139020) (not bm!15304) (not d!43479) (not d!43435) (not b!139048) (not d!43413) (not bm!15308) (not b!138873) (not bm!15291) (not b!138910) (not b!138768) (not d!43429) (not d!43481) (not b!139047) (not d!43459) (not b!138819) (not d!43399) (not mapNonEmpty!4781) (not mapNonEmpty!4782) (not b!138892) (not b!138878) (not b!138985) (not b!138994) (not b!138769) (not b!138827) (not d!43439) (not d!43431) (not d!43441) (not b!138789) (not b!138935) (not b!138816) (not bm!15290) (not bm!15283) (not d!43469) (not d!43467) (not b!138812) (not b!139002) (not b!139044) (not b!138899) (not d!43449) (not b!138992) (not b!138922) (not b!139050) (not d!43379) (not d!43377) (not b!138933) (not d!43487) (not b!138914) (not d!43409) (not b!139023) (not b!138785) (not bm!15303) (not b!139056) (not bm!15278) (not b!138828) (not b!139054) (not b!138917) (not bm!15299) (not b!139018) (not d!43417) (not bm!15297) (not b!138990) (not d!43461) (not d!43443) (not b!138945) (not b!138946) (not b!138795) (not b!139045) (not b!138894) (not d!43405) (not b!138890) (not bm!15275) (not b!138953) (not b!138781) (not b_lambda!6191) (not d!43445) (not bm!15286) b_and!8637 (not b!138915) (not b!138796) (not b!138821) (not b!138807) (not d!43453) (not b!138883) (not b!138911) (not b!138771) (not b!138993) (not bm!15311) (not b_next!2989) (not d!43411) (not b!138720) (not d!43407) (not d!43477) (not d!43397) (not b!138887) (not b!138987) (not b!139052) (not bm!15298) (not b!138937) (not b!138756) (not d!43465) (not b_next!2991) (not b!138920) (not bm!15279) (not b_lambda!6213) (not b!138831) (not b!139003) (not b!138997) (not bm!15280) (not bm!15314) (not b!138823) (not b!138996) (not b!138943) (not d!43433) (not b!138999) (not b!138822) (not b_lambda!6195) (not d!43493) (not b!138794) (not b!139049) (not b!138721) (not d!43391) (not d!43457) (not d!43491) (not b!138898) (not b!138916) (not b!139016) (not b!139001) (not b!138944) (not d!43389) (not b!138801) (not bm!15315) (not bm!15287) (not d!43385))
(check-sat b_and!8637 b_and!8639 (not b_next!2989) (not b_next!2991))
