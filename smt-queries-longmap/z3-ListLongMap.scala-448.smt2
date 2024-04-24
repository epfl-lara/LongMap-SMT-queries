; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8304 () Bool)

(assert start!8304)

(declare-fun b!54074 () Bool)

(declare-fun b_free!1765 () Bool)

(declare-fun b_next!1765 () Bool)

(assert (=> b!54074 (= b_free!1765 (not b_next!1765))))

(declare-fun tp!7398 () Bool)

(declare-fun b_and!3069 () Bool)

(assert (=> b!54074 (= tp!7398 b_and!3069)))

(declare-fun b!54068 () Bool)

(declare-fun b_free!1767 () Bool)

(declare-fun b_next!1767 () Bool)

(assert (=> b!54068 (= b_free!1767 (not b_next!1767))))

(declare-fun tp!7396 () Bool)

(declare-fun b_and!3071 () Bool)

(assert (=> b!54068 (= tp!7396 b_and!3071)))

(declare-fun b!54063 () Bool)

(declare-fun e!35304 () Bool)

(declare-fun e!35291 () Bool)

(assert (=> b!54063 (= e!35304 e!35291)))

(declare-fun res!30623 () Bool)

(assert (=> b!54063 (=> (not res!30623) (not e!35291))))

(declare-datatypes ((V!2713 0))(
  ( (V!2714 (val!1194 Int)) )
))
(declare-datatypes ((array!3507 0))(
  ( (array!3508 (arr!1676 (Array (_ BitVec 32) (_ BitVec 64))) (size!1905 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!806 0))(
  ( (ValueCellFull!806 (v!2277 V!2713)) (EmptyCell!806) )
))
(declare-datatypes ((array!3509 0))(
  ( (array!3510 (arr!1677 (Array (_ BitVec 32) ValueCell!806)) (size!1906 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!520 0))(
  ( (LongMapFixedSize!521 (defaultEntry!1974 Int) (mask!5817 (_ BitVec 32)) (extraKeys!1865 (_ BitVec 32)) (zeroValue!1892 V!2713) (minValue!1892 V!2713) (_size!309 (_ BitVec 32)) (_keys!3594 array!3507) (_values!1957 array!3509) (_vacant!309 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!340 0))(
  ( (Cell!341 (v!2278 LongMapFixedSize!520)) )
))
(declare-datatypes ((LongMap!340 0))(
  ( (LongMap!341 (underlying!181 Cell!340)) )
))
(declare-fun thiss!992 () LongMap!340)

(declare-datatypes ((tuple2!1902 0))(
  ( (tuple2!1903 (_1!962 (_ BitVec 64)) (_2!962 V!2713)) )
))
(declare-datatypes ((List!1356 0))(
  ( (Nil!1353) (Cons!1352 (h!1932 tuple2!1902) (t!4490 List!1356)) )
))
(declare-datatypes ((ListLongMap!1279 0))(
  ( (ListLongMap!1280 (toList!655 List!1356)) )
))
(declare-fun lt!21550 () ListLongMap!1279)

(declare-fun lt!21549 () ListLongMap!1279)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!54063 (= res!30623 (and (= lt!21549 lt!21550) (not (= (select (arr!1676 (_keys!3594 (v!2278 (underlying!181 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1676 (_keys!3594 (v!2278 (underlying!181 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!520)

(declare-fun map!1047 (LongMapFixedSize!520) ListLongMap!1279)

(assert (=> b!54063 (= lt!21550 (map!1047 newMap!16))))

(declare-fun getCurrentListMap!359 (array!3507 array!3509 (_ BitVec 32) (_ BitVec 32) V!2713 V!2713 (_ BitVec 32) Int) ListLongMap!1279)

(assert (=> b!54063 (= lt!21549 (getCurrentListMap!359 (_keys!3594 (v!2278 (underlying!181 thiss!992))) (_values!1957 (v!2278 (underlying!181 thiss!992))) (mask!5817 (v!2278 (underlying!181 thiss!992))) (extraKeys!1865 (v!2278 (underlying!181 thiss!992))) (zeroValue!1892 (v!2278 (underlying!181 thiss!992))) (minValue!1892 (v!2278 (underlying!181 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1974 (v!2278 (underlying!181 thiss!992)))))))

(declare-fun b!54064 () Bool)

(declare-fun e!35299 () Bool)

(declare-fun e!35297 () Bool)

(assert (=> b!54064 (= e!35299 e!35297)))

(declare-fun b!54065 () Bool)

(declare-fun res!30625 () Bool)

(assert (=> b!54065 (=> (not res!30625) (not e!35304))))

(declare-fun valid!208 (LongMapFixedSize!520) Bool)

(assert (=> b!54065 (= res!30625 (valid!208 newMap!16))))

(declare-fun b!54066 () Bool)

(declare-fun e!35292 () Bool)

(assert (=> b!54066 (= e!35292 e!35299)))

(declare-fun b!54067 () Bool)

(declare-fun res!30624 () Bool)

(assert (=> b!54067 (=> (not res!30624) (not e!35304))))

(assert (=> b!54067 (= res!30624 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5817 newMap!16)) (_size!309 (v!2278 (underlying!181 thiss!992)))))))

(declare-fun e!35294 () Bool)

(declare-fun e!35301 () Bool)

(declare-fun tp_is_empty!2299 () Bool)

(declare-fun array_inv!1025 (array!3507) Bool)

(declare-fun array_inv!1026 (array!3509) Bool)

(assert (=> b!54068 (= e!35301 (and tp!7396 tp_is_empty!2299 (array_inv!1025 (_keys!3594 newMap!16)) (array_inv!1026 (_values!1957 newMap!16)) e!35294))))

(declare-fun res!30626 () Bool)

(assert (=> start!8304 (=> (not res!30626) (not e!35304))))

(declare-fun valid!209 (LongMap!340) Bool)

(assert (=> start!8304 (= res!30626 (valid!209 thiss!992))))

(assert (=> start!8304 e!35304))

(assert (=> start!8304 e!35292))

(assert (=> start!8304 true))

(assert (=> start!8304 e!35301))

(declare-fun b!54069 () Bool)

(declare-fun e!35302 () Bool)

(assert (=> b!54069 (= e!35302 false)))

(declare-fun lt!21551 () Bool)

(declare-fun contains!633 (ListLongMap!1279 (_ BitVec 64)) Bool)

(assert (=> b!54069 (= lt!21551 (contains!633 lt!21549 (select (arr!1676 (_keys!3594 (v!2278 (underlying!181 thiss!992)))) from!355)))))

(declare-fun mapIsEmpty!2567 () Bool)

(declare-fun mapRes!2568 () Bool)

(assert (=> mapIsEmpty!2567 mapRes!2568))

(declare-fun mapIsEmpty!2568 () Bool)

(declare-fun mapRes!2567 () Bool)

(assert (=> mapIsEmpty!2568 mapRes!2567))

(declare-fun b!54070 () Bool)

(declare-fun e!35305 () Bool)

(assert (=> b!54070 (= e!35305 tp_is_empty!2299)))

(declare-fun b!54071 () Bool)

(declare-fun res!30618 () Bool)

(assert (=> b!54071 (=> (not res!30618) (not e!35302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!54071 (= res!30618 (validMask!0 (mask!5817 (v!2278 (underlying!181 thiss!992)))))))

(declare-fun b!54072 () Bool)

(declare-fun e!35295 () Bool)

(assert (=> b!54072 (= e!35295 tp_is_empty!2299)))

(declare-fun b!54073 () Bool)

(declare-fun e!35296 () Bool)

(assert (=> b!54073 (= e!35296 tp_is_empty!2299)))

(declare-fun e!35298 () Bool)

(assert (=> b!54074 (= e!35297 (and tp!7398 tp_is_empty!2299 (array_inv!1025 (_keys!3594 (v!2278 (underlying!181 thiss!992)))) (array_inv!1026 (_values!1957 (v!2278 (underlying!181 thiss!992)))) e!35298))))

(declare-fun b!54075 () Bool)

(declare-fun res!30622 () Bool)

(assert (=> b!54075 (=> (not res!30622) (not e!35302))))

(assert (=> b!54075 (= res!30622 (and (= (size!1906 (_values!1957 (v!2278 (underlying!181 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5817 (v!2278 (underlying!181 thiss!992))))) (= (size!1905 (_keys!3594 (v!2278 (underlying!181 thiss!992)))) (size!1906 (_values!1957 (v!2278 (underlying!181 thiss!992))))) (bvsge (mask!5817 (v!2278 (underlying!181 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1865 (v!2278 (underlying!181 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1865 (v!2278 (underlying!181 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!54076 () Bool)

(declare-fun e!35300 () Bool)

(assert (=> b!54076 (= e!35294 (and e!35300 mapRes!2567))))

(declare-fun condMapEmpty!2567 () Bool)

(declare-fun mapDefault!2568 () ValueCell!806)

(assert (=> b!54076 (= condMapEmpty!2567 (= (arr!1677 (_values!1957 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!806)) mapDefault!2568)))))

(declare-fun b!54077 () Bool)

(declare-fun res!30627 () Bool)

(assert (=> b!54077 (=> (not res!30627) (not e!35302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3507 (_ BitVec 32)) Bool)

(assert (=> b!54077 (= res!30627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3594 (v!2278 (underlying!181 thiss!992))) (mask!5817 (v!2278 (underlying!181 thiss!992)))))))

(declare-fun mapNonEmpty!2567 () Bool)

(declare-fun tp!7395 () Bool)

(assert (=> mapNonEmpty!2567 (= mapRes!2567 (and tp!7395 e!35305))))

(declare-fun mapValue!2567 () ValueCell!806)

(declare-fun mapKey!2567 () (_ BitVec 32))

(declare-fun mapRest!2568 () (Array (_ BitVec 32) ValueCell!806))

(assert (=> mapNonEmpty!2567 (= (arr!1677 (_values!1957 newMap!16)) (store mapRest!2568 mapKey!2567 mapValue!2567))))

(declare-fun b!54078 () Bool)

(declare-fun res!30620 () Bool)

(assert (=> b!54078 (=> (not res!30620) (not e!35304))))

(assert (=> b!54078 (= res!30620 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1905 (_keys!3594 (v!2278 (underlying!181 thiss!992)))))))))

(declare-fun b!54079 () Bool)

(assert (=> b!54079 (= e!35291 e!35302)))

(declare-fun res!30621 () Bool)

(assert (=> b!54079 (=> (not res!30621) (not e!35302))))

(assert (=> b!54079 (= res!30621 (contains!633 lt!21550 (select (arr!1676 (_keys!3594 (v!2278 (underlying!181 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1904 0))(
  ( (tuple2!1905 (_1!963 Bool) (_2!963 LongMapFixedSize!520)) )
))
(declare-fun lt!21548 () tuple2!1904)

(declare-fun update!62 (LongMapFixedSize!520 (_ BitVec 64) V!2713) tuple2!1904)

(declare-fun get!1011 (ValueCell!806 V!2713) V!2713)

(declare-fun dynLambda!280 (Int (_ BitVec 64)) V!2713)

(assert (=> b!54079 (= lt!21548 (update!62 newMap!16 (select (arr!1676 (_keys!3594 (v!2278 (underlying!181 thiss!992)))) from!355) (get!1011 (select (arr!1677 (_values!1957 (v!2278 (underlying!181 thiss!992)))) from!355) (dynLambda!280 (defaultEntry!1974 (v!2278 (underlying!181 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!54080 () Bool)

(declare-fun res!30619 () Bool)

(assert (=> b!54080 (=> (not res!30619) (not e!35302))))

(declare-datatypes ((List!1357 0))(
  ( (Nil!1354) (Cons!1353 (h!1933 (_ BitVec 64)) (t!4491 List!1357)) )
))
(declare-fun arrayNoDuplicates!0 (array!3507 (_ BitVec 32) List!1357) Bool)

(assert (=> b!54080 (= res!30619 (arrayNoDuplicates!0 (_keys!3594 (v!2278 (underlying!181 thiss!992))) #b00000000000000000000000000000000 Nil!1354))))

(declare-fun b!54081 () Bool)

(assert (=> b!54081 (= e!35298 (and e!35296 mapRes!2568))))

(declare-fun condMapEmpty!2568 () Bool)

(declare-fun mapDefault!2567 () ValueCell!806)

(assert (=> b!54081 (= condMapEmpty!2568 (= (arr!1677 (_values!1957 (v!2278 (underlying!181 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!806)) mapDefault!2567)))))

(declare-fun b!54082 () Bool)

(declare-fun res!30628 () Bool)

(assert (=> b!54082 (=> (not res!30628) (not e!35302))))

(assert (=> b!54082 (= res!30628 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1905 (_keys!3594 (v!2278 (underlying!181 thiss!992)))))))))

(declare-fun mapNonEmpty!2568 () Bool)

(declare-fun tp!7397 () Bool)

(assert (=> mapNonEmpty!2568 (= mapRes!2568 (and tp!7397 e!35295))))

(declare-fun mapValue!2568 () ValueCell!806)

(declare-fun mapRest!2567 () (Array (_ BitVec 32) ValueCell!806))

(declare-fun mapKey!2568 () (_ BitVec 32))

(assert (=> mapNonEmpty!2568 (= (arr!1677 (_values!1957 (v!2278 (underlying!181 thiss!992)))) (store mapRest!2567 mapKey!2568 mapValue!2568))))

(declare-fun b!54083 () Bool)

(assert (=> b!54083 (= e!35300 tp_is_empty!2299)))

(assert (= (and start!8304 res!30626) b!54078))

(assert (= (and b!54078 res!30620) b!54065))

(assert (= (and b!54065 res!30625) b!54067))

(assert (= (and b!54067 res!30624) b!54063))

(assert (= (and b!54063 res!30623) b!54079))

(assert (= (and b!54079 res!30621) b!54071))

(assert (= (and b!54071 res!30618) b!54075))

(assert (= (and b!54075 res!30622) b!54077))

(assert (= (and b!54077 res!30627) b!54080))

(assert (= (and b!54080 res!30619) b!54082))

(assert (= (and b!54082 res!30628) b!54069))

(assert (= (and b!54081 condMapEmpty!2568) mapIsEmpty!2567))

(assert (= (and b!54081 (not condMapEmpty!2568)) mapNonEmpty!2568))

(get-info :version)

(assert (= (and mapNonEmpty!2568 ((_ is ValueCellFull!806) mapValue!2568)) b!54072))

(assert (= (and b!54081 ((_ is ValueCellFull!806) mapDefault!2567)) b!54073))

(assert (= b!54074 b!54081))

(assert (= b!54064 b!54074))

(assert (= b!54066 b!54064))

(assert (= start!8304 b!54066))

(assert (= (and b!54076 condMapEmpty!2567) mapIsEmpty!2568))

(assert (= (and b!54076 (not condMapEmpty!2567)) mapNonEmpty!2567))

(assert (= (and mapNonEmpty!2567 ((_ is ValueCellFull!806) mapValue!2567)) b!54070))

(assert (= (and b!54076 ((_ is ValueCellFull!806) mapDefault!2568)) b!54083))

(assert (= b!54068 b!54076))

(assert (= start!8304 b!54068))

(declare-fun b_lambda!2393 () Bool)

(assert (=> (not b_lambda!2393) (not b!54079)))

(declare-fun t!4487 () Bool)

(declare-fun tb!1109 () Bool)

(assert (=> (and b!54074 (= (defaultEntry!1974 (v!2278 (underlying!181 thiss!992))) (defaultEntry!1974 (v!2278 (underlying!181 thiss!992)))) t!4487) tb!1109))

(declare-fun result!2061 () Bool)

(assert (=> tb!1109 (= result!2061 tp_is_empty!2299)))

(assert (=> b!54079 t!4487))

(declare-fun b_and!3073 () Bool)

(assert (= b_and!3069 (and (=> t!4487 result!2061) b_and!3073)))

(declare-fun t!4489 () Bool)

(declare-fun tb!1111 () Bool)

(assert (=> (and b!54068 (= (defaultEntry!1974 newMap!16) (defaultEntry!1974 (v!2278 (underlying!181 thiss!992)))) t!4489) tb!1111))

(declare-fun result!2065 () Bool)

(assert (= result!2065 result!2061))

(assert (=> b!54079 t!4489))

(declare-fun b_and!3075 () Bool)

(assert (= b_and!3071 (and (=> t!4489 result!2065) b_and!3075)))

(declare-fun m!45721 () Bool)

(assert (=> b!54069 m!45721))

(assert (=> b!54069 m!45721))

(declare-fun m!45723 () Bool)

(assert (=> b!54069 m!45723))

(declare-fun m!45725 () Bool)

(assert (=> b!54065 m!45725))

(assert (=> b!54063 m!45721))

(declare-fun m!45727 () Bool)

(assert (=> b!54063 m!45727))

(declare-fun m!45729 () Bool)

(assert (=> b!54063 m!45729))

(declare-fun m!45731 () Bool)

(assert (=> b!54074 m!45731))

(declare-fun m!45733 () Bool)

(assert (=> b!54074 m!45733))

(declare-fun m!45735 () Bool)

(assert (=> start!8304 m!45735))

(declare-fun m!45737 () Bool)

(assert (=> b!54071 m!45737))

(declare-fun m!45739 () Bool)

(assert (=> b!54080 m!45739))

(declare-fun m!45741 () Bool)

(assert (=> mapNonEmpty!2567 m!45741))

(declare-fun m!45743 () Bool)

(assert (=> b!54079 m!45743))

(declare-fun m!45745 () Bool)

(assert (=> b!54079 m!45745))

(declare-fun m!45747 () Bool)

(assert (=> b!54079 m!45747))

(assert (=> b!54079 m!45721))

(declare-fun m!45749 () Bool)

(assert (=> b!54079 m!45749))

(assert (=> b!54079 m!45721))

(assert (=> b!54079 m!45745))

(assert (=> b!54079 m!45721))

(assert (=> b!54079 m!45747))

(declare-fun m!45751 () Bool)

(assert (=> b!54079 m!45751))

(assert (=> b!54079 m!45743))

(declare-fun m!45753 () Bool)

(assert (=> mapNonEmpty!2568 m!45753))

(declare-fun m!45755 () Bool)

(assert (=> b!54077 m!45755))

(declare-fun m!45757 () Bool)

(assert (=> b!54068 m!45757))

(declare-fun m!45759 () Bool)

(assert (=> b!54068 m!45759))

(check-sat (not mapNonEmpty!2568) (not b!54071) (not b!54065) (not b_next!1765) (not b!54068) (not b!54080) (not b_next!1767) (not b!54074) (not b!54063) b_and!3073 (not b!54079) tp_is_empty!2299 b_and!3075 (not b!54069) (not mapNonEmpty!2567) (not start!8304) (not b_lambda!2393) (not b!54077))
(check-sat b_and!3073 b_and!3075 (not b_next!1765) (not b_next!1767))
