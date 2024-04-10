; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9220 () Bool)

(assert start!9220)

(declare-fun b!65876 () Bool)

(declare-fun b_free!2057 () Bool)

(declare-fun b_next!2057 () Bool)

(assert (=> b!65876 (= b_free!2057 (not b_next!2057))))

(declare-fun tp!8322 () Bool)

(declare-fun b_and!4067 () Bool)

(assert (=> b!65876 (= tp!8322 b_and!4067)))

(declare-fun b!65874 () Bool)

(declare-fun b_free!2059 () Bool)

(declare-fun b_next!2059 () Bool)

(assert (=> b!65874 (= b_free!2059 (not b_next!2059))))

(declare-fun tp!8319 () Bool)

(declare-fun b_and!4069 () Bool)

(assert (=> b!65874 (= tp!8319 b_and!4069)))

(declare-fun mapNonEmpty!3053 () Bool)

(declare-fun mapRes!3054 () Bool)

(declare-fun tp!8321 () Bool)

(declare-fun e!43205 () Bool)

(assert (=> mapNonEmpty!3053 (= mapRes!3054 (and tp!8321 e!43205))))

(declare-datatypes ((V!2907 0))(
  ( (V!2908 (val!1267 Int)) )
))
(declare-datatypes ((ValueCell!879 0))(
  ( (ValueCellFull!879 (v!2469 V!2907)) (EmptyCell!879) )
))
(declare-fun mapRest!3053 () (Array (_ BitVec 32) ValueCell!879))

(declare-datatypes ((array!3827 0))(
  ( (array!3828 (arr!1829 (Array (_ BitVec 32) (_ BitVec 64))) (size!2064 (_ BitVec 32))) )
))
(declare-datatypes ((array!3829 0))(
  ( (array!3830 (arr!1830 (Array (_ BitVec 32) ValueCell!879)) (size!2065 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!666 0))(
  ( (LongMapFixedSize!667 (defaultEntry!2141 Int) (mask!6073 (_ BitVec 32)) (extraKeys!2012 (_ BitVec 32)) (zeroValue!2049 V!2907) (minValue!2049 V!2907) (_size!382 (_ BitVec 32)) (_keys!3781 array!3827) (_values!2124 array!3829) (_vacant!382 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!472 0))(
  ( (Cell!473 (v!2470 LongMapFixedSize!666)) )
))
(declare-datatypes ((LongMap!472 0))(
  ( (LongMap!473 (underlying!247 Cell!472)) )
))
(declare-fun thiss!992 () LongMap!472)

(declare-fun mapKey!3053 () (_ BitVec 32))

(declare-fun mapValue!3053 () ValueCell!879)

(assert (=> mapNonEmpty!3053 (= (arr!1830 (_values!2124 (v!2470 (underlying!247 thiss!992)))) (store mapRest!3053 mapKey!3053 mapValue!3053))))

(declare-fun b!65869 () Bool)

(declare-fun e!43210 () Bool)

(declare-fun tp_is_empty!2445 () Bool)

(assert (=> b!65869 (= e!43210 tp_is_empty!2445)))

(declare-fun b!65870 () Bool)

(declare-fun e!43204 () Bool)

(declare-fun e!43213 () Bool)

(declare-fun mapRes!3053 () Bool)

(assert (=> b!65870 (= e!43204 (and e!43213 mapRes!3053))))

(declare-fun condMapEmpty!3053 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!666)

(declare-fun mapDefault!3053 () ValueCell!879)

(assert (=> b!65870 (= condMapEmpty!3053 (= (arr!1830 (_values!2124 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!879)) mapDefault!3053)))))

(declare-fun b!65871 () Bool)

(declare-fun e!43214 () Bool)

(declare-fun e!43203 () Bool)

(assert (=> b!65871 (= e!43214 e!43203)))

(declare-fun res!35759 () Bool)

(assert (=> b!65871 (=> (not res!35759) (not e!43203))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!65871 (= res!35759 (and (not (= (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!28291 () V!2907)

(declare-fun get!1110 (ValueCell!879 V!2907) V!2907)

(declare-fun dynLambda!317 (Int (_ BitVec 64)) V!2907)

(assert (=> b!65871 (= lt!28291 (get!1110 (select (arr!1830 (_values!2124 (v!2470 (underlying!247 thiss!992)))) from!355) (dynLambda!317 (defaultEntry!2141 (v!2470 (underlying!247 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!3053 () Bool)

(assert (=> mapIsEmpty!3053 mapRes!3053))

(declare-fun b!65872 () Bool)

(declare-fun e!43206 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!65872 (= e!43206 (not (validMask!0 (mask!6073 (v!2470 (underlying!247 thiss!992))))))))

(declare-datatypes ((tuple2!2082 0))(
  ( (tuple2!2083 (_1!1052 (_ BitVec 64)) (_2!1052 V!2907)) )
))
(declare-datatypes ((List!1461 0))(
  ( (Nil!1458) (Cons!1457 (h!2041 tuple2!2082) (t!4931 List!1461)) )
))
(declare-datatypes ((ListLongMap!1397 0))(
  ( (ListLongMap!1398 (toList!714 List!1461)) )
))
(declare-fun lt!28298 () ListLongMap!1397)

(declare-fun lt!28300 () tuple2!2082)

(declare-fun lt!28299 () tuple2!2082)

(declare-fun +!86 (ListLongMap!1397 tuple2!2082) ListLongMap!1397)

(assert (=> b!65872 (= (+!86 (+!86 lt!28298 lt!28300) lt!28299) (+!86 (+!86 lt!28298 lt!28299) lt!28300))))

(assert (=> b!65872 (= lt!28299 (tuple2!2083 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2049 (v!2470 (underlying!247 thiss!992)))))))

(assert (=> b!65872 (= lt!28300 (tuple2!2083 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) lt!28291))))

(declare-datatypes ((Unit!1825 0))(
  ( (Unit!1826) )
))
(declare-fun lt!28296 () Unit!1825)

(declare-fun addCommutativeForDiffKeys!5 (ListLongMap!1397 (_ BitVec 64) V!2907 (_ BitVec 64) V!2907) Unit!1825)

(assert (=> b!65872 (= lt!28296 (addCommutativeForDiffKeys!5 lt!28298 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) lt!28291 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2049 (v!2470 (underlying!247 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!51 (array!3827 array!3829 (_ BitVec 32) (_ BitVec 32) V!2907 V!2907 (_ BitVec 32) Int) ListLongMap!1397)

(assert (=> b!65872 (= lt!28298 (getCurrentListMapNoExtraKeys!51 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (_values!2124 (v!2470 (underlying!247 thiss!992))) (mask!6073 (v!2470 (underlying!247 thiss!992))) (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) (minValue!2049 (v!2470 (underlying!247 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992)))))))

(declare-fun e!43215 () Bool)

(declare-fun array_inv!1125 (array!3827) Bool)

(declare-fun array_inv!1126 (array!3829) Bool)

(assert (=> b!65874 (= e!43215 (and tp!8319 tp_is_empty!2445 (array_inv!1125 (_keys!3781 newMap!16)) (array_inv!1126 (_values!2124 newMap!16)) e!43204))))

(declare-fun b!65875 () Bool)

(assert (=> b!65875 (= e!43213 tp_is_empty!2445)))

(declare-fun e!43207 () Bool)

(declare-fun e!43219 () Bool)

(assert (=> b!65876 (= e!43207 (and tp!8322 tp_is_empty!2445 (array_inv!1125 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (array_inv!1126 (_values!2124 (v!2470 (underlying!247 thiss!992)))) e!43219))))

(declare-fun b!65877 () Bool)

(declare-fun e!43216 () Bool)

(assert (=> b!65877 (= e!43216 e!43214)))

(declare-fun res!35760 () Bool)

(assert (=> b!65877 (=> (not res!35760) (not e!43214))))

(declare-fun lt!28295 () ListLongMap!1397)

(declare-fun lt!28297 () ListLongMap!1397)

(assert (=> b!65877 (= res!35760 (= lt!28295 lt!28297))))

(declare-fun map!1132 (LongMapFixedSize!666) ListLongMap!1397)

(assert (=> b!65877 (= lt!28297 (map!1132 newMap!16))))

(declare-fun getCurrentListMap!413 (array!3827 array!3829 (_ BitVec 32) (_ BitVec 32) V!2907 V!2907 (_ BitVec 32) Int) ListLongMap!1397)

(assert (=> b!65877 (= lt!28295 (getCurrentListMap!413 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (_values!2124 (v!2470 (underlying!247 thiss!992))) (mask!6073 (v!2470 (underlying!247 thiss!992))) (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) (minValue!2049 (v!2470 (underlying!247 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992)))))))

(declare-fun b!65878 () Bool)

(declare-fun res!35761 () Bool)

(assert (=> b!65878 (=> (not res!35761) (not e!43216))))

(assert (=> b!65878 (= res!35761 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6073 newMap!16)) (_size!382 (v!2470 (underlying!247 thiss!992)))))))

(declare-fun b!65879 () Bool)

(declare-fun e!43212 () Bool)

(assert (=> b!65879 (= e!43212 e!43207)))

(declare-fun b!65880 () Bool)

(declare-fun e!43211 () Unit!1825)

(declare-fun Unit!1827 () Unit!1825)

(assert (=> b!65880 (= e!43211 Unit!1827)))

(declare-fun mapNonEmpty!3054 () Bool)

(declare-fun tp!8320 () Bool)

(declare-fun e!43217 () Bool)

(assert (=> mapNonEmpty!3054 (= mapRes!3053 (and tp!8320 e!43217))))

(declare-fun mapKey!3054 () (_ BitVec 32))

(declare-fun mapValue!3054 () ValueCell!879)

(declare-fun mapRest!3054 () (Array (_ BitVec 32) ValueCell!879))

(assert (=> mapNonEmpty!3054 (= (arr!1830 (_values!2124 newMap!16)) (store mapRest!3054 mapKey!3054 mapValue!3054))))

(declare-fun b!65881 () Bool)

(declare-fun e!43209 () Bool)

(assert (=> b!65881 (= e!43209 e!43212)))

(declare-fun b!65882 () Bool)

(declare-fun Unit!1828 () Unit!1825)

(assert (=> b!65882 (= e!43211 Unit!1828)))

(declare-fun lt!28301 () Unit!1825)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!43 (array!3827 array!3829 (_ BitVec 32) (_ BitVec 32) V!2907 V!2907 (_ BitVec 64) (_ BitVec 32) Int) Unit!1825)

(assert (=> b!65882 (= lt!28301 (lemmaListMapContainsThenArrayContainsFrom!43 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (_values!2124 (v!2470 (underlying!247 thiss!992))) (mask!6073 (v!2470 (underlying!247 thiss!992))) (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) (minValue!2049 (v!2470 (underlying!247 thiss!992))) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!65882 (arrayContainsKey!0 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!28293 () Unit!1825)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3827 (_ BitVec 32) (_ BitVec 32)) Unit!1825)

(assert (=> b!65882 (= lt!28293 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3781 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1462 0))(
  ( (Nil!1459) (Cons!1458 (h!2042 (_ BitVec 64)) (t!4932 List!1462)) )
))
(declare-fun arrayNoDuplicates!0 (array!3827 (_ BitVec 32) List!1462) Bool)

(assert (=> b!65882 (arrayNoDuplicates!0 (_keys!3781 (v!2470 (underlying!247 thiss!992))) from!355 Nil!1459)))

(declare-fun lt!28302 () Unit!1825)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3827 (_ BitVec 32) (_ BitVec 64) List!1462) Unit!1825)

(assert (=> b!65882 (= lt!28302 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (Cons!1458 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) Nil!1459)))))

(assert (=> b!65882 false))

(declare-fun b!65883 () Bool)

(assert (=> b!65883 (= e!43219 (and e!43210 mapRes!3054))))

(declare-fun condMapEmpty!3054 () Bool)

(declare-fun mapDefault!3054 () ValueCell!879)

(assert (=> b!65883 (= condMapEmpty!3054 (= (arr!1830 (_values!2124 (v!2470 (underlying!247 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!879)) mapDefault!3054)))))

(declare-fun b!65884 () Bool)

(declare-fun res!35756 () Bool)

(assert (=> b!65884 (=> (not res!35756) (not e!43216))))

(assert (=> b!65884 (= res!35756 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992)))))))))

(declare-fun mapIsEmpty!3054 () Bool)

(assert (=> mapIsEmpty!3054 mapRes!3054))

(declare-fun b!65885 () Bool)

(assert (=> b!65885 (= e!43205 tp_is_empty!2445)))

(declare-fun res!35757 () Bool)

(assert (=> start!9220 (=> (not res!35757) (not e!43216))))

(declare-fun valid!275 (LongMap!472) Bool)

(assert (=> start!9220 (= res!35757 (valid!275 thiss!992))))

(assert (=> start!9220 e!43216))

(assert (=> start!9220 e!43209))

(assert (=> start!9220 true))

(assert (=> start!9220 e!43215))

(declare-fun b!65873 () Bool)

(assert (=> b!65873 (= e!43203 e!43206)))

(declare-fun res!35762 () Bool)

(assert (=> b!65873 (=> (not res!35762) (not e!43206))))

(declare-datatypes ((tuple2!2084 0))(
  ( (tuple2!2085 (_1!1053 Bool) (_2!1053 LongMapFixedSize!666)) )
))
(declare-fun lt!28292 () tuple2!2084)

(assert (=> b!65873 (= res!35762 (and (_1!1053 lt!28292) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!28294 () Unit!1825)

(assert (=> b!65873 (= lt!28294 e!43211)))

(declare-fun c!9038 () Bool)

(declare-fun contains!706 (ListLongMap!1397 (_ BitVec 64)) Bool)

(assert (=> b!65873 (= c!9038 (contains!706 lt!28297 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355)))))

(declare-fun update!87 (LongMapFixedSize!666 (_ BitVec 64) V!2907) tuple2!2084)

(assert (=> b!65873 (= lt!28292 (update!87 newMap!16 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) lt!28291))))

(declare-fun b!65886 () Bool)

(declare-fun res!35758 () Bool)

(assert (=> b!65886 (=> (not res!35758) (not e!43216))))

(declare-fun valid!276 (LongMapFixedSize!666) Bool)

(assert (=> b!65886 (= res!35758 (valid!276 newMap!16))))

(declare-fun b!65887 () Bool)

(assert (=> b!65887 (= e!43217 tp_is_empty!2445)))

(assert (= (and start!9220 res!35757) b!65884))

(assert (= (and b!65884 res!35756) b!65886))

(assert (= (and b!65886 res!35758) b!65878))

(assert (= (and b!65878 res!35761) b!65877))

(assert (= (and b!65877 res!35760) b!65871))

(assert (= (and b!65871 res!35759) b!65873))

(assert (= (and b!65873 c!9038) b!65882))

(assert (= (and b!65873 (not c!9038)) b!65880))

(assert (= (and b!65873 res!35762) b!65872))

(assert (= (and b!65883 condMapEmpty!3054) mapIsEmpty!3054))

(assert (= (and b!65883 (not condMapEmpty!3054)) mapNonEmpty!3053))

(get-info :version)

(assert (= (and mapNonEmpty!3053 ((_ is ValueCellFull!879) mapValue!3053)) b!65885))

(assert (= (and b!65883 ((_ is ValueCellFull!879) mapDefault!3054)) b!65869))

(assert (= b!65876 b!65883))

(assert (= b!65879 b!65876))

(assert (= b!65881 b!65879))

(assert (= start!9220 b!65881))

(assert (= (and b!65870 condMapEmpty!3053) mapIsEmpty!3053))

(assert (= (and b!65870 (not condMapEmpty!3053)) mapNonEmpty!3054))

(assert (= (and mapNonEmpty!3054 ((_ is ValueCellFull!879) mapValue!3054)) b!65887))

(assert (= (and b!65870 ((_ is ValueCellFull!879) mapDefault!3053)) b!65875))

(assert (= b!65874 b!65870))

(assert (= start!9220 b!65874))

(declare-fun b_lambda!2955 () Bool)

(assert (=> (not b_lambda!2955) (not b!65871)))

(declare-fun t!4928 () Bool)

(declare-fun tb!1445 () Bool)

(assert (=> (and b!65876 (= (defaultEntry!2141 (v!2470 (underlying!247 thiss!992))) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992)))) t!4928) tb!1445))

(declare-fun result!2557 () Bool)

(assert (=> tb!1445 (= result!2557 tp_is_empty!2445)))

(assert (=> b!65871 t!4928))

(declare-fun b_and!4071 () Bool)

(assert (= b_and!4067 (and (=> t!4928 result!2557) b_and!4071)))

(declare-fun tb!1447 () Bool)

(declare-fun t!4930 () Bool)

(assert (=> (and b!65874 (= (defaultEntry!2141 newMap!16) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992)))) t!4930) tb!1447))

(declare-fun result!2561 () Bool)

(assert (= result!2561 result!2557))

(assert (=> b!65871 t!4930))

(declare-fun b_and!4073 () Bool)

(assert (= b_and!4069 (and (=> t!4930 result!2561) b_and!4073)))

(declare-fun m!60667 () Bool)

(assert (=> b!65871 m!60667))

(declare-fun m!60669 () Bool)

(assert (=> b!65871 m!60669))

(declare-fun m!60671 () Bool)

(assert (=> b!65871 m!60671))

(assert (=> b!65871 m!60669))

(assert (=> b!65871 m!60671))

(declare-fun m!60673 () Bool)

(assert (=> b!65871 m!60673))

(declare-fun m!60675 () Bool)

(assert (=> b!65874 m!60675))

(declare-fun m!60677 () Bool)

(assert (=> b!65874 m!60677))

(declare-fun m!60679 () Bool)

(assert (=> b!65877 m!60679))

(declare-fun m!60681 () Bool)

(assert (=> b!65877 m!60681))

(declare-fun m!60683 () Bool)

(assert (=> mapNonEmpty!3053 m!60683))

(declare-fun m!60685 () Bool)

(assert (=> b!65886 m!60685))

(declare-fun m!60687 () Bool)

(assert (=> start!9220 m!60687))

(declare-fun m!60689 () Bool)

(assert (=> mapNonEmpty!3054 m!60689))

(declare-fun m!60691 () Bool)

(assert (=> b!65882 m!60691))

(declare-fun m!60693 () Bool)

(assert (=> b!65882 m!60693))

(assert (=> b!65882 m!60667))

(declare-fun m!60695 () Bool)

(assert (=> b!65882 m!60695))

(assert (=> b!65882 m!60667))

(assert (=> b!65882 m!60667))

(declare-fun m!60697 () Bool)

(assert (=> b!65882 m!60697))

(assert (=> b!65882 m!60667))

(declare-fun m!60699 () Bool)

(assert (=> b!65882 m!60699))

(declare-fun m!60701 () Bool)

(assert (=> b!65876 m!60701))

(declare-fun m!60703 () Bool)

(assert (=> b!65876 m!60703))

(assert (=> b!65873 m!60667))

(assert (=> b!65873 m!60667))

(declare-fun m!60705 () Bool)

(assert (=> b!65873 m!60705))

(assert (=> b!65873 m!60667))

(declare-fun m!60707 () Bool)

(assert (=> b!65873 m!60707))

(declare-fun m!60709 () Bool)

(assert (=> b!65872 m!60709))

(declare-fun m!60711 () Bool)

(assert (=> b!65872 m!60711))

(declare-fun m!60713 () Bool)

(assert (=> b!65872 m!60713))

(assert (=> b!65872 m!60667))

(declare-fun m!60715 () Bool)

(assert (=> b!65872 m!60715))

(declare-fun m!60717 () Bool)

(assert (=> b!65872 m!60717))

(declare-fun m!60719 () Bool)

(assert (=> b!65872 m!60719))

(assert (=> b!65872 m!60709))

(assert (=> b!65872 m!60667))

(assert (=> b!65872 m!60717))

(declare-fun m!60721 () Bool)

(assert (=> b!65872 m!60721))

(check-sat (not b!65877) (not b!65871) (not b!65872) (not b!65876) b_and!4073 (not b_lambda!2955) (not mapNonEmpty!3054) (not start!9220) (not b!65886) (not mapNonEmpty!3053) (not b_next!2059) (not b!65874) (not b!65873) (not b_next!2057) tp_is_empty!2445 b_and!4071 (not b!65882))
(check-sat b_and!4071 b_and!4073 (not b_next!2057) (not b_next!2059))
(get-model)

(declare-fun b_lambda!2959 () Bool)

(assert (= b_lambda!2955 (or (and b!65876 b_free!2057) (and b!65874 b_free!2059 (= (defaultEntry!2141 newMap!16) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992))))) b_lambda!2959)))

(check-sat (not b!65877) (not b!65871) (not b!65872) (not b!65876) b_and!4073 (not mapNonEmpty!3054) (not start!9220) (not b!65886) (not mapNonEmpty!3053) (not b_next!2059) (not b!65874) (not b_next!2057) tp_is_empty!2445 b_and!4071 (not b!65882) (not b!65873) (not b_lambda!2959))
(check-sat b_and!4071 b_and!4073 (not b_next!2057) (not b_next!2059))
(get-model)

(declare-fun d!13711 () Bool)

(assert (=> d!13711 (= (array_inv!1125 (_keys!3781 newMap!16)) (bvsge (size!2064 (_keys!3781 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!65874 d!13711))

(declare-fun d!13713 () Bool)

(assert (=> d!13713 (= (array_inv!1126 (_values!2124 newMap!16)) (bvsge (size!2065 (_values!2124 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!65874 d!13713))

(declare-fun d!13715 () Bool)

(declare-fun e!43275 () Bool)

(assert (=> d!13715 e!43275))

(declare-fun res!35786 () Bool)

(assert (=> d!13715 (=> res!35786 e!43275)))

(declare-fun lt!28349 () Bool)

(assert (=> d!13715 (= res!35786 (not lt!28349))))

(declare-fun lt!28347 () Bool)

(assert (=> d!13715 (= lt!28349 lt!28347)))

(declare-fun lt!28350 () Unit!1825)

(declare-fun e!43276 () Unit!1825)

(assert (=> d!13715 (= lt!28350 e!43276)))

(declare-fun c!9044 () Bool)

(assert (=> d!13715 (= c!9044 lt!28347)))

(declare-fun containsKey!133 (List!1461 (_ BitVec 64)) Bool)

(assert (=> d!13715 (= lt!28347 (containsKey!133 (toList!714 lt!28297) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355)))))

(assert (=> d!13715 (= (contains!706 lt!28297 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355)) lt!28349)))

(declare-fun b!65955 () Bool)

(declare-fun lt!28348 () Unit!1825)

(assert (=> b!65955 (= e!43276 lt!28348)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!81 (List!1461 (_ BitVec 64)) Unit!1825)

(assert (=> b!65955 (= lt!28348 (lemmaContainsKeyImpliesGetValueByKeyDefined!81 (toList!714 lt!28297) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355)))))

(declare-datatypes ((Option!135 0))(
  ( (Some!134 (v!2474 V!2907)) (None!133) )
))
(declare-fun isDefined!82 (Option!135) Bool)

(declare-fun getValueByKey!129 (List!1461 (_ BitVec 64)) Option!135)

(assert (=> b!65955 (isDefined!82 (getValueByKey!129 (toList!714 lt!28297) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355)))))

(declare-fun b!65956 () Bool)

(declare-fun Unit!1832 () Unit!1825)

(assert (=> b!65956 (= e!43276 Unit!1832)))

(declare-fun b!65957 () Bool)

(assert (=> b!65957 (= e!43275 (isDefined!82 (getValueByKey!129 (toList!714 lt!28297) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355))))))

(assert (= (and d!13715 c!9044) b!65955))

(assert (= (and d!13715 (not c!9044)) b!65956))

(assert (= (and d!13715 (not res!35786)) b!65957))

(assert (=> d!13715 m!60667))

(declare-fun m!60779 () Bool)

(assert (=> d!13715 m!60779))

(assert (=> b!65955 m!60667))

(declare-fun m!60781 () Bool)

(assert (=> b!65955 m!60781))

(assert (=> b!65955 m!60667))

(declare-fun m!60783 () Bool)

(assert (=> b!65955 m!60783))

(assert (=> b!65955 m!60783))

(declare-fun m!60785 () Bool)

(assert (=> b!65955 m!60785))

(assert (=> b!65957 m!60667))

(assert (=> b!65957 m!60783))

(assert (=> b!65957 m!60783))

(assert (=> b!65957 m!60785))

(assert (=> b!65873 d!13715))

(declare-fun e!43326 () Bool)

(declare-datatypes ((SeekEntryResult!232 0))(
  ( (MissingZero!232 (index!3056 (_ BitVec 32))) (Found!232 (index!3057 (_ BitVec 32))) (Intermediate!232 (undefined!1044 Bool) (index!3058 (_ BitVec 32)) (x!10661 (_ BitVec 32))) (Undefined!232) (MissingVacant!232 (index!3059 (_ BitVec 32))) )
))
(declare-fun lt!28424 () SeekEntryResult!232)

(declare-fun b!66042 () Bool)

(assert (=> b!66042 (= e!43326 (= (select (arr!1829 (_keys!3781 newMap!16)) (index!3057 lt!28424)) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355)))))

(declare-fun b!66043 () Bool)

(declare-fun res!35820 () Bool)

(declare-fun e!43336 () Bool)

(assert (=> b!66043 (=> (not res!35820) (not e!43336))))

(declare-fun lt!28421 () SeekEntryResult!232)

(assert (=> b!66043 (= res!35820 (= (select (arr!1829 (_keys!3781 newMap!16)) (index!3056 lt!28421)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!66044 () Bool)

(declare-fun res!35826 () Bool)

(declare-fun call!5440 () Bool)

(assert (=> b!66044 (= res!35826 call!5440)))

(declare-fun e!43324 () Bool)

(assert (=> b!66044 (=> (not res!35826) (not e!43324))))

(declare-fun call!5441 () SeekEntryResult!232)

(declare-fun bm!5422 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3827 (_ BitVec 32)) SeekEntryResult!232)

(assert (=> bm!5422 (= call!5441 (seekEntryOrOpen!0 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (_keys!3781 newMap!16) (mask!6073 newMap!16)))))

(declare-fun b!66045 () Bool)

(declare-fun res!35825 () Bool)

(declare-fun lt!28411 () SeekEntryResult!232)

(assert (=> b!66045 (= res!35825 (= (select (arr!1829 (_keys!3781 newMap!16)) (index!3059 lt!28411)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!43332 () Bool)

(assert (=> b!66045 (=> (not res!35825) (not e!43332))))

(declare-fun b!66046 () Bool)

(declare-fun lt!28423 () Unit!1825)

(declare-fun e!43338 () Unit!1825)

(assert (=> b!66046 (= lt!28423 e!43338)))

(declare-fun c!9076 () Bool)

(declare-fun call!5427 () Bool)

(assert (=> b!66046 (= c!9076 call!5427)))

(declare-fun e!43342 () tuple2!2084)

(assert (=> b!66046 (= e!43342 (tuple2!2085 false newMap!16))))

(declare-fun bm!5423 () Bool)

(declare-fun c!9079 () Bool)

(declare-fun c!9085 () Bool)

(assert (=> bm!5423 (= c!9079 c!9085)))

(declare-fun e!43337 () ListLongMap!1397)

(assert (=> bm!5423 (= call!5427 (contains!706 e!43337 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355)))))

(declare-fun bm!5424 () Bool)

(declare-fun call!5426 () ListLongMap!1397)

(declare-fun call!5448 () ListLongMap!1397)

(assert (=> bm!5424 (= call!5426 call!5448)))

(declare-fun b!66047 () Bool)

(declare-fun e!43325 () Bool)

(declare-fun call!5439 () Bool)

(assert (=> b!66047 (= e!43325 (not call!5439))))

(declare-fun lt!28410 () SeekEntryResult!232)

(declare-fun c!9081 () Bool)

(declare-fun bm!5425 () Bool)

(declare-fun c!9078 () Bool)

(declare-fun call!5429 () Bool)

(declare-fun c!9083 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5425 (= call!5429 (inRange!0 (ite c!9085 (ite c!9076 (index!3057 lt!28410) (ite c!9081 (index!3056 lt!28411) (index!3059 lt!28411))) (ite c!9078 (index!3057 lt!28424) (ite c!9083 (index!3056 lt!28421) (index!3059 lt!28421)))) (mask!6073 newMap!16)))))

(declare-fun b!66048 () Bool)

(declare-fun call!5435 () ListLongMap!1397)

(assert (=> b!66048 (= e!43337 call!5435)))

(declare-fun call!5444 () ListLongMap!1397)

(declare-fun b!66049 () Bool)

(declare-fun e!43333 () ListLongMap!1397)

(declare-fun c!9074 () Bool)

(assert (=> b!66049 (= e!43333 (ite c!9074 call!5444 call!5426))))

(declare-fun bm!5426 () Bool)

(declare-fun call!5445 () ListLongMap!1397)

(declare-fun call!5431 () ListLongMap!1397)

(assert (=> bm!5426 (= call!5445 call!5431)))

(declare-fun b!66050 () Bool)

(declare-fun res!35822 () Bool)

(declare-fun call!5425 () Bool)

(assert (=> b!66050 (= res!35822 call!5425)))

(assert (=> b!66050 (=> (not res!35822) (not e!43326))))

(declare-fun b!66051 () Bool)

(declare-fun c!9073 () Bool)

(declare-fun lt!28426 () SeekEntryResult!232)

(assert (=> b!66051 (= c!9073 ((_ is MissingVacant!232) lt!28426))))

(declare-fun e!43327 () tuple2!2084)

(assert (=> b!66051 (= e!43342 e!43327)))

(declare-fun b!66052 () Bool)

(declare-fun lt!28412 () tuple2!2084)

(declare-fun call!5438 () tuple2!2084)

(assert (=> b!66052 (= lt!28412 call!5438)))

(declare-fun e!43340 () tuple2!2084)

(assert (=> b!66052 (= e!43340 (tuple2!2085 (_1!1053 lt!28412) (_2!1053 lt!28412)))))

(declare-fun b!66053 () Bool)

(declare-fun e!43329 () Bool)

(declare-fun call!5428 () ListLongMap!1397)

(declare-fun call!5433 () ListLongMap!1397)

(assert (=> b!66053 (= e!43329 (= call!5428 call!5433))))

(declare-fun b!66054 () Bool)

(declare-fun e!43321 () Unit!1825)

(declare-fun lt!28419 () Unit!1825)

(assert (=> b!66054 (= e!43321 lt!28419)))

(declare-fun call!5447 () Unit!1825)

(assert (=> b!66054 (= lt!28419 call!5447)))

(declare-fun call!5443 () SeekEntryResult!232)

(assert (=> b!66054 (= lt!28424 call!5443)))

(declare-fun res!35817 () Bool)

(assert (=> b!66054 (= res!35817 ((_ is Found!232) lt!28424))))

(assert (=> b!66054 (=> (not res!35817) (not e!43326))))

(assert (=> b!66054 e!43326))

(declare-fun b!66055 () Bool)

(declare-fun e!43330 () tuple2!2084)

(declare-fun e!43328 () tuple2!2084)

(assert (=> b!66055 (= e!43330 e!43328)))

(assert (=> b!66055 (= c!9074 (= (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5427 () Bool)

(declare-fun call!5436 () SeekEntryResult!232)

(assert (=> bm!5427 (= call!5436 call!5441)))

(declare-fun b!66056 () Bool)

(declare-fun lt!28425 () tuple2!2084)

(assert (=> b!66056 (= e!43327 (tuple2!2085 (_1!1053 lt!28425) (_2!1053 lt!28425)))))

(assert (=> b!66056 (= lt!28425 call!5438)))

(declare-fun b!66057 () Bool)

(assert (=> b!66057 (= e!43333 (getCurrentListMap!413 (_keys!3781 newMap!16) (_values!2124 newMap!16) (mask!6073 newMap!16) (extraKeys!2012 newMap!16) (zeroValue!2049 newMap!16) (minValue!2049 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2141 newMap!16)))))

(declare-fun b!66058 () Bool)

(declare-fun c!9077 () Bool)

(assert (=> b!66058 (= c!9077 ((_ is MissingVacant!232) lt!28411))))

(declare-fun e!43334 () Bool)

(declare-fun e!43322 () Bool)

(assert (=> b!66058 (= e!43334 e!43322)))

(declare-fun bm!5428 () Bool)

(declare-fun call!5446 () ListLongMap!1397)

(assert (=> bm!5428 (= call!5435 call!5446)))

(declare-fun lt!28417 () tuple2!2084)

(declare-fun c!9086 () Bool)

(declare-fun bm!5429 () Bool)

(assert (=> bm!5429 (= call!5433 (map!1132 (ite c!9086 (_2!1053 lt!28417) newMap!16)))))

(declare-fun b!66059 () Bool)

(assert (=> b!66059 (= e!43330 e!43342)))

(assert (=> b!66059 (= lt!28426 (seekEntryOrOpen!0 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (_keys!3781 newMap!16) (mask!6073 newMap!16)))))

(assert (=> b!66059 (= c!9085 ((_ is Undefined!232) lt!28426))))

(declare-fun lt!28407 () array!3829)

(declare-fun lt!28418 () (_ BitVec 32))

(declare-fun bm!5430 () Bool)

(declare-fun c!9084 () Bool)

(assert (=> bm!5430 (= call!5448 (getCurrentListMap!413 (_keys!3781 newMap!16) (ite c!9084 (_values!2124 newMap!16) lt!28407) (mask!6073 newMap!16) (ite (and c!9084 c!9074) lt!28418 (extraKeys!2012 newMap!16)) (ite (and c!9084 c!9074) lt!28291 (zeroValue!2049 newMap!16)) (minValue!2049 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2141 newMap!16)))))

(declare-fun b!66060 () Bool)

(declare-fun e!43331 () Bool)

(assert (=> b!66060 (= e!43331 e!43329)))

(assert (=> b!66060 (= c!9086 (_1!1053 lt!28417))))

(declare-fun b!66061 () Bool)

(assert (=> b!66061 (= e!43322 e!43332)))

(declare-fun res!35823 () Bool)

(declare-fun call!5432 () Bool)

(assert (=> b!66061 (= res!35823 call!5432)))

(assert (=> b!66061 (=> (not res!35823) (not e!43332))))

(declare-fun bm!5431 () Bool)

(assert (=> bm!5431 (= call!5428 (map!1132 (ite c!9086 newMap!16 (_2!1053 lt!28417))))))

(declare-fun b!66062 () Bool)

(declare-fun lt!28420 () Unit!1825)

(declare-fun lt!28405 () Unit!1825)

(assert (=> b!66062 (= lt!28420 lt!28405)))

(assert (=> b!66062 (= call!5445 call!5426)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!20 (array!3827 array!3829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2907 V!2907 V!2907 Int) Unit!1825)

(assert (=> b!66062 (= lt!28405 (lemmaChangeZeroKeyThenAddPairToListMap!20 (_keys!3781 newMap!16) (_values!2124 newMap!16) (mask!6073 newMap!16) (extraKeys!2012 newMap!16) lt!28418 (zeroValue!2049 newMap!16) lt!28291 (minValue!2049 newMap!16) (defaultEntry!2141 newMap!16)))))

(assert (=> b!66062 (= lt!28418 (bvor (extraKeys!2012 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!66062 (= e!43328 (tuple2!2085 true (LongMapFixedSize!667 (defaultEntry!2141 newMap!16) (mask!6073 newMap!16) (bvor (extraKeys!2012 newMap!16) #b00000000000000000000000000000001) lt!28291 (minValue!2049 newMap!16) (_size!382 newMap!16) (_keys!3781 newMap!16) (_values!2124 newMap!16) (_vacant!382 newMap!16))))))

(declare-fun b!66063 () Bool)

(declare-fun res!35815 () Bool)

(assert (=> b!66063 (=> (not res!35815) (not e!43336))))

(declare-fun call!5437 () Bool)

(assert (=> b!66063 (= res!35815 call!5437)))

(declare-fun e!43341 () Bool)

(assert (=> b!66063 (= e!43341 e!43336)))

(declare-fun bm!5432 () Bool)

(assert (=> bm!5432 (= call!5431 (+!86 e!43333 (ite c!9084 (ite c!9074 (tuple2!2083 #b0000000000000000000000000000000000000000000000000000000000000000 lt!28291) (tuple2!2083 #b1000000000000000000000000000000000000000000000000000000000000000 lt!28291)) (tuple2!2083 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) lt!28291))))))

(declare-fun c!9082 () Bool)

(assert (=> bm!5432 (= c!9082 c!9084)))

(declare-fun b!66064 () Bool)

(assert (=> b!66064 (= e!43324 (= (select (arr!1829 (_keys!3781 newMap!16)) (index!3057 lt!28410)) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355)))))

(declare-fun b!66065 () Bool)

(declare-fun res!35828 () Bool)

(declare-fun e!43339 () Bool)

(assert (=> b!66065 (=> (not res!35828) (not e!43339))))

(assert (=> b!66065 (= res!35828 call!5432)))

(assert (=> b!66065 (= e!43334 e!43339)))

(declare-fun bm!5433 () Bool)

(declare-fun call!5442 () Bool)

(declare-fun call!5430 () Bool)

(assert (=> bm!5433 (= call!5442 call!5430)))

(declare-fun bm!5434 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!20 (array!3827 array!3829 (_ BitVec 32) (_ BitVec 32) V!2907 V!2907 (_ BitVec 64) Int) Unit!1825)

(assert (=> bm!5434 (= call!5447 (lemmaInListMapThenSeekEntryOrOpenFindsIt!20 (_keys!3781 newMap!16) (_values!2124 newMap!16) (mask!6073 newMap!16) (extraKeys!2012 newMap!16) (zeroValue!2049 newMap!16) (minValue!2049 newMap!16) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (defaultEntry!2141 newMap!16)))))

(declare-fun b!66066 () Bool)

(assert (=> b!66066 (= e!43339 (not call!5442))))

(declare-fun bm!5435 () Bool)

(assert (=> bm!5435 (= call!5439 call!5430)))

(declare-fun b!66067 () Bool)

(declare-fun c!9075 () Bool)

(assert (=> b!66067 (= c!9075 ((_ is MissingVacant!232) lt!28421))))

(declare-fun e!43323 () Bool)

(assert (=> b!66067 (= e!43341 e!43323)))

(declare-fun d!13717 () Bool)

(assert (=> d!13717 e!43331))

(declare-fun res!35821 () Bool)

(assert (=> d!13717 (=> (not res!35821) (not e!43331))))

(assert (=> d!13717 (= res!35821 (valid!276 (_2!1053 lt!28417)))))

(assert (=> d!13717 (= lt!28417 e!43330)))

(assert (=> d!13717 (= c!9084 (= (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (bvneg (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355))))))

(assert (=> d!13717 (valid!276 newMap!16)))

(assert (=> d!13717 (= (update!87 newMap!16 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) lt!28291) lt!28417)))

(declare-fun b!66068 () Bool)

(assert (=> b!66068 (= e!43336 (not call!5439))))

(declare-fun b!66069 () Bool)

(declare-fun lt!28429 () Unit!1825)

(declare-fun lt!28422 () Unit!1825)

(assert (=> b!66069 (= lt!28429 lt!28422)))

(assert (=> b!66069 (contains!706 call!5448 (select (arr!1829 (_keys!3781 newMap!16)) (index!3057 lt!28426)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!81 (array!3827 array!3829 (_ BitVec 32) (_ BitVec 32) V!2907 V!2907 (_ BitVec 32) Int) Unit!1825)

(assert (=> b!66069 (= lt!28422 (lemmaValidKeyInArrayIsInListMap!81 (_keys!3781 newMap!16) lt!28407 (mask!6073 newMap!16) (extraKeys!2012 newMap!16) (zeroValue!2049 newMap!16) (minValue!2049 newMap!16) (index!3057 lt!28426) (defaultEntry!2141 newMap!16)))))

(assert (=> b!66069 (= lt!28407 (array!3830 (store (arr!1830 (_values!2124 newMap!16)) (index!3057 lt!28426) (ValueCellFull!879 lt!28291)) (size!2065 (_values!2124 newMap!16))))))

(declare-fun lt!28413 () Unit!1825)

(declare-fun lt!28416 () Unit!1825)

(assert (=> b!66069 (= lt!28413 lt!28416)))

(assert (=> b!66069 (= call!5431 call!5435)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!20 (array!3827 array!3829 (_ BitVec 32) (_ BitVec 32) V!2907 V!2907 (_ BitVec 32) (_ BitVec 64) V!2907 Int) Unit!1825)

(assert (=> b!66069 (= lt!28416 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!20 (_keys!3781 newMap!16) (_values!2124 newMap!16) (mask!6073 newMap!16) (extraKeys!2012 newMap!16) (zeroValue!2049 newMap!16) (minValue!2049 newMap!16) (index!3057 lt!28426) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) lt!28291 (defaultEntry!2141 newMap!16)))))

(declare-fun lt!28408 () Unit!1825)

(assert (=> b!66069 (= lt!28408 e!43321)))

(assert (=> b!66069 (= c!9078 call!5427)))

(assert (=> b!66069 (= e!43340 (tuple2!2085 true (LongMapFixedSize!667 (defaultEntry!2141 newMap!16) (mask!6073 newMap!16) (extraKeys!2012 newMap!16) (zeroValue!2049 newMap!16) (minValue!2049 newMap!16) (_size!382 newMap!16) (_keys!3781 newMap!16) (array!3830 (store (arr!1830 (_values!2124 newMap!16)) (index!3057 lt!28426) (ValueCellFull!879 lt!28291)) (size!2065 (_values!2124 newMap!16))) (_vacant!382 newMap!16))))))

(declare-fun bm!5436 () Bool)

(declare-fun updateHelperNewKey!20 (LongMapFixedSize!666 (_ BitVec 64) V!2907 (_ BitVec 32)) tuple2!2084)

(assert (=> bm!5436 (= call!5438 (updateHelperNewKey!20 newMap!16 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) lt!28291 (ite c!9073 (index!3059 lt!28426) (index!3056 lt!28426))))))

(declare-fun bm!5437 () Bool)

(assert (=> bm!5437 (= call!5444 call!5446)))

(declare-fun b!66070 () Bool)

(assert (=> b!66070 (= e!43332 (not call!5442))))

(declare-fun bm!5438 () Bool)

(assert (=> bm!5438 (= call!5425 call!5429)))

(declare-fun bm!5439 () Bool)

(assert (=> bm!5439 (= call!5432 call!5440)))

(declare-fun b!66071 () Bool)

(assert (=> b!66071 (= e!43337 (getCurrentListMap!413 (_keys!3781 newMap!16) (_values!2124 newMap!16) (mask!6073 newMap!16) (extraKeys!2012 newMap!16) (zeroValue!2049 newMap!16) (minValue!2049 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2141 newMap!16)))))

(declare-fun bm!5440 () Bool)

(declare-fun lt!28428 () (_ BitVec 32))

(assert (=> bm!5440 (= call!5446 (getCurrentListMap!413 (_keys!3781 newMap!16) (ite (or c!9084 c!9085) (_values!2124 newMap!16) (array!3830 (store (arr!1830 (_values!2124 newMap!16)) (index!3057 lt!28426) (ValueCellFull!879 lt!28291)) (size!2065 (_values!2124 newMap!16)))) (mask!6073 newMap!16) (ite c!9084 (ite c!9074 (extraKeys!2012 newMap!16) lt!28428) (extraKeys!2012 newMap!16)) (zeroValue!2049 newMap!16) (ite c!9084 (ite c!9074 (minValue!2049 newMap!16) lt!28291) (minValue!2049 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2141 newMap!16)))))

(declare-fun bm!5441 () Bool)

(assert (=> bm!5441 (= call!5443 call!5441)))

(declare-fun bm!5442 () Bool)

(assert (=> bm!5442 (= call!5440 call!5429)))

(declare-fun b!66072 () Bool)

(declare-fun Unit!1833 () Unit!1825)

(assert (=> b!66072 (= e!43321 Unit!1833)))

(declare-fun lt!28415 () Unit!1825)

(declare-fun call!5434 () Unit!1825)

(assert (=> b!66072 (= lt!28415 call!5434)))

(assert (=> b!66072 (= lt!28421 call!5443)))

(assert (=> b!66072 (= c!9083 ((_ is MissingZero!232) lt!28421))))

(assert (=> b!66072 e!43341))

(declare-fun lt!28427 () Unit!1825)

(assert (=> b!66072 (= lt!28427 lt!28415)))

(assert (=> b!66072 false))

(declare-fun bm!5443 () Bool)

(assert (=> bm!5443 (= call!5437 call!5425)))

(declare-fun b!66073 () Bool)

(declare-fun res!35816 () Bool)

(assert (=> b!66073 (=> (not res!35816) (not e!43339))))

(assert (=> b!66073 (= res!35816 (= (select (arr!1829 (_keys!3781 newMap!16)) (index!3056 lt!28411)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!66074 () Bool)

(declare-fun lt!28406 () Unit!1825)

(declare-fun lt!28409 () Unit!1825)

(assert (=> b!66074 (= lt!28406 lt!28409)))

(assert (=> b!66074 (= call!5445 call!5444)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!20 (array!3827 array!3829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2907 V!2907 V!2907 Int) Unit!1825)

(assert (=> b!66074 (= lt!28409 (lemmaChangeLongMinValueKeyThenAddPairToListMap!20 (_keys!3781 newMap!16) (_values!2124 newMap!16) (mask!6073 newMap!16) (extraKeys!2012 newMap!16) lt!28428 (zeroValue!2049 newMap!16) (minValue!2049 newMap!16) lt!28291 (defaultEntry!2141 newMap!16)))))

(assert (=> b!66074 (= lt!28428 (bvor (extraKeys!2012 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!66074 (= e!43328 (tuple2!2085 true (LongMapFixedSize!667 (defaultEntry!2141 newMap!16) (mask!6073 newMap!16) (bvor (extraKeys!2012 newMap!16) #b00000000000000000000000000000010) (zeroValue!2049 newMap!16) lt!28291 (_size!382 newMap!16) (_keys!3781 newMap!16) (_values!2124 newMap!16) (_vacant!382 newMap!16))))))

(declare-fun e!43335 () Bool)

(declare-fun b!66075 () Bool)

(assert (=> b!66075 (= e!43335 (= call!5433 (+!86 call!5428 (tuple2!2083 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) lt!28291))))))

(declare-fun b!66076 () Bool)

(assert (=> b!66076 (= e!43322 ((_ is Undefined!232) lt!28411))))

(declare-fun b!66077 () Bool)

(declare-fun res!35824 () Bool)

(assert (=> b!66077 (= res!35824 (= (select (arr!1829 (_keys!3781 newMap!16)) (index!3059 lt!28421)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!66077 (=> (not res!35824) (not e!43325))))

(declare-fun b!66078 () Bool)

(assert (=> b!66078 (= e!43327 e!43340)))

(declare-fun c!9080 () Bool)

(assert (=> b!66078 (= c!9080 ((_ is MissingZero!232) lt!28426))))

(declare-fun b!66079 () Bool)

(declare-fun lt!28414 () Unit!1825)

(assert (=> b!66079 (= e!43338 lt!28414)))

(assert (=> b!66079 (= lt!28414 call!5434)))

(assert (=> b!66079 (= lt!28411 call!5436)))

(assert (=> b!66079 (= c!9081 ((_ is MissingZero!232) lt!28411))))

(assert (=> b!66079 e!43334))

(declare-fun b!66080 () Bool)

(declare-fun Unit!1834 () Unit!1825)

(assert (=> b!66080 (= e!43338 Unit!1834)))

(declare-fun lt!28430 () Unit!1825)

(assert (=> b!66080 (= lt!28430 call!5447)))

(assert (=> b!66080 (= lt!28410 call!5436)))

(declare-fun res!35818 () Bool)

(assert (=> b!66080 (= res!35818 ((_ is Found!232) lt!28410))))

(assert (=> b!66080 (=> (not res!35818) (not e!43324))))

(assert (=> b!66080 e!43324))

(declare-fun lt!28431 () Unit!1825)

(assert (=> b!66080 (= lt!28431 lt!28430)))

(assert (=> b!66080 false))

(declare-fun bm!5444 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!20 (array!3827 array!3829 (_ BitVec 32) (_ BitVec 32) V!2907 V!2907 (_ BitVec 64) Int) Unit!1825)

(assert (=> bm!5444 (= call!5434 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!20 (_keys!3781 newMap!16) (_values!2124 newMap!16) (mask!6073 newMap!16) (extraKeys!2012 newMap!16) (zeroValue!2049 newMap!16) (minValue!2049 newMap!16) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (defaultEntry!2141 newMap!16)))))

(declare-fun b!66081 () Bool)

(assert (=> b!66081 (= e!43329 e!43335)))

(declare-fun res!35819 () Bool)

(assert (=> b!66081 (= res!35819 (contains!706 call!5433 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355)))))

(assert (=> b!66081 (=> (not res!35819) (not e!43335))))

(declare-fun b!66082 () Bool)

(assert (=> b!66082 (= e!43323 e!43325)))

(declare-fun res!35827 () Bool)

(assert (=> b!66082 (= res!35827 call!5437)))

(assert (=> b!66082 (=> (not res!35827) (not e!43325))))

(declare-fun b!66083 () Bool)

(assert (=> b!66083 (= e!43323 ((_ is Undefined!232) lt!28421))))

(declare-fun bm!5445 () Bool)

(assert (=> bm!5445 (= call!5430 (arrayContainsKey!0 (_keys!3781 newMap!16) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(assert (= (and d!13717 c!9084) b!66055))

(assert (= (and d!13717 (not c!9084)) b!66059))

(assert (= (and b!66055 c!9074) b!66062))

(assert (= (and b!66055 (not c!9074)) b!66074))

(assert (= (or b!66062 b!66074) bm!5437))

(assert (= (or b!66062 b!66074) bm!5424))

(assert (= (or b!66062 b!66074) bm!5426))

(assert (= (and b!66059 c!9085) b!66046))

(assert (= (and b!66059 (not c!9085)) b!66051))

(assert (= (and b!66046 c!9076) b!66080))

(assert (= (and b!66046 (not c!9076)) b!66079))

(assert (= (and b!66080 res!35818) b!66044))

(assert (= (and b!66044 res!35826) b!66064))

(assert (= (and b!66079 c!9081) b!66065))

(assert (= (and b!66079 (not c!9081)) b!66058))

(assert (= (and b!66065 res!35828) b!66073))

(assert (= (and b!66073 res!35816) b!66066))

(assert (= (and b!66058 c!9077) b!66061))

(assert (= (and b!66058 (not c!9077)) b!66076))

(assert (= (and b!66061 res!35823) b!66045))

(assert (= (and b!66045 res!35825) b!66070))

(assert (= (or b!66065 b!66061) bm!5439))

(assert (= (or b!66066 b!66070) bm!5433))

(assert (= (or b!66044 bm!5439) bm!5442))

(assert (= (or b!66080 b!66079) bm!5427))

(assert (= (and b!66051 c!9073) b!66056))

(assert (= (and b!66051 (not c!9073)) b!66078))

(assert (= (and b!66078 c!9080) b!66052))

(assert (= (and b!66078 (not c!9080)) b!66069))

(assert (= (and b!66069 c!9078) b!66054))

(assert (= (and b!66069 (not c!9078)) b!66072))

(assert (= (and b!66054 res!35817) b!66050))

(assert (= (and b!66050 res!35822) b!66042))

(assert (= (and b!66072 c!9083) b!66063))

(assert (= (and b!66072 (not c!9083)) b!66067))

(assert (= (and b!66063 res!35815) b!66043))

(assert (= (and b!66043 res!35820) b!66068))

(assert (= (and b!66067 c!9075) b!66082))

(assert (= (and b!66067 (not c!9075)) b!66083))

(assert (= (and b!66082 res!35827) b!66077))

(assert (= (and b!66077 res!35824) b!66047))

(assert (= (or b!66063 b!66082) bm!5443))

(assert (= (or b!66068 b!66047) bm!5435))

(assert (= (or b!66050 bm!5443) bm!5438))

(assert (= (or b!66054 b!66072) bm!5441))

(assert (= (or b!66056 b!66052) bm!5436))

(assert (= (or b!66046 b!66069) bm!5428))

(assert (= (or b!66080 b!66054) bm!5434))

(assert (= (or bm!5427 bm!5441) bm!5422))

(assert (= (or b!66079 b!66072) bm!5444))

(assert (= (or bm!5433 bm!5435) bm!5445))

(assert (= (or bm!5442 bm!5438) bm!5425))

(assert (= (or b!66046 b!66069) bm!5423))

(assert (= (and bm!5423 c!9079) b!66048))

(assert (= (and bm!5423 (not c!9079)) b!66071))

(assert (= (or bm!5424 b!66069) bm!5430))

(assert (= (or bm!5437 bm!5428) bm!5440))

(assert (= (or bm!5426 b!66069) bm!5432))

(assert (= (and bm!5432 c!9082) b!66049))

(assert (= (and bm!5432 (not c!9082)) b!66057))

(assert (= (and d!13717 res!35821) b!66060))

(assert (= (and b!66060 c!9086) b!66081))

(assert (= (and b!66060 (not c!9086)) b!66053))

(assert (= (and b!66081 res!35819) b!66075))

(assert (= (or b!66075 b!66053) bm!5431))

(assert (= (or b!66081 b!66075 b!66053) bm!5429))

(declare-fun m!60787 () Bool)

(assert (=> bm!5429 m!60787))

(assert (=> b!66059 m!60667))

(declare-fun m!60789 () Bool)

(assert (=> b!66059 m!60789))

(declare-fun m!60791 () Bool)

(assert (=> b!66073 m!60791))

(declare-fun m!60793 () Bool)

(assert (=> b!66042 m!60793))

(assert (=> bm!5423 m!60667))

(declare-fun m!60795 () Bool)

(assert (=> bm!5423 m!60795))

(assert (=> bm!5422 m!60667))

(assert (=> bm!5422 m!60789))

(assert (=> bm!5434 m!60667))

(declare-fun m!60797 () Bool)

(assert (=> bm!5434 m!60797))

(declare-fun m!60799 () Bool)

(assert (=> b!66077 m!60799))

(declare-fun m!60801 () Bool)

(assert (=> b!66045 m!60801))

(assert (=> bm!5445 m!60667))

(declare-fun m!60803 () Bool)

(assert (=> bm!5445 m!60803))

(assert (=> bm!5436 m!60667))

(declare-fun m!60805 () Bool)

(assert (=> bm!5436 m!60805))

(declare-fun m!60807 () Bool)

(assert (=> b!66043 m!60807))

(assert (=> b!66081 m!60667))

(declare-fun m!60809 () Bool)

(assert (=> b!66081 m!60809))

(declare-fun m!60811 () Bool)

(assert (=> bm!5432 m!60811))

(declare-fun m!60813 () Bool)

(assert (=> b!66074 m!60813))

(declare-fun m!60815 () Bool)

(assert (=> b!66064 m!60815))

(declare-fun m!60817 () Bool)

(assert (=> b!66062 m!60817))

(declare-fun m!60819 () Bool)

(assert (=> bm!5440 m!60819))

(declare-fun m!60821 () Bool)

(assert (=> bm!5440 m!60821))

(declare-fun m!60823 () Bool)

(assert (=> b!66075 m!60823))

(declare-fun m!60825 () Bool)

(assert (=> b!66069 m!60825))

(declare-fun m!60827 () Bool)

(assert (=> b!66069 m!60827))

(declare-fun m!60829 () Bool)

(assert (=> b!66069 m!60829))

(assert (=> b!66069 m!60819))

(assert (=> b!66069 m!60667))

(declare-fun m!60831 () Bool)

(assert (=> b!66069 m!60831))

(assert (=> b!66069 m!60827))

(declare-fun m!60833 () Bool)

(assert (=> d!13717 m!60833))

(assert (=> d!13717 m!60685))

(assert (=> bm!5444 m!60667))

(declare-fun m!60835 () Bool)

(assert (=> bm!5444 m!60835))

(declare-fun m!60837 () Bool)

(assert (=> bm!5431 m!60837))

(declare-fun m!60839 () Bool)

(assert (=> b!66057 m!60839))

(declare-fun m!60841 () Bool)

(assert (=> bm!5425 m!60841))

(assert (=> b!66071 m!60839))

(declare-fun m!60843 () Bool)

(assert (=> bm!5430 m!60843))

(assert (=> b!65873 d!13717))

(declare-fun d!13719 () Bool)

(assert (=> d!13719 (not (arrayContainsKey!0 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!28434 () Unit!1825)

(declare-fun choose!68 (array!3827 (_ BitVec 32) (_ BitVec 64) List!1462) Unit!1825)

(assert (=> d!13719 (= lt!28434 (choose!68 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (Cons!1458 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) Nil!1459)))))

(assert (=> d!13719 (bvslt (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13719 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (Cons!1458 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) Nil!1459)) lt!28434)))

(declare-fun bs!2854 () Bool)

(assert (= bs!2854 d!13719))

(assert (=> bs!2854 m!60667))

(assert (=> bs!2854 m!60697))

(assert (=> bs!2854 m!60667))

(declare-fun m!60845 () Bool)

(assert (=> bs!2854 m!60845))

(assert (=> b!65882 d!13719))

(declare-fun d!13721 () Bool)

(assert (=> d!13721 (arrayNoDuplicates!0 (_keys!3781 (v!2470 (underlying!247 thiss!992))) from!355 Nil!1459)))

(declare-fun lt!28437 () Unit!1825)

(declare-fun choose!39 (array!3827 (_ BitVec 32) (_ BitVec 32)) Unit!1825)

(assert (=> d!13721 (= lt!28437 (choose!39 (_keys!3781 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!13721 (bvslt (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13721 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3781 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000000000 from!355) lt!28437)))

(declare-fun bs!2855 () Bool)

(assert (= bs!2855 d!13721))

(assert (=> bs!2855 m!60693))

(declare-fun m!60847 () Bool)

(assert (=> bs!2855 m!60847))

(assert (=> b!65882 d!13721))

(declare-fun d!13723 () Bool)

(declare-fun res!35833 () Bool)

(declare-fun e!43347 () Bool)

(assert (=> d!13723 (=> res!35833 e!43347)))

(assert (=> d!13723 (= res!35833 (= (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355)))))

(assert (=> d!13723 (= (arrayContainsKey!0 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!43347)))

(declare-fun b!66088 () Bool)

(declare-fun e!43348 () Bool)

(assert (=> b!66088 (= e!43347 e!43348)))

(declare-fun res!35834 () Bool)

(assert (=> b!66088 (=> (not res!35834) (not e!43348))))

(assert (=> b!66088 (= res!35834 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992))))))))

(declare-fun b!66089 () Bool)

(assert (=> b!66089 (= e!43348 (arrayContainsKey!0 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!13723 (not res!35833)) b!66088))

(assert (= (and b!66088 res!35834) b!66089))

(declare-fun m!60849 () Bool)

(assert (=> d!13723 m!60849))

(assert (=> b!66089 m!60667))

(declare-fun m!60851 () Bool)

(assert (=> b!66089 m!60851))

(assert (=> b!65882 d!13723))

(declare-fun d!13725 () Bool)

(declare-fun e!43351 () Bool)

(assert (=> d!13725 e!43351))

(declare-fun c!9089 () Bool)

(assert (=> d!13725 (= c!9089 (and (not (= (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!28440 () Unit!1825)

(declare-fun choose!363 (array!3827 array!3829 (_ BitVec 32) (_ BitVec 32) V!2907 V!2907 (_ BitVec 64) (_ BitVec 32) Int) Unit!1825)

(assert (=> d!13725 (= lt!28440 (choose!363 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (_values!2124 (v!2470 (underlying!247 thiss!992))) (mask!6073 (v!2470 (underlying!247 thiss!992))) (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) (minValue!2049 (v!2470 (underlying!247 thiss!992))) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992)))))))

(assert (=> d!13725 (validMask!0 (mask!6073 (v!2470 (underlying!247 thiss!992))))))

(assert (=> d!13725 (= (lemmaListMapContainsThenArrayContainsFrom!43 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (_values!2124 (v!2470 (underlying!247 thiss!992))) (mask!6073 (v!2470 (underlying!247 thiss!992))) (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) (minValue!2049 (v!2470 (underlying!247 thiss!992))) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992)))) lt!28440)))

(declare-fun b!66094 () Bool)

(assert (=> b!66094 (= e!43351 (arrayContainsKey!0 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!66095 () Bool)

(assert (=> b!66095 (= e!43351 (ite (= (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!13725 c!9089) b!66094))

(assert (= (and d!13725 (not c!9089)) b!66095))

(assert (=> d!13725 m!60667))

(declare-fun m!60853 () Bool)

(assert (=> d!13725 m!60853))

(assert (=> d!13725 m!60713))

(assert (=> b!66094 m!60667))

(assert (=> b!66094 m!60697))

(assert (=> b!65882 d!13725))

(declare-fun b!66106 () Bool)

(declare-fun e!43360 () Bool)

(declare-fun call!5451 () Bool)

(assert (=> b!66106 (= e!43360 call!5451)))

(declare-fun b!66107 () Bool)

(declare-fun e!43362 () Bool)

(declare-fun e!43361 () Bool)

(assert (=> b!66107 (= e!43362 e!43361)))

(declare-fun res!35843 () Bool)

(assert (=> b!66107 (=> (not res!35843) (not e!43361))))

(declare-fun e!43363 () Bool)

(assert (=> b!66107 (= res!35843 (not e!43363))))

(declare-fun res!35841 () Bool)

(assert (=> b!66107 (=> (not res!35841) (not e!43363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!66107 (= res!35841 (validKeyInArray!0 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355)))))

(declare-fun b!66109 () Bool)

(assert (=> b!66109 (= e!43361 e!43360)))

(declare-fun c!9092 () Bool)

(assert (=> b!66109 (= c!9092 (validKeyInArray!0 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355)))))

(declare-fun bm!5448 () Bool)

(assert (=> bm!5448 (= call!5451 (arrayNoDuplicates!0 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!9092 (Cons!1458 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) Nil!1459) Nil!1459)))))

(declare-fun b!66110 () Bool)

(declare-fun contains!708 (List!1462 (_ BitVec 64)) Bool)

(assert (=> b!66110 (= e!43363 (contains!708 Nil!1459 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355)))))

(declare-fun b!66108 () Bool)

(assert (=> b!66108 (= e!43360 call!5451)))

(declare-fun d!13727 () Bool)

(declare-fun res!35842 () Bool)

(assert (=> d!13727 (=> res!35842 e!43362)))

(assert (=> d!13727 (= res!35842 (bvsge from!355 (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992))))))))

(assert (=> d!13727 (= (arrayNoDuplicates!0 (_keys!3781 (v!2470 (underlying!247 thiss!992))) from!355 Nil!1459) e!43362)))

(assert (= (and d!13727 (not res!35842)) b!66107))

(assert (= (and b!66107 res!35841) b!66110))

(assert (= (and b!66107 res!35843) b!66109))

(assert (= (and b!66109 c!9092) b!66106))

(assert (= (and b!66109 (not c!9092)) b!66108))

(assert (= (or b!66106 b!66108) bm!5448))

(assert (=> b!66107 m!60667))

(assert (=> b!66107 m!60667))

(declare-fun m!60855 () Bool)

(assert (=> b!66107 m!60855))

(assert (=> b!66109 m!60667))

(assert (=> b!66109 m!60667))

(assert (=> b!66109 m!60855))

(assert (=> bm!5448 m!60667))

(declare-fun m!60857 () Bool)

(assert (=> bm!5448 m!60857))

(assert (=> b!66110 m!60667))

(assert (=> b!66110 m!60667))

(declare-fun m!60859 () Bool)

(assert (=> b!66110 m!60859))

(assert (=> b!65882 d!13727))

(declare-fun d!13729 () Bool)

(assert (=> d!13729 (= (valid!275 thiss!992) (valid!276 (v!2470 (underlying!247 thiss!992))))))

(declare-fun bs!2856 () Bool)

(assert (= bs!2856 d!13729))

(declare-fun m!60861 () Bool)

(assert (=> bs!2856 m!60861))

(assert (=> start!9220 d!13729))

(declare-fun d!13731 () Bool)

(declare-fun e!43366 () Bool)

(assert (=> d!13731 e!43366))

(declare-fun res!35848 () Bool)

(assert (=> d!13731 (=> (not res!35848) (not e!43366))))

(declare-fun lt!28452 () ListLongMap!1397)

(assert (=> d!13731 (= res!35848 (contains!706 lt!28452 (_1!1052 lt!28299)))))

(declare-fun lt!28450 () List!1461)

(assert (=> d!13731 (= lt!28452 (ListLongMap!1398 lt!28450))))

(declare-fun lt!28451 () Unit!1825)

(declare-fun lt!28449 () Unit!1825)

(assert (=> d!13731 (= lt!28451 lt!28449)))

(assert (=> d!13731 (= (getValueByKey!129 lt!28450 (_1!1052 lt!28299)) (Some!134 (_2!1052 lt!28299)))))

(declare-fun lemmaContainsTupThenGetReturnValue!46 (List!1461 (_ BitVec 64) V!2907) Unit!1825)

(assert (=> d!13731 (= lt!28449 (lemmaContainsTupThenGetReturnValue!46 lt!28450 (_1!1052 lt!28299) (_2!1052 lt!28299)))))

(declare-fun insertStrictlySorted!49 (List!1461 (_ BitVec 64) V!2907) List!1461)

(assert (=> d!13731 (= lt!28450 (insertStrictlySorted!49 (toList!714 lt!28298) (_1!1052 lt!28299) (_2!1052 lt!28299)))))

(assert (=> d!13731 (= (+!86 lt!28298 lt!28299) lt!28452)))

(declare-fun b!66115 () Bool)

(declare-fun res!35849 () Bool)

(assert (=> b!66115 (=> (not res!35849) (not e!43366))))

(assert (=> b!66115 (= res!35849 (= (getValueByKey!129 (toList!714 lt!28452) (_1!1052 lt!28299)) (Some!134 (_2!1052 lt!28299))))))

(declare-fun b!66116 () Bool)

(declare-fun contains!709 (List!1461 tuple2!2082) Bool)

(assert (=> b!66116 (= e!43366 (contains!709 (toList!714 lt!28452) lt!28299))))

(assert (= (and d!13731 res!35848) b!66115))

(assert (= (and b!66115 res!35849) b!66116))

(declare-fun m!60863 () Bool)

(assert (=> d!13731 m!60863))

(declare-fun m!60865 () Bool)

(assert (=> d!13731 m!60865))

(declare-fun m!60867 () Bool)

(assert (=> d!13731 m!60867))

(declare-fun m!60869 () Bool)

(assert (=> d!13731 m!60869))

(declare-fun m!60871 () Bool)

(assert (=> b!66115 m!60871))

(declare-fun m!60873 () Bool)

(assert (=> b!66116 m!60873))

(assert (=> b!65872 d!13731))

(declare-fun bm!5451 () Bool)

(declare-fun call!5454 () ListLongMap!1397)

(assert (=> bm!5451 (= call!5454 (getCurrentListMapNoExtraKeys!51 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (_values!2124 (v!2470 (underlying!247 thiss!992))) (mask!6073 (v!2470 (underlying!247 thiss!992))) (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) (minValue!2049 (v!2470 (underlying!247 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992)))))))

(declare-fun b!66141 () Bool)

(declare-fun e!43386 () ListLongMap!1397)

(assert (=> b!66141 (= e!43386 call!5454)))

(declare-fun b!66142 () Bool)

(declare-fun e!43381 () ListLongMap!1397)

(assert (=> b!66142 (= e!43381 e!43386)))

(declare-fun c!9101 () Bool)

(assert (=> b!66142 (= c!9101 (validKeyInArray!0 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!66143 () Bool)

(declare-fun res!35859 () Bool)

(declare-fun e!43383 () Bool)

(assert (=> b!66143 (=> (not res!35859) (not e!43383))))

(declare-fun lt!28467 () ListLongMap!1397)

(assert (=> b!66143 (= res!35859 (not (contains!706 lt!28467 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!66144 () Bool)

(declare-fun lt!28468 () Unit!1825)

(declare-fun lt!28469 () Unit!1825)

(assert (=> b!66144 (= lt!28468 lt!28469)))

(declare-fun lt!28473 () ListLongMap!1397)

(declare-fun lt!28470 () (_ BitVec 64))

(declare-fun lt!28471 () V!2907)

(declare-fun lt!28472 () (_ BitVec 64))

(assert (=> b!66144 (not (contains!706 (+!86 lt!28473 (tuple2!2083 lt!28472 lt!28471)) lt!28470))))

(declare-fun addStillNotContains!20 (ListLongMap!1397 (_ BitVec 64) V!2907 (_ BitVec 64)) Unit!1825)

(assert (=> b!66144 (= lt!28469 (addStillNotContains!20 lt!28473 lt!28472 lt!28471 lt!28470))))

(assert (=> b!66144 (= lt!28470 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!66144 (= lt!28471 (get!1110 (select (arr!1830 (_values!2124 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!317 (defaultEntry!2141 (v!2470 (underlying!247 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66144 (= lt!28472 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!66144 (= lt!28473 call!5454)))

(assert (=> b!66144 (= e!43386 (+!86 call!5454 (tuple2!2083 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1110 (select (arr!1830 (_values!2124 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!317 (defaultEntry!2141 (v!2470 (underlying!247 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!66145 () Bool)

(declare-fun e!43385 () Bool)

(declare-fun e!43382 () Bool)

(assert (=> b!66145 (= e!43385 e!43382)))

(assert (=> b!66145 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992))))))))

(declare-fun res!35860 () Bool)

(assert (=> b!66145 (= res!35860 (contains!706 lt!28467 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!66145 (=> (not res!35860) (not e!43382))))

(declare-fun d!13733 () Bool)

(assert (=> d!13733 e!43383))

(declare-fun res!35858 () Bool)

(assert (=> d!13733 (=> (not res!35858) (not e!43383))))

(assert (=> d!13733 (= res!35858 (not (contains!706 lt!28467 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13733 (= lt!28467 e!43381)))

(declare-fun c!9102 () Bool)

(assert (=> d!13733 (= c!9102 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992))))))))

(assert (=> d!13733 (validMask!0 (mask!6073 (v!2470 (underlying!247 thiss!992))))))

(assert (=> d!13733 (= (getCurrentListMapNoExtraKeys!51 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (_values!2124 (v!2470 (underlying!247 thiss!992))) (mask!6073 (v!2470 (underlying!247 thiss!992))) (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) (minValue!2049 (v!2470 (underlying!247 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992)))) lt!28467)))

(declare-fun b!66146 () Bool)

(assert (=> b!66146 (= e!43381 (ListLongMap!1398 Nil!1458))))

(declare-fun b!66147 () Bool)

(declare-fun e!43384 () Bool)

(assert (=> b!66147 (= e!43384 (validKeyInArray!0 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!66147 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!66148 () Bool)

(assert (=> b!66148 (= e!43383 e!43385)))

(declare-fun c!9104 () Bool)

(assert (=> b!66148 (= c!9104 e!43384)))

(declare-fun res!35861 () Bool)

(assert (=> b!66148 (=> (not res!35861) (not e!43384))))

(assert (=> b!66148 (= res!35861 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992))))))))

(declare-fun b!66149 () Bool)

(declare-fun e!43387 () Bool)

(assert (=> b!66149 (= e!43385 e!43387)))

(declare-fun c!9103 () Bool)

(assert (=> b!66149 (= c!9103 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992))))))))

(declare-fun b!66150 () Bool)

(assert (=> b!66150 (= e!43387 (= lt!28467 (getCurrentListMapNoExtraKeys!51 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (_values!2124 (v!2470 (underlying!247 thiss!992))) (mask!6073 (v!2470 (underlying!247 thiss!992))) (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) (minValue!2049 (v!2470 (underlying!247 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992))))))))

(declare-fun b!66151 () Bool)

(declare-fun isEmpty!306 (ListLongMap!1397) Bool)

(assert (=> b!66151 (= e!43387 (isEmpty!306 lt!28467))))

(declare-fun b!66152 () Bool)

(assert (=> b!66152 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992))))))))

(assert (=> b!66152 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2065 (_values!2124 (v!2470 (underlying!247 thiss!992))))))))

(declare-fun apply!71 (ListLongMap!1397 (_ BitVec 64)) V!2907)

(assert (=> b!66152 (= e!43382 (= (apply!71 lt!28467 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1110 (select (arr!1830 (_values!2124 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!317 (defaultEntry!2141 (v!2470 (underlying!247 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!13733 c!9102) b!66146))

(assert (= (and d!13733 (not c!9102)) b!66142))

(assert (= (and b!66142 c!9101) b!66144))

(assert (= (and b!66142 (not c!9101)) b!66141))

(assert (= (or b!66144 b!66141) bm!5451))

(assert (= (and d!13733 res!35858) b!66143))

(assert (= (and b!66143 res!35859) b!66148))

(assert (= (and b!66148 res!35861) b!66147))

(assert (= (and b!66148 c!9104) b!66145))

(assert (= (and b!66148 (not c!9104)) b!66149))

(assert (= (and b!66145 res!35860) b!66152))

(assert (= (and b!66149 c!9103) b!66150))

(assert (= (and b!66149 (not c!9103)) b!66151))

(declare-fun b_lambda!2961 () Bool)

(assert (=> (not b_lambda!2961) (not b!66144)))

(assert (=> b!66144 t!4928))

(declare-fun b_and!4083 () Bool)

(assert (= b_and!4071 (and (=> t!4928 result!2557) b_and!4083)))

(assert (=> b!66144 t!4930))

(declare-fun b_and!4085 () Bool)

(assert (= b_and!4073 (and (=> t!4930 result!2561) b_and!4085)))

(declare-fun b_lambda!2963 () Bool)

(assert (=> (not b_lambda!2963) (not b!66152)))

(assert (=> b!66152 t!4928))

(declare-fun b_and!4087 () Bool)

(assert (= b_and!4083 (and (=> t!4928 result!2557) b_and!4087)))

(assert (=> b!66152 t!4930))

(declare-fun b_and!4089 () Bool)

(assert (= b_and!4085 (and (=> t!4930 result!2561) b_and!4089)))

(declare-fun m!60875 () Bool)

(assert (=> b!66150 m!60875))

(assert (=> bm!5451 m!60875))

(assert (=> b!66152 m!60849))

(declare-fun m!60877 () Bool)

(assert (=> b!66152 m!60877))

(assert (=> b!66152 m!60849))

(declare-fun m!60879 () Bool)

(assert (=> b!66152 m!60879))

(assert (=> b!66152 m!60671))

(declare-fun m!60881 () Bool)

(assert (=> b!66152 m!60881))

(assert (=> b!66152 m!60879))

(assert (=> b!66152 m!60671))

(declare-fun m!60883 () Bool)

(assert (=> b!66151 m!60883))

(assert (=> b!66145 m!60849))

(assert (=> b!66145 m!60849))

(declare-fun m!60885 () Bool)

(assert (=> b!66145 m!60885))

(assert (=> b!66147 m!60849))

(assert (=> b!66147 m!60849))

(declare-fun m!60887 () Bool)

(assert (=> b!66147 m!60887))

(assert (=> b!66142 m!60849))

(assert (=> b!66142 m!60849))

(assert (=> b!66142 m!60887))

(declare-fun m!60889 () Bool)

(assert (=> d!13733 m!60889))

(assert (=> d!13733 m!60713))

(declare-fun m!60891 () Bool)

(assert (=> b!66143 m!60891))

(declare-fun m!60893 () Bool)

(assert (=> b!66144 m!60893))

(declare-fun m!60895 () Bool)

(assert (=> b!66144 m!60895))

(assert (=> b!66144 m!60895))

(declare-fun m!60897 () Bool)

(assert (=> b!66144 m!60897))

(assert (=> b!66144 m!60849))

(assert (=> b!66144 m!60879))

(assert (=> b!66144 m!60671))

(assert (=> b!66144 m!60879))

(assert (=> b!66144 m!60671))

(assert (=> b!66144 m!60881))

(declare-fun m!60899 () Bool)

(assert (=> b!66144 m!60899))

(assert (=> b!65872 d!13733))

(declare-fun d!13735 () Bool)

(declare-fun e!43388 () Bool)

(assert (=> d!13735 e!43388))

(declare-fun res!35862 () Bool)

(assert (=> d!13735 (=> (not res!35862) (not e!43388))))

(declare-fun lt!28477 () ListLongMap!1397)

(assert (=> d!13735 (= res!35862 (contains!706 lt!28477 (_1!1052 lt!28299)))))

(declare-fun lt!28475 () List!1461)

(assert (=> d!13735 (= lt!28477 (ListLongMap!1398 lt!28475))))

(declare-fun lt!28476 () Unit!1825)

(declare-fun lt!28474 () Unit!1825)

(assert (=> d!13735 (= lt!28476 lt!28474)))

(assert (=> d!13735 (= (getValueByKey!129 lt!28475 (_1!1052 lt!28299)) (Some!134 (_2!1052 lt!28299)))))

(assert (=> d!13735 (= lt!28474 (lemmaContainsTupThenGetReturnValue!46 lt!28475 (_1!1052 lt!28299) (_2!1052 lt!28299)))))

(assert (=> d!13735 (= lt!28475 (insertStrictlySorted!49 (toList!714 (+!86 lt!28298 lt!28300)) (_1!1052 lt!28299) (_2!1052 lt!28299)))))

(assert (=> d!13735 (= (+!86 (+!86 lt!28298 lt!28300) lt!28299) lt!28477)))

(declare-fun b!66153 () Bool)

(declare-fun res!35863 () Bool)

(assert (=> b!66153 (=> (not res!35863) (not e!43388))))

(assert (=> b!66153 (= res!35863 (= (getValueByKey!129 (toList!714 lt!28477) (_1!1052 lt!28299)) (Some!134 (_2!1052 lt!28299))))))

(declare-fun b!66154 () Bool)

(assert (=> b!66154 (= e!43388 (contains!709 (toList!714 lt!28477) lt!28299))))

(assert (= (and d!13735 res!35862) b!66153))

(assert (= (and b!66153 res!35863) b!66154))

(declare-fun m!60901 () Bool)

(assert (=> d!13735 m!60901))

(declare-fun m!60903 () Bool)

(assert (=> d!13735 m!60903))

(declare-fun m!60905 () Bool)

(assert (=> d!13735 m!60905))

(declare-fun m!60907 () Bool)

(assert (=> d!13735 m!60907))

(declare-fun m!60909 () Bool)

(assert (=> b!66153 m!60909))

(declare-fun m!60911 () Bool)

(assert (=> b!66154 m!60911))

(assert (=> b!65872 d!13735))

(declare-fun d!13737 () Bool)

(assert (=> d!13737 (= (+!86 (+!86 lt!28298 (tuple2!2083 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) lt!28291)) (tuple2!2083 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2049 (v!2470 (underlying!247 thiss!992))))) (+!86 (+!86 lt!28298 (tuple2!2083 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2049 (v!2470 (underlying!247 thiss!992))))) (tuple2!2083 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) lt!28291)))))

(declare-fun lt!28480 () Unit!1825)

(declare-fun choose!364 (ListLongMap!1397 (_ BitVec 64) V!2907 (_ BitVec 64) V!2907) Unit!1825)

(assert (=> d!13737 (= lt!28480 (choose!364 lt!28298 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) lt!28291 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2049 (v!2470 (underlying!247 thiss!992)))))))

(assert (=> d!13737 (not (= (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13737 (= (addCommutativeForDiffKeys!5 lt!28298 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) from!355) lt!28291 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2049 (v!2470 (underlying!247 thiss!992)))) lt!28480)))

(declare-fun bs!2857 () Bool)

(assert (= bs!2857 d!13737))

(declare-fun m!60913 () Bool)

(assert (=> bs!2857 m!60913))

(declare-fun m!60915 () Bool)

(assert (=> bs!2857 m!60915))

(declare-fun m!60917 () Bool)

(assert (=> bs!2857 m!60917))

(declare-fun m!60919 () Bool)

(assert (=> bs!2857 m!60919))

(assert (=> bs!2857 m!60667))

(declare-fun m!60921 () Bool)

(assert (=> bs!2857 m!60921))

(assert (=> bs!2857 m!60917))

(assert (=> bs!2857 m!60913))

(assert (=> b!65872 d!13737))

(declare-fun d!13739 () Bool)

(declare-fun e!43389 () Bool)

(assert (=> d!13739 e!43389))

(declare-fun res!35864 () Bool)

(assert (=> d!13739 (=> (not res!35864) (not e!43389))))

(declare-fun lt!28484 () ListLongMap!1397)

(assert (=> d!13739 (= res!35864 (contains!706 lt!28484 (_1!1052 lt!28300)))))

(declare-fun lt!28482 () List!1461)

(assert (=> d!13739 (= lt!28484 (ListLongMap!1398 lt!28482))))

(declare-fun lt!28483 () Unit!1825)

(declare-fun lt!28481 () Unit!1825)

(assert (=> d!13739 (= lt!28483 lt!28481)))

(assert (=> d!13739 (= (getValueByKey!129 lt!28482 (_1!1052 lt!28300)) (Some!134 (_2!1052 lt!28300)))))

(assert (=> d!13739 (= lt!28481 (lemmaContainsTupThenGetReturnValue!46 lt!28482 (_1!1052 lt!28300) (_2!1052 lt!28300)))))

(assert (=> d!13739 (= lt!28482 (insertStrictlySorted!49 (toList!714 lt!28298) (_1!1052 lt!28300) (_2!1052 lt!28300)))))

(assert (=> d!13739 (= (+!86 lt!28298 lt!28300) lt!28484)))

(declare-fun b!66155 () Bool)

(declare-fun res!35865 () Bool)

(assert (=> b!66155 (=> (not res!35865) (not e!43389))))

(assert (=> b!66155 (= res!35865 (= (getValueByKey!129 (toList!714 lt!28484) (_1!1052 lt!28300)) (Some!134 (_2!1052 lt!28300))))))

(declare-fun b!66156 () Bool)

(assert (=> b!66156 (= e!43389 (contains!709 (toList!714 lt!28484) lt!28300))))

(assert (= (and d!13739 res!35864) b!66155))

(assert (= (and b!66155 res!35865) b!66156))

(declare-fun m!60923 () Bool)

(assert (=> d!13739 m!60923))

(declare-fun m!60925 () Bool)

(assert (=> d!13739 m!60925))

(declare-fun m!60927 () Bool)

(assert (=> d!13739 m!60927))

(declare-fun m!60929 () Bool)

(assert (=> d!13739 m!60929))

(declare-fun m!60931 () Bool)

(assert (=> b!66155 m!60931))

(declare-fun m!60933 () Bool)

(assert (=> b!66156 m!60933))

(assert (=> b!65872 d!13739))

(declare-fun d!13741 () Bool)

(declare-fun e!43390 () Bool)

(assert (=> d!13741 e!43390))

(declare-fun res!35866 () Bool)

(assert (=> d!13741 (=> (not res!35866) (not e!43390))))

(declare-fun lt!28488 () ListLongMap!1397)

(assert (=> d!13741 (= res!35866 (contains!706 lt!28488 (_1!1052 lt!28300)))))

(declare-fun lt!28486 () List!1461)

(assert (=> d!13741 (= lt!28488 (ListLongMap!1398 lt!28486))))

(declare-fun lt!28487 () Unit!1825)

(declare-fun lt!28485 () Unit!1825)

(assert (=> d!13741 (= lt!28487 lt!28485)))

(assert (=> d!13741 (= (getValueByKey!129 lt!28486 (_1!1052 lt!28300)) (Some!134 (_2!1052 lt!28300)))))

(assert (=> d!13741 (= lt!28485 (lemmaContainsTupThenGetReturnValue!46 lt!28486 (_1!1052 lt!28300) (_2!1052 lt!28300)))))

(assert (=> d!13741 (= lt!28486 (insertStrictlySorted!49 (toList!714 (+!86 lt!28298 lt!28299)) (_1!1052 lt!28300) (_2!1052 lt!28300)))))

(assert (=> d!13741 (= (+!86 (+!86 lt!28298 lt!28299) lt!28300) lt!28488)))

(declare-fun b!66157 () Bool)

(declare-fun res!35867 () Bool)

(assert (=> b!66157 (=> (not res!35867) (not e!43390))))

(assert (=> b!66157 (= res!35867 (= (getValueByKey!129 (toList!714 lt!28488) (_1!1052 lt!28300)) (Some!134 (_2!1052 lt!28300))))))

(declare-fun b!66158 () Bool)

(assert (=> b!66158 (= e!43390 (contains!709 (toList!714 lt!28488) lt!28300))))

(assert (= (and d!13741 res!35866) b!66157))

(assert (= (and b!66157 res!35867) b!66158))

(declare-fun m!60935 () Bool)

(assert (=> d!13741 m!60935))

(declare-fun m!60937 () Bool)

(assert (=> d!13741 m!60937))

(declare-fun m!60939 () Bool)

(assert (=> d!13741 m!60939))

(declare-fun m!60941 () Bool)

(assert (=> d!13741 m!60941))

(declare-fun m!60943 () Bool)

(assert (=> b!66157 m!60943))

(declare-fun m!60945 () Bool)

(assert (=> b!66158 m!60945))

(assert (=> b!65872 d!13741))

(declare-fun d!13743 () Bool)

(assert (=> d!13743 (= (validMask!0 (mask!6073 (v!2470 (underlying!247 thiss!992)))) (and (or (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000000111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000001111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000011111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000001111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000011111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000001111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000011111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000000001111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000000011111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000000111111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000001111111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000011111111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000000111111111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000001111111111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000011111111111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000000111111111111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000001111111111111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000011111111111111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000000111111111111111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000001111111111111111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000011111111111111111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00000111111111111111111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00001111111111111111111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00011111111111111111111111111111) (= (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6073 (v!2470 (underlying!247 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!65872 d!13743))

(declare-fun d!13745 () Bool)

(declare-fun res!35874 () Bool)

(declare-fun e!43393 () Bool)

(assert (=> d!13745 (=> (not res!35874) (not e!43393))))

(declare-fun simpleValid!47 (LongMapFixedSize!666) Bool)

(assert (=> d!13745 (= res!35874 (simpleValid!47 newMap!16))))

(assert (=> d!13745 (= (valid!276 newMap!16) e!43393)))

(declare-fun b!66165 () Bool)

(declare-fun res!35875 () Bool)

(assert (=> b!66165 (=> (not res!35875) (not e!43393))))

(declare-fun arrayCountValidKeys!0 (array!3827 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!66165 (= res!35875 (= (arrayCountValidKeys!0 (_keys!3781 newMap!16) #b00000000000000000000000000000000 (size!2064 (_keys!3781 newMap!16))) (_size!382 newMap!16)))))

(declare-fun b!66166 () Bool)

(declare-fun res!35876 () Bool)

(assert (=> b!66166 (=> (not res!35876) (not e!43393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3827 (_ BitVec 32)) Bool)

(assert (=> b!66166 (= res!35876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3781 newMap!16) (mask!6073 newMap!16)))))

(declare-fun b!66167 () Bool)

(assert (=> b!66167 (= e!43393 (arrayNoDuplicates!0 (_keys!3781 newMap!16) #b00000000000000000000000000000000 Nil!1459))))

(assert (= (and d!13745 res!35874) b!66165))

(assert (= (and b!66165 res!35875) b!66166))

(assert (= (and b!66166 res!35876) b!66167))

(declare-fun m!60947 () Bool)

(assert (=> d!13745 m!60947))

(declare-fun m!60949 () Bool)

(assert (=> b!66165 m!60949))

(declare-fun m!60951 () Bool)

(assert (=> b!66166 m!60951))

(declare-fun m!60953 () Bool)

(assert (=> b!66167 m!60953))

(assert (=> b!65886 d!13745))

(declare-fun d!13747 () Bool)

(assert (=> d!13747 (= (map!1132 newMap!16) (getCurrentListMap!413 (_keys!3781 newMap!16) (_values!2124 newMap!16) (mask!6073 newMap!16) (extraKeys!2012 newMap!16) (zeroValue!2049 newMap!16) (minValue!2049 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2141 newMap!16)))))

(declare-fun bs!2858 () Bool)

(assert (= bs!2858 d!13747))

(assert (=> bs!2858 m!60839))

(assert (=> b!65877 d!13747))

(declare-fun b!66210 () Bool)

(declare-fun e!43420 () Bool)

(assert (=> b!66210 (= e!43420 (validKeyInArray!0 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!66211 () Bool)

(declare-fun e!43427 () Bool)

(declare-fun e!43425 () Bool)

(assert (=> b!66211 (= e!43427 e!43425)))

(declare-fun c!9120 () Bool)

(assert (=> b!66211 (= c!9120 (not (= (bvand (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!5466 () Bool)

(declare-fun call!5473 () Bool)

(declare-fun lt!28538 () ListLongMap!1397)

(assert (=> bm!5466 (= call!5473 (contains!706 lt!28538 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!5469 () ListLongMap!1397)

(declare-fun c!9119 () Bool)

(declare-fun call!5475 () ListLongMap!1397)

(declare-fun c!9118 () Bool)

(declare-fun call!5471 () ListLongMap!1397)

(declare-fun bm!5467 () Bool)

(declare-fun call!5474 () ListLongMap!1397)

(assert (=> bm!5467 (= call!5474 (+!86 (ite c!9119 call!5471 (ite c!9118 call!5475 call!5469)) (ite (or c!9119 c!9118) (tuple2!2083 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2049 (v!2470 (underlying!247 thiss!992)))) (tuple2!2083 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2049 (v!2470 (underlying!247 thiss!992)))))))))

(declare-fun d!13749 () Bool)

(assert (=> d!13749 e!43427))

(declare-fun res!35897 () Bool)

(assert (=> d!13749 (=> (not res!35897) (not e!43427))))

(assert (=> d!13749 (= res!35897 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992))))))))))

(declare-fun lt!28545 () ListLongMap!1397)

(assert (=> d!13749 (= lt!28538 lt!28545)))

(declare-fun lt!28550 () Unit!1825)

(declare-fun e!43428 () Unit!1825)

(assert (=> d!13749 (= lt!28550 e!43428)))

(declare-fun c!9121 () Bool)

(assert (=> d!13749 (= c!9121 e!43420)))

(declare-fun res!35903 () Bool)

(assert (=> d!13749 (=> (not res!35903) (not e!43420))))

(assert (=> d!13749 (= res!35903 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992))))))))

(declare-fun e!43421 () ListLongMap!1397)

(assert (=> d!13749 (= lt!28545 e!43421)))

(assert (=> d!13749 (= c!9119 (and (not (= (bvand (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13749 (validMask!0 (mask!6073 (v!2470 (underlying!247 thiss!992))))))

(assert (=> d!13749 (= (getCurrentListMap!413 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (_values!2124 (v!2470 (underlying!247 thiss!992))) (mask!6073 (v!2470 (underlying!247 thiss!992))) (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) (minValue!2049 (v!2470 (underlying!247 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992)))) lt!28538)))

(declare-fun b!66212 () Bool)

(declare-fun e!43423 () Bool)

(declare-fun e!43426 () Bool)

(assert (=> b!66212 (= e!43423 e!43426)))

(declare-fun res!35902 () Bool)

(assert (=> b!66212 (=> (not res!35902) (not e!43426))))

(assert (=> b!66212 (= res!35902 (contains!706 lt!28538 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!66212 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992))))))))

(declare-fun b!66213 () Bool)

(assert (=> b!66213 (= e!43421 (+!86 call!5474 (tuple2!2083 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2049 (v!2470 (underlying!247 thiss!992))))))))

(declare-fun b!66214 () Bool)

(assert (=> b!66214 (= e!43426 (= (apply!71 lt!28538 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1110 (select (arr!1830 (_values!2124 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!317 (defaultEntry!2141 (v!2470 (underlying!247 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!66214 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2065 (_values!2124 (v!2470 (underlying!247 thiss!992))))))))

(assert (=> b!66214 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992))))))))

(declare-fun b!66215 () Bool)

(declare-fun e!43431 () Bool)

(declare-fun e!43429 () Bool)

(assert (=> b!66215 (= e!43431 e!43429)))

(declare-fun res!35900 () Bool)

(declare-fun call!5470 () Bool)

(assert (=> b!66215 (= res!35900 call!5470)))

(assert (=> b!66215 (=> (not res!35900) (not e!43429))))

(declare-fun b!66216 () Bool)

(assert (=> b!66216 (= e!43425 (not call!5473))))

(declare-fun bm!5468 () Bool)

(assert (=> bm!5468 (= call!5470 (contains!706 lt!28538 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5469 () Bool)

(assert (=> bm!5469 (= call!5475 call!5471)))

(declare-fun b!66217 () Bool)

(declare-fun res!35901 () Bool)

(assert (=> b!66217 (=> (not res!35901) (not e!43427))))

(assert (=> b!66217 (= res!35901 e!43431)))

(declare-fun c!9117 () Bool)

(assert (=> b!66217 (= c!9117 (not (= (bvand (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!66218 () Bool)

(declare-fun e!43424 () ListLongMap!1397)

(declare-fun call!5472 () ListLongMap!1397)

(assert (=> b!66218 (= e!43424 call!5472)))

(declare-fun b!66219 () Bool)

(declare-fun e!43422 () ListLongMap!1397)

(assert (=> b!66219 (= e!43422 call!5469)))

(declare-fun b!66220 () Bool)

(assert (=> b!66220 (= e!43431 (not call!5470))))

(declare-fun b!66221 () Bool)

(declare-fun lt!28548 () Unit!1825)

(assert (=> b!66221 (= e!43428 lt!28548)))

(declare-fun lt!28552 () ListLongMap!1397)

(assert (=> b!66221 (= lt!28552 (getCurrentListMapNoExtraKeys!51 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (_values!2124 (v!2470 (underlying!247 thiss!992))) (mask!6073 (v!2470 (underlying!247 thiss!992))) (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) (minValue!2049 (v!2470 (underlying!247 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992)))))))

(declare-fun lt!28554 () (_ BitVec 64))

(assert (=> b!66221 (= lt!28554 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28547 () (_ BitVec 64))

(assert (=> b!66221 (= lt!28547 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!28539 () Unit!1825)

(declare-fun addStillContains!47 (ListLongMap!1397 (_ BitVec 64) V!2907 (_ BitVec 64)) Unit!1825)

(assert (=> b!66221 (= lt!28539 (addStillContains!47 lt!28552 lt!28554 (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) lt!28547))))

(assert (=> b!66221 (contains!706 (+!86 lt!28552 (tuple2!2083 lt!28554 (zeroValue!2049 (v!2470 (underlying!247 thiss!992))))) lt!28547)))

(declare-fun lt!28535 () Unit!1825)

(assert (=> b!66221 (= lt!28535 lt!28539)))

(declare-fun lt!28533 () ListLongMap!1397)

(assert (=> b!66221 (= lt!28533 (getCurrentListMapNoExtraKeys!51 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (_values!2124 (v!2470 (underlying!247 thiss!992))) (mask!6073 (v!2470 (underlying!247 thiss!992))) (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) (minValue!2049 (v!2470 (underlying!247 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992)))))))

(declare-fun lt!28542 () (_ BitVec 64))

(assert (=> b!66221 (= lt!28542 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28544 () (_ BitVec 64))

(assert (=> b!66221 (= lt!28544 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!28543 () Unit!1825)

(declare-fun addApplyDifferent!47 (ListLongMap!1397 (_ BitVec 64) V!2907 (_ BitVec 64)) Unit!1825)

(assert (=> b!66221 (= lt!28543 (addApplyDifferent!47 lt!28533 lt!28542 (minValue!2049 (v!2470 (underlying!247 thiss!992))) lt!28544))))

(assert (=> b!66221 (= (apply!71 (+!86 lt!28533 (tuple2!2083 lt!28542 (minValue!2049 (v!2470 (underlying!247 thiss!992))))) lt!28544) (apply!71 lt!28533 lt!28544))))

(declare-fun lt!28541 () Unit!1825)

(assert (=> b!66221 (= lt!28541 lt!28543)))

(declare-fun lt!28549 () ListLongMap!1397)

(assert (=> b!66221 (= lt!28549 (getCurrentListMapNoExtraKeys!51 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (_values!2124 (v!2470 (underlying!247 thiss!992))) (mask!6073 (v!2470 (underlying!247 thiss!992))) (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) (minValue!2049 (v!2470 (underlying!247 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992)))))))

(declare-fun lt!28546 () (_ BitVec 64))

(assert (=> b!66221 (= lt!28546 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28536 () (_ BitVec 64))

(assert (=> b!66221 (= lt!28536 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!28537 () Unit!1825)

(assert (=> b!66221 (= lt!28537 (addApplyDifferent!47 lt!28549 lt!28546 (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) lt!28536))))

(assert (=> b!66221 (= (apply!71 (+!86 lt!28549 (tuple2!2083 lt!28546 (zeroValue!2049 (v!2470 (underlying!247 thiss!992))))) lt!28536) (apply!71 lt!28549 lt!28536))))

(declare-fun lt!28553 () Unit!1825)

(assert (=> b!66221 (= lt!28553 lt!28537)))

(declare-fun lt!28551 () ListLongMap!1397)

(assert (=> b!66221 (= lt!28551 (getCurrentListMapNoExtraKeys!51 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (_values!2124 (v!2470 (underlying!247 thiss!992))) (mask!6073 (v!2470 (underlying!247 thiss!992))) (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) (minValue!2049 (v!2470 (underlying!247 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992)))))))

(declare-fun lt!28540 () (_ BitVec 64))

(assert (=> b!66221 (= lt!28540 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28534 () (_ BitVec 64))

(assert (=> b!66221 (= lt!28534 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!66221 (= lt!28548 (addApplyDifferent!47 lt!28551 lt!28540 (minValue!2049 (v!2470 (underlying!247 thiss!992))) lt!28534))))

(assert (=> b!66221 (= (apply!71 (+!86 lt!28551 (tuple2!2083 lt!28540 (minValue!2049 (v!2470 (underlying!247 thiss!992))))) lt!28534) (apply!71 lt!28551 lt!28534))))

(declare-fun bm!5470 () Bool)

(assert (=> bm!5470 (= call!5472 call!5474)))

(declare-fun b!66222 () Bool)

(declare-fun res!35895 () Bool)

(assert (=> b!66222 (=> (not res!35895) (not e!43427))))

(assert (=> b!66222 (= res!35895 e!43423)))

(declare-fun res!35898 () Bool)

(assert (=> b!66222 (=> res!35898 e!43423)))

(declare-fun e!43432 () Bool)

(assert (=> b!66222 (= res!35898 (not e!43432))))

(declare-fun res!35896 () Bool)

(assert (=> b!66222 (=> (not res!35896) (not e!43432))))

(assert (=> b!66222 (= res!35896 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992))))))))

(declare-fun b!66223 () Bool)

(assert (=> b!66223 (= e!43429 (= (apply!71 lt!28538 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2049 (v!2470 (underlying!247 thiss!992)))))))

(declare-fun bm!5471 () Bool)

(assert (=> bm!5471 (= call!5469 call!5475)))

(declare-fun b!66224 () Bool)

(declare-fun e!43430 () Bool)

(assert (=> b!66224 (= e!43425 e!43430)))

(declare-fun res!35899 () Bool)

(assert (=> b!66224 (= res!35899 call!5473)))

(assert (=> b!66224 (=> (not res!35899) (not e!43430))))

(declare-fun b!66225 () Bool)

(assert (=> b!66225 (= e!43430 (= (apply!71 lt!28538 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2049 (v!2470 (underlying!247 thiss!992)))))))

(declare-fun b!66226 () Bool)

(assert (=> b!66226 (= e!43432 (validKeyInArray!0 (select (arr!1829 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!5472 () Bool)

(assert (=> bm!5472 (= call!5471 (getCurrentListMapNoExtraKeys!51 (_keys!3781 (v!2470 (underlying!247 thiss!992))) (_values!2124 (v!2470 (underlying!247 thiss!992))) (mask!6073 (v!2470 (underlying!247 thiss!992))) (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) (zeroValue!2049 (v!2470 (underlying!247 thiss!992))) (minValue!2049 (v!2470 (underlying!247 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992)))))))

(declare-fun b!66227 () Bool)

(declare-fun Unit!1835 () Unit!1825)

(assert (=> b!66227 (= e!43428 Unit!1835)))

(declare-fun b!66228 () Bool)

(assert (=> b!66228 (= e!43421 e!43424)))

(assert (=> b!66228 (= c!9118 (and (not (= (bvand (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!66229 () Bool)

(assert (=> b!66229 (= e!43422 call!5472)))

(declare-fun b!66230 () Bool)

(declare-fun c!9122 () Bool)

(assert (=> b!66230 (= c!9122 (and (not (= (bvand (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2012 (v!2470 (underlying!247 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!66230 (= e!43424 e!43422)))

(assert (= (and d!13749 c!9119) b!66213))

(assert (= (and d!13749 (not c!9119)) b!66228))

(assert (= (and b!66228 c!9118) b!66218))

(assert (= (and b!66228 (not c!9118)) b!66230))

(assert (= (and b!66230 c!9122) b!66229))

(assert (= (and b!66230 (not c!9122)) b!66219))

(assert (= (or b!66229 b!66219) bm!5471))

(assert (= (or b!66218 bm!5471) bm!5469))

(assert (= (or b!66218 b!66229) bm!5470))

(assert (= (or b!66213 bm!5469) bm!5472))

(assert (= (or b!66213 bm!5470) bm!5467))

(assert (= (and d!13749 res!35903) b!66210))

(assert (= (and d!13749 c!9121) b!66221))

(assert (= (and d!13749 (not c!9121)) b!66227))

(assert (= (and d!13749 res!35897) b!66222))

(assert (= (and b!66222 res!35896) b!66226))

(assert (= (and b!66222 (not res!35898)) b!66212))

(assert (= (and b!66212 res!35902) b!66214))

(assert (= (and b!66222 res!35895) b!66217))

(assert (= (and b!66217 c!9117) b!66215))

(assert (= (and b!66217 (not c!9117)) b!66220))

(assert (= (and b!66215 res!35900) b!66223))

(assert (= (or b!66215 b!66220) bm!5468))

(assert (= (and b!66217 res!35901) b!66211))

(assert (= (and b!66211 c!9120) b!66224))

(assert (= (and b!66211 (not c!9120)) b!66216))

(assert (= (and b!66224 res!35899) b!66225))

(assert (= (or b!66224 b!66216) bm!5466))

(declare-fun b_lambda!2965 () Bool)

(assert (=> (not b_lambda!2965) (not b!66214)))

(assert (=> b!66214 t!4928))

(declare-fun b_and!4091 () Bool)

(assert (= b_and!4087 (and (=> t!4928 result!2557) b_and!4091)))

(assert (=> b!66214 t!4930))

(declare-fun b_and!4093 () Bool)

(assert (= b_and!4089 (and (=> t!4930 result!2561) b_and!4093)))

(declare-fun m!60955 () Bool)

(assert (=> b!66223 m!60955))

(assert (=> b!66210 m!60849))

(assert (=> b!66210 m!60849))

(assert (=> b!66210 m!60887))

(declare-fun m!60957 () Bool)

(assert (=> b!66221 m!60957))

(declare-fun m!60959 () Bool)

(assert (=> b!66221 m!60959))

(declare-fun m!60961 () Bool)

(assert (=> b!66221 m!60961))

(declare-fun m!60963 () Bool)

(assert (=> b!66221 m!60963))

(assert (=> b!66221 m!60957))

(declare-fun m!60965 () Bool)

(assert (=> b!66221 m!60965))

(declare-fun m!60967 () Bool)

(assert (=> b!66221 m!60967))

(declare-fun m!60969 () Bool)

(assert (=> b!66221 m!60969))

(declare-fun m!60971 () Bool)

(assert (=> b!66221 m!60971))

(declare-fun m!60973 () Bool)

(assert (=> b!66221 m!60973))

(declare-fun m!60975 () Bool)

(assert (=> b!66221 m!60975))

(assert (=> b!66221 m!60973))

(declare-fun m!60977 () Bool)

(assert (=> b!66221 m!60977))

(assert (=> b!66221 m!60961))

(declare-fun m!60979 () Bool)

(assert (=> b!66221 m!60979))

(declare-fun m!60981 () Bool)

(assert (=> b!66221 m!60981))

(assert (=> b!66221 m!60849))

(declare-fun m!60983 () Bool)

(assert (=> b!66221 m!60983))

(declare-fun m!60985 () Bool)

(assert (=> b!66221 m!60985))

(assert (=> b!66221 m!60965))

(assert (=> b!66221 m!60719))

(declare-fun m!60987 () Bool)

(assert (=> bm!5466 m!60987))

(declare-fun m!60989 () Bool)

(assert (=> b!66225 m!60989))

(assert (=> bm!5472 m!60719))

(declare-fun m!60991 () Bool)

(assert (=> bm!5467 m!60991))

(assert (=> b!66212 m!60849))

(assert (=> b!66212 m!60849))

(declare-fun m!60993 () Bool)

(assert (=> b!66212 m!60993))

(declare-fun m!60995 () Bool)

(assert (=> b!66213 m!60995))

(declare-fun m!60997 () Bool)

(assert (=> bm!5468 m!60997))

(assert (=> b!66214 m!60849))

(declare-fun m!60999 () Bool)

(assert (=> b!66214 m!60999))

(assert (=> b!66214 m!60671))

(assert (=> b!66214 m!60879))

(assert (=> b!66214 m!60671))

(assert (=> b!66214 m!60881))

(assert (=> b!66214 m!60849))

(assert (=> b!66214 m!60879))

(assert (=> d!13749 m!60713))

(assert (=> b!66226 m!60849))

(assert (=> b!66226 m!60849))

(assert (=> b!66226 m!60887))

(assert (=> b!65877 d!13749))

(declare-fun d!13751 () Bool)

(assert (=> d!13751 (= (array_inv!1125 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) (bvsge (size!2064 (_keys!3781 (v!2470 (underlying!247 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!65876 d!13751))

(declare-fun d!13753 () Bool)

(assert (=> d!13753 (= (array_inv!1126 (_values!2124 (v!2470 (underlying!247 thiss!992)))) (bvsge (size!2065 (_values!2124 (v!2470 (underlying!247 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!65876 d!13753))

(declare-fun d!13755 () Bool)

(declare-fun c!9125 () Bool)

(assert (=> d!13755 (= c!9125 ((_ is ValueCellFull!879) (select (arr!1830 (_values!2124 (v!2470 (underlying!247 thiss!992)))) from!355)))))

(declare-fun e!43435 () V!2907)

(assert (=> d!13755 (= (get!1110 (select (arr!1830 (_values!2124 (v!2470 (underlying!247 thiss!992)))) from!355) (dynLambda!317 (defaultEntry!2141 (v!2470 (underlying!247 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!43435)))

(declare-fun b!66235 () Bool)

(declare-fun get!1111 (ValueCell!879 V!2907) V!2907)

(assert (=> b!66235 (= e!43435 (get!1111 (select (arr!1830 (_values!2124 (v!2470 (underlying!247 thiss!992)))) from!355) (dynLambda!317 (defaultEntry!2141 (v!2470 (underlying!247 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!66236 () Bool)

(declare-fun get!1112 (ValueCell!879 V!2907) V!2907)

(assert (=> b!66236 (= e!43435 (get!1112 (select (arr!1830 (_values!2124 (v!2470 (underlying!247 thiss!992)))) from!355) (dynLambda!317 (defaultEntry!2141 (v!2470 (underlying!247 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13755 c!9125) b!66235))

(assert (= (and d!13755 (not c!9125)) b!66236))

(assert (=> b!66235 m!60669))

(assert (=> b!66235 m!60671))

(declare-fun m!61001 () Bool)

(assert (=> b!66235 m!61001))

(assert (=> b!66236 m!60669))

(assert (=> b!66236 m!60671))

(declare-fun m!61003 () Bool)

(assert (=> b!66236 m!61003))

(assert (=> b!65871 d!13755))

(declare-fun b!66244 () Bool)

(declare-fun e!43441 () Bool)

(assert (=> b!66244 (= e!43441 tp_is_empty!2445)))

(declare-fun mapIsEmpty!3063 () Bool)

(declare-fun mapRes!3063 () Bool)

(assert (=> mapIsEmpty!3063 mapRes!3063))

(declare-fun mapNonEmpty!3063 () Bool)

(declare-fun tp!8337 () Bool)

(declare-fun e!43440 () Bool)

(assert (=> mapNonEmpty!3063 (= mapRes!3063 (and tp!8337 e!43440))))

(declare-fun mapValue!3063 () ValueCell!879)

(declare-fun mapRest!3063 () (Array (_ BitVec 32) ValueCell!879))

(declare-fun mapKey!3063 () (_ BitVec 32))

(assert (=> mapNonEmpty!3063 (= mapRest!3053 (store mapRest!3063 mapKey!3063 mapValue!3063))))

(declare-fun condMapEmpty!3063 () Bool)

(declare-fun mapDefault!3063 () ValueCell!879)

(assert (=> mapNonEmpty!3053 (= condMapEmpty!3063 (= mapRest!3053 ((as const (Array (_ BitVec 32) ValueCell!879)) mapDefault!3063)))))

(assert (=> mapNonEmpty!3053 (= tp!8321 (and e!43441 mapRes!3063))))

(declare-fun b!66243 () Bool)

(assert (=> b!66243 (= e!43440 tp_is_empty!2445)))

(assert (= (and mapNonEmpty!3053 condMapEmpty!3063) mapIsEmpty!3063))

(assert (= (and mapNonEmpty!3053 (not condMapEmpty!3063)) mapNonEmpty!3063))

(assert (= (and mapNonEmpty!3063 ((_ is ValueCellFull!879) mapValue!3063)) b!66243))

(assert (= (and mapNonEmpty!3053 ((_ is ValueCellFull!879) mapDefault!3063)) b!66244))

(declare-fun m!61005 () Bool)

(assert (=> mapNonEmpty!3063 m!61005))

(declare-fun b!66246 () Bool)

(declare-fun e!43443 () Bool)

(assert (=> b!66246 (= e!43443 tp_is_empty!2445)))

(declare-fun mapIsEmpty!3064 () Bool)

(declare-fun mapRes!3064 () Bool)

(assert (=> mapIsEmpty!3064 mapRes!3064))

(declare-fun mapNonEmpty!3064 () Bool)

(declare-fun tp!8338 () Bool)

(declare-fun e!43442 () Bool)

(assert (=> mapNonEmpty!3064 (= mapRes!3064 (and tp!8338 e!43442))))

(declare-fun mapValue!3064 () ValueCell!879)

(declare-fun mapRest!3064 () (Array (_ BitVec 32) ValueCell!879))

(declare-fun mapKey!3064 () (_ BitVec 32))

(assert (=> mapNonEmpty!3064 (= mapRest!3054 (store mapRest!3064 mapKey!3064 mapValue!3064))))

(declare-fun condMapEmpty!3064 () Bool)

(declare-fun mapDefault!3064 () ValueCell!879)

(assert (=> mapNonEmpty!3054 (= condMapEmpty!3064 (= mapRest!3054 ((as const (Array (_ BitVec 32) ValueCell!879)) mapDefault!3064)))))

(assert (=> mapNonEmpty!3054 (= tp!8320 (and e!43443 mapRes!3064))))

(declare-fun b!66245 () Bool)

(assert (=> b!66245 (= e!43442 tp_is_empty!2445)))

(assert (= (and mapNonEmpty!3054 condMapEmpty!3064) mapIsEmpty!3064))

(assert (= (and mapNonEmpty!3054 (not condMapEmpty!3064)) mapNonEmpty!3064))

(assert (= (and mapNonEmpty!3064 ((_ is ValueCellFull!879) mapValue!3064)) b!66245))

(assert (= (and mapNonEmpty!3054 ((_ is ValueCellFull!879) mapDefault!3064)) b!66246))

(declare-fun m!61007 () Bool)

(assert (=> mapNonEmpty!3064 m!61007))

(declare-fun b_lambda!2967 () Bool)

(assert (= b_lambda!2961 (or (and b!65876 b_free!2057) (and b!65874 b_free!2059 (= (defaultEntry!2141 newMap!16) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992))))) b_lambda!2967)))

(declare-fun b_lambda!2969 () Bool)

(assert (= b_lambda!2963 (or (and b!65876 b_free!2057) (and b!65874 b_free!2059 (= (defaultEntry!2141 newMap!16) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992))))) b_lambda!2969)))

(declare-fun b_lambda!2971 () Bool)

(assert (= b_lambda!2965 (or (and b!65876 b_free!2057) (and b!65874 b_free!2059 (= (defaultEntry!2141 newMap!16) (defaultEntry!2141 (v!2470 (underlying!247 thiss!992))))) b_lambda!2971)))

(check-sat (not b!66069) (not d!13737) (not bm!5423) (not b!66115) (not b!66110) (not d!13745) (not b!66143) (not b!65957) (not b!66145) (not mapNonEmpty!3064) (not bm!5432) (not b!66151) (not b!66059) (not b!66226) (not b!66089) (not bm!5436) (not d!13739) (not mapNonEmpty!3063) (not b!66107) (not bm!5468) (not b_lambda!2971) (not d!13719) (not b!66081) (not b!66094) (not b!66074) (not b!66155) (not bm!5467) (not d!13735) (not b!66235) b_and!4093 (not d!13731) (not d!13721) b_and!4091 (not b!66154) (not b_lambda!2967) (not bm!5445) (not b!66223) (not d!13733) (not b!66071) (not b!66221) (not b!66152) (not b!65955) (not b!66144) (not b!66158) (not bm!5472) (not b!66062) (not b!66147) (not b!66236) (not b_next!2059) (not d!13747) (not bm!5466) (not bm!5444) (not b!66166) (not d!13729) (not bm!5434) (not d!13715) (not b!66116) (not b_lambda!2959) (not b!66213) (not b!66156) (not b!66212) (not bm!5430) (not bm!5422) (not bm!5429) (not bm!5425) (not b!66210) (not b!66057) (not bm!5431) (not d!13749) (not bm!5440) (not b!66150) (not b_next!2057) (not b!66165) (not d!13741) (not b!66153) (not b!66157) (not bm!5451) (not b_lambda!2969) (not b!66167) (not b!66109) (not d!13717) (not b!66075) (not b!66214) tp_is_empty!2445 (not b!66225) (not b!66142) (not bm!5448) (not d!13725))
(check-sat b_and!4091 b_and!4093 (not b_next!2057) (not b_next!2059))
