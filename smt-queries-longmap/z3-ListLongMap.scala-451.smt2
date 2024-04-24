; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8322 () Bool)

(assert start!8322)

(declare-fun b!54604 () Bool)

(declare-fun b_free!1801 () Bool)

(declare-fun b_next!1801 () Bool)

(assert (=> b!54604 (= b_free!1801 (not b_next!1801))))

(declare-fun tp!7503 () Bool)

(declare-fun b_and!3141 () Bool)

(assert (=> b!54604 (= tp!7503 b_and!3141)))

(declare-fun b!54609 () Bool)

(declare-fun b_free!1803 () Bool)

(declare-fun b_next!1803 () Bool)

(assert (=> b!54609 (= b_free!1803 (not b_next!1803))))

(declare-fun tp!7505 () Bool)

(declare-fun b_and!3143 () Bool)

(assert (=> b!54609 (= tp!7505 b_and!3143)))

(declare-fun e!35709 () Bool)

(declare-datatypes ((V!2737 0))(
  ( (V!2738 (val!1203 Int)) )
))
(declare-datatypes ((array!3543 0))(
  ( (array!3544 (arr!1694 (Array (_ BitVec 32) (_ BitVec 64))) (size!1923 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!815 0))(
  ( (ValueCellFull!815 (v!2295 V!2737)) (EmptyCell!815) )
))
(declare-datatypes ((array!3545 0))(
  ( (array!3546 (arr!1695 (Array (_ BitVec 32) ValueCell!815)) (size!1924 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!538 0))(
  ( (LongMapFixedSize!539 (defaultEntry!1983 Int) (mask!5832 (_ BitVec 32)) (extraKeys!1874 (_ BitVec 32)) (zeroValue!1901 V!2737) (minValue!1901 V!2737) (_size!318 (_ BitVec 32)) (_keys!3603 array!3543) (_values!1966 array!3545) (_vacant!318 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!358 0))(
  ( (Cell!359 (v!2296 LongMapFixedSize!538)) )
))
(declare-datatypes ((LongMap!358 0))(
  ( (LongMap!359 (underlying!190 Cell!358)) )
))
(declare-fun thiss!992 () LongMap!358)

(declare-fun tp_is_empty!2317 () Bool)

(declare-fun e!35722 () Bool)

(declare-fun array_inv!1039 (array!3543) Bool)

(declare-fun array_inv!1040 (array!3545) Bool)

(assert (=> b!54604 (= e!35722 (and tp!7503 tp_is_empty!2317 (array_inv!1039 (_keys!3603 (v!2296 (underlying!190 thiss!992)))) (array_inv!1040 (_values!1966 (v!2296 (underlying!190 thiss!992)))) e!35709))))

(declare-fun b!54605 () Bool)

(declare-fun e!35718 () Bool)

(declare-fun e!35714 () Bool)

(assert (=> b!54605 (= e!35718 (not e!35714))))

(declare-fun res!30872 () Bool)

(assert (=> b!54605 (=> res!30872 e!35714)))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!54605 (= res!30872 (or (bvsge (size!1923 (_keys!3603 (v!2296 (underlying!190 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1923 (_keys!3603 (v!2296 (underlying!190 thiss!992))))) (bvsgt from!355 (size!1923 (_keys!3603 (v!2296 (underlying!190 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!54605 (arrayContainsKey!0 (_keys!3603 (v!2296 (underlying!190 thiss!992))) (select (arr!1694 (_keys!3603 (v!2296 (underlying!190 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1444 0))(
  ( (Unit!1445) )
))
(declare-fun lt!21670 () Unit!1444)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!6 (array!3543 array!3545 (_ BitVec 32) (_ BitVec 32) V!2737 V!2737 (_ BitVec 64) (_ BitVec 32) Int) Unit!1444)

(assert (=> b!54605 (= lt!21670 (lemmaListMapContainsThenArrayContainsFrom!6 (_keys!3603 (v!2296 (underlying!190 thiss!992))) (_values!1966 (v!2296 (underlying!190 thiss!992))) (mask!5832 (v!2296 (underlying!190 thiss!992))) (extraKeys!1874 (v!2296 (underlying!190 thiss!992))) (zeroValue!1901 (v!2296 (underlying!190 thiss!992))) (minValue!1901 (v!2296 (underlying!190 thiss!992))) (select (arr!1694 (_keys!3603 (v!2296 (underlying!190 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1983 (v!2296 (underlying!190 thiss!992)))))))

(declare-fun mapNonEmpty!2621 () Bool)

(declare-fun mapRes!2621 () Bool)

(declare-fun tp!7506 () Bool)

(declare-fun e!35708 () Bool)

(assert (=> mapNonEmpty!2621 (= mapRes!2621 (and tp!7506 e!35708))))

(declare-fun mapRest!2622 () (Array (_ BitVec 32) ValueCell!815))

(declare-fun mapValue!2622 () ValueCell!815)

(declare-fun mapKey!2621 () (_ BitVec 32))

(declare-fun newMap!16 () LongMapFixedSize!538)

(assert (=> mapNonEmpty!2621 (= (arr!1695 (_values!1966 newMap!16)) (store mapRest!2622 mapKey!2621 mapValue!2622))))

(declare-fun b!54607 () Bool)

(declare-fun res!30873 () Bool)

(declare-fun e!35721 () Bool)

(assert (=> b!54607 (=> (not res!30873) (not e!35721))))

(assert (=> b!54607 (= res!30873 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1923 (_keys!3603 (v!2296 (underlying!190 thiss!992)))))))))

(declare-fun b!54608 () Bool)

(declare-fun e!35711 () Bool)

(declare-fun e!35717 () Bool)

(assert (=> b!54608 (= e!35711 e!35717)))

(declare-fun e!35713 () Bool)

(declare-fun e!35720 () Bool)

(assert (=> b!54609 (= e!35713 (and tp!7505 tp_is_empty!2317 (array_inv!1039 (_keys!3603 newMap!16)) (array_inv!1040 (_values!1966 newMap!16)) e!35720))))

(declare-fun b!54610 () Bool)

(declare-fun res!30874 () Bool)

(assert (=> b!54610 (=> (not res!30874) (not e!35721))))

(assert (=> b!54610 (= res!30874 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5832 newMap!16)) (_size!318 (v!2296 (underlying!190 thiss!992)))))))

(declare-fun b!54611 () Bool)

(assert (=> b!54611 (= e!35717 e!35722)))

(declare-fun b!54612 () Bool)

(declare-fun e!35716 () Bool)

(assert (=> b!54612 (= e!35720 (and e!35716 mapRes!2621))))

(declare-fun condMapEmpty!2622 () Bool)

(declare-fun mapDefault!2622 () ValueCell!815)

(assert (=> b!54612 (= condMapEmpty!2622 (= (arr!1695 (_values!1966 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!815)) mapDefault!2622)))))

(declare-fun b!54613 () Bool)

(declare-fun e!35712 () Bool)

(assert (=> b!54613 (= e!35712 tp_is_empty!2317)))

(declare-fun b!54606 () Bool)

(declare-fun res!30877 () Bool)

(assert (=> b!54606 (=> (not res!30877) (not e!35721))))

(declare-fun valid!220 (LongMapFixedSize!538) Bool)

(assert (=> b!54606 (= res!30877 (valid!220 newMap!16))))

(declare-fun res!30871 () Bool)

(assert (=> start!8322 (=> (not res!30871) (not e!35721))))

(declare-fun valid!221 (LongMap!358) Bool)

(assert (=> start!8322 (= res!30871 (valid!221 thiss!992))))

(assert (=> start!8322 e!35721))

(assert (=> start!8322 e!35711))

(assert (=> start!8322 true))

(assert (=> start!8322 e!35713))

(declare-fun b!54614 () Bool)

(declare-fun e!35719 () Bool)

(declare-fun mapRes!2622 () Bool)

(assert (=> b!54614 (= e!35709 (and e!35719 mapRes!2622))))

(declare-fun condMapEmpty!2621 () Bool)

(declare-fun mapDefault!2621 () ValueCell!815)

(assert (=> b!54614 (= condMapEmpty!2621 (= (arr!1695 (_values!1966 (v!2296 (underlying!190 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!815)) mapDefault!2621)))))

(declare-fun b!54615 () Bool)

(assert (=> b!54615 (= e!35719 tp_is_empty!2317)))

(declare-fun mapIsEmpty!2621 () Bool)

(assert (=> mapIsEmpty!2621 mapRes!2621))

(declare-fun b!54616 () Bool)

(assert (=> b!54616 (= e!35708 tp_is_empty!2317)))

(declare-fun mapIsEmpty!2622 () Bool)

(assert (=> mapIsEmpty!2622 mapRes!2622))

(declare-fun b!54617 () Bool)

(assert (=> b!54617 (= e!35716 tp_is_empty!2317)))

(declare-fun b!54618 () Bool)

(declare-fun e!35710 () Bool)

(assert (=> b!54618 (= e!35710 e!35718)))

(declare-fun res!30875 () Bool)

(assert (=> b!54618 (=> (not res!30875) (not e!35718))))

(declare-datatypes ((tuple2!1928 0))(
  ( (tuple2!1929 (_1!975 (_ BitVec 64)) (_2!975 V!2737)) )
))
(declare-datatypes ((List!1369 0))(
  ( (Nil!1366) (Cons!1365 (h!1945 tuple2!1928) (t!4539 List!1369)) )
))
(declare-datatypes ((ListLongMap!1295 0))(
  ( (ListLongMap!1296 (toList!663 List!1369)) )
))
(declare-fun lt!21668 () ListLongMap!1295)

(declare-fun contains!640 (ListLongMap!1295 (_ BitVec 64)) Bool)

(assert (=> b!54618 (= res!30875 (contains!640 lt!21668 (select (arr!1694 (_keys!3603 (v!2296 (underlying!190 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1930 0))(
  ( (tuple2!1931 (_1!976 Bool) (_2!976 LongMapFixedSize!538)) )
))
(declare-fun lt!21671 () tuple2!1930)

(declare-fun update!67 (LongMapFixedSize!538 (_ BitVec 64) V!2737) tuple2!1930)

(declare-fun get!1022 (ValueCell!815 V!2737) V!2737)

(declare-fun dynLambda!285 (Int (_ BitVec 64)) V!2737)

(assert (=> b!54618 (= lt!21671 (update!67 newMap!16 (select (arr!1694 (_keys!3603 (v!2296 (underlying!190 thiss!992)))) from!355) (get!1022 (select (arr!1695 (_values!1966 (v!2296 (underlying!190 thiss!992)))) from!355) (dynLambda!285 (defaultEntry!1983 (v!2296 (underlying!190 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!54619 () Bool)

(assert (=> b!54619 (= e!35721 e!35710)))

(declare-fun res!30876 () Bool)

(assert (=> b!54619 (=> (not res!30876) (not e!35710))))

(declare-fun lt!21667 () ListLongMap!1295)

(assert (=> b!54619 (= res!30876 (and (= lt!21667 lt!21668) (not (= (select (arr!1694 (_keys!3603 (v!2296 (underlying!190 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1694 (_keys!3603 (v!2296 (underlying!190 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1060 (LongMapFixedSize!538) ListLongMap!1295)

(assert (=> b!54619 (= lt!21668 (map!1060 newMap!16))))

(declare-fun getCurrentListMap!366 (array!3543 array!3545 (_ BitVec 32) (_ BitVec 32) V!2737 V!2737 (_ BitVec 32) Int) ListLongMap!1295)

(assert (=> b!54619 (= lt!21667 (getCurrentListMap!366 (_keys!3603 (v!2296 (underlying!190 thiss!992))) (_values!1966 (v!2296 (underlying!190 thiss!992))) (mask!5832 (v!2296 (underlying!190 thiss!992))) (extraKeys!1874 (v!2296 (underlying!190 thiss!992))) (zeroValue!1901 (v!2296 (underlying!190 thiss!992))) (minValue!1901 (v!2296 (underlying!190 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1983 (v!2296 (underlying!190 thiss!992)))))))

(declare-fun b!54620 () Bool)

(assert (=> b!54620 (= e!35714 true)))

(declare-fun lt!21669 () Bool)

(declare-datatypes ((List!1370 0))(
  ( (Nil!1367) (Cons!1366 (h!1946 (_ BitVec 64)) (t!4540 List!1370)) )
))
(declare-fun arrayNoDuplicates!0 (array!3543 (_ BitVec 32) List!1370) Bool)

(assert (=> b!54620 (= lt!21669 (arrayNoDuplicates!0 (_keys!3603 (v!2296 (underlying!190 thiss!992))) #b00000000000000000000000000000000 Nil!1367))))

(declare-fun mapNonEmpty!2622 () Bool)

(declare-fun tp!7504 () Bool)

(assert (=> mapNonEmpty!2622 (= mapRes!2622 (and tp!7504 e!35712))))

(declare-fun mapKey!2622 () (_ BitVec 32))

(declare-fun mapValue!2621 () ValueCell!815)

(declare-fun mapRest!2621 () (Array (_ BitVec 32) ValueCell!815))

(assert (=> mapNonEmpty!2622 (= (arr!1695 (_values!1966 (v!2296 (underlying!190 thiss!992)))) (store mapRest!2621 mapKey!2622 mapValue!2621))))

(assert (= (and start!8322 res!30871) b!54607))

(assert (= (and b!54607 res!30873) b!54606))

(assert (= (and b!54606 res!30877) b!54610))

(assert (= (and b!54610 res!30874) b!54619))

(assert (= (and b!54619 res!30876) b!54618))

(assert (= (and b!54618 res!30875) b!54605))

(assert (= (and b!54605 (not res!30872)) b!54620))

(assert (= (and b!54614 condMapEmpty!2621) mapIsEmpty!2622))

(assert (= (and b!54614 (not condMapEmpty!2621)) mapNonEmpty!2622))

(get-info :version)

(assert (= (and mapNonEmpty!2622 ((_ is ValueCellFull!815) mapValue!2621)) b!54613))

(assert (= (and b!54614 ((_ is ValueCellFull!815) mapDefault!2621)) b!54615))

(assert (= b!54604 b!54614))

(assert (= b!54611 b!54604))

(assert (= b!54608 b!54611))

(assert (= start!8322 b!54608))

(assert (= (and b!54612 condMapEmpty!2622) mapIsEmpty!2621))

(assert (= (and b!54612 (not condMapEmpty!2622)) mapNonEmpty!2621))

(assert (= (and mapNonEmpty!2621 ((_ is ValueCellFull!815) mapValue!2622)) b!54616))

(assert (= (and b!54612 ((_ is ValueCellFull!815) mapDefault!2622)) b!54617))

(assert (= b!54609 b!54612))

(assert (= start!8322 b!54609))

(declare-fun b_lambda!2411 () Bool)

(assert (=> (not b_lambda!2411) (not b!54618)))

(declare-fun t!4536 () Bool)

(declare-fun tb!1145 () Bool)

(assert (=> (and b!54604 (= (defaultEntry!1983 (v!2296 (underlying!190 thiss!992))) (defaultEntry!1983 (v!2296 (underlying!190 thiss!992)))) t!4536) tb!1145))

(declare-fun result!2115 () Bool)

(assert (=> tb!1145 (= result!2115 tp_is_empty!2317)))

(assert (=> b!54618 t!4536))

(declare-fun b_and!3145 () Bool)

(assert (= b_and!3141 (and (=> t!4536 result!2115) b_and!3145)))

(declare-fun t!4538 () Bool)

(declare-fun tb!1147 () Bool)

(assert (=> (and b!54609 (= (defaultEntry!1983 newMap!16) (defaultEntry!1983 (v!2296 (underlying!190 thiss!992)))) t!4538) tb!1147))

(declare-fun result!2119 () Bool)

(assert (= result!2119 result!2115))

(assert (=> b!54618 t!4538))

(declare-fun b_and!3147 () Bool)

(assert (= b_and!3143 (and (=> t!4538 result!2119) b_and!3147)))

(declare-fun m!46075 () Bool)

(assert (=> b!54605 m!46075))

(assert (=> b!54605 m!46075))

(declare-fun m!46077 () Bool)

(assert (=> b!54605 m!46077))

(assert (=> b!54605 m!46075))

(declare-fun m!46079 () Bool)

(assert (=> b!54605 m!46079))

(declare-fun m!46081 () Bool)

(assert (=> mapNonEmpty!2622 m!46081))

(declare-fun m!46083 () Bool)

(assert (=> b!54620 m!46083))

(assert (=> b!54619 m!46075))

(declare-fun m!46085 () Bool)

(assert (=> b!54619 m!46085))

(declare-fun m!46087 () Bool)

(assert (=> b!54619 m!46087))

(declare-fun m!46089 () Bool)

(assert (=> b!54606 m!46089))

(declare-fun m!46091 () Bool)

(assert (=> b!54609 m!46091))

(declare-fun m!46093 () Bool)

(assert (=> b!54609 m!46093))

(declare-fun m!46095 () Bool)

(assert (=> b!54618 m!46095))

(declare-fun m!46097 () Bool)

(assert (=> b!54618 m!46097))

(declare-fun m!46099 () Bool)

(assert (=> b!54618 m!46099))

(assert (=> b!54618 m!46075))

(declare-fun m!46101 () Bool)

(assert (=> b!54618 m!46101))

(assert (=> b!54618 m!46075))

(assert (=> b!54618 m!46097))

(assert (=> b!54618 m!46075))

(assert (=> b!54618 m!46099))

(declare-fun m!46103 () Bool)

(assert (=> b!54618 m!46103))

(assert (=> b!54618 m!46095))

(declare-fun m!46105 () Bool)

(assert (=> start!8322 m!46105))

(declare-fun m!46107 () Bool)

(assert (=> b!54604 m!46107))

(declare-fun m!46109 () Bool)

(assert (=> b!54604 m!46109))

(declare-fun m!46111 () Bool)

(assert (=> mapNonEmpty!2621 m!46111))

(check-sat (not b_next!1801) (not b!54619) (not b!54620) b_and!3145 (not b!54609) (not b_lambda!2411) (not b_next!1803) (not mapNonEmpty!2621) b_and!3147 (not start!8322) (not mapNonEmpty!2622) (not b!54606) tp_is_empty!2317 (not b!54605) (not b!54618) (not b!54604))
(check-sat b_and!3145 b_and!3147 (not b_next!1801) (not b_next!1803))
