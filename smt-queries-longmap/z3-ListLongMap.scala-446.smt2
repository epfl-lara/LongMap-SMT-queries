; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8290 () Bool)

(assert start!8290)

(declare-fun b!53802 () Bool)

(declare-fun b_free!1745 () Bool)

(declare-fun b_next!1745 () Bool)

(assert (=> b!53802 (= b_free!1745 (not b_next!1745))))

(declare-fun tp!7337 () Bool)

(declare-fun b_and!3031 () Bool)

(assert (=> b!53802 (= tp!7337 b_and!3031)))

(declare-fun b!53815 () Bool)

(declare-fun b_free!1747 () Bool)

(declare-fun b_next!1747 () Bool)

(assert (=> b!53815 (= b_free!1747 (not b_next!1747))))

(declare-fun tp!7338 () Bool)

(declare-fun b_and!3033 () Bool)

(assert (=> b!53815 (= tp!7338 b_and!3033)))

(declare-fun b!53795 () Bool)

(declare-fun res!30479 () Bool)

(declare-fun e!35104 () Bool)

(assert (=> b!53795 (=> (not res!30479) (not e!35104))))

(declare-datatypes ((V!2699 0))(
  ( (V!2700 (val!1189 Int)) )
))
(declare-datatypes ((array!3501 0))(
  ( (array!3502 (arr!1673 (Array (_ BitVec 32) (_ BitVec 64))) (size!1902 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!801 0))(
  ( (ValueCellFull!801 (v!2265 V!2699)) (EmptyCell!801) )
))
(declare-datatypes ((array!3503 0))(
  ( (array!3504 (arr!1674 (Array (_ BitVec 32) ValueCell!801)) (size!1903 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!510 0))(
  ( (LongMapFixedSize!511 (defaultEntry!1969 Int) (mask!5808 (_ BitVec 32)) (extraKeys!1860 (_ BitVec 32)) (zeroValue!1887 V!2699) (minValue!1887 V!2699) (_size!304 (_ BitVec 32)) (_keys!3589 array!3501) (_values!1952 array!3503) (_vacant!304 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!328 0))(
  ( (Cell!329 (v!2266 LongMapFixedSize!510)) )
))
(declare-datatypes ((LongMap!328 0))(
  ( (LongMap!329 (underlying!175 Cell!328)) )
))
(declare-fun thiss!992 () LongMap!328)

(declare-datatypes ((List!1363 0))(
  ( (Nil!1360) (Cons!1359 (h!1939 (_ BitVec 64)) (t!4477 List!1363)) )
))
(declare-fun arrayNoDuplicates!0 (array!3501 (_ BitVec 32) List!1363) Bool)

(assert (=> b!53795 (= res!30479 (arrayNoDuplicates!0 (_keys!3589 (v!2266 (underlying!175 thiss!992))) #b00000000000000000000000000000000 Nil!1360))))

(declare-fun mapIsEmpty!2537 () Bool)

(declare-fun mapRes!2538 () Bool)

(assert (=> mapIsEmpty!2537 mapRes!2538))

(declare-fun b!53796 () Bool)

(assert (=> b!53796 (= e!35104 false)))

(declare-datatypes ((tuple2!1896 0))(
  ( (tuple2!1897 (_1!959 (_ BitVec 64)) (_2!959 V!2699)) )
))
(declare-datatypes ((List!1364 0))(
  ( (Nil!1361) (Cons!1360 (h!1940 tuple2!1896) (t!4478 List!1364)) )
))
(declare-datatypes ((ListLongMap!1295 0))(
  ( (ListLongMap!1296 (toList!663 List!1364)) )
))
(declare-fun lt!21531 () ListLongMap!1295)

(declare-fun lt!21533 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!637 (ListLongMap!1295 (_ BitVec 64)) Bool)

(assert (=> b!53796 (= lt!21533 (contains!637 lt!21531 (select (arr!1673 (_keys!3589 (v!2266 (underlying!175 thiss!992)))) from!355)))))

(declare-fun b!53797 () Bool)

(declare-fun res!30483 () Bool)

(assert (=> b!53797 (=> (not res!30483) (not e!35104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3501 (_ BitVec 32)) Bool)

(assert (=> b!53797 (= res!30483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3589 (v!2266 (underlying!175 thiss!992))) (mask!5808 (v!2266 (underlying!175 thiss!992)))))))

(declare-fun b!53798 () Bool)

(declare-fun e!35115 () Bool)

(assert (=> b!53798 (= e!35115 e!35104)))

(declare-fun res!30481 () Bool)

(assert (=> b!53798 (=> (not res!30481) (not e!35104))))

(declare-fun lt!21532 () ListLongMap!1295)

(assert (=> b!53798 (= res!30481 (contains!637 lt!21532 (select (arr!1673 (_keys!3589 (v!2266 (underlying!175 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!510)

(declare-datatypes ((tuple2!1898 0))(
  ( (tuple2!1899 (_1!960 Bool) (_2!960 LongMapFixedSize!510)) )
))
(declare-fun lt!21534 () tuple2!1898)

(declare-fun update!45 (LongMapFixedSize!510 (_ BitVec 64) V!2699) tuple2!1898)

(declare-fun get!997 (ValueCell!801 V!2699) V!2699)

(declare-fun dynLambda!276 (Int (_ BitVec 64)) V!2699)

(assert (=> b!53798 (= lt!21534 (update!45 newMap!16 (select (arr!1673 (_keys!3589 (v!2266 (underlying!175 thiss!992)))) from!355) (get!997 (select (arr!1674 (_values!1952 (v!2266 (underlying!175 thiss!992)))) from!355) (dynLambda!276 (defaultEntry!1969 (v!2266 (underlying!175 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!53799 () Bool)

(declare-fun res!30478 () Bool)

(assert (=> b!53799 (=> (not res!30478) (not e!35104))))

(assert (=> b!53799 (= res!30478 (and (= (size!1903 (_values!1952 (v!2266 (underlying!175 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5808 (v!2266 (underlying!175 thiss!992))))) (= (size!1902 (_keys!3589 (v!2266 (underlying!175 thiss!992)))) (size!1903 (_values!1952 (v!2266 (underlying!175 thiss!992))))) (bvsge (mask!5808 (v!2266 (underlying!175 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1860 (v!2266 (underlying!175 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1860 (v!2266 (underlying!175 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun res!30484 () Bool)

(declare-fun e!35109 () Bool)

(assert (=> start!8290 (=> (not res!30484) (not e!35109))))

(declare-fun valid!193 (LongMap!328) Bool)

(assert (=> start!8290 (= res!30484 (valid!193 thiss!992))))

(assert (=> start!8290 e!35109))

(declare-fun e!35117 () Bool)

(assert (=> start!8290 e!35117))

(assert (=> start!8290 true))

(declare-fun e!35113 () Bool)

(assert (=> start!8290 e!35113))

(declare-fun b!53800 () Bool)

(declare-fun e!35116 () Bool)

(declare-fun tp_is_empty!2289 () Bool)

(assert (=> b!53800 (= e!35116 tp_is_empty!2289)))

(declare-fun b!53801 () Bool)

(assert (=> b!53801 (= e!35109 e!35115)))

(declare-fun res!30480 () Bool)

(assert (=> b!53801 (=> (not res!30480) (not e!35115))))

(assert (=> b!53801 (= res!30480 (and (= lt!21531 lt!21532) (not (= (select (arr!1673 (_keys!3589 (v!2266 (underlying!175 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1673 (_keys!3589 (v!2266 (underlying!175 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1041 (LongMapFixedSize!510) ListLongMap!1295)

(assert (=> b!53801 (= lt!21532 (map!1041 newMap!16))))

(declare-fun getCurrentListMap!374 (array!3501 array!3503 (_ BitVec 32) (_ BitVec 32) V!2699 V!2699 (_ BitVec 32) Int) ListLongMap!1295)

(assert (=> b!53801 (= lt!21531 (getCurrentListMap!374 (_keys!3589 (v!2266 (underlying!175 thiss!992))) (_values!1952 (v!2266 (underlying!175 thiss!992))) (mask!5808 (v!2266 (underlying!175 thiss!992))) (extraKeys!1860 (v!2266 (underlying!175 thiss!992))) (zeroValue!1887 (v!2266 (underlying!175 thiss!992))) (minValue!1887 (v!2266 (underlying!175 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1969 (v!2266 (underlying!175 thiss!992)))))))

(declare-fun e!35108 () Bool)

(declare-fun e!35110 () Bool)

(declare-fun array_inv!1033 (array!3501) Bool)

(declare-fun array_inv!1034 (array!3503) Bool)

(assert (=> b!53802 (= e!35108 (and tp!7337 tp_is_empty!2289 (array_inv!1033 (_keys!3589 (v!2266 (underlying!175 thiss!992)))) (array_inv!1034 (_values!1952 (v!2266 (underlying!175 thiss!992)))) e!35110))))

(declare-fun b!53803 () Bool)

(declare-fun res!30488 () Bool)

(assert (=> b!53803 (=> (not res!30488) (not e!35109))))

(assert (=> b!53803 (= res!30488 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5808 newMap!16)) (_size!304 (v!2266 (underlying!175 thiss!992)))))))

(declare-fun b!53804 () Bool)

(declare-fun e!35111 () Bool)

(assert (=> b!53804 (= e!35111 tp_is_empty!2289)))

(declare-fun mapNonEmpty!2537 () Bool)

(declare-fun mapRes!2537 () Bool)

(declare-fun tp!7336 () Bool)

(declare-fun e!35114 () Bool)

(assert (=> mapNonEmpty!2537 (= mapRes!2537 (and tp!7336 e!35114))))

(declare-fun mapRest!2538 () (Array (_ BitVec 32) ValueCell!801))

(declare-fun mapValue!2538 () ValueCell!801)

(declare-fun mapKey!2537 () (_ BitVec 32))

(assert (=> mapNonEmpty!2537 (= (arr!1674 (_values!1952 newMap!16)) (store mapRest!2538 mapKey!2537 mapValue!2538))))

(declare-fun b!53805 () Bool)

(declare-fun res!30487 () Bool)

(assert (=> b!53805 (=> (not res!30487) (not e!35104))))

(assert (=> b!53805 (= res!30487 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1902 (_keys!3589 (v!2266 (underlying!175 thiss!992)))))))))

(declare-fun b!53806 () Bool)

(declare-fun e!35105 () Bool)

(assert (=> b!53806 (= e!35105 tp_is_empty!2289)))

(declare-fun b!53807 () Bool)

(declare-fun res!30486 () Bool)

(assert (=> b!53807 (=> (not res!30486) (not e!35104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53807 (= res!30486 (validMask!0 (mask!5808 (v!2266 (underlying!175 thiss!992)))))))

(declare-fun b!53808 () Bool)

(declare-fun res!30485 () Bool)

(assert (=> b!53808 (=> (not res!30485) (not e!35109))))

(declare-fun valid!194 (LongMapFixedSize!510) Bool)

(assert (=> b!53808 (= res!30485 (valid!194 newMap!16))))

(declare-fun b!53809 () Bool)

(assert (=> b!53809 (= e!35114 tp_is_empty!2289)))

(declare-fun b!53810 () Bool)

(declare-fun res!30482 () Bool)

(assert (=> b!53810 (=> (not res!30482) (not e!35109))))

(assert (=> b!53810 (= res!30482 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1902 (_keys!3589 (v!2266 (underlying!175 thiss!992)))))))))

(declare-fun b!53811 () Bool)

(declare-fun e!35106 () Bool)

(assert (=> b!53811 (= e!35106 e!35108)))

(declare-fun b!53812 () Bool)

(declare-fun e!35103 () Bool)

(assert (=> b!53812 (= e!35103 (and e!35116 mapRes!2537))))

(declare-fun condMapEmpty!2537 () Bool)

(declare-fun mapDefault!2538 () ValueCell!801)

(assert (=> b!53812 (= condMapEmpty!2537 (= (arr!1674 (_values!1952 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!801)) mapDefault!2538)))))

(declare-fun mapIsEmpty!2538 () Bool)

(assert (=> mapIsEmpty!2538 mapRes!2537))

(declare-fun b!53813 () Bool)

(assert (=> b!53813 (= e!35117 e!35106)))

(declare-fun mapNonEmpty!2538 () Bool)

(declare-fun tp!7335 () Bool)

(assert (=> mapNonEmpty!2538 (= mapRes!2538 (and tp!7335 e!35111))))

(declare-fun mapKey!2538 () (_ BitVec 32))

(declare-fun mapValue!2537 () ValueCell!801)

(declare-fun mapRest!2537 () (Array (_ BitVec 32) ValueCell!801))

(assert (=> mapNonEmpty!2538 (= (arr!1674 (_values!1952 (v!2266 (underlying!175 thiss!992)))) (store mapRest!2537 mapKey!2538 mapValue!2537))))

(declare-fun b!53814 () Bool)

(assert (=> b!53814 (= e!35110 (and e!35105 mapRes!2538))))

(declare-fun condMapEmpty!2538 () Bool)

(declare-fun mapDefault!2537 () ValueCell!801)

(assert (=> b!53814 (= condMapEmpty!2538 (= (arr!1674 (_values!1952 (v!2266 (underlying!175 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!801)) mapDefault!2537)))))

(assert (=> b!53815 (= e!35113 (and tp!7338 tp_is_empty!2289 (array_inv!1033 (_keys!3589 newMap!16)) (array_inv!1034 (_values!1952 newMap!16)) e!35103))))

(assert (= (and start!8290 res!30484) b!53810))

(assert (= (and b!53810 res!30482) b!53808))

(assert (= (and b!53808 res!30485) b!53803))

(assert (= (and b!53803 res!30488) b!53801))

(assert (= (and b!53801 res!30480) b!53798))

(assert (= (and b!53798 res!30481) b!53807))

(assert (= (and b!53807 res!30486) b!53799))

(assert (= (and b!53799 res!30478) b!53797))

(assert (= (and b!53797 res!30483) b!53795))

(assert (= (and b!53795 res!30479) b!53805))

(assert (= (and b!53805 res!30487) b!53796))

(assert (= (and b!53814 condMapEmpty!2538) mapIsEmpty!2537))

(assert (= (and b!53814 (not condMapEmpty!2538)) mapNonEmpty!2538))

(get-info :version)

(assert (= (and mapNonEmpty!2538 ((_ is ValueCellFull!801) mapValue!2537)) b!53804))

(assert (= (and b!53814 ((_ is ValueCellFull!801) mapDefault!2537)) b!53806))

(assert (= b!53802 b!53814))

(assert (= b!53811 b!53802))

(assert (= b!53813 b!53811))

(assert (= start!8290 b!53813))

(assert (= (and b!53812 condMapEmpty!2537) mapIsEmpty!2538))

(assert (= (and b!53812 (not condMapEmpty!2537)) mapNonEmpty!2537))

(assert (= (and mapNonEmpty!2537 ((_ is ValueCellFull!801) mapValue!2538)) b!53809))

(assert (= (and b!53812 ((_ is ValueCellFull!801) mapDefault!2538)) b!53800))

(assert (= b!53815 b!53812))

(assert (= start!8290 b!53815))

(declare-fun b_lambda!2383 () Bool)

(assert (=> (not b_lambda!2383) (not b!53798)))

(declare-fun t!4474 () Bool)

(declare-fun tb!1089 () Bool)

(assert (=> (and b!53802 (= (defaultEntry!1969 (v!2266 (underlying!175 thiss!992))) (defaultEntry!1969 (v!2266 (underlying!175 thiss!992)))) t!4474) tb!1089))

(declare-fun result!2031 () Bool)

(assert (=> tb!1089 (= result!2031 tp_is_empty!2289)))

(assert (=> b!53798 t!4474))

(declare-fun b_and!3035 () Bool)

(assert (= b_and!3031 (and (=> t!4474 result!2031) b_and!3035)))

(declare-fun tb!1091 () Bool)

(declare-fun t!4476 () Bool)

(assert (=> (and b!53815 (= (defaultEntry!1969 newMap!16) (defaultEntry!1969 (v!2266 (underlying!175 thiss!992)))) t!4476) tb!1091))

(declare-fun result!2035 () Bool)

(assert (= result!2035 result!2031))

(assert (=> b!53798 t!4476))

(declare-fun b_and!3037 () Bool)

(assert (= b_and!3033 (and (=> t!4476 result!2035) b_and!3037)))

(declare-fun m!45645 () Bool)

(assert (=> mapNonEmpty!2538 m!45645))

(declare-fun m!45647 () Bool)

(assert (=> b!53797 m!45647))

(declare-fun m!45649 () Bool)

(assert (=> b!53808 m!45649))

(declare-fun m!45651 () Bool)

(assert (=> mapNonEmpty!2537 m!45651))

(declare-fun m!45653 () Bool)

(assert (=> b!53795 m!45653))

(declare-fun m!45655 () Bool)

(assert (=> b!53807 m!45655))

(declare-fun m!45657 () Bool)

(assert (=> b!53802 m!45657))

(declare-fun m!45659 () Bool)

(assert (=> b!53802 m!45659))

(declare-fun m!45661 () Bool)

(assert (=> b!53796 m!45661))

(assert (=> b!53796 m!45661))

(declare-fun m!45663 () Bool)

(assert (=> b!53796 m!45663))

(declare-fun m!45665 () Bool)

(assert (=> b!53815 m!45665))

(declare-fun m!45667 () Bool)

(assert (=> b!53815 m!45667))

(assert (=> b!53801 m!45661))

(declare-fun m!45669 () Bool)

(assert (=> b!53801 m!45669))

(declare-fun m!45671 () Bool)

(assert (=> b!53801 m!45671))

(declare-fun m!45673 () Bool)

(assert (=> start!8290 m!45673))

(declare-fun m!45675 () Bool)

(assert (=> b!53798 m!45675))

(declare-fun m!45677 () Bool)

(assert (=> b!53798 m!45677))

(declare-fun m!45679 () Bool)

(assert (=> b!53798 m!45679))

(assert (=> b!53798 m!45661))

(declare-fun m!45681 () Bool)

(assert (=> b!53798 m!45681))

(assert (=> b!53798 m!45661))

(assert (=> b!53798 m!45677))

(assert (=> b!53798 m!45661))

(assert (=> b!53798 m!45679))

(declare-fun m!45683 () Bool)

(assert (=> b!53798 m!45683))

(assert (=> b!53798 m!45675))

(check-sat (not mapNonEmpty!2538) (not b_lambda!2383) (not b!53808) (not b!53815) (not b!53795) (not b_next!1747) b_and!3037 (not b!53802) (not b_next!1745) (not b!53807) tp_is_empty!2289 (not b!53797) (not start!8290) (not mapNonEmpty!2537) (not b!53798) (not b!53796) b_and!3035 (not b!53801))
(check-sat b_and!3035 b_and!3037 (not b_next!1745) (not b_next!1747))
