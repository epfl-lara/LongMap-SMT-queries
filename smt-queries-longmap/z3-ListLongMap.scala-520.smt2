; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13078 () Bool)

(assert start!13078)

(declare-fun b!114379 () Bool)

(declare-fun b_free!2633 () Bool)

(declare-fun b_next!2633 () Bool)

(assert (=> b!114379 (= b_free!2633 (not b_next!2633))))

(declare-fun tp!10259 () Bool)

(declare-fun b_and!7059 () Bool)

(assert (=> b!114379 (= tp!10259 b_and!7059)))

(declare-fun b!114367 () Bool)

(declare-fun b_free!2635 () Bool)

(declare-fun b_next!2635 () Bool)

(assert (=> b!114367 (= b_free!2635 (not b_next!2635))))

(declare-fun tp!10257 () Bool)

(declare-fun b_and!7061 () Bool)

(assert (=> b!114367 (= tp!10257 b_and!7061)))

(declare-fun b!114365 () Bool)

(declare-fun e!74425 () Bool)

(declare-fun e!74439 () Bool)

(assert (=> b!114365 (= e!74425 e!74439)))

(declare-fun res!56283 () Bool)

(assert (=> b!114365 (=> (not res!56283) (not e!74439))))

(declare-datatypes ((V!3291 0))(
  ( (V!3292 (val!1411 Int)) )
))
(declare-datatypes ((tuple2!2484 0))(
  ( (tuple2!2485 (_1!1253 (_ BitVec 64)) (_2!1253 V!3291)) )
))
(declare-datatypes ((List!1653 0))(
  ( (Nil!1650) (Cons!1649 (h!2249 tuple2!2484) (t!5879 List!1653)) )
))
(declare-datatypes ((ListLongMap!1617 0))(
  ( (ListLongMap!1618 (toList!824 List!1653)) )
))
(declare-fun lt!59535 () ListLongMap!1617)

(declare-fun lt!59537 () ListLongMap!1617)

(assert (=> b!114365 (= res!56283 (= lt!59535 lt!59537))))

(declare-datatypes ((array!4467 0))(
  ( (array!4468 (arr!2117 (Array (_ BitVec 32) (_ BitVec 64))) (size!2377 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1023 0))(
  ( (ValueCellFull!1023 (v!2989 V!3291)) (EmptyCell!1023) )
))
(declare-datatypes ((array!4469 0))(
  ( (array!4470 (arr!2118 (Array (_ BitVec 32) ValueCell!1023)) (size!2378 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!954 0))(
  ( (LongMapFixedSize!955 (defaultEntry!2683 Int) (mask!6879 (_ BitVec 32)) (extraKeys!2472 (_ BitVec 32)) (zeroValue!2550 V!3291) (minValue!2550 V!3291) (_size!526 (_ BitVec 32)) (_keys!4405 array!4467) (_values!2666 array!4469) (_vacant!526 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!954)

(declare-fun map!1322 (LongMapFixedSize!954) ListLongMap!1617)

(assert (=> b!114365 (= lt!59537 (map!1322 newMap!16))))

(declare-datatypes ((Cell!754 0))(
  ( (Cell!755 (v!2990 LongMapFixedSize!954)) )
))
(declare-datatypes ((LongMap!754 0))(
  ( (LongMap!755 (underlying!388 Cell!754)) )
))
(declare-fun thiss!992 () LongMap!754)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!507 (array!4467 array!4469 (_ BitVec 32) (_ BitVec 32) V!3291 V!3291 (_ BitVec 32) Int) ListLongMap!1617)

(assert (=> b!114365 (= lt!59535 (getCurrentListMap!507 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (_values!2666 (v!2990 (underlying!388 thiss!992))) (mask!6879 (v!2990 (underlying!388 thiss!992))) (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) (minValue!2550 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun b!114366 () Bool)

(declare-fun res!56285 () Bool)

(assert (=> b!114366 (=> (not res!56285) (not e!74425))))

(assert (=> b!114366 (= res!56285 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992)))))))))

(declare-fun e!74434 () Bool)

(declare-fun e!74424 () Bool)

(declare-fun tp_is_empty!2733 () Bool)

(declare-fun array_inv!1333 (array!4467) Bool)

(declare-fun array_inv!1334 (array!4469) Bool)

(assert (=> b!114367 (= e!74424 (and tp!10257 tp_is_empty!2733 (array_inv!1333 (_keys!4405 newMap!16)) (array_inv!1334 (_values!2666 newMap!16)) e!74434))))

(declare-fun b!114368 () Bool)

(declare-fun res!56286 () Bool)

(assert (=> b!114368 (=> (not res!56286) (not e!74425))))

(declare-fun valid!449 (LongMapFixedSize!954) Bool)

(assert (=> b!114368 (= res!56286 (valid!449 newMap!16))))

(declare-fun b!114369 () Bool)

(declare-fun e!74430 () Bool)

(declare-fun e!74437 () Bool)

(assert (=> b!114369 (= e!74430 e!74437)))

(declare-fun res!56288 () Bool)

(assert (=> b!114369 (=> (not res!56288) (not e!74437))))

(declare-datatypes ((tuple2!2486 0))(
  ( (tuple2!2487 (_1!1254 Bool) (_2!1254 LongMapFixedSize!954)) )
))
(declare-fun lt!59540 () tuple2!2486)

(assert (=> b!114369 (= res!56288 (and (_1!1254 lt!59540) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3572 0))(
  ( (Unit!3573) )
))
(declare-fun lt!59547 () Unit!3572)

(declare-fun e!74436 () Unit!3572)

(assert (=> b!114369 (= lt!59547 e!74436)))

(declare-fun c!20426 () Bool)

(declare-fun contains!854 (ListLongMap!1617 (_ BitVec 64)) Bool)

(assert (=> b!114369 (= c!20426 (contains!854 lt!59537 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun lt!59544 () V!3291)

(declare-fun update!172 (LongMapFixedSize!954 (_ BitVec 64) V!3291) tuple2!2486)

(assert (=> b!114369 (= lt!59540 (update!172 newMap!16 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544))))

(declare-fun b!114370 () Bool)

(declare-fun Unit!3574 () Unit!3572)

(assert (=> b!114370 (= e!74436 Unit!3574)))

(declare-fun b!114371 () Bool)

(declare-fun e!74427 () Bool)

(assert (=> b!114371 (= e!74427 tp_is_empty!2733)))

(declare-fun b!114373 () Bool)

(declare-fun e!74438 () Bool)

(declare-fun e!74428 () Bool)

(assert (=> b!114373 (= e!74438 e!74428)))

(declare-fun b!114374 () Bool)

(declare-fun e!74435 () Bool)

(assert (=> b!114374 (= e!74435 (valid!449 (v!2990 (underlying!388 thiss!992))))))

(declare-fun b!114375 () Bool)

(declare-fun e!74440 () Bool)

(assert (=> b!114375 (= e!74440 tp_is_empty!2733)))

(declare-fun b!114376 () Bool)

(declare-fun e!74432 () Bool)

(assert (=> b!114376 (= e!74432 tp_is_empty!2733)))

(declare-fun b!114377 () Bool)

(assert (=> b!114377 (= e!74439 e!74430)))

(declare-fun res!56284 () Bool)

(assert (=> b!114377 (=> (not res!56284) (not e!74430))))

(assert (=> b!114377 (= res!56284 (and (not (= (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1377 (ValueCell!1023 V!3291) V!3291)

(declare-fun dynLambda!399 (Int (_ BitVec 64)) V!3291)

(assert (=> b!114377 (= lt!59544 (get!1377 (select (arr!2118 (_values!2666 (v!2990 (underlying!388 thiss!992)))) from!355) (dynLambda!399 (defaultEntry!2683 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114378 () Bool)

(declare-fun e!74433 () Bool)

(assert (=> b!114378 (= e!74433 tp_is_empty!2733)))

(declare-fun mapIsEmpty!4127 () Bool)

(declare-fun mapRes!4127 () Bool)

(assert (=> mapIsEmpty!4127 mapRes!4127))

(declare-fun e!74426 () Bool)

(assert (=> b!114379 (= e!74428 (and tp!10259 tp_is_empty!2733 (array_inv!1333 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (array_inv!1334 (_values!2666 (v!2990 (underlying!388 thiss!992)))) e!74426))))

(declare-fun b!114380 () Bool)

(declare-fun mapRes!4128 () Bool)

(assert (=> b!114380 (= e!74434 (and e!74427 mapRes!4128))))

(declare-fun condMapEmpty!4128 () Bool)

(declare-fun mapDefault!4127 () ValueCell!1023)

(assert (=> b!114380 (= condMapEmpty!4128 (= (arr!2118 (_values!2666 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1023)) mapDefault!4127)))))

(declare-fun b!114381 () Bool)

(assert (=> b!114381 (= e!74426 (and e!74440 mapRes!4127))))

(declare-fun condMapEmpty!4127 () Bool)

(declare-fun mapDefault!4128 () ValueCell!1023)

(assert (=> b!114381 (= condMapEmpty!4127 (= (arr!2118 (_values!2666 (v!2990 (underlying!388 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1023)) mapDefault!4128)))))

(declare-fun mapNonEmpty!4127 () Bool)

(declare-fun tp!10260 () Bool)

(assert (=> mapNonEmpty!4127 (= mapRes!4128 (and tp!10260 e!74432))))

(declare-fun mapValue!4128 () ValueCell!1023)

(declare-fun mapKey!4127 () (_ BitVec 32))

(declare-fun mapRest!4127 () (Array (_ BitVec 32) ValueCell!1023))

(assert (=> mapNonEmpty!4127 (= (arr!2118 (_values!2666 newMap!16)) (store mapRest!4127 mapKey!4127 mapValue!4128))))

(declare-fun res!56287 () Bool)

(assert (=> start!13078 (=> (not res!56287) (not e!74425))))

(declare-fun valid!450 (LongMap!754) Bool)

(assert (=> start!13078 (= res!56287 (valid!450 thiss!992))))

(assert (=> start!13078 e!74425))

(declare-fun e!74431 () Bool)

(assert (=> start!13078 e!74431))

(assert (=> start!13078 true))

(assert (=> start!13078 e!74424))

(declare-fun b!114372 () Bool)

(assert (=> b!114372 (= e!74431 e!74438)))

(declare-fun b!114382 () Bool)

(declare-fun res!56289 () Bool)

(assert (=> b!114382 (=> (not res!56289) (not e!74425))))

(assert (=> b!114382 (= res!56289 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6879 newMap!16)) (_size!526 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun mapIsEmpty!4128 () Bool)

(assert (=> mapIsEmpty!4128 mapRes!4128))

(declare-fun b!114383 () Bool)

(assert (=> b!114383 (= e!74437 (not e!74435))))

(declare-fun res!56290 () Bool)

(assert (=> b!114383 (=> res!56290 e!74435)))

(assert (=> b!114383 (= res!56290 (not (valid!449 (_2!1254 lt!59540))))))

(declare-fun lt!59549 () ListLongMap!1617)

(declare-fun lt!59538 () tuple2!2484)

(declare-fun lt!59542 () tuple2!2484)

(declare-fun lt!59545 () ListLongMap!1617)

(declare-fun +!161 (ListLongMap!1617 tuple2!2484) ListLongMap!1617)

(assert (=> b!114383 (= (+!161 lt!59549 lt!59538) (+!161 (+!161 lt!59545 lt!59538) lt!59542))))

(assert (=> b!114383 (= lt!59538 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2550 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun lt!59539 () Unit!3572)

(declare-fun addCommutativeForDiffKeys!73 (ListLongMap!1617 (_ BitVec 64) V!3291 (_ BitVec 64) V!3291) Unit!3572)

(assert (=> b!114383 (= lt!59539 (addCommutativeForDiffKeys!73 lt!59545 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2550 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun lt!59543 () ListLongMap!1617)

(assert (=> b!114383 (= lt!59543 lt!59549)))

(assert (=> b!114383 (= lt!59549 (+!161 lt!59545 lt!59542))))

(declare-fun lt!59534 () ListLongMap!1617)

(declare-fun lt!59532 () tuple2!2484)

(assert (=> b!114383 (= lt!59543 (+!161 lt!59534 lt!59532))))

(declare-fun lt!59541 () ListLongMap!1617)

(assert (=> b!114383 (= lt!59545 (+!161 lt!59541 lt!59532))))

(assert (=> b!114383 (= lt!59532 (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2550 (v!2990 (underlying!388 thiss!992)))))))

(assert (=> b!114383 (= lt!59534 (+!161 lt!59541 lt!59542))))

(assert (=> b!114383 (= lt!59542 (tuple2!2485 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544))))

(declare-fun lt!59548 () Unit!3572)

(assert (=> b!114383 (= lt!59548 (addCommutativeForDiffKeys!73 lt!59541 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2550 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!127 (array!4467 array!4469 (_ BitVec 32) (_ BitVec 32) V!3291 V!3291 (_ BitVec 32) Int) ListLongMap!1617)

(assert (=> b!114383 (= lt!59541 (getCurrentListMapNoExtraKeys!127 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (_values!2666 (v!2990 (underlying!388 thiss!992))) (mask!6879 (v!2990 (underlying!388 thiss!992))) (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) (minValue!2550 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun mapNonEmpty!4128 () Bool)

(declare-fun tp!10258 () Bool)

(assert (=> mapNonEmpty!4128 (= mapRes!4127 (and tp!10258 e!74433))))

(declare-fun mapValue!4127 () ValueCell!1023)

(declare-fun mapRest!4128 () (Array (_ BitVec 32) ValueCell!1023))

(declare-fun mapKey!4128 () (_ BitVec 32))

(assert (=> mapNonEmpty!4128 (= (arr!2118 (_values!2666 (v!2990 (underlying!388 thiss!992)))) (store mapRest!4128 mapKey!4128 mapValue!4127))))

(declare-fun b!114384 () Bool)

(declare-fun Unit!3575 () Unit!3572)

(assert (=> b!114384 (= e!74436 Unit!3575)))

(declare-fun lt!59536 () Unit!3572)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!120 (array!4467 array!4469 (_ BitVec 32) (_ BitVec 32) V!3291 V!3291 (_ BitVec 64) (_ BitVec 32) Int) Unit!3572)

(assert (=> b!114384 (= lt!59536 (lemmaListMapContainsThenArrayContainsFrom!120 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (_values!2666 (v!2990 (underlying!388 thiss!992))) (mask!6879 (v!2990 (underlying!388 thiss!992))) (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) (minValue!2550 (v!2990 (underlying!388 thiss!992))) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114384 (arrayContainsKey!0 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59533 () Unit!3572)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4467 (_ BitVec 32) (_ BitVec 32)) Unit!3572)

(assert (=> b!114384 (= lt!59533 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4405 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1654 0))(
  ( (Nil!1651) (Cons!1650 (h!2250 (_ BitVec 64)) (t!5880 List!1654)) )
))
(declare-fun arrayNoDuplicates!0 (array!4467 (_ BitVec 32) List!1654) Bool)

(assert (=> b!114384 (arrayNoDuplicates!0 (_keys!4405 (v!2990 (underlying!388 thiss!992))) from!355 Nil!1651)))

(declare-fun lt!59546 () Unit!3572)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4467 (_ BitVec 32) (_ BitVec 64) List!1654) Unit!3572)

(assert (=> b!114384 (= lt!59546 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (Cons!1650 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) Nil!1651)))))

(assert (=> b!114384 false))

(assert (= (and start!13078 res!56287) b!114366))

(assert (= (and b!114366 res!56285) b!114368))

(assert (= (and b!114368 res!56286) b!114382))

(assert (= (and b!114382 res!56289) b!114365))

(assert (= (and b!114365 res!56283) b!114377))

(assert (= (and b!114377 res!56284) b!114369))

(assert (= (and b!114369 c!20426) b!114384))

(assert (= (and b!114369 (not c!20426)) b!114370))

(assert (= (and b!114369 res!56288) b!114383))

(assert (= (and b!114383 (not res!56290)) b!114374))

(assert (= (and b!114381 condMapEmpty!4127) mapIsEmpty!4127))

(assert (= (and b!114381 (not condMapEmpty!4127)) mapNonEmpty!4128))

(get-info :version)

(assert (= (and mapNonEmpty!4128 ((_ is ValueCellFull!1023) mapValue!4127)) b!114378))

(assert (= (and b!114381 ((_ is ValueCellFull!1023) mapDefault!4128)) b!114375))

(assert (= b!114379 b!114381))

(assert (= b!114373 b!114379))

(assert (= b!114372 b!114373))

(assert (= start!13078 b!114372))

(assert (= (and b!114380 condMapEmpty!4128) mapIsEmpty!4128))

(assert (= (and b!114380 (not condMapEmpty!4128)) mapNonEmpty!4127))

(assert (= (and mapNonEmpty!4127 ((_ is ValueCellFull!1023) mapValue!4128)) b!114376))

(assert (= (and b!114380 ((_ is ValueCellFull!1023) mapDefault!4127)) b!114371))

(assert (= b!114367 b!114380))

(assert (= start!13078 b!114367))

(declare-fun b_lambda!5113 () Bool)

(assert (=> (not b_lambda!5113) (not b!114377)))

(declare-fun t!5876 () Bool)

(declare-fun tb!2189 () Bool)

(assert (=> (and b!114379 (= (defaultEntry!2683 (v!2990 (underlying!388 thiss!992))) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992)))) t!5876) tb!2189))

(declare-fun result!3653 () Bool)

(assert (=> tb!2189 (= result!3653 tp_is_empty!2733)))

(assert (=> b!114377 t!5876))

(declare-fun b_and!7063 () Bool)

(assert (= b_and!7059 (and (=> t!5876 result!3653) b_and!7063)))

(declare-fun t!5878 () Bool)

(declare-fun tb!2191 () Bool)

(assert (=> (and b!114367 (= (defaultEntry!2683 newMap!16) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992)))) t!5878) tb!2191))

(declare-fun result!3657 () Bool)

(assert (= result!3657 result!3653))

(assert (=> b!114377 t!5878))

(declare-fun b_and!7065 () Bool)

(assert (= b_and!7061 (and (=> t!5878 result!3657) b_and!7065)))

(declare-fun m!130731 () Bool)

(assert (=> b!114368 m!130731))

(declare-fun m!130733 () Bool)

(assert (=> b!114367 m!130733))

(declare-fun m!130735 () Bool)

(assert (=> b!114367 m!130735))

(declare-fun m!130737 () Bool)

(assert (=> b!114374 m!130737))

(declare-fun m!130739 () Bool)

(assert (=> b!114383 m!130739))

(declare-fun m!130741 () Bool)

(assert (=> b!114383 m!130741))

(declare-fun m!130743 () Bool)

(assert (=> b!114383 m!130743))

(declare-fun m!130745 () Bool)

(assert (=> b!114383 m!130745))

(assert (=> b!114383 m!130743))

(declare-fun m!130747 () Bool)

(assert (=> b!114383 m!130747))

(declare-fun m!130749 () Bool)

(assert (=> b!114383 m!130749))

(declare-fun m!130751 () Bool)

(assert (=> b!114383 m!130751))

(declare-fun m!130753 () Bool)

(assert (=> b!114383 m!130753))

(assert (=> b!114383 m!130749))

(declare-fun m!130755 () Bool)

(assert (=> b!114383 m!130755))

(declare-fun m!130757 () Bool)

(assert (=> b!114383 m!130757))

(assert (=> b!114383 m!130743))

(declare-fun m!130759 () Bool)

(assert (=> b!114383 m!130759))

(declare-fun m!130761 () Bool)

(assert (=> b!114383 m!130761))

(declare-fun m!130763 () Bool)

(assert (=> start!13078 m!130763))

(declare-fun m!130765 () Bool)

(assert (=> mapNonEmpty!4128 m!130765))

(declare-fun m!130767 () Bool)

(assert (=> b!114384 m!130767))

(declare-fun m!130769 () Bool)

(assert (=> b!114384 m!130769))

(assert (=> b!114384 m!130743))

(declare-fun m!130771 () Bool)

(assert (=> b!114384 m!130771))

(assert (=> b!114384 m!130743))

(assert (=> b!114384 m!130743))

(declare-fun m!130773 () Bool)

(assert (=> b!114384 m!130773))

(assert (=> b!114384 m!130743))

(declare-fun m!130775 () Bool)

(assert (=> b!114384 m!130775))

(assert (=> b!114369 m!130743))

(assert (=> b!114369 m!130743))

(declare-fun m!130777 () Bool)

(assert (=> b!114369 m!130777))

(assert (=> b!114369 m!130743))

(declare-fun m!130779 () Bool)

(assert (=> b!114369 m!130779))

(declare-fun m!130781 () Bool)

(assert (=> b!114365 m!130781))

(declare-fun m!130783 () Bool)

(assert (=> b!114365 m!130783))

(declare-fun m!130785 () Bool)

(assert (=> b!114379 m!130785))

(declare-fun m!130787 () Bool)

(assert (=> b!114379 m!130787))

(assert (=> b!114377 m!130743))

(declare-fun m!130789 () Bool)

(assert (=> b!114377 m!130789))

(declare-fun m!130791 () Bool)

(assert (=> b!114377 m!130791))

(assert (=> b!114377 m!130789))

(assert (=> b!114377 m!130791))

(declare-fun m!130793 () Bool)

(assert (=> b!114377 m!130793))

(declare-fun m!130795 () Bool)

(assert (=> mapNonEmpty!4127 m!130795))

(check-sat (not start!13078) (not b!114374) (not b!114379) (not b_next!2633) (not b!114368) (not b!114367) (not b_lambda!5113) (not b!114377) (not b_next!2635) (not mapNonEmpty!4128) tp_is_empty!2733 (not b!114383) (not mapNonEmpty!4127) b_and!7063 (not b!114384) b_and!7065 (not b!114365) (not b!114369))
(check-sat b_and!7063 b_and!7065 (not b_next!2633) (not b_next!2635))
(get-model)

(declare-fun b_lambda!5117 () Bool)

(assert (= b_lambda!5113 (or (and b!114379 b_free!2633) (and b!114367 b_free!2635 (= (defaultEntry!2683 newMap!16) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992))))) b_lambda!5117)))

(check-sat (not start!13078) (not b!114374) (not b!114379) (not b_next!2633) (not b!114368) (not b!114367) (not b!114377) (not b_next!2635) (not mapNonEmpty!4128) tp_is_empty!2733 (not b!114383) (not b_lambda!5117) (not mapNonEmpty!4127) b_and!7063 (not b!114384) b_and!7065 (not b!114365) (not b!114369))
(check-sat b_and!7063 b_and!7065 (not b_next!2633) (not b_next!2635))
(get-model)

(declare-fun d!32377 () Bool)

(declare-fun res!56321 () Bool)

(declare-fun e!74498 () Bool)

(assert (=> d!32377 (=> (not res!56321) (not e!74498))))

(declare-fun simpleValid!79 (LongMapFixedSize!954) Bool)

(assert (=> d!32377 (= res!56321 (simpleValid!79 (v!2990 (underlying!388 thiss!992))))))

(assert (=> d!32377 (= (valid!449 (v!2990 (underlying!388 thiss!992))) e!74498)))

(declare-fun b!114455 () Bool)

(declare-fun res!56322 () Bool)

(assert (=> b!114455 (=> (not res!56322) (not e!74498))))

(declare-fun arrayCountValidKeys!0 (array!4467 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!114455 (= res!56322 (= (arrayCountValidKeys!0 (_keys!4405 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000000 (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992))))) (_size!526 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun b!114456 () Bool)

(declare-fun res!56323 () Bool)

(assert (=> b!114456 (=> (not res!56323) (not e!74498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4467 (_ BitVec 32)) Bool)

(assert (=> b!114456 (= res!56323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (mask!6879 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun b!114457 () Bool)

(assert (=> b!114457 (= e!74498 (arrayNoDuplicates!0 (_keys!4405 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000000 Nil!1651))))

(assert (= (and d!32377 res!56321) b!114455))

(assert (= (and b!114455 res!56322) b!114456))

(assert (= (and b!114456 res!56323) b!114457))

(declare-fun m!130863 () Bool)

(assert (=> d!32377 m!130863))

(declare-fun m!130865 () Bool)

(assert (=> b!114455 m!130865))

(declare-fun m!130867 () Bool)

(assert (=> b!114456 m!130867))

(declare-fun m!130869 () Bool)

(assert (=> b!114457 m!130869))

(assert (=> b!114374 d!32377))

(declare-fun d!32379 () Bool)

(assert (=> d!32379 (= (array_inv!1333 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvsge (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!114379 d!32379))

(declare-fun d!32381 () Bool)

(assert (=> d!32381 (= (array_inv!1334 (_values!2666 (v!2990 (underlying!388 thiss!992)))) (bvsge (size!2378 (_values!2666 (v!2990 (underlying!388 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!114379 d!32381))

(declare-fun d!32383 () Bool)

(declare-fun e!74504 () Bool)

(assert (=> d!32383 e!74504))

(declare-fun res!56326 () Bool)

(assert (=> d!32383 (=> res!56326 e!74504)))

(declare-fun lt!59615 () Bool)

(assert (=> d!32383 (= res!56326 (not lt!59615))))

(declare-fun lt!59613 () Bool)

(assert (=> d!32383 (= lt!59615 lt!59613)))

(declare-fun lt!59612 () Unit!3572)

(declare-fun e!74503 () Unit!3572)

(assert (=> d!32383 (= lt!59612 e!74503)))

(declare-fun c!20432 () Bool)

(assert (=> d!32383 (= c!20432 lt!59613)))

(declare-fun containsKey!165 (List!1653 (_ BitVec 64)) Bool)

(assert (=> d!32383 (= lt!59613 (containsKey!165 (toList!824 lt!59537) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(assert (=> d!32383 (= (contains!854 lt!59537 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355)) lt!59615)))

(declare-fun b!114464 () Bool)

(declare-fun lt!59614 () Unit!3572)

(assert (=> b!114464 (= e!74503 lt!59614)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!113 (List!1653 (_ BitVec 64)) Unit!3572)

(assert (=> b!114464 (= lt!59614 (lemmaContainsKeyImpliesGetValueByKeyDefined!113 (toList!824 lt!59537) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-datatypes ((Option!167 0))(
  ( (Some!166 (v!2994 V!3291)) (None!165) )
))
(declare-fun isDefined!114 (Option!167) Bool)

(declare-fun getValueByKey!161 (List!1653 (_ BitVec 64)) Option!167)

(assert (=> b!114464 (isDefined!114 (getValueByKey!161 (toList!824 lt!59537) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun b!114465 () Bool)

(declare-fun Unit!3579 () Unit!3572)

(assert (=> b!114465 (= e!74503 Unit!3579)))

(declare-fun b!114466 () Bool)

(assert (=> b!114466 (= e!74504 (isDefined!114 (getValueByKey!161 (toList!824 lt!59537) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355))))))

(assert (= (and d!32383 c!20432) b!114464))

(assert (= (and d!32383 (not c!20432)) b!114465))

(assert (= (and d!32383 (not res!56326)) b!114466))

(assert (=> d!32383 m!130743))

(declare-fun m!130871 () Bool)

(assert (=> d!32383 m!130871))

(assert (=> b!114464 m!130743))

(declare-fun m!130873 () Bool)

(assert (=> b!114464 m!130873))

(assert (=> b!114464 m!130743))

(declare-fun m!130875 () Bool)

(assert (=> b!114464 m!130875))

(assert (=> b!114464 m!130875))

(declare-fun m!130877 () Bool)

(assert (=> b!114464 m!130877))

(assert (=> b!114466 m!130743))

(assert (=> b!114466 m!130875))

(assert (=> b!114466 m!130875))

(assert (=> b!114466 m!130877))

(assert (=> b!114369 d!32383))

(declare-fun b!114543 () Bool)

(declare-fun e!74551 () Bool)

(declare-fun e!74553 () Bool)

(assert (=> b!114543 (= e!74551 e!74553)))

(declare-fun res!56367 () Bool)

(declare-fun call!12340 () ListLongMap!1617)

(assert (=> b!114543 (= res!56367 (contains!854 call!12340 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(assert (=> b!114543 (=> (not res!56367) (not e!74553))))

(declare-fun b!114544 () Bool)

(declare-fun e!74558 () Unit!3572)

(declare-fun Unit!3580 () Unit!3572)

(assert (=> b!114544 (= e!74558 Unit!3580)))

(declare-fun lt!59674 () Unit!3572)

(declare-fun call!12330 () Unit!3572)

(assert (=> b!114544 (= lt!59674 call!12330)))

(declare-datatypes ((SeekEntryResult!264 0))(
  ( (MissingZero!264 (index!3209 (_ BitVec 32))) (Found!264 (index!3210 (_ BitVec 32))) (Intermediate!264 (undefined!1076 Bool) (index!3211 (_ BitVec 32)) (x!14316 (_ BitVec 32))) (Undefined!264) (MissingVacant!264 (index!3212 (_ BitVec 32))) )
))
(declare-fun lt!59675 () SeekEntryResult!264)

(declare-fun call!12333 () SeekEntryResult!264)

(assert (=> b!114544 (= lt!59675 call!12333)))

(declare-fun c!20464 () Bool)

(assert (=> b!114544 (= c!20464 ((_ is MissingZero!264) lt!59675))))

(declare-fun e!74560 () Bool)

(assert (=> b!114544 e!74560))

(declare-fun lt!59687 () Unit!3572)

(assert (=> b!114544 (= lt!59687 lt!59674)))

(assert (=> b!114544 false))

(declare-fun bm!12317 () Bool)

(declare-fun call!12322 () Bool)

(declare-fun call!12321 () Bool)

(assert (=> bm!12317 (= call!12322 call!12321)))

(declare-fun e!74550 () Bool)

(declare-fun lt!59673 () SeekEntryResult!264)

(declare-fun b!114545 () Bool)

(assert (=> b!114545 (= e!74550 (= (select (arr!2117 (_keys!4405 newMap!16)) (index!3210 lt!59673)) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun b!114546 () Bool)

(declare-fun e!74561 () Bool)

(assert (=> b!114546 (= e!74561 ((_ is Undefined!264) lt!59675))))

(declare-fun bm!12318 () Bool)

(declare-fun call!12335 () Bool)

(assert (=> bm!12318 (= call!12335 call!12322)))

(declare-fun b!114547 () Bool)

(declare-fun c!20457 () Bool)

(declare-fun lt!59691 () SeekEntryResult!264)

(assert (=> b!114547 (= c!20457 ((_ is MissingVacant!264) lt!59691))))

(declare-fun e!74555 () Bool)

(declare-fun e!74552 () Bool)

(assert (=> b!114547 (= e!74555 e!74552)))

(declare-fun b!114548 () Bool)

(declare-fun call!12326 () ListLongMap!1617)

(assert (=> b!114548 (= e!74551 (= call!12326 call!12340))))

(declare-fun lt!59682 () SeekEntryResult!264)

(declare-fun b!114549 () Bool)

(declare-fun e!74563 () Bool)

(assert (=> b!114549 (= e!74563 (= (select (arr!2117 (_keys!4405 newMap!16)) (index!3210 lt!59682)) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun c!20467 () Bool)

(declare-fun c!20465 () Bool)

(declare-fun bm!12319 () Bool)

(declare-fun call!12329 () ListLongMap!1617)

(declare-fun call!12324 () ListLongMap!1617)

(declare-fun call!12338 () ListLongMap!1617)

(assert (=> bm!12319 (= call!12338 (+!161 (ite c!20467 call!12324 call!12329) (ite c!20467 (ite c!20465 (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 lt!59544) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 lt!59544)) (tuple2!2485 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544))))))

(declare-fun b!114550 () Bool)

(declare-fun res!56355 () Bool)

(declare-fun e!74548 () Bool)

(assert (=> b!114550 (=> (not res!56355) (not e!74548))))

(assert (=> b!114550 (= res!56355 call!12335)))

(assert (=> b!114550 (= e!74560 e!74548)))

(declare-fun bm!12320 () Bool)

(declare-fun call!12342 () Unit!3572)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!52 (array!4467 array!4469 (_ BitVec 32) (_ BitVec 32) V!3291 V!3291 (_ BitVec 64) Int) Unit!3572)

(assert (=> bm!12320 (= call!12342 (lemmaInListMapThenSeekEntryOrOpenFindsIt!52 (_keys!4405 newMap!16) (_values!2666 newMap!16) (mask!6879 newMap!16) (extraKeys!2472 newMap!16) (zeroValue!2550 newMap!16) (minValue!2550 newMap!16) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (defaultEntry!2683 newMap!16)))))

(declare-fun c!20463 () Bool)

(declare-fun c!20466 () Bool)

(declare-fun c!20459 () Bool)

(declare-fun c!20461 () Bool)

(declare-fun bm!12321 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!12321 (= call!12321 (inRange!0 (ite c!20466 (ite c!20463 (index!3210 lt!59673) (ite c!20459 (index!3209 lt!59691) (index!3212 lt!59691))) (ite c!20461 (index!3210 lt!59682) (ite c!20464 (index!3209 lt!59675) (index!3212 lt!59675)))) (mask!6879 newMap!16)))))

(declare-fun b!114551 () Bool)

(declare-fun res!56359 () Bool)

(declare-fun e!74546 () Bool)

(assert (=> b!114551 (=> (not res!56359) (not e!74546))))

(assert (=> b!114551 (= res!56359 (= (select (arr!2117 (_keys!4405 newMap!16)) (index!3209 lt!59691)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12322 () Bool)

(declare-fun call!12339 () Bool)

(assert (=> bm!12322 (= call!12339 call!12321)))

(declare-fun bm!12323 () Bool)

(assert (=> bm!12323 (= call!12324 call!12329)))

(declare-fun bm!12324 () Bool)

(declare-fun call!12320 () ListLongMap!1617)

(declare-fun call!12337 () ListLongMap!1617)

(assert (=> bm!12324 (= call!12320 call!12337)))

(declare-fun b!114552 () Bool)

(assert (=> b!114552 (= e!74553 (= call!12340 (+!161 call!12326 (tuple2!2485 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544))))))

(declare-fun bm!12325 () Bool)

(declare-fun call!12328 () SeekEntryResult!264)

(assert (=> bm!12325 (= call!12333 call!12328)))

(declare-fun b!114553 () Bool)

(declare-fun lt!59670 () Unit!3572)

(declare-fun lt!59694 () Unit!3572)

(assert (=> b!114553 (= lt!59670 lt!59694)))

(declare-fun call!12334 () Bool)

(assert (=> b!114553 call!12334))

(declare-fun lt!59689 () array!4469)

(declare-fun lt!59696 () SeekEntryResult!264)

(declare-fun lemmaValidKeyInArrayIsInListMap!113 (array!4467 array!4469 (_ BitVec 32) (_ BitVec 32) V!3291 V!3291 (_ BitVec 32) Int) Unit!3572)

(assert (=> b!114553 (= lt!59694 (lemmaValidKeyInArrayIsInListMap!113 (_keys!4405 newMap!16) lt!59689 (mask!6879 newMap!16) (extraKeys!2472 newMap!16) (zeroValue!2550 newMap!16) (minValue!2550 newMap!16) (index!3210 lt!59696) (defaultEntry!2683 newMap!16)))))

(assert (=> b!114553 (= lt!59689 (array!4470 (store (arr!2118 (_values!2666 newMap!16)) (index!3210 lt!59696) (ValueCellFull!1023 lt!59544)) (size!2378 (_values!2666 newMap!16))))))

(declare-fun lt!59693 () Unit!3572)

(declare-fun lt!59686 () Unit!3572)

(assert (=> b!114553 (= lt!59693 lt!59686)))

(assert (=> b!114553 (= call!12338 (getCurrentListMap!507 (_keys!4405 newMap!16) (array!4470 (store (arr!2118 (_values!2666 newMap!16)) (index!3210 lt!59696) (ValueCellFull!1023 lt!59544)) (size!2378 (_values!2666 newMap!16))) (mask!6879 newMap!16) (extraKeys!2472 newMap!16) (zeroValue!2550 newMap!16) (minValue!2550 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2683 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!52 (array!4467 array!4469 (_ BitVec 32) (_ BitVec 32) V!3291 V!3291 (_ BitVec 32) (_ BitVec 64) V!3291 Int) Unit!3572)

(assert (=> b!114553 (= lt!59686 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!52 (_keys!4405 newMap!16) (_values!2666 newMap!16) (mask!6879 newMap!16) (extraKeys!2472 newMap!16) (zeroValue!2550 newMap!16) (minValue!2550 newMap!16) (index!3210 lt!59696) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544 (defaultEntry!2683 newMap!16)))))

(declare-fun lt!59672 () Unit!3572)

(assert (=> b!114553 (= lt!59672 e!74558)))

(assert (=> b!114553 (= c!20461 (contains!854 call!12329 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun e!74564 () tuple2!2486)

(assert (=> b!114553 (= e!74564 (tuple2!2487 true (LongMapFixedSize!955 (defaultEntry!2683 newMap!16) (mask!6879 newMap!16) (extraKeys!2472 newMap!16) (zeroValue!2550 newMap!16) (minValue!2550 newMap!16) (_size!526 newMap!16) (_keys!4405 newMap!16) (array!4470 (store (arr!2118 (_values!2666 newMap!16)) (index!3210 lt!59696) (ValueCellFull!1023 lt!59544)) (size!2378 (_values!2666 newMap!16))) (_vacant!526 newMap!16))))))

(declare-fun bm!12326 () Bool)

(declare-fun call!12343 () ListLongMap!1617)

(assert (=> bm!12326 (= call!12343 call!12338)))

(declare-fun b!114554 () Bool)

(declare-fun e!74562 () tuple2!2486)

(declare-fun e!74549 () tuple2!2486)

(assert (=> b!114554 (= e!74562 e!74549)))

(assert (=> b!114554 (= c!20465 (= (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!114555 () Bool)

(declare-fun lt!59671 () Unit!3572)

(declare-fun lt!59683 () Unit!3572)

(assert (=> b!114555 (= lt!59671 lt!59683)))

(assert (=> b!114555 (= call!12343 call!12320)))

(declare-fun lt!59690 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!52 (array!4467 array!4469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3291 V!3291 V!3291 Int) Unit!3572)

(assert (=> b!114555 (= lt!59683 (lemmaChangeLongMinValueKeyThenAddPairToListMap!52 (_keys!4405 newMap!16) (_values!2666 newMap!16) (mask!6879 newMap!16) (extraKeys!2472 newMap!16) lt!59690 (zeroValue!2550 newMap!16) (minValue!2550 newMap!16) lt!59544 (defaultEntry!2683 newMap!16)))))

(assert (=> b!114555 (= lt!59690 (bvor (extraKeys!2472 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!114555 (= e!74549 (tuple2!2487 true (LongMapFixedSize!955 (defaultEntry!2683 newMap!16) (mask!6879 newMap!16) (bvor (extraKeys!2472 newMap!16) #b00000000000000000000000000000010) (zeroValue!2550 newMap!16) lt!59544 (_size!526 newMap!16) (_keys!4405 newMap!16) (_values!2666 newMap!16) (_vacant!526 newMap!16))))))

(declare-fun lt!59678 () (_ BitVec 32))

(declare-fun bm!12327 () Bool)

(assert (=> bm!12327 (= call!12337 (getCurrentListMap!507 (_keys!4405 newMap!16) (ite (or c!20467 c!20466) (_values!2666 newMap!16) lt!59689) (mask!6879 newMap!16) (ite c!20467 (ite c!20465 lt!59678 lt!59690) (extraKeys!2472 newMap!16)) (ite (and c!20467 c!20465) lt!59544 (zeroValue!2550 newMap!16)) (ite c!20467 (ite c!20465 (minValue!2550 newMap!16) lt!59544) (minValue!2550 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2683 newMap!16)))))

(declare-fun b!114556 () Bool)

(assert (=> b!114556 (= e!74552 ((_ is Undefined!264) lt!59691))))

(declare-fun bm!12328 () Bool)

(declare-fun call!12341 () Bool)

(assert (=> bm!12328 (= call!12341 call!12339)))

(declare-fun b!114557 () Bool)

(declare-fun lt!59688 () Unit!3572)

(assert (=> b!114557 (= e!74558 lt!59688)))

(assert (=> b!114557 (= lt!59688 call!12342)))

(assert (=> b!114557 (= lt!59682 call!12333)))

(declare-fun res!56365 () Bool)

(assert (=> b!114557 (= res!56365 ((_ is Found!264) lt!59682))))

(assert (=> b!114557 (=> (not res!56365) (not e!74563))))

(assert (=> b!114557 e!74563))

(declare-fun bm!12329 () Bool)

(declare-fun call!12331 () Bool)

(assert (=> bm!12329 (= call!12331 (arrayContainsKey!0 (_keys!4405 newMap!16) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!114558 () Bool)

(declare-fun e!74556 () Unit!3572)

(declare-fun lt!59684 () Unit!3572)

(assert (=> b!114558 (= e!74556 lt!59684)))

(assert (=> b!114558 (= lt!59684 call!12330)))

(declare-fun call!12332 () SeekEntryResult!264)

(assert (=> b!114558 (= lt!59691 call!12332)))

(assert (=> b!114558 (= c!20459 ((_ is MissingZero!264) lt!59691))))

(assert (=> b!114558 e!74555))

(declare-fun b!114559 () Bool)

(declare-fun res!56363 () Bool)

(assert (=> b!114559 (= res!56363 call!12339)))

(assert (=> b!114559 (=> (not res!56363) (not e!74550))))

(declare-fun b!114560 () Bool)

(declare-fun e!74557 () Bool)

(assert (=> b!114560 (= e!74561 e!74557)))

(declare-fun res!56361 () Bool)

(assert (=> b!114560 (= res!56361 call!12335)))

(assert (=> b!114560 (=> (not res!56361) (not e!74557))))

(declare-fun bm!12330 () Bool)

(declare-fun c!20462 () Bool)

(declare-fun call!12336 () tuple2!2486)

(declare-fun updateHelperNewKey!52 (LongMapFixedSize!954 (_ BitVec 64) V!3291 (_ BitVec 32)) tuple2!2486)

(assert (=> bm!12330 (= call!12336 (updateHelperNewKey!52 newMap!16 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544 (ite c!20462 (index!3212 lt!59696) (index!3209 lt!59696))))))

(declare-fun bm!12331 () Bool)

(assert (=> bm!12331 (= call!12329 (getCurrentListMap!507 (_keys!4405 newMap!16) (_values!2666 newMap!16) (mask!6879 newMap!16) (extraKeys!2472 newMap!16) (zeroValue!2550 newMap!16) (minValue!2550 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2683 newMap!16)))))

(declare-fun bm!12332 () Bool)

(declare-fun call!12327 () ListLongMap!1617)

(assert (=> bm!12332 (= call!12327 call!12337)))

(declare-fun b!114561 () Bool)

(declare-fun e!74545 () tuple2!2486)

(assert (=> b!114561 (= e!74562 e!74545)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4467 (_ BitVec 32)) SeekEntryResult!264)

(assert (=> b!114561 (= lt!59696 (seekEntryOrOpen!0 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (_keys!4405 newMap!16) (mask!6879 newMap!16)))))

(assert (=> b!114561 (= c!20466 ((_ is Undefined!264) lt!59696))))

(declare-fun b!114562 () Bool)

(declare-fun e!74554 () Bool)

(assert (=> b!114562 (= e!74552 e!74554)))

(declare-fun res!56357 () Bool)

(assert (=> b!114562 (= res!56357 call!12341)))

(assert (=> b!114562 (=> (not res!56357) (not e!74554))))

(declare-fun b!114563 () Bool)

(declare-fun res!56368 () Bool)

(assert (=> b!114563 (= res!56368 (= (select (arr!2117 (_keys!4405 newMap!16)) (index!3212 lt!59691)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!114563 (=> (not res!56368) (not e!74554))))

(declare-fun b!114564 () Bool)

(declare-fun lt!59677 () Unit!3572)

(assert (=> b!114564 (= lt!59677 e!74556)))

(assert (=> b!114564 (= c!20463 call!12334)))

(assert (=> b!114564 (= e!74545 (tuple2!2487 false newMap!16))))

(declare-fun b!114565 () Bool)

(declare-fun call!12325 () Bool)

(assert (=> b!114565 (= e!74554 (not call!12325))))

(declare-fun b!114566 () Bool)

(declare-fun call!12323 () Bool)

(assert (=> b!114566 (= e!74557 (not call!12323))))

(declare-fun b!114567 () Bool)

(declare-fun lt!59679 () tuple2!2486)

(assert (=> b!114567 (= lt!59679 call!12336)))

(assert (=> b!114567 (= e!74564 (tuple2!2487 (_1!1254 lt!59679) (_2!1254 lt!59679)))))

(declare-fun b!114568 () Bool)

(declare-fun e!74559 () tuple2!2486)

(assert (=> b!114568 (= e!74559 e!74564)))

(declare-fun c!20460 () Bool)

(assert (=> b!114568 (= c!20460 ((_ is MissingZero!264) lt!59696))))

(declare-fun bm!12333 () Bool)

(assert (=> bm!12333 (= call!12323 call!12331)))

(declare-fun bm!12334 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!52 (array!4467 array!4469 (_ BitVec 32) (_ BitVec 32) V!3291 V!3291 (_ BitVec 64) Int) Unit!3572)

(assert (=> bm!12334 (= call!12330 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!52 (_keys!4405 newMap!16) (_values!2666 newMap!16) (mask!6879 newMap!16) (extraKeys!2472 newMap!16) (zeroValue!2550 newMap!16) (minValue!2550 newMap!16) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (defaultEntry!2683 newMap!16)))))

(declare-fun b!114569 () Bool)

(declare-fun e!74547 () Bool)

(assert (=> b!114569 (= e!74547 e!74551)))

(declare-fun c!20468 () Bool)

(declare-fun lt!59676 () tuple2!2486)

(assert (=> b!114569 (= c!20468 (_1!1254 lt!59676))))

(declare-fun bm!12335 () Bool)

(assert (=> bm!12335 (= call!12326 (map!1322 (ite c!20468 newMap!16 (_2!1254 lt!59676))))))

(declare-fun b!114570 () Bool)

(declare-fun lt!59695 () Unit!3572)

(declare-fun lt!59685 () Unit!3572)

(assert (=> b!114570 (= lt!59695 lt!59685)))

(assert (=> b!114570 (= call!12343 call!12320)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!52 (array!4467 array!4469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3291 V!3291 V!3291 Int) Unit!3572)

(assert (=> b!114570 (= lt!59685 (lemmaChangeZeroKeyThenAddPairToListMap!52 (_keys!4405 newMap!16) (_values!2666 newMap!16) (mask!6879 newMap!16) (extraKeys!2472 newMap!16) lt!59678 (zeroValue!2550 newMap!16) lt!59544 (minValue!2550 newMap!16) (defaultEntry!2683 newMap!16)))))

(assert (=> b!114570 (= lt!59678 (bvor (extraKeys!2472 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!114570 (= e!74549 (tuple2!2487 true (LongMapFixedSize!955 (defaultEntry!2683 newMap!16) (mask!6879 newMap!16) (bvor (extraKeys!2472 newMap!16) #b00000000000000000000000000000001) lt!59544 (minValue!2550 newMap!16) (_size!526 newMap!16) (_keys!4405 newMap!16) (_values!2666 newMap!16) (_vacant!526 newMap!16))))))

(declare-fun b!114571 () Bool)

(declare-fun lt!59680 () tuple2!2486)

(assert (=> b!114571 (= e!74559 (tuple2!2487 (_1!1254 lt!59680) (_2!1254 lt!59680)))))

(assert (=> b!114571 (= lt!59680 call!12336)))

(declare-fun b!114572 () Bool)

(assert (=> b!114572 (= e!74548 (not call!12323))))

(declare-fun bm!12336 () Bool)

(assert (=> bm!12336 (= call!12332 call!12328)))

(declare-fun b!114573 () Bool)

(declare-fun c!20458 () Bool)

(assert (=> b!114573 (= c!20458 ((_ is MissingVacant!264) lt!59675))))

(assert (=> b!114573 (= e!74560 e!74561)))

(declare-fun b!114574 () Bool)

(declare-fun res!56364 () Bool)

(assert (=> b!114574 (= res!56364 call!12322)))

(assert (=> b!114574 (=> (not res!56364) (not e!74563))))

(declare-fun b!114575 () Bool)

(declare-fun res!56362 () Bool)

(assert (=> b!114575 (=> (not res!56362) (not e!74546))))

(assert (=> b!114575 (= res!56362 call!12341)))

(assert (=> b!114575 (= e!74555 e!74546)))

(declare-fun b!114576 () Bool)

(assert (=> b!114576 (= c!20462 ((_ is MissingVacant!264) lt!59696))))

(assert (=> b!114576 (= e!74545 e!74559)))

(declare-fun b!114577 () Bool)

(declare-fun res!56356 () Bool)

(assert (=> b!114577 (=> (not res!56356) (not e!74548))))

(assert (=> b!114577 (= res!56356 (= (select (arr!2117 (_keys!4405 newMap!16)) (index!3209 lt!59675)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12337 () Bool)

(assert (=> bm!12337 (= call!12328 (seekEntryOrOpen!0 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (_keys!4405 newMap!16) (mask!6879 newMap!16)))))

(declare-fun bm!12338 () Bool)

(assert (=> bm!12338 (= call!12325 call!12331)))

(declare-fun bm!12339 () Bool)

(assert (=> bm!12339 (= call!12334 (contains!854 call!12327 (ite c!20466 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (select (arr!2117 (_keys!4405 newMap!16)) (index!3210 lt!59696)))))))

(declare-fun b!114578 () Bool)

(declare-fun res!56366 () Bool)

(assert (=> b!114578 (= res!56366 (= (select (arr!2117 (_keys!4405 newMap!16)) (index!3212 lt!59675)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!114578 (=> (not res!56366) (not e!74557))))

(declare-fun d!32385 () Bool)

(assert (=> d!32385 e!74547))

(declare-fun res!56358 () Bool)

(assert (=> d!32385 (=> (not res!56358) (not e!74547))))

(assert (=> d!32385 (= res!56358 (valid!449 (_2!1254 lt!59676)))))

(assert (=> d!32385 (= lt!59676 e!74562)))

(assert (=> d!32385 (= c!20467 (= (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (bvneg (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355))))))

(assert (=> d!32385 (valid!449 newMap!16)))

(assert (=> d!32385 (= (update!172 newMap!16 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544) lt!59676)))

(declare-fun b!114579 () Bool)

(assert (=> b!114579 (= e!74546 (not call!12325))))

(declare-fun bm!12340 () Bool)

(assert (=> bm!12340 (= call!12340 (map!1322 (ite c!20468 (_2!1254 lt!59676) newMap!16)))))

(declare-fun b!114580 () Bool)

(declare-fun Unit!3581 () Unit!3572)

(assert (=> b!114580 (= e!74556 Unit!3581)))

(declare-fun lt!59681 () Unit!3572)

(assert (=> b!114580 (= lt!59681 call!12342)))

(assert (=> b!114580 (= lt!59673 call!12332)))

(declare-fun res!56360 () Bool)

(assert (=> b!114580 (= res!56360 ((_ is Found!264) lt!59673))))

(assert (=> b!114580 (=> (not res!56360) (not e!74550))))

(assert (=> b!114580 e!74550))

(declare-fun lt!59692 () Unit!3572)

(assert (=> b!114580 (= lt!59692 lt!59681)))

(assert (=> b!114580 false))

(assert (= (and d!32385 c!20467) b!114554))

(assert (= (and d!32385 (not c!20467)) b!114561))

(assert (= (and b!114554 c!20465) b!114570))

(assert (= (and b!114554 (not c!20465)) b!114555))

(assert (= (or b!114570 b!114555) bm!12324))

(assert (= (or b!114570 b!114555) bm!12323))

(assert (= (or b!114570 b!114555) bm!12326))

(assert (= (and b!114561 c!20466) b!114564))

(assert (= (and b!114561 (not c!20466)) b!114576))

(assert (= (and b!114564 c!20463) b!114580))

(assert (= (and b!114564 (not c!20463)) b!114558))

(assert (= (and b!114580 res!56360) b!114559))

(assert (= (and b!114559 res!56363) b!114545))

(assert (= (and b!114558 c!20459) b!114575))

(assert (= (and b!114558 (not c!20459)) b!114547))

(assert (= (and b!114575 res!56362) b!114551))

(assert (= (and b!114551 res!56359) b!114579))

(assert (= (and b!114547 c!20457) b!114562))

(assert (= (and b!114547 (not c!20457)) b!114556))

(assert (= (and b!114562 res!56357) b!114563))

(assert (= (and b!114563 res!56368) b!114565))

(assert (= (or b!114575 b!114562) bm!12328))

(assert (= (or b!114579 b!114565) bm!12338))

(assert (= (or b!114559 bm!12328) bm!12322))

(assert (= (or b!114580 b!114558) bm!12336))

(assert (= (and b!114576 c!20462) b!114571))

(assert (= (and b!114576 (not c!20462)) b!114568))

(assert (= (and b!114568 c!20460) b!114567))

(assert (= (and b!114568 (not c!20460)) b!114553))

(assert (= (and b!114553 c!20461) b!114557))

(assert (= (and b!114553 (not c!20461)) b!114544))

(assert (= (and b!114557 res!56365) b!114574))

(assert (= (and b!114574 res!56364) b!114549))

(assert (= (and b!114544 c!20464) b!114550))

(assert (= (and b!114544 (not c!20464)) b!114573))

(assert (= (and b!114550 res!56355) b!114577))

(assert (= (and b!114577 res!56356) b!114572))

(assert (= (and b!114573 c!20458) b!114560))

(assert (= (and b!114573 (not c!20458)) b!114546))

(assert (= (and b!114560 res!56361) b!114578))

(assert (= (and b!114578 res!56366) b!114566))

(assert (= (or b!114550 b!114560) bm!12318))

(assert (= (or b!114572 b!114566) bm!12333))

(assert (= (or b!114574 bm!12318) bm!12317))

(assert (= (or b!114557 b!114544) bm!12325))

(assert (= (or b!114571 b!114567) bm!12330))

(assert (= (or bm!12338 bm!12333) bm!12329))

(assert (= (or bm!12336 bm!12325) bm!12337))

(assert (= (or bm!12322 bm!12317) bm!12321))

(assert (= (or b!114580 b!114557) bm!12320))

(assert (= (or b!114564 b!114553) bm!12332))

(assert (= (or b!114558 b!114544) bm!12334))

(assert (= (or b!114564 b!114553) bm!12339))

(assert (= (or bm!12323 b!114553) bm!12331))

(assert (= (or bm!12324 bm!12332) bm!12327))

(assert (= (or bm!12326 b!114553) bm!12319))

(assert (= (and d!32385 res!56358) b!114569))

(assert (= (and b!114569 c!20468) b!114543))

(assert (= (and b!114569 (not c!20468)) b!114548))

(assert (= (and b!114543 res!56367) b!114552))

(assert (= (or b!114552 b!114548) bm!12335))

(assert (= (or b!114543 b!114552 b!114548) bm!12340))

(declare-fun m!130879 () Bool)

(assert (=> d!32385 m!130879))

(assert (=> d!32385 m!130731))

(declare-fun m!130881 () Bool)

(assert (=> b!114578 m!130881))

(declare-fun m!130883 () Bool)

(assert (=> b!114555 m!130883))

(assert (=> bm!12320 m!130743))

(declare-fun m!130885 () Bool)

(assert (=> bm!12320 m!130885))

(declare-fun m!130887 () Bool)

(assert (=> bm!12327 m!130887))

(assert (=> bm!12329 m!130743))

(declare-fun m!130889 () Bool)

(assert (=> bm!12329 m!130889))

(declare-fun m!130891 () Bool)

(assert (=> b!114577 m!130891))

(assert (=> b!114543 m!130743))

(declare-fun m!130893 () Bool)

(assert (=> b!114543 m!130893))

(assert (=> b!114553 m!130743))

(declare-fun m!130895 () Bool)

(assert (=> b!114553 m!130895))

(declare-fun m!130897 () Bool)

(assert (=> b!114553 m!130897))

(declare-fun m!130899 () Bool)

(assert (=> b!114553 m!130899))

(declare-fun m!130901 () Bool)

(assert (=> b!114553 m!130901))

(assert (=> b!114553 m!130743))

(declare-fun m!130903 () Bool)

(assert (=> b!114553 m!130903))

(declare-fun m!130905 () Bool)

(assert (=> bm!12340 m!130905))

(declare-fun m!130907 () Bool)

(assert (=> bm!12331 m!130907))

(assert (=> b!114561 m!130743))

(declare-fun m!130909 () Bool)

(assert (=> b!114561 m!130909))

(assert (=> bm!12330 m!130743))

(declare-fun m!130911 () Bool)

(assert (=> bm!12330 m!130911))

(declare-fun m!130913 () Bool)

(assert (=> bm!12321 m!130913))

(declare-fun m!130915 () Bool)

(assert (=> b!114552 m!130915))

(declare-fun m!130917 () Bool)

(assert (=> b!114563 m!130917))

(assert (=> bm!12334 m!130743))

(declare-fun m!130919 () Bool)

(assert (=> bm!12334 m!130919))

(assert (=> bm!12337 m!130743))

(assert (=> bm!12337 m!130909))

(declare-fun m!130921 () Bool)

(assert (=> bm!12339 m!130921))

(declare-fun m!130923 () Bool)

(assert (=> bm!12339 m!130923))

(declare-fun m!130925 () Bool)

(assert (=> bm!12319 m!130925))

(declare-fun m!130927 () Bool)

(assert (=> b!114570 m!130927))

(declare-fun m!130929 () Bool)

(assert (=> bm!12335 m!130929))

(declare-fun m!130931 () Bool)

(assert (=> b!114545 m!130931))

(declare-fun m!130933 () Bool)

(assert (=> b!114549 m!130933))

(declare-fun m!130935 () Bool)

(assert (=> b!114551 m!130935))

(assert (=> b!114369 d!32385))

(declare-fun d!32387 () Bool)

(assert (=> d!32387 (= (array_inv!1333 (_keys!4405 newMap!16)) (bvsge (size!2377 (_keys!4405 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!114367 d!32387))

(declare-fun d!32389 () Bool)

(assert (=> d!32389 (= (array_inv!1334 (_values!2666 newMap!16)) (bvsge (size!2378 (_values!2666 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!114367 d!32389))

(declare-fun d!32391 () Bool)

(declare-fun res!56369 () Bool)

(declare-fun e!74565 () Bool)

(assert (=> d!32391 (=> (not res!56369) (not e!74565))))

(assert (=> d!32391 (= res!56369 (simpleValid!79 newMap!16))))

(assert (=> d!32391 (= (valid!449 newMap!16) e!74565)))

(declare-fun b!114581 () Bool)

(declare-fun res!56370 () Bool)

(assert (=> b!114581 (=> (not res!56370) (not e!74565))))

(assert (=> b!114581 (= res!56370 (= (arrayCountValidKeys!0 (_keys!4405 newMap!16) #b00000000000000000000000000000000 (size!2377 (_keys!4405 newMap!16))) (_size!526 newMap!16)))))

(declare-fun b!114582 () Bool)

(declare-fun res!56371 () Bool)

(assert (=> b!114582 (=> (not res!56371) (not e!74565))))

(assert (=> b!114582 (= res!56371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4405 newMap!16) (mask!6879 newMap!16)))))

(declare-fun b!114583 () Bool)

(assert (=> b!114583 (= e!74565 (arrayNoDuplicates!0 (_keys!4405 newMap!16) #b00000000000000000000000000000000 Nil!1651))))

(assert (= (and d!32391 res!56369) b!114581))

(assert (= (and b!114581 res!56370) b!114582))

(assert (= (and b!114582 res!56371) b!114583))

(declare-fun m!130937 () Bool)

(assert (=> d!32391 m!130937))

(declare-fun m!130939 () Bool)

(assert (=> b!114581 m!130939))

(declare-fun m!130941 () Bool)

(assert (=> b!114582 m!130941))

(declare-fun m!130943 () Bool)

(assert (=> b!114583 m!130943))

(assert (=> b!114368 d!32391))

(declare-fun d!32393 () Bool)

(assert (=> d!32393 (= (valid!450 thiss!992) (valid!449 (v!2990 (underlying!388 thiss!992))))))

(declare-fun bs!4679 () Bool)

(assert (= bs!4679 d!32393))

(assert (=> bs!4679 m!130737))

(assert (=> start!13078 d!32393))

(declare-fun d!32395 () Bool)

(assert (=> d!32395 (not (arrayContainsKey!0 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!59699 () Unit!3572)

(declare-fun choose!68 (array!4467 (_ BitVec 32) (_ BitVec 64) List!1654) Unit!3572)

(assert (=> d!32395 (= lt!59699 (choose!68 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (Cons!1650 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) Nil!1651)))))

(assert (=> d!32395 (bvslt (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!32395 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (Cons!1650 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) Nil!1651)) lt!59699)))

(declare-fun bs!4680 () Bool)

(assert (= bs!4680 d!32395))

(assert (=> bs!4680 m!130743))

(assert (=> bs!4680 m!130773))

(assert (=> bs!4680 m!130743))

(declare-fun m!130945 () Bool)

(assert (=> bs!4680 m!130945))

(assert (=> b!114384 d!32395))

(declare-fun d!32397 () Bool)

(assert (=> d!32397 (arrayNoDuplicates!0 (_keys!4405 (v!2990 (underlying!388 thiss!992))) from!355 Nil!1651)))

(declare-fun lt!59702 () Unit!3572)

(declare-fun choose!39 (array!4467 (_ BitVec 32) (_ BitVec 32)) Unit!3572)

(assert (=> d!32397 (= lt!59702 (choose!39 (_keys!4405 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!32397 (bvslt (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!32397 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4405 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000000 from!355) lt!59702)))

(declare-fun bs!4681 () Bool)

(assert (= bs!4681 d!32397))

(assert (=> bs!4681 m!130769))

(declare-fun m!130947 () Bool)

(assert (=> bs!4681 m!130947))

(assert (=> b!114384 d!32397))

(declare-fun d!32399 () Bool)

(declare-fun res!56376 () Bool)

(declare-fun e!74570 () Bool)

(assert (=> d!32399 (=> res!56376 e!74570)))

(assert (=> d!32399 (= res!56376 (= (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(assert (=> d!32399 (= (arrayContainsKey!0 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!74570)))

(declare-fun b!114588 () Bool)

(declare-fun e!74571 () Bool)

(assert (=> b!114588 (= e!74570 e!74571)))

(declare-fun res!56377 () Bool)

(assert (=> b!114588 (=> (not res!56377) (not e!74571))))

(assert (=> b!114588 (= res!56377 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun b!114589 () Bool)

(assert (=> b!114589 (= e!74571 (arrayContainsKey!0 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!32399 (not res!56376)) b!114588))

(assert (= (and b!114588 res!56377) b!114589))

(declare-fun m!130949 () Bool)

(assert (=> d!32399 m!130949))

(assert (=> b!114589 m!130743))

(declare-fun m!130951 () Bool)

(assert (=> b!114589 m!130951))

(assert (=> b!114384 d!32399))

(declare-fun d!32401 () Bool)

(declare-fun e!74574 () Bool)

(assert (=> d!32401 e!74574))

(declare-fun c!20471 () Bool)

(assert (=> d!32401 (= c!20471 (and (not (= (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!59705 () Unit!3572)

(declare-fun choose!723 (array!4467 array!4469 (_ BitVec 32) (_ BitVec 32) V!3291 V!3291 (_ BitVec 64) (_ BitVec 32) Int) Unit!3572)

(assert (=> d!32401 (= lt!59705 (choose!723 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (_values!2666 (v!2990 (underlying!388 thiss!992))) (mask!6879 (v!2990 (underlying!388 thiss!992))) (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) (minValue!2550 (v!2990 (underlying!388 thiss!992))) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!32401 (validMask!0 (mask!6879 (v!2990 (underlying!388 thiss!992))))))

(assert (=> d!32401 (= (lemmaListMapContainsThenArrayContainsFrom!120 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (_values!2666 (v!2990 (underlying!388 thiss!992))) (mask!6879 (v!2990 (underlying!388 thiss!992))) (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) (minValue!2550 (v!2990 (underlying!388 thiss!992))) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992)))) lt!59705)))

(declare-fun b!114594 () Bool)

(assert (=> b!114594 (= e!74574 (arrayContainsKey!0 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!114595 () Bool)

(assert (=> b!114595 (= e!74574 (ite (= (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!32401 c!20471) b!114594))

(assert (= (and d!32401 (not c!20471)) b!114595))

(assert (=> d!32401 m!130743))

(declare-fun m!130953 () Bool)

(assert (=> d!32401 m!130953))

(declare-fun m!130955 () Bool)

(assert (=> d!32401 m!130955))

(assert (=> b!114594 m!130743))

(assert (=> b!114594 m!130773))

(assert (=> b!114384 d!32401))

(declare-fun b!114607 () Bool)

(declare-fun e!74583 () Bool)

(declare-fun call!12346 () Bool)

(assert (=> b!114607 (= e!74583 call!12346)))

(declare-fun b!114608 () Bool)

(declare-fun e!74586 () Bool)

(assert (=> b!114608 (= e!74586 e!74583)))

(declare-fun c!20474 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!114608 (= c!20474 (validKeyInArray!0 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun bm!12343 () Bool)

(assert (=> bm!12343 (= call!12346 (arrayNoDuplicates!0 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!20474 (Cons!1650 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) Nil!1651) Nil!1651)))))

(declare-fun b!114609 () Bool)

(declare-fun e!74585 () Bool)

(declare-fun contains!855 (List!1654 (_ BitVec 64)) Bool)

(assert (=> b!114609 (= e!74585 (contains!855 Nil!1651 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun b!114610 () Bool)

(assert (=> b!114610 (= e!74583 call!12346)))

(declare-fun d!32403 () Bool)

(declare-fun res!56386 () Bool)

(declare-fun e!74584 () Bool)

(assert (=> d!32403 (=> res!56386 e!74584)))

(assert (=> d!32403 (= res!56386 (bvsge from!355 (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992))))))))

(assert (=> d!32403 (= (arrayNoDuplicates!0 (_keys!4405 (v!2990 (underlying!388 thiss!992))) from!355 Nil!1651) e!74584)))

(declare-fun b!114606 () Bool)

(assert (=> b!114606 (= e!74584 e!74586)))

(declare-fun res!56384 () Bool)

(assert (=> b!114606 (=> (not res!56384) (not e!74586))))

(assert (=> b!114606 (= res!56384 (not e!74585))))

(declare-fun res!56385 () Bool)

(assert (=> b!114606 (=> (not res!56385) (not e!74585))))

(assert (=> b!114606 (= res!56385 (validKeyInArray!0 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(assert (= (and d!32403 (not res!56386)) b!114606))

(assert (= (and b!114606 res!56385) b!114609))

(assert (= (and b!114606 res!56384) b!114608))

(assert (= (and b!114608 c!20474) b!114607))

(assert (= (and b!114608 (not c!20474)) b!114610))

(assert (= (or b!114607 b!114610) bm!12343))

(assert (=> b!114608 m!130743))

(assert (=> b!114608 m!130743))

(declare-fun m!130957 () Bool)

(assert (=> b!114608 m!130957))

(assert (=> bm!12343 m!130743))

(declare-fun m!130959 () Bool)

(assert (=> bm!12343 m!130959))

(assert (=> b!114609 m!130743))

(assert (=> b!114609 m!130743))

(declare-fun m!130961 () Bool)

(assert (=> b!114609 m!130961))

(assert (=> b!114606 m!130743))

(assert (=> b!114606 m!130743))

(assert (=> b!114606 m!130957))

(assert (=> b!114384 d!32403))

(declare-fun d!32405 () Bool)

(declare-fun c!20477 () Bool)

(assert (=> d!32405 (= c!20477 ((_ is ValueCellFull!1023) (select (arr!2118 (_values!2666 (v!2990 (underlying!388 thiss!992)))) from!355)))))

(declare-fun e!74589 () V!3291)

(assert (=> d!32405 (= (get!1377 (select (arr!2118 (_values!2666 (v!2990 (underlying!388 thiss!992)))) from!355) (dynLambda!399 (defaultEntry!2683 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!74589)))

(declare-fun b!114615 () Bool)

(declare-fun get!1378 (ValueCell!1023 V!3291) V!3291)

(assert (=> b!114615 (= e!74589 (get!1378 (select (arr!2118 (_values!2666 (v!2990 (underlying!388 thiss!992)))) from!355) (dynLambda!399 (defaultEntry!2683 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114616 () Bool)

(declare-fun get!1379 (ValueCell!1023 V!3291) V!3291)

(assert (=> b!114616 (= e!74589 (get!1379 (select (arr!2118 (_values!2666 (v!2990 (underlying!388 thiss!992)))) from!355) (dynLambda!399 (defaultEntry!2683 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32405 c!20477) b!114615))

(assert (= (and d!32405 (not c!20477)) b!114616))

(assert (=> b!114615 m!130789))

(assert (=> b!114615 m!130791))

(declare-fun m!130963 () Bool)

(assert (=> b!114615 m!130963))

(assert (=> b!114616 m!130789))

(assert (=> b!114616 m!130791))

(declare-fun m!130965 () Bool)

(assert (=> b!114616 m!130965))

(assert (=> b!114377 d!32405))

(declare-fun d!32407 () Bool)

(declare-fun e!74592 () Bool)

(assert (=> d!32407 e!74592))

(declare-fun res!56392 () Bool)

(assert (=> d!32407 (=> (not res!56392) (not e!74592))))

(declare-fun lt!59715 () ListLongMap!1617)

(assert (=> d!32407 (= res!56392 (contains!854 lt!59715 (_1!1253 lt!59542)))))

(declare-fun lt!59716 () List!1653)

(assert (=> d!32407 (= lt!59715 (ListLongMap!1618 lt!59716))))

(declare-fun lt!59714 () Unit!3572)

(declare-fun lt!59717 () Unit!3572)

(assert (=> d!32407 (= lt!59714 lt!59717)))

(assert (=> d!32407 (= (getValueByKey!161 lt!59716 (_1!1253 lt!59542)) (Some!166 (_2!1253 lt!59542)))))

(declare-fun lemmaContainsTupThenGetReturnValue!77 (List!1653 (_ BitVec 64) V!3291) Unit!3572)

(assert (=> d!32407 (= lt!59717 (lemmaContainsTupThenGetReturnValue!77 lt!59716 (_1!1253 lt!59542) (_2!1253 lt!59542)))))

(declare-fun insertStrictlySorted!80 (List!1653 (_ BitVec 64) V!3291) List!1653)

(assert (=> d!32407 (= lt!59716 (insertStrictlySorted!80 (toList!824 lt!59545) (_1!1253 lt!59542) (_2!1253 lt!59542)))))

(assert (=> d!32407 (= (+!161 lt!59545 lt!59542) lt!59715)))

(declare-fun b!114621 () Bool)

(declare-fun res!56391 () Bool)

(assert (=> b!114621 (=> (not res!56391) (not e!74592))))

(assert (=> b!114621 (= res!56391 (= (getValueByKey!161 (toList!824 lt!59715) (_1!1253 lt!59542)) (Some!166 (_2!1253 lt!59542))))))

(declare-fun b!114622 () Bool)

(declare-fun contains!856 (List!1653 tuple2!2484) Bool)

(assert (=> b!114622 (= e!74592 (contains!856 (toList!824 lt!59715) lt!59542))))

(assert (= (and d!32407 res!56392) b!114621))

(assert (= (and b!114621 res!56391) b!114622))

(declare-fun m!130967 () Bool)

(assert (=> d!32407 m!130967))

(declare-fun m!130969 () Bool)

(assert (=> d!32407 m!130969))

(declare-fun m!130971 () Bool)

(assert (=> d!32407 m!130971))

(declare-fun m!130973 () Bool)

(assert (=> d!32407 m!130973))

(declare-fun m!130975 () Bool)

(assert (=> b!114621 m!130975))

(declare-fun m!130977 () Bool)

(assert (=> b!114622 m!130977))

(assert (=> b!114383 d!32407))

(declare-fun d!32409 () Bool)

(declare-fun res!56393 () Bool)

(declare-fun e!74593 () Bool)

(assert (=> d!32409 (=> (not res!56393) (not e!74593))))

(assert (=> d!32409 (= res!56393 (simpleValid!79 (_2!1254 lt!59540)))))

(assert (=> d!32409 (= (valid!449 (_2!1254 lt!59540)) e!74593)))

(declare-fun b!114623 () Bool)

(declare-fun res!56394 () Bool)

(assert (=> b!114623 (=> (not res!56394) (not e!74593))))

(assert (=> b!114623 (= res!56394 (= (arrayCountValidKeys!0 (_keys!4405 (_2!1254 lt!59540)) #b00000000000000000000000000000000 (size!2377 (_keys!4405 (_2!1254 lt!59540)))) (_size!526 (_2!1254 lt!59540))))))

(declare-fun b!114624 () Bool)

(declare-fun res!56395 () Bool)

(assert (=> b!114624 (=> (not res!56395) (not e!74593))))

(assert (=> b!114624 (= res!56395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4405 (_2!1254 lt!59540)) (mask!6879 (_2!1254 lt!59540))))))

(declare-fun b!114625 () Bool)

(assert (=> b!114625 (= e!74593 (arrayNoDuplicates!0 (_keys!4405 (_2!1254 lt!59540)) #b00000000000000000000000000000000 Nil!1651))))

(assert (= (and d!32409 res!56393) b!114623))

(assert (= (and b!114623 res!56394) b!114624))

(assert (= (and b!114624 res!56395) b!114625))

(declare-fun m!130979 () Bool)

(assert (=> d!32409 m!130979))

(declare-fun m!130981 () Bool)

(assert (=> b!114623 m!130981))

(declare-fun m!130983 () Bool)

(assert (=> b!114624 m!130983))

(declare-fun m!130985 () Bool)

(assert (=> b!114625 m!130985))

(assert (=> b!114383 d!32409))

(declare-fun d!32411 () Bool)

(declare-fun e!74594 () Bool)

(assert (=> d!32411 e!74594))

(declare-fun res!56397 () Bool)

(assert (=> d!32411 (=> (not res!56397) (not e!74594))))

(declare-fun lt!59719 () ListLongMap!1617)

(assert (=> d!32411 (= res!56397 (contains!854 lt!59719 (_1!1253 lt!59532)))))

(declare-fun lt!59720 () List!1653)

(assert (=> d!32411 (= lt!59719 (ListLongMap!1618 lt!59720))))

(declare-fun lt!59718 () Unit!3572)

(declare-fun lt!59721 () Unit!3572)

(assert (=> d!32411 (= lt!59718 lt!59721)))

(assert (=> d!32411 (= (getValueByKey!161 lt!59720 (_1!1253 lt!59532)) (Some!166 (_2!1253 lt!59532)))))

(assert (=> d!32411 (= lt!59721 (lemmaContainsTupThenGetReturnValue!77 lt!59720 (_1!1253 lt!59532) (_2!1253 lt!59532)))))

(assert (=> d!32411 (= lt!59720 (insertStrictlySorted!80 (toList!824 lt!59541) (_1!1253 lt!59532) (_2!1253 lt!59532)))))

(assert (=> d!32411 (= (+!161 lt!59541 lt!59532) lt!59719)))

(declare-fun b!114626 () Bool)

(declare-fun res!56396 () Bool)

(assert (=> b!114626 (=> (not res!56396) (not e!74594))))

(assert (=> b!114626 (= res!56396 (= (getValueByKey!161 (toList!824 lt!59719) (_1!1253 lt!59532)) (Some!166 (_2!1253 lt!59532))))))

(declare-fun b!114627 () Bool)

(assert (=> b!114627 (= e!74594 (contains!856 (toList!824 lt!59719) lt!59532))))

(assert (= (and d!32411 res!56397) b!114626))

(assert (= (and b!114626 res!56396) b!114627))

(declare-fun m!130987 () Bool)

(assert (=> d!32411 m!130987))

(declare-fun m!130989 () Bool)

(assert (=> d!32411 m!130989))

(declare-fun m!130991 () Bool)

(assert (=> d!32411 m!130991))

(declare-fun m!130993 () Bool)

(assert (=> d!32411 m!130993))

(declare-fun m!130995 () Bool)

(assert (=> b!114626 m!130995))

(declare-fun m!130997 () Bool)

(assert (=> b!114627 m!130997))

(assert (=> b!114383 d!32411))

(declare-fun d!32413 () Bool)

(declare-fun e!74595 () Bool)

(assert (=> d!32413 e!74595))

(declare-fun res!56399 () Bool)

(assert (=> d!32413 (=> (not res!56399) (not e!74595))))

(declare-fun lt!59723 () ListLongMap!1617)

(assert (=> d!32413 (= res!56399 (contains!854 lt!59723 (_1!1253 lt!59538)))))

(declare-fun lt!59724 () List!1653)

(assert (=> d!32413 (= lt!59723 (ListLongMap!1618 lt!59724))))

(declare-fun lt!59722 () Unit!3572)

(declare-fun lt!59725 () Unit!3572)

(assert (=> d!32413 (= lt!59722 lt!59725)))

(assert (=> d!32413 (= (getValueByKey!161 lt!59724 (_1!1253 lt!59538)) (Some!166 (_2!1253 lt!59538)))))

(assert (=> d!32413 (= lt!59725 (lemmaContainsTupThenGetReturnValue!77 lt!59724 (_1!1253 lt!59538) (_2!1253 lt!59538)))))

(assert (=> d!32413 (= lt!59724 (insertStrictlySorted!80 (toList!824 lt!59545) (_1!1253 lt!59538) (_2!1253 lt!59538)))))

(assert (=> d!32413 (= (+!161 lt!59545 lt!59538) lt!59723)))

(declare-fun b!114628 () Bool)

(declare-fun res!56398 () Bool)

(assert (=> b!114628 (=> (not res!56398) (not e!74595))))

(assert (=> b!114628 (= res!56398 (= (getValueByKey!161 (toList!824 lt!59723) (_1!1253 lt!59538)) (Some!166 (_2!1253 lt!59538))))))

(declare-fun b!114629 () Bool)

(assert (=> b!114629 (= e!74595 (contains!856 (toList!824 lt!59723) lt!59538))))

(assert (= (and d!32413 res!56399) b!114628))

(assert (= (and b!114628 res!56398) b!114629))

(declare-fun m!130999 () Bool)

(assert (=> d!32413 m!130999))

(declare-fun m!131001 () Bool)

(assert (=> d!32413 m!131001))

(declare-fun m!131003 () Bool)

(assert (=> d!32413 m!131003))

(declare-fun m!131005 () Bool)

(assert (=> d!32413 m!131005))

(declare-fun m!131007 () Bool)

(assert (=> b!114628 m!131007))

(declare-fun m!131009 () Bool)

(assert (=> b!114629 m!131009))

(assert (=> b!114383 d!32413))

(declare-fun d!32415 () Bool)

(declare-fun e!74596 () Bool)

(assert (=> d!32415 e!74596))

(declare-fun res!56401 () Bool)

(assert (=> d!32415 (=> (not res!56401) (not e!74596))))

(declare-fun lt!59727 () ListLongMap!1617)

(assert (=> d!32415 (= res!56401 (contains!854 lt!59727 (_1!1253 lt!59542)))))

(declare-fun lt!59728 () List!1653)

(assert (=> d!32415 (= lt!59727 (ListLongMap!1618 lt!59728))))

(declare-fun lt!59726 () Unit!3572)

(declare-fun lt!59729 () Unit!3572)

(assert (=> d!32415 (= lt!59726 lt!59729)))

(assert (=> d!32415 (= (getValueByKey!161 lt!59728 (_1!1253 lt!59542)) (Some!166 (_2!1253 lt!59542)))))

(assert (=> d!32415 (= lt!59729 (lemmaContainsTupThenGetReturnValue!77 lt!59728 (_1!1253 lt!59542) (_2!1253 lt!59542)))))

(assert (=> d!32415 (= lt!59728 (insertStrictlySorted!80 (toList!824 lt!59541) (_1!1253 lt!59542) (_2!1253 lt!59542)))))

(assert (=> d!32415 (= (+!161 lt!59541 lt!59542) lt!59727)))

(declare-fun b!114630 () Bool)

(declare-fun res!56400 () Bool)

(assert (=> b!114630 (=> (not res!56400) (not e!74596))))

(assert (=> b!114630 (= res!56400 (= (getValueByKey!161 (toList!824 lt!59727) (_1!1253 lt!59542)) (Some!166 (_2!1253 lt!59542))))))

(declare-fun b!114631 () Bool)

(assert (=> b!114631 (= e!74596 (contains!856 (toList!824 lt!59727) lt!59542))))

(assert (= (and d!32415 res!56401) b!114630))

(assert (= (and b!114630 res!56400) b!114631))

(declare-fun m!131011 () Bool)

(assert (=> d!32415 m!131011))

(declare-fun m!131013 () Bool)

(assert (=> d!32415 m!131013))

(declare-fun m!131015 () Bool)

(assert (=> d!32415 m!131015))

(declare-fun m!131017 () Bool)

(assert (=> d!32415 m!131017))

(declare-fun m!131019 () Bool)

(assert (=> b!114630 m!131019))

(declare-fun m!131021 () Bool)

(assert (=> b!114631 m!131021))

(assert (=> b!114383 d!32415))

(declare-fun bm!12346 () Bool)

(declare-fun call!12349 () ListLongMap!1617)

(assert (=> bm!12346 (= call!12349 (getCurrentListMapNoExtraKeys!127 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (_values!2666 (v!2990 (underlying!388 thiss!992))) (mask!6879 (v!2990 (underlying!388 thiss!992))) (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) (minValue!2550 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun b!114656 () Bool)

(assert (=> b!114656 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992))))))))

(assert (=> b!114656 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2378 (_values!2666 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun e!74615 () Bool)

(declare-fun lt!59745 () ListLongMap!1617)

(declare-fun apply!103 (ListLongMap!1617 (_ BitVec 64)) V!3291)

(assert (=> b!114656 (= e!74615 (= (apply!103 lt!59745 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1377 (select (arr!2118 (_values!2666 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!399 (defaultEntry!2683 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!114657 () Bool)

(declare-fun e!74612 () Bool)

(assert (=> b!114657 (= e!74612 (validKeyInArray!0 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!114657 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!114658 () Bool)

(declare-fun e!74613 () Bool)

(declare-fun e!74614 () Bool)

(assert (=> b!114658 (= e!74613 e!74614)))

(declare-fun c!20488 () Bool)

(assert (=> b!114658 (= c!20488 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun b!114659 () Bool)

(assert (=> b!114659 (= e!74613 e!74615)))

(assert (=> b!114659 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun res!56410 () Bool)

(assert (=> b!114659 (= res!56410 (contains!854 lt!59745 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!114659 (=> (not res!56410) (not e!74615))))

(declare-fun b!114661 () Bool)

(declare-fun e!74617 () ListLongMap!1617)

(declare-fun e!74616 () ListLongMap!1617)

(assert (=> b!114661 (= e!74617 e!74616)))

(declare-fun c!20486 () Bool)

(assert (=> b!114661 (= c!20486 (validKeyInArray!0 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!32417 () Bool)

(declare-fun e!74611 () Bool)

(assert (=> d!32417 e!74611))

(declare-fun res!56412 () Bool)

(assert (=> d!32417 (=> (not res!56412) (not e!74611))))

(assert (=> d!32417 (= res!56412 (not (contains!854 lt!59745 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32417 (= lt!59745 e!74617)))

(declare-fun c!20487 () Bool)

(assert (=> d!32417 (= c!20487 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992))))))))

(assert (=> d!32417 (validMask!0 (mask!6879 (v!2990 (underlying!388 thiss!992))))))

(assert (=> d!32417 (= (getCurrentListMapNoExtraKeys!127 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (_values!2666 (v!2990 (underlying!388 thiss!992))) (mask!6879 (v!2990 (underlying!388 thiss!992))) (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) (minValue!2550 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992)))) lt!59745)))

(declare-fun b!114660 () Bool)

(declare-fun res!56413 () Bool)

(assert (=> b!114660 (=> (not res!56413) (not e!74611))))

(assert (=> b!114660 (= res!56413 (not (contains!854 lt!59745 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114662 () Bool)

(declare-fun isEmpty!385 (ListLongMap!1617) Bool)

(assert (=> b!114662 (= e!74614 (isEmpty!385 lt!59745))))

(declare-fun b!114663 () Bool)

(assert (=> b!114663 (= e!74616 call!12349)))

(declare-fun b!114664 () Bool)

(assert (=> b!114664 (= e!74611 e!74613)))

(declare-fun c!20489 () Bool)

(assert (=> b!114664 (= c!20489 e!74612)))

(declare-fun res!56411 () Bool)

(assert (=> b!114664 (=> (not res!56411) (not e!74612))))

(assert (=> b!114664 (= res!56411 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun b!114665 () Bool)

(declare-fun lt!59746 () Unit!3572)

(declare-fun lt!59750 () Unit!3572)

(assert (=> b!114665 (= lt!59746 lt!59750)))

(declare-fun lt!59749 () (_ BitVec 64))

(declare-fun lt!59747 () ListLongMap!1617)

(declare-fun lt!59748 () V!3291)

(declare-fun lt!59744 () (_ BitVec 64))

(assert (=> b!114665 (not (contains!854 (+!161 lt!59747 (tuple2!2485 lt!59744 lt!59748)) lt!59749))))

(declare-fun addStillNotContains!51 (ListLongMap!1617 (_ BitVec 64) V!3291 (_ BitVec 64)) Unit!3572)

(assert (=> b!114665 (= lt!59750 (addStillNotContains!51 lt!59747 lt!59744 lt!59748 lt!59749))))

(assert (=> b!114665 (= lt!59749 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!114665 (= lt!59748 (get!1377 (select (arr!2118 (_values!2666 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!399 (defaultEntry!2683 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114665 (= lt!59744 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!114665 (= lt!59747 call!12349)))

(assert (=> b!114665 (= e!74616 (+!161 call!12349 (tuple2!2485 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1377 (select (arr!2118 (_values!2666 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!399 (defaultEntry!2683 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!114666 () Bool)

(assert (=> b!114666 (= e!74617 (ListLongMap!1618 Nil!1650))))

(declare-fun b!114667 () Bool)

(assert (=> b!114667 (= e!74614 (= lt!59745 (getCurrentListMapNoExtraKeys!127 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (_values!2666 (v!2990 (underlying!388 thiss!992))) (mask!6879 (v!2990 (underlying!388 thiss!992))) (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) (minValue!2550 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992))))))))

(assert (= (and d!32417 c!20487) b!114666))

(assert (= (and d!32417 (not c!20487)) b!114661))

(assert (= (and b!114661 c!20486) b!114665))

(assert (= (and b!114661 (not c!20486)) b!114663))

(assert (= (or b!114665 b!114663) bm!12346))

(assert (= (and d!32417 res!56412) b!114660))

(assert (= (and b!114660 res!56413) b!114664))

(assert (= (and b!114664 res!56411) b!114657))

(assert (= (and b!114664 c!20489) b!114659))

(assert (= (and b!114664 (not c!20489)) b!114658))

(assert (= (and b!114659 res!56410) b!114656))

(assert (= (and b!114658 c!20488) b!114667))

(assert (= (and b!114658 (not c!20488)) b!114662))

(declare-fun b_lambda!5119 () Bool)

(assert (=> (not b_lambda!5119) (not b!114656)))

(assert (=> b!114656 t!5876))

(declare-fun b_and!7075 () Bool)

(assert (= b_and!7063 (and (=> t!5876 result!3653) b_and!7075)))

(assert (=> b!114656 t!5878))

(declare-fun b_and!7077 () Bool)

(assert (= b_and!7065 (and (=> t!5878 result!3657) b_and!7077)))

(declare-fun b_lambda!5121 () Bool)

(assert (=> (not b_lambda!5121) (not b!114665)))

(assert (=> b!114665 t!5876))

(declare-fun b_and!7079 () Bool)

(assert (= b_and!7075 (and (=> t!5876 result!3653) b_and!7079)))

(assert (=> b!114665 t!5878))

(declare-fun b_and!7081 () Bool)

(assert (= b_and!7077 (and (=> t!5878 result!3657) b_and!7081)))

(assert (=> b!114661 m!130949))

(assert (=> b!114661 m!130949))

(declare-fun m!131023 () Bool)

(assert (=> b!114661 m!131023))

(declare-fun m!131025 () Bool)

(assert (=> bm!12346 m!131025))

(assert (=> b!114659 m!130949))

(assert (=> b!114659 m!130949))

(declare-fun m!131027 () Bool)

(assert (=> b!114659 m!131027))

(declare-fun m!131029 () Bool)

(assert (=> d!32417 m!131029))

(assert (=> d!32417 m!130955))

(assert (=> b!114657 m!130949))

(assert (=> b!114657 m!130949))

(assert (=> b!114657 m!131023))

(declare-fun m!131031 () Bool)

(assert (=> b!114662 m!131031))

(declare-fun m!131033 () Bool)

(assert (=> b!114660 m!131033))

(declare-fun m!131035 () Bool)

(assert (=> b!114665 m!131035))

(declare-fun m!131037 () Bool)

(assert (=> b!114665 m!131037))

(assert (=> b!114665 m!130791))

(assert (=> b!114665 m!130949))

(declare-fun m!131039 () Bool)

(assert (=> b!114665 m!131039))

(declare-fun m!131041 () Bool)

(assert (=> b!114665 m!131041))

(assert (=> b!114665 m!131037))

(assert (=> b!114665 m!130791))

(declare-fun m!131043 () Bool)

(assert (=> b!114665 m!131043))

(assert (=> b!114665 m!131041))

(declare-fun m!131045 () Bool)

(assert (=> b!114665 m!131045))

(assert (=> b!114667 m!131025))

(assert (=> b!114656 m!131037))

(assert (=> b!114656 m!130791))

(assert (=> b!114656 m!130949))

(assert (=> b!114656 m!130949))

(declare-fun m!131047 () Bool)

(assert (=> b!114656 m!131047))

(assert (=> b!114656 m!131037))

(assert (=> b!114656 m!130791))

(assert (=> b!114656 m!131043))

(assert (=> b!114383 d!32417))

(declare-fun d!32419 () Bool)

(assert (=> d!32419 (= (+!161 (+!161 lt!59541 (tuple2!2485 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544)) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2550 (v!2990 (underlying!388 thiss!992))))) (+!161 (+!161 lt!59541 (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2550 (v!2990 (underlying!388 thiss!992))))) (tuple2!2485 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544)))))

(declare-fun lt!59753 () Unit!3572)

(declare-fun choose!724 (ListLongMap!1617 (_ BitVec 64) V!3291 (_ BitVec 64) V!3291) Unit!3572)

(assert (=> d!32419 (= lt!59753 (choose!724 lt!59541 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2550 (v!2990 (underlying!388 thiss!992)))))))

(assert (=> d!32419 (not (= (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32419 (= (addCommutativeForDiffKeys!73 lt!59541 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2550 (v!2990 (underlying!388 thiss!992)))) lt!59753)))

(declare-fun bs!4682 () Bool)

(assert (= bs!4682 d!32419))

(declare-fun m!131049 () Bool)

(assert (=> bs!4682 m!131049))

(declare-fun m!131051 () Bool)

(assert (=> bs!4682 m!131051))

(declare-fun m!131053 () Bool)

(assert (=> bs!4682 m!131053))

(declare-fun m!131055 () Bool)

(assert (=> bs!4682 m!131055))

(assert (=> bs!4682 m!130743))

(declare-fun m!131057 () Bool)

(assert (=> bs!4682 m!131057))

(assert (=> bs!4682 m!131053))

(assert (=> bs!4682 m!131049))

(assert (=> b!114383 d!32419))

(declare-fun d!32421 () Bool)

(declare-fun e!74618 () Bool)

(assert (=> d!32421 e!74618))

(declare-fun res!56415 () Bool)

(assert (=> d!32421 (=> (not res!56415) (not e!74618))))

(declare-fun lt!59755 () ListLongMap!1617)

(assert (=> d!32421 (= res!56415 (contains!854 lt!59755 (_1!1253 lt!59538)))))

(declare-fun lt!59756 () List!1653)

(assert (=> d!32421 (= lt!59755 (ListLongMap!1618 lt!59756))))

(declare-fun lt!59754 () Unit!3572)

(declare-fun lt!59757 () Unit!3572)

(assert (=> d!32421 (= lt!59754 lt!59757)))

(assert (=> d!32421 (= (getValueByKey!161 lt!59756 (_1!1253 lt!59538)) (Some!166 (_2!1253 lt!59538)))))

(assert (=> d!32421 (= lt!59757 (lemmaContainsTupThenGetReturnValue!77 lt!59756 (_1!1253 lt!59538) (_2!1253 lt!59538)))))

(assert (=> d!32421 (= lt!59756 (insertStrictlySorted!80 (toList!824 lt!59549) (_1!1253 lt!59538) (_2!1253 lt!59538)))))

(assert (=> d!32421 (= (+!161 lt!59549 lt!59538) lt!59755)))

(declare-fun b!114668 () Bool)

(declare-fun res!56414 () Bool)

(assert (=> b!114668 (=> (not res!56414) (not e!74618))))

(assert (=> b!114668 (= res!56414 (= (getValueByKey!161 (toList!824 lt!59755) (_1!1253 lt!59538)) (Some!166 (_2!1253 lt!59538))))))

(declare-fun b!114669 () Bool)

(assert (=> b!114669 (= e!74618 (contains!856 (toList!824 lt!59755) lt!59538))))

(assert (= (and d!32421 res!56415) b!114668))

(assert (= (and b!114668 res!56414) b!114669))

(declare-fun m!131059 () Bool)

(assert (=> d!32421 m!131059))

(declare-fun m!131061 () Bool)

(assert (=> d!32421 m!131061))

(declare-fun m!131063 () Bool)

(assert (=> d!32421 m!131063))

(declare-fun m!131065 () Bool)

(assert (=> d!32421 m!131065))

(declare-fun m!131067 () Bool)

(assert (=> b!114668 m!131067))

(declare-fun m!131069 () Bool)

(assert (=> b!114669 m!131069))

(assert (=> b!114383 d!32421))

(declare-fun d!32423 () Bool)

(declare-fun e!74619 () Bool)

(assert (=> d!32423 e!74619))

(declare-fun res!56417 () Bool)

(assert (=> d!32423 (=> (not res!56417) (not e!74619))))

(declare-fun lt!59759 () ListLongMap!1617)

(assert (=> d!32423 (= res!56417 (contains!854 lt!59759 (_1!1253 lt!59532)))))

(declare-fun lt!59760 () List!1653)

(assert (=> d!32423 (= lt!59759 (ListLongMap!1618 lt!59760))))

(declare-fun lt!59758 () Unit!3572)

(declare-fun lt!59761 () Unit!3572)

(assert (=> d!32423 (= lt!59758 lt!59761)))

(assert (=> d!32423 (= (getValueByKey!161 lt!59760 (_1!1253 lt!59532)) (Some!166 (_2!1253 lt!59532)))))

(assert (=> d!32423 (= lt!59761 (lemmaContainsTupThenGetReturnValue!77 lt!59760 (_1!1253 lt!59532) (_2!1253 lt!59532)))))

(assert (=> d!32423 (= lt!59760 (insertStrictlySorted!80 (toList!824 lt!59534) (_1!1253 lt!59532) (_2!1253 lt!59532)))))

(assert (=> d!32423 (= (+!161 lt!59534 lt!59532) lt!59759)))

(declare-fun b!114670 () Bool)

(declare-fun res!56416 () Bool)

(assert (=> b!114670 (=> (not res!56416) (not e!74619))))

(assert (=> b!114670 (= res!56416 (= (getValueByKey!161 (toList!824 lt!59759) (_1!1253 lt!59532)) (Some!166 (_2!1253 lt!59532))))))

(declare-fun b!114671 () Bool)

(assert (=> b!114671 (= e!74619 (contains!856 (toList!824 lt!59759) lt!59532))))

(assert (= (and d!32423 res!56417) b!114670))

(assert (= (and b!114670 res!56416) b!114671))

(declare-fun m!131071 () Bool)

(assert (=> d!32423 m!131071))

(declare-fun m!131073 () Bool)

(assert (=> d!32423 m!131073))

(declare-fun m!131075 () Bool)

(assert (=> d!32423 m!131075))

(declare-fun m!131077 () Bool)

(assert (=> d!32423 m!131077))

(declare-fun m!131079 () Bool)

(assert (=> b!114670 m!131079))

(declare-fun m!131081 () Bool)

(assert (=> b!114671 m!131081))

(assert (=> b!114383 d!32423))

(declare-fun d!32425 () Bool)

(declare-fun e!74620 () Bool)

(assert (=> d!32425 e!74620))

(declare-fun res!56419 () Bool)

(assert (=> d!32425 (=> (not res!56419) (not e!74620))))

(declare-fun lt!59763 () ListLongMap!1617)

(assert (=> d!32425 (= res!56419 (contains!854 lt!59763 (_1!1253 lt!59542)))))

(declare-fun lt!59764 () List!1653)

(assert (=> d!32425 (= lt!59763 (ListLongMap!1618 lt!59764))))

(declare-fun lt!59762 () Unit!3572)

(declare-fun lt!59765 () Unit!3572)

(assert (=> d!32425 (= lt!59762 lt!59765)))

(assert (=> d!32425 (= (getValueByKey!161 lt!59764 (_1!1253 lt!59542)) (Some!166 (_2!1253 lt!59542)))))

(assert (=> d!32425 (= lt!59765 (lemmaContainsTupThenGetReturnValue!77 lt!59764 (_1!1253 lt!59542) (_2!1253 lt!59542)))))

(assert (=> d!32425 (= lt!59764 (insertStrictlySorted!80 (toList!824 (+!161 lt!59545 lt!59538)) (_1!1253 lt!59542) (_2!1253 lt!59542)))))

(assert (=> d!32425 (= (+!161 (+!161 lt!59545 lt!59538) lt!59542) lt!59763)))

(declare-fun b!114672 () Bool)

(declare-fun res!56418 () Bool)

(assert (=> b!114672 (=> (not res!56418) (not e!74620))))

(assert (=> b!114672 (= res!56418 (= (getValueByKey!161 (toList!824 lt!59763) (_1!1253 lt!59542)) (Some!166 (_2!1253 lt!59542))))))

(declare-fun b!114673 () Bool)

(assert (=> b!114673 (= e!74620 (contains!856 (toList!824 lt!59763) lt!59542))))

(assert (= (and d!32425 res!56419) b!114672))

(assert (= (and b!114672 res!56418) b!114673))

(declare-fun m!131083 () Bool)

(assert (=> d!32425 m!131083))

(declare-fun m!131085 () Bool)

(assert (=> d!32425 m!131085))

(declare-fun m!131087 () Bool)

(assert (=> d!32425 m!131087))

(declare-fun m!131089 () Bool)

(assert (=> d!32425 m!131089))

(declare-fun m!131091 () Bool)

(assert (=> b!114672 m!131091))

(declare-fun m!131093 () Bool)

(assert (=> b!114673 m!131093))

(assert (=> b!114383 d!32425))

(declare-fun d!32427 () Bool)

(assert (=> d!32427 (= (+!161 (+!161 lt!59545 (tuple2!2485 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544)) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2550 (v!2990 (underlying!388 thiss!992))))) (+!161 (+!161 lt!59545 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2550 (v!2990 (underlying!388 thiss!992))))) (tuple2!2485 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544)))))

(declare-fun lt!59766 () Unit!3572)

(assert (=> d!32427 (= lt!59766 (choose!724 lt!59545 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2550 (v!2990 (underlying!388 thiss!992)))))))

(assert (=> d!32427 (not (= (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32427 (= (addCommutativeForDiffKeys!73 lt!59545 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) from!355) lt!59544 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2550 (v!2990 (underlying!388 thiss!992)))) lt!59766)))

(declare-fun bs!4683 () Bool)

(assert (= bs!4683 d!32427))

(declare-fun m!131095 () Bool)

(assert (=> bs!4683 m!131095))

(declare-fun m!131097 () Bool)

(assert (=> bs!4683 m!131097))

(declare-fun m!131099 () Bool)

(assert (=> bs!4683 m!131099))

(declare-fun m!131101 () Bool)

(assert (=> bs!4683 m!131101))

(assert (=> bs!4683 m!130743))

(declare-fun m!131103 () Bool)

(assert (=> bs!4683 m!131103))

(assert (=> bs!4683 m!131099))

(assert (=> bs!4683 m!131095))

(assert (=> b!114383 d!32427))

(declare-fun d!32429 () Bool)

(assert (=> d!32429 (= (map!1322 newMap!16) (getCurrentListMap!507 (_keys!4405 newMap!16) (_values!2666 newMap!16) (mask!6879 newMap!16) (extraKeys!2472 newMap!16) (zeroValue!2550 newMap!16) (minValue!2550 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2683 newMap!16)))))

(declare-fun bs!4684 () Bool)

(assert (= bs!4684 d!32429))

(assert (=> bs!4684 m!130907))

(assert (=> b!114365 d!32429))

(declare-fun b!114716 () Bool)

(declare-fun e!74659 () ListLongMap!1617)

(declare-fun call!12365 () ListLongMap!1617)

(assert (=> b!114716 (= e!74659 (+!161 call!12365 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2550 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun b!114717 () Bool)

(declare-fun e!74652 () Bool)

(declare-fun lt!59830 () ListLongMap!1617)

(assert (=> b!114717 (= e!74652 (= (apply!103 lt!59830 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2550 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun bm!12361 () Bool)

(declare-fun call!12370 () ListLongMap!1617)

(declare-fun c!20507 () Bool)

(declare-fun call!12369 () ListLongMap!1617)

(declare-fun c!20505 () Bool)

(declare-fun call!12367 () ListLongMap!1617)

(assert (=> bm!12361 (= call!12365 (+!161 (ite c!20505 call!12370 (ite c!20507 call!12369 call!12367)) (ite (or c!20505 c!20507) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2550 (v!2990 (underlying!388 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2550 (v!2990 (underlying!388 thiss!992)))))))))

(declare-fun bm!12362 () Bool)

(assert (=> bm!12362 (= call!12370 (getCurrentListMapNoExtraKeys!127 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (_values!2666 (v!2990 (underlying!388 thiss!992))) (mask!6879 (v!2990 (underlying!388 thiss!992))) (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) (minValue!2550 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun b!114718 () Bool)

(declare-fun e!74654 () Bool)

(declare-fun e!74651 () Bool)

(assert (=> b!114718 (= e!74654 e!74651)))

(declare-fun res!56441 () Bool)

(declare-fun call!12368 () Bool)

(assert (=> b!114718 (= res!56441 call!12368)))

(assert (=> b!114718 (=> (not res!56441) (not e!74651))))

(declare-fun bm!12363 () Bool)

(assert (=> bm!12363 (= call!12369 call!12370)))

(declare-fun b!114719 () Bool)

(declare-fun e!74656 () ListLongMap!1617)

(assert (=> b!114719 (= e!74656 call!12367)))

(declare-fun b!114720 () Bool)

(declare-fun e!74655 () ListLongMap!1617)

(assert (=> b!114720 (= e!74659 e!74655)))

(assert (=> b!114720 (= c!20507 (and (not (= (bvand (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12364 () Bool)

(declare-fun call!12366 () Bool)

(assert (=> bm!12364 (= call!12366 (contains!854 lt!59830 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!114721 () Bool)

(declare-fun e!74647 () Bool)

(assert (=> b!114721 (= e!74647 (validKeyInArray!0 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!114722 () Bool)

(declare-fun call!12364 () ListLongMap!1617)

(assert (=> b!114722 (= e!74655 call!12364)))

(declare-fun b!114723 () Bool)

(assert (=> b!114723 (= e!74656 call!12364)))

(declare-fun b!114724 () Bool)

(declare-fun e!74649 () Bool)

(assert (=> b!114724 (= e!74649 e!74654)))

(declare-fun c!20503 () Bool)

(assert (=> b!114724 (= c!20503 (not (= (bvand (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!114725 () Bool)

(assert (=> b!114725 (= e!74654 (not call!12368))))

(declare-fun b!114726 () Bool)

(declare-fun e!74648 () Unit!3572)

(declare-fun Unit!3582 () Unit!3572)

(assert (=> b!114726 (= e!74648 Unit!3582)))

(declare-fun b!114727 () Bool)

(declare-fun res!56439 () Bool)

(assert (=> b!114727 (=> (not res!56439) (not e!74649))))

(declare-fun e!74657 () Bool)

(assert (=> b!114727 (= res!56439 e!74657)))

(declare-fun res!56438 () Bool)

(assert (=> b!114727 (=> res!56438 e!74657)))

(assert (=> b!114727 (= res!56438 (not e!74647))))

(declare-fun res!56442 () Bool)

(assert (=> b!114727 (=> (not res!56442) (not e!74647))))

(assert (=> b!114727 (= res!56442 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun d!32431 () Bool)

(assert (=> d!32431 e!74649))

(declare-fun res!56445 () Bool)

(assert (=> d!32431 (=> (not res!56445) (not e!74649))))

(assert (=> d!32431 (= res!56445 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992))))))))))

(declare-fun lt!59822 () ListLongMap!1617)

(assert (=> d!32431 (= lt!59830 lt!59822)))

(declare-fun lt!59815 () Unit!3572)

(assert (=> d!32431 (= lt!59815 e!74648)))

(declare-fun c!20506 () Bool)

(declare-fun e!74653 () Bool)

(assert (=> d!32431 (= c!20506 e!74653)))

(declare-fun res!56440 () Bool)

(assert (=> d!32431 (=> (not res!56440) (not e!74653))))

(assert (=> d!32431 (= res!56440 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992))))))))

(assert (=> d!32431 (= lt!59822 e!74659)))

(assert (=> d!32431 (= c!20505 (and (not (= (bvand (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32431 (validMask!0 (mask!6879 (v!2990 (underlying!388 thiss!992))))))

(assert (=> d!32431 (= (getCurrentListMap!507 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (_values!2666 (v!2990 (underlying!388 thiss!992))) (mask!6879 (v!2990 (underlying!388 thiss!992))) (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) (minValue!2550 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992)))) lt!59830)))

(declare-fun b!114728 () Bool)

(declare-fun e!74658 () Bool)

(assert (=> b!114728 (= e!74657 e!74658)))

(declare-fun res!56444 () Bool)

(assert (=> b!114728 (=> (not res!56444) (not e!74658))))

(assert (=> b!114728 (= res!56444 (contains!854 lt!59830 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!114728 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun b!114729 () Bool)

(declare-fun c!20504 () Bool)

(assert (=> b!114729 (= c!20504 (and (not (= (bvand (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!114729 (= e!74655 e!74656)))

(declare-fun bm!12365 () Bool)

(assert (=> bm!12365 (= call!12367 call!12369)))

(declare-fun bm!12366 () Bool)

(assert (=> bm!12366 (= call!12364 call!12365)))

(declare-fun b!114730 () Bool)

(declare-fun e!74650 () Bool)

(assert (=> b!114730 (= e!74650 (not call!12366))))

(declare-fun b!114731 () Bool)

(assert (=> b!114731 (= e!74658 (= (apply!103 lt!59830 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1377 (select (arr!2118 (_values!2666 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!399 (defaultEntry!2683 (v!2990 (underlying!388 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!114731 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2378 (_values!2666 (v!2990 (underlying!388 thiss!992))))))))

(assert (=> b!114731 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2377 (_keys!4405 (v!2990 (underlying!388 thiss!992))))))))

(declare-fun bm!12367 () Bool)

(assert (=> bm!12367 (= call!12368 (contains!854 lt!59830 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!114732 () Bool)

(assert (=> b!114732 (= e!74653 (validKeyInArray!0 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!114733 () Bool)

(assert (=> b!114733 (= e!74650 e!74652)))

(declare-fun res!56443 () Bool)

(assert (=> b!114733 (= res!56443 call!12366)))

(assert (=> b!114733 (=> (not res!56443) (not e!74652))))

(declare-fun b!114734 () Bool)

(declare-fun lt!59824 () Unit!3572)

(assert (=> b!114734 (= e!74648 lt!59824)))

(declare-fun lt!59828 () ListLongMap!1617)

(assert (=> b!114734 (= lt!59828 (getCurrentListMapNoExtraKeys!127 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (_values!2666 (v!2990 (underlying!388 thiss!992))) (mask!6879 (v!2990 (underlying!388 thiss!992))) (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) (minValue!2550 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun lt!59817 () (_ BitVec 64))

(assert (=> b!114734 (= lt!59817 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59816 () (_ BitVec 64))

(assert (=> b!114734 (= lt!59816 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!59827 () Unit!3572)

(declare-fun addStillContains!79 (ListLongMap!1617 (_ BitVec 64) V!3291 (_ BitVec 64)) Unit!3572)

(assert (=> b!114734 (= lt!59827 (addStillContains!79 lt!59828 lt!59817 (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) lt!59816))))

(assert (=> b!114734 (contains!854 (+!161 lt!59828 (tuple2!2485 lt!59817 (zeroValue!2550 (v!2990 (underlying!388 thiss!992))))) lt!59816)))

(declare-fun lt!59814 () Unit!3572)

(assert (=> b!114734 (= lt!59814 lt!59827)))

(declare-fun lt!59819 () ListLongMap!1617)

(assert (=> b!114734 (= lt!59819 (getCurrentListMapNoExtraKeys!127 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (_values!2666 (v!2990 (underlying!388 thiss!992))) (mask!6879 (v!2990 (underlying!388 thiss!992))) (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) (minValue!2550 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun lt!59823 () (_ BitVec 64))

(assert (=> b!114734 (= lt!59823 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59818 () (_ BitVec 64))

(assert (=> b!114734 (= lt!59818 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!59825 () Unit!3572)

(declare-fun addApplyDifferent!79 (ListLongMap!1617 (_ BitVec 64) V!3291 (_ BitVec 64)) Unit!3572)

(assert (=> b!114734 (= lt!59825 (addApplyDifferent!79 lt!59819 lt!59823 (minValue!2550 (v!2990 (underlying!388 thiss!992))) lt!59818))))

(assert (=> b!114734 (= (apply!103 (+!161 lt!59819 (tuple2!2485 lt!59823 (minValue!2550 (v!2990 (underlying!388 thiss!992))))) lt!59818) (apply!103 lt!59819 lt!59818))))

(declare-fun lt!59813 () Unit!3572)

(assert (=> b!114734 (= lt!59813 lt!59825)))

(declare-fun lt!59826 () ListLongMap!1617)

(assert (=> b!114734 (= lt!59826 (getCurrentListMapNoExtraKeys!127 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (_values!2666 (v!2990 (underlying!388 thiss!992))) (mask!6879 (v!2990 (underlying!388 thiss!992))) (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) (minValue!2550 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun lt!59812 () (_ BitVec 64))

(assert (=> b!114734 (= lt!59812 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59811 () (_ BitVec 64))

(assert (=> b!114734 (= lt!59811 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!59829 () Unit!3572)

(assert (=> b!114734 (= lt!59829 (addApplyDifferent!79 lt!59826 lt!59812 (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) lt!59811))))

(assert (=> b!114734 (= (apply!103 (+!161 lt!59826 (tuple2!2485 lt!59812 (zeroValue!2550 (v!2990 (underlying!388 thiss!992))))) lt!59811) (apply!103 lt!59826 lt!59811))))

(declare-fun lt!59831 () Unit!3572)

(assert (=> b!114734 (= lt!59831 lt!59829)))

(declare-fun lt!59832 () ListLongMap!1617)

(assert (=> b!114734 (= lt!59832 (getCurrentListMapNoExtraKeys!127 (_keys!4405 (v!2990 (underlying!388 thiss!992))) (_values!2666 (v!2990 (underlying!388 thiss!992))) (mask!6879 (v!2990 (underlying!388 thiss!992))) (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) (zeroValue!2550 (v!2990 (underlying!388 thiss!992))) (minValue!2550 (v!2990 (underlying!388 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun lt!59821 () (_ BitVec 64))

(assert (=> b!114734 (= lt!59821 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59820 () (_ BitVec 64))

(assert (=> b!114734 (= lt!59820 (select (arr!2117 (_keys!4405 (v!2990 (underlying!388 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!114734 (= lt!59824 (addApplyDifferent!79 lt!59832 lt!59821 (minValue!2550 (v!2990 (underlying!388 thiss!992))) lt!59820))))

(assert (=> b!114734 (= (apply!103 (+!161 lt!59832 (tuple2!2485 lt!59821 (minValue!2550 (v!2990 (underlying!388 thiss!992))))) lt!59820) (apply!103 lt!59832 lt!59820))))

(declare-fun b!114735 () Bool)

(assert (=> b!114735 (= e!74651 (= (apply!103 lt!59830 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2550 (v!2990 (underlying!388 thiss!992)))))))

(declare-fun b!114736 () Bool)

(declare-fun res!56446 () Bool)

(assert (=> b!114736 (=> (not res!56446) (not e!74649))))

(assert (=> b!114736 (= res!56446 e!74650)))

(declare-fun c!20502 () Bool)

(assert (=> b!114736 (= c!20502 (not (= (bvand (extraKeys!2472 (v!2990 (underlying!388 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!32431 c!20505) b!114716))

(assert (= (and d!32431 (not c!20505)) b!114720))

(assert (= (and b!114720 c!20507) b!114722))

(assert (= (and b!114720 (not c!20507)) b!114729))

(assert (= (and b!114729 c!20504) b!114723))

(assert (= (and b!114729 (not c!20504)) b!114719))

(assert (= (or b!114723 b!114719) bm!12365))

(assert (= (or b!114722 bm!12365) bm!12363))

(assert (= (or b!114722 b!114723) bm!12366))

(assert (= (or b!114716 bm!12363) bm!12362))

(assert (= (or b!114716 bm!12366) bm!12361))

(assert (= (and d!32431 res!56440) b!114732))

(assert (= (and d!32431 c!20506) b!114734))

(assert (= (and d!32431 (not c!20506)) b!114726))

(assert (= (and d!32431 res!56445) b!114727))

(assert (= (and b!114727 res!56442) b!114721))

(assert (= (and b!114727 (not res!56438)) b!114728))

(assert (= (and b!114728 res!56444) b!114731))

(assert (= (and b!114727 res!56439) b!114736))

(assert (= (and b!114736 c!20502) b!114733))

(assert (= (and b!114736 (not c!20502)) b!114730))

(assert (= (and b!114733 res!56443) b!114717))

(assert (= (or b!114733 b!114730) bm!12364))

(assert (= (and b!114736 res!56446) b!114724))

(assert (= (and b!114724 c!20503) b!114718))

(assert (= (and b!114724 (not c!20503)) b!114725))

(assert (= (and b!114718 res!56441) b!114735))

(assert (= (or b!114718 b!114725) bm!12367))

(declare-fun b_lambda!5123 () Bool)

(assert (=> (not b_lambda!5123) (not b!114731)))

(assert (=> b!114731 t!5876))

(declare-fun b_and!7083 () Bool)

(assert (= b_and!7079 (and (=> t!5876 result!3653) b_and!7083)))

(assert (=> b!114731 t!5878))

(declare-fun b_and!7085 () Bool)

(assert (= b_and!7081 (and (=> t!5878 result!3657) b_and!7085)))

(assert (=> bm!12362 m!130761))

(assert (=> b!114721 m!130949))

(assert (=> b!114721 m!130949))

(assert (=> b!114721 m!131023))

(declare-fun m!131105 () Bool)

(assert (=> bm!12367 m!131105))

(declare-fun m!131107 () Bool)

(assert (=> bm!12364 m!131107))

(assert (=> d!32431 m!130955))

(assert (=> b!114732 m!130949))

(assert (=> b!114732 m!130949))

(assert (=> b!114732 m!131023))

(assert (=> b!114731 m!130949))

(declare-fun m!131109 () Bool)

(assert (=> b!114731 m!131109))

(assert (=> b!114731 m!130949))

(assert (=> b!114731 m!131037))

(assert (=> b!114731 m!130791))

(assert (=> b!114731 m!131037))

(assert (=> b!114731 m!130791))

(assert (=> b!114731 m!131043))

(declare-fun m!131111 () Bool)

(assert (=> bm!12361 m!131111))

(declare-fun m!131113 () Bool)

(assert (=> b!114735 m!131113))

(declare-fun m!131115 () Bool)

(assert (=> b!114716 m!131115))

(declare-fun m!131117 () Bool)

(assert (=> b!114734 m!131117))

(assert (=> b!114734 m!130761))

(declare-fun m!131119 () Bool)

(assert (=> b!114734 m!131119))

(assert (=> b!114734 m!130949))

(assert (=> b!114734 m!131117))

(declare-fun m!131121 () Bool)

(assert (=> b!114734 m!131121))

(declare-fun m!131123 () Bool)

(assert (=> b!114734 m!131123))

(assert (=> b!114734 m!131119))

(declare-fun m!131125 () Bool)

(assert (=> b!114734 m!131125))

(declare-fun m!131127 () Bool)

(assert (=> b!114734 m!131127))

(declare-fun m!131129 () Bool)

(assert (=> b!114734 m!131129))

(assert (=> b!114734 m!131127))

(declare-fun m!131131 () Bool)

(assert (=> b!114734 m!131131))

(declare-fun m!131133 () Bool)

(assert (=> b!114734 m!131133))

(declare-fun m!131135 () Bool)

(assert (=> b!114734 m!131135))

(declare-fun m!131137 () Bool)

(assert (=> b!114734 m!131137))

(declare-fun m!131139 () Bool)

(assert (=> b!114734 m!131139))

(declare-fun m!131141 () Bool)

(assert (=> b!114734 m!131141))

(declare-fun m!131143 () Bool)

(assert (=> b!114734 m!131143))

(assert (=> b!114734 m!131137))

(declare-fun m!131145 () Bool)

(assert (=> b!114734 m!131145))

(assert (=> b!114728 m!130949))

(assert (=> b!114728 m!130949))

(declare-fun m!131147 () Bool)

(assert (=> b!114728 m!131147))

(declare-fun m!131149 () Bool)

(assert (=> b!114717 m!131149))

(assert (=> b!114365 d!32431))

(declare-fun condMapEmpty!4137 () Bool)

(declare-fun mapDefault!4137 () ValueCell!1023)

(assert (=> mapNonEmpty!4127 (= condMapEmpty!4137 (= mapRest!4127 ((as const (Array (_ BitVec 32) ValueCell!1023)) mapDefault!4137)))))

(declare-fun e!74664 () Bool)

(declare-fun mapRes!4137 () Bool)

(assert (=> mapNonEmpty!4127 (= tp!10260 (and e!74664 mapRes!4137))))

(declare-fun b!114744 () Bool)

(assert (=> b!114744 (= e!74664 tp_is_empty!2733)))

(declare-fun mapIsEmpty!4137 () Bool)

(assert (=> mapIsEmpty!4137 mapRes!4137))

(declare-fun mapNonEmpty!4137 () Bool)

(declare-fun tp!10275 () Bool)

(declare-fun e!74665 () Bool)

(assert (=> mapNonEmpty!4137 (= mapRes!4137 (and tp!10275 e!74665))))

(declare-fun mapKey!4137 () (_ BitVec 32))

(declare-fun mapValue!4137 () ValueCell!1023)

(declare-fun mapRest!4137 () (Array (_ BitVec 32) ValueCell!1023))

(assert (=> mapNonEmpty!4137 (= mapRest!4127 (store mapRest!4137 mapKey!4137 mapValue!4137))))

(declare-fun b!114743 () Bool)

(assert (=> b!114743 (= e!74665 tp_is_empty!2733)))

(assert (= (and mapNonEmpty!4127 condMapEmpty!4137) mapIsEmpty!4137))

(assert (= (and mapNonEmpty!4127 (not condMapEmpty!4137)) mapNonEmpty!4137))

(assert (= (and mapNonEmpty!4137 ((_ is ValueCellFull!1023) mapValue!4137)) b!114743))

(assert (= (and mapNonEmpty!4127 ((_ is ValueCellFull!1023) mapDefault!4137)) b!114744))

(declare-fun m!131151 () Bool)

(assert (=> mapNonEmpty!4137 m!131151))

(declare-fun condMapEmpty!4138 () Bool)

(declare-fun mapDefault!4138 () ValueCell!1023)

(assert (=> mapNonEmpty!4128 (= condMapEmpty!4138 (= mapRest!4128 ((as const (Array (_ BitVec 32) ValueCell!1023)) mapDefault!4138)))))

(declare-fun e!74666 () Bool)

(declare-fun mapRes!4138 () Bool)

(assert (=> mapNonEmpty!4128 (= tp!10258 (and e!74666 mapRes!4138))))

(declare-fun b!114746 () Bool)

(assert (=> b!114746 (= e!74666 tp_is_empty!2733)))

(declare-fun mapIsEmpty!4138 () Bool)

(assert (=> mapIsEmpty!4138 mapRes!4138))

(declare-fun mapNonEmpty!4138 () Bool)

(declare-fun tp!10276 () Bool)

(declare-fun e!74667 () Bool)

(assert (=> mapNonEmpty!4138 (= mapRes!4138 (and tp!10276 e!74667))))

(declare-fun mapValue!4138 () ValueCell!1023)

(declare-fun mapKey!4138 () (_ BitVec 32))

(declare-fun mapRest!4138 () (Array (_ BitVec 32) ValueCell!1023))

(assert (=> mapNonEmpty!4138 (= mapRest!4128 (store mapRest!4138 mapKey!4138 mapValue!4138))))

(declare-fun b!114745 () Bool)

(assert (=> b!114745 (= e!74667 tp_is_empty!2733)))

(assert (= (and mapNonEmpty!4128 condMapEmpty!4138) mapIsEmpty!4138))

(assert (= (and mapNonEmpty!4128 (not condMapEmpty!4138)) mapNonEmpty!4138))

(assert (= (and mapNonEmpty!4138 ((_ is ValueCellFull!1023) mapValue!4138)) b!114745))

(assert (= (and mapNonEmpty!4128 ((_ is ValueCellFull!1023) mapDefault!4138)) b!114746))

(declare-fun m!131153 () Bool)

(assert (=> mapNonEmpty!4138 m!131153))

(declare-fun b_lambda!5125 () Bool)

(assert (= b_lambda!5121 (or (and b!114379 b_free!2633) (and b!114367 b_free!2635 (= (defaultEntry!2683 newMap!16) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992))))) b_lambda!5125)))

(declare-fun b_lambda!5127 () Bool)

(assert (= b_lambda!5123 (or (and b!114379 b_free!2633) (and b!114367 b_free!2635 (= (defaultEntry!2683 newMap!16) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992))))) b_lambda!5127)))

(declare-fun b_lambda!5129 () Bool)

(assert (= b_lambda!5119 (or (and b!114379 b_free!2633) (and b!114367 b_free!2635 (= (defaultEntry!2683 newMap!16) (defaultEntry!2683 (v!2990 (underlying!388 thiss!992))))) b_lambda!5129)))

(check-sat (not b!114659) (not mapNonEmpty!4137) (not b!114457) (not b!114629) (not d!32413) (not b!114660) (not b!114672) (not b!114609) (not b!114608) (not d!32417) (not b!114624) (not b!114555) (not b!114667) (not b!114668) (not bm!12331) (not b!114622) (not b!114553) (not b!114615) (not b!114734) (not b!114669) (not d!32377) (not d!32395) (not bm!12339) (not d!32401) (not b!114623) (not bm!12367) (not b!114621) (not d!32429) (not b!114570) (not b_lambda!5127) (not bm!12330) (not d!32391) (not b!114735) (not b_next!2633) (not d!32427) (not d!32423) (not b!114716) (not b!114631) (not bm!12329) (not d!32431) (not b!114466) (not bm!12337) (not b!114464) (not bm!12343) (not b!114657) (not bm!12346) (not d!32385) (not d!32383) (not bm!12320) (not b!114626) (not b!114728) (not b!114721) (not b!114627) (not mapNonEmpty!4138) (not bm!12327) (not b!114731) (not bm!12340) (not b!114673) (not b!114552) (not d!32415) (not b!114582) (not b!114717) (not bm!12362) (not d!32419) b_and!7085 (not b!114661) (not bm!12334) (not b_next!2635) (not d!32425) b_and!7083 (not b!114616) (not b!114662) (not bm!12319) (not b!114581) (not d!32407) (not b!114594) (not bm!12335) (not bm!12364) (not bm!12321) (not b!114456) (not b!114732) (not b!114625) (not b_lambda!5129) (not b!114606) (not b!114455) (not d!32409) (not b!114630) (not d!32397) tp_is_empty!2733 (not b!114671) (not d!32421) (not b!114583) (not b!114589) (not b_lambda!5125) (not b!114628) (not b!114665) (not b!114670) (not b_lambda!5117) (not b!114543) (not d!32393) (not bm!12361) (not d!32411) (not b!114656) (not b!114561))
(check-sat b_and!7083 b_and!7085 (not b_next!2633) (not b_next!2635))
