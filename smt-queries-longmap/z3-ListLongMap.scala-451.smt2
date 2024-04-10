; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8320 () Bool)

(assert start!8320)

(declare-fun b!54728 () Bool)

(declare-fun b_free!1805 () Bool)

(declare-fun b_next!1805 () Bool)

(assert (=> b!54728 (= b_free!1805 (not b_next!1805))))

(declare-fun tp!7517 () Bool)

(declare-fun b_and!3151 () Bool)

(assert (=> b!54728 (= tp!7517 b_and!3151)))

(declare-fun b!54716 () Bool)

(declare-fun b_free!1807 () Bool)

(declare-fun b_next!1807 () Bool)

(assert (=> b!54716 (= b_free!1807 (not b_next!1807))))

(declare-fun tp!7518 () Bool)

(declare-fun b_and!3153 () Bool)

(assert (=> b!54716 (= tp!7518 b_and!3153)))

(declare-fun mapIsEmpty!2627 () Bool)

(declare-fun mapRes!2628 () Bool)

(assert (=> mapIsEmpty!2627 mapRes!2628))

(declare-fun b!54714 () Bool)

(declare-fun e!35797 () Bool)

(declare-fun e!35807 () Bool)

(assert (=> b!54714 (= e!35797 e!35807)))

(declare-fun b!54715 () Bool)

(declare-fun e!35806 () Bool)

(declare-fun e!35798 () Bool)

(declare-fun mapRes!2627 () Bool)

(assert (=> b!54715 (= e!35806 (and e!35798 mapRes!2627))))

(declare-fun condMapEmpty!2628 () Bool)

(declare-datatypes ((V!2739 0))(
  ( (V!2740 (val!1204 Int)) )
))
(declare-datatypes ((array!3561 0))(
  ( (array!3562 (arr!1703 (Array (_ BitVec 32) (_ BitVec 64))) (size!1932 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!816 0))(
  ( (ValueCellFull!816 (v!2294 V!2739)) (EmptyCell!816) )
))
(declare-datatypes ((array!3563 0))(
  ( (array!3564 (arr!1704 (Array (_ BitVec 32) ValueCell!816)) (size!1933 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!540 0))(
  ( (LongMapFixedSize!541 (defaultEntry!1984 Int) (mask!5833 (_ BitVec 32)) (extraKeys!1875 (_ BitVec 32)) (zeroValue!1902 V!2739) (minValue!1902 V!2739) (_size!319 (_ BitVec 32)) (_keys!3604 array!3561) (_values!1967 array!3563) (_vacant!319 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!356 0))(
  ( (Cell!357 (v!2295 LongMapFixedSize!540)) )
))
(declare-datatypes ((LongMap!356 0))(
  ( (LongMap!357 (underlying!189 Cell!356)) )
))
(declare-fun thiss!992 () LongMap!356)

(declare-fun mapDefault!2627 () ValueCell!816)

(assert (=> b!54715 (= condMapEmpty!2628 (= (arr!1704 (_values!1967 (v!2295 (underlying!189 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!816)) mapDefault!2627)))))

(declare-fun e!35801 () Bool)

(declare-fun tp_is_empty!2319 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!540)

(declare-fun e!35804 () Bool)

(declare-fun array_inv!1053 (array!3561) Bool)

(declare-fun array_inv!1054 (array!3563) Bool)

(assert (=> b!54716 (= e!35801 (and tp!7518 tp_is_empty!2319 (array_inv!1053 (_keys!3604 newMap!16)) (array_inv!1054 (_values!1967 newMap!16)) e!35804))))

(declare-fun b!54717 () Bool)

(declare-fun e!35794 () Bool)

(declare-fun e!35805 () Bool)

(assert (=> b!54717 (= e!35794 e!35805)))

(declare-fun res!30923 () Bool)

(assert (=> b!54717 (=> (not res!30923) (not e!35805))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!1934 0))(
  ( (tuple2!1935 (_1!978 (_ BitVec 64)) (_2!978 V!2739)) )
))
(declare-datatypes ((List!1380 0))(
  ( (Nil!1377) (Cons!1376 (h!1956 tuple2!1934) (t!4554 List!1380)) )
))
(declare-datatypes ((ListLongMap!1315 0))(
  ( (ListLongMap!1316 (toList!673 List!1380)) )
))
(declare-fun lt!21728 () ListLongMap!1315)

(declare-fun contains!646 (ListLongMap!1315 (_ BitVec 64)) Bool)

(assert (=> b!54717 (= res!30923 (contains!646 lt!21728 (select (arr!1703 (_keys!3604 (v!2295 (underlying!189 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1936 0))(
  ( (tuple2!1937 (_1!979 Bool) (_2!979 LongMapFixedSize!540)) )
))
(declare-fun lt!21726 () tuple2!1936)

(declare-fun update!54 (LongMapFixedSize!540 (_ BitVec 64) V!2739) tuple2!1936)

(declare-fun get!1016 (ValueCell!816 V!2739) V!2739)

(declare-fun dynLambda!285 (Int (_ BitVec 64)) V!2739)

(assert (=> b!54717 (= lt!21726 (update!54 newMap!16 (select (arr!1703 (_keys!3604 (v!2295 (underlying!189 thiss!992)))) from!355) (get!1016 (select (arr!1704 (_values!1967 (v!2295 (underlying!189 thiss!992)))) from!355) (dynLambda!285 (defaultEntry!1984 (v!2295 (underlying!189 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!2628 () Bool)

(assert (=> mapIsEmpty!2628 mapRes!2627))

(declare-fun b!54718 () Bool)

(declare-fun e!35793 () Bool)

(assert (=> b!54718 (= e!35793 tp_is_empty!2319)))

(declare-fun b!54719 () Bool)

(declare-fun e!35799 () Bool)

(assert (=> b!54719 (= e!35799 e!35794)))

(declare-fun res!30918 () Bool)

(assert (=> b!54719 (=> (not res!30918) (not e!35794))))

(declare-fun lt!21725 () ListLongMap!1315)

(assert (=> b!54719 (= res!30918 (and (= lt!21725 lt!21728) (not (= (select (arr!1703 (_keys!3604 (v!2295 (underlying!189 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1703 (_keys!3604 (v!2295 (underlying!189 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1060 (LongMapFixedSize!540) ListLongMap!1315)

(assert (=> b!54719 (= lt!21728 (map!1060 newMap!16))))

(declare-fun getCurrentListMap!383 (array!3561 array!3563 (_ BitVec 32) (_ BitVec 32) V!2739 V!2739 (_ BitVec 32) Int) ListLongMap!1315)

(assert (=> b!54719 (= lt!21725 (getCurrentListMap!383 (_keys!3604 (v!2295 (underlying!189 thiss!992))) (_values!1967 (v!2295 (underlying!189 thiss!992))) (mask!5833 (v!2295 (underlying!189 thiss!992))) (extraKeys!1875 (v!2295 (underlying!189 thiss!992))) (zeroValue!1902 (v!2295 (underlying!189 thiss!992))) (minValue!1902 (v!2295 (underlying!189 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1984 (v!2295 (underlying!189 thiss!992)))))))

(declare-fun b!54720 () Bool)

(assert (=> b!54720 (= e!35798 tp_is_empty!2319)))

(declare-fun b!54721 () Bool)

(declare-fun e!35795 () Bool)

(assert (=> b!54721 (= e!35795 tp_is_empty!2319)))

(declare-fun b!54722 () Bool)

(declare-fun e!35802 () Bool)

(assert (=> b!54722 (= e!35805 (not e!35802))))

(declare-fun res!30917 () Bool)

(assert (=> b!54722 (=> res!30917 e!35802)))

(assert (=> b!54722 (= res!30917 (or (bvsge (size!1932 (_keys!3604 (v!2295 (underlying!189 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1932 (_keys!3604 (v!2295 (underlying!189 thiss!992))))) (bvsgt from!355 (size!1932 (_keys!3604 (v!2295 (underlying!189 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!54722 (arrayContainsKey!0 (_keys!3604 (v!2295 (underlying!189 thiss!992))) (select (arr!1703 (_keys!3604 (v!2295 (underlying!189 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1437 0))(
  ( (Unit!1438) )
))
(declare-fun lt!21729 () Unit!1437)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!8 (array!3561 array!3563 (_ BitVec 32) (_ BitVec 32) V!2739 V!2739 (_ BitVec 64) (_ BitVec 32) Int) Unit!1437)

(assert (=> b!54722 (= lt!21729 (lemmaListMapContainsThenArrayContainsFrom!8 (_keys!3604 (v!2295 (underlying!189 thiss!992))) (_values!1967 (v!2295 (underlying!189 thiss!992))) (mask!5833 (v!2295 (underlying!189 thiss!992))) (extraKeys!1875 (v!2295 (underlying!189 thiss!992))) (zeroValue!1902 (v!2295 (underlying!189 thiss!992))) (minValue!1902 (v!2295 (underlying!189 thiss!992))) (select (arr!1703 (_keys!3604 (v!2295 (underlying!189 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1984 (v!2295 (underlying!189 thiss!992)))))))

(declare-fun b!54723 () Bool)

(declare-fun e!35800 () Bool)

(assert (=> b!54723 (= e!35800 e!35797)))

(declare-fun b!54724 () Bool)

(declare-fun e!35796 () Bool)

(assert (=> b!54724 (= e!35796 tp_is_empty!2319)))

(declare-fun mapNonEmpty!2627 () Bool)

(declare-fun tp!7516 () Bool)

(assert (=> mapNonEmpty!2627 (= mapRes!2628 (and tp!7516 e!35796))))

(declare-fun mapKey!2628 () (_ BitVec 32))

(declare-fun mapValue!2628 () ValueCell!816)

(declare-fun mapRest!2627 () (Array (_ BitVec 32) ValueCell!816))

(assert (=> mapNonEmpty!2627 (= (arr!1704 (_values!1967 newMap!16)) (store mapRest!2627 mapKey!2628 mapValue!2628))))

(declare-fun b!54725 () Bool)

(assert (=> b!54725 (= e!35804 (and e!35793 mapRes!2628))))

(declare-fun condMapEmpty!2627 () Bool)

(declare-fun mapDefault!2628 () ValueCell!816)

(assert (=> b!54725 (= condMapEmpty!2627 (= (arr!1704 (_values!1967 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!816)) mapDefault!2628)))))

(declare-fun b!54726 () Bool)

(assert (=> b!54726 (= e!35802 true)))

(declare-fun lt!21727 () Bool)

(declare-datatypes ((List!1381 0))(
  ( (Nil!1378) (Cons!1377 (h!1957 (_ BitVec 64)) (t!4555 List!1381)) )
))
(declare-fun arrayNoDuplicates!0 (array!3561 (_ BitVec 32) List!1381) Bool)

(assert (=> b!54726 (= lt!21727 (arrayNoDuplicates!0 (_keys!3604 (v!2295 (underlying!189 thiss!992))) #b00000000000000000000000000000000 Nil!1378))))

(declare-fun b!54727 () Bool)

(declare-fun res!30921 () Bool)

(assert (=> b!54727 (=> (not res!30921) (not e!35799))))

(assert (=> b!54727 (= res!30921 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5833 newMap!16)) (_size!319 (v!2295 (underlying!189 thiss!992)))))))

(declare-fun res!30920 () Bool)

(assert (=> start!8320 (=> (not res!30920) (not e!35799))))

(declare-fun valid!211 (LongMap!356) Bool)

(assert (=> start!8320 (= res!30920 (valid!211 thiss!992))))

(assert (=> start!8320 e!35799))

(assert (=> start!8320 e!35800))

(assert (=> start!8320 true))

(assert (=> start!8320 e!35801))

(assert (=> b!54728 (= e!35807 (and tp!7517 tp_is_empty!2319 (array_inv!1053 (_keys!3604 (v!2295 (underlying!189 thiss!992)))) (array_inv!1054 (_values!1967 (v!2295 (underlying!189 thiss!992)))) e!35806))))

(declare-fun mapNonEmpty!2628 () Bool)

(declare-fun tp!7515 () Bool)

(assert (=> mapNonEmpty!2628 (= mapRes!2627 (and tp!7515 e!35795))))

(declare-fun mapValue!2627 () ValueCell!816)

(declare-fun mapKey!2627 () (_ BitVec 32))

(declare-fun mapRest!2628 () (Array (_ BitVec 32) ValueCell!816))

(assert (=> mapNonEmpty!2628 (= (arr!1704 (_values!1967 (v!2295 (underlying!189 thiss!992)))) (store mapRest!2628 mapKey!2627 mapValue!2627))))

(declare-fun b!54729 () Bool)

(declare-fun res!30922 () Bool)

(assert (=> b!54729 (=> (not res!30922) (not e!35799))))

(declare-fun valid!212 (LongMapFixedSize!540) Bool)

(assert (=> b!54729 (= res!30922 (valid!212 newMap!16))))

(declare-fun b!54730 () Bool)

(declare-fun res!30919 () Bool)

(assert (=> b!54730 (=> (not res!30919) (not e!35799))))

(assert (=> b!54730 (= res!30919 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1932 (_keys!3604 (v!2295 (underlying!189 thiss!992)))))))))

(assert (= (and start!8320 res!30920) b!54730))

(assert (= (and b!54730 res!30919) b!54729))

(assert (= (and b!54729 res!30922) b!54727))

(assert (= (and b!54727 res!30921) b!54719))

(assert (= (and b!54719 res!30918) b!54717))

(assert (= (and b!54717 res!30923) b!54722))

(assert (= (and b!54722 (not res!30917)) b!54726))

(assert (= (and b!54715 condMapEmpty!2628) mapIsEmpty!2628))

(assert (= (and b!54715 (not condMapEmpty!2628)) mapNonEmpty!2628))

(get-info :version)

(assert (= (and mapNonEmpty!2628 ((_ is ValueCellFull!816) mapValue!2627)) b!54721))

(assert (= (and b!54715 ((_ is ValueCellFull!816) mapDefault!2627)) b!54720))

(assert (= b!54728 b!54715))

(assert (= b!54714 b!54728))

(assert (= b!54723 b!54714))

(assert (= start!8320 b!54723))

(assert (= (and b!54725 condMapEmpty!2627) mapIsEmpty!2627))

(assert (= (and b!54725 (not condMapEmpty!2627)) mapNonEmpty!2627))

(assert (= (and mapNonEmpty!2627 ((_ is ValueCellFull!816) mapValue!2628)) b!54724))

(assert (= (and b!54725 ((_ is ValueCellFull!816) mapDefault!2628)) b!54718))

(assert (= b!54716 b!54725))

(assert (= start!8320 b!54716))

(declare-fun b_lambda!2413 () Bool)

(assert (=> (not b_lambda!2413) (not b!54717)))

(declare-fun t!4551 () Bool)

(declare-fun tb!1149 () Bool)

(assert (=> (and b!54728 (= (defaultEntry!1984 (v!2295 (underlying!189 thiss!992))) (defaultEntry!1984 (v!2295 (underlying!189 thiss!992)))) t!4551) tb!1149))

(declare-fun result!2121 () Bool)

(assert (=> tb!1149 (= result!2121 tp_is_empty!2319)))

(assert (=> b!54717 t!4551))

(declare-fun b_and!3155 () Bool)

(assert (= b_and!3151 (and (=> t!4551 result!2121) b_and!3155)))

(declare-fun tb!1151 () Bool)

(declare-fun t!4553 () Bool)

(assert (=> (and b!54716 (= (defaultEntry!1984 newMap!16) (defaultEntry!1984 (v!2295 (underlying!189 thiss!992)))) t!4553) tb!1151))

(declare-fun result!2125 () Bool)

(assert (= result!2125 result!2121))

(assert (=> b!54717 t!4553))

(declare-fun b_and!3157 () Bool)

(assert (= b_and!3153 (and (=> t!4553 result!2125) b_and!3157)))

(declare-fun m!46237 () Bool)

(assert (=> b!54722 m!46237))

(assert (=> b!54722 m!46237))

(declare-fun m!46239 () Bool)

(assert (=> b!54722 m!46239))

(assert (=> b!54722 m!46237))

(declare-fun m!46241 () Bool)

(assert (=> b!54722 m!46241))

(declare-fun m!46243 () Bool)

(assert (=> mapNonEmpty!2627 m!46243))

(declare-fun m!46245 () Bool)

(assert (=> start!8320 m!46245))

(declare-fun m!46247 () Bool)

(assert (=> b!54717 m!46247))

(declare-fun m!46249 () Bool)

(assert (=> b!54717 m!46249))

(declare-fun m!46251 () Bool)

(assert (=> b!54717 m!46251))

(assert (=> b!54717 m!46237))

(assert (=> b!54717 m!46249))

(assert (=> b!54717 m!46237))

(declare-fun m!46253 () Bool)

(assert (=> b!54717 m!46253))

(assert (=> b!54717 m!46237))

(assert (=> b!54717 m!46251))

(declare-fun m!46255 () Bool)

(assert (=> b!54717 m!46255))

(assert (=> b!54717 m!46247))

(declare-fun m!46257 () Bool)

(assert (=> mapNonEmpty!2628 m!46257))

(declare-fun m!46259 () Bool)

(assert (=> b!54729 m!46259))

(declare-fun m!46261 () Bool)

(assert (=> b!54716 m!46261))

(declare-fun m!46263 () Bool)

(assert (=> b!54716 m!46263))

(assert (=> b!54719 m!46237))

(declare-fun m!46265 () Bool)

(assert (=> b!54719 m!46265))

(declare-fun m!46267 () Bool)

(assert (=> b!54719 m!46267))

(declare-fun m!46269 () Bool)

(assert (=> b!54726 m!46269))

(declare-fun m!46271 () Bool)

(assert (=> b!54728 m!46271))

(declare-fun m!46273 () Bool)

(assert (=> b!54728 m!46273))

(check-sat (not b!54729) (not mapNonEmpty!2627) tp_is_empty!2319 (not b!54722) b_and!3157 b_and!3155 (not b_next!1807) (not b!54717) (not b!54716) (not b!54719) (not b!54728) (not start!8320) (not b_lambda!2413) (not b!54726) (not b_next!1805) (not mapNonEmpty!2628))
(check-sat b_and!3155 b_and!3157 (not b_next!1805) (not b_next!1807))
