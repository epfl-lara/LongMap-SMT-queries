; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11154 () Bool)

(assert start!11154)

(declare-fun b!91491 () Bool)

(declare-fun b_free!2333 () Bool)

(declare-fun b_next!2333 () Bool)

(assert (=> b!91491 (= b_free!2333 (not b_next!2333))))

(declare-fun tp!9254 () Bool)

(declare-fun b_and!5547 () Bool)

(assert (=> b!91491 (= tp!9254 b_and!5547)))

(declare-fun b!91496 () Bool)

(declare-fun b_free!2335 () Bool)

(declare-fun b_next!2335 () Bool)

(assert (=> b!91496 (= b_free!2335 (not b_next!2335))))

(declare-fun tp!9252 () Bool)

(declare-fun b_and!5549 () Bool)

(assert (=> b!91496 (= tp!9252 b_and!5549)))

(declare-fun b!91482 () Bool)

(declare-datatypes ((Unit!2720 0))(
  ( (Unit!2721) )
))
(declare-fun e!59684 () Unit!2720)

(declare-fun Unit!2722 () Unit!2720)

(assert (=> b!91482 (= e!59684 Unit!2722)))

(declare-fun lt!44637 () Unit!2720)

(declare-datatypes ((V!3091 0))(
  ( (V!3092 (val!1336 Int)) )
))
(declare-datatypes ((array!4135 0))(
  ( (array!4136 (arr!1967 (Array (_ BitVec 32) (_ BitVec 64))) (size!2214 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!948 0))(
  ( (ValueCellFull!948 (v!2720 V!3091)) (EmptyCell!948) )
))
(declare-datatypes ((array!4137 0))(
  ( (array!4138 (arr!1968 (Array (_ BitVec 32) ValueCell!948)) (size!2215 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!804 0))(
  ( (LongMapFixedSize!805 (defaultEntry!2406 Int) (mask!6466 (_ BitVec 32)) (extraKeys!2237 (_ BitVec 32)) (zeroValue!2294 V!3091) (minValue!2294 V!3091) (_size!451 (_ BitVec 32)) (_keys!4086 array!4135) (_values!2389 array!4137) (_vacant!451 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!604 0))(
  ( (Cell!605 (v!2721 LongMapFixedSize!804)) )
))
(declare-datatypes ((LongMap!604 0))(
  ( (LongMap!605 (underlying!313 Cell!604)) )
))
(declare-fun thiss!992 () LongMap!604)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!78 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 (_ BitVec 64) (_ BitVec 32) Int) Unit!2720)

(assert (=> b!91482 (= lt!44637 (lemmaListMapContainsThenArrayContainsFrom!78 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!91482 (arrayContainsKey!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!44640 () Unit!2720)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4135 (_ BitVec 32) (_ BitVec 32)) Unit!2720)

(assert (=> b!91482 (= lt!44640 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1551 0))(
  ( (Nil!1548) (Cons!1547 (h!2139 (_ BitVec 64)) (t!5385 List!1551)) )
))
(declare-fun arrayNoDuplicates!0 (array!4135 (_ BitVec 32) List!1551) Bool)

(assert (=> b!91482 (arrayNoDuplicates!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) from!355 Nil!1548)))

(declare-fun lt!44639 () Unit!2720)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4135 (_ BitVec 32) (_ BitVec 64) List!1551) Unit!2720)

(assert (=> b!91482 (= lt!44639 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (Cons!1547 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) Nil!1548)))))

(assert (=> b!91482 false))

(declare-fun mapNonEmpty!3571 () Bool)

(declare-fun mapRes!3572 () Bool)

(declare-fun tp!9251 () Bool)

(declare-fun e!59683 () Bool)

(assert (=> mapNonEmpty!3571 (= mapRes!3572 (and tp!9251 e!59683))))

(declare-fun mapValue!3572 () ValueCell!948)

(declare-fun mapRest!3572 () (Array (_ BitVec 32) ValueCell!948))

(declare-fun mapKey!3571 () (_ BitVec 32))

(assert (=> mapNonEmpty!3571 (= (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (store mapRest!3572 mapKey!3571 mapValue!3572))))

(declare-fun b!91483 () Bool)

(declare-fun e!59686 () Bool)

(declare-fun e!59685 () Bool)

(assert (=> b!91483 (= e!59686 e!59685)))

(declare-fun res!46582 () Bool)

(assert (=> b!91483 (=> (not res!46582) (not e!59685))))

(declare-datatypes ((tuple2!2266 0))(
  ( (tuple2!2267 (_1!1144 (_ BitVec 64)) (_2!1144 V!3091)) )
))
(declare-datatypes ((List!1552 0))(
  ( (Nil!1549) (Cons!1548 (h!2140 tuple2!2266) (t!5386 List!1552)) )
))
(declare-datatypes ((ListLongMap!1499 0))(
  ( (ListLongMap!1500 (toList!765 List!1552)) )
))
(declare-fun lt!44650 () ListLongMap!1499)

(declare-fun lt!44653 () ListLongMap!1499)

(assert (=> b!91483 (= res!46582 (= lt!44650 lt!44653))))

(declare-fun newMap!16 () LongMapFixedSize!804)

(declare-fun map!1222 (LongMapFixedSize!804) ListLongMap!1499)

(assert (=> b!91483 (= lt!44653 (map!1222 newMap!16))))

(declare-fun getCurrentListMap!457 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 (_ BitVec 32) Int) ListLongMap!1499)

(assert (=> b!91483 (= lt!44650 (getCurrentListMap!457 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun b!91484 () Bool)

(declare-fun e!59677 () Bool)

(declare-fun e!59682 () Bool)

(assert (=> b!91484 (= e!59677 e!59682)))

(declare-fun b!91485 () Bool)

(declare-fun e!59687 () Bool)

(declare-fun tp_is_empty!2583 () Bool)

(assert (=> b!91485 (= e!59687 tp_is_empty!2583)))

(declare-fun b!91486 () Bool)

(declare-fun res!46581 () Bool)

(declare-fun e!59688 () Bool)

(assert (=> b!91486 (=> res!46581 e!59688)))

(assert (=> b!91486 (= res!46581 (bvsge (bvsub from!355 #b00000000000000000000000000000001) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!91487 () Bool)

(declare-fun res!46585 () Bool)

(assert (=> b!91487 (=> (not res!46585) (not e!59686))))

(declare-fun valid!353 (LongMapFixedSize!804) Bool)

(assert (=> b!91487 (= res!46585 (valid!353 newMap!16))))

(declare-fun b!91488 () Bool)

(declare-fun e!59676 () Bool)

(declare-fun e!59689 () Bool)

(assert (=> b!91488 (= e!59676 e!59689)))

(declare-fun res!46584 () Bool)

(assert (=> b!91488 (=> (not res!46584) (not e!59689))))

(declare-datatypes ((tuple2!2268 0))(
  ( (tuple2!2269 (_1!1145 Bool) (_2!1145 LongMapFixedSize!804)) )
))
(declare-fun lt!44647 () tuple2!2268)

(assert (=> b!91488 (= res!46584 (and (_1!1145 lt!44647) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!44645 () Unit!2720)

(assert (=> b!91488 (= lt!44645 e!59684)))

(declare-fun c!15182 () Bool)

(declare-fun contains!777 (ListLongMap!1499 (_ BitVec 64)) Bool)

(assert (=> b!91488 (= c!15182 (contains!777 lt!44653 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun lt!44644 () V!3091)

(declare-fun update!126 (LongMapFixedSize!804 (_ BitVec 64) V!3091) tuple2!2268)

(assert (=> b!91488 (= lt!44647 (update!126 newMap!16 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))

(declare-fun b!91489 () Bool)

(declare-fun Unit!2723 () Unit!2720)

(assert (=> b!91489 (= e!59684 Unit!2723)))

(declare-fun b!91490 () Bool)

(assert (=> b!91490 (= e!59688 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6466 (_2!1145 lt!44647))) (_size!451 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun e!59679 () Bool)

(declare-fun array_inv!1219 (array!4135) Bool)

(declare-fun array_inv!1220 (array!4137) Bool)

(assert (=> b!91491 (= e!59682 (and tp!9254 tp_is_empty!2583 (array_inv!1219 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (array_inv!1220 (_values!2389 (v!2721 (underlying!313 thiss!992)))) e!59679))))

(declare-fun mapIsEmpty!3571 () Bool)

(declare-fun mapRes!3571 () Bool)

(assert (=> mapIsEmpty!3571 mapRes!3571))

(declare-fun b!91492 () Bool)

(assert (=> b!91492 (= e!59689 (not e!59688))))

(declare-fun res!46589 () Bool)

(assert (=> b!91492 (=> res!46589 e!59688)))

(assert (=> b!91492 (= res!46589 (not (= (getCurrentListMap!457 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) from!355 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))) (map!1222 (_2!1145 lt!44647)))))))

(declare-fun lt!44646 () ListLongMap!1499)

(declare-fun lt!44638 () tuple2!2266)

(declare-fun lt!44651 () tuple2!2266)

(declare-fun lt!44652 () ListLongMap!1499)

(declare-fun +!127 (ListLongMap!1499 tuple2!2266) ListLongMap!1499)

(assert (=> b!91492 (= (+!127 lt!44646 lt!44638) (+!127 (+!127 lt!44652 lt!44638) lt!44651))))

(assert (=> b!91492 (= lt!44638 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun lt!44643 () Unit!2720)

(declare-fun addCommutativeForDiffKeys!46 (ListLongMap!1499 (_ BitVec 64) V!3091 (_ BitVec 64) V!3091) Unit!2720)

(assert (=> b!91492 (= lt!44643 (addCommutativeForDiffKeys!46 lt!44652 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun lt!44648 () ListLongMap!1499)

(assert (=> b!91492 (= lt!44648 lt!44646)))

(assert (=> b!91492 (= lt!44646 (+!127 lt!44652 lt!44651))))

(declare-fun lt!44654 () ListLongMap!1499)

(declare-fun lt!44649 () tuple2!2266)

(assert (=> b!91492 (= lt!44648 (+!127 lt!44654 lt!44649))))

(declare-fun lt!44642 () ListLongMap!1499)

(assert (=> b!91492 (= lt!44652 (+!127 lt!44642 lt!44649))))

(assert (=> b!91492 (= lt!44649 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))

(assert (=> b!91492 (= lt!44654 (+!127 lt!44642 lt!44651))))

(assert (=> b!91492 (= lt!44651 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))

(declare-fun lt!44641 () Unit!2720)

(assert (=> b!91492 (= lt!44641 (addCommutativeForDiffKeys!46 lt!44642 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!92 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 (_ BitVec 32) Int) ListLongMap!1499)

(assert (=> b!91492 (= lt!44642 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun b!91493 () Bool)

(declare-fun e!59681 () Bool)

(assert (=> b!91493 (= e!59681 tp_is_empty!2583)))

(declare-fun b!91494 () Bool)

(declare-fun e!59674 () Bool)

(assert (=> b!91494 (= e!59674 e!59677)))

(declare-fun b!91495 () Bool)

(declare-fun e!59691 () Bool)

(assert (=> b!91495 (= e!59691 tp_is_empty!2583)))

(declare-fun e!59680 () Bool)

(declare-fun e!59675 () Bool)

(assert (=> b!91496 (= e!59680 (and tp!9252 tp_is_empty!2583 (array_inv!1219 (_keys!4086 newMap!16)) (array_inv!1220 (_values!2389 newMap!16)) e!59675))))

(declare-fun res!46586 () Bool)

(assert (=> start!11154 (=> (not res!46586) (not e!59686))))

(declare-fun valid!354 (LongMap!604) Bool)

(assert (=> start!11154 (= res!46586 (valid!354 thiss!992))))

(assert (=> start!11154 e!59686))

(assert (=> start!11154 e!59674))

(assert (=> start!11154 true))

(assert (=> start!11154 e!59680))

(declare-fun b!91497 () Bool)

(assert (=> b!91497 (= e!59685 e!59676)))

(declare-fun res!46587 () Bool)

(assert (=> b!91497 (=> (not res!46587) (not e!59676))))

(assert (=> b!91497 (= res!46587 (and (not (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1237 (ValueCell!948 V!3091) V!3091)

(declare-fun dynLambda!354 (Int (_ BitVec 64)) V!3091)

(assert (=> b!91497 (= lt!44644 (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) from!355) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91498 () Bool)

(declare-fun res!46583 () Bool)

(assert (=> b!91498 (=> (not res!46583) (not e!59686))))

(assert (=> b!91498 (= res!46583 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun b!91499 () Bool)

(assert (=> b!91499 (= e!59675 (and e!59691 mapRes!3571))))

(declare-fun condMapEmpty!3572 () Bool)

(declare-fun mapDefault!3571 () ValueCell!948)

(assert (=> b!91499 (= condMapEmpty!3572 (= (arr!1968 (_values!2389 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!948)) mapDefault!3571)))))

(declare-fun b!91500 () Bool)

(assert (=> b!91500 (= e!59683 tp_is_empty!2583)))

(declare-fun b!91501 () Bool)

(declare-fun res!46588 () Bool)

(assert (=> b!91501 (=> res!46588 e!59688)))

(assert (=> b!91501 (= res!46588 (not (valid!353 (_2!1145 lt!44647))))))

(declare-fun b!91502 () Bool)

(assert (=> b!91502 (= e!59679 (and e!59687 mapRes!3572))))

(declare-fun condMapEmpty!3571 () Bool)

(declare-fun mapDefault!3572 () ValueCell!948)

(assert (=> b!91502 (= condMapEmpty!3571 (= (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!948)) mapDefault!3572)))))

(declare-fun mapIsEmpty!3572 () Bool)

(assert (=> mapIsEmpty!3572 mapRes!3572))

(declare-fun mapNonEmpty!3572 () Bool)

(declare-fun tp!9253 () Bool)

(assert (=> mapNonEmpty!3572 (= mapRes!3571 (and tp!9253 e!59681))))

(declare-fun mapValue!3571 () ValueCell!948)

(declare-fun mapKey!3572 () (_ BitVec 32))

(declare-fun mapRest!3571 () (Array (_ BitVec 32) ValueCell!948))

(assert (=> mapNonEmpty!3572 (= (arr!1968 (_values!2389 newMap!16)) (store mapRest!3571 mapKey!3572 mapValue!3571))))

(declare-fun b!91503 () Bool)

(declare-fun res!46590 () Bool)

(assert (=> b!91503 (=> (not res!46590) (not e!59686))))

(assert (=> b!91503 (= res!46590 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6466 newMap!16)) (_size!451 (v!2721 (underlying!313 thiss!992)))))))

(assert (= (and start!11154 res!46586) b!91498))

(assert (= (and b!91498 res!46583) b!91487))

(assert (= (and b!91487 res!46585) b!91503))

(assert (= (and b!91503 res!46590) b!91483))

(assert (= (and b!91483 res!46582) b!91497))

(assert (= (and b!91497 res!46587) b!91488))

(assert (= (and b!91488 c!15182) b!91482))

(assert (= (and b!91488 (not c!15182)) b!91489))

(assert (= (and b!91488 res!46584) b!91492))

(assert (= (and b!91492 (not res!46589)) b!91486))

(assert (= (and b!91486 (not res!46581)) b!91501))

(assert (= (and b!91501 (not res!46588)) b!91490))

(assert (= (and b!91502 condMapEmpty!3571) mapIsEmpty!3572))

(assert (= (and b!91502 (not condMapEmpty!3571)) mapNonEmpty!3571))

(get-info :version)

(assert (= (and mapNonEmpty!3571 ((_ is ValueCellFull!948) mapValue!3572)) b!91500))

(assert (= (and b!91502 ((_ is ValueCellFull!948) mapDefault!3572)) b!91485))

(assert (= b!91491 b!91502))

(assert (= b!91484 b!91491))

(assert (= b!91494 b!91484))

(assert (= start!11154 b!91494))

(assert (= (and b!91499 condMapEmpty!3572) mapIsEmpty!3571))

(assert (= (and b!91499 (not condMapEmpty!3572)) mapNonEmpty!3572))

(assert (= (and mapNonEmpty!3572 ((_ is ValueCellFull!948) mapValue!3571)) b!91493))

(assert (= (and b!91499 ((_ is ValueCellFull!948) mapDefault!3571)) b!91495))

(assert (= b!91496 b!91499))

(assert (= start!11154 b!91496))

(declare-fun b_lambda!4037 () Bool)

(assert (=> (not b_lambda!4037) (not b!91497)))

(declare-fun t!5382 () Bool)

(declare-fun tb!1801 () Bool)

(assert (=> (and b!91491 (= (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))) t!5382) tb!1801))

(declare-fun result!3083 () Bool)

(assert (=> tb!1801 (= result!3083 tp_is_empty!2583)))

(assert (=> b!91497 t!5382))

(declare-fun b_and!5551 () Bool)

(assert (= b_and!5547 (and (=> t!5382 result!3083) b_and!5551)))

(declare-fun tb!1803 () Bool)

(declare-fun t!5384 () Bool)

(assert (=> (and b!91496 (= (defaultEntry!2406 newMap!16) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))) t!5384) tb!1803))

(declare-fun result!3087 () Bool)

(assert (= result!3087 result!3083))

(assert (=> b!91497 t!5384))

(declare-fun b_and!5553 () Bool)

(assert (= b_and!5549 (and (=> t!5384 result!3087) b_and!5553)))

(declare-fun m!98305 () Bool)

(assert (=> b!91488 m!98305))

(assert (=> b!91488 m!98305))

(declare-fun m!98307 () Bool)

(assert (=> b!91488 m!98307))

(assert (=> b!91488 m!98305))

(declare-fun m!98309 () Bool)

(assert (=> b!91488 m!98309))

(declare-fun m!98311 () Bool)

(assert (=> b!91483 m!98311))

(declare-fun m!98313 () Bool)

(assert (=> b!91483 m!98313))

(declare-fun m!98315 () Bool)

(assert (=> b!91491 m!98315))

(declare-fun m!98317 () Bool)

(assert (=> b!91491 m!98317))

(declare-fun m!98319 () Bool)

(assert (=> mapNonEmpty!3572 m!98319))

(declare-fun m!98321 () Bool)

(assert (=> b!91501 m!98321))

(declare-fun m!98323 () Bool)

(assert (=> mapNonEmpty!3571 m!98323))

(declare-fun m!98325 () Bool)

(assert (=> b!91482 m!98325))

(declare-fun m!98327 () Bool)

(assert (=> b!91482 m!98327))

(assert (=> b!91482 m!98305))

(declare-fun m!98329 () Bool)

(assert (=> b!91482 m!98329))

(assert (=> b!91482 m!98305))

(assert (=> b!91482 m!98305))

(declare-fun m!98331 () Bool)

(assert (=> b!91482 m!98331))

(assert (=> b!91482 m!98305))

(declare-fun m!98333 () Bool)

(assert (=> b!91482 m!98333))

(declare-fun m!98335 () Bool)

(assert (=> b!91496 m!98335))

(declare-fun m!98337 () Bool)

(assert (=> b!91496 m!98337))

(declare-fun m!98339 () Bool)

(assert (=> b!91492 m!98339))

(declare-fun m!98341 () Bool)

(assert (=> b!91492 m!98341))

(assert (=> b!91492 m!98305))

(declare-fun m!98343 () Bool)

(assert (=> b!91492 m!98343))

(declare-fun m!98345 () Bool)

(assert (=> b!91492 m!98345))

(declare-fun m!98347 () Bool)

(assert (=> b!91492 m!98347))

(assert (=> b!91492 m!98305))

(declare-fun m!98349 () Bool)

(assert (=> b!91492 m!98349))

(declare-fun m!98351 () Bool)

(assert (=> b!91492 m!98351))

(declare-fun m!98353 () Bool)

(assert (=> b!91492 m!98353))

(assert (=> b!91492 m!98305))

(declare-fun m!98355 () Bool)

(assert (=> b!91492 m!98355))

(declare-fun m!98357 () Bool)

(assert (=> b!91492 m!98357))

(assert (=> b!91492 m!98345))

(declare-fun m!98359 () Bool)

(assert (=> b!91492 m!98359))

(declare-fun m!98361 () Bool)

(assert (=> b!91492 m!98361))

(declare-fun m!98363 () Bool)

(assert (=> start!11154 m!98363))

(declare-fun m!98365 () Bool)

(assert (=> b!91487 m!98365))

(assert (=> b!91497 m!98305))

(declare-fun m!98367 () Bool)

(assert (=> b!91497 m!98367))

(declare-fun m!98369 () Bool)

(assert (=> b!91497 m!98369))

(assert (=> b!91497 m!98367))

(assert (=> b!91497 m!98369))

(declare-fun m!98371 () Bool)

(assert (=> b!91497 m!98371))

(check-sat (not b!91487) (not b!91496) (not b!91483) (not b!91492) (not b!91482) (not b!91497) (not mapNonEmpty!3571) (not b_lambda!4037) (not b!91501) (not b!91488) (not b_next!2333) b_and!5553 tp_is_empty!2583 (not start!11154) (not b_next!2335) b_and!5551 (not b!91491) (not mapNonEmpty!3572))
(check-sat b_and!5551 b_and!5553 (not b_next!2333) (not b_next!2335))
(get-model)

(declare-fun b_lambda!4041 () Bool)

(assert (= b_lambda!4037 (or (and b!91491 b_free!2333) (and b!91496 b_free!2335 (= (defaultEntry!2406 newMap!16) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))))) b_lambda!4041)))

(check-sat (not b!91487) (not b!91496) (not b!91483) (not b!91492) (not b!91482) (not b!91497) (not mapNonEmpty!3571) (not b!91501) (not b!91488) (not b_next!2333) b_and!5553 tp_is_empty!2583 (not start!11154) (not b_next!2335) b_and!5551 (not mapNonEmpty!3572) (not b!91491) (not b_lambda!4041))
(check-sat b_and!5551 b_and!5553 (not b_next!2333) (not b_next!2335))
(get-model)

(declare-fun d!24113 () Bool)

(assert (=> d!24113 (= (array_inv!1219 (_keys!4086 newMap!16)) (bvsge (size!2214 (_keys!4086 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!91496 d!24113))

(declare-fun d!24115 () Bool)

(assert (=> d!24115 (= (array_inv!1220 (_values!2389 newMap!16)) (bvsge (size!2215 (_values!2389 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!91496 d!24115))

(declare-fun d!24117 () Bool)

(assert (=> d!24117 (not (arrayContainsKey!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44711 () Unit!2720)

(declare-fun choose!68 (array!4135 (_ BitVec 32) (_ BitVec 64) List!1551) Unit!2720)

(assert (=> d!24117 (= lt!44711 (choose!68 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (Cons!1547 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) Nil!1548)))))

(assert (=> d!24117 (bvslt (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24117 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (Cons!1547 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) Nil!1548)) lt!44711)))

(declare-fun bs!3805 () Bool)

(assert (= bs!3805 d!24117))

(assert (=> bs!3805 m!98305))

(assert (=> bs!3805 m!98331))

(assert (=> bs!3805 m!98305))

(declare-fun m!98441 () Bool)

(assert (=> bs!3805 m!98441))

(assert (=> b!91482 d!24117))

(declare-fun d!24119 () Bool)

(assert (=> d!24119 (arrayNoDuplicates!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) from!355 Nil!1548)))

(declare-fun lt!44714 () Unit!2720)

(declare-fun choose!39 (array!4135 (_ BitVec 32) (_ BitVec 32)) Unit!2720)

(assert (=> d!24119 (= lt!44714 (choose!39 (_keys!4086 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!24119 (bvslt (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24119 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000000 from!355) lt!44714)))

(declare-fun bs!3806 () Bool)

(assert (= bs!3806 d!24119))

(assert (=> bs!3806 m!98327))

(declare-fun m!98443 () Bool)

(assert (=> bs!3806 m!98443))

(assert (=> b!91482 d!24119))

(declare-fun d!24121 () Bool)

(declare-fun res!46625 () Bool)

(declare-fun e!59750 () Bool)

(assert (=> d!24121 (=> res!46625 e!59750)))

(assert (=> d!24121 (= res!46625 (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> d!24121 (= (arrayContainsKey!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!59750)))

(declare-fun b!91578 () Bool)

(declare-fun e!59751 () Bool)

(assert (=> b!91578 (= e!59750 e!59751)))

(declare-fun res!46626 () Bool)

(assert (=> b!91578 (=> (not res!46626) (not e!59751))))

(assert (=> b!91578 (= res!46626 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!91579 () Bool)

(assert (=> b!91579 (= e!59751 (arrayContainsKey!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!24121 (not res!46625)) b!91578))

(assert (= (and b!91578 res!46626) b!91579))

(declare-fun m!98445 () Bool)

(assert (=> d!24121 m!98445))

(assert (=> b!91579 m!98305))

(declare-fun m!98447 () Bool)

(assert (=> b!91579 m!98447))

(assert (=> b!91482 d!24121))

(declare-fun d!24123 () Bool)

(declare-fun e!59754 () Bool)

(assert (=> d!24123 e!59754))

(declare-fun c!15188 () Bool)

(assert (=> d!24123 (= c!15188 (and (not (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!44717 () Unit!2720)

(declare-fun choose!543 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 (_ BitVec 64) (_ BitVec 32) Int) Unit!2720)

(assert (=> d!24123 (= lt!44717 (choose!543 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!24123 (validMask!0 (mask!6466 (v!2721 (underlying!313 thiss!992))))))

(assert (=> d!24123 (= (lemmaListMapContainsThenArrayContainsFrom!78 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))) lt!44717)))

(declare-fun b!91584 () Bool)

(assert (=> b!91584 (= e!59754 (arrayContainsKey!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!91585 () Bool)

(assert (=> b!91585 (= e!59754 (ite (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24123 c!15188) b!91584))

(assert (= (and d!24123 (not c!15188)) b!91585))

(assert (=> d!24123 m!98305))

(declare-fun m!98449 () Bool)

(assert (=> d!24123 m!98449))

(declare-fun m!98451 () Bool)

(assert (=> d!24123 m!98451))

(assert (=> b!91584 m!98305))

(assert (=> b!91584 m!98331))

(assert (=> b!91482 d!24123))

(declare-fun b!91596 () Bool)

(declare-fun e!59766 () Bool)

(declare-fun e!59763 () Bool)

(assert (=> b!91596 (= e!59766 e!59763)))

(declare-fun res!46633 () Bool)

(assert (=> b!91596 (=> (not res!46633) (not e!59763))))

(declare-fun e!59765 () Bool)

(assert (=> b!91596 (= res!46633 (not e!59765))))

(declare-fun res!46634 () Bool)

(assert (=> b!91596 (=> (not res!46634) (not e!59765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!91596 (= res!46634 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun call!8936 () Bool)

(declare-fun bm!8933 () Bool)

(declare-fun c!15191 () Bool)

(assert (=> bm!8933 (= call!8936 (arrayNoDuplicates!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15191 (Cons!1547 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) Nil!1548) Nil!1548)))))

(declare-fun b!91597 () Bool)

(declare-fun contains!779 (List!1551 (_ BitVec 64)) Bool)

(assert (=> b!91597 (= e!59765 (contains!779 Nil!1548 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun b!91598 () Bool)

(declare-fun e!59764 () Bool)

(assert (=> b!91598 (= e!59764 call!8936)))

(declare-fun b!91599 () Bool)

(assert (=> b!91599 (= e!59764 call!8936)))

(declare-fun d!24125 () Bool)

(declare-fun res!46635 () Bool)

(assert (=> d!24125 (=> res!46635 e!59766)))

(assert (=> d!24125 (= res!46635 (bvsge from!355 (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(assert (=> d!24125 (= (arrayNoDuplicates!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) from!355 Nil!1548) e!59766)))

(declare-fun b!91600 () Bool)

(assert (=> b!91600 (= e!59763 e!59764)))

(assert (=> b!91600 (= c!15191 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (= (and d!24125 (not res!46635)) b!91596))

(assert (= (and b!91596 res!46634) b!91597))

(assert (= (and b!91596 res!46633) b!91600))

(assert (= (and b!91600 c!15191) b!91599))

(assert (= (and b!91600 (not c!15191)) b!91598))

(assert (= (or b!91599 b!91598) bm!8933))

(assert (=> b!91596 m!98305))

(assert (=> b!91596 m!98305))

(declare-fun m!98453 () Bool)

(assert (=> b!91596 m!98453))

(assert (=> bm!8933 m!98305))

(declare-fun m!98455 () Bool)

(assert (=> bm!8933 m!98455))

(assert (=> b!91597 m!98305))

(assert (=> b!91597 m!98305))

(declare-fun m!98457 () Bool)

(assert (=> b!91597 m!98457))

(assert (=> b!91600 m!98305))

(assert (=> b!91600 m!98305))

(assert (=> b!91600 m!98453))

(assert (=> b!91482 d!24125))

(declare-fun d!24127 () Bool)

(declare-fun res!46642 () Bool)

(declare-fun e!59769 () Bool)

(assert (=> d!24127 (=> (not res!46642) (not e!59769))))

(declare-fun simpleValid!63 (LongMapFixedSize!804) Bool)

(assert (=> d!24127 (= res!46642 (simpleValid!63 (_2!1145 lt!44647)))))

(assert (=> d!24127 (= (valid!353 (_2!1145 lt!44647)) e!59769)))

(declare-fun b!91607 () Bool)

(declare-fun res!46643 () Bool)

(assert (=> b!91607 (=> (not res!46643) (not e!59769))))

(declare-fun arrayCountValidKeys!0 (array!4135 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!91607 (= res!46643 (= (arrayCountValidKeys!0 (_keys!4086 (_2!1145 lt!44647)) #b00000000000000000000000000000000 (size!2214 (_keys!4086 (_2!1145 lt!44647)))) (_size!451 (_2!1145 lt!44647))))))

(declare-fun b!91608 () Bool)

(declare-fun res!46644 () Bool)

(assert (=> b!91608 (=> (not res!46644) (not e!59769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4135 (_ BitVec 32)) Bool)

(assert (=> b!91608 (= res!46644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4086 (_2!1145 lt!44647)) (mask!6466 (_2!1145 lt!44647))))))

(declare-fun b!91609 () Bool)

(assert (=> b!91609 (= e!59769 (arrayNoDuplicates!0 (_keys!4086 (_2!1145 lt!44647)) #b00000000000000000000000000000000 Nil!1548))))

(assert (= (and d!24127 res!46642) b!91607))

(assert (= (and b!91607 res!46643) b!91608))

(assert (= (and b!91608 res!46644) b!91609))

(declare-fun m!98459 () Bool)

(assert (=> d!24127 m!98459))

(declare-fun m!98461 () Bool)

(assert (=> b!91607 m!98461))

(declare-fun m!98463 () Bool)

(assert (=> b!91608 m!98463))

(declare-fun m!98465 () Bool)

(assert (=> b!91609 m!98465))

(assert (=> b!91501 d!24127))

(declare-fun d!24129 () Bool)

(assert (=> d!24129 (= (array_inv!1219 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvsge (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!91491 d!24129))

(declare-fun d!24131 () Bool)

(assert (=> d!24131 (= (array_inv!1220 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvsge (size!2215 (_values!2389 (v!2721 (underlying!313 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!91491 d!24131))

(declare-fun d!24133 () Bool)

(declare-fun e!59772 () Bool)

(assert (=> d!24133 e!59772))

(declare-fun res!46649 () Bool)

(assert (=> d!24133 (=> (not res!46649) (not e!59772))))

(declare-fun lt!44726 () ListLongMap!1499)

(assert (=> d!24133 (= res!46649 (contains!777 lt!44726 (_1!1144 lt!44651)))))

(declare-fun lt!44728 () List!1552)

(assert (=> d!24133 (= lt!44726 (ListLongMap!1500 lt!44728))))

(declare-fun lt!44727 () Unit!2720)

(declare-fun lt!44729 () Unit!2720)

(assert (=> d!24133 (= lt!44727 lt!44729)))

(declare-datatypes ((Option!151 0))(
  ( (Some!150 (v!2725 V!3091)) (None!149) )
))
(declare-fun getValueByKey!145 (List!1552 (_ BitVec 64)) Option!151)

(assert (=> d!24133 (= (getValueByKey!145 lt!44728 (_1!1144 lt!44651)) (Some!150 (_2!1144 lt!44651)))))

(declare-fun lemmaContainsTupThenGetReturnValue!62 (List!1552 (_ BitVec 64) V!3091) Unit!2720)

(assert (=> d!24133 (= lt!44729 (lemmaContainsTupThenGetReturnValue!62 lt!44728 (_1!1144 lt!44651) (_2!1144 lt!44651)))))

(declare-fun insertStrictlySorted!65 (List!1552 (_ BitVec 64) V!3091) List!1552)

(assert (=> d!24133 (= lt!44728 (insertStrictlySorted!65 (toList!765 (+!127 lt!44652 lt!44638)) (_1!1144 lt!44651) (_2!1144 lt!44651)))))

(assert (=> d!24133 (= (+!127 (+!127 lt!44652 lt!44638) lt!44651) lt!44726)))

(declare-fun b!91614 () Bool)

(declare-fun res!46650 () Bool)

(assert (=> b!91614 (=> (not res!46650) (not e!59772))))

(assert (=> b!91614 (= res!46650 (= (getValueByKey!145 (toList!765 lt!44726) (_1!1144 lt!44651)) (Some!150 (_2!1144 lt!44651))))))

(declare-fun b!91615 () Bool)

(declare-fun contains!780 (List!1552 tuple2!2266) Bool)

(assert (=> b!91615 (= e!59772 (contains!780 (toList!765 lt!44726) lt!44651))))

(assert (= (and d!24133 res!46649) b!91614))

(assert (= (and b!91614 res!46650) b!91615))

(declare-fun m!98467 () Bool)

(assert (=> d!24133 m!98467))

(declare-fun m!98469 () Bool)

(assert (=> d!24133 m!98469))

(declare-fun m!98471 () Bool)

(assert (=> d!24133 m!98471))

(declare-fun m!98473 () Bool)

(assert (=> d!24133 m!98473))

(declare-fun m!98475 () Bool)

(assert (=> b!91614 m!98475))

(declare-fun m!98477 () Bool)

(assert (=> b!91615 m!98477))

(assert (=> b!91492 d!24133))

(declare-fun d!24135 () Bool)

(declare-fun e!59773 () Bool)

(assert (=> d!24135 e!59773))

(declare-fun res!46651 () Bool)

(assert (=> d!24135 (=> (not res!46651) (not e!59773))))

(declare-fun lt!44730 () ListLongMap!1499)

(assert (=> d!24135 (= res!46651 (contains!777 lt!44730 (_1!1144 lt!44651)))))

(declare-fun lt!44732 () List!1552)

(assert (=> d!24135 (= lt!44730 (ListLongMap!1500 lt!44732))))

(declare-fun lt!44731 () Unit!2720)

(declare-fun lt!44733 () Unit!2720)

(assert (=> d!24135 (= lt!44731 lt!44733)))

(assert (=> d!24135 (= (getValueByKey!145 lt!44732 (_1!1144 lt!44651)) (Some!150 (_2!1144 lt!44651)))))

(assert (=> d!24135 (= lt!44733 (lemmaContainsTupThenGetReturnValue!62 lt!44732 (_1!1144 lt!44651) (_2!1144 lt!44651)))))

(assert (=> d!24135 (= lt!44732 (insertStrictlySorted!65 (toList!765 lt!44642) (_1!1144 lt!44651) (_2!1144 lt!44651)))))

(assert (=> d!24135 (= (+!127 lt!44642 lt!44651) lt!44730)))

(declare-fun b!91616 () Bool)

(declare-fun res!46652 () Bool)

(assert (=> b!91616 (=> (not res!46652) (not e!59773))))

(assert (=> b!91616 (= res!46652 (= (getValueByKey!145 (toList!765 lt!44730) (_1!1144 lt!44651)) (Some!150 (_2!1144 lt!44651))))))

(declare-fun b!91617 () Bool)

(assert (=> b!91617 (= e!59773 (contains!780 (toList!765 lt!44730) lt!44651))))

(assert (= (and d!24135 res!46651) b!91616))

(assert (= (and b!91616 res!46652) b!91617))

(declare-fun m!98479 () Bool)

(assert (=> d!24135 m!98479))

(declare-fun m!98481 () Bool)

(assert (=> d!24135 m!98481))

(declare-fun m!98483 () Bool)

(assert (=> d!24135 m!98483))

(declare-fun m!98485 () Bool)

(assert (=> d!24135 m!98485))

(declare-fun m!98487 () Bool)

(assert (=> b!91616 m!98487))

(declare-fun m!98489 () Bool)

(assert (=> b!91617 m!98489))

(assert (=> b!91492 d!24135))

(declare-fun d!24137 () Bool)

(assert (=> d!24137 (= (+!127 (+!127 lt!44642 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (+!127 (+!127 lt!44642 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))

(declare-fun lt!44736 () Unit!2720)

(declare-fun choose!544 (ListLongMap!1499 (_ BitVec 64) V!3091 (_ BitVec 64) V!3091) Unit!2720)

(assert (=> d!24137 (= lt!44736 (choose!544 lt!44642 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))

(assert (=> d!24137 (not (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24137 (= (addCommutativeForDiffKeys!46 lt!44642 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) lt!44736)))

(declare-fun bs!3807 () Bool)

(assert (= bs!3807 d!24137))

(assert (=> bs!3807 m!98305))

(declare-fun m!98491 () Bool)

(assert (=> bs!3807 m!98491))

(declare-fun m!98493 () Bool)

(assert (=> bs!3807 m!98493))

(declare-fun m!98495 () Bool)

(assert (=> bs!3807 m!98495))

(declare-fun m!98497 () Bool)

(assert (=> bs!3807 m!98497))

(assert (=> bs!3807 m!98495))

(assert (=> bs!3807 m!98493))

(declare-fun m!98499 () Bool)

(assert (=> bs!3807 m!98499))

(assert (=> b!91492 d!24137))

(declare-fun b!91642 () Bool)

(declare-fun res!46663 () Bool)

(declare-fun e!59788 () Bool)

(assert (=> b!91642 (=> (not res!46663) (not e!59788))))

(declare-fun lt!44757 () ListLongMap!1499)

(assert (=> b!91642 (= res!46663 (not (contains!777 lt!44757 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91643 () Bool)

(declare-fun e!59789 () Bool)

(declare-fun e!59791 () Bool)

(assert (=> b!91643 (= e!59789 e!59791)))

(assert (=> b!91643 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun res!46661 () Bool)

(assert (=> b!91643 (= res!46661 (contains!777 lt!44757 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91643 (=> (not res!46661) (not e!59791))))

(declare-fun bm!8936 () Bool)

(declare-fun call!8939 () ListLongMap!1499)

(assert (=> bm!8936 (= call!8939 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun b!91644 () Bool)

(declare-fun e!59792 () Bool)

(assert (=> b!91644 (= e!59792 (= lt!44757 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!91645 () Bool)

(declare-fun e!59794 () ListLongMap!1499)

(assert (=> b!91645 (= e!59794 (ListLongMap!1500 Nil!1549))))

(declare-fun b!91646 () Bool)

(assert (=> b!91646 (= e!59789 e!59792)))

(declare-fun c!15203 () Bool)

(assert (=> b!91646 (= c!15203 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!91647 () Bool)

(declare-fun isEmpty!346 (ListLongMap!1499) Bool)

(assert (=> b!91647 (= e!59792 (isEmpty!346 lt!44757))))

(declare-fun d!24139 () Bool)

(assert (=> d!24139 e!59788))

(declare-fun res!46664 () Bool)

(assert (=> d!24139 (=> (not res!46664) (not e!59788))))

(assert (=> d!24139 (= res!46664 (not (contains!777 lt!44757 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24139 (= lt!44757 e!59794)))

(declare-fun c!15202 () Bool)

(assert (=> d!24139 (= c!15202 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(assert (=> d!24139 (validMask!0 (mask!6466 (v!2721 (underlying!313 thiss!992))))))

(assert (=> d!24139 (= (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))) lt!44757)))

(declare-fun b!91648 () Bool)

(assert (=> b!91648 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(assert (=> b!91648 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2215 (_values!2389 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun apply!87 (ListLongMap!1499 (_ BitVec 64)) V!3091)

(assert (=> b!91648 (= e!59791 (= (apply!87 lt!44757 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!91649 () Bool)

(declare-fun e!59790 () Bool)

(assert (=> b!91649 (= e!59790 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91649 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!91650 () Bool)

(assert (=> b!91650 (= e!59788 e!59789)))

(declare-fun c!15200 () Bool)

(assert (=> b!91650 (= c!15200 e!59790)))

(declare-fun res!46662 () Bool)

(assert (=> b!91650 (=> (not res!46662) (not e!59790))))

(assert (=> b!91650 (= res!46662 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!91651 () Bool)

(declare-fun e!59793 () ListLongMap!1499)

(assert (=> b!91651 (= e!59793 call!8939)))

(declare-fun b!91652 () Bool)

(assert (=> b!91652 (= e!59794 e!59793)))

(declare-fun c!15201 () Bool)

(assert (=> b!91652 (= c!15201 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!91653 () Bool)

(declare-fun lt!44753 () Unit!2720)

(declare-fun lt!44751 () Unit!2720)

(assert (=> b!91653 (= lt!44753 lt!44751)))

(declare-fun lt!44755 () (_ BitVec 64))

(declare-fun lt!44752 () ListLongMap!1499)

(declare-fun lt!44756 () V!3091)

(declare-fun lt!44754 () (_ BitVec 64))

(assert (=> b!91653 (not (contains!777 (+!127 lt!44752 (tuple2!2267 lt!44755 lt!44756)) lt!44754))))

(declare-fun addStillNotContains!36 (ListLongMap!1499 (_ BitVec 64) V!3091 (_ BitVec 64)) Unit!2720)

(assert (=> b!91653 (= lt!44751 (addStillNotContains!36 lt!44752 lt!44755 lt!44756 lt!44754))))

(assert (=> b!91653 (= lt!44754 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!91653 (= lt!44756 (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!91653 (= lt!44755 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!91653 (= lt!44752 call!8939)))

(assert (=> b!91653 (= e!59793 (+!127 call!8939 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!24139 c!15202) b!91645))

(assert (= (and d!24139 (not c!15202)) b!91652))

(assert (= (and b!91652 c!15201) b!91653))

(assert (= (and b!91652 (not c!15201)) b!91651))

(assert (= (or b!91653 b!91651) bm!8936))

(assert (= (and d!24139 res!46664) b!91642))

(assert (= (and b!91642 res!46663) b!91650))

(assert (= (and b!91650 res!46662) b!91649))

(assert (= (and b!91650 c!15200) b!91643))

(assert (= (and b!91650 (not c!15200)) b!91646))

(assert (= (and b!91643 res!46661) b!91648))

(assert (= (and b!91646 c!15203) b!91644))

(assert (= (and b!91646 (not c!15203)) b!91647))

(declare-fun b_lambda!4043 () Bool)

(assert (=> (not b_lambda!4043) (not b!91648)))

(assert (=> b!91648 t!5382))

(declare-fun b_and!5563 () Bool)

(assert (= b_and!5551 (and (=> t!5382 result!3083) b_and!5563)))

(assert (=> b!91648 t!5384))

(declare-fun b_and!5565 () Bool)

(assert (= b_and!5553 (and (=> t!5384 result!3087) b_and!5565)))

(declare-fun b_lambda!4045 () Bool)

(assert (=> (not b_lambda!4045) (not b!91653)))

(assert (=> b!91653 t!5382))

(declare-fun b_and!5567 () Bool)

(assert (= b_and!5563 (and (=> t!5382 result!3083) b_and!5567)))

(assert (=> b!91653 t!5384))

(declare-fun b_and!5569 () Bool)

(assert (= b_and!5565 (and (=> t!5384 result!3087) b_and!5569)))

(declare-fun m!98501 () Bool)

(assert (=> b!91644 m!98501))

(declare-fun m!98503 () Bool)

(assert (=> d!24139 m!98503))

(assert (=> d!24139 m!98451))

(declare-fun m!98505 () Bool)

(assert (=> b!91648 m!98505))

(assert (=> b!91648 m!98369))

(assert (=> b!91648 m!98445))

(assert (=> b!91648 m!98445))

(declare-fun m!98507 () Bool)

(assert (=> b!91648 m!98507))

(assert (=> b!91648 m!98505))

(assert (=> b!91648 m!98369))

(declare-fun m!98509 () Bool)

(assert (=> b!91648 m!98509))

(declare-fun m!98511 () Bool)

(assert (=> b!91647 m!98511))

(assert (=> b!91649 m!98445))

(assert (=> b!91649 m!98445))

(declare-fun m!98513 () Bool)

(assert (=> b!91649 m!98513))

(assert (=> b!91643 m!98445))

(assert (=> b!91643 m!98445))

(declare-fun m!98515 () Bool)

(assert (=> b!91643 m!98515))

(assert (=> b!91652 m!98445))

(assert (=> b!91652 m!98445))

(assert (=> b!91652 m!98513))

(assert (=> bm!8936 m!98501))

(assert (=> b!91653 m!98505))

(declare-fun m!98517 () Bool)

(assert (=> b!91653 m!98517))

(declare-fun m!98519 () Bool)

(assert (=> b!91653 m!98519))

(declare-fun m!98521 () Bool)

(assert (=> b!91653 m!98521))

(assert (=> b!91653 m!98369))

(assert (=> b!91653 m!98505))

(assert (=> b!91653 m!98369))

(assert (=> b!91653 m!98509))

(assert (=> b!91653 m!98517))

(assert (=> b!91653 m!98445))

(declare-fun m!98523 () Bool)

(assert (=> b!91653 m!98523))

(declare-fun m!98525 () Bool)

(assert (=> b!91642 m!98525))

(assert (=> b!91492 d!24139))

(declare-fun d!24141 () Bool)

(declare-fun e!59795 () Bool)

(assert (=> d!24141 e!59795))

(declare-fun res!46665 () Bool)

(assert (=> d!24141 (=> (not res!46665) (not e!59795))))

(declare-fun lt!44758 () ListLongMap!1499)

(assert (=> d!24141 (= res!46665 (contains!777 lt!44758 (_1!1144 lt!44649)))))

(declare-fun lt!44760 () List!1552)

(assert (=> d!24141 (= lt!44758 (ListLongMap!1500 lt!44760))))

(declare-fun lt!44759 () Unit!2720)

(declare-fun lt!44761 () Unit!2720)

(assert (=> d!24141 (= lt!44759 lt!44761)))

(assert (=> d!24141 (= (getValueByKey!145 lt!44760 (_1!1144 lt!44649)) (Some!150 (_2!1144 lt!44649)))))

(assert (=> d!24141 (= lt!44761 (lemmaContainsTupThenGetReturnValue!62 lt!44760 (_1!1144 lt!44649) (_2!1144 lt!44649)))))

(assert (=> d!24141 (= lt!44760 (insertStrictlySorted!65 (toList!765 lt!44642) (_1!1144 lt!44649) (_2!1144 lt!44649)))))

(assert (=> d!24141 (= (+!127 lt!44642 lt!44649) lt!44758)))

(declare-fun b!91654 () Bool)

(declare-fun res!46666 () Bool)

(assert (=> b!91654 (=> (not res!46666) (not e!59795))))

(assert (=> b!91654 (= res!46666 (= (getValueByKey!145 (toList!765 lt!44758) (_1!1144 lt!44649)) (Some!150 (_2!1144 lt!44649))))))

(declare-fun b!91655 () Bool)

(assert (=> b!91655 (= e!59795 (contains!780 (toList!765 lt!44758) lt!44649))))

(assert (= (and d!24141 res!46665) b!91654))

(assert (= (and b!91654 res!46666) b!91655))

(declare-fun m!98527 () Bool)

(assert (=> d!24141 m!98527))

(declare-fun m!98529 () Bool)

(assert (=> d!24141 m!98529))

(declare-fun m!98531 () Bool)

(assert (=> d!24141 m!98531))

(declare-fun m!98533 () Bool)

(assert (=> d!24141 m!98533))

(declare-fun m!98535 () Bool)

(assert (=> b!91654 m!98535))

(declare-fun m!98537 () Bool)

(assert (=> b!91655 m!98537))

(assert (=> b!91492 d!24141))

(declare-fun d!24143 () Bool)

(declare-fun e!59796 () Bool)

(assert (=> d!24143 e!59796))

(declare-fun res!46667 () Bool)

(assert (=> d!24143 (=> (not res!46667) (not e!59796))))

(declare-fun lt!44762 () ListLongMap!1499)

(assert (=> d!24143 (= res!46667 (contains!777 lt!44762 (_1!1144 lt!44649)))))

(declare-fun lt!44764 () List!1552)

(assert (=> d!24143 (= lt!44762 (ListLongMap!1500 lt!44764))))

(declare-fun lt!44763 () Unit!2720)

(declare-fun lt!44765 () Unit!2720)

(assert (=> d!24143 (= lt!44763 lt!44765)))

(assert (=> d!24143 (= (getValueByKey!145 lt!44764 (_1!1144 lt!44649)) (Some!150 (_2!1144 lt!44649)))))

(assert (=> d!24143 (= lt!44765 (lemmaContainsTupThenGetReturnValue!62 lt!44764 (_1!1144 lt!44649) (_2!1144 lt!44649)))))

(assert (=> d!24143 (= lt!44764 (insertStrictlySorted!65 (toList!765 lt!44654) (_1!1144 lt!44649) (_2!1144 lt!44649)))))

(assert (=> d!24143 (= (+!127 lt!44654 lt!44649) lt!44762)))

(declare-fun b!91656 () Bool)

(declare-fun res!46668 () Bool)

(assert (=> b!91656 (=> (not res!46668) (not e!59796))))

(assert (=> b!91656 (= res!46668 (= (getValueByKey!145 (toList!765 lt!44762) (_1!1144 lt!44649)) (Some!150 (_2!1144 lt!44649))))))

(declare-fun b!91657 () Bool)

(assert (=> b!91657 (= e!59796 (contains!780 (toList!765 lt!44762) lt!44649))))

(assert (= (and d!24143 res!46667) b!91656))

(assert (= (and b!91656 res!46668) b!91657))

(declare-fun m!98539 () Bool)

(assert (=> d!24143 m!98539))

(declare-fun m!98541 () Bool)

(assert (=> d!24143 m!98541))

(declare-fun m!98543 () Bool)

(assert (=> d!24143 m!98543))

(declare-fun m!98545 () Bool)

(assert (=> d!24143 m!98545))

(declare-fun m!98547 () Bool)

(assert (=> b!91656 m!98547))

(declare-fun m!98549 () Bool)

(assert (=> b!91657 m!98549))

(assert (=> b!91492 d!24143))

(declare-fun d!24145 () Bool)

(assert (=> d!24145 (= (+!127 (+!127 lt!44652 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (+!127 (+!127 lt!44652 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))

(declare-fun lt!44766 () Unit!2720)

(assert (=> d!24145 (= lt!44766 (choose!544 lt!44652 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))

(assert (=> d!24145 (not (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24145 (= (addCommutativeForDiffKeys!46 lt!44652 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))) lt!44766)))

(declare-fun bs!3808 () Bool)

(assert (= bs!3808 d!24145))

(assert (=> bs!3808 m!98305))

(declare-fun m!98551 () Bool)

(assert (=> bs!3808 m!98551))

(declare-fun m!98553 () Bool)

(assert (=> bs!3808 m!98553))

(declare-fun m!98555 () Bool)

(assert (=> bs!3808 m!98555))

(declare-fun m!98557 () Bool)

(assert (=> bs!3808 m!98557))

(assert (=> bs!3808 m!98555))

(assert (=> bs!3808 m!98553))

(declare-fun m!98559 () Bool)

(assert (=> bs!3808 m!98559))

(assert (=> b!91492 d!24145))

(declare-fun d!24147 () Bool)

(assert (=> d!24147 (= (map!1222 (_2!1145 lt!44647)) (getCurrentListMap!457 (_keys!4086 (_2!1145 lt!44647)) (_values!2389 (_2!1145 lt!44647)) (mask!6466 (_2!1145 lt!44647)) (extraKeys!2237 (_2!1145 lt!44647)) (zeroValue!2294 (_2!1145 lt!44647)) (minValue!2294 (_2!1145 lt!44647)) #b00000000000000000000000000000000 (defaultEntry!2406 (_2!1145 lt!44647))))))

(declare-fun bs!3809 () Bool)

(assert (= bs!3809 d!24147))

(declare-fun m!98561 () Bool)

(assert (=> bs!3809 m!98561))

(assert (=> b!91492 d!24147))

(declare-fun b!91700 () Bool)

(declare-fun e!59834 () Bool)

(declare-fun e!59823 () Bool)

(assert (=> b!91700 (= e!59834 e!59823)))

(declare-fun res!46693 () Bool)

(declare-fun call!8957 () Bool)

(assert (=> b!91700 (= res!46693 call!8957)))

(assert (=> b!91700 (=> (not res!46693) (not e!59823))))

(declare-fun b!91701 () Bool)

(declare-fun lt!44827 () ListLongMap!1499)

(assert (=> b!91701 (= e!59823 (= (apply!87 lt!44827 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun bm!8951 () Bool)

(declare-fun call!8960 () ListLongMap!1499)

(declare-fun call!8954 () ListLongMap!1499)

(assert (=> bm!8951 (= call!8960 call!8954)))

(declare-fun bm!8952 () Bool)

(declare-fun call!8955 () ListLongMap!1499)

(assert (=> bm!8952 (= call!8955 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) from!355 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun d!24149 () Bool)

(declare-fun e!59825 () Bool)

(assert (=> d!24149 e!59825))

(declare-fun res!46694 () Bool)

(assert (=> d!24149 (=> (not res!46694) (not e!59825))))

(assert (=> d!24149 (= res!46694 (or (bvsge from!355 (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))) (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun lt!44820 () ListLongMap!1499)

(assert (=> d!24149 (= lt!44827 lt!44820)))

(declare-fun lt!44829 () Unit!2720)

(declare-fun e!59833 () Unit!2720)

(assert (=> d!24149 (= lt!44829 e!59833)))

(declare-fun c!15216 () Bool)

(declare-fun e!59831 () Bool)

(assert (=> d!24149 (= c!15216 e!59831)))

(declare-fun res!46688 () Bool)

(assert (=> d!24149 (=> (not res!46688) (not e!59831))))

(assert (=> d!24149 (= res!46688 (bvslt from!355 (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun e!59826 () ListLongMap!1499)

(assert (=> d!24149 (= lt!44820 e!59826)))

(declare-fun c!15221 () Bool)

(assert (=> d!24149 (= c!15221 (and (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24149 (validMask!0 (mask!6466 (v!2721 (underlying!313 thiss!992))))))

(assert (=> d!24149 (= (getCurrentListMap!457 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) from!355 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))) lt!44827)))

(declare-fun b!91702 () Bool)

(declare-fun Unit!2726 () Unit!2720)

(assert (=> b!91702 (= e!59833 Unit!2726)))

(declare-fun bm!8953 () Bool)

(assert (=> bm!8953 (= call!8957 (contains!777 lt!44827 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91703 () Bool)

(declare-fun e!59828 () Bool)

(declare-fun call!8959 () Bool)

(assert (=> b!91703 (= e!59828 (not call!8959))))

(declare-fun b!91704 () Bool)

(declare-fun res!46695 () Bool)

(assert (=> b!91704 (=> (not res!46695) (not e!59825))))

(declare-fun e!59827 () Bool)

(assert (=> b!91704 (= res!46695 e!59827)))

(declare-fun res!46691 () Bool)

(assert (=> b!91704 (=> res!46691 e!59827)))

(declare-fun e!59832 () Bool)

(assert (=> b!91704 (= res!46691 (not e!59832))))

(declare-fun res!46690 () Bool)

(assert (=> b!91704 (=> (not res!46690) (not e!59832))))

(assert (=> b!91704 (= res!46690 (bvslt from!355 (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!91705 () Bool)

(assert (=> b!91705 (= e!59826 (+!127 call!8954 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!91706 () Bool)

(declare-fun c!15218 () Bool)

(assert (=> b!91706 (= c!15218 (and (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!59824 () ListLongMap!1499)

(declare-fun e!59830 () ListLongMap!1499)

(assert (=> b!91706 (= e!59824 e!59830)))

(declare-fun b!91707 () Bool)

(assert (=> b!91707 (= e!59824 call!8960)))

(declare-fun b!91708 () Bool)

(assert (=> b!91708 (= e!59825 e!59828)))

(declare-fun c!15220 () Bool)

(assert (=> b!91708 (= c!15220 (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91709 () Bool)

(declare-fun res!46692 () Bool)

(assert (=> b!91709 (=> (not res!46692) (not e!59825))))

(assert (=> b!91709 (= res!46692 e!59834)))

(declare-fun c!15217 () Bool)

(assert (=> b!91709 (= c!15217 (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8954 () Bool)

(declare-fun call!8956 () ListLongMap!1499)

(declare-fun call!8958 () ListLongMap!1499)

(assert (=> bm!8954 (= call!8956 call!8958)))

(declare-fun b!91710 () Bool)

(assert (=> b!91710 (= e!59830 call!8956)))

(declare-fun b!91711 () Bool)

(declare-fun e!59835 () Bool)

(assert (=> b!91711 (= e!59828 e!59835)))

(declare-fun res!46689 () Bool)

(assert (=> b!91711 (= res!46689 call!8959)))

(assert (=> b!91711 (=> (not res!46689) (not e!59835))))

(declare-fun b!91712 () Bool)

(assert (=> b!91712 (= e!59832 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun bm!8955 () Bool)

(assert (=> bm!8955 (= call!8958 call!8955)))

(declare-fun b!91713 () Bool)

(declare-fun lt!44824 () Unit!2720)

(assert (=> b!91713 (= e!59833 lt!44824)))

(declare-fun lt!44817 () ListLongMap!1499)

(assert (=> b!91713 (= lt!44817 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) from!355 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun lt!44831 () (_ BitVec 64))

(assert (=> b!91713 (= lt!44831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44828 () (_ BitVec 64))

(assert (=> b!91713 (= lt!44828 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))))

(declare-fun lt!44821 () Unit!2720)

(declare-fun addStillContains!63 (ListLongMap!1499 (_ BitVec 64) V!3091 (_ BitVec 64)) Unit!2720)

(assert (=> b!91713 (= lt!44821 (addStillContains!63 lt!44817 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44828))))

(assert (=> b!91713 (contains!777 (+!127 lt!44817 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44828)))

(declare-fun lt!44814 () Unit!2720)

(assert (=> b!91713 (= lt!44814 lt!44821)))

(declare-fun lt!44830 () ListLongMap!1499)

(assert (=> b!91713 (= lt!44830 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) from!355 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun lt!44812 () (_ BitVec 64))

(assert (=> b!91713 (= lt!44812 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44832 () (_ BitVec 64))

(assert (=> b!91713 (= lt!44832 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))))

(declare-fun lt!44818 () Unit!2720)

(declare-fun addApplyDifferent!63 (ListLongMap!1499 (_ BitVec 64) V!3091 (_ BitVec 64)) Unit!2720)

(assert (=> b!91713 (= lt!44818 (addApplyDifferent!63 lt!44830 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44832))))

(assert (=> b!91713 (= (apply!87 (+!127 lt!44830 (tuple2!2267 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44832) (apply!87 lt!44830 lt!44832))))

(declare-fun lt!44811 () Unit!2720)

(assert (=> b!91713 (= lt!44811 lt!44818)))

(declare-fun lt!44825 () ListLongMap!1499)

(assert (=> b!91713 (= lt!44825 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) from!355 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun lt!44815 () (_ BitVec 64))

(assert (=> b!91713 (= lt!44815 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44819 () (_ BitVec 64))

(assert (=> b!91713 (= lt!44819 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))))

(declare-fun lt!44816 () Unit!2720)

(assert (=> b!91713 (= lt!44816 (addApplyDifferent!63 lt!44825 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44819))))

(assert (=> b!91713 (= (apply!87 (+!127 lt!44825 (tuple2!2267 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44819) (apply!87 lt!44825 lt!44819))))

(declare-fun lt!44813 () Unit!2720)

(assert (=> b!91713 (= lt!44813 lt!44816)))

(declare-fun lt!44823 () ListLongMap!1499)

(assert (=> b!91713 (= lt!44823 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) from!355 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun lt!44826 () (_ BitVec 64))

(assert (=> b!91713 (= lt!44826 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44822 () (_ BitVec 64))

(assert (=> b!91713 (= lt!44822 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))))

(assert (=> b!91713 (= lt!44824 (addApplyDifferent!63 lt!44823 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44822))))

(assert (=> b!91713 (= (apply!87 (+!127 lt!44823 (tuple2!2267 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44822) (apply!87 lt!44823 lt!44822))))

(declare-fun b!91714 () Bool)

(assert (=> b!91714 (= e!59830 call!8960)))

(declare-fun b!91715 () Bool)

(assert (=> b!91715 (= e!59826 e!59824)))

(declare-fun c!15219 () Bool)

(assert (=> b!91715 (= c!15219 (and (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8956 () Bool)

(assert (=> bm!8956 (= call!8959 (contains!777 lt!44827 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91716 () Bool)

(assert (=> b!91716 (= e!59835 (= (apply!87 lt!44827 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun b!91717 () Bool)

(declare-fun e!59829 () Bool)

(assert (=> b!91717 (= e!59827 e!59829)))

(declare-fun res!46687 () Bool)

(assert (=> b!91717 (=> (not res!46687) (not e!59829))))

(assert (=> b!91717 (= res!46687 (contains!777 lt!44827 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> b!91717 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!91718 () Bool)

(assert (=> b!91718 (= e!59831 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun bm!8957 () Bool)

(assert (=> bm!8957 (= call!8954 (+!127 (ite c!15221 call!8955 (ite c!15219 call!8958 call!8956)) (ite (or c!15221 c!15219) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun b!91719 () Bool)

(assert (=> b!91719 (= e!59834 (not call!8957))))

(declare-fun b!91720 () Bool)

(assert (=> b!91720 (= e!59829 (= (apply!87 lt!44827 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) from!355) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91720 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2215 (_values!2389 (v!2721 (underlying!313 thiss!992))))))))

(assert (=> b!91720 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24149 c!15221) b!91705))

(assert (= (and d!24149 (not c!15221)) b!91715))

(assert (= (and b!91715 c!15219) b!91707))

(assert (= (and b!91715 (not c!15219)) b!91706))

(assert (= (and b!91706 c!15218) b!91714))

(assert (= (and b!91706 (not c!15218)) b!91710))

(assert (= (or b!91714 b!91710) bm!8954))

(assert (= (or b!91707 bm!8954) bm!8955))

(assert (= (or b!91707 b!91714) bm!8951))

(assert (= (or b!91705 bm!8955) bm!8952))

(assert (= (or b!91705 bm!8951) bm!8957))

(assert (= (and d!24149 res!46688) b!91718))

(assert (= (and d!24149 c!15216) b!91713))

(assert (= (and d!24149 (not c!15216)) b!91702))

(assert (= (and d!24149 res!46694) b!91704))

(assert (= (and b!91704 res!46690) b!91712))

(assert (= (and b!91704 (not res!46691)) b!91717))

(assert (= (and b!91717 res!46687) b!91720))

(assert (= (and b!91704 res!46695) b!91709))

(assert (= (and b!91709 c!15217) b!91700))

(assert (= (and b!91709 (not c!15217)) b!91719))

(assert (= (and b!91700 res!46693) b!91701))

(assert (= (or b!91700 b!91719) bm!8953))

(assert (= (and b!91709 res!46692) b!91708))

(assert (= (and b!91708 c!15220) b!91711))

(assert (= (and b!91708 (not c!15220)) b!91703))

(assert (= (and b!91711 res!46689) b!91716))

(assert (= (or b!91711 b!91703) bm!8956))

(declare-fun b_lambda!4047 () Bool)

(assert (=> (not b_lambda!4047) (not b!91720)))

(assert (=> b!91720 t!5382))

(declare-fun b_and!5571 () Bool)

(assert (= b_and!5567 (and (=> t!5382 result!3083) b_and!5571)))

(assert (=> b!91720 t!5384))

(declare-fun b_and!5573 () Bool)

(assert (= b_and!5569 (and (=> t!5384 result!3087) b_and!5573)))

(assert (=> d!24149 m!98451))

(declare-fun m!98563 () Bool)

(assert (=> b!91705 m!98563))

(assert (=> b!91712 m!98305))

(assert (=> b!91712 m!98305))

(assert (=> b!91712 m!98453))

(declare-fun m!98565 () Bool)

(assert (=> bm!8956 m!98565))

(declare-fun m!98567 () Bool)

(assert (=> b!91713 m!98567))

(declare-fun m!98569 () Bool)

(assert (=> b!91713 m!98569))

(assert (=> b!91713 m!98569))

(declare-fun m!98571 () Bool)

(assert (=> b!91713 m!98571))

(declare-fun m!98573 () Bool)

(assert (=> b!91713 m!98573))

(declare-fun m!98575 () Bool)

(assert (=> b!91713 m!98575))

(declare-fun m!98577 () Bool)

(assert (=> b!91713 m!98577))

(declare-fun m!98579 () Bool)

(assert (=> b!91713 m!98579))

(assert (=> b!91713 m!98577))

(declare-fun m!98581 () Bool)

(assert (=> b!91713 m!98581))

(declare-fun m!98583 () Bool)

(assert (=> b!91713 m!98583))

(declare-fun m!98585 () Bool)

(assert (=> b!91713 m!98585))

(assert (=> b!91713 m!98573))

(declare-fun m!98587 () Bool)

(assert (=> b!91713 m!98587))

(declare-fun m!98589 () Bool)

(assert (=> b!91713 m!98589))

(declare-fun m!98591 () Bool)

(assert (=> b!91713 m!98591))

(assert (=> b!91713 m!98589))

(declare-fun m!98593 () Bool)

(assert (=> b!91713 m!98593))

(assert (=> b!91713 m!98305))

(declare-fun m!98595 () Bool)

(assert (=> b!91713 m!98595))

(declare-fun m!98597 () Bool)

(assert (=> b!91713 m!98597))

(assert (=> b!91718 m!98305))

(assert (=> b!91718 m!98305))

(assert (=> b!91718 m!98453))

(assert (=> b!91717 m!98305))

(assert (=> b!91717 m!98305))

(declare-fun m!98599 () Bool)

(assert (=> b!91717 m!98599))

(declare-fun m!98601 () Bool)

(assert (=> bm!8953 m!98601))

(declare-fun m!98603 () Bool)

(assert (=> b!91716 m!98603))

(assert (=> b!91720 m!98369))

(assert (=> b!91720 m!98367))

(assert (=> b!91720 m!98305))

(declare-fun m!98605 () Bool)

(assert (=> b!91720 m!98605))

(assert (=> b!91720 m!98305))

(assert (=> b!91720 m!98367))

(assert (=> b!91720 m!98369))

(assert (=> b!91720 m!98371))

(declare-fun m!98607 () Bool)

(assert (=> bm!8957 m!98607))

(assert (=> bm!8952 m!98579))

(declare-fun m!98609 () Bool)

(assert (=> b!91701 m!98609))

(assert (=> b!91492 d!24149))

(declare-fun d!24151 () Bool)

(declare-fun e!59836 () Bool)

(assert (=> d!24151 e!59836))

(declare-fun res!46696 () Bool)

(assert (=> d!24151 (=> (not res!46696) (not e!59836))))

(declare-fun lt!44833 () ListLongMap!1499)

(assert (=> d!24151 (= res!46696 (contains!777 lt!44833 (_1!1144 lt!44638)))))

(declare-fun lt!44835 () List!1552)

(assert (=> d!24151 (= lt!44833 (ListLongMap!1500 lt!44835))))

(declare-fun lt!44834 () Unit!2720)

(declare-fun lt!44836 () Unit!2720)

(assert (=> d!24151 (= lt!44834 lt!44836)))

(assert (=> d!24151 (= (getValueByKey!145 lt!44835 (_1!1144 lt!44638)) (Some!150 (_2!1144 lt!44638)))))

(assert (=> d!24151 (= lt!44836 (lemmaContainsTupThenGetReturnValue!62 lt!44835 (_1!1144 lt!44638) (_2!1144 lt!44638)))))

(assert (=> d!24151 (= lt!44835 (insertStrictlySorted!65 (toList!765 lt!44646) (_1!1144 lt!44638) (_2!1144 lt!44638)))))

(assert (=> d!24151 (= (+!127 lt!44646 lt!44638) lt!44833)))

(declare-fun b!91721 () Bool)

(declare-fun res!46697 () Bool)

(assert (=> b!91721 (=> (not res!46697) (not e!59836))))

(assert (=> b!91721 (= res!46697 (= (getValueByKey!145 (toList!765 lt!44833) (_1!1144 lt!44638)) (Some!150 (_2!1144 lt!44638))))))

(declare-fun b!91722 () Bool)

(assert (=> b!91722 (= e!59836 (contains!780 (toList!765 lt!44833) lt!44638))))

(assert (= (and d!24151 res!46696) b!91721))

(assert (= (and b!91721 res!46697) b!91722))

(declare-fun m!98611 () Bool)

(assert (=> d!24151 m!98611))

(declare-fun m!98613 () Bool)

(assert (=> d!24151 m!98613))

(declare-fun m!98615 () Bool)

(assert (=> d!24151 m!98615))

(declare-fun m!98617 () Bool)

(assert (=> d!24151 m!98617))

(declare-fun m!98619 () Bool)

(assert (=> b!91721 m!98619))

(declare-fun m!98621 () Bool)

(assert (=> b!91722 m!98621))

(assert (=> b!91492 d!24151))

(declare-fun d!24153 () Bool)

(declare-fun e!59837 () Bool)

(assert (=> d!24153 e!59837))

(declare-fun res!46698 () Bool)

(assert (=> d!24153 (=> (not res!46698) (not e!59837))))

(declare-fun lt!44837 () ListLongMap!1499)

(assert (=> d!24153 (= res!46698 (contains!777 lt!44837 (_1!1144 lt!44651)))))

(declare-fun lt!44839 () List!1552)

(assert (=> d!24153 (= lt!44837 (ListLongMap!1500 lt!44839))))

(declare-fun lt!44838 () Unit!2720)

(declare-fun lt!44840 () Unit!2720)

(assert (=> d!24153 (= lt!44838 lt!44840)))

(assert (=> d!24153 (= (getValueByKey!145 lt!44839 (_1!1144 lt!44651)) (Some!150 (_2!1144 lt!44651)))))

(assert (=> d!24153 (= lt!44840 (lemmaContainsTupThenGetReturnValue!62 lt!44839 (_1!1144 lt!44651) (_2!1144 lt!44651)))))

(assert (=> d!24153 (= lt!44839 (insertStrictlySorted!65 (toList!765 lt!44652) (_1!1144 lt!44651) (_2!1144 lt!44651)))))

(assert (=> d!24153 (= (+!127 lt!44652 lt!44651) lt!44837)))

(declare-fun b!91723 () Bool)

(declare-fun res!46699 () Bool)

(assert (=> b!91723 (=> (not res!46699) (not e!59837))))

(assert (=> b!91723 (= res!46699 (= (getValueByKey!145 (toList!765 lt!44837) (_1!1144 lt!44651)) (Some!150 (_2!1144 lt!44651))))))

(declare-fun b!91724 () Bool)

(assert (=> b!91724 (= e!59837 (contains!780 (toList!765 lt!44837) lt!44651))))

(assert (= (and d!24153 res!46698) b!91723))

(assert (= (and b!91723 res!46699) b!91724))

(declare-fun m!98623 () Bool)

(assert (=> d!24153 m!98623))

(declare-fun m!98625 () Bool)

(assert (=> d!24153 m!98625))

(declare-fun m!98627 () Bool)

(assert (=> d!24153 m!98627))

(declare-fun m!98629 () Bool)

(assert (=> d!24153 m!98629))

(declare-fun m!98631 () Bool)

(assert (=> b!91723 m!98631))

(declare-fun m!98633 () Bool)

(assert (=> b!91724 m!98633))

(assert (=> b!91492 d!24153))

(declare-fun d!24155 () Bool)

(declare-fun e!59838 () Bool)

(assert (=> d!24155 e!59838))

(declare-fun res!46700 () Bool)

(assert (=> d!24155 (=> (not res!46700) (not e!59838))))

(declare-fun lt!44841 () ListLongMap!1499)

(assert (=> d!24155 (= res!46700 (contains!777 lt!44841 (_1!1144 lt!44638)))))

(declare-fun lt!44843 () List!1552)

(assert (=> d!24155 (= lt!44841 (ListLongMap!1500 lt!44843))))

(declare-fun lt!44842 () Unit!2720)

(declare-fun lt!44844 () Unit!2720)

(assert (=> d!24155 (= lt!44842 lt!44844)))

(assert (=> d!24155 (= (getValueByKey!145 lt!44843 (_1!1144 lt!44638)) (Some!150 (_2!1144 lt!44638)))))

(assert (=> d!24155 (= lt!44844 (lemmaContainsTupThenGetReturnValue!62 lt!44843 (_1!1144 lt!44638) (_2!1144 lt!44638)))))

(assert (=> d!24155 (= lt!44843 (insertStrictlySorted!65 (toList!765 lt!44652) (_1!1144 lt!44638) (_2!1144 lt!44638)))))

(assert (=> d!24155 (= (+!127 lt!44652 lt!44638) lt!44841)))

(declare-fun b!91725 () Bool)

(declare-fun res!46701 () Bool)

(assert (=> b!91725 (=> (not res!46701) (not e!59838))))

(assert (=> b!91725 (= res!46701 (= (getValueByKey!145 (toList!765 lt!44841) (_1!1144 lt!44638)) (Some!150 (_2!1144 lt!44638))))))

(declare-fun b!91726 () Bool)

(assert (=> b!91726 (= e!59838 (contains!780 (toList!765 lt!44841) lt!44638))))

(assert (= (and d!24155 res!46700) b!91725))

(assert (= (and b!91725 res!46701) b!91726))

(declare-fun m!98635 () Bool)

(assert (=> d!24155 m!98635))

(declare-fun m!98637 () Bool)

(assert (=> d!24155 m!98637))

(declare-fun m!98639 () Bool)

(assert (=> d!24155 m!98639))

(declare-fun m!98641 () Bool)

(assert (=> d!24155 m!98641))

(declare-fun m!98643 () Bool)

(assert (=> b!91725 m!98643))

(declare-fun m!98645 () Bool)

(assert (=> b!91726 m!98645))

(assert (=> b!91492 d!24155))

(declare-fun d!24157 () Bool)

(assert (=> d!24157 (= (valid!354 thiss!992) (valid!353 (v!2721 (underlying!313 thiss!992))))))

(declare-fun bs!3810 () Bool)

(assert (= bs!3810 d!24157))

(declare-fun m!98647 () Bool)

(assert (=> bs!3810 m!98647))

(assert (=> start!11154 d!24157))

(declare-fun d!24159 () Bool)

(declare-fun c!15224 () Bool)

(assert (=> d!24159 (= c!15224 ((_ is ValueCellFull!948) (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun e!59841 () V!3091)

(assert (=> d!24159 (= (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) from!355) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!59841)))

(declare-fun b!91731 () Bool)

(declare-fun get!1238 (ValueCell!948 V!3091) V!3091)

(assert (=> b!91731 (= e!59841 (get!1238 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) from!355) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91732 () Bool)

(declare-fun get!1239 (ValueCell!948 V!3091) V!3091)

(assert (=> b!91732 (= e!59841 (get!1239 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) from!355) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24159 c!15224) b!91731))

(assert (= (and d!24159 (not c!15224)) b!91732))

(assert (=> b!91731 m!98367))

(assert (=> b!91731 m!98369))

(declare-fun m!98649 () Bool)

(assert (=> b!91731 m!98649))

(assert (=> b!91732 m!98367))

(assert (=> b!91732 m!98369))

(declare-fun m!98651 () Bool)

(assert (=> b!91732 m!98651))

(assert (=> b!91497 d!24159))

(declare-fun d!24161 () Bool)

(declare-fun res!46702 () Bool)

(declare-fun e!59842 () Bool)

(assert (=> d!24161 (=> (not res!46702) (not e!59842))))

(assert (=> d!24161 (= res!46702 (simpleValid!63 newMap!16))))

(assert (=> d!24161 (= (valid!353 newMap!16) e!59842)))

(declare-fun b!91733 () Bool)

(declare-fun res!46703 () Bool)

(assert (=> b!91733 (=> (not res!46703) (not e!59842))))

(assert (=> b!91733 (= res!46703 (= (arrayCountValidKeys!0 (_keys!4086 newMap!16) #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))) (_size!451 newMap!16)))))

(declare-fun b!91734 () Bool)

(declare-fun res!46704 () Bool)

(assert (=> b!91734 (=> (not res!46704) (not e!59842))))

(assert (=> b!91734 (= res!46704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4086 newMap!16) (mask!6466 newMap!16)))))

(declare-fun b!91735 () Bool)

(assert (=> b!91735 (= e!59842 (arrayNoDuplicates!0 (_keys!4086 newMap!16) #b00000000000000000000000000000000 Nil!1548))))

(assert (= (and d!24161 res!46702) b!91733))

(assert (= (and b!91733 res!46703) b!91734))

(assert (= (and b!91734 res!46704) b!91735))

(declare-fun m!98653 () Bool)

(assert (=> d!24161 m!98653))

(declare-fun m!98655 () Bool)

(assert (=> b!91733 m!98655))

(declare-fun m!98657 () Bool)

(assert (=> b!91734 m!98657))

(declare-fun m!98659 () Bool)

(assert (=> b!91735 m!98659))

(assert (=> b!91487 d!24161))

(declare-fun d!24163 () Bool)

(assert (=> d!24163 (= (map!1222 newMap!16) (getCurrentListMap!457 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun bs!3811 () Bool)

(assert (= bs!3811 d!24163))

(declare-fun m!98661 () Bool)

(assert (=> bs!3811 m!98661))

(assert (=> b!91483 d!24163))

(declare-fun b!91736 () Bool)

(declare-fun e!59854 () Bool)

(declare-fun e!59843 () Bool)

(assert (=> b!91736 (= e!59854 e!59843)))

(declare-fun res!46711 () Bool)

(declare-fun call!8964 () Bool)

(assert (=> b!91736 (= res!46711 call!8964)))

(assert (=> b!91736 (=> (not res!46711) (not e!59843))))

(declare-fun b!91737 () Bool)

(declare-fun lt!44861 () ListLongMap!1499)

(assert (=> b!91737 (= e!59843 (= (apply!87 lt!44861 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun bm!8958 () Bool)

(declare-fun call!8967 () ListLongMap!1499)

(declare-fun call!8961 () ListLongMap!1499)

(assert (=> bm!8958 (= call!8967 call!8961)))

(declare-fun bm!8959 () Bool)

(declare-fun call!8962 () ListLongMap!1499)

(assert (=> bm!8959 (= call!8962 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun d!24165 () Bool)

(declare-fun e!59845 () Bool)

(assert (=> d!24165 e!59845))

(declare-fun res!46712 () Bool)

(assert (=> d!24165 (=> (not res!46712) (not e!59845))))

(assert (=> d!24165 (= res!46712 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun lt!44854 () ListLongMap!1499)

(assert (=> d!24165 (= lt!44861 lt!44854)))

(declare-fun lt!44863 () Unit!2720)

(declare-fun e!59853 () Unit!2720)

(assert (=> d!24165 (= lt!44863 e!59853)))

(declare-fun c!15225 () Bool)

(declare-fun e!59851 () Bool)

(assert (=> d!24165 (= c!15225 e!59851)))

(declare-fun res!46706 () Bool)

(assert (=> d!24165 (=> (not res!46706) (not e!59851))))

(assert (=> d!24165 (= res!46706 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun e!59846 () ListLongMap!1499)

(assert (=> d!24165 (= lt!44854 e!59846)))

(declare-fun c!15230 () Bool)

(assert (=> d!24165 (= c!15230 (and (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24165 (validMask!0 (mask!6466 (v!2721 (underlying!313 thiss!992))))))

(assert (=> d!24165 (= (getCurrentListMap!457 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))) lt!44861)))

(declare-fun b!91738 () Bool)

(declare-fun Unit!2727 () Unit!2720)

(assert (=> b!91738 (= e!59853 Unit!2727)))

(declare-fun bm!8960 () Bool)

(assert (=> bm!8960 (= call!8964 (contains!777 lt!44861 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91739 () Bool)

(declare-fun e!59848 () Bool)

(declare-fun call!8966 () Bool)

(assert (=> b!91739 (= e!59848 (not call!8966))))

(declare-fun b!91740 () Bool)

(declare-fun res!46713 () Bool)

(assert (=> b!91740 (=> (not res!46713) (not e!59845))))

(declare-fun e!59847 () Bool)

(assert (=> b!91740 (= res!46713 e!59847)))

(declare-fun res!46709 () Bool)

(assert (=> b!91740 (=> res!46709 e!59847)))

(declare-fun e!59852 () Bool)

(assert (=> b!91740 (= res!46709 (not e!59852))))

(declare-fun res!46708 () Bool)

(assert (=> b!91740 (=> (not res!46708) (not e!59852))))

(assert (=> b!91740 (= res!46708 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!91741 () Bool)

(assert (=> b!91741 (= e!59846 (+!127 call!8961 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!91742 () Bool)

(declare-fun c!15227 () Bool)

(assert (=> b!91742 (= c!15227 (and (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!59844 () ListLongMap!1499)

(declare-fun e!59850 () ListLongMap!1499)

(assert (=> b!91742 (= e!59844 e!59850)))

(declare-fun b!91743 () Bool)

(assert (=> b!91743 (= e!59844 call!8967)))

(declare-fun b!91744 () Bool)

(assert (=> b!91744 (= e!59845 e!59848)))

(declare-fun c!15229 () Bool)

(assert (=> b!91744 (= c!15229 (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91745 () Bool)

(declare-fun res!46710 () Bool)

(assert (=> b!91745 (=> (not res!46710) (not e!59845))))

(assert (=> b!91745 (= res!46710 e!59854)))

(declare-fun c!15226 () Bool)

(assert (=> b!91745 (= c!15226 (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8961 () Bool)

(declare-fun call!8963 () ListLongMap!1499)

(declare-fun call!8965 () ListLongMap!1499)

(assert (=> bm!8961 (= call!8963 call!8965)))

(declare-fun b!91746 () Bool)

(assert (=> b!91746 (= e!59850 call!8963)))

(declare-fun b!91747 () Bool)

(declare-fun e!59855 () Bool)

(assert (=> b!91747 (= e!59848 e!59855)))

(declare-fun res!46707 () Bool)

(assert (=> b!91747 (= res!46707 call!8966)))

(assert (=> b!91747 (=> (not res!46707) (not e!59855))))

(declare-fun b!91748 () Bool)

(assert (=> b!91748 (= e!59852 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!8962 () Bool)

(assert (=> bm!8962 (= call!8965 call!8962)))

(declare-fun b!91749 () Bool)

(declare-fun lt!44858 () Unit!2720)

(assert (=> b!91749 (= e!59853 lt!44858)))

(declare-fun lt!44851 () ListLongMap!1499)

(assert (=> b!91749 (= lt!44851 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun lt!44865 () (_ BitVec 64))

(assert (=> b!91749 (= lt!44865 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44862 () (_ BitVec 64))

(assert (=> b!91749 (= lt!44862 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44855 () Unit!2720)

(assert (=> b!91749 (= lt!44855 (addStillContains!63 lt!44851 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44862))))

(assert (=> b!91749 (contains!777 (+!127 lt!44851 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44862)))

(declare-fun lt!44848 () Unit!2720)

(assert (=> b!91749 (= lt!44848 lt!44855)))

(declare-fun lt!44864 () ListLongMap!1499)

(assert (=> b!91749 (= lt!44864 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun lt!44846 () (_ BitVec 64))

(assert (=> b!91749 (= lt!44846 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44866 () (_ BitVec 64))

(assert (=> b!91749 (= lt!44866 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44852 () Unit!2720)

(assert (=> b!91749 (= lt!44852 (addApplyDifferent!63 lt!44864 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44866))))

(assert (=> b!91749 (= (apply!87 (+!127 lt!44864 (tuple2!2267 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44866) (apply!87 lt!44864 lt!44866))))

(declare-fun lt!44845 () Unit!2720)

(assert (=> b!91749 (= lt!44845 lt!44852)))

(declare-fun lt!44859 () ListLongMap!1499)

(assert (=> b!91749 (= lt!44859 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun lt!44849 () (_ BitVec 64))

(assert (=> b!91749 (= lt!44849 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44853 () (_ BitVec 64))

(assert (=> b!91749 (= lt!44853 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44850 () Unit!2720)

(assert (=> b!91749 (= lt!44850 (addApplyDifferent!63 lt!44859 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44853))))

(assert (=> b!91749 (= (apply!87 (+!127 lt!44859 (tuple2!2267 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44853) (apply!87 lt!44859 lt!44853))))

(declare-fun lt!44847 () Unit!2720)

(assert (=> b!91749 (= lt!44847 lt!44850)))

(declare-fun lt!44857 () ListLongMap!1499)

(assert (=> b!91749 (= lt!44857 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun lt!44860 () (_ BitVec 64))

(assert (=> b!91749 (= lt!44860 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44856 () (_ BitVec 64))

(assert (=> b!91749 (= lt!44856 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!91749 (= lt!44858 (addApplyDifferent!63 lt!44857 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44856))))

(assert (=> b!91749 (= (apply!87 (+!127 lt!44857 (tuple2!2267 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44856) (apply!87 lt!44857 lt!44856))))

(declare-fun b!91750 () Bool)

(assert (=> b!91750 (= e!59850 call!8967)))

(declare-fun b!91751 () Bool)

(assert (=> b!91751 (= e!59846 e!59844)))

(declare-fun c!15228 () Bool)

(assert (=> b!91751 (= c!15228 (and (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8963 () Bool)

(assert (=> bm!8963 (= call!8966 (contains!777 lt!44861 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91752 () Bool)

(assert (=> b!91752 (= e!59855 (= (apply!87 lt!44861 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun b!91753 () Bool)

(declare-fun e!59849 () Bool)

(assert (=> b!91753 (= e!59847 e!59849)))

(declare-fun res!46705 () Bool)

(assert (=> b!91753 (=> (not res!46705) (not e!59849))))

(assert (=> b!91753 (= res!46705 (contains!777 lt!44861 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91753 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!91754 () Bool)

(assert (=> b!91754 (= e!59851 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!8964 () Bool)

(assert (=> bm!8964 (= call!8961 (+!127 (ite c!15230 call!8962 (ite c!15228 call!8965 call!8963)) (ite (or c!15230 c!15228) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun b!91755 () Bool)

(assert (=> b!91755 (= e!59854 (not call!8964))))

(declare-fun b!91756 () Bool)

(assert (=> b!91756 (= e!59849 (= (apply!87 lt!44861 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91756 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2215 (_values!2389 (v!2721 (underlying!313 thiss!992))))))))

(assert (=> b!91756 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24165 c!15230) b!91741))

(assert (= (and d!24165 (not c!15230)) b!91751))

(assert (= (and b!91751 c!15228) b!91743))

(assert (= (and b!91751 (not c!15228)) b!91742))

(assert (= (and b!91742 c!15227) b!91750))

(assert (= (and b!91742 (not c!15227)) b!91746))

(assert (= (or b!91750 b!91746) bm!8961))

(assert (= (or b!91743 bm!8961) bm!8962))

(assert (= (or b!91743 b!91750) bm!8958))

(assert (= (or b!91741 bm!8962) bm!8959))

(assert (= (or b!91741 bm!8958) bm!8964))

(assert (= (and d!24165 res!46706) b!91754))

(assert (= (and d!24165 c!15225) b!91749))

(assert (= (and d!24165 (not c!15225)) b!91738))

(assert (= (and d!24165 res!46712) b!91740))

(assert (= (and b!91740 res!46708) b!91748))

(assert (= (and b!91740 (not res!46709)) b!91753))

(assert (= (and b!91753 res!46705) b!91756))

(assert (= (and b!91740 res!46713) b!91745))

(assert (= (and b!91745 c!15226) b!91736))

(assert (= (and b!91745 (not c!15226)) b!91755))

(assert (= (and b!91736 res!46711) b!91737))

(assert (= (or b!91736 b!91755) bm!8960))

(assert (= (and b!91745 res!46710) b!91744))

(assert (= (and b!91744 c!15229) b!91747))

(assert (= (and b!91744 (not c!15229)) b!91739))

(assert (= (and b!91747 res!46707) b!91752))

(assert (= (or b!91747 b!91739) bm!8963))

(declare-fun b_lambda!4049 () Bool)

(assert (=> (not b_lambda!4049) (not b!91756)))

(assert (=> b!91756 t!5382))

(declare-fun b_and!5575 () Bool)

(assert (= b_and!5571 (and (=> t!5382 result!3083) b_and!5575)))

(assert (=> b!91756 t!5384))

(declare-fun b_and!5577 () Bool)

(assert (= b_and!5573 (and (=> t!5384 result!3087) b_and!5577)))

(assert (=> d!24165 m!98451))

(declare-fun m!98663 () Bool)

(assert (=> b!91741 m!98663))

(assert (=> b!91748 m!98445))

(assert (=> b!91748 m!98445))

(assert (=> b!91748 m!98513))

(declare-fun m!98665 () Bool)

(assert (=> bm!8963 m!98665))

(declare-fun m!98667 () Bool)

(assert (=> b!91749 m!98667))

(declare-fun m!98669 () Bool)

(assert (=> b!91749 m!98669))

(assert (=> b!91749 m!98669))

(declare-fun m!98671 () Bool)

(assert (=> b!91749 m!98671))

(declare-fun m!98673 () Bool)

(assert (=> b!91749 m!98673))

(declare-fun m!98675 () Bool)

(assert (=> b!91749 m!98675))

(declare-fun m!98677 () Bool)

(assert (=> b!91749 m!98677))

(assert (=> b!91749 m!98351))

(assert (=> b!91749 m!98677))

(declare-fun m!98679 () Bool)

(assert (=> b!91749 m!98679))

(declare-fun m!98681 () Bool)

(assert (=> b!91749 m!98681))

(declare-fun m!98683 () Bool)

(assert (=> b!91749 m!98683))

(assert (=> b!91749 m!98673))

(declare-fun m!98685 () Bool)

(assert (=> b!91749 m!98685))

(declare-fun m!98687 () Bool)

(assert (=> b!91749 m!98687))

(declare-fun m!98689 () Bool)

(assert (=> b!91749 m!98689))

(assert (=> b!91749 m!98687))

(declare-fun m!98691 () Bool)

(assert (=> b!91749 m!98691))

(assert (=> b!91749 m!98445))

(declare-fun m!98693 () Bool)

(assert (=> b!91749 m!98693))

(declare-fun m!98695 () Bool)

(assert (=> b!91749 m!98695))

(assert (=> b!91754 m!98445))

(assert (=> b!91754 m!98445))

(assert (=> b!91754 m!98513))

(assert (=> b!91753 m!98445))

(assert (=> b!91753 m!98445))

(declare-fun m!98697 () Bool)

(assert (=> b!91753 m!98697))

(declare-fun m!98699 () Bool)

(assert (=> bm!8960 m!98699))

(declare-fun m!98701 () Bool)

(assert (=> b!91752 m!98701))

(assert (=> b!91756 m!98369))

(assert (=> b!91756 m!98505))

(assert (=> b!91756 m!98445))

(declare-fun m!98703 () Bool)

(assert (=> b!91756 m!98703))

(assert (=> b!91756 m!98445))

(assert (=> b!91756 m!98505))

(assert (=> b!91756 m!98369))

(assert (=> b!91756 m!98509))

(declare-fun m!98705 () Bool)

(assert (=> bm!8964 m!98705))

(assert (=> bm!8959 m!98351))

(declare-fun m!98707 () Bool)

(assert (=> b!91737 m!98707))

(assert (=> b!91483 d!24165))

(declare-fun d!24167 () Bool)

(declare-fun e!59861 () Bool)

(assert (=> d!24167 e!59861))

(declare-fun res!46716 () Bool)

(assert (=> d!24167 (=> res!46716 e!59861)))

(declare-fun lt!44876 () Bool)

(assert (=> d!24167 (= res!46716 (not lt!44876))))

(declare-fun lt!44875 () Bool)

(assert (=> d!24167 (= lt!44876 lt!44875)))

(declare-fun lt!44878 () Unit!2720)

(declare-fun e!59860 () Unit!2720)

(assert (=> d!24167 (= lt!44878 e!59860)))

(declare-fun c!15233 () Bool)

(assert (=> d!24167 (= c!15233 lt!44875)))

(declare-fun containsKey!149 (List!1552 (_ BitVec 64)) Bool)

(assert (=> d!24167 (= lt!44875 (containsKey!149 (toList!765 lt!44653) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> d!24167 (= (contains!777 lt!44653 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) lt!44876)))

(declare-fun b!91763 () Bool)

(declare-fun lt!44877 () Unit!2720)

(assert (=> b!91763 (= e!59860 lt!44877)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!97 (List!1552 (_ BitVec 64)) Unit!2720)

(assert (=> b!91763 (= lt!44877 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44653) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun isDefined!98 (Option!151) Bool)

(assert (=> b!91763 (isDefined!98 (getValueByKey!145 (toList!765 lt!44653) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun b!91764 () Bool)

(declare-fun Unit!2728 () Unit!2720)

(assert (=> b!91764 (= e!59860 Unit!2728)))

(declare-fun b!91765 () Bool)

(assert (=> b!91765 (= e!59861 (isDefined!98 (getValueByKey!145 (toList!765 lt!44653) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))))))

(assert (= (and d!24167 c!15233) b!91763))

(assert (= (and d!24167 (not c!15233)) b!91764))

(assert (= (and d!24167 (not res!46716)) b!91765))

(assert (=> d!24167 m!98305))

(declare-fun m!98709 () Bool)

(assert (=> d!24167 m!98709))

(assert (=> b!91763 m!98305))

(declare-fun m!98711 () Bool)

(assert (=> b!91763 m!98711))

(assert (=> b!91763 m!98305))

(declare-fun m!98713 () Bool)

(assert (=> b!91763 m!98713))

(assert (=> b!91763 m!98713))

(declare-fun m!98715 () Bool)

(assert (=> b!91763 m!98715))

(assert (=> b!91765 m!98305))

(assert (=> b!91765 m!98713))

(assert (=> b!91765 m!98713))

(assert (=> b!91765 m!98715))

(assert (=> b!91488 d!24167))

(declare-fun bm!9013 () Bool)

(declare-fun call!9029 () Bool)

(declare-fun call!9031 () Bool)

(assert (=> bm!9013 (= call!9029 call!9031)))

(declare-fun b!91850 () Bool)

(declare-fun res!46747 () Bool)

(declare-datatypes ((SeekEntryResult!248 0))(
  ( (MissingZero!248 (index!3132 (_ BitVec 32))) (Found!248 (index!3133 (_ BitVec 32))) (Intermediate!248 (undefined!1060 Bool) (index!3134 (_ BitVec 32)) (x!12447 (_ BitVec 32))) (Undefined!248) (MissingVacant!248 (index!3135 (_ BitVec 32))) )
))
(declare-fun lt!44942 () SeekEntryResult!248)

(assert (=> b!91850 (= res!46747 (= (select (arr!1967 (_keys!4086 newMap!16)) (index!3135 lt!44942)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!59921 () Bool)

(assert (=> b!91850 (=> (not res!46747) (not e!59921))))

(declare-fun b!91851 () Bool)

(declare-fun e!59910 () tuple2!2268)

(declare-fun e!59920 () tuple2!2268)

(assert (=> b!91851 (= e!59910 e!59920)))

(declare-fun c!15266 () Bool)

(declare-fun lt!44956 () SeekEntryResult!248)

(assert (=> b!91851 (= c!15266 ((_ is MissingZero!248) lt!44956))))

(declare-fun c!15262 () Bool)

(declare-fun bm!9014 () Bool)

(declare-fun c!15270 () Bool)

(declare-fun lt!44947 () SeekEntryResult!248)

(declare-fun c!15275 () Bool)

(declare-fun call!9016 () Bool)

(declare-fun c!15273 () Bool)

(declare-fun lt!44951 () SeekEntryResult!248)

(declare-fun c!15269 () Bool)

(declare-fun lt!44950 () SeekEntryResult!248)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!9014 (= call!9016 (inRange!0 (ite c!15273 (ite c!15275 (index!3133 lt!44947) (ite c!15269 (index!3132 lt!44942) (index!3135 lt!44942))) (ite c!15262 (index!3133 lt!44950) (ite c!15270 (index!3132 lt!44951) (index!3135 lt!44951)))) (mask!6466 newMap!16)))))

(declare-fun b!91852 () Bool)

(declare-fun lt!44933 () Unit!2720)

(declare-fun lt!44948 () Unit!2720)

(assert (=> b!91852 (= lt!44933 lt!44948)))

(declare-fun call!9027 () ListLongMap!1499)

(declare-fun call!9022 () ListLongMap!1499)

(assert (=> b!91852 (= call!9027 call!9022)))

(declare-fun lt!44943 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!36 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 V!3091 Int) Unit!2720)

(assert (=> b!91852 (= lt!44948 (lemmaChangeZeroKeyThenAddPairToListMap!36 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) lt!44943 (zeroValue!2294 newMap!16) lt!44644 (minValue!2294 newMap!16) (defaultEntry!2406 newMap!16)))))

(assert (=> b!91852 (= lt!44943 (bvor (extraKeys!2237 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!59927 () tuple2!2268)

(assert (=> b!91852 (= e!59927 (tuple2!2269 true (LongMapFixedSize!805 (defaultEntry!2406 newMap!16) (mask!6466 newMap!16) (bvor (extraKeys!2237 newMap!16) #b00000000000000000000000000000001) lt!44644 (minValue!2294 newMap!16) (_size!451 newMap!16) (_keys!4086 newMap!16) (_values!2389 newMap!16) (_vacant!451 newMap!16))))))

(declare-fun b!91853 () Bool)

(declare-fun e!59906 () Bool)

(declare-fun call!9023 () Bool)

(assert (=> b!91853 (= e!59906 (not call!9023))))

(declare-fun b!91854 () Bool)

(declare-fun e!59909 () Bool)

(assert (=> b!91854 (= e!59909 ((_ is Undefined!248) lt!44951))))

(declare-fun bm!9015 () Bool)

(declare-fun call!9017 () SeekEntryResult!248)

(declare-fun call!9028 () SeekEntryResult!248)

(assert (=> bm!9015 (= call!9017 call!9028)))

(declare-fun b!91855 () Bool)

(declare-fun res!46756 () Bool)

(declare-fun e!59908 () Bool)

(assert (=> b!91855 (=> (not res!46756) (not e!59908))))

(assert (=> b!91855 (= res!46756 (= (select (arr!1967 (_keys!4086 newMap!16)) (index!3132 lt!44951)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91856 () Bool)

(declare-fun e!59926 () Unit!2720)

(declare-fun Unit!2729 () Unit!2720)

(assert (=> b!91856 (= e!59926 Unit!2729)))

(declare-fun lt!44934 () Unit!2720)

(declare-fun call!9034 () Unit!2720)

(assert (=> b!91856 (= lt!44934 call!9034)))

(assert (=> b!91856 (= lt!44951 call!9017)))

(assert (=> b!91856 (= c!15270 ((_ is MissingZero!248) lt!44951))))

(declare-fun e!59919 () Bool)

(assert (=> b!91856 e!59919))

(declare-fun lt!44939 () Unit!2720)

(assert (=> b!91856 (= lt!44939 lt!44934)))

(assert (=> b!91856 false))

(declare-fun bm!9016 () Bool)

(declare-fun call!9037 () Unit!2720)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!36 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 (_ BitVec 64) Int) Unit!2720)

(assert (=> bm!9016 (= call!9037 (lemmaInListMapThenSeekEntryOrOpenFindsIt!36 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (defaultEntry!2406 newMap!16)))))

(declare-fun b!91857 () Bool)

(declare-fun res!46750 () Bool)

(assert (=> b!91857 (=> (not res!46750) (not e!59908))))

(declare-fun call!9025 () Bool)

(assert (=> b!91857 (= res!46750 call!9025)))

(assert (=> b!91857 (= e!59919 e!59908)))

(declare-fun b!91858 () Bool)

(declare-fun c!15274 () Bool)

(assert (=> b!91858 (= c!15274 ((_ is MissingVacant!248) lt!44951))))

(assert (=> b!91858 (= e!59919 e!59909)))

(declare-fun d!24169 () Bool)

(declare-fun e!59923 () Bool)

(assert (=> d!24169 e!59923))

(declare-fun res!46753 () Bool)

(assert (=> d!24169 (=> (not res!46753) (not e!59923))))

(declare-fun lt!44936 () tuple2!2268)

(assert (=> d!24169 (= res!46753 (valid!353 (_2!1145 lt!44936)))))

(declare-fun e!59922 () tuple2!2268)

(assert (=> d!24169 (= lt!44936 e!59922)))

(declare-fun c!15263 () Bool)

(assert (=> d!24169 (= c!15263 (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (bvneg (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))))))

(assert (=> d!24169 (valid!353 newMap!16)))

(assert (=> d!24169 (= (update!126 newMap!16 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644) lt!44936)))

(declare-fun bm!9017 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4135 (_ BitVec 32)) SeekEntryResult!248)

(assert (=> bm!9017 (= call!9028 (seekEntryOrOpen!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (_keys!4086 newMap!16) (mask!6466 newMap!16)))))

(declare-fun b!91859 () Bool)

(declare-fun e!59914 () tuple2!2268)

(assert (=> b!91859 (= e!59922 e!59914)))

(assert (=> b!91859 (= lt!44956 (seekEntryOrOpen!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (_keys!4086 newMap!16) (mask!6466 newMap!16)))))

(assert (=> b!91859 (= c!15273 ((_ is Undefined!248) lt!44956))))

(declare-fun b!91860 () Bool)

(declare-fun e!59924 () ListLongMap!1499)

(assert (=> b!91860 (= e!59924 (getCurrentListMap!457 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun bm!9018 () Bool)

(declare-fun c!15265 () Bool)

(assert (=> bm!9018 (= c!15265 c!15273)))

(declare-fun call!9036 () Bool)

(assert (=> bm!9018 (= call!9036 (contains!777 e!59924 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun lt!44957 () (_ BitVec 32))

(declare-fun c!15268 () Bool)

(declare-fun call!9020 () ListLongMap!1499)

(declare-fun bm!9019 () Bool)

(assert (=> bm!9019 (= call!9020 (getCurrentListMap!457 (_keys!4086 newMap!16) (ite c!15263 (_values!2389 newMap!16) (array!4138 (store (arr!1968 (_values!2389 newMap!16)) (index!3133 lt!44956) (ValueCellFull!948 lt!44644)) (size!2215 (_values!2389 newMap!16)))) (mask!6466 newMap!16) (ite c!15263 (ite c!15268 lt!44943 lt!44957) (extraKeys!2237 newMap!16)) (ite (and c!15263 c!15268) lt!44644 (zeroValue!2294 newMap!16)) (ite c!15263 (ite c!15268 (minValue!2294 newMap!16) lt!44644) (minValue!2294 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun b!91861 () Bool)

(declare-fun e!59912 () Bool)

(assert (=> b!91861 (= e!59923 e!59912)))

(declare-fun c!15272 () Bool)

(assert (=> b!91861 (= c!15272 (_1!1145 lt!44936))))

(declare-fun b!91862 () Bool)

(declare-fun call!9032 () ListLongMap!1499)

(assert (=> b!91862 (= e!59924 call!9032)))

(declare-fun b!91863 () Bool)

(declare-fun c!15264 () Bool)

(assert (=> b!91863 (= c!15264 ((_ is MissingVacant!248) lt!44942))))

(declare-fun e!59918 () Bool)

(declare-fun e!59907 () Bool)

(assert (=> b!91863 (= e!59918 e!59907)))

(declare-fun b!91864 () Bool)

(declare-fun res!46758 () Bool)

(assert (=> b!91864 (= res!46758 (= (select (arr!1967 (_keys!4086 newMap!16)) (index!3135 lt!44951)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91864 (=> (not res!46758) (not e!59906))))

(declare-fun bm!9020 () Bool)

(assert (=> bm!9020 (= call!9022 call!9020)))

(declare-fun b!91865 () Bool)

(declare-fun c!15267 () Bool)

(assert (=> b!91865 (= c!15267 ((_ is MissingVacant!248) lt!44956))))

(assert (=> b!91865 (= e!59914 e!59910)))

(declare-fun b!91866 () Bool)

(assert (=> b!91866 (= e!59908 (not call!9023))))

(declare-fun b!91867 () Bool)

(declare-fun e!59911 () Bool)

(assert (=> b!91867 (= e!59912 e!59911)))

(declare-fun call!9033 () ListLongMap!1499)

(declare-fun res!46748 () Bool)

(assert (=> b!91867 (= res!46748 (contains!777 call!9033 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> b!91867 (=> (not res!46748) (not e!59911))))

(declare-fun b!91868 () Bool)

(declare-fun e!59916 () ListLongMap!1499)

(declare-fun call!9035 () ListLongMap!1499)

(assert (=> b!91868 (= e!59916 call!9035)))

(declare-fun b!91869 () Bool)

(declare-fun lt!44946 () Unit!2720)

(assert (=> b!91869 (= e!59926 lt!44946)))

(assert (=> b!91869 (= lt!44946 call!9037)))

(assert (=> b!91869 (= lt!44950 call!9017)))

(declare-fun res!46751 () Bool)

(assert (=> b!91869 (= res!46751 ((_ is Found!248) lt!44950))))

(declare-fun e!59915 () Bool)

(assert (=> b!91869 (=> (not res!46751) (not e!59915))))

(assert (=> b!91869 e!59915))

(declare-fun b!91870 () Bool)

(assert (=> b!91870 (= e!59915 (= (select (arr!1967 (_keys!4086 newMap!16)) (index!3133 lt!44950)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun b!91871 () Bool)

(assert (=> b!91871 (= e!59907 ((_ is Undefined!248) lt!44942))))

(declare-fun b!91872 () Bool)

(assert (=> b!91872 (= e!59916 (getCurrentListMap!457 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun b!91873 () Bool)

(declare-fun lt!44938 () tuple2!2268)

(declare-fun call!9024 () tuple2!2268)

(assert (=> b!91873 (= lt!44938 call!9024)))

(assert (=> b!91873 (= e!59920 (tuple2!2269 (_1!1145 lt!44938) (_2!1145 lt!44938)))))

(declare-fun b!91874 () Bool)

(declare-fun e!59917 () Unit!2720)

(declare-fun lt!44958 () Unit!2720)

(assert (=> b!91874 (= e!59917 lt!44958)))

(assert (=> b!91874 (= lt!44958 call!9034)))

(declare-fun call!9038 () SeekEntryResult!248)

(assert (=> b!91874 (= lt!44942 call!9038)))

(assert (=> b!91874 (= c!15269 ((_ is MissingZero!248) lt!44942))))

(assert (=> b!91874 e!59918))

(declare-fun bm!9021 () Bool)

(assert (=> bm!9021 (= call!9031 call!9016)))

(declare-fun bm!9022 () Bool)

(declare-fun call!9019 () Bool)

(declare-fun call!9026 () Bool)

(assert (=> bm!9022 (= call!9019 call!9026)))

(declare-fun b!91875 () Bool)

(assert (=> b!91875 (= e!59907 e!59921)))

(declare-fun res!46755 () Bool)

(assert (=> b!91875 (= res!46755 call!9029)))

(assert (=> b!91875 (=> (not res!46755) (not e!59921))))

(declare-fun b!91876 () Bool)

(declare-fun Unit!2730 () Unit!2720)

(assert (=> b!91876 (= e!59917 Unit!2730)))

(declare-fun lt!44953 () Unit!2720)

(assert (=> b!91876 (= lt!44953 call!9037)))

(assert (=> b!91876 (= lt!44947 call!9038)))

(declare-fun res!46746 () Bool)

(assert (=> b!91876 (= res!46746 ((_ is Found!248) lt!44947))))

(declare-fun e!59925 () Bool)

(assert (=> b!91876 (=> (not res!46746) (not e!59925))))

(assert (=> b!91876 e!59925))

(declare-fun lt!44949 () Unit!2720)

(assert (=> b!91876 (= lt!44949 lt!44953)))

(assert (=> b!91876 false))

(declare-fun b!91877 () Bool)

(assert (=> b!91877 (= e!59909 e!59906)))

(declare-fun res!46757 () Bool)

(assert (=> b!91877 (= res!46757 call!9025)))

(assert (=> b!91877 (=> (not res!46757) (not e!59906))))

(declare-fun bm!9023 () Bool)

(declare-fun call!9039 () Bool)

(assert (=> bm!9023 (= call!9039 call!9016)))

(declare-fun b!91878 () Bool)

(declare-fun res!46754 () Bool)

(declare-fun e!59913 () Bool)

(assert (=> b!91878 (=> (not res!46754) (not e!59913))))

(assert (=> b!91878 (= res!46754 (= (select (arr!1967 (_keys!4086 newMap!16)) (index!3132 lt!44942)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91879 () Bool)

(declare-fun res!46752 () Bool)

(assert (=> b!91879 (=> (not res!46752) (not e!59913))))

(assert (=> b!91879 (= res!46752 call!9029)))

(assert (=> b!91879 (= e!59918 e!59913)))

(declare-fun call!9018 () ListLongMap!1499)

(declare-fun bm!9024 () Bool)

(assert (=> bm!9024 (= call!9018 (+!127 e!59916 (ite c!15263 (ite c!15268 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44644) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44644)) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(declare-fun c!15271 () Bool)

(assert (=> bm!9024 (= c!15271 c!15263)))

(declare-fun bm!9025 () Bool)

(assert (=> bm!9025 (= call!9027 call!9018)))

(declare-fun b!91880 () Bool)

(declare-fun call!9021 () ListLongMap!1499)

(assert (=> b!91880 (= e!59912 (= call!9033 call!9021))))

(declare-fun b!91881 () Bool)

(declare-fun res!46745 () Bool)

(assert (=> b!91881 (= res!46745 call!9031)))

(assert (=> b!91881 (=> (not res!46745) (not e!59925))))

(declare-fun bm!9026 () Bool)

(declare-fun call!9030 () ListLongMap!1499)

(assert (=> bm!9026 (= call!9032 call!9030)))

(declare-fun b!91882 () Bool)

(assert (=> b!91882 (= e!59922 e!59927)))

(assert (=> b!91882 (= c!15268 (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9027 () Bool)

(assert (=> bm!9027 (= call!9021 (map!1222 newMap!16))))

(declare-fun bm!9028 () Bool)

(declare-fun lt!44955 () array!4137)

(assert (=> bm!9028 (= call!9030 (getCurrentListMap!457 (_keys!4086 newMap!16) (ite (or c!15263 c!15273) (_values!2389 newMap!16) lt!44955) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun b!91883 () Bool)

(assert (=> b!91883 (= e!59913 (not call!9019))))

(declare-fun b!91884 () Bool)

(declare-fun lt!44945 () tuple2!2268)

(assert (=> b!91884 (= e!59910 (tuple2!2269 (_1!1145 lt!44945) (_2!1145 lt!44945)))))

(assert (=> b!91884 (= lt!44945 call!9024)))

(declare-fun bm!9029 () Bool)

(assert (=> bm!9029 (= call!9033 (map!1222 (_2!1145 lt!44936)))))

(declare-fun b!91885 () Bool)

(declare-fun lt!44952 () Unit!2720)

(declare-fun lt!44935 () Unit!2720)

(assert (=> b!91885 (= lt!44952 lt!44935)))

(assert (=> b!91885 (= call!9027 call!9022)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!36 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 V!3091 Int) Unit!2720)

(assert (=> b!91885 (= lt!44935 (lemmaChangeLongMinValueKeyThenAddPairToListMap!36 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) lt!44957 (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) lt!44644 (defaultEntry!2406 newMap!16)))))

(assert (=> b!91885 (= lt!44957 (bvor (extraKeys!2237 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!91885 (= e!59927 (tuple2!2269 true (LongMapFixedSize!805 (defaultEntry!2406 newMap!16) (mask!6466 newMap!16) (bvor (extraKeys!2237 newMap!16) #b00000000000000000000000000000010) (zeroValue!2294 newMap!16) lt!44644 (_size!451 newMap!16) (_keys!4086 newMap!16) (_values!2389 newMap!16) (_vacant!451 newMap!16))))))

(declare-fun bm!9030 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!36 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 (_ BitVec 64) Int) Unit!2720)

(assert (=> bm!9030 (= call!9034 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!36 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (defaultEntry!2406 newMap!16)))))

(declare-fun b!91886 () Bool)

(declare-fun res!46749 () Bool)

(assert (=> b!91886 (= res!46749 call!9039)))

(assert (=> b!91886 (=> (not res!46749) (not e!59915))))

(declare-fun bm!9031 () Bool)

(assert (=> bm!9031 (= call!9038 call!9028)))

(declare-fun bm!9032 () Bool)

(assert (=> bm!9032 (= call!9025 call!9039)))

(declare-fun b!91887 () Bool)

(declare-fun lt!44954 () Unit!2720)

(declare-fun lt!44959 () Unit!2720)

(assert (=> b!91887 (= lt!44954 lt!44959)))

(assert (=> b!91887 (contains!777 call!9032 (select (arr!1967 (_keys!4086 newMap!16)) (index!3133 lt!44956)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!97 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 (_ BitVec 32) Int) Unit!2720)

(assert (=> b!91887 (= lt!44959 (lemmaValidKeyInArrayIsInListMap!97 (_keys!4086 newMap!16) lt!44955 (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (index!3133 lt!44956) (defaultEntry!2406 newMap!16)))))

(assert (=> b!91887 (= lt!44955 (array!4138 (store (arr!1968 (_values!2389 newMap!16)) (index!3133 lt!44956) (ValueCellFull!948 lt!44644)) (size!2215 (_values!2389 newMap!16))))))

(declare-fun lt!44944 () Unit!2720)

(declare-fun lt!44937 () Unit!2720)

(assert (=> b!91887 (= lt!44944 lt!44937)))

(assert (=> b!91887 (= call!9018 call!9020)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!36 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 (_ BitVec 32) (_ BitVec 64) V!3091 Int) Unit!2720)

(assert (=> b!91887 (= lt!44937 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!36 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (index!3133 lt!44956) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!44941 () Unit!2720)

(assert (=> b!91887 (= lt!44941 e!59926)))

(assert (=> b!91887 (= c!15262 call!9036)))

(assert (=> b!91887 (= e!59920 (tuple2!2269 true (LongMapFixedSize!805 (defaultEntry!2406 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (_size!451 newMap!16) (_keys!4086 newMap!16) (array!4138 (store (arr!1968 (_values!2389 newMap!16)) (index!3133 lt!44956) (ValueCellFull!948 lt!44644)) (size!2215 (_values!2389 newMap!16))) (_vacant!451 newMap!16))))))

(declare-fun b!91888 () Bool)

(assert (=> b!91888 (= e!59925 (= (select (arr!1967 (_keys!4086 newMap!16)) (index!3133 lt!44947)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun bm!9033 () Bool)

(assert (=> bm!9033 (= call!9035 call!9030)))

(declare-fun b!91889 () Bool)

(assert (=> b!91889 (= e!59911 (= call!9033 (+!127 call!9021 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(declare-fun b!91890 () Bool)

(assert (=> b!91890 (= e!59921 (not call!9019))))

(declare-fun bm!9034 () Bool)

(assert (=> bm!9034 (= call!9026 (arrayContainsKey!0 (_keys!4086 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!9035 () Bool)

(declare-fun updateHelperNewKey!36 (LongMapFixedSize!804 (_ BitVec 64) V!3091 (_ BitVec 32)) tuple2!2268)

(assert (=> bm!9035 (= call!9024 (updateHelperNewKey!36 newMap!16 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644 (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956))))))

(declare-fun bm!9036 () Bool)

(assert (=> bm!9036 (= call!9023 call!9026)))

(declare-fun b!91891 () Bool)

(declare-fun lt!44940 () Unit!2720)

(assert (=> b!91891 (= lt!44940 e!59917)))

(assert (=> b!91891 (= c!15275 call!9036)))

(assert (=> b!91891 (= e!59914 (tuple2!2269 false newMap!16))))

(assert (= (and d!24169 c!15263) b!91882))

(assert (= (and d!24169 (not c!15263)) b!91859))

(assert (= (and b!91882 c!15268) b!91852))

(assert (= (and b!91882 (not c!15268)) b!91885))

(assert (= (or b!91852 b!91885) bm!9020))

(assert (= (or b!91852 b!91885) bm!9033))

(assert (= (or b!91852 b!91885) bm!9025))

(assert (= (and b!91859 c!15273) b!91891))

(assert (= (and b!91859 (not c!15273)) b!91865))

(assert (= (and b!91891 c!15275) b!91876))

(assert (= (and b!91891 (not c!15275)) b!91874))

(assert (= (and b!91876 res!46746) b!91881))

(assert (= (and b!91881 res!46745) b!91888))

(assert (= (and b!91874 c!15269) b!91879))

(assert (= (and b!91874 (not c!15269)) b!91863))

(assert (= (and b!91879 res!46752) b!91878))

(assert (= (and b!91878 res!46754) b!91883))

(assert (= (and b!91863 c!15264) b!91875))

(assert (= (and b!91863 (not c!15264)) b!91871))

(assert (= (and b!91875 res!46755) b!91850))

(assert (= (and b!91850 res!46747) b!91890))

(assert (= (or b!91879 b!91875) bm!9013))

(assert (= (or b!91883 b!91890) bm!9022))

(assert (= (or b!91881 bm!9013) bm!9021))

(assert (= (or b!91876 b!91874) bm!9031))

(assert (= (and b!91865 c!15267) b!91884))

(assert (= (and b!91865 (not c!15267)) b!91851))

(assert (= (and b!91851 c!15266) b!91873))

(assert (= (and b!91851 (not c!15266)) b!91887))

(assert (= (and b!91887 c!15262) b!91869))

(assert (= (and b!91887 (not c!15262)) b!91856))

(assert (= (and b!91869 res!46751) b!91886))

(assert (= (and b!91886 res!46749) b!91870))

(assert (= (and b!91856 c!15270) b!91857))

(assert (= (and b!91856 (not c!15270)) b!91858))

(assert (= (and b!91857 res!46750) b!91855))

(assert (= (and b!91855 res!46756) b!91866))

(assert (= (and b!91858 c!15274) b!91877))

(assert (= (and b!91858 (not c!15274)) b!91854))

(assert (= (and b!91877 res!46757) b!91864))

(assert (= (and b!91864 res!46758) b!91853))

(assert (= (or b!91857 b!91877) bm!9032))

(assert (= (or b!91866 b!91853) bm!9036))

(assert (= (or b!91886 bm!9032) bm!9023))

(assert (= (or b!91869 b!91856) bm!9015))

(assert (= (or b!91884 b!91873) bm!9035))

(assert (= (or bm!9031 bm!9015) bm!9017))

(assert (= (or b!91876 b!91869) bm!9016))

(assert (= (or bm!9022 bm!9036) bm!9034))

(assert (= (or b!91891 b!91887) bm!9026))

(assert (= (or bm!9021 bm!9023) bm!9014))

(assert (= (or b!91874 b!91856) bm!9030))

(assert (= (or b!91891 b!91887) bm!9018))

(assert (= (and bm!9018 c!15265) b!91862))

(assert (= (and bm!9018 (not c!15265)) b!91860))

(assert (= (or bm!9020 b!91887) bm!9019))

(assert (= (or bm!9033 bm!9026) bm!9028))

(assert (= (or bm!9025 b!91887) bm!9024))

(assert (= (and bm!9024 c!15271) b!91868))

(assert (= (and bm!9024 (not c!15271)) b!91872))

(assert (= (and d!24169 res!46753) b!91861))

(assert (= (and b!91861 c!15272) b!91867))

(assert (= (and b!91861 (not c!15272)) b!91880))

(assert (= (and b!91867 res!46748) b!91889))

(assert (= (or b!91889 b!91880) bm!9027))

(assert (= (or b!91867 b!91889 b!91880) bm!9029))

(declare-fun m!98717 () Bool)

(assert (=> b!91850 m!98717))

(declare-fun m!98719 () Bool)

(assert (=> b!91852 m!98719))

(assert (=> bm!9016 m!98305))

(declare-fun m!98721 () Bool)

(assert (=> bm!9016 m!98721))

(declare-fun m!98723 () Bool)

(assert (=> b!91870 m!98723))

(declare-fun m!98725 () Bool)

(assert (=> bm!9028 m!98725))

(declare-fun m!98727 () Bool)

(assert (=> b!91889 m!98727))

(assert (=> b!91872 m!98661))

(assert (=> bm!9017 m!98305))

(declare-fun m!98729 () Bool)

(assert (=> bm!9017 m!98729))

(assert (=> bm!9018 m!98305))

(declare-fun m!98731 () Bool)

(assert (=> bm!9018 m!98731))

(declare-fun m!98733 () Bool)

(assert (=> bm!9014 m!98733))

(assert (=> bm!9035 m!98305))

(declare-fun m!98735 () Bool)

(assert (=> bm!9035 m!98735))

(assert (=> b!91860 m!98661))

(declare-fun m!98737 () Bool)

(assert (=> b!91885 m!98737))

(assert (=> bm!9027 m!98311))

(assert (=> b!91859 m!98305))

(assert (=> b!91859 m!98729))

(declare-fun m!98739 () Bool)

(assert (=> b!91878 m!98739))

(assert (=> b!91867 m!98305))

(declare-fun m!98741 () Bool)

(assert (=> b!91867 m!98741))

(assert (=> bm!9034 m!98305))

(declare-fun m!98743 () Bool)

(assert (=> bm!9034 m!98743))

(declare-fun m!98745 () Bool)

(assert (=> b!91888 m!98745))

(declare-fun m!98747 () Bool)

(assert (=> bm!9029 m!98747))

(assert (=> b!91887 m!98305))

(declare-fun m!98749 () Bool)

(assert (=> b!91887 m!98749))

(declare-fun m!98751 () Bool)

(assert (=> b!91887 m!98751))

(declare-fun m!98753 () Bool)

(assert (=> b!91887 m!98753))

(assert (=> b!91887 m!98751))

(declare-fun m!98755 () Bool)

(assert (=> b!91887 m!98755))

(declare-fun m!98757 () Bool)

(assert (=> b!91887 m!98757))

(assert (=> bm!9019 m!98757))

(declare-fun m!98759 () Bool)

(assert (=> bm!9019 m!98759))

(declare-fun m!98761 () Bool)

(assert (=> bm!9024 m!98761))

(declare-fun m!98763 () Bool)

(assert (=> d!24169 m!98763))

(assert (=> d!24169 m!98365))

(declare-fun m!98765 () Bool)

(assert (=> b!91855 m!98765))

(declare-fun m!98767 () Bool)

(assert (=> b!91864 m!98767))

(assert (=> bm!9030 m!98305))

(declare-fun m!98769 () Bool)

(assert (=> bm!9030 m!98769))

(assert (=> b!91488 d!24169))

(declare-fun b!91899 () Bool)

(declare-fun e!59932 () Bool)

(assert (=> b!91899 (= e!59932 tp_is_empty!2583)))

(declare-fun condMapEmpty!3581 () Bool)

(declare-fun mapDefault!3581 () ValueCell!948)

(assert (=> mapNonEmpty!3571 (= condMapEmpty!3581 (= mapRest!3572 ((as const (Array (_ BitVec 32) ValueCell!948)) mapDefault!3581)))))

(declare-fun mapRes!3581 () Bool)

(assert (=> mapNonEmpty!3571 (= tp!9251 (and e!59932 mapRes!3581))))

(declare-fun mapNonEmpty!3581 () Bool)

(declare-fun tp!9269 () Bool)

(declare-fun e!59933 () Bool)

(assert (=> mapNonEmpty!3581 (= mapRes!3581 (and tp!9269 e!59933))))

(declare-fun mapValue!3581 () ValueCell!948)

(declare-fun mapKey!3581 () (_ BitVec 32))

(declare-fun mapRest!3581 () (Array (_ BitVec 32) ValueCell!948))

(assert (=> mapNonEmpty!3581 (= mapRest!3572 (store mapRest!3581 mapKey!3581 mapValue!3581))))

(declare-fun mapIsEmpty!3581 () Bool)

(assert (=> mapIsEmpty!3581 mapRes!3581))

(declare-fun b!91898 () Bool)

(assert (=> b!91898 (= e!59933 tp_is_empty!2583)))

(assert (= (and mapNonEmpty!3571 condMapEmpty!3581) mapIsEmpty!3581))

(assert (= (and mapNonEmpty!3571 (not condMapEmpty!3581)) mapNonEmpty!3581))

(assert (= (and mapNonEmpty!3581 ((_ is ValueCellFull!948) mapValue!3581)) b!91898))

(assert (= (and mapNonEmpty!3571 ((_ is ValueCellFull!948) mapDefault!3581)) b!91899))

(declare-fun m!98771 () Bool)

(assert (=> mapNonEmpty!3581 m!98771))

(declare-fun b!91901 () Bool)

(declare-fun e!59934 () Bool)

(assert (=> b!91901 (= e!59934 tp_is_empty!2583)))

(declare-fun condMapEmpty!3582 () Bool)

(declare-fun mapDefault!3582 () ValueCell!948)

(assert (=> mapNonEmpty!3572 (= condMapEmpty!3582 (= mapRest!3571 ((as const (Array (_ BitVec 32) ValueCell!948)) mapDefault!3582)))))

(declare-fun mapRes!3582 () Bool)

(assert (=> mapNonEmpty!3572 (= tp!9253 (and e!59934 mapRes!3582))))

(declare-fun mapNonEmpty!3582 () Bool)

(declare-fun tp!9270 () Bool)

(declare-fun e!59935 () Bool)

(assert (=> mapNonEmpty!3582 (= mapRes!3582 (and tp!9270 e!59935))))

(declare-fun mapRest!3582 () (Array (_ BitVec 32) ValueCell!948))

(declare-fun mapKey!3582 () (_ BitVec 32))

(declare-fun mapValue!3582 () ValueCell!948)

(assert (=> mapNonEmpty!3582 (= mapRest!3571 (store mapRest!3582 mapKey!3582 mapValue!3582))))

(declare-fun mapIsEmpty!3582 () Bool)

(assert (=> mapIsEmpty!3582 mapRes!3582))

(declare-fun b!91900 () Bool)

(assert (=> b!91900 (= e!59935 tp_is_empty!2583)))

(assert (= (and mapNonEmpty!3572 condMapEmpty!3582) mapIsEmpty!3582))

(assert (= (and mapNonEmpty!3572 (not condMapEmpty!3582)) mapNonEmpty!3582))

(assert (= (and mapNonEmpty!3582 ((_ is ValueCellFull!948) mapValue!3582)) b!91900))

(assert (= (and mapNonEmpty!3572 ((_ is ValueCellFull!948) mapDefault!3582)) b!91901))

(declare-fun m!98773 () Bool)

(assert (=> mapNonEmpty!3582 m!98773))

(declare-fun b_lambda!4051 () Bool)

(assert (= b_lambda!4049 (or (and b!91491 b_free!2333) (and b!91496 b_free!2335 (= (defaultEntry!2406 newMap!16) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))))) b_lambda!4051)))

(declare-fun b_lambda!4053 () Bool)

(assert (= b_lambda!4045 (or (and b!91491 b_free!2333) (and b!91496 b_free!2335 (= (defaultEntry!2406 newMap!16) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))))) b_lambda!4053)))

(declare-fun b_lambda!4055 () Bool)

(assert (= b_lambda!4047 (or (and b!91491 b_free!2333) (and b!91496 b_free!2335 (= (defaultEntry!2406 newMap!16) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))))) b_lambda!4055)))

(declare-fun b_lambda!4057 () Bool)

(assert (= b_lambda!4043 (or (and b!91491 b_free!2333) (and b!91496 b_free!2335 (= (defaultEntry!2406 newMap!16) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))))) b_lambda!4057)))

(check-sat (not d!24149) (not b!91741) (not b!91614) (not bm!9028) (not d!24147) (not b!91642) (not b!91749) (not b!91644) (not b!91617) (not b!91596) (not b!91754) (not d!24169) (not b!91657) (not b!91653) (not b_next!2333) (not bm!8960) (not b!91726) (not b!91716) (not b!91731) (not b!91720) (not b!91735) (not d!24127) (not b!91765) (not b!91889) (not b!91748) (not d!24135) (not bm!8952) (not bm!8959) (not b!91600) (not bm!9018) (not b_lambda!4055) (not b!91649) (not b!91721) (not b!91656) (not b!91615) (not d!24163) (not mapNonEmpty!3581) b_and!5575 (not bm!8933) (not d!24139) (not bm!9034) (not d!24155) (not bm!8953) (not bm!9017) (not d!24123) (not b!91867) (not b!91705) (not b!91872) tp_is_empty!2583 (not b!91609) (not d!24145) (not bm!8964) (not b_next!2335) (not b!91732) (not bm!9014) (not b!91887) (not b!91885) (not b!91733) (not b!91734) (not b!91712) (not b!91717) b_and!5577 (not d!24151) (not bm!9030) (not b!91722) (not b_lambda!4053) (not bm!9027) (not d!24137) (not b!91756) (not d!24117) (not d!24133) (not mapNonEmpty!3582) (not b!91753) (not d!24153) (not bm!9019) (not b!91652) (not b!91859) (not b!91763) (not d!24157) (not bm!9035) (not bm!8963) (not b!91723) (not d!24143) (not b!91752) (not d!24119) (not b!91648) (not b!91607) (not b!91724) (not b!91608) (not b!91584) (not bm!9016) (not b!91713) (not b!91725) (not b!91643) (not b!91852) (not bm!9029) (not b!91737) (not b!91701) (not d!24161) (not b!91616) (not b!91718) (not b_lambda!4041) (not b!91654) (not b!91647) (not b!91597) (not d!24141) (not b_lambda!4057) (not b!91579) (not b!91860) (not bm!8957) (not b_lambda!4051) (not d!24167) (not bm!8936) (not b!91655) (not d!24165) (not bm!8956) (not bm!9024))
(check-sat b_and!5575 b_and!5577 (not b_next!2333) (not b_next!2335))
(get-model)

(declare-fun b!91902 () Bool)

(declare-fun e!59947 () Bool)

(declare-fun e!59936 () Bool)

(assert (=> b!91902 (= e!59947 e!59936)))

(declare-fun res!46765 () Bool)

(declare-fun call!9043 () Bool)

(assert (=> b!91902 (= res!46765 call!9043)))

(assert (=> b!91902 (=> (not res!46765) (not e!59936))))

(declare-fun b!91903 () Bool)

(declare-fun lt!44976 () ListLongMap!1499)

(assert (=> b!91903 (= e!59936 (= (apply!87 lt!44976 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2294 (_2!1145 lt!44647))))))

(declare-fun bm!9037 () Bool)

(declare-fun call!9046 () ListLongMap!1499)

(declare-fun call!9040 () ListLongMap!1499)

(assert (=> bm!9037 (= call!9046 call!9040)))

(declare-fun bm!9038 () Bool)

(declare-fun call!9041 () ListLongMap!1499)

(assert (=> bm!9038 (= call!9041 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (_2!1145 lt!44647)) (_values!2389 (_2!1145 lt!44647)) (mask!6466 (_2!1145 lt!44647)) (extraKeys!2237 (_2!1145 lt!44647)) (zeroValue!2294 (_2!1145 lt!44647)) (minValue!2294 (_2!1145 lt!44647)) #b00000000000000000000000000000000 (defaultEntry!2406 (_2!1145 lt!44647))))))

(declare-fun d!24171 () Bool)

(declare-fun e!59938 () Bool)

(assert (=> d!24171 e!59938))

(declare-fun res!46766 () Bool)

(assert (=> d!24171 (=> (not res!46766) (not e!59938))))

(assert (=> d!24171 (= res!46766 (or (bvsge #b00000000000000000000000000000000 (size!2214 (_keys!4086 (_2!1145 lt!44647)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 (_2!1145 lt!44647)))))))))

(declare-fun lt!44969 () ListLongMap!1499)

(assert (=> d!24171 (= lt!44976 lt!44969)))

(declare-fun lt!44978 () Unit!2720)

(declare-fun e!59946 () Unit!2720)

(assert (=> d!24171 (= lt!44978 e!59946)))

(declare-fun c!15276 () Bool)

(declare-fun e!59944 () Bool)

(assert (=> d!24171 (= c!15276 e!59944)))

(declare-fun res!46760 () Bool)

(assert (=> d!24171 (=> (not res!46760) (not e!59944))))

(assert (=> d!24171 (= res!46760 (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 (_2!1145 lt!44647)))))))

(declare-fun e!59939 () ListLongMap!1499)

(assert (=> d!24171 (= lt!44969 e!59939)))

(declare-fun c!15281 () Bool)

(assert (=> d!24171 (= c!15281 (and (not (= (bvand (extraKeys!2237 (_2!1145 lt!44647)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2237 (_2!1145 lt!44647)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24171 (validMask!0 (mask!6466 (_2!1145 lt!44647)))))

(assert (=> d!24171 (= (getCurrentListMap!457 (_keys!4086 (_2!1145 lt!44647)) (_values!2389 (_2!1145 lt!44647)) (mask!6466 (_2!1145 lt!44647)) (extraKeys!2237 (_2!1145 lt!44647)) (zeroValue!2294 (_2!1145 lt!44647)) (minValue!2294 (_2!1145 lt!44647)) #b00000000000000000000000000000000 (defaultEntry!2406 (_2!1145 lt!44647))) lt!44976)))

(declare-fun b!91904 () Bool)

(declare-fun Unit!2731 () Unit!2720)

(assert (=> b!91904 (= e!59946 Unit!2731)))

(declare-fun bm!9039 () Bool)

(assert (=> bm!9039 (= call!9043 (contains!777 lt!44976 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91905 () Bool)

(declare-fun e!59941 () Bool)

(declare-fun call!9045 () Bool)

(assert (=> b!91905 (= e!59941 (not call!9045))))

(declare-fun b!91906 () Bool)

(declare-fun res!46767 () Bool)

(assert (=> b!91906 (=> (not res!46767) (not e!59938))))

(declare-fun e!59940 () Bool)

(assert (=> b!91906 (= res!46767 e!59940)))

(declare-fun res!46763 () Bool)

(assert (=> b!91906 (=> res!46763 e!59940)))

(declare-fun e!59945 () Bool)

(assert (=> b!91906 (= res!46763 (not e!59945))))

(declare-fun res!46762 () Bool)

(assert (=> b!91906 (=> (not res!46762) (not e!59945))))

(assert (=> b!91906 (= res!46762 (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 (_2!1145 lt!44647)))))))

(declare-fun b!91907 () Bool)

(assert (=> b!91907 (= e!59939 (+!127 call!9040 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (_2!1145 lt!44647)))))))

(declare-fun b!91908 () Bool)

(declare-fun c!15278 () Bool)

(assert (=> b!91908 (= c!15278 (and (not (= (bvand (extraKeys!2237 (_2!1145 lt!44647)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2237 (_2!1145 lt!44647)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!59937 () ListLongMap!1499)

(declare-fun e!59943 () ListLongMap!1499)

(assert (=> b!91908 (= e!59937 e!59943)))

(declare-fun b!91909 () Bool)

(assert (=> b!91909 (= e!59937 call!9046)))

(declare-fun b!91910 () Bool)

(assert (=> b!91910 (= e!59938 e!59941)))

(declare-fun c!15280 () Bool)

(assert (=> b!91910 (= c!15280 (not (= (bvand (extraKeys!2237 (_2!1145 lt!44647)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91911 () Bool)

(declare-fun res!46764 () Bool)

(assert (=> b!91911 (=> (not res!46764) (not e!59938))))

(assert (=> b!91911 (= res!46764 e!59947)))

(declare-fun c!15277 () Bool)

(assert (=> b!91911 (= c!15277 (not (= (bvand (extraKeys!2237 (_2!1145 lt!44647)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!9040 () Bool)

(declare-fun call!9042 () ListLongMap!1499)

(declare-fun call!9044 () ListLongMap!1499)

(assert (=> bm!9040 (= call!9042 call!9044)))

(declare-fun b!91912 () Bool)

(assert (=> b!91912 (= e!59943 call!9042)))

(declare-fun b!91913 () Bool)

(declare-fun e!59948 () Bool)

(assert (=> b!91913 (= e!59941 e!59948)))

(declare-fun res!46761 () Bool)

(assert (=> b!91913 (= res!46761 call!9045)))

(assert (=> b!91913 (=> (not res!46761) (not e!59948))))

(declare-fun b!91914 () Bool)

(assert (=> b!91914 (= e!59945 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000)))))

(declare-fun bm!9041 () Bool)

(assert (=> bm!9041 (= call!9044 call!9041)))

(declare-fun b!91915 () Bool)

(declare-fun lt!44973 () Unit!2720)

(assert (=> b!91915 (= e!59946 lt!44973)))

(declare-fun lt!44966 () ListLongMap!1499)

(assert (=> b!91915 (= lt!44966 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (_2!1145 lt!44647)) (_values!2389 (_2!1145 lt!44647)) (mask!6466 (_2!1145 lt!44647)) (extraKeys!2237 (_2!1145 lt!44647)) (zeroValue!2294 (_2!1145 lt!44647)) (minValue!2294 (_2!1145 lt!44647)) #b00000000000000000000000000000000 (defaultEntry!2406 (_2!1145 lt!44647))))))

(declare-fun lt!44980 () (_ BitVec 64))

(assert (=> b!91915 (= lt!44980 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44977 () (_ BitVec 64))

(assert (=> b!91915 (= lt!44977 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000))))

(declare-fun lt!44970 () Unit!2720)

(assert (=> b!91915 (= lt!44970 (addStillContains!63 lt!44966 lt!44980 (zeroValue!2294 (_2!1145 lt!44647)) lt!44977))))

(assert (=> b!91915 (contains!777 (+!127 lt!44966 (tuple2!2267 lt!44980 (zeroValue!2294 (_2!1145 lt!44647)))) lt!44977)))

(declare-fun lt!44963 () Unit!2720)

(assert (=> b!91915 (= lt!44963 lt!44970)))

(declare-fun lt!44979 () ListLongMap!1499)

(assert (=> b!91915 (= lt!44979 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (_2!1145 lt!44647)) (_values!2389 (_2!1145 lt!44647)) (mask!6466 (_2!1145 lt!44647)) (extraKeys!2237 (_2!1145 lt!44647)) (zeroValue!2294 (_2!1145 lt!44647)) (minValue!2294 (_2!1145 lt!44647)) #b00000000000000000000000000000000 (defaultEntry!2406 (_2!1145 lt!44647))))))

(declare-fun lt!44961 () (_ BitVec 64))

(assert (=> b!91915 (= lt!44961 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44981 () (_ BitVec 64))

(assert (=> b!91915 (= lt!44981 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000))))

(declare-fun lt!44967 () Unit!2720)

(assert (=> b!91915 (= lt!44967 (addApplyDifferent!63 lt!44979 lt!44961 (minValue!2294 (_2!1145 lt!44647)) lt!44981))))

(assert (=> b!91915 (= (apply!87 (+!127 lt!44979 (tuple2!2267 lt!44961 (minValue!2294 (_2!1145 lt!44647)))) lt!44981) (apply!87 lt!44979 lt!44981))))

(declare-fun lt!44960 () Unit!2720)

(assert (=> b!91915 (= lt!44960 lt!44967)))

(declare-fun lt!44974 () ListLongMap!1499)

(assert (=> b!91915 (= lt!44974 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (_2!1145 lt!44647)) (_values!2389 (_2!1145 lt!44647)) (mask!6466 (_2!1145 lt!44647)) (extraKeys!2237 (_2!1145 lt!44647)) (zeroValue!2294 (_2!1145 lt!44647)) (minValue!2294 (_2!1145 lt!44647)) #b00000000000000000000000000000000 (defaultEntry!2406 (_2!1145 lt!44647))))))

(declare-fun lt!44964 () (_ BitVec 64))

(assert (=> b!91915 (= lt!44964 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44968 () (_ BitVec 64))

(assert (=> b!91915 (= lt!44968 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000))))

(declare-fun lt!44965 () Unit!2720)

(assert (=> b!91915 (= lt!44965 (addApplyDifferent!63 lt!44974 lt!44964 (zeroValue!2294 (_2!1145 lt!44647)) lt!44968))))

(assert (=> b!91915 (= (apply!87 (+!127 lt!44974 (tuple2!2267 lt!44964 (zeroValue!2294 (_2!1145 lt!44647)))) lt!44968) (apply!87 lt!44974 lt!44968))))

(declare-fun lt!44962 () Unit!2720)

(assert (=> b!91915 (= lt!44962 lt!44965)))

(declare-fun lt!44972 () ListLongMap!1499)

(assert (=> b!91915 (= lt!44972 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (_2!1145 lt!44647)) (_values!2389 (_2!1145 lt!44647)) (mask!6466 (_2!1145 lt!44647)) (extraKeys!2237 (_2!1145 lt!44647)) (zeroValue!2294 (_2!1145 lt!44647)) (minValue!2294 (_2!1145 lt!44647)) #b00000000000000000000000000000000 (defaultEntry!2406 (_2!1145 lt!44647))))))

(declare-fun lt!44975 () (_ BitVec 64))

(assert (=> b!91915 (= lt!44975 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44971 () (_ BitVec 64))

(assert (=> b!91915 (= lt!44971 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000))))

(assert (=> b!91915 (= lt!44973 (addApplyDifferent!63 lt!44972 lt!44975 (minValue!2294 (_2!1145 lt!44647)) lt!44971))))

(assert (=> b!91915 (= (apply!87 (+!127 lt!44972 (tuple2!2267 lt!44975 (minValue!2294 (_2!1145 lt!44647)))) lt!44971) (apply!87 lt!44972 lt!44971))))

(declare-fun b!91916 () Bool)

(assert (=> b!91916 (= e!59943 call!9046)))

(declare-fun b!91917 () Bool)

(assert (=> b!91917 (= e!59939 e!59937)))

(declare-fun c!15279 () Bool)

(assert (=> b!91917 (= c!15279 (and (not (= (bvand (extraKeys!2237 (_2!1145 lt!44647)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2237 (_2!1145 lt!44647)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!9042 () Bool)

(assert (=> bm!9042 (= call!9045 (contains!777 lt!44976 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91918 () Bool)

(assert (=> b!91918 (= e!59948 (= (apply!87 lt!44976 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2294 (_2!1145 lt!44647))))))

(declare-fun b!91919 () Bool)

(declare-fun e!59942 () Bool)

(assert (=> b!91919 (= e!59940 e!59942)))

(declare-fun res!46759 () Bool)

(assert (=> b!91919 (=> (not res!46759) (not e!59942))))

(assert (=> b!91919 (= res!46759 (contains!777 lt!44976 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000)))))

(assert (=> b!91919 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 (_2!1145 lt!44647)))))))

(declare-fun b!91920 () Bool)

(assert (=> b!91920 (= e!59944 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000)))))

(declare-fun bm!9043 () Bool)

(assert (=> bm!9043 (= call!9040 (+!127 (ite c!15281 call!9041 (ite c!15279 call!9044 call!9042)) (ite (or c!15281 c!15279) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (_2!1145 lt!44647))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (_2!1145 lt!44647))))))))

(declare-fun b!91921 () Bool)

(assert (=> b!91921 (= e!59947 (not call!9043))))

(declare-fun b!91922 () Bool)

(assert (=> b!91922 (= e!59942 (= (apply!87 lt!44976 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000)) (get!1237 (select (arr!1968 (_values!2389 (_2!1145 lt!44647))) #b00000000000000000000000000000000) (dynLambda!354 (defaultEntry!2406 (_2!1145 lt!44647)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91922 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2215 (_values!2389 (_2!1145 lt!44647)))))))

(assert (=> b!91922 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 (_2!1145 lt!44647)))))))

(assert (= (and d!24171 c!15281) b!91907))

(assert (= (and d!24171 (not c!15281)) b!91917))

(assert (= (and b!91917 c!15279) b!91909))

(assert (= (and b!91917 (not c!15279)) b!91908))

(assert (= (and b!91908 c!15278) b!91916))

(assert (= (and b!91908 (not c!15278)) b!91912))

(assert (= (or b!91916 b!91912) bm!9040))

(assert (= (or b!91909 bm!9040) bm!9041))

(assert (= (or b!91909 b!91916) bm!9037))

(assert (= (or b!91907 bm!9041) bm!9038))

(assert (= (or b!91907 bm!9037) bm!9043))

(assert (= (and d!24171 res!46760) b!91920))

(assert (= (and d!24171 c!15276) b!91915))

(assert (= (and d!24171 (not c!15276)) b!91904))

(assert (= (and d!24171 res!46766) b!91906))

(assert (= (and b!91906 res!46762) b!91914))

(assert (= (and b!91906 (not res!46763)) b!91919))

(assert (= (and b!91919 res!46759) b!91922))

(assert (= (and b!91906 res!46767) b!91911))

(assert (= (and b!91911 c!15277) b!91902))

(assert (= (and b!91911 (not c!15277)) b!91921))

(assert (= (and b!91902 res!46765) b!91903))

(assert (= (or b!91902 b!91921) bm!9039))

(assert (= (and b!91911 res!46764) b!91910))

(assert (= (and b!91910 c!15280) b!91913))

(assert (= (and b!91910 (not c!15280)) b!91905))

(assert (= (and b!91913 res!46761) b!91918))

(assert (= (or b!91913 b!91905) bm!9042))

(declare-fun b_lambda!4059 () Bool)

(assert (=> (not b_lambda!4059) (not b!91922)))

(declare-fun tb!1809 () Bool)

(declare-fun t!5393 () Bool)

(assert (=> (and b!91491 (= (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) (defaultEntry!2406 (_2!1145 lt!44647))) t!5393) tb!1809))

(declare-fun result!3097 () Bool)

(assert (=> tb!1809 (= result!3097 tp_is_empty!2583)))

(assert (=> b!91922 t!5393))

(declare-fun b_and!5579 () Bool)

(assert (= b_and!5575 (and (=> t!5393 result!3097) b_and!5579)))

(declare-fun t!5395 () Bool)

(declare-fun tb!1811 () Bool)

(assert (=> (and b!91496 (= (defaultEntry!2406 newMap!16) (defaultEntry!2406 (_2!1145 lt!44647))) t!5395) tb!1811))

(declare-fun result!3099 () Bool)

(assert (= result!3099 result!3097))

(assert (=> b!91922 t!5395))

(declare-fun b_and!5581 () Bool)

(assert (= b_and!5577 (and (=> t!5395 result!3099) b_and!5581)))

(declare-fun m!98775 () Bool)

(assert (=> d!24171 m!98775))

(declare-fun m!98777 () Bool)

(assert (=> b!91907 m!98777))

(declare-fun m!98779 () Bool)

(assert (=> b!91914 m!98779))

(assert (=> b!91914 m!98779))

(declare-fun m!98781 () Bool)

(assert (=> b!91914 m!98781))

(declare-fun m!98783 () Bool)

(assert (=> bm!9042 m!98783))

(declare-fun m!98785 () Bool)

(assert (=> b!91915 m!98785))

(declare-fun m!98787 () Bool)

(assert (=> b!91915 m!98787))

(assert (=> b!91915 m!98787))

(declare-fun m!98789 () Bool)

(assert (=> b!91915 m!98789))

(declare-fun m!98791 () Bool)

(assert (=> b!91915 m!98791))

(declare-fun m!98793 () Bool)

(assert (=> b!91915 m!98793))

(declare-fun m!98795 () Bool)

(assert (=> b!91915 m!98795))

(declare-fun m!98797 () Bool)

(assert (=> b!91915 m!98797))

(assert (=> b!91915 m!98795))

(declare-fun m!98799 () Bool)

(assert (=> b!91915 m!98799))

(declare-fun m!98801 () Bool)

(assert (=> b!91915 m!98801))

(declare-fun m!98803 () Bool)

(assert (=> b!91915 m!98803))

(assert (=> b!91915 m!98791))

(declare-fun m!98805 () Bool)

(assert (=> b!91915 m!98805))

(declare-fun m!98807 () Bool)

(assert (=> b!91915 m!98807))

(declare-fun m!98809 () Bool)

(assert (=> b!91915 m!98809))

(assert (=> b!91915 m!98807))

(declare-fun m!98811 () Bool)

(assert (=> b!91915 m!98811))

(assert (=> b!91915 m!98779))

(declare-fun m!98813 () Bool)

(assert (=> b!91915 m!98813))

(declare-fun m!98815 () Bool)

(assert (=> b!91915 m!98815))

(assert (=> b!91920 m!98779))

(assert (=> b!91920 m!98779))

(assert (=> b!91920 m!98781))

(assert (=> b!91919 m!98779))

(assert (=> b!91919 m!98779))

(declare-fun m!98817 () Bool)

(assert (=> b!91919 m!98817))

(declare-fun m!98819 () Bool)

(assert (=> bm!9039 m!98819))

(declare-fun m!98821 () Bool)

(assert (=> b!91918 m!98821))

(declare-fun m!98823 () Bool)

(assert (=> b!91922 m!98823))

(declare-fun m!98825 () Bool)

(assert (=> b!91922 m!98825))

(assert (=> b!91922 m!98779))

(declare-fun m!98827 () Bool)

(assert (=> b!91922 m!98827))

(assert (=> b!91922 m!98779))

(assert (=> b!91922 m!98825))

(assert (=> b!91922 m!98823))

(declare-fun m!98829 () Bool)

(assert (=> b!91922 m!98829))

(declare-fun m!98831 () Bool)

(assert (=> bm!9043 m!98831))

(assert (=> bm!9038 m!98797))

(declare-fun m!98833 () Bool)

(assert (=> b!91903 m!98833))

(assert (=> d!24147 d!24171))

(declare-fun d!24173 () Bool)

(declare-fun lt!44984 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!95 (List!1552) (InoxSet tuple2!2266))

(assert (=> d!24173 (= lt!44984 (select (content!95 (toList!765 lt!44730)) lt!44651))))

(declare-fun e!59953 () Bool)

(assert (=> d!24173 (= lt!44984 e!59953)))

(declare-fun res!46772 () Bool)

(assert (=> d!24173 (=> (not res!46772) (not e!59953))))

(assert (=> d!24173 (= res!46772 ((_ is Cons!1548) (toList!765 lt!44730)))))

(assert (=> d!24173 (= (contains!780 (toList!765 lt!44730) lt!44651) lt!44984)))

(declare-fun b!91927 () Bool)

(declare-fun e!59954 () Bool)

(assert (=> b!91927 (= e!59953 e!59954)))

(declare-fun res!46773 () Bool)

(assert (=> b!91927 (=> res!46773 e!59954)))

(assert (=> b!91927 (= res!46773 (= (h!2140 (toList!765 lt!44730)) lt!44651))))

(declare-fun b!91928 () Bool)

(assert (=> b!91928 (= e!59954 (contains!780 (t!5386 (toList!765 lt!44730)) lt!44651))))

(assert (= (and d!24173 res!46772) b!91927))

(assert (= (and b!91927 (not res!46773)) b!91928))

(declare-fun m!98835 () Bool)

(assert (=> d!24173 m!98835))

(declare-fun m!98837 () Bool)

(assert (=> d!24173 m!98837))

(declare-fun m!98839 () Bool)

(assert (=> b!91928 m!98839))

(assert (=> b!91617 d!24173))

(declare-fun d!24175 () Bool)

(declare-fun e!59955 () Bool)

(assert (=> d!24175 e!59955))

(declare-fun res!46774 () Bool)

(assert (=> d!24175 (=> (not res!46774) (not e!59955))))

(declare-fun lt!44985 () ListLongMap!1499)

(assert (=> d!24175 (= res!46774 (contains!777 lt!44985 (_1!1144 (ite (or c!15230 c!15228) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun lt!44987 () List!1552)

(assert (=> d!24175 (= lt!44985 (ListLongMap!1500 lt!44987))))

(declare-fun lt!44986 () Unit!2720)

(declare-fun lt!44988 () Unit!2720)

(assert (=> d!24175 (= lt!44986 lt!44988)))

(assert (=> d!24175 (= (getValueByKey!145 lt!44987 (_1!1144 (ite (or c!15230 c!15228) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))) (Some!150 (_2!1144 (ite (or c!15230 c!15228) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(assert (=> d!24175 (= lt!44988 (lemmaContainsTupThenGetReturnValue!62 lt!44987 (_1!1144 (ite (or c!15230 c!15228) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (_2!1144 (ite (or c!15230 c!15228) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(assert (=> d!24175 (= lt!44987 (insertStrictlySorted!65 (toList!765 (ite c!15230 call!8962 (ite c!15228 call!8965 call!8963))) (_1!1144 (ite (or c!15230 c!15228) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (_2!1144 (ite (or c!15230 c!15228) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(assert (=> d!24175 (= (+!127 (ite c!15230 call!8962 (ite c!15228 call!8965 call!8963)) (ite (or c!15230 c!15228) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!44985)))

(declare-fun b!91929 () Bool)

(declare-fun res!46775 () Bool)

(assert (=> b!91929 (=> (not res!46775) (not e!59955))))

(assert (=> b!91929 (= res!46775 (= (getValueByKey!145 (toList!765 lt!44985) (_1!1144 (ite (or c!15230 c!15228) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))) (Some!150 (_2!1144 (ite (or c!15230 c!15228) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))))

(declare-fun b!91930 () Bool)

(assert (=> b!91930 (= e!59955 (contains!780 (toList!765 lt!44985) (ite (or c!15230 c!15228) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (= (and d!24175 res!46774) b!91929))

(assert (= (and b!91929 res!46775) b!91930))

(declare-fun m!98841 () Bool)

(assert (=> d!24175 m!98841))

(declare-fun m!98843 () Bool)

(assert (=> d!24175 m!98843))

(declare-fun m!98845 () Bool)

(assert (=> d!24175 m!98845))

(declare-fun m!98847 () Bool)

(assert (=> d!24175 m!98847))

(declare-fun m!98849 () Bool)

(assert (=> b!91929 m!98849))

(declare-fun m!98851 () Bool)

(assert (=> b!91930 m!98851))

(assert (=> bm!8964 d!24175))

(declare-fun b!91941 () Bool)

(declare-fun res!46784 () Bool)

(declare-fun e!59958 () Bool)

(assert (=> b!91941 (=> (not res!46784) (not e!59958))))

(declare-fun size!2218 (LongMapFixedSize!804) (_ BitVec 32))

(assert (=> b!91941 (= res!46784 (= (size!2218 newMap!16) (bvadd (_size!451 newMap!16) (bvsdiv (bvadd (extraKeys!2237 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!91940 () Bool)

(declare-fun res!46786 () Bool)

(assert (=> b!91940 (=> (not res!46786) (not e!59958))))

(assert (=> b!91940 (= res!46786 (bvsge (size!2218 newMap!16) (_size!451 newMap!16)))))

(declare-fun b!91939 () Bool)

(declare-fun res!46787 () Bool)

(assert (=> b!91939 (=> (not res!46787) (not e!59958))))

(assert (=> b!91939 (= res!46787 (and (= (size!2215 (_values!2389 newMap!16)) (bvadd (mask!6466 newMap!16) #b00000000000000000000000000000001)) (= (size!2214 (_keys!4086 newMap!16)) (size!2215 (_values!2389 newMap!16))) (bvsge (_size!451 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!451 newMap!16) (bvadd (mask!6466 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!91942 () Bool)

(assert (=> b!91942 (= e!59958 (and (bvsge (extraKeys!2237 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2237 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!451 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun d!24177 () Bool)

(declare-fun res!46785 () Bool)

(assert (=> d!24177 (=> (not res!46785) (not e!59958))))

(assert (=> d!24177 (= res!46785 (validMask!0 (mask!6466 newMap!16)))))

(assert (=> d!24177 (= (simpleValid!63 newMap!16) e!59958)))

(assert (= (and d!24177 res!46785) b!91939))

(assert (= (and b!91939 res!46787) b!91940))

(assert (= (and b!91940 res!46786) b!91941))

(assert (= (and b!91941 res!46784) b!91942))

(declare-fun m!98853 () Bool)

(assert (=> b!91941 m!98853))

(assert (=> b!91940 m!98853))

(declare-fun m!98855 () Bool)

(assert (=> d!24177 m!98855))

(assert (=> d!24161 d!24177))

(declare-fun d!24179 () Bool)

(declare-fun get!1240 (Option!151) V!3091)

(assert (=> d!24179 (= (apply!87 lt!44757 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1240 (getValueByKey!145 (toList!765 lt!44757) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3812 () Bool)

(assert (= bs!3812 d!24179))

(assert (=> bs!3812 m!98445))

(declare-fun m!98857 () Bool)

(assert (=> bs!3812 m!98857))

(assert (=> bs!3812 m!98857))

(declare-fun m!98859 () Bool)

(assert (=> bs!3812 m!98859))

(assert (=> b!91648 d!24179))

(declare-fun d!24181 () Bool)

(declare-fun c!15282 () Bool)

(assert (=> d!24181 (= c!15282 ((_ is ValueCellFull!948) (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!59959 () V!3091)

(assert (=> d!24181 (= (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!59959)))

(declare-fun b!91943 () Bool)

(assert (=> b!91943 (= e!59959 (get!1238 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91944 () Bool)

(assert (=> b!91944 (= e!59959 (get!1239 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24181 c!15282) b!91943))

(assert (= (and d!24181 (not c!15282)) b!91944))

(assert (=> b!91943 m!98505))

(assert (=> b!91943 m!98369))

(declare-fun m!98861 () Bool)

(assert (=> b!91943 m!98861))

(assert (=> b!91944 m!98505))

(assert (=> b!91944 m!98369))

(declare-fun m!98863 () Bool)

(assert (=> b!91944 m!98863))

(assert (=> b!91648 d!24181))

(declare-fun d!24183 () Bool)

(assert (=> d!24183 (= (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) (and (not (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91596 d!24183))

(declare-fun b!91957 () Bool)

(declare-fun e!59968 () SeekEntryResult!248)

(declare-fun lt!44995 () SeekEntryResult!248)

(assert (=> b!91957 (= e!59968 (Found!248 (index!3134 lt!44995)))))

(declare-fun e!59966 () SeekEntryResult!248)

(declare-fun b!91958 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4135 (_ BitVec 32)) SeekEntryResult!248)

(assert (=> b!91958 (= e!59966 (seekKeyOrZeroReturnVacant!0 (x!12447 lt!44995) (index!3134 lt!44995) (index!3134 lt!44995) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (_keys!4086 newMap!16) (mask!6466 newMap!16)))))

(declare-fun lt!44997 () SeekEntryResult!248)

(declare-fun d!24185 () Bool)

(assert (=> d!24185 (and (or ((_ is Undefined!248) lt!44997) (not ((_ is Found!248) lt!44997)) (and (bvsge (index!3133 lt!44997) #b00000000000000000000000000000000) (bvslt (index!3133 lt!44997) (size!2214 (_keys!4086 newMap!16))))) (or ((_ is Undefined!248) lt!44997) ((_ is Found!248) lt!44997) (not ((_ is MissingZero!248) lt!44997)) (and (bvsge (index!3132 lt!44997) #b00000000000000000000000000000000) (bvslt (index!3132 lt!44997) (size!2214 (_keys!4086 newMap!16))))) (or ((_ is Undefined!248) lt!44997) ((_ is Found!248) lt!44997) ((_ is MissingZero!248) lt!44997) (not ((_ is MissingVacant!248) lt!44997)) (and (bvsge (index!3135 lt!44997) #b00000000000000000000000000000000) (bvslt (index!3135 lt!44997) (size!2214 (_keys!4086 newMap!16))))) (or ((_ is Undefined!248) lt!44997) (ite ((_ is Found!248) lt!44997) (= (select (arr!1967 (_keys!4086 newMap!16)) (index!3133 lt!44997)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) (ite ((_ is MissingZero!248) lt!44997) (= (select (arr!1967 (_keys!4086 newMap!16)) (index!3132 lt!44997)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!248) lt!44997) (= (select (arr!1967 (_keys!4086 newMap!16)) (index!3135 lt!44997)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!59967 () SeekEntryResult!248)

(assert (=> d!24185 (= lt!44997 e!59967)))

(declare-fun c!15289 () Bool)

(assert (=> d!24185 (= c!15289 (and ((_ is Intermediate!248) lt!44995) (undefined!1060 lt!44995)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4135 (_ BitVec 32)) SeekEntryResult!248)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!24185 (= lt!44995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (mask!6466 newMap!16)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (_keys!4086 newMap!16) (mask!6466 newMap!16)))))

(assert (=> d!24185 (validMask!0 (mask!6466 newMap!16))))

(assert (=> d!24185 (= (seekEntryOrOpen!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (_keys!4086 newMap!16) (mask!6466 newMap!16)) lt!44997)))

(declare-fun b!91959 () Bool)

(assert (=> b!91959 (= e!59967 Undefined!248)))

(declare-fun b!91960 () Bool)

(assert (=> b!91960 (= e!59967 e!59968)))

(declare-fun lt!44996 () (_ BitVec 64))

(assert (=> b!91960 (= lt!44996 (select (arr!1967 (_keys!4086 newMap!16)) (index!3134 lt!44995)))))

(declare-fun c!15290 () Bool)

(assert (=> b!91960 (= c!15290 (= lt!44996 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun b!91961 () Bool)

(assert (=> b!91961 (= e!59966 (MissingZero!248 (index!3134 lt!44995)))))

(declare-fun b!91962 () Bool)

(declare-fun c!15291 () Bool)

(assert (=> b!91962 (= c!15291 (= lt!44996 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91962 (= e!59968 e!59966)))

(assert (= (and d!24185 c!15289) b!91959))

(assert (= (and d!24185 (not c!15289)) b!91960))

(assert (= (and b!91960 c!15290) b!91957))

(assert (= (and b!91960 (not c!15290)) b!91962))

(assert (= (and b!91962 c!15291) b!91961))

(assert (= (and b!91962 (not c!15291)) b!91958))

(assert (=> b!91958 m!98305))

(declare-fun m!98865 () Bool)

(assert (=> b!91958 m!98865))

(declare-fun m!98867 () Bool)

(assert (=> d!24185 m!98867))

(assert (=> d!24185 m!98305))

(declare-fun m!98869 () Bool)

(assert (=> d!24185 m!98869))

(declare-fun m!98871 () Bool)

(assert (=> d!24185 m!98871))

(assert (=> d!24185 m!98855))

(declare-fun m!98873 () Bool)

(assert (=> d!24185 m!98873))

(declare-fun m!98875 () Bool)

(assert (=> d!24185 m!98875))

(assert (=> d!24185 m!98305))

(assert (=> d!24185 m!98867))

(declare-fun m!98877 () Bool)

(assert (=> b!91960 m!98877))

(assert (=> b!91859 d!24185))

(declare-fun d!24187 () Bool)

(declare-fun e!59969 () Bool)

(assert (=> d!24187 e!59969))

(declare-fun res!46788 () Bool)

(assert (=> d!24187 (=> (not res!46788) (not e!59969))))

(declare-fun lt!44998 () ListLongMap!1499)

(assert (=> d!24187 (= res!46788 (contains!777 lt!44998 (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun lt!45000 () List!1552)

(assert (=> d!24187 (= lt!44998 (ListLongMap!1500 lt!45000))))

(declare-fun lt!44999 () Unit!2720)

(declare-fun lt!45001 () Unit!2720)

(assert (=> d!24187 (= lt!44999 lt!45001)))

(assert (=> d!24187 (= (getValueByKey!145 lt!45000 (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24187 (= lt!45001 (lemmaContainsTupThenGetReturnValue!62 lt!45000 (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24187 (= lt!45000 (insertStrictlySorted!65 (toList!765 call!8961) (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24187 (= (+!127 call!8961 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44998)))

(declare-fun b!91963 () Bool)

(declare-fun res!46789 () Bool)

(assert (=> b!91963 (=> (not res!46789) (not e!59969))))

(assert (=> b!91963 (= res!46789 (= (getValueByKey!145 (toList!765 lt!44998) (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun b!91964 () Bool)

(assert (=> b!91964 (= e!59969 (contains!780 (toList!765 lt!44998) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24187 res!46788) b!91963))

(assert (= (and b!91963 res!46789) b!91964))

(declare-fun m!98879 () Bool)

(assert (=> d!24187 m!98879))

(declare-fun m!98881 () Bool)

(assert (=> d!24187 m!98881))

(declare-fun m!98883 () Bool)

(assert (=> d!24187 m!98883))

(declare-fun m!98885 () Bool)

(assert (=> d!24187 m!98885))

(declare-fun m!98887 () Bool)

(assert (=> b!91963 m!98887))

(declare-fun m!98889 () Bool)

(assert (=> b!91964 m!98889))

(assert (=> b!91741 d!24187))

(declare-fun d!24189 () Bool)

(assert (=> d!24189 (= (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91652 d!24189))

(declare-fun d!24191 () Bool)

(declare-fun e!59970 () Bool)

(assert (=> d!24191 e!59970))

(declare-fun res!46790 () Bool)

(assert (=> d!24191 (=> (not res!46790) (not e!59970))))

(declare-fun lt!45002 () ListLongMap!1499)

(assert (=> d!24191 (= res!46790 (contains!777 lt!45002 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(declare-fun lt!45004 () List!1552)

(assert (=> d!24191 (= lt!45002 (ListLongMap!1500 lt!45004))))

(declare-fun lt!45003 () Unit!2720)

(declare-fun lt!45005 () Unit!2720)

(assert (=> d!24191 (= lt!45003 lt!45005)))

(assert (=> d!24191 (= (getValueByKey!145 lt!45004 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))) (Some!150 (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (=> d!24191 (= lt!45005 (lemmaContainsTupThenGetReturnValue!62 lt!45004 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (=> d!24191 (= lt!45004 (insertStrictlySorted!65 (toList!765 call!9021) (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (=> d!24191 (= (+!127 call!9021 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) lt!45002)))

(declare-fun b!91965 () Bool)

(declare-fun res!46791 () Bool)

(assert (=> b!91965 (=> (not res!46791) (not e!59970))))

(assert (=> b!91965 (= res!46791 (= (getValueByKey!145 (toList!765 lt!45002) (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))) (Some!150 (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))))

(declare-fun b!91966 () Bool)

(assert (=> b!91966 (= e!59970 (contains!780 (toList!765 lt!45002) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))

(assert (= (and d!24191 res!46790) b!91965))

(assert (= (and b!91965 res!46791) b!91966))

(declare-fun m!98891 () Bool)

(assert (=> d!24191 m!98891))

(declare-fun m!98893 () Bool)

(assert (=> d!24191 m!98893))

(declare-fun m!98895 () Bool)

(assert (=> d!24191 m!98895))

(declare-fun m!98897 () Bool)

(assert (=> d!24191 m!98897))

(declare-fun m!98899 () Bool)

(assert (=> b!91965 m!98899))

(declare-fun m!98901 () Bool)

(assert (=> b!91966 m!98901))

(assert (=> b!91889 d!24191))

(declare-fun b!91967 () Bool)

(declare-fun res!46794 () Bool)

(declare-fun e!59971 () Bool)

(assert (=> b!91967 (=> (not res!46794) (not e!59971))))

(declare-fun lt!45012 () ListLongMap!1499)

(assert (=> b!91967 (= res!46794 (not (contains!777 lt!45012 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91968 () Bool)

(declare-fun e!59972 () Bool)

(declare-fun e!59974 () Bool)

(assert (=> b!91968 (= e!59972 e!59974)))

(assert (=> b!91968 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun res!46792 () Bool)

(assert (=> b!91968 (= res!46792 (contains!777 lt!45012 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> b!91968 (=> (not res!46792) (not e!59974))))

(declare-fun bm!9044 () Bool)

(declare-fun call!9047 () ListLongMap!1499)

(assert (=> bm!9044 (= call!9047 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun e!59975 () Bool)

(declare-fun b!91969 () Bool)

(assert (=> b!91969 (= e!59975 (= lt!45012 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!91970 () Bool)

(declare-fun e!59977 () ListLongMap!1499)

(assert (=> b!91970 (= e!59977 (ListLongMap!1500 Nil!1549))))

(declare-fun b!91971 () Bool)

(assert (=> b!91971 (= e!59972 e!59975)))

(declare-fun c!15295 () Bool)

(assert (=> b!91971 (= c!15295 (bvslt from!355 (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!91972 () Bool)

(assert (=> b!91972 (= e!59975 (isEmpty!346 lt!45012))))

(declare-fun d!24193 () Bool)

(assert (=> d!24193 e!59971))

(declare-fun res!46795 () Bool)

(assert (=> d!24193 (=> (not res!46795) (not e!59971))))

(assert (=> d!24193 (= res!46795 (not (contains!777 lt!45012 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24193 (= lt!45012 e!59977)))

(declare-fun c!15294 () Bool)

(assert (=> d!24193 (= c!15294 (bvsge from!355 (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(assert (=> d!24193 (validMask!0 (mask!6466 (v!2721 (underlying!313 thiss!992))))))

(assert (=> d!24193 (= (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) from!355 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))) lt!45012)))

(declare-fun b!91973 () Bool)

(assert (=> b!91973 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(assert (=> b!91973 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2215 (_values!2389 (v!2721 (underlying!313 thiss!992))))))))

(assert (=> b!91973 (= e!59974 (= (apply!87 lt!45012 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) from!355) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!91974 () Bool)

(declare-fun e!59973 () Bool)

(assert (=> b!91974 (= e!59973 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> b!91974 (bvsge from!355 #b00000000000000000000000000000000)))

(declare-fun b!91975 () Bool)

(assert (=> b!91975 (= e!59971 e!59972)))

(declare-fun c!15292 () Bool)

(assert (=> b!91975 (= c!15292 e!59973)))

(declare-fun res!46793 () Bool)

(assert (=> b!91975 (=> (not res!46793) (not e!59973))))

(assert (=> b!91975 (= res!46793 (bvslt from!355 (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!91976 () Bool)

(declare-fun e!59976 () ListLongMap!1499)

(assert (=> b!91976 (= e!59976 call!9047)))

(declare-fun b!91977 () Bool)

(assert (=> b!91977 (= e!59977 e!59976)))

(declare-fun c!15293 () Bool)

(assert (=> b!91977 (= c!15293 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun b!91978 () Bool)

(declare-fun lt!45008 () Unit!2720)

(declare-fun lt!45006 () Unit!2720)

(assert (=> b!91978 (= lt!45008 lt!45006)))

(declare-fun lt!45007 () ListLongMap!1499)

(declare-fun lt!45009 () (_ BitVec 64))

(declare-fun lt!45010 () (_ BitVec 64))

(declare-fun lt!45011 () V!3091)

(assert (=> b!91978 (not (contains!777 (+!127 lt!45007 (tuple2!2267 lt!45010 lt!45011)) lt!45009))))

(assert (=> b!91978 (= lt!45006 (addStillNotContains!36 lt!45007 lt!45010 lt!45011 lt!45009))))

(assert (=> b!91978 (= lt!45009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!91978 (= lt!45011 (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) from!355) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!91978 (= lt!45010 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))))

(assert (=> b!91978 (= lt!45007 call!9047)))

(assert (=> b!91978 (= e!59976 (+!127 call!9047 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) from!355) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!24193 c!15294) b!91970))

(assert (= (and d!24193 (not c!15294)) b!91977))

(assert (= (and b!91977 c!15293) b!91978))

(assert (= (and b!91977 (not c!15293)) b!91976))

(assert (= (or b!91978 b!91976) bm!9044))

(assert (= (and d!24193 res!46795) b!91967))

(assert (= (and b!91967 res!46794) b!91975))

(assert (= (and b!91975 res!46793) b!91974))

(assert (= (and b!91975 c!15292) b!91968))

(assert (= (and b!91975 (not c!15292)) b!91971))

(assert (= (and b!91968 res!46792) b!91973))

(assert (= (and b!91971 c!15295) b!91969))

(assert (= (and b!91971 (not c!15295)) b!91972))

(declare-fun b_lambda!4061 () Bool)

(assert (=> (not b_lambda!4061) (not b!91973)))

(assert (=> b!91973 t!5382))

(declare-fun b_and!5583 () Bool)

(assert (= b_and!5579 (and (=> t!5382 result!3083) b_and!5583)))

(assert (=> b!91973 t!5384))

(declare-fun b_and!5585 () Bool)

(assert (= b_and!5581 (and (=> t!5384 result!3087) b_and!5585)))

(declare-fun b_lambda!4063 () Bool)

(assert (=> (not b_lambda!4063) (not b!91978)))

(assert (=> b!91978 t!5382))

(declare-fun b_and!5587 () Bool)

(assert (= b_and!5583 (and (=> t!5382 result!3083) b_and!5587)))

(assert (=> b!91978 t!5384))

(declare-fun b_and!5589 () Bool)

(assert (= b_and!5585 (and (=> t!5384 result!3087) b_and!5589)))

(declare-fun m!98903 () Bool)

(assert (=> b!91969 m!98903))

(declare-fun m!98905 () Bool)

(assert (=> d!24193 m!98905))

(assert (=> d!24193 m!98451))

(assert (=> b!91973 m!98367))

(assert (=> b!91973 m!98369))

(assert (=> b!91973 m!98305))

(assert (=> b!91973 m!98305))

(declare-fun m!98907 () Bool)

(assert (=> b!91973 m!98907))

(assert (=> b!91973 m!98367))

(assert (=> b!91973 m!98369))

(assert (=> b!91973 m!98371))

(declare-fun m!98909 () Bool)

(assert (=> b!91972 m!98909))

(assert (=> b!91974 m!98305))

(assert (=> b!91974 m!98305))

(assert (=> b!91974 m!98453))

(assert (=> b!91968 m!98305))

(assert (=> b!91968 m!98305))

(declare-fun m!98911 () Bool)

(assert (=> b!91968 m!98911))

(assert (=> b!91977 m!98305))

(assert (=> b!91977 m!98305))

(assert (=> b!91977 m!98453))

(assert (=> bm!9044 m!98903))

(assert (=> b!91978 m!98367))

(declare-fun m!98913 () Bool)

(assert (=> b!91978 m!98913))

(declare-fun m!98915 () Bool)

(assert (=> b!91978 m!98915))

(declare-fun m!98917 () Bool)

(assert (=> b!91978 m!98917))

(assert (=> b!91978 m!98369))

(assert (=> b!91978 m!98367))

(assert (=> b!91978 m!98369))

(assert (=> b!91978 m!98371))

(assert (=> b!91978 m!98913))

(assert (=> b!91978 m!98305))

(declare-fun m!98919 () Bool)

(assert (=> b!91978 m!98919))

(declare-fun m!98921 () Bool)

(assert (=> b!91967 m!98921))

(assert (=> b!91713 d!24193))

(declare-fun d!24195 () Bool)

(assert (=> d!24195 (= (apply!87 (+!127 lt!44830 (tuple2!2267 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44832) (get!1240 (getValueByKey!145 (toList!765 (+!127 lt!44830 (tuple2!2267 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!44832)))))

(declare-fun bs!3813 () Bool)

(assert (= bs!3813 d!24195))

(declare-fun m!98923 () Bool)

(assert (=> bs!3813 m!98923))

(assert (=> bs!3813 m!98923))

(declare-fun m!98925 () Bool)

(assert (=> bs!3813 m!98925))

(assert (=> b!91713 d!24195))

(declare-fun d!24197 () Bool)

(declare-fun e!59979 () Bool)

(assert (=> d!24197 e!59979))

(declare-fun res!46796 () Bool)

(assert (=> d!24197 (=> res!46796 e!59979)))

(declare-fun lt!45014 () Bool)

(assert (=> d!24197 (= res!46796 (not lt!45014))))

(declare-fun lt!45013 () Bool)

(assert (=> d!24197 (= lt!45014 lt!45013)))

(declare-fun lt!45016 () Unit!2720)

(declare-fun e!59978 () Unit!2720)

(assert (=> d!24197 (= lt!45016 e!59978)))

(declare-fun c!15296 () Bool)

(assert (=> d!24197 (= c!15296 lt!45013)))

(assert (=> d!24197 (= lt!45013 (containsKey!149 (toList!765 (+!127 lt!44817 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!44828))))

(assert (=> d!24197 (= (contains!777 (+!127 lt!44817 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44828) lt!45014)))

(declare-fun b!91979 () Bool)

(declare-fun lt!45015 () Unit!2720)

(assert (=> b!91979 (= e!59978 lt!45015)))

(assert (=> b!91979 (= lt!45015 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 (+!127 lt!44817 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!44828))))

(assert (=> b!91979 (isDefined!98 (getValueByKey!145 (toList!765 (+!127 lt!44817 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!44828))))

(declare-fun b!91980 () Bool)

(declare-fun Unit!2732 () Unit!2720)

(assert (=> b!91980 (= e!59978 Unit!2732)))

(declare-fun b!91981 () Bool)

(assert (=> b!91981 (= e!59979 (isDefined!98 (getValueByKey!145 (toList!765 (+!127 lt!44817 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!44828)))))

(assert (= (and d!24197 c!15296) b!91979))

(assert (= (and d!24197 (not c!15296)) b!91980))

(assert (= (and d!24197 (not res!46796)) b!91981))

(declare-fun m!98927 () Bool)

(assert (=> d!24197 m!98927))

(declare-fun m!98929 () Bool)

(assert (=> b!91979 m!98929))

(declare-fun m!98931 () Bool)

(assert (=> b!91979 m!98931))

(assert (=> b!91979 m!98931))

(declare-fun m!98933 () Bool)

(assert (=> b!91979 m!98933))

(assert (=> b!91981 m!98931))

(assert (=> b!91981 m!98931))

(assert (=> b!91981 m!98933))

(assert (=> b!91713 d!24197))

(declare-fun d!24199 () Bool)

(declare-fun e!59980 () Bool)

(assert (=> d!24199 e!59980))

(declare-fun res!46797 () Bool)

(assert (=> d!24199 (=> (not res!46797) (not e!59980))))

(declare-fun lt!45017 () ListLongMap!1499)

(assert (=> d!24199 (= res!46797 (contains!777 lt!45017 (_1!1144 (tuple2!2267 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun lt!45019 () List!1552)

(assert (=> d!24199 (= lt!45017 (ListLongMap!1500 lt!45019))))

(declare-fun lt!45018 () Unit!2720)

(declare-fun lt!45020 () Unit!2720)

(assert (=> d!24199 (= lt!45018 lt!45020)))

(assert (=> d!24199 (= (getValueByKey!145 lt!45019 (_1!1144 (tuple2!2267 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24199 (= lt!45020 (lemmaContainsTupThenGetReturnValue!62 lt!45019 (_1!1144 (tuple2!2267 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24199 (= lt!45019 (insertStrictlySorted!65 (toList!765 lt!44823) (_1!1144 (tuple2!2267 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24199 (= (+!127 lt!44823 (tuple2!2267 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!45017)))

(declare-fun b!91982 () Bool)

(declare-fun res!46798 () Bool)

(assert (=> b!91982 (=> (not res!46798) (not e!59980))))

(assert (=> b!91982 (= res!46798 (= (getValueByKey!145 (toList!765 lt!45017) (_1!1144 (tuple2!2267 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun b!91983 () Bool)

(assert (=> b!91983 (= e!59980 (contains!780 (toList!765 lt!45017) (tuple2!2267 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24199 res!46797) b!91982))

(assert (= (and b!91982 res!46798) b!91983))

(declare-fun m!98935 () Bool)

(assert (=> d!24199 m!98935))

(declare-fun m!98937 () Bool)

(assert (=> d!24199 m!98937))

(declare-fun m!98939 () Bool)

(assert (=> d!24199 m!98939))

(declare-fun m!98941 () Bool)

(assert (=> d!24199 m!98941))

(declare-fun m!98943 () Bool)

(assert (=> b!91982 m!98943))

(declare-fun m!98945 () Bool)

(assert (=> b!91983 m!98945))

(assert (=> b!91713 d!24199))

(declare-fun d!24201 () Bool)

(declare-fun e!59981 () Bool)

(assert (=> d!24201 e!59981))

(declare-fun res!46799 () Bool)

(assert (=> d!24201 (=> (not res!46799) (not e!59981))))

(declare-fun lt!45021 () ListLongMap!1499)

(assert (=> d!24201 (= res!46799 (contains!777 lt!45021 (_1!1144 (tuple2!2267 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun lt!45023 () List!1552)

(assert (=> d!24201 (= lt!45021 (ListLongMap!1500 lt!45023))))

(declare-fun lt!45022 () Unit!2720)

(declare-fun lt!45024 () Unit!2720)

(assert (=> d!24201 (= lt!45022 lt!45024)))

(assert (=> d!24201 (= (getValueByKey!145 lt!45023 (_1!1144 (tuple2!2267 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24201 (= lt!45024 (lemmaContainsTupThenGetReturnValue!62 lt!45023 (_1!1144 (tuple2!2267 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24201 (= lt!45023 (insertStrictlySorted!65 (toList!765 lt!44830) (_1!1144 (tuple2!2267 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24201 (= (+!127 lt!44830 (tuple2!2267 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!45021)))

(declare-fun b!91984 () Bool)

(declare-fun res!46800 () Bool)

(assert (=> b!91984 (=> (not res!46800) (not e!59981))))

(assert (=> b!91984 (= res!46800 (= (getValueByKey!145 (toList!765 lt!45021) (_1!1144 (tuple2!2267 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun b!91985 () Bool)

(assert (=> b!91985 (= e!59981 (contains!780 (toList!765 lt!45021) (tuple2!2267 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24201 res!46799) b!91984))

(assert (= (and b!91984 res!46800) b!91985))

(declare-fun m!98947 () Bool)

(assert (=> d!24201 m!98947))

(declare-fun m!98949 () Bool)

(assert (=> d!24201 m!98949))

(declare-fun m!98951 () Bool)

(assert (=> d!24201 m!98951))

(declare-fun m!98953 () Bool)

(assert (=> d!24201 m!98953))

(declare-fun m!98955 () Bool)

(assert (=> b!91984 m!98955))

(declare-fun m!98957 () Bool)

(assert (=> b!91985 m!98957))

(assert (=> b!91713 d!24201))

(declare-fun d!24203 () Bool)

(declare-fun e!59982 () Bool)

(assert (=> d!24203 e!59982))

(declare-fun res!46801 () Bool)

(assert (=> d!24203 (=> (not res!46801) (not e!59982))))

(declare-fun lt!45025 () ListLongMap!1499)

(assert (=> d!24203 (= res!46801 (contains!777 lt!45025 (_1!1144 (tuple2!2267 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun lt!45027 () List!1552)

(assert (=> d!24203 (= lt!45025 (ListLongMap!1500 lt!45027))))

(declare-fun lt!45026 () Unit!2720)

(declare-fun lt!45028 () Unit!2720)

(assert (=> d!24203 (= lt!45026 lt!45028)))

(assert (=> d!24203 (= (getValueByKey!145 lt!45027 (_1!1144 (tuple2!2267 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24203 (= lt!45028 (lemmaContainsTupThenGetReturnValue!62 lt!45027 (_1!1144 (tuple2!2267 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24203 (= lt!45027 (insertStrictlySorted!65 (toList!765 lt!44825) (_1!1144 (tuple2!2267 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24203 (= (+!127 lt!44825 (tuple2!2267 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!45025)))

(declare-fun b!91986 () Bool)

(declare-fun res!46802 () Bool)

(assert (=> b!91986 (=> (not res!46802) (not e!59982))))

(assert (=> b!91986 (= res!46802 (= (getValueByKey!145 (toList!765 lt!45025) (_1!1144 (tuple2!2267 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun b!91987 () Bool)

(assert (=> b!91987 (= e!59982 (contains!780 (toList!765 lt!45025) (tuple2!2267 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24203 res!46801) b!91986))

(assert (= (and b!91986 res!46802) b!91987))

(declare-fun m!98959 () Bool)

(assert (=> d!24203 m!98959))

(declare-fun m!98961 () Bool)

(assert (=> d!24203 m!98961))

(declare-fun m!98963 () Bool)

(assert (=> d!24203 m!98963))

(declare-fun m!98965 () Bool)

(assert (=> d!24203 m!98965))

(declare-fun m!98967 () Bool)

(assert (=> b!91986 m!98967))

(declare-fun m!98969 () Bool)

(assert (=> b!91987 m!98969))

(assert (=> b!91713 d!24203))

(declare-fun d!24205 () Bool)

(assert (=> d!24205 (= (apply!87 (+!127 lt!44823 (tuple2!2267 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44822) (apply!87 lt!44823 lt!44822))))

(declare-fun lt!45031 () Unit!2720)

(declare-fun choose!545 (ListLongMap!1499 (_ BitVec 64) V!3091 (_ BitVec 64)) Unit!2720)

(assert (=> d!24205 (= lt!45031 (choose!545 lt!44823 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44822))))

(declare-fun e!59985 () Bool)

(assert (=> d!24205 e!59985))

(declare-fun res!46805 () Bool)

(assert (=> d!24205 (=> (not res!46805) (not e!59985))))

(assert (=> d!24205 (= res!46805 (contains!777 lt!44823 lt!44822))))

(assert (=> d!24205 (= (addApplyDifferent!63 lt!44823 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44822) lt!45031)))

(declare-fun b!91991 () Bool)

(assert (=> b!91991 (= e!59985 (not (= lt!44822 lt!44826)))))

(assert (= (and d!24205 res!46805) b!91991))

(declare-fun m!98971 () Bool)

(assert (=> d!24205 m!98971))

(assert (=> d!24205 m!98573))

(declare-fun m!98973 () Bool)

(assert (=> d!24205 m!98973))

(assert (=> d!24205 m!98573))

(assert (=> d!24205 m!98575))

(assert (=> d!24205 m!98595))

(assert (=> b!91713 d!24205))

(declare-fun d!24207 () Bool)

(assert (=> d!24207 (= (apply!87 (+!127 lt!44825 (tuple2!2267 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44819) (apply!87 lt!44825 lt!44819))))

(declare-fun lt!45032 () Unit!2720)

(assert (=> d!24207 (= lt!45032 (choose!545 lt!44825 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44819))))

(declare-fun e!59986 () Bool)

(assert (=> d!24207 e!59986))

(declare-fun res!46806 () Bool)

(assert (=> d!24207 (=> (not res!46806) (not e!59986))))

(assert (=> d!24207 (= res!46806 (contains!777 lt!44825 lt!44819))))

(assert (=> d!24207 (= (addApplyDifferent!63 lt!44825 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44819) lt!45032)))

(declare-fun b!91992 () Bool)

(assert (=> b!91992 (= e!59986 (not (= lt!44819 lt!44815)))))

(assert (= (and d!24207 res!46806) b!91992))

(declare-fun m!98975 () Bool)

(assert (=> d!24207 m!98975))

(assert (=> d!24207 m!98569))

(declare-fun m!98977 () Bool)

(assert (=> d!24207 m!98977))

(assert (=> d!24207 m!98569))

(assert (=> d!24207 m!98571))

(assert (=> d!24207 m!98567))

(assert (=> b!91713 d!24207))

(declare-fun d!24209 () Bool)

(assert (=> d!24209 (= (apply!87 lt!44830 lt!44832) (get!1240 (getValueByKey!145 (toList!765 lt!44830) lt!44832)))))

(declare-fun bs!3814 () Bool)

(assert (= bs!3814 d!24209))

(declare-fun m!98979 () Bool)

(assert (=> bs!3814 m!98979))

(assert (=> bs!3814 m!98979))

(declare-fun m!98981 () Bool)

(assert (=> bs!3814 m!98981))

(assert (=> b!91713 d!24209))

(declare-fun d!24211 () Bool)

(assert (=> d!24211 (= (apply!87 lt!44823 lt!44822) (get!1240 (getValueByKey!145 (toList!765 lt!44823) lt!44822)))))

(declare-fun bs!3815 () Bool)

(assert (= bs!3815 d!24211))

(declare-fun m!98983 () Bool)

(assert (=> bs!3815 m!98983))

(assert (=> bs!3815 m!98983))

(declare-fun m!98985 () Bool)

(assert (=> bs!3815 m!98985))

(assert (=> b!91713 d!24211))

(declare-fun d!24213 () Bool)

(assert (=> d!24213 (= (apply!87 (+!127 lt!44830 (tuple2!2267 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44832) (apply!87 lt!44830 lt!44832))))

(declare-fun lt!45033 () Unit!2720)

(assert (=> d!24213 (= lt!45033 (choose!545 lt!44830 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44832))))

(declare-fun e!59987 () Bool)

(assert (=> d!24213 e!59987))

(declare-fun res!46807 () Bool)

(assert (=> d!24213 (=> (not res!46807) (not e!59987))))

(assert (=> d!24213 (= res!46807 (contains!777 lt!44830 lt!44832))))

(assert (=> d!24213 (= (addApplyDifferent!63 lt!44830 lt!44812 (minValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44832) lt!45033)))

(declare-fun b!91993 () Bool)

(assert (=> b!91993 (= e!59987 (not (= lt!44832 lt!44812)))))

(assert (= (and d!24213 res!46807) b!91993))

(declare-fun m!98987 () Bool)

(assert (=> d!24213 m!98987))

(assert (=> d!24213 m!98589))

(declare-fun m!98989 () Bool)

(assert (=> d!24213 m!98989))

(assert (=> d!24213 m!98589))

(assert (=> d!24213 m!98591))

(assert (=> d!24213 m!98597))

(assert (=> b!91713 d!24213))

(declare-fun d!24215 () Bool)

(assert (=> d!24215 (contains!777 (+!127 lt!44817 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44828)))

(declare-fun lt!45036 () Unit!2720)

(declare-fun choose!546 (ListLongMap!1499 (_ BitVec 64) V!3091 (_ BitVec 64)) Unit!2720)

(assert (=> d!24215 (= lt!45036 (choose!546 lt!44817 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44828))))

(assert (=> d!24215 (contains!777 lt!44817 lt!44828)))

(assert (=> d!24215 (= (addStillContains!63 lt!44817 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44828) lt!45036)))

(declare-fun bs!3816 () Bool)

(assert (= bs!3816 d!24215))

(assert (=> bs!3816 m!98577))

(assert (=> bs!3816 m!98577))

(assert (=> bs!3816 m!98581))

(declare-fun m!98991 () Bool)

(assert (=> bs!3816 m!98991))

(declare-fun m!98993 () Bool)

(assert (=> bs!3816 m!98993))

(assert (=> b!91713 d!24215))

(declare-fun d!24217 () Bool)

(assert (=> d!24217 (= (apply!87 lt!44825 lt!44819) (get!1240 (getValueByKey!145 (toList!765 lt!44825) lt!44819)))))

(declare-fun bs!3817 () Bool)

(assert (= bs!3817 d!24217))

(declare-fun m!98995 () Bool)

(assert (=> bs!3817 m!98995))

(assert (=> bs!3817 m!98995))

(declare-fun m!98997 () Bool)

(assert (=> bs!3817 m!98997))

(assert (=> b!91713 d!24217))

(declare-fun d!24219 () Bool)

(declare-fun e!59988 () Bool)

(assert (=> d!24219 e!59988))

(declare-fun res!46808 () Bool)

(assert (=> d!24219 (=> (not res!46808) (not e!59988))))

(declare-fun lt!45037 () ListLongMap!1499)

(assert (=> d!24219 (= res!46808 (contains!777 lt!45037 (_1!1144 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun lt!45039 () List!1552)

(assert (=> d!24219 (= lt!45037 (ListLongMap!1500 lt!45039))))

(declare-fun lt!45038 () Unit!2720)

(declare-fun lt!45040 () Unit!2720)

(assert (=> d!24219 (= lt!45038 lt!45040)))

(assert (=> d!24219 (= (getValueByKey!145 lt!45039 (_1!1144 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24219 (= lt!45040 (lemmaContainsTupThenGetReturnValue!62 lt!45039 (_1!1144 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24219 (= lt!45039 (insertStrictlySorted!65 (toList!765 lt!44817) (_1!1144 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24219 (= (+!127 lt!44817 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!45037)))

(declare-fun b!91995 () Bool)

(declare-fun res!46809 () Bool)

(assert (=> b!91995 (=> (not res!46809) (not e!59988))))

(assert (=> b!91995 (= res!46809 (= (getValueByKey!145 (toList!765 lt!45037) (_1!1144 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun b!91996 () Bool)

(assert (=> b!91996 (= e!59988 (contains!780 (toList!765 lt!45037) (tuple2!2267 lt!44831 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24219 res!46808) b!91995))

(assert (= (and b!91995 res!46809) b!91996))

(declare-fun m!98999 () Bool)

(assert (=> d!24219 m!98999))

(declare-fun m!99001 () Bool)

(assert (=> d!24219 m!99001))

(declare-fun m!99003 () Bool)

(assert (=> d!24219 m!99003))

(declare-fun m!99005 () Bool)

(assert (=> d!24219 m!99005))

(declare-fun m!99007 () Bool)

(assert (=> b!91995 m!99007))

(declare-fun m!99009 () Bool)

(assert (=> b!91996 m!99009))

(assert (=> b!91713 d!24219))

(declare-fun d!24221 () Bool)

(assert (=> d!24221 (= (apply!87 (+!127 lt!44825 (tuple2!2267 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44819) (get!1240 (getValueByKey!145 (toList!765 (+!127 lt!44825 (tuple2!2267 lt!44815 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!44819)))))

(declare-fun bs!3818 () Bool)

(assert (= bs!3818 d!24221))

(declare-fun m!99011 () Bool)

(assert (=> bs!3818 m!99011))

(assert (=> bs!3818 m!99011))

(declare-fun m!99013 () Bool)

(assert (=> bs!3818 m!99013))

(assert (=> b!91713 d!24221))

(declare-fun d!24223 () Bool)

(assert (=> d!24223 (= (apply!87 (+!127 lt!44823 (tuple2!2267 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44822) (get!1240 (getValueByKey!145 (toList!765 (+!127 lt!44823 (tuple2!2267 lt!44826 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!44822)))))

(declare-fun bs!3819 () Bool)

(assert (= bs!3819 d!24223))

(declare-fun m!99015 () Bool)

(assert (=> bs!3819 m!99015))

(assert (=> bs!3819 m!99015))

(declare-fun m!99017 () Bool)

(assert (=> bs!3819 m!99017))

(assert (=> b!91713 d!24223))

(declare-fun d!24225 () Bool)

(assert (=> d!24225 (= (validMask!0 (mask!6466 (v!2721 (underlying!313 thiss!992)))) (and (or (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000001111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000011111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000001111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000011111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000001111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000011111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000000001111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000000011111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000000111111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000001111111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000011111111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000000111111111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000001111111111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000011111111111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000000111111111111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000001111111111111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000011111111111111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000000111111111111111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000001111111111111111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000011111111111111111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00000111111111111111111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00001111111111111111111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00011111111111111111111111111111) (= (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6466 (v!2721 (underlying!313 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!24149 d!24225))

(declare-fun d!24227 () Bool)

(declare-fun e!59990 () Bool)

(assert (=> d!24227 e!59990))

(declare-fun res!46810 () Bool)

(assert (=> d!24227 (=> res!46810 e!59990)))

(declare-fun lt!45042 () Bool)

(assert (=> d!24227 (= res!46810 (not lt!45042))))

(declare-fun lt!45041 () Bool)

(assert (=> d!24227 (= lt!45042 lt!45041)))

(declare-fun lt!45044 () Unit!2720)

(declare-fun e!59989 () Unit!2720)

(assert (=> d!24227 (= lt!45044 e!59989)))

(declare-fun c!15297 () Bool)

(assert (=> d!24227 (= c!15297 lt!45041)))

(assert (=> d!24227 (= lt!45041 (containsKey!149 (toList!765 lt!44837) (_1!1144 lt!44651)))))

(assert (=> d!24227 (= (contains!777 lt!44837 (_1!1144 lt!44651)) lt!45042)))

(declare-fun b!91997 () Bool)

(declare-fun lt!45043 () Unit!2720)

(assert (=> b!91997 (= e!59989 lt!45043)))

(assert (=> b!91997 (= lt!45043 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44837) (_1!1144 lt!44651)))))

(assert (=> b!91997 (isDefined!98 (getValueByKey!145 (toList!765 lt!44837) (_1!1144 lt!44651)))))

(declare-fun b!91998 () Bool)

(declare-fun Unit!2733 () Unit!2720)

(assert (=> b!91998 (= e!59989 Unit!2733)))

(declare-fun b!91999 () Bool)

(assert (=> b!91999 (= e!59990 (isDefined!98 (getValueByKey!145 (toList!765 lt!44837) (_1!1144 lt!44651))))))

(assert (= (and d!24227 c!15297) b!91997))

(assert (= (and d!24227 (not c!15297)) b!91998))

(assert (= (and d!24227 (not res!46810)) b!91999))

(declare-fun m!99019 () Bool)

(assert (=> d!24227 m!99019))

(declare-fun m!99021 () Bool)

(assert (=> b!91997 m!99021))

(assert (=> b!91997 m!98631))

(assert (=> b!91997 m!98631))

(declare-fun m!99023 () Bool)

(assert (=> b!91997 m!99023))

(assert (=> b!91999 m!98631))

(assert (=> b!91999 m!98631))

(assert (=> b!91999 m!99023))

(assert (=> d!24153 d!24227))

(declare-fun b!92010 () Bool)

(declare-fun e!59996 () Option!151)

(assert (=> b!92010 (= e!59996 (getValueByKey!145 (t!5386 lt!44839) (_1!1144 lt!44651)))))

(declare-fun b!92009 () Bool)

(declare-fun e!59995 () Option!151)

(assert (=> b!92009 (= e!59995 e!59996)))

(declare-fun c!15303 () Bool)

(assert (=> b!92009 (= c!15303 (and ((_ is Cons!1548) lt!44839) (not (= (_1!1144 (h!2140 lt!44839)) (_1!1144 lt!44651)))))))

(declare-fun b!92011 () Bool)

(assert (=> b!92011 (= e!59996 None!149)))

(declare-fun b!92008 () Bool)

(assert (=> b!92008 (= e!59995 (Some!150 (_2!1144 (h!2140 lt!44839))))))

(declare-fun d!24229 () Bool)

(declare-fun c!15302 () Bool)

(assert (=> d!24229 (= c!15302 (and ((_ is Cons!1548) lt!44839) (= (_1!1144 (h!2140 lt!44839)) (_1!1144 lt!44651))))))

(assert (=> d!24229 (= (getValueByKey!145 lt!44839 (_1!1144 lt!44651)) e!59995)))

(assert (= (and d!24229 c!15302) b!92008))

(assert (= (and d!24229 (not c!15302)) b!92009))

(assert (= (and b!92009 c!15303) b!92010))

(assert (= (and b!92009 (not c!15303)) b!92011))

(declare-fun m!99025 () Bool)

(assert (=> b!92010 m!99025))

(assert (=> d!24153 d!24229))

(declare-fun d!24231 () Bool)

(assert (=> d!24231 (= (getValueByKey!145 lt!44839 (_1!1144 lt!44651)) (Some!150 (_2!1144 lt!44651)))))

(declare-fun lt!45047 () Unit!2720)

(declare-fun choose!547 (List!1552 (_ BitVec 64) V!3091) Unit!2720)

(assert (=> d!24231 (= lt!45047 (choose!547 lt!44839 (_1!1144 lt!44651) (_2!1144 lt!44651)))))

(declare-fun e!59999 () Bool)

(assert (=> d!24231 e!59999))

(declare-fun res!46815 () Bool)

(assert (=> d!24231 (=> (not res!46815) (not e!59999))))

(declare-fun isStrictlySorted!301 (List!1552) Bool)

(assert (=> d!24231 (= res!46815 (isStrictlySorted!301 lt!44839))))

(assert (=> d!24231 (= (lemmaContainsTupThenGetReturnValue!62 lt!44839 (_1!1144 lt!44651) (_2!1144 lt!44651)) lt!45047)))

(declare-fun b!92016 () Bool)

(declare-fun res!46816 () Bool)

(assert (=> b!92016 (=> (not res!46816) (not e!59999))))

(assert (=> b!92016 (= res!46816 (containsKey!149 lt!44839 (_1!1144 lt!44651)))))

(declare-fun b!92017 () Bool)

(assert (=> b!92017 (= e!59999 (contains!780 lt!44839 (tuple2!2267 (_1!1144 lt!44651) (_2!1144 lt!44651))))))

(assert (= (and d!24231 res!46815) b!92016))

(assert (= (and b!92016 res!46816) b!92017))

(assert (=> d!24231 m!98625))

(declare-fun m!99027 () Bool)

(assert (=> d!24231 m!99027))

(declare-fun m!99029 () Bool)

(assert (=> d!24231 m!99029))

(declare-fun m!99031 () Bool)

(assert (=> b!92016 m!99031))

(declare-fun m!99033 () Bool)

(assert (=> b!92017 m!99033))

(assert (=> d!24153 d!24231))

(declare-fun bm!9051 () Bool)

(declare-fun call!9054 () List!1552)

(declare-fun call!9056 () List!1552)

(assert (=> bm!9051 (= call!9054 call!9056)))

(declare-fun b!92038 () Bool)

(declare-fun res!46821 () Bool)

(declare-fun e!60010 () Bool)

(assert (=> b!92038 (=> (not res!46821) (not e!60010))))

(declare-fun lt!45050 () List!1552)

(assert (=> b!92038 (= res!46821 (containsKey!149 lt!45050 (_1!1144 lt!44651)))))

(declare-fun b!92039 () Bool)

(declare-fun e!60011 () List!1552)

(assert (=> b!92039 (= e!60011 call!9056)))

(declare-fun b!92040 () Bool)

(assert (=> b!92040 (= e!60010 (contains!780 lt!45050 (tuple2!2267 (_1!1144 lt!44651) (_2!1144 lt!44651))))))

(declare-fun b!92041 () Bool)

(declare-fun e!60014 () List!1552)

(assert (=> b!92041 (= e!60014 (insertStrictlySorted!65 (t!5386 (toList!765 lt!44652)) (_1!1144 lt!44651) (_2!1144 lt!44651)))))

(declare-fun bm!9052 () Bool)

(declare-fun call!9055 () List!1552)

(assert (=> bm!9052 (= call!9056 call!9055)))

(declare-fun b!92043 () Bool)

(declare-fun e!60012 () List!1552)

(assert (=> b!92043 (= e!60012 e!60011)))

(declare-fun c!15312 () Bool)

(assert (=> b!92043 (= c!15312 (and ((_ is Cons!1548) (toList!765 lt!44652)) (= (_1!1144 (h!2140 (toList!765 lt!44652))) (_1!1144 lt!44651))))))

(declare-fun b!92044 () Bool)

(assert (=> b!92044 (= e!60012 call!9055)))

(declare-fun b!92045 () Bool)

(declare-fun c!15314 () Bool)

(assert (=> b!92045 (= c!15314 (and ((_ is Cons!1548) (toList!765 lt!44652)) (bvsgt (_1!1144 (h!2140 (toList!765 lt!44652))) (_1!1144 lt!44651))))))

(declare-fun e!60013 () List!1552)

(assert (=> b!92045 (= e!60011 e!60013)))

(declare-fun b!92046 () Bool)

(assert (=> b!92046 (= e!60014 (ite c!15312 (t!5386 (toList!765 lt!44652)) (ite c!15314 (Cons!1548 (h!2140 (toList!765 lt!44652)) (t!5386 (toList!765 lt!44652))) Nil!1549)))))

(declare-fun bm!9053 () Bool)

(declare-fun c!15313 () Bool)

(declare-fun $colon$colon!75 (List!1552 tuple2!2266) List!1552)

(assert (=> bm!9053 (= call!9055 ($colon$colon!75 e!60014 (ite c!15313 (h!2140 (toList!765 lt!44652)) (tuple2!2267 (_1!1144 lt!44651) (_2!1144 lt!44651)))))))

(declare-fun c!15315 () Bool)

(assert (=> bm!9053 (= c!15315 c!15313)))

(declare-fun b!92047 () Bool)

(assert (=> b!92047 (= e!60013 call!9054)))

(declare-fun d!24233 () Bool)

(assert (=> d!24233 e!60010))

(declare-fun res!46822 () Bool)

(assert (=> d!24233 (=> (not res!46822) (not e!60010))))

(assert (=> d!24233 (= res!46822 (isStrictlySorted!301 lt!45050))))

(assert (=> d!24233 (= lt!45050 e!60012)))

(assert (=> d!24233 (= c!15313 (and ((_ is Cons!1548) (toList!765 lt!44652)) (bvslt (_1!1144 (h!2140 (toList!765 lt!44652))) (_1!1144 lt!44651))))))

(assert (=> d!24233 (isStrictlySorted!301 (toList!765 lt!44652))))

(assert (=> d!24233 (= (insertStrictlySorted!65 (toList!765 lt!44652) (_1!1144 lt!44651) (_2!1144 lt!44651)) lt!45050)))

(declare-fun b!92042 () Bool)

(assert (=> b!92042 (= e!60013 call!9054)))

(assert (= (and d!24233 c!15313) b!92044))

(assert (= (and d!24233 (not c!15313)) b!92043))

(assert (= (and b!92043 c!15312) b!92039))

(assert (= (and b!92043 (not c!15312)) b!92045))

(assert (= (and b!92045 c!15314) b!92042))

(assert (= (and b!92045 (not c!15314)) b!92047))

(assert (= (or b!92042 b!92047) bm!9051))

(assert (= (or b!92039 bm!9051) bm!9052))

(assert (= (or b!92044 bm!9052) bm!9053))

(assert (= (and bm!9053 c!15315) b!92041))

(assert (= (and bm!9053 (not c!15315)) b!92046))

(assert (= (and d!24233 res!46822) b!92038))

(assert (= (and b!92038 res!46821) b!92040))

(declare-fun m!99035 () Bool)

(assert (=> b!92038 m!99035))

(declare-fun m!99037 () Bool)

(assert (=> b!92041 m!99037))

(declare-fun m!99039 () Bool)

(assert (=> bm!9053 m!99039))

(declare-fun m!99041 () Bool)

(assert (=> b!92040 m!99041))

(declare-fun m!99043 () Bool)

(assert (=> d!24233 m!99043))

(declare-fun m!99045 () Bool)

(assert (=> d!24233 m!99045))

(assert (=> d!24153 d!24233))

(declare-fun d!24235 () Bool)

(assert (=> d!24235 (= (apply!87 lt!44827 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1240 (getValueByKey!145 (toList!765 lt!44827) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3820 () Bool)

(assert (= bs!3820 d!24235))

(declare-fun m!99047 () Bool)

(assert (=> bs!3820 m!99047))

(assert (=> bs!3820 m!99047))

(declare-fun m!99049 () Bool)

(assert (=> bs!3820 m!99049))

(assert (=> b!91716 d!24235))

(declare-fun d!24237 () Bool)

(assert (=> d!24237 (= (apply!87 lt!44827 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1240 (getValueByKey!145 (toList!765 lt!44827) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3821 () Bool)

(assert (= bs!3821 d!24237))

(declare-fun m!99051 () Bool)

(assert (=> bs!3821 m!99051))

(assert (=> bs!3821 m!99051))

(declare-fun m!99053 () Bool)

(assert (=> bs!3821 m!99053))

(assert (=> b!91701 d!24237))

(declare-fun d!24239 () Bool)

(declare-fun e!60016 () Bool)

(assert (=> d!24239 e!60016))

(declare-fun res!46823 () Bool)

(assert (=> d!24239 (=> res!46823 e!60016)))

(declare-fun lt!45052 () Bool)

(assert (=> d!24239 (= res!46823 (not lt!45052))))

(declare-fun lt!45051 () Bool)

(assert (=> d!24239 (= lt!45052 lt!45051)))

(declare-fun lt!45054 () Unit!2720)

(declare-fun e!60015 () Unit!2720)

(assert (=> d!24239 (= lt!45054 e!60015)))

(declare-fun c!15316 () Bool)

(assert (=> d!24239 (= c!15316 lt!45051)))

(assert (=> d!24239 (= lt!45051 (containsKey!149 (toList!765 lt!44730) (_1!1144 lt!44651)))))

(assert (=> d!24239 (= (contains!777 lt!44730 (_1!1144 lt!44651)) lt!45052)))

(declare-fun b!92048 () Bool)

(declare-fun lt!45053 () Unit!2720)

(assert (=> b!92048 (= e!60015 lt!45053)))

(assert (=> b!92048 (= lt!45053 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44730) (_1!1144 lt!44651)))))

(assert (=> b!92048 (isDefined!98 (getValueByKey!145 (toList!765 lt!44730) (_1!1144 lt!44651)))))

(declare-fun b!92049 () Bool)

(declare-fun Unit!2734 () Unit!2720)

(assert (=> b!92049 (= e!60015 Unit!2734)))

(declare-fun b!92050 () Bool)

(assert (=> b!92050 (= e!60016 (isDefined!98 (getValueByKey!145 (toList!765 lt!44730) (_1!1144 lt!44651))))))

(assert (= (and d!24239 c!15316) b!92048))

(assert (= (and d!24239 (not c!15316)) b!92049))

(assert (= (and d!24239 (not res!46823)) b!92050))

(declare-fun m!99055 () Bool)

(assert (=> d!24239 m!99055))

(declare-fun m!99057 () Bool)

(assert (=> b!92048 m!99057))

(assert (=> b!92048 m!98487))

(assert (=> b!92048 m!98487))

(declare-fun m!99059 () Bool)

(assert (=> b!92048 m!99059))

(assert (=> b!92050 m!98487))

(assert (=> b!92050 m!98487))

(assert (=> b!92050 m!99059))

(assert (=> d!24135 d!24239))

(declare-fun b!92053 () Bool)

(declare-fun e!60018 () Option!151)

(assert (=> b!92053 (= e!60018 (getValueByKey!145 (t!5386 lt!44732) (_1!1144 lt!44651)))))

(declare-fun b!92052 () Bool)

(declare-fun e!60017 () Option!151)

(assert (=> b!92052 (= e!60017 e!60018)))

(declare-fun c!15318 () Bool)

(assert (=> b!92052 (= c!15318 (and ((_ is Cons!1548) lt!44732) (not (= (_1!1144 (h!2140 lt!44732)) (_1!1144 lt!44651)))))))

(declare-fun b!92054 () Bool)

(assert (=> b!92054 (= e!60018 None!149)))

(declare-fun b!92051 () Bool)

(assert (=> b!92051 (= e!60017 (Some!150 (_2!1144 (h!2140 lt!44732))))))

(declare-fun d!24241 () Bool)

(declare-fun c!15317 () Bool)

(assert (=> d!24241 (= c!15317 (and ((_ is Cons!1548) lt!44732) (= (_1!1144 (h!2140 lt!44732)) (_1!1144 lt!44651))))))

(assert (=> d!24241 (= (getValueByKey!145 lt!44732 (_1!1144 lt!44651)) e!60017)))

(assert (= (and d!24241 c!15317) b!92051))

(assert (= (and d!24241 (not c!15317)) b!92052))

(assert (= (and b!92052 c!15318) b!92053))

(assert (= (and b!92052 (not c!15318)) b!92054))

(declare-fun m!99061 () Bool)

(assert (=> b!92053 m!99061))

(assert (=> d!24135 d!24241))

(declare-fun d!24243 () Bool)

(assert (=> d!24243 (= (getValueByKey!145 lt!44732 (_1!1144 lt!44651)) (Some!150 (_2!1144 lt!44651)))))

(declare-fun lt!45055 () Unit!2720)

(assert (=> d!24243 (= lt!45055 (choose!547 lt!44732 (_1!1144 lt!44651) (_2!1144 lt!44651)))))

(declare-fun e!60019 () Bool)

(assert (=> d!24243 e!60019))

(declare-fun res!46824 () Bool)

(assert (=> d!24243 (=> (not res!46824) (not e!60019))))

(assert (=> d!24243 (= res!46824 (isStrictlySorted!301 lt!44732))))

(assert (=> d!24243 (= (lemmaContainsTupThenGetReturnValue!62 lt!44732 (_1!1144 lt!44651) (_2!1144 lt!44651)) lt!45055)))

(declare-fun b!92055 () Bool)

(declare-fun res!46825 () Bool)

(assert (=> b!92055 (=> (not res!46825) (not e!60019))))

(assert (=> b!92055 (= res!46825 (containsKey!149 lt!44732 (_1!1144 lt!44651)))))

(declare-fun b!92056 () Bool)

(assert (=> b!92056 (= e!60019 (contains!780 lt!44732 (tuple2!2267 (_1!1144 lt!44651) (_2!1144 lt!44651))))))

(assert (= (and d!24243 res!46824) b!92055))

(assert (= (and b!92055 res!46825) b!92056))

(assert (=> d!24243 m!98481))

(declare-fun m!99063 () Bool)

(assert (=> d!24243 m!99063))

(declare-fun m!99065 () Bool)

(assert (=> d!24243 m!99065))

(declare-fun m!99067 () Bool)

(assert (=> b!92055 m!99067))

(declare-fun m!99069 () Bool)

(assert (=> b!92056 m!99069))

(assert (=> d!24135 d!24243))

(declare-fun bm!9054 () Bool)

(declare-fun call!9057 () List!1552)

(declare-fun call!9059 () List!1552)

(assert (=> bm!9054 (= call!9057 call!9059)))

(declare-fun b!92057 () Bool)

(declare-fun res!46826 () Bool)

(declare-fun e!60020 () Bool)

(assert (=> b!92057 (=> (not res!46826) (not e!60020))))

(declare-fun lt!45056 () List!1552)

(assert (=> b!92057 (= res!46826 (containsKey!149 lt!45056 (_1!1144 lt!44651)))))

(declare-fun b!92058 () Bool)

(declare-fun e!60021 () List!1552)

(assert (=> b!92058 (= e!60021 call!9059)))

(declare-fun b!92059 () Bool)

(assert (=> b!92059 (= e!60020 (contains!780 lt!45056 (tuple2!2267 (_1!1144 lt!44651) (_2!1144 lt!44651))))))

(declare-fun b!92060 () Bool)

(declare-fun e!60024 () List!1552)

(assert (=> b!92060 (= e!60024 (insertStrictlySorted!65 (t!5386 (toList!765 lt!44642)) (_1!1144 lt!44651) (_2!1144 lt!44651)))))

(declare-fun bm!9055 () Bool)

(declare-fun call!9058 () List!1552)

(assert (=> bm!9055 (= call!9059 call!9058)))

(declare-fun b!92062 () Bool)

(declare-fun e!60022 () List!1552)

(assert (=> b!92062 (= e!60022 e!60021)))

(declare-fun c!15319 () Bool)

(assert (=> b!92062 (= c!15319 (and ((_ is Cons!1548) (toList!765 lt!44642)) (= (_1!1144 (h!2140 (toList!765 lt!44642))) (_1!1144 lt!44651))))))

(declare-fun b!92063 () Bool)

(assert (=> b!92063 (= e!60022 call!9058)))

(declare-fun b!92064 () Bool)

(declare-fun c!15321 () Bool)

(assert (=> b!92064 (= c!15321 (and ((_ is Cons!1548) (toList!765 lt!44642)) (bvsgt (_1!1144 (h!2140 (toList!765 lt!44642))) (_1!1144 lt!44651))))))

(declare-fun e!60023 () List!1552)

(assert (=> b!92064 (= e!60021 e!60023)))

(declare-fun b!92065 () Bool)

(assert (=> b!92065 (= e!60024 (ite c!15319 (t!5386 (toList!765 lt!44642)) (ite c!15321 (Cons!1548 (h!2140 (toList!765 lt!44642)) (t!5386 (toList!765 lt!44642))) Nil!1549)))))

(declare-fun bm!9056 () Bool)

(declare-fun c!15320 () Bool)

(assert (=> bm!9056 (= call!9058 ($colon$colon!75 e!60024 (ite c!15320 (h!2140 (toList!765 lt!44642)) (tuple2!2267 (_1!1144 lt!44651) (_2!1144 lt!44651)))))))

(declare-fun c!15322 () Bool)

(assert (=> bm!9056 (= c!15322 c!15320)))

(declare-fun b!92066 () Bool)

(assert (=> b!92066 (= e!60023 call!9057)))

(declare-fun d!24245 () Bool)

(assert (=> d!24245 e!60020))

(declare-fun res!46827 () Bool)

(assert (=> d!24245 (=> (not res!46827) (not e!60020))))

(assert (=> d!24245 (= res!46827 (isStrictlySorted!301 lt!45056))))

(assert (=> d!24245 (= lt!45056 e!60022)))

(assert (=> d!24245 (= c!15320 (and ((_ is Cons!1548) (toList!765 lt!44642)) (bvslt (_1!1144 (h!2140 (toList!765 lt!44642))) (_1!1144 lt!44651))))))

(assert (=> d!24245 (isStrictlySorted!301 (toList!765 lt!44642))))

(assert (=> d!24245 (= (insertStrictlySorted!65 (toList!765 lt!44642) (_1!1144 lt!44651) (_2!1144 lt!44651)) lt!45056)))

(declare-fun b!92061 () Bool)

(assert (=> b!92061 (= e!60023 call!9057)))

(assert (= (and d!24245 c!15320) b!92063))

(assert (= (and d!24245 (not c!15320)) b!92062))

(assert (= (and b!92062 c!15319) b!92058))

(assert (= (and b!92062 (not c!15319)) b!92064))

(assert (= (and b!92064 c!15321) b!92061))

(assert (= (and b!92064 (not c!15321)) b!92066))

(assert (= (or b!92061 b!92066) bm!9054))

(assert (= (or b!92058 bm!9054) bm!9055))

(assert (= (or b!92063 bm!9055) bm!9056))

(assert (= (and bm!9056 c!15322) b!92060))

(assert (= (and bm!9056 (not c!15322)) b!92065))

(assert (= (and d!24245 res!46827) b!92057))

(assert (= (and b!92057 res!46826) b!92059))

(declare-fun m!99071 () Bool)

(assert (=> b!92057 m!99071))

(declare-fun m!99073 () Bool)

(assert (=> b!92060 m!99073))

(declare-fun m!99075 () Bool)

(assert (=> bm!9056 m!99075))

(declare-fun m!99077 () Bool)

(assert (=> b!92059 m!99077))

(declare-fun m!99079 () Bool)

(assert (=> d!24245 m!99079))

(declare-fun m!99081 () Bool)

(assert (=> d!24245 m!99081))

(assert (=> d!24135 d!24245))

(assert (=> b!91748 d!24189))

(declare-fun d!24247 () Bool)

(declare-fun lt!45057 () Bool)

(assert (=> d!24247 (= lt!45057 (select (content!95 (toList!765 lt!44758)) lt!44649))))

(declare-fun e!60025 () Bool)

(assert (=> d!24247 (= lt!45057 e!60025)))

(declare-fun res!46828 () Bool)

(assert (=> d!24247 (=> (not res!46828) (not e!60025))))

(assert (=> d!24247 (= res!46828 ((_ is Cons!1548) (toList!765 lt!44758)))))

(assert (=> d!24247 (= (contains!780 (toList!765 lt!44758) lt!44649) lt!45057)))

(declare-fun b!92067 () Bool)

(declare-fun e!60026 () Bool)

(assert (=> b!92067 (= e!60025 e!60026)))

(declare-fun res!46829 () Bool)

(assert (=> b!92067 (=> res!46829 e!60026)))

(assert (=> b!92067 (= res!46829 (= (h!2140 (toList!765 lt!44758)) lt!44649))))

(declare-fun b!92068 () Bool)

(assert (=> b!92068 (= e!60026 (contains!780 (t!5386 (toList!765 lt!44758)) lt!44649))))

(assert (= (and d!24247 res!46828) b!92067))

(assert (= (and b!92067 (not res!46829)) b!92068))

(declare-fun m!99083 () Bool)

(assert (=> d!24247 m!99083))

(declare-fun m!99085 () Bool)

(assert (=> d!24247 m!99085))

(declare-fun m!99087 () Bool)

(assert (=> b!92068 m!99087))

(assert (=> b!91655 d!24247))

(declare-fun d!24249 () Bool)

(declare-fun res!46830 () Bool)

(declare-fun e!60027 () Bool)

(assert (=> d!24249 (=> (not res!46830) (not e!60027))))

(assert (=> d!24249 (= res!46830 (simpleValid!63 (v!2721 (underlying!313 thiss!992))))))

(assert (=> d!24249 (= (valid!353 (v!2721 (underlying!313 thiss!992))) e!60027)))

(declare-fun b!92069 () Bool)

(declare-fun res!46831 () Bool)

(assert (=> b!92069 (=> (not res!46831) (not e!60027))))

(assert (=> b!92069 (= res!46831 (= (arrayCountValidKeys!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000000 (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))) (_size!451 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun b!92070 () Bool)

(declare-fun res!46832 () Bool)

(assert (=> b!92070 (=> (not res!46832) (not e!60027))))

(assert (=> b!92070 (= res!46832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun b!92071 () Bool)

(assert (=> b!92071 (= e!60027 (arrayNoDuplicates!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000000 Nil!1548))))

(assert (= (and d!24249 res!46830) b!92069))

(assert (= (and b!92069 res!46831) b!92070))

(assert (= (and b!92070 res!46832) b!92071))

(declare-fun m!99089 () Bool)

(assert (=> d!24249 m!99089))

(declare-fun m!99091 () Bool)

(assert (=> b!92069 m!99091))

(declare-fun m!99093 () Bool)

(assert (=> b!92070 m!99093))

(declare-fun m!99095 () Bool)

(assert (=> b!92071 m!99095))

(assert (=> d!24157 d!24249))

(assert (=> bm!9027 d!24163))

(declare-fun d!24251 () Bool)

(declare-fun e!60029 () Bool)

(assert (=> d!24251 e!60029))

(declare-fun res!46833 () Bool)

(assert (=> d!24251 (=> res!46833 e!60029)))

(declare-fun lt!45059 () Bool)

(assert (=> d!24251 (= res!46833 (not lt!45059))))

(declare-fun lt!45058 () Bool)

(assert (=> d!24251 (= lt!45059 lt!45058)))

(declare-fun lt!45061 () Unit!2720)

(declare-fun e!60028 () Unit!2720)

(assert (=> d!24251 (= lt!45061 e!60028)))

(declare-fun c!15323 () Bool)

(assert (=> d!24251 (= c!15323 lt!45058)))

(assert (=> d!24251 (= lt!45058 (containsKey!149 (toList!765 lt!44827) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24251 (= (contains!777 lt!44827 #b0000000000000000000000000000000000000000000000000000000000000000) lt!45059)))

(declare-fun b!92072 () Bool)

(declare-fun lt!45060 () Unit!2720)

(assert (=> b!92072 (= e!60028 lt!45060)))

(assert (=> b!92072 (= lt!45060 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44827) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92072 (isDefined!98 (getValueByKey!145 (toList!765 lt!44827) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92073 () Bool)

(declare-fun Unit!2735 () Unit!2720)

(assert (=> b!92073 (= e!60028 Unit!2735)))

(declare-fun b!92074 () Bool)

(assert (=> b!92074 (= e!60029 (isDefined!98 (getValueByKey!145 (toList!765 lt!44827) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24251 c!15323) b!92072))

(assert (= (and d!24251 (not c!15323)) b!92073))

(assert (= (and d!24251 (not res!46833)) b!92074))

(declare-fun m!99097 () Bool)

(assert (=> d!24251 m!99097))

(declare-fun m!99099 () Bool)

(assert (=> b!92072 m!99099))

(assert (=> b!92072 m!99051))

(assert (=> b!92072 m!99051))

(declare-fun m!99101 () Bool)

(assert (=> b!92072 m!99101))

(assert (=> b!92074 m!99051))

(assert (=> b!92074 m!99051))

(assert (=> b!92074 m!99101))

(assert (=> bm!8953 d!24251))

(declare-fun d!24253 () Bool)

(declare-fun e!60031 () Bool)

(assert (=> d!24253 e!60031))

(declare-fun res!46834 () Bool)

(assert (=> d!24253 (=> res!46834 e!60031)))

(declare-fun lt!45063 () Bool)

(assert (=> d!24253 (= res!46834 (not lt!45063))))

(declare-fun lt!45062 () Bool)

(assert (=> d!24253 (= lt!45063 lt!45062)))

(declare-fun lt!45065 () Unit!2720)

(declare-fun e!60030 () Unit!2720)

(assert (=> d!24253 (= lt!45065 e!60030)))

(declare-fun c!15324 () Bool)

(assert (=> d!24253 (= c!15324 lt!45062)))

(assert (=> d!24253 (= lt!45062 (containsKey!149 (toList!765 lt!44757) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24253 (= (contains!777 lt!44757 #b0000000000000000000000000000000000000000000000000000000000000000) lt!45063)))

(declare-fun b!92075 () Bool)

(declare-fun lt!45064 () Unit!2720)

(assert (=> b!92075 (= e!60030 lt!45064)))

(assert (=> b!92075 (= lt!45064 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44757) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92075 (isDefined!98 (getValueByKey!145 (toList!765 lt!44757) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92076 () Bool)

(declare-fun Unit!2736 () Unit!2720)

(assert (=> b!92076 (= e!60030 Unit!2736)))

(declare-fun b!92077 () Bool)

(assert (=> b!92077 (= e!60031 (isDefined!98 (getValueByKey!145 (toList!765 lt!44757) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24253 c!15324) b!92075))

(assert (= (and d!24253 (not c!15324)) b!92076))

(assert (= (and d!24253 (not res!46834)) b!92077))

(declare-fun m!99103 () Bool)

(assert (=> d!24253 m!99103))

(declare-fun m!99105 () Bool)

(assert (=> b!92075 m!99105))

(declare-fun m!99107 () Bool)

(assert (=> b!92075 m!99107))

(assert (=> b!92075 m!99107))

(declare-fun m!99109 () Bool)

(assert (=> b!92075 m!99109))

(assert (=> b!92077 m!99107))

(assert (=> b!92077 m!99107))

(assert (=> b!92077 m!99109))

(assert (=> d!24139 d!24253))

(assert (=> d!24139 d!24225))

(declare-fun b!92078 () Bool)

(declare-fun e!60035 () Bool)

(declare-fun e!60032 () Bool)

(assert (=> b!92078 (= e!60035 e!60032)))

(declare-fun res!46835 () Bool)

(assert (=> b!92078 (=> (not res!46835) (not e!60032))))

(declare-fun e!60034 () Bool)

(assert (=> b!92078 (= res!46835 (not e!60034))))

(declare-fun res!46836 () Bool)

(assert (=> b!92078 (=> (not res!46836) (not e!60034))))

(assert (=> b!92078 (= res!46836 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000)))))

(declare-fun bm!9057 () Bool)

(declare-fun call!9060 () Bool)

(declare-fun c!15325 () Bool)

(assert (=> bm!9057 (= call!9060 (arrayNoDuplicates!0 (_keys!4086 (_2!1145 lt!44647)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!15325 (Cons!1547 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000) Nil!1548) Nil!1548)))))

(declare-fun b!92079 () Bool)

(assert (=> b!92079 (= e!60034 (contains!779 Nil!1548 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000)))))

(declare-fun b!92080 () Bool)

(declare-fun e!60033 () Bool)

(assert (=> b!92080 (= e!60033 call!9060)))

(declare-fun b!92081 () Bool)

(assert (=> b!92081 (= e!60033 call!9060)))

(declare-fun d!24255 () Bool)

(declare-fun res!46837 () Bool)

(assert (=> d!24255 (=> res!46837 e!60035)))

(assert (=> d!24255 (= res!46837 (bvsge #b00000000000000000000000000000000 (size!2214 (_keys!4086 (_2!1145 lt!44647)))))))

(assert (=> d!24255 (= (arrayNoDuplicates!0 (_keys!4086 (_2!1145 lt!44647)) #b00000000000000000000000000000000 Nil!1548) e!60035)))

(declare-fun b!92082 () Bool)

(assert (=> b!92082 (= e!60032 e!60033)))

(assert (=> b!92082 (= c!15325 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000)))))

(assert (= (and d!24255 (not res!46837)) b!92078))

(assert (= (and b!92078 res!46836) b!92079))

(assert (= (and b!92078 res!46835) b!92082))

(assert (= (and b!92082 c!15325) b!92081))

(assert (= (and b!92082 (not c!15325)) b!92080))

(assert (= (or b!92081 b!92080) bm!9057))

(assert (=> b!92078 m!98779))

(assert (=> b!92078 m!98779))

(assert (=> b!92078 m!98781))

(assert (=> bm!9057 m!98779))

(declare-fun m!99111 () Bool)

(assert (=> bm!9057 m!99111))

(assert (=> b!92079 m!98779))

(assert (=> b!92079 m!98779))

(declare-fun m!99113 () Bool)

(assert (=> b!92079 m!99113))

(assert (=> b!92082 m!98779))

(assert (=> b!92082 m!98779))

(assert (=> b!92082 m!98781))

(assert (=> b!91609 d!24255))

(declare-fun b!92085 () Bool)

(declare-fun e!60037 () Option!151)

(assert (=> b!92085 (= e!60037 (getValueByKey!145 (t!5386 (toList!765 lt!44837)) (_1!1144 lt!44651)))))

(declare-fun b!92084 () Bool)

(declare-fun e!60036 () Option!151)

(assert (=> b!92084 (= e!60036 e!60037)))

(declare-fun c!15327 () Bool)

(assert (=> b!92084 (= c!15327 (and ((_ is Cons!1548) (toList!765 lt!44837)) (not (= (_1!1144 (h!2140 (toList!765 lt!44837))) (_1!1144 lt!44651)))))))

(declare-fun b!92086 () Bool)

(assert (=> b!92086 (= e!60037 None!149)))

(declare-fun b!92083 () Bool)

(assert (=> b!92083 (= e!60036 (Some!150 (_2!1144 (h!2140 (toList!765 lt!44837)))))))

(declare-fun d!24257 () Bool)

(declare-fun c!15326 () Bool)

(assert (=> d!24257 (= c!15326 (and ((_ is Cons!1548) (toList!765 lt!44837)) (= (_1!1144 (h!2140 (toList!765 lt!44837))) (_1!1144 lt!44651))))))

(assert (=> d!24257 (= (getValueByKey!145 (toList!765 lt!44837) (_1!1144 lt!44651)) e!60036)))

(assert (= (and d!24257 c!15326) b!92083))

(assert (= (and d!24257 (not c!15326)) b!92084))

(assert (= (and b!92084 c!15327) b!92085))

(assert (= (and b!92084 (not c!15327)) b!92086))

(declare-fun m!99115 () Bool)

(assert (=> b!92085 m!99115))

(assert (=> b!91723 d!24257))

(declare-fun b!92087 () Bool)

(declare-fun res!46840 () Bool)

(declare-fun e!60038 () Bool)

(assert (=> b!92087 (=> (not res!46840) (not e!60038))))

(declare-fun lt!45072 () ListLongMap!1499)

(assert (=> b!92087 (= res!46840 (not (contains!777 lt!45072 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92088 () Bool)

(declare-fun e!60039 () Bool)

(declare-fun e!60041 () Bool)

(assert (=> b!92088 (= e!60039 e!60041)))

(assert (=> b!92088 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun res!46838 () Bool)

(assert (=> b!92088 (= res!46838 (contains!777 lt!45072 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!92088 (=> (not res!46838) (not e!60041))))

(declare-fun bm!9058 () Bool)

(declare-fun call!9061 () ListLongMap!1499)

(assert (=> bm!9058 (= call!9061 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))))))

(declare-fun e!60042 () Bool)

(declare-fun b!92089 () Bool)

(assert (=> b!92089 (= e!60042 (= lt!45072 (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!92090 () Bool)

(declare-fun e!60044 () ListLongMap!1499)

(assert (=> b!92090 (= e!60044 (ListLongMap!1500 Nil!1549))))

(declare-fun b!92091 () Bool)

(assert (=> b!92091 (= e!60039 e!60042)))

(declare-fun c!15331 () Bool)

(assert (=> b!92091 (= c!15331 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!92092 () Bool)

(assert (=> b!92092 (= e!60042 (isEmpty!346 lt!45072))))

(declare-fun d!24259 () Bool)

(assert (=> d!24259 e!60038))

(declare-fun res!46841 () Bool)

(assert (=> d!24259 (=> (not res!46841) (not e!60038))))

(assert (=> d!24259 (= res!46841 (not (contains!777 lt!45072 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24259 (= lt!45072 e!60044)))

(declare-fun c!15330 () Bool)

(assert (=> d!24259 (= c!15330 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(assert (=> d!24259 (validMask!0 (mask!6466 (v!2721 (underlying!313 thiss!992))))))

(assert (=> d!24259 (= (getCurrentListMapNoExtraKeys!92 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))) lt!45072)))

(declare-fun b!92093 () Bool)

(assert (=> b!92093 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(assert (=> b!92093 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2215 (_values!2389 (v!2721 (underlying!313 thiss!992))))))))

(assert (=> b!92093 (= e!60041 (= (apply!87 lt!45072 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!92094 () Bool)

(declare-fun e!60040 () Bool)

(assert (=> b!92094 (= e!60040 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!92094 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!92095 () Bool)

(assert (=> b!92095 (= e!60038 e!60039)))

(declare-fun c!15328 () Bool)

(assert (=> b!92095 (= c!15328 e!60040)))

(declare-fun res!46839 () Bool)

(assert (=> b!92095 (=> (not res!46839) (not e!60040))))

(assert (=> b!92095 (= res!46839 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!92096 () Bool)

(declare-fun e!60043 () ListLongMap!1499)

(assert (=> b!92096 (= e!60043 call!9061)))

(declare-fun b!92097 () Bool)

(assert (=> b!92097 (= e!60044 e!60043)))

(declare-fun c!15329 () Bool)

(assert (=> b!92097 (= c!15329 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!92098 () Bool)

(declare-fun lt!45068 () Unit!2720)

(declare-fun lt!45066 () Unit!2720)

(assert (=> b!92098 (= lt!45068 lt!45066)))

(declare-fun lt!45069 () (_ BitVec 64))

(declare-fun lt!45070 () (_ BitVec 64))

(declare-fun lt!45071 () V!3091)

(declare-fun lt!45067 () ListLongMap!1499)

(assert (=> b!92098 (not (contains!777 (+!127 lt!45067 (tuple2!2267 lt!45070 lt!45071)) lt!45069))))

(assert (=> b!92098 (= lt!45066 (addStillNotContains!36 lt!45067 lt!45070 lt!45071 lt!45069))))

(assert (=> b!92098 (= lt!45069 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!92098 (= lt!45071 (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!92098 (= lt!45070 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!92098 (= lt!45067 call!9061)))

(assert (=> b!92098 (= e!60043 (+!127 call!9061 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!24259 c!15330) b!92090))

(assert (= (and d!24259 (not c!15330)) b!92097))

(assert (= (and b!92097 c!15329) b!92098))

(assert (= (and b!92097 (not c!15329)) b!92096))

(assert (= (or b!92098 b!92096) bm!9058))

(assert (= (and d!24259 res!46841) b!92087))

(assert (= (and b!92087 res!46840) b!92095))

(assert (= (and b!92095 res!46839) b!92094))

(assert (= (and b!92095 c!15328) b!92088))

(assert (= (and b!92095 (not c!15328)) b!92091))

(assert (= (and b!92088 res!46838) b!92093))

(assert (= (and b!92091 c!15331) b!92089))

(assert (= (and b!92091 (not c!15331)) b!92092))

(declare-fun b_lambda!4065 () Bool)

(assert (=> (not b_lambda!4065) (not b!92093)))

(assert (=> b!92093 t!5382))

(declare-fun b_and!5591 () Bool)

(assert (= b_and!5587 (and (=> t!5382 result!3083) b_and!5591)))

(assert (=> b!92093 t!5384))

(declare-fun b_and!5593 () Bool)

(assert (= b_and!5589 (and (=> t!5384 result!3087) b_and!5593)))

(declare-fun b_lambda!4067 () Bool)

(assert (=> (not b_lambda!4067) (not b!92098)))

(assert (=> b!92098 t!5382))

(declare-fun b_and!5595 () Bool)

(assert (= b_and!5591 (and (=> t!5382 result!3083) b_and!5595)))

(assert (=> b!92098 t!5384))

(declare-fun b_and!5597 () Bool)

(assert (= b_and!5593 (and (=> t!5384 result!3087) b_and!5597)))

(declare-fun m!99117 () Bool)

(assert (=> b!92089 m!99117))

(declare-fun m!99119 () Bool)

(assert (=> d!24259 m!99119))

(assert (=> d!24259 m!98451))

(declare-fun m!99121 () Bool)

(assert (=> b!92093 m!99121))

(assert (=> b!92093 m!98369))

(declare-fun m!99123 () Bool)

(assert (=> b!92093 m!99123))

(assert (=> b!92093 m!99123))

(declare-fun m!99125 () Bool)

(assert (=> b!92093 m!99125))

(assert (=> b!92093 m!99121))

(assert (=> b!92093 m!98369))

(declare-fun m!99127 () Bool)

(assert (=> b!92093 m!99127))

(declare-fun m!99129 () Bool)

(assert (=> b!92092 m!99129))

(assert (=> b!92094 m!99123))

(assert (=> b!92094 m!99123))

(declare-fun m!99131 () Bool)

(assert (=> b!92094 m!99131))

(assert (=> b!92088 m!99123))

(assert (=> b!92088 m!99123))

(declare-fun m!99133 () Bool)

(assert (=> b!92088 m!99133))

(assert (=> b!92097 m!99123))

(assert (=> b!92097 m!99123))

(assert (=> b!92097 m!99131))

(assert (=> bm!9058 m!99117))

(assert (=> b!92098 m!99121))

(declare-fun m!99135 () Bool)

(assert (=> b!92098 m!99135))

(declare-fun m!99137 () Bool)

(assert (=> b!92098 m!99137))

(declare-fun m!99139 () Bool)

(assert (=> b!92098 m!99139))

(assert (=> b!92098 m!98369))

(assert (=> b!92098 m!99121))

(assert (=> b!92098 m!98369))

(assert (=> b!92098 m!99127))

(assert (=> b!92098 m!99135))

(assert (=> b!92098 m!99123))

(declare-fun m!99141 () Bool)

(assert (=> b!92098 m!99141))

(declare-fun m!99143 () Bool)

(assert (=> b!92087 m!99143))

(assert (=> bm!8936 d!24259))

(declare-fun b!92099 () Bool)

(declare-fun e!60056 () Bool)

(declare-fun e!60045 () Bool)

(assert (=> b!92099 (= e!60056 e!60045)))

(declare-fun res!46848 () Bool)

(declare-fun call!9065 () Bool)

(assert (=> b!92099 (= res!46848 call!9065)))

(assert (=> b!92099 (=> (not res!46848) (not e!60045))))

(declare-fun b!92100 () Bool)

(declare-fun lt!45089 () ListLongMap!1499)

(assert (=> b!92100 (= e!60045 (= (apply!87 lt!45089 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2294 newMap!16)))))

(declare-fun bm!9059 () Bool)

(declare-fun call!9068 () ListLongMap!1499)

(declare-fun call!9062 () ListLongMap!1499)

(assert (=> bm!9059 (= call!9068 call!9062)))

(declare-fun bm!9060 () Bool)

(declare-fun call!9063 () ListLongMap!1499)

(assert (=> bm!9060 (= call!9063 (getCurrentListMapNoExtraKeys!92 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun d!24261 () Bool)

(declare-fun e!60047 () Bool)

(assert (=> d!24261 e!60047))

(declare-fun res!46849 () Bool)

(assert (=> d!24261 (=> (not res!46849) (not e!60047))))

(assert (=> d!24261 (= res!46849 (or (bvsge #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))))

(declare-fun lt!45082 () ListLongMap!1499)

(assert (=> d!24261 (= lt!45089 lt!45082)))

(declare-fun lt!45091 () Unit!2720)

(declare-fun e!60055 () Unit!2720)

(assert (=> d!24261 (= lt!45091 e!60055)))

(declare-fun c!15332 () Bool)

(declare-fun e!60053 () Bool)

(assert (=> d!24261 (= c!15332 e!60053)))

(declare-fun res!46843 () Bool)

(assert (=> d!24261 (=> (not res!46843) (not e!60053))))

(assert (=> d!24261 (= res!46843 (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))

(declare-fun e!60048 () ListLongMap!1499)

(assert (=> d!24261 (= lt!45082 e!60048)))

(declare-fun c!15337 () Bool)

(assert (=> d!24261 (= c!15337 (and (not (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24261 (validMask!0 (mask!6466 newMap!16))))

(assert (=> d!24261 (= (getCurrentListMap!457 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)) lt!45089)))

(declare-fun b!92101 () Bool)

(declare-fun Unit!2737 () Unit!2720)

(assert (=> b!92101 (= e!60055 Unit!2737)))

(declare-fun bm!9061 () Bool)

(assert (=> bm!9061 (= call!9065 (contains!777 lt!45089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92102 () Bool)

(declare-fun e!60050 () Bool)

(declare-fun call!9067 () Bool)

(assert (=> b!92102 (= e!60050 (not call!9067))))

(declare-fun b!92103 () Bool)

(declare-fun res!46850 () Bool)

(assert (=> b!92103 (=> (not res!46850) (not e!60047))))

(declare-fun e!60049 () Bool)

(assert (=> b!92103 (= res!46850 e!60049)))

(declare-fun res!46846 () Bool)

(assert (=> b!92103 (=> res!46846 e!60049)))

(declare-fun e!60054 () Bool)

(assert (=> b!92103 (= res!46846 (not e!60054))))

(declare-fun res!46845 () Bool)

(assert (=> b!92103 (=> (not res!46845) (not e!60054))))

(assert (=> b!92103 (= res!46845 (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))

(declare-fun b!92104 () Bool)

(assert (=> b!92104 (= e!60048 (+!127 call!9062 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 newMap!16))))))

(declare-fun b!92105 () Bool)

(declare-fun c!15334 () Bool)

(assert (=> b!92105 (= c!15334 (and (not (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!60046 () ListLongMap!1499)

(declare-fun e!60052 () ListLongMap!1499)

(assert (=> b!92105 (= e!60046 e!60052)))

(declare-fun b!92106 () Bool)

(assert (=> b!92106 (= e!60046 call!9068)))

(declare-fun b!92107 () Bool)

(assert (=> b!92107 (= e!60047 e!60050)))

(declare-fun c!15336 () Bool)

(assert (=> b!92107 (= c!15336 (not (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!92108 () Bool)

(declare-fun res!46847 () Bool)

(assert (=> b!92108 (=> (not res!46847) (not e!60047))))

(assert (=> b!92108 (= res!46847 e!60056)))

(declare-fun c!15333 () Bool)

(assert (=> b!92108 (= c!15333 (not (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!9062 () Bool)

(declare-fun call!9064 () ListLongMap!1499)

(declare-fun call!9066 () ListLongMap!1499)

(assert (=> bm!9062 (= call!9064 call!9066)))

(declare-fun b!92109 () Bool)

(assert (=> b!92109 (= e!60052 call!9064)))

(declare-fun b!92110 () Bool)

(declare-fun e!60057 () Bool)

(assert (=> b!92110 (= e!60050 e!60057)))

(declare-fun res!46844 () Bool)

(assert (=> b!92110 (= res!46844 call!9067)))

(assert (=> b!92110 (=> (not res!46844) (not e!60057))))

(declare-fun b!92111 () Bool)

(assert (=> b!92111 (= e!60054 (validKeyInArray!0 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9063 () Bool)

(assert (=> bm!9063 (= call!9066 call!9063)))

(declare-fun b!92112 () Bool)

(declare-fun lt!45086 () Unit!2720)

(assert (=> b!92112 (= e!60055 lt!45086)))

(declare-fun lt!45079 () ListLongMap!1499)

(assert (=> b!92112 (= lt!45079 (getCurrentListMapNoExtraKeys!92 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!45093 () (_ BitVec 64))

(assert (=> b!92112 (= lt!45093 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45090 () (_ BitVec 64))

(assert (=> b!92112 (= lt!45090 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45083 () Unit!2720)

(assert (=> b!92112 (= lt!45083 (addStillContains!63 lt!45079 lt!45093 (zeroValue!2294 newMap!16) lt!45090))))

(assert (=> b!92112 (contains!777 (+!127 lt!45079 (tuple2!2267 lt!45093 (zeroValue!2294 newMap!16))) lt!45090)))

(declare-fun lt!45076 () Unit!2720)

(assert (=> b!92112 (= lt!45076 lt!45083)))

(declare-fun lt!45092 () ListLongMap!1499)

(assert (=> b!92112 (= lt!45092 (getCurrentListMapNoExtraKeys!92 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!45074 () (_ BitVec 64))

(assert (=> b!92112 (= lt!45074 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45094 () (_ BitVec 64))

(assert (=> b!92112 (= lt!45094 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45080 () Unit!2720)

(assert (=> b!92112 (= lt!45080 (addApplyDifferent!63 lt!45092 lt!45074 (minValue!2294 newMap!16) lt!45094))))

(assert (=> b!92112 (= (apply!87 (+!127 lt!45092 (tuple2!2267 lt!45074 (minValue!2294 newMap!16))) lt!45094) (apply!87 lt!45092 lt!45094))))

(declare-fun lt!45073 () Unit!2720)

(assert (=> b!92112 (= lt!45073 lt!45080)))

(declare-fun lt!45087 () ListLongMap!1499)

(assert (=> b!92112 (= lt!45087 (getCurrentListMapNoExtraKeys!92 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!45077 () (_ BitVec 64))

(assert (=> b!92112 (= lt!45077 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45081 () (_ BitVec 64))

(assert (=> b!92112 (= lt!45081 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45078 () Unit!2720)

(assert (=> b!92112 (= lt!45078 (addApplyDifferent!63 lt!45087 lt!45077 (zeroValue!2294 newMap!16) lt!45081))))

(assert (=> b!92112 (= (apply!87 (+!127 lt!45087 (tuple2!2267 lt!45077 (zeroValue!2294 newMap!16))) lt!45081) (apply!87 lt!45087 lt!45081))))

(declare-fun lt!45075 () Unit!2720)

(assert (=> b!92112 (= lt!45075 lt!45078)))

(declare-fun lt!45085 () ListLongMap!1499)

(assert (=> b!92112 (= lt!45085 (getCurrentListMapNoExtraKeys!92 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!45088 () (_ BitVec 64))

(assert (=> b!92112 (= lt!45088 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45084 () (_ BitVec 64))

(assert (=> b!92112 (= lt!45084 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!92112 (= lt!45086 (addApplyDifferent!63 lt!45085 lt!45088 (minValue!2294 newMap!16) lt!45084))))

(assert (=> b!92112 (= (apply!87 (+!127 lt!45085 (tuple2!2267 lt!45088 (minValue!2294 newMap!16))) lt!45084) (apply!87 lt!45085 lt!45084))))

(declare-fun b!92113 () Bool)

(assert (=> b!92113 (= e!60052 call!9068)))

(declare-fun b!92114 () Bool)

(assert (=> b!92114 (= e!60048 e!60046)))

(declare-fun c!15335 () Bool)

(assert (=> b!92114 (= c!15335 (and (not (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!9064 () Bool)

(assert (=> bm!9064 (= call!9067 (contains!777 lt!45089 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92115 () Bool)

(assert (=> b!92115 (= e!60057 (= (apply!87 lt!45089 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2294 newMap!16)))))

(declare-fun b!92116 () Bool)

(declare-fun e!60051 () Bool)

(assert (=> b!92116 (= e!60049 e!60051)))

(declare-fun res!46842 () Bool)

(assert (=> b!92116 (=> (not res!46842) (not e!60051))))

(assert (=> b!92116 (= res!46842 (contains!777 lt!45089 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!92116 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))

(declare-fun b!92117 () Bool)

(assert (=> b!92117 (= e!60053 (validKeyInArray!0 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9065 () Bool)

(assert (=> bm!9065 (= call!9062 (+!127 (ite c!15337 call!9063 (ite c!15335 call!9066 call!9064)) (ite (or c!15337 c!15335) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 newMap!16)) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 newMap!16)))))))

(declare-fun b!92118 () Bool)

(assert (=> b!92118 (= e!60056 (not call!9065))))

(declare-fun b!92119 () Bool)

(assert (=> b!92119 (= e!60051 (= (apply!87 lt!45089 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)) (get!1237 (select (arr!1968 (_values!2389 newMap!16)) #b00000000000000000000000000000000) (dynLambda!354 (defaultEntry!2406 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!92119 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2215 (_values!2389 newMap!16))))))

(assert (=> b!92119 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))

(assert (= (and d!24261 c!15337) b!92104))

(assert (= (and d!24261 (not c!15337)) b!92114))

(assert (= (and b!92114 c!15335) b!92106))

(assert (= (and b!92114 (not c!15335)) b!92105))

(assert (= (and b!92105 c!15334) b!92113))

(assert (= (and b!92105 (not c!15334)) b!92109))

(assert (= (or b!92113 b!92109) bm!9062))

(assert (= (or b!92106 bm!9062) bm!9063))

(assert (= (or b!92106 b!92113) bm!9059))

(assert (= (or b!92104 bm!9063) bm!9060))

(assert (= (or b!92104 bm!9059) bm!9065))

(assert (= (and d!24261 res!46843) b!92117))

(assert (= (and d!24261 c!15332) b!92112))

(assert (= (and d!24261 (not c!15332)) b!92101))

(assert (= (and d!24261 res!46849) b!92103))

(assert (= (and b!92103 res!46845) b!92111))

(assert (= (and b!92103 (not res!46846)) b!92116))

(assert (= (and b!92116 res!46842) b!92119))

(assert (= (and b!92103 res!46850) b!92108))

(assert (= (and b!92108 c!15333) b!92099))

(assert (= (and b!92108 (not c!15333)) b!92118))

(assert (= (and b!92099 res!46848) b!92100))

(assert (= (or b!92099 b!92118) bm!9061))

(assert (= (and b!92108 res!46847) b!92107))

(assert (= (and b!92107 c!15336) b!92110))

(assert (= (and b!92107 (not c!15336)) b!92102))

(assert (= (and b!92110 res!46844) b!92115))

(assert (= (or b!92110 b!92102) bm!9064))

(declare-fun b_lambda!4069 () Bool)

(assert (=> (not b_lambda!4069) (not b!92119)))

(declare-fun t!5397 () Bool)

(declare-fun tb!1813 () Bool)

(assert (=> (and b!91491 (= (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) (defaultEntry!2406 newMap!16)) t!5397) tb!1813))

(declare-fun result!3101 () Bool)

(assert (=> tb!1813 (= result!3101 tp_is_empty!2583)))

(assert (=> b!92119 t!5397))

(declare-fun b_and!5599 () Bool)

(assert (= b_and!5595 (and (=> t!5397 result!3101) b_and!5599)))

(declare-fun t!5399 () Bool)

(declare-fun tb!1815 () Bool)

(assert (=> (and b!91496 (= (defaultEntry!2406 newMap!16) (defaultEntry!2406 newMap!16)) t!5399) tb!1815))

(declare-fun result!3103 () Bool)

(assert (= result!3103 result!3101))

(assert (=> b!92119 t!5399))

(declare-fun b_and!5601 () Bool)

(assert (= b_and!5597 (and (=> t!5399 result!3103) b_and!5601)))

(assert (=> d!24261 m!98855))

(declare-fun m!99145 () Bool)

(assert (=> b!92104 m!99145))

(declare-fun m!99147 () Bool)

(assert (=> b!92111 m!99147))

(assert (=> b!92111 m!99147))

(declare-fun m!99149 () Bool)

(assert (=> b!92111 m!99149))

(declare-fun m!99151 () Bool)

(assert (=> bm!9064 m!99151))

(declare-fun m!99153 () Bool)

(assert (=> b!92112 m!99153))

(declare-fun m!99155 () Bool)

(assert (=> b!92112 m!99155))

(assert (=> b!92112 m!99155))

(declare-fun m!99157 () Bool)

(assert (=> b!92112 m!99157))

(declare-fun m!99159 () Bool)

(assert (=> b!92112 m!99159))

(declare-fun m!99161 () Bool)

(assert (=> b!92112 m!99161))

(declare-fun m!99163 () Bool)

(assert (=> b!92112 m!99163))

(declare-fun m!99165 () Bool)

(assert (=> b!92112 m!99165))

(assert (=> b!92112 m!99163))

(declare-fun m!99167 () Bool)

(assert (=> b!92112 m!99167))

(declare-fun m!99169 () Bool)

(assert (=> b!92112 m!99169))

(declare-fun m!99171 () Bool)

(assert (=> b!92112 m!99171))

(assert (=> b!92112 m!99159))

(declare-fun m!99173 () Bool)

(assert (=> b!92112 m!99173))

(declare-fun m!99175 () Bool)

(assert (=> b!92112 m!99175))

(declare-fun m!99177 () Bool)

(assert (=> b!92112 m!99177))

(assert (=> b!92112 m!99175))

(declare-fun m!99179 () Bool)

(assert (=> b!92112 m!99179))

(assert (=> b!92112 m!99147))

(declare-fun m!99181 () Bool)

(assert (=> b!92112 m!99181))

(declare-fun m!99183 () Bool)

(assert (=> b!92112 m!99183))

(assert (=> b!92117 m!99147))

(assert (=> b!92117 m!99147))

(assert (=> b!92117 m!99149))

(assert (=> b!92116 m!99147))

(assert (=> b!92116 m!99147))

(declare-fun m!99185 () Bool)

(assert (=> b!92116 m!99185))

(declare-fun m!99187 () Bool)

(assert (=> bm!9061 m!99187))

(declare-fun m!99189 () Bool)

(assert (=> b!92115 m!99189))

(declare-fun m!99191 () Bool)

(assert (=> b!92119 m!99191))

(declare-fun m!99193 () Bool)

(assert (=> b!92119 m!99193))

(assert (=> b!92119 m!99147))

(declare-fun m!99195 () Bool)

(assert (=> b!92119 m!99195))

(assert (=> b!92119 m!99147))

(assert (=> b!92119 m!99193))

(assert (=> b!92119 m!99191))

(declare-fun m!99197 () Bool)

(assert (=> b!92119 m!99197))

(declare-fun m!99199 () Bool)

(assert (=> bm!9065 m!99199))

(assert (=> bm!9060 m!99165))

(declare-fun m!99201 () Bool)

(assert (=> b!92100 m!99201))

(assert (=> b!91872 d!24261))

(declare-fun d!24263 () Bool)

(assert (=> d!24263 (= (map!1222 (_2!1145 lt!44936)) (getCurrentListMap!457 (_keys!4086 (_2!1145 lt!44936)) (_values!2389 (_2!1145 lt!44936)) (mask!6466 (_2!1145 lt!44936)) (extraKeys!2237 (_2!1145 lt!44936)) (zeroValue!2294 (_2!1145 lt!44936)) (minValue!2294 (_2!1145 lt!44936)) #b00000000000000000000000000000000 (defaultEntry!2406 (_2!1145 lt!44936))))))

(declare-fun bs!3822 () Bool)

(assert (= bs!3822 d!24263))

(declare-fun m!99203 () Bool)

(assert (=> bs!3822 m!99203))

(assert (=> bm!9029 d!24263))

(declare-fun b!92122 () Bool)

(declare-fun e!60059 () Option!151)

(assert (=> b!92122 (= e!60059 (getValueByKey!145 (t!5386 (toList!765 lt!44730)) (_1!1144 lt!44651)))))

(declare-fun b!92121 () Bool)

(declare-fun e!60058 () Option!151)

(assert (=> b!92121 (= e!60058 e!60059)))

(declare-fun c!15339 () Bool)

(assert (=> b!92121 (= c!15339 (and ((_ is Cons!1548) (toList!765 lt!44730)) (not (= (_1!1144 (h!2140 (toList!765 lt!44730))) (_1!1144 lt!44651)))))))

(declare-fun b!92123 () Bool)

(assert (=> b!92123 (= e!60059 None!149)))

(declare-fun b!92120 () Bool)

(assert (=> b!92120 (= e!60058 (Some!150 (_2!1144 (h!2140 (toList!765 lt!44730)))))))

(declare-fun d!24265 () Bool)

(declare-fun c!15338 () Bool)

(assert (=> d!24265 (= c!15338 (and ((_ is Cons!1548) (toList!765 lt!44730)) (= (_1!1144 (h!2140 (toList!765 lt!44730))) (_1!1144 lt!44651))))))

(assert (=> d!24265 (= (getValueByKey!145 (toList!765 lt!44730) (_1!1144 lt!44651)) e!60058)))

(assert (= (and d!24265 c!15338) b!92120))

(assert (= (and d!24265 (not c!15338)) b!92121))

(assert (= (and b!92121 c!15339) b!92122))

(assert (= (and b!92121 (not c!15339)) b!92123))

(declare-fun m!99205 () Bool)

(assert (=> b!92122 m!99205))

(assert (=> b!91616 d!24265))

(assert (=> bm!8959 d!24139))

(assert (=> b!91754 d!24189))

(declare-fun d!24267 () Bool)

(declare-fun isEmpty!347 (List!1552) Bool)

(assert (=> d!24267 (= (isEmpty!346 lt!44757) (isEmpty!347 (toList!765 lt!44757)))))

(declare-fun bs!3823 () Bool)

(assert (= bs!3823 d!24267))

(declare-fun m!99207 () Bool)

(assert (=> bs!3823 m!99207))

(assert (=> b!91647 d!24267))

(assert (=> bm!9017 d!24185))

(declare-fun d!24269 () Bool)

(declare-fun e!60061 () Bool)

(assert (=> d!24269 e!60061))

(declare-fun res!46851 () Bool)

(assert (=> d!24269 (=> res!46851 e!60061)))

(declare-fun lt!45096 () Bool)

(assert (=> d!24269 (= res!46851 (not lt!45096))))

(declare-fun lt!45095 () Bool)

(assert (=> d!24269 (= lt!45096 lt!45095)))

(declare-fun lt!45098 () Unit!2720)

(declare-fun e!60060 () Unit!2720)

(assert (=> d!24269 (= lt!45098 e!60060)))

(declare-fun c!15340 () Bool)

(assert (=> d!24269 (= c!15340 lt!45095)))

(assert (=> d!24269 (= lt!45095 (containsKey!149 (toList!765 lt!44758) (_1!1144 lt!44649)))))

(assert (=> d!24269 (= (contains!777 lt!44758 (_1!1144 lt!44649)) lt!45096)))

(declare-fun b!92124 () Bool)

(declare-fun lt!45097 () Unit!2720)

(assert (=> b!92124 (= e!60060 lt!45097)))

(assert (=> b!92124 (= lt!45097 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44758) (_1!1144 lt!44649)))))

(assert (=> b!92124 (isDefined!98 (getValueByKey!145 (toList!765 lt!44758) (_1!1144 lt!44649)))))

(declare-fun b!92125 () Bool)

(declare-fun Unit!2738 () Unit!2720)

(assert (=> b!92125 (= e!60060 Unit!2738)))

(declare-fun b!92126 () Bool)

(assert (=> b!92126 (= e!60061 (isDefined!98 (getValueByKey!145 (toList!765 lt!44758) (_1!1144 lt!44649))))))

(assert (= (and d!24269 c!15340) b!92124))

(assert (= (and d!24269 (not c!15340)) b!92125))

(assert (= (and d!24269 (not res!46851)) b!92126))

(declare-fun m!99209 () Bool)

(assert (=> d!24269 m!99209))

(declare-fun m!99211 () Bool)

(assert (=> b!92124 m!99211))

(assert (=> b!92124 m!98535))

(assert (=> b!92124 m!98535))

(declare-fun m!99213 () Bool)

(assert (=> b!92124 m!99213))

(assert (=> b!92126 m!98535))

(assert (=> b!92126 m!98535))

(assert (=> b!92126 m!99213))

(assert (=> d!24141 d!24269))

(declare-fun b!92129 () Bool)

(declare-fun e!60063 () Option!151)

(assert (=> b!92129 (= e!60063 (getValueByKey!145 (t!5386 lt!44760) (_1!1144 lt!44649)))))

(declare-fun b!92128 () Bool)

(declare-fun e!60062 () Option!151)

(assert (=> b!92128 (= e!60062 e!60063)))

(declare-fun c!15342 () Bool)

(assert (=> b!92128 (= c!15342 (and ((_ is Cons!1548) lt!44760) (not (= (_1!1144 (h!2140 lt!44760)) (_1!1144 lt!44649)))))))

(declare-fun b!92130 () Bool)

(assert (=> b!92130 (= e!60063 None!149)))

(declare-fun b!92127 () Bool)

(assert (=> b!92127 (= e!60062 (Some!150 (_2!1144 (h!2140 lt!44760))))))

(declare-fun d!24271 () Bool)

(declare-fun c!15341 () Bool)

(assert (=> d!24271 (= c!15341 (and ((_ is Cons!1548) lt!44760) (= (_1!1144 (h!2140 lt!44760)) (_1!1144 lt!44649))))))

(assert (=> d!24271 (= (getValueByKey!145 lt!44760 (_1!1144 lt!44649)) e!60062)))

(assert (= (and d!24271 c!15341) b!92127))

(assert (= (and d!24271 (not c!15341)) b!92128))

(assert (= (and b!92128 c!15342) b!92129))

(assert (= (and b!92128 (not c!15342)) b!92130))

(declare-fun m!99215 () Bool)

(assert (=> b!92129 m!99215))

(assert (=> d!24141 d!24271))

(declare-fun d!24273 () Bool)

(assert (=> d!24273 (= (getValueByKey!145 lt!44760 (_1!1144 lt!44649)) (Some!150 (_2!1144 lt!44649)))))

(declare-fun lt!45099 () Unit!2720)

(assert (=> d!24273 (= lt!45099 (choose!547 lt!44760 (_1!1144 lt!44649) (_2!1144 lt!44649)))))

(declare-fun e!60064 () Bool)

(assert (=> d!24273 e!60064))

(declare-fun res!46852 () Bool)

(assert (=> d!24273 (=> (not res!46852) (not e!60064))))

(assert (=> d!24273 (= res!46852 (isStrictlySorted!301 lt!44760))))

(assert (=> d!24273 (= (lemmaContainsTupThenGetReturnValue!62 lt!44760 (_1!1144 lt!44649) (_2!1144 lt!44649)) lt!45099)))

(declare-fun b!92131 () Bool)

(declare-fun res!46853 () Bool)

(assert (=> b!92131 (=> (not res!46853) (not e!60064))))

(assert (=> b!92131 (= res!46853 (containsKey!149 lt!44760 (_1!1144 lt!44649)))))

(declare-fun b!92132 () Bool)

(assert (=> b!92132 (= e!60064 (contains!780 lt!44760 (tuple2!2267 (_1!1144 lt!44649) (_2!1144 lt!44649))))))

(assert (= (and d!24273 res!46852) b!92131))

(assert (= (and b!92131 res!46853) b!92132))

(assert (=> d!24273 m!98529))

(declare-fun m!99217 () Bool)

(assert (=> d!24273 m!99217))

(declare-fun m!99219 () Bool)

(assert (=> d!24273 m!99219))

(declare-fun m!99221 () Bool)

(assert (=> b!92131 m!99221))

(declare-fun m!99223 () Bool)

(assert (=> b!92132 m!99223))

(assert (=> d!24141 d!24273))

(declare-fun bm!9066 () Bool)

(declare-fun call!9069 () List!1552)

(declare-fun call!9071 () List!1552)

(assert (=> bm!9066 (= call!9069 call!9071)))

(declare-fun b!92133 () Bool)

(declare-fun res!46854 () Bool)

(declare-fun e!60065 () Bool)

(assert (=> b!92133 (=> (not res!46854) (not e!60065))))

(declare-fun lt!45100 () List!1552)

(assert (=> b!92133 (= res!46854 (containsKey!149 lt!45100 (_1!1144 lt!44649)))))

(declare-fun b!92134 () Bool)

(declare-fun e!60066 () List!1552)

(assert (=> b!92134 (= e!60066 call!9071)))

(declare-fun b!92135 () Bool)

(assert (=> b!92135 (= e!60065 (contains!780 lt!45100 (tuple2!2267 (_1!1144 lt!44649) (_2!1144 lt!44649))))))

(declare-fun b!92136 () Bool)

(declare-fun e!60069 () List!1552)

(assert (=> b!92136 (= e!60069 (insertStrictlySorted!65 (t!5386 (toList!765 lt!44642)) (_1!1144 lt!44649) (_2!1144 lt!44649)))))

(declare-fun bm!9067 () Bool)

(declare-fun call!9070 () List!1552)

(assert (=> bm!9067 (= call!9071 call!9070)))

(declare-fun b!92138 () Bool)

(declare-fun e!60067 () List!1552)

(assert (=> b!92138 (= e!60067 e!60066)))

(declare-fun c!15343 () Bool)

(assert (=> b!92138 (= c!15343 (and ((_ is Cons!1548) (toList!765 lt!44642)) (= (_1!1144 (h!2140 (toList!765 lt!44642))) (_1!1144 lt!44649))))))

(declare-fun b!92139 () Bool)

(assert (=> b!92139 (= e!60067 call!9070)))

(declare-fun b!92140 () Bool)

(declare-fun c!15345 () Bool)

(assert (=> b!92140 (= c!15345 (and ((_ is Cons!1548) (toList!765 lt!44642)) (bvsgt (_1!1144 (h!2140 (toList!765 lt!44642))) (_1!1144 lt!44649))))))

(declare-fun e!60068 () List!1552)

(assert (=> b!92140 (= e!60066 e!60068)))

(declare-fun b!92141 () Bool)

(assert (=> b!92141 (= e!60069 (ite c!15343 (t!5386 (toList!765 lt!44642)) (ite c!15345 (Cons!1548 (h!2140 (toList!765 lt!44642)) (t!5386 (toList!765 lt!44642))) Nil!1549)))))

(declare-fun c!15344 () Bool)

(declare-fun bm!9068 () Bool)

(assert (=> bm!9068 (= call!9070 ($colon$colon!75 e!60069 (ite c!15344 (h!2140 (toList!765 lt!44642)) (tuple2!2267 (_1!1144 lt!44649) (_2!1144 lt!44649)))))))

(declare-fun c!15346 () Bool)

(assert (=> bm!9068 (= c!15346 c!15344)))

(declare-fun b!92142 () Bool)

(assert (=> b!92142 (= e!60068 call!9069)))

(declare-fun d!24275 () Bool)

(assert (=> d!24275 e!60065))

(declare-fun res!46855 () Bool)

(assert (=> d!24275 (=> (not res!46855) (not e!60065))))

(assert (=> d!24275 (= res!46855 (isStrictlySorted!301 lt!45100))))

(assert (=> d!24275 (= lt!45100 e!60067)))

(assert (=> d!24275 (= c!15344 (and ((_ is Cons!1548) (toList!765 lt!44642)) (bvslt (_1!1144 (h!2140 (toList!765 lt!44642))) (_1!1144 lt!44649))))))

(assert (=> d!24275 (isStrictlySorted!301 (toList!765 lt!44642))))

(assert (=> d!24275 (= (insertStrictlySorted!65 (toList!765 lt!44642) (_1!1144 lt!44649) (_2!1144 lt!44649)) lt!45100)))

(declare-fun b!92137 () Bool)

(assert (=> b!92137 (= e!60068 call!9069)))

(assert (= (and d!24275 c!15344) b!92139))

(assert (= (and d!24275 (not c!15344)) b!92138))

(assert (= (and b!92138 c!15343) b!92134))

(assert (= (and b!92138 (not c!15343)) b!92140))

(assert (= (and b!92140 c!15345) b!92137))

(assert (= (and b!92140 (not c!15345)) b!92142))

(assert (= (or b!92137 b!92142) bm!9066))

(assert (= (or b!92134 bm!9066) bm!9067))

(assert (= (or b!92139 bm!9067) bm!9068))

(assert (= (and bm!9068 c!15346) b!92136))

(assert (= (and bm!9068 (not c!15346)) b!92141))

(assert (= (and d!24275 res!46855) b!92133))

(assert (= (and b!92133 res!46854) b!92135))

(declare-fun m!99225 () Bool)

(assert (=> b!92133 m!99225))

(declare-fun m!99227 () Bool)

(assert (=> b!92136 m!99227))

(declare-fun m!99229 () Bool)

(assert (=> bm!9068 m!99229))

(declare-fun m!99231 () Bool)

(assert (=> b!92135 m!99231))

(declare-fun m!99233 () Bool)

(assert (=> d!24275 m!99233))

(assert (=> d!24275 m!99081))

(assert (=> d!24141 d!24275))

(declare-fun d!24277 () Bool)

(assert (=> d!24277 (isDefined!98 (getValueByKey!145 (toList!765 lt!44653) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun lt!45103 () Unit!2720)

(declare-fun choose!548 (List!1552 (_ BitVec 64)) Unit!2720)

(assert (=> d!24277 (= lt!45103 (choose!548 (toList!765 lt!44653) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun e!60072 () Bool)

(assert (=> d!24277 e!60072))

(declare-fun res!46858 () Bool)

(assert (=> d!24277 (=> (not res!46858) (not e!60072))))

(assert (=> d!24277 (= res!46858 (isStrictlySorted!301 (toList!765 lt!44653)))))

(assert (=> d!24277 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44653) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) lt!45103)))

(declare-fun b!92145 () Bool)

(assert (=> b!92145 (= e!60072 (containsKey!149 (toList!765 lt!44653) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (= (and d!24277 res!46858) b!92145))

(assert (=> d!24277 m!98305))

(assert (=> d!24277 m!98713))

(assert (=> d!24277 m!98713))

(assert (=> d!24277 m!98715))

(assert (=> d!24277 m!98305))

(declare-fun m!99235 () Bool)

(assert (=> d!24277 m!99235))

(declare-fun m!99237 () Bool)

(assert (=> d!24277 m!99237))

(assert (=> b!92145 m!98305))

(assert (=> b!92145 m!98709))

(assert (=> b!91763 d!24277))

(declare-fun d!24279 () Bool)

(declare-fun isEmpty!348 (Option!151) Bool)

(assert (=> d!24279 (= (isDefined!98 (getValueByKey!145 (toList!765 lt!44653) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))) (not (isEmpty!348 (getValueByKey!145 (toList!765 lt!44653) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))))

(declare-fun bs!3824 () Bool)

(assert (= bs!3824 d!24279))

(assert (=> bs!3824 m!98713))

(declare-fun m!99239 () Bool)

(assert (=> bs!3824 m!99239))

(assert (=> b!91763 d!24279))

(declare-fun b!92148 () Bool)

(declare-fun e!60074 () Option!151)

(assert (=> b!92148 (= e!60074 (getValueByKey!145 (t!5386 (toList!765 lt!44653)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun b!92147 () Bool)

(declare-fun e!60073 () Option!151)

(assert (=> b!92147 (= e!60073 e!60074)))

(declare-fun c!15348 () Bool)

(assert (=> b!92147 (= c!15348 (and ((_ is Cons!1548) (toList!765 lt!44653)) (not (= (_1!1144 (h!2140 (toList!765 lt!44653))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))))

(declare-fun b!92149 () Bool)

(assert (=> b!92149 (= e!60074 None!149)))

(declare-fun b!92146 () Bool)

(assert (=> b!92146 (= e!60073 (Some!150 (_2!1144 (h!2140 (toList!765 lt!44653)))))))

(declare-fun d!24281 () Bool)

(declare-fun c!15347 () Bool)

(assert (=> d!24281 (= c!15347 (and ((_ is Cons!1548) (toList!765 lt!44653)) (= (_1!1144 (h!2140 (toList!765 lt!44653))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))))))

(assert (=> d!24281 (= (getValueByKey!145 (toList!765 lt!44653) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) e!60073)))

(assert (= (and d!24281 c!15347) b!92146))

(assert (= (and d!24281 (not c!15347)) b!92147))

(assert (= (and b!92147 c!15348) b!92148))

(assert (= (and b!92147 (not c!15348)) b!92149))

(assert (=> b!92148 m!98305))

(declare-fun m!99241 () Bool)

(assert (=> b!92148 m!99241))

(assert (=> b!91763 d!24281))

(declare-fun b!92150 () Bool)

(declare-fun e!60086 () Bool)

(declare-fun e!60075 () Bool)

(assert (=> b!92150 (= e!60086 e!60075)))

(declare-fun res!46865 () Bool)

(declare-fun call!9075 () Bool)

(assert (=> b!92150 (= res!46865 call!9075)))

(assert (=> b!92150 (=> (not res!46865) (not e!60075))))

(declare-fun lt!45120 () ListLongMap!1499)

(declare-fun b!92151 () Bool)

(assert (=> b!92151 (= e!60075 (= (apply!87 lt!45120 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!15263 c!15268) lt!44644 (zeroValue!2294 newMap!16))))))

(declare-fun bm!9069 () Bool)

(declare-fun call!9078 () ListLongMap!1499)

(declare-fun call!9072 () ListLongMap!1499)

(assert (=> bm!9069 (= call!9078 call!9072)))

(declare-fun bm!9070 () Bool)

(declare-fun call!9073 () ListLongMap!1499)

(assert (=> bm!9070 (= call!9073 (getCurrentListMapNoExtraKeys!92 (_keys!4086 newMap!16) (ite c!15263 (_values!2389 newMap!16) (array!4138 (store (arr!1968 (_values!2389 newMap!16)) (index!3133 lt!44956) (ValueCellFull!948 lt!44644)) (size!2215 (_values!2389 newMap!16)))) (mask!6466 newMap!16) (ite c!15263 (ite c!15268 lt!44943 lt!44957) (extraKeys!2237 newMap!16)) (ite (and c!15263 c!15268) lt!44644 (zeroValue!2294 newMap!16)) (ite c!15263 (ite c!15268 (minValue!2294 newMap!16) lt!44644) (minValue!2294 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun d!24283 () Bool)

(declare-fun e!60077 () Bool)

(assert (=> d!24283 e!60077))

(declare-fun res!46866 () Bool)

(assert (=> d!24283 (=> (not res!46866) (not e!60077))))

(assert (=> d!24283 (= res!46866 (or (bvsge #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))))

(declare-fun lt!45113 () ListLongMap!1499)

(assert (=> d!24283 (= lt!45120 lt!45113)))

(declare-fun lt!45122 () Unit!2720)

(declare-fun e!60085 () Unit!2720)

(assert (=> d!24283 (= lt!45122 e!60085)))

(declare-fun c!15349 () Bool)

(declare-fun e!60083 () Bool)

(assert (=> d!24283 (= c!15349 e!60083)))

(declare-fun res!46860 () Bool)

(assert (=> d!24283 (=> (not res!46860) (not e!60083))))

(assert (=> d!24283 (= res!46860 (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))

(declare-fun e!60078 () ListLongMap!1499)

(assert (=> d!24283 (= lt!45113 e!60078)))

(declare-fun c!15354 () Bool)

(assert (=> d!24283 (= c!15354 (and (not (= (bvand (ite c!15263 (ite c!15268 lt!44943 lt!44957) (extraKeys!2237 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!15263 (ite c!15268 lt!44943 lt!44957) (extraKeys!2237 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24283 (validMask!0 (mask!6466 newMap!16))))

(assert (=> d!24283 (= (getCurrentListMap!457 (_keys!4086 newMap!16) (ite c!15263 (_values!2389 newMap!16) (array!4138 (store (arr!1968 (_values!2389 newMap!16)) (index!3133 lt!44956) (ValueCellFull!948 lt!44644)) (size!2215 (_values!2389 newMap!16)))) (mask!6466 newMap!16) (ite c!15263 (ite c!15268 lt!44943 lt!44957) (extraKeys!2237 newMap!16)) (ite (and c!15263 c!15268) lt!44644 (zeroValue!2294 newMap!16)) (ite c!15263 (ite c!15268 (minValue!2294 newMap!16) lt!44644) (minValue!2294 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)) lt!45120)))

(declare-fun b!92152 () Bool)

(declare-fun Unit!2739 () Unit!2720)

(assert (=> b!92152 (= e!60085 Unit!2739)))

(declare-fun bm!9071 () Bool)

(assert (=> bm!9071 (= call!9075 (contains!777 lt!45120 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92153 () Bool)

(declare-fun e!60080 () Bool)

(declare-fun call!9077 () Bool)

(assert (=> b!92153 (= e!60080 (not call!9077))))

(declare-fun b!92154 () Bool)

(declare-fun res!46867 () Bool)

(assert (=> b!92154 (=> (not res!46867) (not e!60077))))

(declare-fun e!60079 () Bool)

(assert (=> b!92154 (= res!46867 e!60079)))

(declare-fun res!46863 () Bool)

(assert (=> b!92154 (=> res!46863 e!60079)))

(declare-fun e!60084 () Bool)

(assert (=> b!92154 (= res!46863 (not e!60084))))

(declare-fun res!46862 () Bool)

(assert (=> b!92154 (=> (not res!46862) (not e!60084))))

(assert (=> b!92154 (= res!46862 (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))

(declare-fun b!92155 () Bool)

(assert (=> b!92155 (= e!60078 (+!127 call!9072 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!15263 (ite c!15268 (minValue!2294 newMap!16) lt!44644) (minValue!2294 newMap!16)))))))

(declare-fun b!92156 () Bool)

(declare-fun c!15351 () Bool)

(assert (=> b!92156 (= c!15351 (and (not (= (bvand (ite c!15263 (ite c!15268 lt!44943 lt!44957) (extraKeys!2237 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!15263 (ite c!15268 lt!44943 lt!44957) (extraKeys!2237 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!60076 () ListLongMap!1499)

(declare-fun e!60082 () ListLongMap!1499)

(assert (=> b!92156 (= e!60076 e!60082)))

(declare-fun b!92157 () Bool)

(assert (=> b!92157 (= e!60076 call!9078)))

(declare-fun b!92158 () Bool)

(assert (=> b!92158 (= e!60077 e!60080)))

(declare-fun c!15353 () Bool)

(assert (=> b!92158 (= c!15353 (not (= (bvand (ite c!15263 (ite c!15268 lt!44943 lt!44957) (extraKeys!2237 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!92159 () Bool)

(declare-fun res!46864 () Bool)

(assert (=> b!92159 (=> (not res!46864) (not e!60077))))

(assert (=> b!92159 (= res!46864 e!60086)))

(declare-fun c!15350 () Bool)

(assert (=> b!92159 (= c!15350 (not (= (bvand (ite c!15263 (ite c!15268 lt!44943 lt!44957) (extraKeys!2237 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!9072 () Bool)

(declare-fun call!9074 () ListLongMap!1499)

(declare-fun call!9076 () ListLongMap!1499)

(assert (=> bm!9072 (= call!9074 call!9076)))

(declare-fun b!92160 () Bool)

(assert (=> b!92160 (= e!60082 call!9074)))

(declare-fun b!92161 () Bool)

(declare-fun e!60087 () Bool)

(assert (=> b!92161 (= e!60080 e!60087)))

(declare-fun res!46861 () Bool)

(assert (=> b!92161 (= res!46861 call!9077)))

(assert (=> b!92161 (=> (not res!46861) (not e!60087))))

(declare-fun b!92162 () Bool)

(assert (=> b!92162 (= e!60084 (validKeyInArray!0 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9073 () Bool)

(assert (=> bm!9073 (= call!9076 call!9073)))

(declare-fun b!92163 () Bool)

(declare-fun lt!45117 () Unit!2720)

(assert (=> b!92163 (= e!60085 lt!45117)))

(declare-fun lt!45110 () ListLongMap!1499)

(assert (=> b!92163 (= lt!45110 (getCurrentListMapNoExtraKeys!92 (_keys!4086 newMap!16) (ite c!15263 (_values!2389 newMap!16) (array!4138 (store (arr!1968 (_values!2389 newMap!16)) (index!3133 lt!44956) (ValueCellFull!948 lt!44644)) (size!2215 (_values!2389 newMap!16)))) (mask!6466 newMap!16) (ite c!15263 (ite c!15268 lt!44943 lt!44957) (extraKeys!2237 newMap!16)) (ite (and c!15263 c!15268) lt!44644 (zeroValue!2294 newMap!16)) (ite c!15263 (ite c!15268 (minValue!2294 newMap!16) lt!44644) (minValue!2294 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!45124 () (_ BitVec 64))

(assert (=> b!92163 (= lt!45124 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45121 () (_ BitVec 64))

(assert (=> b!92163 (= lt!45121 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45114 () Unit!2720)

(assert (=> b!92163 (= lt!45114 (addStillContains!63 lt!45110 lt!45124 (ite (and c!15263 c!15268) lt!44644 (zeroValue!2294 newMap!16)) lt!45121))))

(assert (=> b!92163 (contains!777 (+!127 lt!45110 (tuple2!2267 lt!45124 (ite (and c!15263 c!15268) lt!44644 (zeroValue!2294 newMap!16)))) lt!45121)))

(declare-fun lt!45107 () Unit!2720)

(assert (=> b!92163 (= lt!45107 lt!45114)))

(declare-fun lt!45123 () ListLongMap!1499)

(assert (=> b!92163 (= lt!45123 (getCurrentListMapNoExtraKeys!92 (_keys!4086 newMap!16) (ite c!15263 (_values!2389 newMap!16) (array!4138 (store (arr!1968 (_values!2389 newMap!16)) (index!3133 lt!44956) (ValueCellFull!948 lt!44644)) (size!2215 (_values!2389 newMap!16)))) (mask!6466 newMap!16) (ite c!15263 (ite c!15268 lt!44943 lt!44957) (extraKeys!2237 newMap!16)) (ite (and c!15263 c!15268) lt!44644 (zeroValue!2294 newMap!16)) (ite c!15263 (ite c!15268 (minValue!2294 newMap!16) lt!44644) (minValue!2294 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!45105 () (_ BitVec 64))

(assert (=> b!92163 (= lt!45105 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45125 () (_ BitVec 64))

(assert (=> b!92163 (= lt!45125 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45111 () Unit!2720)

(assert (=> b!92163 (= lt!45111 (addApplyDifferent!63 lt!45123 lt!45105 (ite c!15263 (ite c!15268 (minValue!2294 newMap!16) lt!44644) (minValue!2294 newMap!16)) lt!45125))))

(assert (=> b!92163 (= (apply!87 (+!127 lt!45123 (tuple2!2267 lt!45105 (ite c!15263 (ite c!15268 (minValue!2294 newMap!16) lt!44644) (minValue!2294 newMap!16)))) lt!45125) (apply!87 lt!45123 lt!45125))))

(declare-fun lt!45104 () Unit!2720)

(assert (=> b!92163 (= lt!45104 lt!45111)))

(declare-fun lt!45118 () ListLongMap!1499)

(assert (=> b!92163 (= lt!45118 (getCurrentListMapNoExtraKeys!92 (_keys!4086 newMap!16) (ite c!15263 (_values!2389 newMap!16) (array!4138 (store (arr!1968 (_values!2389 newMap!16)) (index!3133 lt!44956) (ValueCellFull!948 lt!44644)) (size!2215 (_values!2389 newMap!16)))) (mask!6466 newMap!16) (ite c!15263 (ite c!15268 lt!44943 lt!44957) (extraKeys!2237 newMap!16)) (ite (and c!15263 c!15268) lt!44644 (zeroValue!2294 newMap!16)) (ite c!15263 (ite c!15268 (minValue!2294 newMap!16) lt!44644) (minValue!2294 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!45108 () (_ BitVec 64))

(assert (=> b!92163 (= lt!45108 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45112 () (_ BitVec 64))

(assert (=> b!92163 (= lt!45112 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45109 () Unit!2720)

(assert (=> b!92163 (= lt!45109 (addApplyDifferent!63 lt!45118 lt!45108 (ite (and c!15263 c!15268) lt!44644 (zeroValue!2294 newMap!16)) lt!45112))))

(assert (=> b!92163 (= (apply!87 (+!127 lt!45118 (tuple2!2267 lt!45108 (ite (and c!15263 c!15268) lt!44644 (zeroValue!2294 newMap!16)))) lt!45112) (apply!87 lt!45118 lt!45112))))

(declare-fun lt!45106 () Unit!2720)

(assert (=> b!92163 (= lt!45106 lt!45109)))

(declare-fun lt!45116 () ListLongMap!1499)

(assert (=> b!92163 (= lt!45116 (getCurrentListMapNoExtraKeys!92 (_keys!4086 newMap!16) (ite c!15263 (_values!2389 newMap!16) (array!4138 (store (arr!1968 (_values!2389 newMap!16)) (index!3133 lt!44956) (ValueCellFull!948 lt!44644)) (size!2215 (_values!2389 newMap!16)))) (mask!6466 newMap!16) (ite c!15263 (ite c!15268 lt!44943 lt!44957) (extraKeys!2237 newMap!16)) (ite (and c!15263 c!15268) lt!44644 (zeroValue!2294 newMap!16)) (ite c!15263 (ite c!15268 (minValue!2294 newMap!16) lt!44644) (minValue!2294 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!45119 () (_ BitVec 64))

(assert (=> b!92163 (= lt!45119 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45115 () (_ BitVec 64))

(assert (=> b!92163 (= lt!45115 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!92163 (= lt!45117 (addApplyDifferent!63 lt!45116 lt!45119 (ite c!15263 (ite c!15268 (minValue!2294 newMap!16) lt!44644) (minValue!2294 newMap!16)) lt!45115))))

(assert (=> b!92163 (= (apply!87 (+!127 lt!45116 (tuple2!2267 lt!45119 (ite c!15263 (ite c!15268 (minValue!2294 newMap!16) lt!44644) (minValue!2294 newMap!16)))) lt!45115) (apply!87 lt!45116 lt!45115))))

(declare-fun b!92164 () Bool)

(assert (=> b!92164 (= e!60082 call!9078)))

(declare-fun b!92165 () Bool)

(assert (=> b!92165 (= e!60078 e!60076)))

(declare-fun c!15352 () Bool)

(assert (=> b!92165 (= c!15352 (and (not (= (bvand (ite c!15263 (ite c!15268 lt!44943 lt!44957) (extraKeys!2237 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!15263 (ite c!15268 lt!44943 lt!44957) (extraKeys!2237 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!9074 () Bool)

(assert (=> bm!9074 (= call!9077 (contains!777 lt!45120 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92166 () Bool)

(assert (=> b!92166 (= e!60087 (= (apply!87 lt!45120 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!15263 (ite c!15268 (minValue!2294 newMap!16) lt!44644) (minValue!2294 newMap!16))))))

(declare-fun b!92167 () Bool)

(declare-fun e!60081 () Bool)

(assert (=> b!92167 (= e!60079 e!60081)))

(declare-fun res!46859 () Bool)

(assert (=> b!92167 (=> (not res!46859) (not e!60081))))

(assert (=> b!92167 (= res!46859 (contains!777 lt!45120 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!92167 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))

(declare-fun b!92168 () Bool)

(assert (=> b!92168 (= e!60083 (validKeyInArray!0 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9075 () Bool)

(assert (=> bm!9075 (= call!9072 (+!127 (ite c!15354 call!9073 (ite c!15352 call!9076 call!9074)) (ite (or c!15354 c!15352) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!15263 c!15268) lt!44644 (zeroValue!2294 newMap!16))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!15263 (ite c!15268 (minValue!2294 newMap!16) lt!44644) (minValue!2294 newMap!16))))))))

(declare-fun b!92169 () Bool)

(assert (=> b!92169 (= e!60086 (not call!9075))))

(declare-fun b!92170 () Bool)

(assert (=> b!92170 (= e!60081 (= (apply!87 lt!45120 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)) (get!1237 (select (arr!1968 (ite c!15263 (_values!2389 newMap!16) (array!4138 (store (arr!1968 (_values!2389 newMap!16)) (index!3133 lt!44956) (ValueCellFull!948 lt!44644)) (size!2215 (_values!2389 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!354 (defaultEntry!2406 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!92170 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2215 (ite c!15263 (_values!2389 newMap!16) (array!4138 (store (arr!1968 (_values!2389 newMap!16)) (index!3133 lt!44956) (ValueCellFull!948 lt!44644)) (size!2215 (_values!2389 newMap!16)))))))))

(assert (=> b!92170 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))

(assert (= (and d!24283 c!15354) b!92155))

(assert (= (and d!24283 (not c!15354)) b!92165))

(assert (= (and b!92165 c!15352) b!92157))

(assert (= (and b!92165 (not c!15352)) b!92156))

(assert (= (and b!92156 c!15351) b!92164))

(assert (= (and b!92156 (not c!15351)) b!92160))

(assert (= (or b!92164 b!92160) bm!9072))

(assert (= (or b!92157 bm!9072) bm!9073))

(assert (= (or b!92157 b!92164) bm!9069))

(assert (= (or b!92155 bm!9073) bm!9070))

(assert (= (or b!92155 bm!9069) bm!9075))

(assert (= (and d!24283 res!46860) b!92168))

(assert (= (and d!24283 c!15349) b!92163))

(assert (= (and d!24283 (not c!15349)) b!92152))

(assert (= (and d!24283 res!46866) b!92154))

(assert (= (and b!92154 res!46862) b!92162))

(assert (= (and b!92154 (not res!46863)) b!92167))

(assert (= (and b!92167 res!46859) b!92170))

(assert (= (and b!92154 res!46867) b!92159))

(assert (= (and b!92159 c!15350) b!92150))

(assert (= (and b!92159 (not c!15350)) b!92169))

(assert (= (and b!92150 res!46865) b!92151))

(assert (= (or b!92150 b!92169) bm!9071))

(assert (= (and b!92159 res!46864) b!92158))

(assert (= (and b!92158 c!15353) b!92161))

(assert (= (and b!92158 (not c!15353)) b!92153))

(assert (= (and b!92161 res!46861) b!92166))

(assert (= (or b!92161 b!92153) bm!9074))

(declare-fun b_lambda!4071 () Bool)

(assert (=> (not b_lambda!4071) (not b!92170)))

(assert (=> b!92170 t!5397))

(declare-fun b_and!5603 () Bool)

(assert (= b_and!5599 (and (=> t!5397 result!3101) b_and!5603)))

(assert (=> b!92170 t!5399))

(declare-fun b_and!5605 () Bool)

(assert (= b_and!5601 (and (=> t!5399 result!3103) b_and!5605)))

(assert (=> d!24283 m!98855))

(declare-fun m!99243 () Bool)

(assert (=> b!92155 m!99243))

(assert (=> b!92162 m!99147))

(assert (=> b!92162 m!99147))

(assert (=> b!92162 m!99149))

(declare-fun m!99245 () Bool)

(assert (=> bm!9074 m!99245))

(declare-fun m!99247 () Bool)

(assert (=> b!92163 m!99247))

(declare-fun m!99249 () Bool)

(assert (=> b!92163 m!99249))

(assert (=> b!92163 m!99249))

(declare-fun m!99251 () Bool)

(assert (=> b!92163 m!99251))

(declare-fun m!99253 () Bool)

(assert (=> b!92163 m!99253))

(declare-fun m!99255 () Bool)

(assert (=> b!92163 m!99255))

(declare-fun m!99257 () Bool)

(assert (=> b!92163 m!99257))

(declare-fun m!99259 () Bool)

(assert (=> b!92163 m!99259))

(assert (=> b!92163 m!99257))

(declare-fun m!99261 () Bool)

(assert (=> b!92163 m!99261))

(declare-fun m!99263 () Bool)

(assert (=> b!92163 m!99263))

(declare-fun m!99265 () Bool)

(assert (=> b!92163 m!99265))

(assert (=> b!92163 m!99253))

(declare-fun m!99267 () Bool)

(assert (=> b!92163 m!99267))

(declare-fun m!99269 () Bool)

(assert (=> b!92163 m!99269))

(declare-fun m!99271 () Bool)

(assert (=> b!92163 m!99271))

(assert (=> b!92163 m!99269))

(declare-fun m!99273 () Bool)

(assert (=> b!92163 m!99273))

(assert (=> b!92163 m!99147))

(declare-fun m!99275 () Bool)

(assert (=> b!92163 m!99275))

(declare-fun m!99277 () Bool)

(assert (=> b!92163 m!99277))

(assert (=> b!92168 m!99147))

(assert (=> b!92168 m!99147))

(assert (=> b!92168 m!99149))

(assert (=> b!92167 m!99147))

(assert (=> b!92167 m!99147))

(declare-fun m!99279 () Bool)

(assert (=> b!92167 m!99279))

(declare-fun m!99281 () Bool)

(assert (=> bm!9071 m!99281))

(declare-fun m!99283 () Bool)

(assert (=> b!92166 m!99283))

(assert (=> b!92170 m!99191))

(declare-fun m!99285 () Bool)

(assert (=> b!92170 m!99285))

(assert (=> b!92170 m!99147))

(declare-fun m!99287 () Bool)

(assert (=> b!92170 m!99287))

(assert (=> b!92170 m!99147))

(assert (=> b!92170 m!99285))

(assert (=> b!92170 m!99191))

(declare-fun m!99289 () Bool)

(assert (=> b!92170 m!99289))

(declare-fun m!99291 () Bool)

(assert (=> bm!9075 m!99291))

(assert (=> bm!9070 m!99259))

(declare-fun m!99293 () Bool)

(assert (=> b!92151 m!99293))

(assert (=> bm!9019 d!24283))

(declare-fun b!92171 () Bool)

(declare-fun e!60091 () Bool)

(declare-fun e!60088 () Bool)

(assert (=> b!92171 (= e!60091 e!60088)))

(declare-fun res!46868 () Bool)

(assert (=> b!92171 (=> (not res!46868) (not e!60088))))

(declare-fun e!60090 () Bool)

(assert (=> b!92171 (= res!46868 (not e!60090))))

(declare-fun res!46869 () Bool)

(assert (=> b!92171 (=> (not res!46869) (not e!60090))))

(assert (=> b!92171 (= res!46869 (validKeyInArray!0 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9076 () Bool)

(declare-fun call!9079 () Bool)

(declare-fun c!15355 () Bool)

(assert (=> bm!9076 (= call!9079 (arrayNoDuplicates!0 (_keys!4086 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!15355 (Cons!1547 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000) Nil!1548) Nil!1548)))))

(declare-fun b!92172 () Bool)

(assert (=> b!92172 (= e!60090 (contains!779 Nil!1548 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!92173 () Bool)

(declare-fun e!60089 () Bool)

(assert (=> b!92173 (= e!60089 call!9079)))

(declare-fun b!92174 () Bool)

(assert (=> b!92174 (= e!60089 call!9079)))

(declare-fun d!24285 () Bool)

(declare-fun res!46870 () Bool)

(assert (=> d!24285 (=> res!46870 e!60091)))

(assert (=> d!24285 (= res!46870 (bvsge #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))

(assert (=> d!24285 (= (arrayNoDuplicates!0 (_keys!4086 newMap!16) #b00000000000000000000000000000000 Nil!1548) e!60091)))

(declare-fun b!92175 () Bool)

(assert (=> b!92175 (= e!60088 e!60089)))

(assert (=> b!92175 (= c!15355 (validKeyInArray!0 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!24285 (not res!46870)) b!92171))

(assert (= (and b!92171 res!46869) b!92172))

(assert (= (and b!92171 res!46868) b!92175))

(assert (= (and b!92175 c!15355) b!92174))

(assert (= (and b!92175 (not c!15355)) b!92173))

(assert (= (or b!92174 b!92173) bm!9076))

(assert (=> b!92171 m!99147))

(assert (=> b!92171 m!99147))

(assert (=> b!92171 m!99149))

(assert (=> bm!9076 m!99147))

(declare-fun m!99295 () Bool)

(assert (=> bm!9076 m!99295))

(assert (=> b!92172 m!99147))

(assert (=> b!92172 m!99147))

(declare-fun m!99297 () Bool)

(assert (=> b!92172 m!99297))

(assert (=> b!92175 m!99147))

(assert (=> b!92175 m!99147))

(assert (=> b!92175 m!99149))

(assert (=> b!91735 d!24285))

(declare-fun d!24287 () Bool)

(declare-fun e!60092 () Bool)

(assert (=> d!24287 e!60092))

(declare-fun res!46871 () Bool)

(assert (=> d!24287 (=> (not res!46871) (not e!60092))))

(declare-fun lt!45126 () ListLongMap!1499)

(assert (=> d!24287 (= res!46871 (contains!777 lt!45126 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(declare-fun lt!45128 () List!1552)

(assert (=> d!24287 (= lt!45126 (ListLongMap!1500 lt!45128))))

(declare-fun lt!45127 () Unit!2720)

(declare-fun lt!45129 () Unit!2720)

(assert (=> d!24287 (= lt!45127 lt!45129)))

(assert (=> d!24287 (= (getValueByKey!145 lt!45128 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))) (Some!150 (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (=> d!24287 (= lt!45129 (lemmaContainsTupThenGetReturnValue!62 lt!45128 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (=> d!24287 (= lt!45128 (insertStrictlySorted!65 (toList!765 lt!44652) (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (=> d!24287 (= (+!127 lt!44652 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) lt!45126)))

(declare-fun b!92176 () Bool)

(declare-fun res!46872 () Bool)

(assert (=> b!92176 (=> (not res!46872) (not e!60092))))

(assert (=> b!92176 (= res!46872 (= (getValueByKey!145 (toList!765 lt!45126) (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))) (Some!150 (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))))

(declare-fun b!92177 () Bool)

(assert (=> b!92177 (= e!60092 (contains!780 (toList!765 lt!45126) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))

(assert (= (and d!24287 res!46871) b!92176))

(assert (= (and b!92176 res!46872) b!92177))

(declare-fun m!99299 () Bool)

(assert (=> d!24287 m!99299))

(declare-fun m!99301 () Bool)

(assert (=> d!24287 m!99301))

(declare-fun m!99303 () Bool)

(assert (=> d!24287 m!99303))

(declare-fun m!99305 () Bool)

(assert (=> d!24287 m!99305))

(declare-fun m!99307 () Bool)

(assert (=> b!92176 m!99307))

(declare-fun m!99309 () Bool)

(assert (=> b!92177 m!99309))

(assert (=> d!24145 d!24287))

(declare-fun d!24289 () Bool)

(declare-fun e!60093 () Bool)

(assert (=> d!24289 e!60093))

(declare-fun res!46873 () Bool)

(assert (=> d!24289 (=> (not res!46873) (not e!60093))))

(declare-fun lt!45130 () ListLongMap!1499)

(assert (=> d!24289 (= res!46873 (contains!777 lt!45130 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(declare-fun lt!45132 () List!1552)

(assert (=> d!24289 (= lt!45130 (ListLongMap!1500 lt!45132))))

(declare-fun lt!45131 () Unit!2720)

(declare-fun lt!45133 () Unit!2720)

(assert (=> d!24289 (= lt!45131 lt!45133)))

(assert (=> d!24289 (= (getValueByKey!145 lt!45132 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))) (Some!150 (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (=> d!24289 (= lt!45133 (lemmaContainsTupThenGetReturnValue!62 lt!45132 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (=> d!24289 (= lt!45132 (insertStrictlySorted!65 (toList!765 (+!127 lt!44652 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (=> d!24289 (= (+!127 (+!127 lt!44652 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) lt!45130)))

(declare-fun b!92178 () Bool)

(declare-fun res!46874 () Bool)

(assert (=> b!92178 (=> (not res!46874) (not e!60093))))

(assert (=> b!92178 (= res!46874 (= (getValueByKey!145 (toList!765 lt!45130) (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))) (Some!150 (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))))

(declare-fun b!92179 () Bool)

(assert (=> b!92179 (= e!60093 (contains!780 (toList!765 lt!45130) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))

(assert (= (and d!24289 res!46873) b!92178))

(assert (= (and b!92178 res!46874) b!92179))

(declare-fun m!99311 () Bool)

(assert (=> d!24289 m!99311))

(declare-fun m!99313 () Bool)

(assert (=> d!24289 m!99313))

(declare-fun m!99315 () Bool)

(assert (=> d!24289 m!99315))

(declare-fun m!99317 () Bool)

(assert (=> d!24289 m!99317))

(declare-fun m!99319 () Bool)

(assert (=> b!92178 m!99319))

(declare-fun m!99321 () Bool)

(assert (=> b!92179 m!99321))

(assert (=> d!24145 d!24289))

(declare-fun d!24291 () Bool)

(assert (=> d!24291 (= (+!127 (+!127 lt!44652 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (+!127 (+!127 lt!44652 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))

(assert (=> d!24291 true))

(declare-fun _$28!154 () Unit!2720)

(assert (=> d!24291 (= (choose!544 lt!44652 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))) _$28!154)))

(declare-fun bs!3825 () Bool)

(assert (= bs!3825 d!24291))

(assert (=> bs!3825 m!98555))

(assert (=> bs!3825 m!98555))

(assert (=> bs!3825 m!98557))

(assert (=> bs!3825 m!98553))

(assert (=> bs!3825 m!98553))

(assert (=> bs!3825 m!98559))

(assert (=> d!24145 d!24291))

(declare-fun d!24293 () Bool)

(declare-fun e!60094 () Bool)

(assert (=> d!24293 e!60094))

(declare-fun res!46875 () Bool)

(assert (=> d!24293 (=> (not res!46875) (not e!60094))))

(declare-fun lt!45134 () ListLongMap!1499)

(assert (=> d!24293 (= res!46875 (contains!777 lt!45134 (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun lt!45136 () List!1552)

(assert (=> d!24293 (= lt!45134 (ListLongMap!1500 lt!45136))))

(declare-fun lt!45135 () Unit!2720)

(declare-fun lt!45137 () Unit!2720)

(assert (=> d!24293 (= lt!45135 lt!45137)))

(assert (=> d!24293 (= (getValueByKey!145 lt!45136 (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24293 (= lt!45137 (lemmaContainsTupThenGetReturnValue!62 lt!45136 (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24293 (= lt!45136 (insertStrictlySorted!65 (toList!765 lt!44652) (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24293 (= (+!127 lt!44652 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!45134)))

(declare-fun b!92180 () Bool)

(declare-fun res!46876 () Bool)

(assert (=> b!92180 (=> (not res!46876) (not e!60094))))

(assert (=> b!92180 (= res!46876 (= (getValueByKey!145 (toList!765 lt!45134) (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun b!92181 () Bool)

(assert (=> b!92181 (= e!60094 (contains!780 (toList!765 lt!45134) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24293 res!46875) b!92180))

(assert (= (and b!92180 res!46876) b!92181))

(declare-fun m!99323 () Bool)

(assert (=> d!24293 m!99323))

(declare-fun m!99325 () Bool)

(assert (=> d!24293 m!99325))

(declare-fun m!99327 () Bool)

(assert (=> d!24293 m!99327))

(declare-fun m!99329 () Bool)

(assert (=> d!24293 m!99329))

(declare-fun m!99331 () Bool)

(assert (=> b!92180 m!99331))

(declare-fun m!99333 () Bool)

(assert (=> b!92181 m!99333))

(assert (=> d!24145 d!24293))

(declare-fun d!24295 () Bool)

(declare-fun e!60095 () Bool)

(assert (=> d!24295 e!60095))

(declare-fun res!46877 () Bool)

(assert (=> d!24295 (=> (not res!46877) (not e!60095))))

(declare-fun lt!45138 () ListLongMap!1499)

(assert (=> d!24295 (= res!46877 (contains!777 lt!45138 (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun lt!45140 () List!1552)

(assert (=> d!24295 (= lt!45138 (ListLongMap!1500 lt!45140))))

(declare-fun lt!45139 () Unit!2720)

(declare-fun lt!45141 () Unit!2720)

(assert (=> d!24295 (= lt!45139 lt!45141)))

(assert (=> d!24295 (= (getValueByKey!145 lt!45140 (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24295 (= lt!45141 (lemmaContainsTupThenGetReturnValue!62 lt!45140 (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24295 (= lt!45140 (insertStrictlySorted!65 (toList!765 (+!127 lt!44652 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))) (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24295 (= (+!127 (+!127 lt!44652 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!45138)))

(declare-fun b!92182 () Bool)

(declare-fun res!46878 () Bool)

(assert (=> b!92182 (=> (not res!46878) (not e!60095))))

(assert (=> b!92182 (= res!46878 (= (getValueByKey!145 (toList!765 lt!45138) (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun b!92183 () Bool)

(assert (=> b!92183 (= e!60095 (contains!780 (toList!765 lt!45138) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24295 res!46877) b!92182))

(assert (= (and b!92182 res!46878) b!92183))

(declare-fun m!99335 () Bool)

(assert (=> d!24295 m!99335))

(declare-fun m!99337 () Bool)

(assert (=> d!24295 m!99337))

(declare-fun m!99339 () Bool)

(assert (=> d!24295 m!99339))

(declare-fun m!99341 () Bool)

(assert (=> d!24295 m!99341))

(declare-fun m!99343 () Bool)

(assert (=> b!92182 m!99343))

(declare-fun m!99345 () Bool)

(assert (=> b!92183 m!99345))

(assert (=> d!24145 d!24295))

(declare-fun b!92218 () Bool)

(declare-fun res!46904 () Bool)

(declare-fun e!60115 () Bool)

(assert (=> b!92218 (=> (not res!46904) (not e!60115))))

(declare-fun call!9088 () Bool)

(assert (=> b!92218 (= res!46904 call!9088)))

(declare-fun e!60113 () Bool)

(assert (=> b!92218 (= e!60113 e!60115)))

(declare-fun b!92219 () Bool)

(declare-fun e!60118 () Unit!2720)

(declare-fun Unit!2740 () Unit!2720)

(assert (=> b!92219 (= e!60118 Unit!2740)))

(declare-fun b!92220 () Bool)

(declare-fun call!9089 () Bool)

(assert (=> b!92220 (= e!60115 (not call!9089))))

(declare-fun b!92221 () Bool)

(declare-fun c!15364 () Bool)

(declare-fun lt!45214 () SeekEntryResult!248)

(assert (=> b!92221 (= c!15364 ((_ is MissingVacant!248) lt!45214))))

(declare-fun e!60119 () Bool)

(assert (=> b!92221 (= e!60113 e!60119)))

(declare-fun b!92222 () Bool)

(declare-fun res!46898 () Bool)

(declare-fun call!9090 () Bool)

(assert (=> b!92222 (= res!46898 call!9090)))

(declare-fun e!60116 () Bool)

(assert (=> b!92222 (=> (not res!46898) (not e!60116))))

(declare-fun b!92223 () Bool)

(declare-fun e!60112 () Bool)

(assert (=> b!92223 (= e!60119 e!60112)))

(declare-fun res!46899 () Bool)

(assert (=> b!92223 (= res!46899 call!9088)))

(assert (=> b!92223 (=> (not res!46899) (not e!60112))))

(declare-fun bm!9085 () Bool)

(declare-fun call!9091 () SeekEntryResult!248)

(assert (=> bm!9085 (= call!9091 (seekEntryOrOpen!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (_keys!4086 newMap!16) (mask!6466 newMap!16)))))

(declare-fun b!92224 () Bool)

(assert (=> b!92224 (= e!60112 (not call!9089))))

(declare-fun b!92225 () Bool)

(declare-fun e!60117 () Unit!2720)

(declare-fun lt!45203 () Unit!2720)

(assert (=> b!92225 (= e!60117 lt!45203)))

(assert (=> b!92225 (= lt!45203 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!36 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (defaultEntry!2406 newMap!16)))))

(assert (=> b!92225 (= lt!45214 call!9091)))

(declare-fun c!15365 () Bool)

(assert (=> b!92225 (= c!15365 ((_ is MissingZero!248) lt!45214))))

(assert (=> b!92225 e!60113))

(declare-fun bm!9086 () Bool)

(assert (=> bm!9086 (= call!9089 (arrayContainsKey!0 (_keys!4086 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun c!15366 () Bool)

(declare-fun bm!9087 () Bool)

(declare-fun lt!45213 () SeekEntryResult!248)

(assert (=> bm!9087 (= call!9090 (inRange!0 (ite c!15366 (index!3133 lt!45213) (ite c!15365 (index!3132 lt!45214) (index!3135 lt!45214))) (mask!6466 newMap!16)))))

(declare-fun b!92227 () Bool)

(declare-fun Unit!2741 () Unit!2720)

(assert (=> b!92227 (= e!60117 Unit!2741)))

(declare-fun lt!45210 () Unit!2720)

(assert (=> b!92227 (= lt!45210 (lemmaInListMapThenSeekEntryOrOpenFindsIt!36 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (defaultEntry!2406 newMap!16)))))

(assert (=> b!92227 (= lt!45213 call!9091)))

(declare-fun res!46903 () Bool)

(assert (=> b!92227 (= res!46903 ((_ is Found!248) lt!45213))))

(assert (=> b!92227 (=> (not res!46903) (not e!60116))))

(assert (=> b!92227 e!60116))

(declare-fun lt!45207 () Unit!2720)

(assert (=> b!92227 (= lt!45207 lt!45210)))

(assert (=> b!92227 false))

(declare-fun b!92228 () Bool)

(assert (=> b!92228 (= e!60116 (= (select (arr!1967 (_keys!4086 newMap!16)) (index!3133 lt!45213)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun b!92229 () Bool)

(assert (=> b!92229 (= e!60119 ((_ is Undefined!248) lt!45214))))

(declare-fun b!92230 () Bool)

(declare-fun lt!45221 () tuple2!2268)

(declare-fun e!60114 () Bool)

(assert (=> b!92230 (= e!60114 (= (map!1222 (_2!1145 lt!45221)) (+!127 (map!1222 newMap!16) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(declare-fun bm!9088 () Bool)

(assert (=> bm!9088 (= call!9088 call!9090)))

(declare-fun b!92231 () Bool)

(declare-fun res!46905 () Bool)

(assert (=> b!92231 (=> (not res!46905) (not e!60114))))

(assert (=> b!92231 (= res!46905 (valid!353 (_2!1145 lt!45221)))))

(declare-fun b!92232 () Bool)

(declare-fun Unit!2742 () Unit!2720)

(assert (=> b!92232 (= e!60118 Unit!2742)))

(declare-fun lt!45205 () Unit!2720)

(declare-fun lemmaArrayContainsKeyThenInListMap!22 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 (_ BitVec 64) (_ BitVec 32) Int) Unit!2720)

(assert (=> b!92232 (= lt!45205 (lemmaArrayContainsKeyThenInListMap!22 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(assert (=> b!92232 (contains!777 (getCurrentListMap!457 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))))

(declare-fun lt!45216 () Unit!2720)

(assert (=> b!92232 (= lt!45216 lt!45205)))

(assert (=> b!92232 false))

(declare-fun d!24297 () Bool)

(assert (=> d!24297 e!60114))

(declare-fun res!46901 () Bool)

(assert (=> d!24297 (=> (not res!46901) (not e!60114))))

(assert (=> d!24297 (= res!46901 (_1!1145 lt!45221))))

(assert (=> d!24297 (= lt!45221 (tuple2!2269 true (LongMapFixedSize!805 (defaultEntry!2406 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (bvadd (_size!451 newMap!16) #b00000000000000000000000000000001) (array!4136 (store (arr!1967 (_keys!4086 newMap!16)) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) (size!2214 (_keys!4086 newMap!16))) (array!4138 (store (arr!1968 (_values!2389 newMap!16)) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (ValueCellFull!948 lt!44644)) (size!2215 (_values!2389 newMap!16))) (_vacant!451 newMap!16))))))

(declare-fun lt!45223 () Unit!2720)

(declare-fun lt!45212 () Unit!2720)

(assert (=> d!24297 (= lt!45223 lt!45212)))

(declare-fun lt!45228 () array!4135)

(declare-fun lt!45208 () array!4137)

(assert (=> d!24297 (contains!777 (getCurrentListMap!457 lt!45228 lt!45208 (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)) (select (store (arr!1967 (_keys!4086 newMap!16)) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956))))))

(assert (=> d!24297 (= lt!45212 (lemmaValidKeyInArrayIsInListMap!97 lt!45228 lt!45208 (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (defaultEntry!2406 newMap!16)))))

(assert (=> d!24297 (= lt!45208 (array!4138 (store (arr!1968 (_values!2389 newMap!16)) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (ValueCellFull!948 lt!44644)) (size!2215 (_values!2389 newMap!16))))))

(assert (=> d!24297 (= lt!45228 (array!4136 (store (arr!1967 (_keys!4086 newMap!16)) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) (size!2214 (_keys!4086 newMap!16))))))

(declare-fun lt!45209 () Unit!2720)

(declare-fun lt!45219 () Unit!2720)

(assert (=> d!24297 (= lt!45209 lt!45219)))

(declare-fun lt!45229 () array!4135)

(assert (=> d!24297 (= (arrayCountValidKeys!0 lt!45229 (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (bvadd (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4135 (_ BitVec 32)) Unit!2720)

(assert (=> d!24297 (= lt!45219 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!45229 (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956))))))

(assert (=> d!24297 (= lt!45229 (array!4136 (store (arr!1967 (_keys!4086 newMap!16)) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) (size!2214 (_keys!4086 newMap!16))))))

(declare-fun lt!45204 () Unit!2720)

(declare-fun lt!45226 () Unit!2720)

(assert (=> d!24297 (= lt!45204 lt!45226)))

(declare-fun lt!45218 () array!4135)

(assert (=> d!24297 (arrayContainsKey!0 lt!45218 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4135 (_ BitVec 64) (_ BitVec 32)) Unit!2720)

(assert (=> d!24297 (= lt!45226 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!45218 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956))))))

(assert (=> d!24297 (= lt!45218 (array!4136 (store (arr!1967 (_keys!4086 newMap!16)) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) (size!2214 (_keys!4086 newMap!16))))))

(declare-fun lt!45230 () Unit!2720)

(declare-fun lt!45202 () Unit!2720)

(assert (=> d!24297 (= lt!45230 lt!45202)))

(assert (=> d!24297 (= (+!127 (getCurrentListMap!457 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (getCurrentListMap!457 (array!4136 (store (arr!1967 (_keys!4086 newMap!16)) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) (size!2214 (_keys!4086 newMap!16))) (array!4138 (store (arr!1968 (_values!2389 newMap!16)) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (ValueCellFull!948 lt!44644)) (size!2215 (_values!2389 newMap!16))) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!22 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 (_ BitVec 32) (_ BitVec 64) V!3091 Int) Unit!2720)

(assert (=> d!24297 (= lt!45202 (lemmaAddValidKeyToArrayThenAddPairToListMap!22 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!45206 () Unit!2720)

(declare-fun lt!45224 () Unit!2720)

(assert (=> d!24297 (= lt!45206 lt!45224)))

(assert (=> d!24297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4136 (store (arr!1967 (_keys!4086 newMap!16)) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) (size!2214 (_keys!4086 newMap!16))) (mask!6466 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4135 (_ BitVec 32) (_ BitVec 32)) Unit!2720)

(assert (=> d!24297 (= lt!45224 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (_keys!4086 newMap!16) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (mask!6466 newMap!16)))))

(declare-fun lt!45231 () Unit!2720)

(declare-fun lt!45217 () Unit!2720)

(assert (=> d!24297 (= lt!45231 lt!45217)))

(assert (=> d!24297 (= (arrayCountValidKeys!0 (array!4136 (store (arr!1967 (_keys!4086 newMap!16)) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) (size!2214 (_keys!4086 newMap!16))) #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4086 newMap!16) #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4135 (_ BitVec 32) (_ BitVec 64)) Unit!2720)

(assert (=> d!24297 (= lt!45217 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4086 newMap!16) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun lt!45227 () Unit!2720)

(declare-fun lt!45222 () Unit!2720)

(assert (=> d!24297 (= lt!45227 lt!45222)))

(declare-fun lt!45225 () (_ BitVec 32))

(declare-fun lt!45215 () List!1551)

(assert (=> d!24297 (arrayNoDuplicates!0 (array!4136 (store (arr!1967 (_keys!4086 newMap!16)) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) (size!2214 (_keys!4086 newMap!16))) lt!45225 lt!45215)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4135 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1551) Unit!2720)

(assert (=> d!24297 (= lt!45222 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4086 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956)) lt!45225 lt!45215))))

(assert (=> d!24297 (= lt!45215 Nil!1548)))

(assert (=> d!24297 (= lt!45225 #b00000000000000000000000000000000)))

(declare-fun lt!45211 () Unit!2720)

(assert (=> d!24297 (= lt!45211 e!60118)))

(declare-fun c!15367 () Bool)

(assert (=> d!24297 (= c!15367 (arrayContainsKey!0 (_keys!4086 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!45220 () Unit!2720)

(assert (=> d!24297 (= lt!45220 e!60117)))

(assert (=> d!24297 (= c!15366 (contains!777 (getCurrentListMap!457 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> d!24297 (valid!353 newMap!16)))

(assert (=> d!24297 (= (updateHelperNewKey!36 newMap!16 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644 (ite c!15267 (index!3135 lt!44956) (index!3132 lt!44956))) lt!45221)))

(declare-fun b!92226 () Bool)

(declare-fun res!46902 () Bool)

(assert (=> b!92226 (=> (not res!46902) (not e!60114))))

(assert (=> b!92226 (= res!46902 (contains!777 (map!1222 (_2!1145 lt!45221)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun b!92233 () Bool)

(declare-fun res!46900 () Bool)

(assert (=> b!92233 (=> (not res!46900) (not e!60115))))

(assert (=> b!92233 (= res!46900 (= (select (arr!1967 (_keys!4086 newMap!16)) (index!3132 lt!45214)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92234 () Bool)

(declare-fun res!46897 () Bool)

(assert (=> b!92234 (= res!46897 (= (select (arr!1967 (_keys!4086 newMap!16)) (index!3135 lt!45214)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92234 (=> (not res!46897) (not e!60112))))

(assert (= (and d!24297 c!15366) b!92227))

(assert (= (and d!24297 (not c!15366)) b!92225))

(assert (= (and b!92227 res!46903) b!92222))

(assert (= (and b!92222 res!46898) b!92228))

(assert (= (and b!92225 c!15365) b!92218))

(assert (= (and b!92225 (not c!15365)) b!92221))

(assert (= (and b!92218 res!46904) b!92233))

(assert (= (and b!92233 res!46900) b!92220))

(assert (= (and b!92221 c!15364) b!92223))

(assert (= (and b!92221 (not c!15364)) b!92229))

(assert (= (and b!92223 res!46899) b!92234))

(assert (= (and b!92234 res!46897) b!92224))

(assert (= (or b!92218 b!92223) bm!9088))

(assert (= (or b!92220 b!92224) bm!9086))

(assert (= (or b!92222 bm!9088) bm!9087))

(assert (= (or b!92227 b!92225) bm!9085))

(assert (= (and d!24297 c!15367) b!92232))

(assert (= (and d!24297 (not c!15367)) b!92219))

(assert (= (and d!24297 res!46901) b!92231))

(assert (= (and b!92231 res!46905) b!92226))

(assert (= (and b!92226 res!46902) b!92230))

(declare-fun m!99347 () Bool)

(assert (=> b!92231 m!99347))

(assert (=> bm!9085 m!98305))

(assert (=> bm!9085 m!98729))

(declare-fun m!99349 () Bool)

(assert (=> b!92230 m!99349))

(assert (=> b!92230 m!98311))

(assert (=> b!92230 m!98311))

(declare-fun m!99351 () Bool)

(assert (=> b!92230 m!99351))

(assert (=> b!92225 m!98305))

(assert (=> b!92225 m!98769))

(assert (=> b!92232 m!98305))

(declare-fun m!99353 () Bool)

(assert (=> b!92232 m!99353))

(assert (=> b!92232 m!98661))

(assert (=> b!92232 m!98661))

(assert (=> b!92232 m!98305))

(declare-fun m!99355 () Bool)

(assert (=> b!92232 m!99355))

(assert (=> b!92227 m!98305))

(assert (=> b!92227 m!98721))

(declare-fun m!99357 () Bool)

(assert (=> b!92228 m!99357))

(assert (=> b!92226 m!99349))

(assert (=> b!92226 m!99349))

(assert (=> b!92226 m!98305))

(declare-fun m!99359 () Bool)

(assert (=> b!92226 m!99359))

(declare-fun m!99361 () Bool)

(assert (=> d!24297 m!99361))

(assert (=> d!24297 m!98305))

(declare-fun m!99363 () Bool)

(assert (=> d!24297 m!99363))

(assert (=> d!24297 m!98655))

(assert (=> d!24297 m!98661))

(assert (=> d!24297 m!98305))

(assert (=> d!24297 m!99355))

(assert (=> d!24297 m!98305))

(declare-fun m!99365 () Bool)

(assert (=> d!24297 m!99365))

(declare-fun m!99367 () Bool)

(assert (=> d!24297 m!99367))

(assert (=> d!24297 m!98305))

(declare-fun m!99369 () Bool)

(assert (=> d!24297 m!99369))

(assert (=> d!24297 m!98305))

(assert (=> d!24297 m!98743))

(assert (=> d!24297 m!98365))

(declare-fun m!99371 () Bool)

(assert (=> d!24297 m!99371))

(assert (=> d!24297 m!98305))

(declare-fun m!99373 () Bool)

(assert (=> d!24297 m!99373))

(assert (=> d!24297 m!98661))

(declare-fun m!99375 () Bool)

(assert (=> d!24297 m!99375))

(declare-fun m!99377 () Bool)

(assert (=> d!24297 m!99377))

(assert (=> d!24297 m!98305))

(declare-fun m!99379 () Bool)

(assert (=> d!24297 m!99379))

(assert (=> d!24297 m!98661))

(declare-fun m!99381 () Bool)

(assert (=> d!24297 m!99381))

(declare-fun m!99383 () Bool)

(assert (=> d!24297 m!99383))

(declare-fun m!99385 () Bool)

(assert (=> d!24297 m!99385))

(declare-fun m!99387 () Bool)

(assert (=> d!24297 m!99387))

(declare-fun m!99389 () Bool)

(assert (=> d!24297 m!99389))

(assert (=> d!24297 m!98305))

(declare-fun m!99391 () Bool)

(assert (=> d!24297 m!99391))

(assert (=> d!24297 m!99383))

(assert (=> d!24297 m!99389))

(declare-fun m!99393 () Bool)

(assert (=> d!24297 m!99393))

(declare-fun m!99395 () Bool)

(assert (=> d!24297 m!99395))

(declare-fun m!99397 () Bool)

(assert (=> d!24297 m!99397))

(assert (=> bm!9086 m!98305))

(assert (=> bm!9086 m!98743))

(declare-fun m!99399 () Bool)

(assert (=> b!92233 m!99399))

(declare-fun m!99401 () Bool)

(assert (=> b!92234 m!99401))

(declare-fun m!99403 () Bool)

(assert (=> bm!9087 m!99403))

(assert (=> bm!9035 d!24297))

(assert (=> d!24119 d!24125))

(declare-fun d!24299 () Bool)

(assert (=> d!24299 (arrayNoDuplicates!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) from!355 Nil!1548)))

(assert (=> d!24299 true))

(declare-fun _$71!123 () Unit!2720)

(assert (=> d!24299 (= (choose!39 (_keys!4086 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!123)))

(declare-fun bs!3826 () Bool)

(assert (= bs!3826 d!24299))

(assert (=> bs!3826 m!98327))

(assert (=> d!24119 d!24299))

(declare-fun d!24301 () Bool)

(declare-fun e!60121 () Bool)

(assert (=> d!24301 e!60121))

(declare-fun res!46906 () Bool)

(assert (=> d!24301 (=> res!46906 e!60121)))

(declare-fun lt!45233 () Bool)

(assert (=> d!24301 (= res!46906 (not lt!45233))))

(declare-fun lt!45232 () Bool)

(assert (=> d!24301 (= lt!45233 lt!45232)))

(declare-fun lt!45235 () Unit!2720)

(declare-fun e!60120 () Unit!2720)

(assert (=> d!24301 (= lt!45235 e!60120)))

(declare-fun c!15368 () Bool)

(assert (=> d!24301 (= c!15368 lt!45232)))

(assert (=> d!24301 (= lt!45232 (containsKey!149 (toList!765 lt!44827) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24301 (= (contains!777 lt!44827 #b1000000000000000000000000000000000000000000000000000000000000000) lt!45233)))

(declare-fun b!92235 () Bool)

(declare-fun lt!45234 () Unit!2720)

(assert (=> b!92235 (= e!60120 lt!45234)))

(assert (=> b!92235 (= lt!45234 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44827) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92235 (isDefined!98 (getValueByKey!145 (toList!765 lt!44827) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92236 () Bool)

(declare-fun Unit!2743 () Unit!2720)

(assert (=> b!92236 (= e!60120 Unit!2743)))

(declare-fun b!92237 () Bool)

(assert (=> b!92237 (= e!60121 (isDefined!98 (getValueByKey!145 (toList!765 lt!44827) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24301 c!15368) b!92235))

(assert (= (and d!24301 (not c!15368)) b!92236))

(assert (= (and d!24301 (not res!46906)) b!92237))

(declare-fun m!99405 () Bool)

(assert (=> d!24301 m!99405))

(declare-fun m!99407 () Bool)

(assert (=> b!92235 m!99407))

(assert (=> b!92235 m!99047))

(assert (=> b!92235 m!99047))

(declare-fun m!99409 () Bool)

(assert (=> b!92235 m!99409))

(assert (=> b!92237 m!99047))

(assert (=> b!92237 m!99047))

(assert (=> b!92237 m!99409))

(assert (=> bm!8956 d!24301))

(declare-fun d!24303 () Bool)

(declare-fun e!60124 () Bool)

(assert (=> d!24303 e!60124))

(declare-fun c!15371 () Bool)

(assert (=> d!24303 (= c!15371 (and (not (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!24303 true))

(declare-fun _$29!117 () Unit!2720)

(assert (=> d!24303 (= (choose!543 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (_values!2389 (v!2721 (underlying!313 thiss!992))) (mask!6466 (v!2721 (underlying!313 thiss!992))) (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) (minValue!2294 (v!2721 (underlying!313 thiss!992))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992)))) _$29!117)))

(declare-fun b!92242 () Bool)

(assert (=> b!92242 (= e!60124 (arrayContainsKey!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!92243 () Bool)

(assert (=> b!92243 (= e!60124 (ite (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2237 (v!2721 (underlying!313 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24303 c!15371) b!92242))

(assert (= (and d!24303 (not c!15371)) b!92243))

(assert (=> b!92242 m!98305))

(assert (=> b!92242 m!98331))

(assert (=> d!24123 d!24303))

(assert (=> d!24123 d!24225))

(declare-fun b!92246 () Bool)

(declare-fun e!60126 () Option!151)

(assert (=> b!92246 (= e!60126 (getValueByKey!145 (t!5386 (toList!765 lt!44758)) (_1!1144 lt!44649)))))

(declare-fun b!92245 () Bool)

(declare-fun e!60125 () Option!151)

(assert (=> b!92245 (= e!60125 e!60126)))

(declare-fun c!15373 () Bool)

(assert (=> b!92245 (= c!15373 (and ((_ is Cons!1548) (toList!765 lt!44758)) (not (= (_1!1144 (h!2140 (toList!765 lt!44758))) (_1!1144 lt!44649)))))))

(declare-fun b!92247 () Bool)

(assert (=> b!92247 (= e!60126 None!149)))

(declare-fun b!92244 () Bool)

(assert (=> b!92244 (= e!60125 (Some!150 (_2!1144 (h!2140 (toList!765 lt!44758)))))))

(declare-fun d!24305 () Bool)

(declare-fun c!15372 () Bool)

(assert (=> d!24305 (= c!15372 (and ((_ is Cons!1548) (toList!765 lt!44758)) (= (_1!1144 (h!2140 (toList!765 lt!44758))) (_1!1144 lt!44649))))))

(assert (=> d!24305 (= (getValueByKey!145 (toList!765 lt!44758) (_1!1144 lt!44649)) e!60125)))

(assert (= (and d!24305 c!15372) b!92244))

(assert (= (and d!24305 (not c!15372)) b!92245))

(assert (= (and b!92245 c!15373) b!92246))

(assert (= (and b!92245 (not c!15373)) b!92247))

(declare-fun m!99411 () Bool)

(assert (=> b!92246 m!99411))

(assert (=> b!91654 d!24305))

(assert (=> b!91584 d!24121))

(declare-fun d!24307 () Bool)

(assert (=> d!24307 (= (+!127 (getCurrentListMap!457 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44644)) (getCurrentListMap!457 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) lt!44943 lt!44644 (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!45238 () Unit!2720)

(declare-fun choose!549 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 V!3091 Int) Unit!2720)

(assert (=> d!24307 (= lt!45238 (choose!549 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) lt!44943 (zeroValue!2294 newMap!16) lt!44644 (minValue!2294 newMap!16) (defaultEntry!2406 newMap!16)))))

(assert (=> d!24307 (validMask!0 (mask!6466 newMap!16))))

(assert (=> d!24307 (= (lemmaChangeZeroKeyThenAddPairToListMap!36 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) lt!44943 (zeroValue!2294 newMap!16) lt!44644 (minValue!2294 newMap!16) (defaultEntry!2406 newMap!16)) lt!45238)))

(declare-fun bs!3827 () Bool)

(assert (= bs!3827 d!24307))

(declare-fun m!99413 () Bool)

(assert (=> bs!3827 m!99413))

(assert (=> bs!3827 m!98661))

(declare-fun m!99415 () Bool)

(assert (=> bs!3827 m!99415))

(assert (=> bs!3827 m!98661))

(declare-fun m!99417 () Bool)

(assert (=> bs!3827 m!99417))

(assert (=> bs!3827 m!98855))

(assert (=> b!91852 d!24307))

(declare-fun d!24309 () Bool)

(declare-fun e!60127 () Bool)

(assert (=> d!24309 e!60127))

(declare-fun res!46907 () Bool)

(assert (=> d!24309 (=> (not res!46907) (not e!60127))))

(declare-fun lt!45239 () ListLongMap!1499)

(assert (=> d!24309 (= res!46907 (contains!777 lt!45239 (_1!1144 (ite (or c!15221 c!15219) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun lt!45241 () List!1552)

(assert (=> d!24309 (= lt!45239 (ListLongMap!1500 lt!45241))))

(declare-fun lt!45240 () Unit!2720)

(declare-fun lt!45242 () Unit!2720)

(assert (=> d!24309 (= lt!45240 lt!45242)))

(assert (=> d!24309 (= (getValueByKey!145 lt!45241 (_1!1144 (ite (or c!15221 c!15219) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))) (Some!150 (_2!1144 (ite (or c!15221 c!15219) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(assert (=> d!24309 (= lt!45242 (lemmaContainsTupThenGetReturnValue!62 lt!45241 (_1!1144 (ite (or c!15221 c!15219) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (_2!1144 (ite (or c!15221 c!15219) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(assert (=> d!24309 (= lt!45241 (insertStrictlySorted!65 (toList!765 (ite c!15221 call!8955 (ite c!15219 call!8958 call!8956))) (_1!1144 (ite (or c!15221 c!15219) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (_2!1144 (ite (or c!15221 c!15219) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(assert (=> d!24309 (= (+!127 (ite c!15221 call!8955 (ite c!15219 call!8958 call!8956)) (ite (or c!15221 c!15219) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!45239)))

(declare-fun b!92248 () Bool)

(declare-fun res!46908 () Bool)

(assert (=> b!92248 (=> (not res!46908) (not e!60127))))

(assert (=> b!92248 (= res!46908 (= (getValueByKey!145 (toList!765 lt!45239) (_1!1144 (ite (or c!15221 c!15219) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))) (Some!150 (_2!1144 (ite (or c!15221 c!15219) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))))

(declare-fun b!92249 () Bool)

(assert (=> b!92249 (= e!60127 (contains!780 (toList!765 lt!45239) (ite (or c!15221 c!15219) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (= (and d!24309 res!46907) b!92248))

(assert (= (and b!92248 res!46908) b!92249))

(declare-fun m!99419 () Bool)

(assert (=> d!24309 m!99419))

(declare-fun m!99421 () Bool)

(assert (=> d!24309 m!99421))

(declare-fun m!99423 () Bool)

(assert (=> d!24309 m!99423))

(declare-fun m!99425 () Bool)

(assert (=> d!24309 m!99425))

(declare-fun m!99427 () Bool)

(assert (=> b!92248 m!99427))

(declare-fun m!99429 () Bool)

(assert (=> b!92249 m!99429))

(assert (=> bm!8957 d!24309))

(declare-fun d!24311 () Bool)

(declare-fun e!60129 () Bool)

(assert (=> d!24311 e!60129))

(declare-fun res!46909 () Bool)

(assert (=> d!24311 (=> res!46909 e!60129)))

(declare-fun lt!45244 () Bool)

(assert (=> d!24311 (= res!46909 (not lt!45244))))

(declare-fun lt!45243 () Bool)

(assert (=> d!24311 (= lt!45244 lt!45243)))

(declare-fun lt!45246 () Unit!2720)

(declare-fun e!60128 () Unit!2720)

(assert (=> d!24311 (= lt!45246 e!60128)))

(declare-fun c!15374 () Bool)

(assert (=> d!24311 (= c!15374 lt!45243)))

(assert (=> d!24311 (= lt!45243 (containsKey!149 (toList!765 call!9033) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> d!24311 (= (contains!777 call!9033 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) lt!45244)))

(declare-fun b!92250 () Bool)

(declare-fun lt!45245 () Unit!2720)

(assert (=> b!92250 (= e!60128 lt!45245)))

(assert (=> b!92250 (= lt!45245 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 call!9033) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> b!92250 (isDefined!98 (getValueByKey!145 (toList!765 call!9033) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun b!92251 () Bool)

(declare-fun Unit!2744 () Unit!2720)

(assert (=> b!92251 (= e!60128 Unit!2744)))

(declare-fun b!92252 () Bool)

(assert (=> b!92252 (= e!60129 (isDefined!98 (getValueByKey!145 (toList!765 call!9033) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))))))

(assert (= (and d!24311 c!15374) b!92250))

(assert (= (and d!24311 (not c!15374)) b!92251))

(assert (= (and d!24311 (not res!46909)) b!92252))

(assert (=> d!24311 m!98305))

(declare-fun m!99431 () Bool)

(assert (=> d!24311 m!99431))

(assert (=> b!92250 m!98305))

(declare-fun m!99433 () Bool)

(assert (=> b!92250 m!99433))

(assert (=> b!92250 m!98305))

(declare-fun m!99435 () Bool)

(assert (=> b!92250 m!99435))

(assert (=> b!92250 m!99435))

(declare-fun m!99437 () Bool)

(assert (=> b!92250 m!99437))

(assert (=> b!92252 m!98305))

(assert (=> b!92252 m!99435))

(assert (=> b!92252 m!99435))

(assert (=> b!92252 m!99437))

(assert (=> b!91867 d!24311))

(declare-fun b!92261 () Bool)

(declare-fun e!60136 () Bool)

(declare-fun e!60137 () Bool)

(assert (=> b!92261 (= e!60136 e!60137)))

(declare-fun lt!45255 () (_ BitVec 64))

(assert (=> b!92261 (= lt!45255 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000))))

(declare-fun lt!45253 () Unit!2720)

(assert (=> b!92261 (= lt!45253 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4086 (_2!1145 lt!44647)) lt!45255 #b00000000000000000000000000000000))))

(assert (=> b!92261 (arrayContainsKey!0 (_keys!4086 (_2!1145 lt!44647)) lt!45255 #b00000000000000000000000000000000)))

(declare-fun lt!45254 () Unit!2720)

(assert (=> b!92261 (= lt!45254 lt!45253)))

(declare-fun res!46915 () Bool)

(assert (=> b!92261 (= res!46915 (= (seekEntryOrOpen!0 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000) (_keys!4086 (_2!1145 lt!44647)) (mask!6466 (_2!1145 lt!44647))) (Found!248 #b00000000000000000000000000000000)))))

(assert (=> b!92261 (=> (not res!46915) (not e!60137))))

(declare-fun b!92262 () Bool)

(declare-fun e!60138 () Bool)

(assert (=> b!92262 (= e!60138 e!60136)))

(declare-fun c!15377 () Bool)

(assert (=> b!92262 (= c!15377 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000)))))

(declare-fun bm!9091 () Bool)

(declare-fun call!9094 () Bool)

(assert (=> bm!9091 (= call!9094 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4086 (_2!1145 lt!44647)) (mask!6466 (_2!1145 lt!44647))))))

(declare-fun b!92264 () Bool)

(assert (=> b!92264 (= e!60136 call!9094)))

(declare-fun d!24313 () Bool)

(declare-fun res!46914 () Bool)

(assert (=> d!24313 (=> res!46914 e!60138)))

(assert (=> d!24313 (= res!46914 (bvsge #b00000000000000000000000000000000 (size!2214 (_keys!4086 (_2!1145 lt!44647)))))))

(assert (=> d!24313 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4086 (_2!1145 lt!44647)) (mask!6466 (_2!1145 lt!44647))) e!60138)))

(declare-fun b!92263 () Bool)

(assert (=> b!92263 (= e!60137 call!9094)))

(assert (= (and d!24313 (not res!46914)) b!92262))

(assert (= (and b!92262 c!15377) b!92261))

(assert (= (and b!92262 (not c!15377)) b!92264))

(assert (= (and b!92261 res!46915) b!92263))

(assert (= (or b!92263 b!92264) bm!9091))

(assert (=> b!92261 m!98779))

(declare-fun m!99439 () Bool)

(assert (=> b!92261 m!99439))

(declare-fun m!99441 () Bool)

(assert (=> b!92261 m!99441))

(assert (=> b!92261 m!98779))

(declare-fun m!99443 () Bool)

(assert (=> b!92261 m!99443))

(assert (=> b!92262 m!98779))

(assert (=> b!92262 m!98779))

(assert (=> b!92262 m!98781))

(declare-fun m!99445 () Bool)

(assert (=> bm!9091 m!99445))

(assert (=> b!91608 d!24313))

(declare-fun d!24315 () Bool)

(assert (=> d!24315 (= (get!1239 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) from!355) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91732 d!24315))

(declare-fun d!24317 () Bool)

(declare-fun e!60140 () Bool)

(assert (=> d!24317 e!60140))

(declare-fun res!46916 () Bool)

(assert (=> d!24317 (=> res!46916 e!60140)))

(declare-fun lt!45257 () Bool)

(assert (=> d!24317 (= res!46916 (not lt!45257))))

(declare-fun lt!45256 () Bool)

(assert (=> d!24317 (= lt!45257 lt!45256)))

(declare-fun lt!45259 () Unit!2720)

(declare-fun e!60139 () Unit!2720)

(assert (=> d!24317 (= lt!45259 e!60139)))

(declare-fun c!15378 () Bool)

(assert (=> d!24317 (= c!15378 lt!45256)))

(assert (=> d!24317 (= lt!45256 (containsKey!149 (toList!765 lt!44757) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!24317 (= (contains!777 lt!44757 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!45257)))

(declare-fun b!92265 () Bool)

(declare-fun lt!45258 () Unit!2720)

(assert (=> b!92265 (= e!60139 lt!45258)))

(assert (=> b!92265 (= lt!45258 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44757) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!92265 (isDefined!98 (getValueByKey!145 (toList!765 lt!44757) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!92266 () Bool)

(declare-fun Unit!2745 () Unit!2720)

(assert (=> b!92266 (= e!60139 Unit!2745)))

(declare-fun b!92267 () Bool)

(assert (=> b!92267 (= e!60140 (isDefined!98 (getValueByKey!145 (toList!765 lt!44757) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!24317 c!15378) b!92265))

(assert (= (and d!24317 (not c!15378)) b!92266))

(assert (= (and d!24317 (not res!46916)) b!92267))

(assert (=> d!24317 m!98445))

(declare-fun m!99447 () Bool)

(assert (=> d!24317 m!99447))

(assert (=> b!92265 m!98445))

(declare-fun m!99449 () Bool)

(assert (=> b!92265 m!99449))

(assert (=> b!92265 m!98445))

(assert (=> b!92265 m!98857))

(assert (=> b!92265 m!98857))

(declare-fun m!99451 () Bool)

(assert (=> b!92265 m!99451))

(assert (=> b!92267 m!98445))

(assert (=> b!92267 m!98857))

(assert (=> b!92267 m!98857))

(assert (=> b!92267 m!99451))

(assert (=> b!91643 d!24317))

(declare-fun d!24319 () Bool)

(declare-fun res!46917 () Bool)

(declare-fun e!60141 () Bool)

(assert (=> d!24319 (=> (not res!46917) (not e!60141))))

(assert (=> d!24319 (= res!46917 (simpleValid!63 (_2!1145 lt!44936)))))

(assert (=> d!24319 (= (valid!353 (_2!1145 lt!44936)) e!60141)))

(declare-fun b!92268 () Bool)

(declare-fun res!46918 () Bool)

(assert (=> b!92268 (=> (not res!46918) (not e!60141))))

(assert (=> b!92268 (= res!46918 (= (arrayCountValidKeys!0 (_keys!4086 (_2!1145 lt!44936)) #b00000000000000000000000000000000 (size!2214 (_keys!4086 (_2!1145 lt!44936)))) (_size!451 (_2!1145 lt!44936))))))

(declare-fun b!92269 () Bool)

(declare-fun res!46919 () Bool)

(assert (=> b!92269 (=> (not res!46919) (not e!60141))))

(assert (=> b!92269 (= res!46919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4086 (_2!1145 lt!44936)) (mask!6466 (_2!1145 lt!44936))))))

(declare-fun b!92270 () Bool)

(assert (=> b!92270 (= e!60141 (arrayNoDuplicates!0 (_keys!4086 (_2!1145 lt!44936)) #b00000000000000000000000000000000 Nil!1548))))

(assert (= (and d!24319 res!46917) b!92268))

(assert (= (and b!92268 res!46918) b!92269))

(assert (= (and b!92269 res!46919) b!92270))

(declare-fun m!99453 () Bool)

(assert (=> d!24319 m!99453))

(declare-fun m!99455 () Bool)

(assert (=> b!92268 m!99455))

(declare-fun m!99457 () Bool)

(assert (=> b!92269 m!99457))

(declare-fun m!99459 () Bool)

(assert (=> b!92270 m!99459))

(assert (=> d!24169 d!24319))

(assert (=> d!24169 d!24161))

(declare-fun d!24321 () Bool)

(declare-fun lt!45260 () Bool)

(assert (=> d!24321 (= lt!45260 (select (content!95 (toList!765 lt!44833)) lt!44638))))

(declare-fun e!60142 () Bool)

(assert (=> d!24321 (= lt!45260 e!60142)))

(declare-fun res!46920 () Bool)

(assert (=> d!24321 (=> (not res!46920) (not e!60142))))

(assert (=> d!24321 (= res!46920 ((_ is Cons!1548) (toList!765 lt!44833)))))

(assert (=> d!24321 (= (contains!780 (toList!765 lt!44833) lt!44638) lt!45260)))

(declare-fun b!92271 () Bool)

(declare-fun e!60143 () Bool)

(assert (=> b!92271 (= e!60142 e!60143)))

(declare-fun res!46921 () Bool)

(assert (=> b!92271 (=> res!46921 e!60143)))

(assert (=> b!92271 (= res!46921 (= (h!2140 (toList!765 lt!44833)) lt!44638))))

(declare-fun b!92272 () Bool)

(assert (=> b!92272 (= e!60143 (contains!780 (t!5386 (toList!765 lt!44833)) lt!44638))))

(assert (= (and d!24321 res!46920) b!92271))

(assert (= (and b!92271 (not res!46921)) b!92272))

(declare-fun m!99461 () Bool)

(assert (=> d!24321 m!99461))

(declare-fun m!99463 () Bool)

(assert (=> d!24321 m!99463))

(declare-fun m!99465 () Bool)

(assert (=> b!92272 m!99465))

(assert (=> b!91722 d!24321))

(declare-fun d!24323 () Bool)

(declare-fun e!60145 () Bool)

(assert (=> d!24323 e!60145))

(declare-fun res!46922 () Bool)

(assert (=> d!24323 (=> res!46922 e!60145)))

(declare-fun lt!45262 () Bool)

(assert (=> d!24323 (= res!46922 (not lt!45262))))

(declare-fun lt!45261 () Bool)

(assert (=> d!24323 (= lt!45262 lt!45261)))

(declare-fun lt!45264 () Unit!2720)

(declare-fun e!60144 () Unit!2720)

(assert (=> d!24323 (= lt!45264 e!60144)))

(declare-fun c!15379 () Bool)

(assert (=> d!24323 (= c!15379 lt!45261)))

(assert (=> d!24323 (= lt!45261 (containsKey!149 (toList!765 lt!44861) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!24323 (= (contains!777 lt!44861 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!45262)))

(declare-fun b!92273 () Bool)

(declare-fun lt!45263 () Unit!2720)

(assert (=> b!92273 (= e!60144 lt!45263)))

(assert (=> b!92273 (= lt!45263 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44861) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!92273 (isDefined!98 (getValueByKey!145 (toList!765 lt!44861) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!92274 () Bool)

(declare-fun Unit!2746 () Unit!2720)

(assert (=> b!92274 (= e!60144 Unit!2746)))

(declare-fun b!92275 () Bool)

(assert (=> b!92275 (= e!60145 (isDefined!98 (getValueByKey!145 (toList!765 lt!44861) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!24323 c!15379) b!92273))

(assert (= (and d!24323 (not c!15379)) b!92274))

(assert (= (and d!24323 (not res!46922)) b!92275))

(assert (=> d!24323 m!98445))

(declare-fun m!99467 () Bool)

(assert (=> d!24323 m!99467))

(assert (=> b!92273 m!98445))

(declare-fun m!99469 () Bool)

(assert (=> b!92273 m!99469))

(assert (=> b!92273 m!98445))

(declare-fun m!99471 () Bool)

(assert (=> b!92273 m!99471))

(assert (=> b!92273 m!99471))

(declare-fun m!99473 () Bool)

(assert (=> b!92273 m!99473))

(assert (=> b!92275 m!98445))

(assert (=> b!92275 m!99471))

(assert (=> b!92275 m!99471))

(assert (=> b!92275 m!99473))

(assert (=> b!91753 d!24323))

(declare-fun d!24325 () Bool)

(declare-fun e!60146 () Bool)

(assert (=> d!24325 e!60146))

(declare-fun res!46923 () Bool)

(assert (=> d!24325 (=> (not res!46923) (not e!60146))))

(declare-fun lt!45265 () ListLongMap!1499)

(assert (=> d!24325 (= res!46923 (contains!777 lt!45265 (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun lt!45267 () List!1552)

(assert (=> d!24325 (= lt!45265 (ListLongMap!1500 lt!45267))))

(declare-fun lt!45266 () Unit!2720)

(declare-fun lt!45268 () Unit!2720)

(assert (=> d!24325 (= lt!45266 lt!45268)))

(assert (=> d!24325 (= (getValueByKey!145 lt!45267 (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24325 (= lt!45268 (lemmaContainsTupThenGetReturnValue!62 lt!45267 (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24325 (= lt!45267 (insertStrictlySorted!65 (toList!765 call!8954) (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24325 (= (+!127 call!8954 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!45265)))

(declare-fun b!92276 () Bool)

(declare-fun res!46924 () Bool)

(assert (=> b!92276 (=> (not res!46924) (not e!60146))))

(assert (=> b!92276 (= res!46924 (= (getValueByKey!145 (toList!765 lt!45265) (_1!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun b!92277 () Bool)

(assert (=> b!92277 (= e!60146 (contains!780 (toList!765 lt!45265) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24325 res!46923) b!92276))

(assert (= (and b!92276 res!46924) b!92277))

(declare-fun m!99475 () Bool)

(assert (=> d!24325 m!99475))

(declare-fun m!99477 () Bool)

(assert (=> d!24325 m!99477))

(declare-fun m!99479 () Bool)

(assert (=> d!24325 m!99479))

(declare-fun m!99481 () Bool)

(assert (=> d!24325 m!99481))

(declare-fun m!99483 () Bool)

(assert (=> b!92276 m!99483))

(declare-fun m!99485 () Bool)

(assert (=> b!92277 m!99485))

(assert (=> b!91705 d!24325))

(declare-fun d!24327 () Bool)

(declare-fun lt!45269 () Bool)

(assert (=> d!24327 (= lt!45269 (select (content!95 (toList!765 lt!44726)) lt!44651))))

(declare-fun e!60147 () Bool)

(assert (=> d!24327 (= lt!45269 e!60147)))

(declare-fun res!46925 () Bool)

(assert (=> d!24327 (=> (not res!46925) (not e!60147))))

(assert (=> d!24327 (= res!46925 ((_ is Cons!1548) (toList!765 lt!44726)))))

(assert (=> d!24327 (= (contains!780 (toList!765 lt!44726) lt!44651) lt!45269)))

(declare-fun b!92278 () Bool)

(declare-fun e!60148 () Bool)

(assert (=> b!92278 (= e!60147 e!60148)))

(declare-fun res!46926 () Bool)

(assert (=> b!92278 (=> res!46926 e!60148)))

(assert (=> b!92278 (= res!46926 (= (h!2140 (toList!765 lt!44726)) lt!44651))))

(declare-fun b!92279 () Bool)

(assert (=> b!92279 (= e!60148 (contains!780 (t!5386 (toList!765 lt!44726)) lt!44651))))

(assert (= (and d!24327 res!46925) b!92278))

(assert (= (and b!92278 (not res!46926)) b!92279))

(declare-fun m!99487 () Bool)

(assert (=> d!24327 m!99487))

(declare-fun m!99489 () Bool)

(assert (=> d!24327 m!99489))

(declare-fun m!99491 () Bool)

(assert (=> b!92279 m!99491))

(assert (=> b!91615 d!24327))

(declare-fun d!24329 () Bool)

(declare-fun lt!45270 () Bool)

(assert (=> d!24329 (= lt!45270 (select (content!95 (toList!765 lt!44841)) lt!44638))))

(declare-fun e!60149 () Bool)

(assert (=> d!24329 (= lt!45270 e!60149)))

(declare-fun res!46927 () Bool)

(assert (=> d!24329 (=> (not res!46927) (not e!60149))))

(assert (=> d!24329 (= res!46927 ((_ is Cons!1548) (toList!765 lt!44841)))))

(assert (=> d!24329 (= (contains!780 (toList!765 lt!44841) lt!44638) lt!45270)))

(declare-fun b!92280 () Bool)

(declare-fun e!60150 () Bool)

(assert (=> b!92280 (= e!60149 e!60150)))

(declare-fun res!46928 () Bool)

(assert (=> b!92280 (=> res!46928 e!60150)))

(assert (=> b!92280 (= res!46928 (= (h!2140 (toList!765 lt!44841)) lt!44638))))

(declare-fun b!92281 () Bool)

(assert (=> b!92281 (= e!60150 (contains!780 (t!5386 (toList!765 lt!44841)) lt!44638))))

(assert (= (and d!24329 res!46927) b!92280))

(assert (= (and b!92280 (not res!46928)) b!92281))

(declare-fun m!99493 () Bool)

(assert (=> d!24329 m!99493))

(declare-fun m!99495 () Bool)

(assert (=> d!24329 m!99495))

(declare-fun m!99497 () Bool)

(assert (=> b!92281 m!99497))

(assert (=> b!91726 d!24329))

(declare-fun d!24331 () Bool)

(assert (=> d!24331 (= (apply!87 lt!44861 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1240 (getValueByKey!145 (toList!765 lt!44861) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3828 () Bool)

(assert (= bs!3828 d!24331))

(assert (=> bs!3828 m!98445))

(assert (=> bs!3828 m!99471))

(assert (=> bs!3828 m!99471))

(declare-fun m!99499 () Bool)

(assert (=> bs!3828 m!99499))

(assert (=> b!91756 d!24331))

(assert (=> b!91756 d!24181))

(declare-fun d!24333 () Bool)

(declare-fun lt!45273 () Bool)

(declare-fun content!96 (List!1551) (InoxSet (_ BitVec 64)))

(assert (=> d!24333 (= lt!45273 (select (content!96 Nil!1548) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun e!60155 () Bool)

(assert (=> d!24333 (= lt!45273 e!60155)))

(declare-fun res!46934 () Bool)

(assert (=> d!24333 (=> (not res!46934) (not e!60155))))

(assert (=> d!24333 (= res!46934 ((_ is Cons!1547) Nil!1548))))

(assert (=> d!24333 (= (contains!779 Nil!1548 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) lt!45273)))

(declare-fun b!92286 () Bool)

(declare-fun e!60156 () Bool)

(assert (=> b!92286 (= e!60155 e!60156)))

(declare-fun res!46933 () Bool)

(assert (=> b!92286 (=> res!46933 e!60156)))

(assert (=> b!92286 (= res!46933 (= (h!2139 Nil!1548) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun b!92287 () Bool)

(assert (=> b!92287 (= e!60156 (contains!779 (t!5385 Nil!1548) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (= (and d!24333 res!46934) b!92286))

(assert (= (and b!92286 (not res!46933)) b!92287))

(declare-fun m!99501 () Bool)

(assert (=> d!24333 m!99501))

(assert (=> d!24333 m!98305))

(declare-fun m!99503 () Bool)

(assert (=> d!24333 m!99503))

(assert (=> b!92287 m!98305))

(declare-fun m!99505 () Bool)

(assert (=> b!92287 m!99505))

(assert (=> b!91597 d!24333))

(declare-fun d!24335 () Bool)

(declare-fun e!60158 () Bool)

(assert (=> d!24335 e!60158))

(declare-fun res!46935 () Bool)

(assert (=> d!24335 (=> res!46935 e!60158)))

(declare-fun lt!45275 () Bool)

(assert (=> d!24335 (= res!46935 (not lt!45275))))

(declare-fun lt!45274 () Bool)

(assert (=> d!24335 (= lt!45275 lt!45274)))

(declare-fun lt!45277 () Unit!2720)

(declare-fun e!60157 () Unit!2720)

(assert (=> d!24335 (= lt!45277 e!60157)))

(declare-fun c!15380 () Bool)

(assert (=> d!24335 (= c!15380 lt!45274)))

(assert (=> d!24335 (= lt!45274 (containsKey!149 (toList!765 e!59924) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> d!24335 (= (contains!777 e!59924 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) lt!45275)))

(declare-fun b!92288 () Bool)

(declare-fun lt!45276 () Unit!2720)

(assert (=> b!92288 (= e!60157 lt!45276)))

(assert (=> b!92288 (= lt!45276 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 e!59924) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> b!92288 (isDefined!98 (getValueByKey!145 (toList!765 e!59924) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun b!92289 () Bool)

(declare-fun Unit!2747 () Unit!2720)

(assert (=> b!92289 (= e!60157 Unit!2747)))

(declare-fun b!92290 () Bool)

(assert (=> b!92290 (= e!60158 (isDefined!98 (getValueByKey!145 (toList!765 e!59924) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))))))

(assert (= (and d!24335 c!15380) b!92288))

(assert (= (and d!24335 (not c!15380)) b!92289))

(assert (= (and d!24335 (not res!46935)) b!92290))

(assert (=> d!24335 m!98305))

(declare-fun m!99507 () Bool)

(assert (=> d!24335 m!99507))

(assert (=> b!92288 m!98305))

(declare-fun m!99509 () Bool)

(assert (=> b!92288 m!99509))

(assert (=> b!92288 m!98305))

(declare-fun m!99511 () Bool)

(assert (=> b!92288 m!99511))

(assert (=> b!92288 m!99511))

(declare-fun m!99513 () Bool)

(assert (=> b!92288 m!99513))

(assert (=> b!92290 m!98305))

(assert (=> b!92290 m!99511))

(assert (=> b!92290 m!99511))

(assert (=> b!92290 m!99513))

(assert (=> bm!9018 d!24335))

(assert (=> b!91712 d!24183))

(declare-fun b!92291 () Bool)

(declare-fun e!60159 () Bool)

(declare-fun e!60160 () Bool)

(assert (=> b!92291 (= e!60159 e!60160)))

(declare-fun lt!45280 () (_ BitVec 64))

(assert (=> b!92291 (= lt!45280 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45278 () Unit!2720)

(assert (=> b!92291 (= lt!45278 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4086 newMap!16) lt!45280 #b00000000000000000000000000000000))))

(assert (=> b!92291 (arrayContainsKey!0 (_keys!4086 newMap!16) lt!45280 #b00000000000000000000000000000000)))

(declare-fun lt!45279 () Unit!2720)

(assert (=> b!92291 (= lt!45279 lt!45278)))

(declare-fun res!46937 () Bool)

(assert (=> b!92291 (= res!46937 (= (seekEntryOrOpen!0 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000) (_keys!4086 newMap!16) (mask!6466 newMap!16)) (Found!248 #b00000000000000000000000000000000)))))

(assert (=> b!92291 (=> (not res!46937) (not e!60160))))

(declare-fun b!92292 () Bool)

(declare-fun e!60161 () Bool)

(assert (=> b!92292 (= e!60161 e!60159)))

(declare-fun c!15381 () Bool)

(assert (=> b!92292 (= c!15381 (validKeyInArray!0 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9092 () Bool)

(declare-fun call!9095 () Bool)

(assert (=> bm!9092 (= call!9095 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4086 newMap!16) (mask!6466 newMap!16)))))

(declare-fun b!92294 () Bool)

(assert (=> b!92294 (= e!60159 call!9095)))

(declare-fun d!24337 () Bool)

(declare-fun res!46936 () Bool)

(assert (=> d!24337 (=> res!46936 e!60161)))

(assert (=> d!24337 (= res!46936 (bvsge #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))

(assert (=> d!24337 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4086 newMap!16) (mask!6466 newMap!16)) e!60161)))

(declare-fun b!92293 () Bool)

(assert (=> b!92293 (= e!60160 call!9095)))

(assert (= (and d!24337 (not res!46936)) b!92292))

(assert (= (and b!92292 c!15381) b!92291))

(assert (= (and b!92292 (not c!15381)) b!92294))

(assert (= (and b!92291 res!46937) b!92293))

(assert (= (or b!92293 b!92294) bm!9092))

(assert (=> b!92291 m!99147))

(declare-fun m!99515 () Bool)

(assert (=> b!92291 m!99515))

(declare-fun m!99517 () Bool)

(assert (=> b!92291 m!99517))

(assert (=> b!92291 m!99147))

(declare-fun m!99519 () Bool)

(assert (=> b!92291 m!99519))

(assert (=> b!92292 m!99147))

(assert (=> b!92292 m!99147))

(assert (=> b!92292 m!99149))

(declare-fun m!99521 () Bool)

(assert (=> bm!9092 m!99521))

(assert (=> b!91734 d!24337))

(declare-fun d!24339 () Bool)

(declare-fun res!46938 () Bool)

(declare-fun e!60162 () Bool)

(assert (=> d!24339 (=> res!46938 e!60162)))

(assert (=> d!24339 (= res!46938 (= (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> d!24339 (= (arrayContainsKey!0 (_keys!4086 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b00000000000000000000000000000000) e!60162)))

(declare-fun b!92295 () Bool)

(declare-fun e!60163 () Bool)

(assert (=> b!92295 (= e!60162 e!60163)))

(declare-fun res!46939 () Bool)

(assert (=> b!92295 (=> (not res!46939) (not e!60163))))

(assert (=> b!92295 (= res!46939 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2214 (_keys!4086 newMap!16))))))

(declare-fun b!92296 () Bool)

(assert (=> b!92296 (= e!60163 (arrayContainsKey!0 (_keys!4086 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!24339 (not res!46938)) b!92295))

(assert (= (and b!92295 res!46939) b!92296))

(assert (=> d!24339 m!99147))

(assert (=> b!92296 m!98305))

(declare-fun m!99523 () Bool)

(assert (=> b!92296 m!99523))

(assert (=> bm!9034 d!24339))

(declare-fun d!24341 () Bool)

(declare-fun e!60164 () Bool)

(assert (=> d!24341 e!60164))

(declare-fun res!46940 () Bool)

(assert (=> d!24341 (=> (not res!46940) (not e!60164))))

(declare-fun lt!45281 () ListLongMap!1499)

(assert (=> d!24341 (= res!46940 (contains!777 lt!45281 (_1!1144 (ite c!15263 (ite c!15268 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44644) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44644)) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))))

(declare-fun lt!45283 () List!1552)

(assert (=> d!24341 (= lt!45281 (ListLongMap!1500 lt!45283))))

(declare-fun lt!45282 () Unit!2720)

(declare-fun lt!45284 () Unit!2720)

(assert (=> d!24341 (= lt!45282 lt!45284)))

(assert (=> d!24341 (= (getValueByKey!145 lt!45283 (_1!1144 (ite c!15263 (ite c!15268 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44644) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44644)) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))) (Some!150 (_2!1144 (ite c!15263 (ite c!15268 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44644) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44644)) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))))

(assert (=> d!24341 (= lt!45284 (lemmaContainsTupThenGetReturnValue!62 lt!45283 (_1!1144 (ite c!15263 (ite c!15268 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44644) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44644)) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))) (_2!1144 (ite c!15263 (ite c!15268 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44644) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44644)) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))))

(assert (=> d!24341 (= lt!45283 (insertStrictlySorted!65 (toList!765 e!59916) (_1!1144 (ite c!15263 (ite c!15268 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44644) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44644)) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))) (_2!1144 (ite c!15263 (ite c!15268 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44644) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44644)) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))))

(assert (=> d!24341 (= (+!127 e!59916 (ite c!15263 (ite c!15268 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44644) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44644)) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))) lt!45281)))

(declare-fun b!92297 () Bool)

(declare-fun res!46941 () Bool)

(assert (=> b!92297 (=> (not res!46941) (not e!60164))))

(assert (=> b!92297 (= res!46941 (= (getValueByKey!145 (toList!765 lt!45281) (_1!1144 (ite c!15263 (ite c!15268 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44644) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44644)) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))) (Some!150 (_2!1144 (ite c!15263 (ite c!15268 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44644) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44644)) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))))

(declare-fun b!92298 () Bool)

(assert (=> b!92298 (= e!60164 (contains!780 (toList!765 lt!45281) (ite c!15263 (ite c!15268 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44644) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44644)) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (= (and d!24341 res!46940) b!92297))

(assert (= (and b!92297 res!46941) b!92298))

(declare-fun m!99525 () Bool)

(assert (=> d!24341 m!99525))

(declare-fun m!99527 () Bool)

(assert (=> d!24341 m!99527))

(declare-fun m!99529 () Bool)

(assert (=> d!24341 m!99529))

(declare-fun m!99531 () Bool)

(assert (=> d!24341 m!99531))

(declare-fun m!99533 () Bool)

(assert (=> b!92297 m!99533))

(declare-fun m!99535 () Bool)

(assert (=> b!92298 m!99535))

(assert (=> bm!9024 d!24341))

(declare-fun d!24343 () Bool)

(declare-fun e!60166 () Bool)

(assert (=> d!24343 e!60166))

(declare-fun res!46942 () Bool)

(assert (=> d!24343 (=> res!46942 e!60166)))

(declare-fun lt!45286 () Bool)

(assert (=> d!24343 (= res!46942 (not lt!45286))))

(declare-fun lt!45285 () Bool)

(assert (=> d!24343 (= lt!45286 lt!45285)))

(declare-fun lt!45288 () Unit!2720)

(declare-fun e!60165 () Unit!2720)

(assert (=> d!24343 (= lt!45288 e!60165)))

(declare-fun c!15382 () Bool)

(assert (=> d!24343 (= c!15382 lt!45285)))

(assert (=> d!24343 (= lt!45285 (containsKey!149 (toList!765 lt!44833) (_1!1144 lt!44638)))))

(assert (=> d!24343 (= (contains!777 lt!44833 (_1!1144 lt!44638)) lt!45286)))

(declare-fun b!92299 () Bool)

(declare-fun lt!45287 () Unit!2720)

(assert (=> b!92299 (= e!60165 lt!45287)))

(assert (=> b!92299 (= lt!45287 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44833) (_1!1144 lt!44638)))))

(assert (=> b!92299 (isDefined!98 (getValueByKey!145 (toList!765 lt!44833) (_1!1144 lt!44638)))))

(declare-fun b!92300 () Bool)

(declare-fun Unit!2748 () Unit!2720)

(assert (=> b!92300 (= e!60165 Unit!2748)))

(declare-fun b!92301 () Bool)

(assert (=> b!92301 (= e!60166 (isDefined!98 (getValueByKey!145 (toList!765 lt!44833) (_1!1144 lt!44638))))))

(assert (= (and d!24343 c!15382) b!92299))

(assert (= (and d!24343 (not c!15382)) b!92300))

(assert (= (and d!24343 (not res!46942)) b!92301))

(declare-fun m!99537 () Bool)

(assert (=> d!24343 m!99537))

(declare-fun m!99539 () Bool)

(assert (=> b!92299 m!99539))

(assert (=> b!92299 m!98619))

(assert (=> b!92299 m!98619))

(declare-fun m!99541 () Bool)

(assert (=> b!92299 m!99541))

(assert (=> b!92301 m!98619))

(assert (=> b!92301 m!98619))

(assert (=> b!92301 m!99541))

(assert (=> d!24151 d!24343))

(declare-fun b!92304 () Bool)

(declare-fun e!60168 () Option!151)

(assert (=> b!92304 (= e!60168 (getValueByKey!145 (t!5386 lt!44835) (_1!1144 lt!44638)))))

(declare-fun b!92303 () Bool)

(declare-fun e!60167 () Option!151)

(assert (=> b!92303 (= e!60167 e!60168)))

(declare-fun c!15384 () Bool)

(assert (=> b!92303 (= c!15384 (and ((_ is Cons!1548) lt!44835) (not (= (_1!1144 (h!2140 lt!44835)) (_1!1144 lt!44638)))))))

(declare-fun b!92305 () Bool)

(assert (=> b!92305 (= e!60168 None!149)))

(declare-fun b!92302 () Bool)

(assert (=> b!92302 (= e!60167 (Some!150 (_2!1144 (h!2140 lt!44835))))))

(declare-fun d!24345 () Bool)

(declare-fun c!15383 () Bool)

(assert (=> d!24345 (= c!15383 (and ((_ is Cons!1548) lt!44835) (= (_1!1144 (h!2140 lt!44835)) (_1!1144 lt!44638))))))

(assert (=> d!24345 (= (getValueByKey!145 lt!44835 (_1!1144 lt!44638)) e!60167)))

(assert (= (and d!24345 c!15383) b!92302))

(assert (= (and d!24345 (not c!15383)) b!92303))

(assert (= (and b!92303 c!15384) b!92304))

(assert (= (and b!92303 (not c!15384)) b!92305))

(declare-fun m!99543 () Bool)

(assert (=> b!92304 m!99543))

(assert (=> d!24151 d!24345))

(declare-fun d!24347 () Bool)

(assert (=> d!24347 (= (getValueByKey!145 lt!44835 (_1!1144 lt!44638)) (Some!150 (_2!1144 lt!44638)))))

(declare-fun lt!45289 () Unit!2720)

(assert (=> d!24347 (= lt!45289 (choose!547 lt!44835 (_1!1144 lt!44638) (_2!1144 lt!44638)))))

(declare-fun e!60169 () Bool)

(assert (=> d!24347 e!60169))

(declare-fun res!46943 () Bool)

(assert (=> d!24347 (=> (not res!46943) (not e!60169))))

(assert (=> d!24347 (= res!46943 (isStrictlySorted!301 lt!44835))))

(assert (=> d!24347 (= (lemmaContainsTupThenGetReturnValue!62 lt!44835 (_1!1144 lt!44638) (_2!1144 lt!44638)) lt!45289)))

(declare-fun b!92306 () Bool)

(declare-fun res!46944 () Bool)

(assert (=> b!92306 (=> (not res!46944) (not e!60169))))

(assert (=> b!92306 (= res!46944 (containsKey!149 lt!44835 (_1!1144 lt!44638)))))

(declare-fun b!92307 () Bool)

(assert (=> b!92307 (= e!60169 (contains!780 lt!44835 (tuple2!2267 (_1!1144 lt!44638) (_2!1144 lt!44638))))))

(assert (= (and d!24347 res!46943) b!92306))

(assert (= (and b!92306 res!46944) b!92307))

(assert (=> d!24347 m!98613))

(declare-fun m!99545 () Bool)

(assert (=> d!24347 m!99545))

(declare-fun m!99547 () Bool)

(assert (=> d!24347 m!99547))

(declare-fun m!99549 () Bool)

(assert (=> b!92306 m!99549))

(declare-fun m!99551 () Bool)

(assert (=> b!92307 m!99551))

(assert (=> d!24151 d!24347))

(declare-fun bm!9093 () Bool)

(declare-fun call!9096 () List!1552)

(declare-fun call!9098 () List!1552)

(assert (=> bm!9093 (= call!9096 call!9098)))

(declare-fun b!92308 () Bool)

(declare-fun res!46945 () Bool)

(declare-fun e!60170 () Bool)

(assert (=> b!92308 (=> (not res!46945) (not e!60170))))

(declare-fun lt!45290 () List!1552)

(assert (=> b!92308 (= res!46945 (containsKey!149 lt!45290 (_1!1144 lt!44638)))))

(declare-fun b!92309 () Bool)

(declare-fun e!60171 () List!1552)

(assert (=> b!92309 (= e!60171 call!9098)))

(declare-fun b!92310 () Bool)

(assert (=> b!92310 (= e!60170 (contains!780 lt!45290 (tuple2!2267 (_1!1144 lt!44638) (_2!1144 lt!44638))))))

(declare-fun b!92311 () Bool)

(declare-fun e!60174 () List!1552)

(assert (=> b!92311 (= e!60174 (insertStrictlySorted!65 (t!5386 (toList!765 lt!44646)) (_1!1144 lt!44638) (_2!1144 lt!44638)))))

(declare-fun bm!9094 () Bool)

(declare-fun call!9097 () List!1552)

(assert (=> bm!9094 (= call!9098 call!9097)))

(declare-fun b!92313 () Bool)

(declare-fun e!60172 () List!1552)

(assert (=> b!92313 (= e!60172 e!60171)))

(declare-fun c!15385 () Bool)

(assert (=> b!92313 (= c!15385 (and ((_ is Cons!1548) (toList!765 lt!44646)) (= (_1!1144 (h!2140 (toList!765 lt!44646))) (_1!1144 lt!44638))))))

(declare-fun b!92314 () Bool)

(assert (=> b!92314 (= e!60172 call!9097)))

(declare-fun b!92315 () Bool)

(declare-fun c!15387 () Bool)

(assert (=> b!92315 (= c!15387 (and ((_ is Cons!1548) (toList!765 lt!44646)) (bvsgt (_1!1144 (h!2140 (toList!765 lt!44646))) (_1!1144 lt!44638))))))

(declare-fun e!60173 () List!1552)

(assert (=> b!92315 (= e!60171 e!60173)))

(declare-fun b!92316 () Bool)

(assert (=> b!92316 (= e!60174 (ite c!15385 (t!5386 (toList!765 lt!44646)) (ite c!15387 (Cons!1548 (h!2140 (toList!765 lt!44646)) (t!5386 (toList!765 lt!44646))) Nil!1549)))))

(declare-fun c!15386 () Bool)

(declare-fun bm!9095 () Bool)

(assert (=> bm!9095 (= call!9097 ($colon$colon!75 e!60174 (ite c!15386 (h!2140 (toList!765 lt!44646)) (tuple2!2267 (_1!1144 lt!44638) (_2!1144 lt!44638)))))))

(declare-fun c!15388 () Bool)

(assert (=> bm!9095 (= c!15388 c!15386)))

(declare-fun b!92317 () Bool)

(assert (=> b!92317 (= e!60173 call!9096)))

(declare-fun d!24349 () Bool)

(assert (=> d!24349 e!60170))

(declare-fun res!46946 () Bool)

(assert (=> d!24349 (=> (not res!46946) (not e!60170))))

(assert (=> d!24349 (= res!46946 (isStrictlySorted!301 lt!45290))))

(assert (=> d!24349 (= lt!45290 e!60172)))

(assert (=> d!24349 (= c!15386 (and ((_ is Cons!1548) (toList!765 lt!44646)) (bvslt (_1!1144 (h!2140 (toList!765 lt!44646))) (_1!1144 lt!44638))))))

(assert (=> d!24349 (isStrictlySorted!301 (toList!765 lt!44646))))

(assert (=> d!24349 (= (insertStrictlySorted!65 (toList!765 lt!44646) (_1!1144 lt!44638) (_2!1144 lt!44638)) lt!45290)))

(declare-fun b!92312 () Bool)

(assert (=> b!92312 (= e!60173 call!9096)))

(assert (= (and d!24349 c!15386) b!92314))

(assert (= (and d!24349 (not c!15386)) b!92313))

(assert (= (and b!92313 c!15385) b!92309))

(assert (= (and b!92313 (not c!15385)) b!92315))

(assert (= (and b!92315 c!15387) b!92312))

(assert (= (and b!92315 (not c!15387)) b!92317))

(assert (= (or b!92312 b!92317) bm!9093))

(assert (= (or b!92309 bm!9093) bm!9094))

(assert (= (or b!92314 bm!9094) bm!9095))

(assert (= (and bm!9095 c!15388) b!92311))

(assert (= (and bm!9095 (not c!15388)) b!92316))

(assert (= (and d!24349 res!46946) b!92308))

(assert (= (and b!92308 res!46945) b!92310))

(declare-fun m!99553 () Bool)

(assert (=> b!92308 m!99553))

(declare-fun m!99555 () Bool)

(assert (=> b!92311 m!99555))

(declare-fun m!99557 () Bool)

(assert (=> bm!9095 m!99557))

(declare-fun m!99559 () Bool)

(assert (=> b!92310 m!99559))

(declare-fun m!99561 () Bool)

(assert (=> d!24349 m!99561))

(declare-fun m!99563 () Bool)

(assert (=> d!24349 m!99563))

(assert (=> d!24151 d!24349))

(declare-fun d!24351 () Bool)

(declare-fun e!60176 () Bool)

(assert (=> d!24351 e!60176))

(declare-fun res!46947 () Bool)

(assert (=> d!24351 (=> res!46947 e!60176)))

(declare-fun lt!45292 () Bool)

(assert (=> d!24351 (= res!46947 (not lt!45292))))

(declare-fun lt!45291 () Bool)

(assert (=> d!24351 (= lt!45292 lt!45291)))

(declare-fun lt!45294 () Unit!2720)

(declare-fun e!60175 () Unit!2720)

(assert (=> d!24351 (= lt!45294 e!60175)))

(declare-fun c!15389 () Bool)

(assert (=> d!24351 (= c!15389 lt!45291)))

(assert (=> d!24351 (= lt!45291 (containsKey!149 (toList!765 lt!44841) (_1!1144 lt!44638)))))

(assert (=> d!24351 (= (contains!777 lt!44841 (_1!1144 lt!44638)) lt!45292)))

(declare-fun b!92318 () Bool)

(declare-fun lt!45293 () Unit!2720)

(assert (=> b!92318 (= e!60175 lt!45293)))

(assert (=> b!92318 (= lt!45293 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44841) (_1!1144 lt!44638)))))

(assert (=> b!92318 (isDefined!98 (getValueByKey!145 (toList!765 lt!44841) (_1!1144 lt!44638)))))

(declare-fun b!92319 () Bool)

(declare-fun Unit!2749 () Unit!2720)

(assert (=> b!92319 (= e!60175 Unit!2749)))

(declare-fun b!92320 () Bool)

(assert (=> b!92320 (= e!60176 (isDefined!98 (getValueByKey!145 (toList!765 lt!44841) (_1!1144 lt!44638))))))

(assert (= (and d!24351 c!15389) b!92318))

(assert (= (and d!24351 (not c!15389)) b!92319))

(assert (= (and d!24351 (not res!46947)) b!92320))

(declare-fun m!99565 () Bool)

(assert (=> d!24351 m!99565))

(declare-fun m!99567 () Bool)

(assert (=> b!92318 m!99567))

(assert (=> b!92318 m!98643))

(assert (=> b!92318 m!98643))

(declare-fun m!99569 () Bool)

(assert (=> b!92318 m!99569))

(assert (=> b!92320 m!98643))

(assert (=> b!92320 m!98643))

(assert (=> b!92320 m!99569))

(assert (=> d!24155 d!24351))

(declare-fun b!92323 () Bool)

(declare-fun e!60178 () Option!151)

(assert (=> b!92323 (= e!60178 (getValueByKey!145 (t!5386 lt!44843) (_1!1144 lt!44638)))))

(declare-fun b!92322 () Bool)

(declare-fun e!60177 () Option!151)

(assert (=> b!92322 (= e!60177 e!60178)))

(declare-fun c!15391 () Bool)

(assert (=> b!92322 (= c!15391 (and ((_ is Cons!1548) lt!44843) (not (= (_1!1144 (h!2140 lt!44843)) (_1!1144 lt!44638)))))))

(declare-fun b!92324 () Bool)

(assert (=> b!92324 (= e!60178 None!149)))

(declare-fun b!92321 () Bool)

(assert (=> b!92321 (= e!60177 (Some!150 (_2!1144 (h!2140 lt!44843))))))

(declare-fun d!24353 () Bool)

(declare-fun c!15390 () Bool)

(assert (=> d!24353 (= c!15390 (and ((_ is Cons!1548) lt!44843) (= (_1!1144 (h!2140 lt!44843)) (_1!1144 lt!44638))))))

(assert (=> d!24353 (= (getValueByKey!145 lt!44843 (_1!1144 lt!44638)) e!60177)))

(assert (= (and d!24353 c!15390) b!92321))

(assert (= (and d!24353 (not c!15390)) b!92322))

(assert (= (and b!92322 c!15391) b!92323))

(assert (= (and b!92322 (not c!15391)) b!92324))

(declare-fun m!99571 () Bool)

(assert (=> b!92323 m!99571))

(assert (=> d!24155 d!24353))

(declare-fun d!24355 () Bool)

(assert (=> d!24355 (= (getValueByKey!145 lt!44843 (_1!1144 lt!44638)) (Some!150 (_2!1144 lt!44638)))))

(declare-fun lt!45295 () Unit!2720)

(assert (=> d!24355 (= lt!45295 (choose!547 lt!44843 (_1!1144 lt!44638) (_2!1144 lt!44638)))))

(declare-fun e!60179 () Bool)

(assert (=> d!24355 e!60179))

(declare-fun res!46948 () Bool)

(assert (=> d!24355 (=> (not res!46948) (not e!60179))))

(assert (=> d!24355 (= res!46948 (isStrictlySorted!301 lt!44843))))

(assert (=> d!24355 (= (lemmaContainsTupThenGetReturnValue!62 lt!44843 (_1!1144 lt!44638) (_2!1144 lt!44638)) lt!45295)))

(declare-fun b!92325 () Bool)

(declare-fun res!46949 () Bool)

(assert (=> b!92325 (=> (not res!46949) (not e!60179))))

(assert (=> b!92325 (= res!46949 (containsKey!149 lt!44843 (_1!1144 lt!44638)))))

(declare-fun b!92326 () Bool)

(assert (=> b!92326 (= e!60179 (contains!780 lt!44843 (tuple2!2267 (_1!1144 lt!44638) (_2!1144 lt!44638))))))

(assert (= (and d!24355 res!46948) b!92325))

(assert (= (and b!92325 res!46949) b!92326))

(assert (=> d!24355 m!98637))

(declare-fun m!99573 () Bool)

(assert (=> d!24355 m!99573))

(declare-fun m!99575 () Bool)

(assert (=> d!24355 m!99575))

(declare-fun m!99577 () Bool)

(assert (=> b!92325 m!99577))

(declare-fun m!99579 () Bool)

(assert (=> b!92326 m!99579))

(assert (=> d!24155 d!24355))

(declare-fun bm!9096 () Bool)

(declare-fun call!9099 () List!1552)

(declare-fun call!9101 () List!1552)

(assert (=> bm!9096 (= call!9099 call!9101)))

(declare-fun b!92327 () Bool)

(declare-fun res!46950 () Bool)

(declare-fun e!60180 () Bool)

(assert (=> b!92327 (=> (not res!46950) (not e!60180))))

(declare-fun lt!45296 () List!1552)

(assert (=> b!92327 (= res!46950 (containsKey!149 lt!45296 (_1!1144 lt!44638)))))

(declare-fun b!92328 () Bool)

(declare-fun e!60181 () List!1552)

(assert (=> b!92328 (= e!60181 call!9101)))

(declare-fun b!92329 () Bool)

(assert (=> b!92329 (= e!60180 (contains!780 lt!45296 (tuple2!2267 (_1!1144 lt!44638) (_2!1144 lt!44638))))))

(declare-fun b!92330 () Bool)

(declare-fun e!60184 () List!1552)

(assert (=> b!92330 (= e!60184 (insertStrictlySorted!65 (t!5386 (toList!765 lt!44652)) (_1!1144 lt!44638) (_2!1144 lt!44638)))))

(declare-fun bm!9097 () Bool)

(declare-fun call!9100 () List!1552)

(assert (=> bm!9097 (= call!9101 call!9100)))

(declare-fun b!92332 () Bool)

(declare-fun e!60182 () List!1552)

(assert (=> b!92332 (= e!60182 e!60181)))

(declare-fun c!15392 () Bool)

(assert (=> b!92332 (= c!15392 (and ((_ is Cons!1548) (toList!765 lt!44652)) (= (_1!1144 (h!2140 (toList!765 lt!44652))) (_1!1144 lt!44638))))))

(declare-fun b!92333 () Bool)

(assert (=> b!92333 (= e!60182 call!9100)))

(declare-fun b!92334 () Bool)

(declare-fun c!15394 () Bool)

(assert (=> b!92334 (= c!15394 (and ((_ is Cons!1548) (toList!765 lt!44652)) (bvsgt (_1!1144 (h!2140 (toList!765 lt!44652))) (_1!1144 lt!44638))))))

(declare-fun e!60183 () List!1552)

(assert (=> b!92334 (= e!60181 e!60183)))

(declare-fun b!92335 () Bool)

(assert (=> b!92335 (= e!60184 (ite c!15392 (t!5386 (toList!765 lt!44652)) (ite c!15394 (Cons!1548 (h!2140 (toList!765 lt!44652)) (t!5386 (toList!765 lt!44652))) Nil!1549)))))

(declare-fun bm!9098 () Bool)

(declare-fun c!15393 () Bool)

(assert (=> bm!9098 (= call!9100 ($colon$colon!75 e!60184 (ite c!15393 (h!2140 (toList!765 lt!44652)) (tuple2!2267 (_1!1144 lt!44638) (_2!1144 lt!44638)))))))

(declare-fun c!15395 () Bool)

(assert (=> bm!9098 (= c!15395 c!15393)))

(declare-fun b!92336 () Bool)

(assert (=> b!92336 (= e!60183 call!9099)))

(declare-fun d!24357 () Bool)

(assert (=> d!24357 e!60180))

(declare-fun res!46951 () Bool)

(assert (=> d!24357 (=> (not res!46951) (not e!60180))))

(assert (=> d!24357 (= res!46951 (isStrictlySorted!301 lt!45296))))

(assert (=> d!24357 (= lt!45296 e!60182)))

(assert (=> d!24357 (= c!15393 (and ((_ is Cons!1548) (toList!765 lt!44652)) (bvslt (_1!1144 (h!2140 (toList!765 lt!44652))) (_1!1144 lt!44638))))))

(assert (=> d!24357 (isStrictlySorted!301 (toList!765 lt!44652))))

(assert (=> d!24357 (= (insertStrictlySorted!65 (toList!765 lt!44652) (_1!1144 lt!44638) (_2!1144 lt!44638)) lt!45296)))

(declare-fun b!92331 () Bool)

(assert (=> b!92331 (= e!60183 call!9099)))

(assert (= (and d!24357 c!15393) b!92333))

(assert (= (and d!24357 (not c!15393)) b!92332))

(assert (= (and b!92332 c!15392) b!92328))

(assert (= (and b!92332 (not c!15392)) b!92334))

(assert (= (and b!92334 c!15394) b!92331))

(assert (= (and b!92334 (not c!15394)) b!92336))

(assert (= (or b!92331 b!92336) bm!9096))

(assert (= (or b!92328 bm!9096) bm!9097))

(assert (= (or b!92333 bm!9097) bm!9098))

(assert (= (and bm!9098 c!15395) b!92330))

(assert (= (and bm!9098 (not c!15395)) b!92335))

(assert (= (and d!24357 res!46951) b!92327))

(assert (= (and b!92327 res!46950) b!92329))

(declare-fun m!99581 () Bool)

(assert (=> b!92327 m!99581))

(declare-fun m!99583 () Bool)

(assert (=> b!92330 m!99583))

(declare-fun m!99585 () Bool)

(assert (=> bm!9098 m!99585))

(declare-fun m!99587 () Bool)

(assert (=> b!92329 m!99587))

(declare-fun m!99589 () Bool)

(assert (=> d!24357 m!99589))

(assert (=> d!24357 m!99045))

(assert (=> d!24155 d!24357))

(declare-fun d!24359 () Bool)

(declare-fun res!46956 () Bool)

(declare-fun e!60189 () Bool)

(assert (=> d!24359 (=> res!46956 e!60189)))

(assert (=> d!24359 (= res!46956 (and ((_ is Cons!1548) (toList!765 lt!44653)) (= (_1!1144 (h!2140 (toList!765 lt!44653))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))))))

(assert (=> d!24359 (= (containsKey!149 (toList!765 lt!44653) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) e!60189)))

(declare-fun b!92341 () Bool)

(declare-fun e!60190 () Bool)

(assert (=> b!92341 (= e!60189 e!60190)))

(declare-fun res!46957 () Bool)

(assert (=> b!92341 (=> (not res!46957) (not e!60190))))

(assert (=> b!92341 (= res!46957 (and (or (not ((_ is Cons!1548) (toList!765 lt!44653))) (bvsle (_1!1144 (h!2140 (toList!765 lt!44653))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))) ((_ is Cons!1548) (toList!765 lt!44653)) (bvslt (_1!1144 (h!2140 (toList!765 lt!44653))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))))))

(declare-fun b!92342 () Bool)

(assert (=> b!92342 (= e!60190 (containsKey!149 (t!5386 (toList!765 lt!44653)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (= (and d!24359 (not res!46956)) b!92341))

(assert (= (and b!92341 res!46957) b!92342))

(assert (=> b!92342 m!98305))

(declare-fun m!99591 () Bool)

(assert (=> b!92342 m!99591))

(assert (=> d!24167 d!24359))

(declare-fun d!24361 () Bool)

(assert (=> d!24361 (= (inRange!0 (ite c!15273 (ite c!15275 (index!3133 lt!44947) (ite c!15269 (index!3132 lt!44942) (index!3135 lt!44942))) (ite c!15262 (index!3133 lt!44950) (ite c!15270 (index!3132 lt!44951) (index!3135 lt!44951)))) (mask!6466 newMap!16)) (and (bvsge (ite c!15273 (ite c!15275 (index!3133 lt!44947) (ite c!15269 (index!3132 lt!44942) (index!3135 lt!44942))) (ite c!15262 (index!3133 lt!44950) (ite c!15270 (index!3132 lt!44951) (index!3135 lt!44951)))) #b00000000000000000000000000000000) (bvslt (ite c!15273 (ite c!15275 (index!3133 lt!44947) (ite c!15269 (index!3132 lt!44942) (index!3135 lt!44942))) (ite c!15262 (index!3133 lt!44950) (ite c!15270 (index!3132 lt!44951) (index!3135 lt!44951)))) (bvadd (mask!6466 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!9014 d!24361))

(declare-fun d!24363 () Bool)

(declare-fun lt!45297 () Bool)

(assert (=> d!24363 (= lt!45297 (select (content!95 (toList!765 lt!44762)) lt!44649))))

(declare-fun e!60191 () Bool)

(assert (=> d!24363 (= lt!45297 e!60191)))

(declare-fun res!46958 () Bool)

(assert (=> d!24363 (=> (not res!46958) (not e!60191))))

(assert (=> d!24363 (= res!46958 ((_ is Cons!1548) (toList!765 lt!44762)))))

(assert (=> d!24363 (= (contains!780 (toList!765 lt!44762) lt!44649) lt!45297)))

(declare-fun b!92343 () Bool)

(declare-fun e!60192 () Bool)

(assert (=> b!92343 (= e!60191 e!60192)))

(declare-fun res!46959 () Bool)

(assert (=> b!92343 (=> res!46959 e!60192)))

(assert (=> b!92343 (= res!46959 (= (h!2140 (toList!765 lt!44762)) lt!44649))))

(declare-fun b!92344 () Bool)

(assert (=> b!92344 (= e!60192 (contains!780 (t!5386 (toList!765 lt!44762)) lt!44649))))

(assert (= (and d!24363 res!46958) b!92343))

(assert (= (and b!92343 (not res!46959)) b!92344))

(declare-fun m!99593 () Bool)

(assert (=> d!24363 m!99593))

(declare-fun m!99595 () Bool)

(assert (=> d!24363 m!99595))

(declare-fun m!99597 () Bool)

(assert (=> b!92344 m!99597))

(assert (=> b!91657 d!24363))

(declare-fun d!24365 () Bool)

(assert (=> d!24365 (= (apply!87 (+!127 lt!44859 (tuple2!2267 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44853) (apply!87 lt!44859 lt!44853))))

(declare-fun lt!45298 () Unit!2720)

(assert (=> d!24365 (= lt!45298 (choose!545 lt!44859 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44853))))

(declare-fun e!60193 () Bool)

(assert (=> d!24365 e!60193))

(declare-fun res!46960 () Bool)

(assert (=> d!24365 (=> (not res!46960) (not e!60193))))

(assert (=> d!24365 (= res!46960 (contains!777 lt!44859 lt!44853))))

(assert (=> d!24365 (= (addApplyDifferent!63 lt!44859 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44853) lt!45298)))

(declare-fun b!92345 () Bool)

(assert (=> b!92345 (= e!60193 (not (= lt!44853 lt!44849)))))

(assert (= (and d!24365 res!46960) b!92345))

(declare-fun m!99599 () Bool)

(assert (=> d!24365 m!99599))

(assert (=> d!24365 m!98669))

(declare-fun m!99601 () Bool)

(assert (=> d!24365 m!99601))

(assert (=> d!24365 m!98669))

(assert (=> d!24365 m!98671))

(assert (=> d!24365 m!98667))

(assert (=> b!91749 d!24365))

(declare-fun d!24367 () Bool)

(declare-fun e!60194 () Bool)

(assert (=> d!24367 e!60194))

(declare-fun res!46961 () Bool)

(assert (=> d!24367 (=> (not res!46961) (not e!60194))))

(declare-fun lt!45299 () ListLongMap!1499)

(assert (=> d!24367 (= res!46961 (contains!777 lt!45299 (_1!1144 (tuple2!2267 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun lt!45301 () List!1552)

(assert (=> d!24367 (= lt!45299 (ListLongMap!1500 lt!45301))))

(declare-fun lt!45300 () Unit!2720)

(declare-fun lt!45302 () Unit!2720)

(assert (=> d!24367 (= lt!45300 lt!45302)))

(assert (=> d!24367 (= (getValueByKey!145 lt!45301 (_1!1144 (tuple2!2267 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24367 (= lt!45302 (lemmaContainsTupThenGetReturnValue!62 lt!45301 (_1!1144 (tuple2!2267 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24367 (= lt!45301 (insertStrictlySorted!65 (toList!765 lt!44859) (_1!1144 (tuple2!2267 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24367 (= (+!127 lt!44859 (tuple2!2267 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!45299)))

(declare-fun b!92346 () Bool)

(declare-fun res!46962 () Bool)

(assert (=> b!92346 (=> (not res!46962) (not e!60194))))

(assert (=> b!92346 (= res!46962 (= (getValueByKey!145 (toList!765 lt!45299) (_1!1144 (tuple2!2267 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun b!92347 () Bool)

(assert (=> b!92347 (= e!60194 (contains!780 (toList!765 lt!45299) (tuple2!2267 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24367 res!46961) b!92346))

(assert (= (and b!92346 res!46962) b!92347))

(declare-fun m!99603 () Bool)

(assert (=> d!24367 m!99603))

(declare-fun m!99605 () Bool)

(assert (=> d!24367 m!99605))

(declare-fun m!99607 () Bool)

(assert (=> d!24367 m!99607))

(declare-fun m!99609 () Bool)

(assert (=> d!24367 m!99609))

(declare-fun m!99611 () Bool)

(assert (=> b!92346 m!99611))

(declare-fun m!99613 () Bool)

(assert (=> b!92347 m!99613))

(assert (=> b!91749 d!24367))

(assert (=> b!91749 d!24139))

(declare-fun d!24369 () Bool)

(assert (=> d!24369 (= (apply!87 lt!44859 lt!44853) (get!1240 (getValueByKey!145 (toList!765 lt!44859) lt!44853)))))

(declare-fun bs!3829 () Bool)

(assert (= bs!3829 d!24369))

(declare-fun m!99615 () Bool)

(assert (=> bs!3829 m!99615))

(assert (=> bs!3829 m!99615))

(declare-fun m!99617 () Bool)

(assert (=> bs!3829 m!99617))

(assert (=> b!91749 d!24369))

(declare-fun d!24371 () Bool)

(assert (=> d!24371 (= (apply!87 (+!127 lt!44864 (tuple2!2267 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44866) (apply!87 lt!44864 lt!44866))))

(declare-fun lt!45303 () Unit!2720)

(assert (=> d!24371 (= lt!45303 (choose!545 lt!44864 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44866))))

(declare-fun e!60195 () Bool)

(assert (=> d!24371 e!60195))

(declare-fun res!46963 () Bool)

(assert (=> d!24371 (=> (not res!46963) (not e!60195))))

(assert (=> d!24371 (= res!46963 (contains!777 lt!44864 lt!44866))))

(assert (=> d!24371 (= (addApplyDifferent!63 lt!44864 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44866) lt!45303)))

(declare-fun b!92348 () Bool)

(assert (=> b!92348 (= e!60195 (not (= lt!44866 lt!44846)))))

(assert (= (and d!24371 res!46963) b!92348))

(declare-fun m!99619 () Bool)

(assert (=> d!24371 m!99619))

(assert (=> d!24371 m!98687))

(declare-fun m!99621 () Bool)

(assert (=> d!24371 m!99621))

(assert (=> d!24371 m!98687))

(assert (=> d!24371 m!98689))

(assert (=> d!24371 m!98695))

(assert (=> b!91749 d!24371))

(declare-fun d!24373 () Bool)

(assert (=> d!24373 (contains!777 (+!127 lt!44851 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44862)))

(declare-fun lt!45304 () Unit!2720)

(assert (=> d!24373 (= lt!45304 (choose!546 lt!44851 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44862))))

(assert (=> d!24373 (contains!777 lt!44851 lt!44862)))

(assert (=> d!24373 (= (addStillContains!63 lt!44851 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44862) lt!45304)))

(declare-fun bs!3830 () Bool)

(assert (= bs!3830 d!24373))

(assert (=> bs!3830 m!98677))

(assert (=> bs!3830 m!98677))

(assert (=> bs!3830 m!98679))

(declare-fun m!99623 () Bool)

(assert (=> bs!3830 m!99623))

(declare-fun m!99625 () Bool)

(assert (=> bs!3830 m!99625))

(assert (=> b!91749 d!24373))

(declare-fun d!24375 () Bool)

(assert (=> d!24375 (= (apply!87 lt!44864 lt!44866) (get!1240 (getValueByKey!145 (toList!765 lt!44864) lt!44866)))))

(declare-fun bs!3831 () Bool)

(assert (= bs!3831 d!24375))

(declare-fun m!99627 () Bool)

(assert (=> bs!3831 m!99627))

(assert (=> bs!3831 m!99627))

(declare-fun m!99629 () Bool)

(assert (=> bs!3831 m!99629))

(assert (=> b!91749 d!24375))

(declare-fun d!24377 () Bool)

(assert (=> d!24377 (= (apply!87 lt!44857 lt!44856) (get!1240 (getValueByKey!145 (toList!765 lt!44857) lt!44856)))))

(declare-fun bs!3832 () Bool)

(assert (= bs!3832 d!24377))

(declare-fun m!99631 () Bool)

(assert (=> bs!3832 m!99631))

(assert (=> bs!3832 m!99631))

(declare-fun m!99633 () Bool)

(assert (=> bs!3832 m!99633))

(assert (=> b!91749 d!24377))

(declare-fun d!24379 () Bool)

(declare-fun e!60197 () Bool)

(assert (=> d!24379 e!60197))

(declare-fun res!46964 () Bool)

(assert (=> d!24379 (=> res!46964 e!60197)))

(declare-fun lt!45306 () Bool)

(assert (=> d!24379 (= res!46964 (not lt!45306))))

(declare-fun lt!45305 () Bool)

(assert (=> d!24379 (= lt!45306 lt!45305)))

(declare-fun lt!45308 () Unit!2720)

(declare-fun e!60196 () Unit!2720)

(assert (=> d!24379 (= lt!45308 e!60196)))

(declare-fun c!15396 () Bool)

(assert (=> d!24379 (= c!15396 lt!45305)))

(assert (=> d!24379 (= lt!45305 (containsKey!149 (toList!765 (+!127 lt!44851 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!44862))))

(assert (=> d!24379 (= (contains!777 (+!127 lt!44851 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44862) lt!45306)))

(declare-fun b!92349 () Bool)

(declare-fun lt!45307 () Unit!2720)

(assert (=> b!92349 (= e!60196 lt!45307)))

(assert (=> b!92349 (= lt!45307 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 (+!127 lt!44851 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!44862))))

(assert (=> b!92349 (isDefined!98 (getValueByKey!145 (toList!765 (+!127 lt!44851 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!44862))))

(declare-fun b!92350 () Bool)

(declare-fun Unit!2750 () Unit!2720)

(assert (=> b!92350 (= e!60196 Unit!2750)))

(declare-fun b!92351 () Bool)

(assert (=> b!92351 (= e!60197 (isDefined!98 (getValueByKey!145 (toList!765 (+!127 lt!44851 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!44862)))))

(assert (= (and d!24379 c!15396) b!92349))

(assert (= (and d!24379 (not c!15396)) b!92350))

(assert (= (and d!24379 (not res!46964)) b!92351))

(declare-fun m!99635 () Bool)

(assert (=> d!24379 m!99635))

(declare-fun m!99637 () Bool)

(assert (=> b!92349 m!99637))

(declare-fun m!99639 () Bool)

(assert (=> b!92349 m!99639))

(assert (=> b!92349 m!99639))

(declare-fun m!99641 () Bool)

(assert (=> b!92349 m!99641))

(assert (=> b!92351 m!99639))

(assert (=> b!92351 m!99639))

(assert (=> b!92351 m!99641))

(assert (=> b!91749 d!24379))

(declare-fun d!24381 () Bool)

(declare-fun e!60198 () Bool)

(assert (=> d!24381 e!60198))

(declare-fun res!46965 () Bool)

(assert (=> d!24381 (=> (not res!46965) (not e!60198))))

(declare-fun lt!45309 () ListLongMap!1499)

(assert (=> d!24381 (= res!46965 (contains!777 lt!45309 (_1!1144 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun lt!45311 () List!1552)

(assert (=> d!24381 (= lt!45309 (ListLongMap!1500 lt!45311))))

(declare-fun lt!45310 () Unit!2720)

(declare-fun lt!45312 () Unit!2720)

(assert (=> d!24381 (= lt!45310 lt!45312)))

(assert (=> d!24381 (= (getValueByKey!145 lt!45311 (_1!1144 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24381 (= lt!45312 (lemmaContainsTupThenGetReturnValue!62 lt!45311 (_1!1144 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24381 (= lt!45311 (insertStrictlySorted!65 (toList!765 lt!44851) (_1!1144 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24381 (= (+!127 lt!44851 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!45309)))

(declare-fun b!92352 () Bool)

(declare-fun res!46966 () Bool)

(assert (=> b!92352 (=> (not res!46966) (not e!60198))))

(assert (=> b!92352 (= res!46966 (= (getValueByKey!145 (toList!765 lt!45309) (_1!1144 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun b!92353 () Bool)

(assert (=> b!92353 (= e!60198 (contains!780 (toList!765 lt!45309) (tuple2!2267 lt!44865 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24381 res!46965) b!92352))

(assert (= (and b!92352 res!46966) b!92353))

(declare-fun m!99643 () Bool)

(assert (=> d!24381 m!99643))

(declare-fun m!99645 () Bool)

(assert (=> d!24381 m!99645))

(declare-fun m!99647 () Bool)

(assert (=> d!24381 m!99647))

(declare-fun m!99649 () Bool)

(assert (=> d!24381 m!99649))

(declare-fun m!99651 () Bool)

(assert (=> b!92352 m!99651))

(declare-fun m!99653 () Bool)

(assert (=> b!92353 m!99653))

(assert (=> b!91749 d!24381))

(declare-fun d!24383 () Bool)

(assert (=> d!24383 (= (apply!87 (+!127 lt!44864 (tuple2!2267 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44866) (get!1240 (getValueByKey!145 (toList!765 (+!127 lt!44864 (tuple2!2267 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!44866)))))

(declare-fun bs!3833 () Bool)

(assert (= bs!3833 d!24383))

(declare-fun m!99655 () Bool)

(assert (=> bs!3833 m!99655))

(assert (=> bs!3833 m!99655))

(declare-fun m!99657 () Bool)

(assert (=> bs!3833 m!99657))

(assert (=> b!91749 d!24383))

(declare-fun d!24385 () Bool)

(assert (=> d!24385 (= (apply!87 (+!127 lt!44857 (tuple2!2267 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44856) (apply!87 lt!44857 lt!44856))))

(declare-fun lt!45313 () Unit!2720)

(assert (=> d!24385 (= lt!45313 (choose!545 lt!44857 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44856))))

(declare-fun e!60199 () Bool)

(assert (=> d!24385 e!60199))

(declare-fun res!46967 () Bool)

(assert (=> d!24385 (=> (not res!46967) (not e!60199))))

(assert (=> d!24385 (= res!46967 (contains!777 lt!44857 lt!44856))))

(assert (=> d!24385 (= (addApplyDifferent!63 lt!44857 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992))) lt!44856) lt!45313)))

(declare-fun b!92354 () Bool)

(assert (=> b!92354 (= e!60199 (not (= lt!44856 lt!44860)))))

(assert (= (and d!24385 res!46967) b!92354))

(declare-fun m!99659 () Bool)

(assert (=> d!24385 m!99659))

(assert (=> d!24385 m!98673))

(declare-fun m!99661 () Bool)

(assert (=> d!24385 m!99661))

(assert (=> d!24385 m!98673))

(assert (=> d!24385 m!98675))

(assert (=> d!24385 m!98693))

(assert (=> b!91749 d!24385))

(declare-fun d!24387 () Bool)

(declare-fun e!60200 () Bool)

(assert (=> d!24387 e!60200))

(declare-fun res!46968 () Bool)

(assert (=> d!24387 (=> (not res!46968) (not e!60200))))

(declare-fun lt!45314 () ListLongMap!1499)

(assert (=> d!24387 (= res!46968 (contains!777 lt!45314 (_1!1144 (tuple2!2267 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun lt!45316 () List!1552)

(assert (=> d!24387 (= lt!45314 (ListLongMap!1500 lt!45316))))

(declare-fun lt!45315 () Unit!2720)

(declare-fun lt!45317 () Unit!2720)

(assert (=> d!24387 (= lt!45315 lt!45317)))

(assert (=> d!24387 (= (getValueByKey!145 lt!45316 (_1!1144 (tuple2!2267 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24387 (= lt!45317 (lemmaContainsTupThenGetReturnValue!62 lt!45316 (_1!1144 (tuple2!2267 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24387 (= lt!45316 (insertStrictlySorted!65 (toList!765 lt!44864) (_1!1144 (tuple2!2267 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24387 (= (+!127 lt!44864 (tuple2!2267 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!45314)))

(declare-fun b!92355 () Bool)

(declare-fun res!46969 () Bool)

(assert (=> b!92355 (=> (not res!46969) (not e!60200))))

(assert (=> b!92355 (= res!46969 (= (getValueByKey!145 (toList!765 lt!45314) (_1!1144 (tuple2!2267 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun b!92356 () Bool)

(assert (=> b!92356 (= e!60200 (contains!780 (toList!765 lt!45314) (tuple2!2267 lt!44846 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24387 res!46968) b!92355))

(assert (= (and b!92355 res!46969) b!92356))

(declare-fun m!99663 () Bool)

(assert (=> d!24387 m!99663))

(declare-fun m!99665 () Bool)

(assert (=> d!24387 m!99665))

(declare-fun m!99667 () Bool)

(assert (=> d!24387 m!99667))

(declare-fun m!99669 () Bool)

(assert (=> d!24387 m!99669))

(declare-fun m!99671 () Bool)

(assert (=> b!92355 m!99671))

(declare-fun m!99673 () Bool)

(assert (=> b!92356 m!99673))

(assert (=> b!91749 d!24387))

(declare-fun d!24389 () Bool)

(assert (=> d!24389 (= (apply!87 (+!127 lt!44859 (tuple2!2267 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44853) (get!1240 (getValueByKey!145 (toList!765 (+!127 lt!44859 (tuple2!2267 lt!44849 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!44853)))))

(declare-fun bs!3834 () Bool)

(assert (= bs!3834 d!24389))

(declare-fun m!99675 () Bool)

(assert (=> bs!3834 m!99675))

(assert (=> bs!3834 m!99675))

(declare-fun m!99677 () Bool)

(assert (=> bs!3834 m!99677))

(assert (=> b!91749 d!24389))

(declare-fun d!24391 () Bool)

(declare-fun e!60201 () Bool)

(assert (=> d!24391 e!60201))

(declare-fun res!46970 () Bool)

(assert (=> d!24391 (=> (not res!46970) (not e!60201))))

(declare-fun lt!45318 () ListLongMap!1499)

(assert (=> d!24391 (= res!46970 (contains!777 lt!45318 (_1!1144 (tuple2!2267 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun lt!45320 () List!1552)

(assert (=> d!24391 (= lt!45318 (ListLongMap!1500 lt!45320))))

(declare-fun lt!45319 () Unit!2720)

(declare-fun lt!45321 () Unit!2720)

(assert (=> d!24391 (= lt!45319 lt!45321)))

(assert (=> d!24391 (= (getValueByKey!145 lt!45320 (_1!1144 (tuple2!2267 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24391 (= lt!45321 (lemmaContainsTupThenGetReturnValue!62 lt!45320 (_1!1144 (tuple2!2267 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24391 (= lt!45320 (insertStrictlySorted!65 (toList!765 lt!44857) (_1!1144 (tuple2!2267 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24391 (= (+!127 lt!44857 (tuple2!2267 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!45318)))

(declare-fun b!92357 () Bool)

(declare-fun res!46971 () Bool)

(assert (=> b!92357 (=> (not res!46971) (not e!60201))))

(assert (=> b!92357 (= res!46971 (= (getValueByKey!145 (toList!765 lt!45318) (_1!1144 (tuple2!2267 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun b!92358 () Bool)

(assert (=> b!92358 (= e!60201 (contains!780 (toList!765 lt!45318) (tuple2!2267 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24391 res!46970) b!92357))

(assert (= (and b!92357 res!46971) b!92358))

(declare-fun m!99679 () Bool)

(assert (=> d!24391 m!99679))

(declare-fun m!99681 () Bool)

(assert (=> d!24391 m!99681))

(declare-fun m!99683 () Bool)

(assert (=> d!24391 m!99683))

(declare-fun m!99685 () Bool)

(assert (=> d!24391 m!99685))

(declare-fun m!99687 () Bool)

(assert (=> b!92357 m!99687))

(declare-fun m!99689 () Bool)

(assert (=> b!92358 m!99689))

(assert (=> b!91749 d!24391))

(declare-fun d!24393 () Bool)

(assert (=> d!24393 (= (apply!87 (+!127 lt!44857 (tuple2!2267 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!44856) (get!1240 (getValueByKey!145 (toList!765 (+!127 lt!44857 (tuple2!2267 lt!44860 (minValue!2294 (v!2721 (underlying!313 thiss!992)))))) lt!44856)))))

(declare-fun bs!3835 () Bool)

(assert (= bs!3835 d!24393))

(declare-fun m!99691 () Bool)

(assert (=> bs!3835 m!99691))

(assert (=> bs!3835 m!99691))

(declare-fun m!99693 () Bool)

(assert (=> bs!3835 m!99693))

(assert (=> b!91749 d!24393))

(assert (=> b!91718 d!24183))

(declare-fun d!24395 () Bool)

(declare-fun e!60202 () Bool)

(assert (=> d!24395 e!60202))

(declare-fun res!46972 () Bool)

(assert (=> d!24395 (=> (not res!46972) (not e!60202))))

(declare-fun lt!45322 () ListLongMap!1499)

(assert (=> d!24395 (= res!46972 (contains!777 lt!45322 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(declare-fun lt!45324 () List!1552)

(assert (=> d!24395 (= lt!45322 (ListLongMap!1500 lt!45324))))

(declare-fun lt!45323 () Unit!2720)

(declare-fun lt!45325 () Unit!2720)

(assert (=> d!24395 (= lt!45323 lt!45325)))

(assert (=> d!24395 (= (getValueByKey!145 lt!45324 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))) (Some!150 (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (=> d!24395 (= lt!45325 (lemmaContainsTupThenGetReturnValue!62 lt!45324 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (=> d!24395 (= lt!45324 (insertStrictlySorted!65 (toList!765 (+!127 lt!44642 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (=> d!24395 (= (+!127 (+!127 lt!44642 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) lt!45322)))

(declare-fun b!92359 () Bool)

(declare-fun res!46973 () Bool)

(assert (=> b!92359 (=> (not res!46973) (not e!60202))))

(assert (=> b!92359 (= res!46973 (= (getValueByKey!145 (toList!765 lt!45322) (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))) (Some!150 (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))))

(declare-fun b!92360 () Bool)

(assert (=> b!92360 (= e!60202 (contains!780 (toList!765 lt!45322) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))

(assert (= (and d!24395 res!46972) b!92359))

(assert (= (and b!92359 res!46973) b!92360))

(declare-fun m!99695 () Bool)

(assert (=> d!24395 m!99695))

(declare-fun m!99697 () Bool)

(assert (=> d!24395 m!99697))

(declare-fun m!99699 () Bool)

(assert (=> d!24395 m!99699))

(declare-fun m!99701 () Bool)

(assert (=> d!24395 m!99701))

(declare-fun m!99703 () Bool)

(assert (=> b!92359 m!99703))

(declare-fun m!99705 () Bool)

(assert (=> b!92360 m!99705))

(assert (=> d!24137 d!24395))

(declare-fun d!24397 () Bool)

(declare-fun e!60203 () Bool)

(assert (=> d!24397 e!60203))

(declare-fun res!46974 () Bool)

(assert (=> d!24397 (=> (not res!46974) (not e!60203))))

(declare-fun lt!45326 () ListLongMap!1499)

(assert (=> d!24397 (= res!46974 (contains!777 lt!45326 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(declare-fun lt!45328 () List!1552)

(assert (=> d!24397 (= lt!45326 (ListLongMap!1500 lt!45328))))

(declare-fun lt!45327 () Unit!2720)

(declare-fun lt!45329 () Unit!2720)

(assert (=> d!24397 (= lt!45327 lt!45329)))

(assert (=> d!24397 (= (getValueByKey!145 lt!45328 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))) (Some!150 (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (=> d!24397 (= lt!45329 (lemmaContainsTupThenGetReturnValue!62 lt!45328 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (=> d!24397 (= lt!45328 (insertStrictlySorted!65 (toList!765 lt!44642) (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))))))

(assert (=> d!24397 (= (+!127 lt!44642 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) lt!45326)))

(declare-fun b!92361 () Bool)

(declare-fun res!46975 () Bool)

(assert (=> b!92361 (=> (not res!46975) (not e!60203))))

(assert (=> b!92361 (= res!46975 (= (getValueByKey!145 (toList!765 lt!45326) (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))) (Some!150 (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))))

(declare-fun b!92362 () Bool)

(assert (=> b!92362 (= e!60203 (contains!780 (toList!765 lt!45326) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))

(assert (= (and d!24397 res!46974) b!92361))

(assert (= (and b!92361 res!46975) b!92362))

(declare-fun m!99707 () Bool)

(assert (=> d!24397 m!99707))

(declare-fun m!99709 () Bool)

(assert (=> d!24397 m!99709))

(declare-fun m!99711 () Bool)

(assert (=> d!24397 m!99711))

(declare-fun m!99713 () Bool)

(assert (=> d!24397 m!99713))

(declare-fun m!99715 () Bool)

(assert (=> b!92361 m!99715))

(declare-fun m!99717 () Bool)

(assert (=> b!92362 m!99717))

(assert (=> d!24137 d!24397))

(declare-fun d!24399 () Bool)

(declare-fun e!60204 () Bool)

(assert (=> d!24399 e!60204))

(declare-fun res!46976 () Bool)

(assert (=> d!24399 (=> (not res!46976) (not e!60204))))

(declare-fun lt!45330 () ListLongMap!1499)

(assert (=> d!24399 (= res!46976 (contains!777 lt!45330 (_1!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun lt!45332 () List!1552)

(assert (=> d!24399 (= lt!45330 (ListLongMap!1500 lt!45332))))

(declare-fun lt!45331 () Unit!2720)

(declare-fun lt!45333 () Unit!2720)

(assert (=> d!24399 (= lt!45331 lt!45333)))

(assert (=> d!24399 (= (getValueByKey!145 lt!45332 (_1!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24399 (= lt!45333 (lemmaContainsTupThenGetReturnValue!62 lt!45332 (_1!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24399 (= lt!45332 (insertStrictlySorted!65 (toList!765 lt!44642) (_1!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24399 (= (+!127 lt!44642 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!45330)))

(declare-fun b!92363 () Bool)

(declare-fun res!46977 () Bool)

(assert (=> b!92363 (=> (not res!46977) (not e!60204))))

(assert (=> b!92363 (= res!46977 (= (getValueByKey!145 (toList!765 lt!45330) (_1!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun b!92364 () Bool)

(assert (=> b!92364 (= e!60204 (contains!780 (toList!765 lt!45330) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24399 res!46976) b!92363))

(assert (= (and b!92363 res!46977) b!92364))

(declare-fun m!99719 () Bool)

(assert (=> d!24399 m!99719))

(declare-fun m!99721 () Bool)

(assert (=> d!24399 m!99721))

(declare-fun m!99723 () Bool)

(assert (=> d!24399 m!99723))

(declare-fun m!99725 () Bool)

(assert (=> d!24399 m!99725))

(declare-fun m!99727 () Bool)

(assert (=> b!92363 m!99727))

(declare-fun m!99729 () Bool)

(assert (=> b!92364 m!99729))

(assert (=> d!24137 d!24399))

(declare-fun d!24401 () Bool)

(assert (=> d!24401 (= (+!127 (+!127 lt!44642 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (+!127 (+!127 lt!44642 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)))))

(assert (=> d!24401 true))

(declare-fun _$28!155 () Unit!2720)

(assert (=> d!24401 (= (choose!544 lt!44642 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))) _$28!155)))

(declare-fun bs!3836 () Bool)

(assert (= bs!3836 d!24401))

(assert (=> bs!3836 m!98495))

(assert (=> bs!3836 m!98495))

(assert (=> bs!3836 m!98497))

(assert (=> bs!3836 m!98493))

(assert (=> bs!3836 m!98493))

(assert (=> bs!3836 m!98499))

(assert (=> d!24137 d!24401))

(declare-fun d!24403 () Bool)

(declare-fun e!60205 () Bool)

(assert (=> d!24403 e!60205))

(declare-fun res!46978 () Bool)

(assert (=> d!24403 (=> (not res!46978) (not e!60205))))

(declare-fun lt!45334 () ListLongMap!1499)

(assert (=> d!24403 (= res!46978 (contains!777 lt!45334 (_1!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(declare-fun lt!45336 () List!1552)

(assert (=> d!24403 (= lt!45334 (ListLongMap!1500 lt!45336))))

(declare-fun lt!45335 () Unit!2720)

(declare-fun lt!45337 () Unit!2720)

(assert (=> d!24403 (= lt!45335 lt!45337)))

(assert (=> d!24403 (= (getValueByKey!145 lt!45336 (_1!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24403 (= lt!45337 (lemmaContainsTupThenGetReturnValue!62 lt!45336 (_1!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24403 (= lt!45336 (insertStrictlySorted!65 (toList!765 (+!127 lt!44642 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644))) (_1!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) (_2!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))))))

(assert (=> d!24403 (= (+!127 (+!127 lt!44642 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))) lt!45334)))

(declare-fun b!92365 () Bool)

(declare-fun res!46979 () Bool)

(assert (=> b!92365 (=> (not res!46979) (not e!60205))))

(assert (=> b!92365 (= res!46979 (= (getValueByKey!145 (toList!765 lt!45334) (_1!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992)))))) (Some!150 (_2!1144 (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))))))))

(declare-fun b!92366 () Bool)

(assert (=> b!92366 (= e!60205 (contains!780 (toList!765 lt!45334) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 (v!2721 (underlying!313 thiss!992))))))))

(assert (= (and d!24403 res!46978) b!92365))

(assert (= (and b!92365 res!46979) b!92366))

(declare-fun m!99731 () Bool)

(assert (=> d!24403 m!99731))

(declare-fun m!99733 () Bool)

(assert (=> d!24403 m!99733))

(declare-fun m!99735 () Bool)

(assert (=> d!24403 m!99735))

(declare-fun m!99737 () Bool)

(assert (=> d!24403 m!99737))

(declare-fun m!99739 () Bool)

(assert (=> b!92365 m!99739))

(declare-fun m!99741 () Bool)

(assert (=> b!92366 m!99741))

(assert (=> d!24137 d!24403))

(assert (=> bm!8952 d!24193))

(declare-fun d!24405 () Bool)

(declare-fun e!60207 () Bool)

(assert (=> d!24405 e!60207))

(declare-fun res!46980 () Bool)

(assert (=> d!24405 (=> res!46980 e!60207)))

(declare-fun lt!45339 () Bool)

(assert (=> d!24405 (= res!46980 (not lt!45339))))

(declare-fun lt!45338 () Bool)

(assert (=> d!24405 (= lt!45339 lt!45338)))

(declare-fun lt!45341 () Unit!2720)

(declare-fun e!60206 () Unit!2720)

(assert (=> d!24405 (= lt!45341 e!60206)))

(declare-fun c!15397 () Bool)

(assert (=> d!24405 (= c!15397 lt!45338)))

(assert (=> d!24405 (= lt!45338 (containsKey!149 (toList!765 lt!44757) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24405 (= (contains!777 lt!44757 #b1000000000000000000000000000000000000000000000000000000000000000) lt!45339)))

(declare-fun b!92367 () Bool)

(declare-fun lt!45340 () Unit!2720)

(assert (=> b!92367 (= e!60206 lt!45340)))

(assert (=> b!92367 (= lt!45340 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44757) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92367 (isDefined!98 (getValueByKey!145 (toList!765 lt!44757) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92368 () Bool)

(declare-fun Unit!2751 () Unit!2720)

(assert (=> b!92368 (= e!60206 Unit!2751)))

(declare-fun b!92369 () Bool)

(assert (=> b!92369 (= e!60207 (isDefined!98 (getValueByKey!145 (toList!765 lt!44757) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24405 c!15397) b!92367))

(assert (= (and d!24405 (not c!15397)) b!92368))

(assert (= (and d!24405 (not res!46980)) b!92369))

(declare-fun m!99743 () Bool)

(assert (=> d!24405 m!99743))

(declare-fun m!99745 () Bool)

(assert (=> b!92367 m!99745))

(declare-fun m!99747 () Bool)

(assert (=> b!92367 m!99747))

(assert (=> b!92367 m!99747))

(declare-fun m!99749 () Bool)

(assert (=> b!92367 m!99749))

(assert (=> b!92369 m!99747))

(assert (=> b!92369 m!99747))

(assert (=> b!92369 m!99749))

(assert (=> b!91642 d!24405))

(declare-fun b!92378 () Bool)

(declare-fun e!60212 () (_ BitVec 32))

(declare-fun call!9104 () (_ BitVec 32))

(assert (=> b!92378 (= e!60212 (bvadd #b00000000000000000000000000000001 call!9104))))

(declare-fun d!24407 () Bool)

(declare-fun lt!45344 () (_ BitVec 32))

(assert (=> d!24407 (and (bvsge lt!45344 #b00000000000000000000000000000000) (bvsle lt!45344 (bvsub (size!2214 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000)))))

(declare-fun e!60213 () (_ BitVec 32))

(assert (=> d!24407 (= lt!45344 e!60213)))

(declare-fun c!15403 () Bool)

(assert (=> d!24407 (= c!15403 (bvsge #b00000000000000000000000000000000 (size!2214 (_keys!4086 (_2!1145 lt!44647)))))))

(assert (=> d!24407 (and (bvsle #b00000000000000000000000000000000 (size!2214 (_keys!4086 (_2!1145 lt!44647)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2214 (_keys!4086 (_2!1145 lt!44647))) (size!2214 (_keys!4086 (_2!1145 lt!44647)))))))

(assert (=> d!24407 (= (arrayCountValidKeys!0 (_keys!4086 (_2!1145 lt!44647)) #b00000000000000000000000000000000 (size!2214 (_keys!4086 (_2!1145 lt!44647)))) lt!45344)))

(declare-fun bm!9101 () Bool)

(assert (=> bm!9101 (= call!9104 (arrayCountValidKeys!0 (_keys!4086 (_2!1145 lt!44647)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2214 (_keys!4086 (_2!1145 lt!44647)))))))

(declare-fun b!92379 () Bool)

(assert (=> b!92379 (= e!60213 #b00000000000000000000000000000000)))

(declare-fun b!92380 () Bool)

(assert (=> b!92380 (= e!60213 e!60212)))

(declare-fun c!15402 () Bool)

(assert (=> b!92380 (= c!15402 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (_2!1145 lt!44647))) #b00000000000000000000000000000000)))))

(declare-fun b!92381 () Bool)

(assert (=> b!92381 (= e!60212 call!9104)))

(assert (= (and d!24407 c!15403) b!92379))

(assert (= (and d!24407 (not c!15403)) b!92380))

(assert (= (and b!92380 c!15402) b!92378))

(assert (= (and b!92380 (not c!15402)) b!92381))

(assert (= (or b!92378 b!92381) bm!9101))

(declare-fun m!99751 () Bool)

(assert (=> bm!9101 m!99751))

(assert (=> b!92380 m!98779))

(assert (=> b!92380 m!98779))

(assert (=> b!92380 m!98781))

(assert (=> b!91607 d!24407))

(declare-fun d!24409 () Bool)

(assert (=> d!24409 (= (get!1238 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) from!355) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2720 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> b!91731 d!24409))

(declare-fun b!92384 () Bool)

(declare-fun e!60215 () Option!151)

(assert (=> b!92384 (= e!60215 (getValueByKey!145 (t!5386 (toList!765 lt!44833)) (_1!1144 lt!44638)))))

(declare-fun b!92383 () Bool)

(declare-fun e!60214 () Option!151)

(assert (=> b!92383 (= e!60214 e!60215)))

(declare-fun c!15405 () Bool)

(assert (=> b!92383 (= c!15405 (and ((_ is Cons!1548) (toList!765 lt!44833)) (not (= (_1!1144 (h!2140 (toList!765 lt!44833))) (_1!1144 lt!44638)))))))

(declare-fun b!92385 () Bool)

(assert (=> b!92385 (= e!60215 None!149)))

(declare-fun b!92382 () Bool)

(assert (=> b!92382 (= e!60214 (Some!150 (_2!1144 (h!2140 (toList!765 lt!44833)))))))

(declare-fun d!24411 () Bool)

(declare-fun c!15404 () Bool)

(assert (=> d!24411 (= c!15404 (and ((_ is Cons!1548) (toList!765 lt!44833)) (= (_1!1144 (h!2140 (toList!765 lt!44833))) (_1!1144 lt!44638))))))

(assert (=> d!24411 (= (getValueByKey!145 (toList!765 lt!44833) (_1!1144 lt!44638)) e!60214)))

(assert (= (and d!24411 c!15404) b!92382))

(assert (= (and d!24411 (not c!15404)) b!92383))

(assert (= (and b!92383 c!15405) b!92384))

(assert (= (and b!92383 (not c!15405)) b!92385))

(declare-fun m!99753 () Bool)

(assert (=> b!92384 m!99753))

(assert (=> b!91721 d!24411))

(declare-fun b!92388 () Bool)

(declare-fun e!60217 () Option!151)

(assert (=> b!92388 (= e!60217 (getValueByKey!145 (t!5386 (toList!765 lt!44726)) (_1!1144 lt!44651)))))

(declare-fun b!92387 () Bool)

(declare-fun e!60216 () Option!151)

(assert (=> b!92387 (= e!60216 e!60217)))

(declare-fun c!15407 () Bool)

(assert (=> b!92387 (= c!15407 (and ((_ is Cons!1548) (toList!765 lt!44726)) (not (= (_1!1144 (h!2140 (toList!765 lt!44726))) (_1!1144 lt!44651)))))))

(declare-fun b!92389 () Bool)

(assert (=> b!92389 (= e!60217 None!149)))

(declare-fun b!92386 () Bool)

(assert (=> b!92386 (= e!60216 (Some!150 (_2!1144 (h!2140 (toList!765 lt!44726)))))))

(declare-fun d!24413 () Bool)

(declare-fun c!15406 () Bool)

(assert (=> d!24413 (= c!15406 (and ((_ is Cons!1548) (toList!765 lt!44726)) (= (_1!1144 (h!2140 (toList!765 lt!44726))) (_1!1144 lt!44651))))))

(assert (=> d!24413 (= (getValueByKey!145 (toList!765 lt!44726) (_1!1144 lt!44651)) e!60216)))

(assert (= (and d!24413 c!15406) b!92386))

(assert (= (and d!24413 (not c!15406)) b!92387))

(assert (= (and b!92387 c!15407) b!92388))

(assert (= (and b!92387 (not c!15407)) b!92389))

(declare-fun m!99755 () Bool)

(assert (=> b!92388 m!99755))

(assert (=> b!91614 d!24413))

(declare-fun d!24415 () Bool)

(assert (=> d!24415 (= (apply!87 lt!44861 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1240 (getValueByKey!145 (toList!765 lt!44861) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3837 () Bool)

(assert (= bs!3837 d!24415))

(declare-fun m!99757 () Bool)

(assert (=> bs!3837 m!99757))

(assert (=> bs!3837 m!99757))

(declare-fun m!99759 () Bool)

(assert (=> bs!3837 m!99759))

(assert (=> b!91737 d!24415))

(declare-fun d!24417 () Bool)

(assert (=> d!24417 (= (apply!87 lt!44861 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1240 (getValueByKey!145 (toList!765 lt!44861) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3838 () Bool)

(assert (= bs!3838 d!24417))

(declare-fun m!99761 () Bool)

(assert (=> bs!3838 m!99761))

(assert (=> bs!3838 m!99761))

(declare-fun m!99763 () Bool)

(assert (=> bs!3838 m!99763))

(assert (=> b!91752 d!24417))

(assert (=> d!24117 d!24121))

(declare-fun d!24419 () Bool)

(assert (=> d!24419 (not (arrayContainsKey!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!24419 true))

(declare-fun _$68!82 () Unit!2720)

(assert (=> d!24419 (= (choose!68 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (Cons!1547 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) Nil!1548)) _$68!82)))

(declare-fun bs!3839 () Bool)

(assert (= bs!3839 d!24419))

(assert (=> bs!3839 m!98305))

(assert (=> bs!3839 m!98331))

(assert (=> d!24117 d!24419))

(declare-fun b!92392 () Bool)

(declare-fun e!60219 () Option!151)

(assert (=> b!92392 (= e!60219 (getValueByKey!145 (t!5386 (toList!765 lt!44841)) (_1!1144 lt!44638)))))

(declare-fun b!92391 () Bool)

(declare-fun e!60218 () Option!151)

(assert (=> b!92391 (= e!60218 e!60219)))

(declare-fun c!15409 () Bool)

(assert (=> b!92391 (= c!15409 (and ((_ is Cons!1548) (toList!765 lt!44841)) (not (= (_1!1144 (h!2140 (toList!765 lt!44841))) (_1!1144 lt!44638)))))))

(declare-fun b!92393 () Bool)

(assert (=> b!92393 (= e!60219 None!149)))

(declare-fun b!92390 () Bool)

(assert (=> b!92390 (= e!60218 (Some!150 (_2!1144 (h!2140 (toList!765 lt!44841)))))))

(declare-fun d!24421 () Bool)

(declare-fun c!15408 () Bool)

(assert (=> d!24421 (= c!15408 (and ((_ is Cons!1548) (toList!765 lt!44841)) (= (_1!1144 (h!2140 (toList!765 lt!44841))) (_1!1144 lt!44638))))))

(assert (=> d!24421 (= (getValueByKey!145 (toList!765 lt!44841) (_1!1144 lt!44638)) e!60218)))

(assert (= (and d!24421 c!15408) b!92390))

(assert (= (and d!24421 (not c!15408)) b!92391))

(assert (= (and b!92391 c!15409) b!92392))

(assert (= (and b!92391 (not c!15409)) b!92393))

(declare-fun m!99765 () Bool)

(assert (=> b!92392 m!99765))

(assert (=> b!91725 d!24421))

(declare-fun b!92410 () Bool)

(declare-fun e!60230 () Bool)

(declare-fun e!60229 () Bool)

(assert (=> b!92410 (= e!60230 e!60229)))

(declare-fun res!46990 () Bool)

(declare-fun call!9110 () Bool)

(assert (=> b!92410 (= res!46990 call!9110)))

(assert (=> b!92410 (=> (not res!46990) (not e!60229))))

(declare-fun c!15414 () Bool)

(declare-fun lt!45350 () SeekEntryResult!248)

(declare-fun bm!9106 () Bool)

(assert (=> bm!9106 (= call!9110 (inRange!0 (ite c!15414 (index!3132 lt!45350) (index!3135 lt!45350)) (mask!6466 newMap!16)))))

(declare-fun b!92411 () Bool)

(declare-fun e!60228 () Bool)

(assert (=> b!92411 (= e!60230 e!60228)))

(declare-fun c!15415 () Bool)

(assert (=> b!92411 (= c!15415 ((_ is MissingVacant!248) lt!45350))))

(declare-fun b!92412 () Bool)

(assert (=> b!92412 (and (bvsge (index!3132 lt!45350) #b00000000000000000000000000000000) (bvslt (index!3132 lt!45350) (size!2214 (_keys!4086 newMap!16))))))

(declare-fun res!46991 () Bool)

(assert (=> b!92412 (= res!46991 (= (select (arr!1967 (_keys!4086 newMap!16)) (index!3132 lt!45350)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92412 (=> (not res!46991) (not e!60229))))

(declare-fun b!92413 () Bool)

(declare-fun call!9109 () Bool)

(assert (=> b!92413 (= e!60229 (not call!9109))))

(declare-fun bm!9107 () Bool)

(assert (=> bm!9107 (= call!9109 (arrayContainsKey!0 (_keys!4086 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!92414 () Bool)

(declare-fun res!46989 () Bool)

(declare-fun e!60231 () Bool)

(assert (=> b!92414 (=> (not res!46989) (not e!60231))))

(assert (=> b!92414 (= res!46989 call!9110)))

(assert (=> b!92414 (= e!60228 e!60231)))

(declare-fun d!24423 () Bool)

(assert (=> d!24423 e!60230))

(assert (=> d!24423 (= c!15414 ((_ is MissingZero!248) lt!45350))))

(assert (=> d!24423 (= lt!45350 (seekEntryOrOpen!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (_keys!4086 newMap!16) (mask!6466 newMap!16)))))

(declare-fun lt!45349 () Unit!2720)

(declare-fun choose!550 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 (_ BitVec 64) Int) Unit!2720)

(assert (=> d!24423 (= lt!45349 (choose!550 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (defaultEntry!2406 newMap!16)))))

(assert (=> d!24423 (validMask!0 (mask!6466 newMap!16))))

(assert (=> d!24423 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!36 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (defaultEntry!2406 newMap!16)) lt!45349)))

(declare-fun b!92415 () Bool)

(declare-fun res!46992 () Bool)

(assert (=> b!92415 (=> (not res!46992) (not e!60231))))

(assert (=> b!92415 (= res!46992 (= (select (arr!1967 (_keys!4086 newMap!16)) (index!3135 lt!45350)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92415 (and (bvsge (index!3135 lt!45350) #b00000000000000000000000000000000) (bvslt (index!3135 lt!45350) (size!2214 (_keys!4086 newMap!16))))))

(declare-fun b!92416 () Bool)

(assert (=> b!92416 (= e!60228 ((_ is Undefined!248) lt!45350))))

(declare-fun b!92417 () Bool)

(assert (=> b!92417 (= e!60231 (not call!9109))))

(assert (= (and d!24423 c!15414) b!92410))

(assert (= (and d!24423 (not c!15414)) b!92411))

(assert (= (and b!92410 res!46990) b!92412))

(assert (= (and b!92412 res!46991) b!92413))

(assert (= (and b!92411 c!15415) b!92414))

(assert (= (and b!92411 (not c!15415)) b!92416))

(assert (= (and b!92414 res!46989) b!92415))

(assert (= (and b!92415 res!46992) b!92417))

(assert (= (or b!92410 b!92414) bm!9106))

(assert (= (or b!92413 b!92417) bm!9107))

(assert (=> d!24423 m!98305))

(assert (=> d!24423 m!98729))

(assert (=> d!24423 m!98305))

(declare-fun m!99767 () Bool)

(assert (=> d!24423 m!99767))

(assert (=> d!24423 m!98855))

(declare-fun m!99769 () Bool)

(assert (=> b!92415 m!99769))

(declare-fun m!99771 () Bool)

(assert (=> b!92412 m!99771))

(assert (=> bm!9107 m!98305))

(assert (=> bm!9107 m!98743))

(declare-fun m!99773 () Bool)

(assert (=> bm!9106 m!99773))

(assert (=> bm!9030 d!24423))

(declare-fun d!24425 () Bool)

(declare-fun e!60233 () Bool)

(assert (=> d!24425 e!60233))

(declare-fun res!46993 () Bool)

(assert (=> d!24425 (=> res!46993 e!60233)))

(declare-fun lt!45352 () Bool)

(assert (=> d!24425 (= res!46993 (not lt!45352))))

(declare-fun lt!45351 () Bool)

(assert (=> d!24425 (= lt!45352 lt!45351)))

(declare-fun lt!45354 () Unit!2720)

(declare-fun e!60232 () Unit!2720)

(assert (=> d!24425 (= lt!45354 e!60232)))

(declare-fun c!15416 () Bool)

(assert (=> d!24425 (= c!15416 lt!45351)))

(assert (=> d!24425 (= lt!45351 (containsKey!149 (toList!765 lt!44861) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24425 (= (contains!777 lt!44861 #b0000000000000000000000000000000000000000000000000000000000000000) lt!45352)))

(declare-fun b!92418 () Bool)

(declare-fun lt!45353 () Unit!2720)

(assert (=> b!92418 (= e!60232 lt!45353)))

(assert (=> b!92418 (= lt!45353 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44861) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92418 (isDefined!98 (getValueByKey!145 (toList!765 lt!44861) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92419 () Bool)

(declare-fun Unit!2752 () Unit!2720)

(assert (=> b!92419 (= e!60232 Unit!2752)))

(declare-fun b!92420 () Bool)

(assert (=> b!92420 (= e!60233 (isDefined!98 (getValueByKey!145 (toList!765 lt!44861) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24425 c!15416) b!92418))

(assert (= (and d!24425 (not c!15416)) b!92419))

(assert (= (and d!24425 (not res!46993)) b!92420))

(declare-fun m!99775 () Bool)

(assert (=> d!24425 m!99775))

(declare-fun m!99777 () Bool)

(assert (=> b!92418 m!99777))

(assert (=> b!92418 m!99757))

(assert (=> b!92418 m!99757))

(declare-fun m!99779 () Bool)

(assert (=> b!92418 m!99779))

(assert (=> b!92420 m!99757))

(assert (=> b!92420 m!99757))

(assert (=> b!92420 m!99779))

(assert (=> bm!8960 d!24425))

(assert (=> b!91649 d!24189))

(declare-fun b!92421 () Bool)

(declare-fun e!60237 () Bool)

(declare-fun e!60234 () Bool)

(assert (=> b!92421 (= e!60237 e!60234)))

(declare-fun res!46994 () Bool)

(assert (=> b!92421 (=> (not res!46994) (not e!60234))))

(declare-fun e!60236 () Bool)

(assert (=> b!92421 (= res!46994 (not e!60236))))

(declare-fun res!46995 () Bool)

(assert (=> b!92421 (=> (not res!46995) (not e!60236))))

(assert (=> b!92421 (= res!46995 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun call!9111 () Bool)

(declare-fun c!15417 () Bool)

(declare-fun bm!9108 () Bool)

(assert (=> bm!9108 (= call!9111 (arrayNoDuplicates!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!15417 (Cons!1547 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!15191 (Cons!1547 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) Nil!1548) Nil!1548)) (ite c!15191 (Cons!1547 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) Nil!1548) Nil!1548))))))

(declare-fun b!92422 () Bool)

(assert (=> b!92422 (= e!60236 (contains!779 (ite c!15191 (Cons!1547 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) Nil!1548) Nil!1548) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!92423 () Bool)

(declare-fun e!60235 () Bool)

(assert (=> b!92423 (= e!60235 call!9111)))

(declare-fun b!92424 () Bool)

(assert (=> b!92424 (= e!60235 call!9111)))

(declare-fun d!24427 () Bool)

(declare-fun res!46996 () Bool)

(assert (=> d!24427 (=> res!46996 e!60237)))

(assert (=> d!24427 (= res!46996 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(assert (=> d!24427 (= (arrayNoDuplicates!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15191 (Cons!1547 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) Nil!1548) Nil!1548)) e!60237)))

(declare-fun b!92425 () Bool)

(assert (=> b!92425 (= e!60234 e!60235)))

(assert (=> b!92425 (= c!15417 (validKeyInArray!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!24427 (not res!46996)) b!92421))

(assert (= (and b!92421 res!46995) b!92422))

(assert (= (and b!92421 res!46994) b!92425))

(assert (= (and b!92425 c!15417) b!92424))

(assert (= (and b!92425 (not c!15417)) b!92423))

(assert (= (or b!92424 b!92423) bm!9108))

(declare-fun m!99781 () Bool)

(assert (=> b!92421 m!99781))

(assert (=> b!92421 m!99781))

(declare-fun m!99783 () Bool)

(assert (=> b!92421 m!99783))

(assert (=> bm!9108 m!99781))

(declare-fun m!99785 () Bool)

(assert (=> bm!9108 m!99785))

(assert (=> b!92422 m!99781))

(assert (=> b!92422 m!99781))

(declare-fun m!99787 () Bool)

(assert (=> b!92422 m!99787))

(assert (=> b!92425 m!99781))

(assert (=> b!92425 m!99781))

(assert (=> b!92425 m!99783))

(assert (=> bm!8933 d!24427))

(assert (=> d!24165 d!24225))

(declare-fun d!24429 () Bool)

(declare-fun res!46997 () Bool)

(declare-fun e!60238 () Bool)

(assert (=> d!24429 (=> res!46997 e!60238)))

(assert (=> d!24429 (= res!46997 (= (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> d!24429 (= (arrayContainsKey!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!60238)))

(declare-fun b!92426 () Bool)

(declare-fun e!60239 () Bool)

(assert (=> b!92426 (= e!60238 e!60239)))

(declare-fun res!46998 () Bool)

(assert (=> b!92426 (=> (not res!46998) (not e!60239))))

(assert (=> b!92426 (= res!46998 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2214 (_keys!4086 (v!2721 (underlying!313 thiss!992))))))))

(declare-fun b!92427 () Bool)

(assert (=> b!92427 (= e!60239 (arrayContainsKey!0 (_keys!4086 (v!2721 (underlying!313 thiss!992))) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!24429 (not res!46997)) b!92426))

(assert (= (and b!92426 res!46998) b!92427))

(assert (=> d!24429 m!99123))

(assert (=> b!92427 m!98305))

(declare-fun m!99789 () Bool)

(assert (=> b!92427 m!99789))

(assert (=> b!91579 d!24429))

(declare-fun d!24431 () Bool)

(declare-fun e!60241 () Bool)

(assert (=> d!24431 e!60241))

(declare-fun res!46999 () Bool)

(assert (=> d!24431 (=> res!46999 e!60241)))

(declare-fun lt!45356 () Bool)

(assert (=> d!24431 (= res!46999 (not lt!45356))))

(declare-fun lt!45355 () Bool)

(assert (=> d!24431 (= lt!45356 lt!45355)))

(declare-fun lt!45358 () Unit!2720)

(declare-fun e!60240 () Unit!2720)

(assert (=> d!24431 (= lt!45358 e!60240)))

(declare-fun c!15418 () Bool)

(assert (=> d!24431 (= c!15418 lt!45355)))

(assert (=> d!24431 (= lt!45355 (containsKey!149 (toList!765 call!9032) (select (arr!1967 (_keys!4086 newMap!16)) (index!3133 lt!44956))))))

(assert (=> d!24431 (= (contains!777 call!9032 (select (arr!1967 (_keys!4086 newMap!16)) (index!3133 lt!44956))) lt!45356)))

(declare-fun b!92428 () Bool)

(declare-fun lt!45357 () Unit!2720)

(assert (=> b!92428 (= e!60240 lt!45357)))

(assert (=> b!92428 (= lt!45357 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 call!9032) (select (arr!1967 (_keys!4086 newMap!16)) (index!3133 lt!44956))))))

(assert (=> b!92428 (isDefined!98 (getValueByKey!145 (toList!765 call!9032) (select (arr!1967 (_keys!4086 newMap!16)) (index!3133 lt!44956))))))

(declare-fun b!92429 () Bool)

(declare-fun Unit!2753 () Unit!2720)

(assert (=> b!92429 (= e!60240 Unit!2753)))

(declare-fun b!92430 () Bool)

(assert (=> b!92430 (= e!60241 (isDefined!98 (getValueByKey!145 (toList!765 call!9032) (select (arr!1967 (_keys!4086 newMap!16)) (index!3133 lt!44956)))))))

(assert (= (and d!24431 c!15418) b!92428))

(assert (= (and d!24431 (not c!15418)) b!92429))

(assert (= (and d!24431 (not res!46999)) b!92430))

(assert (=> d!24431 m!98751))

(declare-fun m!99791 () Bool)

(assert (=> d!24431 m!99791))

(assert (=> b!92428 m!98751))

(declare-fun m!99793 () Bool)

(assert (=> b!92428 m!99793))

(assert (=> b!92428 m!98751))

(declare-fun m!99795 () Bool)

(assert (=> b!92428 m!99795))

(assert (=> b!92428 m!99795))

(declare-fun m!99797 () Bool)

(assert (=> b!92428 m!99797))

(assert (=> b!92430 m!98751))

(assert (=> b!92430 m!99795))

(assert (=> b!92430 m!99795))

(assert (=> b!92430 m!99797))

(assert (=> b!91887 d!24431))

(declare-fun d!24433 () Bool)

(declare-fun e!60244 () Bool)

(assert (=> d!24433 e!60244))

(declare-fun res!47002 () Bool)

(assert (=> d!24433 (=> (not res!47002) (not e!60244))))

(assert (=> d!24433 (= res!47002 (and (bvsge (index!3133 lt!44956) #b00000000000000000000000000000000) (bvslt (index!3133 lt!44956) (size!2214 (_keys!4086 newMap!16)))))))

(declare-fun lt!45361 () Unit!2720)

(declare-fun choose!551 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 (_ BitVec 32) Int) Unit!2720)

(assert (=> d!24433 (= lt!45361 (choose!551 (_keys!4086 newMap!16) lt!44955 (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (index!3133 lt!44956) (defaultEntry!2406 newMap!16)))))

(assert (=> d!24433 (validMask!0 (mask!6466 newMap!16))))

(assert (=> d!24433 (= (lemmaValidKeyInArrayIsInListMap!97 (_keys!4086 newMap!16) lt!44955 (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (index!3133 lt!44956) (defaultEntry!2406 newMap!16)) lt!45361)))

(declare-fun b!92433 () Bool)

(assert (=> b!92433 (= e!60244 (contains!777 (getCurrentListMap!457 (_keys!4086 newMap!16) lt!44955 (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)) (select (arr!1967 (_keys!4086 newMap!16)) (index!3133 lt!44956))))))

(assert (= (and d!24433 res!47002) b!92433))

(declare-fun m!99799 () Bool)

(assert (=> d!24433 m!99799))

(assert (=> d!24433 m!98855))

(declare-fun m!99801 () Bool)

(assert (=> b!92433 m!99801))

(assert (=> b!92433 m!98751))

(assert (=> b!92433 m!99801))

(assert (=> b!92433 m!98751))

(declare-fun m!99803 () Bool)

(assert (=> b!92433 m!99803))

(assert (=> b!91887 d!24433))

(declare-fun d!24435 () Bool)

(declare-fun e!60247 () Bool)

(assert (=> d!24435 e!60247))

(declare-fun res!47005 () Bool)

(assert (=> d!24435 (=> (not res!47005) (not e!60247))))

(assert (=> d!24435 (= res!47005 (and (bvsge (index!3133 lt!44956) #b00000000000000000000000000000000) (bvslt (index!3133 lt!44956) (size!2215 (_values!2389 newMap!16)))))))

(declare-fun lt!45364 () Unit!2720)

(declare-fun choose!552 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 (_ BitVec 32) (_ BitVec 64) V!3091 Int) Unit!2720)

(assert (=> d!24435 (= lt!45364 (choose!552 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (index!3133 lt!44956) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644 (defaultEntry!2406 newMap!16)))))

(assert (=> d!24435 (validMask!0 (mask!6466 newMap!16))))

(assert (=> d!24435 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!36 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (index!3133 lt!44956) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644 (defaultEntry!2406 newMap!16)) lt!45364)))

(declare-fun b!92436 () Bool)

(assert (=> b!92436 (= e!60247 (= (+!127 (getCurrentListMap!457 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) lt!44644)) (getCurrentListMap!457 (_keys!4086 newMap!16) (array!4138 (store (arr!1968 (_values!2389 newMap!16)) (index!3133 lt!44956) (ValueCellFull!948 lt!44644)) (size!2215 (_values!2389 newMap!16))) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16))))))

(assert (= (and d!24435 res!47005) b!92436))

(assert (=> d!24435 m!98305))

(declare-fun m!99805 () Bool)

(assert (=> d!24435 m!99805))

(assert (=> d!24435 m!98855))

(assert (=> b!92436 m!98661))

(assert (=> b!92436 m!98661))

(assert (=> b!92436 m!99375))

(assert (=> b!92436 m!98757))

(declare-fun m!99807 () Bool)

(assert (=> b!92436 m!99807))

(assert (=> b!91887 d!24435))

(assert (=> b!91860 d!24261))

(declare-fun d!24437 () Bool)

(declare-fun e!60249 () Bool)

(assert (=> d!24437 e!60249))

(declare-fun res!47006 () Bool)

(assert (=> d!24437 (=> res!47006 e!60249)))

(declare-fun lt!45366 () Bool)

(assert (=> d!24437 (= res!47006 (not lt!45366))))

(declare-fun lt!45365 () Bool)

(assert (=> d!24437 (= lt!45366 lt!45365)))

(declare-fun lt!45368 () Unit!2720)

(declare-fun e!60248 () Unit!2720)

(assert (=> d!24437 (= lt!45368 e!60248)))

(declare-fun c!15419 () Bool)

(assert (=> d!24437 (= c!15419 lt!45365)))

(assert (=> d!24437 (= lt!45365 (containsKey!149 (toList!765 lt!44762) (_1!1144 lt!44649)))))

(assert (=> d!24437 (= (contains!777 lt!44762 (_1!1144 lt!44649)) lt!45366)))

(declare-fun b!92437 () Bool)

(declare-fun lt!45367 () Unit!2720)

(assert (=> b!92437 (= e!60248 lt!45367)))

(assert (=> b!92437 (= lt!45367 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44762) (_1!1144 lt!44649)))))

(assert (=> b!92437 (isDefined!98 (getValueByKey!145 (toList!765 lt!44762) (_1!1144 lt!44649)))))

(declare-fun b!92438 () Bool)

(declare-fun Unit!2754 () Unit!2720)

(assert (=> b!92438 (= e!60248 Unit!2754)))

(declare-fun b!92439 () Bool)

(assert (=> b!92439 (= e!60249 (isDefined!98 (getValueByKey!145 (toList!765 lt!44762) (_1!1144 lt!44649))))))

(assert (= (and d!24437 c!15419) b!92437))

(assert (= (and d!24437 (not c!15419)) b!92438))

(assert (= (and d!24437 (not res!47006)) b!92439))

(declare-fun m!99809 () Bool)

(assert (=> d!24437 m!99809))

(declare-fun m!99811 () Bool)

(assert (=> b!92437 m!99811))

(assert (=> b!92437 m!98547))

(assert (=> b!92437 m!98547))

(declare-fun m!99813 () Bool)

(assert (=> b!92437 m!99813))

(assert (=> b!92439 m!98547))

(assert (=> b!92439 m!98547))

(assert (=> b!92439 m!99813))

(assert (=> d!24143 d!24437))

(declare-fun b!92442 () Bool)

(declare-fun e!60251 () Option!151)

(assert (=> b!92442 (= e!60251 (getValueByKey!145 (t!5386 lt!44764) (_1!1144 lt!44649)))))

(declare-fun b!92441 () Bool)

(declare-fun e!60250 () Option!151)

(assert (=> b!92441 (= e!60250 e!60251)))

(declare-fun c!15421 () Bool)

(assert (=> b!92441 (= c!15421 (and ((_ is Cons!1548) lt!44764) (not (= (_1!1144 (h!2140 lt!44764)) (_1!1144 lt!44649)))))))

(declare-fun b!92443 () Bool)

(assert (=> b!92443 (= e!60251 None!149)))

(declare-fun b!92440 () Bool)

(assert (=> b!92440 (= e!60250 (Some!150 (_2!1144 (h!2140 lt!44764))))))

(declare-fun d!24439 () Bool)

(declare-fun c!15420 () Bool)

(assert (=> d!24439 (= c!15420 (and ((_ is Cons!1548) lt!44764) (= (_1!1144 (h!2140 lt!44764)) (_1!1144 lt!44649))))))

(assert (=> d!24439 (= (getValueByKey!145 lt!44764 (_1!1144 lt!44649)) e!60250)))

(assert (= (and d!24439 c!15420) b!92440))

(assert (= (and d!24439 (not c!15420)) b!92441))

(assert (= (and b!92441 c!15421) b!92442))

(assert (= (and b!92441 (not c!15421)) b!92443))

(declare-fun m!99815 () Bool)

(assert (=> b!92442 m!99815))

(assert (=> d!24143 d!24439))

(declare-fun d!24441 () Bool)

(assert (=> d!24441 (= (getValueByKey!145 lt!44764 (_1!1144 lt!44649)) (Some!150 (_2!1144 lt!44649)))))

(declare-fun lt!45369 () Unit!2720)

(assert (=> d!24441 (= lt!45369 (choose!547 lt!44764 (_1!1144 lt!44649) (_2!1144 lt!44649)))))

(declare-fun e!60252 () Bool)

(assert (=> d!24441 e!60252))

(declare-fun res!47007 () Bool)

(assert (=> d!24441 (=> (not res!47007) (not e!60252))))

(assert (=> d!24441 (= res!47007 (isStrictlySorted!301 lt!44764))))

(assert (=> d!24441 (= (lemmaContainsTupThenGetReturnValue!62 lt!44764 (_1!1144 lt!44649) (_2!1144 lt!44649)) lt!45369)))

(declare-fun b!92444 () Bool)

(declare-fun res!47008 () Bool)

(assert (=> b!92444 (=> (not res!47008) (not e!60252))))

(assert (=> b!92444 (= res!47008 (containsKey!149 lt!44764 (_1!1144 lt!44649)))))

(declare-fun b!92445 () Bool)

(assert (=> b!92445 (= e!60252 (contains!780 lt!44764 (tuple2!2267 (_1!1144 lt!44649) (_2!1144 lt!44649))))))

(assert (= (and d!24441 res!47007) b!92444))

(assert (= (and b!92444 res!47008) b!92445))

(assert (=> d!24441 m!98541))

(declare-fun m!99817 () Bool)

(assert (=> d!24441 m!99817))

(declare-fun m!99819 () Bool)

(assert (=> d!24441 m!99819))

(declare-fun m!99821 () Bool)

(assert (=> b!92444 m!99821))

(declare-fun m!99823 () Bool)

(assert (=> b!92445 m!99823))

(assert (=> d!24143 d!24441))

(declare-fun bm!9109 () Bool)

(declare-fun call!9112 () List!1552)

(declare-fun call!9114 () List!1552)

(assert (=> bm!9109 (= call!9112 call!9114)))

(declare-fun b!92446 () Bool)

(declare-fun res!47009 () Bool)

(declare-fun e!60253 () Bool)

(assert (=> b!92446 (=> (not res!47009) (not e!60253))))

(declare-fun lt!45370 () List!1552)

(assert (=> b!92446 (= res!47009 (containsKey!149 lt!45370 (_1!1144 lt!44649)))))

(declare-fun b!92447 () Bool)

(declare-fun e!60254 () List!1552)

(assert (=> b!92447 (= e!60254 call!9114)))

(declare-fun b!92448 () Bool)

(assert (=> b!92448 (= e!60253 (contains!780 lt!45370 (tuple2!2267 (_1!1144 lt!44649) (_2!1144 lt!44649))))))

(declare-fun b!92449 () Bool)

(declare-fun e!60257 () List!1552)

(assert (=> b!92449 (= e!60257 (insertStrictlySorted!65 (t!5386 (toList!765 lt!44654)) (_1!1144 lt!44649) (_2!1144 lt!44649)))))

(declare-fun bm!9110 () Bool)

(declare-fun call!9113 () List!1552)

(assert (=> bm!9110 (= call!9114 call!9113)))

(declare-fun b!92451 () Bool)

(declare-fun e!60255 () List!1552)

(assert (=> b!92451 (= e!60255 e!60254)))

(declare-fun c!15422 () Bool)

(assert (=> b!92451 (= c!15422 (and ((_ is Cons!1548) (toList!765 lt!44654)) (= (_1!1144 (h!2140 (toList!765 lt!44654))) (_1!1144 lt!44649))))))

(declare-fun b!92452 () Bool)

(assert (=> b!92452 (= e!60255 call!9113)))

(declare-fun b!92453 () Bool)

(declare-fun c!15424 () Bool)

(assert (=> b!92453 (= c!15424 (and ((_ is Cons!1548) (toList!765 lt!44654)) (bvsgt (_1!1144 (h!2140 (toList!765 lt!44654))) (_1!1144 lt!44649))))))

(declare-fun e!60256 () List!1552)

(assert (=> b!92453 (= e!60254 e!60256)))

(declare-fun b!92454 () Bool)

(assert (=> b!92454 (= e!60257 (ite c!15422 (t!5386 (toList!765 lt!44654)) (ite c!15424 (Cons!1548 (h!2140 (toList!765 lt!44654)) (t!5386 (toList!765 lt!44654))) Nil!1549)))))

(declare-fun c!15423 () Bool)

(declare-fun bm!9111 () Bool)

(assert (=> bm!9111 (= call!9113 ($colon$colon!75 e!60257 (ite c!15423 (h!2140 (toList!765 lt!44654)) (tuple2!2267 (_1!1144 lt!44649) (_2!1144 lt!44649)))))))

(declare-fun c!15425 () Bool)

(assert (=> bm!9111 (= c!15425 c!15423)))

(declare-fun b!92455 () Bool)

(assert (=> b!92455 (= e!60256 call!9112)))

(declare-fun d!24443 () Bool)

(assert (=> d!24443 e!60253))

(declare-fun res!47010 () Bool)

(assert (=> d!24443 (=> (not res!47010) (not e!60253))))

(assert (=> d!24443 (= res!47010 (isStrictlySorted!301 lt!45370))))

(assert (=> d!24443 (= lt!45370 e!60255)))

(assert (=> d!24443 (= c!15423 (and ((_ is Cons!1548) (toList!765 lt!44654)) (bvslt (_1!1144 (h!2140 (toList!765 lt!44654))) (_1!1144 lt!44649))))))

(assert (=> d!24443 (isStrictlySorted!301 (toList!765 lt!44654))))

(assert (=> d!24443 (= (insertStrictlySorted!65 (toList!765 lt!44654) (_1!1144 lt!44649) (_2!1144 lt!44649)) lt!45370)))

(declare-fun b!92450 () Bool)

(assert (=> b!92450 (= e!60256 call!9112)))

(assert (= (and d!24443 c!15423) b!92452))

(assert (= (and d!24443 (not c!15423)) b!92451))

(assert (= (and b!92451 c!15422) b!92447))

(assert (= (and b!92451 (not c!15422)) b!92453))

(assert (= (and b!92453 c!15424) b!92450))

(assert (= (and b!92453 (not c!15424)) b!92455))

(assert (= (or b!92450 b!92455) bm!9109))

(assert (= (or b!92447 bm!9109) bm!9110))

(assert (= (or b!92452 bm!9110) bm!9111))

(assert (= (and bm!9111 c!15425) b!92449))

(assert (= (and bm!9111 (not c!15425)) b!92454))

(assert (= (and d!24443 res!47010) b!92446))

(assert (= (and b!92446 res!47009) b!92448))

(declare-fun m!99825 () Bool)

(assert (=> b!92446 m!99825))

(declare-fun m!99827 () Bool)

(assert (=> b!92449 m!99827))

(declare-fun m!99829 () Bool)

(assert (=> bm!9111 m!99829))

(declare-fun m!99831 () Bool)

(assert (=> b!92448 m!99831))

(declare-fun m!99833 () Bool)

(assert (=> d!24443 m!99833))

(declare-fun m!99835 () Bool)

(assert (=> d!24443 m!99835))

(assert (=> d!24143 d!24443))

(assert (=> b!91653 d!24181))

(declare-fun d!24445 () Bool)

(assert (=> d!24445 (not (contains!777 (+!127 lt!44752 (tuple2!2267 lt!44755 lt!44756)) lt!44754))))

(declare-fun lt!45373 () Unit!2720)

(declare-fun choose!553 (ListLongMap!1499 (_ BitVec 64) V!3091 (_ BitVec 64)) Unit!2720)

(assert (=> d!24445 (= lt!45373 (choose!553 lt!44752 lt!44755 lt!44756 lt!44754))))

(declare-fun e!60260 () Bool)

(assert (=> d!24445 e!60260))

(declare-fun res!47013 () Bool)

(assert (=> d!24445 (=> (not res!47013) (not e!60260))))

(assert (=> d!24445 (= res!47013 (not (contains!777 lt!44752 lt!44754)))))

(assert (=> d!24445 (= (addStillNotContains!36 lt!44752 lt!44755 lt!44756 lt!44754) lt!45373)))

(declare-fun b!92459 () Bool)

(assert (=> b!92459 (= e!60260 (not (= lt!44755 lt!44754)))))

(assert (= (and d!24445 res!47013) b!92459))

(assert (=> d!24445 m!98517))

(assert (=> d!24445 m!98517))

(assert (=> d!24445 m!98519))

(declare-fun m!99837 () Bool)

(assert (=> d!24445 m!99837))

(declare-fun m!99839 () Bool)

(assert (=> d!24445 m!99839))

(assert (=> b!91653 d!24445))

(declare-fun d!24447 () Bool)

(declare-fun e!60262 () Bool)

(assert (=> d!24447 e!60262))

(declare-fun res!47014 () Bool)

(assert (=> d!24447 (=> res!47014 e!60262)))

(declare-fun lt!45375 () Bool)

(assert (=> d!24447 (= res!47014 (not lt!45375))))

(declare-fun lt!45374 () Bool)

(assert (=> d!24447 (= lt!45375 lt!45374)))

(declare-fun lt!45377 () Unit!2720)

(declare-fun e!60261 () Unit!2720)

(assert (=> d!24447 (= lt!45377 e!60261)))

(declare-fun c!15426 () Bool)

(assert (=> d!24447 (= c!15426 lt!45374)))

(assert (=> d!24447 (= lt!45374 (containsKey!149 (toList!765 (+!127 lt!44752 (tuple2!2267 lt!44755 lt!44756))) lt!44754))))

(assert (=> d!24447 (= (contains!777 (+!127 lt!44752 (tuple2!2267 lt!44755 lt!44756)) lt!44754) lt!45375)))

(declare-fun b!92460 () Bool)

(declare-fun lt!45376 () Unit!2720)

(assert (=> b!92460 (= e!60261 lt!45376)))

(assert (=> b!92460 (= lt!45376 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 (+!127 lt!44752 (tuple2!2267 lt!44755 lt!44756))) lt!44754))))

(assert (=> b!92460 (isDefined!98 (getValueByKey!145 (toList!765 (+!127 lt!44752 (tuple2!2267 lt!44755 lt!44756))) lt!44754))))

(declare-fun b!92461 () Bool)

(declare-fun Unit!2755 () Unit!2720)

(assert (=> b!92461 (= e!60261 Unit!2755)))

(declare-fun b!92462 () Bool)

(assert (=> b!92462 (= e!60262 (isDefined!98 (getValueByKey!145 (toList!765 (+!127 lt!44752 (tuple2!2267 lt!44755 lt!44756))) lt!44754)))))

(assert (= (and d!24447 c!15426) b!92460))

(assert (= (and d!24447 (not c!15426)) b!92461))

(assert (= (and d!24447 (not res!47014)) b!92462))

(declare-fun m!99841 () Bool)

(assert (=> d!24447 m!99841))

(declare-fun m!99843 () Bool)

(assert (=> b!92460 m!99843))

(declare-fun m!99845 () Bool)

(assert (=> b!92460 m!99845))

(assert (=> b!92460 m!99845))

(declare-fun m!99847 () Bool)

(assert (=> b!92460 m!99847))

(assert (=> b!92462 m!99845))

(assert (=> b!92462 m!99845))

(assert (=> b!92462 m!99847))

(assert (=> b!91653 d!24447))

(declare-fun d!24449 () Bool)

(declare-fun e!60263 () Bool)

(assert (=> d!24449 e!60263))

(declare-fun res!47015 () Bool)

(assert (=> d!24449 (=> (not res!47015) (not e!60263))))

(declare-fun lt!45378 () ListLongMap!1499)

(assert (=> d!24449 (= res!47015 (contains!777 lt!45378 (_1!1144 (tuple2!2267 lt!44755 lt!44756))))))

(declare-fun lt!45380 () List!1552)

(assert (=> d!24449 (= lt!45378 (ListLongMap!1500 lt!45380))))

(declare-fun lt!45379 () Unit!2720)

(declare-fun lt!45381 () Unit!2720)

(assert (=> d!24449 (= lt!45379 lt!45381)))

(assert (=> d!24449 (= (getValueByKey!145 lt!45380 (_1!1144 (tuple2!2267 lt!44755 lt!44756))) (Some!150 (_2!1144 (tuple2!2267 lt!44755 lt!44756))))))

(assert (=> d!24449 (= lt!45381 (lemmaContainsTupThenGetReturnValue!62 lt!45380 (_1!1144 (tuple2!2267 lt!44755 lt!44756)) (_2!1144 (tuple2!2267 lt!44755 lt!44756))))))

(assert (=> d!24449 (= lt!45380 (insertStrictlySorted!65 (toList!765 lt!44752) (_1!1144 (tuple2!2267 lt!44755 lt!44756)) (_2!1144 (tuple2!2267 lt!44755 lt!44756))))))

(assert (=> d!24449 (= (+!127 lt!44752 (tuple2!2267 lt!44755 lt!44756)) lt!45378)))

(declare-fun b!92463 () Bool)

(declare-fun res!47016 () Bool)

(assert (=> b!92463 (=> (not res!47016) (not e!60263))))

(assert (=> b!92463 (= res!47016 (= (getValueByKey!145 (toList!765 lt!45378) (_1!1144 (tuple2!2267 lt!44755 lt!44756))) (Some!150 (_2!1144 (tuple2!2267 lt!44755 lt!44756)))))))

(declare-fun b!92464 () Bool)

(assert (=> b!92464 (= e!60263 (contains!780 (toList!765 lt!45378) (tuple2!2267 lt!44755 lt!44756)))))

(assert (= (and d!24449 res!47015) b!92463))

(assert (= (and b!92463 res!47016) b!92464))

(declare-fun m!99849 () Bool)

(assert (=> d!24449 m!99849))

(declare-fun m!99851 () Bool)

(assert (=> d!24449 m!99851))

(declare-fun m!99853 () Bool)

(assert (=> d!24449 m!99853))

(declare-fun m!99855 () Bool)

(assert (=> d!24449 m!99855))

(declare-fun m!99857 () Bool)

(assert (=> b!92463 m!99857))

(declare-fun m!99859 () Bool)

(assert (=> b!92464 m!99859))

(assert (=> b!91653 d!24449))

(declare-fun d!24451 () Bool)

(declare-fun e!60264 () Bool)

(assert (=> d!24451 e!60264))

(declare-fun res!47017 () Bool)

(assert (=> d!24451 (=> (not res!47017) (not e!60264))))

(declare-fun lt!45382 () ListLongMap!1499)

(assert (=> d!24451 (= res!47017 (contains!777 lt!45382 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!45384 () List!1552)

(assert (=> d!24451 (= lt!45382 (ListLongMap!1500 lt!45384))))

(declare-fun lt!45383 () Unit!2720)

(declare-fun lt!45385 () Unit!2720)

(assert (=> d!24451 (= lt!45383 lt!45385)))

(assert (=> d!24451 (= (getValueByKey!145 lt!45384 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!150 (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!24451 (= lt!45385 (lemmaContainsTupThenGetReturnValue!62 lt!45384 (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!24451 (= lt!45384 (insertStrictlySorted!65 (toList!765 call!8939) (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!24451 (= (+!127 call!8939 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!45382)))

(declare-fun b!92465 () Bool)

(declare-fun res!47018 () Bool)

(assert (=> b!92465 (=> (not res!47018) (not e!60264))))

(assert (=> b!92465 (= res!47018 (= (getValueByKey!145 (toList!765 lt!45382) (_1!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!150 (_2!1144 (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!92466 () Bool)

(assert (=> b!92466 (= e!60264 (contains!780 (toList!765 lt!45382) (tuple2!2267 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1237 (select (arr!1968 (_values!2389 (v!2721 (underlying!313 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!24451 res!47017) b!92465))

(assert (= (and b!92465 res!47018) b!92466))

(declare-fun m!99861 () Bool)

(assert (=> d!24451 m!99861))

(declare-fun m!99863 () Bool)

(assert (=> d!24451 m!99863))

(declare-fun m!99865 () Bool)

(assert (=> d!24451 m!99865))

(declare-fun m!99867 () Bool)

(assert (=> d!24451 m!99867))

(declare-fun m!99869 () Bool)

(assert (=> b!92465 m!99869))

(declare-fun m!99871 () Bool)

(assert (=> b!92466 m!99871))

(assert (=> b!91653 d!24451))

(assert (=> b!91600 d!24183))

(declare-fun b!92467 () Bool)

(declare-fun e!60265 () (_ BitVec 32))

(declare-fun call!9115 () (_ BitVec 32))

(assert (=> b!92467 (= e!60265 (bvadd #b00000000000000000000000000000001 call!9115))))

(declare-fun d!24453 () Bool)

(declare-fun lt!45386 () (_ BitVec 32))

(assert (=> d!24453 (and (bvsge lt!45386 #b00000000000000000000000000000000) (bvsle lt!45386 (bvsub (size!2214 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!60266 () (_ BitVec 32))

(assert (=> d!24453 (= lt!45386 e!60266)))

(declare-fun c!15428 () Bool)

(assert (=> d!24453 (= c!15428 (bvsge #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))

(assert (=> d!24453 (and (bvsle #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2214 (_keys!4086 newMap!16)) (size!2214 (_keys!4086 newMap!16))))))

(assert (=> d!24453 (= (arrayCountValidKeys!0 (_keys!4086 newMap!16) #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))) lt!45386)))

(declare-fun bm!9112 () Bool)

(assert (=> bm!9112 (= call!9115 (arrayCountValidKeys!0 (_keys!4086 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2214 (_keys!4086 newMap!16))))))

(declare-fun b!92468 () Bool)

(assert (=> b!92468 (= e!60266 #b00000000000000000000000000000000)))

(declare-fun b!92469 () Bool)

(assert (=> b!92469 (= e!60266 e!60265)))

(declare-fun c!15427 () Bool)

(assert (=> b!92469 (= c!15427 (validKeyInArray!0 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!92470 () Bool)

(assert (=> b!92470 (= e!60265 call!9115)))

(assert (= (and d!24453 c!15428) b!92468))

(assert (= (and d!24453 (not c!15428)) b!92469))

(assert (= (and b!92469 c!15427) b!92467))

(assert (= (and b!92469 (not c!15427)) b!92470))

(assert (= (or b!92467 b!92470) bm!9112))

(declare-fun m!99873 () Bool)

(assert (=> bm!9112 m!99873))

(assert (=> b!92469 m!99147))

(assert (=> b!92469 m!99147))

(assert (=> b!92469 m!99149))

(assert (=> b!91733 d!24453))

(assert (=> b!91765 d!24279))

(assert (=> b!91765 d!24281))

(declare-fun d!24455 () Bool)

(declare-fun e!60268 () Bool)

(assert (=> d!24455 e!60268))

(declare-fun res!47019 () Bool)

(assert (=> d!24455 (=> res!47019 e!60268)))

(declare-fun lt!45388 () Bool)

(assert (=> d!24455 (= res!47019 (not lt!45388))))

(declare-fun lt!45387 () Bool)

(assert (=> d!24455 (= lt!45388 lt!45387)))

(declare-fun lt!45390 () Unit!2720)

(declare-fun e!60267 () Unit!2720)

(assert (=> d!24455 (= lt!45390 e!60267)))

(declare-fun c!15429 () Bool)

(assert (=> d!24455 (= c!15429 lt!45387)))

(assert (=> d!24455 (= lt!45387 (containsKey!149 (toList!765 lt!44726) (_1!1144 lt!44651)))))

(assert (=> d!24455 (= (contains!777 lt!44726 (_1!1144 lt!44651)) lt!45388)))

(declare-fun b!92471 () Bool)

(declare-fun lt!45389 () Unit!2720)

(assert (=> b!92471 (= e!60267 lt!45389)))

(assert (=> b!92471 (= lt!45389 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44726) (_1!1144 lt!44651)))))

(assert (=> b!92471 (isDefined!98 (getValueByKey!145 (toList!765 lt!44726) (_1!1144 lt!44651)))))

(declare-fun b!92472 () Bool)

(declare-fun Unit!2756 () Unit!2720)

(assert (=> b!92472 (= e!60267 Unit!2756)))

(declare-fun b!92473 () Bool)

(assert (=> b!92473 (= e!60268 (isDefined!98 (getValueByKey!145 (toList!765 lt!44726) (_1!1144 lt!44651))))))

(assert (= (and d!24455 c!15429) b!92471))

(assert (= (and d!24455 (not c!15429)) b!92472))

(assert (= (and d!24455 (not res!47019)) b!92473))

(declare-fun m!99875 () Bool)

(assert (=> d!24455 m!99875))

(declare-fun m!99877 () Bool)

(assert (=> b!92471 m!99877))

(assert (=> b!92471 m!98475))

(assert (=> b!92471 m!98475))

(declare-fun m!99879 () Bool)

(assert (=> b!92471 m!99879))

(assert (=> b!92473 m!98475))

(assert (=> b!92473 m!98475))

(assert (=> b!92473 m!99879))

(assert (=> d!24133 d!24455))

(declare-fun b!92476 () Bool)

(declare-fun e!60270 () Option!151)

(assert (=> b!92476 (= e!60270 (getValueByKey!145 (t!5386 lt!44728) (_1!1144 lt!44651)))))

(declare-fun b!92475 () Bool)

(declare-fun e!60269 () Option!151)

(assert (=> b!92475 (= e!60269 e!60270)))

(declare-fun c!15431 () Bool)

(assert (=> b!92475 (= c!15431 (and ((_ is Cons!1548) lt!44728) (not (= (_1!1144 (h!2140 lt!44728)) (_1!1144 lt!44651)))))))

(declare-fun b!92477 () Bool)

(assert (=> b!92477 (= e!60270 None!149)))

(declare-fun b!92474 () Bool)

(assert (=> b!92474 (= e!60269 (Some!150 (_2!1144 (h!2140 lt!44728))))))

(declare-fun d!24457 () Bool)

(declare-fun c!15430 () Bool)

(assert (=> d!24457 (= c!15430 (and ((_ is Cons!1548) lt!44728) (= (_1!1144 (h!2140 lt!44728)) (_1!1144 lt!44651))))))

(assert (=> d!24457 (= (getValueByKey!145 lt!44728 (_1!1144 lt!44651)) e!60269)))

(assert (= (and d!24457 c!15430) b!92474))

(assert (= (and d!24457 (not c!15430)) b!92475))

(assert (= (and b!92475 c!15431) b!92476))

(assert (= (and b!92475 (not c!15431)) b!92477))

(declare-fun m!99881 () Bool)

(assert (=> b!92476 m!99881))

(assert (=> d!24133 d!24457))

(declare-fun d!24459 () Bool)

(assert (=> d!24459 (= (getValueByKey!145 lt!44728 (_1!1144 lt!44651)) (Some!150 (_2!1144 lt!44651)))))

(declare-fun lt!45391 () Unit!2720)

(assert (=> d!24459 (= lt!45391 (choose!547 lt!44728 (_1!1144 lt!44651) (_2!1144 lt!44651)))))

(declare-fun e!60271 () Bool)

(assert (=> d!24459 e!60271))

(declare-fun res!47020 () Bool)

(assert (=> d!24459 (=> (not res!47020) (not e!60271))))

(assert (=> d!24459 (= res!47020 (isStrictlySorted!301 lt!44728))))

(assert (=> d!24459 (= (lemmaContainsTupThenGetReturnValue!62 lt!44728 (_1!1144 lt!44651) (_2!1144 lt!44651)) lt!45391)))

(declare-fun b!92478 () Bool)

(declare-fun res!47021 () Bool)

(assert (=> b!92478 (=> (not res!47021) (not e!60271))))

(assert (=> b!92478 (= res!47021 (containsKey!149 lt!44728 (_1!1144 lt!44651)))))

(declare-fun b!92479 () Bool)

(assert (=> b!92479 (= e!60271 (contains!780 lt!44728 (tuple2!2267 (_1!1144 lt!44651) (_2!1144 lt!44651))))))

(assert (= (and d!24459 res!47020) b!92478))

(assert (= (and b!92478 res!47021) b!92479))

(assert (=> d!24459 m!98469))

(declare-fun m!99883 () Bool)

(assert (=> d!24459 m!99883))

(declare-fun m!99885 () Bool)

(assert (=> d!24459 m!99885))

(declare-fun m!99887 () Bool)

(assert (=> b!92478 m!99887))

(declare-fun m!99889 () Bool)

(assert (=> b!92479 m!99889))

(assert (=> d!24133 d!24459))

(declare-fun bm!9113 () Bool)

(declare-fun call!9116 () List!1552)

(declare-fun call!9118 () List!1552)

(assert (=> bm!9113 (= call!9116 call!9118)))

(declare-fun b!92480 () Bool)

(declare-fun res!47022 () Bool)

(declare-fun e!60272 () Bool)

(assert (=> b!92480 (=> (not res!47022) (not e!60272))))

(declare-fun lt!45392 () List!1552)

(assert (=> b!92480 (= res!47022 (containsKey!149 lt!45392 (_1!1144 lt!44651)))))

(declare-fun b!92481 () Bool)

(declare-fun e!60273 () List!1552)

(assert (=> b!92481 (= e!60273 call!9118)))

(declare-fun b!92482 () Bool)

(assert (=> b!92482 (= e!60272 (contains!780 lt!45392 (tuple2!2267 (_1!1144 lt!44651) (_2!1144 lt!44651))))))

(declare-fun b!92483 () Bool)

(declare-fun e!60276 () List!1552)

(assert (=> b!92483 (= e!60276 (insertStrictlySorted!65 (t!5386 (toList!765 (+!127 lt!44652 lt!44638))) (_1!1144 lt!44651) (_2!1144 lt!44651)))))

(declare-fun bm!9114 () Bool)

(declare-fun call!9117 () List!1552)

(assert (=> bm!9114 (= call!9118 call!9117)))

(declare-fun b!92485 () Bool)

(declare-fun e!60274 () List!1552)

(assert (=> b!92485 (= e!60274 e!60273)))

(declare-fun c!15432 () Bool)

(assert (=> b!92485 (= c!15432 (and ((_ is Cons!1548) (toList!765 (+!127 lt!44652 lt!44638))) (= (_1!1144 (h!2140 (toList!765 (+!127 lt!44652 lt!44638)))) (_1!1144 lt!44651))))))

(declare-fun b!92486 () Bool)

(assert (=> b!92486 (= e!60274 call!9117)))

(declare-fun c!15434 () Bool)

(declare-fun b!92487 () Bool)

(assert (=> b!92487 (= c!15434 (and ((_ is Cons!1548) (toList!765 (+!127 lt!44652 lt!44638))) (bvsgt (_1!1144 (h!2140 (toList!765 (+!127 lt!44652 lt!44638)))) (_1!1144 lt!44651))))))

(declare-fun e!60275 () List!1552)

(assert (=> b!92487 (= e!60273 e!60275)))

(declare-fun b!92488 () Bool)

(assert (=> b!92488 (= e!60276 (ite c!15432 (t!5386 (toList!765 (+!127 lt!44652 lt!44638))) (ite c!15434 (Cons!1548 (h!2140 (toList!765 (+!127 lt!44652 lt!44638))) (t!5386 (toList!765 (+!127 lt!44652 lt!44638)))) Nil!1549)))))

(declare-fun c!15433 () Bool)

(declare-fun bm!9115 () Bool)

(assert (=> bm!9115 (= call!9117 ($colon$colon!75 e!60276 (ite c!15433 (h!2140 (toList!765 (+!127 lt!44652 lt!44638))) (tuple2!2267 (_1!1144 lt!44651) (_2!1144 lt!44651)))))))

(declare-fun c!15435 () Bool)

(assert (=> bm!9115 (= c!15435 c!15433)))

(declare-fun b!92489 () Bool)

(assert (=> b!92489 (= e!60275 call!9116)))

(declare-fun d!24461 () Bool)

(assert (=> d!24461 e!60272))

(declare-fun res!47023 () Bool)

(assert (=> d!24461 (=> (not res!47023) (not e!60272))))

(assert (=> d!24461 (= res!47023 (isStrictlySorted!301 lt!45392))))

(assert (=> d!24461 (= lt!45392 e!60274)))

(assert (=> d!24461 (= c!15433 (and ((_ is Cons!1548) (toList!765 (+!127 lt!44652 lt!44638))) (bvslt (_1!1144 (h!2140 (toList!765 (+!127 lt!44652 lt!44638)))) (_1!1144 lt!44651))))))

(assert (=> d!24461 (isStrictlySorted!301 (toList!765 (+!127 lt!44652 lt!44638)))))

(assert (=> d!24461 (= (insertStrictlySorted!65 (toList!765 (+!127 lt!44652 lt!44638)) (_1!1144 lt!44651) (_2!1144 lt!44651)) lt!45392)))

(declare-fun b!92484 () Bool)

(assert (=> b!92484 (= e!60275 call!9116)))

(assert (= (and d!24461 c!15433) b!92486))

(assert (= (and d!24461 (not c!15433)) b!92485))

(assert (= (and b!92485 c!15432) b!92481))

(assert (= (and b!92485 (not c!15432)) b!92487))

(assert (= (and b!92487 c!15434) b!92484))

(assert (= (and b!92487 (not c!15434)) b!92489))

(assert (= (or b!92484 b!92489) bm!9113))

(assert (= (or b!92481 bm!9113) bm!9114))

(assert (= (or b!92486 bm!9114) bm!9115))

(assert (= (and bm!9115 c!15435) b!92483))

(assert (= (and bm!9115 (not c!15435)) b!92488))

(assert (= (and d!24461 res!47023) b!92480))

(assert (= (and b!92480 res!47022) b!92482))

(declare-fun m!99891 () Bool)

(assert (=> b!92480 m!99891))

(declare-fun m!99893 () Bool)

(assert (=> b!92483 m!99893))

(declare-fun m!99895 () Bool)

(assert (=> bm!9115 m!99895))

(declare-fun m!99897 () Bool)

(assert (=> b!92482 m!99897))

(declare-fun m!99899 () Bool)

(assert (=> d!24461 m!99899))

(declare-fun m!99901 () Bool)

(assert (=> d!24461 m!99901))

(assert (=> d!24133 d!24461))

(declare-fun b!92492 () Bool)

(declare-fun e!60278 () Option!151)

(assert (=> b!92492 (= e!60278 (getValueByKey!145 (t!5386 (toList!765 lt!44762)) (_1!1144 lt!44649)))))

(declare-fun b!92491 () Bool)

(declare-fun e!60277 () Option!151)

(assert (=> b!92491 (= e!60277 e!60278)))

(declare-fun c!15437 () Bool)

(assert (=> b!92491 (= c!15437 (and ((_ is Cons!1548) (toList!765 lt!44762)) (not (= (_1!1144 (h!2140 (toList!765 lt!44762))) (_1!1144 lt!44649)))))))

(declare-fun b!92493 () Bool)

(assert (=> b!92493 (= e!60278 None!149)))

(declare-fun b!92490 () Bool)

(assert (=> b!92490 (= e!60277 (Some!150 (_2!1144 (h!2140 (toList!765 lt!44762)))))))

(declare-fun d!24463 () Bool)

(declare-fun c!15436 () Bool)

(assert (=> d!24463 (= c!15436 (and ((_ is Cons!1548) (toList!765 lt!44762)) (= (_1!1144 (h!2140 (toList!765 lt!44762))) (_1!1144 lt!44649))))))

(assert (=> d!24463 (= (getValueByKey!145 (toList!765 lt!44762) (_1!1144 lt!44649)) e!60277)))

(assert (= (and d!24463 c!15436) b!92490))

(assert (= (and d!24463 (not c!15436)) b!92491))

(assert (= (and b!92491 c!15437) b!92492))

(assert (= (and b!92491 (not c!15437)) b!92493))

(declare-fun m!99903 () Bool)

(assert (=> b!92492 m!99903))

(assert (=> b!91656 d!24463))

(declare-fun d!24465 () Bool)

(declare-fun e!60280 () Bool)

(assert (=> d!24465 e!60280))

(declare-fun res!47024 () Bool)

(assert (=> d!24465 (=> res!47024 e!60280)))

(declare-fun lt!45394 () Bool)

(assert (=> d!24465 (= res!47024 (not lt!45394))))

(declare-fun lt!45393 () Bool)

(assert (=> d!24465 (= lt!45394 lt!45393)))

(declare-fun lt!45396 () Unit!2720)

(declare-fun e!60279 () Unit!2720)

(assert (=> d!24465 (= lt!45396 e!60279)))

(declare-fun c!15438 () Bool)

(assert (=> d!24465 (= c!15438 lt!45393)))

(assert (=> d!24465 (= lt!45393 (containsKey!149 (toList!765 lt!44827) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> d!24465 (= (contains!777 lt!44827 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) lt!45394)))

(declare-fun b!92494 () Bool)

(declare-fun lt!45395 () Unit!2720)

(assert (=> b!92494 (= e!60279 lt!45395)))

(assert (=> b!92494 (= lt!45395 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44827) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> b!92494 (isDefined!98 (getValueByKey!145 (toList!765 lt!44827) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(declare-fun b!92495 () Bool)

(declare-fun Unit!2757 () Unit!2720)

(assert (=> b!92495 (= e!60279 Unit!2757)))

(declare-fun b!92496 () Bool)

(assert (=> b!92496 (= e!60280 (isDefined!98 (getValueByKey!145 (toList!765 lt!44827) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))))))

(assert (= (and d!24465 c!15438) b!92494))

(assert (= (and d!24465 (not c!15438)) b!92495))

(assert (= (and d!24465 (not res!47024)) b!92496))

(assert (=> d!24465 m!98305))

(declare-fun m!99905 () Bool)

(assert (=> d!24465 m!99905))

(assert (=> b!92494 m!98305))

(declare-fun m!99907 () Bool)

(assert (=> b!92494 m!99907))

(assert (=> b!92494 m!98305))

(declare-fun m!99909 () Bool)

(assert (=> b!92494 m!99909))

(assert (=> b!92494 m!99909))

(declare-fun m!99911 () Bool)

(assert (=> b!92494 m!99911))

(assert (=> b!92496 m!98305))

(assert (=> b!92496 m!99909))

(assert (=> b!92496 m!99909))

(assert (=> b!92496 m!99911))

(assert (=> b!91717 d!24465))

(declare-fun b!92499 () Bool)

(declare-fun res!47025 () Bool)

(declare-fun e!60281 () Bool)

(assert (=> b!92499 (=> (not res!47025) (not e!60281))))

(assert (=> b!92499 (= res!47025 (= (size!2218 (_2!1145 lt!44647)) (bvadd (_size!451 (_2!1145 lt!44647)) (bvsdiv (bvadd (extraKeys!2237 (_2!1145 lt!44647)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!92498 () Bool)

(declare-fun res!47027 () Bool)

(assert (=> b!92498 (=> (not res!47027) (not e!60281))))

(assert (=> b!92498 (= res!47027 (bvsge (size!2218 (_2!1145 lt!44647)) (_size!451 (_2!1145 lt!44647))))))

(declare-fun b!92497 () Bool)

(declare-fun res!47028 () Bool)

(assert (=> b!92497 (=> (not res!47028) (not e!60281))))

(assert (=> b!92497 (= res!47028 (and (= (size!2215 (_values!2389 (_2!1145 lt!44647))) (bvadd (mask!6466 (_2!1145 lt!44647)) #b00000000000000000000000000000001)) (= (size!2214 (_keys!4086 (_2!1145 lt!44647))) (size!2215 (_values!2389 (_2!1145 lt!44647)))) (bvsge (_size!451 (_2!1145 lt!44647)) #b00000000000000000000000000000000) (bvsle (_size!451 (_2!1145 lt!44647)) (bvadd (mask!6466 (_2!1145 lt!44647)) #b00000000000000000000000000000001))))))

(declare-fun b!92500 () Bool)

(assert (=> b!92500 (= e!60281 (and (bvsge (extraKeys!2237 (_2!1145 lt!44647)) #b00000000000000000000000000000000) (bvsle (extraKeys!2237 (_2!1145 lt!44647)) #b00000000000000000000000000000011) (bvsge (_vacant!451 (_2!1145 lt!44647)) #b00000000000000000000000000000000)))))

(declare-fun d!24467 () Bool)

(declare-fun res!47026 () Bool)

(assert (=> d!24467 (=> (not res!47026) (not e!60281))))

(assert (=> d!24467 (= res!47026 (validMask!0 (mask!6466 (_2!1145 lt!44647))))))

(assert (=> d!24467 (= (simpleValid!63 (_2!1145 lt!44647)) e!60281)))

(assert (= (and d!24467 res!47026) b!92497))

(assert (= (and b!92497 res!47028) b!92498))

(assert (= (and b!92498 res!47027) b!92499))

(assert (= (and b!92499 res!47025) b!92500))

(declare-fun m!99913 () Bool)

(assert (=> b!92499 m!99913))

(assert (=> b!92498 m!99913))

(assert (=> d!24467 m!98775))

(assert (=> d!24127 d!24467))

(declare-fun b!92501 () Bool)

(declare-fun e!60293 () Bool)

(declare-fun e!60282 () Bool)

(assert (=> b!92501 (= e!60293 e!60282)))

(declare-fun res!47035 () Bool)

(declare-fun call!9122 () Bool)

(assert (=> b!92501 (= res!47035 call!9122)))

(assert (=> b!92501 (=> (not res!47035) (not e!60282))))

(declare-fun b!92502 () Bool)

(declare-fun lt!45413 () ListLongMap!1499)

(assert (=> b!92502 (= e!60282 (= (apply!87 lt!45413 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2294 newMap!16)))))

(declare-fun bm!9116 () Bool)

(declare-fun call!9125 () ListLongMap!1499)

(declare-fun call!9119 () ListLongMap!1499)

(assert (=> bm!9116 (= call!9125 call!9119)))

(declare-fun call!9120 () ListLongMap!1499)

(declare-fun bm!9117 () Bool)

(assert (=> bm!9117 (= call!9120 (getCurrentListMapNoExtraKeys!92 (_keys!4086 newMap!16) (ite (or c!15263 c!15273) (_values!2389 newMap!16) lt!44955) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun d!24469 () Bool)

(declare-fun e!60284 () Bool)

(assert (=> d!24469 e!60284))

(declare-fun res!47036 () Bool)

(assert (=> d!24469 (=> (not res!47036) (not e!60284))))

(assert (=> d!24469 (= res!47036 (or (bvsge #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))))

(declare-fun lt!45406 () ListLongMap!1499)

(assert (=> d!24469 (= lt!45413 lt!45406)))

(declare-fun lt!45415 () Unit!2720)

(declare-fun e!60292 () Unit!2720)

(assert (=> d!24469 (= lt!45415 e!60292)))

(declare-fun c!15439 () Bool)

(declare-fun e!60290 () Bool)

(assert (=> d!24469 (= c!15439 e!60290)))

(declare-fun res!47030 () Bool)

(assert (=> d!24469 (=> (not res!47030) (not e!60290))))

(assert (=> d!24469 (= res!47030 (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))

(declare-fun e!60285 () ListLongMap!1499)

(assert (=> d!24469 (= lt!45406 e!60285)))

(declare-fun c!15444 () Bool)

(assert (=> d!24469 (= c!15444 (and (not (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24469 (validMask!0 (mask!6466 newMap!16))))

(assert (=> d!24469 (= (getCurrentListMap!457 (_keys!4086 newMap!16) (ite (or c!15263 c!15273) (_values!2389 newMap!16) lt!44955) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)) lt!45413)))

(declare-fun b!92503 () Bool)

(declare-fun Unit!2758 () Unit!2720)

(assert (=> b!92503 (= e!60292 Unit!2758)))

(declare-fun bm!9118 () Bool)

(assert (=> bm!9118 (= call!9122 (contains!777 lt!45413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92504 () Bool)

(declare-fun e!60287 () Bool)

(declare-fun call!9124 () Bool)

(assert (=> b!92504 (= e!60287 (not call!9124))))

(declare-fun b!92505 () Bool)

(declare-fun res!47037 () Bool)

(assert (=> b!92505 (=> (not res!47037) (not e!60284))))

(declare-fun e!60286 () Bool)

(assert (=> b!92505 (= res!47037 e!60286)))

(declare-fun res!47033 () Bool)

(assert (=> b!92505 (=> res!47033 e!60286)))

(declare-fun e!60291 () Bool)

(assert (=> b!92505 (= res!47033 (not e!60291))))

(declare-fun res!47032 () Bool)

(assert (=> b!92505 (=> (not res!47032) (not e!60291))))

(assert (=> b!92505 (= res!47032 (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))

(declare-fun b!92506 () Bool)

(assert (=> b!92506 (= e!60285 (+!127 call!9119 (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 newMap!16))))))

(declare-fun b!92507 () Bool)

(declare-fun c!15441 () Bool)

(assert (=> b!92507 (= c!15441 (and (not (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!60283 () ListLongMap!1499)

(declare-fun e!60289 () ListLongMap!1499)

(assert (=> b!92507 (= e!60283 e!60289)))

(declare-fun b!92508 () Bool)

(assert (=> b!92508 (= e!60283 call!9125)))

(declare-fun b!92509 () Bool)

(assert (=> b!92509 (= e!60284 e!60287)))

(declare-fun c!15443 () Bool)

(assert (=> b!92509 (= c!15443 (not (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!92510 () Bool)

(declare-fun res!47034 () Bool)

(assert (=> b!92510 (=> (not res!47034) (not e!60284))))

(assert (=> b!92510 (= res!47034 e!60293)))

(declare-fun c!15440 () Bool)

(assert (=> b!92510 (= c!15440 (not (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!9119 () Bool)

(declare-fun call!9121 () ListLongMap!1499)

(declare-fun call!9123 () ListLongMap!1499)

(assert (=> bm!9119 (= call!9121 call!9123)))

(declare-fun b!92511 () Bool)

(assert (=> b!92511 (= e!60289 call!9121)))

(declare-fun b!92512 () Bool)

(declare-fun e!60294 () Bool)

(assert (=> b!92512 (= e!60287 e!60294)))

(declare-fun res!47031 () Bool)

(assert (=> b!92512 (= res!47031 call!9124)))

(assert (=> b!92512 (=> (not res!47031) (not e!60294))))

(declare-fun b!92513 () Bool)

(assert (=> b!92513 (= e!60291 (validKeyInArray!0 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9120 () Bool)

(assert (=> bm!9120 (= call!9123 call!9120)))

(declare-fun b!92514 () Bool)

(declare-fun lt!45410 () Unit!2720)

(assert (=> b!92514 (= e!60292 lt!45410)))

(declare-fun lt!45403 () ListLongMap!1499)

(assert (=> b!92514 (= lt!45403 (getCurrentListMapNoExtraKeys!92 (_keys!4086 newMap!16) (ite (or c!15263 c!15273) (_values!2389 newMap!16) lt!44955) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!45417 () (_ BitVec 64))

(assert (=> b!92514 (= lt!45417 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45414 () (_ BitVec 64))

(assert (=> b!92514 (= lt!45414 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45407 () Unit!2720)

(assert (=> b!92514 (= lt!45407 (addStillContains!63 lt!45403 lt!45417 (zeroValue!2294 newMap!16) lt!45414))))

(assert (=> b!92514 (contains!777 (+!127 lt!45403 (tuple2!2267 lt!45417 (zeroValue!2294 newMap!16))) lt!45414)))

(declare-fun lt!45400 () Unit!2720)

(assert (=> b!92514 (= lt!45400 lt!45407)))

(declare-fun lt!45416 () ListLongMap!1499)

(assert (=> b!92514 (= lt!45416 (getCurrentListMapNoExtraKeys!92 (_keys!4086 newMap!16) (ite (or c!15263 c!15273) (_values!2389 newMap!16) lt!44955) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!45398 () (_ BitVec 64))

(assert (=> b!92514 (= lt!45398 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45418 () (_ BitVec 64))

(assert (=> b!92514 (= lt!45418 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45404 () Unit!2720)

(assert (=> b!92514 (= lt!45404 (addApplyDifferent!63 lt!45416 lt!45398 (minValue!2294 newMap!16) lt!45418))))

(assert (=> b!92514 (= (apply!87 (+!127 lt!45416 (tuple2!2267 lt!45398 (minValue!2294 newMap!16))) lt!45418) (apply!87 lt!45416 lt!45418))))

(declare-fun lt!45397 () Unit!2720)

(assert (=> b!92514 (= lt!45397 lt!45404)))

(declare-fun lt!45411 () ListLongMap!1499)

(assert (=> b!92514 (= lt!45411 (getCurrentListMapNoExtraKeys!92 (_keys!4086 newMap!16) (ite (or c!15263 c!15273) (_values!2389 newMap!16) lt!44955) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!45401 () (_ BitVec 64))

(assert (=> b!92514 (= lt!45401 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45405 () (_ BitVec 64))

(assert (=> b!92514 (= lt!45405 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45402 () Unit!2720)

(assert (=> b!92514 (= lt!45402 (addApplyDifferent!63 lt!45411 lt!45401 (zeroValue!2294 newMap!16) lt!45405))))

(assert (=> b!92514 (= (apply!87 (+!127 lt!45411 (tuple2!2267 lt!45401 (zeroValue!2294 newMap!16))) lt!45405) (apply!87 lt!45411 lt!45405))))

(declare-fun lt!45399 () Unit!2720)

(assert (=> b!92514 (= lt!45399 lt!45402)))

(declare-fun lt!45409 () ListLongMap!1499)

(assert (=> b!92514 (= lt!45409 (getCurrentListMapNoExtraKeys!92 (_keys!4086 newMap!16) (ite (or c!15263 c!15273) (_values!2389 newMap!16) lt!44955) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!45412 () (_ BitVec 64))

(assert (=> b!92514 (= lt!45412 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45408 () (_ BitVec 64))

(assert (=> b!92514 (= lt!45408 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!92514 (= lt!45410 (addApplyDifferent!63 lt!45409 lt!45412 (minValue!2294 newMap!16) lt!45408))))

(assert (=> b!92514 (= (apply!87 (+!127 lt!45409 (tuple2!2267 lt!45412 (minValue!2294 newMap!16))) lt!45408) (apply!87 lt!45409 lt!45408))))

(declare-fun b!92515 () Bool)

(assert (=> b!92515 (= e!60289 call!9125)))

(declare-fun b!92516 () Bool)

(assert (=> b!92516 (= e!60285 e!60283)))

(declare-fun c!15442 () Bool)

(assert (=> b!92516 (= c!15442 (and (not (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2237 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!9121 () Bool)

(assert (=> bm!9121 (= call!9124 (contains!777 lt!45413 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92517 () Bool)

(assert (=> b!92517 (= e!60294 (= (apply!87 lt!45413 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2294 newMap!16)))))

(declare-fun b!92518 () Bool)

(declare-fun e!60288 () Bool)

(assert (=> b!92518 (= e!60286 e!60288)))

(declare-fun res!47029 () Bool)

(assert (=> b!92518 (=> (not res!47029) (not e!60288))))

(assert (=> b!92518 (= res!47029 (contains!777 lt!45413 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!92518 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))

(declare-fun b!92519 () Bool)

(assert (=> b!92519 (= e!60290 (validKeyInArray!0 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9122 () Bool)

(assert (=> bm!9122 (= call!9119 (+!127 (ite c!15444 call!9120 (ite c!15442 call!9123 call!9121)) (ite (or c!15444 c!15442) (tuple2!2267 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2294 newMap!16)) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2294 newMap!16)))))))

(declare-fun b!92520 () Bool)

(assert (=> b!92520 (= e!60293 (not call!9122))))

(declare-fun b!92521 () Bool)

(assert (=> b!92521 (= e!60288 (= (apply!87 lt!45413 (select (arr!1967 (_keys!4086 newMap!16)) #b00000000000000000000000000000000)) (get!1237 (select (arr!1968 (ite (or c!15263 c!15273) (_values!2389 newMap!16) lt!44955)) #b00000000000000000000000000000000) (dynLambda!354 (defaultEntry!2406 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!92521 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2215 (ite (or c!15263 c!15273) (_values!2389 newMap!16) lt!44955))))))

(assert (=> b!92521 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2214 (_keys!4086 newMap!16))))))

(assert (= (and d!24469 c!15444) b!92506))

(assert (= (and d!24469 (not c!15444)) b!92516))

(assert (= (and b!92516 c!15442) b!92508))

(assert (= (and b!92516 (not c!15442)) b!92507))

(assert (= (and b!92507 c!15441) b!92515))

(assert (= (and b!92507 (not c!15441)) b!92511))

(assert (= (or b!92515 b!92511) bm!9119))

(assert (= (or b!92508 bm!9119) bm!9120))

(assert (= (or b!92508 b!92515) bm!9116))

(assert (= (or b!92506 bm!9120) bm!9117))

(assert (= (or b!92506 bm!9116) bm!9122))

(assert (= (and d!24469 res!47030) b!92519))

(assert (= (and d!24469 c!15439) b!92514))

(assert (= (and d!24469 (not c!15439)) b!92503))

(assert (= (and d!24469 res!47036) b!92505))

(assert (= (and b!92505 res!47032) b!92513))

(assert (= (and b!92505 (not res!47033)) b!92518))

(assert (= (and b!92518 res!47029) b!92521))

(assert (= (and b!92505 res!47037) b!92510))

(assert (= (and b!92510 c!15440) b!92501))

(assert (= (and b!92510 (not c!15440)) b!92520))

(assert (= (and b!92501 res!47035) b!92502))

(assert (= (or b!92501 b!92520) bm!9118))

(assert (= (and b!92510 res!47034) b!92509))

(assert (= (and b!92509 c!15443) b!92512))

(assert (= (and b!92509 (not c!15443)) b!92504))

(assert (= (and b!92512 res!47031) b!92517))

(assert (= (or b!92512 b!92504) bm!9121))

(declare-fun b_lambda!4073 () Bool)

(assert (=> (not b_lambda!4073) (not b!92521)))

(assert (=> b!92521 t!5397))

(declare-fun b_and!5607 () Bool)

(assert (= b_and!5603 (and (=> t!5397 result!3101) b_and!5607)))

(assert (=> b!92521 t!5399))

(declare-fun b_and!5609 () Bool)

(assert (= b_and!5605 (and (=> t!5399 result!3103) b_and!5609)))

(assert (=> d!24469 m!98855))

(declare-fun m!99915 () Bool)

(assert (=> b!92506 m!99915))

(assert (=> b!92513 m!99147))

(assert (=> b!92513 m!99147))

(assert (=> b!92513 m!99149))

(declare-fun m!99917 () Bool)

(assert (=> bm!9121 m!99917))

(declare-fun m!99919 () Bool)

(assert (=> b!92514 m!99919))

(declare-fun m!99921 () Bool)

(assert (=> b!92514 m!99921))

(assert (=> b!92514 m!99921))

(declare-fun m!99923 () Bool)

(assert (=> b!92514 m!99923))

(declare-fun m!99925 () Bool)

(assert (=> b!92514 m!99925))

(declare-fun m!99927 () Bool)

(assert (=> b!92514 m!99927))

(declare-fun m!99929 () Bool)

(assert (=> b!92514 m!99929))

(declare-fun m!99931 () Bool)

(assert (=> b!92514 m!99931))

(assert (=> b!92514 m!99929))

(declare-fun m!99933 () Bool)

(assert (=> b!92514 m!99933))

(declare-fun m!99935 () Bool)

(assert (=> b!92514 m!99935))

(declare-fun m!99937 () Bool)

(assert (=> b!92514 m!99937))

(assert (=> b!92514 m!99925))

(declare-fun m!99939 () Bool)

(assert (=> b!92514 m!99939))

(declare-fun m!99941 () Bool)

(assert (=> b!92514 m!99941))

(declare-fun m!99943 () Bool)

(assert (=> b!92514 m!99943))

(assert (=> b!92514 m!99941))

(declare-fun m!99945 () Bool)

(assert (=> b!92514 m!99945))

(assert (=> b!92514 m!99147))

(declare-fun m!99947 () Bool)

(assert (=> b!92514 m!99947))

(declare-fun m!99949 () Bool)

(assert (=> b!92514 m!99949))

(assert (=> b!92519 m!99147))

(assert (=> b!92519 m!99147))

(assert (=> b!92519 m!99149))

(assert (=> b!92518 m!99147))

(assert (=> b!92518 m!99147))

(declare-fun m!99951 () Bool)

(assert (=> b!92518 m!99951))

(declare-fun m!99953 () Bool)

(assert (=> bm!9118 m!99953))

(declare-fun m!99955 () Bool)

(assert (=> b!92517 m!99955))

(assert (=> b!92521 m!99191))

(declare-fun m!99957 () Bool)

(assert (=> b!92521 m!99957))

(assert (=> b!92521 m!99147))

(declare-fun m!99959 () Bool)

(assert (=> b!92521 m!99959))

(assert (=> b!92521 m!99147))

(assert (=> b!92521 m!99957))

(assert (=> b!92521 m!99191))

(declare-fun m!99961 () Bool)

(assert (=> b!92521 m!99961))

(declare-fun m!99963 () Bool)

(assert (=> bm!9122 m!99963))

(assert (=> bm!9117 m!99931))

(declare-fun m!99965 () Bool)

(assert (=> b!92502 m!99965))

(assert (=> bm!9028 d!24469))

(declare-fun d!24471 () Bool)

(declare-fun e!60296 () Bool)

(assert (=> d!24471 e!60296))

(declare-fun res!47038 () Bool)

(assert (=> d!24471 (=> res!47038 e!60296)))

(declare-fun lt!45420 () Bool)

(assert (=> d!24471 (= res!47038 (not lt!45420))))

(declare-fun lt!45419 () Bool)

(assert (=> d!24471 (= lt!45420 lt!45419)))

(declare-fun lt!45422 () Unit!2720)

(declare-fun e!60295 () Unit!2720)

(assert (=> d!24471 (= lt!45422 e!60295)))

(declare-fun c!15445 () Bool)

(assert (=> d!24471 (= c!15445 lt!45419)))

(assert (=> d!24471 (= lt!45419 (containsKey!149 (toList!765 lt!44861) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24471 (= (contains!777 lt!44861 #b1000000000000000000000000000000000000000000000000000000000000000) lt!45420)))

(declare-fun b!92522 () Bool)

(declare-fun lt!45421 () Unit!2720)

(assert (=> b!92522 (= e!60295 lt!45421)))

(assert (=> b!92522 (= lt!45421 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!765 lt!44861) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92522 (isDefined!98 (getValueByKey!145 (toList!765 lt!44861) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92523 () Bool)

(declare-fun Unit!2759 () Unit!2720)

(assert (=> b!92523 (= e!60295 Unit!2759)))

(declare-fun b!92524 () Bool)

(assert (=> b!92524 (= e!60296 (isDefined!98 (getValueByKey!145 (toList!765 lt!44861) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24471 c!15445) b!92522))

(assert (= (and d!24471 (not c!15445)) b!92523))

(assert (= (and d!24471 (not res!47038)) b!92524))

(declare-fun m!99967 () Bool)

(assert (=> d!24471 m!99967))

(declare-fun m!99969 () Bool)

(assert (=> b!92522 m!99969))

(assert (=> b!92522 m!99761))

(assert (=> b!92522 m!99761))

(declare-fun m!99971 () Bool)

(assert (=> b!92522 m!99971))

(assert (=> b!92524 m!99761))

(assert (=> b!92524 m!99761))

(assert (=> b!92524 m!99971))

(assert (=> bm!8963 d!24471))

(declare-fun d!24473 () Bool)

(assert (=> d!24473 (= (apply!87 lt!44827 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)) (get!1240 (getValueByKey!145 (toList!765 lt!44827) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355))))))

(declare-fun bs!3840 () Bool)

(assert (= bs!3840 d!24473))

(assert (=> bs!3840 m!98305))

(assert (=> bs!3840 m!99909))

(assert (=> bs!3840 m!99909))

(declare-fun m!99973 () Bool)

(assert (=> bs!3840 m!99973))

(assert (=> b!91720 d!24473))

(assert (=> b!91720 d!24159))

(assert (=> b!91644 d!24259))

(assert (=> d!24163 d!24261))

(declare-fun d!24475 () Bool)

(assert (=> d!24475 (= (+!127 (getCurrentListMap!457 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)) (tuple2!2267 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44644)) (getCurrentListMap!457 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) lt!44957 (zeroValue!2294 newMap!16) lt!44644 #b00000000000000000000000000000000 (defaultEntry!2406 newMap!16)))))

(declare-fun lt!45425 () Unit!2720)

(declare-fun choose!554 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 V!3091 Int) Unit!2720)

(assert (=> d!24475 (= lt!45425 (choose!554 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) lt!44957 (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) lt!44644 (defaultEntry!2406 newMap!16)))))

(assert (=> d!24475 (validMask!0 (mask!6466 newMap!16))))

(assert (=> d!24475 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!36 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) lt!44957 (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) lt!44644 (defaultEntry!2406 newMap!16)) lt!45425)))

(declare-fun bs!3841 () Bool)

(assert (= bs!3841 d!24475))

(declare-fun m!99975 () Bool)

(assert (=> bs!3841 m!99975))

(assert (=> bs!3841 m!98661))

(declare-fun m!99977 () Bool)

(assert (=> bs!3841 m!99977))

(declare-fun m!99979 () Bool)

(assert (=> bs!3841 m!99979))

(assert (=> bs!3841 m!98661))

(assert (=> bs!3841 m!98855))

(assert (=> b!91885 d!24475))

(declare-fun d!24477 () Bool)

(declare-fun e!60299 () Bool)

(assert (=> d!24477 e!60299))

(declare-fun res!47044 () Bool)

(assert (=> d!24477 (=> (not res!47044) (not e!60299))))

(declare-fun lt!45431 () SeekEntryResult!248)

(assert (=> d!24477 (= res!47044 ((_ is Found!248) lt!45431))))

(assert (=> d!24477 (= lt!45431 (seekEntryOrOpen!0 (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (_keys!4086 newMap!16) (mask!6466 newMap!16)))))

(declare-fun lt!45430 () Unit!2720)

(declare-fun choose!555 (array!4135 array!4137 (_ BitVec 32) (_ BitVec 32) V!3091 V!3091 (_ BitVec 64) Int) Unit!2720)

(assert (=> d!24477 (= lt!45430 (choose!555 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (defaultEntry!2406 newMap!16)))))

(assert (=> d!24477 (validMask!0 (mask!6466 newMap!16))))

(assert (=> d!24477 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!36 (_keys!4086 newMap!16) (_values!2389 newMap!16) (mask!6466 newMap!16) (extraKeys!2237 newMap!16) (zeroValue!2294 newMap!16) (minValue!2294 newMap!16) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355) (defaultEntry!2406 newMap!16)) lt!45430)))

(declare-fun b!92529 () Bool)

(declare-fun res!47043 () Bool)

(assert (=> b!92529 (=> (not res!47043) (not e!60299))))

(assert (=> b!92529 (= res!47043 (inRange!0 (index!3133 lt!45431) (mask!6466 newMap!16)))))

(declare-fun b!92530 () Bool)

(assert (=> b!92530 (= e!60299 (= (select (arr!1967 (_keys!4086 newMap!16)) (index!3133 lt!45431)) (select (arr!1967 (_keys!4086 (v!2721 (underlying!313 thiss!992)))) from!355)))))

(assert (=> b!92530 (and (bvsge (index!3133 lt!45431) #b00000000000000000000000000000000) (bvslt (index!3133 lt!45431) (size!2214 (_keys!4086 newMap!16))))))

(assert (= (and d!24477 res!47044) b!92529))

(assert (= (and b!92529 res!47043) b!92530))

(assert (=> d!24477 m!98305))

(assert (=> d!24477 m!98729))

(assert (=> d!24477 m!98305))

(declare-fun m!99981 () Bool)

(assert (=> d!24477 m!99981))

(assert (=> d!24477 m!98855))

(declare-fun m!99983 () Bool)

(assert (=> b!92529 m!99983))

(declare-fun m!99985 () Bool)

(assert (=> b!92530 m!99985))

(assert (=> bm!9016 d!24477))

(declare-fun d!24479 () Bool)

(declare-fun lt!45432 () Bool)

(assert (=> d!24479 (= lt!45432 (select (content!95 (toList!765 lt!44837)) lt!44651))))

(declare-fun e!60300 () Bool)

(assert (=> d!24479 (= lt!45432 e!60300)))

(declare-fun res!47045 () Bool)

(assert (=> d!24479 (=> (not res!47045) (not e!60300))))

(assert (=> d!24479 (= res!47045 ((_ is Cons!1548) (toList!765 lt!44837)))))

(assert (=> d!24479 (= (contains!780 (toList!765 lt!44837) lt!44651) lt!45432)))

(declare-fun b!92531 () Bool)

(declare-fun e!60301 () Bool)

(assert (=> b!92531 (= e!60300 e!60301)))

(declare-fun res!47046 () Bool)

(assert (=> b!92531 (=> res!47046 e!60301)))

(assert (=> b!92531 (= res!47046 (= (h!2140 (toList!765 lt!44837)) lt!44651))))

(declare-fun b!92532 () Bool)

(assert (=> b!92532 (= e!60301 (contains!780 (t!5386 (toList!765 lt!44837)) lt!44651))))

(assert (= (and d!24479 res!47045) b!92531))

(assert (= (and b!92531 (not res!47046)) b!92532))

(declare-fun m!99987 () Bool)

(assert (=> d!24479 m!99987))

(declare-fun m!99989 () Bool)

(assert (=> d!24479 m!99989))

(declare-fun m!99991 () Bool)

(assert (=> b!92532 m!99991))

(assert (=> b!91724 d!24479))

(declare-fun b!92534 () Bool)

(declare-fun e!60302 () Bool)

(assert (=> b!92534 (= e!60302 tp_is_empty!2583)))

(declare-fun condMapEmpty!3583 () Bool)

(declare-fun mapDefault!3583 () ValueCell!948)

(assert (=> mapNonEmpty!3582 (= condMapEmpty!3583 (= mapRest!3582 ((as const (Array (_ BitVec 32) ValueCell!948)) mapDefault!3583)))))

(declare-fun mapRes!3583 () Bool)

(assert (=> mapNonEmpty!3582 (= tp!9270 (and e!60302 mapRes!3583))))

(declare-fun mapNonEmpty!3583 () Bool)

(declare-fun tp!9271 () Bool)

(declare-fun e!60303 () Bool)

(assert (=> mapNonEmpty!3583 (= mapRes!3583 (and tp!9271 e!60303))))

(declare-fun mapRest!3583 () (Array (_ BitVec 32) ValueCell!948))

(declare-fun mapKey!3583 () (_ BitVec 32))

(declare-fun mapValue!3583 () ValueCell!948)

(assert (=> mapNonEmpty!3583 (= mapRest!3582 (store mapRest!3583 mapKey!3583 mapValue!3583))))

(declare-fun mapIsEmpty!3583 () Bool)

(assert (=> mapIsEmpty!3583 mapRes!3583))

(declare-fun b!92533 () Bool)

(assert (=> b!92533 (= e!60303 tp_is_empty!2583)))

(assert (= (and mapNonEmpty!3582 condMapEmpty!3583) mapIsEmpty!3583))

(assert (= (and mapNonEmpty!3582 (not condMapEmpty!3583)) mapNonEmpty!3583))

(assert (= (and mapNonEmpty!3583 ((_ is ValueCellFull!948) mapValue!3583)) b!92533))

(assert (= (and mapNonEmpty!3582 ((_ is ValueCellFull!948) mapDefault!3583)) b!92534))

(declare-fun m!99993 () Bool)

(assert (=> mapNonEmpty!3583 m!99993))

(declare-fun b!92536 () Bool)

(declare-fun e!60304 () Bool)

(assert (=> b!92536 (= e!60304 tp_is_empty!2583)))

(declare-fun condMapEmpty!3584 () Bool)

(declare-fun mapDefault!3584 () ValueCell!948)

(assert (=> mapNonEmpty!3581 (= condMapEmpty!3584 (= mapRest!3581 ((as const (Array (_ BitVec 32) ValueCell!948)) mapDefault!3584)))))

(declare-fun mapRes!3584 () Bool)

(assert (=> mapNonEmpty!3581 (= tp!9269 (and e!60304 mapRes!3584))))

(declare-fun mapNonEmpty!3584 () Bool)

(declare-fun tp!9272 () Bool)

(declare-fun e!60305 () Bool)

(assert (=> mapNonEmpty!3584 (= mapRes!3584 (and tp!9272 e!60305))))

(declare-fun mapRest!3584 () (Array (_ BitVec 32) ValueCell!948))

(declare-fun mapValue!3584 () ValueCell!948)

(declare-fun mapKey!3584 () (_ BitVec 32))

(assert (=> mapNonEmpty!3584 (= mapRest!3581 (store mapRest!3584 mapKey!3584 mapValue!3584))))

(declare-fun mapIsEmpty!3584 () Bool)

(assert (=> mapIsEmpty!3584 mapRes!3584))

(declare-fun b!92535 () Bool)

(assert (=> b!92535 (= e!60305 tp_is_empty!2583)))

(assert (= (and mapNonEmpty!3581 condMapEmpty!3584) mapIsEmpty!3584))

(assert (= (and mapNonEmpty!3581 (not condMapEmpty!3584)) mapNonEmpty!3584))

(assert (= (and mapNonEmpty!3584 ((_ is ValueCellFull!948) mapValue!3584)) b!92535))

(assert (= (and mapNonEmpty!3581 ((_ is ValueCellFull!948) mapDefault!3584)) b!92536))

(declare-fun m!99995 () Bool)

(assert (=> mapNonEmpty!3584 m!99995))

(declare-fun b_lambda!4075 () Bool)

(assert (= b_lambda!4065 (or (and b!91491 b_free!2333) (and b!91496 b_free!2335 (= (defaultEntry!2406 newMap!16) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))))) b_lambda!4075)))

(declare-fun b_lambda!4077 () Bool)

(assert (= b_lambda!4061 (or (and b!91491 b_free!2333) (and b!91496 b_free!2335 (= (defaultEntry!2406 newMap!16) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))))) b_lambda!4077)))

(declare-fun b_lambda!4079 () Bool)

(assert (= b_lambda!4067 (or (and b!91491 b_free!2333) (and b!91496 b_free!2335 (= (defaultEntry!2406 newMap!16) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))))) b_lambda!4079)))

(declare-fun b_lambda!4081 () Bool)

(assert (= b_lambda!4063 (or (and b!91491 b_free!2333) (and b!91496 b_free!2335 (= (defaultEntry!2406 newMap!16) (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))))) b_lambda!4081)))

(declare-fun b_lambda!4083 () Bool)

(assert (= b_lambda!4069 (or (and b!91491 b_free!2333 (= (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) (defaultEntry!2406 newMap!16))) (and b!91496 b_free!2335) b_lambda!4083)))

(declare-fun b_lambda!4085 () Bool)

(assert (= b_lambda!4071 (or (and b!91491 b_free!2333 (= (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) (defaultEntry!2406 newMap!16))) (and b!91496 b_free!2335) b_lambda!4085)))

(declare-fun b_lambda!4087 () Bool)

(assert (= b_lambda!4073 (or (and b!91491 b_free!2333 (= (defaultEntry!2406 (v!2721 (underlying!313 thiss!992))) (defaultEntry!2406 newMap!16))) (and b!91496 b_free!2335) b_lambda!4087)))

(check-sat (not b!92057) (not b!92471) (not b!92524) (not b!92163) (not b!92098) (not d!24369) (not b!92513) (not bm!9071) (not d!24395) (not d!24283) (not d!24211) (not b!92097) (not bm!9098) (not b!92079) (not b!92225) (not bm!9061) (not d!24347) (not bm!9095) (not b!92357) (not bm!9115) (not bm!9112) (not b!92246) (not b!92297) (not d!24209) (not d!24325) (not b!92344) (not bm!9065) (not b!92273) (not b!92360) (not b!92148) (not b!92089) (not b!92262) (not b!92183) (not bm!9039) (not b!91973) (not b!92480) (not b!92463) (not b!91940) (not b!92116) (not b!91941) (not d!24377) (not d!24245) (not b!92124) (not d!24415) (not b!91918) (not b!92311) (not bm!9075) (not d!24317) (not b!92277) (not b!92358) (not b!92446) (not d!24433) (not b!92327) (not b!92349) (not b!92439) (not b!92178) (not b!92465) (not b_next!2333) (not d!24449) (not b!92329) (not d!24307) (not d!24431) (not b!92269) b_and!5609 (not d!24251) (not d!24351) (not bm!9057) (not b!92494) (not b!91903) (not d!24171) (not b!92072) (not d!24477) (not b!92355) (not d!24267) (not bm!9085) (not b!92231) (not d!24381) (not d!24185) (not b!92352) (not b!92070) (not b!92292) (not d!24243) (not b!92325) (not b!92068) (not b!92038) (not b!92310) (not d!24387) (not b!91983) (not d!24473) (not d!24219) (not b!92122) (not b!92430) (not b!91996) (not b!91958) (not b!92151) (not b!92514) (not b!92050) (not b!92436) (not b_lambda!4085) (not b!92288) (not b!92092) (not d!24331) (not b!92078) (not d!24471) (not b!92071) (not d!24333) (not b!92171) (not b!92449) (not b!91969) (not d!24335) (not b!92422) (not bm!9038) (not b!92521) (not b_lambda!4055) (not d!24379) (not b!92087) (not bm!9044) (not b!92363) (not bm!9076) (not b!91963) (not b!91968) (not b_lambda!4079) (not d!24191) (not b!92366) (not d!24375) (not b!91929) (not d!24291) (not d!24319) (not d!24309) (not mapNonEmpty!3583) (not b!91974) (not d!24235) (not b!91984) (not b!92131) (not b!91944) (not b!92272) (not d!24203) (not b!92517) (not b!92268) (not b!91919) (not b!92126) (not b!92226) (not b!92388) (not d!24365) (not d!24363) (not b!92132) (not b!92482) (not b!92425) (not bm!9056) (not b!92304) (not b!92506) (not d!24467) (not bm!9092) (not b!92473) (not b!92522) (not d!24205) (not b!92053) (not b!92237) (not b!92428) (not d!24405) (not d!24357) (not b!92380) (not d!24295) (not b!92365) (not b!92442) (not d!24323) (not b!92464) (not b!92296) (not d!24465) (not d!24197) (not bm!9121) (not b!92069) (not d!24393) (not b!91914) (not b!92519) (not d!24253) (not b!92427) (not b!92291) (not b!92182) (not d!24401) (not b!92392) (not d!24289) (not b!91997) (not d!24269) (not d!24293) (not b!92249) (not d!24419) (not b!91920) (not b!92518) (not b!91964) (not mapNonEmpty!3584) (not b!91977) (not b!92384) (not d!24417) (not b!92074) (not b!92532) (not d!24385) (not bm!9043) (not d!24447) (not b!92418) (not b!92133) (not b!91972) (not b!92267) tp_is_empty!2583 (not b!92179) (not b!91979) (not b_next!2335) (not d!24259) (not b!91930) (not b!92145) (not b!91943) (not b!92279) (not b_lambda!4087) (not b!91922) (not b!92361) (not b!91987) (not b!92252) (not d!24237) (not d!24279) (not b!92250) (not d!24459) (not b_lambda!4059) (not b!92469) (not b!91966) (not b!91928) (not d!24371) (not d!24215) (not bm!9091) (not d!24239) (not b!92476) (not d!24397) (not b!92119) (not b!92094) (not bm!9053) (not b!92055) (not b!92104) (not b!92290) (not d!24461) (not d!24217) (not d!24175) (not d!24341) (not b!92308) (not b!92433) (not b!92356) (not d!24273) (not b!92420) (not d!24195) (not b!92301) (not d!24277) (not d!24299) (not b!92129) (not b!92299) (not b!92167) (not b!92298) (not bm!9058) (not d!24201) (not b!92330) (not d!24199) (not b_lambda!4053) (not b!92323) (not b!92235) (not b_lambda!4083) (not b!92460) (not b!92112) (not b!92077) (not d!24227) (not b!92111) (not b!92359) (not b!92276) (not b!92483) (not b!92017) (not d!24275) (not b!92093) (not b!92172) (not b!92306) (not b!92318) (not b!92270) (not d!24287) (not b!92100) (not b!92175) (not b!92088) (not b!92085) (not b!91981) (not b!92445) (not b!91967) (not bm!9118) (not b!91986) (not b!92082) (not d!24455) (not d!24221) (not d!24443) (not d!24249) (not d!24231) (not b!92275) (not b!92437) (not b!92162) (not b!92529) (not b!92230) (not d!24329) (not b!92326) (not d!24343) (not b!92168) (not d!24173) (not d!24373) (not b!92135) (not b!92307) (not b!92369) (not b!92448) (not b!92227) (not bm!9101) (not d!24437) (not d!24207) (not b!92010) (not b!92155) (not b!92421) (not b!92351) (not b!92040) (not d!24445) (not b!92320) (not b!92041) (not d!24263) (not b!92059) (not d!24391) (not b!92444) (not b!92287) (not b!92342) (not b_lambda!4075) (not b!92478) (not d!24247) (not d!24177) (not b!92261) (not b!92181) (not d!24297) (not b!91915) (not bm!9042) (not d!24213) (not b!92362) (not b!92496) (not b!92502) (not b!92060) (not b!91978) (not d!24451) (not b!92048) (not b!92347) (not b!92462) (not d!24179) (not bm!9064) (not bm!9107) (not b!91995) (not b!92075) (not d!24423) (not bm!9060) (not d!24327) (not d!24383) (not b!92056) (not bm!9068) (not d!24469) (not d!24321) (not b!92170) (not d!24403) (not d!24349) (not b_lambda!4077) (not d!24301) (not b!92177) (not b!92232) (not d!24475) (not b!92466) (not bm!9122) (not b_lambda!4081) (not b_lambda!4041) (not d!24233) (not d!24441) (not d!24193) (not b!91982) (not b!91907) (not d!24389) (not d!24435) (not bm!9108) (not b!92180) (not b!92176) (not d!24355) (not b!92364) (not b!92117) (not b!92353) (not bm!9074) (not b!92479) (not d!24311) (not b!92499) (not d!24479) (not b_lambda!4057) (not d!24425) (not d!24367) (not b!91965) (not b!92492) (not b!92281) (not b_lambda!4051) (not b!91999) (not b!92016) (not b!92265) b_and!5607 (not bm!9117) (not bm!9087) (not bm!9111) (not b!92166) (not d!24399) (not b!92346) (not b!92136) (not bm!9106) (not b!92115) (not b!92242) (not bm!9070) (not d!24261) (not b!92367) (not d!24187) (not b!91985) (not d!24223) (not b!92498) (not bm!9086) (not b!92248))
(check-sat b_and!5607 b_and!5609 (not b_next!2333) (not b_next!2335))
