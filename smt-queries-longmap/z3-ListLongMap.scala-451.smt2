; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8322 () Bool)

(assert start!8322)

(declare-fun b!54602 () Bool)

(declare-fun b_free!1801 () Bool)

(declare-fun b_next!1801 () Bool)

(assert (=> b!54602 (= b_free!1801 (not b_next!1801))))

(declare-fun tp!7504 () Bool)

(declare-fun b_and!3145 () Bool)

(assert (=> b!54602 (= tp!7504 b_and!3145)))

(declare-fun b!54607 () Bool)

(declare-fun b_free!1803 () Bool)

(declare-fun b_next!1803 () Bool)

(assert (=> b!54607 (= b_free!1803 (not b_next!1803))))

(declare-fun tp!7503 () Bool)

(declare-fun b_and!3147 () Bool)

(assert (=> b!54607 (= tp!7503 b_and!3147)))

(declare-fun b!54595 () Bool)

(declare-fun e!35705 () Bool)

(declare-fun e!35715 () Bool)

(assert (=> b!54595 (= e!35705 (not e!35715))))

(declare-fun res!30877 () Bool)

(assert (=> b!54595 (=> res!30877 e!35715)))

(declare-datatypes ((V!2737 0))(
  ( (V!2738 (val!1203 Int)) )
))
(declare-datatypes ((array!3537 0))(
  ( (array!3538 (arr!1690 (Array (_ BitVec 32) (_ BitVec 64))) (size!1920 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!815 0))(
  ( (ValueCellFull!815 (v!2289 V!2737)) (EmptyCell!815) )
))
(declare-datatypes ((array!3539 0))(
  ( (array!3540 (arr!1691 (Array (_ BitVec 32) ValueCell!815)) (size!1921 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!538 0))(
  ( (LongMapFixedSize!539 (defaultEntry!1983 Int) (mask!5831 (_ BitVec 32)) (extraKeys!1874 (_ BitVec 32)) (zeroValue!1901 V!2737) (minValue!1901 V!2737) (_size!318 (_ BitVec 32)) (_keys!3602 array!3537) (_values!1966 array!3539) (_vacant!318 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!352 0))(
  ( (Cell!353 (v!2290 LongMapFixedSize!538)) )
))
(declare-datatypes ((LongMap!352 0))(
  ( (LongMap!353 (underlying!187 Cell!352)) )
))
(declare-fun thiss!992 () LongMap!352)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!54595 (= res!30877 (or (bvsge (size!1920 (_keys!3602 (v!2290 (underlying!187 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1920 (_keys!3602 (v!2290 (underlying!187 thiss!992))))) (bvsgt from!355 (size!1920 (_keys!3602 (v!2290 (underlying!187 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!54595 (arrayContainsKey!0 (_keys!3602 (v!2290 (underlying!187 thiss!992))) (select (arr!1690 (_keys!3602 (v!2290 (underlying!187 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1438 0))(
  ( (Unit!1439) )
))
(declare-fun lt!21695 () Unit!1438)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!6 (array!3537 array!3539 (_ BitVec 32) (_ BitVec 32) V!2737 V!2737 (_ BitVec 64) (_ BitVec 32) Int) Unit!1438)

(assert (=> b!54595 (= lt!21695 (lemmaListMapContainsThenArrayContainsFrom!6 (_keys!3602 (v!2290 (underlying!187 thiss!992))) (_values!1966 (v!2290 (underlying!187 thiss!992))) (mask!5831 (v!2290 (underlying!187 thiss!992))) (extraKeys!1874 (v!2290 (underlying!187 thiss!992))) (zeroValue!1901 (v!2290 (underlying!187 thiss!992))) (minValue!1901 (v!2290 (underlying!187 thiss!992))) (select (arr!1690 (_keys!3602 (v!2290 (underlying!187 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1983 (v!2290 (underlying!187 thiss!992)))))))

(declare-fun b!54596 () Bool)

(declare-fun e!35709 () Bool)

(declare-fun e!35714 () Bool)

(assert (=> b!54596 (= e!35709 e!35714)))

(declare-fun mapIsEmpty!2621 () Bool)

(declare-fun mapRes!2621 () Bool)

(assert (=> mapIsEmpty!2621 mapRes!2621))

(declare-fun b!54597 () Bool)

(declare-fun res!30879 () Bool)

(declare-fun e!35712 () Bool)

(assert (=> b!54597 (=> (not res!30879) (not e!35712))))

(declare-fun newMap!16 () LongMapFixedSize!538)

(declare-fun valid!212 (LongMapFixedSize!538) Bool)

(assert (=> b!54597 (= res!30879 (valid!212 newMap!16))))

(declare-fun b!54598 () Bool)

(declare-fun res!30878 () Bool)

(assert (=> b!54598 (=> (not res!30878) (not e!35712))))

(assert (=> b!54598 (= res!30878 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5831 newMap!16)) (_size!318 (v!2290 (underlying!187 thiss!992)))))))

(declare-fun b!54599 () Bool)

(declare-fun e!35703 () Bool)

(assert (=> b!54599 (= e!35712 e!35703)))

(declare-fun res!30880 () Bool)

(assert (=> b!54599 (=> (not res!30880) (not e!35703))))

(declare-datatypes ((tuple2!1946 0))(
  ( (tuple2!1947 (_1!984 (_ BitVec 64)) (_2!984 V!2737)) )
))
(declare-datatypes ((List!1386 0))(
  ( (Nil!1383) (Cons!1382 (h!1962 tuple2!1946) (t!4555 List!1386)) )
))
(declare-datatypes ((ListLongMap!1309 0))(
  ( (ListLongMap!1310 (toList!670 List!1386)) )
))
(declare-fun lt!21696 () ListLongMap!1309)

(declare-fun lt!21698 () ListLongMap!1309)

(assert (=> b!54599 (= res!30880 (and (= lt!21698 lt!21696) (not (= (select (arr!1690 (_keys!3602 (v!2290 (underlying!187 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1690 (_keys!3602 (v!2290 (underlying!187 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1059 (LongMapFixedSize!538) ListLongMap!1309)

(assert (=> b!54599 (= lt!21696 (map!1059 newMap!16))))

(declare-fun getCurrentListMap!371 (array!3537 array!3539 (_ BitVec 32) (_ BitVec 32) V!2737 V!2737 (_ BitVec 32) Int) ListLongMap!1309)

(assert (=> b!54599 (= lt!21698 (getCurrentListMap!371 (_keys!3602 (v!2290 (underlying!187 thiss!992))) (_values!1966 (v!2290 (underlying!187 thiss!992))) (mask!5831 (v!2290 (underlying!187 thiss!992))) (extraKeys!1874 (v!2290 (underlying!187 thiss!992))) (zeroValue!1901 (v!2290 (underlying!187 thiss!992))) (minValue!1901 (v!2290 (underlying!187 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1983 (v!2290 (underlying!187 thiss!992)))))))

(declare-fun b!54601 () Bool)

(declare-fun res!30876 () Bool)

(assert (=> b!54601 (=> (not res!30876) (not e!35712))))

(assert (=> b!54601 (= res!30876 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1920 (_keys!3602 (v!2290 (underlying!187 thiss!992)))))))))

(declare-fun tp_is_empty!2317 () Bool)

(declare-fun e!35708 () Bool)

(declare-fun array_inv!1043 (array!3537) Bool)

(declare-fun array_inv!1044 (array!3539) Bool)

(assert (=> b!54602 (= e!35714 (and tp!7504 tp_is_empty!2317 (array_inv!1043 (_keys!3602 (v!2290 (underlying!187 thiss!992)))) (array_inv!1044 (_values!1966 (v!2290 (underlying!187 thiss!992)))) e!35708))))

(declare-fun b!54603 () Bool)

(declare-fun e!35702 () Bool)

(assert (=> b!54603 (= e!35702 e!35709)))

(declare-fun b!54604 () Bool)

(assert (=> b!54604 (= e!35703 e!35705)))

(declare-fun res!30881 () Bool)

(assert (=> b!54604 (=> (not res!30881) (not e!35705))))

(declare-fun contains!644 (ListLongMap!1309 (_ BitVec 64)) Bool)

(assert (=> b!54604 (= res!30881 (contains!644 lt!21696 (select (arr!1690 (_keys!3602 (v!2290 (underlying!187 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1948 0))(
  ( (tuple2!1949 (_1!985 Bool) (_2!985 LongMapFixedSize!538)) )
))
(declare-fun lt!21697 () tuple2!1948)

(declare-fun update!63 (LongMapFixedSize!538 (_ BitVec 64) V!2737) tuple2!1948)

(declare-fun get!1021 (ValueCell!815 V!2737) V!2737)

(declare-fun dynLambda!287 (Int (_ BitVec 64)) V!2737)

(assert (=> b!54604 (= lt!21697 (update!63 newMap!16 (select (arr!1690 (_keys!3602 (v!2290 (underlying!187 thiss!992)))) from!355) (get!1021 (select (arr!1691 (_values!1966 (v!2290 (underlying!187 thiss!992)))) from!355) (dynLambda!287 (defaultEntry!1983 (v!2290 (underlying!187 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!2622 () Bool)

(declare-fun mapRes!2622 () Bool)

(assert (=> mapIsEmpty!2622 mapRes!2622))

(declare-fun mapNonEmpty!2621 () Bool)

(declare-fun tp!7506 () Bool)

(declare-fun e!35706 () Bool)

(assert (=> mapNonEmpty!2621 (= mapRes!2621 (and tp!7506 e!35706))))

(declare-fun mapRest!2621 () (Array (_ BitVec 32) ValueCell!815))

(declare-fun mapKey!2621 () (_ BitVec 32))

(declare-fun mapValue!2621 () ValueCell!815)

(assert (=> mapNonEmpty!2621 (= (arr!1691 (_values!1966 (v!2290 (underlying!187 thiss!992)))) (store mapRest!2621 mapKey!2621 mapValue!2621))))

(declare-fun b!54605 () Bool)

(assert (=> b!54605 (= e!35715 true)))

(declare-fun lt!21694 () Bool)

(declare-datatypes ((List!1387 0))(
  ( (Nil!1384) (Cons!1383 (h!1963 (_ BitVec 64)) (t!4556 List!1387)) )
))
(declare-fun arrayNoDuplicates!0 (array!3537 (_ BitVec 32) List!1387) Bool)

(assert (=> b!54605 (= lt!21694 (arrayNoDuplicates!0 (_keys!3602 (v!2290 (underlying!187 thiss!992))) #b00000000000000000000000000000000 Nil!1384))))

(declare-fun res!30882 () Bool)

(assert (=> start!8322 (=> (not res!30882) (not e!35712))))

(declare-fun valid!213 (LongMap!352) Bool)

(assert (=> start!8322 (= res!30882 (valid!213 thiss!992))))

(assert (=> start!8322 e!35712))

(assert (=> start!8322 e!35702))

(assert (=> start!8322 true))

(declare-fun e!35713 () Bool)

(assert (=> start!8322 e!35713))

(declare-fun b!54600 () Bool)

(declare-fun e!35707 () Bool)

(assert (=> b!54600 (= e!35707 tp_is_empty!2317)))

(declare-fun b!54606 () Bool)

(declare-fun e!35716 () Bool)

(assert (=> b!54606 (= e!35708 (and e!35716 mapRes!2621))))

(declare-fun condMapEmpty!2621 () Bool)

(declare-fun mapDefault!2622 () ValueCell!815)

(assert (=> b!54606 (= condMapEmpty!2621 (= (arr!1691 (_values!1966 (v!2290 (underlying!187 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!815)) mapDefault!2622)))))

(declare-fun e!35704 () Bool)

(assert (=> b!54607 (= e!35713 (and tp!7503 tp_is_empty!2317 (array_inv!1043 (_keys!3602 newMap!16)) (array_inv!1044 (_values!1966 newMap!16)) e!35704))))

(declare-fun b!54608 () Bool)

(declare-fun e!35710 () Bool)

(assert (=> b!54608 (= e!35710 tp_is_empty!2317)))

(declare-fun mapNonEmpty!2622 () Bool)

(declare-fun tp!7505 () Bool)

(assert (=> mapNonEmpty!2622 (= mapRes!2622 (and tp!7505 e!35707))))

(declare-fun mapRest!2622 () (Array (_ BitVec 32) ValueCell!815))

(declare-fun mapKey!2622 () (_ BitVec 32))

(declare-fun mapValue!2622 () ValueCell!815)

(assert (=> mapNonEmpty!2622 (= (arr!1691 (_values!1966 newMap!16)) (store mapRest!2622 mapKey!2622 mapValue!2622))))

(declare-fun b!54609 () Bool)

(assert (=> b!54609 (= e!35706 tp_is_empty!2317)))

(declare-fun b!54610 () Bool)

(assert (=> b!54610 (= e!35704 (and e!35710 mapRes!2622))))

(declare-fun condMapEmpty!2622 () Bool)

(declare-fun mapDefault!2621 () ValueCell!815)

(assert (=> b!54610 (= condMapEmpty!2622 (= (arr!1691 (_values!1966 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!815)) mapDefault!2621)))))

(declare-fun b!54611 () Bool)

(assert (=> b!54611 (= e!35716 tp_is_empty!2317)))

(assert (= (and start!8322 res!30882) b!54601))

(assert (= (and b!54601 res!30876) b!54597))

(assert (= (and b!54597 res!30879) b!54598))

(assert (= (and b!54598 res!30878) b!54599))

(assert (= (and b!54599 res!30880) b!54604))

(assert (= (and b!54604 res!30881) b!54595))

(assert (= (and b!54595 (not res!30877)) b!54605))

(assert (= (and b!54606 condMapEmpty!2621) mapIsEmpty!2621))

(assert (= (and b!54606 (not condMapEmpty!2621)) mapNonEmpty!2621))

(get-info :version)

(assert (= (and mapNonEmpty!2621 ((_ is ValueCellFull!815) mapValue!2621)) b!54609))

(assert (= (and b!54606 ((_ is ValueCellFull!815) mapDefault!2622)) b!54611))

(assert (= b!54602 b!54606))

(assert (= b!54596 b!54602))

(assert (= b!54603 b!54596))

(assert (= start!8322 b!54603))

(assert (= (and b!54610 condMapEmpty!2622) mapIsEmpty!2622))

(assert (= (and b!54610 (not condMapEmpty!2622)) mapNonEmpty!2622))

(assert (= (and mapNonEmpty!2622 ((_ is ValueCellFull!815) mapValue!2622)) b!54600))

(assert (= (and b!54610 ((_ is ValueCellFull!815) mapDefault!2621)) b!54608))

(assert (= b!54607 b!54610))

(assert (= start!8322 b!54607))

(declare-fun b_lambda!2415 () Bool)

(assert (=> (not b_lambda!2415) (not b!54604)))

(declare-fun t!4552 () Bool)

(declare-fun tb!1145 () Bool)

(assert (=> (and b!54602 (= (defaultEntry!1983 (v!2290 (underlying!187 thiss!992))) (defaultEntry!1983 (v!2290 (underlying!187 thiss!992)))) t!4552) tb!1145))

(declare-fun result!2115 () Bool)

(assert (=> tb!1145 (= result!2115 tp_is_empty!2317)))

(assert (=> b!54604 t!4552))

(declare-fun b_and!3149 () Bool)

(assert (= b_and!3145 (and (=> t!4552 result!2115) b_and!3149)))

(declare-fun t!4554 () Bool)

(declare-fun tb!1147 () Bool)

(assert (=> (and b!54607 (= (defaultEntry!1983 newMap!16) (defaultEntry!1983 (v!2290 (underlying!187 thiss!992)))) t!4554) tb!1147))

(declare-fun result!2119 () Bool)

(assert (= result!2119 result!2115))

(assert (=> b!54604 t!4554))

(declare-fun b_and!3151 () Bool)

(assert (= b_and!3147 (and (=> t!4554 result!2119) b_and!3151)))

(declare-fun m!46117 () Bool)

(assert (=> b!54607 m!46117))

(declare-fun m!46119 () Bool)

(assert (=> b!54607 m!46119))

(declare-fun m!46121 () Bool)

(assert (=> b!54595 m!46121))

(assert (=> b!54595 m!46121))

(declare-fun m!46123 () Bool)

(assert (=> b!54595 m!46123))

(assert (=> b!54595 m!46121))

(declare-fun m!46125 () Bool)

(assert (=> b!54595 m!46125))

(declare-fun m!46127 () Bool)

(assert (=> b!54602 m!46127))

(declare-fun m!46129 () Bool)

(assert (=> b!54602 m!46129))

(declare-fun m!46131 () Bool)

(assert (=> b!54604 m!46131))

(declare-fun m!46133 () Bool)

(assert (=> b!54604 m!46133))

(declare-fun m!46135 () Bool)

(assert (=> b!54604 m!46135))

(assert (=> b!54604 m!46121))

(assert (=> b!54604 m!46121))

(assert (=> b!54604 m!46135))

(declare-fun m!46137 () Bool)

(assert (=> b!54604 m!46137))

(assert (=> b!54604 m!46131))

(assert (=> b!54604 m!46121))

(declare-fun m!46139 () Bool)

(assert (=> b!54604 m!46139))

(assert (=> b!54604 m!46133))

(declare-fun m!46141 () Bool)

(assert (=> mapNonEmpty!2621 m!46141))

(declare-fun m!46143 () Bool)

(assert (=> mapNonEmpty!2622 m!46143))

(declare-fun m!46145 () Bool)

(assert (=> b!54605 m!46145))

(assert (=> b!54599 m!46121))

(declare-fun m!46147 () Bool)

(assert (=> b!54599 m!46147))

(declare-fun m!46149 () Bool)

(assert (=> b!54599 m!46149))

(declare-fun m!46151 () Bool)

(assert (=> start!8322 m!46151))

(declare-fun m!46153 () Bool)

(assert (=> b!54597 m!46153))

(check-sat (not b!54597) (not b!54607) (not b!54605) tp_is_empty!2317 b_and!3149 (not b!54604) (not mapNonEmpty!2621) (not b_lambda!2415) (not mapNonEmpty!2622) (not b!54602) (not start!8322) (not b!54599) b_and!3151 (not b_next!1803) (not b_next!1801) (not b!54595))
(check-sat b_and!3149 b_and!3151 (not b_next!1801) (not b_next!1803))
