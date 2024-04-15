; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9918 () Bool)

(assert start!9918)

(declare-fun b!74797 () Bool)

(declare-fun b_free!2125 () Bool)

(declare-fun b_next!2125 () Bool)

(assert (=> b!74797 (= b_free!2125 (not b_next!2125))))

(declare-fun tp!8561 () Bool)

(declare-fun b_and!4565 () Bool)

(assert (=> b!74797 (= tp!8561 b_and!4565)))

(declare-fun b!74781 () Bool)

(declare-fun b_free!2127 () Bool)

(declare-fun b_next!2127 () Bool)

(assert (=> b!74781 (= b_free!2127 (not b_next!2127))))

(declare-fun tp!8562 () Bool)

(declare-fun b_and!4567 () Bool)

(assert (=> b!74781 (= tp!8562 b_and!4567)))

(declare-fun b!74780 () Bool)

(declare-fun res!39511 () Bool)

(declare-fun e!48878 () Bool)

(assert (=> b!74780 (=> (not res!39511) (not e!48878))))

(declare-datatypes ((V!2953 0))(
  ( (V!2954 (val!1284 Int)) )
))
(declare-datatypes ((array!3885 0))(
  ( (array!3886 (arr!1852 (Array (_ BitVec 32) (_ BitVec 64))) (size!2092 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!896 0))(
  ( (ValueCellFull!896 (v!2538 V!2953)) (EmptyCell!896) )
))
(declare-datatypes ((array!3887 0))(
  ( (array!3888 (arr!1853 (Array (_ BitVec 32) ValueCell!896)) (size!2093 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!700 0))(
  ( (LongMapFixedSize!701 (defaultEntry!2233 Int) (mask!6209 (_ BitVec 32)) (extraKeys!2088 (_ BitVec 32)) (zeroValue!2133 V!2953) (minValue!2133 V!2953) (_size!399 (_ BitVec 32)) (_keys!3888 array!3885) (_values!2216 array!3887) (_vacant!399 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!700)

(declare-fun valid!303 (LongMapFixedSize!700) Bool)

(assert (=> b!74780 (= res!39511 (valid!303 newMap!16))))

(declare-fun e!48870 () Bool)

(declare-fun tp_is_empty!2479 () Bool)

(declare-fun e!48865 () Bool)

(declare-fun array_inv!1159 (array!3885) Bool)

(declare-fun array_inv!1160 (array!3887) Bool)

(assert (=> b!74781 (= e!48870 (and tp!8562 tp_is_empty!2479 (array_inv!1159 (_keys!3888 newMap!16)) (array_inv!1160 (_values!2216 newMap!16)) e!48865))))

(declare-fun b!74782 () Bool)

(declare-fun e!48869 () Bool)

(assert (=> b!74782 (= e!48878 e!48869)))

(declare-fun res!39506 () Bool)

(assert (=> b!74782 (=> (not res!39506) (not e!48869))))

(declare-datatypes ((tuple2!2130 0))(
  ( (tuple2!2131 (_1!1076 (_ BitVec 64)) (_2!1076 V!2953)) )
))
(declare-datatypes ((List!1488 0))(
  ( (Nil!1485) (Cons!1484 (h!2072 tuple2!2130) (t!5057 List!1488)) )
))
(declare-datatypes ((ListLongMap!1409 0))(
  ( (ListLongMap!1410 (toList!720 List!1488)) )
))
(declare-fun lt!33647 () ListLongMap!1409)

(declare-fun lt!33652 () ListLongMap!1409)

(assert (=> b!74782 (= res!39506 (= lt!33647 lt!33652))))

(declare-fun map!1155 (LongMapFixedSize!700) ListLongMap!1409)

(assert (=> b!74782 (= lt!33652 (map!1155 newMap!16))))

(declare-datatypes ((Cell!496 0))(
  ( (Cell!497 (v!2539 LongMapFixedSize!700)) )
))
(declare-datatypes ((LongMap!496 0))(
  ( (LongMap!497 (underlying!259 Cell!496)) )
))
(declare-fun thiss!992 () LongMap!496)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!413 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) Int) ListLongMap!1409)

(assert (=> b!74782 (= lt!33647 (getCurrentListMap!413 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun b!74783 () Bool)

(declare-fun e!48873 () Bool)

(declare-fun e!48877 () Bool)

(assert (=> b!74783 (= e!48873 e!48877)))

(declare-fun res!39512 () Bool)

(assert (=> start!9918 (=> (not res!39512) (not e!48878))))

(declare-fun valid!304 (LongMap!496) Bool)

(assert (=> start!9918 (= res!39512 (valid!304 thiss!992))))

(assert (=> start!9918 e!48878))

(assert (=> start!9918 e!48873))

(assert (=> start!9918 true))

(assert (=> start!9918 e!48870))

(declare-fun mapNonEmpty!3191 () Bool)

(declare-fun mapRes!3191 () Bool)

(declare-fun tp!8560 () Bool)

(declare-fun e!48868 () Bool)

(assert (=> mapNonEmpty!3191 (= mapRes!3191 (and tp!8560 e!48868))))

(declare-fun mapValue!3191 () ValueCell!896)

(declare-fun mapRest!3192 () (Array (_ BitVec 32) ValueCell!896))

(declare-fun mapKey!3191 () (_ BitVec 32))

(assert (=> mapNonEmpty!3191 (= (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (store mapRest!3192 mapKey!3191 mapValue!3191))))

(declare-fun b!74784 () Bool)

(declare-datatypes ((Unit!2147 0))(
  ( (Unit!2148) )
))
(declare-fun e!48872 () Unit!2147)

(declare-fun Unit!2149 () Unit!2147)

(assert (=> b!74784 (= e!48872 Unit!2149)))

(declare-fun lt!33655 () Unit!2147)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!50 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 64) (_ BitVec 32) Int) Unit!2147)

(assert (=> b!74784 (= lt!33655 (lemmaListMapContainsThenArrayContainsFrom!50 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!74784 (arrayContainsKey!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!33650 () Unit!2147)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3885 (_ BitVec 32) (_ BitVec 32)) Unit!2147)

(assert (=> b!74784 (= lt!33650 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1489 0))(
  ( (Nil!1486) (Cons!1485 (h!2073 (_ BitVec 64)) (t!5058 List!1489)) )
))
(declare-fun arrayNoDuplicates!0 (array!3885 (_ BitVec 32) List!1489) Bool)

(assert (=> b!74784 (arrayNoDuplicates!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) from!355 Nil!1486)))

(declare-fun lt!33646 () Unit!2147)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3885 (_ BitVec 32) (_ BitVec 64) List!1489) Unit!2147)

(assert (=> b!74784 (= lt!33646 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (Cons!1485 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) Nil!1486)))))

(assert (=> b!74784 false))

(declare-fun b!74785 () Bool)

(declare-fun e!48862 () Bool)

(assert (=> b!74785 (= e!48862 tp_is_empty!2479)))

(declare-fun b!74786 () Bool)

(declare-fun e!48863 () Bool)

(assert (=> b!74786 (= e!48863 tp_is_empty!2479)))

(declare-fun b!74787 () Bool)

(declare-fun res!39513 () Bool)

(declare-fun e!48874 () Bool)

(assert (=> b!74787 (=> res!39513 e!48874)))

(assert (=> b!74787 (= res!39513 (or (not (= (size!2093 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6209 (v!2539 (underlying!259 thiss!992)))))) (not (= (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (size!2093 (_values!2216 (v!2539 (underlying!259 thiss!992)))))) (bvslt (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!74788 () Bool)

(declare-fun res!39509 () Bool)

(assert (=> b!74788 (=> (not res!39509) (not e!48878))))

(assert (=> b!74788 (= res!39509 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6209 newMap!16)) (_size!399 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun b!74789 () Bool)

(declare-fun Unit!2150 () Unit!2147)

(assert (=> b!74789 (= e!48872 Unit!2150)))

(declare-fun b!74790 () Bool)

(declare-fun e!48875 () Bool)

(assert (=> b!74790 (= e!48869 e!48875)))

(declare-fun res!39508 () Bool)

(assert (=> b!74790 (=> (not res!39508) (not e!48875))))

(assert (=> b!74790 (= res!39508 (and (not (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!33657 () V!2953)

(declare-fun get!1150 (ValueCell!896 V!2953) V!2953)

(declare-fun dynLambda!328 (Int (_ BitVec 64)) V!2953)

(assert (=> b!74790 (= lt!33657 (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) from!355) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!3191 () Bool)

(assert (=> mapIsEmpty!3191 mapRes!3191))

(declare-fun b!74791 () Bool)

(declare-fun e!48864 () Bool)

(assert (=> b!74791 (= e!48877 e!48864)))

(declare-fun b!74792 () Bool)

(assert (=> b!74792 (= e!48868 tp_is_empty!2479)))

(declare-fun mapIsEmpty!3192 () Bool)

(declare-fun mapRes!3192 () Bool)

(assert (=> mapIsEmpty!3192 mapRes!3192))

(declare-fun b!74793 () Bool)

(declare-fun res!39510 () Bool)

(assert (=> b!74793 (=> (not res!39510) (not e!48878))))

(assert (=> b!74793 (= res!39510 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992)))))))))

(declare-fun b!74794 () Bool)

(declare-fun e!48871 () Bool)

(assert (=> b!74794 (= e!48865 (and e!48871 mapRes!3192))))

(declare-fun condMapEmpty!3192 () Bool)

(declare-fun mapDefault!3192 () ValueCell!896)

(assert (=> b!74794 (= condMapEmpty!3192 (= (arr!1853 (_values!2216 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!896)) mapDefault!3192)))))

(declare-fun b!74795 () Bool)

(declare-fun e!48861 () Bool)

(assert (=> b!74795 (= e!48861 (not e!48874))))

(declare-fun res!39507 () Bool)

(assert (=> b!74795 (=> res!39507 e!48874)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!74795 (= res!39507 (not (validMask!0 (mask!6209 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun lt!33649 () ListLongMap!1409)

(declare-fun lt!33648 () tuple2!2130)

(declare-fun lt!33653 () tuple2!2130)

(declare-fun +!95 (ListLongMap!1409 tuple2!2130) ListLongMap!1409)

(assert (=> b!74795 (= (+!95 (+!95 lt!33649 lt!33648) lt!33653) (+!95 (+!95 lt!33649 lt!33653) lt!33648))))

(assert (=> b!74795 (= lt!33653 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))

(assert (=> b!74795 (= lt!33648 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))

(declare-fun lt!33656 () Unit!2147)

(declare-fun addCommutativeForDiffKeys!14 (ListLongMap!1409 (_ BitVec 64) V!2953 (_ BitVec 64) V!2953) Unit!2147)

(assert (=> b!74795 (= lt!33656 (addCommutativeForDiffKeys!14 lt!33649 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!59 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) Int) ListLongMap!1409)

(assert (=> b!74795 (= lt!33649 (getCurrentListMapNoExtraKeys!59 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun b!74796 () Bool)

(assert (=> b!74796 (= e!48875 e!48861)))

(declare-fun res!39505 () Bool)

(assert (=> b!74796 (=> (not res!39505) (not e!48861))))

(declare-datatypes ((tuple2!2132 0))(
  ( (tuple2!2133 (_1!1077 Bool) (_2!1077 LongMapFixedSize!700)) )
))
(declare-fun lt!33651 () tuple2!2132)

(assert (=> b!74796 (= res!39505 (and (_1!1077 lt!33651) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!33654 () Unit!2147)

(assert (=> b!74796 (= lt!33654 e!48872)))

(declare-fun c!11296 () Bool)

(declare-fun contains!723 (ListLongMap!1409 (_ BitVec 64)) Bool)

(assert (=> b!74796 (= c!11296 (contains!723 lt!33652 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun update!105 (LongMapFixedSize!700 (_ BitVec 64) V!2953) tuple2!2132)

(assert (=> b!74796 (= lt!33651 (update!105 newMap!16 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))

(declare-fun e!48866 () Bool)

(assert (=> b!74797 (= e!48864 (and tp!8561 tp_is_empty!2479 (array_inv!1159 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (array_inv!1160 (_values!2216 (v!2539 (underlying!259 thiss!992)))) e!48866))))

(declare-fun b!74798 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3885 (_ BitVec 32)) Bool)

(assert (=> b!74798 (= e!48874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun b!74799 () Bool)

(assert (=> b!74799 (= e!48871 tp_is_empty!2479)))

(declare-fun b!74800 () Bool)

(assert (=> b!74800 (= e!48866 (and e!48863 mapRes!3191))))

(declare-fun condMapEmpty!3191 () Bool)

(declare-fun mapDefault!3191 () ValueCell!896)

(assert (=> b!74800 (= condMapEmpty!3191 (= (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!896)) mapDefault!3191)))))

(declare-fun mapNonEmpty!3192 () Bool)

(declare-fun tp!8559 () Bool)

(assert (=> mapNonEmpty!3192 (= mapRes!3192 (and tp!8559 e!48862))))

(declare-fun mapRest!3191 () (Array (_ BitVec 32) ValueCell!896))

(declare-fun mapValue!3192 () ValueCell!896)

(declare-fun mapKey!3192 () (_ BitVec 32))

(assert (=> mapNonEmpty!3192 (= (arr!1853 (_values!2216 newMap!16)) (store mapRest!3191 mapKey!3192 mapValue!3192))))

(assert (= (and start!9918 res!39512) b!74793))

(assert (= (and b!74793 res!39510) b!74780))

(assert (= (and b!74780 res!39511) b!74788))

(assert (= (and b!74788 res!39509) b!74782))

(assert (= (and b!74782 res!39506) b!74790))

(assert (= (and b!74790 res!39508) b!74796))

(assert (= (and b!74796 c!11296) b!74784))

(assert (= (and b!74796 (not c!11296)) b!74789))

(assert (= (and b!74796 res!39505) b!74795))

(assert (= (and b!74795 (not res!39507)) b!74787))

(assert (= (and b!74787 (not res!39513)) b!74798))

(assert (= (and b!74800 condMapEmpty!3191) mapIsEmpty!3191))

(assert (= (and b!74800 (not condMapEmpty!3191)) mapNonEmpty!3191))

(get-info :version)

(assert (= (and mapNonEmpty!3191 ((_ is ValueCellFull!896) mapValue!3191)) b!74792))

(assert (= (and b!74800 ((_ is ValueCellFull!896) mapDefault!3191)) b!74786))

(assert (= b!74797 b!74800))

(assert (= b!74791 b!74797))

(assert (= b!74783 b!74791))

(assert (= start!9918 b!74783))

(assert (= (and b!74794 condMapEmpty!3192) mapIsEmpty!3192))

(assert (= (and b!74794 (not condMapEmpty!3192)) mapNonEmpty!3192))

(assert (= (and mapNonEmpty!3192 ((_ is ValueCellFull!896) mapValue!3192)) b!74785))

(assert (= (and b!74794 ((_ is ValueCellFull!896) mapDefault!3192)) b!74799))

(assert (= b!74781 b!74794))

(assert (= start!9918 b!74781))

(declare-fun b_lambda!3357 () Bool)

(assert (=> (not b_lambda!3357) (not b!74790)))

(declare-fun t!5054 () Bool)

(declare-fun tb!1541 () Bool)

(assert (=> (and b!74797 (= (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))) t!5054) tb!1541))

(declare-fun result!2697 () Bool)

(assert (=> tb!1541 (= result!2697 tp_is_empty!2479)))

(assert (=> b!74790 t!5054))

(declare-fun b_and!4569 () Bool)

(assert (= b_and!4565 (and (=> t!5054 result!2697) b_and!4569)))

(declare-fun tb!1543 () Bool)

(declare-fun t!5056 () Bool)

(assert (=> (and b!74781 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))) t!5056) tb!1543))

(declare-fun result!2701 () Bool)

(assert (= result!2701 result!2697))

(assert (=> b!74790 t!5056))

(declare-fun b_and!4571 () Bool)

(assert (= b_and!4567 (and (=> t!5056 result!2701) b_and!4571)))

(declare-fun m!74103 () Bool)

(assert (=> mapNonEmpty!3191 m!74103))

(declare-fun m!74105 () Bool)

(assert (=> b!74797 m!74105))

(declare-fun m!74107 () Bool)

(assert (=> b!74797 m!74107))

(declare-fun m!74109 () Bool)

(assert (=> mapNonEmpty!3192 m!74109))

(declare-fun m!74111 () Bool)

(assert (=> b!74796 m!74111))

(assert (=> b!74796 m!74111))

(declare-fun m!74113 () Bool)

(assert (=> b!74796 m!74113))

(assert (=> b!74796 m!74111))

(declare-fun m!74115 () Bool)

(assert (=> b!74796 m!74115))

(declare-fun m!74117 () Bool)

(assert (=> b!74780 m!74117))

(declare-fun m!74119 () Bool)

(assert (=> b!74784 m!74119))

(declare-fun m!74121 () Bool)

(assert (=> b!74784 m!74121))

(assert (=> b!74784 m!74111))

(declare-fun m!74123 () Bool)

(assert (=> b!74784 m!74123))

(assert (=> b!74784 m!74111))

(assert (=> b!74784 m!74111))

(declare-fun m!74125 () Bool)

(assert (=> b!74784 m!74125))

(assert (=> b!74784 m!74111))

(declare-fun m!74127 () Bool)

(assert (=> b!74784 m!74127))

(assert (=> b!74790 m!74111))

(declare-fun m!74129 () Bool)

(assert (=> b!74790 m!74129))

(declare-fun m!74131 () Bool)

(assert (=> b!74790 m!74131))

(assert (=> b!74790 m!74129))

(assert (=> b!74790 m!74131))

(declare-fun m!74133 () Bool)

(assert (=> b!74790 m!74133))

(declare-fun m!74135 () Bool)

(assert (=> start!9918 m!74135))

(declare-fun m!74137 () Bool)

(assert (=> b!74798 m!74137))

(declare-fun m!74139 () Bool)

(assert (=> b!74781 m!74139))

(declare-fun m!74141 () Bool)

(assert (=> b!74781 m!74141))

(declare-fun m!74143 () Bool)

(assert (=> b!74782 m!74143))

(declare-fun m!74145 () Bool)

(assert (=> b!74782 m!74145))

(declare-fun m!74147 () Bool)

(assert (=> b!74795 m!74147))

(declare-fun m!74149 () Bool)

(assert (=> b!74795 m!74149))

(declare-fun m!74151 () Bool)

(assert (=> b!74795 m!74151))

(declare-fun m!74153 () Bool)

(assert (=> b!74795 m!74153))

(assert (=> b!74795 m!74111))

(declare-fun m!74155 () Bool)

(assert (=> b!74795 m!74155))

(assert (=> b!74795 m!74111))

(declare-fun m!74157 () Bool)

(assert (=> b!74795 m!74157))

(assert (=> b!74795 m!74151))

(assert (=> b!74795 m!74147))

(declare-fun m!74159 () Bool)

(assert (=> b!74795 m!74159))

(check-sat (not b!74795) tp_is_empty!2479 (not start!9918) (not b_next!2127) (not b_next!2125) (not b!74790) (not b!74782) (not mapNonEmpty!3191) (not b!74798) (not b!74796) (not b_lambda!3357) (not b!74781) b_and!4571 (not b!74784) b_and!4569 (not b!74797) (not b!74780) (not mapNonEmpty!3192))
(check-sat b_and!4569 b_and!4571 (not b_next!2125) (not b_next!2127))
(get-model)

(declare-fun b_lambda!3363 () Bool)

(assert (= b_lambda!3357 (or (and b!74797 b_free!2125) (and b!74781 b_free!2127 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))))) b_lambda!3363)))

(check-sat (not b!74795) tp_is_empty!2479 (not start!9918) (not b_next!2127) (not b_lambda!3363) (not b!74781) (not b_next!2125) (not b!74790) (not b!74782) (not mapNonEmpty!3191) (not b!74798) (not b!74796) b_and!4571 (not b!74784) b_and!4569 (not b!74797) (not b!74780) (not mapNonEmpty!3192))
(check-sat b_and!4569 b_and!4571 (not b_next!2125) (not b_next!2127))
(get-model)

(declare-fun d!17755 () Bool)

(declare-fun res!39574 () Bool)

(declare-fun e!48989 () Bool)

(assert (=> d!17755 (=> (not res!39574) (not e!48989))))

(declare-fun simpleValid!52 (LongMapFixedSize!700) Bool)

(assert (=> d!17755 (= res!39574 (simpleValid!52 newMap!16))))

(assert (=> d!17755 (= (valid!303 newMap!16) e!48989)))

(declare-fun b!74939 () Bool)

(declare-fun res!39575 () Bool)

(assert (=> b!74939 (=> (not res!39575) (not e!48989))))

(declare-fun arrayCountValidKeys!0 (array!3885 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!74939 (= res!39575 (= (arrayCountValidKeys!0 (_keys!3888 newMap!16) #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))) (_size!399 newMap!16)))))

(declare-fun b!74940 () Bool)

(declare-fun res!39576 () Bool)

(assert (=> b!74940 (=> (not res!39576) (not e!48989))))

(assert (=> b!74940 (= res!39576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3888 newMap!16) (mask!6209 newMap!16)))))

(declare-fun b!74941 () Bool)

(assert (=> b!74941 (= e!48989 (arrayNoDuplicates!0 (_keys!3888 newMap!16) #b00000000000000000000000000000000 Nil!1486))))

(assert (= (and d!17755 res!39574) b!74939))

(assert (= (and b!74939 res!39575) b!74940))

(assert (= (and b!74940 res!39576) b!74941))

(declare-fun m!74277 () Bool)

(assert (=> d!17755 m!74277))

(declare-fun m!74279 () Bool)

(assert (=> b!74939 m!74279))

(declare-fun m!74281 () Bool)

(assert (=> b!74940 m!74281))

(declare-fun m!74283 () Bool)

(assert (=> b!74941 m!74283))

(assert (=> b!74780 d!17755))

(declare-fun d!17757 () Bool)

(declare-fun c!11305 () Bool)

(assert (=> d!17757 (= c!11305 ((_ is ValueCellFull!896) (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun e!48992 () V!2953)

(assert (=> d!17757 (= (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) from!355) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!48992)))

(declare-fun b!74946 () Bool)

(declare-fun get!1151 (ValueCell!896 V!2953) V!2953)

(assert (=> b!74946 (= e!48992 (get!1151 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) from!355) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!74947 () Bool)

(declare-fun get!1152 (ValueCell!896 V!2953) V!2953)

(assert (=> b!74947 (= e!48992 (get!1152 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) from!355) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17757 c!11305) b!74946))

(assert (= (and d!17757 (not c!11305)) b!74947))

(assert (=> b!74946 m!74129))

(assert (=> b!74946 m!74131))

(declare-fun m!74285 () Bool)

(assert (=> b!74946 m!74285))

(assert (=> b!74947 m!74129))

(assert (=> b!74947 m!74131))

(declare-fun m!74287 () Bool)

(assert (=> b!74947 m!74287))

(assert (=> b!74790 d!17757))

(declare-fun d!17759 () Bool)

(assert (=> d!17759 (= (array_inv!1159 (_keys!3888 newMap!16)) (bvsge (size!2092 (_keys!3888 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!74781 d!17759))

(declare-fun d!17761 () Bool)

(assert (=> d!17761 (= (array_inv!1160 (_values!2216 newMap!16)) (bvsge (size!2093 (_values!2216 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!74781 d!17761))

(declare-fun d!17763 () Bool)

(assert (=> d!17763 (= (array_inv!1159 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvsge (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!74797 d!17763))

(declare-fun d!17765 () Bool)

(assert (=> d!17765 (= (array_inv!1160 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvsge (size!2093 (_values!2216 (v!2539 (underlying!259 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!74797 d!17765))

(declare-fun bm!6620 () Bool)

(declare-fun call!6623 () Bool)

(assert (=> bm!6620 (= call!6623 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3888 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun b!74957 () Bool)

(declare-fun e!49001 () Bool)

(assert (=> b!74957 (= e!49001 call!6623)))

(declare-fun b!74958 () Bool)

(declare-fun e!48999 () Bool)

(assert (=> b!74958 (= e!49001 e!48999)))

(declare-fun lt!33737 () (_ BitVec 64))

(assert (=> b!74958 (= lt!33737 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!33736 () Unit!2147)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3885 (_ BitVec 64) (_ BitVec 32)) Unit!2147)

(assert (=> b!74958 (= lt!33736 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) lt!33737 #b00000000000000000000000000000000))))

(assert (=> b!74958 (arrayContainsKey!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) lt!33737 #b00000000000000000000000000000000)))

(declare-fun lt!33738 () Unit!2147)

(assert (=> b!74958 (= lt!33738 lt!33736)))

(declare-fun res!39581 () Bool)

(declare-datatypes ((SeekEntryResult!240 0))(
  ( (MissingZero!240 (index!3092 (_ BitVec 32))) (Found!240 (index!3093 (_ BitVec 32))) (Intermediate!240 (undefined!1052 Bool) (index!3094 (_ BitVec 32)) (x!11299 (_ BitVec 32))) (Undefined!240) (MissingVacant!240 (index!3095 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3885 (_ BitVec 32)) SeekEntryResult!240)

(assert (=> b!74958 (= res!39581 (= (seekEntryOrOpen!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b00000000000000000000000000000000) (_keys!3888 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992)))) (Found!240 #b00000000000000000000000000000000)))))

(assert (=> b!74958 (=> (not res!39581) (not e!48999))))

(declare-fun b!74959 () Bool)

(assert (=> b!74959 (= e!48999 call!6623)))

(declare-fun d!17767 () Bool)

(declare-fun res!39582 () Bool)

(declare-fun e!49000 () Bool)

(assert (=> d!17767 (=> res!39582 e!49000)))

(assert (=> d!17767 (= res!39582 (bvsge #b00000000000000000000000000000000 (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(assert (=> d!17767 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992)))) e!49000)))

(declare-fun b!74956 () Bool)

(assert (=> b!74956 (= e!49000 e!49001)))

(declare-fun c!11308 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!74956 (= c!11308 (validKeyInArray!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!17767 (not res!39582)) b!74956))

(assert (= (and b!74956 c!11308) b!74958))

(assert (= (and b!74956 (not c!11308)) b!74957))

(assert (= (and b!74958 res!39581) b!74959))

(assert (= (or b!74959 b!74957) bm!6620))

(declare-fun m!74289 () Bool)

(assert (=> bm!6620 m!74289))

(declare-fun m!74291 () Bool)

(assert (=> b!74958 m!74291))

(declare-fun m!74293 () Bool)

(assert (=> b!74958 m!74293))

(declare-fun m!74295 () Bool)

(assert (=> b!74958 m!74295))

(assert (=> b!74958 m!74291))

(declare-fun m!74297 () Bool)

(assert (=> b!74958 m!74297))

(assert (=> b!74956 m!74291))

(assert (=> b!74956 m!74291))

(declare-fun m!74299 () Bool)

(assert (=> b!74956 m!74299))

(assert (=> b!74798 d!17767))

(declare-fun d!17769 () Bool)

(assert (=> d!17769 (not (arrayContainsKey!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!33741 () Unit!2147)

(declare-fun choose!68 (array!3885 (_ BitVec 32) (_ BitVec 64) List!1489) Unit!2147)

(assert (=> d!17769 (= lt!33741 (choose!68 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (Cons!1485 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) Nil!1486)))))

(assert (=> d!17769 (bvslt (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!17769 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (Cons!1485 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) Nil!1486)) lt!33741)))

(declare-fun bs!3221 () Bool)

(assert (= bs!3221 d!17769))

(assert (=> bs!3221 m!74111))

(assert (=> bs!3221 m!74125))

(assert (=> bs!3221 m!74111))

(declare-fun m!74301 () Bool)

(assert (=> bs!3221 m!74301))

(assert (=> b!74784 d!17769))

(declare-fun d!17771 () Bool)

(assert (=> d!17771 (arrayNoDuplicates!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) from!355 Nil!1486)))

(declare-fun lt!33744 () Unit!2147)

(declare-fun choose!39 (array!3885 (_ BitVec 32) (_ BitVec 32)) Unit!2147)

(assert (=> d!17771 (= lt!33744 (choose!39 (_keys!3888 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!17771 (bvslt (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!17771 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000000 from!355) lt!33744)))

(declare-fun bs!3222 () Bool)

(assert (= bs!3222 d!17771))

(assert (=> bs!3222 m!74121))

(declare-fun m!74303 () Bool)

(assert (=> bs!3222 m!74303))

(assert (=> b!74784 d!17771))

(declare-fun d!17773 () Bool)

(declare-fun res!39587 () Bool)

(declare-fun e!49006 () Bool)

(assert (=> d!17773 (=> res!39587 e!49006)))

(assert (=> d!17773 (= res!39587 (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(assert (=> d!17773 (= (arrayContainsKey!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!49006)))

(declare-fun b!74964 () Bool)

(declare-fun e!49007 () Bool)

(assert (=> b!74964 (= e!49006 e!49007)))

(declare-fun res!39588 () Bool)

(assert (=> b!74964 (=> (not res!39588) (not e!49007))))

(assert (=> b!74964 (= res!39588 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun b!74965 () Bool)

(assert (=> b!74965 (= e!49007 (arrayContainsKey!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!17773 (not res!39587)) b!74964))

(assert (= (and b!74964 res!39588) b!74965))

(declare-fun m!74305 () Bool)

(assert (=> d!17773 m!74305))

(assert (=> b!74965 m!74111))

(declare-fun m!74307 () Bool)

(assert (=> b!74965 m!74307))

(assert (=> b!74784 d!17773))

(declare-fun d!17775 () Bool)

(declare-fun e!49010 () Bool)

(assert (=> d!17775 e!49010))

(declare-fun c!11311 () Bool)

(assert (=> d!17775 (= c!11311 (and (not (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!33747 () Unit!2147)

(declare-fun choose!432 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 64) (_ BitVec 32) Int) Unit!2147)

(assert (=> d!17775 (= lt!33747 (choose!432 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))))))

(assert (=> d!17775 (validMask!0 (mask!6209 (v!2539 (underlying!259 thiss!992))))))

(assert (=> d!17775 (= (lemmaListMapContainsThenArrayContainsFrom!50 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))) lt!33747)))

(declare-fun b!74970 () Bool)

(assert (=> b!74970 (= e!49010 (arrayContainsKey!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!74971 () Bool)

(assert (=> b!74971 (= e!49010 (ite (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!17775 c!11311) b!74970))

(assert (= (and d!17775 (not c!11311)) b!74971))

(assert (=> d!17775 m!74111))

(declare-fun m!74309 () Bool)

(assert (=> d!17775 m!74309))

(assert (=> d!17775 m!74149))

(assert (=> b!74970 m!74111))

(assert (=> b!74970 m!74125))

(assert (=> b!74784 d!17775))

(declare-fun b!74982 () Bool)

(declare-fun e!49022 () Bool)

(declare-fun e!49020 () Bool)

(assert (=> b!74982 (= e!49022 e!49020)))

(declare-fun res!39596 () Bool)

(assert (=> b!74982 (=> (not res!39596) (not e!49020))))

(declare-fun e!49021 () Bool)

(assert (=> b!74982 (= res!39596 (not e!49021))))

(declare-fun res!39595 () Bool)

(assert (=> b!74982 (=> (not res!39595) (not e!49021))))

(assert (=> b!74982 (= res!39595 (validKeyInArray!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun b!74983 () Bool)

(declare-fun e!49019 () Bool)

(assert (=> b!74983 (= e!49020 e!49019)))

(declare-fun c!11314 () Bool)

(assert (=> b!74983 (= c!11314 (validKeyInArray!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun b!74984 () Bool)

(declare-fun contains!724 (List!1489 (_ BitVec 64)) Bool)

(assert (=> b!74984 (= e!49021 (contains!724 Nil!1486 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun b!74985 () Bool)

(declare-fun call!6626 () Bool)

(assert (=> b!74985 (= e!49019 call!6626)))

(declare-fun bm!6623 () Bool)

(assert (=> bm!6623 (= call!6626 (arrayNoDuplicates!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!11314 (Cons!1485 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) Nil!1486) Nil!1486)))))

(declare-fun d!17777 () Bool)

(declare-fun res!39597 () Bool)

(assert (=> d!17777 (=> res!39597 e!49022)))

(assert (=> d!17777 (= res!39597 (bvsge from!355 (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(assert (=> d!17777 (= (arrayNoDuplicates!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) from!355 Nil!1486) e!49022)))

(declare-fun b!74986 () Bool)

(assert (=> b!74986 (= e!49019 call!6626)))

(assert (= (and d!17777 (not res!39597)) b!74982))

(assert (= (and b!74982 res!39595) b!74984))

(assert (= (and b!74982 res!39596) b!74983))

(assert (= (and b!74983 c!11314) b!74986))

(assert (= (and b!74983 (not c!11314)) b!74985))

(assert (= (or b!74986 b!74985) bm!6623))

(assert (=> b!74982 m!74111))

(assert (=> b!74982 m!74111))

(declare-fun m!74311 () Bool)

(assert (=> b!74982 m!74311))

(assert (=> b!74983 m!74111))

(assert (=> b!74983 m!74111))

(assert (=> b!74983 m!74311))

(assert (=> b!74984 m!74111))

(assert (=> b!74984 m!74111))

(declare-fun m!74313 () Bool)

(assert (=> b!74984 m!74313))

(assert (=> bm!6623 m!74111))

(declare-fun m!74315 () Bool)

(assert (=> bm!6623 m!74315))

(assert (=> b!74784 d!17777))

(declare-fun d!17779 () Bool)

(declare-fun e!49028 () Bool)

(assert (=> d!17779 e!49028))

(declare-fun res!39600 () Bool)

(assert (=> d!17779 (=> res!39600 e!49028)))

(declare-fun lt!33759 () Bool)

(assert (=> d!17779 (= res!39600 (not lt!33759))))

(declare-fun lt!33758 () Bool)

(assert (=> d!17779 (= lt!33759 lt!33758)))

(declare-fun lt!33756 () Unit!2147)

(declare-fun e!49027 () Unit!2147)

(assert (=> d!17779 (= lt!33756 e!49027)))

(declare-fun c!11317 () Bool)

(assert (=> d!17779 (= c!11317 lt!33758)))

(declare-fun containsKey!136 (List!1488 (_ BitVec 64)) Bool)

(assert (=> d!17779 (= lt!33758 (containsKey!136 (toList!720 lt!33652) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(assert (=> d!17779 (= (contains!723 lt!33652 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) lt!33759)))

(declare-fun b!74993 () Bool)

(declare-fun lt!33757 () Unit!2147)

(assert (=> b!74993 (= e!49027 lt!33757)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!85 (List!1488 (_ BitVec 64)) Unit!2147)

(assert (=> b!74993 (= lt!33757 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 lt!33652) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-datatypes ((Option!138 0))(
  ( (Some!137 (v!2545 V!2953)) (None!136) )
))
(declare-fun isDefined!86 (Option!138) Bool)

(declare-fun getValueByKey!132 (List!1488 (_ BitVec 64)) Option!138)

(assert (=> b!74993 (isDefined!86 (getValueByKey!132 (toList!720 lt!33652) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun b!74994 () Bool)

(declare-fun Unit!2154 () Unit!2147)

(assert (=> b!74994 (= e!49027 Unit!2154)))

(declare-fun b!74995 () Bool)

(assert (=> b!74995 (= e!49028 (isDefined!86 (getValueByKey!132 (toList!720 lt!33652) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355))))))

(assert (= (and d!17779 c!11317) b!74993))

(assert (= (and d!17779 (not c!11317)) b!74994))

(assert (= (and d!17779 (not res!39600)) b!74995))

(assert (=> d!17779 m!74111))

(declare-fun m!74317 () Bool)

(assert (=> d!17779 m!74317))

(assert (=> b!74993 m!74111))

(declare-fun m!74319 () Bool)

(assert (=> b!74993 m!74319))

(assert (=> b!74993 m!74111))

(declare-fun m!74321 () Bool)

(assert (=> b!74993 m!74321))

(assert (=> b!74993 m!74321))

(declare-fun m!74323 () Bool)

(assert (=> b!74993 m!74323))

(assert (=> b!74995 m!74111))

(assert (=> b!74995 m!74321))

(assert (=> b!74995 m!74321))

(assert (=> b!74995 m!74323))

(assert (=> b!74796 d!17779))

(declare-fun b!75080 () Bool)

(declare-fun res!39633 () Bool)

(declare-fun call!6698 () Bool)

(assert (=> b!75080 (= res!39633 call!6698)))

(declare-fun e!49082 () Bool)

(assert (=> b!75080 (=> (not res!39633) (not e!49082))))

(declare-fun b!75081 () Bool)

(declare-fun e!49078 () Bool)

(declare-fun lt!33820 () SeekEntryResult!240)

(assert (=> b!75081 (= e!49078 ((_ is Undefined!240) lt!33820))))

(declare-fun b!75082 () Bool)

(declare-fun lt!33815 () Unit!2147)

(declare-fun e!49087 () Unit!2147)

(assert (=> b!75082 (= lt!33815 e!49087)))

(declare-fun c!11350 () Bool)

(declare-fun call!6687 () Bool)

(assert (=> b!75082 (= c!11350 call!6687)))

(declare-fun e!49083 () tuple2!2132)

(assert (=> b!75082 (= e!49083 (tuple2!2133 false newMap!16))))

(declare-fun bm!6672 () Bool)

(declare-fun call!6679 () Unit!2147)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!25 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 64) Int) Unit!2147)

(assert (=> bm!6672 (= call!6679 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!25 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)))))

(declare-fun lt!33833 () array!3887)

(declare-fun lt!33830 () (_ BitVec 32))

(declare-fun c!11353 () Bool)

(declare-fun c!11351 () Bool)

(declare-fun bm!6673 () Bool)

(declare-fun call!6681 () ListLongMap!1409)

(assert (=> bm!6673 (= call!6681 (getCurrentListMap!413 (_keys!3888 newMap!16) (ite c!11353 (_values!2216 newMap!16) lt!33833) (mask!6209 newMap!16) (ite c!11353 (ite c!11351 (extraKeys!2088 newMap!16) lt!33830) (extraKeys!2088 newMap!16)) (zeroValue!2133 newMap!16) (ite c!11353 (ite c!11351 (minValue!2133 newMap!16) lt!33657) (minValue!2133 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun b!75084 () Bool)

(declare-fun e!49081 () ListLongMap!1409)

(declare-fun call!6683 () ListLongMap!1409)

(declare-fun call!6697 () ListLongMap!1409)

(assert (=> b!75084 (= e!49081 (ite c!11351 call!6683 call!6697))))

(declare-fun bm!6674 () Bool)

(assert (=> bm!6674 (= call!6683 call!6681)))

(declare-fun b!75085 () Bool)

(declare-fun e!49094 () tuple2!2132)

(declare-fun e!49073 () tuple2!2132)

(assert (=> b!75085 (= e!49094 e!49073)))

(declare-fun c!11348 () Bool)

(declare-fun lt!33818 () SeekEntryResult!240)

(assert (=> b!75085 (= c!11348 ((_ is MissingZero!240) lt!33818))))

(declare-fun bm!6675 () Bool)

(declare-fun call!6691 () ListLongMap!1409)

(assert (=> bm!6675 (= call!6691 (+!95 e!49081 (ite c!11353 (ite c!11351 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33657) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33657)) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(declare-fun c!11352 () Bool)

(assert (=> bm!6675 (= c!11352 c!11353)))

(declare-fun b!75086 () Bool)

(declare-fun lt!33823 () Unit!2147)

(declare-fun lt!33834 () Unit!2147)

(assert (=> b!75086 (= lt!33823 lt!33834)))

(declare-fun call!6685 () ListLongMap!1409)

(assert (=> b!75086 (= call!6685 call!6683)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!25 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 V!2953 Int) Unit!2147)

(assert (=> b!75086 (= lt!33834 (lemmaChangeLongMinValueKeyThenAddPairToListMap!25 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) lt!33830 (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) lt!33657 (defaultEntry!2233 newMap!16)))))

(assert (=> b!75086 (= lt!33830 (bvor (extraKeys!2088 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!49074 () tuple2!2132)

(assert (=> b!75086 (= e!49074 (tuple2!2133 true (LongMapFixedSize!701 (defaultEntry!2233 newMap!16) (mask!6209 newMap!16) (bvor (extraKeys!2088 newMap!16) #b00000000000000000000000000000010) (zeroValue!2133 newMap!16) lt!33657 (_size!399 newMap!16) (_keys!3888 newMap!16) (_values!2216 newMap!16) (_vacant!399 newMap!16))))))

(declare-fun b!75087 () Bool)

(declare-fun lt!33838 () Unit!2147)

(assert (=> b!75087 (= e!49087 lt!33838)))

(assert (=> b!75087 (= lt!33838 call!6679)))

(declare-fun lt!33826 () SeekEntryResult!240)

(declare-fun call!6678 () SeekEntryResult!240)

(assert (=> b!75087 (= lt!33826 call!6678)))

(declare-fun c!11355 () Bool)

(assert (=> b!75087 (= c!11355 ((_ is MissingZero!240) lt!33826))))

(declare-fun e!49093 () Bool)

(assert (=> b!75087 e!49093))

(declare-fun b!75088 () Bool)

(declare-fun c!11354 () Bool)

(assert (=> b!75088 (= c!11354 ((_ is MissingVacant!240) lt!33826))))

(declare-fun e!49076 () Bool)

(assert (=> b!75088 (= e!49093 e!49076)))

(declare-fun bm!6676 () Bool)

(declare-fun call!6686 () Bool)

(assert (=> bm!6676 (= call!6698 call!6686)))

(declare-fun bm!6677 () Bool)

(declare-fun call!6675 () SeekEntryResult!240)

(assert (=> bm!6677 (= call!6678 call!6675)))

(declare-fun bm!6678 () Bool)

(declare-fun call!6688 () ListLongMap!1409)

(assert (=> bm!6678 (= call!6697 call!6688)))

(declare-fun bm!6679 () Bool)

(declare-fun call!6695 () Bool)

(declare-fun call!6680 () Bool)

(assert (=> bm!6679 (= call!6695 call!6680)))

(declare-fun b!75089 () Bool)

(declare-fun e!49091 () Bool)

(declare-fun e!49077 () Bool)

(assert (=> b!75089 (= e!49091 e!49077)))

(declare-fun call!6684 () ListLongMap!1409)

(declare-fun res!39631 () Bool)

(assert (=> b!75089 (= res!39631 (contains!723 call!6684 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(assert (=> b!75089 (=> (not res!39631) (not e!49077))))

(declare-fun b!75090 () Bool)

(declare-fun c!11349 () Bool)

(assert (=> b!75090 (= c!11349 ((_ is MissingVacant!240) lt!33818))))

(assert (=> b!75090 (= e!49083 e!49094)))

(declare-fun bm!6680 () Bool)

(assert (=> bm!6680 (= call!6675 (seekEntryOrOpen!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (_keys!3888 newMap!16) (mask!6209 newMap!16)))))

(declare-fun b!75091 () Bool)

(declare-fun e!49079 () Bool)

(assert (=> b!75091 (= e!49076 e!49079)))

(declare-fun res!39639 () Bool)

(declare-fun call!6696 () Bool)

(assert (=> b!75091 (= res!39639 call!6696)))

(assert (=> b!75091 (=> (not res!39639) (not e!49079))))

(declare-fun b!75092 () Bool)

(declare-fun e!49075 () tuple2!2132)

(assert (=> b!75092 (= e!49075 e!49074)))

(assert (=> b!75092 (= c!11351 (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75093 () Bool)

(declare-fun lt!33837 () tuple2!2132)

(declare-fun call!6692 () tuple2!2132)

(assert (=> b!75093 (= lt!33837 call!6692)))

(assert (=> b!75093 (= e!49073 (tuple2!2133 (_1!1077 lt!33837) (_2!1077 lt!33837)))))

(declare-fun b!75094 () Bool)

(declare-fun e!49085 () Bool)

(declare-fun call!6694 () Bool)

(assert (=> b!75094 (= e!49085 (not call!6694))))

(declare-fun b!75095 () Bool)

(declare-fun e!49080 () ListLongMap!1409)

(assert (=> b!75095 (= e!49080 (getCurrentListMap!413 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun bm!6681 () Bool)

(declare-fun updateHelperNewKey!25 (LongMapFixedSize!700 (_ BitVec 64) V!2953 (_ BitVec 32)) tuple2!2132)

(assert (=> bm!6681 (= call!6692 (updateHelperNewKey!25 newMap!16 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657 (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818))))))

(declare-fun b!75096 () Bool)

(declare-fun res!39640 () Bool)

(assert (=> b!75096 (= res!39640 (= (select (arr!1852 (_keys!3888 newMap!16)) (index!3095 lt!33820)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49090 () Bool)

(assert (=> b!75096 (=> (not res!39640) (not e!49090))))

(declare-fun b!75097 () Bool)

(assert (=> b!75097 (= e!49081 (getCurrentListMap!413 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun bm!6682 () Bool)

(declare-fun call!6676 () Bool)

(assert (=> bm!6682 (= call!6676 call!6698)))

(declare-fun bm!6683 () Bool)

(declare-fun call!6677 () Bool)

(assert (=> bm!6683 (= call!6677 call!6686)))

(declare-fun bm!6684 () Bool)

(declare-fun call!6690 () SeekEntryResult!240)

(assert (=> bm!6684 (= call!6690 call!6675)))

(declare-fun bm!6685 () Bool)

(assert (=> bm!6685 (= call!6696 call!6677)))

(declare-fun lt!33814 () (_ BitVec 32))

(declare-fun bm!6686 () Bool)

(declare-fun c!11359 () Bool)

(assert (=> bm!6686 (= call!6688 (getCurrentListMap!413 (_keys!3888 newMap!16) (ite (or c!11353 c!11359) (_values!2216 newMap!16) (array!3888 (store (arr!1853 (_values!2216 newMap!16)) (index!3093 lt!33818) (ValueCellFull!896 lt!33657)) (size!2093 (_values!2216 newMap!16)))) (mask!6209 newMap!16) (ite (and c!11353 c!11351) lt!33814 (extraKeys!2088 newMap!16)) (ite (and c!11353 c!11351) lt!33657 (zeroValue!2133 newMap!16)) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun b!75083 () Bool)

(declare-fun res!39641 () Bool)

(assert (=> b!75083 (= res!39641 call!6677)))

(declare-fun e!49088 () Bool)

(assert (=> b!75083 (=> (not res!39641) (not e!49088))))

(declare-fun d!17781 () Bool)

(declare-fun e!49092 () Bool)

(assert (=> d!17781 e!49092))

(declare-fun res!39632 () Bool)

(assert (=> d!17781 (=> (not res!39632) (not e!49092))))

(declare-fun lt!33835 () tuple2!2132)

(assert (=> d!17781 (= res!39632 (valid!303 (_2!1077 lt!33835)))))

(assert (=> d!17781 (= lt!33835 e!49075)))

(assert (=> d!17781 (= c!11353 (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (bvneg (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355))))))

(assert (=> d!17781 (valid!303 newMap!16)))

(assert (=> d!17781 (= (update!105 newMap!16 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657) lt!33835)))

(declare-fun b!75098 () Bool)

(assert (=> b!75098 (= e!49078 e!49090)))

(declare-fun res!39638 () Bool)

(assert (=> b!75098 (= res!39638 call!6676)))

(assert (=> b!75098 (=> (not res!39638) (not e!49090))))

(declare-fun lt!33828 () SeekEntryResult!240)

(declare-fun lt!33827 () SeekEntryResult!240)

(declare-fun bm!6687 () Bool)

(declare-fun c!11357 () Bool)

(declare-fun c!11356 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!6687 (= call!6686 (inRange!0 (ite c!11359 (ite c!11350 (index!3093 lt!33828) (ite c!11355 (index!3092 lt!33826) (index!3095 lt!33826))) (ite c!11357 (index!3093 lt!33827) (ite c!11356 (index!3092 lt!33820) (index!3095 lt!33820)))) (mask!6209 newMap!16)))))

(declare-fun bm!6688 () Bool)

(declare-fun c!11347 () Bool)

(assert (=> bm!6688 (= c!11347 c!11359)))

(assert (=> bm!6688 (= call!6687 (contains!723 e!49080 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun bm!6689 () Bool)

(assert (=> bm!6689 (= call!6680 (arrayContainsKey!0 (_keys!3888 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!75099 () Bool)

(assert (=> b!75099 (= e!49075 e!49083)))

(assert (=> b!75099 (= lt!33818 (seekEntryOrOpen!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (_keys!3888 newMap!16) (mask!6209 newMap!16)))))

(assert (=> b!75099 (= c!11359 ((_ is Undefined!240) lt!33818))))

(declare-fun b!75100 () Bool)

(declare-fun res!39636 () Bool)

(assert (=> b!75100 (= res!39636 (= (select (arr!1852 (_keys!3888 newMap!16)) (index!3095 lt!33826)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75100 (=> (not res!39636) (not e!49079))))

(declare-fun b!75101 () Bool)

(declare-fun e!49084 () Unit!2147)

(declare-fun Unit!2155 () Unit!2147)

(assert (=> b!75101 (= e!49084 Unit!2155)))

(declare-fun lt!33817 () Unit!2147)

(assert (=> b!75101 (= lt!33817 call!6679)))

(assert (=> b!75101 (= lt!33820 call!6690)))

(assert (=> b!75101 (= c!11356 ((_ is MissingZero!240) lt!33820))))

(declare-fun e!49089 () Bool)

(assert (=> b!75101 e!49089))

(declare-fun lt!33822 () Unit!2147)

(assert (=> b!75101 (= lt!33822 lt!33817)))

(assert (=> b!75101 false))

(declare-fun bm!6690 () Bool)

(assert (=> bm!6690 (= call!6685 call!6691)))

(declare-fun b!75102 () Bool)

(declare-fun e!49086 () Bool)

(assert (=> b!75102 (= e!49086 (not call!6695))))

(declare-fun b!75103 () Bool)

(declare-fun res!39635 () Bool)

(assert (=> b!75103 (=> (not res!39635) (not e!49086))))

(assert (=> b!75103 (= res!39635 (= (select (arr!1852 (_keys!3888 newMap!16)) (index!3092 lt!33820)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6691 () Bool)

(assert (=> bm!6691 (= call!6684 (map!1155 (_2!1077 lt!33835)))))

(declare-fun b!75104 () Bool)

(declare-fun res!39642 () Bool)

(assert (=> b!75104 (=> (not res!39642) (not e!49086))))

(assert (=> b!75104 (= res!39642 call!6676)))

(assert (=> b!75104 (= e!49089 e!49086)))

(declare-fun b!75105 () Bool)

(declare-fun lt!33840 () Unit!2147)

(declare-fun lt!33829 () Unit!2147)

(assert (=> b!75105 (= lt!33840 lt!33829)))

(assert (=> b!75105 (= call!6685 call!6697)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!25 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 V!2953 Int) Unit!2147)

(assert (=> b!75105 (= lt!33829 (lemmaChangeZeroKeyThenAddPairToListMap!25 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) lt!33814 (zeroValue!2133 newMap!16) lt!33657 (minValue!2133 newMap!16) (defaultEntry!2233 newMap!16)))))

(assert (=> b!75105 (= lt!33814 (bvor (extraKeys!2088 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!75105 (= e!49074 (tuple2!2133 true (LongMapFixedSize!701 (defaultEntry!2233 newMap!16) (mask!6209 newMap!16) (bvor (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) lt!33657 (minValue!2133 newMap!16) (_size!399 newMap!16) (_keys!3888 newMap!16) (_values!2216 newMap!16) (_vacant!399 newMap!16))))))

(declare-fun bm!6692 () Bool)

(declare-fun call!6693 () ListLongMap!1409)

(assert (=> bm!6692 (= call!6693 (map!1155 newMap!16))))

(declare-fun b!75106 () Bool)

(declare-fun res!39629 () Bool)

(assert (=> b!75106 (=> (not res!39629) (not e!49085))))

(assert (=> b!75106 (= res!39629 call!6696)))

(assert (=> b!75106 (= e!49093 e!49085)))

(declare-fun bm!6693 () Bool)

(declare-fun call!6682 () ListLongMap!1409)

(assert (=> bm!6693 (= call!6682 call!6688)))

(declare-fun b!75107 () Bool)

(declare-fun lt!33821 () tuple2!2132)

(assert (=> b!75107 (= e!49094 (tuple2!2133 (_1!1077 lt!33821) (_2!1077 lt!33821)))))

(assert (=> b!75107 (= lt!33821 call!6692)))

(declare-fun b!75108 () Bool)

(assert (=> b!75108 (= e!49088 (= (select (arr!1852 (_keys!3888 newMap!16)) (index!3093 lt!33828)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun b!75109 () Bool)

(assert (=> b!75109 (= e!49090 (not call!6695))))

(declare-fun b!75110 () Bool)

(declare-fun lt!33832 () Unit!2147)

(assert (=> b!75110 (= e!49084 lt!33832)))

(declare-fun call!6689 () Unit!2147)

(assert (=> b!75110 (= lt!33832 call!6689)))

(assert (=> b!75110 (= lt!33827 call!6690)))

(declare-fun res!39637 () Bool)

(assert (=> b!75110 (= res!39637 ((_ is Found!240) lt!33827))))

(assert (=> b!75110 (=> (not res!39637) (not e!49082))))

(assert (=> b!75110 e!49082))

(declare-fun b!75111 () Bool)

(assert (=> b!75111 (= e!49080 call!6682)))

(declare-fun b!75112 () Bool)

(declare-fun lt!33825 () Unit!2147)

(declare-fun lt!33839 () Unit!2147)

(assert (=> b!75112 (= lt!33825 lt!33839)))

(assert (=> b!75112 (contains!723 call!6681 (select (arr!1852 (_keys!3888 newMap!16)) (index!3093 lt!33818)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!84 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) Int) Unit!2147)

(assert (=> b!75112 (= lt!33839 (lemmaValidKeyInArrayIsInListMap!84 (_keys!3888 newMap!16) lt!33833 (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (index!3093 lt!33818) (defaultEntry!2233 newMap!16)))))

(assert (=> b!75112 (= lt!33833 (array!3888 (store (arr!1853 (_values!2216 newMap!16)) (index!3093 lt!33818) (ValueCellFull!896 lt!33657)) (size!2093 (_values!2216 newMap!16))))))

(declare-fun lt!33836 () Unit!2147)

(declare-fun lt!33819 () Unit!2147)

(assert (=> b!75112 (= lt!33836 lt!33819)))

(assert (=> b!75112 (= call!6691 call!6682)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!25 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) (_ BitVec 64) V!2953 Int) Unit!2147)

(assert (=> b!75112 (= lt!33819 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!25 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (index!3093 lt!33818) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!33831 () Unit!2147)

(assert (=> b!75112 (= lt!33831 e!49084)))

(assert (=> b!75112 (= c!11357 call!6687)))

(assert (=> b!75112 (= e!49073 (tuple2!2133 true (LongMapFixedSize!701 (defaultEntry!2233 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (_size!399 newMap!16) (_keys!3888 newMap!16) (array!3888 (store (arr!1853 (_values!2216 newMap!16)) (index!3093 lt!33818) (ValueCellFull!896 lt!33657)) (size!2093 (_values!2216 newMap!16))) (_vacant!399 newMap!16))))))

(declare-fun b!75113 () Bool)

(assert (=> b!75113 (= e!49091 (= call!6684 call!6693))))

(declare-fun bm!6694 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!25 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 64) Int) Unit!2147)

(assert (=> bm!6694 (= call!6689 (lemmaInListMapThenSeekEntryOrOpenFindsIt!25 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)))))

(declare-fun b!75114 () Bool)

(assert (=> b!75114 (= e!49082 (= (select (arr!1852 (_keys!3888 newMap!16)) (index!3093 lt!33827)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun b!75115 () Bool)

(assert (=> b!75115 (= e!49076 ((_ is Undefined!240) lt!33826))))

(declare-fun b!75116 () Bool)

(assert (=> b!75116 (= e!49092 e!49091)))

(declare-fun c!11346 () Bool)

(assert (=> b!75116 (= c!11346 (_1!1077 lt!33835))))

(declare-fun b!75117 () Bool)

(declare-fun Unit!2156 () Unit!2147)

(assert (=> b!75117 (= e!49087 Unit!2156)))

(declare-fun lt!33824 () Unit!2147)

(assert (=> b!75117 (= lt!33824 call!6689)))

(assert (=> b!75117 (= lt!33828 call!6678)))

(declare-fun res!39630 () Bool)

(assert (=> b!75117 (= res!39630 ((_ is Found!240) lt!33828))))

(assert (=> b!75117 (=> (not res!39630) (not e!49088))))

(assert (=> b!75117 e!49088))

(declare-fun lt!33816 () Unit!2147)

(assert (=> b!75117 (= lt!33816 lt!33824)))

(assert (=> b!75117 false))

(declare-fun b!75118 () Bool)

(declare-fun res!39634 () Bool)

(assert (=> b!75118 (=> (not res!39634) (not e!49085))))

(assert (=> b!75118 (= res!39634 (= (select (arr!1852 (_keys!3888 newMap!16)) (index!3092 lt!33826)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6695 () Bool)

(assert (=> bm!6695 (= call!6694 call!6680)))

(declare-fun b!75119 () Bool)

(assert (=> b!75119 (= e!49077 (= call!6684 (+!95 call!6693 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(declare-fun b!75120 () Bool)

(declare-fun c!11358 () Bool)

(assert (=> b!75120 (= c!11358 ((_ is MissingVacant!240) lt!33820))))

(assert (=> b!75120 (= e!49089 e!49078)))

(declare-fun b!75121 () Bool)

(assert (=> b!75121 (= e!49079 (not call!6694))))

(assert (= (and d!17781 c!11353) b!75092))

(assert (= (and d!17781 (not c!11353)) b!75099))

(assert (= (and b!75092 c!11351) b!75105))

(assert (= (and b!75092 (not c!11351)) b!75086))

(assert (= (or b!75105 b!75086) bm!6674))

(assert (= (or b!75105 b!75086) bm!6678))

(assert (= (or b!75105 b!75086) bm!6690))

(assert (= (and b!75099 c!11359) b!75082))

(assert (= (and b!75099 (not c!11359)) b!75090))

(assert (= (and b!75082 c!11350) b!75117))

(assert (= (and b!75082 (not c!11350)) b!75087))

(assert (= (and b!75117 res!39630) b!75083))

(assert (= (and b!75083 res!39641) b!75108))

(assert (= (and b!75087 c!11355) b!75106))

(assert (= (and b!75087 (not c!11355)) b!75088))

(assert (= (and b!75106 res!39629) b!75118))

(assert (= (and b!75118 res!39634) b!75094))

(assert (= (and b!75088 c!11354) b!75091))

(assert (= (and b!75088 (not c!11354)) b!75115))

(assert (= (and b!75091 res!39639) b!75100))

(assert (= (and b!75100 res!39636) b!75121))

(assert (= (or b!75106 b!75091) bm!6685))

(assert (= (or b!75094 b!75121) bm!6695))

(assert (= (or b!75083 bm!6685) bm!6683))

(assert (= (or b!75117 b!75087) bm!6677))

(assert (= (and b!75090 c!11349) b!75107))

(assert (= (and b!75090 (not c!11349)) b!75085))

(assert (= (and b!75085 c!11348) b!75093))

(assert (= (and b!75085 (not c!11348)) b!75112))

(assert (= (and b!75112 c!11357) b!75110))

(assert (= (and b!75112 (not c!11357)) b!75101))

(assert (= (and b!75110 res!39637) b!75080))

(assert (= (and b!75080 res!39633) b!75114))

(assert (= (and b!75101 c!11356) b!75104))

(assert (= (and b!75101 (not c!11356)) b!75120))

(assert (= (and b!75104 res!39642) b!75103))

(assert (= (and b!75103 res!39635) b!75102))

(assert (= (and b!75120 c!11358) b!75098))

(assert (= (and b!75120 (not c!11358)) b!75081))

(assert (= (and b!75098 res!39638) b!75096))

(assert (= (and b!75096 res!39640) b!75109))

(assert (= (or b!75104 b!75098) bm!6682))

(assert (= (or b!75102 b!75109) bm!6679))

(assert (= (or b!75080 bm!6682) bm!6676))

(assert (= (or b!75110 b!75101) bm!6684))

(assert (= (or b!75107 b!75093) bm!6681))

(assert (= (or b!75117 b!75110) bm!6694))

(assert (= (or b!75082 b!75112) bm!6693))

(assert (= (or b!75087 b!75101) bm!6672))

(assert (= (or bm!6677 bm!6684) bm!6680))

(assert (= (or bm!6683 bm!6676) bm!6687))

(assert (= (or bm!6695 bm!6679) bm!6689))

(assert (= (or b!75082 b!75112) bm!6688))

(assert (= (and bm!6688 c!11347) b!75111))

(assert (= (and bm!6688 (not c!11347)) b!75095))

(assert (= (or bm!6674 b!75112) bm!6673))

(assert (= (or bm!6678 bm!6693) bm!6686))

(assert (= (or bm!6690 b!75112) bm!6675))

(assert (= (and bm!6675 c!11352) b!75084))

(assert (= (and bm!6675 (not c!11352)) b!75097))

(assert (= (and d!17781 res!39632) b!75116))

(assert (= (and b!75116 c!11346) b!75089))

(assert (= (and b!75116 (not c!11346)) b!75113))

(assert (= (and b!75089 res!39631) b!75119))

(assert (= (or b!75119 b!75113) bm!6692))

(assert (= (or b!75089 b!75119 b!75113) bm!6691))

(declare-fun m!74325 () Bool)

(assert (=> bm!6675 m!74325))

(assert (=> bm!6672 m!74111))

(declare-fun m!74327 () Bool)

(assert (=> bm!6672 m!74327))

(declare-fun m!74329 () Bool)

(assert (=> b!75119 m!74329))

(declare-fun m!74331 () Bool)

(assert (=> bm!6686 m!74331))

(declare-fun m!74333 () Bool)

(assert (=> bm!6686 m!74333))

(declare-fun m!74335 () Bool)

(assert (=> bm!6691 m!74335))

(assert (=> b!75089 m!74111))

(declare-fun m!74337 () Bool)

(assert (=> b!75089 m!74337))

(declare-fun m!74339 () Bool)

(assert (=> b!75096 m!74339))

(assert (=> bm!6692 m!74143))

(declare-fun m!74341 () Bool)

(assert (=> b!75114 m!74341))

(declare-fun m!74343 () Bool)

(assert (=> b!75108 m!74343))

(assert (=> bm!6689 m!74111))

(declare-fun m!74345 () Bool)

(assert (=> bm!6689 m!74345))

(assert (=> bm!6680 m!74111))

(declare-fun m!74347 () Bool)

(assert (=> bm!6680 m!74347))

(declare-fun m!74349 () Bool)

(assert (=> b!75105 m!74349))

(assert (=> b!75099 m!74111))

(assert (=> b!75099 m!74347))

(declare-fun m!74351 () Bool)

(assert (=> b!75095 m!74351))

(assert (=> bm!6694 m!74111))

(declare-fun m!74353 () Bool)

(assert (=> bm!6694 m!74353))

(declare-fun m!74355 () Bool)

(assert (=> b!75103 m!74355))

(declare-fun m!74357 () Bool)

(assert (=> b!75112 m!74357))

(declare-fun m!74359 () Bool)

(assert (=> b!75112 m!74359))

(assert (=> b!75112 m!74331))

(declare-fun m!74361 () Bool)

(assert (=> b!75112 m!74361))

(assert (=> b!75112 m!74111))

(declare-fun m!74363 () Bool)

(assert (=> b!75112 m!74363))

(assert (=> b!75112 m!74357))

(declare-fun m!74365 () Bool)

(assert (=> b!75086 m!74365))

(assert (=> bm!6688 m!74111))

(declare-fun m!74367 () Bool)

(assert (=> bm!6688 m!74367))

(assert (=> b!75097 m!74351))

(declare-fun m!74369 () Bool)

(assert (=> b!75118 m!74369))

(declare-fun m!74371 () Bool)

(assert (=> bm!6673 m!74371))

(declare-fun m!74373 () Bool)

(assert (=> b!75100 m!74373))

(assert (=> bm!6681 m!74111))

(declare-fun m!74375 () Bool)

(assert (=> bm!6681 m!74375))

(declare-fun m!74377 () Bool)

(assert (=> d!17781 m!74377))

(assert (=> d!17781 m!74117))

(declare-fun m!74379 () Bool)

(assert (=> bm!6687 m!74379))

(assert (=> b!74796 d!17781))

(declare-fun d!17783 () Bool)

(assert (=> d!17783 (= (valid!304 thiss!992) (valid!303 (v!2539 (underlying!259 thiss!992))))))

(declare-fun bs!3223 () Bool)

(assert (= bs!3223 d!17783))

(declare-fun m!74381 () Bool)

(assert (=> bs!3223 m!74381))

(assert (=> start!9918 d!17783))

(declare-fun d!17785 () Bool)

(declare-fun e!49097 () Bool)

(assert (=> d!17785 e!49097))

(declare-fun res!39648 () Bool)

(assert (=> d!17785 (=> (not res!39648) (not e!49097))))

(declare-fun lt!33850 () ListLongMap!1409)

(assert (=> d!17785 (= res!39648 (contains!723 lt!33850 (_1!1076 lt!33648)))))

(declare-fun lt!33849 () List!1488)

(assert (=> d!17785 (= lt!33850 (ListLongMap!1410 lt!33849))))

(declare-fun lt!33852 () Unit!2147)

(declare-fun lt!33851 () Unit!2147)

(assert (=> d!17785 (= lt!33852 lt!33851)))

(assert (=> d!17785 (= (getValueByKey!132 lt!33849 (_1!1076 lt!33648)) (Some!137 (_2!1076 lt!33648)))))

(declare-fun lemmaContainsTupThenGetReturnValue!52 (List!1488 (_ BitVec 64) V!2953) Unit!2147)

(assert (=> d!17785 (= lt!33851 (lemmaContainsTupThenGetReturnValue!52 lt!33849 (_1!1076 lt!33648) (_2!1076 lt!33648)))))

(declare-fun insertStrictlySorted!55 (List!1488 (_ BitVec 64) V!2953) List!1488)

(assert (=> d!17785 (= lt!33849 (insertStrictlySorted!55 (toList!720 (+!95 lt!33649 lt!33653)) (_1!1076 lt!33648) (_2!1076 lt!33648)))))

(assert (=> d!17785 (= (+!95 (+!95 lt!33649 lt!33653) lt!33648) lt!33850)))

(declare-fun b!75126 () Bool)

(declare-fun res!39647 () Bool)

(assert (=> b!75126 (=> (not res!39647) (not e!49097))))

(assert (=> b!75126 (= res!39647 (= (getValueByKey!132 (toList!720 lt!33850) (_1!1076 lt!33648)) (Some!137 (_2!1076 lt!33648))))))

(declare-fun b!75127 () Bool)

(declare-fun contains!725 (List!1488 tuple2!2130) Bool)

(assert (=> b!75127 (= e!49097 (contains!725 (toList!720 lt!33850) lt!33648))))

(assert (= (and d!17785 res!39648) b!75126))

(assert (= (and b!75126 res!39647) b!75127))

(declare-fun m!74383 () Bool)

(assert (=> d!17785 m!74383))

(declare-fun m!74385 () Bool)

(assert (=> d!17785 m!74385))

(declare-fun m!74387 () Bool)

(assert (=> d!17785 m!74387))

(declare-fun m!74389 () Bool)

(assert (=> d!17785 m!74389))

(declare-fun m!74391 () Bool)

(assert (=> b!75126 m!74391))

(declare-fun m!74393 () Bool)

(assert (=> b!75127 m!74393))

(assert (=> b!74795 d!17785))

(declare-fun d!17787 () Bool)

(declare-fun e!49098 () Bool)

(assert (=> d!17787 e!49098))

(declare-fun res!39650 () Bool)

(assert (=> d!17787 (=> (not res!39650) (not e!49098))))

(declare-fun lt!33854 () ListLongMap!1409)

(assert (=> d!17787 (= res!39650 (contains!723 lt!33854 (_1!1076 lt!33653)))))

(declare-fun lt!33853 () List!1488)

(assert (=> d!17787 (= lt!33854 (ListLongMap!1410 lt!33853))))

(declare-fun lt!33856 () Unit!2147)

(declare-fun lt!33855 () Unit!2147)

(assert (=> d!17787 (= lt!33856 lt!33855)))

(assert (=> d!17787 (= (getValueByKey!132 lt!33853 (_1!1076 lt!33653)) (Some!137 (_2!1076 lt!33653)))))

(assert (=> d!17787 (= lt!33855 (lemmaContainsTupThenGetReturnValue!52 lt!33853 (_1!1076 lt!33653) (_2!1076 lt!33653)))))

(assert (=> d!17787 (= lt!33853 (insertStrictlySorted!55 (toList!720 (+!95 lt!33649 lt!33648)) (_1!1076 lt!33653) (_2!1076 lt!33653)))))

(assert (=> d!17787 (= (+!95 (+!95 lt!33649 lt!33648) lt!33653) lt!33854)))

(declare-fun b!75128 () Bool)

(declare-fun res!39649 () Bool)

(assert (=> b!75128 (=> (not res!39649) (not e!49098))))

(assert (=> b!75128 (= res!39649 (= (getValueByKey!132 (toList!720 lt!33854) (_1!1076 lt!33653)) (Some!137 (_2!1076 lt!33653))))))

(declare-fun b!75129 () Bool)

(assert (=> b!75129 (= e!49098 (contains!725 (toList!720 lt!33854) lt!33653))))

(assert (= (and d!17787 res!39650) b!75128))

(assert (= (and b!75128 res!39649) b!75129))

(declare-fun m!74395 () Bool)

(assert (=> d!17787 m!74395))

(declare-fun m!74397 () Bool)

(assert (=> d!17787 m!74397))

(declare-fun m!74399 () Bool)

(assert (=> d!17787 m!74399))

(declare-fun m!74401 () Bool)

(assert (=> d!17787 m!74401))

(declare-fun m!74403 () Bool)

(assert (=> b!75128 m!74403))

(declare-fun m!74405 () Bool)

(assert (=> b!75129 m!74405))

(assert (=> b!74795 d!17787))

(declare-fun b!75154 () Bool)

(declare-fun e!49114 () Bool)

(declare-fun e!49116 () Bool)

(assert (=> b!75154 (= e!49114 e!49116)))

(declare-fun c!11369 () Bool)

(declare-fun e!49119 () Bool)

(assert (=> b!75154 (= c!11369 e!49119)))

(declare-fun res!39661 () Bool)

(assert (=> b!75154 (=> (not res!39661) (not e!49119))))

(assert (=> b!75154 (= res!39661 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun bm!6698 () Bool)

(declare-fun call!6701 () ListLongMap!1409)

(assert (=> bm!6698 (= call!6701 (getCurrentListMapNoExtraKeys!59 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun b!75155 () Bool)

(declare-fun e!49117 () ListLongMap!1409)

(assert (=> b!75155 (= e!49117 (ListLongMap!1410 Nil!1485))))

(declare-fun b!75156 () Bool)

(declare-fun lt!33877 () Unit!2147)

(declare-fun lt!33873 () Unit!2147)

(assert (=> b!75156 (= lt!33877 lt!33873)))

(declare-fun lt!33874 () ListLongMap!1409)

(declare-fun lt!33872 () V!2953)

(declare-fun lt!33876 () (_ BitVec 64))

(declare-fun lt!33875 () (_ BitVec 64))

(assert (=> b!75156 (not (contains!723 (+!95 lt!33874 (tuple2!2131 lt!33875 lt!33872)) lt!33876))))

(declare-fun addStillNotContains!26 (ListLongMap!1409 (_ BitVec 64) V!2953 (_ BitVec 64)) Unit!2147)

(assert (=> b!75156 (= lt!33873 (addStillNotContains!26 lt!33874 lt!33875 lt!33872 lt!33876))))

(assert (=> b!75156 (= lt!33876 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!75156 (= lt!33872 (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75156 (= lt!33875 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!75156 (= lt!33874 call!6701)))

(declare-fun e!49113 () ListLongMap!1409)

(assert (=> b!75156 (= e!49113 (+!95 call!6701 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!75157 () Bool)

(declare-fun e!49115 () Bool)

(assert (=> b!75157 (= e!49116 e!49115)))

(declare-fun c!11370 () Bool)

(assert (=> b!75157 (= c!11370 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun d!17789 () Bool)

(assert (=> d!17789 e!49114))

(declare-fun res!39662 () Bool)

(assert (=> d!17789 (=> (not res!39662) (not e!49114))))

(declare-fun lt!33871 () ListLongMap!1409)

(assert (=> d!17789 (= res!39662 (not (contains!723 lt!33871 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17789 (= lt!33871 e!49117)))

(declare-fun c!11368 () Bool)

(assert (=> d!17789 (= c!11368 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(assert (=> d!17789 (validMask!0 (mask!6209 (v!2539 (underlying!259 thiss!992))))))

(assert (=> d!17789 (= (getCurrentListMapNoExtraKeys!59 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))) lt!33871)))

(declare-fun b!75158 () Bool)

(declare-fun isEmpty!323 (ListLongMap!1409) Bool)

(assert (=> b!75158 (= e!49115 (isEmpty!323 lt!33871))))

(declare-fun b!75159 () Bool)

(assert (=> b!75159 (= e!49119 (validKeyInArray!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!75159 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!75160 () Bool)

(assert (=> b!75160 (= e!49113 call!6701)))

(declare-fun b!75161 () Bool)

(assert (=> b!75161 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(assert (=> b!75161 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2093 (_values!2216 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun e!49118 () Bool)

(declare-fun apply!76 (ListLongMap!1409 (_ BitVec 64)) V!2953)

(assert (=> b!75161 (= e!49118 (= (apply!76 lt!33871 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!75162 () Bool)

(assert (=> b!75162 (= e!49117 e!49113)))

(declare-fun c!11371 () Bool)

(assert (=> b!75162 (= c!11371 (validKeyInArray!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!75163 () Bool)

(assert (=> b!75163 (= e!49116 e!49118)))

(assert (=> b!75163 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun res!39659 () Bool)

(assert (=> b!75163 (= res!39659 (contains!723 lt!33871 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!75163 (=> (not res!39659) (not e!49118))))

(declare-fun b!75164 () Bool)

(assert (=> b!75164 (= e!49115 (= lt!33871 (getCurrentListMapNoExtraKeys!59 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun b!75165 () Bool)

(declare-fun res!39660 () Bool)

(assert (=> b!75165 (=> (not res!39660) (not e!49114))))

(assert (=> b!75165 (= res!39660 (not (contains!723 lt!33871 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17789 c!11368) b!75155))

(assert (= (and d!17789 (not c!11368)) b!75162))

(assert (= (and b!75162 c!11371) b!75156))

(assert (= (and b!75162 (not c!11371)) b!75160))

(assert (= (or b!75156 b!75160) bm!6698))

(assert (= (and d!17789 res!39662) b!75165))

(assert (= (and b!75165 res!39660) b!75154))

(assert (= (and b!75154 res!39661) b!75159))

(assert (= (and b!75154 c!11369) b!75163))

(assert (= (and b!75154 (not c!11369)) b!75157))

(assert (= (and b!75163 res!39659) b!75161))

(assert (= (and b!75157 c!11370) b!75164))

(assert (= (and b!75157 (not c!11370)) b!75158))

(declare-fun b_lambda!3365 () Bool)

(assert (=> (not b_lambda!3365) (not b!75156)))

(assert (=> b!75156 t!5054))

(declare-fun b_and!4589 () Bool)

(assert (= b_and!4569 (and (=> t!5054 result!2697) b_and!4589)))

(assert (=> b!75156 t!5056))

(declare-fun b_and!4591 () Bool)

(assert (= b_and!4571 (and (=> t!5056 result!2701) b_and!4591)))

(declare-fun b_lambda!3367 () Bool)

(assert (=> (not b_lambda!3367) (not b!75161)))

(assert (=> b!75161 t!5054))

(declare-fun b_and!4593 () Bool)

(assert (= b_and!4589 (and (=> t!5054 result!2697) b_and!4593)))

(assert (=> b!75161 t!5056))

(declare-fun b_and!4595 () Bool)

(assert (= b_and!4591 (and (=> t!5056 result!2701) b_and!4595)))

(declare-fun m!74407 () Bool)

(assert (=> b!75161 m!74407))

(assert (=> b!75161 m!74131))

(declare-fun m!74409 () Bool)

(assert (=> b!75161 m!74409))

(assert (=> b!75161 m!74305))

(declare-fun m!74411 () Bool)

(assert (=> b!75161 m!74411))

(assert (=> b!75161 m!74131))

(assert (=> b!75161 m!74407))

(assert (=> b!75161 m!74305))

(declare-fun m!74413 () Bool)

(assert (=> bm!6698 m!74413))

(declare-fun m!74415 () Bool)

(assert (=> b!75165 m!74415))

(declare-fun m!74417 () Bool)

(assert (=> d!17789 m!74417))

(assert (=> d!17789 m!74149))

(assert (=> b!75159 m!74305))

(assert (=> b!75159 m!74305))

(declare-fun m!74419 () Bool)

(assert (=> b!75159 m!74419))

(declare-fun m!74421 () Bool)

(assert (=> b!75158 m!74421))

(assert (=> b!75164 m!74413))

(assert (=> b!75163 m!74305))

(assert (=> b!75163 m!74305))

(declare-fun m!74423 () Bool)

(assert (=> b!75163 m!74423))

(assert (=> b!75162 m!74305))

(assert (=> b!75162 m!74305))

(assert (=> b!75162 m!74419))

(declare-fun m!74425 () Bool)

(assert (=> b!75156 m!74425))

(declare-fun m!74427 () Bool)

(assert (=> b!75156 m!74427))

(declare-fun m!74429 () Bool)

(assert (=> b!75156 m!74429))

(assert (=> b!75156 m!74407))

(assert (=> b!75156 m!74131))

(assert (=> b!75156 m!74409))

(assert (=> b!75156 m!74427))

(declare-fun m!74431 () Bool)

(assert (=> b!75156 m!74431))

(assert (=> b!75156 m!74131))

(assert (=> b!75156 m!74407))

(assert (=> b!75156 m!74305))

(assert (=> b!74795 d!17789))

(declare-fun d!17791 () Bool)

(assert (=> d!17791 (= (+!95 (+!95 lt!33649 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) (+!95 (+!95 lt!33649 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)))))

(declare-fun lt!33880 () Unit!2147)

(declare-fun choose!433 (ListLongMap!1409 (_ BitVec 64) V!2953 (_ BitVec 64) V!2953) Unit!2147)

(assert (=> d!17791 (= lt!33880 (choose!433 lt!33649 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))

(assert (=> d!17791 (not (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17791 (= (addCommutativeForDiffKeys!14 lt!33649 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))) lt!33880)))

(declare-fun bs!3224 () Bool)

(assert (= bs!3224 d!17791))

(declare-fun m!74433 () Bool)

(assert (=> bs!3224 m!74433))

(assert (=> bs!3224 m!74111))

(declare-fun m!74435 () Bool)

(assert (=> bs!3224 m!74435))

(assert (=> bs!3224 m!74433))

(declare-fun m!74437 () Bool)

(assert (=> bs!3224 m!74437))

(declare-fun m!74439 () Bool)

(assert (=> bs!3224 m!74439))

(assert (=> bs!3224 m!74439))

(declare-fun m!74441 () Bool)

(assert (=> bs!3224 m!74441))

(assert (=> b!74795 d!17791))

(declare-fun d!17793 () Bool)

(declare-fun e!49120 () Bool)

(assert (=> d!17793 e!49120))

(declare-fun res!39664 () Bool)

(assert (=> d!17793 (=> (not res!39664) (not e!49120))))

(declare-fun lt!33882 () ListLongMap!1409)

(assert (=> d!17793 (= res!39664 (contains!723 lt!33882 (_1!1076 lt!33653)))))

(declare-fun lt!33881 () List!1488)

(assert (=> d!17793 (= lt!33882 (ListLongMap!1410 lt!33881))))

(declare-fun lt!33884 () Unit!2147)

(declare-fun lt!33883 () Unit!2147)

(assert (=> d!17793 (= lt!33884 lt!33883)))

(assert (=> d!17793 (= (getValueByKey!132 lt!33881 (_1!1076 lt!33653)) (Some!137 (_2!1076 lt!33653)))))

(assert (=> d!17793 (= lt!33883 (lemmaContainsTupThenGetReturnValue!52 lt!33881 (_1!1076 lt!33653) (_2!1076 lt!33653)))))

(assert (=> d!17793 (= lt!33881 (insertStrictlySorted!55 (toList!720 lt!33649) (_1!1076 lt!33653) (_2!1076 lt!33653)))))

(assert (=> d!17793 (= (+!95 lt!33649 lt!33653) lt!33882)))

(declare-fun b!75166 () Bool)

(declare-fun res!39663 () Bool)

(assert (=> b!75166 (=> (not res!39663) (not e!49120))))

(assert (=> b!75166 (= res!39663 (= (getValueByKey!132 (toList!720 lt!33882) (_1!1076 lt!33653)) (Some!137 (_2!1076 lt!33653))))))

(declare-fun b!75167 () Bool)

(assert (=> b!75167 (= e!49120 (contains!725 (toList!720 lt!33882) lt!33653))))

(assert (= (and d!17793 res!39664) b!75166))

(assert (= (and b!75166 res!39663) b!75167))

(declare-fun m!74443 () Bool)

(assert (=> d!17793 m!74443))

(declare-fun m!74445 () Bool)

(assert (=> d!17793 m!74445))

(declare-fun m!74447 () Bool)

(assert (=> d!17793 m!74447))

(declare-fun m!74449 () Bool)

(assert (=> d!17793 m!74449))

(declare-fun m!74451 () Bool)

(assert (=> b!75166 m!74451))

(declare-fun m!74453 () Bool)

(assert (=> b!75167 m!74453))

(assert (=> b!74795 d!17793))

(declare-fun d!17795 () Bool)

(declare-fun e!49121 () Bool)

(assert (=> d!17795 e!49121))

(declare-fun res!39666 () Bool)

(assert (=> d!17795 (=> (not res!39666) (not e!49121))))

(declare-fun lt!33886 () ListLongMap!1409)

(assert (=> d!17795 (= res!39666 (contains!723 lt!33886 (_1!1076 lt!33648)))))

(declare-fun lt!33885 () List!1488)

(assert (=> d!17795 (= lt!33886 (ListLongMap!1410 lt!33885))))

(declare-fun lt!33888 () Unit!2147)

(declare-fun lt!33887 () Unit!2147)

(assert (=> d!17795 (= lt!33888 lt!33887)))

(assert (=> d!17795 (= (getValueByKey!132 lt!33885 (_1!1076 lt!33648)) (Some!137 (_2!1076 lt!33648)))))

(assert (=> d!17795 (= lt!33887 (lemmaContainsTupThenGetReturnValue!52 lt!33885 (_1!1076 lt!33648) (_2!1076 lt!33648)))))

(assert (=> d!17795 (= lt!33885 (insertStrictlySorted!55 (toList!720 lt!33649) (_1!1076 lt!33648) (_2!1076 lt!33648)))))

(assert (=> d!17795 (= (+!95 lt!33649 lt!33648) lt!33886)))

(declare-fun b!75168 () Bool)

(declare-fun res!39665 () Bool)

(assert (=> b!75168 (=> (not res!39665) (not e!49121))))

(assert (=> b!75168 (= res!39665 (= (getValueByKey!132 (toList!720 lt!33886) (_1!1076 lt!33648)) (Some!137 (_2!1076 lt!33648))))))

(declare-fun b!75169 () Bool)

(assert (=> b!75169 (= e!49121 (contains!725 (toList!720 lt!33886) lt!33648))))

(assert (= (and d!17795 res!39666) b!75168))

(assert (= (and b!75168 res!39665) b!75169))

(declare-fun m!74455 () Bool)

(assert (=> d!17795 m!74455))

(declare-fun m!74457 () Bool)

(assert (=> d!17795 m!74457))

(declare-fun m!74459 () Bool)

(assert (=> d!17795 m!74459))

(declare-fun m!74461 () Bool)

(assert (=> d!17795 m!74461))

(declare-fun m!74463 () Bool)

(assert (=> b!75168 m!74463))

(declare-fun m!74465 () Bool)

(assert (=> b!75169 m!74465))

(assert (=> b!74795 d!17795))

(declare-fun d!17797 () Bool)

(assert (=> d!17797 (= (validMask!0 (mask!6209 (v!2539 (underlying!259 thiss!992)))) (and (or (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000001111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000011111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000001111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000011111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000001111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000011111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000000001111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000000011111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000000111111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000001111111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000011111111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000000111111111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000001111111111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000011111111111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000000111111111111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000001111111111111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000011111111111111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000000111111111111111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000001111111111111111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000011111111111111111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00000111111111111111111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00001111111111111111111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00011111111111111111111111111111) (= (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6209 (v!2539 (underlying!259 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!74795 d!17797))

(declare-fun d!17799 () Bool)

(assert (=> d!17799 (= (map!1155 newMap!16) (getCurrentListMap!413 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun bs!3225 () Bool)

(assert (= bs!3225 d!17799))

(assert (=> bs!3225 m!74351))

(assert (=> b!74782 d!17799))

(declare-fun b!75212 () Bool)

(declare-fun e!49157 () Bool)

(declare-fun e!49152 () Bool)

(assert (=> b!75212 (= e!49157 e!49152)))

(declare-fun res!39689 () Bool)

(assert (=> b!75212 (=> (not res!39689) (not e!49152))))

(declare-fun lt!33943 () ListLongMap!1409)

(assert (=> b!75212 (= res!39689 (contains!723 lt!33943 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!75212 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun b!75213 () Bool)

(declare-fun e!49160 () Bool)

(declare-fun e!49150 () Bool)

(assert (=> b!75213 (= e!49160 e!49150)))

(declare-fun c!11388 () Bool)

(assert (=> b!75213 (= c!11388 (not (= (bvand (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75214 () Bool)

(declare-fun res!39693 () Bool)

(assert (=> b!75214 (=> (not res!39693) (not e!49160))))

(declare-fun e!49154 () Bool)

(assert (=> b!75214 (= res!39693 e!49154)))

(declare-fun c!11384 () Bool)

(assert (=> b!75214 (= c!11384 (not (= (bvand (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!75215 () Bool)

(declare-fun e!49153 () Bool)

(assert (=> b!75215 (= e!49150 e!49153)))

(declare-fun res!39686 () Bool)

(declare-fun call!6719 () Bool)

(assert (=> b!75215 (= res!39686 call!6719)))

(assert (=> b!75215 (=> (not res!39686) (not e!49153))))

(declare-fun b!75216 () Bool)

(declare-fun e!49155 () ListLongMap!1409)

(declare-fun call!6720 () ListLongMap!1409)

(assert (=> b!75216 (= e!49155 call!6720)))

(declare-fun b!75217 () Bool)

(declare-fun call!6718 () ListLongMap!1409)

(assert (=> b!75217 (= e!49155 call!6718)))

(declare-fun b!75218 () Bool)

(declare-fun e!49158 () Unit!2147)

(declare-fun lt!33939 () Unit!2147)

(assert (=> b!75218 (= e!49158 lt!33939)))

(declare-fun lt!33938 () ListLongMap!1409)

(assert (=> b!75218 (= lt!33938 (getCurrentListMapNoExtraKeys!59 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun lt!33937 () (_ BitVec 64))

(assert (=> b!75218 (= lt!33937 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33953 () (_ BitVec 64))

(assert (=> b!75218 (= lt!33953 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!33942 () Unit!2147)

(declare-fun addStillContains!52 (ListLongMap!1409 (_ BitVec 64) V!2953 (_ BitVec 64)) Unit!2147)

(assert (=> b!75218 (= lt!33942 (addStillContains!52 lt!33938 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) lt!33953))))

(assert (=> b!75218 (contains!723 (+!95 lt!33938 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!33953)))

(declare-fun lt!33950 () Unit!2147)

(assert (=> b!75218 (= lt!33950 lt!33942)))

(declare-fun lt!33935 () ListLongMap!1409)

(assert (=> b!75218 (= lt!33935 (getCurrentListMapNoExtraKeys!59 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun lt!33951 () (_ BitVec 64))

(assert (=> b!75218 (= lt!33951 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33940 () (_ BitVec 64))

(assert (=> b!75218 (= lt!33940 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!33933 () Unit!2147)

(declare-fun addApplyDifferent!52 (ListLongMap!1409 (_ BitVec 64) V!2953 (_ BitVec 64)) Unit!2147)

(assert (=> b!75218 (= lt!33933 (addApplyDifferent!52 lt!33935 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992))) lt!33940))))

(assert (=> b!75218 (= (apply!76 (+!95 lt!33935 (tuple2!2131 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!33940) (apply!76 lt!33935 lt!33940))))

(declare-fun lt!33947 () Unit!2147)

(assert (=> b!75218 (= lt!33947 lt!33933)))

(declare-fun lt!33952 () ListLongMap!1409)

(assert (=> b!75218 (= lt!33952 (getCurrentListMapNoExtraKeys!59 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun lt!33945 () (_ BitVec 64))

(assert (=> b!75218 (= lt!33945 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33944 () (_ BitVec 64))

(assert (=> b!75218 (= lt!33944 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!33948 () Unit!2147)

(assert (=> b!75218 (= lt!33948 (addApplyDifferent!52 lt!33952 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) lt!33944))))

(assert (=> b!75218 (= (apply!76 (+!95 lt!33952 (tuple2!2131 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!33944) (apply!76 lt!33952 lt!33944))))

(declare-fun lt!33934 () Unit!2147)

(assert (=> b!75218 (= lt!33934 lt!33948)))

(declare-fun lt!33946 () ListLongMap!1409)

(assert (=> b!75218 (= lt!33946 (getCurrentListMapNoExtraKeys!59 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun lt!33941 () (_ BitVec 64))

(assert (=> b!75218 (= lt!33941 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33954 () (_ BitVec 64))

(assert (=> b!75218 (= lt!33954 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!75218 (= lt!33939 (addApplyDifferent!52 lt!33946 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992))) lt!33954))))

(assert (=> b!75218 (= (apply!76 (+!95 lt!33946 (tuple2!2131 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!33954) (apply!76 lt!33946 lt!33954))))

(declare-fun bm!6713 () Bool)

(declare-fun call!6721 () Bool)

(assert (=> bm!6713 (= call!6721 (contains!723 lt!33943 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75219 () Bool)

(declare-fun res!39688 () Bool)

(assert (=> b!75219 (=> (not res!39688) (not e!49160))))

(assert (=> b!75219 (= res!39688 e!49157)))

(declare-fun res!39692 () Bool)

(assert (=> b!75219 (=> res!39692 e!49157)))

(declare-fun e!49151 () Bool)

(assert (=> b!75219 (= res!39692 (not e!49151))))

(declare-fun res!39690 () Bool)

(assert (=> b!75219 (=> (not res!39690) (not e!49151))))

(assert (=> b!75219 (= res!39690 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun b!75220 () Bool)

(assert (=> b!75220 (= e!49151 (validKeyInArray!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!75221 () Bool)

(assert (=> b!75221 (= e!49150 (not call!6719))))

(declare-fun b!75222 () Bool)

(assert (=> b!75222 (= e!49152 (= (apply!76 lt!33943 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75222 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2093 (_values!2216 (v!2539 (underlying!259 thiss!992))))))))

(assert (=> b!75222 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun bm!6714 () Bool)

(assert (=> bm!6714 (= call!6719 (contains!723 lt!33943 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6715 () Bool)

(declare-fun call!6722 () ListLongMap!1409)

(declare-fun call!6717 () ListLongMap!1409)

(assert (=> bm!6715 (= call!6722 call!6717)))

(declare-fun b!75223 () Bool)

(declare-fun e!49156 () ListLongMap!1409)

(assert (=> b!75223 (= e!49156 call!6720)))

(declare-fun b!75224 () Bool)

(declare-fun Unit!2157 () Unit!2147)

(assert (=> b!75224 (= e!49158 Unit!2157)))

(declare-fun bm!6716 () Bool)

(declare-fun call!6716 () ListLongMap!1409)

(assert (=> bm!6716 (= call!6720 call!6716)))

(declare-fun b!75225 () Bool)

(assert (=> b!75225 (= e!49153 (= (apply!76 lt!33943 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun b!75226 () Bool)

(declare-fun e!49159 () Bool)

(assert (=> b!75226 (= e!49159 (= (apply!76 lt!33943 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun b!75227 () Bool)

(declare-fun c!11386 () Bool)

(assert (=> b!75227 (= c!11386 (and (not (= (bvand (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!75227 (= e!49156 e!49155)))

(declare-fun d!17801 () Bool)

(assert (=> d!17801 e!49160))

(declare-fun res!39691 () Bool)

(assert (=> d!17801 (=> (not res!39691) (not e!49160))))

(assert (=> d!17801 (= res!39691 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))))

(declare-fun lt!33936 () ListLongMap!1409)

(assert (=> d!17801 (= lt!33943 lt!33936)))

(declare-fun lt!33949 () Unit!2147)

(assert (=> d!17801 (= lt!33949 e!49158)))

(declare-fun c!11389 () Bool)

(declare-fun e!49149 () Bool)

(assert (=> d!17801 (= c!11389 e!49149)))

(declare-fun res!39687 () Bool)

(assert (=> d!17801 (=> (not res!39687) (not e!49149))))

(assert (=> d!17801 (= res!39687 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun e!49148 () ListLongMap!1409)

(assert (=> d!17801 (= lt!33936 e!49148)))

(declare-fun c!11387 () Bool)

(assert (=> d!17801 (= c!11387 (and (not (= (bvand (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!17801 (validMask!0 (mask!6209 (v!2539 (underlying!259 thiss!992))))))

(assert (=> d!17801 (= (getCurrentListMap!413 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))) lt!33943)))

(declare-fun bm!6717 () Bool)

(assert (=> bm!6717 (= call!6717 (getCurrentListMapNoExtraKeys!59 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun b!75228 () Bool)

(assert (=> b!75228 (= e!49148 e!49156)))

(declare-fun c!11385 () Bool)

(assert (=> b!75228 (= c!11385 (and (not (= (bvand (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6718 () Bool)

(assert (=> bm!6718 (= call!6716 (+!95 (ite c!11387 call!6717 (ite c!11385 call!6722 call!6718)) (ite (or c!11387 c!11385) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(declare-fun bm!6719 () Bool)

(assert (=> bm!6719 (= call!6718 call!6722)))

(declare-fun b!75229 () Bool)

(assert (=> b!75229 (= e!49148 (+!95 call!6716 (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun b!75230 () Bool)

(assert (=> b!75230 (= e!49154 (not call!6721))))

(declare-fun b!75231 () Bool)

(assert (=> b!75231 (= e!49154 e!49159)))

(declare-fun res!39685 () Bool)

(assert (=> b!75231 (= res!39685 call!6721)))

(assert (=> b!75231 (=> (not res!39685) (not e!49159))))

(declare-fun b!75232 () Bool)

(assert (=> b!75232 (= e!49149 (validKeyInArray!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!17801 c!11387) b!75229))

(assert (= (and d!17801 (not c!11387)) b!75228))

(assert (= (and b!75228 c!11385) b!75223))

(assert (= (and b!75228 (not c!11385)) b!75227))

(assert (= (and b!75227 c!11386) b!75216))

(assert (= (and b!75227 (not c!11386)) b!75217))

(assert (= (or b!75216 b!75217) bm!6719))

(assert (= (or b!75223 bm!6719) bm!6715))

(assert (= (or b!75223 b!75216) bm!6716))

(assert (= (or b!75229 bm!6715) bm!6717))

(assert (= (or b!75229 bm!6716) bm!6718))

(assert (= (and d!17801 res!39687) b!75232))

(assert (= (and d!17801 c!11389) b!75218))

(assert (= (and d!17801 (not c!11389)) b!75224))

(assert (= (and d!17801 res!39691) b!75219))

(assert (= (and b!75219 res!39690) b!75220))

(assert (= (and b!75219 (not res!39692)) b!75212))

(assert (= (and b!75212 res!39689) b!75222))

(assert (= (and b!75219 res!39688) b!75214))

(assert (= (and b!75214 c!11384) b!75231))

(assert (= (and b!75214 (not c!11384)) b!75230))

(assert (= (and b!75231 res!39685) b!75226))

(assert (= (or b!75231 b!75230) bm!6713))

(assert (= (and b!75214 res!39693) b!75213))

(assert (= (and b!75213 c!11388) b!75215))

(assert (= (and b!75213 (not c!11388)) b!75221))

(assert (= (and b!75215 res!39686) b!75225))

(assert (= (or b!75215 b!75221) bm!6714))

(declare-fun b_lambda!3369 () Bool)

(assert (=> (not b_lambda!3369) (not b!75222)))

(assert (=> b!75222 t!5054))

(declare-fun b_and!4597 () Bool)

(assert (= b_and!4593 (and (=> t!5054 result!2697) b_and!4597)))

(assert (=> b!75222 t!5056))

(declare-fun b_and!4599 () Bool)

(assert (= b_and!4595 (and (=> t!5056 result!2701) b_and!4599)))

(assert (=> b!75222 m!74407))

(assert (=> b!75222 m!74131))

(assert (=> b!75222 m!74409))

(assert (=> b!75222 m!74305))

(declare-fun m!74467 () Bool)

(assert (=> b!75222 m!74467))

(assert (=> b!75222 m!74407))

(assert (=> b!75222 m!74305))

(assert (=> b!75222 m!74131))

(declare-fun m!74469 () Bool)

(assert (=> bm!6718 m!74469))

(assert (=> d!17801 m!74149))

(declare-fun m!74471 () Bool)

(assert (=> b!75218 m!74471))

(declare-fun m!74473 () Bool)

(assert (=> b!75218 m!74473))

(declare-fun m!74475 () Bool)

(assert (=> b!75218 m!74475))

(declare-fun m!74477 () Bool)

(assert (=> b!75218 m!74477))

(declare-fun m!74479 () Bool)

(assert (=> b!75218 m!74479))

(assert (=> b!75218 m!74477))

(declare-fun m!74481 () Bool)

(assert (=> b!75218 m!74481))

(declare-fun m!74483 () Bool)

(assert (=> b!75218 m!74483))

(declare-fun m!74485 () Bool)

(assert (=> b!75218 m!74485))

(declare-fun m!74487 () Bool)

(assert (=> b!75218 m!74487))

(declare-fun m!74489 () Bool)

(assert (=> b!75218 m!74489))

(declare-fun m!74491 () Bool)

(assert (=> b!75218 m!74491))

(assert (=> b!75218 m!74475))

(declare-fun m!74493 () Bool)

(assert (=> b!75218 m!74493))

(declare-fun m!74495 () Bool)

(assert (=> b!75218 m!74495))

(declare-fun m!74497 () Bool)

(assert (=> b!75218 m!74497))

(assert (=> b!75218 m!74495))

(assert (=> b!75218 m!74305))

(assert (=> b!75218 m!74485))

(assert (=> b!75218 m!74157))

(declare-fun m!74499 () Bool)

(assert (=> b!75218 m!74499))

(declare-fun m!74501 () Bool)

(assert (=> bm!6713 m!74501))

(declare-fun m!74503 () Bool)

(assert (=> b!75225 m!74503))

(assert (=> b!75232 m!74305))

(assert (=> b!75232 m!74305))

(assert (=> b!75232 m!74419))

(assert (=> bm!6717 m!74157))

(declare-fun m!74505 () Bool)

(assert (=> b!75226 m!74505))

(declare-fun m!74507 () Bool)

(assert (=> b!75229 m!74507))

(declare-fun m!74509 () Bool)

(assert (=> bm!6714 m!74509))

(assert (=> b!75212 m!74305))

(assert (=> b!75212 m!74305))

(declare-fun m!74511 () Bool)

(assert (=> b!75212 m!74511))

(assert (=> b!75220 m!74305))

(assert (=> b!75220 m!74305))

(assert (=> b!75220 m!74419))

(assert (=> b!74782 d!17801))

(declare-fun mapIsEmpty!3207 () Bool)

(declare-fun mapRes!3207 () Bool)

(assert (=> mapIsEmpty!3207 mapRes!3207))

(declare-fun b!75239 () Bool)

(declare-fun e!49165 () Bool)

(assert (=> b!75239 (= e!49165 tp_is_empty!2479)))

(declare-fun mapNonEmpty!3207 () Bool)

(declare-fun tp!8589 () Bool)

(assert (=> mapNonEmpty!3207 (= mapRes!3207 (and tp!8589 e!49165))))

(declare-fun mapValue!3207 () ValueCell!896)

(declare-fun mapKey!3207 () (_ BitVec 32))

(declare-fun mapRest!3207 () (Array (_ BitVec 32) ValueCell!896))

(assert (=> mapNonEmpty!3207 (= mapRest!3192 (store mapRest!3207 mapKey!3207 mapValue!3207))))

(declare-fun condMapEmpty!3207 () Bool)

(declare-fun mapDefault!3207 () ValueCell!896)

(assert (=> mapNonEmpty!3191 (= condMapEmpty!3207 (= mapRest!3192 ((as const (Array (_ BitVec 32) ValueCell!896)) mapDefault!3207)))))

(declare-fun e!49166 () Bool)

(assert (=> mapNonEmpty!3191 (= tp!8560 (and e!49166 mapRes!3207))))

(declare-fun b!75240 () Bool)

(assert (=> b!75240 (= e!49166 tp_is_empty!2479)))

(assert (= (and mapNonEmpty!3191 condMapEmpty!3207) mapIsEmpty!3207))

(assert (= (and mapNonEmpty!3191 (not condMapEmpty!3207)) mapNonEmpty!3207))

(assert (= (and mapNonEmpty!3207 ((_ is ValueCellFull!896) mapValue!3207)) b!75239))

(assert (= (and mapNonEmpty!3191 ((_ is ValueCellFull!896) mapDefault!3207)) b!75240))

(declare-fun m!74513 () Bool)

(assert (=> mapNonEmpty!3207 m!74513))

(declare-fun mapIsEmpty!3208 () Bool)

(declare-fun mapRes!3208 () Bool)

(assert (=> mapIsEmpty!3208 mapRes!3208))

(declare-fun b!75241 () Bool)

(declare-fun e!49167 () Bool)

(assert (=> b!75241 (= e!49167 tp_is_empty!2479)))

(declare-fun mapNonEmpty!3208 () Bool)

(declare-fun tp!8590 () Bool)

(assert (=> mapNonEmpty!3208 (= mapRes!3208 (and tp!8590 e!49167))))

(declare-fun mapValue!3208 () ValueCell!896)

(declare-fun mapRest!3208 () (Array (_ BitVec 32) ValueCell!896))

(declare-fun mapKey!3208 () (_ BitVec 32))

(assert (=> mapNonEmpty!3208 (= mapRest!3191 (store mapRest!3208 mapKey!3208 mapValue!3208))))

(declare-fun condMapEmpty!3208 () Bool)

(declare-fun mapDefault!3208 () ValueCell!896)

(assert (=> mapNonEmpty!3192 (= condMapEmpty!3208 (= mapRest!3191 ((as const (Array (_ BitVec 32) ValueCell!896)) mapDefault!3208)))))

(declare-fun e!49168 () Bool)

(assert (=> mapNonEmpty!3192 (= tp!8559 (and e!49168 mapRes!3208))))

(declare-fun b!75242 () Bool)

(assert (=> b!75242 (= e!49168 tp_is_empty!2479)))

(assert (= (and mapNonEmpty!3192 condMapEmpty!3208) mapIsEmpty!3208))

(assert (= (and mapNonEmpty!3192 (not condMapEmpty!3208)) mapNonEmpty!3208))

(assert (= (and mapNonEmpty!3208 ((_ is ValueCellFull!896) mapValue!3208)) b!75241))

(assert (= (and mapNonEmpty!3192 ((_ is ValueCellFull!896) mapDefault!3208)) b!75242))

(declare-fun m!74515 () Bool)

(assert (=> mapNonEmpty!3208 m!74515))

(declare-fun b_lambda!3371 () Bool)

(assert (= b_lambda!3367 (or (and b!74797 b_free!2125) (and b!74781 b_free!2127 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))))) b_lambda!3371)))

(declare-fun b_lambda!3373 () Bool)

(assert (= b_lambda!3369 (or (and b!74797 b_free!2125) (and b!74781 b_free!2127 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))))) b_lambda!3373)))

(declare-fun b_lambda!3375 () Bool)

(assert (= b_lambda!3365 (or (and b!74797 b_free!2125) (and b!74781 b_free!2127 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))))) b_lambda!3375)))

(check-sat (not b_next!2127) (not bm!6694) (not b!74965) (not b!75126) (not b!75232) (not b!74995) (not bm!6717) (not bm!6688) (not b!75086) (not b!74970) (not b!75229) (not b!74984) (not b!74947) (not b!75159) (not d!17775) (not b!74982) (not b!74946) tp_is_empty!2479 (not b!75212) (not bm!6713) (not b!74941) (not b!74940) (not b!75225) (not bm!6673) (not b!74958) (not b!75163) (not bm!6681) (not d!17801) (not bm!6698) (not mapNonEmpty!3207) (not b!75099) (not d!17791) (not b!75164) (not b!75222) (not bm!6686) (not b!74983) (not b!75169) (not d!17783) (not bm!6675) (not bm!6620) (not b_lambda!3363) (not d!17755) (not b_lambda!3373) (not bm!6714) (not b!75119) (not b!75156) (not b!75127) (not b_next!2125) (not bm!6687) (not b!75167) (not d!17779) (not b!75089) (not d!17769) (not b!75166) (not b!75226) (not b!75112) (not b!75218) (not b!75220) (not d!17771) (not d!17793) (not d!17785) (not mapNonEmpty!3208) b_and!4597 (not b!75129) (not bm!6672) (not bm!6691) (not d!17789) (not bm!6680) (not b!75095) (not b!75161) (not b!75165) (not b!75168) b_and!4599 (not b!75097) (not d!17799) (not b!74939) (not bm!6689) (not b!75162) (not bm!6718) (not b!75158) (not bm!6623) (not b!74956) (not b_lambda!3371) (not b!75105) (not b_lambda!3375) (not bm!6692) (not d!17781) (not b!75128) (not d!17795) (not d!17787) (not b!74993))
(check-sat b_and!4597 b_and!4599 (not b_next!2125) (not b_next!2127))
(get-model)

(declare-fun b!75243 () Bool)

(declare-fun e!49178 () Bool)

(declare-fun e!49173 () Bool)

(assert (=> b!75243 (= e!49178 e!49173)))

(declare-fun res!39698 () Bool)

(assert (=> b!75243 (=> (not res!39698) (not e!49173))))

(declare-fun lt!33965 () ListLongMap!1409)

(assert (=> b!75243 (= res!39698 (contains!723 lt!33965 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!75243 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))

(declare-fun b!75244 () Bool)

(declare-fun e!49181 () Bool)

(declare-fun e!49171 () Bool)

(assert (=> b!75244 (= e!49181 e!49171)))

(declare-fun c!11394 () Bool)

(assert (=> b!75244 (= c!11394 (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75245 () Bool)

(declare-fun res!39702 () Bool)

(assert (=> b!75245 (=> (not res!39702) (not e!49181))))

(declare-fun e!49175 () Bool)

(assert (=> b!75245 (= res!39702 e!49175)))

(declare-fun c!11390 () Bool)

(assert (=> b!75245 (= c!11390 (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!75246 () Bool)

(declare-fun e!49174 () Bool)

(assert (=> b!75246 (= e!49171 e!49174)))

(declare-fun res!39695 () Bool)

(declare-fun call!6726 () Bool)

(assert (=> b!75246 (= res!39695 call!6726)))

(assert (=> b!75246 (=> (not res!39695) (not e!49174))))

(declare-fun b!75247 () Bool)

(declare-fun e!49176 () ListLongMap!1409)

(declare-fun call!6727 () ListLongMap!1409)

(assert (=> b!75247 (= e!49176 call!6727)))

(declare-fun b!75248 () Bool)

(declare-fun call!6725 () ListLongMap!1409)

(assert (=> b!75248 (= e!49176 call!6725)))

(declare-fun b!75249 () Bool)

(declare-fun e!49179 () Unit!2147)

(declare-fun lt!33961 () Unit!2147)

(assert (=> b!75249 (= e!49179 lt!33961)))

(declare-fun lt!33960 () ListLongMap!1409)

(assert (=> b!75249 (= lt!33960 (getCurrentListMapNoExtraKeys!59 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!33959 () (_ BitVec 64))

(assert (=> b!75249 (= lt!33959 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33975 () (_ BitVec 64))

(assert (=> b!75249 (= lt!33975 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!33964 () Unit!2147)

(assert (=> b!75249 (= lt!33964 (addStillContains!52 lt!33960 lt!33959 (zeroValue!2133 newMap!16) lt!33975))))

(assert (=> b!75249 (contains!723 (+!95 lt!33960 (tuple2!2131 lt!33959 (zeroValue!2133 newMap!16))) lt!33975)))

(declare-fun lt!33972 () Unit!2147)

(assert (=> b!75249 (= lt!33972 lt!33964)))

(declare-fun lt!33957 () ListLongMap!1409)

(assert (=> b!75249 (= lt!33957 (getCurrentListMapNoExtraKeys!59 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!33973 () (_ BitVec 64))

(assert (=> b!75249 (= lt!33973 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33962 () (_ BitVec 64))

(assert (=> b!75249 (= lt!33962 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!33955 () Unit!2147)

(assert (=> b!75249 (= lt!33955 (addApplyDifferent!52 lt!33957 lt!33973 (minValue!2133 newMap!16) lt!33962))))

(assert (=> b!75249 (= (apply!76 (+!95 lt!33957 (tuple2!2131 lt!33973 (minValue!2133 newMap!16))) lt!33962) (apply!76 lt!33957 lt!33962))))

(declare-fun lt!33969 () Unit!2147)

(assert (=> b!75249 (= lt!33969 lt!33955)))

(declare-fun lt!33974 () ListLongMap!1409)

(assert (=> b!75249 (= lt!33974 (getCurrentListMapNoExtraKeys!59 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!33967 () (_ BitVec 64))

(assert (=> b!75249 (= lt!33967 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33966 () (_ BitVec 64))

(assert (=> b!75249 (= lt!33966 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!33970 () Unit!2147)

(assert (=> b!75249 (= lt!33970 (addApplyDifferent!52 lt!33974 lt!33967 (zeroValue!2133 newMap!16) lt!33966))))

(assert (=> b!75249 (= (apply!76 (+!95 lt!33974 (tuple2!2131 lt!33967 (zeroValue!2133 newMap!16))) lt!33966) (apply!76 lt!33974 lt!33966))))

(declare-fun lt!33956 () Unit!2147)

(assert (=> b!75249 (= lt!33956 lt!33970)))

(declare-fun lt!33968 () ListLongMap!1409)

(assert (=> b!75249 (= lt!33968 (getCurrentListMapNoExtraKeys!59 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!33963 () (_ BitVec 64))

(assert (=> b!75249 (= lt!33963 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33976 () (_ BitVec 64))

(assert (=> b!75249 (= lt!33976 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!75249 (= lt!33961 (addApplyDifferent!52 lt!33968 lt!33963 (minValue!2133 newMap!16) lt!33976))))

(assert (=> b!75249 (= (apply!76 (+!95 lt!33968 (tuple2!2131 lt!33963 (minValue!2133 newMap!16))) lt!33976) (apply!76 lt!33968 lt!33976))))

(declare-fun bm!6720 () Bool)

(declare-fun call!6728 () Bool)

(assert (=> bm!6720 (= call!6728 (contains!723 lt!33965 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75250 () Bool)

(declare-fun res!39697 () Bool)

(assert (=> b!75250 (=> (not res!39697) (not e!49181))))

(assert (=> b!75250 (= res!39697 e!49178)))

(declare-fun res!39701 () Bool)

(assert (=> b!75250 (=> res!39701 e!49178)))

(declare-fun e!49172 () Bool)

(assert (=> b!75250 (= res!39701 (not e!49172))))

(declare-fun res!39699 () Bool)

(assert (=> b!75250 (=> (not res!39699) (not e!49172))))

(assert (=> b!75250 (= res!39699 (bvslt #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))

(declare-fun b!75251 () Bool)

(assert (=> b!75251 (= e!49172 (validKeyInArray!0 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!75252 () Bool)

(assert (=> b!75252 (= e!49171 (not call!6726))))

(declare-fun b!75253 () Bool)

(assert (=> b!75253 (= e!49173 (= (apply!76 lt!33965 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)) (get!1150 (select (arr!1853 (_values!2216 newMap!16)) #b00000000000000000000000000000000) (dynLambda!328 (defaultEntry!2233 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75253 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2093 (_values!2216 newMap!16))))))

(assert (=> b!75253 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))

(declare-fun bm!6721 () Bool)

(assert (=> bm!6721 (= call!6726 (contains!723 lt!33965 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6722 () Bool)

(declare-fun call!6729 () ListLongMap!1409)

(declare-fun call!6724 () ListLongMap!1409)

(assert (=> bm!6722 (= call!6729 call!6724)))

(declare-fun b!75254 () Bool)

(declare-fun e!49177 () ListLongMap!1409)

(assert (=> b!75254 (= e!49177 call!6727)))

(declare-fun b!75255 () Bool)

(declare-fun Unit!2158 () Unit!2147)

(assert (=> b!75255 (= e!49179 Unit!2158)))

(declare-fun bm!6723 () Bool)

(declare-fun call!6723 () ListLongMap!1409)

(assert (=> bm!6723 (= call!6727 call!6723)))

(declare-fun b!75256 () Bool)

(assert (=> b!75256 (= e!49174 (= (apply!76 lt!33965 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2133 newMap!16)))))

(declare-fun b!75257 () Bool)

(declare-fun e!49180 () Bool)

(assert (=> b!75257 (= e!49180 (= (apply!76 lt!33965 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2133 newMap!16)))))

(declare-fun b!75258 () Bool)

(declare-fun c!11392 () Bool)

(assert (=> b!75258 (= c!11392 (and (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!75258 (= e!49177 e!49176)))

(declare-fun d!17803 () Bool)

(assert (=> d!17803 e!49181))

(declare-fun res!39700 () Bool)

(assert (=> d!17803 (=> (not res!39700) (not e!49181))))

(assert (=> d!17803 (= res!39700 (or (bvsge #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))))

(declare-fun lt!33958 () ListLongMap!1409)

(assert (=> d!17803 (= lt!33965 lt!33958)))

(declare-fun lt!33971 () Unit!2147)

(assert (=> d!17803 (= lt!33971 e!49179)))

(declare-fun c!11395 () Bool)

(declare-fun e!49170 () Bool)

(assert (=> d!17803 (= c!11395 e!49170)))

(declare-fun res!39696 () Bool)

(assert (=> d!17803 (=> (not res!39696) (not e!49170))))

(assert (=> d!17803 (= res!39696 (bvslt #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))

(declare-fun e!49169 () ListLongMap!1409)

(assert (=> d!17803 (= lt!33958 e!49169)))

(declare-fun c!11393 () Bool)

(assert (=> d!17803 (= c!11393 (and (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!17803 (validMask!0 (mask!6209 newMap!16))))

(assert (=> d!17803 (= (getCurrentListMap!413 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) lt!33965)))

(declare-fun bm!6724 () Bool)

(assert (=> bm!6724 (= call!6724 (getCurrentListMapNoExtraKeys!59 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun b!75259 () Bool)

(assert (=> b!75259 (= e!49169 e!49177)))

(declare-fun c!11391 () Bool)

(assert (=> b!75259 (= c!11391 (and (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6725 () Bool)

(assert (=> bm!6725 (= call!6723 (+!95 (ite c!11393 call!6724 (ite c!11391 call!6729 call!6725)) (ite (or c!11393 c!11391) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 newMap!16)) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 newMap!16)))))))

(declare-fun bm!6726 () Bool)

(assert (=> bm!6726 (= call!6725 call!6729)))

(declare-fun b!75260 () Bool)

(assert (=> b!75260 (= e!49169 (+!95 call!6723 (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 newMap!16))))))

(declare-fun b!75261 () Bool)

(assert (=> b!75261 (= e!49175 (not call!6728))))

(declare-fun b!75262 () Bool)

(assert (=> b!75262 (= e!49175 e!49180)))

(declare-fun res!39694 () Bool)

(assert (=> b!75262 (= res!39694 call!6728)))

(assert (=> b!75262 (=> (not res!39694) (not e!49180))))

(declare-fun b!75263 () Bool)

(assert (=> b!75263 (= e!49170 (validKeyInArray!0 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!17803 c!11393) b!75260))

(assert (= (and d!17803 (not c!11393)) b!75259))

(assert (= (and b!75259 c!11391) b!75254))

(assert (= (and b!75259 (not c!11391)) b!75258))

(assert (= (and b!75258 c!11392) b!75247))

(assert (= (and b!75258 (not c!11392)) b!75248))

(assert (= (or b!75247 b!75248) bm!6726))

(assert (= (or b!75254 bm!6726) bm!6722))

(assert (= (or b!75254 b!75247) bm!6723))

(assert (= (or b!75260 bm!6722) bm!6724))

(assert (= (or b!75260 bm!6723) bm!6725))

(assert (= (and d!17803 res!39696) b!75263))

(assert (= (and d!17803 c!11395) b!75249))

(assert (= (and d!17803 (not c!11395)) b!75255))

(assert (= (and d!17803 res!39700) b!75250))

(assert (= (and b!75250 res!39699) b!75251))

(assert (= (and b!75250 (not res!39701)) b!75243))

(assert (= (and b!75243 res!39698) b!75253))

(assert (= (and b!75250 res!39697) b!75245))

(assert (= (and b!75245 c!11390) b!75262))

(assert (= (and b!75245 (not c!11390)) b!75261))

(assert (= (and b!75262 res!39694) b!75257))

(assert (= (or b!75262 b!75261) bm!6720))

(assert (= (and b!75245 res!39702) b!75244))

(assert (= (and b!75244 c!11394) b!75246))

(assert (= (and b!75244 (not c!11394)) b!75252))

(assert (= (and b!75246 res!39695) b!75256))

(assert (= (or b!75246 b!75252) bm!6721))

(declare-fun b_lambda!3377 () Bool)

(assert (=> (not b_lambda!3377) (not b!75253)))

(declare-fun t!5071 () Bool)

(declare-fun tb!1553 () Bool)

(assert (=> (and b!74797 (= (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) (defaultEntry!2233 newMap!16)) t!5071) tb!1553))

(declare-fun result!2717 () Bool)

(assert (=> tb!1553 (= result!2717 tp_is_empty!2479)))

(assert (=> b!75253 t!5071))

(declare-fun b_and!4601 () Bool)

(assert (= b_and!4597 (and (=> t!5071 result!2717) b_and!4601)))

(declare-fun t!5073 () Bool)

(declare-fun tb!1555 () Bool)

(assert (=> (and b!74781 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 newMap!16)) t!5073) tb!1555))

(declare-fun result!2719 () Bool)

(assert (= result!2719 result!2717))

(assert (=> b!75253 t!5073))

(declare-fun b_and!4603 () Bool)

(assert (= b_and!4599 (and (=> t!5073 result!2719) b_and!4603)))

(declare-fun m!74517 () Bool)

(assert (=> b!75253 m!74517))

(declare-fun m!74519 () Bool)

(assert (=> b!75253 m!74519))

(declare-fun m!74521 () Bool)

(assert (=> b!75253 m!74521))

(declare-fun m!74523 () Bool)

(assert (=> b!75253 m!74523))

(declare-fun m!74525 () Bool)

(assert (=> b!75253 m!74525))

(assert (=> b!75253 m!74517))

(assert (=> b!75253 m!74523))

(assert (=> b!75253 m!74519))

(declare-fun m!74527 () Bool)

(assert (=> bm!6725 m!74527))

(declare-fun m!74529 () Bool)

(assert (=> d!17803 m!74529))

(declare-fun m!74531 () Bool)

(assert (=> b!75249 m!74531))

(declare-fun m!74533 () Bool)

(assert (=> b!75249 m!74533))

(declare-fun m!74535 () Bool)

(assert (=> b!75249 m!74535))

(declare-fun m!74537 () Bool)

(assert (=> b!75249 m!74537))

(declare-fun m!74539 () Bool)

(assert (=> b!75249 m!74539))

(assert (=> b!75249 m!74537))

(declare-fun m!74541 () Bool)

(assert (=> b!75249 m!74541))

(declare-fun m!74543 () Bool)

(assert (=> b!75249 m!74543))

(declare-fun m!74545 () Bool)

(assert (=> b!75249 m!74545))

(declare-fun m!74547 () Bool)

(assert (=> b!75249 m!74547))

(declare-fun m!74549 () Bool)

(assert (=> b!75249 m!74549))

(declare-fun m!74551 () Bool)

(assert (=> b!75249 m!74551))

(assert (=> b!75249 m!74535))

(declare-fun m!74553 () Bool)

(assert (=> b!75249 m!74553))

(declare-fun m!74555 () Bool)

(assert (=> b!75249 m!74555))

(declare-fun m!74557 () Bool)

(assert (=> b!75249 m!74557))

(assert (=> b!75249 m!74555))

(assert (=> b!75249 m!74523))

(assert (=> b!75249 m!74545))

(declare-fun m!74559 () Bool)

(assert (=> b!75249 m!74559))

(declare-fun m!74561 () Bool)

(assert (=> b!75249 m!74561))

(declare-fun m!74563 () Bool)

(assert (=> bm!6720 m!74563))

(declare-fun m!74565 () Bool)

(assert (=> b!75256 m!74565))

(assert (=> b!75263 m!74523))

(assert (=> b!75263 m!74523))

(declare-fun m!74567 () Bool)

(assert (=> b!75263 m!74567))

(assert (=> bm!6724 m!74559))

(declare-fun m!74569 () Bool)

(assert (=> b!75257 m!74569))

(declare-fun m!74571 () Bool)

(assert (=> b!75260 m!74571))

(declare-fun m!74573 () Bool)

(assert (=> bm!6721 m!74573))

(assert (=> b!75243 m!74523))

(assert (=> b!75243 m!74523))

(declare-fun m!74575 () Bool)

(assert (=> b!75243 m!74575))

(assert (=> b!75251 m!74523))

(assert (=> b!75251 m!74523))

(assert (=> b!75251 m!74567))

(assert (=> d!17799 d!17803))

(declare-fun d!17805 () Bool)

(declare-fun e!49183 () Bool)

(assert (=> d!17805 e!49183))

(declare-fun res!39703 () Bool)

(assert (=> d!17805 (=> res!39703 e!49183)))

(declare-fun lt!33980 () Bool)

(assert (=> d!17805 (= res!39703 (not lt!33980))))

(declare-fun lt!33979 () Bool)

(assert (=> d!17805 (= lt!33980 lt!33979)))

(declare-fun lt!33977 () Unit!2147)

(declare-fun e!49182 () Unit!2147)

(assert (=> d!17805 (= lt!33977 e!49182)))

(declare-fun c!11396 () Bool)

(assert (=> d!17805 (= c!11396 lt!33979)))

(assert (=> d!17805 (= lt!33979 (containsKey!136 (toList!720 lt!33854) (_1!1076 lt!33653)))))

(assert (=> d!17805 (= (contains!723 lt!33854 (_1!1076 lt!33653)) lt!33980)))

(declare-fun b!75264 () Bool)

(declare-fun lt!33978 () Unit!2147)

(assert (=> b!75264 (= e!49182 lt!33978)))

(assert (=> b!75264 (= lt!33978 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 lt!33854) (_1!1076 lt!33653)))))

(assert (=> b!75264 (isDefined!86 (getValueByKey!132 (toList!720 lt!33854) (_1!1076 lt!33653)))))

(declare-fun b!75265 () Bool)

(declare-fun Unit!2159 () Unit!2147)

(assert (=> b!75265 (= e!49182 Unit!2159)))

(declare-fun b!75266 () Bool)

(assert (=> b!75266 (= e!49183 (isDefined!86 (getValueByKey!132 (toList!720 lt!33854) (_1!1076 lt!33653))))))

(assert (= (and d!17805 c!11396) b!75264))

(assert (= (and d!17805 (not c!11396)) b!75265))

(assert (= (and d!17805 (not res!39703)) b!75266))

(declare-fun m!74577 () Bool)

(assert (=> d!17805 m!74577))

(declare-fun m!74579 () Bool)

(assert (=> b!75264 m!74579))

(assert (=> b!75264 m!74403))

(assert (=> b!75264 m!74403))

(declare-fun m!74581 () Bool)

(assert (=> b!75264 m!74581))

(assert (=> b!75266 m!74403))

(assert (=> b!75266 m!74403))

(assert (=> b!75266 m!74581))

(assert (=> d!17787 d!17805))

(declare-fun b!75278 () Bool)

(declare-fun e!49189 () Option!138)

(assert (=> b!75278 (= e!49189 None!136)))

(declare-fun b!75276 () Bool)

(declare-fun e!49188 () Option!138)

(assert (=> b!75276 (= e!49188 e!49189)))

(declare-fun c!11402 () Bool)

(assert (=> b!75276 (= c!11402 (and ((_ is Cons!1484) lt!33853) (not (= (_1!1076 (h!2072 lt!33853)) (_1!1076 lt!33653)))))))

(declare-fun b!75277 () Bool)

(assert (=> b!75277 (= e!49189 (getValueByKey!132 (t!5057 lt!33853) (_1!1076 lt!33653)))))

(declare-fun d!17807 () Bool)

(declare-fun c!11401 () Bool)

(assert (=> d!17807 (= c!11401 (and ((_ is Cons!1484) lt!33853) (= (_1!1076 (h!2072 lt!33853)) (_1!1076 lt!33653))))))

(assert (=> d!17807 (= (getValueByKey!132 lt!33853 (_1!1076 lt!33653)) e!49188)))

(declare-fun b!75275 () Bool)

(assert (=> b!75275 (= e!49188 (Some!137 (_2!1076 (h!2072 lt!33853))))))

(assert (= (and d!17807 c!11401) b!75275))

(assert (= (and d!17807 (not c!11401)) b!75276))

(assert (= (and b!75276 c!11402) b!75277))

(assert (= (and b!75276 (not c!11402)) b!75278))

(declare-fun m!74583 () Bool)

(assert (=> b!75277 m!74583))

(assert (=> d!17787 d!17807))

(declare-fun d!17809 () Bool)

(assert (=> d!17809 (= (getValueByKey!132 lt!33853 (_1!1076 lt!33653)) (Some!137 (_2!1076 lt!33653)))))

(declare-fun lt!33983 () Unit!2147)

(declare-fun choose!434 (List!1488 (_ BitVec 64) V!2953) Unit!2147)

(assert (=> d!17809 (= lt!33983 (choose!434 lt!33853 (_1!1076 lt!33653) (_2!1076 lt!33653)))))

(declare-fun e!49192 () Bool)

(assert (=> d!17809 e!49192))

(declare-fun res!39708 () Bool)

(assert (=> d!17809 (=> (not res!39708) (not e!49192))))

(declare-fun isStrictlySorted!288 (List!1488) Bool)

(assert (=> d!17809 (= res!39708 (isStrictlySorted!288 lt!33853))))

(assert (=> d!17809 (= (lemmaContainsTupThenGetReturnValue!52 lt!33853 (_1!1076 lt!33653) (_2!1076 lt!33653)) lt!33983)))

(declare-fun b!75283 () Bool)

(declare-fun res!39709 () Bool)

(assert (=> b!75283 (=> (not res!39709) (not e!49192))))

(assert (=> b!75283 (= res!39709 (containsKey!136 lt!33853 (_1!1076 lt!33653)))))

(declare-fun b!75284 () Bool)

(assert (=> b!75284 (= e!49192 (contains!725 lt!33853 (tuple2!2131 (_1!1076 lt!33653) (_2!1076 lt!33653))))))

(assert (= (and d!17809 res!39708) b!75283))

(assert (= (and b!75283 res!39709) b!75284))

(assert (=> d!17809 m!74397))

(declare-fun m!74585 () Bool)

(assert (=> d!17809 m!74585))

(declare-fun m!74587 () Bool)

(assert (=> d!17809 m!74587))

(declare-fun m!74589 () Bool)

(assert (=> b!75283 m!74589))

(declare-fun m!74591 () Bool)

(assert (=> b!75284 m!74591))

(assert (=> d!17787 d!17809))

(declare-fun call!6738 () List!1488)

(declare-fun bm!6733 () Bool)

(declare-fun e!49207 () List!1488)

(declare-fun c!11411 () Bool)

(declare-fun $colon$colon!66 (List!1488 tuple2!2130) List!1488)

(assert (=> bm!6733 (= call!6738 ($colon$colon!66 e!49207 (ite c!11411 (h!2072 (toList!720 (+!95 lt!33649 lt!33648))) (tuple2!2131 (_1!1076 lt!33653) (_2!1076 lt!33653)))))))

(declare-fun c!11413 () Bool)

(assert (=> bm!6733 (= c!11413 c!11411)))

(declare-fun bm!6734 () Bool)

(declare-fun call!6737 () List!1488)

(assert (=> bm!6734 (= call!6737 call!6738)))

(declare-fun c!11414 () Bool)

(declare-fun b!75305 () Bool)

(declare-fun c!11412 () Bool)

(assert (=> b!75305 (= e!49207 (ite c!11414 (t!5057 (toList!720 (+!95 lt!33649 lt!33648))) (ite c!11412 (Cons!1484 (h!2072 (toList!720 (+!95 lt!33649 lt!33648))) (t!5057 (toList!720 (+!95 lt!33649 lt!33648)))) Nil!1485)))))

(declare-fun b!75306 () Bool)

(declare-fun e!49205 () List!1488)

(assert (=> b!75306 (= e!49205 call!6737)))

(declare-fun b!75307 () Bool)

(declare-fun e!49206 () List!1488)

(assert (=> b!75307 (= e!49206 e!49205)))

(assert (=> b!75307 (= c!11414 (and ((_ is Cons!1484) (toList!720 (+!95 lt!33649 lt!33648))) (= (_1!1076 (h!2072 (toList!720 (+!95 lt!33649 lt!33648)))) (_1!1076 lt!33653))))))

(declare-fun b!75308 () Bool)

(assert (=> b!75308 (= e!49207 (insertStrictlySorted!55 (t!5057 (toList!720 (+!95 lt!33649 lt!33648))) (_1!1076 lt!33653) (_2!1076 lt!33653)))))

(declare-fun d!17811 () Bool)

(declare-fun e!49203 () Bool)

(assert (=> d!17811 e!49203))

(declare-fun res!39714 () Bool)

(assert (=> d!17811 (=> (not res!39714) (not e!49203))))

(declare-fun lt!33986 () List!1488)

(assert (=> d!17811 (= res!39714 (isStrictlySorted!288 lt!33986))))

(assert (=> d!17811 (= lt!33986 e!49206)))

(assert (=> d!17811 (= c!11411 (and ((_ is Cons!1484) (toList!720 (+!95 lt!33649 lt!33648))) (bvslt (_1!1076 (h!2072 (toList!720 (+!95 lt!33649 lt!33648)))) (_1!1076 lt!33653))))))

(assert (=> d!17811 (isStrictlySorted!288 (toList!720 (+!95 lt!33649 lt!33648)))))

(assert (=> d!17811 (= (insertStrictlySorted!55 (toList!720 (+!95 lt!33649 lt!33648)) (_1!1076 lt!33653) (_2!1076 lt!33653)) lt!33986)))

(declare-fun b!75309 () Bool)

(declare-fun res!39715 () Bool)

(assert (=> b!75309 (=> (not res!39715) (not e!49203))))

(assert (=> b!75309 (= res!39715 (containsKey!136 lt!33986 (_1!1076 lt!33653)))))

(declare-fun b!75310 () Bool)

(assert (=> b!75310 (= c!11412 (and ((_ is Cons!1484) (toList!720 (+!95 lt!33649 lt!33648))) (bvsgt (_1!1076 (h!2072 (toList!720 (+!95 lt!33649 lt!33648)))) (_1!1076 lt!33653))))))

(declare-fun e!49204 () List!1488)

(assert (=> b!75310 (= e!49205 e!49204)))

(declare-fun b!75311 () Bool)

(declare-fun call!6736 () List!1488)

(assert (=> b!75311 (= e!49204 call!6736)))

(declare-fun b!75312 () Bool)

(assert (=> b!75312 (= e!49204 call!6736)))

(declare-fun b!75313 () Bool)

(assert (=> b!75313 (= e!49206 call!6738)))

(declare-fun b!75314 () Bool)

(assert (=> b!75314 (= e!49203 (contains!725 lt!33986 (tuple2!2131 (_1!1076 lt!33653) (_2!1076 lt!33653))))))

(declare-fun bm!6735 () Bool)

(assert (=> bm!6735 (= call!6736 call!6737)))

(assert (= (and d!17811 c!11411) b!75313))

(assert (= (and d!17811 (not c!11411)) b!75307))

(assert (= (and b!75307 c!11414) b!75306))

(assert (= (and b!75307 (not c!11414)) b!75310))

(assert (= (and b!75310 c!11412) b!75311))

(assert (= (and b!75310 (not c!11412)) b!75312))

(assert (= (or b!75311 b!75312) bm!6735))

(assert (= (or b!75306 bm!6735) bm!6734))

(assert (= (or b!75313 bm!6734) bm!6733))

(assert (= (and bm!6733 c!11413) b!75308))

(assert (= (and bm!6733 (not c!11413)) b!75305))

(assert (= (and d!17811 res!39714) b!75309))

(assert (= (and b!75309 res!39715) b!75314))

(declare-fun m!74593 () Bool)

(assert (=> b!75314 m!74593))

(declare-fun m!74595 () Bool)

(assert (=> bm!6733 m!74595))

(declare-fun m!74597 () Bool)

(assert (=> d!17811 m!74597))

(declare-fun m!74599 () Bool)

(assert (=> d!17811 m!74599))

(declare-fun m!74601 () Bool)

(assert (=> b!75309 m!74601))

(declare-fun m!74603 () Bool)

(assert (=> b!75308 m!74603))

(assert (=> d!17787 d!17811))

(assert (=> b!75097 d!17803))

(declare-fun d!17813 () Bool)

(declare-fun e!49209 () Bool)

(assert (=> d!17813 e!49209))

(declare-fun res!39716 () Bool)

(assert (=> d!17813 (=> res!39716 e!49209)))

(declare-fun lt!33990 () Bool)

(assert (=> d!17813 (= res!39716 (not lt!33990))))

(declare-fun lt!33989 () Bool)

(assert (=> d!17813 (= lt!33990 lt!33989)))

(declare-fun lt!33987 () Unit!2147)

(declare-fun e!49208 () Unit!2147)

(assert (=> d!17813 (= lt!33987 e!49208)))

(declare-fun c!11415 () Bool)

(assert (=> d!17813 (= c!11415 lt!33989)))

(assert (=> d!17813 (= lt!33989 (containsKey!136 (toList!720 lt!33943) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17813 (= (contains!723 lt!33943 #b1000000000000000000000000000000000000000000000000000000000000000) lt!33990)))

(declare-fun b!75315 () Bool)

(declare-fun lt!33988 () Unit!2147)

(assert (=> b!75315 (= e!49208 lt!33988)))

(assert (=> b!75315 (= lt!33988 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 lt!33943) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75315 (isDefined!86 (getValueByKey!132 (toList!720 lt!33943) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75316 () Bool)

(declare-fun Unit!2160 () Unit!2147)

(assert (=> b!75316 (= e!49208 Unit!2160)))

(declare-fun b!75317 () Bool)

(assert (=> b!75317 (= e!49209 (isDefined!86 (getValueByKey!132 (toList!720 lt!33943) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17813 c!11415) b!75315))

(assert (= (and d!17813 (not c!11415)) b!75316))

(assert (= (and d!17813 (not res!39716)) b!75317))

(declare-fun m!74605 () Bool)

(assert (=> d!17813 m!74605))

(declare-fun m!74607 () Bool)

(assert (=> b!75315 m!74607))

(declare-fun m!74609 () Bool)

(assert (=> b!75315 m!74609))

(assert (=> b!75315 m!74609))

(declare-fun m!74611 () Bool)

(assert (=> b!75315 m!74611))

(assert (=> b!75317 m!74609))

(assert (=> b!75317 m!74609))

(assert (=> b!75317 m!74611))

(assert (=> bm!6714 d!17813))

(declare-fun d!17815 () Bool)

(declare-fun e!49211 () Bool)

(assert (=> d!17815 e!49211))

(declare-fun res!39717 () Bool)

(assert (=> d!17815 (=> res!39717 e!49211)))

(declare-fun lt!33994 () Bool)

(assert (=> d!17815 (= res!39717 (not lt!33994))))

(declare-fun lt!33993 () Bool)

(assert (=> d!17815 (= lt!33994 lt!33993)))

(declare-fun lt!33991 () Unit!2147)

(declare-fun e!49210 () Unit!2147)

(assert (=> d!17815 (= lt!33991 e!49210)))

(declare-fun c!11416 () Bool)

(assert (=> d!17815 (= c!11416 lt!33993)))

(assert (=> d!17815 (= lt!33993 (containsKey!136 (toList!720 lt!33871) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17815 (= (contains!723 lt!33871 #b0000000000000000000000000000000000000000000000000000000000000000) lt!33994)))

(declare-fun b!75318 () Bool)

(declare-fun lt!33992 () Unit!2147)

(assert (=> b!75318 (= e!49210 lt!33992)))

(assert (=> b!75318 (= lt!33992 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 lt!33871) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75318 (isDefined!86 (getValueByKey!132 (toList!720 lt!33871) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75319 () Bool)

(declare-fun Unit!2161 () Unit!2147)

(assert (=> b!75319 (= e!49210 Unit!2161)))

(declare-fun b!75320 () Bool)

(assert (=> b!75320 (= e!49211 (isDefined!86 (getValueByKey!132 (toList!720 lt!33871) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17815 c!11416) b!75318))

(assert (= (and d!17815 (not c!11416)) b!75319))

(assert (= (and d!17815 (not res!39717)) b!75320))

(declare-fun m!74613 () Bool)

(assert (=> d!17815 m!74613))

(declare-fun m!74615 () Bool)

(assert (=> b!75318 m!74615))

(declare-fun m!74617 () Bool)

(assert (=> b!75318 m!74617))

(assert (=> b!75318 m!74617))

(declare-fun m!74619 () Bool)

(assert (=> b!75318 m!74619))

(assert (=> b!75320 m!74617))

(assert (=> b!75320 m!74617))

(assert (=> b!75320 m!74619))

(assert (=> d!17789 d!17815))

(assert (=> d!17789 d!17797))

(declare-fun d!17817 () Bool)

(declare-fun res!39718 () Bool)

(declare-fun e!49212 () Bool)

(assert (=> d!17817 (=> (not res!39718) (not e!49212))))

(assert (=> d!17817 (= res!39718 (simpleValid!52 (_2!1077 lt!33835)))))

(assert (=> d!17817 (= (valid!303 (_2!1077 lt!33835)) e!49212)))

(declare-fun b!75321 () Bool)

(declare-fun res!39719 () Bool)

(assert (=> b!75321 (=> (not res!39719) (not e!49212))))

(assert (=> b!75321 (= res!39719 (= (arrayCountValidKeys!0 (_keys!3888 (_2!1077 lt!33835)) #b00000000000000000000000000000000 (size!2092 (_keys!3888 (_2!1077 lt!33835)))) (_size!399 (_2!1077 lt!33835))))))

(declare-fun b!75322 () Bool)

(declare-fun res!39720 () Bool)

(assert (=> b!75322 (=> (not res!39720) (not e!49212))))

(assert (=> b!75322 (= res!39720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3888 (_2!1077 lt!33835)) (mask!6209 (_2!1077 lt!33835))))))

(declare-fun b!75323 () Bool)

(assert (=> b!75323 (= e!49212 (arrayNoDuplicates!0 (_keys!3888 (_2!1077 lt!33835)) #b00000000000000000000000000000000 Nil!1486))))

(assert (= (and d!17817 res!39718) b!75321))

(assert (= (and b!75321 res!39719) b!75322))

(assert (= (and b!75322 res!39720) b!75323))

(declare-fun m!74621 () Bool)

(assert (=> d!17817 m!74621))

(declare-fun m!74623 () Bool)

(assert (=> b!75321 m!74623))

(declare-fun m!74625 () Bool)

(assert (=> b!75322 m!74625))

(declare-fun m!74627 () Bool)

(assert (=> b!75323 m!74627))

(assert (=> d!17781 d!17817))

(assert (=> d!17781 d!17755))

(declare-fun d!17819 () Bool)

(declare-fun lt!33997 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!79 (List!1488) (InoxSet tuple2!2130))

(assert (=> d!17819 (= lt!33997 (select (content!79 (toList!720 lt!33882)) lt!33653))))

(declare-fun e!49218 () Bool)

(assert (=> d!17819 (= lt!33997 e!49218)))

(declare-fun res!39725 () Bool)

(assert (=> d!17819 (=> (not res!39725) (not e!49218))))

(assert (=> d!17819 (= res!39725 ((_ is Cons!1484) (toList!720 lt!33882)))))

(assert (=> d!17819 (= (contains!725 (toList!720 lt!33882) lt!33653) lt!33997)))

(declare-fun b!75328 () Bool)

(declare-fun e!49217 () Bool)

(assert (=> b!75328 (= e!49218 e!49217)))

(declare-fun res!39726 () Bool)

(assert (=> b!75328 (=> res!39726 e!49217)))

(assert (=> b!75328 (= res!39726 (= (h!2072 (toList!720 lt!33882)) lt!33653))))

(declare-fun b!75329 () Bool)

(assert (=> b!75329 (= e!49217 (contains!725 (t!5057 (toList!720 lt!33882)) lt!33653))))

(assert (= (and d!17819 res!39725) b!75328))

(assert (= (and b!75328 (not res!39726)) b!75329))

(declare-fun m!74629 () Bool)

(assert (=> d!17819 m!74629))

(declare-fun m!74631 () Bool)

(assert (=> d!17819 m!74631))

(declare-fun m!74633 () Bool)

(assert (=> b!75329 m!74633))

(assert (=> b!75167 d!17819))

(assert (=> d!17769 d!17773))

(declare-fun d!17821 () Bool)

(assert (=> d!17821 (not (arrayContainsKey!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!17821 true))

(declare-fun _$68!58 () Unit!2147)

(assert (=> d!17821 (= (choose!68 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (Cons!1485 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) Nil!1486)) _$68!58)))

(declare-fun bs!3226 () Bool)

(assert (= bs!3226 d!17821))

(assert (=> bs!3226 m!74111))

(assert (=> bs!3226 m!74125))

(assert (=> d!17769 d!17821))

(declare-fun d!17823 () Bool)

(declare-fun lt!33998 () Bool)

(assert (=> d!17823 (= lt!33998 (select (content!79 (toList!720 lt!33886)) lt!33648))))

(declare-fun e!49220 () Bool)

(assert (=> d!17823 (= lt!33998 e!49220)))

(declare-fun res!39727 () Bool)

(assert (=> d!17823 (=> (not res!39727) (not e!49220))))

(assert (=> d!17823 (= res!39727 ((_ is Cons!1484) (toList!720 lt!33886)))))

(assert (=> d!17823 (= (contains!725 (toList!720 lt!33886) lt!33648) lt!33998)))

(declare-fun b!75330 () Bool)

(declare-fun e!49219 () Bool)

(assert (=> b!75330 (= e!49220 e!49219)))

(declare-fun res!39728 () Bool)

(assert (=> b!75330 (=> res!39728 e!49219)))

(assert (=> b!75330 (= res!39728 (= (h!2072 (toList!720 lt!33886)) lt!33648))))

(declare-fun b!75331 () Bool)

(assert (=> b!75331 (= e!49219 (contains!725 (t!5057 (toList!720 lt!33886)) lt!33648))))

(assert (= (and d!17823 res!39727) b!75330))

(assert (= (and b!75330 (not res!39728)) b!75331))

(declare-fun m!74635 () Bool)

(assert (=> d!17823 m!74635))

(declare-fun m!74637 () Bool)

(assert (=> d!17823 m!74637))

(declare-fun m!74639 () Bool)

(assert (=> b!75331 m!74639))

(assert (=> b!75169 d!17823))

(declare-fun d!17825 () Bool)

(assert (=> d!17825 (= (get!1152 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) from!355) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!74947 d!17825))

(declare-fun d!17827 () Bool)

(assert (=> d!17827 (= (+!95 (getCurrentListMap!413 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33657)) (getCurrentListMap!413 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) lt!33830 (zeroValue!2133 newMap!16) lt!33657 #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34001 () Unit!2147)

(declare-fun choose!435 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 V!2953 Int) Unit!2147)

(assert (=> d!17827 (= lt!34001 (choose!435 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) lt!33830 (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) lt!33657 (defaultEntry!2233 newMap!16)))))

(assert (=> d!17827 (validMask!0 (mask!6209 newMap!16))))

(assert (=> d!17827 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!25 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) lt!33830 (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) lt!33657 (defaultEntry!2233 newMap!16)) lt!34001)))

(declare-fun bs!3227 () Bool)

(assert (= bs!3227 d!17827))

(assert (=> bs!3227 m!74529))

(declare-fun m!74641 () Bool)

(assert (=> bs!3227 m!74641))

(assert (=> bs!3227 m!74351))

(assert (=> bs!3227 m!74351))

(declare-fun m!74643 () Bool)

(assert (=> bs!3227 m!74643))

(declare-fun m!74645 () Bool)

(assert (=> bs!3227 m!74645))

(assert (=> b!75086 d!17827))

(declare-fun bm!6736 () Bool)

(declare-fun call!6739 () Bool)

(assert (=> bm!6736 (= call!6739 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3888 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun b!75333 () Bool)

(declare-fun e!49223 () Bool)

(assert (=> b!75333 (= e!49223 call!6739)))

(declare-fun b!75334 () Bool)

(declare-fun e!49221 () Bool)

(assert (=> b!75334 (= e!49223 e!49221)))

(declare-fun lt!34003 () (_ BitVec 64))

(assert (=> b!75334 (= lt!34003 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!34002 () Unit!2147)

(assert (=> b!75334 (= lt!34002 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) lt!34003 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!75334 (arrayContainsKey!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) lt!34003 #b00000000000000000000000000000000)))

(declare-fun lt!34004 () Unit!2147)

(assert (=> b!75334 (= lt!34004 lt!34002)))

(declare-fun res!39729 () Bool)

(assert (=> b!75334 (= res!39729 (= (seekEntryOrOpen!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3888 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992)))) (Found!240 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!75334 (=> (not res!39729) (not e!49221))))

(declare-fun b!75335 () Bool)

(assert (=> b!75335 (= e!49221 call!6739)))

(declare-fun d!17829 () Bool)

(declare-fun res!39730 () Bool)

(declare-fun e!49222 () Bool)

(assert (=> d!17829 (=> res!39730 e!49222)))

(assert (=> d!17829 (= res!39730 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(assert (=> d!17829 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3888 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992)))) e!49222)))

(declare-fun b!75332 () Bool)

(assert (=> b!75332 (= e!49222 e!49223)))

(declare-fun c!11417 () Bool)

(assert (=> b!75332 (= c!11417 (validKeyInArray!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!17829 (not res!39730)) b!75332))

(assert (= (and b!75332 c!11417) b!75334))

(assert (= (and b!75332 (not c!11417)) b!75333))

(assert (= (and b!75334 res!39729) b!75335))

(assert (= (or b!75335 b!75333) bm!6736))

(declare-fun m!74647 () Bool)

(assert (=> bm!6736 m!74647))

(declare-fun m!74649 () Bool)

(assert (=> b!75334 m!74649))

(declare-fun m!74651 () Bool)

(assert (=> b!75334 m!74651))

(declare-fun m!74653 () Bool)

(assert (=> b!75334 m!74653))

(assert (=> b!75334 m!74649))

(declare-fun m!74655 () Bool)

(assert (=> b!75334 m!74655))

(assert (=> b!75332 m!74649))

(assert (=> b!75332 m!74649))

(declare-fun m!74657 () Bool)

(assert (=> b!75332 m!74657))

(assert (=> bm!6620 d!17829))

(declare-fun d!17831 () Bool)

(assert (=> d!17831 (= (validKeyInArray!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) (and (not (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!74983 d!17831))

(declare-fun d!17833 () Bool)

(declare-fun get!1153 (Option!138) V!2953)

(assert (=> d!17833 (= (apply!76 lt!33943 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1153 (getValueByKey!132 (toList!720 lt!33943) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3228 () Bool)

(assert (= bs!3228 d!17833))

(declare-fun m!74659 () Bool)

(assert (=> bs!3228 m!74659))

(assert (=> bs!3228 m!74659))

(declare-fun m!74661 () Bool)

(assert (=> bs!3228 m!74661))

(assert (=> b!75226 d!17833))

(assert (=> d!17801 d!17797))

(declare-fun d!17835 () Bool)

(declare-fun e!49225 () Bool)

(assert (=> d!17835 e!49225))

(declare-fun res!39731 () Bool)

(assert (=> d!17835 (=> res!39731 e!49225)))

(declare-fun lt!34008 () Bool)

(assert (=> d!17835 (= res!39731 (not lt!34008))))

(declare-fun lt!34007 () Bool)

(assert (=> d!17835 (= lt!34008 lt!34007)))

(declare-fun lt!34005 () Unit!2147)

(declare-fun e!49224 () Unit!2147)

(assert (=> d!17835 (= lt!34005 e!49224)))

(declare-fun c!11418 () Bool)

(assert (=> d!17835 (= c!11418 lt!34007)))

(assert (=> d!17835 (= lt!34007 (containsKey!136 (toList!720 call!6681) (select (arr!1852 (_keys!3888 newMap!16)) (index!3093 lt!33818))))))

(assert (=> d!17835 (= (contains!723 call!6681 (select (arr!1852 (_keys!3888 newMap!16)) (index!3093 lt!33818))) lt!34008)))

(declare-fun b!75336 () Bool)

(declare-fun lt!34006 () Unit!2147)

(assert (=> b!75336 (= e!49224 lt!34006)))

(assert (=> b!75336 (= lt!34006 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 call!6681) (select (arr!1852 (_keys!3888 newMap!16)) (index!3093 lt!33818))))))

(assert (=> b!75336 (isDefined!86 (getValueByKey!132 (toList!720 call!6681) (select (arr!1852 (_keys!3888 newMap!16)) (index!3093 lt!33818))))))

(declare-fun b!75337 () Bool)

(declare-fun Unit!2162 () Unit!2147)

(assert (=> b!75337 (= e!49224 Unit!2162)))

(declare-fun b!75338 () Bool)

(assert (=> b!75338 (= e!49225 (isDefined!86 (getValueByKey!132 (toList!720 call!6681) (select (arr!1852 (_keys!3888 newMap!16)) (index!3093 lt!33818)))))))

(assert (= (and d!17835 c!11418) b!75336))

(assert (= (and d!17835 (not c!11418)) b!75337))

(assert (= (and d!17835 (not res!39731)) b!75338))

(assert (=> d!17835 m!74357))

(declare-fun m!74663 () Bool)

(assert (=> d!17835 m!74663))

(assert (=> b!75336 m!74357))

(declare-fun m!74665 () Bool)

(assert (=> b!75336 m!74665))

(assert (=> b!75336 m!74357))

(declare-fun m!74667 () Bool)

(assert (=> b!75336 m!74667))

(assert (=> b!75336 m!74667))

(declare-fun m!74669 () Bool)

(assert (=> b!75336 m!74669))

(assert (=> b!75338 m!74357))

(assert (=> b!75338 m!74667))

(assert (=> b!75338 m!74667))

(assert (=> b!75338 m!74669))

(assert (=> b!75112 d!17835))

(declare-fun d!17837 () Bool)

(declare-fun e!49228 () Bool)

(assert (=> d!17837 e!49228))

(declare-fun res!39734 () Bool)

(assert (=> d!17837 (=> (not res!39734) (not e!49228))))

(assert (=> d!17837 (= res!39734 (and (bvsge (index!3093 lt!33818) #b00000000000000000000000000000000) (bvslt (index!3093 lt!33818) (size!2092 (_keys!3888 newMap!16)))))))

(declare-fun lt!34011 () Unit!2147)

(declare-fun choose!436 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) Int) Unit!2147)

(assert (=> d!17837 (= lt!34011 (choose!436 (_keys!3888 newMap!16) lt!33833 (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (index!3093 lt!33818) (defaultEntry!2233 newMap!16)))))

(assert (=> d!17837 (validMask!0 (mask!6209 newMap!16))))

(assert (=> d!17837 (= (lemmaValidKeyInArrayIsInListMap!84 (_keys!3888 newMap!16) lt!33833 (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (index!3093 lt!33818) (defaultEntry!2233 newMap!16)) lt!34011)))

(declare-fun b!75341 () Bool)

(assert (=> b!75341 (= e!49228 (contains!723 (getCurrentListMap!413 (_keys!3888 newMap!16) lt!33833 (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (select (arr!1852 (_keys!3888 newMap!16)) (index!3093 lt!33818))))))

(assert (= (and d!17837 res!39734) b!75341))

(declare-fun m!74671 () Bool)

(assert (=> d!17837 m!74671))

(assert (=> d!17837 m!74529))

(declare-fun m!74673 () Bool)

(assert (=> b!75341 m!74673))

(assert (=> b!75341 m!74357))

(assert (=> b!75341 m!74673))

(assert (=> b!75341 m!74357))

(declare-fun m!74675 () Bool)

(assert (=> b!75341 m!74675))

(assert (=> b!75112 d!17837))

(declare-fun d!17839 () Bool)

(declare-fun e!49231 () Bool)

(assert (=> d!17839 e!49231))

(declare-fun res!39737 () Bool)

(assert (=> d!17839 (=> (not res!39737) (not e!49231))))

(assert (=> d!17839 (= res!39737 (and (bvsge (index!3093 lt!33818) #b00000000000000000000000000000000) (bvslt (index!3093 lt!33818) (size!2093 (_values!2216 newMap!16)))))))

(declare-fun lt!34014 () Unit!2147)

(declare-fun choose!437 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) (_ BitVec 64) V!2953 Int) Unit!2147)

(assert (=> d!17839 (= lt!34014 (choose!437 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (index!3093 lt!33818) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657 (defaultEntry!2233 newMap!16)))))

(assert (=> d!17839 (validMask!0 (mask!6209 newMap!16))))

(assert (=> d!17839 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!25 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (index!3093 lt!33818) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657 (defaultEntry!2233 newMap!16)) lt!34014)))

(declare-fun b!75344 () Bool)

(assert (=> b!75344 (= e!49231 (= (+!95 (getCurrentListMap!413 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)) (getCurrentListMap!413 (_keys!3888 newMap!16) (array!3888 (store (arr!1853 (_values!2216 newMap!16)) (index!3093 lt!33818) (ValueCellFull!896 lt!33657)) (size!2093 (_values!2216 newMap!16))) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16))))))

(assert (= (and d!17839 res!39737) b!75344))

(assert (=> d!17839 m!74111))

(declare-fun m!74677 () Bool)

(assert (=> d!17839 m!74677))

(assert (=> d!17839 m!74529))

(assert (=> b!75344 m!74351))

(assert (=> b!75344 m!74351))

(declare-fun m!74679 () Bool)

(assert (=> b!75344 m!74679))

(assert (=> b!75344 m!74331))

(declare-fun m!74681 () Bool)

(assert (=> b!75344 m!74681))

(assert (=> b!75112 d!17839))

(declare-fun b!75348 () Bool)

(declare-fun e!49233 () Option!138)

(assert (=> b!75348 (= e!49233 None!136)))

(declare-fun b!75346 () Bool)

(declare-fun e!49232 () Option!138)

(assert (=> b!75346 (= e!49232 e!49233)))

(declare-fun c!11420 () Bool)

(assert (=> b!75346 (= c!11420 (and ((_ is Cons!1484) (toList!720 lt!33850)) (not (= (_1!1076 (h!2072 (toList!720 lt!33850))) (_1!1076 lt!33648)))))))

(declare-fun b!75347 () Bool)

(assert (=> b!75347 (= e!49233 (getValueByKey!132 (t!5057 (toList!720 lt!33850)) (_1!1076 lt!33648)))))

(declare-fun d!17841 () Bool)

(declare-fun c!11419 () Bool)

(assert (=> d!17841 (= c!11419 (and ((_ is Cons!1484) (toList!720 lt!33850)) (= (_1!1076 (h!2072 (toList!720 lt!33850))) (_1!1076 lt!33648))))))

(assert (=> d!17841 (= (getValueByKey!132 (toList!720 lt!33850) (_1!1076 lt!33648)) e!49232)))

(declare-fun b!75345 () Bool)

(assert (=> b!75345 (= e!49232 (Some!137 (_2!1076 (h!2072 (toList!720 lt!33850)))))))

(assert (= (and d!17841 c!11419) b!75345))

(assert (= (and d!17841 (not c!11419)) b!75346))

(assert (= (and b!75346 c!11420) b!75347))

(assert (= (and b!75346 (not c!11420)) b!75348))

(declare-fun m!74683 () Bool)

(assert (=> b!75347 m!74683))

(assert (=> b!75126 d!17841))

(declare-fun d!17843 () Bool)

(assert (=> d!17843 (= (validKeyInArray!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75159 d!17843))

(declare-fun b!75352 () Bool)

(declare-fun e!49235 () Option!138)

(assert (=> b!75352 (= e!49235 None!136)))

(declare-fun b!75350 () Bool)

(declare-fun e!49234 () Option!138)

(assert (=> b!75350 (= e!49234 e!49235)))

(declare-fun c!11422 () Bool)

(assert (=> b!75350 (= c!11422 (and ((_ is Cons!1484) (toList!720 lt!33854)) (not (= (_1!1076 (h!2072 (toList!720 lt!33854))) (_1!1076 lt!33653)))))))

(declare-fun b!75351 () Bool)

(assert (=> b!75351 (= e!49235 (getValueByKey!132 (t!5057 (toList!720 lt!33854)) (_1!1076 lt!33653)))))

(declare-fun d!17845 () Bool)

(declare-fun c!11421 () Bool)

(assert (=> d!17845 (= c!11421 (and ((_ is Cons!1484) (toList!720 lt!33854)) (= (_1!1076 (h!2072 (toList!720 lt!33854))) (_1!1076 lt!33653))))))

(assert (=> d!17845 (= (getValueByKey!132 (toList!720 lt!33854) (_1!1076 lt!33653)) e!49234)))

(declare-fun b!75349 () Bool)

(assert (=> b!75349 (= e!49234 (Some!137 (_2!1076 (h!2072 (toList!720 lt!33854)))))))

(assert (= (and d!17845 c!11421) b!75349))

(assert (= (and d!17845 (not c!11421)) b!75350))

(assert (= (and b!75350 c!11422) b!75351))

(assert (= (and b!75350 (not c!11422)) b!75352))

(declare-fun m!74685 () Bool)

(assert (=> b!75351 m!74685))

(assert (=> b!75128 d!17845))

(declare-fun d!17847 () Bool)

(declare-fun e!49238 () Bool)

(assert (=> d!17847 e!49238))

(declare-fun res!39743 () Bool)

(assert (=> d!17847 (=> (not res!39743) (not e!49238))))

(declare-fun lt!34019 () SeekEntryResult!240)

(assert (=> d!17847 (= res!39743 ((_ is Found!240) lt!34019))))

(assert (=> d!17847 (= lt!34019 (seekEntryOrOpen!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (_keys!3888 newMap!16) (mask!6209 newMap!16)))))

(declare-fun lt!34020 () Unit!2147)

(declare-fun choose!438 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 64) Int) Unit!2147)

(assert (=> d!17847 (= lt!34020 (choose!438 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)))))

(assert (=> d!17847 (validMask!0 (mask!6209 newMap!16))))

(assert (=> d!17847 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!25 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)) lt!34020)))

(declare-fun b!75357 () Bool)

(declare-fun res!39742 () Bool)

(assert (=> b!75357 (=> (not res!39742) (not e!49238))))

(assert (=> b!75357 (= res!39742 (inRange!0 (index!3093 lt!34019) (mask!6209 newMap!16)))))

(declare-fun b!75358 () Bool)

(assert (=> b!75358 (= e!49238 (= (select (arr!1852 (_keys!3888 newMap!16)) (index!3093 lt!34019)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(assert (=> b!75358 (and (bvsge (index!3093 lt!34019) #b00000000000000000000000000000000) (bvslt (index!3093 lt!34019) (size!2092 (_keys!3888 newMap!16))))))

(assert (= (and d!17847 res!39743) b!75357))

(assert (= (and b!75357 res!39742) b!75358))

(assert (=> d!17847 m!74111))

(assert (=> d!17847 m!74347))

(assert (=> d!17847 m!74111))

(declare-fun m!74687 () Bool)

(assert (=> d!17847 m!74687))

(assert (=> d!17847 m!74529))

(declare-fun m!74689 () Bool)

(assert (=> b!75357 m!74689))

(declare-fun m!74691 () Bool)

(assert (=> b!75358 m!74691))

(assert (=> bm!6694 d!17847))

(declare-fun d!17849 () Bool)

(declare-fun e!49240 () Bool)

(assert (=> d!17849 e!49240))

(declare-fun res!39744 () Bool)

(assert (=> d!17849 (=> res!39744 e!49240)))

(declare-fun lt!34024 () Bool)

(assert (=> d!17849 (= res!39744 (not lt!34024))))

(declare-fun lt!34023 () Bool)

(assert (=> d!17849 (= lt!34024 lt!34023)))

(declare-fun lt!34021 () Unit!2147)

(declare-fun e!49239 () Unit!2147)

(assert (=> d!17849 (= lt!34021 e!49239)))

(declare-fun c!11423 () Bool)

(assert (=> d!17849 (= c!11423 lt!34023)))

(assert (=> d!17849 (= lt!34023 (containsKey!136 (toList!720 e!49080) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(assert (=> d!17849 (= (contains!723 e!49080 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) lt!34024)))

(declare-fun b!75359 () Bool)

(declare-fun lt!34022 () Unit!2147)

(assert (=> b!75359 (= e!49239 lt!34022)))

(assert (=> b!75359 (= lt!34022 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 e!49080) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(assert (=> b!75359 (isDefined!86 (getValueByKey!132 (toList!720 e!49080) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun b!75360 () Bool)

(declare-fun Unit!2163 () Unit!2147)

(assert (=> b!75360 (= e!49239 Unit!2163)))

(declare-fun b!75361 () Bool)

(assert (=> b!75361 (= e!49240 (isDefined!86 (getValueByKey!132 (toList!720 e!49080) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355))))))

(assert (= (and d!17849 c!11423) b!75359))

(assert (= (and d!17849 (not c!11423)) b!75360))

(assert (= (and d!17849 (not res!39744)) b!75361))

(assert (=> d!17849 m!74111))

(declare-fun m!74693 () Bool)

(assert (=> d!17849 m!74693))

(assert (=> b!75359 m!74111))

(declare-fun m!74695 () Bool)

(assert (=> b!75359 m!74695))

(assert (=> b!75359 m!74111))

(declare-fun m!74697 () Bool)

(assert (=> b!75359 m!74697))

(assert (=> b!75359 m!74697))

(declare-fun m!74699 () Bool)

(assert (=> b!75359 m!74699))

(assert (=> b!75361 m!74111))

(assert (=> b!75361 m!74697))

(assert (=> b!75361 m!74697))

(assert (=> b!75361 m!74699))

(assert (=> bm!6688 d!17849))

(assert (=> bm!6717 d!17789))

(declare-fun d!17851 () Bool)

(assert (=> d!17851 (arrayContainsKey!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) lt!33737 #b00000000000000000000000000000000)))

(declare-fun lt!34027 () Unit!2147)

(declare-fun choose!13 (array!3885 (_ BitVec 64) (_ BitVec 32)) Unit!2147)

(assert (=> d!17851 (= lt!34027 (choose!13 (_keys!3888 (v!2539 (underlying!259 thiss!992))) lt!33737 #b00000000000000000000000000000000))))

(assert (=> d!17851 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!17851 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) lt!33737 #b00000000000000000000000000000000) lt!34027)))

(declare-fun bs!3229 () Bool)

(assert (= bs!3229 d!17851))

(assert (=> bs!3229 m!74295))

(declare-fun m!74701 () Bool)

(assert (=> bs!3229 m!74701))

(assert (=> b!74958 d!17851))

(declare-fun d!17853 () Bool)

(declare-fun res!39745 () Bool)

(declare-fun e!49241 () Bool)

(assert (=> d!17853 (=> res!39745 e!49241)))

(assert (=> d!17853 (= res!39745 (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b00000000000000000000000000000000) lt!33737))))

(assert (=> d!17853 (= (arrayContainsKey!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) lt!33737 #b00000000000000000000000000000000) e!49241)))

(declare-fun b!75362 () Bool)

(declare-fun e!49242 () Bool)

(assert (=> b!75362 (= e!49241 e!49242)))

(declare-fun res!39746 () Bool)

(assert (=> b!75362 (=> (not res!39746) (not e!49242))))

(assert (=> b!75362 (= res!39746 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun b!75363 () Bool)

(assert (=> b!75363 (= e!49242 (arrayContainsKey!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) lt!33737 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!17853 (not res!39745)) b!75362))

(assert (= (and b!75362 res!39746) b!75363))

(assert (=> d!17853 m!74291))

(declare-fun m!74703 () Bool)

(assert (=> b!75363 m!74703))

(assert (=> b!74958 d!17853))

(declare-fun b!75376 () Bool)

(declare-fun c!11432 () Bool)

(declare-fun lt!34035 () (_ BitVec 64))

(assert (=> b!75376 (= c!11432 (= lt!34035 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49251 () SeekEntryResult!240)

(declare-fun e!49249 () SeekEntryResult!240)

(assert (=> b!75376 (= e!49251 e!49249)))

(declare-fun b!75377 () Bool)

(declare-fun lt!34034 () SeekEntryResult!240)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3885 (_ BitVec 32)) SeekEntryResult!240)

(assert (=> b!75377 (= e!49249 (seekKeyOrZeroReturnVacant!0 (x!11299 lt!34034) (index!3094 lt!34034) (index!3094 lt!34034) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b00000000000000000000000000000000) (_keys!3888 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun d!17855 () Bool)

(declare-fun lt!34036 () SeekEntryResult!240)

(assert (=> d!17855 (and (or ((_ is Undefined!240) lt!34036) (not ((_ is Found!240) lt!34036)) (and (bvsge (index!3093 lt!34036) #b00000000000000000000000000000000) (bvslt (index!3093 lt!34036) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))) (or ((_ is Undefined!240) lt!34036) ((_ is Found!240) lt!34036) (not ((_ is MissingZero!240) lt!34036)) (and (bvsge (index!3092 lt!34036) #b00000000000000000000000000000000) (bvslt (index!3092 lt!34036) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))) (or ((_ is Undefined!240) lt!34036) ((_ is Found!240) lt!34036) ((_ is MissingZero!240) lt!34036) (not ((_ is MissingVacant!240) lt!34036)) (and (bvsge (index!3095 lt!34036) #b00000000000000000000000000000000) (bvslt (index!3095 lt!34036) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))) (or ((_ is Undefined!240) lt!34036) (ite ((_ is Found!240) lt!34036) (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (index!3093 lt!34036)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!240) lt!34036) (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (index!3092 lt!34036)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!240) lt!34036) (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (index!3095 lt!34036)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!49250 () SeekEntryResult!240)

(assert (=> d!17855 (= lt!34036 e!49250)))

(declare-fun c!11431 () Bool)

(assert (=> d!17855 (= c!11431 (and ((_ is Intermediate!240) lt!34034) (undefined!1052 lt!34034)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3885 (_ BitVec 32)) SeekEntryResult!240)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!17855 (= lt!34034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b00000000000000000000000000000000) (mask!6209 (v!2539 (underlying!259 thiss!992)))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b00000000000000000000000000000000) (_keys!3888 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992)))))))

(assert (=> d!17855 (validMask!0 (mask!6209 (v!2539 (underlying!259 thiss!992))))))

(assert (=> d!17855 (= (seekEntryOrOpen!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b00000000000000000000000000000000) (_keys!3888 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992)))) lt!34036)))

(declare-fun b!75378 () Bool)

(assert (=> b!75378 (= e!49251 (Found!240 (index!3094 lt!34034)))))

(declare-fun b!75379 () Bool)

(assert (=> b!75379 (= e!49250 e!49251)))

(assert (=> b!75379 (= lt!34035 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (index!3094 lt!34034)))))

(declare-fun c!11430 () Bool)

(assert (=> b!75379 (= c!11430 (= lt!34035 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!75380 () Bool)

(assert (=> b!75380 (= e!49249 (MissingZero!240 (index!3094 lt!34034)))))

(declare-fun b!75381 () Bool)

(assert (=> b!75381 (= e!49250 Undefined!240)))

(assert (= (and d!17855 c!11431) b!75381))

(assert (= (and d!17855 (not c!11431)) b!75379))

(assert (= (and b!75379 c!11430) b!75378))

(assert (= (and b!75379 (not c!11430)) b!75376))

(assert (= (and b!75376 c!11432) b!75380))

(assert (= (and b!75376 (not c!11432)) b!75377))

(assert (=> b!75377 m!74291))

(declare-fun m!74705 () Bool)

(assert (=> b!75377 m!74705))

(assert (=> d!17855 m!74291))

(declare-fun m!74707 () Bool)

(assert (=> d!17855 m!74707))

(declare-fun m!74709 () Bool)

(assert (=> d!17855 m!74709))

(assert (=> d!17855 m!74149))

(declare-fun m!74711 () Bool)

(assert (=> d!17855 m!74711))

(assert (=> d!17855 m!74707))

(assert (=> d!17855 m!74291))

(declare-fun m!74713 () Bool)

(assert (=> d!17855 m!74713))

(declare-fun m!74715 () Bool)

(assert (=> d!17855 m!74715))

(declare-fun m!74717 () Bool)

(assert (=> b!75379 m!74717))

(assert (=> b!74958 d!17855))

(declare-fun d!17857 () Bool)

(assert (=> d!17857 (isDefined!86 (getValueByKey!132 (toList!720 lt!33652) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun lt!34039 () Unit!2147)

(declare-fun choose!439 (List!1488 (_ BitVec 64)) Unit!2147)

(assert (=> d!17857 (= lt!34039 (choose!439 (toList!720 lt!33652) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun e!49254 () Bool)

(assert (=> d!17857 e!49254))

(declare-fun res!39749 () Bool)

(assert (=> d!17857 (=> (not res!39749) (not e!49254))))

(assert (=> d!17857 (= res!39749 (isStrictlySorted!288 (toList!720 lt!33652)))))

(assert (=> d!17857 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 lt!33652) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) lt!34039)))

(declare-fun b!75384 () Bool)

(assert (=> b!75384 (= e!49254 (containsKey!136 (toList!720 lt!33652) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(assert (= (and d!17857 res!39749) b!75384))

(assert (=> d!17857 m!74111))

(assert (=> d!17857 m!74321))

(assert (=> d!17857 m!74321))

(assert (=> d!17857 m!74323))

(assert (=> d!17857 m!74111))

(declare-fun m!74719 () Bool)

(assert (=> d!17857 m!74719))

(declare-fun m!74721 () Bool)

(assert (=> d!17857 m!74721))

(assert (=> b!75384 m!74111))

(assert (=> b!75384 m!74317))

(assert (=> b!74993 d!17857))

(declare-fun d!17859 () Bool)

(declare-fun isEmpty!324 (Option!138) Bool)

(assert (=> d!17859 (= (isDefined!86 (getValueByKey!132 (toList!720 lt!33652) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355))) (not (isEmpty!324 (getValueByKey!132 (toList!720 lt!33652) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))))

(declare-fun bs!3230 () Bool)

(assert (= bs!3230 d!17859))

(assert (=> bs!3230 m!74321))

(declare-fun m!74723 () Bool)

(assert (=> bs!3230 m!74723))

(assert (=> b!74993 d!17859))

(declare-fun b!75388 () Bool)

(declare-fun e!49256 () Option!138)

(assert (=> b!75388 (= e!49256 None!136)))

(declare-fun b!75386 () Bool)

(declare-fun e!49255 () Option!138)

(assert (=> b!75386 (= e!49255 e!49256)))

(declare-fun c!11434 () Bool)

(assert (=> b!75386 (= c!11434 (and ((_ is Cons!1484) (toList!720 lt!33652)) (not (= (_1!1076 (h!2072 (toList!720 lt!33652))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))))

(declare-fun b!75387 () Bool)

(assert (=> b!75387 (= e!49256 (getValueByKey!132 (t!5057 (toList!720 lt!33652)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun c!11433 () Bool)

(declare-fun d!17861 () Bool)

(assert (=> d!17861 (= c!11433 (and ((_ is Cons!1484) (toList!720 lt!33652)) (= (_1!1076 (h!2072 (toList!720 lt!33652))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355))))))

(assert (=> d!17861 (= (getValueByKey!132 (toList!720 lt!33652) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) e!49255)))

(declare-fun b!75385 () Bool)

(assert (=> b!75385 (= e!49255 (Some!137 (_2!1076 (h!2072 (toList!720 lt!33652)))))))

(assert (= (and d!17861 c!11433) b!75385))

(assert (= (and d!17861 (not c!11433)) b!75386))

(assert (= (and b!75386 c!11434) b!75387))

(assert (= (and b!75386 (not c!11434)) b!75388))

(assert (=> b!75387 m!74111))

(declare-fun m!74725 () Bool)

(assert (=> b!75387 m!74725))

(assert (=> b!74993 d!17861))

(assert (=> b!75162 d!17843))

(declare-fun d!17863 () Bool)

(declare-fun e!49258 () Bool)

(assert (=> d!17863 e!49258))

(declare-fun res!39750 () Bool)

(assert (=> d!17863 (=> res!39750 e!49258)))

(declare-fun lt!34043 () Bool)

(assert (=> d!17863 (= res!39750 (not lt!34043))))

(declare-fun lt!34042 () Bool)

(assert (=> d!17863 (= lt!34043 lt!34042)))

(declare-fun lt!34040 () Unit!2147)

(declare-fun e!49257 () Unit!2147)

(assert (=> d!17863 (= lt!34040 e!49257)))

(declare-fun c!11435 () Bool)

(assert (=> d!17863 (= c!11435 lt!34042)))

(assert (=> d!17863 (= lt!34042 (containsKey!136 (toList!720 call!6684) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(assert (=> d!17863 (= (contains!723 call!6684 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) lt!34043)))

(declare-fun b!75389 () Bool)

(declare-fun lt!34041 () Unit!2147)

(assert (=> b!75389 (= e!49257 lt!34041)))

(assert (=> b!75389 (= lt!34041 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 call!6684) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(assert (=> b!75389 (isDefined!86 (getValueByKey!132 (toList!720 call!6684) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun b!75390 () Bool)

(declare-fun Unit!2164 () Unit!2147)

(assert (=> b!75390 (= e!49257 Unit!2164)))

(declare-fun b!75391 () Bool)

(assert (=> b!75391 (= e!49258 (isDefined!86 (getValueByKey!132 (toList!720 call!6684) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355))))))

(assert (= (and d!17863 c!11435) b!75389))

(assert (= (and d!17863 (not c!11435)) b!75390))

(assert (= (and d!17863 (not res!39750)) b!75391))

(assert (=> d!17863 m!74111))

(declare-fun m!74727 () Bool)

(assert (=> d!17863 m!74727))

(assert (=> b!75389 m!74111))

(declare-fun m!74729 () Bool)

(assert (=> b!75389 m!74729))

(assert (=> b!75389 m!74111))

(declare-fun m!74731 () Bool)

(assert (=> b!75389 m!74731))

(assert (=> b!75389 m!74731))

(declare-fun m!74733 () Bool)

(assert (=> b!75389 m!74733))

(assert (=> b!75391 m!74111))

(assert (=> b!75391 m!74731))

(assert (=> b!75391 m!74731))

(assert (=> b!75391 m!74733))

(assert (=> b!75089 d!17863))

(declare-fun b!75392 () Bool)

(declare-fun c!11438 () Bool)

(declare-fun lt!34045 () (_ BitVec 64))

(assert (=> b!75392 (= c!11438 (= lt!34045 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49261 () SeekEntryResult!240)

(declare-fun e!49259 () SeekEntryResult!240)

(assert (=> b!75392 (= e!49261 e!49259)))

(declare-fun b!75393 () Bool)

(declare-fun lt!34044 () SeekEntryResult!240)

(assert (=> b!75393 (= e!49259 (seekKeyOrZeroReturnVacant!0 (x!11299 lt!34044) (index!3094 lt!34044) (index!3094 lt!34044) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (_keys!3888 newMap!16) (mask!6209 newMap!16)))))

(declare-fun lt!34046 () SeekEntryResult!240)

(declare-fun d!17865 () Bool)

(assert (=> d!17865 (and (or ((_ is Undefined!240) lt!34046) (not ((_ is Found!240) lt!34046)) (and (bvsge (index!3093 lt!34046) #b00000000000000000000000000000000) (bvslt (index!3093 lt!34046) (size!2092 (_keys!3888 newMap!16))))) (or ((_ is Undefined!240) lt!34046) ((_ is Found!240) lt!34046) (not ((_ is MissingZero!240) lt!34046)) (and (bvsge (index!3092 lt!34046) #b00000000000000000000000000000000) (bvslt (index!3092 lt!34046) (size!2092 (_keys!3888 newMap!16))))) (or ((_ is Undefined!240) lt!34046) ((_ is Found!240) lt!34046) ((_ is MissingZero!240) lt!34046) (not ((_ is MissingVacant!240) lt!34046)) (and (bvsge (index!3095 lt!34046) #b00000000000000000000000000000000) (bvslt (index!3095 lt!34046) (size!2092 (_keys!3888 newMap!16))))) (or ((_ is Undefined!240) lt!34046) (ite ((_ is Found!240) lt!34046) (= (select (arr!1852 (_keys!3888 newMap!16)) (index!3093 lt!34046)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) (ite ((_ is MissingZero!240) lt!34046) (= (select (arr!1852 (_keys!3888 newMap!16)) (index!3092 lt!34046)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!240) lt!34046) (= (select (arr!1852 (_keys!3888 newMap!16)) (index!3095 lt!34046)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!49260 () SeekEntryResult!240)

(assert (=> d!17865 (= lt!34046 e!49260)))

(declare-fun c!11437 () Bool)

(assert (=> d!17865 (= c!11437 (and ((_ is Intermediate!240) lt!34044) (undefined!1052 lt!34044)))))

(assert (=> d!17865 (= lt!34044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (mask!6209 newMap!16)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (_keys!3888 newMap!16) (mask!6209 newMap!16)))))

(assert (=> d!17865 (validMask!0 (mask!6209 newMap!16))))

(assert (=> d!17865 (= (seekEntryOrOpen!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (_keys!3888 newMap!16) (mask!6209 newMap!16)) lt!34046)))

(declare-fun b!75394 () Bool)

(assert (=> b!75394 (= e!49261 (Found!240 (index!3094 lt!34044)))))

(declare-fun b!75395 () Bool)

(assert (=> b!75395 (= e!49260 e!49261)))

(assert (=> b!75395 (= lt!34045 (select (arr!1852 (_keys!3888 newMap!16)) (index!3094 lt!34044)))))

(declare-fun c!11436 () Bool)

(assert (=> b!75395 (= c!11436 (= lt!34045 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun b!75396 () Bool)

(assert (=> b!75396 (= e!49259 (MissingZero!240 (index!3094 lt!34044)))))

(declare-fun b!75397 () Bool)

(assert (=> b!75397 (= e!49260 Undefined!240)))

(assert (= (and d!17865 c!11437) b!75397))

(assert (= (and d!17865 (not c!11437)) b!75395))

(assert (= (and b!75395 c!11436) b!75394))

(assert (= (and b!75395 (not c!11436)) b!75392))

(assert (= (and b!75392 c!11438) b!75396))

(assert (= (and b!75392 (not c!11438)) b!75393))

(assert (=> b!75393 m!74111))

(declare-fun m!74735 () Bool)

(assert (=> b!75393 m!74735))

(assert (=> d!17865 m!74111))

(declare-fun m!74737 () Bool)

(assert (=> d!17865 m!74737))

(declare-fun m!74739 () Bool)

(assert (=> d!17865 m!74739))

(assert (=> d!17865 m!74529))

(declare-fun m!74741 () Bool)

(assert (=> d!17865 m!74741))

(assert (=> d!17865 m!74737))

(assert (=> d!17865 m!74111))

(declare-fun m!74743 () Bool)

(assert (=> d!17865 m!74743))

(declare-fun m!74745 () Bool)

(assert (=> d!17865 m!74745))

(declare-fun m!74747 () Bool)

(assert (=> b!75395 m!74747))

(assert (=> bm!6680 d!17865))

(assert (=> b!74995 d!17859))

(assert (=> b!74995 d!17861))

(declare-fun b!75398 () Bool)

(declare-fun e!49263 () Bool)

(declare-fun e!49265 () Bool)

(assert (=> b!75398 (= e!49263 e!49265)))

(declare-fun c!11440 () Bool)

(declare-fun e!49268 () Bool)

(assert (=> b!75398 (= c!11440 e!49268)))

(declare-fun res!39753 () Bool)

(assert (=> b!75398 (=> (not res!39753) (not e!49268))))

(assert (=> b!75398 (= res!39753 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun bm!6737 () Bool)

(declare-fun call!6740 () ListLongMap!1409)

(assert (=> bm!6737 (= call!6740 (getCurrentListMapNoExtraKeys!59 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun b!75399 () Bool)

(declare-fun e!49266 () ListLongMap!1409)

(assert (=> b!75399 (= e!49266 (ListLongMap!1410 Nil!1485))))

(declare-fun b!75400 () Bool)

(declare-fun lt!34053 () Unit!2147)

(declare-fun lt!34049 () Unit!2147)

(assert (=> b!75400 (= lt!34053 lt!34049)))

(declare-fun lt!34048 () V!2953)

(declare-fun lt!34052 () (_ BitVec 64))

(declare-fun lt!34051 () (_ BitVec 64))

(declare-fun lt!34050 () ListLongMap!1409)

(assert (=> b!75400 (not (contains!723 (+!95 lt!34050 (tuple2!2131 lt!34051 lt!34048)) lt!34052))))

(assert (=> b!75400 (= lt!34049 (addStillNotContains!26 lt!34050 lt!34051 lt!34048 lt!34052))))

(assert (=> b!75400 (= lt!34052 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!75400 (= lt!34048 (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75400 (= lt!34051 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!75400 (= lt!34050 call!6740)))

(declare-fun e!49262 () ListLongMap!1409)

(assert (=> b!75400 (= e!49262 (+!95 call!6740 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!75401 () Bool)

(declare-fun e!49264 () Bool)

(assert (=> b!75401 (= e!49265 e!49264)))

(declare-fun c!11441 () Bool)

(assert (=> b!75401 (= c!11441 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun d!17867 () Bool)

(assert (=> d!17867 e!49263))

(declare-fun res!39754 () Bool)

(assert (=> d!17867 (=> (not res!39754) (not e!49263))))

(declare-fun lt!34047 () ListLongMap!1409)

(assert (=> d!17867 (= res!39754 (not (contains!723 lt!34047 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17867 (= lt!34047 e!49266)))

(declare-fun c!11439 () Bool)

(assert (=> d!17867 (= c!11439 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(assert (=> d!17867 (validMask!0 (mask!6209 (v!2539 (underlying!259 thiss!992))))))

(assert (=> d!17867 (= (getCurrentListMapNoExtraKeys!59 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))) lt!34047)))

(declare-fun b!75402 () Bool)

(assert (=> b!75402 (= e!49264 (isEmpty!323 lt!34047))))

(declare-fun b!75403 () Bool)

(assert (=> b!75403 (= e!49268 (validKeyInArray!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!75403 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!75404 () Bool)

(assert (=> b!75404 (= e!49262 call!6740)))

(declare-fun b!75405 () Bool)

(assert (=> b!75405 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(assert (=> b!75405 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2093 (_values!2216 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun e!49267 () Bool)

(assert (=> b!75405 (= e!49267 (= (apply!76 lt!34047 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!75406 () Bool)

(assert (=> b!75406 (= e!49266 e!49262)))

(declare-fun c!11442 () Bool)

(assert (=> b!75406 (= c!11442 (validKeyInArray!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!75407 () Bool)

(assert (=> b!75407 (= e!49265 e!49267)))

(assert (=> b!75407 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun res!39751 () Bool)

(assert (=> b!75407 (= res!39751 (contains!723 lt!34047 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!75407 (=> (not res!39751) (not e!49267))))

(declare-fun b!75408 () Bool)

(assert (=> b!75408 (= e!49264 (= lt!34047 (getCurrentListMapNoExtraKeys!59 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun b!75409 () Bool)

(declare-fun res!39752 () Bool)

(assert (=> b!75409 (=> (not res!39752) (not e!49263))))

(assert (=> b!75409 (= res!39752 (not (contains!723 lt!34047 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17867 c!11439) b!75399))

(assert (= (and d!17867 (not c!11439)) b!75406))

(assert (= (and b!75406 c!11442) b!75400))

(assert (= (and b!75406 (not c!11442)) b!75404))

(assert (= (or b!75400 b!75404) bm!6737))

(assert (= (and d!17867 res!39754) b!75409))

(assert (= (and b!75409 res!39752) b!75398))

(assert (= (and b!75398 res!39753) b!75403))

(assert (= (and b!75398 c!11440) b!75407))

(assert (= (and b!75398 (not c!11440)) b!75401))

(assert (= (and b!75407 res!39751) b!75405))

(assert (= (and b!75401 c!11441) b!75408))

(assert (= (and b!75401 (not c!11441)) b!75402))

(declare-fun b_lambda!3379 () Bool)

(assert (=> (not b_lambda!3379) (not b!75400)))

(assert (=> b!75400 t!5054))

(declare-fun b_and!4605 () Bool)

(assert (= b_and!4601 (and (=> t!5054 result!2697) b_and!4605)))

(assert (=> b!75400 t!5056))

(declare-fun b_and!4607 () Bool)

(assert (= b_and!4603 (and (=> t!5056 result!2701) b_and!4607)))

(declare-fun b_lambda!3381 () Bool)

(assert (=> (not b_lambda!3381) (not b!75405)))

(assert (=> b!75405 t!5054))

(declare-fun b_and!4609 () Bool)

(assert (= b_and!4605 (and (=> t!5054 result!2697) b_and!4609)))

(assert (=> b!75405 t!5056))

(declare-fun b_and!4611 () Bool)

(assert (= b_and!4607 (and (=> t!5056 result!2701) b_and!4611)))

(declare-fun m!74749 () Bool)

(assert (=> b!75405 m!74749))

(assert (=> b!75405 m!74131))

(declare-fun m!74751 () Bool)

(assert (=> b!75405 m!74751))

(declare-fun m!74753 () Bool)

(assert (=> b!75405 m!74753))

(declare-fun m!74755 () Bool)

(assert (=> b!75405 m!74755))

(assert (=> b!75405 m!74131))

(assert (=> b!75405 m!74749))

(assert (=> b!75405 m!74753))

(declare-fun m!74757 () Bool)

(assert (=> bm!6737 m!74757))

(declare-fun m!74759 () Bool)

(assert (=> b!75409 m!74759))

(declare-fun m!74761 () Bool)

(assert (=> d!17867 m!74761))

(assert (=> d!17867 m!74149))

(assert (=> b!75403 m!74753))

(assert (=> b!75403 m!74753))

(declare-fun m!74763 () Bool)

(assert (=> b!75403 m!74763))

(declare-fun m!74765 () Bool)

(assert (=> b!75402 m!74765))

(assert (=> b!75408 m!74757))

(assert (=> b!75407 m!74753))

(assert (=> b!75407 m!74753))

(declare-fun m!74767 () Bool)

(assert (=> b!75407 m!74767))

(assert (=> b!75406 m!74753))

(assert (=> b!75406 m!74753))

(assert (=> b!75406 m!74763))

(declare-fun m!74769 () Bool)

(assert (=> b!75400 m!74769))

(declare-fun m!74771 () Bool)

(assert (=> b!75400 m!74771))

(declare-fun m!74773 () Bool)

(assert (=> b!75400 m!74773))

(assert (=> b!75400 m!74749))

(assert (=> b!75400 m!74131))

(assert (=> b!75400 m!74751))

(assert (=> b!75400 m!74771))

(declare-fun m!74775 () Bool)

(assert (=> b!75400 m!74775))

(assert (=> b!75400 m!74131))

(assert (=> b!75400 m!74749))

(assert (=> b!75400 m!74753))

(assert (=> b!75164 d!17867))

(declare-fun d!17869 () Bool)

(declare-fun e!49269 () Bool)

(assert (=> d!17869 e!49269))

(declare-fun res!39756 () Bool)

(assert (=> d!17869 (=> (not res!39756) (not e!49269))))

(declare-fun lt!34055 () ListLongMap!1409)

(assert (=> d!17869 (= res!39756 (contains!723 lt!34055 (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(declare-fun lt!34054 () List!1488)

(assert (=> d!17869 (= lt!34055 (ListLongMap!1410 lt!34054))))

(declare-fun lt!34057 () Unit!2147)

(declare-fun lt!34056 () Unit!2147)

(assert (=> d!17869 (= lt!34057 lt!34056)))

(assert (=> d!17869 (= (getValueByKey!132 lt!34054 (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))) (Some!137 (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(assert (=> d!17869 (= lt!34056 (lemmaContainsTupThenGetReturnValue!52 lt!34054 (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)) (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(assert (=> d!17869 (= lt!34054 (insertStrictlySorted!55 (toList!720 call!6693) (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)) (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(assert (=> d!17869 (= (+!95 call!6693 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)) lt!34055)))

(declare-fun b!75410 () Bool)

(declare-fun res!39755 () Bool)

(assert (=> b!75410 (=> (not res!39755) (not e!49269))))

(assert (=> b!75410 (= res!39755 (= (getValueByKey!132 (toList!720 lt!34055) (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))) (Some!137 (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)))))))

(declare-fun b!75411 () Bool)

(assert (=> b!75411 (= e!49269 (contains!725 (toList!720 lt!34055) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)))))

(assert (= (and d!17869 res!39756) b!75410))

(assert (= (and b!75410 res!39755) b!75411))

(declare-fun m!74777 () Bool)

(assert (=> d!17869 m!74777))

(declare-fun m!74779 () Bool)

(assert (=> d!17869 m!74779))

(declare-fun m!74781 () Bool)

(assert (=> d!17869 m!74781))

(declare-fun m!74783 () Bool)

(assert (=> d!17869 m!74783))

(declare-fun m!74785 () Bool)

(assert (=> b!75410 m!74785))

(declare-fun m!74787 () Bool)

(assert (=> b!75411 m!74787))

(assert (=> b!75119 d!17869))

(assert (=> b!75232 d!17843))

(declare-fun d!17871 () Bool)

(declare-fun e!49270 () Bool)

(assert (=> d!17871 e!49270))

(declare-fun res!39758 () Bool)

(assert (=> d!17871 (=> (not res!39758) (not e!49270))))

(declare-fun lt!34059 () ListLongMap!1409)

(assert (=> d!17871 (= res!39758 (contains!723 lt!34059 (_1!1076 (tuple2!2131 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(declare-fun lt!34058 () List!1488)

(assert (=> d!17871 (= lt!34059 (ListLongMap!1410 lt!34058))))

(declare-fun lt!34061 () Unit!2147)

(declare-fun lt!34060 () Unit!2147)

(assert (=> d!17871 (= lt!34061 lt!34060)))

(assert (=> d!17871 (= (getValueByKey!132 lt!34058 (_1!1076 (tuple2!2131 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))) (Some!137 (_2!1076 (tuple2!2131 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17871 (= lt!34060 (lemmaContainsTupThenGetReturnValue!52 lt!34058 (_1!1076 (tuple2!2131 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992))))) (_2!1076 (tuple2!2131 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17871 (= lt!34058 (insertStrictlySorted!55 (toList!720 lt!33946) (_1!1076 (tuple2!2131 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992))))) (_2!1076 (tuple2!2131 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17871 (= (+!95 lt!33946 (tuple2!2131 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!34059)))

(declare-fun b!75412 () Bool)

(declare-fun res!39757 () Bool)

(assert (=> b!75412 (=> (not res!39757) (not e!49270))))

(assert (=> b!75412 (= res!39757 (= (getValueByKey!132 (toList!720 lt!34059) (_1!1076 (tuple2!2131 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))) (Some!137 (_2!1076 (tuple2!2131 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992))))))))))

(declare-fun b!75413 () Bool)

(assert (=> b!75413 (= e!49270 (contains!725 (toList!720 lt!34059) (tuple2!2131 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992))))))))

(assert (= (and d!17871 res!39758) b!75412))

(assert (= (and b!75412 res!39757) b!75413))

(declare-fun m!74789 () Bool)

(assert (=> d!17871 m!74789))

(declare-fun m!74791 () Bool)

(assert (=> d!17871 m!74791))

(declare-fun m!74793 () Bool)

(assert (=> d!17871 m!74793))

(declare-fun m!74795 () Bool)

(assert (=> d!17871 m!74795))

(declare-fun m!74797 () Bool)

(assert (=> b!75412 m!74797))

(declare-fun m!74799 () Bool)

(assert (=> b!75413 m!74799))

(assert (=> b!75218 d!17871))

(declare-fun d!17873 () Bool)

(assert (=> d!17873 (= (apply!76 (+!95 lt!33952 (tuple2!2131 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!33944) (apply!76 lt!33952 lt!33944))))

(declare-fun lt!34064 () Unit!2147)

(declare-fun choose!440 (ListLongMap!1409 (_ BitVec 64) V!2953 (_ BitVec 64)) Unit!2147)

(assert (=> d!17873 (= lt!34064 (choose!440 lt!33952 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) lt!33944))))

(declare-fun e!49273 () Bool)

(assert (=> d!17873 e!49273))

(declare-fun res!39761 () Bool)

(assert (=> d!17873 (=> (not res!39761) (not e!49273))))

(assert (=> d!17873 (= res!39761 (contains!723 lt!33952 lt!33944))))

(assert (=> d!17873 (= (addApplyDifferent!52 lt!33952 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) lt!33944) lt!34064)))

(declare-fun b!75417 () Bool)

(assert (=> b!75417 (= e!49273 (not (= lt!33944 lt!33945)))))

(assert (= (and d!17873 res!39761) b!75417))

(declare-fun m!74801 () Bool)

(assert (=> d!17873 m!74801))

(assert (=> d!17873 m!74475))

(assert (=> d!17873 m!74493))

(assert (=> d!17873 m!74483))

(assert (=> d!17873 m!74475))

(declare-fun m!74803 () Bool)

(assert (=> d!17873 m!74803))

(assert (=> b!75218 d!17873))

(declare-fun d!17875 () Bool)

(assert (=> d!17875 (= (apply!76 (+!95 lt!33952 (tuple2!2131 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!33944) (get!1153 (getValueByKey!132 (toList!720 (+!95 lt!33952 (tuple2!2131 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))) lt!33944)))))

(declare-fun bs!3231 () Bool)

(assert (= bs!3231 d!17875))

(declare-fun m!74805 () Bool)

(assert (=> bs!3231 m!74805))

(assert (=> bs!3231 m!74805))

(declare-fun m!74807 () Bool)

(assert (=> bs!3231 m!74807))

(assert (=> b!75218 d!17875))

(assert (=> b!75218 d!17789))

(declare-fun d!17877 () Bool)

(assert (=> d!17877 (= (apply!76 (+!95 lt!33946 (tuple2!2131 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!33954) (apply!76 lt!33946 lt!33954))))

(declare-fun lt!34065 () Unit!2147)

(assert (=> d!17877 (= lt!34065 (choose!440 lt!33946 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992))) lt!33954))))

(declare-fun e!49274 () Bool)

(assert (=> d!17877 e!49274))

(declare-fun res!39762 () Bool)

(assert (=> d!17877 (=> (not res!39762) (not e!49274))))

(assert (=> d!17877 (= res!39762 (contains!723 lt!33946 lt!33954))))

(assert (=> d!17877 (= (addApplyDifferent!52 lt!33946 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992))) lt!33954) lt!34065)))

(declare-fun b!75418 () Bool)

(assert (=> b!75418 (= e!49274 (not (= lt!33954 lt!33941)))))

(assert (= (and d!17877 res!39762) b!75418))

(declare-fun m!74809 () Bool)

(assert (=> d!17877 m!74809))

(assert (=> d!17877 m!74477))

(assert (=> d!17877 m!74479))

(assert (=> d!17877 m!74471))

(assert (=> d!17877 m!74477))

(declare-fun m!74811 () Bool)

(assert (=> d!17877 m!74811))

(assert (=> b!75218 d!17877))

(declare-fun d!17879 () Bool)

(declare-fun e!49276 () Bool)

(assert (=> d!17879 e!49276))

(declare-fun res!39763 () Bool)

(assert (=> d!17879 (=> res!39763 e!49276)))

(declare-fun lt!34069 () Bool)

(assert (=> d!17879 (= res!39763 (not lt!34069))))

(declare-fun lt!34068 () Bool)

(assert (=> d!17879 (= lt!34069 lt!34068)))

(declare-fun lt!34066 () Unit!2147)

(declare-fun e!49275 () Unit!2147)

(assert (=> d!17879 (= lt!34066 e!49275)))

(declare-fun c!11443 () Bool)

(assert (=> d!17879 (= c!11443 lt!34068)))

(assert (=> d!17879 (= lt!34068 (containsKey!136 (toList!720 (+!95 lt!33938 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))) lt!33953))))

(assert (=> d!17879 (= (contains!723 (+!95 lt!33938 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!33953) lt!34069)))

(declare-fun b!75419 () Bool)

(declare-fun lt!34067 () Unit!2147)

(assert (=> b!75419 (= e!49275 lt!34067)))

(assert (=> b!75419 (= lt!34067 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 (+!95 lt!33938 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))) lt!33953))))

(assert (=> b!75419 (isDefined!86 (getValueByKey!132 (toList!720 (+!95 lt!33938 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))) lt!33953))))

(declare-fun b!75420 () Bool)

(declare-fun Unit!2165 () Unit!2147)

(assert (=> b!75420 (= e!49275 Unit!2165)))

(declare-fun b!75421 () Bool)

(assert (=> b!75421 (= e!49276 (isDefined!86 (getValueByKey!132 (toList!720 (+!95 lt!33938 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))) lt!33953)))))

(assert (= (and d!17879 c!11443) b!75419))

(assert (= (and d!17879 (not c!11443)) b!75420))

(assert (= (and d!17879 (not res!39763)) b!75421))

(declare-fun m!74813 () Bool)

(assert (=> d!17879 m!74813))

(declare-fun m!74815 () Bool)

(assert (=> b!75419 m!74815))

(declare-fun m!74817 () Bool)

(assert (=> b!75419 m!74817))

(assert (=> b!75419 m!74817))

(declare-fun m!74819 () Bool)

(assert (=> b!75419 m!74819))

(assert (=> b!75421 m!74817))

(assert (=> b!75421 m!74817))

(assert (=> b!75421 m!74819))

(assert (=> b!75218 d!17879))

(declare-fun d!17881 () Bool)

(assert (=> d!17881 (contains!723 (+!95 lt!33938 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!33953)))

(declare-fun lt!34072 () Unit!2147)

(declare-fun choose!441 (ListLongMap!1409 (_ BitVec 64) V!2953 (_ BitVec 64)) Unit!2147)

(assert (=> d!17881 (= lt!34072 (choose!441 lt!33938 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) lt!33953))))

(assert (=> d!17881 (contains!723 lt!33938 lt!33953)))

(assert (=> d!17881 (= (addStillContains!52 lt!33938 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) lt!33953) lt!34072)))

(declare-fun bs!3232 () Bool)

(assert (= bs!3232 d!17881))

(assert (=> bs!3232 m!74495))

(assert (=> bs!3232 m!74495))

(assert (=> bs!3232 m!74497))

(declare-fun m!74821 () Bool)

(assert (=> bs!3232 m!74821))

(declare-fun m!74823 () Bool)

(assert (=> bs!3232 m!74823))

(assert (=> b!75218 d!17881))

(declare-fun d!17883 () Bool)

(assert (=> d!17883 (= (apply!76 (+!95 lt!33935 (tuple2!2131 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!33940) (apply!76 lt!33935 lt!33940))))

(declare-fun lt!34073 () Unit!2147)

(assert (=> d!17883 (= lt!34073 (choose!440 lt!33935 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992))) lt!33940))))

(declare-fun e!49277 () Bool)

(assert (=> d!17883 e!49277))

(declare-fun res!39764 () Bool)

(assert (=> d!17883 (=> (not res!39764) (not e!49277))))

(assert (=> d!17883 (= res!39764 (contains!723 lt!33935 lt!33940))))

(assert (=> d!17883 (= (addApplyDifferent!52 lt!33935 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992))) lt!33940) lt!34073)))

(declare-fun b!75423 () Bool)

(assert (=> b!75423 (= e!49277 (not (= lt!33940 lt!33951)))))

(assert (= (and d!17883 res!39764) b!75423))

(declare-fun m!74825 () Bool)

(assert (=> d!17883 m!74825))

(assert (=> d!17883 m!74485))

(assert (=> d!17883 m!74487))

(assert (=> d!17883 m!74489))

(assert (=> d!17883 m!74485))

(declare-fun m!74827 () Bool)

(assert (=> d!17883 m!74827))

(assert (=> b!75218 d!17883))

(declare-fun d!17885 () Bool)

(assert (=> d!17885 (= (apply!76 (+!95 lt!33935 (tuple2!2131 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!33940) (get!1153 (getValueByKey!132 (toList!720 (+!95 lt!33935 (tuple2!2131 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))) lt!33940)))))

(declare-fun bs!3233 () Bool)

(assert (= bs!3233 d!17885))

(declare-fun m!74829 () Bool)

(assert (=> bs!3233 m!74829))

(assert (=> bs!3233 m!74829))

(declare-fun m!74831 () Bool)

(assert (=> bs!3233 m!74831))

(assert (=> b!75218 d!17885))

(declare-fun d!17887 () Bool)

(assert (=> d!17887 (= (apply!76 lt!33935 lt!33940) (get!1153 (getValueByKey!132 (toList!720 lt!33935) lt!33940)))))

(declare-fun bs!3234 () Bool)

(assert (= bs!3234 d!17887))

(declare-fun m!74833 () Bool)

(assert (=> bs!3234 m!74833))

(assert (=> bs!3234 m!74833))

(declare-fun m!74835 () Bool)

(assert (=> bs!3234 m!74835))

(assert (=> b!75218 d!17887))

(declare-fun d!17889 () Bool)

(assert (=> d!17889 (= (apply!76 (+!95 lt!33946 (tuple2!2131 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!33954) (get!1153 (getValueByKey!132 (toList!720 (+!95 lt!33946 (tuple2!2131 lt!33941 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))) lt!33954)))))

(declare-fun bs!3235 () Bool)

(assert (= bs!3235 d!17889))

(declare-fun m!74837 () Bool)

(assert (=> bs!3235 m!74837))

(assert (=> bs!3235 m!74837))

(declare-fun m!74839 () Bool)

(assert (=> bs!3235 m!74839))

(assert (=> b!75218 d!17889))

(declare-fun d!17891 () Bool)

(assert (=> d!17891 (= (apply!76 lt!33946 lt!33954) (get!1153 (getValueByKey!132 (toList!720 lt!33946) lt!33954)))))

(declare-fun bs!3236 () Bool)

(assert (= bs!3236 d!17891))

(declare-fun m!74841 () Bool)

(assert (=> bs!3236 m!74841))

(assert (=> bs!3236 m!74841))

(declare-fun m!74843 () Bool)

(assert (=> bs!3236 m!74843))

(assert (=> b!75218 d!17891))

(declare-fun d!17893 () Bool)

(declare-fun e!49278 () Bool)

(assert (=> d!17893 e!49278))

(declare-fun res!39766 () Bool)

(assert (=> d!17893 (=> (not res!39766) (not e!49278))))

(declare-fun lt!34075 () ListLongMap!1409)

(assert (=> d!17893 (= res!39766 (contains!723 lt!34075 (_1!1076 (tuple2!2131 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(declare-fun lt!34074 () List!1488)

(assert (=> d!17893 (= lt!34075 (ListLongMap!1410 lt!34074))))

(declare-fun lt!34077 () Unit!2147)

(declare-fun lt!34076 () Unit!2147)

(assert (=> d!17893 (= lt!34077 lt!34076)))

(assert (=> d!17893 (= (getValueByKey!132 lt!34074 (_1!1076 (tuple2!2131 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))) (Some!137 (_2!1076 (tuple2!2131 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17893 (= lt!34076 (lemmaContainsTupThenGetReturnValue!52 lt!34074 (_1!1076 (tuple2!2131 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992))))) (_2!1076 (tuple2!2131 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17893 (= lt!34074 (insertStrictlySorted!55 (toList!720 lt!33935) (_1!1076 (tuple2!2131 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992))))) (_2!1076 (tuple2!2131 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17893 (= (+!95 lt!33935 (tuple2!2131 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!34075)))

(declare-fun b!75424 () Bool)

(declare-fun res!39765 () Bool)

(assert (=> b!75424 (=> (not res!39765) (not e!49278))))

(assert (=> b!75424 (= res!39765 (= (getValueByKey!132 (toList!720 lt!34075) (_1!1076 (tuple2!2131 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))) (Some!137 (_2!1076 (tuple2!2131 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992))))))))))

(declare-fun b!75425 () Bool)

(assert (=> b!75425 (= e!49278 (contains!725 (toList!720 lt!34075) (tuple2!2131 lt!33951 (minValue!2133 (v!2539 (underlying!259 thiss!992))))))))

(assert (= (and d!17893 res!39766) b!75424))

(assert (= (and b!75424 res!39765) b!75425))

(declare-fun m!74845 () Bool)

(assert (=> d!17893 m!74845))

(declare-fun m!74847 () Bool)

(assert (=> d!17893 m!74847))

(declare-fun m!74849 () Bool)

(assert (=> d!17893 m!74849))

(declare-fun m!74851 () Bool)

(assert (=> d!17893 m!74851))

(declare-fun m!74853 () Bool)

(assert (=> b!75424 m!74853))

(declare-fun m!74855 () Bool)

(assert (=> b!75425 m!74855))

(assert (=> b!75218 d!17893))

(declare-fun d!17895 () Bool)

(declare-fun e!49279 () Bool)

(assert (=> d!17895 e!49279))

(declare-fun res!39768 () Bool)

(assert (=> d!17895 (=> (not res!39768) (not e!49279))))

(declare-fun lt!34079 () ListLongMap!1409)

(assert (=> d!17895 (= res!39768 (contains!723 lt!34079 (_1!1076 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(declare-fun lt!34078 () List!1488)

(assert (=> d!17895 (= lt!34079 (ListLongMap!1410 lt!34078))))

(declare-fun lt!34081 () Unit!2147)

(declare-fun lt!34080 () Unit!2147)

(assert (=> d!17895 (= lt!34081 lt!34080)))

(assert (=> d!17895 (= (getValueByKey!132 lt!34078 (_1!1076 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))) (Some!137 (_2!1076 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17895 (= lt!34080 (lemmaContainsTupThenGetReturnValue!52 lt!34078 (_1!1076 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) (_2!1076 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17895 (= lt!34078 (insertStrictlySorted!55 (toList!720 lt!33938) (_1!1076 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) (_2!1076 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17895 (= (+!95 lt!33938 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!34079)))

(declare-fun b!75426 () Bool)

(declare-fun res!39767 () Bool)

(assert (=> b!75426 (=> (not res!39767) (not e!49279))))

(assert (=> b!75426 (= res!39767 (= (getValueByKey!132 (toList!720 lt!34079) (_1!1076 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))) (Some!137 (_2!1076 (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))))))))

(declare-fun b!75427 () Bool)

(assert (=> b!75427 (= e!49279 (contains!725 (toList!720 lt!34079) (tuple2!2131 lt!33937 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))))))

(assert (= (and d!17895 res!39768) b!75426))

(assert (= (and b!75426 res!39767) b!75427))

(declare-fun m!74857 () Bool)

(assert (=> d!17895 m!74857))

(declare-fun m!74859 () Bool)

(assert (=> d!17895 m!74859))

(declare-fun m!74861 () Bool)

(assert (=> d!17895 m!74861))

(declare-fun m!74863 () Bool)

(assert (=> d!17895 m!74863))

(declare-fun m!74865 () Bool)

(assert (=> b!75426 m!74865))

(declare-fun m!74867 () Bool)

(assert (=> b!75427 m!74867))

(assert (=> b!75218 d!17895))

(declare-fun d!17897 () Bool)

(declare-fun e!49280 () Bool)

(assert (=> d!17897 e!49280))

(declare-fun res!39770 () Bool)

(assert (=> d!17897 (=> (not res!39770) (not e!49280))))

(declare-fun lt!34083 () ListLongMap!1409)

(assert (=> d!17897 (= res!39770 (contains!723 lt!34083 (_1!1076 (tuple2!2131 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(declare-fun lt!34082 () List!1488)

(assert (=> d!17897 (= lt!34083 (ListLongMap!1410 lt!34082))))

(declare-fun lt!34085 () Unit!2147)

(declare-fun lt!34084 () Unit!2147)

(assert (=> d!17897 (= lt!34085 lt!34084)))

(assert (=> d!17897 (= (getValueByKey!132 lt!34082 (_1!1076 (tuple2!2131 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))) (Some!137 (_2!1076 (tuple2!2131 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17897 (= lt!34084 (lemmaContainsTupThenGetReturnValue!52 lt!34082 (_1!1076 (tuple2!2131 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) (_2!1076 (tuple2!2131 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17897 (= lt!34082 (insertStrictlySorted!55 (toList!720 lt!33952) (_1!1076 (tuple2!2131 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) (_2!1076 (tuple2!2131 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17897 (= (+!95 lt!33952 (tuple2!2131 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!34083)))

(declare-fun b!75428 () Bool)

(declare-fun res!39769 () Bool)

(assert (=> b!75428 (=> (not res!39769) (not e!49280))))

(assert (=> b!75428 (= res!39769 (= (getValueByKey!132 (toList!720 lt!34083) (_1!1076 (tuple2!2131 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))) (Some!137 (_2!1076 (tuple2!2131 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))))))))

(declare-fun b!75429 () Bool)

(assert (=> b!75429 (= e!49280 (contains!725 (toList!720 lt!34083) (tuple2!2131 lt!33945 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))))))

(assert (= (and d!17897 res!39770) b!75428))

(assert (= (and b!75428 res!39769) b!75429))

(declare-fun m!74869 () Bool)

(assert (=> d!17897 m!74869))

(declare-fun m!74871 () Bool)

(assert (=> d!17897 m!74871))

(declare-fun m!74873 () Bool)

(assert (=> d!17897 m!74873))

(declare-fun m!74875 () Bool)

(assert (=> d!17897 m!74875))

(declare-fun m!74877 () Bool)

(assert (=> b!75428 m!74877))

(declare-fun m!74879 () Bool)

(assert (=> b!75429 m!74879))

(assert (=> b!75218 d!17897))

(declare-fun d!17899 () Bool)

(assert (=> d!17899 (= (apply!76 lt!33952 lt!33944) (get!1153 (getValueByKey!132 (toList!720 lt!33952) lt!33944)))))

(declare-fun bs!3237 () Bool)

(assert (= bs!3237 d!17899))

(declare-fun m!74881 () Bool)

(assert (=> bs!3237 m!74881))

(assert (=> bs!3237 m!74881))

(declare-fun m!74883 () Bool)

(assert (=> bs!3237 m!74883))

(assert (=> b!75218 d!17899))

(declare-fun b!75440 () Bool)

(declare-fun res!39782 () Bool)

(declare-fun e!49283 () Bool)

(assert (=> b!75440 (=> (not res!39782) (not e!49283))))

(declare-fun size!2098 (LongMapFixedSize!700) (_ BitVec 32))

(assert (=> b!75440 (= res!39782 (= (size!2098 newMap!16) (bvadd (_size!399 newMap!16) (bvsdiv (bvadd (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!17901 () Bool)

(declare-fun res!39779 () Bool)

(assert (=> d!17901 (=> (not res!39779) (not e!49283))))

(assert (=> d!17901 (= res!39779 (validMask!0 (mask!6209 newMap!16)))))

(assert (=> d!17901 (= (simpleValid!52 newMap!16) e!49283)))

(declare-fun b!75438 () Bool)

(declare-fun res!39780 () Bool)

(assert (=> b!75438 (=> (not res!39780) (not e!49283))))

(assert (=> b!75438 (= res!39780 (and (= (size!2093 (_values!2216 newMap!16)) (bvadd (mask!6209 newMap!16) #b00000000000000000000000000000001)) (= (size!2092 (_keys!3888 newMap!16)) (size!2093 (_values!2216 newMap!16))) (bvsge (_size!399 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!399 newMap!16) (bvadd (mask!6209 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!75439 () Bool)

(declare-fun res!39781 () Bool)

(assert (=> b!75439 (=> (not res!39781) (not e!49283))))

(assert (=> b!75439 (= res!39781 (bvsge (size!2098 newMap!16) (_size!399 newMap!16)))))

(declare-fun b!75441 () Bool)

(assert (=> b!75441 (= e!49283 (and (bvsge (extraKeys!2088 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2088 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!399 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!17901 res!39779) b!75438))

(assert (= (and b!75438 res!39780) b!75439))

(assert (= (and b!75439 res!39781) b!75440))

(assert (= (and b!75440 res!39782) b!75441))

(declare-fun m!74885 () Bool)

(assert (=> b!75440 m!74885))

(assert (=> d!17901 m!74529))

(assert (=> b!75439 m!74885))

(assert (=> d!17755 d!17901))

(declare-fun bm!6738 () Bool)

(declare-fun call!6741 () Bool)

(assert (=> bm!6738 (= call!6741 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3888 newMap!16) (mask!6209 newMap!16)))))

(declare-fun b!75443 () Bool)

(declare-fun e!49286 () Bool)

(assert (=> b!75443 (= e!49286 call!6741)))

(declare-fun b!75444 () Bool)

(declare-fun e!49284 () Bool)

(assert (=> b!75444 (= e!49286 e!49284)))

(declare-fun lt!34087 () (_ BitVec 64))

(assert (=> b!75444 (= lt!34087 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34086 () Unit!2147)

(assert (=> b!75444 (= lt!34086 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3888 newMap!16) lt!34087 #b00000000000000000000000000000000))))

(assert (=> b!75444 (arrayContainsKey!0 (_keys!3888 newMap!16) lt!34087 #b00000000000000000000000000000000)))

(declare-fun lt!34088 () Unit!2147)

(assert (=> b!75444 (= lt!34088 lt!34086)))

(declare-fun res!39783 () Bool)

(assert (=> b!75444 (= res!39783 (= (seekEntryOrOpen!0 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000) (_keys!3888 newMap!16) (mask!6209 newMap!16)) (Found!240 #b00000000000000000000000000000000)))))

(assert (=> b!75444 (=> (not res!39783) (not e!49284))))

(declare-fun b!75445 () Bool)

(assert (=> b!75445 (= e!49284 call!6741)))

(declare-fun d!17903 () Bool)

(declare-fun res!39784 () Bool)

(declare-fun e!49285 () Bool)

(assert (=> d!17903 (=> res!39784 e!49285)))

(assert (=> d!17903 (= res!39784 (bvsge #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))

(assert (=> d!17903 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3888 newMap!16) (mask!6209 newMap!16)) e!49285)))

(declare-fun b!75442 () Bool)

(assert (=> b!75442 (= e!49285 e!49286)))

(declare-fun c!11444 () Bool)

(assert (=> b!75442 (= c!11444 (validKeyInArray!0 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!17903 (not res!39784)) b!75442))

(assert (= (and b!75442 c!11444) b!75444))

(assert (= (and b!75442 (not c!11444)) b!75443))

(assert (= (and b!75444 res!39783) b!75445))

(assert (= (or b!75445 b!75443) bm!6738))

(declare-fun m!74887 () Bool)

(assert (=> bm!6738 m!74887))

(assert (=> b!75444 m!74523))

(declare-fun m!74889 () Bool)

(assert (=> b!75444 m!74889))

(declare-fun m!74891 () Bool)

(assert (=> b!75444 m!74891))

(assert (=> b!75444 m!74523))

(declare-fun m!74893 () Bool)

(assert (=> b!75444 m!74893))

(assert (=> b!75442 m!74523))

(assert (=> b!75442 m!74523))

(assert (=> b!75442 m!74567))

(assert (=> b!74940 d!17903))

(assert (=> bm!6692 d!17799))

(declare-fun lt!34167 () SeekEntryResult!240)

(declare-fun c!11456 () Bool)

(declare-fun bm!6747 () Bool)

(declare-fun c!11455 () Bool)

(declare-fun lt!34173 () SeekEntryResult!240)

(declare-fun call!6750 () Bool)

(assert (=> bm!6747 (= call!6750 (inRange!0 (ite c!11455 (index!3093 lt!34173) (ite c!11456 (index!3092 lt!34167) (index!3095 lt!34167))) (mask!6209 newMap!16)))))

(declare-fun b!75480 () Bool)

(declare-fun e!49306 () Bool)

(declare-fun call!6752 () Bool)

(assert (=> b!75480 (= e!49306 (not call!6752))))

(declare-fun b!75481 () Bool)

(declare-fun res!39804 () Bool)

(assert (=> b!75481 (= res!39804 call!6750)))

(declare-fun e!49310 () Bool)

(assert (=> b!75481 (=> (not res!39804) (not e!49310))))

(declare-fun b!75482 () Bool)

(declare-fun res!39808 () Bool)

(declare-fun e!49307 () Bool)

(assert (=> b!75482 (=> (not res!39808) (not e!49307))))

(declare-fun lt!34149 () tuple2!2132)

(assert (=> b!75482 (= res!39808 (contains!723 (map!1155 (_2!1077 lt!34149)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun b!75483 () Bool)

(declare-fun res!39811 () Bool)

(assert (=> b!75483 (=> (not res!39811) (not e!49307))))

(assert (=> b!75483 (= res!39811 (valid!303 (_2!1077 lt!34149)))))

(declare-fun b!75484 () Bool)

(declare-fun e!49304 () Unit!2147)

(declare-fun Unit!2166 () Unit!2147)

(assert (=> b!75484 (= e!49304 Unit!2166)))

(declare-fun b!75485 () Bool)

(declare-fun e!49303 () Bool)

(assert (=> b!75485 (= e!49303 (not call!6752))))

(declare-fun b!75486 () Bool)

(declare-fun res!39803 () Bool)

(assert (=> b!75486 (=> (not res!39803) (not e!49306))))

(declare-fun call!6751 () Bool)

(assert (=> b!75486 (= res!39803 call!6751)))

(declare-fun e!49309 () Bool)

(assert (=> b!75486 (= e!49309 e!49306)))

(declare-fun b!75487 () Bool)

(assert (=> b!75487 (= e!49307 (= (map!1155 (_2!1077 lt!34149)) (+!95 (map!1155 newMap!16) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(declare-fun b!75488 () Bool)

(declare-fun e!49308 () Unit!2147)

(declare-fun Unit!2167 () Unit!2147)

(assert (=> b!75488 (= e!49308 Unit!2167)))

(declare-fun lt!34170 () Unit!2147)

(assert (=> b!75488 (= lt!34170 (lemmaInListMapThenSeekEntryOrOpenFindsIt!25 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)))))

(declare-fun call!6753 () SeekEntryResult!240)

(assert (=> b!75488 (= lt!34173 call!6753)))

(declare-fun res!39809 () Bool)

(assert (=> b!75488 (= res!39809 ((_ is Found!240) lt!34173))))

(assert (=> b!75488 (=> (not res!39809) (not e!49310))))

(assert (=> b!75488 e!49310))

(declare-fun lt!34154 () Unit!2147)

(assert (=> b!75488 (= lt!34154 lt!34170)))

(assert (=> b!75488 false))

(declare-fun b!75489 () Bool)

(declare-fun c!11453 () Bool)

(assert (=> b!75489 (= c!11453 ((_ is MissingVacant!240) lt!34167))))

(declare-fun e!49305 () Bool)

(assert (=> b!75489 (= e!49309 e!49305)))

(declare-fun b!75490 () Bool)

(assert (=> b!75490 (= e!49310 (= (select (arr!1852 (_keys!3888 newMap!16)) (index!3093 lt!34173)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun b!75491 () Bool)

(declare-fun Unit!2168 () Unit!2147)

(assert (=> b!75491 (= e!49304 Unit!2168)))

(declare-fun lt!34153 () Unit!2147)

(declare-fun lemmaArrayContainsKeyThenInListMap!14 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 64) (_ BitVec 32) Int) Unit!2147)

(assert (=> b!75491 (= lt!34153 (lemmaArrayContainsKeyThenInListMap!14 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(assert (=> b!75491 (contains!723 (getCurrentListMap!413 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355))))

(declare-fun lt!34160 () Unit!2147)

(assert (=> b!75491 (= lt!34160 lt!34153)))

(assert (=> b!75491 false))

(declare-fun bm!6748 () Bool)

(assert (=> bm!6748 (= call!6752 (arrayContainsKey!0 (_keys!3888 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!6749 () Bool)

(assert (=> bm!6749 (= call!6751 call!6750)))

(declare-fun b!75492 () Bool)

(declare-fun res!39810 () Bool)

(assert (=> b!75492 (= res!39810 (= (select (arr!1852 (_keys!3888 newMap!16)) (index!3095 lt!34167)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75492 (=> (not res!39810) (not e!49303))))

(declare-fun d!17905 () Bool)

(assert (=> d!17905 e!49307))

(declare-fun res!39806 () Bool)

(assert (=> d!17905 (=> (not res!39806) (not e!49307))))

(assert (=> d!17905 (= res!39806 (_1!1077 lt!34149))))

(assert (=> d!17905 (= lt!34149 (tuple2!2133 true (LongMapFixedSize!701 (defaultEntry!2233 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (bvadd (_size!399 newMap!16) #b00000000000000000000000000000001) (array!3886 (store (arr!1852 (_keys!3888 newMap!16)) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) (size!2092 (_keys!3888 newMap!16))) (array!3888 (store (arr!1853 (_values!2216 newMap!16)) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (ValueCellFull!896 lt!33657)) (size!2093 (_values!2216 newMap!16))) (_vacant!399 newMap!16))))))

(declare-fun lt!34162 () Unit!2147)

(declare-fun lt!34169 () Unit!2147)

(assert (=> d!17905 (= lt!34162 lt!34169)))

(declare-fun lt!34163 () array!3887)

(declare-fun lt!34176 () array!3885)

(assert (=> d!17905 (contains!723 (getCurrentListMap!413 lt!34176 lt!34163 (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (select (store (arr!1852 (_keys!3888 newMap!16)) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818))))))

(assert (=> d!17905 (= lt!34169 (lemmaValidKeyInArrayIsInListMap!84 lt!34176 lt!34163 (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (defaultEntry!2233 newMap!16)))))

(assert (=> d!17905 (= lt!34163 (array!3888 (store (arr!1853 (_values!2216 newMap!16)) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (ValueCellFull!896 lt!33657)) (size!2093 (_values!2216 newMap!16))))))

(assert (=> d!17905 (= lt!34176 (array!3886 (store (arr!1852 (_keys!3888 newMap!16)) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) (size!2092 (_keys!3888 newMap!16))))))

(declare-fun lt!34155 () Unit!2147)

(declare-fun lt!34151 () Unit!2147)

(assert (=> d!17905 (= lt!34155 lt!34151)))

(declare-fun lt!34157 () array!3885)

(assert (=> d!17905 (= (arrayCountValidKeys!0 lt!34157 (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (bvadd (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!3885 (_ BitVec 32)) Unit!2147)

(assert (=> d!17905 (= lt!34151 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!34157 (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818))))))

(assert (=> d!17905 (= lt!34157 (array!3886 (store (arr!1852 (_keys!3888 newMap!16)) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) (size!2092 (_keys!3888 newMap!16))))))

(declare-fun lt!34156 () Unit!2147)

(declare-fun lt!34161 () Unit!2147)

(assert (=> d!17905 (= lt!34156 lt!34161)))

(declare-fun lt!34171 () array!3885)

(assert (=> d!17905 (arrayContainsKey!0 lt!34171 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!17905 (= lt!34161 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!34171 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818))))))

(assert (=> d!17905 (= lt!34171 (array!3886 (store (arr!1852 (_keys!3888 newMap!16)) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) (size!2092 (_keys!3888 newMap!16))))))

(declare-fun lt!34158 () Unit!2147)

(declare-fun lt!34175 () Unit!2147)

(assert (=> d!17905 (= lt!34158 lt!34175)))

(assert (=> d!17905 (= (+!95 (getCurrentListMap!413 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)) (getCurrentListMap!413 (array!3886 (store (arr!1852 (_keys!3888 newMap!16)) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) (size!2092 (_keys!3888 newMap!16))) (array!3888 (store (arr!1853 (_values!2216 newMap!16)) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (ValueCellFull!896 lt!33657)) (size!2093 (_values!2216 newMap!16))) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!14 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) (_ BitVec 64) V!2953 Int) Unit!2147)

(assert (=> d!17905 (= lt!34175 (lemmaAddValidKeyToArrayThenAddPairToListMap!14 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34177 () Unit!2147)

(declare-fun lt!34174 () Unit!2147)

(assert (=> d!17905 (= lt!34177 lt!34174)))

(assert (=> d!17905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!3886 (store (arr!1852 (_keys!3888 newMap!16)) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) (size!2092 (_keys!3888 newMap!16))) (mask!6209 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!3885 (_ BitVec 32) (_ BitVec 32)) Unit!2147)

(assert (=> d!17905 (= lt!34174 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (_keys!3888 newMap!16) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (mask!6209 newMap!16)))))

(declare-fun lt!34172 () Unit!2147)

(declare-fun lt!34178 () Unit!2147)

(assert (=> d!17905 (= lt!34172 lt!34178)))

(assert (=> d!17905 (= (arrayCountValidKeys!0 (array!3886 (store (arr!1852 (_keys!3888 newMap!16)) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) (size!2092 (_keys!3888 newMap!16))) #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!3888 newMap!16) #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!3885 (_ BitVec 32) (_ BitVec 64)) Unit!2147)

(assert (=> d!17905 (= lt!34178 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3888 newMap!16) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun lt!34152 () Unit!2147)

(declare-fun lt!34164 () Unit!2147)

(assert (=> d!17905 (= lt!34152 lt!34164)))

(declare-fun lt!34159 () List!1489)

(declare-fun lt!34166 () (_ BitVec 32))

(assert (=> d!17905 (arrayNoDuplicates!0 (array!3886 (store (arr!1852 (_keys!3888 newMap!16)) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) (size!2092 (_keys!3888 newMap!16))) lt!34166 lt!34159)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!3885 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1489) Unit!2147)

(assert (=> d!17905 (= lt!34164 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3888 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818)) lt!34166 lt!34159))))

(assert (=> d!17905 (= lt!34159 Nil!1486)))

(assert (=> d!17905 (= lt!34166 #b00000000000000000000000000000000)))

(declare-fun lt!34165 () Unit!2147)

(assert (=> d!17905 (= lt!34165 e!49304)))

(declare-fun c!11454 () Bool)

(assert (=> d!17905 (= c!11454 (arrayContainsKey!0 (_keys!3888 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!34150 () Unit!2147)

(assert (=> d!17905 (= lt!34150 e!49308)))

(assert (=> d!17905 (= c!11455 (contains!723 (getCurrentListMap!413 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(assert (=> d!17905 (valid!303 newMap!16)))

(assert (=> d!17905 (= (updateHelperNewKey!25 newMap!16 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657 (ite c!11349 (index!3095 lt!33818) (index!3092 lt!33818))) lt!34149)))

(declare-fun b!75493 () Bool)

(assert (=> b!75493 (= e!49305 ((_ is Undefined!240) lt!34167))))

(declare-fun b!75494 () Bool)

(assert (=> b!75494 (= e!49305 e!49303)))

(declare-fun res!39807 () Bool)

(assert (=> b!75494 (= res!39807 call!6751)))

(assert (=> b!75494 (=> (not res!39807) (not e!49303))))

(declare-fun b!75495 () Bool)

(declare-fun res!39805 () Bool)

(assert (=> b!75495 (=> (not res!39805) (not e!49306))))

(assert (=> b!75495 (= res!39805 (= (select (arr!1852 (_keys!3888 newMap!16)) (index!3092 lt!34167)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75496 () Bool)

(declare-fun lt!34168 () Unit!2147)

(assert (=> b!75496 (= e!49308 lt!34168)))

(assert (=> b!75496 (= lt!34168 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!25 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)))))

(assert (=> b!75496 (= lt!34167 call!6753)))

(assert (=> b!75496 (= c!11456 ((_ is MissingZero!240) lt!34167))))

(assert (=> b!75496 e!49309))

(declare-fun bm!6750 () Bool)

(assert (=> bm!6750 (= call!6753 (seekEntryOrOpen!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (_keys!3888 newMap!16) (mask!6209 newMap!16)))))

(assert (= (and d!17905 c!11455) b!75488))

(assert (= (and d!17905 (not c!11455)) b!75496))

(assert (= (and b!75488 res!39809) b!75481))

(assert (= (and b!75481 res!39804) b!75490))

(assert (= (and b!75496 c!11456) b!75486))

(assert (= (and b!75496 (not c!11456)) b!75489))

(assert (= (and b!75486 res!39803) b!75495))

(assert (= (and b!75495 res!39805) b!75480))

(assert (= (and b!75489 c!11453) b!75494))

(assert (= (and b!75489 (not c!11453)) b!75493))

(assert (= (and b!75494 res!39807) b!75492))

(assert (= (and b!75492 res!39810) b!75485))

(assert (= (or b!75486 b!75494) bm!6749))

(assert (= (or b!75480 b!75485) bm!6748))

(assert (= (or b!75481 bm!6749) bm!6747))

(assert (= (or b!75488 b!75496) bm!6750))

(assert (= (and d!17905 c!11454) b!75491))

(assert (= (and d!17905 (not c!11454)) b!75484))

(assert (= (and d!17905 res!39806) b!75483))

(assert (= (and b!75483 res!39811) b!75482))

(assert (= (and b!75482 res!39808) b!75487))

(declare-fun m!74895 () Bool)

(assert (=> b!75492 m!74895))

(declare-fun m!74897 () Bool)

(assert (=> b!75495 m!74897))

(declare-fun m!74899 () Bool)

(assert (=> b!75483 m!74899))

(declare-fun m!74901 () Bool)

(assert (=> b!75490 m!74901))

(assert (=> b!75491 m!74111))

(declare-fun m!74903 () Bool)

(assert (=> b!75491 m!74903))

(assert (=> b!75491 m!74351))

(assert (=> b!75491 m!74351))

(assert (=> b!75491 m!74111))

(declare-fun m!74905 () Bool)

(assert (=> b!75491 m!74905))

(assert (=> bm!6750 m!74111))

(assert (=> bm!6750 m!74347))

(declare-fun m!74907 () Bool)

(assert (=> b!75487 m!74907))

(assert (=> b!75487 m!74143))

(assert (=> b!75487 m!74143))

(declare-fun m!74909 () Bool)

(assert (=> b!75487 m!74909))

(assert (=> b!75496 m!74111))

(assert (=> b!75496 m!74327))

(declare-fun m!74911 () Bool)

(assert (=> bm!6747 m!74911))

(assert (=> d!17905 m!74351))

(assert (=> d!17905 m!74679))

(assert (=> d!17905 m!74351))

(declare-fun m!74913 () Bool)

(assert (=> d!17905 m!74913))

(assert (=> d!17905 m!74117))

(assert (=> d!17905 m!74111))

(assert (=> d!17905 m!74345))

(assert (=> d!17905 m!74111))

(declare-fun m!74915 () Bool)

(assert (=> d!17905 m!74915))

(declare-fun m!74917 () Bool)

(assert (=> d!17905 m!74917))

(declare-fun m!74919 () Bool)

(assert (=> d!17905 m!74919))

(assert (=> d!17905 m!74111))

(declare-fun m!74921 () Bool)

(assert (=> d!17905 m!74921))

(assert (=> d!17905 m!74111))

(declare-fun m!74923 () Bool)

(assert (=> d!17905 m!74923))

(assert (=> d!17905 m!74111))

(declare-fun m!74925 () Bool)

(assert (=> d!17905 m!74925))

(assert (=> d!17905 m!74111))

(declare-fun m!74927 () Bool)

(assert (=> d!17905 m!74927))

(assert (=> d!17905 m!74351))

(assert (=> d!17905 m!74111))

(assert (=> d!17905 m!74905))

(assert (=> d!17905 m!74279))

(declare-fun m!74929 () Bool)

(assert (=> d!17905 m!74929))

(declare-fun m!74931 () Bool)

(assert (=> d!17905 m!74931))

(declare-fun m!74933 () Bool)

(assert (=> d!17905 m!74933))

(declare-fun m!74935 () Bool)

(assert (=> d!17905 m!74935))

(declare-fun m!74937 () Bool)

(assert (=> d!17905 m!74937))

(declare-fun m!74939 () Bool)

(assert (=> d!17905 m!74939))

(declare-fun m!74941 () Bool)

(assert (=> d!17905 m!74941))

(assert (=> d!17905 m!74937))

(assert (=> d!17905 m!74939))

(declare-fun m!74943 () Bool)

(assert (=> d!17905 m!74943))

(assert (=> d!17905 m!74111))

(declare-fun m!74945 () Bool)

(assert (=> d!17905 m!74945))

(declare-fun m!74947 () Bool)

(assert (=> d!17905 m!74947))

(assert (=> bm!6748 m!74111))

(assert (=> bm!6748 m!74345))

(assert (=> b!75482 m!74907))

(assert (=> b!75482 m!74907))

(assert (=> b!75482 m!74111))

(declare-fun m!74949 () Bool)

(assert (=> b!75482 m!74949))

(assert (=> b!75488 m!74111))

(assert (=> b!75488 m!74353))

(assert (=> bm!6681 d!17905))

(declare-fun b!75497 () Bool)

(declare-fun e!49314 () Bool)

(declare-fun e!49312 () Bool)

(assert (=> b!75497 (= e!49314 e!49312)))

(declare-fun res!39813 () Bool)

(assert (=> b!75497 (=> (not res!39813) (not e!49312))))

(declare-fun e!49313 () Bool)

(assert (=> b!75497 (= res!39813 (not e!49313))))

(declare-fun res!39812 () Bool)

(assert (=> b!75497 (=> (not res!39812) (not e!49313))))

(assert (=> b!75497 (= res!39812 (validKeyInArray!0 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!75498 () Bool)

(declare-fun e!49311 () Bool)

(assert (=> b!75498 (= e!49312 e!49311)))

(declare-fun c!11457 () Bool)

(assert (=> b!75498 (= c!11457 (validKeyInArray!0 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!75499 () Bool)

(assert (=> b!75499 (= e!49313 (contains!724 Nil!1486 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!75500 () Bool)

(declare-fun call!6754 () Bool)

(assert (=> b!75500 (= e!49311 call!6754)))

(declare-fun bm!6751 () Bool)

(assert (=> bm!6751 (= call!6754 (arrayNoDuplicates!0 (_keys!3888 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11457 (Cons!1485 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000) Nil!1486) Nil!1486)))))

(declare-fun d!17907 () Bool)

(declare-fun res!39814 () Bool)

(assert (=> d!17907 (=> res!39814 e!49314)))

(assert (=> d!17907 (= res!39814 (bvsge #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))

(assert (=> d!17907 (= (arrayNoDuplicates!0 (_keys!3888 newMap!16) #b00000000000000000000000000000000 Nil!1486) e!49314)))

(declare-fun b!75501 () Bool)

(assert (=> b!75501 (= e!49311 call!6754)))

(assert (= (and d!17907 (not res!39814)) b!75497))

(assert (= (and b!75497 res!39812) b!75499))

(assert (= (and b!75497 res!39813) b!75498))

(assert (= (and b!75498 c!11457) b!75501))

(assert (= (and b!75498 (not c!11457)) b!75500))

(assert (= (or b!75501 b!75500) bm!6751))

(assert (=> b!75497 m!74523))

(assert (=> b!75497 m!74523))

(assert (=> b!75497 m!74567))

(assert (=> b!75498 m!74523))

(assert (=> b!75498 m!74523))

(assert (=> b!75498 m!74567))

(assert (=> b!75499 m!74523))

(assert (=> b!75499 m!74523))

(declare-fun m!74951 () Bool)

(assert (=> b!75499 m!74951))

(assert (=> bm!6751 m!74523))

(declare-fun m!74953 () Bool)

(assert (=> bm!6751 m!74953))

(assert (=> b!74941 d!17907))

(declare-fun b!75505 () Bool)

(declare-fun e!49316 () Option!138)

(assert (=> b!75505 (= e!49316 None!136)))

(declare-fun b!75503 () Bool)

(declare-fun e!49315 () Option!138)

(assert (=> b!75503 (= e!49315 e!49316)))

(declare-fun c!11459 () Bool)

(assert (=> b!75503 (= c!11459 (and ((_ is Cons!1484) (toList!720 lt!33882)) (not (= (_1!1076 (h!2072 (toList!720 lt!33882))) (_1!1076 lt!33653)))))))

(declare-fun b!75504 () Bool)

(assert (=> b!75504 (= e!49316 (getValueByKey!132 (t!5057 (toList!720 lt!33882)) (_1!1076 lt!33653)))))

(declare-fun d!17909 () Bool)

(declare-fun c!11458 () Bool)

(assert (=> d!17909 (= c!11458 (and ((_ is Cons!1484) (toList!720 lt!33882)) (= (_1!1076 (h!2072 (toList!720 lt!33882))) (_1!1076 lt!33653))))))

(assert (=> d!17909 (= (getValueByKey!132 (toList!720 lt!33882) (_1!1076 lt!33653)) e!49315)))

(declare-fun b!75502 () Bool)

(assert (=> b!75502 (= e!49315 (Some!137 (_2!1076 (h!2072 (toList!720 lt!33882)))))))

(assert (= (and d!17909 c!11458) b!75502))

(assert (= (and d!17909 (not c!11458)) b!75503))

(assert (= (and b!75503 c!11459) b!75504))

(assert (= (and b!75503 (not c!11459)) b!75505))

(declare-fun m!74955 () Bool)

(assert (=> b!75504 m!74955))

(assert (=> b!75166 d!17909))

(declare-fun b!75506 () Bool)

(declare-fun e!49326 () Bool)

(declare-fun e!49321 () Bool)

(assert (=> b!75506 (= e!49326 e!49321)))

(declare-fun res!39819 () Bool)

(assert (=> b!75506 (=> (not res!39819) (not e!49321))))

(declare-fun lt!34189 () ListLongMap!1409)

(assert (=> b!75506 (= res!39819 (contains!723 lt!34189 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!75506 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))

(declare-fun b!75507 () Bool)

(declare-fun e!49329 () Bool)

(declare-fun e!49319 () Bool)

(assert (=> b!75507 (= e!49329 e!49319)))

(declare-fun c!11464 () Bool)

(assert (=> b!75507 (= c!11464 (not (= (bvand (ite c!11353 (ite c!11351 (extraKeys!2088 newMap!16) lt!33830) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75508 () Bool)

(declare-fun res!39823 () Bool)

(assert (=> b!75508 (=> (not res!39823) (not e!49329))))

(declare-fun e!49323 () Bool)

(assert (=> b!75508 (= res!39823 e!49323)))

(declare-fun c!11460 () Bool)

(assert (=> b!75508 (= c!11460 (not (= (bvand (ite c!11353 (ite c!11351 (extraKeys!2088 newMap!16) lt!33830) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!75509 () Bool)

(declare-fun e!49322 () Bool)

(assert (=> b!75509 (= e!49319 e!49322)))

(declare-fun res!39816 () Bool)

(declare-fun call!6758 () Bool)

(assert (=> b!75509 (= res!39816 call!6758)))

(assert (=> b!75509 (=> (not res!39816) (not e!49322))))

(declare-fun b!75510 () Bool)

(declare-fun e!49324 () ListLongMap!1409)

(declare-fun call!6759 () ListLongMap!1409)

(assert (=> b!75510 (= e!49324 call!6759)))

(declare-fun b!75511 () Bool)

(declare-fun call!6757 () ListLongMap!1409)

(assert (=> b!75511 (= e!49324 call!6757)))

(declare-fun b!75512 () Bool)

(declare-fun e!49327 () Unit!2147)

(declare-fun lt!34185 () Unit!2147)

(assert (=> b!75512 (= e!49327 lt!34185)))

(declare-fun lt!34184 () ListLongMap!1409)

(assert (=> b!75512 (= lt!34184 (getCurrentListMapNoExtraKeys!59 (_keys!3888 newMap!16) (ite c!11353 (_values!2216 newMap!16) lt!33833) (mask!6209 newMap!16) (ite c!11353 (ite c!11351 (extraKeys!2088 newMap!16) lt!33830) (extraKeys!2088 newMap!16)) (zeroValue!2133 newMap!16) (ite c!11353 (ite c!11351 (minValue!2133 newMap!16) lt!33657) (minValue!2133 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34183 () (_ BitVec 64))

(assert (=> b!75512 (= lt!34183 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34199 () (_ BitVec 64))

(assert (=> b!75512 (= lt!34199 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34188 () Unit!2147)

(assert (=> b!75512 (= lt!34188 (addStillContains!52 lt!34184 lt!34183 (zeroValue!2133 newMap!16) lt!34199))))

(assert (=> b!75512 (contains!723 (+!95 lt!34184 (tuple2!2131 lt!34183 (zeroValue!2133 newMap!16))) lt!34199)))

(declare-fun lt!34196 () Unit!2147)

(assert (=> b!75512 (= lt!34196 lt!34188)))

(declare-fun lt!34181 () ListLongMap!1409)

(assert (=> b!75512 (= lt!34181 (getCurrentListMapNoExtraKeys!59 (_keys!3888 newMap!16) (ite c!11353 (_values!2216 newMap!16) lt!33833) (mask!6209 newMap!16) (ite c!11353 (ite c!11351 (extraKeys!2088 newMap!16) lt!33830) (extraKeys!2088 newMap!16)) (zeroValue!2133 newMap!16) (ite c!11353 (ite c!11351 (minValue!2133 newMap!16) lt!33657) (minValue!2133 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34197 () (_ BitVec 64))

(assert (=> b!75512 (= lt!34197 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34186 () (_ BitVec 64))

(assert (=> b!75512 (= lt!34186 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34179 () Unit!2147)

(assert (=> b!75512 (= lt!34179 (addApplyDifferent!52 lt!34181 lt!34197 (ite c!11353 (ite c!11351 (minValue!2133 newMap!16) lt!33657) (minValue!2133 newMap!16)) lt!34186))))

(assert (=> b!75512 (= (apply!76 (+!95 lt!34181 (tuple2!2131 lt!34197 (ite c!11353 (ite c!11351 (minValue!2133 newMap!16) lt!33657) (minValue!2133 newMap!16)))) lt!34186) (apply!76 lt!34181 lt!34186))))

(declare-fun lt!34193 () Unit!2147)

(assert (=> b!75512 (= lt!34193 lt!34179)))

(declare-fun lt!34198 () ListLongMap!1409)

(assert (=> b!75512 (= lt!34198 (getCurrentListMapNoExtraKeys!59 (_keys!3888 newMap!16) (ite c!11353 (_values!2216 newMap!16) lt!33833) (mask!6209 newMap!16) (ite c!11353 (ite c!11351 (extraKeys!2088 newMap!16) lt!33830) (extraKeys!2088 newMap!16)) (zeroValue!2133 newMap!16) (ite c!11353 (ite c!11351 (minValue!2133 newMap!16) lt!33657) (minValue!2133 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34191 () (_ BitVec 64))

(assert (=> b!75512 (= lt!34191 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34190 () (_ BitVec 64))

(assert (=> b!75512 (= lt!34190 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34194 () Unit!2147)

(assert (=> b!75512 (= lt!34194 (addApplyDifferent!52 lt!34198 lt!34191 (zeroValue!2133 newMap!16) lt!34190))))

(assert (=> b!75512 (= (apply!76 (+!95 lt!34198 (tuple2!2131 lt!34191 (zeroValue!2133 newMap!16))) lt!34190) (apply!76 lt!34198 lt!34190))))

(declare-fun lt!34180 () Unit!2147)

(assert (=> b!75512 (= lt!34180 lt!34194)))

(declare-fun lt!34192 () ListLongMap!1409)

(assert (=> b!75512 (= lt!34192 (getCurrentListMapNoExtraKeys!59 (_keys!3888 newMap!16) (ite c!11353 (_values!2216 newMap!16) lt!33833) (mask!6209 newMap!16) (ite c!11353 (ite c!11351 (extraKeys!2088 newMap!16) lt!33830) (extraKeys!2088 newMap!16)) (zeroValue!2133 newMap!16) (ite c!11353 (ite c!11351 (minValue!2133 newMap!16) lt!33657) (minValue!2133 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34187 () (_ BitVec 64))

(assert (=> b!75512 (= lt!34187 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34200 () (_ BitVec 64))

(assert (=> b!75512 (= lt!34200 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!75512 (= lt!34185 (addApplyDifferent!52 lt!34192 lt!34187 (ite c!11353 (ite c!11351 (minValue!2133 newMap!16) lt!33657) (minValue!2133 newMap!16)) lt!34200))))

(assert (=> b!75512 (= (apply!76 (+!95 lt!34192 (tuple2!2131 lt!34187 (ite c!11353 (ite c!11351 (minValue!2133 newMap!16) lt!33657) (minValue!2133 newMap!16)))) lt!34200) (apply!76 lt!34192 lt!34200))))

(declare-fun bm!6752 () Bool)

(declare-fun call!6760 () Bool)

(assert (=> bm!6752 (= call!6760 (contains!723 lt!34189 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75513 () Bool)

(declare-fun res!39818 () Bool)

(assert (=> b!75513 (=> (not res!39818) (not e!49329))))

(assert (=> b!75513 (= res!39818 e!49326)))

(declare-fun res!39822 () Bool)

(assert (=> b!75513 (=> res!39822 e!49326)))

(declare-fun e!49320 () Bool)

(assert (=> b!75513 (= res!39822 (not e!49320))))

(declare-fun res!39820 () Bool)

(assert (=> b!75513 (=> (not res!39820) (not e!49320))))

(assert (=> b!75513 (= res!39820 (bvslt #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))

(declare-fun b!75514 () Bool)

(assert (=> b!75514 (= e!49320 (validKeyInArray!0 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!75515 () Bool)

(assert (=> b!75515 (= e!49319 (not call!6758))))

(declare-fun b!75516 () Bool)

(assert (=> b!75516 (= e!49321 (= (apply!76 lt!34189 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)) (get!1150 (select (arr!1853 (ite c!11353 (_values!2216 newMap!16) lt!33833)) #b00000000000000000000000000000000) (dynLambda!328 (defaultEntry!2233 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75516 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2093 (ite c!11353 (_values!2216 newMap!16) lt!33833))))))

(assert (=> b!75516 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))

(declare-fun bm!6753 () Bool)

(assert (=> bm!6753 (= call!6758 (contains!723 lt!34189 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6754 () Bool)

(declare-fun call!6761 () ListLongMap!1409)

(declare-fun call!6756 () ListLongMap!1409)

(assert (=> bm!6754 (= call!6761 call!6756)))

(declare-fun b!75517 () Bool)

(declare-fun e!49325 () ListLongMap!1409)

(assert (=> b!75517 (= e!49325 call!6759)))

(declare-fun b!75518 () Bool)

(declare-fun Unit!2169 () Unit!2147)

(assert (=> b!75518 (= e!49327 Unit!2169)))

(declare-fun bm!6755 () Bool)

(declare-fun call!6755 () ListLongMap!1409)

(assert (=> bm!6755 (= call!6759 call!6755)))

(declare-fun b!75519 () Bool)

(assert (=> b!75519 (= e!49322 (= (apply!76 lt!34189 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!11353 (ite c!11351 (minValue!2133 newMap!16) lt!33657) (minValue!2133 newMap!16))))))

(declare-fun b!75520 () Bool)

(declare-fun e!49328 () Bool)

(assert (=> b!75520 (= e!49328 (= (apply!76 lt!34189 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2133 newMap!16)))))

(declare-fun b!75521 () Bool)

(declare-fun c!11462 () Bool)

(assert (=> b!75521 (= c!11462 (and (not (= (bvand (ite c!11353 (ite c!11351 (extraKeys!2088 newMap!16) lt!33830) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!11353 (ite c!11351 (extraKeys!2088 newMap!16) lt!33830) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!75521 (= e!49325 e!49324)))

(declare-fun d!17911 () Bool)

(assert (=> d!17911 e!49329))

(declare-fun res!39821 () Bool)

(assert (=> d!17911 (=> (not res!39821) (not e!49329))))

(assert (=> d!17911 (= res!39821 (or (bvsge #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))))

(declare-fun lt!34182 () ListLongMap!1409)

(assert (=> d!17911 (= lt!34189 lt!34182)))

(declare-fun lt!34195 () Unit!2147)

(assert (=> d!17911 (= lt!34195 e!49327)))

(declare-fun c!11465 () Bool)

(declare-fun e!49318 () Bool)

(assert (=> d!17911 (= c!11465 e!49318)))

(declare-fun res!39817 () Bool)

(assert (=> d!17911 (=> (not res!39817) (not e!49318))))

(assert (=> d!17911 (= res!39817 (bvslt #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))

(declare-fun e!49317 () ListLongMap!1409)

(assert (=> d!17911 (= lt!34182 e!49317)))

(declare-fun c!11463 () Bool)

(assert (=> d!17911 (= c!11463 (and (not (= (bvand (ite c!11353 (ite c!11351 (extraKeys!2088 newMap!16) lt!33830) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!11353 (ite c!11351 (extraKeys!2088 newMap!16) lt!33830) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!17911 (validMask!0 (mask!6209 newMap!16))))

(assert (=> d!17911 (= (getCurrentListMap!413 (_keys!3888 newMap!16) (ite c!11353 (_values!2216 newMap!16) lt!33833) (mask!6209 newMap!16) (ite c!11353 (ite c!11351 (extraKeys!2088 newMap!16) lt!33830) (extraKeys!2088 newMap!16)) (zeroValue!2133 newMap!16) (ite c!11353 (ite c!11351 (minValue!2133 newMap!16) lt!33657) (minValue!2133 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) lt!34189)))

(declare-fun bm!6756 () Bool)

(assert (=> bm!6756 (= call!6756 (getCurrentListMapNoExtraKeys!59 (_keys!3888 newMap!16) (ite c!11353 (_values!2216 newMap!16) lt!33833) (mask!6209 newMap!16) (ite c!11353 (ite c!11351 (extraKeys!2088 newMap!16) lt!33830) (extraKeys!2088 newMap!16)) (zeroValue!2133 newMap!16) (ite c!11353 (ite c!11351 (minValue!2133 newMap!16) lt!33657) (minValue!2133 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun b!75522 () Bool)

(assert (=> b!75522 (= e!49317 e!49325)))

(declare-fun c!11461 () Bool)

(assert (=> b!75522 (= c!11461 (and (not (= (bvand (ite c!11353 (ite c!11351 (extraKeys!2088 newMap!16) lt!33830) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!11353 (ite c!11351 (extraKeys!2088 newMap!16) lt!33830) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6757 () Bool)

(assert (=> bm!6757 (= call!6755 (+!95 (ite c!11463 call!6756 (ite c!11461 call!6761 call!6757)) (ite (or c!11463 c!11461) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 newMap!16)) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!11353 (ite c!11351 (minValue!2133 newMap!16) lt!33657) (minValue!2133 newMap!16))))))))

(declare-fun bm!6758 () Bool)

(assert (=> bm!6758 (= call!6757 call!6761)))

(declare-fun b!75523 () Bool)

(assert (=> b!75523 (= e!49317 (+!95 call!6755 (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!11353 (ite c!11351 (minValue!2133 newMap!16) lt!33657) (minValue!2133 newMap!16)))))))

(declare-fun b!75524 () Bool)

(assert (=> b!75524 (= e!49323 (not call!6760))))

(declare-fun b!75525 () Bool)

(assert (=> b!75525 (= e!49323 e!49328)))

(declare-fun res!39815 () Bool)

(assert (=> b!75525 (= res!39815 call!6760)))

(assert (=> b!75525 (=> (not res!39815) (not e!49328))))

(declare-fun b!75526 () Bool)

(assert (=> b!75526 (= e!49318 (validKeyInArray!0 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!17911 c!11463) b!75523))

(assert (= (and d!17911 (not c!11463)) b!75522))

(assert (= (and b!75522 c!11461) b!75517))

(assert (= (and b!75522 (not c!11461)) b!75521))

(assert (= (and b!75521 c!11462) b!75510))

(assert (= (and b!75521 (not c!11462)) b!75511))

(assert (= (or b!75510 b!75511) bm!6758))

(assert (= (or b!75517 bm!6758) bm!6754))

(assert (= (or b!75517 b!75510) bm!6755))

(assert (= (or b!75523 bm!6754) bm!6756))

(assert (= (or b!75523 bm!6755) bm!6757))

(assert (= (and d!17911 res!39817) b!75526))

(assert (= (and d!17911 c!11465) b!75512))

(assert (= (and d!17911 (not c!11465)) b!75518))

(assert (= (and d!17911 res!39821) b!75513))

(assert (= (and b!75513 res!39820) b!75514))

(assert (= (and b!75513 (not res!39822)) b!75506))

(assert (= (and b!75506 res!39819) b!75516))

(assert (= (and b!75513 res!39818) b!75508))

(assert (= (and b!75508 c!11460) b!75525))

(assert (= (and b!75508 (not c!11460)) b!75524))

(assert (= (and b!75525 res!39815) b!75520))

(assert (= (or b!75525 b!75524) bm!6752))

(assert (= (and b!75508 res!39823) b!75507))

(assert (= (and b!75507 c!11464) b!75509))

(assert (= (and b!75507 (not c!11464)) b!75515))

(assert (= (and b!75509 res!39816) b!75519))

(assert (= (or b!75509 b!75515) bm!6753))

(declare-fun b_lambda!3383 () Bool)

(assert (=> (not b_lambda!3383) (not b!75516)))

(assert (=> b!75516 t!5071))

(declare-fun b_and!4613 () Bool)

(assert (= b_and!4609 (and (=> t!5071 result!2717) b_and!4613)))

(assert (=> b!75516 t!5073))

(declare-fun b_and!4615 () Bool)

(assert (= b_and!4611 (and (=> t!5073 result!2719) b_and!4615)))

(declare-fun m!74957 () Bool)

(assert (=> b!75516 m!74957))

(assert (=> b!75516 m!74519))

(declare-fun m!74959 () Bool)

(assert (=> b!75516 m!74959))

(assert (=> b!75516 m!74523))

(declare-fun m!74961 () Bool)

(assert (=> b!75516 m!74961))

(assert (=> b!75516 m!74957))

(assert (=> b!75516 m!74523))

(assert (=> b!75516 m!74519))

(declare-fun m!74963 () Bool)

(assert (=> bm!6757 m!74963))

(assert (=> d!17911 m!74529))

(declare-fun m!74965 () Bool)

(assert (=> b!75512 m!74965))

(declare-fun m!74967 () Bool)

(assert (=> b!75512 m!74967))

(declare-fun m!74969 () Bool)

(assert (=> b!75512 m!74969))

(declare-fun m!74971 () Bool)

(assert (=> b!75512 m!74971))

(declare-fun m!74973 () Bool)

(assert (=> b!75512 m!74973))

(assert (=> b!75512 m!74971))

(declare-fun m!74975 () Bool)

(assert (=> b!75512 m!74975))

(declare-fun m!74977 () Bool)

(assert (=> b!75512 m!74977))

(declare-fun m!74979 () Bool)

(assert (=> b!75512 m!74979))

(declare-fun m!74981 () Bool)

(assert (=> b!75512 m!74981))

(declare-fun m!74983 () Bool)

(assert (=> b!75512 m!74983))

(declare-fun m!74985 () Bool)

(assert (=> b!75512 m!74985))

(assert (=> b!75512 m!74969))

(declare-fun m!74987 () Bool)

(assert (=> b!75512 m!74987))

(declare-fun m!74989 () Bool)

(assert (=> b!75512 m!74989))

(declare-fun m!74991 () Bool)

(assert (=> b!75512 m!74991))

(assert (=> b!75512 m!74989))

(assert (=> b!75512 m!74523))

(assert (=> b!75512 m!74979))

(declare-fun m!74993 () Bool)

(assert (=> b!75512 m!74993))

(declare-fun m!74995 () Bool)

(assert (=> b!75512 m!74995))

(declare-fun m!74997 () Bool)

(assert (=> bm!6752 m!74997))

(declare-fun m!74999 () Bool)

(assert (=> b!75519 m!74999))

(assert (=> b!75526 m!74523))

(assert (=> b!75526 m!74523))

(assert (=> b!75526 m!74567))

(assert (=> bm!6756 m!74993))

(declare-fun m!75001 () Bool)

(assert (=> b!75520 m!75001))

(declare-fun m!75003 () Bool)

(assert (=> b!75523 m!75003))

(declare-fun m!75005 () Bool)

(assert (=> bm!6753 m!75005))

(assert (=> b!75506 m!74523))

(assert (=> b!75506 m!74523))

(declare-fun m!75007 () Bool)

(assert (=> b!75506 m!75007))

(assert (=> b!75514 m!74523))

(assert (=> b!75514 m!74523))

(assert (=> b!75514 m!74567))

(assert (=> bm!6673 d!17911))

(declare-fun b!75530 () Bool)

(declare-fun e!49331 () Option!138)

(assert (=> b!75530 (= e!49331 None!136)))

(declare-fun b!75528 () Bool)

(declare-fun e!49330 () Option!138)

(assert (=> b!75528 (= e!49330 e!49331)))

(declare-fun c!11467 () Bool)

(assert (=> b!75528 (= c!11467 (and ((_ is Cons!1484) (toList!720 lt!33886)) (not (= (_1!1076 (h!2072 (toList!720 lt!33886))) (_1!1076 lt!33648)))))))

(declare-fun b!75529 () Bool)

(assert (=> b!75529 (= e!49331 (getValueByKey!132 (t!5057 (toList!720 lt!33886)) (_1!1076 lt!33648)))))

(declare-fun d!17913 () Bool)

(declare-fun c!11466 () Bool)

(assert (=> d!17913 (= c!11466 (and ((_ is Cons!1484) (toList!720 lt!33886)) (= (_1!1076 (h!2072 (toList!720 lt!33886))) (_1!1076 lt!33648))))))

(assert (=> d!17913 (= (getValueByKey!132 (toList!720 lt!33886) (_1!1076 lt!33648)) e!49330)))

(declare-fun b!75527 () Bool)

(assert (=> b!75527 (= e!49330 (Some!137 (_2!1076 (h!2072 (toList!720 lt!33886)))))))

(assert (= (and d!17913 c!11466) b!75527))

(assert (= (and d!17913 (not c!11466)) b!75528))

(assert (= (and b!75528 c!11467) b!75529))

(assert (= (and b!75528 (not c!11467)) b!75530))

(declare-fun m!75009 () Bool)

(assert (=> b!75529 m!75009))

(assert (=> b!75168 d!17913))

(declare-fun d!17915 () Bool)

(assert (=> d!17915 (= (get!1151 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) from!355) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2538 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(assert (=> b!74946 d!17915))

(assert (=> bm!6698 d!17867))

(declare-fun d!17917 () Bool)

(declare-fun e!49332 () Bool)

(assert (=> d!17917 e!49332))

(declare-fun res!39825 () Bool)

(assert (=> d!17917 (=> (not res!39825) (not e!49332))))

(declare-fun lt!34202 () ListLongMap!1409)

(assert (=> d!17917 (= res!39825 (contains!723 lt!34202 (_1!1076 (ite c!11353 (ite c!11351 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33657) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33657)) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)))))))

(declare-fun lt!34201 () List!1488)

(assert (=> d!17917 (= lt!34202 (ListLongMap!1410 lt!34201))))

(declare-fun lt!34204 () Unit!2147)

(declare-fun lt!34203 () Unit!2147)

(assert (=> d!17917 (= lt!34204 lt!34203)))

(assert (=> d!17917 (= (getValueByKey!132 lt!34201 (_1!1076 (ite c!11353 (ite c!11351 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33657) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33657)) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)))) (Some!137 (_2!1076 (ite c!11353 (ite c!11351 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33657) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33657)) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)))))))

(assert (=> d!17917 (= lt!34203 (lemmaContainsTupThenGetReturnValue!52 lt!34201 (_1!1076 (ite c!11353 (ite c!11351 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33657) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33657)) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))) (_2!1076 (ite c!11353 (ite c!11351 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33657) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33657)) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)))))))

(assert (=> d!17917 (= lt!34201 (insertStrictlySorted!55 (toList!720 e!49081) (_1!1076 (ite c!11353 (ite c!11351 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33657) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33657)) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))) (_2!1076 (ite c!11353 (ite c!11351 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33657) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33657)) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)))))))

(assert (=> d!17917 (= (+!95 e!49081 (ite c!11353 (ite c!11351 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33657) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33657)) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))) lt!34202)))

(declare-fun b!75531 () Bool)

(declare-fun res!39824 () Bool)

(assert (=> b!75531 (=> (not res!39824) (not e!49332))))

(assert (=> b!75531 (= res!39824 (= (getValueByKey!132 (toList!720 lt!34202) (_1!1076 (ite c!11353 (ite c!11351 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33657) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33657)) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)))) (Some!137 (_2!1076 (ite c!11353 (ite c!11351 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33657) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33657)) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))))

(declare-fun b!75532 () Bool)

(assert (=> b!75532 (= e!49332 (contains!725 (toList!720 lt!34202) (ite c!11353 (ite c!11351 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33657) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33657)) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(assert (= (and d!17917 res!39825) b!75531))

(assert (= (and b!75531 res!39824) b!75532))

(declare-fun m!75011 () Bool)

(assert (=> d!17917 m!75011))

(declare-fun m!75013 () Bool)

(assert (=> d!17917 m!75013))

(declare-fun m!75015 () Bool)

(assert (=> d!17917 m!75015))

(declare-fun m!75017 () Bool)

(assert (=> d!17917 m!75017))

(declare-fun m!75019 () Bool)

(assert (=> b!75531 m!75019))

(declare-fun m!75021 () Bool)

(assert (=> b!75532 m!75021))

(assert (=> bm!6675 d!17917))

(assert (=> b!74982 d!17831))

(declare-fun b!75533 () Bool)

(declare-fun e!49342 () Bool)

(declare-fun e!49337 () Bool)

(assert (=> b!75533 (= e!49342 e!49337)))

(declare-fun res!39830 () Bool)

(assert (=> b!75533 (=> (not res!39830) (not e!49337))))

(declare-fun lt!34215 () ListLongMap!1409)

(assert (=> b!75533 (= res!39830 (contains!723 lt!34215 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!75533 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))

(declare-fun b!75534 () Bool)

(declare-fun e!49345 () Bool)

(declare-fun e!49335 () Bool)

(assert (=> b!75534 (= e!49345 e!49335)))

(declare-fun c!11472 () Bool)

(assert (=> b!75534 (= c!11472 (not (= (bvand (ite (and c!11353 c!11351) lt!33814 (extraKeys!2088 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75535 () Bool)

(declare-fun res!39834 () Bool)

(assert (=> b!75535 (=> (not res!39834) (not e!49345))))

(declare-fun e!49339 () Bool)

(assert (=> b!75535 (= res!39834 e!49339)))

(declare-fun c!11468 () Bool)

(assert (=> b!75535 (= c!11468 (not (= (bvand (ite (and c!11353 c!11351) lt!33814 (extraKeys!2088 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!75536 () Bool)

(declare-fun e!49338 () Bool)

(assert (=> b!75536 (= e!49335 e!49338)))

(declare-fun res!39827 () Bool)

(declare-fun call!6765 () Bool)

(assert (=> b!75536 (= res!39827 call!6765)))

(assert (=> b!75536 (=> (not res!39827) (not e!49338))))

(declare-fun b!75537 () Bool)

(declare-fun e!49340 () ListLongMap!1409)

(declare-fun call!6766 () ListLongMap!1409)

(assert (=> b!75537 (= e!49340 call!6766)))

(declare-fun b!75538 () Bool)

(declare-fun call!6764 () ListLongMap!1409)

(assert (=> b!75538 (= e!49340 call!6764)))

(declare-fun b!75539 () Bool)

(declare-fun e!49343 () Unit!2147)

(declare-fun lt!34211 () Unit!2147)

(assert (=> b!75539 (= e!49343 lt!34211)))

(declare-fun lt!34210 () ListLongMap!1409)

(assert (=> b!75539 (= lt!34210 (getCurrentListMapNoExtraKeys!59 (_keys!3888 newMap!16) (ite (or c!11353 c!11359) (_values!2216 newMap!16) (array!3888 (store (arr!1853 (_values!2216 newMap!16)) (index!3093 lt!33818) (ValueCellFull!896 lt!33657)) (size!2093 (_values!2216 newMap!16)))) (mask!6209 newMap!16) (ite (and c!11353 c!11351) lt!33814 (extraKeys!2088 newMap!16)) (ite (and c!11353 c!11351) lt!33657 (zeroValue!2133 newMap!16)) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34209 () (_ BitVec 64))

(assert (=> b!75539 (= lt!34209 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34225 () (_ BitVec 64))

(assert (=> b!75539 (= lt!34225 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34214 () Unit!2147)

(assert (=> b!75539 (= lt!34214 (addStillContains!52 lt!34210 lt!34209 (ite (and c!11353 c!11351) lt!33657 (zeroValue!2133 newMap!16)) lt!34225))))

(assert (=> b!75539 (contains!723 (+!95 lt!34210 (tuple2!2131 lt!34209 (ite (and c!11353 c!11351) lt!33657 (zeroValue!2133 newMap!16)))) lt!34225)))

(declare-fun lt!34222 () Unit!2147)

(assert (=> b!75539 (= lt!34222 lt!34214)))

(declare-fun lt!34207 () ListLongMap!1409)

(assert (=> b!75539 (= lt!34207 (getCurrentListMapNoExtraKeys!59 (_keys!3888 newMap!16) (ite (or c!11353 c!11359) (_values!2216 newMap!16) (array!3888 (store (arr!1853 (_values!2216 newMap!16)) (index!3093 lt!33818) (ValueCellFull!896 lt!33657)) (size!2093 (_values!2216 newMap!16)))) (mask!6209 newMap!16) (ite (and c!11353 c!11351) lt!33814 (extraKeys!2088 newMap!16)) (ite (and c!11353 c!11351) lt!33657 (zeroValue!2133 newMap!16)) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34223 () (_ BitVec 64))

(assert (=> b!75539 (= lt!34223 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34212 () (_ BitVec 64))

(assert (=> b!75539 (= lt!34212 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34205 () Unit!2147)

(assert (=> b!75539 (= lt!34205 (addApplyDifferent!52 lt!34207 lt!34223 (minValue!2133 newMap!16) lt!34212))))

(assert (=> b!75539 (= (apply!76 (+!95 lt!34207 (tuple2!2131 lt!34223 (minValue!2133 newMap!16))) lt!34212) (apply!76 lt!34207 lt!34212))))

(declare-fun lt!34219 () Unit!2147)

(assert (=> b!75539 (= lt!34219 lt!34205)))

(declare-fun lt!34224 () ListLongMap!1409)

(assert (=> b!75539 (= lt!34224 (getCurrentListMapNoExtraKeys!59 (_keys!3888 newMap!16) (ite (or c!11353 c!11359) (_values!2216 newMap!16) (array!3888 (store (arr!1853 (_values!2216 newMap!16)) (index!3093 lt!33818) (ValueCellFull!896 lt!33657)) (size!2093 (_values!2216 newMap!16)))) (mask!6209 newMap!16) (ite (and c!11353 c!11351) lt!33814 (extraKeys!2088 newMap!16)) (ite (and c!11353 c!11351) lt!33657 (zeroValue!2133 newMap!16)) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34217 () (_ BitVec 64))

(assert (=> b!75539 (= lt!34217 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34216 () (_ BitVec 64))

(assert (=> b!75539 (= lt!34216 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34220 () Unit!2147)

(assert (=> b!75539 (= lt!34220 (addApplyDifferent!52 lt!34224 lt!34217 (ite (and c!11353 c!11351) lt!33657 (zeroValue!2133 newMap!16)) lt!34216))))

(assert (=> b!75539 (= (apply!76 (+!95 lt!34224 (tuple2!2131 lt!34217 (ite (and c!11353 c!11351) lt!33657 (zeroValue!2133 newMap!16)))) lt!34216) (apply!76 lt!34224 lt!34216))))

(declare-fun lt!34206 () Unit!2147)

(assert (=> b!75539 (= lt!34206 lt!34220)))

(declare-fun lt!34218 () ListLongMap!1409)

(assert (=> b!75539 (= lt!34218 (getCurrentListMapNoExtraKeys!59 (_keys!3888 newMap!16) (ite (or c!11353 c!11359) (_values!2216 newMap!16) (array!3888 (store (arr!1853 (_values!2216 newMap!16)) (index!3093 lt!33818) (ValueCellFull!896 lt!33657)) (size!2093 (_values!2216 newMap!16)))) (mask!6209 newMap!16) (ite (and c!11353 c!11351) lt!33814 (extraKeys!2088 newMap!16)) (ite (and c!11353 c!11351) lt!33657 (zeroValue!2133 newMap!16)) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34213 () (_ BitVec 64))

(assert (=> b!75539 (= lt!34213 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34226 () (_ BitVec 64))

(assert (=> b!75539 (= lt!34226 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!75539 (= lt!34211 (addApplyDifferent!52 lt!34218 lt!34213 (minValue!2133 newMap!16) lt!34226))))

(assert (=> b!75539 (= (apply!76 (+!95 lt!34218 (tuple2!2131 lt!34213 (minValue!2133 newMap!16))) lt!34226) (apply!76 lt!34218 lt!34226))))

(declare-fun bm!6759 () Bool)

(declare-fun call!6767 () Bool)

(assert (=> bm!6759 (= call!6767 (contains!723 lt!34215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75540 () Bool)

(declare-fun res!39829 () Bool)

(assert (=> b!75540 (=> (not res!39829) (not e!49345))))

(assert (=> b!75540 (= res!39829 e!49342)))

(declare-fun res!39833 () Bool)

(assert (=> b!75540 (=> res!39833 e!49342)))

(declare-fun e!49336 () Bool)

(assert (=> b!75540 (= res!39833 (not e!49336))))

(declare-fun res!39831 () Bool)

(assert (=> b!75540 (=> (not res!39831) (not e!49336))))

(assert (=> b!75540 (= res!39831 (bvslt #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))

(declare-fun b!75541 () Bool)

(assert (=> b!75541 (= e!49336 (validKeyInArray!0 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!75542 () Bool)

(assert (=> b!75542 (= e!49335 (not call!6765))))

(declare-fun b!75543 () Bool)

(assert (=> b!75543 (= e!49337 (= (apply!76 lt!34215 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)) (get!1150 (select (arr!1853 (ite (or c!11353 c!11359) (_values!2216 newMap!16) (array!3888 (store (arr!1853 (_values!2216 newMap!16)) (index!3093 lt!33818) (ValueCellFull!896 lt!33657)) (size!2093 (_values!2216 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!328 (defaultEntry!2233 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2093 (ite (or c!11353 c!11359) (_values!2216 newMap!16) (array!3888 (store (arr!1853 (_values!2216 newMap!16)) (index!3093 lt!33818) (ValueCellFull!896 lt!33657)) (size!2093 (_values!2216 newMap!16)))))))))

(assert (=> b!75543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))

(declare-fun bm!6760 () Bool)

(assert (=> bm!6760 (= call!6765 (contains!723 lt!34215 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6761 () Bool)

(declare-fun call!6768 () ListLongMap!1409)

(declare-fun call!6763 () ListLongMap!1409)

(assert (=> bm!6761 (= call!6768 call!6763)))

(declare-fun b!75544 () Bool)

(declare-fun e!49341 () ListLongMap!1409)

(assert (=> b!75544 (= e!49341 call!6766)))

(declare-fun b!75545 () Bool)

(declare-fun Unit!2170 () Unit!2147)

(assert (=> b!75545 (= e!49343 Unit!2170)))

(declare-fun bm!6762 () Bool)

(declare-fun call!6762 () ListLongMap!1409)

(assert (=> bm!6762 (= call!6766 call!6762)))

(declare-fun b!75546 () Bool)

(assert (=> b!75546 (= e!49338 (= (apply!76 lt!34215 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2133 newMap!16)))))

(declare-fun e!49344 () Bool)

(declare-fun b!75547 () Bool)

(assert (=> b!75547 (= e!49344 (= (apply!76 lt!34215 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!11353 c!11351) lt!33657 (zeroValue!2133 newMap!16))))))

(declare-fun c!11470 () Bool)

(declare-fun b!75548 () Bool)

(assert (=> b!75548 (= c!11470 (and (not (= (bvand (ite (and c!11353 c!11351) lt!33814 (extraKeys!2088 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!11353 c!11351) lt!33814 (extraKeys!2088 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!75548 (= e!49341 e!49340)))

(declare-fun d!17919 () Bool)

(assert (=> d!17919 e!49345))

(declare-fun res!39832 () Bool)

(assert (=> d!17919 (=> (not res!39832) (not e!49345))))

(assert (=> d!17919 (= res!39832 (or (bvsge #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))))

(declare-fun lt!34208 () ListLongMap!1409)

(assert (=> d!17919 (= lt!34215 lt!34208)))

(declare-fun lt!34221 () Unit!2147)

(assert (=> d!17919 (= lt!34221 e!49343)))

(declare-fun c!11473 () Bool)

(declare-fun e!49334 () Bool)

(assert (=> d!17919 (= c!11473 e!49334)))

(declare-fun res!39828 () Bool)

(assert (=> d!17919 (=> (not res!39828) (not e!49334))))

(assert (=> d!17919 (= res!39828 (bvslt #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))

(declare-fun e!49333 () ListLongMap!1409)

(assert (=> d!17919 (= lt!34208 e!49333)))

(declare-fun c!11471 () Bool)

(assert (=> d!17919 (= c!11471 (and (not (= (bvand (ite (and c!11353 c!11351) lt!33814 (extraKeys!2088 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!11353 c!11351) lt!33814 (extraKeys!2088 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!17919 (validMask!0 (mask!6209 newMap!16))))

(assert (=> d!17919 (= (getCurrentListMap!413 (_keys!3888 newMap!16) (ite (or c!11353 c!11359) (_values!2216 newMap!16) (array!3888 (store (arr!1853 (_values!2216 newMap!16)) (index!3093 lt!33818) (ValueCellFull!896 lt!33657)) (size!2093 (_values!2216 newMap!16)))) (mask!6209 newMap!16) (ite (and c!11353 c!11351) lt!33814 (extraKeys!2088 newMap!16)) (ite (and c!11353 c!11351) lt!33657 (zeroValue!2133 newMap!16)) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) lt!34215)))

(declare-fun bm!6763 () Bool)

(assert (=> bm!6763 (= call!6763 (getCurrentListMapNoExtraKeys!59 (_keys!3888 newMap!16) (ite (or c!11353 c!11359) (_values!2216 newMap!16) (array!3888 (store (arr!1853 (_values!2216 newMap!16)) (index!3093 lt!33818) (ValueCellFull!896 lt!33657)) (size!2093 (_values!2216 newMap!16)))) (mask!6209 newMap!16) (ite (and c!11353 c!11351) lt!33814 (extraKeys!2088 newMap!16)) (ite (and c!11353 c!11351) lt!33657 (zeroValue!2133 newMap!16)) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun b!75549 () Bool)

(assert (=> b!75549 (= e!49333 e!49341)))

(declare-fun c!11469 () Bool)

(assert (=> b!75549 (= c!11469 (and (not (= (bvand (ite (and c!11353 c!11351) lt!33814 (extraKeys!2088 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!11353 c!11351) lt!33814 (extraKeys!2088 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6764 () Bool)

(assert (=> bm!6764 (= call!6762 (+!95 (ite c!11471 call!6763 (ite c!11469 call!6768 call!6764)) (ite (or c!11471 c!11469) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!11353 c!11351) lt!33657 (zeroValue!2133 newMap!16))) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 newMap!16)))))))

(declare-fun bm!6765 () Bool)

(assert (=> bm!6765 (= call!6764 call!6768)))

(declare-fun b!75550 () Bool)

(assert (=> b!75550 (= e!49333 (+!95 call!6762 (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 newMap!16))))))

(declare-fun b!75551 () Bool)

(assert (=> b!75551 (= e!49339 (not call!6767))))

(declare-fun b!75552 () Bool)

(assert (=> b!75552 (= e!49339 e!49344)))

(declare-fun res!39826 () Bool)

(assert (=> b!75552 (= res!39826 call!6767)))

(assert (=> b!75552 (=> (not res!39826) (not e!49344))))

(declare-fun b!75553 () Bool)

(assert (=> b!75553 (= e!49334 (validKeyInArray!0 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!17919 c!11471) b!75550))

(assert (= (and d!17919 (not c!11471)) b!75549))

(assert (= (and b!75549 c!11469) b!75544))

(assert (= (and b!75549 (not c!11469)) b!75548))

(assert (= (and b!75548 c!11470) b!75537))

(assert (= (and b!75548 (not c!11470)) b!75538))

(assert (= (or b!75537 b!75538) bm!6765))

(assert (= (or b!75544 bm!6765) bm!6761))

(assert (= (or b!75544 b!75537) bm!6762))

(assert (= (or b!75550 bm!6761) bm!6763))

(assert (= (or b!75550 bm!6762) bm!6764))

(assert (= (and d!17919 res!39828) b!75553))

(assert (= (and d!17919 c!11473) b!75539))

(assert (= (and d!17919 (not c!11473)) b!75545))

(assert (= (and d!17919 res!39832) b!75540))

(assert (= (and b!75540 res!39831) b!75541))

(assert (= (and b!75540 (not res!39833)) b!75533))

(assert (= (and b!75533 res!39830) b!75543))

(assert (= (and b!75540 res!39829) b!75535))

(assert (= (and b!75535 c!11468) b!75552))

(assert (= (and b!75535 (not c!11468)) b!75551))

(assert (= (and b!75552 res!39826) b!75547))

(assert (= (or b!75552 b!75551) bm!6759))

(assert (= (and b!75535 res!39834) b!75534))

(assert (= (and b!75534 c!11472) b!75536))

(assert (= (and b!75534 (not c!11472)) b!75542))

(assert (= (and b!75536 res!39827) b!75546))

(assert (= (or b!75536 b!75542) bm!6760))

(declare-fun b_lambda!3385 () Bool)

(assert (=> (not b_lambda!3385) (not b!75543)))

(assert (=> b!75543 t!5071))

(declare-fun b_and!4617 () Bool)

(assert (= b_and!4613 (and (=> t!5071 result!2717) b_and!4617)))

(assert (=> b!75543 t!5073))

(declare-fun b_and!4619 () Bool)

(assert (= b_and!4615 (and (=> t!5073 result!2719) b_and!4619)))

(declare-fun m!75023 () Bool)

(assert (=> b!75543 m!75023))

(assert (=> b!75543 m!74519))

(declare-fun m!75025 () Bool)

(assert (=> b!75543 m!75025))

(assert (=> b!75543 m!74523))

(declare-fun m!75027 () Bool)

(assert (=> b!75543 m!75027))

(assert (=> b!75543 m!75023))

(assert (=> b!75543 m!74523))

(assert (=> b!75543 m!74519))

(declare-fun m!75029 () Bool)

(assert (=> bm!6764 m!75029))

(assert (=> d!17919 m!74529))

(declare-fun m!75031 () Bool)

(assert (=> b!75539 m!75031))

(declare-fun m!75033 () Bool)

(assert (=> b!75539 m!75033))

(declare-fun m!75035 () Bool)

(assert (=> b!75539 m!75035))

(declare-fun m!75037 () Bool)

(assert (=> b!75539 m!75037))

(declare-fun m!75039 () Bool)

(assert (=> b!75539 m!75039))

(assert (=> b!75539 m!75037))

(declare-fun m!75041 () Bool)

(assert (=> b!75539 m!75041))

(declare-fun m!75043 () Bool)

(assert (=> b!75539 m!75043))

(declare-fun m!75045 () Bool)

(assert (=> b!75539 m!75045))

(declare-fun m!75047 () Bool)

(assert (=> b!75539 m!75047))

(declare-fun m!75049 () Bool)

(assert (=> b!75539 m!75049))

(declare-fun m!75051 () Bool)

(assert (=> b!75539 m!75051))

(assert (=> b!75539 m!75035))

(declare-fun m!75053 () Bool)

(assert (=> b!75539 m!75053))

(declare-fun m!75055 () Bool)

(assert (=> b!75539 m!75055))

(declare-fun m!75057 () Bool)

(assert (=> b!75539 m!75057))

(assert (=> b!75539 m!75055))

(assert (=> b!75539 m!74523))

(assert (=> b!75539 m!75045))

(declare-fun m!75059 () Bool)

(assert (=> b!75539 m!75059))

(declare-fun m!75061 () Bool)

(assert (=> b!75539 m!75061))

(declare-fun m!75063 () Bool)

(assert (=> bm!6759 m!75063))

(declare-fun m!75065 () Bool)

(assert (=> b!75546 m!75065))

(assert (=> b!75553 m!74523))

(assert (=> b!75553 m!74523))

(assert (=> b!75553 m!74567))

(assert (=> bm!6763 m!75059))

(declare-fun m!75067 () Bool)

(assert (=> b!75547 m!75067))

(declare-fun m!75069 () Bool)

(assert (=> b!75550 m!75069))

(declare-fun m!75071 () Bool)

(assert (=> bm!6760 m!75071))

(assert (=> b!75533 m!74523))

(assert (=> b!75533 m!74523))

(declare-fun m!75073 () Bool)

(assert (=> b!75533 m!75073))

(assert (=> b!75541 m!74523))

(assert (=> b!75541 m!74523))

(assert (=> b!75541 m!74567))

(assert (=> bm!6686 d!17919))

(declare-fun d!17921 () Bool)

(assert (=> d!17921 (= (apply!76 lt!33943 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1153 (getValueByKey!132 (toList!720 lt!33943) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3238 () Bool)

(assert (= bs!3238 d!17921))

(assert (=> bs!3238 m!74609))

(assert (=> bs!3238 m!74609))

(declare-fun m!75075 () Bool)

(assert (=> bs!3238 m!75075))

(assert (=> b!75225 d!17921))

(declare-fun d!17923 () Bool)

(declare-fun c!11474 () Bool)

(assert (=> d!17923 (= c!11474 ((_ is ValueCellFull!896) (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!49346 () V!2953)

(assert (=> d!17923 (= (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!49346)))

(declare-fun b!75554 () Bool)

(assert (=> b!75554 (= e!49346 (get!1151 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!75555 () Bool)

(assert (=> b!75555 (= e!49346 (get!1152 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17923 c!11474) b!75554))

(assert (= (and d!17923 (not c!11474)) b!75555))

(assert (=> b!75554 m!74407))

(assert (=> b!75554 m!74131))

(declare-fun m!75077 () Bool)

(assert (=> b!75554 m!75077))

(assert (=> b!75555 m!74407))

(assert (=> b!75555 m!74131))

(declare-fun m!75079 () Bool)

(assert (=> b!75555 m!75079))

(assert (=> b!75156 d!17923))

(declare-fun d!17925 () Bool)

(declare-fun e!49347 () Bool)

(assert (=> d!17925 e!49347))

(declare-fun res!39836 () Bool)

(assert (=> d!17925 (=> (not res!39836) (not e!49347))))

(declare-fun lt!34228 () ListLongMap!1409)

(assert (=> d!17925 (= res!39836 (contains!723 lt!34228 (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!34227 () List!1488)

(assert (=> d!17925 (= lt!34228 (ListLongMap!1410 lt!34227))))

(declare-fun lt!34230 () Unit!2147)

(declare-fun lt!34229 () Unit!2147)

(assert (=> d!17925 (= lt!34230 lt!34229)))

(assert (=> d!17925 (= (getValueByKey!132 lt!34227 (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!137 (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!17925 (= lt!34229 (lemmaContainsTupThenGetReturnValue!52 lt!34227 (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!17925 (= lt!34227 (insertStrictlySorted!55 (toList!720 call!6701) (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!17925 (= (+!95 call!6701 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!34228)))

(declare-fun b!75556 () Bool)

(declare-fun res!39835 () Bool)

(assert (=> b!75556 (=> (not res!39835) (not e!49347))))

(assert (=> b!75556 (= res!39835 (= (getValueByKey!132 (toList!720 lt!34228) (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!137 (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!75557 () Bool)

(assert (=> b!75557 (= e!49347 (contains!725 (toList!720 lt!34228) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1150 (select (arr!1853 (_values!2216 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!328 (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!17925 res!39836) b!75556))

(assert (= (and b!75556 res!39835) b!75557))

(declare-fun m!75081 () Bool)

(assert (=> d!17925 m!75081))

(declare-fun m!75083 () Bool)

(assert (=> d!17925 m!75083))

(declare-fun m!75085 () Bool)

(assert (=> d!17925 m!75085))

(declare-fun m!75087 () Bool)

(assert (=> d!17925 m!75087))

(declare-fun m!75089 () Bool)

(assert (=> b!75556 m!75089))

(declare-fun m!75091 () Bool)

(assert (=> b!75557 m!75091))

(assert (=> b!75156 d!17925))

(declare-fun d!17927 () Bool)

(assert (=> d!17927 (not (contains!723 (+!95 lt!33874 (tuple2!2131 lt!33875 lt!33872)) lt!33876))))

(declare-fun lt!34233 () Unit!2147)

(declare-fun choose!442 (ListLongMap!1409 (_ BitVec 64) V!2953 (_ BitVec 64)) Unit!2147)

(assert (=> d!17927 (= lt!34233 (choose!442 lt!33874 lt!33875 lt!33872 lt!33876))))

(declare-fun e!49350 () Bool)

(assert (=> d!17927 e!49350))

(declare-fun res!39839 () Bool)

(assert (=> d!17927 (=> (not res!39839) (not e!49350))))

(assert (=> d!17927 (= res!39839 (not (contains!723 lt!33874 lt!33876)))))

(assert (=> d!17927 (= (addStillNotContains!26 lt!33874 lt!33875 lt!33872 lt!33876) lt!34233)))

(declare-fun b!75561 () Bool)

(assert (=> b!75561 (= e!49350 (not (= lt!33875 lt!33876)))))

(assert (= (and d!17927 res!39839) b!75561))

(assert (=> d!17927 m!74427))

(assert (=> d!17927 m!74427))

(assert (=> d!17927 m!74431))

(declare-fun m!75093 () Bool)

(assert (=> d!17927 m!75093))

(declare-fun m!75095 () Bool)

(assert (=> d!17927 m!75095))

(assert (=> b!75156 d!17927))

(declare-fun d!17929 () Bool)

(declare-fun e!49351 () Bool)

(assert (=> d!17929 e!49351))

(declare-fun res!39841 () Bool)

(assert (=> d!17929 (=> (not res!39841) (not e!49351))))

(declare-fun lt!34235 () ListLongMap!1409)

(assert (=> d!17929 (= res!39841 (contains!723 lt!34235 (_1!1076 (tuple2!2131 lt!33875 lt!33872))))))

(declare-fun lt!34234 () List!1488)

(assert (=> d!17929 (= lt!34235 (ListLongMap!1410 lt!34234))))

(declare-fun lt!34237 () Unit!2147)

(declare-fun lt!34236 () Unit!2147)

(assert (=> d!17929 (= lt!34237 lt!34236)))

(assert (=> d!17929 (= (getValueByKey!132 lt!34234 (_1!1076 (tuple2!2131 lt!33875 lt!33872))) (Some!137 (_2!1076 (tuple2!2131 lt!33875 lt!33872))))))

(assert (=> d!17929 (= lt!34236 (lemmaContainsTupThenGetReturnValue!52 lt!34234 (_1!1076 (tuple2!2131 lt!33875 lt!33872)) (_2!1076 (tuple2!2131 lt!33875 lt!33872))))))

(assert (=> d!17929 (= lt!34234 (insertStrictlySorted!55 (toList!720 lt!33874) (_1!1076 (tuple2!2131 lt!33875 lt!33872)) (_2!1076 (tuple2!2131 lt!33875 lt!33872))))))

(assert (=> d!17929 (= (+!95 lt!33874 (tuple2!2131 lt!33875 lt!33872)) lt!34235)))

(declare-fun b!75562 () Bool)

(declare-fun res!39840 () Bool)

(assert (=> b!75562 (=> (not res!39840) (not e!49351))))

(assert (=> b!75562 (= res!39840 (= (getValueByKey!132 (toList!720 lt!34235) (_1!1076 (tuple2!2131 lt!33875 lt!33872))) (Some!137 (_2!1076 (tuple2!2131 lt!33875 lt!33872)))))))

(declare-fun b!75563 () Bool)

(assert (=> b!75563 (= e!49351 (contains!725 (toList!720 lt!34235) (tuple2!2131 lt!33875 lt!33872)))))

(assert (= (and d!17929 res!39841) b!75562))

(assert (= (and b!75562 res!39840) b!75563))

(declare-fun m!75097 () Bool)

(assert (=> d!17929 m!75097))

(declare-fun m!75099 () Bool)

(assert (=> d!17929 m!75099))

(declare-fun m!75101 () Bool)

(assert (=> d!17929 m!75101))

(declare-fun m!75103 () Bool)

(assert (=> d!17929 m!75103))

(declare-fun m!75105 () Bool)

(assert (=> b!75562 m!75105))

(declare-fun m!75107 () Bool)

(assert (=> b!75563 m!75107))

(assert (=> b!75156 d!17929))

(declare-fun d!17931 () Bool)

(declare-fun e!49353 () Bool)

(assert (=> d!17931 e!49353))

(declare-fun res!39842 () Bool)

(assert (=> d!17931 (=> res!39842 e!49353)))

(declare-fun lt!34241 () Bool)

(assert (=> d!17931 (= res!39842 (not lt!34241))))

(declare-fun lt!34240 () Bool)

(assert (=> d!17931 (= lt!34241 lt!34240)))

(declare-fun lt!34238 () Unit!2147)

(declare-fun e!49352 () Unit!2147)

(assert (=> d!17931 (= lt!34238 e!49352)))

(declare-fun c!11475 () Bool)

(assert (=> d!17931 (= c!11475 lt!34240)))

(assert (=> d!17931 (= lt!34240 (containsKey!136 (toList!720 (+!95 lt!33874 (tuple2!2131 lt!33875 lt!33872))) lt!33876))))

(assert (=> d!17931 (= (contains!723 (+!95 lt!33874 (tuple2!2131 lt!33875 lt!33872)) lt!33876) lt!34241)))

(declare-fun b!75564 () Bool)

(declare-fun lt!34239 () Unit!2147)

(assert (=> b!75564 (= e!49352 lt!34239)))

(assert (=> b!75564 (= lt!34239 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 (+!95 lt!33874 (tuple2!2131 lt!33875 lt!33872))) lt!33876))))

(assert (=> b!75564 (isDefined!86 (getValueByKey!132 (toList!720 (+!95 lt!33874 (tuple2!2131 lt!33875 lt!33872))) lt!33876))))

(declare-fun b!75565 () Bool)

(declare-fun Unit!2171 () Unit!2147)

(assert (=> b!75565 (= e!49352 Unit!2171)))

(declare-fun b!75566 () Bool)

(assert (=> b!75566 (= e!49353 (isDefined!86 (getValueByKey!132 (toList!720 (+!95 lt!33874 (tuple2!2131 lt!33875 lt!33872))) lt!33876)))))

(assert (= (and d!17931 c!11475) b!75564))

(assert (= (and d!17931 (not c!11475)) b!75565))

(assert (= (and d!17931 (not res!39842)) b!75566))

(declare-fun m!75109 () Bool)

(assert (=> d!17931 m!75109))

(declare-fun m!75111 () Bool)

(assert (=> b!75564 m!75111))

(declare-fun m!75113 () Bool)

(assert (=> b!75564 m!75113))

(assert (=> b!75564 m!75113))

(declare-fun m!75115 () Bool)

(assert (=> b!75564 m!75115))

(assert (=> b!75566 m!75113))

(assert (=> b!75566 m!75113))

(assert (=> b!75566 m!75115))

(assert (=> b!75156 d!17931))

(declare-fun d!17933 () Bool)

(declare-fun isEmpty!325 (List!1488) Bool)

(assert (=> d!17933 (= (isEmpty!323 lt!33871) (isEmpty!325 (toList!720 lt!33871)))))

(declare-fun bs!3239 () Bool)

(assert (= bs!3239 d!17933))

(declare-fun m!75117 () Bool)

(assert (=> bs!3239 m!75117))

(assert (=> b!75158 d!17933))

(declare-fun d!17935 () Bool)

(assert (=> d!17935 (= (validKeyInArray!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!74956 d!17935))

(declare-fun d!17937 () Bool)

(declare-fun lt!34244 () Bool)

(declare-fun content!80 (List!1489) (InoxSet (_ BitVec 64)))

(assert (=> d!17937 (= lt!34244 (select (content!80 Nil!1486) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun e!49359 () Bool)

(assert (=> d!17937 (= lt!34244 e!49359)))

(declare-fun res!39847 () Bool)

(assert (=> d!17937 (=> (not res!39847) (not e!49359))))

(assert (=> d!17937 (= res!39847 ((_ is Cons!1485) Nil!1486))))

(assert (=> d!17937 (= (contains!724 Nil!1486 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) lt!34244)))

(declare-fun b!75571 () Bool)

(declare-fun e!49358 () Bool)

(assert (=> b!75571 (= e!49359 e!49358)))

(declare-fun res!39848 () Bool)

(assert (=> b!75571 (=> res!39848 e!49358)))

(assert (=> b!75571 (= res!39848 (= (h!2073 Nil!1486) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(declare-fun b!75572 () Bool)

(assert (=> b!75572 (= e!49358 (contains!724 (t!5058 Nil!1486) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(assert (= (and d!17937 res!39847) b!75571))

(assert (= (and b!75571 (not res!39848)) b!75572))

(declare-fun m!75119 () Bool)

(assert (=> d!17937 m!75119))

(assert (=> d!17937 m!74111))

(declare-fun m!75121 () Bool)

(assert (=> d!17937 m!75121))

(assert (=> b!75572 m!74111))

(declare-fun m!75123 () Bool)

(assert (=> b!75572 m!75123))

(assert (=> b!74984 d!17937))

(declare-fun d!17939 () Bool)

(declare-fun lt!34245 () Bool)

(assert (=> d!17939 (= lt!34245 (select (content!79 (toList!720 lt!33850)) lt!33648))))

(declare-fun e!49361 () Bool)

(assert (=> d!17939 (= lt!34245 e!49361)))

(declare-fun res!39849 () Bool)

(assert (=> d!17939 (=> (not res!39849) (not e!49361))))

(assert (=> d!17939 (= res!39849 ((_ is Cons!1484) (toList!720 lt!33850)))))

(assert (=> d!17939 (= (contains!725 (toList!720 lt!33850) lt!33648) lt!34245)))

(declare-fun b!75573 () Bool)

(declare-fun e!49360 () Bool)

(assert (=> b!75573 (= e!49361 e!49360)))

(declare-fun res!39850 () Bool)

(assert (=> b!75573 (=> res!39850 e!49360)))

(assert (=> b!75573 (= res!39850 (= (h!2072 (toList!720 lt!33850)) lt!33648))))

(declare-fun b!75574 () Bool)

(assert (=> b!75574 (= e!49360 (contains!725 (t!5057 (toList!720 lt!33850)) lt!33648))))

(assert (= (and d!17939 res!39849) b!75573))

(assert (= (and b!75573 (not res!39850)) b!75574))

(declare-fun m!75125 () Bool)

(assert (=> d!17939 m!75125))

(declare-fun m!75127 () Bool)

(assert (=> d!17939 m!75127))

(declare-fun m!75129 () Bool)

(assert (=> b!75574 m!75129))

(assert (=> b!75127 d!17939))

(declare-fun d!17941 () Bool)

(assert (=> d!17941 (= (inRange!0 (ite c!11359 (ite c!11350 (index!3093 lt!33828) (ite c!11355 (index!3092 lt!33826) (index!3095 lt!33826))) (ite c!11357 (index!3093 lt!33827) (ite c!11356 (index!3092 lt!33820) (index!3095 lt!33820)))) (mask!6209 newMap!16)) (and (bvsge (ite c!11359 (ite c!11350 (index!3093 lt!33828) (ite c!11355 (index!3092 lt!33826) (index!3095 lt!33826))) (ite c!11357 (index!3093 lt!33827) (ite c!11356 (index!3092 lt!33820) (index!3095 lt!33820)))) #b00000000000000000000000000000000) (bvslt (ite c!11359 (ite c!11350 (index!3093 lt!33828) (ite c!11355 (index!3092 lt!33826) (index!3095 lt!33826))) (ite c!11357 (index!3093 lt!33827) (ite c!11356 (index!3092 lt!33820) (index!3095 lt!33820)))) (bvadd (mask!6209 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!6687 d!17941))

(declare-fun b!75575 () Bool)

(declare-fun e!49365 () Bool)

(declare-fun e!49363 () Bool)

(assert (=> b!75575 (= e!49365 e!49363)))

(declare-fun res!39852 () Bool)

(assert (=> b!75575 (=> (not res!39852) (not e!49363))))

(declare-fun e!49364 () Bool)

(assert (=> b!75575 (= res!39852 (not e!49364))))

(declare-fun res!39851 () Bool)

(assert (=> b!75575 (=> (not res!39851) (not e!49364))))

(assert (=> b!75575 (= res!39851 (validKeyInArray!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!75576 () Bool)

(declare-fun e!49362 () Bool)

(assert (=> b!75576 (= e!49363 e!49362)))

(declare-fun c!11476 () Bool)

(assert (=> b!75576 (= c!11476 (validKeyInArray!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!75577 () Bool)

(assert (=> b!75577 (= e!49364 (contains!724 (ite c!11314 (Cons!1485 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) Nil!1486) Nil!1486) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!75578 () Bool)

(declare-fun call!6769 () Bool)

(assert (=> b!75578 (= e!49362 call!6769)))

(declare-fun bm!6766 () Bool)

(assert (=> bm!6766 (= call!6769 (arrayNoDuplicates!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!11476 (Cons!1485 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!11314 (Cons!1485 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) Nil!1486) Nil!1486)) (ite c!11314 (Cons!1485 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) Nil!1486) Nil!1486))))))

(declare-fun d!17943 () Bool)

(declare-fun res!39853 () Bool)

(assert (=> d!17943 (=> res!39853 e!49365)))

(assert (=> d!17943 (= res!39853 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(assert (=> d!17943 (= (arrayNoDuplicates!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!11314 (Cons!1485 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) Nil!1486) Nil!1486)) e!49365)))

(declare-fun b!75579 () Bool)

(assert (=> b!75579 (= e!49362 call!6769)))

(assert (= (and d!17943 (not res!39853)) b!75575))

(assert (= (and b!75575 res!39851) b!75577))

(assert (= (and b!75575 res!39852) b!75576))

(assert (= (and b!75576 c!11476) b!75579))

(assert (= (and b!75576 (not c!11476)) b!75578))

(assert (= (or b!75579 b!75578) bm!6766))

(declare-fun m!75131 () Bool)

(assert (=> b!75575 m!75131))

(assert (=> b!75575 m!75131))

(declare-fun m!75133 () Bool)

(assert (=> b!75575 m!75133))

(assert (=> b!75576 m!75131))

(assert (=> b!75576 m!75131))

(assert (=> b!75576 m!75133))

(assert (=> b!75577 m!75131))

(assert (=> b!75577 m!75131))

(declare-fun m!75135 () Bool)

(assert (=> b!75577 m!75135))

(assert (=> bm!6766 m!75131))

(declare-fun m!75137 () Bool)

(assert (=> bm!6766 m!75137))

(assert (=> bm!6623 d!17943))

(declare-fun d!17945 () Bool)

(declare-fun res!39854 () Bool)

(declare-fun e!49366 () Bool)

(assert (=> d!17945 (=> res!39854 e!49366)))

(assert (=> d!17945 (= res!39854 (= (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(assert (=> d!17945 (= (arrayContainsKey!0 (_keys!3888 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b00000000000000000000000000000000) e!49366)))

(declare-fun b!75580 () Bool)

(declare-fun e!49367 () Bool)

(assert (=> b!75580 (= e!49366 e!49367)))

(declare-fun res!39855 () Bool)

(assert (=> b!75580 (=> (not res!39855) (not e!49367))))

(assert (=> b!75580 (= res!39855 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2092 (_keys!3888 newMap!16))))))

(declare-fun b!75581 () Bool)

(assert (=> b!75581 (= e!49367 (arrayContainsKey!0 (_keys!3888 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!17945 (not res!39854)) b!75580))

(assert (= (and b!75580 res!39855) b!75581))

(assert (=> d!17945 m!74523))

(assert (=> b!75581 m!74111))

(declare-fun m!75139 () Bool)

(assert (=> b!75581 m!75139))

(assert (=> bm!6689 d!17945))

(declare-fun d!17947 () Bool)

(declare-fun lt!34246 () Bool)

(assert (=> d!17947 (= lt!34246 (select (content!79 (toList!720 lt!33854)) lt!33653))))

(declare-fun e!49369 () Bool)

(assert (=> d!17947 (= lt!34246 e!49369)))

(declare-fun res!39856 () Bool)

(assert (=> d!17947 (=> (not res!39856) (not e!49369))))

(assert (=> d!17947 (= res!39856 ((_ is Cons!1484) (toList!720 lt!33854)))))

(assert (=> d!17947 (= (contains!725 (toList!720 lt!33854) lt!33653) lt!34246)))

(declare-fun b!75582 () Bool)

(declare-fun e!49368 () Bool)

(assert (=> b!75582 (= e!49369 e!49368)))

(declare-fun res!39857 () Bool)

(assert (=> b!75582 (=> res!39857 e!49368)))

(assert (=> b!75582 (= res!39857 (= (h!2072 (toList!720 lt!33854)) lt!33653))))

(declare-fun b!75583 () Bool)

(assert (=> b!75583 (= e!49368 (contains!725 (t!5057 (toList!720 lt!33854)) lt!33653))))

(assert (= (and d!17947 res!39856) b!75582))

(assert (= (and b!75582 (not res!39857)) b!75583))

(declare-fun m!75141 () Bool)

(assert (=> d!17947 m!75141))

(declare-fun m!75143 () Bool)

(assert (=> d!17947 m!75143))

(declare-fun m!75145 () Bool)

(assert (=> b!75583 m!75145))

(assert (=> b!75129 d!17947))

(declare-fun d!17949 () Bool)

(declare-fun e!49371 () Bool)

(assert (=> d!17949 e!49371))

(declare-fun res!39858 () Bool)

(assert (=> d!17949 (=> res!39858 e!49371)))

(declare-fun lt!34250 () Bool)

(assert (=> d!17949 (= res!39858 (not lt!34250))))

(declare-fun lt!34249 () Bool)

(assert (=> d!17949 (= lt!34250 lt!34249)))

(declare-fun lt!34247 () Unit!2147)

(declare-fun e!49370 () Unit!2147)

(assert (=> d!17949 (= lt!34247 e!49370)))

(declare-fun c!11477 () Bool)

(assert (=> d!17949 (= c!11477 lt!34249)))

(assert (=> d!17949 (= lt!34249 (containsKey!136 (toList!720 lt!33943) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!17949 (= (contains!723 lt!33943 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!34250)))

(declare-fun b!75584 () Bool)

(declare-fun lt!34248 () Unit!2147)

(assert (=> b!75584 (= e!49370 lt!34248)))

(assert (=> b!75584 (= lt!34248 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 lt!33943) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!75584 (isDefined!86 (getValueByKey!132 (toList!720 lt!33943) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!75585 () Bool)

(declare-fun Unit!2172 () Unit!2147)

(assert (=> b!75585 (= e!49370 Unit!2172)))

(declare-fun b!75586 () Bool)

(assert (=> b!75586 (= e!49371 (isDefined!86 (getValueByKey!132 (toList!720 lt!33943) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!17949 c!11477) b!75584))

(assert (= (and d!17949 (not c!11477)) b!75585))

(assert (= (and d!17949 (not res!39858)) b!75586))

(assert (=> d!17949 m!74305))

(declare-fun m!75147 () Bool)

(assert (=> d!17949 m!75147))

(assert (=> b!75584 m!74305))

(declare-fun m!75149 () Bool)

(assert (=> b!75584 m!75149))

(assert (=> b!75584 m!74305))

(declare-fun m!75151 () Bool)

(assert (=> b!75584 m!75151))

(assert (=> b!75584 m!75151))

(declare-fun m!75153 () Bool)

(assert (=> b!75584 m!75153))

(assert (=> b!75586 m!74305))

(assert (=> b!75586 m!75151))

(assert (=> b!75586 m!75151))

(assert (=> b!75586 m!75153))

(assert (=> b!75212 d!17949))

(declare-fun d!17951 () Bool)

(declare-fun res!39859 () Bool)

(declare-fun e!49372 () Bool)

(assert (=> d!17951 (=> (not res!39859) (not e!49372))))

(assert (=> d!17951 (= res!39859 (simpleValid!52 (v!2539 (underlying!259 thiss!992))))))

(assert (=> d!17951 (= (valid!303 (v!2539 (underlying!259 thiss!992))) e!49372)))

(declare-fun b!75587 () Bool)

(declare-fun res!39860 () Bool)

(assert (=> b!75587 (=> (not res!39860) (not e!49372))))

(assert (=> b!75587 (= res!39860 (= (arrayCountValidKeys!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000000 (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))) (_size!399 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun b!75588 () Bool)

(declare-fun res!39861 () Bool)

(assert (=> b!75588 (=> (not res!39861) (not e!49372))))

(assert (=> b!75588 (= res!39861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992)))))))

(declare-fun b!75589 () Bool)

(assert (=> b!75589 (= e!49372 (arrayNoDuplicates!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000000 Nil!1486))))

(assert (= (and d!17951 res!39859) b!75587))

(assert (= (and b!75587 res!39860) b!75588))

(assert (= (and b!75588 res!39861) b!75589))

(declare-fun m!75155 () Bool)

(assert (=> d!17951 m!75155))

(declare-fun m!75157 () Bool)

(assert (=> b!75587 m!75157))

(assert (=> b!75588 m!74137))

(declare-fun m!75159 () Bool)

(assert (=> b!75589 m!75159))

(assert (=> d!17783 d!17951))

(declare-fun d!17953 () Bool)

(declare-fun e!49373 () Bool)

(assert (=> d!17953 e!49373))

(declare-fun res!39863 () Bool)

(assert (=> d!17953 (=> (not res!39863) (not e!49373))))

(declare-fun lt!34252 () ListLongMap!1409)

(assert (=> d!17953 (= res!39863 (contains!723 lt!34252 (_1!1076 (ite (or c!11387 c!11385) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992))))))))))

(declare-fun lt!34251 () List!1488)

(assert (=> d!17953 (= lt!34252 (ListLongMap!1410 lt!34251))))

(declare-fun lt!34254 () Unit!2147)

(declare-fun lt!34253 () Unit!2147)

(assert (=> d!17953 (= lt!34254 lt!34253)))

(assert (=> d!17953 (= (getValueByKey!132 lt!34251 (_1!1076 (ite (or c!11387 c!11385) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992))))))) (Some!137 (_2!1076 (ite (or c!11387 c!11385) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992))))))))))

(assert (=> d!17953 (= lt!34253 (lemmaContainsTupThenGetReturnValue!52 lt!34251 (_1!1076 (ite (or c!11387 c!11385) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))) (_2!1076 (ite (or c!11387 c!11385) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992))))))))))

(assert (=> d!17953 (= lt!34251 (insertStrictlySorted!55 (toList!720 (ite c!11387 call!6717 (ite c!11385 call!6722 call!6718))) (_1!1076 (ite (or c!11387 c!11385) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))) (_2!1076 (ite (or c!11387 c!11385) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992))))))))))

(assert (=> d!17953 (= (+!95 (ite c!11387 call!6717 (ite c!11385 call!6722 call!6718)) (ite (or c!11387 c!11385) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))) lt!34252)))

(declare-fun b!75590 () Bool)

(declare-fun res!39862 () Bool)

(assert (=> b!75590 (=> (not res!39862) (not e!49373))))

(assert (=> b!75590 (= res!39862 (= (getValueByKey!132 (toList!720 lt!34252) (_1!1076 (ite (or c!11387 c!11385) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992))))))) (Some!137 (_2!1076 (ite (or c!11387 c!11385) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))))))

(declare-fun b!75591 () Bool)

(assert (=> b!75591 (= e!49373 (contains!725 (toList!720 lt!34252) (ite (or c!11387 c!11385) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (= (and d!17953 res!39863) b!75590))

(assert (= (and b!75590 res!39862) b!75591))

(declare-fun m!75161 () Bool)

(assert (=> d!17953 m!75161))

(declare-fun m!75163 () Bool)

(assert (=> d!17953 m!75163))

(declare-fun m!75165 () Bool)

(assert (=> d!17953 m!75165))

(declare-fun m!75167 () Bool)

(assert (=> d!17953 m!75167))

(declare-fun m!75169 () Bool)

(assert (=> b!75590 m!75169))

(declare-fun m!75171 () Bool)

(assert (=> b!75591 m!75171))

(assert (=> bm!6718 d!17953))

(declare-fun d!17955 () Bool)

(assert (=> d!17955 (= (apply!76 lt!33871 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1153 (getValueByKey!132 (toList!720 lt!33871) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3240 () Bool)

(assert (= bs!3240 d!17955))

(assert (=> bs!3240 m!74305))

(declare-fun m!75173 () Bool)

(assert (=> bs!3240 m!75173))

(assert (=> bs!3240 m!75173))

(declare-fun m!75175 () Bool)

(assert (=> bs!3240 m!75175))

(assert (=> b!75161 d!17955))

(assert (=> b!75161 d!17923))

(declare-fun d!17957 () Bool)

(declare-fun res!39864 () Bool)

(declare-fun e!49374 () Bool)

(assert (=> d!17957 (=> res!39864 e!49374)))

(assert (=> d!17957 (= res!39864 (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(assert (=> d!17957 (= (arrayContainsKey!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!49374)))

(declare-fun b!75592 () Bool)

(declare-fun e!49375 () Bool)

(assert (=> b!75592 (= e!49374 e!49375)))

(declare-fun res!39865 () Bool)

(assert (=> b!75592 (=> (not res!39865) (not e!49375))))

(assert (=> b!75592 (= res!39865 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2092 (_keys!3888 (v!2539 (underlying!259 thiss!992))))))))

(declare-fun b!75593 () Bool)

(assert (=> b!75593 (= e!49375 (arrayContainsKey!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!17957 (not res!39864)) b!75592))

(assert (= (and b!75592 res!39865) b!75593))

(assert (=> d!17957 m!74753))

(assert (=> b!75593 m!74111))

(declare-fun m!75177 () Bool)

(assert (=> b!75593 m!75177))

(assert (=> b!74965 d!17957))

(assert (=> b!75099 d!17865))

(declare-fun d!17959 () Bool)

(declare-fun e!49377 () Bool)

(assert (=> d!17959 e!49377))

(declare-fun res!39866 () Bool)

(assert (=> d!17959 (=> res!39866 e!49377)))

(declare-fun lt!34258 () Bool)

(assert (=> d!17959 (= res!39866 (not lt!34258))))

(declare-fun lt!34257 () Bool)

(assert (=> d!17959 (= lt!34258 lt!34257)))

(declare-fun lt!34255 () Unit!2147)

(declare-fun e!49376 () Unit!2147)

(assert (=> d!17959 (= lt!34255 e!49376)))

(declare-fun c!11478 () Bool)

(assert (=> d!17959 (= c!11478 lt!34257)))

(assert (=> d!17959 (= lt!34257 (containsKey!136 (toList!720 lt!33871) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!17959 (= (contains!723 lt!33871 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!34258)))

(declare-fun b!75594 () Bool)

(declare-fun lt!34256 () Unit!2147)

(assert (=> b!75594 (= e!49376 lt!34256)))

(assert (=> b!75594 (= lt!34256 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 lt!33871) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!75594 (isDefined!86 (getValueByKey!132 (toList!720 lt!33871) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!75595 () Bool)

(declare-fun Unit!2173 () Unit!2147)

(assert (=> b!75595 (= e!49376 Unit!2173)))

(declare-fun b!75596 () Bool)

(assert (=> b!75596 (= e!49377 (isDefined!86 (getValueByKey!132 (toList!720 lt!33871) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!17959 c!11478) b!75594))

(assert (= (and d!17959 (not c!11478)) b!75595))

(assert (= (and d!17959 (not res!39866)) b!75596))

(assert (=> d!17959 m!74305))

(declare-fun m!75179 () Bool)

(assert (=> d!17959 m!75179))

(assert (=> b!75594 m!74305))

(declare-fun m!75181 () Bool)

(assert (=> b!75594 m!75181))

(assert (=> b!75594 m!74305))

(assert (=> b!75594 m!75173))

(assert (=> b!75594 m!75173))

(declare-fun m!75183 () Bool)

(assert (=> b!75594 m!75183))

(assert (=> b!75596 m!74305))

(assert (=> b!75596 m!75173))

(assert (=> b!75596 m!75173))

(assert (=> b!75596 m!75183))

(assert (=> b!75163 d!17959))

(declare-fun d!17961 () Bool)

(declare-fun e!49378 () Bool)

(assert (=> d!17961 e!49378))

(declare-fun res!39868 () Bool)

(assert (=> d!17961 (=> (not res!39868) (not e!49378))))

(declare-fun lt!34260 () ListLongMap!1409)

(assert (=> d!17961 (= res!39868 (contains!723 lt!34260 (_1!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(declare-fun lt!34259 () List!1488)

(assert (=> d!17961 (= lt!34260 (ListLongMap!1410 lt!34259))))

(declare-fun lt!34262 () Unit!2147)

(declare-fun lt!34261 () Unit!2147)

(assert (=> d!17961 (= lt!34262 lt!34261)))

(assert (=> d!17961 (= (getValueByKey!132 lt!34259 (_1!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))) (Some!137 (_2!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17961 (= lt!34261 (lemmaContainsTupThenGetReturnValue!52 lt!34259 (_1!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) (_2!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17961 (= lt!34259 (insertStrictlySorted!55 (toList!720 (+!95 lt!33649 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))) (_1!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) (_2!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17961 (= (+!95 (+!95 lt!33649 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!34260)))

(declare-fun b!75597 () Bool)

(declare-fun res!39867 () Bool)

(assert (=> b!75597 (=> (not res!39867) (not e!49378))))

(assert (=> b!75597 (= res!39867 (= (getValueByKey!132 (toList!720 lt!34260) (_1!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))) (Some!137 (_2!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))))))))

(declare-fun b!75598 () Bool)

(assert (=> b!75598 (= e!49378 (contains!725 (toList!720 lt!34260) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))))))

(assert (= (and d!17961 res!39868) b!75597))

(assert (= (and b!75597 res!39867) b!75598))

(declare-fun m!75185 () Bool)

(assert (=> d!17961 m!75185))

(declare-fun m!75187 () Bool)

(assert (=> d!17961 m!75187))

(declare-fun m!75189 () Bool)

(assert (=> d!17961 m!75189))

(declare-fun m!75191 () Bool)

(assert (=> d!17961 m!75191))

(declare-fun m!75193 () Bool)

(assert (=> b!75597 m!75193))

(declare-fun m!75195 () Bool)

(assert (=> b!75598 m!75195))

(assert (=> d!17791 d!17961))

(declare-fun d!17963 () Bool)

(declare-fun e!49379 () Bool)

(assert (=> d!17963 e!49379))

(declare-fun res!39870 () Bool)

(assert (=> d!17963 (=> (not res!39870) (not e!49379))))

(declare-fun lt!34264 () ListLongMap!1409)

(assert (=> d!17963 (= res!39870 (contains!723 lt!34264 (_1!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(declare-fun lt!34263 () List!1488)

(assert (=> d!17963 (= lt!34264 (ListLongMap!1410 lt!34263))))

(declare-fun lt!34266 () Unit!2147)

(declare-fun lt!34265 () Unit!2147)

(assert (=> d!17963 (= lt!34266 lt!34265)))

(assert (=> d!17963 (= (getValueByKey!132 lt!34263 (_1!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))) (Some!137 (_2!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17963 (= lt!34265 (lemmaContainsTupThenGetReturnValue!52 lt!34263 (_1!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) (_2!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17963 (= lt!34263 (insertStrictlySorted!55 (toList!720 lt!33649) (_1!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) (_2!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17963 (= (+!95 lt!33649 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!34264)))

(declare-fun b!75599 () Bool)

(declare-fun res!39869 () Bool)

(assert (=> b!75599 (=> (not res!39869) (not e!49379))))

(assert (=> b!75599 (= res!39869 (= (getValueByKey!132 (toList!720 lt!34264) (_1!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))) (Some!137 (_2!1076 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))))))))

(declare-fun b!75600 () Bool)

(assert (=> b!75600 (= e!49379 (contains!725 (toList!720 lt!34264) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))))))

(assert (= (and d!17963 res!39870) b!75599))

(assert (= (and b!75599 res!39869) b!75600))

(declare-fun m!75197 () Bool)

(assert (=> d!17963 m!75197))

(declare-fun m!75199 () Bool)

(assert (=> d!17963 m!75199))

(declare-fun m!75201 () Bool)

(assert (=> d!17963 m!75201))

(declare-fun m!75203 () Bool)

(assert (=> d!17963 m!75203))

(declare-fun m!75205 () Bool)

(assert (=> b!75599 m!75205))

(declare-fun m!75207 () Bool)

(assert (=> b!75600 m!75207))

(assert (=> d!17791 d!17963))

(declare-fun d!17965 () Bool)

(declare-fun e!49380 () Bool)

(assert (=> d!17965 e!49380))

(declare-fun res!39872 () Bool)

(assert (=> d!17965 (=> (not res!39872) (not e!49380))))

(declare-fun lt!34268 () ListLongMap!1409)

(assert (=> d!17965 (= res!39872 (contains!723 lt!34268 (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(declare-fun lt!34267 () List!1488)

(assert (=> d!17965 (= lt!34268 (ListLongMap!1410 lt!34267))))

(declare-fun lt!34270 () Unit!2147)

(declare-fun lt!34269 () Unit!2147)

(assert (=> d!17965 (= lt!34270 lt!34269)))

(assert (=> d!17965 (= (getValueByKey!132 lt!34267 (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))) (Some!137 (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(assert (=> d!17965 (= lt!34269 (lemmaContainsTupThenGetReturnValue!52 lt!34267 (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)) (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(assert (=> d!17965 (= lt!34267 (insertStrictlySorted!55 (toList!720 lt!33649) (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)) (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(assert (=> d!17965 (= (+!95 lt!33649 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)) lt!34268)))

(declare-fun b!75601 () Bool)

(declare-fun res!39871 () Bool)

(assert (=> b!75601 (=> (not res!39871) (not e!49380))))

(assert (=> b!75601 (= res!39871 (= (getValueByKey!132 (toList!720 lt!34268) (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))) (Some!137 (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)))))))

(declare-fun b!75602 () Bool)

(assert (=> b!75602 (= e!49380 (contains!725 (toList!720 lt!34268) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)))))

(assert (= (and d!17965 res!39872) b!75601))

(assert (= (and b!75601 res!39871) b!75602))

(declare-fun m!75209 () Bool)

(assert (=> d!17965 m!75209))

(declare-fun m!75211 () Bool)

(assert (=> d!17965 m!75211))

(declare-fun m!75213 () Bool)

(assert (=> d!17965 m!75213))

(declare-fun m!75215 () Bool)

(assert (=> d!17965 m!75215))

(declare-fun m!75217 () Bool)

(assert (=> b!75601 m!75217))

(declare-fun m!75219 () Bool)

(assert (=> b!75602 m!75219))

(assert (=> d!17791 d!17965))

(declare-fun d!17967 () Bool)

(declare-fun e!49381 () Bool)

(assert (=> d!17967 e!49381))

(declare-fun res!39874 () Bool)

(assert (=> d!17967 (=> (not res!39874) (not e!49381))))

(declare-fun lt!34272 () ListLongMap!1409)

(assert (=> d!17967 (= res!39874 (contains!723 lt!34272 (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(declare-fun lt!34271 () List!1488)

(assert (=> d!17967 (= lt!34272 (ListLongMap!1410 lt!34271))))

(declare-fun lt!34274 () Unit!2147)

(declare-fun lt!34273 () Unit!2147)

(assert (=> d!17967 (= lt!34274 lt!34273)))

(assert (=> d!17967 (= (getValueByKey!132 lt!34271 (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))) (Some!137 (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(assert (=> d!17967 (= lt!34273 (lemmaContainsTupThenGetReturnValue!52 lt!34271 (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)) (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(assert (=> d!17967 (= lt!34271 (insertStrictlySorted!55 (toList!720 (+!95 lt!33649 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))))) (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)) (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))))))

(assert (=> d!17967 (= (+!95 (+!95 lt!33649 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)) lt!34272)))

(declare-fun b!75603 () Bool)

(declare-fun res!39873 () Bool)

(assert (=> b!75603 (=> (not res!39873) (not e!49381))))

(assert (=> b!75603 (= res!39873 (= (getValueByKey!132 (toList!720 lt!34272) (_1!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657))) (Some!137 (_2!1076 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)))))))

(declare-fun b!75604 () Bool)

(assert (=> b!75604 (= e!49381 (contains!725 (toList!720 lt!34272) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)))))

(assert (= (and d!17967 res!39874) b!75603))

(assert (= (and b!75603 res!39873) b!75604))

(declare-fun m!75221 () Bool)

(assert (=> d!17967 m!75221))

(declare-fun m!75223 () Bool)

(assert (=> d!17967 m!75223))

(declare-fun m!75225 () Bool)

(assert (=> d!17967 m!75225))

(declare-fun m!75227 () Bool)

(assert (=> d!17967 m!75227))

(declare-fun m!75229 () Bool)

(assert (=> b!75603 m!75229))

(declare-fun m!75231 () Bool)

(assert (=> b!75604 m!75231))

(assert (=> d!17791 d!17967))

(declare-fun d!17969 () Bool)

(assert (=> d!17969 (= (+!95 (+!95 lt!33649 (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) (+!95 (+!95 lt!33649 (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992))))) (tuple2!2131 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657)))))

(assert (=> d!17969 true))

(declare-fun _$28!124 () Unit!2147)

(assert (=> d!17969 (= (choose!433 lt!33649 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) lt!33657 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2539 (underlying!259 thiss!992)))) _$28!124)))

(declare-fun bs!3241 () Bool)

(assert (= bs!3241 d!17969))

(assert (=> bs!3241 m!74439))

(assert (=> bs!3241 m!74439))

(assert (=> bs!3241 m!74441))

(assert (=> bs!3241 m!74433))

(assert (=> bs!3241 m!74433))

(assert (=> bs!3241 m!74437))

(assert (=> d!17791 d!17969))

(declare-fun d!17971 () Bool)

(declare-fun e!49382 () Bool)

(assert (=> d!17971 e!49382))

(declare-fun res!39876 () Bool)

(assert (=> d!17971 (=> (not res!39876) (not e!49382))))

(declare-fun lt!34276 () ListLongMap!1409)

(assert (=> d!17971 (= res!39876 (contains!723 lt!34276 (_1!1076 (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(declare-fun lt!34275 () List!1488)

(assert (=> d!17971 (= lt!34276 (ListLongMap!1410 lt!34275))))

(declare-fun lt!34278 () Unit!2147)

(declare-fun lt!34277 () Unit!2147)

(assert (=> d!17971 (= lt!34278 lt!34277)))

(assert (=> d!17971 (= (getValueByKey!132 lt!34275 (_1!1076 (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))) (Some!137 (_2!1076 (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17971 (= lt!34277 (lemmaContainsTupThenGetReturnValue!52 lt!34275 (_1!1076 (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992))))) (_2!1076 (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17971 (= lt!34275 (insertStrictlySorted!55 (toList!720 call!6716) (_1!1076 (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992))))) (_2!1076 (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))))))

(assert (=> d!17971 (= (+!95 call!6716 (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992))))) lt!34276)))

(declare-fun b!75605 () Bool)

(declare-fun res!39875 () Bool)

(assert (=> b!75605 (=> (not res!39875) (not e!49382))))

(assert (=> b!75605 (= res!39875 (= (getValueByKey!132 (toList!720 lt!34276) (_1!1076 (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992)))))) (Some!137 (_2!1076 (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992))))))))))

(declare-fun b!75606 () Bool)

(assert (=> b!75606 (= e!49382 (contains!725 (toList!720 lt!34276) (tuple2!2131 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2539 (underlying!259 thiss!992))))))))

(assert (= (and d!17971 res!39876) b!75605))

(assert (= (and b!75605 res!39875) b!75606))

(declare-fun m!75233 () Bool)

(assert (=> d!17971 m!75233))

(declare-fun m!75235 () Bool)

(assert (=> d!17971 m!75235))

(declare-fun m!75237 () Bool)

(assert (=> d!17971 m!75237))

(declare-fun m!75239 () Bool)

(assert (=> d!17971 m!75239))

(declare-fun m!75241 () Bool)

(assert (=> b!75605 m!75241))

(declare-fun m!75243 () Bool)

(assert (=> b!75606 m!75243))

(assert (=> b!75229 d!17971))

(declare-fun d!17973 () Bool)

(declare-fun e!49384 () Bool)

(assert (=> d!17973 e!49384))

(declare-fun res!39877 () Bool)

(assert (=> d!17973 (=> res!39877 e!49384)))

(declare-fun lt!34282 () Bool)

(assert (=> d!17973 (= res!39877 (not lt!34282))))

(declare-fun lt!34281 () Bool)

(assert (=> d!17973 (= lt!34282 lt!34281)))

(declare-fun lt!34279 () Unit!2147)

(declare-fun e!49383 () Unit!2147)

(assert (=> d!17973 (= lt!34279 e!49383)))

(declare-fun c!11479 () Bool)

(assert (=> d!17973 (= c!11479 lt!34281)))

(assert (=> d!17973 (= lt!34281 (containsKey!136 (toList!720 lt!33882) (_1!1076 lt!33653)))))

(assert (=> d!17973 (= (contains!723 lt!33882 (_1!1076 lt!33653)) lt!34282)))

(declare-fun b!75607 () Bool)

(declare-fun lt!34280 () Unit!2147)

(assert (=> b!75607 (= e!49383 lt!34280)))

(assert (=> b!75607 (= lt!34280 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 lt!33882) (_1!1076 lt!33653)))))

(assert (=> b!75607 (isDefined!86 (getValueByKey!132 (toList!720 lt!33882) (_1!1076 lt!33653)))))

(declare-fun b!75608 () Bool)

(declare-fun Unit!2174 () Unit!2147)

(assert (=> b!75608 (= e!49383 Unit!2174)))

(declare-fun b!75609 () Bool)

(assert (=> b!75609 (= e!49384 (isDefined!86 (getValueByKey!132 (toList!720 lt!33882) (_1!1076 lt!33653))))))

(assert (= (and d!17973 c!11479) b!75607))

(assert (= (and d!17973 (not c!11479)) b!75608))

(assert (= (and d!17973 (not res!39877)) b!75609))

(declare-fun m!75245 () Bool)

(assert (=> d!17973 m!75245))

(declare-fun m!75247 () Bool)

(assert (=> b!75607 m!75247))

(assert (=> b!75607 m!74451))

(assert (=> b!75607 m!74451))

(declare-fun m!75249 () Bool)

(assert (=> b!75607 m!75249))

(assert (=> b!75609 m!74451))

(assert (=> b!75609 m!74451))

(assert (=> b!75609 m!75249))

(assert (=> d!17793 d!17973))

(declare-fun b!75613 () Bool)

(declare-fun e!49386 () Option!138)

(assert (=> b!75613 (= e!49386 None!136)))

(declare-fun b!75611 () Bool)

(declare-fun e!49385 () Option!138)

(assert (=> b!75611 (= e!49385 e!49386)))

(declare-fun c!11481 () Bool)

(assert (=> b!75611 (= c!11481 (and ((_ is Cons!1484) lt!33881) (not (= (_1!1076 (h!2072 lt!33881)) (_1!1076 lt!33653)))))))

(declare-fun b!75612 () Bool)

(assert (=> b!75612 (= e!49386 (getValueByKey!132 (t!5057 lt!33881) (_1!1076 lt!33653)))))

(declare-fun d!17975 () Bool)

(declare-fun c!11480 () Bool)

(assert (=> d!17975 (= c!11480 (and ((_ is Cons!1484) lt!33881) (= (_1!1076 (h!2072 lt!33881)) (_1!1076 lt!33653))))))

(assert (=> d!17975 (= (getValueByKey!132 lt!33881 (_1!1076 lt!33653)) e!49385)))

(declare-fun b!75610 () Bool)

(assert (=> b!75610 (= e!49385 (Some!137 (_2!1076 (h!2072 lt!33881))))))

(assert (= (and d!17975 c!11480) b!75610))

(assert (= (and d!17975 (not c!11480)) b!75611))

(assert (= (and b!75611 c!11481) b!75612))

(assert (= (and b!75611 (not c!11481)) b!75613))

(declare-fun m!75251 () Bool)

(assert (=> b!75612 m!75251))

(assert (=> d!17793 d!17975))

(declare-fun d!17977 () Bool)

(assert (=> d!17977 (= (getValueByKey!132 lt!33881 (_1!1076 lt!33653)) (Some!137 (_2!1076 lt!33653)))))

(declare-fun lt!34283 () Unit!2147)

(assert (=> d!17977 (= lt!34283 (choose!434 lt!33881 (_1!1076 lt!33653) (_2!1076 lt!33653)))))

(declare-fun e!49387 () Bool)

(assert (=> d!17977 e!49387))

(declare-fun res!39878 () Bool)

(assert (=> d!17977 (=> (not res!39878) (not e!49387))))

(assert (=> d!17977 (= res!39878 (isStrictlySorted!288 lt!33881))))

(assert (=> d!17977 (= (lemmaContainsTupThenGetReturnValue!52 lt!33881 (_1!1076 lt!33653) (_2!1076 lt!33653)) lt!34283)))

(declare-fun b!75614 () Bool)

(declare-fun res!39879 () Bool)

(assert (=> b!75614 (=> (not res!39879) (not e!49387))))

(assert (=> b!75614 (= res!39879 (containsKey!136 lt!33881 (_1!1076 lt!33653)))))

(declare-fun b!75615 () Bool)

(assert (=> b!75615 (= e!49387 (contains!725 lt!33881 (tuple2!2131 (_1!1076 lt!33653) (_2!1076 lt!33653))))))

(assert (= (and d!17977 res!39878) b!75614))

(assert (= (and b!75614 res!39879) b!75615))

(assert (=> d!17977 m!74445))

(declare-fun m!75253 () Bool)

(assert (=> d!17977 m!75253))

(declare-fun m!75255 () Bool)

(assert (=> d!17977 m!75255))

(declare-fun m!75257 () Bool)

(assert (=> b!75614 m!75257))

(declare-fun m!75259 () Bool)

(assert (=> b!75615 m!75259))

(assert (=> d!17793 d!17977))

(declare-fun call!6772 () List!1488)

(declare-fun e!49392 () List!1488)

(declare-fun c!11482 () Bool)

(declare-fun bm!6767 () Bool)

(assert (=> bm!6767 (= call!6772 ($colon$colon!66 e!49392 (ite c!11482 (h!2072 (toList!720 lt!33649)) (tuple2!2131 (_1!1076 lt!33653) (_2!1076 lt!33653)))))))

(declare-fun c!11484 () Bool)

(assert (=> bm!6767 (= c!11484 c!11482)))

(declare-fun bm!6768 () Bool)

(declare-fun call!6771 () List!1488)

(assert (=> bm!6768 (= call!6771 call!6772)))

(declare-fun c!11485 () Bool)

(declare-fun c!11483 () Bool)

(declare-fun b!75616 () Bool)

(assert (=> b!75616 (= e!49392 (ite c!11485 (t!5057 (toList!720 lt!33649)) (ite c!11483 (Cons!1484 (h!2072 (toList!720 lt!33649)) (t!5057 (toList!720 lt!33649))) Nil!1485)))))

(declare-fun b!75617 () Bool)

(declare-fun e!49390 () List!1488)

(assert (=> b!75617 (= e!49390 call!6771)))

(declare-fun b!75618 () Bool)

(declare-fun e!49391 () List!1488)

(assert (=> b!75618 (= e!49391 e!49390)))

(assert (=> b!75618 (= c!11485 (and ((_ is Cons!1484) (toList!720 lt!33649)) (= (_1!1076 (h!2072 (toList!720 lt!33649))) (_1!1076 lt!33653))))))

(declare-fun b!75619 () Bool)

(assert (=> b!75619 (= e!49392 (insertStrictlySorted!55 (t!5057 (toList!720 lt!33649)) (_1!1076 lt!33653) (_2!1076 lt!33653)))))

(declare-fun d!17979 () Bool)

(declare-fun e!49388 () Bool)

(assert (=> d!17979 e!49388))

(declare-fun res!39880 () Bool)

(assert (=> d!17979 (=> (not res!39880) (not e!49388))))

(declare-fun lt!34284 () List!1488)

(assert (=> d!17979 (= res!39880 (isStrictlySorted!288 lt!34284))))

(assert (=> d!17979 (= lt!34284 e!49391)))

(assert (=> d!17979 (= c!11482 (and ((_ is Cons!1484) (toList!720 lt!33649)) (bvslt (_1!1076 (h!2072 (toList!720 lt!33649))) (_1!1076 lt!33653))))))

(assert (=> d!17979 (isStrictlySorted!288 (toList!720 lt!33649))))

(assert (=> d!17979 (= (insertStrictlySorted!55 (toList!720 lt!33649) (_1!1076 lt!33653) (_2!1076 lt!33653)) lt!34284)))

(declare-fun b!75620 () Bool)

(declare-fun res!39881 () Bool)

(assert (=> b!75620 (=> (not res!39881) (not e!49388))))

(assert (=> b!75620 (= res!39881 (containsKey!136 lt!34284 (_1!1076 lt!33653)))))

(declare-fun b!75621 () Bool)

(assert (=> b!75621 (= c!11483 (and ((_ is Cons!1484) (toList!720 lt!33649)) (bvsgt (_1!1076 (h!2072 (toList!720 lt!33649))) (_1!1076 lt!33653))))))

(declare-fun e!49389 () List!1488)

(assert (=> b!75621 (= e!49390 e!49389)))

(declare-fun b!75622 () Bool)

(declare-fun call!6770 () List!1488)

(assert (=> b!75622 (= e!49389 call!6770)))

(declare-fun b!75623 () Bool)

(assert (=> b!75623 (= e!49389 call!6770)))

(declare-fun b!75624 () Bool)

(assert (=> b!75624 (= e!49391 call!6772)))

(declare-fun b!75625 () Bool)

(assert (=> b!75625 (= e!49388 (contains!725 lt!34284 (tuple2!2131 (_1!1076 lt!33653) (_2!1076 lt!33653))))))

(declare-fun bm!6769 () Bool)

(assert (=> bm!6769 (= call!6770 call!6771)))

(assert (= (and d!17979 c!11482) b!75624))

(assert (= (and d!17979 (not c!11482)) b!75618))

(assert (= (and b!75618 c!11485) b!75617))

(assert (= (and b!75618 (not c!11485)) b!75621))

(assert (= (and b!75621 c!11483) b!75622))

(assert (= (and b!75621 (not c!11483)) b!75623))

(assert (= (or b!75622 b!75623) bm!6769))

(assert (= (or b!75617 bm!6769) bm!6768))

(assert (= (or b!75624 bm!6768) bm!6767))

(assert (= (and bm!6767 c!11484) b!75619))

(assert (= (and bm!6767 (not c!11484)) b!75616))

(assert (= (and d!17979 res!39880) b!75620))

(assert (= (and b!75620 res!39881) b!75625))

(declare-fun m!75261 () Bool)

(assert (=> b!75625 m!75261))

(declare-fun m!75263 () Bool)

(assert (=> bm!6767 m!75263))

(declare-fun m!75265 () Bool)

(assert (=> d!17979 m!75265))

(declare-fun m!75267 () Bool)

(assert (=> d!17979 m!75267))

(declare-fun m!75269 () Bool)

(assert (=> b!75620 m!75269))

(declare-fun m!75271 () Bool)

(assert (=> b!75619 m!75271))

(assert (=> d!17793 d!17979))

(declare-fun d!17981 () Bool)

(declare-fun e!49394 () Bool)

(assert (=> d!17981 e!49394))

(declare-fun res!39882 () Bool)

(assert (=> d!17981 (=> res!39882 e!49394)))

(declare-fun lt!34288 () Bool)

(assert (=> d!17981 (= res!39882 (not lt!34288))))

(declare-fun lt!34287 () Bool)

(assert (=> d!17981 (= lt!34288 lt!34287)))

(declare-fun lt!34285 () Unit!2147)

(declare-fun e!49393 () Unit!2147)

(assert (=> d!17981 (= lt!34285 e!49393)))

(declare-fun c!11486 () Bool)

(assert (=> d!17981 (= c!11486 lt!34287)))

(assert (=> d!17981 (= lt!34287 (containsKey!136 (toList!720 lt!33886) (_1!1076 lt!33648)))))

(assert (=> d!17981 (= (contains!723 lt!33886 (_1!1076 lt!33648)) lt!34288)))

(declare-fun b!75626 () Bool)

(declare-fun lt!34286 () Unit!2147)

(assert (=> b!75626 (= e!49393 lt!34286)))

(assert (=> b!75626 (= lt!34286 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 lt!33886) (_1!1076 lt!33648)))))

(assert (=> b!75626 (isDefined!86 (getValueByKey!132 (toList!720 lt!33886) (_1!1076 lt!33648)))))

(declare-fun b!75627 () Bool)

(declare-fun Unit!2175 () Unit!2147)

(assert (=> b!75627 (= e!49393 Unit!2175)))

(declare-fun b!75628 () Bool)

(assert (=> b!75628 (= e!49394 (isDefined!86 (getValueByKey!132 (toList!720 lt!33886) (_1!1076 lt!33648))))))

(assert (= (and d!17981 c!11486) b!75626))

(assert (= (and d!17981 (not c!11486)) b!75627))

(assert (= (and d!17981 (not res!39882)) b!75628))

(declare-fun m!75273 () Bool)

(assert (=> d!17981 m!75273))

(declare-fun m!75275 () Bool)

(assert (=> b!75626 m!75275))

(assert (=> b!75626 m!74463))

(assert (=> b!75626 m!74463))

(declare-fun m!75277 () Bool)

(assert (=> b!75626 m!75277))

(assert (=> b!75628 m!74463))

(assert (=> b!75628 m!74463))

(assert (=> b!75628 m!75277))

(assert (=> d!17795 d!17981))

(declare-fun b!75632 () Bool)

(declare-fun e!49396 () Option!138)

(assert (=> b!75632 (= e!49396 None!136)))

(declare-fun b!75630 () Bool)

(declare-fun e!49395 () Option!138)

(assert (=> b!75630 (= e!49395 e!49396)))

(declare-fun c!11488 () Bool)

(assert (=> b!75630 (= c!11488 (and ((_ is Cons!1484) lt!33885) (not (= (_1!1076 (h!2072 lt!33885)) (_1!1076 lt!33648)))))))

(declare-fun b!75631 () Bool)

(assert (=> b!75631 (= e!49396 (getValueByKey!132 (t!5057 lt!33885) (_1!1076 lt!33648)))))

(declare-fun d!17983 () Bool)

(declare-fun c!11487 () Bool)

(assert (=> d!17983 (= c!11487 (and ((_ is Cons!1484) lt!33885) (= (_1!1076 (h!2072 lt!33885)) (_1!1076 lt!33648))))))

(assert (=> d!17983 (= (getValueByKey!132 lt!33885 (_1!1076 lt!33648)) e!49395)))

(declare-fun b!75629 () Bool)

(assert (=> b!75629 (= e!49395 (Some!137 (_2!1076 (h!2072 lt!33885))))))

(assert (= (and d!17983 c!11487) b!75629))

(assert (= (and d!17983 (not c!11487)) b!75630))

(assert (= (and b!75630 c!11488) b!75631))

(assert (= (and b!75630 (not c!11488)) b!75632))

(declare-fun m!75279 () Bool)

(assert (=> b!75631 m!75279))

(assert (=> d!17795 d!17983))

(declare-fun d!17985 () Bool)

(assert (=> d!17985 (= (getValueByKey!132 lt!33885 (_1!1076 lt!33648)) (Some!137 (_2!1076 lt!33648)))))

(declare-fun lt!34289 () Unit!2147)

(assert (=> d!17985 (= lt!34289 (choose!434 lt!33885 (_1!1076 lt!33648) (_2!1076 lt!33648)))))

(declare-fun e!49397 () Bool)

(assert (=> d!17985 e!49397))

(declare-fun res!39883 () Bool)

(assert (=> d!17985 (=> (not res!39883) (not e!49397))))

(assert (=> d!17985 (= res!39883 (isStrictlySorted!288 lt!33885))))

(assert (=> d!17985 (= (lemmaContainsTupThenGetReturnValue!52 lt!33885 (_1!1076 lt!33648) (_2!1076 lt!33648)) lt!34289)))

(declare-fun b!75633 () Bool)

(declare-fun res!39884 () Bool)

(assert (=> b!75633 (=> (not res!39884) (not e!49397))))

(assert (=> b!75633 (= res!39884 (containsKey!136 lt!33885 (_1!1076 lt!33648)))))

(declare-fun b!75634 () Bool)

(assert (=> b!75634 (= e!49397 (contains!725 lt!33885 (tuple2!2131 (_1!1076 lt!33648) (_2!1076 lt!33648))))))

(assert (= (and d!17985 res!39883) b!75633))

(assert (= (and b!75633 res!39884) b!75634))

(assert (=> d!17985 m!74457))

(declare-fun m!75281 () Bool)

(assert (=> d!17985 m!75281))

(declare-fun m!75283 () Bool)

(assert (=> d!17985 m!75283))

(declare-fun m!75285 () Bool)

(assert (=> b!75633 m!75285))

(declare-fun m!75287 () Bool)

(assert (=> b!75634 m!75287))

(assert (=> d!17795 d!17985))

(declare-fun e!49402 () List!1488)

(declare-fun call!6775 () List!1488)

(declare-fun c!11489 () Bool)

(declare-fun bm!6770 () Bool)

(assert (=> bm!6770 (= call!6775 ($colon$colon!66 e!49402 (ite c!11489 (h!2072 (toList!720 lt!33649)) (tuple2!2131 (_1!1076 lt!33648) (_2!1076 lt!33648)))))))

(declare-fun c!11491 () Bool)

(assert (=> bm!6770 (= c!11491 c!11489)))

(declare-fun bm!6771 () Bool)

(declare-fun call!6774 () List!1488)

(assert (=> bm!6771 (= call!6774 call!6775)))

(declare-fun b!75635 () Bool)

(declare-fun c!11492 () Bool)

(declare-fun c!11490 () Bool)

(assert (=> b!75635 (= e!49402 (ite c!11492 (t!5057 (toList!720 lt!33649)) (ite c!11490 (Cons!1484 (h!2072 (toList!720 lt!33649)) (t!5057 (toList!720 lt!33649))) Nil!1485)))))

(declare-fun b!75636 () Bool)

(declare-fun e!49400 () List!1488)

(assert (=> b!75636 (= e!49400 call!6774)))

(declare-fun b!75637 () Bool)

(declare-fun e!49401 () List!1488)

(assert (=> b!75637 (= e!49401 e!49400)))

(assert (=> b!75637 (= c!11492 (and ((_ is Cons!1484) (toList!720 lt!33649)) (= (_1!1076 (h!2072 (toList!720 lt!33649))) (_1!1076 lt!33648))))))

(declare-fun b!75638 () Bool)

(assert (=> b!75638 (= e!49402 (insertStrictlySorted!55 (t!5057 (toList!720 lt!33649)) (_1!1076 lt!33648) (_2!1076 lt!33648)))))

(declare-fun d!17987 () Bool)

(declare-fun e!49398 () Bool)

(assert (=> d!17987 e!49398))

(declare-fun res!39885 () Bool)

(assert (=> d!17987 (=> (not res!39885) (not e!49398))))

(declare-fun lt!34290 () List!1488)

(assert (=> d!17987 (= res!39885 (isStrictlySorted!288 lt!34290))))

(assert (=> d!17987 (= lt!34290 e!49401)))

(assert (=> d!17987 (= c!11489 (and ((_ is Cons!1484) (toList!720 lt!33649)) (bvslt (_1!1076 (h!2072 (toList!720 lt!33649))) (_1!1076 lt!33648))))))

(assert (=> d!17987 (isStrictlySorted!288 (toList!720 lt!33649))))

(assert (=> d!17987 (= (insertStrictlySorted!55 (toList!720 lt!33649) (_1!1076 lt!33648) (_2!1076 lt!33648)) lt!34290)))

(declare-fun b!75639 () Bool)

(declare-fun res!39886 () Bool)

(assert (=> b!75639 (=> (not res!39886) (not e!49398))))

(assert (=> b!75639 (= res!39886 (containsKey!136 lt!34290 (_1!1076 lt!33648)))))

(declare-fun b!75640 () Bool)

(assert (=> b!75640 (= c!11490 (and ((_ is Cons!1484) (toList!720 lt!33649)) (bvsgt (_1!1076 (h!2072 (toList!720 lt!33649))) (_1!1076 lt!33648))))))

(declare-fun e!49399 () List!1488)

(assert (=> b!75640 (= e!49400 e!49399)))

(declare-fun b!75641 () Bool)

(declare-fun call!6773 () List!1488)

(assert (=> b!75641 (= e!49399 call!6773)))

(declare-fun b!75642 () Bool)

(assert (=> b!75642 (= e!49399 call!6773)))

(declare-fun b!75643 () Bool)

(assert (=> b!75643 (= e!49401 call!6775)))

(declare-fun b!75644 () Bool)

(assert (=> b!75644 (= e!49398 (contains!725 lt!34290 (tuple2!2131 (_1!1076 lt!33648) (_2!1076 lt!33648))))))

(declare-fun bm!6772 () Bool)

(assert (=> bm!6772 (= call!6773 call!6774)))

(assert (= (and d!17987 c!11489) b!75643))

(assert (= (and d!17987 (not c!11489)) b!75637))

(assert (= (and b!75637 c!11492) b!75636))

(assert (= (and b!75637 (not c!11492)) b!75640))

(assert (= (and b!75640 c!11490) b!75641))

(assert (= (and b!75640 (not c!11490)) b!75642))

(assert (= (or b!75641 b!75642) bm!6772))

(assert (= (or b!75636 bm!6772) bm!6771))

(assert (= (or b!75643 bm!6771) bm!6770))

(assert (= (and bm!6770 c!11491) b!75638))

(assert (= (and bm!6770 (not c!11491)) b!75635))

(assert (= (and d!17987 res!39885) b!75639))

(assert (= (and b!75639 res!39886) b!75644))

(declare-fun m!75289 () Bool)

(assert (=> b!75644 m!75289))

(declare-fun m!75291 () Bool)

(assert (=> bm!6770 m!75291))

(declare-fun m!75293 () Bool)

(assert (=> d!17987 m!75293))

(assert (=> d!17987 m!75267))

(declare-fun m!75295 () Bool)

(assert (=> b!75639 m!75295))

(declare-fun m!75297 () Bool)

(assert (=> b!75638 m!75297))

(assert (=> d!17795 d!17987))

(declare-fun d!17989 () Bool)

(declare-fun e!49404 () Bool)

(assert (=> d!17989 e!49404))

(declare-fun res!39887 () Bool)

(assert (=> d!17989 (=> res!39887 e!49404)))

(declare-fun lt!34294 () Bool)

(assert (=> d!17989 (= res!39887 (not lt!34294))))

(declare-fun lt!34293 () Bool)

(assert (=> d!17989 (= lt!34294 lt!34293)))

(declare-fun lt!34291 () Unit!2147)

(declare-fun e!49403 () Unit!2147)

(assert (=> d!17989 (= lt!34291 e!49403)))

(declare-fun c!11493 () Bool)

(assert (=> d!17989 (= c!11493 lt!34293)))

(assert (=> d!17989 (= lt!34293 (containsKey!136 (toList!720 lt!33871) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17989 (= (contains!723 lt!33871 #b1000000000000000000000000000000000000000000000000000000000000000) lt!34294)))

(declare-fun b!75645 () Bool)

(declare-fun lt!34292 () Unit!2147)

(assert (=> b!75645 (= e!49403 lt!34292)))

(assert (=> b!75645 (= lt!34292 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 lt!33871) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75645 (isDefined!86 (getValueByKey!132 (toList!720 lt!33871) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75646 () Bool)

(declare-fun Unit!2176 () Unit!2147)

(assert (=> b!75646 (= e!49403 Unit!2176)))

(declare-fun b!75647 () Bool)

(assert (=> b!75647 (= e!49404 (isDefined!86 (getValueByKey!132 (toList!720 lt!33871) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17989 c!11493) b!75645))

(assert (= (and d!17989 (not c!11493)) b!75646))

(assert (= (and d!17989 (not res!39887)) b!75647))

(declare-fun m!75299 () Bool)

(assert (=> d!17989 m!75299))

(declare-fun m!75301 () Bool)

(assert (=> b!75645 m!75301))

(declare-fun m!75303 () Bool)

(assert (=> b!75645 m!75303))

(assert (=> b!75645 m!75303))

(declare-fun m!75305 () Bool)

(assert (=> b!75645 m!75305))

(assert (=> b!75647 m!75303))

(assert (=> b!75647 m!75303))

(assert (=> b!75647 m!75305))

(assert (=> b!75165 d!17989))

(declare-fun d!17991 () Bool)

(declare-fun e!49407 () Bool)

(assert (=> d!17991 e!49407))

(declare-fun c!11496 () Bool)

(assert (=> d!17991 (= c!11496 (and (not (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!17991 true))

(declare-fun _$29!93 () Unit!2147)

(assert (=> d!17991 (= (choose!432 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (_values!2216 (v!2539 (underlying!259 thiss!992))) (mask!6209 (v!2539 (underlying!259 thiss!992))) (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) (zeroValue!2133 (v!2539 (underlying!259 thiss!992))) (minValue!2133 (v!2539 (underlying!259 thiss!992))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992)))) _$29!93)))

(declare-fun b!75652 () Bool)

(assert (=> b!75652 (= e!49407 (arrayContainsKey!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!75653 () Bool)

(assert (=> b!75653 (= e!49407 (ite (= (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2088 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!17991 c!11496) b!75652))

(assert (= (and d!17991 (not c!11496)) b!75653))

(assert (=> b!75652 m!74111))

(assert (=> b!75652 m!74125))

(assert (=> d!17775 d!17991))

(assert (=> d!17775 d!17797))

(declare-fun d!17993 () Bool)

(assert (=> d!17993 (= (map!1155 (_2!1077 lt!33835)) (getCurrentListMap!413 (_keys!3888 (_2!1077 lt!33835)) (_values!2216 (_2!1077 lt!33835)) (mask!6209 (_2!1077 lt!33835)) (extraKeys!2088 (_2!1077 lt!33835)) (zeroValue!2133 (_2!1077 lt!33835)) (minValue!2133 (_2!1077 lt!33835)) #b00000000000000000000000000000000 (defaultEntry!2233 (_2!1077 lt!33835))))))

(declare-fun bs!3242 () Bool)

(assert (= bs!3242 d!17993))

(declare-fun m!75307 () Bool)

(assert (=> bs!3242 m!75307))

(assert (=> bm!6691 d!17993))

(declare-fun d!17995 () Bool)

(declare-fun e!49409 () Bool)

(assert (=> d!17995 e!49409))

(declare-fun res!39888 () Bool)

(assert (=> d!17995 (=> res!39888 e!49409)))

(declare-fun lt!34298 () Bool)

(assert (=> d!17995 (= res!39888 (not lt!34298))))

(declare-fun lt!34297 () Bool)

(assert (=> d!17995 (= lt!34298 lt!34297)))

(declare-fun lt!34295 () Unit!2147)

(declare-fun e!49408 () Unit!2147)

(assert (=> d!17995 (= lt!34295 e!49408)))

(declare-fun c!11497 () Bool)

(assert (=> d!17995 (= c!11497 lt!34297)))

(assert (=> d!17995 (= lt!34297 (containsKey!136 (toList!720 lt!33943) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17995 (= (contains!723 lt!33943 #b0000000000000000000000000000000000000000000000000000000000000000) lt!34298)))

(declare-fun b!75654 () Bool)

(declare-fun lt!34296 () Unit!2147)

(assert (=> b!75654 (= e!49408 lt!34296)))

(assert (=> b!75654 (= lt!34296 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 lt!33943) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75654 (isDefined!86 (getValueByKey!132 (toList!720 lt!33943) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75655 () Bool)

(declare-fun Unit!2177 () Unit!2147)

(assert (=> b!75655 (= e!49408 Unit!2177)))

(declare-fun b!75656 () Bool)

(assert (=> b!75656 (= e!49409 (isDefined!86 (getValueByKey!132 (toList!720 lt!33943) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17995 c!11497) b!75654))

(assert (= (and d!17995 (not c!11497)) b!75655))

(assert (= (and d!17995 (not res!39888)) b!75656))

(declare-fun m!75309 () Bool)

(assert (=> d!17995 m!75309))

(declare-fun m!75311 () Bool)

(assert (=> b!75654 m!75311))

(assert (=> b!75654 m!74659))

(assert (=> b!75654 m!74659))

(declare-fun m!75313 () Bool)

(assert (=> b!75654 m!75313))

(assert (=> b!75656 m!74659))

(assert (=> b!75656 m!74659))

(assert (=> b!75656 m!75313))

(assert (=> bm!6713 d!17995))

(assert (=> d!17771 d!17777))

(declare-fun d!17997 () Bool)

(assert (=> d!17997 (arrayNoDuplicates!0 (_keys!3888 (v!2539 (underlying!259 thiss!992))) from!355 Nil!1486)))

(assert (=> d!17997 true))

(declare-fun _$71!99 () Unit!2147)

(assert (=> d!17997 (= (choose!39 (_keys!3888 (v!2539 (underlying!259 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!99)))

(declare-fun bs!3243 () Bool)

(assert (= bs!3243 d!17997))

(assert (=> bs!3243 m!74121))

(assert (=> d!17771 d!17997))

(assert (=> b!75095 d!17803))

(assert (=> b!75220 d!17843))

(declare-fun d!17999 () Bool)

(declare-fun res!39893 () Bool)

(declare-fun e!49414 () Bool)

(assert (=> d!17999 (=> res!39893 e!49414)))

(assert (=> d!17999 (= res!39893 (and ((_ is Cons!1484) (toList!720 lt!33652)) (= (_1!1076 (h!2072 (toList!720 lt!33652))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355))))))

(assert (=> d!17999 (= (containsKey!136 (toList!720 lt!33652) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)) e!49414)))

(declare-fun b!75661 () Bool)

(declare-fun e!49415 () Bool)

(assert (=> b!75661 (= e!49414 e!49415)))

(declare-fun res!39894 () Bool)

(assert (=> b!75661 (=> (not res!39894) (not e!49415))))

(assert (=> b!75661 (= res!39894 (and (or (not ((_ is Cons!1484) (toList!720 lt!33652))) (bvsle (_1!1076 (h!2072 (toList!720 lt!33652))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355))) ((_ is Cons!1484) (toList!720 lt!33652)) (bvslt (_1!1076 (h!2072 (toList!720 lt!33652))) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355))))))

(declare-fun b!75662 () Bool)

(assert (=> b!75662 (= e!49415 (containsKey!136 (t!5057 (toList!720 lt!33652)) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355)))))

(assert (= (and d!17999 (not res!39893)) b!75661))

(assert (= (and b!75661 res!39894) b!75662))

(assert (=> b!75662 m!74111))

(declare-fun m!75315 () Bool)

(assert (=> b!75662 m!75315))

(assert (=> d!17779 d!17999))

(declare-fun b!75671 () Bool)

(declare-fun e!49421 () (_ BitVec 32))

(declare-fun call!6778 () (_ BitVec 32))

(assert (=> b!75671 (= e!49421 (bvadd #b00000000000000000000000000000001 call!6778))))

(declare-fun bm!6775 () Bool)

(assert (=> bm!6775 (= call!6778 (arrayCountValidKeys!0 (_keys!3888 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2092 (_keys!3888 newMap!16))))))

(declare-fun b!75672 () Bool)

(assert (=> b!75672 (= e!49421 call!6778)))

(declare-fun b!75673 () Bool)

(declare-fun e!49420 () (_ BitVec 32))

(assert (=> b!75673 (= e!49420 #b00000000000000000000000000000000)))

(declare-fun d!18001 () Bool)

(declare-fun lt!34301 () (_ BitVec 32))

(assert (=> d!18001 (and (bvsge lt!34301 #b00000000000000000000000000000000) (bvsle lt!34301 (bvsub (size!2092 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!18001 (= lt!34301 e!49420)))

(declare-fun c!11502 () Bool)

(assert (=> d!18001 (= c!11502 (bvsge #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))))))

(assert (=> d!18001 (and (bvsle #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2092 (_keys!3888 newMap!16)) (size!2092 (_keys!3888 newMap!16))))))

(assert (=> d!18001 (= (arrayCountValidKeys!0 (_keys!3888 newMap!16) #b00000000000000000000000000000000 (size!2092 (_keys!3888 newMap!16))) lt!34301)))

(declare-fun b!75674 () Bool)

(assert (=> b!75674 (= e!49420 e!49421)))

(declare-fun c!11503 () Bool)

(assert (=> b!75674 (= c!11503 (validKeyInArray!0 (select (arr!1852 (_keys!3888 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!18001 c!11502) b!75673))

(assert (= (and d!18001 (not c!11502)) b!75674))

(assert (= (and b!75674 c!11503) b!75671))

(assert (= (and b!75674 (not c!11503)) b!75672))

(assert (= (or b!75671 b!75672) bm!6775))

(declare-fun m!75317 () Bool)

(assert (=> bm!6775 m!75317))

(assert (=> b!75674 m!74523))

(assert (=> b!75674 m!74523))

(assert (=> b!75674 m!74567))

(assert (=> b!74939 d!18001))

(declare-fun d!18003 () Bool)

(declare-fun e!49423 () Bool)

(assert (=> d!18003 e!49423))

(declare-fun res!39895 () Bool)

(assert (=> d!18003 (=> res!39895 e!49423)))

(declare-fun lt!34305 () Bool)

(assert (=> d!18003 (= res!39895 (not lt!34305))))

(declare-fun lt!34304 () Bool)

(assert (=> d!18003 (= lt!34305 lt!34304)))

(declare-fun lt!34302 () Unit!2147)

(declare-fun e!49422 () Unit!2147)

(assert (=> d!18003 (= lt!34302 e!49422)))

(declare-fun c!11504 () Bool)

(assert (=> d!18003 (= c!11504 lt!34304)))

(assert (=> d!18003 (= lt!34304 (containsKey!136 (toList!720 lt!33850) (_1!1076 lt!33648)))))

(assert (=> d!18003 (= (contains!723 lt!33850 (_1!1076 lt!33648)) lt!34305)))

(declare-fun b!75675 () Bool)

(declare-fun lt!34303 () Unit!2147)

(assert (=> b!75675 (= e!49422 lt!34303)))

(assert (=> b!75675 (= lt!34303 (lemmaContainsKeyImpliesGetValueByKeyDefined!85 (toList!720 lt!33850) (_1!1076 lt!33648)))))

(assert (=> b!75675 (isDefined!86 (getValueByKey!132 (toList!720 lt!33850) (_1!1076 lt!33648)))))

(declare-fun b!75676 () Bool)

(declare-fun Unit!2178 () Unit!2147)

(assert (=> b!75676 (= e!49422 Unit!2178)))

(declare-fun b!75677 () Bool)

(assert (=> b!75677 (= e!49423 (isDefined!86 (getValueByKey!132 (toList!720 lt!33850) (_1!1076 lt!33648))))))

(assert (= (and d!18003 c!11504) b!75675))

(assert (= (and d!18003 (not c!11504)) b!75676))

(assert (= (and d!18003 (not res!39895)) b!75677))

(declare-fun m!75319 () Bool)

(assert (=> d!18003 m!75319))

(declare-fun m!75321 () Bool)

(assert (=> b!75675 m!75321))

(assert (=> b!75675 m!74391))

(assert (=> b!75675 m!74391))

(declare-fun m!75323 () Bool)

(assert (=> b!75675 m!75323))

(assert (=> b!75677 m!74391))

(assert (=> b!75677 m!74391))

(assert (=> b!75677 m!75323))

(assert (=> d!17785 d!18003))

(declare-fun b!75681 () Bool)

(declare-fun e!49425 () Option!138)

(assert (=> b!75681 (= e!49425 None!136)))

(declare-fun b!75679 () Bool)

(declare-fun e!49424 () Option!138)

(assert (=> b!75679 (= e!49424 e!49425)))

(declare-fun c!11506 () Bool)

(assert (=> b!75679 (= c!11506 (and ((_ is Cons!1484) lt!33849) (not (= (_1!1076 (h!2072 lt!33849)) (_1!1076 lt!33648)))))))

(declare-fun b!75680 () Bool)

(assert (=> b!75680 (= e!49425 (getValueByKey!132 (t!5057 lt!33849) (_1!1076 lt!33648)))))

(declare-fun d!18005 () Bool)

(declare-fun c!11505 () Bool)

(assert (=> d!18005 (= c!11505 (and ((_ is Cons!1484) lt!33849) (= (_1!1076 (h!2072 lt!33849)) (_1!1076 lt!33648))))))

(assert (=> d!18005 (= (getValueByKey!132 lt!33849 (_1!1076 lt!33648)) e!49424)))

(declare-fun b!75678 () Bool)

(assert (=> b!75678 (= e!49424 (Some!137 (_2!1076 (h!2072 lt!33849))))))

(assert (= (and d!18005 c!11505) b!75678))

(assert (= (and d!18005 (not c!11505)) b!75679))

(assert (= (and b!75679 c!11506) b!75680))

(assert (= (and b!75679 (not c!11506)) b!75681))

(declare-fun m!75325 () Bool)

(assert (=> b!75680 m!75325))

(assert (=> d!17785 d!18005))

(declare-fun d!18007 () Bool)

(assert (=> d!18007 (= (getValueByKey!132 lt!33849 (_1!1076 lt!33648)) (Some!137 (_2!1076 lt!33648)))))

(declare-fun lt!34306 () Unit!2147)

(assert (=> d!18007 (= lt!34306 (choose!434 lt!33849 (_1!1076 lt!33648) (_2!1076 lt!33648)))))

(declare-fun e!49426 () Bool)

(assert (=> d!18007 e!49426))

(declare-fun res!39896 () Bool)

(assert (=> d!18007 (=> (not res!39896) (not e!49426))))

(assert (=> d!18007 (= res!39896 (isStrictlySorted!288 lt!33849))))

(assert (=> d!18007 (= (lemmaContainsTupThenGetReturnValue!52 lt!33849 (_1!1076 lt!33648) (_2!1076 lt!33648)) lt!34306)))

(declare-fun b!75682 () Bool)

(declare-fun res!39897 () Bool)

(assert (=> b!75682 (=> (not res!39897) (not e!49426))))

(assert (=> b!75682 (= res!39897 (containsKey!136 lt!33849 (_1!1076 lt!33648)))))

(declare-fun b!75683 () Bool)

(assert (=> b!75683 (= e!49426 (contains!725 lt!33849 (tuple2!2131 (_1!1076 lt!33648) (_2!1076 lt!33648))))))

(assert (= (and d!18007 res!39896) b!75682))

(assert (= (and b!75682 res!39897) b!75683))

(assert (=> d!18007 m!74385))

(declare-fun m!75327 () Bool)

(assert (=> d!18007 m!75327))

(declare-fun m!75329 () Bool)

(assert (=> d!18007 m!75329))

(declare-fun m!75331 () Bool)

(assert (=> b!75682 m!75331))

(declare-fun m!75333 () Bool)

(assert (=> b!75683 m!75333))

(assert (=> d!17785 d!18007))

(declare-fun call!6781 () List!1488)

(declare-fun bm!6776 () Bool)

(declare-fun c!11507 () Bool)

(declare-fun e!49431 () List!1488)

(assert (=> bm!6776 (= call!6781 ($colon$colon!66 e!49431 (ite c!11507 (h!2072 (toList!720 (+!95 lt!33649 lt!33653))) (tuple2!2131 (_1!1076 lt!33648) (_2!1076 lt!33648)))))))

(declare-fun c!11509 () Bool)

(assert (=> bm!6776 (= c!11509 c!11507)))

(declare-fun bm!6777 () Bool)

(declare-fun call!6780 () List!1488)

(assert (=> bm!6777 (= call!6780 call!6781)))

(declare-fun c!11510 () Bool)

(declare-fun c!11508 () Bool)

(declare-fun b!75684 () Bool)

(assert (=> b!75684 (= e!49431 (ite c!11510 (t!5057 (toList!720 (+!95 lt!33649 lt!33653))) (ite c!11508 (Cons!1484 (h!2072 (toList!720 (+!95 lt!33649 lt!33653))) (t!5057 (toList!720 (+!95 lt!33649 lt!33653)))) Nil!1485)))))

(declare-fun b!75685 () Bool)

(declare-fun e!49429 () List!1488)

(assert (=> b!75685 (= e!49429 call!6780)))

(declare-fun b!75686 () Bool)

(declare-fun e!49430 () List!1488)

(assert (=> b!75686 (= e!49430 e!49429)))

(assert (=> b!75686 (= c!11510 (and ((_ is Cons!1484) (toList!720 (+!95 lt!33649 lt!33653))) (= (_1!1076 (h!2072 (toList!720 (+!95 lt!33649 lt!33653)))) (_1!1076 lt!33648))))))

(declare-fun b!75687 () Bool)

(assert (=> b!75687 (= e!49431 (insertStrictlySorted!55 (t!5057 (toList!720 (+!95 lt!33649 lt!33653))) (_1!1076 lt!33648) (_2!1076 lt!33648)))))

(declare-fun d!18009 () Bool)

(declare-fun e!49427 () Bool)

(assert (=> d!18009 e!49427))

(declare-fun res!39898 () Bool)

(assert (=> d!18009 (=> (not res!39898) (not e!49427))))

(declare-fun lt!34307 () List!1488)

(assert (=> d!18009 (= res!39898 (isStrictlySorted!288 lt!34307))))

(assert (=> d!18009 (= lt!34307 e!49430)))

(assert (=> d!18009 (= c!11507 (and ((_ is Cons!1484) (toList!720 (+!95 lt!33649 lt!33653))) (bvslt (_1!1076 (h!2072 (toList!720 (+!95 lt!33649 lt!33653)))) (_1!1076 lt!33648))))))

(assert (=> d!18009 (isStrictlySorted!288 (toList!720 (+!95 lt!33649 lt!33653)))))

(assert (=> d!18009 (= (insertStrictlySorted!55 (toList!720 (+!95 lt!33649 lt!33653)) (_1!1076 lt!33648) (_2!1076 lt!33648)) lt!34307)))

(declare-fun b!75688 () Bool)

(declare-fun res!39899 () Bool)

(assert (=> b!75688 (=> (not res!39899) (not e!49427))))

(assert (=> b!75688 (= res!39899 (containsKey!136 lt!34307 (_1!1076 lt!33648)))))

(declare-fun b!75689 () Bool)

(assert (=> b!75689 (= c!11508 (and ((_ is Cons!1484) (toList!720 (+!95 lt!33649 lt!33653))) (bvsgt (_1!1076 (h!2072 (toList!720 (+!95 lt!33649 lt!33653)))) (_1!1076 lt!33648))))))

(declare-fun e!49428 () List!1488)

(assert (=> b!75689 (= e!49429 e!49428)))

(declare-fun b!75690 () Bool)

(declare-fun call!6779 () List!1488)

(assert (=> b!75690 (= e!49428 call!6779)))

(declare-fun b!75691 () Bool)

(assert (=> b!75691 (= e!49428 call!6779)))

(declare-fun b!75692 () Bool)

(assert (=> b!75692 (= e!49430 call!6781)))

(declare-fun b!75693 () Bool)

(assert (=> b!75693 (= e!49427 (contains!725 lt!34307 (tuple2!2131 (_1!1076 lt!33648) (_2!1076 lt!33648))))))

(declare-fun bm!6778 () Bool)

(assert (=> bm!6778 (= call!6779 call!6780)))

(assert (= (and d!18009 c!11507) b!75692))

(assert (= (and d!18009 (not c!11507)) b!75686))

(assert (= (and b!75686 c!11510) b!75685))

(assert (= (and b!75686 (not c!11510)) b!75689))

(assert (= (and b!75689 c!11508) b!75690))

(assert (= (and b!75689 (not c!11508)) b!75691))

(assert (= (or b!75690 b!75691) bm!6778))

(assert (= (or b!75685 bm!6778) bm!6777))

(assert (= (or b!75692 bm!6777) bm!6776))

(assert (= (and bm!6776 c!11509) b!75687))

(assert (= (and bm!6776 (not c!11509)) b!75684))

(assert (= (and d!18009 res!39898) b!75688))

(assert (= (and b!75688 res!39899) b!75693))

(declare-fun m!75335 () Bool)

(assert (=> b!75693 m!75335))

(declare-fun m!75337 () Bool)

(assert (=> bm!6776 m!75337))

(declare-fun m!75339 () Bool)

(assert (=> d!18009 m!75339))

(declare-fun m!75341 () Bool)

(assert (=> d!18009 m!75341))

(declare-fun m!75343 () Bool)

(assert (=> b!75688 m!75343))

(declare-fun m!75345 () Bool)

(assert (=> b!75687 m!75345))

(assert (=> d!17785 d!18009))

(declare-fun b!75710 () Bool)

(declare-fun e!49443 () Bool)

(declare-fun e!49442 () Bool)

(assert (=> b!75710 (= e!49443 e!49442)))

(declare-fun c!11516 () Bool)

(declare-fun lt!34313 () SeekEntryResult!240)

(assert (=> b!75710 (= c!11516 ((_ is MissingVacant!240) lt!34313))))

(declare-fun b!75711 () Bool)

(assert (=> b!75711 (and (bvsge (index!3092 lt!34313) #b00000000000000000000000000000000) (bvslt (index!3092 lt!34313) (size!2092 (_keys!3888 newMap!16))))))

(declare-fun res!39910 () Bool)

(assert (=> b!75711 (= res!39910 (= (select (arr!1852 (_keys!3888 newMap!16)) (index!3092 lt!34313)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49440 () Bool)

(assert (=> b!75711 (=> (not res!39910) (not e!49440))))

(declare-fun b!75712 () Bool)

(declare-fun res!39909 () Bool)

(declare-fun e!49441 () Bool)

(assert (=> b!75712 (=> (not res!39909) (not e!49441))))

(declare-fun call!6787 () Bool)

(assert (=> b!75712 (= res!39909 call!6787)))

(assert (=> b!75712 (= e!49442 e!49441)))

(declare-fun call!6786 () Bool)

(declare-fun bm!6783 () Bool)

(assert (=> bm!6783 (= call!6786 (arrayContainsKey!0 (_keys!3888 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!75713 () Bool)

(assert (=> b!75713 (= e!49441 (not call!6786))))

(declare-fun b!75714 () Bool)

(assert (=> b!75714 (= e!49440 (not call!6786))))

(declare-fun c!11515 () Bool)

(declare-fun bm!6784 () Bool)

(assert (=> bm!6784 (= call!6787 (inRange!0 (ite c!11515 (index!3092 lt!34313) (index!3095 lt!34313)) (mask!6209 newMap!16)))))

(declare-fun d!18011 () Bool)

(assert (=> d!18011 e!49443))

(assert (=> d!18011 (= c!11515 ((_ is MissingZero!240) lt!34313))))

(assert (=> d!18011 (= lt!34313 (seekEntryOrOpen!0 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (_keys!3888 newMap!16) (mask!6209 newMap!16)))))

(declare-fun lt!34312 () Unit!2147)

(declare-fun choose!443 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 64) Int) Unit!2147)

(assert (=> d!18011 (= lt!34312 (choose!443 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)))))

(assert (=> d!18011 (validMask!0 (mask!6209 newMap!16))))

(assert (=> d!18011 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!25 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)) lt!34312)))

(declare-fun b!75715 () Bool)

(assert (=> b!75715 (= e!49443 e!49440)))

(declare-fun res!39908 () Bool)

(assert (=> b!75715 (= res!39908 call!6787)))

(assert (=> b!75715 (=> (not res!39908) (not e!49440))))

(declare-fun b!75716 () Bool)

(declare-fun res!39911 () Bool)

(assert (=> b!75716 (=> (not res!39911) (not e!49441))))

(assert (=> b!75716 (= res!39911 (= (select (arr!1852 (_keys!3888 newMap!16)) (index!3095 lt!34313)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75716 (and (bvsge (index!3095 lt!34313) #b00000000000000000000000000000000) (bvslt (index!3095 lt!34313) (size!2092 (_keys!3888 newMap!16))))))

(declare-fun b!75717 () Bool)

(assert (=> b!75717 (= e!49442 ((_ is Undefined!240) lt!34313))))

(assert (= (and d!18011 c!11515) b!75715))

(assert (= (and d!18011 (not c!11515)) b!75710))

(assert (= (and b!75715 res!39908) b!75711))

(assert (= (and b!75711 res!39910) b!75714))

(assert (= (and b!75710 c!11516) b!75712))

(assert (= (and b!75710 (not c!11516)) b!75717))

(assert (= (and b!75712 res!39909) b!75716))

(assert (= (and b!75716 res!39911) b!75713))

(assert (= (or b!75715 b!75712) bm!6784))

(assert (= (or b!75714 b!75713) bm!6783))

(assert (=> bm!6783 m!74111))

(assert (=> bm!6783 m!74345))

(declare-fun m!75347 () Bool)

(assert (=> b!75716 m!75347))

(declare-fun m!75349 () Bool)

(assert (=> bm!6784 m!75349))

(assert (=> d!18011 m!74111))

(assert (=> d!18011 m!74347))

(assert (=> d!18011 m!74111))

(declare-fun m!75351 () Bool)

(assert (=> d!18011 m!75351))

(assert (=> d!18011 m!74529))

(declare-fun m!75353 () Bool)

(assert (=> b!75711 m!75353))

(assert (=> bm!6672 d!18011))

(declare-fun d!18013 () Bool)

(assert (=> d!18013 (= (+!95 (getCurrentListMap!413 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (tuple2!2131 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33657)) (getCurrentListMap!413 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) lt!33814 lt!33657 (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34316 () Unit!2147)

(declare-fun choose!444 (array!3885 array!3887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 V!2953 Int) Unit!2147)

(assert (=> d!18013 (= lt!34316 (choose!444 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) lt!33814 (zeroValue!2133 newMap!16) lt!33657 (minValue!2133 newMap!16) (defaultEntry!2233 newMap!16)))))

(assert (=> d!18013 (validMask!0 (mask!6209 newMap!16))))

(assert (=> d!18013 (= (lemmaChangeZeroKeyThenAddPairToListMap!25 (_keys!3888 newMap!16) (_values!2216 newMap!16) (mask!6209 newMap!16) (extraKeys!2088 newMap!16) lt!33814 (zeroValue!2133 newMap!16) lt!33657 (minValue!2133 newMap!16) (defaultEntry!2233 newMap!16)) lt!34316)))

(declare-fun bs!3244 () Bool)

(assert (= bs!3244 d!18013))

(assert (=> bs!3244 m!74351))

(declare-fun m!75355 () Bool)

(assert (=> bs!3244 m!75355))

(declare-fun m!75357 () Bool)

(assert (=> bs!3244 m!75357))

(assert (=> bs!3244 m!74529))

(assert (=> bs!3244 m!74351))

(declare-fun m!75359 () Bool)

(assert (=> bs!3244 m!75359))

(assert (=> b!75105 d!18013))

(assert (=> b!74970 d!17773))

(declare-fun d!18015 () Bool)

(assert (=> d!18015 (= (apply!76 lt!33943 (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1153 (getValueByKey!132 (toList!720 lt!33943) (select (arr!1852 (_keys!3888 (v!2539 (underlying!259 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3245 () Bool)

(assert (= bs!3245 d!18015))

(assert (=> bs!3245 m!74305))

(assert (=> bs!3245 m!75151))

(assert (=> bs!3245 m!75151))

(declare-fun m!75361 () Bool)

(assert (=> bs!3245 m!75361))

(assert (=> b!75222 d!18015))

(assert (=> b!75222 d!17923))

(declare-fun mapIsEmpty!3209 () Bool)

(declare-fun mapRes!3209 () Bool)

(assert (=> mapIsEmpty!3209 mapRes!3209))

(declare-fun b!75718 () Bool)

(declare-fun e!49444 () Bool)

(assert (=> b!75718 (= e!49444 tp_is_empty!2479)))

(declare-fun mapNonEmpty!3209 () Bool)

(declare-fun tp!8591 () Bool)

(assert (=> mapNonEmpty!3209 (= mapRes!3209 (and tp!8591 e!49444))))

(declare-fun mapValue!3209 () ValueCell!896)

(declare-fun mapKey!3209 () (_ BitVec 32))

(declare-fun mapRest!3209 () (Array (_ BitVec 32) ValueCell!896))

(assert (=> mapNonEmpty!3209 (= mapRest!3208 (store mapRest!3209 mapKey!3209 mapValue!3209))))

(declare-fun condMapEmpty!3209 () Bool)

(declare-fun mapDefault!3209 () ValueCell!896)

(assert (=> mapNonEmpty!3208 (= condMapEmpty!3209 (= mapRest!3208 ((as const (Array (_ BitVec 32) ValueCell!896)) mapDefault!3209)))))

(declare-fun e!49445 () Bool)

(assert (=> mapNonEmpty!3208 (= tp!8590 (and e!49445 mapRes!3209))))

(declare-fun b!75719 () Bool)

(assert (=> b!75719 (= e!49445 tp_is_empty!2479)))

(assert (= (and mapNonEmpty!3208 condMapEmpty!3209) mapIsEmpty!3209))

(assert (= (and mapNonEmpty!3208 (not condMapEmpty!3209)) mapNonEmpty!3209))

(assert (= (and mapNonEmpty!3209 ((_ is ValueCellFull!896) mapValue!3209)) b!75718))

(assert (= (and mapNonEmpty!3208 ((_ is ValueCellFull!896) mapDefault!3209)) b!75719))

(declare-fun m!75363 () Bool)

(assert (=> mapNonEmpty!3209 m!75363))

(declare-fun mapIsEmpty!3210 () Bool)

(declare-fun mapRes!3210 () Bool)

(assert (=> mapIsEmpty!3210 mapRes!3210))

(declare-fun b!75720 () Bool)

(declare-fun e!49446 () Bool)

(assert (=> b!75720 (= e!49446 tp_is_empty!2479)))

(declare-fun mapNonEmpty!3210 () Bool)

(declare-fun tp!8592 () Bool)

(assert (=> mapNonEmpty!3210 (= mapRes!3210 (and tp!8592 e!49446))))

(declare-fun mapKey!3210 () (_ BitVec 32))

(declare-fun mapRest!3210 () (Array (_ BitVec 32) ValueCell!896))

(declare-fun mapValue!3210 () ValueCell!896)

(assert (=> mapNonEmpty!3210 (= mapRest!3207 (store mapRest!3210 mapKey!3210 mapValue!3210))))

(declare-fun condMapEmpty!3210 () Bool)

(declare-fun mapDefault!3210 () ValueCell!896)

(assert (=> mapNonEmpty!3207 (= condMapEmpty!3210 (= mapRest!3207 ((as const (Array (_ BitVec 32) ValueCell!896)) mapDefault!3210)))))

(declare-fun e!49447 () Bool)

(assert (=> mapNonEmpty!3207 (= tp!8589 (and e!49447 mapRes!3210))))

(declare-fun b!75721 () Bool)

(assert (=> b!75721 (= e!49447 tp_is_empty!2479)))

(assert (= (and mapNonEmpty!3207 condMapEmpty!3210) mapIsEmpty!3210))

(assert (= (and mapNonEmpty!3207 (not condMapEmpty!3210)) mapNonEmpty!3210))

(assert (= (and mapNonEmpty!3210 ((_ is ValueCellFull!896) mapValue!3210)) b!75720))

(assert (= (and mapNonEmpty!3207 ((_ is ValueCellFull!896) mapDefault!3210)) b!75721))

(declare-fun m!75365 () Bool)

(assert (=> mapNonEmpty!3210 m!75365))

(declare-fun b_lambda!3387 () Bool)

(assert (= b_lambda!3385 (or (and b!74797 b_free!2125 (= (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) (defaultEntry!2233 newMap!16))) (and b!74781 b_free!2127) b_lambda!3387)))

(declare-fun b_lambda!3389 () Bool)

(assert (= b_lambda!3381 (or (and b!74797 b_free!2125) (and b!74781 b_free!2127 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))))) b_lambda!3389)))

(declare-fun b_lambda!3391 () Bool)

(assert (= b_lambda!3379 (or (and b!74797 b_free!2125) (and b!74781 b_free!2127 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))))) b_lambda!3391)))

(declare-fun b_lambda!3393 () Bool)

(assert (= b_lambda!3383 (or (and b!74797 b_free!2125 (= (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) (defaultEntry!2233 newMap!16))) (and b!74781 b_free!2127) b_lambda!3393)))

(declare-fun b_lambda!3395 () Bool)

(assert (= b_lambda!3377 (or (and b!74797 b_free!2125 (= (defaultEntry!2233 (v!2539 (underlying!259 thiss!992))) (defaultEntry!2233 newMap!16))) (and b!74781 b_free!2127) b_lambda!3395)))

(check-sat (not b!75496) (not d!17939) (not bm!6721) (not b!75357) (not b!75264) (not d!17803) (not b!75599) (not b!75625) (not d!17927) (not b!75576) (not bm!6760) (not d!17899) (not d!17851) (not d!17951) (not d!17817) (not d!17905) (not b!75586) (not d!17971) (not b!75400) (not d!18009) (not d!17987) (not bm!6747) (not b!75687) (not bm!6736) (not b!75644) (not b!75336) (not b!75315) b_and!4619 (not d!17837) (not bm!6770) (not d!17809) (not b!75425) (not b!75577) (not d!17995) (not b_lambda!3389) (not d!17871) (not b!75583) tp_is_empty!2479 (not b!75547) (not b!75587) (not b!75428) (not b!75523) (not b!75421) (not d!17895) (not d!17977) (not b!75260) (not d!18007) (not b!75487) (not d!17887) (not b!75546) (not b!75634) (not b!75402) (not d!17979) (not b!75256) (not d!17867) (not b!75413) (not d!17877) (not b!75361) (not b!75656) (not b_next!2127) (not b!75498) (not b!75243) (not b!75329) (not d!17911) (not d!17947) (not b!75408) (not bm!6766) (not d!17835) (not b!75253) (not b!75251) (not d!17885) (not b!75440) (not b!75553) (not b!75598) (not bm!6751) (not b!75359) (not b!75566) (not d!17973) (not d!17925) (not b!75309) (not b_lambda!3393) (not d!17921) (not d!17981) (not b!75516) (not b!75619) (not bm!6784) (not b!75607) (not d!17891) (not d!17859) (not bm!6767) (not b!75363) (not b!75591) (not d!17839) (not b!75606) (not d!17989) (not b!75347) (not b!75601) (not b!75442) (not b!75594) (not b!75543) (not b!75277) (not b!75389) (not d!17863) (not d!17919) (not b!75321) (not d!17823) (not bm!6752) (not bm!6724) (not d!17931) (not b!75541) (not b!75320) (not b!75590) (not b!75639) (not b!75482) (not b!75647) (not b_lambda!3363) (not d!17869) (not d!18013) (not d!18015) (not b!75572) (not b!75317) (not d!17821) (not b!75633) (not bm!6756) (not b!75520) (not b!75412) (not d!17917) (not d!17813) (not b!75614) (not b_lambda!3373) (not b!75488) (not b!75593) (not d!17847) (not b!75600) (not b!75391) (not b!75677) (not b!75318) (not b!75575) (not b!75323) (not b!75604) (not b!75574) (not d!17893) (not b!75483) (not b!75550) (not d!18003) (not d!17949) (not b!75680) (not b!75406) (not mapNonEmpty!3210) (not b_next!2125) (not d!17997) (not b!75609) (not bm!6720) (not b_lambda!3391) (not b!75531) (not b!75308) (not bm!6750) (not b!75332) (not d!17955) (not b!75429) (not b!75403) (not b!75693) (not bm!6775) (not b!75499) (not b!75512) (not d!17811) (not d!17875) (not b!75626) (not b!75344) (not bm!6776) b_and!4617 (not d!17953) (not d!17933) (not b!75602) (not b!75444) (not d!17881) (not b!75532) (not b!75439) (not b!75266) (not d!17833) (not b!75529) (not b!75584) (not d!17897) (not bm!6738) (not b!75497) (not d!17815) (not b!75662) (not d!17937) (not bm!6737) (not b!75638) (not d!17959) (not b!75597) (not b!75334) (not b!75603) (not b!75675) (not b!75674) (not b!75384) (not b!75331) (not bm!6757) (not d!17901) (not b!75405) (not b!75314) (not b_lambda!3387) (not bm!6733) (not bm!6748) (not bm!6753) (not d!17849) (not b!75563) (not b!75514) (not b!75526) (not d!17879) (not b!75427) (not b!75410) (not bm!6725) (not b!75424) (not mapNonEmpty!3209) (not b!75284) (not b!75596) (not b!75341) (not d!18011) (not b!75589) (not d!17963) (not b!75562) (not b!75387) (not b!75506) (not b!75263) (not b!75393) (not b_lambda!3395) (not b!75249) (not b!75539) (not b!75554) (not d!17961) (not bm!6764) (not bm!6763) (not d!17965) (not b!75682) (not b!75688) (not bm!6783) (not b!75411) (not d!17929) (not d!17985) (not b!75377) (not b!75631) (not b!75556) (not bm!6759) (not d!17827) (not b!75581) (not b!75612) (not b!75257) (not b!75615) (not b!75491) (not b!75351) (not d!17993) (not b!75564) (not b!75645) (not b!75407) (not b!75322) (not d!17969) (not d!17855) (not d!17967) (not b!75409) (not b!75283) (not b!75683) (not b!75426) (not b!75605) (not b!75652) (not d!17865) (not b!75419) (not b!75504) (not d!17805) (not b!75620) (not b_lambda!3371) (not b_lambda!3375) (not d!17873) (not b!75654) (not d!17857) (not d!17889) (not b!75519) (not b!75557) (not b!75555) (not b!75533) (not d!17819) (not b!75588) (not b!75338) (not b!75628) (not d!17883))
(check-sat b_and!4617 b_and!4619 (not b_next!2125) (not b_next!2127))
