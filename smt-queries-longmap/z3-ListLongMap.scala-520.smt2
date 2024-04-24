; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13080 () Bool)

(assert start!13080)

(declare-fun b!114232 () Bool)

(declare-fun b_free!2629 () Bool)

(declare-fun b_next!2629 () Bool)

(assert (=> b!114232 (= b_free!2629 (not b_next!2629))))

(declare-fun tp!10246 () Bool)

(declare-fun b_and!7045 () Bool)

(assert (=> b!114232 (= tp!10246 b_and!7045)))

(declare-fun b!114219 () Bool)

(declare-fun b_free!2631 () Bool)

(declare-fun b_next!2631 () Bool)

(assert (=> b!114219 (= b_free!2631 (not b_next!2631))))

(declare-fun tp!10248 () Bool)

(declare-fun b_and!7047 () Bool)

(assert (=> b!114219 (= tp!10248 b_and!7047)))

(declare-fun tp_is_empty!2731 () Bool)

(declare-datatypes ((V!3289 0))(
  ( (V!3290 (val!1410 Int)) )
))
(declare-datatypes ((array!4449 0))(
  ( (array!4450 (arr!2108 (Array (_ BitVec 32) (_ BitVec 64))) (size!2368 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1022 0))(
  ( (ValueCellFull!1022 (v!2989 V!3289)) (EmptyCell!1022) )
))
(declare-datatypes ((array!4451 0))(
  ( (array!4452 (arr!2109 (Array (_ BitVec 32) ValueCell!1022)) (size!2369 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!952 0))(
  ( (LongMapFixedSize!953 (defaultEntry!2682 Int) (mask!6878 (_ BitVec 32)) (extraKeys!2471 (_ BitVec 32)) (zeroValue!2549 V!3289) (minValue!2549 V!3289) (_size!525 (_ BitVec 32)) (_keys!4404 array!4449) (_values!2665 array!4451) (_vacant!525 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!952)

(declare-fun e!74319 () Bool)

(declare-fun e!74334 () Bool)

(declare-fun array_inv!1311 (array!4449) Bool)

(declare-fun array_inv!1312 (array!4451) Bool)

(assert (=> b!114219 (= e!74319 (and tp!10248 tp_is_empty!2731 (array_inv!1311 (_keys!4404 newMap!16)) (array_inv!1312 (_values!2665 newMap!16)) e!74334))))

(declare-fun b!114220 () Bool)

(declare-fun e!74323 () Bool)

(declare-fun e!74328 () Bool)

(assert (=> b!114220 (= e!74323 e!74328)))

(declare-fun b!114221 () Bool)

(declare-fun e!74331 () Bool)

(declare-fun mapRes!4122 () Bool)

(assert (=> b!114221 (= e!74334 (and e!74331 mapRes!4122))))

(declare-fun condMapEmpty!4122 () Bool)

(declare-fun mapDefault!4122 () ValueCell!1022)

(assert (=> b!114221 (= condMapEmpty!4122 (= (arr!2109 (_values!2665 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1022)) mapDefault!4122)))))

(declare-fun b!114222 () Bool)

(declare-datatypes ((Unit!3552 0))(
  ( (Unit!3553) )
))
(declare-fun e!74327 () Unit!3552)

(declare-fun Unit!3554 () Unit!3552)

(assert (=> b!114222 (= e!74327 Unit!3554)))

(declare-fun lt!59432 () Unit!3552)

(declare-datatypes ((Cell!754 0))(
  ( (Cell!755 (v!2990 LongMapFixedSize!952)) )
))
(declare-datatypes ((LongMap!754 0))(
  ( (LongMap!755 (underlying!388 Cell!754)) )
))
(declare-fun thiss!992 () LongMap!754)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!114 (array!4449 array!4451 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 64) (_ BitVec 32) Int) Unit!3552)

(assert (=> b!114222 (= lt!59432 (lemmaListMapContainsThenArrayContainsFrom!114 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (_values!2665 (v!2990 (underlying!388 thiss!992))) (mask!6878 (v!2990 (underlying!388 thiss!992))) (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) (minValue!2549 (v!2990 (underlying!388 thiss!992))) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114222 (arrayContainsKey!0 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59438 () Unit!3552)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4449 (_ BitVec 32) (_ BitVec 32)) Unit!3552)

(assert (=> b!114222 (= lt!59438 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4404 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1634 0))(
  ( (Nil!1631) (Cons!1630 (h!2230 (_ BitVec 64)) (t!5852 List!1634)) )
))
(declare-fun arrayNoDuplicates!0 (array!4449 (_ BitVec 32) List!1634) Bool)

(assert (=> b!114222 (arrayNoDuplicates!0 (_keys!4404 (v!2990 (underlying!388 thiss!992))) from!355 Nil!1631)))

(declare-fun lt!59429 () Unit!3552)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4449 (_ BitVec 32) (_ BitVec 64) List!1634) Unit!3552)

(assert (=> b!114222 (= lt!59429 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (Cons!1630 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) Nil!1631)))))

(assert (=> b!114222 false))

(declare-fun b!114223 () Bool)

(declare-fun res!56233 () Bool)

(declare-fun e!74322 () Bool)

(assert (=> b!114223 (=> (not res!56233) (not e!74322))))

(assert (=> b!114223 (= res!56233 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992)))))))))

(declare-fun mapNonEmpty!4121 () Bool)

(declare-fun tp!10245 () Bool)

(declare-fun e!74325 () Bool)

(assert (=> mapNonEmpty!4121 (= mapRes!4122 (and tp!10245 e!74325))))

(declare-fun mapRest!4121 () (Array (_ BitVec 32) ValueCell!1022))

(declare-fun mapKey!4121 () (_ BitVec 32))

(declare-fun mapValue!4122 () ValueCell!1022)

(assert (=> mapNonEmpty!4121 (= (arr!2109 (_values!2665 newMap!16)) (store mapRest!4121 mapKey!4121 mapValue!4122))))

(declare-fun b!114224 () Bool)

(declare-fun res!56229 () Bool)

(assert (=> b!114224 (=> (not res!56229) (not e!74322))))

(declare-fun valid!452 (LongMapFixedSize!952) Bool)

(assert (=> b!114224 (= res!56229 (valid!452 newMap!16))))

(declare-fun mapIsEmpty!4121 () Bool)

(declare-fun mapRes!4121 () Bool)

(assert (=> mapIsEmpty!4121 mapRes!4121))

(declare-fun b!114225 () Bool)

(assert (=> b!114225 (= e!74325 tp_is_empty!2731)))

(declare-fun b!114226 () Bool)

(declare-fun e!74332 () Bool)

(assert (=> b!114226 (= e!74332 tp_is_empty!2731)))

(declare-fun res!56230 () Bool)

(assert (=> start!13080 (=> (not res!56230) (not e!74322))))

(declare-fun valid!453 (LongMap!754) Bool)

(assert (=> start!13080 (= res!56230 (valid!453 thiss!992))))

(assert (=> start!13080 e!74322))

(declare-fun e!74330 () Bool)

(assert (=> start!13080 e!74330))

(assert (=> start!13080 true))

(assert (=> start!13080 e!74319))

(declare-fun b!114227 () Bool)

(assert (=> b!114227 (= e!74331 tp_is_empty!2731)))

(declare-fun mapNonEmpty!4122 () Bool)

(declare-fun tp!10247 () Bool)

(declare-fun e!74318 () Bool)

(assert (=> mapNonEmpty!4122 (= mapRes!4121 (and tp!10247 e!74318))))

(declare-fun mapRest!4122 () (Array (_ BitVec 32) ValueCell!1022))

(declare-fun mapKey!4122 () (_ BitVec 32))

(declare-fun mapValue!4121 () ValueCell!1022)

(assert (=> mapNonEmpty!4122 (= (arr!2109 (_values!2665 (v!2990 (underlying!388 thiss!992)))) (store mapRest!4122 mapKey!4122 mapValue!4121))))

(declare-fun b!114228 () Bool)

(declare-fun e!74321 () Bool)

(declare-fun e!74324 () Bool)

(assert (=> b!114228 (= e!74321 e!74324)))

(declare-fun res!56228 () Bool)

(assert (=> b!114228 (=> (not res!56228) (not e!74324))))

(declare-datatypes ((tuple2!2440 0))(
  ( (tuple2!2441 (_1!1231 Bool) (_2!1231 LongMapFixedSize!952)) )
))
(declare-fun lt!59435 () tuple2!2440)

(assert (=> b!114228 (= res!56228 (and (_1!1231 lt!59435) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!59437 () Unit!3552)

(assert (=> b!114228 (= lt!59437 e!74327)))

(declare-datatypes ((tuple2!2442 0))(
  ( (tuple2!2443 (_1!1232 (_ BitVec 64)) (_2!1232 V!3289)) )
))
(declare-datatypes ((List!1635 0))(
  ( (Nil!1632) (Cons!1631 (h!2231 tuple2!2442) (t!5853 List!1635)) )
))
(declare-datatypes ((ListLongMap!1577 0))(
  ( (ListLongMap!1578 (toList!804 List!1635)) )
))
(declare-fun lt!59428 () ListLongMap!1577)

(declare-fun c!20397 () Bool)

(declare-fun contains!841 (ListLongMap!1577 (_ BitVec 64)) Bool)

(assert (=> b!114228 (= c!20397 (contains!841 lt!59428 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun lt!59427 () V!3289)

(declare-fun update!176 (LongMapFixedSize!952 (_ BitVec 64) V!3289) tuple2!2440)

(assert (=> b!114228 (= lt!59435 (update!176 newMap!16 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427))))

(declare-fun b!114229 () Bool)

(assert (=> b!114229 (= e!74318 tp_is_empty!2731)))

(declare-fun b!114230 () Bool)

(declare-fun e!74329 () Bool)

(assert (=> b!114230 (= e!74322 e!74329)))

(declare-fun res!56234 () Bool)

(assert (=> b!114230 (=> (not res!56234) (not e!74329))))

(declare-fun lt!59431 () ListLongMap!1577)

(assert (=> b!114230 (= res!56234 (= lt!59431 lt!59428))))

(declare-fun map!1318 (LongMapFixedSize!952) ListLongMap!1577)

(assert (=> b!114230 (= lt!59428 (map!1318 newMap!16))))

(declare-fun getCurrentListMap!486 (array!4449 array!4451 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 32) Int) ListLongMap!1577)

(assert (=> b!114230 (= lt!59431 (getCurrentListMap!486 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (_values!2665 (v!2990 (underlying!388 thiss!992))) (mask!6878 (v!2990 (underlying!388 thiss!992))) (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) (minValue!2549 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun b!114231 () Bool)

(assert (=> b!114231 (= e!74330 e!74323)))

(declare-fun e!74333 () Bool)

(assert (=> b!114232 (= e!74328 (and tp!10246 tp_is_empty!2731 (array_inv!1311 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (array_inv!1312 (_values!2665 (v!2990 (underlying!388 thiss!992)))) e!74333))))

(declare-fun b!114233 () Bool)

(declare-fun e!74326 () Bool)

(assert (=> b!114233 (= e!74326 (valid!452 (v!2990 (underlying!388 thiss!992))))))

(declare-fun mapIsEmpty!4122 () Bool)

(assert (=> mapIsEmpty!4122 mapRes!4122))

(declare-fun b!114234 () Bool)

(assert (=> b!114234 (= e!74333 (and e!74332 mapRes!4121))))

(declare-fun condMapEmpty!4121 () Bool)

(declare-fun mapDefault!4121 () ValueCell!1022)

(assert (=> b!114234 (= condMapEmpty!4121 (= (arr!2109 (_values!2665 (v!2990 (underlying!388 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1022)) mapDefault!4121)))))

(declare-fun b!114235 () Bool)

(assert (=> b!114235 (= e!74324 (not e!74326))))

(declare-fun res!56232 () Bool)

(assert (=> b!114235 (=> res!56232 e!74326)))

(assert (=> b!114235 (= res!56232 (not (valid!452 (_2!1231 lt!59435))))))

(declare-fun lt!59421 () ListLongMap!1577)

(declare-fun lt!59430 () tuple2!2442)

(declare-fun lt!59423 () tuple2!2442)

(declare-fun lt!59434 () ListLongMap!1577)

(declare-fun +!156 (ListLongMap!1577 tuple2!2442) ListLongMap!1577)

(assert (=> b!114235 (= (+!156 lt!59434 lt!59423) (+!156 (+!156 lt!59421 lt!59423) lt!59430))))

(assert (=> b!114235 (= lt!59423 (tuple2!2443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun lt!59433 () Unit!3552)

(declare-fun addCommutativeForDiffKeys!69 (ListLongMap!1577 (_ BitVec 64) V!3289 (_ BitVec 64) V!3289) Unit!3552)

(assert (=> b!114235 (= lt!59433 (addCommutativeForDiffKeys!69 lt!59421 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun lt!59425 () ListLongMap!1577)

(assert (=> b!114235 (= lt!59425 lt!59434)))

(assert (=> b!114235 (= lt!59434 (+!156 lt!59421 lt!59430))))

(declare-fun lt!59422 () ListLongMap!1577)

(declare-fun lt!59436 () tuple2!2442)

(assert (=> b!114235 (= lt!59425 (+!156 lt!59422 lt!59436))))

(declare-fun lt!59424 () ListLongMap!1577)

(assert (=> b!114235 (= lt!59421 (+!156 lt!59424 lt!59436))))

(assert (=> b!114235 (= lt!59436 (tuple2!2443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2549 (v!2990 (underlying!388 thiss!992)))))))

(assert (=> b!114235 (= lt!59422 (+!156 lt!59424 lt!59430))))

(assert (=> b!114235 (= lt!59430 (tuple2!2443 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427))))

(declare-fun lt!59426 () Unit!3552)

(assert (=> b!114235 (= lt!59426 (addCommutativeForDiffKeys!69 lt!59424 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2549 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!123 (array!4449 array!4451 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 32) Int) ListLongMap!1577)

(assert (=> b!114235 (= lt!59424 (getCurrentListMapNoExtraKeys!123 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (_values!2665 (v!2990 (underlying!388 thiss!992))) (mask!6878 (v!2990 (underlying!388 thiss!992))) (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) (minValue!2549 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun b!114236 () Bool)

(declare-fun res!56231 () Bool)

(assert (=> b!114236 (=> (not res!56231) (not e!74322))))

(assert (=> b!114236 (= res!56231 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6878 newMap!16)) (_size!525 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun b!114237 () Bool)

(assert (=> b!114237 (= e!74329 e!74321)))

(declare-fun res!56227 () Bool)

(assert (=> b!114237 (=> (not res!56227) (not e!74321))))

(assert (=> b!114237 (= res!56227 (and (not (= (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1386 (ValueCell!1022 V!3289) V!3289)

(declare-fun dynLambda!402 (Int (_ BitVec 64)) V!3289)

(assert (=> b!114237 (= lt!59427 (get!1386 (select (arr!2109 (_values!2665 (v!2990 (underlying!388 thiss!992)))) from!355) (dynLambda!402 (defaultEntry!2682 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114238 () Bool)

(declare-fun Unit!3555 () Unit!3552)

(assert (=> b!114238 (= e!74327 Unit!3555)))

(assert (= (and start!13080 res!56230) b!114223))

(assert (= (and b!114223 res!56233) b!114224))

(assert (= (and b!114224 res!56229) b!114236))

(assert (= (and b!114236 res!56231) b!114230))

(assert (= (and b!114230 res!56234) b!114237))

(assert (= (and b!114237 res!56227) b!114228))

(assert (= (and b!114228 c!20397) b!114222))

(assert (= (and b!114228 (not c!20397)) b!114238))

(assert (= (and b!114228 res!56228) b!114235))

(assert (= (and b!114235 (not res!56232)) b!114233))

(assert (= (and b!114234 condMapEmpty!4121) mapIsEmpty!4121))

(assert (= (and b!114234 (not condMapEmpty!4121)) mapNonEmpty!4122))

(get-info :version)

(assert (= (and mapNonEmpty!4122 ((_ is ValueCellFull!1022) mapValue!4121)) b!114229))

(assert (= (and b!114234 ((_ is ValueCellFull!1022) mapDefault!4121)) b!114226))

(assert (= b!114232 b!114234))

(assert (= b!114220 b!114232))

(assert (= b!114231 b!114220))

(assert (= start!13080 b!114231))

(assert (= (and b!114221 condMapEmpty!4122) mapIsEmpty!4122))

(assert (= (and b!114221 (not condMapEmpty!4122)) mapNonEmpty!4121))

(assert (= (and mapNonEmpty!4121 ((_ is ValueCellFull!1022) mapValue!4122)) b!114225))

(assert (= (and b!114221 ((_ is ValueCellFull!1022) mapDefault!4122)) b!114227))

(assert (= b!114219 b!114221))

(assert (= start!13080 b!114219))

(declare-fun b_lambda!5109 () Bool)

(assert (=> (not b_lambda!5109) (not b!114237)))

(declare-fun t!5849 () Bool)

(declare-fun tb!2181 () Bool)

(assert (=> (and b!114232 (= (defaultEntry!2682 (v!2990 (underlying!388 thiss!992))) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992)))) t!5849) tb!2181))

(declare-fun result!3643 () Bool)

(assert (=> tb!2181 (= result!3643 tp_is_empty!2731)))

(assert (=> b!114237 t!5849))

(declare-fun b_and!7049 () Bool)

(assert (= b_and!7045 (and (=> t!5849 result!3643) b_and!7049)))

(declare-fun tb!2183 () Bool)

(declare-fun t!5851 () Bool)

(assert (=> (and b!114219 (= (defaultEntry!2682 newMap!16) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992)))) t!5851) tb!2183))

(declare-fun result!3647 () Bool)

(assert (= result!3647 result!3643))

(assert (=> b!114237 t!5851))

(declare-fun b_and!7051 () Bool)

(assert (= b_and!7047 (and (=> t!5851 result!3647) b_and!7051)))

(declare-fun m!130483 () Bool)

(assert (=> b!114235 m!130483))

(declare-fun m!130485 () Bool)

(assert (=> b!114235 m!130485))

(declare-fun m!130487 () Bool)

(assert (=> b!114235 m!130487))

(declare-fun m!130489 () Bool)

(assert (=> b!114235 m!130489))

(declare-fun m!130491 () Bool)

(assert (=> b!114235 m!130491))

(declare-fun m!130493 () Bool)

(assert (=> b!114235 m!130493))

(assert (=> b!114235 m!130483))

(declare-fun m!130495 () Bool)

(assert (=> b!114235 m!130495))

(assert (=> b!114235 m!130495))

(declare-fun m!130497 () Bool)

(assert (=> b!114235 m!130497))

(declare-fun m!130499 () Bool)

(assert (=> b!114235 m!130499))

(assert (=> b!114235 m!130483))

(declare-fun m!130501 () Bool)

(assert (=> b!114235 m!130501))

(declare-fun m!130503 () Bool)

(assert (=> b!114235 m!130503))

(declare-fun m!130505 () Bool)

(assert (=> b!114235 m!130505))

(declare-fun m!130507 () Bool)

(assert (=> b!114219 m!130507))

(declare-fun m!130509 () Bool)

(assert (=> b!114219 m!130509))

(declare-fun m!130511 () Bool)

(assert (=> mapNonEmpty!4121 m!130511))

(declare-fun m!130513 () Bool)

(assert (=> b!114233 m!130513))

(declare-fun m!130515 () Bool)

(assert (=> b!114224 m!130515))

(declare-fun m!130517 () Bool)

(assert (=> start!13080 m!130517))

(declare-fun m!130519 () Bool)

(assert (=> mapNonEmpty!4122 m!130519))

(assert (=> b!114237 m!130483))

(declare-fun m!130521 () Bool)

(assert (=> b!114237 m!130521))

(declare-fun m!130523 () Bool)

(assert (=> b!114237 m!130523))

(assert (=> b!114237 m!130521))

(assert (=> b!114237 m!130523))

(declare-fun m!130525 () Bool)

(assert (=> b!114237 m!130525))

(declare-fun m!130527 () Bool)

(assert (=> b!114230 m!130527))

(declare-fun m!130529 () Bool)

(assert (=> b!114230 m!130529))

(declare-fun m!130531 () Bool)

(assert (=> b!114222 m!130531))

(declare-fun m!130533 () Bool)

(assert (=> b!114222 m!130533))

(assert (=> b!114222 m!130483))

(declare-fun m!130535 () Bool)

(assert (=> b!114222 m!130535))

(assert (=> b!114222 m!130483))

(assert (=> b!114222 m!130483))

(declare-fun m!130537 () Bool)

(assert (=> b!114222 m!130537))

(assert (=> b!114222 m!130483))

(declare-fun m!130539 () Bool)

(assert (=> b!114222 m!130539))

(declare-fun m!130541 () Bool)

(assert (=> b!114232 m!130541))

(declare-fun m!130543 () Bool)

(assert (=> b!114232 m!130543))

(assert (=> b!114228 m!130483))

(assert (=> b!114228 m!130483))

(declare-fun m!130545 () Bool)

(assert (=> b!114228 m!130545))

(assert (=> b!114228 m!130483))

(declare-fun m!130547 () Bool)

(assert (=> b!114228 m!130547))

(check-sat (not b!114228) (not b!114235) (not mapNonEmpty!4121) tp_is_empty!2731 (not mapNonEmpty!4122) (not b!114232) (not b!114237) (not b!114222) (not b!114230) (not b_next!2631) (not b!114219) b_and!7049 (not b_next!2629) (not start!13080) (not b!114224) (not b_lambda!5109) b_and!7051 (not b!114233))
(check-sat b_and!7049 b_and!7051 (not b_next!2629) (not b_next!2631))
(get-model)

(declare-fun b_lambda!5115 () Bool)

(assert (= b_lambda!5109 (or (and b!114232 b_free!2629) (and b!114219 b_free!2631 (= (defaultEntry!2682 newMap!16) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992))))) b_lambda!5115)))

(check-sat (not b!114228) (not b!114235) (not mapNonEmpty!4121) tp_is_empty!2731 (not mapNonEmpty!4122) (not b!114232) (not b!114237) (not b!114224) (not b!114222) (not b!114230) (not b_lambda!5115) (not b_next!2631) (not b!114219) b_and!7049 (not b_next!2629) (not start!13080) b_and!7051 (not b!114233))
(check-sat b_and!7049 b_and!7051 (not b_next!2629) (not b_next!2631))
(get-model)

(declare-fun d!32365 () Bool)

(assert (=> d!32365 (= (valid!453 thiss!992) (valid!452 (v!2990 (underlying!388 thiss!992))))))

(declare-fun bs!4679 () Bool)

(assert (= bs!4679 d!32365))

(assert (=> bs!4679 m!130513))

(assert (=> start!13080 d!32365))

(declare-fun d!32367 () Bool)

(declare-fun res!56289 () Bool)

(declare-fun e!74446 () Bool)

(assert (=> d!32367 (=> (not res!56289) (not e!74446))))

(declare-fun simpleValid!79 (LongMapFixedSize!952) Bool)

(assert (=> d!32367 (= res!56289 (simpleValid!79 newMap!16))))

(assert (=> d!32367 (= (valid!452 newMap!16) e!74446)))

(declare-fun b!114371 () Bool)

(declare-fun res!56290 () Bool)

(assert (=> b!114371 (=> (not res!56290) (not e!74446))))

(declare-fun arrayCountValidKeys!0 (array!4449 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!114371 (= res!56290 (= (arrayCountValidKeys!0 (_keys!4404 newMap!16) #b00000000000000000000000000000000 (size!2368 (_keys!4404 newMap!16))) (_size!525 newMap!16)))))

(declare-fun b!114372 () Bool)

(declare-fun res!56291 () Bool)

(assert (=> b!114372 (=> (not res!56291) (not e!74446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4449 (_ BitVec 32)) Bool)

(assert (=> b!114372 (= res!56291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4404 newMap!16) (mask!6878 newMap!16)))))

(declare-fun b!114373 () Bool)

(assert (=> b!114373 (= e!74446 (arrayNoDuplicates!0 (_keys!4404 newMap!16) #b00000000000000000000000000000000 Nil!1631))))

(assert (= (and d!32367 res!56289) b!114371))

(assert (= (and b!114371 res!56290) b!114372))

(assert (= (and b!114372 res!56291) b!114373))

(declare-fun m!130681 () Bool)

(assert (=> d!32367 m!130681))

(declare-fun m!130683 () Bool)

(assert (=> b!114371 m!130683))

(declare-fun m!130685 () Bool)

(assert (=> b!114372 m!130685))

(declare-fun m!130687 () Bool)

(assert (=> b!114373 m!130687))

(assert (=> b!114224 d!32367))

(declare-fun d!32369 () Bool)

(declare-fun c!20406 () Bool)

(assert (=> d!32369 (= c!20406 ((_ is ValueCellFull!1022) (select (arr!2109 (_values!2665 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun e!74449 () V!3289)

(assert (=> d!32369 (= (get!1386 (select (arr!2109 (_values!2665 (v!2990 (underlying!388 thiss!992)))) from!355) (dynLambda!402 (defaultEntry!2682 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!74449)))

(declare-fun b!114378 () Bool)

(declare-fun get!1388 (ValueCell!1022 V!3289) V!3289)

(assert (=> b!114378 (= e!74449 (get!1388 (select (arr!2109 (_values!2665 (v!2990 (underlying!388 thiss!992)))) from!355) (dynLambda!402 (defaultEntry!2682 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114379 () Bool)

(declare-fun get!1389 (ValueCell!1022 V!3289) V!3289)

(assert (=> b!114379 (= e!74449 (get!1389 (select (arr!2109 (_values!2665 (v!2990 (underlying!388 thiss!992)))) from!355) (dynLambda!402 (defaultEntry!2682 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32369 c!20406) b!114378))

(assert (= (and d!32369 (not c!20406)) b!114379))

(assert (=> b!114378 m!130521))

(assert (=> b!114378 m!130523))

(declare-fun m!130689 () Bool)

(assert (=> b!114378 m!130689))

(assert (=> b!114379 m!130521))

(assert (=> b!114379 m!130523))

(declare-fun m!130691 () Bool)

(assert (=> b!114379 m!130691))

(assert (=> b!114237 d!32369))

(declare-fun d!32371 () Bool)

(assert (=> d!32371 (= (array_inv!1311 (_keys!4404 newMap!16)) (bvsge (size!2368 (_keys!4404 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!114219 d!32371))

(declare-fun d!32373 () Bool)

(assert (=> d!32373 (= (array_inv!1312 (_values!2665 newMap!16)) (bvsge (size!2369 (_values!2665 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!114219 d!32373))

(declare-fun d!32375 () Bool)

(assert (=> d!32375 (= (array_inv!1311 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvsge (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!114232 d!32375))

(declare-fun d!32377 () Bool)

(assert (=> d!32377 (= (array_inv!1312 (_values!2665 (v!2990 (underlying!388 thiss!992)))) (bvsge (size!2369 (_values!2665 (v!2990 (underlying!388 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!114232 d!32377))

(declare-fun d!32379 () Bool)

(declare-fun e!74452 () Bool)

(assert (=> d!32379 e!74452))

(declare-fun res!56296 () Bool)

(assert (=> d!32379 (=> (not res!56296) (not e!74452))))

(declare-fun lt!59556 () ListLongMap!1577)

(assert (=> d!32379 (= res!56296 (contains!841 lt!59556 (_1!1232 lt!59436)))))

(declare-fun lt!59557 () List!1635)

(assert (=> d!32379 (= lt!59556 (ListLongMap!1578 lt!59557))))

(declare-fun lt!59558 () Unit!3552)

(declare-fun lt!59555 () Unit!3552)

(assert (=> d!32379 (= lt!59558 lt!59555)))

(declare-datatypes ((Option!168 0))(
  ( (Some!167 (v!2996 V!3289)) (None!166) )
))
(declare-fun getValueByKey!162 (List!1635 (_ BitVec 64)) Option!168)

(assert (=> d!32379 (= (getValueByKey!162 lt!59557 (_1!1232 lt!59436)) (Some!167 (_2!1232 lt!59436)))))

(declare-fun lemmaContainsTupThenGetReturnValue!78 (List!1635 (_ BitVec 64) V!3289) Unit!3552)

(assert (=> d!32379 (= lt!59555 (lemmaContainsTupThenGetReturnValue!78 lt!59557 (_1!1232 lt!59436) (_2!1232 lt!59436)))))

(declare-fun insertStrictlySorted!81 (List!1635 (_ BitVec 64) V!3289) List!1635)

(assert (=> d!32379 (= lt!59557 (insertStrictlySorted!81 (toList!804 lt!59424) (_1!1232 lt!59436) (_2!1232 lt!59436)))))

(assert (=> d!32379 (= (+!156 lt!59424 lt!59436) lt!59556)))

(declare-fun b!114384 () Bool)

(declare-fun res!56297 () Bool)

(assert (=> b!114384 (=> (not res!56297) (not e!74452))))

(assert (=> b!114384 (= res!56297 (= (getValueByKey!162 (toList!804 lt!59556) (_1!1232 lt!59436)) (Some!167 (_2!1232 lt!59436))))))

(declare-fun b!114385 () Bool)

(declare-fun contains!842 (List!1635 tuple2!2442) Bool)

(assert (=> b!114385 (= e!74452 (contains!842 (toList!804 lt!59556) lt!59436))))

(assert (= (and d!32379 res!56296) b!114384))

(assert (= (and b!114384 res!56297) b!114385))

(declare-fun m!130693 () Bool)

(assert (=> d!32379 m!130693))

(declare-fun m!130695 () Bool)

(assert (=> d!32379 m!130695))

(declare-fun m!130697 () Bool)

(assert (=> d!32379 m!130697))

(declare-fun m!130699 () Bool)

(assert (=> d!32379 m!130699))

(declare-fun m!130701 () Bool)

(assert (=> b!114384 m!130701))

(declare-fun m!130703 () Bool)

(assert (=> b!114385 m!130703))

(assert (=> b!114235 d!32379))

(declare-fun d!32381 () Bool)

(declare-fun e!74453 () Bool)

(assert (=> d!32381 e!74453))

(declare-fun res!56298 () Bool)

(assert (=> d!32381 (=> (not res!56298) (not e!74453))))

(declare-fun lt!59560 () ListLongMap!1577)

(assert (=> d!32381 (= res!56298 (contains!841 lt!59560 (_1!1232 lt!59423)))))

(declare-fun lt!59561 () List!1635)

(assert (=> d!32381 (= lt!59560 (ListLongMap!1578 lt!59561))))

(declare-fun lt!59562 () Unit!3552)

(declare-fun lt!59559 () Unit!3552)

(assert (=> d!32381 (= lt!59562 lt!59559)))

(assert (=> d!32381 (= (getValueByKey!162 lt!59561 (_1!1232 lt!59423)) (Some!167 (_2!1232 lt!59423)))))

(assert (=> d!32381 (= lt!59559 (lemmaContainsTupThenGetReturnValue!78 lt!59561 (_1!1232 lt!59423) (_2!1232 lt!59423)))))

(assert (=> d!32381 (= lt!59561 (insertStrictlySorted!81 (toList!804 lt!59421) (_1!1232 lt!59423) (_2!1232 lt!59423)))))

(assert (=> d!32381 (= (+!156 lt!59421 lt!59423) lt!59560)))

(declare-fun b!114386 () Bool)

(declare-fun res!56299 () Bool)

(assert (=> b!114386 (=> (not res!56299) (not e!74453))))

(assert (=> b!114386 (= res!56299 (= (getValueByKey!162 (toList!804 lt!59560) (_1!1232 lt!59423)) (Some!167 (_2!1232 lt!59423))))))

(declare-fun b!114387 () Bool)

(assert (=> b!114387 (= e!74453 (contains!842 (toList!804 lt!59560) lt!59423))))

(assert (= (and d!32381 res!56298) b!114386))

(assert (= (and b!114386 res!56299) b!114387))

(declare-fun m!130705 () Bool)

(assert (=> d!32381 m!130705))

(declare-fun m!130707 () Bool)

(assert (=> d!32381 m!130707))

(declare-fun m!130709 () Bool)

(assert (=> d!32381 m!130709))

(declare-fun m!130711 () Bool)

(assert (=> d!32381 m!130711))

(declare-fun m!130713 () Bool)

(assert (=> b!114386 m!130713))

(declare-fun m!130715 () Bool)

(assert (=> b!114387 m!130715))

(assert (=> b!114235 d!32381))

(declare-fun d!32383 () Bool)

(declare-fun res!56300 () Bool)

(declare-fun e!74454 () Bool)

(assert (=> d!32383 (=> (not res!56300) (not e!74454))))

(assert (=> d!32383 (= res!56300 (simpleValid!79 (_2!1231 lt!59435)))))

(assert (=> d!32383 (= (valid!452 (_2!1231 lt!59435)) e!74454)))

(declare-fun b!114388 () Bool)

(declare-fun res!56301 () Bool)

(assert (=> b!114388 (=> (not res!56301) (not e!74454))))

(assert (=> b!114388 (= res!56301 (= (arrayCountValidKeys!0 (_keys!4404 (_2!1231 lt!59435)) #b00000000000000000000000000000000 (size!2368 (_keys!4404 (_2!1231 lt!59435)))) (_size!525 (_2!1231 lt!59435))))))

(declare-fun b!114389 () Bool)

(declare-fun res!56302 () Bool)

(assert (=> b!114389 (=> (not res!56302) (not e!74454))))

(assert (=> b!114389 (= res!56302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4404 (_2!1231 lt!59435)) (mask!6878 (_2!1231 lt!59435))))))

(declare-fun b!114390 () Bool)

(assert (=> b!114390 (= e!74454 (arrayNoDuplicates!0 (_keys!4404 (_2!1231 lt!59435)) #b00000000000000000000000000000000 Nil!1631))))

(assert (= (and d!32383 res!56300) b!114388))

(assert (= (and b!114388 res!56301) b!114389))

(assert (= (and b!114389 res!56302) b!114390))

(declare-fun m!130717 () Bool)

(assert (=> d!32383 m!130717))

(declare-fun m!130719 () Bool)

(assert (=> b!114388 m!130719))

(declare-fun m!130721 () Bool)

(assert (=> b!114389 m!130721))

(declare-fun m!130723 () Bool)

(assert (=> b!114390 m!130723))

(assert (=> b!114235 d!32383))

(declare-fun d!32385 () Bool)

(declare-fun e!74471 () Bool)

(assert (=> d!32385 e!74471))

(declare-fun res!56313 () Bool)

(assert (=> d!32385 (=> (not res!56313) (not e!74471))))

(declare-fun lt!59578 () ListLongMap!1577)

(assert (=> d!32385 (= res!56313 (not (contains!841 lt!59578 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!74475 () ListLongMap!1577)

(assert (=> d!32385 (= lt!59578 e!74475)))

(declare-fun c!20418 () Bool)

(assert (=> d!32385 (= c!20418 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!32385 (validMask!0 (mask!6878 (v!2990 (underlying!388 thiss!992))))))

(assert (=> d!32385 (= (getCurrentListMapNoExtraKeys!123 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (_values!2665 (v!2990 (underlying!388 thiss!992))) (mask!6878 (v!2990 (underlying!388 thiss!992))) (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) (minValue!2549 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992)))) lt!59578)))

(declare-fun b!114415 () Bool)

(assert (=> b!114415 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992))))))))

(assert (=> b!114415 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2369 (_values!2665 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun e!74472 () Bool)

(declare-fun apply!103 (ListLongMap!1577 (_ BitVec 64)) V!3289)

(assert (=> b!114415 (= e!74472 (= (apply!103 lt!59578 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1386 (select (arr!2109 (_values!2665 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!402 (defaultEntry!2682 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!114416 () Bool)

(declare-fun e!74470 () Bool)

(assert (=> b!114416 (= e!74471 e!74470)))

(declare-fun c!20415 () Bool)

(declare-fun e!74474 () Bool)

(assert (=> b!114416 (= c!20415 e!74474)))

(declare-fun res!56311 () Bool)

(assert (=> b!114416 (=> (not res!56311) (not e!74474))))

(assert (=> b!114416 (= res!56311 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun b!114417 () Bool)

(assert (=> b!114417 (= e!74475 (ListLongMap!1578 Nil!1632))))

(declare-fun b!114418 () Bool)

(declare-fun lt!59577 () Unit!3552)

(declare-fun lt!59579 () Unit!3552)

(assert (=> b!114418 (= lt!59577 lt!59579)))

(declare-fun lt!59580 () V!3289)

(declare-fun lt!59581 () (_ BitVec 64))

(declare-fun lt!59582 () (_ BitVec 64))

(declare-fun lt!59583 () ListLongMap!1577)

(assert (=> b!114418 (not (contains!841 (+!156 lt!59583 (tuple2!2443 lt!59581 lt!59580)) lt!59582))))

(declare-fun addStillNotContains!53 (ListLongMap!1577 (_ BitVec 64) V!3289 (_ BitVec 64)) Unit!3552)

(assert (=> b!114418 (= lt!59579 (addStillNotContains!53 lt!59583 lt!59581 lt!59580 lt!59582))))

(assert (=> b!114418 (= lt!59582 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!114418 (= lt!59580 (get!1386 (select (arr!2109 (_values!2665 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!402 (defaultEntry!2682 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114418 (= lt!59581 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!12253 () ListLongMap!1577)

(assert (=> b!114418 (= lt!59583 call!12253)))

(declare-fun e!74469 () ListLongMap!1577)

(assert (=> b!114418 (= e!74469 (+!156 call!12253 (tuple2!2443 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1386 (select (arr!2109 (_values!2665 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!402 (defaultEntry!2682 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!114419 () Bool)

(declare-fun e!74473 () Bool)

(assert (=> b!114419 (= e!74473 (= lt!59578 (getCurrentListMapNoExtraKeys!123 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (_values!2665 (v!2990 (underlying!388 thiss!992))) (mask!6878 (v!2990 (underlying!388 thiss!992))) (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) (minValue!2549 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun b!114420 () Bool)

(declare-fun res!56312 () Bool)

(assert (=> b!114420 (=> (not res!56312) (not e!74471))))

(assert (=> b!114420 (= res!56312 (not (contains!841 lt!59578 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!12250 () Bool)

(assert (=> bm!12250 (= call!12253 (getCurrentListMapNoExtraKeys!123 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (_values!2665 (v!2990 (underlying!388 thiss!992))) (mask!6878 (v!2990 (underlying!388 thiss!992))) (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) (minValue!2549 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun b!114421 () Bool)

(assert (=> b!114421 (= e!74470 e!74472)))

(assert (=> b!114421 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun res!56314 () Bool)

(assert (=> b!114421 (= res!56314 (contains!841 lt!59578 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!114421 (=> (not res!56314) (not e!74472))))

(declare-fun b!114422 () Bool)

(assert (=> b!114422 (= e!74469 call!12253)))

(declare-fun b!114423 () Bool)

(assert (=> b!114423 (= e!74475 e!74469)))

(declare-fun c!20416 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!114423 (= c!20416 (validKeyInArray!0 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!114424 () Bool)

(assert (=> b!114424 (= e!74470 e!74473)))

(declare-fun c!20417 () Bool)

(assert (=> b!114424 (= c!20417 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun b!114425 () Bool)

(declare-fun isEmpty!391 (ListLongMap!1577) Bool)

(assert (=> b!114425 (= e!74473 (isEmpty!391 lt!59578))))

(declare-fun b!114426 () Bool)

(assert (=> b!114426 (= e!74474 (validKeyInArray!0 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!114426 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(assert (= (and d!32385 c!20418) b!114417))

(assert (= (and d!32385 (not c!20418)) b!114423))

(assert (= (and b!114423 c!20416) b!114418))

(assert (= (and b!114423 (not c!20416)) b!114422))

(assert (= (or b!114418 b!114422) bm!12250))

(assert (= (and d!32385 res!56313) b!114420))

(assert (= (and b!114420 res!56312) b!114416))

(assert (= (and b!114416 res!56311) b!114426))

(assert (= (and b!114416 c!20415) b!114421))

(assert (= (and b!114416 (not c!20415)) b!114424))

(assert (= (and b!114421 res!56314) b!114415))

(assert (= (and b!114424 c!20417) b!114419))

(assert (= (and b!114424 (not c!20417)) b!114425))

(declare-fun b_lambda!5117 () Bool)

(assert (=> (not b_lambda!5117) (not b!114415)))

(assert (=> b!114415 t!5849))

(declare-fun b_and!7069 () Bool)

(assert (= b_and!7049 (and (=> t!5849 result!3643) b_and!7069)))

(assert (=> b!114415 t!5851))

(declare-fun b_and!7071 () Bool)

(assert (= b_and!7051 (and (=> t!5851 result!3647) b_and!7071)))

(declare-fun b_lambda!5119 () Bool)

(assert (=> (not b_lambda!5119) (not b!114418)))

(assert (=> b!114418 t!5849))

(declare-fun b_and!7073 () Bool)

(assert (= b_and!7069 (and (=> t!5849 result!3643) b_and!7073)))

(assert (=> b!114418 t!5851))

(declare-fun b_and!7075 () Bool)

(assert (= b_and!7071 (and (=> t!5851 result!3647) b_and!7075)))

(declare-fun m!130725 () Bool)

(assert (=> b!114423 m!130725))

(assert (=> b!114423 m!130725))

(declare-fun m!130727 () Bool)

(assert (=> b!114423 m!130727))

(declare-fun m!130729 () Bool)

(assert (=> bm!12250 m!130729))

(declare-fun m!130731 () Bool)

(assert (=> b!114425 m!130731))

(declare-fun m!130733 () Bool)

(assert (=> b!114418 m!130733))

(assert (=> b!114418 m!130725))

(declare-fun m!130735 () Bool)

(assert (=> b!114418 m!130735))

(assert (=> b!114418 m!130523))

(assert (=> b!114418 m!130733))

(declare-fun m!130737 () Bool)

(assert (=> b!114418 m!130737))

(declare-fun m!130739 () Bool)

(assert (=> b!114418 m!130739))

(declare-fun m!130741 () Bool)

(assert (=> b!114418 m!130741))

(assert (=> b!114418 m!130739))

(assert (=> b!114418 m!130523))

(declare-fun m!130743 () Bool)

(assert (=> b!114418 m!130743))

(assert (=> b!114426 m!130725))

(assert (=> b!114426 m!130725))

(assert (=> b!114426 m!130727))

(assert (=> b!114419 m!130729))

(assert (=> b!114421 m!130725))

(assert (=> b!114421 m!130725))

(declare-fun m!130745 () Bool)

(assert (=> b!114421 m!130745))

(assert (=> b!114415 m!130725))

(declare-fun m!130747 () Bool)

(assert (=> b!114415 m!130747))

(assert (=> b!114415 m!130725))

(assert (=> b!114415 m!130523))

(assert (=> b!114415 m!130739))

(assert (=> b!114415 m!130739))

(assert (=> b!114415 m!130523))

(assert (=> b!114415 m!130743))

(declare-fun m!130749 () Bool)

(assert (=> d!32385 m!130749))

(declare-fun m!130751 () Bool)

(assert (=> d!32385 m!130751))

(declare-fun m!130753 () Bool)

(assert (=> b!114420 m!130753))

(assert (=> b!114235 d!32385))

(declare-fun d!32387 () Bool)

(declare-fun e!74476 () Bool)

(assert (=> d!32387 e!74476))

(declare-fun res!56315 () Bool)

(assert (=> d!32387 (=> (not res!56315) (not e!74476))))

(declare-fun lt!59585 () ListLongMap!1577)

(assert (=> d!32387 (= res!56315 (contains!841 lt!59585 (_1!1232 lt!59430)))))

(declare-fun lt!59586 () List!1635)

(assert (=> d!32387 (= lt!59585 (ListLongMap!1578 lt!59586))))

(declare-fun lt!59587 () Unit!3552)

(declare-fun lt!59584 () Unit!3552)

(assert (=> d!32387 (= lt!59587 lt!59584)))

(assert (=> d!32387 (= (getValueByKey!162 lt!59586 (_1!1232 lt!59430)) (Some!167 (_2!1232 lt!59430)))))

(assert (=> d!32387 (= lt!59584 (lemmaContainsTupThenGetReturnValue!78 lt!59586 (_1!1232 lt!59430) (_2!1232 lt!59430)))))

(assert (=> d!32387 (= lt!59586 (insertStrictlySorted!81 (toList!804 (+!156 lt!59421 lt!59423)) (_1!1232 lt!59430) (_2!1232 lt!59430)))))

(assert (=> d!32387 (= (+!156 (+!156 lt!59421 lt!59423) lt!59430) lt!59585)))

(declare-fun b!114427 () Bool)

(declare-fun res!56316 () Bool)

(assert (=> b!114427 (=> (not res!56316) (not e!74476))))

(assert (=> b!114427 (= res!56316 (= (getValueByKey!162 (toList!804 lt!59585) (_1!1232 lt!59430)) (Some!167 (_2!1232 lt!59430))))))

(declare-fun b!114428 () Bool)

(assert (=> b!114428 (= e!74476 (contains!842 (toList!804 lt!59585) lt!59430))))

(assert (= (and d!32387 res!56315) b!114427))

(assert (= (and b!114427 res!56316) b!114428))

(declare-fun m!130755 () Bool)

(assert (=> d!32387 m!130755))

(declare-fun m!130757 () Bool)

(assert (=> d!32387 m!130757))

(declare-fun m!130759 () Bool)

(assert (=> d!32387 m!130759))

(declare-fun m!130761 () Bool)

(assert (=> d!32387 m!130761))

(declare-fun m!130763 () Bool)

(assert (=> b!114427 m!130763))

(declare-fun m!130765 () Bool)

(assert (=> b!114428 m!130765))

(assert (=> b!114235 d!32387))

(declare-fun d!32389 () Bool)

(assert (=> d!32389 (= (+!156 (+!156 lt!59421 (tuple2!2443 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427)) (tuple2!2443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2990 (underlying!388 thiss!992))))) (+!156 (+!156 lt!59421 (tuple2!2443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2990 (underlying!388 thiss!992))))) (tuple2!2443 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427)))))

(declare-fun lt!59590 () Unit!3552)

(declare-fun choose!730 (ListLongMap!1577 (_ BitVec 64) V!3289 (_ BitVec 64) V!3289) Unit!3552)

(assert (=> d!32389 (= lt!59590 (choose!730 lt!59421 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2990 (underlying!388 thiss!992)))))))

(assert (=> d!32389 (not (= (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32389 (= (addCommutativeForDiffKeys!69 lt!59421 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2990 (underlying!388 thiss!992)))) lt!59590)))

(declare-fun bs!4680 () Bool)

(assert (= bs!4680 d!32389))

(declare-fun m!130767 () Bool)

(assert (=> bs!4680 m!130767))

(declare-fun m!130769 () Bool)

(assert (=> bs!4680 m!130769))

(declare-fun m!130771 () Bool)

(assert (=> bs!4680 m!130771))

(assert (=> bs!4680 m!130769))

(assert (=> bs!4680 m!130767))

(declare-fun m!130773 () Bool)

(assert (=> bs!4680 m!130773))

(assert (=> bs!4680 m!130483))

(declare-fun m!130775 () Bool)

(assert (=> bs!4680 m!130775))

(assert (=> b!114235 d!32389))

(declare-fun d!32391 () Bool)

(declare-fun e!74477 () Bool)

(assert (=> d!32391 e!74477))

(declare-fun res!56317 () Bool)

(assert (=> d!32391 (=> (not res!56317) (not e!74477))))

(declare-fun lt!59592 () ListLongMap!1577)

(assert (=> d!32391 (= res!56317 (contains!841 lt!59592 (_1!1232 lt!59430)))))

(declare-fun lt!59593 () List!1635)

(assert (=> d!32391 (= lt!59592 (ListLongMap!1578 lt!59593))))

(declare-fun lt!59594 () Unit!3552)

(declare-fun lt!59591 () Unit!3552)

(assert (=> d!32391 (= lt!59594 lt!59591)))

(assert (=> d!32391 (= (getValueByKey!162 lt!59593 (_1!1232 lt!59430)) (Some!167 (_2!1232 lt!59430)))))

(assert (=> d!32391 (= lt!59591 (lemmaContainsTupThenGetReturnValue!78 lt!59593 (_1!1232 lt!59430) (_2!1232 lt!59430)))))

(assert (=> d!32391 (= lt!59593 (insertStrictlySorted!81 (toList!804 lt!59424) (_1!1232 lt!59430) (_2!1232 lt!59430)))))

(assert (=> d!32391 (= (+!156 lt!59424 lt!59430) lt!59592)))

(declare-fun b!114429 () Bool)

(declare-fun res!56318 () Bool)

(assert (=> b!114429 (=> (not res!56318) (not e!74477))))

(assert (=> b!114429 (= res!56318 (= (getValueByKey!162 (toList!804 lt!59592) (_1!1232 lt!59430)) (Some!167 (_2!1232 lt!59430))))))

(declare-fun b!114430 () Bool)

(assert (=> b!114430 (= e!74477 (contains!842 (toList!804 lt!59592) lt!59430))))

(assert (= (and d!32391 res!56317) b!114429))

(assert (= (and b!114429 res!56318) b!114430))

(declare-fun m!130777 () Bool)

(assert (=> d!32391 m!130777))

(declare-fun m!130779 () Bool)

(assert (=> d!32391 m!130779))

(declare-fun m!130781 () Bool)

(assert (=> d!32391 m!130781))

(declare-fun m!130783 () Bool)

(assert (=> d!32391 m!130783))

(declare-fun m!130785 () Bool)

(assert (=> b!114429 m!130785))

(declare-fun m!130787 () Bool)

(assert (=> b!114430 m!130787))

(assert (=> b!114235 d!32391))

(declare-fun d!32393 () Bool)

(declare-fun e!74478 () Bool)

(assert (=> d!32393 e!74478))

(declare-fun res!56319 () Bool)

(assert (=> d!32393 (=> (not res!56319) (not e!74478))))

(declare-fun lt!59596 () ListLongMap!1577)

(assert (=> d!32393 (= res!56319 (contains!841 lt!59596 (_1!1232 lt!59430)))))

(declare-fun lt!59597 () List!1635)

(assert (=> d!32393 (= lt!59596 (ListLongMap!1578 lt!59597))))

(declare-fun lt!59598 () Unit!3552)

(declare-fun lt!59595 () Unit!3552)

(assert (=> d!32393 (= lt!59598 lt!59595)))

(assert (=> d!32393 (= (getValueByKey!162 lt!59597 (_1!1232 lt!59430)) (Some!167 (_2!1232 lt!59430)))))

(assert (=> d!32393 (= lt!59595 (lemmaContainsTupThenGetReturnValue!78 lt!59597 (_1!1232 lt!59430) (_2!1232 lt!59430)))))

(assert (=> d!32393 (= lt!59597 (insertStrictlySorted!81 (toList!804 lt!59421) (_1!1232 lt!59430) (_2!1232 lt!59430)))))

(assert (=> d!32393 (= (+!156 lt!59421 lt!59430) lt!59596)))

(declare-fun b!114431 () Bool)

(declare-fun res!56320 () Bool)

(assert (=> b!114431 (=> (not res!56320) (not e!74478))))

(assert (=> b!114431 (= res!56320 (= (getValueByKey!162 (toList!804 lt!59596) (_1!1232 lt!59430)) (Some!167 (_2!1232 lt!59430))))))

(declare-fun b!114432 () Bool)

(assert (=> b!114432 (= e!74478 (contains!842 (toList!804 lt!59596) lt!59430))))

(assert (= (and d!32393 res!56319) b!114431))

(assert (= (and b!114431 res!56320) b!114432))

(declare-fun m!130789 () Bool)

(assert (=> d!32393 m!130789))

(declare-fun m!130791 () Bool)

(assert (=> d!32393 m!130791))

(declare-fun m!130793 () Bool)

(assert (=> d!32393 m!130793))

(declare-fun m!130795 () Bool)

(assert (=> d!32393 m!130795))

(declare-fun m!130797 () Bool)

(assert (=> b!114431 m!130797))

(declare-fun m!130799 () Bool)

(assert (=> b!114432 m!130799))

(assert (=> b!114235 d!32393))

(declare-fun d!32395 () Bool)

(declare-fun e!74479 () Bool)

(assert (=> d!32395 e!74479))

(declare-fun res!56321 () Bool)

(assert (=> d!32395 (=> (not res!56321) (not e!74479))))

(declare-fun lt!59600 () ListLongMap!1577)

(assert (=> d!32395 (= res!56321 (contains!841 lt!59600 (_1!1232 lt!59423)))))

(declare-fun lt!59601 () List!1635)

(assert (=> d!32395 (= lt!59600 (ListLongMap!1578 lt!59601))))

(declare-fun lt!59602 () Unit!3552)

(declare-fun lt!59599 () Unit!3552)

(assert (=> d!32395 (= lt!59602 lt!59599)))

(assert (=> d!32395 (= (getValueByKey!162 lt!59601 (_1!1232 lt!59423)) (Some!167 (_2!1232 lt!59423)))))

(assert (=> d!32395 (= lt!59599 (lemmaContainsTupThenGetReturnValue!78 lt!59601 (_1!1232 lt!59423) (_2!1232 lt!59423)))))

(assert (=> d!32395 (= lt!59601 (insertStrictlySorted!81 (toList!804 lt!59434) (_1!1232 lt!59423) (_2!1232 lt!59423)))))

(assert (=> d!32395 (= (+!156 lt!59434 lt!59423) lt!59600)))

(declare-fun b!114433 () Bool)

(declare-fun res!56322 () Bool)

(assert (=> b!114433 (=> (not res!56322) (not e!74479))))

(assert (=> b!114433 (= res!56322 (= (getValueByKey!162 (toList!804 lt!59600) (_1!1232 lt!59423)) (Some!167 (_2!1232 lt!59423))))))

(declare-fun b!114434 () Bool)

(assert (=> b!114434 (= e!74479 (contains!842 (toList!804 lt!59600) lt!59423))))

(assert (= (and d!32395 res!56321) b!114433))

(assert (= (and b!114433 res!56322) b!114434))

(declare-fun m!130801 () Bool)

(assert (=> d!32395 m!130801))

(declare-fun m!130803 () Bool)

(assert (=> d!32395 m!130803))

(declare-fun m!130805 () Bool)

(assert (=> d!32395 m!130805))

(declare-fun m!130807 () Bool)

(assert (=> d!32395 m!130807))

(declare-fun m!130809 () Bool)

(assert (=> b!114433 m!130809))

(declare-fun m!130811 () Bool)

(assert (=> b!114434 m!130811))

(assert (=> b!114235 d!32395))

(declare-fun d!32397 () Bool)

(declare-fun e!74480 () Bool)

(assert (=> d!32397 e!74480))

(declare-fun res!56323 () Bool)

(assert (=> d!32397 (=> (not res!56323) (not e!74480))))

(declare-fun lt!59604 () ListLongMap!1577)

(assert (=> d!32397 (= res!56323 (contains!841 lt!59604 (_1!1232 lt!59436)))))

(declare-fun lt!59605 () List!1635)

(assert (=> d!32397 (= lt!59604 (ListLongMap!1578 lt!59605))))

(declare-fun lt!59606 () Unit!3552)

(declare-fun lt!59603 () Unit!3552)

(assert (=> d!32397 (= lt!59606 lt!59603)))

(assert (=> d!32397 (= (getValueByKey!162 lt!59605 (_1!1232 lt!59436)) (Some!167 (_2!1232 lt!59436)))))

(assert (=> d!32397 (= lt!59603 (lemmaContainsTupThenGetReturnValue!78 lt!59605 (_1!1232 lt!59436) (_2!1232 lt!59436)))))

(assert (=> d!32397 (= lt!59605 (insertStrictlySorted!81 (toList!804 lt!59422) (_1!1232 lt!59436) (_2!1232 lt!59436)))))

(assert (=> d!32397 (= (+!156 lt!59422 lt!59436) lt!59604)))

(declare-fun b!114435 () Bool)

(declare-fun res!56324 () Bool)

(assert (=> b!114435 (=> (not res!56324) (not e!74480))))

(assert (=> b!114435 (= res!56324 (= (getValueByKey!162 (toList!804 lt!59604) (_1!1232 lt!59436)) (Some!167 (_2!1232 lt!59436))))))

(declare-fun b!114436 () Bool)

(assert (=> b!114436 (= e!74480 (contains!842 (toList!804 lt!59604) lt!59436))))

(assert (= (and d!32397 res!56323) b!114435))

(assert (= (and b!114435 res!56324) b!114436))

(declare-fun m!130813 () Bool)

(assert (=> d!32397 m!130813))

(declare-fun m!130815 () Bool)

(assert (=> d!32397 m!130815))

(declare-fun m!130817 () Bool)

(assert (=> d!32397 m!130817))

(declare-fun m!130819 () Bool)

(assert (=> d!32397 m!130819))

(declare-fun m!130821 () Bool)

(assert (=> b!114435 m!130821))

(declare-fun m!130823 () Bool)

(assert (=> b!114436 m!130823))

(assert (=> b!114235 d!32397))

(declare-fun d!32399 () Bool)

(assert (=> d!32399 (= (+!156 (+!156 lt!59424 (tuple2!2443 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427)) (tuple2!2443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2549 (v!2990 (underlying!388 thiss!992))))) (+!156 (+!156 lt!59424 (tuple2!2443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2549 (v!2990 (underlying!388 thiss!992))))) (tuple2!2443 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427)))))

(declare-fun lt!59607 () Unit!3552)

(assert (=> d!32399 (= lt!59607 (choose!730 lt!59424 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2549 (v!2990 (underlying!388 thiss!992)))))))

(assert (=> d!32399 (not (= (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32399 (= (addCommutativeForDiffKeys!69 lt!59424 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2549 (v!2990 (underlying!388 thiss!992)))) lt!59607)))

(declare-fun bs!4681 () Bool)

(assert (= bs!4681 d!32399))

(declare-fun m!130825 () Bool)

(assert (=> bs!4681 m!130825))

(declare-fun m!130827 () Bool)

(assert (=> bs!4681 m!130827))

(declare-fun m!130829 () Bool)

(assert (=> bs!4681 m!130829))

(assert (=> bs!4681 m!130827))

(assert (=> bs!4681 m!130825))

(declare-fun m!130831 () Bool)

(assert (=> bs!4681 m!130831))

(assert (=> bs!4681 m!130483))

(declare-fun m!130833 () Bool)

(assert (=> bs!4681 m!130833))

(assert (=> b!114235 d!32399))

(declare-fun d!32401 () Bool)

(assert (=> d!32401 (not (arrayContainsKey!0 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!59610 () Unit!3552)

(declare-fun choose!68 (array!4449 (_ BitVec 32) (_ BitVec 64) List!1634) Unit!3552)

(assert (=> d!32401 (= lt!59610 (choose!68 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (Cons!1630 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) Nil!1631)))))

(assert (=> d!32401 (bvslt (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!32401 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (Cons!1630 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) Nil!1631)) lt!59610)))

(declare-fun bs!4682 () Bool)

(assert (= bs!4682 d!32401))

(assert (=> bs!4682 m!130483))

(assert (=> bs!4682 m!130537))

(assert (=> bs!4682 m!130483))

(declare-fun m!130835 () Bool)

(assert (=> bs!4682 m!130835))

(assert (=> b!114222 d!32401))

(declare-fun d!32403 () Bool)

(assert (=> d!32403 (arrayNoDuplicates!0 (_keys!4404 (v!2990 (underlying!388 thiss!992))) from!355 Nil!1631)))

(declare-fun lt!59613 () Unit!3552)

(declare-fun choose!39 (array!4449 (_ BitVec 32) (_ BitVec 32)) Unit!3552)

(assert (=> d!32403 (= lt!59613 (choose!39 (_keys!4404 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!32403 (bvslt (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!32403 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4404 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000000 from!355) lt!59613)))

(declare-fun bs!4683 () Bool)

(assert (= bs!4683 d!32403))

(assert (=> bs!4683 m!130533))

(declare-fun m!130837 () Bool)

(assert (=> bs!4683 m!130837))

(assert (=> b!114222 d!32403))

(declare-fun d!32405 () Bool)

(declare-fun res!56329 () Bool)

(declare-fun e!74485 () Bool)

(assert (=> d!32405 (=> res!56329 e!74485)))

(assert (=> d!32405 (= res!56329 (= (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(assert (=> d!32405 (= (arrayContainsKey!0 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!74485)))

(declare-fun b!114441 () Bool)

(declare-fun e!74486 () Bool)

(assert (=> b!114441 (= e!74485 e!74486)))

(declare-fun res!56330 () Bool)

(assert (=> b!114441 (=> (not res!56330) (not e!74486))))

(assert (=> b!114441 (= res!56330 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun b!114442 () Bool)

(assert (=> b!114442 (= e!74486 (arrayContainsKey!0 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!32405 (not res!56329)) b!114441))

(assert (= (and b!114441 res!56330) b!114442))

(assert (=> d!32405 m!130725))

(assert (=> b!114442 m!130483))

(declare-fun m!130839 () Bool)

(assert (=> b!114442 m!130839))

(assert (=> b!114222 d!32405))

(declare-fun d!32407 () Bool)

(declare-fun e!74489 () Bool)

(assert (=> d!32407 e!74489))

(declare-fun c!20421 () Bool)

(assert (=> d!32407 (= c!20421 (and (not (= (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!59616 () Unit!3552)

(declare-fun choose!731 (array!4449 array!4451 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 64) (_ BitVec 32) Int) Unit!3552)

(assert (=> d!32407 (= lt!59616 (choose!731 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (_values!2665 (v!2990 (underlying!388 thiss!992))) (mask!6878 (v!2990 (underlying!388 thiss!992))) (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) (minValue!2549 (v!2990 (underlying!388 thiss!992))) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992)))))))

(assert (=> d!32407 (validMask!0 (mask!6878 (v!2990 (underlying!388 thiss!992))))))

(assert (=> d!32407 (= (lemmaListMapContainsThenArrayContainsFrom!114 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (_values!2665 (v!2990 (underlying!388 thiss!992))) (mask!6878 (v!2990 (underlying!388 thiss!992))) (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) (minValue!2549 (v!2990 (underlying!388 thiss!992))) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992)))) lt!59616)))

(declare-fun b!114447 () Bool)

(assert (=> b!114447 (= e!74489 (arrayContainsKey!0 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!114448 () Bool)

(assert (=> b!114448 (= e!74489 (ite (= (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!32407 c!20421) b!114447))

(assert (= (and d!32407 (not c!20421)) b!114448))

(assert (=> d!32407 m!130483))

(declare-fun m!130841 () Bool)

(assert (=> d!32407 m!130841))

(assert (=> d!32407 m!130751))

(assert (=> b!114447 m!130483))

(assert (=> b!114447 m!130537))

(assert (=> b!114222 d!32407))

(declare-fun bm!12253 () Bool)

(declare-fun c!20424 () Bool)

(declare-fun call!12256 () Bool)

(assert (=> bm!12253 (= call!12256 (arrayNoDuplicates!0 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!20424 (Cons!1630 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) Nil!1631) Nil!1631)))))

(declare-fun b!114459 () Bool)

(declare-fun e!74499 () Bool)

(assert (=> b!114459 (= e!74499 call!12256)))

(declare-fun b!114460 () Bool)

(declare-fun e!74501 () Bool)

(assert (=> b!114460 (= e!74501 e!74499)))

(assert (=> b!114460 (= c!20424 (validKeyInArray!0 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun b!114461 () Bool)

(assert (=> b!114461 (= e!74499 call!12256)))

(declare-fun b!114462 () Bool)

(declare-fun e!74498 () Bool)

(declare-fun contains!843 (List!1634 (_ BitVec 64)) Bool)

(assert (=> b!114462 (= e!74498 (contains!843 Nil!1631 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun d!32409 () Bool)

(declare-fun res!56337 () Bool)

(declare-fun e!74500 () Bool)

(assert (=> d!32409 (=> res!56337 e!74500)))

(assert (=> d!32409 (= res!56337 (bvsge from!355 (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992))))))))

(assert (=> d!32409 (= (arrayNoDuplicates!0 (_keys!4404 (v!2990 (underlying!388 thiss!992))) from!355 Nil!1631) e!74500)))

(declare-fun b!114463 () Bool)

(assert (=> b!114463 (= e!74500 e!74501)))

(declare-fun res!56339 () Bool)

(assert (=> b!114463 (=> (not res!56339) (not e!74501))))

(assert (=> b!114463 (= res!56339 (not e!74498))))

(declare-fun res!56338 () Bool)

(assert (=> b!114463 (=> (not res!56338) (not e!74498))))

(assert (=> b!114463 (= res!56338 (validKeyInArray!0 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(assert (= (and d!32409 (not res!56337)) b!114463))

(assert (= (and b!114463 res!56338) b!114462))

(assert (= (and b!114463 res!56339) b!114460))

(assert (= (and b!114460 c!20424) b!114461))

(assert (= (and b!114460 (not c!20424)) b!114459))

(assert (= (or b!114461 b!114459) bm!12253))

(assert (=> bm!12253 m!130483))

(declare-fun m!130843 () Bool)

(assert (=> bm!12253 m!130843))

(assert (=> b!114460 m!130483))

(assert (=> b!114460 m!130483))

(declare-fun m!130845 () Bool)

(assert (=> b!114460 m!130845))

(assert (=> b!114462 m!130483))

(assert (=> b!114462 m!130483))

(declare-fun m!130847 () Bool)

(assert (=> b!114462 m!130847))

(assert (=> b!114463 m!130483))

(assert (=> b!114463 m!130483))

(assert (=> b!114463 m!130845))

(assert (=> b!114222 d!32409))

(declare-fun d!32411 () Bool)

(assert (=> d!32411 (= (map!1318 newMap!16) (getCurrentListMap!486 (_keys!4404 newMap!16) (_values!2665 newMap!16) (mask!6878 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2682 newMap!16)))))

(declare-fun bs!4684 () Bool)

(assert (= bs!4684 d!32411))

(declare-fun m!130849 () Bool)

(assert (=> bs!4684 m!130849))

(assert (=> b!114230 d!32411))

(declare-fun b!114506 () Bool)

(declare-fun e!74538 () Bool)

(declare-fun call!12271 () Bool)

(assert (=> b!114506 (= e!74538 (not call!12271))))

(declare-fun b!114507 () Bool)

(declare-fun e!74536 () ListLongMap!1577)

(declare-fun call!12273 () ListLongMap!1577)

(assert (=> b!114507 (= e!74536 call!12273)))

(declare-fun b!114508 () Bool)

(declare-fun res!56359 () Bool)

(declare-fun e!74539 () Bool)

(assert (=> b!114508 (=> (not res!56359) (not e!74539))))

(declare-fun e!74531 () Bool)

(assert (=> b!114508 (= res!56359 e!74531)))

(declare-fun res!56361 () Bool)

(assert (=> b!114508 (=> res!56361 e!74531)))

(declare-fun e!74540 () Bool)

(assert (=> b!114508 (= res!56361 (not e!74540))))

(declare-fun res!56366 () Bool)

(assert (=> b!114508 (=> (not res!56366) (not e!74540))))

(assert (=> b!114508 (= res!56366 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun bm!12268 () Bool)

(declare-fun call!12274 () Bool)

(declare-fun lt!59679 () ListLongMap!1577)

(assert (=> bm!12268 (= call!12274 (contains!841 lt!59679 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!114509 () Bool)

(declare-fun e!74529 () Bool)

(declare-fun e!74535 () Bool)

(assert (=> b!114509 (= e!74529 e!74535)))

(declare-fun res!56360 () Bool)

(assert (=> b!114509 (= res!56360 call!12274)))

(assert (=> b!114509 (=> (not res!56360) (not e!74535))))

(declare-fun b!114510 () Bool)

(declare-fun e!74534 () ListLongMap!1577)

(assert (=> b!114510 (= e!74534 call!12273)))

(declare-fun b!114511 () Bool)

(declare-fun e!74533 () Unit!3552)

(declare-fun lt!59672 () Unit!3552)

(assert (=> b!114511 (= e!74533 lt!59672)))

(declare-fun lt!59677 () ListLongMap!1577)

(assert (=> b!114511 (= lt!59677 (getCurrentListMapNoExtraKeys!123 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (_values!2665 (v!2990 (underlying!388 thiss!992))) (mask!6878 (v!2990 (underlying!388 thiss!992))) (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) (minValue!2549 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun lt!59678 () (_ BitVec 64))

(assert (=> b!114511 (= lt!59678 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59663 () (_ BitVec 64))

(assert (=> b!114511 (= lt!59663 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!59661 () Unit!3552)

(declare-fun addStillContains!79 (ListLongMap!1577 (_ BitVec 64) V!3289 (_ BitVec 64)) Unit!3552)

(assert (=> b!114511 (= lt!59661 (addStillContains!79 lt!59677 lt!59678 (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) lt!59663))))

(assert (=> b!114511 (contains!841 (+!156 lt!59677 (tuple2!2443 lt!59678 (zeroValue!2549 (v!2990 (underlying!388 thiss!992))))) lt!59663)))

(declare-fun lt!59671 () Unit!3552)

(assert (=> b!114511 (= lt!59671 lt!59661)))

(declare-fun lt!59670 () ListLongMap!1577)

(assert (=> b!114511 (= lt!59670 (getCurrentListMapNoExtraKeys!123 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (_values!2665 (v!2990 (underlying!388 thiss!992))) (mask!6878 (v!2990 (underlying!388 thiss!992))) (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) (minValue!2549 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun lt!59669 () (_ BitVec 64))

(assert (=> b!114511 (= lt!59669 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59680 () (_ BitVec 64))

(assert (=> b!114511 (= lt!59680 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!59666 () Unit!3552)

(declare-fun addApplyDifferent!79 (ListLongMap!1577 (_ BitVec 64) V!3289 (_ BitVec 64)) Unit!3552)

(assert (=> b!114511 (= lt!59666 (addApplyDifferent!79 lt!59670 lt!59669 (minValue!2549 (v!2990 (underlying!388 thiss!992))) lt!59680))))

(assert (=> b!114511 (= (apply!103 (+!156 lt!59670 (tuple2!2443 lt!59669 (minValue!2549 (v!2990 (underlying!388 thiss!992))))) lt!59680) (apply!103 lt!59670 lt!59680))))

(declare-fun lt!59667 () Unit!3552)

(assert (=> b!114511 (= lt!59667 lt!59666)))

(declare-fun lt!59668 () ListLongMap!1577)

(assert (=> b!114511 (= lt!59668 (getCurrentListMapNoExtraKeys!123 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (_values!2665 (v!2990 (underlying!388 thiss!992))) (mask!6878 (v!2990 (underlying!388 thiss!992))) (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) (minValue!2549 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun lt!59673 () (_ BitVec 64))

(assert (=> b!114511 (= lt!59673 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59681 () (_ BitVec 64))

(assert (=> b!114511 (= lt!59681 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!59682 () Unit!3552)

(assert (=> b!114511 (= lt!59682 (addApplyDifferent!79 lt!59668 lt!59673 (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) lt!59681))))

(assert (=> b!114511 (= (apply!103 (+!156 lt!59668 (tuple2!2443 lt!59673 (zeroValue!2549 (v!2990 (underlying!388 thiss!992))))) lt!59681) (apply!103 lt!59668 lt!59681))))

(declare-fun lt!59676 () Unit!3552)

(assert (=> b!114511 (= lt!59676 lt!59682)))

(declare-fun lt!59662 () ListLongMap!1577)

(assert (=> b!114511 (= lt!59662 (getCurrentListMapNoExtraKeys!123 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (_values!2665 (v!2990 (underlying!388 thiss!992))) (mask!6878 (v!2990 (underlying!388 thiss!992))) (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) (minValue!2549 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun lt!59665 () (_ BitVec 64))

(assert (=> b!114511 (= lt!59665 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59674 () (_ BitVec 64))

(assert (=> b!114511 (= lt!59674 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!114511 (= lt!59672 (addApplyDifferent!79 lt!59662 lt!59665 (minValue!2549 (v!2990 (underlying!388 thiss!992))) lt!59674))))

(assert (=> b!114511 (= (apply!103 (+!156 lt!59662 (tuple2!2443 lt!59665 (minValue!2549 (v!2990 (underlying!388 thiss!992))))) lt!59674) (apply!103 lt!59662 lt!59674))))

(declare-fun b!114512 () Bool)

(declare-fun e!74532 () Bool)

(assert (=> b!114512 (= e!74538 e!74532)))

(declare-fun res!56358 () Bool)

(assert (=> b!114512 (= res!56358 call!12271)))

(assert (=> b!114512 (=> (not res!56358) (not e!74532))))

(declare-fun b!114513 () Bool)

(assert (=> b!114513 (= e!74532 (= (apply!103 lt!59679 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2549 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun bm!12269 () Bool)

(declare-fun call!12272 () ListLongMap!1577)

(declare-fun call!12276 () ListLongMap!1577)

(assert (=> bm!12269 (= call!12272 call!12276)))

(declare-fun b!114515 () Bool)

(assert (=> b!114515 (= e!74539 e!74529)))

(declare-fun c!20442 () Bool)

(assert (=> b!114515 (= c!20442 (not (= (bvand (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!114516 () Bool)

(assert (=> b!114516 (= e!74535 (= (apply!103 lt!59679 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2549 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun b!114517 () Bool)

(declare-fun e!74530 () ListLongMap!1577)

(assert (=> b!114517 (= e!74530 e!74536)))

(declare-fun c!20438 () Bool)

(assert (=> b!114517 (= c!20438 (and (not (= (bvand (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!114518 () Bool)

(declare-fun c!20439 () Bool)

(assert (=> b!114518 (= c!20439 (and (not (= (bvand (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!114518 (= e!74536 e!74534)))

(declare-fun b!114519 () Bool)

(declare-fun e!74528 () Bool)

(assert (=> b!114519 (= e!74528 (= (apply!103 lt!59679 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1386 (select (arr!2109 (_values!2665 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!402 (defaultEntry!2682 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!114519 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2369 (_values!2665 (v!2990 (underlying!388 thiss!992))))))))

(assert (=> b!114519 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun b!114520 () Bool)

(assert (=> b!114520 (= e!74529 (not call!12274))))

(declare-fun b!114521 () Bool)

(declare-fun res!56365 () Bool)

(assert (=> b!114521 (=> (not res!56365) (not e!74539))))

(assert (=> b!114521 (= res!56365 e!74538)))

(declare-fun c!20440 () Bool)

(assert (=> b!114521 (= c!20440 (not (= (bvand (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!114522 () Bool)

(assert (=> b!114522 (= e!74534 call!12272)))

(declare-fun b!114523 () Bool)

(declare-fun call!12275 () ListLongMap!1577)

(assert (=> b!114523 (= e!74530 (+!156 call!12275 (tuple2!2443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun d!32413 () Bool)

(assert (=> d!32413 e!74539))

(declare-fun res!56362 () Bool)

(assert (=> d!32413 (=> (not res!56362) (not e!74539))))

(assert (=> d!32413 (= res!56362 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992))))))))))

(declare-fun lt!59664 () ListLongMap!1577)

(assert (=> d!32413 (= lt!59679 lt!59664)))

(declare-fun lt!59675 () Unit!3552)

(assert (=> d!32413 (= lt!59675 e!74533)))

(declare-fun c!20441 () Bool)

(declare-fun e!74537 () Bool)

(assert (=> d!32413 (= c!20441 e!74537)))

(declare-fun res!56363 () Bool)

(assert (=> d!32413 (=> (not res!56363) (not e!74537))))

(assert (=> d!32413 (= res!56363 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992))))))))

(assert (=> d!32413 (= lt!59664 e!74530)))

(declare-fun c!20437 () Bool)

(assert (=> d!32413 (= c!20437 (and (not (= (bvand (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32413 (validMask!0 (mask!6878 (v!2990 (underlying!388 thiss!992))))))

(assert (=> d!32413 (= (getCurrentListMap!486 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (_values!2665 (v!2990 (underlying!388 thiss!992))) (mask!6878 (v!2990 (underlying!388 thiss!992))) (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) (minValue!2549 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992)))) lt!59679)))

(declare-fun b!114514 () Bool)

(assert (=> b!114514 (= e!74531 e!74528)))

(declare-fun res!56364 () Bool)

(assert (=> b!114514 (=> (not res!56364) (not e!74528))))

(assert (=> b!114514 (= res!56364 (contains!841 lt!59679 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!114514 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun bm!12270 () Bool)

(declare-fun call!12277 () ListLongMap!1577)

(assert (=> bm!12270 (= call!12276 call!12277)))

(declare-fun bm!12271 () Bool)

(assert (=> bm!12271 (= call!12273 call!12275)))

(declare-fun b!114524 () Bool)

(assert (=> b!114524 (= e!74537 (validKeyInArray!0 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!12272 () Bool)

(assert (=> bm!12272 (= call!12277 (getCurrentListMapNoExtraKeys!123 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (_values!2665 (v!2990 (underlying!388 thiss!992))) (mask!6878 (v!2990 (underlying!388 thiss!992))) (extraKeys!2471 (v!2990 (underlying!388 thiss!992))) (zeroValue!2549 (v!2990 (underlying!388 thiss!992))) (minValue!2549 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun bm!12273 () Bool)

(assert (=> bm!12273 (= call!12275 (+!156 (ite c!20437 call!12277 (ite c!20438 call!12276 call!12272)) (ite (or c!20437 c!20438) (tuple2!2443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2549 (v!2990 (underlying!388 thiss!992)))) (tuple2!2443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2549 (v!2990 (underlying!388 thiss!992)))))))))

(declare-fun bm!12274 () Bool)

(assert (=> bm!12274 (= call!12271 (contains!841 lt!59679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!114525 () Bool)

(declare-fun Unit!3559 () Unit!3552)

(assert (=> b!114525 (= e!74533 Unit!3559)))

(declare-fun b!114526 () Bool)

(assert (=> b!114526 (= e!74540 (validKeyInArray!0 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!32413 c!20437) b!114523))

(assert (= (and d!32413 (not c!20437)) b!114517))

(assert (= (and b!114517 c!20438) b!114507))

(assert (= (and b!114517 (not c!20438)) b!114518))

(assert (= (and b!114518 c!20439) b!114510))

(assert (= (and b!114518 (not c!20439)) b!114522))

(assert (= (or b!114510 b!114522) bm!12269))

(assert (= (or b!114507 bm!12269) bm!12270))

(assert (= (or b!114507 b!114510) bm!12271))

(assert (= (or b!114523 bm!12270) bm!12272))

(assert (= (or b!114523 bm!12271) bm!12273))

(assert (= (and d!32413 res!56363) b!114524))

(assert (= (and d!32413 c!20441) b!114511))

(assert (= (and d!32413 (not c!20441)) b!114525))

(assert (= (and d!32413 res!56362) b!114508))

(assert (= (and b!114508 res!56366) b!114526))

(assert (= (and b!114508 (not res!56361)) b!114514))

(assert (= (and b!114514 res!56364) b!114519))

(assert (= (and b!114508 res!56359) b!114521))

(assert (= (and b!114521 c!20440) b!114512))

(assert (= (and b!114521 (not c!20440)) b!114506))

(assert (= (and b!114512 res!56358) b!114513))

(assert (= (or b!114512 b!114506) bm!12274))

(assert (= (and b!114521 res!56365) b!114515))

(assert (= (and b!114515 c!20442) b!114509))

(assert (= (and b!114515 (not c!20442)) b!114520))

(assert (= (and b!114509 res!56360) b!114516))

(assert (= (or b!114509 b!114520) bm!12268))

(declare-fun b_lambda!5121 () Bool)

(assert (=> (not b_lambda!5121) (not b!114519)))

(assert (=> b!114519 t!5849))

(declare-fun b_and!7077 () Bool)

(assert (= b_and!7073 (and (=> t!5849 result!3643) b_and!7077)))

(assert (=> b!114519 t!5851))

(declare-fun b_and!7079 () Bool)

(assert (= b_and!7075 (and (=> t!5851 result!3647) b_and!7079)))

(declare-fun m!130851 () Bool)

(assert (=> b!114516 m!130851))

(declare-fun m!130853 () Bool)

(assert (=> b!114523 m!130853))

(assert (=> d!32413 m!130751))

(declare-fun m!130855 () Bool)

(assert (=> b!114513 m!130855))

(declare-fun m!130857 () Bool)

(assert (=> b!114511 m!130857))

(declare-fun m!130859 () Bool)

(assert (=> b!114511 m!130859))

(declare-fun m!130861 () Bool)

(assert (=> b!114511 m!130861))

(declare-fun m!130863 () Bool)

(assert (=> b!114511 m!130863))

(declare-fun m!130865 () Bool)

(assert (=> b!114511 m!130865))

(assert (=> b!114511 m!130505))

(declare-fun m!130867 () Bool)

(assert (=> b!114511 m!130867))

(declare-fun m!130869 () Bool)

(assert (=> b!114511 m!130869))

(assert (=> b!114511 m!130859))

(declare-fun m!130871 () Bool)

(assert (=> b!114511 m!130871))

(assert (=> b!114511 m!130725))

(declare-fun m!130873 () Bool)

(assert (=> b!114511 m!130873))

(declare-fun m!130875 () Bool)

(assert (=> b!114511 m!130875))

(declare-fun m!130877 () Bool)

(assert (=> b!114511 m!130877))

(declare-fun m!130879 () Bool)

(assert (=> b!114511 m!130879))

(declare-fun m!130881 () Bool)

(assert (=> b!114511 m!130881))

(assert (=> b!114511 m!130875))

(declare-fun m!130883 () Bool)

(assert (=> b!114511 m!130883))

(assert (=> b!114511 m!130869))

(declare-fun m!130885 () Bool)

(assert (=> b!114511 m!130885))

(assert (=> b!114511 m!130863))

(declare-fun m!130887 () Bool)

(assert (=> bm!12274 m!130887))

(assert (=> b!114524 m!130725))

(assert (=> b!114524 m!130725))

(assert (=> b!114524 m!130727))

(assert (=> b!114514 m!130725))

(assert (=> b!114514 m!130725))

(declare-fun m!130889 () Bool)

(assert (=> b!114514 m!130889))

(declare-fun m!130891 () Bool)

(assert (=> bm!12273 m!130891))

(assert (=> b!114526 m!130725))

(assert (=> b!114526 m!130725))

(assert (=> b!114526 m!130727))

(assert (=> bm!12272 m!130505))

(assert (=> b!114519 m!130725))

(declare-fun m!130893 () Bool)

(assert (=> b!114519 m!130893))

(assert (=> b!114519 m!130523))

(assert (=> b!114519 m!130725))

(assert (=> b!114519 m!130739))

(assert (=> b!114519 m!130739))

(assert (=> b!114519 m!130523))

(assert (=> b!114519 m!130743))

(declare-fun m!130895 () Bool)

(assert (=> bm!12268 m!130895))

(assert (=> b!114230 d!32413))

(declare-fun d!32415 () Bool)

(declare-fun res!56367 () Bool)

(declare-fun e!74541 () Bool)

(assert (=> d!32415 (=> (not res!56367) (not e!74541))))

(assert (=> d!32415 (= res!56367 (simpleValid!79 (v!2990 (underlying!388 thiss!992))))))

(assert (=> d!32415 (= (valid!452 (v!2990 (underlying!388 thiss!992))) e!74541)))

(declare-fun b!114527 () Bool)

(declare-fun res!56368 () Bool)

(assert (=> b!114527 (=> (not res!56368) (not e!74541))))

(assert (=> b!114527 (= res!56368 (= (arrayCountValidKeys!0 (_keys!4404 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000000 (size!2368 (_keys!4404 (v!2990 (underlying!388 thiss!992))))) (_size!525 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun b!114528 () Bool)

(declare-fun res!56369 () Bool)

(assert (=> b!114528 (=> (not res!56369) (not e!74541))))

(assert (=> b!114528 (= res!56369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4404 (v!2990 (underlying!388 thiss!992))) (mask!6878 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun b!114529 () Bool)

(assert (=> b!114529 (= e!74541 (arrayNoDuplicates!0 (_keys!4404 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000000 Nil!1631))))

(assert (= (and d!32415 res!56367) b!114527))

(assert (= (and b!114527 res!56368) b!114528))

(assert (= (and b!114528 res!56369) b!114529))

(declare-fun m!130897 () Bool)

(assert (=> d!32415 m!130897))

(declare-fun m!130899 () Bool)

(assert (=> b!114527 m!130899))

(declare-fun m!130901 () Bool)

(assert (=> b!114528 m!130901))

(declare-fun m!130903 () Bool)

(assert (=> b!114529 m!130903))

(assert (=> b!114233 d!32415))

(declare-fun d!32417 () Bool)

(declare-fun e!74547 () Bool)

(assert (=> d!32417 e!74547))

(declare-fun res!56372 () Bool)

(assert (=> d!32417 (=> res!56372 e!74547)))

(declare-fun lt!59694 () Bool)

(assert (=> d!32417 (= res!56372 (not lt!59694))))

(declare-fun lt!59692 () Bool)

(assert (=> d!32417 (= lt!59694 lt!59692)))

(declare-fun lt!59693 () Unit!3552)

(declare-fun e!74546 () Unit!3552)

(assert (=> d!32417 (= lt!59693 e!74546)))

(declare-fun c!20445 () Bool)

(assert (=> d!32417 (= c!20445 lt!59692)))

(declare-fun containsKey!165 (List!1635 (_ BitVec 64)) Bool)

(assert (=> d!32417 (= lt!59692 (containsKey!165 (toList!804 lt!59428) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(assert (=> d!32417 (= (contains!841 lt!59428 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355)) lt!59694)))

(declare-fun b!114536 () Bool)

(declare-fun lt!59691 () Unit!3552)

(assert (=> b!114536 (= e!74546 lt!59691)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!113 (List!1635 (_ BitVec 64)) Unit!3552)

(assert (=> b!114536 (= lt!59691 (lemmaContainsKeyImpliesGetValueByKeyDefined!113 (toList!804 lt!59428) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun isDefined!114 (Option!168) Bool)

(assert (=> b!114536 (isDefined!114 (getValueByKey!162 (toList!804 lt!59428) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun b!114537 () Bool)

(declare-fun Unit!3560 () Unit!3552)

(assert (=> b!114537 (= e!74546 Unit!3560)))

(declare-fun b!114538 () Bool)

(assert (=> b!114538 (= e!74547 (isDefined!114 (getValueByKey!162 (toList!804 lt!59428) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355))))))

(assert (= (and d!32417 c!20445) b!114536))

(assert (= (and d!32417 (not c!20445)) b!114537))

(assert (= (and d!32417 (not res!56372)) b!114538))

(assert (=> d!32417 m!130483))

(declare-fun m!130905 () Bool)

(assert (=> d!32417 m!130905))

(assert (=> b!114536 m!130483))

(declare-fun m!130907 () Bool)

(assert (=> b!114536 m!130907))

(assert (=> b!114536 m!130483))

(declare-fun m!130909 () Bool)

(assert (=> b!114536 m!130909))

(assert (=> b!114536 m!130909))

(declare-fun m!130911 () Bool)

(assert (=> b!114536 m!130911))

(assert (=> b!114538 m!130483))

(assert (=> b!114538 m!130909))

(assert (=> b!114538 m!130909))

(assert (=> b!114538 m!130911))

(assert (=> b!114228 d!32417))

(declare-fun bm!12323 () Bool)

(declare-fun call!12341 () ListLongMap!1577)

(declare-fun call!12326 () ListLongMap!1577)

(assert (=> bm!12323 (= call!12341 call!12326)))

(declare-fun b!114624 () Bool)

(declare-fun call!12349 () ListLongMap!1577)

(declare-fun call!12329 () ListLongMap!1577)

(declare-fun e!74597 () Bool)

(assert (=> b!114624 (= e!74597 (= call!12349 (+!156 call!12329 (tuple2!2443 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427))))))

(declare-fun b!114625 () Bool)

(declare-fun lt!59771 () Unit!3552)

(declare-fun lt!59754 () Unit!3552)

(assert (=> b!114625 (= lt!59771 lt!59754)))

(declare-fun call!12343 () ListLongMap!1577)

(declare-fun call!12348 () ListLongMap!1577)

(assert (=> b!114625 (= call!12343 call!12348)))

(declare-fun lt!59757 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!52 (array!4449 array!4451 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 V!3289 Int) Unit!3552)

(assert (=> b!114625 (= lt!59754 (lemmaChangeLongMinValueKeyThenAddPairToListMap!52 (_keys!4404 newMap!16) (_values!2665 newMap!16) (mask!6878 newMap!16) (extraKeys!2471 newMap!16) lt!59757 (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) lt!59427 (defaultEntry!2682 newMap!16)))))

(assert (=> b!114625 (= lt!59757 (bvor (extraKeys!2471 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!74608 () tuple2!2440)

(assert (=> b!114625 (= e!74608 (tuple2!2441 true (LongMapFixedSize!953 (defaultEntry!2682 newMap!16) (mask!6878 newMap!16) (bvor (extraKeys!2471 newMap!16) #b00000000000000000000000000000010) (zeroValue!2549 newMap!16) lt!59427 (_size!525 newMap!16) (_keys!4404 newMap!16) (_values!2665 newMap!16) (_vacant!525 newMap!16))))))

(declare-datatypes ((SeekEntryResult!258 0))(
  ( (MissingZero!258 (index!3185 (_ BitVec 32))) (Found!258 (index!3186 (_ BitVec 32))) (Intermediate!258 (undefined!1070 Bool) (index!3187 (_ BitVec 32)) (x!14310 (_ BitVec 32))) (Undefined!258) (MissingVacant!258 (index!3188 (_ BitVec 32))) )
))
(declare-fun lt!59768 () SeekEntryResult!258)

(declare-fun e!74592 () Bool)

(declare-fun b!114626 () Bool)

(assert (=> b!114626 (= e!74592 (= (select (arr!2108 (_keys!4404 newMap!16)) (index!3186 lt!59768)) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun b!114627 () Bool)

(declare-fun c!20479 () Bool)

(declare-fun lt!59774 () SeekEntryResult!258)

(assert (=> b!114627 (= c!20479 ((_ is MissingVacant!258) lt!59774))))

(declare-fun e!74602 () Bool)

(declare-fun e!74609 () Bool)

(assert (=> b!114627 (= e!74602 e!74609)))

(declare-fun call!12333 () Bool)

(declare-fun c!20487 () Bool)

(declare-fun c!20478 () Bool)

(declare-fun c!20481 () Bool)

(declare-fun c!20474 () Bool)

(declare-fun lt!59751 () SeekEntryResult!258)

(declare-fun lt!59752 () SeekEntryResult!258)

(declare-fun c!20486 () Bool)

(declare-fun bm!12324 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!12324 (= call!12333 (inRange!0 (ite c!20481 (ite c!20487 (index!3186 lt!59751) (ite c!20486 (index!3185 lt!59752) (index!3188 lt!59752))) (ite c!20478 (index!3186 lt!59768) (ite c!20474 (index!3185 lt!59774) (index!3188 lt!59774)))) (mask!6878 newMap!16)))))

(declare-fun b!114628 () Bool)

(declare-fun e!74599 () Bool)

(declare-fun call!12332 () Bool)

(assert (=> b!114628 (= e!74599 (not call!12332))))

(declare-fun b!114629 () Bool)

(declare-fun e!74611 () Bool)

(assert (=> b!114629 (= e!74611 e!74597)))

(declare-fun res!56407 () Bool)

(assert (=> b!114629 (= res!56407 (contains!841 call!12349 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(assert (=> b!114629 (=> (not res!56407) (not e!74597))))

(declare-fun d!32419 () Bool)

(declare-fun e!74594 () Bool)

(assert (=> d!32419 e!74594))

(declare-fun res!56404 () Bool)

(assert (=> d!32419 (=> (not res!56404) (not e!74594))))

(declare-fun lt!59775 () tuple2!2440)

(assert (=> d!32419 (= res!56404 (valid!452 (_2!1231 lt!59775)))))

(declare-fun e!74610 () tuple2!2440)

(assert (=> d!32419 (= lt!59775 e!74610)))

(declare-fun c!20477 () Bool)

(assert (=> d!32419 (= c!20477 (= (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (bvneg (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355))))))

(assert (=> d!32419 (valid!452 newMap!16)))

(assert (=> d!32419 (= (update!176 newMap!16 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427) lt!59775)))

(declare-fun b!114623 () Bool)

(declare-fun e!74598 () ListLongMap!1577)

(assert (=> b!114623 (= e!74598 (getCurrentListMap!486 (_keys!4404 newMap!16) (_values!2665 newMap!16) (mask!6878 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2682 newMap!16)))))

(declare-fun b!114630 () Bool)

(declare-fun res!56411 () Bool)

(declare-fun call!12342 () Bool)

(assert (=> b!114630 (= res!56411 call!12342)))

(declare-fun e!74612 () Bool)

(assert (=> b!114630 (=> (not res!56411) (not e!74612))))

(declare-fun bm!12325 () Bool)

(declare-fun lt!59773 () SeekEntryResult!258)

(declare-fun c!20485 () Bool)

(declare-fun call!12339 () tuple2!2440)

(declare-fun updateHelperNewKey!52 (LongMapFixedSize!952 (_ BitVec 64) V!3289 (_ BitVec 32)) tuple2!2440)

(assert (=> bm!12325 (= call!12339 (updateHelperNewKey!52 newMap!16 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427 (ite c!20485 (index!3188 lt!59773) (index!3185 lt!59773))))))

(declare-fun b!114631 () Bool)

(declare-fun lt!59758 () Unit!3552)

(declare-fun lt!59763 () Unit!3552)

(assert (=> b!114631 (= lt!59758 lt!59763)))

(assert (=> b!114631 (= call!12343 call!12341)))

(declare-fun lt!59756 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!52 (array!4449 array!4451 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 V!3289 Int) Unit!3552)

(assert (=> b!114631 (= lt!59763 (lemmaChangeZeroKeyThenAddPairToListMap!52 (_keys!4404 newMap!16) (_values!2665 newMap!16) (mask!6878 newMap!16) (extraKeys!2471 newMap!16) lt!59756 (zeroValue!2549 newMap!16) lt!59427 (minValue!2549 newMap!16) (defaultEntry!2682 newMap!16)))))

(assert (=> b!114631 (= lt!59756 (bvor (extraKeys!2471 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!114631 (= e!74608 (tuple2!2441 true (LongMapFixedSize!953 (defaultEntry!2682 newMap!16) (mask!6878 newMap!16) (bvor (extraKeys!2471 newMap!16) #b00000000000000000000000000000001) lt!59427 (minValue!2549 newMap!16) (_size!525 newMap!16) (_keys!4404 newMap!16) (_values!2665 newMap!16) (_vacant!525 newMap!16))))))

(declare-fun b!114632 () Bool)

(declare-fun res!56406 () Bool)

(declare-fun e!74593 () Bool)

(assert (=> b!114632 (=> (not res!56406) (not e!74593))))

(declare-fun call!12338 () Bool)

(assert (=> b!114632 (= res!56406 call!12338)))

(assert (=> b!114632 (= e!74602 e!74593)))

(declare-fun b!114633 () Bool)

(declare-fun e!74601 () Unit!3552)

(declare-fun Unit!3561 () Unit!3552)

(assert (=> b!114633 (= e!74601 Unit!3561)))

(declare-fun lt!59755 () Unit!3552)

(declare-fun call!12336 () Unit!3552)

(assert (=> b!114633 (= lt!59755 call!12336)))

(declare-fun call!12330 () SeekEntryResult!258)

(assert (=> b!114633 (= lt!59774 call!12330)))

(assert (=> b!114633 (= c!20474 ((_ is MissingZero!258) lt!59774))))

(assert (=> b!114633 e!74602))

(declare-fun lt!59761 () Unit!3552)

(assert (=> b!114633 (= lt!59761 lt!59755)))

(assert (=> b!114633 false))

(declare-fun bm!12326 () Bool)

(declare-fun call!12331 () Bool)

(assert (=> bm!12326 (= call!12338 call!12331)))

(declare-fun c!20484 () Bool)

(declare-fun bm!12327 () Bool)

(assert (=> bm!12327 (= call!12326 (getCurrentListMap!486 (_keys!4404 newMap!16) (ite (or c!20477 c!20481) (_values!2665 newMap!16) (array!4452 (store (arr!2109 (_values!2665 newMap!16)) (index!3186 lt!59773) (ValueCellFull!1022 lt!59427)) (size!2369 (_values!2665 newMap!16)))) (mask!6878 newMap!16) (ite (and c!20477 c!20484) lt!59756 (extraKeys!2471 newMap!16)) (ite (and c!20477 c!20484) lt!59427 (zeroValue!2549 newMap!16)) (minValue!2549 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2682 newMap!16)))))

(declare-fun b!114634 () Bool)

(declare-fun res!56414 () Bool)

(assert (=> b!114634 (=> (not res!56414) (not e!74593))))

(assert (=> b!114634 (= res!56414 (= (select (arr!2108 (_keys!4404 newMap!16)) (index!3185 lt!59774)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!114635 () Bool)

(declare-fun e!74596 () Bool)

(assert (=> b!114635 (= e!74609 e!74596)))

(declare-fun res!56413 () Bool)

(assert (=> b!114635 (= res!56413 call!12338)))

(assert (=> b!114635 (=> (not res!56413) (not e!74596))))

(declare-fun b!114636 () Bool)

(declare-fun lt!59750 () Unit!3552)

(declare-fun e!74595 () Unit!3552)

(assert (=> b!114636 (= lt!59750 e!74595)))

(declare-fun call!12344 () Bool)

(assert (=> b!114636 (= c!20487 call!12344)))

(declare-fun e!74606 () tuple2!2440)

(assert (=> b!114636 (= e!74606 (tuple2!2441 false newMap!16))))

(declare-fun call!12340 () Unit!3552)

(declare-fun bm!12328 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!52 (array!4449 array!4451 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 64) Int) Unit!3552)

(assert (=> bm!12328 (= call!12340 (lemmaInListMapThenSeekEntryOrOpenFindsIt!52 (_keys!4404 newMap!16) (_values!2665 newMap!16) (mask!6878 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (defaultEntry!2682 newMap!16)))))

(declare-fun lt!59762 () array!4451)

(declare-fun bm!12329 () Bool)

(declare-fun call!12327 () ListLongMap!1577)

(assert (=> bm!12329 (= call!12327 (getCurrentListMap!486 (_keys!4404 newMap!16) (ite c!20477 (_values!2665 newMap!16) lt!59762) (mask!6878 newMap!16) (ite c!20477 (ite c!20484 (extraKeys!2471 newMap!16) lt!59757) (extraKeys!2471 newMap!16)) (zeroValue!2549 newMap!16) (ite c!20477 (ite c!20484 (minValue!2549 newMap!16) lt!59427) (minValue!2549 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2682 newMap!16)))))

(declare-fun call!12345 () ListLongMap!1577)

(declare-fun bm!12330 () Bool)

(assert (=> bm!12330 (= call!12345 (+!156 e!74598 (ite c!20477 (ite c!20484 (tuple2!2443 #b0000000000000000000000000000000000000000000000000000000000000000 lt!59427) (tuple2!2443 #b1000000000000000000000000000000000000000000000000000000000000000 lt!59427)) (tuple2!2443 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427))))))

(declare-fun c!20475 () Bool)

(assert (=> bm!12330 (= c!20475 c!20477)))

(declare-fun bm!12331 () Bool)

(declare-fun call!12334 () Bool)

(declare-fun call!12346 () Bool)

(assert (=> bm!12331 (= call!12334 call!12346)))

(declare-fun b!114637 () Bool)

(declare-fun res!56402 () Bool)

(assert (=> b!114637 (= res!56402 (= (select (arr!2108 (_keys!4404 newMap!16)) (index!3188 lt!59752)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!74605 () Bool)

(assert (=> b!114637 (=> (not res!56402) (not e!74605))))

(declare-fun b!114638 () Bool)

(assert (=> b!114638 (= e!74596 (not call!12334))))

(declare-fun bm!12332 () Bool)

(assert (=> bm!12332 (= call!12346 (arrayContainsKey!0 (_keys!4404 newMap!16) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!114639 () Bool)

(declare-fun lt!59759 () Unit!3552)

(assert (=> b!114639 (= e!74595 lt!59759)))

(assert (=> b!114639 (= lt!59759 call!12336)))

(declare-fun call!12347 () SeekEntryResult!258)

(assert (=> b!114639 (= lt!59752 call!12347)))

(assert (=> b!114639 (= c!20486 ((_ is MissingZero!258) lt!59752))))

(declare-fun e!74603 () Bool)

(assert (=> b!114639 e!74603))

(declare-fun b!114640 () Bool)

(declare-fun Unit!3562 () Unit!3552)

(assert (=> b!114640 (= e!74595 Unit!3562)))

(declare-fun lt!59760 () Unit!3552)

(assert (=> b!114640 (= lt!59760 call!12340)))

(assert (=> b!114640 (= lt!59751 call!12347)))

(declare-fun res!56405 () Bool)

(assert (=> b!114640 (= res!56405 ((_ is Found!258) lt!59751))))

(assert (=> b!114640 (=> (not res!56405) (not e!74612))))

(assert (=> b!114640 e!74612))

(declare-fun lt!59764 () Unit!3552)

(assert (=> b!114640 (= lt!59764 lt!59760)))

(assert (=> b!114640 false))

(declare-fun b!114641 () Bool)

(assert (=> b!114641 (= e!74605 (not call!12332))))

(declare-fun bm!12333 () Bool)

(declare-fun call!12328 () SeekEntryResult!258)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4449 (_ BitVec 32)) SeekEntryResult!258)

(assert (=> bm!12333 (= call!12328 (seekEntryOrOpen!0 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (_keys!4404 newMap!16) (mask!6878 newMap!16)))))

(declare-fun b!114642 () Bool)

(declare-fun res!56408 () Bool)

(assert (=> b!114642 (= res!56408 call!12331)))

(assert (=> b!114642 (=> (not res!56408) (not e!74592))))

(declare-fun b!114643 () Bool)

(assert (=> b!114643 (= e!74593 (not call!12334))))

(declare-fun bm!12334 () Bool)

(assert (=> bm!12334 (= call!12331 call!12333)))

(declare-fun bm!12335 () Bool)

(declare-fun c!20476 () Bool)

(assert (=> bm!12335 (= c!20476 c!20481)))

(declare-fun e!74613 () ListLongMap!1577)

(assert (=> bm!12335 (= call!12344 (contains!841 e!74613 (ite c!20481 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (select (arr!2108 (_keys!4404 newMap!16)) (index!3186 lt!59773)))))))

(declare-fun bm!12336 () Bool)

(declare-fun call!12337 () ListLongMap!1577)

(assert (=> bm!12336 (= call!12337 call!12326)))

(declare-fun bm!12337 () Bool)

(assert (=> bm!12337 (= call!12347 call!12328)))

(declare-fun bm!12338 () Bool)

(assert (=> bm!12338 (= call!12342 call!12333)))

(declare-fun b!114644 () Bool)

(declare-fun lt!59770 () tuple2!2440)

(assert (=> b!114644 (= lt!59770 call!12339)))

(declare-fun e!74604 () tuple2!2440)

(assert (=> b!114644 (= e!74604 (tuple2!2441 (_1!1231 lt!59770) (_2!1231 lt!59770)))))

(declare-fun b!114645 () Bool)

(assert (=> b!114645 (= e!74611 (= call!12349 call!12329))))

(declare-fun b!114646 () Bool)

(assert (=> b!114646 (= c!20485 ((_ is MissingVacant!258) lt!59773))))

(declare-fun e!74600 () tuple2!2440)

(assert (=> b!114646 (= e!74606 e!74600)))

(declare-fun b!114647 () Bool)

(declare-fun lt!59766 () tuple2!2440)

(assert (=> b!114647 (= e!74600 (tuple2!2441 (_1!1231 lt!59766) (_2!1231 lt!59766)))))

(assert (=> b!114647 (= lt!59766 call!12339)))

(declare-fun b!114648 () Bool)

(declare-fun lt!59772 () Unit!3552)

(declare-fun lt!59769 () Unit!3552)

(assert (=> b!114648 (= lt!59772 lt!59769)))

(assert (=> b!114648 call!12344))

(declare-fun lemmaValidKeyInArrayIsInListMap!112 (array!4449 array!4451 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 32) Int) Unit!3552)

(assert (=> b!114648 (= lt!59769 (lemmaValidKeyInArrayIsInListMap!112 (_keys!4404 newMap!16) lt!59762 (mask!6878 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) (index!3186 lt!59773) (defaultEntry!2682 newMap!16)))))

(assert (=> b!114648 (= lt!59762 (array!4452 (store (arr!2109 (_values!2665 newMap!16)) (index!3186 lt!59773) (ValueCellFull!1022 lt!59427)) (size!2369 (_values!2665 newMap!16))))))

(declare-fun lt!59749 () Unit!3552)

(declare-fun lt!59753 () Unit!3552)

(assert (=> b!114648 (= lt!59749 lt!59753)))

(assert (=> b!114648 (= call!12345 call!12337)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!52 (array!4449 array!4451 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 32) (_ BitVec 64) V!3289 Int) Unit!3552)

(assert (=> b!114648 (= lt!59753 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!52 (_keys!4404 newMap!16) (_values!2665 newMap!16) (mask!6878 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) (index!3186 lt!59773) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59427 (defaultEntry!2682 newMap!16)))))

(declare-fun lt!59767 () Unit!3552)

(assert (=> b!114648 (= lt!59767 e!74601)))

(assert (=> b!114648 (= c!20478 (contains!841 (getCurrentListMap!486 (_keys!4404 newMap!16) (_values!2665 newMap!16) (mask!6878 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2682 newMap!16)) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(assert (=> b!114648 (= e!74604 (tuple2!2441 true (LongMapFixedSize!953 (defaultEntry!2682 newMap!16) (mask!6878 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) (_size!525 newMap!16) (_keys!4404 newMap!16) (array!4452 (store (arr!2109 (_values!2665 newMap!16)) (index!3186 lt!59773) (ValueCellFull!1022 lt!59427)) (size!2369 (_values!2665 newMap!16))) (_vacant!525 newMap!16))))))

(declare-fun b!114649 () Bool)

(declare-fun res!56410 () Bool)

(assert (=> b!114649 (=> (not res!56410) (not e!74599))))

(assert (=> b!114649 (= res!56410 (= (select (arr!2108 (_keys!4404 newMap!16)) (index!3185 lt!59752)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12339 () Bool)

(assert (=> bm!12339 (= call!12348 call!12327)))

(declare-fun bm!12340 () Bool)

(assert (=> bm!12340 (= call!12330 call!12328)))

(declare-fun bm!12341 () Bool)

(assert (=> bm!12341 (= call!12329 (map!1318 newMap!16))))

(declare-fun b!114650 () Bool)

(assert (=> b!114650 (= e!74609 ((_ is Undefined!258) lt!59774))))

(declare-fun b!114651 () Bool)

(assert (=> b!114651 (= e!74610 e!74608)))

(assert (=> b!114651 (= c!20484 (= (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!114652 () Bool)

(assert (=> b!114652 (= e!74600 e!74604)))

(declare-fun c!20482 () Bool)

(assert (=> b!114652 (= c!20482 ((_ is MissingZero!258) lt!59773))))

(declare-fun bm!12342 () Bool)

(assert (=> bm!12342 (= call!12332 call!12346)))

(declare-fun bm!12343 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!52 (array!4449 array!4451 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 64) Int) Unit!3552)

(assert (=> bm!12343 (= call!12336 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!52 (_keys!4404 newMap!16) (_values!2665 newMap!16) (mask!6878 newMap!16) (extraKeys!2471 newMap!16) (zeroValue!2549 newMap!16) (minValue!2549 newMap!16) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (defaultEntry!2682 newMap!16)))))

(declare-fun b!114653 () Bool)

(declare-fun res!56409 () Bool)

(assert (=> b!114653 (= res!56409 (= (select (arr!2108 (_keys!4404 newMap!16)) (index!3188 lt!59774)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!114653 (=> (not res!56409) (not e!74596))))

(declare-fun bm!12344 () Bool)

(assert (=> bm!12344 (= call!12343 call!12345)))

(declare-fun b!114654 () Bool)

(declare-fun c!20480 () Bool)

(assert (=> b!114654 (= c!20480 ((_ is MissingVacant!258) lt!59752))))

(declare-fun e!74607 () Bool)

(assert (=> b!114654 (= e!74603 e!74607)))

(declare-fun b!114655 () Bool)

(assert (=> b!114655 (= e!74594 e!74611)))

(declare-fun c!20483 () Bool)

(assert (=> b!114655 (= c!20483 (_1!1231 lt!59775))))

(declare-fun b!114656 () Bool)

(assert (=> b!114656 (= e!74612 (= (select (arr!2108 (_keys!4404 newMap!16)) (index!3186 lt!59751)) (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun bm!12345 () Bool)

(assert (=> bm!12345 (= call!12349 (map!1318 (_2!1231 lt!59775)))))

(declare-fun bm!12346 () Bool)

(declare-fun call!12335 () Bool)

(assert (=> bm!12346 (= call!12335 call!12342)))

(declare-fun b!114657 () Bool)

(assert (=> b!114657 (= e!74613 call!12337)))

(declare-fun b!114658 () Bool)

(assert (=> b!114658 (= e!74607 e!74605)))

(declare-fun res!56412 () Bool)

(assert (=> b!114658 (= res!56412 call!12335)))

(assert (=> b!114658 (=> (not res!56412) (not e!74605))))

(declare-fun b!114659 () Bool)

(assert (=> b!114659 (= e!74613 call!12327)))

(declare-fun b!114660 () Bool)

(assert (=> b!114660 (= e!74610 e!74606)))

(assert (=> b!114660 (= lt!59773 (seekEntryOrOpen!0 (select (arr!2108 (_keys!4404 (v!2990 (underlying!388 thiss!992)))) from!355) (_keys!4404 newMap!16) (mask!6878 newMap!16)))))

(assert (=> b!114660 (= c!20481 ((_ is Undefined!258) lt!59773))))

(declare-fun b!114661 () Bool)

(declare-fun lt!59765 () Unit!3552)

(assert (=> b!114661 (= e!74601 lt!59765)))

(assert (=> b!114661 (= lt!59765 call!12340)))

(assert (=> b!114661 (= lt!59768 call!12330)))

(declare-fun res!56403 () Bool)

(assert (=> b!114661 (= res!56403 ((_ is Found!258) lt!59768))))

(assert (=> b!114661 (=> (not res!56403) (not e!74592))))

(assert (=> b!114661 e!74592))

(declare-fun b!114662 () Bool)

(assert (=> b!114662 (= e!74607 ((_ is Undefined!258) lt!59752))))

(declare-fun b!114663 () Bool)

(declare-fun res!56401 () Bool)

(assert (=> b!114663 (=> (not res!56401) (not e!74599))))

(assert (=> b!114663 (= res!56401 call!12335)))

(assert (=> b!114663 (= e!74603 e!74599)))

(declare-fun b!114664 () Bool)

(assert (=> b!114664 (= e!74598 (ite c!20484 call!12348 call!12341))))

(assert (= (and d!32419 c!20477) b!114651))

(assert (= (and d!32419 (not c!20477)) b!114660))

(assert (= (and b!114651 c!20484) b!114631))

(assert (= (and b!114651 (not c!20484)) b!114625))

(assert (= (or b!114631 b!114625) bm!12339))

(assert (= (or b!114631 b!114625) bm!12323))

(assert (= (or b!114631 b!114625) bm!12344))

(assert (= (and b!114660 c!20481) b!114636))

(assert (= (and b!114660 (not c!20481)) b!114646))

(assert (= (and b!114636 c!20487) b!114640))

(assert (= (and b!114636 (not c!20487)) b!114639))

(assert (= (and b!114640 res!56405) b!114630))

(assert (= (and b!114630 res!56411) b!114656))

(assert (= (and b!114639 c!20486) b!114663))

(assert (= (and b!114639 (not c!20486)) b!114654))

(assert (= (and b!114663 res!56401) b!114649))

(assert (= (and b!114649 res!56410) b!114628))

(assert (= (and b!114654 c!20480) b!114658))

(assert (= (and b!114654 (not c!20480)) b!114662))

(assert (= (and b!114658 res!56412) b!114637))

(assert (= (and b!114637 res!56402) b!114641))

(assert (= (or b!114663 b!114658) bm!12346))

(assert (= (or b!114628 b!114641) bm!12342))

(assert (= (or b!114630 bm!12346) bm!12338))

(assert (= (or b!114640 b!114639) bm!12337))

(assert (= (and b!114646 c!20485) b!114647))

(assert (= (and b!114646 (not c!20485)) b!114652))

(assert (= (and b!114652 c!20482) b!114644))

(assert (= (and b!114652 (not c!20482)) b!114648))

(assert (= (and b!114648 c!20478) b!114661))

(assert (= (and b!114648 (not c!20478)) b!114633))

(assert (= (and b!114661 res!56403) b!114642))

(assert (= (and b!114642 res!56408) b!114626))

(assert (= (and b!114633 c!20474) b!114632))

(assert (= (and b!114633 (not c!20474)) b!114627))

(assert (= (and b!114632 res!56406) b!114634))

(assert (= (and b!114634 res!56414) b!114643))

(assert (= (and b!114627 c!20479) b!114635))

(assert (= (and b!114627 (not c!20479)) b!114650))

(assert (= (and b!114635 res!56413) b!114653))

(assert (= (and b!114653 res!56409) b!114638))

(assert (= (or b!114632 b!114635) bm!12326))

(assert (= (or b!114643 b!114638) bm!12331))

(assert (= (or b!114642 bm!12326) bm!12334))

(assert (= (or b!114661 b!114633) bm!12340))

(assert (= (or b!114647 b!114644) bm!12325))

(assert (= (or b!114636 b!114648) bm!12336))

(assert (= (or bm!12338 bm!12334) bm!12324))

(assert (= (or bm!12342 bm!12331) bm!12332))

(assert (= (or b!114640 b!114661) bm!12328))

(assert (= (or bm!12337 bm!12340) bm!12333))

(assert (= (or b!114639 b!114633) bm!12343))

(assert (= (or b!114636 b!114648) bm!12335))

(assert (= (and bm!12335 c!20476) b!114657))

(assert (= (and bm!12335 (not c!20476)) b!114659))

(assert (= (or bm!12323 bm!12336) bm!12327))

(assert (= (or bm!12339 b!114659) bm!12329))

(assert (= (or bm!12344 b!114648) bm!12330))

(assert (= (and bm!12330 c!20475) b!114664))

(assert (= (and bm!12330 (not c!20475)) b!114623))

(assert (= (and d!32419 res!56404) b!114655))

(assert (= (and b!114655 c!20483) b!114629))

(assert (= (and b!114655 (not c!20483)) b!114645))

(assert (= (and b!114629 res!56407) b!114624))

(assert (= (or b!114629 b!114624 b!114645) bm!12345))

(assert (= (or b!114624 b!114645) bm!12341))

(assert (=> bm!12328 m!130483))

(declare-fun m!130913 () Bool)

(assert (=> bm!12328 m!130913))

(assert (=> bm!12333 m!130483))

(declare-fun m!130915 () Bool)

(assert (=> bm!12333 m!130915))

(assert (=> b!114629 m!130483))

(declare-fun m!130917 () Bool)

(assert (=> b!114629 m!130917))

(declare-fun m!130919 () Bool)

(assert (=> bm!12324 m!130919))

(declare-fun m!130921 () Bool)

(assert (=> b!114656 m!130921))

(declare-fun m!130923 () Bool)

(assert (=> b!114624 m!130923))

(assert (=> b!114623 m!130849))

(declare-fun m!130925 () Bool)

(assert (=> bm!12329 m!130925))

(declare-fun m!130927 () Bool)

(assert (=> b!114649 m!130927))

(declare-fun m!130929 () Bool)

(assert (=> bm!12330 m!130929))

(assert (=> bm!12343 m!130483))

(declare-fun m!130931 () Bool)

(assert (=> bm!12343 m!130931))

(declare-fun m!130933 () Bool)

(assert (=> b!114625 m!130933))

(declare-fun m!130935 () Bool)

(assert (=> b!114653 m!130935))

(declare-fun m!130937 () Bool)

(assert (=> b!114634 m!130937))

(declare-fun m!130939 () Bool)

(assert (=> bm!12345 m!130939))

(declare-fun m!130941 () Bool)

(assert (=> d!32419 m!130941))

(assert (=> d!32419 m!130515))

(declare-fun m!130943 () Bool)

(assert (=> bm!12327 m!130943))

(declare-fun m!130945 () Bool)

(assert (=> bm!12327 m!130945))

(declare-fun m!130947 () Bool)

(assert (=> b!114626 m!130947))

(declare-fun m!130949 () Bool)

(assert (=> b!114631 m!130949))

(declare-fun m!130951 () Bool)

(assert (=> b!114637 m!130951))

(assert (=> bm!12325 m!130483))

(declare-fun m!130953 () Bool)

(assert (=> bm!12325 m!130953))

(assert (=> bm!12341 m!130527))

(assert (=> bm!12332 m!130483))

(declare-fun m!130955 () Bool)

(assert (=> bm!12332 m!130955))

(assert (=> b!114660 m!130483))

(assert (=> b!114660 m!130915))

(declare-fun m!130957 () Bool)

(assert (=> bm!12335 m!130957))

(declare-fun m!130959 () Bool)

(assert (=> bm!12335 m!130959))

(declare-fun m!130961 () Bool)

(assert (=> b!114648 m!130961))

(assert (=> b!114648 m!130483))

(declare-fun m!130963 () Bool)

(assert (=> b!114648 m!130963))

(assert (=> b!114648 m!130943))

(assert (=> b!114648 m!130849))

(assert (=> b!114648 m!130849))

(assert (=> b!114648 m!130483))

(declare-fun m!130965 () Bool)

(assert (=> b!114648 m!130965))

(assert (=> b!114228 d!32419))

(declare-fun condMapEmpty!4137 () Bool)

(declare-fun mapDefault!4137 () ValueCell!1022)

(assert (=> mapNonEmpty!4122 (= condMapEmpty!4137 (= mapRest!4122 ((as const (Array (_ BitVec 32) ValueCell!1022)) mapDefault!4137)))))

(declare-fun e!74619 () Bool)

(declare-fun mapRes!4137 () Bool)

(assert (=> mapNonEmpty!4122 (= tp!10247 (and e!74619 mapRes!4137))))

(declare-fun b!114671 () Bool)

(declare-fun e!74618 () Bool)

(assert (=> b!114671 (= e!74618 tp_is_empty!2731)))

(declare-fun mapNonEmpty!4137 () Bool)

(declare-fun tp!10275 () Bool)

(assert (=> mapNonEmpty!4137 (= mapRes!4137 (and tp!10275 e!74618))))

(declare-fun mapValue!4137 () ValueCell!1022)

(declare-fun mapKey!4137 () (_ BitVec 32))

(declare-fun mapRest!4137 () (Array (_ BitVec 32) ValueCell!1022))

(assert (=> mapNonEmpty!4137 (= mapRest!4122 (store mapRest!4137 mapKey!4137 mapValue!4137))))

(declare-fun mapIsEmpty!4137 () Bool)

(assert (=> mapIsEmpty!4137 mapRes!4137))

(declare-fun b!114672 () Bool)

(assert (=> b!114672 (= e!74619 tp_is_empty!2731)))

(assert (= (and mapNonEmpty!4122 condMapEmpty!4137) mapIsEmpty!4137))

(assert (= (and mapNonEmpty!4122 (not condMapEmpty!4137)) mapNonEmpty!4137))

(assert (= (and mapNonEmpty!4137 ((_ is ValueCellFull!1022) mapValue!4137)) b!114671))

(assert (= (and mapNonEmpty!4122 ((_ is ValueCellFull!1022) mapDefault!4137)) b!114672))

(declare-fun m!130967 () Bool)

(assert (=> mapNonEmpty!4137 m!130967))

(declare-fun condMapEmpty!4138 () Bool)

(declare-fun mapDefault!4138 () ValueCell!1022)

(assert (=> mapNonEmpty!4121 (= condMapEmpty!4138 (= mapRest!4121 ((as const (Array (_ BitVec 32) ValueCell!1022)) mapDefault!4138)))))

(declare-fun e!74621 () Bool)

(declare-fun mapRes!4138 () Bool)

(assert (=> mapNonEmpty!4121 (= tp!10245 (and e!74621 mapRes!4138))))

(declare-fun b!114673 () Bool)

(declare-fun e!74620 () Bool)

(assert (=> b!114673 (= e!74620 tp_is_empty!2731)))

(declare-fun mapNonEmpty!4138 () Bool)

(declare-fun tp!10276 () Bool)

(assert (=> mapNonEmpty!4138 (= mapRes!4138 (and tp!10276 e!74620))))

(declare-fun mapKey!4138 () (_ BitVec 32))

(declare-fun mapRest!4138 () (Array (_ BitVec 32) ValueCell!1022))

(declare-fun mapValue!4138 () ValueCell!1022)

(assert (=> mapNonEmpty!4138 (= mapRest!4121 (store mapRest!4138 mapKey!4138 mapValue!4138))))

(declare-fun mapIsEmpty!4138 () Bool)

(assert (=> mapIsEmpty!4138 mapRes!4138))

(declare-fun b!114674 () Bool)

(assert (=> b!114674 (= e!74621 tp_is_empty!2731)))

(assert (= (and mapNonEmpty!4121 condMapEmpty!4138) mapIsEmpty!4138))

(assert (= (and mapNonEmpty!4121 (not condMapEmpty!4138)) mapNonEmpty!4138))

(assert (= (and mapNonEmpty!4138 ((_ is ValueCellFull!1022) mapValue!4138)) b!114673))

(assert (= (and mapNonEmpty!4121 ((_ is ValueCellFull!1022) mapDefault!4138)) b!114674))

(declare-fun m!130969 () Bool)

(assert (=> mapNonEmpty!4138 m!130969))

(declare-fun b_lambda!5123 () Bool)

(assert (= b_lambda!5117 (or (and b!114232 b_free!2629) (and b!114219 b_free!2631 (= (defaultEntry!2682 newMap!16) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992))))) b_lambda!5123)))

(declare-fun b_lambda!5125 () Bool)

(assert (= b_lambda!5121 (or (and b!114232 b_free!2629) (and b!114219 b_free!2631 (= (defaultEntry!2682 newMap!16) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992))))) b_lambda!5125)))

(declare-fun b_lambda!5127 () Bool)

(assert (= b_lambda!5119 (or (and b!114232 b_free!2629) (and b!114219 b_free!2631 (= (defaultEntry!2682 newMap!16) (defaultEntry!2682 (v!2990 (underlying!388 thiss!992))))) b_lambda!5127)))

(check-sat (not b_lambda!5127) (not b!114435) (not mapNonEmpty!4138) (not d!32397) (not b!114419) (not d!32393) (not d!32411) (not b!114385) (not mapNonEmpty!4137) (not d!32395) (not d!32391) (not bm!12332) (not bm!12329) (not d!32367) (not b!114524) (not b!114384) (not b!114513) (not b_next!2629) (not b!114463) (not bm!12327) (not b!114372) (not d!32399) (not bm!12250) (not b!114433) (not b_lambda!5123) (not b!114624) (not b!114462) (not b!114447) (not b!114425) (not b!114426) (not b!114421) (not bm!12330) (not bm!12333) (not b!114511) b_and!7077 (not b!114538) (not b!114379) (not bm!12341) (not b!114415) (not b!114427) (not bm!12274) (not bm!12325) (not bm!12343) (not b!114434) (not b!114430) (not d!32415) (not b!114629) (not b!114523) (not bm!12328) tp_is_empty!2731 (not b!114436) (not b!114423) (not d!32401) (not b!114378) (not b!114373) (not b!114625) (not b!114526) (not bm!12324) (not bm!12345) (not b!114428) (not bm!12273) (not d!32365) (not b!114648) (not bm!12268) (not d!32413) (not b!114623) (not b!114388) (not b!114519) (not d!32381) (not b!114389) (not b!114420) (not d!32389) (not b!114386) (not b!114516) (not b!114431) (not b!114371) (not d!32387) (not d!32383) (not b!114631) (not d!32385) (not b!114429) (not b!114460) (not b!114528) b_and!7079 (not b!114418) (not d!32419) (not b!114660) (not b!114387) (not b!114514) (not bm!12253) (not d!32417) (not b!114432) (not b_lambda!5125) (not d!32407) (not bm!12335) (not d!32403) (not b_lambda!5115) (not b!114529) (not b!114536) (not b_next!2631) (not b!114442) (not b!114390) (not d!32379) (not bm!12272) (not b!114527))
(check-sat b_and!7077 b_and!7079 (not b_next!2629) (not b_next!2631))
