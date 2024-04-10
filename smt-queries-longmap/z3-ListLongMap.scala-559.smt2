; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15198 () Bool)

(assert start!15198)

(declare-fun b!146071 () Bool)

(declare-fun b_free!3101 () Bool)

(declare-fun b_next!3101 () Bool)

(assert (=> b!146071 (= b_free!3101 (not b_next!3101))))

(declare-fun tp!11807 () Bool)

(declare-fun b_and!9119 () Bool)

(assert (=> b!146071 (= tp!11807 b_and!9119)))

(declare-fun b!146061 () Bool)

(declare-fun b_free!3103 () Bool)

(declare-fun b_next!3103 () Bool)

(assert (=> b!146061 (= b_free!3103 (not b_next!3103))))

(declare-fun tp!11805 () Bool)

(declare-fun b_and!9121 () Bool)

(assert (=> b!146061 (= tp!11805 b_and!9121)))

(declare-fun res!69531 () Bool)

(declare-fun e!95237 () Bool)

(assert (=> start!15198 (=> (not res!69531) (not e!95237))))

(declare-datatypes ((V!3603 0))(
  ( (V!3604 (val!1528 Int)) )
))
(declare-datatypes ((array!4979 0))(
  ( (array!4980 (arr!2351 (Array (_ BitVec 32) (_ BitVec 64))) (size!2627 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1140 0))(
  ( (ValueCellFull!1140 (v!3346 V!3603)) (EmptyCell!1140) )
))
(declare-datatypes ((array!4981 0))(
  ( (array!4982 (arr!2352 (Array (_ BitVec 32) ValueCell!1140)) (size!2628 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1188 0))(
  ( (LongMapFixedSize!1189 (defaultEntry!3010 Int) (mask!7384 (_ BitVec 32)) (extraKeys!2755 (_ BitVec 32)) (zeroValue!2855 V!3603) (minValue!2855 V!3603) (_size!643 (_ BitVec 32)) (_keys!4779 array!4979) (_values!2993 array!4981) (_vacant!643 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!972 0))(
  ( (Cell!973 (v!3347 LongMapFixedSize!1188)) )
))
(declare-datatypes ((LongMap!972 0))(
  ( (LongMap!973 (underlying!497 Cell!972)) )
))
(declare-fun thiss!992 () LongMap!972)

(declare-fun valid!578 (LongMap!972) Bool)

(assert (=> start!15198 (= res!69531 (valid!578 thiss!992))))

(assert (=> start!15198 e!95237))

(declare-fun e!95243 () Bool)

(assert (=> start!15198 e!95243))

(assert (=> start!15198 true))

(declare-fun e!95241 () Bool)

(assert (=> start!15198 e!95241))

(declare-fun mapIsEmpty!4973 () Bool)

(declare-fun mapRes!4973 () Bool)

(assert (=> mapIsEmpty!4973 mapRes!4973))

(declare-fun b!146059 () Bool)

(declare-fun e!95244 () Bool)

(assert (=> b!146059 (= e!95237 e!95244)))

(declare-fun res!69533 () Bool)

(assert (=> b!146059 (=> (not res!69533) (not e!95244))))

(declare-datatypes ((tuple2!2754 0))(
  ( (tuple2!2755 (_1!1388 (_ BitVec 64)) (_2!1388 V!3603)) )
))
(declare-datatypes ((List!1775 0))(
  ( (Nil!1772) (Cons!1771 (h!2379 tuple2!2754) (t!6460 List!1775)) )
))
(declare-datatypes ((ListLongMap!1775 0))(
  ( (ListLongMap!1776 (toList!903 List!1775)) )
))
(declare-fun lt!76793 () ListLongMap!1775)

(declare-fun lt!76798 () ListLongMap!1775)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!146059 (= res!69533 (and (= lt!76798 lt!76793) (not (= (select (arr!2351 (_keys!4779 (v!3347 (underlying!497 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2351 (_keys!4779 (v!3347 (underlying!497 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1188)

(declare-fun map!1465 (LongMapFixedSize!1188) ListLongMap!1775)

(assert (=> b!146059 (= lt!76793 (map!1465 newMap!16))))

(declare-fun getCurrentListMap!572 (array!4979 array!4981 (_ BitVec 32) (_ BitVec 32) V!3603 V!3603 (_ BitVec 32) Int) ListLongMap!1775)

(assert (=> b!146059 (= lt!76798 (getCurrentListMap!572 (_keys!4779 (v!3347 (underlying!497 thiss!992))) (_values!2993 (v!3347 (underlying!497 thiss!992))) (mask!7384 (v!3347 (underlying!497 thiss!992))) (extraKeys!2755 (v!3347 (underlying!497 thiss!992))) (zeroValue!2855 (v!3347 (underlying!497 thiss!992))) (minValue!2855 (v!3347 (underlying!497 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3010 (v!3347 (underlying!497 thiss!992)))))))

(declare-fun mapNonEmpty!4973 () Bool)

(declare-fun mapRes!4974 () Bool)

(declare-fun tp!11808 () Bool)

(declare-fun e!95242 () Bool)

(assert (=> mapNonEmpty!4973 (= mapRes!4974 (and tp!11808 e!95242))))

(declare-fun mapRest!4973 () (Array (_ BitVec 32) ValueCell!1140))

(declare-fun mapValue!4973 () ValueCell!1140)

(declare-fun mapKey!4973 () (_ BitVec 32))

(assert (=> mapNonEmpty!4973 (= (arr!2352 (_values!2993 newMap!16)) (store mapRest!4973 mapKey!4973 mapValue!4973))))

(declare-fun b!146060 () Bool)

(declare-fun e!95230 () Bool)

(assert (=> b!146060 (= e!95244 e!95230)))

(declare-fun res!69529 () Bool)

(assert (=> b!146060 (=> (not res!69529) (not e!95230))))

(declare-datatypes ((tuple2!2756 0))(
  ( (tuple2!2757 (_1!1389 Bool) (_2!1389 LongMapFixedSize!1188)) )
))
(declare-fun lt!76796 () tuple2!2756)

(assert (=> b!146060 (= res!69529 (and (_1!1389 lt!76796) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!4615 0))(
  ( (Unit!4616) )
))
(declare-fun lt!76794 () Unit!4615)

(declare-fun e!95240 () Unit!4615)

(assert (=> b!146060 (= lt!76794 e!95240)))

(declare-fun c!27617 () Bool)

(declare-fun contains!949 (ListLongMap!1775 (_ BitVec 64)) Bool)

(assert (=> b!146060 (= c!27617 (contains!949 lt!76793 (select (arr!2351 (_keys!4779 (v!3347 (underlying!497 thiss!992)))) from!355)))))

(declare-fun update!224 (LongMapFixedSize!1188 (_ BitVec 64) V!3603) tuple2!2756)

(declare-fun get!1567 (ValueCell!1140 V!3603) V!3603)

(declare-fun dynLambda!455 (Int (_ BitVec 64)) V!3603)

(assert (=> b!146060 (= lt!76796 (update!224 newMap!16 (select (arr!2351 (_keys!4779 (v!3347 (underlying!497 thiss!992)))) from!355) (get!1567 (select (arr!2352 (_values!2993 (v!3347 (underlying!497 thiss!992)))) from!355) (dynLambda!455 (defaultEntry!3010 (v!3347 (underlying!497 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!95245 () Bool)

(declare-fun tp_is_empty!2967 () Bool)

(declare-fun array_inv!1481 (array!4979) Bool)

(declare-fun array_inv!1482 (array!4981) Bool)

(assert (=> b!146061 (= e!95241 (and tp!11805 tp_is_empty!2967 (array_inv!1481 (_keys!4779 newMap!16)) (array_inv!1482 (_values!2993 newMap!16)) e!95245))))

(declare-fun b!146062 () Bool)

(declare-fun e!95238 () Bool)

(assert (=> b!146062 (= e!95238 tp_is_empty!2967)))

(declare-fun b!146063 () Bool)

(assert (=> b!146063 (= e!95242 tp_is_empty!2967)))

(declare-fun b!146064 () Bool)

(declare-fun e!95233 () Bool)

(assert (=> b!146064 (= e!95233 tp_is_empty!2967)))

(declare-fun b!146065 () Bool)

(declare-fun e!95235 () Bool)

(assert (=> b!146065 (= e!95243 e!95235)))

(declare-fun b!146066 () Bool)

(declare-fun Unit!4617 () Unit!4615)

(assert (=> b!146066 (= e!95240 Unit!4617)))

(declare-fun b!146067 () Bool)

(declare-fun Unit!4618 () Unit!4615)

(assert (=> b!146067 (= e!95240 Unit!4618)))

(declare-fun lt!76795 () Unit!4615)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!152 (array!4979 array!4981 (_ BitVec 32) (_ BitVec 32) V!3603 V!3603 (_ BitVec 64) (_ BitVec 32) Int) Unit!4615)

(assert (=> b!146067 (= lt!76795 (lemmaListMapContainsThenArrayContainsFrom!152 (_keys!4779 (v!3347 (underlying!497 thiss!992))) (_values!2993 (v!3347 (underlying!497 thiss!992))) (mask!7384 (v!3347 (underlying!497 thiss!992))) (extraKeys!2755 (v!3347 (underlying!497 thiss!992))) (zeroValue!2855 (v!3347 (underlying!497 thiss!992))) (minValue!2855 (v!3347 (underlying!497 thiss!992))) (select (arr!2351 (_keys!4779 (v!3347 (underlying!497 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3010 (v!3347 (underlying!497 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146067 (arrayContainsKey!0 (_keys!4779 (v!3347 (underlying!497 thiss!992))) (select (arr!2351 (_keys!4779 (v!3347 (underlying!497 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76797 () Unit!4615)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4979 (_ BitVec 32) (_ BitVec 32)) Unit!4615)

(assert (=> b!146067 (= lt!76797 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4779 (v!3347 (underlying!497 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1776 0))(
  ( (Nil!1773) (Cons!1772 (h!2380 (_ BitVec 64)) (t!6461 List!1776)) )
))
(declare-fun arrayNoDuplicates!0 (array!4979 (_ BitVec 32) List!1776) Bool)

(assert (=> b!146067 (arrayNoDuplicates!0 (_keys!4779 (v!3347 (underlying!497 thiss!992))) from!355 Nil!1773)))

(declare-fun lt!76792 () Unit!4615)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4979 (_ BitVec 32) (_ BitVec 64) List!1776) Unit!4615)

(assert (=> b!146067 (= lt!76792 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4779 (v!3347 (underlying!497 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2351 (_keys!4779 (v!3347 (underlying!497 thiss!992)))) from!355) (Cons!1772 (select (arr!2351 (_keys!4779 (v!3347 (underlying!497 thiss!992)))) from!355) Nil!1773)))))

(assert (=> b!146067 false))

(declare-fun b!146068 () Bool)

(declare-fun e!95239 () Bool)

(assert (=> b!146068 (= e!95235 e!95239)))

(declare-fun b!146069 () Bool)

(declare-fun e!95234 () Bool)

(assert (=> b!146069 (= e!95234 tp_is_empty!2967)))

(declare-fun b!146070 () Bool)

(declare-fun res!69532 () Bool)

(assert (=> b!146070 (=> (not res!69532) (not e!95237))))

(assert (=> b!146070 (= res!69532 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2627 (_keys!4779 (v!3347 (underlying!497 thiss!992)))))))))

(declare-fun e!95236 () Bool)

(assert (=> b!146071 (= e!95239 (and tp!11807 tp_is_empty!2967 (array_inv!1481 (_keys!4779 (v!3347 (underlying!497 thiss!992)))) (array_inv!1482 (_values!2993 (v!3347 (underlying!497 thiss!992)))) e!95236))))

(declare-fun b!146072 () Bool)

(declare-fun res!69530 () Bool)

(assert (=> b!146072 (=> (not res!69530) (not e!95237))))

(assert (=> b!146072 (= res!69530 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7384 newMap!16)) (_size!643 (v!3347 (underlying!497 thiss!992)))))))

(declare-fun mapIsEmpty!4974 () Bool)

(assert (=> mapIsEmpty!4974 mapRes!4974))

(declare-fun b!146073 () Bool)

(assert (=> b!146073 (= e!95230 false)))

(declare-fun lt!76799 () ListLongMap!1775)

(declare-fun getCurrentListMapNoExtraKeys!151 (array!4979 array!4981 (_ BitVec 32) (_ BitVec 32) V!3603 V!3603 (_ BitVec 32) Int) ListLongMap!1775)

(assert (=> b!146073 (= lt!76799 (getCurrentListMapNoExtraKeys!151 (_keys!4779 (v!3347 (underlying!497 thiss!992))) (_values!2993 (v!3347 (underlying!497 thiss!992))) (mask!7384 (v!3347 (underlying!497 thiss!992))) (extraKeys!2755 (v!3347 (underlying!497 thiss!992))) (zeroValue!2855 (v!3347 (underlying!497 thiss!992))) (minValue!2855 (v!3347 (underlying!497 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3010 (v!3347 (underlying!497 thiss!992)))))))

(declare-fun mapNonEmpty!4974 () Bool)

(declare-fun tp!11806 () Bool)

(assert (=> mapNonEmpty!4974 (= mapRes!4973 (and tp!11806 e!95238))))

(declare-fun mapValue!4974 () ValueCell!1140)

(declare-fun mapRest!4974 () (Array (_ BitVec 32) ValueCell!1140))

(declare-fun mapKey!4974 () (_ BitVec 32))

(assert (=> mapNonEmpty!4974 (= (arr!2352 (_values!2993 (v!3347 (underlying!497 thiss!992)))) (store mapRest!4974 mapKey!4974 mapValue!4974))))

(declare-fun b!146074 () Bool)

(assert (=> b!146074 (= e!95236 (and e!95233 mapRes!4973))))

(declare-fun condMapEmpty!4974 () Bool)

(declare-fun mapDefault!4973 () ValueCell!1140)

(assert (=> b!146074 (= condMapEmpty!4974 (= (arr!2352 (_values!2993 (v!3347 (underlying!497 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1140)) mapDefault!4973)))))

(declare-fun b!146075 () Bool)

(assert (=> b!146075 (= e!95245 (and e!95234 mapRes!4974))))

(declare-fun condMapEmpty!4973 () Bool)

(declare-fun mapDefault!4974 () ValueCell!1140)

(assert (=> b!146075 (= condMapEmpty!4973 (= (arr!2352 (_values!2993 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1140)) mapDefault!4974)))))

(declare-fun b!146076 () Bool)

(declare-fun res!69534 () Bool)

(assert (=> b!146076 (=> (not res!69534) (not e!95237))))

(declare-fun valid!579 (LongMapFixedSize!1188) Bool)

(assert (=> b!146076 (= res!69534 (valid!579 newMap!16))))

(assert (= (and start!15198 res!69531) b!146070))

(assert (= (and b!146070 res!69532) b!146076))

(assert (= (and b!146076 res!69534) b!146072))

(assert (= (and b!146072 res!69530) b!146059))

(assert (= (and b!146059 res!69533) b!146060))

(assert (= (and b!146060 c!27617) b!146067))

(assert (= (and b!146060 (not c!27617)) b!146066))

(assert (= (and b!146060 res!69529) b!146073))

(assert (= (and b!146074 condMapEmpty!4974) mapIsEmpty!4973))

(assert (= (and b!146074 (not condMapEmpty!4974)) mapNonEmpty!4974))

(get-info :version)

(assert (= (and mapNonEmpty!4974 ((_ is ValueCellFull!1140) mapValue!4974)) b!146062))

(assert (= (and b!146074 ((_ is ValueCellFull!1140) mapDefault!4973)) b!146064))

(assert (= b!146071 b!146074))

(assert (= b!146068 b!146071))

(assert (= b!146065 b!146068))

(assert (= start!15198 b!146065))

(assert (= (and b!146075 condMapEmpty!4973) mapIsEmpty!4974))

(assert (= (and b!146075 (not condMapEmpty!4973)) mapNonEmpty!4973))

(assert (= (and mapNonEmpty!4973 ((_ is ValueCellFull!1140) mapValue!4973)) b!146063))

(assert (= (and b!146075 ((_ is ValueCellFull!1140) mapDefault!4974)) b!146069))

(assert (= b!146061 b!146075))

(assert (= start!15198 b!146061))

(declare-fun b_lambda!6543 () Bool)

(assert (=> (not b_lambda!6543) (not b!146060)))

(declare-fun t!6457 () Bool)

(declare-fun tb!2645 () Bool)

(assert (=> (and b!146071 (= (defaultEntry!3010 (v!3347 (underlying!497 thiss!992))) (defaultEntry!3010 (v!3347 (underlying!497 thiss!992)))) t!6457) tb!2645))

(declare-fun result!4323 () Bool)

(assert (=> tb!2645 (= result!4323 tp_is_empty!2967)))

(assert (=> b!146060 t!6457))

(declare-fun b_and!9123 () Bool)

(assert (= b_and!9119 (and (=> t!6457 result!4323) b_and!9123)))

(declare-fun tb!2647 () Bool)

(declare-fun t!6459 () Bool)

(assert (=> (and b!146061 (= (defaultEntry!3010 newMap!16) (defaultEntry!3010 (v!3347 (underlying!497 thiss!992)))) t!6459) tb!2647))

(declare-fun result!4327 () Bool)

(assert (= result!4327 result!4323))

(assert (=> b!146060 t!6459))

(declare-fun b_and!9125 () Bool)

(assert (= b_and!9121 (and (=> t!6459 result!4327) b_and!9125)))

(declare-fun m!175867 () Bool)

(assert (=> b!146076 m!175867))

(declare-fun m!175869 () Bool)

(assert (=> b!146060 m!175869))

(declare-fun m!175871 () Bool)

(assert (=> b!146060 m!175871))

(declare-fun m!175873 () Bool)

(assert (=> b!146060 m!175873))

(declare-fun m!175875 () Bool)

(assert (=> b!146060 m!175875))

(assert (=> b!146060 m!175871))

(assert (=> b!146060 m!175875))

(declare-fun m!175877 () Bool)

(assert (=> b!146060 m!175877))

(assert (=> b!146060 m!175875))

(assert (=> b!146060 m!175873))

(declare-fun m!175879 () Bool)

(assert (=> b!146060 m!175879))

(assert (=> b!146060 m!175869))

(declare-fun m!175881 () Bool)

(assert (=> b!146073 m!175881))

(declare-fun m!175883 () Bool)

(assert (=> b!146067 m!175883))

(declare-fun m!175885 () Bool)

(assert (=> b!146067 m!175885))

(assert (=> b!146067 m!175875))

(declare-fun m!175887 () Bool)

(assert (=> b!146067 m!175887))

(assert (=> b!146067 m!175875))

(assert (=> b!146067 m!175875))

(declare-fun m!175889 () Bool)

(assert (=> b!146067 m!175889))

(assert (=> b!146067 m!175875))

(declare-fun m!175891 () Bool)

(assert (=> b!146067 m!175891))

(declare-fun m!175893 () Bool)

(assert (=> start!15198 m!175893))

(assert (=> b!146059 m!175875))

(declare-fun m!175895 () Bool)

(assert (=> b!146059 m!175895))

(declare-fun m!175897 () Bool)

(assert (=> b!146059 m!175897))

(declare-fun m!175899 () Bool)

(assert (=> b!146061 m!175899))

(declare-fun m!175901 () Bool)

(assert (=> b!146061 m!175901))

(declare-fun m!175903 () Bool)

(assert (=> b!146071 m!175903))

(declare-fun m!175905 () Bool)

(assert (=> b!146071 m!175905))

(declare-fun m!175907 () Bool)

(assert (=> mapNonEmpty!4973 m!175907))

(declare-fun m!175909 () Bool)

(assert (=> mapNonEmpty!4974 m!175909))

(check-sat (not start!15198) b_and!9125 (not b!146061) b_and!9123 (not b_lambda!6543) (not b!146059) (not b_next!3103) (not b!146060) (not mapNonEmpty!4974) tp_is_empty!2967 (not b!146067) (not b!146071) (not b!146076) (not b!146073) (not mapNonEmpty!4973) (not b_next!3101))
(check-sat b_and!9123 b_and!9125 (not b_next!3101) (not b_next!3103))
