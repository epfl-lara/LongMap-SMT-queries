; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9222 () Bool)

(assert start!9222)

(declare-fun b!65636 () Bool)

(declare-fun b_free!2053 () Bool)

(declare-fun b_next!2053 () Bool)

(assert (=> b!65636 (= b_free!2053 (not b_next!2053))))

(declare-fun tp!8308 () Bool)

(declare-fun b_and!4033 () Bool)

(assert (=> b!65636 (= tp!8308 b_and!4033)))

(declare-fun b!65634 () Bool)

(declare-fun b_free!2055 () Bool)

(declare-fun b_next!2055 () Bool)

(assert (=> b!65634 (= b_free!2055 (not b_next!2055))))

(declare-fun tp!8307 () Bool)

(declare-fun b_and!4035 () Bool)

(assert (=> b!65634 (= tp!8307 b_and!4035)))

(declare-fun b!65624 () Bool)

(declare-fun e!43049 () Bool)

(declare-fun tp_is_empty!2443 () Bool)

(assert (=> b!65624 (= e!43049 tp_is_empty!2443)))

(declare-fun b!65625 () Bool)

(declare-fun e!43036 () Bool)

(assert (=> b!65625 (= e!43036 tp_is_empty!2443)))

(declare-fun res!35645 () Bool)

(declare-fun e!43039 () Bool)

(assert (=> start!9222 (=> (not res!35645) (not e!43039))))

(declare-datatypes ((V!2905 0))(
  ( (V!2906 (val!1266 Int)) )
))
(declare-datatypes ((array!3803 0))(
  ( (array!3804 (arr!1816 (Array (_ BitVec 32) (_ BitVec 64))) (size!2052 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!878 0))(
  ( (ValueCellFull!878 (v!2461 V!2905)) (EmptyCell!878) )
))
(declare-datatypes ((array!3805 0))(
  ( (array!3806 (arr!1817 (Array (_ BitVec 32) ValueCell!878)) (size!2053 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!664 0))(
  ( (LongMapFixedSize!665 (defaultEntry!2140 Int) (mask!6071 (_ BitVec 32)) (extraKeys!2011 (_ BitVec 32)) (zeroValue!2048 V!2905) (minValue!2048 V!2905) (_size!381 (_ BitVec 32)) (_keys!3779 array!3803) (_values!2123 array!3805) (_vacant!381 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!462 0))(
  ( (Cell!463 (v!2462 LongMapFixedSize!664)) )
))
(declare-datatypes ((LongMap!462 0))(
  ( (LongMap!463 (underlying!242 Cell!462)) )
))
(declare-fun thiss!992 () LongMap!462)

(declare-fun valid!284 (LongMap!462) Bool)

(assert (=> start!9222 (= res!35645 (valid!284 thiss!992))))

(assert (=> start!9222 e!43039))

(declare-fun e!43046 () Bool)

(assert (=> start!9222 e!43046))

(assert (=> start!9222 true))

(declare-fun e!43041 () Bool)

(assert (=> start!9222 e!43041))

(declare-fun mapNonEmpty!3047 () Bool)

(declare-fun mapRes!3047 () Bool)

(declare-fun tp!8309 () Bool)

(declare-fun e!43034 () Bool)

(assert (=> mapNonEmpty!3047 (= mapRes!3047 (and tp!8309 e!43034))))

(declare-fun mapValue!3048 () ValueCell!878)

(declare-fun mapRest!3048 () (Array (_ BitVec 32) ValueCell!878))

(declare-fun mapKey!3047 () (_ BitVec 32))

(assert (=> mapNonEmpty!3047 (= (arr!1817 (_values!2123 (v!2462 (underlying!242 thiss!992)))) (store mapRest!3048 mapKey!3047 mapValue!3048))))

(declare-fun b!65626 () Bool)

(declare-fun e!43035 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!65626 (= e!43035 (not (validMask!0 (mask!6071 (v!2462 (underlying!242 thiss!992))))))))

(declare-datatypes ((tuple2!2076 0))(
  ( (tuple2!2077 (_1!1049 (_ BitVec 64)) (_2!1049 V!2905)) )
))
(declare-datatypes ((List!1463 0))(
  ( (Nil!1460) (Cons!1459 (h!2043 tuple2!2076) (t!4924 List!1463)) )
))
(declare-datatypes ((ListLongMap!1377 0))(
  ( (ListLongMap!1378 (toList!704 List!1463)) )
))
(declare-fun lt!28079 () ListLongMap!1377)

(declare-fun lt!28081 () tuple2!2076)

(declare-fun lt!28077 () tuple2!2076)

(declare-fun +!86 (ListLongMap!1377 tuple2!2076) ListLongMap!1377)

(assert (=> b!65626 (= (+!86 (+!86 lt!28079 lt!28081) lt!28077) (+!86 (+!86 lt!28079 lt!28077) lt!28081))))

(assert (=> b!65626 (= lt!28077 (tuple2!2077 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2048 (v!2462 (underlying!242 thiss!992)))))))

(declare-fun lt!28085 () V!2905)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!65626 (= lt!28081 (tuple2!2077 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) lt!28085))))

(declare-datatypes ((Unit!1806 0))(
  ( (Unit!1807) )
))
(declare-fun lt!28076 () Unit!1806)

(declare-fun addCommutativeForDiffKeys!5 (ListLongMap!1377 (_ BitVec 64) V!2905 (_ BitVec 64) V!2905) Unit!1806)

(assert (=> b!65626 (= lt!28076 (addCommutativeForDiffKeys!5 lt!28079 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) lt!28085 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2048 (v!2462 (underlying!242 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!50 (array!3803 array!3805 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 32) Int) ListLongMap!1377)

(assert (=> b!65626 (= lt!28079 (getCurrentListMapNoExtraKeys!50 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (_values!2123 (v!2462 (underlying!242 thiss!992))) (mask!6071 (v!2462 (underlying!242 thiss!992))) (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) (minValue!2048 (v!2462 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992)))))))

(declare-fun mapNonEmpty!3048 () Bool)

(declare-fun mapRes!3048 () Bool)

(declare-fun tp!8310 () Bool)

(declare-fun e!43043 () Bool)

(assert (=> mapNonEmpty!3048 (= mapRes!3048 (and tp!8310 e!43043))))

(declare-fun mapKey!3048 () (_ BitVec 32))

(declare-fun mapValue!3047 () ValueCell!878)

(declare-fun newMap!16 () LongMapFixedSize!664)

(declare-fun mapRest!3047 () (Array (_ BitVec 32) ValueCell!878))

(assert (=> mapNonEmpty!3048 (= (arr!1817 (_values!2123 newMap!16)) (store mapRest!3047 mapKey!3048 mapValue!3047))))

(declare-fun b!65627 () Bool)

(declare-fun res!35646 () Bool)

(assert (=> b!65627 (=> (not res!35646) (not e!43039))))

(declare-fun valid!285 (LongMapFixedSize!664) Bool)

(assert (=> b!65627 (= res!35646 (valid!285 newMap!16))))

(declare-fun b!65628 () Bool)

(declare-fun e!43033 () Unit!1806)

(declare-fun Unit!1808 () Unit!1806)

(assert (=> b!65628 (= e!43033 Unit!1808)))

(declare-fun b!65629 () Bool)

(declare-fun e!43040 () Bool)

(assert (=> b!65629 (= e!43040 e!43035)))

(declare-fun res!35648 () Bool)

(assert (=> b!65629 (=> (not res!35648) (not e!43035))))

(declare-datatypes ((tuple2!2078 0))(
  ( (tuple2!2079 (_1!1050 Bool) (_2!1050 LongMapFixedSize!664)) )
))
(declare-fun lt!28083 () tuple2!2078)

(assert (=> b!65629 (= res!35648 (and (_1!1050 lt!28083) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!28078 () Unit!1806)

(assert (=> b!65629 (= lt!28078 e!43033)))

(declare-fun lt!28080 () ListLongMap!1377)

(declare-fun c!8988 () Bool)

(declare-fun contains!702 (ListLongMap!1377 (_ BitVec 64)) Bool)

(assert (=> b!65629 (= c!8988 (contains!702 lt!28080 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355)))))

(declare-fun update!94 (LongMapFixedSize!664 (_ BitVec 64) V!2905) tuple2!2078)

(assert (=> b!65629 (= lt!28083 (update!94 newMap!16 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) lt!28085))))

(declare-fun b!65630 () Bool)

(declare-fun res!35647 () Bool)

(assert (=> b!65630 (=> (not res!35647) (not e!43039))))

(assert (=> b!65630 (= res!35647 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6071 newMap!16)) (_size!381 (v!2462 (underlying!242 thiss!992)))))))

(declare-fun b!65631 () Bool)

(declare-fun Unit!1809 () Unit!1806)

(assert (=> b!65631 (= e!43033 Unit!1809)))

(declare-fun lt!28086 () Unit!1806)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!41 (array!3803 array!3805 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 64) (_ BitVec 32) Int) Unit!1806)

(assert (=> b!65631 (= lt!28086 (lemmaListMapContainsThenArrayContainsFrom!41 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (_values!2123 (v!2462 (underlying!242 thiss!992))) (mask!6071 (v!2462 (underlying!242 thiss!992))) (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) (minValue!2048 (v!2462 (underlying!242 thiss!992))) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!65631 (arrayContainsKey!0 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!28075 () Unit!1806)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3803 (_ BitVec 32) (_ BitVec 32)) Unit!1806)

(assert (=> b!65631 (= lt!28075 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3779 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1464 0))(
  ( (Nil!1461) (Cons!1460 (h!2044 (_ BitVec 64)) (t!4925 List!1464)) )
))
(declare-fun arrayNoDuplicates!0 (array!3803 (_ BitVec 32) List!1464) Bool)

(assert (=> b!65631 (arrayNoDuplicates!0 (_keys!3779 (v!2462 (underlying!242 thiss!992))) from!355 Nil!1461)))

(declare-fun lt!28082 () Unit!1806)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3803 (_ BitVec 32) (_ BitVec 64) List!1464) Unit!1806)

(assert (=> b!65631 (= lt!28082 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (Cons!1460 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) Nil!1461)))))

(assert (=> b!65631 false))

(declare-fun b!65632 () Bool)

(declare-fun e!43045 () Bool)

(assert (=> b!65632 (= e!43045 (and e!43049 mapRes!3048))))

(declare-fun condMapEmpty!3048 () Bool)

(declare-fun mapDefault!3047 () ValueCell!878)

(assert (=> b!65632 (= condMapEmpty!3048 (= (arr!1817 (_values!2123 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!878)) mapDefault!3047)))))

(declare-fun b!65633 () Bool)

(declare-fun e!43037 () Bool)

(declare-fun e!43044 () Bool)

(assert (=> b!65633 (= e!43037 e!43044)))

(declare-fun array_inv!1133 (array!3803) Bool)

(declare-fun array_inv!1134 (array!3805) Bool)

(assert (=> b!65634 (= e!43041 (and tp!8307 tp_is_empty!2443 (array_inv!1133 (_keys!3779 newMap!16)) (array_inv!1134 (_values!2123 newMap!16)) e!43045))))

(declare-fun mapIsEmpty!3047 () Bool)

(assert (=> mapIsEmpty!3047 mapRes!3048))

(declare-fun b!65635 () Bool)

(declare-fun e!43042 () Bool)

(assert (=> b!65635 (= e!43039 e!43042)))

(declare-fun res!35643 () Bool)

(assert (=> b!65635 (=> (not res!35643) (not e!43042))))

(declare-fun lt!28084 () ListLongMap!1377)

(assert (=> b!65635 (= res!35643 (= lt!28084 lt!28080))))

(declare-fun map!1130 (LongMapFixedSize!664) ListLongMap!1377)

(assert (=> b!65635 (= lt!28080 (map!1130 newMap!16))))

(declare-fun getCurrentListMap!400 (array!3803 array!3805 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 32) Int) ListLongMap!1377)

(assert (=> b!65635 (= lt!28084 (getCurrentListMap!400 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (_values!2123 (v!2462 (underlying!242 thiss!992))) (mask!6071 (v!2462 (underlying!242 thiss!992))) (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) (minValue!2048 (v!2462 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992)))))))

(declare-fun e!43038 () Bool)

(assert (=> b!65636 (= e!43044 (and tp!8308 tp_is_empty!2443 (array_inv!1133 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (array_inv!1134 (_values!2123 (v!2462 (underlying!242 thiss!992)))) e!43038))))

(declare-fun b!65637 () Bool)

(assert (=> b!65637 (= e!43034 tp_is_empty!2443)))

(declare-fun b!65638 () Bool)

(declare-fun res!35644 () Bool)

(assert (=> b!65638 (=> (not res!35644) (not e!43039))))

(assert (=> b!65638 (= res!35644 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992)))))))))

(declare-fun b!65639 () Bool)

(assert (=> b!65639 (= e!43046 e!43037)))

(declare-fun b!65640 () Bool)

(assert (=> b!65640 (= e!43042 e!43040)))

(declare-fun res!35649 () Bool)

(assert (=> b!65640 (=> (not res!35649) (not e!43040))))

(assert (=> b!65640 (= res!35649 (and (not (= (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1114 (ValueCell!878 V!2905) V!2905)

(declare-fun dynLambda!318 (Int (_ BitVec 64)) V!2905)

(assert (=> b!65640 (= lt!28085 (get!1114 (select (arr!1817 (_values!2123 (v!2462 (underlying!242 thiss!992)))) from!355) (dynLambda!318 (defaultEntry!2140 (v!2462 (underlying!242 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!65641 () Bool)

(assert (=> b!65641 (= e!43038 (and e!43036 mapRes!3047))))

(declare-fun condMapEmpty!3047 () Bool)

(declare-fun mapDefault!3048 () ValueCell!878)

(assert (=> b!65641 (= condMapEmpty!3047 (= (arr!1817 (_values!2123 (v!2462 (underlying!242 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!878)) mapDefault!3048)))))

(declare-fun b!65642 () Bool)

(assert (=> b!65642 (= e!43043 tp_is_empty!2443)))

(declare-fun mapIsEmpty!3048 () Bool)

(assert (=> mapIsEmpty!3048 mapRes!3047))

(assert (= (and start!9222 res!35645) b!65638))

(assert (= (and b!65638 res!35644) b!65627))

(assert (= (and b!65627 res!35646) b!65630))

(assert (= (and b!65630 res!35647) b!65635))

(assert (= (and b!65635 res!35643) b!65640))

(assert (= (and b!65640 res!35649) b!65629))

(assert (= (and b!65629 c!8988) b!65631))

(assert (= (and b!65629 (not c!8988)) b!65628))

(assert (= (and b!65629 res!35648) b!65626))

(assert (= (and b!65641 condMapEmpty!3047) mapIsEmpty!3048))

(assert (= (and b!65641 (not condMapEmpty!3047)) mapNonEmpty!3047))

(get-info :version)

(assert (= (and mapNonEmpty!3047 ((_ is ValueCellFull!878) mapValue!3048)) b!65637))

(assert (= (and b!65641 ((_ is ValueCellFull!878) mapDefault!3048)) b!65625))

(assert (= b!65636 b!65641))

(assert (= b!65633 b!65636))

(assert (= b!65639 b!65633))

(assert (= start!9222 b!65639))

(assert (= (and b!65632 condMapEmpty!3048) mapIsEmpty!3047))

(assert (= (and b!65632 (not condMapEmpty!3048)) mapNonEmpty!3048))

(assert (= (and mapNonEmpty!3048 ((_ is ValueCellFull!878) mapValue!3047)) b!65642))

(assert (= (and b!65632 ((_ is ValueCellFull!878) mapDefault!3047)) b!65624))

(assert (= b!65634 b!65632))

(assert (= start!9222 b!65634))

(declare-fun b_lambda!2931 () Bool)

(assert (=> (not b_lambda!2931) (not b!65640)))

(declare-fun t!4921 () Bool)

(declare-fun tb!1437 () Bool)

(assert (=> (and b!65636 (= (defaultEntry!2140 (v!2462 (underlying!242 thiss!992))) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992)))) t!4921) tb!1437))

(declare-fun result!2547 () Bool)

(assert (=> tb!1437 (= result!2547 tp_is_empty!2443)))

(assert (=> b!65640 t!4921))

(declare-fun b_and!4037 () Bool)

(assert (= b_and!4033 (and (=> t!4921 result!2547) b_and!4037)))

(declare-fun tb!1439 () Bool)

(declare-fun t!4923 () Bool)

(assert (=> (and b!65634 (= (defaultEntry!2140 newMap!16) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992)))) t!4923) tb!1439))

(declare-fun result!2551 () Bool)

(assert (= result!2551 result!2547))

(assert (=> b!65640 t!4923))

(declare-fun b_and!4039 () Bool)

(assert (= b_and!4035 (and (=> t!4923 result!2551) b_and!4039)))

(declare-fun m!60035 () Bool)

(assert (=> mapNonEmpty!3047 m!60035))

(declare-fun m!60037 () Bool)

(assert (=> b!65636 m!60037))

(declare-fun m!60039 () Bool)

(assert (=> b!65636 m!60039))

(declare-fun m!60041 () Bool)

(assert (=> b!65634 m!60041))

(declare-fun m!60043 () Bool)

(assert (=> b!65634 m!60043))

(declare-fun m!60045 () Bool)

(assert (=> b!65629 m!60045))

(assert (=> b!65629 m!60045))

(declare-fun m!60047 () Bool)

(assert (=> b!65629 m!60047))

(assert (=> b!65629 m!60045))

(declare-fun m!60049 () Bool)

(assert (=> b!65629 m!60049))

(declare-fun m!60051 () Bool)

(assert (=> b!65626 m!60051))

(declare-fun m!60053 () Bool)

(assert (=> b!65626 m!60053))

(declare-fun m!60055 () Bool)

(assert (=> b!65626 m!60055))

(declare-fun m!60057 () Bool)

(assert (=> b!65626 m!60057))

(declare-fun m!60059 () Bool)

(assert (=> b!65626 m!60059))

(assert (=> b!65626 m!60045))

(assert (=> b!65626 m!60057))

(assert (=> b!65626 m!60053))

(assert (=> b!65626 m!60045))

(declare-fun m!60061 () Bool)

(assert (=> b!65626 m!60061))

(declare-fun m!60063 () Bool)

(assert (=> b!65626 m!60063))

(declare-fun m!60065 () Bool)

(assert (=> b!65627 m!60065))

(declare-fun m!60067 () Bool)

(assert (=> start!9222 m!60067))

(declare-fun m!60069 () Bool)

(assert (=> b!65635 m!60069))

(declare-fun m!60071 () Bool)

(assert (=> b!65635 m!60071))

(declare-fun m!60073 () Bool)

(assert (=> mapNonEmpty!3048 m!60073))

(assert (=> b!65640 m!60045))

(declare-fun m!60075 () Bool)

(assert (=> b!65640 m!60075))

(declare-fun m!60077 () Bool)

(assert (=> b!65640 m!60077))

(assert (=> b!65640 m!60075))

(assert (=> b!65640 m!60077))

(declare-fun m!60079 () Bool)

(assert (=> b!65640 m!60079))

(declare-fun m!60081 () Bool)

(assert (=> b!65631 m!60081))

(declare-fun m!60083 () Bool)

(assert (=> b!65631 m!60083))

(assert (=> b!65631 m!60045))

(declare-fun m!60085 () Bool)

(assert (=> b!65631 m!60085))

(assert (=> b!65631 m!60045))

(assert (=> b!65631 m!60045))

(declare-fun m!60087 () Bool)

(assert (=> b!65631 m!60087))

(assert (=> b!65631 m!60045))

(declare-fun m!60089 () Bool)

(assert (=> b!65631 m!60089))

(check-sat (not b_lambda!2931) tp_is_empty!2443 (not b!65631) (not b!65629) (not b_next!2053) (not b!65640) (not mapNonEmpty!3047) b_and!4039 (not b!65634) b_and!4037 (not b!65635) (not mapNonEmpty!3048) (not b_next!2055) (not b!65627) (not b!65626) (not b!65636) (not start!9222))
(check-sat b_and!4037 b_and!4039 (not b_next!2053) (not b_next!2055))
(get-model)

(declare-fun b_lambda!2937 () Bool)

(assert (= b_lambda!2931 (or (and b!65636 b_free!2053) (and b!65634 b_free!2055 (= (defaultEntry!2140 newMap!16) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992))))) b_lambda!2937)))

(check-sat (not b_lambda!2937) tp_is_empty!2443 (not b!65631) (not b!65629) (not b_next!2053) (not b!65640) (not mapNonEmpty!3047) b_and!4039 (not b!65634) b_and!4037 (not b!65635) (not mapNonEmpty!3048) (not b_next!2055) (not b!65627) (not b!65626) (not b!65636) (not start!9222))
(check-sat b_and!4037 b_and!4039 (not b_next!2053) (not b_next!2055))
(get-model)

(declare-fun d!13585 () Bool)

(assert (=> d!13585 (= (array_inv!1133 (_keys!3779 newMap!16)) (bvsge (size!2052 (_keys!3779 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!65634 d!13585))

(declare-fun d!13587 () Bool)

(assert (=> d!13587 (= (array_inv!1134 (_values!2123 newMap!16)) (bvsge (size!2053 (_values!2123 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!65634 d!13587))

(declare-fun d!13589 () Bool)

(declare-fun e!43157 () Bool)

(assert (=> d!13589 e!43157))

(declare-fun res!35694 () Bool)

(assert (=> d!13589 (=> res!35694 e!43157)))

(declare-fun lt!28170 () Bool)

(assert (=> d!13589 (= res!35694 (not lt!28170))))

(declare-fun lt!28169 () Bool)

(assert (=> d!13589 (= lt!28170 lt!28169)))

(declare-fun lt!28167 () Unit!1806)

(declare-fun e!43156 () Unit!1806)

(assert (=> d!13589 (= lt!28167 e!43156)))

(declare-fun c!8997 () Bool)

(assert (=> d!13589 (= c!8997 lt!28169)))

(declare-fun containsKey!131 (List!1463 (_ BitVec 64)) Bool)

(assert (=> d!13589 (= lt!28169 (containsKey!131 (toList!704 lt!28080) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355)))))

(assert (=> d!13589 (= (contains!702 lt!28080 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355)) lt!28170)))

(declare-fun b!65769 () Bool)

(declare-fun lt!28168 () Unit!1806)

(assert (=> b!65769 (= e!43156 lt!28168)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!80 (List!1463 (_ BitVec 64)) Unit!1806)

(assert (=> b!65769 (= lt!28168 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!704 lt!28080) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355)))))

(declare-datatypes ((Option!133 0))(
  ( (Some!132 (v!2467 V!2905)) (None!131) )
))
(declare-fun isDefined!81 (Option!133) Bool)

(declare-fun getValueByKey!127 (List!1463 (_ BitVec 64)) Option!133)

(assert (=> b!65769 (isDefined!81 (getValueByKey!127 (toList!704 lt!28080) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355)))))

(declare-fun b!65770 () Bool)

(declare-fun Unit!1814 () Unit!1806)

(assert (=> b!65770 (= e!43156 Unit!1814)))

(declare-fun b!65771 () Bool)

(assert (=> b!65771 (= e!43157 (isDefined!81 (getValueByKey!127 (toList!704 lt!28080) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355))))))

(assert (= (and d!13589 c!8997) b!65769))

(assert (= (and d!13589 (not c!8997)) b!65770))

(assert (= (and d!13589 (not res!35694)) b!65771))

(assert (=> d!13589 m!60045))

(declare-fun m!60203 () Bool)

(assert (=> d!13589 m!60203))

(assert (=> b!65769 m!60045))

(declare-fun m!60205 () Bool)

(assert (=> b!65769 m!60205))

(assert (=> b!65769 m!60045))

(declare-fun m!60207 () Bool)

(assert (=> b!65769 m!60207))

(assert (=> b!65769 m!60207))

(declare-fun m!60209 () Bool)

(assert (=> b!65769 m!60209))

(assert (=> b!65771 m!60045))

(assert (=> b!65771 m!60207))

(assert (=> b!65771 m!60207))

(assert (=> b!65771 m!60209))

(assert (=> b!65629 d!13589))

(declare-fun bm!5398 () Bool)

(declare-datatypes ((SeekEntryResult!235 0))(
  ( (MissingZero!235 (index!3068 (_ BitVec 32))) (Found!235 (index!3069 (_ BitVec 32))) (Intermediate!235 (undefined!1047 Bool) (index!3070 (_ BitVec 32)) (x!10663 (_ BitVec 32))) (Undefined!235) (MissingVacant!235 (index!3071 (_ BitVec 32))) )
))
(declare-fun call!5423 () SeekEntryResult!235)

(declare-fun call!5424 () SeekEntryResult!235)

(assert (=> bm!5398 (= call!5423 call!5424)))

(declare-fun b!65852 () Bool)

(declare-fun res!35733 () Bool)

(declare-fun e!43215 () Bool)

(assert (=> b!65852 (=> (not res!35733) (not e!43215))))

(declare-fun lt!28238 () SeekEntryResult!235)

(assert (=> b!65852 (= res!35733 (= (select (arr!1816 (_keys!3779 newMap!16)) (index!3068 lt!28238)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65853 () Bool)

(declare-fun e!43210 () tuple2!2078)

(declare-fun e!43209 () tuple2!2078)

(assert (=> b!65853 (= e!43210 e!43209)))

(declare-fun c!9025 () Bool)

(assert (=> b!65853 (= c!9025 (= (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65854 () Bool)

(declare-fun res!35736 () Bool)

(declare-fun call!5403 () Bool)

(assert (=> b!65854 (= res!35736 call!5403)))

(declare-fun e!43212 () Bool)

(assert (=> b!65854 (=> (not res!35736) (not e!43212))))

(declare-fun b!65855 () Bool)

(declare-fun e!43208 () Bool)

(declare-fun e!43205 () Bool)

(assert (=> b!65855 (= e!43208 e!43205)))

(declare-fun res!35729 () Bool)

(declare-fun call!5408 () Bool)

(assert (=> b!65855 (= res!35729 call!5408)))

(assert (=> b!65855 (=> (not res!35729) (not e!43205))))

(declare-fun b!65856 () Bool)

(declare-fun call!5419 () ListLongMap!1377)

(declare-fun call!5402 () ListLongMap!1377)

(declare-fun e!43213 () Bool)

(assert (=> b!65856 (= e!43213 (= call!5419 (+!86 call!5402 (tuple2!2077 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) lt!28085))))))

(declare-fun c!9034 () Bool)

(declare-fun bm!5399 () Bool)

(declare-fun lt!28242 () SeekEntryResult!235)

(declare-fun call!5418 () tuple2!2078)

(declare-fun updateHelperNewKey!20 (LongMapFixedSize!664 (_ BitVec 64) V!2905 (_ BitVec 32)) tuple2!2078)

(assert (=> bm!5399 (= call!5418 (updateHelperNewKey!20 newMap!16 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) lt!28085 (ite c!9034 (index!3071 lt!28242) (index!3068 lt!28242))))))

(declare-fun bm!5400 () Bool)

(declare-fun call!5414 () SeekEntryResult!235)

(assert (=> bm!5400 (= call!5414 call!5424)))

(declare-fun b!65857 () Bool)

(declare-fun res!35734 () Bool)

(declare-fun e!43218 () Bool)

(assert (=> b!65857 (=> (not res!35734) (not e!43218))))

(declare-fun lt!28240 () SeekEntryResult!235)

(assert (=> b!65857 (= res!35734 (= (select (arr!1816 (_keys!3779 newMap!16)) (index!3068 lt!28240)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5401 () Bool)

(declare-fun call!5411 () Bool)

(declare-fun call!5415 () Bool)

(assert (=> bm!5401 (= call!5411 call!5415)))

(declare-fun b!65858 () Bool)

(declare-fun e!43203 () ListLongMap!1377)

(declare-fun call!5412 () ListLongMap!1377)

(assert (=> b!65858 (= e!43203 call!5412)))

(declare-fun bm!5402 () Bool)

(declare-fun lt!28234 () tuple2!2078)

(assert (=> bm!5402 (= call!5419 (map!1130 (_2!1050 lt!28234)))))

(declare-fun bm!5403 () Bool)

(declare-fun call!5422 () ListLongMap!1377)

(declare-fun call!5420 () ListLongMap!1377)

(declare-fun c!9033 () Bool)

(declare-fun call!5409 () ListLongMap!1377)

(declare-fun call!5401 () ListLongMap!1377)

(assert (=> bm!5403 (= call!5422 (+!86 (ite c!9033 (ite c!9025 call!5401 call!5409) call!5420) (ite c!9033 (ite c!9025 (tuple2!2077 #b0000000000000000000000000000000000000000000000000000000000000000 lt!28085) (tuple2!2077 #b1000000000000000000000000000000000000000000000000000000000000000 lt!28085)) (tuple2!2077 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) lt!28085))))))

(declare-fun b!65859 () Bool)

(declare-fun e!43201 () Unit!1806)

(declare-fun Unit!1815 () Unit!1806)

(assert (=> b!65859 (= e!43201 Unit!1815)))

(declare-fun lt!28239 () Unit!1806)

(declare-fun call!5406 () Unit!1806)

(assert (=> b!65859 (= lt!28239 call!5406)))

(assert (=> b!65859 (= lt!28240 call!5423)))

(declare-fun c!9035 () Bool)

(assert (=> b!65859 (= c!9035 ((_ is MissingZero!235) lt!28240))))

(declare-fun e!43206 () Bool)

(assert (=> b!65859 e!43206))

(declare-fun lt!28225 () Unit!1806)

(assert (=> b!65859 (= lt!28225 lt!28239)))

(assert (=> b!65859 false))

(declare-fun bm!5404 () Bool)

(declare-fun call!5404 () ListLongMap!1377)

(assert (=> bm!5404 (= call!5404 call!5422)))

(declare-fun b!65860 () Bool)

(assert (=> b!65860 (= c!9034 ((_ is MissingVacant!235) lt!28242))))

(declare-fun e!43220 () tuple2!2078)

(declare-fun e!43216 () tuple2!2078)

(assert (=> b!65860 (= e!43220 e!43216)))

(declare-fun bm!5405 () Bool)

(declare-fun c!9031 () Bool)

(declare-fun c!9029 () Bool)

(assert (=> bm!5405 (= c!9031 c!9029)))

(declare-fun call!5421 () Bool)

(assert (=> bm!5405 (= call!5421 (contains!702 e!43203 (ite c!9029 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (select (arr!1816 (_keys!3779 newMap!16)) (index!3069 lt!28242)))))))

(declare-fun bm!5406 () Bool)

(declare-fun call!5413 () Bool)

(declare-fun call!5417 () Bool)

(assert (=> bm!5406 (= call!5413 call!5417)))

(declare-fun b!65861 () Bool)

(declare-fun e!43214 () Bool)

(assert (=> b!65861 (= e!43214 e!43213)))

(declare-fun res!35723 () Bool)

(assert (=> b!65861 (= res!35723 (contains!702 call!5419 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355)))))

(assert (=> b!65861 (=> (not res!35723) (not e!43213))))

(declare-fun b!65862 () Bool)

(declare-fun lt!28237 () Unit!1806)

(assert (=> b!65862 (= e!43201 lt!28237)))

(declare-fun call!5410 () Unit!1806)

(assert (=> b!65862 (= lt!28237 call!5410)))

(declare-fun lt!28246 () SeekEntryResult!235)

(assert (=> b!65862 (= lt!28246 call!5423)))

(declare-fun res!35724 () Bool)

(assert (=> b!65862 (= res!35724 ((_ is Found!235) lt!28246))))

(declare-fun e!43211 () Bool)

(assert (=> b!65862 (=> (not res!35724) (not e!43211))))

(assert (=> b!65862 e!43211))

(declare-fun b!65863 () Bool)

(assert (=> b!65863 (= e!43214 (= call!5419 call!5402))))

(declare-fun b!65864 () Bool)

(declare-fun res!35732 () Bool)

(assert (=> b!65864 (= res!35732 call!5417)))

(assert (=> b!65864 (=> (not res!35732) (not e!43211))))

(declare-fun b!65865 () Bool)

(assert (=> b!65865 (= e!43215 (not call!5411))))

(declare-fun b!65866 () Bool)

(assert (=> b!65866 (= e!43205 (not call!5411))))

(declare-fun bm!5407 () Bool)

(assert (=> bm!5407 (= call!5408 call!5403)))

(declare-fun b!65867 () Bool)

(declare-fun e!43219 () Bool)

(declare-fun call!5416 () Bool)

(assert (=> b!65867 (= e!43219 (not call!5416))))

(declare-fun b!65868 () Bool)

(declare-fun e!43204 () Bool)

(assert (=> b!65868 (= e!43204 ((_ is Undefined!235) lt!28240))))

(declare-fun b!65869 () Bool)

(declare-fun call!5407 () ListLongMap!1377)

(assert (=> b!65869 (= e!43203 call!5407)))

(declare-fun lt!28231 () SeekEntryResult!235)

(declare-fun b!65870 () Bool)

(assert (=> b!65870 (= e!43212 (= (select (arr!1816 (_keys!3779 newMap!16)) (index!3069 lt!28231)) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355)))))

(declare-fun b!65871 () Bool)

(declare-fun lt!28233 () Unit!1806)

(declare-fun lt!28226 () Unit!1806)

(assert (=> b!65871 (= lt!28233 lt!28226)))

(assert (=> b!65871 call!5421))

(declare-fun lt!28244 () array!3805)

(declare-fun lemmaValidKeyInArrayIsInListMap!79 (array!3803 array!3805 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 32) Int) Unit!1806)

(assert (=> b!65871 (= lt!28226 (lemmaValidKeyInArrayIsInListMap!79 (_keys!3779 newMap!16) lt!28244 (mask!6071 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) (index!3069 lt!28242) (defaultEntry!2140 newMap!16)))))

(assert (=> b!65871 (= lt!28244 (array!3806 (store (arr!1817 (_values!2123 newMap!16)) (index!3069 lt!28242) (ValueCellFull!878 lt!28085)) (size!2053 (_values!2123 newMap!16))))))

(declare-fun lt!28243 () Unit!1806)

(declare-fun lt!28245 () Unit!1806)

(assert (=> b!65871 (= lt!28243 lt!28245)))

(assert (=> b!65871 (= call!5422 call!5412)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!20 (array!3803 array!3805 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 32) (_ BitVec 64) V!2905 Int) Unit!1806)

(assert (=> b!65871 (= lt!28245 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!20 (_keys!3779 newMap!16) (_values!2123 newMap!16) (mask!6071 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) (index!3069 lt!28242) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) lt!28085 (defaultEntry!2140 newMap!16)))))

(declare-fun lt!28232 () Unit!1806)

(assert (=> b!65871 (= lt!28232 e!43201)))

(declare-fun c!9036 () Bool)

(assert (=> b!65871 (= c!9036 (contains!702 call!5420 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355)))))

(declare-fun e!43207 () tuple2!2078)

(assert (=> b!65871 (= e!43207 (tuple2!2079 true (LongMapFixedSize!665 (defaultEntry!2140 newMap!16) (mask!6071 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) (_size!381 newMap!16) (_keys!3779 newMap!16) (array!3806 (store (arr!1817 (_values!2123 newMap!16)) (index!3069 lt!28242) (ValueCellFull!878 lt!28085)) (size!2053 (_values!2123 newMap!16))) (_vacant!381 newMap!16))))))

(declare-fun bm!5408 () Bool)

(assert (=> bm!5408 (= call!5402 (map!1130 newMap!16))))

(declare-fun b!65872 () Bool)

(declare-fun e!43202 () Bool)

(assert (=> b!65872 (= e!43202 e!43214)))

(declare-fun c!9024 () Bool)

(assert (=> b!65872 (= c!9024 (_1!1050 lt!28234))))

(declare-fun bm!5409 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3803 (_ BitVec 32)) SeekEntryResult!235)

(assert (=> bm!5409 (= call!5424 (seekEntryOrOpen!0 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (_keys!3779 newMap!16) (mask!6071 newMap!16)))))

(declare-fun bm!5410 () Bool)

(declare-fun lt!28248 () (_ BitVec 32))

(assert (=> bm!5410 (= call!5407 (getCurrentListMap!400 (_keys!3779 newMap!16) (ite c!9033 (_values!2123 newMap!16) lt!28244) (mask!6071 newMap!16) (ite c!9033 (ite c!9025 (extraKeys!2011 newMap!16) lt!28248) (extraKeys!2011 newMap!16)) (zeroValue!2048 newMap!16) (ite c!9033 (ite c!9025 (minValue!2048 newMap!16) lt!28085) (minValue!2048 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2140 newMap!16)))))

(declare-fun b!65873 () Bool)

(assert (=> b!65873 (= e!43210 e!43220)))

(assert (=> b!65873 (= lt!28242 (seekEntryOrOpen!0 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (_keys!3779 newMap!16) (mask!6071 newMap!16)))))

(assert (=> b!65873 (= c!9029 ((_ is Undefined!235) lt!28242))))

(declare-fun b!65874 () Bool)

(assert (=> b!65874 (= e!43208 ((_ is Undefined!235) lt!28238))))

(declare-fun b!65875 () Bool)

(declare-fun lt!28235 () Unit!1806)

(declare-fun lt!28247 () Unit!1806)

(assert (=> b!65875 (= lt!28235 lt!28247)))

(assert (=> b!65875 (= call!5404 call!5401)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!20 (array!3803 array!3805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 V!2905 Int) Unit!1806)

(assert (=> b!65875 (= lt!28247 (lemmaChangeLongMinValueKeyThenAddPairToListMap!20 (_keys!3779 newMap!16) (_values!2123 newMap!16) (mask!6071 newMap!16) (extraKeys!2011 newMap!16) lt!28248 (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) lt!28085 (defaultEntry!2140 newMap!16)))))

(assert (=> b!65875 (= lt!28248 (bvor (extraKeys!2011 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!65875 (= e!43209 (tuple2!2079 true (LongMapFixedSize!665 (defaultEntry!2140 newMap!16) (mask!6071 newMap!16) (bvor (extraKeys!2011 newMap!16) #b00000000000000000000000000000010) (zeroValue!2048 newMap!16) lt!28085 (_size!381 newMap!16) (_keys!3779 newMap!16) (_values!2123 newMap!16) (_vacant!381 newMap!16))))))

(declare-fun b!65876 () Bool)

(declare-fun lt!28228 () Unit!1806)

(declare-fun lt!28251 () Unit!1806)

(assert (=> b!65876 (= lt!28228 lt!28251)))

(assert (=> b!65876 (= call!5404 call!5409)))

(declare-fun lt!28236 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!20 (array!3803 array!3805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 V!2905 Int) Unit!1806)

(assert (=> b!65876 (= lt!28251 (lemmaChangeZeroKeyThenAddPairToListMap!20 (_keys!3779 newMap!16) (_values!2123 newMap!16) (mask!6071 newMap!16) (extraKeys!2011 newMap!16) lt!28236 (zeroValue!2048 newMap!16) lt!28085 (minValue!2048 newMap!16) (defaultEntry!2140 newMap!16)))))

(assert (=> b!65876 (= lt!28236 (bvor (extraKeys!2011 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!65876 (= e!43209 (tuple2!2079 true (LongMapFixedSize!665 (defaultEntry!2140 newMap!16) (mask!6071 newMap!16) (bvor (extraKeys!2011 newMap!16) #b00000000000000000000000000000001) lt!28085 (minValue!2048 newMap!16) (_size!381 newMap!16) (_keys!3779 newMap!16) (_values!2123 newMap!16) (_vacant!381 newMap!16))))))

(declare-fun d!13591 () Bool)

(assert (=> d!13591 e!43202))

(declare-fun res!35727 () Bool)

(assert (=> d!13591 (=> (not res!35727) (not e!43202))))

(assert (=> d!13591 (= res!35727 (valid!285 (_2!1050 lt!28234)))))

(assert (=> d!13591 (= lt!28234 e!43210)))

(assert (=> d!13591 (= c!9033 (= (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (bvneg (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355))))))

(assert (=> d!13591 (valid!285 newMap!16)))

(assert (=> d!13591 (= (update!94 newMap!16 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) lt!28085) lt!28234)))

(declare-fun b!65877 () Bool)

(declare-fun e!43217 () Unit!1806)

(declare-fun lt!28227 () Unit!1806)

(assert (=> b!65877 (= e!43217 lt!28227)))

(assert (=> b!65877 (= lt!28227 call!5406)))

(assert (=> b!65877 (= lt!28238 call!5414)))

(declare-fun c!9032 () Bool)

(assert (=> b!65877 (= c!9032 ((_ is MissingZero!235) lt!28238))))

(declare-fun e!43200 () Bool)

(assert (=> b!65877 e!43200))

(declare-fun b!65878 () Bool)

(declare-fun c!9027 () Bool)

(assert (=> b!65878 (= c!9027 ((_ is MissingVacant!235) lt!28240))))

(assert (=> b!65878 (= e!43206 e!43204)))

(declare-fun b!65879 () Bool)

(declare-fun res!35728 () Bool)

(assert (=> b!65879 (=> (not res!35728) (not e!43215))))

(assert (=> b!65879 (= res!35728 call!5408)))

(assert (=> b!65879 (= e!43200 e!43215)))

(declare-fun bm!5411 () Bool)

(assert (=> bm!5411 (= call!5412 (getCurrentListMap!400 (_keys!3779 newMap!16) (ite c!9029 (_values!2123 newMap!16) (array!3806 (store (arr!1817 (_values!2123 newMap!16)) (index!3069 lt!28242) (ValueCellFull!878 lt!28085)) (size!2053 (_values!2123 newMap!16)))) (mask!6071 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2140 newMap!16)))))

(declare-fun b!65880 () Bool)

(declare-fun c!9028 () Bool)

(assert (=> b!65880 (= c!9028 ((_ is MissingVacant!235) lt!28238))))

(assert (=> b!65880 (= e!43200 e!43208)))

(declare-fun bm!5412 () Bool)

(assert (=> bm!5412 (= call!5409 call!5420)))

(declare-fun bm!5413 () Bool)

(assert (=> bm!5413 (= call!5416 call!5415)))

(declare-fun bm!5414 () Bool)

(declare-fun call!5405 () Bool)

(declare-fun c!9030 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5414 (= call!5405 (inRange!0 (ite c!9029 (ite c!9030 (index!3069 lt!28231) (ite c!9032 (index!3068 lt!28238) (index!3071 lt!28238))) (ite c!9036 (index!3069 lt!28246) (ite c!9035 (index!3068 lt!28240) (index!3071 lt!28240)))) (mask!6071 newMap!16)))))

(declare-fun b!65881 () Bool)

(declare-fun lt!28249 () tuple2!2078)

(assert (=> b!65881 (= e!43216 (tuple2!2079 (_1!1050 lt!28249) (_2!1050 lt!28249)))))

(assert (=> b!65881 (= lt!28249 call!5418)))

(declare-fun bm!5415 () Bool)

(assert (=> bm!5415 (= call!5415 (arrayContainsKey!0 (_keys!3779 newMap!16) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!65882 () Bool)

(declare-fun res!35735 () Bool)

(assert (=> b!65882 (= res!35735 (= (select (arr!1816 (_keys!3779 newMap!16)) (index!3071 lt!28238)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65882 (=> (not res!35735) (not e!43205))))

(declare-fun b!65883 () Bool)

(assert (=> b!65883 (= e!43218 (not call!5416))))

(declare-fun bm!5416 () Bool)

(assert (=> bm!5416 (= call!5420 (getCurrentListMap!400 (_keys!3779 newMap!16) (_values!2123 newMap!16) (mask!6071 newMap!16) (ite (and c!9033 c!9025) lt!28236 (extraKeys!2011 newMap!16)) (ite (and c!9033 c!9025) lt!28085 (zeroValue!2048 newMap!16)) (minValue!2048 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2140 newMap!16)))))

(declare-fun b!65884 () Bool)

(declare-fun lt!28230 () Unit!1806)

(assert (=> b!65884 (= lt!28230 e!43217)))

(assert (=> b!65884 (= c!9030 call!5421)))

(assert (=> b!65884 (= e!43220 (tuple2!2079 false newMap!16))))

(declare-fun bm!5417 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!20 (array!3803 array!3805 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 64) Int) Unit!1806)

(assert (=> bm!5417 (= call!5406 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!20 (_keys!3779 newMap!16) (_values!2123 newMap!16) (mask!6071 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (defaultEntry!2140 newMap!16)))))

(declare-fun b!65885 () Bool)

(assert (=> b!65885 (= e!43204 e!43219)))

(declare-fun res!35726 () Bool)

(assert (=> b!65885 (= res!35726 call!5413)))

(assert (=> b!65885 (=> (not res!35726) (not e!43219))))

(declare-fun bm!5418 () Bool)

(assert (=> bm!5418 (= call!5417 call!5405)))

(declare-fun b!65886 () Bool)

(declare-fun lt!28229 () tuple2!2078)

(assert (=> b!65886 (= lt!28229 call!5418)))

(assert (=> b!65886 (= e!43207 (tuple2!2079 (_1!1050 lt!28229) (_2!1050 lt!28229)))))

(declare-fun bm!5419 () Bool)

(assert (=> bm!5419 (= call!5403 call!5405)))

(declare-fun b!65887 () Bool)

(declare-fun Unit!1816 () Unit!1806)

(assert (=> b!65887 (= e!43217 Unit!1816)))

(declare-fun lt!28241 () Unit!1806)

(assert (=> b!65887 (= lt!28241 call!5410)))

(assert (=> b!65887 (= lt!28231 call!5414)))

(declare-fun res!35725 () Bool)

(assert (=> b!65887 (= res!35725 ((_ is Found!235) lt!28231))))

(assert (=> b!65887 (=> (not res!35725) (not e!43212))))

(assert (=> b!65887 e!43212))

(declare-fun lt!28250 () Unit!1806)

(assert (=> b!65887 (= lt!28250 lt!28241)))

(assert (=> b!65887 false))

(declare-fun b!65888 () Bool)

(declare-fun res!35730 () Bool)

(assert (=> b!65888 (=> (not res!35730) (not e!43218))))

(assert (=> b!65888 (= res!35730 call!5413)))

(assert (=> b!65888 (= e!43206 e!43218)))

(declare-fun bm!5420 () Bool)

(assert (=> bm!5420 (= call!5401 call!5407)))

(declare-fun bm!5421 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!20 (array!3803 array!3805 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 64) Int) Unit!1806)

(assert (=> bm!5421 (= call!5410 (lemmaInListMapThenSeekEntryOrOpenFindsIt!20 (_keys!3779 newMap!16) (_values!2123 newMap!16) (mask!6071 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (defaultEntry!2140 newMap!16)))))

(declare-fun b!65889 () Bool)

(assert (=> b!65889 (= e!43216 e!43207)))

(declare-fun c!9026 () Bool)

(assert (=> b!65889 (= c!9026 ((_ is MissingZero!235) lt!28242))))

(declare-fun b!65890 () Bool)

(declare-fun res!35731 () Bool)

(assert (=> b!65890 (= res!35731 (= (select (arr!1816 (_keys!3779 newMap!16)) (index!3071 lt!28240)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65890 (=> (not res!35731) (not e!43219))))

(declare-fun b!65891 () Bool)

(assert (=> b!65891 (= e!43211 (= (select (arr!1816 (_keys!3779 newMap!16)) (index!3069 lt!28246)) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355)))))

(assert (= (and d!13591 c!9033) b!65853))

(assert (= (and d!13591 (not c!9033)) b!65873))

(assert (= (and b!65853 c!9025) b!65876))

(assert (= (and b!65853 (not c!9025)) b!65875))

(assert (= (or b!65876 b!65875) bm!5412))

(assert (= (or b!65876 b!65875) bm!5420))

(assert (= (or b!65876 b!65875) bm!5404))

(assert (= (and b!65873 c!9029) b!65884))

(assert (= (and b!65873 (not c!9029)) b!65860))

(assert (= (and b!65884 c!9030) b!65887))

(assert (= (and b!65884 (not c!9030)) b!65877))

(assert (= (and b!65887 res!35725) b!65854))

(assert (= (and b!65854 res!35736) b!65870))

(assert (= (and b!65877 c!9032) b!65879))

(assert (= (and b!65877 (not c!9032)) b!65880))

(assert (= (and b!65879 res!35728) b!65852))

(assert (= (and b!65852 res!35733) b!65865))

(assert (= (and b!65880 c!9028) b!65855))

(assert (= (and b!65880 (not c!9028)) b!65874))

(assert (= (and b!65855 res!35729) b!65882))

(assert (= (and b!65882 res!35735) b!65866))

(assert (= (or b!65879 b!65855) bm!5407))

(assert (= (or b!65865 b!65866) bm!5401))

(assert (= (or b!65854 bm!5407) bm!5419))

(assert (= (or b!65887 b!65877) bm!5400))

(assert (= (and b!65860 c!9034) b!65881))

(assert (= (and b!65860 (not c!9034)) b!65889))

(assert (= (and b!65889 c!9026) b!65886))

(assert (= (and b!65889 (not c!9026)) b!65871))

(assert (= (and b!65871 c!9036) b!65862))

(assert (= (and b!65871 (not c!9036)) b!65859))

(assert (= (and b!65862 res!35724) b!65864))

(assert (= (and b!65864 res!35732) b!65891))

(assert (= (and b!65859 c!9035) b!65888))

(assert (= (and b!65859 (not c!9035)) b!65878))

(assert (= (and b!65888 res!35730) b!65857))

(assert (= (and b!65857 res!35734) b!65883))

(assert (= (and b!65878 c!9027) b!65885))

(assert (= (and b!65878 (not c!9027)) b!65868))

(assert (= (and b!65885 res!35726) b!65890))

(assert (= (and b!65890 res!35731) b!65867))

(assert (= (or b!65888 b!65885) bm!5406))

(assert (= (or b!65883 b!65867) bm!5413))

(assert (= (or b!65864 bm!5406) bm!5418))

(assert (= (or b!65862 b!65859) bm!5398))

(assert (= (or b!65881 b!65886) bm!5399))

(assert (= (or bm!5419 bm!5418) bm!5414))

(assert (= (or b!65884 b!65871) bm!5411))

(assert (= (or b!65877 b!65859) bm!5417))

(assert (= (or bm!5400 bm!5398) bm!5409))

(assert (= (or b!65887 b!65862) bm!5421))

(assert (= (or bm!5401 bm!5413) bm!5415))

(assert (= (or b!65884 b!65871) bm!5405))

(assert (= (and bm!5405 c!9031) b!65858))

(assert (= (and bm!5405 (not c!9031)) b!65869))

(assert (= (or bm!5420 b!65869) bm!5410))

(assert (= (or bm!5412 b!65871) bm!5416))

(assert (= (or bm!5404 b!65871) bm!5403))

(assert (= (and d!13591 res!35727) b!65872))

(assert (= (and b!65872 c!9024) b!65861))

(assert (= (and b!65872 (not c!9024)) b!65863))

(assert (= (and b!65861 res!35723) b!65856))

(assert (= (or b!65856 b!65863) bm!5408))

(assert (= (or b!65861 b!65856 b!65863) bm!5402))

(assert (=> bm!5421 m!60045))

(declare-fun m!60211 () Bool)

(assert (=> bm!5421 m!60211))

(assert (=> b!65873 m!60045))

(declare-fun m!60213 () Bool)

(assert (=> b!65873 m!60213))

(declare-fun m!60215 () Bool)

(assert (=> bm!5411 m!60215))

(declare-fun m!60217 () Bool)

(assert (=> bm!5411 m!60217))

(declare-fun m!60219 () Bool)

(assert (=> b!65891 m!60219))

(declare-fun m!60221 () Bool)

(assert (=> bm!5416 m!60221))

(declare-fun m!60223 () Bool)

(assert (=> b!65882 m!60223))

(assert (=> bm!5409 m!60045))

(assert (=> bm!5409 m!60213))

(declare-fun m!60225 () Bool)

(assert (=> bm!5403 m!60225))

(assert (=> bm!5408 m!60069))

(declare-fun m!60227 () Bool)

(assert (=> bm!5402 m!60227))

(declare-fun m!60229 () Bool)

(assert (=> b!65875 m!60229))

(declare-fun m!60231 () Bool)

(assert (=> bm!5414 m!60231))

(declare-fun m!60233 () Bool)

(assert (=> d!13591 m!60233))

(assert (=> d!13591 m!60065))

(declare-fun m!60235 () Bool)

(assert (=> b!65890 m!60235))

(declare-fun m!60237 () Bool)

(assert (=> b!65870 m!60237))

(assert (=> bm!5399 m!60045))

(declare-fun m!60239 () Bool)

(assert (=> bm!5399 m!60239))

(assert (=> b!65861 m!60045))

(declare-fun m!60241 () Bool)

(assert (=> b!65861 m!60241))

(assert (=> bm!5415 m!60045))

(declare-fun m!60243 () Bool)

(assert (=> bm!5415 m!60243))

(declare-fun m!60245 () Bool)

(assert (=> b!65852 m!60245))

(declare-fun m!60247 () Bool)

(assert (=> bm!5410 m!60247))

(declare-fun m!60249 () Bool)

(assert (=> b!65871 m!60249))

(assert (=> b!65871 m!60215))

(assert (=> b!65871 m!60045))

(declare-fun m!60251 () Bool)

(assert (=> b!65871 m!60251))

(assert (=> b!65871 m!60045))

(declare-fun m!60253 () Bool)

(assert (=> b!65871 m!60253))

(declare-fun m!60255 () Bool)

(assert (=> b!65857 m!60255))

(declare-fun m!60257 () Bool)

(assert (=> b!65856 m!60257))

(declare-fun m!60259 () Bool)

(assert (=> b!65876 m!60259))

(assert (=> bm!5417 m!60045))

(declare-fun m!60261 () Bool)

(assert (=> bm!5417 m!60261))

(declare-fun m!60263 () Bool)

(assert (=> bm!5405 m!60263))

(declare-fun m!60265 () Bool)

(assert (=> bm!5405 m!60265))

(assert (=> b!65629 d!13591))

(declare-fun d!13593 () Bool)

(declare-fun e!43223 () Bool)

(assert (=> d!13593 e!43223))

(declare-fun res!35742 () Bool)

(assert (=> d!13593 (=> (not res!35742) (not e!43223))))

(declare-fun lt!28263 () ListLongMap!1377)

(assert (=> d!13593 (= res!35742 (contains!702 lt!28263 (_1!1049 lt!28081)))))

(declare-fun lt!28261 () List!1463)

(assert (=> d!13593 (= lt!28263 (ListLongMap!1378 lt!28261))))

(declare-fun lt!28262 () Unit!1806)

(declare-fun lt!28260 () Unit!1806)

(assert (=> d!13593 (= lt!28262 lt!28260)))

(assert (=> d!13593 (= (getValueByKey!127 lt!28261 (_1!1049 lt!28081)) (Some!132 (_2!1049 lt!28081)))))

(declare-fun lemmaContainsTupThenGetReturnValue!47 (List!1463 (_ BitVec 64) V!2905) Unit!1806)

(assert (=> d!13593 (= lt!28260 (lemmaContainsTupThenGetReturnValue!47 lt!28261 (_1!1049 lt!28081) (_2!1049 lt!28081)))))

(declare-fun insertStrictlySorted!50 (List!1463 (_ BitVec 64) V!2905) List!1463)

(assert (=> d!13593 (= lt!28261 (insertStrictlySorted!50 (toList!704 lt!28079) (_1!1049 lt!28081) (_2!1049 lt!28081)))))

(assert (=> d!13593 (= (+!86 lt!28079 lt!28081) lt!28263)))

(declare-fun b!65896 () Bool)

(declare-fun res!35741 () Bool)

(assert (=> b!65896 (=> (not res!35741) (not e!43223))))

(assert (=> b!65896 (= res!35741 (= (getValueByKey!127 (toList!704 lt!28263) (_1!1049 lt!28081)) (Some!132 (_2!1049 lt!28081))))))

(declare-fun b!65897 () Bool)

(declare-fun contains!703 (List!1463 tuple2!2076) Bool)

(assert (=> b!65897 (= e!43223 (contains!703 (toList!704 lt!28263) lt!28081))))

(assert (= (and d!13593 res!35742) b!65896))

(assert (= (and b!65896 res!35741) b!65897))

(declare-fun m!60267 () Bool)

(assert (=> d!13593 m!60267))

(declare-fun m!60269 () Bool)

(assert (=> d!13593 m!60269))

(declare-fun m!60271 () Bool)

(assert (=> d!13593 m!60271))

(declare-fun m!60273 () Bool)

(assert (=> d!13593 m!60273))

(declare-fun m!60275 () Bool)

(assert (=> b!65896 m!60275))

(declare-fun m!60277 () Bool)

(assert (=> b!65897 m!60277))

(assert (=> b!65626 d!13593))

(declare-fun d!13595 () Bool)

(declare-fun e!43224 () Bool)

(assert (=> d!13595 e!43224))

(declare-fun res!35744 () Bool)

(assert (=> d!13595 (=> (not res!35744) (not e!43224))))

(declare-fun lt!28267 () ListLongMap!1377)

(assert (=> d!13595 (= res!35744 (contains!702 lt!28267 (_1!1049 lt!28077)))))

(declare-fun lt!28265 () List!1463)

(assert (=> d!13595 (= lt!28267 (ListLongMap!1378 lt!28265))))

(declare-fun lt!28266 () Unit!1806)

(declare-fun lt!28264 () Unit!1806)

(assert (=> d!13595 (= lt!28266 lt!28264)))

(assert (=> d!13595 (= (getValueByKey!127 lt!28265 (_1!1049 lt!28077)) (Some!132 (_2!1049 lt!28077)))))

(assert (=> d!13595 (= lt!28264 (lemmaContainsTupThenGetReturnValue!47 lt!28265 (_1!1049 lt!28077) (_2!1049 lt!28077)))))

(assert (=> d!13595 (= lt!28265 (insertStrictlySorted!50 (toList!704 lt!28079) (_1!1049 lt!28077) (_2!1049 lt!28077)))))

(assert (=> d!13595 (= (+!86 lt!28079 lt!28077) lt!28267)))

(declare-fun b!65898 () Bool)

(declare-fun res!35743 () Bool)

(assert (=> b!65898 (=> (not res!35743) (not e!43224))))

(assert (=> b!65898 (= res!35743 (= (getValueByKey!127 (toList!704 lt!28267) (_1!1049 lt!28077)) (Some!132 (_2!1049 lt!28077))))))

(declare-fun b!65899 () Bool)

(assert (=> b!65899 (= e!43224 (contains!703 (toList!704 lt!28267) lt!28077))))

(assert (= (and d!13595 res!35744) b!65898))

(assert (= (and b!65898 res!35743) b!65899))

(declare-fun m!60279 () Bool)

(assert (=> d!13595 m!60279))

(declare-fun m!60281 () Bool)

(assert (=> d!13595 m!60281))

(declare-fun m!60283 () Bool)

(assert (=> d!13595 m!60283))

(declare-fun m!60285 () Bool)

(assert (=> d!13595 m!60285))

(declare-fun m!60287 () Bool)

(assert (=> b!65898 m!60287))

(declare-fun m!60289 () Bool)

(assert (=> b!65899 m!60289))

(assert (=> b!65626 d!13595))

(declare-fun d!13597 () Bool)

(assert (=> d!13597 (= (validMask!0 (mask!6071 (v!2462 (underlying!242 thiss!992)))) (and (or (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000000111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000001111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000011111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000001111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000011111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000001111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000011111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000000001111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000000011111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000000111111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000001111111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000011111111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000000111111111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000001111111111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000011111111111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000000111111111111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000001111111111111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000011111111111111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000000111111111111111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000001111111111111111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000011111111111111111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00000111111111111111111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00001111111111111111111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00011111111111111111111111111111) (= (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6071 (v!2462 (underlying!242 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!65626 d!13597))

(declare-fun b!65924 () Bool)

(declare-fun e!43241 () Bool)

(declare-fun e!43243 () Bool)

(assert (=> b!65924 (= e!43241 e!43243)))

(assert (=> b!65924 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992))))))))

(declare-fun lt!28282 () ListLongMap!1377)

(declare-fun res!35755 () Bool)

(assert (=> b!65924 (= res!35755 (contains!702 lt!28282 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!65924 (=> (not res!35755) (not e!43243))))

(declare-fun b!65925 () Bool)

(assert (=> b!65925 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992))))))))

(assert (=> b!65925 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2053 (_values!2123 (v!2462 (underlying!242 thiss!992))))))))

(declare-fun apply!71 (ListLongMap!1377 (_ BitVec 64)) V!2905)

(assert (=> b!65925 (= e!43243 (= (apply!71 lt!28282 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1114 (select (arr!1817 (_values!2123 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!318 (defaultEntry!2140 (v!2462 (underlying!242 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!65926 () Bool)

(declare-fun e!43239 () Bool)

(assert (=> b!65926 (= e!43239 e!43241)))

(declare-fun c!9047 () Bool)

(declare-fun e!43245 () Bool)

(assert (=> b!65926 (= c!9047 e!43245)))

(declare-fun res!35754 () Bool)

(assert (=> b!65926 (=> (not res!35754) (not e!43245))))

(assert (=> b!65926 (= res!35754 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992))))))))

(declare-fun d!13599 () Bool)

(assert (=> d!13599 e!43239))

(declare-fun res!35756 () Bool)

(assert (=> d!13599 (=> (not res!35756) (not e!43239))))

(assert (=> d!13599 (= res!35756 (not (contains!702 lt!28282 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!43244 () ListLongMap!1377)

(assert (=> d!13599 (= lt!28282 e!43244)))

(declare-fun c!9048 () Bool)

(assert (=> d!13599 (= c!9048 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992))))))))

(assert (=> d!13599 (validMask!0 (mask!6071 (v!2462 (underlying!242 thiss!992))))))

(assert (=> d!13599 (= (getCurrentListMapNoExtraKeys!50 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (_values!2123 (v!2462 (underlying!242 thiss!992))) (mask!6071 (v!2462 (underlying!242 thiss!992))) (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) (minValue!2048 (v!2462 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992)))) lt!28282)))

(declare-fun b!65927 () Bool)

(declare-fun e!43240 () Bool)

(assert (=> b!65927 (= e!43241 e!43240)))

(declare-fun c!9046 () Bool)

(assert (=> b!65927 (= c!9046 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992))))))))

(declare-fun b!65928 () Bool)

(assert (=> b!65928 (= e!43240 (= lt!28282 (getCurrentListMapNoExtraKeys!50 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (_values!2123 (v!2462 (underlying!242 thiss!992))) (mask!6071 (v!2462 (underlying!242 thiss!992))) (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) (minValue!2048 (v!2462 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992))))))))

(declare-fun bm!5424 () Bool)

(declare-fun call!5427 () ListLongMap!1377)

(assert (=> bm!5424 (= call!5427 (getCurrentListMapNoExtraKeys!50 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (_values!2123 (v!2462 (underlying!242 thiss!992))) (mask!6071 (v!2462 (underlying!242 thiss!992))) (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) (minValue!2048 (v!2462 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992)))))))

(declare-fun b!65929 () Bool)

(assert (=> b!65929 (= e!43244 (ListLongMap!1378 Nil!1460))))

(declare-fun b!65930 () Bool)

(declare-fun lt!28285 () Unit!1806)

(declare-fun lt!28288 () Unit!1806)

(assert (=> b!65930 (= lt!28285 lt!28288)))

(declare-fun lt!28287 () (_ BitVec 64))

(declare-fun lt!28283 () (_ BitVec 64))

(declare-fun lt!28284 () ListLongMap!1377)

(declare-fun lt!28286 () V!2905)

(assert (=> b!65930 (not (contains!702 (+!86 lt!28284 (tuple2!2077 lt!28283 lt!28286)) lt!28287))))

(declare-fun addStillNotContains!21 (ListLongMap!1377 (_ BitVec 64) V!2905 (_ BitVec 64)) Unit!1806)

(assert (=> b!65930 (= lt!28288 (addStillNotContains!21 lt!28284 lt!28283 lt!28286 lt!28287))))

(assert (=> b!65930 (= lt!28287 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!65930 (= lt!28286 (get!1114 (select (arr!1817 (_values!2123 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!318 (defaultEntry!2140 (v!2462 (underlying!242 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65930 (= lt!28283 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!65930 (= lt!28284 call!5427)))

(declare-fun e!43242 () ListLongMap!1377)

(assert (=> b!65930 (= e!43242 (+!86 call!5427 (tuple2!2077 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1114 (select (arr!1817 (_values!2123 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!318 (defaultEntry!2140 (v!2462 (underlying!242 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!65931 () Bool)

(assert (=> b!65931 (= e!43244 e!43242)))

(declare-fun c!9045 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!65931 (= c!9045 (validKeyInArray!0 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!65932 () Bool)

(declare-fun res!35753 () Bool)

(assert (=> b!65932 (=> (not res!35753) (not e!43239))))

(assert (=> b!65932 (= res!35753 (not (contains!702 lt!28282 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!65933 () Bool)

(declare-fun isEmpty!310 (ListLongMap!1377) Bool)

(assert (=> b!65933 (= e!43240 (isEmpty!310 lt!28282))))

(declare-fun b!65934 () Bool)

(assert (=> b!65934 (= e!43245 (validKeyInArray!0 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!65934 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!65935 () Bool)

(assert (=> b!65935 (= e!43242 call!5427)))

(assert (= (and d!13599 c!9048) b!65929))

(assert (= (and d!13599 (not c!9048)) b!65931))

(assert (= (and b!65931 c!9045) b!65930))

(assert (= (and b!65931 (not c!9045)) b!65935))

(assert (= (or b!65930 b!65935) bm!5424))

(assert (= (and d!13599 res!35756) b!65932))

(assert (= (and b!65932 res!35753) b!65926))

(assert (= (and b!65926 res!35754) b!65934))

(assert (= (and b!65926 c!9047) b!65924))

(assert (= (and b!65926 (not c!9047)) b!65927))

(assert (= (and b!65924 res!35755) b!65925))

(assert (= (and b!65927 c!9046) b!65928))

(assert (= (and b!65927 (not c!9046)) b!65933))

(declare-fun b_lambda!2939 () Bool)

(assert (=> (not b_lambda!2939) (not b!65925)))

(assert (=> b!65925 t!4921))

(declare-fun b_and!4057 () Bool)

(assert (= b_and!4037 (and (=> t!4921 result!2547) b_and!4057)))

(assert (=> b!65925 t!4923))

(declare-fun b_and!4059 () Bool)

(assert (= b_and!4039 (and (=> t!4923 result!2551) b_and!4059)))

(declare-fun b_lambda!2941 () Bool)

(assert (=> (not b_lambda!2941) (not b!65930)))

(assert (=> b!65930 t!4921))

(declare-fun b_and!4061 () Bool)

(assert (= b_and!4057 (and (=> t!4921 result!2547) b_and!4061)))

(assert (=> b!65930 t!4923))

(declare-fun b_and!4063 () Bool)

(assert (= b_and!4059 (and (=> t!4923 result!2551) b_and!4063)))

(assert (=> b!65925 m!60077))

(declare-fun m!60291 () Bool)

(assert (=> b!65925 m!60291))

(assert (=> b!65925 m!60291))

(declare-fun m!60293 () Bool)

(assert (=> b!65925 m!60293))

(declare-fun m!60295 () Bool)

(assert (=> b!65925 m!60295))

(assert (=> b!65925 m!60295))

(assert (=> b!65925 m!60077))

(declare-fun m!60297 () Bool)

(assert (=> b!65925 m!60297))

(assert (=> b!65934 m!60291))

(assert (=> b!65934 m!60291))

(declare-fun m!60299 () Bool)

(assert (=> b!65934 m!60299))

(assert (=> b!65924 m!60291))

(assert (=> b!65924 m!60291))

(declare-fun m!60301 () Bool)

(assert (=> b!65924 m!60301))

(declare-fun m!60303 () Bool)

(assert (=> b!65928 m!60303))

(assert (=> b!65931 m!60291))

(assert (=> b!65931 m!60291))

(assert (=> b!65931 m!60299))

(declare-fun m!60305 () Bool)

(assert (=> d!13599 m!60305))

(assert (=> d!13599 m!60051))

(declare-fun m!60307 () Bool)

(assert (=> b!65932 m!60307))

(declare-fun m!60309 () Bool)

(assert (=> b!65933 m!60309))

(assert (=> b!65930 m!60291))

(assert (=> b!65930 m!60077))

(declare-fun m!60311 () Bool)

(assert (=> b!65930 m!60311))

(declare-fun m!60313 () Bool)

(assert (=> b!65930 m!60313))

(declare-fun m!60315 () Bool)

(assert (=> b!65930 m!60315))

(declare-fun m!60317 () Bool)

(assert (=> b!65930 m!60317))

(assert (=> b!65930 m!60311))

(assert (=> b!65930 m!60295))

(assert (=> b!65930 m!60295))

(assert (=> b!65930 m!60077))

(assert (=> b!65930 m!60297))

(assert (=> bm!5424 m!60303))

(assert (=> b!65626 d!13599))

(declare-fun d!13601 () Bool)

(declare-fun e!43246 () Bool)

(assert (=> d!13601 e!43246))

(declare-fun res!35758 () Bool)

(assert (=> d!13601 (=> (not res!35758) (not e!43246))))

(declare-fun lt!28292 () ListLongMap!1377)

(assert (=> d!13601 (= res!35758 (contains!702 lt!28292 (_1!1049 lt!28081)))))

(declare-fun lt!28290 () List!1463)

(assert (=> d!13601 (= lt!28292 (ListLongMap!1378 lt!28290))))

(declare-fun lt!28291 () Unit!1806)

(declare-fun lt!28289 () Unit!1806)

(assert (=> d!13601 (= lt!28291 lt!28289)))

(assert (=> d!13601 (= (getValueByKey!127 lt!28290 (_1!1049 lt!28081)) (Some!132 (_2!1049 lt!28081)))))

(assert (=> d!13601 (= lt!28289 (lemmaContainsTupThenGetReturnValue!47 lt!28290 (_1!1049 lt!28081) (_2!1049 lt!28081)))))

(assert (=> d!13601 (= lt!28290 (insertStrictlySorted!50 (toList!704 (+!86 lt!28079 lt!28077)) (_1!1049 lt!28081) (_2!1049 lt!28081)))))

(assert (=> d!13601 (= (+!86 (+!86 lt!28079 lt!28077) lt!28081) lt!28292)))

(declare-fun b!65936 () Bool)

(declare-fun res!35757 () Bool)

(assert (=> b!65936 (=> (not res!35757) (not e!43246))))

(assert (=> b!65936 (= res!35757 (= (getValueByKey!127 (toList!704 lt!28292) (_1!1049 lt!28081)) (Some!132 (_2!1049 lt!28081))))))

(declare-fun b!65937 () Bool)

(assert (=> b!65937 (= e!43246 (contains!703 (toList!704 lt!28292) lt!28081))))

(assert (= (and d!13601 res!35758) b!65936))

(assert (= (and b!65936 res!35757) b!65937))

(declare-fun m!60319 () Bool)

(assert (=> d!13601 m!60319))

(declare-fun m!60321 () Bool)

(assert (=> d!13601 m!60321))

(declare-fun m!60323 () Bool)

(assert (=> d!13601 m!60323))

(declare-fun m!60325 () Bool)

(assert (=> d!13601 m!60325))

(declare-fun m!60327 () Bool)

(assert (=> b!65936 m!60327))

(declare-fun m!60329 () Bool)

(assert (=> b!65937 m!60329))

(assert (=> b!65626 d!13601))

(declare-fun d!13603 () Bool)

(assert (=> d!13603 (= (+!86 (+!86 lt!28079 (tuple2!2077 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) lt!28085)) (tuple2!2077 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2048 (v!2462 (underlying!242 thiss!992))))) (+!86 (+!86 lt!28079 (tuple2!2077 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2048 (v!2462 (underlying!242 thiss!992))))) (tuple2!2077 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) lt!28085)))))

(declare-fun lt!28295 () Unit!1806)

(declare-fun choose!370 (ListLongMap!1377 (_ BitVec 64) V!2905 (_ BitVec 64) V!2905) Unit!1806)

(assert (=> d!13603 (= lt!28295 (choose!370 lt!28079 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) lt!28085 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2048 (v!2462 (underlying!242 thiss!992)))))))

(assert (=> d!13603 (not (= (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13603 (= (addCommutativeForDiffKeys!5 lt!28079 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) lt!28085 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2048 (v!2462 (underlying!242 thiss!992)))) lt!28295)))

(declare-fun bs!2832 () Bool)

(assert (= bs!2832 d!13603))

(assert (=> bs!2832 m!60045))

(declare-fun m!60331 () Bool)

(assert (=> bs!2832 m!60331))

(declare-fun m!60333 () Bool)

(assert (=> bs!2832 m!60333))

(declare-fun m!60335 () Bool)

(assert (=> bs!2832 m!60335))

(assert (=> bs!2832 m!60333))

(declare-fun m!60337 () Bool)

(assert (=> bs!2832 m!60337))

(declare-fun m!60339 () Bool)

(assert (=> bs!2832 m!60339))

(assert (=> bs!2832 m!60337))

(assert (=> b!65626 d!13603))

(declare-fun d!13605 () Bool)

(declare-fun e!43247 () Bool)

(assert (=> d!13605 e!43247))

(declare-fun res!35760 () Bool)

(assert (=> d!13605 (=> (not res!35760) (not e!43247))))

(declare-fun lt!28299 () ListLongMap!1377)

(assert (=> d!13605 (= res!35760 (contains!702 lt!28299 (_1!1049 lt!28077)))))

(declare-fun lt!28297 () List!1463)

(assert (=> d!13605 (= lt!28299 (ListLongMap!1378 lt!28297))))

(declare-fun lt!28298 () Unit!1806)

(declare-fun lt!28296 () Unit!1806)

(assert (=> d!13605 (= lt!28298 lt!28296)))

(assert (=> d!13605 (= (getValueByKey!127 lt!28297 (_1!1049 lt!28077)) (Some!132 (_2!1049 lt!28077)))))

(assert (=> d!13605 (= lt!28296 (lemmaContainsTupThenGetReturnValue!47 lt!28297 (_1!1049 lt!28077) (_2!1049 lt!28077)))))

(assert (=> d!13605 (= lt!28297 (insertStrictlySorted!50 (toList!704 (+!86 lt!28079 lt!28081)) (_1!1049 lt!28077) (_2!1049 lt!28077)))))

(assert (=> d!13605 (= (+!86 (+!86 lt!28079 lt!28081) lt!28077) lt!28299)))

(declare-fun b!65938 () Bool)

(declare-fun res!35759 () Bool)

(assert (=> b!65938 (=> (not res!35759) (not e!43247))))

(assert (=> b!65938 (= res!35759 (= (getValueByKey!127 (toList!704 lt!28299) (_1!1049 lt!28077)) (Some!132 (_2!1049 lt!28077))))))

(declare-fun b!65939 () Bool)

(assert (=> b!65939 (= e!43247 (contains!703 (toList!704 lt!28299) lt!28077))))

(assert (= (and d!13605 res!35760) b!65938))

(assert (= (and b!65938 res!35759) b!65939))

(declare-fun m!60341 () Bool)

(assert (=> d!13605 m!60341))

(declare-fun m!60343 () Bool)

(assert (=> d!13605 m!60343))

(declare-fun m!60345 () Bool)

(assert (=> d!13605 m!60345))

(declare-fun m!60347 () Bool)

(assert (=> d!13605 m!60347))

(declare-fun m!60349 () Bool)

(assert (=> b!65938 m!60349))

(declare-fun m!60351 () Bool)

(assert (=> b!65939 m!60351))

(assert (=> b!65626 d!13605))

(declare-fun d!13607 () Bool)

(declare-fun c!9051 () Bool)

(assert (=> d!13607 (= c!9051 ((_ is ValueCellFull!878) (select (arr!1817 (_values!2123 (v!2462 (underlying!242 thiss!992)))) from!355)))))

(declare-fun e!43250 () V!2905)

(assert (=> d!13607 (= (get!1114 (select (arr!1817 (_values!2123 (v!2462 (underlying!242 thiss!992)))) from!355) (dynLambda!318 (defaultEntry!2140 (v!2462 (underlying!242 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!43250)))

(declare-fun b!65944 () Bool)

(declare-fun get!1115 (ValueCell!878 V!2905) V!2905)

(assert (=> b!65944 (= e!43250 (get!1115 (select (arr!1817 (_values!2123 (v!2462 (underlying!242 thiss!992)))) from!355) (dynLambda!318 (defaultEntry!2140 (v!2462 (underlying!242 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!65945 () Bool)

(declare-fun get!1116 (ValueCell!878 V!2905) V!2905)

(assert (=> b!65945 (= e!43250 (get!1116 (select (arr!1817 (_values!2123 (v!2462 (underlying!242 thiss!992)))) from!355) (dynLambda!318 (defaultEntry!2140 (v!2462 (underlying!242 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13607 c!9051) b!65944))

(assert (= (and d!13607 (not c!9051)) b!65945))

(assert (=> b!65944 m!60075))

(assert (=> b!65944 m!60077))

(declare-fun m!60353 () Bool)

(assert (=> b!65944 m!60353))

(assert (=> b!65945 m!60075))

(assert (=> b!65945 m!60077))

(declare-fun m!60355 () Bool)

(assert (=> b!65945 m!60355))

(assert (=> b!65640 d!13607))

(declare-fun d!13609 () Bool)

(assert (=> d!13609 (= (map!1130 newMap!16) (getCurrentListMap!400 (_keys!3779 newMap!16) (_values!2123 newMap!16) (mask!6071 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2140 newMap!16)))))

(declare-fun bs!2833 () Bool)

(assert (= bs!2833 d!13609))

(declare-fun m!60357 () Bool)

(assert (=> bs!2833 m!60357))

(assert (=> b!65635 d!13609))

(declare-fun bm!5439 () Bool)

(declare-fun call!5442 () Bool)

(declare-fun lt!28357 () ListLongMap!1377)

(assert (=> bm!5439 (= call!5442 (contains!702 lt!28357 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5440 () Bool)

(declare-fun call!5443 () ListLongMap!1377)

(declare-fun call!5446 () ListLongMap!1377)

(assert (=> bm!5440 (= call!5443 call!5446)))

(declare-fun bm!5441 () Bool)

(declare-fun call!5448 () ListLongMap!1377)

(declare-fun call!5444 () ListLongMap!1377)

(declare-fun call!5445 () ListLongMap!1377)

(declare-fun c!9065 () Bool)

(declare-fun c!9069 () Bool)

(assert (=> bm!5441 (= call!5446 (+!86 (ite c!9065 call!5444 (ite c!9069 call!5445 call!5448)) (ite (or c!9065 c!9069) (tuple2!2077 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2048 (v!2462 (underlying!242 thiss!992)))) (tuple2!2077 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2048 (v!2462 (underlying!242 thiss!992)))))))))

(declare-fun e!43278 () Bool)

(declare-fun b!65988 () Bool)

(assert (=> b!65988 (= e!43278 (= (apply!71 lt!28357 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1114 (select (arr!1817 (_values!2123 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!318 (defaultEntry!2140 (v!2462 (underlying!242 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!65988 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2053 (_values!2123 (v!2462 (underlying!242 thiss!992))))))))

(assert (=> b!65988 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992))))))))

(declare-fun b!65989 () Bool)

(declare-fun c!9067 () Bool)

(assert (=> b!65989 (= c!9067 (and (not (= (bvand (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!43287 () ListLongMap!1377)

(declare-fun e!43279 () ListLongMap!1377)

(assert (=> b!65989 (= e!43287 e!43279)))

(declare-fun b!65990 () Bool)

(declare-fun e!43283 () Bool)

(assert (=> b!65990 (= e!43283 (validKeyInArray!0 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!65991 () Bool)

(declare-fun e!43282 () ListLongMap!1377)

(assert (=> b!65991 (= e!43282 (+!86 call!5446 (tuple2!2077 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2048 (v!2462 (underlying!242 thiss!992))))))))

(declare-fun bm!5442 () Bool)

(assert (=> bm!5442 (= call!5448 call!5445)))

(declare-fun b!65992 () Bool)

(declare-fun e!43289 () Bool)

(declare-fun e!43288 () Bool)

(assert (=> b!65992 (= e!43289 e!43288)))

(declare-fun res!35783 () Bool)

(assert (=> b!65992 (= res!35783 call!5442)))

(assert (=> b!65992 (=> (not res!35783) (not e!43288))))

(declare-fun b!65993 () Bool)

(assert (=> b!65993 (= e!43279 call!5448)))

(declare-fun bm!5443 () Bool)

(declare-fun call!5447 () Bool)

(assert (=> bm!5443 (= call!5447 (contains!702 lt!28357 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65994 () Bool)

(declare-fun e!43285 () Unit!1806)

(declare-fun lt!28355 () Unit!1806)

(assert (=> b!65994 (= e!43285 lt!28355)))

(declare-fun lt!28354 () ListLongMap!1377)

(assert (=> b!65994 (= lt!28354 (getCurrentListMapNoExtraKeys!50 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (_values!2123 (v!2462 (underlying!242 thiss!992))) (mask!6071 (v!2462 (underlying!242 thiss!992))) (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) (minValue!2048 (v!2462 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992)))))))

(declare-fun lt!28365 () (_ BitVec 64))

(assert (=> b!65994 (= lt!28365 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28358 () (_ BitVec 64))

(assert (=> b!65994 (= lt!28358 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!28352 () Unit!1806)

(declare-fun addStillContains!47 (ListLongMap!1377 (_ BitVec 64) V!2905 (_ BitVec 64)) Unit!1806)

(assert (=> b!65994 (= lt!28352 (addStillContains!47 lt!28354 lt!28365 (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) lt!28358))))

(assert (=> b!65994 (contains!702 (+!86 lt!28354 (tuple2!2077 lt!28365 (zeroValue!2048 (v!2462 (underlying!242 thiss!992))))) lt!28358)))

(declare-fun lt!28364 () Unit!1806)

(assert (=> b!65994 (= lt!28364 lt!28352)))

(declare-fun lt!28361 () ListLongMap!1377)

(assert (=> b!65994 (= lt!28361 (getCurrentListMapNoExtraKeys!50 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (_values!2123 (v!2462 (underlying!242 thiss!992))) (mask!6071 (v!2462 (underlying!242 thiss!992))) (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) (minValue!2048 (v!2462 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992)))))))

(declare-fun lt!28363 () (_ BitVec 64))

(assert (=> b!65994 (= lt!28363 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28353 () (_ BitVec 64))

(assert (=> b!65994 (= lt!28353 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!28359 () Unit!1806)

(declare-fun addApplyDifferent!47 (ListLongMap!1377 (_ BitVec 64) V!2905 (_ BitVec 64)) Unit!1806)

(assert (=> b!65994 (= lt!28359 (addApplyDifferent!47 lt!28361 lt!28363 (minValue!2048 (v!2462 (underlying!242 thiss!992))) lt!28353))))

(assert (=> b!65994 (= (apply!71 (+!86 lt!28361 (tuple2!2077 lt!28363 (minValue!2048 (v!2462 (underlying!242 thiss!992))))) lt!28353) (apply!71 lt!28361 lt!28353))))

(declare-fun lt!28362 () Unit!1806)

(assert (=> b!65994 (= lt!28362 lt!28359)))

(declare-fun lt!28345 () ListLongMap!1377)

(assert (=> b!65994 (= lt!28345 (getCurrentListMapNoExtraKeys!50 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (_values!2123 (v!2462 (underlying!242 thiss!992))) (mask!6071 (v!2462 (underlying!242 thiss!992))) (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) (minValue!2048 (v!2462 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992)))))))

(declare-fun lt!28351 () (_ BitVec 64))

(assert (=> b!65994 (= lt!28351 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28360 () (_ BitVec 64))

(assert (=> b!65994 (= lt!28360 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!28347 () Unit!1806)

(assert (=> b!65994 (= lt!28347 (addApplyDifferent!47 lt!28345 lt!28351 (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) lt!28360))))

(assert (=> b!65994 (= (apply!71 (+!86 lt!28345 (tuple2!2077 lt!28351 (zeroValue!2048 (v!2462 (underlying!242 thiss!992))))) lt!28360) (apply!71 lt!28345 lt!28360))))

(declare-fun lt!28348 () Unit!1806)

(assert (=> b!65994 (= lt!28348 lt!28347)))

(declare-fun lt!28349 () ListLongMap!1377)

(assert (=> b!65994 (= lt!28349 (getCurrentListMapNoExtraKeys!50 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (_values!2123 (v!2462 (underlying!242 thiss!992))) (mask!6071 (v!2462 (underlying!242 thiss!992))) (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) (minValue!2048 (v!2462 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992)))))))

(declare-fun lt!28344 () (_ BitVec 64))

(assert (=> b!65994 (= lt!28344 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28346 () (_ BitVec 64))

(assert (=> b!65994 (= lt!28346 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!65994 (= lt!28355 (addApplyDifferent!47 lt!28349 lt!28344 (minValue!2048 (v!2462 (underlying!242 thiss!992))) lt!28346))))

(assert (=> b!65994 (= (apply!71 (+!86 lt!28349 (tuple2!2077 lt!28344 (minValue!2048 (v!2462 (underlying!242 thiss!992))))) lt!28346) (apply!71 lt!28349 lt!28346))))

(declare-fun b!65995 () Bool)

(declare-fun e!43280 () Bool)

(assert (=> b!65995 (= e!43280 e!43278)))

(declare-fun res!35780 () Bool)

(assert (=> b!65995 (=> (not res!35780) (not e!43278))))

(assert (=> b!65995 (= res!35780 (contains!702 lt!28357 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!65995 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992))))))))

(declare-fun b!65996 () Bool)

(declare-fun e!43277 () Bool)

(declare-fun e!43284 () Bool)

(assert (=> b!65996 (= e!43277 e!43284)))

(declare-fun c!9066 () Bool)

(assert (=> b!65996 (= c!9066 (not (= (bvand (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65997 () Bool)

(assert (=> b!65997 (= e!43284 (not call!5447))))

(declare-fun b!65998 () Bool)

(declare-fun res!35784 () Bool)

(assert (=> b!65998 (=> (not res!35784) (not e!43277))))

(assert (=> b!65998 (= res!35784 e!43289)))

(declare-fun c!9068 () Bool)

(assert (=> b!65998 (= c!9068 (not (= (bvand (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!65999 () Bool)

(declare-fun e!43286 () Bool)

(assert (=> b!65999 (= e!43286 (= (apply!71 lt!28357 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2048 (v!2462 (underlying!242 thiss!992)))))))

(declare-fun b!66000 () Bool)

(assert (=> b!66000 (= e!43289 (not call!5442))))

(declare-fun d!13611 () Bool)

(assert (=> d!13611 e!43277))

(declare-fun res!35786 () Bool)

(assert (=> d!13611 (=> (not res!35786) (not e!43277))))

(assert (=> d!13611 (= res!35786 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992))))))))))

(declare-fun lt!28356 () ListLongMap!1377)

(assert (=> d!13611 (= lt!28357 lt!28356)))

(declare-fun lt!28350 () Unit!1806)

(assert (=> d!13611 (= lt!28350 e!43285)))

(declare-fun c!9064 () Bool)

(assert (=> d!13611 (= c!9064 e!43283)))

(declare-fun res!35785 () Bool)

(assert (=> d!13611 (=> (not res!35785) (not e!43283))))

(assert (=> d!13611 (= res!35785 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992))))))))

(assert (=> d!13611 (= lt!28356 e!43282)))

(assert (=> d!13611 (= c!9065 (and (not (= (bvand (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13611 (validMask!0 (mask!6071 (v!2462 (underlying!242 thiss!992))))))

(assert (=> d!13611 (= (getCurrentListMap!400 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (_values!2123 (v!2462 (underlying!242 thiss!992))) (mask!6071 (v!2462 (underlying!242 thiss!992))) (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) (minValue!2048 (v!2462 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992)))) lt!28357)))

(declare-fun b!66001 () Bool)

(declare-fun res!35779 () Bool)

(assert (=> b!66001 (=> (not res!35779) (not e!43277))))

(assert (=> b!66001 (= res!35779 e!43280)))

(declare-fun res!35781 () Bool)

(assert (=> b!66001 (=> res!35781 e!43280)))

(declare-fun e!43281 () Bool)

(assert (=> b!66001 (= res!35781 (not e!43281))))

(declare-fun res!35782 () Bool)

(assert (=> b!66001 (=> (not res!35782) (not e!43281))))

(assert (=> b!66001 (= res!35782 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992))))))))

(declare-fun b!66002 () Bool)

(assert (=> b!66002 (= e!43282 e!43287)))

(assert (=> b!66002 (= c!9069 (and (not (= (bvand (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!66003 () Bool)

(assert (=> b!66003 (= e!43279 call!5443)))

(declare-fun b!66004 () Bool)

(assert (=> b!66004 (= e!43284 e!43286)))

(declare-fun res!35787 () Bool)

(assert (=> b!66004 (= res!35787 call!5447)))

(assert (=> b!66004 (=> (not res!35787) (not e!43286))))

(declare-fun bm!5444 () Bool)

(assert (=> bm!5444 (= call!5445 call!5444)))

(declare-fun b!66005 () Bool)

(assert (=> b!66005 (= e!43281 (validKeyInArray!0 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!66006 () Bool)

(assert (=> b!66006 (= e!43288 (= (apply!71 lt!28357 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2048 (v!2462 (underlying!242 thiss!992)))))))

(declare-fun bm!5445 () Bool)

(assert (=> bm!5445 (= call!5444 (getCurrentListMapNoExtraKeys!50 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (_values!2123 (v!2462 (underlying!242 thiss!992))) (mask!6071 (v!2462 (underlying!242 thiss!992))) (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) (minValue!2048 (v!2462 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992)))))))

(declare-fun b!66007 () Bool)

(assert (=> b!66007 (= e!43287 call!5443)))

(declare-fun b!66008 () Bool)

(declare-fun Unit!1817 () Unit!1806)

(assert (=> b!66008 (= e!43285 Unit!1817)))

(assert (= (and d!13611 c!9065) b!65991))

(assert (= (and d!13611 (not c!9065)) b!66002))

(assert (= (and b!66002 c!9069) b!66007))

(assert (= (and b!66002 (not c!9069)) b!65989))

(assert (= (and b!65989 c!9067) b!66003))

(assert (= (and b!65989 (not c!9067)) b!65993))

(assert (= (or b!66003 b!65993) bm!5442))

(assert (= (or b!66007 bm!5442) bm!5444))

(assert (= (or b!66007 b!66003) bm!5440))

(assert (= (or b!65991 bm!5444) bm!5445))

(assert (= (or b!65991 bm!5440) bm!5441))

(assert (= (and d!13611 res!35785) b!65990))

(assert (= (and d!13611 c!9064) b!65994))

(assert (= (and d!13611 (not c!9064)) b!66008))

(assert (= (and d!13611 res!35786) b!66001))

(assert (= (and b!66001 res!35782) b!66005))

(assert (= (and b!66001 (not res!35781)) b!65995))

(assert (= (and b!65995 res!35780) b!65988))

(assert (= (and b!66001 res!35779) b!65998))

(assert (= (and b!65998 c!9068) b!65992))

(assert (= (and b!65998 (not c!9068)) b!66000))

(assert (= (and b!65992 res!35783) b!66006))

(assert (= (or b!65992 b!66000) bm!5439))

(assert (= (and b!65998 res!35784) b!65996))

(assert (= (and b!65996 c!9066) b!66004))

(assert (= (and b!65996 (not c!9066)) b!65997))

(assert (= (and b!66004 res!35787) b!65999))

(assert (= (or b!66004 b!65997) bm!5443))

(declare-fun b_lambda!2943 () Bool)

(assert (=> (not b_lambda!2943) (not b!65988)))

(assert (=> b!65988 t!4921))

(declare-fun b_and!4065 () Bool)

(assert (= b_and!4061 (and (=> t!4921 result!2547) b_and!4065)))

(assert (=> b!65988 t!4923))

(declare-fun b_and!4067 () Bool)

(assert (= b_and!4063 (and (=> t!4923 result!2551) b_and!4067)))

(declare-fun m!60359 () Bool)

(assert (=> bm!5441 m!60359))

(assert (=> b!65994 m!60063))

(declare-fun m!60361 () Bool)

(assert (=> b!65994 m!60361))

(declare-fun m!60363 () Bool)

(assert (=> b!65994 m!60363))

(declare-fun m!60365 () Bool)

(assert (=> b!65994 m!60365))

(declare-fun m!60367 () Bool)

(assert (=> b!65994 m!60367))

(declare-fun m!60369 () Bool)

(assert (=> b!65994 m!60369))

(declare-fun m!60371 () Bool)

(assert (=> b!65994 m!60371))

(declare-fun m!60373 () Bool)

(assert (=> b!65994 m!60373))

(declare-fun m!60375 () Bool)

(assert (=> b!65994 m!60375))

(assert (=> b!65994 m!60361))

(declare-fun m!60377 () Bool)

(assert (=> b!65994 m!60377))

(declare-fun m!60379 () Bool)

(assert (=> b!65994 m!60379))

(assert (=> b!65994 m!60367))

(declare-fun m!60381 () Bool)

(assert (=> b!65994 m!60381))

(declare-fun m!60383 () Bool)

(assert (=> b!65994 m!60383))

(assert (=> b!65994 m!60291))

(declare-fun m!60385 () Bool)

(assert (=> b!65994 m!60385))

(declare-fun m!60387 () Bool)

(assert (=> b!65994 m!60387))

(assert (=> b!65994 m!60387))

(declare-fun m!60389 () Bool)

(assert (=> b!65994 m!60389))

(assert (=> b!65994 m!60363))

(assert (=> b!66005 m!60291))

(assert (=> b!66005 m!60291))

(assert (=> b!66005 m!60299))

(assert (=> b!65995 m!60291))

(assert (=> b!65995 m!60291))

(declare-fun m!60391 () Bool)

(assert (=> b!65995 m!60391))

(assert (=> bm!5445 m!60063))

(assert (=> b!65988 m!60291))

(assert (=> b!65988 m!60295))

(assert (=> b!65988 m!60077))

(assert (=> b!65988 m!60297))

(assert (=> b!65988 m!60291))

(declare-fun m!60393 () Bool)

(assert (=> b!65988 m!60393))

(assert (=> b!65988 m!60295))

(assert (=> b!65988 m!60077))

(declare-fun m!60395 () Bool)

(assert (=> b!65991 m!60395))

(declare-fun m!60397 () Bool)

(assert (=> b!65999 m!60397))

(declare-fun m!60399 () Bool)

(assert (=> b!66006 m!60399))

(declare-fun m!60401 () Bool)

(assert (=> bm!5439 m!60401))

(assert (=> b!65990 m!60291))

(assert (=> b!65990 m!60291))

(assert (=> b!65990 m!60299))

(assert (=> d!13611 m!60051))

(declare-fun m!60403 () Bool)

(assert (=> bm!5443 m!60403))

(assert (=> b!65635 d!13611))

(declare-fun d!13613 () Bool)

(assert (=> d!13613 (not (arrayContainsKey!0 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!28368 () Unit!1806)

(declare-fun choose!68 (array!3803 (_ BitVec 32) (_ BitVec 64) List!1464) Unit!1806)

(assert (=> d!13613 (= lt!28368 (choose!68 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (Cons!1460 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) Nil!1461)))))

(assert (=> d!13613 (bvslt (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13613 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (Cons!1460 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) Nil!1461)) lt!28368)))

(declare-fun bs!2834 () Bool)

(assert (= bs!2834 d!13613))

(assert (=> bs!2834 m!60045))

(assert (=> bs!2834 m!60087))

(assert (=> bs!2834 m!60045))

(declare-fun m!60405 () Bool)

(assert (=> bs!2834 m!60405))

(assert (=> b!65631 d!13613))

(declare-fun d!13615 () Bool)

(assert (=> d!13615 (arrayNoDuplicates!0 (_keys!3779 (v!2462 (underlying!242 thiss!992))) from!355 Nil!1461)))

(declare-fun lt!28371 () Unit!1806)

(declare-fun choose!39 (array!3803 (_ BitVec 32) (_ BitVec 32)) Unit!1806)

(assert (=> d!13615 (= lt!28371 (choose!39 (_keys!3779 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!13615 (bvslt (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13615 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3779 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000000000 from!355) lt!28371)))

(declare-fun bs!2835 () Bool)

(assert (= bs!2835 d!13615))

(assert (=> bs!2835 m!60083))

(declare-fun m!60407 () Bool)

(assert (=> bs!2835 m!60407))

(assert (=> b!65631 d!13615))

(declare-fun d!13617 () Bool)

(declare-fun res!35792 () Bool)

(declare-fun e!43294 () Bool)

(assert (=> d!13617 (=> res!35792 e!43294)))

(assert (=> d!13617 (= res!35792 (= (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355)))))

(assert (=> d!13617 (= (arrayContainsKey!0 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!43294)))

(declare-fun b!66013 () Bool)

(declare-fun e!43295 () Bool)

(assert (=> b!66013 (= e!43294 e!43295)))

(declare-fun res!35793 () Bool)

(assert (=> b!66013 (=> (not res!35793) (not e!43295))))

(assert (=> b!66013 (= res!35793 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992))))))))

(declare-fun b!66014 () Bool)

(assert (=> b!66014 (= e!43295 (arrayContainsKey!0 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!13617 (not res!35792)) b!66013))

(assert (= (and b!66013 res!35793) b!66014))

(assert (=> d!13617 m!60291))

(assert (=> b!66014 m!60045))

(declare-fun m!60409 () Bool)

(assert (=> b!66014 m!60409))

(assert (=> b!65631 d!13617))

(declare-fun d!13619 () Bool)

(declare-fun e!43298 () Bool)

(assert (=> d!13619 e!43298))

(declare-fun c!9072 () Bool)

(assert (=> d!13619 (= c!9072 (and (not (= (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!28374 () Unit!1806)

(declare-fun choose!371 (array!3803 array!3805 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 64) (_ BitVec 32) Int) Unit!1806)

(assert (=> d!13619 (= lt!28374 (choose!371 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (_values!2123 (v!2462 (underlying!242 thiss!992))) (mask!6071 (v!2462 (underlying!242 thiss!992))) (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) (minValue!2048 (v!2462 (underlying!242 thiss!992))) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992)))))))

(assert (=> d!13619 (validMask!0 (mask!6071 (v!2462 (underlying!242 thiss!992))))))

(assert (=> d!13619 (= (lemmaListMapContainsThenArrayContainsFrom!41 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (_values!2123 (v!2462 (underlying!242 thiss!992))) (mask!6071 (v!2462 (underlying!242 thiss!992))) (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) (zeroValue!2048 (v!2462 (underlying!242 thiss!992))) (minValue!2048 (v!2462 (underlying!242 thiss!992))) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992)))) lt!28374)))

(declare-fun b!66019 () Bool)

(assert (=> b!66019 (= e!43298 (arrayContainsKey!0 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!66020 () Bool)

(assert (=> b!66020 (= e!43298 (ite (= (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2011 (v!2462 (underlying!242 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!13619 c!9072) b!66019))

(assert (= (and d!13619 (not c!9072)) b!66020))

(assert (=> d!13619 m!60045))

(declare-fun m!60411 () Bool)

(assert (=> d!13619 m!60411))

(assert (=> d!13619 m!60051))

(assert (=> b!66019 m!60045))

(assert (=> b!66019 m!60087))

(assert (=> b!65631 d!13619))

(declare-fun b!66031 () Bool)

(declare-fun e!43310 () Bool)

(declare-fun call!5451 () Bool)

(assert (=> b!66031 (= e!43310 call!5451)))

(declare-fun b!66032 () Bool)

(declare-fun e!43308 () Bool)

(declare-fun contains!704 (List!1464 (_ BitVec 64)) Bool)

(assert (=> b!66032 (= e!43308 (contains!704 Nil!1461 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355)))))

(declare-fun d!13621 () Bool)

(declare-fun res!35802 () Bool)

(declare-fun e!43309 () Bool)

(assert (=> d!13621 (=> res!35802 e!43309)))

(assert (=> d!13621 (= res!35802 (bvsge from!355 (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992))))))))

(assert (=> d!13621 (= (arrayNoDuplicates!0 (_keys!3779 (v!2462 (underlying!242 thiss!992))) from!355 Nil!1461) e!43309)))

(declare-fun b!66033 () Bool)

(assert (=> b!66033 (= e!43310 call!5451)))

(declare-fun c!9075 () Bool)

(declare-fun bm!5448 () Bool)

(assert (=> bm!5448 (= call!5451 (arrayNoDuplicates!0 (_keys!3779 (v!2462 (underlying!242 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!9075 (Cons!1460 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355) Nil!1461) Nil!1461)))))

(declare-fun b!66034 () Bool)

(declare-fun e!43307 () Bool)

(assert (=> b!66034 (= e!43309 e!43307)))

(declare-fun res!35800 () Bool)

(assert (=> b!66034 (=> (not res!35800) (not e!43307))))

(assert (=> b!66034 (= res!35800 (not e!43308))))

(declare-fun res!35801 () Bool)

(assert (=> b!66034 (=> (not res!35801) (not e!43308))))

(assert (=> b!66034 (= res!35801 (validKeyInArray!0 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355)))))

(declare-fun b!66035 () Bool)

(assert (=> b!66035 (= e!43307 e!43310)))

(assert (=> b!66035 (= c!9075 (validKeyInArray!0 (select (arr!1816 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) from!355)))))

(assert (= (and d!13621 (not res!35802)) b!66034))

(assert (= (and b!66034 res!35801) b!66032))

(assert (= (and b!66034 res!35800) b!66035))

(assert (= (and b!66035 c!9075) b!66031))

(assert (= (and b!66035 (not c!9075)) b!66033))

(assert (= (or b!66031 b!66033) bm!5448))

(assert (=> b!66032 m!60045))

(assert (=> b!66032 m!60045))

(declare-fun m!60413 () Bool)

(assert (=> b!66032 m!60413))

(assert (=> bm!5448 m!60045))

(declare-fun m!60415 () Bool)

(assert (=> bm!5448 m!60415))

(assert (=> b!66034 m!60045))

(assert (=> b!66034 m!60045))

(declare-fun m!60417 () Bool)

(assert (=> b!66034 m!60417))

(assert (=> b!66035 m!60045))

(assert (=> b!66035 m!60045))

(assert (=> b!66035 m!60417))

(assert (=> b!65631 d!13621))

(declare-fun d!13623 () Bool)

(assert (=> d!13623 (= (array_inv!1133 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) (bvsge (size!2052 (_keys!3779 (v!2462 (underlying!242 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!65636 d!13623))

(declare-fun d!13625 () Bool)

(assert (=> d!13625 (= (array_inv!1134 (_values!2123 (v!2462 (underlying!242 thiss!992)))) (bvsge (size!2053 (_values!2123 (v!2462 (underlying!242 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!65636 d!13625))

(declare-fun d!13627 () Bool)

(declare-fun res!35809 () Bool)

(declare-fun e!43313 () Bool)

(assert (=> d!13627 (=> (not res!35809) (not e!43313))))

(declare-fun simpleValid!47 (LongMapFixedSize!664) Bool)

(assert (=> d!13627 (= res!35809 (simpleValid!47 newMap!16))))

(assert (=> d!13627 (= (valid!285 newMap!16) e!43313)))

(declare-fun b!66042 () Bool)

(declare-fun res!35810 () Bool)

(assert (=> b!66042 (=> (not res!35810) (not e!43313))))

(declare-fun arrayCountValidKeys!0 (array!3803 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!66042 (= res!35810 (= (arrayCountValidKeys!0 (_keys!3779 newMap!16) #b00000000000000000000000000000000 (size!2052 (_keys!3779 newMap!16))) (_size!381 newMap!16)))))

(declare-fun b!66043 () Bool)

(declare-fun res!35811 () Bool)

(assert (=> b!66043 (=> (not res!35811) (not e!43313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3803 (_ BitVec 32)) Bool)

(assert (=> b!66043 (= res!35811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3779 newMap!16) (mask!6071 newMap!16)))))

(declare-fun b!66044 () Bool)

(assert (=> b!66044 (= e!43313 (arrayNoDuplicates!0 (_keys!3779 newMap!16) #b00000000000000000000000000000000 Nil!1461))))

(assert (= (and d!13627 res!35809) b!66042))

(assert (= (and b!66042 res!35810) b!66043))

(assert (= (and b!66043 res!35811) b!66044))

(declare-fun m!60419 () Bool)

(assert (=> d!13627 m!60419))

(declare-fun m!60421 () Bool)

(assert (=> b!66042 m!60421))

(declare-fun m!60423 () Bool)

(assert (=> b!66043 m!60423))

(declare-fun m!60425 () Bool)

(assert (=> b!66044 m!60425))

(assert (=> b!65627 d!13627))

(declare-fun d!13629 () Bool)

(assert (=> d!13629 (= (valid!284 thiss!992) (valid!285 (v!2462 (underlying!242 thiss!992))))))

(declare-fun bs!2836 () Bool)

(assert (= bs!2836 d!13629))

(declare-fun m!60427 () Bool)

(assert (=> bs!2836 m!60427))

(assert (=> start!9222 d!13629))

(declare-fun mapIsEmpty!3063 () Bool)

(declare-fun mapRes!3063 () Bool)

(assert (=> mapIsEmpty!3063 mapRes!3063))

(declare-fun condMapEmpty!3063 () Bool)

(declare-fun mapDefault!3063 () ValueCell!878)

(assert (=> mapNonEmpty!3047 (= condMapEmpty!3063 (= mapRest!3048 ((as const (Array (_ BitVec 32) ValueCell!878)) mapDefault!3063)))))

(declare-fun e!43318 () Bool)

(assert (=> mapNonEmpty!3047 (= tp!8309 (and e!43318 mapRes!3063))))

(declare-fun b!66051 () Bool)

(declare-fun e!43319 () Bool)

(assert (=> b!66051 (= e!43319 tp_is_empty!2443)))

(declare-fun mapNonEmpty!3063 () Bool)

(declare-fun tp!8337 () Bool)

(assert (=> mapNonEmpty!3063 (= mapRes!3063 (and tp!8337 e!43319))))

(declare-fun mapValue!3063 () ValueCell!878)

(declare-fun mapKey!3063 () (_ BitVec 32))

(declare-fun mapRest!3063 () (Array (_ BitVec 32) ValueCell!878))

(assert (=> mapNonEmpty!3063 (= mapRest!3048 (store mapRest!3063 mapKey!3063 mapValue!3063))))

(declare-fun b!66052 () Bool)

(assert (=> b!66052 (= e!43318 tp_is_empty!2443)))

(assert (= (and mapNonEmpty!3047 condMapEmpty!3063) mapIsEmpty!3063))

(assert (= (and mapNonEmpty!3047 (not condMapEmpty!3063)) mapNonEmpty!3063))

(assert (= (and mapNonEmpty!3063 ((_ is ValueCellFull!878) mapValue!3063)) b!66051))

(assert (= (and mapNonEmpty!3047 ((_ is ValueCellFull!878) mapDefault!3063)) b!66052))

(declare-fun m!60429 () Bool)

(assert (=> mapNonEmpty!3063 m!60429))

(declare-fun mapIsEmpty!3064 () Bool)

(declare-fun mapRes!3064 () Bool)

(assert (=> mapIsEmpty!3064 mapRes!3064))

(declare-fun condMapEmpty!3064 () Bool)

(declare-fun mapDefault!3064 () ValueCell!878)

(assert (=> mapNonEmpty!3048 (= condMapEmpty!3064 (= mapRest!3047 ((as const (Array (_ BitVec 32) ValueCell!878)) mapDefault!3064)))))

(declare-fun e!43320 () Bool)

(assert (=> mapNonEmpty!3048 (= tp!8310 (and e!43320 mapRes!3064))))

(declare-fun b!66053 () Bool)

(declare-fun e!43321 () Bool)

(assert (=> b!66053 (= e!43321 tp_is_empty!2443)))

(declare-fun mapNonEmpty!3064 () Bool)

(declare-fun tp!8338 () Bool)

(assert (=> mapNonEmpty!3064 (= mapRes!3064 (and tp!8338 e!43321))))

(declare-fun mapKey!3064 () (_ BitVec 32))

(declare-fun mapRest!3064 () (Array (_ BitVec 32) ValueCell!878))

(declare-fun mapValue!3064 () ValueCell!878)

(assert (=> mapNonEmpty!3064 (= mapRest!3047 (store mapRest!3064 mapKey!3064 mapValue!3064))))

(declare-fun b!66054 () Bool)

(assert (=> b!66054 (= e!43320 tp_is_empty!2443)))

(assert (= (and mapNonEmpty!3048 condMapEmpty!3064) mapIsEmpty!3064))

(assert (= (and mapNonEmpty!3048 (not condMapEmpty!3064)) mapNonEmpty!3064))

(assert (= (and mapNonEmpty!3064 ((_ is ValueCellFull!878) mapValue!3064)) b!66053))

(assert (= (and mapNonEmpty!3048 ((_ is ValueCellFull!878) mapDefault!3064)) b!66054))

(declare-fun m!60431 () Bool)

(assert (=> mapNonEmpty!3064 m!60431))

(declare-fun b_lambda!2945 () Bool)

(assert (= b_lambda!2939 (or (and b!65636 b_free!2053) (and b!65634 b_free!2055 (= (defaultEntry!2140 newMap!16) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992))))) b_lambda!2945)))

(declare-fun b_lambda!2947 () Bool)

(assert (= b_lambda!2941 (or (and b!65636 b_free!2053) (and b!65634 b_free!2055 (= (defaultEntry!2140 newMap!16) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992))))) b_lambda!2947)))

(declare-fun b_lambda!2949 () Bool)

(assert (= b_lambda!2943 (or (and b!65636 b_free!2053) (and b!65634 b_free!2055 (= (defaultEntry!2140 newMap!16) (defaultEntry!2140 (v!2462 (underlying!242 thiss!992))))) b_lambda!2949)))

(check-sat (not b!65937) (not d!13595) (not b_lambda!2949) (not d!13593) (not bm!5411) (not b!65875) (not b!65936) (not b!65945) (not mapNonEmpty!3064) (not bm!5441) (not b!65995) (not d!13601) (not b_next!2053) (not b!66042) (not bm!5439) (not d!13627) (not b!66035) (not bm!5421) (not bm!5399) (not d!13591) (not b!66043) (not d!13589) (not bm!5405) (not b!65930) (not b!65898) (not b!65769) (not b!65939) (not bm!5417) (not b!65771) (not b!66044) (not mapNonEmpty!3063) (not b!65944) (not bm!5414) (not b!65924) (not b!65896) (not b!66032) (not b_lambda!2937) (not b!65928) (not b!65990) (not b!66006) (not b!66014) (not d!13613) b_and!4065 (not b_lambda!2945) (not b!66005) tp_is_empty!2443 (not b!65856) (not b!65938) (not b!65988) (not b!65931) (not b!65925) (not bm!5402) (not b!65934) (not bm!5416) (not d!13611) (not b!65933) b_and!4067 (not bm!5448) (not b!66034) (not b!65871) (not d!13619) (not d!13605) (not b_next!2055) (not b!65861) (not b!65991) (not b!65897) (not bm!5445) (not b!65994) (not b!65932) (not b!65899) (not bm!5424) (not b!65873) (not b_lambda!2947) (not bm!5408) (not bm!5409) (not b!65999) (not d!13609) (not d!13599) (not b!65876) (not b!66019) (not bm!5443) (not bm!5410) (not bm!5415) (not d!13629) (not bm!5403) (not d!13603) (not d!13615))
(check-sat b_and!4065 b_and!4067 (not b_next!2053) (not b_next!2055))
