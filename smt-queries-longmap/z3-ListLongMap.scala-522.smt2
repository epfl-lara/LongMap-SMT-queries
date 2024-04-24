; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13126 () Bool)

(assert start!13126)

(declare-fun b!114880 () Bool)

(declare-fun b_free!2653 () Bool)

(declare-fun b_next!2653 () Bool)

(assert (=> b!114880 (= b_free!2653 (not b_next!2653))))

(declare-fun tp!10323 () Bool)

(declare-fun b_and!7105 () Bool)

(assert (=> b!114880 (= tp!10323 b_and!7105)))

(declare-fun b!114868 () Bool)

(declare-fun b_free!2655 () Bool)

(declare-fun b_next!2655 () Bool)

(assert (=> b!114868 (= b_free!2655 (not b_next!2655))))

(declare-fun tp!10324 () Bool)

(declare-fun b_and!7107 () Bool)

(assert (=> b!114868 (= tp!10324 b_and!7107)))

(declare-fun mapNonEmpty!4161 () Bool)

(declare-fun mapRes!4162 () Bool)

(declare-fun tp!10321 () Bool)

(declare-fun e!74794 () Bool)

(assert (=> mapNonEmpty!4161 (= mapRes!4162 (and tp!10321 e!74794))))

(declare-datatypes ((V!3305 0))(
  ( (V!3306 (val!1416 Int)) )
))
(declare-datatypes ((array!4475 0))(
  ( (array!4476 (arr!2120 (Array (_ BitVec 32) (_ BitVec 64))) (size!2380 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1028 0))(
  ( (ValueCellFull!1028 (v!3003 V!3305)) (EmptyCell!1028) )
))
(declare-datatypes ((array!4477 0))(
  ( (array!4478 (arr!2121 (Array (_ BitVec 32) ValueCell!1028)) (size!2381 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!964 0))(
  ( (LongMapFixedSize!965 (defaultEntry!2691 Int) (mask!6891 (_ BitVec 32)) (extraKeys!2480 (_ BitVec 32)) (zeroValue!2558 V!3305) (minValue!2558 V!3305) (_size!531 (_ BitVec 32)) (_keys!4413 array!4475) (_values!2674 array!4477) (_vacant!531 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!766 0))(
  ( (Cell!767 (v!3004 LongMapFixedSize!964)) )
))
(declare-datatypes ((LongMap!766 0))(
  ( (LongMap!767 (underlying!394 Cell!766)) )
))
(declare-fun thiss!992 () LongMap!766)

(declare-fun mapValue!4161 () ValueCell!1028)

(declare-fun mapKey!4161 () (_ BitVec 32))

(declare-fun mapRest!4162 () (Array (_ BitVec 32) ValueCell!1028))

(assert (=> mapNonEmpty!4161 (= (arr!2121 (_values!2674 (v!3004 (underlying!394 thiss!992)))) (store mapRest!4162 mapKey!4161 mapValue!4161))))

(declare-fun tp_is_empty!2743 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!964)

(declare-fun e!74788 () Bool)

(declare-fun e!74797 () Bool)

(declare-fun array_inv!1319 (array!4475) Bool)

(declare-fun array_inv!1320 (array!4477) Bool)

(assert (=> b!114868 (= e!74797 (and tp!10324 tp_is_empty!2743 (array_inv!1319 (_keys!4413 newMap!16)) (array_inv!1320 (_values!2674 newMap!16)) e!74788))))

(declare-fun b!114869 () Bool)

(declare-fun e!74798 () Bool)

(declare-fun e!74789 () Bool)

(assert (=> b!114869 (= e!74798 e!74789)))

(declare-fun b!114870 () Bool)

(assert (=> b!114870 (= e!74794 tp_is_empty!2743)))

(declare-fun b!114871 () Bool)

(declare-datatypes ((Unit!3571 0))(
  ( (Unit!3572) )
))
(declare-fun e!74793 () Unit!3571)

(declare-fun Unit!3573 () Unit!3571)

(assert (=> b!114871 (= e!74793 Unit!3573)))

(declare-fun mapIsEmpty!4161 () Bool)

(assert (=> mapIsEmpty!4161 mapRes!4162))

(declare-fun b!114872 () Bool)

(declare-fun e!74796 () Bool)

(assert (=> b!114872 (= e!74796 tp_is_empty!2743)))

(declare-fun b!114873 () Bool)

(declare-fun res!56470 () Bool)

(declare-fun e!74795 () Bool)

(assert (=> b!114873 (=> (not res!56470) (not e!74795))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!114873 (= res!56470 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2380 (_keys!4413 (v!3004 (underlying!394 thiss!992)))))))))

(declare-fun mapNonEmpty!4162 () Bool)

(declare-fun mapRes!4161 () Bool)

(declare-fun tp!10322 () Bool)

(declare-fun e!74800 () Bool)

(assert (=> mapNonEmpty!4162 (= mapRes!4161 (and tp!10322 e!74800))))

(declare-fun mapKey!4162 () (_ BitVec 32))

(declare-fun mapRest!4161 () (Array (_ BitVec 32) ValueCell!1028))

(declare-fun mapValue!4162 () ValueCell!1028)

(assert (=> mapNonEmpty!4162 (= (arr!2121 (_values!2674 newMap!16)) (store mapRest!4161 mapKey!4162 mapValue!4162))))

(declare-fun b!114874 () Bool)

(declare-fun e!74792 () Bool)

(declare-fun e!74791 () Bool)

(assert (=> b!114874 (= e!74792 (and e!74791 mapRes!4162))))

(declare-fun condMapEmpty!4162 () Bool)

(declare-fun mapDefault!4161 () ValueCell!1028)

(assert (=> b!114874 (= condMapEmpty!4162 (= (arr!2121 (_values!2674 (v!3004 (underlying!394 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1028)) mapDefault!4161)))))

(declare-fun b!114875 () Bool)

(declare-fun res!56474 () Bool)

(assert (=> b!114875 (=> (not res!56474) (not e!74795))))

(declare-fun valid!458 (LongMapFixedSize!964) Bool)

(assert (=> b!114875 (= res!56474 (valid!458 newMap!16))))

(declare-fun b!114876 () Bool)

(declare-fun e!74801 () Bool)

(assert (=> b!114876 (= e!74801 false)))

(declare-fun lt!59854 () Unit!3571)

(assert (=> b!114876 (= lt!59854 e!74793)))

(declare-fun c!20499 () Bool)

(declare-datatypes ((tuple2!2452 0))(
  ( (tuple2!2453 (_1!1237 (_ BitVec 64)) (_2!1237 V!3305)) )
))
(declare-datatypes ((List!1641 0))(
  ( (Nil!1638) (Cons!1637 (h!2237 tuple2!2452) (t!5883 List!1641)) )
))
(declare-datatypes ((ListLongMap!1583 0))(
  ( (ListLongMap!1584 (toList!807 List!1641)) )
))
(declare-fun lt!59858 () ListLongMap!1583)

(declare-fun contains!846 (ListLongMap!1583 (_ BitVec 64)) Bool)

(assert (=> b!114876 (= c!20499 (contains!846 lt!59858 (select (arr!2120 (_keys!4413 (v!3004 (underlying!394 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2454 0))(
  ( (tuple2!2455 (_1!1238 Bool) (_2!1238 LongMapFixedSize!964)) )
))
(declare-fun lt!59856 () tuple2!2454)

(declare-fun update!179 (LongMapFixedSize!964 (_ BitVec 64) V!3305) tuple2!2454)

(declare-fun get!1396 (ValueCell!1028 V!3305) V!3305)

(declare-fun dynLambda!406 (Int (_ BitVec 64)) V!3305)

(assert (=> b!114876 (= lt!59856 (update!179 newMap!16 (select (arr!2120 (_keys!4413 (v!3004 (underlying!394 thiss!992)))) from!355) (get!1396 (select (arr!2121 (_values!2674 (v!3004 (underlying!394 thiss!992)))) from!355) (dynLambda!406 (defaultEntry!2691 (v!3004 (underlying!394 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!114877 () Bool)

(declare-fun Unit!3574 () Unit!3571)

(assert (=> b!114877 (= e!74793 Unit!3574)))

(declare-fun lt!59859 () Unit!3571)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!118 (array!4475 array!4477 (_ BitVec 32) (_ BitVec 32) V!3305 V!3305 (_ BitVec 64) (_ BitVec 32) Int) Unit!3571)

(assert (=> b!114877 (= lt!59859 (lemmaListMapContainsThenArrayContainsFrom!118 (_keys!4413 (v!3004 (underlying!394 thiss!992))) (_values!2674 (v!3004 (underlying!394 thiss!992))) (mask!6891 (v!3004 (underlying!394 thiss!992))) (extraKeys!2480 (v!3004 (underlying!394 thiss!992))) (zeroValue!2558 (v!3004 (underlying!394 thiss!992))) (minValue!2558 (v!3004 (underlying!394 thiss!992))) (select (arr!2120 (_keys!4413 (v!3004 (underlying!394 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2691 (v!3004 (underlying!394 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114877 (arrayContainsKey!0 (_keys!4413 (v!3004 (underlying!394 thiss!992))) (select (arr!2120 (_keys!4413 (v!3004 (underlying!394 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59855 () Unit!3571)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4475 (_ BitVec 32) (_ BitVec 32)) Unit!3571)

(assert (=> b!114877 (= lt!59855 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4413 (v!3004 (underlying!394 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1642 0))(
  ( (Nil!1639) (Cons!1638 (h!2238 (_ BitVec 64)) (t!5884 List!1642)) )
))
(declare-fun arrayNoDuplicates!0 (array!4475 (_ BitVec 32) List!1642) Bool)

(assert (=> b!114877 (arrayNoDuplicates!0 (_keys!4413 (v!3004 (underlying!394 thiss!992))) from!355 Nil!1639)))

(declare-fun lt!59853 () Unit!3571)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4475 (_ BitVec 32) (_ BitVec 64) List!1642) Unit!3571)

(assert (=> b!114877 (= lt!59853 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4413 (v!3004 (underlying!394 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2120 (_keys!4413 (v!3004 (underlying!394 thiss!992)))) from!355) (Cons!1638 (select (arr!2120 (_keys!4413 (v!3004 (underlying!394 thiss!992)))) from!355) Nil!1639)))))

(assert (=> b!114877 false))

(declare-fun b!114878 () Bool)

(declare-fun e!74787 () Bool)

(assert (=> b!114878 (= e!74789 e!74787)))

(declare-fun res!56471 () Bool)

(assert (=> start!13126 (=> (not res!56471) (not e!74795))))

(declare-fun valid!459 (LongMap!766) Bool)

(assert (=> start!13126 (= res!56471 (valid!459 thiss!992))))

(assert (=> start!13126 e!74795))

(assert (=> start!13126 e!74798))

(assert (=> start!13126 true))

(assert (=> start!13126 e!74797))

(declare-fun b!114879 () Bool)

(declare-fun res!56472 () Bool)

(assert (=> b!114879 (=> (not res!56472) (not e!74795))))

(assert (=> b!114879 (= res!56472 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6891 newMap!16)) (_size!531 (v!3004 (underlying!394 thiss!992)))))))

(assert (=> b!114880 (= e!74787 (and tp!10323 tp_is_empty!2743 (array_inv!1319 (_keys!4413 (v!3004 (underlying!394 thiss!992)))) (array_inv!1320 (_values!2674 (v!3004 (underlying!394 thiss!992)))) e!74792))))

(declare-fun mapIsEmpty!4162 () Bool)

(assert (=> mapIsEmpty!4162 mapRes!4161))

(declare-fun b!114881 () Bool)

(assert (=> b!114881 (= e!74788 (and e!74796 mapRes!4161))))

(declare-fun condMapEmpty!4161 () Bool)

(declare-fun mapDefault!4162 () ValueCell!1028)

(assert (=> b!114881 (= condMapEmpty!4161 (= (arr!2121 (_values!2674 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1028)) mapDefault!4162)))))

(declare-fun b!114882 () Bool)

(assert (=> b!114882 (= e!74800 tp_is_empty!2743)))

(declare-fun b!114883 () Bool)

(assert (=> b!114883 (= e!74795 e!74801)))

(declare-fun res!56473 () Bool)

(assert (=> b!114883 (=> (not res!56473) (not e!74801))))

(declare-fun lt!59857 () ListLongMap!1583)

(assert (=> b!114883 (= res!56473 (and (= lt!59857 lt!59858) (not (= (select (arr!2120 (_keys!4413 (v!3004 (underlying!394 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2120 (_keys!4413 (v!3004 (underlying!394 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1325 (LongMapFixedSize!964) ListLongMap!1583)

(assert (=> b!114883 (= lt!59858 (map!1325 newMap!16))))

(declare-fun getCurrentListMap!489 (array!4475 array!4477 (_ BitVec 32) (_ BitVec 32) V!3305 V!3305 (_ BitVec 32) Int) ListLongMap!1583)

(assert (=> b!114883 (= lt!59857 (getCurrentListMap!489 (_keys!4413 (v!3004 (underlying!394 thiss!992))) (_values!2674 (v!3004 (underlying!394 thiss!992))) (mask!6891 (v!3004 (underlying!394 thiss!992))) (extraKeys!2480 (v!3004 (underlying!394 thiss!992))) (zeroValue!2558 (v!3004 (underlying!394 thiss!992))) (minValue!2558 (v!3004 (underlying!394 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2691 (v!3004 (underlying!394 thiss!992)))))))

(declare-fun b!114884 () Bool)

(assert (=> b!114884 (= e!74791 tp_is_empty!2743)))

(assert (= (and start!13126 res!56471) b!114873))

(assert (= (and b!114873 res!56470) b!114875))

(assert (= (and b!114875 res!56474) b!114879))

(assert (= (and b!114879 res!56472) b!114883))

(assert (= (and b!114883 res!56473) b!114876))

(assert (= (and b!114876 c!20499) b!114877))

(assert (= (and b!114876 (not c!20499)) b!114871))

(assert (= (and b!114874 condMapEmpty!4162) mapIsEmpty!4161))

(assert (= (and b!114874 (not condMapEmpty!4162)) mapNonEmpty!4161))

(get-info :version)

(assert (= (and mapNonEmpty!4161 ((_ is ValueCellFull!1028) mapValue!4161)) b!114870))

(assert (= (and b!114874 ((_ is ValueCellFull!1028) mapDefault!4161)) b!114884))

(assert (= b!114880 b!114874))

(assert (= b!114878 b!114880))

(assert (= b!114869 b!114878))

(assert (= start!13126 b!114869))

(assert (= (and b!114881 condMapEmpty!4161) mapIsEmpty!4162))

(assert (= (and b!114881 (not condMapEmpty!4161)) mapNonEmpty!4162))

(assert (= (and mapNonEmpty!4162 ((_ is ValueCellFull!1028) mapValue!4162)) b!114882))

(assert (= (and b!114881 ((_ is ValueCellFull!1028) mapDefault!4162)) b!114872))

(assert (= b!114868 b!114881))

(assert (= start!13126 b!114868))

(declare-fun b_lambda!5135 () Bool)

(assert (=> (not b_lambda!5135) (not b!114876)))

(declare-fun t!5880 () Bool)

(declare-fun tb!2205 () Bool)

(assert (=> (and b!114880 (= (defaultEntry!2691 (v!3004 (underlying!394 thiss!992))) (defaultEntry!2691 (v!3004 (underlying!394 thiss!992)))) t!5880) tb!2205))

(declare-fun result!3681 () Bool)

(assert (=> tb!2205 (= result!3681 tp_is_empty!2743)))

(assert (=> b!114876 t!5880))

(declare-fun b_and!7109 () Bool)

(assert (= b_and!7105 (and (=> t!5880 result!3681) b_and!7109)))

(declare-fun tb!2207 () Bool)

(declare-fun t!5882 () Bool)

(assert (=> (and b!114868 (= (defaultEntry!2691 newMap!16) (defaultEntry!2691 (v!3004 (underlying!394 thiss!992)))) t!5882) tb!2207))

(declare-fun result!3685 () Bool)

(assert (= result!3685 result!3681))

(assert (=> b!114876 t!5882))

(declare-fun b_and!7111 () Bool)

(assert (= b_and!7107 (and (=> t!5882 result!3685) b_and!7111)))

(declare-fun m!131097 () Bool)

(assert (=> b!114875 m!131097))

(declare-fun m!131099 () Bool)

(assert (=> b!114868 m!131099))

(declare-fun m!131101 () Bool)

(assert (=> b!114868 m!131101))

(declare-fun m!131103 () Bool)

(assert (=> b!114876 m!131103))

(declare-fun m!131105 () Bool)

(assert (=> b!114876 m!131105))

(declare-fun m!131107 () Bool)

(assert (=> b!114876 m!131107))

(declare-fun m!131109 () Bool)

(assert (=> b!114876 m!131109))

(declare-fun m!131111 () Bool)

(assert (=> b!114876 m!131111))

(assert (=> b!114876 m!131103))

(assert (=> b!114876 m!131109))

(assert (=> b!114876 m!131103))

(assert (=> b!114876 m!131111))

(declare-fun m!131113 () Bool)

(assert (=> b!114876 m!131113))

(assert (=> b!114876 m!131107))

(declare-fun m!131115 () Bool)

(assert (=> mapNonEmpty!4162 m!131115))

(declare-fun m!131117 () Bool)

(assert (=> b!114877 m!131117))

(declare-fun m!131119 () Bool)

(assert (=> b!114877 m!131119))

(assert (=> b!114877 m!131103))

(declare-fun m!131121 () Bool)

(assert (=> b!114877 m!131121))

(assert (=> b!114877 m!131103))

(assert (=> b!114877 m!131103))

(declare-fun m!131123 () Bool)

(assert (=> b!114877 m!131123))

(assert (=> b!114877 m!131103))

(declare-fun m!131125 () Bool)

(assert (=> b!114877 m!131125))

(declare-fun m!131127 () Bool)

(assert (=> start!13126 m!131127))

(declare-fun m!131129 () Bool)

(assert (=> b!114880 m!131129))

(declare-fun m!131131 () Bool)

(assert (=> b!114880 m!131131))

(assert (=> b!114883 m!131103))

(declare-fun m!131133 () Bool)

(assert (=> b!114883 m!131133))

(declare-fun m!131135 () Bool)

(assert (=> b!114883 m!131135))

(declare-fun m!131137 () Bool)

(assert (=> mapNonEmpty!4161 m!131137))

(check-sat (not start!13126) b_and!7111 (not b_lambda!5135) (not b_next!2655) (not b!114876) (not b!114868) (not b!114880) (not b!114877) (not b_next!2653) (not mapNonEmpty!4161) tp_is_empty!2743 (not b!114883) (not b!114875) (not mapNonEmpty!4162) b_and!7109)
(check-sat b_and!7109 b_and!7111 (not b_next!2653) (not b_next!2655))
