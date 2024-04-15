; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12846 () Bool)

(assert start!12846)

(declare-fun b!111620 () Bool)

(declare-fun b_free!2569 () Bool)

(declare-fun b_next!2569 () Bool)

(assert (=> b!111620 (= b_free!2569 (not b_next!2569))))

(declare-fun tp!10053 () Bool)

(declare-fun b_and!6849 () Bool)

(assert (=> b!111620 (= tp!10053 b_and!6849)))

(declare-fun b!111616 () Bool)

(declare-fun b_free!2571 () Bool)

(declare-fun b_next!2571 () Bool)

(assert (=> b!111616 (= b_free!2571 (not b_next!2571))))

(declare-fun tp!10054 () Bool)

(declare-fun b_and!6851 () Bool)

(assert (=> b!111616 (= tp!10054 b_and!6851)))

(declare-fun b!111614 () Bool)

(declare-fun e!72564 () Bool)

(declare-fun tp_is_empty!2701 () Bool)

(assert (=> b!111614 (= e!72564 tp_is_empty!2701)))

(declare-fun b!111615 () Bool)

(declare-fun e!72575 () Bool)

(declare-fun e!72562 () Bool)

(assert (=> b!111615 (= e!72575 (not e!72562))))

(declare-fun res!55102 () Bool)

(assert (=> b!111615 (=> res!55102 e!72562)))

(declare-datatypes ((V!3249 0))(
  ( (V!3250 (val!1395 Int)) )
))
(declare-datatypes ((array!4379 0))(
  ( (array!4380 (arr!2074 (Array (_ BitVec 32) (_ BitVec 64))) (size!2333 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1007 0))(
  ( (ValueCellFull!1007 (v!2935 V!3249)) (EmptyCell!1007) )
))
(declare-datatypes ((array!4381 0))(
  ( (array!4382 (arr!2075 (Array (_ BitVec 32) ValueCell!1007)) (size!2334 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!922 0))(
  ( (LongMapFixedSize!923 (defaultEntry!2647 Int) (mask!6824 (_ BitVec 32)) (extraKeys!2440 (_ BitVec 32)) (zeroValue!2516 V!3249) (minValue!2516 V!3249) (_size!510 (_ BitVec 32)) (_keys!4364 array!4379) (_values!2630 array!4381) (_vacant!510 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!710 0))(
  ( (Cell!711 (v!2936 LongMapFixedSize!922)) )
))
(declare-datatypes ((LongMap!710 0))(
  ( (LongMap!711 (underlying!366 Cell!710)) )
))
(declare-fun thiss!992 () LongMap!710)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!111615 (= res!55102 (not (validMask!0 (mask!6824 (v!2936 (underlying!366 thiss!992))))))))

(declare-datatypes ((tuple2!2404 0))(
  ( (tuple2!2405 (_1!1213 (_ BitVec 64)) (_2!1213 V!3249)) )
))
(declare-datatypes ((List!1629 0))(
  ( (Nil!1626) (Cons!1625 (h!2225 tuple2!2404) (t!5778 List!1629)) )
))
(declare-datatypes ((ListLongMap!1557 0))(
  ( (ListLongMap!1558 (toList!794 List!1629)) )
))
(declare-fun lt!57569 () ListLongMap!1557)

(declare-fun lt!57571 () tuple2!2404)

(declare-fun lt!57568 () tuple2!2404)

(declare-fun +!140 (ListLongMap!1557 tuple2!2404) ListLongMap!1557)

(assert (=> b!111615 (= (+!140 (+!140 lt!57569 lt!57571) lt!57568) (+!140 (+!140 lt!57569 lt!57568) lt!57571))))

(assert (=> b!111615 (= lt!57568 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!57575 () V!3249)

(assert (=> b!111615 (= lt!57571 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))

(declare-datatypes ((Unit!3468 0))(
  ( (Unit!3469) )
))
(declare-fun lt!57576 () Unit!3468)

(declare-fun addCommutativeForDiffKeys!52 (ListLongMap!1557 (_ BitVec 64) V!3249 (_ BitVec 64) V!3249) Unit!3468)

(assert (=> b!111615 (= lt!57576 (addCommutativeForDiffKeys!52 lt!57569 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!105 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 32) Int) ListLongMap!1557)

(assert (=> b!111615 (= lt!57569 (getCurrentListMapNoExtraKeys!105 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun e!72572 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!922)

(declare-fun e!72568 () Bool)

(declare-fun array_inv!1311 (array!4379) Bool)

(declare-fun array_inv!1312 (array!4381) Bool)

(assert (=> b!111616 (= e!72572 (and tp!10054 tp_is_empty!2701 (array_inv!1311 (_keys!4364 newMap!16)) (array_inv!1312 (_values!2630 newMap!16)) e!72568))))

(declare-fun b!111617 () Bool)

(declare-fun e!72569 () Bool)

(declare-fun e!72561 () Bool)

(assert (=> b!111617 (= e!72569 e!72561)))

(declare-fun b!111618 () Bool)

(declare-fun e!72560 () Bool)

(assert (=> b!111618 (= e!72560 tp_is_empty!2701)))

(declare-fun b!111619 () Bool)

(declare-fun res!55108 () Bool)

(assert (=> b!111619 (=> res!55108 e!72562)))

(assert (=> b!111619 (= res!55108 (or (not (= (size!2334 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6824 (v!2936 (underlying!366 thiss!992)))))) (not (= (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (size!2334 (_values!2630 (v!2936 (underlying!366 thiss!992)))))) (bvslt (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun e!72558 () Bool)

(assert (=> b!111620 (= e!72561 (and tp!10053 tp_is_empty!2701 (array_inv!1311 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (array_inv!1312 (_values!2630 (v!2936 (underlying!366 thiss!992)))) e!72558))))

(declare-fun res!55103 () Bool)

(declare-fun e!72567 () Bool)

(assert (=> start!12846 (=> (not res!55103) (not e!72567))))

(declare-fun valid!432 (LongMap!710) Bool)

(assert (=> start!12846 (= res!55103 (valid!432 thiss!992))))

(assert (=> start!12846 e!72567))

(declare-fun e!72571 () Bool)

(assert (=> start!12846 e!72571))

(assert (=> start!12846 true))

(assert (=> start!12846 e!72572))

(declare-fun b!111621 () Bool)

(declare-fun e!72565 () Unit!3468)

(declare-fun Unit!3470 () Unit!3468)

(assert (=> b!111621 (= e!72565 Unit!3470)))

(declare-fun mapNonEmpty!4019 () Bool)

(declare-fun mapRes!4020 () Bool)

(declare-fun tp!10055 () Bool)

(assert (=> mapNonEmpty!4019 (= mapRes!4020 (and tp!10055 e!72560))))

(declare-fun mapRest!4019 () (Array (_ BitVec 32) ValueCell!1007))

(declare-fun mapValue!4019 () ValueCell!1007)

(declare-fun mapKey!4020 () (_ BitVec 32))

(assert (=> mapNonEmpty!4019 (= (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (store mapRest!4019 mapKey!4020 mapValue!4019))))

(declare-fun b!111622 () Bool)

(declare-fun res!55105 () Bool)

(assert (=> b!111622 (=> (not res!55105) (not e!72567))))

(assert (=> b!111622 (= res!55105 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6824 newMap!16)) (_size!510 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun b!111623 () Bool)

(declare-fun res!55109 () Bool)

(assert (=> b!111623 (=> (not res!55109) (not e!72567))))

(assert (=> b!111623 (= res!55109 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992)))))))))

(declare-fun mapNonEmpty!4020 () Bool)

(declare-fun mapRes!4019 () Bool)

(declare-fun tp!10056 () Bool)

(declare-fun e!72563 () Bool)

(assert (=> mapNonEmpty!4020 (= mapRes!4019 (and tp!10056 e!72563))))

(declare-fun mapKey!4019 () (_ BitVec 32))

(declare-fun mapRest!4020 () (Array (_ BitVec 32) ValueCell!1007))

(declare-fun mapValue!4020 () ValueCell!1007)

(assert (=> mapNonEmpty!4020 (= (arr!2075 (_values!2630 newMap!16)) (store mapRest!4020 mapKey!4019 mapValue!4020))))

(declare-fun b!111624 () Bool)

(declare-fun e!72559 () Bool)

(assert (=> b!111624 (= e!72559 tp_is_empty!2701)))

(declare-fun b!111625 () Bool)

(declare-fun e!72574 () Bool)

(declare-fun e!72570 () Bool)

(assert (=> b!111625 (= e!72574 e!72570)))

(declare-fun res!55110 () Bool)

(assert (=> b!111625 (=> (not res!55110) (not e!72570))))

(assert (=> b!111625 (= res!55110 (and (not (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1353 (ValueCell!1007 V!3249) V!3249)

(declare-fun dynLambda!388 (Int (_ BitVec 64)) V!3249)

(assert (=> b!111625 (= lt!57575 (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) from!355) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!111626 () Bool)

(assert (=> b!111626 (= e!72567 e!72574)))

(declare-fun res!55107 () Bool)

(assert (=> b!111626 (=> (not res!55107) (not e!72574))))

(declare-fun lt!57577 () ListLongMap!1557)

(declare-fun lt!57567 () ListLongMap!1557)

(assert (=> b!111626 (= res!55107 (= lt!57577 lt!57567))))

(declare-fun map!1284 (LongMapFixedSize!922) ListLongMap!1557)

(assert (=> b!111626 (= lt!57567 (map!1284 newMap!16))))

(declare-fun getCurrentListMap!470 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 32) Int) ListLongMap!1557)

(assert (=> b!111626 (= lt!57577 (getCurrentListMap!470 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun mapIsEmpty!4019 () Bool)

(assert (=> mapIsEmpty!4019 mapRes!4020))

(declare-fun b!111627 () Bool)

(declare-fun Unit!3471 () Unit!3468)

(assert (=> b!111627 (= e!72565 Unit!3471)))

(declare-fun lt!57570 () Unit!3468)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!116 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 64) (_ BitVec 32) Int) Unit!3468)

(assert (=> b!111627 (= lt!57570 (lemmaListMapContainsThenArrayContainsFrom!116 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!111627 (arrayContainsKey!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!57573 () Unit!3468)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4379 (_ BitVec 32) (_ BitVec 32)) Unit!3468)

(assert (=> b!111627 (= lt!57573 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1630 0))(
  ( (Nil!1627) (Cons!1626 (h!2226 (_ BitVec 64)) (t!5779 List!1630)) )
))
(declare-fun arrayNoDuplicates!0 (array!4379 (_ BitVec 32) List!1630) Bool)

(assert (=> b!111627 (arrayNoDuplicates!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) from!355 Nil!1627)))

(declare-fun lt!57578 () Unit!3468)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4379 (_ BitVec 32) (_ BitVec 64) List!1630) Unit!3468)

(assert (=> b!111627 (= lt!57578 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (Cons!1626 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) Nil!1627)))))

(assert (=> b!111627 false))

(declare-fun b!111628 () Bool)

(assert (=> b!111628 (= e!72570 e!72575)))

(declare-fun res!55104 () Bool)

(assert (=> b!111628 (=> (not res!55104) (not e!72575))))

(declare-datatypes ((tuple2!2406 0))(
  ( (tuple2!2407 (_1!1214 Bool) (_2!1214 LongMapFixedSize!922)) )
))
(declare-fun lt!57574 () tuple2!2406)

(assert (=> b!111628 (= res!55104 (and (_1!1214 lt!57574) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!57572 () Unit!3468)

(assert (=> b!111628 (= lt!57572 e!72565)))

(declare-fun c!19914 () Bool)

(declare-fun contains!831 (ListLongMap!1557 (_ BitVec 64)) Bool)

(assert (=> b!111628 (= c!19914 (contains!831 lt!57567 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun update!164 (LongMapFixedSize!922 (_ BitVec 64) V!3249) tuple2!2406)

(assert (=> b!111628 (= lt!57574 (update!164 newMap!16 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))

(declare-fun b!111629 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4379 (_ BitVec 32)) Bool)

(assert (=> b!111629 (= e!72562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun b!111630 () Bool)

(assert (=> b!111630 (= e!72568 (and e!72559 mapRes!4019))))

(declare-fun condMapEmpty!4019 () Bool)

(declare-fun mapDefault!4020 () ValueCell!1007)

(assert (=> b!111630 (= condMapEmpty!4019 (= (arr!2075 (_values!2630 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1007)) mapDefault!4020)))))

(declare-fun mapIsEmpty!4020 () Bool)

(assert (=> mapIsEmpty!4020 mapRes!4019))

(declare-fun b!111631 () Bool)

(assert (=> b!111631 (= e!72563 tp_is_empty!2701)))

(declare-fun b!111632 () Bool)

(assert (=> b!111632 (= e!72571 e!72569)))

(declare-fun b!111633 () Bool)

(declare-fun res!55106 () Bool)

(assert (=> b!111633 (=> (not res!55106) (not e!72567))))

(declare-fun valid!433 (LongMapFixedSize!922) Bool)

(assert (=> b!111633 (= res!55106 (valid!433 newMap!16))))

(declare-fun b!111634 () Bool)

(assert (=> b!111634 (= e!72558 (and e!72564 mapRes!4020))))

(declare-fun condMapEmpty!4020 () Bool)

(declare-fun mapDefault!4019 () ValueCell!1007)

(assert (=> b!111634 (= condMapEmpty!4020 (= (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1007)) mapDefault!4019)))))

(assert (= (and start!12846 res!55103) b!111623))

(assert (= (and b!111623 res!55109) b!111633))

(assert (= (and b!111633 res!55106) b!111622))

(assert (= (and b!111622 res!55105) b!111626))

(assert (= (and b!111626 res!55107) b!111625))

(assert (= (and b!111625 res!55110) b!111628))

(assert (= (and b!111628 c!19914) b!111627))

(assert (= (and b!111628 (not c!19914)) b!111621))

(assert (= (and b!111628 res!55104) b!111615))

(assert (= (and b!111615 (not res!55102)) b!111619))

(assert (= (and b!111619 (not res!55108)) b!111629))

(assert (= (and b!111634 condMapEmpty!4020) mapIsEmpty!4019))

(assert (= (and b!111634 (not condMapEmpty!4020)) mapNonEmpty!4019))

(get-info :version)

(assert (= (and mapNonEmpty!4019 ((_ is ValueCellFull!1007) mapValue!4019)) b!111618))

(assert (= (and b!111634 ((_ is ValueCellFull!1007) mapDefault!4019)) b!111614))

(assert (= b!111620 b!111634))

(assert (= b!111617 b!111620))

(assert (= b!111632 b!111617))

(assert (= start!12846 b!111632))

(assert (= (and b!111630 condMapEmpty!4019) mapIsEmpty!4020))

(assert (= (and b!111630 (not condMapEmpty!4019)) mapNonEmpty!4020))

(assert (= (and mapNonEmpty!4020 ((_ is ValueCellFull!1007) mapValue!4020)) b!111631))

(assert (= (and b!111630 ((_ is ValueCellFull!1007) mapDefault!4020)) b!111624))

(assert (= b!111616 b!111630))

(assert (= start!12846 b!111616))

(declare-fun b_lambda!4999 () Bool)

(assert (=> (not b_lambda!4999) (not b!111625)))

(declare-fun t!5775 () Bool)

(declare-fun tb!2113 () Bool)

(assert (=> (and b!111620 (= (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))) t!5775) tb!2113))

(declare-fun result!3541 () Bool)

(assert (=> tb!2113 (= result!3541 tp_is_empty!2701)))

(assert (=> b!111625 t!5775))

(declare-fun b_and!6853 () Bool)

(assert (= b_and!6849 (and (=> t!5775 result!3541) b_and!6853)))

(declare-fun t!5777 () Bool)

(declare-fun tb!2115 () Bool)

(assert (=> (and b!111616 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))) t!5777) tb!2115))

(declare-fun result!3545 () Bool)

(assert (= result!3545 result!3541))

(assert (=> b!111625 t!5777))

(declare-fun b_and!6855 () Bool)

(assert (= b_and!6851 (and (=> t!5777 result!3545) b_and!6855)))

(declare-fun m!127195 () Bool)

(assert (=> b!111626 m!127195))

(declare-fun m!127197 () Bool)

(assert (=> b!111626 m!127197))

(declare-fun m!127199 () Bool)

(assert (=> b!111625 m!127199))

(declare-fun m!127201 () Bool)

(assert (=> b!111625 m!127201))

(declare-fun m!127203 () Bool)

(assert (=> b!111625 m!127203))

(assert (=> b!111625 m!127201))

(assert (=> b!111625 m!127203))

(declare-fun m!127205 () Bool)

(assert (=> b!111625 m!127205))

(declare-fun m!127207 () Bool)

(assert (=> b!111615 m!127207))

(declare-fun m!127209 () Bool)

(assert (=> b!111615 m!127209))

(declare-fun m!127211 () Bool)

(assert (=> b!111615 m!127211))

(assert (=> b!111615 m!127207))

(assert (=> b!111615 m!127199))

(declare-fun m!127213 () Bool)

(assert (=> b!111615 m!127213))

(declare-fun m!127215 () Bool)

(assert (=> b!111615 m!127215))

(declare-fun m!127217 () Bool)

(assert (=> b!111615 m!127217))

(assert (=> b!111615 m!127199))

(declare-fun m!127219 () Bool)

(assert (=> b!111615 m!127219))

(assert (=> b!111615 m!127213))

(declare-fun m!127221 () Bool)

(assert (=> b!111629 m!127221))

(declare-fun m!127223 () Bool)

(assert (=> b!111616 m!127223))

(declare-fun m!127225 () Bool)

(assert (=> b!111616 m!127225))

(declare-fun m!127227 () Bool)

(assert (=> start!12846 m!127227))

(assert (=> b!111628 m!127199))

(assert (=> b!111628 m!127199))

(declare-fun m!127229 () Bool)

(assert (=> b!111628 m!127229))

(assert (=> b!111628 m!127199))

(declare-fun m!127231 () Bool)

(assert (=> b!111628 m!127231))

(declare-fun m!127233 () Bool)

(assert (=> mapNonEmpty!4019 m!127233))

(declare-fun m!127235 () Bool)

(assert (=> b!111627 m!127235))

(declare-fun m!127237 () Bool)

(assert (=> b!111627 m!127237))

(assert (=> b!111627 m!127199))

(declare-fun m!127239 () Bool)

(assert (=> b!111627 m!127239))

(assert (=> b!111627 m!127199))

(assert (=> b!111627 m!127199))

(declare-fun m!127241 () Bool)

(assert (=> b!111627 m!127241))

(assert (=> b!111627 m!127199))

(declare-fun m!127243 () Bool)

(assert (=> b!111627 m!127243))

(declare-fun m!127245 () Bool)

(assert (=> b!111633 m!127245))

(declare-fun m!127247 () Bool)

(assert (=> mapNonEmpty!4020 m!127247))

(declare-fun m!127249 () Bool)

(assert (=> b!111620 m!127249))

(declare-fun m!127251 () Bool)

(assert (=> b!111620 m!127251))

(check-sat (not b!111625) (not b!111628) (not b!111629) (not b!111626) b_and!6855 (not b_next!2569) (not mapNonEmpty!4019) (not b!111627) tp_is_empty!2701 (not b!111633) (not start!12846) (not b!111620) b_and!6853 (not b_lambda!4999) (not b!111616) (not mapNonEmpty!4020) (not b!111615) (not b_next!2571))
(check-sat b_and!6853 b_and!6855 (not b_next!2569) (not b_next!2571))
(get-model)

(declare-fun b_lambda!5005 () Bool)

(assert (= b_lambda!4999 (or (and b!111620 b_free!2569) (and b!111616 b_free!2571 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))))) b_lambda!5005)))

(check-sat (not b!111625) (not b!111628) (not b!111629) (not b!111626) b_and!6855 (not b_next!2569) (not mapNonEmpty!4019) (not b_lambda!5005) (not b!111627) tp_is_empty!2701 (not b!111633) (not start!12846) (not b!111620) b_and!6853 (not b!111616) (not mapNonEmpty!4020) (not b!111615) (not b_next!2571))
(check-sat b_and!6853 b_and!6855 (not b_next!2569) (not b_next!2571))
(get-model)

(declare-fun d!31763 () Bool)

(assert (=> d!31763 (= (array_inv!1311 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvsge (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!111620 d!31763))

(declare-fun d!31765 () Bool)

(assert (=> d!31765 (= (array_inv!1312 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvsge (size!2334 (_values!2630 (v!2936 (underlying!366 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!111620 d!31765))

(declare-fun d!31767 () Bool)

(assert (=> d!31767 (not (arrayContainsKey!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!57653 () Unit!3468)

(declare-fun choose!68 (array!4379 (_ BitVec 32) (_ BitVec 64) List!1630) Unit!3468)

(assert (=> d!31767 (= lt!57653 (choose!68 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (Cons!1626 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) Nil!1627)))))

(assert (=> d!31767 (bvslt (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!31767 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (Cons!1626 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) Nil!1627)) lt!57653)))

(declare-fun bs!4602 () Bool)

(assert (= bs!4602 d!31767))

(assert (=> bs!4602 m!127199))

(assert (=> bs!4602 m!127241))

(assert (=> bs!4602 m!127199))

(declare-fun m!127369 () Bool)

(assert (=> bs!4602 m!127369))

(assert (=> b!111627 d!31767))

(declare-fun d!31769 () Bool)

(assert (=> d!31769 (arrayNoDuplicates!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) from!355 Nil!1627)))

(declare-fun lt!57656 () Unit!3468)

(declare-fun choose!39 (array!4379 (_ BitVec 32) (_ BitVec 32)) Unit!3468)

(assert (=> d!31769 (= lt!57656 (choose!39 (_keys!4364 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!31769 (bvslt (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!31769 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000000 from!355) lt!57656)))

(declare-fun bs!4603 () Bool)

(assert (= bs!4603 d!31769))

(assert (=> bs!4603 m!127237))

(declare-fun m!127371 () Bool)

(assert (=> bs!4603 m!127371))

(assert (=> b!111627 d!31769))

(declare-fun d!31771 () Bool)

(declare-fun res!55169 () Bool)

(declare-fun e!72688 () Bool)

(assert (=> d!31771 (=> res!55169 e!72688)))

(assert (=> d!31771 (= res!55169 (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (=> d!31771 (= (arrayContainsKey!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!72688)))

(declare-fun b!111771 () Bool)

(declare-fun e!72689 () Bool)

(assert (=> b!111771 (= e!72688 e!72689)))

(declare-fun res!55170 () Bool)

(assert (=> b!111771 (=> (not res!55170) (not e!72689))))

(assert (=> b!111771 (= res!55170 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(declare-fun b!111772 () Bool)

(assert (=> b!111772 (= e!72689 (arrayContainsKey!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!31771 (not res!55169)) b!111771))

(assert (= (and b!111771 res!55170) b!111772))

(declare-fun m!127373 () Bool)

(assert (=> d!31771 m!127373))

(assert (=> b!111772 m!127199))

(declare-fun m!127375 () Bool)

(assert (=> b!111772 m!127375))

(assert (=> b!111627 d!31771))

(declare-fun d!31773 () Bool)

(declare-fun e!72692 () Bool)

(assert (=> d!31773 e!72692))

(declare-fun c!19923 () Bool)

(assert (=> d!31773 (= c!19923 (and (not (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!57659 () Unit!3468)

(declare-fun choose!704 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 64) (_ BitVec 32) Int) Unit!3468)

(assert (=> d!31773 (= lt!57659 (choose!704 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))))))

(assert (=> d!31773 (validMask!0 (mask!6824 (v!2936 (underlying!366 thiss!992))))))

(assert (=> d!31773 (= (lemmaListMapContainsThenArrayContainsFrom!116 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))) lt!57659)))

(declare-fun b!111777 () Bool)

(assert (=> b!111777 (= e!72692 (arrayContainsKey!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!111778 () Bool)

(assert (=> b!111778 (= e!72692 (ite (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!31773 c!19923) b!111777))

(assert (= (and d!31773 (not c!19923)) b!111778))

(assert (=> d!31773 m!127199))

(declare-fun m!127377 () Bool)

(assert (=> d!31773 m!127377))

(assert (=> d!31773 m!127211))

(assert (=> b!111777 m!127199))

(assert (=> b!111777 m!127241))

(assert (=> b!111627 d!31773))

(declare-fun b!111789 () Bool)

(declare-fun e!72704 () Bool)

(declare-fun call!11915 () Bool)

(assert (=> b!111789 (= e!72704 call!11915)))

(declare-fun b!111790 () Bool)

(declare-fun e!72701 () Bool)

(assert (=> b!111790 (= e!72701 e!72704)))

(declare-fun c!19926 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!111790 (= c!19926 (validKeyInArray!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun b!111791 () Bool)

(declare-fun e!72702 () Bool)

(declare-fun contains!832 (List!1630 (_ BitVec 64)) Bool)

(assert (=> b!111791 (= e!72702 (contains!832 Nil!1627 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun d!31775 () Bool)

(declare-fun res!55179 () Bool)

(declare-fun e!72703 () Bool)

(assert (=> d!31775 (=> res!55179 e!72703)))

(assert (=> d!31775 (= res!55179 (bvsge from!355 (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(assert (=> d!31775 (= (arrayNoDuplicates!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) from!355 Nil!1627) e!72703)))

(declare-fun b!111792 () Bool)

(assert (=> b!111792 (= e!72703 e!72701)))

(declare-fun res!55177 () Bool)

(assert (=> b!111792 (=> (not res!55177) (not e!72701))))

(assert (=> b!111792 (= res!55177 (not e!72702))))

(declare-fun res!55178 () Bool)

(assert (=> b!111792 (=> (not res!55178) (not e!72702))))

(assert (=> b!111792 (= res!55178 (validKeyInArray!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun b!111793 () Bool)

(assert (=> b!111793 (= e!72704 call!11915)))

(declare-fun bm!11912 () Bool)

(assert (=> bm!11912 (= call!11915 (arrayNoDuplicates!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!19926 (Cons!1626 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) Nil!1627) Nil!1627)))))

(assert (= (and d!31775 (not res!55179)) b!111792))

(assert (= (and b!111792 res!55178) b!111791))

(assert (= (and b!111792 res!55177) b!111790))

(assert (= (and b!111790 c!19926) b!111793))

(assert (= (and b!111790 (not c!19926)) b!111789))

(assert (= (or b!111793 b!111789) bm!11912))

(assert (=> b!111790 m!127199))

(assert (=> b!111790 m!127199))

(declare-fun m!127379 () Bool)

(assert (=> b!111790 m!127379))

(assert (=> b!111791 m!127199))

(assert (=> b!111791 m!127199))

(declare-fun m!127381 () Bool)

(assert (=> b!111791 m!127381))

(assert (=> b!111792 m!127199))

(assert (=> b!111792 m!127199))

(assert (=> b!111792 m!127379))

(assert (=> bm!11912 m!127199))

(declare-fun m!127383 () Bool)

(assert (=> bm!11912 m!127383))

(assert (=> b!111627 d!31775))

(declare-fun d!31777 () Bool)

(assert (=> d!31777 (= (valid!432 thiss!992) (valid!433 (v!2936 (underlying!366 thiss!992))))))

(declare-fun bs!4604 () Bool)

(assert (= bs!4604 d!31777))

(declare-fun m!127385 () Bool)

(assert (=> bs!4604 m!127385))

(assert (=> start!12846 d!31777))

(declare-fun d!31779 () Bool)

(assert (=> d!31779 (= (map!1284 newMap!16) (getCurrentListMap!470 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun bs!4605 () Bool)

(assert (= bs!4605 d!31779))

(declare-fun m!127387 () Bool)

(assert (=> bs!4605 m!127387))

(assert (=> b!111626 d!31779))

(declare-fun bm!11927 () Bool)

(declare-fun call!11931 () ListLongMap!1557)

(declare-fun call!11934 () ListLongMap!1557)

(declare-fun c!19944 () Bool)

(declare-fun c!19939 () Bool)

(declare-fun call!11933 () ListLongMap!1557)

(declare-fun call!11936 () ListLongMap!1557)

(assert (=> bm!11927 (= call!11931 (+!140 (ite c!19944 call!11936 (ite c!19939 call!11933 call!11934)) (ite (or c!19944 c!19939) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(declare-fun b!111836 () Bool)

(declare-fun e!72735 () Bool)

(assert (=> b!111836 (= e!72735 (validKeyInArray!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!72738 () Bool)

(declare-fun lt!57724 () ListLongMap!1557)

(declare-fun b!111837 () Bool)

(declare-fun apply!101 (ListLongMap!1557 (_ BitVec 64)) V!3249)

(assert (=> b!111837 (= e!72738 (= (apply!101 lt!57724 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!111837 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2334 (_values!2630 (v!2936 (underlying!366 thiss!992))))))))

(assert (=> b!111837 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(declare-fun bm!11928 () Bool)

(assert (=> bm!11928 (= call!11934 call!11933)))

(declare-fun b!111838 () Bool)

(declare-fun e!72732 () ListLongMap!1557)

(declare-fun e!72734 () ListLongMap!1557)

(assert (=> b!111838 (= e!72732 e!72734)))

(assert (=> b!111838 (= c!19939 (and (not (= (bvand (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!11929 () Bool)

(declare-fun call!11930 () Bool)

(assert (=> bm!11929 (= call!11930 (contains!831 lt!57724 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!111839 () Bool)

(declare-fun e!72741 () Bool)

(declare-fun e!72739 () Bool)

(assert (=> b!111839 (= e!72741 e!72739)))

(declare-fun res!55199 () Bool)

(declare-fun call!11935 () Bool)

(assert (=> b!111839 (= res!55199 call!11935)))

(assert (=> b!111839 (=> (not res!55199) (not e!72739))))

(declare-fun b!111840 () Bool)

(declare-fun e!72737 () Bool)

(declare-fun e!72742 () Bool)

(assert (=> b!111840 (= e!72737 e!72742)))

(declare-fun res!55200 () Bool)

(assert (=> b!111840 (= res!55200 call!11930)))

(assert (=> b!111840 (=> (not res!55200) (not e!72742))))

(declare-fun b!111841 () Bool)

(assert (=> b!111841 (= e!72742 (= (apply!101 lt!57724 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun b!111842 () Bool)

(declare-fun c!19940 () Bool)

(assert (=> b!111842 (= c!19940 (and (not (= (bvand (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!72736 () ListLongMap!1557)

(assert (=> b!111842 (= e!72734 e!72736)))

(declare-fun b!111843 () Bool)

(declare-fun e!72740 () Bool)

(assert (=> b!111843 (= e!72740 e!72737)))

(declare-fun c!19943 () Bool)

(assert (=> b!111843 (= c!19943 (not (= (bvand (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!11930 () Bool)

(assert (=> bm!11930 (= call!11935 (contains!831 lt!57724 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!11931 () Bool)

(declare-fun call!11932 () ListLongMap!1557)

(assert (=> bm!11931 (= call!11932 call!11931)))

(declare-fun b!111844 () Bool)

(declare-fun e!72733 () Bool)

(assert (=> b!111844 (= e!72733 e!72738)))

(declare-fun res!55204 () Bool)

(assert (=> b!111844 (=> (not res!55204) (not e!72738))))

(assert (=> b!111844 (= res!55204 (contains!831 lt!57724 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!111844 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(declare-fun b!111845 () Bool)

(assert (=> b!111845 (= e!72736 call!11934)))

(declare-fun b!111846 () Bool)

(declare-fun e!72731 () Bool)

(assert (=> b!111846 (= e!72731 (validKeyInArray!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!111847 () Bool)

(assert (=> b!111847 (= e!72737 (not call!11930))))

(declare-fun b!111848 () Bool)

(assert (=> b!111848 (= e!72741 (not call!11935))))

(declare-fun b!111849 () Bool)

(declare-fun res!55201 () Bool)

(assert (=> b!111849 (=> (not res!55201) (not e!72740))))

(assert (=> b!111849 (= res!55201 e!72741)))

(declare-fun c!19942 () Bool)

(assert (=> b!111849 (= c!19942 (not (= (bvand (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!111850 () Bool)

(declare-fun e!72743 () Unit!3468)

(declare-fun lt!57722 () Unit!3468)

(assert (=> b!111850 (= e!72743 lt!57722)))

(declare-fun lt!57716 () ListLongMap!1557)

(assert (=> b!111850 (= lt!57716 (getCurrentListMapNoExtraKeys!105 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun lt!57717 () (_ BitVec 64))

(assert (=> b!111850 (= lt!57717 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!57705 () (_ BitVec 64))

(assert (=> b!111850 (= lt!57705 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!57720 () Unit!3468)

(declare-fun addStillContains!77 (ListLongMap!1557 (_ BitVec 64) V!3249 (_ BitVec 64)) Unit!3468)

(assert (=> b!111850 (= lt!57720 (addStillContains!77 lt!57716 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) lt!57705))))

(assert (=> b!111850 (contains!831 (+!140 lt!57716 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!57705)))

(declare-fun lt!57706 () Unit!3468)

(assert (=> b!111850 (= lt!57706 lt!57720)))

(declare-fun lt!57718 () ListLongMap!1557)

(assert (=> b!111850 (= lt!57718 (getCurrentListMapNoExtraKeys!105 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun lt!57708 () (_ BitVec 64))

(assert (=> b!111850 (= lt!57708 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!57715 () (_ BitVec 64))

(assert (=> b!111850 (= lt!57715 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!57712 () Unit!3468)

(declare-fun addApplyDifferent!77 (ListLongMap!1557 (_ BitVec 64) V!3249 (_ BitVec 64)) Unit!3468)

(assert (=> b!111850 (= lt!57712 (addApplyDifferent!77 lt!57718 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992))) lt!57715))))

(assert (=> b!111850 (= (apply!101 (+!140 lt!57718 (tuple2!2405 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!57715) (apply!101 lt!57718 lt!57715))))

(declare-fun lt!57709 () Unit!3468)

(assert (=> b!111850 (= lt!57709 lt!57712)))

(declare-fun lt!57704 () ListLongMap!1557)

(assert (=> b!111850 (= lt!57704 (getCurrentListMapNoExtraKeys!105 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun lt!57713 () (_ BitVec 64))

(assert (=> b!111850 (= lt!57713 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!57714 () (_ BitVec 64))

(assert (=> b!111850 (= lt!57714 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!57719 () Unit!3468)

(assert (=> b!111850 (= lt!57719 (addApplyDifferent!77 lt!57704 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) lt!57714))))

(assert (=> b!111850 (= (apply!101 (+!140 lt!57704 (tuple2!2405 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!57714) (apply!101 lt!57704 lt!57714))))

(declare-fun lt!57721 () Unit!3468)

(assert (=> b!111850 (= lt!57721 lt!57719)))

(declare-fun lt!57710 () ListLongMap!1557)

(assert (=> b!111850 (= lt!57710 (getCurrentListMapNoExtraKeys!105 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun lt!57723 () (_ BitVec 64))

(assert (=> b!111850 (= lt!57723 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!57707 () (_ BitVec 64))

(assert (=> b!111850 (= lt!57707 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!111850 (= lt!57722 (addApplyDifferent!77 lt!57710 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992))) lt!57707))))

(assert (=> b!111850 (= (apply!101 (+!140 lt!57710 (tuple2!2405 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!57707) (apply!101 lt!57710 lt!57707))))

(declare-fun b!111851 () Bool)

(assert (=> b!111851 (= e!72734 call!11932)))

(declare-fun d!31781 () Bool)

(assert (=> d!31781 e!72740))

(declare-fun res!55202 () Bool)

(assert (=> d!31781 (=> (not res!55202) (not e!72740))))

(assert (=> d!31781 (= res!55202 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))))

(declare-fun lt!57711 () ListLongMap!1557)

(assert (=> d!31781 (= lt!57724 lt!57711)))

(declare-fun lt!57725 () Unit!3468)

(assert (=> d!31781 (= lt!57725 e!72743)))

(declare-fun c!19941 () Bool)

(assert (=> d!31781 (= c!19941 e!72735)))

(declare-fun res!55203 () Bool)

(assert (=> d!31781 (=> (not res!55203) (not e!72735))))

(assert (=> d!31781 (= res!55203 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(assert (=> d!31781 (= lt!57711 e!72732)))

(assert (=> d!31781 (= c!19944 (and (not (= (bvand (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!31781 (validMask!0 (mask!6824 (v!2936 (underlying!366 thiss!992))))))

(assert (=> d!31781 (= (getCurrentListMap!470 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))) lt!57724)))

(declare-fun b!111852 () Bool)

(declare-fun Unit!3477 () Unit!3468)

(assert (=> b!111852 (= e!72743 Unit!3477)))

(declare-fun bm!11932 () Bool)

(assert (=> bm!11932 (= call!11936 (getCurrentListMapNoExtraKeys!105 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun b!111853 () Bool)

(assert (=> b!111853 (= e!72736 call!11932)))

(declare-fun b!111854 () Bool)

(assert (=> b!111854 (= e!72739 (= (apply!101 lt!57724 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun bm!11933 () Bool)

(assert (=> bm!11933 (= call!11933 call!11936)))

(declare-fun b!111855 () Bool)

(declare-fun res!55206 () Bool)

(assert (=> b!111855 (=> (not res!55206) (not e!72740))))

(assert (=> b!111855 (= res!55206 e!72733)))

(declare-fun res!55198 () Bool)

(assert (=> b!111855 (=> res!55198 e!72733)))

(assert (=> b!111855 (= res!55198 (not e!72731))))

(declare-fun res!55205 () Bool)

(assert (=> b!111855 (=> (not res!55205) (not e!72731))))

(assert (=> b!111855 (= res!55205 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(declare-fun b!111856 () Bool)

(assert (=> b!111856 (= e!72732 (+!140 call!11931 (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992))))))))

(assert (= (and d!31781 c!19944) b!111856))

(assert (= (and d!31781 (not c!19944)) b!111838))

(assert (= (and b!111838 c!19939) b!111851))

(assert (= (and b!111838 (not c!19939)) b!111842))

(assert (= (and b!111842 c!19940) b!111853))

(assert (= (and b!111842 (not c!19940)) b!111845))

(assert (= (or b!111853 b!111845) bm!11928))

(assert (= (or b!111851 bm!11928) bm!11933))

(assert (= (or b!111851 b!111853) bm!11931))

(assert (= (or b!111856 bm!11933) bm!11932))

(assert (= (or b!111856 bm!11931) bm!11927))

(assert (= (and d!31781 res!55203) b!111836))

(assert (= (and d!31781 c!19941) b!111850))

(assert (= (and d!31781 (not c!19941)) b!111852))

(assert (= (and d!31781 res!55202) b!111855))

(assert (= (and b!111855 res!55205) b!111846))

(assert (= (and b!111855 (not res!55198)) b!111844))

(assert (= (and b!111844 res!55204) b!111837))

(assert (= (and b!111855 res!55206) b!111849))

(assert (= (and b!111849 c!19942) b!111839))

(assert (= (and b!111849 (not c!19942)) b!111848))

(assert (= (and b!111839 res!55199) b!111854))

(assert (= (or b!111839 b!111848) bm!11930))

(assert (= (and b!111849 res!55201) b!111843))

(assert (= (and b!111843 c!19943) b!111840))

(assert (= (and b!111843 (not c!19943)) b!111847))

(assert (= (and b!111840 res!55200) b!111841))

(assert (= (or b!111840 b!111847) bm!11929))

(declare-fun b_lambda!5007 () Bool)

(assert (=> (not b_lambda!5007) (not b!111837)))

(assert (=> b!111837 t!5775))

(declare-fun b_and!6873 () Bool)

(assert (= b_and!6853 (and (=> t!5775 result!3541) b_and!6873)))

(assert (=> b!111837 t!5777))

(declare-fun b_and!6875 () Bool)

(assert (= b_and!6855 (and (=> t!5777 result!3545) b_and!6875)))

(assert (=> d!31781 m!127211))

(declare-fun m!127389 () Bool)

(assert (=> b!111850 m!127389))

(declare-fun m!127391 () Bool)

(assert (=> b!111850 m!127391))

(declare-fun m!127393 () Bool)

(assert (=> b!111850 m!127393))

(declare-fun m!127395 () Bool)

(assert (=> b!111850 m!127395))

(declare-fun m!127397 () Bool)

(assert (=> b!111850 m!127397))

(declare-fun m!127399 () Bool)

(assert (=> b!111850 m!127399))

(declare-fun m!127401 () Bool)

(assert (=> b!111850 m!127401))

(assert (=> b!111850 m!127401))

(declare-fun m!127403 () Bool)

(assert (=> b!111850 m!127403))

(assert (=> b!111850 m!127389))

(declare-fun m!127405 () Bool)

(assert (=> b!111850 m!127405))

(declare-fun m!127407 () Bool)

(assert (=> b!111850 m!127407))

(assert (=> b!111850 m!127217))

(declare-fun m!127409 () Bool)

(assert (=> b!111850 m!127409))

(declare-fun m!127411 () Bool)

(assert (=> b!111850 m!127411))

(declare-fun m!127413 () Bool)

(assert (=> b!111850 m!127413))

(declare-fun m!127415 () Bool)

(assert (=> b!111850 m!127415))

(assert (=> b!111850 m!127373))

(assert (=> b!111850 m!127409))

(assert (=> b!111850 m!127413))

(declare-fun m!127417 () Bool)

(assert (=> b!111850 m!127417))

(declare-fun m!127419 () Bool)

(assert (=> b!111841 m!127419))

(assert (=> b!111836 m!127373))

(assert (=> b!111836 m!127373))

(declare-fun m!127421 () Bool)

(assert (=> b!111836 m!127421))

(declare-fun m!127423 () Bool)

(assert (=> bm!11929 m!127423))

(declare-fun m!127425 () Bool)

(assert (=> bm!11927 m!127425))

(declare-fun m!127427 () Bool)

(assert (=> b!111854 m!127427))

(assert (=> b!111844 m!127373))

(assert (=> b!111844 m!127373))

(declare-fun m!127429 () Bool)

(assert (=> b!111844 m!127429))

(declare-fun m!127431 () Bool)

(assert (=> bm!11930 m!127431))

(assert (=> bm!11932 m!127217))

(assert (=> b!111846 m!127373))

(assert (=> b!111846 m!127373))

(assert (=> b!111846 m!127421))

(declare-fun m!127433 () Bool)

(assert (=> b!111837 m!127433))

(assert (=> b!111837 m!127203))

(assert (=> b!111837 m!127433))

(assert (=> b!111837 m!127203))

(declare-fun m!127435 () Bool)

(assert (=> b!111837 m!127435))

(assert (=> b!111837 m!127373))

(assert (=> b!111837 m!127373))

(declare-fun m!127437 () Bool)

(assert (=> b!111837 m!127437))

(declare-fun m!127439 () Bool)

(assert (=> b!111856 m!127439))

(assert (=> b!111626 d!31781))

(declare-fun d!31783 () Bool)

(declare-fun c!19947 () Bool)

(assert (=> d!31783 (= c!19947 ((_ is ValueCellFull!1007) (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun e!72746 () V!3249)

(assert (=> d!31783 (= (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) from!355) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!72746)))

(declare-fun b!111861 () Bool)

(declare-fun get!1354 (ValueCell!1007 V!3249) V!3249)

(assert (=> b!111861 (= e!72746 (get!1354 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) from!355) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!111862 () Bool)

(declare-fun get!1355 (ValueCell!1007 V!3249) V!3249)

(assert (=> b!111862 (= e!72746 (get!1355 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) from!355) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!31783 c!19947) b!111861))

(assert (= (and d!31783 (not c!19947)) b!111862))

(assert (=> b!111861 m!127201))

(assert (=> b!111861 m!127203))

(declare-fun m!127441 () Bool)

(assert (=> b!111861 m!127441))

(assert (=> b!111862 m!127201))

(assert (=> b!111862 m!127203))

(declare-fun m!127443 () Bool)

(assert (=> b!111862 m!127443))

(assert (=> b!111625 d!31783))

(declare-fun d!31785 () Bool)

(declare-fun res!55213 () Bool)

(declare-fun e!72749 () Bool)

(assert (=> d!31785 (=> (not res!55213) (not e!72749))))

(declare-fun simpleValid!77 (LongMapFixedSize!922) Bool)

(assert (=> d!31785 (= res!55213 (simpleValid!77 newMap!16))))

(assert (=> d!31785 (= (valid!433 newMap!16) e!72749)))

(declare-fun b!111869 () Bool)

(declare-fun res!55214 () Bool)

(assert (=> b!111869 (=> (not res!55214) (not e!72749))))

(declare-fun arrayCountValidKeys!0 (array!4379 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!111869 (= res!55214 (= (arrayCountValidKeys!0 (_keys!4364 newMap!16) #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))) (_size!510 newMap!16)))))

(declare-fun b!111870 () Bool)

(declare-fun res!55215 () Bool)

(assert (=> b!111870 (=> (not res!55215) (not e!72749))))

(assert (=> b!111870 (= res!55215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4364 newMap!16) (mask!6824 newMap!16)))))

(declare-fun b!111871 () Bool)

(assert (=> b!111871 (= e!72749 (arrayNoDuplicates!0 (_keys!4364 newMap!16) #b00000000000000000000000000000000 Nil!1627))))

(assert (= (and d!31785 res!55213) b!111869))

(assert (= (and b!111869 res!55214) b!111870))

(assert (= (and b!111870 res!55215) b!111871))

(declare-fun m!127445 () Bool)

(assert (=> d!31785 m!127445))

(declare-fun m!127447 () Bool)

(assert (=> b!111869 m!127447))

(declare-fun m!127449 () Bool)

(assert (=> b!111870 m!127449))

(declare-fun m!127451 () Bool)

(assert (=> b!111871 m!127451))

(assert (=> b!111633 d!31785))

(declare-fun d!31787 () Bool)

(assert (=> d!31787 (= (array_inv!1311 (_keys!4364 newMap!16)) (bvsge (size!2333 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!111616 d!31787))

(declare-fun d!31789 () Bool)

(assert (=> d!31789 (= (array_inv!1312 (_values!2630 newMap!16)) (bvsge (size!2334 (_values!2630 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!111616 d!31789))

(declare-fun bm!11936 () Bool)

(declare-fun call!11939 () Bool)

(assert (=> bm!11936 (= call!11939 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4364 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun d!31791 () Bool)

(declare-fun res!55221 () Bool)

(declare-fun e!72756 () Bool)

(assert (=> d!31791 (=> res!55221 e!72756)))

(assert (=> d!31791 (= res!55221 (bvsge #b00000000000000000000000000000000 (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(assert (=> d!31791 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992)))) e!72756)))

(declare-fun b!111880 () Bool)

(declare-fun e!72757 () Bool)

(assert (=> b!111880 (= e!72757 call!11939)))

(declare-fun b!111881 () Bool)

(declare-fun e!72758 () Bool)

(assert (=> b!111881 (= e!72758 call!11939)))

(declare-fun b!111882 () Bool)

(assert (=> b!111882 (= e!72756 e!72758)))

(declare-fun c!19950 () Bool)

(assert (=> b!111882 (= c!19950 (validKeyInArray!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!111883 () Bool)

(assert (=> b!111883 (= e!72758 e!72757)))

(declare-fun lt!57732 () (_ BitVec 64))

(assert (=> b!111883 (= lt!57732 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!57734 () Unit!3468)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4379 (_ BitVec 64) (_ BitVec 32)) Unit!3468)

(assert (=> b!111883 (= lt!57734 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) lt!57732 #b00000000000000000000000000000000))))

(assert (=> b!111883 (arrayContainsKey!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) lt!57732 #b00000000000000000000000000000000)))

(declare-fun lt!57733 () Unit!3468)

(assert (=> b!111883 (= lt!57733 lt!57734)))

(declare-fun res!55220 () Bool)

(declare-datatypes ((SeekEntryResult!265 0))(
  ( (MissingZero!265 (index!3211 (_ BitVec 32))) (Found!265 (index!3212 (_ BitVec 32))) (Intermediate!265 (undefined!1077 Bool) (index!3213 (_ BitVec 32)) (x!14096 (_ BitVec 32))) (Undefined!265) (MissingVacant!265 (index!3214 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4379 (_ BitVec 32)) SeekEntryResult!265)

(assert (=> b!111883 (= res!55220 (= (seekEntryOrOpen!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b00000000000000000000000000000000) (_keys!4364 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992)))) (Found!265 #b00000000000000000000000000000000)))))

(assert (=> b!111883 (=> (not res!55220) (not e!72757))))

(assert (= (and d!31791 (not res!55221)) b!111882))

(assert (= (and b!111882 c!19950) b!111883))

(assert (= (and b!111882 (not c!19950)) b!111881))

(assert (= (and b!111883 res!55220) b!111880))

(assert (= (or b!111880 b!111881) bm!11936))

(declare-fun m!127453 () Bool)

(assert (=> bm!11936 m!127453))

(declare-fun m!127455 () Bool)

(assert (=> b!111882 m!127455))

(assert (=> b!111882 m!127455))

(declare-fun m!127457 () Bool)

(assert (=> b!111882 m!127457))

(assert (=> b!111883 m!127455))

(declare-fun m!127459 () Bool)

(assert (=> b!111883 m!127459))

(declare-fun m!127461 () Bool)

(assert (=> b!111883 m!127461))

(assert (=> b!111883 m!127455))

(declare-fun m!127463 () Bool)

(assert (=> b!111883 m!127463))

(assert (=> b!111629 d!31791))

(declare-fun d!31793 () Bool)

(declare-fun e!72761 () Bool)

(assert (=> d!31793 e!72761))

(declare-fun res!55227 () Bool)

(assert (=> d!31793 (=> (not res!55227) (not e!72761))))

(declare-fun lt!57743 () ListLongMap!1557)

(assert (=> d!31793 (= res!55227 (contains!831 lt!57743 (_1!1213 lt!57568)))))

(declare-fun lt!57746 () List!1629)

(assert (=> d!31793 (= lt!57743 (ListLongMap!1558 lt!57746))))

(declare-fun lt!57745 () Unit!3468)

(declare-fun lt!57744 () Unit!3468)

(assert (=> d!31793 (= lt!57745 lt!57744)))

(declare-datatypes ((Option!163 0))(
  ( (Some!162 (v!2942 V!3249)) (None!161) )
))
(declare-fun getValueByKey!157 (List!1629 (_ BitVec 64)) Option!163)

(assert (=> d!31793 (= (getValueByKey!157 lt!57746 (_1!1213 lt!57568)) (Some!162 (_2!1213 lt!57568)))))

(declare-fun lemmaContainsTupThenGetReturnValue!76 (List!1629 (_ BitVec 64) V!3249) Unit!3468)

(assert (=> d!31793 (= lt!57744 (lemmaContainsTupThenGetReturnValue!76 lt!57746 (_1!1213 lt!57568) (_2!1213 lt!57568)))))

(declare-fun insertStrictlySorted!79 (List!1629 (_ BitVec 64) V!3249) List!1629)

(assert (=> d!31793 (= lt!57746 (insertStrictlySorted!79 (toList!794 lt!57569) (_1!1213 lt!57568) (_2!1213 lt!57568)))))

(assert (=> d!31793 (= (+!140 lt!57569 lt!57568) lt!57743)))

(declare-fun b!111888 () Bool)

(declare-fun res!55226 () Bool)

(assert (=> b!111888 (=> (not res!55226) (not e!72761))))

(assert (=> b!111888 (= res!55226 (= (getValueByKey!157 (toList!794 lt!57743) (_1!1213 lt!57568)) (Some!162 (_2!1213 lt!57568))))))

(declare-fun b!111889 () Bool)

(declare-fun contains!833 (List!1629 tuple2!2404) Bool)

(assert (=> b!111889 (= e!72761 (contains!833 (toList!794 lt!57743) lt!57568))))

(assert (= (and d!31793 res!55227) b!111888))

(assert (= (and b!111888 res!55226) b!111889))

(declare-fun m!127465 () Bool)

(assert (=> d!31793 m!127465))

(declare-fun m!127467 () Bool)

(assert (=> d!31793 m!127467))

(declare-fun m!127469 () Bool)

(assert (=> d!31793 m!127469))

(declare-fun m!127471 () Bool)

(assert (=> d!31793 m!127471))

(declare-fun m!127473 () Bool)

(assert (=> b!111888 m!127473))

(declare-fun m!127475 () Bool)

(assert (=> b!111889 m!127475))

(assert (=> b!111615 d!31793))

(declare-fun b!111914 () Bool)

(declare-fun e!72782 () Bool)

(declare-fun e!72777 () Bool)

(assert (=> b!111914 (= e!72782 e!72777)))

(assert (=> b!111914 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(declare-fun res!55239 () Bool)

(declare-fun lt!57766 () ListLongMap!1557)

(assert (=> b!111914 (= res!55239 (contains!831 lt!57766 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!111914 (=> (not res!55239) (not e!72777))))

(declare-fun b!111915 () Bool)

(declare-fun e!72781 () Bool)

(assert (=> b!111915 (= e!72781 (validKeyInArray!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!111915 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!111916 () Bool)

(declare-fun e!72776 () ListLongMap!1557)

(declare-fun e!72778 () ListLongMap!1557)

(assert (=> b!111916 (= e!72776 e!72778)))

(declare-fun c!19962 () Bool)

(assert (=> b!111916 (= c!19962 (validKeyInArray!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!111917 () Bool)

(declare-fun call!11942 () ListLongMap!1557)

(assert (=> b!111917 (= e!72778 call!11942)))

(declare-fun b!111918 () Bool)

(assert (=> b!111918 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(assert (=> b!111918 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2334 (_values!2630 (v!2936 (underlying!366 thiss!992))))))))

(assert (=> b!111918 (= e!72777 (= (apply!101 lt!57766 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!111919 () Bool)

(declare-fun e!72780 () Bool)

(declare-fun isEmpty!383 (ListLongMap!1557) Bool)

(assert (=> b!111919 (= e!72780 (isEmpty!383 lt!57766))))

(declare-fun b!111920 () Bool)

(assert (=> b!111920 (= e!72780 (= lt!57766 (getCurrentListMapNoExtraKeys!105 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))))))))

(declare-fun d!31795 () Bool)

(declare-fun e!72779 () Bool)

(assert (=> d!31795 e!72779))

(declare-fun res!55236 () Bool)

(assert (=> d!31795 (=> (not res!55236) (not e!72779))))

(assert (=> d!31795 (= res!55236 (not (contains!831 lt!57766 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31795 (= lt!57766 e!72776)))

(declare-fun c!19959 () Bool)

(assert (=> d!31795 (= c!19959 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(assert (=> d!31795 (validMask!0 (mask!6824 (v!2936 (underlying!366 thiss!992))))))

(assert (=> d!31795 (= (getCurrentListMapNoExtraKeys!105 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))) lt!57766)))

(declare-fun b!111921 () Bool)

(assert (=> b!111921 (= e!72776 (ListLongMap!1558 Nil!1626))))

(declare-fun b!111922 () Bool)

(assert (=> b!111922 (= e!72779 e!72782)))

(declare-fun c!19961 () Bool)

(assert (=> b!111922 (= c!19961 e!72781)))

(declare-fun res!55238 () Bool)

(assert (=> b!111922 (=> (not res!55238) (not e!72781))))

(assert (=> b!111922 (= res!55238 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(declare-fun b!111923 () Bool)

(declare-fun lt!57767 () Unit!3468)

(declare-fun lt!57765 () Unit!3468)

(assert (=> b!111923 (= lt!57767 lt!57765)))

(declare-fun lt!57761 () V!3249)

(declare-fun lt!57764 () ListLongMap!1557)

(declare-fun lt!57762 () (_ BitVec 64))

(declare-fun lt!57763 () (_ BitVec 64))

(assert (=> b!111923 (not (contains!831 (+!140 lt!57764 (tuple2!2405 lt!57762 lt!57761)) lt!57763))))

(declare-fun addStillNotContains!50 (ListLongMap!1557 (_ BitVec 64) V!3249 (_ BitVec 64)) Unit!3468)

(assert (=> b!111923 (= lt!57765 (addStillNotContains!50 lt!57764 lt!57762 lt!57761 lt!57763))))

(assert (=> b!111923 (= lt!57763 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!111923 (= lt!57761 (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111923 (= lt!57762 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!111923 (= lt!57764 call!11942)))

(assert (=> b!111923 (= e!72778 (+!140 call!11942 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!111924 () Bool)

(declare-fun res!55237 () Bool)

(assert (=> b!111924 (=> (not res!55237) (not e!72779))))

(assert (=> b!111924 (= res!55237 (not (contains!831 lt!57766 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!111925 () Bool)

(assert (=> b!111925 (= e!72782 e!72780)))

(declare-fun c!19960 () Bool)

(assert (=> b!111925 (= c!19960 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(declare-fun bm!11939 () Bool)

(assert (=> bm!11939 (= call!11942 (getCurrentListMapNoExtraKeys!105 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))))))

(assert (= (and d!31795 c!19959) b!111921))

(assert (= (and d!31795 (not c!19959)) b!111916))

(assert (= (and b!111916 c!19962) b!111923))

(assert (= (and b!111916 (not c!19962)) b!111917))

(assert (= (or b!111923 b!111917) bm!11939))

(assert (= (and d!31795 res!55236) b!111924))

(assert (= (and b!111924 res!55237) b!111922))

(assert (= (and b!111922 res!55238) b!111915))

(assert (= (and b!111922 c!19961) b!111914))

(assert (= (and b!111922 (not c!19961)) b!111925))

(assert (= (and b!111914 res!55239) b!111918))

(assert (= (and b!111925 c!19960) b!111920))

(assert (= (and b!111925 (not c!19960)) b!111919))

(declare-fun b_lambda!5009 () Bool)

(assert (=> (not b_lambda!5009) (not b!111918)))

(assert (=> b!111918 t!5775))

(declare-fun b_and!6877 () Bool)

(assert (= b_and!6873 (and (=> t!5775 result!3541) b_and!6877)))

(assert (=> b!111918 t!5777))

(declare-fun b_and!6879 () Bool)

(assert (= b_and!6875 (and (=> t!5777 result!3545) b_and!6879)))

(declare-fun b_lambda!5011 () Bool)

(assert (=> (not b_lambda!5011) (not b!111923)))

(assert (=> b!111923 t!5775))

(declare-fun b_and!6881 () Bool)

(assert (= b_and!6877 (and (=> t!5775 result!3541) b_and!6881)))

(assert (=> b!111923 t!5777))

(declare-fun b_and!6883 () Bool)

(assert (= b_and!6879 (and (=> t!5777 result!3545) b_and!6883)))

(declare-fun m!127477 () Bool)

(assert (=> b!111920 m!127477))

(assert (=> bm!11939 m!127477))

(declare-fun m!127479 () Bool)

(assert (=> d!31795 m!127479))

(assert (=> d!31795 m!127211))

(assert (=> b!111916 m!127373))

(assert (=> b!111916 m!127373))

(assert (=> b!111916 m!127421))

(declare-fun m!127481 () Bool)

(assert (=> b!111919 m!127481))

(declare-fun m!127483 () Bool)

(assert (=> b!111924 m!127483))

(assert (=> b!111923 m!127203))

(declare-fun m!127485 () Bool)

(assert (=> b!111923 m!127485))

(assert (=> b!111923 m!127433))

(assert (=> b!111923 m!127203))

(assert (=> b!111923 m!127435))

(declare-fun m!127487 () Bool)

(assert (=> b!111923 m!127487))

(assert (=> b!111923 m!127433))

(assert (=> b!111923 m!127373))

(declare-fun m!127489 () Bool)

(assert (=> b!111923 m!127489))

(declare-fun m!127491 () Bool)

(assert (=> b!111923 m!127491))

(assert (=> b!111923 m!127489))

(assert (=> b!111914 m!127373))

(assert (=> b!111914 m!127373))

(declare-fun m!127493 () Bool)

(assert (=> b!111914 m!127493))

(assert (=> b!111915 m!127373))

(assert (=> b!111915 m!127373))

(assert (=> b!111915 m!127421))

(assert (=> b!111918 m!127203))

(assert (=> b!111918 m!127433))

(assert (=> b!111918 m!127203))

(assert (=> b!111918 m!127435))

(assert (=> b!111918 m!127433))

(assert (=> b!111918 m!127373))

(assert (=> b!111918 m!127373))

(declare-fun m!127495 () Bool)

(assert (=> b!111918 m!127495))

(assert (=> b!111615 d!31795))

(declare-fun d!31797 () Bool)

(declare-fun e!72783 () Bool)

(assert (=> d!31797 e!72783))

(declare-fun res!55241 () Bool)

(assert (=> d!31797 (=> (not res!55241) (not e!72783))))

(declare-fun lt!57768 () ListLongMap!1557)

(assert (=> d!31797 (= res!55241 (contains!831 lt!57768 (_1!1213 lt!57571)))))

(declare-fun lt!57771 () List!1629)

(assert (=> d!31797 (= lt!57768 (ListLongMap!1558 lt!57771))))

(declare-fun lt!57770 () Unit!3468)

(declare-fun lt!57769 () Unit!3468)

(assert (=> d!31797 (= lt!57770 lt!57769)))

(assert (=> d!31797 (= (getValueByKey!157 lt!57771 (_1!1213 lt!57571)) (Some!162 (_2!1213 lt!57571)))))

(assert (=> d!31797 (= lt!57769 (lemmaContainsTupThenGetReturnValue!76 lt!57771 (_1!1213 lt!57571) (_2!1213 lt!57571)))))

(assert (=> d!31797 (= lt!57771 (insertStrictlySorted!79 (toList!794 (+!140 lt!57569 lt!57568)) (_1!1213 lt!57571) (_2!1213 lt!57571)))))

(assert (=> d!31797 (= (+!140 (+!140 lt!57569 lt!57568) lt!57571) lt!57768)))

(declare-fun b!111926 () Bool)

(declare-fun res!55240 () Bool)

(assert (=> b!111926 (=> (not res!55240) (not e!72783))))

(assert (=> b!111926 (= res!55240 (= (getValueByKey!157 (toList!794 lt!57768) (_1!1213 lt!57571)) (Some!162 (_2!1213 lt!57571))))))

(declare-fun b!111927 () Bool)

(assert (=> b!111927 (= e!72783 (contains!833 (toList!794 lt!57768) lt!57571))))

(assert (= (and d!31797 res!55241) b!111926))

(assert (= (and b!111926 res!55240) b!111927))

(declare-fun m!127497 () Bool)

(assert (=> d!31797 m!127497))

(declare-fun m!127499 () Bool)

(assert (=> d!31797 m!127499))

(declare-fun m!127501 () Bool)

(assert (=> d!31797 m!127501))

(declare-fun m!127503 () Bool)

(assert (=> d!31797 m!127503))

(declare-fun m!127505 () Bool)

(assert (=> b!111926 m!127505))

(declare-fun m!127507 () Bool)

(assert (=> b!111927 m!127507))

(assert (=> b!111615 d!31797))

(declare-fun d!31799 () Bool)

(declare-fun e!72784 () Bool)

(assert (=> d!31799 e!72784))

(declare-fun res!55243 () Bool)

(assert (=> d!31799 (=> (not res!55243) (not e!72784))))

(declare-fun lt!57772 () ListLongMap!1557)

(assert (=> d!31799 (= res!55243 (contains!831 lt!57772 (_1!1213 lt!57568)))))

(declare-fun lt!57775 () List!1629)

(assert (=> d!31799 (= lt!57772 (ListLongMap!1558 lt!57775))))

(declare-fun lt!57774 () Unit!3468)

(declare-fun lt!57773 () Unit!3468)

(assert (=> d!31799 (= lt!57774 lt!57773)))

(assert (=> d!31799 (= (getValueByKey!157 lt!57775 (_1!1213 lt!57568)) (Some!162 (_2!1213 lt!57568)))))

(assert (=> d!31799 (= lt!57773 (lemmaContainsTupThenGetReturnValue!76 lt!57775 (_1!1213 lt!57568) (_2!1213 lt!57568)))))

(assert (=> d!31799 (= lt!57775 (insertStrictlySorted!79 (toList!794 (+!140 lt!57569 lt!57571)) (_1!1213 lt!57568) (_2!1213 lt!57568)))))

(assert (=> d!31799 (= (+!140 (+!140 lt!57569 lt!57571) lt!57568) lt!57772)))

(declare-fun b!111928 () Bool)

(declare-fun res!55242 () Bool)

(assert (=> b!111928 (=> (not res!55242) (not e!72784))))

(assert (=> b!111928 (= res!55242 (= (getValueByKey!157 (toList!794 lt!57772) (_1!1213 lt!57568)) (Some!162 (_2!1213 lt!57568))))))

(declare-fun b!111929 () Bool)

(assert (=> b!111929 (= e!72784 (contains!833 (toList!794 lt!57772) lt!57568))))

(assert (= (and d!31799 res!55243) b!111928))

(assert (= (and b!111928 res!55242) b!111929))

(declare-fun m!127509 () Bool)

(assert (=> d!31799 m!127509))

(declare-fun m!127511 () Bool)

(assert (=> d!31799 m!127511))

(declare-fun m!127513 () Bool)

(assert (=> d!31799 m!127513))

(declare-fun m!127515 () Bool)

(assert (=> d!31799 m!127515))

(declare-fun m!127517 () Bool)

(assert (=> b!111928 m!127517))

(declare-fun m!127519 () Bool)

(assert (=> b!111929 m!127519))

(assert (=> b!111615 d!31799))

(declare-fun d!31801 () Bool)

(declare-fun e!72785 () Bool)

(assert (=> d!31801 e!72785))

(declare-fun res!55245 () Bool)

(assert (=> d!31801 (=> (not res!55245) (not e!72785))))

(declare-fun lt!57776 () ListLongMap!1557)

(assert (=> d!31801 (= res!55245 (contains!831 lt!57776 (_1!1213 lt!57571)))))

(declare-fun lt!57779 () List!1629)

(assert (=> d!31801 (= lt!57776 (ListLongMap!1558 lt!57779))))

(declare-fun lt!57778 () Unit!3468)

(declare-fun lt!57777 () Unit!3468)

(assert (=> d!31801 (= lt!57778 lt!57777)))

(assert (=> d!31801 (= (getValueByKey!157 lt!57779 (_1!1213 lt!57571)) (Some!162 (_2!1213 lt!57571)))))

(assert (=> d!31801 (= lt!57777 (lemmaContainsTupThenGetReturnValue!76 lt!57779 (_1!1213 lt!57571) (_2!1213 lt!57571)))))

(assert (=> d!31801 (= lt!57779 (insertStrictlySorted!79 (toList!794 lt!57569) (_1!1213 lt!57571) (_2!1213 lt!57571)))))

(assert (=> d!31801 (= (+!140 lt!57569 lt!57571) lt!57776)))

(declare-fun b!111930 () Bool)

(declare-fun res!55244 () Bool)

(assert (=> b!111930 (=> (not res!55244) (not e!72785))))

(assert (=> b!111930 (= res!55244 (= (getValueByKey!157 (toList!794 lt!57776) (_1!1213 lt!57571)) (Some!162 (_2!1213 lt!57571))))))

(declare-fun b!111931 () Bool)

(assert (=> b!111931 (= e!72785 (contains!833 (toList!794 lt!57776) lt!57571))))

(assert (= (and d!31801 res!55245) b!111930))

(assert (= (and b!111930 res!55244) b!111931))

(declare-fun m!127521 () Bool)

(assert (=> d!31801 m!127521))

(declare-fun m!127523 () Bool)

(assert (=> d!31801 m!127523))

(declare-fun m!127525 () Bool)

(assert (=> d!31801 m!127525))

(declare-fun m!127527 () Bool)

(assert (=> d!31801 m!127527))

(declare-fun m!127529 () Bool)

(assert (=> b!111930 m!127529))

(declare-fun m!127531 () Bool)

(assert (=> b!111931 m!127531))

(assert (=> b!111615 d!31801))

(declare-fun d!31803 () Bool)

(assert (=> d!31803 (= (+!140 (+!140 lt!57569 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) (+!140 (+!140 lt!57569 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)))))

(declare-fun lt!57782 () Unit!3468)

(declare-fun choose!705 (ListLongMap!1557 (_ BitVec 64) V!3249 (_ BitVec 64) V!3249) Unit!3468)

(assert (=> d!31803 (= lt!57782 (choose!705 lt!57569 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))

(assert (=> d!31803 (not (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!31803 (= (addCommutativeForDiffKeys!52 lt!57569 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))) lt!57782)))

(declare-fun bs!4606 () Bool)

(assert (= bs!4606 d!31803))

(assert (=> bs!4606 m!127199))

(declare-fun m!127533 () Bool)

(assert (=> bs!4606 m!127533))

(declare-fun m!127535 () Bool)

(assert (=> bs!4606 m!127535))

(declare-fun m!127537 () Bool)

(assert (=> bs!4606 m!127537))

(declare-fun m!127539 () Bool)

(assert (=> bs!4606 m!127539))

(declare-fun m!127541 () Bool)

(assert (=> bs!4606 m!127541))

(assert (=> bs!4606 m!127535))

(assert (=> bs!4606 m!127539))

(assert (=> b!111615 d!31803))

(declare-fun d!31805 () Bool)

(assert (=> d!31805 (= (validMask!0 (mask!6824 (v!2936 (underlying!366 thiss!992)))) (and (or (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000001111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000011111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000001111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000011111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000001111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000011111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000000001111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000000011111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000000111111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000001111111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000011111111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000000111111111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000001111111111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000011111111111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000000111111111111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000001111111111111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000011111111111111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000000111111111111111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000001111111111111111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000011111111111111111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00000111111111111111111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00001111111111111111111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00011111111111111111111111111111) (= (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6824 (v!2936 (underlying!366 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!111615 d!31805))

(declare-fun d!31807 () Bool)

(declare-fun e!72790 () Bool)

(assert (=> d!31807 e!72790))

(declare-fun res!55248 () Bool)

(assert (=> d!31807 (=> res!55248 e!72790)))

(declare-fun lt!57791 () Bool)

(assert (=> d!31807 (= res!55248 (not lt!57791))))

(declare-fun lt!57792 () Bool)

(assert (=> d!31807 (= lt!57791 lt!57792)))

(declare-fun lt!57793 () Unit!3468)

(declare-fun e!72791 () Unit!3468)

(assert (=> d!31807 (= lt!57793 e!72791)))

(declare-fun c!19965 () Bool)

(assert (=> d!31807 (= c!19965 lt!57792)))

(declare-fun containsKey!161 (List!1629 (_ BitVec 64)) Bool)

(assert (=> d!31807 (= lt!57792 (containsKey!161 (toList!794 lt!57567) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (=> d!31807 (= (contains!831 lt!57567 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) lt!57791)))

(declare-fun b!111938 () Bool)

(declare-fun lt!57794 () Unit!3468)

(assert (=> b!111938 (= e!72791 lt!57794)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!110 (List!1629 (_ BitVec 64)) Unit!3468)

(assert (=> b!111938 (= lt!57794 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 lt!57567) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun isDefined!111 (Option!163) Bool)

(assert (=> b!111938 (isDefined!111 (getValueByKey!157 (toList!794 lt!57567) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun b!111939 () Bool)

(declare-fun Unit!3478 () Unit!3468)

(assert (=> b!111939 (= e!72791 Unit!3478)))

(declare-fun b!111940 () Bool)

(assert (=> b!111940 (= e!72790 (isDefined!111 (getValueByKey!157 (toList!794 lt!57567) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355))))))

(assert (= (and d!31807 c!19965) b!111938))

(assert (= (and d!31807 (not c!19965)) b!111939))

(assert (= (and d!31807 (not res!55248)) b!111940))

(assert (=> d!31807 m!127199))

(declare-fun m!127543 () Bool)

(assert (=> d!31807 m!127543))

(assert (=> b!111938 m!127199))

(declare-fun m!127545 () Bool)

(assert (=> b!111938 m!127545))

(assert (=> b!111938 m!127199))

(declare-fun m!127547 () Bool)

(assert (=> b!111938 m!127547))

(assert (=> b!111938 m!127547))

(declare-fun m!127549 () Bool)

(assert (=> b!111938 m!127549))

(assert (=> b!111940 m!127199))

(assert (=> b!111940 m!127547))

(assert (=> b!111940 m!127547))

(assert (=> b!111940 m!127549))

(assert (=> b!111628 d!31807))

(declare-fun b!112021 () Bool)

(declare-fun res!55285 () Bool)

(declare-fun call!12008 () Bool)

(assert (=> b!112021 (= res!55285 call!12008)))

(declare-fun e!72836 () Bool)

(assert (=> b!112021 (=> (not res!55285) (not e!72836))))

(declare-fun bm!11988 () Bool)

(declare-fun call!11991 () Bool)

(declare-fun call!12010 () Bool)

(assert (=> bm!11988 (= call!11991 call!12010)))

(declare-fun b!112023 () Bool)

(declare-fun lt!57862 () SeekEntryResult!265)

(assert (=> b!112023 (= e!72836 (= (select (arr!2074 (_keys!4364 newMap!16)) (index!3212 lt!57862)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun b!112024 () Bool)

(declare-fun e!72838 () tuple2!2406)

(declare-fun lt!57850 () tuple2!2406)

(assert (=> b!112024 (= e!72838 (tuple2!2407 (_1!1214 lt!57850) (_2!1214 lt!57850)))))

(declare-fun call!12000 () tuple2!2406)

(assert (=> b!112024 (= lt!57850 call!12000)))

(declare-fun b!112025 () Bool)

(declare-fun res!55287 () Bool)

(assert (=> b!112025 (= res!55287 call!11991)))

(declare-fun e!72849 () Bool)

(assert (=> b!112025 (=> (not res!55287) (not e!72849))))

(declare-fun bm!11989 () Bool)

(declare-fun c!19993 () Bool)

(declare-fun c!20000 () Bool)

(assert (=> bm!11989 (= c!19993 c!20000)))

(declare-fun e!72850 () ListLongMap!1557)

(declare-fun call!12011 () Bool)

(declare-fun lt!57865 () SeekEntryResult!265)

(assert (=> bm!11989 (= call!12011 (contains!831 e!72850 (ite c!20000 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (select (arr!2074 (_keys!4364 newMap!16)) (index!3212 lt!57865)))))))

(declare-fun bm!11990 () Bool)

(declare-fun call!12012 () ListLongMap!1557)

(declare-fun lt!57849 () tuple2!2406)

(assert (=> bm!11990 (= call!12012 (map!1284 (_2!1214 lt!57849)))))

(declare-fun b!112026 () Bool)

(declare-fun e!72839 () Bool)

(declare-fun e!72842 () Bool)

(assert (=> b!112026 (= e!72839 e!72842)))

(declare-fun res!55284 () Bool)

(declare-fun call!12014 () Bool)

(assert (=> b!112026 (= res!55284 call!12014)))

(assert (=> b!112026 (=> (not res!55284) (not e!72842))))

(declare-fun b!112027 () Bool)

(declare-fun e!72843 () Bool)

(declare-fun call!11994 () Bool)

(assert (=> b!112027 (= e!72843 (not call!11994))))

(declare-fun lt!57857 () SeekEntryResult!265)

(declare-fun b!112028 () Bool)

(assert (=> b!112028 (= e!72849 (= (select (arr!2074 (_keys!4364 newMap!16)) (index!3212 lt!57857)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun call!12005 () Bool)

(declare-fun bm!11991 () Bool)

(assert (=> bm!11991 (= call!12005 (arrayContainsKey!0 (_keys!4364 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!112029 () Bool)

(declare-fun e!72852 () tuple2!2406)

(declare-fun e!72851 () tuple2!2406)

(assert (=> b!112029 (= e!72852 e!72851)))

(declare-fun c!19996 () Bool)

(assert (=> b!112029 (= c!19996 (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!11992 () Bool)

(assert (=> bm!11992 (= call!11994 call!12005)))

(declare-fun b!112030 () Bool)

(declare-fun c!20003 () Bool)

(declare-fun lt!57854 () SeekEntryResult!265)

(assert (=> b!112030 (= c!20003 ((_ is MissingVacant!265) lt!57854))))

(declare-fun e!72846 () Bool)

(declare-fun e!72854 () Bool)

(assert (=> b!112030 (= e!72846 e!72854)))

(declare-fun b!112031 () Bool)

(declare-fun e!72834 () Bool)

(declare-fun call!12003 () Bool)

(assert (=> b!112031 (= e!72834 (not call!12003))))

(declare-fun b!112032 () Bool)

(declare-fun res!55280 () Bool)

(assert (=> b!112032 (=> (not res!55280) (not e!72843))))

(declare-fun lt!57873 () SeekEntryResult!265)

(assert (=> b!112032 (= res!55280 (= (select (arr!2074 (_keys!4364 newMap!16)) (index!3211 lt!57873)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112033 () Bool)

(declare-fun lt!57853 () tuple2!2406)

(assert (=> b!112033 (= lt!57853 call!12000)))

(declare-fun e!72845 () tuple2!2406)

(assert (=> b!112033 (= e!72845 (tuple2!2407 (_1!1214 lt!57853) (_2!1214 lt!57853)))))

(declare-fun call!11992 () SeekEntryResult!265)

(declare-fun bm!11993 () Bool)

(assert (=> bm!11993 (= call!11992 (seekEntryOrOpen!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (_keys!4364 newMap!16) (mask!6824 newMap!16)))))

(declare-fun b!112034 () Bool)

(declare-fun c!20001 () Bool)

(assert (=> b!112034 (= c!20001 ((_ is MissingVacant!265) lt!57873))))

(declare-fun e!72847 () Bool)

(assert (=> b!112034 (= e!72847 e!72839)))

(declare-fun b!112035 () Bool)

(declare-fun e!72853 () Bool)

(declare-fun e!72837 () Bool)

(assert (=> b!112035 (= e!72853 e!72837)))

(declare-fun res!55286 () Bool)

(assert (=> b!112035 (= res!55286 (contains!831 call!12012 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (=> b!112035 (=> (not res!55286) (not e!72837))))

(declare-fun bm!11994 () Bool)

(assert (=> bm!11994 (= call!12003 call!12005)))

(declare-fun bm!11995 () Bool)

(declare-fun call!11995 () ListLongMap!1557)

(assert (=> bm!11995 (= call!11995 (map!1284 newMap!16))))

(declare-fun b!112036 () Bool)

(declare-fun lt!57859 () Unit!3468)

(declare-fun lt!57851 () Unit!3468)

(assert (=> b!112036 (= lt!57859 lt!57851)))

(declare-fun call!11993 () ListLongMap!1557)

(declare-fun call!11997 () ListLongMap!1557)

(assert (=> b!112036 (= call!11993 call!11997)))

(declare-fun lt!57860 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!50 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 V!3249 Int) Unit!3468)

(assert (=> b!112036 (= lt!57851 (lemmaChangeZeroKeyThenAddPairToListMap!50 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) lt!57860 (zeroValue!2516 newMap!16) lt!57575 (minValue!2516 newMap!16) (defaultEntry!2647 newMap!16)))))

(assert (=> b!112036 (= lt!57860 (bvor (extraKeys!2440 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!112036 (= e!72851 (tuple2!2407 true (LongMapFixedSize!923 (defaultEntry!2647 newMap!16) (mask!6824 newMap!16) (bvor (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) lt!57575 (minValue!2516 newMap!16) (_size!510 newMap!16) (_keys!4364 newMap!16) (_values!2630 newMap!16) (_vacant!510 newMap!16))))))

(declare-fun b!112037 () Bool)

(declare-fun res!55289 () Bool)

(assert (=> b!112037 (= res!55289 (= (select (arr!2074 (_keys!4364 newMap!16)) (index!3214 lt!57873)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112037 (=> (not res!55289) (not e!72842))))

(declare-fun b!112022 () Bool)

(declare-fun res!55290 () Bool)

(declare-fun e!72848 () Bool)

(assert (=> b!112022 (=> (not res!55290) (not e!72848))))

(assert (=> b!112022 (= res!55290 (= (select (arr!2074 (_keys!4364 newMap!16)) (index!3211 lt!57854)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!31809 () Bool)

(declare-fun e!72844 () Bool)

(assert (=> d!31809 e!72844))

(declare-fun res!55288 () Bool)

(assert (=> d!31809 (=> (not res!55288) (not e!72844))))

(assert (=> d!31809 (= res!55288 (valid!433 (_2!1214 lt!57849)))))

(assert (=> d!31809 (= lt!57849 e!72852)))

(declare-fun c!20002 () Bool)

(assert (=> d!31809 (= c!20002 (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (bvneg (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355))))))

(assert (=> d!31809 (valid!433 newMap!16)))

(assert (=> d!31809 (= (update!164 newMap!16 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575) lt!57849)))

(declare-fun b!112038 () Bool)

(declare-fun e!72840 () Unit!3468)

(declare-fun lt!57852 () Unit!3468)

(assert (=> b!112038 (= e!72840 lt!57852)))

(declare-fun call!12002 () Unit!3468)

(assert (=> b!112038 (= lt!57852 call!12002)))

(declare-fun call!11998 () SeekEntryResult!265)

(assert (=> b!112038 (= lt!57862 call!11998)))

(declare-fun res!55279 () Bool)

(assert (=> b!112038 (= res!55279 ((_ is Found!265) lt!57862))))

(assert (=> b!112038 (=> (not res!55279) (not e!72836))))

(assert (=> b!112038 e!72836))

(declare-fun bm!11996 () Bool)

(assert (=> bm!11996 (= call!12014 call!11991)))

(declare-fun b!112039 () Bool)

(declare-fun lt!57872 () Unit!3468)

(declare-fun lt!57870 () Unit!3468)

(assert (=> b!112039 (= lt!57872 lt!57870)))

(assert (=> b!112039 call!12011))

(declare-fun lt!57868 () array!4381)

(declare-fun lemmaValidKeyInArrayIsInListMap!109 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 32) Int) Unit!3468)

(assert (=> b!112039 (= lt!57870 (lemmaValidKeyInArrayIsInListMap!109 (_keys!4364 newMap!16) lt!57868 (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (index!3212 lt!57865) (defaultEntry!2647 newMap!16)))))

(assert (=> b!112039 (= lt!57868 (array!4382 (store (arr!2075 (_values!2630 newMap!16)) (index!3212 lt!57865) (ValueCellFull!1007 lt!57575)) (size!2334 (_values!2630 newMap!16))))))

(declare-fun lt!57861 () Unit!3468)

(declare-fun lt!57858 () Unit!3468)

(assert (=> b!112039 (= lt!57861 lt!57858)))

(declare-fun call!11999 () ListLongMap!1557)

(declare-fun call!12004 () ListLongMap!1557)

(assert (=> b!112039 (= call!11999 call!12004)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!50 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 32) (_ BitVec 64) V!3249 Int) Unit!3468)

(assert (=> b!112039 (= lt!57858 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!50 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (index!3212 lt!57865) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!57871 () Unit!3468)

(assert (=> b!112039 (= lt!57871 e!72840)))

(declare-fun c!19998 () Bool)

(declare-fun call!12009 () ListLongMap!1557)

(assert (=> b!112039 (= c!19998 (contains!831 call!12009 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (=> b!112039 (= e!72845 (tuple2!2407 true (LongMapFixedSize!923 (defaultEntry!2647 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (_size!510 newMap!16) (_keys!4364 newMap!16) (array!4382 (store (arr!2075 (_values!2630 newMap!16)) (index!3212 lt!57865) (ValueCellFull!1007 lt!57575)) (size!2334 (_values!2630 newMap!16))) (_vacant!510 newMap!16))))))

(declare-fun b!112040 () Bool)

(declare-fun res!55278 () Bool)

(assert (=> b!112040 (=> (not res!55278) (not e!72848))))

(declare-fun call!12001 () Bool)

(assert (=> b!112040 (= res!55278 call!12001)))

(assert (=> b!112040 (= e!72846 e!72848)))

(declare-fun b!112041 () Bool)

(declare-fun e!72841 () Unit!3468)

(declare-fun Unit!3479 () Unit!3468)

(assert (=> b!112041 (= e!72841 Unit!3479)))

(declare-fun lt!57874 () Unit!3468)

(assert (=> b!112041 (= lt!57874 call!12002)))

(declare-fun call!12013 () SeekEntryResult!265)

(assert (=> b!112041 (= lt!57857 call!12013)))

(declare-fun res!55283 () Bool)

(assert (=> b!112041 (= res!55283 ((_ is Found!265) lt!57857))))

(assert (=> b!112041 (=> (not res!55283) (not e!72849))))

(assert (=> b!112041 e!72849))

(declare-fun lt!57856 () Unit!3468)

(assert (=> b!112041 (= lt!57856 lt!57874)))

(assert (=> b!112041 false))

(declare-fun bm!11997 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!50 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 64) Int) Unit!3468)

(assert (=> bm!11997 (= call!12002 (lemmaInListMapThenSeekEntryOrOpenFindsIt!50 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)))))

(declare-fun b!112042 () Bool)

(assert (=> b!112042 (= e!72854 ((_ is Undefined!265) lt!57854))))

(declare-fun bm!11998 () Bool)

(assert (=> bm!11998 (= call!11993 call!11999)))

(declare-fun b!112043 () Bool)

(assert (=> b!112043 (= e!72844 e!72853)))

(declare-fun c!20004 () Bool)

(assert (=> b!112043 (= c!20004 (_1!1214 lt!57849))))

(declare-fun c!19994 () Bool)

(declare-fun bm!11999 () Bool)

(declare-fun updateHelperNewKey!50 (LongMapFixedSize!922 (_ BitVec 64) V!3249 (_ BitVec 32)) tuple2!2406)

(assert (=> bm!11999 (= call!12000 (updateHelperNewKey!50 newMap!16 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575 (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865))))))

(declare-fun bm!12000 () Bool)

(declare-fun call!12007 () Unit!3468)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!50 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 64) Int) Unit!3468)

(assert (=> bm!12000 (= call!12007 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!50 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)))))

(declare-fun b!112044 () Bool)

(declare-fun lt!57866 () Unit!3468)

(declare-fun lt!57875 () Unit!3468)

(assert (=> b!112044 (= lt!57866 lt!57875)))

(declare-fun call!12006 () ListLongMap!1557)

(assert (=> b!112044 (= call!11993 call!12006)))

(declare-fun lt!57863 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!50 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 V!3249 Int) Unit!3468)

(assert (=> b!112044 (= lt!57875 (lemmaChangeLongMinValueKeyThenAddPairToListMap!50 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) lt!57863 (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) lt!57575 (defaultEntry!2647 newMap!16)))))

(assert (=> b!112044 (= lt!57863 (bvor (extraKeys!2440 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!112044 (= e!72851 (tuple2!2407 true (LongMapFixedSize!923 (defaultEntry!2647 newMap!16) (mask!6824 newMap!16) (bvor (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) (zeroValue!2516 newMap!16) lt!57575 (_size!510 newMap!16) (_keys!4364 newMap!16) (_values!2630 newMap!16) (_vacant!510 newMap!16))))))

(declare-fun b!112045 () Bool)

(assert (=> b!112045 (= e!72854 e!72834)))

(declare-fun res!55282 () Bool)

(assert (=> b!112045 (= res!55282 call!12001)))

(assert (=> b!112045 (=> (not res!55282) (not e!72834))))

(declare-fun b!112046 () Bool)

(assert (=> b!112046 (= e!72837 (= call!12012 (+!140 call!11995 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(declare-fun b!112047 () Bool)

(assert (=> b!112047 (= e!72853 (= call!12012 call!11995))))

(declare-fun bm!12001 () Bool)

(assert (=> bm!12001 (= call!12008 call!12010)))

(declare-fun bm!12002 () Bool)

(assert (=> bm!12002 (= call!11997 call!12009)))

(declare-fun b!112048 () Bool)

(declare-fun lt!57869 () Unit!3468)

(assert (=> b!112048 (= e!72841 lt!57869)))

(assert (=> b!112048 (= lt!57869 call!12007)))

(assert (=> b!112048 (= lt!57873 call!12013)))

(declare-fun c!19992 () Bool)

(assert (=> b!112048 (= c!19992 ((_ is MissingZero!265) lt!57873))))

(assert (=> b!112048 e!72847))

(declare-fun c!19999 () Bool)

(declare-fun c!19995 () Bool)

(declare-fun bm!12003 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!12003 (= call!12010 (inRange!0 (ite c!20000 (ite c!19995 (index!3212 lt!57857) (ite c!19992 (index!3211 lt!57873) (index!3214 lt!57873))) (ite c!19998 (index!3212 lt!57862) (ite c!19999 (index!3211 lt!57854) (index!3214 lt!57854)))) (mask!6824 newMap!16)))))

(declare-fun bm!12004 () Bool)

(assert (=> bm!12004 (= call!11999 (+!140 (ite c!20002 (ite c!19996 call!12006 call!11997) call!12009) (ite c!20002 (ite c!19996 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57575) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57575)) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(declare-fun b!112049 () Bool)

(assert (=> b!112049 (= e!72842 (not call!11994))))

(declare-fun bm!12005 () Bool)

(assert (=> bm!12005 (= call!12009 (getCurrentListMap!470 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (ite (and c!20002 c!19996) lt!57860 (extraKeys!2440 newMap!16)) (ite (and c!20002 c!19996) lt!57575 (zeroValue!2516 newMap!16)) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun b!112050 () Bool)

(assert (=> b!112050 (= e!72848 (not call!12003))))

(declare-fun bm!12006 () Bool)

(assert (=> bm!12006 (= call!12001 call!12008)))

(declare-fun b!112051 () Bool)

(assert (=> b!112051 (= c!19994 ((_ is MissingVacant!265) lt!57865))))

(declare-fun e!72835 () tuple2!2406)

(assert (=> b!112051 (= e!72835 e!72838)))

(declare-fun b!112052 () Bool)

(declare-fun lt!57864 () Unit!3468)

(assert (=> b!112052 (= lt!57864 e!72841)))

(assert (=> b!112052 (= c!19995 call!12011)))

(assert (=> b!112052 (= e!72835 (tuple2!2407 false newMap!16))))

(declare-fun bm!12007 () Bool)

(declare-fun call!11996 () ListLongMap!1557)

(assert (=> bm!12007 (= call!11996 (getCurrentListMap!470 (_keys!4364 newMap!16) (ite (or c!20002 c!20000) (_values!2630 newMap!16) (array!4382 (store (arr!2075 (_values!2630 newMap!16)) (index!3212 lt!57865) (ValueCellFull!1007 lt!57575)) (size!2334 (_values!2630 newMap!16)))) (mask!6824 newMap!16) (ite c!20002 (ite c!19996 (extraKeys!2440 newMap!16) lt!57863) (extraKeys!2440 newMap!16)) (zeroValue!2516 newMap!16) (ite c!20002 (ite c!19996 (minValue!2516 newMap!16) lt!57575) (minValue!2516 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun bm!12008 () Bool)

(assert (=> bm!12008 (= call!12013 call!11992)))

(declare-fun bm!12009 () Bool)

(assert (=> bm!12009 (= call!12004 call!11996)))

(declare-fun b!112053 () Bool)

(declare-fun res!55277 () Bool)

(assert (=> b!112053 (= res!55277 (= (select (arr!2074 (_keys!4364 newMap!16)) (index!3214 lt!57854)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112053 (=> (not res!55277) (not e!72834))))

(declare-fun b!112054 () Bool)

(assert (=> b!112054 (= e!72852 e!72835)))

(assert (=> b!112054 (= lt!57865 (seekEntryOrOpen!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (_keys!4364 newMap!16) (mask!6824 newMap!16)))))

(assert (=> b!112054 (= c!20000 ((_ is Undefined!265) lt!57865))))

(declare-fun b!112055 () Bool)

(declare-fun res!55281 () Bool)

(assert (=> b!112055 (=> (not res!55281) (not e!72843))))

(assert (=> b!112055 (= res!55281 call!12014)))

(assert (=> b!112055 (= e!72847 e!72843)))

(declare-fun b!112056 () Bool)

(assert (=> b!112056 (= e!72850 (getCurrentListMap!470 (_keys!4364 newMap!16) lt!57868 (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun bm!12010 () Bool)

(assert (=> bm!12010 (= call!12006 call!11996)))

(declare-fun bm!12011 () Bool)

(assert (=> bm!12011 (= call!11998 call!11992)))

(declare-fun b!112057 () Bool)

(assert (=> b!112057 (= e!72850 call!12004)))

(declare-fun b!112058 () Bool)

(assert (=> b!112058 (= e!72839 ((_ is Undefined!265) lt!57873))))

(declare-fun b!112059 () Bool)

(declare-fun Unit!3480 () Unit!3468)

(assert (=> b!112059 (= e!72840 Unit!3480)))

(declare-fun lt!57867 () Unit!3468)

(assert (=> b!112059 (= lt!57867 call!12007)))

(assert (=> b!112059 (= lt!57854 call!11998)))

(assert (=> b!112059 (= c!19999 ((_ is MissingZero!265) lt!57854))))

(assert (=> b!112059 e!72846))

(declare-fun lt!57855 () Unit!3468)

(assert (=> b!112059 (= lt!57855 lt!57867)))

(assert (=> b!112059 false))

(declare-fun b!112060 () Bool)

(assert (=> b!112060 (= e!72838 e!72845)))

(declare-fun c!19997 () Bool)

(assert (=> b!112060 (= c!19997 ((_ is MissingZero!265) lt!57865))))

(assert (= (and d!31809 c!20002) b!112029))

(assert (= (and d!31809 (not c!20002)) b!112054))

(assert (= (and b!112029 c!19996) b!112036))

(assert (= (and b!112029 (not c!19996)) b!112044))

(assert (= (or b!112036 b!112044) bm!12002))

(assert (= (or b!112036 b!112044) bm!12010))

(assert (= (or b!112036 b!112044) bm!11998))

(assert (= (and b!112054 c!20000) b!112052))

(assert (= (and b!112054 (not c!20000)) b!112051))

(assert (= (and b!112052 c!19995) b!112041))

(assert (= (and b!112052 (not c!19995)) b!112048))

(assert (= (and b!112041 res!55283) b!112025))

(assert (= (and b!112025 res!55287) b!112028))

(assert (= (and b!112048 c!19992) b!112055))

(assert (= (and b!112048 (not c!19992)) b!112034))

(assert (= (and b!112055 res!55281) b!112032))

(assert (= (and b!112032 res!55280) b!112027))

(assert (= (and b!112034 c!20001) b!112026))

(assert (= (and b!112034 (not c!20001)) b!112058))

(assert (= (and b!112026 res!55284) b!112037))

(assert (= (and b!112037 res!55289) b!112049))

(assert (= (or b!112055 b!112026) bm!11996))

(assert (= (or b!112027 b!112049) bm!11992))

(assert (= (or b!112025 bm!11996) bm!11988))

(assert (= (or b!112041 b!112048) bm!12008))

(assert (= (and b!112051 c!19994) b!112024))

(assert (= (and b!112051 (not c!19994)) b!112060))

(assert (= (and b!112060 c!19997) b!112033))

(assert (= (and b!112060 (not c!19997)) b!112039))

(assert (= (and b!112039 c!19998) b!112038))

(assert (= (and b!112039 (not c!19998)) b!112059))

(assert (= (and b!112038 res!55279) b!112021))

(assert (= (and b!112021 res!55285) b!112023))

(assert (= (and b!112059 c!19999) b!112040))

(assert (= (and b!112059 (not c!19999)) b!112030))

(assert (= (and b!112040 res!55278) b!112022))

(assert (= (and b!112022 res!55290) b!112050))

(assert (= (and b!112030 c!20003) b!112045))

(assert (= (and b!112030 (not c!20003)) b!112042))

(assert (= (and b!112045 res!55282) b!112053))

(assert (= (and b!112053 res!55277) b!112031))

(assert (= (or b!112040 b!112045) bm!12006))

(assert (= (or b!112050 b!112031) bm!11994))

(assert (= (or b!112021 bm!12006) bm!12001))

(assert (= (or b!112038 b!112059) bm!12011))

(assert (= (or b!112024 b!112033) bm!11999))

(assert (= (or b!112041 b!112038) bm!11997))

(assert (= (or bm!12008 bm!12011) bm!11993))

(assert (= (or b!112052 b!112039) bm!12009))

(assert (= (or bm!11988 bm!12001) bm!12003))

(assert (= (or b!112048 b!112059) bm!12000))

(assert (= (or bm!11992 bm!11994) bm!11991))

(assert (= (or b!112052 b!112039) bm!11989))

(assert (= (and bm!11989 c!19993) b!112057))

(assert (= (and bm!11989 (not c!19993)) b!112056))

(assert (= (or bm!12010 bm!12009) bm!12007))

(assert (= (or bm!12002 b!112039) bm!12005))

(assert (= (or bm!11998 b!112039) bm!12004))

(assert (= (and d!31809 res!55288) b!112043))

(assert (= (and b!112043 c!20004) b!112035))

(assert (= (and b!112043 (not c!20004)) b!112047))

(assert (= (and b!112035 res!55286) b!112046))

(assert (= (or b!112046 b!112047) bm!11995))

(assert (= (or b!112035 b!112046 b!112047) bm!11990))

(declare-fun m!127551 () Bool)

(assert (=> b!112046 m!127551))

(declare-fun m!127553 () Bool)

(assert (=> bm!12003 m!127553))

(assert (=> b!112035 m!127199))

(declare-fun m!127555 () Bool)

(assert (=> b!112035 m!127555))

(assert (=> bm!11991 m!127199))

(declare-fun m!127557 () Bool)

(assert (=> bm!11991 m!127557))

(declare-fun m!127559 () Bool)

(assert (=> b!112023 m!127559))

(declare-fun m!127561 () Bool)

(assert (=> bm!11989 m!127561))

(declare-fun m!127563 () Bool)

(assert (=> bm!11989 m!127563))

(declare-fun m!127565 () Bool)

(assert (=> b!112053 m!127565))

(declare-fun m!127567 () Bool)

(assert (=> b!112037 m!127567))

(declare-fun m!127569 () Bool)

(assert (=> b!112028 m!127569))

(assert (=> bm!11995 m!127195))

(declare-fun m!127571 () Bool)

(assert (=> b!112022 m!127571))

(declare-fun m!127573 () Bool)

(assert (=> b!112056 m!127573))

(declare-fun m!127575 () Bool)

(assert (=> bm!12004 m!127575))

(declare-fun m!127577 () Bool)

(assert (=> d!31809 m!127577))

(assert (=> d!31809 m!127245))

(declare-fun m!127579 () Bool)

(assert (=> b!112039 m!127579))

(declare-fun m!127581 () Bool)

(assert (=> b!112039 m!127581))

(assert (=> b!112039 m!127199))

(declare-fun m!127583 () Bool)

(assert (=> b!112039 m!127583))

(assert (=> b!112039 m!127199))

(declare-fun m!127585 () Bool)

(assert (=> b!112039 m!127585))

(declare-fun m!127587 () Bool)

(assert (=> b!112036 m!127587))

(declare-fun m!127589 () Bool)

(assert (=> bm!12005 m!127589))

(assert (=> bm!11997 m!127199))

(declare-fun m!127591 () Bool)

(assert (=> bm!11997 m!127591))

(assert (=> b!112054 m!127199))

(declare-fun m!127593 () Bool)

(assert (=> b!112054 m!127593))

(declare-fun m!127595 () Bool)

(assert (=> b!112032 m!127595))

(assert (=> bm!11993 m!127199))

(assert (=> bm!11993 m!127593))

(declare-fun m!127597 () Bool)

(assert (=> b!112044 m!127597))

(assert (=> bm!12007 m!127581))

(declare-fun m!127599 () Bool)

(assert (=> bm!12007 m!127599))

(assert (=> bm!11999 m!127199))

(declare-fun m!127601 () Bool)

(assert (=> bm!11999 m!127601))

(declare-fun m!127603 () Bool)

(assert (=> bm!11990 m!127603))

(assert (=> bm!12000 m!127199))

(declare-fun m!127605 () Bool)

(assert (=> bm!12000 m!127605))

(assert (=> b!111628 d!31809))

(declare-fun condMapEmpty!4035 () Bool)

(declare-fun mapDefault!4035 () ValueCell!1007)

(assert (=> mapNonEmpty!4020 (= condMapEmpty!4035 (= mapRest!4020 ((as const (Array (_ BitVec 32) ValueCell!1007)) mapDefault!4035)))))

(declare-fun e!72860 () Bool)

(declare-fun mapRes!4035 () Bool)

(assert (=> mapNonEmpty!4020 (= tp!10056 (and e!72860 mapRes!4035))))

(declare-fun b!112068 () Bool)

(assert (=> b!112068 (= e!72860 tp_is_empty!2701)))

(declare-fun mapIsEmpty!4035 () Bool)

(assert (=> mapIsEmpty!4035 mapRes!4035))

(declare-fun mapNonEmpty!4035 () Bool)

(declare-fun tp!10083 () Bool)

(declare-fun e!72859 () Bool)

(assert (=> mapNonEmpty!4035 (= mapRes!4035 (and tp!10083 e!72859))))

(declare-fun mapValue!4035 () ValueCell!1007)

(declare-fun mapRest!4035 () (Array (_ BitVec 32) ValueCell!1007))

(declare-fun mapKey!4035 () (_ BitVec 32))

(assert (=> mapNonEmpty!4035 (= mapRest!4020 (store mapRest!4035 mapKey!4035 mapValue!4035))))

(declare-fun b!112067 () Bool)

(assert (=> b!112067 (= e!72859 tp_is_empty!2701)))

(assert (= (and mapNonEmpty!4020 condMapEmpty!4035) mapIsEmpty!4035))

(assert (= (and mapNonEmpty!4020 (not condMapEmpty!4035)) mapNonEmpty!4035))

(assert (= (and mapNonEmpty!4035 ((_ is ValueCellFull!1007) mapValue!4035)) b!112067))

(assert (= (and mapNonEmpty!4020 ((_ is ValueCellFull!1007) mapDefault!4035)) b!112068))

(declare-fun m!127607 () Bool)

(assert (=> mapNonEmpty!4035 m!127607))

(declare-fun condMapEmpty!4036 () Bool)

(declare-fun mapDefault!4036 () ValueCell!1007)

(assert (=> mapNonEmpty!4019 (= condMapEmpty!4036 (= mapRest!4019 ((as const (Array (_ BitVec 32) ValueCell!1007)) mapDefault!4036)))))

(declare-fun e!72862 () Bool)

(declare-fun mapRes!4036 () Bool)

(assert (=> mapNonEmpty!4019 (= tp!10055 (and e!72862 mapRes!4036))))

(declare-fun b!112070 () Bool)

(assert (=> b!112070 (= e!72862 tp_is_empty!2701)))

(declare-fun mapIsEmpty!4036 () Bool)

(assert (=> mapIsEmpty!4036 mapRes!4036))

(declare-fun mapNonEmpty!4036 () Bool)

(declare-fun tp!10084 () Bool)

(declare-fun e!72861 () Bool)

(assert (=> mapNonEmpty!4036 (= mapRes!4036 (and tp!10084 e!72861))))

(declare-fun mapValue!4036 () ValueCell!1007)

(declare-fun mapKey!4036 () (_ BitVec 32))

(declare-fun mapRest!4036 () (Array (_ BitVec 32) ValueCell!1007))

(assert (=> mapNonEmpty!4036 (= mapRest!4019 (store mapRest!4036 mapKey!4036 mapValue!4036))))

(declare-fun b!112069 () Bool)

(assert (=> b!112069 (= e!72861 tp_is_empty!2701)))

(assert (= (and mapNonEmpty!4019 condMapEmpty!4036) mapIsEmpty!4036))

(assert (= (and mapNonEmpty!4019 (not condMapEmpty!4036)) mapNonEmpty!4036))

(assert (= (and mapNonEmpty!4036 ((_ is ValueCellFull!1007) mapValue!4036)) b!112069))

(assert (= (and mapNonEmpty!4019 ((_ is ValueCellFull!1007) mapDefault!4036)) b!112070))

(declare-fun m!127609 () Bool)

(assert (=> mapNonEmpty!4036 m!127609))

(declare-fun b_lambda!5013 () Bool)

(assert (= b_lambda!5011 (or (and b!111620 b_free!2569) (and b!111616 b_free!2571 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))))) b_lambda!5013)))

(declare-fun b_lambda!5015 () Bool)

(assert (= b_lambda!5009 (or (and b!111620 b_free!2569) (and b!111616 b_free!2571 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))))) b_lambda!5015)))

(declare-fun b_lambda!5017 () Bool)

(assert (= b_lambda!5007 (or (and b!111620 b_free!2569) (and b!111616 b_free!2571 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))))) b_lambda!5017)))

(check-sat (not d!31773) (not b!111862) (not b!112056) (not b!111869) (not b!111915) (not d!31797) (not bm!11936) (not b!111940) (not bm!11930) (not b!111931) (not d!31801) (not b!111919) (not b!111856) (not b!111772) (not bm!12000) (not b!111871) (not b!111854) b_and!6883 (not b!111888) (not b_lambda!5017) (not bm!12003) (not b_lambda!5013) (not d!31767) (not d!31795) (not bm!12005) (not b!111938) (not bm!11912) (not b!112035) (not d!31793) (not b!111920) (not d!31779) (not b!111918) (not b!111926) (not b!112046) (not b!111928) (not b!111841) (not b!111844) (not d!31777) (not b_next!2569) (not b_lambda!5015) (not b!112054) (not d!31769) (not b!111882) (not b!111924) (not d!31809) (not b!111914) (not b_lambda!5005) (not b!111777) (not d!31799) (not mapNonEmpty!4036) tp_is_empty!2701 (not b!112044) (not d!31781) (not b!111930) (not b_next!2571) (not b!111850) (not b!111837) (not bm!11999) (not bm!11991) (not b!111916) (not b!111889) (not d!31785) (not b!111790) (not b!111927) (not bm!11993) (not b!111923) (not b!112036) b_and!6881 (not bm!11989) (not mapNonEmpty!4035) (not bm!11929) (not bm!11939) (not b!111846) (not d!31803) (not bm!11995) (not bm!12007) (not b!111861) (not d!31807) (not b!111792) (not b!111929) (not bm!11927) (not b!112039) (not b!111791) (not bm!11990) (not b!111836) (not bm!12004) (not b!111870) (not bm!11997) (not bm!11932) (not b!111883))
(check-sat b_and!6881 b_and!6883 (not b_next!2569) (not b_next!2571))
(get-model)

(declare-fun b!112083 () Bool)

(declare-fun e!72869 () SeekEntryResult!265)

(assert (=> b!112083 (= e!72869 Undefined!265)))

(declare-fun b!112084 () Bool)

(declare-fun c!20012 () Bool)

(declare-fun lt!57883 () (_ BitVec 64))

(assert (=> b!112084 (= c!20012 (= lt!57883 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!72870 () SeekEntryResult!265)

(declare-fun e!72871 () SeekEntryResult!265)

(assert (=> b!112084 (= e!72870 e!72871)))

(declare-fun lt!57884 () SeekEntryResult!265)

(declare-fun d!31811 () Bool)

(assert (=> d!31811 (and (or ((_ is Undefined!265) lt!57884) (not ((_ is Found!265) lt!57884)) (and (bvsge (index!3212 lt!57884) #b00000000000000000000000000000000) (bvslt (index!3212 lt!57884) (size!2333 (_keys!4364 newMap!16))))) (or ((_ is Undefined!265) lt!57884) ((_ is Found!265) lt!57884) (not ((_ is MissingZero!265) lt!57884)) (and (bvsge (index!3211 lt!57884) #b00000000000000000000000000000000) (bvslt (index!3211 lt!57884) (size!2333 (_keys!4364 newMap!16))))) (or ((_ is Undefined!265) lt!57884) ((_ is Found!265) lt!57884) ((_ is MissingZero!265) lt!57884) (not ((_ is MissingVacant!265) lt!57884)) (and (bvsge (index!3214 lt!57884) #b00000000000000000000000000000000) (bvslt (index!3214 lt!57884) (size!2333 (_keys!4364 newMap!16))))) (or ((_ is Undefined!265) lt!57884) (ite ((_ is Found!265) lt!57884) (= (select (arr!2074 (_keys!4364 newMap!16)) (index!3212 lt!57884)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) (ite ((_ is MissingZero!265) lt!57884) (= (select (arr!2074 (_keys!4364 newMap!16)) (index!3211 lt!57884)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!265) lt!57884) (= (select (arr!2074 (_keys!4364 newMap!16)) (index!3214 lt!57884)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!31811 (= lt!57884 e!72869)))

(declare-fun c!20013 () Bool)

(declare-fun lt!57882 () SeekEntryResult!265)

(assert (=> d!31811 (= c!20013 (and ((_ is Intermediate!265) lt!57882) (undefined!1077 lt!57882)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4379 (_ BitVec 32)) SeekEntryResult!265)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!31811 (= lt!57882 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (mask!6824 newMap!16)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (_keys!4364 newMap!16) (mask!6824 newMap!16)))))

(assert (=> d!31811 (validMask!0 (mask!6824 newMap!16))))

(assert (=> d!31811 (= (seekEntryOrOpen!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (_keys!4364 newMap!16) (mask!6824 newMap!16)) lt!57884)))

(declare-fun b!112085 () Bool)

(assert (=> b!112085 (= e!72870 (Found!265 (index!3213 lt!57882)))))

(declare-fun b!112086 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4379 (_ BitVec 32)) SeekEntryResult!265)

(assert (=> b!112086 (= e!72871 (seekKeyOrZeroReturnVacant!0 (x!14096 lt!57882) (index!3213 lt!57882) (index!3213 lt!57882) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (_keys!4364 newMap!16) (mask!6824 newMap!16)))))

(declare-fun b!112087 () Bool)

(assert (=> b!112087 (= e!72869 e!72870)))

(assert (=> b!112087 (= lt!57883 (select (arr!2074 (_keys!4364 newMap!16)) (index!3213 lt!57882)))))

(declare-fun c!20011 () Bool)

(assert (=> b!112087 (= c!20011 (= lt!57883 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun b!112088 () Bool)

(assert (=> b!112088 (= e!72871 (MissingZero!265 (index!3213 lt!57882)))))

(assert (= (and d!31811 c!20013) b!112083))

(assert (= (and d!31811 (not c!20013)) b!112087))

(assert (= (and b!112087 c!20011) b!112085))

(assert (= (and b!112087 (not c!20011)) b!112084))

(assert (= (and b!112084 c!20012) b!112088))

(assert (= (and b!112084 (not c!20012)) b!112086))

(declare-fun m!127611 () Bool)

(assert (=> d!31811 m!127611))

(assert (=> d!31811 m!127199))

(declare-fun m!127613 () Bool)

(assert (=> d!31811 m!127613))

(declare-fun m!127615 () Bool)

(assert (=> d!31811 m!127615))

(declare-fun m!127617 () Bool)

(assert (=> d!31811 m!127617))

(declare-fun m!127619 () Bool)

(assert (=> d!31811 m!127619))

(assert (=> d!31811 m!127613))

(assert (=> d!31811 m!127199))

(declare-fun m!127621 () Bool)

(assert (=> d!31811 m!127621))

(assert (=> b!112086 m!127199))

(declare-fun m!127623 () Bool)

(assert (=> b!112086 m!127623))

(declare-fun m!127625 () Bool)

(assert (=> b!112087 m!127625))

(assert (=> bm!11993 d!31811))

(declare-fun d!31813 () Bool)

(declare-fun e!72872 () Bool)

(assert (=> d!31813 e!72872))

(declare-fun res!55291 () Bool)

(assert (=> d!31813 (=> res!55291 e!72872)))

(declare-fun lt!57885 () Bool)

(assert (=> d!31813 (= res!55291 (not lt!57885))))

(declare-fun lt!57886 () Bool)

(assert (=> d!31813 (= lt!57885 lt!57886)))

(declare-fun lt!57887 () Unit!3468)

(declare-fun e!72873 () Unit!3468)

(assert (=> d!31813 (= lt!57887 e!72873)))

(declare-fun c!20014 () Bool)

(assert (=> d!31813 (= c!20014 lt!57886)))

(assert (=> d!31813 (= lt!57886 (containsKey!161 (toList!794 lt!57743) (_1!1213 lt!57568)))))

(assert (=> d!31813 (= (contains!831 lt!57743 (_1!1213 lt!57568)) lt!57885)))

(declare-fun b!112089 () Bool)

(declare-fun lt!57888 () Unit!3468)

(assert (=> b!112089 (= e!72873 lt!57888)))

(assert (=> b!112089 (= lt!57888 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 lt!57743) (_1!1213 lt!57568)))))

(assert (=> b!112089 (isDefined!111 (getValueByKey!157 (toList!794 lt!57743) (_1!1213 lt!57568)))))

(declare-fun b!112090 () Bool)

(declare-fun Unit!3481 () Unit!3468)

(assert (=> b!112090 (= e!72873 Unit!3481)))

(declare-fun b!112091 () Bool)

(assert (=> b!112091 (= e!72872 (isDefined!111 (getValueByKey!157 (toList!794 lt!57743) (_1!1213 lt!57568))))))

(assert (= (and d!31813 c!20014) b!112089))

(assert (= (and d!31813 (not c!20014)) b!112090))

(assert (= (and d!31813 (not res!55291)) b!112091))

(declare-fun m!127627 () Bool)

(assert (=> d!31813 m!127627))

(declare-fun m!127629 () Bool)

(assert (=> b!112089 m!127629))

(assert (=> b!112089 m!127473))

(assert (=> b!112089 m!127473))

(declare-fun m!127631 () Bool)

(assert (=> b!112089 m!127631))

(assert (=> b!112091 m!127473))

(assert (=> b!112091 m!127473))

(assert (=> b!112091 m!127631))

(assert (=> d!31793 d!31813))

(declare-fun d!31815 () Bool)

(declare-fun c!20019 () Bool)

(assert (=> d!31815 (= c!20019 (and ((_ is Cons!1625) lt!57746) (= (_1!1213 (h!2225 lt!57746)) (_1!1213 lt!57568))))))

(declare-fun e!72878 () Option!163)

(assert (=> d!31815 (= (getValueByKey!157 lt!57746 (_1!1213 lt!57568)) e!72878)))

(declare-fun b!112102 () Bool)

(declare-fun e!72879 () Option!163)

(assert (=> b!112102 (= e!72879 (getValueByKey!157 (t!5778 lt!57746) (_1!1213 lt!57568)))))

(declare-fun b!112100 () Bool)

(assert (=> b!112100 (= e!72878 (Some!162 (_2!1213 (h!2225 lt!57746))))))

(declare-fun b!112101 () Bool)

(assert (=> b!112101 (= e!72878 e!72879)))

(declare-fun c!20020 () Bool)

(assert (=> b!112101 (= c!20020 (and ((_ is Cons!1625) lt!57746) (not (= (_1!1213 (h!2225 lt!57746)) (_1!1213 lt!57568)))))))

(declare-fun b!112103 () Bool)

(assert (=> b!112103 (= e!72879 None!161)))

(assert (= (and d!31815 c!20019) b!112100))

(assert (= (and d!31815 (not c!20019)) b!112101))

(assert (= (and b!112101 c!20020) b!112102))

(assert (= (and b!112101 (not c!20020)) b!112103))

(declare-fun m!127633 () Bool)

(assert (=> b!112102 m!127633))

(assert (=> d!31793 d!31815))

(declare-fun d!31817 () Bool)

(assert (=> d!31817 (= (getValueByKey!157 lt!57746 (_1!1213 lt!57568)) (Some!162 (_2!1213 lt!57568)))))

(declare-fun lt!57891 () Unit!3468)

(declare-fun choose!706 (List!1629 (_ BitVec 64) V!3249) Unit!3468)

(assert (=> d!31817 (= lt!57891 (choose!706 lt!57746 (_1!1213 lt!57568) (_2!1213 lt!57568)))))

(declare-fun e!72882 () Bool)

(assert (=> d!31817 e!72882))

(declare-fun res!55296 () Bool)

(assert (=> d!31817 (=> (not res!55296) (not e!72882))))

(declare-fun isStrictlySorted!307 (List!1629) Bool)

(assert (=> d!31817 (= res!55296 (isStrictlySorted!307 lt!57746))))

(assert (=> d!31817 (= (lemmaContainsTupThenGetReturnValue!76 lt!57746 (_1!1213 lt!57568) (_2!1213 lt!57568)) lt!57891)))

(declare-fun b!112108 () Bool)

(declare-fun res!55297 () Bool)

(assert (=> b!112108 (=> (not res!55297) (not e!72882))))

(assert (=> b!112108 (= res!55297 (containsKey!161 lt!57746 (_1!1213 lt!57568)))))

(declare-fun b!112109 () Bool)

(assert (=> b!112109 (= e!72882 (contains!833 lt!57746 (tuple2!2405 (_1!1213 lt!57568) (_2!1213 lt!57568))))))

(assert (= (and d!31817 res!55296) b!112108))

(assert (= (and b!112108 res!55297) b!112109))

(assert (=> d!31817 m!127467))

(declare-fun m!127635 () Bool)

(assert (=> d!31817 m!127635))

(declare-fun m!127637 () Bool)

(assert (=> d!31817 m!127637))

(declare-fun m!127639 () Bool)

(assert (=> b!112108 m!127639))

(declare-fun m!127641 () Bool)

(assert (=> b!112109 m!127641))

(assert (=> d!31793 d!31817))

(declare-fun b!112130 () Bool)

(declare-fun e!72895 () List!1629)

(declare-fun call!12021 () List!1629)

(assert (=> b!112130 (= e!72895 call!12021)))

(declare-fun bm!12018 () Bool)

(declare-fun call!12022 () List!1629)

(declare-fun call!12023 () List!1629)

(assert (=> bm!12018 (= call!12022 call!12023)))

(declare-fun b!112131 () Bool)

(declare-fun e!72897 () List!1629)

(assert (=> b!112131 (= e!72897 (insertStrictlySorted!79 (t!5778 (toList!794 lt!57569)) (_1!1213 lt!57568) (_2!1213 lt!57568)))))

(declare-fun b!112132 () Bool)

(declare-fun res!55302 () Bool)

(declare-fun e!72893 () Bool)

(assert (=> b!112132 (=> (not res!55302) (not e!72893))))

(declare-fun lt!57894 () List!1629)

(assert (=> b!112132 (= res!55302 (containsKey!161 lt!57894 (_1!1213 lt!57568)))))

(declare-fun b!112133 () Bool)

(assert (=> b!112133 (= e!72893 (contains!833 lt!57894 (tuple2!2405 (_1!1213 lt!57568) (_2!1213 lt!57568))))))

(declare-fun b!112134 () Bool)

(assert (=> b!112134 (= e!72895 call!12021)))

(declare-fun b!112135 () Bool)

(declare-fun e!72894 () List!1629)

(assert (=> b!112135 (= e!72894 call!12023)))

(declare-fun d!31819 () Bool)

(assert (=> d!31819 e!72893))

(declare-fun res!55303 () Bool)

(assert (=> d!31819 (=> (not res!55303) (not e!72893))))

(assert (=> d!31819 (= res!55303 (isStrictlySorted!307 lt!57894))))

(assert (=> d!31819 (= lt!57894 e!72894)))

(declare-fun c!20032 () Bool)

(assert (=> d!31819 (= c!20032 (and ((_ is Cons!1625) (toList!794 lt!57569)) (bvslt (_1!1213 (h!2225 (toList!794 lt!57569))) (_1!1213 lt!57568))))))

(assert (=> d!31819 (isStrictlySorted!307 (toList!794 lt!57569))))

(assert (=> d!31819 (= (insertStrictlySorted!79 (toList!794 lt!57569) (_1!1213 lt!57568) (_2!1213 lt!57568)) lt!57894)))

(declare-fun bm!12019 () Bool)

(declare-fun $colon$colon!83 (List!1629 tuple2!2404) List!1629)

(assert (=> bm!12019 (= call!12023 ($colon$colon!83 e!72897 (ite c!20032 (h!2225 (toList!794 lt!57569)) (tuple2!2405 (_1!1213 lt!57568) (_2!1213 lt!57568)))))))

(declare-fun c!20030 () Bool)

(assert (=> bm!12019 (= c!20030 c!20032)))

(declare-fun b!112136 () Bool)

(declare-fun e!72896 () List!1629)

(assert (=> b!112136 (= e!72894 e!72896)))

(declare-fun c!20029 () Bool)

(assert (=> b!112136 (= c!20029 (and ((_ is Cons!1625) (toList!794 lt!57569)) (= (_1!1213 (h!2225 (toList!794 lt!57569))) (_1!1213 lt!57568))))))

(declare-fun bm!12020 () Bool)

(assert (=> bm!12020 (= call!12021 call!12022)))

(declare-fun b!112137 () Bool)

(assert (=> b!112137 (= e!72896 call!12022)))

(declare-fun b!112138 () Bool)

(declare-fun c!20031 () Bool)

(assert (=> b!112138 (= c!20031 (and ((_ is Cons!1625) (toList!794 lt!57569)) (bvsgt (_1!1213 (h!2225 (toList!794 lt!57569))) (_1!1213 lt!57568))))))

(assert (=> b!112138 (= e!72896 e!72895)))

(declare-fun b!112139 () Bool)

(assert (=> b!112139 (= e!72897 (ite c!20029 (t!5778 (toList!794 lt!57569)) (ite c!20031 (Cons!1625 (h!2225 (toList!794 lt!57569)) (t!5778 (toList!794 lt!57569))) Nil!1626)))))

(assert (= (and d!31819 c!20032) b!112135))

(assert (= (and d!31819 (not c!20032)) b!112136))

(assert (= (and b!112136 c!20029) b!112137))

(assert (= (and b!112136 (not c!20029)) b!112138))

(assert (= (and b!112138 c!20031) b!112134))

(assert (= (and b!112138 (not c!20031)) b!112130))

(assert (= (or b!112134 b!112130) bm!12020))

(assert (= (or b!112137 bm!12020) bm!12018))

(assert (= (or b!112135 bm!12018) bm!12019))

(assert (= (and bm!12019 c!20030) b!112131))

(assert (= (and bm!12019 (not c!20030)) b!112139))

(assert (= (and d!31819 res!55303) b!112132))

(assert (= (and b!112132 res!55302) b!112133))

(declare-fun m!127643 () Bool)

(assert (=> b!112132 m!127643))

(declare-fun m!127645 () Bool)

(assert (=> bm!12019 m!127645))

(declare-fun m!127647 () Bool)

(assert (=> b!112131 m!127647))

(declare-fun m!127649 () Bool)

(assert (=> b!112133 m!127649))

(declare-fun m!127651 () Bool)

(assert (=> d!31819 m!127651))

(declare-fun m!127653 () Bool)

(assert (=> d!31819 m!127653))

(assert (=> d!31793 d!31819))

(declare-fun d!31821 () Bool)

(declare-fun res!55304 () Bool)

(declare-fun e!72898 () Bool)

(assert (=> d!31821 (=> (not res!55304) (not e!72898))))

(assert (=> d!31821 (= res!55304 (simpleValid!77 (_2!1214 lt!57849)))))

(assert (=> d!31821 (= (valid!433 (_2!1214 lt!57849)) e!72898)))

(declare-fun b!112140 () Bool)

(declare-fun res!55305 () Bool)

(assert (=> b!112140 (=> (not res!55305) (not e!72898))))

(assert (=> b!112140 (= res!55305 (= (arrayCountValidKeys!0 (_keys!4364 (_2!1214 lt!57849)) #b00000000000000000000000000000000 (size!2333 (_keys!4364 (_2!1214 lt!57849)))) (_size!510 (_2!1214 lt!57849))))))

(declare-fun b!112141 () Bool)

(declare-fun res!55306 () Bool)

(assert (=> b!112141 (=> (not res!55306) (not e!72898))))

(assert (=> b!112141 (= res!55306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4364 (_2!1214 lt!57849)) (mask!6824 (_2!1214 lt!57849))))))

(declare-fun b!112142 () Bool)

(assert (=> b!112142 (= e!72898 (arrayNoDuplicates!0 (_keys!4364 (_2!1214 lt!57849)) #b00000000000000000000000000000000 Nil!1627))))

(assert (= (and d!31821 res!55304) b!112140))

(assert (= (and b!112140 res!55305) b!112141))

(assert (= (and b!112141 res!55306) b!112142))

(declare-fun m!127655 () Bool)

(assert (=> d!31821 m!127655))

(declare-fun m!127657 () Bool)

(assert (=> b!112140 m!127657))

(declare-fun m!127659 () Bool)

(assert (=> b!112141 m!127659))

(declare-fun m!127661 () Bool)

(assert (=> b!112142 m!127661))

(assert (=> d!31809 d!31821))

(assert (=> d!31809 d!31785))

(assert (=> d!31781 d!31805))

(declare-fun b!112159 () Bool)

(declare-fun e!72908 () Bool)

(declare-fun e!72907 () Bool)

(assert (=> b!112159 (= e!72908 e!72907)))

(declare-fun res!55315 () Bool)

(declare-fun call!12029 () Bool)

(assert (=> b!112159 (= res!55315 call!12029)))

(assert (=> b!112159 (=> (not res!55315) (not e!72907))))

(declare-fun lt!57900 () SeekEntryResult!265)

(declare-fun c!20037 () Bool)

(declare-fun bm!12025 () Bool)

(assert (=> bm!12025 (= call!12029 (inRange!0 (ite c!20037 (index!3211 lt!57900) (index!3214 lt!57900)) (mask!6824 newMap!16)))))

(declare-fun b!112160 () Bool)

(declare-fun e!72910 () Bool)

(assert (=> b!112160 (= e!72908 e!72910)))

(declare-fun c!20038 () Bool)

(assert (=> b!112160 (= c!20038 ((_ is MissingVacant!265) lt!57900))))

(declare-fun b!112161 () Bool)

(declare-fun call!12028 () Bool)

(assert (=> b!112161 (= e!72907 (not call!12028))))

(declare-fun bm!12026 () Bool)

(assert (=> bm!12026 (= call!12028 (arrayContainsKey!0 (_keys!4364 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!112162 () Bool)

(assert (=> b!112162 (= e!72910 ((_ is Undefined!265) lt!57900))))

(declare-fun b!112163 () Bool)

(declare-fun res!55316 () Bool)

(declare-fun e!72909 () Bool)

(assert (=> b!112163 (=> (not res!55316) (not e!72909))))

(assert (=> b!112163 (= res!55316 call!12029)))

(assert (=> b!112163 (= e!72910 e!72909)))

(declare-fun b!112164 () Bool)

(assert (=> b!112164 (and (bvsge (index!3211 lt!57900) #b00000000000000000000000000000000) (bvslt (index!3211 lt!57900) (size!2333 (_keys!4364 newMap!16))))))

(declare-fun res!55317 () Bool)

(assert (=> b!112164 (= res!55317 (= (select (arr!2074 (_keys!4364 newMap!16)) (index!3211 lt!57900)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112164 (=> (not res!55317) (not e!72907))))

(declare-fun b!112165 () Bool)

(declare-fun res!55318 () Bool)

(assert (=> b!112165 (=> (not res!55318) (not e!72909))))

(assert (=> b!112165 (= res!55318 (= (select (arr!2074 (_keys!4364 newMap!16)) (index!3214 lt!57900)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112165 (and (bvsge (index!3214 lt!57900) #b00000000000000000000000000000000) (bvslt (index!3214 lt!57900) (size!2333 (_keys!4364 newMap!16))))))

(declare-fun b!112166 () Bool)

(assert (=> b!112166 (= e!72909 (not call!12028))))

(declare-fun d!31823 () Bool)

(assert (=> d!31823 e!72908))

(assert (=> d!31823 (= c!20037 ((_ is MissingZero!265) lt!57900))))

(assert (=> d!31823 (= lt!57900 (seekEntryOrOpen!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (_keys!4364 newMap!16) (mask!6824 newMap!16)))))

(declare-fun lt!57899 () Unit!3468)

(declare-fun choose!707 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 64) Int) Unit!3468)

(assert (=> d!31823 (= lt!57899 (choose!707 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)))))

(assert (=> d!31823 (validMask!0 (mask!6824 newMap!16))))

(assert (=> d!31823 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!50 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)) lt!57899)))

(assert (= (and d!31823 c!20037) b!112159))

(assert (= (and d!31823 (not c!20037)) b!112160))

(assert (= (and b!112159 res!55315) b!112164))

(assert (= (and b!112164 res!55317) b!112161))

(assert (= (and b!112160 c!20038) b!112163))

(assert (= (and b!112160 (not c!20038)) b!112162))

(assert (= (and b!112163 res!55316) b!112165))

(assert (= (and b!112165 res!55318) b!112166))

(assert (= (or b!112159 b!112163) bm!12025))

(assert (= (or b!112161 b!112166) bm!12026))

(assert (=> bm!12026 m!127199))

(assert (=> bm!12026 m!127557))

(assert (=> d!31823 m!127199))

(assert (=> d!31823 m!127593))

(assert (=> d!31823 m!127199))

(declare-fun m!127663 () Bool)

(assert (=> d!31823 m!127663))

(assert (=> d!31823 m!127611))

(declare-fun m!127665 () Bool)

(assert (=> b!112165 m!127665))

(declare-fun m!127667 () Bool)

(assert (=> bm!12025 m!127667))

(declare-fun m!127669 () Bool)

(assert (=> b!112164 m!127669))

(assert (=> bm!12000 d!31823))

(declare-fun d!31825 () Bool)

(assert (=> d!31825 (= (get!1354 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) from!355) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2935 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (=> b!111861 d!31825))

(declare-fun d!31827 () Bool)

(assert (=> d!31827 (= (validKeyInArray!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!111882 d!31827))

(declare-fun b!112167 () Bool)

(declare-fun e!72914 () Bool)

(declare-fun call!12030 () Bool)

(assert (=> b!112167 (= e!72914 call!12030)))

(declare-fun b!112168 () Bool)

(declare-fun e!72911 () Bool)

(assert (=> b!112168 (= e!72911 e!72914)))

(declare-fun c!20039 () Bool)

(assert (=> b!112168 (= c!20039 (validKeyInArray!0 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112169 () Bool)

(declare-fun e!72912 () Bool)

(assert (=> b!112169 (= e!72912 (contains!832 Nil!1627 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!31829 () Bool)

(declare-fun res!55321 () Bool)

(declare-fun e!72913 () Bool)

(assert (=> d!31829 (=> res!55321 e!72913)))

(assert (=> d!31829 (= res!55321 (bvsge #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(assert (=> d!31829 (= (arrayNoDuplicates!0 (_keys!4364 newMap!16) #b00000000000000000000000000000000 Nil!1627) e!72913)))

(declare-fun b!112170 () Bool)

(assert (=> b!112170 (= e!72913 e!72911)))

(declare-fun res!55319 () Bool)

(assert (=> b!112170 (=> (not res!55319) (not e!72911))))

(assert (=> b!112170 (= res!55319 (not e!72912))))

(declare-fun res!55320 () Bool)

(assert (=> b!112170 (=> (not res!55320) (not e!72912))))

(assert (=> b!112170 (= res!55320 (validKeyInArray!0 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112171 () Bool)

(assert (=> b!112171 (= e!72914 call!12030)))

(declare-fun bm!12027 () Bool)

(assert (=> bm!12027 (= call!12030 (arrayNoDuplicates!0 (_keys!4364 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!20039 (Cons!1626 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000) Nil!1627) Nil!1627)))))

(assert (= (and d!31829 (not res!55321)) b!112170))

(assert (= (and b!112170 res!55320) b!112169))

(assert (= (and b!112170 res!55319) b!112168))

(assert (= (and b!112168 c!20039) b!112171))

(assert (= (and b!112168 (not c!20039)) b!112167))

(assert (= (or b!112171 b!112167) bm!12027))

(declare-fun m!127671 () Bool)

(assert (=> b!112168 m!127671))

(assert (=> b!112168 m!127671))

(declare-fun m!127673 () Bool)

(assert (=> b!112168 m!127673))

(assert (=> b!112169 m!127671))

(assert (=> b!112169 m!127671))

(declare-fun m!127675 () Bool)

(assert (=> b!112169 m!127675))

(assert (=> b!112170 m!127671))

(assert (=> b!112170 m!127671))

(assert (=> b!112170 m!127673))

(assert (=> bm!12027 m!127671))

(declare-fun m!127677 () Bool)

(assert (=> bm!12027 m!127677))

(assert (=> b!111871 d!31829))

(declare-fun d!31831 () Bool)

(declare-fun e!72915 () Bool)

(assert (=> d!31831 e!72915))

(declare-fun res!55322 () Bool)

(assert (=> d!31831 (=> res!55322 e!72915)))

(declare-fun lt!57901 () Bool)

(assert (=> d!31831 (= res!55322 (not lt!57901))))

(declare-fun lt!57902 () Bool)

(assert (=> d!31831 (= lt!57901 lt!57902)))

(declare-fun lt!57903 () Unit!3468)

(declare-fun e!72916 () Unit!3468)

(assert (=> d!31831 (= lt!57903 e!72916)))

(declare-fun c!20040 () Bool)

(assert (=> d!31831 (= c!20040 lt!57902)))

(assert (=> d!31831 (= lt!57902 (containsKey!161 (toList!794 lt!57724) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!31831 (= (contains!831 lt!57724 #b1000000000000000000000000000000000000000000000000000000000000000) lt!57901)))

(declare-fun b!112172 () Bool)

(declare-fun lt!57904 () Unit!3468)

(assert (=> b!112172 (= e!72916 lt!57904)))

(assert (=> b!112172 (= lt!57904 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 lt!57724) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112172 (isDefined!111 (getValueByKey!157 (toList!794 lt!57724) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112173 () Bool)

(declare-fun Unit!3482 () Unit!3468)

(assert (=> b!112173 (= e!72916 Unit!3482)))

(declare-fun b!112174 () Bool)

(assert (=> b!112174 (= e!72915 (isDefined!111 (getValueByKey!157 (toList!794 lt!57724) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!31831 c!20040) b!112172))

(assert (= (and d!31831 (not c!20040)) b!112173))

(assert (= (and d!31831 (not res!55322)) b!112174))

(declare-fun m!127679 () Bool)

(assert (=> d!31831 m!127679))

(declare-fun m!127681 () Bool)

(assert (=> b!112172 m!127681))

(declare-fun m!127683 () Bool)

(assert (=> b!112172 m!127683))

(assert (=> b!112172 m!127683))

(declare-fun m!127685 () Bool)

(assert (=> b!112172 m!127685))

(assert (=> b!112174 m!127683))

(assert (=> b!112174 m!127683))

(assert (=> b!112174 m!127685))

(assert (=> bm!11929 d!31831))

(declare-fun b!112183 () Bool)

(declare-fun e!72921 () (_ BitVec 32))

(declare-fun call!12033 () (_ BitVec 32))

(assert (=> b!112183 (= e!72921 call!12033)))

(declare-fun bm!12030 () Bool)

(assert (=> bm!12030 (= call!12033 (arrayCountValidKeys!0 (_keys!4364 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2333 (_keys!4364 newMap!16))))))

(declare-fun d!31833 () Bool)

(declare-fun lt!57907 () (_ BitVec 32))

(assert (=> d!31833 (and (bvsge lt!57907 #b00000000000000000000000000000000) (bvsle lt!57907 (bvsub (size!2333 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!72922 () (_ BitVec 32))

(assert (=> d!31833 (= lt!57907 e!72922)))

(declare-fun c!20045 () Bool)

(assert (=> d!31833 (= c!20045 (bvsge #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(assert (=> d!31833 (and (bvsle #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2333 (_keys!4364 newMap!16)) (size!2333 (_keys!4364 newMap!16))))))

(assert (=> d!31833 (= (arrayCountValidKeys!0 (_keys!4364 newMap!16) #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))) lt!57907)))

(declare-fun b!112184 () Bool)

(assert (=> b!112184 (= e!72921 (bvadd #b00000000000000000000000000000001 call!12033))))

(declare-fun b!112185 () Bool)

(assert (=> b!112185 (= e!72922 e!72921)))

(declare-fun c!20046 () Bool)

(assert (=> b!112185 (= c!20046 (validKeyInArray!0 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112186 () Bool)

(assert (=> b!112186 (= e!72922 #b00000000000000000000000000000000)))

(assert (= (and d!31833 c!20045) b!112186))

(assert (= (and d!31833 (not c!20045)) b!112185))

(assert (= (and b!112185 c!20046) b!112184))

(assert (= (and b!112185 (not c!20046)) b!112183))

(assert (= (or b!112184 b!112183) bm!12030))

(declare-fun m!127687 () Bool)

(assert (=> bm!12030 m!127687))

(assert (=> b!112185 m!127671))

(assert (=> b!112185 m!127671))

(assert (=> b!112185 m!127673))

(assert (=> b!111869 d!31833))

(declare-fun d!31835 () Bool)

(declare-fun get!1356 (Option!163) V!3249)

(assert (=> d!31835 (= (apply!101 lt!57724 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1356 (getValueByKey!157 (toList!794 lt!57724) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4607 () Bool)

(assert (= bs!4607 d!31835))

(declare-fun m!127689 () Bool)

(assert (=> bs!4607 m!127689))

(assert (=> bs!4607 m!127689))

(declare-fun m!127691 () Bool)

(assert (=> bs!4607 m!127691))

(assert (=> b!111854 d!31835))

(declare-fun d!31837 () Bool)

(assert (=> d!31837 (= (inRange!0 (ite c!20000 (ite c!19995 (index!3212 lt!57857) (ite c!19992 (index!3211 lt!57873) (index!3214 lt!57873))) (ite c!19998 (index!3212 lt!57862) (ite c!19999 (index!3211 lt!57854) (index!3214 lt!57854)))) (mask!6824 newMap!16)) (and (bvsge (ite c!20000 (ite c!19995 (index!3212 lt!57857) (ite c!19992 (index!3211 lt!57873) (index!3214 lt!57873))) (ite c!19998 (index!3212 lt!57862) (ite c!19999 (index!3211 lt!57854) (index!3214 lt!57854)))) #b00000000000000000000000000000000) (bvslt (ite c!20000 (ite c!19995 (index!3212 lt!57857) (ite c!19992 (index!3211 lt!57873) (index!3214 lt!57873))) (ite c!19998 (index!3212 lt!57862) (ite c!19999 (index!3211 lt!57854) (index!3214 lt!57854)))) (bvadd (mask!6824 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!12003 d!31837))

(assert (=> bm!11995 d!31779))

(declare-fun d!31839 () Bool)

(declare-fun e!72923 () Bool)

(assert (=> d!31839 e!72923))

(declare-fun res!55323 () Bool)

(assert (=> d!31839 (=> res!55323 e!72923)))

(declare-fun lt!57908 () Bool)

(assert (=> d!31839 (= res!55323 (not lt!57908))))

(declare-fun lt!57909 () Bool)

(assert (=> d!31839 (= lt!57908 lt!57909)))

(declare-fun lt!57910 () Unit!3468)

(declare-fun e!72924 () Unit!3468)

(assert (=> d!31839 (= lt!57910 e!72924)))

(declare-fun c!20047 () Bool)

(assert (=> d!31839 (= c!20047 lt!57909)))

(assert (=> d!31839 (= lt!57909 (containsKey!161 (toList!794 call!12012) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (=> d!31839 (= (contains!831 call!12012 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) lt!57908)))

(declare-fun b!112187 () Bool)

(declare-fun lt!57911 () Unit!3468)

(assert (=> b!112187 (= e!72924 lt!57911)))

(assert (=> b!112187 (= lt!57911 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 call!12012) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (=> b!112187 (isDefined!111 (getValueByKey!157 (toList!794 call!12012) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun b!112188 () Bool)

(declare-fun Unit!3483 () Unit!3468)

(assert (=> b!112188 (= e!72924 Unit!3483)))

(declare-fun b!112189 () Bool)

(assert (=> b!112189 (= e!72923 (isDefined!111 (getValueByKey!157 (toList!794 call!12012) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355))))))

(assert (= (and d!31839 c!20047) b!112187))

(assert (= (and d!31839 (not c!20047)) b!112188))

(assert (= (and d!31839 (not res!55323)) b!112189))

(assert (=> d!31839 m!127199))

(declare-fun m!127693 () Bool)

(assert (=> d!31839 m!127693))

(assert (=> b!112187 m!127199))

(declare-fun m!127695 () Bool)

(assert (=> b!112187 m!127695))

(assert (=> b!112187 m!127199))

(declare-fun m!127697 () Bool)

(assert (=> b!112187 m!127697))

(assert (=> b!112187 m!127697))

(declare-fun m!127699 () Bool)

(assert (=> b!112187 m!127699))

(assert (=> b!112189 m!127199))

(assert (=> b!112189 m!127697))

(assert (=> b!112189 m!127697))

(assert (=> b!112189 m!127699))

(assert (=> b!112035 d!31839))

(declare-fun d!31841 () Bool)

(assert (=> d!31841 (= (validKeyInArray!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!111915 d!31841))

(assert (=> b!111836 d!31841))

(assert (=> bm!11932 d!31795))

(declare-fun d!31843 () Bool)

(declare-fun c!20048 () Bool)

(assert (=> d!31843 (= c!20048 ((_ is ValueCellFull!1007) (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!72925 () V!3249)

(assert (=> d!31843 (= (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!72925)))

(declare-fun b!112190 () Bool)

(assert (=> b!112190 (= e!72925 (get!1354 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!112191 () Bool)

(assert (=> b!112191 (= e!72925 (get!1355 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!31843 c!20048) b!112190))

(assert (= (and d!31843 (not c!20048)) b!112191))

(assert (=> b!112190 m!127433))

(assert (=> b!112190 m!127203))

(declare-fun m!127701 () Bool)

(assert (=> b!112190 m!127701))

(assert (=> b!112191 m!127433))

(assert (=> b!112191 m!127203))

(declare-fun m!127703 () Bool)

(assert (=> b!112191 m!127703))

(assert (=> b!111923 d!31843))

(declare-fun d!31845 () Bool)

(declare-fun e!72926 () Bool)

(assert (=> d!31845 e!72926))

(declare-fun res!55325 () Bool)

(assert (=> d!31845 (=> (not res!55325) (not e!72926))))

(declare-fun lt!57912 () ListLongMap!1557)

(assert (=> d!31845 (= res!55325 (contains!831 lt!57912 (_1!1213 (tuple2!2405 lt!57762 lt!57761))))))

(declare-fun lt!57915 () List!1629)

(assert (=> d!31845 (= lt!57912 (ListLongMap!1558 lt!57915))))

(declare-fun lt!57914 () Unit!3468)

(declare-fun lt!57913 () Unit!3468)

(assert (=> d!31845 (= lt!57914 lt!57913)))

(assert (=> d!31845 (= (getValueByKey!157 lt!57915 (_1!1213 (tuple2!2405 lt!57762 lt!57761))) (Some!162 (_2!1213 (tuple2!2405 lt!57762 lt!57761))))))

(assert (=> d!31845 (= lt!57913 (lemmaContainsTupThenGetReturnValue!76 lt!57915 (_1!1213 (tuple2!2405 lt!57762 lt!57761)) (_2!1213 (tuple2!2405 lt!57762 lt!57761))))))

(assert (=> d!31845 (= lt!57915 (insertStrictlySorted!79 (toList!794 lt!57764) (_1!1213 (tuple2!2405 lt!57762 lt!57761)) (_2!1213 (tuple2!2405 lt!57762 lt!57761))))))

(assert (=> d!31845 (= (+!140 lt!57764 (tuple2!2405 lt!57762 lt!57761)) lt!57912)))

(declare-fun b!112192 () Bool)

(declare-fun res!55324 () Bool)

(assert (=> b!112192 (=> (not res!55324) (not e!72926))))

(assert (=> b!112192 (= res!55324 (= (getValueByKey!157 (toList!794 lt!57912) (_1!1213 (tuple2!2405 lt!57762 lt!57761))) (Some!162 (_2!1213 (tuple2!2405 lt!57762 lt!57761)))))))

(declare-fun b!112193 () Bool)

(assert (=> b!112193 (= e!72926 (contains!833 (toList!794 lt!57912) (tuple2!2405 lt!57762 lt!57761)))))

(assert (= (and d!31845 res!55325) b!112192))

(assert (= (and b!112192 res!55324) b!112193))

(declare-fun m!127705 () Bool)

(assert (=> d!31845 m!127705))

(declare-fun m!127707 () Bool)

(assert (=> d!31845 m!127707))

(declare-fun m!127709 () Bool)

(assert (=> d!31845 m!127709))

(declare-fun m!127711 () Bool)

(assert (=> d!31845 m!127711))

(declare-fun m!127713 () Bool)

(assert (=> b!112192 m!127713))

(declare-fun m!127715 () Bool)

(assert (=> b!112193 m!127715))

(assert (=> b!111923 d!31845))

(declare-fun d!31847 () Bool)

(declare-fun e!72927 () Bool)

(assert (=> d!31847 e!72927))

(declare-fun res!55326 () Bool)

(assert (=> d!31847 (=> res!55326 e!72927)))

(declare-fun lt!57916 () Bool)

(assert (=> d!31847 (= res!55326 (not lt!57916))))

(declare-fun lt!57917 () Bool)

(assert (=> d!31847 (= lt!57916 lt!57917)))

(declare-fun lt!57918 () Unit!3468)

(declare-fun e!72928 () Unit!3468)

(assert (=> d!31847 (= lt!57918 e!72928)))

(declare-fun c!20049 () Bool)

(assert (=> d!31847 (= c!20049 lt!57917)))

(assert (=> d!31847 (= lt!57917 (containsKey!161 (toList!794 (+!140 lt!57764 (tuple2!2405 lt!57762 lt!57761))) lt!57763))))

(assert (=> d!31847 (= (contains!831 (+!140 lt!57764 (tuple2!2405 lt!57762 lt!57761)) lt!57763) lt!57916)))

(declare-fun b!112194 () Bool)

(declare-fun lt!57919 () Unit!3468)

(assert (=> b!112194 (= e!72928 lt!57919)))

(assert (=> b!112194 (= lt!57919 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 (+!140 lt!57764 (tuple2!2405 lt!57762 lt!57761))) lt!57763))))

(assert (=> b!112194 (isDefined!111 (getValueByKey!157 (toList!794 (+!140 lt!57764 (tuple2!2405 lt!57762 lt!57761))) lt!57763))))

(declare-fun b!112195 () Bool)

(declare-fun Unit!3484 () Unit!3468)

(assert (=> b!112195 (= e!72928 Unit!3484)))

(declare-fun b!112196 () Bool)

(assert (=> b!112196 (= e!72927 (isDefined!111 (getValueByKey!157 (toList!794 (+!140 lt!57764 (tuple2!2405 lt!57762 lt!57761))) lt!57763)))))

(assert (= (and d!31847 c!20049) b!112194))

(assert (= (and d!31847 (not c!20049)) b!112195))

(assert (= (and d!31847 (not res!55326)) b!112196))

(declare-fun m!127717 () Bool)

(assert (=> d!31847 m!127717))

(declare-fun m!127719 () Bool)

(assert (=> b!112194 m!127719))

(declare-fun m!127721 () Bool)

(assert (=> b!112194 m!127721))

(assert (=> b!112194 m!127721))

(declare-fun m!127723 () Bool)

(assert (=> b!112194 m!127723))

(assert (=> b!112196 m!127721))

(assert (=> b!112196 m!127721))

(assert (=> b!112196 m!127723))

(assert (=> b!111923 d!31847))

(declare-fun d!31849 () Bool)

(assert (=> d!31849 (not (contains!831 (+!140 lt!57764 (tuple2!2405 lt!57762 lt!57761)) lt!57763))))

(declare-fun lt!57922 () Unit!3468)

(declare-fun choose!708 (ListLongMap!1557 (_ BitVec 64) V!3249 (_ BitVec 64)) Unit!3468)

(assert (=> d!31849 (= lt!57922 (choose!708 lt!57764 lt!57762 lt!57761 lt!57763))))

(declare-fun e!72931 () Bool)

(assert (=> d!31849 e!72931))

(declare-fun res!55329 () Bool)

(assert (=> d!31849 (=> (not res!55329) (not e!72931))))

(assert (=> d!31849 (= res!55329 (not (contains!831 lt!57764 lt!57763)))))

(assert (=> d!31849 (= (addStillNotContains!50 lt!57764 lt!57762 lt!57761 lt!57763) lt!57922)))

(declare-fun b!112200 () Bool)

(assert (=> b!112200 (= e!72931 (not (= lt!57762 lt!57763)))))

(assert (= (and d!31849 res!55329) b!112200))

(assert (=> d!31849 m!127489))

(assert (=> d!31849 m!127489))

(assert (=> d!31849 m!127491))

(declare-fun m!127725 () Bool)

(assert (=> d!31849 m!127725))

(declare-fun m!127727 () Bool)

(assert (=> d!31849 m!127727))

(assert (=> b!111923 d!31849))

(declare-fun d!31851 () Bool)

(declare-fun e!72932 () Bool)

(assert (=> d!31851 e!72932))

(declare-fun res!55331 () Bool)

(assert (=> d!31851 (=> (not res!55331) (not e!72932))))

(declare-fun lt!57923 () ListLongMap!1557)

(assert (=> d!31851 (= res!55331 (contains!831 lt!57923 (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!57926 () List!1629)

(assert (=> d!31851 (= lt!57923 (ListLongMap!1558 lt!57926))))

(declare-fun lt!57925 () Unit!3468)

(declare-fun lt!57924 () Unit!3468)

(assert (=> d!31851 (= lt!57925 lt!57924)))

(assert (=> d!31851 (= (getValueByKey!157 lt!57926 (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!162 (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!31851 (= lt!57924 (lemmaContainsTupThenGetReturnValue!76 lt!57926 (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!31851 (= lt!57926 (insertStrictlySorted!79 (toList!794 call!11942) (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!31851 (= (+!140 call!11942 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!57923)))

(declare-fun b!112201 () Bool)

(declare-fun res!55330 () Bool)

(assert (=> b!112201 (=> (not res!55330) (not e!72932))))

(assert (=> b!112201 (= res!55330 (= (getValueByKey!157 (toList!794 lt!57923) (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!162 (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!112202 () Bool)

(assert (=> b!112202 (= e!72932 (contains!833 (toList!794 lt!57923) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!31851 res!55331) b!112201))

(assert (= (and b!112201 res!55330) b!112202))

(declare-fun m!127729 () Bool)

(assert (=> d!31851 m!127729))

(declare-fun m!127731 () Bool)

(assert (=> d!31851 m!127731))

(declare-fun m!127733 () Bool)

(assert (=> d!31851 m!127733))

(declare-fun m!127735 () Bool)

(assert (=> d!31851 m!127735))

(declare-fun m!127737 () Bool)

(assert (=> b!112201 m!127737))

(declare-fun m!127739 () Bool)

(assert (=> b!112202 m!127739))

(assert (=> b!111923 d!31851))

(declare-fun d!31853 () Bool)

(assert (=> d!31853 (= (map!1284 (_2!1214 lt!57849)) (getCurrentListMap!470 (_keys!4364 (_2!1214 lt!57849)) (_values!2630 (_2!1214 lt!57849)) (mask!6824 (_2!1214 lt!57849)) (extraKeys!2440 (_2!1214 lt!57849)) (zeroValue!2516 (_2!1214 lt!57849)) (minValue!2516 (_2!1214 lt!57849)) #b00000000000000000000000000000000 (defaultEntry!2647 (_2!1214 lt!57849))))))

(declare-fun bs!4608 () Bool)

(assert (= bs!4608 d!31853))

(declare-fun m!127741 () Bool)

(assert (=> bs!4608 m!127741))

(assert (=> bm!11990 d!31853))

(declare-fun d!31855 () Bool)

(declare-fun lt!57929 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!115 (List!1629) (InoxSet tuple2!2404))

(assert (=> d!31855 (= lt!57929 (select (content!115 (toList!794 lt!57743)) lt!57568))))

(declare-fun e!72937 () Bool)

(assert (=> d!31855 (= lt!57929 e!72937)))

(declare-fun res!55336 () Bool)

(assert (=> d!31855 (=> (not res!55336) (not e!72937))))

(assert (=> d!31855 (= res!55336 ((_ is Cons!1625) (toList!794 lt!57743)))))

(assert (=> d!31855 (= (contains!833 (toList!794 lt!57743) lt!57568) lt!57929)))

(declare-fun b!112207 () Bool)

(declare-fun e!72938 () Bool)

(assert (=> b!112207 (= e!72937 e!72938)))

(declare-fun res!55337 () Bool)

(assert (=> b!112207 (=> res!55337 e!72938)))

(assert (=> b!112207 (= res!55337 (= (h!2225 (toList!794 lt!57743)) lt!57568))))

(declare-fun b!112208 () Bool)

(assert (=> b!112208 (= e!72938 (contains!833 (t!5778 (toList!794 lt!57743)) lt!57568))))

(assert (= (and d!31855 res!55336) b!112207))

(assert (= (and b!112207 (not res!55337)) b!112208))

(declare-fun m!127743 () Bool)

(assert (=> d!31855 m!127743))

(declare-fun m!127745 () Bool)

(assert (=> d!31855 m!127745))

(declare-fun m!127747 () Bool)

(assert (=> b!112208 m!127747))

(assert (=> b!111889 d!31855))

(assert (=> d!31767 d!31771))

(declare-fun d!31857 () Bool)

(assert (=> d!31857 (not (arrayContainsKey!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!31857 true))

(declare-fun _$68!115 () Unit!3468)

(assert (=> d!31857 (= (choose!68 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (Cons!1626 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) Nil!1627)) _$68!115)))

(declare-fun bs!4609 () Bool)

(assert (= bs!4609 d!31857))

(assert (=> bs!4609 m!127199))

(assert (=> bs!4609 m!127241))

(assert (=> d!31767 d!31857))

(declare-fun d!31859 () Bool)

(declare-fun isEmpty!384 (List!1629) Bool)

(assert (=> d!31859 (= (isEmpty!383 lt!57766) (isEmpty!384 (toList!794 lt!57766)))))

(declare-fun bs!4610 () Bool)

(assert (= bs!4610 d!31859))

(declare-fun m!127749 () Bool)

(assert (=> bs!4610 m!127749))

(assert (=> b!111919 d!31859))

(assert (=> b!111846 d!31841))

(declare-fun d!31861 () Bool)

(declare-fun res!55338 () Bool)

(declare-fun e!72939 () Bool)

(assert (=> d!31861 (=> res!55338 e!72939)))

(assert (=> d!31861 (= res!55338 (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (=> d!31861 (= (arrayContainsKey!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!72939)))

(declare-fun b!112209 () Bool)

(declare-fun e!72940 () Bool)

(assert (=> b!112209 (= e!72939 e!72940)))

(declare-fun res!55339 () Bool)

(assert (=> b!112209 (=> (not res!55339) (not e!72940))))

(assert (=> b!112209 (= res!55339 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(declare-fun b!112210 () Bool)

(assert (=> b!112210 (= e!72940 (arrayContainsKey!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!31861 (not res!55338)) b!112209))

(assert (= (and b!112209 res!55339) b!112210))

(declare-fun m!127751 () Bool)

(assert (=> d!31861 m!127751))

(assert (=> b!112210 m!127199))

(declare-fun m!127753 () Bool)

(assert (=> b!112210 m!127753))

(assert (=> b!111772 d!31861))

(assert (=> b!112054 d!31811))

(declare-fun b!112245 () Bool)

(declare-fun e!72959 () Bool)

(declare-fun call!12045 () Bool)

(assert (=> b!112245 (= e!72959 (not call!12045))))

(declare-fun b!112246 () Bool)

(declare-fun res!55366 () Bool)

(declare-fun lt!57994 () SeekEntryResult!265)

(assert (=> b!112246 (= res!55366 (= (select (arr!2074 (_keys!4364 newMap!16)) (index!3214 lt!57994)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!72963 () Bool)

(assert (=> b!112246 (=> (not res!55366) (not e!72963))))

(declare-fun b!112247 () Bool)

(declare-fun res!55365 () Bool)

(assert (=> b!112247 (=> (not res!55365) (not e!72959))))

(declare-fun call!12043 () Bool)

(assert (=> b!112247 (= res!55365 call!12043)))

(declare-fun e!72958 () Bool)

(assert (=> b!112247 (= e!72958 e!72959)))

(declare-fun b!112248 () Bool)

(declare-fun res!55359 () Bool)

(declare-fun e!72964 () Bool)

(assert (=> b!112248 (=> (not res!55359) (not e!72964))))

(declare-fun lt!58006 () tuple2!2406)

(assert (=> b!112248 (= res!55359 (contains!831 (map!1284 (_2!1214 lt!58006)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun bm!12039 () Bool)

(declare-fun call!12042 () Bool)

(assert (=> bm!12039 (= call!12043 call!12042)))

(declare-fun d!31863 () Bool)

(assert (=> d!31863 e!72964))

(declare-fun res!55361 () Bool)

(assert (=> d!31863 (=> (not res!55361) (not e!72964))))

(assert (=> d!31863 (= res!55361 (_1!1214 lt!58006))))

(assert (=> d!31863 (= lt!58006 (tuple2!2407 true (LongMapFixedSize!923 (defaultEntry!2647 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (bvadd (_size!510 newMap!16) #b00000000000000000000000000000001) (array!4380 (store (arr!2074 (_keys!4364 newMap!16)) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) (size!2333 (_keys!4364 newMap!16))) (array!4382 (store (arr!2075 (_values!2630 newMap!16)) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (ValueCellFull!1007 lt!57575)) (size!2334 (_values!2630 newMap!16))) (_vacant!510 newMap!16))))))

(declare-fun lt!57990 () Unit!3468)

(declare-fun lt!58008 () Unit!3468)

(assert (=> d!31863 (= lt!57990 lt!58008)))

(declare-fun lt!57995 () array!4381)

(declare-fun lt!57996 () array!4379)

(assert (=> d!31863 (contains!831 (getCurrentListMap!470 lt!57996 lt!57995 (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (select (store (arr!2074 (_keys!4364 newMap!16)) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865))))))

(assert (=> d!31863 (= lt!58008 (lemmaValidKeyInArrayIsInListMap!109 lt!57996 lt!57995 (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (defaultEntry!2647 newMap!16)))))

(assert (=> d!31863 (= lt!57995 (array!4382 (store (arr!2075 (_values!2630 newMap!16)) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (ValueCellFull!1007 lt!57575)) (size!2334 (_values!2630 newMap!16))))))

(assert (=> d!31863 (= lt!57996 (array!4380 (store (arr!2074 (_keys!4364 newMap!16)) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) (size!2333 (_keys!4364 newMap!16))))))

(declare-fun lt!58012 () Unit!3468)

(declare-fun lt!58009 () Unit!3468)

(assert (=> d!31863 (= lt!58012 lt!58009)))

(declare-fun lt!58010 () array!4379)

(assert (=> d!31863 (= (arrayCountValidKeys!0 lt!58010 (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (bvadd (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4379 (_ BitVec 32)) Unit!3468)

(assert (=> d!31863 (= lt!58009 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!58010 (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865))))))

(assert (=> d!31863 (= lt!58010 (array!4380 (store (arr!2074 (_keys!4364 newMap!16)) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) (size!2333 (_keys!4364 newMap!16))))))

(declare-fun lt!57997 () Unit!3468)

(declare-fun lt!58001 () Unit!3468)

(assert (=> d!31863 (= lt!57997 lt!58001)))

(declare-fun lt!58014 () array!4379)

(assert (=> d!31863 (arrayContainsKey!0 lt!58014 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!31863 (= lt!58001 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!58014 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865))))))

(assert (=> d!31863 (= lt!58014 (array!4380 (store (arr!2074 (_keys!4364 newMap!16)) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) (size!2333 (_keys!4364 newMap!16))))))

(declare-fun lt!58000 () Unit!3468)

(declare-fun lt!58019 () Unit!3468)

(assert (=> d!31863 (= lt!58000 lt!58019)))

(assert (=> d!31863 (= (+!140 (getCurrentListMap!470 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)) (getCurrentListMap!470 (array!4380 (store (arr!2074 (_keys!4364 newMap!16)) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) (size!2333 (_keys!4364 newMap!16))) (array!4382 (store (arr!2075 (_values!2630 newMap!16)) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (ValueCellFull!1007 lt!57575)) (size!2334 (_values!2630 newMap!16))) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!33 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 32) (_ BitVec 64) V!3249 Int) Unit!3468)

(assert (=> d!31863 (= lt!58019 (lemmaAddValidKeyToArrayThenAddPairToListMap!33 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58016 () Unit!3468)

(declare-fun lt!58004 () Unit!3468)

(assert (=> d!31863 (= lt!58016 lt!58004)))

(assert (=> d!31863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4380 (store (arr!2074 (_keys!4364 newMap!16)) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) (size!2333 (_keys!4364 newMap!16))) (mask!6824 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4379 (_ BitVec 32) (_ BitVec 32)) Unit!3468)

(assert (=> d!31863 (= lt!58004 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (_keys!4364 newMap!16) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (mask!6824 newMap!16)))))

(declare-fun lt!58018 () Unit!3468)

(declare-fun lt!57992 () Unit!3468)

(assert (=> d!31863 (= lt!58018 lt!57992)))

(assert (=> d!31863 (= (arrayCountValidKeys!0 (array!4380 (store (arr!2074 (_keys!4364 newMap!16)) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) (size!2333 (_keys!4364 newMap!16))) #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4364 newMap!16) #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4379 (_ BitVec 32) (_ BitVec 64)) Unit!3468)

(assert (=> d!31863 (= lt!57992 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4364 newMap!16) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun lt!58007 () Unit!3468)

(declare-fun lt!57993 () Unit!3468)

(assert (=> d!31863 (= lt!58007 lt!57993)))

(declare-fun lt!57991 () (_ BitVec 32))

(declare-fun lt!58017 () List!1630)

(assert (=> d!31863 (arrayNoDuplicates!0 (array!4380 (store (arr!2074 (_keys!4364 newMap!16)) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) (size!2333 (_keys!4364 newMap!16))) lt!57991 lt!58017)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4379 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1630) Unit!3468)

(assert (=> d!31863 (= lt!57993 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4364 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865)) lt!57991 lt!58017))))

(assert (=> d!31863 (= lt!58017 Nil!1627)))

(assert (=> d!31863 (= lt!57991 #b00000000000000000000000000000000)))

(declare-fun lt!57998 () Unit!3468)

(declare-fun e!72962 () Unit!3468)

(assert (=> d!31863 (= lt!57998 e!72962)))

(declare-fun c!20059 () Bool)

(assert (=> d!31863 (= c!20059 (arrayContainsKey!0 (_keys!4364 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!58013 () Unit!3468)

(declare-fun e!72960 () Unit!3468)

(assert (=> d!31863 (= lt!58013 e!72960)))

(declare-fun c!20058 () Bool)

(assert (=> d!31863 (= c!20058 (contains!831 (getCurrentListMap!470 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (=> d!31863 (valid!433 newMap!16)))

(assert (=> d!31863 (= (updateHelperNewKey!50 newMap!16 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575 (ite c!19994 (index!3214 lt!57865) (index!3211 lt!57865))) lt!58006)))

(declare-fun bm!12040 () Bool)

(assert (=> bm!12040 (= call!12045 (arrayContainsKey!0 (_keys!4364 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!112249 () Bool)

(assert (=> b!112249 (= e!72964 (= (map!1284 (_2!1214 lt!58006)) (+!140 (map!1284 newMap!16) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(declare-fun b!112250 () Bool)

(declare-fun res!55362 () Bool)

(assert (=> b!112250 (=> (not res!55362) (not e!72959))))

(assert (=> b!112250 (= res!55362 (= (select (arr!2074 (_keys!4364 newMap!16)) (index!3211 lt!57994)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112251 () Bool)

(declare-fun Unit!3485 () Unit!3468)

(assert (=> b!112251 (= e!72962 Unit!3485)))

(declare-fun lt!58011 () Unit!3468)

(declare-fun lemmaArrayContainsKeyThenInListMap!33 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 64) (_ BitVec 32) Int) Unit!3468)

(assert (=> b!112251 (= lt!58011 (lemmaArrayContainsKeyThenInListMap!33 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(assert (=> b!112251 (contains!831 (getCurrentListMap!470 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355))))

(declare-fun lt!58002 () Unit!3468)

(assert (=> b!112251 (= lt!58002 lt!58011)))

(assert (=> b!112251 false))

(declare-fun bm!12041 () Bool)

(declare-fun call!12044 () SeekEntryResult!265)

(assert (=> bm!12041 (= call!12044 (seekEntryOrOpen!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (_keys!4364 newMap!16) (mask!6824 newMap!16)))))

(declare-fun b!112252 () Bool)

(declare-fun res!55358 () Bool)

(assert (=> b!112252 (=> (not res!55358) (not e!72964))))

(assert (=> b!112252 (= res!55358 (valid!433 (_2!1214 lt!58006)))))

(declare-fun b!112253 () Bool)

(declare-fun c!20061 () Bool)

(assert (=> b!112253 (= c!20061 ((_ is MissingVacant!265) lt!57994))))

(declare-fun e!72957 () Bool)

(assert (=> b!112253 (= e!72958 e!72957)))

(declare-fun b!112254 () Bool)

(assert (=> b!112254 (= e!72957 e!72963)))

(declare-fun res!55363 () Bool)

(assert (=> b!112254 (= res!55363 call!12043)))

(assert (=> b!112254 (=> (not res!55363) (not e!72963))))

(declare-fun b!112255 () Bool)

(declare-fun lt!57999 () Unit!3468)

(assert (=> b!112255 (= e!72960 lt!57999)))

(assert (=> b!112255 (= lt!57999 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!50 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)))))

(assert (=> b!112255 (= lt!57994 call!12044)))

(declare-fun c!20060 () Bool)

(assert (=> b!112255 (= c!20060 ((_ is MissingZero!265) lt!57994))))

(assert (=> b!112255 e!72958))

(declare-fun lt!58003 () SeekEntryResult!265)

(declare-fun bm!12042 () Bool)

(assert (=> bm!12042 (= call!12042 (inRange!0 (ite c!20058 (index!3212 lt!58003) (ite c!20060 (index!3211 lt!57994) (index!3214 lt!57994))) (mask!6824 newMap!16)))))

(declare-fun b!112256 () Bool)

(declare-fun Unit!3486 () Unit!3468)

(assert (=> b!112256 (= e!72960 Unit!3486)))

(declare-fun lt!58015 () Unit!3468)

(assert (=> b!112256 (= lt!58015 (lemmaInListMapThenSeekEntryOrOpenFindsIt!50 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)))))

(assert (=> b!112256 (= lt!58003 call!12044)))

(declare-fun res!55360 () Bool)

(assert (=> b!112256 (= res!55360 ((_ is Found!265) lt!58003))))

(declare-fun e!72961 () Bool)

(assert (=> b!112256 (=> (not res!55360) (not e!72961))))

(assert (=> b!112256 e!72961))

(declare-fun lt!58005 () Unit!3468)

(assert (=> b!112256 (= lt!58005 lt!58015)))

(assert (=> b!112256 false))

(declare-fun b!112257 () Bool)

(assert (=> b!112257 (= e!72963 (not call!12045))))

(declare-fun b!112258 () Bool)

(assert (=> b!112258 (= e!72961 (= (select (arr!2074 (_keys!4364 newMap!16)) (index!3212 lt!58003)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun b!112259 () Bool)

(assert (=> b!112259 (= e!72957 ((_ is Undefined!265) lt!57994))))

(declare-fun b!112260 () Bool)

(declare-fun res!55364 () Bool)

(assert (=> b!112260 (= res!55364 call!12042)))

(assert (=> b!112260 (=> (not res!55364) (not e!72961))))

(declare-fun b!112261 () Bool)

(declare-fun Unit!3487 () Unit!3468)

(assert (=> b!112261 (= e!72962 Unit!3487)))

(assert (= (and d!31863 c!20058) b!112256))

(assert (= (and d!31863 (not c!20058)) b!112255))

(assert (= (and b!112256 res!55360) b!112260))

(assert (= (and b!112260 res!55364) b!112258))

(assert (= (and b!112255 c!20060) b!112247))

(assert (= (and b!112255 (not c!20060)) b!112253))

(assert (= (and b!112247 res!55365) b!112250))

(assert (= (and b!112250 res!55362) b!112245))

(assert (= (and b!112253 c!20061) b!112254))

(assert (= (and b!112253 (not c!20061)) b!112259))

(assert (= (and b!112254 res!55363) b!112246))

(assert (= (and b!112246 res!55366) b!112257))

(assert (= (or b!112247 b!112254) bm!12039))

(assert (= (or b!112245 b!112257) bm!12040))

(assert (= (or b!112260 bm!12039) bm!12042))

(assert (= (or b!112256 b!112255) bm!12041))

(assert (= (and d!31863 c!20059) b!112251))

(assert (= (and d!31863 (not c!20059)) b!112261))

(assert (= (and d!31863 res!55361) b!112252))

(assert (= (and b!112252 res!55358) b!112248))

(assert (= (and b!112248 res!55359) b!112249))

(assert (=> bm!12040 m!127199))

(assert (=> bm!12040 m!127557))

(declare-fun m!127755 () Bool)

(assert (=> bm!12042 m!127755))

(assert (=> b!112251 m!127199))

(declare-fun m!127757 () Bool)

(assert (=> b!112251 m!127757))

(assert (=> b!112251 m!127387))

(assert (=> b!112251 m!127387))

(assert (=> b!112251 m!127199))

(declare-fun m!127759 () Bool)

(assert (=> b!112251 m!127759))

(declare-fun m!127761 () Bool)

(assert (=> b!112249 m!127761))

(assert (=> b!112249 m!127195))

(assert (=> b!112249 m!127195))

(declare-fun m!127763 () Bool)

(assert (=> b!112249 m!127763))

(assert (=> bm!12041 m!127199))

(assert (=> bm!12041 m!127593))

(assert (=> b!112248 m!127761))

(assert (=> b!112248 m!127761))

(assert (=> b!112248 m!127199))

(declare-fun m!127765 () Bool)

(assert (=> b!112248 m!127765))

(declare-fun m!127767 () Bool)

(assert (=> d!31863 m!127767))

(declare-fun m!127769 () Bool)

(assert (=> d!31863 m!127769))

(declare-fun m!127771 () Bool)

(assert (=> d!31863 m!127771))

(declare-fun m!127773 () Bool)

(assert (=> d!31863 m!127773))

(assert (=> d!31863 m!127199))

(declare-fun m!127775 () Bool)

(assert (=> d!31863 m!127775))

(assert (=> d!31863 m!127447))

(assert (=> d!31863 m!127199))

(declare-fun m!127777 () Bool)

(assert (=> d!31863 m!127777))

(assert (=> d!31863 m!127199))

(declare-fun m!127779 () Bool)

(assert (=> d!31863 m!127779))

(assert (=> d!31863 m!127387))

(assert (=> d!31863 m!127245))

(declare-fun m!127781 () Bool)

(assert (=> d!31863 m!127781))

(declare-fun m!127783 () Bool)

(assert (=> d!31863 m!127783))

(assert (=> d!31863 m!127387))

(declare-fun m!127785 () Bool)

(assert (=> d!31863 m!127785))

(declare-fun m!127787 () Bool)

(assert (=> d!31863 m!127787))

(assert (=> d!31863 m!127199))

(declare-fun m!127789 () Bool)

(assert (=> d!31863 m!127789))

(declare-fun m!127791 () Bool)

(assert (=> d!31863 m!127791))

(assert (=> d!31863 m!127199))

(declare-fun m!127793 () Bool)

(assert (=> d!31863 m!127793))

(declare-fun m!127795 () Bool)

(assert (=> d!31863 m!127795))

(assert (=> d!31863 m!127387))

(assert (=> d!31863 m!127199))

(assert (=> d!31863 m!127759))

(declare-fun m!127797 () Bool)

(assert (=> d!31863 m!127797))

(declare-fun m!127799 () Bool)

(assert (=> d!31863 m!127799))

(assert (=> d!31863 m!127199))

(assert (=> d!31863 m!127557))

(assert (=> d!31863 m!127783))

(assert (=> d!31863 m!127795))

(declare-fun m!127801 () Bool)

(assert (=> d!31863 m!127801))

(assert (=> d!31863 m!127199))

(declare-fun m!127803 () Bool)

(assert (=> d!31863 m!127803))

(declare-fun m!127805 () Bool)

(assert (=> b!112258 m!127805))

(assert (=> b!112255 m!127199))

(assert (=> b!112255 m!127605))

(declare-fun m!127807 () Bool)

(assert (=> b!112252 m!127807))

(assert (=> b!112256 m!127199))

(assert (=> b!112256 m!127591))

(declare-fun m!127809 () Bool)

(assert (=> b!112250 m!127809))

(declare-fun m!127811 () Bool)

(assert (=> b!112246 m!127811))

(assert (=> bm!11999 d!31863))

(declare-fun d!31865 () Bool)

(declare-fun res!55371 () Bool)

(declare-fun e!72969 () Bool)

(assert (=> d!31865 (=> res!55371 e!72969)))

(assert (=> d!31865 (= res!55371 (and ((_ is Cons!1625) (toList!794 lt!57567)) (= (_1!1213 (h!2225 (toList!794 lt!57567))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355))))))

(assert (=> d!31865 (= (containsKey!161 (toList!794 lt!57567) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) e!72969)))

(declare-fun b!112266 () Bool)

(declare-fun e!72970 () Bool)

(assert (=> b!112266 (= e!72969 e!72970)))

(declare-fun res!55372 () Bool)

(assert (=> b!112266 (=> (not res!55372) (not e!72970))))

(assert (=> b!112266 (= res!55372 (and (or (not ((_ is Cons!1625) (toList!794 lt!57567))) (bvsle (_1!1213 (h!2225 (toList!794 lt!57567))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355))) ((_ is Cons!1625) (toList!794 lt!57567)) (bvslt (_1!1213 (h!2225 (toList!794 lt!57567))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355))))))

(declare-fun b!112267 () Bool)

(assert (=> b!112267 (= e!72970 (containsKey!161 (t!5778 (toList!794 lt!57567)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (= (and d!31865 (not res!55371)) b!112266))

(assert (= (and b!112266 res!55372) b!112267))

(assert (=> b!112267 m!127199))

(declare-fun m!127813 () Bool)

(assert (=> b!112267 m!127813))

(assert (=> d!31807 d!31865))

(declare-fun b!112268 () Bool)

(declare-fun e!72974 () Bool)

(declare-fun call!12046 () Bool)

(assert (=> b!112268 (= e!72974 call!12046)))

(declare-fun b!112269 () Bool)

(declare-fun e!72971 () Bool)

(assert (=> b!112269 (= e!72971 e!72974)))

(declare-fun c!20062 () Bool)

(assert (=> b!112269 (= c!20062 (validKeyInArray!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun e!72972 () Bool)

(declare-fun b!112270 () Bool)

(assert (=> b!112270 (= e!72972 (contains!832 (ite c!19926 (Cons!1626 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) Nil!1627) Nil!1627) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!31867 () Bool)

(declare-fun res!55375 () Bool)

(declare-fun e!72973 () Bool)

(assert (=> d!31867 (=> res!55375 e!72973)))

(assert (=> d!31867 (= res!55375 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(assert (=> d!31867 (= (arrayNoDuplicates!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!19926 (Cons!1626 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) Nil!1627) Nil!1627)) e!72973)))

(declare-fun b!112271 () Bool)

(assert (=> b!112271 (= e!72973 e!72971)))

(declare-fun res!55373 () Bool)

(assert (=> b!112271 (=> (not res!55373) (not e!72971))))

(assert (=> b!112271 (= res!55373 (not e!72972))))

(declare-fun res!55374 () Bool)

(assert (=> b!112271 (=> (not res!55374) (not e!72972))))

(assert (=> b!112271 (= res!55374 (validKeyInArray!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!112272 () Bool)

(assert (=> b!112272 (= e!72974 call!12046)))

(declare-fun bm!12043 () Bool)

(assert (=> bm!12043 (= call!12046 (arrayNoDuplicates!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!20062 (Cons!1626 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!19926 (Cons!1626 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) Nil!1627) Nil!1627)) (ite c!19926 (Cons!1626 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) Nil!1627) Nil!1627))))))

(assert (= (and d!31867 (not res!55375)) b!112271))

(assert (= (and b!112271 res!55374) b!112270))

(assert (= (and b!112271 res!55373) b!112269))

(assert (= (and b!112269 c!20062) b!112272))

(assert (= (and b!112269 (not c!20062)) b!112268))

(assert (= (or b!112272 b!112268) bm!12043))

(declare-fun m!127815 () Bool)

(assert (=> b!112269 m!127815))

(assert (=> b!112269 m!127815))

(declare-fun m!127817 () Bool)

(assert (=> b!112269 m!127817))

(assert (=> b!112270 m!127815))

(assert (=> b!112270 m!127815))

(declare-fun m!127819 () Bool)

(assert (=> b!112270 m!127819))

(assert (=> b!112271 m!127815))

(assert (=> b!112271 m!127815))

(assert (=> b!112271 m!127817))

(assert (=> bm!12043 m!127815))

(declare-fun m!127821 () Bool)

(assert (=> bm!12043 m!127821))

(assert (=> bm!11912 d!31867))

(declare-fun d!31869 () Bool)

(assert (=> d!31869 (= (validKeyInArray!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) (and (not (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!111792 d!31869))

(declare-fun d!31871 () Bool)

(declare-fun res!55376 () Bool)

(declare-fun e!72975 () Bool)

(assert (=> d!31871 (=> res!55376 e!72975)))

(assert (=> d!31871 (= res!55376 (= (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (=> d!31871 (= (arrayContainsKey!0 (_keys!4364 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b00000000000000000000000000000000) e!72975)))

(declare-fun b!112273 () Bool)

(declare-fun e!72976 () Bool)

(assert (=> b!112273 (= e!72975 e!72976)))

(declare-fun res!55377 () Bool)

(assert (=> b!112273 (=> (not res!55377) (not e!72976))))

(assert (=> b!112273 (= res!55377 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2333 (_keys!4364 newMap!16))))))

(declare-fun b!112274 () Bool)

(assert (=> b!112274 (= e!72976 (arrayContainsKey!0 (_keys!4364 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!31871 (not res!55376)) b!112273))

(assert (= (and b!112273 res!55377) b!112274))

(assert (=> d!31871 m!127671))

(assert (=> b!112274 m!127199))

(declare-fun m!127823 () Bool)

(assert (=> b!112274 m!127823))

(assert (=> bm!11991 d!31871))

(declare-fun d!31873 () Bool)

(declare-fun lt!58020 () Bool)

(assert (=> d!31873 (= lt!58020 (select (content!115 (toList!794 lt!57772)) lt!57568))))

(declare-fun e!72977 () Bool)

(assert (=> d!31873 (= lt!58020 e!72977)))

(declare-fun res!55378 () Bool)

(assert (=> d!31873 (=> (not res!55378) (not e!72977))))

(assert (=> d!31873 (= res!55378 ((_ is Cons!1625) (toList!794 lt!57772)))))

(assert (=> d!31873 (= (contains!833 (toList!794 lt!57772) lt!57568) lt!58020)))

(declare-fun b!112275 () Bool)

(declare-fun e!72978 () Bool)

(assert (=> b!112275 (= e!72977 e!72978)))

(declare-fun res!55379 () Bool)

(assert (=> b!112275 (=> res!55379 e!72978)))

(assert (=> b!112275 (= res!55379 (= (h!2225 (toList!794 lt!57772)) lt!57568))))

(declare-fun b!112276 () Bool)

(assert (=> b!112276 (= e!72978 (contains!833 (t!5778 (toList!794 lt!57772)) lt!57568))))

(assert (= (and d!31873 res!55378) b!112275))

(assert (= (and b!112275 (not res!55379)) b!112276))

(declare-fun m!127825 () Bool)

(assert (=> d!31873 m!127825))

(declare-fun m!127827 () Bool)

(assert (=> d!31873 m!127827))

(declare-fun m!127829 () Bool)

(assert (=> b!112276 m!127829))

(assert (=> b!111929 d!31873))

(declare-fun d!31875 () Bool)

(declare-fun e!72979 () Bool)

(assert (=> d!31875 e!72979))

(declare-fun res!55380 () Bool)

(assert (=> d!31875 (=> res!55380 e!72979)))

(declare-fun lt!58021 () Bool)

(assert (=> d!31875 (= res!55380 (not lt!58021))))

(declare-fun lt!58022 () Bool)

(assert (=> d!31875 (= lt!58021 lt!58022)))

(declare-fun lt!58023 () Unit!3468)

(declare-fun e!72980 () Unit!3468)

(assert (=> d!31875 (= lt!58023 e!72980)))

(declare-fun c!20063 () Bool)

(assert (=> d!31875 (= c!20063 lt!58022)))

(assert (=> d!31875 (= lt!58022 (containsKey!161 (toList!794 lt!57724) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!31875 (= (contains!831 lt!57724 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!58021)))

(declare-fun b!112277 () Bool)

(declare-fun lt!58024 () Unit!3468)

(assert (=> b!112277 (= e!72980 lt!58024)))

(assert (=> b!112277 (= lt!58024 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 lt!57724) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!112277 (isDefined!111 (getValueByKey!157 (toList!794 lt!57724) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!112278 () Bool)

(declare-fun Unit!3488 () Unit!3468)

(assert (=> b!112278 (= e!72980 Unit!3488)))

(declare-fun b!112279 () Bool)

(assert (=> b!112279 (= e!72979 (isDefined!111 (getValueByKey!157 (toList!794 lt!57724) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!31875 c!20063) b!112277))

(assert (= (and d!31875 (not c!20063)) b!112278))

(assert (= (and d!31875 (not res!55380)) b!112279))

(assert (=> d!31875 m!127373))

(declare-fun m!127831 () Bool)

(assert (=> d!31875 m!127831))

(assert (=> b!112277 m!127373))

(declare-fun m!127833 () Bool)

(assert (=> b!112277 m!127833))

(assert (=> b!112277 m!127373))

(declare-fun m!127835 () Bool)

(assert (=> b!112277 m!127835))

(assert (=> b!112277 m!127835))

(declare-fun m!127837 () Bool)

(assert (=> b!112277 m!127837))

(assert (=> b!112279 m!127373))

(assert (=> b!112279 m!127835))

(assert (=> b!112279 m!127835))

(assert (=> b!112279 m!127837))

(assert (=> b!111844 d!31875))

(declare-fun d!31877 () Bool)

(declare-fun lt!58025 () Bool)

(assert (=> d!31877 (= lt!58025 (select (content!115 (toList!794 lt!57768)) lt!57571))))

(declare-fun e!72981 () Bool)

(assert (=> d!31877 (= lt!58025 e!72981)))

(declare-fun res!55381 () Bool)

(assert (=> d!31877 (=> (not res!55381) (not e!72981))))

(assert (=> d!31877 (= res!55381 ((_ is Cons!1625) (toList!794 lt!57768)))))

(assert (=> d!31877 (= (contains!833 (toList!794 lt!57768) lt!57571) lt!58025)))

(declare-fun b!112280 () Bool)

(declare-fun e!72982 () Bool)

(assert (=> b!112280 (= e!72981 e!72982)))

(declare-fun res!55382 () Bool)

(assert (=> b!112280 (=> res!55382 e!72982)))

(assert (=> b!112280 (= res!55382 (= (h!2225 (toList!794 lt!57768)) lt!57571))))

(declare-fun b!112281 () Bool)

(assert (=> b!112281 (= e!72982 (contains!833 (t!5778 (toList!794 lt!57768)) lt!57571))))

(assert (= (and d!31877 res!55381) b!112280))

(assert (= (and b!112280 (not res!55382)) b!112281))

(declare-fun m!127839 () Bool)

(assert (=> d!31877 m!127839))

(declare-fun m!127841 () Bool)

(assert (=> d!31877 m!127841))

(declare-fun m!127843 () Bool)

(assert (=> b!112281 m!127843))

(assert (=> b!111927 d!31877))

(declare-fun d!31879 () Bool)

(declare-fun e!72983 () Bool)

(assert (=> d!31879 e!72983))

(declare-fun res!55383 () Bool)

(assert (=> d!31879 (=> res!55383 e!72983)))

(declare-fun lt!58026 () Bool)

(assert (=> d!31879 (= res!55383 (not lt!58026))))

(declare-fun lt!58027 () Bool)

(assert (=> d!31879 (= lt!58026 lt!58027)))

(declare-fun lt!58028 () Unit!3468)

(declare-fun e!72984 () Unit!3468)

(assert (=> d!31879 (= lt!58028 e!72984)))

(declare-fun c!20064 () Bool)

(assert (=> d!31879 (= c!20064 lt!58027)))

(assert (=> d!31879 (= lt!58027 (containsKey!161 (toList!794 lt!57724) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!31879 (= (contains!831 lt!57724 #b0000000000000000000000000000000000000000000000000000000000000000) lt!58026)))

(declare-fun b!112282 () Bool)

(declare-fun lt!58029 () Unit!3468)

(assert (=> b!112282 (= e!72984 lt!58029)))

(assert (=> b!112282 (= lt!58029 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 lt!57724) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112282 (isDefined!111 (getValueByKey!157 (toList!794 lt!57724) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112283 () Bool)

(declare-fun Unit!3489 () Unit!3468)

(assert (=> b!112283 (= e!72984 Unit!3489)))

(declare-fun b!112284 () Bool)

(assert (=> b!112284 (= e!72983 (isDefined!111 (getValueByKey!157 (toList!794 lt!57724) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!31879 c!20064) b!112282))

(assert (= (and d!31879 (not c!20064)) b!112283))

(assert (= (and d!31879 (not res!55383)) b!112284))

(declare-fun m!127845 () Bool)

(assert (=> d!31879 m!127845))

(declare-fun m!127847 () Bool)

(assert (=> b!112282 m!127847))

(assert (=> b!112282 m!127689))

(assert (=> b!112282 m!127689))

(declare-fun m!127849 () Bool)

(assert (=> b!112282 m!127849))

(assert (=> b!112284 m!127689))

(assert (=> b!112284 m!127689))

(assert (=> b!112284 m!127849))

(assert (=> bm!11930 d!31879))

(declare-fun call!12050 () ListLongMap!1557)

(declare-fun c!20065 () Bool)

(declare-fun call!12048 () ListLongMap!1557)

(declare-fun call!12051 () ListLongMap!1557)

(declare-fun call!12053 () ListLongMap!1557)

(declare-fun bm!12044 () Bool)

(declare-fun c!20070 () Bool)

(assert (=> bm!12044 (= call!12048 (+!140 (ite c!20070 call!12053 (ite c!20065 call!12050 call!12051)) (ite (or c!20070 c!20065) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 newMap!16)) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!20002 (ite c!19996 (minValue!2516 newMap!16) lt!57575) (minValue!2516 newMap!16))))))))

(declare-fun b!112285 () Bool)

(declare-fun e!72989 () Bool)

(assert (=> b!112285 (= e!72989 (validKeyInArray!0 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun lt!58050 () ListLongMap!1557)

(declare-fun e!72992 () Bool)

(declare-fun b!112286 () Bool)

(assert (=> b!112286 (= e!72992 (= (apply!101 lt!58050 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)) (get!1353 (select (arr!2075 (ite (or c!20002 c!20000) (_values!2630 newMap!16) (array!4382 (store (arr!2075 (_values!2630 newMap!16)) (index!3212 lt!57865) (ValueCellFull!1007 lt!57575)) (size!2334 (_values!2630 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!388 (defaultEntry!2647 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112286 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2334 (ite (or c!20002 c!20000) (_values!2630 newMap!16) (array!4382 (store (arr!2075 (_values!2630 newMap!16)) (index!3212 lt!57865) (ValueCellFull!1007 lt!57575)) (size!2334 (_values!2630 newMap!16)))))))))

(assert (=> b!112286 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(declare-fun bm!12045 () Bool)

(assert (=> bm!12045 (= call!12051 call!12050)))

(declare-fun b!112287 () Bool)

(declare-fun e!72986 () ListLongMap!1557)

(declare-fun e!72988 () ListLongMap!1557)

(assert (=> b!112287 (= e!72986 e!72988)))

(assert (=> b!112287 (= c!20065 (and (not (= (bvand (ite c!20002 (ite c!19996 (extraKeys!2440 newMap!16) lt!57863) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!20002 (ite c!19996 (extraKeys!2440 newMap!16) lt!57863) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12046 () Bool)

(declare-fun call!12047 () Bool)

(assert (=> bm!12046 (= call!12047 (contains!831 lt!58050 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112288 () Bool)

(declare-fun e!72995 () Bool)

(declare-fun e!72993 () Bool)

(assert (=> b!112288 (= e!72995 e!72993)))

(declare-fun res!55385 () Bool)

(declare-fun call!12052 () Bool)

(assert (=> b!112288 (= res!55385 call!12052)))

(assert (=> b!112288 (=> (not res!55385) (not e!72993))))

(declare-fun b!112289 () Bool)

(declare-fun e!72991 () Bool)

(declare-fun e!72996 () Bool)

(assert (=> b!112289 (= e!72991 e!72996)))

(declare-fun res!55386 () Bool)

(assert (=> b!112289 (= res!55386 call!12047)))

(assert (=> b!112289 (=> (not res!55386) (not e!72996))))

(declare-fun b!112290 () Bool)

(assert (=> b!112290 (= e!72996 (= (apply!101 lt!58050 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!20002 (ite c!19996 (minValue!2516 newMap!16) lt!57575) (minValue!2516 newMap!16))))))

(declare-fun c!20066 () Bool)

(declare-fun b!112291 () Bool)

(assert (=> b!112291 (= c!20066 (and (not (= (bvand (ite c!20002 (ite c!19996 (extraKeys!2440 newMap!16) lt!57863) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!20002 (ite c!19996 (extraKeys!2440 newMap!16) lt!57863) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!72990 () ListLongMap!1557)

(assert (=> b!112291 (= e!72988 e!72990)))

(declare-fun b!112292 () Bool)

(declare-fun e!72994 () Bool)

(assert (=> b!112292 (= e!72994 e!72991)))

(declare-fun c!20069 () Bool)

(assert (=> b!112292 (= c!20069 (not (= (bvand (ite c!20002 (ite c!19996 (extraKeys!2440 newMap!16) lt!57863) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12047 () Bool)

(assert (=> bm!12047 (= call!12052 (contains!831 lt!58050 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12048 () Bool)

(declare-fun call!12049 () ListLongMap!1557)

(assert (=> bm!12048 (= call!12049 call!12048)))

(declare-fun b!112293 () Bool)

(declare-fun e!72987 () Bool)

(assert (=> b!112293 (= e!72987 e!72992)))

(declare-fun res!55390 () Bool)

(assert (=> b!112293 (=> (not res!55390) (not e!72992))))

(assert (=> b!112293 (= res!55390 (contains!831 lt!58050 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!112293 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(declare-fun b!112294 () Bool)

(assert (=> b!112294 (= e!72990 call!12051)))

(declare-fun b!112295 () Bool)

(declare-fun e!72985 () Bool)

(assert (=> b!112295 (= e!72985 (validKeyInArray!0 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112296 () Bool)

(assert (=> b!112296 (= e!72991 (not call!12047))))

(declare-fun b!112297 () Bool)

(assert (=> b!112297 (= e!72995 (not call!12052))))

(declare-fun b!112298 () Bool)

(declare-fun res!55387 () Bool)

(assert (=> b!112298 (=> (not res!55387) (not e!72994))))

(assert (=> b!112298 (= res!55387 e!72995)))

(declare-fun c!20068 () Bool)

(assert (=> b!112298 (= c!20068 (not (= (bvand (ite c!20002 (ite c!19996 (extraKeys!2440 newMap!16) lt!57863) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!112299 () Bool)

(declare-fun e!72997 () Unit!3468)

(declare-fun lt!58048 () Unit!3468)

(assert (=> b!112299 (= e!72997 lt!58048)))

(declare-fun lt!58042 () ListLongMap!1557)

(assert (=> b!112299 (= lt!58042 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) (ite (or c!20002 c!20000) (_values!2630 newMap!16) (array!4382 (store (arr!2075 (_values!2630 newMap!16)) (index!3212 lt!57865) (ValueCellFull!1007 lt!57575)) (size!2334 (_values!2630 newMap!16)))) (mask!6824 newMap!16) (ite c!20002 (ite c!19996 (extraKeys!2440 newMap!16) lt!57863) (extraKeys!2440 newMap!16)) (zeroValue!2516 newMap!16) (ite c!20002 (ite c!19996 (minValue!2516 newMap!16) lt!57575) (minValue!2516 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58043 () (_ BitVec 64))

(assert (=> b!112299 (= lt!58043 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58031 () (_ BitVec 64))

(assert (=> b!112299 (= lt!58031 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58046 () Unit!3468)

(assert (=> b!112299 (= lt!58046 (addStillContains!77 lt!58042 lt!58043 (zeroValue!2516 newMap!16) lt!58031))))

(assert (=> b!112299 (contains!831 (+!140 lt!58042 (tuple2!2405 lt!58043 (zeroValue!2516 newMap!16))) lt!58031)))

(declare-fun lt!58032 () Unit!3468)

(assert (=> b!112299 (= lt!58032 lt!58046)))

(declare-fun lt!58044 () ListLongMap!1557)

(assert (=> b!112299 (= lt!58044 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) (ite (or c!20002 c!20000) (_values!2630 newMap!16) (array!4382 (store (arr!2075 (_values!2630 newMap!16)) (index!3212 lt!57865) (ValueCellFull!1007 lt!57575)) (size!2334 (_values!2630 newMap!16)))) (mask!6824 newMap!16) (ite c!20002 (ite c!19996 (extraKeys!2440 newMap!16) lt!57863) (extraKeys!2440 newMap!16)) (zeroValue!2516 newMap!16) (ite c!20002 (ite c!19996 (minValue!2516 newMap!16) lt!57575) (minValue!2516 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58034 () (_ BitVec 64))

(assert (=> b!112299 (= lt!58034 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58041 () (_ BitVec 64))

(assert (=> b!112299 (= lt!58041 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58038 () Unit!3468)

(assert (=> b!112299 (= lt!58038 (addApplyDifferent!77 lt!58044 lt!58034 (ite c!20002 (ite c!19996 (minValue!2516 newMap!16) lt!57575) (minValue!2516 newMap!16)) lt!58041))))

(assert (=> b!112299 (= (apply!101 (+!140 lt!58044 (tuple2!2405 lt!58034 (ite c!20002 (ite c!19996 (minValue!2516 newMap!16) lt!57575) (minValue!2516 newMap!16)))) lt!58041) (apply!101 lt!58044 lt!58041))))

(declare-fun lt!58035 () Unit!3468)

(assert (=> b!112299 (= lt!58035 lt!58038)))

(declare-fun lt!58030 () ListLongMap!1557)

(assert (=> b!112299 (= lt!58030 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) (ite (or c!20002 c!20000) (_values!2630 newMap!16) (array!4382 (store (arr!2075 (_values!2630 newMap!16)) (index!3212 lt!57865) (ValueCellFull!1007 lt!57575)) (size!2334 (_values!2630 newMap!16)))) (mask!6824 newMap!16) (ite c!20002 (ite c!19996 (extraKeys!2440 newMap!16) lt!57863) (extraKeys!2440 newMap!16)) (zeroValue!2516 newMap!16) (ite c!20002 (ite c!19996 (minValue!2516 newMap!16) lt!57575) (minValue!2516 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58039 () (_ BitVec 64))

(assert (=> b!112299 (= lt!58039 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58040 () (_ BitVec 64))

(assert (=> b!112299 (= lt!58040 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58045 () Unit!3468)

(assert (=> b!112299 (= lt!58045 (addApplyDifferent!77 lt!58030 lt!58039 (zeroValue!2516 newMap!16) lt!58040))))

(assert (=> b!112299 (= (apply!101 (+!140 lt!58030 (tuple2!2405 lt!58039 (zeroValue!2516 newMap!16))) lt!58040) (apply!101 lt!58030 lt!58040))))

(declare-fun lt!58047 () Unit!3468)

(assert (=> b!112299 (= lt!58047 lt!58045)))

(declare-fun lt!58036 () ListLongMap!1557)

(assert (=> b!112299 (= lt!58036 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) (ite (or c!20002 c!20000) (_values!2630 newMap!16) (array!4382 (store (arr!2075 (_values!2630 newMap!16)) (index!3212 lt!57865) (ValueCellFull!1007 lt!57575)) (size!2334 (_values!2630 newMap!16)))) (mask!6824 newMap!16) (ite c!20002 (ite c!19996 (extraKeys!2440 newMap!16) lt!57863) (extraKeys!2440 newMap!16)) (zeroValue!2516 newMap!16) (ite c!20002 (ite c!19996 (minValue!2516 newMap!16) lt!57575) (minValue!2516 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58049 () (_ BitVec 64))

(assert (=> b!112299 (= lt!58049 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58033 () (_ BitVec 64))

(assert (=> b!112299 (= lt!58033 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112299 (= lt!58048 (addApplyDifferent!77 lt!58036 lt!58049 (ite c!20002 (ite c!19996 (minValue!2516 newMap!16) lt!57575) (minValue!2516 newMap!16)) lt!58033))))

(assert (=> b!112299 (= (apply!101 (+!140 lt!58036 (tuple2!2405 lt!58049 (ite c!20002 (ite c!19996 (minValue!2516 newMap!16) lt!57575) (minValue!2516 newMap!16)))) lt!58033) (apply!101 lt!58036 lt!58033))))

(declare-fun b!112300 () Bool)

(assert (=> b!112300 (= e!72988 call!12049)))

(declare-fun d!31881 () Bool)

(assert (=> d!31881 e!72994))

(declare-fun res!55388 () Bool)

(assert (=> d!31881 (=> (not res!55388) (not e!72994))))

(assert (=> d!31881 (= res!55388 (or (bvsge #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))))

(declare-fun lt!58037 () ListLongMap!1557)

(assert (=> d!31881 (= lt!58050 lt!58037)))

(declare-fun lt!58051 () Unit!3468)

(assert (=> d!31881 (= lt!58051 e!72997)))

(declare-fun c!20067 () Bool)

(assert (=> d!31881 (= c!20067 e!72989)))

(declare-fun res!55389 () Bool)

(assert (=> d!31881 (=> (not res!55389) (not e!72989))))

(assert (=> d!31881 (= res!55389 (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(assert (=> d!31881 (= lt!58037 e!72986)))

(assert (=> d!31881 (= c!20070 (and (not (= (bvand (ite c!20002 (ite c!19996 (extraKeys!2440 newMap!16) lt!57863) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!20002 (ite c!19996 (extraKeys!2440 newMap!16) lt!57863) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!31881 (validMask!0 (mask!6824 newMap!16))))

(assert (=> d!31881 (= (getCurrentListMap!470 (_keys!4364 newMap!16) (ite (or c!20002 c!20000) (_values!2630 newMap!16) (array!4382 (store (arr!2075 (_values!2630 newMap!16)) (index!3212 lt!57865) (ValueCellFull!1007 lt!57575)) (size!2334 (_values!2630 newMap!16)))) (mask!6824 newMap!16) (ite c!20002 (ite c!19996 (extraKeys!2440 newMap!16) lt!57863) (extraKeys!2440 newMap!16)) (zeroValue!2516 newMap!16) (ite c!20002 (ite c!19996 (minValue!2516 newMap!16) lt!57575) (minValue!2516 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) lt!58050)))

(declare-fun b!112301 () Bool)

(declare-fun Unit!3490 () Unit!3468)

(assert (=> b!112301 (= e!72997 Unit!3490)))

(declare-fun bm!12049 () Bool)

(assert (=> bm!12049 (= call!12053 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) (ite (or c!20002 c!20000) (_values!2630 newMap!16) (array!4382 (store (arr!2075 (_values!2630 newMap!16)) (index!3212 lt!57865) (ValueCellFull!1007 lt!57575)) (size!2334 (_values!2630 newMap!16)))) (mask!6824 newMap!16) (ite c!20002 (ite c!19996 (extraKeys!2440 newMap!16) lt!57863) (extraKeys!2440 newMap!16)) (zeroValue!2516 newMap!16) (ite c!20002 (ite c!19996 (minValue!2516 newMap!16) lt!57575) (minValue!2516 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun b!112302 () Bool)

(assert (=> b!112302 (= e!72990 call!12049)))

(declare-fun b!112303 () Bool)

(assert (=> b!112303 (= e!72993 (= (apply!101 lt!58050 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2516 newMap!16)))))

(declare-fun bm!12050 () Bool)

(assert (=> bm!12050 (= call!12050 call!12053)))

(declare-fun b!112304 () Bool)

(declare-fun res!55392 () Bool)

(assert (=> b!112304 (=> (not res!55392) (not e!72994))))

(assert (=> b!112304 (= res!55392 e!72987)))

(declare-fun res!55384 () Bool)

(assert (=> b!112304 (=> res!55384 e!72987)))

(assert (=> b!112304 (= res!55384 (not e!72985))))

(declare-fun res!55391 () Bool)

(assert (=> b!112304 (=> (not res!55391) (not e!72985))))

(assert (=> b!112304 (= res!55391 (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(declare-fun b!112305 () Bool)

(assert (=> b!112305 (= e!72986 (+!140 call!12048 (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!20002 (ite c!19996 (minValue!2516 newMap!16) lt!57575) (minValue!2516 newMap!16)))))))

(assert (= (and d!31881 c!20070) b!112305))

(assert (= (and d!31881 (not c!20070)) b!112287))

(assert (= (and b!112287 c!20065) b!112300))

(assert (= (and b!112287 (not c!20065)) b!112291))

(assert (= (and b!112291 c!20066) b!112302))

(assert (= (and b!112291 (not c!20066)) b!112294))

(assert (= (or b!112302 b!112294) bm!12045))

(assert (= (or b!112300 bm!12045) bm!12050))

(assert (= (or b!112300 b!112302) bm!12048))

(assert (= (or b!112305 bm!12050) bm!12049))

(assert (= (or b!112305 bm!12048) bm!12044))

(assert (= (and d!31881 res!55389) b!112285))

(assert (= (and d!31881 c!20067) b!112299))

(assert (= (and d!31881 (not c!20067)) b!112301))

(assert (= (and d!31881 res!55388) b!112304))

(assert (= (and b!112304 res!55391) b!112295))

(assert (= (and b!112304 (not res!55384)) b!112293))

(assert (= (and b!112293 res!55390) b!112286))

(assert (= (and b!112304 res!55392) b!112298))

(assert (= (and b!112298 c!20068) b!112288))

(assert (= (and b!112298 (not c!20068)) b!112297))

(assert (= (and b!112288 res!55385) b!112303))

(assert (= (or b!112288 b!112297) bm!12047))

(assert (= (and b!112298 res!55387) b!112292))

(assert (= (and b!112292 c!20069) b!112289))

(assert (= (and b!112292 (not c!20069)) b!112296))

(assert (= (and b!112289 res!55386) b!112290))

(assert (= (or b!112289 b!112296) bm!12046))

(declare-fun b_lambda!5019 () Bool)

(assert (=> (not b_lambda!5019) (not b!112286)))

(declare-fun t!5790 () Bool)

(declare-fun tb!2125 () Bool)

(assert (=> (and b!111620 (= (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) (defaultEntry!2647 newMap!16)) t!5790) tb!2125))

(declare-fun result!3561 () Bool)

(assert (=> tb!2125 (= result!3561 tp_is_empty!2701)))

(assert (=> b!112286 t!5790))

(declare-fun b_and!6885 () Bool)

(assert (= b_and!6881 (and (=> t!5790 result!3561) b_and!6885)))

(declare-fun t!5792 () Bool)

(declare-fun tb!2127 () Bool)

(assert (=> (and b!111616 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 newMap!16)) t!5792) tb!2127))

(declare-fun result!3563 () Bool)

(assert (= result!3563 result!3561))

(assert (=> b!112286 t!5792))

(declare-fun b_and!6887 () Bool)

(assert (= b_and!6883 (and (=> t!5792 result!3563) b_and!6887)))

(assert (=> d!31881 m!127611))

(declare-fun m!127851 () Bool)

(assert (=> b!112299 m!127851))

(declare-fun m!127853 () Bool)

(assert (=> b!112299 m!127853))

(declare-fun m!127855 () Bool)

(assert (=> b!112299 m!127855))

(declare-fun m!127857 () Bool)

(assert (=> b!112299 m!127857))

(declare-fun m!127859 () Bool)

(assert (=> b!112299 m!127859))

(declare-fun m!127861 () Bool)

(assert (=> b!112299 m!127861))

(declare-fun m!127863 () Bool)

(assert (=> b!112299 m!127863))

(assert (=> b!112299 m!127863))

(declare-fun m!127865 () Bool)

(assert (=> b!112299 m!127865))

(assert (=> b!112299 m!127851))

(declare-fun m!127867 () Bool)

(assert (=> b!112299 m!127867))

(declare-fun m!127869 () Bool)

(assert (=> b!112299 m!127869))

(declare-fun m!127871 () Bool)

(assert (=> b!112299 m!127871))

(declare-fun m!127873 () Bool)

(assert (=> b!112299 m!127873))

(declare-fun m!127875 () Bool)

(assert (=> b!112299 m!127875))

(declare-fun m!127877 () Bool)

(assert (=> b!112299 m!127877))

(declare-fun m!127879 () Bool)

(assert (=> b!112299 m!127879))

(assert (=> b!112299 m!127671))

(assert (=> b!112299 m!127873))

(assert (=> b!112299 m!127877))

(declare-fun m!127881 () Bool)

(assert (=> b!112299 m!127881))

(declare-fun m!127883 () Bool)

(assert (=> b!112290 m!127883))

(assert (=> b!112285 m!127671))

(assert (=> b!112285 m!127671))

(assert (=> b!112285 m!127673))

(declare-fun m!127885 () Bool)

(assert (=> bm!12046 m!127885))

(declare-fun m!127887 () Bool)

(assert (=> bm!12044 m!127887))

(declare-fun m!127889 () Bool)

(assert (=> b!112303 m!127889))

(assert (=> b!112293 m!127671))

(assert (=> b!112293 m!127671))

(declare-fun m!127891 () Bool)

(assert (=> b!112293 m!127891))

(declare-fun m!127893 () Bool)

(assert (=> bm!12047 m!127893))

(assert (=> bm!12049 m!127871))

(assert (=> b!112295 m!127671))

(assert (=> b!112295 m!127671))

(assert (=> b!112295 m!127673))

(declare-fun m!127895 () Bool)

(assert (=> b!112286 m!127895))

(declare-fun m!127897 () Bool)

(assert (=> b!112286 m!127897))

(assert (=> b!112286 m!127895))

(assert (=> b!112286 m!127897))

(declare-fun m!127899 () Bool)

(assert (=> b!112286 m!127899))

(assert (=> b!112286 m!127671))

(assert (=> b!112286 m!127671))

(declare-fun m!127901 () Bool)

(assert (=> b!112286 m!127901))

(declare-fun m!127903 () Bool)

(assert (=> b!112305 m!127903))

(assert (=> bm!12007 d!31881))

(declare-fun d!31883 () Bool)

(declare-fun e!73000 () Bool)

(assert (=> d!31883 e!73000))

(declare-fun res!55398 () Bool)

(assert (=> d!31883 (=> (not res!55398) (not e!73000))))

(declare-fun lt!58057 () SeekEntryResult!265)

(assert (=> d!31883 (= res!55398 ((_ is Found!265) lt!58057))))

(assert (=> d!31883 (= lt!58057 (seekEntryOrOpen!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (_keys!4364 newMap!16) (mask!6824 newMap!16)))))

(declare-fun lt!58056 () Unit!3468)

(declare-fun choose!709 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 64) Int) Unit!3468)

(assert (=> d!31883 (= lt!58056 (choose!709 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)))))

(assert (=> d!31883 (validMask!0 (mask!6824 newMap!16))))

(assert (=> d!31883 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!50 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)) lt!58056)))

(declare-fun b!112310 () Bool)

(declare-fun res!55397 () Bool)

(assert (=> b!112310 (=> (not res!55397) (not e!73000))))

(assert (=> b!112310 (= res!55397 (inRange!0 (index!3212 lt!58057) (mask!6824 newMap!16)))))

(declare-fun b!112311 () Bool)

(assert (=> b!112311 (= e!73000 (= (select (arr!2074 (_keys!4364 newMap!16)) (index!3212 lt!58057)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (=> b!112311 (and (bvsge (index!3212 lt!58057) #b00000000000000000000000000000000) (bvslt (index!3212 lt!58057) (size!2333 (_keys!4364 newMap!16))))))

(assert (= (and d!31883 res!55398) b!112310))

(assert (= (and b!112310 res!55397) b!112311))

(assert (=> d!31883 m!127199))

(assert (=> d!31883 m!127593))

(assert (=> d!31883 m!127199))

(declare-fun m!127905 () Bool)

(assert (=> d!31883 m!127905))

(assert (=> d!31883 m!127611))

(declare-fun m!127907 () Bool)

(assert (=> b!112310 m!127907))

(declare-fun m!127909 () Bool)

(assert (=> b!112311 m!127909))

(assert (=> bm!11997 d!31883))

(assert (=> b!111790 d!31869))

(declare-fun d!31885 () Bool)

(declare-fun e!73003 () Bool)

(assert (=> d!31885 e!73003))

(declare-fun c!20073 () Bool)

(assert (=> d!31885 (= c!20073 (and (not (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!31885 true))

(declare-fun _$29!150 () Unit!3468)

(assert (=> d!31885 (= (choose!704 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))) _$29!150)))

(declare-fun b!112316 () Bool)

(assert (=> b!112316 (= e!73003 (arrayContainsKey!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!112317 () Bool)

(assert (=> b!112317 (= e!73003 (ite (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!31885 c!20073) b!112316))

(assert (= (and d!31885 (not c!20073)) b!112317))

(assert (=> b!112316 m!127199))

(assert (=> b!112316 m!127241))

(assert (=> d!31773 d!31885))

(assert (=> d!31773 d!31805))

(declare-fun d!31887 () Bool)

(assert (=> d!31887 (= (apply!101 lt!57710 lt!57707) (get!1356 (getValueByKey!157 (toList!794 lt!57710) lt!57707)))))

(declare-fun bs!4611 () Bool)

(assert (= bs!4611 d!31887))

(declare-fun m!127911 () Bool)

(assert (=> bs!4611 m!127911))

(assert (=> bs!4611 m!127911))

(declare-fun m!127913 () Bool)

(assert (=> bs!4611 m!127913))

(assert (=> b!111850 d!31887))

(declare-fun d!31889 () Bool)

(assert (=> d!31889 (= (apply!101 (+!140 lt!57710 (tuple2!2405 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!57707) (get!1356 (getValueByKey!157 (toList!794 (+!140 lt!57710 (tuple2!2405 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))) lt!57707)))))

(declare-fun bs!4612 () Bool)

(assert (= bs!4612 d!31889))

(declare-fun m!127915 () Bool)

(assert (=> bs!4612 m!127915))

(assert (=> bs!4612 m!127915))

(declare-fun m!127917 () Bool)

(assert (=> bs!4612 m!127917))

(assert (=> b!111850 d!31889))

(declare-fun d!31891 () Bool)

(assert (=> d!31891 (= (apply!101 (+!140 lt!57704 (tuple2!2405 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!57714) (apply!101 lt!57704 lt!57714))))

(declare-fun lt!58060 () Unit!3468)

(declare-fun choose!710 (ListLongMap!1557 (_ BitVec 64) V!3249 (_ BitVec 64)) Unit!3468)

(assert (=> d!31891 (= lt!58060 (choose!710 lt!57704 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) lt!57714))))

(declare-fun e!73006 () Bool)

(assert (=> d!31891 e!73006))

(declare-fun res!55401 () Bool)

(assert (=> d!31891 (=> (not res!55401) (not e!73006))))

(assert (=> d!31891 (= res!55401 (contains!831 lt!57704 lt!57714))))

(assert (=> d!31891 (= (addApplyDifferent!77 lt!57704 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) lt!57714) lt!58060)))

(declare-fun b!112321 () Bool)

(assert (=> b!112321 (= e!73006 (not (= lt!57714 lt!57713)))))

(assert (= (and d!31891 res!55401) b!112321))

(assert (=> d!31891 m!127413))

(assert (=> d!31891 m!127413))

(assert (=> d!31891 m!127417))

(declare-fun m!127919 () Bool)

(assert (=> d!31891 m!127919))

(declare-fun m!127921 () Bool)

(assert (=> d!31891 m!127921))

(assert (=> d!31891 m!127405))

(assert (=> b!111850 d!31891))

(assert (=> b!111850 d!31795))

(declare-fun d!31893 () Bool)

(assert (=> d!31893 (= (apply!101 (+!140 lt!57718 (tuple2!2405 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!57715) (apply!101 lt!57718 lt!57715))))

(declare-fun lt!58061 () Unit!3468)

(assert (=> d!31893 (= lt!58061 (choose!710 lt!57718 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992))) lt!57715))))

(declare-fun e!73007 () Bool)

(assert (=> d!31893 e!73007))

(declare-fun res!55402 () Bool)

(assert (=> d!31893 (=> (not res!55402) (not e!73007))))

(assert (=> d!31893 (= res!55402 (contains!831 lt!57718 lt!57715))))

(assert (=> d!31893 (= (addApplyDifferent!77 lt!57718 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992))) lt!57715) lt!58061)))

(declare-fun b!112322 () Bool)

(assert (=> b!112322 (= e!73007 (not (= lt!57715 lt!57708)))))

(assert (= (and d!31893 res!55402) b!112322))

(assert (=> d!31893 m!127409))

(assert (=> d!31893 m!127409))

(assert (=> d!31893 m!127411))

(declare-fun m!127923 () Bool)

(assert (=> d!31893 m!127923))

(declare-fun m!127925 () Bool)

(assert (=> d!31893 m!127925))

(assert (=> d!31893 m!127397))

(assert (=> b!111850 d!31893))

(declare-fun d!31895 () Bool)

(declare-fun e!73008 () Bool)

(assert (=> d!31895 e!73008))

(declare-fun res!55403 () Bool)

(assert (=> d!31895 (=> res!55403 e!73008)))

(declare-fun lt!58062 () Bool)

(assert (=> d!31895 (= res!55403 (not lt!58062))))

(declare-fun lt!58063 () Bool)

(assert (=> d!31895 (= lt!58062 lt!58063)))

(declare-fun lt!58064 () Unit!3468)

(declare-fun e!73009 () Unit!3468)

(assert (=> d!31895 (= lt!58064 e!73009)))

(declare-fun c!20074 () Bool)

(assert (=> d!31895 (= c!20074 lt!58063)))

(assert (=> d!31895 (= lt!58063 (containsKey!161 (toList!794 (+!140 lt!57716 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))) lt!57705))))

(assert (=> d!31895 (= (contains!831 (+!140 lt!57716 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!57705) lt!58062)))

(declare-fun b!112323 () Bool)

(declare-fun lt!58065 () Unit!3468)

(assert (=> b!112323 (= e!73009 lt!58065)))

(assert (=> b!112323 (= lt!58065 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 (+!140 lt!57716 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))) lt!57705))))

(assert (=> b!112323 (isDefined!111 (getValueByKey!157 (toList!794 (+!140 lt!57716 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))) lt!57705))))

(declare-fun b!112324 () Bool)

(declare-fun Unit!3491 () Unit!3468)

(assert (=> b!112324 (= e!73009 Unit!3491)))

(declare-fun b!112325 () Bool)

(assert (=> b!112325 (= e!73008 (isDefined!111 (getValueByKey!157 (toList!794 (+!140 lt!57716 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))) lt!57705)))))

(assert (= (and d!31895 c!20074) b!112323))

(assert (= (and d!31895 (not c!20074)) b!112324))

(assert (= (and d!31895 (not res!55403)) b!112325))

(declare-fun m!127927 () Bool)

(assert (=> d!31895 m!127927))

(declare-fun m!127929 () Bool)

(assert (=> b!112323 m!127929))

(declare-fun m!127931 () Bool)

(assert (=> b!112323 m!127931))

(assert (=> b!112323 m!127931))

(declare-fun m!127933 () Bool)

(assert (=> b!112323 m!127933))

(assert (=> b!112325 m!127931))

(assert (=> b!112325 m!127931))

(assert (=> b!112325 m!127933))

(assert (=> b!111850 d!31895))

(declare-fun d!31897 () Bool)

(assert (=> d!31897 (= (apply!101 lt!57718 lt!57715) (get!1356 (getValueByKey!157 (toList!794 lt!57718) lt!57715)))))

(declare-fun bs!4613 () Bool)

(assert (= bs!4613 d!31897))

(declare-fun m!127935 () Bool)

(assert (=> bs!4613 m!127935))

(assert (=> bs!4613 m!127935))

(declare-fun m!127937 () Bool)

(assert (=> bs!4613 m!127937))

(assert (=> b!111850 d!31897))

(declare-fun d!31899 () Bool)

(declare-fun e!73010 () Bool)

(assert (=> d!31899 e!73010))

(declare-fun res!55405 () Bool)

(assert (=> d!31899 (=> (not res!55405) (not e!73010))))

(declare-fun lt!58066 () ListLongMap!1557)

(assert (=> d!31899 (= res!55405 (contains!831 lt!58066 (_1!1213 (tuple2!2405 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(declare-fun lt!58069 () List!1629)

(assert (=> d!31899 (= lt!58066 (ListLongMap!1558 lt!58069))))

(declare-fun lt!58068 () Unit!3468)

(declare-fun lt!58067 () Unit!3468)

(assert (=> d!31899 (= lt!58068 lt!58067)))

(assert (=> d!31899 (= (getValueByKey!157 lt!58069 (_1!1213 (tuple2!2405 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))) (Some!162 (_2!1213 (tuple2!2405 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31899 (= lt!58067 (lemmaContainsTupThenGetReturnValue!76 lt!58069 (_1!1213 (tuple2!2405 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992))))) (_2!1213 (tuple2!2405 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31899 (= lt!58069 (insertStrictlySorted!79 (toList!794 lt!57718) (_1!1213 (tuple2!2405 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992))))) (_2!1213 (tuple2!2405 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31899 (= (+!140 lt!57718 (tuple2!2405 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!58066)))

(declare-fun b!112326 () Bool)

(declare-fun res!55404 () Bool)

(assert (=> b!112326 (=> (not res!55404) (not e!73010))))

(assert (=> b!112326 (= res!55404 (= (getValueByKey!157 (toList!794 lt!58066) (_1!1213 (tuple2!2405 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))) (Some!162 (_2!1213 (tuple2!2405 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992))))))))))

(declare-fun b!112327 () Bool)

(assert (=> b!112327 (= e!73010 (contains!833 (toList!794 lt!58066) (tuple2!2405 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992))))))))

(assert (= (and d!31899 res!55405) b!112326))

(assert (= (and b!112326 res!55404) b!112327))

(declare-fun m!127939 () Bool)

(assert (=> d!31899 m!127939))

(declare-fun m!127941 () Bool)

(assert (=> d!31899 m!127941))

(declare-fun m!127943 () Bool)

(assert (=> d!31899 m!127943))

(declare-fun m!127945 () Bool)

(assert (=> d!31899 m!127945))

(declare-fun m!127947 () Bool)

(assert (=> b!112326 m!127947))

(declare-fun m!127949 () Bool)

(assert (=> b!112327 m!127949))

(assert (=> b!111850 d!31899))

(declare-fun d!31901 () Bool)

(assert (=> d!31901 (= (apply!101 lt!57704 lt!57714) (get!1356 (getValueByKey!157 (toList!794 lt!57704) lt!57714)))))

(declare-fun bs!4614 () Bool)

(assert (= bs!4614 d!31901))

(declare-fun m!127951 () Bool)

(assert (=> bs!4614 m!127951))

(assert (=> bs!4614 m!127951))

(declare-fun m!127953 () Bool)

(assert (=> bs!4614 m!127953))

(assert (=> b!111850 d!31901))

(declare-fun d!31903 () Bool)

(assert (=> d!31903 (= (apply!101 (+!140 lt!57710 (tuple2!2405 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!57707) (apply!101 lt!57710 lt!57707))))

(declare-fun lt!58070 () Unit!3468)

(assert (=> d!31903 (= lt!58070 (choose!710 lt!57710 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992))) lt!57707))))

(declare-fun e!73011 () Bool)

(assert (=> d!31903 e!73011))

(declare-fun res!55406 () Bool)

(assert (=> d!31903 (=> (not res!55406) (not e!73011))))

(assert (=> d!31903 (= res!55406 (contains!831 lt!57710 lt!57707))))

(assert (=> d!31903 (= (addApplyDifferent!77 lt!57710 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992))) lt!57707) lt!58070)))

(declare-fun b!112328 () Bool)

(assert (=> b!112328 (= e!73011 (not (= lt!57707 lt!57723)))))

(assert (= (and d!31903 res!55406) b!112328))

(assert (=> d!31903 m!127389))

(assert (=> d!31903 m!127389))

(assert (=> d!31903 m!127391))

(declare-fun m!127955 () Bool)

(assert (=> d!31903 m!127955))

(declare-fun m!127957 () Bool)

(assert (=> d!31903 m!127957))

(assert (=> d!31903 m!127393))

(assert (=> b!111850 d!31903))

(declare-fun d!31905 () Bool)

(assert (=> d!31905 (= (apply!101 (+!140 lt!57718 (tuple2!2405 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!57715) (get!1356 (getValueByKey!157 (toList!794 (+!140 lt!57718 (tuple2!2405 lt!57708 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))) lt!57715)))))

(declare-fun bs!4615 () Bool)

(assert (= bs!4615 d!31905))

(declare-fun m!127959 () Bool)

(assert (=> bs!4615 m!127959))

(assert (=> bs!4615 m!127959))

(declare-fun m!127961 () Bool)

(assert (=> bs!4615 m!127961))

(assert (=> b!111850 d!31905))

(declare-fun d!31907 () Bool)

(declare-fun e!73012 () Bool)

(assert (=> d!31907 e!73012))

(declare-fun res!55408 () Bool)

(assert (=> d!31907 (=> (not res!55408) (not e!73012))))

(declare-fun lt!58071 () ListLongMap!1557)

(assert (=> d!31907 (= res!55408 (contains!831 lt!58071 (_1!1213 (tuple2!2405 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(declare-fun lt!58074 () List!1629)

(assert (=> d!31907 (= lt!58071 (ListLongMap!1558 lt!58074))))

(declare-fun lt!58073 () Unit!3468)

(declare-fun lt!58072 () Unit!3468)

(assert (=> d!31907 (= lt!58073 lt!58072)))

(assert (=> d!31907 (= (getValueByKey!157 lt!58074 (_1!1213 (tuple2!2405 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))) (Some!162 (_2!1213 (tuple2!2405 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31907 (= lt!58072 (lemmaContainsTupThenGetReturnValue!76 lt!58074 (_1!1213 (tuple2!2405 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992))))) (_2!1213 (tuple2!2405 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31907 (= lt!58074 (insertStrictlySorted!79 (toList!794 lt!57710) (_1!1213 (tuple2!2405 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992))))) (_2!1213 (tuple2!2405 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31907 (= (+!140 lt!57710 (tuple2!2405 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!58071)))

(declare-fun b!112329 () Bool)

(declare-fun res!55407 () Bool)

(assert (=> b!112329 (=> (not res!55407) (not e!73012))))

(assert (=> b!112329 (= res!55407 (= (getValueByKey!157 (toList!794 lt!58071) (_1!1213 (tuple2!2405 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))) (Some!162 (_2!1213 (tuple2!2405 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992))))))))))

(declare-fun b!112330 () Bool)

(assert (=> b!112330 (= e!73012 (contains!833 (toList!794 lt!58071) (tuple2!2405 lt!57723 (minValue!2516 (v!2936 (underlying!366 thiss!992))))))))

(assert (= (and d!31907 res!55408) b!112329))

(assert (= (and b!112329 res!55407) b!112330))

(declare-fun m!127963 () Bool)

(assert (=> d!31907 m!127963))

(declare-fun m!127965 () Bool)

(assert (=> d!31907 m!127965))

(declare-fun m!127967 () Bool)

(assert (=> d!31907 m!127967))

(declare-fun m!127969 () Bool)

(assert (=> d!31907 m!127969))

(declare-fun m!127971 () Bool)

(assert (=> b!112329 m!127971))

(declare-fun m!127973 () Bool)

(assert (=> b!112330 m!127973))

(assert (=> b!111850 d!31907))

(declare-fun d!31909 () Bool)

(declare-fun e!73013 () Bool)

(assert (=> d!31909 e!73013))

(declare-fun res!55410 () Bool)

(assert (=> d!31909 (=> (not res!55410) (not e!73013))))

(declare-fun lt!58075 () ListLongMap!1557)

(assert (=> d!31909 (= res!55410 (contains!831 lt!58075 (_1!1213 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(declare-fun lt!58078 () List!1629)

(assert (=> d!31909 (= lt!58075 (ListLongMap!1558 lt!58078))))

(declare-fun lt!58077 () Unit!3468)

(declare-fun lt!58076 () Unit!3468)

(assert (=> d!31909 (= lt!58077 lt!58076)))

(assert (=> d!31909 (= (getValueByKey!157 lt!58078 (_1!1213 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))) (Some!162 (_2!1213 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31909 (= lt!58076 (lemmaContainsTupThenGetReturnValue!76 lt!58078 (_1!1213 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) (_2!1213 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31909 (= lt!58078 (insertStrictlySorted!79 (toList!794 lt!57716) (_1!1213 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) (_2!1213 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31909 (= (+!140 lt!57716 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!58075)))

(declare-fun b!112331 () Bool)

(declare-fun res!55409 () Bool)

(assert (=> b!112331 (=> (not res!55409) (not e!73013))))

(assert (=> b!112331 (= res!55409 (= (getValueByKey!157 (toList!794 lt!58075) (_1!1213 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))) (Some!162 (_2!1213 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))))))))

(declare-fun b!112332 () Bool)

(assert (=> b!112332 (= e!73013 (contains!833 (toList!794 lt!58075) (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))))))

(assert (= (and d!31909 res!55410) b!112331))

(assert (= (and b!112331 res!55409) b!112332))

(declare-fun m!127975 () Bool)

(assert (=> d!31909 m!127975))

(declare-fun m!127977 () Bool)

(assert (=> d!31909 m!127977))

(declare-fun m!127979 () Bool)

(assert (=> d!31909 m!127979))

(declare-fun m!127981 () Bool)

(assert (=> d!31909 m!127981))

(declare-fun m!127983 () Bool)

(assert (=> b!112331 m!127983))

(declare-fun m!127985 () Bool)

(assert (=> b!112332 m!127985))

(assert (=> b!111850 d!31909))

(declare-fun d!31911 () Bool)

(assert (=> d!31911 (contains!831 (+!140 lt!57716 (tuple2!2405 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!57705)))

(declare-fun lt!58081 () Unit!3468)

(declare-fun choose!711 (ListLongMap!1557 (_ BitVec 64) V!3249 (_ BitVec 64)) Unit!3468)

(assert (=> d!31911 (= lt!58081 (choose!711 lt!57716 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) lt!57705))))

(assert (=> d!31911 (contains!831 lt!57716 lt!57705)))

(assert (=> d!31911 (= (addStillContains!77 lt!57716 lt!57717 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) lt!57705) lt!58081)))

(declare-fun bs!4616 () Bool)

(assert (= bs!4616 d!31911))

(assert (=> bs!4616 m!127401))

(assert (=> bs!4616 m!127401))

(assert (=> bs!4616 m!127403))

(declare-fun m!127987 () Bool)

(assert (=> bs!4616 m!127987))

(declare-fun m!127989 () Bool)

(assert (=> bs!4616 m!127989))

(assert (=> b!111850 d!31911))

(declare-fun d!31913 () Bool)

(assert (=> d!31913 (= (apply!101 (+!140 lt!57704 (tuple2!2405 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!57714) (get!1356 (getValueByKey!157 (toList!794 (+!140 lt!57704 (tuple2!2405 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))) lt!57714)))))

(declare-fun bs!4617 () Bool)

(assert (= bs!4617 d!31913))

(declare-fun m!127991 () Bool)

(assert (=> bs!4617 m!127991))

(assert (=> bs!4617 m!127991))

(declare-fun m!127993 () Bool)

(assert (=> bs!4617 m!127993))

(assert (=> b!111850 d!31913))

(declare-fun d!31915 () Bool)

(declare-fun e!73014 () Bool)

(assert (=> d!31915 e!73014))

(declare-fun res!55412 () Bool)

(assert (=> d!31915 (=> (not res!55412) (not e!73014))))

(declare-fun lt!58082 () ListLongMap!1557)

(assert (=> d!31915 (= res!55412 (contains!831 lt!58082 (_1!1213 (tuple2!2405 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(declare-fun lt!58085 () List!1629)

(assert (=> d!31915 (= lt!58082 (ListLongMap!1558 lt!58085))))

(declare-fun lt!58084 () Unit!3468)

(declare-fun lt!58083 () Unit!3468)

(assert (=> d!31915 (= lt!58084 lt!58083)))

(assert (=> d!31915 (= (getValueByKey!157 lt!58085 (_1!1213 (tuple2!2405 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))) (Some!162 (_2!1213 (tuple2!2405 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31915 (= lt!58083 (lemmaContainsTupThenGetReturnValue!76 lt!58085 (_1!1213 (tuple2!2405 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) (_2!1213 (tuple2!2405 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31915 (= lt!58085 (insertStrictlySorted!79 (toList!794 lt!57704) (_1!1213 (tuple2!2405 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) (_2!1213 (tuple2!2405 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31915 (= (+!140 lt!57704 (tuple2!2405 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!58082)))

(declare-fun b!112334 () Bool)

(declare-fun res!55411 () Bool)

(assert (=> b!112334 (=> (not res!55411) (not e!73014))))

(assert (=> b!112334 (= res!55411 (= (getValueByKey!157 (toList!794 lt!58082) (_1!1213 (tuple2!2405 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))) (Some!162 (_2!1213 (tuple2!2405 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))))))))

(declare-fun b!112335 () Bool)

(assert (=> b!112335 (= e!73014 (contains!833 (toList!794 lt!58082) (tuple2!2405 lt!57713 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))))))

(assert (= (and d!31915 res!55412) b!112334))

(assert (= (and b!112334 res!55411) b!112335))

(declare-fun m!127995 () Bool)

(assert (=> d!31915 m!127995))

(declare-fun m!127997 () Bool)

(assert (=> d!31915 m!127997))

(declare-fun m!127999 () Bool)

(assert (=> d!31915 m!127999))

(declare-fun m!128001 () Bool)

(assert (=> d!31915 m!128001))

(declare-fun m!128003 () Bool)

(assert (=> b!112334 m!128003))

(declare-fun m!128005 () Bool)

(assert (=> b!112335 m!128005))

(assert (=> b!111850 d!31915))

(declare-fun d!31917 () Bool)

(declare-fun e!73015 () Bool)

(assert (=> d!31917 e!73015))

(declare-fun res!55414 () Bool)

(assert (=> d!31917 (=> (not res!55414) (not e!73015))))

(declare-fun lt!58086 () ListLongMap!1557)

(assert (=> d!31917 (= res!55414 (contains!831 lt!58086 (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(declare-fun lt!58089 () List!1629)

(assert (=> d!31917 (= lt!58086 (ListLongMap!1558 lt!58089))))

(declare-fun lt!58088 () Unit!3468)

(declare-fun lt!58087 () Unit!3468)

(assert (=> d!31917 (= lt!58088 lt!58087)))

(assert (=> d!31917 (= (getValueByKey!157 lt!58089 (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))) (Some!162 (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(assert (=> d!31917 (= lt!58087 (lemmaContainsTupThenGetReturnValue!76 lt!58089 (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)) (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(assert (=> d!31917 (= lt!58089 (insertStrictlySorted!79 (toList!794 call!11995) (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)) (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(assert (=> d!31917 (= (+!140 call!11995 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)) lt!58086)))

(declare-fun b!112336 () Bool)

(declare-fun res!55413 () Bool)

(assert (=> b!112336 (=> (not res!55413) (not e!73015))))

(assert (=> b!112336 (= res!55413 (= (getValueByKey!157 (toList!794 lt!58086) (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))) (Some!162 (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)))))))

(declare-fun b!112337 () Bool)

(assert (=> b!112337 (= e!73015 (contains!833 (toList!794 lt!58086) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)))))

(assert (= (and d!31917 res!55414) b!112336))

(assert (= (and b!112336 res!55413) b!112337))

(declare-fun m!128007 () Bool)

(assert (=> d!31917 m!128007))

(declare-fun m!128009 () Bool)

(assert (=> d!31917 m!128009))

(declare-fun m!128011 () Bool)

(assert (=> d!31917 m!128011))

(declare-fun m!128013 () Bool)

(assert (=> d!31917 m!128013))

(declare-fun m!128015 () Bool)

(assert (=> b!112336 m!128015))

(declare-fun m!128017 () Bool)

(assert (=> b!112337 m!128017))

(assert (=> b!112046 d!31917))

(declare-fun d!31919 () Bool)

(assert (=> d!31919 (= (get!1355 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) from!355) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!111862 d!31919))

(declare-fun d!31921 () Bool)

(assert (=> d!31921 (= (+!140 (getCurrentListMap!470 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57575)) (getCurrentListMap!470 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) lt!57863 (zeroValue!2516 newMap!16) lt!57575 #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58092 () Unit!3468)

(declare-fun choose!712 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 V!3249 Int) Unit!3468)

(assert (=> d!31921 (= lt!58092 (choose!712 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) lt!57863 (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) lt!57575 (defaultEntry!2647 newMap!16)))))

(assert (=> d!31921 (validMask!0 (mask!6824 newMap!16))))

(assert (=> d!31921 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!50 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) lt!57863 (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) lt!57575 (defaultEntry!2647 newMap!16)) lt!58092)))

(declare-fun bs!4618 () Bool)

(assert (= bs!4618 d!31921))

(assert (=> bs!4618 m!127387))

(declare-fun m!128019 () Bool)

(assert (=> bs!4618 m!128019))

(assert (=> bs!4618 m!127611))

(declare-fun m!128021 () Bool)

(assert (=> bs!4618 m!128021))

(declare-fun m!128023 () Bool)

(assert (=> bs!4618 m!128023))

(assert (=> bs!4618 m!127387))

(assert (=> b!112044 d!31921))

(declare-fun d!31923 () Bool)

(declare-fun lt!58093 () Bool)

(assert (=> d!31923 (= lt!58093 (select (content!115 (toList!794 lt!57776)) lt!57571))))

(declare-fun e!73016 () Bool)

(assert (=> d!31923 (= lt!58093 e!73016)))

(declare-fun res!55415 () Bool)

(assert (=> d!31923 (=> (not res!55415) (not e!73016))))

(assert (=> d!31923 (= res!55415 ((_ is Cons!1625) (toList!794 lt!57776)))))

(assert (=> d!31923 (= (contains!833 (toList!794 lt!57776) lt!57571) lt!58093)))

(declare-fun b!112338 () Bool)

(declare-fun e!73017 () Bool)

(assert (=> b!112338 (= e!73016 e!73017)))

(declare-fun res!55416 () Bool)

(assert (=> b!112338 (=> res!55416 e!73017)))

(assert (=> b!112338 (= res!55416 (= (h!2225 (toList!794 lt!57776)) lt!57571))))

(declare-fun b!112339 () Bool)

(assert (=> b!112339 (= e!73017 (contains!833 (t!5778 (toList!794 lt!57776)) lt!57571))))

(assert (= (and d!31923 res!55415) b!112338))

(assert (= (and b!112338 (not res!55416)) b!112339))

(declare-fun m!128025 () Bool)

(assert (=> d!31923 m!128025))

(declare-fun m!128027 () Bool)

(assert (=> d!31923 m!128027))

(declare-fun m!128029 () Bool)

(assert (=> b!112339 m!128029))

(assert (=> b!111931 d!31923))

(declare-fun call!12058 () ListLongMap!1557)

(declare-fun c!20075 () Bool)

(declare-fun call!12057 () ListLongMap!1557)

(declare-fun call!12055 () ListLongMap!1557)

(declare-fun bm!12051 () Bool)

(declare-fun c!20080 () Bool)

(declare-fun call!12060 () ListLongMap!1557)

(assert (=> bm!12051 (= call!12055 (+!140 (ite c!20080 call!12060 (ite c!20075 call!12057 call!12058)) (ite (or c!20080 c!20075) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 newMap!16)) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 newMap!16)))))))

(declare-fun b!112340 () Bool)

(declare-fun e!73022 () Bool)

(assert (=> b!112340 (= e!73022 (validKeyInArray!0 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!73025 () Bool)

(declare-fun lt!58114 () ListLongMap!1557)

(declare-fun b!112341 () Bool)

(assert (=> b!112341 (= e!73025 (= (apply!101 lt!58114 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)) (get!1353 (select (arr!2075 lt!57868) #b00000000000000000000000000000000) (dynLambda!388 (defaultEntry!2647 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112341 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2334 lt!57868)))))

(assert (=> b!112341 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(declare-fun bm!12052 () Bool)

(assert (=> bm!12052 (= call!12058 call!12057)))

(declare-fun b!112342 () Bool)

(declare-fun e!73019 () ListLongMap!1557)

(declare-fun e!73021 () ListLongMap!1557)

(assert (=> b!112342 (= e!73019 e!73021)))

(assert (=> b!112342 (= c!20075 (and (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12053 () Bool)

(declare-fun call!12054 () Bool)

(assert (=> bm!12053 (= call!12054 (contains!831 lt!58114 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112343 () Bool)

(declare-fun e!73028 () Bool)

(declare-fun e!73026 () Bool)

(assert (=> b!112343 (= e!73028 e!73026)))

(declare-fun res!55418 () Bool)

(declare-fun call!12059 () Bool)

(assert (=> b!112343 (= res!55418 call!12059)))

(assert (=> b!112343 (=> (not res!55418) (not e!73026))))

(declare-fun b!112344 () Bool)

(declare-fun e!73024 () Bool)

(declare-fun e!73029 () Bool)

(assert (=> b!112344 (= e!73024 e!73029)))

(declare-fun res!55419 () Bool)

(assert (=> b!112344 (= res!55419 call!12054)))

(assert (=> b!112344 (=> (not res!55419) (not e!73029))))

(declare-fun b!112345 () Bool)

(assert (=> b!112345 (= e!73029 (= (apply!101 lt!58114 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2516 newMap!16)))))

(declare-fun b!112346 () Bool)

(declare-fun c!20076 () Bool)

(assert (=> b!112346 (= c!20076 (and (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!73023 () ListLongMap!1557)

(assert (=> b!112346 (= e!73021 e!73023)))

(declare-fun b!112347 () Bool)

(declare-fun e!73027 () Bool)

(assert (=> b!112347 (= e!73027 e!73024)))

(declare-fun c!20079 () Bool)

(assert (=> b!112347 (= c!20079 (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12054 () Bool)

(assert (=> bm!12054 (= call!12059 (contains!831 lt!58114 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12055 () Bool)

(declare-fun call!12056 () ListLongMap!1557)

(assert (=> bm!12055 (= call!12056 call!12055)))

(declare-fun b!112348 () Bool)

(declare-fun e!73020 () Bool)

(assert (=> b!112348 (= e!73020 e!73025)))

(declare-fun res!55423 () Bool)

(assert (=> b!112348 (=> (not res!55423) (not e!73025))))

(assert (=> b!112348 (= res!55423 (contains!831 lt!58114 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!112348 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(declare-fun b!112349 () Bool)

(assert (=> b!112349 (= e!73023 call!12058)))

(declare-fun b!112350 () Bool)

(declare-fun e!73018 () Bool)

(assert (=> b!112350 (= e!73018 (validKeyInArray!0 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112351 () Bool)

(assert (=> b!112351 (= e!73024 (not call!12054))))

(declare-fun b!112352 () Bool)

(assert (=> b!112352 (= e!73028 (not call!12059))))

(declare-fun b!112353 () Bool)

(declare-fun res!55420 () Bool)

(assert (=> b!112353 (=> (not res!55420) (not e!73027))))

(assert (=> b!112353 (= res!55420 e!73028)))

(declare-fun c!20078 () Bool)

(assert (=> b!112353 (= c!20078 (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!112354 () Bool)

(declare-fun e!73030 () Unit!3468)

(declare-fun lt!58112 () Unit!3468)

(assert (=> b!112354 (= e!73030 lt!58112)))

(declare-fun lt!58106 () ListLongMap!1557)

(assert (=> b!112354 (= lt!58106 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) lt!57868 (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58107 () (_ BitVec 64))

(assert (=> b!112354 (= lt!58107 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58095 () (_ BitVec 64))

(assert (=> b!112354 (= lt!58095 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58110 () Unit!3468)

(assert (=> b!112354 (= lt!58110 (addStillContains!77 lt!58106 lt!58107 (zeroValue!2516 newMap!16) lt!58095))))

(assert (=> b!112354 (contains!831 (+!140 lt!58106 (tuple2!2405 lt!58107 (zeroValue!2516 newMap!16))) lt!58095)))

(declare-fun lt!58096 () Unit!3468)

(assert (=> b!112354 (= lt!58096 lt!58110)))

(declare-fun lt!58108 () ListLongMap!1557)

(assert (=> b!112354 (= lt!58108 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) lt!57868 (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58098 () (_ BitVec 64))

(assert (=> b!112354 (= lt!58098 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58105 () (_ BitVec 64))

(assert (=> b!112354 (= lt!58105 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58102 () Unit!3468)

(assert (=> b!112354 (= lt!58102 (addApplyDifferent!77 lt!58108 lt!58098 (minValue!2516 newMap!16) lt!58105))))

(assert (=> b!112354 (= (apply!101 (+!140 lt!58108 (tuple2!2405 lt!58098 (minValue!2516 newMap!16))) lt!58105) (apply!101 lt!58108 lt!58105))))

(declare-fun lt!58099 () Unit!3468)

(assert (=> b!112354 (= lt!58099 lt!58102)))

(declare-fun lt!58094 () ListLongMap!1557)

(assert (=> b!112354 (= lt!58094 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) lt!57868 (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58103 () (_ BitVec 64))

(assert (=> b!112354 (= lt!58103 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58104 () (_ BitVec 64))

(assert (=> b!112354 (= lt!58104 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58109 () Unit!3468)

(assert (=> b!112354 (= lt!58109 (addApplyDifferent!77 lt!58094 lt!58103 (zeroValue!2516 newMap!16) lt!58104))))

(assert (=> b!112354 (= (apply!101 (+!140 lt!58094 (tuple2!2405 lt!58103 (zeroValue!2516 newMap!16))) lt!58104) (apply!101 lt!58094 lt!58104))))

(declare-fun lt!58111 () Unit!3468)

(assert (=> b!112354 (= lt!58111 lt!58109)))

(declare-fun lt!58100 () ListLongMap!1557)

(assert (=> b!112354 (= lt!58100 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) lt!57868 (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58113 () (_ BitVec 64))

(assert (=> b!112354 (= lt!58113 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58097 () (_ BitVec 64))

(assert (=> b!112354 (= lt!58097 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112354 (= lt!58112 (addApplyDifferent!77 lt!58100 lt!58113 (minValue!2516 newMap!16) lt!58097))))

(assert (=> b!112354 (= (apply!101 (+!140 lt!58100 (tuple2!2405 lt!58113 (minValue!2516 newMap!16))) lt!58097) (apply!101 lt!58100 lt!58097))))

(declare-fun b!112355 () Bool)

(assert (=> b!112355 (= e!73021 call!12056)))

(declare-fun d!31925 () Bool)

(assert (=> d!31925 e!73027))

(declare-fun res!55421 () Bool)

(assert (=> d!31925 (=> (not res!55421) (not e!73027))))

(assert (=> d!31925 (= res!55421 (or (bvsge #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))))

(declare-fun lt!58101 () ListLongMap!1557)

(assert (=> d!31925 (= lt!58114 lt!58101)))

(declare-fun lt!58115 () Unit!3468)

(assert (=> d!31925 (= lt!58115 e!73030)))

(declare-fun c!20077 () Bool)

(assert (=> d!31925 (= c!20077 e!73022)))

(declare-fun res!55422 () Bool)

(assert (=> d!31925 (=> (not res!55422) (not e!73022))))

(assert (=> d!31925 (= res!55422 (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(assert (=> d!31925 (= lt!58101 e!73019)))

(assert (=> d!31925 (= c!20080 (and (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!31925 (validMask!0 (mask!6824 newMap!16))))

(assert (=> d!31925 (= (getCurrentListMap!470 (_keys!4364 newMap!16) lt!57868 (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) lt!58114)))

(declare-fun b!112356 () Bool)

(declare-fun Unit!3492 () Unit!3468)

(assert (=> b!112356 (= e!73030 Unit!3492)))

(declare-fun bm!12056 () Bool)

(assert (=> bm!12056 (= call!12060 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) lt!57868 (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun b!112357 () Bool)

(assert (=> b!112357 (= e!73023 call!12056)))

(declare-fun b!112358 () Bool)

(assert (=> b!112358 (= e!73026 (= (apply!101 lt!58114 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2516 newMap!16)))))

(declare-fun bm!12057 () Bool)

(assert (=> bm!12057 (= call!12057 call!12060)))

(declare-fun b!112359 () Bool)

(declare-fun res!55425 () Bool)

(assert (=> b!112359 (=> (not res!55425) (not e!73027))))

(assert (=> b!112359 (= res!55425 e!73020)))

(declare-fun res!55417 () Bool)

(assert (=> b!112359 (=> res!55417 e!73020)))

(assert (=> b!112359 (= res!55417 (not e!73018))))

(declare-fun res!55424 () Bool)

(assert (=> b!112359 (=> (not res!55424) (not e!73018))))

(assert (=> b!112359 (= res!55424 (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(declare-fun b!112360 () Bool)

(assert (=> b!112360 (= e!73019 (+!140 call!12055 (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 newMap!16))))))

(assert (= (and d!31925 c!20080) b!112360))

(assert (= (and d!31925 (not c!20080)) b!112342))

(assert (= (and b!112342 c!20075) b!112355))

(assert (= (and b!112342 (not c!20075)) b!112346))

(assert (= (and b!112346 c!20076) b!112357))

(assert (= (and b!112346 (not c!20076)) b!112349))

(assert (= (or b!112357 b!112349) bm!12052))

(assert (= (or b!112355 bm!12052) bm!12057))

(assert (= (or b!112355 b!112357) bm!12055))

(assert (= (or b!112360 bm!12057) bm!12056))

(assert (= (or b!112360 bm!12055) bm!12051))

(assert (= (and d!31925 res!55422) b!112340))

(assert (= (and d!31925 c!20077) b!112354))

(assert (= (and d!31925 (not c!20077)) b!112356))

(assert (= (and d!31925 res!55421) b!112359))

(assert (= (and b!112359 res!55424) b!112350))

(assert (= (and b!112359 (not res!55417)) b!112348))

(assert (= (and b!112348 res!55423) b!112341))

(assert (= (and b!112359 res!55425) b!112353))

(assert (= (and b!112353 c!20078) b!112343))

(assert (= (and b!112353 (not c!20078)) b!112352))

(assert (= (and b!112343 res!55418) b!112358))

(assert (= (or b!112343 b!112352) bm!12054))

(assert (= (and b!112353 res!55420) b!112347))

(assert (= (and b!112347 c!20079) b!112344))

(assert (= (and b!112347 (not c!20079)) b!112351))

(assert (= (and b!112344 res!55419) b!112345))

(assert (= (or b!112344 b!112351) bm!12053))

(declare-fun b_lambda!5021 () Bool)

(assert (=> (not b_lambda!5021) (not b!112341)))

(assert (=> b!112341 t!5790))

(declare-fun b_and!6889 () Bool)

(assert (= b_and!6885 (and (=> t!5790 result!3561) b_and!6889)))

(assert (=> b!112341 t!5792))

(declare-fun b_and!6891 () Bool)

(assert (= b_and!6887 (and (=> t!5792 result!3563) b_and!6891)))

(assert (=> d!31925 m!127611))

(declare-fun m!128031 () Bool)

(assert (=> b!112354 m!128031))

(declare-fun m!128033 () Bool)

(assert (=> b!112354 m!128033))

(declare-fun m!128035 () Bool)

(assert (=> b!112354 m!128035))

(declare-fun m!128037 () Bool)

(assert (=> b!112354 m!128037))

(declare-fun m!128039 () Bool)

(assert (=> b!112354 m!128039))

(declare-fun m!128041 () Bool)

(assert (=> b!112354 m!128041))

(declare-fun m!128043 () Bool)

(assert (=> b!112354 m!128043))

(assert (=> b!112354 m!128043))

(declare-fun m!128045 () Bool)

(assert (=> b!112354 m!128045))

(assert (=> b!112354 m!128031))

(declare-fun m!128047 () Bool)

(assert (=> b!112354 m!128047))

(declare-fun m!128049 () Bool)

(assert (=> b!112354 m!128049))

(declare-fun m!128051 () Bool)

(assert (=> b!112354 m!128051))

(declare-fun m!128053 () Bool)

(assert (=> b!112354 m!128053))

(declare-fun m!128055 () Bool)

(assert (=> b!112354 m!128055))

(declare-fun m!128057 () Bool)

(assert (=> b!112354 m!128057))

(declare-fun m!128059 () Bool)

(assert (=> b!112354 m!128059))

(assert (=> b!112354 m!127671))

(assert (=> b!112354 m!128053))

(assert (=> b!112354 m!128057))

(declare-fun m!128061 () Bool)

(assert (=> b!112354 m!128061))

(declare-fun m!128063 () Bool)

(assert (=> b!112345 m!128063))

(assert (=> b!112340 m!127671))

(assert (=> b!112340 m!127671))

(assert (=> b!112340 m!127673))

(declare-fun m!128065 () Bool)

(assert (=> bm!12053 m!128065))

(declare-fun m!128067 () Bool)

(assert (=> bm!12051 m!128067))

(declare-fun m!128069 () Bool)

(assert (=> b!112358 m!128069))

(assert (=> b!112348 m!127671))

(assert (=> b!112348 m!127671))

(declare-fun m!128071 () Bool)

(assert (=> b!112348 m!128071))

(declare-fun m!128073 () Bool)

(assert (=> bm!12054 m!128073))

(assert (=> bm!12056 m!128051))

(assert (=> b!112350 m!127671))

(assert (=> b!112350 m!127671))

(assert (=> b!112350 m!127673))

(declare-fun m!128075 () Bool)

(assert (=> b!112341 m!128075))

(assert (=> b!112341 m!127897))

(assert (=> b!112341 m!128075))

(assert (=> b!112341 m!127897))

(declare-fun m!128077 () Bool)

(assert (=> b!112341 m!128077))

(assert (=> b!112341 m!127671))

(assert (=> b!112341 m!127671))

(declare-fun m!128079 () Bool)

(assert (=> b!112341 m!128079))

(declare-fun m!128081 () Bool)

(assert (=> b!112360 m!128081))

(assert (=> b!112056 d!31925))

(declare-fun d!31927 () Bool)

(declare-fun e!73031 () Bool)

(assert (=> d!31927 e!73031))

(declare-fun res!55427 () Bool)

(assert (=> d!31927 (=> (not res!55427) (not e!73031))))

(declare-fun lt!58116 () ListLongMap!1557)

(assert (=> d!31927 (= res!55427 (contains!831 lt!58116 (_1!1213 (ite c!20002 (ite c!19996 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57575) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57575)) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)))))))

(declare-fun lt!58119 () List!1629)

(assert (=> d!31927 (= lt!58116 (ListLongMap!1558 lt!58119))))

(declare-fun lt!58118 () Unit!3468)

(declare-fun lt!58117 () Unit!3468)

(assert (=> d!31927 (= lt!58118 lt!58117)))

(assert (=> d!31927 (= (getValueByKey!157 lt!58119 (_1!1213 (ite c!20002 (ite c!19996 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57575) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57575)) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)))) (Some!162 (_2!1213 (ite c!20002 (ite c!19996 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57575) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57575)) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)))))))

(assert (=> d!31927 (= lt!58117 (lemmaContainsTupThenGetReturnValue!76 lt!58119 (_1!1213 (ite c!20002 (ite c!19996 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57575) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57575)) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))) (_2!1213 (ite c!20002 (ite c!19996 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57575) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57575)) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)))))))

(assert (=> d!31927 (= lt!58119 (insertStrictlySorted!79 (toList!794 (ite c!20002 (ite c!19996 call!12006 call!11997) call!12009)) (_1!1213 (ite c!20002 (ite c!19996 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57575) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57575)) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))) (_2!1213 (ite c!20002 (ite c!19996 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57575) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57575)) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)))))))

(assert (=> d!31927 (= (+!140 (ite c!20002 (ite c!19996 call!12006 call!11997) call!12009) (ite c!20002 (ite c!19996 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57575) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57575)) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))) lt!58116)))

(declare-fun b!112361 () Bool)

(declare-fun res!55426 () Bool)

(assert (=> b!112361 (=> (not res!55426) (not e!73031))))

(assert (=> b!112361 (= res!55426 (= (getValueByKey!157 (toList!794 lt!58116) (_1!1213 (ite c!20002 (ite c!19996 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57575) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57575)) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)))) (Some!162 (_2!1213 (ite c!20002 (ite c!19996 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57575) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57575)) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))))

(declare-fun b!112362 () Bool)

(assert (=> b!112362 (= e!73031 (contains!833 (toList!794 lt!58116) (ite c!20002 (ite c!19996 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57575) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57575)) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(assert (= (and d!31927 res!55427) b!112361))

(assert (= (and b!112361 res!55426) b!112362))

(declare-fun m!128083 () Bool)

(assert (=> d!31927 m!128083))

(declare-fun m!128085 () Bool)

(assert (=> d!31927 m!128085))

(declare-fun m!128087 () Bool)

(assert (=> d!31927 m!128087))

(declare-fun m!128089 () Bool)

(assert (=> d!31927 m!128089))

(declare-fun m!128091 () Bool)

(assert (=> b!112361 m!128091))

(declare-fun m!128093 () Bool)

(assert (=> b!112362 m!128093))

(assert (=> bm!12004 d!31927))

(declare-fun bm!12058 () Bool)

(declare-fun call!12061 () Bool)

(assert (=> bm!12058 (= call!12061 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4364 newMap!16) (mask!6824 newMap!16)))))

(declare-fun d!31929 () Bool)

(declare-fun res!55429 () Bool)

(declare-fun e!73032 () Bool)

(assert (=> d!31929 (=> res!55429 e!73032)))

(assert (=> d!31929 (= res!55429 (bvsge #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(assert (=> d!31929 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4364 newMap!16) (mask!6824 newMap!16)) e!73032)))

(declare-fun b!112363 () Bool)

(declare-fun e!73033 () Bool)

(assert (=> b!112363 (= e!73033 call!12061)))

(declare-fun b!112364 () Bool)

(declare-fun e!73034 () Bool)

(assert (=> b!112364 (= e!73034 call!12061)))

(declare-fun b!112365 () Bool)

(assert (=> b!112365 (= e!73032 e!73034)))

(declare-fun c!20081 () Bool)

(assert (=> b!112365 (= c!20081 (validKeyInArray!0 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112366 () Bool)

(assert (=> b!112366 (= e!73034 e!73033)))

(declare-fun lt!58120 () (_ BitVec 64))

(assert (=> b!112366 (= lt!58120 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58122 () Unit!3468)

(assert (=> b!112366 (= lt!58122 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4364 newMap!16) lt!58120 #b00000000000000000000000000000000))))

(assert (=> b!112366 (arrayContainsKey!0 (_keys!4364 newMap!16) lt!58120 #b00000000000000000000000000000000)))

(declare-fun lt!58121 () Unit!3468)

(assert (=> b!112366 (= lt!58121 lt!58122)))

(declare-fun res!55428 () Bool)

(assert (=> b!112366 (= res!55428 (= (seekEntryOrOpen!0 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000) (_keys!4364 newMap!16) (mask!6824 newMap!16)) (Found!265 #b00000000000000000000000000000000)))))

(assert (=> b!112366 (=> (not res!55428) (not e!73033))))

(assert (= (and d!31929 (not res!55429)) b!112365))

(assert (= (and b!112365 c!20081) b!112366))

(assert (= (and b!112365 (not c!20081)) b!112364))

(assert (= (and b!112366 res!55428) b!112363))

(assert (= (or b!112363 b!112364) bm!12058))

(declare-fun m!128095 () Bool)

(assert (=> bm!12058 m!128095))

(assert (=> b!112365 m!127671))

(assert (=> b!112365 m!127671))

(assert (=> b!112365 m!127673))

(assert (=> b!112366 m!127671))

(declare-fun m!128097 () Bool)

(assert (=> b!112366 m!128097))

(declare-fun m!128099 () Bool)

(assert (=> b!112366 m!128099))

(assert (=> b!112366 m!127671))

(declare-fun m!128101 () Bool)

(assert (=> b!112366 m!128101))

(assert (=> b!111870 d!31929))

(declare-fun d!31931 () Bool)

(assert (=> d!31931 (= (+!140 (getCurrentListMap!470 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57575)) (getCurrentListMap!470 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) lt!57860 lt!57575 (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58125 () Unit!3468)

(declare-fun choose!713 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 V!3249 Int) Unit!3468)

(assert (=> d!31931 (= lt!58125 (choose!713 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) lt!57860 (zeroValue!2516 newMap!16) lt!57575 (minValue!2516 newMap!16) (defaultEntry!2647 newMap!16)))))

(assert (=> d!31931 (validMask!0 (mask!6824 newMap!16))))

(assert (=> d!31931 (= (lemmaChangeZeroKeyThenAddPairToListMap!50 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) lt!57860 (zeroValue!2516 newMap!16) lt!57575 (minValue!2516 newMap!16) (defaultEntry!2647 newMap!16)) lt!58125)))

(declare-fun bs!4619 () Bool)

(assert (= bs!4619 d!31931))

(declare-fun m!128103 () Bool)

(assert (=> bs!4619 m!128103))

(assert (=> bs!4619 m!127387))

(declare-fun m!128105 () Bool)

(assert (=> bs!4619 m!128105))

(assert (=> bs!4619 m!127611))

(declare-fun m!128107 () Bool)

(assert (=> bs!4619 m!128107))

(assert (=> bs!4619 m!127387))

(assert (=> b!112036 d!31931))

(declare-fun d!31933 () Bool)

(assert (=> d!31933 (= (apply!101 lt!57766 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1356 (getValueByKey!157 (toList!794 lt!57766) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4620 () Bool)

(assert (= bs!4620 d!31933))

(assert (=> bs!4620 m!127373))

(declare-fun m!128109 () Bool)

(assert (=> bs!4620 m!128109))

(assert (=> bs!4620 m!128109))

(declare-fun m!128111 () Bool)

(assert (=> bs!4620 m!128111))

(assert (=> b!111918 d!31933))

(assert (=> b!111918 d!31843))

(declare-fun d!31935 () Bool)

(assert (=> d!31935 (arrayContainsKey!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) lt!57732 #b00000000000000000000000000000000)))

(declare-fun lt!58128 () Unit!3468)

(declare-fun choose!13 (array!4379 (_ BitVec 64) (_ BitVec 32)) Unit!3468)

(assert (=> d!31935 (= lt!58128 (choose!13 (_keys!4364 (v!2936 (underlying!366 thiss!992))) lt!57732 #b00000000000000000000000000000000))))

(assert (=> d!31935 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!31935 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) lt!57732 #b00000000000000000000000000000000) lt!58128)))

(declare-fun bs!4621 () Bool)

(assert (= bs!4621 d!31935))

(assert (=> bs!4621 m!127461))

(declare-fun m!128113 () Bool)

(assert (=> bs!4621 m!128113))

(assert (=> b!111883 d!31935))

(declare-fun d!31937 () Bool)

(declare-fun res!55430 () Bool)

(declare-fun e!73035 () Bool)

(assert (=> d!31937 (=> res!55430 e!73035)))

(assert (=> d!31937 (= res!55430 (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b00000000000000000000000000000000) lt!57732))))

(assert (=> d!31937 (= (arrayContainsKey!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) lt!57732 #b00000000000000000000000000000000) e!73035)))

(declare-fun b!112367 () Bool)

(declare-fun e!73036 () Bool)

(assert (=> b!112367 (= e!73035 e!73036)))

(declare-fun res!55431 () Bool)

(assert (=> b!112367 (=> (not res!55431) (not e!73036))))

(assert (=> b!112367 (= res!55431 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(declare-fun b!112368 () Bool)

(assert (=> b!112368 (= e!73036 (arrayContainsKey!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) lt!57732 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!31937 (not res!55430)) b!112367))

(assert (= (and b!112367 res!55431) b!112368))

(assert (=> d!31937 m!127455))

(declare-fun m!128115 () Bool)

(assert (=> b!112368 m!128115))

(assert (=> b!111883 d!31937))

(declare-fun b!112369 () Bool)

(declare-fun e!73037 () SeekEntryResult!265)

(assert (=> b!112369 (= e!73037 Undefined!265)))

(declare-fun b!112370 () Bool)

(declare-fun c!20083 () Bool)

(declare-fun lt!58130 () (_ BitVec 64))

(assert (=> b!112370 (= c!20083 (= lt!58130 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!73038 () SeekEntryResult!265)

(declare-fun e!73039 () SeekEntryResult!265)

(assert (=> b!112370 (= e!73038 e!73039)))

(declare-fun d!31939 () Bool)

(declare-fun lt!58131 () SeekEntryResult!265)

(assert (=> d!31939 (and (or ((_ is Undefined!265) lt!58131) (not ((_ is Found!265) lt!58131)) (and (bvsge (index!3212 lt!58131) #b00000000000000000000000000000000) (bvslt (index!3212 lt!58131) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))) (or ((_ is Undefined!265) lt!58131) ((_ is Found!265) lt!58131) (not ((_ is MissingZero!265) lt!58131)) (and (bvsge (index!3211 lt!58131) #b00000000000000000000000000000000) (bvslt (index!3211 lt!58131) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))) (or ((_ is Undefined!265) lt!58131) ((_ is Found!265) lt!58131) ((_ is MissingZero!265) lt!58131) (not ((_ is MissingVacant!265) lt!58131)) (and (bvsge (index!3214 lt!58131) #b00000000000000000000000000000000) (bvslt (index!3214 lt!58131) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))) (or ((_ is Undefined!265) lt!58131) (ite ((_ is Found!265) lt!58131) (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (index!3212 lt!58131)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!265) lt!58131) (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (index!3211 lt!58131)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!265) lt!58131) (= (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (index!3214 lt!58131)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!31939 (= lt!58131 e!73037)))

(declare-fun c!20084 () Bool)

(declare-fun lt!58129 () SeekEntryResult!265)

(assert (=> d!31939 (= c!20084 (and ((_ is Intermediate!265) lt!58129) (undefined!1077 lt!58129)))))

(assert (=> d!31939 (= lt!58129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b00000000000000000000000000000000) (mask!6824 (v!2936 (underlying!366 thiss!992)))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b00000000000000000000000000000000) (_keys!4364 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992)))))))

(assert (=> d!31939 (validMask!0 (mask!6824 (v!2936 (underlying!366 thiss!992))))))

(assert (=> d!31939 (= (seekEntryOrOpen!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b00000000000000000000000000000000) (_keys!4364 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992)))) lt!58131)))

(declare-fun b!112371 () Bool)

(assert (=> b!112371 (= e!73038 (Found!265 (index!3213 lt!58129)))))

(declare-fun b!112372 () Bool)

(assert (=> b!112372 (= e!73039 (seekKeyOrZeroReturnVacant!0 (x!14096 lt!58129) (index!3213 lt!58129) (index!3213 lt!58129) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b00000000000000000000000000000000) (_keys!4364 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun b!112373 () Bool)

(assert (=> b!112373 (= e!73037 e!73038)))

(assert (=> b!112373 (= lt!58130 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (index!3213 lt!58129)))))

(declare-fun c!20082 () Bool)

(assert (=> b!112373 (= c!20082 (= lt!58130 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!112374 () Bool)

(assert (=> b!112374 (= e!73039 (MissingZero!265 (index!3213 lt!58129)))))

(assert (= (and d!31939 c!20084) b!112369))

(assert (= (and d!31939 (not c!20084)) b!112373))

(assert (= (and b!112373 c!20082) b!112371))

(assert (= (and b!112373 (not c!20082)) b!112370))

(assert (= (and b!112370 c!20083) b!112374))

(assert (= (and b!112370 (not c!20083)) b!112372))

(assert (=> d!31939 m!127211))

(assert (=> d!31939 m!127455))

(declare-fun m!128117 () Bool)

(assert (=> d!31939 m!128117))

(declare-fun m!128119 () Bool)

(assert (=> d!31939 m!128119))

(declare-fun m!128121 () Bool)

(assert (=> d!31939 m!128121))

(declare-fun m!128123 () Bool)

(assert (=> d!31939 m!128123))

(assert (=> d!31939 m!128117))

(assert (=> d!31939 m!127455))

(declare-fun m!128125 () Bool)

(assert (=> d!31939 m!128125))

(assert (=> b!112372 m!127455))

(declare-fun m!128127 () Bool)

(assert (=> b!112372 m!128127))

(declare-fun m!128129 () Bool)

(assert (=> b!112373 m!128129))

(assert (=> b!111883 d!31939))

(assert (=> b!111777 d!31771))

(declare-fun d!31941 () Bool)

(declare-fun e!73040 () Bool)

(assert (=> d!31941 e!73040))

(declare-fun res!55432 () Bool)

(assert (=> d!31941 (=> res!55432 e!73040)))

(declare-fun lt!58132 () Bool)

(assert (=> d!31941 (= res!55432 (not lt!58132))))

(declare-fun lt!58133 () Bool)

(assert (=> d!31941 (= lt!58132 lt!58133)))

(declare-fun lt!58134 () Unit!3468)

(declare-fun e!73041 () Unit!3468)

(assert (=> d!31941 (= lt!58134 e!73041)))

(declare-fun c!20085 () Bool)

(assert (=> d!31941 (= c!20085 lt!58133)))

(assert (=> d!31941 (= lt!58133 (containsKey!161 (toList!794 lt!57768) (_1!1213 lt!57571)))))

(assert (=> d!31941 (= (contains!831 lt!57768 (_1!1213 lt!57571)) lt!58132)))

(declare-fun b!112375 () Bool)

(declare-fun lt!58135 () Unit!3468)

(assert (=> b!112375 (= e!73041 lt!58135)))

(assert (=> b!112375 (= lt!58135 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 lt!57768) (_1!1213 lt!57571)))))

(assert (=> b!112375 (isDefined!111 (getValueByKey!157 (toList!794 lt!57768) (_1!1213 lt!57571)))))

(declare-fun b!112376 () Bool)

(declare-fun Unit!3493 () Unit!3468)

(assert (=> b!112376 (= e!73041 Unit!3493)))

(declare-fun b!112377 () Bool)

(assert (=> b!112377 (= e!73040 (isDefined!111 (getValueByKey!157 (toList!794 lt!57768) (_1!1213 lt!57571))))))

(assert (= (and d!31941 c!20085) b!112375))

(assert (= (and d!31941 (not c!20085)) b!112376))

(assert (= (and d!31941 (not res!55432)) b!112377))

(declare-fun m!128131 () Bool)

(assert (=> d!31941 m!128131))

(declare-fun m!128133 () Bool)

(assert (=> b!112375 m!128133))

(assert (=> b!112375 m!127505))

(assert (=> b!112375 m!127505))

(declare-fun m!128135 () Bool)

(assert (=> b!112375 m!128135))

(assert (=> b!112377 m!127505))

(assert (=> b!112377 m!127505))

(assert (=> b!112377 m!128135))

(assert (=> d!31797 d!31941))

(declare-fun d!31943 () Bool)

(declare-fun c!20086 () Bool)

(assert (=> d!31943 (= c!20086 (and ((_ is Cons!1625) lt!57771) (= (_1!1213 (h!2225 lt!57771)) (_1!1213 lt!57571))))))

(declare-fun e!73042 () Option!163)

(assert (=> d!31943 (= (getValueByKey!157 lt!57771 (_1!1213 lt!57571)) e!73042)))

(declare-fun b!112380 () Bool)

(declare-fun e!73043 () Option!163)

(assert (=> b!112380 (= e!73043 (getValueByKey!157 (t!5778 lt!57771) (_1!1213 lt!57571)))))

(declare-fun b!112378 () Bool)

(assert (=> b!112378 (= e!73042 (Some!162 (_2!1213 (h!2225 lt!57771))))))

(declare-fun b!112379 () Bool)

(assert (=> b!112379 (= e!73042 e!73043)))

(declare-fun c!20087 () Bool)

(assert (=> b!112379 (= c!20087 (and ((_ is Cons!1625) lt!57771) (not (= (_1!1213 (h!2225 lt!57771)) (_1!1213 lt!57571)))))))

(declare-fun b!112381 () Bool)

(assert (=> b!112381 (= e!73043 None!161)))

(assert (= (and d!31943 c!20086) b!112378))

(assert (= (and d!31943 (not c!20086)) b!112379))

(assert (= (and b!112379 c!20087) b!112380))

(assert (= (and b!112379 (not c!20087)) b!112381))

(declare-fun m!128137 () Bool)

(assert (=> b!112380 m!128137))

(assert (=> d!31797 d!31943))

(declare-fun d!31945 () Bool)

(assert (=> d!31945 (= (getValueByKey!157 lt!57771 (_1!1213 lt!57571)) (Some!162 (_2!1213 lt!57571)))))

(declare-fun lt!58136 () Unit!3468)

(assert (=> d!31945 (= lt!58136 (choose!706 lt!57771 (_1!1213 lt!57571) (_2!1213 lt!57571)))))

(declare-fun e!73044 () Bool)

(assert (=> d!31945 e!73044))

(declare-fun res!55433 () Bool)

(assert (=> d!31945 (=> (not res!55433) (not e!73044))))

(assert (=> d!31945 (= res!55433 (isStrictlySorted!307 lt!57771))))

(assert (=> d!31945 (= (lemmaContainsTupThenGetReturnValue!76 lt!57771 (_1!1213 lt!57571) (_2!1213 lt!57571)) lt!58136)))

(declare-fun b!112382 () Bool)

(declare-fun res!55434 () Bool)

(assert (=> b!112382 (=> (not res!55434) (not e!73044))))

(assert (=> b!112382 (= res!55434 (containsKey!161 lt!57771 (_1!1213 lt!57571)))))

(declare-fun b!112383 () Bool)

(assert (=> b!112383 (= e!73044 (contains!833 lt!57771 (tuple2!2405 (_1!1213 lt!57571) (_2!1213 lt!57571))))))

(assert (= (and d!31945 res!55433) b!112382))

(assert (= (and b!112382 res!55434) b!112383))

(assert (=> d!31945 m!127499))

(declare-fun m!128139 () Bool)

(assert (=> d!31945 m!128139))

(declare-fun m!128141 () Bool)

(assert (=> d!31945 m!128141))

(declare-fun m!128143 () Bool)

(assert (=> b!112382 m!128143))

(declare-fun m!128145 () Bool)

(assert (=> b!112383 m!128145))

(assert (=> d!31797 d!31945))

(declare-fun b!112384 () Bool)

(declare-fun e!73047 () List!1629)

(declare-fun call!12062 () List!1629)

(assert (=> b!112384 (= e!73047 call!12062)))

(declare-fun bm!12059 () Bool)

(declare-fun call!12063 () List!1629)

(declare-fun call!12064 () List!1629)

(assert (=> bm!12059 (= call!12063 call!12064)))

(declare-fun b!112385 () Bool)

(declare-fun e!73049 () List!1629)

(assert (=> b!112385 (= e!73049 (insertStrictlySorted!79 (t!5778 (toList!794 (+!140 lt!57569 lt!57568))) (_1!1213 lt!57571) (_2!1213 lt!57571)))))

(declare-fun b!112386 () Bool)

(declare-fun res!55435 () Bool)

(declare-fun e!73045 () Bool)

(assert (=> b!112386 (=> (not res!55435) (not e!73045))))

(declare-fun lt!58137 () List!1629)

(assert (=> b!112386 (= res!55435 (containsKey!161 lt!58137 (_1!1213 lt!57571)))))

(declare-fun b!112387 () Bool)

(assert (=> b!112387 (= e!73045 (contains!833 lt!58137 (tuple2!2405 (_1!1213 lt!57571) (_2!1213 lt!57571))))))

(declare-fun b!112388 () Bool)

(assert (=> b!112388 (= e!73047 call!12062)))

(declare-fun b!112389 () Bool)

(declare-fun e!73046 () List!1629)

(assert (=> b!112389 (= e!73046 call!12064)))

(declare-fun d!31947 () Bool)

(assert (=> d!31947 e!73045))

(declare-fun res!55436 () Bool)

(assert (=> d!31947 (=> (not res!55436) (not e!73045))))

(assert (=> d!31947 (= res!55436 (isStrictlySorted!307 lt!58137))))

(assert (=> d!31947 (= lt!58137 e!73046)))

(declare-fun c!20091 () Bool)

(assert (=> d!31947 (= c!20091 (and ((_ is Cons!1625) (toList!794 (+!140 lt!57569 lt!57568))) (bvslt (_1!1213 (h!2225 (toList!794 (+!140 lt!57569 lt!57568)))) (_1!1213 lt!57571))))))

(assert (=> d!31947 (isStrictlySorted!307 (toList!794 (+!140 lt!57569 lt!57568)))))

(assert (=> d!31947 (= (insertStrictlySorted!79 (toList!794 (+!140 lt!57569 lt!57568)) (_1!1213 lt!57571) (_2!1213 lt!57571)) lt!58137)))

(declare-fun bm!12060 () Bool)

(assert (=> bm!12060 (= call!12064 ($colon$colon!83 e!73049 (ite c!20091 (h!2225 (toList!794 (+!140 lt!57569 lt!57568))) (tuple2!2405 (_1!1213 lt!57571) (_2!1213 lt!57571)))))))

(declare-fun c!20089 () Bool)

(assert (=> bm!12060 (= c!20089 c!20091)))

(declare-fun b!112390 () Bool)

(declare-fun e!73048 () List!1629)

(assert (=> b!112390 (= e!73046 e!73048)))

(declare-fun c!20088 () Bool)

(assert (=> b!112390 (= c!20088 (and ((_ is Cons!1625) (toList!794 (+!140 lt!57569 lt!57568))) (= (_1!1213 (h!2225 (toList!794 (+!140 lt!57569 lt!57568)))) (_1!1213 lt!57571))))))

(declare-fun bm!12061 () Bool)

(assert (=> bm!12061 (= call!12062 call!12063)))

(declare-fun b!112391 () Bool)

(assert (=> b!112391 (= e!73048 call!12063)))

(declare-fun b!112392 () Bool)

(declare-fun c!20090 () Bool)

(assert (=> b!112392 (= c!20090 (and ((_ is Cons!1625) (toList!794 (+!140 lt!57569 lt!57568))) (bvsgt (_1!1213 (h!2225 (toList!794 (+!140 lt!57569 lt!57568)))) (_1!1213 lt!57571))))))

(assert (=> b!112392 (= e!73048 e!73047)))

(declare-fun b!112393 () Bool)

(assert (=> b!112393 (= e!73049 (ite c!20088 (t!5778 (toList!794 (+!140 lt!57569 lt!57568))) (ite c!20090 (Cons!1625 (h!2225 (toList!794 (+!140 lt!57569 lt!57568))) (t!5778 (toList!794 (+!140 lt!57569 lt!57568)))) Nil!1626)))))

(assert (= (and d!31947 c!20091) b!112389))

(assert (= (and d!31947 (not c!20091)) b!112390))

(assert (= (and b!112390 c!20088) b!112391))

(assert (= (and b!112390 (not c!20088)) b!112392))

(assert (= (and b!112392 c!20090) b!112388))

(assert (= (and b!112392 (not c!20090)) b!112384))

(assert (= (or b!112388 b!112384) bm!12061))

(assert (= (or b!112391 bm!12061) bm!12059))

(assert (= (or b!112389 bm!12059) bm!12060))

(assert (= (and bm!12060 c!20089) b!112385))

(assert (= (and bm!12060 (not c!20089)) b!112393))

(assert (= (and d!31947 res!55436) b!112386))

(assert (= (and b!112386 res!55435) b!112387))

(declare-fun m!128147 () Bool)

(assert (=> b!112386 m!128147))

(declare-fun m!128149 () Bool)

(assert (=> bm!12060 m!128149))

(declare-fun m!128151 () Bool)

(assert (=> b!112385 m!128151))

(declare-fun m!128153 () Bool)

(assert (=> b!112387 m!128153))

(declare-fun m!128155 () Bool)

(assert (=> d!31947 m!128155))

(declare-fun m!128157 () Bool)

(assert (=> d!31947 m!128157))

(assert (=> d!31797 d!31947))

(declare-fun b!112403 () Bool)

(declare-fun res!55447 () Bool)

(declare-fun e!73052 () Bool)

(assert (=> b!112403 (=> (not res!55447) (not e!73052))))

(declare-fun size!2339 (LongMapFixedSize!922) (_ BitVec 32))

(assert (=> b!112403 (= res!55447 (bvsge (size!2339 newMap!16) (_size!510 newMap!16)))))

(declare-fun b!112404 () Bool)

(declare-fun res!55445 () Bool)

(assert (=> b!112404 (=> (not res!55445) (not e!73052))))

(assert (=> b!112404 (= res!55445 (= (size!2339 newMap!16) (bvadd (_size!510 newMap!16) (bvsdiv (bvadd (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!31949 () Bool)

(declare-fun res!55448 () Bool)

(assert (=> d!31949 (=> (not res!55448) (not e!73052))))

(assert (=> d!31949 (= res!55448 (validMask!0 (mask!6824 newMap!16)))))

(assert (=> d!31949 (= (simpleValid!77 newMap!16) e!73052)))

(declare-fun b!112402 () Bool)

(declare-fun res!55446 () Bool)

(assert (=> b!112402 (=> (not res!55446) (not e!73052))))

(assert (=> b!112402 (= res!55446 (and (= (size!2334 (_values!2630 newMap!16)) (bvadd (mask!6824 newMap!16) #b00000000000000000000000000000001)) (= (size!2333 (_keys!4364 newMap!16)) (size!2334 (_values!2630 newMap!16))) (bvsge (_size!510 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!510 newMap!16) (bvadd (mask!6824 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!112405 () Bool)

(assert (=> b!112405 (= e!73052 (and (bvsge (extraKeys!2440 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2440 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!510 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!31949 res!55448) b!112402))

(assert (= (and b!112402 res!55446) b!112403))

(assert (= (and b!112403 res!55447) b!112404))

(assert (= (and b!112404 res!55445) b!112405))

(declare-fun m!128159 () Bool)

(assert (=> b!112403 m!128159))

(assert (=> b!112404 m!128159))

(assert (=> d!31949 m!127611))

(assert (=> d!31785 d!31949))

(declare-fun d!31951 () Bool)

(assert (=> d!31951 (= (apply!101 lt!57724 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1356 (getValueByKey!157 (toList!794 lt!57724) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4622 () Bool)

(assert (= bs!4622 d!31951))

(assert (=> bs!4622 m!127373))

(assert (=> bs!4622 m!127835))

(assert (=> bs!4622 m!127835))

(declare-fun m!128161 () Bool)

(assert (=> bs!4622 m!128161))

(assert (=> b!111837 d!31951))

(assert (=> b!111837 d!31843))

(declare-fun d!31953 () Bool)

(declare-fun res!55449 () Bool)

(declare-fun e!73053 () Bool)

(assert (=> d!31953 (=> (not res!55449) (not e!73053))))

(assert (=> d!31953 (= res!55449 (simpleValid!77 (v!2936 (underlying!366 thiss!992))))))

(assert (=> d!31953 (= (valid!433 (v!2936 (underlying!366 thiss!992))) e!73053)))

(declare-fun b!112406 () Bool)

(declare-fun res!55450 () Bool)

(assert (=> b!112406 (=> (not res!55450) (not e!73053))))

(assert (=> b!112406 (= res!55450 (= (arrayCountValidKeys!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000000 (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))) (_size!510 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun b!112407 () Bool)

(declare-fun res!55451 () Bool)

(assert (=> b!112407 (=> (not res!55451) (not e!73053))))

(assert (=> b!112407 (= res!55451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun b!112408 () Bool)

(assert (=> b!112408 (= e!73053 (arrayNoDuplicates!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000000 Nil!1627))))

(assert (= (and d!31953 res!55449) b!112406))

(assert (= (and b!112406 res!55450) b!112407))

(assert (= (and b!112407 res!55451) b!112408))

(declare-fun m!128163 () Bool)

(assert (=> d!31953 m!128163))

(declare-fun m!128165 () Bool)

(assert (=> b!112406 m!128165))

(assert (=> b!112407 m!127221))

(declare-fun m!128167 () Bool)

(assert (=> b!112408 m!128167))

(assert (=> d!31777 d!31953))

(assert (=> b!111916 d!31841))

(declare-fun d!31955 () Bool)

(declare-fun e!73054 () Bool)

(assert (=> d!31955 e!73054))

(declare-fun res!55452 () Bool)

(assert (=> d!31955 (=> res!55452 e!73054)))

(declare-fun lt!58138 () Bool)

(assert (=> d!31955 (= res!55452 (not lt!58138))))

(declare-fun lt!58139 () Bool)

(assert (=> d!31955 (= lt!58138 lt!58139)))

(declare-fun lt!58140 () Unit!3468)

(declare-fun e!73055 () Unit!3468)

(assert (=> d!31955 (= lt!58140 e!73055)))

(declare-fun c!20092 () Bool)

(assert (=> d!31955 (= c!20092 lt!58139)))

(assert (=> d!31955 (= lt!58139 (containsKey!161 (toList!794 lt!57766) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!31955 (= (contains!831 lt!57766 #b0000000000000000000000000000000000000000000000000000000000000000) lt!58138)))

(declare-fun b!112409 () Bool)

(declare-fun lt!58141 () Unit!3468)

(assert (=> b!112409 (= e!73055 lt!58141)))

(assert (=> b!112409 (= lt!58141 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 lt!57766) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112409 (isDefined!111 (getValueByKey!157 (toList!794 lt!57766) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112410 () Bool)

(declare-fun Unit!3494 () Unit!3468)

(assert (=> b!112410 (= e!73055 Unit!3494)))

(declare-fun b!112411 () Bool)

(assert (=> b!112411 (= e!73054 (isDefined!111 (getValueByKey!157 (toList!794 lt!57766) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!31955 c!20092) b!112409))

(assert (= (and d!31955 (not c!20092)) b!112410))

(assert (= (and d!31955 (not res!55452)) b!112411))

(declare-fun m!128169 () Bool)

(assert (=> d!31955 m!128169))

(declare-fun m!128171 () Bool)

(assert (=> b!112409 m!128171))

(declare-fun m!128173 () Bool)

(assert (=> b!112409 m!128173))

(assert (=> b!112409 m!128173))

(declare-fun m!128175 () Bool)

(assert (=> b!112409 m!128175))

(assert (=> b!112411 m!128173))

(assert (=> b!112411 m!128173))

(assert (=> b!112411 m!128175))

(assert (=> d!31795 d!31955))

(assert (=> d!31795 d!31805))

(declare-fun d!31957 () Bool)

(declare-fun e!73056 () Bool)

(assert (=> d!31957 e!73056))

(declare-fun res!55454 () Bool)

(assert (=> d!31957 (=> (not res!55454) (not e!73056))))

(declare-fun lt!58142 () ListLongMap!1557)

(assert (=> d!31957 (= res!55454 (contains!831 lt!58142 (_1!1213 (ite (or c!19944 c!19939) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992))))))))))

(declare-fun lt!58145 () List!1629)

(assert (=> d!31957 (= lt!58142 (ListLongMap!1558 lt!58145))))

(declare-fun lt!58144 () Unit!3468)

(declare-fun lt!58143 () Unit!3468)

(assert (=> d!31957 (= lt!58144 lt!58143)))

(assert (=> d!31957 (= (getValueByKey!157 lt!58145 (_1!1213 (ite (or c!19944 c!19939) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992))))))) (Some!162 (_2!1213 (ite (or c!19944 c!19939) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992))))))))))

(assert (=> d!31957 (= lt!58143 (lemmaContainsTupThenGetReturnValue!76 lt!58145 (_1!1213 (ite (or c!19944 c!19939) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))) (_2!1213 (ite (or c!19944 c!19939) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992))))))))))

(assert (=> d!31957 (= lt!58145 (insertStrictlySorted!79 (toList!794 (ite c!19944 call!11936 (ite c!19939 call!11933 call!11934))) (_1!1213 (ite (or c!19944 c!19939) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))) (_2!1213 (ite (or c!19944 c!19939) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992))))))))))

(assert (=> d!31957 (= (+!140 (ite c!19944 call!11936 (ite c!19939 call!11933 call!11934)) (ite (or c!19944 c!19939) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))) lt!58142)))

(declare-fun b!112412 () Bool)

(declare-fun res!55453 () Bool)

(assert (=> b!112412 (=> (not res!55453) (not e!73056))))

(assert (=> b!112412 (= res!55453 (= (getValueByKey!157 (toList!794 lt!58142) (_1!1213 (ite (or c!19944 c!19939) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992))))))) (Some!162 (_2!1213 (ite (or c!19944 c!19939) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))))))

(declare-fun b!112413 () Bool)

(assert (=> b!112413 (= e!73056 (contains!833 (toList!794 lt!58142) (ite (or c!19944 c!19939) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (= (and d!31957 res!55454) b!112412))

(assert (= (and b!112412 res!55453) b!112413))

(declare-fun m!128177 () Bool)

(assert (=> d!31957 m!128177))

(declare-fun m!128179 () Bool)

(assert (=> d!31957 m!128179))

(declare-fun m!128181 () Bool)

(assert (=> d!31957 m!128181))

(declare-fun m!128183 () Bool)

(assert (=> d!31957 m!128183))

(declare-fun m!128185 () Bool)

(assert (=> b!112412 m!128185))

(declare-fun m!128187 () Bool)

(assert (=> b!112413 m!128187))

(assert (=> bm!11927 d!31957))

(assert (=> d!31769 d!31775))

(declare-fun d!31959 () Bool)

(assert (=> d!31959 (arrayNoDuplicates!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) from!355 Nil!1627)))

(assert (=> d!31959 true))

(declare-fun _$71!156 () Unit!3468)

(assert (=> d!31959 (= (choose!39 (_keys!4364 (v!2936 (underlying!366 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!156)))

(declare-fun bs!4623 () Bool)

(assert (= bs!4623 d!31959))

(assert (=> bs!4623 m!127237))

(assert (=> d!31769 d!31959))

(declare-fun d!31961 () Bool)

(declare-fun e!73057 () Bool)

(assert (=> d!31961 e!73057))

(declare-fun res!55455 () Bool)

(assert (=> d!31961 (=> res!55455 e!73057)))

(declare-fun lt!58146 () Bool)

(assert (=> d!31961 (= res!55455 (not lt!58146))))

(declare-fun lt!58147 () Bool)

(assert (=> d!31961 (= lt!58146 lt!58147)))

(declare-fun lt!58148 () Unit!3468)

(declare-fun e!73058 () Unit!3468)

(assert (=> d!31961 (= lt!58148 e!73058)))

(declare-fun c!20093 () Bool)

(assert (=> d!31961 (= c!20093 lt!58147)))

(assert (=> d!31961 (= lt!58147 (containsKey!161 (toList!794 lt!57766) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!31961 (= (contains!831 lt!57766 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!58146)))

(declare-fun b!112414 () Bool)

(declare-fun lt!58149 () Unit!3468)

(assert (=> b!112414 (= e!73058 lt!58149)))

(assert (=> b!112414 (= lt!58149 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 lt!57766) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!112414 (isDefined!111 (getValueByKey!157 (toList!794 lt!57766) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!112415 () Bool)

(declare-fun Unit!3495 () Unit!3468)

(assert (=> b!112415 (= e!73058 Unit!3495)))

(declare-fun b!112416 () Bool)

(assert (=> b!112416 (= e!73057 (isDefined!111 (getValueByKey!157 (toList!794 lt!57766) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!31961 c!20093) b!112414))

(assert (= (and d!31961 (not c!20093)) b!112415))

(assert (= (and d!31961 (not res!55455)) b!112416))

(assert (=> d!31961 m!127373))

(declare-fun m!128189 () Bool)

(assert (=> d!31961 m!128189))

(assert (=> b!112414 m!127373))

(declare-fun m!128191 () Bool)

(assert (=> b!112414 m!128191))

(assert (=> b!112414 m!127373))

(assert (=> b!112414 m!128109))

(assert (=> b!112414 m!128109))

(declare-fun m!128193 () Bool)

(assert (=> b!112414 m!128193))

(assert (=> b!112416 m!127373))

(assert (=> b!112416 m!128109))

(assert (=> b!112416 m!128109))

(assert (=> b!112416 m!128193))

(assert (=> b!111914 d!31961))

(declare-fun bm!12062 () Bool)

(declare-fun call!12065 () Bool)

(assert (=> bm!12062 (= call!12065 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4364 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992)))))))

(declare-fun d!31963 () Bool)

(declare-fun res!55457 () Bool)

(declare-fun e!73059 () Bool)

(assert (=> d!31963 (=> res!55457 e!73059)))

(assert (=> d!31963 (= res!55457 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(assert (=> d!31963 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4364 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992)))) e!73059)))

(declare-fun b!112417 () Bool)

(declare-fun e!73060 () Bool)

(assert (=> b!112417 (= e!73060 call!12065)))

(declare-fun b!112418 () Bool)

(declare-fun e!73061 () Bool)

(assert (=> b!112418 (= e!73061 call!12065)))

(declare-fun b!112419 () Bool)

(assert (=> b!112419 (= e!73059 e!73061)))

(declare-fun c!20094 () Bool)

(assert (=> b!112419 (= c!20094 (validKeyInArray!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!112420 () Bool)

(assert (=> b!112420 (= e!73061 e!73060)))

(declare-fun lt!58150 () (_ BitVec 64))

(assert (=> b!112420 (= lt!58150 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!58152 () Unit!3468)

(assert (=> b!112420 (= lt!58152 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) lt!58150 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!112420 (arrayContainsKey!0 (_keys!4364 (v!2936 (underlying!366 thiss!992))) lt!58150 #b00000000000000000000000000000000)))

(declare-fun lt!58151 () Unit!3468)

(assert (=> b!112420 (= lt!58151 lt!58152)))

(declare-fun res!55456 () Bool)

(assert (=> b!112420 (= res!55456 (= (seekEntryOrOpen!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4364 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992)))) (Found!265 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!112420 (=> (not res!55456) (not e!73060))))

(assert (= (and d!31963 (not res!55457)) b!112419))

(assert (= (and b!112419 c!20094) b!112420))

(assert (= (and b!112419 (not c!20094)) b!112418))

(assert (= (and b!112420 res!55456) b!112417))

(assert (= (or b!112417 b!112418) bm!12062))

(declare-fun m!128195 () Bool)

(assert (=> bm!12062 m!128195))

(declare-fun m!128197 () Bool)

(assert (=> b!112419 m!128197))

(assert (=> b!112419 m!128197))

(declare-fun m!128199 () Bool)

(assert (=> b!112419 m!128199))

(assert (=> b!112420 m!128197))

(declare-fun m!128201 () Bool)

(assert (=> b!112420 m!128201))

(declare-fun m!128203 () Bool)

(assert (=> b!112420 m!128203))

(assert (=> b!112420 m!128197))

(declare-fun m!128205 () Bool)

(assert (=> b!112420 m!128205))

(assert (=> bm!11936 d!31963))

(declare-fun d!31965 () Bool)

(declare-fun isEmpty!385 (Option!163) Bool)

(assert (=> d!31965 (= (isDefined!111 (getValueByKey!157 (toList!794 lt!57567) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355))) (not (isEmpty!385 (getValueByKey!157 (toList!794 lt!57567) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))))

(declare-fun bs!4624 () Bool)

(assert (= bs!4624 d!31965))

(assert (=> bs!4624 m!127547))

(declare-fun m!128207 () Bool)

(assert (=> bs!4624 m!128207))

(assert (=> b!111940 d!31965))

(declare-fun d!31967 () Bool)

(declare-fun c!20095 () Bool)

(assert (=> d!31967 (= c!20095 (and ((_ is Cons!1625) (toList!794 lt!57567)) (= (_1!1213 (h!2225 (toList!794 lt!57567))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355))))))

(declare-fun e!73062 () Option!163)

(assert (=> d!31967 (= (getValueByKey!157 (toList!794 lt!57567) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) e!73062)))

(declare-fun b!112423 () Bool)

(declare-fun e!73063 () Option!163)

(assert (=> b!112423 (= e!73063 (getValueByKey!157 (t!5778 (toList!794 lt!57567)) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun b!112421 () Bool)

(assert (=> b!112421 (= e!73062 (Some!162 (_2!1213 (h!2225 (toList!794 lt!57567)))))))

(declare-fun b!112422 () Bool)

(assert (=> b!112422 (= e!73062 e!73063)))

(declare-fun c!20096 () Bool)

(assert (=> b!112422 (= c!20096 (and ((_ is Cons!1625) (toList!794 lt!57567)) (not (= (_1!1213 (h!2225 (toList!794 lt!57567))) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))))

(declare-fun b!112424 () Bool)

(assert (=> b!112424 (= e!73063 None!161)))

(assert (= (and d!31967 c!20095) b!112421))

(assert (= (and d!31967 (not c!20095)) b!112422))

(assert (= (and b!112422 c!20096) b!112423))

(assert (= (and b!112422 (not c!20096)) b!112424))

(assert (=> b!112423 m!127199))

(declare-fun m!128209 () Bool)

(assert (=> b!112423 m!128209))

(assert (=> b!111940 d!31967))

(declare-fun call!12072 () ListLongMap!1557)

(declare-fun call!12069 () ListLongMap!1557)

(declare-fun bm!12063 () Bool)

(declare-fun call!12070 () ListLongMap!1557)

(declare-fun c!20102 () Bool)

(declare-fun c!20097 () Bool)

(declare-fun call!12067 () ListLongMap!1557)

(assert (=> bm!12063 (= call!12067 (+!140 (ite c!20102 call!12072 (ite c!20097 call!12069 call!12070)) (ite (or c!20102 c!20097) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 newMap!16)) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 newMap!16)))))))

(declare-fun b!112425 () Bool)

(declare-fun e!73068 () Bool)

(assert (=> b!112425 (= e!73068 (validKeyInArray!0 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112426 () Bool)

(declare-fun e!73071 () Bool)

(declare-fun lt!58173 () ListLongMap!1557)

(assert (=> b!112426 (= e!73071 (= (apply!101 lt!58173 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)) (get!1353 (select (arr!2075 (_values!2630 newMap!16)) #b00000000000000000000000000000000) (dynLambda!388 (defaultEntry!2647 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112426 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2334 (_values!2630 newMap!16))))))

(assert (=> b!112426 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(declare-fun bm!12064 () Bool)

(assert (=> bm!12064 (= call!12070 call!12069)))

(declare-fun b!112427 () Bool)

(declare-fun e!73065 () ListLongMap!1557)

(declare-fun e!73067 () ListLongMap!1557)

(assert (=> b!112427 (= e!73065 e!73067)))

(assert (=> b!112427 (= c!20097 (and (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12065 () Bool)

(declare-fun call!12066 () Bool)

(assert (=> bm!12065 (= call!12066 (contains!831 lt!58173 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112428 () Bool)

(declare-fun e!73074 () Bool)

(declare-fun e!73072 () Bool)

(assert (=> b!112428 (= e!73074 e!73072)))

(declare-fun res!55459 () Bool)

(declare-fun call!12071 () Bool)

(assert (=> b!112428 (= res!55459 call!12071)))

(assert (=> b!112428 (=> (not res!55459) (not e!73072))))

(declare-fun b!112429 () Bool)

(declare-fun e!73070 () Bool)

(declare-fun e!73075 () Bool)

(assert (=> b!112429 (= e!73070 e!73075)))

(declare-fun res!55460 () Bool)

(assert (=> b!112429 (= res!55460 call!12066)))

(assert (=> b!112429 (=> (not res!55460) (not e!73075))))

(declare-fun b!112430 () Bool)

(assert (=> b!112430 (= e!73075 (= (apply!101 lt!58173 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2516 newMap!16)))))

(declare-fun b!112431 () Bool)

(declare-fun c!20098 () Bool)

(assert (=> b!112431 (= c!20098 (and (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!73069 () ListLongMap!1557)

(assert (=> b!112431 (= e!73067 e!73069)))

(declare-fun b!112432 () Bool)

(declare-fun e!73073 () Bool)

(assert (=> b!112432 (= e!73073 e!73070)))

(declare-fun c!20101 () Bool)

(assert (=> b!112432 (= c!20101 (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12066 () Bool)

(assert (=> bm!12066 (= call!12071 (contains!831 lt!58173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12067 () Bool)

(declare-fun call!12068 () ListLongMap!1557)

(assert (=> bm!12067 (= call!12068 call!12067)))

(declare-fun b!112433 () Bool)

(declare-fun e!73066 () Bool)

(assert (=> b!112433 (= e!73066 e!73071)))

(declare-fun res!55464 () Bool)

(assert (=> b!112433 (=> (not res!55464) (not e!73071))))

(assert (=> b!112433 (= res!55464 (contains!831 lt!58173 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!112433 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(declare-fun b!112434 () Bool)

(assert (=> b!112434 (= e!73069 call!12070)))

(declare-fun b!112435 () Bool)

(declare-fun e!73064 () Bool)

(assert (=> b!112435 (= e!73064 (validKeyInArray!0 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112436 () Bool)

(assert (=> b!112436 (= e!73070 (not call!12066))))

(declare-fun b!112437 () Bool)

(assert (=> b!112437 (= e!73074 (not call!12071))))

(declare-fun b!112438 () Bool)

(declare-fun res!55461 () Bool)

(assert (=> b!112438 (=> (not res!55461) (not e!73073))))

(assert (=> b!112438 (= res!55461 e!73074)))

(declare-fun c!20100 () Bool)

(assert (=> b!112438 (= c!20100 (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!112439 () Bool)

(declare-fun e!73076 () Unit!3468)

(declare-fun lt!58171 () Unit!3468)

(assert (=> b!112439 (= e!73076 lt!58171)))

(declare-fun lt!58165 () ListLongMap!1557)

(assert (=> b!112439 (= lt!58165 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58166 () (_ BitVec 64))

(assert (=> b!112439 (= lt!58166 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58154 () (_ BitVec 64))

(assert (=> b!112439 (= lt!58154 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58169 () Unit!3468)

(assert (=> b!112439 (= lt!58169 (addStillContains!77 lt!58165 lt!58166 (zeroValue!2516 newMap!16) lt!58154))))

(assert (=> b!112439 (contains!831 (+!140 lt!58165 (tuple2!2405 lt!58166 (zeroValue!2516 newMap!16))) lt!58154)))

(declare-fun lt!58155 () Unit!3468)

(assert (=> b!112439 (= lt!58155 lt!58169)))

(declare-fun lt!58167 () ListLongMap!1557)

(assert (=> b!112439 (= lt!58167 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58157 () (_ BitVec 64))

(assert (=> b!112439 (= lt!58157 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58164 () (_ BitVec 64))

(assert (=> b!112439 (= lt!58164 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58161 () Unit!3468)

(assert (=> b!112439 (= lt!58161 (addApplyDifferent!77 lt!58167 lt!58157 (minValue!2516 newMap!16) lt!58164))))

(assert (=> b!112439 (= (apply!101 (+!140 lt!58167 (tuple2!2405 lt!58157 (minValue!2516 newMap!16))) lt!58164) (apply!101 lt!58167 lt!58164))))

(declare-fun lt!58158 () Unit!3468)

(assert (=> b!112439 (= lt!58158 lt!58161)))

(declare-fun lt!58153 () ListLongMap!1557)

(assert (=> b!112439 (= lt!58153 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58162 () (_ BitVec 64))

(assert (=> b!112439 (= lt!58162 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58163 () (_ BitVec 64))

(assert (=> b!112439 (= lt!58163 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58168 () Unit!3468)

(assert (=> b!112439 (= lt!58168 (addApplyDifferent!77 lt!58153 lt!58162 (zeroValue!2516 newMap!16) lt!58163))))

(assert (=> b!112439 (= (apply!101 (+!140 lt!58153 (tuple2!2405 lt!58162 (zeroValue!2516 newMap!16))) lt!58163) (apply!101 lt!58153 lt!58163))))

(declare-fun lt!58170 () Unit!3468)

(assert (=> b!112439 (= lt!58170 lt!58168)))

(declare-fun lt!58159 () ListLongMap!1557)

(assert (=> b!112439 (= lt!58159 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58172 () (_ BitVec 64))

(assert (=> b!112439 (= lt!58172 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58156 () (_ BitVec 64))

(assert (=> b!112439 (= lt!58156 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112439 (= lt!58171 (addApplyDifferent!77 lt!58159 lt!58172 (minValue!2516 newMap!16) lt!58156))))

(assert (=> b!112439 (= (apply!101 (+!140 lt!58159 (tuple2!2405 lt!58172 (minValue!2516 newMap!16))) lt!58156) (apply!101 lt!58159 lt!58156))))

(declare-fun b!112440 () Bool)

(assert (=> b!112440 (= e!73067 call!12068)))

(declare-fun d!31969 () Bool)

(assert (=> d!31969 e!73073))

(declare-fun res!55462 () Bool)

(assert (=> d!31969 (=> (not res!55462) (not e!73073))))

(assert (=> d!31969 (= res!55462 (or (bvsge #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))))

(declare-fun lt!58160 () ListLongMap!1557)

(assert (=> d!31969 (= lt!58173 lt!58160)))

(declare-fun lt!58174 () Unit!3468)

(assert (=> d!31969 (= lt!58174 e!73076)))

(declare-fun c!20099 () Bool)

(assert (=> d!31969 (= c!20099 e!73068)))

(declare-fun res!55463 () Bool)

(assert (=> d!31969 (=> (not res!55463) (not e!73068))))

(assert (=> d!31969 (= res!55463 (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(assert (=> d!31969 (= lt!58160 e!73065)))

(assert (=> d!31969 (= c!20102 (and (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!31969 (validMask!0 (mask!6824 newMap!16))))

(assert (=> d!31969 (= (getCurrentListMap!470 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) lt!58173)))

(declare-fun b!112441 () Bool)

(declare-fun Unit!3496 () Unit!3468)

(assert (=> b!112441 (= e!73076 Unit!3496)))

(declare-fun bm!12068 () Bool)

(assert (=> bm!12068 (= call!12072 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun b!112442 () Bool)

(assert (=> b!112442 (= e!73069 call!12068)))

(declare-fun b!112443 () Bool)

(assert (=> b!112443 (= e!73072 (= (apply!101 lt!58173 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2516 newMap!16)))))

(declare-fun bm!12069 () Bool)

(assert (=> bm!12069 (= call!12069 call!12072)))

(declare-fun b!112444 () Bool)

(declare-fun res!55466 () Bool)

(assert (=> b!112444 (=> (not res!55466) (not e!73073))))

(assert (=> b!112444 (= res!55466 e!73066)))

(declare-fun res!55458 () Bool)

(assert (=> b!112444 (=> res!55458 e!73066)))

(assert (=> b!112444 (= res!55458 (not e!73064))))

(declare-fun res!55465 () Bool)

(assert (=> b!112444 (=> (not res!55465) (not e!73064))))

(assert (=> b!112444 (= res!55465 (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(declare-fun b!112445 () Bool)

(assert (=> b!112445 (= e!73065 (+!140 call!12067 (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 newMap!16))))))

(assert (= (and d!31969 c!20102) b!112445))

(assert (= (and d!31969 (not c!20102)) b!112427))

(assert (= (and b!112427 c!20097) b!112440))

(assert (= (and b!112427 (not c!20097)) b!112431))

(assert (= (and b!112431 c!20098) b!112442))

(assert (= (and b!112431 (not c!20098)) b!112434))

(assert (= (or b!112442 b!112434) bm!12064))

(assert (= (or b!112440 bm!12064) bm!12069))

(assert (= (or b!112440 b!112442) bm!12067))

(assert (= (or b!112445 bm!12069) bm!12068))

(assert (= (or b!112445 bm!12067) bm!12063))

(assert (= (and d!31969 res!55463) b!112425))

(assert (= (and d!31969 c!20099) b!112439))

(assert (= (and d!31969 (not c!20099)) b!112441))

(assert (= (and d!31969 res!55462) b!112444))

(assert (= (and b!112444 res!55465) b!112435))

(assert (= (and b!112444 (not res!55458)) b!112433))

(assert (= (and b!112433 res!55464) b!112426))

(assert (= (and b!112444 res!55466) b!112438))

(assert (= (and b!112438 c!20100) b!112428))

(assert (= (and b!112438 (not c!20100)) b!112437))

(assert (= (and b!112428 res!55459) b!112443))

(assert (= (or b!112428 b!112437) bm!12066))

(assert (= (and b!112438 res!55461) b!112432))

(assert (= (and b!112432 c!20101) b!112429))

(assert (= (and b!112432 (not c!20101)) b!112436))

(assert (= (and b!112429 res!55460) b!112430))

(assert (= (or b!112429 b!112436) bm!12065))

(declare-fun b_lambda!5023 () Bool)

(assert (=> (not b_lambda!5023) (not b!112426)))

(assert (=> b!112426 t!5790))

(declare-fun b_and!6893 () Bool)

(assert (= b_and!6889 (and (=> t!5790 result!3561) b_and!6893)))

(assert (=> b!112426 t!5792))

(declare-fun b_and!6895 () Bool)

(assert (= b_and!6891 (and (=> t!5792 result!3563) b_and!6895)))

(assert (=> d!31969 m!127611))

(declare-fun m!128211 () Bool)

(assert (=> b!112439 m!128211))

(declare-fun m!128213 () Bool)

(assert (=> b!112439 m!128213))

(declare-fun m!128215 () Bool)

(assert (=> b!112439 m!128215))

(declare-fun m!128217 () Bool)

(assert (=> b!112439 m!128217))

(declare-fun m!128219 () Bool)

(assert (=> b!112439 m!128219))

(declare-fun m!128221 () Bool)

(assert (=> b!112439 m!128221))

(declare-fun m!128223 () Bool)

(assert (=> b!112439 m!128223))

(assert (=> b!112439 m!128223))

(declare-fun m!128225 () Bool)

(assert (=> b!112439 m!128225))

(assert (=> b!112439 m!128211))

(declare-fun m!128227 () Bool)

(assert (=> b!112439 m!128227))

(declare-fun m!128229 () Bool)

(assert (=> b!112439 m!128229))

(declare-fun m!128231 () Bool)

(assert (=> b!112439 m!128231))

(declare-fun m!128233 () Bool)

(assert (=> b!112439 m!128233))

(declare-fun m!128235 () Bool)

(assert (=> b!112439 m!128235))

(declare-fun m!128237 () Bool)

(assert (=> b!112439 m!128237))

(declare-fun m!128239 () Bool)

(assert (=> b!112439 m!128239))

(assert (=> b!112439 m!127671))

(assert (=> b!112439 m!128233))

(assert (=> b!112439 m!128237))

(declare-fun m!128241 () Bool)

(assert (=> b!112439 m!128241))

(declare-fun m!128243 () Bool)

(assert (=> b!112430 m!128243))

(assert (=> b!112425 m!127671))

(assert (=> b!112425 m!127671))

(assert (=> b!112425 m!127673))

(declare-fun m!128245 () Bool)

(assert (=> bm!12065 m!128245))

(declare-fun m!128247 () Bool)

(assert (=> bm!12063 m!128247))

(declare-fun m!128249 () Bool)

(assert (=> b!112443 m!128249))

(assert (=> b!112433 m!127671))

(assert (=> b!112433 m!127671))

(declare-fun m!128251 () Bool)

(assert (=> b!112433 m!128251))

(declare-fun m!128253 () Bool)

(assert (=> bm!12066 m!128253))

(assert (=> bm!12068 m!128231))

(assert (=> b!112435 m!127671))

(assert (=> b!112435 m!127671))

(assert (=> b!112435 m!127673))

(declare-fun m!128255 () Bool)

(assert (=> b!112426 m!128255))

(assert (=> b!112426 m!127897))

(assert (=> b!112426 m!128255))

(assert (=> b!112426 m!127897))

(declare-fun m!128257 () Bool)

(assert (=> b!112426 m!128257))

(assert (=> b!112426 m!127671))

(assert (=> b!112426 m!127671))

(declare-fun m!128259 () Bool)

(assert (=> b!112426 m!128259))

(declare-fun m!128261 () Bool)

(assert (=> b!112445 m!128261))

(assert (=> d!31779 d!31969))

(declare-fun d!31971 () Bool)

(declare-fun e!73077 () Bool)

(assert (=> d!31971 e!73077))

(declare-fun res!55467 () Bool)

(assert (=> d!31971 (=> res!55467 e!73077)))

(declare-fun lt!58175 () Bool)

(assert (=> d!31971 (= res!55467 (not lt!58175))))

(declare-fun lt!58176 () Bool)

(assert (=> d!31971 (= lt!58175 lt!58176)))

(declare-fun lt!58177 () Unit!3468)

(declare-fun e!73078 () Unit!3468)

(assert (=> d!31971 (= lt!58177 e!73078)))

(declare-fun c!20103 () Bool)

(assert (=> d!31971 (= c!20103 lt!58176)))

(assert (=> d!31971 (= lt!58176 (containsKey!161 (toList!794 lt!57766) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!31971 (= (contains!831 lt!57766 #b1000000000000000000000000000000000000000000000000000000000000000) lt!58175)))

(declare-fun b!112446 () Bool)

(declare-fun lt!58178 () Unit!3468)

(assert (=> b!112446 (= e!73078 lt!58178)))

(assert (=> b!112446 (= lt!58178 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 lt!57766) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112446 (isDefined!111 (getValueByKey!157 (toList!794 lt!57766) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112447 () Bool)

(declare-fun Unit!3497 () Unit!3468)

(assert (=> b!112447 (= e!73078 Unit!3497)))

(declare-fun b!112448 () Bool)

(assert (=> b!112448 (= e!73077 (isDefined!111 (getValueByKey!157 (toList!794 lt!57766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!31971 c!20103) b!112446))

(assert (= (and d!31971 (not c!20103)) b!112447))

(assert (= (and d!31971 (not res!55467)) b!112448))

(declare-fun m!128263 () Bool)

(assert (=> d!31971 m!128263))

(declare-fun m!128265 () Bool)

(assert (=> b!112446 m!128265))

(declare-fun m!128267 () Bool)

(assert (=> b!112446 m!128267))

(assert (=> b!112446 m!128267))

(declare-fun m!128269 () Bool)

(assert (=> b!112446 m!128269))

(assert (=> b!112448 m!128267))

(assert (=> b!112448 m!128267))

(assert (=> b!112448 m!128269))

(assert (=> b!111924 d!31971))

(declare-fun d!31973 () Bool)

(assert (=> d!31973 (= (apply!101 lt!57724 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1356 (getValueByKey!157 (toList!794 lt!57724) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4625 () Bool)

(assert (= bs!4625 d!31973))

(assert (=> bs!4625 m!127683))

(assert (=> bs!4625 m!127683))

(declare-fun m!128271 () Bool)

(assert (=> bs!4625 m!128271))

(assert (=> b!111841 d!31973))

(declare-fun d!31975 () Bool)

(declare-fun e!73081 () Bool)

(assert (=> d!31975 e!73081))

(declare-fun res!55470 () Bool)

(assert (=> d!31975 (=> (not res!55470) (not e!73081))))

(assert (=> d!31975 (= res!55470 (and (bvsge (index!3212 lt!57865) #b00000000000000000000000000000000) (bvslt (index!3212 lt!57865) (size!2333 (_keys!4364 newMap!16)))))))

(declare-fun lt!58181 () Unit!3468)

(declare-fun choose!714 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 32) Int) Unit!3468)

(assert (=> d!31975 (= lt!58181 (choose!714 (_keys!4364 newMap!16) lt!57868 (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (index!3212 lt!57865) (defaultEntry!2647 newMap!16)))))

(assert (=> d!31975 (validMask!0 (mask!6824 newMap!16))))

(assert (=> d!31975 (= (lemmaValidKeyInArrayIsInListMap!109 (_keys!4364 newMap!16) lt!57868 (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (index!3212 lt!57865) (defaultEntry!2647 newMap!16)) lt!58181)))

(declare-fun b!112451 () Bool)

(assert (=> b!112451 (= e!73081 (contains!831 (getCurrentListMap!470 (_keys!4364 newMap!16) lt!57868 (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (select (arr!2074 (_keys!4364 newMap!16)) (index!3212 lt!57865))))))

(assert (= (and d!31975 res!55470) b!112451))

(declare-fun m!128273 () Bool)

(assert (=> d!31975 m!128273))

(assert (=> d!31975 m!127611))

(assert (=> b!112451 m!127573))

(assert (=> b!112451 m!127561))

(assert (=> b!112451 m!127573))

(assert (=> b!112451 m!127561))

(declare-fun m!128275 () Bool)

(assert (=> b!112451 m!128275))

(assert (=> b!112039 d!31975))

(declare-fun d!31977 () Bool)

(declare-fun e!73084 () Bool)

(assert (=> d!31977 e!73084))

(declare-fun res!55473 () Bool)

(assert (=> d!31977 (=> (not res!55473) (not e!73084))))

(assert (=> d!31977 (= res!55473 (and (bvsge (index!3212 lt!57865) #b00000000000000000000000000000000) (bvslt (index!3212 lt!57865) (size!2334 (_values!2630 newMap!16)))))))

(declare-fun lt!58184 () Unit!3468)

(declare-fun choose!715 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 32) (_ BitVec 64) V!3249 Int) Unit!3468)

(assert (=> d!31977 (= lt!58184 (choose!715 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (index!3212 lt!57865) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575 (defaultEntry!2647 newMap!16)))))

(assert (=> d!31977 (validMask!0 (mask!6824 newMap!16))))

(assert (=> d!31977 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!50 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (index!3212 lt!57865) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575 (defaultEntry!2647 newMap!16)) lt!58184)))

(declare-fun b!112454 () Bool)

(assert (=> b!112454 (= e!73084 (= (+!140 (getCurrentListMap!470 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)) (getCurrentListMap!470 (_keys!4364 newMap!16) (array!4382 (store (arr!2075 (_values!2630 newMap!16)) (index!3212 lt!57865) (ValueCellFull!1007 lt!57575)) (size!2334 (_values!2630 newMap!16))) (mask!6824 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16))))))

(assert (= (and d!31977 res!55473) b!112454))

(assert (=> d!31977 m!127199))

(declare-fun m!128277 () Bool)

(assert (=> d!31977 m!128277))

(assert (=> d!31977 m!127611))

(assert (=> b!112454 m!127387))

(assert (=> b!112454 m!127387))

(assert (=> b!112454 m!127785))

(assert (=> b!112454 m!127581))

(declare-fun m!128279 () Bool)

(assert (=> b!112454 m!128279))

(assert (=> b!112039 d!31977))

(declare-fun d!31979 () Bool)

(declare-fun e!73085 () Bool)

(assert (=> d!31979 e!73085))

(declare-fun res!55474 () Bool)

(assert (=> d!31979 (=> res!55474 e!73085)))

(declare-fun lt!58185 () Bool)

(assert (=> d!31979 (= res!55474 (not lt!58185))))

(declare-fun lt!58186 () Bool)

(assert (=> d!31979 (= lt!58185 lt!58186)))

(declare-fun lt!58187 () Unit!3468)

(declare-fun e!73086 () Unit!3468)

(assert (=> d!31979 (= lt!58187 e!73086)))

(declare-fun c!20104 () Bool)

(assert (=> d!31979 (= c!20104 lt!58186)))

(assert (=> d!31979 (= lt!58186 (containsKey!161 (toList!794 call!12009) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (=> d!31979 (= (contains!831 call!12009 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) lt!58185)))

(declare-fun b!112455 () Bool)

(declare-fun lt!58188 () Unit!3468)

(assert (=> b!112455 (= e!73086 lt!58188)))

(assert (=> b!112455 (= lt!58188 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 call!12009) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (=> b!112455 (isDefined!111 (getValueByKey!157 (toList!794 call!12009) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun b!112456 () Bool)

(declare-fun Unit!3498 () Unit!3468)

(assert (=> b!112456 (= e!73086 Unit!3498)))

(declare-fun b!112457 () Bool)

(assert (=> b!112457 (= e!73085 (isDefined!111 (getValueByKey!157 (toList!794 call!12009) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355))))))

(assert (= (and d!31979 c!20104) b!112455))

(assert (= (and d!31979 (not c!20104)) b!112456))

(assert (= (and d!31979 (not res!55474)) b!112457))

(assert (=> d!31979 m!127199))

(declare-fun m!128281 () Bool)

(assert (=> d!31979 m!128281))

(assert (=> b!112455 m!127199))

(declare-fun m!128283 () Bool)

(assert (=> b!112455 m!128283))

(assert (=> b!112455 m!127199))

(declare-fun m!128285 () Bool)

(assert (=> b!112455 m!128285))

(assert (=> b!112455 m!128285))

(declare-fun m!128287 () Bool)

(assert (=> b!112455 m!128287))

(assert (=> b!112457 m!127199))

(assert (=> b!112457 m!128285))

(assert (=> b!112457 m!128285))

(assert (=> b!112457 m!128287))

(assert (=> b!112039 d!31979))

(declare-fun d!31981 () Bool)

(declare-fun e!73087 () Bool)

(assert (=> d!31981 e!73087))

(declare-fun res!55475 () Bool)

(assert (=> d!31981 (=> res!55475 e!73087)))

(declare-fun lt!58189 () Bool)

(assert (=> d!31981 (= res!55475 (not lt!58189))))

(declare-fun lt!58190 () Bool)

(assert (=> d!31981 (= lt!58189 lt!58190)))

(declare-fun lt!58191 () Unit!3468)

(declare-fun e!73088 () Unit!3468)

(assert (=> d!31981 (= lt!58191 e!73088)))

(declare-fun c!20105 () Bool)

(assert (=> d!31981 (= c!20105 lt!58190)))

(assert (=> d!31981 (= lt!58190 (containsKey!161 (toList!794 e!72850) (ite c!20000 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (select (arr!2074 (_keys!4364 newMap!16)) (index!3212 lt!57865)))))))

(assert (=> d!31981 (= (contains!831 e!72850 (ite c!20000 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (select (arr!2074 (_keys!4364 newMap!16)) (index!3212 lt!57865)))) lt!58189)))

(declare-fun b!112458 () Bool)

(declare-fun lt!58192 () Unit!3468)

(assert (=> b!112458 (= e!73088 lt!58192)))

(assert (=> b!112458 (= lt!58192 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 e!72850) (ite c!20000 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (select (arr!2074 (_keys!4364 newMap!16)) (index!3212 lt!57865)))))))

(assert (=> b!112458 (isDefined!111 (getValueByKey!157 (toList!794 e!72850) (ite c!20000 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (select (arr!2074 (_keys!4364 newMap!16)) (index!3212 lt!57865)))))))

(declare-fun b!112459 () Bool)

(declare-fun Unit!3499 () Unit!3468)

(assert (=> b!112459 (= e!73088 Unit!3499)))

(declare-fun b!112460 () Bool)

(assert (=> b!112460 (= e!73087 (isDefined!111 (getValueByKey!157 (toList!794 e!72850) (ite c!20000 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) (select (arr!2074 (_keys!4364 newMap!16)) (index!3212 lt!57865))))))))

(assert (= (and d!31981 c!20105) b!112458))

(assert (= (and d!31981 (not c!20105)) b!112459))

(assert (= (and d!31981 (not res!55475)) b!112460))

(declare-fun m!128289 () Bool)

(assert (=> d!31981 m!128289))

(declare-fun m!128291 () Bool)

(assert (=> b!112458 m!128291))

(declare-fun m!128293 () Bool)

(assert (=> b!112458 m!128293))

(assert (=> b!112458 m!128293))

(declare-fun m!128295 () Bool)

(assert (=> b!112458 m!128295))

(assert (=> b!112460 m!128293))

(assert (=> b!112460 m!128293))

(assert (=> b!112460 m!128295))

(assert (=> bm!11989 d!31981))

(declare-fun d!31983 () Bool)

(declare-fun e!73089 () Bool)

(assert (=> d!31983 e!73089))

(declare-fun res!55477 () Bool)

(assert (=> d!31983 (=> (not res!55477) (not e!73089))))

(declare-fun lt!58193 () ListLongMap!1557)

(assert (=> d!31983 (= res!55477 (contains!831 lt!58193 (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(declare-fun lt!58196 () List!1629)

(assert (=> d!31983 (= lt!58193 (ListLongMap!1558 lt!58196))))

(declare-fun lt!58195 () Unit!3468)

(declare-fun lt!58194 () Unit!3468)

(assert (=> d!31983 (= lt!58195 lt!58194)))

(assert (=> d!31983 (= (getValueByKey!157 lt!58196 (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))) (Some!162 (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(assert (=> d!31983 (= lt!58194 (lemmaContainsTupThenGetReturnValue!76 lt!58196 (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)) (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(assert (=> d!31983 (= lt!58196 (insertStrictlySorted!79 (toList!794 lt!57569) (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)) (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(assert (=> d!31983 (= (+!140 lt!57569 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)) lt!58193)))

(declare-fun b!112461 () Bool)

(declare-fun res!55476 () Bool)

(assert (=> b!112461 (=> (not res!55476) (not e!73089))))

(assert (=> b!112461 (= res!55476 (= (getValueByKey!157 (toList!794 lt!58193) (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))) (Some!162 (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)))))))

(declare-fun b!112462 () Bool)

(assert (=> b!112462 (= e!73089 (contains!833 (toList!794 lt!58193) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)))))

(assert (= (and d!31983 res!55477) b!112461))

(assert (= (and b!112461 res!55476) b!112462))

(declare-fun m!128297 () Bool)

(assert (=> d!31983 m!128297))

(declare-fun m!128299 () Bool)

(assert (=> d!31983 m!128299))

(declare-fun m!128301 () Bool)

(assert (=> d!31983 m!128301))

(declare-fun m!128303 () Bool)

(assert (=> d!31983 m!128303))

(declare-fun m!128305 () Bool)

(assert (=> b!112461 m!128305))

(declare-fun m!128307 () Bool)

(assert (=> b!112462 m!128307))

(assert (=> d!31803 d!31983))

(declare-fun d!31985 () Bool)

(assert (=> d!31985 (= (+!140 (+!140 lt!57569 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) (+!140 (+!140 lt!57569 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)))))

(assert (=> d!31985 true))

(declare-fun _$28!170 () Unit!3468)

(assert (=> d!31985 (= (choose!705 lt!57569 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))) _$28!170)))

(declare-fun bs!4626 () Bool)

(assert (= bs!4626 d!31985))

(assert (=> bs!4626 m!127535))

(assert (=> bs!4626 m!127535))

(assert (=> bs!4626 m!127537))

(assert (=> bs!4626 m!127539))

(assert (=> bs!4626 m!127539))

(assert (=> bs!4626 m!127541))

(assert (=> d!31803 d!31985))

(declare-fun d!31987 () Bool)

(declare-fun e!73090 () Bool)

(assert (=> d!31987 e!73090))

(declare-fun res!55479 () Bool)

(assert (=> d!31987 (=> (not res!55479) (not e!73090))))

(declare-fun lt!58197 () ListLongMap!1557)

(assert (=> d!31987 (= res!55479 (contains!831 lt!58197 (_1!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(declare-fun lt!58200 () List!1629)

(assert (=> d!31987 (= lt!58197 (ListLongMap!1558 lt!58200))))

(declare-fun lt!58199 () Unit!3468)

(declare-fun lt!58198 () Unit!3468)

(assert (=> d!31987 (= lt!58199 lt!58198)))

(assert (=> d!31987 (= (getValueByKey!157 lt!58200 (_1!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))) (Some!162 (_2!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31987 (= lt!58198 (lemmaContainsTupThenGetReturnValue!76 lt!58200 (_1!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) (_2!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31987 (= lt!58200 (insertStrictlySorted!79 (toList!794 (+!140 lt!57569 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))) (_1!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) (_2!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31987 (= (+!140 (+!140 lt!57569 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!58197)))

(declare-fun b!112463 () Bool)

(declare-fun res!55478 () Bool)

(assert (=> b!112463 (=> (not res!55478) (not e!73090))))

(assert (=> b!112463 (= res!55478 (= (getValueByKey!157 (toList!794 lt!58197) (_1!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))) (Some!162 (_2!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))))))))

(declare-fun b!112464 () Bool)

(assert (=> b!112464 (= e!73090 (contains!833 (toList!794 lt!58197) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))))))

(assert (= (and d!31987 res!55479) b!112463))

(assert (= (and b!112463 res!55478) b!112464))

(declare-fun m!128309 () Bool)

(assert (=> d!31987 m!128309))

(declare-fun m!128311 () Bool)

(assert (=> d!31987 m!128311))

(declare-fun m!128313 () Bool)

(assert (=> d!31987 m!128313))

(declare-fun m!128315 () Bool)

(assert (=> d!31987 m!128315))

(declare-fun m!128317 () Bool)

(assert (=> b!112463 m!128317))

(declare-fun m!128319 () Bool)

(assert (=> b!112464 m!128319))

(assert (=> d!31803 d!31987))

(declare-fun d!31989 () Bool)

(declare-fun e!73091 () Bool)

(assert (=> d!31989 e!73091))

(declare-fun res!55481 () Bool)

(assert (=> d!31989 (=> (not res!55481) (not e!73091))))

(declare-fun lt!58201 () ListLongMap!1557)

(assert (=> d!31989 (= res!55481 (contains!831 lt!58201 (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(declare-fun lt!58204 () List!1629)

(assert (=> d!31989 (= lt!58201 (ListLongMap!1558 lt!58204))))

(declare-fun lt!58203 () Unit!3468)

(declare-fun lt!58202 () Unit!3468)

(assert (=> d!31989 (= lt!58203 lt!58202)))

(assert (=> d!31989 (= (getValueByKey!157 lt!58204 (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))) (Some!162 (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(assert (=> d!31989 (= lt!58202 (lemmaContainsTupThenGetReturnValue!76 lt!58204 (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)) (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(assert (=> d!31989 (= lt!58204 (insertStrictlySorted!79 (toList!794 (+!140 lt!57569 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))) (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)) (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))))))

(assert (=> d!31989 (= (+!140 (+!140 lt!57569 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)) lt!58201)))

(declare-fun b!112465 () Bool)

(declare-fun res!55480 () Bool)

(assert (=> b!112465 (=> (not res!55480) (not e!73091))))

(assert (=> b!112465 (= res!55480 (= (getValueByKey!157 (toList!794 lt!58201) (_1!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575))) (Some!162 (_2!1213 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)))))))

(declare-fun b!112466 () Bool)

(assert (=> b!112466 (= e!73091 (contains!833 (toList!794 lt!58201) (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355) lt!57575)))))

(assert (= (and d!31989 res!55481) b!112465))

(assert (= (and b!112465 res!55480) b!112466))

(declare-fun m!128321 () Bool)

(assert (=> d!31989 m!128321))

(declare-fun m!128323 () Bool)

(assert (=> d!31989 m!128323))

(declare-fun m!128325 () Bool)

(assert (=> d!31989 m!128325))

(declare-fun m!128327 () Bool)

(assert (=> d!31989 m!128327))

(declare-fun m!128329 () Bool)

(assert (=> b!112465 m!128329))

(declare-fun m!128331 () Bool)

(assert (=> b!112466 m!128331))

(assert (=> d!31803 d!31989))

(declare-fun d!31991 () Bool)

(declare-fun e!73092 () Bool)

(assert (=> d!31991 e!73092))

(declare-fun res!55483 () Bool)

(assert (=> d!31991 (=> (not res!55483) (not e!73092))))

(declare-fun lt!58205 () ListLongMap!1557)

(assert (=> d!31991 (= res!55483 (contains!831 lt!58205 (_1!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(declare-fun lt!58208 () List!1629)

(assert (=> d!31991 (= lt!58205 (ListLongMap!1558 lt!58208))))

(declare-fun lt!58207 () Unit!3468)

(declare-fun lt!58206 () Unit!3468)

(assert (=> d!31991 (= lt!58207 lt!58206)))

(assert (=> d!31991 (= (getValueByKey!157 lt!58208 (_1!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))) (Some!162 (_2!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31991 (= lt!58206 (lemmaContainsTupThenGetReturnValue!76 lt!58208 (_1!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) (_2!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31991 (= lt!58208 (insertStrictlySorted!79 (toList!794 lt!57569) (_1!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) (_2!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!31991 (= (+!140 lt!57569 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!58205)))

(declare-fun b!112467 () Bool)

(declare-fun res!55482 () Bool)

(assert (=> b!112467 (=> (not res!55482) (not e!73092))))

(assert (=> b!112467 (= res!55482 (= (getValueByKey!157 (toList!794 lt!58205) (_1!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992)))))) (Some!162 (_2!1213 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))))))))

(declare-fun b!112468 () Bool)

(assert (=> b!112468 (= e!73092 (contains!833 (toList!794 lt!58205) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2936 (underlying!366 thiss!992))))))))

(assert (= (and d!31991 res!55483) b!112467))

(assert (= (and b!112467 res!55482) b!112468))

(declare-fun m!128333 () Bool)

(assert (=> d!31991 m!128333))

(declare-fun m!128335 () Bool)

(assert (=> d!31991 m!128335))

(declare-fun m!128337 () Bool)

(assert (=> d!31991 m!128337))

(declare-fun m!128339 () Bool)

(assert (=> d!31991 m!128339))

(declare-fun m!128341 () Bool)

(assert (=> b!112467 m!128341))

(declare-fun m!128343 () Bool)

(assert (=> b!112468 m!128343))

(assert (=> d!31803 d!31991))

(declare-fun d!31993 () Bool)

(declare-fun e!73093 () Bool)

(assert (=> d!31993 e!73093))

(declare-fun res!55484 () Bool)

(assert (=> d!31993 (=> res!55484 e!73093)))

(declare-fun lt!58209 () Bool)

(assert (=> d!31993 (= res!55484 (not lt!58209))))

(declare-fun lt!58210 () Bool)

(assert (=> d!31993 (= lt!58209 lt!58210)))

(declare-fun lt!58211 () Unit!3468)

(declare-fun e!73094 () Unit!3468)

(assert (=> d!31993 (= lt!58211 e!73094)))

(declare-fun c!20106 () Bool)

(assert (=> d!31993 (= c!20106 lt!58210)))

(assert (=> d!31993 (= lt!58210 (containsKey!161 (toList!794 lt!57776) (_1!1213 lt!57571)))))

(assert (=> d!31993 (= (contains!831 lt!57776 (_1!1213 lt!57571)) lt!58209)))

(declare-fun b!112469 () Bool)

(declare-fun lt!58212 () Unit!3468)

(assert (=> b!112469 (= e!73094 lt!58212)))

(assert (=> b!112469 (= lt!58212 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 lt!57776) (_1!1213 lt!57571)))))

(assert (=> b!112469 (isDefined!111 (getValueByKey!157 (toList!794 lt!57776) (_1!1213 lt!57571)))))

(declare-fun b!112470 () Bool)

(declare-fun Unit!3500 () Unit!3468)

(assert (=> b!112470 (= e!73094 Unit!3500)))

(declare-fun b!112471 () Bool)

(assert (=> b!112471 (= e!73093 (isDefined!111 (getValueByKey!157 (toList!794 lt!57776) (_1!1213 lt!57571))))))

(assert (= (and d!31993 c!20106) b!112469))

(assert (= (and d!31993 (not c!20106)) b!112470))

(assert (= (and d!31993 (not res!55484)) b!112471))

(declare-fun m!128345 () Bool)

(assert (=> d!31993 m!128345))

(declare-fun m!128347 () Bool)

(assert (=> b!112469 m!128347))

(assert (=> b!112469 m!127529))

(assert (=> b!112469 m!127529))

(declare-fun m!128349 () Bool)

(assert (=> b!112469 m!128349))

(assert (=> b!112471 m!127529))

(assert (=> b!112471 m!127529))

(assert (=> b!112471 m!128349))

(assert (=> d!31801 d!31993))

(declare-fun d!31995 () Bool)

(declare-fun c!20107 () Bool)

(assert (=> d!31995 (= c!20107 (and ((_ is Cons!1625) lt!57779) (= (_1!1213 (h!2225 lt!57779)) (_1!1213 lt!57571))))))

(declare-fun e!73095 () Option!163)

(assert (=> d!31995 (= (getValueByKey!157 lt!57779 (_1!1213 lt!57571)) e!73095)))

(declare-fun b!112474 () Bool)

(declare-fun e!73096 () Option!163)

(assert (=> b!112474 (= e!73096 (getValueByKey!157 (t!5778 lt!57779) (_1!1213 lt!57571)))))

(declare-fun b!112472 () Bool)

(assert (=> b!112472 (= e!73095 (Some!162 (_2!1213 (h!2225 lt!57779))))))

(declare-fun b!112473 () Bool)

(assert (=> b!112473 (= e!73095 e!73096)))

(declare-fun c!20108 () Bool)

(assert (=> b!112473 (= c!20108 (and ((_ is Cons!1625) lt!57779) (not (= (_1!1213 (h!2225 lt!57779)) (_1!1213 lt!57571)))))))

(declare-fun b!112475 () Bool)

(assert (=> b!112475 (= e!73096 None!161)))

(assert (= (and d!31995 c!20107) b!112472))

(assert (= (and d!31995 (not c!20107)) b!112473))

(assert (= (and b!112473 c!20108) b!112474))

(assert (= (and b!112473 (not c!20108)) b!112475))

(declare-fun m!128351 () Bool)

(assert (=> b!112474 m!128351))

(assert (=> d!31801 d!31995))

(declare-fun d!31997 () Bool)

(assert (=> d!31997 (= (getValueByKey!157 lt!57779 (_1!1213 lt!57571)) (Some!162 (_2!1213 lt!57571)))))

(declare-fun lt!58213 () Unit!3468)

(assert (=> d!31997 (= lt!58213 (choose!706 lt!57779 (_1!1213 lt!57571) (_2!1213 lt!57571)))))

(declare-fun e!73097 () Bool)

(assert (=> d!31997 e!73097))

(declare-fun res!55485 () Bool)

(assert (=> d!31997 (=> (not res!55485) (not e!73097))))

(assert (=> d!31997 (= res!55485 (isStrictlySorted!307 lt!57779))))

(assert (=> d!31997 (= (lemmaContainsTupThenGetReturnValue!76 lt!57779 (_1!1213 lt!57571) (_2!1213 lt!57571)) lt!58213)))

(declare-fun b!112476 () Bool)

(declare-fun res!55486 () Bool)

(assert (=> b!112476 (=> (not res!55486) (not e!73097))))

(assert (=> b!112476 (= res!55486 (containsKey!161 lt!57779 (_1!1213 lt!57571)))))

(declare-fun b!112477 () Bool)

(assert (=> b!112477 (= e!73097 (contains!833 lt!57779 (tuple2!2405 (_1!1213 lt!57571) (_2!1213 lt!57571))))))

(assert (= (and d!31997 res!55485) b!112476))

(assert (= (and b!112476 res!55486) b!112477))

(assert (=> d!31997 m!127523))

(declare-fun m!128353 () Bool)

(assert (=> d!31997 m!128353))

(declare-fun m!128355 () Bool)

(assert (=> d!31997 m!128355))

(declare-fun m!128357 () Bool)

(assert (=> b!112476 m!128357))

(declare-fun m!128359 () Bool)

(assert (=> b!112477 m!128359))

(assert (=> d!31801 d!31997))

(declare-fun b!112478 () Bool)

(declare-fun e!73100 () List!1629)

(declare-fun call!12073 () List!1629)

(assert (=> b!112478 (= e!73100 call!12073)))

(declare-fun bm!12070 () Bool)

(declare-fun call!12074 () List!1629)

(declare-fun call!12075 () List!1629)

(assert (=> bm!12070 (= call!12074 call!12075)))

(declare-fun b!112479 () Bool)

(declare-fun e!73102 () List!1629)

(assert (=> b!112479 (= e!73102 (insertStrictlySorted!79 (t!5778 (toList!794 lt!57569)) (_1!1213 lt!57571) (_2!1213 lt!57571)))))

(declare-fun b!112480 () Bool)

(declare-fun res!55487 () Bool)

(declare-fun e!73098 () Bool)

(assert (=> b!112480 (=> (not res!55487) (not e!73098))))

(declare-fun lt!58214 () List!1629)

(assert (=> b!112480 (= res!55487 (containsKey!161 lt!58214 (_1!1213 lt!57571)))))

(declare-fun b!112481 () Bool)

(assert (=> b!112481 (= e!73098 (contains!833 lt!58214 (tuple2!2405 (_1!1213 lt!57571) (_2!1213 lt!57571))))))

(declare-fun b!112482 () Bool)

(assert (=> b!112482 (= e!73100 call!12073)))

(declare-fun b!112483 () Bool)

(declare-fun e!73099 () List!1629)

(assert (=> b!112483 (= e!73099 call!12075)))

(declare-fun d!31999 () Bool)

(assert (=> d!31999 e!73098))

(declare-fun res!55488 () Bool)

(assert (=> d!31999 (=> (not res!55488) (not e!73098))))

(assert (=> d!31999 (= res!55488 (isStrictlySorted!307 lt!58214))))

(assert (=> d!31999 (= lt!58214 e!73099)))

(declare-fun c!20112 () Bool)

(assert (=> d!31999 (= c!20112 (and ((_ is Cons!1625) (toList!794 lt!57569)) (bvslt (_1!1213 (h!2225 (toList!794 lt!57569))) (_1!1213 lt!57571))))))

(assert (=> d!31999 (isStrictlySorted!307 (toList!794 lt!57569))))

(assert (=> d!31999 (= (insertStrictlySorted!79 (toList!794 lt!57569) (_1!1213 lt!57571) (_2!1213 lt!57571)) lt!58214)))

(declare-fun bm!12071 () Bool)

(assert (=> bm!12071 (= call!12075 ($colon$colon!83 e!73102 (ite c!20112 (h!2225 (toList!794 lt!57569)) (tuple2!2405 (_1!1213 lt!57571) (_2!1213 lt!57571)))))))

(declare-fun c!20110 () Bool)

(assert (=> bm!12071 (= c!20110 c!20112)))

(declare-fun b!112484 () Bool)

(declare-fun e!73101 () List!1629)

(assert (=> b!112484 (= e!73099 e!73101)))

(declare-fun c!20109 () Bool)

(assert (=> b!112484 (= c!20109 (and ((_ is Cons!1625) (toList!794 lt!57569)) (= (_1!1213 (h!2225 (toList!794 lt!57569))) (_1!1213 lt!57571))))))

(declare-fun bm!12072 () Bool)

(assert (=> bm!12072 (= call!12073 call!12074)))

(declare-fun b!112485 () Bool)

(assert (=> b!112485 (= e!73101 call!12074)))

(declare-fun b!112486 () Bool)

(declare-fun c!20111 () Bool)

(assert (=> b!112486 (= c!20111 (and ((_ is Cons!1625) (toList!794 lt!57569)) (bvsgt (_1!1213 (h!2225 (toList!794 lt!57569))) (_1!1213 lt!57571))))))

(assert (=> b!112486 (= e!73101 e!73100)))

(declare-fun b!112487 () Bool)

(assert (=> b!112487 (= e!73102 (ite c!20109 (t!5778 (toList!794 lt!57569)) (ite c!20111 (Cons!1625 (h!2225 (toList!794 lt!57569)) (t!5778 (toList!794 lt!57569))) Nil!1626)))))

(assert (= (and d!31999 c!20112) b!112483))

(assert (= (and d!31999 (not c!20112)) b!112484))

(assert (= (and b!112484 c!20109) b!112485))

(assert (= (and b!112484 (not c!20109)) b!112486))

(assert (= (and b!112486 c!20111) b!112482))

(assert (= (and b!112486 (not c!20111)) b!112478))

(assert (= (or b!112482 b!112478) bm!12072))

(assert (= (or b!112485 bm!12072) bm!12070))

(assert (= (or b!112483 bm!12070) bm!12071))

(assert (= (and bm!12071 c!20110) b!112479))

(assert (= (and bm!12071 (not c!20110)) b!112487))

(assert (= (and d!31999 res!55488) b!112480))

(assert (= (and b!112480 res!55487) b!112481))

(declare-fun m!128361 () Bool)

(assert (=> b!112480 m!128361))

(declare-fun m!128363 () Bool)

(assert (=> bm!12071 m!128363))

(declare-fun m!128365 () Bool)

(assert (=> b!112479 m!128365))

(declare-fun m!128367 () Bool)

(assert (=> b!112481 m!128367))

(declare-fun m!128369 () Bool)

(assert (=> d!31999 m!128369))

(assert (=> d!31999 m!127653))

(assert (=> d!31801 d!31999))

(declare-fun d!32001 () Bool)

(assert (=> d!32001 (isDefined!111 (getValueByKey!157 (toList!794 lt!57567) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun lt!58217 () Unit!3468)

(declare-fun choose!716 (List!1629 (_ BitVec 64)) Unit!3468)

(assert (=> d!32001 (= lt!58217 (choose!716 (toList!794 lt!57567) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun e!73105 () Bool)

(assert (=> d!32001 e!73105))

(declare-fun res!55491 () Bool)

(assert (=> d!32001 (=> (not res!55491) (not e!73105))))

(assert (=> d!32001 (= res!55491 (isStrictlySorted!307 (toList!794 lt!57567)))))

(assert (=> d!32001 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 lt!57567) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) lt!58217)))

(declare-fun b!112490 () Bool)

(assert (=> b!112490 (= e!73105 (containsKey!161 (toList!794 lt!57567) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (= (and d!32001 res!55491) b!112490))

(assert (=> d!32001 m!127199))

(assert (=> d!32001 m!127547))

(assert (=> d!32001 m!127547))

(assert (=> d!32001 m!127549))

(assert (=> d!32001 m!127199))

(declare-fun m!128371 () Bool)

(assert (=> d!32001 m!128371))

(declare-fun m!128373 () Bool)

(assert (=> d!32001 m!128373))

(assert (=> b!112490 m!127199))

(assert (=> b!112490 m!127543))

(assert (=> b!111938 d!32001))

(assert (=> b!111938 d!31965))

(assert (=> b!111938 d!31967))

(declare-fun d!32003 () Bool)

(declare-fun e!73106 () Bool)

(assert (=> d!32003 e!73106))

(declare-fun res!55493 () Bool)

(assert (=> d!32003 (=> (not res!55493) (not e!73106))))

(declare-fun lt!58218 () ListLongMap!1557)

(assert (=> d!32003 (= res!55493 (contains!831 lt!58218 (_1!1213 (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(declare-fun lt!58221 () List!1629)

(assert (=> d!32003 (= lt!58218 (ListLongMap!1558 lt!58221))))

(declare-fun lt!58220 () Unit!3468)

(declare-fun lt!58219 () Unit!3468)

(assert (=> d!32003 (= lt!58220 lt!58219)))

(assert (=> d!32003 (= (getValueByKey!157 lt!58221 (_1!1213 (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))) (Some!162 (_2!1213 (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!32003 (= lt!58219 (lemmaContainsTupThenGetReturnValue!76 lt!58221 (_1!1213 (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992))))) (_2!1213 (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!32003 (= lt!58221 (insertStrictlySorted!79 (toList!794 call!11931) (_1!1213 (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992))))) (_2!1213 (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))))))

(assert (=> d!32003 (= (+!140 call!11931 (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992))))) lt!58218)))

(declare-fun b!112491 () Bool)

(declare-fun res!55492 () Bool)

(assert (=> b!112491 (=> (not res!55492) (not e!73106))))

(assert (=> b!112491 (= res!55492 (= (getValueByKey!157 (toList!794 lt!58218) (_1!1213 (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992)))))) (Some!162 (_2!1213 (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992))))))))))

(declare-fun b!112492 () Bool)

(assert (=> b!112492 (= e!73106 (contains!833 (toList!794 lt!58218) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2936 (underlying!366 thiss!992))))))))

(assert (= (and d!32003 res!55493) b!112491))

(assert (= (and b!112491 res!55492) b!112492))

(declare-fun m!128375 () Bool)

(assert (=> d!32003 m!128375))

(declare-fun m!128377 () Bool)

(assert (=> d!32003 m!128377))

(declare-fun m!128379 () Bool)

(assert (=> d!32003 m!128379))

(declare-fun m!128381 () Bool)

(assert (=> d!32003 m!128381))

(declare-fun m!128383 () Bool)

(assert (=> b!112491 m!128383))

(declare-fun m!128385 () Bool)

(assert (=> b!112492 m!128385))

(assert (=> b!111856 d!32003))

(declare-fun d!32005 () Bool)

(declare-fun e!73107 () Bool)

(assert (=> d!32005 e!73107))

(declare-fun res!55494 () Bool)

(assert (=> d!32005 (=> res!55494 e!73107)))

(declare-fun lt!58222 () Bool)

(assert (=> d!32005 (= res!55494 (not lt!58222))))

(declare-fun lt!58223 () Bool)

(assert (=> d!32005 (= lt!58222 lt!58223)))

(declare-fun lt!58224 () Unit!3468)

(declare-fun e!73108 () Unit!3468)

(assert (=> d!32005 (= lt!58224 e!73108)))

(declare-fun c!20113 () Bool)

(assert (=> d!32005 (= c!20113 lt!58223)))

(assert (=> d!32005 (= lt!58223 (containsKey!161 (toList!794 lt!57772) (_1!1213 lt!57568)))))

(assert (=> d!32005 (= (contains!831 lt!57772 (_1!1213 lt!57568)) lt!58222)))

(declare-fun b!112493 () Bool)

(declare-fun lt!58225 () Unit!3468)

(assert (=> b!112493 (= e!73108 lt!58225)))

(assert (=> b!112493 (= lt!58225 (lemmaContainsKeyImpliesGetValueByKeyDefined!110 (toList!794 lt!57772) (_1!1213 lt!57568)))))

(assert (=> b!112493 (isDefined!111 (getValueByKey!157 (toList!794 lt!57772) (_1!1213 lt!57568)))))

(declare-fun b!112494 () Bool)

(declare-fun Unit!3501 () Unit!3468)

(assert (=> b!112494 (= e!73108 Unit!3501)))

(declare-fun b!112495 () Bool)

(assert (=> b!112495 (= e!73107 (isDefined!111 (getValueByKey!157 (toList!794 lt!57772) (_1!1213 lt!57568))))))

(assert (= (and d!32005 c!20113) b!112493))

(assert (= (and d!32005 (not c!20113)) b!112494))

(assert (= (and d!32005 (not res!55494)) b!112495))

(declare-fun m!128387 () Bool)

(assert (=> d!32005 m!128387))

(declare-fun m!128389 () Bool)

(assert (=> b!112493 m!128389))

(assert (=> b!112493 m!127517))

(assert (=> b!112493 m!127517))

(declare-fun m!128391 () Bool)

(assert (=> b!112493 m!128391))

(assert (=> b!112495 m!127517))

(assert (=> b!112495 m!127517))

(assert (=> b!112495 m!128391))

(assert (=> d!31799 d!32005))

(declare-fun d!32007 () Bool)

(declare-fun c!20114 () Bool)

(assert (=> d!32007 (= c!20114 (and ((_ is Cons!1625) lt!57775) (= (_1!1213 (h!2225 lt!57775)) (_1!1213 lt!57568))))))

(declare-fun e!73109 () Option!163)

(assert (=> d!32007 (= (getValueByKey!157 lt!57775 (_1!1213 lt!57568)) e!73109)))

(declare-fun b!112498 () Bool)

(declare-fun e!73110 () Option!163)

(assert (=> b!112498 (= e!73110 (getValueByKey!157 (t!5778 lt!57775) (_1!1213 lt!57568)))))

(declare-fun b!112496 () Bool)

(assert (=> b!112496 (= e!73109 (Some!162 (_2!1213 (h!2225 lt!57775))))))

(declare-fun b!112497 () Bool)

(assert (=> b!112497 (= e!73109 e!73110)))

(declare-fun c!20115 () Bool)

(assert (=> b!112497 (= c!20115 (and ((_ is Cons!1625) lt!57775) (not (= (_1!1213 (h!2225 lt!57775)) (_1!1213 lt!57568)))))))

(declare-fun b!112499 () Bool)

(assert (=> b!112499 (= e!73110 None!161)))

(assert (= (and d!32007 c!20114) b!112496))

(assert (= (and d!32007 (not c!20114)) b!112497))

(assert (= (and b!112497 c!20115) b!112498))

(assert (= (and b!112497 (not c!20115)) b!112499))

(declare-fun m!128393 () Bool)

(assert (=> b!112498 m!128393))

(assert (=> d!31799 d!32007))

(declare-fun d!32009 () Bool)

(assert (=> d!32009 (= (getValueByKey!157 lt!57775 (_1!1213 lt!57568)) (Some!162 (_2!1213 lt!57568)))))

(declare-fun lt!58226 () Unit!3468)

(assert (=> d!32009 (= lt!58226 (choose!706 lt!57775 (_1!1213 lt!57568) (_2!1213 lt!57568)))))

(declare-fun e!73111 () Bool)

(assert (=> d!32009 e!73111))

(declare-fun res!55495 () Bool)

(assert (=> d!32009 (=> (not res!55495) (not e!73111))))

(assert (=> d!32009 (= res!55495 (isStrictlySorted!307 lt!57775))))

(assert (=> d!32009 (= (lemmaContainsTupThenGetReturnValue!76 lt!57775 (_1!1213 lt!57568) (_2!1213 lt!57568)) lt!58226)))

(declare-fun b!112500 () Bool)

(declare-fun res!55496 () Bool)

(assert (=> b!112500 (=> (not res!55496) (not e!73111))))

(assert (=> b!112500 (= res!55496 (containsKey!161 lt!57775 (_1!1213 lt!57568)))))

(declare-fun b!112501 () Bool)

(assert (=> b!112501 (= e!73111 (contains!833 lt!57775 (tuple2!2405 (_1!1213 lt!57568) (_2!1213 lt!57568))))))

(assert (= (and d!32009 res!55495) b!112500))

(assert (= (and b!112500 res!55496) b!112501))

(assert (=> d!32009 m!127511))

(declare-fun m!128395 () Bool)

(assert (=> d!32009 m!128395))

(declare-fun m!128397 () Bool)

(assert (=> d!32009 m!128397))

(declare-fun m!128399 () Bool)

(assert (=> b!112500 m!128399))

(declare-fun m!128401 () Bool)

(assert (=> b!112501 m!128401))

(assert (=> d!31799 d!32009))

(declare-fun b!112502 () Bool)

(declare-fun e!73114 () List!1629)

(declare-fun call!12076 () List!1629)

(assert (=> b!112502 (= e!73114 call!12076)))

(declare-fun bm!12073 () Bool)

(declare-fun call!12077 () List!1629)

(declare-fun call!12078 () List!1629)

(assert (=> bm!12073 (= call!12077 call!12078)))

(declare-fun b!112503 () Bool)

(declare-fun e!73116 () List!1629)

(assert (=> b!112503 (= e!73116 (insertStrictlySorted!79 (t!5778 (toList!794 (+!140 lt!57569 lt!57571))) (_1!1213 lt!57568) (_2!1213 lt!57568)))))

(declare-fun b!112504 () Bool)

(declare-fun res!55497 () Bool)

(declare-fun e!73112 () Bool)

(assert (=> b!112504 (=> (not res!55497) (not e!73112))))

(declare-fun lt!58227 () List!1629)

(assert (=> b!112504 (= res!55497 (containsKey!161 lt!58227 (_1!1213 lt!57568)))))

(declare-fun b!112505 () Bool)

(assert (=> b!112505 (= e!73112 (contains!833 lt!58227 (tuple2!2405 (_1!1213 lt!57568) (_2!1213 lt!57568))))))

(declare-fun b!112506 () Bool)

(assert (=> b!112506 (= e!73114 call!12076)))

(declare-fun b!112507 () Bool)

(declare-fun e!73113 () List!1629)

(assert (=> b!112507 (= e!73113 call!12078)))

(declare-fun d!32011 () Bool)

(assert (=> d!32011 e!73112))

(declare-fun res!55498 () Bool)

(assert (=> d!32011 (=> (not res!55498) (not e!73112))))

(assert (=> d!32011 (= res!55498 (isStrictlySorted!307 lt!58227))))

(assert (=> d!32011 (= lt!58227 e!73113)))

(declare-fun c!20119 () Bool)

(assert (=> d!32011 (= c!20119 (and ((_ is Cons!1625) (toList!794 (+!140 lt!57569 lt!57571))) (bvslt (_1!1213 (h!2225 (toList!794 (+!140 lt!57569 lt!57571)))) (_1!1213 lt!57568))))))

(assert (=> d!32011 (isStrictlySorted!307 (toList!794 (+!140 lt!57569 lt!57571)))))

(assert (=> d!32011 (= (insertStrictlySorted!79 (toList!794 (+!140 lt!57569 lt!57571)) (_1!1213 lt!57568) (_2!1213 lt!57568)) lt!58227)))

(declare-fun bm!12074 () Bool)

(assert (=> bm!12074 (= call!12078 ($colon$colon!83 e!73116 (ite c!20119 (h!2225 (toList!794 (+!140 lt!57569 lt!57571))) (tuple2!2405 (_1!1213 lt!57568) (_2!1213 lt!57568)))))))

(declare-fun c!20117 () Bool)

(assert (=> bm!12074 (= c!20117 c!20119)))

(declare-fun b!112508 () Bool)

(declare-fun e!73115 () List!1629)

(assert (=> b!112508 (= e!73113 e!73115)))

(declare-fun c!20116 () Bool)

(assert (=> b!112508 (= c!20116 (and ((_ is Cons!1625) (toList!794 (+!140 lt!57569 lt!57571))) (= (_1!1213 (h!2225 (toList!794 (+!140 lt!57569 lt!57571)))) (_1!1213 lt!57568))))))

(declare-fun bm!12075 () Bool)

(assert (=> bm!12075 (= call!12076 call!12077)))

(declare-fun b!112509 () Bool)

(assert (=> b!112509 (= e!73115 call!12077)))

(declare-fun b!112510 () Bool)

(declare-fun c!20118 () Bool)

(assert (=> b!112510 (= c!20118 (and ((_ is Cons!1625) (toList!794 (+!140 lt!57569 lt!57571))) (bvsgt (_1!1213 (h!2225 (toList!794 (+!140 lt!57569 lt!57571)))) (_1!1213 lt!57568))))))

(assert (=> b!112510 (= e!73115 e!73114)))

(declare-fun b!112511 () Bool)

(assert (=> b!112511 (= e!73116 (ite c!20116 (t!5778 (toList!794 (+!140 lt!57569 lt!57571))) (ite c!20118 (Cons!1625 (h!2225 (toList!794 (+!140 lt!57569 lt!57571))) (t!5778 (toList!794 (+!140 lt!57569 lt!57571)))) Nil!1626)))))

(assert (= (and d!32011 c!20119) b!112507))

(assert (= (and d!32011 (not c!20119)) b!112508))

(assert (= (and b!112508 c!20116) b!112509))

(assert (= (and b!112508 (not c!20116)) b!112510))

(assert (= (and b!112510 c!20118) b!112506))

(assert (= (and b!112510 (not c!20118)) b!112502))

(assert (= (or b!112506 b!112502) bm!12075))

(assert (= (or b!112509 bm!12075) bm!12073))

(assert (= (or b!112507 bm!12073) bm!12074))

(assert (= (and bm!12074 c!20117) b!112503))

(assert (= (and bm!12074 (not c!20117)) b!112511))

(assert (= (and d!32011 res!55498) b!112504))

(assert (= (and b!112504 res!55497) b!112505))

(declare-fun m!128403 () Bool)

(assert (=> b!112504 m!128403))

(declare-fun m!128405 () Bool)

(assert (=> bm!12074 m!128405))

(declare-fun m!128407 () Bool)

(assert (=> b!112503 m!128407))

(declare-fun m!128409 () Bool)

(assert (=> b!112505 m!128409))

(declare-fun m!128411 () Bool)

(assert (=> d!32011 m!128411))

(declare-fun m!128413 () Bool)

(assert (=> d!32011 m!128413))

(assert (=> d!31799 d!32011))

(declare-fun call!12082 () ListLongMap!1557)

(declare-fun call!12080 () ListLongMap!1557)

(declare-fun c!20120 () Bool)

(declare-fun call!12083 () ListLongMap!1557)

(declare-fun c!20125 () Bool)

(declare-fun bm!12076 () Bool)

(declare-fun call!12085 () ListLongMap!1557)

(assert (=> bm!12076 (= call!12080 (+!140 (ite c!20125 call!12085 (ite c!20120 call!12082 call!12083)) (ite (or c!20125 c!20120) (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!20002 c!19996) lt!57575 (zeroValue!2516 newMap!16))) (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 newMap!16)))))))

(declare-fun b!112512 () Bool)

(declare-fun e!73121 () Bool)

(assert (=> b!112512 (= e!73121 (validKeyInArray!0 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112513 () Bool)

(declare-fun e!73124 () Bool)

(declare-fun lt!58248 () ListLongMap!1557)

(assert (=> b!112513 (= e!73124 (= (apply!101 lt!58248 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)) (get!1353 (select (arr!2075 (_values!2630 newMap!16)) #b00000000000000000000000000000000) (dynLambda!388 (defaultEntry!2647 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112513 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2334 (_values!2630 newMap!16))))))

(assert (=> b!112513 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(declare-fun bm!12077 () Bool)

(assert (=> bm!12077 (= call!12083 call!12082)))

(declare-fun b!112514 () Bool)

(declare-fun e!73118 () ListLongMap!1557)

(declare-fun e!73120 () ListLongMap!1557)

(assert (=> b!112514 (= e!73118 e!73120)))

(assert (=> b!112514 (= c!20120 (and (not (= (bvand (ite (and c!20002 c!19996) lt!57860 (extraKeys!2440 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!20002 c!19996) lt!57860 (extraKeys!2440 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12078 () Bool)

(declare-fun call!12079 () Bool)

(assert (=> bm!12078 (= call!12079 (contains!831 lt!58248 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112515 () Bool)

(declare-fun e!73127 () Bool)

(declare-fun e!73125 () Bool)

(assert (=> b!112515 (= e!73127 e!73125)))

(declare-fun res!55500 () Bool)

(declare-fun call!12084 () Bool)

(assert (=> b!112515 (= res!55500 call!12084)))

(assert (=> b!112515 (=> (not res!55500) (not e!73125))))

(declare-fun b!112516 () Bool)

(declare-fun e!73123 () Bool)

(declare-fun e!73128 () Bool)

(assert (=> b!112516 (= e!73123 e!73128)))

(declare-fun res!55501 () Bool)

(assert (=> b!112516 (= res!55501 call!12079)))

(assert (=> b!112516 (=> (not res!55501) (not e!73128))))

(declare-fun b!112517 () Bool)

(assert (=> b!112517 (= e!73128 (= (apply!101 lt!58248 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2516 newMap!16)))))

(declare-fun c!20121 () Bool)

(declare-fun b!112518 () Bool)

(assert (=> b!112518 (= c!20121 (and (not (= (bvand (ite (and c!20002 c!19996) lt!57860 (extraKeys!2440 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!20002 c!19996) lt!57860 (extraKeys!2440 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!73122 () ListLongMap!1557)

(assert (=> b!112518 (= e!73120 e!73122)))

(declare-fun b!112519 () Bool)

(declare-fun e!73126 () Bool)

(assert (=> b!112519 (= e!73126 e!73123)))

(declare-fun c!20124 () Bool)

(assert (=> b!112519 (= c!20124 (not (= (bvand (ite (and c!20002 c!19996) lt!57860 (extraKeys!2440 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12079 () Bool)

(assert (=> bm!12079 (= call!12084 (contains!831 lt!58248 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12080 () Bool)

(declare-fun call!12081 () ListLongMap!1557)

(assert (=> bm!12080 (= call!12081 call!12080)))

(declare-fun b!112520 () Bool)

(declare-fun e!73119 () Bool)

(assert (=> b!112520 (= e!73119 e!73124)))

(declare-fun res!55505 () Bool)

(assert (=> b!112520 (=> (not res!55505) (not e!73124))))

(assert (=> b!112520 (= res!55505 (contains!831 lt!58248 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!112520 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(declare-fun b!112521 () Bool)

(assert (=> b!112521 (= e!73122 call!12083)))

(declare-fun b!112522 () Bool)

(declare-fun e!73117 () Bool)

(assert (=> b!112522 (= e!73117 (validKeyInArray!0 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112523 () Bool)

(assert (=> b!112523 (= e!73123 (not call!12079))))

(declare-fun b!112524 () Bool)

(assert (=> b!112524 (= e!73127 (not call!12084))))

(declare-fun b!112525 () Bool)

(declare-fun res!55502 () Bool)

(assert (=> b!112525 (=> (not res!55502) (not e!73126))))

(assert (=> b!112525 (= res!55502 e!73127)))

(declare-fun c!20123 () Bool)

(assert (=> b!112525 (= c!20123 (not (= (bvand (ite (and c!20002 c!19996) lt!57860 (extraKeys!2440 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!112526 () Bool)

(declare-fun e!73129 () Unit!3468)

(declare-fun lt!58246 () Unit!3468)

(assert (=> b!112526 (= e!73129 lt!58246)))

(declare-fun lt!58240 () ListLongMap!1557)

(assert (=> b!112526 (= lt!58240 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (ite (and c!20002 c!19996) lt!57860 (extraKeys!2440 newMap!16)) (ite (and c!20002 c!19996) lt!57575 (zeroValue!2516 newMap!16)) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58241 () (_ BitVec 64))

(assert (=> b!112526 (= lt!58241 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58229 () (_ BitVec 64))

(assert (=> b!112526 (= lt!58229 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58244 () Unit!3468)

(assert (=> b!112526 (= lt!58244 (addStillContains!77 lt!58240 lt!58241 (ite (and c!20002 c!19996) lt!57575 (zeroValue!2516 newMap!16)) lt!58229))))

(assert (=> b!112526 (contains!831 (+!140 lt!58240 (tuple2!2405 lt!58241 (ite (and c!20002 c!19996) lt!57575 (zeroValue!2516 newMap!16)))) lt!58229)))

(declare-fun lt!58230 () Unit!3468)

(assert (=> b!112526 (= lt!58230 lt!58244)))

(declare-fun lt!58242 () ListLongMap!1557)

(assert (=> b!112526 (= lt!58242 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (ite (and c!20002 c!19996) lt!57860 (extraKeys!2440 newMap!16)) (ite (and c!20002 c!19996) lt!57575 (zeroValue!2516 newMap!16)) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58232 () (_ BitVec 64))

(assert (=> b!112526 (= lt!58232 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58239 () (_ BitVec 64))

(assert (=> b!112526 (= lt!58239 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58236 () Unit!3468)

(assert (=> b!112526 (= lt!58236 (addApplyDifferent!77 lt!58242 lt!58232 (minValue!2516 newMap!16) lt!58239))))

(assert (=> b!112526 (= (apply!101 (+!140 lt!58242 (tuple2!2405 lt!58232 (minValue!2516 newMap!16))) lt!58239) (apply!101 lt!58242 lt!58239))))

(declare-fun lt!58233 () Unit!3468)

(assert (=> b!112526 (= lt!58233 lt!58236)))

(declare-fun lt!58228 () ListLongMap!1557)

(assert (=> b!112526 (= lt!58228 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (ite (and c!20002 c!19996) lt!57860 (extraKeys!2440 newMap!16)) (ite (and c!20002 c!19996) lt!57575 (zeroValue!2516 newMap!16)) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58237 () (_ BitVec 64))

(assert (=> b!112526 (= lt!58237 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58238 () (_ BitVec 64))

(assert (=> b!112526 (= lt!58238 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58243 () Unit!3468)

(assert (=> b!112526 (= lt!58243 (addApplyDifferent!77 lt!58228 lt!58237 (ite (and c!20002 c!19996) lt!57575 (zeroValue!2516 newMap!16)) lt!58238))))

(assert (=> b!112526 (= (apply!101 (+!140 lt!58228 (tuple2!2405 lt!58237 (ite (and c!20002 c!19996) lt!57575 (zeroValue!2516 newMap!16)))) lt!58238) (apply!101 lt!58228 lt!58238))))

(declare-fun lt!58245 () Unit!3468)

(assert (=> b!112526 (= lt!58245 lt!58243)))

(declare-fun lt!58234 () ListLongMap!1557)

(assert (=> b!112526 (= lt!58234 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (ite (and c!20002 c!19996) lt!57860 (extraKeys!2440 newMap!16)) (ite (and c!20002 c!19996) lt!57575 (zeroValue!2516 newMap!16)) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58247 () (_ BitVec 64))

(assert (=> b!112526 (= lt!58247 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58231 () (_ BitVec 64))

(assert (=> b!112526 (= lt!58231 (select (arr!2074 (_keys!4364 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112526 (= lt!58246 (addApplyDifferent!77 lt!58234 lt!58247 (minValue!2516 newMap!16) lt!58231))))

(assert (=> b!112526 (= (apply!101 (+!140 lt!58234 (tuple2!2405 lt!58247 (minValue!2516 newMap!16))) lt!58231) (apply!101 lt!58234 lt!58231))))

(declare-fun b!112527 () Bool)

(assert (=> b!112527 (= e!73120 call!12081)))

(declare-fun d!32013 () Bool)

(assert (=> d!32013 e!73126))

(declare-fun res!55503 () Bool)

(assert (=> d!32013 (=> (not res!55503) (not e!73126))))

(assert (=> d!32013 (= res!55503 (or (bvsge #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))))

(declare-fun lt!58235 () ListLongMap!1557)

(assert (=> d!32013 (= lt!58248 lt!58235)))

(declare-fun lt!58249 () Unit!3468)

(assert (=> d!32013 (= lt!58249 e!73129)))

(declare-fun c!20122 () Bool)

(assert (=> d!32013 (= c!20122 e!73121)))

(declare-fun res!55504 () Bool)

(assert (=> d!32013 (=> (not res!55504) (not e!73121))))

(assert (=> d!32013 (= res!55504 (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(assert (=> d!32013 (= lt!58235 e!73118)))

(assert (=> d!32013 (= c!20125 (and (not (= (bvand (ite (and c!20002 c!19996) lt!57860 (extraKeys!2440 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!20002 c!19996) lt!57860 (extraKeys!2440 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32013 (validMask!0 (mask!6824 newMap!16))))

(assert (=> d!32013 (= (getCurrentListMap!470 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (ite (and c!20002 c!19996) lt!57860 (extraKeys!2440 newMap!16)) (ite (and c!20002 c!19996) lt!57575 (zeroValue!2516 newMap!16)) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) lt!58248)))

(declare-fun b!112528 () Bool)

(declare-fun Unit!3502 () Unit!3468)

(assert (=> b!112528 (= e!73129 Unit!3502)))

(declare-fun bm!12081 () Bool)

(assert (=> bm!12081 (= call!12085 (getCurrentListMapNoExtraKeys!105 (_keys!4364 newMap!16) (_values!2630 newMap!16) (mask!6824 newMap!16) (ite (and c!20002 c!19996) lt!57860 (extraKeys!2440 newMap!16)) (ite (and c!20002 c!19996) lt!57575 (zeroValue!2516 newMap!16)) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun b!112529 () Bool)

(assert (=> b!112529 (= e!73122 call!12081)))

(declare-fun b!112530 () Bool)

(assert (=> b!112530 (= e!73125 (= (apply!101 lt!58248 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!20002 c!19996) lt!57575 (zeroValue!2516 newMap!16))))))

(declare-fun bm!12082 () Bool)

(assert (=> bm!12082 (= call!12082 call!12085)))

(declare-fun b!112531 () Bool)

(declare-fun res!55507 () Bool)

(assert (=> b!112531 (=> (not res!55507) (not e!73126))))

(assert (=> b!112531 (= res!55507 e!73119)))

(declare-fun res!55499 () Bool)

(assert (=> b!112531 (=> res!55499 e!73119)))

(assert (=> b!112531 (= res!55499 (not e!73117))))

(declare-fun res!55506 () Bool)

(assert (=> b!112531 (=> (not res!55506) (not e!73117))))

(assert (=> b!112531 (= res!55506 (bvslt #b00000000000000000000000000000000 (size!2333 (_keys!4364 newMap!16))))))

(declare-fun b!112532 () Bool)

(assert (=> b!112532 (= e!73118 (+!140 call!12080 (tuple2!2405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 newMap!16))))))

(assert (= (and d!32013 c!20125) b!112532))

(assert (= (and d!32013 (not c!20125)) b!112514))

(assert (= (and b!112514 c!20120) b!112527))

(assert (= (and b!112514 (not c!20120)) b!112518))

(assert (= (and b!112518 c!20121) b!112529))

(assert (= (and b!112518 (not c!20121)) b!112521))

(assert (= (or b!112529 b!112521) bm!12077))

(assert (= (or b!112527 bm!12077) bm!12082))

(assert (= (or b!112527 b!112529) bm!12080))

(assert (= (or b!112532 bm!12082) bm!12081))

(assert (= (or b!112532 bm!12080) bm!12076))

(assert (= (and d!32013 res!55504) b!112512))

(assert (= (and d!32013 c!20122) b!112526))

(assert (= (and d!32013 (not c!20122)) b!112528))

(assert (= (and d!32013 res!55503) b!112531))

(assert (= (and b!112531 res!55506) b!112522))

(assert (= (and b!112531 (not res!55499)) b!112520))

(assert (= (and b!112520 res!55505) b!112513))

(assert (= (and b!112531 res!55507) b!112525))

(assert (= (and b!112525 c!20123) b!112515))

(assert (= (and b!112525 (not c!20123)) b!112524))

(assert (= (and b!112515 res!55500) b!112530))

(assert (= (or b!112515 b!112524) bm!12079))

(assert (= (and b!112525 res!55502) b!112519))

(assert (= (and b!112519 c!20124) b!112516))

(assert (= (and b!112519 (not c!20124)) b!112523))

(assert (= (and b!112516 res!55501) b!112517))

(assert (= (or b!112516 b!112523) bm!12078))

(declare-fun b_lambda!5025 () Bool)

(assert (=> (not b_lambda!5025) (not b!112513)))

(assert (=> b!112513 t!5790))

(declare-fun b_and!6897 () Bool)

(assert (= b_and!6893 (and (=> t!5790 result!3561) b_and!6897)))

(assert (=> b!112513 t!5792))

(declare-fun b_and!6899 () Bool)

(assert (= b_and!6895 (and (=> t!5792 result!3563) b_and!6899)))

(assert (=> d!32013 m!127611))

(declare-fun m!128415 () Bool)

(assert (=> b!112526 m!128415))

(declare-fun m!128417 () Bool)

(assert (=> b!112526 m!128417))

(declare-fun m!128419 () Bool)

(assert (=> b!112526 m!128419))

(declare-fun m!128421 () Bool)

(assert (=> b!112526 m!128421))

(declare-fun m!128423 () Bool)

(assert (=> b!112526 m!128423))

(declare-fun m!128425 () Bool)

(assert (=> b!112526 m!128425))

(declare-fun m!128427 () Bool)

(assert (=> b!112526 m!128427))

(assert (=> b!112526 m!128427))

(declare-fun m!128429 () Bool)

(assert (=> b!112526 m!128429))

(assert (=> b!112526 m!128415))

(declare-fun m!128431 () Bool)

(assert (=> b!112526 m!128431))

(declare-fun m!128433 () Bool)

(assert (=> b!112526 m!128433))

(declare-fun m!128435 () Bool)

(assert (=> b!112526 m!128435))

(declare-fun m!128437 () Bool)

(assert (=> b!112526 m!128437))

(declare-fun m!128439 () Bool)

(assert (=> b!112526 m!128439))

(declare-fun m!128441 () Bool)

(assert (=> b!112526 m!128441))

(declare-fun m!128443 () Bool)

(assert (=> b!112526 m!128443))

(assert (=> b!112526 m!127671))

(assert (=> b!112526 m!128437))

(assert (=> b!112526 m!128441))

(declare-fun m!128445 () Bool)

(assert (=> b!112526 m!128445))

(declare-fun m!128447 () Bool)

(assert (=> b!112517 m!128447))

(assert (=> b!112512 m!127671))

(assert (=> b!112512 m!127671))

(assert (=> b!112512 m!127673))

(declare-fun m!128449 () Bool)

(assert (=> bm!12078 m!128449))

(declare-fun m!128451 () Bool)

(assert (=> bm!12076 m!128451))

(declare-fun m!128453 () Bool)

(assert (=> b!112530 m!128453))

(assert (=> b!112520 m!127671))

(assert (=> b!112520 m!127671))

(declare-fun m!128455 () Bool)

(assert (=> b!112520 m!128455))

(declare-fun m!128457 () Bool)

(assert (=> bm!12079 m!128457))

(assert (=> bm!12081 m!128435))

(assert (=> b!112522 m!127671))

(assert (=> b!112522 m!127671))

(assert (=> b!112522 m!127673))

(assert (=> b!112513 m!128255))

(assert (=> b!112513 m!127897))

(assert (=> b!112513 m!128255))

(assert (=> b!112513 m!127897))

(assert (=> b!112513 m!128257))

(assert (=> b!112513 m!127671))

(assert (=> b!112513 m!127671))

(declare-fun m!128459 () Bool)

(assert (=> b!112513 m!128459))

(declare-fun m!128461 () Bool)

(assert (=> b!112532 m!128461))

(assert (=> bm!12005 d!32013))

(declare-fun b!112533 () Bool)

(declare-fun e!73136 () Bool)

(declare-fun e!73131 () Bool)

(assert (=> b!112533 (= e!73136 e!73131)))

(assert (=> b!112533 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(declare-fun lt!58255 () ListLongMap!1557)

(declare-fun res!55511 () Bool)

(assert (=> b!112533 (= res!55511 (contains!831 lt!58255 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!112533 (=> (not res!55511) (not e!73131))))

(declare-fun b!112534 () Bool)

(declare-fun e!73135 () Bool)

(assert (=> b!112534 (= e!73135 (validKeyInArray!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!112534 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!112535 () Bool)

(declare-fun e!73130 () ListLongMap!1557)

(declare-fun e!73132 () ListLongMap!1557)

(assert (=> b!112535 (= e!73130 e!73132)))

(declare-fun c!20129 () Bool)

(assert (=> b!112535 (= c!20129 (validKeyInArray!0 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!112536 () Bool)

(declare-fun call!12086 () ListLongMap!1557)

(assert (=> b!112536 (= e!73132 call!12086)))

(declare-fun b!112537 () Bool)

(assert (=> b!112537 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(assert (=> b!112537 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2334 (_values!2630 (v!2936 (underlying!366 thiss!992))))))))

(assert (=> b!112537 (= e!73131 (= (apply!101 lt!58255 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!112538 () Bool)

(declare-fun e!73134 () Bool)

(assert (=> b!112538 (= e!73134 (isEmpty!383 lt!58255))))

(declare-fun b!112539 () Bool)

(assert (=> b!112539 (= e!73134 (= lt!58255 (getCurrentListMapNoExtraKeys!105 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))))))))

(declare-fun d!32015 () Bool)

(declare-fun e!73133 () Bool)

(assert (=> d!32015 e!73133))

(declare-fun res!55508 () Bool)

(assert (=> d!32015 (=> (not res!55508) (not e!73133))))

(assert (=> d!32015 (= res!55508 (not (contains!831 lt!58255 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32015 (= lt!58255 e!73130)))

(declare-fun c!20126 () Bool)

(assert (=> d!32015 (= c!20126 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(assert (=> d!32015 (validMask!0 (mask!6824 (v!2936 (underlying!366 thiss!992))))))

(assert (=> d!32015 (= (getCurrentListMapNoExtraKeys!105 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))) lt!58255)))

(declare-fun b!112540 () Bool)

(assert (=> b!112540 (= e!73130 (ListLongMap!1558 Nil!1626))))

(declare-fun b!112541 () Bool)

(assert (=> b!112541 (= e!73133 e!73136)))

(declare-fun c!20128 () Bool)

(assert (=> b!112541 (= c!20128 e!73135)))

(declare-fun res!55510 () Bool)

(assert (=> b!112541 (=> (not res!55510) (not e!73135))))

(assert (=> b!112541 (= res!55510 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(declare-fun b!112542 () Bool)

(declare-fun lt!58256 () Unit!3468)

(declare-fun lt!58254 () Unit!3468)

(assert (=> b!112542 (= lt!58256 lt!58254)))

(declare-fun lt!58250 () V!3249)

(declare-fun lt!58252 () (_ BitVec 64))

(declare-fun lt!58251 () (_ BitVec 64))

(declare-fun lt!58253 () ListLongMap!1557)

(assert (=> b!112542 (not (contains!831 (+!140 lt!58253 (tuple2!2405 lt!58251 lt!58250)) lt!58252))))

(assert (=> b!112542 (= lt!58254 (addStillNotContains!50 lt!58253 lt!58251 lt!58250 lt!58252))))

(assert (=> b!112542 (= lt!58252 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!112542 (= lt!58250 (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112542 (= lt!58251 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!112542 (= lt!58253 call!12086)))

(assert (=> b!112542 (= e!73132 (+!140 call!12086 (tuple2!2405 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1353 (select (arr!2075 (_values!2630 (v!2936 (underlying!366 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!388 (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!112543 () Bool)

(declare-fun res!55509 () Bool)

(assert (=> b!112543 (=> (not res!55509) (not e!73133))))

(assert (=> b!112543 (= res!55509 (not (contains!831 lt!58255 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!112544 () Bool)

(assert (=> b!112544 (= e!73136 e!73134)))

(declare-fun c!20127 () Bool)

(assert (=> b!112544 (= c!20127 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2333 (_keys!4364 (v!2936 (underlying!366 thiss!992))))))))

(declare-fun bm!12083 () Bool)

(assert (=> bm!12083 (= call!12086 (getCurrentListMapNoExtraKeys!105 (_keys!4364 (v!2936 (underlying!366 thiss!992))) (_values!2630 (v!2936 (underlying!366 thiss!992))) (mask!6824 (v!2936 (underlying!366 thiss!992))) (extraKeys!2440 (v!2936 (underlying!366 thiss!992))) (zeroValue!2516 (v!2936 (underlying!366 thiss!992))) (minValue!2516 (v!2936 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992)))))))

(assert (= (and d!32015 c!20126) b!112540))

(assert (= (and d!32015 (not c!20126)) b!112535))

(assert (= (and b!112535 c!20129) b!112542))

(assert (= (and b!112535 (not c!20129)) b!112536))

(assert (= (or b!112542 b!112536) bm!12083))

(assert (= (and d!32015 res!55508) b!112543))

(assert (= (and b!112543 res!55509) b!112541))

(assert (= (and b!112541 res!55510) b!112534))

(assert (= (and b!112541 c!20128) b!112533))

(assert (= (and b!112541 (not c!20128)) b!112544))

(assert (= (and b!112533 res!55511) b!112537))

(assert (= (and b!112544 c!20127) b!112539))

(assert (= (and b!112544 (not c!20127)) b!112538))

(declare-fun b_lambda!5027 () Bool)

(assert (=> (not b_lambda!5027) (not b!112537)))

(assert (=> b!112537 t!5775))

(declare-fun b_and!6901 () Bool)

(assert (= b_and!6897 (and (=> t!5775 result!3541) b_and!6901)))

(assert (=> b!112537 t!5777))

(declare-fun b_and!6903 () Bool)

(assert (= b_and!6899 (and (=> t!5777 result!3545) b_and!6903)))

(declare-fun b_lambda!5029 () Bool)

(assert (=> (not b_lambda!5029) (not b!112542)))

(assert (=> b!112542 t!5775))

(declare-fun b_and!6905 () Bool)

(assert (= b_and!6901 (and (=> t!5775 result!3541) b_and!6905)))

(assert (=> b!112542 t!5777))

(declare-fun b_and!6907 () Bool)

(assert (= b_and!6903 (and (=> t!5777 result!3545) b_and!6907)))

(declare-fun m!128463 () Bool)

(assert (=> b!112539 m!128463))

(assert (=> bm!12083 m!128463))

(declare-fun m!128465 () Bool)

(assert (=> d!32015 m!128465))

(assert (=> d!32015 m!127211))

(assert (=> b!112535 m!127751))

(assert (=> b!112535 m!127751))

(declare-fun m!128467 () Bool)

(assert (=> b!112535 m!128467))

(declare-fun m!128469 () Bool)

(assert (=> b!112538 m!128469))

(declare-fun m!128471 () Bool)

(assert (=> b!112543 m!128471))

(assert (=> b!112542 m!127203))

(declare-fun m!128473 () Bool)

(assert (=> b!112542 m!128473))

(declare-fun m!128475 () Bool)

(assert (=> b!112542 m!128475))

(assert (=> b!112542 m!127203))

(declare-fun m!128477 () Bool)

(assert (=> b!112542 m!128477))

(declare-fun m!128479 () Bool)

(assert (=> b!112542 m!128479))

(assert (=> b!112542 m!128475))

(assert (=> b!112542 m!127751))

(declare-fun m!128481 () Bool)

(assert (=> b!112542 m!128481))

(declare-fun m!128483 () Bool)

(assert (=> b!112542 m!128483))

(assert (=> b!112542 m!128481))

(assert (=> b!112533 m!127751))

(assert (=> b!112533 m!127751))

(declare-fun m!128485 () Bool)

(assert (=> b!112533 m!128485))

(assert (=> b!112534 m!127751))

(assert (=> b!112534 m!127751))

(assert (=> b!112534 m!128467))

(assert (=> b!112537 m!127203))

(assert (=> b!112537 m!128475))

(assert (=> b!112537 m!127203))

(assert (=> b!112537 m!128477))

(assert (=> b!112537 m!128475))

(assert (=> b!112537 m!127751))

(assert (=> b!112537 m!127751))

(declare-fun m!128487 () Bool)

(assert (=> b!112537 m!128487))

(assert (=> b!111920 d!32015))

(declare-fun d!32017 () Bool)

(declare-fun c!20130 () Bool)

(assert (=> d!32017 (= c!20130 (and ((_ is Cons!1625) (toList!794 lt!57743)) (= (_1!1213 (h!2225 (toList!794 lt!57743))) (_1!1213 lt!57568))))))

(declare-fun e!73137 () Option!163)

(assert (=> d!32017 (= (getValueByKey!157 (toList!794 lt!57743) (_1!1213 lt!57568)) e!73137)))

(declare-fun b!112547 () Bool)

(declare-fun e!73138 () Option!163)

(assert (=> b!112547 (= e!73138 (getValueByKey!157 (t!5778 (toList!794 lt!57743)) (_1!1213 lt!57568)))))

(declare-fun b!112545 () Bool)

(assert (=> b!112545 (= e!73137 (Some!162 (_2!1213 (h!2225 (toList!794 lt!57743)))))))

(declare-fun b!112546 () Bool)

(assert (=> b!112546 (= e!73137 e!73138)))

(declare-fun c!20131 () Bool)

(assert (=> b!112546 (= c!20131 (and ((_ is Cons!1625) (toList!794 lt!57743)) (not (= (_1!1213 (h!2225 (toList!794 lt!57743))) (_1!1213 lt!57568)))))))

(declare-fun b!112548 () Bool)

(assert (=> b!112548 (= e!73138 None!161)))

(assert (= (and d!32017 c!20130) b!112545))

(assert (= (and d!32017 (not c!20130)) b!112546))

(assert (= (and b!112546 c!20131) b!112547))

(assert (= (and b!112546 (not c!20131)) b!112548))

(declare-fun m!128489 () Bool)

(assert (=> b!112547 m!128489))

(assert (=> b!111888 d!32017))

(declare-fun d!32019 () Bool)

(declare-fun c!20132 () Bool)

(assert (=> d!32019 (= c!20132 (and ((_ is Cons!1625) (toList!794 lt!57776)) (= (_1!1213 (h!2225 (toList!794 lt!57776))) (_1!1213 lt!57571))))))

(declare-fun e!73139 () Option!163)

(assert (=> d!32019 (= (getValueByKey!157 (toList!794 lt!57776) (_1!1213 lt!57571)) e!73139)))

(declare-fun b!112551 () Bool)

(declare-fun e!73140 () Option!163)

(assert (=> b!112551 (= e!73140 (getValueByKey!157 (t!5778 (toList!794 lt!57776)) (_1!1213 lt!57571)))))

(declare-fun b!112549 () Bool)

(assert (=> b!112549 (= e!73139 (Some!162 (_2!1213 (h!2225 (toList!794 lt!57776)))))))

(declare-fun b!112550 () Bool)

(assert (=> b!112550 (= e!73139 e!73140)))

(declare-fun c!20133 () Bool)

(assert (=> b!112550 (= c!20133 (and ((_ is Cons!1625) (toList!794 lt!57776)) (not (= (_1!1213 (h!2225 (toList!794 lt!57776))) (_1!1213 lt!57571)))))))

(declare-fun b!112552 () Bool)

(assert (=> b!112552 (= e!73140 None!161)))

(assert (= (and d!32019 c!20132) b!112549))

(assert (= (and d!32019 (not c!20132)) b!112550))

(assert (= (and b!112550 c!20133) b!112551))

(assert (= (and b!112550 (not c!20133)) b!112552))

(declare-fun m!128491 () Bool)

(assert (=> b!112551 m!128491))

(assert (=> b!111930 d!32019))

(declare-fun d!32021 () Bool)

(declare-fun c!20134 () Bool)

(assert (=> d!32021 (= c!20134 (and ((_ is Cons!1625) (toList!794 lt!57772)) (= (_1!1213 (h!2225 (toList!794 lt!57772))) (_1!1213 lt!57568))))))

(declare-fun e!73141 () Option!163)

(assert (=> d!32021 (= (getValueByKey!157 (toList!794 lt!57772) (_1!1213 lt!57568)) e!73141)))

(declare-fun b!112555 () Bool)

(declare-fun e!73142 () Option!163)

(assert (=> b!112555 (= e!73142 (getValueByKey!157 (t!5778 (toList!794 lt!57772)) (_1!1213 lt!57568)))))

(declare-fun b!112553 () Bool)

(assert (=> b!112553 (= e!73141 (Some!162 (_2!1213 (h!2225 (toList!794 lt!57772)))))))

(declare-fun b!112554 () Bool)

(assert (=> b!112554 (= e!73141 e!73142)))

(declare-fun c!20135 () Bool)

(assert (=> b!112554 (= c!20135 (and ((_ is Cons!1625) (toList!794 lt!57772)) (not (= (_1!1213 (h!2225 (toList!794 lt!57772))) (_1!1213 lt!57568)))))))

(declare-fun b!112556 () Bool)

(assert (=> b!112556 (= e!73142 None!161)))

(assert (= (and d!32021 c!20134) b!112553))

(assert (= (and d!32021 (not c!20134)) b!112554))

(assert (= (and b!112554 c!20135) b!112555))

(assert (= (and b!112554 (not c!20135)) b!112556))

(declare-fun m!128493 () Bool)

(assert (=> b!112555 m!128493))

(assert (=> b!111928 d!32021))

(declare-fun d!32023 () Bool)

(declare-fun lt!58259 () Bool)

(declare-fun content!116 (List!1630) (InoxSet (_ BitVec 64)))

(assert (=> d!32023 (= lt!58259 (select (content!116 Nil!1627) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun e!73147 () Bool)

(assert (=> d!32023 (= lt!58259 e!73147)))

(declare-fun res!55517 () Bool)

(assert (=> d!32023 (=> (not res!55517) (not e!73147))))

(assert (=> d!32023 (= res!55517 ((_ is Cons!1626) Nil!1627))))

(assert (=> d!32023 (= (contains!832 Nil!1627 (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)) lt!58259)))

(declare-fun b!112561 () Bool)

(declare-fun e!73148 () Bool)

(assert (=> b!112561 (= e!73147 e!73148)))

(declare-fun res!55516 () Bool)

(assert (=> b!112561 (=> res!55516 e!73148)))

(assert (=> b!112561 (= res!55516 (= (h!2226 Nil!1627) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(declare-fun b!112562 () Bool)

(assert (=> b!112562 (= e!73148 (contains!832 (t!5779 Nil!1627) (select (arr!2074 (_keys!4364 (v!2936 (underlying!366 thiss!992)))) from!355)))))

(assert (= (and d!32023 res!55517) b!112561))

(assert (= (and b!112561 (not res!55516)) b!112562))

(declare-fun m!128495 () Bool)

(assert (=> d!32023 m!128495))

(assert (=> d!32023 m!127199))

(declare-fun m!128497 () Bool)

(assert (=> d!32023 m!128497))

(assert (=> b!112562 m!127199))

(declare-fun m!128499 () Bool)

(assert (=> b!112562 m!128499))

(assert (=> b!111791 d!32023))

(assert (=> bm!11939 d!32015))

(declare-fun d!32025 () Bool)

(declare-fun c!20136 () Bool)

(assert (=> d!32025 (= c!20136 (and ((_ is Cons!1625) (toList!794 lt!57768)) (= (_1!1213 (h!2225 (toList!794 lt!57768))) (_1!1213 lt!57571))))))

(declare-fun e!73149 () Option!163)

(assert (=> d!32025 (= (getValueByKey!157 (toList!794 lt!57768) (_1!1213 lt!57571)) e!73149)))

(declare-fun b!112565 () Bool)

(declare-fun e!73150 () Option!163)

(assert (=> b!112565 (= e!73150 (getValueByKey!157 (t!5778 (toList!794 lt!57768)) (_1!1213 lt!57571)))))

(declare-fun b!112563 () Bool)

(assert (=> b!112563 (= e!73149 (Some!162 (_2!1213 (h!2225 (toList!794 lt!57768)))))))

(declare-fun b!112564 () Bool)

(assert (=> b!112564 (= e!73149 e!73150)))

(declare-fun c!20137 () Bool)

(assert (=> b!112564 (= c!20137 (and ((_ is Cons!1625) (toList!794 lt!57768)) (not (= (_1!1213 (h!2225 (toList!794 lt!57768))) (_1!1213 lt!57571)))))))

(declare-fun b!112566 () Bool)

(assert (=> b!112566 (= e!73150 None!161)))

(assert (= (and d!32025 c!20136) b!112563))

(assert (= (and d!32025 (not c!20136)) b!112564))

(assert (= (and b!112564 c!20137) b!112565))

(assert (= (and b!112564 (not c!20137)) b!112566))

(declare-fun m!128501 () Bool)

(assert (=> b!112565 m!128501))

(assert (=> b!111926 d!32025))

(declare-fun condMapEmpty!4037 () Bool)

(declare-fun mapDefault!4037 () ValueCell!1007)

(assert (=> mapNonEmpty!4035 (= condMapEmpty!4037 (= mapRest!4035 ((as const (Array (_ BitVec 32) ValueCell!1007)) mapDefault!4037)))))

(declare-fun e!73152 () Bool)

(declare-fun mapRes!4037 () Bool)

(assert (=> mapNonEmpty!4035 (= tp!10083 (and e!73152 mapRes!4037))))

(declare-fun b!112568 () Bool)

(assert (=> b!112568 (= e!73152 tp_is_empty!2701)))

(declare-fun mapIsEmpty!4037 () Bool)

(assert (=> mapIsEmpty!4037 mapRes!4037))

(declare-fun mapNonEmpty!4037 () Bool)

(declare-fun tp!10085 () Bool)

(declare-fun e!73151 () Bool)

(assert (=> mapNonEmpty!4037 (= mapRes!4037 (and tp!10085 e!73151))))

(declare-fun mapKey!4037 () (_ BitVec 32))

(declare-fun mapRest!4037 () (Array (_ BitVec 32) ValueCell!1007))

(declare-fun mapValue!4037 () ValueCell!1007)

(assert (=> mapNonEmpty!4037 (= mapRest!4035 (store mapRest!4037 mapKey!4037 mapValue!4037))))

(declare-fun b!112567 () Bool)

(assert (=> b!112567 (= e!73151 tp_is_empty!2701)))

(assert (= (and mapNonEmpty!4035 condMapEmpty!4037) mapIsEmpty!4037))

(assert (= (and mapNonEmpty!4035 (not condMapEmpty!4037)) mapNonEmpty!4037))

(assert (= (and mapNonEmpty!4037 ((_ is ValueCellFull!1007) mapValue!4037)) b!112567))

(assert (= (and mapNonEmpty!4035 ((_ is ValueCellFull!1007) mapDefault!4037)) b!112568))

(declare-fun m!128503 () Bool)

(assert (=> mapNonEmpty!4037 m!128503))

(declare-fun condMapEmpty!4038 () Bool)

(declare-fun mapDefault!4038 () ValueCell!1007)

(assert (=> mapNonEmpty!4036 (= condMapEmpty!4038 (= mapRest!4036 ((as const (Array (_ BitVec 32) ValueCell!1007)) mapDefault!4038)))))

(declare-fun e!73154 () Bool)

(declare-fun mapRes!4038 () Bool)

(assert (=> mapNonEmpty!4036 (= tp!10084 (and e!73154 mapRes!4038))))

(declare-fun b!112570 () Bool)

(assert (=> b!112570 (= e!73154 tp_is_empty!2701)))

(declare-fun mapIsEmpty!4038 () Bool)

(assert (=> mapIsEmpty!4038 mapRes!4038))

(declare-fun mapNonEmpty!4038 () Bool)

(declare-fun tp!10086 () Bool)

(declare-fun e!73153 () Bool)

(assert (=> mapNonEmpty!4038 (= mapRes!4038 (and tp!10086 e!73153))))

(declare-fun mapKey!4038 () (_ BitVec 32))

(declare-fun mapRest!4038 () (Array (_ BitVec 32) ValueCell!1007))

(declare-fun mapValue!4038 () ValueCell!1007)

(assert (=> mapNonEmpty!4038 (= mapRest!4036 (store mapRest!4038 mapKey!4038 mapValue!4038))))

(declare-fun b!112569 () Bool)

(assert (=> b!112569 (= e!73153 tp_is_empty!2701)))

(assert (= (and mapNonEmpty!4036 condMapEmpty!4038) mapIsEmpty!4038))

(assert (= (and mapNonEmpty!4036 (not condMapEmpty!4038)) mapNonEmpty!4038))

(assert (= (and mapNonEmpty!4038 ((_ is ValueCellFull!1007) mapValue!4038)) b!112569))

(assert (= (and mapNonEmpty!4036 ((_ is ValueCellFull!1007) mapDefault!4038)) b!112570))

(declare-fun m!128505 () Bool)

(assert (=> mapNonEmpty!4038 m!128505))

(declare-fun b_lambda!5031 () Bool)

(assert (= b_lambda!5025 (or (and b!111620 b_free!2569 (= (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) (defaultEntry!2647 newMap!16))) (and b!111616 b_free!2571) b_lambda!5031)))

(declare-fun b_lambda!5033 () Bool)

(assert (= b_lambda!5023 (or (and b!111620 b_free!2569 (= (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) (defaultEntry!2647 newMap!16))) (and b!111616 b_free!2571) b_lambda!5033)))

(declare-fun b_lambda!5035 () Bool)

(assert (= b_lambda!5019 (or (and b!111620 b_free!2569 (= (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) (defaultEntry!2647 newMap!16))) (and b!111616 b_free!2571) b_lambda!5035)))

(declare-fun b_lambda!5037 () Bool)

(assert (= b_lambda!5029 (or (and b!111620 b_free!2569) (and b!111616 b_free!2571 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))))) b_lambda!5037)))

(declare-fun b_lambda!5039 () Bool)

(assert (= b_lambda!5027 (or (and b!111620 b_free!2569) (and b!111616 b_free!2571 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))))) b_lambda!5039)))

(declare-fun b_lambda!5041 () Bool)

(assert (= b_lambda!5021 (or (and b!111620 b_free!2569 (= (defaultEntry!2647 (v!2936 (underlying!366 thiss!992))) (defaultEntry!2647 newMap!16))) (and b!111616 b_free!2571) b_lambda!5041)))

(check-sat (not b!112458) (not b!112360) (not b!112270) (not b!112443) (not d!32023) (not bm!12053) (not b!112329) (not b!112140) (not b!112503) (not d!31893) (not b!112403) (not b!112172) (not d!31925) (not b!112132) (not b!112189) (not bm!12043) (not b!112408) (not d!31987) b_and!6907 (not bm!12056) (not b!112385) (not b!112089) (not b!112466) (not b!112517) (not b!112252) (not b!112411) (not b!112331) (not b!112543) (not d!31999) (not b!112404) (not bm!12081) (not b!112361) (not d!31889) (not d!31831) (not b!112406) (not b!112380) (not mapNonEmpty!4038) (not b!112325) (not d!31923) (not d!31857) (not b!112413) (not b!112463) (not b!112493) (not b!112279) (not d!32009) (not d!31881) (not b!112538) (not b!112185) (not b_lambda!5033) (not b!112375) (not b!112542) (not b!112170) (not d!31971) (not b!112495) (not b!112269) (not b!112505) (not b!112323) (not b_lambda!5031) (not b_lambda!5017) (not d!31973) (not b!112194) (not b!112276) (not b!112201) (not b!112498) (not b!112365) (not d!31965) (not bm!12044) (not b_lambda!5013) (not b!112327) (not b!112295) (not b!112433) (not d!32001) (not b!112476) (not b!112520) (not bm!12025) (not b!112192) (not bm!12078) (not d!32013) (not d!31985) (not d!31955) (not b!112196) (not b!112358) (not b!112330) (not b!112332) (not d!31983) (not b!112193) (not bm!12040) (not b!112335) (not b!112512) (not b!112316) (not d!31897) (not b!112446) (not d!31877) (not d!31981) (not bm!12030) (not b!112383) (not d!31905) (not bm!12065) (not d!31927) (not d!31913) (not b_lambda!5041) (not d!31941) (not b!112533) (not d!31993) (not d!31957) (not b!112190) (not d!31875) (not b!112372) (not b_lambda!5039) (not d!32015) (not b!112210) (not b!112255) (not b_next!2569) (not b_lambda!5015) (not b!112286) (not b!112526) (not b!112462) (not b!112423) (not d!31823) (not d!31835) (not b!112454) (not bm!12076) (not d!31949) (not d!32005) (not b_lambda!5035) (not b!112293) (not d!31939) (not b!112386) (not d!31945) (not d!31817) (not b!112513) (not b!112109) (not d!31847) (not b!112430) (not d!31813) (not bm!12079) (not b!112102) (not b!112303) (not d!31873) (not b_lambda!5005) (not b!112460) (not b!112290) (not b!112451) (not mapNonEmpty!4037) (not b!112141) tp_is_empty!2701 (not b!112481) (not b!112337) b_and!6905 (not b!112256) (not d!31839) (not d!31921) (not bm!12074) (not d!31951) (not b!112474) (not b!112535) (not d!31979) (not b_next!2571) (not d!31879) (not b!112465) (not d!31907) (not d!31991) (not b!112565) (not d!31989) (not b!112191) (not b!112305) (not bm!12083) (not b!112267) (not d!31851) (not bm!12068) (not b!112467) (not d!31959) (not b!112468) (not bm!12051) (not b!112282) (not b!112281) (not b!112334) (not d!31863) (not d!31961) (not b!112480) (not b!112345) (not d!31915) (not b!112504) (not b!112532) (not d!31883) (not d!31849) (not b!112490) (not b!112174) (not b!112551) (not bm!12071) (not d!31977) (not b!112439) (not b!112412) (not d!31819) (not b!112339) (not b!112274) (not b!112471) (not b!112387) (not b!112469) (not b!112419) (not bm!12066) (not d!31855) (not b!112285) (not d!32011) (not b!112534) (not b!112539) (not d!31969) (not b!112251) (not b!112202) (not b!112133) (not b!112299) (not bm!12058) (not b!112368) (not b!112277) (not d!31853) (not d!31917) (not b!112108) (not b!112169) (not b!112562) (not b!112448) (not b!112208) (not b!112091) (not d!32003) (not b!112131) (not b!112350) (not bm!12027) (not d!31935) (not d!31903) (not b!112530) (not b!112341) (not b!112362) (not b!112340) (not b!112142) (not b!112425) (not d!31975) (not b!112377) (not b!112492) (not d!31821) (not bm!12063) (not b!112249) (not d!31887) (not b!112284) (not b!112435) (not b!112271) (not d!31911) (not b!112416) (not b!112310) (not b!112461) (not b!112414) (not b!112455) (not b!112491) (not b!112445) (not bm!12060) (not b!112479) (not b!112501) (not b!112426) (not b!112086) (not bm!12047) (not bm!12046) (not d!31933) (not b!112348) (not b!112547) (not b!112382) (not d!31901) (not b!112366) (not b!112464) (not d!31845) (not b!112477) (not b!112336) (not d!31953) (not bm!12062) (not bm!12019) (not b!112354) (not d!31899) (not d!31947) (not bm!12042) (not b!112409) (not d!31909) (not bm!12041) (not d!31895) (not bm!12054) (not b!112555) (not d!31811) (not b_lambda!5037) (not bm!12026) (not d!31997) (not b!112420) (not b!112500) (not b!112248) (not b!112537) (not b!112457) (not b!112326) (not d!31931) (not b!112168) (not d!31859) (not d!31891) (not b!112407) (not b!112522) (not b!112187) (not bm!12049))
(check-sat b_and!6905 b_and!6907 (not b_next!2569) (not b_next!2571))
