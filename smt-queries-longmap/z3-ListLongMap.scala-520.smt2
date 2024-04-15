; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13080 () Bool)

(assert start!13080)

(declare-fun b!114195 () Bool)

(declare-fun b_free!2629 () Bool)

(declare-fun b_next!2629 () Bool)

(assert (=> b!114195 (= b_free!2629 (not b_next!2629))))

(declare-fun tp!10248 () Bool)

(declare-fun b_and!7037 () Bool)

(assert (=> b!114195 (= tp!10248 b_and!7037)))

(declare-fun b!114197 () Bool)

(declare-fun b_free!2631 () Bool)

(declare-fun b_next!2631 () Bool)

(assert (=> b!114197 (= b_free!2631 (not b_next!2631))))

(declare-fun tp!10247 () Bool)

(declare-fun b_and!7039 () Bool)

(assert (=> b!114197 (= tp!10247 b_and!7039)))

(declare-fun b!114183 () Bool)

(declare-datatypes ((Unit!3562 0))(
  ( (Unit!3563) )
))
(declare-fun e!74293 () Unit!3562)

(declare-fun Unit!3564 () Unit!3562)

(assert (=> b!114183 (= e!74293 Unit!3564)))

(declare-fun b!114184 () Bool)

(declare-fun Unit!3565 () Unit!3562)

(assert (=> b!114184 (= e!74293 Unit!3565)))

(declare-fun lt!59386 () Unit!3562)

(declare-datatypes ((V!3289 0))(
  ( (V!3290 (val!1410 Int)) )
))
(declare-datatypes ((array!4443 0))(
  ( (array!4444 (arr!2104 (Array (_ BitVec 32) (_ BitVec 64))) (size!2365 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1022 0))(
  ( (ValueCellFull!1022 (v!2979 V!3289)) (EmptyCell!1022) )
))
(declare-datatypes ((array!4445 0))(
  ( (array!4446 (arr!2105 (Array (_ BitVec 32) ValueCell!1022)) (size!2366 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!952 0))(
  ( (LongMapFixedSize!953 (defaultEntry!2682 Int) (mask!6877 (_ BitVec 32)) (extraKeys!2471 (_ BitVec 32)) (zeroValue!2549 V!3289) (minValue!2549 V!3289) (_size!525 (_ BitVec 32)) (_keys!4403 array!4443) (_values!2665 array!4445) (_vacant!525 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!740 0))(
  ( (Cell!741 (v!2980 LongMapFixedSize!952)) )
))
(declare-datatypes ((LongMap!740 0))(
  ( (LongMap!741 (underlying!381 Cell!740)) )
))
(declare-fun thiss!992 () LongMap!740)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!123 (array!4443 array!4445 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 64) (_ BitVec 32) Int) Unit!3562)

(assert (=> b!114184 (= lt!59386 (lemmaListMapContainsThenArrayContainsFrom!123 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (_values!2665 (v!2980 (underlying!381 thiss!992))) (mask!6877 (v!2980 (underlying!381 thiss!992))) (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) (minValue!2549 (v!2980 (underlying!381 thiss!992))) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114184 (arrayContainsKey!0 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59383 () Unit!3562)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4443 (_ BitVec 32) (_ BitVec 32)) Unit!3562)

(assert (=> b!114184 (= lt!59383 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4403 (v!2980 (underlying!381 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1648 0))(
  ( (Nil!1645) (Cons!1644 (h!2244 (_ BitVec 64)) (t!5865 List!1648)) )
))
(declare-fun arrayNoDuplicates!0 (array!4443 (_ BitVec 32) List!1648) Bool)

(assert (=> b!114184 (arrayNoDuplicates!0 (_keys!4403 (v!2980 (underlying!381 thiss!992))) from!355 Nil!1645)))

(declare-fun lt!59380 () Unit!3562)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4443 (_ BitVec 32) (_ BitVec 64) List!1648) Unit!3562)

(assert (=> b!114184 (= lt!59380 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (Cons!1644 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) Nil!1645)))))

(assert (=> b!114184 false))

(declare-fun mapIsEmpty!4121 () Bool)

(declare-fun mapRes!4122 () Bool)

(assert (=> mapIsEmpty!4121 mapRes!4122))

(declare-fun b!114185 () Bool)

(declare-fun e!74297 () Bool)

(declare-fun e!74301 () Bool)

(assert (=> b!114185 (= e!74297 e!74301)))

(declare-fun res!56205 () Bool)

(assert (=> b!114185 (=> (not res!56205) (not e!74301))))

(assert (=> b!114185 (= res!56205 (and (not (= (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!59393 () V!3289)

(declare-fun get!1376 (ValueCell!1022 V!3289) V!3289)

(declare-fun dynLambda!395 (Int (_ BitVec 64)) V!3289)

(assert (=> b!114185 (= lt!59393 (get!1376 (select (arr!2105 (_values!2665 (v!2980 (underlying!381 thiss!992)))) from!355) (dynLambda!395 (defaultEntry!2682 (v!2980 (underlying!381 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114186 () Bool)

(declare-fun res!56201 () Bool)

(declare-fun e!74298 () Bool)

(assert (=> b!114186 (=> (not res!56201) (not e!74298))))

(declare-fun newMap!16 () LongMapFixedSize!952)

(assert (=> b!114186 (= res!56201 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6877 newMap!16)) (_size!525 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun mapNonEmpty!4121 () Bool)

(declare-fun mapRes!4121 () Bool)

(declare-fun tp!10246 () Bool)

(declare-fun e!74299 () Bool)

(assert (=> mapNonEmpty!4121 (= mapRes!4121 (and tp!10246 e!74299))))

(declare-fun mapRest!4122 () (Array (_ BitVec 32) ValueCell!1022))

(declare-fun mapValue!4122 () ValueCell!1022)

(declare-fun mapKey!4122 () (_ BitVec 32))

(assert (=> mapNonEmpty!4121 (= (arr!2105 (_values!2665 (v!2980 (underlying!381 thiss!992)))) (store mapRest!4122 mapKey!4122 mapValue!4122))))

(declare-fun b!114188 () Bool)

(declare-fun e!74308 () Bool)

(declare-fun e!74303 () Bool)

(assert (=> b!114188 (= e!74308 e!74303)))

(declare-fun b!114189 () Bool)

(declare-fun e!74305 () Bool)

(declare-fun valid!449 (LongMapFixedSize!952) Bool)

(assert (=> b!114189 (= e!74305 (valid!449 (v!2980 (underlying!381 thiss!992))))))

(declare-fun b!114190 () Bool)

(declare-fun e!74306 () Bool)

(declare-fun tp_is_empty!2731 () Bool)

(assert (=> b!114190 (= e!74306 tp_is_empty!2731)))

(declare-fun b!114191 () Bool)

(declare-fun e!74309 () Bool)

(assert (=> b!114191 (= e!74309 tp_is_empty!2731)))

(declare-fun b!114192 () Bool)

(declare-fun e!74294 () Bool)

(assert (=> b!114192 (= e!74294 tp_is_empty!2731)))

(declare-fun b!114193 () Bool)

(declare-fun res!56204 () Bool)

(assert (=> b!114193 (=> (not res!56204) (not e!74298))))

(assert (=> b!114193 (= res!56204 (valid!449 newMap!16))))

(declare-fun mapNonEmpty!4122 () Bool)

(declare-fun tp!10245 () Bool)

(assert (=> mapNonEmpty!4122 (= mapRes!4122 (and tp!10245 e!74306))))

(declare-fun mapValue!4121 () ValueCell!1022)

(declare-fun mapRest!4121 () (Array (_ BitVec 32) ValueCell!1022))

(declare-fun mapKey!4121 () (_ BitVec 32))

(assert (=> mapNonEmpty!4122 (= (arr!2105 (_values!2665 newMap!16)) (store mapRest!4121 mapKey!4121 mapValue!4121))))

(declare-fun b!114194 () Bool)

(declare-fun e!74302 () Bool)

(assert (=> b!114194 (= e!74301 e!74302)))

(declare-fun res!56203 () Bool)

(assert (=> b!114194 (=> (not res!56203) (not e!74302))))

(declare-datatypes ((tuple2!2446 0))(
  ( (tuple2!2447 (_1!1234 Bool) (_2!1234 LongMapFixedSize!952)) )
))
(declare-fun lt!59382 () tuple2!2446)

(assert (=> b!114194 (= res!56203 (and (_1!1234 lt!59382) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!59384 () Unit!3562)

(assert (=> b!114194 (= lt!59384 e!74293)))

(declare-fun c!20392 () Bool)

(declare-datatypes ((tuple2!2448 0))(
  ( (tuple2!2449 (_1!1235 (_ BitVec 64)) (_2!1235 V!3289)) )
))
(declare-datatypes ((List!1649 0))(
  ( (Nil!1646) (Cons!1645 (h!2245 tuple2!2448) (t!5866 List!1649)) )
))
(declare-datatypes ((ListLongMap!1581 0))(
  ( (ListLongMap!1582 (toList!806 List!1649)) )
))
(declare-fun lt!59379 () ListLongMap!1581)

(declare-fun contains!843 (ListLongMap!1581 (_ BitVec 64)) Bool)

(assert (=> b!114194 (= c!20392 (contains!843 lt!59379 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355)))))

(declare-fun update!172 (LongMapFixedSize!952 (_ BitVec 64) V!3289) tuple2!2446)

(assert (=> b!114194 (= lt!59382 (update!172 newMap!16 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393))))

(declare-fun e!74295 () Bool)

(declare-fun array_inv!1335 (array!4443) Bool)

(declare-fun array_inv!1336 (array!4445) Bool)

(assert (=> b!114195 (= e!74303 (and tp!10248 tp_is_empty!2731 (array_inv!1335 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (array_inv!1336 (_values!2665 (v!2980 (underlying!381 thiss!992)))) e!74295))))

(declare-fun b!114196 () Bool)

(declare-fun e!74300 () Bool)

(assert (=> b!114196 (= e!74300 (and e!74309 mapRes!4122))))

(declare-fun condMapEmpty!4121 () Bool)

(declare-fun mapDefault!4122 () ValueCell!1022)

(assert (=> b!114196 (= condMapEmpty!4121 (= (arr!2105 (_values!2665 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1022)) mapDefault!4122)))))

(declare-fun e!74307 () Bool)

(assert (=> b!114197 (= e!74307 (and tp!10247 tp_is_empty!2731 (array_inv!1335 (_keys!4403 newMap!16)) (array_inv!1336 (_values!2665 newMap!16)) e!74300))))

(declare-fun b!114187 () Bool)

(declare-fun res!56206 () Bool)

(assert (=> b!114187 (=> (not res!56206) (not e!74298))))

(assert (=> b!114187 (= res!56206 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992)))))))))

(declare-fun res!56202 () Bool)

(assert (=> start!13080 (=> (not res!56202) (not e!74298))))

(declare-fun valid!450 (LongMap!740) Bool)

(assert (=> start!13080 (= res!56202 (valid!450 thiss!992))))

(assert (=> start!13080 e!74298))

(declare-fun e!74292 () Bool)

(assert (=> start!13080 e!74292))

(assert (=> start!13080 true))

(assert (=> start!13080 e!74307))

(declare-fun mapIsEmpty!4122 () Bool)

(assert (=> mapIsEmpty!4122 mapRes!4121))

(declare-fun b!114198 () Bool)

(assert (=> b!114198 (= e!74292 e!74308)))

(declare-fun b!114199 () Bool)

(assert (=> b!114199 (= e!74295 (and e!74294 mapRes!4121))))

(declare-fun condMapEmpty!4122 () Bool)

(declare-fun mapDefault!4121 () ValueCell!1022)

(assert (=> b!114199 (= condMapEmpty!4122 (= (arr!2105 (_values!2665 (v!2980 (underlying!381 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1022)) mapDefault!4121)))))

(declare-fun b!114200 () Bool)

(assert (=> b!114200 (= e!74298 e!74297)))

(declare-fun res!56207 () Bool)

(assert (=> b!114200 (=> (not res!56207) (not e!74297))))

(declare-fun lt!59385 () ListLongMap!1581)

(assert (=> b!114200 (= res!56207 (= lt!59385 lt!59379))))

(declare-fun map!1303 (LongMapFixedSize!952) ListLongMap!1581)

(assert (=> b!114200 (= lt!59379 (map!1303 newMap!16))))

(declare-fun getCurrentListMap!479 (array!4443 array!4445 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 32) Int) ListLongMap!1581)

(assert (=> b!114200 (= lt!59385 (getCurrentListMap!479 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (_values!2665 (v!2980 (underlying!381 thiss!992))) (mask!6877 (v!2980 (underlying!381 thiss!992))) (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) (minValue!2549 (v!2980 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun b!114201 () Bool)

(assert (=> b!114201 (= e!74302 (not e!74305))))

(declare-fun res!56208 () Bool)

(assert (=> b!114201 (=> res!56208 e!74305)))

(assert (=> b!114201 (= res!56208 (not (valid!449 (_2!1234 lt!59382))))))

(declare-fun lt!59394 () tuple2!2448)

(declare-fun lt!59392 () ListLongMap!1581)

(declare-fun lt!59395 () ListLongMap!1581)

(declare-fun lt!59387 () tuple2!2448)

(declare-fun +!150 (ListLongMap!1581 tuple2!2448) ListLongMap!1581)

(assert (=> b!114201 (= (+!150 lt!59395 lt!59394) (+!150 (+!150 lt!59392 lt!59394) lt!59387))))

(assert (=> b!114201 (= lt!59394 (tuple2!2449 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun lt!59391 () Unit!3562)

(declare-fun addCommutativeForDiffKeys!62 (ListLongMap!1581 (_ BitVec 64) V!3289 (_ BitVec 64) V!3289) Unit!3562)

(assert (=> b!114201 (= lt!59391 (addCommutativeForDiffKeys!62 lt!59392 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun lt!59396 () ListLongMap!1581)

(assert (=> b!114201 (= lt!59396 lt!59395)))

(assert (=> b!114201 (= lt!59395 (+!150 lt!59392 lt!59387))))

(declare-fun lt!59388 () ListLongMap!1581)

(declare-fun lt!59390 () tuple2!2448)

(assert (=> b!114201 (= lt!59396 (+!150 lt!59388 lt!59390))))

(declare-fun lt!59381 () ListLongMap!1581)

(assert (=> b!114201 (= lt!59392 (+!150 lt!59381 lt!59390))))

(assert (=> b!114201 (= lt!59390 (tuple2!2449 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2549 (v!2980 (underlying!381 thiss!992)))))))

(assert (=> b!114201 (= lt!59388 (+!150 lt!59381 lt!59387))))

(assert (=> b!114201 (= lt!59387 (tuple2!2449 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393))))

(declare-fun lt!59389 () Unit!3562)

(assert (=> b!114201 (= lt!59389 (addCommutativeForDiffKeys!62 lt!59381 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2549 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!115 (array!4443 array!4445 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 32) Int) ListLongMap!1581)

(assert (=> b!114201 (= lt!59381 (getCurrentListMapNoExtraKeys!115 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (_values!2665 (v!2980 (underlying!381 thiss!992))) (mask!6877 (v!2980 (underlying!381 thiss!992))) (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) (minValue!2549 (v!2980 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun b!114202 () Bool)

(assert (=> b!114202 (= e!74299 tp_is_empty!2731)))

(assert (= (and start!13080 res!56202) b!114187))

(assert (= (and b!114187 res!56206) b!114193))

(assert (= (and b!114193 res!56204) b!114186))

(assert (= (and b!114186 res!56201) b!114200))

(assert (= (and b!114200 res!56207) b!114185))

(assert (= (and b!114185 res!56205) b!114194))

(assert (= (and b!114194 c!20392) b!114184))

(assert (= (and b!114194 (not c!20392)) b!114183))

(assert (= (and b!114194 res!56203) b!114201))

(assert (= (and b!114201 (not res!56208)) b!114189))

(assert (= (and b!114199 condMapEmpty!4122) mapIsEmpty!4122))

(assert (= (and b!114199 (not condMapEmpty!4122)) mapNonEmpty!4121))

(get-info :version)

(assert (= (and mapNonEmpty!4121 ((_ is ValueCellFull!1022) mapValue!4122)) b!114202))

(assert (= (and b!114199 ((_ is ValueCellFull!1022) mapDefault!4121)) b!114192))

(assert (= b!114195 b!114199))

(assert (= b!114188 b!114195))

(assert (= b!114198 b!114188))

(assert (= start!13080 b!114198))

(assert (= (and b!114196 condMapEmpty!4121) mapIsEmpty!4121))

(assert (= (and b!114196 (not condMapEmpty!4121)) mapNonEmpty!4122))

(assert (= (and mapNonEmpty!4122 ((_ is ValueCellFull!1022) mapValue!4121)) b!114190))

(assert (= (and b!114196 ((_ is ValueCellFull!1022) mapDefault!4122)) b!114191))

(assert (= b!114197 b!114196))

(assert (= start!13080 b!114197))

(declare-fun b_lambda!5101 () Bool)

(assert (=> (not b_lambda!5101) (not b!114185)))

(declare-fun t!5862 () Bool)

(declare-fun tb!2181 () Bool)

(assert (=> (and b!114195 (= (defaultEntry!2682 (v!2980 (underlying!381 thiss!992))) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992)))) t!5862) tb!2181))

(declare-fun result!3643 () Bool)

(assert (=> tb!2181 (= result!3643 tp_is_empty!2731)))

(assert (=> b!114185 t!5862))

(declare-fun b_and!7041 () Bool)

(assert (= b_and!7037 (and (=> t!5862 result!3643) b_and!7041)))

(declare-fun tb!2183 () Bool)

(declare-fun t!5864 () Bool)

(assert (=> (and b!114197 (= (defaultEntry!2682 newMap!16) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992)))) t!5864) tb!2183))

(declare-fun result!3647 () Bool)

(assert (= result!3647 result!3643))

(assert (=> b!114185 t!5864))

(declare-fun b_and!7043 () Bool)

(assert (= b_and!7039 (and (=> t!5864 result!3647) b_and!7043)))

(declare-fun m!130321 () Bool)

(assert (=> b!114200 m!130321))

(declare-fun m!130323 () Bool)

(assert (=> b!114200 m!130323))

(declare-fun m!130325 () Bool)

(assert (=> b!114189 m!130325))

(declare-fun m!130327 () Bool)

(assert (=> b!114184 m!130327))

(declare-fun m!130329 () Bool)

(assert (=> b!114184 m!130329))

(declare-fun m!130331 () Bool)

(assert (=> b!114184 m!130331))

(declare-fun m!130333 () Bool)

(assert (=> b!114184 m!130333))

(assert (=> b!114184 m!130331))

(assert (=> b!114184 m!130331))

(declare-fun m!130335 () Bool)

(assert (=> b!114184 m!130335))

(assert (=> b!114184 m!130331))

(declare-fun m!130337 () Bool)

(assert (=> b!114184 m!130337))

(declare-fun m!130339 () Bool)

(assert (=> b!114197 m!130339))

(declare-fun m!130341 () Bool)

(assert (=> b!114197 m!130341))

(declare-fun m!130343 () Bool)

(assert (=> start!13080 m!130343))

(declare-fun m!130345 () Bool)

(assert (=> b!114195 m!130345))

(declare-fun m!130347 () Bool)

(assert (=> b!114195 m!130347))

(assert (=> b!114194 m!130331))

(assert (=> b!114194 m!130331))

(declare-fun m!130349 () Bool)

(assert (=> b!114194 m!130349))

(assert (=> b!114194 m!130331))

(declare-fun m!130351 () Bool)

(assert (=> b!114194 m!130351))

(declare-fun m!130353 () Bool)

(assert (=> b!114193 m!130353))

(declare-fun m!130355 () Bool)

(assert (=> mapNonEmpty!4122 m!130355))

(declare-fun m!130357 () Bool)

(assert (=> mapNonEmpty!4121 m!130357))

(assert (=> b!114185 m!130331))

(declare-fun m!130359 () Bool)

(assert (=> b!114185 m!130359))

(declare-fun m!130361 () Bool)

(assert (=> b!114185 m!130361))

(assert (=> b!114185 m!130359))

(assert (=> b!114185 m!130361))

(declare-fun m!130363 () Bool)

(assert (=> b!114185 m!130363))

(assert (=> b!114201 m!130331))

(declare-fun m!130365 () Bool)

(assert (=> b!114201 m!130365))

(declare-fun m!130367 () Bool)

(assert (=> b!114201 m!130367))

(declare-fun m!130369 () Bool)

(assert (=> b!114201 m!130369))

(declare-fun m!130371 () Bool)

(assert (=> b!114201 m!130371))

(assert (=> b!114201 m!130331))

(declare-fun m!130373 () Bool)

(assert (=> b!114201 m!130373))

(assert (=> b!114201 m!130367))

(declare-fun m!130375 () Bool)

(assert (=> b!114201 m!130375))

(assert (=> b!114201 m!130331))

(declare-fun m!130377 () Bool)

(assert (=> b!114201 m!130377))

(declare-fun m!130379 () Bool)

(assert (=> b!114201 m!130379))

(declare-fun m!130381 () Bool)

(assert (=> b!114201 m!130381))

(declare-fun m!130383 () Bool)

(assert (=> b!114201 m!130383))

(declare-fun m!130385 () Bool)

(assert (=> b!114201 m!130385))

(check-sat (not b_next!2631) (not b!114184) b_and!7043 (not b!114194) tp_is_empty!2731 (not b!114185) (not b!114197) (not b_lambda!5101) (not mapNonEmpty!4122) (not b!114193) (not b!114200) (not mapNonEmpty!4121) b_and!7041 (not b!114195) (not b!114201) (not b!114189) (not start!13080) (not b_next!2629))
(check-sat b_and!7041 b_and!7043 (not b_next!2629) (not b_next!2631))
(get-model)

(declare-fun b_lambda!5107 () Bool)

(assert (= b_lambda!5101 (or (and b!114195 b_free!2629) (and b!114197 b_free!2631 (= (defaultEntry!2682 newMap!16) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992))))) b_lambda!5107)))

(check-sat (not b_next!2631) (not b!114184) b_and!7043 (not b!114194) (not b!114185) (not b!114197) (not mapNonEmpty!4122) (not b!114193) (not b!114200) (not mapNonEmpty!4121) b_and!7041 (not b!114195) (not b!114201) (not b!114189) (not start!13080) (not b_next!2629) (not b_lambda!5107) tp_is_empty!2731)
(check-sat b_and!7041 b_and!7043 (not b_next!2629) (not b_next!2631))
(get-model)

(declare-fun d!32305 () Bool)

(assert (=> d!32305 (= (array_inv!1335 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvsge (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!114195 d!32305))

(declare-fun d!32307 () Bool)

(assert (=> d!32307 (= (array_inv!1336 (_values!2665 (v!2980 (underlying!381 thiss!992)))) (bvsge (size!2366 (_values!2665 (v!2980 (underlying!381 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!114195 d!32307))

(declare-fun d!32309 () Bool)

(declare-fun e!74422 () Bool)

(assert (=> d!32309 e!74422))

(declare-fun res!56259 () Bool)

(assert (=> d!32309 (=> res!56259 e!74422)))

(declare-fun lt!59515 () Bool)

(assert (=> d!32309 (= res!56259 (not lt!59515))))

(declare-fun lt!59513 () Bool)

(assert (=> d!32309 (= lt!59515 lt!59513)))

(declare-fun lt!59514 () Unit!3562)

(declare-fun e!74423 () Unit!3562)

(assert (=> d!32309 (= lt!59514 e!74423)))

(declare-fun c!20401 () Bool)

(assert (=> d!32309 (= c!20401 lt!59513)))

(declare-fun containsKey!163 (List!1649 (_ BitVec 64)) Bool)

(assert (=> d!32309 (= lt!59513 (containsKey!163 (toList!806 lt!59379) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355)))))

(assert (=> d!32309 (= (contains!843 lt!59379 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355)) lt!59515)))

(declare-fun b!114335 () Bool)

(declare-fun lt!59516 () Unit!3562)

(assert (=> b!114335 (= e!74423 lt!59516)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!112 (List!1649 (_ BitVec 64)) Unit!3562)

(assert (=> b!114335 (= lt!59516 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!806 lt!59379) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355)))))

(declare-datatypes ((Option!165 0))(
  ( (Some!164 (v!2986 V!3289)) (None!163) )
))
(declare-fun isDefined!113 (Option!165) Bool)

(declare-fun getValueByKey!159 (List!1649 (_ BitVec 64)) Option!165)

(assert (=> b!114335 (isDefined!113 (getValueByKey!159 (toList!806 lt!59379) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355)))))

(declare-fun b!114336 () Bool)

(declare-fun Unit!3566 () Unit!3562)

(assert (=> b!114336 (= e!74423 Unit!3566)))

(declare-fun b!114337 () Bool)

(assert (=> b!114337 (= e!74422 (isDefined!113 (getValueByKey!159 (toList!806 lt!59379) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355))))))

(assert (= (and d!32309 c!20401) b!114335))

(assert (= (and d!32309 (not c!20401)) b!114336))

(assert (= (and d!32309 (not res!56259)) b!114337))

(assert (=> d!32309 m!130331))

(declare-fun m!130519 () Bool)

(assert (=> d!32309 m!130519))

(assert (=> b!114335 m!130331))

(declare-fun m!130521 () Bool)

(assert (=> b!114335 m!130521))

(assert (=> b!114335 m!130331))

(declare-fun m!130523 () Bool)

(assert (=> b!114335 m!130523))

(assert (=> b!114335 m!130523))

(declare-fun m!130525 () Bool)

(assert (=> b!114335 m!130525))

(assert (=> b!114337 m!130331))

(assert (=> b!114337 m!130523))

(assert (=> b!114337 m!130523))

(assert (=> b!114337 m!130525))

(assert (=> b!114194 d!32309))

(declare-fun b!114422 () Bool)

(declare-fun e!74487 () tuple2!2446)

(declare-fun lt!59574 () tuple2!2446)

(assert (=> b!114422 (= e!74487 (tuple2!2447 (_1!1234 lt!59574) (_2!1234 lt!59574)))))

(declare-fun call!12312 () tuple2!2446)

(assert (=> b!114422 (= lt!59574 call!12312)))

(declare-fun b!114423 () Bool)

(declare-fun e!74484 () Bool)

(declare-fun call!12321 () Bool)

(assert (=> b!114423 (= e!74484 (not call!12321))))

(declare-fun b!114424 () Bool)

(declare-fun lt!59592 () Unit!3562)

(declare-fun lt!59584 () Unit!3562)

(assert (=> b!114424 (= lt!59592 lt!59584)))

(declare-fun call!12317 () ListLongMap!1581)

(declare-datatypes ((SeekEntryResult!267 0))(
  ( (MissingZero!267 (index!3221 (_ BitVec 32))) (Found!267 (index!3222 (_ BitVec 32))) (Intermediate!267 (undefined!1079 Bool) (index!3223 (_ BitVec 32)) (x!14318 (_ BitVec 32))) (Undefined!267) (MissingVacant!267 (index!3224 (_ BitVec 32))) )
))
(declare-fun lt!59578 () SeekEntryResult!267)

(assert (=> b!114424 (contains!843 call!12317 (select (arr!2104 (_keys!4403 newMap!16)) (index!3222 lt!59578)))))

(declare-fun lt!59590 () array!4445)

(declare-fun lemmaValidKeyInArrayIsInListMap!111 (array!4443 array!4445 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 32) Int) Unit!3562)

(assert (=> b!114424 (= lt!59584 (lemmaValidKeyInArrayIsInListMap!111 (_keys!4403 newMap!16) lt!59590 (mask!6877 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) (index!3222 lt!59578) (defaultEntry!2682 newMap!16)))))

(assert (=> b!114424 (= lt!59590 (array!4446 (store (arr!2105 (_values!2665 newMap!16)) (index!3222 lt!59578) (ValueCellFull!1022 lt!59393)) (size!2366 (_values!2665 newMap!16))))))

(declare-fun lt!59571 () Unit!3562)

(declare-fun lt!59573 () Unit!3562)

(assert (=> b!114424 (= lt!59571 lt!59573)))

(declare-fun call!12310 () ListLongMap!1581)

(declare-fun call!12327 () ListLongMap!1581)

(assert (=> b!114424 (= call!12310 call!12327)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!52 (array!4443 array!4445 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 32) (_ BitVec 64) V!3289 Int) Unit!3562)

(assert (=> b!114424 (= lt!59573 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!52 (_keys!4403 newMap!16) (_values!2665 newMap!16) (mask!6877 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) (index!3222 lt!59578) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393 (defaultEntry!2682 newMap!16)))))

(declare-fun lt!59579 () Unit!3562)

(declare-fun e!74481 () Unit!3562)

(assert (=> b!114424 (= lt!59579 e!74481)))

(declare-fun c!20440 () Bool)

(declare-fun call!12319 () Bool)

(assert (=> b!114424 (= c!20440 call!12319)))

(declare-fun e!74469 () tuple2!2446)

(assert (=> b!114424 (= e!74469 (tuple2!2447 true (LongMapFixedSize!953 (defaultEntry!2682 newMap!16) (mask!6877 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) (_size!525 newMap!16) (_keys!4403 newMap!16) (array!4446 (store (arr!2105 (_values!2665 newMap!16)) (index!3222 lt!59578) (ValueCellFull!1022 lt!59393)) (size!2366 (_values!2665 newMap!16))) (_vacant!525 newMap!16))))))

(declare-fun b!114425 () Bool)

(declare-fun res!56293 () Bool)

(declare-fun lt!59594 () SeekEntryResult!267)

(assert (=> b!114425 (= res!56293 (= (select (arr!2104 (_keys!4403 newMap!16)) (index!3224 lt!59594)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!74480 () Bool)

(assert (=> b!114425 (=> (not res!56293) (not e!74480))))

(declare-fun b!114426 () Bool)

(declare-fun e!74477 () Bool)

(assert (=> b!114426 (= e!74477 ((_ is Undefined!267) lt!59594))))

(declare-fun b!114427 () Bool)

(declare-fun e!74479 () Unit!3562)

(declare-fun lt!59597 () Unit!3562)

(assert (=> b!114427 (= e!74479 lt!59597)))

(declare-fun call!12308 () Unit!3562)

(assert (=> b!114427 (= lt!59597 call!12308)))

(declare-fun call!12304 () SeekEntryResult!267)

(assert (=> b!114427 (= lt!59594 call!12304)))

(declare-fun c!20442 () Bool)

(assert (=> b!114427 (= c!20442 ((_ is MissingZero!267) lt!59594))))

(declare-fun e!74473 () Bool)

(assert (=> b!114427 e!74473))

(declare-fun e!74470 () ListLongMap!1581)

(declare-fun bm!12301 () Bool)

(declare-fun c!20443 () Bool)

(declare-fun c!20430 () Bool)

(assert (=> bm!12301 (= call!12310 (+!150 e!74470 (ite c!20443 (ite c!20430 (tuple2!2449 #b0000000000000000000000000000000000000000000000000000000000000000 lt!59393) (tuple2!2449 #b1000000000000000000000000000000000000000000000000000000000000000 lt!59393)) (tuple2!2449 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393))))))

(declare-fun c!20435 () Bool)

(assert (=> bm!12301 (= c!20435 c!20443)))

(declare-fun bm!12302 () Bool)

(declare-fun call!12316 () ListLongMap!1581)

(assert (=> bm!12302 (= call!12316 (map!1303 newMap!16))))

(declare-fun bm!12303 () Bool)

(declare-fun call!12320 () Unit!3562)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!52 (array!4443 array!4445 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 64) Int) Unit!3562)

(assert (=> bm!12303 (= call!12320 (lemmaInListMapThenSeekEntryOrOpenFindsIt!52 (_keys!4403 newMap!16) (_values!2665 newMap!16) (mask!6877 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (defaultEntry!2682 newMap!16)))))

(declare-fun b!114428 () Bool)

(declare-fun e!74489 () Bool)

(declare-fun call!12311 () ListLongMap!1581)

(assert (=> b!114428 (= e!74489 (= call!12311 call!12316))))

(declare-fun b!114429 () Bool)

(declare-fun res!56289 () Bool)

(assert (=> b!114429 (=> (not res!56289) (not e!74484))))

(declare-fun call!12305 () Bool)

(assert (=> b!114429 (= res!56289 call!12305)))

(assert (=> b!114429 (= e!74473 e!74484)))

(declare-fun bm!12304 () Bool)

(declare-fun call!12314 () ListLongMap!1581)

(assert (=> bm!12304 (= call!12327 call!12314)))

(declare-fun bm!12305 () Bool)

(declare-fun call!12309 () Bool)

(declare-fun call!12307 () Bool)

(assert (=> bm!12305 (= call!12309 call!12307)))

(declare-fun b!114430 () Bool)

(assert (=> b!114430 (= e!74477 e!74480)))

(declare-fun res!56299 () Bool)

(assert (=> b!114430 (= res!56299 call!12305)))

(assert (=> b!114430 (=> (not res!56299) (not e!74480))))

(declare-fun d!32311 () Bool)

(declare-fun e!74483 () Bool)

(assert (=> d!32311 e!74483))

(declare-fun res!56291 () Bool)

(assert (=> d!32311 (=> (not res!56291) (not e!74483))))

(declare-fun lt!59587 () tuple2!2446)

(assert (=> d!32311 (= res!56291 (valid!449 (_2!1234 lt!59587)))))

(declare-fun e!74474 () tuple2!2446)

(assert (=> d!32311 (= lt!59587 e!74474)))

(assert (=> d!32311 (= c!20443 (= (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (bvneg (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355))))))

(assert (=> d!32311 (valid!449 newMap!16)))

(assert (=> d!32311 (= (update!172 newMap!16 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393) lt!59587)))

(declare-fun bm!12306 () Bool)

(declare-fun c!20434 () Bool)

(declare-fun updateHelperNewKey!52 (LongMapFixedSize!952 (_ BitVec 64) V!3289 (_ BitVec 32)) tuple2!2446)

(assert (=> bm!12306 (= call!12312 (updateHelperNewKey!52 newMap!16 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393 (ite c!20434 (index!3224 lt!59578) (index!3221 lt!59578))))))

(declare-fun b!114431 () Bool)

(assert (=> b!114431 (= c!20434 ((_ is MissingVacant!267) lt!59578))))

(declare-fun e!74478 () tuple2!2446)

(assert (=> b!114431 (= e!74478 e!74487)))

(declare-fun b!114432 () Bool)

(assert (=> b!114432 (= e!74474 e!74478)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4443 (_ BitVec 32)) SeekEntryResult!267)

(assert (=> b!114432 (= lt!59578 (seekEntryOrOpen!0 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (_keys!4403 newMap!16) (mask!6877 newMap!16)))))

(declare-fun c!20432 () Bool)

(assert (=> b!114432 (= c!20432 ((_ is Undefined!267) lt!59578))))

(declare-fun b!114433 () Bool)

(declare-fun Unit!3567 () Unit!3562)

(assert (=> b!114433 (= e!74481 Unit!3567)))

(declare-fun lt!59575 () Unit!3562)

(assert (=> b!114433 (= lt!59575 call!12308)))

(declare-fun lt!59586 () SeekEntryResult!267)

(declare-fun call!12322 () SeekEntryResult!267)

(assert (=> b!114433 (= lt!59586 call!12322)))

(declare-fun c!20431 () Bool)

(assert (=> b!114433 (= c!20431 ((_ is MissingZero!267) lt!59586))))

(declare-fun e!74476 () Bool)

(assert (=> b!114433 e!74476))

(declare-fun lt!59589 () Unit!3562)

(assert (=> b!114433 (= lt!59589 lt!59575)))

(assert (=> b!114433 false))

(declare-fun bm!12307 () Bool)

(declare-fun call!12306 () ListLongMap!1581)

(assert (=> bm!12307 (= call!12306 call!12310)))

(declare-fun bm!12308 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!52 (array!4443 array!4445 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 64) Int) Unit!3562)

(assert (=> bm!12308 (= call!12308 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!52 (_keys!4403 newMap!16) (_values!2665 newMap!16) (mask!6877 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (defaultEntry!2682 newMap!16)))))

(declare-fun bm!12309 () Bool)

(assert (=> bm!12309 (= call!12311 (map!1303 (_2!1234 lt!59587)))))

(declare-fun b!114434 () Bool)

(declare-fun Unit!3568 () Unit!3562)

(assert (=> b!114434 (= e!74479 Unit!3568)))

(declare-fun lt!59591 () Unit!3562)

(assert (=> b!114434 (= lt!59591 call!12320)))

(declare-fun lt!59572 () SeekEntryResult!267)

(assert (=> b!114434 (= lt!59572 call!12304)))

(declare-fun res!56301 () Bool)

(assert (=> b!114434 (= res!56301 ((_ is Found!267) lt!59572))))

(declare-fun e!74485 () Bool)

(assert (=> b!114434 (=> (not res!56301) (not e!74485))))

(assert (=> b!114434 e!74485))

(declare-fun lt!59576 () Unit!3562)

(assert (=> b!114434 (= lt!59576 lt!59591)))

(assert (=> b!114434 false))

(declare-fun b!114435 () Bool)

(declare-fun res!56296 () Bool)

(declare-fun e!74486 () Bool)

(assert (=> b!114435 (=> (not res!56296) (not e!74486))))

(declare-fun call!12313 () Bool)

(assert (=> b!114435 (= res!56296 call!12313)))

(assert (=> b!114435 (= e!74476 e!74486)))

(declare-fun b!114436 () Bool)

(assert (=> b!114436 (= e!74486 (not call!12309))))

(declare-fun b!114437 () Bool)

(declare-fun e!74482 () Bool)

(assert (=> b!114437 (= e!74489 e!74482)))

(declare-fun res!56298 () Bool)

(assert (=> b!114437 (= res!56298 (contains!843 call!12311 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355)))))

(assert (=> b!114437 (=> (not res!56298) (not e!74482))))

(declare-fun b!114438 () Bool)

(declare-fun c!20439 () Bool)

(assert (=> b!114438 (= c!20439 ((_ is MissingVacant!267) lt!59594))))

(assert (=> b!114438 (= e!74473 e!74477)))

(declare-fun b!114439 () Bool)

(declare-fun e!74472 () Bool)

(assert (=> b!114439 (= e!74472 ((_ is Undefined!267) lt!59586))))

(declare-fun bm!12310 () Bool)

(declare-fun c!20436 () Bool)

(assert (=> bm!12310 (= c!20436 c!20432)))

(declare-fun e!74468 () ListLongMap!1581)

(assert (=> bm!12310 (= call!12319 (contains!843 e!74468 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355)))))

(declare-fun b!114440 () Bool)

(declare-fun res!56294 () Bool)

(declare-fun call!12323 () Bool)

(assert (=> b!114440 (= res!56294 call!12323)))

(declare-fun e!74471 () Bool)

(assert (=> b!114440 (=> (not res!56294) (not e!74471))))

(declare-fun bm!12311 () Bool)

(declare-fun call!12326 () SeekEntryResult!267)

(assert (=> bm!12311 (= call!12326 (seekEntryOrOpen!0 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (_keys!4403 newMap!16) (mask!6877 newMap!16)))))

(declare-fun lt!59585 () (_ BitVec 32))

(declare-fun bm!12312 () Bool)

(assert (=> bm!12312 (= call!12317 (getCurrentListMap!479 (_keys!4403 newMap!16) (ite c!20443 (_values!2665 newMap!16) lt!59590) (mask!6877 newMap!16) (ite (and c!20443 c!20430) lt!59585 (extraKeys!2471 newMap!16)) (ite (and c!20443 c!20430) lt!59393 (zeroValue!2549 newMap!16)) (minValue!2549 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2682 newMap!16)))))

(declare-fun bm!12313 () Bool)

(assert (=> bm!12313 (= call!12322 call!12326)))

(declare-fun b!114441 () Bool)

(declare-fun c!20441 () Bool)

(assert (=> b!114441 (= c!20441 ((_ is MissingVacant!267) lt!59586))))

(assert (=> b!114441 (= e!74476 e!74472)))

(declare-fun b!114442 () Bool)

(declare-fun e!74475 () Bool)

(assert (=> b!114442 (= e!74472 e!74475)))

(declare-fun res!56300 () Bool)

(assert (=> b!114442 (= res!56300 call!12313)))

(assert (=> b!114442 (=> (not res!56300) (not e!74475))))

(declare-fun b!114443 () Bool)

(assert (=> b!114443 (= e!74468 (getCurrentListMap!479 (_keys!4403 newMap!16) (_values!2665 newMap!16) (mask!6877 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2682 newMap!16)))))

(declare-fun b!114444 () Bool)

(declare-fun lt!59581 () Unit!3562)

(declare-fun lt!59595 () Unit!3562)

(assert (=> b!114444 (= lt!59581 lt!59595)))

(declare-fun call!12318 () ListLongMap!1581)

(assert (=> b!114444 (= call!12306 call!12318)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!52 (array!4443 array!4445 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 V!3289 Int) Unit!3562)

(assert (=> b!114444 (= lt!59595 (lemmaChangeZeroKeyThenAddPairToListMap!52 (_keys!4403 newMap!16) (_values!2665 newMap!16) (mask!6877 newMap!16) (extraKeys!2471 newMap!16) lt!59585 (zeroValue!2549 newMap!16) lt!59393 (minValue!2549 newMap!16) (defaultEntry!2682 newMap!16)))))

(assert (=> b!114444 (= lt!59585 (bvor (extraKeys!2471 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!74488 () tuple2!2446)

(assert (=> b!114444 (= e!74488 (tuple2!2447 true (LongMapFixedSize!953 (defaultEntry!2682 newMap!16) (mask!6877 newMap!16) (bvor (extraKeys!2471 newMap!16) #b00000000000000000000000000000001) lt!59393 (minValue!2549 newMap!16) (_size!525 newMap!16) (_keys!4403 newMap!16) (_values!2665 newMap!16) (_vacant!525 newMap!16))))))

(declare-fun b!114445 () Bool)

(assert (=> b!114445 (= e!74487 e!74469)))

(declare-fun c!20437 () Bool)

(assert (=> b!114445 (= c!20437 ((_ is MissingZero!267) lt!59578))))

(declare-fun bm!12314 () Bool)

(declare-fun call!12325 () Bool)

(assert (=> bm!12314 (= call!12323 call!12325)))

(declare-fun bm!12315 () Bool)

(assert (=> bm!12315 (= call!12321 call!12307)))

(declare-fun b!114446 () Bool)

(assert (=> b!114446 (= e!74475 (not call!12309))))

(declare-fun bm!12316 () Bool)

(assert (=> bm!12316 (= call!12313 call!12323)))

(declare-fun lt!59577 () (_ BitVec 32))

(declare-fun bm!12317 () Bool)

(assert (=> bm!12317 (= call!12314 (getCurrentListMap!479 (_keys!4403 newMap!16) (ite (or c!20443 c!20432) (_values!2665 newMap!16) (array!4446 (store (arr!2105 (_values!2665 newMap!16)) (index!3222 lt!59578) (ValueCellFull!1022 lt!59393)) (size!2366 (_values!2665 newMap!16)))) (mask!6877 newMap!16) (ite c!20443 (ite c!20430 (extraKeys!2471 newMap!16) lt!59577) (extraKeys!2471 newMap!16)) (zeroValue!2549 newMap!16) (ite c!20443 (ite c!20430 (minValue!2549 newMap!16) lt!59393) (minValue!2549 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2682 newMap!16)))))

(declare-fun bm!12318 () Bool)

(assert (=> bm!12318 (= call!12304 call!12326)))

(declare-fun b!114447 () Bool)

(assert (=> b!114447 (= e!74480 (not call!12321))))

(declare-fun b!114448 () Bool)

(declare-fun lt!59593 () Unit!3562)

(assert (=> b!114448 (= e!74481 lt!59593)))

(assert (=> b!114448 (= lt!59593 call!12320)))

(declare-fun lt!59588 () SeekEntryResult!267)

(assert (=> b!114448 (= lt!59588 call!12322)))

(declare-fun res!56295 () Bool)

(assert (=> b!114448 (= res!56295 ((_ is Found!267) lt!59588))))

(assert (=> b!114448 (=> (not res!56295) (not e!74471))))

(assert (=> b!114448 e!74471))

(declare-fun b!114449 () Bool)

(assert (=> b!114449 (= e!74471 (= (select (arr!2104 (_keys!4403 newMap!16)) (index!3222 lt!59588)) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355)))))

(declare-fun call!12315 () ListLongMap!1581)

(declare-fun b!114450 () Bool)

(assert (=> b!114450 (= e!74470 (ite c!20430 call!12315 call!12318))))

(declare-fun b!114451 () Bool)

(assert (=> b!114451 (= e!74482 (= call!12311 (+!150 call!12316 (tuple2!2449 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393))))))

(declare-fun b!114452 () Bool)

(assert (=> b!114452 (= e!74474 e!74488)))

(assert (=> b!114452 (= c!20430 (= (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12319 () Bool)

(declare-fun call!12324 () Bool)

(assert (=> bm!12319 (= call!12324 call!12325)))

(declare-fun b!114453 () Bool)

(declare-fun res!56290 () Bool)

(assert (=> b!114453 (=> (not res!56290) (not e!74486))))

(assert (=> b!114453 (= res!56290 (= (select (arr!2104 (_keys!4403 newMap!16)) (index!3221 lt!59586)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!114454 () Bool)

(assert (=> b!114454 (= e!74468 call!12327)))

(declare-fun bm!12320 () Bool)

(assert (=> bm!12320 (= call!12318 call!12317)))

(declare-fun c!20433 () Bool)

(declare-fun bm!12321 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!12321 (= call!12325 (inRange!0 (ite c!20432 (ite c!20433 (index!3222 lt!59572) (ite c!20442 (index!3221 lt!59594) (index!3224 lt!59594))) (ite c!20440 (index!3222 lt!59588) (ite c!20431 (index!3221 lt!59586) (index!3224 lt!59586)))) (mask!6877 newMap!16)))))

(declare-fun bm!12322 () Bool)

(assert (=> bm!12322 (= call!12307 (arrayContainsKey!0 (_keys!4403 newMap!16) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!114455 () Bool)

(assert (=> b!114455 (= e!74483 e!74489)))

(declare-fun c!20438 () Bool)

(assert (=> b!114455 (= c!20438 (_1!1234 lt!59587))))

(declare-fun b!114456 () Bool)

(assert (=> b!114456 (= e!74485 (= (select (arr!2104 (_keys!4403 newMap!16)) (index!3222 lt!59572)) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355)))))

(declare-fun bm!12323 () Bool)

(assert (=> bm!12323 (= call!12305 call!12324)))

(declare-fun b!114457 () Bool)

(declare-fun res!56288 () Bool)

(assert (=> b!114457 (=> (not res!56288) (not e!74484))))

(assert (=> b!114457 (= res!56288 (= (select (arr!2104 (_keys!4403 newMap!16)) (index!3221 lt!59594)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!114458 () Bool)

(declare-fun res!56297 () Bool)

(assert (=> b!114458 (= res!56297 call!12324)))

(assert (=> b!114458 (=> (not res!56297) (not e!74485))))

(declare-fun b!114459 () Bool)

(declare-fun lt!59583 () tuple2!2446)

(assert (=> b!114459 (= lt!59583 call!12312)))

(assert (=> b!114459 (= e!74469 (tuple2!2447 (_1!1234 lt!59583) (_2!1234 lt!59583)))))

(declare-fun b!114460 () Bool)

(declare-fun lt!59596 () Unit!3562)

(assert (=> b!114460 (= lt!59596 e!74479)))

(assert (=> b!114460 (= c!20433 call!12319)))

(assert (=> b!114460 (= e!74478 (tuple2!2447 false newMap!16))))

(declare-fun b!114461 () Bool)

(declare-fun res!56292 () Bool)

(assert (=> b!114461 (= res!56292 (= (select (arr!2104 (_keys!4403 newMap!16)) (index!3224 lt!59586)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!114461 (=> (not res!56292) (not e!74475))))

(declare-fun b!114462 () Bool)

(declare-fun lt!59580 () Unit!3562)

(declare-fun lt!59582 () Unit!3562)

(assert (=> b!114462 (= lt!59580 lt!59582)))

(assert (=> b!114462 (= call!12306 call!12315)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!52 (array!4443 array!4445 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 V!3289 Int) Unit!3562)

(assert (=> b!114462 (= lt!59582 (lemmaChangeLongMinValueKeyThenAddPairToListMap!52 (_keys!4403 newMap!16) (_values!2665 newMap!16) (mask!6877 newMap!16) (extraKeys!2471 newMap!16) lt!59577 (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) lt!59393 (defaultEntry!2682 newMap!16)))))

(assert (=> b!114462 (= lt!59577 (bvor (extraKeys!2471 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!114462 (= e!74488 (tuple2!2447 true (LongMapFixedSize!953 (defaultEntry!2682 newMap!16) (mask!6877 newMap!16) (bvor (extraKeys!2471 newMap!16) #b00000000000000000000000000000010) (zeroValue!2549 newMap!16) lt!59393 (_size!525 newMap!16) (_keys!4403 newMap!16) (_values!2665 newMap!16) (_vacant!525 newMap!16))))))

(declare-fun bm!12324 () Bool)

(assert (=> bm!12324 (= call!12315 call!12314)))

(declare-fun b!114463 () Bool)

(assert (=> b!114463 (= e!74470 (getCurrentListMap!479 (_keys!4403 newMap!16) (_values!2665 newMap!16) (mask!6877 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2682 newMap!16)))))

(assert (= (and d!32311 c!20443) b!114452))

(assert (= (and d!32311 (not c!20443)) b!114432))

(assert (= (and b!114452 c!20430) b!114444))

(assert (= (and b!114452 (not c!20430)) b!114462))

(assert (= (or b!114444 b!114462) bm!12320))

(assert (= (or b!114444 b!114462) bm!12324))

(assert (= (or b!114444 b!114462) bm!12307))

(assert (= (and b!114432 c!20432) b!114460))

(assert (= (and b!114432 (not c!20432)) b!114431))

(assert (= (and b!114460 c!20433) b!114434))

(assert (= (and b!114460 (not c!20433)) b!114427))

(assert (= (and b!114434 res!56301) b!114458))

(assert (= (and b!114458 res!56297) b!114456))

(assert (= (and b!114427 c!20442) b!114429))

(assert (= (and b!114427 (not c!20442)) b!114438))

(assert (= (and b!114429 res!56289) b!114457))

(assert (= (and b!114457 res!56288) b!114423))

(assert (= (and b!114438 c!20439) b!114430))

(assert (= (and b!114438 (not c!20439)) b!114426))

(assert (= (and b!114430 res!56299) b!114425))

(assert (= (and b!114425 res!56293) b!114447))

(assert (= (or b!114429 b!114430) bm!12323))

(assert (= (or b!114423 b!114447) bm!12315))

(assert (= (or b!114458 bm!12323) bm!12319))

(assert (= (or b!114434 b!114427) bm!12318))

(assert (= (and b!114431 c!20434) b!114422))

(assert (= (and b!114431 (not c!20434)) b!114445))

(assert (= (and b!114445 c!20437) b!114459))

(assert (= (and b!114445 (not c!20437)) b!114424))

(assert (= (and b!114424 c!20440) b!114448))

(assert (= (and b!114424 (not c!20440)) b!114433))

(assert (= (and b!114448 res!56295) b!114440))

(assert (= (and b!114440 res!56294) b!114449))

(assert (= (and b!114433 c!20431) b!114435))

(assert (= (and b!114433 (not c!20431)) b!114441))

(assert (= (and b!114435 res!56296) b!114453))

(assert (= (and b!114453 res!56290) b!114436))

(assert (= (and b!114441 c!20441) b!114442))

(assert (= (and b!114441 (not c!20441)) b!114439))

(assert (= (and b!114442 res!56300) b!114461))

(assert (= (and b!114461 res!56292) b!114446))

(assert (= (or b!114435 b!114442) bm!12316))

(assert (= (or b!114436 b!114446) bm!12305))

(assert (= (or b!114440 bm!12316) bm!12314))

(assert (= (or b!114448 b!114433) bm!12313))

(assert (= (or b!114422 b!114459) bm!12306))

(assert (= (or bm!12318 bm!12313) bm!12311))

(assert (= (or b!114434 b!114448) bm!12303))

(assert (= (or bm!12319 bm!12314) bm!12321))

(assert (= (or b!114427 b!114433) bm!12308))

(assert (= (or b!114460 b!114424) bm!12304))

(assert (= (or bm!12315 bm!12305) bm!12322))

(assert (= (or b!114460 b!114424) bm!12310))

(assert (= (and bm!12310 c!20436) b!114454))

(assert (= (and bm!12310 (not c!20436)) b!114443))

(assert (= (or bm!12324 bm!12304) bm!12317))

(assert (= (or bm!12320 b!114424) bm!12312))

(assert (= (or bm!12307 b!114424) bm!12301))

(assert (= (and bm!12301 c!20435) b!114450))

(assert (= (and bm!12301 (not c!20435)) b!114463))

(assert (= (and d!32311 res!56291) b!114455))

(assert (= (and b!114455 c!20438) b!114437))

(assert (= (and b!114455 (not c!20438)) b!114428))

(assert (= (and b!114437 res!56298) b!114451))

(assert (= (or b!114451 b!114428) bm!12302))

(assert (= (or b!114437 b!114451 b!114428) bm!12309))

(assert (=> b!114432 m!130331))

(declare-fun m!130527 () Bool)

(assert (=> b!114432 m!130527))

(declare-fun m!130529 () Bool)

(assert (=> bm!12312 m!130529))

(declare-fun m!130531 () Bool)

(assert (=> b!114461 m!130531))

(declare-fun m!130533 () Bool)

(assert (=> b!114463 m!130533))

(assert (=> bm!12303 m!130331))

(declare-fun m!130535 () Bool)

(assert (=> bm!12303 m!130535))

(declare-fun m!130537 () Bool)

(assert (=> bm!12309 m!130537))

(declare-fun m!130539 () Bool)

(assert (=> bm!12317 m!130539))

(declare-fun m!130541 () Bool)

(assert (=> bm!12317 m!130541))

(declare-fun m!130543 () Bool)

(assert (=> d!32311 m!130543))

(assert (=> d!32311 m!130353))

(declare-fun m!130545 () Bool)

(assert (=> b!114451 m!130545))

(assert (=> bm!12306 m!130331))

(declare-fun m!130547 () Bool)

(assert (=> bm!12306 m!130547))

(assert (=> b!114437 m!130331))

(declare-fun m!130549 () Bool)

(assert (=> b!114437 m!130549))

(declare-fun m!130551 () Bool)

(assert (=> b!114425 m!130551))

(declare-fun m!130553 () Bool)

(assert (=> b!114462 m!130553))

(declare-fun m!130555 () Bool)

(assert (=> b!114453 m!130555))

(declare-fun m!130557 () Bool)

(assert (=> bm!12321 m!130557))

(assert (=> bm!12308 m!130331))

(declare-fun m!130559 () Bool)

(assert (=> bm!12308 m!130559))

(declare-fun m!130561 () Bool)

(assert (=> b!114444 m!130561))

(declare-fun m!130563 () Bool)

(assert (=> b!114449 m!130563))

(assert (=> b!114424 m!130331))

(declare-fun m!130565 () Bool)

(assert (=> b!114424 m!130565))

(declare-fun m!130567 () Bool)

(assert (=> b!114424 m!130567))

(assert (=> b!114424 m!130567))

(declare-fun m!130569 () Bool)

(assert (=> b!114424 m!130569))

(assert (=> b!114424 m!130539))

(declare-fun m!130571 () Bool)

(assert (=> b!114424 m!130571))

(assert (=> bm!12302 m!130321))

(assert (=> bm!12311 m!130331))

(assert (=> bm!12311 m!130527))

(assert (=> b!114443 m!130533))

(declare-fun m!130573 () Bool)

(assert (=> bm!12301 m!130573))

(assert (=> bm!12322 m!130331))

(declare-fun m!130575 () Bool)

(assert (=> bm!12322 m!130575))

(assert (=> bm!12310 m!130331))

(declare-fun m!130577 () Bool)

(assert (=> bm!12310 m!130577))

(declare-fun m!130579 () Bool)

(assert (=> b!114457 m!130579))

(declare-fun m!130581 () Bool)

(assert (=> b!114456 m!130581))

(assert (=> b!114194 d!32311))

(declare-fun d!32313 () Bool)

(declare-fun c!20446 () Bool)

(assert (=> d!32313 (= c!20446 ((_ is ValueCellFull!1022) (select (arr!2105 (_values!2665 (v!2980 (underlying!381 thiss!992)))) from!355)))))

(declare-fun e!74492 () V!3289)

(assert (=> d!32313 (= (get!1376 (select (arr!2105 (_values!2665 (v!2980 (underlying!381 thiss!992)))) from!355) (dynLambda!395 (defaultEntry!2682 (v!2980 (underlying!381 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!74492)))

(declare-fun b!114468 () Bool)

(declare-fun get!1377 (ValueCell!1022 V!3289) V!3289)

(assert (=> b!114468 (= e!74492 (get!1377 (select (arr!2105 (_values!2665 (v!2980 (underlying!381 thiss!992)))) from!355) (dynLambda!395 (defaultEntry!2682 (v!2980 (underlying!381 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114469 () Bool)

(declare-fun get!1378 (ValueCell!1022 V!3289) V!3289)

(assert (=> b!114469 (= e!74492 (get!1378 (select (arr!2105 (_values!2665 (v!2980 (underlying!381 thiss!992)))) from!355) (dynLambda!395 (defaultEntry!2682 (v!2980 (underlying!381 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32313 c!20446) b!114468))

(assert (= (and d!32313 (not c!20446)) b!114469))

(assert (=> b!114468 m!130359))

(assert (=> b!114468 m!130361))

(declare-fun m!130583 () Bool)

(assert (=> b!114468 m!130583))

(assert (=> b!114469 m!130359))

(assert (=> b!114469 m!130361))

(declare-fun m!130585 () Bool)

(assert (=> b!114469 m!130585))

(assert (=> b!114185 d!32313))

(declare-fun d!32315 () Bool)

(declare-fun res!56308 () Bool)

(declare-fun e!74495 () Bool)

(assert (=> d!32315 (=> (not res!56308) (not e!74495))))

(declare-fun simpleValid!79 (LongMapFixedSize!952) Bool)

(assert (=> d!32315 (= res!56308 (simpleValid!79 (v!2980 (underlying!381 thiss!992))))))

(assert (=> d!32315 (= (valid!449 (v!2980 (underlying!381 thiss!992))) e!74495)))

(declare-fun b!114476 () Bool)

(declare-fun res!56309 () Bool)

(assert (=> b!114476 (=> (not res!56309) (not e!74495))))

(declare-fun arrayCountValidKeys!0 (array!4443 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!114476 (= res!56309 (= (arrayCountValidKeys!0 (_keys!4403 (v!2980 (underlying!381 thiss!992))) #b00000000000000000000000000000000 (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992))))) (_size!525 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun b!114477 () Bool)

(declare-fun res!56310 () Bool)

(assert (=> b!114477 (=> (not res!56310) (not e!74495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4443 (_ BitVec 32)) Bool)

(assert (=> b!114477 (= res!56310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (mask!6877 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun b!114478 () Bool)

(assert (=> b!114478 (= e!74495 (arrayNoDuplicates!0 (_keys!4403 (v!2980 (underlying!381 thiss!992))) #b00000000000000000000000000000000 Nil!1645))))

(assert (= (and d!32315 res!56308) b!114476))

(assert (= (and b!114476 res!56309) b!114477))

(assert (= (and b!114477 res!56310) b!114478))

(declare-fun m!130587 () Bool)

(assert (=> d!32315 m!130587))

(declare-fun m!130589 () Bool)

(assert (=> b!114476 m!130589))

(declare-fun m!130591 () Bool)

(assert (=> b!114477 m!130591))

(declare-fun m!130593 () Bool)

(assert (=> b!114478 m!130593))

(assert (=> b!114189 d!32315))

(declare-fun d!32317 () Bool)

(declare-fun res!56311 () Bool)

(declare-fun e!74496 () Bool)

(assert (=> d!32317 (=> (not res!56311) (not e!74496))))

(assert (=> d!32317 (= res!56311 (simpleValid!79 newMap!16))))

(assert (=> d!32317 (= (valid!449 newMap!16) e!74496)))

(declare-fun b!114479 () Bool)

(declare-fun res!56312 () Bool)

(assert (=> b!114479 (=> (not res!56312) (not e!74496))))

(assert (=> b!114479 (= res!56312 (= (arrayCountValidKeys!0 (_keys!4403 newMap!16) #b00000000000000000000000000000000 (size!2365 (_keys!4403 newMap!16))) (_size!525 newMap!16)))))

(declare-fun b!114480 () Bool)

(declare-fun res!56313 () Bool)

(assert (=> b!114480 (=> (not res!56313) (not e!74496))))

(assert (=> b!114480 (= res!56313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4403 newMap!16) (mask!6877 newMap!16)))))

(declare-fun b!114481 () Bool)

(assert (=> b!114481 (= e!74496 (arrayNoDuplicates!0 (_keys!4403 newMap!16) #b00000000000000000000000000000000 Nil!1645))))

(assert (= (and d!32317 res!56311) b!114479))

(assert (= (and b!114479 res!56312) b!114480))

(assert (= (and b!114480 res!56313) b!114481))

(declare-fun m!130595 () Bool)

(assert (=> d!32317 m!130595))

(declare-fun m!130597 () Bool)

(assert (=> b!114479 m!130597))

(declare-fun m!130599 () Bool)

(assert (=> b!114480 m!130599))

(declare-fun m!130601 () Bool)

(assert (=> b!114481 m!130601))

(assert (=> b!114193 d!32317))

(declare-fun d!32319 () Bool)

(assert (=> d!32319 (= (array_inv!1335 (_keys!4403 newMap!16)) (bvsge (size!2365 (_keys!4403 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!114197 d!32319))

(declare-fun d!32321 () Bool)

(assert (=> d!32321 (= (array_inv!1336 (_values!2665 newMap!16)) (bvsge (size!2366 (_values!2665 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!114197 d!32321))

(declare-fun d!32323 () Bool)

(assert (=> d!32323 (not (arrayContainsKey!0 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!59600 () Unit!3562)

(declare-fun choose!68 (array!4443 (_ BitVec 32) (_ BitVec 64) List!1648) Unit!3562)

(assert (=> d!32323 (= lt!59600 (choose!68 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (Cons!1644 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) Nil!1645)))))

(assert (=> d!32323 (bvslt (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!32323 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (Cons!1644 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) Nil!1645)) lt!59600)))

(declare-fun bs!4667 () Bool)

(assert (= bs!4667 d!32323))

(assert (=> bs!4667 m!130331))

(assert (=> bs!4667 m!130335))

(assert (=> bs!4667 m!130331))

(declare-fun m!130603 () Bool)

(assert (=> bs!4667 m!130603))

(assert (=> b!114184 d!32323))

(declare-fun d!32325 () Bool)

(assert (=> d!32325 (arrayNoDuplicates!0 (_keys!4403 (v!2980 (underlying!381 thiss!992))) from!355 Nil!1645)))

(declare-fun lt!59603 () Unit!3562)

(declare-fun choose!39 (array!4443 (_ BitVec 32) (_ BitVec 32)) Unit!3562)

(assert (=> d!32325 (= lt!59603 (choose!39 (_keys!4403 (v!2980 (underlying!381 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!32325 (bvslt (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!32325 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4403 (v!2980 (underlying!381 thiss!992))) #b00000000000000000000000000000000 from!355) lt!59603)))

(declare-fun bs!4668 () Bool)

(assert (= bs!4668 d!32325))

(assert (=> bs!4668 m!130329))

(declare-fun m!130605 () Bool)

(assert (=> bs!4668 m!130605))

(assert (=> b!114184 d!32325))

(declare-fun d!32327 () Bool)

(declare-fun res!56318 () Bool)

(declare-fun e!74501 () Bool)

(assert (=> d!32327 (=> res!56318 e!74501)))

(assert (=> d!32327 (= res!56318 (= (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355)))))

(assert (=> d!32327 (= (arrayContainsKey!0 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!74501)))

(declare-fun b!114486 () Bool)

(declare-fun e!74502 () Bool)

(assert (=> b!114486 (= e!74501 e!74502)))

(declare-fun res!56319 () Bool)

(assert (=> b!114486 (=> (not res!56319) (not e!74502))))

(assert (=> b!114486 (= res!56319 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992))))))))

(declare-fun b!114487 () Bool)

(assert (=> b!114487 (= e!74502 (arrayContainsKey!0 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!32327 (not res!56318)) b!114486))

(assert (= (and b!114486 res!56319) b!114487))

(declare-fun m!130607 () Bool)

(assert (=> d!32327 m!130607))

(assert (=> b!114487 m!130331))

(declare-fun m!130609 () Bool)

(assert (=> b!114487 m!130609))

(assert (=> b!114184 d!32327))

(declare-fun d!32329 () Bool)

(declare-fun e!74505 () Bool)

(assert (=> d!32329 e!74505))

(declare-fun c!20449 () Bool)

(assert (=> d!32329 (= c!20449 (and (not (= (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!59606 () Unit!3562)

(declare-fun choose!730 (array!4443 array!4445 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 64) (_ BitVec 32) Int) Unit!3562)

(assert (=> d!32329 (= lt!59606 (choose!730 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (_values!2665 (v!2980 (underlying!381 thiss!992))) (mask!6877 (v!2980 (underlying!381 thiss!992))) (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) (minValue!2549 (v!2980 (underlying!381 thiss!992))) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!32329 (validMask!0 (mask!6877 (v!2980 (underlying!381 thiss!992))))))

(assert (=> d!32329 (= (lemmaListMapContainsThenArrayContainsFrom!123 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (_values!2665 (v!2980 (underlying!381 thiss!992))) (mask!6877 (v!2980 (underlying!381 thiss!992))) (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) (minValue!2549 (v!2980 (underlying!381 thiss!992))) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992)))) lt!59606)))

(declare-fun b!114492 () Bool)

(assert (=> b!114492 (= e!74505 (arrayContainsKey!0 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!114493 () Bool)

(assert (=> b!114493 (= e!74505 (ite (= (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!32329 c!20449) b!114492))

(assert (= (and d!32329 (not c!20449)) b!114493))

(assert (=> d!32329 m!130331))

(declare-fun m!130611 () Bool)

(assert (=> d!32329 m!130611))

(declare-fun m!130613 () Bool)

(assert (=> d!32329 m!130613))

(assert (=> b!114492 m!130331))

(assert (=> b!114492 m!130335))

(assert (=> b!114184 d!32329))

(declare-fun b!114504 () Bool)

(declare-fun e!74515 () Bool)

(declare-fun call!12330 () Bool)

(assert (=> b!114504 (= e!74515 call!12330)))

(declare-fun b!114505 () Bool)

(declare-fun e!74517 () Bool)

(declare-fun contains!844 (List!1648 (_ BitVec 64)) Bool)

(assert (=> b!114505 (= e!74517 (contains!844 Nil!1645 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355)))))

(declare-fun c!20452 () Bool)

(declare-fun bm!12327 () Bool)

(assert (=> bm!12327 (= call!12330 (arrayNoDuplicates!0 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!20452 (Cons!1644 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) Nil!1645) Nil!1645)))))

(declare-fun d!32331 () Bool)

(declare-fun res!56326 () Bool)

(declare-fun e!74516 () Bool)

(assert (=> d!32331 (=> res!56326 e!74516)))

(assert (=> d!32331 (= res!56326 (bvsge from!355 (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992))))))))

(assert (=> d!32331 (= (arrayNoDuplicates!0 (_keys!4403 (v!2980 (underlying!381 thiss!992))) from!355 Nil!1645) e!74516)))

(declare-fun b!114506 () Bool)

(declare-fun e!74514 () Bool)

(assert (=> b!114506 (= e!74516 e!74514)))

(declare-fun res!56327 () Bool)

(assert (=> b!114506 (=> (not res!56327) (not e!74514))))

(assert (=> b!114506 (= res!56327 (not e!74517))))

(declare-fun res!56328 () Bool)

(assert (=> b!114506 (=> (not res!56328) (not e!74517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!114506 (= res!56328 (validKeyInArray!0 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355)))))

(declare-fun b!114507 () Bool)

(assert (=> b!114507 (= e!74514 e!74515)))

(assert (=> b!114507 (= c!20452 (validKeyInArray!0 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355)))))

(declare-fun b!114508 () Bool)

(assert (=> b!114508 (= e!74515 call!12330)))

(assert (= (and d!32331 (not res!56326)) b!114506))

(assert (= (and b!114506 res!56328) b!114505))

(assert (= (and b!114506 res!56327) b!114507))

(assert (= (and b!114507 c!20452) b!114504))

(assert (= (and b!114507 (not c!20452)) b!114508))

(assert (= (or b!114504 b!114508) bm!12327))

(assert (=> b!114505 m!130331))

(assert (=> b!114505 m!130331))

(declare-fun m!130615 () Bool)

(assert (=> b!114505 m!130615))

(assert (=> bm!12327 m!130331))

(declare-fun m!130617 () Bool)

(assert (=> bm!12327 m!130617))

(assert (=> b!114506 m!130331))

(assert (=> b!114506 m!130331))

(declare-fun m!130619 () Bool)

(assert (=> b!114506 m!130619))

(assert (=> b!114507 m!130331))

(assert (=> b!114507 m!130331))

(assert (=> b!114507 m!130619))

(assert (=> b!114184 d!32331))

(declare-fun d!32333 () Bool)

(declare-fun e!74520 () Bool)

(assert (=> d!32333 e!74520))

(declare-fun res!56333 () Bool)

(assert (=> d!32333 (=> (not res!56333) (not e!74520))))

(declare-fun lt!59617 () ListLongMap!1581)

(assert (=> d!32333 (= res!56333 (contains!843 lt!59617 (_1!1235 lt!59387)))))

(declare-fun lt!59616 () List!1649)

(assert (=> d!32333 (= lt!59617 (ListLongMap!1582 lt!59616))))

(declare-fun lt!59618 () Unit!3562)

(declare-fun lt!59615 () Unit!3562)

(assert (=> d!32333 (= lt!59618 lt!59615)))

(assert (=> d!32333 (= (getValueByKey!159 lt!59616 (_1!1235 lt!59387)) (Some!164 (_2!1235 lt!59387)))))

(declare-fun lemmaContainsTupThenGetReturnValue!78 (List!1649 (_ BitVec 64) V!3289) Unit!3562)

(assert (=> d!32333 (= lt!59615 (lemmaContainsTupThenGetReturnValue!78 lt!59616 (_1!1235 lt!59387) (_2!1235 lt!59387)))))

(declare-fun insertStrictlySorted!81 (List!1649 (_ BitVec 64) V!3289) List!1649)

(assert (=> d!32333 (= lt!59616 (insertStrictlySorted!81 (toList!806 (+!150 lt!59392 lt!59394)) (_1!1235 lt!59387) (_2!1235 lt!59387)))))

(assert (=> d!32333 (= (+!150 (+!150 lt!59392 lt!59394) lt!59387) lt!59617)))

(declare-fun b!114513 () Bool)

(declare-fun res!56334 () Bool)

(assert (=> b!114513 (=> (not res!56334) (not e!74520))))

(assert (=> b!114513 (= res!56334 (= (getValueByKey!159 (toList!806 lt!59617) (_1!1235 lt!59387)) (Some!164 (_2!1235 lt!59387))))))

(declare-fun b!114514 () Bool)

(declare-fun contains!845 (List!1649 tuple2!2448) Bool)

(assert (=> b!114514 (= e!74520 (contains!845 (toList!806 lt!59617) lt!59387))))

(assert (= (and d!32333 res!56333) b!114513))

(assert (= (and b!114513 res!56334) b!114514))

(declare-fun m!130621 () Bool)

(assert (=> d!32333 m!130621))

(declare-fun m!130623 () Bool)

(assert (=> d!32333 m!130623))

(declare-fun m!130625 () Bool)

(assert (=> d!32333 m!130625))

(declare-fun m!130627 () Bool)

(assert (=> d!32333 m!130627))

(declare-fun m!130629 () Bool)

(assert (=> b!114513 m!130629))

(declare-fun m!130631 () Bool)

(assert (=> b!114514 m!130631))

(assert (=> b!114201 d!32333))

(declare-fun b!114539 () Bool)

(declare-fun res!56343 () Bool)

(declare-fun e!74537 () Bool)

(assert (=> b!114539 (=> (not res!56343) (not e!74537))))

(declare-fun lt!59639 () ListLongMap!1581)

(assert (=> b!114539 (= res!56343 (not (contains!843 lt!59639 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114540 () Bool)

(declare-fun e!74536 () ListLongMap!1581)

(assert (=> b!114540 (= e!74536 (ListLongMap!1582 Nil!1646))))

(declare-fun b!114541 () Bool)

(declare-fun e!74535 () ListLongMap!1581)

(declare-fun call!12333 () ListLongMap!1581)

(assert (=> b!114541 (= e!74535 call!12333)))

(declare-fun d!32335 () Bool)

(assert (=> d!32335 e!74537))

(declare-fun res!56346 () Bool)

(assert (=> d!32335 (=> (not res!56346) (not e!74537))))

(assert (=> d!32335 (= res!56346 (not (contains!843 lt!59639 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32335 (= lt!59639 e!74536)))

(declare-fun c!20462 () Bool)

(assert (=> d!32335 (= c!20462 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992))))))))

(assert (=> d!32335 (validMask!0 (mask!6877 (v!2980 (underlying!381 thiss!992))))))

(assert (=> d!32335 (= (getCurrentListMapNoExtraKeys!115 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (_values!2665 (v!2980 (underlying!381 thiss!992))) (mask!6877 (v!2980 (underlying!381 thiss!992))) (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) (minValue!2549 (v!2980 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992)))) lt!59639)))

(declare-fun bm!12330 () Bool)

(assert (=> bm!12330 (= call!12333 (getCurrentListMapNoExtraKeys!115 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (_values!2665 (v!2980 (underlying!381 thiss!992))) (mask!6877 (v!2980 (underlying!381 thiss!992))) (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) (minValue!2549 (v!2980 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun b!114542 () Bool)

(assert (=> b!114542 (= e!74536 e!74535)))

(declare-fun c!20463 () Bool)

(assert (=> b!114542 (= c!20463 (validKeyInArray!0 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!114543 () Bool)

(declare-fun lt!59638 () Unit!3562)

(declare-fun lt!59633 () Unit!3562)

(assert (=> b!114543 (= lt!59638 lt!59633)))

(declare-fun lt!59635 () (_ BitVec 64))

(declare-fun lt!59637 () V!3289)

(declare-fun lt!59636 () (_ BitVec 64))

(declare-fun lt!59634 () ListLongMap!1581)

(assert (=> b!114543 (not (contains!843 (+!150 lt!59634 (tuple2!2449 lt!59636 lt!59637)) lt!59635))))

(declare-fun addStillNotContains!52 (ListLongMap!1581 (_ BitVec 64) V!3289 (_ BitVec 64)) Unit!3562)

(assert (=> b!114543 (= lt!59633 (addStillNotContains!52 lt!59634 lt!59636 lt!59637 lt!59635))))

(assert (=> b!114543 (= lt!59635 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!114543 (= lt!59637 (get!1376 (select (arr!2105 (_values!2665 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!395 (defaultEntry!2682 (v!2980 (underlying!381 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114543 (= lt!59636 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!114543 (= lt!59634 call!12333)))

(assert (=> b!114543 (= e!74535 (+!150 call!12333 (tuple2!2449 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1376 (select (arr!2105 (_values!2665 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!395 (defaultEntry!2682 (v!2980 (underlying!381 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!114544 () Bool)

(declare-fun e!74539 () Bool)

(assert (=> b!114544 (= e!74537 e!74539)))

(declare-fun c!20464 () Bool)

(declare-fun e!74541 () Bool)

(assert (=> b!114544 (= c!20464 e!74541)))

(declare-fun res!56344 () Bool)

(assert (=> b!114544 (=> (not res!56344) (not e!74541))))

(assert (=> b!114544 (= res!56344 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992))))))))

(declare-fun b!114545 () Bool)

(declare-fun e!74540 () Bool)

(declare-fun isEmpty!389 (ListLongMap!1581) Bool)

(assert (=> b!114545 (= e!74540 (isEmpty!389 lt!59639))))

(declare-fun b!114546 () Bool)

(assert (=> b!114546 (= e!74540 (= lt!59639 (getCurrentListMapNoExtraKeys!115 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (_values!2665 (v!2980 (underlying!381 thiss!992))) (mask!6877 (v!2980 (underlying!381 thiss!992))) (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) (minValue!2549 (v!2980 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992))))))))

(declare-fun b!114547 () Bool)

(assert (=> b!114547 (= e!74541 (validKeyInArray!0 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!114547 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!114548 () Bool)

(assert (=> b!114548 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992))))))))

(assert (=> b!114548 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2366 (_values!2665 (v!2980 (underlying!381 thiss!992))))))))

(declare-fun e!74538 () Bool)

(declare-fun apply!103 (ListLongMap!1581 (_ BitVec 64)) V!3289)

(assert (=> b!114548 (= e!74538 (= (apply!103 lt!59639 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1376 (select (arr!2105 (_values!2665 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!395 (defaultEntry!2682 (v!2980 (underlying!381 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!114549 () Bool)

(assert (=> b!114549 (= e!74539 e!74540)))

(declare-fun c!20461 () Bool)

(assert (=> b!114549 (= c!20461 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992))))))))

(declare-fun b!114550 () Bool)

(assert (=> b!114550 (= e!74539 e!74538)))

(assert (=> b!114550 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992))))))))

(declare-fun res!56345 () Bool)

(assert (=> b!114550 (= res!56345 (contains!843 lt!59639 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!114550 (=> (not res!56345) (not e!74538))))

(assert (= (and d!32335 c!20462) b!114540))

(assert (= (and d!32335 (not c!20462)) b!114542))

(assert (= (and b!114542 c!20463) b!114543))

(assert (= (and b!114542 (not c!20463)) b!114541))

(assert (= (or b!114543 b!114541) bm!12330))

(assert (= (and d!32335 res!56346) b!114539))

(assert (= (and b!114539 res!56343) b!114544))

(assert (= (and b!114544 res!56344) b!114547))

(assert (= (and b!114544 c!20464) b!114550))

(assert (= (and b!114544 (not c!20464)) b!114549))

(assert (= (and b!114550 res!56345) b!114548))

(assert (= (and b!114549 c!20461) b!114546))

(assert (= (and b!114549 (not c!20461)) b!114545))

(declare-fun b_lambda!5109 () Bool)

(assert (=> (not b_lambda!5109) (not b!114543)))

(assert (=> b!114543 t!5862))

(declare-fun b_and!7061 () Bool)

(assert (= b_and!7041 (and (=> t!5862 result!3643) b_and!7061)))

(assert (=> b!114543 t!5864))

(declare-fun b_and!7063 () Bool)

(assert (= b_and!7043 (and (=> t!5864 result!3647) b_and!7063)))

(declare-fun b_lambda!5111 () Bool)

(assert (=> (not b_lambda!5111) (not b!114548)))

(assert (=> b!114548 t!5862))

(declare-fun b_and!7065 () Bool)

(assert (= b_and!7061 (and (=> t!5862 result!3643) b_and!7065)))

(assert (=> b!114548 t!5864))

(declare-fun b_and!7067 () Bool)

(assert (= b_and!7063 (and (=> t!5864 result!3647) b_and!7067)))

(declare-fun m!130633 () Bool)

(assert (=> b!114546 m!130633))

(assert (=> b!114550 m!130607))

(assert (=> b!114550 m!130607))

(declare-fun m!130635 () Bool)

(assert (=> b!114550 m!130635))

(assert (=> bm!12330 m!130633))

(declare-fun m!130637 () Bool)

(assert (=> d!32335 m!130637))

(assert (=> d!32335 m!130613))

(assert (=> b!114547 m!130607))

(assert (=> b!114547 m!130607))

(declare-fun m!130639 () Bool)

(assert (=> b!114547 m!130639))

(assert (=> b!114542 m!130607))

(assert (=> b!114542 m!130607))

(assert (=> b!114542 m!130639))

(declare-fun m!130641 () Bool)

(assert (=> b!114539 m!130641))

(declare-fun m!130643 () Bool)

(assert (=> b!114545 m!130643))

(assert (=> b!114548 m!130607))

(declare-fun m!130645 () Bool)

(assert (=> b!114548 m!130645))

(assert (=> b!114548 m!130361))

(declare-fun m!130647 () Bool)

(assert (=> b!114548 m!130647))

(assert (=> b!114548 m!130361))

(assert (=> b!114548 m!130607))

(declare-fun m!130649 () Bool)

(assert (=> b!114548 m!130649))

(assert (=> b!114548 m!130645))

(declare-fun m!130651 () Bool)

(assert (=> b!114543 m!130651))

(declare-fun m!130653 () Bool)

(assert (=> b!114543 m!130653))

(assert (=> b!114543 m!130607))

(declare-fun m!130655 () Bool)

(assert (=> b!114543 m!130655))

(assert (=> b!114543 m!130645))

(assert (=> b!114543 m!130361))

(assert (=> b!114543 m!130647))

(assert (=> b!114543 m!130361))

(declare-fun m!130657 () Bool)

(assert (=> b!114543 m!130657))

(assert (=> b!114543 m!130645))

(assert (=> b!114543 m!130651))

(assert (=> b!114201 d!32335))

(declare-fun d!32337 () Bool)

(assert (=> d!32337 (= (+!150 (+!150 lt!59392 (tuple2!2449 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393)) (tuple2!2449 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2980 (underlying!381 thiss!992))))) (+!150 (+!150 lt!59392 (tuple2!2449 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2980 (underlying!381 thiss!992))))) (tuple2!2449 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393)))))

(declare-fun lt!59642 () Unit!3562)

(declare-fun choose!731 (ListLongMap!1581 (_ BitVec 64) V!3289 (_ BitVec 64) V!3289) Unit!3562)

(assert (=> d!32337 (= lt!59642 (choose!731 lt!59392 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2980 (underlying!381 thiss!992)))))))

(assert (=> d!32337 (not (= (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32337 (= (addCommutativeForDiffKeys!62 lt!59392 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2980 (underlying!381 thiss!992)))) lt!59642)))

(declare-fun bs!4669 () Bool)

(assert (= bs!4669 d!32337))

(declare-fun m!130659 () Bool)

(assert (=> bs!4669 m!130659))

(assert (=> bs!4669 m!130659))

(declare-fun m!130661 () Bool)

(assert (=> bs!4669 m!130661))

(declare-fun m!130663 () Bool)

(assert (=> bs!4669 m!130663))

(assert (=> bs!4669 m!130663))

(declare-fun m!130665 () Bool)

(assert (=> bs!4669 m!130665))

(assert (=> bs!4669 m!130331))

(declare-fun m!130667 () Bool)

(assert (=> bs!4669 m!130667))

(assert (=> b!114201 d!32337))

(declare-fun d!32339 () Bool)

(declare-fun e!74542 () Bool)

(assert (=> d!32339 e!74542))

(declare-fun res!56347 () Bool)

(assert (=> d!32339 (=> (not res!56347) (not e!74542))))

(declare-fun lt!59645 () ListLongMap!1581)

(assert (=> d!32339 (= res!56347 (contains!843 lt!59645 (_1!1235 lt!59387)))))

(declare-fun lt!59644 () List!1649)

(assert (=> d!32339 (= lt!59645 (ListLongMap!1582 lt!59644))))

(declare-fun lt!59646 () Unit!3562)

(declare-fun lt!59643 () Unit!3562)

(assert (=> d!32339 (= lt!59646 lt!59643)))

(assert (=> d!32339 (= (getValueByKey!159 lt!59644 (_1!1235 lt!59387)) (Some!164 (_2!1235 lt!59387)))))

(assert (=> d!32339 (= lt!59643 (lemmaContainsTupThenGetReturnValue!78 lt!59644 (_1!1235 lt!59387) (_2!1235 lt!59387)))))

(assert (=> d!32339 (= lt!59644 (insertStrictlySorted!81 (toList!806 lt!59381) (_1!1235 lt!59387) (_2!1235 lt!59387)))))

(assert (=> d!32339 (= (+!150 lt!59381 lt!59387) lt!59645)))

(declare-fun b!114551 () Bool)

(declare-fun res!56348 () Bool)

(assert (=> b!114551 (=> (not res!56348) (not e!74542))))

(assert (=> b!114551 (= res!56348 (= (getValueByKey!159 (toList!806 lt!59645) (_1!1235 lt!59387)) (Some!164 (_2!1235 lt!59387))))))

(declare-fun b!114552 () Bool)

(assert (=> b!114552 (= e!74542 (contains!845 (toList!806 lt!59645) lt!59387))))

(assert (= (and d!32339 res!56347) b!114551))

(assert (= (and b!114551 res!56348) b!114552))

(declare-fun m!130669 () Bool)

(assert (=> d!32339 m!130669))

(declare-fun m!130671 () Bool)

(assert (=> d!32339 m!130671))

(declare-fun m!130673 () Bool)

(assert (=> d!32339 m!130673))

(declare-fun m!130675 () Bool)

(assert (=> d!32339 m!130675))

(declare-fun m!130677 () Bool)

(assert (=> b!114551 m!130677))

(declare-fun m!130679 () Bool)

(assert (=> b!114552 m!130679))

(assert (=> b!114201 d!32339))

(declare-fun d!32341 () Bool)

(declare-fun e!74543 () Bool)

(assert (=> d!32341 e!74543))

(declare-fun res!56349 () Bool)

(assert (=> d!32341 (=> (not res!56349) (not e!74543))))

(declare-fun lt!59649 () ListLongMap!1581)

(assert (=> d!32341 (= res!56349 (contains!843 lt!59649 (_1!1235 lt!59394)))))

(declare-fun lt!59648 () List!1649)

(assert (=> d!32341 (= lt!59649 (ListLongMap!1582 lt!59648))))

(declare-fun lt!59650 () Unit!3562)

(declare-fun lt!59647 () Unit!3562)

(assert (=> d!32341 (= lt!59650 lt!59647)))

(assert (=> d!32341 (= (getValueByKey!159 lt!59648 (_1!1235 lt!59394)) (Some!164 (_2!1235 lt!59394)))))

(assert (=> d!32341 (= lt!59647 (lemmaContainsTupThenGetReturnValue!78 lt!59648 (_1!1235 lt!59394) (_2!1235 lt!59394)))))

(assert (=> d!32341 (= lt!59648 (insertStrictlySorted!81 (toList!806 lt!59395) (_1!1235 lt!59394) (_2!1235 lt!59394)))))

(assert (=> d!32341 (= (+!150 lt!59395 lt!59394) lt!59649)))

(declare-fun b!114553 () Bool)

(declare-fun res!56350 () Bool)

(assert (=> b!114553 (=> (not res!56350) (not e!74543))))

(assert (=> b!114553 (= res!56350 (= (getValueByKey!159 (toList!806 lt!59649) (_1!1235 lt!59394)) (Some!164 (_2!1235 lt!59394))))))

(declare-fun b!114554 () Bool)

(assert (=> b!114554 (= e!74543 (contains!845 (toList!806 lt!59649) lt!59394))))

(assert (= (and d!32341 res!56349) b!114553))

(assert (= (and b!114553 res!56350) b!114554))

(declare-fun m!130681 () Bool)

(assert (=> d!32341 m!130681))

(declare-fun m!130683 () Bool)

(assert (=> d!32341 m!130683))

(declare-fun m!130685 () Bool)

(assert (=> d!32341 m!130685))

(declare-fun m!130687 () Bool)

(assert (=> d!32341 m!130687))

(declare-fun m!130689 () Bool)

(assert (=> b!114553 m!130689))

(declare-fun m!130691 () Bool)

(assert (=> b!114554 m!130691))

(assert (=> b!114201 d!32341))

(declare-fun d!32343 () Bool)

(declare-fun e!74544 () Bool)

(assert (=> d!32343 e!74544))

(declare-fun res!56351 () Bool)

(assert (=> d!32343 (=> (not res!56351) (not e!74544))))

(declare-fun lt!59653 () ListLongMap!1581)

(assert (=> d!32343 (= res!56351 (contains!843 lt!59653 (_1!1235 lt!59390)))))

(declare-fun lt!59652 () List!1649)

(assert (=> d!32343 (= lt!59653 (ListLongMap!1582 lt!59652))))

(declare-fun lt!59654 () Unit!3562)

(declare-fun lt!59651 () Unit!3562)

(assert (=> d!32343 (= lt!59654 lt!59651)))

(assert (=> d!32343 (= (getValueByKey!159 lt!59652 (_1!1235 lt!59390)) (Some!164 (_2!1235 lt!59390)))))

(assert (=> d!32343 (= lt!59651 (lemmaContainsTupThenGetReturnValue!78 lt!59652 (_1!1235 lt!59390) (_2!1235 lt!59390)))))

(assert (=> d!32343 (= lt!59652 (insertStrictlySorted!81 (toList!806 lt!59388) (_1!1235 lt!59390) (_2!1235 lt!59390)))))

(assert (=> d!32343 (= (+!150 lt!59388 lt!59390) lt!59653)))

(declare-fun b!114555 () Bool)

(declare-fun res!56352 () Bool)

(assert (=> b!114555 (=> (not res!56352) (not e!74544))))

(assert (=> b!114555 (= res!56352 (= (getValueByKey!159 (toList!806 lt!59653) (_1!1235 lt!59390)) (Some!164 (_2!1235 lt!59390))))))

(declare-fun b!114556 () Bool)

(assert (=> b!114556 (= e!74544 (contains!845 (toList!806 lt!59653) lt!59390))))

(assert (= (and d!32343 res!56351) b!114555))

(assert (= (and b!114555 res!56352) b!114556))

(declare-fun m!130693 () Bool)

(assert (=> d!32343 m!130693))

(declare-fun m!130695 () Bool)

(assert (=> d!32343 m!130695))

(declare-fun m!130697 () Bool)

(assert (=> d!32343 m!130697))

(declare-fun m!130699 () Bool)

(assert (=> d!32343 m!130699))

(declare-fun m!130701 () Bool)

(assert (=> b!114555 m!130701))

(declare-fun m!130703 () Bool)

(assert (=> b!114556 m!130703))

(assert (=> b!114201 d!32343))

(declare-fun d!32345 () Bool)

(declare-fun e!74545 () Bool)

(assert (=> d!32345 e!74545))

(declare-fun res!56353 () Bool)

(assert (=> d!32345 (=> (not res!56353) (not e!74545))))

(declare-fun lt!59657 () ListLongMap!1581)

(assert (=> d!32345 (= res!56353 (contains!843 lt!59657 (_1!1235 lt!59387)))))

(declare-fun lt!59656 () List!1649)

(assert (=> d!32345 (= lt!59657 (ListLongMap!1582 lt!59656))))

(declare-fun lt!59658 () Unit!3562)

(declare-fun lt!59655 () Unit!3562)

(assert (=> d!32345 (= lt!59658 lt!59655)))

(assert (=> d!32345 (= (getValueByKey!159 lt!59656 (_1!1235 lt!59387)) (Some!164 (_2!1235 lt!59387)))))

(assert (=> d!32345 (= lt!59655 (lemmaContainsTupThenGetReturnValue!78 lt!59656 (_1!1235 lt!59387) (_2!1235 lt!59387)))))

(assert (=> d!32345 (= lt!59656 (insertStrictlySorted!81 (toList!806 lt!59392) (_1!1235 lt!59387) (_2!1235 lt!59387)))))

(assert (=> d!32345 (= (+!150 lt!59392 lt!59387) lt!59657)))

(declare-fun b!114557 () Bool)

(declare-fun res!56354 () Bool)

(assert (=> b!114557 (=> (not res!56354) (not e!74545))))

(assert (=> b!114557 (= res!56354 (= (getValueByKey!159 (toList!806 lt!59657) (_1!1235 lt!59387)) (Some!164 (_2!1235 lt!59387))))))

(declare-fun b!114558 () Bool)

(assert (=> b!114558 (= e!74545 (contains!845 (toList!806 lt!59657) lt!59387))))

(assert (= (and d!32345 res!56353) b!114557))

(assert (= (and b!114557 res!56354) b!114558))

(declare-fun m!130705 () Bool)

(assert (=> d!32345 m!130705))

(declare-fun m!130707 () Bool)

(assert (=> d!32345 m!130707))

(declare-fun m!130709 () Bool)

(assert (=> d!32345 m!130709))

(declare-fun m!130711 () Bool)

(assert (=> d!32345 m!130711))

(declare-fun m!130713 () Bool)

(assert (=> b!114557 m!130713))

(declare-fun m!130715 () Bool)

(assert (=> b!114558 m!130715))

(assert (=> b!114201 d!32345))

(declare-fun d!32347 () Bool)

(declare-fun res!56355 () Bool)

(declare-fun e!74546 () Bool)

(assert (=> d!32347 (=> (not res!56355) (not e!74546))))

(assert (=> d!32347 (= res!56355 (simpleValid!79 (_2!1234 lt!59382)))))

(assert (=> d!32347 (= (valid!449 (_2!1234 lt!59382)) e!74546)))

(declare-fun b!114559 () Bool)

(declare-fun res!56356 () Bool)

(assert (=> b!114559 (=> (not res!56356) (not e!74546))))

(assert (=> b!114559 (= res!56356 (= (arrayCountValidKeys!0 (_keys!4403 (_2!1234 lt!59382)) #b00000000000000000000000000000000 (size!2365 (_keys!4403 (_2!1234 lt!59382)))) (_size!525 (_2!1234 lt!59382))))))

(declare-fun b!114560 () Bool)

(declare-fun res!56357 () Bool)

(assert (=> b!114560 (=> (not res!56357) (not e!74546))))

(assert (=> b!114560 (= res!56357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4403 (_2!1234 lt!59382)) (mask!6877 (_2!1234 lt!59382))))))

(declare-fun b!114561 () Bool)

(assert (=> b!114561 (= e!74546 (arrayNoDuplicates!0 (_keys!4403 (_2!1234 lt!59382)) #b00000000000000000000000000000000 Nil!1645))))

(assert (= (and d!32347 res!56355) b!114559))

(assert (= (and b!114559 res!56356) b!114560))

(assert (= (and b!114560 res!56357) b!114561))

(declare-fun m!130717 () Bool)

(assert (=> d!32347 m!130717))

(declare-fun m!130719 () Bool)

(assert (=> b!114559 m!130719))

(declare-fun m!130721 () Bool)

(assert (=> b!114560 m!130721))

(declare-fun m!130723 () Bool)

(assert (=> b!114561 m!130723))

(assert (=> b!114201 d!32347))

(declare-fun d!32349 () Bool)

(declare-fun e!74547 () Bool)

(assert (=> d!32349 e!74547))

(declare-fun res!56358 () Bool)

(assert (=> d!32349 (=> (not res!56358) (not e!74547))))

(declare-fun lt!59661 () ListLongMap!1581)

(assert (=> d!32349 (= res!56358 (contains!843 lt!59661 (_1!1235 lt!59394)))))

(declare-fun lt!59660 () List!1649)

(assert (=> d!32349 (= lt!59661 (ListLongMap!1582 lt!59660))))

(declare-fun lt!59662 () Unit!3562)

(declare-fun lt!59659 () Unit!3562)

(assert (=> d!32349 (= lt!59662 lt!59659)))

(assert (=> d!32349 (= (getValueByKey!159 lt!59660 (_1!1235 lt!59394)) (Some!164 (_2!1235 lt!59394)))))

(assert (=> d!32349 (= lt!59659 (lemmaContainsTupThenGetReturnValue!78 lt!59660 (_1!1235 lt!59394) (_2!1235 lt!59394)))))

(assert (=> d!32349 (= lt!59660 (insertStrictlySorted!81 (toList!806 lt!59392) (_1!1235 lt!59394) (_2!1235 lt!59394)))))

(assert (=> d!32349 (= (+!150 lt!59392 lt!59394) lt!59661)))

(declare-fun b!114562 () Bool)

(declare-fun res!56359 () Bool)

(assert (=> b!114562 (=> (not res!56359) (not e!74547))))

(assert (=> b!114562 (= res!56359 (= (getValueByKey!159 (toList!806 lt!59661) (_1!1235 lt!59394)) (Some!164 (_2!1235 lt!59394))))))

(declare-fun b!114563 () Bool)

(assert (=> b!114563 (= e!74547 (contains!845 (toList!806 lt!59661) lt!59394))))

(assert (= (and d!32349 res!56358) b!114562))

(assert (= (and b!114562 res!56359) b!114563))

(declare-fun m!130725 () Bool)

(assert (=> d!32349 m!130725))

(declare-fun m!130727 () Bool)

(assert (=> d!32349 m!130727))

(declare-fun m!130729 () Bool)

(assert (=> d!32349 m!130729))

(declare-fun m!130731 () Bool)

(assert (=> d!32349 m!130731))

(declare-fun m!130733 () Bool)

(assert (=> b!114562 m!130733))

(declare-fun m!130735 () Bool)

(assert (=> b!114563 m!130735))

(assert (=> b!114201 d!32349))

(declare-fun d!32351 () Bool)

(declare-fun e!74548 () Bool)

(assert (=> d!32351 e!74548))

(declare-fun res!56360 () Bool)

(assert (=> d!32351 (=> (not res!56360) (not e!74548))))

(declare-fun lt!59665 () ListLongMap!1581)

(assert (=> d!32351 (= res!56360 (contains!843 lt!59665 (_1!1235 lt!59390)))))

(declare-fun lt!59664 () List!1649)

(assert (=> d!32351 (= lt!59665 (ListLongMap!1582 lt!59664))))

(declare-fun lt!59666 () Unit!3562)

(declare-fun lt!59663 () Unit!3562)

(assert (=> d!32351 (= lt!59666 lt!59663)))

(assert (=> d!32351 (= (getValueByKey!159 lt!59664 (_1!1235 lt!59390)) (Some!164 (_2!1235 lt!59390)))))

(assert (=> d!32351 (= lt!59663 (lemmaContainsTupThenGetReturnValue!78 lt!59664 (_1!1235 lt!59390) (_2!1235 lt!59390)))))

(assert (=> d!32351 (= lt!59664 (insertStrictlySorted!81 (toList!806 lt!59381) (_1!1235 lt!59390) (_2!1235 lt!59390)))))

(assert (=> d!32351 (= (+!150 lt!59381 lt!59390) lt!59665)))

(declare-fun b!114564 () Bool)

(declare-fun res!56361 () Bool)

(assert (=> b!114564 (=> (not res!56361) (not e!74548))))

(assert (=> b!114564 (= res!56361 (= (getValueByKey!159 (toList!806 lt!59665) (_1!1235 lt!59390)) (Some!164 (_2!1235 lt!59390))))))

(declare-fun b!114565 () Bool)

(assert (=> b!114565 (= e!74548 (contains!845 (toList!806 lt!59665) lt!59390))))

(assert (= (and d!32351 res!56360) b!114564))

(assert (= (and b!114564 res!56361) b!114565))

(declare-fun m!130737 () Bool)

(assert (=> d!32351 m!130737))

(declare-fun m!130739 () Bool)

(assert (=> d!32351 m!130739))

(declare-fun m!130741 () Bool)

(assert (=> d!32351 m!130741))

(declare-fun m!130743 () Bool)

(assert (=> d!32351 m!130743))

(declare-fun m!130745 () Bool)

(assert (=> b!114564 m!130745))

(declare-fun m!130747 () Bool)

(assert (=> b!114565 m!130747))

(assert (=> b!114201 d!32351))

(declare-fun d!32353 () Bool)

(assert (=> d!32353 (= (+!150 (+!150 lt!59381 (tuple2!2449 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393)) (tuple2!2449 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2549 (v!2980 (underlying!381 thiss!992))))) (+!150 (+!150 lt!59381 (tuple2!2449 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2549 (v!2980 (underlying!381 thiss!992))))) (tuple2!2449 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393)))))

(declare-fun lt!59667 () Unit!3562)

(assert (=> d!32353 (= lt!59667 (choose!731 lt!59381 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2549 (v!2980 (underlying!381 thiss!992)))))))

(assert (=> d!32353 (not (= (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32353 (= (addCommutativeForDiffKeys!62 lt!59381 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) from!355) lt!59393 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2549 (v!2980 (underlying!381 thiss!992)))) lt!59667)))

(declare-fun bs!4670 () Bool)

(assert (= bs!4670 d!32353))

(declare-fun m!130749 () Bool)

(assert (=> bs!4670 m!130749))

(assert (=> bs!4670 m!130749))

(declare-fun m!130751 () Bool)

(assert (=> bs!4670 m!130751))

(declare-fun m!130753 () Bool)

(assert (=> bs!4670 m!130753))

(assert (=> bs!4670 m!130753))

(declare-fun m!130755 () Bool)

(assert (=> bs!4670 m!130755))

(assert (=> bs!4670 m!130331))

(declare-fun m!130757 () Bool)

(assert (=> bs!4670 m!130757))

(assert (=> b!114201 d!32353))

(declare-fun d!32355 () Bool)

(assert (=> d!32355 (= (valid!450 thiss!992) (valid!449 (v!2980 (underlying!381 thiss!992))))))

(declare-fun bs!4671 () Bool)

(assert (= bs!4671 d!32355))

(assert (=> bs!4671 m!130325))

(assert (=> start!13080 d!32355))

(declare-fun d!32357 () Bool)

(assert (=> d!32357 (= (map!1303 newMap!16) (getCurrentListMap!479 (_keys!4403 newMap!16) (_values!2665 newMap!16) (mask!6877 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2682 newMap!16)))))

(declare-fun bs!4672 () Bool)

(assert (= bs!4672 d!32357))

(assert (=> bs!4672 m!130533))

(assert (=> b!114200 d!32357))

(declare-fun bm!12345 () Bool)

(declare-fun call!12348 () ListLongMap!1581)

(assert (=> bm!12345 (= call!12348 (getCurrentListMapNoExtraKeys!115 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (_values!2665 (v!2980 (underlying!381 thiss!992))) (mask!6877 (v!2980 (underlying!381 thiss!992))) (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) (minValue!2549 (v!2980 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun b!114608 () Bool)

(declare-fun e!74581 () Unit!3562)

(declare-fun lt!59714 () Unit!3562)

(assert (=> b!114608 (= e!74581 lt!59714)))

(declare-fun lt!59732 () ListLongMap!1581)

(assert (=> b!114608 (= lt!59732 (getCurrentListMapNoExtraKeys!115 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (_values!2665 (v!2980 (underlying!381 thiss!992))) (mask!6877 (v!2980 (underlying!381 thiss!992))) (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) (minValue!2549 (v!2980 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun lt!59724 () (_ BitVec 64))

(assert (=> b!114608 (= lt!59724 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59729 () (_ BitVec 64))

(assert (=> b!114608 (= lt!59729 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!59723 () Unit!3562)

(declare-fun addStillContains!79 (ListLongMap!1581 (_ BitVec 64) V!3289 (_ BitVec 64)) Unit!3562)

(assert (=> b!114608 (= lt!59723 (addStillContains!79 lt!59732 lt!59724 (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) lt!59729))))

(assert (=> b!114608 (contains!843 (+!150 lt!59732 (tuple2!2449 lt!59724 (zeroValue!2549 (v!2980 (underlying!381 thiss!992))))) lt!59729)))

(declare-fun lt!59720 () Unit!3562)

(assert (=> b!114608 (= lt!59720 lt!59723)))

(declare-fun lt!59727 () ListLongMap!1581)

(assert (=> b!114608 (= lt!59727 (getCurrentListMapNoExtraKeys!115 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (_values!2665 (v!2980 (underlying!381 thiss!992))) (mask!6877 (v!2980 (underlying!381 thiss!992))) (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) (minValue!2549 (v!2980 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun lt!59725 () (_ BitVec 64))

(assert (=> b!114608 (= lt!59725 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59728 () (_ BitVec 64))

(assert (=> b!114608 (= lt!59728 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!59713 () Unit!3562)

(declare-fun addApplyDifferent!79 (ListLongMap!1581 (_ BitVec 64) V!3289 (_ BitVec 64)) Unit!3562)

(assert (=> b!114608 (= lt!59713 (addApplyDifferent!79 lt!59727 lt!59725 (minValue!2549 (v!2980 (underlying!381 thiss!992))) lt!59728))))

(assert (=> b!114608 (= (apply!103 (+!150 lt!59727 (tuple2!2449 lt!59725 (minValue!2549 (v!2980 (underlying!381 thiss!992))))) lt!59728) (apply!103 lt!59727 lt!59728))))

(declare-fun lt!59726 () Unit!3562)

(assert (=> b!114608 (= lt!59726 lt!59713)))

(declare-fun lt!59712 () ListLongMap!1581)

(assert (=> b!114608 (= lt!59712 (getCurrentListMapNoExtraKeys!115 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (_values!2665 (v!2980 (underlying!381 thiss!992))) (mask!6877 (v!2980 (underlying!381 thiss!992))) (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) (minValue!2549 (v!2980 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun lt!59715 () (_ BitVec 64))

(assert (=> b!114608 (= lt!59715 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59716 () (_ BitVec 64))

(assert (=> b!114608 (= lt!59716 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!59719 () Unit!3562)

(assert (=> b!114608 (= lt!59719 (addApplyDifferent!79 lt!59712 lt!59715 (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) lt!59716))))

(assert (=> b!114608 (= (apply!103 (+!150 lt!59712 (tuple2!2449 lt!59715 (zeroValue!2549 (v!2980 (underlying!381 thiss!992))))) lt!59716) (apply!103 lt!59712 lt!59716))))

(declare-fun lt!59721 () Unit!3562)

(assert (=> b!114608 (= lt!59721 lt!59719)))

(declare-fun lt!59722 () ListLongMap!1581)

(assert (=> b!114608 (= lt!59722 (getCurrentListMapNoExtraKeys!115 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (_values!2665 (v!2980 (underlying!381 thiss!992))) (mask!6877 (v!2980 (underlying!381 thiss!992))) (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) (minValue!2549 (v!2980 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun lt!59717 () (_ BitVec 64))

(assert (=> b!114608 (= lt!59717 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59733 () (_ BitVec 64))

(assert (=> b!114608 (= lt!59733 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!114608 (= lt!59714 (addApplyDifferent!79 lt!59722 lt!59717 (minValue!2549 (v!2980 (underlying!381 thiss!992))) lt!59733))))

(assert (=> b!114608 (= (apply!103 (+!150 lt!59722 (tuple2!2449 lt!59717 (minValue!2549 (v!2980 (underlying!381 thiss!992))))) lt!59733) (apply!103 lt!59722 lt!59733))))

(declare-fun b!114609 () Bool)

(declare-fun Unit!3569 () Unit!3562)

(assert (=> b!114609 (= e!74581 Unit!3569)))

(declare-fun b!114610 () Bool)

(declare-fun e!74586 () Bool)

(declare-fun call!12349 () Bool)

(assert (=> b!114610 (= e!74586 (not call!12349))))

(declare-fun b!114611 () Bool)

(declare-fun e!74584 () ListLongMap!1581)

(declare-fun call!12350 () ListLongMap!1581)

(assert (=> b!114611 (= e!74584 call!12350)))

(declare-fun lt!59730 () ListLongMap!1581)

(declare-fun b!114612 () Bool)

(declare-fun e!74576 () Bool)

(assert (=> b!114612 (= e!74576 (= (apply!103 lt!59730 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1376 (select (arr!2105 (_values!2665 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!395 (defaultEntry!2682 (v!2980 (underlying!381 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!114612 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2366 (_values!2665 (v!2980 (underlying!381 thiss!992))))))))

(assert (=> b!114612 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992))))))))

(declare-fun b!114613 () Bool)

(declare-fun e!74578 () ListLongMap!1581)

(assert (=> b!114613 (= e!74578 call!12350)))

(declare-fun b!114614 () Bool)

(declare-fun e!74582 () Bool)

(assert (=> b!114614 (= e!74582 (validKeyInArray!0 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!114615 () Bool)

(declare-fun e!74580 () Bool)

(declare-fun call!12352 () Bool)

(assert (=> b!114615 (= e!74580 (not call!12352))))

(declare-fun b!114616 () Bool)

(declare-fun e!74579 () Bool)

(assert (=> b!114616 (= e!74579 (= (apply!103 lt!59730 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2549 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun bm!12346 () Bool)

(assert (=> bm!12346 (= call!12349 (contains!843 lt!59730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!114617 () Bool)

(declare-fun res!56383 () Bool)

(declare-fun e!74585 () Bool)

(assert (=> b!114617 (=> (not res!56383) (not e!74585))))

(assert (=> b!114617 (= res!56383 e!74586)))

(declare-fun c!20477 () Bool)

(assert (=> b!114617 (= c!20477 (not (= (bvand (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!114618 () Bool)

(declare-fun e!74577 () Bool)

(assert (=> b!114618 (= e!74577 e!74576)))

(declare-fun res!56382 () Bool)

(assert (=> b!114618 (=> (not res!56382) (not e!74576))))

(assert (=> b!114618 (= res!56382 (contains!843 lt!59730 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!114618 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992))))))))

(declare-fun b!114619 () Bool)

(declare-fun res!56380 () Bool)

(assert (=> b!114619 (=> (not res!56380) (not e!74585))))

(assert (=> b!114619 (= res!56380 e!74577)))

(declare-fun res!56381 () Bool)

(assert (=> b!114619 (=> res!56381 e!74577)))

(declare-fun e!74583 () Bool)

(assert (=> b!114619 (= res!56381 (not e!74583))))

(declare-fun res!56388 () Bool)

(assert (=> b!114619 (=> (not res!56388) (not e!74583))))

(assert (=> b!114619 (= res!56388 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992))))))))

(declare-fun b!114620 () Bool)

(declare-fun e!74575 () ListLongMap!1581)

(assert (=> b!114620 (= e!74575 e!74578)))

(declare-fun c!20482 () Bool)

(assert (=> b!114620 (= c!20482 (and (not (= (bvand (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!114621 () Bool)

(declare-fun call!12353 () ListLongMap!1581)

(assert (=> b!114621 (= e!74575 (+!150 call!12353 (tuple2!2449 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2980 (underlying!381 thiss!992))))))))

(declare-fun bm!12347 () Bool)

(assert (=> bm!12347 (= call!12350 call!12353)))

(declare-fun bm!12348 () Bool)

(declare-fun call!12351 () ListLongMap!1581)

(assert (=> bm!12348 (= call!12351 call!12348)))

(declare-fun c!20480 () Bool)

(declare-fun bm!12349 () Bool)

(declare-fun call!12354 () ListLongMap!1581)

(assert (=> bm!12349 (= call!12353 (+!150 (ite c!20480 call!12348 (ite c!20482 call!12351 call!12354)) (ite (or c!20480 c!20482) (tuple2!2449 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2549 (v!2980 (underlying!381 thiss!992)))) (tuple2!2449 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2980 (underlying!381 thiss!992)))))))))

(declare-fun bm!12350 () Bool)

(assert (=> bm!12350 (= call!12354 call!12351)))

(declare-fun d!32359 () Bool)

(assert (=> d!32359 e!74585))

(declare-fun res!56387 () Bool)

(assert (=> d!32359 (=> (not res!56387) (not e!74585))))

(assert (=> d!32359 (= res!56387 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992))))))))))

(declare-fun lt!59731 () ListLongMap!1581)

(assert (=> d!32359 (= lt!59730 lt!59731)))

(declare-fun lt!59718 () Unit!3562)

(assert (=> d!32359 (= lt!59718 e!74581)))

(declare-fun c!20479 () Bool)

(assert (=> d!32359 (= c!20479 e!74582)))

(declare-fun res!56384 () Bool)

(assert (=> d!32359 (=> (not res!56384) (not e!74582))))

(assert (=> d!32359 (= res!56384 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2365 (_keys!4403 (v!2980 (underlying!381 thiss!992))))))))

(assert (=> d!32359 (= lt!59731 e!74575)))

(assert (=> d!32359 (= c!20480 (and (not (= (bvand (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32359 (validMask!0 (mask!6877 (v!2980 (underlying!381 thiss!992))))))

(assert (=> d!32359 (= (getCurrentListMap!479 (_keys!4403 (v!2980 (underlying!381 thiss!992))) (_values!2665 (v!2980 (underlying!381 thiss!992))) (mask!6877 (v!2980 (underlying!381 thiss!992))) (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) (zeroValue!2549 (v!2980 (underlying!381 thiss!992))) (minValue!2549 (v!2980 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992)))) lt!59730)))

(declare-fun bm!12351 () Bool)

(assert (=> bm!12351 (= call!12352 (contains!843 lt!59730 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!114622 () Bool)

(assert (=> b!114622 (= e!74583 (validKeyInArray!0 (select (arr!2104 (_keys!4403 (v!2980 (underlying!381 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!114623 () Bool)

(assert (=> b!114623 (= e!74584 call!12354)))

(declare-fun b!114624 () Bool)

(declare-fun e!74587 () Bool)

(assert (=> b!114624 (= e!74580 e!74587)))

(declare-fun res!56385 () Bool)

(assert (=> b!114624 (= res!56385 call!12352)))

(assert (=> b!114624 (=> (not res!56385) (not e!74587))))

(declare-fun b!114625 () Bool)

(assert (=> b!114625 (= e!74585 e!74580)))

(declare-fun c!20478 () Bool)

(assert (=> b!114625 (= c!20478 (not (= (bvand (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!114626 () Bool)

(assert (=> b!114626 (= e!74586 e!74579)))

(declare-fun res!56386 () Bool)

(assert (=> b!114626 (= res!56386 call!12349)))

(assert (=> b!114626 (=> (not res!56386) (not e!74579))))

(declare-fun b!114627 () Bool)

(assert (=> b!114627 (= e!74587 (= (apply!103 lt!59730 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2549 (v!2980 (underlying!381 thiss!992)))))))

(declare-fun b!114628 () Bool)

(declare-fun c!20481 () Bool)

(assert (=> b!114628 (= c!20481 (and (not (= (bvand (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2471 (v!2980 (underlying!381 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!114628 (= e!74578 e!74584)))

(assert (= (and d!32359 c!20480) b!114621))

(assert (= (and d!32359 (not c!20480)) b!114620))

(assert (= (and b!114620 c!20482) b!114613))

(assert (= (and b!114620 (not c!20482)) b!114628))

(assert (= (and b!114628 c!20481) b!114611))

(assert (= (and b!114628 (not c!20481)) b!114623))

(assert (= (or b!114611 b!114623) bm!12350))

(assert (= (or b!114613 bm!12350) bm!12348))

(assert (= (or b!114613 b!114611) bm!12347))

(assert (= (or b!114621 bm!12348) bm!12345))

(assert (= (or b!114621 bm!12347) bm!12349))

(assert (= (and d!32359 res!56384) b!114614))

(assert (= (and d!32359 c!20479) b!114608))

(assert (= (and d!32359 (not c!20479)) b!114609))

(assert (= (and d!32359 res!56387) b!114619))

(assert (= (and b!114619 res!56388) b!114622))

(assert (= (and b!114619 (not res!56381)) b!114618))

(assert (= (and b!114618 res!56382) b!114612))

(assert (= (and b!114619 res!56380) b!114617))

(assert (= (and b!114617 c!20477) b!114626))

(assert (= (and b!114617 (not c!20477)) b!114610))

(assert (= (and b!114626 res!56386) b!114616))

(assert (= (or b!114626 b!114610) bm!12346))

(assert (= (and b!114617 res!56383) b!114625))

(assert (= (and b!114625 c!20478) b!114624))

(assert (= (and b!114625 (not c!20478)) b!114615))

(assert (= (and b!114624 res!56385) b!114627))

(assert (= (or b!114624 b!114615) bm!12351))

(declare-fun b_lambda!5113 () Bool)

(assert (=> (not b_lambda!5113) (not b!114612)))

(assert (=> b!114612 t!5862))

(declare-fun b_and!7069 () Bool)

(assert (= b_and!7065 (and (=> t!5862 result!3643) b_and!7069)))

(assert (=> b!114612 t!5864))

(declare-fun b_and!7071 () Bool)

(assert (= b_and!7067 (and (=> t!5864 result!3647) b_and!7071)))

(assert (=> b!114622 m!130607))

(assert (=> b!114622 m!130607))

(assert (=> b!114622 m!130639))

(assert (=> b!114618 m!130607))

(assert (=> b!114618 m!130607))

(declare-fun m!130759 () Bool)

(assert (=> b!114618 m!130759))

(assert (=> d!32359 m!130613))

(declare-fun m!130761 () Bool)

(assert (=> bm!12346 m!130761))

(declare-fun m!130763 () Bool)

(assert (=> b!114616 m!130763))

(declare-fun m!130765 () Bool)

(assert (=> bm!12351 m!130765))

(declare-fun m!130767 () Bool)

(assert (=> b!114627 m!130767))

(assert (=> b!114612 m!130607))

(assert (=> b!114612 m!130361))

(assert (=> b!114612 m!130645))

(assert (=> b!114612 m!130361))

(assert (=> b!114612 m!130647))

(assert (=> b!114612 m!130607))

(declare-fun m!130769 () Bool)

(assert (=> b!114612 m!130769))

(assert (=> b!114612 m!130645))

(assert (=> bm!12345 m!130385))

(assert (=> b!114614 m!130607))

(assert (=> b!114614 m!130607))

(assert (=> b!114614 m!130639))

(declare-fun m!130771 () Bool)

(assert (=> bm!12349 m!130771))

(declare-fun m!130773 () Bool)

(assert (=> b!114608 m!130773))

(declare-fun m!130775 () Bool)

(assert (=> b!114608 m!130775))

(declare-fun m!130777 () Bool)

(assert (=> b!114608 m!130777))

(declare-fun m!130779 () Bool)

(assert (=> b!114608 m!130779))

(declare-fun m!130781 () Bool)

(assert (=> b!114608 m!130781))

(declare-fun m!130783 () Bool)

(assert (=> b!114608 m!130783))

(declare-fun m!130785 () Bool)

(assert (=> b!114608 m!130785))

(assert (=> b!114608 m!130777))

(declare-fun m!130787 () Bool)

(assert (=> b!114608 m!130787))

(assert (=> b!114608 m!130385))

(declare-fun m!130789 () Bool)

(assert (=> b!114608 m!130789))

(declare-fun m!130791 () Bool)

(assert (=> b!114608 m!130791))

(assert (=> b!114608 m!130779))

(declare-fun m!130793 () Bool)

(assert (=> b!114608 m!130793))

(assert (=> b!114608 m!130607))

(assert (=> b!114608 m!130791))

(declare-fun m!130795 () Bool)

(assert (=> b!114608 m!130795))

(declare-fun m!130797 () Bool)

(assert (=> b!114608 m!130797))

(declare-fun m!130799 () Bool)

(assert (=> b!114608 m!130799))

(declare-fun m!130801 () Bool)

(assert (=> b!114608 m!130801))

(assert (=> b!114608 m!130797))

(declare-fun m!130803 () Bool)

(assert (=> b!114621 m!130803))

(assert (=> b!114200 d!32359))

(declare-fun mapNonEmpty!4137 () Bool)

(declare-fun mapRes!4137 () Bool)

(declare-fun tp!10275 () Bool)

(declare-fun e!74593 () Bool)

(assert (=> mapNonEmpty!4137 (= mapRes!4137 (and tp!10275 e!74593))))

(declare-fun mapRest!4137 () (Array (_ BitVec 32) ValueCell!1022))

(declare-fun mapValue!4137 () ValueCell!1022)

(declare-fun mapKey!4137 () (_ BitVec 32))

(assert (=> mapNonEmpty!4137 (= mapRest!4121 (store mapRest!4137 mapKey!4137 mapValue!4137))))

(declare-fun condMapEmpty!4137 () Bool)

(declare-fun mapDefault!4137 () ValueCell!1022)

(assert (=> mapNonEmpty!4122 (= condMapEmpty!4137 (= mapRest!4121 ((as const (Array (_ BitVec 32) ValueCell!1022)) mapDefault!4137)))))

(declare-fun e!74592 () Bool)

(assert (=> mapNonEmpty!4122 (= tp!10245 (and e!74592 mapRes!4137))))

(declare-fun b!114636 () Bool)

(assert (=> b!114636 (= e!74592 tp_is_empty!2731)))

(declare-fun b!114635 () Bool)

(assert (=> b!114635 (= e!74593 tp_is_empty!2731)))

(declare-fun mapIsEmpty!4137 () Bool)

(assert (=> mapIsEmpty!4137 mapRes!4137))

(assert (= (and mapNonEmpty!4122 condMapEmpty!4137) mapIsEmpty!4137))

(assert (= (and mapNonEmpty!4122 (not condMapEmpty!4137)) mapNonEmpty!4137))

(assert (= (and mapNonEmpty!4137 ((_ is ValueCellFull!1022) mapValue!4137)) b!114635))

(assert (= (and mapNonEmpty!4122 ((_ is ValueCellFull!1022) mapDefault!4137)) b!114636))

(declare-fun m!130805 () Bool)

(assert (=> mapNonEmpty!4137 m!130805))

(declare-fun mapNonEmpty!4138 () Bool)

(declare-fun mapRes!4138 () Bool)

(declare-fun tp!10276 () Bool)

(declare-fun e!74595 () Bool)

(assert (=> mapNonEmpty!4138 (= mapRes!4138 (and tp!10276 e!74595))))

(declare-fun mapRest!4138 () (Array (_ BitVec 32) ValueCell!1022))

(declare-fun mapKey!4138 () (_ BitVec 32))

(declare-fun mapValue!4138 () ValueCell!1022)

(assert (=> mapNonEmpty!4138 (= mapRest!4122 (store mapRest!4138 mapKey!4138 mapValue!4138))))

(declare-fun condMapEmpty!4138 () Bool)

(declare-fun mapDefault!4138 () ValueCell!1022)

(assert (=> mapNonEmpty!4121 (= condMapEmpty!4138 (= mapRest!4122 ((as const (Array (_ BitVec 32) ValueCell!1022)) mapDefault!4138)))))

(declare-fun e!74594 () Bool)

(assert (=> mapNonEmpty!4121 (= tp!10246 (and e!74594 mapRes!4138))))

(declare-fun b!114638 () Bool)

(assert (=> b!114638 (= e!74594 tp_is_empty!2731)))

(declare-fun b!114637 () Bool)

(assert (=> b!114637 (= e!74595 tp_is_empty!2731)))

(declare-fun mapIsEmpty!4138 () Bool)

(assert (=> mapIsEmpty!4138 mapRes!4138))

(assert (= (and mapNonEmpty!4121 condMapEmpty!4138) mapIsEmpty!4138))

(assert (= (and mapNonEmpty!4121 (not condMapEmpty!4138)) mapNonEmpty!4138))

(assert (= (and mapNonEmpty!4138 ((_ is ValueCellFull!1022) mapValue!4138)) b!114637))

(assert (= (and mapNonEmpty!4121 ((_ is ValueCellFull!1022) mapDefault!4138)) b!114638))

(declare-fun m!130807 () Bool)

(assert (=> mapNonEmpty!4138 m!130807))

(declare-fun b_lambda!5115 () Bool)

(assert (= b_lambda!5111 (or (and b!114195 b_free!2629) (and b!114197 b_free!2631 (= (defaultEntry!2682 newMap!16) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992))))) b_lambda!5115)))

(declare-fun b_lambda!5117 () Bool)

(assert (= b_lambda!5109 (or (and b!114195 b_free!2629) (and b!114197 b_free!2631 (= (defaultEntry!2682 newMap!16) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992))))) b_lambda!5117)))

(declare-fun b_lambda!5119 () Bool)

(assert (= b_lambda!5113 (or (and b!114195 b_free!2629) (and b!114197 b_free!2631 (= (defaultEntry!2682 newMap!16) (defaultEntry!2682 (v!2980 (underlying!381 thiss!992))))) b_lambda!5119)))

(check-sat (not d!32351) (not d!32333) (not b!114564) (not bm!12303) (not bm!12330) (not b!114557) (not b!114480) (not b!114558) (not b_next!2631) (not bm!12306) (not b!114505) (not bm!12311) (not d!32347) (not d!32355) (not b!114478) (not d!32315) (not bm!12327) (not b!114555) (not d!32343) (not b!114335) (not b!114513) (not b!114432) (not b_next!2629) (not b!114563) (not b!114507) (not d!32329) (not b!114562) (not d!32323) (not b!114469) (not d!32339) (not bm!12345) (not b!114548) (not b!114506) (not b_lambda!5119) b_and!7069 (not d!32325) (not b_lambda!5107) (not b!114550) (not b!114444) (not d!32309) (not b!114553) tp_is_empty!2731 (not d!32349) (not b!114559) (not b!114556) (not b!114451) (not bm!12349) (not b!114565) (not d!32337) (not d!32357) (not b!114337) (not b!114627) (not bm!12351) (not b!114437) (not b!114468) b_and!7071 (not b!114487) (not b!114539) (not b!114614) (not bm!12321) (not b!114612) (not b!114463) (not d!32335) (not b!114554) (not bm!12317) (not b!114492) (not bm!12308) (not bm!12312) (not b!114443) (not b!114608) (not b_lambda!5117) (not mapNonEmpty!4137) (not b!114481) (not b!114462) (not d!32311) (not b!114546) (not d!32317) (not b!114560) (not bm!12309) (not bm!12322) (not b!114545) (not b!114479) (not d!32345) (not b!114561) (not b!114622) (not b!114551) (not b!114476) (not b!114552) (not b!114424) (not bm!12346) (not d!32341) (not bm!12302) (not b!114542) (not d!32359) (not b!114618) (not bm!12310) (not b!114543) (not d!32353) (not bm!12301) (not mapNonEmpty!4138) (not b_lambda!5115) (not b!114621) (not b!114514) (not b!114547) (not b!114477) (not b!114616))
(check-sat b_and!7069 b_and!7071 (not b_next!2629) (not b_next!2631))
