; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12846 () Bool)

(assert start!12846)

(declare-fun b!111690 () Bool)

(declare-fun b_free!2569 () Bool)

(declare-fun b_next!2569 () Bool)

(assert (=> b!111690 (= b_free!2569 (not b_next!2569))))

(declare-fun tp!10053 () Bool)

(declare-fun b_and!6861 () Bool)

(assert (=> b!111690 (= tp!10053 b_and!6861)))

(declare-fun b!111703 () Bool)

(declare-fun b_free!2571 () Bool)

(declare-fun b_next!2571 () Bool)

(assert (=> b!111703 (= b_free!2571 (not b_next!2571))))

(declare-fun tp!10055 () Bool)

(declare-fun b_and!6863 () Bool)

(assert (=> b!111703 (= tp!10055 b_and!6863)))

(declare-fun b!111683 () Bool)

(declare-fun e!72604 () Bool)

(declare-fun e!72615 () Bool)

(assert (=> b!111683 (= e!72604 e!72615)))

(declare-fun b!111684 () Bool)

(declare-fun e!72618 () Bool)

(declare-fun e!72616 () Bool)

(assert (=> b!111684 (= e!72618 (not e!72616))))

(declare-fun res!55139 () Bool)

(assert (=> b!111684 (=> res!55139 e!72616)))

(declare-datatypes ((V!3249 0))(
  ( (V!3250 (val!1395 Int)) )
))
(declare-datatypes ((array!4385 0))(
  ( (array!4386 (arr!2078 (Array (_ BitVec 32) (_ BitVec 64))) (size!2336 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1007 0))(
  ( (ValueCellFull!1007 (v!2945 V!3249)) (EmptyCell!1007) )
))
(declare-datatypes ((array!4387 0))(
  ( (array!4388 (arr!2079 (Array (_ BitVec 32) ValueCell!1007)) (size!2337 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!922 0))(
  ( (LongMapFixedSize!923 (defaultEntry!2647 Int) (mask!6825 (_ BitVec 32)) (extraKeys!2440 (_ BitVec 32)) (zeroValue!2516 V!3249) (minValue!2516 V!3249) (_size!510 (_ BitVec 32)) (_keys!4365 array!4385) (_values!2630 array!4387) (_vacant!510 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!724 0))(
  ( (Cell!725 (v!2946 LongMapFixedSize!922)) )
))
(declare-datatypes ((LongMap!724 0))(
  ( (LongMap!725 (underlying!373 Cell!724)) )
))
(declare-fun thiss!992 () LongMap!724)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!111684 (= res!55139 (not (validMask!0 (mask!6825 (v!2946 (underlying!373 thiss!992))))))))

(declare-datatypes ((tuple2!2398 0))(
  ( (tuple2!2399 (_1!1210 (_ BitVec 64)) (_2!1210 V!3249)) )
))
(declare-datatypes ((List!1613 0))(
  ( (Nil!1610) (Cons!1609 (h!2209 tuple2!2398) (t!5763 List!1613)) )
))
(declare-datatypes ((ListLongMap!1553 0))(
  ( (ListLongMap!1554 (toList!792 List!1613)) )
))
(declare-fun lt!57631 () ListLongMap!1553)

(declare-fun lt!57633 () tuple2!2398)

(declare-fun lt!57632 () tuple2!2398)

(declare-fun +!147 (ListLongMap!1553 tuple2!2398) ListLongMap!1553)

(assert (=> b!111684 (= (+!147 (+!147 lt!57631 lt!57633) lt!57632) (+!147 (+!147 lt!57631 lt!57632) lt!57633))))

(assert (=> b!111684 (= lt!57632 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!57642 () V!3249)

(assert (=> b!111684 (= lt!57633 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))

(declare-datatypes ((Unit!3461 0))(
  ( (Unit!3462) )
))
(declare-fun lt!57638 () Unit!3461)

(declare-fun addCommutativeForDiffKeys!60 (ListLongMap!1553 (_ BitVec 64) V!3249 (_ BitVec 64) V!3249) Unit!3461)

(assert (=> b!111684 (= lt!57638 (addCommutativeForDiffKeys!60 lt!57631 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!114 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 32) Int) ListLongMap!1553)

(assert (=> b!111684 (= lt!57631 (getCurrentListMapNoExtraKeys!114 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun mapIsEmpty!4019 () Bool)

(declare-fun mapRes!4019 () Bool)

(assert (=> mapIsEmpty!4019 mapRes!4019))

(declare-fun b!111685 () Bool)

(declare-fun e!72613 () Unit!3461)

(declare-fun Unit!3463 () Unit!3461)

(assert (=> b!111685 (= e!72613 Unit!3463)))

(declare-fun b!111686 () Bool)

(declare-fun e!72609 () Bool)

(declare-fun e!72617 () Bool)

(declare-fun mapRes!4020 () Bool)

(assert (=> b!111686 (= e!72609 (and e!72617 mapRes!4020))))

(declare-fun condMapEmpty!4019 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!922)

(declare-fun mapDefault!4019 () ValueCell!1007)

(assert (=> b!111686 (= condMapEmpty!4019 (= (arr!2079 (_values!2630 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1007)) mapDefault!4019)))))

(declare-fun b!111687 () Bool)

(declare-fun res!55137 () Bool)

(declare-fun e!72605 () Bool)

(assert (=> b!111687 (=> (not res!55137) (not e!72605))))

(declare-fun valid!436 (LongMapFixedSize!922) Bool)

(assert (=> b!111687 (= res!55137 (valid!436 newMap!16))))

(declare-fun res!55142 () Bool)

(assert (=> start!12846 (=> (not res!55142) (not e!72605))))

(declare-fun valid!437 (LongMap!724) Bool)

(assert (=> start!12846 (= res!55142 (valid!437 thiss!992))))

(assert (=> start!12846 e!72605))

(declare-fun e!72612 () Bool)

(assert (=> start!12846 e!72612))

(assert (=> start!12846 true))

(declare-fun e!72608 () Bool)

(assert (=> start!12846 e!72608))

(declare-fun b!111688 () Bool)

(declare-fun e!72619 () Bool)

(declare-fun e!72607 () Bool)

(assert (=> b!111688 (= e!72619 (and e!72607 mapRes!4019))))

(declare-fun condMapEmpty!4020 () Bool)

(declare-fun mapDefault!4020 () ValueCell!1007)

(assert (=> b!111688 (= condMapEmpty!4020 (= (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1007)) mapDefault!4020)))))

(declare-fun b!111689 () Bool)

(declare-fun tp_is_empty!2701 () Bool)

(assert (=> b!111689 (= e!72607 tp_is_empty!2701)))

(declare-fun array_inv!1287 (array!4385) Bool)

(declare-fun array_inv!1288 (array!4387) Bool)

(assert (=> b!111690 (= e!72615 (and tp!10053 tp_is_empty!2701 (array_inv!1287 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (array_inv!1288 (_values!2630 (v!2946 (underlying!373 thiss!992)))) e!72619))))

(declare-fun mapIsEmpty!4020 () Bool)

(assert (=> mapIsEmpty!4020 mapRes!4020))

(declare-fun b!111691 () Bool)

(declare-fun e!72614 () Bool)

(declare-fun e!72603 () Bool)

(assert (=> b!111691 (= e!72614 e!72603)))

(declare-fun res!55145 () Bool)

(assert (=> b!111691 (=> (not res!55145) (not e!72603))))

(assert (=> b!111691 (= res!55145 (and (not (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1359 (ValueCell!1007 V!3249) V!3249)

(declare-fun dynLambda!391 (Int (_ BitVec 64)) V!3249)

(assert (=> b!111691 (= lt!57642 (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) from!355) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!111692 () Bool)

(assert (=> b!111692 (= e!72617 tp_is_empty!2701)))

(declare-fun b!111693 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4385 (_ BitVec 32)) Bool)

(assert (=> b!111693 (= e!72616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!111694 () Bool)

(declare-fun Unit!3464 () Unit!3461)

(assert (=> b!111694 (= e!72613 Unit!3464)))

(declare-fun lt!57637 () Unit!3461)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!106 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 64) (_ BitVec 32) Int) Unit!3461)

(assert (=> b!111694 (= lt!57637 (lemmaListMapContainsThenArrayContainsFrom!106 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!111694 (arrayContainsKey!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!57641 () Unit!3461)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4385 (_ BitVec 32) (_ BitVec 32)) Unit!3461)

(assert (=> b!111694 (= lt!57641 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1614 0))(
  ( (Nil!1611) (Cons!1610 (h!2210 (_ BitVec 64)) (t!5764 List!1614)) )
))
(declare-fun arrayNoDuplicates!0 (array!4385 (_ BitVec 32) List!1614) Bool)

(assert (=> b!111694 (arrayNoDuplicates!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) from!355 Nil!1611)))

(declare-fun lt!57634 () Unit!3461)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4385 (_ BitVec 32) (_ BitVec 64) List!1614) Unit!3461)

(assert (=> b!111694 (= lt!57634 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (Cons!1610 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1611)))))

(assert (=> b!111694 false))

(declare-fun mapNonEmpty!4019 () Bool)

(declare-fun tp!10054 () Bool)

(declare-fun e!72611 () Bool)

(assert (=> mapNonEmpty!4019 (= mapRes!4019 (and tp!10054 e!72611))))

(declare-fun mapRest!4020 () (Array (_ BitVec 32) ValueCell!1007))

(declare-fun mapKey!4019 () (_ BitVec 32))

(declare-fun mapValue!4019 () ValueCell!1007)

(assert (=> mapNonEmpty!4019 (= (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (store mapRest!4020 mapKey!4019 mapValue!4019))))

(declare-fun b!111695 () Bool)

(declare-fun res!55143 () Bool)

(assert (=> b!111695 (=> res!55143 e!72616)))

(assert (=> b!111695 (= res!55143 (or (not (= (size!2337 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6825 (v!2946 (underlying!373 thiss!992)))))) (not (= (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (size!2337 (_values!2630 (v!2946 (underlying!373 thiss!992)))))) (bvslt (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!111696 () Bool)

(assert (=> b!111696 (= e!72611 tp_is_empty!2701)))

(declare-fun b!111697 () Bool)

(assert (=> b!111697 (= e!72603 e!72618)))

(declare-fun res!55140 () Bool)

(assert (=> b!111697 (=> (not res!55140) (not e!72618))))

(declare-datatypes ((tuple2!2400 0))(
  ( (tuple2!2401 (_1!1211 Bool) (_2!1211 LongMapFixedSize!922)) )
))
(declare-fun lt!57639 () tuple2!2400)

(assert (=> b!111697 (= res!55140 (and (_1!1211 lt!57639) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!57640 () Unit!3461)

(assert (=> b!111697 (= lt!57640 e!72613)))

(declare-fun lt!57635 () ListLongMap!1553)

(declare-fun c!19931 () Bool)

(declare-fun contains!829 (ListLongMap!1553 (_ BitVec 64)) Bool)

(assert (=> b!111697 (= c!19931 (contains!829 lt!57635 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun update!168 (LongMapFixedSize!922 (_ BitVec 64) V!3249) tuple2!2400)

(assert (=> b!111697 (= lt!57639 (update!168 newMap!16 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))

(declare-fun b!111698 () Bool)

(declare-fun res!55144 () Bool)

(assert (=> b!111698 (=> (not res!55144) (not e!72605))))

(assert (=> b!111698 (= res!55144 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6825 newMap!16)) (_size!510 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!111699 () Bool)

(assert (=> b!111699 (= e!72605 e!72614)))

(declare-fun res!55141 () Bool)

(assert (=> b!111699 (=> (not res!55141) (not e!72614))))

(declare-fun lt!57636 () ListLongMap!1553)

(assert (=> b!111699 (= res!55141 (= lt!57636 lt!57635))))

(declare-fun map!1299 (LongMapFixedSize!922) ListLongMap!1553)

(assert (=> b!111699 (= lt!57635 (map!1299 newMap!16))))

(declare-fun getCurrentListMap!477 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 32) Int) ListLongMap!1553)

(assert (=> b!111699 (= lt!57636 (getCurrentListMap!477 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!111700 () Bool)

(declare-fun e!72610 () Bool)

(assert (=> b!111700 (= e!72610 tp_is_empty!2701)))

(declare-fun b!111701 () Bool)

(declare-fun res!55138 () Bool)

(assert (=> b!111701 (=> (not res!55138) (not e!72605))))

(assert (=> b!111701 (= res!55138 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun mapNonEmpty!4020 () Bool)

(declare-fun tp!10056 () Bool)

(assert (=> mapNonEmpty!4020 (= mapRes!4020 (and tp!10056 e!72610))))

(declare-fun mapKey!4020 () (_ BitVec 32))

(declare-fun mapValue!4020 () ValueCell!1007)

(declare-fun mapRest!4019 () (Array (_ BitVec 32) ValueCell!1007))

(assert (=> mapNonEmpty!4020 (= (arr!2079 (_values!2630 newMap!16)) (store mapRest!4019 mapKey!4020 mapValue!4020))))

(declare-fun b!111702 () Bool)

(assert (=> b!111702 (= e!72612 e!72604)))

(assert (=> b!111703 (= e!72608 (and tp!10055 tp_is_empty!2701 (array_inv!1287 (_keys!4365 newMap!16)) (array_inv!1288 (_values!2630 newMap!16)) e!72609))))

(assert (= (and start!12846 res!55142) b!111701))

(assert (= (and b!111701 res!55138) b!111687))

(assert (= (and b!111687 res!55137) b!111698))

(assert (= (and b!111698 res!55144) b!111699))

(assert (= (and b!111699 res!55141) b!111691))

(assert (= (and b!111691 res!55145) b!111697))

(assert (= (and b!111697 c!19931) b!111694))

(assert (= (and b!111697 (not c!19931)) b!111685))

(assert (= (and b!111697 res!55140) b!111684))

(assert (= (and b!111684 (not res!55139)) b!111695))

(assert (= (and b!111695 (not res!55143)) b!111693))

(assert (= (and b!111688 condMapEmpty!4020) mapIsEmpty!4019))

(assert (= (and b!111688 (not condMapEmpty!4020)) mapNonEmpty!4019))

(get-info :version)

(assert (= (and mapNonEmpty!4019 ((_ is ValueCellFull!1007) mapValue!4019)) b!111696))

(assert (= (and b!111688 ((_ is ValueCellFull!1007) mapDefault!4020)) b!111689))

(assert (= b!111690 b!111688))

(assert (= b!111683 b!111690))

(assert (= b!111702 b!111683))

(assert (= start!12846 b!111702))

(assert (= (and b!111686 condMapEmpty!4019) mapIsEmpty!4020))

(assert (= (and b!111686 (not condMapEmpty!4019)) mapNonEmpty!4020))

(assert (= (and mapNonEmpty!4020 ((_ is ValueCellFull!1007) mapValue!4020)) b!111700))

(assert (= (and b!111686 ((_ is ValueCellFull!1007) mapDefault!4019)) b!111692))

(assert (= b!111703 b!111686))

(assert (= start!12846 b!111703))

(declare-fun b_lambda!5011 () Bool)

(assert (=> (not b_lambda!5011) (not b!111691)))

(declare-fun t!5760 () Bool)

(declare-fun tb!2113 () Bool)

(assert (=> (and b!111690 (= (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))) t!5760) tb!2113))

(declare-fun result!3541 () Bool)

(assert (=> tb!2113 (= result!3541 tp_is_empty!2701)))

(assert (=> b!111691 t!5760))

(declare-fun b_and!6865 () Bool)

(assert (= b_and!6861 (and (=> t!5760 result!3541) b_and!6865)))

(declare-fun tb!2115 () Bool)

(declare-fun t!5762 () Bool)

(assert (=> (and b!111703 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))) t!5762) tb!2115))

(declare-fun result!3545 () Bool)

(assert (= result!3545 result!3541))

(assert (=> b!111691 t!5762))

(declare-fun b_and!6867 () Bool)

(assert (= b_and!6863 (and (=> t!5762 result!3545) b_and!6867)))

(declare-fun m!127409 () Bool)

(assert (=> b!111687 m!127409))

(declare-fun m!127411 () Bool)

(assert (=> b!111691 m!127411))

(declare-fun m!127413 () Bool)

(assert (=> b!111691 m!127413))

(declare-fun m!127415 () Bool)

(assert (=> b!111691 m!127415))

(assert (=> b!111691 m!127413))

(assert (=> b!111691 m!127415))

(declare-fun m!127417 () Bool)

(assert (=> b!111691 m!127417))

(assert (=> b!111684 m!127411))

(declare-fun m!127419 () Bool)

(assert (=> b!111684 m!127419))

(declare-fun m!127421 () Bool)

(assert (=> b!111684 m!127421))

(assert (=> b!111684 m!127411))

(declare-fun m!127423 () Bool)

(assert (=> b!111684 m!127423))

(assert (=> b!111684 m!127423))

(declare-fun m!127425 () Bool)

(assert (=> b!111684 m!127425))

(declare-fun m!127427 () Bool)

(assert (=> b!111684 m!127427))

(declare-fun m!127429 () Bool)

(assert (=> b!111684 m!127429))

(declare-fun m!127431 () Bool)

(assert (=> b!111684 m!127431))

(assert (=> b!111684 m!127429))

(assert (=> b!111697 m!127411))

(assert (=> b!111697 m!127411))

(declare-fun m!127433 () Bool)

(assert (=> b!111697 m!127433))

(assert (=> b!111697 m!127411))

(declare-fun m!127435 () Bool)

(assert (=> b!111697 m!127435))

(declare-fun m!127437 () Bool)

(assert (=> b!111690 m!127437))

(declare-fun m!127439 () Bool)

(assert (=> b!111690 m!127439))

(declare-fun m!127441 () Bool)

(assert (=> b!111693 m!127441))

(declare-fun m!127443 () Bool)

(assert (=> b!111694 m!127443))

(declare-fun m!127445 () Bool)

(assert (=> b!111694 m!127445))

(assert (=> b!111694 m!127411))

(declare-fun m!127447 () Bool)

(assert (=> b!111694 m!127447))

(assert (=> b!111694 m!127411))

(assert (=> b!111694 m!127411))

(declare-fun m!127449 () Bool)

(assert (=> b!111694 m!127449))

(assert (=> b!111694 m!127411))

(declare-fun m!127451 () Bool)

(assert (=> b!111694 m!127451))

(declare-fun m!127453 () Bool)

(assert (=> start!12846 m!127453))

(declare-fun m!127455 () Bool)

(assert (=> mapNonEmpty!4019 m!127455))

(declare-fun m!127457 () Bool)

(assert (=> b!111703 m!127457))

(declare-fun m!127459 () Bool)

(assert (=> b!111703 m!127459))

(declare-fun m!127461 () Bool)

(assert (=> mapNonEmpty!4020 m!127461))

(declare-fun m!127463 () Bool)

(assert (=> b!111699 m!127463))

(declare-fun m!127465 () Bool)

(assert (=> b!111699 m!127465))

(check-sat tp_is_empty!2701 (not b!111699) (not start!12846) b_and!6865 (not mapNonEmpty!4019) (not b!111697) (not b!111690) (not b!111691) (not b!111694) (not b_next!2569) (not b!111703) (not b!111693) (not b!111687) (not mapNonEmpty!4020) (not b_lambda!5011) (not b_next!2571) b_and!6867 (not b!111684))
(check-sat b_and!6865 b_and!6867 (not b_next!2569) (not b_next!2571))
(get-model)

(declare-fun b_lambda!5017 () Bool)

(assert (= b_lambda!5011 (or (and b!111690 b_free!2569) (and b!111703 b_free!2571 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))))) b_lambda!5017)))

(check-sat tp_is_empty!2701 (not b!111699) (not start!12846) b_and!6865 (not mapNonEmpty!4019) (not b_next!2571) (not b!111697) (not b!111690) (not b!111691) (not b!111694) (not b_next!2569) (not b_lambda!5017) (not b!111703) (not b!111693) (not b!111687) (not mapNonEmpty!4020) b_and!6867 (not b!111684))
(check-sat b_and!6865 b_and!6867 (not b_next!2569) (not b_next!2571))
(get-model)

(declare-fun d!31825 () Bool)

(assert (=> d!31825 (= (map!1299 newMap!16) (getCurrentListMap!477 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun bs!4614 () Bool)

(assert (= bs!4614 d!31825))

(declare-fun m!127583 () Bool)

(assert (=> bs!4614 m!127583))

(assert (=> b!111699 d!31825))

(declare-fun b!111878 () Bool)

(declare-fun e!72760 () Bool)

(declare-fun e!72762 () Bool)

(assert (=> b!111878 (= e!72760 e!72762)))

(declare-fun res!55222 () Bool)

(declare-fun call!11932 () Bool)

(assert (=> b!111878 (= res!55222 call!11932)))

(assert (=> b!111878 (=> (not res!55222) (not e!72762))))

(declare-fun bm!11926 () Bool)

(declare-fun call!11935 () ListLongMap!1553)

(declare-fun call!11930 () ListLongMap!1553)

(assert (=> bm!11926 (= call!11935 call!11930)))

(declare-fun b!111879 () Bool)

(declare-fun e!72756 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!111879 (= e!72756 (validKeyInArray!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!111880 () Bool)

(declare-fun e!72766 () ListLongMap!1553)

(assert (=> b!111880 (= e!72766 call!11935)))

(declare-fun bm!11928 () Bool)

(declare-fun lt!57771 () ListLongMap!1553)

(assert (=> bm!11928 (= call!11932 (contains!829 lt!57771 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!111881 () Bool)

(declare-fun e!72767 () Bool)

(declare-fun apply!101 (ListLongMap!1553 (_ BitVec 64)) V!3249)

(assert (=> b!111881 (= e!72767 (= (apply!101 lt!57771 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!111881 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2337 (_values!2630 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> b!111881 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!111882 () Bool)

(assert (=> b!111882 (= e!72762 (= (apply!101 lt!57771 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!111883 () Bool)

(declare-fun e!72763 () ListLongMap!1553)

(declare-fun call!11929 () ListLongMap!1553)

(assert (=> b!111883 (= e!72763 (+!147 call!11929 (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!111884 () Bool)

(declare-fun e!72764 () Bool)

(assert (=> b!111884 (= e!72764 e!72767)))

(declare-fun res!55218 () Bool)

(assert (=> b!111884 (=> (not res!55218) (not e!72767))))

(assert (=> b!111884 (= res!55218 (contains!829 lt!57771 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!111884 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!111885 () Bool)

(assert (=> b!111885 (= e!72760 (not call!11932))))

(declare-fun b!111886 () Bool)

(declare-fun c!19951 () Bool)

(assert (=> b!111886 (= c!19951 (and (not (= (bvand (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!72759 () ListLongMap!1553)

(assert (=> b!111886 (= e!72759 e!72766)))

(declare-fun b!111887 () Bool)

(declare-fun res!55219 () Bool)

(declare-fun e!72758 () Bool)

(assert (=> b!111887 (=> (not res!55219) (not e!72758))))

(assert (=> b!111887 (= res!55219 e!72760)))

(declare-fun c!19955 () Bool)

(assert (=> b!111887 (= c!19955 (not (= (bvand (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!111888 () Bool)

(declare-fun call!11931 () ListLongMap!1553)

(assert (=> b!111888 (= e!72766 call!11931)))

(declare-fun b!111889 () Bool)

(declare-fun e!72761 () Bool)

(assert (=> b!111889 (= e!72761 (validKeyInArray!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!11929 () Bool)

(declare-fun call!11933 () ListLongMap!1553)

(assert (=> bm!11929 (= call!11930 call!11933)))

(declare-fun b!111890 () Bool)

(declare-fun res!55223 () Bool)

(assert (=> b!111890 (=> (not res!55223) (not e!72758))))

(assert (=> b!111890 (= res!55223 e!72764)))

(declare-fun res!55224 () Bool)

(assert (=> b!111890 (=> res!55224 e!72764)))

(assert (=> b!111890 (= res!55224 (not e!72756))))

(declare-fun res!55225 () Bool)

(assert (=> b!111890 (=> (not res!55225) (not e!72756))))

(assert (=> b!111890 (= res!55225 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun d!31827 () Bool)

(assert (=> d!31827 e!72758))

(declare-fun res!55226 () Bool)

(assert (=> d!31827 (=> (not res!55226) (not e!72758))))

(assert (=> d!31827 (= res!55226 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun lt!57778 () ListLongMap!1553)

(assert (=> d!31827 (= lt!57771 lt!57778)))

(declare-fun lt!57763 () Unit!3461)

(declare-fun e!72757 () Unit!3461)

(assert (=> d!31827 (= lt!57763 e!72757)))

(declare-fun c!19954 () Bool)

(assert (=> d!31827 (= c!19954 e!72761)))

(declare-fun res!55220 () Bool)

(assert (=> d!31827 (=> (not res!55220) (not e!72761))))

(assert (=> d!31827 (= res!55220 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> d!31827 (= lt!57778 e!72763)))

(declare-fun c!19953 () Bool)

(assert (=> d!31827 (= c!19953 (and (not (= (bvand (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!31827 (validMask!0 (mask!6825 (v!2946 (underlying!373 thiss!992))))))

(assert (=> d!31827 (= (getCurrentListMap!477 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))) lt!57771)))

(declare-fun bm!11927 () Bool)

(assert (=> bm!11927 (= call!11931 call!11929)))

(declare-fun b!111891 () Bool)

(declare-fun Unit!3473 () Unit!3461)

(assert (=> b!111891 (= e!72757 Unit!3473)))

(declare-fun b!111892 () Bool)

(assert (=> b!111892 (= e!72759 call!11931)))

(declare-fun b!111893 () Bool)

(declare-fun lt!57767 () Unit!3461)

(assert (=> b!111893 (= e!72757 lt!57767)))

(declare-fun lt!57759 () ListLongMap!1553)

(assert (=> b!111893 (= lt!57759 (getCurrentListMapNoExtraKeys!114 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun lt!57769 () (_ BitVec 64))

(assert (=> b!111893 (= lt!57769 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!57762 () (_ BitVec 64))

(assert (=> b!111893 (= lt!57762 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!57760 () Unit!3461)

(declare-fun addStillContains!77 (ListLongMap!1553 (_ BitVec 64) V!3249 (_ BitVec 64)) Unit!3461)

(assert (=> b!111893 (= lt!57760 (addStillContains!77 lt!57759 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) lt!57762))))

(assert (=> b!111893 (contains!829 (+!147 lt!57759 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57762)))

(declare-fun lt!57779 () Unit!3461)

(assert (=> b!111893 (= lt!57779 lt!57760)))

(declare-fun lt!57777 () ListLongMap!1553)

(assert (=> b!111893 (= lt!57777 (getCurrentListMapNoExtraKeys!114 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun lt!57761 () (_ BitVec 64))

(assert (=> b!111893 (= lt!57761 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!57765 () (_ BitVec 64))

(assert (=> b!111893 (= lt!57765 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!57764 () Unit!3461)

(declare-fun addApplyDifferent!77 (ListLongMap!1553 (_ BitVec 64) V!3249 (_ BitVec 64)) Unit!3461)

(assert (=> b!111893 (= lt!57764 (addApplyDifferent!77 lt!57777 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992))) lt!57765))))

(assert (=> b!111893 (= (apply!101 (+!147 lt!57777 (tuple2!2399 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57765) (apply!101 lt!57777 lt!57765))))

(declare-fun lt!57766 () Unit!3461)

(assert (=> b!111893 (= lt!57766 lt!57764)))

(declare-fun lt!57780 () ListLongMap!1553)

(assert (=> b!111893 (= lt!57780 (getCurrentListMapNoExtraKeys!114 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun lt!57773 () (_ BitVec 64))

(assert (=> b!111893 (= lt!57773 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!57772 () (_ BitVec 64))

(assert (=> b!111893 (= lt!57772 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!57768 () Unit!3461)

(assert (=> b!111893 (= lt!57768 (addApplyDifferent!77 lt!57780 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) lt!57772))))

(assert (=> b!111893 (= (apply!101 (+!147 lt!57780 (tuple2!2399 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57772) (apply!101 lt!57780 lt!57772))))

(declare-fun lt!57774 () Unit!3461)

(assert (=> b!111893 (= lt!57774 lt!57768)))

(declare-fun lt!57775 () ListLongMap!1553)

(assert (=> b!111893 (= lt!57775 (getCurrentListMapNoExtraKeys!114 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun lt!57776 () (_ BitVec 64))

(assert (=> b!111893 (= lt!57776 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!57770 () (_ BitVec 64))

(assert (=> b!111893 (= lt!57770 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!111893 (= lt!57767 (addApplyDifferent!77 lt!57775 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992))) lt!57770))))

(assert (=> b!111893 (= (apply!101 (+!147 lt!57775 (tuple2!2399 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57770) (apply!101 lt!57775 lt!57770))))

(declare-fun b!111894 () Bool)

(assert (=> b!111894 (= e!72763 e!72759)))

(declare-fun c!19950 () Bool)

(assert (=> b!111894 (= c!19950 (and (not (= (bvand (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!11930 () Bool)

(assert (=> bm!11930 (= call!11929 (+!147 (ite c!19953 call!11933 (ite c!19950 call!11930 call!11935)) (ite (or c!19953 c!19950) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun bm!11931 () Bool)

(assert (=> bm!11931 (= call!11933 (getCurrentListMapNoExtraKeys!114 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!111895 () Bool)

(declare-fun e!72765 () Bool)

(declare-fun call!11934 () Bool)

(assert (=> b!111895 (= e!72765 (not call!11934))))

(declare-fun b!111896 () Bool)

(assert (=> b!111896 (= e!72758 e!72765)))

(declare-fun c!19952 () Bool)

(assert (=> b!111896 (= c!19952 (not (= (bvand (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!111897 () Bool)

(declare-fun e!72755 () Bool)

(assert (=> b!111897 (= e!72755 (= (apply!101 lt!57771 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!111898 () Bool)

(assert (=> b!111898 (= e!72765 e!72755)))

(declare-fun res!55221 () Bool)

(assert (=> b!111898 (= res!55221 call!11934)))

(assert (=> b!111898 (=> (not res!55221) (not e!72755))))

(declare-fun bm!11932 () Bool)

(assert (=> bm!11932 (= call!11934 (contains!829 lt!57771 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!31827 c!19953) b!111883))

(assert (= (and d!31827 (not c!19953)) b!111894))

(assert (= (and b!111894 c!19950) b!111892))

(assert (= (and b!111894 (not c!19950)) b!111886))

(assert (= (and b!111886 c!19951) b!111888))

(assert (= (and b!111886 (not c!19951)) b!111880))

(assert (= (or b!111888 b!111880) bm!11926))

(assert (= (or b!111892 bm!11926) bm!11929))

(assert (= (or b!111892 b!111888) bm!11927))

(assert (= (or b!111883 bm!11929) bm!11931))

(assert (= (or b!111883 bm!11927) bm!11930))

(assert (= (and d!31827 res!55220) b!111889))

(assert (= (and d!31827 c!19954) b!111893))

(assert (= (and d!31827 (not c!19954)) b!111891))

(assert (= (and d!31827 res!55226) b!111890))

(assert (= (and b!111890 res!55225) b!111879))

(assert (= (and b!111890 (not res!55224)) b!111884))

(assert (= (and b!111884 res!55218) b!111881))

(assert (= (and b!111890 res!55223) b!111887))

(assert (= (and b!111887 c!19955) b!111878))

(assert (= (and b!111887 (not c!19955)) b!111885))

(assert (= (and b!111878 res!55222) b!111882))

(assert (= (or b!111878 b!111885) bm!11928))

(assert (= (and b!111887 res!55219) b!111896))

(assert (= (and b!111896 c!19952) b!111898))

(assert (= (and b!111896 (not c!19952)) b!111895))

(assert (= (and b!111898 res!55221) b!111897))

(assert (= (or b!111898 b!111895) bm!11932))

(declare-fun b_lambda!5019 () Bool)

(assert (=> (not b_lambda!5019) (not b!111881)))

(assert (=> b!111881 t!5760))

(declare-fun b_and!6885 () Bool)

(assert (= b_and!6865 (and (=> t!5760 result!3541) b_and!6885)))

(assert (=> b!111881 t!5762))

(declare-fun b_and!6887 () Bool)

(assert (= b_and!6867 (and (=> t!5762 result!3545) b_and!6887)))

(assert (=> d!31827 m!127421))

(declare-fun m!127585 () Bool)

(assert (=> bm!11928 m!127585))

(declare-fun m!127587 () Bool)

(assert (=> b!111889 m!127587))

(assert (=> b!111889 m!127587))

(declare-fun m!127589 () Bool)

(assert (=> b!111889 m!127589))

(declare-fun m!127591 () Bool)

(assert (=> bm!11932 m!127591))

(declare-fun m!127593 () Bool)

(assert (=> b!111881 m!127593))

(assert (=> b!111881 m!127415))

(assert (=> b!111881 m!127587))

(declare-fun m!127595 () Bool)

(assert (=> b!111881 m!127595))

(assert (=> b!111881 m!127587))

(assert (=> b!111881 m!127593))

(assert (=> b!111881 m!127415))

(declare-fun m!127597 () Bool)

(assert (=> b!111881 m!127597))

(declare-fun m!127599 () Bool)

(assert (=> b!111883 m!127599))

(assert (=> bm!11931 m!127427))

(assert (=> b!111884 m!127587))

(assert (=> b!111884 m!127587))

(declare-fun m!127601 () Bool)

(assert (=> b!111884 m!127601))

(declare-fun m!127603 () Bool)

(assert (=> b!111893 m!127603))

(declare-fun m!127605 () Bool)

(assert (=> b!111893 m!127605))

(declare-fun m!127607 () Bool)

(assert (=> b!111893 m!127607))

(declare-fun m!127609 () Bool)

(assert (=> b!111893 m!127609))

(declare-fun m!127611 () Bool)

(assert (=> b!111893 m!127611))

(declare-fun m!127613 () Bool)

(assert (=> b!111893 m!127613))

(declare-fun m!127615 () Bool)

(assert (=> b!111893 m!127615))

(declare-fun m!127617 () Bool)

(assert (=> b!111893 m!127617))

(declare-fun m!127619 () Bool)

(assert (=> b!111893 m!127619))

(assert (=> b!111893 m!127615))

(declare-fun m!127621 () Bool)

(assert (=> b!111893 m!127621))

(declare-fun m!127623 () Bool)

(assert (=> b!111893 m!127623))

(declare-fun m!127625 () Bool)

(assert (=> b!111893 m!127625))

(assert (=> b!111893 m!127617))

(declare-fun m!127627 () Bool)

(assert (=> b!111893 m!127627))

(assert (=> b!111893 m!127427))

(declare-fun m!127629 () Bool)

(assert (=> b!111893 m!127629))

(assert (=> b!111893 m!127603))

(declare-fun m!127631 () Bool)

(assert (=> b!111893 m!127631))

(assert (=> b!111893 m!127587))

(assert (=> b!111893 m!127609))

(assert (=> b!111879 m!127587))

(assert (=> b!111879 m!127587))

(assert (=> b!111879 m!127589))

(declare-fun m!127633 () Bool)

(assert (=> b!111882 m!127633))

(declare-fun m!127635 () Bool)

(assert (=> b!111897 m!127635))

(declare-fun m!127637 () Bool)

(assert (=> bm!11930 m!127637))

(assert (=> b!111699 d!31827))

(declare-fun d!31829 () Bool)

(assert (=> d!31829 (= (valid!437 thiss!992) (valid!436 (v!2946 (underlying!373 thiss!992))))))

(declare-fun bs!4615 () Bool)

(assert (= bs!4615 d!31829))

(declare-fun m!127639 () Bool)

(assert (=> bs!4615 m!127639))

(assert (=> start!12846 d!31829))

(declare-fun d!31831 () Bool)

(assert (=> d!31831 (not (arrayContainsKey!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!57783 () Unit!3461)

(declare-fun choose!68 (array!4385 (_ BitVec 32) (_ BitVec 64) List!1614) Unit!3461)

(assert (=> d!31831 (= lt!57783 (choose!68 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (Cons!1610 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1611)))))

(assert (=> d!31831 (bvslt (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!31831 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (Cons!1610 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1611)) lt!57783)))

(declare-fun bs!4616 () Bool)

(assert (= bs!4616 d!31831))

(assert (=> bs!4616 m!127411))

(assert (=> bs!4616 m!127449))

(assert (=> bs!4616 m!127411))

(declare-fun m!127641 () Bool)

(assert (=> bs!4616 m!127641))

(assert (=> b!111694 d!31831))

(declare-fun d!31833 () Bool)

(assert (=> d!31833 (arrayNoDuplicates!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) from!355 Nil!1611)))

(declare-fun lt!57786 () Unit!3461)

(declare-fun choose!39 (array!4385 (_ BitVec 32) (_ BitVec 32)) Unit!3461)

(assert (=> d!31833 (= lt!57786 (choose!39 (_keys!4365 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!31833 (bvslt (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!31833 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000 from!355) lt!57786)))

(declare-fun bs!4617 () Bool)

(assert (= bs!4617 d!31833))

(assert (=> bs!4617 m!127445))

(declare-fun m!127643 () Bool)

(assert (=> bs!4617 m!127643))

(assert (=> b!111694 d!31833))

(declare-fun d!31835 () Bool)

(declare-fun res!55231 () Bool)

(declare-fun e!72772 () Bool)

(assert (=> d!31835 (=> res!55231 e!72772)))

(assert (=> d!31835 (= res!55231 (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> d!31835 (= (arrayContainsKey!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!72772)))

(declare-fun b!111903 () Bool)

(declare-fun e!72773 () Bool)

(assert (=> b!111903 (= e!72772 e!72773)))

(declare-fun res!55232 () Bool)

(assert (=> b!111903 (=> (not res!55232) (not e!72773))))

(assert (=> b!111903 (= res!55232 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!111904 () Bool)

(assert (=> b!111904 (= e!72773 (arrayContainsKey!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!31835 (not res!55231)) b!111903))

(assert (= (and b!111903 res!55232) b!111904))

(assert (=> d!31835 m!127587))

(assert (=> b!111904 m!127411))

(declare-fun m!127645 () Bool)

(assert (=> b!111904 m!127645))

(assert (=> b!111694 d!31835))

(declare-fun d!31837 () Bool)

(declare-fun e!72776 () Bool)

(assert (=> d!31837 e!72776))

(declare-fun c!19958 () Bool)

(assert (=> d!31837 (= c!19958 (and (not (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!57789 () Unit!3461)

(declare-fun choose!704 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 64) (_ BitVec 32) Int) Unit!3461)

(assert (=> d!31837 (= lt!57789 (choose!704 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))))))

(assert (=> d!31837 (validMask!0 (mask!6825 (v!2946 (underlying!373 thiss!992))))))

(assert (=> d!31837 (= (lemmaListMapContainsThenArrayContainsFrom!106 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))) lt!57789)))

(declare-fun b!111909 () Bool)

(assert (=> b!111909 (= e!72776 (arrayContainsKey!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!111910 () Bool)

(assert (=> b!111910 (= e!72776 (ite (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!31837 c!19958) b!111909))

(assert (= (and d!31837 (not c!19958)) b!111910))

(assert (=> d!31837 m!127411))

(declare-fun m!127647 () Bool)

(assert (=> d!31837 m!127647))

(assert (=> d!31837 m!127421))

(assert (=> b!111909 m!127411))

(assert (=> b!111909 m!127449))

(assert (=> b!111694 d!31837))

(declare-fun b!111921 () Bool)

(declare-fun e!72787 () Bool)

(declare-fun e!72786 () Bool)

(assert (=> b!111921 (= e!72787 e!72786)))

(declare-fun res!55239 () Bool)

(assert (=> b!111921 (=> (not res!55239) (not e!72786))))

(declare-fun e!72785 () Bool)

(assert (=> b!111921 (= res!55239 (not e!72785))))

(declare-fun res!55240 () Bool)

(assert (=> b!111921 (=> (not res!55240) (not e!72785))))

(assert (=> b!111921 (= res!55240 (validKeyInArray!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun c!19961 () Bool)

(declare-fun call!11938 () Bool)

(declare-fun bm!11935 () Bool)

(assert (=> bm!11935 (= call!11938 (arrayNoDuplicates!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!19961 (Cons!1610 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1611) Nil!1611)))))

(declare-fun b!111922 () Bool)

(declare-fun e!72788 () Bool)

(assert (=> b!111922 (= e!72788 call!11938)))

(declare-fun b!111923 () Bool)

(assert (=> b!111923 (= e!72786 e!72788)))

(assert (=> b!111923 (= c!19961 (validKeyInArray!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun d!31839 () Bool)

(declare-fun res!55241 () Bool)

(assert (=> d!31839 (=> res!55241 e!72787)))

(assert (=> d!31839 (= res!55241 (bvsge from!355 (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> d!31839 (= (arrayNoDuplicates!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) from!355 Nil!1611) e!72787)))

(declare-fun b!111924 () Bool)

(declare-fun contains!832 (List!1614 (_ BitVec 64)) Bool)

(assert (=> b!111924 (= e!72785 (contains!832 Nil!1611 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!111925 () Bool)

(assert (=> b!111925 (= e!72788 call!11938)))

(assert (= (and d!31839 (not res!55241)) b!111921))

(assert (= (and b!111921 res!55240) b!111924))

(assert (= (and b!111921 res!55239) b!111923))

(assert (= (and b!111923 c!19961) b!111925))

(assert (= (and b!111923 (not c!19961)) b!111922))

(assert (= (or b!111925 b!111922) bm!11935))

(assert (=> b!111921 m!127411))

(assert (=> b!111921 m!127411))

(declare-fun m!127649 () Bool)

(assert (=> b!111921 m!127649))

(assert (=> bm!11935 m!127411))

(declare-fun m!127651 () Bool)

(assert (=> bm!11935 m!127651))

(assert (=> b!111923 m!127411))

(assert (=> b!111923 m!127411))

(assert (=> b!111923 m!127649))

(assert (=> b!111924 m!127411))

(assert (=> b!111924 m!127411))

(declare-fun m!127653 () Bool)

(assert (=> b!111924 m!127653))

(assert (=> b!111694 d!31839))

(declare-fun d!31841 () Bool)

(assert (=> d!31841 (= (array_inv!1287 (_keys!4365 newMap!16)) (bvsge (size!2336 (_keys!4365 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!111703 d!31841))

(declare-fun d!31843 () Bool)

(assert (=> d!31843 (= (array_inv!1288 (_values!2630 newMap!16)) (bvsge (size!2337 (_values!2630 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!111703 d!31843))

(declare-fun d!31845 () Bool)

(assert (=> d!31845 (= (array_inv!1287 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvsge (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!111690 d!31845))

(declare-fun d!31847 () Bool)

(assert (=> d!31847 (= (array_inv!1288 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvsge (size!2337 (_values!2630 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!111690 d!31847))

(declare-fun bm!11938 () Bool)

(declare-fun call!11941 () ListLongMap!1553)

(assert (=> bm!11938 (= call!11941 (getCurrentListMapNoExtraKeys!114 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!111951 () Bool)

(declare-fun e!72804 () ListLongMap!1553)

(declare-fun e!72806 () ListLongMap!1553)

(assert (=> b!111951 (= e!72804 e!72806)))

(declare-fun c!19971 () Bool)

(assert (=> b!111951 (= c!19971 (validKeyInArray!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!111952 () Bool)

(declare-fun e!72803 () Bool)

(assert (=> b!111952 (= e!72803 (validKeyInArray!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!111952 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!111953 () Bool)

(declare-fun lt!57806 () Unit!3461)

(declare-fun lt!57809 () Unit!3461)

(assert (=> b!111953 (= lt!57806 lt!57809)))

(declare-fun lt!57808 () (_ BitVec 64))

(declare-fun lt!57804 () V!3249)

(declare-fun lt!57805 () (_ BitVec 64))

(declare-fun lt!57810 () ListLongMap!1553)

(assert (=> b!111953 (not (contains!829 (+!147 lt!57810 (tuple2!2399 lt!57805 lt!57804)) lt!57808))))

(declare-fun addStillNotContains!51 (ListLongMap!1553 (_ BitVec 64) V!3249 (_ BitVec 64)) Unit!3461)

(assert (=> b!111953 (= lt!57809 (addStillNotContains!51 lt!57810 lt!57805 lt!57804 lt!57808))))

(assert (=> b!111953 (= lt!57808 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!111953 (= lt!57804 (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111953 (= lt!57805 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!111953 (= lt!57810 call!11941)))

(assert (=> b!111953 (= e!72806 (+!147 call!11941 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!111954 () Bool)

(declare-fun e!72805 () Bool)

(declare-fun e!72807 () Bool)

(assert (=> b!111954 (= e!72805 e!72807)))

(declare-fun c!19970 () Bool)

(assert (=> b!111954 (= c!19970 e!72803)))

(declare-fun res!55250 () Bool)

(assert (=> b!111954 (=> (not res!55250) (not e!72803))))

(assert (=> b!111954 (= res!55250 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!111955 () Bool)

(declare-fun e!72809 () Bool)

(declare-fun lt!57807 () ListLongMap!1553)

(declare-fun isEmpty!385 (ListLongMap!1553) Bool)

(assert (=> b!111955 (= e!72809 (isEmpty!385 lt!57807))))

(declare-fun b!111950 () Bool)

(assert (=> b!111950 (= e!72809 (= lt!57807 (getCurrentListMapNoExtraKeys!114 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun d!31849 () Bool)

(assert (=> d!31849 e!72805))

(declare-fun res!55251 () Bool)

(assert (=> d!31849 (=> (not res!55251) (not e!72805))))

(assert (=> d!31849 (= res!55251 (not (contains!829 lt!57807 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31849 (= lt!57807 e!72804)))

(declare-fun c!19972 () Bool)

(assert (=> d!31849 (= c!19972 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> d!31849 (validMask!0 (mask!6825 (v!2946 (underlying!373 thiss!992))))))

(assert (=> d!31849 (= (getCurrentListMapNoExtraKeys!114 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))) lt!57807)))

(declare-fun b!111956 () Bool)

(declare-fun e!72808 () Bool)

(assert (=> b!111956 (= e!72807 e!72808)))

(assert (=> b!111956 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun res!55253 () Bool)

(assert (=> b!111956 (= res!55253 (contains!829 lt!57807 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!111956 (=> (not res!55253) (not e!72808))))

(declare-fun b!111957 () Bool)

(assert (=> b!111957 (= e!72807 e!72809)))

(declare-fun c!19973 () Bool)

(assert (=> b!111957 (= c!19973 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!111958 () Bool)

(assert (=> b!111958 (= e!72806 call!11941)))

(declare-fun b!111959 () Bool)

(declare-fun res!55252 () Bool)

(assert (=> b!111959 (=> (not res!55252) (not e!72805))))

(assert (=> b!111959 (= res!55252 (not (contains!829 lt!57807 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!111960 () Bool)

(assert (=> b!111960 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> b!111960 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2337 (_values!2630 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> b!111960 (= e!72808 (= (apply!101 lt!57807 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!111961 () Bool)

(assert (=> b!111961 (= e!72804 (ListLongMap!1554 Nil!1610))))

(assert (= (and d!31849 c!19972) b!111961))

(assert (= (and d!31849 (not c!19972)) b!111951))

(assert (= (and b!111951 c!19971) b!111953))

(assert (= (and b!111951 (not c!19971)) b!111958))

(assert (= (or b!111953 b!111958) bm!11938))

(assert (= (and d!31849 res!55251) b!111959))

(assert (= (and b!111959 res!55252) b!111954))

(assert (= (and b!111954 res!55250) b!111952))

(assert (= (and b!111954 c!19970) b!111956))

(assert (= (and b!111954 (not c!19970)) b!111957))

(assert (= (and b!111956 res!55253) b!111960))

(assert (= (and b!111957 c!19973) b!111950))

(assert (= (and b!111957 (not c!19973)) b!111955))

(declare-fun b_lambda!5021 () Bool)

(assert (=> (not b_lambda!5021) (not b!111953)))

(assert (=> b!111953 t!5760))

(declare-fun b_and!6889 () Bool)

(assert (= b_and!6885 (and (=> t!5760 result!3541) b_and!6889)))

(assert (=> b!111953 t!5762))

(declare-fun b_and!6891 () Bool)

(assert (= b_and!6887 (and (=> t!5762 result!3545) b_and!6891)))

(declare-fun b_lambda!5023 () Bool)

(assert (=> (not b_lambda!5023) (not b!111960)))

(assert (=> b!111960 t!5760))

(declare-fun b_and!6893 () Bool)

(assert (= b_and!6889 (and (=> t!5760 result!3541) b_and!6893)))

(assert (=> b!111960 t!5762))

(declare-fun b_and!6895 () Bool)

(assert (= b_and!6891 (and (=> t!5762 result!3545) b_and!6895)))

(assert (=> b!111953 m!127415))

(assert (=> b!111953 m!127593))

(declare-fun m!127655 () Bool)

(assert (=> b!111953 m!127655))

(declare-fun m!127657 () Bool)

(assert (=> b!111953 m!127657))

(declare-fun m!127659 () Bool)

(assert (=> b!111953 m!127659))

(declare-fun m!127661 () Bool)

(assert (=> b!111953 m!127661))

(assert (=> b!111953 m!127593))

(assert (=> b!111953 m!127415))

(assert (=> b!111953 m!127597))

(assert (=> b!111953 m!127657))

(assert (=> b!111953 m!127587))

(assert (=> b!111951 m!127587))

(assert (=> b!111951 m!127587))

(assert (=> b!111951 m!127589))

(declare-fun m!127663 () Bool)

(assert (=> d!31849 m!127663))

(assert (=> d!31849 m!127421))

(assert (=> b!111952 m!127587))

(assert (=> b!111952 m!127587))

(assert (=> b!111952 m!127589))

(declare-fun m!127665 () Bool)

(assert (=> b!111959 m!127665))

(assert (=> b!111960 m!127415))

(assert (=> b!111960 m!127593))

(assert (=> b!111960 m!127587))

(declare-fun m!127667 () Bool)

(assert (=> b!111960 m!127667))

(assert (=> b!111960 m!127593))

(assert (=> b!111960 m!127415))

(assert (=> b!111960 m!127597))

(assert (=> b!111960 m!127587))

(declare-fun m!127669 () Bool)

(assert (=> b!111950 m!127669))

(assert (=> b!111956 m!127587))

(assert (=> b!111956 m!127587))

(declare-fun m!127671 () Bool)

(assert (=> b!111956 m!127671))

(assert (=> bm!11938 m!127669))

(declare-fun m!127673 () Bool)

(assert (=> b!111955 m!127673))

(assert (=> b!111684 d!31849))

(declare-fun d!31851 () Bool)

(declare-fun e!72812 () Bool)

(assert (=> d!31851 e!72812))

(declare-fun res!55259 () Bool)

(assert (=> d!31851 (=> (not res!55259) (not e!72812))))

(declare-fun lt!57819 () ListLongMap!1553)

(assert (=> d!31851 (= res!55259 (contains!829 lt!57819 (_1!1210 lt!57632)))))

(declare-fun lt!57820 () List!1613)

(assert (=> d!31851 (= lt!57819 (ListLongMap!1554 lt!57820))))

(declare-fun lt!57821 () Unit!3461)

(declare-fun lt!57822 () Unit!3461)

(assert (=> d!31851 (= lt!57821 lt!57822)))

(declare-datatypes ((Option!166 0))(
  ( (Some!165 (v!2952 V!3249)) (None!164) )
))
(declare-fun getValueByKey!160 (List!1613 (_ BitVec 64)) Option!166)

(assert (=> d!31851 (= (getValueByKey!160 lt!57820 (_1!1210 lt!57632)) (Some!165 (_2!1210 lt!57632)))))

(declare-fun lemmaContainsTupThenGetReturnValue!76 (List!1613 (_ BitVec 64) V!3249) Unit!3461)

(assert (=> d!31851 (= lt!57822 (lemmaContainsTupThenGetReturnValue!76 lt!57820 (_1!1210 lt!57632) (_2!1210 lt!57632)))))

(declare-fun insertStrictlySorted!79 (List!1613 (_ BitVec 64) V!3249) List!1613)

(assert (=> d!31851 (= lt!57820 (insertStrictlySorted!79 (toList!792 lt!57631) (_1!1210 lt!57632) (_2!1210 lt!57632)))))

(assert (=> d!31851 (= (+!147 lt!57631 lt!57632) lt!57819)))

(declare-fun b!111966 () Bool)

(declare-fun res!55258 () Bool)

(assert (=> b!111966 (=> (not res!55258) (not e!72812))))

(assert (=> b!111966 (= res!55258 (= (getValueByKey!160 (toList!792 lt!57819) (_1!1210 lt!57632)) (Some!165 (_2!1210 lt!57632))))))

(declare-fun b!111967 () Bool)

(declare-fun contains!833 (List!1613 tuple2!2398) Bool)

(assert (=> b!111967 (= e!72812 (contains!833 (toList!792 lt!57819) lt!57632))))

(assert (= (and d!31851 res!55259) b!111966))

(assert (= (and b!111966 res!55258) b!111967))

(declare-fun m!127675 () Bool)

(assert (=> d!31851 m!127675))

(declare-fun m!127677 () Bool)

(assert (=> d!31851 m!127677))

(declare-fun m!127679 () Bool)

(assert (=> d!31851 m!127679))

(declare-fun m!127681 () Bool)

(assert (=> d!31851 m!127681))

(declare-fun m!127683 () Bool)

(assert (=> b!111966 m!127683))

(declare-fun m!127685 () Bool)

(assert (=> b!111967 m!127685))

(assert (=> b!111684 d!31851))

(declare-fun d!31853 () Bool)

(declare-fun e!72813 () Bool)

(assert (=> d!31853 e!72813))

(declare-fun res!55261 () Bool)

(assert (=> d!31853 (=> (not res!55261) (not e!72813))))

(declare-fun lt!57823 () ListLongMap!1553)

(assert (=> d!31853 (= res!55261 (contains!829 lt!57823 (_1!1210 lt!57633)))))

(declare-fun lt!57824 () List!1613)

(assert (=> d!31853 (= lt!57823 (ListLongMap!1554 lt!57824))))

(declare-fun lt!57825 () Unit!3461)

(declare-fun lt!57826 () Unit!3461)

(assert (=> d!31853 (= lt!57825 lt!57826)))

(assert (=> d!31853 (= (getValueByKey!160 lt!57824 (_1!1210 lt!57633)) (Some!165 (_2!1210 lt!57633)))))

(assert (=> d!31853 (= lt!57826 (lemmaContainsTupThenGetReturnValue!76 lt!57824 (_1!1210 lt!57633) (_2!1210 lt!57633)))))

(assert (=> d!31853 (= lt!57824 (insertStrictlySorted!79 (toList!792 (+!147 lt!57631 lt!57632)) (_1!1210 lt!57633) (_2!1210 lt!57633)))))

(assert (=> d!31853 (= (+!147 (+!147 lt!57631 lt!57632) lt!57633) lt!57823)))

(declare-fun b!111968 () Bool)

(declare-fun res!55260 () Bool)

(assert (=> b!111968 (=> (not res!55260) (not e!72813))))

(assert (=> b!111968 (= res!55260 (= (getValueByKey!160 (toList!792 lt!57823) (_1!1210 lt!57633)) (Some!165 (_2!1210 lt!57633))))))

(declare-fun b!111969 () Bool)

(assert (=> b!111969 (= e!72813 (contains!833 (toList!792 lt!57823) lt!57633))))

(assert (= (and d!31853 res!55261) b!111968))

(assert (= (and b!111968 res!55260) b!111969))

(declare-fun m!127687 () Bool)

(assert (=> d!31853 m!127687))

(declare-fun m!127689 () Bool)

(assert (=> d!31853 m!127689))

(declare-fun m!127691 () Bool)

(assert (=> d!31853 m!127691))

(declare-fun m!127693 () Bool)

(assert (=> d!31853 m!127693))

(declare-fun m!127695 () Bool)

(assert (=> b!111968 m!127695))

(declare-fun m!127697 () Bool)

(assert (=> b!111969 m!127697))

(assert (=> b!111684 d!31853))

(declare-fun d!31855 () Bool)

(declare-fun e!72814 () Bool)

(assert (=> d!31855 e!72814))

(declare-fun res!55263 () Bool)

(assert (=> d!31855 (=> (not res!55263) (not e!72814))))

(declare-fun lt!57827 () ListLongMap!1553)

(assert (=> d!31855 (= res!55263 (contains!829 lt!57827 (_1!1210 lt!57632)))))

(declare-fun lt!57828 () List!1613)

(assert (=> d!31855 (= lt!57827 (ListLongMap!1554 lt!57828))))

(declare-fun lt!57829 () Unit!3461)

(declare-fun lt!57830 () Unit!3461)

(assert (=> d!31855 (= lt!57829 lt!57830)))

(assert (=> d!31855 (= (getValueByKey!160 lt!57828 (_1!1210 lt!57632)) (Some!165 (_2!1210 lt!57632)))))

(assert (=> d!31855 (= lt!57830 (lemmaContainsTupThenGetReturnValue!76 lt!57828 (_1!1210 lt!57632) (_2!1210 lt!57632)))))

(assert (=> d!31855 (= lt!57828 (insertStrictlySorted!79 (toList!792 (+!147 lt!57631 lt!57633)) (_1!1210 lt!57632) (_2!1210 lt!57632)))))

(assert (=> d!31855 (= (+!147 (+!147 lt!57631 lt!57633) lt!57632) lt!57827)))

(declare-fun b!111970 () Bool)

(declare-fun res!55262 () Bool)

(assert (=> b!111970 (=> (not res!55262) (not e!72814))))

(assert (=> b!111970 (= res!55262 (= (getValueByKey!160 (toList!792 lt!57827) (_1!1210 lt!57632)) (Some!165 (_2!1210 lt!57632))))))

(declare-fun b!111971 () Bool)

(assert (=> b!111971 (= e!72814 (contains!833 (toList!792 lt!57827) lt!57632))))

(assert (= (and d!31855 res!55263) b!111970))

(assert (= (and b!111970 res!55262) b!111971))

(declare-fun m!127699 () Bool)

(assert (=> d!31855 m!127699))

(declare-fun m!127701 () Bool)

(assert (=> d!31855 m!127701))

(declare-fun m!127703 () Bool)

(assert (=> d!31855 m!127703))

(declare-fun m!127705 () Bool)

(assert (=> d!31855 m!127705))

(declare-fun m!127707 () Bool)

(assert (=> b!111970 m!127707))

(declare-fun m!127709 () Bool)

(assert (=> b!111971 m!127709))

(assert (=> b!111684 d!31855))

(declare-fun d!31857 () Bool)

(assert (=> d!31857 (= (validMask!0 (mask!6825 (v!2946 (underlying!373 thiss!992)))) (and (or (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000001111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000011111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000001111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000011111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000001111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000011111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000000001111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000000011111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000000111111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000001111111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000011111111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000000111111111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000001111111111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000011111111111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000000111111111111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000001111111111111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000011111111111111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000000111111111111111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000001111111111111111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000011111111111111111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00000111111111111111111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00001111111111111111111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00011111111111111111111111111111) (= (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6825 (v!2946 (underlying!373 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!111684 d!31857))

(declare-fun d!31859 () Bool)

(declare-fun e!72815 () Bool)

(assert (=> d!31859 e!72815))

(declare-fun res!55265 () Bool)

(assert (=> d!31859 (=> (not res!55265) (not e!72815))))

(declare-fun lt!57831 () ListLongMap!1553)

(assert (=> d!31859 (= res!55265 (contains!829 lt!57831 (_1!1210 lt!57633)))))

(declare-fun lt!57832 () List!1613)

(assert (=> d!31859 (= lt!57831 (ListLongMap!1554 lt!57832))))

(declare-fun lt!57833 () Unit!3461)

(declare-fun lt!57834 () Unit!3461)

(assert (=> d!31859 (= lt!57833 lt!57834)))

(assert (=> d!31859 (= (getValueByKey!160 lt!57832 (_1!1210 lt!57633)) (Some!165 (_2!1210 lt!57633)))))

(assert (=> d!31859 (= lt!57834 (lemmaContainsTupThenGetReturnValue!76 lt!57832 (_1!1210 lt!57633) (_2!1210 lt!57633)))))

(assert (=> d!31859 (= lt!57832 (insertStrictlySorted!79 (toList!792 lt!57631) (_1!1210 lt!57633) (_2!1210 lt!57633)))))

(assert (=> d!31859 (= (+!147 lt!57631 lt!57633) lt!57831)))

(declare-fun b!111972 () Bool)

(declare-fun res!55264 () Bool)

(assert (=> b!111972 (=> (not res!55264) (not e!72815))))

(assert (=> b!111972 (= res!55264 (= (getValueByKey!160 (toList!792 lt!57831) (_1!1210 lt!57633)) (Some!165 (_2!1210 lt!57633))))))

(declare-fun b!111973 () Bool)

(assert (=> b!111973 (= e!72815 (contains!833 (toList!792 lt!57831) lt!57633))))

(assert (= (and d!31859 res!55265) b!111972))

(assert (= (and b!111972 res!55264) b!111973))

(declare-fun m!127711 () Bool)

(assert (=> d!31859 m!127711))

(declare-fun m!127713 () Bool)

(assert (=> d!31859 m!127713))

(declare-fun m!127715 () Bool)

(assert (=> d!31859 m!127715))

(declare-fun m!127717 () Bool)

(assert (=> d!31859 m!127717))

(declare-fun m!127719 () Bool)

(assert (=> b!111972 m!127719))

(declare-fun m!127721 () Bool)

(assert (=> b!111973 m!127721))

(assert (=> b!111684 d!31859))

(declare-fun d!31861 () Bool)

(assert (=> d!31861 (= (+!147 (+!147 lt!57631 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) (+!147 (+!147 lt!57631 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)))))

(declare-fun lt!57837 () Unit!3461)

(declare-fun choose!705 (ListLongMap!1553 (_ BitVec 64) V!3249 (_ BitVec 64) V!3249) Unit!3461)

(assert (=> d!31861 (= lt!57837 (choose!705 lt!57631 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))

(assert (=> d!31861 (not (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!31861 (= (addCommutativeForDiffKeys!60 lt!57631 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))) lt!57837)))

(declare-fun bs!4618 () Bool)

(assert (= bs!4618 d!31861))

(declare-fun m!127723 () Bool)

(assert (=> bs!4618 m!127723))

(declare-fun m!127725 () Bool)

(assert (=> bs!4618 m!127725))

(assert (=> bs!4618 m!127723))

(declare-fun m!127727 () Bool)

(assert (=> bs!4618 m!127727))

(assert (=> bs!4618 m!127725))

(declare-fun m!127729 () Bool)

(assert (=> bs!4618 m!127729))

(assert (=> bs!4618 m!127411))

(declare-fun m!127731 () Bool)

(assert (=> bs!4618 m!127731))

(assert (=> b!111684 d!31861))

(declare-fun d!31863 () Bool)

(declare-fun e!72821 () Bool)

(assert (=> d!31863 e!72821))

(declare-fun res!55268 () Bool)

(assert (=> d!31863 (=> res!55268 e!72821)))

(declare-fun lt!57847 () Bool)

(assert (=> d!31863 (= res!55268 (not lt!57847))))

(declare-fun lt!57846 () Bool)

(assert (=> d!31863 (= lt!57847 lt!57846)))

(declare-fun lt!57848 () Unit!3461)

(declare-fun e!72820 () Unit!3461)

(assert (=> d!31863 (= lt!57848 e!72820)))

(declare-fun c!19976 () Bool)

(assert (=> d!31863 (= c!19976 lt!57846)))

(declare-fun containsKey!163 (List!1613 (_ BitVec 64)) Bool)

(assert (=> d!31863 (= lt!57846 (containsKey!163 (toList!792 lt!57635) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> d!31863 (= (contains!829 lt!57635 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) lt!57847)))

(declare-fun b!111980 () Bool)

(declare-fun lt!57849 () Unit!3461)

(assert (=> b!111980 (= e!72820 lt!57849)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!111 (List!1613 (_ BitVec 64)) Unit!3461)

(assert (=> b!111980 (= lt!57849 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 lt!57635) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun isDefined!112 (Option!166) Bool)

(assert (=> b!111980 (isDefined!112 (getValueByKey!160 (toList!792 lt!57635) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!111981 () Bool)

(declare-fun Unit!3474 () Unit!3461)

(assert (=> b!111981 (= e!72820 Unit!3474)))

(declare-fun b!111982 () Bool)

(assert (=> b!111982 (= e!72821 (isDefined!112 (getValueByKey!160 (toList!792 lt!57635) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355))))))

(assert (= (and d!31863 c!19976) b!111980))

(assert (= (and d!31863 (not c!19976)) b!111981))

(assert (= (and d!31863 (not res!55268)) b!111982))

(assert (=> d!31863 m!127411))

(declare-fun m!127733 () Bool)

(assert (=> d!31863 m!127733))

(assert (=> b!111980 m!127411))

(declare-fun m!127735 () Bool)

(assert (=> b!111980 m!127735))

(assert (=> b!111980 m!127411))

(declare-fun m!127737 () Bool)

(assert (=> b!111980 m!127737))

(assert (=> b!111980 m!127737))

(declare-fun m!127739 () Bool)

(assert (=> b!111980 m!127739))

(assert (=> b!111982 m!127411))

(assert (=> b!111982 m!127737))

(assert (=> b!111982 m!127737))

(assert (=> b!111982 m!127739))

(assert (=> b!111697 d!31863))

(declare-fun d!31865 () Bool)

(declare-fun e!72867 () Bool)

(assert (=> d!31865 e!72867))

(declare-fun res!55297 () Bool)

(assert (=> d!31865 (=> (not res!55297) (not e!72867))))

(declare-fun lt!57911 () tuple2!2400)

(assert (=> d!31865 (= res!55297 (valid!436 (_2!1211 lt!57911)))))

(declare-fun e!72873 () tuple2!2400)

(assert (=> d!31865 (= lt!57911 e!72873)))

(declare-fun c!20003 () Bool)

(assert (=> d!31865 (= c!20003 (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (bvneg (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355))))))

(assert (=> d!31865 (valid!436 newMap!16)))

(assert (=> d!31865 (= (update!168 newMap!16 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642) lt!57911)))

(declare-fun b!112059 () Bool)

(declare-fun res!55305 () Bool)

(declare-fun e!72865 () Bool)

(assert (=> b!112059 (=> (not res!55305) (not e!72865))))

(declare-datatypes ((SeekEntryResult!256 0))(
  ( (MissingZero!256 (index!3175 (_ BitVec 32))) (Found!256 (index!3176 (_ BitVec 32))) (Intermediate!256 (undefined!1068 Bool) (index!3177 (_ BitVec 32)) (x!14088 (_ BitVec 32))) (Undefined!256) (MissingVacant!256 (index!3178 (_ BitVec 32))) )
))
(declare-fun lt!57923 () SeekEntryResult!256)

(assert (=> b!112059 (= res!55305 (= (select (arr!2078 (_keys!4365 newMap!16)) (index!3175 lt!57923)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112060 () Bool)

(declare-fun e!72864 () tuple2!2400)

(assert (=> b!112060 (= e!72873 e!72864)))

(declare-fun c!20006 () Bool)

(assert (=> b!112060 (= c!20006 (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112061 () Bool)

(declare-fun lt!57906 () Unit!3461)

(declare-fun e!72878 () Unit!3461)

(assert (=> b!112061 (= lt!57906 e!72878)))

(declare-fun c!20005 () Bool)

(declare-fun call!12007 () Bool)

(assert (=> b!112061 (= c!20005 call!12007)))

(declare-fun e!72866 () tuple2!2400)

(assert (=> b!112061 (= e!72866 (tuple2!2401 false newMap!16))))

(declare-fun b!112062 () Bool)

(declare-fun lt!57905 () Unit!3461)

(declare-fun lt!57908 () Unit!3461)

(assert (=> b!112062 (= lt!57905 lt!57908)))

(declare-fun call!12004 () ListLongMap!1553)

(declare-fun call!11996 () ListLongMap!1553)

(assert (=> b!112062 (= call!12004 call!11996)))

(declare-fun lt!57907 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!50 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 V!3249 Int) Unit!3461)

(assert (=> b!112062 (= lt!57908 (lemmaChangeZeroKeyThenAddPairToListMap!50 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) lt!57907 (zeroValue!2516 newMap!16) lt!57642 (minValue!2516 newMap!16) (defaultEntry!2647 newMap!16)))))

(assert (=> b!112062 (= lt!57907 (bvor (extraKeys!2440 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!112062 (= e!72864 (tuple2!2401 true (LongMapFixedSize!923 (defaultEntry!2647 newMap!16) (mask!6825 newMap!16) (bvor (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) lt!57642 (minValue!2516 newMap!16) (_size!510 newMap!16) (_keys!4365 newMap!16) (_values!2630 newMap!16) (_vacant!510 newMap!16))))))

(declare-fun lt!57929 () SeekEntryResult!256)

(declare-fun e!72881 () Bool)

(declare-fun b!112063 () Bool)

(assert (=> b!112063 (= e!72881 (= (select (arr!2078 (_keys!4365 newMap!16)) (index!3176 lt!57929)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!112064 () Bool)

(declare-fun e!72880 () Bool)

(assert (=> b!112064 (= e!72880 ((_ is Undefined!256) lt!57923))))

(declare-fun b!112065 () Bool)

(declare-fun e!72874 () Bool)

(declare-fun call!12006 () Bool)

(assert (=> b!112065 (= e!72874 (not call!12006))))

(declare-fun b!112066 () Bool)

(declare-fun res!55299 () Bool)

(declare-fun e!72862 () Bool)

(assert (=> b!112066 (=> (not res!55299) (not e!72862))))

(declare-fun lt!57917 () SeekEntryResult!256)

(assert (=> b!112066 (= res!55299 (= (select (arr!2078 (_keys!4365 newMap!16)) (index!3175 lt!57917)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!11987 () Bool)

(declare-fun call!11999 () Bool)

(assert (=> bm!11987 (= call!12006 call!11999)))

(declare-fun bm!11988 () Bool)

(declare-fun call!12013 () Bool)

(assert (=> bm!11988 (= call!12013 call!11999)))

(declare-fun b!112067 () Bool)

(declare-fun c!20002 () Bool)

(assert (=> b!112067 (= c!20002 ((_ is MissingVacant!256) lt!57923))))

(declare-fun e!72875 () Bool)

(assert (=> b!112067 (= e!72875 e!72880)))

(declare-fun b!112068 () Bool)

(declare-fun e!72877 () tuple2!2400)

(declare-fun lt!57915 () tuple2!2400)

(assert (=> b!112068 (= e!72877 (tuple2!2401 (_1!1211 lt!57915) (_2!1211 lt!57915)))))

(declare-fun call!11994 () tuple2!2400)

(assert (=> b!112068 (= lt!57915 call!11994)))

(declare-fun b!112069 () Bool)

(declare-fun res!55308 () Bool)

(assert (=> b!112069 (= res!55308 (= (select (arr!2078 (_keys!4365 newMap!16)) (index!3178 lt!57917)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!72872 () Bool)

(assert (=> b!112069 (=> (not res!55308) (not e!72872))))

(declare-fun b!112070 () Bool)

(declare-fun e!72879 () Unit!3461)

(declare-fun lt!57914 () Unit!3461)

(assert (=> b!112070 (= e!72879 lt!57914)))

(declare-fun call!12008 () Unit!3461)

(assert (=> b!112070 (= lt!57914 call!12008)))

(declare-fun lt!57922 () SeekEntryResult!256)

(declare-fun call!11992 () SeekEntryResult!256)

(assert (=> b!112070 (= lt!57922 call!11992)))

(declare-fun res!55310 () Bool)

(assert (=> b!112070 (= res!55310 ((_ is Found!256) lt!57922))))

(declare-fun e!72863 () Bool)

(assert (=> b!112070 (=> (not res!55310) (not e!72863))))

(assert (=> b!112070 e!72863))

(declare-fun b!112071 () Bool)

(declare-fun lt!57927 () tuple2!2400)

(assert (=> b!112071 (= lt!57927 call!11994)))

(declare-fun e!72871 () tuple2!2400)

(assert (=> b!112071 (= e!72871 (tuple2!2401 (_1!1211 lt!57927) (_2!1211 lt!57927)))))

(declare-fun bm!11989 () Bool)

(declare-fun call!12011 () ListLongMap!1553)

(assert (=> bm!11989 (= call!12011 (getCurrentListMap!477 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun b!112072 () Bool)

(assert (=> b!112072 (= e!72862 (not call!12013))))

(declare-fun call!11990 () ListLongMap!1553)

(declare-fun call!12005 () ListLongMap!1553)

(declare-fun e!72870 () Bool)

(declare-fun b!112073 () Bool)

(assert (=> b!112073 (= e!72870 (= call!12005 (+!147 call!11990 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(declare-fun b!112074 () Bool)

(declare-fun res!55300 () Bool)

(assert (=> b!112074 (= res!55300 (= (select (arr!2078 (_keys!4365 newMap!16)) (index!3178 lt!57923)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112074 (=> (not res!55300) (not e!72874))))

(declare-fun call!12000 () ListLongMap!1553)

(declare-fun bm!11990 () Bool)

(declare-fun call!12010 () ListLongMap!1553)

(assert (=> bm!11990 (= call!12000 (+!147 (ite c!20003 call!12010 call!12011) (ite c!20003 (ite c!20006 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57642) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57642)) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(declare-fun call!12009 () ListLongMap!1553)

(declare-fun lt!57916 () SeekEntryResult!256)

(declare-fun bm!11991 () Bool)

(declare-fun c!20008 () Bool)

(assert (=> bm!11991 (= call!12007 (contains!829 call!12009 (ite c!20008 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (select (arr!2078 (_keys!4365 newMap!16)) (index!3176 lt!57916)))))))

(declare-fun b!112075 () Bool)

(declare-fun c!20007 () Bool)

(assert (=> b!112075 (= c!20007 ((_ is MissingVacant!256) lt!57916))))

(assert (=> b!112075 (= e!72866 e!72877)))

(declare-fun bm!11992 () Bool)

(assert (=> bm!11992 (= call!11999 (arrayContainsKey!0 (_keys!4365 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!11993 () Bool)

(declare-fun call!12002 () ListLongMap!1553)

(assert (=> bm!11993 (= call!11996 call!12002)))

(declare-fun c!20010 () Bool)

(declare-fun call!12012 () Bool)

(declare-fun c!20011 () Bool)

(declare-fun bm!11994 () Bool)

(declare-fun c!20009 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!11994 (= call!12012 (inRange!0 (ite c!20008 (ite c!20005 (index!3176 lt!57929) (ite c!20010 (index!3175 lt!57923) (index!3178 lt!57923))) (ite c!20011 (index!3176 lt!57922) (ite c!20009 (index!3175 lt!57917) (index!3178 lt!57917)))) (mask!6825 newMap!16)))))

(declare-fun b!112076 () Bool)

(declare-fun res!55306 () Bool)

(declare-fun call!12003 () Bool)

(assert (=> b!112076 (= res!55306 call!12003)))

(assert (=> b!112076 (=> (not res!55306) (not e!72863))))

(declare-fun bm!11995 () Bool)

(assert (=> bm!11995 (= call!12004 call!12000)))

(declare-fun b!112077 () Bool)

(declare-fun Unit!3475 () Unit!3461)

(assert (=> b!112077 (= e!72879 Unit!3475)))

(declare-fun lt!57919 () Unit!3461)

(declare-fun call!12001 () Unit!3461)

(assert (=> b!112077 (= lt!57919 call!12001)))

(assert (=> b!112077 (= lt!57917 call!11992)))

(assert (=> b!112077 (= c!20009 ((_ is MissingZero!256) lt!57917))))

(declare-fun e!72868 () Bool)

(assert (=> b!112077 e!72868))

(declare-fun lt!57913 () Unit!3461)

(assert (=> b!112077 (= lt!57913 lt!57919)))

(assert (=> b!112077 false))

(declare-fun b!112078 () Bool)

(declare-fun e!72876 () Bool)

(assert (=> b!112078 (= e!72876 (= call!12005 call!11990))))

(declare-fun bm!11996 () Bool)

(assert (=> bm!11996 (= call!11990 (map!1299 newMap!16))))

(declare-fun b!112079 () Bool)

(declare-fun lt!57928 () Unit!3461)

(declare-fun lt!57926 () Unit!3461)

(assert (=> b!112079 (= lt!57928 lt!57926)))

(assert (=> b!112079 (= call!12004 call!11996)))

(declare-fun lt!57909 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!50 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 V!3249 Int) Unit!3461)

(assert (=> b!112079 (= lt!57926 (lemmaChangeLongMinValueKeyThenAddPairToListMap!50 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) lt!57909 (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) lt!57642 (defaultEntry!2647 newMap!16)))))

(assert (=> b!112079 (= lt!57909 (bvor (extraKeys!2440 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!112079 (= e!72864 (tuple2!2401 true (LongMapFixedSize!923 (defaultEntry!2647 newMap!16) (mask!6825 newMap!16) (bvor (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) (zeroValue!2516 newMap!16) lt!57642 (_size!510 newMap!16) (_keys!4365 newMap!16) (_values!2630 newMap!16) (_vacant!510 newMap!16))))))

(declare-fun b!112080 () Bool)

(declare-fun lt!57904 () Unit!3461)

(declare-fun lt!57920 () Unit!3461)

(assert (=> b!112080 (= lt!57904 lt!57920)))

(assert (=> b!112080 call!12007))

(declare-fun lt!57921 () array!4387)

(declare-fun lemmaValidKeyInArrayIsInListMap!110 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 32) Int) Unit!3461)

(assert (=> b!112080 (= lt!57920 (lemmaValidKeyInArrayIsInListMap!110 (_keys!4365 newMap!16) lt!57921 (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (index!3176 lt!57916) (defaultEntry!2647 newMap!16)))))

(assert (=> b!112080 (= lt!57921 (array!4388 (store (arr!2079 (_values!2630 newMap!16)) (index!3176 lt!57916) (ValueCellFull!1007 lt!57642)) (size!2337 (_values!2630 newMap!16))))))

(declare-fun lt!57912 () Unit!3461)

(declare-fun lt!57918 () Unit!3461)

(assert (=> b!112080 (= lt!57912 lt!57918)))

(assert (=> b!112080 (= call!12000 (getCurrentListMap!477 (_keys!4365 newMap!16) (array!4388 (store (arr!2079 (_values!2630 newMap!16)) (index!3176 lt!57916) (ValueCellFull!1007 lt!57642)) (size!2337 (_values!2630 newMap!16))) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!50 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 32) (_ BitVec 64) V!3249 Int) Unit!3461)

(assert (=> b!112080 (= lt!57918 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!50 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (index!3176 lt!57916) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!57924 () Unit!3461)

(assert (=> b!112080 (= lt!57924 e!72879)))

(assert (=> b!112080 (= c!20011 (contains!829 call!12011 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> b!112080 (= e!72871 (tuple2!2401 true (LongMapFixedSize!923 (defaultEntry!2647 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (_size!510 newMap!16) (_keys!4365 newMap!16) (array!4388 (store (arr!2079 (_values!2630 newMap!16)) (index!3176 lt!57916) (ValueCellFull!1007 lt!57642)) (size!2337 (_values!2630 newMap!16))) (_vacant!510 newMap!16))))))

(declare-fun b!112081 () Bool)

(declare-fun lt!57930 () Unit!3461)

(assert (=> b!112081 (= e!72878 lt!57930)))

(assert (=> b!112081 (= lt!57930 call!12001)))

(declare-fun call!11998 () SeekEntryResult!256)

(assert (=> b!112081 (= lt!57923 call!11998)))

(assert (=> b!112081 (= c!20010 ((_ is MissingZero!256) lt!57923))))

(assert (=> b!112081 e!72875))

(declare-fun bm!11997 () Bool)

(assert (=> bm!11997 (= call!12005 (map!1299 (_2!1211 lt!57911)))))

(declare-fun bm!11998 () Bool)

(declare-fun updateHelperNewKey!50 (LongMapFixedSize!922 (_ BitVec 64) V!3249 (_ BitVec 32)) tuple2!2400)

(assert (=> bm!11998 (= call!11994 (updateHelperNewKey!50 newMap!16 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642 (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916))))))

(declare-fun bm!11999 () Bool)

(declare-fun call!11993 () SeekEntryResult!256)

(assert (=> bm!11999 (= call!11998 call!11993)))

(declare-fun bm!12000 () Bool)

(assert (=> bm!12000 (= call!12002 (getCurrentListMap!477 (_keys!4365 newMap!16) (ite (or c!20003 c!20008) (_values!2630 newMap!16) lt!57921) (mask!6825 newMap!16) (ite c!20003 (ite c!20006 lt!57907 lt!57909) (extraKeys!2440 newMap!16)) (ite (and c!20003 c!20006) lt!57642 (zeroValue!2516 newMap!16)) (ite c!20003 (ite c!20006 (minValue!2516 newMap!16) lt!57642) (minValue!2516 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun bm!12001 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4385 (_ BitVec 32)) SeekEntryResult!256)

(assert (=> bm!12001 (= call!11993 (seekEntryOrOpen!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4365 newMap!16) (mask!6825 newMap!16)))))

(declare-fun bm!12002 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!50 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 64) Int) Unit!3461)

(assert (=> bm!12002 (= call!12001 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!50 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)))))

(declare-fun b!112082 () Bool)

(assert (=> b!112082 (= e!72877 e!72871)))

(declare-fun c!20012 () Bool)

(assert (=> b!112082 (= c!20012 ((_ is MissingZero!256) lt!57916))))

(declare-fun bm!12003 () Bool)

(assert (=> bm!12003 (= call!12010 call!12011)))

(declare-fun b!112083 () Bool)

(assert (=> b!112083 (= e!72873 e!72866)))

(assert (=> b!112083 (= lt!57916 (seekEntryOrOpen!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4365 newMap!16) (mask!6825 newMap!16)))))

(assert (=> b!112083 (= c!20008 ((_ is Undefined!256) lt!57916))))

(declare-fun bm!12004 () Bool)

(assert (=> bm!12004 (= call!12009 call!12002)))

(declare-fun b!112084 () Bool)

(assert (=> b!112084 (= e!72872 (not call!12013))))

(declare-fun b!112085 () Bool)

(assert (=> b!112085 (= e!72867 e!72876)))

(declare-fun c!20004 () Bool)

(assert (=> b!112085 (= c!20004 (_1!1211 lt!57911))))

(declare-fun b!112086 () Bool)

(declare-fun Unit!3476 () Unit!3461)

(assert (=> b!112086 (= e!72878 Unit!3476)))

(declare-fun lt!57910 () Unit!3461)

(assert (=> b!112086 (= lt!57910 call!12008)))

(assert (=> b!112086 (= lt!57929 call!11998)))

(declare-fun res!55304 () Bool)

(assert (=> b!112086 (= res!55304 ((_ is Found!256) lt!57929))))

(assert (=> b!112086 (=> (not res!55304) (not e!72881))))

(assert (=> b!112086 e!72881))

(declare-fun lt!57925 () Unit!3461)

(assert (=> b!112086 (= lt!57925 lt!57910)))

(assert (=> b!112086 false))

(declare-fun bm!12005 () Bool)

(declare-fun call!11997 () Bool)

(assert (=> bm!12005 (= call!11997 call!12012)))

(declare-fun bm!12006 () Bool)

(assert (=> bm!12006 (= call!11992 call!11993)))

(declare-fun bm!12007 () Bool)

(declare-fun call!11991 () Bool)

(assert (=> bm!12007 (= call!11991 call!12003)))

(declare-fun b!112087 () Bool)

(assert (=> b!112087 (= e!72876 e!72870)))

(declare-fun res!55302 () Bool)

(assert (=> b!112087 (= res!55302 (contains!829 call!12005 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> b!112087 (=> (not res!55302) (not e!72870))))

(declare-fun b!112088 () Bool)

(declare-fun res!55309 () Bool)

(assert (=> b!112088 (= res!55309 call!11997)))

(assert (=> b!112088 (=> (not res!55309) (not e!72881))))

(declare-fun b!112089 () Bool)

(assert (=> b!112089 (= e!72865 (not call!12006))))

(declare-fun b!112090 () Bool)

(declare-fun res!55298 () Bool)

(assert (=> b!112090 (=> (not res!55298) (not e!72862))))

(assert (=> b!112090 (= res!55298 call!11991)))

(assert (=> b!112090 (= e!72868 e!72862)))

(declare-fun b!112091 () Bool)

(declare-fun e!72869 () Bool)

(assert (=> b!112091 (= e!72869 ((_ is Undefined!256) lt!57917))))

(declare-fun b!112092 () Bool)

(assert (=> b!112092 (= e!72880 e!72874)))

(declare-fun res!55301 () Bool)

(declare-fun call!11995 () Bool)

(assert (=> b!112092 (= res!55301 call!11995)))

(assert (=> b!112092 (=> (not res!55301) (not e!72874))))

(declare-fun b!112093 () Bool)

(assert (=> b!112093 (= e!72869 e!72872)))

(declare-fun res!55303 () Bool)

(assert (=> b!112093 (= res!55303 call!11991)))

(assert (=> b!112093 (=> (not res!55303) (not e!72872))))

(declare-fun bm!12008 () Bool)

(assert (=> bm!12008 (= call!12003 call!12012)))

(declare-fun b!112094 () Bool)

(assert (=> b!112094 (= e!72863 (= (select (arr!2078 (_keys!4365 newMap!16)) (index!3176 lt!57922)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!112095 () Bool)

(declare-fun c!20001 () Bool)

(assert (=> b!112095 (= c!20001 ((_ is MissingVacant!256) lt!57917))))

(assert (=> b!112095 (= e!72868 e!72869)))

(declare-fun bm!12009 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!50 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 64) Int) Unit!3461)

(assert (=> bm!12009 (= call!12008 (lemmaInListMapThenSeekEntryOrOpenFindsIt!50 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)))))

(declare-fun b!112096 () Bool)

(declare-fun res!55307 () Bool)

(assert (=> b!112096 (=> (not res!55307) (not e!72865))))

(assert (=> b!112096 (= res!55307 call!11995)))

(assert (=> b!112096 (= e!72875 e!72865)))

(declare-fun bm!12010 () Bool)

(assert (=> bm!12010 (= call!11995 call!11997)))

(assert (= (and d!31865 c!20003) b!112060))

(assert (= (and d!31865 (not c!20003)) b!112083))

(assert (= (and b!112060 c!20006) b!112062))

(assert (= (and b!112060 (not c!20006)) b!112079))

(assert (= (or b!112062 b!112079) bm!12003))

(assert (= (or b!112062 b!112079) bm!11993))

(assert (= (or b!112062 b!112079) bm!11995))

(assert (= (and b!112083 c!20008) b!112061))

(assert (= (and b!112083 (not c!20008)) b!112075))

(assert (= (and b!112061 c!20005) b!112086))

(assert (= (and b!112061 (not c!20005)) b!112081))

(assert (= (and b!112086 res!55304) b!112088))

(assert (= (and b!112088 res!55309) b!112063))

(assert (= (and b!112081 c!20010) b!112096))

(assert (= (and b!112081 (not c!20010)) b!112067))

(assert (= (and b!112096 res!55307) b!112059))

(assert (= (and b!112059 res!55305) b!112089))

(assert (= (and b!112067 c!20002) b!112092))

(assert (= (and b!112067 (not c!20002)) b!112064))

(assert (= (and b!112092 res!55301) b!112074))

(assert (= (and b!112074 res!55300) b!112065))

(assert (= (or b!112096 b!112092) bm!12010))

(assert (= (or b!112089 b!112065) bm!11987))

(assert (= (or b!112088 bm!12010) bm!12005))

(assert (= (or b!112086 b!112081) bm!11999))

(assert (= (and b!112075 c!20007) b!112068))

(assert (= (and b!112075 (not c!20007)) b!112082))

(assert (= (and b!112082 c!20012) b!112071))

(assert (= (and b!112082 (not c!20012)) b!112080))

(assert (= (and b!112080 c!20011) b!112070))

(assert (= (and b!112080 (not c!20011)) b!112077))

(assert (= (and b!112070 res!55310) b!112076))

(assert (= (and b!112076 res!55306) b!112094))

(assert (= (and b!112077 c!20009) b!112090))

(assert (= (and b!112077 (not c!20009)) b!112095))

(assert (= (and b!112090 res!55298) b!112066))

(assert (= (and b!112066 res!55299) b!112072))

(assert (= (and b!112095 c!20001) b!112093))

(assert (= (and b!112095 (not c!20001)) b!112091))

(assert (= (and b!112093 res!55303) b!112069))

(assert (= (and b!112069 res!55308) b!112084))

(assert (= (or b!112090 b!112093) bm!12007))

(assert (= (or b!112072 b!112084) bm!11988))

(assert (= (or b!112076 bm!12007) bm!12008))

(assert (= (or b!112070 b!112077) bm!12006))

(assert (= (or b!112068 b!112071) bm!11998))

(assert (= (or b!112081 b!112077) bm!12002))

(assert (= (or bm!12005 bm!12008) bm!11994))

(assert (= (or bm!11987 bm!11988) bm!11992))

(assert (= (or b!112086 b!112070) bm!12009))

(assert (= (or bm!11999 bm!12006) bm!12001))

(assert (= (or b!112061 b!112080) bm!12004))

(assert (= (or b!112061 b!112080) bm!11991))

(assert (= (or bm!11993 bm!12004) bm!12000))

(assert (= (or bm!12003 b!112080) bm!11989))

(assert (= (or bm!11995 b!112080) bm!11990))

(assert (= (and d!31865 res!55297) b!112085))

(assert (= (and b!112085 c!20004) b!112087))

(assert (= (and b!112085 (not c!20004)) b!112078))

(assert (= (and b!112087 res!55302) b!112073))

(assert (= (or b!112087 b!112073 b!112078) bm!11997))

(assert (= (or b!112073 b!112078) bm!11996))

(assert (=> bm!12009 m!127411))

(declare-fun m!127741 () Bool)

(assert (=> bm!12009 m!127741))

(declare-fun m!127743 () Bool)

(assert (=> b!112059 m!127743))

(assert (=> b!112080 m!127411))

(declare-fun m!127745 () Bool)

(assert (=> b!112080 m!127745))

(assert (=> b!112080 m!127411))

(declare-fun m!127747 () Bool)

(assert (=> b!112080 m!127747))

(declare-fun m!127749 () Bool)

(assert (=> b!112080 m!127749))

(declare-fun m!127751 () Bool)

(assert (=> b!112080 m!127751))

(declare-fun m!127753 () Bool)

(assert (=> b!112080 m!127753))

(assert (=> bm!12002 m!127411))

(declare-fun m!127755 () Bool)

(assert (=> bm!12002 m!127755))

(assert (=> bm!11998 m!127411))

(declare-fun m!127757 () Bool)

(assert (=> bm!11998 m!127757))

(assert (=> b!112083 m!127411))

(declare-fun m!127759 () Bool)

(assert (=> b!112083 m!127759))

(declare-fun m!127761 () Bool)

(assert (=> b!112069 m!127761))

(declare-fun m!127763 () Bool)

(assert (=> bm!11990 m!127763))

(assert (=> bm!11992 m!127411))

(declare-fun m!127765 () Bool)

(assert (=> bm!11992 m!127765))

(assert (=> bm!11996 m!127463))

(assert (=> bm!11989 m!127583))

(declare-fun m!127767 () Bool)

(assert (=> b!112073 m!127767))

(declare-fun m!127769 () Bool)

(assert (=> b!112074 m!127769))

(assert (=> b!112087 m!127411))

(declare-fun m!127771 () Bool)

(assert (=> b!112087 m!127771))

(declare-fun m!127773 () Bool)

(assert (=> b!112063 m!127773))

(declare-fun m!127775 () Bool)

(assert (=> bm!11994 m!127775))

(declare-fun m!127777 () Bool)

(assert (=> b!112094 m!127777))

(declare-fun m!127779 () Bool)

(assert (=> b!112066 m!127779))

(declare-fun m!127781 () Bool)

(assert (=> b!112079 m!127781))

(declare-fun m!127783 () Bool)

(assert (=> bm!11991 m!127783))

(declare-fun m!127785 () Bool)

(assert (=> bm!11991 m!127785))

(declare-fun m!127787 () Bool)

(assert (=> b!112062 m!127787))

(declare-fun m!127789 () Bool)

(assert (=> bm!11997 m!127789))

(assert (=> bm!12001 m!127411))

(assert (=> bm!12001 m!127759))

(declare-fun m!127791 () Bool)

(assert (=> bm!12000 m!127791))

(declare-fun m!127793 () Bool)

(assert (=> d!31865 m!127793))

(assert (=> d!31865 m!127409))

(assert (=> b!111697 d!31865))

(declare-fun b!112105 () Bool)

(declare-fun e!72890 () Bool)

(declare-fun e!72888 () Bool)

(assert (=> b!112105 (= e!72890 e!72888)))

(declare-fun lt!57937 () (_ BitVec 64))

(assert (=> b!112105 (= lt!57937 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!57939 () Unit!3461)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4385 (_ BitVec 64) (_ BitVec 32)) Unit!3461)

(assert (=> b!112105 (= lt!57939 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) lt!57937 #b00000000000000000000000000000000))))

(assert (=> b!112105 (arrayContainsKey!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) lt!57937 #b00000000000000000000000000000000)))

(declare-fun lt!57938 () Unit!3461)

(assert (=> b!112105 (= lt!57938 lt!57939)))

(declare-fun res!55316 () Bool)

(assert (=> b!112105 (= res!55316 (= (seekEntryOrOpen!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) (_keys!4365 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992)))) (Found!256 #b00000000000000000000000000000000)))))

(assert (=> b!112105 (=> (not res!55316) (not e!72888))))

(declare-fun b!112106 () Bool)

(declare-fun call!12016 () Bool)

(assert (=> b!112106 (= e!72890 call!12016)))

(declare-fun b!112107 () Bool)

(assert (=> b!112107 (= e!72888 call!12016)))

(declare-fun b!112108 () Bool)

(declare-fun e!72889 () Bool)

(assert (=> b!112108 (= e!72889 e!72890)))

(declare-fun c!20015 () Bool)

(assert (=> b!112108 (= c!20015 (validKeyInArray!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!31867 () Bool)

(declare-fun res!55315 () Bool)

(assert (=> d!31867 (=> res!55315 e!72889)))

(assert (=> d!31867 (= res!55315 (bvsge #b00000000000000000000000000000000 (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> d!31867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992)))) e!72889)))

(declare-fun bm!12013 () Bool)

(assert (=> bm!12013 (= call!12016 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4365 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992)))))))

(assert (= (and d!31867 (not res!55315)) b!112108))

(assert (= (and b!112108 c!20015) b!112105))

(assert (= (and b!112108 (not c!20015)) b!112106))

(assert (= (and b!112105 res!55316) b!112107))

(assert (= (or b!112107 b!112106) bm!12013))

(declare-fun m!127795 () Bool)

(assert (=> b!112105 m!127795))

(declare-fun m!127797 () Bool)

(assert (=> b!112105 m!127797))

(declare-fun m!127799 () Bool)

(assert (=> b!112105 m!127799))

(assert (=> b!112105 m!127795))

(declare-fun m!127801 () Bool)

(assert (=> b!112105 m!127801))

(assert (=> b!112108 m!127795))

(assert (=> b!112108 m!127795))

(declare-fun m!127803 () Bool)

(assert (=> b!112108 m!127803))

(declare-fun m!127805 () Bool)

(assert (=> bm!12013 m!127805))

(assert (=> b!111693 d!31867))

(declare-fun d!31869 () Bool)

(declare-fun res!55323 () Bool)

(declare-fun e!72893 () Bool)

(assert (=> d!31869 (=> (not res!55323) (not e!72893))))

(declare-fun simpleValid!77 (LongMapFixedSize!922) Bool)

(assert (=> d!31869 (= res!55323 (simpleValid!77 newMap!16))))

(assert (=> d!31869 (= (valid!436 newMap!16) e!72893)))

(declare-fun b!112115 () Bool)

(declare-fun res!55324 () Bool)

(assert (=> b!112115 (=> (not res!55324) (not e!72893))))

(declare-fun arrayCountValidKeys!0 (array!4385 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!112115 (= res!55324 (= (arrayCountValidKeys!0 (_keys!4365 newMap!16) #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))) (_size!510 newMap!16)))))

(declare-fun b!112116 () Bool)

(declare-fun res!55325 () Bool)

(assert (=> b!112116 (=> (not res!55325) (not e!72893))))

(assert (=> b!112116 (= res!55325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4365 newMap!16) (mask!6825 newMap!16)))))

(declare-fun b!112117 () Bool)

(assert (=> b!112117 (= e!72893 (arrayNoDuplicates!0 (_keys!4365 newMap!16) #b00000000000000000000000000000000 Nil!1611))))

(assert (= (and d!31869 res!55323) b!112115))

(assert (= (and b!112115 res!55324) b!112116))

(assert (= (and b!112116 res!55325) b!112117))

(declare-fun m!127807 () Bool)

(assert (=> d!31869 m!127807))

(declare-fun m!127809 () Bool)

(assert (=> b!112115 m!127809))

(declare-fun m!127811 () Bool)

(assert (=> b!112116 m!127811))

(declare-fun m!127813 () Bool)

(assert (=> b!112117 m!127813))

(assert (=> b!111687 d!31869))

(declare-fun d!31871 () Bool)

(declare-fun c!20018 () Bool)

(assert (=> d!31871 (= c!20018 ((_ is ValueCellFull!1007) (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun e!72896 () V!3249)

(assert (=> d!31871 (= (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) from!355) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!72896)))

(declare-fun b!112122 () Bool)

(declare-fun get!1362 (ValueCell!1007 V!3249) V!3249)

(assert (=> b!112122 (= e!72896 (get!1362 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) from!355) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!112123 () Bool)

(declare-fun get!1363 (ValueCell!1007 V!3249) V!3249)

(assert (=> b!112123 (= e!72896 (get!1363 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) from!355) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!31871 c!20018) b!112122))

(assert (= (and d!31871 (not c!20018)) b!112123))

(assert (=> b!112122 m!127413))

(assert (=> b!112122 m!127415))

(declare-fun m!127815 () Bool)

(assert (=> b!112122 m!127815))

(assert (=> b!112123 m!127413))

(assert (=> b!112123 m!127415))

(declare-fun m!127817 () Bool)

(assert (=> b!112123 m!127817))

(assert (=> b!111691 d!31871))

(declare-fun condMapEmpty!4035 () Bool)

(declare-fun mapDefault!4035 () ValueCell!1007)

(assert (=> mapNonEmpty!4019 (= condMapEmpty!4035 (= mapRest!4020 ((as const (Array (_ BitVec 32) ValueCell!1007)) mapDefault!4035)))))

(declare-fun e!72902 () Bool)

(declare-fun mapRes!4035 () Bool)

(assert (=> mapNonEmpty!4019 (= tp!10054 (and e!72902 mapRes!4035))))

(declare-fun mapNonEmpty!4035 () Bool)

(declare-fun tp!10083 () Bool)

(declare-fun e!72901 () Bool)

(assert (=> mapNonEmpty!4035 (= mapRes!4035 (and tp!10083 e!72901))))

(declare-fun mapValue!4035 () ValueCell!1007)

(declare-fun mapRest!4035 () (Array (_ BitVec 32) ValueCell!1007))

(declare-fun mapKey!4035 () (_ BitVec 32))

(assert (=> mapNonEmpty!4035 (= mapRest!4020 (store mapRest!4035 mapKey!4035 mapValue!4035))))

(declare-fun b!112130 () Bool)

(assert (=> b!112130 (= e!72901 tp_is_empty!2701)))

(declare-fun b!112131 () Bool)

(assert (=> b!112131 (= e!72902 tp_is_empty!2701)))

(declare-fun mapIsEmpty!4035 () Bool)

(assert (=> mapIsEmpty!4035 mapRes!4035))

(assert (= (and mapNonEmpty!4019 condMapEmpty!4035) mapIsEmpty!4035))

(assert (= (and mapNonEmpty!4019 (not condMapEmpty!4035)) mapNonEmpty!4035))

(assert (= (and mapNonEmpty!4035 ((_ is ValueCellFull!1007) mapValue!4035)) b!112130))

(assert (= (and mapNonEmpty!4019 ((_ is ValueCellFull!1007) mapDefault!4035)) b!112131))

(declare-fun m!127819 () Bool)

(assert (=> mapNonEmpty!4035 m!127819))

(declare-fun condMapEmpty!4036 () Bool)

(declare-fun mapDefault!4036 () ValueCell!1007)

(assert (=> mapNonEmpty!4020 (= condMapEmpty!4036 (= mapRest!4019 ((as const (Array (_ BitVec 32) ValueCell!1007)) mapDefault!4036)))))

(declare-fun e!72904 () Bool)

(declare-fun mapRes!4036 () Bool)

(assert (=> mapNonEmpty!4020 (= tp!10056 (and e!72904 mapRes!4036))))

(declare-fun mapNonEmpty!4036 () Bool)

(declare-fun tp!10084 () Bool)

(declare-fun e!72903 () Bool)

(assert (=> mapNonEmpty!4036 (= mapRes!4036 (and tp!10084 e!72903))))

(declare-fun mapRest!4036 () (Array (_ BitVec 32) ValueCell!1007))

(declare-fun mapValue!4036 () ValueCell!1007)

(declare-fun mapKey!4036 () (_ BitVec 32))

(assert (=> mapNonEmpty!4036 (= mapRest!4019 (store mapRest!4036 mapKey!4036 mapValue!4036))))

(declare-fun b!112132 () Bool)

(assert (=> b!112132 (= e!72903 tp_is_empty!2701)))

(declare-fun b!112133 () Bool)

(assert (=> b!112133 (= e!72904 tp_is_empty!2701)))

(declare-fun mapIsEmpty!4036 () Bool)

(assert (=> mapIsEmpty!4036 mapRes!4036))

(assert (= (and mapNonEmpty!4020 condMapEmpty!4036) mapIsEmpty!4036))

(assert (= (and mapNonEmpty!4020 (not condMapEmpty!4036)) mapNonEmpty!4036))

(assert (= (and mapNonEmpty!4036 ((_ is ValueCellFull!1007) mapValue!4036)) b!112132))

(assert (= (and mapNonEmpty!4020 ((_ is ValueCellFull!1007) mapDefault!4036)) b!112133))

(declare-fun m!127821 () Bool)

(assert (=> mapNonEmpty!4036 m!127821))

(declare-fun b_lambda!5025 () Bool)

(assert (= b_lambda!5023 (or (and b!111690 b_free!2569) (and b!111703 b_free!2571 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))))) b_lambda!5025)))

(declare-fun b_lambda!5027 () Bool)

(assert (= b_lambda!5021 (or (and b!111690 b_free!2569) (and b!111703 b_free!2571 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))))) b_lambda!5027)))

(declare-fun b_lambda!5029 () Bool)

(assert (= b_lambda!5019 (or (and b!111690 b_free!2569) (and b!111703 b_free!2571 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))))) b_lambda!5029)))

(check-sat tp_is_empty!2701 (not b!111950) (not d!31829) (not b!111889) (not b!111879) (not bm!11989) (not bm!11991) (not bm!11930) (not b!111953) (not b!111980) (not b!111951) (not b!112116) (not d!31849) (not b!111970) (not bm!11992) (not b_lambda!5025) (not bm!11938) (not b!112108) (not d!31825) (not bm!12001) (not mapNonEmpty!4036) (not b!112105) (not b!111904) (not b!112080) (not b!111968) (not b!111967) (not b!111924) (not b!112122) (not bm!12009) b_and!6893 (not b!111882) b_and!6895 (not mapNonEmpty!4035) (not b!111881) (not b!111959) (not d!31855) (not d!31863) (not bm!11994) (not b!112087) (not b!112073) (not d!31853) (not b_lambda!5027) (not b!112117) (not d!31865) (not bm!11932) (not b!111969) (not bm!11928) (not b!111883) (not b!112083) (not b!111893) (not b!112123) (not b!111923) (not b!112062) (not bm!12000) (not b_lambda!5029) (not bm!11997) (not bm!11935) (not b_next!2571) (not d!31861) (not b!111972) (not b!111966) (not b!111956) (not b!112079) (not d!31833) (not b!111909) (not d!31837) (not b!111884) (not b!111955) (not d!31851) (not bm!12013) (not bm!11996) (not d!31827) (not b!111952) (not b!111982) (not bm!12002) (not b!112115) (not b!111960) (not b!111897) (not d!31859) (not b_next!2569) (not bm!11990) (not d!31831) (not bm!11931) (not bm!11998) (not d!31869) (not b!111921) (not b!111973) (not b_lambda!5017) (not b!111971))
(check-sat b_and!6893 b_and!6895 (not b_next!2569) (not b_next!2571))
(get-model)

(declare-fun d!31873 () Bool)

(assert (=> d!31873 (= (validKeyInArray!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!111952 d!31873))

(assert (=> bm!11996 d!31825))

(declare-fun d!31875 () Bool)

(declare-fun e!72905 () Bool)

(assert (=> d!31875 e!72905))

(declare-fun res!55327 () Bool)

(assert (=> d!31875 (=> (not res!55327) (not e!72905))))

(declare-fun lt!57940 () ListLongMap!1553)

(assert (=> d!31875 (= res!55327 (contains!829 lt!57940 (_1!1210 (ite (or c!19953 c!19950) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun lt!57941 () List!1613)

(assert (=> d!31875 (= lt!57940 (ListLongMap!1554 lt!57941))))

(declare-fun lt!57942 () Unit!3461)

(declare-fun lt!57943 () Unit!3461)

(assert (=> d!31875 (= lt!57942 lt!57943)))

(assert (=> d!31875 (= (getValueByKey!160 lt!57941 (_1!1210 (ite (or c!19953 c!19950) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992))))))) (Some!165 (_2!1210 (ite (or c!19953 c!19950) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992))))))))))

(assert (=> d!31875 (= lt!57943 (lemmaContainsTupThenGetReturnValue!76 lt!57941 (_1!1210 (ite (or c!19953 c!19950) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))) (_2!1210 (ite (or c!19953 c!19950) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992))))))))))

(assert (=> d!31875 (= lt!57941 (insertStrictlySorted!79 (toList!792 (ite c!19953 call!11933 (ite c!19950 call!11930 call!11935))) (_1!1210 (ite (or c!19953 c!19950) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))) (_2!1210 (ite (or c!19953 c!19950) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992))))))))))

(assert (=> d!31875 (= (+!147 (ite c!19953 call!11933 (ite c!19950 call!11930 call!11935)) (ite (or c!19953 c!19950) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))) lt!57940)))

(declare-fun b!112134 () Bool)

(declare-fun res!55326 () Bool)

(assert (=> b!112134 (=> (not res!55326) (not e!72905))))

(assert (=> b!112134 (= res!55326 (= (getValueByKey!160 (toList!792 lt!57940) (_1!1210 (ite (or c!19953 c!19950) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992))))))) (Some!165 (_2!1210 (ite (or c!19953 c!19950) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))))))

(declare-fun b!112135 () Bool)

(assert (=> b!112135 (= e!72905 (contains!833 (toList!792 lt!57940) (ite (or c!19953 c!19950) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (= (and d!31875 res!55327) b!112134))

(assert (= (and b!112134 res!55326) b!112135))

(declare-fun m!127823 () Bool)

(assert (=> d!31875 m!127823))

(declare-fun m!127825 () Bool)

(assert (=> d!31875 m!127825))

(declare-fun m!127827 () Bool)

(assert (=> d!31875 m!127827))

(declare-fun m!127829 () Bool)

(assert (=> d!31875 m!127829))

(declare-fun m!127831 () Bool)

(assert (=> b!112134 m!127831))

(declare-fun m!127833 () Bool)

(assert (=> b!112135 m!127833))

(assert (=> bm!11930 d!31875))

(declare-fun d!31877 () Bool)

(declare-fun e!72906 () Bool)

(assert (=> d!31877 e!72906))

(declare-fun res!55329 () Bool)

(assert (=> d!31877 (=> (not res!55329) (not e!72906))))

(declare-fun lt!57944 () ListLongMap!1553)

(assert (=> d!31877 (= res!55329 (contains!829 lt!57944 (_1!1210 (tuple2!2399 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun lt!57945 () List!1613)

(assert (=> d!31877 (= lt!57944 (ListLongMap!1554 lt!57945))))

(declare-fun lt!57946 () Unit!3461)

(declare-fun lt!57947 () Unit!3461)

(assert (=> d!31877 (= lt!57946 lt!57947)))

(assert (=> d!31877 (= (getValueByKey!160 lt!57945 (_1!1210 (tuple2!2399 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))) (Some!165 (_2!1210 (tuple2!2399 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31877 (= lt!57947 (lemmaContainsTupThenGetReturnValue!76 lt!57945 (_1!1210 (tuple2!2399 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) (_2!1210 (tuple2!2399 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31877 (= lt!57945 (insertStrictlySorted!79 (toList!792 lt!57780) (_1!1210 (tuple2!2399 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) (_2!1210 (tuple2!2399 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31877 (= (+!147 lt!57780 (tuple2!2399 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57944)))

(declare-fun b!112136 () Bool)

(declare-fun res!55328 () Bool)

(assert (=> b!112136 (=> (not res!55328) (not e!72906))))

(assert (=> b!112136 (= res!55328 (= (getValueByKey!160 (toList!792 lt!57944) (_1!1210 (tuple2!2399 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))) (Some!165 (_2!1210 (tuple2!2399 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun b!112137 () Bool)

(assert (=> b!112137 (= e!72906 (contains!833 (toList!792 lt!57944) (tuple2!2399 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!31877 res!55329) b!112136))

(assert (= (and b!112136 res!55328) b!112137))

(declare-fun m!127835 () Bool)

(assert (=> d!31877 m!127835))

(declare-fun m!127837 () Bool)

(assert (=> d!31877 m!127837))

(declare-fun m!127839 () Bool)

(assert (=> d!31877 m!127839))

(declare-fun m!127841 () Bool)

(assert (=> d!31877 m!127841))

(declare-fun m!127843 () Bool)

(assert (=> b!112136 m!127843))

(declare-fun m!127845 () Bool)

(assert (=> b!112137 m!127845))

(assert (=> b!111893 d!31877))

(declare-fun d!31879 () Bool)

(declare-fun get!1364 (Option!166) V!3249)

(assert (=> d!31879 (= (apply!101 (+!147 lt!57780 (tuple2!2399 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57772) (get!1364 (getValueByKey!160 (toList!792 (+!147 lt!57780 (tuple2!2399 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))) lt!57772)))))

(declare-fun bs!4619 () Bool)

(assert (= bs!4619 d!31879))

(declare-fun m!127847 () Bool)

(assert (=> bs!4619 m!127847))

(assert (=> bs!4619 m!127847))

(declare-fun m!127849 () Bool)

(assert (=> bs!4619 m!127849))

(assert (=> b!111893 d!31879))

(declare-fun d!31881 () Bool)

(assert (=> d!31881 (= (apply!101 lt!57777 lt!57765) (get!1364 (getValueByKey!160 (toList!792 lt!57777) lt!57765)))))

(declare-fun bs!4620 () Bool)

(assert (= bs!4620 d!31881))

(declare-fun m!127851 () Bool)

(assert (=> bs!4620 m!127851))

(assert (=> bs!4620 m!127851))

(declare-fun m!127853 () Bool)

(assert (=> bs!4620 m!127853))

(assert (=> b!111893 d!31881))

(declare-fun d!31883 () Bool)

(assert (=> d!31883 (= (apply!101 lt!57780 lt!57772) (get!1364 (getValueByKey!160 (toList!792 lt!57780) lt!57772)))))

(declare-fun bs!4621 () Bool)

(assert (= bs!4621 d!31883))

(declare-fun m!127855 () Bool)

(assert (=> bs!4621 m!127855))

(assert (=> bs!4621 m!127855))

(declare-fun m!127857 () Bool)

(assert (=> bs!4621 m!127857))

(assert (=> b!111893 d!31883))

(declare-fun d!31885 () Bool)

(declare-fun e!72907 () Bool)

(assert (=> d!31885 e!72907))

(declare-fun res!55331 () Bool)

(assert (=> d!31885 (=> (not res!55331) (not e!72907))))

(declare-fun lt!57948 () ListLongMap!1553)

(assert (=> d!31885 (= res!55331 (contains!829 lt!57948 (_1!1210 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun lt!57949 () List!1613)

(assert (=> d!31885 (= lt!57948 (ListLongMap!1554 lt!57949))))

(declare-fun lt!57950 () Unit!3461)

(declare-fun lt!57951 () Unit!3461)

(assert (=> d!31885 (= lt!57950 lt!57951)))

(assert (=> d!31885 (= (getValueByKey!160 lt!57949 (_1!1210 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))) (Some!165 (_2!1210 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31885 (= lt!57951 (lemmaContainsTupThenGetReturnValue!76 lt!57949 (_1!1210 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) (_2!1210 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31885 (= lt!57949 (insertStrictlySorted!79 (toList!792 lt!57759) (_1!1210 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) (_2!1210 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31885 (= (+!147 lt!57759 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57948)))

(declare-fun b!112138 () Bool)

(declare-fun res!55330 () Bool)

(assert (=> b!112138 (=> (not res!55330) (not e!72907))))

(assert (=> b!112138 (= res!55330 (= (getValueByKey!160 (toList!792 lt!57948) (_1!1210 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))) (Some!165 (_2!1210 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun b!112139 () Bool)

(assert (=> b!112139 (= e!72907 (contains!833 (toList!792 lt!57948) (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!31885 res!55331) b!112138))

(assert (= (and b!112138 res!55330) b!112139))

(declare-fun m!127859 () Bool)

(assert (=> d!31885 m!127859))

(declare-fun m!127861 () Bool)

(assert (=> d!31885 m!127861))

(declare-fun m!127863 () Bool)

(assert (=> d!31885 m!127863))

(declare-fun m!127865 () Bool)

(assert (=> d!31885 m!127865))

(declare-fun m!127867 () Bool)

(assert (=> b!112138 m!127867))

(declare-fun m!127869 () Bool)

(assert (=> b!112139 m!127869))

(assert (=> b!111893 d!31885))

(declare-fun d!31887 () Bool)

(declare-fun e!72908 () Bool)

(assert (=> d!31887 e!72908))

(declare-fun res!55333 () Bool)

(assert (=> d!31887 (=> (not res!55333) (not e!72908))))

(declare-fun lt!57952 () ListLongMap!1553)

(assert (=> d!31887 (= res!55333 (contains!829 lt!57952 (_1!1210 (tuple2!2399 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun lt!57953 () List!1613)

(assert (=> d!31887 (= lt!57952 (ListLongMap!1554 lt!57953))))

(declare-fun lt!57954 () Unit!3461)

(declare-fun lt!57955 () Unit!3461)

(assert (=> d!31887 (= lt!57954 lt!57955)))

(assert (=> d!31887 (= (getValueByKey!160 lt!57953 (_1!1210 (tuple2!2399 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))) (Some!165 (_2!1210 (tuple2!2399 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31887 (= lt!57955 (lemmaContainsTupThenGetReturnValue!76 lt!57953 (_1!1210 (tuple2!2399 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992))))) (_2!1210 (tuple2!2399 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31887 (= lt!57953 (insertStrictlySorted!79 (toList!792 lt!57775) (_1!1210 (tuple2!2399 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992))))) (_2!1210 (tuple2!2399 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31887 (= (+!147 lt!57775 (tuple2!2399 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57952)))

(declare-fun b!112140 () Bool)

(declare-fun res!55332 () Bool)

(assert (=> b!112140 (=> (not res!55332) (not e!72908))))

(assert (=> b!112140 (= res!55332 (= (getValueByKey!160 (toList!792 lt!57952) (_1!1210 (tuple2!2399 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))) (Some!165 (_2!1210 (tuple2!2399 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun b!112141 () Bool)

(assert (=> b!112141 (= e!72908 (contains!833 (toList!792 lt!57952) (tuple2!2399 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!31887 res!55333) b!112140))

(assert (= (and b!112140 res!55332) b!112141))

(declare-fun m!127871 () Bool)

(assert (=> d!31887 m!127871))

(declare-fun m!127873 () Bool)

(assert (=> d!31887 m!127873))

(declare-fun m!127875 () Bool)

(assert (=> d!31887 m!127875))

(declare-fun m!127877 () Bool)

(assert (=> d!31887 m!127877))

(declare-fun m!127879 () Bool)

(assert (=> b!112140 m!127879))

(declare-fun m!127881 () Bool)

(assert (=> b!112141 m!127881))

(assert (=> b!111893 d!31887))

(assert (=> b!111893 d!31849))

(declare-fun d!31889 () Bool)

(assert (=> d!31889 (= (apply!101 (+!147 lt!57777 (tuple2!2399 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57765) (apply!101 lt!57777 lt!57765))))

(declare-fun lt!57958 () Unit!3461)

(declare-fun choose!706 (ListLongMap!1553 (_ BitVec 64) V!3249 (_ BitVec 64)) Unit!3461)

(assert (=> d!31889 (= lt!57958 (choose!706 lt!57777 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992))) lt!57765))))

(declare-fun e!72911 () Bool)

(assert (=> d!31889 e!72911))

(declare-fun res!55336 () Bool)

(assert (=> d!31889 (=> (not res!55336) (not e!72911))))

(assert (=> d!31889 (= res!55336 (contains!829 lt!57777 lt!57765))))

(assert (=> d!31889 (= (addApplyDifferent!77 lt!57777 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992))) lt!57765) lt!57958)))

(declare-fun b!112145 () Bool)

(assert (=> b!112145 (= e!72911 (not (= lt!57765 lt!57761)))))

(assert (= (and d!31889 res!55336) b!112145))

(assert (=> d!31889 m!127603))

(assert (=> d!31889 m!127631))

(declare-fun m!127883 () Bool)

(assert (=> d!31889 m!127883))

(assert (=> d!31889 m!127605))

(assert (=> d!31889 m!127603))

(declare-fun m!127885 () Bool)

(assert (=> d!31889 m!127885))

(assert (=> b!111893 d!31889))

(declare-fun d!31891 () Bool)

(assert (=> d!31891 (= (apply!101 (+!147 lt!57775 (tuple2!2399 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57770) (apply!101 lt!57775 lt!57770))))

(declare-fun lt!57959 () Unit!3461)

(assert (=> d!31891 (= lt!57959 (choose!706 lt!57775 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992))) lt!57770))))

(declare-fun e!72912 () Bool)

(assert (=> d!31891 e!72912))

(declare-fun res!55337 () Bool)

(assert (=> d!31891 (=> (not res!55337) (not e!72912))))

(assert (=> d!31891 (= res!55337 (contains!829 lt!57775 lt!57770))))

(assert (=> d!31891 (= (addApplyDifferent!77 lt!57775 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992))) lt!57770) lt!57959)))

(declare-fun b!112146 () Bool)

(assert (=> b!112146 (= e!72912 (not (= lt!57770 lt!57776)))))

(assert (= (and d!31891 res!55337) b!112146))

(assert (=> d!31891 m!127617))

(assert (=> d!31891 m!127619))

(declare-fun m!127887 () Bool)

(assert (=> d!31891 m!127887))

(assert (=> d!31891 m!127623))

(assert (=> d!31891 m!127617))

(declare-fun m!127889 () Bool)

(assert (=> d!31891 m!127889))

(assert (=> b!111893 d!31891))

(declare-fun d!31893 () Bool)

(assert (=> d!31893 (= (apply!101 (+!147 lt!57777 (tuple2!2399 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57765) (get!1364 (getValueByKey!160 (toList!792 (+!147 lt!57777 (tuple2!2399 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))) lt!57765)))))

(declare-fun bs!4622 () Bool)

(assert (= bs!4622 d!31893))

(declare-fun m!127891 () Bool)

(assert (=> bs!4622 m!127891))

(assert (=> bs!4622 m!127891))

(declare-fun m!127893 () Bool)

(assert (=> bs!4622 m!127893))

(assert (=> b!111893 d!31893))

(declare-fun d!31895 () Bool)

(declare-fun e!72914 () Bool)

(assert (=> d!31895 e!72914))

(declare-fun res!55338 () Bool)

(assert (=> d!31895 (=> res!55338 e!72914)))

(declare-fun lt!57961 () Bool)

(assert (=> d!31895 (= res!55338 (not lt!57961))))

(declare-fun lt!57960 () Bool)

(assert (=> d!31895 (= lt!57961 lt!57960)))

(declare-fun lt!57962 () Unit!3461)

(declare-fun e!72913 () Unit!3461)

(assert (=> d!31895 (= lt!57962 e!72913)))

(declare-fun c!20019 () Bool)

(assert (=> d!31895 (= c!20019 lt!57960)))

(assert (=> d!31895 (= lt!57960 (containsKey!163 (toList!792 (+!147 lt!57759 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))) lt!57762))))

(assert (=> d!31895 (= (contains!829 (+!147 lt!57759 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57762) lt!57961)))

(declare-fun b!112147 () Bool)

(declare-fun lt!57963 () Unit!3461)

(assert (=> b!112147 (= e!72913 lt!57963)))

(assert (=> b!112147 (= lt!57963 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 (+!147 lt!57759 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))) lt!57762))))

(assert (=> b!112147 (isDefined!112 (getValueByKey!160 (toList!792 (+!147 lt!57759 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))) lt!57762))))

(declare-fun b!112148 () Bool)

(declare-fun Unit!3477 () Unit!3461)

(assert (=> b!112148 (= e!72913 Unit!3477)))

(declare-fun b!112149 () Bool)

(assert (=> b!112149 (= e!72914 (isDefined!112 (getValueByKey!160 (toList!792 (+!147 lt!57759 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))) lt!57762)))))

(assert (= (and d!31895 c!20019) b!112147))

(assert (= (and d!31895 (not c!20019)) b!112148))

(assert (= (and d!31895 (not res!55338)) b!112149))

(declare-fun m!127895 () Bool)

(assert (=> d!31895 m!127895))

(declare-fun m!127897 () Bool)

(assert (=> b!112147 m!127897))

(declare-fun m!127899 () Bool)

(assert (=> b!112147 m!127899))

(assert (=> b!112147 m!127899))

(declare-fun m!127901 () Bool)

(assert (=> b!112147 m!127901))

(assert (=> b!112149 m!127899))

(assert (=> b!112149 m!127899))

(assert (=> b!112149 m!127901))

(assert (=> b!111893 d!31895))

(declare-fun d!31897 () Bool)

(assert (=> d!31897 (= (apply!101 (+!147 lt!57780 (tuple2!2399 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57772) (apply!101 lt!57780 lt!57772))))

(declare-fun lt!57964 () Unit!3461)

(assert (=> d!31897 (= lt!57964 (choose!706 lt!57780 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) lt!57772))))

(declare-fun e!72915 () Bool)

(assert (=> d!31897 e!72915))

(declare-fun res!55339 () Bool)

(assert (=> d!31897 (=> (not res!55339) (not e!72915))))

(assert (=> d!31897 (= res!55339 (contains!829 lt!57780 lt!57772))))

(assert (=> d!31897 (= (addApplyDifferent!77 lt!57780 lt!57773 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) lt!57772) lt!57964)))

(declare-fun b!112150 () Bool)

(assert (=> b!112150 (= e!72915 (not (= lt!57772 lt!57773)))))

(assert (= (and d!31897 res!55339) b!112150))

(assert (=> d!31897 m!127615))

(assert (=> d!31897 m!127621))

(declare-fun m!127903 () Bool)

(assert (=> d!31897 m!127903))

(assert (=> d!31897 m!127607))

(assert (=> d!31897 m!127615))

(declare-fun m!127905 () Bool)

(assert (=> d!31897 m!127905))

(assert (=> b!111893 d!31897))

(declare-fun d!31899 () Bool)

(assert (=> d!31899 (= (apply!101 lt!57775 lt!57770) (get!1364 (getValueByKey!160 (toList!792 lt!57775) lt!57770)))))

(declare-fun bs!4623 () Bool)

(assert (= bs!4623 d!31899))

(declare-fun m!127907 () Bool)

(assert (=> bs!4623 m!127907))

(assert (=> bs!4623 m!127907))

(declare-fun m!127909 () Bool)

(assert (=> bs!4623 m!127909))

(assert (=> b!111893 d!31899))

(declare-fun d!31901 () Bool)

(assert (=> d!31901 (contains!829 (+!147 lt!57759 (tuple2!2399 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57762)))

(declare-fun lt!57967 () Unit!3461)

(declare-fun choose!707 (ListLongMap!1553 (_ BitVec 64) V!3249 (_ BitVec 64)) Unit!3461)

(assert (=> d!31901 (= lt!57967 (choose!707 lt!57759 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) lt!57762))))

(assert (=> d!31901 (contains!829 lt!57759 lt!57762)))

(assert (=> d!31901 (= (addStillContains!77 lt!57759 lt!57769 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) lt!57762) lt!57967)))

(declare-fun bs!4624 () Bool)

(assert (= bs!4624 d!31901))

(assert (=> bs!4624 m!127609))

(assert (=> bs!4624 m!127609))

(assert (=> bs!4624 m!127611))

(declare-fun m!127911 () Bool)

(assert (=> bs!4624 m!127911))

(declare-fun m!127913 () Bool)

(assert (=> bs!4624 m!127913))

(assert (=> b!111893 d!31901))

(declare-fun d!31903 () Bool)

(declare-fun e!72916 () Bool)

(assert (=> d!31903 e!72916))

(declare-fun res!55341 () Bool)

(assert (=> d!31903 (=> (not res!55341) (not e!72916))))

(declare-fun lt!57968 () ListLongMap!1553)

(assert (=> d!31903 (= res!55341 (contains!829 lt!57968 (_1!1210 (tuple2!2399 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun lt!57969 () List!1613)

(assert (=> d!31903 (= lt!57968 (ListLongMap!1554 lt!57969))))

(declare-fun lt!57970 () Unit!3461)

(declare-fun lt!57971 () Unit!3461)

(assert (=> d!31903 (= lt!57970 lt!57971)))

(assert (=> d!31903 (= (getValueByKey!160 lt!57969 (_1!1210 (tuple2!2399 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))) (Some!165 (_2!1210 (tuple2!2399 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31903 (= lt!57971 (lemmaContainsTupThenGetReturnValue!76 lt!57969 (_1!1210 (tuple2!2399 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992))))) (_2!1210 (tuple2!2399 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31903 (= lt!57969 (insertStrictlySorted!79 (toList!792 lt!57777) (_1!1210 (tuple2!2399 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992))))) (_2!1210 (tuple2!2399 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31903 (= (+!147 lt!57777 (tuple2!2399 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57968)))

(declare-fun b!112152 () Bool)

(declare-fun res!55340 () Bool)

(assert (=> b!112152 (=> (not res!55340) (not e!72916))))

(assert (=> b!112152 (= res!55340 (= (getValueByKey!160 (toList!792 lt!57968) (_1!1210 (tuple2!2399 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))) (Some!165 (_2!1210 (tuple2!2399 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun b!112153 () Bool)

(assert (=> b!112153 (= e!72916 (contains!833 (toList!792 lt!57968) (tuple2!2399 lt!57761 (minValue!2516 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!31903 res!55341) b!112152))

(assert (= (and b!112152 res!55340) b!112153))

(declare-fun m!127915 () Bool)

(assert (=> d!31903 m!127915))

(declare-fun m!127917 () Bool)

(assert (=> d!31903 m!127917))

(declare-fun m!127919 () Bool)

(assert (=> d!31903 m!127919))

(declare-fun m!127921 () Bool)

(assert (=> d!31903 m!127921))

(declare-fun m!127923 () Bool)

(assert (=> b!112152 m!127923))

(declare-fun m!127925 () Bool)

(assert (=> b!112153 m!127925))

(assert (=> b!111893 d!31903))

(declare-fun d!31905 () Bool)

(assert (=> d!31905 (= (apply!101 (+!147 lt!57775 (tuple2!2399 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!57770) (get!1364 (getValueByKey!160 (toList!792 (+!147 lt!57775 (tuple2!2399 lt!57776 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))) lt!57770)))))

(declare-fun bs!4625 () Bool)

(assert (= bs!4625 d!31905))

(declare-fun m!127927 () Bool)

(assert (=> bs!4625 m!127927))

(assert (=> bs!4625 m!127927))

(declare-fun m!127929 () Bool)

(assert (=> bs!4625 m!127929))

(assert (=> b!111893 d!31905))

(declare-fun d!31907 () Bool)

(declare-fun res!55342 () Bool)

(declare-fun e!72917 () Bool)

(assert (=> d!31907 (=> res!55342 e!72917)))

(assert (=> d!31907 (= res!55342 (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> d!31907 (= (arrayContainsKey!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!72917)))

(declare-fun b!112154 () Bool)

(declare-fun e!72918 () Bool)

(assert (=> b!112154 (= e!72917 e!72918)))

(declare-fun res!55343 () Bool)

(assert (=> b!112154 (=> (not res!55343) (not e!72918))))

(assert (=> b!112154 (= res!55343 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!112155 () Bool)

(assert (=> b!112155 (= e!72918 (arrayContainsKey!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!31907 (not res!55342)) b!112154))

(assert (= (and b!112154 res!55343) b!112155))

(declare-fun m!127931 () Bool)

(assert (=> d!31907 m!127931))

(assert (=> b!112155 m!127411))

(declare-fun m!127933 () Bool)

(assert (=> b!112155 m!127933))

(assert (=> b!111904 d!31907))

(declare-fun b!112164 () Bool)

(declare-fun e!72923 () Option!166)

(assert (=> b!112164 (= e!72923 (Some!165 (_2!1210 (h!2209 (toList!792 lt!57831)))))))

(declare-fun b!112167 () Bool)

(declare-fun e!72924 () Option!166)

(assert (=> b!112167 (= e!72924 None!164)))

(declare-fun b!112165 () Bool)

(assert (=> b!112165 (= e!72923 e!72924)))

(declare-fun c!20025 () Bool)

(assert (=> b!112165 (= c!20025 (and ((_ is Cons!1609) (toList!792 lt!57831)) (not (= (_1!1210 (h!2209 (toList!792 lt!57831))) (_1!1210 lt!57633)))))))

(declare-fun d!31909 () Bool)

(declare-fun c!20024 () Bool)

(assert (=> d!31909 (= c!20024 (and ((_ is Cons!1609) (toList!792 lt!57831)) (= (_1!1210 (h!2209 (toList!792 lt!57831))) (_1!1210 lt!57633))))))

(assert (=> d!31909 (= (getValueByKey!160 (toList!792 lt!57831) (_1!1210 lt!57633)) e!72923)))

(declare-fun b!112166 () Bool)

(assert (=> b!112166 (= e!72924 (getValueByKey!160 (t!5763 (toList!792 lt!57831)) (_1!1210 lt!57633)))))

(assert (= (and d!31909 c!20024) b!112164))

(assert (= (and d!31909 (not c!20024)) b!112165))

(assert (= (and b!112165 c!20025) b!112166))

(assert (= (and b!112165 (not c!20025)) b!112167))

(declare-fun m!127935 () Bool)

(assert (=> b!112166 m!127935))

(assert (=> b!111972 d!31909))

(declare-fun bm!12014 () Bool)

(declare-fun call!12017 () ListLongMap!1553)

(assert (=> bm!12014 (= call!12017 (getCurrentListMapNoExtraKeys!114 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!112169 () Bool)

(declare-fun e!72926 () ListLongMap!1553)

(declare-fun e!72928 () ListLongMap!1553)

(assert (=> b!112169 (= e!72926 e!72928)))

(declare-fun c!20027 () Bool)

(assert (=> b!112169 (= c!20027 (validKeyInArray!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!112170 () Bool)

(declare-fun e!72925 () Bool)

(assert (=> b!112170 (= e!72925 (validKeyInArray!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!112170 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!112171 () Bool)

(declare-fun lt!57974 () Unit!3461)

(declare-fun lt!57977 () Unit!3461)

(assert (=> b!112171 (= lt!57974 lt!57977)))

(declare-fun lt!57973 () (_ BitVec 64))

(declare-fun lt!57976 () (_ BitVec 64))

(declare-fun lt!57972 () V!3249)

(declare-fun lt!57978 () ListLongMap!1553)

(assert (=> b!112171 (not (contains!829 (+!147 lt!57978 (tuple2!2399 lt!57973 lt!57972)) lt!57976))))

(assert (=> b!112171 (= lt!57977 (addStillNotContains!51 lt!57978 lt!57973 lt!57972 lt!57976))))

(assert (=> b!112171 (= lt!57976 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!112171 (= lt!57972 (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112171 (= lt!57973 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!112171 (= lt!57978 call!12017)))

(assert (=> b!112171 (= e!72928 (+!147 call!12017 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!112172 () Bool)

(declare-fun e!72927 () Bool)

(declare-fun e!72929 () Bool)

(assert (=> b!112172 (= e!72927 e!72929)))

(declare-fun c!20026 () Bool)

(assert (=> b!112172 (= c!20026 e!72925)))

(declare-fun res!55344 () Bool)

(assert (=> b!112172 (=> (not res!55344) (not e!72925))))

(assert (=> b!112172 (= res!55344 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!112173 () Bool)

(declare-fun e!72931 () Bool)

(declare-fun lt!57975 () ListLongMap!1553)

(assert (=> b!112173 (= e!72931 (isEmpty!385 lt!57975))))

(declare-fun b!112168 () Bool)

(assert (=> b!112168 (= e!72931 (= lt!57975 (getCurrentListMapNoExtraKeys!114 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun d!31911 () Bool)

(assert (=> d!31911 e!72927))

(declare-fun res!55345 () Bool)

(assert (=> d!31911 (=> (not res!55345) (not e!72927))))

(assert (=> d!31911 (= res!55345 (not (contains!829 lt!57975 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31911 (= lt!57975 e!72926)))

(declare-fun c!20028 () Bool)

(assert (=> d!31911 (= c!20028 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> d!31911 (validMask!0 (mask!6825 (v!2946 (underlying!373 thiss!992))))))

(assert (=> d!31911 (= (getCurrentListMapNoExtraKeys!114 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))) lt!57975)))

(declare-fun b!112174 () Bool)

(declare-fun e!72930 () Bool)

(assert (=> b!112174 (= e!72929 e!72930)))

(assert (=> b!112174 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun res!55347 () Bool)

(assert (=> b!112174 (= res!55347 (contains!829 lt!57975 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!112174 (=> (not res!55347) (not e!72930))))

(declare-fun b!112175 () Bool)

(assert (=> b!112175 (= e!72929 e!72931)))

(declare-fun c!20029 () Bool)

(assert (=> b!112175 (= c!20029 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!112176 () Bool)

(assert (=> b!112176 (= e!72928 call!12017)))

(declare-fun b!112177 () Bool)

(declare-fun res!55346 () Bool)

(assert (=> b!112177 (=> (not res!55346) (not e!72927))))

(assert (=> b!112177 (= res!55346 (not (contains!829 lt!57975 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!112178 () Bool)

(assert (=> b!112178 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> b!112178 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2337 (_values!2630 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> b!112178 (= e!72930 (= (apply!101 lt!57975 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!112179 () Bool)

(assert (=> b!112179 (= e!72926 (ListLongMap!1554 Nil!1610))))

(assert (= (and d!31911 c!20028) b!112179))

(assert (= (and d!31911 (not c!20028)) b!112169))

(assert (= (and b!112169 c!20027) b!112171))

(assert (= (and b!112169 (not c!20027)) b!112176))

(assert (= (or b!112171 b!112176) bm!12014))

(assert (= (and d!31911 res!55345) b!112177))

(assert (= (and b!112177 res!55346) b!112172))

(assert (= (and b!112172 res!55344) b!112170))

(assert (= (and b!112172 c!20026) b!112174))

(assert (= (and b!112172 (not c!20026)) b!112175))

(assert (= (and b!112174 res!55347) b!112178))

(assert (= (and b!112175 c!20029) b!112168))

(assert (= (and b!112175 (not c!20029)) b!112173))

(declare-fun b_lambda!5031 () Bool)

(assert (=> (not b_lambda!5031) (not b!112171)))

(assert (=> b!112171 t!5760))

(declare-fun b_and!6897 () Bool)

(assert (= b_and!6893 (and (=> t!5760 result!3541) b_and!6897)))

(assert (=> b!112171 t!5762))

(declare-fun b_and!6899 () Bool)

(assert (= b_and!6895 (and (=> t!5762 result!3545) b_and!6899)))

(declare-fun b_lambda!5033 () Bool)

(assert (=> (not b_lambda!5033) (not b!112178)))

(assert (=> b!112178 t!5760))

(declare-fun b_and!6901 () Bool)

(assert (= b_and!6897 (and (=> t!5760 result!3541) b_and!6901)))

(assert (=> b!112178 t!5762))

(declare-fun b_and!6903 () Bool)

(assert (= b_and!6899 (and (=> t!5762 result!3545) b_and!6903)))

(assert (=> b!112171 m!127415))

(declare-fun m!127937 () Bool)

(assert (=> b!112171 m!127937))

(declare-fun m!127939 () Bool)

(assert (=> b!112171 m!127939))

(declare-fun m!127941 () Bool)

(assert (=> b!112171 m!127941))

(declare-fun m!127943 () Bool)

(assert (=> b!112171 m!127943))

(declare-fun m!127945 () Bool)

(assert (=> b!112171 m!127945))

(assert (=> b!112171 m!127937))

(assert (=> b!112171 m!127415))

(declare-fun m!127947 () Bool)

(assert (=> b!112171 m!127947))

(assert (=> b!112171 m!127941))

(assert (=> b!112171 m!127931))

(assert (=> b!112169 m!127931))

(assert (=> b!112169 m!127931))

(declare-fun m!127949 () Bool)

(assert (=> b!112169 m!127949))

(declare-fun m!127951 () Bool)

(assert (=> d!31911 m!127951))

(assert (=> d!31911 m!127421))

(assert (=> b!112170 m!127931))

(assert (=> b!112170 m!127931))

(assert (=> b!112170 m!127949))

(declare-fun m!127953 () Bool)

(assert (=> b!112177 m!127953))

(assert (=> b!112178 m!127415))

(assert (=> b!112178 m!127937))

(assert (=> b!112178 m!127931))

(declare-fun m!127955 () Bool)

(assert (=> b!112178 m!127955))

(assert (=> b!112178 m!127937))

(assert (=> b!112178 m!127415))

(assert (=> b!112178 m!127947))

(assert (=> b!112178 m!127931))

(declare-fun m!127957 () Bool)

(assert (=> b!112168 m!127957))

(assert (=> b!112174 m!127931))

(assert (=> b!112174 m!127931))

(declare-fun m!127959 () Bool)

(assert (=> b!112174 m!127959))

(assert (=> bm!12014 m!127957))

(declare-fun m!127961 () Bool)

(assert (=> b!112173 m!127961))

(assert (=> bm!11938 d!31911))

(declare-fun d!31913 () Bool)

(declare-fun e!72933 () Bool)

(assert (=> d!31913 e!72933))

(declare-fun res!55348 () Bool)

(assert (=> d!31913 (=> res!55348 e!72933)))

(declare-fun lt!57980 () Bool)

(assert (=> d!31913 (= res!55348 (not lt!57980))))

(declare-fun lt!57979 () Bool)

(assert (=> d!31913 (= lt!57980 lt!57979)))

(declare-fun lt!57981 () Unit!3461)

(declare-fun e!72932 () Unit!3461)

(assert (=> d!31913 (= lt!57981 e!72932)))

(declare-fun c!20030 () Bool)

(assert (=> d!31913 (= c!20030 lt!57979)))

(assert (=> d!31913 (= lt!57979 (containsKey!163 (toList!792 lt!57771) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!31913 (= (contains!829 lt!57771 #b1000000000000000000000000000000000000000000000000000000000000000) lt!57980)))

(declare-fun b!112180 () Bool)

(declare-fun lt!57982 () Unit!3461)

(assert (=> b!112180 (= e!72932 lt!57982)))

(assert (=> b!112180 (= lt!57982 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 lt!57771) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112180 (isDefined!112 (getValueByKey!160 (toList!792 lt!57771) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112181 () Bool)

(declare-fun Unit!3478 () Unit!3461)

(assert (=> b!112181 (= e!72932 Unit!3478)))

(declare-fun b!112182 () Bool)

(assert (=> b!112182 (= e!72933 (isDefined!112 (getValueByKey!160 (toList!792 lt!57771) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!31913 c!20030) b!112180))

(assert (= (and d!31913 (not c!20030)) b!112181))

(assert (= (and d!31913 (not res!55348)) b!112182))

(declare-fun m!127963 () Bool)

(assert (=> d!31913 m!127963))

(declare-fun m!127965 () Bool)

(assert (=> b!112180 m!127965))

(declare-fun m!127967 () Bool)

(assert (=> b!112180 m!127967))

(assert (=> b!112180 m!127967))

(declare-fun m!127969 () Bool)

(assert (=> b!112180 m!127969))

(assert (=> b!112182 m!127967))

(assert (=> b!112182 m!127967))

(assert (=> b!112182 m!127969))

(assert (=> bm!11932 d!31913))

(declare-fun d!31915 () Bool)

(assert (=> d!31915 (= (apply!101 lt!57771 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1364 (getValueByKey!160 (toList!792 lt!57771) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4626 () Bool)

(assert (= bs!4626 d!31915))

(assert (=> bs!4626 m!127587))

(declare-fun m!127971 () Bool)

(assert (=> bs!4626 m!127971))

(assert (=> bs!4626 m!127971))

(declare-fun m!127973 () Bool)

(assert (=> bs!4626 m!127973))

(assert (=> b!111881 d!31915))

(declare-fun d!31917 () Bool)

(declare-fun c!20031 () Bool)

(assert (=> d!31917 (= c!20031 ((_ is ValueCellFull!1007) (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!72934 () V!3249)

(assert (=> d!31917 (= (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!72934)))

(declare-fun b!112183 () Bool)

(assert (=> b!112183 (= e!72934 (get!1362 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!112184 () Bool)

(assert (=> b!112184 (= e!72934 (get!1363 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!31917 c!20031) b!112183))

(assert (= (and d!31917 (not c!20031)) b!112184))

(assert (=> b!112183 m!127593))

(assert (=> b!112183 m!127415))

(declare-fun m!127975 () Bool)

(assert (=> b!112183 m!127975))

(assert (=> b!112184 m!127593))

(assert (=> b!112184 m!127415))

(declare-fun m!127977 () Bool)

(assert (=> b!112184 m!127977))

(assert (=> b!111881 d!31917))

(declare-fun b!112185 () Bool)

(declare-fun e!72937 () Bool)

(declare-fun e!72936 () Bool)

(assert (=> b!112185 (= e!72937 e!72936)))

(declare-fun res!55349 () Bool)

(assert (=> b!112185 (=> (not res!55349) (not e!72936))))

(declare-fun e!72935 () Bool)

(assert (=> b!112185 (= res!55349 (not e!72935))))

(declare-fun res!55350 () Bool)

(assert (=> b!112185 (=> (not res!55350) (not e!72935))))

(assert (=> b!112185 (= res!55350 (validKeyInArray!0 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12015 () Bool)

(declare-fun call!12018 () Bool)

(declare-fun c!20032 () Bool)

(assert (=> bm!12015 (= call!12018 (arrayNoDuplicates!0 (_keys!4365 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!20032 (Cons!1610 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000) Nil!1611) Nil!1611)))))

(declare-fun b!112186 () Bool)

(declare-fun e!72938 () Bool)

(assert (=> b!112186 (= e!72938 call!12018)))

(declare-fun b!112187 () Bool)

(assert (=> b!112187 (= e!72936 e!72938)))

(assert (=> b!112187 (= c!20032 (validKeyInArray!0 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!31919 () Bool)

(declare-fun res!55351 () Bool)

(assert (=> d!31919 (=> res!55351 e!72937)))

(assert (=> d!31919 (= res!55351 (bvsge #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))

(assert (=> d!31919 (= (arrayNoDuplicates!0 (_keys!4365 newMap!16) #b00000000000000000000000000000000 Nil!1611) e!72937)))

(declare-fun b!112188 () Bool)

(assert (=> b!112188 (= e!72935 (contains!832 Nil!1611 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112189 () Bool)

(assert (=> b!112189 (= e!72938 call!12018)))

(assert (= (and d!31919 (not res!55351)) b!112185))

(assert (= (and b!112185 res!55350) b!112188))

(assert (= (and b!112185 res!55349) b!112187))

(assert (= (and b!112187 c!20032) b!112189))

(assert (= (and b!112187 (not c!20032)) b!112186))

(assert (= (or b!112189 b!112186) bm!12015))

(declare-fun m!127979 () Bool)

(assert (=> b!112185 m!127979))

(assert (=> b!112185 m!127979))

(declare-fun m!127981 () Bool)

(assert (=> b!112185 m!127981))

(assert (=> bm!12015 m!127979))

(declare-fun m!127983 () Bool)

(assert (=> bm!12015 m!127983))

(assert (=> b!112187 m!127979))

(assert (=> b!112187 m!127979))

(assert (=> b!112187 m!127981))

(assert (=> b!112188 m!127979))

(assert (=> b!112188 m!127979))

(declare-fun m!127985 () Bool)

(assert (=> b!112188 m!127985))

(assert (=> b!112117 d!31919))

(declare-fun d!31921 () Bool)

(declare-fun e!72940 () Bool)

(assert (=> d!31921 e!72940))

(declare-fun res!55352 () Bool)

(assert (=> d!31921 (=> res!55352 e!72940)))

(declare-fun lt!57984 () Bool)

(assert (=> d!31921 (= res!55352 (not lt!57984))))

(declare-fun lt!57983 () Bool)

(assert (=> d!31921 (= lt!57984 lt!57983)))

(declare-fun lt!57985 () Unit!3461)

(declare-fun e!72939 () Unit!3461)

(assert (=> d!31921 (= lt!57985 e!72939)))

(declare-fun c!20033 () Bool)

(assert (=> d!31921 (= c!20033 lt!57983)))

(assert (=> d!31921 (= lt!57983 (containsKey!163 (toList!792 lt!57807) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!31921 (= (contains!829 lt!57807 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!57984)))

(declare-fun b!112190 () Bool)

(declare-fun lt!57986 () Unit!3461)

(assert (=> b!112190 (= e!72939 lt!57986)))

(assert (=> b!112190 (= lt!57986 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 lt!57807) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!112190 (isDefined!112 (getValueByKey!160 (toList!792 lt!57807) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!112191 () Bool)

(declare-fun Unit!3479 () Unit!3461)

(assert (=> b!112191 (= e!72939 Unit!3479)))

(declare-fun b!112192 () Bool)

(assert (=> b!112192 (= e!72940 (isDefined!112 (getValueByKey!160 (toList!792 lt!57807) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!31921 c!20033) b!112190))

(assert (= (and d!31921 (not c!20033)) b!112191))

(assert (= (and d!31921 (not res!55352)) b!112192))

(assert (=> d!31921 m!127587))

(declare-fun m!127987 () Bool)

(assert (=> d!31921 m!127987))

(assert (=> b!112190 m!127587))

(declare-fun m!127989 () Bool)

(assert (=> b!112190 m!127989))

(assert (=> b!112190 m!127587))

(declare-fun m!127991 () Bool)

(assert (=> b!112190 m!127991))

(assert (=> b!112190 m!127991))

(declare-fun m!127993 () Bool)

(assert (=> b!112190 m!127993))

(assert (=> b!112192 m!127587))

(assert (=> b!112192 m!127991))

(assert (=> b!112192 m!127991))

(assert (=> b!112192 m!127993))

(assert (=> b!111956 d!31921))

(assert (=> d!31833 d!31839))

(declare-fun d!31923 () Bool)

(assert (=> d!31923 (arrayNoDuplicates!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) from!355 Nil!1611)))

(assert (=> d!31923 true))

(declare-fun _$71!156 () Unit!3461)

(assert (=> d!31923 (= (choose!39 (_keys!4365 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!156)))

(declare-fun bs!4627 () Bool)

(assert (= bs!4627 d!31923))

(assert (=> bs!4627 m!127445))

(assert (=> d!31833 d!31923))

(declare-fun d!31925 () Bool)

(declare-fun e!72942 () Bool)

(assert (=> d!31925 e!72942))

(declare-fun res!55353 () Bool)

(assert (=> d!31925 (=> res!55353 e!72942)))

(declare-fun lt!57988 () Bool)

(assert (=> d!31925 (= res!55353 (not lt!57988))))

(declare-fun lt!57987 () Bool)

(assert (=> d!31925 (= lt!57988 lt!57987)))

(declare-fun lt!57989 () Unit!3461)

(declare-fun e!72941 () Unit!3461)

(assert (=> d!31925 (= lt!57989 e!72941)))

(declare-fun c!20034 () Bool)

(assert (=> d!31925 (= c!20034 lt!57987)))

(assert (=> d!31925 (= lt!57987 (containsKey!163 (toList!792 lt!57827) (_1!1210 lt!57632)))))

(assert (=> d!31925 (= (contains!829 lt!57827 (_1!1210 lt!57632)) lt!57988)))

(declare-fun b!112193 () Bool)

(declare-fun lt!57990 () Unit!3461)

(assert (=> b!112193 (= e!72941 lt!57990)))

(assert (=> b!112193 (= lt!57990 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 lt!57827) (_1!1210 lt!57632)))))

(assert (=> b!112193 (isDefined!112 (getValueByKey!160 (toList!792 lt!57827) (_1!1210 lt!57632)))))

(declare-fun b!112194 () Bool)

(declare-fun Unit!3480 () Unit!3461)

(assert (=> b!112194 (= e!72941 Unit!3480)))

(declare-fun b!112195 () Bool)

(assert (=> b!112195 (= e!72942 (isDefined!112 (getValueByKey!160 (toList!792 lt!57827) (_1!1210 lt!57632))))))

(assert (= (and d!31925 c!20034) b!112193))

(assert (= (and d!31925 (not c!20034)) b!112194))

(assert (= (and d!31925 (not res!55353)) b!112195))

(declare-fun m!127995 () Bool)

(assert (=> d!31925 m!127995))

(declare-fun m!127997 () Bool)

(assert (=> b!112193 m!127997))

(assert (=> b!112193 m!127707))

(assert (=> b!112193 m!127707))

(declare-fun m!127999 () Bool)

(assert (=> b!112193 m!127999))

(assert (=> b!112195 m!127707))

(assert (=> b!112195 m!127707))

(assert (=> b!112195 m!127999))

(assert (=> d!31855 d!31925))

(declare-fun b!112196 () Bool)

(declare-fun e!72943 () Option!166)

(assert (=> b!112196 (= e!72943 (Some!165 (_2!1210 (h!2209 lt!57828))))))

(declare-fun b!112199 () Bool)

(declare-fun e!72944 () Option!166)

(assert (=> b!112199 (= e!72944 None!164)))

(declare-fun b!112197 () Bool)

(assert (=> b!112197 (= e!72943 e!72944)))

(declare-fun c!20036 () Bool)

(assert (=> b!112197 (= c!20036 (and ((_ is Cons!1609) lt!57828) (not (= (_1!1210 (h!2209 lt!57828)) (_1!1210 lt!57632)))))))

(declare-fun d!31927 () Bool)

(declare-fun c!20035 () Bool)

(assert (=> d!31927 (= c!20035 (and ((_ is Cons!1609) lt!57828) (= (_1!1210 (h!2209 lt!57828)) (_1!1210 lt!57632))))))

(assert (=> d!31927 (= (getValueByKey!160 lt!57828 (_1!1210 lt!57632)) e!72943)))

(declare-fun b!112198 () Bool)

(assert (=> b!112198 (= e!72944 (getValueByKey!160 (t!5763 lt!57828) (_1!1210 lt!57632)))))

(assert (= (and d!31927 c!20035) b!112196))

(assert (= (and d!31927 (not c!20035)) b!112197))

(assert (= (and b!112197 c!20036) b!112198))

(assert (= (and b!112197 (not c!20036)) b!112199))

(declare-fun m!128001 () Bool)

(assert (=> b!112198 m!128001))

(assert (=> d!31855 d!31927))

(declare-fun d!31929 () Bool)

(assert (=> d!31929 (= (getValueByKey!160 lt!57828 (_1!1210 lt!57632)) (Some!165 (_2!1210 lt!57632)))))

(declare-fun lt!57993 () Unit!3461)

(declare-fun choose!708 (List!1613 (_ BitVec 64) V!3249) Unit!3461)

(assert (=> d!31929 (= lt!57993 (choose!708 lt!57828 (_1!1210 lt!57632) (_2!1210 lt!57632)))))

(declare-fun e!72947 () Bool)

(assert (=> d!31929 e!72947))

(declare-fun res!55358 () Bool)

(assert (=> d!31929 (=> (not res!55358) (not e!72947))))

(declare-fun isStrictlySorted!299 (List!1613) Bool)

(assert (=> d!31929 (= res!55358 (isStrictlySorted!299 lt!57828))))

(assert (=> d!31929 (= (lemmaContainsTupThenGetReturnValue!76 lt!57828 (_1!1210 lt!57632) (_2!1210 lt!57632)) lt!57993)))

(declare-fun b!112204 () Bool)

(declare-fun res!55359 () Bool)

(assert (=> b!112204 (=> (not res!55359) (not e!72947))))

(assert (=> b!112204 (= res!55359 (containsKey!163 lt!57828 (_1!1210 lt!57632)))))

(declare-fun b!112205 () Bool)

(assert (=> b!112205 (= e!72947 (contains!833 lt!57828 (tuple2!2399 (_1!1210 lt!57632) (_2!1210 lt!57632))))))

(assert (= (and d!31929 res!55358) b!112204))

(assert (= (and b!112204 res!55359) b!112205))

(assert (=> d!31929 m!127701))

(declare-fun m!128003 () Bool)

(assert (=> d!31929 m!128003))

(declare-fun m!128005 () Bool)

(assert (=> d!31929 m!128005))

(declare-fun m!128007 () Bool)

(assert (=> b!112204 m!128007))

(declare-fun m!128009 () Bool)

(assert (=> b!112205 m!128009))

(assert (=> d!31855 d!31929))

(declare-fun b!112226 () Bool)

(declare-fun e!72962 () Bool)

(declare-fun lt!57996 () List!1613)

(assert (=> b!112226 (= e!72962 (contains!833 lt!57996 (tuple2!2399 (_1!1210 lt!57632) (_2!1210 lt!57632))))))

(declare-fun b!112227 () Bool)

(declare-fun res!55365 () Bool)

(assert (=> b!112227 (=> (not res!55365) (not e!72962))))

(assert (=> b!112227 (= res!55365 (containsKey!163 lt!57996 (_1!1210 lt!57632)))))

(declare-fun bm!12022 () Bool)

(declare-fun call!12026 () List!1613)

(declare-fun call!12025 () List!1613)

(assert (=> bm!12022 (= call!12026 call!12025)))

(declare-fun b!112228 () Bool)

(declare-fun e!72959 () List!1613)

(assert (=> b!112228 (= e!72959 call!12026)))

(declare-fun e!72961 () List!1613)

(declare-fun b!112229 () Bool)

(declare-fun c!20045 () Bool)

(declare-fun c!20046 () Bool)

(assert (=> b!112229 (= e!72961 (ite c!20046 (t!5763 (toList!792 (+!147 lt!57631 lt!57633))) (ite c!20045 (Cons!1609 (h!2209 (toList!792 (+!147 lt!57631 lt!57633))) (t!5763 (toList!792 (+!147 lt!57631 lt!57633)))) Nil!1610)))))

(declare-fun b!112230 () Bool)

(declare-fun e!72960 () List!1613)

(declare-fun e!72958 () List!1613)

(assert (=> b!112230 (= e!72960 e!72958)))

(assert (=> b!112230 (= c!20046 (and ((_ is Cons!1609) (toList!792 (+!147 lt!57631 lt!57633))) (= (_1!1210 (h!2209 (toList!792 (+!147 lt!57631 lt!57633)))) (_1!1210 lt!57632))))))

(declare-fun b!112231 () Bool)

(assert (=> b!112231 (= c!20045 (and ((_ is Cons!1609) (toList!792 (+!147 lt!57631 lt!57633))) (bvsgt (_1!1210 (h!2209 (toList!792 (+!147 lt!57631 lt!57633)))) (_1!1210 lt!57632))))))

(assert (=> b!112231 (= e!72958 e!72959)))

(declare-fun call!12027 () List!1613)

(declare-fun bm!12023 () Bool)

(declare-fun c!20048 () Bool)

(declare-fun $colon$colon!83 (List!1613 tuple2!2398) List!1613)

(assert (=> bm!12023 (= call!12027 ($colon$colon!83 e!72961 (ite c!20048 (h!2209 (toList!792 (+!147 lt!57631 lt!57633))) (tuple2!2399 (_1!1210 lt!57632) (_2!1210 lt!57632)))))))

(declare-fun c!20047 () Bool)

(assert (=> bm!12023 (= c!20047 c!20048)))

(declare-fun b!112232 () Bool)

(assert (=> b!112232 (= e!72958 call!12025)))

(declare-fun bm!12024 () Bool)

(assert (=> bm!12024 (= call!12025 call!12027)))

(declare-fun d!31931 () Bool)

(assert (=> d!31931 e!72962))

(declare-fun res!55364 () Bool)

(assert (=> d!31931 (=> (not res!55364) (not e!72962))))

(assert (=> d!31931 (= res!55364 (isStrictlySorted!299 lt!57996))))

(assert (=> d!31931 (= lt!57996 e!72960)))

(assert (=> d!31931 (= c!20048 (and ((_ is Cons!1609) (toList!792 (+!147 lt!57631 lt!57633))) (bvslt (_1!1210 (h!2209 (toList!792 (+!147 lt!57631 lt!57633)))) (_1!1210 lt!57632))))))

(assert (=> d!31931 (isStrictlySorted!299 (toList!792 (+!147 lt!57631 lt!57633)))))

(assert (=> d!31931 (= (insertStrictlySorted!79 (toList!792 (+!147 lt!57631 lt!57633)) (_1!1210 lt!57632) (_2!1210 lt!57632)) lt!57996)))

(declare-fun b!112233 () Bool)

(assert (=> b!112233 (= e!72960 call!12027)))

(declare-fun b!112234 () Bool)

(assert (=> b!112234 (= e!72961 (insertStrictlySorted!79 (t!5763 (toList!792 (+!147 lt!57631 lt!57633))) (_1!1210 lt!57632) (_2!1210 lt!57632)))))

(declare-fun b!112235 () Bool)

(assert (=> b!112235 (= e!72959 call!12026)))

(assert (= (and d!31931 c!20048) b!112233))

(assert (= (and d!31931 (not c!20048)) b!112230))

(assert (= (and b!112230 c!20046) b!112232))

(assert (= (and b!112230 (not c!20046)) b!112231))

(assert (= (and b!112231 c!20045) b!112228))

(assert (= (and b!112231 (not c!20045)) b!112235))

(assert (= (or b!112228 b!112235) bm!12022))

(assert (= (or b!112232 bm!12022) bm!12024))

(assert (= (or b!112233 bm!12024) bm!12023))

(assert (= (and bm!12023 c!20047) b!112234))

(assert (= (and bm!12023 (not c!20047)) b!112229))

(assert (= (and d!31931 res!55364) b!112227))

(assert (= (and b!112227 res!55365) b!112226))

(declare-fun m!128011 () Bool)

(assert (=> b!112227 m!128011))

(declare-fun m!128013 () Bool)

(assert (=> bm!12023 m!128013))

(declare-fun m!128015 () Bool)

(assert (=> b!112226 m!128015))

(declare-fun m!128017 () Bool)

(assert (=> d!31931 m!128017))

(declare-fun m!128019 () Bool)

(assert (=> d!31931 m!128019))

(declare-fun m!128021 () Bool)

(assert (=> b!112234 m!128021))

(assert (=> d!31855 d!31931))

(assert (=> b!111909 d!31835))

(declare-fun d!31933 () Bool)

(assert (=> d!31933 (arrayContainsKey!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) lt!57937 #b00000000000000000000000000000000)))

(declare-fun lt!57999 () Unit!3461)

(declare-fun choose!13 (array!4385 (_ BitVec 64) (_ BitVec 32)) Unit!3461)

(assert (=> d!31933 (= lt!57999 (choose!13 (_keys!4365 (v!2946 (underlying!373 thiss!992))) lt!57937 #b00000000000000000000000000000000))))

(assert (=> d!31933 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!31933 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) lt!57937 #b00000000000000000000000000000000) lt!57999)))

(declare-fun bs!4628 () Bool)

(assert (= bs!4628 d!31933))

(assert (=> bs!4628 m!127799))

(declare-fun m!128023 () Bool)

(assert (=> bs!4628 m!128023))

(assert (=> b!112105 d!31933))

(declare-fun d!31935 () Bool)

(declare-fun res!55366 () Bool)

(declare-fun e!72963 () Bool)

(assert (=> d!31935 (=> res!55366 e!72963)))

(assert (=> d!31935 (= res!55366 (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) lt!57937))))

(assert (=> d!31935 (= (arrayContainsKey!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) lt!57937 #b00000000000000000000000000000000) e!72963)))

(declare-fun b!112236 () Bool)

(declare-fun e!72964 () Bool)

(assert (=> b!112236 (= e!72963 e!72964)))

(declare-fun res!55367 () Bool)

(assert (=> b!112236 (=> (not res!55367) (not e!72964))))

(assert (=> b!112236 (= res!55367 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!112237 () Bool)

(assert (=> b!112237 (= e!72964 (arrayContainsKey!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) lt!57937 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!31935 (not res!55366)) b!112236))

(assert (= (and b!112236 res!55367) b!112237))

(assert (=> d!31935 m!127795))

(declare-fun m!128025 () Bool)

(assert (=> b!112237 m!128025))

(assert (=> b!112105 d!31935))

(declare-fun b!112250 () Bool)

(declare-fun e!72971 () SeekEntryResult!256)

(declare-fun e!72972 () SeekEntryResult!256)

(assert (=> b!112250 (= e!72971 e!72972)))

(declare-fun lt!58006 () (_ BitVec 64))

(declare-fun lt!58008 () SeekEntryResult!256)

(assert (=> b!112250 (= lt!58006 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (index!3177 lt!58008)))))

(declare-fun c!20056 () Bool)

(assert (=> b!112250 (= c!20056 (= lt!58006 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!112251 () Bool)

(assert (=> b!112251 (= e!72971 Undefined!256)))

(declare-fun b!112252 () Bool)

(assert (=> b!112252 (= e!72972 (Found!256 (index!3177 lt!58008)))))

(declare-fun d!31937 () Bool)

(declare-fun lt!58007 () SeekEntryResult!256)

(assert (=> d!31937 (and (or ((_ is Undefined!256) lt!58007) (not ((_ is Found!256) lt!58007)) (and (bvsge (index!3176 lt!58007) #b00000000000000000000000000000000) (bvslt (index!3176 lt!58007) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))) (or ((_ is Undefined!256) lt!58007) ((_ is Found!256) lt!58007) (not ((_ is MissingZero!256) lt!58007)) (and (bvsge (index!3175 lt!58007) #b00000000000000000000000000000000) (bvslt (index!3175 lt!58007) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))) (or ((_ is Undefined!256) lt!58007) ((_ is Found!256) lt!58007) ((_ is MissingZero!256) lt!58007) (not ((_ is MissingVacant!256) lt!58007)) (and (bvsge (index!3178 lt!58007) #b00000000000000000000000000000000) (bvslt (index!3178 lt!58007) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))) (or ((_ is Undefined!256) lt!58007) (ite ((_ is Found!256) lt!58007) (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (index!3176 lt!58007)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!256) lt!58007) (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (index!3175 lt!58007)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!256) lt!58007) (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (index!3178 lt!58007)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!31937 (= lt!58007 e!72971)))

(declare-fun c!20057 () Bool)

(assert (=> d!31937 (= c!20057 (and ((_ is Intermediate!256) lt!58008) (undefined!1068 lt!58008)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4385 (_ BitVec 32)) SeekEntryResult!256)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!31937 (= lt!58008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) (mask!6825 (v!2946 (underlying!373 thiss!992)))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) (_keys!4365 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992)))))))

(assert (=> d!31937 (validMask!0 (mask!6825 (v!2946 (underlying!373 thiss!992))))))

(assert (=> d!31937 (= (seekEntryOrOpen!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) (_keys!4365 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992)))) lt!58007)))

(declare-fun b!112253 () Bool)

(declare-fun c!20055 () Bool)

(assert (=> b!112253 (= c!20055 (= lt!58006 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!72973 () SeekEntryResult!256)

(assert (=> b!112253 (= e!72972 e!72973)))

(declare-fun b!112254 () Bool)

(assert (=> b!112254 (= e!72973 (MissingZero!256 (index!3177 lt!58008)))))

(declare-fun b!112255 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4385 (_ BitVec 32)) SeekEntryResult!256)

(assert (=> b!112255 (= e!72973 (seekKeyOrZeroReturnVacant!0 (x!14088 lt!58008) (index!3177 lt!58008) (index!3177 lt!58008) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) (_keys!4365 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992)))))))

(assert (= (and d!31937 c!20057) b!112251))

(assert (= (and d!31937 (not c!20057)) b!112250))

(assert (= (and b!112250 c!20056) b!112252))

(assert (= (and b!112250 (not c!20056)) b!112253))

(assert (= (and b!112253 c!20055) b!112254))

(assert (= (and b!112253 (not c!20055)) b!112255))

(declare-fun m!128027 () Bool)

(assert (=> b!112250 m!128027))

(declare-fun m!128029 () Bool)

(assert (=> d!31937 m!128029))

(assert (=> d!31937 m!127795))

(declare-fun m!128031 () Bool)

(assert (=> d!31937 m!128031))

(assert (=> d!31937 m!127421))

(assert (=> d!31937 m!127795))

(assert (=> d!31937 m!128029))

(declare-fun m!128033 () Bool)

(assert (=> d!31937 m!128033))

(declare-fun m!128035 () Bool)

(assert (=> d!31937 m!128035))

(declare-fun m!128037 () Bool)

(assert (=> d!31937 m!128037))

(assert (=> b!112255 m!127795))

(declare-fun m!128039 () Bool)

(assert (=> b!112255 m!128039))

(assert (=> b!112105 d!31937))

(declare-fun d!31939 () Bool)

(declare-fun e!72975 () Bool)

(assert (=> d!31939 e!72975))

(declare-fun res!55368 () Bool)

(assert (=> d!31939 (=> res!55368 e!72975)))

(declare-fun lt!58010 () Bool)

(assert (=> d!31939 (= res!55368 (not lt!58010))))

(declare-fun lt!58009 () Bool)

(assert (=> d!31939 (= lt!58010 lt!58009)))

(declare-fun lt!58011 () Unit!3461)

(declare-fun e!72974 () Unit!3461)

(assert (=> d!31939 (= lt!58011 e!72974)))

(declare-fun c!20058 () Bool)

(assert (=> d!31939 (= c!20058 lt!58009)))

(assert (=> d!31939 (= lt!58009 (containsKey!163 (toList!792 lt!57823) (_1!1210 lt!57633)))))

(assert (=> d!31939 (= (contains!829 lt!57823 (_1!1210 lt!57633)) lt!58010)))

(declare-fun b!112256 () Bool)

(declare-fun lt!58012 () Unit!3461)

(assert (=> b!112256 (= e!72974 lt!58012)))

(assert (=> b!112256 (= lt!58012 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 lt!57823) (_1!1210 lt!57633)))))

(assert (=> b!112256 (isDefined!112 (getValueByKey!160 (toList!792 lt!57823) (_1!1210 lt!57633)))))

(declare-fun b!112257 () Bool)

(declare-fun Unit!3481 () Unit!3461)

(assert (=> b!112257 (= e!72974 Unit!3481)))

(declare-fun b!112258 () Bool)

(assert (=> b!112258 (= e!72975 (isDefined!112 (getValueByKey!160 (toList!792 lt!57823) (_1!1210 lt!57633))))))

(assert (= (and d!31939 c!20058) b!112256))

(assert (= (and d!31939 (not c!20058)) b!112257))

(assert (= (and d!31939 (not res!55368)) b!112258))

(declare-fun m!128041 () Bool)

(assert (=> d!31939 m!128041))

(declare-fun m!128043 () Bool)

(assert (=> b!112256 m!128043))

(assert (=> b!112256 m!127695))

(assert (=> b!112256 m!127695))

(declare-fun m!128045 () Bool)

(assert (=> b!112256 m!128045))

(assert (=> b!112258 m!127695))

(assert (=> b!112258 m!127695))

(assert (=> b!112258 m!128045))

(assert (=> d!31853 d!31939))

(declare-fun b!112259 () Bool)

(declare-fun e!72976 () Option!166)

(assert (=> b!112259 (= e!72976 (Some!165 (_2!1210 (h!2209 lt!57824))))))

(declare-fun b!112262 () Bool)

(declare-fun e!72977 () Option!166)

(assert (=> b!112262 (= e!72977 None!164)))

(declare-fun b!112260 () Bool)

(assert (=> b!112260 (= e!72976 e!72977)))

(declare-fun c!20060 () Bool)

(assert (=> b!112260 (= c!20060 (and ((_ is Cons!1609) lt!57824) (not (= (_1!1210 (h!2209 lt!57824)) (_1!1210 lt!57633)))))))

(declare-fun d!31941 () Bool)

(declare-fun c!20059 () Bool)

(assert (=> d!31941 (= c!20059 (and ((_ is Cons!1609) lt!57824) (= (_1!1210 (h!2209 lt!57824)) (_1!1210 lt!57633))))))

(assert (=> d!31941 (= (getValueByKey!160 lt!57824 (_1!1210 lt!57633)) e!72976)))

(declare-fun b!112261 () Bool)

(assert (=> b!112261 (= e!72977 (getValueByKey!160 (t!5763 lt!57824) (_1!1210 lt!57633)))))

(assert (= (and d!31941 c!20059) b!112259))

(assert (= (and d!31941 (not c!20059)) b!112260))

(assert (= (and b!112260 c!20060) b!112261))

(assert (= (and b!112260 (not c!20060)) b!112262))

(declare-fun m!128047 () Bool)

(assert (=> b!112261 m!128047))

(assert (=> d!31853 d!31941))

(declare-fun d!31943 () Bool)

(assert (=> d!31943 (= (getValueByKey!160 lt!57824 (_1!1210 lt!57633)) (Some!165 (_2!1210 lt!57633)))))

(declare-fun lt!58013 () Unit!3461)

(assert (=> d!31943 (= lt!58013 (choose!708 lt!57824 (_1!1210 lt!57633) (_2!1210 lt!57633)))))

(declare-fun e!72978 () Bool)

(assert (=> d!31943 e!72978))

(declare-fun res!55369 () Bool)

(assert (=> d!31943 (=> (not res!55369) (not e!72978))))

(assert (=> d!31943 (= res!55369 (isStrictlySorted!299 lt!57824))))

(assert (=> d!31943 (= (lemmaContainsTupThenGetReturnValue!76 lt!57824 (_1!1210 lt!57633) (_2!1210 lt!57633)) lt!58013)))

(declare-fun b!112263 () Bool)

(declare-fun res!55370 () Bool)

(assert (=> b!112263 (=> (not res!55370) (not e!72978))))

(assert (=> b!112263 (= res!55370 (containsKey!163 lt!57824 (_1!1210 lt!57633)))))

(declare-fun b!112264 () Bool)

(assert (=> b!112264 (= e!72978 (contains!833 lt!57824 (tuple2!2399 (_1!1210 lt!57633) (_2!1210 lt!57633))))))

(assert (= (and d!31943 res!55369) b!112263))

(assert (= (and b!112263 res!55370) b!112264))

(assert (=> d!31943 m!127689))

(declare-fun m!128049 () Bool)

(assert (=> d!31943 m!128049))

(declare-fun m!128051 () Bool)

(assert (=> d!31943 m!128051))

(declare-fun m!128053 () Bool)

(assert (=> b!112263 m!128053))

(declare-fun m!128055 () Bool)

(assert (=> b!112264 m!128055))

(assert (=> d!31853 d!31943))

(declare-fun b!112265 () Bool)

(declare-fun e!72983 () Bool)

(declare-fun lt!58014 () List!1613)

(assert (=> b!112265 (= e!72983 (contains!833 lt!58014 (tuple2!2399 (_1!1210 lt!57633) (_2!1210 lt!57633))))))

(declare-fun b!112266 () Bool)

(declare-fun res!55372 () Bool)

(assert (=> b!112266 (=> (not res!55372) (not e!72983))))

(assert (=> b!112266 (= res!55372 (containsKey!163 lt!58014 (_1!1210 lt!57633)))))

(declare-fun bm!12025 () Bool)

(declare-fun call!12029 () List!1613)

(declare-fun call!12028 () List!1613)

(assert (=> bm!12025 (= call!12029 call!12028)))

(declare-fun b!112267 () Bool)

(declare-fun e!72980 () List!1613)

(assert (=> b!112267 (= e!72980 call!12029)))

(declare-fun c!20061 () Bool)

(declare-fun c!20062 () Bool)

(declare-fun b!112268 () Bool)

(declare-fun e!72982 () List!1613)

(assert (=> b!112268 (= e!72982 (ite c!20062 (t!5763 (toList!792 (+!147 lt!57631 lt!57632))) (ite c!20061 (Cons!1609 (h!2209 (toList!792 (+!147 lt!57631 lt!57632))) (t!5763 (toList!792 (+!147 lt!57631 lt!57632)))) Nil!1610)))))

(declare-fun b!112269 () Bool)

(declare-fun e!72981 () List!1613)

(declare-fun e!72979 () List!1613)

(assert (=> b!112269 (= e!72981 e!72979)))

(assert (=> b!112269 (= c!20062 (and ((_ is Cons!1609) (toList!792 (+!147 lt!57631 lt!57632))) (= (_1!1210 (h!2209 (toList!792 (+!147 lt!57631 lt!57632)))) (_1!1210 lt!57633))))))

(declare-fun b!112270 () Bool)

(assert (=> b!112270 (= c!20061 (and ((_ is Cons!1609) (toList!792 (+!147 lt!57631 lt!57632))) (bvsgt (_1!1210 (h!2209 (toList!792 (+!147 lt!57631 lt!57632)))) (_1!1210 lt!57633))))))

(assert (=> b!112270 (= e!72979 e!72980)))

(declare-fun call!12030 () List!1613)

(declare-fun c!20064 () Bool)

(declare-fun bm!12026 () Bool)

(assert (=> bm!12026 (= call!12030 ($colon$colon!83 e!72982 (ite c!20064 (h!2209 (toList!792 (+!147 lt!57631 lt!57632))) (tuple2!2399 (_1!1210 lt!57633) (_2!1210 lt!57633)))))))

(declare-fun c!20063 () Bool)

(assert (=> bm!12026 (= c!20063 c!20064)))

(declare-fun b!112271 () Bool)

(assert (=> b!112271 (= e!72979 call!12028)))

(declare-fun bm!12027 () Bool)

(assert (=> bm!12027 (= call!12028 call!12030)))

(declare-fun d!31945 () Bool)

(assert (=> d!31945 e!72983))

(declare-fun res!55371 () Bool)

(assert (=> d!31945 (=> (not res!55371) (not e!72983))))

(assert (=> d!31945 (= res!55371 (isStrictlySorted!299 lt!58014))))

(assert (=> d!31945 (= lt!58014 e!72981)))

(assert (=> d!31945 (= c!20064 (and ((_ is Cons!1609) (toList!792 (+!147 lt!57631 lt!57632))) (bvslt (_1!1210 (h!2209 (toList!792 (+!147 lt!57631 lt!57632)))) (_1!1210 lt!57633))))))

(assert (=> d!31945 (isStrictlySorted!299 (toList!792 (+!147 lt!57631 lt!57632)))))

(assert (=> d!31945 (= (insertStrictlySorted!79 (toList!792 (+!147 lt!57631 lt!57632)) (_1!1210 lt!57633) (_2!1210 lt!57633)) lt!58014)))

(declare-fun b!112272 () Bool)

(assert (=> b!112272 (= e!72981 call!12030)))

(declare-fun b!112273 () Bool)

(assert (=> b!112273 (= e!72982 (insertStrictlySorted!79 (t!5763 (toList!792 (+!147 lt!57631 lt!57632))) (_1!1210 lt!57633) (_2!1210 lt!57633)))))

(declare-fun b!112274 () Bool)

(assert (=> b!112274 (= e!72980 call!12029)))

(assert (= (and d!31945 c!20064) b!112272))

(assert (= (and d!31945 (not c!20064)) b!112269))

(assert (= (and b!112269 c!20062) b!112271))

(assert (= (and b!112269 (not c!20062)) b!112270))

(assert (= (and b!112270 c!20061) b!112267))

(assert (= (and b!112270 (not c!20061)) b!112274))

(assert (= (or b!112267 b!112274) bm!12025))

(assert (= (or b!112271 bm!12025) bm!12027))

(assert (= (or b!112272 bm!12027) bm!12026))

(assert (= (and bm!12026 c!20063) b!112273))

(assert (= (and bm!12026 (not c!20063)) b!112268))

(assert (= (and d!31945 res!55371) b!112266))

(assert (= (and b!112266 res!55372) b!112265))

(declare-fun m!128057 () Bool)

(assert (=> b!112266 m!128057))

(declare-fun m!128059 () Bool)

(assert (=> bm!12026 m!128059))

(declare-fun m!128061 () Bool)

(assert (=> b!112265 m!128061))

(declare-fun m!128063 () Bool)

(assert (=> d!31945 m!128063))

(declare-fun m!128065 () Bool)

(assert (=> d!31945 m!128065))

(declare-fun m!128067 () Bool)

(assert (=> b!112273 m!128067))

(assert (=> d!31853 d!31945))

(declare-fun d!31947 () Bool)

(assert (=> d!31947 (= (apply!101 lt!57771 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1364 (getValueByKey!160 (toList!792 lt!57771) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4629 () Bool)

(assert (= bs!4629 d!31947))

(assert (=> bs!4629 m!127967))

(assert (=> bs!4629 m!127967))

(declare-fun m!128069 () Bool)

(assert (=> bs!4629 m!128069))

(assert (=> b!111897 d!31947))

(declare-fun d!31949 () Bool)

(declare-fun e!72986 () Bool)

(assert (=> d!31949 e!72986))

(declare-fun res!55375 () Bool)

(assert (=> d!31949 (=> (not res!55375) (not e!72986))))

(assert (=> d!31949 (= res!55375 (and (bvsge (index!3176 lt!57916) #b00000000000000000000000000000000) (bvslt (index!3176 lt!57916) (size!2336 (_keys!4365 newMap!16)))))))

(declare-fun lt!58017 () Unit!3461)

(declare-fun choose!709 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 32) Int) Unit!3461)

(assert (=> d!31949 (= lt!58017 (choose!709 (_keys!4365 newMap!16) lt!57921 (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (index!3176 lt!57916) (defaultEntry!2647 newMap!16)))))

(assert (=> d!31949 (validMask!0 (mask!6825 newMap!16))))

(assert (=> d!31949 (= (lemmaValidKeyInArrayIsInListMap!110 (_keys!4365 newMap!16) lt!57921 (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (index!3176 lt!57916) (defaultEntry!2647 newMap!16)) lt!58017)))

(declare-fun b!112277 () Bool)

(assert (=> b!112277 (= e!72986 (contains!829 (getCurrentListMap!477 (_keys!4365 newMap!16) lt!57921 (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (select (arr!2078 (_keys!4365 newMap!16)) (index!3176 lt!57916))))))

(assert (= (and d!31949 res!55375) b!112277))

(declare-fun m!128071 () Bool)

(assert (=> d!31949 m!128071))

(declare-fun m!128073 () Bool)

(assert (=> d!31949 m!128073))

(declare-fun m!128075 () Bool)

(assert (=> b!112277 m!128075))

(assert (=> b!112277 m!127783))

(assert (=> b!112277 m!128075))

(assert (=> b!112277 m!127783))

(declare-fun m!128077 () Bool)

(assert (=> b!112277 m!128077))

(assert (=> b!112080 d!31949))

(declare-fun b!112278 () Bool)

(declare-fun e!72992 () Bool)

(declare-fun e!72994 () Bool)

(assert (=> b!112278 (= e!72992 e!72994)))

(declare-fun res!55380 () Bool)

(declare-fun call!12034 () Bool)

(assert (=> b!112278 (= res!55380 call!12034)))

(assert (=> b!112278 (=> (not res!55380) (not e!72994))))

(declare-fun bm!12028 () Bool)

(declare-fun call!12037 () ListLongMap!1553)

(declare-fun call!12032 () ListLongMap!1553)

(assert (=> bm!12028 (= call!12037 call!12032)))

(declare-fun b!112279 () Bool)

(declare-fun e!72988 () Bool)

(assert (=> b!112279 (= e!72988 (validKeyInArray!0 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112280 () Bool)

(declare-fun e!72998 () ListLongMap!1553)

(assert (=> b!112280 (= e!72998 call!12037)))

(declare-fun bm!12030 () Bool)

(declare-fun lt!58030 () ListLongMap!1553)

(assert (=> bm!12030 (= call!12034 (contains!829 lt!58030 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!72999 () Bool)

(declare-fun b!112281 () Bool)

(assert (=> b!112281 (= e!72999 (= (apply!101 lt!58030 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)) (get!1359 (select (arr!2079 (array!4388 (store (arr!2079 (_values!2630 newMap!16)) (index!3176 lt!57916) (ValueCellFull!1007 lt!57642)) (size!2337 (_values!2630 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!391 (defaultEntry!2647 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112281 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2337 (array!4388 (store (arr!2079 (_values!2630 newMap!16)) (index!3176 lt!57916) (ValueCellFull!1007 lt!57642)) (size!2337 (_values!2630 newMap!16))))))))

(assert (=> b!112281 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))

(declare-fun b!112282 () Bool)

(assert (=> b!112282 (= e!72994 (= (apply!101 lt!58030 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2516 newMap!16)))))

(declare-fun b!112283 () Bool)

(declare-fun e!72995 () ListLongMap!1553)

(declare-fun call!12031 () ListLongMap!1553)

(assert (=> b!112283 (= e!72995 (+!147 call!12031 (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 newMap!16))))))

(declare-fun b!112284 () Bool)

(declare-fun e!72996 () Bool)

(assert (=> b!112284 (= e!72996 e!72999)))

(declare-fun res!55376 () Bool)

(assert (=> b!112284 (=> (not res!55376) (not e!72999))))

(assert (=> b!112284 (= res!55376 (contains!829 lt!58030 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!112284 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))

(declare-fun b!112285 () Bool)

(assert (=> b!112285 (= e!72992 (not call!12034))))

(declare-fun b!112286 () Bool)

(declare-fun c!20066 () Bool)

(assert (=> b!112286 (= c!20066 (and (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!72991 () ListLongMap!1553)

(assert (=> b!112286 (= e!72991 e!72998)))

(declare-fun b!112287 () Bool)

(declare-fun res!55377 () Bool)

(declare-fun e!72990 () Bool)

(assert (=> b!112287 (=> (not res!55377) (not e!72990))))

(assert (=> b!112287 (= res!55377 e!72992)))

(declare-fun c!20070 () Bool)

(assert (=> b!112287 (= c!20070 (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!112288 () Bool)

(declare-fun call!12033 () ListLongMap!1553)

(assert (=> b!112288 (= e!72998 call!12033)))

(declare-fun b!112289 () Bool)

(declare-fun e!72993 () Bool)

(assert (=> b!112289 (= e!72993 (validKeyInArray!0 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12031 () Bool)

(declare-fun call!12035 () ListLongMap!1553)

(assert (=> bm!12031 (= call!12032 call!12035)))

(declare-fun b!112290 () Bool)

(declare-fun res!55381 () Bool)

(assert (=> b!112290 (=> (not res!55381) (not e!72990))))

(assert (=> b!112290 (= res!55381 e!72996)))

(declare-fun res!55382 () Bool)

(assert (=> b!112290 (=> res!55382 e!72996)))

(assert (=> b!112290 (= res!55382 (not e!72988))))

(declare-fun res!55383 () Bool)

(assert (=> b!112290 (=> (not res!55383) (not e!72988))))

(assert (=> b!112290 (= res!55383 (bvslt #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))

(declare-fun d!31951 () Bool)

(assert (=> d!31951 e!72990))

(declare-fun res!55384 () Bool)

(assert (=> d!31951 (=> (not res!55384) (not e!72990))))

(assert (=> d!31951 (= res!55384 (or (bvsge #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))))

(declare-fun lt!58037 () ListLongMap!1553)

(assert (=> d!31951 (= lt!58030 lt!58037)))

(declare-fun lt!58022 () Unit!3461)

(declare-fun e!72989 () Unit!3461)

(assert (=> d!31951 (= lt!58022 e!72989)))

(declare-fun c!20069 () Bool)

(assert (=> d!31951 (= c!20069 e!72993)))

(declare-fun res!55378 () Bool)

(assert (=> d!31951 (=> (not res!55378) (not e!72993))))

(assert (=> d!31951 (= res!55378 (bvslt #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))

(assert (=> d!31951 (= lt!58037 e!72995)))

(declare-fun c!20068 () Bool)

(assert (=> d!31951 (= c!20068 (and (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!31951 (validMask!0 (mask!6825 newMap!16))))

(assert (=> d!31951 (= (getCurrentListMap!477 (_keys!4365 newMap!16) (array!4388 (store (arr!2079 (_values!2630 newMap!16)) (index!3176 lt!57916) (ValueCellFull!1007 lt!57642)) (size!2337 (_values!2630 newMap!16))) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) lt!58030)))

(declare-fun bm!12029 () Bool)

(assert (=> bm!12029 (= call!12033 call!12031)))

(declare-fun b!112291 () Bool)

(declare-fun Unit!3482 () Unit!3461)

(assert (=> b!112291 (= e!72989 Unit!3482)))

(declare-fun b!112292 () Bool)

(assert (=> b!112292 (= e!72991 call!12033)))

(declare-fun b!112293 () Bool)

(declare-fun lt!58026 () Unit!3461)

(assert (=> b!112293 (= e!72989 lt!58026)))

(declare-fun lt!58018 () ListLongMap!1553)

(assert (=> b!112293 (= lt!58018 (getCurrentListMapNoExtraKeys!114 (_keys!4365 newMap!16) (array!4388 (store (arr!2079 (_values!2630 newMap!16)) (index!3176 lt!57916) (ValueCellFull!1007 lt!57642)) (size!2337 (_values!2630 newMap!16))) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58028 () (_ BitVec 64))

(assert (=> b!112293 (= lt!58028 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58021 () (_ BitVec 64))

(assert (=> b!112293 (= lt!58021 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58019 () Unit!3461)

(assert (=> b!112293 (= lt!58019 (addStillContains!77 lt!58018 lt!58028 (zeroValue!2516 newMap!16) lt!58021))))

(assert (=> b!112293 (contains!829 (+!147 lt!58018 (tuple2!2399 lt!58028 (zeroValue!2516 newMap!16))) lt!58021)))

(declare-fun lt!58038 () Unit!3461)

(assert (=> b!112293 (= lt!58038 lt!58019)))

(declare-fun lt!58036 () ListLongMap!1553)

(assert (=> b!112293 (= lt!58036 (getCurrentListMapNoExtraKeys!114 (_keys!4365 newMap!16) (array!4388 (store (arr!2079 (_values!2630 newMap!16)) (index!3176 lt!57916) (ValueCellFull!1007 lt!57642)) (size!2337 (_values!2630 newMap!16))) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58020 () (_ BitVec 64))

(assert (=> b!112293 (= lt!58020 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58024 () (_ BitVec 64))

(assert (=> b!112293 (= lt!58024 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58023 () Unit!3461)

(assert (=> b!112293 (= lt!58023 (addApplyDifferent!77 lt!58036 lt!58020 (minValue!2516 newMap!16) lt!58024))))

(assert (=> b!112293 (= (apply!101 (+!147 lt!58036 (tuple2!2399 lt!58020 (minValue!2516 newMap!16))) lt!58024) (apply!101 lt!58036 lt!58024))))

(declare-fun lt!58025 () Unit!3461)

(assert (=> b!112293 (= lt!58025 lt!58023)))

(declare-fun lt!58039 () ListLongMap!1553)

(assert (=> b!112293 (= lt!58039 (getCurrentListMapNoExtraKeys!114 (_keys!4365 newMap!16) (array!4388 (store (arr!2079 (_values!2630 newMap!16)) (index!3176 lt!57916) (ValueCellFull!1007 lt!57642)) (size!2337 (_values!2630 newMap!16))) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58032 () (_ BitVec 64))

(assert (=> b!112293 (= lt!58032 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58031 () (_ BitVec 64))

(assert (=> b!112293 (= lt!58031 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58027 () Unit!3461)

(assert (=> b!112293 (= lt!58027 (addApplyDifferent!77 lt!58039 lt!58032 (zeroValue!2516 newMap!16) lt!58031))))

(assert (=> b!112293 (= (apply!101 (+!147 lt!58039 (tuple2!2399 lt!58032 (zeroValue!2516 newMap!16))) lt!58031) (apply!101 lt!58039 lt!58031))))

(declare-fun lt!58033 () Unit!3461)

(assert (=> b!112293 (= lt!58033 lt!58027)))

(declare-fun lt!58034 () ListLongMap!1553)

(assert (=> b!112293 (= lt!58034 (getCurrentListMapNoExtraKeys!114 (_keys!4365 newMap!16) (array!4388 (store (arr!2079 (_values!2630 newMap!16)) (index!3176 lt!57916) (ValueCellFull!1007 lt!57642)) (size!2337 (_values!2630 newMap!16))) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58035 () (_ BitVec 64))

(assert (=> b!112293 (= lt!58035 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58029 () (_ BitVec 64))

(assert (=> b!112293 (= lt!58029 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112293 (= lt!58026 (addApplyDifferent!77 lt!58034 lt!58035 (minValue!2516 newMap!16) lt!58029))))

(assert (=> b!112293 (= (apply!101 (+!147 lt!58034 (tuple2!2399 lt!58035 (minValue!2516 newMap!16))) lt!58029) (apply!101 lt!58034 lt!58029))))

(declare-fun b!112294 () Bool)

(assert (=> b!112294 (= e!72995 e!72991)))

(declare-fun c!20065 () Bool)

(assert (=> b!112294 (= c!20065 (and (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12032 () Bool)

(assert (=> bm!12032 (= call!12031 (+!147 (ite c!20068 call!12035 (ite c!20065 call!12032 call!12037)) (ite (or c!20068 c!20065) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 newMap!16)) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 newMap!16)))))))

(declare-fun bm!12033 () Bool)

(assert (=> bm!12033 (= call!12035 (getCurrentListMapNoExtraKeys!114 (_keys!4365 newMap!16) (array!4388 (store (arr!2079 (_values!2630 newMap!16)) (index!3176 lt!57916) (ValueCellFull!1007 lt!57642)) (size!2337 (_values!2630 newMap!16))) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun b!112295 () Bool)

(declare-fun e!72997 () Bool)

(declare-fun call!12036 () Bool)

(assert (=> b!112295 (= e!72997 (not call!12036))))

(declare-fun b!112296 () Bool)

(assert (=> b!112296 (= e!72990 e!72997)))

(declare-fun c!20067 () Bool)

(assert (=> b!112296 (= c!20067 (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!112297 () Bool)

(declare-fun e!72987 () Bool)

(assert (=> b!112297 (= e!72987 (= (apply!101 lt!58030 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2516 newMap!16)))))

(declare-fun b!112298 () Bool)

(assert (=> b!112298 (= e!72997 e!72987)))

(declare-fun res!55379 () Bool)

(assert (=> b!112298 (= res!55379 call!12036)))

(assert (=> b!112298 (=> (not res!55379) (not e!72987))))

(declare-fun bm!12034 () Bool)

(assert (=> bm!12034 (= call!12036 (contains!829 lt!58030 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!31951 c!20068) b!112283))

(assert (= (and d!31951 (not c!20068)) b!112294))

(assert (= (and b!112294 c!20065) b!112292))

(assert (= (and b!112294 (not c!20065)) b!112286))

(assert (= (and b!112286 c!20066) b!112288))

(assert (= (and b!112286 (not c!20066)) b!112280))

(assert (= (or b!112288 b!112280) bm!12028))

(assert (= (or b!112292 bm!12028) bm!12031))

(assert (= (or b!112292 b!112288) bm!12029))

(assert (= (or b!112283 bm!12031) bm!12033))

(assert (= (or b!112283 bm!12029) bm!12032))

(assert (= (and d!31951 res!55378) b!112289))

(assert (= (and d!31951 c!20069) b!112293))

(assert (= (and d!31951 (not c!20069)) b!112291))

(assert (= (and d!31951 res!55384) b!112290))

(assert (= (and b!112290 res!55383) b!112279))

(assert (= (and b!112290 (not res!55382)) b!112284))

(assert (= (and b!112284 res!55376) b!112281))

(assert (= (and b!112290 res!55381) b!112287))

(assert (= (and b!112287 c!20070) b!112278))

(assert (= (and b!112287 (not c!20070)) b!112285))

(assert (= (and b!112278 res!55380) b!112282))

(assert (= (or b!112278 b!112285) bm!12030))

(assert (= (and b!112287 res!55377) b!112296))

(assert (= (and b!112296 c!20067) b!112298))

(assert (= (and b!112296 (not c!20067)) b!112295))

(assert (= (and b!112298 res!55379) b!112297))

(assert (= (or b!112298 b!112295) bm!12034))

(declare-fun b_lambda!5035 () Bool)

(assert (=> (not b_lambda!5035) (not b!112281)))

(declare-fun t!5778 () Bool)

(declare-fun tb!2125 () Bool)

(assert (=> (and b!111690 (= (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) (defaultEntry!2647 newMap!16)) t!5778) tb!2125))

(declare-fun result!3561 () Bool)

(assert (=> tb!2125 (= result!3561 tp_is_empty!2701)))

(assert (=> b!112281 t!5778))

(declare-fun b_and!6905 () Bool)

(assert (= b_and!6901 (and (=> t!5778 result!3561) b_and!6905)))

(declare-fun t!5780 () Bool)

(declare-fun tb!2127 () Bool)

(assert (=> (and b!111703 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 newMap!16)) t!5780) tb!2127))

(declare-fun result!3563 () Bool)

(assert (= result!3563 result!3561))

(assert (=> b!112281 t!5780))

(declare-fun b_and!6907 () Bool)

(assert (= b_and!6903 (and (=> t!5780 result!3563) b_and!6907)))

(assert (=> d!31951 m!128073))

(declare-fun m!128079 () Bool)

(assert (=> bm!12030 m!128079))

(assert (=> b!112289 m!127979))

(assert (=> b!112289 m!127979))

(assert (=> b!112289 m!127981))

(declare-fun m!128081 () Bool)

(assert (=> bm!12034 m!128081))

(declare-fun m!128083 () Bool)

(assert (=> b!112281 m!128083))

(declare-fun m!128085 () Bool)

(assert (=> b!112281 m!128085))

(assert (=> b!112281 m!127979))

(declare-fun m!128087 () Bool)

(assert (=> b!112281 m!128087))

(assert (=> b!112281 m!127979))

(assert (=> b!112281 m!128083))

(assert (=> b!112281 m!128085))

(declare-fun m!128089 () Bool)

(assert (=> b!112281 m!128089))

(declare-fun m!128091 () Bool)

(assert (=> b!112283 m!128091))

(declare-fun m!128093 () Bool)

(assert (=> bm!12033 m!128093))

(assert (=> b!112284 m!127979))

(assert (=> b!112284 m!127979))

(declare-fun m!128095 () Bool)

(assert (=> b!112284 m!128095))

(declare-fun m!128097 () Bool)

(assert (=> b!112293 m!128097))

(declare-fun m!128099 () Bool)

(assert (=> b!112293 m!128099))

(declare-fun m!128101 () Bool)

(assert (=> b!112293 m!128101))

(declare-fun m!128103 () Bool)

(assert (=> b!112293 m!128103))

(declare-fun m!128105 () Bool)

(assert (=> b!112293 m!128105))

(declare-fun m!128107 () Bool)

(assert (=> b!112293 m!128107))

(declare-fun m!128109 () Bool)

(assert (=> b!112293 m!128109))

(declare-fun m!128111 () Bool)

(assert (=> b!112293 m!128111))

(declare-fun m!128113 () Bool)

(assert (=> b!112293 m!128113))

(assert (=> b!112293 m!128109))

(declare-fun m!128115 () Bool)

(assert (=> b!112293 m!128115))

(declare-fun m!128117 () Bool)

(assert (=> b!112293 m!128117))

(declare-fun m!128119 () Bool)

(assert (=> b!112293 m!128119))

(assert (=> b!112293 m!128111))

(declare-fun m!128121 () Bool)

(assert (=> b!112293 m!128121))

(assert (=> b!112293 m!128093))

(declare-fun m!128123 () Bool)

(assert (=> b!112293 m!128123))

(assert (=> b!112293 m!128097))

(declare-fun m!128125 () Bool)

(assert (=> b!112293 m!128125))

(assert (=> b!112293 m!127979))

(assert (=> b!112293 m!128103))

(assert (=> b!112279 m!127979))

(assert (=> b!112279 m!127979))

(assert (=> b!112279 m!127981))

(declare-fun m!128127 () Bool)

(assert (=> b!112282 m!128127))

(declare-fun m!128129 () Bool)

(assert (=> b!112297 m!128129))

(declare-fun m!128131 () Bool)

(assert (=> bm!12032 m!128131))

(assert (=> b!112080 d!31951))

(declare-fun d!31953 () Bool)

(declare-fun e!73002 () Bool)

(assert (=> d!31953 e!73002))

(declare-fun res!55387 () Bool)

(assert (=> d!31953 (=> (not res!55387) (not e!73002))))

(assert (=> d!31953 (= res!55387 (and (bvsge (index!3176 lt!57916) #b00000000000000000000000000000000) (bvslt (index!3176 lt!57916) (size!2337 (_values!2630 newMap!16)))))))

(declare-fun lt!58042 () Unit!3461)

(declare-fun choose!710 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 32) (_ BitVec 64) V!3249 Int) Unit!3461)

(assert (=> d!31953 (= lt!58042 (choose!710 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (index!3176 lt!57916) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642 (defaultEntry!2647 newMap!16)))))

(assert (=> d!31953 (validMask!0 (mask!6825 newMap!16))))

(assert (=> d!31953 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!50 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (index!3176 lt!57916) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642 (defaultEntry!2647 newMap!16)) lt!58042)))

(declare-fun b!112301 () Bool)

(assert (=> b!112301 (= e!73002 (= (+!147 (getCurrentListMap!477 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)) (getCurrentListMap!477 (_keys!4365 newMap!16) (array!4388 (store (arr!2079 (_values!2630 newMap!16)) (index!3176 lt!57916) (ValueCellFull!1007 lt!57642)) (size!2337 (_values!2630 newMap!16))) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16))))))

(assert (= (and d!31953 res!55387) b!112301))

(assert (=> d!31953 m!127411))

(declare-fun m!128133 () Bool)

(assert (=> d!31953 m!128133))

(assert (=> d!31953 m!128073))

(assert (=> b!112301 m!127583))

(assert (=> b!112301 m!127583))

(declare-fun m!128135 () Bool)

(assert (=> b!112301 m!128135))

(assert (=> b!112301 m!127751))

(assert (=> b!112301 m!127753))

(assert (=> b!112080 d!31953))

(declare-fun d!31955 () Bool)

(declare-fun e!73004 () Bool)

(assert (=> d!31955 e!73004))

(declare-fun res!55388 () Bool)

(assert (=> d!31955 (=> res!55388 e!73004)))

(declare-fun lt!58044 () Bool)

(assert (=> d!31955 (= res!55388 (not lt!58044))))

(declare-fun lt!58043 () Bool)

(assert (=> d!31955 (= lt!58044 lt!58043)))

(declare-fun lt!58045 () Unit!3461)

(declare-fun e!73003 () Unit!3461)

(assert (=> d!31955 (= lt!58045 e!73003)))

(declare-fun c!20071 () Bool)

(assert (=> d!31955 (= c!20071 lt!58043)))

(assert (=> d!31955 (= lt!58043 (containsKey!163 (toList!792 call!12011) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> d!31955 (= (contains!829 call!12011 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) lt!58044)))

(declare-fun b!112302 () Bool)

(declare-fun lt!58046 () Unit!3461)

(assert (=> b!112302 (= e!73003 lt!58046)))

(assert (=> b!112302 (= lt!58046 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 call!12011) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> b!112302 (isDefined!112 (getValueByKey!160 (toList!792 call!12011) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!112303 () Bool)

(declare-fun Unit!3483 () Unit!3461)

(assert (=> b!112303 (= e!73003 Unit!3483)))

(declare-fun b!112304 () Bool)

(assert (=> b!112304 (= e!73004 (isDefined!112 (getValueByKey!160 (toList!792 call!12011) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355))))))

(assert (= (and d!31955 c!20071) b!112302))

(assert (= (and d!31955 (not c!20071)) b!112303))

(assert (= (and d!31955 (not res!55388)) b!112304))

(assert (=> d!31955 m!127411))

(declare-fun m!128137 () Bool)

(assert (=> d!31955 m!128137))

(assert (=> b!112302 m!127411))

(declare-fun m!128139 () Bool)

(assert (=> b!112302 m!128139))

(assert (=> b!112302 m!127411))

(declare-fun m!128141 () Bool)

(assert (=> b!112302 m!128141))

(assert (=> b!112302 m!128141))

(declare-fun m!128143 () Bool)

(assert (=> b!112302 m!128143))

(assert (=> b!112304 m!127411))

(assert (=> b!112304 m!128141))

(assert (=> b!112304 m!128141))

(assert (=> b!112304 m!128143))

(assert (=> b!112080 d!31955))

(declare-fun d!31957 () Bool)

(declare-fun e!73007 () Bool)

(assert (=> d!31957 e!73007))

(declare-fun c!20074 () Bool)

(assert (=> d!31957 (= c!20074 (and (not (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!31957 true))

(declare-fun _$29!150 () Unit!3461)

(assert (=> d!31957 (= (choose!704 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (_values!2630 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992))) (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) (zeroValue!2516 (v!2946 (underlying!373 thiss!992))) (minValue!2516 (v!2946 (underlying!373 thiss!992))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992)))) _$29!150)))

(declare-fun b!112309 () Bool)

(assert (=> b!112309 (= e!73007 (arrayContainsKey!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!112310 () Bool)

(assert (=> b!112310 (= e!73007 (ite (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2440 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!31957 c!20074) b!112309))

(assert (= (and d!31957 (not c!20074)) b!112310))

(assert (=> b!112309 m!127411))

(assert (=> b!112309 m!127449))

(assert (=> d!31837 d!31957))

(assert (=> d!31837 d!31857))

(declare-fun d!31959 () Bool)

(assert (=> d!31959 (= (map!1299 (_2!1211 lt!57911)) (getCurrentListMap!477 (_keys!4365 (_2!1211 lt!57911)) (_values!2630 (_2!1211 lt!57911)) (mask!6825 (_2!1211 lt!57911)) (extraKeys!2440 (_2!1211 lt!57911)) (zeroValue!2516 (_2!1211 lt!57911)) (minValue!2516 (_2!1211 lt!57911)) #b00000000000000000000000000000000 (defaultEntry!2647 (_2!1211 lt!57911))))))

(declare-fun bs!4630 () Bool)

(assert (= bs!4630 d!31959))

(declare-fun m!128145 () Bool)

(assert (=> bs!4630 m!128145))

(assert (=> bm!11997 d!31959))

(declare-fun b!112319 () Bool)

(declare-fun e!73012 () (_ BitVec 32))

(declare-fun call!12040 () (_ BitVec 32))

(assert (=> b!112319 (= e!73012 (bvadd #b00000000000000000000000000000001 call!12040))))

(declare-fun b!112320 () Bool)

(assert (=> b!112320 (= e!73012 call!12040)))

(declare-fun b!112321 () Bool)

(declare-fun e!73013 () (_ BitVec 32))

(assert (=> b!112321 (= e!73013 e!73012)))

(declare-fun c!20080 () Bool)

(assert (=> b!112321 (= c!20080 (validKeyInArray!0 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112322 () Bool)

(assert (=> b!112322 (= e!73013 #b00000000000000000000000000000000)))

(declare-fun bm!12037 () Bool)

(assert (=> bm!12037 (= call!12040 (arrayCountValidKeys!0 (_keys!4365 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2336 (_keys!4365 newMap!16))))))

(declare-fun d!31961 () Bool)

(declare-fun lt!58049 () (_ BitVec 32))

(assert (=> d!31961 (and (bvsge lt!58049 #b00000000000000000000000000000000) (bvsle lt!58049 (bvsub (size!2336 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!31961 (= lt!58049 e!73013)))

(declare-fun c!20079 () Bool)

(assert (=> d!31961 (= c!20079 (bvsge #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))

(assert (=> d!31961 (and (bvsle #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2336 (_keys!4365 newMap!16)) (size!2336 (_keys!4365 newMap!16))))))

(assert (=> d!31961 (= (arrayCountValidKeys!0 (_keys!4365 newMap!16) #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))) lt!58049)))

(assert (= (and d!31961 c!20079) b!112322))

(assert (= (and d!31961 (not c!20079)) b!112321))

(assert (= (and b!112321 c!20080) b!112319))

(assert (= (and b!112321 (not c!20080)) b!112320))

(assert (= (or b!112319 b!112320) bm!12037))

(assert (=> b!112321 m!127979))

(assert (=> b!112321 m!127979))

(assert (=> b!112321 m!127981))

(declare-fun m!128147 () Bool)

(assert (=> bm!12037 m!128147))

(assert (=> b!112115 d!31961))

(declare-fun b!112323 () Bool)

(declare-fun e!73014 () Option!166)

(assert (=> b!112323 (= e!73014 (Some!165 (_2!1210 (h!2209 (toList!792 lt!57823)))))))

(declare-fun b!112326 () Bool)

(declare-fun e!73015 () Option!166)

(assert (=> b!112326 (= e!73015 None!164)))

(declare-fun b!112324 () Bool)

(assert (=> b!112324 (= e!73014 e!73015)))

(declare-fun c!20082 () Bool)

(assert (=> b!112324 (= c!20082 (and ((_ is Cons!1609) (toList!792 lt!57823)) (not (= (_1!1210 (h!2209 (toList!792 lt!57823))) (_1!1210 lt!57633)))))))

(declare-fun d!31963 () Bool)

(declare-fun c!20081 () Bool)

(assert (=> d!31963 (= c!20081 (and ((_ is Cons!1609) (toList!792 lt!57823)) (= (_1!1210 (h!2209 (toList!792 lt!57823))) (_1!1210 lt!57633))))))

(assert (=> d!31963 (= (getValueByKey!160 (toList!792 lt!57823) (_1!1210 lt!57633)) e!73014)))

(declare-fun b!112325 () Bool)

(assert (=> b!112325 (= e!73015 (getValueByKey!160 (t!5763 (toList!792 lt!57823)) (_1!1210 lt!57633)))))

(assert (= (and d!31963 c!20081) b!112323))

(assert (= (and d!31963 (not c!20081)) b!112324))

(assert (= (and b!112324 c!20082) b!112325))

(assert (= (and b!112324 (not c!20082)) b!112326))

(declare-fun m!128149 () Bool)

(assert (=> b!112325 m!128149))

(assert (=> b!111968 d!31963))

(declare-fun b!112327 () Bool)

(declare-fun e!73018 () Bool)

(declare-fun e!73016 () Bool)

(assert (=> b!112327 (= e!73018 e!73016)))

(declare-fun lt!58050 () (_ BitVec 64))

(assert (=> b!112327 (= lt!58050 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!58052 () Unit!3461)

(assert (=> b!112327 (= lt!58052 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) lt!58050 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!112327 (arrayContainsKey!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) lt!58050 #b00000000000000000000000000000000)))

(declare-fun lt!58051 () Unit!3461)

(assert (=> b!112327 (= lt!58051 lt!58052)))

(declare-fun res!55390 () Bool)

(assert (=> b!112327 (= res!55390 (= (seekEntryOrOpen!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4365 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992)))) (Found!256 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!112327 (=> (not res!55390) (not e!73016))))

(declare-fun b!112328 () Bool)

(declare-fun call!12041 () Bool)

(assert (=> b!112328 (= e!73018 call!12041)))

(declare-fun b!112329 () Bool)

(assert (=> b!112329 (= e!73016 call!12041)))

(declare-fun b!112330 () Bool)

(declare-fun e!73017 () Bool)

(assert (=> b!112330 (= e!73017 e!73018)))

(declare-fun c!20083 () Bool)

(assert (=> b!112330 (= c!20083 (validKeyInArray!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!31965 () Bool)

(declare-fun res!55389 () Bool)

(assert (=> d!31965 (=> res!55389 e!73017)))

(assert (=> d!31965 (= res!55389 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> d!31965 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4365 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992)))) e!73017)))

(declare-fun bm!12038 () Bool)

(assert (=> bm!12038 (= call!12041 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4365 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992)))))))

(assert (= (and d!31965 (not res!55389)) b!112330))

(assert (= (and b!112330 c!20083) b!112327))

(assert (= (and b!112330 (not c!20083)) b!112328))

(assert (= (and b!112327 res!55390) b!112329))

(assert (= (or b!112329 b!112328) bm!12038))

(declare-fun m!128151 () Bool)

(assert (=> b!112327 m!128151))

(declare-fun m!128153 () Bool)

(assert (=> b!112327 m!128153))

(declare-fun m!128155 () Bool)

(assert (=> b!112327 m!128155))

(assert (=> b!112327 m!128151))

(declare-fun m!128157 () Bool)

(assert (=> b!112327 m!128157))

(assert (=> b!112330 m!128151))

(assert (=> b!112330 m!128151))

(declare-fun m!128159 () Bool)

(assert (=> b!112330 m!128159))

(declare-fun m!128161 () Bool)

(assert (=> bm!12038 m!128161))

(assert (=> bm!12013 d!31965))

(declare-fun b!112331 () Bool)

(declare-fun e!73024 () Bool)

(declare-fun e!73026 () Bool)

(assert (=> b!112331 (= e!73024 e!73026)))

(declare-fun res!55395 () Bool)

(declare-fun call!12045 () Bool)

(assert (=> b!112331 (= res!55395 call!12045)))

(assert (=> b!112331 (=> (not res!55395) (not e!73026))))

(declare-fun bm!12039 () Bool)

(declare-fun call!12048 () ListLongMap!1553)

(declare-fun call!12043 () ListLongMap!1553)

(assert (=> bm!12039 (= call!12048 call!12043)))

(declare-fun b!112332 () Bool)

(declare-fun e!73020 () Bool)

(assert (=> b!112332 (= e!73020 (validKeyInArray!0 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112333 () Bool)

(declare-fun e!73030 () ListLongMap!1553)

(assert (=> b!112333 (= e!73030 call!12048)))

(declare-fun bm!12041 () Bool)

(declare-fun lt!58065 () ListLongMap!1553)

(assert (=> bm!12041 (= call!12045 (contains!829 lt!58065 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112334 () Bool)

(declare-fun e!73031 () Bool)

(assert (=> b!112334 (= e!73031 (= (apply!101 lt!58065 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)) (get!1359 (select (arr!2079 (_values!2630 newMap!16)) #b00000000000000000000000000000000) (dynLambda!391 (defaultEntry!2647 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112334 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2337 (_values!2630 newMap!16))))))

(assert (=> b!112334 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))

(declare-fun b!112335 () Bool)

(assert (=> b!112335 (= e!73026 (= (apply!101 lt!58065 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2516 newMap!16)))))

(declare-fun b!112336 () Bool)

(declare-fun e!73027 () ListLongMap!1553)

(declare-fun call!12042 () ListLongMap!1553)

(assert (=> b!112336 (= e!73027 (+!147 call!12042 (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 newMap!16))))))

(declare-fun b!112337 () Bool)

(declare-fun e!73028 () Bool)

(assert (=> b!112337 (= e!73028 e!73031)))

(declare-fun res!55391 () Bool)

(assert (=> b!112337 (=> (not res!55391) (not e!73031))))

(assert (=> b!112337 (= res!55391 (contains!829 lt!58065 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!112337 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))

(declare-fun b!112338 () Bool)

(assert (=> b!112338 (= e!73024 (not call!12045))))

(declare-fun b!112339 () Bool)

(declare-fun c!20085 () Bool)

(assert (=> b!112339 (= c!20085 (and (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!73023 () ListLongMap!1553)

(assert (=> b!112339 (= e!73023 e!73030)))

(declare-fun b!112340 () Bool)

(declare-fun res!55392 () Bool)

(declare-fun e!73022 () Bool)

(assert (=> b!112340 (=> (not res!55392) (not e!73022))))

(assert (=> b!112340 (= res!55392 e!73024)))

(declare-fun c!20089 () Bool)

(assert (=> b!112340 (= c!20089 (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!112341 () Bool)

(declare-fun call!12044 () ListLongMap!1553)

(assert (=> b!112341 (= e!73030 call!12044)))

(declare-fun b!112342 () Bool)

(declare-fun e!73025 () Bool)

(assert (=> b!112342 (= e!73025 (validKeyInArray!0 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12042 () Bool)

(declare-fun call!12046 () ListLongMap!1553)

(assert (=> bm!12042 (= call!12043 call!12046)))

(declare-fun b!112343 () Bool)

(declare-fun res!55396 () Bool)

(assert (=> b!112343 (=> (not res!55396) (not e!73022))))

(assert (=> b!112343 (= res!55396 e!73028)))

(declare-fun res!55397 () Bool)

(assert (=> b!112343 (=> res!55397 e!73028)))

(assert (=> b!112343 (= res!55397 (not e!73020))))

(declare-fun res!55398 () Bool)

(assert (=> b!112343 (=> (not res!55398) (not e!73020))))

(assert (=> b!112343 (= res!55398 (bvslt #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))

(declare-fun d!31967 () Bool)

(assert (=> d!31967 e!73022))

(declare-fun res!55399 () Bool)

(assert (=> d!31967 (=> (not res!55399) (not e!73022))))

(assert (=> d!31967 (= res!55399 (or (bvsge #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))))

(declare-fun lt!58072 () ListLongMap!1553)

(assert (=> d!31967 (= lt!58065 lt!58072)))

(declare-fun lt!58057 () Unit!3461)

(declare-fun e!73021 () Unit!3461)

(assert (=> d!31967 (= lt!58057 e!73021)))

(declare-fun c!20088 () Bool)

(assert (=> d!31967 (= c!20088 e!73025)))

(declare-fun res!55393 () Bool)

(assert (=> d!31967 (=> (not res!55393) (not e!73025))))

(assert (=> d!31967 (= res!55393 (bvslt #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))

(assert (=> d!31967 (= lt!58072 e!73027)))

(declare-fun c!20087 () Bool)

(assert (=> d!31967 (= c!20087 (and (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!31967 (validMask!0 (mask!6825 newMap!16))))

(assert (=> d!31967 (= (getCurrentListMap!477 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) lt!58065)))

(declare-fun bm!12040 () Bool)

(assert (=> bm!12040 (= call!12044 call!12042)))

(declare-fun b!112344 () Bool)

(declare-fun Unit!3484 () Unit!3461)

(assert (=> b!112344 (= e!73021 Unit!3484)))

(declare-fun b!112345 () Bool)

(assert (=> b!112345 (= e!73023 call!12044)))

(declare-fun b!112346 () Bool)

(declare-fun lt!58061 () Unit!3461)

(assert (=> b!112346 (= e!73021 lt!58061)))

(declare-fun lt!58053 () ListLongMap!1553)

(assert (=> b!112346 (= lt!58053 (getCurrentListMapNoExtraKeys!114 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58063 () (_ BitVec 64))

(assert (=> b!112346 (= lt!58063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58056 () (_ BitVec 64))

(assert (=> b!112346 (= lt!58056 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58054 () Unit!3461)

(assert (=> b!112346 (= lt!58054 (addStillContains!77 lt!58053 lt!58063 (zeroValue!2516 newMap!16) lt!58056))))

(assert (=> b!112346 (contains!829 (+!147 lt!58053 (tuple2!2399 lt!58063 (zeroValue!2516 newMap!16))) lt!58056)))

(declare-fun lt!58073 () Unit!3461)

(assert (=> b!112346 (= lt!58073 lt!58054)))

(declare-fun lt!58071 () ListLongMap!1553)

(assert (=> b!112346 (= lt!58071 (getCurrentListMapNoExtraKeys!114 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58055 () (_ BitVec 64))

(assert (=> b!112346 (= lt!58055 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58059 () (_ BitVec 64))

(assert (=> b!112346 (= lt!58059 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58058 () Unit!3461)

(assert (=> b!112346 (= lt!58058 (addApplyDifferent!77 lt!58071 lt!58055 (minValue!2516 newMap!16) lt!58059))))

(assert (=> b!112346 (= (apply!101 (+!147 lt!58071 (tuple2!2399 lt!58055 (minValue!2516 newMap!16))) lt!58059) (apply!101 lt!58071 lt!58059))))

(declare-fun lt!58060 () Unit!3461)

(assert (=> b!112346 (= lt!58060 lt!58058)))

(declare-fun lt!58074 () ListLongMap!1553)

(assert (=> b!112346 (= lt!58074 (getCurrentListMapNoExtraKeys!114 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58067 () (_ BitVec 64))

(assert (=> b!112346 (= lt!58067 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58066 () (_ BitVec 64))

(assert (=> b!112346 (= lt!58066 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58062 () Unit!3461)

(assert (=> b!112346 (= lt!58062 (addApplyDifferent!77 lt!58074 lt!58067 (zeroValue!2516 newMap!16) lt!58066))))

(assert (=> b!112346 (= (apply!101 (+!147 lt!58074 (tuple2!2399 lt!58067 (zeroValue!2516 newMap!16))) lt!58066) (apply!101 lt!58074 lt!58066))))

(declare-fun lt!58068 () Unit!3461)

(assert (=> b!112346 (= lt!58068 lt!58062)))

(declare-fun lt!58069 () ListLongMap!1553)

(assert (=> b!112346 (= lt!58069 (getCurrentListMapNoExtraKeys!114 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58070 () (_ BitVec 64))

(assert (=> b!112346 (= lt!58070 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58064 () (_ BitVec 64))

(assert (=> b!112346 (= lt!58064 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112346 (= lt!58061 (addApplyDifferent!77 lt!58069 lt!58070 (minValue!2516 newMap!16) lt!58064))))

(assert (=> b!112346 (= (apply!101 (+!147 lt!58069 (tuple2!2399 lt!58070 (minValue!2516 newMap!16))) lt!58064) (apply!101 lt!58069 lt!58064))))

(declare-fun b!112347 () Bool)

(assert (=> b!112347 (= e!73027 e!73023)))

(declare-fun c!20084 () Bool)

(assert (=> b!112347 (= c!20084 (and (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12043 () Bool)

(assert (=> bm!12043 (= call!12042 (+!147 (ite c!20087 call!12046 (ite c!20084 call!12043 call!12048)) (ite (or c!20087 c!20084) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 newMap!16)) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 newMap!16)))))))

(declare-fun bm!12044 () Bool)

(assert (=> bm!12044 (= call!12046 (getCurrentListMapNoExtraKeys!114 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun b!112348 () Bool)

(declare-fun e!73029 () Bool)

(declare-fun call!12047 () Bool)

(assert (=> b!112348 (= e!73029 (not call!12047))))

(declare-fun b!112349 () Bool)

(assert (=> b!112349 (= e!73022 e!73029)))

(declare-fun c!20086 () Bool)

(assert (=> b!112349 (= c!20086 (not (= (bvand (extraKeys!2440 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!112350 () Bool)

(declare-fun e!73019 () Bool)

(assert (=> b!112350 (= e!73019 (= (apply!101 lt!58065 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2516 newMap!16)))))

(declare-fun b!112351 () Bool)

(assert (=> b!112351 (= e!73029 e!73019)))

(declare-fun res!55394 () Bool)

(assert (=> b!112351 (= res!55394 call!12047)))

(assert (=> b!112351 (=> (not res!55394) (not e!73019))))

(declare-fun bm!12045 () Bool)

(assert (=> bm!12045 (= call!12047 (contains!829 lt!58065 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!31967 c!20087) b!112336))

(assert (= (and d!31967 (not c!20087)) b!112347))

(assert (= (and b!112347 c!20084) b!112345))

(assert (= (and b!112347 (not c!20084)) b!112339))

(assert (= (and b!112339 c!20085) b!112341))

(assert (= (and b!112339 (not c!20085)) b!112333))

(assert (= (or b!112341 b!112333) bm!12039))

(assert (= (or b!112345 bm!12039) bm!12042))

(assert (= (or b!112345 b!112341) bm!12040))

(assert (= (or b!112336 bm!12042) bm!12044))

(assert (= (or b!112336 bm!12040) bm!12043))

(assert (= (and d!31967 res!55393) b!112342))

(assert (= (and d!31967 c!20088) b!112346))

(assert (= (and d!31967 (not c!20088)) b!112344))

(assert (= (and d!31967 res!55399) b!112343))

(assert (= (and b!112343 res!55398) b!112332))

(assert (= (and b!112343 (not res!55397)) b!112337))

(assert (= (and b!112337 res!55391) b!112334))

(assert (= (and b!112343 res!55396) b!112340))

(assert (= (and b!112340 c!20089) b!112331))

(assert (= (and b!112340 (not c!20089)) b!112338))

(assert (= (and b!112331 res!55395) b!112335))

(assert (= (or b!112331 b!112338) bm!12041))

(assert (= (and b!112340 res!55392) b!112349))

(assert (= (and b!112349 c!20086) b!112351))

(assert (= (and b!112349 (not c!20086)) b!112348))

(assert (= (and b!112351 res!55394) b!112350))

(assert (= (or b!112351 b!112348) bm!12045))

(declare-fun b_lambda!5037 () Bool)

(assert (=> (not b_lambda!5037) (not b!112334)))

(assert (=> b!112334 t!5778))

(declare-fun b_and!6909 () Bool)

(assert (= b_and!6905 (and (=> t!5778 result!3561) b_and!6909)))

(assert (=> b!112334 t!5780))

(declare-fun b_and!6911 () Bool)

(assert (= b_and!6907 (and (=> t!5780 result!3563) b_and!6911)))

(assert (=> d!31967 m!128073))

(declare-fun m!128163 () Bool)

(assert (=> bm!12041 m!128163))

(assert (=> b!112342 m!127979))

(assert (=> b!112342 m!127979))

(assert (=> b!112342 m!127981))

(declare-fun m!128165 () Bool)

(assert (=> bm!12045 m!128165))

(declare-fun m!128167 () Bool)

(assert (=> b!112334 m!128167))

(assert (=> b!112334 m!128085))

(assert (=> b!112334 m!127979))

(declare-fun m!128169 () Bool)

(assert (=> b!112334 m!128169))

(assert (=> b!112334 m!127979))

(assert (=> b!112334 m!128167))

(assert (=> b!112334 m!128085))

(declare-fun m!128171 () Bool)

(assert (=> b!112334 m!128171))

(declare-fun m!128173 () Bool)

(assert (=> b!112336 m!128173))

(declare-fun m!128175 () Bool)

(assert (=> bm!12044 m!128175))

(assert (=> b!112337 m!127979))

(assert (=> b!112337 m!127979))

(declare-fun m!128177 () Bool)

(assert (=> b!112337 m!128177))

(declare-fun m!128179 () Bool)

(assert (=> b!112346 m!128179))

(declare-fun m!128181 () Bool)

(assert (=> b!112346 m!128181))

(declare-fun m!128183 () Bool)

(assert (=> b!112346 m!128183))

(declare-fun m!128185 () Bool)

(assert (=> b!112346 m!128185))

(declare-fun m!128187 () Bool)

(assert (=> b!112346 m!128187))

(declare-fun m!128189 () Bool)

(assert (=> b!112346 m!128189))

(declare-fun m!128191 () Bool)

(assert (=> b!112346 m!128191))

(declare-fun m!128193 () Bool)

(assert (=> b!112346 m!128193))

(declare-fun m!128195 () Bool)

(assert (=> b!112346 m!128195))

(assert (=> b!112346 m!128191))

(declare-fun m!128197 () Bool)

(assert (=> b!112346 m!128197))

(declare-fun m!128199 () Bool)

(assert (=> b!112346 m!128199))

(declare-fun m!128201 () Bool)

(assert (=> b!112346 m!128201))

(assert (=> b!112346 m!128193))

(declare-fun m!128203 () Bool)

(assert (=> b!112346 m!128203))

(assert (=> b!112346 m!128175))

(declare-fun m!128205 () Bool)

(assert (=> b!112346 m!128205))

(assert (=> b!112346 m!128179))

(declare-fun m!128207 () Bool)

(assert (=> b!112346 m!128207))

(assert (=> b!112346 m!127979))

(assert (=> b!112346 m!128185))

(assert (=> b!112332 m!127979))

(assert (=> b!112332 m!127979))

(assert (=> b!112332 m!127981))

(declare-fun m!128209 () Bool)

(assert (=> b!112335 m!128209))

(declare-fun m!128211 () Bool)

(assert (=> b!112350 m!128211))

(declare-fun m!128213 () Bool)

(assert (=> bm!12043 m!128213))

(assert (=> d!31825 d!31967))

(declare-fun d!31969 () Bool)

(declare-fun e!73033 () Bool)

(assert (=> d!31969 e!73033))

(declare-fun res!55400 () Bool)

(assert (=> d!31969 (=> res!55400 e!73033)))

(declare-fun lt!58076 () Bool)

(assert (=> d!31969 (= res!55400 (not lt!58076))))

(declare-fun lt!58075 () Bool)

(assert (=> d!31969 (= lt!58076 lt!58075)))

(declare-fun lt!58077 () Unit!3461)

(declare-fun e!73032 () Unit!3461)

(assert (=> d!31969 (= lt!58077 e!73032)))

(declare-fun c!20090 () Bool)

(assert (=> d!31969 (= c!20090 lt!58075)))

(assert (=> d!31969 (= lt!58075 (containsKey!163 (toList!792 call!12009) (ite c!20008 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (select (arr!2078 (_keys!4365 newMap!16)) (index!3176 lt!57916)))))))

(assert (=> d!31969 (= (contains!829 call!12009 (ite c!20008 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (select (arr!2078 (_keys!4365 newMap!16)) (index!3176 lt!57916)))) lt!58076)))

(declare-fun b!112352 () Bool)

(declare-fun lt!58078 () Unit!3461)

(assert (=> b!112352 (= e!73032 lt!58078)))

(assert (=> b!112352 (= lt!58078 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 call!12009) (ite c!20008 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (select (arr!2078 (_keys!4365 newMap!16)) (index!3176 lt!57916)))))))

(assert (=> b!112352 (isDefined!112 (getValueByKey!160 (toList!792 call!12009) (ite c!20008 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (select (arr!2078 (_keys!4365 newMap!16)) (index!3176 lt!57916)))))))

(declare-fun b!112353 () Bool)

(declare-fun Unit!3485 () Unit!3461)

(assert (=> b!112353 (= e!73032 Unit!3485)))

(declare-fun b!112354 () Bool)

(assert (=> b!112354 (= e!73033 (isDefined!112 (getValueByKey!160 (toList!792 call!12009) (ite c!20008 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (select (arr!2078 (_keys!4365 newMap!16)) (index!3176 lt!57916))))))))

(assert (= (and d!31969 c!20090) b!112352))

(assert (= (and d!31969 (not c!20090)) b!112353))

(assert (= (and d!31969 (not res!55400)) b!112354))

(declare-fun m!128215 () Bool)

(assert (=> d!31969 m!128215))

(declare-fun m!128217 () Bool)

(assert (=> b!112352 m!128217))

(declare-fun m!128219 () Bool)

(assert (=> b!112352 m!128219))

(assert (=> b!112352 m!128219))

(declare-fun m!128221 () Bool)

(assert (=> b!112352 m!128221))

(assert (=> b!112354 m!128219))

(assert (=> b!112354 m!128219))

(assert (=> b!112354 m!128221))

(assert (=> bm!11991 d!31969))

(declare-fun b!112355 () Bool)

(declare-fun e!73034 () SeekEntryResult!256)

(declare-fun e!73035 () SeekEntryResult!256)

(assert (=> b!112355 (= e!73034 e!73035)))

(declare-fun lt!58079 () (_ BitVec 64))

(declare-fun lt!58081 () SeekEntryResult!256)

(assert (=> b!112355 (= lt!58079 (select (arr!2078 (_keys!4365 newMap!16)) (index!3177 lt!58081)))))

(declare-fun c!20092 () Bool)

(assert (=> b!112355 (= c!20092 (= lt!58079 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!112356 () Bool)

(assert (=> b!112356 (= e!73034 Undefined!256)))

(declare-fun b!112357 () Bool)

(assert (=> b!112357 (= e!73035 (Found!256 (index!3177 lt!58081)))))

(declare-fun d!31971 () Bool)

(declare-fun lt!58080 () SeekEntryResult!256)

(assert (=> d!31971 (and (or ((_ is Undefined!256) lt!58080) (not ((_ is Found!256) lt!58080)) (and (bvsge (index!3176 lt!58080) #b00000000000000000000000000000000) (bvslt (index!3176 lt!58080) (size!2336 (_keys!4365 newMap!16))))) (or ((_ is Undefined!256) lt!58080) ((_ is Found!256) lt!58080) (not ((_ is MissingZero!256) lt!58080)) (and (bvsge (index!3175 lt!58080) #b00000000000000000000000000000000) (bvslt (index!3175 lt!58080) (size!2336 (_keys!4365 newMap!16))))) (or ((_ is Undefined!256) lt!58080) ((_ is Found!256) lt!58080) ((_ is MissingZero!256) lt!58080) (not ((_ is MissingVacant!256) lt!58080)) (and (bvsge (index!3178 lt!58080) #b00000000000000000000000000000000) (bvslt (index!3178 lt!58080) (size!2336 (_keys!4365 newMap!16))))) (or ((_ is Undefined!256) lt!58080) (ite ((_ is Found!256) lt!58080) (= (select (arr!2078 (_keys!4365 newMap!16)) (index!3176 lt!58080)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) (ite ((_ is MissingZero!256) lt!58080) (= (select (arr!2078 (_keys!4365 newMap!16)) (index!3175 lt!58080)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!256) lt!58080) (= (select (arr!2078 (_keys!4365 newMap!16)) (index!3178 lt!58080)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!31971 (= lt!58080 e!73034)))

(declare-fun c!20093 () Bool)

(assert (=> d!31971 (= c!20093 (and ((_ is Intermediate!256) lt!58081) (undefined!1068 lt!58081)))))

(assert (=> d!31971 (= lt!58081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (mask!6825 newMap!16)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4365 newMap!16) (mask!6825 newMap!16)))))

(assert (=> d!31971 (validMask!0 (mask!6825 newMap!16))))

(assert (=> d!31971 (= (seekEntryOrOpen!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4365 newMap!16) (mask!6825 newMap!16)) lt!58080)))

(declare-fun b!112358 () Bool)

(declare-fun c!20091 () Bool)

(assert (=> b!112358 (= c!20091 (= lt!58079 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!73036 () SeekEntryResult!256)

(assert (=> b!112358 (= e!73035 e!73036)))

(declare-fun b!112359 () Bool)

(assert (=> b!112359 (= e!73036 (MissingZero!256 (index!3177 lt!58081)))))

(declare-fun b!112360 () Bool)

(assert (=> b!112360 (= e!73036 (seekKeyOrZeroReturnVacant!0 (x!14088 lt!58081) (index!3177 lt!58081) (index!3177 lt!58081) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4365 newMap!16) (mask!6825 newMap!16)))))

(assert (= (and d!31971 c!20093) b!112356))

(assert (= (and d!31971 (not c!20093)) b!112355))

(assert (= (and b!112355 c!20092) b!112357))

(assert (= (and b!112355 (not c!20092)) b!112358))

(assert (= (and b!112358 c!20091) b!112359))

(assert (= (and b!112358 (not c!20091)) b!112360))

(declare-fun m!128223 () Bool)

(assert (=> b!112355 m!128223))

(declare-fun m!128225 () Bool)

(assert (=> d!31971 m!128225))

(assert (=> d!31971 m!127411))

(declare-fun m!128227 () Bool)

(assert (=> d!31971 m!128227))

(assert (=> d!31971 m!128073))

(assert (=> d!31971 m!127411))

(assert (=> d!31971 m!128225))

(declare-fun m!128229 () Bool)

(assert (=> d!31971 m!128229))

(declare-fun m!128231 () Bool)

(assert (=> d!31971 m!128231))

(declare-fun m!128233 () Bool)

(assert (=> d!31971 m!128233))

(assert (=> b!112360 m!127411))

(declare-fun m!128235 () Bool)

(assert (=> b!112360 m!128235))

(assert (=> b!112083 d!31971))

(declare-fun d!31973 () Bool)

(assert (=> d!31973 (= (apply!101 lt!57807 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1364 (getValueByKey!160 (toList!792 lt!57807) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4631 () Bool)

(assert (= bs!4631 d!31973))

(assert (=> bs!4631 m!127587))

(assert (=> bs!4631 m!127991))

(assert (=> bs!4631 m!127991))

(declare-fun m!128237 () Bool)

(assert (=> bs!4631 m!128237))

(assert (=> b!111960 d!31973))

(assert (=> b!111960 d!31917))

(assert (=> bm!12001 d!31971))

(declare-fun d!31975 () Bool)

(declare-fun isEmpty!386 (Option!166) Bool)

(assert (=> d!31975 (= (isDefined!112 (getValueByKey!160 (toList!792 lt!57635) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355))) (not (isEmpty!386 (getValueByKey!160 (toList!792 lt!57635) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))))

(declare-fun bs!4632 () Bool)

(assert (= bs!4632 d!31975))

(assert (=> bs!4632 m!127737))

(declare-fun m!128239 () Bool)

(assert (=> bs!4632 m!128239))

(assert (=> b!111982 d!31975))

(declare-fun b!112361 () Bool)

(declare-fun e!73037 () Option!166)

(assert (=> b!112361 (= e!73037 (Some!165 (_2!1210 (h!2209 (toList!792 lt!57635)))))))

(declare-fun b!112364 () Bool)

(declare-fun e!73038 () Option!166)

(assert (=> b!112364 (= e!73038 None!164)))

(declare-fun b!112362 () Bool)

(assert (=> b!112362 (= e!73037 e!73038)))

(declare-fun c!20095 () Bool)

(assert (=> b!112362 (= c!20095 (and ((_ is Cons!1609) (toList!792 lt!57635)) (not (= (_1!1210 (h!2209 (toList!792 lt!57635))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))))

(declare-fun c!20094 () Bool)

(declare-fun d!31977 () Bool)

(assert (=> d!31977 (= c!20094 (and ((_ is Cons!1609) (toList!792 lt!57635)) (= (_1!1210 (h!2209 (toList!792 lt!57635))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355))))))

(assert (=> d!31977 (= (getValueByKey!160 (toList!792 lt!57635) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) e!73037)))

(declare-fun b!112363 () Bool)

(assert (=> b!112363 (= e!73038 (getValueByKey!160 (t!5763 (toList!792 lt!57635)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (= (and d!31977 c!20094) b!112361))

(assert (= (and d!31977 (not c!20094)) b!112362))

(assert (= (and b!112362 c!20095) b!112363))

(assert (= (and b!112362 (not c!20095)) b!112364))

(assert (=> b!112363 m!127411))

(declare-fun m!128241 () Bool)

(assert (=> b!112363 m!128241))

(assert (=> b!111982 d!31977))

(declare-fun b!112365 () Bool)

(declare-fun e!73039 () Option!166)

(assert (=> b!112365 (= e!73039 (Some!165 (_2!1210 (h!2209 (toList!792 lt!57819)))))))

(declare-fun b!112368 () Bool)

(declare-fun e!73040 () Option!166)

(assert (=> b!112368 (= e!73040 None!164)))

(declare-fun b!112366 () Bool)

(assert (=> b!112366 (= e!73039 e!73040)))

(declare-fun c!20097 () Bool)

(assert (=> b!112366 (= c!20097 (and ((_ is Cons!1609) (toList!792 lt!57819)) (not (= (_1!1210 (h!2209 (toList!792 lt!57819))) (_1!1210 lt!57632)))))))

(declare-fun d!31979 () Bool)

(declare-fun c!20096 () Bool)

(assert (=> d!31979 (= c!20096 (and ((_ is Cons!1609) (toList!792 lt!57819)) (= (_1!1210 (h!2209 (toList!792 lt!57819))) (_1!1210 lt!57632))))))

(assert (=> d!31979 (= (getValueByKey!160 (toList!792 lt!57819) (_1!1210 lt!57632)) e!73039)))

(declare-fun b!112367 () Bool)

(assert (=> b!112367 (= e!73040 (getValueByKey!160 (t!5763 (toList!792 lt!57819)) (_1!1210 lt!57632)))))

(assert (= (and d!31979 c!20096) b!112365))

(assert (= (and d!31979 (not c!20096)) b!112366))

(assert (= (and b!112366 c!20097) b!112367))

(assert (= (and b!112366 (not c!20097)) b!112368))

(declare-fun m!128243 () Bool)

(assert (=> b!112367 m!128243))

(assert (=> b!111966 d!31979))

(declare-fun d!31981 () Bool)

(assert (=> d!31981 (isDefined!112 (getValueByKey!160 (toList!792 lt!57635) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun lt!58084 () Unit!3461)

(declare-fun choose!711 (List!1613 (_ BitVec 64)) Unit!3461)

(assert (=> d!31981 (= lt!58084 (choose!711 (toList!792 lt!57635) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun e!73043 () Bool)

(assert (=> d!31981 e!73043))

(declare-fun res!55403 () Bool)

(assert (=> d!31981 (=> (not res!55403) (not e!73043))))

(assert (=> d!31981 (= res!55403 (isStrictlySorted!299 (toList!792 lt!57635)))))

(assert (=> d!31981 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 lt!57635) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) lt!58084)))

(declare-fun b!112371 () Bool)

(assert (=> b!112371 (= e!73043 (containsKey!163 (toList!792 lt!57635) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (= (and d!31981 res!55403) b!112371))

(assert (=> d!31981 m!127411))

(assert (=> d!31981 m!127737))

(assert (=> d!31981 m!127737))

(assert (=> d!31981 m!127739))

(assert (=> d!31981 m!127411))

(declare-fun m!128245 () Bool)

(assert (=> d!31981 m!128245))

(declare-fun m!128247 () Bool)

(assert (=> d!31981 m!128247))

(assert (=> b!112371 m!127411))

(assert (=> b!112371 m!127733))

(assert (=> b!111980 d!31981))

(assert (=> b!111980 d!31975))

(assert (=> b!111980 d!31977))

(declare-fun d!31983 () Bool)

(assert (=> d!31983 (= (get!1362 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) from!355) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2945 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> b!112122 d!31983))

(declare-fun d!31985 () Bool)

(declare-fun e!73044 () Bool)

(assert (=> d!31985 e!73044))

(declare-fun res!55405 () Bool)

(assert (=> d!31985 (=> (not res!55405) (not e!73044))))

(declare-fun lt!58085 () ListLongMap!1553)

(assert (=> d!31985 (= res!55405 (contains!829 lt!58085 (_1!1210 (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun lt!58086 () List!1613)

(assert (=> d!31985 (= lt!58085 (ListLongMap!1554 lt!58086))))

(declare-fun lt!58087 () Unit!3461)

(declare-fun lt!58088 () Unit!3461)

(assert (=> d!31985 (= lt!58087 lt!58088)))

(assert (=> d!31985 (= (getValueByKey!160 lt!58086 (_1!1210 (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))) (Some!165 (_2!1210 (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31985 (= lt!58088 (lemmaContainsTupThenGetReturnValue!76 lt!58086 (_1!1210 (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992))))) (_2!1210 (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31985 (= lt!58086 (insertStrictlySorted!79 (toList!792 call!11929) (_1!1210 (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992))))) (_2!1210 (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31985 (= (+!147 call!11929 (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!58085)))

(declare-fun b!112372 () Bool)

(declare-fun res!55404 () Bool)

(assert (=> b!112372 (=> (not res!55404) (not e!73044))))

(assert (=> b!112372 (= res!55404 (= (getValueByKey!160 (toList!792 lt!58085) (_1!1210 (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992)))))) (Some!165 (_2!1210 (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun b!112373 () Bool)

(assert (=> b!112373 (= e!73044 (contains!833 (toList!792 lt!58085) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2516 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!31985 res!55405) b!112372))

(assert (= (and b!112372 res!55404) b!112373))

(declare-fun m!128249 () Bool)

(assert (=> d!31985 m!128249))

(declare-fun m!128251 () Bool)

(assert (=> d!31985 m!128251))

(declare-fun m!128253 () Bool)

(assert (=> d!31985 m!128253))

(declare-fun m!128255 () Bool)

(assert (=> d!31985 m!128255))

(declare-fun m!128257 () Bool)

(assert (=> b!112372 m!128257))

(declare-fun m!128259 () Bool)

(assert (=> b!112373 m!128259))

(assert (=> b!111883 d!31985))

(declare-fun d!31987 () Bool)

(assert (=> d!31987 (= (inRange!0 (ite c!20008 (ite c!20005 (index!3176 lt!57929) (ite c!20010 (index!3175 lt!57923) (index!3178 lt!57923))) (ite c!20011 (index!3176 lt!57922) (ite c!20009 (index!3175 lt!57917) (index!3178 lt!57917)))) (mask!6825 newMap!16)) (and (bvsge (ite c!20008 (ite c!20005 (index!3176 lt!57929) (ite c!20010 (index!3175 lt!57923) (index!3178 lt!57923))) (ite c!20011 (index!3176 lt!57922) (ite c!20009 (index!3175 lt!57917) (index!3178 lt!57917)))) #b00000000000000000000000000000000) (bvslt (ite c!20008 (ite c!20005 (index!3176 lt!57929) (ite c!20010 (index!3175 lt!57923) (index!3178 lt!57923))) (ite c!20011 (index!3176 lt!57922) (ite c!20009 (index!3175 lt!57917) (index!3178 lt!57917)))) (bvadd (mask!6825 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!11994 d!31987))

(declare-fun d!31989 () Bool)

(declare-fun lt!58091 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!116 (List!1614) (InoxSet (_ BitVec 64)))

(assert (=> d!31989 (= lt!58091 (select (content!116 Nil!1611) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun e!73049 () Bool)

(assert (=> d!31989 (= lt!58091 e!73049)))

(declare-fun res!55411 () Bool)

(assert (=> d!31989 (=> (not res!55411) (not e!73049))))

(assert (=> d!31989 (= res!55411 ((_ is Cons!1610) Nil!1611))))

(assert (=> d!31989 (= (contains!832 Nil!1611 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) lt!58091)))

(declare-fun b!112378 () Bool)

(declare-fun e!73050 () Bool)

(assert (=> b!112378 (= e!73049 e!73050)))

(declare-fun res!55410 () Bool)

(assert (=> b!112378 (=> res!55410 e!73050)))

(assert (=> b!112378 (= res!55410 (= (h!2210 Nil!1611) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!112379 () Bool)

(assert (=> b!112379 (= e!73050 (contains!832 (t!5764 Nil!1611) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (= (and d!31989 res!55411) b!112378))

(assert (= (and b!112378 (not res!55410)) b!112379))

(declare-fun m!128261 () Bool)

(assert (=> d!31989 m!128261))

(assert (=> d!31989 m!127411))

(declare-fun m!128263 () Bool)

(assert (=> d!31989 m!128263))

(assert (=> b!112379 m!127411))

(declare-fun m!128265 () Bool)

(assert (=> b!112379 m!128265))

(assert (=> b!111924 d!31989))

(declare-fun d!31991 () Bool)

(assert (=> d!31991 (= (+!147 (getCurrentListMap!477 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57642)) (getCurrentListMap!477 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) lt!57907 lt!57642 (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58094 () Unit!3461)

(declare-fun choose!712 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 V!3249 Int) Unit!3461)

(assert (=> d!31991 (= lt!58094 (choose!712 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) lt!57907 (zeroValue!2516 newMap!16) lt!57642 (minValue!2516 newMap!16) (defaultEntry!2647 newMap!16)))))

(assert (=> d!31991 (validMask!0 (mask!6825 newMap!16))))

(assert (=> d!31991 (= (lemmaChangeZeroKeyThenAddPairToListMap!50 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) lt!57907 (zeroValue!2516 newMap!16) lt!57642 (minValue!2516 newMap!16) (defaultEntry!2647 newMap!16)) lt!58094)))

(declare-fun bs!4633 () Bool)

(assert (= bs!4633 d!31991))

(declare-fun m!128267 () Bool)

(assert (=> bs!4633 m!128267))

(declare-fun m!128269 () Bool)

(assert (=> bs!4633 m!128269))

(assert (=> bs!4633 m!128073))

(assert (=> bs!4633 m!127583))

(assert (=> bs!4633 m!127583))

(declare-fun m!128271 () Bool)

(assert (=> bs!4633 m!128271))

(assert (=> b!112062 d!31991))

(assert (=> b!111889 d!31873))

(declare-fun b!112380 () Bool)

(declare-fun e!73051 () Option!166)

(assert (=> b!112380 (= e!73051 (Some!165 (_2!1210 (h!2209 (toList!792 lt!57827)))))))

(declare-fun b!112383 () Bool)

(declare-fun e!73052 () Option!166)

(assert (=> b!112383 (= e!73052 None!164)))

(declare-fun b!112381 () Bool)

(assert (=> b!112381 (= e!73051 e!73052)))

(declare-fun c!20099 () Bool)

(assert (=> b!112381 (= c!20099 (and ((_ is Cons!1609) (toList!792 lt!57827)) (not (= (_1!1210 (h!2209 (toList!792 lt!57827))) (_1!1210 lt!57632)))))))

(declare-fun d!31993 () Bool)

(declare-fun c!20098 () Bool)

(assert (=> d!31993 (= c!20098 (and ((_ is Cons!1609) (toList!792 lt!57827)) (= (_1!1210 (h!2209 (toList!792 lt!57827))) (_1!1210 lt!57632))))))

(assert (=> d!31993 (= (getValueByKey!160 (toList!792 lt!57827) (_1!1210 lt!57632)) e!73051)))

(declare-fun b!112382 () Bool)

(assert (=> b!112382 (= e!73052 (getValueByKey!160 (t!5763 (toList!792 lt!57827)) (_1!1210 lt!57632)))))

(assert (= (and d!31993 c!20098) b!112380))

(assert (= (and d!31993 (not c!20098)) b!112381))

(assert (= (and b!112381 c!20099) b!112382))

(assert (= (and b!112381 (not c!20099)) b!112383))

(declare-fun m!128273 () Bool)

(assert (=> b!112382 m!128273))

(assert (=> b!111970 d!31993))

(declare-fun d!31995 () Bool)

(assert (=> d!31995 (= (validKeyInArray!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) (and (not (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!111921 d!31995))

(declare-fun d!31997 () Bool)

(declare-fun res!55412 () Bool)

(declare-fun e!73053 () Bool)

(assert (=> d!31997 (=> res!55412 e!73053)))

(assert (=> d!31997 (= res!55412 (= (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> d!31997 (= (arrayContainsKey!0 (_keys!4365 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b00000000000000000000000000000000) e!73053)))

(declare-fun b!112384 () Bool)

(declare-fun e!73054 () Bool)

(assert (=> b!112384 (= e!73053 e!73054)))

(declare-fun res!55413 () Bool)

(assert (=> b!112384 (=> (not res!55413) (not e!73054))))

(assert (=> b!112384 (= res!55413 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2336 (_keys!4365 newMap!16))))))

(declare-fun b!112385 () Bool)

(assert (=> b!112385 (= e!73054 (arrayContainsKey!0 (_keys!4365 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!31997 (not res!55412)) b!112384))

(assert (= (and b!112384 res!55413) b!112385))

(assert (=> d!31997 m!127979))

(assert (=> b!112385 m!127411))

(declare-fun m!128275 () Bool)

(assert (=> b!112385 m!128275))

(assert (=> bm!11992 d!31997))

(declare-fun d!31999 () Bool)

(declare-fun e!73056 () Bool)

(assert (=> d!31999 e!73056))

(declare-fun res!55414 () Bool)

(assert (=> d!31999 (=> res!55414 e!73056)))

(declare-fun lt!58096 () Bool)

(assert (=> d!31999 (= res!55414 (not lt!58096))))

(declare-fun lt!58095 () Bool)

(assert (=> d!31999 (= lt!58096 lt!58095)))

(declare-fun lt!58097 () Unit!3461)

(declare-fun e!73055 () Unit!3461)

(assert (=> d!31999 (= lt!58097 e!73055)))

(declare-fun c!20100 () Bool)

(assert (=> d!31999 (= c!20100 lt!58095)))

(assert (=> d!31999 (= lt!58095 (containsKey!163 (toList!792 lt!57819) (_1!1210 lt!57632)))))

(assert (=> d!31999 (= (contains!829 lt!57819 (_1!1210 lt!57632)) lt!58096)))

(declare-fun b!112386 () Bool)

(declare-fun lt!58098 () Unit!3461)

(assert (=> b!112386 (= e!73055 lt!58098)))

(assert (=> b!112386 (= lt!58098 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 lt!57819) (_1!1210 lt!57632)))))

(assert (=> b!112386 (isDefined!112 (getValueByKey!160 (toList!792 lt!57819) (_1!1210 lt!57632)))))

(declare-fun b!112387 () Bool)

(declare-fun Unit!3486 () Unit!3461)

(assert (=> b!112387 (= e!73055 Unit!3486)))

(declare-fun b!112388 () Bool)

(assert (=> b!112388 (= e!73056 (isDefined!112 (getValueByKey!160 (toList!792 lt!57819) (_1!1210 lt!57632))))))

(assert (= (and d!31999 c!20100) b!112386))

(assert (= (and d!31999 (not c!20100)) b!112387))

(assert (= (and d!31999 (not res!55414)) b!112388))

(declare-fun m!128277 () Bool)

(assert (=> d!31999 m!128277))

(declare-fun m!128279 () Bool)

(assert (=> b!112386 m!128279))

(assert (=> b!112386 m!127683))

(assert (=> b!112386 m!127683))

(declare-fun m!128281 () Bool)

(assert (=> b!112386 m!128281))

(assert (=> b!112388 m!127683))

(assert (=> b!112388 m!127683))

(assert (=> b!112388 m!128281))

(assert (=> d!31851 d!31999))

(declare-fun b!112389 () Bool)

(declare-fun e!73057 () Option!166)

(assert (=> b!112389 (= e!73057 (Some!165 (_2!1210 (h!2209 lt!57820))))))

(declare-fun b!112392 () Bool)

(declare-fun e!73058 () Option!166)

(assert (=> b!112392 (= e!73058 None!164)))

(declare-fun b!112390 () Bool)

(assert (=> b!112390 (= e!73057 e!73058)))

(declare-fun c!20102 () Bool)

(assert (=> b!112390 (= c!20102 (and ((_ is Cons!1609) lt!57820) (not (= (_1!1210 (h!2209 lt!57820)) (_1!1210 lt!57632)))))))

(declare-fun d!32001 () Bool)

(declare-fun c!20101 () Bool)

(assert (=> d!32001 (= c!20101 (and ((_ is Cons!1609) lt!57820) (= (_1!1210 (h!2209 lt!57820)) (_1!1210 lt!57632))))))

(assert (=> d!32001 (= (getValueByKey!160 lt!57820 (_1!1210 lt!57632)) e!73057)))

(declare-fun b!112391 () Bool)

(assert (=> b!112391 (= e!73058 (getValueByKey!160 (t!5763 lt!57820) (_1!1210 lt!57632)))))

(assert (= (and d!32001 c!20101) b!112389))

(assert (= (and d!32001 (not c!20101)) b!112390))

(assert (= (and b!112390 c!20102) b!112391))

(assert (= (and b!112390 (not c!20102)) b!112392))

(declare-fun m!128283 () Bool)

(assert (=> b!112391 m!128283))

(assert (=> d!31851 d!32001))

(declare-fun d!32003 () Bool)

(assert (=> d!32003 (= (getValueByKey!160 lt!57820 (_1!1210 lt!57632)) (Some!165 (_2!1210 lt!57632)))))

(declare-fun lt!58099 () Unit!3461)

(assert (=> d!32003 (= lt!58099 (choose!708 lt!57820 (_1!1210 lt!57632) (_2!1210 lt!57632)))))

(declare-fun e!73059 () Bool)

(assert (=> d!32003 e!73059))

(declare-fun res!55415 () Bool)

(assert (=> d!32003 (=> (not res!55415) (not e!73059))))

(assert (=> d!32003 (= res!55415 (isStrictlySorted!299 lt!57820))))

(assert (=> d!32003 (= (lemmaContainsTupThenGetReturnValue!76 lt!57820 (_1!1210 lt!57632) (_2!1210 lt!57632)) lt!58099)))

(declare-fun b!112393 () Bool)

(declare-fun res!55416 () Bool)

(assert (=> b!112393 (=> (not res!55416) (not e!73059))))

(assert (=> b!112393 (= res!55416 (containsKey!163 lt!57820 (_1!1210 lt!57632)))))

(declare-fun b!112394 () Bool)

(assert (=> b!112394 (= e!73059 (contains!833 lt!57820 (tuple2!2399 (_1!1210 lt!57632) (_2!1210 lt!57632))))))

(assert (= (and d!32003 res!55415) b!112393))

(assert (= (and b!112393 res!55416) b!112394))

(assert (=> d!32003 m!127677))

(declare-fun m!128285 () Bool)

(assert (=> d!32003 m!128285))

(declare-fun m!128287 () Bool)

(assert (=> d!32003 m!128287))

(declare-fun m!128289 () Bool)

(assert (=> b!112393 m!128289))

(declare-fun m!128291 () Bool)

(assert (=> b!112394 m!128291))

(assert (=> d!31851 d!32003))

(declare-fun b!112395 () Bool)

(declare-fun e!73064 () Bool)

(declare-fun lt!58100 () List!1613)

(assert (=> b!112395 (= e!73064 (contains!833 lt!58100 (tuple2!2399 (_1!1210 lt!57632) (_2!1210 lt!57632))))))

(declare-fun b!112396 () Bool)

(declare-fun res!55418 () Bool)

(assert (=> b!112396 (=> (not res!55418) (not e!73064))))

(assert (=> b!112396 (= res!55418 (containsKey!163 lt!58100 (_1!1210 lt!57632)))))

(declare-fun bm!12046 () Bool)

(declare-fun call!12050 () List!1613)

(declare-fun call!12049 () List!1613)

(assert (=> bm!12046 (= call!12050 call!12049)))

(declare-fun b!112397 () Bool)

(declare-fun e!73061 () List!1613)

(assert (=> b!112397 (= e!73061 call!12050)))

(declare-fun e!73063 () List!1613)

(declare-fun c!20103 () Bool)

(declare-fun b!112398 () Bool)

(declare-fun c!20104 () Bool)

(assert (=> b!112398 (= e!73063 (ite c!20104 (t!5763 (toList!792 lt!57631)) (ite c!20103 (Cons!1609 (h!2209 (toList!792 lt!57631)) (t!5763 (toList!792 lt!57631))) Nil!1610)))))

(declare-fun b!112399 () Bool)

(declare-fun e!73062 () List!1613)

(declare-fun e!73060 () List!1613)

(assert (=> b!112399 (= e!73062 e!73060)))

(assert (=> b!112399 (= c!20104 (and ((_ is Cons!1609) (toList!792 lt!57631)) (= (_1!1210 (h!2209 (toList!792 lt!57631))) (_1!1210 lt!57632))))))

(declare-fun b!112400 () Bool)

(assert (=> b!112400 (= c!20103 (and ((_ is Cons!1609) (toList!792 lt!57631)) (bvsgt (_1!1210 (h!2209 (toList!792 lt!57631))) (_1!1210 lt!57632))))))

(assert (=> b!112400 (= e!73060 e!73061)))

(declare-fun bm!12047 () Bool)

(declare-fun c!20106 () Bool)

(declare-fun call!12051 () List!1613)

(assert (=> bm!12047 (= call!12051 ($colon$colon!83 e!73063 (ite c!20106 (h!2209 (toList!792 lt!57631)) (tuple2!2399 (_1!1210 lt!57632) (_2!1210 lt!57632)))))))

(declare-fun c!20105 () Bool)

(assert (=> bm!12047 (= c!20105 c!20106)))

(declare-fun b!112401 () Bool)

(assert (=> b!112401 (= e!73060 call!12049)))

(declare-fun bm!12048 () Bool)

(assert (=> bm!12048 (= call!12049 call!12051)))

(declare-fun d!32005 () Bool)

(assert (=> d!32005 e!73064))

(declare-fun res!55417 () Bool)

(assert (=> d!32005 (=> (not res!55417) (not e!73064))))

(assert (=> d!32005 (= res!55417 (isStrictlySorted!299 lt!58100))))

(assert (=> d!32005 (= lt!58100 e!73062)))

(assert (=> d!32005 (= c!20106 (and ((_ is Cons!1609) (toList!792 lt!57631)) (bvslt (_1!1210 (h!2209 (toList!792 lt!57631))) (_1!1210 lt!57632))))))

(assert (=> d!32005 (isStrictlySorted!299 (toList!792 lt!57631))))

(assert (=> d!32005 (= (insertStrictlySorted!79 (toList!792 lt!57631) (_1!1210 lt!57632) (_2!1210 lt!57632)) lt!58100)))

(declare-fun b!112402 () Bool)

(assert (=> b!112402 (= e!73062 call!12051)))

(declare-fun b!112403 () Bool)

(assert (=> b!112403 (= e!73063 (insertStrictlySorted!79 (t!5763 (toList!792 lt!57631)) (_1!1210 lt!57632) (_2!1210 lt!57632)))))

(declare-fun b!112404 () Bool)

(assert (=> b!112404 (= e!73061 call!12050)))

(assert (= (and d!32005 c!20106) b!112402))

(assert (= (and d!32005 (not c!20106)) b!112399))

(assert (= (and b!112399 c!20104) b!112401))

(assert (= (and b!112399 (not c!20104)) b!112400))

(assert (= (and b!112400 c!20103) b!112397))

(assert (= (and b!112400 (not c!20103)) b!112404))

(assert (= (or b!112397 b!112404) bm!12046))

(assert (= (or b!112401 bm!12046) bm!12048))

(assert (= (or b!112402 bm!12048) bm!12047))

(assert (= (and bm!12047 c!20105) b!112403))

(assert (= (and bm!12047 (not c!20105)) b!112398))

(assert (= (and d!32005 res!55417) b!112396))

(assert (= (and b!112396 res!55418) b!112395))

(declare-fun m!128293 () Bool)

(assert (=> b!112396 m!128293))

(declare-fun m!128295 () Bool)

(assert (=> bm!12047 m!128295))

(declare-fun m!128297 () Bool)

(assert (=> b!112395 m!128297))

(declare-fun m!128299 () Bool)

(assert (=> d!32005 m!128299))

(declare-fun m!128301 () Bool)

(assert (=> d!32005 m!128301))

(declare-fun m!128303 () Bool)

(assert (=> b!112403 m!128303))

(assert (=> d!31851 d!32005))

(assert (=> bm!11931 d!31849))

(declare-fun d!32007 () Bool)

(declare-fun e!73065 () Bool)

(assert (=> d!32007 e!73065))

(declare-fun res!55420 () Bool)

(assert (=> d!32007 (=> (not res!55420) (not e!73065))))

(declare-fun lt!58101 () ListLongMap!1553)

(assert (=> d!32007 (= res!55420 (contains!829 lt!58101 (_1!1210 (tuple2!2399 lt!57805 lt!57804))))))

(declare-fun lt!58102 () List!1613)

(assert (=> d!32007 (= lt!58101 (ListLongMap!1554 lt!58102))))

(declare-fun lt!58103 () Unit!3461)

(declare-fun lt!58104 () Unit!3461)

(assert (=> d!32007 (= lt!58103 lt!58104)))

(assert (=> d!32007 (= (getValueByKey!160 lt!58102 (_1!1210 (tuple2!2399 lt!57805 lt!57804))) (Some!165 (_2!1210 (tuple2!2399 lt!57805 lt!57804))))))

(assert (=> d!32007 (= lt!58104 (lemmaContainsTupThenGetReturnValue!76 lt!58102 (_1!1210 (tuple2!2399 lt!57805 lt!57804)) (_2!1210 (tuple2!2399 lt!57805 lt!57804))))))

(assert (=> d!32007 (= lt!58102 (insertStrictlySorted!79 (toList!792 lt!57810) (_1!1210 (tuple2!2399 lt!57805 lt!57804)) (_2!1210 (tuple2!2399 lt!57805 lt!57804))))))

(assert (=> d!32007 (= (+!147 lt!57810 (tuple2!2399 lt!57805 lt!57804)) lt!58101)))

(declare-fun b!112405 () Bool)

(declare-fun res!55419 () Bool)

(assert (=> b!112405 (=> (not res!55419) (not e!73065))))

(assert (=> b!112405 (= res!55419 (= (getValueByKey!160 (toList!792 lt!58101) (_1!1210 (tuple2!2399 lt!57805 lt!57804))) (Some!165 (_2!1210 (tuple2!2399 lt!57805 lt!57804)))))))

(declare-fun b!112406 () Bool)

(assert (=> b!112406 (= e!73065 (contains!833 (toList!792 lt!58101) (tuple2!2399 lt!57805 lt!57804)))))

(assert (= (and d!32007 res!55420) b!112405))

(assert (= (and b!112405 res!55419) b!112406))

(declare-fun m!128305 () Bool)

(assert (=> d!32007 m!128305))

(declare-fun m!128307 () Bool)

(assert (=> d!32007 m!128307))

(declare-fun m!128309 () Bool)

(assert (=> d!32007 m!128309))

(declare-fun m!128311 () Bool)

(assert (=> d!32007 m!128311))

(declare-fun m!128313 () Bool)

(assert (=> b!112405 m!128313))

(declare-fun m!128315 () Bool)

(assert (=> b!112406 m!128315))

(assert (=> b!111953 d!32007))

(assert (=> b!111953 d!31917))

(declare-fun d!32009 () Bool)

(declare-fun e!73067 () Bool)

(assert (=> d!32009 e!73067))

(declare-fun res!55421 () Bool)

(assert (=> d!32009 (=> res!55421 e!73067)))

(declare-fun lt!58106 () Bool)

(assert (=> d!32009 (= res!55421 (not lt!58106))))

(declare-fun lt!58105 () Bool)

(assert (=> d!32009 (= lt!58106 lt!58105)))

(declare-fun lt!58107 () Unit!3461)

(declare-fun e!73066 () Unit!3461)

(assert (=> d!32009 (= lt!58107 e!73066)))

(declare-fun c!20107 () Bool)

(assert (=> d!32009 (= c!20107 lt!58105)))

(assert (=> d!32009 (= lt!58105 (containsKey!163 (toList!792 (+!147 lt!57810 (tuple2!2399 lt!57805 lt!57804))) lt!57808))))

(assert (=> d!32009 (= (contains!829 (+!147 lt!57810 (tuple2!2399 lt!57805 lt!57804)) lt!57808) lt!58106)))

(declare-fun b!112407 () Bool)

(declare-fun lt!58108 () Unit!3461)

(assert (=> b!112407 (= e!73066 lt!58108)))

(assert (=> b!112407 (= lt!58108 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 (+!147 lt!57810 (tuple2!2399 lt!57805 lt!57804))) lt!57808))))

(assert (=> b!112407 (isDefined!112 (getValueByKey!160 (toList!792 (+!147 lt!57810 (tuple2!2399 lt!57805 lt!57804))) lt!57808))))

(declare-fun b!112408 () Bool)

(declare-fun Unit!3487 () Unit!3461)

(assert (=> b!112408 (= e!73066 Unit!3487)))

(declare-fun b!112409 () Bool)

(assert (=> b!112409 (= e!73067 (isDefined!112 (getValueByKey!160 (toList!792 (+!147 lt!57810 (tuple2!2399 lt!57805 lt!57804))) lt!57808)))))

(assert (= (and d!32009 c!20107) b!112407))

(assert (= (and d!32009 (not c!20107)) b!112408))

(assert (= (and d!32009 (not res!55421)) b!112409))

(declare-fun m!128317 () Bool)

(assert (=> d!32009 m!128317))

(declare-fun m!128319 () Bool)

(assert (=> b!112407 m!128319))

(declare-fun m!128321 () Bool)

(assert (=> b!112407 m!128321))

(assert (=> b!112407 m!128321))

(declare-fun m!128323 () Bool)

(assert (=> b!112407 m!128323))

(assert (=> b!112409 m!128321))

(assert (=> b!112409 m!128321))

(assert (=> b!112409 m!128323))

(assert (=> b!111953 d!32009))

(declare-fun d!32011 () Bool)

(declare-fun e!73068 () Bool)

(assert (=> d!32011 e!73068))

(declare-fun res!55423 () Bool)

(assert (=> d!32011 (=> (not res!55423) (not e!73068))))

(declare-fun lt!58109 () ListLongMap!1553)

(assert (=> d!32011 (= res!55423 (contains!829 lt!58109 (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!58110 () List!1613)

(assert (=> d!32011 (= lt!58109 (ListLongMap!1554 lt!58110))))

(declare-fun lt!58111 () Unit!3461)

(declare-fun lt!58112 () Unit!3461)

(assert (=> d!32011 (= lt!58111 lt!58112)))

(assert (=> d!32011 (= (getValueByKey!160 lt!58110 (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!165 (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32011 (= lt!58112 (lemmaContainsTupThenGetReturnValue!76 lt!58110 (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32011 (= lt!58110 (insertStrictlySorted!79 (toList!792 call!11941) (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32011 (= (+!147 call!11941 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!58109)))

(declare-fun b!112410 () Bool)

(declare-fun res!55422 () Bool)

(assert (=> b!112410 (=> (not res!55422) (not e!73068))))

(assert (=> b!112410 (= res!55422 (= (getValueByKey!160 (toList!792 lt!58109) (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!165 (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!112411 () Bool)

(assert (=> b!112411 (= e!73068 (contains!833 (toList!792 lt!58109) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!32011 res!55423) b!112410))

(assert (= (and b!112410 res!55422) b!112411))

(declare-fun m!128325 () Bool)

(assert (=> d!32011 m!128325))

(declare-fun m!128327 () Bool)

(assert (=> d!32011 m!128327))

(declare-fun m!128329 () Bool)

(assert (=> d!32011 m!128329))

(declare-fun m!128331 () Bool)

(assert (=> d!32011 m!128331))

(declare-fun m!128333 () Bool)

(assert (=> b!112410 m!128333))

(declare-fun m!128335 () Bool)

(assert (=> b!112411 m!128335))

(assert (=> b!111953 d!32011))

(declare-fun d!32013 () Bool)

(assert (=> d!32013 (not (contains!829 (+!147 lt!57810 (tuple2!2399 lt!57805 lt!57804)) lt!57808))))

(declare-fun lt!58115 () Unit!3461)

(declare-fun choose!713 (ListLongMap!1553 (_ BitVec 64) V!3249 (_ BitVec 64)) Unit!3461)

(assert (=> d!32013 (= lt!58115 (choose!713 lt!57810 lt!57805 lt!57804 lt!57808))))

(declare-fun e!73071 () Bool)

(assert (=> d!32013 e!73071))

(declare-fun res!55426 () Bool)

(assert (=> d!32013 (=> (not res!55426) (not e!73071))))

(assert (=> d!32013 (= res!55426 (not (contains!829 lt!57810 lt!57808)))))

(assert (=> d!32013 (= (addStillNotContains!51 lt!57810 lt!57805 lt!57804 lt!57808) lt!58115)))

(declare-fun b!112415 () Bool)

(assert (=> b!112415 (= e!73071 (not (= lt!57805 lt!57808)))))

(assert (= (and d!32013 res!55426) b!112415))

(assert (=> d!32013 m!127657))

(assert (=> d!32013 m!127657))

(assert (=> d!32013 m!127659))

(declare-fun m!128337 () Bool)

(assert (=> d!32013 m!128337))

(declare-fun m!128339 () Bool)

(assert (=> d!32013 m!128339))

(assert (=> b!111953 d!32013))

(declare-fun d!32015 () Bool)

(declare-fun lt!58118 () Bool)

(declare-fun content!117 (List!1613) (InoxSet tuple2!2398))

(assert (=> d!32015 (= lt!58118 (select (content!117 (toList!792 lt!57831)) lt!57633))))

(declare-fun e!73076 () Bool)

(assert (=> d!32015 (= lt!58118 e!73076)))

(declare-fun res!55431 () Bool)

(assert (=> d!32015 (=> (not res!55431) (not e!73076))))

(assert (=> d!32015 (= res!55431 ((_ is Cons!1609) (toList!792 lt!57831)))))

(assert (=> d!32015 (= (contains!833 (toList!792 lt!57831) lt!57633) lt!58118)))

(declare-fun b!112420 () Bool)

(declare-fun e!73077 () Bool)

(assert (=> b!112420 (= e!73076 e!73077)))

(declare-fun res!55432 () Bool)

(assert (=> b!112420 (=> res!55432 e!73077)))

(assert (=> b!112420 (= res!55432 (= (h!2209 (toList!792 lt!57831)) lt!57633))))

(declare-fun b!112421 () Bool)

(assert (=> b!112421 (= e!73077 (contains!833 (t!5763 (toList!792 lt!57831)) lt!57633))))

(assert (= (and d!32015 res!55431) b!112420))

(assert (= (and b!112420 (not res!55432)) b!112421))

(declare-fun m!128341 () Bool)

(assert (=> d!32015 m!128341))

(declare-fun m!128343 () Bool)

(assert (=> d!32015 m!128343))

(declare-fun m!128345 () Bool)

(assert (=> b!112421 m!128345))

(assert (=> b!111973 d!32015))

(assert (=> b!111951 d!31873))

(declare-fun d!32017 () Bool)

(assert (=> d!32017 (= (+!147 (getCurrentListMap!477 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57642)) (getCurrentListMap!477 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) lt!57909 (zeroValue!2516 newMap!16) lt!57642 #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58121 () Unit!3461)

(declare-fun choose!714 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 V!3249 Int) Unit!3461)

(assert (=> d!32017 (= lt!58121 (choose!714 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) lt!57909 (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) lt!57642 (defaultEntry!2647 newMap!16)))))

(assert (=> d!32017 (validMask!0 (mask!6825 newMap!16))))

(assert (=> d!32017 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!50 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) lt!57909 (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) lt!57642 (defaultEntry!2647 newMap!16)) lt!58121)))

(declare-fun bs!4634 () Bool)

(assert (= bs!4634 d!32017))

(declare-fun m!128347 () Bool)

(assert (=> bs!4634 m!128347))

(assert (=> bs!4634 m!128073))

(assert (=> bs!4634 m!127583))

(declare-fun m!128349 () Bool)

(assert (=> bs!4634 m!128349))

(assert (=> bs!4634 m!127583))

(declare-fun m!128351 () Bool)

(assert (=> bs!4634 m!128351))

(assert (=> b!112079 d!32017))

(declare-fun d!32019 () Bool)

(declare-fun res!55433 () Bool)

(declare-fun e!73078 () Bool)

(assert (=> d!32019 (=> (not res!55433) (not e!73078))))

(assert (=> d!32019 (= res!55433 (simpleValid!77 (_2!1211 lt!57911)))))

(assert (=> d!32019 (= (valid!436 (_2!1211 lt!57911)) e!73078)))

(declare-fun b!112422 () Bool)

(declare-fun res!55434 () Bool)

(assert (=> b!112422 (=> (not res!55434) (not e!73078))))

(assert (=> b!112422 (= res!55434 (= (arrayCountValidKeys!0 (_keys!4365 (_2!1211 lt!57911)) #b00000000000000000000000000000000 (size!2336 (_keys!4365 (_2!1211 lt!57911)))) (_size!510 (_2!1211 lt!57911))))))

(declare-fun b!112423 () Bool)

(declare-fun res!55435 () Bool)

(assert (=> b!112423 (=> (not res!55435) (not e!73078))))

(assert (=> b!112423 (= res!55435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4365 (_2!1211 lt!57911)) (mask!6825 (_2!1211 lt!57911))))))

(declare-fun b!112424 () Bool)

(assert (=> b!112424 (= e!73078 (arrayNoDuplicates!0 (_keys!4365 (_2!1211 lt!57911)) #b00000000000000000000000000000000 Nil!1611))))

(assert (= (and d!32019 res!55433) b!112422))

(assert (= (and b!112422 res!55434) b!112423))

(assert (= (and b!112423 res!55435) b!112424))

(declare-fun m!128353 () Bool)

(assert (=> d!32019 m!128353))

(declare-fun m!128355 () Bool)

(assert (=> b!112422 m!128355))

(declare-fun m!128357 () Bool)

(assert (=> b!112423 m!128357))

(declare-fun m!128359 () Bool)

(assert (=> b!112424 m!128359))

(assert (=> d!31865 d!32019))

(assert (=> d!31865 d!31869))

(assert (=> d!31827 d!31857))

(declare-fun d!32021 () Bool)

(declare-fun e!73080 () Bool)

(assert (=> d!32021 e!73080))

(declare-fun res!55436 () Bool)

(assert (=> d!32021 (=> res!55436 e!73080)))

(declare-fun lt!58123 () Bool)

(assert (=> d!32021 (= res!55436 (not lt!58123))))

(declare-fun lt!58122 () Bool)

(assert (=> d!32021 (= lt!58123 lt!58122)))

(declare-fun lt!58124 () Unit!3461)

(declare-fun e!73079 () Unit!3461)

(assert (=> d!32021 (= lt!58124 e!73079)))

(declare-fun c!20108 () Bool)

(assert (=> d!32021 (= c!20108 lt!58122)))

(assert (=> d!32021 (= lt!58122 (containsKey!163 (toList!792 call!12005) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> d!32021 (= (contains!829 call!12005 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) lt!58123)))

(declare-fun b!112425 () Bool)

(declare-fun lt!58125 () Unit!3461)

(assert (=> b!112425 (= e!73079 lt!58125)))

(assert (=> b!112425 (= lt!58125 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 call!12005) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> b!112425 (isDefined!112 (getValueByKey!160 (toList!792 call!12005) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!112426 () Bool)

(declare-fun Unit!3488 () Unit!3461)

(assert (=> b!112426 (= e!73079 Unit!3488)))

(declare-fun b!112427 () Bool)

(assert (=> b!112427 (= e!73080 (isDefined!112 (getValueByKey!160 (toList!792 call!12005) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355))))))

(assert (= (and d!32021 c!20108) b!112425))

(assert (= (and d!32021 (not c!20108)) b!112426))

(assert (= (and d!32021 (not res!55436)) b!112427))

(assert (=> d!32021 m!127411))

(declare-fun m!128361 () Bool)

(assert (=> d!32021 m!128361))

(assert (=> b!112425 m!127411))

(declare-fun m!128363 () Bool)

(assert (=> b!112425 m!128363))

(assert (=> b!112425 m!127411))

(declare-fun m!128365 () Bool)

(assert (=> b!112425 m!128365))

(assert (=> b!112425 m!128365))

(declare-fun m!128367 () Bool)

(assert (=> b!112425 m!128367))

(assert (=> b!112427 m!127411))

(assert (=> b!112427 m!128365))

(assert (=> b!112427 m!128365))

(assert (=> b!112427 m!128367))

(assert (=> b!112087 d!32021))

(declare-fun d!32023 () Bool)

(declare-fun e!73082 () Bool)

(assert (=> d!32023 e!73082))

(declare-fun res!55437 () Bool)

(assert (=> d!32023 (=> res!55437 e!73082)))

(declare-fun lt!58127 () Bool)

(assert (=> d!32023 (= res!55437 (not lt!58127))))

(declare-fun lt!58126 () Bool)

(assert (=> d!32023 (= lt!58127 lt!58126)))

(declare-fun lt!58128 () Unit!3461)

(declare-fun e!73081 () Unit!3461)

(assert (=> d!32023 (= lt!58128 e!73081)))

(declare-fun c!20109 () Bool)

(assert (=> d!32023 (= c!20109 lt!58126)))

(assert (=> d!32023 (= lt!58126 (containsKey!163 (toList!792 lt!57807) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32023 (= (contains!829 lt!57807 #b0000000000000000000000000000000000000000000000000000000000000000) lt!58127)))

(declare-fun b!112428 () Bool)

(declare-fun lt!58129 () Unit!3461)

(assert (=> b!112428 (= e!73081 lt!58129)))

(assert (=> b!112428 (= lt!58129 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 lt!57807) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112428 (isDefined!112 (getValueByKey!160 (toList!792 lt!57807) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112429 () Bool)

(declare-fun Unit!3489 () Unit!3461)

(assert (=> b!112429 (= e!73081 Unit!3489)))

(declare-fun b!112430 () Bool)

(assert (=> b!112430 (= e!73082 (isDefined!112 (getValueByKey!160 (toList!792 lt!57807) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32023 c!20109) b!112428))

(assert (= (and d!32023 (not c!20109)) b!112429))

(assert (= (and d!32023 (not res!55437)) b!112430))

(declare-fun m!128369 () Bool)

(assert (=> d!32023 m!128369))

(declare-fun m!128371 () Bool)

(assert (=> b!112428 m!128371))

(declare-fun m!128373 () Bool)

(assert (=> b!112428 m!128373))

(assert (=> b!112428 m!128373))

(declare-fun m!128375 () Bool)

(assert (=> b!112428 m!128375))

(assert (=> b!112430 m!128373))

(assert (=> b!112430 m!128373))

(assert (=> b!112430 m!128375))

(assert (=> d!31849 d!32023))

(assert (=> d!31849 d!31857))

(assert (=> b!111950 d!31911))

(declare-fun d!32025 () Bool)

(declare-fun e!73100 () Bool)

(assert (=> d!32025 e!73100))

(declare-fun res!55457 () Bool)

(assert (=> d!32025 (=> (not res!55457) (not e!73100))))

(declare-fun lt!58215 () tuple2!2400)

(assert (=> d!32025 (= res!55457 (_1!1211 lt!58215))))

(assert (=> d!32025 (= lt!58215 (tuple2!2401 true (LongMapFixedSize!923 (defaultEntry!2647 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (bvadd (_size!510 newMap!16) #b00000000000000000000000000000001) (array!4386 (store (arr!2078 (_keys!4365 newMap!16)) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2336 (_keys!4365 newMap!16))) (array!4388 (store (arr!2079 (_values!2630 newMap!16)) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (ValueCellFull!1007 lt!57642)) (size!2337 (_values!2630 newMap!16))) (_vacant!510 newMap!16))))))

(declare-fun lt!58211 () Unit!3461)

(declare-fun lt!58196 () Unit!3461)

(assert (=> d!32025 (= lt!58211 lt!58196)))

(declare-fun lt!58190 () array!4385)

(declare-fun lt!58218 () array!4387)

(assert (=> d!32025 (contains!829 (getCurrentListMap!477 lt!58190 lt!58218 (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (select (store (arr!2078 (_keys!4365 newMap!16)) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916))))))

(assert (=> d!32025 (= lt!58196 (lemmaValidKeyInArrayIsInListMap!110 lt!58190 lt!58218 (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (defaultEntry!2647 newMap!16)))))

(assert (=> d!32025 (= lt!58218 (array!4388 (store (arr!2079 (_values!2630 newMap!16)) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (ValueCellFull!1007 lt!57642)) (size!2337 (_values!2630 newMap!16))))))

(assert (=> d!32025 (= lt!58190 (array!4386 (store (arr!2078 (_keys!4365 newMap!16)) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2336 (_keys!4365 newMap!16))))))

(declare-fun lt!58205 () Unit!3461)

(declare-fun lt!58203 () Unit!3461)

(assert (=> d!32025 (= lt!58205 lt!58203)))

(declare-fun lt!58198 () array!4385)

(assert (=> d!32025 (= (arrayCountValidKeys!0 lt!58198 (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (bvadd (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4385 (_ BitVec 32)) Unit!3461)

(assert (=> d!32025 (= lt!58203 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!58198 (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916))))))

(assert (=> d!32025 (= lt!58198 (array!4386 (store (arr!2078 (_keys!4365 newMap!16)) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2336 (_keys!4365 newMap!16))))))

(declare-fun lt!58201 () Unit!3461)

(declare-fun lt!58200 () Unit!3461)

(assert (=> d!32025 (= lt!58201 lt!58200)))

(declare-fun lt!58204 () array!4385)

(assert (=> d!32025 (arrayContainsKey!0 lt!58204 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!32025 (= lt!58200 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!58204 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916))))))

(assert (=> d!32025 (= lt!58204 (array!4386 (store (arr!2078 (_keys!4365 newMap!16)) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2336 (_keys!4365 newMap!16))))))

(declare-fun lt!58212 () Unit!3461)

(declare-fun lt!58214 () Unit!3461)

(assert (=> d!32025 (= lt!58212 lt!58214)))

(assert (=> d!32025 (= (+!147 (getCurrentListMap!477 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)) (getCurrentListMap!477 (array!4386 (store (arr!2078 (_keys!4365 newMap!16)) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2336 (_keys!4365 newMap!16))) (array!4388 (store (arr!2079 (_values!2630 newMap!16)) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (ValueCellFull!1007 lt!57642)) (size!2337 (_values!2630 newMap!16))) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!33 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 32) (_ BitVec 64) V!3249 Int) Unit!3461)

(assert (=> d!32025 (= lt!58214 (lemmaAddValidKeyToArrayThenAddPairToListMap!33 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58219 () Unit!3461)

(declare-fun lt!58199 () Unit!3461)

(assert (=> d!32025 (= lt!58219 lt!58199)))

(assert (=> d!32025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4386 (store (arr!2078 (_keys!4365 newMap!16)) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2336 (_keys!4365 newMap!16))) (mask!6825 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4385 (_ BitVec 32) (_ BitVec 32)) Unit!3461)

(assert (=> d!32025 (= lt!58199 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4365 newMap!16) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (mask!6825 newMap!16)))))

(declare-fun lt!58194 () Unit!3461)

(declare-fun lt!58195 () Unit!3461)

(assert (=> d!32025 (= lt!58194 lt!58195)))

(assert (=> d!32025 (= (arrayCountValidKeys!0 (array!4386 (store (arr!2078 (_keys!4365 newMap!16)) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2336 (_keys!4365 newMap!16))) #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4365 newMap!16) #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4385 (_ BitVec 32) (_ BitVec 64)) Unit!3461)

(assert (=> d!32025 (= lt!58195 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4365 newMap!16) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun lt!58193 () Unit!3461)

(declare-fun lt!58216 () Unit!3461)

(assert (=> d!32025 (= lt!58193 lt!58216)))

(declare-fun lt!58191 () List!1614)

(declare-fun lt!58202 () (_ BitVec 32))

(assert (=> d!32025 (arrayNoDuplicates!0 (array!4386 (store (arr!2078 (_keys!4365 newMap!16)) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2336 (_keys!4365 newMap!16))) lt!58202 lt!58191)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4385 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1614) Unit!3461)

(assert (=> d!32025 (= lt!58216 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4365 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916)) lt!58202 lt!58191))))

(assert (=> d!32025 (= lt!58191 Nil!1611)))

(assert (=> d!32025 (= lt!58202 #b00000000000000000000000000000000)))

(declare-fun lt!58206 () Unit!3461)

(declare-fun e!73104 () Unit!3461)

(assert (=> d!32025 (= lt!58206 e!73104)))

(declare-fun c!20121 () Bool)

(assert (=> d!32025 (= c!20121 (arrayContainsKey!0 (_keys!4365 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!58210 () Unit!3461)

(declare-fun e!73101 () Unit!3461)

(assert (=> d!32025 (= lt!58210 e!73101)))

(declare-fun c!20118 () Bool)

(assert (=> d!32025 (= c!20118 (contains!829 (getCurrentListMap!477 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> d!32025 (valid!436 newMap!16)))

(assert (=> d!32025 (= (updateHelperNewKey!50 newMap!16 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642 (ite c!20007 (index!3178 lt!57916) (index!3175 lt!57916))) lt!58215)))

(declare-fun b!112465 () Bool)

(declare-fun e!73102 () Bool)

(declare-fun call!12063 () Bool)

(assert (=> b!112465 (= e!73102 (not call!12063))))

(declare-fun b!112466 () Bool)

(declare-fun e!73106 () Bool)

(assert (=> b!112466 (= e!73106 (not call!12063))))

(declare-fun b!112467 () Bool)

(declare-fun c!20119 () Bool)

(declare-fun lt!58207 () SeekEntryResult!256)

(assert (=> b!112467 (= c!20119 ((_ is MissingVacant!256) lt!58207))))

(declare-fun e!73103 () Bool)

(declare-fun e!73105 () Bool)

(assert (=> b!112467 (= e!73103 e!73105)))

(declare-fun b!112468 () Bool)

(declare-fun Unit!3490 () Unit!3461)

(assert (=> b!112468 (= e!73104 Unit!3490)))

(declare-fun b!112469 () Bool)

(assert (=> b!112469 (= e!73100 (= (map!1299 (_2!1211 lt!58215)) (+!147 (map!1299 newMap!16) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(declare-fun b!112470 () Bool)

(assert (=> b!112470 (= e!73105 e!73106)))

(declare-fun res!55458 () Bool)

(declare-fun call!12060 () Bool)

(assert (=> b!112470 (= res!55458 call!12060)))

(assert (=> b!112470 (=> (not res!55458) (not e!73106))))

(declare-fun bm!12057 () Bool)

(declare-fun call!12061 () Bool)

(assert (=> bm!12057 (= call!12060 call!12061)))

(declare-fun b!112471 () Bool)

(declare-fun res!55463 () Bool)

(assert (=> b!112471 (=> (not res!55463) (not e!73102))))

(assert (=> b!112471 (= res!55463 call!12060)))

(assert (=> b!112471 (= e!73103 e!73102)))

(declare-fun b!112472 () Bool)

(declare-fun Unit!3491 () Unit!3461)

(assert (=> b!112472 (= e!73104 Unit!3491)))

(declare-fun lt!58197 () Unit!3461)

(declare-fun lemmaArrayContainsKeyThenInListMap!33 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 64) (_ BitVec 32) Int) Unit!3461)

(assert (=> b!112472 (= lt!58197 (lemmaArrayContainsKeyThenInListMap!33 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(assert (=> b!112472 (contains!829 (getCurrentListMap!477 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355))))

(declare-fun lt!58208 () Unit!3461)

(assert (=> b!112472 (= lt!58208 lt!58197)))

(assert (=> b!112472 false))

(declare-fun b!112473 () Bool)

(declare-fun res!55459 () Bool)

(assert (=> b!112473 (=> (not res!55459) (not e!73100))))

(assert (=> b!112473 (= res!55459 (contains!829 (map!1299 (_2!1211 lt!58215)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun bm!12058 () Bool)

(declare-fun call!12062 () SeekEntryResult!256)

(assert (=> bm!12058 (= call!12062 (seekEntryOrOpen!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4365 newMap!16) (mask!6825 newMap!16)))))

(declare-fun b!112474 () Bool)

(declare-fun res!55456 () Bool)

(assert (=> b!112474 (=> (not res!55456) (not e!73100))))

(assert (=> b!112474 (= res!55456 (valid!436 (_2!1211 lt!58215)))))

(declare-fun b!112475 () Bool)

(assert (=> b!112475 (= e!73105 ((_ is Undefined!256) lt!58207))))

(declare-fun b!112476 () Bool)

(declare-fun lt!58192 () Unit!3461)

(assert (=> b!112476 (= e!73101 lt!58192)))

(assert (=> b!112476 (= lt!58192 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!50 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)))))

(assert (=> b!112476 (= lt!58207 call!12062)))

(declare-fun c!20120 () Bool)

(assert (=> b!112476 (= c!20120 ((_ is MissingZero!256) lt!58207))))

(assert (=> b!112476 e!73103))

(declare-fun bm!12059 () Bool)

(assert (=> bm!12059 (= call!12063 (arrayContainsKey!0 (_keys!4365 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!112477 () Bool)

(declare-fun Unit!3492 () Unit!3461)

(assert (=> b!112477 (= e!73101 Unit!3492)))

(declare-fun lt!58209 () Unit!3461)

(assert (=> b!112477 (= lt!58209 (lemmaInListMapThenSeekEntryOrOpenFindsIt!50 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58217 () SeekEntryResult!256)

(assert (=> b!112477 (= lt!58217 call!12062)))

(declare-fun res!55461 () Bool)

(assert (=> b!112477 (= res!55461 ((_ is Found!256) lt!58217))))

(declare-fun e!73099 () Bool)

(assert (=> b!112477 (=> (not res!55461) (not e!73099))))

(assert (=> b!112477 e!73099))

(declare-fun lt!58213 () Unit!3461)

(assert (=> b!112477 (= lt!58213 lt!58209)))

(assert (=> b!112477 false))

(declare-fun b!112478 () Bool)

(declare-fun res!55460 () Bool)

(assert (=> b!112478 (= res!55460 call!12061)))

(assert (=> b!112478 (=> (not res!55460) (not e!73099))))

(declare-fun bm!12060 () Bool)

(assert (=> bm!12060 (= call!12061 (inRange!0 (ite c!20118 (index!3176 lt!58217) (ite c!20120 (index!3175 lt!58207) (index!3178 lt!58207))) (mask!6825 newMap!16)))))

(declare-fun b!112479 () Bool)

(declare-fun res!55464 () Bool)

(assert (=> b!112479 (=> (not res!55464) (not e!73102))))

(assert (=> b!112479 (= res!55464 (= (select (arr!2078 (_keys!4365 newMap!16)) (index!3175 lt!58207)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112480 () Bool)

(declare-fun res!55462 () Bool)

(assert (=> b!112480 (= res!55462 (= (select (arr!2078 (_keys!4365 newMap!16)) (index!3178 lt!58207)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112480 (=> (not res!55462) (not e!73106))))

(declare-fun b!112481 () Bool)

(assert (=> b!112481 (= e!73099 (= (select (arr!2078 (_keys!4365 newMap!16)) (index!3176 lt!58217)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (= (and d!32025 c!20118) b!112477))

(assert (= (and d!32025 (not c!20118)) b!112476))

(assert (= (and b!112477 res!55461) b!112478))

(assert (= (and b!112478 res!55460) b!112481))

(assert (= (and b!112476 c!20120) b!112471))

(assert (= (and b!112476 (not c!20120)) b!112467))

(assert (= (and b!112471 res!55463) b!112479))

(assert (= (and b!112479 res!55464) b!112465))

(assert (= (and b!112467 c!20119) b!112470))

(assert (= (and b!112467 (not c!20119)) b!112475))

(assert (= (and b!112470 res!55458) b!112480))

(assert (= (and b!112480 res!55462) b!112466))

(assert (= (or b!112471 b!112470) bm!12057))

(assert (= (or b!112465 b!112466) bm!12059))

(assert (= (or b!112478 bm!12057) bm!12060))

(assert (= (or b!112477 b!112476) bm!12058))

(assert (= (and d!32025 c!20121) b!112472))

(assert (= (and d!32025 (not c!20121)) b!112468))

(assert (= (and d!32025 res!55457) b!112474))

(assert (= (and b!112474 res!55456) b!112473))

(assert (= (and b!112473 res!55459) b!112469))

(declare-fun m!128377 () Bool)

(assert (=> b!112473 m!128377))

(assert (=> b!112473 m!128377))

(assert (=> b!112473 m!127411))

(declare-fun m!128379 () Bool)

(assert (=> b!112473 m!128379))

(assert (=> b!112476 m!127411))

(assert (=> b!112476 m!127755))

(assert (=> b!112469 m!128377))

(assert (=> b!112469 m!127463))

(assert (=> b!112469 m!127463))

(declare-fun m!128381 () Bool)

(assert (=> b!112469 m!128381))

(assert (=> d!32025 m!127411))

(declare-fun m!128383 () Bool)

(assert (=> d!32025 m!128383))

(declare-fun m!128385 () Bool)

(assert (=> d!32025 m!128385))

(assert (=> d!32025 m!127583))

(assert (=> d!32025 m!127411))

(declare-fun m!128387 () Bool)

(assert (=> d!32025 m!128387))

(assert (=> d!32025 m!127411))

(declare-fun m!128389 () Bool)

(assert (=> d!32025 m!128389))

(declare-fun m!128391 () Bool)

(assert (=> d!32025 m!128391))

(declare-fun m!128393 () Bool)

(assert (=> d!32025 m!128393))

(assert (=> d!32025 m!127411))

(declare-fun m!128395 () Bool)

(assert (=> d!32025 m!128395))

(declare-fun m!128397 () Bool)

(assert (=> d!32025 m!128397))

(declare-fun m!128399 () Bool)

(assert (=> d!32025 m!128399))

(assert (=> d!32025 m!127583))

(declare-fun m!128401 () Bool)

(assert (=> d!32025 m!128401))

(assert (=> d!32025 m!127411))

(declare-fun m!128403 () Bool)

(assert (=> d!32025 m!128403))

(assert (=> d!32025 m!127411))

(declare-fun m!128405 () Bool)

(assert (=> d!32025 m!128405))

(declare-fun m!128407 () Bool)

(assert (=> d!32025 m!128407))

(declare-fun m!128409 () Bool)

(assert (=> d!32025 m!128409))

(assert (=> d!32025 m!127411))

(declare-fun m!128411 () Bool)

(assert (=> d!32025 m!128411))

(assert (=> d!32025 m!127583))

(assert (=> d!32025 m!128135))

(declare-fun m!128413 () Bool)

(assert (=> d!32025 m!128413))

(assert (=> d!32025 m!127409))

(assert (=> d!32025 m!128401))

(assert (=> d!32025 m!128397))

(declare-fun m!128415 () Bool)

(assert (=> d!32025 m!128415))

(declare-fun m!128417 () Bool)

(assert (=> d!32025 m!128417))

(declare-fun m!128419 () Bool)

(assert (=> d!32025 m!128419))

(assert (=> d!32025 m!127809))

(assert (=> d!32025 m!127411))

(assert (=> d!32025 m!127765))

(declare-fun m!128421 () Bool)

(assert (=> b!112479 m!128421))

(assert (=> b!112477 m!127411))

(assert (=> b!112477 m!127741))

(declare-fun m!128423 () Bool)

(assert (=> bm!12060 m!128423))

(assert (=> bm!12058 m!127411))

(assert (=> bm!12058 m!127759))

(declare-fun m!128425 () Bool)

(assert (=> b!112474 m!128425))

(declare-fun m!128427 () Bool)

(assert (=> b!112481 m!128427))

(assert (=> bm!12059 m!127411))

(assert (=> bm!12059 m!127765))

(declare-fun m!128429 () Bool)

(assert (=> b!112480 m!128429))

(assert (=> b!112472 m!127411))

(declare-fun m!128431 () Bool)

(assert (=> b!112472 m!128431))

(assert (=> b!112472 m!127583))

(assert (=> b!112472 m!127583))

(assert (=> b!112472 m!127411))

(assert (=> b!112472 m!128387))

(assert (=> bm!11998 d!32025))

(declare-fun b!112482 () Bool)

(declare-fun e!73112 () Bool)

(declare-fun e!73114 () Bool)

(assert (=> b!112482 (= e!73112 e!73114)))

(declare-fun res!55469 () Bool)

(declare-fun call!12067 () Bool)

(assert (=> b!112482 (= res!55469 call!12067)))

(assert (=> b!112482 (=> (not res!55469) (not e!73114))))

(declare-fun bm!12061 () Bool)

(declare-fun call!12070 () ListLongMap!1553)

(declare-fun call!12065 () ListLongMap!1553)

(assert (=> bm!12061 (= call!12070 call!12065)))

(declare-fun b!112483 () Bool)

(declare-fun e!73108 () Bool)

(assert (=> b!112483 (= e!73108 (validKeyInArray!0 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112484 () Bool)

(declare-fun e!73118 () ListLongMap!1553)

(assert (=> b!112484 (= e!73118 call!12070)))

(declare-fun bm!12063 () Bool)

(declare-fun lt!58232 () ListLongMap!1553)

(assert (=> bm!12063 (= call!12067 (contains!829 lt!58232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!73119 () Bool)

(declare-fun b!112485 () Bool)

(assert (=> b!112485 (= e!73119 (= (apply!101 lt!58232 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)) (get!1359 (select (arr!2079 (ite (or c!20003 c!20008) (_values!2630 newMap!16) lt!57921)) #b00000000000000000000000000000000) (dynLambda!391 (defaultEntry!2647 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112485 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2337 (ite (or c!20003 c!20008) (_values!2630 newMap!16) lt!57921))))))

(assert (=> b!112485 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))

(declare-fun b!112486 () Bool)

(assert (=> b!112486 (= e!73114 (= (apply!101 lt!58232 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!20003 c!20006) lt!57642 (zeroValue!2516 newMap!16))))))

(declare-fun e!73115 () ListLongMap!1553)

(declare-fun b!112487 () Bool)

(declare-fun call!12064 () ListLongMap!1553)

(assert (=> b!112487 (= e!73115 (+!147 call!12064 (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!20003 (ite c!20006 (minValue!2516 newMap!16) lt!57642) (minValue!2516 newMap!16)))))))

(declare-fun b!112488 () Bool)

(declare-fun e!73116 () Bool)

(assert (=> b!112488 (= e!73116 e!73119)))

(declare-fun res!55465 () Bool)

(assert (=> b!112488 (=> (not res!55465) (not e!73119))))

(assert (=> b!112488 (= res!55465 (contains!829 lt!58232 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!112488 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))

(declare-fun b!112489 () Bool)

(assert (=> b!112489 (= e!73112 (not call!12067))))

(declare-fun c!20123 () Bool)

(declare-fun b!112490 () Bool)

(assert (=> b!112490 (= c!20123 (and (not (= (bvand (ite c!20003 (ite c!20006 lt!57907 lt!57909) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!20003 (ite c!20006 lt!57907 lt!57909) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!73111 () ListLongMap!1553)

(assert (=> b!112490 (= e!73111 e!73118)))

(declare-fun b!112491 () Bool)

(declare-fun res!55466 () Bool)

(declare-fun e!73110 () Bool)

(assert (=> b!112491 (=> (not res!55466) (not e!73110))))

(assert (=> b!112491 (= res!55466 e!73112)))

(declare-fun c!20127 () Bool)

(assert (=> b!112491 (= c!20127 (not (= (bvand (ite c!20003 (ite c!20006 lt!57907 lt!57909) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!112492 () Bool)

(declare-fun call!12066 () ListLongMap!1553)

(assert (=> b!112492 (= e!73118 call!12066)))

(declare-fun b!112493 () Bool)

(declare-fun e!73113 () Bool)

(assert (=> b!112493 (= e!73113 (validKeyInArray!0 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12064 () Bool)

(declare-fun call!12068 () ListLongMap!1553)

(assert (=> bm!12064 (= call!12065 call!12068)))

(declare-fun b!112494 () Bool)

(declare-fun res!55470 () Bool)

(assert (=> b!112494 (=> (not res!55470) (not e!73110))))

(assert (=> b!112494 (= res!55470 e!73116)))

(declare-fun res!55471 () Bool)

(assert (=> b!112494 (=> res!55471 e!73116)))

(assert (=> b!112494 (= res!55471 (not e!73108))))

(declare-fun res!55472 () Bool)

(assert (=> b!112494 (=> (not res!55472) (not e!73108))))

(assert (=> b!112494 (= res!55472 (bvslt #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))

(declare-fun d!32027 () Bool)

(assert (=> d!32027 e!73110))

(declare-fun res!55473 () Bool)

(assert (=> d!32027 (=> (not res!55473) (not e!73110))))

(assert (=> d!32027 (= res!55473 (or (bvsge #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))))

(declare-fun lt!58239 () ListLongMap!1553)

(assert (=> d!32027 (= lt!58232 lt!58239)))

(declare-fun lt!58224 () Unit!3461)

(declare-fun e!73109 () Unit!3461)

(assert (=> d!32027 (= lt!58224 e!73109)))

(declare-fun c!20126 () Bool)

(assert (=> d!32027 (= c!20126 e!73113)))

(declare-fun res!55467 () Bool)

(assert (=> d!32027 (=> (not res!55467) (not e!73113))))

(assert (=> d!32027 (= res!55467 (bvslt #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))

(assert (=> d!32027 (= lt!58239 e!73115)))

(declare-fun c!20125 () Bool)

(assert (=> d!32027 (= c!20125 (and (not (= (bvand (ite c!20003 (ite c!20006 lt!57907 lt!57909) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!20003 (ite c!20006 lt!57907 lt!57909) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32027 (validMask!0 (mask!6825 newMap!16))))

(assert (=> d!32027 (= (getCurrentListMap!477 (_keys!4365 newMap!16) (ite (or c!20003 c!20008) (_values!2630 newMap!16) lt!57921) (mask!6825 newMap!16) (ite c!20003 (ite c!20006 lt!57907 lt!57909) (extraKeys!2440 newMap!16)) (ite (and c!20003 c!20006) lt!57642 (zeroValue!2516 newMap!16)) (ite c!20003 (ite c!20006 (minValue!2516 newMap!16) lt!57642) (minValue!2516 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)) lt!58232)))

(declare-fun bm!12062 () Bool)

(assert (=> bm!12062 (= call!12066 call!12064)))

(declare-fun b!112495 () Bool)

(declare-fun Unit!3493 () Unit!3461)

(assert (=> b!112495 (= e!73109 Unit!3493)))

(declare-fun b!112496 () Bool)

(assert (=> b!112496 (= e!73111 call!12066)))

(declare-fun b!112497 () Bool)

(declare-fun lt!58228 () Unit!3461)

(assert (=> b!112497 (= e!73109 lt!58228)))

(declare-fun lt!58220 () ListLongMap!1553)

(assert (=> b!112497 (= lt!58220 (getCurrentListMapNoExtraKeys!114 (_keys!4365 newMap!16) (ite (or c!20003 c!20008) (_values!2630 newMap!16) lt!57921) (mask!6825 newMap!16) (ite c!20003 (ite c!20006 lt!57907 lt!57909) (extraKeys!2440 newMap!16)) (ite (and c!20003 c!20006) lt!57642 (zeroValue!2516 newMap!16)) (ite c!20003 (ite c!20006 (minValue!2516 newMap!16) lt!57642) (minValue!2516 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58230 () (_ BitVec 64))

(assert (=> b!112497 (= lt!58230 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58223 () (_ BitVec 64))

(assert (=> b!112497 (= lt!58223 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58221 () Unit!3461)

(assert (=> b!112497 (= lt!58221 (addStillContains!77 lt!58220 lt!58230 (ite (and c!20003 c!20006) lt!57642 (zeroValue!2516 newMap!16)) lt!58223))))

(assert (=> b!112497 (contains!829 (+!147 lt!58220 (tuple2!2399 lt!58230 (ite (and c!20003 c!20006) lt!57642 (zeroValue!2516 newMap!16)))) lt!58223)))

(declare-fun lt!58240 () Unit!3461)

(assert (=> b!112497 (= lt!58240 lt!58221)))

(declare-fun lt!58238 () ListLongMap!1553)

(assert (=> b!112497 (= lt!58238 (getCurrentListMapNoExtraKeys!114 (_keys!4365 newMap!16) (ite (or c!20003 c!20008) (_values!2630 newMap!16) lt!57921) (mask!6825 newMap!16) (ite c!20003 (ite c!20006 lt!57907 lt!57909) (extraKeys!2440 newMap!16)) (ite (and c!20003 c!20006) lt!57642 (zeroValue!2516 newMap!16)) (ite c!20003 (ite c!20006 (minValue!2516 newMap!16) lt!57642) (minValue!2516 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58222 () (_ BitVec 64))

(assert (=> b!112497 (= lt!58222 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58226 () (_ BitVec 64))

(assert (=> b!112497 (= lt!58226 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58225 () Unit!3461)

(assert (=> b!112497 (= lt!58225 (addApplyDifferent!77 lt!58238 lt!58222 (ite c!20003 (ite c!20006 (minValue!2516 newMap!16) lt!57642) (minValue!2516 newMap!16)) lt!58226))))

(assert (=> b!112497 (= (apply!101 (+!147 lt!58238 (tuple2!2399 lt!58222 (ite c!20003 (ite c!20006 (minValue!2516 newMap!16) lt!57642) (minValue!2516 newMap!16)))) lt!58226) (apply!101 lt!58238 lt!58226))))

(declare-fun lt!58227 () Unit!3461)

(assert (=> b!112497 (= lt!58227 lt!58225)))

(declare-fun lt!58241 () ListLongMap!1553)

(assert (=> b!112497 (= lt!58241 (getCurrentListMapNoExtraKeys!114 (_keys!4365 newMap!16) (ite (or c!20003 c!20008) (_values!2630 newMap!16) lt!57921) (mask!6825 newMap!16) (ite c!20003 (ite c!20006 lt!57907 lt!57909) (extraKeys!2440 newMap!16)) (ite (and c!20003 c!20006) lt!57642 (zeroValue!2516 newMap!16)) (ite c!20003 (ite c!20006 (minValue!2516 newMap!16) lt!57642) (minValue!2516 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58234 () (_ BitVec 64))

(assert (=> b!112497 (= lt!58234 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58233 () (_ BitVec 64))

(assert (=> b!112497 (= lt!58233 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58229 () Unit!3461)

(assert (=> b!112497 (= lt!58229 (addApplyDifferent!77 lt!58241 lt!58234 (ite (and c!20003 c!20006) lt!57642 (zeroValue!2516 newMap!16)) lt!58233))))

(assert (=> b!112497 (= (apply!101 (+!147 lt!58241 (tuple2!2399 lt!58234 (ite (and c!20003 c!20006) lt!57642 (zeroValue!2516 newMap!16)))) lt!58233) (apply!101 lt!58241 lt!58233))))

(declare-fun lt!58235 () Unit!3461)

(assert (=> b!112497 (= lt!58235 lt!58229)))

(declare-fun lt!58236 () ListLongMap!1553)

(assert (=> b!112497 (= lt!58236 (getCurrentListMapNoExtraKeys!114 (_keys!4365 newMap!16) (ite (or c!20003 c!20008) (_values!2630 newMap!16) lt!57921) (mask!6825 newMap!16) (ite c!20003 (ite c!20006 lt!57907 lt!57909) (extraKeys!2440 newMap!16)) (ite (and c!20003 c!20006) lt!57642 (zeroValue!2516 newMap!16)) (ite c!20003 (ite c!20006 (minValue!2516 newMap!16) lt!57642) (minValue!2516 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun lt!58237 () (_ BitVec 64))

(assert (=> b!112497 (= lt!58237 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58231 () (_ BitVec 64))

(assert (=> b!112497 (= lt!58231 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112497 (= lt!58228 (addApplyDifferent!77 lt!58236 lt!58237 (ite c!20003 (ite c!20006 (minValue!2516 newMap!16) lt!57642) (minValue!2516 newMap!16)) lt!58231))))

(assert (=> b!112497 (= (apply!101 (+!147 lt!58236 (tuple2!2399 lt!58237 (ite c!20003 (ite c!20006 (minValue!2516 newMap!16) lt!57642) (minValue!2516 newMap!16)))) lt!58231) (apply!101 lt!58236 lt!58231))))

(declare-fun b!112498 () Bool)

(assert (=> b!112498 (= e!73115 e!73111)))

(declare-fun c!20122 () Bool)

(assert (=> b!112498 (= c!20122 (and (not (= (bvand (ite c!20003 (ite c!20006 lt!57907 lt!57909) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!20003 (ite c!20006 lt!57907 lt!57909) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12065 () Bool)

(assert (=> bm!12065 (= call!12064 (+!147 (ite c!20125 call!12068 (ite c!20122 call!12065 call!12070)) (ite (or c!20125 c!20122) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!20003 c!20006) lt!57642 (zeroValue!2516 newMap!16))) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!20003 (ite c!20006 (minValue!2516 newMap!16) lt!57642) (minValue!2516 newMap!16))))))))

(declare-fun bm!12066 () Bool)

(assert (=> bm!12066 (= call!12068 (getCurrentListMapNoExtraKeys!114 (_keys!4365 newMap!16) (ite (or c!20003 c!20008) (_values!2630 newMap!16) lt!57921) (mask!6825 newMap!16) (ite c!20003 (ite c!20006 lt!57907 lt!57909) (extraKeys!2440 newMap!16)) (ite (and c!20003 c!20006) lt!57642 (zeroValue!2516 newMap!16)) (ite c!20003 (ite c!20006 (minValue!2516 newMap!16) lt!57642) (minValue!2516 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2647 newMap!16)))))

(declare-fun b!112499 () Bool)

(declare-fun e!73117 () Bool)

(declare-fun call!12069 () Bool)

(assert (=> b!112499 (= e!73117 (not call!12069))))

(declare-fun b!112500 () Bool)

(assert (=> b!112500 (= e!73110 e!73117)))

(declare-fun c!20124 () Bool)

(assert (=> b!112500 (= c!20124 (not (= (bvand (ite c!20003 (ite c!20006 lt!57907 lt!57909) (extraKeys!2440 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!112501 () Bool)

(declare-fun e!73107 () Bool)

(assert (=> b!112501 (= e!73107 (= (apply!101 lt!58232 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!20003 (ite c!20006 (minValue!2516 newMap!16) lt!57642) (minValue!2516 newMap!16))))))

(declare-fun b!112502 () Bool)

(assert (=> b!112502 (= e!73117 e!73107)))

(declare-fun res!55468 () Bool)

(assert (=> b!112502 (= res!55468 call!12069)))

(assert (=> b!112502 (=> (not res!55468) (not e!73107))))

(declare-fun bm!12067 () Bool)

(assert (=> bm!12067 (= call!12069 (contains!829 lt!58232 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!32027 c!20125) b!112487))

(assert (= (and d!32027 (not c!20125)) b!112498))

(assert (= (and b!112498 c!20122) b!112496))

(assert (= (and b!112498 (not c!20122)) b!112490))

(assert (= (and b!112490 c!20123) b!112492))

(assert (= (and b!112490 (not c!20123)) b!112484))

(assert (= (or b!112492 b!112484) bm!12061))

(assert (= (or b!112496 bm!12061) bm!12064))

(assert (= (or b!112496 b!112492) bm!12062))

(assert (= (or b!112487 bm!12064) bm!12066))

(assert (= (or b!112487 bm!12062) bm!12065))

(assert (= (and d!32027 res!55467) b!112493))

(assert (= (and d!32027 c!20126) b!112497))

(assert (= (and d!32027 (not c!20126)) b!112495))

(assert (= (and d!32027 res!55473) b!112494))

(assert (= (and b!112494 res!55472) b!112483))

(assert (= (and b!112494 (not res!55471)) b!112488))

(assert (= (and b!112488 res!55465) b!112485))

(assert (= (and b!112494 res!55470) b!112491))

(assert (= (and b!112491 c!20127) b!112482))

(assert (= (and b!112491 (not c!20127)) b!112489))

(assert (= (and b!112482 res!55469) b!112486))

(assert (= (or b!112482 b!112489) bm!12063))

(assert (= (and b!112491 res!55466) b!112500))

(assert (= (and b!112500 c!20124) b!112502))

(assert (= (and b!112500 (not c!20124)) b!112499))

(assert (= (and b!112502 res!55468) b!112501))

(assert (= (or b!112502 b!112499) bm!12067))

(declare-fun b_lambda!5039 () Bool)

(assert (=> (not b_lambda!5039) (not b!112485)))

(assert (=> b!112485 t!5778))

(declare-fun b_and!6913 () Bool)

(assert (= b_and!6909 (and (=> t!5778 result!3561) b_and!6913)))

(assert (=> b!112485 t!5780))

(declare-fun b_and!6915 () Bool)

(assert (= b_and!6911 (and (=> t!5780 result!3563) b_and!6915)))

(assert (=> d!32027 m!128073))

(declare-fun m!128433 () Bool)

(assert (=> bm!12063 m!128433))

(assert (=> b!112493 m!127979))

(assert (=> b!112493 m!127979))

(assert (=> b!112493 m!127981))

(declare-fun m!128435 () Bool)

(assert (=> bm!12067 m!128435))

(declare-fun m!128437 () Bool)

(assert (=> b!112485 m!128437))

(assert (=> b!112485 m!128085))

(assert (=> b!112485 m!127979))

(declare-fun m!128439 () Bool)

(assert (=> b!112485 m!128439))

(assert (=> b!112485 m!127979))

(assert (=> b!112485 m!128437))

(assert (=> b!112485 m!128085))

(declare-fun m!128441 () Bool)

(assert (=> b!112485 m!128441))

(declare-fun m!128443 () Bool)

(assert (=> b!112487 m!128443))

(declare-fun m!128445 () Bool)

(assert (=> bm!12066 m!128445))

(assert (=> b!112488 m!127979))

(assert (=> b!112488 m!127979))

(declare-fun m!128447 () Bool)

(assert (=> b!112488 m!128447))

(declare-fun m!128449 () Bool)

(assert (=> b!112497 m!128449))

(declare-fun m!128451 () Bool)

(assert (=> b!112497 m!128451))

(declare-fun m!128453 () Bool)

(assert (=> b!112497 m!128453))

(declare-fun m!128455 () Bool)

(assert (=> b!112497 m!128455))

(declare-fun m!128457 () Bool)

(assert (=> b!112497 m!128457))

(declare-fun m!128459 () Bool)

(assert (=> b!112497 m!128459))

(declare-fun m!128461 () Bool)

(assert (=> b!112497 m!128461))

(declare-fun m!128463 () Bool)

(assert (=> b!112497 m!128463))

(declare-fun m!128465 () Bool)

(assert (=> b!112497 m!128465))

(assert (=> b!112497 m!128461))

(declare-fun m!128467 () Bool)

(assert (=> b!112497 m!128467))

(declare-fun m!128469 () Bool)

(assert (=> b!112497 m!128469))

(declare-fun m!128471 () Bool)

(assert (=> b!112497 m!128471))

(assert (=> b!112497 m!128463))

(declare-fun m!128473 () Bool)

(assert (=> b!112497 m!128473))

(assert (=> b!112497 m!128445))

(declare-fun m!128475 () Bool)

(assert (=> b!112497 m!128475))

(assert (=> b!112497 m!128449))

(declare-fun m!128477 () Bool)

(assert (=> b!112497 m!128477))

(assert (=> b!112497 m!127979))

(assert (=> b!112497 m!128455))

(assert (=> b!112483 m!127979))

(assert (=> b!112483 m!127979))

(assert (=> b!112483 m!127981))

(declare-fun m!128479 () Bool)

(assert (=> b!112486 m!128479))

(declare-fun m!128481 () Bool)

(assert (=> b!112501 m!128481))

(declare-fun m!128483 () Bool)

(assert (=> bm!12065 m!128483))

(assert (=> bm!12000 d!32027))

(declare-fun d!32029 () Bool)

(declare-fun e!73121 () Bool)

(assert (=> d!32029 e!73121))

(declare-fun res!55474 () Bool)

(assert (=> d!32029 (=> res!55474 e!73121)))

(declare-fun lt!58243 () Bool)

(assert (=> d!32029 (= res!55474 (not lt!58243))))

(declare-fun lt!58242 () Bool)

(assert (=> d!32029 (= lt!58243 lt!58242)))

(declare-fun lt!58244 () Unit!3461)

(declare-fun e!73120 () Unit!3461)

(assert (=> d!32029 (= lt!58244 e!73120)))

(declare-fun c!20128 () Bool)

(assert (=> d!32029 (= c!20128 lt!58242)))

(assert (=> d!32029 (= lt!58242 (containsKey!163 (toList!792 lt!57771) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32029 (= (contains!829 lt!57771 #b0000000000000000000000000000000000000000000000000000000000000000) lt!58243)))

(declare-fun b!112503 () Bool)

(declare-fun lt!58245 () Unit!3461)

(assert (=> b!112503 (= e!73120 lt!58245)))

(assert (=> b!112503 (= lt!58245 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 lt!57771) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112503 (isDefined!112 (getValueByKey!160 (toList!792 lt!57771) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112504 () Bool)

(declare-fun Unit!3494 () Unit!3461)

(assert (=> b!112504 (= e!73120 Unit!3494)))

(declare-fun b!112505 () Bool)

(assert (=> b!112505 (= e!73121 (isDefined!112 (getValueByKey!160 (toList!792 lt!57771) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32029 c!20128) b!112503))

(assert (= (and d!32029 (not c!20128)) b!112504))

(assert (= (and d!32029 (not res!55474)) b!112505))

(declare-fun m!128485 () Bool)

(assert (=> d!32029 m!128485))

(declare-fun m!128487 () Bool)

(assert (=> b!112503 m!128487))

(declare-fun m!128489 () Bool)

(assert (=> b!112503 m!128489))

(assert (=> b!112503 m!128489))

(declare-fun m!128491 () Bool)

(assert (=> b!112503 m!128491))

(assert (=> b!112505 m!128489))

(assert (=> b!112505 m!128489))

(assert (=> b!112505 m!128491))

(assert (=> bm!11928 d!32029))

(assert (=> b!111879 d!31873))

(declare-fun d!32031 () Bool)

(declare-fun isEmpty!387 (List!1613) Bool)

(assert (=> d!32031 (= (isEmpty!385 lt!57807) (isEmpty!387 (toList!792 lt!57807)))))

(declare-fun bs!4635 () Bool)

(assert (= bs!4635 d!32031))

(declare-fun m!128493 () Bool)

(assert (=> bs!4635 m!128493))

(assert (=> b!111955 d!32031))

(declare-fun d!32033 () Bool)

(declare-fun res!55484 () Bool)

(declare-fun e!73124 () Bool)

(assert (=> d!32033 (=> (not res!55484) (not e!73124))))

(assert (=> d!32033 (= res!55484 (validMask!0 (mask!6825 newMap!16)))))

(assert (=> d!32033 (= (simpleValid!77 newMap!16) e!73124)))

(declare-fun b!112516 () Bool)

(declare-fun res!55485 () Bool)

(assert (=> b!112516 (=> (not res!55485) (not e!73124))))

(declare-fun size!2342 (LongMapFixedSize!922) (_ BitVec 32))

(assert (=> b!112516 (= res!55485 (= (size!2342 newMap!16) (bvadd (_size!510 newMap!16) (bvsdiv (bvadd (extraKeys!2440 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!112517 () Bool)

(assert (=> b!112517 (= e!73124 (and (bvsge (extraKeys!2440 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2440 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!510 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!112515 () Bool)

(declare-fun res!55486 () Bool)

(assert (=> b!112515 (=> (not res!55486) (not e!73124))))

(assert (=> b!112515 (= res!55486 (bvsge (size!2342 newMap!16) (_size!510 newMap!16)))))

(declare-fun b!112514 () Bool)

(declare-fun res!55483 () Bool)

(assert (=> b!112514 (=> (not res!55483) (not e!73124))))

(assert (=> b!112514 (= res!55483 (and (= (size!2337 (_values!2630 newMap!16)) (bvadd (mask!6825 newMap!16) #b00000000000000000000000000000001)) (= (size!2336 (_keys!4365 newMap!16)) (size!2337 (_values!2630 newMap!16))) (bvsge (_size!510 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!510 newMap!16) (bvadd (mask!6825 newMap!16) #b00000000000000000000000000000001))))))

(assert (= (and d!32033 res!55484) b!112514))

(assert (= (and b!112514 res!55483) b!112515))

(assert (= (and b!112515 res!55486) b!112516))

(assert (= (and b!112516 res!55485) b!112517))

(assert (=> d!32033 m!128073))

(declare-fun m!128495 () Bool)

(assert (=> b!112516 m!128495))

(assert (=> b!112515 m!128495))

(assert (=> d!31869 d!32033))

(declare-fun d!32035 () Bool)

(declare-fun res!55487 () Bool)

(declare-fun e!73125 () Bool)

(assert (=> d!32035 (=> (not res!55487) (not e!73125))))

(assert (=> d!32035 (= res!55487 (simpleValid!77 (v!2946 (underlying!373 thiss!992))))))

(assert (=> d!32035 (= (valid!436 (v!2946 (underlying!373 thiss!992))) e!73125)))

(declare-fun b!112518 () Bool)

(declare-fun res!55488 () Bool)

(assert (=> b!112518 (=> (not res!55488) (not e!73125))))

(assert (=> b!112518 (= res!55488 (= (arrayCountValidKeys!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000 (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))) (_size!510 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!112519 () Bool)

(declare-fun res!55489 () Bool)

(assert (=> b!112519 (=> (not res!55489) (not e!73125))))

(assert (=> b!112519 (= res!55489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (mask!6825 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!112520 () Bool)

(assert (=> b!112520 (= e!73125 (arrayNoDuplicates!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000 Nil!1611))))

(assert (= (and d!32035 res!55487) b!112518))

(assert (= (and b!112518 res!55488) b!112519))

(assert (= (and b!112519 res!55489) b!112520))

(declare-fun m!128497 () Bool)

(assert (=> d!32035 m!128497))

(declare-fun m!128499 () Bool)

(assert (=> b!112518 m!128499))

(assert (=> b!112519 m!127441))

(declare-fun m!128501 () Bool)

(assert (=> b!112520 m!128501))

(assert (=> d!31829 d!32035))

(declare-fun b!112521 () Bool)

(declare-fun e!73128 () Bool)

(declare-fun e!73126 () Bool)

(assert (=> b!112521 (= e!73128 e!73126)))

(declare-fun lt!58246 () (_ BitVec 64))

(assert (=> b!112521 (= lt!58246 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58248 () Unit!3461)

(assert (=> b!112521 (= lt!58248 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4365 newMap!16) lt!58246 #b00000000000000000000000000000000))))

(assert (=> b!112521 (arrayContainsKey!0 (_keys!4365 newMap!16) lt!58246 #b00000000000000000000000000000000)))

(declare-fun lt!58247 () Unit!3461)

(assert (=> b!112521 (= lt!58247 lt!58248)))

(declare-fun res!55491 () Bool)

(assert (=> b!112521 (= res!55491 (= (seekEntryOrOpen!0 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000) (_keys!4365 newMap!16) (mask!6825 newMap!16)) (Found!256 #b00000000000000000000000000000000)))))

(assert (=> b!112521 (=> (not res!55491) (not e!73126))))

(declare-fun b!112522 () Bool)

(declare-fun call!12071 () Bool)

(assert (=> b!112522 (= e!73128 call!12071)))

(declare-fun b!112523 () Bool)

(assert (=> b!112523 (= e!73126 call!12071)))

(declare-fun b!112524 () Bool)

(declare-fun e!73127 () Bool)

(assert (=> b!112524 (= e!73127 e!73128)))

(declare-fun c!20129 () Bool)

(assert (=> b!112524 (= c!20129 (validKeyInArray!0 (select (arr!2078 (_keys!4365 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!32037 () Bool)

(declare-fun res!55490 () Bool)

(assert (=> d!32037 (=> res!55490 e!73127)))

(assert (=> d!32037 (= res!55490 (bvsge #b00000000000000000000000000000000 (size!2336 (_keys!4365 newMap!16))))))

(assert (=> d!32037 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4365 newMap!16) (mask!6825 newMap!16)) e!73127)))

(declare-fun bm!12068 () Bool)

(assert (=> bm!12068 (= call!12071 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4365 newMap!16) (mask!6825 newMap!16)))))

(assert (= (and d!32037 (not res!55490)) b!112524))

(assert (= (and b!112524 c!20129) b!112521))

(assert (= (and b!112524 (not c!20129)) b!112522))

(assert (= (and b!112521 res!55491) b!112523))

(assert (= (or b!112523 b!112522) bm!12068))

(assert (=> b!112521 m!127979))

(declare-fun m!128503 () Bool)

(assert (=> b!112521 m!128503))

(declare-fun m!128505 () Bool)

(assert (=> b!112521 m!128505))

(assert (=> b!112521 m!127979))

(declare-fun m!128507 () Bool)

(assert (=> b!112521 m!128507))

(assert (=> b!112524 m!127979))

(assert (=> b!112524 m!127979))

(assert (=> b!112524 m!127981))

(declare-fun m!128509 () Bool)

(assert (=> bm!12068 m!128509))

(assert (=> b!112116 d!32037))

(declare-fun d!32039 () Bool)

(declare-fun e!73130 () Bool)

(assert (=> d!32039 e!73130))

(declare-fun res!55492 () Bool)

(assert (=> d!32039 (=> res!55492 e!73130)))

(declare-fun lt!58250 () Bool)

(assert (=> d!32039 (= res!55492 (not lt!58250))))

(declare-fun lt!58249 () Bool)

(assert (=> d!32039 (= lt!58250 lt!58249)))

(declare-fun lt!58251 () Unit!3461)

(declare-fun e!73129 () Unit!3461)

(assert (=> d!32039 (= lt!58251 e!73129)))

(declare-fun c!20130 () Bool)

(assert (=> d!32039 (= c!20130 lt!58249)))

(assert (=> d!32039 (= lt!58249 (containsKey!163 (toList!792 lt!57831) (_1!1210 lt!57633)))))

(assert (=> d!32039 (= (contains!829 lt!57831 (_1!1210 lt!57633)) lt!58250)))

(declare-fun b!112525 () Bool)

(declare-fun lt!58252 () Unit!3461)

(assert (=> b!112525 (= e!73129 lt!58252)))

(assert (=> b!112525 (= lt!58252 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 lt!57831) (_1!1210 lt!57633)))))

(assert (=> b!112525 (isDefined!112 (getValueByKey!160 (toList!792 lt!57831) (_1!1210 lt!57633)))))

(declare-fun b!112526 () Bool)

(declare-fun Unit!3495 () Unit!3461)

(assert (=> b!112526 (= e!73129 Unit!3495)))

(declare-fun b!112527 () Bool)

(assert (=> b!112527 (= e!73130 (isDefined!112 (getValueByKey!160 (toList!792 lt!57831) (_1!1210 lt!57633))))))

(assert (= (and d!32039 c!20130) b!112525))

(assert (= (and d!32039 (not c!20130)) b!112526))

(assert (= (and d!32039 (not res!55492)) b!112527))

(declare-fun m!128511 () Bool)

(assert (=> d!32039 m!128511))

(declare-fun m!128513 () Bool)

(assert (=> b!112525 m!128513))

(assert (=> b!112525 m!127719))

(assert (=> b!112525 m!127719))

(declare-fun m!128515 () Bool)

(assert (=> b!112525 m!128515))

(assert (=> b!112527 m!127719))

(assert (=> b!112527 m!127719))

(assert (=> b!112527 m!128515))

(assert (=> d!31859 d!32039))

(declare-fun b!112528 () Bool)

(declare-fun e!73131 () Option!166)

(assert (=> b!112528 (= e!73131 (Some!165 (_2!1210 (h!2209 lt!57832))))))

(declare-fun b!112531 () Bool)

(declare-fun e!73132 () Option!166)

(assert (=> b!112531 (= e!73132 None!164)))

(declare-fun b!112529 () Bool)

(assert (=> b!112529 (= e!73131 e!73132)))

(declare-fun c!20132 () Bool)

(assert (=> b!112529 (= c!20132 (and ((_ is Cons!1609) lt!57832) (not (= (_1!1210 (h!2209 lt!57832)) (_1!1210 lt!57633)))))))

(declare-fun d!32041 () Bool)

(declare-fun c!20131 () Bool)

(assert (=> d!32041 (= c!20131 (and ((_ is Cons!1609) lt!57832) (= (_1!1210 (h!2209 lt!57832)) (_1!1210 lt!57633))))))

(assert (=> d!32041 (= (getValueByKey!160 lt!57832 (_1!1210 lt!57633)) e!73131)))

(declare-fun b!112530 () Bool)

(assert (=> b!112530 (= e!73132 (getValueByKey!160 (t!5763 lt!57832) (_1!1210 lt!57633)))))

(assert (= (and d!32041 c!20131) b!112528))

(assert (= (and d!32041 (not c!20131)) b!112529))

(assert (= (and b!112529 c!20132) b!112530))

(assert (= (and b!112529 (not c!20132)) b!112531))

(declare-fun m!128517 () Bool)

(assert (=> b!112530 m!128517))

(assert (=> d!31859 d!32041))

(declare-fun d!32043 () Bool)

(assert (=> d!32043 (= (getValueByKey!160 lt!57832 (_1!1210 lt!57633)) (Some!165 (_2!1210 lt!57633)))))

(declare-fun lt!58253 () Unit!3461)

(assert (=> d!32043 (= lt!58253 (choose!708 lt!57832 (_1!1210 lt!57633) (_2!1210 lt!57633)))))

(declare-fun e!73133 () Bool)

(assert (=> d!32043 e!73133))

(declare-fun res!55493 () Bool)

(assert (=> d!32043 (=> (not res!55493) (not e!73133))))

(assert (=> d!32043 (= res!55493 (isStrictlySorted!299 lt!57832))))

(assert (=> d!32043 (= (lemmaContainsTupThenGetReturnValue!76 lt!57832 (_1!1210 lt!57633) (_2!1210 lt!57633)) lt!58253)))

(declare-fun b!112532 () Bool)

(declare-fun res!55494 () Bool)

(assert (=> b!112532 (=> (not res!55494) (not e!73133))))

(assert (=> b!112532 (= res!55494 (containsKey!163 lt!57832 (_1!1210 lt!57633)))))

(declare-fun b!112533 () Bool)

(assert (=> b!112533 (= e!73133 (contains!833 lt!57832 (tuple2!2399 (_1!1210 lt!57633) (_2!1210 lt!57633))))))

(assert (= (and d!32043 res!55493) b!112532))

(assert (= (and b!112532 res!55494) b!112533))

(assert (=> d!32043 m!127713))

(declare-fun m!128519 () Bool)

(assert (=> d!32043 m!128519))

(declare-fun m!128521 () Bool)

(assert (=> d!32043 m!128521))

(declare-fun m!128523 () Bool)

(assert (=> b!112532 m!128523))

(declare-fun m!128525 () Bool)

(assert (=> b!112533 m!128525))

(assert (=> d!31859 d!32043))

(declare-fun b!112534 () Bool)

(declare-fun e!73138 () Bool)

(declare-fun lt!58254 () List!1613)

(assert (=> b!112534 (= e!73138 (contains!833 lt!58254 (tuple2!2399 (_1!1210 lt!57633) (_2!1210 lt!57633))))))

(declare-fun b!112535 () Bool)

(declare-fun res!55496 () Bool)

(assert (=> b!112535 (=> (not res!55496) (not e!73138))))

(assert (=> b!112535 (= res!55496 (containsKey!163 lt!58254 (_1!1210 lt!57633)))))

(declare-fun bm!12069 () Bool)

(declare-fun call!12073 () List!1613)

(declare-fun call!12072 () List!1613)

(assert (=> bm!12069 (= call!12073 call!12072)))

(declare-fun b!112536 () Bool)

(declare-fun e!73135 () List!1613)

(assert (=> b!112536 (= e!73135 call!12073)))

(declare-fun c!20134 () Bool)

(declare-fun b!112537 () Bool)

(declare-fun c!20133 () Bool)

(declare-fun e!73137 () List!1613)

(assert (=> b!112537 (= e!73137 (ite c!20134 (t!5763 (toList!792 lt!57631)) (ite c!20133 (Cons!1609 (h!2209 (toList!792 lt!57631)) (t!5763 (toList!792 lt!57631))) Nil!1610)))))

(declare-fun b!112538 () Bool)

(declare-fun e!73136 () List!1613)

(declare-fun e!73134 () List!1613)

(assert (=> b!112538 (= e!73136 e!73134)))

(assert (=> b!112538 (= c!20134 (and ((_ is Cons!1609) (toList!792 lt!57631)) (= (_1!1210 (h!2209 (toList!792 lt!57631))) (_1!1210 lt!57633))))))

(declare-fun b!112539 () Bool)

(assert (=> b!112539 (= c!20133 (and ((_ is Cons!1609) (toList!792 lt!57631)) (bvsgt (_1!1210 (h!2209 (toList!792 lt!57631))) (_1!1210 lt!57633))))))

(assert (=> b!112539 (= e!73134 e!73135)))

(declare-fun bm!12070 () Bool)

(declare-fun call!12074 () List!1613)

(declare-fun c!20136 () Bool)

(assert (=> bm!12070 (= call!12074 ($colon$colon!83 e!73137 (ite c!20136 (h!2209 (toList!792 lt!57631)) (tuple2!2399 (_1!1210 lt!57633) (_2!1210 lt!57633)))))))

(declare-fun c!20135 () Bool)

(assert (=> bm!12070 (= c!20135 c!20136)))

(declare-fun b!112540 () Bool)

(assert (=> b!112540 (= e!73134 call!12072)))

(declare-fun bm!12071 () Bool)

(assert (=> bm!12071 (= call!12072 call!12074)))

(declare-fun d!32045 () Bool)

(assert (=> d!32045 e!73138))

(declare-fun res!55495 () Bool)

(assert (=> d!32045 (=> (not res!55495) (not e!73138))))

(assert (=> d!32045 (= res!55495 (isStrictlySorted!299 lt!58254))))

(assert (=> d!32045 (= lt!58254 e!73136)))

(assert (=> d!32045 (= c!20136 (and ((_ is Cons!1609) (toList!792 lt!57631)) (bvslt (_1!1210 (h!2209 (toList!792 lt!57631))) (_1!1210 lt!57633))))))

(assert (=> d!32045 (isStrictlySorted!299 (toList!792 lt!57631))))

(assert (=> d!32045 (= (insertStrictlySorted!79 (toList!792 lt!57631) (_1!1210 lt!57633) (_2!1210 lt!57633)) lt!58254)))

(declare-fun b!112541 () Bool)

(assert (=> b!112541 (= e!73136 call!12074)))

(declare-fun b!112542 () Bool)

(assert (=> b!112542 (= e!73137 (insertStrictlySorted!79 (t!5763 (toList!792 lt!57631)) (_1!1210 lt!57633) (_2!1210 lt!57633)))))

(declare-fun b!112543 () Bool)

(assert (=> b!112543 (= e!73135 call!12073)))

(assert (= (and d!32045 c!20136) b!112541))

(assert (= (and d!32045 (not c!20136)) b!112538))

(assert (= (and b!112538 c!20134) b!112540))

(assert (= (and b!112538 (not c!20134)) b!112539))

(assert (= (and b!112539 c!20133) b!112536))

(assert (= (and b!112539 (not c!20133)) b!112543))

(assert (= (or b!112536 b!112543) bm!12069))

(assert (= (or b!112540 bm!12069) bm!12071))

(assert (= (or b!112541 bm!12071) bm!12070))

(assert (= (and bm!12070 c!20135) b!112542))

(assert (= (and bm!12070 (not c!20135)) b!112537))

(assert (= (and d!32045 res!55495) b!112535))

(assert (= (and b!112535 res!55496) b!112534))

(declare-fun m!128527 () Bool)

(assert (=> b!112535 m!128527))

(declare-fun m!128529 () Bool)

(assert (=> bm!12070 m!128529))

(declare-fun m!128531 () Bool)

(assert (=> b!112534 m!128531))

(declare-fun m!128533 () Bool)

(assert (=> d!32045 m!128533))

(assert (=> d!32045 m!128301))

(declare-fun m!128535 () Bool)

(assert (=> b!112542 m!128535))

(assert (=> d!31859 d!32045))

(assert (=> d!31831 d!31835))

(declare-fun d!32047 () Bool)

(assert (=> d!32047 (not (arrayContainsKey!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!32047 true))

(declare-fun _$68!115 () Unit!3461)

(assert (=> d!32047 (= (choose!68 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (Cons!1610 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1611)) _$68!115)))

(declare-fun bs!4636 () Bool)

(assert (= bs!4636 d!32047))

(assert (=> bs!4636 m!127411))

(assert (=> bs!4636 m!127449))

(assert (=> d!31831 d!32047))

(declare-fun d!32049 () Bool)

(declare-fun lt!58255 () Bool)

(assert (=> d!32049 (= lt!58255 (select (content!117 (toList!792 lt!57823)) lt!57633))))

(declare-fun e!73139 () Bool)

(assert (=> d!32049 (= lt!58255 e!73139)))

(declare-fun res!55497 () Bool)

(assert (=> d!32049 (=> (not res!55497) (not e!73139))))

(assert (=> d!32049 (= res!55497 ((_ is Cons!1609) (toList!792 lt!57823)))))

(assert (=> d!32049 (= (contains!833 (toList!792 lt!57823) lt!57633) lt!58255)))

(declare-fun b!112544 () Bool)

(declare-fun e!73140 () Bool)

(assert (=> b!112544 (= e!73139 e!73140)))

(declare-fun res!55498 () Bool)

(assert (=> b!112544 (=> res!55498 e!73140)))

(assert (=> b!112544 (= res!55498 (= (h!2209 (toList!792 lt!57823)) lt!57633))))

(declare-fun b!112545 () Bool)

(assert (=> b!112545 (= e!73140 (contains!833 (t!5763 (toList!792 lt!57823)) lt!57633))))

(assert (= (and d!32049 res!55497) b!112544))

(assert (= (and b!112544 (not res!55498)) b!112545))

(declare-fun m!128537 () Bool)

(assert (=> d!32049 m!128537))

(declare-fun m!128539 () Bool)

(assert (=> d!32049 m!128539))

(declare-fun m!128541 () Bool)

(assert (=> b!112545 m!128541))

(assert (=> b!111969 d!32049))

(declare-fun d!32051 () Bool)

(assert (=> d!32051 (= (get!1363 (select (arr!2079 (_values!2630 (v!2946 (underlying!373 thiss!992)))) from!355) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!391 (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112123 d!32051))

(declare-fun d!32053 () Bool)

(declare-fun lt!58256 () Bool)

(assert (=> d!32053 (= lt!58256 (select (content!117 (toList!792 lt!57819)) lt!57632))))

(declare-fun e!73141 () Bool)

(assert (=> d!32053 (= lt!58256 e!73141)))

(declare-fun res!55499 () Bool)

(assert (=> d!32053 (=> (not res!55499) (not e!73141))))

(assert (=> d!32053 (= res!55499 ((_ is Cons!1609) (toList!792 lt!57819)))))

(assert (=> d!32053 (= (contains!833 (toList!792 lt!57819) lt!57632) lt!58256)))

(declare-fun b!112546 () Bool)

(declare-fun e!73142 () Bool)

(assert (=> b!112546 (= e!73141 e!73142)))

(declare-fun res!55500 () Bool)

(assert (=> b!112546 (=> res!55500 e!73142)))

(assert (=> b!112546 (= res!55500 (= (h!2209 (toList!792 lt!57819)) lt!57632))))

(declare-fun b!112547 () Bool)

(assert (=> b!112547 (= e!73142 (contains!833 (t!5763 (toList!792 lt!57819)) lt!57632))))

(assert (= (and d!32053 res!55499) b!112546))

(assert (= (and b!112546 (not res!55500)) b!112547))

(declare-fun m!128543 () Bool)

(assert (=> d!32053 m!128543))

(declare-fun m!128545 () Bool)

(assert (=> d!32053 m!128545))

(declare-fun m!128547 () Bool)

(assert (=> b!112547 m!128547))

(assert (=> b!111967 d!32053))

(declare-fun d!32055 () Bool)

(declare-fun e!73143 () Bool)

(assert (=> d!32055 e!73143))

(declare-fun res!55502 () Bool)

(assert (=> d!32055 (=> (not res!55502) (not e!73143))))

(declare-fun lt!58257 () ListLongMap!1553)

(assert (=> d!32055 (= res!55502 (contains!829 lt!58257 (_1!1210 (ite c!20003 (ite c!20006 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57642) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57642)) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)))))))

(declare-fun lt!58258 () List!1613)

(assert (=> d!32055 (= lt!58257 (ListLongMap!1554 lt!58258))))

(declare-fun lt!58259 () Unit!3461)

(declare-fun lt!58260 () Unit!3461)

(assert (=> d!32055 (= lt!58259 lt!58260)))

(assert (=> d!32055 (= (getValueByKey!160 lt!58258 (_1!1210 (ite c!20003 (ite c!20006 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57642) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57642)) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)))) (Some!165 (_2!1210 (ite c!20003 (ite c!20006 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57642) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57642)) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)))))))

(assert (=> d!32055 (= lt!58260 (lemmaContainsTupThenGetReturnValue!76 lt!58258 (_1!1210 (ite c!20003 (ite c!20006 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57642) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57642)) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))) (_2!1210 (ite c!20003 (ite c!20006 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57642) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57642)) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)))))))

(assert (=> d!32055 (= lt!58258 (insertStrictlySorted!79 (toList!792 (ite c!20003 call!12010 call!12011)) (_1!1210 (ite c!20003 (ite c!20006 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57642) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57642)) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))) (_2!1210 (ite c!20003 (ite c!20006 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57642) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57642)) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)))))))

(assert (=> d!32055 (= (+!147 (ite c!20003 call!12010 call!12011) (ite c!20003 (ite c!20006 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57642) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57642)) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))) lt!58257)))

(declare-fun b!112548 () Bool)

(declare-fun res!55501 () Bool)

(assert (=> b!112548 (=> (not res!55501) (not e!73143))))

(assert (=> b!112548 (= res!55501 (= (getValueByKey!160 (toList!792 lt!58257) (_1!1210 (ite c!20003 (ite c!20006 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57642) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57642)) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)))) (Some!165 (_2!1210 (ite c!20003 (ite c!20006 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57642) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57642)) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))))

(declare-fun b!112549 () Bool)

(assert (=> b!112549 (= e!73143 (contains!833 (toList!792 lt!58257) (ite c!20003 (ite c!20006 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57642) (tuple2!2399 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57642)) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(assert (= (and d!32055 res!55502) b!112548))

(assert (= (and b!112548 res!55501) b!112549))

(declare-fun m!128549 () Bool)

(assert (=> d!32055 m!128549))

(declare-fun m!128551 () Bool)

(assert (=> d!32055 m!128551))

(declare-fun m!128553 () Bool)

(assert (=> d!32055 m!128553))

(declare-fun m!128555 () Bool)

(assert (=> d!32055 m!128555))

(declare-fun m!128557 () Bool)

(assert (=> b!112548 m!128557))

(declare-fun m!128559 () Bool)

(assert (=> b!112549 m!128559))

(assert (=> bm!11990 d!32055))

(declare-fun d!32057 () Bool)

(declare-fun e!73145 () Bool)

(assert (=> d!32057 e!73145))

(declare-fun res!55503 () Bool)

(assert (=> d!32057 (=> res!55503 e!73145)))

(declare-fun lt!58262 () Bool)

(assert (=> d!32057 (= res!55503 (not lt!58262))))

(declare-fun lt!58261 () Bool)

(assert (=> d!32057 (= lt!58262 lt!58261)))

(declare-fun lt!58263 () Unit!3461)

(declare-fun e!73144 () Unit!3461)

(assert (=> d!32057 (= lt!58263 e!73144)))

(declare-fun c!20137 () Bool)

(assert (=> d!32057 (= c!20137 lt!58261)))

(assert (=> d!32057 (= lt!58261 (containsKey!163 (toList!792 lt!57771) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!32057 (= (contains!829 lt!57771 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!58262)))

(declare-fun b!112550 () Bool)

(declare-fun lt!58264 () Unit!3461)

(assert (=> b!112550 (= e!73144 lt!58264)))

(assert (=> b!112550 (= lt!58264 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 lt!57771) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!112550 (isDefined!112 (getValueByKey!160 (toList!792 lt!57771) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!112551 () Bool)

(declare-fun Unit!3496 () Unit!3461)

(assert (=> b!112551 (= e!73144 Unit!3496)))

(declare-fun b!112552 () Bool)

(assert (=> b!112552 (= e!73145 (isDefined!112 (getValueByKey!160 (toList!792 lt!57771) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!32057 c!20137) b!112550))

(assert (= (and d!32057 (not c!20137)) b!112551))

(assert (= (and d!32057 (not res!55503)) b!112552))

(assert (=> d!32057 m!127587))

(declare-fun m!128561 () Bool)

(assert (=> d!32057 m!128561))

(assert (=> b!112550 m!127587))

(declare-fun m!128563 () Bool)

(assert (=> b!112550 m!128563))

(assert (=> b!112550 m!127587))

(assert (=> b!112550 m!127971))

(assert (=> b!112550 m!127971))

(declare-fun m!128565 () Bool)

(assert (=> b!112550 m!128565))

(assert (=> b!112552 m!127587))

(assert (=> b!112552 m!127971))

(assert (=> b!112552 m!127971))

(assert (=> b!112552 m!128565))

(assert (=> b!111884 d!32057))

(assert (=> bm!11989 d!31967))

(declare-fun d!32059 () Bool)

(assert (=> d!32059 (= (apply!101 lt!57771 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1364 (getValueByKey!160 (toList!792 lt!57771) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4637 () Bool)

(assert (= bs!4637 d!32059))

(assert (=> bs!4637 m!128489))

(assert (=> bs!4637 m!128489))

(declare-fun m!128567 () Bool)

(assert (=> bs!4637 m!128567))

(assert (=> b!111882 d!32059))

(declare-fun d!32061 () Bool)

(declare-fun e!73147 () Bool)

(assert (=> d!32061 e!73147))

(declare-fun res!55504 () Bool)

(assert (=> d!32061 (=> res!55504 e!73147)))

(declare-fun lt!58266 () Bool)

(assert (=> d!32061 (= res!55504 (not lt!58266))))

(declare-fun lt!58265 () Bool)

(assert (=> d!32061 (= lt!58266 lt!58265)))

(declare-fun lt!58267 () Unit!3461)

(declare-fun e!73146 () Unit!3461)

(assert (=> d!32061 (= lt!58267 e!73146)))

(declare-fun c!20138 () Bool)

(assert (=> d!32061 (= c!20138 lt!58265)))

(assert (=> d!32061 (= lt!58265 (containsKey!163 (toList!792 lt!57807) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32061 (= (contains!829 lt!57807 #b1000000000000000000000000000000000000000000000000000000000000000) lt!58266)))

(declare-fun b!112553 () Bool)

(declare-fun lt!58268 () Unit!3461)

(assert (=> b!112553 (= e!73146 lt!58268)))

(assert (=> b!112553 (= lt!58268 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!792 lt!57807) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112553 (isDefined!112 (getValueByKey!160 (toList!792 lt!57807) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112554 () Bool)

(declare-fun Unit!3497 () Unit!3461)

(assert (=> b!112554 (= e!73146 Unit!3497)))

(declare-fun b!112555 () Bool)

(assert (=> b!112555 (= e!73147 (isDefined!112 (getValueByKey!160 (toList!792 lt!57807) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32061 c!20138) b!112553))

(assert (= (and d!32061 (not c!20138)) b!112554))

(assert (= (and d!32061 (not res!55504)) b!112555))

(declare-fun m!128569 () Bool)

(assert (=> d!32061 m!128569))

(declare-fun m!128571 () Bool)

(assert (=> b!112553 m!128571))

(declare-fun m!128573 () Bool)

(assert (=> b!112553 m!128573))

(assert (=> b!112553 m!128573))

(declare-fun m!128575 () Bool)

(assert (=> b!112553 m!128575))

(assert (=> b!112555 m!128573))

(assert (=> b!112555 m!128573))

(assert (=> b!112555 m!128575))

(assert (=> b!111959 d!32061))

(declare-fun d!32063 () Bool)

(declare-fun e!73148 () Bool)

(assert (=> d!32063 e!73148))

(declare-fun res!55506 () Bool)

(assert (=> d!32063 (=> (not res!55506) (not e!73148))))

(declare-fun lt!58269 () ListLongMap!1553)

(assert (=> d!32063 (= res!55506 (contains!829 lt!58269 (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(declare-fun lt!58270 () List!1613)

(assert (=> d!32063 (= lt!58269 (ListLongMap!1554 lt!58270))))

(declare-fun lt!58271 () Unit!3461)

(declare-fun lt!58272 () Unit!3461)

(assert (=> d!32063 (= lt!58271 lt!58272)))

(assert (=> d!32063 (= (getValueByKey!160 lt!58270 (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))) (Some!165 (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(assert (=> d!32063 (= lt!58272 (lemmaContainsTupThenGetReturnValue!76 lt!58270 (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)) (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(assert (=> d!32063 (= lt!58270 (insertStrictlySorted!79 (toList!792 call!11990) (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)) (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(assert (=> d!32063 (= (+!147 call!11990 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)) lt!58269)))

(declare-fun b!112556 () Bool)

(declare-fun res!55505 () Bool)

(assert (=> b!112556 (=> (not res!55505) (not e!73148))))

(assert (=> b!112556 (= res!55505 (= (getValueByKey!160 (toList!792 lt!58269) (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))) (Some!165 (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)))))))

(declare-fun b!112557 () Bool)

(assert (=> b!112557 (= e!73148 (contains!833 (toList!792 lt!58269) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)))))

(assert (= (and d!32063 res!55506) b!112556))

(assert (= (and b!112556 res!55505) b!112557))

(declare-fun m!128577 () Bool)

(assert (=> d!32063 m!128577))

(declare-fun m!128579 () Bool)

(assert (=> d!32063 m!128579))

(declare-fun m!128581 () Bool)

(assert (=> d!32063 m!128581))

(declare-fun m!128583 () Bool)

(assert (=> d!32063 m!128583))

(declare-fun m!128585 () Bool)

(assert (=> b!112556 m!128585))

(declare-fun m!128587 () Bool)

(assert (=> b!112557 m!128587))

(assert (=> b!112073 d!32063))

(declare-fun d!32065 () Bool)

(assert (=> d!32065 (= (validKeyInArray!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112108 d!32065))

(declare-fun b!112574 () Bool)

(declare-fun res!55518 () Bool)

(declare-fun e!73159 () Bool)

(assert (=> b!112574 (=> (not res!55518) (not e!73159))))

(declare-fun call!12079 () Bool)

(assert (=> b!112574 (= res!55518 call!12079)))

(declare-fun e!73157 () Bool)

(assert (=> b!112574 (= e!73157 e!73159)))

(declare-fun b!112575 () Bool)

(declare-fun res!55516 () Bool)

(assert (=> b!112575 (=> (not res!55516) (not e!73159))))

(declare-fun lt!58278 () SeekEntryResult!256)

(assert (=> b!112575 (= res!55516 (= (select (arr!2078 (_keys!4365 newMap!16)) (index!3178 lt!58278)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112575 (and (bvsge (index!3178 lt!58278) #b00000000000000000000000000000000) (bvslt (index!3178 lt!58278) (size!2336 (_keys!4365 newMap!16))))))

(declare-fun b!112576 () Bool)

(declare-fun call!12080 () Bool)

(assert (=> b!112576 (= e!73159 (not call!12080))))

(declare-fun b!112577 () Bool)

(assert (=> b!112577 (= e!73157 ((_ is Undefined!256) lt!58278))))

(declare-fun d!32067 () Bool)

(declare-fun e!73160 () Bool)

(assert (=> d!32067 e!73160))

(declare-fun c!20144 () Bool)

(assert (=> d!32067 (= c!20144 ((_ is MissingZero!256) lt!58278))))

(assert (=> d!32067 (= lt!58278 (seekEntryOrOpen!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4365 newMap!16) (mask!6825 newMap!16)))))

(declare-fun lt!58277 () Unit!3461)

(declare-fun choose!715 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 64) Int) Unit!3461)

(assert (=> d!32067 (= lt!58277 (choose!715 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)))))

(assert (=> d!32067 (validMask!0 (mask!6825 newMap!16))))

(assert (=> d!32067 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!50 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)) lt!58277)))

(declare-fun b!112578 () Bool)

(declare-fun e!73158 () Bool)

(assert (=> b!112578 (= e!73160 e!73158)))

(declare-fun res!55517 () Bool)

(assert (=> b!112578 (= res!55517 call!12079)))

(assert (=> b!112578 (=> (not res!55517) (not e!73158))))

(declare-fun b!112579 () Bool)

(assert (=> b!112579 (and (bvsge (index!3175 lt!58278) #b00000000000000000000000000000000) (bvslt (index!3175 lt!58278) (size!2336 (_keys!4365 newMap!16))))))

(declare-fun res!55515 () Bool)

(assert (=> b!112579 (= res!55515 (= (select (arr!2078 (_keys!4365 newMap!16)) (index!3175 lt!58278)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112579 (=> (not res!55515) (not e!73158))))

(declare-fun bm!12076 () Bool)

(assert (=> bm!12076 (= call!12080 (arrayContainsKey!0 (_keys!4365 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!112580 () Bool)

(assert (=> b!112580 (= e!73160 e!73157)))

(declare-fun c!20143 () Bool)

(assert (=> b!112580 (= c!20143 ((_ is MissingVacant!256) lt!58278))))

(declare-fun bm!12077 () Bool)

(assert (=> bm!12077 (= call!12079 (inRange!0 (ite c!20144 (index!3175 lt!58278) (index!3178 lt!58278)) (mask!6825 newMap!16)))))

(declare-fun b!112581 () Bool)

(assert (=> b!112581 (= e!73158 (not call!12080))))

(assert (= (and d!32067 c!20144) b!112578))

(assert (= (and d!32067 (not c!20144)) b!112580))

(assert (= (and b!112578 res!55517) b!112579))

(assert (= (and b!112579 res!55515) b!112581))

(assert (= (and b!112580 c!20143) b!112574))

(assert (= (and b!112580 (not c!20143)) b!112577))

(assert (= (and b!112574 res!55518) b!112575))

(assert (= (and b!112575 res!55516) b!112576))

(assert (= (or b!112578 b!112574) bm!12077))

(assert (= (or b!112581 b!112576) bm!12076))

(assert (=> d!32067 m!127411))

(assert (=> d!32067 m!127759))

(assert (=> d!32067 m!127411))

(declare-fun m!128589 () Bool)

(assert (=> d!32067 m!128589))

(assert (=> d!32067 m!128073))

(assert (=> bm!12076 m!127411))

(assert (=> bm!12076 m!127765))

(declare-fun m!128591 () Bool)

(assert (=> bm!12077 m!128591))

(declare-fun m!128593 () Bool)

(assert (=> b!112579 m!128593))

(declare-fun m!128595 () Bool)

(assert (=> b!112575 m!128595))

(assert (=> bm!12002 d!32067))

(declare-fun d!32069 () Bool)

(declare-fun e!73163 () Bool)

(assert (=> d!32069 e!73163))

(declare-fun res!55523 () Bool)

(assert (=> d!32069 (=> (not res!55523) (not e!73163))))

(declare-fun lt!58283 () SeekEntryResult!256)

(assert (=> d!32069 (= res!55523 ((_ is Found!256) lt!58283))))

(assert (=> d!32069 (= lt!58283 (seekEntryOrOpen!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4365 newMap!16) (mask!6825 newMap!16)))))

(declare-fun lt!58284 () Unit!3461)

(declare-fun choose!716 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 64) Int) Unit!3461)

(assert (=> d!32069 (= lt!58284 (choose!716 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)))))

(assert (=> d!32069 (validMask!0 (mask!6825 newMap!16))))

(assert (=> d!32069 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!50 (_keys!4365 newMap!16) (_values!2630 newMap!16) (mask!6825 newMap!16) (extraKeys!2440 newMap!16) (zeroValue!2516 newMap!16) (minValue!2516 newMap!16) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2647 newMap!16)) lt!58284)))

(declare-fun b!112586 () Bool)

(declare-fun res!55524 () Bool)

(assert (=> b!112586 (=> (not res!55524) (not e!73163))))

(assert (=> b!112586 (= res!55524 (inRange!0 (index!3176 lt!58283) (mask!6825 newMap!16)))))

(declare-fun b!112587 () Bool)

(assert (=> b!112587 (= e!73163 (= (select (arr!2078 (_keys!4365 newMap!16)) (index!3176 lt!58283)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> b!112587 (and (bvsge (index!3176 lt!58283) #b00000000000000000000000000000000) (bvslt (index!3176 lt!58283) (size!2336 (_keys!4365 newMap!16))))))

(assert (= (and d!32069 res!55523) b!112586))

(assert (= (and b!112586 res!55524) b!112587))

(assert (=> d!32069 m!127411))

(assert (=> d!32069 m!127759))

(assert (=> d!32069 m!127411))

(declare-fun m!128597 () Bool)

(assert (=> d!32069 m!128597))

(assert (=> d!32069 m!128073))

(declare-fun m!128599 () Bool)

(assert (=> b!112586 m!128599))

(declare-fun m!128601 () Bool)

(assert (=> b!112587 m!128601))

(assert (=> bm!12009 d!32069))

(assert (=> b!111923 d!31995))

(declare-fun d!32071 () Bool)

(declare-fun lt!58285 () Bool)

(assert (=> d!32071 (= lt!58285 (select (content!117 (toList!792 lt!57827)) lt!57632))))

(declare-fun e!73164 () Bool)

(assert (=> d!32071 (= lt!58285 e!73164)))

(declare-fun res!55525 () Bool)

(assert (=> d!32071 (=> (not res!55525) (not e!73164))))

(assert (=> d!32071 (= res!55525 ((_ is Cons!1609) (toList!792 lt!57827)))))

(assert (=> d!32071 (= (contains!833 (toList!792 lt!57827) lt!57632) lt!58285)))

(declare-fun b!112588 () Bool)

(declare-fun e!73165 () Bool)

(assert (=> b!112588 (= e!73164 e!73165)))

(declare-fun res!55526 () Bool)

(assert (=> b!112588 (=> res!55526 e!73165)))

(assert (=> b!112588 (= res!55526 (= (h!2209 (toList!792 lt!57827)) lt!57632))))

(declare-fun b!112589 () Bool)

(assert (=> b!112589 (= e!73165 (contains!833 (t!5763 (toList!792 lt!57827)) lt!57632))))

(assert (= (and d!32071 res!55525) b!112588))

(assert (= (and b!112588 (not res!55526)) b!112589))

(declare-fun m!128603 () Bool)

(assert (=> d!32071 m!128603))

(declare-fun m!128605 () Bool)

(assert (=> d!32071 m!128605))

(declare-fun m!128607 () Bool)

(assert (=> b!112589 m!128607))

(assert (=> b!111971 d!32071))

(declare-fun b!112590 () Bool)

(declare-fun e!73168 () Bool)

(declare-fun e!73167 () Bool)

(assert (=> b!112590 (= e!73168 e!73167)))

(declare-fun res!55527 () Bool)

(assert (=> b!112590 (=> (not res!55527) (not e!73167))))

(declare-fun e!73166 () Bool)

(assert (=> b!112590 (= res!55527 (not e!73166))))

(declare-fun res!55528 () Bool)

(assert (=> b!112590 (=> (not res!55528) (not e!73166))))

(assert (=> b!112590 (= res!55528 (validKeyInArray!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!12078 () Bool)

(declare-fun c!20145 () Bool)

(declare-fun call!12081 () Bool)

(assert (=> bm!12078 (= call!12081 (arrayNoDuplicates!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!20145 (Cons!1610 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!19961 (Cons!1610 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1611) Nil!1611)) (ite c!19961 (Cons!1610 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1611) Nil!1611))))))

(declare-fun b!112591 () Bool)

(declare-fun e!73169 () Bool)

(assert (=> b!112591 (= e!73169 call!12081)))

(declare-fun b!112592 () Bool)

(assert (=> b!112592 (= e!73167 e!73169)))

(assert (=> b!112592 (= c!20145 (validKeyInArray!0 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!32073 () Bool)

(declare-fun res!55529 () Bool)

(assert (=> d!32073 (=> res!55529 e!73168)))

(assert (=> d!32073 (= res!55529 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2336 (_keys!4365 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> d!32073 (= (arrayNoDuplicates!0 (_keys!4365 (v!2946 (underlying!373 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!19961 (Cons!1610 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1611) Nil!1611)) e!73168)))

(declare-fun b!112593 () Bool)

(assert (=> b!112593 (= e!73166 (contains!832 (ite c!19961 (Cons!1610 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1611) Nil!1611) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!112594 () Bool)

(assert (=> b!112594 (= e!73169 call!12081)))

(assert (= (and d!32073 (not res!55529)) b!112590))

(assert (= (and b!112590 res!55528) b!112593))

(assert (= (and b!112590 res!55527) b!112592))

(assert (= (and b!112592 c!20145) b!112594))

(assert (= (and b!112592 (not c!20145)) b!112591))

(assert (= (or b!112594 b!112591) bm!12078))

(declare-fun m!128609 () Bool)

(assert (=> b!112590 m!128609))

(assert (=> b!112590 m!128609))

(declare-fun m!128611 () Bool)

(assert (=> b!112590 m!128611))

(assert (=> bm!12078 m!128609))

(declare-fun m!128613 () Bool)

(assert (=> bm!12078 m!128613))

(assert (=> b!112592 m!128609))

(assert (=> b!112592 m!128609))

(assert (=> b!112592 m!128611))

(assert (=> b!112593 m!128609))

(assert (=> b!112593 m!128609))

(declare-fun m!128615 () Bool)

(assert (=> b!112593 m!128615))

(assert (=> bm!11935 d!32073))

(declare-fun d!32075 () Bool)

(declare-fun res!55534 () Bool)

(declare-fun e!73174 () Bool)

(assert (=> d!32075 (=> res!55534 e!73174)))

(assert (=> d!32075 (= res!55534 (and ((_ is Cons!1609) (toList!792 lt!57635)) (= (_1!1210 (h!2209 (toList!792 lt!57635))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355))))))

(assert (=> d!32075 (= (containsKey!163 (toList!792 lt!57635) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)) e!73174)))

(declare-fun b!112599 () Bool)

(declare-fun e!73175 () Bool)

(assert (=> b!112599 (= e!73174 e!73175)))

(declare-fun res!55535 () Bool)

(assert (=> b!112599 (=> (not res!55535) (not e!73175))))

(assert (=> b!112599 (= res!55535 (and (or (not ((_ is Cons!1609) (toList!792 lt!57635))) (bvsle (_1!1210 (h!2209 (toList!792 lt!57635))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355))) ((_ is Cons!1609) (toList!792 lt!57635)) (bvslt (_1!1210 (h!2209 (toList!792 lt!57635))) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355))))))

(declare-fun b!112600 () Bool)

(assert (=> b!112600 (= e!73175 (containsKey!163 (t!5763 (toList!792 lt!57635)) (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (= (and d!32075 (not res!55534)) b!112599))

(assert (= (and b!112599 res!55535) b!112600))

(assert (=> b!112600 m!127411))

(declare-fun m!128617 () Bool)

(assert (=> b!112600 m!128617))

(assert (=> d!31863 d!32075))

(declare-fun d!32077 () Bool)

(assert (=> d!32077 (= (+!147 (+!147 lt!57631 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) (+!147 (+!147 lt!57631 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)))))

(assert (=> d!32077 true))

(declare-fun _$28!170 () Unit!3461)

(assert (=> d!32077 (= (choose!705 lt!57631 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))) _$28!170)))

(declare-fun bs!4638 () Bool)

(assert (= bs!4638 d!32077))

(assert (=> bs!4638 m!127725))

(assert (=> bs!4638 m!127725))

(assert (=> bs!4638 m!127729))

(assert (=> bs!4638 m!127723))

(assert (=> bs!4638 m!127723))

(assert (=> bs!4638 m!127727))

(assert (=> d!31861 d!32077))

(declare-fun d!32079 () Bool)

(declare-fun e!73176 () Bool)

(assert (=> d!32079 e!73176))

(declare-fun res!55537 () Bool)

(assert (=> d!32079 (=> (not res!55537) (not e!73176))))

(declare-fun lt!58286 () ListLongMap!1553)

(assert (=> d!32079 (= res!55537 (contains!829 lt!58286 (_1!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun lt!58287 () List!1613)

(assert (=> d!32079 (= lt!58286 (ListLongMap!1554 lt!58287))))

(declare-fun lt!58288 () Unit!3461)

(declare-fun lt!58289 () Unit!3461)

(assert (=> d!32079 (= lt!58288 lt!58289)))

(assert (=> d!32079 (= (getValueByKey!160 lt!58287 (_1!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))) (Some!165 (_2!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32079 (= lt!58289 (lemmaContainsTupThenGetReturnValue!76 lt!58287 (_1!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) (_2!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32079 (= lt!58287 (insertStrictlySorted!79 (toList!792 lt!57631) (_1!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) (_2!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32079 (= (+!147 lt!57631 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!58286)))

(declare-fun b!112601 () Bool)

(declare-fun res!55536 () Bool)

(assert (=> b!112601 (=> (not res!55536) (not e!73176))))

(assert (=> b!112601 (= res!55536 (= (getValueByKey!160 (toList!792 lt!58286) (_1!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))) (Some!165 (_2!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun b!112602 () Bool)

(assert (=> b!112602 (= e!73176 (contains!833 (toList!792 lt!58286) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!32079 res!55537) b!112601))

(assert (= (and b!112601 res!55536) b!112602))

(declare-fun m!128619 () Bool)

(assert (=> d!32079 m!128619))

(declare-fun m!128621 () Bool)

(assert (=> d!32079 m!128621))

(declare-fun m!128623 () Bool)

(assert (=> d!32079 m!128623))

(declare-fun m!128625 () Bool)

(assert (=> d!32079 m!128625))

(declare-fun m!128627 () Bool)

(assert (=> b!112601 m!128627))

(declare-fun m!128629 () Bool)

(assert (=> b!112602 m!128629))

(assert (=> d!31861 d!32079))

(declare-fun d!32081 () Bool)

(declare-fun e!73177 () Bool)

(assert (=> d!32081 e!73177))

(declare-fun res!55539 () Bool)

(assert (=> d!32081 (=> (not res!55539) (not e!73177))))

(declare-fun lt!58290 () ListLongMap!1553)

(assert (=> d!32081 (= res!55539 (contains!829 lt!58290 (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(declare-fun lt!58291 () List!1613)

(assert (=> d!32081 (= lt!58290 (ListLongMap!1554 lt!58291))))

(declare-fun lt!58292 () Unit!3461)

(declare-fun lt!58293 () Unit!3461)

(assert (=> d!32081 (= lt!58292 lt!58293)))

(assert (=> d!32081 (= (getValueByKey!160 lt!58291 (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))) (Some!165 (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(assert (=> d!32081 (= lt!58293 (lemmaContainsTupThenGetReturnValue!76 lt!58291 (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)) (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(assert (=> d!32081 (= lt!58291 (insertStrictlySorted!79 (toList!792 lt!57631) (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)) (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(assert (=> d!32081 (= (+!147 lt!57631 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)) lt!58290)))

(declare-fun b!112603 () Bool)

(declare-fun res!55538 () Bool)

(assert (=> b!112603 (=> (not res!55538) (not e!73177))))

(assert (=> b!112603 (= res!55538 (= (getValueByKey!160 (toList!792 lt!58290) (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))) (Some!165 (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)))))))

(declare-fun b!112604 () Bool)

(assert (=> b!112604 (= e!73177 (contains!833 (toList!792 lt!58290) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)))))

(assert (= (and d!32081 res!55539) b!112603))

(assert (= (and b!112603 res!55538) b!112604))

(declare-fun m!128631 () Bool)

(assert (=> d!32081 m!128631))

(declare-fun m!128633 () Bool)

(assert (=> d!32081 m!128633))

(declare-fun m!128635 () Bool)

(assert (=> d!32081 m!128635))

(declare-fun m!128637 () Bool)

(assert (=> d!32081 m!128637))

(declare-fun m!128639 () Bool)

(assert (=> b!112603 m!128639))

(declare-fun m!128641 () Bool)

(assert (=> b!112604 m!128641))

(assert (=> d!31861 d!32081))

(declare-fun d!32083 () Bool)

(declare-fun e!73178 () Bool)

(assert (=> d!32083 e!73178))

(declare-fun res!55541 () Bool)

(assert (=> d!32083 (=> (not res!55541) (not e!73178))))

(declare-fun lt!58294 () ListLongMap!1553)

(assert (=> d!32083 (= res!55541 (contains!829 lt!58294 (_1!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun lt!58295 () List!1613)

(assert (=> d!32083 (= lt!58294 (ListLongMap!1554 lt!58295))))

(declare-fun lt!58296 () Unit!3461)

(declare-fun lt!58297 () Unit!3461)

(assert (=> d!32083 (= lt!58296 lt!58297)))

(assert (=> d!32083 (= (getValueByKey!160 lt!58295 (_1!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))) (Some!165 (_2!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32083 (= lt!58297 (lemmaContainsTupThenGetReturnValue!76 lt!58295 (_1!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) (_2!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32083 (= lt!58295 (insertStrictlySorted!79 (toList!792 (+!147 lt!57631 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))) (_1!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) (_2!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32083 (= (+!147 (+!147 lt!57631 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) lt!58294)))

(declare-fun b!112605 () Bool)

(declare-fun res!55540 () Bool)

(assert (=> b!112605 (=> (not res!55540) (not e!73178))))

(assert (=> b!112605 (= res!55540 (= (getValueByKey!160 (toList!792 lt!58294) (_1!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))) (Some!165 (_2!1210 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun b!112606 () Bool)

(assert (=> b!112606 (= e!73178 (contains!833 (toList!792 lt!58294) (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!32083 res!55541) b!112605))

(assert (= (and b!112605 res!55540) b!112606))

(declare-fun m!128643 () Bool)

(assert (=> d!32083 m!128643))

(declare-fun m!128645 () Bool)

(assert (=> d!32083 m!128645))

(declare-fun m!128647 () Bool)

(assert (=> d!32083 m!128647))

(declare-fun m!128649 () Bool)

(assert (=> d!32083 m!128649))

(declare-fun m!128651 () Bool)

(assert (=> b!112605 m!128651))

(declare-fun m!128653 () Bool)

(assert (=> b!112606 m!128653))

(assert (=> d!31861 d!32083))

(declare-fun d!32085 () Bool)

(declare-fun e!73179 () Bool)

(assert (=> d!32085 e!73179))

(declare-fun res!55543 () Bool)

(assert (=> d!32085 (=> (not res!55543) (not e!73179))))

(declare-fun lt!58298 () ListLongMap!1553)

(assert (=> d!32085 (= res!55543 (contains!829 lt!58298 (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(declare-fun lt!58299 () List!1613)

(assert (=> d!32085 (= lt!58298 (ListLongMap!1554 lt!58299))))

(declare-fun lt!58300 () Unit!3461)

(declare-fun lt!58301 () Unit!3461)

(assert (=> d!32085 (= lt!58300 lt!58301)))

(assert (=> d!32085 (= (getValueByKey!160 lt!58299 (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))) (Some!165 (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(assert (=> d!32085 (= lt!58301 (lemmaContainsTupThenGetReturnValue!76 lt!58299 (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)) (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(assert (=> d!32085 (= lt!58299 (insertStrictlySorted!79 (toList!792 (+!147 lt!57631 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992)))))) (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)) (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))))))

(assert (=> d!32085 (= (+!147 (+!147 lt!57631 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2946 (underlying!373 thiss!992))))) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)) lt!58298)))

(declare-fun b!112607 () Bool)

(declare-fun res!55542 () Bool)

(assert (=> b!112607 (=> (not res!55542) (not e!73179))))

(assert (=> b!112607 (= res!55542 (= (getValueByKey!160 (toList!792 lt!58298) (_1!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642))) (Some!165 (_2!1210 (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)))))))

(declare-fun b!112608 () Bool)

(assert (=> b!112608 (= e!73179 (contains!833 (toList!792 lt!58298) (tuple2!2399 (select (arr!2078 (_keys!4365 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57642)))))

(assert (= (and d!32085 res!55543) b!112607))

(assert (= (and b!112607 res!55542) b!112608))

(declare-fun m!128655 () Bool)

(assert (=> d!32085 m!128655))

(declare-fun m!128657 () Bool)

(assert (=> d!32085 m!128657))

(declare-fun m!128659 () Bool)

(assert (=> d!32085 m!128659))

(declare-fun m!128661 () Bool)

(assert (=> d!32085 m!128661))

(declare-fun m!128663 () Bool)

(assert (=> b!112607 m!128663))

(declare-fun m!128665 () Bool)

(assert (=> b!112608 m!128665))

(assert (=> d!31861 d!32085))

(declare-fun condMapEmpty!4037 () Bool)

(declare-fun mapDefault!4037 () ValueCell!1007)

(assert (=> mapNonEmpty!4036 (= condMapEmpty!4037 (= mapRest!4036 ((as const (Array (_ BitVec 32) ValueCell!1007)) mapDefault!4037)))))

(declare-fun e!73181 () Bool)

(declare-fun mapRes!4037 () Bool)

(assert (=> mapNonEmpty!4036 (= tp!10084 (and e!73181 mapRes!4037))))

(declare-fun mapNonEmpty!4037 () Bool)

(declare-fun tp!10085 () Bool)

(declare-fun e!73180 () Bool)

(assert (=> mapNonEmpty!4037 (= mapRes!4037 (and tp!10085 e!73180))))

(declare-fun mapValue!4037 () ValueCell!1007)

(declare-fun mapRest!4037 () (Array (_ BitVec 32) ValueCell!1007))

(declare-fun mapKey!4037 () (_ BitVec 32))

(assert (=> mapNonEmpty!4037 (= mapRest!4036 (store mapRest!4037 mapKey!4037 mapValue!4037))))

(declare-fun b!112609 () Bool)

(assert (=> b!112609 (= e!73180 tp_is_empty!2701)))

(declare-fun b!112610 () Bool)

(assert (=> b!112610 (= e!73181 tp_is_empty!2701)))

(declare-fun mapIsEmpty!4037 () Bool)

(assert (=> mapIsEmpty!4037 mapRes!4037))

(assert (= (and mapNonEmpty!4036 condMapEmpty!4037) mapIsEmpty!4037))

(assert (= (and mapNonEmpty!4036 (not condMapEmpty!4037)) mapNonEmpty!4037))

(assert (= (and mapNonEmpty!4037 ((_ is ValueCellFull!1007) mapValue!4037)) b!112609))

(assert (= (and mapNonEmpty!4036 ((_ is ValueCellFull!1007) mapDefault!4037)) b!112610))

(declare-fun m!128667 () Bool)

(assert (=> mapNonEmpty!4037 m!128667))

(declare-fun condMapEmpty!4038 () Bool)

(declare-fun mapDefault!4038 () ValueCell!1007)

(assert (=> mapNonEmpty!4035 (= condMapEmpty!4038 (= mapRest!4035 ((as const (Array (_ BitVec 32) ValueCell!1007)) mapDefault!4038)))))

(declare-fun e!73183 () Bool)

(declare-fun mapRes!4038 () Bool)

(assert (=> mapNonEmpty!4035 (= tp!10083 (and e!73183 mapRes!4038))))

(declare-fun mapNonEmpty!4038 () Bool)

(declare-fun tp!10086 () Bool)

(declare-fun e!73182 () Bool)

(assert (=> mapNonEmpty!4038 (= mapRes!4038 (and tp!10086 e!73182))))

(declare-fun mapValue!4038 () ValueCell!1007)

(declare-fun mapKey!4038 () (_ BitVec 32))

(declare-fun mapRest!4038 () (Array (_ BitVec 32) ValueCell!1007))

(assert (=> mapNonEmpty!4038 (= mapRest!4035 (store mapRest!4038 mapKey!4038 mapValue!4038))))

(declare-fun b!112611 () Bool)

(assert (=> b!112611 (= e!73182 tp_is_empty!2701)))

(declare-fun b!112612 () Bool)

(assert (=> b!112612 (= e!73183 tp_is_empty!2701)))

(declare-fun mapIsEmpty!4038 () Bool)

(assert (=> mapIsEmpty!4038 mapRes!4038))

(assert (= (and mapNonEmpty!4035 condMapEmpty!4038) mapIsEmpty!4038))

(assert (= (and mapNonEmpty!4035 (not condMapEmpty!4038)) mapNonEmpty!4038))

(assert (= (and mapNonEmpty!4038 ((_ is ValueCellFull!1007) mapValue!4038)) b!112611))

(assert (= (and mapNonEmpty!4035 ((_ is ValueCellFull!1007) mapDefault!4038)) b!112612))

(declare-fun m!128669 () Bool)

(assert (=> mapNonEmpty!4038 m!128669))

(declare-fun b_lambda!5041 () Bool)

(assert (= b_lambda!5035 (or (and b!111690 b_free!2569 (= (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) (defaultEntry!2647 newMap!16))) (and b!111703 b_free!2571) b_lambda!5041)))

(declare-fun b_lambda!5043 () Bool)

(assert (= b_lambda!5037 (or (and b!111690 b_free!2569 (= (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) (defaultEntry!2647 newMap!16))) (and b!111703 b_free!2571) b_lambda!5043)))

(declare-fun b_lambda!5045 () Bool)

(assert (= b_lambda!5033 (or (and b!111690 b_free!2569) (and b!111703 b_free!2571 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))))) b_lambda!5045)))

(declare-fun b_lambda!5047 () Bool)

(assert (= b_lambda!5039 (or (and b!111690 b_free!2569 (= (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))) (defaultEntry!2647 newMap!16))) (and b!111703 b_free!2571) b_lambda!5047)))

(declare-fun b_lambda!5049 () Bool)

(assert (= b_lambda!5031 (or (and b!111690 b_free!2569) (and b!111703 b_free!2571 (= (defaultEntry!2647 newMap!16) (defaultEntry!2647 (v!2946 (underlying!373 thiss!992))))) b_lambda!5049)))

(check-sat (not b!112373) (not b!112497) (not b!112255) (not bm!12076) (not d!31893) (not b!112327) (not d!32025) (not b!112140) (not bm!12065) (not b!112171) (not d!31889) (not d!31885) (not d!32031) (not d!32063) (not b!112137) (not b!112542) (not b!112607) (not d!32021) (not d!32061) (not d!32059) (not d!32011) (not b!112394) (not b!112483) (not b!112601) (not b_lambda!5025) (not d!32057) (not b!112422) (not d!31943) (not b!112188) tp_is_empty!2701 (not b!112552) (not bm!12033) (not d!31947) b_and!6915 (not d!32053) (not b!112503) (not b!112192) (not bm!12030) (not bm!12063) (not d!31883) (not b!112488) (not d!32077) (not d!31939) (not b!112545) (not d!31879) (not b!112586) (not b!112258) (not d!32019) (not b!112487) (not b!112532) (not bm!12078) (not b!112321) (not bm!12032) (not b!112603) (not b!112279) (not d!32047) (not b!112549) (not b!112371) (not b!112166) (not b!112388) (not b!112391) (not d!31923) (not d!31951) (not d!31959) (not d!31969) (not b!112534) (not b!112589) (not b!112486) (not b!112263) (not b!112372) (not d!31955) (not b!112135) (not d!32055) (not d!31903) (not b!112548) (not b!112149) (not d!32023) (not b!112395) (not bm!12068) (not b!112519) (not d!31981) (not b!112289) (not d!31929) (not b!112227) (not b_lambda!5041) (not d!32083) (not b!112261) (not bm!12045) (not d!31999) (not b!112283) (not b!112379) (not b!112153) (not bm!12047) (not b!112505) (not d!32045) (not b!112604) (not b!112169) (not b!112139) (not b!112277) (not b!112521) (not b!112256) (not d!32017) (not b!112473) (not mapNonEmpty!4037) (not b!112205) b_and!6913 (not bm!12026) (not b!112553) (not b!112134) (not b!112180) (not bm!12070) (not b!112360) (not bm!12044) (not b!112518) (not bm!12066) (not b!112527) (not d!32005) (not b!112525) (not d!32085) (not d!31875) (not b!112173) (not b!112476) (not d!32033) (not bm!12015) (not b!112193) (not d!31991) (not b!112273) (not b!112237) (not bm!12060) (not bm!12037) (not b_lambda!5027) (not bm!12077) (not b!112430) (not b!112403) (not d!31953) (not b_lambda!5047) (not d!31905) (not d!31945) (not b!112183) (not b!112234) (not b!112136) (not b!112325) (not d!31895) (not d!32081) (not b!112155) (not d!31949) (not bm!12058) (not b!112304) (not b!112138) (not b!112602) (not b!112346) (not b!112556) (not b!112411) (not b!112547) (not b!112474) (not d!31931) (not d!32009) (not b!112590) (not b!112396) (not b!112309) (not b!112516) (not b!112405) (not b!112293) (not b!112282) (not b!112550) (not b!112195) (not d!31881) (not b!112424) (not b!112423) (not b_lambda!5045) (not d!32035) (not b!112421) (not b!112264) (not b_lambda!5029) (not b!112382) (not b!112592) (not bm!12038) (not b!112330) (not d!31915) (not b!112406) (not d!32029) (not b!112409) (not b!112350) (not bm!12041) (not b_next!2571) (not d!31967) (not b!112472) (not bm!12067) (not b!112302) (not d!31975) (not b!112608) (not d!32049) (not b!112600) (not b!112266) (not b!112557) (not b!112335) (not b!112354) (not b!112428) (not b!112367) (not d!31891) (not bm!12059) (not d!31899) (not b_lambda!5043) (not b!112226) (not b!112336) (not d!31933) (not b!112184) (not d!32069) (not b!112485) (not b!112204) (not b!112555) (not b!112178) (not b!112425) (not d!32071) (not b!112593) (not b!112297) (not b!112187) (not b!112284) (not d!31971) (not b!112198) (not bm!12023) (not b!112515) (not b!112190) (not b!112493) (not d!31897) (not b!112386) (not b!112265) (not b!112170) (not d!31921) (not d!32007) (not d!31911) (not b!112334) (not b!112182) (not b!112174) (not b!112168) (not d!31913) (not d!32043) (not d!31973) (not b!112363) (not d!32067) (not b!112606) (not d!31877) (not b!112477) (not b!112520) (not b!112385) (not b!112147) (not d!31901) (not b!112281) (not d!32039) (not b!112301) (not b!112524) (not b!112393) (not d!31887) (not b!112185) (not b_lambda!5049) (not b_next!2569) (not b!112535) (not b!112407) (not b!112337) (not d!31989) (not d!32015) (not b!112605) (not b!112533) (not b!112177) (not b!112469) (not bm!12014) (not bm!12043) (not b!112501) (not b!112332) (not d!31985) (not b!112427) (not b!112410) (not bm!12034) (not b!112152) (not d!32013) (not d!32079) (not b!112352) (not b!112141) (not mapNonEmpty!4038) (not b_lambda!5017) (not d!32027) (not b!112342) (not d!32003) (not d!31925) (not d!31937) (not b!112530))
(check-sat b_and!6913 b_and!6915 (not b_next!2569) (not b_next!2571))
