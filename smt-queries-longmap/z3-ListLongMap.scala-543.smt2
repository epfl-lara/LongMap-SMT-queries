; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14178 () Bool)

(assert start!14178)

(declare-fun b!131538 () Bool)

(declare-fun b_free!2909 () Bool)

(declare-fun b_next!2909 () Bool)

(assert (=> b!131538 (= b_free!2909 (not b_next!2909))))

(declare-fun tp!11166 () Bool)

(declare-fun b_and!8147 () Bool)

(assert (=> b!131538 (= tp!11166 b_and!8147)))

(declare-fun b!131534 () Bool)

(declare-fun b_free!2911 () Bool)

(declare-fun b_next!2911 () Bool)

(assert (=> b!131534 (= b_free!2911 (not b_next!2911))))

(declare-fun tp!11164 () Bool)

(declare-fun b_and!8149 () Bool)

(assert (=> b!131534 (= tp!11164 b_and!8149)))

(declare-fun res!63383 () Bool)

(declare-fun e!85792 () Bool)

(assert (=> start!14178 (=> (not res!63383) (not e!85792))))

(declare-datatypes ((V!3475 0))(
  ( (V!3476 (val!1480 Int)) )
))
(declare-datatypes ((array!4767 0))(
  ( (array!4768 (arr!2255 (Array (_ BitVec 32) (_ BitVec 64))) (size!2523 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1092 0))(
  ( (ValueCellFull!1092 (v!3186 V!3475)) (EmptyCell!1092) )
))
(declare-datatypes ((array!4769 0))(
  ( (array!4770 (arr!2256 (Array (_ BitVec 32) ValueCell!1092)) (size!2524 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1092 0))(
  ( (LongMapFixedSize!1093 (defaultEntry!2854 Int) (mask!7148 (_ BitVec 32)) (extraKeys!2621 (_ BitVec 32)) (zeroValue!2710 V!3475) (minValue!2710 V!3475) (_size!595 (_ BitVec 32)) (_keys!4601 array!4767) (_values!2837 array!4769) (_vacant!595 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!882 0))(
  ( (Cell!883 (v!3187 LongMapFixedSize!1092)) )
))
(declare-datatypes ((LongMap!882 0))(
  ( (LongMap!883 (underlying!452 Cell!882)) )
))
(declare-fun thiss!992 () LongMap!882)

(declare-fun valid!519 (LongMap!882) Bool)

(assert (=> start!14178 (= res!63383 (valid!519 thiss!992))))

(assert (=> start!14178 e!85792))

(declare-fun e!85793 () Bool)

(assert (=> start!14178 e!85793))

(assert (=> start!14178 true))

(declare-fun e!85791 () Bool)

(assert (=> start!14178 e!85791))

(declare-fun b!131521 () Bool)

(declare-fun res!63384 () Bool)

(declare-fun e!85785 () Bool)

(assert (=> b!131521 (=> (not res!63384) (not e!85785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!131521 (= res!63384 (validMask!0 (mask!7148 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!131522 () Bool)

(declare-fun res!63380 () Bool)

(assert (=> b!131522 (=> (not res!63380) (not e!85792))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!131522 (= res!63380 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun b!131523 () Bool)

(declare-fun e!85790 () Bool)

(declare-fun tp_is_empty!2871 () Bool)

(assert (=> b!131523 (= e!85790 tp_is_empty!2871)))

(declare-fun b!131524 () Bool)

(declare-fun e!85786 () Bool)

(declare-fun e!85782 () Bool)

(declare-fun mapRes!4619 () Bool)

(assert (=> b!131524 (= e!85786 (and e!85782 mapRes!4619))))

(declare-fun condMapEmpty!4619 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1092)

(declare-fun mapDefault!4620 () ValueCell!1092)

(assert (=> b!131524 (= condMapEmpty!4619 (= (arr!2256 (_values!2837 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1092)) mapDefault!4620)))))

(declare-fun b!131525 () Bool)

(declare-fun res!63387 () Bool)

(assert (=> b!131525 (=> (not res!63387) (not e!85792))))

(declare-fun valid!520 (LongMapFixedSize!1092) Bool)

(assert (=> b!131525 (= res!63387 (valid!520 newMap!16))))

(declare-fun b!131526 () Bool)

(declare-fun e!85780 () Bool)

(assert (=> b!131526 (= e!85780 tp_is_empty!2871)))

(declare-fun b!131527 () Bool)

(declare-fun e!85781 () Bool)

(declare-fun e!85794 () Bool)

(assert (=> b!131527 (= e!85781 e!85794)))

(declare-fun b!131528 () Bool)

(declare-fun e!85789 () Bool)

(assert (=> b!131528 (= e!85789 tp_is_empty!2871)))

(declare-fun b!131529 () Bool)

(declare-fun res!63385 () Bool)

(assert (=> b!131529 (=> (not res!63385) (not e!85792))))

(assert (=> b!131529 (= res!63385 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7148 newMap!16)) (_size!595 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!131530 () Bool)

(assert (=> b!131530 (= e!85793 e!85781)))

(declare-fun b!131531 () Bool)

(declare-datatypes ((List!1713 0))(
  ( (Nil!1710) (Cons!1709 (h!2314 (_ BitVec 64)) (t!6148 List!1713)) )
))
(declare-fun arrayNoDuplicates!0 (array!4767 (_ BitVec 32) List!1713) Bool)

(assert (=> b!131531 (= e!85785 (not (arrayNoDuplicates!0 (_keys!4601 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000000 Nil!1710)))))

(declare-fun b!131532 () Bool)

(declare-fun e!85783 () Bool)

(declare-fun mapRes!4620 () Bool)

(assert (=> b!131532 (= e!85783 (and e!85790 mapRes!4620))))

(declare-fun condMapEmpty!4620 () Bool)

(declare-fun mapDefault!4619 () ValueCell!1092)

(assert (=> b!131532 (= condMapEmpty!4620 (= (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1092)) mapDefault!4619)))))

(declare-fun b!131533 () Bool)

(declare-fun e!85784 () Bool)

(assert (=> b!131533 (= e!85792 e!85784)))

(declare-fun res!63379 () Bool)

(assert (=> b!131533 (=> (not res!63379) (not e!85784))))

(declare-datatypes ((tuple2!2618 0))(
  ( (tuple2!2619 (_1!1320 (_ BitVec 64)) (_2!1320 V!3475)) )
))
(declare-datatypes ((List!1714 0))(
  ( (Nil!1711) (Cons!1710 (h!2315 tuple2!2618) (t!6149 List!1714)) )
))
(declare-datatypes ((ListLongMap!1703 0))(
  ( (ListLongMap!1704 (toList!867 List!1714)) )
))
(declare-fun lt!68519 () ListLongMap!1703)

(declare-fun lt!68520 () ListLongMap!1703)

(assert (=> b!131533 (= res!63379 (and (= lt!68519 lt!68520) (not (= (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1405 (LongMapFixedSize!1092) ListLongMap!1703)

(assert (=> b!131533 (= lt!68520 (map!1405 newMap!16))))

(declare-fun getCurrentListMap!544 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 (_ BitVec 32) Int) ListLongMap!1703)

(assert (=> b!131533 (= lt!68519 (getCurrentListMap!544 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (_values!2837 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992))) (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) (minValue!2710 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun array_inv!1419 (array!4767) Bool)

(declare-fun array_inv!1420 (array!4769) Bool)

(assert (=> b!131534 (= e!85791 (and tp!11164 tp_is_empty!2871 (array_inv!1419 (_keys!4601 newMap!16)) (array_inv!1420 (_values!2837 newMap!16)) e!85786))))

(declare-fun b!131535 () Bool)

(assert (=> b!131535 (= e!85784 e!85785)))

(declare-fun res!63381 () Bool)

(assert (=> b!131535 (=> (not res!63381) (not e!85785))))

(declare-fun contains!895 (ListLongMap!1703 (_ BitVec 64)) Bool)

(assert (=> b!131535 (= res!63381 (contains!895 lt!68520 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2620 0))(
  ( (tuple2!2621 (_1!1321 Bool) (_2!1321 LongMapFixedSize!1092)) )
))
(declare-fun lt!68521 () tuple2!2620)

(declare-fun update!192 (LongMapFixedSize!1092 (_ BitVec 64) V!3475) tuple2!2620)

(declare-fun get!1475 (ValueCell!1092 V!3475) V!3475)

(declare-fun dynLambda!423 (Int (_ BitVec 64)) V!3475)

(assert (=> b!131535 (= lt!68521 (update!192 newMap!16 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!4619 () Bool)

(declare-fun tp!11165 () Bool)

(assert (=> mapNonEmpty!4619 (= mapRes!4620 (and tp!11165 e!85789))))

(declare-fun mapValue!4620 () ValueCell!1092)

(declare-fun mapKey!4619 () (_ BitVec 32))

(declare-fun mapRest!4619 () (Array (_ BitVec 32) ValueCell!1092))

(assert (=> mapNonEmpty!4619 (= (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) (store mapRest!4619 mapKey!4619 mapValue!4620))))

(declare-fun mapNonEmpty!4620 () Bool)

(declare-fun tp!11163 () Bool)

(assert (=> mapNonEmpty!4620 (= mapRes!4619 (and tp!11163 e!85780))))

(declare-fun mapKey!4620 () (_ BitVec 32))

(declare-fun mapValue!4619 () ValueCell!1092)

(declare-fun mapRest!4620 () (Array (_ BitVec 32) ValueCell!1092))

(assert (=> mapNonEmpty!4620 (= (arr!2256 (_values!2837 newMap!16)) (store mapRest!4620 mapKey!4620 mapValue!4619))))

(declare-fun b!131536 () Bool)

(declare-fun res!63386 () Bool)

(assert (=> b!131536 (=> (not res!63386) (not e!85785))))

(assert (=> b!131536 (= res!63386 (and (= (size!2524 (_values!2837 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7148 (v!3187 (underlying!452 thiss!992))))) (= (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (size!2524 (_values!2837 (v!3187 (underlying!452 thiss!992))))) (bvsge (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!131537 () Bool)

(assert (=> b!131537 (= e!85782 tp_is_empty!2871)))

(assert (=> b!131538 (= e!85794 (and tp!11166 tp_is_empty!2871 (array_inv!1419 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (array_inv!1420 (_values!2837 (v!3187 (underlying!452 thiss!992)))) e!85783))))

(declare-fun mapIsEmpty!4619 () Bool)

(assert (=> mapIsEmpty!4619 mapRes!4620))

(declare-fun mapIsEmpty!4620 () Bool)

(assert (=> mapIsEmpty!4620 mapRes!4619))

(declare-fun b!131539 () Bool)

(declare-fun res!63382 () Bool)

(assert (=> b!131539 (=> (not res!63382) (not e!85785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4767 (_ BitVec 32)) Bool)

(assert (=> b!131539 (= res!63382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992)))))))

(assert (= (and start!14178 res!63383) b!131522))

(assert (= (and b!131522 res!63380) b!131525))

(assert (= (and b!131525 res!63387) b!131529))

(assert (= (and b!131529 res!63385) b!131533))

(assert (= (and b!131533 res!63379) b!131535))

(assert (= (and b!131535 res!63381) b!131521))

(assert (= (and b!131521 res!63384) b!131536))

(assert (= (and b!131536 res!63386) b!131539))

(assert (= (and b!131539 res!63382) b!131531))

(assert (= (and b!131532 condMapEmpty!4620) mapIsEmpty!4619))

(assert (= (and b!131532 (not condMapEmpty!4620)) mapNonEmpty!4619))

(get-info :version)

(assert (= (and mapNonEmpty!4619 ((_ is ValueCellFull!1092) mapValue!4620)) b!131528))

(assert (= (and b!131532 ((_ is ValueCellFull!1092) mapDefault!4619)) b!131523))

(assert (= b!131538 b!131532))

(assert (= b!131527 b!131538))

(assert (= b!131530 b!131527))

(assert (= start!14178 b!131530))

(assert (= (and b!131524 condMapEmpty!4619) mapIsEmpty!4620))

(assert (= (and b!131524 (not condMapEmpty!4619)) mapNonEmpty!4620))

(assert (= (and mapNonEmpty!4620 ((_ is ValueCellFull!1092) mapValue!4619)) b!131526))

(assert (= (and b!131524 ((_ is ValueCellFull!1092) mapDefault!4620)) b!131537))

(assert (= b!131534 b!131524))

(assert (= start!14178 b!131534))

(declare-fun b_lambda!5857 () Bool)

(assert (=> (not b_lambda!5857) (not b!131535)))

(declare-fun t!6145 () Bool)

(declare-fun tb!2397 () Bool)

(assert (=> (and b!131538 (= (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992)))) t!6145) tb!2397))

(declare-fun result!3959 () Bool)

(assert (=> tb!2397 (= result!3959 tp_is_empty!2871)))

(assert (=> b!131535 t!6145))

(declare-fun b_and!8151 () Bool)

(assert (= b_and!8147 (and (=> t!6145 result!3959) b_and!8151)))

(declare-fun t!6147 () Bool)

(declare-fun tb!2399 () Bool)

(assert (=> (and b!131534 (= (defaultEntry!2854 newMap!16) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992)))) t!6147) tb!2399))

(declare-fun result!3963 () Bool)

(assert (= result!3963 result!3959))

(assert (=> b!131535 t!6147))

(declare-fun b_and!8153 () Bool)

(assert (= b_and!8149 (and (=> t!6147 result!3963) b_and!8153)))

(declare-fun m!155015 () Bool)

(assert (=> mapNonEmpty!4619 m!155015))

(declare-fun m!155017 () Bool)

(assert (=> b!131525 m!155017))

(declare-fun m!155019 () Bool)

(assert (=> b!131521 m!155019))

(declare-fun m!155021 () Bool)

(assert (=> start!14178 m!155021))

(declare-fun m!155023 () Bool)

(assert (=> b!131535 m!155023))

(declare-fun m!155025 () Bool)

(assert (=> b!131535 m!155025))

(declare-fun m!155027 () Bool)

(assert (=> b!131535 m!155027))

(declare-fun m!155029 () Bool)

(assert (=> b!131535 m!155029))

(declare-fun m!155031 () Bool)

(assert (=> b!131535 m!155031))

(assert (=> b!131535 m!155029))

(assert (=> b!131535 m!155025))

(assert (=> b!131535 m!155029))

(assert (=> b!131535 m!155027))

(declare-fun m!155033 () Bool)

(assert (=> b!131535 m!155033))

(assert (=> b!131535 m!155023))

(declare-fun m!155035 () Bool)

(assert (=> b!131531 m!155035))

(assert (=> b!131533 m!155029))

(declare-fun m!155037 () Bool)

(assert (=> b!131533 m!155037))

(declare-fun m!155039 () Bool)

(assert (=> b!131533 m!155039))

(declare-fun m!155041 () Bool)

(assert (=> b!131534 m!155041))

(declare-fun m!155043 () Bool)

(assert (=> b!131534 m!155043))

(declare-fun m!155045 () Bool)

(assert (=> b!131538 m!155045))

(declare-fun m!155047 () Bool)

(assert (=> b!131538 m!155047))

(declare-fun m!155049 () Bool)

(assert (=> b!131539 m!155049))

(declare-fun m!155051 () Bool)

(assert (=> mapNonEmpty!4620 m!155051))

(check-sat (not b_next!2911) (not b!131539) tp_is_empty!2871 (not b!131521) (not b!131534) (not b!131533) (not start!14178) (not b_lambda!5857) b_and!8153 (not mapNonEmpty!4619) b_and!8151 (not b!131538) (not b!131525) (not mapNonEmpty!4620) (not b_next!2909) (not b!131535) (not b!131531))
(check-sat b_and!8151 b_and!8153 (not b_next!2909) (not b_next!2911))
(get-model)

(declare-fun b_lambda!5861 () Bool)

(assert (= b_lambda!5857 (or (and b!131538 b_free!2909) (and b!131534 b_free!2911 (= (defaultEntry!2854 newMap!16) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))))) b_lambda!5861)))

(check-sat (not b_next!2911) (not b!131539) tp_is_empty!2871 (not b!131521) (not b!131534) (not b!131533) (not b_lambda!5861) (not start!14178) b_and!8153 (not mapNonEmpty!4619) b_and!8151 (not b!131538) (not b!131525) (not mapNonEmpty!4620) (not b_next!2909) (not b!131535) (not b!131531))
(check-sat b_and!8151 b_and!8153 (not b_next!2909) (not b_next!2911))
(get-model)

(declare-fun d!40011 () Bool)

(assert (=> d!40011 (= (validMask!0 (mask!7148 (v!3187 (underlying!452 thiss!992)))) (and (or (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000001111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000011111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000001111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000011111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000001111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000011111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000000001111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000000011111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000000111111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000001111111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000011111111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000000111111111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000001111111111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000011111111111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000000111111111111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000001111111111111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000011111111111111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000000111111111111111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000001111111111111111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000011111111111111111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00000111111111111111111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00001111111111111111111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00011111111111111111111111111111) (= (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7148 (v!3187 (underlying!452 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!131521 d!40011))

(declare-fun b!131611 () Bool)

(declare-fun e!85848 () Bool)

(declare-fun e!85849 () Bool)

(assert (=> b!131611 (= e!85848 e!85849)))

(declare-fun c!24281 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!131611 (= c!24281 (validKeyInArray!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!131612 () Bool)

(declare-fun call!14380 () Bool)

(assert (=> b!131612 (= e!85849 call!14380)))

(declare-fun d!40013 () Bool)

(declare-fun res!63423 () Bool)

(declare-fun e!85850 () Bool)

(assert (=> d!40013 (=> res!63423 e!85850)))

(assert (=> d!40013 (= res!63423 (bvsge #b00000000000000000000000000000000 (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> d!40013 (= (arrayNoDuplicates!0 (_keys!4601 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000000 Nil!1710) e!85850)))

(declare-fun b!131613 () Bool)

(assert (=> b!131613 (= e!85850 e!85848)))

(declare-fun res!63421 () Bool)

(assert (=> b!131613 (=> (not res!63421) (not e!85848))))

(declare-fun e!85851 () Bool)

(assert (=> b!131613 (= res!63421 (not e!85851))))

(declare-fun res!63422 () Bool)

(assert (=> b!131613 (=> (not res!63422) (not e!85851))))

(assert (=> b!131613 (= res!63422 (validKeyInArray!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!14377 () Bool)

(assert (=> bm!14377 (= call!14380 (arrayNoDuplicates!0 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24281 (Cons!1709 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) Nil!1710) Nil!1710)))))

(declare-fun b!131614 () Bool)

(assert (=> b!131614 (= e!85849 call!14380)))

(declare-fun b!131615 () Bool)

(declare-fun contains!897 (List!1713 (_ BitVec 64)) Bool)

(assert (=> b!131615 (= e!85851 (contains!897 Nil!1710 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!40013 (not res!63423)) b!131613))

(assert (= (and b!131613 res!63422) b!131615))

(assert (= (and b!131613 res!63421) b!131611))

(assert (= (and b!131611 c!24281) b!131612))

(assert (= (and b!131611 (not c!24281)) b!131614))

(assert (= (or b!131612 b!131614) bm!14377))

(declare-fun m!155091 () Bool)

(assert (=> b!131611 m!155091))

(assert (=> b!131611 m!155091))

(declare-fun m!155093 () Bool)

(assert (=> b!131611 m!155093))

(assert (=> b!131613 m!155091))

(assert (=> b!131613 m!155091))

(assert (=> b!131613 m!155093))

(assert (=> bm!14377 m!155091))

(declare-fun m!155095 () Bool)

(assert (=> bm!14377 m!155095))

(assert (=> b!131615 m!155091))

(assert (=> b!131615 m!155091))

(declare-fun m!155097 () Bool)

(assert (=> b!131615 m!155097))

(assert (=> b!131531 d!40013))

(declare-fun d!40015 () Bool)

(assert (=> d!40015 (= (map!1405 newMap!16) (getCurrentListMap!544 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun bs!5454 () Bool)

(assert (= bs!5454 d!40015))

(declare-fun m!155099 () Bool)

(assert (=> bs!5454 m!155099))

(assert (=> b!131533 d!40015))

(declare-fun b!131658 () Bool)

(declare-fun e!85885 () Bool)

(declare-fun lt!68594 () ListLongMap!1703)

(declare-fun apply!115 (ListLongMap!1703 (_ BitVec 64)) V!3475)

(assert (=> b!131658 (= e!85885 (= (apply!115 lt!68594 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!131659 () Bool)

(declare-fun res!63442 () Bool)

(declare-fun e!85882 () Bool)

(assert (=> b!131659 (=> (not res!63442) (not e!85882))))

(declare-fun e!85879 () Bool)

(assert (=> b!131659 (= res!63442 e!85879)))

(declare-fun res!63444 () Bool)

(assert (=> b!131659 (=> res!63444 e!85879)))

(declare-fun e!85889 () Bool)

(assert (=> b!131659 (= res!63444 (not e!85889))))

(declare-fun res!63449 () Bool)

(assert (=> b!131659 (=> (not res!63449) (not e!85889))))

(assert (=> b!131659 (= res!63449 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun b!131660 () Bool)

(declare-fun e!85880 () Bool)

(assert (=> b!131660 (= e!85880 (validKeyInArray!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!14392 () Bool)

(declare-fun call!14397 () ListLongMap!1703)

(declare-fun call!14399 () ListLongMap!1703)

(assert (=> bm!14392 (= call!14397 call!14399)))

(declare-fun b!131661 () Bool)

(declare-fun e!85884 () ListLongMap!1703)

(declare-fun e!85883 () ListLongMap!1703)

(assert (=> b!131661 (= e!85884 e!85883)))

(declare-fun c!24295 () Bool)

(assert (=> b!131661 (= c!24295 (and (not (= (bvand (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131662 () Bool)

(declare-fun e!85881 () Bool)

(declare-fun call!14398 () Bool)

(assert (=> b!131662 (= e!85881 (not call!14398))))

(declare-fun b!131663 () Bool)

(assert (=> b!131663 (= e!85883 call!14397)))

(declare-fun b!131664 () Bool)

(declare-fun e!85887 () Bool)

(declare-fun e!85888 () Bool)

(assert (=> b!131664 (= e!85887 e!85888)))

(declare-fun res!63446 () Bool)

(declare-fun call!14396 () Bool)

(assert (=> b!131664 (= res!63446 call!14396)))

(assert (=> b!131664 (=> (not res!63446) (not e!85888))))

(declare-fun bm!14393 () Bool)

(assert (=> bm!14393 (= call!14398 (contains!895 lt!68594 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131665 () Bool)

(declare-fun e!85878 () ListLongMap!1703)

(declare-fun call!14401 () ListLongMap!1703)

(assert (=> b!131665 (= e!85878 call!14401)))

(declare-fun b!131666 () Bool)

(assert (=> b!131666 (= e!85881 e!85885)))

(declare-fun res!63448 () Bool)

(assert (=> b!131666 (= res!63448 call!14398)))

(assert (=> b!131666 (=> (not res!63448) (not e!85885))))

(declare-fun b!131667 () Bool)

(assert (=> b!131667 (= e!85888 (= (apply!115 lt!68594 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun bm!14394 () Bool)

(assert (=> bm!14394 (= call!14396 (contains!895 lt!68594 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14395 () Bool)

(declare-fun call!14400 () ListLongMap!1703)

(assert (=> bm!14395 (= call!14401 call!14400)))

(declare-fun b!131668 () Bool)

(assert (=> b!131668 (= e!85878 call!14397)))

(declare-fun bm!14396 () Bool)

(declare-fun call!14395 () ListLongMap!1703)

(assert (=> bm!14396 (= call!14400 call!14395)))

(declare-fun b!131669 () Bool)

(assert (=> b!131669 (= e!85882 e!85887)))

(declare-fun c!24298 () Bool)

(assert (=> b!131669 (= c!24298 (not (= (bvand (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131670 () Bool)

(assert (=> b!131670 (= e!85889 (validKeyInArray!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!131671 () Bool)

(declare-datatypes ((Unit!4116 0))(
  ( (Unit!4117) )
))
(declare-fun e!85886 () Unit!4116)

(declare-fun Unit!4118 () Unit!4116)

(assert (=> b!131671 (= e!85886 Unit!4118)))

(declare-fun d!40017 () Bool)

(assert (=> d!40017 e!85882))

(declare-fun res!63447 () Bool)

(assert (=> d!40017 (=> (not res!63447) (not e!85882))))

(assert (=> d!40017 (= res!63447 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))))))

(declare-fun lt!68589 () ListLongMap!1703)

(assert (=> d!40017 (= lt!68594 lt!68589)))

(declare-fun lt!68580 () Unit!4116)

(assert (=> d!40017 (= lt!68580 e!85886)))

(declare-fun c!24296 () Bool)

(assert (=> d!40017 (= c!24296 e!85880)))

(declare-fun res!63445 () Bool)

(assert (=> d!40017 (=> (not res!63445) (not e!85880))))

(assert (=> d!40017 (= res!63445 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> d!40017 (= lt!68589 e!85884)))

(declare-fun c!24297 () Bool)

(assert (=> d!40017 (= c!24297 (and (not (= (bvand (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40017 (validMask!0 (mask!7148 (v!3187 (underlying!452 thiss!992))))))

(assert (=> d!40017 (= (getCurrentListMap!544 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (_values!2837 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992))) (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) (minValue!2710 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992)))) lt!68594)))

(declare-fun bm!14397 () Bool)

(declare-fun +!174 (ListLongMap!1703 tuple2!2618) ListLongMap!1703)

(assert (=> bm!14397 (= call!14399 (+!174 (ite c!24297 call!14395 (ite c!24295 call!14400 call!14401)) (ite (or c!24297 c!24295) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun bm!14398 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!140 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 (_ BitVec 32) Int) ListLongMap!1703)

(assert (=> bm!14398 (= call!14395 (getCurrentListMapNoExtraKeys!140 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (_values!2837 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992))) (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) (minValue!2710 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!131672 () Bool)

(declare-fun e!85890 () Bool)

(assert (=> b!131672 (= e!85879 e!85890)))

(declare-fun res!63450 () Bool)

(assert (=> b!131672 (=> (not res!63450) (not e!85890))))

(assert (=> b!131672 (= res!63450 (contains!895 lt!68594 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131672 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun b!131673 () Bool)

(assert (=> b!131673 (= e!85890 (= (apply!115 lt!68594 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131673 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2524 (_values!2837 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> b!131673 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun b!131674 () Bool)

(assert (=> b!131674 (= e!85887 (not call!14396))))

(declare-fun b!131675 () Bool)

(declare-fun res!63443 () Bool)

(assert (=> b!131675 (=> (not res!63443) (not e!85882))))

(assert (=> b!131675 (= res!63443 e!85881)))

(declare-fun c!24299 () Bool)

(assert (=> b!131675 (= c!24299 (not (= (bvand (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!131676 () Bool)

(assert (=> b!131676 (= e!85884 (+!174 call!14399 (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun b!131677 () Bool)

(declare-fun c!24294 () Bool)

(assert (=> b!131677 (= c!24294 (and (not (= (bvand (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!131677 (= e!85883 e!85878)))

(declare-fun b!131678 () Bool)

(declare-fun lt!68586 () Unit!4116)

(assert (=> b!131678 (= e!85886 lt!68586)))

(declare-fun lt!68575 () ListLongMap!1703)

(assert (=> b!131678 (= lt!68575 (getCurrentListMapNoExtraKeys!140 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (_values!2837 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992))) (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) (minValue!2710 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun lt!68581 () (_ BitVec 64))

(assert (=> b!131678 (= lt!68581 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68596 () (_ BitVec 64))

(assert (=> b!131678 (= lt!68596 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68584 () Unit!4116)

(declare-fun addStillContains!91 (ListLongMap!1703 (_ BitVec 64) V!3475 (_ BitVec 64)) Unit!4116)

(assert (=> b!131678 (= lt!68584 (addStillContains!91 lt!68575 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) lt!68596))))

(assert (=> b!131678 (contains!895 (+!174 lt!68575 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68596)))

(declare-fun lt!68577 () Unit!4116)

(assert (=> b!131678 (= lt!68577 lt!68584)))

(declare-fun lt!68582 () ListLongMap!1703)

(assert (=> b!131678 (= lt!68582 (getCurrentListMapNoExtraKeys!140 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (_values!2837 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992))) (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) (minValue!2710 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun lt!68590 () (_ BitVec 64))

(assert (=> b!131678 (= lt!68590 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68591 () (_ BitVec 64))

(assert (=> b!131678 (= lt!68591 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68588 () Unit!4116)

(declare-fun addApplyDifferent!91 (ListLongMap!1703 (_ BitVec 64) V!3475 (_ BitVec 64)) Unit!4116)

(assert (=> b!131678 (= lt!68588 (addApplyDifferent!91 lt!68582 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992))) lt!68591))))

(assert (=> b!131678 (= (apply!115 (+!174 lt!68582 (tuple2!2619 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68591) (apply!115 lt!68582 lt!68591))))

(declare-fun lt!68592 () Unit!4116)

(assert (=> b!131678 (= lt!68592 lt!68588)))

(declare-fun lt!68585 () ListLongMap!1703)

(assert (=> b!131678 (= lt!68585 (getCurrentListMapNoExtraKeys!140 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (_values!2837 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992))) (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) (minValue!2710 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun lt!68587 () (_ BitVec 64))

(assert (=> b!131678 (= lt!68587 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68579 () (_ BitVec 64))

(assert (=> b!131678 (= lt!68579 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68593 () Unit!4116)

(assert (=> b!131678 (= lt!68593 (addApplyDifferent!91 lt!68585 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) lt!68579))))

(assert (=> b!131678 (= (apply!115 (+!174 lt!68585 (tuple2!2619 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68579) (apply!115 lt!68585 lt!68579))))

(declare-fun lt!68595 () Unit!4116)

(assert (=> b!131678 (= lt!68595 lt!68593)))

(declare-fun lt!68578 () ListLongMap!1703)

(assert (=> b!131678 (= lt!68578 (getCurrentListMapNoExtraKeys!140 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (_values!2837 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992))) (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) (minValue!2710 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun lt!68583 () (_ BitVec 64))

(assert (=> b!131678 (= lt!68583 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68576 () (_ BitVec 64))

(assert (=> b!131678 (= lt!68576 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!131678 (= lt!68586 (addApplyDifferent!91 lt!68578 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992))) lt!68576))))

(assert (=> b!131678 (= (apply!115 (+!174 lt!68578 (tuple2!2619 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68576) (apply!115 lt!68578 lt!68576))))

(assert (= (and d!40017 c!24297) b!131676))

(assert (= (and d!40017 (not c!24297)) b!131661))

(assert (= (and b!131661 c!24295) b!131663))

(assert (= (and b!131661 (not c!24295)) b!131677))

(assert (= (and b!131677 c!24294) b!131668))

(assert (= (and b!131677 (not c!24294)) b!131665))

(assert (= (or b!131668 b!131665) bm!14395))

(assert (= (or b!131663 bm!14395) bm!14396))

(assert (= (or b!131663 b!131668) bm!14392))

(assert (= (or b!131676 bm!14396) bm!14398))

(assert (= (or b!131676 bm!14392) bm!14397))

(assert (= (and d!40017 res!63445) b!131660))

(assert (= (and d!40017 c!24296) b!131678))

(assert (= (and d!40017 (not c!24296)) b!131671))

(assert (= (and d!40017 res!63447) b!131659))

(assert (= (and b!131659 res!63449) b!131670))

(assert (= (and b!131659 (not res!63444)) b!131672))

(assert (= (and b!131672 res!63450) b!131673))

(assert (= (and b!131659 res!63442) b!131675))

(assert (= (and b!131675 c!24299) b!131666))

(assert (= (and b!131675 (not c!24299)) b!131662))

(assert (= (and b!131666 res!63448) b!131658))

(assert (= (or b!131666 b!131662) bm!14393))

(assert (= (and b!131675 res!63443) b!131669))

(assert (= (and b!131669 c!24298) b!131664))

(assert (= (and b!131669 (not c!24298)) b!131674))

(assert (= (and b!131664 res!63446) b!131667))

(assert (= (or b!131664 b!131674) bm!14394))

(declare-fun b_lambda!5863 () Bool)

(assert (=> (not b_lambda!5863) (not b!131673)))

(assert (=> b!131673 t!6145))

(declare-fun b_and!8163 () Bool)

(assert (= b_and!8151 (and (=> t!6145 result!3959) b_and!8163)))

(assert (=> b!131673 t!6147))

(declare-fun b_and!8165 () Bool)

(assert (= b_and!8153 (and (=> t!6147 result!3963) b_and!8165)))

(assert (=> d!40017 m!155019))

(declare-fun m!155101 () Bool)

(assert (=> bm!14393 m!155101))

(declare-fun m!155103 () Bool)

(assert (=> b!131658 m!155103))

(declare-fun m!155105 () Bool)

(assert (=> b!131672 m!155105))

(assert (=> b!131672 m!155105))

(declare-fun m!155107 () Bool)

(assert (=> b!131672 m!155107))

(declare-fun m!155109 () Bool)

(assert (=> b!131678 m!155109))

(declare-fun m!155111 () Bool)

(assert (=> b!131678 m!155111))

(declare-fun m!155113 () Bool)

(assert (=> b!131678 m!155113))

(declare-fun m!155115 () Bool)

(assert (=> b!131678 m!155115))

(declare-fun m!155117 () Bool)

(assert (=> b!131678 m!155117))

(assert (=> b!131678 m!155111))

(declare-fun m!155119 () Bool)

(assert (=> b!131678 m!155119))

(declare-fun m!155121 () Bool)

(assert (=> b!131678 m!155121))

(declare-fun m!155123 () Bool)

(assert (=> b!131678 m!155123))

(declare-fun m!155125 () Bool)

(assert (=> b!131678 m!155125))

(declare-fun m!155127 () Bool)

(assert (=> b!131678 m!155127))

(assert (=> b!131678 m!155105))

(declare-fun m!155129 () Bool)

(assert (=> b!131678 m!155129))

(declare-fun m!155131 () Bool)

(assert (=> b!131678 m!155131))

(assert (=> b!131678 m!155115))

(assert (=> b!131678 m!155121))

(declare-fun m!155133 () Bool)

(assert (=> b!131678 m!155133))

(declare-fun m!155135 () Bool)

(assert (=> b!131678 m!155135))

(declare-fun m!155137 () Bool)

(assert (=> b!131678 m!155137))

(assert (=> b!131678 m!155135))

(declare-fun m!155139 () Bool)

(assert (=> b!131678 m!155139))

(assert (=> b!131660 m!155105))

(assert (=> b!131660 m!155105))

(declare-fun m!155141 () Bool)

(assert (=> b!131660 m!155141))

(assert (=> bm!14398 m!155129))

(assert (=> b!131670 m!155105))

(assert (=> b!131670 m!155105))

(assert (=> b!131670 m!155141))

(declare-fun m!155143 () Bool)

(assert (=> b!131673 m!155143))

(assert (=> b!131673 m!155143))

(assert (=> b!131673 m!155025))

(declare-fun m!155145 () Bool)

(assert (=> b!131673 m!155145))

(assert (=> b!131673 m!155105))

(declare-fun m!155147 () Bool)

(assert (=> b!131673 m!155147))

(assert (=> b!131673 m!155105))

(assert (=> b!131673 m!155025))

(declare-fun m!155149 () Bool)

(assert (=> bm!14394 m!155149))

(declare-fun m!155151 () Bool)

(assert (=> b!131676 m!155151))

(declare-fun m!155153 () Bool)

(assert (=> b!131667 m!155153))

(declare-fun m!155155 () Bool)

(assert (=> bm!14397 m!155155))

(assert (=> b!131533 d!40017))

(declare-fun bm!14401 () Bool)

(declare-fun call!14404 () Bool)

(assert (=> bm!14401 (= call!14404 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4601 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!131687 () Bool)

(declare-fun e!85897 () Bool)

(declare-fun e!85899 () Bool)

(assert (=> b!131687 (= e!85897 e!85899)))

(declare-fun lt!68603 () (_ BitVec 64))

(assert (=> b!131687 (= lt!68603 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!68604 () Unit!4116)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4767 (_ BitVec 64) (_ BitVec 32)) Unit!4116)

(assert (=> b!131687 (= lt!68604 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4601 (v!3187 (underlying!452 thiss!992))) lt!68603 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!4767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131687 (arrayContainsKey!0 (_keys!4601 (v!3187 (underlying!452 thiss!992))) lt!68603 #b00000000000000000000000000000000)))

(declare-fun lt!68605 () Unit!4116)

(assert (=> b!131687 (= lt!68605 lt!68604)))

(declare-fun res!63456 () Bool)

(declare-datatypes ((SeekEntryResult!274 0))(
  ( (MissingZero!274 (index!3255 (_ BitVec 32))) (Found!274 (index!3256 (_ BitVec 32))) (Intermediate!274 (undefined!1086 Bool) (index!3257 (_ BitVec 32)) (x!15502 (_ BitVec 32))) (Undefined!274) (MissingVacant!274 (index!3258 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4767 (_ BitVec 32)) SeekEntryResult!274)

(assert (=> b!131687 (= res!63456 (= (seekEntryOrOpen!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) (_keys!4601 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992)))) (Found!274 #b00000000000000000000000000000000)))))

(assert (=> b!131687 (=> (not res!63456) (not e!85899))))

(declare-fun b!131688 () Bool)

(assert (=> b!131688 (= e!85899 call!14404)))

(declare-fun b!131689 () Bool)

(assert (=> b!131689 (= e!85897 call!14404)))

(declare-fun b!131690 () Bool)

(declare-fun e!85898 () Bool)

(assert (=> b!131690 (= e!85898 e!85897)))

(declare-fun c!24302 () Bool)

(assert (=> b!131690 (= c!24302 (validKeyInArray!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!40019 () Bool)

(declare-fun res!63455 () Bool)

(assert (=> d!40019 (=> res!63455 e!85898)))

(assert (=> d!40019 (= res!63455 (bvsge #b00000000000000000000000000000000 (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> d!40019 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992)))) e!85898)))

(assert (= (and d!40019 (not res!63455)) b!131690))

(assert (= (and b!131690 c!24302) b!131687))

(assert (= (and b!131690 (not c!24302)) b!131689))

(assert (= (and b!131687 res!63456) b!131688))

(assert (= (or b!131688 b!131689) bm!14401))

(declare-fun m!155157 () Bool)

(assert (=> bm!14401 m!155157))

(assert (=> b!131687 m!155091))

(declare-fun m!155159 () Bool)

(assert (=> b!131687 m!155159))

(declare-fun m!155161 () Bool)

(assert (=> b!131687 m!155161))

(assert (=> b!131687 m!155091))

(declare-fun m!155163 () Bool)

(assert (=> b!131687 m!155163))

(assert (=> b!131690 m!155091))

(assert (=> b!131690 m!155091))

(assert (=> b!131690 m!155093))

(assert (=> b!131539 d!40019))

(declare-fun d!40021 () Bool)

(assert (=> d!40021 (= (array_inv!1419 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvsge (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!131538 d!40021))

(declare-fun d!40023 () Bool)

(assert (=> d!40023 (= (array_inv!1420 (_values!2837 (v!3187 (underlying!452 thiss!992)))) (bvsge (size!2524 (_values!2837 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!131538 d!40023))

(declare-fun d!40025 () Bool)

(assert (=> d!40025 (= (array_inv!1419 (_keys!4601 newMap!16)) (bvsge (size!2523 (_keys!4601 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!131534 d!40025))

(declare-fun d!40027 () Bool)

(assert (=> d!40027 (= (array_inv!1420 (_values!2837 newMap!16)) (bvsge (size!2524 (_values!2837 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!131534 d!40027))

(declare-fun d!40029 () Bool)

(declare-fun res!63463 () Bool)

(declare-fun e!85902 () Bool)

(assert (=> d!40029 (=> (not res!63463) (not e!85902))))

(declare-fun simpleValid!91 (LongMapFixedSize!1092) Bool)

(assert (=> d!40029 (= res!63463 (simpleValid!91 newMap!16))))

(assert (=> d!40029 (= (valid!520 newMap!16) e!85902)))

(declare-fun b!131697 () Bool)

(declare-fun res!63464 () Bool)

(assert (=> b!131697 (=> (not res!63464) (not e!85902))))

(declare-fun arrayCountValidKeys!0 (array!4767 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!131697 (= res!63464 (= (arrayCountValidKeys!0 (_keys!4601 newMap!16) #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))) (_size!595 newMap!16)))))

(declare-fun b!131698 () Bool)

(declare-fun res!63465 () Bool)

(assert (=> b!131698 (=> (not res!63465) (not e!85902))))

(assert (=> b!131698 (= res!63465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4601 newMap!16) (mask!7148 newMap!16)))))

(declare-fun b!131699 () Bool)

(assert (=> b!131699 (= e!85902 (arrayNoDuplicates!0 (_keys!4601 newMap!16) #b00000000000000000000000000000000 Nil!1710))))

(assert (= (and d!40029 res!63463) b!131697))

(assert (= (and b!131697 res!63464) b!131698))

(assert (= (and b!131698 res!63465) b!131699))

(declare-fun m!155165 () Bool)

(assert (=> d!40029 m!155165))

(declare-fun m!155167 () Bool)

(assert (=> b!131697 m!155167))

(declare-fun m!155169 () Bool)

(assert (=> b!131698 m!155169))

(declare-fun m!155171 () Bool)

(assert (=> b!131699 m!155171))

(assert (=> b!131525 d!40029))

(declare-fun d!40031 () Bool)

(declare-fun e!85908 () Bool)

(assert (=> d!40031 e!85908))

(declare-fun res!63468 () Bool)

(assert (=> d!40031 (=> res!63468 e!85908)))

(declare-fun lt!68616 () Bool)

(assert (=> d!40031 (= res!63468 (not lt!68616))))

(declare-fun lt!68615 () Bool)

(assert (=> d!40031 (= lt!68616 lt!68615)))

(declare-fun lt!68614 () Unit!4116)

(declare-fun e!85907 () Unit!4116)

(assert (=> d!40031 (= lt!68614 e!85907)))

(declare-fun c!24305 () Bool)

(assert (=> d!40031 (= c!24305 lt!68615)))

(declare-fun containsKey!175 (List!1714 (_ BitVec 64)) Bool)

(assert (=> d!40031 (= lt!68615 (containsKey!175 (toList!867 lt!68520) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> d!40031 (= (contains!895 lt!68520 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) lt!68616)))

(declare-fun b!131706 () Bool)

(declare-fun lt!68617 () Unit!4116)

(assert (=> b!131706 (= e!85907 lt!68617)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!123 (List!1714 (_ BitVec 64)) Unit!4116)

(assert (=> b!131706 (= lt!68617 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!867 lt!68520) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-datatypes ((Option!177 0))(
  ( (Some!176 (v!3191 V!3475)) (None!175) )
))
(declare-fun isDefined!124 (Option!177) Bool)

(declare-fun getValueByKey!171 (List!1714 (_ BitVec 64)) Option!177)

(assert (=> b!131706 (isDefined!124 (getValueByKey!171 (toList!867 lt!68520) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun b!131707 () Bool)

(declare-fun Unit!4119 () Unit!4116)

(assert (=> b!131707 (= e!85907 Unit!4119)))

(declare-fun b!131708 () Bool)

(assert (=> b!131708 (= e!85908 (isDefined!124 (getValueByKey!171 (toList!867 lt!68520) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355))))))

(assert (= (and d!40031 c!24305) b!131706))

(assert (= (and d!40031 (not c!24305)) b!131707))

(assert (= (and d!40031 (not res!63468)) b!131708))

(assert (=> d!40031 m!155029))

(declare-fun m!155173 () Bool)

(assert (=> d!40031 m!155173))

(assert (=> b!131706 m!155029))

(declare-fun m!155175 () Bool)

(assert (=> b!131706 m!155175))

(assert (=> b!131706 m!155029))

(declare-fun m!155177 () Bool)

(assert (=> b!131706 m!155177))

(assert (=> b!131706 m!155177))

(declare-fun m!155179 () Bool)

(assert (=> b!131706 m!155179))

(assert (=> b!131708 m!155029))

(assert (=> b!131708 m!155177))

(assert (=> b!131708 m!155177))

(assert (=> b!131708 m!155179))

(assert (=> b!131535 d!40031))

(declare-fun b!131793 () Bool)

(declare-fun e!85963 () Bool)

(declare-fun lt!68690 () SeekEntryResult!274)

(assert (=> b!131793 (= e!85963 ((_ is Undefined!274) lt!68690))))

(declare-fun bm!14450 () Bool)

(declare-fun call!14466 () ListLongMap!1703)

(declare-fun lt!68694 () tuple2!2620)

(assert (=> bm!14450 (= call!14466 (map!1405 (_2!1321 lt!68694)))))

(declare-fun b!131794 () Bool)

(declare-fun e!85970 () tuple2!2620)

(declare-fun lt!68680 () tuple2!2620)

(assert (=> b!131794 (= e!85970 (tuple2!2621 (_1!1321 lt!68680) (_2!1321 lt!68680)))))

(declare-fun call!14457 () tuple2!2620)

(assert (=> b!131794 (= lt!68680 call!14457)))

(declare-fun bm!14451 () Bool)

(declare-fun call!14476 () Unit!4116)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!60 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 (_ BitVec 64) Int) Unit!4116)

(assert (=> bm!14451 (= call!14476 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!60 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2854 newMap!16)))))

(declare-fun bm!14452 () Bool)

(declare-fun call!14453 () Bool)

(declare-fun call!14464 () Bool)

(assert (=> bm!14452 (= call!14453 call!14464)))

(declare-fun b!131796 () Bool)

(declare-fun c!24343 () Bool)

(declare-fun lt!68678 () SeekEntryResult!274)

(assert (=> b!131796 (= c!24343 ((_ is MissingVacant!274) lt!68678))))

(declare-fun e!85965 () tuple2!2620)

(assert (=> b!131796 (= e!85965 e!85970)))

(declare-fun b!131797 () Bool)

(declare-fun lt!68692 () Unit!4116)

(declare-fun lt!68688 () Unit!4116)

(assert (=> b!131797 (= lt!68692 lt!68688)))

(declare-fun call!14458 () ListLongMap!1703)

(assert (=> b!131797 (contains!895 call!14458 (select (arr!2255 (_keys!4601 newMap!16)) (index!3256 lt!68678)))))

(declare-fun lt!68696 () array!4769)

(declare-fun lemmaValidKeyInArrayIsInListMap!121 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 (_ BitVec 32) Int) Unit!4116)

(assert (=> b!131797 (= lt!68688 (lemmaValidKeyInArrayIsInListMap!121 (_keys!4601 newMap!16) lt!68696 (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (index!3256 lt!68678) (defaultEntry!2854 newMap!16)))))

(assert (=> b!131797 (= lt!68696 (array!4770 (store (arr!2256 (_values!2837 newMap!16)) (index!3256 lt!68678) (ValueCellFull!1092 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2524 (_values!2837 newMap!16))))))

(declare-fun lt!68675 () Unit!4116)

(declare-fun lt!68672 () Unit!4116)

(assert (=> b!131797 (= lt!68675 lt!68672)))

(declare-fun call!14472 () ListLongMap!1703)

(declare-fun call!14468 () ListLongMap!1703)

(assert (=> b!131797 (= call!14472 call!14468)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!60 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 (_ BitVec 32) (_ BitVec 64) V!3475 Int) Unit!4116)

(assert (=> b!131797 (= lt!68672 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!60 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (index!3256 lt!68678) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68685 () Unit!4116)

(declare-fun e!85956 () Unit!4116)

(assert (=> b!131797 (= lt!68685 e!85956)))

(declare-fun c!24338 () Bool)

(declare-fun call!14459 () Bool)

(assert (=> b!131797 (= c!24338 call!14459)))

(declare-fun e!85969 () tuple2!2620)

(assert (=> b!131797 (= e!85969 (tuple2!2621 true (LongMapFixedSize!1093 (defaultEntry!2854 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (_size!595 newMap!16) (_keys!4601 newMap!16) (array!4770 (store (arr!2256 (_values!2837 newMap!16)) (index!3256 lt!68678) (ValueCellFull!1092 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2524 (_values!2837 newMap!16))) (_vacant!595 newMap!16))))))

(declare-fun call!14460 () SeekEntryResult!274)

(declare-fun bm!14453 () Bool)

(assert (=> bm!14453 (= call!14460 (seekEntryOrOpen!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4601 newMap!16) (mask!7148 newMap!16)))))

(declare-fun b!131798 () Bool)

(declare-fun res!63503 () Bool)

(declare-fun call!14465 () Bool)

(assert (=> b!131798 (= res!63503 call!14465)))

(declare-fun e!85958 () Bool)

(assert (=> b!131798 (=> (not res!63503) (not e!85958))))

(declare-fun b!131799 () Bool)

(declare-fun lt!68676 () Unit!4116)

(declare-fun lt!68684 () Unit!4116)

(assert (=> b!131799 (= lt!68676 lt!68684)))

(declare-fun call!14470 () ListLongMap!1703)

(declare-fun call!14455 () ListLongMap!1703)

(assert (=> b!131799 (= call!14470 call!14455)))

(declare-fun lt!68689 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!60 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 V!3475 Int) Unit!4116)

(assert (=> b!131799 (= lt!68684 (lemmaChangeZeroKeyThenAddPairToListMap!60 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) lt!68689 (zeroValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2710 newMap!16) (defaultEntry!2854 newMap!16)))))

(assert (=> b!131799 (= lt!68689 (bvor (extraKeys!2621 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!85974 () tuple2!2620)

(assert (=> b!131799 (= e!85974 (tuple2!2621 true (LongMapFixedSize!1093 (defaultEntry!2854 newMap!16) (mask!7148 newMap!16) (bvor (extraKeys!2621 newMap!16) #b00000000000000000000000000000001) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2710 newMap!16) (_size!595 newMap!16) (_keys!4601 newMap!16) (_values!2837 newMap!16) (_vacant!595 newMap!16))))))

(declare-fun bm!14454 () Bool)

(declare-fun c!24344 () Bool)

(assert (=> bm!14454 (= call!14468 (getCurrentListMap!544 (_keys!4601 newMap!16) (ite c!24344 (_values!2837 newMap!16) (array!4770 (store (arr!2256 (_values!2837 newMap!16)) (index!3256 lt!68678) (ValueCellFull!1092 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2524 (_values!2837 newMap!16)))) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun bm!14455 () Bool)

(declare-fun call!14461 () Bool)

(declare-fun call!14454 () Bool)

(assert (=> bm!14455 (= call!14461 call!14454)))

(declare-fun b!131800 () Bool)

(declare-fun e!85960 () Unit!4116)

(declare-fun lt!68698 () Unit!4116)

(assert (=> b!131800 (= e!85960 lt!68698)))

(assert (=> b!131800 (= lt!68698 call!14476)))

(declare-fun call!14462 () SeekEntryResult!274)

(assert (=> b!131800 (= lt!68690 call!14462)))

(declare-fun c!24339 () Bool)

(assert (=> b!131800 (= c!24339 ((_ is MissingZero!274) lt!68690))))

(declare-fun e!85955 () Bool)

(assert (=> b!131800 e!85955))

(declare-fun b!131801 () Bool)

(declare-fun e!85959 () Bool)

(declare-fun call!14469 () ListLongMap!1703)

(assert (=> b!131801 (= e!85959 (= call!14466 call!14469))))

(declare-fun bm!14456 () Bool)

(declare-fun c!24340 () Bool)

(declare-fun c!24334 () Bool)

(assert (=> bm!14456 (= c!24340 c!24334)))

(declare-fun e!85967 () ListLongMap!1703)

(assert (=> bm!14456 (= call!14459 (contains!895 e!85967 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun b!131802 () Bool)

(declare-fun Unit!4120 () Unit!4116)

(assert (=> b!131802 (= e!85960 Unit!4120)))

(declare-fun lt!68682 () Unit!4116)

(declare-fun call!14463 () Unit!4116)

(assert (=> b!131802 (= lt!68682 call!14463)))

(declare-fun lt!68697 () SeekEntryResult!274)

(assert (=> b!131802 (= lt!68697 call!14462)))

(declare-fun res!63507 () Bool)

(assert (=> b!131802 (= res!63507 ((_ is Found!274) lt!68697))))

(declare-fun e!85954 () Bool)

(assert (=> b!131802 (=> (not res!63507) (not e!85954))))

(assert (=> b!131802 e!85954))

(declare-fun lt!68693 () Unit!4116)

(assert (=> b!131802 (= lt!68693 lt!68682)))

(assert (=> b!131802 false))

(declare-fun b!131803 () Bool)

(declare-fun res!63505 () Bool)

(assert (=> b!131803 (= res!63505 (= (select (arr!2255 (_keys!4601 newMap!16)) (index!3258 lt!68690)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!85961 () Bool)

(assert (=> b!131803 (=> (not res!63505) (not e!85961))))

(declare-fun b!131804 () Bool)

(assert (=> b!131804 (= e!85970 e!85969)))

(declare-fun c!24336 () Bool)

(assert (=> b!131804 (= c!24336 ((_ is MissingZero!274) lt!68678))))

(declare-fun bm!14457 () Bool)

(declare-fun call!14474 () ListLongMap!1703)

(assert (=> bm!14457 (= call!14455 call!14474)))

(declare-fun b!131805 () Bool)

(assert (=> b!131805 (= e!85967 (getCurrentListMap!544 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun bm!14458 () Bool)

(assert (=> bm!14458 (= call!14465 call!14464)))

(declare-fun lt!68691 () (_ BitVec 32))

(declare-fun bm!14459 () Bool)

(declare-fun c!24346 () Bool)

(assert (=> bm!14459 (= call!14474 (getCurrentListMap!544 (_keys!4601 newMap!16) (ite (or c!24344 c!24334) (_values!2837 newMap!16) lt!68696) (mask!7148 newMap!16) (ite c!24344 (ite c!24346 lt!68689 lt!68691) (extraKeys!2621 newMap!16)) (ite (and c!24344 c!24346) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2710 newMap!16)) (ite c!24344 (ite c!24346 (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2710 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun b!131806 () Bool)

(assert (=> b!131806 (= e!85961 (not call!14461))))

(declare-fun bm!14460 () Bool)

(assert (=> bm!14460 (= call!14470 call!14472)))

(declare-fun b!131807 () Bool)

(declare-fun e!85953 () tuple2!2620)

(assert (=> b!131807 (= e!85953 e!85974)))

(assert (=> b!131807 (= c!24346 (= (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131808 () Bool)

(assert (=> b!131808 (= e!85954 (= (select (arr!2255 (_keys!4601 newMap!16)) (index!3256 lt!68697)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun bm!14461 () Bool)

(assert (=> bm!14461 (= call!14462 call!14460)))

(declare-fun b!131809 () Bool)

(declare-fun e!85968 () Bool)

(assert (=> b!131809 (= e!85959 e!85968)))

(declare-fun res!63501 () Bool)

(assert (=> b!131809 (= res!63501 (contains!895 call!14466 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> b!131809 (=> (not res!63501) (not e!85968))))

(declare-fun bm!14462 () Bool)

(declare-fun updateHelperNewKey!60 (LongMapFixedSize!1092 (_ BitVec 64) V!3475 (_ BitVec 32)) tuple2!2620)

(assert (=> bm!14462 (= call!14457 (updateHelperNewKey!60 newMap!16 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678))))))

(declare-fun lt!68677 () SeekEntryResult!274)

(declare-fun b!131810 () Bool)

(assert (=> b!131810 (= e!85958 (= (select (arr!2255 (_keys!4601 newMap!16)) (index!3256 lt!68677)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun bm!14463 () Bool)

(declare-fun c!24342 () Bool)

(declare-fun c!24347 () Bool)

(declare-fun lt!68686 () SeekEntryResult!274)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!14463 (= call!14464 (inRange!0 (ite c!24334 (ite c!24347 (index!3256 lt!68697) (ite c!24339 (index!3255 lt!68690) (index!3258 lt!68690))) (ite c!24338 (index!3256 lt!68677) (ite c!24342 (index!3255 lt!68686) (index!3258 lt!68686)))) (mask!7148 newMap!16)))))

(declare-fun b!131811 () Bool)

(declare-fun e!85972 () ListLongMap!1703)

(assert (=> b!131811 (= e!85972 (getCurrentListMap!544 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun b!131812 () Bool)

(declare-fun res!63500 () Bool)

(assert (=> b!131812 (= res!63500 (= (select (arr!2255 (_keys!4601 newMap!16)) (index!3258 lt!68686)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!85957 () Bool)

(assert (=> b!131812 (=> (not res!63500) (not e!85957))))

(declare-fun bm!14464 () Bool)

(assert (=> bm!14464 (= call!14469 (map!1405 newMap!16))))

(declare-fun b!131813 () Bool)

(declare-fun lt!68679 () Unit!4116)

(declare-fun lt!68687 () Unit!4116)

(assert (=> b!131813 (= lt!68679 lt!68687)))

(assert (=> b!131813 (= call!14470 call!14455)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!60 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 V!3475 Int) Unit!4116)

(assert (=> b!131813 (= lt!68687 (lemmaChangeLongMinValueKeyThenAddPairToListMap!60 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) lt!68691 (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2854 newMap!16)))))

(assert (=> b!131813 (= lt!68691 (bvor (extraKeys!2621 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!131813 (= e!85974 (tuple2!2621 true (LongMapFixedSize!1093 (defaultEntry!2854 newMap!16) (mask!7148 newMap!16) (bvor (extraKeys!2621 newMap!16) #b00000000000000000000000000000010) (zeroValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!595 newMap!16) (_keys!4601 newMap!16) (_values!2837 newMap!16) (_vacant!595 newMap!16))))))

(declare-fun bm!14465 () Bool)

(declare-fun call!14473 () Bool)

(assert (=> bm!14465 (= call!14473 call!14453)))

(declare-fun b!131814 () Bool)

(declare-fun res!63502 () Bool)

(declare-fun e!85964 () Bool)

(assert (=> b!131814 (=> (not res!63502) (not e!85964))))

(assert (=> b!131814 (= res!63502 (= (select (arr!2255 (_keys!4601 newMap!16)) (index!3255 lt!68686)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131815 () Bool)

(assert (=> b!131815 (= e!85968 (= call!14466 (+!174 call!14469 (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!131816 () Bool)

(declare-fun e!85962 () Bool)

(assert (=> b!131816 (= e!85962 e!85959)))

(declare-fun c!24345 () Bool)

(assert (=> b!131816 (= c!24345 (_1!1321 lt!68694))))

(declare-fun b!131817 () Bool)

(declare-fun lt!68681 () tuple2!2620)

(assert (=> b!131817 (= lt!68681 call!14457)))

(assert (=> b!131817 (= e!85969 (tuple2!2621 (_1!1321 lt!68681) (_2!1321 lt!68681)))))

(declare-fun b!131818 () Bool)

(assert (=> b!131818 (= e!85953 e!85965)))

(assert (=> b!131818 (= lt!68678 (seekEntryOrOpen!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4601 newMap!16) (mask!7148 newMap!16)))))

(assert (=> b!131818 (= c!24334 ((_ is Undefined!274) lt!68678))))

(declare-fun b!131819 () Bool)

(assert (=> b!131819 (= e!85967 call!14458)))

(declare-fun b!131820 () Bool)

(declare-fun lt!68695 () Unit!4116)

(assert (=> b!131820 (= e!85956 lt!68695)))

(assert (=> b!131820 (= lt!68695 call!14463)))

(declare-fun call!14456 () SeekEntryResult!274)

(assert (=> b!131820 (= lt!68677 call!14456)))

(declare-fun res!63508 () Bool)

(assert (=> b!131820 (= res!63508 ((_ is Found!274) lt!68677))))

(assert (=> b!131820 (=> (not res!63508) (not e!85958))))

(assert (=> b!131820 e!85958))

(declare-fun b!131821 () Bool)

(declare-fun res!63510 () Bool)

(assert (=> b!131821 (=> (not res!63510) (not e!85964))))

(declare-fun call!14475 () Bool)

(assert (=> b!131821 (= res!63510 call!14475)))

(declare-fun e!85973 () Bool)

(assert (=> b!131821 (= e!85973 e!85964)))

(declare-fun b!131822 () Bool)

(declare-fun res!63499 () Bool)

(declare-fun e!85966 () Bool)

(assert (=> b!131822 (=> (not res!63499) (not e!85966))))

(assert (=> b!131822 (= res!63499 (= (select (arr!2255 (_keys!4601 newMap!16)) (index!3255 lt!68690)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14466 () Bool)

(declare-fun call!14467 () ListLongMap!1703)

(assert (=> bm!14466 (= call!14467 call!14468)))

(declare-fun b!131823 () Bool)

(declare-fun lt!68673 () Unit!4116)

(assert (=> b!131823 (= lt!68673 e!85960)))

(assert (=> b!131823 (= c!24347 call!14459)))

(assert (=> b!131823 (= e!85965 (tuple2!2621 false newMap!16))))

(declare-fun bm!14467 () Bool)

(assert (=> bm!14467 (= call!14472 (+!174 e!85972 (ite c!24344 (ite c!24346 (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!24335 () Bool)

(assert (=> bm!14467 (= c!24335 c!24344)))

(declare-fun b!131824 () Bool)

(declare-fun call!14471 () Bool)

(assert (=> b!131824 (= e!85964 (not call!14471))))

(declare-fun b!131795 () Bool)

(assert (=> b!131795 (= e!85966 (not call!14461))))

(declare-fun d!40033 () Bool)

(assert (=> d!40033 e!85962))

(declare-fun res!63497 () Bool)

(assert (=> d!40033 (=> (not res!63497) (not e!85962))))

(assert (=> d!40033 (= res!63497 (valid!520 (_2!1321 lt!68694)))))

(assert (=> d!40033 (= lt!68694 e!85953)))

(assert (=> d!40033 (= c!24344 (= (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (bvneg (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355))))))

(assert (=> d!40033 (valid!520 newMap!16)))

(assert (=> d!40033 (= (update!192 newMap!16 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!68694)))

(declare-fun bm!14468 () Bool)

(assert (=> bm!14468 (= call!14454 (arrayContainsKey!0 (_keys!4601 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!131825 () Bool)

(declare-fun e!85971 () Bool)

(assert (=> b!131825 (= e!85971 e!85957)))

(declare-fun res!63506 () Bool)

(assert (=> b!131825 (= res!63506 call!14475)))

(assert (=> b!131825 (=> (not res!63506) (not e!85957))))

(declare-fun b!131826 () Bool)

(declare-fun c!24341 () Bool)

(assert (=> b!131826 (= c!24341 ((_ is MissingVacant!274) lt!68686))))

(assert (=> b!131826 (= e!85973 e!85971)))

(declare-fun b!131827 () Bool)

(declare-fun Unit!4121 () Unit!4116)

(assert (=> b!131827 (= e!85956 Unit!4121)))

(declare-fun lt!68674 () Unit!4116)

(assert (=> b!131827 (= lt!68674 call!14476)))

(assert (=> b!131827 (= lt!68686 call!14456)))

(assert (=> b!131827 (= c!24342 ((_ is MissingZero!274) lt!68686))))

(assert (=> b!131827 e!85973))

(declare-fun lt!68683 () Unit!4116)

(assert (=> b!131827 (= lt!68683 lt!68674)))

(assert (=> b!131827 false))

(declare-fun bm!14469 () Bool)

(assert (=> bm!14469 (= call!14458 call!14474)))

(declare-fun b!131828 () Bool)

(assert (=> b!131828 (= e!85963 e!85961)))

(declare-fun res!63498 () Bool)

(assert (=> b!131828 (= res!63498 call!14473)))

(assert (=> b!131828 (=> (not res!63498) (not e!85961))))

(declare-fun b!131829 () Bool)

(assert (=> b!131829 (= e!85972 call!14467)))

(declare-fun bm!14470 () Bool)

(assert (=> bm!14470 (= call!14456 call!14460)))

(declare-fun b!131830 () Bool)

(assert (=> b!131830 (= e!85971 ((_ is Undefined!274) lt!68686))))

(declare-fun b!131831 () Bool)

(declare-fun res!63509 () Bool)

(assert (=> b!131831 (=> (not res!63509) (not e!85966))))

(assert (=> b!131831 (= res!63509 call!14473)))

(assert (=> b!131831 (= e!85955 e!85966)))

(declare-fun bm!14471 () Bool)

(assert (=> bm!14471 (= call!14471 call!14454)))

(declare-fun b!131832 () Bool)

(assert (=> b!131832 (= e!85957 (not call!14471))))

(declare-fun b!131833 () Bool)

(declare-fun c!24337 () Bool)

(assert (=> b!131833 (= c!24337 ((_ is MissingVacant!274) lt!68690))))

(assert (=> b!131833 (= e!85955 e!85963)))

(declare-fun bm!14472 () Bool)

(assert (=> bm!14472 (= call!14475 call!14465)))

(declare-fun b!131834 () Bool)

(declare-fun res!63504 () Bool)

(assert (=> b!131834 (= res!63504 call!14453)))

(assert (=> b!131834 (=> (not res!63504) (not e!85954))))

(declare-fun bm!14473 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!60 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 (_ BitVec 64) Int) Unit!4116)

(assert (=> bm!14473 (= call!14463 (lemmaInListMapThenSeekEntryOrOpenFindsIt!60 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2854 newMap!16)))))

(assert (= (and d!40033 c!24344) b!131807))

(assert (= (and d!40033 (not c!24344)) b!131818))

(assert (= (and b!131807 c!24346) b!131799))

(assert (= (and b!131807 (not c!24346)) b!131813))

(assert (= (or b!131799 b!131813) bm!14466))

(assert (= (or b!131799 b!131813) bm!14457))

(assert (= (or b!131799 b!131813) bm!14460))

(assert (= (and b!131818 c!24334) b!131823))

(assert (= (and b!131818 (not c!24334)) b!131796))

(assert (= (and b!131823 c!24347) b!131802))

(assert (= (and b!131823 (not c!24347)) b!131800))

(assert (= (and b!131802 res!63507) b!131834))

(assert (= (and b!131834 res!63504) b!131808))

(assert (= (and b!131800 c!24339) b!131831))

(assert (= (and b!131800 (not c!24339)) b!131833))

(assert (= (and b!131831 res!63509) b!131822))

(assert (= (and b!131822 res!63499) b!131795))

(assert (= (and b!131833 c!24337) b!131828))

(assert (= (and b!131833 (not c!24337)) b!131793))

(assert (= (and b!131828 res!63498) b!131803))

(assert (= (and b!131803 res!63505) b!131806))

(assert (= (or b!131831 b!131828) bm!14465))

(assert (= (or b!131795 b!131806) bm!14455))

(assert (= (or b!131834 bm!14465) bm!14452))

(assert (= (or b!131802 b!131800) bm!14461))

(assert (= (and b!131796 c!24343) b!131794))

(assert (= (and b!131796 (not c!24343)) b!131804))

(assert (= (and b!131804 c!24336) b!131817))

(assert (= (and b!131804 (not c!24336)) b!131797))

(assert (= (and b!131797 c!24338) b!131820))

(assert (= (and b!131797 (not c!24338)) b!131827))

(assert (= (and b!131820 res!63508) b!131798))

(assert (= (and b!131798 res!63503) b!131810))

(assert (= (and b!131827 c!24342) b!131821))

(assert (= (and b!131827 (not c!24342)) b!131826))

(assert (= (and b!131821 res!63510) b!131814))

(assert (= (and b!131814 res!63502) b!131824))

(assert (= (and b!131826 c!24341) b!131825))

(assert (= (and b!131826 (not c!24341)) b!131830))

(assert (= (and b!131825 res!63506) b!131812))

(assert (= (and b!131812 res!63500) b!131832))

(assert (= (or b!131821 b!131825) bm!14472))

(assert (= (or b!131824 b!131832) bm!14471))

(assert (= (or b!131798 bm!14472) bm!14458))

(assert (= (or b!131820 b!131827) bm!14470))

(assert (= (or b!131794 b!131817) bm!14462))

(assert (= (or b!131802 b!131820) bm!14473))

(assert (= (or bm!14461 bm!14470) bm!14453))

(assert (= (or bm!14452 bm!14458) bm!14463))

(assert (= (or b!131800 b!131827) bm!14451))

(assert (= (or bm!14455 bm!14471) bm!14468))

(assert (= (or b!131823 b!131797) bm!14469))

(assert (= (or b!131823 b!131797) bm!14456))

(assert (= (and bm!14456 c!24340) b!131819))

(assert (= (and bm!14456 (not c!24340)) b!131805))

(assert (= (or bm!14457 bm!14469) bm!14459))

(assert (= (or bm!14466 b!131797) bm!14454))

(assert (= (or bm!14460 b!131797) bm!14467))

(assert (= (and bm!14467 c!24335) b!131829))

(assert (= (and bm!14467 (not c!24335)) b!131811))

(assert (= (and d!40033 res!63497) b!131816))

(assert (= (and b!131816 c!24345) b!131809))

(assert (= (and b!131816 (not c!24345)) b!131801))

(assert (= (and b!131809 res!63501) b!131815))

(assert (= (or b!131815 b!131801) bm!14464))

(assert (= (or b!131809 b!131815 b!131801) bm!14450))

(declare-fun m!155181 () Bool)

(assert (=> bm!14450 m!155181))

(declare-fun m!155183 () Bool)

(assert (=> b!131822 m!155183))

(declare-fun m!155185 () Bool)

(assert (=> d!40033 m!155185))

(assert (=> d!40033 m!155017))

(assert (=> bm!14473 m!155029))

(declare-fun m!155187 () Bool)

(assert (=> bm!14473 m!155187))

(assert (=> bm!14462 m!155029))

(assert (=> bm!14462 m!155027))

(declare-fun m!155189 () Bool)

(assert (=> bm!14462 m!155189))

(declare-fun m!155191 () Bool)

(assert (=> bm!14454 m!155191))

(declare-fun m!155193 () Bool)

(assert (=> bm!14454 m!155193))

(declare-fun m!155195 () Bool)

(assert (=> b!131814 m!155195))

(assert (=> b!131797 m!155191))

(declare-fun m!155197 () Bool)

(assert (=> b!131797 m!155197))

(declare-fun m!155199 () Bool)

(assert (=> b!131797 m!155199))

(assert (=> b!131797 m!155029))

(assert (=> b!131797 m!155027))

(declare-fun m!155201 () Bool)

(assert (=> b!131797 m!155201))

(assert (=> b!131797 m!155197))

(declare-fun m!155203 () Bool)

(assert (=> b!131797 m!155203))

(assert (=> bm!14451 m!155029))

(declare-fun m!155205 () Bool)

(assert (=> bm!14451 m!155205))

(declare-fun m!155207 () Bool)

(assert (=> b!131810 m!155207))

(assert (=> b!131805 m!155099))

(assert (=> b!131818 m!155029))

(declare-fun m!155209 () Bool)

(assert (=> b!131818 m!155209))

(declare-fun m!155211 () Bool)

(assert (=> b!131808 m!155211))

(declare-fun m!155213 () Bool)

(assert (=> b!131812 m!155213))

(declare-fun m!155215 () Bool)

(assert (=> b!131815 m!155215))

(assert (=> bm!14456 m!155029))

(declare-fun m!155217 () Bool)

(assert (=> bm!14456 m!155217))

(assert (=> b!131809 m!155029))

(declare-fun m!155219 () Bool)

(assert (=> b!131809 m!155219))

(assert (=> b!131811 m!155099))

(assert (=> bm!14453 m!155029))

(assert (=> bm!14453 m!155209))

(declare-fun m!155221 () Bool)

(assert (=> bm!14459 m!155221))

(assert (=> b!131813 m!155027))

(declare-fun m!155223 () Bool)

(assert (=> b!131813 m!155223))

(assert (=> bm!14468 m!155029))

(declare-fun m!155225 () Bool)

(assert (=> bm!14468 m!155225))

(declare-fun m!155227 () Bool)

(assert (=> bm!14463 m!155227))

(assert (=> b!131799 m!155027))

(declare-fun m!155229 () Bool)

(assert (=> b!131799 m!155229))

(assert (=> bm!14464 m!155037))

(declare-fun m!155231 () Bool)

(assert (=> b!131803 m!155231))

(declare-fun m!155233 () Bool)

(assert (=> bm!14467 m!155233))

(assert (=> b!131535 d!40033))

(declare-fun d!40035 () Bool)

(declare-fun c!24350 () Bool)

(assert (=> d!40035 (= c!24350 ((_ is ValueCellFull!1092) (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun e!85977 () V!3475)

(assert (=> d!40035 (= (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!85977)))

(declare-fun b!131839 () Bool)

(declare-fun get!1477 (ValueCell!1092 V!3475) V!3475)

(assert (=> b!131839 (= e!85977 (get!1477 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!131840 () Bool)

(declare-fun get!1478 (ValueCell!1092 V!3475) V!3475)

(assert (=> b!131840 (= e!85977 (get!1478 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40035 c!24350) b!131839))

(assert (= (and d!40035 (not c!24350)) b!131840))

(assert (=> b!131839 m!155023))

(assert (=> b!131839 m!155025))

(declare-fun m!155235 () Bool)

(assert (=> b!131839 m!155235))

(assert (=> b!131840 m!155023))

(assert (=> b!131840 m!155025))

(declare-fun m!155237 () Bool)

(assert (=> b!131840 m!155237))

(assert (=> b!131535 d!40035))

(declare-fun d!40037 () Bool)

(assert (=> d!40037 (= (valid!519 thiss!992) (valid!520 (v!3187 (underlying!452 thiss!992))))))

(declare-fun bs!5455 () Bool)

(assert (= bs!5455 d!40037))

(declare-fun m!155239 () Bool)

(assert (=> bs!5455 m!155239))

(assert (=> start!14178 d!40037))

(declare-fun b!131848 () Bool)

(declare-fun e!85983 () Bool)

(assert (=> b!131848 (= e!85983 tp_is_empty!2871)))

(declare-fun mapNonEmpty!4629 () Bool)

(declare-fun mapRes!4629 () Bool)

(declare-fun tp!11181 () Bool)

(declare-fun e!85982 () Bool)

(assert (=> mapNonEmpty!4629 (= mapRes!4629 (and tp!11181 e!85982))))

(declare-fun mapKey!4629 () (_ BitVec 32))

(declare-fun mapRest!4629 () (Array (_ BitVec 32) ValueCell!1092))

(declare-fun mapValue!4629 () ValueCell!1092)

(assert (=> mapNonEmpty!4629 (= mapRest!4620 (store mapRest!4629 mapKey!4629 mapValue!4629))))

(declare-fun b!131847 () Bool)

(assert (=> b!131847 (= e!85982 tp_is_empty!2871)))

(declare-fun mapIsEmpty!4629 () Bool)

(assert (=> mapIsEmpty!4629 mapRes!4629))

(declare-fun condMapEmpty!4629 () Bool)

(declare-fun mapDefault!4629 () ValueCell!1092)

(assert (=> mapNonEmpty!4620 (= condMapEmpty!4629 (= mapRest!4620 ((as const (Array (_ BitVec 32) ValueCell!1092)) mapDefault!4629)))))

(assert (=> mapNonEmpty!4620 (= tp!11163 (and e!85983 mapRes!4629))))

(assert (= (and mapNonEmpty!4620 condMapEmpty!4629) mapIsEmpty!4629))

(assert (= (and mapNonEmpty!4620 (not condMapEmpty!4629)) mapNonEmpty!4629))

(assert (= (and mapNonEmpty!4629 ((_ is ValueCellFull!1092) mapValue!4629)) b!131847))

(assert (= (and mapNonEmpty!4620 ((_ is ValueCellFull!1092) mapDefault!4629)) b!131848))

(declare-fun m!155241 () Bool)

(assert (=> mapNonEmpty!4629 m!155241))

(declare-fun b!131850 () Bool)

(declare-fun e!85985 () Bool)

(assert (=> b!131850 (= e!85985 tp_is_empty!2871)))

(declare-fun mapNonEmpty!4630 () Bool)

(declare-fun mapRes!4630 () Bool)

(declare-fun tp!11182 () Bool)

(declare-fun e!85984 () Bool)

(assert (=> mapNonEmpty!4630 (= mapRes!4630 (and tp!11182 e!85984))))

(declare-fun mapKey!4630 () (_ BitVec 32))

(declare-fun mapRest!4630 () (Array (_ BitVec 32) ValueCell!1092))

(declare-fun mapValue!4630 () ValueCell!1092)

(assert (=> mapNonEmpty!4630 (= mapRest!4619 (store mapRest!4630 mapKey!4630 mapValue!4630))))

(declare-fun b!131849 () Bool)

(assert (=> b!131849 (= e!85984 tp_is_empty!2871)))

(declare-fun mapIsEmpty!4630 () Bool)

(assert (=> mapIsEmpty!4630 mapRes!4630))

(declare-fun condMapEmpty!4630 () Bool)

(declare-fun mapDefault!4630 () ValueCell!1092)

(assert (=> mapNonEmpty!4619 (= condMapEmpty!4630 (= mapRest!4619 ((as const (Array (_ BitVec 32) ValueCell!1092)) mapDefault!4630)))))

(assert (=> mapNonEmpty!4619 (= tp!11165 (and e!85985 mapRes!4630))))

(assert (= (and mapNonEmpty!4619 condMapEmpty!4630) mapIsEmpty!4630))

(assert (= (and mapNonEmpty!4619 (not condMapEmpty!4630)) mapNonEmpty!4630))

(assert (= (and mapNonEmpty!4630 ((_ is ValueCellFull!1092) mapValue!4630)) b!131849))

(assert (= (and mapNonEmpty!4619 ((_ is ValueCellFull!1092) mapDefault!4630)) b!131850))

(declare-fun m!155243 () Bool)

(assert (=> mapNonEmpty!4630 m!155243))

(declare-fun b_lambda!5865 () Bool)

(assert (= b_lambda!5863 (or (and b!131538 b_free!2909) (and b!131534 b_free!2911 (= (defaultEntry!2854 newMap!16) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))))) b_lambda!5865)))

(check-sat (not b!131613) (not bm!14451) (not bm!14450) (not bm!14398) (not b!131678) (not b!131706) (not b!131672) (not bm!14463) (not bm!14393) (not b!131676) (not b_next!2911) (not b!131811) (not b!131699) (not bm!14456) (not b!131698) (not d!40037) (not bm!14453) (not d!40017) (not b!131840) (not b!131611) (not bm!14468) (not d!40029) (not mapNonEmpty!4629) (not b!131708) (not bm!14397) (not b!131660) (not bm!14473) tp_is_empty!2871 (not mapNonEmpty!4630) (not b!131818) (not b!131797) (not bm!14464) (not b!131815) (not bm!14401) (not b!131697) (not b_lambda!5865) (not b!131670) (not d!40033) b_and!8165 (not b!131805) (not b!131809) (not b_lambda!5861) (not b!131799) (not b!131615) (not bm!14462) (not bm!14459) (not d!40015) (not b!131813) (not b!131658) (not bm!14394) (not bm!14454) (not b!131839) (not b_next!2909) (not b!131673) (not b!131687) (not b!131690) b_and!8163 (not b!131667) (not bm!14467) (not d!40031) (not bm!14377))
(check-sat b_and!8163 b_and!8165 (not b_next!2909) (not b_next!2911))
(get-model)

(declare-fun d!40039 () Bool)

(declare-fun e!85988 () Bool)

(assert (=> d!40039 e!85988))

(declare-fun res!63516 () Bool)

(assert (=> d!40039 (=> (not res!63516) (not e!85988))))

(declare-fun lt!68704 () SeekEntryResult!274)

(assert (=> d!40039 (= res!63516 ((_ is Found!274) lt!68704))))

(assert (=> d!40039 (= lt!68704 (seekEntryOrOpen!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4601 newMap!16) (mask!7148 newMap!16)))))

(declare-fun lt!68703 () Unit!4116)

(declare-fun choose!808 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 (_ BitVec 64) Int) Unit!4116)

(assert (=> d!40039 (= lt!68703 (choose!808 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2854 newMap!16)))))

(assert (=> d!40039 (validMask!0 (mask!7148 newMap!16))))

(assert (=> d!40039 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!60 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2854 newMap!16)) lt!68703)))

(declare-fun b!131855 () Bool)

(declare-fun res!63515 () Bool)

(assert (=> b!131855 (=> (not res!63515) (not e!85988))))

(assert (=> b!131855 (= res!63515 (inRange!0 (index!3256 lt!68704) (mask!7148 newMap!16)))))

(declare-fun b!131856 () Bool)

(assert (=> b!131856 (= e!85988 (= (select (arr!2255 (_keys!4601 newMap!16)) (index!3256 lt!68704)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> b!131856 (and (bvsge (index!3256 lt!68704) #b00000000000000000000000000000000) (bvslt (index!3256 lt!68704) (size!2523 (_keys!4601 newMap!16))))))

(assert (= (and d!40039 res!63516) b!131855))

(assert (= (and b!131855 res!63515) b!131856))

(assert (=> d!40039 m!155029))

(assert (=> d!40039 m!155209))

(assert (=> d!40039 m!155029))

(declare-fun m!155245 () Bool)

(assert (=> d!40039 m!155245))

(declare-fun m!155247 () Bool)

(assert (=> d!40039 m!155247))

(declare-fun m!155249 () Bool)

(assert (=> b!131855 m!155249))

(declare-fun m!155251 () Bool)

(assert (=> b!131856 m!155251))

(assert (=> bm!14473 d!40039))

(declare-fun d!40041 () Bool)

(assert (=> d!40041 (isDefined!124 (getValueByKey!171 (toList!867 lt!68520) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun lt!68707 () Unit!4116)

(declare-fun choose!809 (List!1714 (_ BitVec 64)) Unit!4116)

(assert (=> d!40041 (= lt!68707 (choose!809 (toList!867 lt!68520) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun e!85991 () Bool)

(assert (=> d!40041 e!85991))

(declare-fun res!63519 () Bool)

(assert (=> d!40041 (=> (not res!63519) (not e!85991))))

(declare-fun isStrictlySorted!321 (List!1714) Bool)

(assert (=> d!40041 (= res!63519 (isStrictlySorted!321 (toList!867 lt!68520)))))

(assert (=> d!40041 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!867 lt!68520) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) lt!68707)))

(declare-fun b!131859 () Bool)

(assert (=> b!131859 (= e!85991 (containsKey!175 (toList!867 lt!68520) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (= (and d!40041 res!63519) b!131859))

(assert (=> d!40041 m!155029))

(assert (=> d!40041 m!155177))

(assert (=> d!40041 m!155177))

(assert (=> d!40041 m!155179))

(assert (=> d!40041 m!155029))

(declare-fun m!155253 () Bool)

(assert (=> d!40041 m!155253))

(declare-fun m!155255 () Bool)

(assert (=> d!40041 m!155255))

(assert (=> b!131859 m!155029))

(assert (=> b!131859 m!155173))

(assert (=> b!131706 d!40041))

(declare-fun d!40043 () Bool)

(declare-fun isEmpty!407 (Option!177) Bool)

(assert (=> d!40043 (= (isDefined!124 (getValueByKey!171 (toList!867 lt!68520) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355))) (not (isEmpty!407 (getValueByKey!171 (toList!867 lt!68520) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))))

(declare-fun bs!5456 () Bool)

(assert (= bs!5456 d!40043))

(assert (=> bs!5456 m!155177))

(declare-fun m!155257 () Bool)

(assert (=> bs!5456 m!155257))

(assert (=> b!131706 d!40043))

(declare-fun b!131868 () Bool)

(declare-fun e!85996 () Option!177)

(assert (=> b!131868 (= e!85996 (Some!176 (_2!1320 (h!2315 (toList!867 lt!68520)))))))

(declare-fun e!85997 () Option!177)

(declare-fun b!131870 () Bool)

(assert (=> b!131870 (= e!85997 (getValueByKey!171 (t!6149 (toList!867 lt!68520)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun d!40045 () Bool)

(declare-fun c!24355 () Bool)

(assert (=> d!40045 (= c!24355 (and ((_ is Cons!1710) (toList!867 lt!68520)) (= (_1!1320 (h!2315 (toList!867 lt!68520))) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355))))))

(assert (=> d!40045 (= (getValueByKey!171 (toList!867 lt!68520) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) e!85996)))

(declare-fun b!131869 () Bool)

(assert (=> b!131869 (= e!85996 e!85997)))

(declare-fun c!24356 () Bool)

(assert (=> b!131869 (= c!24356 (and ((_ is Cons!1710) (toList!867 lt!68520)) (not (= (_1!1320 (h!2315 (toList!867 lt!68520))) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))))

(declare-fun b!131871 () Bool)

(assert (=> b!131871 (= e!85997 None!175)))

(assert (= (and d!40045 c!24355) b!131868))

(assert (= (and d!40045 (not c!24355)) b!131869))

(assert (= (and b!131869 c!24356) b!131870))

(assert (= (and b!131869 (not c!24356)) b!131871))

(assert (=> b!131870 m!155029))

(declare-fun m!155259 () Bool)

(assert (=> b!131870 m!155259))

(assert (=> b!131706 d!40045))

(declare-fun d!40047 () Bool)

(declare-fun e!86000 () Bool)

(assert (=> d!40047 e!86000))

(declare-fun res!63525 () Bool)

(assert (=> d!40047 (=> (not res!63525) (not e!86000))))

(declare-fun lt!68717 () ListLongMap!1703)

(assert (=> d!40047 (= res!63525 (contains!895 lt!68717 (_1!1320 (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!68718 () List!1714)

(assert (=> d!40047 (= lt!68717 (ListLongMap!1704 lt!68718))))

(declare-fun lt!68719 () Unit!4116)

(declare-fun lt!68716 () Unit!4116)

(assert (=> d!40047 (= lt!68719 lt!68716)))

(assert (=> d!40047 (= (getValueByKey!171 lt!68718 (_1!1320 (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!176 (_2!1320 (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!86 (List!1714 (_ BitVec 64) V!3475) Unit!4116)

(assert (=> d!40047 (= lt!68716 (lemmaContainsTupThenGetReturnValue!86 lt!68718 (_1!1320 (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1320 (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!89 (List!1714 (_ BitVec 64) V!3475) List!1714)

(assert (=> d!40047 (= lt!68718 (insertStrictlySorted!89 (toList!867 call!14469) (_1!1320 (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1320 (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40047 (= (+!174 call!14469 (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!68717)))

(declare-fun b!131876 () Bool)

(declare-fun res!63524 () Bool)

(assert (=> b!131876 (=> (not res!63524) (not e!86000))))

(assert (=> b!131876 (= res!63524 (= (getValueByKey!171 (toList!867 lt!68717) (_1!1320 (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!176 (_2!1320 (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!131877 () Bool)

(declare-fun contains!898 (List!1714 tuple2!2618) Bool)

(assert (=> b!131877 (= e!86000 (contains!898 (toList!867 lt!68717) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!40047 res!63525) b!131876))

(assert (= (and b!131876 res!63524) b!131877))

(declare-fun m!155261 () Bool)

(assert (=> d!40047 m!155261))

(declare-fun m!155263 () Bool)

(assert (=> d!40047 m!155263))

(declare-fun m!155265 () Bool)

(assert (=> d!40047 m!155265))

(declare-fun m!155267 () Bool)

(assert (=> d!40047 m!155267))

(declare-fun m!155269 () Bool)

(assert (=> b!131876 m!155269))

(declare-fun m!155271 () Bool)

(assert (=> b!131877 m!155271))

(assert (=> b!131815 d!40047))

(assert (=> b!131708 d!40043))

(assert (=> b!131708 d!40045))

(declare-fun d!40049 () Bool)

(declare-fun get!1479 (Option!177) V!3475)

(assert (=> d!40049 (= (apply!115 lt!68594 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1479 (getValueByKey!171 (toList!867 lt!68594) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5457 () Bool)

(assert (= bs!5457 d!40049))

(assert (=> bs!5457 m!155105))

(declare-fun m!155273 () Bool)

(assert (=> bs!5457 m!155273))

(assert (=> bs!5457 m!155273))

(declare-fun m!155275 () Bool)

(assert (=> bs!5457 m!155275))

(assert (=> b!131673 d!40049))

(declare-fun d!40051 () Bool)

(declare-fun c!24357 () Bool)

(assert (=> d!40051 (= c!24357 ((_ is ValueCellFull!1092) (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!86001 () V!3475)

(assert (=> d!40051 (= (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!86001)))

(declare-fun b!131878 () Bool)

(assert (=> b!131878 (= e!86001 (get!1477 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!131879 () Bool)

(assert (=> b!131879 (= e!86001 (get!1478 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40051 c!24357) b!131878))

(assert (= (and d!40051 (not c!24357)) b!131879))

(assert (=> b!131878 m!155143))

(assert (=> b!131878 m!155025))

(declare-fun m!155277 () Bool)

(assert (=> b!131878 m!155277))

(assert (=> b!131879 m!155143))

(assert (=> b!131879 m!155025))

(declare-fun m!155279 () Bool)

(assert (=> b!131879 m!155279))

(assert (=> b!131673 d!40051))

(declare-fun d!40053 () Bool)

(assert (=> d!40053 (= (validKeyInArray!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131613 d!40053))

(assert (=> d!40017 d!40011))

(declare-fun d!40055 () Bool)

(declare-fun res!63526 () Bool)

(declare-fun e!86002 () Bool)

(assert (=> d!40055 (=> (not res!63526) (not e!86002))))

(assert (=> d!40055 (= res!63526 (simpleValid!91 (v!3187 (underlying!452 thiss!992))))))

(assert (=> d!40055 (= (valid!520 (v!3187 (underlying!452 thiss!992))) e!86002)))

(declare-fun b!131880 () Bool)

(declare-fun res!63527 () Bool)

(assert (=> b!131880 (=> (not res!63527) (not e!86002))))

(assert (=> b!131880 (= res!63527 (= (arrayCountValidKeys!0 (_keys!4601 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000000 (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))) (_size!595 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!131881 () Bool)

(declare-fun res!63528 () Bool)

(assert (=> b!131881 (=> (not res!63528) (not e!86002))))

(assert (=> b!131881 (= res!63528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!131882 () Bool)

(assert (=> b!131882 (= e!86002 (arrayNoDuplicates!0 (_keys!4601 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000000 Nil!1710))))

(assert (= (and d!40055 res!63526) b!131880))

(assert (= (and b!131880 res!63527) b!131881))

(assert (= (and b!131881 res!63528) b!131882))

(declare-fun m!155281 () Bool)

(assert (=> d!40055 m!155281))

(declare-fun m!155283 () Bool)

(assert (=> b!131880 m!155283))

(assert (=> b!131881 m!155049))

(assert (=> b!131882 m!155035))

(assert (=> d!40037 d!40055))

(declare-fun d!40057 () Bool)

(declare-fun e!86004 () Bool)

(assert (=> d!40057 e!86004))

(declare-fun res!63529 () Bool)

(assert (=> d!40057 (=> res!63529 e!86004)))

(declare-fun lt!68722 () Bool)

(assert (=> d!40057 (= res!63529 (not lt!68722))))

(declare-fun lt!68721 () Bool)

(assert (=> d!40057 (= lt!68722 lt!68721)))

(declare-fun lt!68720 () Unit!4116)

(declare-fun e!86003 () Unit!4116)

(assert (=> d!40057 (= lt!68720 e!86003)))

(declare-fun c!24358 () Bool)

(assert (=> d!40057 (= c!24358 lt!68721)))

(assert (=> d!40057 (= lt!68721 (containsKey!175 (toList!867 e!85967) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> d!40057 (= (contains!895 e!85967 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) lt!68722)))

(declare-fun b!131883 () Bool)

(declare-fun lt!68723 () Unit!4116)

(assert (=> b!131883 (= e!86003 lt!68723)))

(assert (=> b!131883 (= lt!68723 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!867 e!85967) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> b!131883 (isDefined!124 (getValueByKey!171 (toList!867 e!85967) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun b!131884 () Bool)

(declare-fun Unit!4122 () Unit!4116)

(assert (=> b!131884 (= e!86003 Unit!4122)))

(declare-fun b!131885 () Bool)

(assert (=> b!131885 (= e!86004 (isDefined!124 (getValueByKey!171 (toList!867 e!85967) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355))))))

(assert (= (and d!40057 c!24358) b!131883))

(assert (= (and d!40057 (not c!24358)) b!131884))

(assert (= (and d!40057 (not res!63529)) b!131885))

(assert (=> d!40057 m!155029))

(declare-fun m!155285 () Bool)

(assert (=> d!40057 m!155285))

(assert (=> b!131883 m!155029))

(declare-fun m!155287 () Bool)

(assert (=> b!131883 m!155287))

(assert (=> b!131883 m!155029))

(declare-fun m!155289 () Bool)

(assert (=> b!131883 m!155289))

(assert (=> b!131883 m!155289))

(declare-fun m!155291 () Bool)

(assert (=> b!131883 m!155291))

(assert (=> b!131885 m!155029))

(assert (=> b!131885 m!155289))

(assert (=> b!131885 m!155289))

(assert (=> b!131885 m!155291))

(assert (=> bm!14456 d!40057))

(declare-fun d!40059 () Bool)

(declare-fun e!86023 () Bool)

(assert (=> d!40059 e!86023))

(declare-fun res!63541 () Bool)

(assert (=> d!40059 (=> (not res!63541) (not e!86023))))

(declare-fun lt!68744 () ListLongMap!1703)

(assert (=> d!40059 (= res!63541 (not (contains!895 lt!68744 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!86025 () ListLongMap!1703)

(assert (=> d!40059 (= lt!68744 e!86025)))

(declare-fun c!24367 () Bool)

(assert (=> d!40059 (= c!24367 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> d!40059 (validMask!0 (mask!7148 (v!3187 (underlying!452 thiss!992))))))

(assert (=> d!40059 (= (getCurrentListMapNoExtraKeys!140 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (_values!2837 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992))) (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) (minValue!2710 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992)))) lt!68744)))

(declare-fun b!131910 () Bool)

(declare-fun lt!68739 () Unit!4116)

(declare-fun lt!68741 () Unit!4116)

(assert (=> b!131910 (= lt!68739 lt!68741)))

(declare-fun lt!68740 () V!3475)

(declare-fun lt!68738 () ListLongMap!1703)

(declare-fun lt!68742 () (_ BitVec 64))

(declare-fun lt!68743 () (_ BitVec 64))

(assert (=> b!131910 (not (contains!895 (+!174 lt!68738 (tuple2!2619 lt!68743 lt!68740)) lt!68742))))

(declare-fun addStillNotContains!60 (ListLongMap!1703 (_ BitVec 64) V!3475 (_ BitVec 64)) Unit!4116)

(assert (=> b!131910 (= lt!68741 (addStillNotContains!60 lt!68738 lt!68743 lt!68740 lt!68742))))

(assert (=> b!131910 (= lt!68742 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!131910 (= lt!68740 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131910 (= lt!68743 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!14479 () ListLongMap!1703)

(assert (=> b!131910 (= lt!68738 call!14479)))

(declare-fun e!86020 () ListLongMap!1703)

(assert (=> b!131910 (= e!86020 (+!174 call!14479 (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!131911 () Bool)

(assert (=> b!131911 (= e!86020 call!14479)))

(declare-fun b!131912 () Bool)

(declare-fun res!63540 () Bool)

(assert (=> b!131912 (=> (not res!63540) (not e!86023))))

(assert (=> b!131912 (= res!63540 (not (contains!895 lt!68744 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!131913 () Bool)

(assert (=> b!131913 (= e!86025 e!86020)))

(declare-fun c!24369 () Bool)

(assert (=> b!131913 (= c!24369 (validKeyInArray!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!131914 () Bool)

(declare-fun e!86022 () Bool)

(assert (=> b!131914 (= e!86023 e!86022)))

(declare-fun c!24370 () Bool)

(declare-fun e!86024 () Bool)

(assert (=> b!131914 (= c!24370 e!86024)))

(declare-fun res!63538 () Bool)

(assert (=> b!131914 (=> (not res!63538) (not e!86024))))

(assert (=> b!131914 (= res!63538 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun b!131915 () Bool)

(assert (=> b!131915 (= e!86025 (ListLongMap!1704 Nil!1711))))

(declare-fun b!131916 () Bool)

(assert (=> b!131916 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> b!131916 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2524 (_values!2837 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun e!86021 () Bool)

(assert (=> b!131916 (= e!86021 (= (apply!115 lt!68744 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!131917 () Bool)

(declare-fun e!86019 () Bool)

(assert (=> b!131917 (= e!86022 e!86019)))

(declare-fun c!24368 () Bool)

(assert (=> b!131917 (= c!24368 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun bm!14476 () Bool)

(assert (=> bm!14476 (= call!14479 (getCurrentListMapNoExtraKeys!140 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (_values!2837 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992))) (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) (minValue!2710 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!131918 () Bool)

(assert (=> b!131918 (= e!86019 (= lt!68744 (getCurrentListMapNoExtraKeys!140 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (_values!2837 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992))) (extraKeys!2621 (v!3187 (underlying!452 thiss!992))) (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) (minValue!2710 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun b!131919 () Bool)

(assert (=> b!131919 (= e!86024 (validKeyInArray!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131919 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!131920 () Bool)

(declare-fun isEmpty!408 (ListLongMap!1703) Bool)

(assert (=> b!131920 (= e!86019 (isEmpty!408 lt!68744))))

(declare-fun b!131921 () Bool)

(assert (=> b!131921 (= e!86022 e!86021)))

(assert (=> b!131921 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun res!63539 () Bool)

(assert (=> b!131921 (= res!63539 (contains!895 lt!68744 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131921 (=> (not res!63539) (not e!86021))))

(assert (= (and d!40059 c!24367) b!131915))

(assert (= (and d!40059 (not c!24367)) b!131913))

(assert (= (and b!131913 c!24369) b!131910))

(assert (= (and b!131913 (not c!24369)) b!131911))

(assert (= (or b!131910 b!131911) bm!14476))

(assert (= (and d!40059 res!63541) b!131912))

(assert (= (and b!131912 res!63540) b!131914))

(assert (= (and b!131914 res!63538) b!131919))

(assert (= (and b!131914 c!24370) b!131921))

(assert (= (and b!131914 (not c!24370)) b!131917))

(assert (= (and b!131921 res!63539) b!131916))

(assert (= (and b!131917 c!24368) b!131918))

(assert (= (and b!131917 (not c!24368)) b!131920))

(declare-fun b_lambda!5867 () Bool)

(assert (=> (not b_lambda!5867) (not b!131910)))

(assert (=> b!131910 t!6145))

(declare-fun b_and!8167 () Bool)

(assert (= b_and!8163 (and (=> t!6145 result!3959) b_and!8167)))

(assert (=> b!131910 t!6147))

(declare-fun b_and!8169 () Bool)

(assert (= b_and!8165 (and (=> t!6147 result!3963) b_and!8169)))

(declare-fun b_lambda!5869 () Bool)

(assert (=> (not b_lambda!5869) (not b!131916)))

(assert (=> b!131916 t!6145))

(declare-fun b_and!8171 () Bool)

(assert (= b_and!8167 (and (=> t!6145 result!3959) b_and!8171)))

(assert (=> b!131916 t!6147))

(declare-fun b_and!8173 () Bool)

(assert (= b_and!8169 (and (=> t!6147 result!3963) b_and!8173)))

(assert (=> b!131919 m!155105))

(assert (=> b!131919 m!155105))

(assert (=> b!131919 m!155141))

(declare-fun m!155293 () Bool)

(assert (=> d!40059 m!155293))

(assert (=> d!40059 m!155019))

(declare-fun m!155295 () Bool)

(assert (=> bm!14476 m!155295))

(declare-fun m!155297 () Bool)

(assert (=> b!131920 m!155297))

(assert (=> b!131921 m!155105))

(assert (=> b!131921 m!155105))

(declare-fun m!155299 () Bool)

(assert (=> b!131921 m!155299))

(assert (=> b!131910 m!155025))

(declare-fun m!155301 () Bool)

(assert (=> b!131910 m!155301))

(declare-fun m!155303 () Bool)

(assert (=> b!131910 m!155303))

(assert (=> b!131910 m!155143))

(assert (=> b!131910 m!155025))

(assert (=> b!131910 m!155145))

(declare-fun m!155305 () Bool)

(assert (=> b!131910 m!155305))

(assert (=> b!131910 m!155143))

(declare-fun m!155307 () Bool)

(assert (=> b!131910 m!155307))

(assert (=> b!131910 m!155105))

(assert (=> b!131910 m!155301))

(declare-fun m!155309 () Bool)

(assert (=> b!131912 m!155309))

(assert (=> b!131916 m!155025))

(assert (=> b!131916 m!155143))

(assert (=> b!131916 m!155025))

(assert (=> b!131916 m!155145))

(assert (=> b!131916 m!155105))

(declare-fun m!155311 () Bool)

(assert (=> b!131916 m!155311))

(assert (=> b!131916 m!155105))

(assert (=> b!131916 m!155143))

(assert (=> b!131918 m!155295))

(assert (=> b!131913 m!155105))

(assert (=> b!131913 m!155105))

(assert (=> b!131913 m!155141))

(assert (=> bm!14398 d!40059))

(declare-fun d!40061 () Bool)

(assert (=> d!40061 (= (validKeyInArray!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131670 d!40061))

(declare-fun b!131930 () Bool)

(declare-fun e!86030 () (_ BitVec 32))

(declare-fun call!14482 () (_ BitVec 32))

(assert (=> b!131930 (= e!86030 call!14482)))

(declare-fun d!40063 () Bool)

(declare-fun lt!68747 () (_ BitVec 32))

(assert (=> d!40063 (and (bvsge lt!68747 #b00000000000000000000000000000000) (bvsle lt!68747 (bvsub (size!2523 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!86031 () (_ BitVec 32))

(assert (=> d!40063 (= lt!68747 e!86031)))

(declare-fun c!24376 () Bool)

(assert (=> d!40063 (= c!24376 (bvsge #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))

(assert (=> d!40063 (and (bvsle #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2523 (_keys!4601 newMap!16)) (size!2523 (_keys!4601 newMap!16))))))

(assert (=> d!40063 (= (arrayCountValidKeys!0 (_keys!4601 newMap!16) #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))) lt!68747)))

(declare-fun bm!14479 () Bool)

(assert (=> bm!14479 (= call!14482 (arrayCountValidKeys!0 (_keys!4601 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2523 (_keys!4601 newMap!16))))))

(declare-fun b!131931 () Bool)

(assert (=> b!131931 (= e!86031 e!86030)))

(declare-fun c!24375 () Bool)

(assert (=> b!131931 (= c!24375 (validKeyInArray!0 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131932 () Bool)

(assert (=> b!131932 (= e!86030 (bvadd #b00000000000000000000000000000001 call!14482))))

(declare-fun b!131933 () Bool)

(assert (=> b!131933 (= e!86031 #b00000000000000000000000000000000)))

(assert (= (and d!40063 c!24376) b!131933))

(assert (= (and d!40063 (not c!24376)) b!131931))

(assert (= (and b!131931 c!24375) b!131932))

(assert (= (and b!131931 (not c!24375)) b!131930))

(assert (= (or b!131932 b!131930) bm!14479))

(declare-fun m!155313 () Bool)

(assert (=> bm!14479 m!155313))

(declare-fun m!155315 () Bool)

(assert (=> b!131931 m!155315))

(assert (=> b!131931 m!155315))

(declare-fun m!155317 () Bool)

(assert (=> b!131931 m!155317))

(assert (=> b!131697 d!40063))

(assert (=> b!131690 d!40053))

(declare-fun d!40065 () Bool)

(assert (=> d!40065 (= (get!1477 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3186 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> b!131839 d!40065))

(declare-fun b!131946 () Bool)

(declare-fun e!86038 () SeekEntryResult!274)

(declare-fun e!86040 () SeekEntryResult!274)

(assert (=> b!131946 (= e!86038 e!86040)))

(declare-fun lt!68754 () (_ BitVec 64))

(declare-fun lt!68755 () SeekEntryResult!274)

(assert (=> b!131946 (= lt!68754 (select (arr!2255 (_keys!4601 newMap!16)) (index!3257 lt!68755)))))

(declare-fun c!24385 () Bool)

(assert (=> b!131946 (= c!24385 (= lt!68754 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun b!131947 () Bool)

(declare-fun e!86039 () SeekEntryResult!274)

(assert (=> b!131947 (= e!86039 (MissingZero!274 (index!3257 lt!68755)))))

(declare-fun b!131948 () Bool)

(assert (=> b!131948 (= e!86038 Undefined!274)))

(declare-fun b!131949 () Bool)

(declare-fun c!24384 () Bool)

(assert (=> b!131949 (= c!24384 (= lt!68754 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131949 (= e!86040 e!86039)))

(declare-fun b!131950 () Bool)

(assert (=> b!131950 (= e!86040 (Found!274 (index!3257 lt!68755)))))

(declare-fun b!131951 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4767 (_ BitVec 32)) SeekEntryResult!274)

(assert (=> b!131951 (= e!86039 (seekKeyOrZeroReturnVacant!0 (x!15502 lt!68755) (index!3257 lt!68755) (index!3257 lt!68755) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4601 newMap!16) (mask!7148 newMap!16)))))

(declare-fun lt!68756 () SeekEntryResult!274)

(declare-fun d!40067 () Bool)

(assert (=> d!40067 (and (or ((_ is Undefined!274) lt!68756) (not ((_ is Found!274) lt!68756)) (and (bvsge (index!3256 lt!68756) #b00000000000000000000000000000000) (bvslt (index!3256 lt!68756) (size!2523 (_keys!4601 newMap!16))))) (or ((_ is Undefined!274) lt!68756) ((_ is Found!274) lt!68756) (not ((_ is MissingZero!274) lt!68756)) (and (bvsge (index!3255 lt!68756) #b00000000000000000000000000000000) (bvslt (index!3255 lt!68756) (size!2523 (_keys!4601 newMap!16))))) (or ((_ is Undefined!274) lt!68756) ((_ is Found!274) lt!68756) ((_ is MissingZero!274) lt!68756) (not ((_ is MissingVacant!274) lt!68756)) (and (bvsge (index!3258 lt!68756) #b00000000000000000000000000000000) (bvslt (index!3258 lt!68756) (size!2523 (_keys!4601 newMap!16))))) (or ((_ is Undefined!274) lt!68756) (ite ((_ is Found!274) lt!68756) (= (select (arr!2255 (_keys!4601 newMap!16)) (index!3256 lt!68756)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) (ite ((_ is MissingZero!274) lt!68756) (= (select (arr!2255 (_keys!4601 newMap!16)) (index!3255 lt!68756)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!274) lt!68756) (= (select (arr!2255 (_keys!4601 newMap!16)) (index!3258 lt!68756)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40067 (= lt!68756 e!86038)))

(declare-fun c!24383 () Bool)

(assert (=> d!40067 (= c!24383 (and ((_ is Intermediate!274) lt!68755) (undefined!1086 lt!68755)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4767 (_ BitVec 32)) SeekEntryResult!274)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!40067 (= lt!68755 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (mask!7148 newMap!16)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4601 newMap!16) (mask!7148 newMap!16)))))

(assert (=> d!40067 (validMask!0 (mask!7148 newMap!16))))

(assert (=> d!40067 (= (seekEntryOrOpen!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4601 newMap!16) (mask!7148 newMap!16)) lt!68756)))

(assert (= (and d!40067 c!24383) b!131948))

(assert (= (and d!40067 (not c!24383)) b!131946))

(assert (= (and b!131946 c!24385) b!131950))

(assert (= (and b!131946 (not c!24385)) b!131949))

(assert (= (and b!131949 c!24384) b!131947))

(assert (= (and b!131949 (not c!24384)) b!131951))

(declare-fun m!155319 () Bool)

(assert (=> b!131946 m!155319))

(assert (=> b!131951 m!155029))

(declare-fun m!155321 () Bool)

(assert (=> b!131951 m!155321))

(assert (=> d!40067 m!155247))

(declare-fun m!155323 () Bool)

(assert (=> d!40067 m!155323))

(declare-fun m!155325 () Bool)

(assert (=> d!40067 m!155325))

(assert (=> d!40067 m!155029))

(declare-fun m!155327 () Bool)

(assert (=> d!40067 m!155327))

(assert (=> d!40067 m!155029))

(assert (=> d!40067 m!155325))

(declare-fun m!155329 () Bool)

(assert (=> d!40067 m!155329))

(declare-fun m!155331 () Bool)

(assert (=> d!40067 m!155331))

(assert (=> bm!14453 d!40067))

(declare-fun d!40069 () Bool)

(assert (=> d!40069 (= (inRange!0 (ite c!24334 (ite c!24347 (index!3256 lt!68697) (ite c!24339 (index!3255 lt!68690) (index!3258 lt!68690))) (ite c!24338 (index!3256 lt!68677) (ite c!24342 (index!3255 lt!68686) (index!3258 lt!68686)))) (mask!7148 newMap!16)) (and (bvsge (ite c!24334 (ite c!24347 (index!3256 lt!68697) (ite c!24339 (index!3255 lt!68690) (index!3258 lt!68690))) (ite c!24338 (index!3256 lt!68677) (ite c!24342 (index!3255 lt!68686) (index!3258 lt!68686)))) #b00000000000000000000000000000000) (bvslt (ite c!24334 (ite c!24347 (index!3256 lt!68697) (ite c!24339 (index!3255 lt!68690) (index!3258 lt!68690))) (ite c!24338 (index!3256 lt!68677) (ite c!24342 (index!3255 lt!68686) (index!3258 lt!68686)))) (bvadd (mask!7148 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!14463 d!40069))

(declare-fun d!40071 () Bool)

(assert (=> d!40071 (= (+!174 (getCurrentListMap!544 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!544 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) lt!68689 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68759 () Unit!4116)

(declare-fun choose!810 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 V!3475 Int) Unit!4116)

(assert (=> d!40071 (= lt!68759 (choose!810 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) lt!68689 (zeroValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2710 newMap!16) (defaultEntry!2854 newMap!16)))))

(assert (=> d!40071 (validMask!0 (mask!7148 newMap!16))))

(assert (=> d!40071 (= (lemmaChangeZeroKeyThenAddPairToListMap!60 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) lt!68689 (zeroValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2710 newMap!16) (defaultEntry!2854 newMap!16)) lt!68759)))

(declare-fun bs!5458 () Bool)

(assert (= bs!5458 d!40071))

(assert (=> bs!5458 m!155027))

(declare-fun m!155333 () Bool)

(assert (=> bs!5458 m!155333))

(assert (=> bs!5458 m!155099))

(declare-fun m!155335 () Bool)

(assert (=> bs!5458 m!155335))

(assert (=> bs!5458 m!155027))

(declare-fun m!155337 () Bool)

(assert (=> bs!5458 m!155337))

(assert (=> bs!5458 m!155247))

(assert (=> bs!5458 m!155099))

(assert (=> b!131799 d!40071))

(declare-fun d!40073 () Bool)

(declare-fun e!86041 () Bool)

(assert (=> d!40073 e!86041))

(declare-fun res!63543 () Bool)

(assert (=> d!40073 (=> (not res!63543) (not e!86041))))

(declare-fun lt!68761 () ListLongMap!1703)

(assert (=> d!40073 (= res!63543 (contains!895 lt!68761 (_1!1320 (ite c!24344 (ite c!24346 (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!68762 () List!1714)

(assert (=> d!40073 (= lt!68761 (ListLongMap!1704 lt!68762))))

(declare-fun lt!68763 () Unit!4116)

(declare-fun lt!68760 () Unit!4116)

(assert (=> d!40073 (= lt!68763 lt!68760)))

(assert (=> d!40073 (= (getValueByKey!171 lt!68762 (_1!1320 (ite c!24344 (ite c!24346 (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!176 (_2!1320 (ite c!24344 (ite c!24346 (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!40073 (= lt!68760 (lemmaContainsTupThenGetReturnValue!86 lt!68762 (_1!1320 (ite c!24344 (ite c!24346 (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1320 (ite c!24344 (ite c!24346 (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!40073 (= lt!68762 (insertStrictlySorted!89 (toList!867 e!85972) (_1!1320 (ite c!24344 (ite c!24346 (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1320 (ite c!24344 (ite c!24346 (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!40073 (= (+!174 e!85972 (ite c!24344 (ite c!24346 (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!68761)))

(declare-fun b!131952 () Bool)

(declare-fun res!63542 () Bool)

(assert (=> b!131952 (=> (not res!63542) (not e!86041))))

(assert (=> b!131952 (= res!63542 (= (getValueByKey!171 (toList!867 lt!68761) (_1!1320 (ite c!24344 (ite c!24346 (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!176 (_2!1320 (ite c!24344 (ite c!24346 (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!131953 () Bool)

(assert (=> b!131953 (= e!86041 (contains!898 (toList!867 lt!68761) (ite c!24344 (ite c!24346 (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!40073 res!63543) b!131952))

(assert (= (and b!131952 res!63542) b!131953))

(declare-fun m!155339 () Bool)

(assert (=> d!40073 m!155339))

(declare-fun m!155341 () Bool)

(assert (=> d!40073 m!155341))

(declare-fun m!155343 () Bool)

(assert (=> d!40073 m!155343))

(declare-fun m!155345 () Bool)

(assert (=> d!40073 m!155345))

(declare-fun m!155347 () Bool)

(assert (=> b!131952 m!155347))

(declare-fun m!155349 () Bool)

(assert (=> b!131953 m!155349))

(assert (=> bm!14467 d!40073))

(declare-fun d!40075 () Bool)

(assert (=> d!40075 (= (apply!115 lt!68594 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1479 (getValueByKey!171 (toList!867 lt!68594) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5459 () Bool)

(assert (= bs!5459 d!40075))

(declare-fun m!155351 () Bool)

(assert (=> bs!5459 m!155351))

(assert (=> bs!5459 m!155351))

(declare-fun m!155353 () Bool)

(assert (=> bs!5459 m!155353))

(assert (=> b!131667 d!40075))

(declare-fun b!131988 () Bool)

(declare-fun res!63564 () Bool)

(declare-fun e!86058 () Bool)

(assert (=> b!131988 (=> (not res!63564) (not e!86058))))

(declare-fun lt!68851 () tuple2!2620)

(assert (=> b!131988 (= res!63564 (valid!520 (_2!1321 lt!68851)))))

(declare-fun b!131989 () Bool)

(declare-fun res!63563 () Bool)

(declare-fun e!86063 () Bool)

(assert (=> b!131989 (=> (not res!63563) (not e!86063))))

(declare-fun lt!68843 () SeekEntryResult!274)

(assert (=> b!131989 (= res!63563 (= (select (arr!2255 (_keys!4601 newMap!16)) (index!3255 lt!68843)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131990 () Bool)

(assert (=> b!131990 (= e!86058 (= (map!1405 (_2!1321 lt!68851)) (+!174 (map!1405 newMap!16) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!131991 () Bool)

(declare-fun res!63570 () Bool)

(assert (=> b!131991 (=> (not res!63570) (not e!86058))))

(assert (=> b!131991 (= res!63570 (contains!895 (map!1405 (_2!1321 lt!68851)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun e!86065 () Bool)

(declare-fun b!131992 () Bool)

(declare-fun lt!68833 () SeekEntryResult!274)

(assert (=> b!131992 (= e!86065 (= (select (arr!2255 (_keys!4601 newMap!16)) (index!3256 lt!68833)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun bm!14488 () Bool)

(declare-fun call!14491 () Bool)

(declare-fun call!14492 () Bool)

(assert (=> bm!14488 (= call!14491 call!14492)))

(declare-fun b!131993 () Bool)

(declare-fun e!86059 () Unit!4116)

(declare-fun Unit!4123 () Unit!4116)

(assert (=> b!131993 (= e!86059 Unit!4123)))

(declare-fun b!131994 () Bool)

(declare-fun Unit!4124 () Unit!4116)

(assert (=> b!131994 (= e!86059 Unit!4124)))

(declare-fun lt!68831 () Unit!4116)

(declare-fun lemmaArrayContainsKeyThenInListMap!41 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 (_ BitVec 64) (_ BitVec 32) Int) Unit!4116)

(assert (=> b!131994 (= lt!68831 (lemmaArrayContainsKeyThenInListMap!41 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(assert (=> b!131994 (contains!895 (getCurrentListMap!544 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355))))

(declare-fun lt!68842 () Unit!4116)

(assert (=> b!131994 (= lt!68842 lt!68831)))

(assert (=> b!131994 false))

(declare-fun b!131995 () Bool)

(declare-fun res!63565 () Bool)

(assert (=> b!131995 (= res!63565 (= (select (arr!2255 (_keys!4601 newMap!16)) (index!3258 lt!68843)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!86060 () Bool)

(assert (=> b!131995 (=> (not res!63565) (not e!86060))))

(declare-fun b!131996 () Bool)

(declare-fun e!86062 () Unit!4116)

(declare-fun lt!68845 () Unit!4116)

(assert (=> b!131996 (= e!86062 lt!68845)))

(assert (=> b!131996 (= lt!68845 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!60 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2854 newMap!16)))))

(declare-fun call!14494 () SeekEntryResult!274)

(assert (=> b!131996 (= lt!68843 call!14494)))

(declare-fun c!24395 () Bool)

(assert (=> b!131996 (= c!24395 ((_ is MissingZero!274) lt!68843))))

(declare-fun e!86061 () Bool)

(assert (=> b!131996 e!86061))

(declare-fun b!131997 () Bool)

(declare-fun Unit!4125 () Unit!4116)

(assert (=> b!131997 (= e!86062 Unit!4125)))

(declare-fun lt!68827 () Unit!4116)

(assert (=> b!131997 (= lt!68827 (lemmaInListMapThenSeekEntryOrOpenFindsIt!60 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2854 newMap!16)))))

(assert (=> b!131997 (= lt!68833 call!14494)))

(declare-fun res!63567 () Bool)

(assert (=> b!131997 (= res!63567 ((_ is Found!274) lt!68833))))

(assert (=> b!131997 (=> (not res!63567) (not e!86065))))

(assert (=> b!131997 e!86065))

(declare-fun lt!68834 () Unit!4116)

(assert (=> b!131997 (= lt!68834 lt!68827)))

(assert (=> b!131997 false))

(declare-fun bm!14489 () Bool)

(assert (=> bm!14489 (= call!14494 (seekEntryOrOpen!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4601 newMap!16) (mask!7148 newMap!16)))))

(declare-fun bm!14490 () Bool)

(declare-fun call!14493 () Bool)

(assert (=> bm!14490 (= call!14493 (arrayContainsKey!0 (_keys!4601 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun d!40077 () Bool)

(assert (=> d!40077 e!86058))

(declare-fun res!63566 () Bool)

(assert (=> d!40077 (=> (not res!63566) (not e!86058))))

(assert (=> d!40077 (= res!63566 (_1!1321 lt!68851))))

(assert (=> d!40077 (= lt!68851 (tuple2!2621 true (LongMapFixedSize!1093 (defaultEntry!2854 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (bvadd (_size!595 newMap!16) #b00000000000000000000000000000001) (array!4768 (store (arr!2255 (_keys!4601 newMap!16)) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2523 (_keys!4601 newMap!16))) (array!4770 (store (arr!2256 (_values!2837 newMap!16)) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (ValueCellFull!1092 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2524 (_values!2837 newMap!16))) (_vacant!595 newMap!16))))))

(declare-fun lt!68844 () Unit!4116)

(declare-fun lt!68825 () Unit!4116)

(assert (=> d!40077 (= lt!68844 lt!68825)))

(declare-fun lt!68832 () array!4767)

(declare-fun lt!68837 () array!4769)

(assert (=> d!40077 (contains!895 (getCurrentListMap!544 lt!68832 lt!68837 (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)) (select (store (arr!2255 (_keys!4601 newMap!16)) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678))))))

(assert (=> d!40077 (= lt!68825 (lemmaValidKeyInArrayIsInListMap!121 lt!68832 lt!68837 (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (defaultEntry!2854 newMap!16)))))

(assert (=> d!40077 (= lt!68837 (array!4770 (store (arr!2256 (_values!2837 newMap!16)) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (ValueCellFull!1092 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2524 (_values!2837 newMap!16))))))

(assert (=> d!40077 (= lt!68832 (array!4768 (store (arr!2255 (_keys!4601 newMap!16)) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2523 (_keys!4601 newMap!16))))))

(declare-fun lt!68849 () Unit!4116)

(declare-fun lt!68826 () Unit!4116)

(assert (=> d!40077 (= lt!68849 lt!68826)))

(declare-fun lt!68829 () array!4767)

(assert (=> d!40077 (= (arrayCountValidKeys!0 lt!68829 (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (bvadd (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4767 (_ BitVec 32)) Unit!4116)

(assert (=> d!40077 (= lt!68826 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!68829 (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678))))))

(assert (=> d!40077 (= lt!68829 (array!4768 (store (arr!2255 (_keys!4601 newMap!16)) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2523 (_keys!4601 newMap!16))))))

(declare-fun lt!68848 () Unit!4116)

(declare-fun lt!68850 () Unit!4116)

(assert (=> d!40077 (= lt!68848 lt!68850)))

(declare-fun lt!68835 () array!4767)

(assert (=> d!40077 (arrayContainsKey!0 lt!68835 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!40077 (= lt!68850 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!68835 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678))))))

(assert (=> d!40077 (= lt!68835 (array!4768 (store (arr!2255 (_keys!4601 newMap!16)) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2523 (_keys!4601 newMap!16))))))

(declare-fun lt!68840 () Unit!4116)

(declare-fun lt!68846 () Unit!4116)

(assert (=> d!40077 (= lt!68840 lt!68846)))

(assert (=> d!40077 (= (+!174 (getCurrentListMap!544 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!544 (array!4768 (store (arr!2255 (_keys!4601 newMap!16)) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2523 (_keys!4601 newMap!16))) (array!4770 (store (arr!2256 (_values!2837 newMap!16)) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (ValueCellFull!1092 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2524 (_values!2837 newMap!16))) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!41 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 (_ BitVec 32) (_ BitVec 64) V!3475 Int) Unit!4116)

(assert (=> d!40077 (= lt!68846 (lemmaAddValidKeyToArrayThenAddPairToListMap!41 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68838 () Unit!4116)

(declare-fun lt!68828 () Unit!4116)

(assert (=> d!40077 (= lt!68838 lt!68828)))

(assert (=> d!40077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4768 (store (arr!2255 (_keys!4601 newMap!16)) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2523 (_keys!4601 newMap!16))) (mask!7148 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4767 (_ BitVec 32) (_ BitVec 32)) Unit!4116)

(assert (=> d!40077 (= lt!68828 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4601 newMap!16) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (mask!7148 newMap!16)))))

(declare-fun lt!68830 () Unit!4116)

(declare-fun lt!68853 () Unit!4116)

(assert (=> d!40077 (= lt!68830 lt!68853)))

(assert (=> d!40077 (= (arrayCountValidKeys!0 (array!4768 (store (arr!2255 (_keys!4601 newMap!16)) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2523 (_keys!4601 newMap!16))) #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4601 newMap!16) #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4767 (_ BitVec 32) (_ BitVec 64)) Unit!4116)

(assert (=> d!40077 (= lt!68853 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4601 newMap!16) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun lt!68852 () Unit!4116)

(declare-fun lt!68839 () Unit!4116)

(assert (=> d!40077 (= lt!68852 lt!68839)))

(declare-fun lt!68841 () (_ BitVec 32))

(declare-fun lt!68847 () List!1713)

(assert (=> d!40077 (arrayNoDuplicates!0 (array!4768 (store (arr!2255 (_keys!4601 newMap!16)) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2523 (_keys!4601 newMap!16))) lt!68841 lt!68847)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4767 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1713) Unit!4116)

(assert (=> d!40077 (= lt!68839 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4601 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678)) lt!68841 lt!68847))))

(assert (=> d!40077 (= lt!68847 Nil!1710)))

(assert (=> d!40077 (= lt!68841 #b00000000000000000000000000000000)))

(declare-fun lt!68836 () Unit!4116)

(assert (=> d!40077 (= lt!68836 e!86059)))

(declare-fun c!24394 () Bool)

(assert (=> d!40077 (= c!24394 (arrayContainsKey!0 (_keys!4601 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!68824 () Unit!4116)

(assert (=> d!40077 (= lt!68824 e!86062)))

(declare-fun c!24396 () Bool)

(assert (=> d!40077 (= c!24396 (contains!895 (getCurrentListMap!544 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> d!40077 (valid!520 newMap!16)))

(assert (=> d!40077 (= (updateHelperNewKey!60 newMap!16 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!24343 (index!3258 lt!68678) (index!3255 lt!68678))) lt!68851)))

(declare-fun b!131998 () Bool)

(assert (=> b!131998 (= e!86063 (not call!14493))))

(declare-fun b!131999 () Bool)

(declare-fun res!63562 () Bool)

(assert (=> b!131999 (=> (not res!63562) (not e!86063))))

(assert (=> b!131999 (= res!63562 call!14491)))

(assert (=> b!131999 (= e!86061 e!86063)))

(declare-fun b!132000 () Bool)

(declare-fun c!24397 () Bool)

(assert (=> b!132000 (= c!24397 ((_ is MissingVacant!274) lt!68843))))

(declare-fun e!86064 () Bool)

(assert (=> b!132000 (= e!86061 e!86064)))

(declare-fun b!132001 () Bool)

(assert (=> b!132001 (= e!86064 e!86060)))

(declare-fun res!63569 () Bool)

(assert (=> b!132001 (= res!63569 call!14491)))

(assert (=> b!132001 (=> (not res!63569) (not e!86060))))

(declare-fun bm!14491 () Bool)

(assert (=> bm!14491 (= call!14492 (inRange!0 (ite c!24396 (index!3256 lt!68833) (ite c!24395 (index!3255 lt!68843) (index!3258 lt!68843))) (mask!7148 newMap!16)))))

(declare-fun b!132002 () Bool)

(declare-fun res!63568 () Bool)

(assert (=> b!132002 (= res!63568 call!14492)))

(assert (=> b!132002 (=> (not res!63568) (not e!86065))))

(declare-fun b!132003 () Bool)

(assert (=> b!132003 (= e!86064 ((_ is Undefined!274) lt!68843))))

(declare-fun b!132004 () Bool)

(assert (=> b!132004 (= e!86060 (not call!14493))))

(assert (= (and d!40077 c!24396) b!131997))

(assert (= (and d!40077 (not c!24396)) b!131996))

(assert (= (and b!131997 res!63567) b!132002))

(assert (= (and b!132002 res!63568) b!131992))

(assert (= (and b!131996 c!24395) b!131999))

(assert (= (and b!131996 (not c!24395)) b!132000))

(assert (= (and b!131999 res!63562) b!131989))

(assert (= (and b!131989 res!63563) b!131998))

(assert (= (and b!132000 c!24397) b!132001))

(assert (= (and b!132000 (not c!24397)) b!132003))

(assert (= (and b!132001 res!63569) b!131995))

(assert (= (and b!131995 res!63565) b!132004))

(assert (= (or b!131999 b!132001) bm!14488))

(assert (= (or b!131998 b!132004) bm!14490))

(assert (= (or b!132002 bm!14488) bm!14491))

(assert (= (or b!131997 b!131996) bm!14489))

(assert (= (and d!40077 c!24394) b!131994))

(assert (= (and d!40077 (not c!24394)) b!131993))

(assert (= (and d!40077 res!63566) b!131988))

(assert (= (and b!131988 res!63564) b!131991))

(assert (= (and b!131991 res!63570) b!131990))

(assert (=> b!131997 m!155029))

(assert (=> b!131997 m!155187))

(assert (=> b!131996 m!155029))

(assert (=> b!131996 m!155205))

(declare-fun m!155355 () Bool)

(assert (=> b!131992 m!155355))

(declare-fun m!155357 () Bool)

(assert (=> b!131989 m!155357))

(assert (=> bm!14490 m!155029))

(assert (=> bm!14490 m!155225))

(declare-fun m!155359 () Bool)

(assert (=> b!131990 m!155359))

(assert (=> b!131990 m!155037))

(assert (=> b!131990 m!155037))

(declare-fun m!155361 () Bool)

(assert (=> b!131990 m!155361))

(declare-fun m!155363 () Bool)

(assert (=> bm!14491 m!155363))

(assert (=> b!131994 m!155029))

(declare-fun m!155365 () Bool)

(assert (=> b!131994 m!155365))

(assert (=> b!131994 m!155099))

(assert (=> b!131994 m!155099))

(assert (=> b!131994 m!155029))

(declare-fun m!155367 () Bool)

(assert (=> b!131994 m!155367))

(assert (=> b!131991 m!155359))

(assert (=> b!131991 m!155359))

(assert (=> b!131991 m!155029))

(declare-fun m!155369 () Bool)

(assert (=> b!131991 m!155369))

(declare-fun m!155371 () Bool)

(assert (=> b!131995 m!155371))

(declare-fun m!155373 () Bool)

(assert (=> d!40077 m!155373))

(assert (=> d!40077 m!155167))

(declare-fun m!155375 () Bool)

(assert (=> d!40077 m!155375))

(assert (=> d!40077 m!155029))

(declare-fun m!155377 () Bool)

(assert (=> d!40077 m!155377))

(assert (=> d!40077 m!155099))

(assert (=> d!40077 m!155029))

(assert (=> d!40077 m!155367))

(assert (=> d!40077 m!155029))

(assert (=> d!40077 m!155027))

(declare-fun m!155379 () Bool)

(assert (=> d!40077 m!155379))

(declare-fun m!155381 () Bool)

(assert (=> d!40077 m!155381))

(assert (=> d!40077 m!155029))

(declare-fun m!155383 () Bool)

(assert (=> d!40077 m!155383))

(declare-fun m!155385 () Bool)

(assert (=> d!40077 m!155385))

(assert (=> d!40077 m!155017))

(declare-fun m!155387 () Bool)

(assert (=> d!40077 m!155387))

(assert (=> d!40077 m!155099))

(declare-fun m!155389 () Bool)

(assert (=> d!40077 m!155389))

(assert (=> d!40077 m!155029))

(declare-fun m!155391 () Bool)

(assert (=> d!40077 m!155391))

(declare-fun m!155393 () Bool)

(assert (=> d!40077 m!155393))

(assert (=> d!40077 m!155029))

(declare-fun m!155395 () Bool)

(assert (=> d!40077 m!155395))

(declare-fun m!155397 () Bool)

(assert (=> d!40077 m!155397))

(assert (=> d!40077 m!155029))

(declare-fun m!155399 () Bool)

(assert (=> d!40077 m!155399))

(assert (=> d!40077 m!155029))

(assert (=> d!40077 m!155225))

(assert (=> d!40077 m!155099))

(declare-fun m!155401 () Bool)

(assert (=> d!40077 m!155401))

(declare-fun m!155403 () Bool)

(assert (=> d!40077 m!155403))

(declare-fun m!155405 () Bool)

(assert (=> d!40077 m!155405))

(declare-fun m!155407 () Bool)

(assert (=> d!40077 m!155407))

(assert (=> d!40077 m!155403))

(assert (=> d!40077 m!155397))

(declare-fun m!155409 () Bool)

(assert (=> d!40077 m!155409))

(assert (=> bm!14489 m!155029))

(assert (=> bm!14489 m!155209))

(declare-fun m!155411 () Bool)

(assert (=> b!131988 m!155411))

(assert (=> bm!14462 d!40077))

(declare-fun d!40079 () Bool)

(declare-fun res!63571 () Bool)

(declare-fun e!86066 () Bool)

(assert (=> d!40079 (=> (not res!63571) (not e!86066))))

(assert (=> d!40079 (= res!63571 (simpleValid!91 (_2!1321 lt!68694)))))

(assert (=> d!40079 (= (valid!520 (_2!1321 lt!68694)) e!86066)))

(declare-fun b!132005 () Bool)

(declare-fun res!63572 () Bool)

(assert (=> b!132005 (=> (not res!63572) (not e!86066))))

(assert (=> b!132005 (= res!63572 (= (arrayCountValidKeys!0 (_keys!4601 (_2!1321 lt!68694)) #b00000000000000000000000000000000 (size!2523 (_keys!4601 (_2!1321 lt!68694)))) (_size!595 (_2!1321 lt!68694))))))

(declare-fun b!132006 () Bool)

(declare-fun res!63573 () Bool)

(assert (=> b!132006 (=> (not res!63573) (not e!86066))))

(assert (=> b!132006 (= res!63573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4601 (_2!1321 lt!68694)) (mask!7148 (_2!1321 lt!68694))))))

(declare-fun b!132007 () Bool)

(assert (=> b!132007 (= e!86066 (arrayNoDuplicates!0 (_keys!4601 (_2!1321 lt!68694)) #b00000000000000000000000000000000 Nil!1710))))

(assert (= (and d!40079 res!63571) b!132005))

(assert (= (and b!132005 res!63572) b!132006))

(assert (= (and b!132006 res!63573) b!132007))

(declare-fun m!155413 () Bool)

(assert (=> d!40079 m!155413))

(declare-fun m!155415 () Bool)

(assert (=> b!132005 m!155415))

(declare-fun m!155417 () Bool)

(assert (=> b!132006 m!155417))

(declare-fun m!155419 () Bool)

(assert (=> b!132007 m!155419))

(assert (=> d!40033 d!40079))

(assert (=> d!40033 d!40029))

(declare-fun d!40081 () Bool)

(declare-fun res!63578 () Bool)

(declare-fun e!86071 () Bool)

(assert (=> d!40081 (=> res!63578 e!86071)))

(assert (=> d!40081 (= res!63578 (= (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> d!40081 (= (arrayContainsKey!0 (_keys!4601 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) #b00000000000000000000000000000000) e!86071)))

(declare-fun b!132012 () Bool)

(declare-fun e!86072 () Bool)

(assert (=> b!132012 (= e!86071 e!86072)))

(declare-fun res!63579 () Bool)

(assert (=> b!132012 (=> (not res!63579) (not e!86072))))

(assert (=> b!132012 (= res!63579 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2523 (_keys!4601 newMap!16))))))

(declare-fun b!132013 () Bool)

(assert (=> b!132013 (= e!86072 (arrayContainsKey!0 (_keys!4601 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!40081 (not res!63578)) b!132012))

(assert (= (and b!132012 res!63579) b!132013))

(assert (=> d!40081 m!155315))

(assert (=> b!132013 m!155029))

(declare-fun m!155421 () Bool)

(assert (=> b!132013 m!155421))

(assert (=> bm!14468 d!40081))

(declare-fun bm!14492 () Bool)

(declare-fun call!14495 () Bool)

(assert (=> bm!14492 (= call!14495 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4601 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!132014 () Bool)

(declare-fun e!86073 () Bool)

(declare-fun e!86075 () Bool)

(assert (=> b!132014 (= e!86073 e!86075)))

(declare-fun lt!68854 () (_ BitVec 64))

(assert (=> b!132014 (= lt!68854 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!68855 () Unit!4116)

(assert (=> b!132014 (= lt!68855 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4601 (v!3187 (underlying!452 thiss!992))) lt!68854 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!132014 (arrayContainsKey!0 (_keys!4601 (v!3187 (underlying!452 thiss!992))) lt!68854 #b00000000000000000000000000000000)))

(declare-fun lt!68856 () Unit!4116)

(assert (=> b!132014 (= lt!68856 lt!68855)))

(declare-fun res!63581 () Bool)

(assert (=> b!132014 (= res!63581 (= (seekEntryOrOpen!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4601 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992)))) (Found!274 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!132014 (=> (not res!63581) (not e!86075))))

(declare-fun b!132015 () Bool)

(assert (=> b!132015 (= e!86075 call!14495)))

(declare-fun b!132016 () Bool)

(assert (=> b!132016 (= e!86073 call!14495)))

(declare-fun b!132017 () Bool)

(declare-fun e!86074 () Bool)

(assert (=> b!132017 (= e!86074 e!86073)))

(declare-fun c!24398 () Bool)

(assert (=> b!132017 (= c!24398 (validKeyInArray!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!40083 () Bool)

(declare-fun res!63580 () Bool)

(assert (=> d!40083 (=> res!63580 e!86074)))

(assert (=> d!40083 (= res!63580 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> d!40083 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4601 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992)))) e!86074)))

(assert (= (and d!40083 (not res!63580)) b!132017))

(assert (= (and b!132017 c!24398) b!132014))

(assert (= (and b!132017 (not c!24398)) b!132016))

(assert (= (and b!132014 res!63581) b!132015))

(assert (= (or b!132015 b!132016) bm!14492))

(declare-fun m!155423 () Bool)

(assert (=> bm!14492 m!155423))

(declare-fun m!155425 () Bool)

(assert (=> b!132014 m!155425))

(declare-fun m!155427 () Bool)

(assert (=> b!132014 m!155427))

(declare-fun m!155429 () Bool)

(assert (=> b!132014 m!155429))

(assert (=> b!132014 m!155425))

(declare-fun m!155431 () Bool)

(assert (=> b!132014 m!155431))

(assert (=> b!132017 m!155425))

(assert (=> b!132017 m!155425))

(declare-fun m!155433 () Bool)

(assert (=> b!132017 m!155433))

(assert (=> bm!14401 d!40083))

(declare-fun d!40085 () Bool)

(assert (=> d!40085 (= (map!1405 (_2!1321 lt!68694)) (getCurrentListMap!544 (_keys!4601 (_2!1321 lt!68694)) (_values!2837 (_2!1321 lt!68694)) (mask!7148 (_2!1321 lt!68694)) (extraKeys!2621 (_2!1321 lt!68694)) (zeroValue!2710 (_2!1321 lt!68694)) (minValue!2710 (_2!1321 lt!68694)) #b00000000000000000000000000000000 (defaultEntry!2854 (_2!1321 lt!68694))))))

(declare-fun bs!5460 () Bool)

(assert (= bs!5460 d!40085))

(declare-fun m!155435 () Bool)

(assert (=> bs!5460 m!155435))

(assert (=> bm!14450 d!40085))

(declare-fun lt!68876 () ListLongMap!1703)

(declare-fun b!132018 () Bool)

(declare-fun e!86083 () Bool)

(assert (=> b!132018 (= e!86083 (= (apply!115 lt!68876 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!24344 c!24346) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2710 newMap!16))))))

(declare-fun b!132019 () Bool)

(declare-fun res!63582 () Bool)

(declare-fun e!86080 () Bool)

(assert (=> b!132019 (=> (not res!63582) (not e!86080))))

(declare-fun e!86077 () Bool)

(assert (=> b!132019 (= res!63582 e!86077)))

(declare-fun res!63584 () Bool)

(assert (=> b!132019 (=> res!63584 e!86077)))

(declare-fun e!86087 () Bool)

(assert (=> b!132019 (= res!63584 (not e!86087))))

(declare-fun res!63589 () Bool)

(assert (=> b!132019 (=> (not res!63589) (not e!86087))))

(assert (=> b!132019 (= res!63589 (bvslt #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))

(declare-fun b!132020 () Bool)

(declare-fun e!86078 () Bool)

(assert (=> b!132020 (= e!86078 (validKeyInArray!0 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14493 () Bool)

(declare-fun call!14498 () ListLongMap!1703)

(declare-fun call!14500 () ListLongMap!1703)

(assert (=> bm!14493 (= call!14498 call!14500)))

(declare-fun b!132021 () Bool)

(declare-fun e!86082 () ListLongMap!1703)

(declare-fun e!86081 () ListLongMap!1703)

(assert (=> b!132021 (= e!86082 e!86081)))

(declare-fun c!24400 () Bool)

(assert (=> b!132021 (= c!24400 (and (not (= (bvand (ite c!24344 (ite c!24346 lt!68689 lt!68691) (extraKeys!2621 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!24344 (ite c!24346 lt!68689 lt!68691) (extraKeys!2621 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!132022 () Bool)

(declare-fun e!86079 () Bool)

(declare-fun call!14499 () Bool)

(assert (=> b!132022 (= e!86079 (not call!14499))))

(declare-fun b!132023 () Bool)

(assert (=> b!132023 (= e!86081 call!14498)))

(declare-fun b!132024 () Bool)

(declare-fun e!86085 () Bool)

(declare-fun e!86086 () Bool)

(assert (=> b!132024 (= e!86085 e!86086)))

(declare-fun res!63586 () Bool)

(declare-fun call!14497 () Bool)

(assert (=> b!132024 (= res!63586 call!14497)))

(assert (=> b!132024 (=> (not res!63586) (not e!86086))))

(declare-fun bm!14494 () Bool)

(assert (=> bm!14494 (= call!14499 (contains!895 lt!68876 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132025 () Bool)

(declare-fun e!86076 () ListLongMap!1703)

(declare-fun call!14502 () ListLongMap!1703)

(assert (=> b!132025 (= e!86076 call!14502)))

(declare-fun b!132026 () Bool)

(assert (=> b!132026 (= e!86079 e!86083)))

(declare-fun res!63588 () Bool)

(assert (=> b!132026 (= res!63588 call!14499)))

(assert (=> b!132026 (=> (not res!63588) (not e!86083))))

(declare-fun b!132027 () Bool)

(assert (=> b!132027 (= e!86086 (= (apply!115 lt!68876 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!24344 (ite c!24346 (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2710 newMap!16))))))

(declare-fun bm!14495 () Bool)

(assert (=> bm!14495 (= call!14497 (contains!895 lt!68876 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14496 () Bool)

(declare-fun call!14501 () ListLongMap!1703)

(assert (=> bm!14496 (= call!14502 call!14501)))

(declare-fun b!132028 () Bool)

(assert (=> b!132028 (= e!86076 call!14498)))

(declare-fun bm!14497 () Bool)

(declare-fun call!14496 () ListLongMap!1703)

(assert (=> bm!14497 (= call!14501 call!14496)))

(declare-fun b!132029 () Bool)

(assert (=> b!132029 (= e!86080 e!86085)))

(declare-fun c!24403 () Bool)

(assert (=> b!132029 (= c!24403 (not (= (bvand (ite c!24344 (ite c!24346 lt!68689 lt!68691) (extraKeys!2621 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!132030 () Bool)

(assert (=> b!132030 (= e!86087 (validKeyInArray!0 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!132031 () Bool)

(declare-fun e!86084 () Unit!4116)

(declare-fun Unit!4126 () Unit!4116)

(assert (=> b!132031 (= e!86084 Unit!4126)))

(declare-fun d!40087 () Bool)

(assert (=> d!40087 e!86080))

(declare-fun res!63587 () Bool)

(assert (=> d!40087 (=> (not res!63587) (not e!86080))))

(assert (=> d!40087 (= res!63587 (or (bvsge #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))))

(declare-fun lt!68871 () ListLongMap!1703)

(assert (=> d!40087 (= lt!68876 lt!68871)))

(declare-fun lt!68862 () Unit!4116)

(assert (=> d!40087 (= lt!68862 e!86084)))

(declare-fun c!24401 () Bool)

(assert (=> d!40087 (= c!24401 e!86078)))

(declare-fun res!63585 () Bool)

(assert (=> d!40087 (=> (not res!63585) (not e!86078))))

(assert (=> d!40087 (= res!63585 (bvslt #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))

(assert (=> d!40087 (= lt!68871 e!86082)))

(declare-fun c!24402 () Bool)

(assert (=> d!40087 (= c!24402 (and (not (= (bvand (ite c!24344 (ite c!24346 lt!68689 lt!68691) (extraKeys!2621 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!24344 (ite c!24346 lt!68689 lt!68691) (extraKeys!2621 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40087 (validMask!0 (mask!7148 newMap!16))))

(assert (=> d!40087 (= (getCurrentListMap!544 (_keys!4601 newMap!16) (ite (or c!24344 c!24334) (_values!2837 newMap!16) lt!68696) (mask!7148 newMap!16) (ite c!24344 (ite c!24346 lt!68689 lt!68691) (extraKeys!2621 newMap!16)) (ite (and c!24344 c!24346) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2710 newMap!16)) (ite c!24344 (ite c!24346 (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2710 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)) lt!68876)))

(declare-fun bm!14498 () Bool)

(assert (=> bm!14498 (= call!14500 (+!174 (ite c!24402 call!14496 (ite c!24400 call!14501 call!14502)) (ite (or c!24402 c!24400) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!24344 c!24346) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2710 newMap!16))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!24344 (ite c!24346 (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2710 newMap!16))))))))

(declare-fun bm!14499 () Bool)

(assert (=> bm!14499 (= call!14496 (getCurrentListMapNoExtraKeys!140 (_keys!4601 newMap!16) (ite (or c!24344 c!24334) (_values!2837 newMap!16) lt!68696) (mask!7148 newMap!16) (ite c!24344 (ite c!24346 lt!68689 lt!68691) (extraKeys!2621 newMap!16)) (ite (and c!24344 c!24346) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2710 newMap!16)) (ite c!24344 (ite c!24346 (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2710 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun b!132032 () Bool)

(declare-fun e!86088 () Bool)

(assert (=> b!132032 (= e!86077 e!86088)))

(declare-fun res!63590 () Bool)

(assert (=> b!132032 (=> (not res!63590) (not e!86088))))

(assert (=> b!132032 (= res!63590 (contains!895 lt!68876 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!132032 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))

(declare-fun b!132033 () Bool)

(assert (=> b!132033 (= e!86088 (= (apply!115 lt!68876 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)) (get!1475 (select (arr!2256 (ite (or c!24344 c!24334) (_values!2837 newMap!16) lt!68696)) #b00000000000000000000000000000000) (dynLambda!423 (defaultEntry!2854 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!132033 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2524 (ite (or c!24344 c!24334) (_values!2837 newMap!16) lt!68696))))))

(assert (=> b!132033 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))

(declare-fun b!132034 () Bool)

(assert (=> b!132034 (= e!86085 (not call!14497))))

(declare-fun b!132035 () Bool)

(declare-fun res!63583 () Bool)

(assert (=> b!132035 (=> (not res!63583) (not e!86080))))

(assert (=> b!132035 (= res!63583 e!86079)))

(declare-fun c!24404 () Bool)

(assert (=> b!132035 (= c!24404 (not (= (bvand (ite c!24344 (ite c!24346 lt!68689 lt!68691) (extraKeys!2621 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!132036 () Bool)

(assert (=> b!132036 (= e!86082 (+!174 call!14500 (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!24344 (ite c!24346 (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2710 newMap!16)))))))

(declare-fun c!24399 () Bool)

(declare-fun b!132037 () Bool)

(assert (=> b!132037 (= c!24399 (and (not (= (bvand (ite c!24344 (ite c!24346 lt!68689 lt!68691) (extraKeys!2621 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!24344 (ite c!24346 lt!68689 lt!68691) (extraKeys!2621 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!132037 (= e!86081 e!86076)))

(declare-fun b!132038 () Bool)

(declare-fun lt!68868 () Unit!4116)

(assert (=> b!132038 (= e!86084 lt!68868)))

(declare-fun lt!68857 () ListLongMap!1703)

(assert (=> b!132038 (= lt!68857 (getCurrentListMapNoExtraKeys!140 (_keys!4601 newMap!16) (ite (or c!24344 c!24334) (_values!2837 newMap!16) lt!68696) (mask!7148 newMap!16) (ite c!24344 (ite c!24346 lt!68689 lt!68691) (extraKeys!2621 newMap!16)) (ite (and c!24344 c!24346) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2710 newMap!16)) (ite c!24344 (ite c!24346 (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2710 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68863 () (_ BitVec 64))

(assert (=> b!132038 (= lt!68863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68878 () (_ BitVec 64))

(assert (=> b!132038 (= lt!68878 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68866 () Unit!4116)

(assert (=> b!132038 (= lt!68866 (addStillContains!91 lt!68857 lt!68863 (ite (and c!24344 c!24346) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2710 newMap!16)) lt!68878))))

(assert (=> b!132038 (contains!895 (+!174 lt!68857 (tuple2!2619 lt!68863 (ite (and c!24344 c!24346) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2710 newMap!16)))) lt!68878)))

(declare-fun lt!68859 () Unit!4116)

(assert (=> b!132038 (= lt!68859 lt!68866)))

(declare-fun lt!68864 () ListLongMap!1703)

(assert (=> b!132038 (= lt!68864 (getCurrentListMapNoExtraKeys!140 (_keys!4601 newMap!16) (ite (or c!24344 c!24334) (_values!2837 newMap!16) lt!68696) (mask!7148 newMap!16) (ite c!24344 (ite c!24346 lt!68689 lt!68691) (extraKeys!2621 newMap!16)) (ite (and c!24344 c!24346) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2710 newMap!16)) (ite c!24344 (ite c!24346 (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2710 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68872 () (_ BitVec 64))

(assert (=> b!132038 (= lt!68872 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68873 () (_ BitVec 64))

(assert (=> b!132038 (= lt!68873 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68870 () Unit!4116)

(assert (=> b!132038 (= lt!68870 (addApplyDifferent!91 lt!68864 lt!68872 (ite c!24344 (ite c!24346 (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2710 newMap!16)) lt!68873))))

(assert (=> b!132038 (= (apply!115 (+!174 lt!68864 (tuple2!2619 lt!68872 (ite c!24344 (ite c!24346 (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2710 newMap!16)))) lt!68873) (apply!115 lt!68864 lt!68873))))

(declare-fun lt!68874 () Unit!4116)

(assert (=> b!132038 (= lt!68874 lt!68870)))

(declare-fun lt!68867 () ListLongMap!1703)

(assert (=> b!132038 (= lt!68867 (getCurrentListMapNoExtraKeys!140 (_keys!4601 newMap!16) (ite (or c!24344 c!24334) (_values!2837 newMap!16) lt!68696) (mask!7148 newMap!16) (ite c!24344 (ite c!24346 lt!68689 lt!68691) (extraKeys!2621 newMap!16)) (ite (and c!24344 c!24346) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2710 newMap!16)) (ite c!24344 (ite c!24346 (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2710 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68869 () (_ BitVec 64))

(assert (=> b!132038 (= lt!68869 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68861 () (_ BitVec 64))

(assert (=> b!132038 (= lt!68861 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68875 () Unit!4116)

(assert (=> b!132038 (= lt!68875 (addApplyDifferent!91 lt!68867 lt!68869 (ite (and c!24344 c!24346) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2710 newMap!16)) lt!68861))))

(assert (=> b!132038 (= (apply!115 (+!174 lt!68867 (tuple2!2619 lt!68869 (ite (and c!24344 c!24346) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2710 newMap!16)))) lt!68861) (apply!115 lt!68867 lt!68861))))

(declare-fun lt!68877 () Unit!4116)

(assert (=> b!132038 (= lt!68877 lt!68875)))

(declare-fun lt!68860 () ListLongMap!1703)

(assert (=> b!132038 (= lt!68860 (getCurrentListMapNoExtraKeys!140 (_keys!4601 newMap!16) (ite (or c!24344 c!24334) (_values!2837 newMap!16) lt!68696) (mask!7148 newMap!16) (ite c!24344 (ite c!24346 lt!68689 lt!68691) (extraKeys!2621 newMap!16)) (ite (and c!24344 c!24346) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2710 newMap!16)) (ite c!24344 (ite c!24346 (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2710 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68865 () (_ BitVec 64))

(assert (=> b!132038 (= lt!68865 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68858 () (_ BitVec 64))

(assert (=> b!132038 (= lt!68858 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!132038 (= lt!68868 (addApplyDifferent!91 lt!68860 lt!68865 (ite c!24344 (ite c!24346 (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2710 newMap!16)) lt!68858))))

(assert (=> b!132038 (= (apply!115 (+!174 lt!68860 (tuple2!2619 lt!68865 (ite c!24344 (ite c!24346 (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2710 newMap!16)))) lt!68858) (apply!115 lt!68860 lt!68858))))

(assert (= (and d!40087 c!24402) b!132036))

(assert (= (and d!40087 (not c!24402)) b!132021))

(assert (= (and b!132021 c!24400) b!132023))

(assert (= (and b!132021 (not c!24400)) b!132037))

(assert (= (and b!132037 c!24399) b!132028))

(assert (= (and b!132037 (not c!24399)) b!132025))

(assert (= (or b!132028 b!132025) bm!14496))

(assert (= (or b!132023 bm!14496) bm!14497))

(assert (= (or b!132023 b!132028) bm!14493))

(assert (= (or b!132036 bm!14497) bm!14499))

(assert (= (or b!132036 bm!14493) bm!14498))

(assert (= (and d!40087 res!63585) b!132020))

(assert (= (and d!40087 c!24401) b!132038))

(assert (= (and d!40087 (not c!24401)) b!132031))

(assert (= (and d!40087 res!63587) b!132019))

(assert (= (and b!132019 res!63589) b!132030))

(assert (= (and b!132019 (not res!63584)) b!132032))

(assert (= (and b!132032 res!63590) b!132033))

(assert (= (and b!132019 res!63582) b!132035))

(assert (= (and b!132035 c!24404) b!132026))

(assert (= (and b!132035 (not c!24404)) b!132022))

(assert (= (and b!132026 res!63588) b!132018))

(assert (= (or b!132026 b!132022) bm!14494))

(assert (= (and b!132035 res!63583) b!132029))

(assert (= (and b!132029 c!24403) b!132024))

(assert (= (and b!132029 (not c!24403)) b!132034))

(assert (= (and b!132024 res!63586) b!132027))

(assert (= (or b!132024 b!132034) bm!14495))

(declare-fun b_lambda!5871 () Bool)

(assert (=> (not b_lambda!5871) (not b!132033)))

(declare-fun tb!2405 () Bool)

(declare-fun t!6156 () Bool)

(assert (=> (and b!131538 (= (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) (defaultEntry!2854 newMap!16)) t!6156) tb!2405))

(declare-fun result!3973 () Bool)

(assert (=> tb!2405 (= result!3973 tp_is_empty!2871)))

(assert (=> b!132033 t!6156))

(declare-fun b_and!8175 () Bool)

(assert (= b_and!8171 (and (=> t!6156 result!3973) b_and!8175)))

(declare-fun t!6158 () Bool)

(declare-fun tb!2407 () Bool)

(assert (=> (and b!131534 (= (defaultEntry!2854 newMap!16) (defaultEntry!2854 newMap!16)) t!6158) tb!2407))

(declare-fun result!3975 () Bool)

(assert (= result!3975 result!3973))

(assert (=> b!132033 t!6158))

(declare-fun b_and!8177 () Bool)

(assert (= b_and!8173 (and (=> t!6158 result!3975) b_and!8177)))

(assert (=> d!40087 m!155247))

(declare-fun m!155437 () Bool)

(assert (=> bm!14494 m!155437))

(declare-fun m!155439 () Bool)

(assert (=> b!132018 m!155439))

(assert (=> b!132032 m!155315))

(assert (=> b!132032 m!155315))

(declare-fun m!155441 () Bool)

(assert (=> b!132032 m!155441))

(declare-fun m!155443 () Bool)

(assert (=> b!132038 m!155443))

(declare-fun m!155445 () Bool)

(assert (=> b!132038 m!155445))

(declare-fun m!155447 () Bool)

(assert (=> b!132038 m!155447))

(declare-fun m!155449 () Bool)

(assert (=> b!132038 m!155449))

(declare-fun m!155451 () Bool)

(assert (=> b!132038 m!155451))

(assert (=> b!132038 m!155445))

(declare-fun m!155453 () Bool)

(assert (=> b!132038 m!155453))

(declare-fun m!155455 () Bool)

(assert (=> b!132038 m!155455))

(declare-fun m!155457 () Bool)

(assert (=> b!132038 m!155457))

(declare-fun m!155459 () Bool)

(assert (=> b!132038 m!155459))

(declare-fun m!155461 () Bool)

(assert (=> b!132038 m!155461))

(assert (=> b!132038 m!155315))

(declare-fun m!155463 () Bool)

(assert (=> b!132038 m!155463))

(declare-fun m!155465 () Bool)

(assert (=> b!132038 m!155465))

(assert (=> b!132038 m!155449))

(assert (=> b!132038 m!155455))

(declare-fun m!155467 () Bool)

(assert (=> b!132038 m!155467))

(declare-fun m!155469 () Bool)

(assert (=> b!132038 m!155469))

(declare-fun m!155471 () Bool)

(assert (=> b!132038 m!155471))

(assert (=> b!132038 m!155469))

(declare-fun m!155473 () Bool)

(assert (=> b!132038 m!155473))

(assert (=> b!132020 m!155315))

(assert (=> b!132020 m!155315))

(assert (=> b!132020 m!155317))

(assert (=> bm!14499 m!155463))

(assert (=> b!132030 m!155315))

(assert (=> b!132030 m!155315))

(assert (=> b!132030 m!155317))

(declare-fun m!155475 () Bool)

(assert (=> b!132033 m!155475))

(assert (=> b!132033 m!155475))

(declare-fun m!155477 () Bool)

(assert (=> b!132033 m!155477))

(declare-fun m!155479 () Bool)

(assert (=> b!132033 m!155479))

(assert (=> b!132033 m!155315))

(declare-fun m!155481 () Bool)

(assert (=> b!132033 m!155481))

(assert (=> b!132033 m!155315))

(assert (=> b!132033 m!155477))

(declare-fun m!155483 () Bool)

(assert (=> bm!14495 m!155483))

(declare-fun m!155485 () Bool)

(assert (=> b!132036 m!155485))

(declare-fun m!155487 () Bool)

(assert (=> b!132027 m!155487))

(declare-fun m!155489 () Bool)

(assert (=> bm!14498 m!155489))

(assert (=> bm!14459 d!40087))

(declare-fun d!40089 () Bool)

(assert (=> d!40089 (= (apply!115 lt!68582 lt!68591) (get!1479 (getValueByKey!171 (toList!867 lt!68582) lt!68591)))))

(declare-fun bs!5461 () Bool)

(assert (= bs!5461 d!40089))

(declare-fun m!155491 () Bool)

(assert (=> bs!5461 m!155491))

(assert (=> bs!5461 m!155491))

(declare-fun m!155493 () Bool)

(assert (=> bs!5461 m!155493))

(assert (=> b!131678 d!40089))

(declare-fun d!40091 () Bool)

(assert (=> d!40091 (= (apply!115 lt!68585 lt!68579) (get!1479 (getValueByKey!171 (toList!867 lt!68585) lt!68579)))))

(declare-fun bs!5462 () Bool)

(assert (= bs!5462 d!40091))

(declare-fun m!155495 () Bool)

(assert (=> bs!5462 m!155495))

(assert (=> bs!5462 m!155495))

(declare-fun m!155497 () Bool)

(assert (=> bs!5462 m!155497))

(assert (=> b!131678 d!40091))

(assert (=> b!131678 d!40059))

(declare-fun d!40093 () Bool)

(declare-fun e!86089 () Bool)

(assert (=> d!40093 e!86089))

(declare-fun res!63592 () Bool)

(assert (=> d!40093 (=> (not res!63592) (not e!86089))))

(declare-fun lt!68880 () ListLongMap!1703)

(assert (=> d!40093 (= res!63592 (contains!895 lt!68880 (_1!1320 (tuple2!2619 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun lt!68881 () List!1714)

(assert (=> d!40093 (= lt!68880 (ListLongMap!1704 lt!68881))))

(declare-fun lt!68882 () Unit!4116)

(declare-fun lt!68879 () Unit!4116)

(assert (=> d!40093 (= lt!68882 lt!68879)))

(assert (=> d!40093 (= (getValueByKey!171 lt!68881 (_1!1320 (tuple2!2619 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))) (Some!176 (_2!1320 (tuple2!2619 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40093 (= lt!68879 (lemmaContainsTupThenGetReturnValue!86 lt!68881 (_1!1320 (tuple2!2619 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))) (_2!1320 (tuple2!2619 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40093 (= lt!68881 (insertStrictlySorted!89 (toList!867 lt!68585) (_1!1320 (tuple2!2619 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))) (_2!1320 (tuple2!2619 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40093 (= (+!174 lt!68585 (tuple2!2619 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68880)))

(declare-fun b!132039 () Bool)

(declare-fun res!63591 () Bool)

(assert (=> b!132039 (=> (not res!63591) (not e!86089))))

(assert (=> b!132039 (= res!63591 (= (getValueByKey!171 (toList!867 lt!68880) (_1!1320 (tuple2!2619 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))) (Some!176 (_2!1320 (tuple2!2619 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))))))))

(declare-fun b!132040 () Bool)

(assert (=> b!132040 (= e!86089 (contains!898 (toList!867 lt!68880) (tuple2!2619 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))))))

(assert (= (and d!40093 res!63592) b!132039))

(assert (= (and b!132039 res!63591) b!132040))

(declare-fun m!155499 () Bool)

(assert (=> d!40093 m!155499))

(declare-fun m!155501 () Bool)

(assert (=> d!40093 m!155501))

(declare-fun m!155503 () Bool)

(assert (=> d!40093 m!155503))

(declare-fun m!155505 () Bool)

(assert (=> d!40093 m!155505))

(declare-fun m!155507 () Bool)

(assert (=> b!132039 m!155507))

(declare-fun m!155509 () Bool)

(assert (=> b!132040 m!155509))

(assert (=> b!131678 d!40093))

(declare-fun d!40095 () Bool)

(assert (=> d!40095 (= (apply!115 (+!174 lt!68585 (tuple2!2619 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68579) (apply!115 lt!68585 lt!68579))))

(declare-fun lt!68885 () Unit!4116)

(declare-fun choose!811 (ListLongMap!1703 (_ BitVec 64) V!3475 (_ BitVec 64)) Unit!4116)

(assert (=> d!40095 (= lt!68885 (choose!811 lt!68585 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) lt!68579))))

(declare-fun e!86092 () Bool)

(assert (=> d!40095 e!86092))

(declare-fun res!63595 () Bool)

(assert (=> d!40095 (=> (not res!63595) (not e!86092))))

(assert (=> d!40095 (= res!63595 (contains!895 lt!68585 lt!68579))))

(assert (=> d!40095 (= (addApplyDifferent!91 lt!68585 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) lt!68579) lt!68885)))

(declare-fun b!132044 () Bool)

(assert (=> b!132044 (= e!86092 (not (= lt!68579 lt!68587)))))

(assert (= (and d!40095 res!63595) b!132044))

(assert (=> d!40095 m!155111))

(assert (=> d!40095 m!155113))

(assert (=> d!40095 m!155119))

(declare-fun m!155511 () Bool)

(assert (=> d!40095 m!155511))

(assert (=> d!40095 m!155111))

(declare-fun m!155513 () Bool)

(assert (=> d!40095 m!155513))

(assert (=> b!131678 d!40095))

(declare-fun d!40097 () Bool)

(declare-fun e!86093 () Bool)

(assert (=> d!40097 e!86093))

(declare-fun res!63597 () Bool)

(assert (=> d!40097 (=> (not res!63597) (not e!86093))))

(declare-fun lt!68887 () ListLongMap!1703)

(assert (=> d!40097 (= res!63597 (contains!895 lt!68887 (_1!1320 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun lt!68888 () List!1714)

(assert (=> d!40097 (= lt!68887 (ListLongMap!1704 lt!68888))))

(declare-fun lt!68889 () Unit!4116)

(declare-fun lt!68886 () Unit!4116)

(assert (=> d!40097 (= lt!68889 lt!68886)))

(assert (=> d!40097 (= (getValueByKey!171 lt!68888 (_1!1320 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))) (Some!176 (_2!1320 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40097 (= lt!68886 (lemmaContainsTupThenGetReturnValue!86 lt!68888 (_1!1320 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))) (_2!1320 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40097 (= lt!68888 (insertStrictlySorted!89 (toList!867 lt!68575) (_1!1320 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))) (_2!1320 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40097 (= (+!174 lt!68575 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68887)))

(declare-fun b!132045 () Bool)

(declare-fun res!63596 () Bool)

(assert (=> b!132045 (=> (not res!63596) (not e!86093))))

(assert (=> b!132045 (= res!63596 (= (getValueByKey!171 (toList!867 lt!68887) (_1!1320 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))) (Some!176 (_2!1320 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))))))))

(declare-fun b!132046 () Bool)

(assert (=> b!132046 (= e!86093 (contains!898 (toList!867 lt!68887) (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))))))

(assert (= (and d!40097 res!63597) b!132045))

(assert (= (and b!132045 res!63596) b!132046))

(declare-fun m!155515 () Bool)

(assert (=> d!40097 m!155515))

(declare-fun m!155517 () Bool)

(assert (=> d!40097 m!155517))

(declare-fun m!155519 () Bool)

(assert (=> d!40097 m!155519))

(declare-fun m!155521 () Bool)

(assert (=> d!40097 m!155521))

(declare-fun m!155523 () Bool)

(assert (=> b!132045 m!155523))

(declare-fun m!155525 () Bool)

(assert (=> b!132046 m!155525))

(assert (=> b!131678 d!40097))

(declare-fun d!40099 () Bool)

(assert (=> d!40099 (contains!895 (+!174 lt!68575 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68596)))

(declare-fun lt!68892 () Unit!4116)

(declare-fun choose!812 (ListLongMap!1703 (_ BitVec 64) V!3475 (_ BitVec 64)) Unit!4116)

(assert (=> d!40099 (= lt!68892 (choose!812 lt!68575 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) lt!68596))))

(assert (=> d!40099 (contains!895 lt!68575 lt!68596)))

(assert (=> d!40099 (= (addStillContains!91 lt!68575 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))) lt!68596) lt!68892)))

(declare-fun bs!5463 () Bool)

(assert (= bs!5463 d!40099))

(assert (=> bs!5463 m!155121))

(assert (=> bs!5463 m!155121))

(assert (=> bs!5463 m!155123))

(declare-fun m!155527 () Bool)

(assert (=> bs!5463 m!155527))

(declare-fun m!155529 () Bool)

(assert (=> bs!5463 m!155529))

(assert (=> b!131678 d!40099))

(declare-fun d!40101 () Bool)

(assert (=> d!40101 (= (apply!115 (+!174 lt!68578 (tuple2!2619 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68576) (apply!115 lt!68578 lt!68576))))

(declare-fun lt!68893 () Unit!4116)

(assert (=> d!40101 (= lt!68893 (choose!811 lt!68578 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992))) lt!68576))))

(declare-fun e!86094 () Bool)

(assert (=> d!40101 e!86094))

(declare-fun res!63598 () Bool)

(assert (=> d!40101 (=> (not res!63598) (not e!86094))))

(assert (=> d!40101 (= res!63598 (contains!895 lt!68578 lt!68576))))

(assert (=> d!40101 (= (addApplyDifferent!91 lt!68578 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992))) lt!68576) lt!68893)))

(declare-fun b!132048 () Bool)

(assert (=> b!132048 (= e!86094 (not (= lt!68576 lt!68583)))))

(assert (= (and d!40101 res!63598) b!132048))

(assert (=> d!40101 m!155115))

(assert (=> d!40101 m!155117))

(assert (=> d!40101 m!155127))

(declare-fun m!155531 () Bool)

(assert (=> d!40101 m!155531))

(assert (=> d!40101 m!155115))

(declare-fun m!155533 () Bool)

(assert (=> d!40101 m!155533))

(assert (=> b!131678 d!40101))

(declare-fun d!40103 () Bool)

(assert (=> d!40103 (= (apply!115 (+!174 lt!68582 (tuple2!2619 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68591) (get!1479 (getValueByKey!171 (toList!867 (+!174 lt!68582 (tuple2!2619 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))) lt!68591)))))

(declare-fun bs!5464 () Bool)

(assert (= bs!5464 d!40103))

(declare-fun m!155535 () Bool)

(assert (=> bs!5464 m!155535))

(assert (=> bs!5464 m!155535))

(declare-fun m!155537 () Bool)

(assert (=> bs!5464 m!155537))

(assert (=> b!131678 d!40103))

(declare-fun d!40105 () Bool)

(declare-fun e!86096 () Bool)

(assert (=> d!40105 e!86096))

(declare-fun res!63599 () Bool)

(assert (=> d!40105 (=> res!63599 e!86096)))

(declare-fun lt!68896 () Bool)

(assert (=> d!40105 (= res!63599 (not lt!68896))))

(declare-fun lt!68895 () Bool)

(assert (=> d!40105 (= lt!68896 lt!68895)))

(declare-fun lt!68894 () Unit!4116)

(declare-fun e!86095 () Unit!4116)

(assert (=> d!40105 (= lt!68894 e!86095)))

(declare-fun c!24405 () Bool)

(assert (=> d!40105 (= c!24405 lt!68895)))

(assert (=> d!40105 (= lt!68895 (containsKey!175 (toList!867 (+!174 lt!68575 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))) lt!68596))))

(assert (=> d!40105 (= (contains!895 (+!174 lt!68575 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68596) lt!68896)))

(declare-fun b!132049 () Bool)

(declare-fun lt!68897 () Unit!4116)

(assert (=> b!132049 (= e!86095 lt!68897)))

(assert (=> b!132049 (= lt!68897 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!867 (+!174 lt!68575 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))) lt!68596))))

(assert (=> b!132049 (isDefined!124 (getValueByKey!171 (toList!867 (+!174 lt!68575 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))) lt!68596))))

(declare-fun b!132050 () Bool)

(declare-fun Unit!4127 () Unit!4116)

(assert (=> b!132050 (= e!86095 Unit!4127)))

(declare-fun b!132051 () Bool)

(assert (=> b!132051 (= e!86096 (isDefined!124 (getValueByKey!171 (toList!867 (+!174 lt!68575 (tuple2!2619 lt!68581 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))) lt!68596)))))

(assert (= (and d!40105 c!24405) b!132049))

(assert (= (and d!40105 (not c!24405)) b!132050))

(assert (= (and d!40105 (not res!63599)) b!132051))

(declare-fun m!155539 () Bool)

(assert (=> d!40105 m!155539))

(declare-fun m!155541 () Bool)

(assert (=> b!132049 m!155541))

(declare-fun m!155543 () Bool)

(assert (=> b!132049 m!155543))

(assert (=> b!132049 m!155543))

(declare-fun m!155545 () Bool)

(assert (=> b!132049 m!155545))

(assert (=> b!132051 m!155543))

(assert (=> b!132051 m!155543))

(assert (=> b!132051 m!155545))

(assert (=> b!131678 d!40105))

(declare-fun d!40107 () Bool)

(declare-fun e!86097 () Bool)

(assert (=> d!40107 e!86097))

(declare-fun res!63601 () Bool)

(assert (=> d!40107 (=> (not res!63601) (not e!86097))))

(declare-fun lt!68899 () ListLongMap!1703)

(assert (=> d!40107 (= res!63601 (contains!895 lt!68899 (_1!1320 (tuple2!2619 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun lt!68900 () List!1714)

(assert (=> d!40107 (= lt!68899 (ListLongMap!1704 lt!68900))))

(declare-fun lt!68901 () Unit!4116)

(declare-fun lt!68898 () Unit!4116)

(assert (=> d!40107 (= lt!68901 lt!68898)))

(assert (=> d!40107 (= (getValueByKey!171 lt!68900 (_1!1320 (tuple2!2619 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))) (Some!176 (_2!1320 (tuple2!2619 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40107 (= lt!68898 (lemmaContainsTupThenGetReturnValue!86 lt!68900 (_1!1320 (tuple2!2619 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992))))) (_2!1320 (tuple2!2619 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40107 (= lt!68900 (insertStrictlySorted!89 (toList!867 lt!68582) (_1!1320 (tuple2!2619 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992))))) (_2!1320 (tuple2!2619 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40107 (= (+!174 lt!68582 (tuple2!2619 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68899)))

(declare-fun b!132052 () Bool)

(declare-fun res!63600 () Bool)

(assert (=> b!132052 (=> (not res!63600) (not e!86097))))

(assert (=> b!132052 (= res!63600 (= (getValueByKey!171 (toList!867 lt!68899) (_1!1320 (tuple2!2619 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))) (Some!176 (_2!1320 (tuple2!2619 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992))))))))))

(declare-fun b!132053 () Bool)

(assert (=> b!132053 (= e!86097 (contains!898 (toList!867 lt!68899) (tuple2!2619 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992))))))))

(assert (= (and d!40107 res!63601) b!132052))

(assert (= (and b!132052 res!63600) b!132053))

(declare-fun m!155547 () Bool)

(assert (=> d!40107 m!155547))

(declare-fun m!155549 () Bool)

(assert (=> d!40107 m!155549))

(declare-fun m!155551 () Bool)

(assert (=> d!40107 m!155551))

(declare-fun m!155553 () Bool)

(assert (=> d!40107 m!155553))

(declare-fun m!155555 () Bool)

(assert (=> b!132052 m!155555))

(declare-fun m!155557 () Bool)

(assert (=> b!132053 m!155557))

(assert (=> b!131678 d!40107))

(declare-fun d!40109 () Bool)

(assert (=> d!40109 (= (apply!115 lt!68578 lt!68576) (get!1479 (getValueByKey!171 (toList!867 lt!68578) lt!68576)))))

(declare-fun bs!5465 () Bool)

(assert (= bs!5465 d!40109))

(declare-fun m!155559 () Bool)

(assert (=> bs!5465 m!155559))

(assert (=> bs!5465 m!155559))

(declare-fun m!155561 () Bool)

(assert (=> bs!5465 m!155561))

(assert (=> b!131678 d!40109))

(declare-fun d!40111 () Bool)

(assert (=> d!40111 (= (apply!115 (+!174 lt!68585 (tuple2!2619 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68579) (get!1479 (getValueByKey!171 (toList!867 (+!174 lt!68585 (tuple2!2619 lt!68587 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))))) lt!68579)))))

(declare-fun bs!5466 () Bool)

(assert (= bs!5466 d!40111))

(declare-fun m!155563 () Bool)

(assert (=> bs!5466 m!155563))

(assert (=> bs!5466 m!155563))

(declare-fun m!155565 () Bool)

(assert (=> bs!5466 m!155565))

(assert (=> b!131678 d!40111))

(declare-fun d!40113 () Bool)

(declare-fun e!86098 () Bool)

(assert (=> d!40113 e!86098))

(declare-fun res!63603 () Bool)

(assert (=> d!40113 (=> (not res!63603) (not e!86098))))

(declare-fun lt!68903 () ListLongMap!1703)

(assert (=> d!40113 (= res!63603 (contains!895 lt!68903 (_1!1320 (tuple2!2619 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun lt!68904 () List!1714)

(assert (=> d!40113 (= lt!68903 (ListLongMap!1704 lt!68904))))

(declare-fun lt!68905 () Unit!4116)

(declare-fun lt!68902 () Unit!4116)

(assert (=> d!40113 (= lt!68905 lt!68902)))

(assert (=> d!40113 (= (getValueByKey!171 lt!68904 (_1!1320 (tuple2!2619 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))) (Some!176 (_2!1320 (tuple2!2619 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40113 (= lt!68902 (lemmaContainsTupThenGetReturnValue!86 lt!68904 (_1!1320 (tuple2!2619 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992))))) (_2!1320 (tuple2!2619 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40113 (= lt!68904 (insertStrictlySorted!89 (toList!867 lt!68578) (_1!1320 (tuple2!2619 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992))))) (_2!1320 (tuple2!2619 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40113 (= (+!174 lt!68578 (tuple2!2619 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68903)))

(declare-fun b!132054 () Bool)

(declare-fun res!63602 () Bool)

(assert (=> b!132054 (=> (not res!63602) (not e!86098))))

(assert (=> b!132054 (= res!63602 (= (getValueByKey!171 (toList!867 lt!68903) (_1!1320 (tuple2!2619 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))) (Some!176 (_2!1320 (tuple2!2619 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992))))))))))

(declare-fun b!132055 () Bool)

(assert (=> b!132055 (= e!86098 (contains!898 (toList!867 lt!68903) (tuple2!2619 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992))))))))

(assert (= (and d!40113 res!63603) b!132054))

(assert (= (and b!132054 res!63602) b!132055))

(declare-fun m!155567 () Bool)

(assert (=> d!40113 m!155567))

(declare-fun m!155569 () Bool)

(assert (=> d!40113 m!155569))

(declare-fun m!155571 () Bool)

(assert (=> d!40113 m!155571))

(declare-fun m!155573 () Bool)

(assert (=> d!40113 m!155573))

(declare-fun m!155575 () Bool)

(assert (=> b!132054 m!155575))

(declare-fun m!155577 () Bool)

(assert (=> b!132055 m!155577))

(assert (=> b!131678 d!40113))

(declare-fun d!40115 () Bool)

(assert (=> d!40115 (= (apply!115 (+!174 lt!68578 (tuple2!2619 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68576) (get!1479 (getValueByKey!171 (toList!867 (+!174 lt!68578 (tuple2!2619 lt!68583 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))) lt!68576)))))

(declare-fun bs!5467 () Bool)

(assert (= bs!5467 d!40115))

(declare-fun m!155579 () Bool)

(assert (=> bs!5467 m!155579))

(assert (=> bs!5467 m!155579))

(declare-fun m!155581 () Bool)

(assert (=> bs!5467 m!155581))

(assert (=> b!131678 d!40115))

(declare-fun d!40117 () Bool)

(assert (=> d!40117 (= (apply!115 (+!174 lt!68582 (tuple2!2619 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68591) (apply!115 lt!68582 lt!68591))))

(declare-fun lt!68906 () Unit!4116)

(assert (=> d!40117 (= lt!68906 (choose!811 lt!68582 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992))) lt!68591))))

(declare-fun e!86099 () Bool)

(assert (=> d!40117 e!86099))

(declare-fun res!63604 () Bool)

(assert (=> d!40117 (=> (not res!63604) (not e!86099))))

(assert (=> d!40117 (= res!63604 (contains!895 lt!68582 lt!68591))))

(assert (=> d!40117 (= (addApplyDifferent!91 lt!68582 lt!68590 (minValue!2710 (v!3187 (underlying!452 thiss!992))) lt!68591) lt!68906)))

(declare-fun b!132056 () Bool)

(assert (=> b!132056 (= e!86099 (not (= lt!68591 lt!68590)))))

(assert (= (and d!40117 res!63604) b!132056))

(assert (=> d!40117 m!155135))

(assert (=> d!40117 m!155139))

(assert (=> d!40117 m!155131))

(declare-fun m!155583 () Bool)

(assert (=> d!40117 m!155583))

(assert (=> d!40117 m!155135))

(declare-fun m!155585 () Bool)

(assert (=> d!40117 m!155585))

(assert (=> b!131678 d!40117))

(assert (=> b!131818 d!40067))

(assert (=> b!131660 d!40061))

(declare-fun d!40119 () Bool)

(declare-fun e!86100 () Bool)

(assert (=> d!40119 e!86100))

(declare-fun res!63606 () Bool)

(assert (=> d!40119 (=> (not res!63606) (not e!86100))))

(declare-fun lt!68908 () ListLongMap!1703)

(assert (=> d!40119 (= res!63606 (contains!895 lt!68908 (_1!1320 (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun lt!68909 () List!1714)

(assert (=> d!40119 (= lt!68908 (ListLongMap!1704 lt!68909))))

(declare-fun lt!68910 () Unit!4116)

(declare-fun lt!68907 () Unit!4116)

(assert (=> d!40119 (= lt!68910 lt!68907)))

(assert (=> d!40119 (= (getValueByKey!171 lt!68909 (_1!1320 (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))) (Some!176 (_2!1320 (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40119 (= lt!68907 (lemmaContainsTupThenGetReturnValue!86 lt!68909 (_1!1320 (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992))))) (_2!1320 (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40119 (= lt!68909 (insertStrictlySorted!89 (toList!867 call!14399) (_1!1320 (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992))))) (_2!1320 (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40119 (= (+!174 call!14399 (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992))))) lt!68908)))

(declare-fun b!132057 () Bool)

(declare-fun res!63605 () Bool)

(assert (=> b!132057 (=> (not res!63605) (not e!86100))))

(assert (=> b!132057 (= res!63605 (= (getValueByKey!171 (toList!867 lt!68908) (_1!1320 (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))) (Some!176 (_2!1320 (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992))))))))))

(declare-fun b!132058 () Bool)

(assert (=> b!132058 (= e!86100 (contains!898 (toList!867 lt!68908) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992))))))))

(assert (= (and d!40119 res!63606) b!132057))

(assert (= (and b!132057 res!63605) b!132058))

(declare-fun m!155587 () Bool)

(assert (=> d!40119 m!155587))

(declare-fun m!155589 () Bool)

(assert (=> d!40119 m!155589))

(declare-fun m!155591 () Bool)

(assert (=> d!40119 m!155591))

(declare-fun m!155593 () Bool)

(assert (=> d!40119 m!155593))

(declare-fun m!155595 () Bool)

(assert (=> b!132057 m!155595))

(declare-fun m!155597 () Bool)

(assert (=> b!132058 m!155597))

(assert (=> b!131676 d!40119))

(declare-fun b!132059 () Bool)

(declare-fun e!86108 () Bool)

(declare-fun lt!68930 () ListLongMap!1703)

(assert (=> b!132059 (= e!86108 (= (apply!115 lt!68930 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2710 newMap!16)))))

(declare-fun b!132060 () Bool)

(declare-fun res!63607 () Bool)

(declare-fun e!86105 () Bool)

(assert (=> b!132060 (=> (not res!63607) (not e!86105))))

(declare-fun e!86102 () Bool)

(assert (=> b!132060 (= res!63607 e!86102)))

(declare-fun res!63609 () Bool)

(assert (=> b!132060 (=> res!63609 e!86102)))

(declare-fun e!86112 () Bool)

(assert (=> b!132060 (= res!63609 (not e!86112))))

(declare-fun res!63614 () Bool)

(assert (=> b!132060 (=> (not res!63614) (not e!86112))))

(assert (=> b!132060 (= res!63614 (bvslt #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))

(declare-fun b!132061 () Bool)

(declare-fun e!86103 () Bool)

(assert (=> b!132061 (= e!86103 (validKeyInArray!0 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14500 () Bool)

(declare-fun call!14505 () ListLongMap!1703)

(declare-fun call!14507 () ListLongMap!1703)

(assert (=> bm!14500 (= call!14505 call!14507)))

(declare-fun b!132062 () Bool)

(declare-fun e!86107 () ListLongMap!1703)

(declare-fun e!86106 () ListLongMap!1703)

(assert (=> b!132062 (= e!86107 e!86106)))

(declare-fun c!24407 () Bool)

(assert (=> b!132062 (= c!24407 (and (not (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!132063 () Bool)

(declare-fun e!86104 () Bool)

(declare-fun call!14506 () Bool)

(assert (=> b!132063 (= e!86104 (not call!14506))))

(declare-fun b!132064 () Bool)

(assert (=> b!132064 (= e!86106 call!14505)))

(declare-fun b!132065 () Bool)

(declare-fun e!86110 () Bool)

(declare-fun e!86111 () Bool)

(assert (=> b!132065 (= e!86110 e!86111)))

(declare-fun res!63611 () Bool)

(declare-fun call!14504 () Bool)

(assert (=> b!132065 (= res!63611 call!14504)))

(assert (=> b!132065 (=> (not res!63611) (not e!86111))))

(declare-fun bm!14501 () Bool)

(assert (=> bm!14501 (= call!14506 (contains!895 lt!68930 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132066 () Bool)

(declare-fun e!86101 () ListLongMap!1703)

(declare-fun call!14509 () ListLongMap!1703)

(assert (=> b!132066 (= e!86101 call!14509)))

(declare-fun b!132067 () Bool)

(assert (=> b!132067 (= e!86104 e!86108)))

(declare-fun res!63613 () Bool)

(assert (=> b!132067 (= res!63613 call!14506)))

(assert (=> b!132067 (=> (not res!63613) (not e!86108))))

(declare-fun b!132068 () Bool)

(assert (=> b!132068 (= e!86111 (= (apply!115 lt!68930 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2710 newMap!16)))))

(declare-fun bm!14502 () Bool)

(assert (=> bm!14502 (= call!14504 (contains!895 lt!68930 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14503 () Bool)

(declare-fun call!14508 () ListLongMap!1703)

(assert (=> bm!14503 (= call!14509 call!14508)))

(declare-fun b!132069 () Bool)

(assert (=> b!132069 (= e!86101 call!14505)))

(declare-fun bm!14504 () Bool)

(declare-fun call!14503 () ListLongMap!1703)

(assert (=> bm!14504 (= call!14508 call!14503)))

(declare-fun b!132070 () Bool)

(assert (=> b!132070 (= e!86105 e!86110)))

(declare-fun c!24410 () Bool)

(assert (=> b!132070 (= c!24410 (not (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!132071 () Bool)

(assert (=> b!132071 (= e!86112 (validKeyInArray!0 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!132072 () Bool)

(declare-fun e!86109 () Unit!4116)

(declare-fun Unit!4128 () Unit!4116)

(assert (=> b!132072 (= e!86109 Unit!4128)))

(declare-fun d!40121 () Bool)

(assert (=> d!40121 e!86105))

(declare-fun res!63612 () Bool)

(assert (=> d!40121 (=> (not res!63612) (not e!86105))))

(assert (=> d!40121 (= res!63612 (or (bvsge #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))))

(declare-fun lt!68925 () ListLongMap!1703)

(assert (=> d!40121 (= lt!68930 lt!68925)))

(declare-fun lt!68916 () Unit!4116)

(assert (=> d!40121 (= lt!68916 e!86109)))

(declare-fun c!24408 () Bool)

(assert (=> d!40121 (= c!24408 e!86103)))

(declare-fun res!63610 () Bool)

(assert (=> d!40121 (=> (not res!63610) (not e!86103))))

(assert (=> d!40121 (= res!63610 (bvslt #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))

(assert (=> d!40121 (= lt!68925 e!86107)))

(declare-fun c!24409 () Bool)

(assert (=> d!40121 (= c!24409 (and (not (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40121 (validMask!0 (mask!7148 newMap!16))))

(assert (=> d!40121 (= (getCurrentListMap!544 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)) lt!68930)))

(declare-fun bm!14505 () Bool)

(assert (=> bm!14505 (= call!14507 (+!174 (ite c!24409 call!14503 (ite c!24407 call!14508 call!14509)) (ite (or c!24409 c!24407) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2710 newMap!16)) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 newMap!16)))))))

(declare-fun bm!14506 () Bool)

(assert (=> bm!14506 (= call!14503 (getCurrentListMapNoExtraKeys!140 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun b!132073 () Bool)

(declare-fun e!86113 () Bool)

(assert (=> b!132073 (= e!86102 e!86113)))

(declare-fun res!63615 () Bool)

(assert (=> b!132073 (=> (not res!63615) (not e!86113))))

(assert (=> b!132073 (= res!63615 (contains!895 lt!68930 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!132073 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))

(declare-fun b!132074 () Bool)

(assert (=> b!132074 (= e!86113 (= (apply!115 lt!68930 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)) (get!1475 (select (arr!2256 (_values!2837 newMap!16)) #b00000000000000000000000000000000) (dynLambda!423 (defaultEntry!2854 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!132074 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2524 (_values!2837 newMap!16))))))

(assert (=> b!132074 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))

(declare-fun b!132075 () Bool)

(assert (=> b!132075 (= e!86110 (not call!14504))))

(declare-fun b!132076 () Bool)

(declare-fun res!63608 () Bool)

(assert (=> b!132076 (=> (not res!63608) (not e!86105))))

(assert (=> b!132076 (= res!63608 e!86104)))

(declare-fun c!24411 () Bool)

(assert (=> b!132076 (= c!24411 (not (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!132077 () Bool)

(assert (=> b!132077 (= e!86107 (+!174 call!14507 (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 newMap!16))))))

(declare-fun b!132078 () Bool)

(declare-fun c!24406 () Bool)

(assert (=> b!132078 (= c!24406 (and (not (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!132078 (= e!86106 e!86101)))

(declare-fun b!132079 () Bool)

(declare-fun lt!68922 () Unit!4116)

(assert (=> b!132079 (= e!86109 lt!68922)))

(declare-fun lt!68911 () ListLongMap!1703)

(assert (=> b!132079 (= lt!68911 (getCurrentListMapNoExtraKeys!140 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68917 () (_ BitVec 64))

(assert (=> b!132079 (= lt!68917 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68932 () (_ BitVec 64))

(assert (=> b!132079 (= lt!68932 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68920 () Unit!4116)

(assert (=> b!132079 (= lt!68920 (addStillContains!91 lt!68911 lt!68917 (zeroValue!2710 newMap!16) lt!68932))))

(assert (=> b!132079 (contains!895 (+!174 lt!68911 (tuple2!2619 lt!68917 (zeroValue!2710 newMap!16))) lt!68932)))

(declare-fun lt!68913 () Unit!4116)

(assert (=> b!132079 (= lt!68913 lt!68920)))

(declare-fun lt!68918 () ListLongMap!1703)

(assert (=> b!132079 (= lt!68918 (getCurrentListMapNoExtraKeys!140 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68926 () (_ BitVec 64))

(assert (=> b!132079 (= lt!68926 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68927 () (_ BitVec 64))

(assert (=> b!132079 (= lt!68927 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68924 () Unit!4116)

(assert (=> b!132079 (= lt!68924 (addApplyDifferent!91 lt!68918 lt!68926 (minValue!2710 newMap!16) lt!68927))))

(assert (=> b!132079 (= (apply!115 (+!174 lt!68918 (tuple2!2619 lt!68926 (minValue!2710 newMap!16))) lt!68927) (apply!115 lt!68918 lt!68927))))

(declare-fun lt!68928 () Unit!4116)

(assert (=> b!132079 (= lt!68928 lt!68924)))

(declare-fun lt!68921 () ListLongMap!1703)

(assert (=> b!132079 (= lt!68921 (getCurrentListMapNoExtraKeys!140 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68923 () (_ BitVec 64))

(assert (=> b!132079 (= lt!68923 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68915 () (_ BitVec 64))

(assert (=> b!132079 (= lt!68915 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68929 () Unit!4116)

(assert (=> b!132079 (= lt!68929 (addApplyDifferent!91 lt!68921 lt!68923 (zeroValue!2710 newMap!16) lt!68915))))

(assert (=> b!132079 (= (apply!115 (+!174 lt!68921 (tuple2!2619 lt!68923 (zeroValue!2710 newMap!16))) lt!68915) (apply!115 lt!68921 lt!68915))))

(declare-fun lt!68931 () Unit!4116)

(assert (=> b!132079 (= lt!68931 lt!68929)))

(declare-fun lt!68914 () ListLongMap!1703)

(assert (=> b!132079 (= lt!68914 (getCurrentListMapNoExtraKeys!140 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68919 () (_ BitVec 64))

(assert (=> b!132079 (= lt!68919 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68912 () (_ BitVec 64))

(assert (=> b!132079 (= lt!68912 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!132079 (= lt!68922 (addApplyDifferent!91 lt!68914 lt!68919 (minValue!2710 newMap!16) lt!68912))))

(assert (=> b!132079 (= (apply!115 (+!174 lt!68914 (tuple2!2619 lt!68919 (minValue!2710 newMap!16))) lt!68912) (apply!115 lt!68914 lt!68912))))

(assert (= (and d!40121 c!24409) b!132077))

(assert (= (and d!40121 (not c!24409)) b!132062))

(assert (= (and b!132062 c!24407) b!132064))

(assert (= (and b!132062 (not c!24407)) b!132078))

(assert (= (and b!132078 c!24406) b!132069))

(assert (= (and b!132078 (not c!24406)) b!132066))

(assert (= (or b!132069 b!132066) bm!14503))

(assert (= (or b!132064 bm!14503) bm!14504))

(assert (= (or b!132064 b!132069) bm!14500))

(assert (= (or b!132077 bm!14504) bm!14506))

(assert (= (or b!132077 bm!14500) bm!14505))

(assert (= (and d!40121 res!63610) b!132061))

(assert (= (and d!40121 c!24408) b!132079))

(assert (= (and d!40121 (not c!24408)) b!132072))

(assert (= (and d!40121 res!63612) b!132060))

(assert (= (and b!132060 res!63614) b!132071))

(assert (= (and b!132060 (not res!63609)) b!132073))

(assert (= (and b!132073 res!63615) b!132074))

(assert (= (and b!132060 res!63607) b!132076))

(assert (= (and b!132076 c!24411) b!132067))

(assert (= (and b!132076 (not c!24411)) b!132063))

(assert (= (and b!132067 res!63613) b!132059))

(assert (= (or b!132067 b!132063) bm!14501))

(assert (= (and b!132076 res!63608) b!132070))

(assert (= (and b!132070 c!24410) b!132065))

(assert (= (and b!132070 (not c!24410)) b!132075))

(assert (= (and b!132065 res!63611) b!132068))

(assert (= (or b!132065 b!132075) bm!14502))

(declare-fun b_lambda!5873 () Bool)

(assert (=> (not b_lambda!5873) (not b!132074)))

(assert (=> b!132074 t!6156))

(declare-fun b_and!8179 () Bool)

(assert (= b_and!8175 (and (=> t!6156 result!3973) b_and!8179)))

(assert (=> b!132074 t!6158))

(declare-fun b_and!8181 () Bool)

(assert (= b_and!8177 (and (=> t!6158 result!3975) b_and!8181)))

(assert (=> d!40121 m!155247))

(declare-fun m!155599 () Bool)

(assert (=> bm!14501 m!155599))

(declare-fun m!155601 () Bool)

(assert (=> b!132059 m!155601))

(assert (=> b!132073 m!155315))

(assert (=> b!132073 m!155315))

(declare-fun m!155603 () Bool)

(assert (=> b!132073 m!155603))

(declare-fun m!155605 () Bool)

(assert (=> b!132079 m!155605))

(declare-fun m!155607 () Bool)

(assert (=> b!132079 m!155607))

(declare-fun m!155609 () Bool)

(assert (=> b!132079 m!155609))

(declare-fun m!155611 () Bool)

(assert (=> b!132079 m!155611))

(declare-fun m!155613 () Bool)

(assert (=> b!132079 m!155613))

(assert (=> b!132079 m!155607))

(declare-fun m!155615 () Bool)

(assert (=> b!132079 m!155615))

(declare-fun m!155617 () Bool)

(assert (=> b!132079 m!155617))

(declare-fun m!155619 () Bool)

(assert (=> b!132079 m!155619))

(declare-fun m!155621 () Bool)

(assert (=> b!132079 m!155621))

(declare-fun m!155623 () Bool)

(assert (=> b!132079 m!155623))

(assert (=> b!132079 m!155315))

(declare-fun m!155625 () Bool)

(assert (=> b!132079 m!155625))

(declare-fun m!155627 () Bool)

(assert (=> b!132079 m!155627))

(assert (=> b!132079 m!155611))

(assert (=> b!132079 m!155617))

(declare-fun m!155629 () Bool)

(assert (=> b!132079 m!155629))

(declare-fun m!155631 () Bool)

(assert (=> b!132079 m!155631))

(declare-fun m!155633 () Bool)

(assert (=> b!132079 m!155633))

(assert (=> b!132079 m!155631))

(declare-fun m!155635 () Bool)

(assert (=> b!132079 m!155635))

(assert (=> b!132061 m!155315))

(assert (=> b!132061 m!155315))

(assert (=> b!132061 m!155317))

(assert (=> bm!14506 m!155625))

(assert (=> b!132071 m!155315))

(assert (=> b!132071 m!155315))

(assert (=> b!132071 m!155317))

(declare-fun m!155637 () Bool)

(assert (=> b!132074 m!155637))

(assert (=> b!132074 m!155637))

(assert (=> b!132074 m!155477))

(declare-fun m!155639 () Bool)

(assert (=> b!132074 m!155639))

(assert (=> b!132074 m!155315))

(declare-fun m!155641 () Bool)

(assert (=> b!132074 m!155641))

(assert (=> b!132074 m!155315))

(assert (=> b!132074 m!155477))

(declare-fun m!155643 () Bool)

(assert (=> bm!14502 m!155643))

(declare-fun m!155645 () Bool)

(assert (=> b!132077 m!155645))

(declare-fun m!155647 () Bool)

(assert (=> b!132068 m!155647))

(declare-fun m!155649 () Bool)

(assert (=> bm!14505 m!155649))

(assert (=> b!131805 d!40121))

(declare-fun d!40123 () Bool)

(declare-fun e!86115 () Bool)

(assert (=> d!40123 e!86115))

(declare-fun res!63616 () Bool)

(assert (=> d!40123 (=> res!63616 e!86115)))

(declare-fun lt!68935 () Bool)

(assert (=> d!40123 (= res!63616 (not lt!68935))))

(declare-fun lt!68934 () Bool)

(assert (=> d!40123 (= lt!68935 lt!68934)))

(declare-fun lt!68933 () Unit!4116)

(declare-fun e!86114 () Unit!4116)

(assert (=> d!40123 (= lt!68933 e!86114)))

(declare-fun c!24412 () Bool)

(assert (=> d!40123 (= c!24412 lt!68934)))

(assert (=> d!40123 (= lt!68934 (containsKey!175 (toList!867 lt!68594) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!40123 (= (contains!895 lt!68594 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!68935)))

(declare-fun b!132080 () Bool)

(declare-fun lt!68936 () Unit!4116)

(assert (=> b!132080 (= e!86114 lt!68936)))

(assert (=> b!132080 (= lt!68936 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!867 lt!68594) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!132080 (isDefined!124 (getValueByKey!171 (toList!867 lt!68594) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!132081 () Bool)

(declare-fun Unit!4129 () Unit!4116)

(assert (=> b!132081 (= e!86114 Unit!4129)))

(declare-fun b!132082 () Bool)

(assert (=> b!132082 (= e!86115 (isDefined!124 (getValueByKey!171 (toList!867 lt!68594) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!40123 c!24412) b!132080))

(assert (= (and d!40123 (not c!24412)) b!132081))

(assert (= (and d!40123 (not res!63616)) b!132082))

(assert (=> d!40123 m!155105))

(declare-fun m!155651 () Bool)

(assert (=> d!40123 m!155651))

(assert (=> b!132080 m!155105))

(declare-fun m!155653 () Bool)

(assert (=> b!132080 m!155653))

(assert (=> b!132080 m!155105))

(assert (=> b!132080 m!155273))

(assert (=> b!132080 m!155273))

(declare-fun m!155655 () Bool)

(assert (=> b!132080 m!155655))

(assert (=> b!132082 m!155105))

(assert (=> b!132082 m!155273))

(assert (=> b!132082 m!155273))

(assert (=> b!132082 m!155655))

(assert (=> b!131672 d!40123))

(declare-fun d!40125 () Bool)

(assert (=> d!40125 (= (apply!115 lt!68594 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1479 (getValueByKey!171 (toList!867 lt!68594) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5468 () Bool)

(assert (= bs!5468 d!40125))

(declare-fun m!155657 () Bool)

(assert (=> bs!5468 m!155657))

(assert (=> bs!5468 m!155657))

(declare-fun m!155659 () Bool)

(assert (=> bs!5468 m!155659))

(assert (=> b!131658 d!40125))

(declare-fun d!40127 () Bool)

(declare-fun lt!68939 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!131 (List!1713) (InoxSet (_ BitVec 64)))

(assert (=> d!40127 (= lt!68939 (select (content!131 Nil!1710) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!86121 () Bool)

(assert (=> d!40127 (= lt!68939 e!86121)))

(declare-fun res!63621 () Bool)

(assert (=> d!40127 (=> (not res!63621) (not e!86121))))

(assert (=> d!40127 (= res!63621 ((_ is Cons!1709) Nil!1710))))

(assert (=> d!40127 (= (contains!897 Nil!1710 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)) lt!68939)))

(declare-fun b!132087 () Bool)

(declare-fun e!86120 () Bool)

(assert (=> b!132087 (= e!86121 e!86120)))

(declare-fun res!63622 () Bool)

(assert (=> b!132087 (=> res!63622 e!86120)))

(assert (=> b!132087 (= res!63622 (= (h!2314 Nil!1710) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!132088 () Bool)

(assert (=> b!132088 (= e!86120 (contains!897 (t!6148 Nil!1710) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!40127 res!63621) b!132087))

(assert (= (and b!132087 (not res!63622)) b!132088))

(declare-fun m!155661 () Bool)

(assert (=> d!40127 m!155661))

(assert (=> d!40127 m!155091))

(declare-fun m!155663 () Bool)

(assert (=> d!40127 m!155663))

(assert (=> b!132088 m!155091))

(declare-fun m!155665 () Bool)

(assert (=> b!132088 m!155665))

(assert (=> b!131615 d!40127))

(declare-fun b!132089 () Bool)

(declare-fun e!86122 () Bool)

(declare-fun e!86123 () Bool)

(assert (=> b!132089 (= e!86122 e!86123)))

(declare-fun c!24413 () Bool)

(assert (=> b!132089 (= c!24413 (validKeyInArray!0 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!132090 () Bool)

(declare-fun call!14510 () Bool)

(assert (=> b!132090 (= e!86123 call!14510)))

(declare-fun d!40129 () Bool)

(declare-fun res!63625 () Bool)

(declare-fun e!86124 () Bool)

(assert (=> d!40129 (=> res!63625 e!86124)))

(assert (=> d!40129 (= res!63625 (bvsge #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))

(assert (=> d!40129 (= (arrayNoDuplicates!0 (_keys!4601 newMap!16) #b00000000000000000000000000000000 Nil!1710) e!86124)))

(declare-fun b!132091 () Bool)

(assert (=> b!132091 (= e!86124 e!86122)))

(declare-fun res!63623 () Bool)

(assert (=> b!132091 (=> (not res!63623) (not e!86122))))

(declare-fun e!86125 () Bool)

(assert (=> b!132091 (= res!63623 (not e!86125))))

(declare-fun res!63624 () Bool)

(assert (=> b!132091 (=> (not res!63624) (not e!86125))))

(assert (=> b!132091 (= res!63624 (validKeyInArray!0 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14507 () Bool)

(assert (=> bm!14507 (= call!14510 (arrayNoDuplicates!0 (_keys!4601 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24413 (Cons!1709 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000) Nil!1710) Nil!1710)))))

(declare-fun b!132092 () Bool)

(assert (=> b!132092 (= e!86123 call!14510)))

(declare-fun b!132093 () Bool)

(assert (=> b!132093 (= e!86125 (contains!897 Nil!1710 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!40129 (not res!63625)) b!132091))

(assert (= (and b!132091 res!63624) b!132093))

(assert (= (and b!132091 res!63623) b!132089))

(assert (= (and b!132089 c!24413) b!132090))

(assert (= (and b!132089 (not c!24413)) b!132092))

(assert (= (or b!132090 b!132092) bm!14507))

(assert (=> b!132089 m!155315))

(assert (=> b!132089 m!155315))

(assert (=> b!132089 m!155317))

(assert (=> b!132091 m!155315))

(assert (=> b!132091 m!155315))

(assert (=> b!132091 m!155317))

(assert (=> bm!14507 m!155315))

(declare-fun m!155667 () Bool)

(assert (=> bm!14507 m!155667))

(assert (=> b!132093 m!155315))

(assert (=> b!132093 m!155315))

(declare-fun m!155669 () Bool)

(assert (=> b!132093 m!155669))

(assert (=> b!131699 d!40129))

(declare-fun d!40131 () Bool)

(assert (=> d!40131 (= (+!174 (getCurrentListMap!544 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!544 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) lt!68691 (zeroValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68942 () Unit!4116)

(declare-fun choose!813 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 V!3475 Int) Unit!4116)

(assert (=> d!40131 (= lt!68942 (choose!813 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) lt!68691 (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2854 newMap!16)))))

(assert (=> d!40131 (validMask!0 (mask!7148 newMap!16))))

(assert (=> d!40131 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!60 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) lt!68691 (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2854 newMap!16)) lt!68942)))

(declare-fun bs!5469 () Bool)

(assert (= bs!5469 d!40131))

(assert (=> bs!5469 m!155247))

(assert (=> bs!5469 m!155027))

(declare-fun m!155671 () Bool)

(assert (=> bs!5469 m!155671))

(assert (=> bs!5469 m!155099))

(declare-fun m!155673 () Bool)

(assert (=> bs!5469 m!155673))

(assert (=> bs!5469 m!155099))

(assert (=> bs!5469 m!155027))

(declare-fun m!155675 () Bool)

(assert (=> bs!5469 m!155675))

(assert (=> b!131813 d!40131))

(declare-fun d!40133 () Bool)

(declare-fun e!86126 () Bool)

(assert (=> d!40133 e!86126))

(declare-fun res!63627 () Bool)

(assert (=> d!40133 (=> (not res!63627) (not e!86126))))

(declare-fun lt!68944 () ListLongMap!1703)

(assert (=> d!40133 (= res!63627 (contains!895 lt!68944 (_1!1320 (ite (or c!24297 c!24295) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992))))))))))

(declare-fun lt!68945 () List!1714)

(assert (=> d!40133 (= lt!68944 (ListLongMap!1704 lt!68945))))

(declare-fun lt!68946 () Unit!4116)

(declare-fun lt!68943 () Unit!4116)

(assert (=> d!40133 (= lt!68946 lt!68943)))

(assert (=> d!40133 (= (getValueByKey!171 lt!68945 (_1!1320 (ite (or c!24297 c!24295) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992))))))) (Some!176 (_2!1320 (ite (or c!24297 c!24295) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992))))))))))

(assert (=> d!40133 (= lt!68943 (lemmaContainsTupThenGetReturnValue!86 lt!68945 (_1!1320 (ite (or c!24297 c!24295) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))) (_2!1320 (ite (or c!24297 c!24295) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992))))))))))

(assert (=> d!40133 (= lt!68945 (insertStrictlySorted!89 (toList!867 (ite c!24297 call!14395 (ite c!24295 call!14400 call!14401))) (_1!1320 (ite (or c!24297 c!24295) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))) (_2!1320 (ite (or c!24297 c!24295) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992))))))))))

(assert (=> d!40133 (= (+!174 (ite c!24297 call!14395 (ite c!24295 call!14400 call!14401)) (ite (or c!24297 c!24295) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))) lt!68944)))

(declare-fun b!132094 () Bool)

(declare-fun res!63626 () Bool)

(assert (=> b!132094 (=> (not res!63626) (not e!86126))))

(assert (=> b!132094 (= res!63626 (= (getValueByKey!171 (toList!867 lt!68944) (_1!1320 (ite (or c!24297 c!24295) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992))))))) (Some!176 (_2!1320 (ite (or c!24297 c!24295) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))))))

(declare-fun b!132095 () Bool)

(assert (=> b!132095 (= e!86126 (contains!898 (toList!867 lt!68944) (ite (or c!24297 c!24295) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2710 (v!3187 (underlying!452 thiss!992)))) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 (v!3187 (underlying!452 thiss!992)))))))))

(assert (= (and d!40133 res!63627) b!132094))

(assert (= (and b!132094 res!63626) b!132095))

(declare-fun m!155677 () Bool)

(assert (=> d!40133 m!155677))

(declare-fun m!155679 () Bool)

(assert (=> d!40133 m!155679))

(declare-fun m!155681 () Bool)

(assert (=> d!40133 m!155681))

(declare-fun m!155683 () Bool)

(assert (=> d!40133 m!155683))

(declare-fun m!155685 () Bool)

(assert (=> b!132094 m!155685))

(declare-fun m!155687 () Bool)

(assert (=> b!132095 m!155687))

(assert (=> bm!14397 d!40133))

(declare-fun b!132096 () Bool)

(declare-fun e!86127 () Bool)

(declare-fun e!86128 () Bool)

(assert (=> b!132096 (= e!86127 e!86128)))

(declare-fun c!24414 () Bool)

(assert (=> b!132096 (= c!24414 (validKeyInArray!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!132097 () Bool)

(declare-fun call!14511 () Bool)

(assert (=> b!132097 (= e!86128 call!14511)))

(declare-fun d!40135 () Bool)

(declare-fun res!63630 () Bool)

(declare-fun e!86129 () Bool)

(assert (=> d!40135 (=> res!63630 e!86129)))

(assert (=> d!40135 (= res!63630 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> d!40135 (= (arrayNoDuplicates!0 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24281 (Cons!1709 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) Nil!1710) Nil!1710)) e!86129)))

(declare-fun b!132098 () Bool)

(assert (=> b!132098 (= e!86129 e!86127)))

(declare-fun res!63628 () Bool)

(assert (=> b!132098 (=> (not res!63628) (not e!86127))))

(declare-fun e!86130 () Bool)

(assert (=> b!132098 (= res!63628 (not e!86130))))

(declare-fun res!63629 () Bool)

(assert (=> b!132098 (=> (not res!63629) (not e!86130))))

(assert (=> b!132098 (= res!63629 (validKeyInArray!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!14508 () Bool)

(assert (=> bm!14508 (= call!14511 (arrayNoDuplicates!0 (_keys!4601 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!24414 (Cons!1709 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!24281 (Cons!1709 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) Nil!1710) Nil!1710)) (ite c!24281 (Cons!1709 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) Nil!1710) Nil!1710))))))

(declare-fun b!132099 () Bool)

(assert (=> b!132099 (= e!86128 call!14511)))

(declare-fun b!132100 () Bool)

(assert (=> b!132100 (= e!86130 (contains!897 (ite c!24281 (Cons!1709 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) Nil!1710) Nil!1710) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!40135 (not res!63630)) b!132098))

(assert (= (and b!132098 res!63629) b!132100))

(assert (= (and b!132098 res!63628) b!132096))

(assert (= (and b!132096 c!24414) b!132097))

(assert (= (and b!132096 (not c!24414)) b!132099))

(assert (= (or b!132097 b!132099) bm!14508))

(assert (=> b!132096 m!155425))

(assert (=> b!132096 m!155425))

(assert (=> b!132096 m!155433))

(assert (=> b!132098 m!155425))

(assert (=> b!132098 m!155425))

(assert (=> b!132098 m!155433))

(assert (=> bm!14508 m!155425))

(declare-fun m!155689 () Bool)

(assert (=> bm!14508 m!155689))

(assert (=> b!132100 m!155425))

(assert (=> b!132100 m!155425))

(declare-fun m!155691 () Bool)

(assert (=> b!132100 m!155691))

(assert (=> bm!14377 d!40135))

(declare-fun b!132112 () Bool)

(declare-fun e!86133 () Bool)

(assert (=> b!132112 (= e!86133 (and (bvsge (extraKeys!2621 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2621 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!595 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!132111 () Bool)

(declare-fun res!63639 () Bool)

(assert (=> b!132111 (=> (not res!63639) (not e!86133))))

(declare-fun size!2527 (LongMapFixedSize!1092) (_ BitVec 32))

(assert (=> b!132111 (= res!63639 (= (size!2527 newMap!16) (bvadd (_size!595 newMap!16) (bvsdiv (bvadd (extraKeys!2621 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!40137 () Bool)

(declare-fun res!63641 () Bool)

(assert (=> d!40137 (=> (not res!63641) (not e!86133))))

(assert (=> d!40137 (= res!63641 (validMask!0 (mask!7148 newMap!16)))))

(assert (=> d!40137 (= (simpleValid!91 newMap!16) e!86133)))

(declare-fun b!132109 () Bool)

(declare-fun res!63642 () Bool)

(assert (=> b!132109 (=> (not res!63642) (not e!86133))))

(assert (=> b!132109 (= res!63642 (and (= (size!2524 (_values!2837 newMap!16)) (bvadd (mask!7148 newMap!16) #b00000000000000000000000000000001)) (= (size!2523 (_keys!4601 newMap!16)) (size!2524 (_values!2837 newMap!16))) (bvsge (_size!595 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!595 newMap!16) (bvadd (mask!7148 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!132110 () Bool)

(declare-fun res!63640 () Bool)

(assert (=> b!132110 (=> (not res!63640) (not e!86133))))

(assert (=> b!132110 (= res!63640 (bvsge (size!2527 newMap!16) (_size!595 newMap!16)))))

(assert (= (and d!40137 res!63641) b!132109))

(assert (= (and b!132109 res!63642) b!132110))

(assert (= (and b!132110 res!63640) b!132111))

(assert (= (and b!132111 res!63639) b!132112))

(declare-fun m!155693 () Bool)

(assert (=> b!132111 m!155693))

(assert (=> d!40137 m!155247))

(assert (=> b!132110 m!155693))

(assert (=> d!40029 d!40137))

(declare-fun b!132113 () Bool)

(declare-fun e!86141 () Bool)

(declare-fun lt!68966 () ListLongMap!1703)

(assert (=> b!132113 (= e!86141 (= (apply!115 lt!68966 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2710 newMap!16)))))

(declare-fun b!132114 () Bool)

(declare-fun res!63643 () Bool)

(declare-fun e!86138 () Bool)

(assert (=> b!132114 (=> (not res!63643) (not e!86138))))

(declare-fun e!86135 () Bool)

(assert (=> b!132114 (= res!63643 e!86135)))

(declare-fun res!63645 () Bool)

(assert (=> b!132114 (=> res!63645 e!86135)))

(declare-fun e!86145 () Bool)

(assert (=> b!132114 (= res!63645 (not e!86145))))

(declare-fun res!63650 () Bool)

(assert (=> b!132114 (=> (not res!63650) (not e!86145))))

(assert (=> b!132114 (= res!63650 (bvslt #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))

(declare-fun b!132115 () Bool)

(declare-fun e!86136 () Bool)

(assert (=> b!132115 (= e!86136 (validKeyInArray!0 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14509 () Bool)

(declare-fun call!14514 () ListLongMap!1703)

(declare-fun call!14516 () ListLongMap!1703)

(assert (=> bm!14509 (= call!14514 call!14516)))

(declare-fun b!132116 () Bool)

(declare-fun e!86140 () ListLongMap!1703)

(declare-fun e!86139 () ListLongMap!1703)

(assert (=> b!132116 (= e!86140 e!86139)))

(declare-fun c!24416 () Bool)

(assert (=> b!132116 (= c!24416 (and (not (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!132117 () Bool)

(declare-fun e!86137 () Bool)

(declare-fun call!14515 () Bool)

(assert (=> b!132117 (= e!86137 (not call!14515))))

(declare-fun b!132118 () Bool)

(assert (=> b!132118 (= e!86139 call!14514)))

(declare-fun b!132119 () Bool)

(declare-fun e!86143 () Bool)

(declare-fun e!86144 () Bool)

(assert (=> b!132119 (= e!86143 e!86144)))

(declare-fun res!63647 () Bool)

(declare-fun call!14513 () Bool)

(assert (=> b!132119 (= res!63647 call!14513)))

(assert (=> b!132119 (=> (not res!63647) (not e!86144))))

(declare-fun bm!14510 () Bool)

(assert (=> bm!14510 (= call!14515 (contains!895 lt!68966 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132120 () Bool)

(declare-fun e!86134 () ListLongMap!1703)

(declare-fun call!14518 () ListLongMap!1703)

(assert (=> b!132120 (= e!86134 call!14518)))

(declare-fun b!132121 () Bool)

(assert (=> b!132121 (= e!86137 e!86141)))

(declare-fun res!63649 () Bool)

(assert (=> b!132121 (= res!63649 call!14515)))

(assert (=> b!132121 (=> (not res!63649) (not e!86141))))

(declare-fun b!132122 () Bool)

(assert (=> b!132122 (= e!86144 (= (apply!115 lt!68966 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2710 newMap!16)))))

(declare-fun bm!14511 () Bool)

(assert (=> bm!14511 (= call!14513 (contains!895 lt!68966 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14512 () Bool)

(declare-fun call!14517 () ListLongMap!1703)

(assert (=> bm!14512 (= call!14518 call!14517)))

(declare-fun b!132123 () Bool)

(assert (=> b!132123 (= e!86134 call!14514)))

(declare-fun bm!14513 () Bool)

(declare-fun call!14512 () ListLongMap!1703)

(assert (=> bm!14513 (= call!14517 call!14512)))

(declare-fun b!132124 () Bool)

(assert (=> b!132124 (= e!86138 e!86143)))

(declare-fun c!24419 () Bool)

(assert (=> b!132124 (= c!24419 (not (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!132125 () Bool)

(assert (=> b!132125 (= e!86145 (validKeyInArray!0 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!132126 () Bool)

(declare-fun e!86142 () Unit!4116)

(declare-fun Unit!4130 () Unit!4116)

(assert (=> b!132126 (= e!86142 Unit!4130)))

(declare-fun d!40139 () Bool)

(assert (=> d!40139 e!86138))

(declare-fun res!63648 () Bool)

(assert (=> d!40139 (=> (not res!63648) (not e!86138))))

(assert (=> d!40139 (= res!63648 (or (bvsge #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))))

(declare-fun lt!68961 () ListLongMap!1703)

(assert (=> d!40139 (= lt!68966 lt!68961)))

(declare-fun lt!68952 () Unit!4116)

(assert (=> d!40139 (= lt!68952 e!86142)))

(declare-fun c!24417 () Bool)

(assert (=> d!40139 (= c!24417 e!86136)))

(declare-fun res!63646 () Bool)

(assert (=> d!40139 (=> (not res!63646) (not e!86136))))

(assert (=> d!40139 (= res!63646 (bvslt #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))

(assert (=> d!40139 (= lt!68961 e!86140)))

(declare-fun c!24418 () Bool)

(assert (=> d!40139 (= c!24418 (and (not (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40139 (validMask!0 (mask!7148 newMap!16))))

(assert (=> d!40139 (= (getCurrentListMap!544 (_keys!4601 newMap!16) (ite c!24344 (_values!2837 newMap!16) (array!4770 (store (arr!2256 (_values!2837 newMap!16)) (index!3256 lt!68678) (ValueCellFull!1092 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2524 (_values!2837 newMap!16)))) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)) lt!68966)))

(declare-fun bm!14514 () Bool)

(assert (=> bm!14514 (= call!14516 (+!174 (ite c!24418 call!14512 (ite c!24416 call!14517 call!14518)) (ite (or c!24418 c!24416) (tuple2!2619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2710 newMap!16)) (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 newMap!16)))))))

(declare-fun bm!14515 () Bool)

(assert (=> bm!14515 (= call!14512 (getCurrentListMapNoExtraKeys!140 (_keys!4601 newMap!16) (ite c!24344 (_values!2837 newMap!16) (array!4770 (store (arr!2256 (_values!2837 newMap!16)) (index!3256 lt!68678) (ValueCellFull!1092 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2524 (_values!2837 newMap!16)))) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun b!132127 () Bool)

(declare-fun e!86146 () Bool)

(assert (=> b!132127 (= e!86135 e!86146)))

(declare-fun res!63651 () Bool)

(assert (=> b!132127 (=> (not res!63651) (not e!86146))))

(assert (=> b!132127 (= res!63651 (contains!895 lt!68966 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!132127 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))

(declare-fun b!132128 () Bool)

(assert (=> b!132128 (= e!86146 (= (apply!115 lt!68966 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)) (get!1475 (select (arr!2256 (ite c!24344 (_values!2837 newMap!16) (array!4770 (store (arr!2256 (_values!2837 newMap!16)) (index!3256 lt!68678) (ValueCellFull!1092 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2524 (_values!2837 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!423 (defaultEntry!2854 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!132128 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2524 (ite c!24344 (_values!2837 newMap!16) (array!4770 (store (arr!2256 (_values!2837 newMap!16)) (index!3256 lt!68678) (ValueCellFull!1092 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2524 (_values!2837 newMap!16)))))))))

(assert (=> b!132128 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))

(declare-fun b!132129 () Bool)

(assert (=> b!132129 (= e!86143 (not call!14513))))

(declare-fun b!132130 () Bool)

(declare-fun res!63644 () Bool)

(assert (=> b!132130 (=> (not res!63644) (not e!86138))))

(assert (=> b!132130 (= res!63644 e!86137)))

(declare-fun c!24420 () Bool)

(assert (=> b!132130 (= c!24420 (not (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!132131 () Bool)

(assert (=> b!132131 (= e!86140 (+!174 call!14516 (tuple2!2619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2710 newMap!16))))))

(declare-fun b!132132 () Bool)

(declare-fun c!24415 () Bool)

(assert (=> b!132132 (= c!24415 (and (not (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2621 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!132132 (= e!86139 e!86134)))

(declare-fun b!132133 () Bool)

(declare-fun lt!68958 () Unit!4116)

(assert (=> b!132133 (= e!86142 lt!68958)))

(declare-fun lt!68947 () ListLongMap!1703)

(assert (=> b!132133 (= lt!68947 (getCurrentListMapNoExtraKeys!140 (_keys!4601 newMap!16) (ite c!24344 (_values!2837 newMap!16) (array!4770 (store (arr!2256 (_values!2837 newMap!16)) (index!3256 lt!68678) (ValueCellFull!1092 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2524 (_values!2837 newMap!16)))) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68953 () (_ BitVec 64))

(assert (=> b!132133 (= lt!68953 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68968 () (_ BitVec 64))

(assert (=> b!132133 (= lt!68968 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68956 () Unit!4116)

(assert (=> b!132133 (= lt!68956 (addStillContains!91 lt!68947 lt!68953 (zeroValue!2710 newMap!16) lt!68968))))

(assert (=> b!132133 (contains!895 (+!174 lt!68947 (tuple2!2619 lt!68953 (zeroValue!2710 newMap!16))) lt!68968)))

(declare-fun lt!68949 () Unit!4116)

(assert (=> b!132133 (= lt!68949 lt!68956)))

(declare-fun lt!68954 () ListLongMap!1703)

(assert (=> b!132133 (= lt!68954 (getCurrentListMapNoExtraKeys!140 (_keys!4601 newMap!16) (ite c!24344 (_values!2837 newMap!16) (array!4770 (store (arr!2256 (_values!2837 newMap!16)) (index!3256 lt!68678) (ValueCellFull!1092 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2524 (_values!2837 newMap!16)))) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68962 () (_ BitVec 64))

(assert (=> b!132133 (= lt!68962 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68963 () (_ BitVec 64))

(assert (=> b!132133 (= lt!68963 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68960 () Unit!4116)

(assert (=> b!132133 (= lt!68960 (addApplyDifferent!91 lt!68954 lt!68962 (minValue!2710 newMap!16) lt!68963))))

(assert (=> b!132133 (= (apply!115 (+!174 lt!68954 (tuple2!2619 lt!68962 (minValue!2710 newMap!16))) lt!68963) (apply!115 lt!68954 lt!68963))))

(declare-fun lt!68964 () Unit!4116)

(assert (=> b!132133 (= lt!68964 lt!68960)))

(declare-fun lt!68957 () ListLongMap!1703)

(assert (=> b!132133 (= lt!68957 (getCurrentListMapNoExtraKeys!140 (_keys!4601 newMap!16) (ite c!24344 (_values!2837 newMap!16) (array!4770 (store (arr!2256 (_values!2837 newMap!16)) (index!3256 lt!68678) (ValueCellFull!1092 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2524 (_values!2837 newMap!16)))) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68959 () (_ BitVec 64))

(assert (=> b!132133 (= lt!68959 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68951 () (_ BitVec 64))

(assert (=> b!132133 (= lt!68951 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68965 () Unit!4116)

(assert (=> b!132133 (= lt!68965 (addApplyDifferent!91 lt!68957 lt!68959 (zeroValue!2710 newMap!16) lt!68951))))

(assert (=> b!132133 (= (apply!115 (+!174 lt!68957 (tuple2!2619 lt!68959 (zeroValue!2710 newMap!16))) lt!68951) (apply!115 lt!68957 lt!68951))))

(declare-fun lt!68967 () Unit!4116)

(assert (=> b!132133 (= lt!68967 lt!68965)))

(declare-fun lt!68950 () ListLongMap!1703)

(assert (=> b!132133 (= lt!68950 (getCurrentListMapNoExtraKeys!140 (_keys!4601 newMap!16) (ite c!24344 (_values!2837 newMap!16) (array!4770 (store (arr!2256 (_values!2837 newMap!16)) (index!3256 lt!68678) (ValueCellFull!1092 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2524 (_values!2837 newMap!16)))) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)))))

(declare-fun lt!68955 () (_ BitVec 64))

(assert (=> b!132133 (= lt!68955 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68948 () (_ BitVec 64))

(assert (=> b!132133 (= lt!68948 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!132133 (= lt!68958 (addApplyDifferent!91 lt!68950 lt!68955 (minValue!2710 newMap!16) lt!68948))))

(assert (=> b!132133 (= (apply!115 (+!174 lt!68950 (tuple2!2619 lt!68955 (minValue!2710 newMap!16))) lt!68948) (apply!115 lt!68950 lt!68948))))

(assert (= (and d!40139 c!24418) b!132131))

(assert (= (and d!40139 (not c!24418)) b!132116))

(assert (= (and b!132116 c!24416) b!132118))

(assert (= (and b!132116 (not c!24416)) b!132132))

(assert (= (and b!132132 c!24415) b!132123))

(assert (= (and b!132132 (not c!24415)) b!132120))

(assert (= (or b!132123 b!132120) bm!14512))

(assert (= (or b!132118 bm!14512) bm!14513))

(assert (= (or b!132118 b!132123) bm!14509))

(assert (= (or b!132131 bm!14513) bm!14515))

(assert (= (or b!132131 bm!14509) bm!14514))

(assert (= (and d!40139 res!63646) b!132115))

(assert (= (and d!40139 c!24417) b!132133))

(assert (= (and d!40139 (not c!24417)) b!132126))

(assert (= (and d!40139 res!63648) b!132114))

(assert (= (and b!132114 res!63650) b!132125))

(assert (= (and b!132114 (not res!63645)) b!132127))

(assert (= (and b!132127 res!63651) b!132128))

(assert (= (and b!132114 res!63643) b!132130))

(assert (= (and b!132130 c!24420) b!132121))

(assert (= (and b!132130 (not c!24420)) b!132117))

(assert (= (and b!132121 res!63649) b!132113))

(assert (= (or b!132121 b!132117) bm!14510))

(assert (= (and b!132130 res!63644) b!132124))

(assert (= (and b!132124 c!24419) b!132119))

(assert (= (and b!132124 (not c!24419)) b!132129))

(assert (= (and b!132119 res!63647) b!132122))

(assert (= (or b!132119 b!132129) bm!14511))

(declare-fun b_lambda!5875 () Bool)

(assert (=> (not b_lambda!5875) (not b!132128)))

(assert (=> b!132128 t!6156))

(declare-fun b_and!8183 () Bool)

(assert (= b_and!8179 (and (=> t!6156 result!3973) b_and!8183)))

(assert (=> b!132128 t!6158))

(declare-fun b_and!8185 () Bool)

(assert (= b_and!8181 (and (=> t!6158 result!3975) b_and!8185)))

(assert (=> d!40139 m!155247))

(declare-fun m!155695 () Bool)

(assert (=> bm!14510 m!155695))

(declare-fun m!155697 () Bool)

(assert (=> b!132113 m!155697))

(assert (=> b!132127 m!155315))

(assert (=> b!132127 m!155315))

(declare-fun m!155699 () Bool)

(assert (=> b!132127 m!155699))

(declare-fun m!155701 () Bool)

(assert (=> b!132133 m!155701))

(declare-fun m!155703 () Bool)

(assert (=> b!132133 m!155703))

(declare-fun m!155705 () Bool)

(assert (=> b!132133 m!155705))

(declare-fun m!155707 () Bool)

(assert (=> b!132133 m!155707))

(declare-fun m!155709 () Bool)

(assert (=> b!132133 m!155709))

(assert (=> b!132133 m!155703))

(declare-fun m!155711 () Bool)

(assert (=> b!132133 m!155711))

(declare-fun m!155713 () Bool)

(assert (=> b!132133 m!155713))

(declare-fun m!155715 () Bool)

(assert (=> b!132133 m!155715))

(declare-fun m!155717 () Bool)

(assert (=> b!132133 m!155717))

(declare-fun m!155719 () Bool)

(assert (=> b!132133 m!155719))

(assert (=> b!132133 m!155315))

(declare-fun m!155721 () Bool)

(assert (=> b!132133 m!155721))

(declare-fun m!155723 () Bool)

(assert (=> b!132133 m!155723))

(assert (=> b!132133 m!155707))

(assert (=> b!132133 m!155713))

(declare-fun m!155725 () Bool)

(assert (=> b!132133 m!155725))

(declare-fun m!155727 () Bool)

(assert (=> b!132133 m!155727))

(declare-fun m!155729 () Bool)

(assert (=> b!132133 m!155729))

(assert (=> b!132133 m!155727))

(declare-fun m!155731 () Bool)

(assert (=> b!132133 m!155731))

(assert (=> b!132115 m!155315))

(assert (=> b!132115 m!155315))

(assert (=> b!132115 m!155317))

(assert (=> bm!14515 m!155721))

(assert (=> b!132125 m!155315))

(assert (=> b!132125 m!155315))

(assert (=> b!132125 m!155317))

(declare-fun m!155733 () Bool)

(assert (=> b!132128 m!155733))

(assert (=> b!132128 m!155733))

(assert (=> b!132128 m!155477))

(declare-fun m!155735 () Bool)

(assert (=> b!132128 m!155735))

(assert (=> b!132128 m!155315))

(declare-fun m!155737 () Bool)

(assert (=> b!132128 m!155737))

(assert (=> b!132128 m!155315))

(assert (=> b!132128 m!155477))

(declare-fun m!155739 () Bool)

(assert (=> bm!14511 m!155739))

(declare-fun m!155741 () Bool)

(assert (=> b!132131 m!155741))

(declare-fun m!155743 () Bool)

(assert (=> b!132122 m!155743))

(declare-fun m!155745 () Bool)

(assert (=> bm!14514 m!155745))

(assert (=> bm!14454 d!40139))

(assert (=> b!131811 d!40121))

(declare-fun bm!14516 () Bool)

(declare-fun call!14519 () Bool)

(assert (=> bm!14516 (= call!14519 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4601 newMap!16) (mask!7148 newMap!16)))))

(declare-fun b!132134 () Bool)

(declare-fun e!86147 () Bool)

(declare-fun e!86149 () Bool)

(assert (=> b!132134 (= e!86147 e!86149)))

(declare-fun lt!68969 () (_ BitVec 64))

(assert (=> b!132134 (= lt!68969 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68970 () Unit!4116)

(assert (=> b!132134 (= lt!68970 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4601 newMap!16) lt!68969 #b00000000000000000000000000000000))))

(assert (=> b!132134 (arrayContainsKey!0 (_keys!4601 newMap!16) lt!68969 #b00000000000000000000000000000000)))

(declare-fun lt!68971 () Unit!4116)

(assert (=> b!132134 (= lt!68971 lt!68970)))

(declare-fun res!63653 () Bool)

(assert (=> b!132134 (= res!63653 (= (seekEntryOrOpen!0 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000) (_keys!4601 newMap!16) (mask!7148 newMap!16)) (Found!274 #b00000000000000000000000000000000)))))

(assert (=> b!132134 (=> (not res!63653) (not e!86149))))

(declare-fun b!132135 () Bool)

(assert (=> b!132135 (= e!86149 call!14519)))

(declare-fun b!132136 () Bool)

(assert (=> b!132136 (= e!86147 call!14519)))

(declare-fun b!132137 () Bool)

(declare-fun e!86148 () Bool)

(assert (=> b!132137 (= e!86148 e!86147)))

(declare-fun c!24421 () Bool)

(assert (=> b!132137 (= c!24421 (validKeyInArray!0 (select (arr!2255 (_keys!4601 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!40141 () Bool)

(declare-fun res!63652 () Bool)

(assert (=> d!40141 (=> res!63652 e!86148)))

(assert (=> d!40141 (= res!63652 (bvsge #b00000000000000000000000000000000 (size!2523 (_keys!4601 newMap!16))))))

(assert (=> d!40141 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4601 newMap!16) (mask!7148 newMap!16)) e!86148)))

(assert (= (and d!40141 (not res!63652)) b!132137))

(assert (= (and b!132137 c!24421) b!132134))

(assert (= (and b!132137 (not c!24421)) b!132136))

(assert (= (and b!132134 res!63653) b!132135))

(assert (= (or b!132135 b!132136) bm!14516))

(declare-fun m!155747 () Bool)

(assert (=> bm!14516 m!155747))

(assert (=> b!132134 m!155315))

(declare-fun m!155749 () Bool)

(assert (=> b!132134 m!155749))

(declare-fun m!155751 () Bool)

(assert (=> b!132134 m!155751))

(assert (=> b!132134 m!155315))

(declare-fun m!155753 () Bool)

(assert (=> b!132134 m!155753))

(assert (=> b!132137 m!155315))

(assert (=> b!132137 m!155315))

(assert (=> b!132137 m!155317))

(assert (=> b!131698 d!40141))

(assert (=> b!131611 d!40053))

(assert (=> bm!14464 d!40015))

(declare-fun d!40143 () Bool)

(assert (=> d!40143 (= (get!1478 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131840 d!40143))

(declare-fun d!40145 () Bool)

(assert (=> d!40145 (arrayContainsKey!0 (_keys!4601 (v!3187 (underlying!452 thiss!992))) lt!68603 #b00000000000000000000000000000000)))

(declare-fun lt!68974 () Unit!4116)

(declare-fun choose!13 (array!4767 (_ BitVec 64) (_ BitVec 32)) Unit!4116)

(assert (=> d!40145 (= lt!68974 (choose!13 (_keys!4601 (v!3187 (underlying!452 thiss!992))) lt!68603 #b00000000000000000000000000000000))))

(assert (=> d!40145 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!40145 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4601 (v!3187 (underlying!452 thiss!992))) lt!68603 #b00000000000000000000000000000000) lt!68974)))

(declare-fun bs!5470 () Bool)

(assert (= bs!5470 d!40145))

(assert (=> bs!5470 m!155161))

(declare-fun m!155755 () Bool)

(assert (=> bs!5470 m!155755))

(assert (=> b!131687 d!40145))

(declare-fun d!40147 () Bool)

(declare-fun res!63654 () Bool)

(declare-fun e!86150 () Bool)

(assert (=> d!40147 (=> res!63654 e!86150)))

(assert (=> d!40147 (= res!63654 (= (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) lt!68603))))

(assert (=> d!40147 (= (arrayContainsKey!0 (_keys!4601 (v!3187 (underlying!452 thiss!992))) lt!68603 #b00000000000000000000000000000000) e!86150)))

(declare-fun b!132138 () Bool)

(declare-fun e!86151 () Bool)

(assert (=> b!132138 (= e!86150 e!86151)))

(declare-fun res!63655 () Bool)

(assert (=> b!132138 (=> (not res!63655) (not e!86151))))

(assert (=> b!132138 (= res!63655 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun b!132139 () Bool)

(assert (=> b!132139 (= e!86151 (arrayContainsKey!0 (_keys!4601 (v!3187 (underlying!452 thiss!992))) lt!68603 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!40147 (not res!63654)) b!132138))

(assert (= (and b!132138 res!63655) b!132139))

(assert (=> d!40147 m!155091))

(declare-fun m!155757 () Bool)

(assert (=> b!132139 m!155757))

(assert (=> b!131687 d!40147))

(declare-fun b!132140 () Bool)

(declare-fun e!86152 () SeekEntryResult!274)

(declare-fun e!86154 () SeekEntryResult!274)

(assert (=> b!132140 (= e!86152 e!86154)))

(declare-fun lt!68975 () (_ BitVec 64))

(declare-fun lt!68976 () SeekEntryResult!274)

(assert (=> b!132140 (= lt!68975 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (index!3257 lt!68976)))))

(declare-fun c!24424 () Bool)

(assert (=> b!132140 (= c!24424 (= lt!68975 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!132141 () Bool)

(declare-fun e!86153 () SeekEntryResult!274)

(assert (=> b!132141 (= e!86153 (MissingZero!274 (index!3257 lt!68976)))))

(declare-fun b!132142 () Bool)

(assert (=> b!132142 (= e!86152 Undefined!274)))

(declare-fun b!132143 () Bool)

(declare-fun c!24423 () Bool)

(assert (=> b!132143 (= c!24423 (= lt!68975 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132143 (= e!86154 e!86153)))

(declare-fun b!132144 () Bool)

(assert (=> b!132144 (= e!86154 (Found!274 (index!3257 lt!68976)))))

(declare-fun b!132145 () Bool)

(assert (=> b!132145 (= e!86153 (seekKeyOrZeroReturnVacant!0 (x!15502 lt!68976) (index!3257 lt!68976) (index!3257 lt!68976) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) (_keys!4601 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun d!40149 () Bool)

(declare-fun lt!68977 () SeekEntryResult!274)

(assert (=> d!40149 (and (or ((_ is Undefined!274) lt!68977) (not ((_ is Found!274) lt!68977)) (and (bvsge (index!3256 lt!68977) #b00000000000000000000000000000000) (bvslt (index!3256 lt!68977) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))) (or ((_ is Undefined!274) lt!68977) ((_ is Found!274) lt!68977) (not ((_ is MissingZero!274) lt!68977)) (and (bvsge (index!3255 lt!68977) #b00000000000000000000000000000000) (bvslt (index!3255 lt!68977) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))) (or ((_ is Undefined!274) lt!68977) ((_ is Found!274) lt!68977) ((_ is MissingZero!274) lt!68977) (not ((_ is MissingVacant!274) lt!68977)) (and (bvsge (index!3258 lt!68977) #b00000000000000000000000000000000) (bvslt (index!3258 lt!68977) (size!2523 (_keys!4601 (v!3187 (underlying!452 thiss!992))))))) (or ((_ is Undefined!274) lt!68977) (ite ((_ is Found!274) lt!68977) (= (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (index!3256 lt!68977)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!274) lt!68977) (= (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (index!3255 lt!68977)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!274) lt!68977) (= (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) (index!3258 lt!68977)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40149 (= lt!68977 e!86152)))

(declare-fun c!24422 () Bool)

(assert (=> d!40149 (= c!24422 (and ((_ is Intermediate!274) lt!68976) (undefined!1086 lt!68976)))))

(assert (=> d!40149 (= lt!68976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) (mask!7148 (v!3187 (underlying!452 thiss!992)))) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) (_keys!4601 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992)))))))

(assert (=> d!40149 (validMask!0 (mask!7148 (v!3187 (underlying!452 thiss!992))))))

(assert (=> d!40149 (= (seekEntryOrOpen!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) (_keys!4601 (v!3187 (underlying!452 thiss!992))) (mask!7148 (v!3187 (underlying!452 thiss!992)))) lt!68977)))

(assert (= (and d!40149 c!24422) b!132142))

(assert (= (and d!40149 (not c!24422)) b!132140))

(assert (= (and b!132140 c!24424) b!132144))

(assert (= (and b!132140 (not c!24424)) b!132143))

(assert (= (and b!132143 c!24423) b!132141))

(assert (= (and b!132143 (not c!24423)) b!132145))

(declare-fun m!155759 () Bool)

(assert (=> b!132140 m!155759))

(assert (=> b!132145 m!155091))

(declare-fun m!155761 () Bool)

(assert (=> b!132145 m!155761))

(assert (=> d!40149 m!155019))

(declare-fun m!155763 () Bool)

(assert (=> d!40149 m!155763))

(declare-fun m!155765 () Bool)

(assert (=> d!40149 m!155765))

(assert (=> d!40149 m!155091))

(declare-fun m!155767 () Bool)

(assert (=> d!40149 m!155767))

(assert (=> d!40149 m!155091))

(assert (=> d!40149 m!155765))

(declare-fun m!155769 () Bool)

(assert (=> d!40149 m!155769))

(declare-fun m!155771 () Bool)

(assert (=> d!40149 m!155771))

(assert (=> b!131687 d!40149))

(assert (=> d!40015 d!40121))

(declare-fun d!40151 () Bool)

(declare-fun e!86156 () Bool)

(assert (=> d!40151 e!86156))

(declare-fun res!63656 () Bool)

(assert (=> d!40151 (=> res!63656 e!86156)))

(declare-fun lt!68980 () Bool)

(assert (=> d!40151 (= res!63656 (not lt!68980))))

(declare-fun lt!68979 () Bool)

(assert (=> d!40151 (= lt!68980 lt!68979)))

(declare-fun lt!68978 () Unit!4116)

(declare-fun e!86155 () Unit!4116)

(assert (=> d!40151 (= lt!68978 e!86155)))

(declare-fun c!24425 () Bool)

(assert (=> d!40151 (= c!24425 lt!68979)))

(assert (=> d!40151 (= lt!68979 (containsKey!175 (toList!867 call!14458) (select (arr!2255 (_keys!4601 newMap!16)) (index!3256 lt!68678))))))

(assert (=> d!40151 (= (contains!895 call!14458 (select (arr!2255 (_keys!4601 newMap!16)) (index!3256 lt!68678))) lt!68980)))

(declare-fun b!132146 () Bool)

(declare-fun lt!68981 () Unit!4116)

(assert (=> b!132146 (= e!86155 lt!68981)))

(assert (=> b!132146 (= lt!68981 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!867 call!14458) (select (arr!2255 (_keys!4601 newMap!16)) (index!3256 lt!68678))))))

(assert (=> b!132146 (isDefined!124 (getValueByKey!171 (toList!867 call!14458) (select (arr!2255 (_keys!4601 newMap!16)) (index!3256 lt!68678))))))

(declare-fun b!132147 () Bool)

(declare-fun Unit!4131 () Unit!4116)

(assert (=> b!132147 (= e!86155 Unit!4131)))

(declare-fun b!132148 () Bool)

(assert (=> b!132148 (= e!86156 (isDefined!124 (getValueByKey!171 (toList!867 call!14458) (select (arr!2255 (_keys!4601 newMap!16)) (index!3256 lt!68678)))))))

(assert (= (and d!40151 c!24425) b!132146))

(assert (= (and d!40151 (not c!24425)) b!132147))

(assert (= (and d!40151 (not res!63656)) b!132148))

(assert (=> d!40151 m!155197))

(declare-fun m!155773 () Bool)

(assert (=> d!40151 m!155773))

(assert (=> b!132146 m!155197))

(declare-fun m!155775 () Bool)

(assert (=> b!132146 m!155775))

(assert (=> b!132146 m!155197))

(declare-fun m!155777 () Bool)

(assert (=> b!132146 m!155777))

(assert (=> b!132146 m!155777))

(declare-fun m!155779 () Bool)

(assert (=> b!132146 m!155779))

(assert (=> b!132148 m!155197))

(assert (=> b!132148 m!155777))

(assert (=> b!132148 m!155777))

(assert (=> b!132148 m!155779))

(assert (=> b!131797 d!40151))

(declare-fun d!40153 () Bool)

(declare-fun e!86159 () Bool)

(assert (=> d!40153 e!86159))

(declare-fun res!63659 () Bool)

(assert (=> d!40153 (=> (not res!63659) (not e!86159))))

(assert (=> d!40153 (= res!63659 (and (bvsge (index!3256 lt!68678) #b00000000000000000000000000000000) (bvslt (index!3256 lt!68678) (size!2523 (_keys!4601 newMap!16)))))))

(declare-fun lt!68984 () Unit!4116)

(declare-fun choose!814 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 (_ BitVec 32) Int) Unit!4116)

(assert (=> d!40153 (= lt!68984 (choose!814 (_keys!4601 newMap!16) lt!68696 (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (index!3256 lt!68678) (defaultEntry!2854 newMap!16)))))

(assert (=> d!40153 (validMask!0 (mask!7148 newMap!16))))

(assert (=> d!40153 (= (lemmaValidKeyInArrayIsInListMap!121 (_keys!4601 newMap!16) lt!68696 (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (index!3256 lt!68678) (defaultEntry!2854 newMap!16)) lt!68984)))

(declare-fun b!132151 () Bool)

(assert (=> b!132151 (= e!86159 (contains!895 (getCurrentListMap!544 (_keys!4601 newMap!16) lt!68696 (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)) (select (arr!2255 (_keys!4601 newMap!16)) (index!3256 lt!68678))))))

(assert (= (and d!40153 res!63659) b!132151))

(declare-fun m!155781 () Bool)

(assert (=> d!40153 m!155781))

(assert (=> d!40153 m!155247))

(declare-fun m!155783 () Bool)

(assert (=> b!132151 m!155783))

(assert (=> b!132151 m!155197))

(assert (=> b!132151 m!155783))

(assert (=> b!132151 m!155197))

(declare-fun m!155785 () Bool)

(assert (=> b!132151 m!155785))

(assert (=> b!131797 d!40153))

(declare-fun d!40155 () Bool)

(declare-fun e!86162 () Bool)

(assert (=> d!40155 e!86162))

(declare-fun res!63662 () Bool)

(assert (=> d!40155 (=> (not res!63662) (not e!86162))))

(assert (=> d!40155 (= res!63662 (and (bvsge (index!3256 lt!68678) #b00000000000000000000000000000000) (bvslt (index!3256 lt!68678) (size!2524 (_values!2837 newMap!16)))))))

(declare-fun lt!68987 () Unit!4116)

(declare-fun choose!815 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 (_ BitVec 32) (_ BitVec 64) V!3475 Int) Unit!4116)

(assert (=> d!40155 (= lt!68987 (choose!815 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (index!3256 lt!68678) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2854 newMap!16)))))

(assert (=> d!40155 (validMask!0 (mask!7148 newMap!16))))

(assert (=> d!40155 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!60 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (index!3256 lt!68678) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2854 newMap!16)) lt!68987)))

(declare-fun b!132154 () Bool)

(assert (=> b!132154 (= e!86162 (= (+!174 (getCurrentListMap!544 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16)) (tuple2!2619 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!544 (_keys!4601 newMap!16) (array!4770 (store (arr!2256 (_values!2837 newMap!16)) (index!3256 lt!68678) (ValueCellFull!1092 (get!1475 (select (arr!2256 (_values!2837 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2524 (_values!2837 newMap!16))) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2854 newMap!16))))))

(assert (= (and d!40155 res!63662) b!132154))

(assert (=> d!40155 m!155029))

(assert (=> d!40155 m!155027))

(declare-fun m!155787 () Bool)

(assert (=> d!40155 m!155787))

(assert (=> d!40155 m!155247))

(assert (=> b!132154 m!155099))

(assert (=> b!132154 m!155099))

(assert (=> b!132154 m!155401))

(assert (=> b!132154 m!155191))

(declare-fun m!155789 () Bool)

(assert (=> b!132154 m!155789))

(assert (=> b!131797 d!40155))

(declare-fun d!40157 () Bool)

(declare-fun e!86164 () Bool)

(assert (=> d!40157 e!86164))

(declare-fun res!63663 () Bool)

(assert (=> d!40157 (=> res!63663 e!86164)))

(declare-fun lt!68990 () Bool)

(assert (=> d!40157 (= res!63663 (not lt!68990))))

(declare-fun lt!68989 () Bool)

(assert (=> d!40157 (= lt!68990 lt!68989)))

(declare-fun lt!68988 () Unit!4116)

(declare-fun e!86163 () Unit!4116)

(assert (=> d!40157 (= lt!68988 e!86163)))

(declare-fun c!24426 () Bool)

(assert (=> d!40157 (= c!24426 lt!68989)))

(assert (=> d!40157 (= lt!68989 (containsKey!175 (toList!867 lt!68594) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!40157 (= (contains!895 lt!68594 #b1000000000000000000000000000000000000000000000000000000000000000) lt!68990)))

(declare-fun b!132155 () Bool)

(declare-fun lt!68991 () Unit!4116)

(assert (=> b!132155 (= e!86163 lt!68991)))

(assert (=> b!132155 (= lt!68991 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!867 lt!68594) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132155 (isDefined!124 (getValueByKey!171 (toList!867 lt!68594) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132156 () Bool)

(declare-fun Unit!4132 () Unit!4116)

(assert (=> b!132156 (= e!86163 Unit!4132)))

(declare-fun b!132157 () Bool)

(assert (=> b!132157 (= e!86164 (isDefined!124 (getValueByKey!171 (toList!867 lt!68594) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40157 c!24426) b!132155))

(assert (= (and d!40157 (not c!24426)) b!132156))

(assert (= (and d!40157 (not res!63663)) b!132157))

(declare-fun m!155791 () Bool)

(assert (=> d!40157 m!155791))

(declare-fun m!155793 () Bool)

(assert (=> b!132155 m!155793))

(assert (=> b!132155 m!155351))

(assert (=> b!132155 m!155351))

(declare-fun m!155795 () Bool)

(assert (=> b!132155 m!155795))

(assert (=> b!132157 m!155351))

(assert (=> b!132157 m!155351))

(assert (=> b!132157 m!155795))

(assert (=> bm!14394 d!40157))

(declare-fun d!40159 () Bool)

(declare-fun e!86166 () Bool)

(assert (=> d!40159 e!86166))

(declare-fun res!63664 () Bool)

(assert (=> d!40159 (=> res!63664 e!86166)))

(declare-fun lt!68994 () Bool)

(assert (=> d!40159 (= res!63664 (not lt!68994))))

(declare-fun lt!68993 () Bool)

(assert (=> d!40159 (= lt!68994 lt!68993)))

(declare-fun lt!68992 () Unit!4116)

(declare-fun e!86165 () Unit!4116)

(assert (=> d!40159 (= lt!68992 e!86165)))

(declare-fun c!24427 () Bool)

(assert (=> d!40159 (= c!24427 lt!68993)))

(assert (=> d!40159 (= lt!68993 (containsKey!175 (toList!867 call!14466) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> d!40159 (= (contains!895 call!14466 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) lt!68994)))

(declare-fun b!132158 () Bool)

(declare-fun lt!68995 () Unit!4116)

(assert (=> b!132158 (= e!86165 lt!68995)))

(assert (=> b!132158 (= lt!68995 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!867 call!14466) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> b!132158 (isDefined!124 (getValueByKey!171 (toList!867 call!14466) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun b!132159 () Bool)

(declare-fun Unit!4133 () Unit!4116)

(assert (=> b!132159 (= e!86165 Unit!4133)))

(declare-fun b!132160 () Bool)

(assert (=> b!132160 (= e!86166 (isDefined!124 (getValueByKey!171 (toList!867 call!14466) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355))))))

(assert (= (and d!40159 c!24427) b!132158))

(assert (= (and d!40159 (not c!24427)) b!132159))

(assert (= (and d!40159 (not res!63664)) b!132160))

(assert (=> d!40159 m!155029))

(declare-fun m!155797 () Bool)

(assert (=> d!40159 m!155797))

(assert (=> b!132158 m!155029))

(declare-fun m!155799 () Bool)

(assert (=> b!132158 m!155799))

(assert (=> b!132158 m!155029))

(declare-fun m!155801 () Bool)

(assert (=> b!132158 m!155801))

(assert (=> b!132158 m!155801))

(declare-fun m!155803 () Bool)

(assert (=> b!132158 m!155803))

(assert (=> b!132160 m!155029))

(assert (=> b!132160 m!155801))

(assert (=> b!132160 m!155801))

(assert (=> b!132160 m!155803))

(assert (=> b!131809 d!40159))

(declare-fun b!132177 () Bool)

(declare-fun e!86176 () Bool)

(declare-fun call!14525 () Bool)

(assert (=> b!132177 (= e!86176 (not call!14525))))

(declare-fun b!132178 () Bool)

(declare-fun e!86178 () Bool)

(assert (=> b!132178 (= e!86178 (not call!14525))))

(declare-fun b!132179 () Bool)

(declare-fun e!86177 () Bool)

(declare-fun lt!69000 () SeekEntryResult!274)

(assert (=> b!132179 (= e!86177 ((_ is Undefined!274) lt!69000))))

(declare-fun b!132180 () Bool)

(declare-fun res!63673 () Bool)

(assert (=> b!132180 (=> (not res!63673) (not e!86178))))

(assert (=> b!132180 (= res!63673 (= (select (arr!2255 (_keys!4601 newMap!16)) (index!3258 lt!69000)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132180 (and (bvsge (index!3258 lt!69000) #b00000000000000000000000000000000) (bvslt (index!3258 lt!69000) (size!2523 (_keys!4601 newMap!16))))))

(declare-fun d!40161 () Bool)

(declare-fun e!86175 () Bool)

(assert (=> d!40161 e!86175))

(declare-fun c!24432 () Bool)

(assert (=> d!40161 (= c!24432 ((_ is MissingZero!274) lt!69000))))

(assert (=> d!40161 (= lt!69000 (seekEntryOrOpen!0 (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4601 newMap!16) (mask!7148 newMap!16)))))

(declare-fun lt!69001 () Unit!4116)

(declare-fun choose!816 (array!4767 array!4769 (_ BitVec 32) (_ BitVec 32) V!3475 V!3475 (_ BitVec 64) Int) Unit!4116)

(assert (=> d!40161 (= lt!69001 (choose!816 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2854 newMap!16)))))

(assert (=> d!40161 (validMask!0 (mask!7148 newMap!16))))

(assert (=> d!40161 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!60 (_keys!4601 newMap!16) (_values!2837 newMap!16) (mask!7148 newMap!16) (extraKeys!2621 newMap!16) (zeroValue!2710 newMap!16) (minValue!2710 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2854 newMap!16)) lt!69001)))

(declare-fun call!14524 () Bool)

(declare-fun bm!14521 () Bool)

(assert (=> bm!14521 (= call!14524 (inRange!0 (ite c!24432 (index!3255 lt!69000) (index!3258 lt!69000)) (mask!7148 newMap!16)))))

(declare-fun b!132181 () Bool)

(assert (=> b!132181 (= e!86175 e!86176)))

(declare-fun res!63675 () Bool)

(assert (=> b!132181 (= res!63675 call!14524)))

(assert (=> b!132181 (=> (not res!63675) (not e!86176))))

(declare-fun b!132182 () Bool)

(declare-fun res!63674 () Bool)

(assert (=> b!132182 (=> (not res!63674) (not e!86178))))

(assert (=> b!132182 (= res!63674 call!14524)))

(assert (=> b!132182 (= e!86177 e!86178)))

(declare-fun b!132183 () Bool)

(assert (=> b!132183 (= e!86175 e!86177)))

(declare-fun c!24433 () Bool)

(assert (=> b!132183 (= c!24433 ((_ is MissingVacant!274) lt!69000))))

(declare-fun b!132184 () Bool)

(assert (=> b!132184 (and (bvsge (index!3255 lt!69000) #b00000000000000000000000000000000) (bvslt (index!3255 lt!69000) (size!2523 (_keys!4601 newMap!16))))))

(declare-fun res!63676 () Bool)

(assert (=> b!132184 (= res!63676 (= (select (arr!2255 (_keys!4601 newMap!16)) (index!3255 lt!69000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132184 (=> (not res!63676) (not e!86176))))

(declare-fun bm!14522 () Bool)

(assert (=> bm!14522 (= call!14525 (arrayContainsKey!0 (_keys!4601 newMap!16) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(assert (= (and d!40161 c!24432) b!132181))

(assert (= (and d!40161 (not c!24432)) b!132183))

(assert (= (and b!132181 res!63675) b!132184))

(assert (= (and b!132184 res!63676) b!132177))

(assert (= (and b!132183 c!24433) b!132182))

(assert (= (and b!132183 (not c!24433)) b!132179))

(assert (= (and b!132182 res!63674) b!132180))

(assert (= (and b!132180 res!63673) b!132178))

(assert (= (or b!132181 b!132182) bm!14521))

(assert (= (or b!132177 b!132178) bm!14522))

(assert (=> d!40161 m!155029))

(assert (=> d!40161 m!155209))

(assert (=> d!40161 m!155029))

(declare-fun m!155805 () Bool)

(assert (=> d!40161 m!155805))

(assert (=> d!40161 m!155247))

(declare-fun m!155807 () Bool)

(assert (=> b!132184 m!155807))

(assert (=> bm!14522 m!155029))

(assert (=> bm!14522 m!155225))

(declare-fun m!155809 () Bool)

(assert (=> bm!14521 m!155809))

(declare-fun m!155811 () Bool)

(assert (=> b!132180 m!155811))

(assert (=> bm!14451 d!40161))

(declare-fun d!40163 () Bool)

(declare-fun e!86180 () Bool)

(assert (=> d!40163 e!86180))

(declare-fun res!63677 () Bool)

(assert (=> d!40163 (=> res!63677 e!86180)))

(declare-fun lt!69004 () Bool)

(assert (=> d!40163 (= res!63677 (not lt!69004))))

(declare-fun lt!69003 () Bool)

(assert (=> d!40163 (= lt!69004 lt!69003)))

(declare-fun lt!69002 () Unit!4116)

(declare-fun e!86179 () Unit!4116)

(assert (=> d!40163 (= lt!69002 e!86179)))

(declare-fun c!24434 () Bool)

(assert (=> d!40163 (= c!24434 lt!69003)))

(assert (=> d!40163 (= lt!69003 (containsKey!175 (toList!867 lt!68594) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!40163 (= (contains!895 lt!68594 #b0000000000000000000000000000000000000000000000000000000000000000) lt!69004)))

(declare-fun b!132185 () Bool)

(declare-fun lt!69005 () Unit!4116)

(assert (=> b!132185 (= e!86179 lt!69005)))

(assert (=> b!132185 (= lt!69005 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!867 lt!68594) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132185 (isDefined!124 (getValueByKey!171 (toList!867 lt!68594) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132186 () Bool)

(declare-fun Unit!4134 () Unit!4116)

(assert (=> b!132186 (= e!86179 Unit!4134)))

(declare-fun b!132187 () Bool)

(assert (=> b!132187 (= e!86180 (isDefined!124 (getValueByKey!171 (toList!867 lt!68594) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40163 c!24434) b!132185))

(assert (= (and d!40163 (not c!24434)) b!132186))

(assert (= (and d!40163 (not res!63677)) b!132187))

(declare-fun m!155813 () Bool)

(assert (=> d!40163 m!155813))

(declare-fun m!155815 () Bool)

(assert (=> b!132185 m!155815))

(assert (=> b!132185 m!155657))

(assert (=> b!132185 m!155657))

(declare-fun m!155817 () Bool)

(assert (=> b!132185 m!155817))

(assert (=> b!132187 m!155657))

(assert (=> b!132187 m!155657))

(assert (=> b!132187 m!155817))

(assert (=> bm!14393 d!40163))

(declare-fun d!40165 () Bool)

(declare-fun res!63682 () Bool)

(declare-fun e!86185 () Bool)

(assert (=> d!40165 (=> res!63682 e!86185)))

(assert (=> d!40165 (= res!63682 (and ((_ is Cons!1710) (toList!867 lt!68520)) (= (_1!1320 (h!2315 (toList!867 lt!68520))) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355))))))

(assert (=> d!40165 (= (containsKey!175 (toList!867 lt!68520) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)) e!86185)))

(declare-fun b!132192 () Bool)

(declare-fun e!86186 () Bool)

(assert (=> b!132192 (= e!86185 e!86186)))

(declare-fun res!63683 () Bool)

(assert (=> b!132192 (=> (not res!63683) (not e!86186))))

(assert (=> b!132192 (= res!63683 (and (or (not ((_ is Cons!1710) (toList!867 lt!68520))) (bvsle (_1!1320 (h!2315 (toList!867 lt!68520))) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355))) ((_ is Cons!1710) (toList!867 lt!68520)) (bvslt (_1!1320 (h!2315 (toList!867 lt!68520))) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355))))))

(declare-fun b!132193 () Bool)

(assert (=> b!132193 (= e!86186 (containsKey!175 (t!6149 (toList!867 lt!68520)) (select (arr!2255 (_keys!4601 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (= (and d!40165 (not res!63682)) b!132192))

(assert (= (and b!132192 res!63683) b!132193))

(assert (=> b!132193 m!155029))

(declare-fun m!155819 () Bool)

(assert (=> b!132193 m!155819))

(assert (=> d!40031 d!40165))

(declare-fun b!132195 () Bool)

(declare-fun e!86188 () Bool)

(assert (=> b!132195 (= e!86188 tp_is_empty!2871)))

(declare-fun mapNonEmpty!4631 () Bool)

(declare-fun mapRes!4631 () Bool)

(declare-fun tp!11183 () Bool)

(declare-fun e!86187 () Bool)

(assert (=> mapNonEmpty!4631 (= mapRes!4631 (and tp!11183 e!86187))))

(declare-fun mapValue!4631 () ValueCell!1092)

(declare-fun mapRest!4631 () (Array (_ BitVec 32) ValueCell!1092))

(declare-fun mapKey!4631 () (_ BitVec 32))

(assert (=> mapNonEmpty!4631 (= mapRest!4629 (store mapRest!4631 mapKey!4631 mapValue!4631))))

(declare-fun b!132194 () Bool)

(assert (=> b!132194 (= e!86187 tp_is_empty!2871)))

(declare-fun mapIsEmpty!4631 () Bool)

(assert (=> mapIsEmpty!4631 mapRes!4631))

(declare-fun condMapEmpty!4631 () Bool)

(declare-fun mapDefault!4631 () ValueCell!1092)

(assert (=> mapNonEmpty!4629 (= condMapEmpty!4631 (= mapRest!4629 ((as const (Array (_ BitVec 32) ValueCell!1092)) mapDefault!4631)))))

(assert (=> mapNonEmpty!4629 (= tp!11181 (and e!86188 mapRes!4631))))

(assert (= (and mapNonEmpty!4629 condMapEmpty!4631) mapIsEmpty!4631))

(assert (= (and mapNonEmpty!4629 (not condMapEmpty!4631)) mapNonEmpty!4631))

(assert (= (and mapNonEmpty!4631 ((_ is ValueCellFull!1092) mapValue!4631)) b!132194))

(assert (= (and mapNonEmpty!4629 ((_ is ValueCellFull!1092) mapDefault!4631)) b!132195))

(declare-fun m!155821 () Bool)

(assert (=> mapNonEmpty!4631 m!155821))

(declare-fun b!132197 () Bool)

(declare-fun e!86190 () Bool)

(assert (=> b!132197 (= e!86190 tp_is_empty!2871)))

(declare-fun mapNonEmpty!4632 () Bool)

(declare-fun mapRes!4632 () Bool)

(declare-fun tp!11184 () Bool)

(declare-fun e!86189 () Bool)

(assert (=> mapNonEmpty!4632 (= mapRes!4632 (and tp!11184 e!86189))))

(declare-fun mapKey!4632 () (_ BitVec 32))

(declare-fun mapValue!4632 () ValueCell!1092)

(declare-fun mapRest!4632 () (Array (_ BitVec 32) ValueCell!1092))

(assert (=> mapNonEmpty!4632 (= mapRest!4630 (store mapRest!4632 mapKey!4632 mapValue!4632))))

(declare-fun b!132196 () Bool)

(assert (=> b!132196 (= e!86189 tp_is_empty!2871)))

(declare-fun mapIsEmpty!4632 () Bool)

(assert (=> mapIsEmpty!4632 mapRes!4632))

(declare-fun condMapEmpty!4632 () Bool)

(declare-fun mapDefault!4632 () ValueCell!1092)

(assert (=> mapNonEmpty!4630 (= condMapEmpty!4632 (= mapRest!4630 ((as const (Array (_ BitVec 32) ValueCell!1092)) mapDefault!4632)))))

(assert (=> mapNonEmpty!4630 (= tp!11182 (and e!86190 mapRes!4632))))

(assert (= (and mapNonEmpty!4630 condMapEmpty!4632) mapIsEmpty!4632))

(assert (= (and mapNonEmpty!4630 (not condMapEmpty!4632)) mapNonEmpty!4632))

(assert (= (and mapNonEmpty!4632 ((_ is ValueCellFull!1092) mapValue!4632)) b!132196))

(assert (= (and mapNonEmpty!4630 ((_ is ValueCellFull!1092) mapDefault!4632)) b!132197))

(declare-fun m!155823 () Bool)

(assert (=> mapNonEmpty!4632 m!155823))

(declare-fun b_lambda!5877 () Bool)

(assert (= b_lambda!5873 (or (and b!131538 b_free!2909 (= (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) (defaultEntry!2854 newMap!16))) (and b!131534 b_free!2911) b_lambda!5877)))

(declare-fun b_lambda!5879 () Bool)

(assert (= b_lambda!5867 (or (and b!131538 b_free!2909) (and b!131534 b_free!2911 (= (defaultEntry!2854 newMap!16) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))))) b_lambda!5879)))

(declare-fun b_lambda!5881 () Bool)

(assert (= b_lambda!5875 (or (and b!131538 b_free!2909 (= (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) (defaultEntry!2854 newMap!16))) (and b!131534 b_free!2911) b_lambda!5881)))

(declare-fun b_lambda!5883 () Bool)

(assert (= b_lambda!5871 (or (and b!131538 b_free!2909 (= (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))) (defaultEntry!2854 newMap!16))) (and b!131534 b_free!2911) b_lambda!5883)))

(declare-fun b_lambda!5885 () Bool)

(assert (= b_lambda!5869 (or (and b!131538 b_free!2909) (and b!131534 b_free!2911 (= (defaultEntry!2854 newMap!16) (defaultEntry!2854 (v!3187 (underlying!452 thiss!992))))) b_lambda!5885)))

(check-sat (not bm!14492) (not b!131876) (not b_next!2911) (not bm!14522) (not b!132088) (not b!131931) (not bm!14505) (not b!132045) (not b!131855) (not d!40071) (not b!132098) (not d!40103) (not d!40087) (not b!132079) (not bm!14511) (not b!132145) (not bm!14508) (not d!40067) (not b_lambda!5883) (not b!132185) (not b!131878) (not b!131913) (not mapNonEmpty!4632) (not d!40117) (not d!40057) (not d!40075) (not b!131881) (not b!132040) (not b!132160) (not b!132133) (not b!132115) (not d!40105) (not b!131991) (not d!40041) (not bm!14489) (not b!132187) (not b!132027) (not b!131951) tp_is_empty!2871 (not d!40107) (not b!132093) (not d!40059) (not mapNonEmpty!4631) (not b!131880) (not d!40055) (not d!40079) (not bm!14514) (not bm!14490) (not d!40113) (not b!132137) (not d!40161) (not b!132049) (not d!40145) (not b!132151) (not b!132005) (not b!131882) (not d!40095) (not bm!14495) (not b!131883) (not b!131988) (not b!132006) (not d!40043) (not b!132046) (not b!132134) (not b!132017) (not b!132095) (not b!132082) (not b!132146) (not d!40077) (not bm!14507) (not b!132053) (not b!131916) (not d!40091) (not b_lambda!5865) (not d!40149) (not b!132058) (not b!132089) (not bm!14476) (not b!132014) (not d!40109) (not d!40101) (not d!40159) (not bm!14501) (not b!132158) (not b!132073) (not b_lambda!5877) (not b!131990) (not b!131996) (not b_lambda!5861) (not b!132125) (not b!131921) (not b!132057) b_and!8185 (not bm!14516) (not d!40089) (not b_lambda!5881) (not bm!14479) (not b!131997) (not b!132100) (not bm!14502) (not bm!14499) (not b_lambda!5885) (not b!132193) (not b!131879) (not d!40047) (not d!40039) (not b!132094) (not b!132071) (not b!132055) b_and!8183 (not bm!14515) (not b!132091) (not bm!14521) (not b!132061) (not b!132080) (not b!132033) (not b!132139) (not d!40119) (not b!132051) (not b!132113) (not b!132096) (not bm!14510) (not b!132059) (not bm!14498) (not b!131952) (not b!132036) (not b!132054) (not b!131870) (not b!132068) (not b!132111) (not b!132032) (not d!40093) (not d!40085) (not d!40125) (not b!131912) (not b!131994) (not b!132077) (not b!132127) (not b!132013) (not d!40163) (not bm!14494) (not b_next!2909) (not b!132122) (not d!40115) (not b!131910) (not d!40155) (not d!40121) (not b_lambda!5879) (not b!132020) (not b!132039) (not b!131953) (not d!40131) (not b!132131) (not b!132157) (not b!132074) (not b!132007) (not b!132018) (not b!131918) (not bm!14491) (not b!132155) (not d!40099) (not d!40111) (not b!132148) (not b!131877) (not b!131885) (not d!40127) (not d!40133) (not b!132052) (not d!40139) (not b!131859) (not b!132110) (not b!131920) (not d!40073) (not b!132128) (not b!131919) (not d!40157) (not d!40153) (not d!40137) (not d!40097) (not b!132154) (not b!132030) (not d!40123) (not bm!14506) (not b!132038) (not d!40151) (not d!40049))
(check-sat b_and!8183 b_and!8185 (not b_next!2909) (not b_next!2911))
