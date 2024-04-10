; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8314 () Bool)

(assert start!8314)

(declare-fun b!54559 () Bool)

(declare-fun b_free!1793 () Bool)

(declare-fun b_next!1793 () Bool)

(assert (=> b!54559 (= b_free!1793 (not b_next!1793))))

(declare-fun tp!7481 () Bool)

(declare-fun b_and!3127 () Bool)

(assert (=> b!54559 (= tp!7481 b_and!3127)))

(declare-fun b!54570 () Bool)

(declare-fun b_free!1795 () Bool)

(declare-fun b_next!1795 () Bool)

(assert (=> b!54570 (= b_free!1795 (not b_next!1795))))

(declare-fun tp!7480 () Bool)

(declare-fun b_and!3129 () Bool)

(assert (=> b!54570 (= tp!7480 b_and!3129)))

(declare-fun res!30854 () Bool)

(declare-fun e!35663 () Bool)

(assert (=> start!8314 (=> (not res!30854) (not e!35663))))

(declare-datatypes ((V!2731 0))(
  ( (V!2732 (val!1201 Int)) )
))
(declare-datatypes ((array!3549 0))(
  ( (array!3550 (arr!1697 (Array (_ BitVec 32) (_ BitVec 64))) (size!1926 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!813 0))(
  ( (ValueCellFull!813 (v!2288 V!2731)) (EmptyCell!813) )
))
(declare-datatypes ((array!3551 0))(
  ( (array!3552 (arr!1698 (Array (_ BitVec 32) ValueCell!813)) (size!1927 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!534 0))(
  ( (LongMapFixedSize!535 (defaultEntry!1981 Int) (mask!5828 (_ BitVec 32)) (extraKeys!1872 (_ BitVec 32)) (zeroValue!1899 V!2731) (minValue!1899 V!2731) (_size!316 (_ BitVec 32)) (_keys!3601 array!3549) (_values!1964 array!3551) (_vacant!316 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!350 0))(
  ( (Cell!351 (v!2289 LongMapFixedSize!534)) )
))
(declare-datatypes ((LongMap!350 0))(
  ( (LongMap!351 (underlying!186 Cell!350)) )
))
(declare-fun thiss!992 () LongMap!350)

(declare-fun valid!208 (LongMap!350) Bool)

(assert (=> start!8314 (= res!30854 (valid!208 thiss!992))))

(assert (=> start!8314 e!35663))

(declare-fun e!35649 () Bool)

(assert (=> start!8314 e!35649))

(assert (=> start!8314 true))

(declare-fun e!35657 () Bool)

(assert (=> start!8314 e!35657))

(declare-fun b!54555 () Bool)

(declare-fun e!35655 () Bool)

(assert (=> b!54555 (= e!35649 e!35655)))

(declare-fun b!54556 () Bool)

(declare-fun e!35652 () Bool)

(declare-fun tp_is_empty!2313 () Bool)

(assert (=> b!54556 (= e!35652 tp_is_empty!2313)))

(declare-fun b!54557 () Bool)

(declare-fun res!30860 () Bool)

(assert (=> b!54557 (=> (not res!30860) (not e!35663))))

(declare-fun newMap!16 () LongMapFixedSize!534)

(assert (=> b!54557 (= res!30860 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5828 newMap!16)) (_size!316 (v!2289 (underlying!186 thiss!992)))))))

(declare-fun b!54558 () Bool)

(declare-fun e!35654 () Bool)

(assert (=> b!54558 (= e!35654 tp_is_empty!2313)))

(declare-fun e!35648 () Bool)

(declare-fun e!35659 () Bool)

(declare-fun array_inv!1049 (array!3549) Bool)

(declare-fun array_inv!1050 (array!3551) Bool)

(assert (=> b!54559 (= e!35648 (and tp!7481 tp_is_empty!2313 (array_inv!1049 (_keys!3601 (v!2289 (underlying!186 thiss!992)))) (array_inv!1050 (_values!1964 (v!2289 (underlying!186 thiss!992)))) e!35659))))

(declare-fun b!54560 () Bool)

(declare-fun e!35653 () Bool)

(declare-fun e!35656 () Bool)

(assert (=> b!54560 (= e!35653 (not e!35656))))

(declare-fun res!30859 () Bool)

(assert (=> b!54560 (=> res!30859 e!35656)))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!54560 (= res!30859 (or (bvsge (size!1926 (_keys!3601 (v!2289 (underlying!186 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1926 (_keys!3601 (v!2289 (underlying!186 thiss!992))))) (bvsgt from!355 (size!1926 (_keys!3601 (v!2289 (underlying!186 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!54560 (arrayContainsKey!0 (_keys!3601 (v!2289 (underlying!186 thiss!992))) (select (arr!1697 (_keys!3601 (v!2289 (underlying!186 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1433 0))(
  ( (Unit!1434) )
))
(declare-fun lt!21682 () Unit!1433)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!6 (array!3549 array!3551 (_ BitVec 32) (_ BitVec 32) V!2731 V!2731 (_ BitVec 64) (_ BitVec 32) Int) Unit!1433)

(assert (=> b!54560 (= lt!21682 (lemmaListMapContainsThenArrayContainsFrom!6 (_keys!3601 (v!2289 (underlying!186 thiss!992))) (_values!1964 (v!2289 (underlying!186 thiss!992))) (mask!5828 (v!2289 (underlying!186 thiss!992))) (extraKeys!1872 (v!2289 (underlying!186 thiss!992))) (zeroValue!1899 (v!2289 (underlying!186 thiss!992))) (minValue!1899 (v!2289 (underlying!186 thiss!992))) (select (arr!1697 (_keys!3601 (v!2289 (underlying!186 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1981 (v!2289 (underlying!186 thiss!992)))))))

(declare-fun b!54561 () Bool)

(declare-fun e!35660 () Bool)

(assert (=> b!54561 (= e!35660 tp_is_empty!2313)))

(declare-fun mapNonEmpty!2609 () Bool)

(declare-fun mapRes!2610 () Bool)

(declare-fun tp!7482 () Bool)

(declare-fun e!35651 () Bool)

(assert (=> mapNonEmpty!2609 (= mapRes!2610 (and tp!7482 e!35651))))

(declare-fun mapKey!2610 () (_ BitVec 32))

(declare-fun mapRest!2609 () (Array (_ BitVec 32) ValueCell!813))

(declare-fun mapValue!2610 () ValueCell!813)

(assert (=> mapNonEmpty!2609 (= (arr!1698 (_values!1964 newMap!16)) (store mapRest!2609 mapKey!2610 mapValue!2610))))

(declare-fun b!54562 () Bool)

(declare-fun res!30856 () Bool)

(assert (=> b!54562 (=> (not res!30856) (not e!35663))))

(assert (=> b!54562 (= res!30856 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1926 (_keys!3601 (v!2289 (underlying!186 thiss!992)))))))))

(declare-fun b!54563 () Bool)

(declare-fun mapRes!2609 () Bool)

(assert (=> b!54563 (= e!35659 (and e!35660 mapRes!2609))))

(declare-fun condMapEmpty!2610 () Bool)

(declare-fun mapDefault!2610 () ValueCell!813)

(assert (=> b!54563 (= condMapEmpty!2610 (= (arr!1698 (_values!1964 (v!2289 (underlying!186 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!813)) mapDefault!2610)))))

(declare-fun b!54564 () Bool)

(declare-fun res!30857 () Bool)

(assert (=> b!54564 (=> (not res!30857) (not e!35663))))

(declare-fun valid!209 (LongMapFixedSize!534) Bool)

(assert (=> b!54564 (= res!30857 (valid!209 newMap!16))))

(declare-fun b!54565 () Bool)

(declare-fun e!35658 () Bool)

(assert (=> b!54565 (= e!35658 e!35653)))

(declare-fun res!30855 () Bool)

(assert (=> b!54565 (=> (not res!30855) (not e!35653))))

(declare-datatypes ((tuple2!1926 0))(
  ( (tuple2!1927 (_1!974 (_ BitVec 64)) (_2!974 V!2731)) )
))
(declare-datatypes ((List!1376 0))(
  ( (Nil!1373) (Cons!1372 (h!1952 tuple2!1926) (t!4538 List!1376)) )
))
(declare-datatypes ((ListLongMap!1311 0))(
  ( (ListLongMap!1312 (toList!671 List!1376)) )
))
(declare-fun lt!21681 () ListLongMap!1311)

(declare-fun contains!644 (ListLongMap!1311 (_ BitVec 64)) Bool)

(assert (=> b!54565 (= res!30855 (contains!644 lt!21681 (select (arr!1697 (_keys!3601 (v!2289 (underlying!186 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1928 0))(
  ( (tuple2!1929 (_1!975 Bool) (_2!975 LongMapFixedSize!534)) )
))
(declare-fun lt!21680 () tuple2!1928)

(declare-fun update!52 (LongMapFixedSize!534 (_ BitVec 64) V!2731) tuple2!1928)

(declare-fun get!1012 (ValueCell!813 V!2731) V!2731)

(declare-fun dynLambda!283 (Int (_ BitVec 64)) V!2731)

(assert (=> b!54565 (= lt!21680 (update!52 newMap!16 (select (arr!1697 (_keys!3601 (v!2289 (underlying!186 thiss!992)))) from!355) (get!1012 (select (arr!1698 (_values!1964 (v!2289 (underlying!186 thiss!992)))) from!355) (dynLambda!283 (defaultEntry!1981 (v!2289 (underlying!186 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!54566 () Bool)

(assert (=> b!54566 (= e!35656 true)))

(declare-fun lt!21683 () Bool)

(declare-datatypes ((List!1377 0))(
  ( (Nil!1374) (Cons!1373 (h!1953 (_ BitVec 64)) (t!4539 List!1377)) )
))
(declare-fun arrayNoDuplicates!0 (array!3549 (_ BitVec 32) List!1377) Bool)

(assert (=> b!54566 (= lt!21683 (arrayNoDuplicates!0 (_keys!3601 (v!2289 (underlying!186 thiss!992))) #b00000000000000000000000000000000 Nil!1374))))

(declare-fun b!54567 () Bool)

(declare-fun e!35661 () Bool)

(assert (=> b!54567 (= e!35661 (and e!35652 mapRes!2610))))

(declare-fun condMapEmpty!2609 () Bool)

(declare-fun mapDefault!2609 () ValueCell!813)

(assert (=> b!54567 (= condMapEmpty!2609 (= (arr!1698 (_values!1964 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!813)) mapDefault!2609)))))

(declare-fun b!54568 () Bool)

(assert (=> b!54568 (= e!35651 tp_is_empty!2313)))

(declare-fun b!54569 () Bool)

(assert (=> b!54569 (= e!35655 e!35648)))

(assert (=> b!54570 (= e!35657 (and tp!7480 tp_is_empty!2313 (array_inv!1049 (_keys!3601 newMap!16)) (array_inv!1050 (_values!1964 newMap!16)) e!35661))))

(declare-fun mapIsEmpty!2609 () Bool)

(assert (=> mapIsEmpty!2609 mapRes!2609))

(declare-fun mapNonEmpty!2610 () Bool)

(declare-fun tp!7479 () Bool)

(assert (=> mapNonEmpty!2610 (= mapRes!2609 (and tp!7479 e!35654))))

(declare-fun mapRest!2610 () (Array (_ BitVec 32) ValueCell!813))

(declare-fun mapValue!2609 () ValueCell!813)

(declare-fun mapKey!2609 () (_ BitVec 32))

(assert (=> mapNonEmpty!2610 (= (arr!1698 (_values!1964 (v!2289 (underlying!186 thiss!992)))) (store mapRest!2610 mapKey!2609 mapValue!2609))))

(declare-fun mapIsEmpty!2610 () Bool)

(assert (=> mapIsEmpty!2610 mapRes!2610))

(declare-fun b!54571 () Bool)

(assert (=> b!54571 (= e!35663 e!35658)))

(declare-fun res!30858 () Bool)

(assert (=> b!54571 (=> (not res!30858) (not e!35658))))

(declare-fun lt!21684 () ListLongMap!1311)

(assert (=> b!54571 (= res!30858 (and (= lt!21684 lt!21681) (not (= (select (arr!1697 (_keys!3601 (v!2289 (underlying!186 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1697 (_keys!3601 (v!2289 (underlying!186 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1056 (LongMapFixedSize!534) ListLongMap!1311)

(assert (=> b!54571 (= lt!21681 (map!1056 newMap!16))))

(declare-fun getCurrentListMap!381 (array!3549 array!3551 (_ BitVec 32) (_ BitVec 32) V!2731 V!2731 (_ BitVec 32) Int) ListLongMap!1311)

(assert (=> b!54571 (= lt!21684 (getCurrentListMap!381 (_keys!3601 (v!2289 (underlying!186 thiss!992))) (_values!1964 (v!2289 (underlying!186 thiss!992))) (mask!5828 (v!2289 (underlying!186 thiss!992))) (extraKeys!1872 (v!2289 (underlying!186 thiss!992))) (zeroValue!1899 (v!2289 (underlying!186 thiss!992))) (minValue!1899 (v!2289 (underlying!186 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1981 (v!2289 (underlying!186 thiss!992)))))))

(assert (= (and start!8314 res!30854) b!54562))

(assert (= (and b!54562 res!30856) b!54564))

(assert (= (and b!54564 res!30857) b!54557))

(assert (= (and b!54557 res!30860) b!54571))

(assert (= (and b!54571 res!30858) b!54565))

(assert (= (and b!54565 res!30855) b!54560))

(assert (= (and b!54560 (not res!30859)) b!54566))

(assert (= (and b!54563 condMapEmpty!2610) mapIsEmpty!2609))

(assert (= (and b!54563 (not condMapEmpty!2610)) mapNonEmpty!2610))

(get-info :version)

(assert (= (and mapNonEmpty!2610 ((_ is ValueCellFull!813) mapValue!2609)) b!54558))

(assert (= (and b!54563 ((_ is ValueCellFull!813) mapDefault!2610)) b!54561))

(assert (= b!54559 b!54563))

(assert (= b!54569 b!54559))

(assert (= b!54555 b!54569))

(assert (= start!8314 b!54555))

(assert (= (and b!54567 condMapEmpty!2609) mapIsEmpty!2610))

(assert (= (and b!54567 (not condMapEmpty!2609)) mapNonEmpty!2609))

(assert (= (and mapNonEmpty!2609 ((_ is ValueCellFull!813) mapValue!2610)) b!54568))

(assert (= (and b!54567 ((_ is ValueCellFull!813) mapDefault!2609)) b!54556))

(assert (= b!54570 b!54567))

(assert (= start!8314 b!54570))

(declare-fun b_lambda!2407 () Bool)

(assert (=> (not b_lambda!2407) (not b!54565)))

(declare-fun t!4535 () Bool)

(declare-fun tb!1137 () Bool)

(assert (=> (and b!54559 (= (defaultEntry!1981 (v!2289 (underlying!186 thiss!992))) (defaultEntry!1981 (v!2289 (underlying!186 thiss!992)))) t!4535) tb!1137))

(declare-fun result!2103 () Bool)

(assert (=> tb!1137 (= result!2103 tp_is_empty!2313)))

(assert (=> b!54565 t!4535))

(declare-fun b_and!3131 () Bool)

(assert (= b_and!3127 (and (=> t!4535 result!2103) b_and!3131)))

(declare-fun tb!1139 () Bool)

(declare-fun t!4537 () Bool)

(assert (=> (and b!54570 (= (defaultEntry!1981 newMap!16) (defaultEntry!1981 (v!2289 (underlying!186 thiss!992)))) t!4537) tb!1139))

(declare-fun result!2107 () Bool)

(assert (= result!2107 result!2103))

(assert (=> b!54565 t!4537))

(declare-fun b_and!3133 () Bool)

(assert (= b_and!3129 (and (=> t!4537 result!2107) b_and!3133)))

(declare-fun m!46123 () Bool)

(assert (=> b!54560 m!46123))

(assert (=> b!54560 m!46123))

(declare-fun m!46125 () Bool)

(assert (=> b!54560 m!46125))

(assert (=> b!54560 m!46123))

(declare-fun m!46127 () Bool)

(assert (=> b!54560 m!46127))

(declare-fun m!46129 () Bool)

(assert (=> mapNonEmpty!2609 m!46129))

(declare-fun m!46131 () Bool)

(assert (=> b!54570 m!46131))

(declare-fun m!46133 () Bool)

(assert (=> b!54570 m!46133))

(declare-fun m!46135 () Bool)

(assert (=> start!8314 m!46135))

(declare-fun m!46137 () Bool)

(assert (=> b!54559 m!46137))

(declare-fun m!46139 () Bool)

(assert (=> b!54559 m!46139))

(assert (=> b!54571 m!46123))

(declare-fun m!46141 () Bool)

(assert (=> b!54571 m!46141))

(declare-fun m!46143 () Bool)

(assert (=> b!54571 m!46143))

(declare-fun m!46145 () Bool)

(assert (=> b!54564 m!46145))

(declare-fun m!46147 () Bool)

(assert (=> mapNonEmpty!2610 m!46147))

(declare-fun m!46149 () Bool)

(assert (=> b!54565 m!46149))

(declare-fun m!46151 () Bool)

(assert (=> b!54565 m!46151))

(declare-fun m!46153 () Bool)

(assert (=> b!54565 m!46153))

(assert (=> b!54565 m!46123))

(declare-fun m!46155 () Bool)

(assert (=> b!54565 m!46155))

(assert (=> b!54565 m!46123))

(assert (=> b!54565 m!46151))

(assert (=> b!54565 m!46123))

(assert (=> b!54565 m!46153))

(declare-fun m!46157 () Bool)

(assert (=> b!54565 m!46157))

(assert (=> b!54565 m!46149))

(declare-fun m!46159 () Bool)

(assert (=> b!54566 m!46159))

(check-sat (not start!8314) (not mapNonEmpty!2609) (not b!54570) (not b_next!1795) b_and!3133 (not b_next!1793) (not b!54564) (not b_lambda!2407) (not b!54560) (not mapNonEmpty!2610) (not b!54559) b_and!3131 (not b!54565) tp_is_empty!2313 (not b!54571) (not b!54566))
(check-sat b_and!3131 b_and!3133 (not b_next!1793) (not b_next!1795))
