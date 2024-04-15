; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9022 () Bool)

(assert start!9022)

(declare-fun b!63640 () Bool)

(declare-fun b_free!2005 () Bool)

(declare-fun b_next!2005 () Bool)

(assert (=> b!63640 (= b_free!2005 (not b_next!2005))))

(declare-fun tp!8151 () Bool)

(declare-fun b_and!3889 () Bool)

(assert (=> b!63640 (= tp!8151 b_and!3889)))

(declare-fun b!63641 () Bool)

(declare-fun b_free!2007 () Bool)

(declare-fun b_next!2007 () Bool)

(assert (=> b!63641 (= b_free!2007 (not b_next!2007))))

(declare-fun tp!8154 () Bool)

(declare-fun b_and!3891 () Bool)

(assert (=> b!63641 (= tp!8154 b_and!3891)))

(declare-fun b!63636 () Bool)

(declare-fun e!41736 () Bool)

(declare-fun tp_is_empty!2419 () Bool)

(assert (=> b!63636 (= e!41736 tp_is_empty!2419)))

(declare-fun b!63637 () Bool)

(declare-fun res!34798 () Bool)

(declare-fun e!41731 () Bool)

(assert (=> b!63637 (=> (not res!34798) (not e!41731))))

(declare-datatypes ((V!2873 0))(
  ( (V!2874 (val!1254 Int)) )
))
(declare-datatypes ((array!3751 0))(
  ( (array!3752 (arr!1792 (Array (_ BitVec 32) (_ BitVec 64))) (size!2026 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!866 0))(
  ( (ValueCellFull!866 (v!2427 V!2873)) (EmptyCell!866) )
))
(declare-datatypes ((array!3753 0))(
  ( (array!3754 (arr!1793 (Array (_ BitVec 32) ValueCell!866)) (size!2027 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!640 0))(
  ( (LongMapFixedSize!641 (defaultEntry!2108 Int) (mask!6023 (_ BitVec 32)) (extraKeys!1983 (_ BitVec 32)) (zeroValue!2018 V!2873) (minValue!2018 V!2873) (_size!369 (_ BitVec 32)) (_keys!3743 array!3751) (_values!2091 array!3753) (_vacant!369 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!442 0))(
  ( (Cell!443 (v!2428 LongMapFixedSize!640)) )
))
(declare-datatypes ((LongMap!442 0))(
  ( (LongMap!443 (underlying!232 Cell!442)) )
))
(declare-fun thiss!992 () LongMap!442)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!63637 (= res!34798 (validMask!0 (mask!6023 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun b!63638 () Bool)

(declare-fun res!34794 () Bool)

(declare-fun e!41732 () Bool)

(assert (=> b!63638 (=> (not res!34794) (not e!41732))))

(declare-fun newMap!16 () LongMapFixedSize!640)

(declare-fun valid!272 (LongMapFixedSize!640) Bool)

(assert (=> b!63638 (= res!34794 (valid!272 newMap!16))))

(declare-fun b!63639 () Bool)

(declare-fun res!34800 () Bool)

(assert (=> b!63639 (=> (not res!34800) (not e!41732))))

(assert (=> b!63639 (= res!34800 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6023 newMap!16)) (_size!369 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun e!41735 () Bool)

(declare-fun e!41730 () Bool)

(declare-fun array_inv!1115 (array!3751) Bool)

(declare-fun array_inv!1116 (array!3753) Bool)

(assert (=> b!63640 (= e!41735 (and tp!8151 tp_is_empty!2419 (array_inv!1115 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (array_inv!1116 (_values!2091 (v!2428 (underlying!232 thiss!992)))) e!41730))))

(declare-fun e!41734 () Bool)

(declare-fun e!41726 () Bool)

(assert (=> b!63641 (= e!41726 (and tp!8154 tp_is_empty!2419 (array_inv!1115 (_keys!3743 newMap!16)) (array_inv!1116 (_values!2091 newMap!16)) e!41734))))

(declare-fun b!63642 () Bool)

(declare-fun e!41728 () Bool)

(assert (=> b!63642 (= e!41728 tp_is_empty!2419)))

(declare-fun b!63643 () Bool)

(declare-datatypes ((Unit!1751 0))(
  ( (Unit!1752) )
))
(declare-fun e!41738 () Unit!1751)

(declare-fun Unit!1753 () Unit!1751)

(assert (=> b!63643 (= e!41738 Unit!1753)))

(declare-fun lt!26838 () Unit!1751)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!37 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 64) (_ BitVec 32) Int) Unit!1751)

(assert (=> b!63643 (= lt!26838 (lemmaListMapContainsThenArrayContainsFrom!37 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (_values!2091 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992))) (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) (minValue!2018 (v!2428 (underlying!232 thiss!992))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!63643 (arrayContainsKey!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!26836 () Unit!1751)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3751 (_ BitVec 32) (_ BitVec 32)) Unit!1751)

(assert (=> b!63643 (= lt!26836 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1450 0))(
  ( (Nil!1447) (Cons!1446 (h!2030 (_ BitVec 64)) (t!4855 List!1450)) )
))
(declare-fun arrayNoDuplicates!0 (array!3751 (_ BitVec 32) List!1450) Bool)

(assert (=> b!63643 (arrayNoDuplicates!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) from!355 Nil!1447)))

(declare-fun lt!26835 () Unit!1751)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3751 (_ BitVec 32) (_ BitVec 64) List!1450) Unit!1751)

(assert (=> b!63643 (= lt!26835 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (Cons!1446 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) Nil!1447)))))

(assert (=> b!63643 false))

(declare-fun b!63644 () Bool)

(declare-fun e!41725 () Bool)

(declare-fun mapRes!2964 () Bool)

(assert (=> b!63644 (= e!41730 (and e!41725 mapRes!2964))))

(declare-fun condMapEmpty!2963 () Bool)

(declare-fun mapDefault!2964 () ValueCell!866)

(assert (=> b!63644 (= condMapEmpty!2963 (= (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!866)) mapDefault!2964)))))

(declare-fun mapIsEmpty!2963 () Bool)

(assert (=> mapIsEmpty!2963 mapRes!2964))

(declare-fun res!34795 () Bool)

(assert (=> start!9022 (=> (not res!34795) (not e!41732))))

(declare-fun valid!273 (LongMap!442) Bool)

(assert (=> start!9022 (= res!34795 (valid!273 thiss!992))))

(assert (=> start!9022 e!41732))

(declare-fun e!41733 () Bool)

(assert (=> start!9022 e!41733))

(assert (=> start!9022 true))

(assert (=> start!9022 e!41726))

(declare-fun b!63635 () Bool)

(declare-fun e!41727 () Bool)

(declare-fun mapRes!2963 () Bool)

(assert (=> b!63635 (= e!41734 (and e!41727 mapRes!2963))))

(declare-fun condMapEmpty!2964 () Bool)

(declare-fun mapDefault!2963 () ValueCell!866)

(assert (=> b!63635 (= condMapEmpty!2964 (= (arr!1793 (_values!2091 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!866)) mapDefault!2963)))))

(declare-fun b!63645 () Bool)

(assert (=> b!63645 (= e!41727 tp_is_empty!2419)))

(declare-fun b!63646 () Bool)

(assert (=> b!63646 (= e!41725 tp_is_empty!2419)))

(declare-fun b!63647 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3751 (_ BitVec 32)) Bool)

(assert (=> b!63647 (= e!41731 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992))))))))

(declare-fun mapNonEmpty!2963 () Bool)

(declare-fun tp!8153 () Bool)

(assert (=> mapNonEmpty!2963 (= mapRes!2964 (and tp!8153 e!41728))))

(declare-fun mapRest!2963 () (Array (_ BitVec 32) ValueCell!866))

(declare-fun mapValue!2963 () ValueCell!866)

(declare-fun mapKey!2964 () (_ BitVec 32))

(assert (=> mapNonEmpty!2963 (= (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) (store mapRest!2963 mapKey!2964 mapValue!2963))))

(declare-fun b!63648 () Bool)

(declare-fun res!34799 () Bool)

(assert (=> b!63648 (=> (not res!34799) (not e!41732))))

(assert (=> b!63648 (= res!34799 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992)))))))))

(declare-fun b!63649 () Bool)

(declare-fun Unit!1754 () Unit!1751)

(assert (=> b!63649 (= e!41738 Unit!1754)))

(declare-fun b!63650 () Bool)

(declare-fun e!41723 () Bool)

(assert (=> b!63650 (= e!41723 e!41735)))

(declare-fun b!63651 () Bool)

(declare-fun e!41724 () Bool)

(assert (=> b!63651 (= e!41724 e!41731)))

(declare-fun res!34797 () Bool)

(assert (=> b!63651 (=> (not res!34797) (not e!41731))))

(declare-datatypes ((tuple2!2054 0))(
  ( (tuple2!2055 (_1!1038 Bool) (_2!1038 LongMapFixedSize!640)) )
))
(declare-fun lt!26839 () tuple2!2054)

(assert (=> b!63651 (= res!34797 (and (_1!1038 lt!26839) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!26837 () Unit!1751)

(assert (=> b!63651 (= lt!26837 e!41738)))

(declare-fun c!8626 () Bool)

(declare-datatypes ((tuple2!2056 0))(
  ( (tuple2!2057 (_1!1039 (_ BitVec 64)) (_2!1039 V!2873)) )
))
(declare-datatypes ((List!1451 0))(
  ( (Nil!1448) (Cons!1447 (h!2031 tuple2!2056) (t!4856 List!1451)) )
))
(declare-datatypes ((ListLongMap!1365 0))(
  ( (ListLongMap!1366 (toList!698 List!1451)) )
))
(declare-fun lt!26840 () ListLongMap!1365)

(declare-fun contains!693 (ListLongMap!1365 (_ BitVec 64)) Bool)

(assert (=> b!63651 (= c!8626 (contains!693 lt!26840 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun update!89 (LongMapFixedSize!640 (_ BitVec 64) V!2873) tuple2!2054)

(declare-fun get!1095 (ValueCell!866 V!2873) V!2873)

(declare-fun dynLambda!313 (Int (_ BitVec 64)) V!2873)

(assert (=> b!63651 (= lt!26839 (update!89 newMap!16 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!63652 () Bool)

(assert (=> b!63652 (= e!41733 e!41723)))

(declare-fun mapNonEmpty!2964 () Bool)

(declare-fun tp!8152 () Bool)

(assert (=> mapNonEmpty!2964 (= mapRes!2963 (and tp!8152 e!41736))))

(declare-fun mapRest!2964 () (Array (_ BitVec 32) ValueCell!866))

(declare-fun mapKey!2963 () (_ BitVec 32))

(declare-fun mapValue!2964 () ValueCell!866)

(assert (=> mapNonEmpty!2964 (= (arr!1793 (_values!2091 newMap!16)) (store mapRest!2964 mapKey!2963 mapValue!2964))))

(declare-fun b!63653 () Bool)

(declare-fun res!34801 () Bool)

(assert (=> b!63653 (=> (not res!34801) (not e!41731))))

(assert (=> b!63653 (= res!34801 (and (= (size!2027 (_values!2091 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6023 (v!2428 (underlying!232 thiss!992))))) (= (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (size!2027 (_values!2091 (v!2428 (underlying!232 thiss!992))))) (bvsge (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!63654 () Bool)

(assert (=> b!63654 (= e!41732 e!41724)))

(declare-fun res!34796 () Bool)

(assert (=> b!63654 (=> (not res!34796) (not e!41724))))

(declare-fun lt!26841 () ListLongMap!1365)

(assert (=> b!63654 (= res!34796 (and (= lt!26841 lt!26840) (not (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1116 (LongMapFixedSize!640) ListLongMap!1365)

(assert (=> b!63654 (= lt!26840 (map!1116 newMap!16))))

(declare-fun getCurrentListMap!394 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 32) Int) ListLongMap!1365)

(assert (=> b!63654 (= lt!26841 (getCurrentListMap!394 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (_values!2091 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992))) (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) (minValue!2018 (v!2428 (underlying!232 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun mapIsEmpty!2964 () Bool)

(assert (=> mapIsEmpty!2964 mapRes!2963))

(assert (= (and start!9022 res!34795) b!63648))

(assert (= (and b!63648 res!34799) b!63638))

(assert (= (and b!63638 res!34794) b!63639))

(assert (= (and b!63639 res!34800) b!63654))

(assert (= (and b!63654 res!34796) b!63651))

(assert (= (and b!63651 c!8626) b!63643))

(assert (= (and b!63651 (not c!8626)) b!63649))

(assert (= (and b!63651 res!34797) b!63637))

(assert (= (and b!63637 res!34798) b!63653))

(assert (= (and b!63653 res!34801) b!63647))

(assert (= (and b!63644 condMapEmpty!2963) mapIsEmpty!2963))

(assert (= (and b!63644 (not condMapEmpty!2963)) mapNonEmpty!2963))

(get-info :version)

(assert (= (and mapNonEmpty!2963 ((_ is ValueCellFull!866) mapValue!2963)) b!63642))

(assert (= (and b!63644 ((_ is ValueCellFull!866) mapDefault!2964)) b!63646))

(assert (= b!63640 b!63644))

(assert (= b!63650 b!63640))

(assert (= b!63652 b!63650))

(assert (= start!9022 b!63652))

(assert (= (and b!63635 condMapEmpty!2964) mapIsEmpty!2964))

(assert (= (and b!63635 (not condMapEmpty!2964)) mapNonEmpty!2964))

(assert (= (and mapNonEmpty!2964 ((_ is ValueCellFull!866) mapValue!2964)) b!63636))

(assert (= (and b!63635 ((_ is ValueCellFull!866) mapDefault!2963)) b!63645))

(assert (= b!63641 b!63635))

(assert (= start!9022 b!63641))

(declare-fun b_lambda!2855 () Bool)

(assert (=> (not b_lambda!2855) (not b!63651)))

(declare-fun t!4852 () Bool)

(declare-fun tb!1381 () Bool)

(assert (=> (and b!63640 (= (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992)))) t!4852) tb!1381))

(declare-fun result!2463 () Bool)

(assert (=> tb!1381 (= result!2463 tp_is_empty!2419)))

(assert (=> b!63651 t!4852))

(declare-fun b_and!3893 () Bool)

(assert (= b_and!3889 (and (=> t!4852 result!2463) b_and!3893)))

(declare-fun tb!1383 () Bool)

(declare-fun t!4854 () Bool)

(assert (=> (and b!63641 (= (defaultEntry!2108 newMap!16) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992)))) t!4854) tb!1383))

(declare-fun result!2467 () Bool)

(assert (= result!2467 result!2463))

(assert (=> b!63651 t!4854))

(declare-fun b_and!3895 () Bool)

(assert (= b_and!3891 (and (=> t!4854 result!2467) b_and!3895)))

(declare-fun m!57959 () Bool)

(assert (=> b!63637 m!57959))

(declare-fun m!57961 () Bool)

(assert (=> start!9022 m!57961))

(declare-fun m!57963 () Bool)

(assert (=> b!63638 m!57963))

(declare-fun m!57965 () Bool)

(assert (=> b!63641 m!57965))

(declare-fun m!57967 () Bool)

(assert (=> b!63641 m!57967))

(declare-fun m!57969 () Bool)

(assert (=> b!63643 m!57969))

(declare-fun m!57971 () Bool)

(assert (=> b!63643 m!57971))

(declare-fun m!57973 () Bool)

(assert (=> b!63643 m!57973))

(declare-fun m!57975 () Bool)

(assert (=> b!63643 m!57975))

(assert (=> b!63643 m!57973))

(assert (=> b!63643 m!57973))

(declare-fun m!57977 () Bool)

(assert (=> b!63643 m!57977))

(assert (=> b!63643 m!57973))

(declare-fun m!57979 () Bool)

(assert (=> b!63643 m!57979))

(declare-fun m!57981 () Bool)

(assert (=> b!63651 m!57981))

(declare-fun m!57983 () Bool)

(assert (=> b!63651 m!57983))

(declare-fun m!57985 () Bool)

(assert (=> b!63651 m!57985))

(assert (=> b!63651 m!57973))

(declare-fun m!57987 () Bool)

(assert (=> b!63651 m!57987))

(assert (=> b!63651 m!57973))

(assert (=> b!63651 m!57983))

(assert (=> b!63651 m!57973))

(assert (=> b!63651 m!57985))

(declare-fun m!57989 () Bool)

(assert (=> b!63651 m!57989))

(assert (=> b!63651 m!57981))

(assert (=> b!63654 m!57973))

(declare-fun m!57991 () Bool)

(assert (=> b!63654 m!57991))

(declare-fun m!57993 () Bool)

(assert (=> b!63654 m!57993))

(declare-fun m!57995 () Bool)

(assert (=> mapNonEmpty!2964 m!57995))

(declare-fun m!57997 () Bool)

(assert (=> mapNonEmpty!2963 m!57997))

(declare-fun m!57999 () Bool)

(assert (=> b!63647 m!57999))

(declare-fun m!58001 () Bool)

(assert (=> b!63640 m!58001))

(declare-fun m!58003 () Bool)

(assert (=> b!63640 m!58003))

(check-sat (not b_lambda!2855) (not mapNonEmpty!2963) (not start!9022) (not b_next!2005) (not b!63640) (not mapNonEmpty!2964) (not b!63638) (not b!63654) (not b!63637) (not b!63647) (not b!63643) b_and!3895 tp_is_empty!2419 (not b_next!2007) b_and!3893 (not b!63641) (not b!63651))
(check-sat b_and!3893 b_and!3895 (not b_next!2005) (not b_next!2007))
(get-model)

(declare-fun b_lambda!2861 () Bool)

(assert (= b_lambda!2855 (or (and b!63640 b_free!2005) (and b!63641 b_free!2007 (= (defaultEntry!2108 newMap!16) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))))) b_lambda!2861)))

(check-sat (not b_lambda!2861) (not mapNonEmpty!2963) (not start!9022) (not b_next!2005) (not b!63640) (not mapNonEmpty!2964) (not b!63638) (not b!63654) (not b!63637) (not b!63647) (not b!63643) b_and!3895 tp_is_empty!2419 (not b_next!2007) b_and!3893 (not b!63641) (not b!63651))
(check-sat b_and!3893 b_and!3895 (not b_next!2005) (not b_next!2007))
(get-model)

(declare-fun d!13223 () Bool)

(declare-fun e!41839 () Bool)

(assert (=> d!13223 e!41839))

(declare-fun res!34852 () Bool)

(assert (=> d!13223 (=> res!34852 e!41839)))

(declare-fun lt!26892 () Bool)

(assert (=> d!13223 (= res!34852 (not lt!26892))))

(declare-fun lt!26895 () Bool)

(assert (=> d!13223 (= lt!26892 lt!26895)))

(declare-fun lt!26894 () Unit!1751)

(declare-fun e!41840 () Unit!1751)

(assert (=> d!13223 (= lt!26894 e!41840)))

(declare-fun c!8635 () Bool)

(assert (=> d!13223 (= c!8635 lt!26895)))

(declare-fun containsKey!129 (List!1451 (_ BitVec 64)) Bool)

(assert (=> d!13223 (= lt!26895 (containsKey!129 (toList!698 lt!26840) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(assert (=> d!13223 (= (contains!693 lt!26840 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) lt!26892)))

(declare-fun b!63787 () Bool)

(declare-fun lt!26893 () Unit!1751)

(assert (=> b!63787 (= e!41840 lt!26893)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!78 (List!1451 (_ BitVec 64)) Unit!1751)

(assert (=> b!63787 (= lt!26893 (lemmaContainsKeyImpliesGetValueByKeyDefined!78 (toList!698 lt!26840) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-datatypes ((Option!131 0))(
  ( (Some!130 (v!2434 V!2873)) (None!129) )
))
(declare-fun isDefined!79 (Option!131) Bool)

(declare-fun getValueByKey!125 (List!1451 (_ BitVec 64)) Option!131)

(assert (=> b!63787 (isDefined!79 (getValueByKey!125 (toList!698 lt!26840) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun b!63788 () Bool)

(declare-fun Unit!1755 () Unit!1751)

(assert (=> b!63788 (= e!41840 Unit!1755)))

(declare-fun b!63789 () Bool)

(assert (=> b!63789 (= e!41839 (isDefined!79 (getValueByKey!125 (toList!698 lt!26840) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355))))))

(assert (= (and d!13223 c!8635) b!63787))

(assert (= (and d!13223 (not c!8635)) b!63788))

(assert (= (and d!13223 (not res!34852)) b!63789))

(assert (=> d!13223 m!57973))

(declare-fun m!58097 () Bool)

(assert (=> d!13223 m!58097))

(assert (=> b!63787 m!57973))

(declare-fun m!58099 () Bool)

(assert (=> b!63787 m!58099))

(assert (=> b!63787 m!57973))

(declare-fun m!58101 () Bool)

(assert (=> b!63787 m!58101))

(assert (=> b!63787 m!58101))

(declare-fun m!58103 () Bool)

(assert (=> b!63787 m!58103))

(assert (=> b!63789 m!57973))

(assert (=> b!63789 m!58101))

(assert (=> b!63789 m!58101))

(assert (=> b!63789 m!58103))

(assert (=> b!63651 d!13223))

(declare-fun b!63874 () Bool)

(declare-fun c!8672 () Bool)

(declare-datatypes ((SeekEntryResult!233 0))(
  ( (MissingZero!233 (index!3058 (_ BitVec 32))) (Found!233 (index!3059 (_ BitVec 32))) (Intermediate!233 (undefined!1045 Bool) (index!3060 (_ BitVec 32)) (x!10454 (_ BitVec 32))) (Undefined!233) (MissingVacant!233 (index!3061 (_ BitVec 32))) )
))
(declare-fun lt!26953 () SeekEntryResult!233)

(assert (=> b!63874 (= c!8672 ((_ is MissingVacant!233) lt!26953))))

(declare-fun e!41901 () Bool)

(declare-fun e!41905 () Bool)

(assert (=> b!63874 (= e!41901 e!41905)))

(declare-fun b!63875 () Bool)

(declare-fun res!34886 () Bool)

(declare-fun e!41889 () Bool)

(assert (=> b!63875 (=> (not res!34886) (not e!41889))))

(declare-fun lt!26969 () SeekEntryResult!233)

(assert (=> b!63875 (= res!34886 (= (select (arr!1792 (_keys!3743 newMap!16)) (index!3058 lt!26969)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5100 () Bool)

(declare-fun call!5117 () Bool)

(declare-fun call!5103 () Bool)

(assert (=> bm!5100 (= call!5117 call!5103)))

(declare-fun b!63876 () Bool)

(declare-fun c!8668 () Bool)

(assert (=> b!63876 (= c!8668 ((_ is MissingVacant!233) lt!26969))))

(declare-fun e!41906 () Bool)

(declare-fun e!41896 () Bool)

(assert (=> b!63876 (= e!41906 e!41896)))

(declare-fun b!63877 () Bool)

(declare-fun e!41887 () Bool)

(declare-fun e!41899 () Bool)

(assert (=> b!63877 (= e!41887 e!41899)))

(declare-fun c!8666 () Bool)

(declare-fun lt!26965 () tuple2!2054)

(assert (=> b!63877 (= c!8666 (_1!1038 lt!26965))))

(declare-fun c!8673 () Bool)

(declare-fun bm!5101 () Bool)

(declare-fun call!5105 () tuple2!2054)

(declare-fun lt!26958 () SeekEntryResult!233)

(declare-fun updateHelperNewKey!18 (LongMapFixedSize!640 (_ BitVec 64) V!2873 (_ BitVec 32)) tuple2!2054)

(assert (=> bm!5101 (= call!5105 (updateHelperNewKey!18 newMap!16 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958))))))

(declare-fun b!63878 () Bool)

(declare-fun e!41897 () ListLongMap!1365)

(assert (=> b!63878 (= e!41897 (getCurrentListMap!394 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun b!63879 () Bool)

(declare-fun e!41900 () Bool)

(assert (=> b!63879 (= e!41896 e!41900)))

(declare-fun res!34885 () Bool)

(assert (=> b!63879 (= res!34885 call!5117)))

(assert (=> b!63879 (=> (not res!34885) (not e!41900))))

(declare-fun bm!5102 () Bool)

(declare-fun call!5126 () SeekEntryResult!233)

(declare-fun call!5114 () SeekEntryResult!233)

(assert (=> bm!5102 (= call!5126 call!5114)))

(declare-fun call!5115 () Bool)

(declare-fun bm!5103 () Bool)

(declare-fun c!8669 () Bool)

(declare-fun c!8670 () Bool)

(declare-fun lt!26975 () SeekEntryResult!233)

(declare-fun lt!26974 () SeekEntryResult!233)

(declare-fun c!8664 () Bool)

(declare-fun c!8674 () Bool)

(declare-fun c!8677 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5103 (= call!5115 (inRange!0 (ite c!8674 (ite c!8670 (index!3059 lt!26974) (ite c!8669 (index!3058 lt!26969) (index!3061 lt!26969))) (ite c!8677 (index!3059 lt!26975) (ite c!8664 (index!3058 lt!26953) (index!3061 lt!26953)))) (mask!6023 newMap!16)))))

(declare-fun bm!5104 () Bool)

(declare-fun call!5120 () ListLongMap!1365)

(declare-fun call!5122 () ListLongMap!1365)

(assert (=> bm!5104 (= call!5120 call!5122)))

(declare-fun bm!5105 () Bool)

(assert (=> bm!5105 (= call!5103 call!5115)))

(declare-fun bm!5106 () Bool)

(declare-fun lt!26964 () (_ BitVec 32))

(declare-fun c!8671 () Bool)

(declare-fun call!5112 () ListLongMap!1365)

(declare-fun c!8667 () Bool)

(assert (=> bm!5106 (= call!5112 (getCurrentListMap!394 (_keys!3743 newMap!16) (ite (or c!8671 c!8674) (_values!2091 newMap!16) (array!3754 (store (arr!1793 (_values!2091 newMap!16)) (index!3059 lt!26958) (ValueCellFull!866 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2027 (_values!2091 newMap!16)))) (mask!6023 newMap!16) (ite (and c!8671 c!8667) lt!26964 (extraKeys!1983 newMap!16)) (ite (and c!8671 c!8667) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun bm!5107 () Bool)

(declare-fun call!5109 () ListLongMap!1365)

(assert (=> bm!5107 (= call!5109 (map!1116 (_2!1038 lt!26965)))))

(declare-fun bm!5108 () Bool)

(declare-fun call!5113 () ListLongMap!1365)

(declare-fun call!5104 () ListLongMap!1365)

(assert (=> bm!5108 (= call!5113 call!5104)))

(declare-fun b!63880 () Bool)

(declare-fun lt!26968 () Unit!1751)

(declare-fun lt!26954 () Unit!1751)

(assert (=> b!63880 (= lt!26968 lt!26954)))

(assert (=> b!63880 (contains!693 call!5122 (select (arr!1792 (_keys!3743 newMap!16)) (index!3059 lt!26958)))))

(declare-fun lt!26960 () array!3753)

(declare-fun lemmaValidKeyInArrayIsInListMap!77 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 32) Int) Unit!1751)

(assert (=> b!63880 (= lt!26954 (lemmaValidKeyInArrayIsInListMap!77 (_keys!3743 newMap!16) lt!26960 (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (index!3059 lt!26958) (defaultEntry!2108 newMap!16)))))

(assert (=> b!63880 (= lt!26960 (array!3754 (store (arr!1793 (_values!2091 newMap!16)) (index!3059 lt!26958) (ValueCellFull!866 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2027 (_values!2091 newMap!16))))))

(declare-fun lt!26961 () Unit!1751)

(declare-fun lt!26976 () Unit!1751)

(assert (=> b!63880 (= lt!26961 lt!26976)))

(declare-fun call!5119 () ListLongMap!1365)

(assert (=> b!63880 (= call!5104 call!5119)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!18 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 32) (_ BitVec 64) V!2873 Int) Unit!1751)

(assert (=> b!63880 (= lt!26976 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!18 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (index!3059 lt!26958) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2108 newMap!16)))))

(declare-fun lt!26962 () Unit!1751)

(declare-fun e!41893 () Unit!1751)

(assert (=> b!63880 (= lt!26962 e!41893)))

(declare-fun call!5125 () Bool)

(assert (=> b!63880 (= c!8677 call!5125)))

(declare-fun e!41904 () tuple2!2054)

(assert (=> b!63880 (= e!41904 (tuple2!2055 true (LongMapFixedSize!641 (defaultEntry!2108 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (_size!369 newMap!16) (_keys!3743 newMap!16) (array!3754 (store (arr!1793 (_values!2091 newMap!16)) (index!3059 lt!26958) (ValueCellFull!866 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2027 (_values!2091 newMap!16))) (_vacant!369 newMap!16))))))

(declare-fun b!63881 () Bool)

(declare-fun e!41898 () tuple2!2054)

(declare-fun e!41888 () tuple2!2054)

(assert (=> b!63881 (= e!41898 e!41888)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3751 (_ BitVec 32)) SeekEntryResult!233)

(assert (=> b!63881 (= lt!26958 (seekEntryOrOpen!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (_keys!3743 newMap!16) (mask!6023 newMap!16)))))

(assert (=> b!63881 (= c!8674 ((_ is Undefined!233) lt!26958))))

(declare-fun b!63882 () Bool)

(declare-fun call!5111 () Bool)

(assert (=> b!63882 (= e!41889 (not call!5111))))

(declare-fun bm!5109 () Bool)

(declare-fun call!5116 () ListLongMap!1365)

(assert (=> bm!5109 (= call!5116 (map!1116 newMap!16))))

(declare-fun bm!5110 () Bool)

(declare-fun call!5121 () ListLongMap!1365)

(assert (=> bm!5110 (= call!5121 call!5112)))

(declare-fun b!63883 () Bool)

(declare-fun e!41895 () Unit!1751)

(declare-fun Unit!1756 () Unit!1751)

(assert (=> b!63883 (= e!41895 Unit!1756)))

(declare-fun lt!26959 () Unit!1751)

(declare-fun call!5106 () Unit!1751)

(assert (=> b!63883 (= lt!26959 call!5106)))

(declare-fun call!5118 () SeekEntryResult!233)

(assert (=> b!63883 (= lt!26974 call!5118)))

(declare-fun res!34894 () Bool)

(assert (=> b!63883 (= res!34894 ((_ is Found!233) lt!26974))))

(declare-fun e!41903 () Bool)

(assert (=> b!63883 (=> (not res!34894) (not e!41903))))

(assert (=> b!63883 e!41903))

(declare-fun lt!26956 () Unit!1751)

(assert (=> b!63883 (= lt!26956 lt!26959)))

(assert (=> b!63883 false))

(declare-fun b!63884 () Bool)

(declare-fun e!41902 () Bool)

(assert (=> b!63884 (= e!41905 e!41902)))

(declare-fun res!34889 () Bool)

(declare-fun call!5123 () Bool)

(assert (=> b!63884 (= res!34889 call!5123)))

(assert (=> b!63884 (=> (not res!34889) (not e!41902))))

(declare-fun b!63885 () Bool)

(declare-fun res!34881 () Bool)

(assert (=> b!63885 (= res!34881 (= (select (arr!1792 (_keys!3743 newMap!16)) (index!3061 lt!26969)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!63885 (=> (not res!34881) (not e!41900))))

(declare-fun b!63886 () Bool)

(declare-fun e!41885 () Bool)

(assert (=> b!63886 (= e!41885 (= (select (arr!1792 (_keys!3743 newMap!16)) (index!3059 lt!26975)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun call!5107 () Unit!1751)

(declare-fun bm!5111 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!18 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 64) Int) Unit!1751)

(assert (=> bm!5111 (= call!5107 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!18 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)))))

(declare-fun bm!5112 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!18 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 64) Int) Unit!1751)

(assert (=> bm!5112 (= call!5106 (lemmaInListMapThenSeekEntryOrOpenFindsIt!18 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)))))

(declare-fun b!63887 () Bool)

(declare-fun e!41886 () Bool)

(assert (=> b!63887 (= e!41899 e!41886)))

(declare-fun res!34882 () Bool)

(assert (=> b!63887 (= res!34882 (contains!693 call!5109 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(assert (=> b!63887 (=> (not res!34882) (not e!41886))))

(declare-fun b!63888 () Bool)

(declare-fun call!5110 () Bool)

(assert (=> b!63888 (= e!41902 (not call!5110))))

(declare-fun b!63889 () Bool)

(declare-fun +!84 (ListLongMap!1365 tuple2!2056) ListLongMap!1365)

(assert (=> b!63889 (= e!41886 (= call!5109 (+!84 call!5116 (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!63890 () Bool)

(declare-fun res!34888 () Bool)

(assert (=> b!63890 (=> (not res!34888) (not e!41889))))

(assert (=> b!63890 (= res!34888 call!5117)))

(assert (=> b!63890 (= e!41906 e!41889)))

(declare-fun b!63891 () Bool)

(assert (=> b!63891 (= e!41897 call!5119)))

(declare-fun b!63892 () Bool)

(assert (=> b!63892 (= e!41900 (not call!5111))))

(declare-fun b!63893 () Bool)

(declare-fun res!34887 () Bool)

(declare-fun e!41894 () Bool)

(assert (=> b!63893 (=> (not res!34887) (not e!41894))))

(assert (=> b!63893 (= res!34887 (= (select (arr!1792 (_keys!3743 newMap!16)) (index!3058 lt!26953)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!63894 () Bool)

(declare-fun res!34884 () Bool)

(assert (=> b!63894 (= res!34884 call!5103)))

(assert (=> b!63894 (=> (not res!34884) (not e!41903))))

(declare-fun b!63895 () Bool)

(declare-fun e!41892 () tuple2!2054)

(assert (=> b!63895 (= e!41898 e!41892)))

(assert (=> b!63895 (= c!8667 (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5113 () Bool)

(declare-fun call!5124 () Bool)

(assert (=> bm!5113 (= call!5123 call!5124)))

(declare-fun b!63896 () Bool)

(assert (=> b!63896 (= e!41903 (= (select (arr!1792 (_keys!3743 newMap!16)) (index!3059 lt!26974)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun bm!5114 () Bool)

(assert (=> bm!5114 (= call!5118 call!5114)))

(declare-fun b!63897 () Bool)

(assert (=> b!63897 (= e!41894 (not call!5110))))

(declare-fun d!13225 () Bool)

(assert (=> d!13225 e!41887))

(declare-fun res!34883 () Bool)

(assert (=> d!13225 (=> (not res!34883) (not e!41887))))

(assert (=> d!13225 (= res!34883 (valid!272 (_2!1038 lt!26965)))))

(assert (=> d!13225 (= lt!26965 e!41898)))

(assert (=> d!13225 (= c!8671 (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (bvneg (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355))))))

(assert (=> d!13225 (valid!272 newMap!16)))

(assert (=> d!13225 (= (update!89 newMap!16 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!26965)))

(declare-fun b!63898 () Bool)

(declare-fun lt!26973 () Unit!1751)

(assert (=> b!63898 (= lt!26973 e!41895)))

(assert (=> b!63898 (= c!8670 call!5125)))

(assert (=> b!63898 (= e!41888 (tuple2!2055 false newMap!16))))

(declare-fun bm!5115 () Bool)

(declare-fun c!8675 () Bool)

(assert (=> bm!5115 (= c!8675 c!8674)))

(assert (=> bm!5115 (= call!5125 (contains!693 e!41897 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun b!63899 () Bool)

(declare-fun e!41890 () tuple2!2054)

(assert (=> b!63899 (= e!41890 e!41904)))

(declare-fun c!8676 () Bool)

(assert (=> b!63899 (= c!8676 ((_ is MissingZero!233) lt!26958))))

(declare-fun bm!5116 () Bool)

(declare-fun call!5108 () Bool)

(assert (=> bm!5116 (= call!5111 call!5108)))

(declare-fun b!63900 () Bool)

(declare-fun res!34893 () Bool)

(assert (=> b!63900 (=> (not res!34893) (not e!41894))))

(assert (=> b!63900 (= res!34893 call!5123)))

(assert (=> b!63900 (= e!41901 e!41894)))

(declare-fun b!63901 () Bool)

(assert (=> b!63901 (= e!41905 ((_ is Undefined!233) lt!26953))))

(declare-fun bm!5117 () Bool)

(declare-fun lt!26952 () (_ BitVec 32))

(assert (=> bm!5117 (= call!5122 (getCurrentListMap!394 (_keys!3743 newMap!16) (ite c!8671 (_values!2091 newMap!16) lt!26960) (mask!6023 newMap!16) (ite c!8671 (ite c!8667 (extraKeys!1983 newMap!16) lt!26952) (extraKeys!1983 newMap!16)) (zeroValue!2018 newMap!16) (ite c!8671 (ite c!8667 (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun e!41891 () ListLongMap!1365)

(declare-fun b!63902 () Bool)

(assert (=> b!63902 (= e!41891 (ite c!8667 call!5120 call!5121))))

(declare-fun b!63903 () Bool)

(declare-fun res!34891 () Bool)

(assert (=> b!63903 (= res!34891 (= (select (arr!1792 (_keys!3743 newMap!16)) (index!3061 lt!26953)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!63903 (=> (not res!34891) (not e!41902))))

(declare-fun b!63904 () Bool)

(declare-fun lt!26955 () Unit!1751)

(assert (=> b!63904 (= e!41893 lt!26955)))

(assert (=> b!63904 (= lt!26955 call!5106)))

(assert (=> b!63904 (= lt!26975 call!5126)))

(declare-fun res!34890 () Bool)

(assert (=> b!63904 (= res!34890 ((_ is Found!233) lt!26975))))

(assert (=> b!63904 (=> (not res!34890) (not e!41885))))

(assert (=> b!63904 e!41885))

(declare-fun b!63905 () Bool)

(declare-fun lt!26966 () Unit!1751)

(assert (=> b!63905 (= e!41895 lt!26966)))

(assert (=> b!63905 (= lt!26966 call!5107)))

(assert (=> b!63905 (= lt!26969 call!5118)))

(assert (=> b!63905 (= c!8669 ((_ is MissingZero!233) lt!26969))))

(assert (=> b!63905 e!41906))

(declare-fun bm!5118 () Bool)

(assert (=> bm!5118 (= call!5114 (seekEntryOrOpen!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (_keys!3743 newMap!16) (mask!6023 newMap!16)))))

(declare-fun b!63906 () Bool)

(declare-fun res!34892 () Bool)

(assert (=> b!63906 (= res!34892 call!5124)))

(assert (=> b!63906 (=> (not res!34892) (not e!41885))))

(declare-fun bm!5119 () Bool)

(assert (=> bm!5119 (= call!5119 call!5112)))

(declare-fun b!63907 () Bool)

(declare-fun lt!26971 () Unit!1751)

(declare-fun lt!26972 () Unit!1751)

(assert (=> b!63907 (= lt!26971 lt!26972)))

(assert (=> b!63907 (= call!5113 call!5120)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!18 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 V!2873 Int) Unit!1751)

(assert (=> b!63907 (= lt!26972 (lemmaChangeLongMinValueKeyThenAddPairToListMap!18 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) lt!26952 (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2108 newMap!16)))))

(assert (=> b!63907 (= lt!26952 (bvor (extraKeys!1983 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!63907 (= e!41892 (tuple2!2055 true (LongMapFixedSize!641 (defaultEntry!2108 newMap!16) (mask!6023 newMap!16) (bvor (extraKeys!1983 newMap!16) #b00000000000000000000000000000010) (zeroValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!369 newMap!16) (_keys!3743 newMap!16) (_values!2091 newMap!16) (_vacant!369 newMap!16))))))

(declare-fun b!63908 () Bool)

(declare-fun lt!26950 () tuple2!2054)

(assert (=> b!63908 (= lt!26950 call!5105)))

(assert (=> b!63908 (= e!41904 (tuple2!2055 (_1!1038 lt!26950) (_2!1038 lt!26950)))))

(declare-fun b!63909 () Bool)

(declare-fun Unit!1757 () Unit!1751)

(assert (=> b!63909 (= e!41893 Unit!1757)))

(declare-fun lt!26957 () Unit!1751)

(assert (=> b!63909 (= lt!26957 call!5107)))

(assert (=> b!63909 (= lt!26953 call!5126)))

(assert (=> b!63909 (= c!8664 ((_ is MissingZero!233) lt!26953))))

(assert (=> b!63909 e!41901))

(declare-fun lt!26963 () Unit!1751)

(assert (=> b!63909 (= lt!26963 lt!26957)))

(assert (=> b!63909 false))

(declare-fun b!63910 () Bool)

(assert (=> b!63910 (= e!41891 (getCurrentListMap!394 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun bm!5120 () Bool)

(assert (=> bm!5120 (= call!5124 call!5115)))

(declare-fun bm!5121 () Bool)

(assert (=> bm!5121 (= call!5104 (+!84 e!41891 (ite c!8671 (ite c!8667 (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!8665 () Bool)

(assert (=> bm!5121 (= c!8665 c!8671)))

(declare-fun b!63911 () Bool)

(assert (=> b!63911 (= e!41896 ((_ is Undefined!233) lt!26969))))

(declare-fun bm!5122 () Bool)

(assert (=> bm!5122 (= call!5108 (arrayContainsKey!0 (_keys!3743 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!63912 () Bool)

(declare-fun lt!26951 () tuple2!2054)

(assert (=> b!63912 (= e!41890 (tuple2!2055 (_1!1038 lt!26951) (_2!1038 lt!26951)))))

(assert (=> b!63912 (= lt!26951 call!5105)))

(declare-fun b!63913 () Bool)

(assert (=> b!63913 (= c!8673 ((_ is MissingVacant!233) lt!26958))))

(assert (=> b!63913 (= e!41888 e!41890)))

(declare-fun b!63914 () Bool)

(assert (=> b!63914 (= e!41899 (= call!5109 call!5116))))

(declare-fun b!63915 () Bool)

(declare-fun lt!26970 () Unit!1751)

(declare-fun lt!26967 () Unit!1751)

(assert (=> b!63915 (= lt!26970 lt!26967)))

(assert (=> b!63915 (= call!5113 call!5121)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!18 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 V!2873 Int) Unit!1751)

(assert (=> b!63915 (= lt!26967 (lemmaChangeZeroKeyThenAddPairToListMap!18 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) lt!26964 (zeroValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2018 newMap!16) (defaultEntry!2108 newMap!16)))))

(assert (=> b!63915 (= lt!26964 (bvor (extraKeys!1983 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!63915 (= e!41892 (tuple2!2055 true (LongMapFixedSize!641 (defaultEntry!2108 newMap!16) (mask!6023 newMap!16) (bvor (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2018 newMap!16) (_size!369 newMap!16) (_keys!3743 newMap!16) (_values!2091 newMap!16) (_vacant!369 newMap!16))))))

(declare-fun bm!5123 () Bool)

(assert (=> bm!5123 (= call!5110 call!5108)))

(assert (= (and d!13225 c!8671) b!63895))

(assert (= (and d!13225 (not c!8671)) b!63881))

(assert (= (and b!63895 c!8667) b!63915))

(assert (= (and b!63895 (not c!8667)) b!63907))

(assert (= (or b!63915 b!63907) bm!5110))

(assert (= (or b!63915 b!63907) bm!5104))

(assert (= (or b!63915 b!63907) bm!5108))

(assert (= (and b!63881 c!8674) b!63898))

(assert (= (and b!63881 (not c!8674)) b!63913))

(assert (= (and b!63898 c!8670) b!63883))

(assert (= (and b!63898 (not c!8670)) b!63905))

(assert (= (and b!63883 res!34894) b!63894))

(assert (= (and b!63894 res!34884) b!63896))

(assert (= (and b!63905 c!8669) b!63890))

(assert (= (and b!63905 (not c!8669)) b!63876))

(assert (= (and b!63890 res!34888) b!63875))

(assert (= (and b!63875 res!34886) b!63882))

(assert (= (and b!63876 c!8668) b!63879))

(assert (= (and b!63876 (not c!8668)) b!63911))

(assert (= (and b!63879 res!34885) b!63885))

(assert (= (and b!63885 res!34881) b!63892))

(assert (= (or b!63890 b!63879) bm!5100))

(assert (= (or b!63882 b!63892) bm!5116))

(assert (= (or b!63894 bm!5100) bm!5105))

(assert (= (or b!63883 b!63905) bm!5114))

(assert (= (and b!63913 c!8673) b!63912))

(assert (= (and b!63913 (not c!8673)) b!63899))

(assert (= (and b!63899 c!8676) b!63908))

(assert (= (and b!63899 (not c!8676)) b!63880))

(assert (= (and b!63880 c!8677) b!63904))

(assert (= (and b!63880 (not c!8677)) b!63909))

(assert (= (and b!63904 res!34890) b!63906))

(assert (= (and b!63906 res!34892) b!63886))

(assert (= (and b!63909 c!8664) b!63900))

(assert (= (and b!63909 (not c!8664)) b!63874))

(assert (= (and b!63900 res!34893) b!63893))

(assert (= (and b!63893 res!34887) b!63897))

(assert (= (and b!63874 c!8672) b!63884))

(assert (= (and b!63874 (not c!8672)) b!63901))

(assert (= (and b!63884 res!34889) b!63903))

(assert (= (and b!63903 res!34891) b!63888))

(assert (= (or b!63900 b!63884) bm!5113))

(assert (= (or b!63897 b!63888) bm!5123))

(assert (= (or b!63906 bm!5113) bm!5120))

(assert (= (or b!63904 b!63909) bm!5102))

(assert (= (or b!63912 b!63908) bm!5101))

(assert (= (or bm!5116 bm!5123) bm!5122))

(assert (= (or bm!5105 bm!5120) bm!5103))

(assert (= (or bm!5114 bm!5102) bm!5118))

(assert (= (or b!63905 b!63909) bm!5111))

(assert (= (or b!63883 b!63904) bm!5112))

(assert (= (or b!63898 b!63880) bm!5119))

(assert (= (or b!63898 b!63880) bm!5115))

(assert (= (and bm!5115 c!8675) b!63891))

(assert (= (and bm!5115 (not c!8675)) b!63878))

(assert (= (or bm!5110 bm!5119) bm!5106))

(assert (= (or bm!5104 b!63880) bm!5117))

(assert (= (or bm!5108 b!63880) bm!5121))

(assert (= (and bm!5121 c!8665) b!63902))

(assert (= (and bm!5121 (not c!8665)) b!63910))

(assert (= (and d!13225 res!34883) b!63877))

(assert (= (and b!63877 c!8666) b!63887))

(assert (= (and b!63877 (not c!8666)) b!63914))

(assert (= (and b!63887 res!34882) b!63889))

(assert (= (or b!63887 b!63889 b!63914) bm!5107))

(assert (= (or b!63889 b!63914) bm!5109))

(declare-fun m!58105 () Bool)

(assert (=> b!63893 m!58105))

(assert (=> bm!5109 m!57991))

(declare-fun m!58107 () Bool)

(assert (=> b!63886 m!58107))

(assert (=> b!63881 m!57973))

(declare-fun m!58109 () Bool)

(assert (=> b!63881 m!58109))

(declare-fun m!58111 () Bool)

(assert (=> b!63896 m!58111))

(declare-fun m!58113 () Bool)

(assert (=> b!63878 m!58113))

(declare-fun m!58115 () Bool)

(assert (=> bm!5106 m!58115))

(declare-fun m!58117 () Bool)

(assert (=> bm!5106 m!58117))

(declare-fun m!58119 () Bool)

(assert (=> bm!5117 m!58119))

(assert (=> b!63915 m!57985))

(declare-fun m!58121 () Bool)

(assert (=> b!63915 m!58121))

(assert (=> bm!5111 m!57973))

(declare-fun m!58123 () Bool)

(assert (=> bm!5111 m!58123))

(declare-fun m!58125 () Bool)

(assert (=> b!63885 m!58125))

(declare-fun m!58127 () Bool)

(assert (=> b!63903 m!58127))

(assert (=> b!63887 m!57973))

(declare-fun m!58129 () Bool)

(assert (=> b!63887 m!58129))

(declare-fun m!58131 () Bool)

(assert (=> b!63889 m!58131))

(assert (=> bm!5112 m!57973))

(declare-fun m!58133 () Bool)

(assert (=> bm!5112 m!58133))

(declare-fun m!58135 () Bool)

(assert (=> bm!5107 m!58135))

(assert (=> b!63880 m!57973))

(assert (=> b!63880 m!57985))

(declare-fun m!58137 () Bool)

(assert (=> b!63880 m!58137))

(declare-fun m!58139 () Bool)

(assert (=> b!63880 m!58139))

(declare-fun m!58141 () Bool)

(assert (=> b!63880 m!58141))

(declare-fun m!58143 () Bool)

(assert (=> b!63880 m!58143))

(assert (=> b!63880 m!58139))

(assert (=> b!63880 m!58115))

(declare-fun m!58145 () Bool)

(assert (=> bm!5103 m!58145))

(assert (=> bm!5122 m!57973))

(declare-fun m!58147 () Bool)

(assert (=> bm!5122 m!58147))

(assert (=> b!63910 m!58113))

(declare-fun m!58149 () Bool)

(assert (=> bm!5121 m!58149))

(assert (=> bm!5115 m!57973))

(declare-fun m!58151 () Bool)

(assert (=> bm!5115 m!58151))

(declare-fun m!58153 () Bool)

(assert (=> b!63875 m!58153))

(assert (=> bm!5118 m!57973))

(assert (=> bm!5118 m!58109))

(assert (=> bm!5101 m!57973))

(assert (=> bm!5101 m!57985))

(declare-fun m!58155 () Bool)

(assert (=> bm!5101 m!58155))

(declare-fun m!58157 () Bool)

(assert (=> d!13225 m!58157))

(assert (=> d!13225 m!57963))

(assert (=> b!63907 m!57985))

(declare-fun m!58159 () Bool)

(assert (=> b!63907 m!58159))

(assert (=> b!63651 d!13225))

(declare-fun d!13227 () Bool)

(declare-fun c!8680 () Bool)

(assert (=> d!13227 (= c!8680 ((_ is ValueCellFull!866) (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun e!41909 () V!2873)

(assert (=> d!13227 (= (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!41909)))

(declare-fun b!63920 () Bool)

(declare-fun get!1096 (ValueCell!866 V!2873) V!2873)

(assert (=> b!63920 (= e!41909 (get!1096 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!63921 () Bool)

(declare-fun get!1097 (ValueCell!866 V!2873) V!2873)

(assert (=> b!63921 (= e!41909 (get!1097 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13227 c!8680) b!63920))

(assert (= (and d!13227 (not c!8680)) b!63921))

(assert (=> b!63920 m!57981))

(assert (=> b!63920 m!57983))

(declare-fun m!58161 () Bool)

(assert (=> b!63920 m!58161))

(assert (=> b!63921 m!57981))

(assert (=> b!63921 m!57983))

(declare-fun m!58163 () Bool)

(assert (=> b!63921 m!58163))

(assert (=> b!63651 d!13227))

(declare-fun d!13229 () Bool)

(assert (=> d!13229 (= (validMask!0 (mask!6023 (v!2428 (underlying!232 thiss!992)))) (and (or (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000001111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000011111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000001111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000011111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000001111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000011111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000000001111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000000011111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000000111111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000001111111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000011111111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000000111111111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000001111111111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000011111111111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000000111111111111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000001111111111111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000011111111111111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000000111111111111111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000001111111111111111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000011111111111111111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00000111111111111111111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00001111111111111111111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00011111111111111111111111111111) (= (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6023 (v!2428 (underlying!232 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!63637 d!13229))

(declare-fun b!63930 () Bool)

(declare-fun e!41917 () Bool)

(declare-fun e!41918 () Bool)

(assert (=> b!63930 (= e!41917 e!41918)))

(declare-fun c!8683 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!63930 (= c!8683 (validKeyInArray!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!5126 () Bool)

(declare-fun call!5129 () Bool)

(assert (=> bm!5126 (= call!5129 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3743 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun d!13231 () Bool)

(declare-fun res!34900 () Bool)

(assert (=> d!13231 (=> res!34900 e!41917)))

(assert (=> d!13231 (= res!34900 (bvsge #b00000000000000000000000000000000 (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(assert (=> d!13231 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992)))) e!41917)))

(declare-fun b!63931 () Bool)

(declare-fun e!41916 () Bool)

(assert (=> b!63931 (= e!41918 e!41916)))

(declare-fun lt!26985 () (_ BitVec 64))

(assert (=> b!63931 (= lt!26985 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!26984 () Unit!1751)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3751 (_ BitVec 64) (_ BitVec 32)) Unit!1751)

(assert (=> b!63931 (= lt!26984 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) lt!26985 #b00000000000000000000000000000000))))

(assert (=> b!63931 (arrayContainsKey!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) lt!26985 #b00000000000000000000000000000000)))

(declare-fun lt!26983 () Unit!1751)

(assert (=> b!63931 (= lt!26983 lt!26984)))

(declare-fun res!34899 () Bool)

(assert (=> b!63931 (= res!34899 (= (seekEntryOrOpen!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b00000000000000000000000000000000) (_keys!3743 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992)))) (Found!233 #b00000000000000000000000000000000)))))

(assert (=> b!63931 (=> (not res!34899) (not e!41916))))

(declare-fun b!63932 () Bool)

(assert (=> b!63932 (= e!41918 call!5129)))

(declare-fun b!63933 () Bool)

(assert (=> b!63933 (= e!41916 call!5129)))

(assert (= (and d!13231 (not res!34900)) b!63930))

(assert (= (and b!63930 c!8683) b!63931))

(assert (= (and b!63930 (not c!8683)) b!63932))

(assert (= (and b!63931 res!34899) b!63933))

(assert (= (or b!63933 b!63932) bm!5126))

(declare-fun m!58165 () Bool)

(assert (=> b!63930 m!58165))

(assert (=> b!63930 m!58165))

(declare-fun m!58167 () Bool)

(assert (=> b!63930 m!58167))

(declare-fun m!58169 () Bool)

(assert (=> bm!5126 m!58169))

(assert (=> b!63931 m!58165))

(declare-fun m!58171 () Bool)

(assert (=> b!63931 m!58171))

(declare-fun m!58173 () Bool)

(assert (=> b!63931 m!58173))

(assert (=> b!63931 m!58165))

(declare-fun m!58175 () Bool)

(assert (=> b!63931 m!58175))

(assert (=> b!63647 d!13231))

(declare-fun d!13233 () Bool)

(assert (=> d!13233 (= (valid!273 thiss!992) (valid!272 (v!2428 (underlying!232 thiss!992))))))

(declare-fun bs!2778 () Bool)

(assert (= bs!2778 d!13233))

(declare-fun m!58177 () Bool)

(assert (=> bs!2778 m!58177))

(assert (=> start!9022 d!13233))

(declare-fun d!13235 () Bool)

(assert (=> d!13235 (not (arrayContainsKey!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!26988 () Unit!1751)

(declare-fun choose!68 (array!3751 (_ BitVec 32) (_ BitVec 64) List!1450) Unit!1751)

(assert (=> d!13235 (= lt!26988 (choose!68 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (Cons!1446 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) Nil!1447)))))

(assert (=> d!13235 (bvslt (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13235 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (Cons!1446 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) Nil!1447)) lt!26988)))

(declare-fun bs!2779 () Bool)

(assert (= bs!2779 d!13235))

(assert (=> bs!2779 m!57973))

(assert (=> bs!2779 m!57977))

(assert (=> bs!2779 m!57973))

(declare-fun m!58179 () Bool)

(assert (=> bs!2779 m!58179))

(assert (=> b!63643 d!13235))

(declare-fun d!13237 () Bool)

(assert (=> d!13237 (arrayNoDuplicates!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) from!355 Nil!1447)))

(declare-fun lt!26991 () Unit!1751)

(declare-fun choose!39 (array!3751 (_ BitVec 32) (_ BitVec 32)) Unit!1751)

(assert (=> d!13237 (= lt!26991 (choose!39 (_keys!3743 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!13237 (bvslt (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13237 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000000 from!355) lt!26991)))

(declare-fun bs!2780 () Bool)

(assert (= bs!2780 d!13237))

(assert (=> bs!2780 m!57971))

(declare-fun m!58181 () Bool)

(assert (=> bs!2780 m!58181))

(assert (=> b!63643 d!13237))

(declare-fun d!13239 () Bool)

(declare-fun res!34905 () Bool)

(declare-fun e!41923 () Bool)

(assert (=> d!13239 (=> res!34905 e!41923)))

(assert (=> d!13239 (= res!34905 (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(assert (=> d!13239 (= (arrayContainsKey!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!41923)))

(declare-fun b!63938 () Bool)

(declare-fun e!41924 () Bool)

(assert (=> b!63938 (= e!41923 e!41924)))

(declare-fun res!34906 () Bool)

(assert (=> b!63938 (=> (not res!34906) (not e!41924))))

(assert (=> b!63938 (= res!34906 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(declare-fun b!63939 () Bool)

(assert (=> b!63939 (= e!41924 (arrayContainsKey!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!13239 (not res!34905)) b!63938))

(assert (= (and b!63938 res!34906) b!63939))

(declare-fun m!58183 () Bool)

(assert (=> d!13239 m!58183))

(assert (=> b!63939 m!57973))

(declare-fun m!58185 () Bool)

(assert (=> b!63939 m!58185))

(assert (=> b!63643 d!13239))

(declare-fun d!13241 () Bool)

(declare-fun e!41927 () Bool)

(assert (=> d!13241 e!41927))

(declare-fun c!8686 () Bool)

(assert (=> d!13241 (= c!8686 (and (not (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!26994 () Unit!1751)

(declare-fun choose!350 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 64) (_ BitVec 32) Int) Unit!1751)

(assert (=> d!13241 (= lt!26994 (choose!350 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (_values!2091 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992))) (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) (minValue!2018 (v!2428 (underlying!232 thiss!992))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992)))))))

(assert (=> d!13241 (validMask!0 (mask!6023 (v!2428 (underlying!232 thiss!992))))))

(assert (=> d!13241 (= (lemmaListMapContainsThenArrayContainsFrom!37 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (_values!2091 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992))) (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) (minValue!2018 (v!2428 (underlying!232 thiss!992))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992)))) lt!26994)))

(declare-fun b!63944 () Bool)

(assert (=> b!63944 (= e!41927 (arrayContainsKey!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!63945 () Bool)

(assert (=> b!63945 (= e!41927 (ite (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!13241 c!8686) b!63944))

(assert (= (and d!13241 (not c!8686)) b!63945))

(assert (=> d!13241 m!57973))

(declare-fun m!58187 () Bool)

(assert (=> d!13241 m!58187))

(assert (=> d!13241 m!57959))

(assert (=> b!63944 m!57973))

(assert (=> b!63944 m!57977))

(assert (=> b!63643 d!13241))

(declare-fun b!63956 () Bool)

(declare-fun e!41939 () Bool)

(declare-fun e!41938 () Bool)

(assert (=> b!63956 (= e!41939 e!41938)))

(declare-fun res!34914 () Bool)

(assert (=> b!63956 (=> (not res!34914) (not e!41938))))

(declare-fun e!41937 () Bool)

(assert (=> b!63956 (= res!34914 (not e!41937))))

(declare-fun res!34915 () Bool)

(assert (=> b!63956 (=> (not res!34915) (not e!41937))))

(assert (=> b!63956 (= res!34915 (validKeyInArray!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun b!63957 () Bool)

(declare-fun e!41936 () Bool)

(assert (=> b!63957 (= e!41938 e!41936)))

(declare-fun c!8689 () Bool)

(assert (=> b!63957 (= c!8689 (validKeyInArray!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun d!13243 () Bool)

(declare-fun res!34913 () Bool)

(assert (=> d!13243 (=> res!34913 e!41939)))

(assert (=> d!13243 (= res!34913 (bvsge from!355 (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(assert (=> d!13243 (= (arrayNoDuplicates!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) from!355 Nil!1447) e!41939)))

(declare-fun b!63958 () Bool)

(declare-fun call!5132 () Bool)

(assert (=> b!63958 (= e!41936 call!5132)))

(declare-fun b!63959 () Bool)

(declare-fun contains!694 (List!1450 (_ BitVec 64)) Bool)

(assert (=> b!63959 (= e!41937 (contains!694 Nil!1447 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun b!63960 () Bool)

(assert (=> b!63960 (= e!41936 call!5132)))

(declare-fun bm!5129 () Bool)

(assert (=> bm!5129 (= call!5132 (arrayNoDuplicates!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!8689 (Cons!1446 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) Nil!1447) Nil!1447)))))

(assert (= (and d!13243 (not res!34913)) b!63956))

(assert (= (and b!63956 res!34915) b!63959))

(assert (= (and b!63956 res!34914) b!63957))

(assert (= (and b!63957 c!8689) b!63960))

(assert (= (and b!63957 (not c!8689)) b!63958))

(assert (= (or b!63960 b!63958) bm!5129))

(assert (=> b!63956 m!57973))

(assert (=> b!63956 m!57973))

(declare-fun m!58189 () Bool)

(assert (=> b!63956 m!58189))

(assert (=> b!63957 m!57973))

(assert (=> b!63957 m!57973))

(assert (=> b!63957 m!58189))

(assert (=> b!63959 m!57973))

(assert (=> b!63959 m!57973))

(declare-fun m!58191 () Bool)

(assert (=> b!63959 m!58191))

(assert (=> bm!5129 m!57973))

(declare-fun m!58193 () Bool)

(assert (=> bm!5129 m!58193))

(assert (=> b!63643 d!13243))

(declare-fun d!13245 () Bool)

(declare-fun res!34922 () Bool)

(declare-fun e!41942 () Bool)

(assert (=> d!13245 (=> (not res!34922) (not e!41942))))

(declare-fun simpleValid!45 (LongMapFixedSize!640) Bool)

(assert (=> d!13245 (= res!34922 (simpleValid!45 newMap!16))))

(assert (=> d!13245 (= (valid!272 newMap!16) e!41942)))

(declare-fun b!63967 () Bool)

(declare-fun res!34923 () Bool)

(assert (=> b!63967 (=> (not res!34923) (not e!41942))))

(declare-fun arrayCountValidKeys!0 (array!3751 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!63967 (= res!34923 (= (arrayCountValidKeys!0 (_keys!3743 newMap!16) #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))) (_size!369 newMap!16)))))

(declare-fun b!63968 () Bool)

(declare-fun res!34924 () Bool)

(assert (=> b!63968 (=> (not res!34924) (not e!41942))))

(assert (=> b!63968 (= res!34924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3743 newMap!16) (mask!6023 newMap!16)))))

(declare-fun b!63969 () Bool)

(assert (=> b!63969 (= e!41942 (arrayNoDuplicates!0 (_keys!3743 newMap!16) #b00000000000000000000000000000000 Nil!1447))))

(assert (= (and d!13245 res!34922) b!63967))

(assert (= (and b!63967 res!34923) b!63968))

(assert (= (and b!63968 res!34924) b!63969))

(declare-fun m!58195 () Bool)

(assert (=> d!13245 m!58195))

(declare-fun m!58197 () Bool)

(assert (=> b!63967 m!58197))

(declare-fun m!58199 () Bool)

(assert (=> b!63968 m!58199))

(declare-fun m!58201 () Bool)

(assert (=> b!63969 m!58201))

(assert (=> b!63638 d!13245))

(declare-fun d!13247 () Bool)

(assert (=> d!13247 (= (map!1116 newMap!16) (getCurrentListMap!394 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun bs!2781 () Bool)

(assert (= bs!2781 d!13247))

(assert (=> bs!2781 m!58113))

(assert (=> b!63654 d!13247))

(declare-fun b!64012 () Bool)

(declare-fun e!41973 () Bool)

(declare-fun call!5150 () Bool)

(assert (=> b!64012 (= e!41973 (not call!5150))))

(declare-fun d!13249 () Bool)

(declare-fun e!41980 () Bool)

(assert (=> d!13249 e!41980))

(declare-fun res!34948 () Bool)

(assert (=> d!13249 (=> (not res!34948) (not e!41980))))

(assert (=> d!13249 (= res!34948 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))))

(declare-fun lt!27042 () ListLongMap!1365)

(declare-fun lt!27060 () ListLongMap!1365)

(assert (=> d!13249 (= lt!27042 lt!27060)))

(declare-fun lt!27054 () Unit!1751)

(declare-fun e!41976 () Unit!1751)

(assert (=> d!13249 (= lt!27054 e!41976)))

(declare-fun c!8702 () Bool)

(declare-fun e!41971 () Bool)

(assert (=> d!13249 (= c!8702 e!41971)))

(declare-fun res!34945 () Bool)

(assert (=> d!13249 (=> (not res!34945) (not e!41971))))

(assert (=> d!13249 (= res!34945 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(declare-fun e!41978 () ListLongMap!1365)

(assert (=> d!13249 (= lt!27060 e!41978)))

(declare-fun c!8707 () Bool)

(assert (=> d!13249 (= c!8707 (and (not (= (bvand (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13249 (validMask!0 (mask!6023 (v!2428 (underlying!232 thiss!992))))))

(assert (=> d!13249 (= (getCurrentListMap!394 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (_values!2091 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992))) (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) (minValue!2018 (v!2428 (underlying!232 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992)))) lt!27042)))

(declare-fun b!64013 () Bool)

(declare-fun res!34949 () Bool)

(assert (=> b!64013 (=> (not res!34949) (not e!41980))))

(declare-fun e!41981 () Bool)

(assert (=> b!64013 (= res!34949 e!41981)))

(declare-fun c!8706 () Bool)

(assert (=> b!64013 (= c!8706 (not (= (bvand (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!64014 () Bool)

(declare-fun c!8705 () Bool)

(assert (=> b!64014 (= c!8705 (and (not (= (bvand (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!41970 () ListLongMap!1365)

(declare-fun e!41972 () ListLongMap!1365)

(assert (=> b!64014 (= e!41970 e!41972)))

(declare-fun b!64015 () Bool)

(declare-fun call!5151 () ListLongMap!1365)

(assert (=> b!64015 (= e!41972 call!5151)))

(declare-fun b!64016 () Bool)

(declare-fun call!5148 () ListLongMap!1365)

(assert (=> b!64016 (= e!41970 call!5148)))

(declare-fun b!64017 () Bool)

(declare-fun Unit!1758 () Unit!1751)

(assert (=> b!64017 (= e!41976 Unit!1758)))

(declare-fun b!64018 () Bool)

(declare-fun e!41979 () Bool)

(assert (=> b!64018 (= e!41979 (validKeyInArray!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!64019 () Bool)

(declare-fun e!41977 () Bool)

(declare-fun apply!69 (ListLongMap!1365 (_ BitVec 64)) V!2873)

(assert (=> b!64019 (= e!41977 (= (apply!69 lt!27042 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun bm!5144 () Bool)

(declare-fun call!5149 () ListLongMap!1365)

(declare-fun getCurrentListMapNoExtraKeys!47 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 32) Int) ListLongMap!1365)

(assert (=> bm!5144 (= call!5149 (getCurrentListMapNoExtraKeys!47 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (_values!2091 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992))) (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) (minValue!2018 (v!2428 (underlying!232 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun b!64020 () Bool)

(assert (=> b!64020 (= e!41972 call!5148)))

(declare-fun bm!5145 () Bool)

(declare-fun call!5147 () ListLongMap!1365)

(assert (=> bm!5145 (= call!5151 call!5147)))

(declare-fun b!64021 () Bool)

(assert (=> b!64021 (= e!41980 e!41973)))

(declare-fun c!8703 () Bool)

(assert (=> b!64021 (= c!8703 (not (= (bvand (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64022 () Bool)

(assert (=> b!64022 (= e!41971 (validKeyInArray!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!64023 () Bool)

(assert (=> b!64023 (= e!41978 e!41970)))

(declare-fun c!8704 () Bool)

(assert (=> b!64023 (= c!8704 (and (not (= (bvand (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64024 () Bool)

(declare-fun call!5152 () ListLongMap!1365)

(assert (=> b!64024 (= e!41978 (+!84 call!5152 (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992))))))))

(declare-fun b!64025 () Bool)

(declare-fun e!41969 () Bool)

(assert (=> b!64025 (= e!41981 e!41969)))

(declare-fun res!34947 () Bool)

(declare-fun call!5153 () Bool)

(assert (=> b!64025 (= res!34947 call!5153)))

(assert (=> b!64025 (=> (not res!34947) (not e!41969))))

(declare-fun bm!5146 () Bool)

(assert (=> bm!5146 (= call!5148 call!5152)))

(declare-fun bm!5147 () Bool)

(assert (=> bm!5147 (= call!5153 (contains!693 lt!27042 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64026 () Bool)

(declare-fun e!41975 () Bool)

(assert (=> b!64026 (= e!41975 (= (apply!69 lt!27042 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64026 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2027 (_values!2091 (v!2428 (underlying!232 thiss!992))))))))

(assert (=> b!64026 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(declare-fun bm!5148 () Bool)

(assert (=> bm!5148 (= call!5147 call!5149)))

(declare-fun b!64027 () Bool)

(assert (=> b!64027 (= e!41969 (= (apply!69 lt!27042 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun b!64028 () Bool)

(declare-fun lt!27040 () Unit!1751)

(assert (=> b!64028 (= e!41976 lt!27040)))

(declare-fun lt!27055 () ListLongMap!1365)

(assert (=> b!64028 (= lt!27055 (getCurrentListMapNoExtraKeys!47 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (_values!2091 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992))) (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) (minValue!2018 (v!2428 (underlying!232 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun lt!27058 () (_ BitVec 64))

(assert (=> b!64028 (= lt!27058 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27047 () (_ BitVec 64))

(assert (=> b!64028 (= lt!27047 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27039 () Unit!1751)

(declare-fun addStillContains!45 (ListLongMap!1365 (_ BitVec 64) V!2873 (_ BitVec 64)) Unit!1751)

(assert (=> b!64028 (= lt!27039 (addStillContains!45 lt!27055 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) lt!27047))))

(assert (=> b!64028 (contains!693 (+!84 lt!27055 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27047)))

(declare-fun lt!27050 () Unit!1751)

(assert (=> b!64028 (= lt!27050 lt!27039)))

(declare-fun lt!27059 () ListLongMap!1365)

(assert (=> b!64028 (= lt!27059 (getCurrentListMapNoExtraKeys!47 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (_values!2091 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992))) (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) (minValue!2018 (v!2428 (underlying!232 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun lt!27043 () (_ BitVec 64))

(assert (=> b!64028 (= lt!27043 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27048 () (_ BitVec 64))

(assert (=> b!64028 (= lt!27048 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27052 () Unit!1751)

(declare-fun addApplyDifferent!45 (ListLongMap!1365 (_ BitVec 64) V!2873 (_ BitVec 64)) Unit!1751)

(assert (=> b!64028 (= lt!27052 (addApplyDifferent!45 lt!27059 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992))) lt!27048))))

(assert (=> b!64028 (= (apply!69 (+!84 lt!27059 (tuple2!2057 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27048) (apply!69 lt!27059 lt!27048))))

(declare-fun lt!27045 () Unit!1751)

(assert (=> b!64028 (= lt!27045 lt!27052)))

(declare-fun lt!27053 () ListLongMap!1365)

(assert (=> b!64028 (= lt!27053 (getCurrentListMapNoExtraKeys!47 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (_values!2091 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992))) (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) (minValue!2018 (v!2428 (underlying!232 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun lt!27057 () (_ BitVec 64))

(assert (=> b!64028 (= lt!27057 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27044 () (_ BitVec 64))

(assert (=> b!64028 (= lt!27044 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27051 () Unit!1751)

(assert (=> b!64028 (= lt!27051 (addApplyDifferent!45 lt!27053 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) lt!27044))))

(assert (=> b!64028 (= (apply!69 (+!84 lt!27053 (tuple2!2057 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27044) (apply!69 lt!27053 lt!27044))))

(declare-fun lt!27046 () Unit!1751)

(assert (=> b!64028 (= lt!27046 lt!27051)))

(declare-fun lt!27041 () ListLongMap!1365)

(assert (=> b!64028 (= lt!27041 (getCurrentListMapNoExtraKeys!47 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (_values!2091 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992))) (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) (minValue!2018 (v!2428 (underlying!232 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun lt!27056 () (_ BitVec 64))

(assert (=> b!64028 (= lt!27056 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27049 () (_ BitVec 64))

(assert (=> b!64028 (= lt!27049 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!64028 (= lt!27040 (addApplyDifferent!45 lt!27041 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992))) lt!27049))))

(assert (=> b!64028 (= (apply!69 (+!84 lt!27041 (tuple2!2057 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27049) (apply!69 lt!27041 lt!27049))))

(declare-fun b!64029 () Bool)

(assert (=> b!64029 (= e!41981 (not call!5153))))

(declare-fun b!64030 () Bool)

(declare-fun res!34943 () Bool)

(assert (=> b!64030 (=> (not res!34943) (not e!41980))))

(declare-fun e!41974 () Bool)

(assert (=> b!64030 (= res!34943 e!41974)))

(declare-fun res!34944 () Bool)

(assert (=> b!64030 (=> res!34944 e!41974)))

(assert (=> b!64030 (= res!34944 (not e!41979))))

(declare-fun res!34950 () Bool)

(assert (=> b!64030 (=> (not res!34950) (not e!41979))))

(assert (=> b!64030 (= res!34950 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(declare-fun b!64031 () Bool)

(assert (=> b!64031 (= e!41973 e!41977)))

(declare-fun res!34946 () Bool)

(assert (=> b!64031 (= res!34946 call!5150)))

(assert (=> b!64031 (=> (not res!34946) (not e!41977))))

(declare-fun bm!5149 () Bool)

(assert (=> bm!5149 (= call!5150 (contains!693 lt!27042 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5150 () Bool)

(assert (=> bm!5150 (= call!5152 (+!84 (ite c!8707 call!5149 (ite c!8704 call!5147 call!5151)) (ite (or c!8707 c!8704) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(declare-fun b!64032 () Bool)

(assert (=> b!64032 (= e!41974 e!41975)))

(declare-fun res!34951 () Bool)

(assert (=> b!64032 (=> (not res!34951) (not e!41975))))

(assert (=> b!64032 (= res!34951 (contains!693 lt!27042 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64032 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(assert (= (and d!13249 c!8707) b!64024))

(assert (= (and d!13249 (not c!8707)) b!64023))

(assert (= (and b!64023 c!8704) b!64016))

(assert (= (and b!64023 (not c!8704)) b!64014))

(assert (= (and b!64014 c!8705) b!64020))

(assert (= (and b!64014 (not c!8705)) b!64015))

(assert (= (or b!64020 b!64015) bm!5145))

(assert (= (or b!64016 bm!5145) bm!5148))

(assert (= (or b!64016 b!64020) bm!5146))

(assert (= (or b!64024 bm!5148) bm!5144))

(assert (= (or b!64024 bm!5146) bm!5150))

(assert (= (and d!13249 res!34945) b!64022))

(assert (= (and d!13249 c!8702) b!64028))

(assert (= (and d!13249 (not c!8702)) b!64017))

(assert (= (and d!13249 res!34948) b!64030))

(assert (= (and b!64030 res!34950) b!64018))

(assert (= (and b!64030 (not res!34944)) b!64032))

(assert (= (and b!64032 res!34951) b!64026))

(assert (= (and b!64030 res!34943) b!64013))

(assert (= (and b!64013 c!8706) b!64025))

(assert (= (and b!64013 (not c!8706)) b!64029))

(assert (= (and b!64025 res!34947) b!64027))

(assert (= (or b!64025 b!64029) bm!5147))

(assert (= (and b!64013 res!34949) b!64021))

(assert (= (and b!64021 c!8703) b!64031))

(assert (= (and b!64021 (not c!8703)) b!64012))

(assert (= (and b!64031 res!34946) b!64019))

(assert (= (or b!64031 b!64012) bm!5149))

(declare-fun b_lambda!2863 () Bool)

(assert (=> (not b_lambda!2863) (not b!64026)))

(assert (=> b!64026 t!4852))

(declare-fun b_and!3913 () Bool)

(assert (= b_and!3893 (and (=> t!4852 result!2463) b_and!3913)))

(assert (=> b!64026 t!4854))

(declare-fun b_and!3915 () Bool)

(assert (= b_and!3895 (and (=> t!4854 result!2467) b_and!3915)))

(declare-fun m!58203 () Bool)

(assert (=> b!64024 m!58203))

(declare-fun m!58205 () Bool)

(assert (=> bm!5149 m!58205))

(declare-fun m!58207 () Bool)

(assert (=> b!64026 m!58207))

(assert (=> b!64026 m!58207))

(assert (=> b!64026 m!57983))

(declare-fun m!58209 () Bool)

(assert (=> b!64026 m!58209))

(assert (=> b!64026 m!58183))

(assert (=> b!64026 m!57983))

(assert (=> b!64026 m!58183))

(declare-fun m!58211 () Bool)

(assert (=> b!64026 m!58211))

(declare-fun m!58213 () Bool)

(assert (=> b!64028 m!58213))

(declare-fun m!58215 () Bool)

(assert (=> b!64028 m!58215))

(declare-fun m!58217 () Bool)

(assert (=> b!64028 m!58217))

(declare-fun m!58219 () Bool)

(assert (=> b!64028 m!58219))

(declare-fun m!58221 () Bool)

(assert (=> b!64028 m!58221))

(declare-fun m!58223 () Bool)

(assert (=> b!64028 m!58223))

(assert (=> b!64028 m!58221))

(declare-fun m!58225 () Bool)

(assert (=> b!64028 m!58225))

(assert (=> b!64028 m!58213))

(declare-fun m!58227 () Bool)

(assert (=> b!64028 m!58227))

(assert (=> b!64028 m!58183))

(declare-fun m!58229 () Bool)

(assert (=> b!64028 m!58229))

(declare-fun m!58231 () Bool)

(assert (=> b!64028 m!58231))

(declare-fun m!58233 () Bool)

(assert (=> b!64028 m!58233))

(declare-fun m!58235 () Bool)

(assert (=> b!64028 m!58235))

(assert (=> b!64028 m!58217))

(declare-fun m!58237 () Bool)

(assert (=> b!64028 m!58237))

(declare-fun m!58239 () Bool)

(assert (=> b!64028 m!58239))

(declare-fun m!58241 () Bool)

(assert (=> b!64028 m!58241))

(assert (=> b!64028 m!58239))

(declare-fun m!58243 () Bool)

(assert (=> b!64028 m!58243))

(assert (=> bm!5144 m!58215))

(assert (=> d!13249 m!57959))

(assert (=> b!64032 m!58183))

(assert (=> b!64032 m!58183))

(declare-fun m!58245 () Bool)

(assert (=> b!64032 m!58245))

(declare-fun m!58247 () Bool)

(assert (=> bm!5150 m!58247))

(assert (=> b!64018 m!58183))

(assert (=> b!64018 m!58183))

(declare-fun m!58249 () Bool)

(assert (=> b!64018 m!58249))

(declare-fun m!58251 () Bool)

(assert (=> b!64027 m!58251))

(declare-fun m!58253 () Bool)

(assert (=> b!64019 m!58253))

(assert (=> b!64022 m!58183))

(assert (=> b!64022 m!58183))

(assert (=> b!64022 m!58249))

(declare-fun m!58255 () Bool)

(assert (=> bm!5147 m!58255))

(assert (=> b!63654 d!13249))

(declare-fun d!13251 () Bool)

(assert (=> d!13251 (= (array_inv!1115 (_keys!3743 newMap!16)) (bvsge (size!2026 (_keys!3743 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!63641 d!13251))

(declare-fun d!13253 () Bool)

(assert (=> d!13253 (= (array_inv!1116 (_values!2091 newMap!16)) (bvsge (size!2027 (_values!2091 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!63641 d!13253))

(declare-fun d!13255 () Bool)

(assert (=> d!13255 (= (array_inv!1115 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvsge (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!63640 d!13255))

(declare-fun d!13257 () Bool)

(assert (=> d!13257 (= (array_inv!1116 (_values!2091 (v!2428 (underlying!232 thiss!992)))) (bvsge (size!2027 (_values!2091 (v!2428 (underlying!232 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!63640 d!13257))

(declare-fun mapIsEmpty!2979 () Bool)

(declare-fun mapRes!2979 () Bool)

(assert (=> mapIsEmpty!2979 mapRes!2979))

(declare-fun condMapEmpty!2979 () Bool)

(declare-fun mapDefault!2979 () ValueCell!866)

(assert (=> mapNonEmpty!2963 (= condMapEmpty!2979 (= mapRest!2963 ((as const (Array (_ BitVec 32) ValueCell!866)) mapDefault!2979)))))

(declare-fun e!41986 () Bool)

(assert (=> mapNonEmpty!2963 (= tp!8153 (and e!41986 mapRes!2979))))

(declare-fun b!64039 () Bool)

(declare-fun e!41987 () Bool)

(assert (=> b!64039 (= e!41987 tp_is_empty!2419)))

(declare-fun mapNonEmpty!2979 () Bool)

(declare-fun tp!8181 () Bool)

(assert (=> mapNonEmpty!2979 (= mapRes!2979 (and tp!8181 e!41987))))

(declare-fun mapValue!2979 () ValueCell!866)

(declare-fun mapKey!2979 () (_ BitVec 32))

(declare-fun mapRest!2979 () (Array (_ BitVec 32) ValueCell!866))

(assert (=> mapNonEmpty!2979 (= mapRest!2963 (store mapRest!2979 mapKey!2979 mapValue!2979))))

(declare-fun b!64040 () Bool)

(assert (=> b!64040 (= e!41986 tp_is_empty!2419)))

(assert (= (and mapNonEmpty!2963 condMapEmpty!2979) mapIsEmpty!2979))

(assert (= (and mapNonEmpty!2963 (not condMapEmpty!2979)) mapNonEmpty!2979))

(assert (= (and mapNonEmpty!2979 ((_ is ValueCellFull!866) mapValue!2979)) b!64039))

(assert (= (and mapNonEmpty!2963 ((_ is ValueCellFull!866) mapDefault!2979)) b!64040))

(declare-fun m!58257 () Bool)

(assert (=> mapNonEmpty!2979 m!58257))

(declare-fun mapIsEmpty!2980 () Bool)

(declare-fun mapRes!2980 () Bool)

(assert (=> mapIsEmpty!2980 mapRes!2980))

(declare-fun condMapEmpty!2980 () Bool)

(declare-fun mapDefault!2980 () ValueCell!866)

(assert (=> mapNonEmpty!2964 (= condMapEmpty!2980 (= mapRest!2964 ((as const (Array (_ BitVec 32) ValueCell!866)) mapDefault!2980)))))

(declare-fun e!41988 () Bool)

(assert (=> mapNonEmpty!2964 (= tp!8152 (and e!41988 mapRes!2980))))

(declare-fun b!64041 () Bool)

(declare-fun e!41989 () Bool)

(assert (=> b!64041 (= e!41989 tp_is_empty!2419)))

(declare-fun mapNonEmpty!2980 () Bool)

(declare-fun tp!8182 () Bool)

(assert (=> mapNonEmpty!2980 (= mapRes!2980 (and tp!8182 e!41989))))

(declare-fun mapValue!2980 () ValueCell!866)

(declare-fun mapKey!2980 () (_ BitVec 32))

(declare-fun mapRest!2980 () (Array (_ BitVec 32) ValueCell!866))

(assert (=> mapNonEmpty!2980 (= mapRest!2964 (store mapRest!2980 mapKey!2980 mapValue!2980))))

(declare-fun b!64042 () Bool)

(assert (=> b!64042 (= e!41988 tp_is_empty!2419)))

(assert (= (and mapNonEmpty!2964 condMapEmpty!2980) mapIsEmpty!2980))

(assert (= (and mapNonEmpty!2964 (not condMapEmpty!2980)) mapNonEmpty!2980))

(assert (= (and mapNonEmpty!2980 ((_ is ValueCellFull!866) mapValue!2980)) b!64041))

(assert (= (and mapNonEmpty!2964 ((_ is ValueCellFull!866) mapDefault!2980)) b!64042))

(declare-fun m!58259 () Bool)

(assert (=> mapNonEmpty!2980 m!58259))

(declare-fun b_lambda!2865 () Bool)

(assert (= b_lambda!2863 (or (and b!63640 b_free!2005) (and b!63641 b_free!2007 (= (defaultEntry!2108 newMap!16) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))))) b_lambda!2865)))

(check-sat (not b!63915) (not bm!5126) (not b!63889) (not mapNonEmpty!2979) b_and!3915 (not bm!5106) (not b!63920) (not bm!5103) (not b!63789) (not b!63881) (not b!63910) (not bm!5150) (not d!13245) (not bm!5101) (not bm!5122) tp_is_empty!2419 (not d!13235) (not b_next!2007) (not b!64018) (not b!64022) (not b!64019) (not mapNonEmpty!2980) (not b_lambda!2861) (not d!13223) (not bm!5115) (not b!63921) (not b!63956) (not b!64027) (not bm!5147) (not b!63967) (not bm!5107) (not b!64026) (not b!63968) (not b!63969) (not bm!5112) (not b!63939) (not b!63887) (not bm!5121) (not b!63931) (not b!63907) (not b_next!2005) (not b!64032) (not b!63878) (not b!64024) (not b!63787) (not bm!5111) b_and!3913 (not bm!5144) (not d!13233) (not b!63944) (not b!63880) (not b!63959) (not b!64028) (not bm!5109) (not d!13225) (not bm!5117) (not b!63957) (not bm!5149) (not bm!5118) (not d!13249) (not d!13247) (not b!63930) (not bm!5129) (not b_lambda!2865) (not d!13241) (not d!13237))
(check-sat b_and!3913 b_and!3915 (not b_next!2005) (not b_next!2007))
(get-model)

(declare-fun b!64067 () Bool)

(declare-fun lt!27075 () Unit!1751)

(declare-fun lt!27081 () Unit!1751)

(assert (=> b!64067 (= lt!27075 lt!27081)))

(declare-fun lt!27077 () (_ BitVec 64))

(declare-fun lt!27080 () (_ BitVec 64))

(declare-fun lt!27079 () V!2873)

(declare-fun lt!27078 () ListLongMap!1365)

(assert (=> b!64067 (not (contains!693 (+!84 lt!27078 (tuple2!2057 lt!27077 lt!27079)) lt!27080))))

(declare-fun addStillNotContains!19 (ListLongMap!1365 (_ BitVec 64) V!2873 (_ BitVec 64)) Unit!1751)

(assert (=> b!64067 (= lt!27081 (addStillNotContains!19 lt!27078 lt!27077 lt!27079 lt!27080))))

(assert (=> b!64067 (= lt!27080 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!64067 (= lt!27079 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64067 (= lt!27077 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!5156 () ListLongMap!1365)

(assert (=> b!64067 (= lt!27078 call!5156)))

(declare-fun e!42010 () ListLongMap!1365)

(assert (=> b!64067 (= e!42010 (+!84 call!5156 (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!64068 () Bool)

(declare-fun e!42005 () Bool)

(declare-fun lt!27076 () ListLongMap!1365)

(declare-fun isEmpty!306 (ListLongMap!1365) Bool)

(assert (=> b!64068 (= e!42005 (isEmpty!306 lt!27076))))

(declare-fun b!64069 () Bool)

(assert (=> b!64069 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(assert (=> b!64069 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2027 (_values!2091 (v!2428 (underlying!232 thiss!992))))))))

(declare-fun e!42007 () Bool)

(assert (=> b!64069 (= e!42007 (= (apply!69 lt!27076 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!64070 () Bool)

(assert (=> b!64070 (= e!42010 call!5156)))

(declare-fun b!64072 () Bool)

(declare-fun e!42008 () Bool)

(assert (=> b!64072 (= e!42008 e!42007)))

(assert (=> b!64072 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(declare-fun res!34961 () Bool)

(assert (=> b!64072 (= res!34961 (contains!693 lt!27076 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64072 (=> (not res!34961) (not e!42007))))

(declare-fun b!64073 () Bool)

(assert (=> b!64073 (= e!42008 e!42005)))

(declare-fun c!8716 () Bool)

(assert (=> b!64073 (= c!8716 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(declare-fun b!64074 () Bool)

(declare-fun res!34963 () Bool)

(declare-fun e!42006 () Bool)

(assert (=> b!64074 (=> (not res!34963) (not e!42006))))

(assert (=> b!64074 (= res!34963 (not (contains!693 lt!27076 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!64075 () Bool)

(assert (=> b!64075 (= e!42006 e!42008)))

(declare-fun c!8717 () Bool)

(declare-fun e!42009 () Bool)

(assert (=> b!64075 (= c!8717 e!42009)))

(declare-fun res!34962 () Bool)

(assert (=> b!64075 (=> (not res!34962) (not e!42009))))

(assert (=> b!64075 (= res!34962 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(declare-fun b!64076 () Bool)

(assert (=> b!64076 (= e!42005 (= lt!27076 (getCurrentListMapNoExtraKeys!47 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (_values!2091 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992))) (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) (minValue!2018 (v!2428 (underlying!232 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))))))))

(declare-fun b!64077 () Bool)

(assert (=> b!64077 (= e!42009 (validKeyInArray!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64077 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun bm!5153 () Bool)

(assert (=> bm!5153 (= call!5156 (getCurrentListMapNoExtraKeys!47 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (_values!2091 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992))) (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) (minValue!2018 (v!2428 (underlying!232 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun b!64078 () Bool)

(declare-fun e!42004 () ListLongMap!1365)

(assert (=> b!64078 (= e!42004 e!42010)))

(declare-fun c!8718 () Bool)

(assert (=> b!64078 (= c!8718 (validKeyInArray!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!64071 () Bool)

(assert (=> b!64071 (= e!42004 (ListLongMap!1366 Nil!1448))))

(declare-fun d!13259 () Bool)

(assert (=> d!13259 e!42006))

(declare-fun res!34960 () Bool)

(assert (=> d!13259 (=> (not res!34960) (not e!42006))))

(assert (=> d!13259 (= res!34960 (not (contains!693 lt!27076 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13259 (= lt!27076 e!42004)))

(declare-fun c!8719 () Bool)

(assert (=> d!13259 (= c!8719 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(assert (=> d!13259 (validMask!0 (mask!6023 (v!2428 (underlying!232 thiss!992))))))

(assert (=> d!13259 (= (getCurrentListMapNoExtraKeys!47 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (_values!2091 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992))) (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) (minValue!2018 (v!2428 (underlying!232 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992)))) lt!27076)))

(assert (= (and d!13259 c!8719) b!64071))

(assert (= (and d!13259 (not c!8719)) b!64078))

(assert (= (and b!64078 c!8718) b!64067))

(assert (= (and b!64078 (not c!8718)) b!64070))

(assert (= (or b!64067 b!64070) bm!5153))

(assert (= (and d!13259 res!34960) b!64074))

(assert (= (and b!64074 res!34963) b!64075))

(assert (= (and b!64075 res!34962) b!64077))

(assert (= (and b!64075 c!8717) b!64072))

(assert (= (and b!64075 (not c!8717)) b!64073))

(assert (= (and b!64072 res!34961) b!64069))

(assert (= (and b!64073 c!8716) b!64076))

(assert (= (and b!64073 (not c!8716)) b!64068))

(declare-fun b_lambda!2867 () Bool)

(assert (=> (not b_lambda!2867) (not b!64067)))

(assert (=> b!64067 t!4852))

(declare-fun b_and!3917 () Bool)

(assert (= b_and!3913 (and (=> t!4852 result!2463) b_and!3917)))

(assert (=> b!64067 t!4854))

(declare-fun b_and!3919 () Bool)

(assert (= b_and!3915 (and (=> t!4854 result!2467) b_and!3919)))

(declare-fun b_lambda!2869 () Bool)

(assert (=> (not b_lambda!2869) (not b!64069)))

(assert (=> b!64069 t!4852))

(declare-fun b_and!3921 () Bool)

(assert (= b_and!3917 (and (=> t!4852 result!2463) b_and!3921)))

(assert (=> b!64069 t!4854))

(declare-fun b_and!3923 () Bool)

(assert (= b_and!3919 (and (=> t!4854 result!2467) b_and!3923)))

(declare-fun m!58261 () Bool)

(assert (=> b!64076 m!58261))

(assert (=> b!64067 m!58207))

(assert (=> b!64067 m!57983))

(assert (=> b!64067 m!58209))

(declare-fun m!58263 () Bool)

(assert (=> b!64067 m!58263))

(declare-fun m!58265 () Bool)

(assert (=> b!64067 m!58265))

(declare-fun m!58267 () Bool)

(assert (=> b!64067 m!58267))

(assert (=> b!64067 m!58265))

(assert (=> b!64067 m!58207))

(assert (=> b!64067 m!57983))

(assert (=> b!64067 m!58183))

(declare-fun m!58269 () Bool)

(assert (=> b!64067 m!58269))

(assert (=> b!64072 m!58183))

(assert (=> b!64072 m!58183))

(declare-fun m!58271 () Bool)

(assert (=> b!64072 m!58271))

(declare-fun m!58273 () Bool)

(assert (=> b!64068 m!58273))

(declare-fun m!58275 () Bool)

(assert (=> b!64074 m!58275))

(declare-fun m!58277 () Bool)

(assert (=> d!13259 m!58277))

(assert (=> d!13259 m!57959))

(assert (=> bm!5153 m!58261))

(assert (=> b!64078 m!58183))

(assert (=> b!64078 m!58183))

(assert (=> b!64078 m!58249))

(assert (=> b!64077 m!58183))

(assert (=> b!64077 m!58183))

(assert (=> b!64077 m!58249))

(assert (=> b!64069 m!58207))

(assert (=> b!64069 m!57983))

(assert (=> b!64069 m!58209))

(assert (=> b!64069 m!58207))

(assert (=> b!64069 m!57983))

(assert (=> b!64069 m!58183))

(assert (=> b!64069 m!58183))

(declare-fun m!58279 () Bool)

(assert (=> b!64069 m!58279))

(assert (=> bm!5144 d!13259))

(declare-fun b!64079 () Bool)

(declare-fun e!42015 () Bool)

(declare-fun call!5160 () Bool)

(assert (=> b!64079 (= e!42015 (not call!5160))))

(declare-fun d!13261 () Bool)

(declare-fun e!42022 () Bool)

(assert (=> d!13261 e!42022))

(declare-fun res!34969 () Bool)

(assert (=> d!13261 (=> (not res!34969) (not e!42022))))

(assert (=> d!13261 (= res!34969 (or (bvsge #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))))

(declare-fun lt!27085 () ListLongMap!1365)

(declare-fun lt!27103 () ListLongMap!1365)

(assert (=> d!13261 (= lt!27085 lt!27103)))

(declare-fun lt!27097 () Unit!1751)

(declare-fun e!42018 () Unit!1751)

(assert (=> d!13261 (= lt!27097 e!42018)))

(declare-fun c!8720 () Bool)

(declare-fun e!42013 () Bool)

(assert (=> d!13261 (= c!8720 e!42013)))

(declare-fun res!34966 () Bool)

(assert (=> d!13261 (=> (not res!34966) (not e!42013))))

(assert (=> d!13261 (= res!34966 (bvslt #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))

(declare-fun e!42020 () ListLongMap!1365)

(assert (=> d!13261 (= lt!27103 e!42020)))

(declare-fun c!8725 () Bool)

(assert (=> d!13261 (= c!8725 (and (not (= (bvand (ite (and c!8671 c!8667) lt!26964 (extraKeys!1983 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!8671 c!8667) lt!26964 (extraKeys!1983 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13261 (validMask!0 (mask!6023 newMap!16))))

(assert (=> d!13261 (= (getCurrentListMap!394 (_keys!3743 newMap!16) (ite (or c!8671 c!8674) (_values!2091 newMap!16) (array!3754 (store (arr!1793 (_values!2091 newMap!16)) (index!3059 lt!26958) (ValueCellFull!866 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2027 (_values!2091 newMap!16)))) (mask!6023 newMap!16) (ite (and c!8671 c!8667) lt!26964 (extraKeys!1983 newMap!16)) (ite (and c!8671 c!8667) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) lt!27085)))

(declare-fun b!64080 () Bool)

(declare-fun res!34970 () Bool)

(assert (=> b!64080 (=> (not res!34970) (not e!42022))))

(declare-fun e!42023 () Bool)

(assert (=> b!64080 (= res!34970 e!42023)))

(declare-fun c!8724 () Bool)

(assert (=> b!64080 (= c!8724 (not (= (bvand (ite (and c!8671 c!8667) lt!26964 (extraKeys!1983 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!8723 () Bool)

(declare-fun b!64081 () Bool)

(assert (=> b!64081 (= c!8723 (and (not (= (bvand (ite (and c!8671 c!8667) lt!26964 (extraKeys!1983 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!8671 c!8667) lt!26964 (extraKeys!1983 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!42012 () ListLongMap!1365)

(declare-fun e!42014 () ListLongMap!1365)

(assert (=> b!64081 (= e!42012 e!42014)))

(declare-fun b!64082 () Bool)

(declare-fun call!5161 () ListLongMap!1365)

(assert (=> b!64082 (= e!42014 call!5161)))

(declare-fun b!64083 () Bool)

(declare-fun call!5158 () ListLongMap!1365)

(assert (=> b!64083 (= e!42012 call!5158)))

(declare-fun b!64084 () Bool)

(declare-fun Unit!1759 () Unit!1751)

(assert (=> b!64084 (= e!42018 Unit!1759)))

(declare-fun b!64085 () Bool)

(declare-fun e!42021 () Bool)

(assert (=> b!64085 (= e!42021 (validKeyInArray!0 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64086 () Bool)

(declare-fun e!42019 () Bool)

(assert (=> b!64086 (= e!42019 (= (apply!69 lt!27085 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2018 newMap!16)))))

(declare-fun call!5159 () ListLongMap!1365)

(declare-fun bm!5154 () Bool)

(assert (=> bm!5154 (= call!5159 (getCurrentListMapNoExtraKeys!47 (_keys!3743 newMap!16) (ite (or c!8671 c!8674) (_values!2091 newMap!16) (array!3754 (store (arr!1793 (_values!2091 newMap!16)) (index!3059 lt!26958) (ValueCellFull!866 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2027 (_values!2091 newMap!16)))) (mask!6023 newMap!16) (ite (and c!8671 c!8667) lt!26964 (extraKeys!1983 newMap!16)) (ite (and c!8671 c!8667) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun b!64087 () Bool)

(assert (=> b!64087 (= e!42014 call!5158)))

(declare-fun bm!5155 () Bool)

(declare-fun call!5157 () ListLongMap!1365)

(assert (=> bm!5155 (= call!5161 call!5157)))

(declare-fun b!64088 () Bool)

(assert (=> b!64088 (= e!42022 e!42015)))

(declare-fun c!8721 () Bool)

(assert (=> b!64088 (= c!8721 (not (= (bvand (ite (and c!8671 c!8667) lt!26964 (extraKeys!1983 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64089 () Bool)

(assert (=> b!64089 (= e!42013 (validKeyInArray!0 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64090 () Bool)

(assert (=> b!64090 (= e!42020 e!42012)))

(declare-fun c!8722 () Bool)

(assert (=> b!64090 (= c!8722 (and (not (= (bvand (ite (and c!8671 c!8667) lt!26964 (extraKeys!1983 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!8671 c!8667) lt!26964 (extraKeys!1983 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64091 () Bool)

(declare-fun call!5162 () ListLongMap!1365)

(assert (=> b!64091 (= e!42020 (+!84 call!5162 (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 newMap!16))))))

(declare-fun b!64092 () Bool)

(declare-fun e!42011 () Bool)

(assert (=> b!64092 (= e!42023 e!42011)))

(declare-fun res!34968 () Bool)

(declare-fun call!5163 () Bool)

(assert (=> b!64092 (= res!34968 call!5163)))

(assert (=> b!64092 (=> (not res!34968) (not e!42011))))

(declare-fun bm!5156 () Bool)

(assert (=> bm!5156 (= call!5158 call!5162)))

(declare-fun bm!5157 () Bool)

(assert (=> bm!5157 (= call!5163 (contains!693 lt!27085 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42017 () Bool)

(declare-fun b!64093 () Bool)

(assert (=> b!64093 (= e!42017 (= (apply!69 lt!27085 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)) (get!1095 (select (arr!1793 (ite (or c!8671 c!8674) (_values!2091 newMap!16) (array!3754 (store (arr!1793 (_values!2091 newMap!16)) (index!3059 lt!26958) (ValueCellFull!866 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2027 (_values!2091 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!313 (defaultEntry!2108 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64093 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2027 (ite (or c!8671 c!8674) (_values!2091 newMap!16) (array!3754 (store (arr!1793 (_values!2091 newMap!16)) (index!3059 lt!26958) (ValueCellFull!866 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2027 (_values!2091 newMap!16)))))))))

(assert (=> b!64093 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))

(declare-fun bm!5158 () Bool)

(assert (=> bm!5158 (= call!5157 call!5159)))

(declare-fun b!64094 () Bool)

(assert (=> b!64094 (= e!42011 (= (apply!69 lt!27085 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!8671 c!8667) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16))))))

(declare-fun b!64095 () Bool)

(declare-fun lt!27083 () Unit!1751)

(assert (=> b!64095 (= e!42018 lt!27083)))

(declare-fun lt!27098 () ListLongMap!1365)

(assert (=> b!64095 (= lt!27098 (getCurrentListMapNoExtraKeys!47 (_keys!3743 newMap!16) (ite (or c!8671 c!8674) (_values!2091 newMap!16) (array!3754 (store (arr!1793 (_values!2091 newMap!16)) (index!3059 lt!26958) (ValueCellFull!866 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2027 (_values!2091 newMap!16)))) (mask!6023 newMap!16) (ite (and c!8671 c!8667) lt!26964 (extraKeys!1983 newMap!16)) (ite (and c!8671 c!8667) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27101 () (_ BitVec 64))

(assert (=> b!64095 (= lt!27101 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27090 () (_ BitVec 64))

(assert (=> b!64095 (= lt!27090 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27082 () Unit!1751)

(assert (=> b!64095 (= lt!27082 (addStillContains!45 lt!27098 lt!27101 (ite (and c!8671 c!8667) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) lt!27090))))

(assert (=> b!64095 (contains!693 (+!84 lt!27098 (tuple2!2057 lt!27101 (ite (and c!8671 c!8667) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)))) lt!27090)))

(declare-fun lt!27093 () Unit!1751)

(assert (=> b!64095 (= lt!27093 lt!27082)))

(declare-fun lt!27102 () ListLongMap!1365)

(assert (=> b!64095 (= lt!27102 (getCurrentListMapNoExtraKeys!47 (_keys!3743 newMap!16) (ite (or c!8671 c!8674) (_values!2091 newMap!16) (array!3754 (store (arr!1793 (_values!2091 newMap!16)) (index!3059 lt!26958) (ValueCellFull!866 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2027 (_values!2091 newMap!16)))) (mask!6023 newMap!16) (ite (and c!8671 c!8667) lt!26964 (extraKeys!1983 newMap!16)) (ite (and c!8671 c!8667) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27086 () (_ BitVec 64))

(assert (=> b!64095 (= lt!27086 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27091 () (_ BitVec 64))

(assert (=> b!64095 (= lt!27091 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27095 () Unit!1751)

(assert (=> b!64095 (= lt!27095 (addApplyDifferent!45 lt!27102 lt!27086 (minValue!2018 newMap!16) lt!27091))))

(assert (=> b!64095 (= (apply!69 (+!84 lt!27102 (tuple2!2057 lt!27086 (minValue!2018 newMap!16))) lt!27091) (apply!69 lt!27102 lt!27091))))

(declare-fun lt!27088 () Unit!1751)

(assert (=> b!64095 (= lt!27088 lt!27095)))

(declare-fun lt!27096 () ListLongMap!1365)

(assert (=> b!64095 (= lt!27096 (getCurrentListMapNoExtraKeys!47 (_keys!3743 newMap!16) (ite (or c!8671 c!8674) (_values!2091 newMap!16) (array!3754 (store (arr!1793 (_values!2091 newMap!16)) (index!3059 lt!26958) (ValueCellFull!866 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2027 (_values!2091 newMap!16)))) (mask!6023 newMap!16) (ite (and c!8671 c!8667) lt!26964 (extraKeys!1983 newMap!16)) (ite (and c!8671 c!8667) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27100 () (_ BitVec 64))

(assert (=> b!64095 (= lt!27100 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27087 () (_ BitVec 64))

(assert (=> b!64095 (= lt!27087 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27094 () Unit!1751)

(assert (=> b!64095 (= lt!27094 (addApplyDifferent!45 lt!27096 lt!27100 (ite (and c!8671 c!8667) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) lt!27087))))

(assert (=> b!64095 (= (apply!69 (+!84 lt!27096 (tuple2!2057 lt!27100 (ite (and c!8671 c!8667) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)))) lt!27087) (apply!69 lt!27096 lt!27087))))

(declare-fun lt!27089 () Unit!1751)

(assert (=> b!64095 (= lt!27089 lt!27094)))

(declare-fun lt!27084 () ListLongMap!1365)

(assert (=> b!64095 (= lt!27084 (getCurrentListMapNoExtraKeys!47 (_keys!3743 newMap!16) (ite (or c!8671 c!8674) (_values!2091 newMap!16) (array!3754 (store (arr!1793 (_values!2091 newMap!16)) (index!3059 lt!26958) (ValueCellFull!866 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2027 (_values!2091 newMap!16)))) (mask!6023 newMap!16) (ite (and c!8671 c!8667) lt!26964 (extraKeys!1983 newMap!16)) (ite (and c!8671 c!8667) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27099 () (_ BitVec 64))

(assert (=> b!64095 (= lt!27099 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27092 () (_ BitVec 64))

(assert (=> b!64095 (= lt!27092 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64095 (= lt!27083 (addApplyDifferent!45 lt!27084 lt!27099 (minValue!2018 newMap!16) lt!27092))))

(assert (=> b!64095 (= (apply!69 (+!84 lt!27084 (tuple2!2057 lt!27099 (minValue!2018 newMap!16))) lt!27092) (apply!69 lt!27084 lt!27092))))

(declare-fun b!64096 () Bool)

(assert (=> b!64096 (= e!42023 (not call!5163))))

(declare-fun b!64097 () Bool)

(declare-fun res!34964 () Bool)

(assert (=> b!64097 (=> (not res!34964) (not e!42022))))

(declare-fun e!42016 () Bool)

(assert (=> b!64097 (= res!34964 e!42016)))

(declare-fun res!34965 () Bool)

(assert (=> b!64097 (=> res!34965 e!42016)))

(assert (=> b!64097 (= res!34965 (not e!42021))))

(declare-fun res!34971 () Bool)

(assert (=> b!64097 (=> (not res!34971) (not e!42021))))

(assert (=> b!64097 (= res!34971 (bvslt #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))

(declare-fun b!64098 () Bool)

(assert (=> b!64098 (= e!42015 e!42019)))

(declare-fun res!34967 () Bool)

(assert (=> b!64098 (= res!34967 call!5160)))

(assert (=> b!64098 (=> (not res!34967) (not e!42019))))

(declare-fun bm!5159 () Bool)

(assert (=> bm!5159 (= call!5160 (contains!693 lt!27085 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5160 () Bool)

(assert (=> bm!5160 (= call!5162 (+!84 (ite c!8725 call!5159 (ite c!8722 call!5157 call!5161)) (ite (or c!8725 c!8722) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!8671 c!8667) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 newMap!16)))))))

(declare-fun b!64099 () Bool)

(assert (=> b!64099 (= e!42016 e!42017)))

(declare-fun res!34972 () Bool)

(assert (=> b!64099 (=> (not res!34972) (not e!42017))))

(assert (=> b!64099 (= res!34972 (contains!693 lt!27085 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!64099 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))

(assert (= (and d!13261 c!8725) b!64091))

(assert (= (and d!13261 (not c!8725)) b!64090))

(assert (= (and b!64090 c!8722) b!64083))

(assert (= (and b!64090 (not c!8722)) b!64081))

(assert (= (and b!64081 c!8723) b!64087))

(assert (= (and b!64081 (not c!8723)) b!64082))

(assert (= (or b!64087 b!64082) bm!5155))

(assert (= (or b!64083 bm!5155) bm!5158))

(assert (= (or b!64083 b!64087) bm!5156))

(assert (= (or b!64091 bm!5158) bm!5154))

(assert (= (or b!64091 bm!5156) bm!5160))

(assert (= (and d!13261 res!34966) b!64089))

(assert (= (and d!13261 c!8720) b!64095))

(assert (= (and d!13261 (not c!8720)) b!64084))

(assert (= (and d!13261 res!34969) b!64097))

(assert (= (and b!64097 res!34971) b!64085))

(assert (= (and b!64097 (not res!34965)) b!64099))

(assert (= (and b!64099 res!34972) b!64093))

(assert (= (and b!64097 res!34964) b!64080))

(assert (= (and b!64080 c!8724) b!64092))

(assert (= (and b!64080 (not c!8724)) b!64096))

(assert (= (and b!64092 res!34968) b!64094))

(assert (= (or b!64092 b!64096) bm!5157))

(assert (= (and b!64080 res!34970) b!64088))

(assert (= (and b!64088 c!8721) b!64098))

(assert (= (and b!64088 (not c!8721)) b!64079))

(assert (= (and b!64098 res!34967) b!64086))

(assert (= (or b!64098 b!64079) bm!5159))

(declare-fun b_lambda!2871 () Bool)

(assert (=> (not b_lambda!2871) (not b!64093)))

(declare-fun t!4867 () Bool)

(declare-fun tb!1393 () Bool)

(assert (=> (and b!63640 (= (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) (defaultEntry!2108 newMap!16)) t!4867) tb!1393))

(declare-fun result!2483 () Bool)

(assert (=> tb!1393 (= result!2483 tp_is_empty!2419)))

(assert (=> b!64093 t!4867))

(declare-fun b_and!3925 () Bool)

(assert (= b_and!3921 (and (=> t!4867 result!2483) b_and!3925)))

(declare-fun t!4869 () Bool)

(declare-fun tb!1395 () Bool)

(assert (=> (and b!63641 (= (defaultEntry!2108 newMap!16) (defaultEntry!2108 newMap!16)) t!4869) tb!1395))

(declare-fun result!2485 () Bool)

(assert (= result!2485 result!2483))

(assert (=> b!64093 t!4869))

(declare-fun b_and!3927 () Bool)

(assert (= b_and!3923 (and (=> t!4869 result!2485) b_and!3927)))

(declare-fun m!58281 () Bool)

(assert (=> b!64091 m!58281))

(declare-fun m!58283 () Bool)

(assert (=> bm!5159 m!58283))

(declare-fun m!58285 () Bool)

(assert (=> b!64093 m!58285))

(assert (=> b!64093 m!58285))

(declare-fun m!58287 () Bool)

(assert (=> b!64093 m!58287))

(declare-fun m!58289 () Bool)

(assert (=> b!64093 m!58289))

(declare-fun m!58291 () Bool)

(assert (=> b!64093 m!58291))

(assert (=> b!64093 m!58287))

(assert (=> b!64093 m!58291))

(declare-fun m!58293 () Bool)

(assert (=> b!64093 m!58293))

(declare-fun m!58295 () Bool)

(assert (=> b!64095 m!58295))

(declare-fun m!58297 () Bool)

(assert (=> b!64095 m!58297))

(declare-fun m!58299 () Bool)

(assert (=> b!64095 m!58299))

(declare-fun m!58301 () Bool)

(assert (=> b!64095 m!58301))

(declare-fun m!58303 () Bool)

(assert (=> b!64095 m!58303))

(declare-fun m!58305 () Bool)

(assert (=> b!64095 m!58305))

(assert (=> b!64095 m!58303))

(declare-fun m!58307 () Bool)

(assert (=> b!64095 m!58307))

(assert (=> b!64095 m!58295))

(declare-fun m!58309 () Bool)

(assert (=> b!64095 m!58309))

(assert (=> b!64095 m!58291))

(declare-fun m!58311 () Bool)

(assert (=> b!64095 m!58311))

(declare-fun m!58313 () Bool)

(assert (=> b!64095 m!58313))

(declare-fun m!58315 () Bool)

(assert (=> b!64095 m!58315))

(declare-fun m!58317 () Bool)

(assert (=> b!64095 m!58317))

(assert (=> b!64095 m!58299))

(declare-fun m!58319 () Bool)

(assert (=> b!64095 m!58319))

(declare-fun m!58321 () Bool)

(assert (=> b!64095 m!58321))

(declare-fun m!58323 () Bool)

(assert (=> b!64095 m!58323))

(assert (=> b!64095 m!58321))

(declare-fun m!58325 () Bool)

(assert (=> b!64095 m!58325))

(assert (=> bm!5154 m!58297))

(declare-fun m!58327 () Bool)

(assert (=> d!13261 m!58327))

(assert (=> b!64099 m!58291))

(assert (=> b!64099 m!58291))

(declare-fun m!58329 () Bool)

(assert (=> b!64099 m!58329))

(declare-fun m!58331 () Bool)

(assert (=> bm!5160 m!58331))

(assert (=> b!64085 m!58291))

(assert (=> b!64085 m!58291))

(declare-fun m!58333 () Bool)

(assert (=> b!64085 m!58333))

(declare-fun m!58335 () Bool)

(assert (=> b!64094 m!58335))

(declare-fun m!58337 () Bool)

(assert (=> b!64086 m!58337))

(assert (=> b!64089 m!58291))

(assert (=> b!64089 m!58291))

(assert (=> b!64089 m!58333))

(declare-fun m!58339 () Bool)

(assert (=> bm!5157 m!58339))

(assert (=> bm!5106 d!13261))

(declare-fun b!64100 () Bool)

(declare-fun e!42028 () Bool)

(declare-fun call!5167 () Bool)

(assert (=> b!64100 (= e!42028 (not call!5167))))

(declare-fun d!13263 () Bool)

(declare-fun e!42035 () Bool)

(assert (=> d!13263 e!42035))

(declare-fun res!34978 () Bool)

(assert (=> d!13263 (=> (not res!34978) (not e!42035))))

(assert (=> d!13263 (= res!34978 (or (bvsge #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))))

(declare-fun lt!27107 () ListLongMap!1365)

(declare-fun lt!27125 () ListLongMap!1365)

(assert (=> d!13263 (= lt!27107 lt!27125)))

(declare-fun lt!27119 () Unit!1751)

(declare-fun e!42031 () Unit!1751)

(assert (=> d!13263 (= lt!27119 e!42031)))

(declare-fun c!8726 () Bool)

(declare-fun e!42026 () Bool)

(assert (=> d!13263 (= c!8726 e!42026)))

(declare-fun res!34975 () Bool)

(assert (=> d!13263 (=> (not res!34975) (not e!42026))))

(assert (=> d!13263 (= res!34975 (bvslt #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))

(declare-fun e!42033 () ListLongMap!1365)

(assert (=> d!13263 (= lt!27125 e!42033)))

(declare-fun c!8731 () Bool)

(assert (=> d!13263 (= c!8731 (and (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13263 (validMask!0 (mask!6023 newMap!16))))

(assert (=> d!13263 (= (getCurrentListMap!394 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) lt!27107)))

(declare-fun b!64101 () Bool)

(declare-fun res!34979 () Bool)

(assert (=> b!64101 (=> (not res!34979) (not e!42035))))

(declare-fun e!42036 () Bool)

(assert (=> b!64101 (= res!34979 e!42036)))

(declare-fun c!8730 () Bool)

(assert (=> b!64101 (= c!8730 (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!64102 () Bool)

(declare-fun c!8729 () Bool)

(assert (=> b!64102 (= c!8729 (and (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!42025 () ListLongMap!1365)

(declare-fun e!42027 () ListLongMap!1365)

(assert (=> b!64102 (= e!42025 e!42027)))

(declare-fun b!64103 () Bool)

(declare-fun call!5168 () ListLongMap!1365)

(assert (=> b!64103 (= e!42027 call!5168)))

(declare-fun b!64104 () Bool)

(declare-fun call!5165 () ListLongMap!1365)

(assert (=> b!64104 (= e!42025 call!5165)))

(declare-fun b!64105 () Bool)

(declare-fun Unit!1760 () Unit!1751)

(assert (=> b!64105 (= e!42031 Unit!1760)))

(declare-fun b!64106 () Bool)

(declare-fun e!42034 () Bool)

(assert (=> b!64106 (= e!42034 (validKeyInArray!0 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64107 () Bool)

(declare-fun e!42032 () Bool)

(assert (=> b!64107 (= e!42032 (= (apply!69 lt!27107 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2018 newMap!16)))))

(declare-fun bm!5161 () Bool)

(declare-fun call!5166 () ListLongMap!1365)

(assert (=> bm!5161 (= call!5166 (getCurrentListMapNoExtraKeys!47 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun b!64108 () Bool)

(assert (=> b!64108 (= e!42027 call!5165)))

(declare-fun bm!5162 () Bool)

(declare-fun call!5164 () ListLongMap!1365)

(assert (=> bm!5162 (= call!5168 call!5164)))

(declare-fun b!64109 () Bool)

(assert (=> b!64109 (= e!42035 e!42028)))

(declare-fun c!8727 () Bool)

(assert (=> b!64109 (= c!8727 (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64110 () Bool)

(assert (=> b!64110 (= e!42026 (validKeyInArray!0 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64111 () Bool)

(assert (=> b!64111 (= e!42033 e!42025)))

(declare-fun c!8728 () Bool)

(assert (=> b!64111 (= c!8728 (and (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64112 () Bool)

(declare-fun call!5169 () ListLongMap!1365)

(assert (=> b!64112 (= e!42033 (+!84 call!5169 (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 newMap!16))))))

(declare-fun b!64113 () Bool)

(declare-fun e!42024 () Bool)

(assert (=> b!64113 (= e!42036 e!42024)))

(declare-fun res!34977 () Bool)

(declare-fun call!5170 () Bool)

(assert (=> b!64113 (= res!34977 call!5170)))

(assert (=> b!64113 (=> (not res!34977) (not e!42024))))

(declare-fun bm!5163 () Bool)

(assert (=> bm!5163 (= call!5165 call!5169)))

(declare-fun bm!5164 () Bool)

(assert (=> bm!5164 (= call!5170 (contains!693 lt!27107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64114 () Bool)

(declare-fun e!42030 () Bool)

(assert (=> b!64114 (= e!42030 (= (apply!69 lt!27107 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)) (get!1095 (select (arr!1793 (_values!2091 newMap!16)) #b00000000000000000000000000000000) (dynLambda!313 (defaultEntry!2108 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2027 (_values!2091 newMap!16))))))

(assert (=> b!64114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))

(declare-fun bm!5165 () Bool)

(assert (=> bm!5165 (= call!5164 call!5166)))

(declare-fun b!64115 () Bool)

(assert (=> b!64115 (= e!42024 (= (apply!69 lt!27107 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2018 newMap!16)))))

(declare-fun b!64116 () Bool)

(declare-fun lt!27105 () Unit!1751)

(assert (=> b!64116 (= e!42031 lt!27105)))

(declare-fun lt!27120 () ListLongMap!1365)

(assert (=> b!64116 (= lt!27120 (getCurrentListMapNoExtraKeys!47 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27123 () (_ BitVec 64))

(assert (=> b!64116 (= lt!27123 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27112 () (_ BitVec 64))

(assert (=> b!64116 (= lt!27112 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27104 () Unit!1751)

(assert (=> b!64116 (= lt!27104 (addStillContains!45 lt!27120 lt!27123 (zeroValue!2018 newMap!16) lt!27112))))

(assert (=> b!64116 (contains!693 (+!84 lt!27120 (tuple2!2057 lt!27123 (zeroValue!2018 newMap!16))) lt!27112)))

(declare-fun lt!27115 () Unit!1751)

(assert (=> b!64116 (= lt!27115 lt!27104)))

(declare-fun lt!27124 () ListLongMap!1365)

(assert (=> b!64116 (= lt!27124 (getCurrentListMapNoExtraKeys!47 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27108 () (_ BitVec 64))

(assert (=> b!64116 (= lt!27108 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27113 () (_ BitVec 64))

(assert (=> b!64116 (= lt!27113 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27117 () Unit!1751)

(assert (=> b!64116 (= lt!27117 (addApplyDifferent!45 lt!27124 lt!27108 (minValue!2018 newMap!16) lt!27113))))

(assert (=> b!64116 (= (apply!69 (+!84 lt!27124 (tuple2!2057 lt!27108 (minValue!2018 newMap!16))) lt!27113) (apply!69 lt!27124 lt!27113))))

(declare-fun lt!27110 () Unit!1751)

(assert (=> b!64116 (= lt!27110 lt!27117)))

(declare-fun lt!27118 () ListLongMap!1365)

(assert (=> b!64116 (= lt!27118 (getCurrentListMapNoExtraKeys!47 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27122 () (_ BitVec 64))

(assert (=> b!64116 (= lt!27122 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27109 () (_ BitVec 64))

(assert (=> b!64116 (= lt!27109 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27116 () Unit!1751)

(assert (=> b!64116 (= lt!27116 (addApplyDifferent!45 lt!27118 lt!27122 (zeroValue!2018 newMap!16) lt!27109))))

(assert (=> b!64116 (= (apply!69 (+!84 lt!27118 (tuple2!2057 lt!27122 (zeroValue!2018 newMap!16))) lt!27109) (apply!69 lt!27118 lt!27109))))

(declare-fun lt!27111 () Unit!1751)

(assert (=> b!64116 (= lt!27111 lt!27116)))

(declare-fun lt!27106 () ListLongMap!1365)

(assert (=> b!64116 (= lt!27106 (getCurrentListMapNoExtraKeys!47 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27121 () (_ BitVec 64))

(assert (=> b!64116 (= lt!27121 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27114 () (_ BitVec 64))

(assert (=> b!64116 (= lt!27114 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64116 (= lt!27105 (addApplyDifferent!45 lt!27106 lt!27121 (minValue!2018 newMap!16) lt!27114))))

(assert (=> b!64116 (= (apply!69 (+!84 lt!27106 (tuple2!2057 lt!27121 (minValue!2018 newMap!16))) lt!27114) (apply!69 lt!27106 lt!27114))))

(declare-fun b!64117 () Bool)

(assert (=> b!64117 (= e!42036 (not call!5170))))

(declare-fun b!64118 () Bool)

(declare-fun res!34973 () Bool)

(assert (=> b!64118 (=> (not res!34973) (not e!42035))))

(declare-fun e!42029 () Bool)

(assert (=> b!64118 (= res!34973 e!42029)))

(declare-fun res!34974 () Bool)

(assert (=> b!64118 (=> res!34974 e!42029)))

(assert (=> b!64118 (= res!34974 (not e!42034))))

(declare-fun res!34980 () Bool)

(assert (=> b!64118 (=> (not res!34980) (not e!42034))))

(assert (=> b!64118 (= res!34980 (bvslt #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))

(declare-fun b!64119 () Bool)

(assert (=> b!64119 (= e!42028 e!42032)))

(declare-fun res!34976 () Bool)

(assert (=> b!64119 (= res!34976 call!5167)))

(assert (=> b!64119 (=> (not res!34976) (not e!42032))))

(declare-fun bm!5166 () Bool)

(assert (=> bm!5166 (= call!5167 (contains!693 lt!27107 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5167 () Bool)

(assert (=> bm!5167 (= call!5169 (+!84 (ite c!8731 call!5166 (ite c!8728 call!5164 call!5168)) (ite (or c!8731 c!8728) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 newMap!16)) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 newMap!16)))))))

(declare-fun b!64120 () Bool)

(assert (=> b!64120 (= e!42029 e!42030)))

(declare-fun res!34981 () Bool)

(assert (=> b!64120 (=> (not res!34981) (not e!42030))))

(assert (=> b!64120 (= res!34981 (contains!693 lt!27107 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!64120 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))

(assert (= (and d!13263 c!8731) b!64112))

(assert (= (and d!13263 (not c!8731)) b!64111))

(assert (= (and b!64111 c!8728) b!64104))

(assert (= (and b!64111 (not c!8728)) b!64102))

(assert (= (and b!64102 c!8729) b!64108))

(assert (= (and b!64102 (not c!8729)) b!64103))

(assert (= (or b!64108 b!64103) bm!5162))

(assert (= (or b!64104 bm!5162) bm!5165))

(assert (= (or b!64104 b!64108) bm!5163))

(assert (= (or b!64112 bm!5165) bm!5161))

(assert (= (or b!64112 bm!5163) bm!5167))

(assert (= (and d!13263 res!34975) b!64110))

(assert (= (and d!13263 c!8726) b!64116))

(assert (= (and d!13263 (not c!8726)) b!64105))

(assert (= (and d!13263 res!34978) b!64118))

(assert (= (and b!64118 res!34980) b!64106))

(assert (= (and b!64118 (not res!34974)) b!64120))

(assert (= (and b!64120 res!34981) b!64114))

(assert (= (and b!64118 res!34973) b!64101))

(assert (= (and b!64101 c!8730) b!64113))

(assert (= (and b!64101 (not c!8730)) b!64117))

(assert (= (and b!64113 res!34977) b!64115))

(assert (= (or b!64113 b!64117) bm!5164))

(assert (= (and b!64101 res!34979) b!64109))

(assert (= (and b!64109 c!8727) b!64119))

(assert (= (and b!64109 (not c!8727)) b!64100))

(assert (= (and b!64119 res!34976) b!64107))

(assert (= (or b!64119 b!64100) bm!5166))

(declare-fun b_lambda!2873 () Bool)

(assert (=> (not b_lambda!2873) (not b!64114)))

(assert (=> b!64114 t!4867))

(declare-fun b_and!3929 () Bool)

(assert (= b_and!3925 (and (=> t!4867 result!2483) b_and!3929)))

(assert (=> b!64114 t!4869))

(declare-fun b_and!3931 () Bool)

(assert (= b_and!3927 (and (=> t!4869 result!2485) b_and!3931)))

(declare-fun m!58341 () Bool)

(assert (=> b!64112 m!58341))

(declare-fun m!58343 () Bool)

(assert (=> bm!5166 m!58343))

(declare-fun m!58345 () Bool)

(assert (=> b!64114 m!58345))

(assert (=> b!64114 m!58345))

(assert (=> b!64114 m!58287))

(declare-fun m!58347 () Bool)

(assert (=> b!64114 m!58347))

(assert (=> b!64114 m!58291))

(assert (=> b!64114 m!58287))

(assert (=> b!64114 m!58291))

(declare-fun m!58349 () Bool)

(assert (=> b!64114 m!58349))

(declare-fun m!58351 () Bool)

(assert (=> b!64116 m!58351))

(declare-fun m!58353 () Bool)

(assert (=> b!64116 m!58353))

(declare-fun m!58355 () Bool)

(assert (=> b!64116 m!58355))

(declare-fun m!58357 () Bool)

(assert (=> b!64116 m!58357))

(declare-fun m!58359 () Bool)

(assert (=> b!64116 m!58359))

(declare-fun m!58361 () Bool)

(assert (=> b!64116 m!58361))

(assert (=> b!64116 m!58359))

(declare-fun m!58363 () Bool)

(assert (=> b!64116 m!58363))

(assert (=> b!64116 m!58351))

(declare-fun m!58365 () Bool)

(assert (=> b!64116 m!58365))

(assert (=> b!64116 m!58291))

(declare-fun m!58367 () Bool)

(assert (=> b!64116 m!58367))

(declare-fun m!58369 () Bool)

(assert (=> b!64116 m!58369))

(declare-fun m!58371 () Bool)

(assert (=> b!64116 m!58371))

(declare-fun m!58373 () Bool)

(assert (=> b!64116 m!58373))

(assert (=> b!64116 m!58355))

(declare-fun m!58375 () Bool)

(assert (=> b!64116 m!58375))

(declare-fun m!58377 () Bool)

(assert (=> b!64116 m!58377))

(declare-fun m!58379 () Bool)

(assert (=> b!64116 m!58379))

(assert (=> b!64116 m!58377))

(declare-fun m!58381 () Bool)

(assert (=> b!64116 m!58381))

(assert (=> bm!5161 m!58353))

(assert (=> d!13263 m!58327))

(assert (=> b!64120 m!58291))

(assert (=> b!64120 m!58291))

(declare-fun m!58383 () Bool)

(assert (=> b!64120 m!58383))

(declare-fun m!58385 () Bool)

(assert (=> bm!5167 m!58385))

(assert (=> b!64106 m!58291))

(assert (=> b!64106 m!58291))

(assert (=> b!64106 m!58333))

(declare-fun m!58387 () Bool)

(assert (=> b!64115 m!58387))

(declare-fun m!58389 () Bool)

(assert (=> b!64107 m!58389))

(assert (=> b!64110 m!58291))

(assert (=> b!64110 m!58291))

(assert (=> b!64110 m!58333))

(declare-fun m!58391 () Bool)

(assert (=> bm!5164 m!58391))

(assert (=> b!63910 d!13263))

(declare-fun d!13265 () Bool)

(assert (=> d!13265 (= (validKeyInArray!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) (and (not (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!63957 d!13265))

(declare-fun d!13267 () Bool)

(declare-fun lt!27128 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!69 (List!1450) (InoxSet (_ BitVec 64)))

(assert (=> d!13267 (= lt!27128 (select (content!69 Nil!1447) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun e!42042 () Bool)

(assert (=> d!13267 (= lt!27128 e!42042)))

(declare-fun res!34986 () Bool)

(assert (=> d!13267 (=> (not res!34986) (not e!42042))))

(assert (=> d!13267 (= res!34986 ((_ is Cons!1446) Nil!1447))))

(assert (=> d!13267 (= (contains!694 Nil!1447 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) lt!27128)))

(declare-fun b!64125 () Bool)

(declare-fun e!42041 () Bool)

(assert (=> b!64125 (= e!42042 e!42041)))

(declare-fun res!34987 () Bool)

(assert (=> b!64125 (=> res!34987 e!42041)))

(assert (=> b!64125 (= res!34987 (= (h!2030 Nil!1447) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun b!64126 () Bool)

(assert (=> b!64126 (= e!42041 (contains!694 (t!4855 Nil!1447) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(assert (= (and d!13267 res!34986) b!64125))

(assert (= (and b!64125 (not res!34987)) b!64126))

(declare-fun m!58393 () Bool)

(assert (=> d!13267 m!58393))

(assert (=> d!13267 m!57973))

(declare-fun m!58395 () Bool)

(assert (=> d!13267 m!58395))

(assert (=> b!64126 m!57973))

(declare-fun m!58397 () Bool)

(assert (=> b!64126 m!58397))

(assert (=> b!63959 d!13267))

(declare-fun d!13269 () Bool)

(assert (=> d!13269 (= (validKeyInArray!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64022 d!13269))

(assert (=> d!13247 d!13263))

(declare-fun d!13271 () Bool)

(declare-fun res!34988 () Bool)

(declare-fun e!42043 () Bool)

(assert (=> d!13271 (=> res!34988 e!42043)))

(assert (=> d!13271 (= res!34988 (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(assert (=> d!13271 (= (arrayContainsKey!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!42043)))

(declare-fun b!64127 () Bool)

(declare-fun e!42044 () Bool)

(assert (=> b!64127 (= e!42043 e!42044)))

(declare-fun res!34989 () Bool)

(assert (=> b!64127 (=> (not res!34989) (not e!42044))))

(assert (=> b!64127 (= res!34989 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(declare-fun b!64128 () Bool)

(assert (=> b!64128 (= e!42044 (arrayContainsKey!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!13271 (not res!34988)) b!64127))

(assert (= (and b!64127 res!34989) b!64128))

(declare-fun m!58399 () Bool)

(assert (=> d!13271 m!58399))

(assert (=> b!64128 m!57973))

(declare-fun m!58401 () Bool)

(assert (=> b!64128 m!58401))

(assert (=> b!63939 d!13271))

(declare-fun b!64141 () Bool)

(declare-fun c!8739 () Bool)

(declare-fun lt!27137 () (_ BitVec 64))

(assert (=> b!64141 (= c!8739 (= lt!27137 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42051 () SeekEntryResult!233)

(declare-fun e!42053 () SeekEntryResult!233)

(assert (=> b!64141 (= e!42051 e!42053)))

(declare-fun b!64142 () Bool)

(declare-fun e!42052 () SeekEntryResult!233)

(assert (=> b!64142 (= e!42052 Undefined!233)))

(declare-fun b!64143 () Bool)

(declare-fun lt!27135 () SeekEntryResult!233)

(assert (=> b!64143 (= e!42053 (MissingZero!233 (index!3060 lt!27135)))))

(declare-fun b!64144 () Bool)

(assert (=> b!64144 (= e!42052 e!42051)))

(assert (=> b!64144 (= lt!27137 (select (arr!1792 (_keys!3743 newMap!16)) (index!3060 lt!27135)))))

(declare-fun c!8738 () Bool)

(assert (=> b!64144 (= c!8738 (= lt!27137 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun b!64145 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3751 (_ BitVec 32)) SeekEntryResult!233)

(assert (=> b!64145 (= e!42053 (seekKeyOrZeroReturnVacant!0 (x!10454 lt!27135) (index!3060 lt!27135) (index!3060 lt!27135) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (_keys!3743 newMap!16) (mask!6023 newMap!16)))))

(declare-fun b!64146 () Bool)

(assert (=> b!64146 (= e!42051 (Found!233 (index!3060 lt!27135)))))

(declare-fun d!13273 () Bool)

(declare-fun lt!27136 () SeekEntryResult!233)

(assert (=> d!13273 (and (or ((_ is Undefined!233) lt!27136) (not ((_ is Found!233) lt!27136)) (and (bvsge (index!3059 lt!27136) #b00000000000000000000000000000000) (bvslt (index!3059 lt!27136) (size!2026 (_keys!3743 newMap!16))))) (or ((_ is Undefined!233) lt!27136) ((_ is Found!233) lt!27136) (not ((_ is MissingZero!233) lt!27136)) (and (bvsge (index!3058 lt!27136) #b00000000000000000000000000000000) (bvslt (index!3058 lt!27136) (size!2026 (_keys!3743 newMap!16))))) (or ((_ is Undefined!233) lt!27136) ((_ is Found!233) lt!27136) ((_ is MissingZero!233) lt!27136) (not ((_ is MissingVacant!233) lt!27136)) (and (bvsge (index!3061 lt!27136) #b00000000000000000000000000000000) (bvslt (index!3061 lt!27136) (size!2026 (_keys!3743 newMap!16))))) (or ((_ is Undefined!233) lt!27136) (ite ((_ is Found!233) lt!27136) (= (select (arr!1792 (_keys!3743 newMap!16)) (index!3059 lt!27136)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) (ite ((_ is MissingZero!233) lt!27136) (= (select (arr!1792 (_keys!3743 newMap!16)) (index!3058 lt!27136)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!233) lt!27136) (= (select (arr!1792 (_keys!3743 newMap!16)) (index!3061 lt!27136)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13273 (= lt!27136 e!42052)))

(declare-fun c!8740 () Bool)

(assert (=> d!13273 (= c!8740 (and ((_ is Intermediate!233) lt!27135) (undefined!1045 lt!27135)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3751 (_ BitVec 32)) SeekEntryResult!233)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!13273 (= lt!27135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (mask!6023 newMap!16)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (_keys!3743 newMap!16) (mask!6023 newMap!16)))))

(assert (=> d!13273 (validMask!0 (mask!6023 newMap!16))))

(assert (=> d!13273 (= (seekEntryOrOpen!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (_keys!3743 newMap!16) (mask!6023 newMap!16)) lt!27136)))

(assert (= (and d!13273 c!8740) b!64142))

(assert (= (and d!13273 (not c!8740)) b!64144))

(assert (= (and b!64144 c!8738) b!64146))

(assert (= (and b!64144 (not c!8738)) b!64141))

(assert (= (and b!64141 c!8739) b!64143))

(assert (= (and b!64141 (not c!8739)) b!64145))

(declare-fun m!58403 () Bool)

(assert (=> b!64144 m!58403))

(assert (=> b!64145 m!57973))

(declare-fun m!58405 () Bool)

(assert (=> b!64145 m!58405))

(declare-fun m!58407 () Bool)

(assert (=> d!13273 m!58407))

(assert (=> d!13273 m!58327))

(declare-fun m!58409 () Bool)

(assert (=> d!13273 m!58409))

(declare-fun m!58411 () Bool)

(assert (=> d!13273 m!58411))

(declare-fun m!58413 () Bool)

(assert (=> d!13273 m!58413))

(assert (=> d!13273 m!57973))

(declare-fun m!58415 () Bool)

(assert (=> d!13273 m!58415))

(assert (=> d!13273 m!57973))

(assert (=> d!13273 m!58413))

(assert (=> b!63881 d!13273))

(declare-fun d!13275 () Bool)

(declare-fun e!42056 () Bool)

(assert (=> d!13275 e!42056))

(declare-fun res!34995 () Bool)

(assert (=> d!13275 (=> (not res!34995) (not e!42056))))

(declare-fun lt!27147 () ListLongMap!1365)

(assert (=> d!13275 (= res!34995 (contains!693 lt!27147 (_1!1039 (ite c!8671 (ite c!8667 (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!27149 () List!1451)

(assert (=> d!13275 (= lt!27147 (ListLongMap!1366 lt!27149))))

(declare-fun lt!27148 () Unit!1751)

(declare-fun lt!27146 () Unit!1751)

(assert (=> d!13275 (= lt!27148 lt!27146)))

(assert (=> d!13275 (= (getValueByKey!125 lt!27149 (_1!1039 (ite c!8671 (ite c!8667 (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!130 (_2!1039 (ite c!8671 (ite c!8667 (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!45 (List!1451 (_ BitVec 64) V!2873) Unit!1751)

(assert (=> d!13275 (= lt!27146 (lemmaContainsTupThenGetReturnValue!45 lt!27149 (_1!1039 (ite c!8671 (ite c!8667 (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1039 (ite c!8671 (ite c!8667 (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun insertStrictlySorted!48 (List!1451 (_ BitVec 64) V!2873) List!1451)

(assert (=> d!13275 (= lt!27149 (insertStrictlySorted!48 (toList!698 e!41891) (_1!1039 (ite c!8671 (ite c!8667 (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1039 (ite c!8671 (ite c!8667 (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!13275 (= (+!84 e!41891 (ite c!8671 (ite c!8667 (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!27147)))

(declare-fun b!64151 () Bool)

(declare-fun res!34994 () Bool)

(assert (=> b!64151 (=> (not res!34994) (not e!42056))))

(assert (=> b!64151 (= res!34994 (= (getValueByKey!125 (toList!698 lt!27147) (_1!1039 (ite c!8671 (ite c!8667 (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!130 (_2!1039 (ite c!8671 (ite c!8667 (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!64152 () Bool)

(declare-fun contains!695 (List!1451 tuple2!2056) Bool)

(assert (=> b!64152 (= e!42056 (contains!695 (toList!698 lt!27147) (ite c!8671 (ite c!8667 (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!13275 res!34995) b!64151))

(assert (= (and b!64151 res!34994) b!64152))

(declare-fun m!58417 () Bool)

(assert (=> d!13275 m!58417))

(declare-fun m!58419 () Bool)

(assert (=> d!13275 m!58419))

(declare-fun m!58421 () Bool)

(assert (=> d!13275 m!58421))

(declare-fun m!58423 () Bool)

(assert (=> d!13275 m!58423))

(declare-fun m!58425 () Bool)

(assert (=> b!64151 m!58425))

(declare-fun m!58427 () Bool)

(assert (=> b!64152 m!58427))

(assert (=> bm!5121 d!13275))

(declare-fun d!13277 () Bool)

(declare-fun res!34996 () Bool)

(declare-fun e!42057 () Bool)

(assert (=> d!13277 (=> res!34996 e!42057)))

(assert (=> d!13277 (= res!34996 (= (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(assert (=> d!13277 (= (arrayContainsKey!0 (_keys!3743 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b00000000000000000000000000000000) e!42057)))

(declare-fun b!64153 () Bool)

(declare-fun e!42058 () Bool)

(assert (=> b!64153 (= e!42057 e!42058)))

(declare-fun res!34997 () Bool)

(assert (=> b!64153 (=> (not res!34997) (not e!42058))))

(assert (=> b!64153 (= res!34997 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2026 (_keys!3743 newMap!16))))))

(declare-fun b!64154 () Bool)

(assert (=> b!64154 (= e!42058 (arrayContainsKey!0 (_keys!3743 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!13277 (not res!34996)) b!64153))

(assert (= (and b!64153 res!34997) b!64154))

(assert (=> d!13277 m!58291))

(assert (=> b!64154 m!57973))

(declare-fun m!58429 () Bool)

(assert (=> b!64154 m!58429))

(assert (=> bm!5122 d!13277))

(declare-fun b!64155 () Bool)

(declare-fun e!42062 () Bool)

(declare-fun e!42061 () Bool)

(assert (=> b!64155 (= e!42062 e!42061)))

(declare-fun res!34999 () Bool)

(assert (=> b!64155 (=> (not res!34999) (not e!42061))))

(declare-fun e!42060 () Bool)

(assert (=> b!64155 (= res!34999 (not e!42060))))

(declare-fun res!35000 () Bool)

(assert (=> b!64155 (=> (not res!35000) (not e!42060))))

(assert (=> b!64155 (= res!35000 (validKeyInArray!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!64156 () Bool)

(declare-fun e!42059 () Bool)

(assert (=> b!64156 (= e!42061 e!42059)))

(declare-fun c!8741 () Bool)

(assert (=> b!64156 (= c!8741 (validKeyInArray!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!13279 () Bool)

(declare-fun res!34998 () Bool)

(assert (=> d!13279 (=> res!34998 e!42062)))

(assert (=> d!13279 (= res!34998 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(assert (=> d!13279 (= (arrayNoDuplicates!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!8689 (Cons!1446 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) Nil!1447) Nil!1447)) e!42062)))

(declare-fun b!64157 () Bool)

(declare-fun call!5171 () Bool)

(assert (=> b!64157 (= e!42059 call!5171)))

(declare-fun b!64158 () Bool)

(assert (=> b!64158 (= e!42060 (contains!694 (ite c!8689 (Cons!1446 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) Nil!1447) Nil!1447) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!64159 () Bool)

(assert (=> b!64159 (= e!42059 call!5171)))

(declare-fun bm!5168 () Bool)

(assert (=> bm!5168 (= call!5171 (arrayNoDuplicates!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8741 (Cons!1446 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!8689 (Cons!1446 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) Nil!1447) Nil!1447)) (ite c!8689 (Cons!1446 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) Nil!1447) Nil!1447))))))

(assert (= (and d!13279 (not res!34998)) b!64155))

(assert (= (and b!64155 res!35000) b!64158))

(assert (= (and b!64155 res!34999) b!64156))

(assert (= (and b!64156 c!8741) b!64159))

(assert (= (and b!64156 (not c!8741)) b!64157))

(assert (= (or b!64159 b!64157) bm!5168))

(declare-fun m!58431 () Bool)

(assert (=> b!64155 m!58431))

(assert (=> b!64155 m!58431))

(declare-fun m!58433 () Bool)

(assert (=> b!64155 m!58433))

(assert (=> b!64156 m!58431))

(assert (=> b!64156 m!58431))

(assert (=> b!64156 m!58433))

(assert (=> b!64158 m!58431))

(assert (=> b!64158 m!58431))

(declare-fun m!58435 () Bool)

(assert (=> b!64158 m!58435))

(assert (=> bm!5168 m!58431))

(declare-fun m!58437 () Bool)

(assert (=> bm!5168 m!58437))

(assert (=> bm!5129 d!13279))

(declare-fun d!13281 () Bool)

(declare-fun e!42063 () Bool)

(assert (=> d!13281 e!42063))

(declare-fun res!35002 () Bool)

(assert (=> d!13281 (=> (not res!35002) (not e!42063))))

(declare-fun lt!27151 () ListLongMap!1365)

(assert (=> d!13281 (= res!35002 (contains!693 lt!27151 (_1!1039 (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(declare-fun lt!27153 () List!1451)

(assert (=> d!13281 (= lt!27151 (ListLongMap!1366 lt!27153))))

(declare-fun lt!27152 () Unit!1751)

(declare-fun lt!27150 () Unit!1751)

(assert (=> d!13281 (= lt!27152 lt!27150)))

(assert (=> d!13281 (= (getValueByKey!125 lt!27153 (_1!1039 (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))) (Some!130 (_2!1039 (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (=> d!13281 (= lt!27150 (lemmaContainsTupThenGetReturnValue!45 lt!27153 (_1!1039 (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992))))) (_2!1039 (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (=> d!13281 (= lt!27153 (insertStrictlySorted!48 (toList!698 call!5152) (_1!1039 (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992))))) (_2!1039 (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (=> d!13281 (= (+!84 call!5152 (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27151)))

(declare-fun b!64160 () Bool)

(declare-fun res!35001 () Bool)

(assert (=> b!64160 (=> (not res!35001) (not e!42063))))

(assert (=> b!64160 (= res!35001 (= (getValueByKey!125 (toList!698 lt!27151) (_1!1039 (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))) (Some!130 (_2!1039 (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992))))))))))

(declare-fun b!64161 () Bool)

(assert (=> b!64161 (= e!42063 (contains!695 (toList!698 lt!27151) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992))))))))

(assert (= (and d!13281 res!35002) b!64160))

(assert (= (and b!64160 res!35001) b!64161))

(declare-fun m!58439 () Bool)

(assert (=> d!13281 m!58439))

(declare-fun m!58441 () Bool)

(assert (=> d!13281 m!58441))

(declare-fun m!58443 () Bool)

(assert (=> d!13281 m!58443))

(declare-fun m!58445 () Bool)

(assert (=> d!13281 m!58445))

(declare-fun m!58447 () Bool)

(assert (=> b!64160 m!58447))

(declare-fun m!58449 () Bool)

(assert (=> b!64161 m!58449))

(assert (=> b!64024 d!13281))

(assert (=> bm!5109 d!13247))

(declare-fun d!13283 () Bool)

(assert (=> d!13283 (= (+!84 (getCurrentListMap!394 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!394 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) lt!26964 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27156 () Unit!1751)

(declare-fun choose!351 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 V!2873 Int) Unit!1751)

(assert (=> d!13283 (= lt!27156 (choose!351 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) lt!26964 (zeroValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2018 newMap!16) (defaultEntry!2108 newMap!16)))))

(assert (=> d!13283 (validMask!0 (mask!6023 newMap!16))))

(assert (=> d!13283 (= (lemmaChangeZeroKeyThenAddPairToListMap!18 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) lt!26964 (zeroValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2018 newMap!16) (defaultEntry!2108 newMap!16)) lt!27156)))

(declare-fun bs!2782 () Bool)

(assert (= bs!2782 d!13283))

(assert (=> bs!2782 m!57985))

(declare-fun m!58451 () Bool)

(assert (=> bs!2782 m!58451))

(assert (=> bs!2782 m!58113))

(assert (=> bs!2782 m!58327))

(assert (=> bs!2782 m!58113))

(declare-fun m!58453 () Bool)

(assert (=> bs!2782 m!58453))

(assert (=> bs!2782 m!57985))

(declare-fun m!58455 () Bool)

(assert (=> bs!2782 m!58455))

(assert (=> b!63915 d!13283))

(declare-fun d!13285 () Bool)

(declare-fun res!35003 () Bool)

(declare-fun e!42064 () Bool)

(assert (=> d!13285 (=> (not res!35003) (not e!42064))))

(assert (=> d!13285 (= res!35003 (simpleValid!45 (v!2428 (underlying!232 thiss!992))))))

(assert (=> d!13285 (= (valid!272 (v!2428 (underlying!232 thiss!992))) e!42064)))

(declare-fun b!64162 () Bool)

(declare-fun res!35004 () Bool)

(assert (=> b!64162 (=> (not res!35004) (not e!42064))))

(assert (=> b!64162 (= res!35004 (= (arrayCountValidKeys!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000000 (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))) (_size!369 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun b!64163 () Bool)

(declare-fun res!35005 () Bool)

(assert (=> b!64163 (=> (not res!35005) (not e!42064))))

(assert (=> b!64163 (= res!35005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun b!64164 () Bool)

(assert (=> b!64164 (= e!42064 (arrayNoDuplicates!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000000 Nil!1447))))

(assert (= (and d!13285 res!35003) b!64162))

(assert (= (and b!64162 res!35004) b!64163))

(assert (= (and b!64163 res!35005) b!64164))

(declare-fun m!58457 () Bool)

(assert (=> d!13285 m!58457))

(declare-fun m!58459 () Bool)

(assert (=> b!64162 m!58459))

(assert (=> b!64163 m!57999))

(declare-fun m!58461 () Bool)

(assert (=> b!64164 m!58461))

(assert (=> d!13233 d!13285))

(declare-fun b!64173 () Bool)

(declare-fun e!42070 () (_ BitVec 32))

(declare-fun e!42069 () (_ BitVec 32))

(assert (=> b!64173 (= e!42070 e!42069)))

(declare-fun c!8747 () Bool)

(assert (=> b!64173 (= c!8747 (validKeyInArray!0 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64174 () Bool)

(declare-fun call!5174 () (_ BitVec 32))

(assert (=> b!64174 (= e!42069 call!5174)))

(declare-fun b!64175 () Bool)

(assert (=> b!64175 (= e!42070 #b00000000000000000000000000000000)))

(declare-fun d!13287 () Bool)

(declare-fun lt!27159 () (_ BitVec 32))

(assert (=> d!13287 (and (bvsge lt!27159 #b00000000000000000000000000000000) (bvsle lt!27159 (bvsub (size!2026 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!13287 (= lt!27159 e!42070)))

(declare-fun c!8746 () Bool)

(assert (=> d!13287 (= c!8746 (bvsge #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))

(assert (=> d!13287 (and (bvsle #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2026 (_keys!3743 newMap!16)) (size!2026 (_keys!3743 newMap!16))))))

(assert (=> d!13287 (= (arrayCountValidKeys!0 (_keys!3743 newMap!16) #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))) lt!27159)))

(declare-fun bm!5171 () Bool)

(assert (=> bm!5171 (= call!5174 (arrayCountValidKeys!0 (_keys!3743 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2026 (_keys!3743 newMap!16))))))

(declare-fun b!64176 () Bool)

(assert (=> b!64176 (= e!42069 (bvadd #b00000000000000000000000000000001 call!5174))))

(assert (= (and d!13287 c!8746) b!64175))

(assert (= (and d!13287 (not c!8746)) b!64173))

(assert (= (and b!64173 c!8747) b!64176))

(assert (= (and b!64173 (not c!8747)) b!64174))

(assert (= (or b!64176 b!64174) bm!5171))

(assert (=> b!64173 m!58291))

(assert (=> b!64173 m!58291))

(assert (=> b!64173 m!58333))

(declare-fun m!58463 () Bool)

(assert (=> bm!5171 m!58463))

(assert (=> b!63967 d!13287))

(declare-fun d!13289 () Bool)

(declare-fun get!1098 (Option!131) V!2873)

(assert (=> d!13289 (= (apply!69 lt!27041 lt!27049) (get!1098 (getValueByKey!125 (toList!698 lt!27041) lt!27049)))))

(declare-fun bs!2783 () Bool)

(assert (= bs!2783 d!13289))

(declare-fun m!58465 () Bool)

(assert (=> bs!2783 m!58465))

(assert (=> bs!2783 m!58465))

(declare-fun m!58467 () Bool)

(assert (=> bs!2783 m!58467))

(assert (=> b!64028 d!13289))

(declare-fun d!13291 () Bool)

(declare-fun e!42071 () Bool)

(assert (=> d!13291 e!42071))

(declare-fun res!35006 () Bool)

(assert (=> d!13291 (=> res!35006 e!42071)))

(declare-fun lt!27160 () Bool)

(assert (=> d!13291 (= res!35006 (not lt!27160))))

(declare-fun lt!27163 () Bool)

(assert (=> d!13291 (= lt!27160 lt!27163)))

(declare-fun lt!27162 () Unit!1751)

(declare-fun e!42072 () Unit!1751)

(assert (=> d!13291 (= lt!27162 e!42072)))

(declare-fun c!8748 () Bool)

(assert (=> d!13291 (= c!8748 lt!27163)))

(assert (=> d!13291 (= lt!27163 (containsKey!129 (toList!698 (+!84 lt!27055 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))) lt!27047))))

(assert (=> d!13291 (= (contains!693 (+!84 lt!27055 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27047) lt!27160)))

(declare-fun b!64177 () Bool)

(declare-fun lt!27161 () Unit!1751)

(assert (=> b!64177 (= e!42072 lt!27161)))

(assert (=> b!64177 (= lt!27161 (lemmaContainsKeyImpliesGetValueByKeyDefined!78 (toList!698 (+!84 lt!27055 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))) lt!27047))))

(assert (=> b!64177 (isDefined!79 (getValueByKey!125 (toList!698 (+!84 lt!27055 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))) lt!27047))))

(declare-fun b!64178 () Bool)

(declare-fun Unit!1761 () Unit!1751)

(assert (=> b!64178 (= e!42072 Unit!1761)))

(declare-fun b!64179 () Bool)

(assert (=> b!64179 (= e!42071 (isDefined!79 (getValueByKey!125 (toList!698 (+!84 lt!27055 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))) lt!27047)))))

(assert (= (and d!13291 c!8748) b!64177))

(assert (= (and d!13291 (not c!8748)) b!64178))

(assert (= (and d!13291 (not res!35006)) b!64179))

(declare-fun m!58469 () Bool)

(assert (=> d!13291 m!58469))

(declare-fun m!58471 () Bool)

(assert (=> b!64177 m!58471))

(declare-fun m!58473 () Bool)

(assert (=> b!64177 m!58473))

(assert (=> b!64177 m!58473))

(declare-fun m!58475 () Bool)

(assert (=> b!64177 m!58475))

(assert (=> b!64179 m!58473))

(assert (=> b!64179 m!58473))

(assert (=> b!64179 m!58475))

(assert (=> b!64028 d!13291))

(assert (=> b!64028 d!13259))

(declare-fun d!13293 () Bool)

(assert (=> d!13293 (= (apply!69 lt!27059 lt!27048) (get!1098 (getValueByKey!125 (toList!698 lt!27059) lt!27048)))))

(declare-fun bs!2784 () Bool)

(assert (= bs!2784 d!13293))

(declare-fun m!58477 () Bool)

(assert (=> bs!2784 m!58477))

(assert (=> bs!2784 m!58477))

(declare-fun m!58479 () Bool)

(assert (=> bs!2784 m!58479))

(assert (=> b!64028 d!13293))

(declare-fun d!13295 () Bool)

(assert (=> d!13295 (= (apply!69 (+!84 lt!27059 (tuple2!2057 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27048) (get!1098 (getValueByKey!125 (toList!698 (+!84 lt!27059 (tuple2!2057 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))) lt!27048)))))

(declare-fun bs!2785 () Bool)

(assert (= bs!2785 d!13295))

(declare-fun m!58481 () Bool)

(assert (=> bs!2785 m!58481))

(assert (=> bs!2785 m!58481))

(declare-fun m!58483 () Bool)

(assert (=> bs!2785 m!58483))

(assert (=> b!64028 d!13295))

(declare-fun d!13297 () Bool)

(declare-fun e!42073 () Bool)

(assert (=> d!13297 e!42073))

(declare-fun res!35008 () Bool)

(assert (=> d!13297 (=> (not res!35008) (not e!42073))))

(declare-fun lt!27165 () ListLongMap!1365)

(assert (=> d!13297 (= res!35008 (contains!693 lt!27165 (_1!1039 (tuple2!2057 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(declare-fun lt!27167 () List!1451)

(assert (=> d!13297 (= lt!27165 (ListLongMap!1366 lt!27167))))

(declare-fun lt!27166 () Unit!1751)

(declare-fun lt!27164 () Unit!1751)

(assert (=> d!13297 (= lt!27166 lt!27164)))

(assert (=> d!13297 (= (getValueByKey!125 lt!27167 (_1!1039 (tuple2!2057 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))) (Some!130 (_2!1039 (tuple2!2057 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (=> d!13297 (= lt!27164 (lemmaContainsTupThenGetReturnValue!45 lt!27167 (_1!1039 (tuple2!2057 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992))))) (_2!1039 (tuple2!2057 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (=> d!13297 (= lt!27167 (insertStrictlySorted!48 (toList!698 lt!27041) (_1!1039 (tuple2!2057 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992))))) (_2!1039 (tuple2!2057 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (=> d!13297 (= (+!84 lt!27041 (tuple2!2057 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27165)))

(declare-fun b!64180 () Bool)

(declare-fun res!35007 () Bool)

(assert (=> b!64180 (=> (not res!35007) (not e!42073))))

(assert (=> b!64180 (= res!35007 (= (getValueByKey!125 (toList!698 lt!27165) (_1!1039 (tuple2!2057 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))) (Some!130 (_2!1039 (tuple2!2057 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992))))))))))

(declare-fun b!64181 () Bool)

(assert (=> b!64181 (= e!42073 (contains!695 (toList!698 lt!27165) (tuple2!2057 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992))))))))

(assert (= (and d!13297 res!35008) b!64180))

(assert (= (and b!64180 res!35007) b!64181))

(declare-fun m!58485 () Bool)

(assert (=> d!13297 m!58485))

(declare-fun m!58487 () Bool)

(assert (=> d!13297 m!58487))

(declare-fun m!58489 () Bool)

(assert (=> d!13297 m!58489))

(declare-fun m!58491 () Bool)

(assert (=> d!13297 m!58491))

(declare-fun m!58493 () Bool)

(assert (=> b!64180 m!58493))

(declare-fun m!58495 () Bool)

(assert (=> b!64181 m!58495))

(assert (=> b!64028 d!13297))

(declare-fun d!13299 () Bool)

(assert (=> d!13299 (= (apply!69 (+!84 lt!27041 (tuple2!2057 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27049) (apply!69 lt!27041 lt!27049))))

(declare-fun lt!27170 () Unit!1751)

(declare-fun choose!352 (ListLongMap!1365 (_ BitVec 64) V!2873 (_ BitVec 64)) Unit!1751)

(assert (=> d!13299 (= lt!27170 (choose!352 lt!27041 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992))) lt!27049))))

(declare-fun e!42076 () Bool)

(assert (=> d!13299 e!42076))

(declare-fun res!35011 () Bool)

(assert (=> d!13299 (=> (not res!35011) (not e!42076))))

(assert (=> d!13299 (= res!35011 (contains!693 lt!27041 lt!27049))))

(assert (=> d!13299 (= (addApplyDifferent!45 lt!27041 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992))) lt!27049) lt!27170)))

(declare-fun b!64185 () Bool)

(assert (=> b!64185 (= e!42076 (not (= lt!27049 lt!27056)))))

(assert (= (and d!13299 res!35011) b!64185))

(assert (=> d!13299 m!58241))

(declare-fun m!58497 () Bool)

(assert (=> d!13299 m!58497))

(assert (=> d!13299 m!58217))

(assert (=> d!13299 m!58217))

(assert (=> d!13299 m!58237))

(declare-fun m!58499 () Bool)

(assert (=> d!13299 m!58499))

(assert (=> b!64028 d!13299))

(declare-fun d!13301 () Bool)

(assert (=> d!13301 (contains!693 (+!84 lt!27055 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27047)))

(declare-fun lt!27173 () Unit!1751)

(declare-fun choose!353 (ListLongMap!1365 (_ BitVec 64) V!2873 (_ BitVec 64)) Unit!1751)

(assert (=> d!13301 (= lt!27173 (choose!353 lt!27055 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) lt!27047))))

(assert (=> d!13301 (contains!693 lt!27055 lt!27047)))

(assert (=> d!13301 (= (addStillContains!45 lt!27055 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) lt!27047) lt!27173)))

(declare-fun bs!2786 () Bool)

(assert (= bs!2786 d!13301))

(assert (=> bs!2786 m!58221))

(assert (=> bs!2786 m!58221))

(assert (=> bs!2786 m!58223))

(declare-fun m!58501 () Bool)

(assert (=> bs!2786 m!58501))

(declare-fun m!58503 () Bool)

(assert (=> bs!2786 m!58503))

(assert (=> b!64028 d!13301))

(declare-fun d!13303 () Bool)

(assert (=> d!13303 (= (apply!69 (+!84 lt!27053 (tuple2!2057 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27044) (get!1098 (getValueByKey!125 (toList!698 (+!84 lt!27053 (tuple2!2057 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))) lt!27044)))))

(declare-fun bs!2787 () Bool)

(assert (= bs!2787 d!13303))

(declare-fun m!58505 () Bool)

(assert (=> bs!2787 m!58505))

(assert (=> bs!2787 m!58505))

(declare-fun m!58507 () Bool)

(assert (=> bs!2787 m!58507))

(assert (=> b!64028 d!13303))

(declare-fun d!13305 () Bool)

(assert (=> d!13305 (= (apply!69 (+!84 lt!27059 (tuple2!2057 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27048) (apply!69 lt!27059 lt!27048))))

(declare-fun lt!27174 () Unit!1751)

(assert (=> d!13305 (= lt!27174 (choose!352 lt!27059 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992))) lt!27048))))

(declare-fun e!42077 () Bool)

(assert (=> d!13305 e!42077))

(declare-fun res!35012 () Bool)

(assert (=> d!13305 (=> (not res!35012) (not e!42077))))

(assert (=> d!13305 (= res!35012 (contains!693 lt!27059 lt!27048))))

(assert (=> d!13305 (= (addApplyDifferent!45 lt!27059 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992))) lt!27048) lt!27174)))

(declare-fun b!64187 () Bool)

(assert (=> b!64187 (= e!42077 (not (= lt!27048 lt!27043)))))

(assert (= (and d!13305 res!35012) b!64187))

(assert (=> d!13305 m!58233))

(declare-fun m!58509 () Bool)

(assert (=> d!13305 m!58509))

(assert (=> d!13305 m!58239))

(assert (=> d!13305 m!58239))

(assert (=> d!13305 m!58243))

(declare-fun m!58511 () Bool)

(assert (=> d!13305 m!58511))

(assert (=> b!64028 d!13305))

(declare-fun d!13307 () Bool)

(declare-fun e!42078 () Bool)

(assert (=> d!13307 e!42078))

(declare-fun res!35014 () Bool)

(assert (=> d!13307 (=> (not res!35014) (not e!42078))))

(declare-fun lt!27176 () ListLongMap!1365)

(assert (=> d!13307 (= res!35014 (contains!693 lt!27176 (_1!1039 (tuple2!2057 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(declare-fun lt!27178 () List!1451)

(assert (=> d!13307 (= lt!27176 (ListLongMap!1366 lt!27178))))

(declare-fun lt!27177 () Unit!1751)

(declare-fun lt!27175 () Unit!1751)

(assert (=> d!13307 (= lt!27177 lt!27175)))

(assert (=> d!13307 (= (getValueByKey!125 lt!27178 (_1!1039 (tuple2!2057 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))) (Some!130 (_2!1039 (tuple2!2057 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (=> d!13307 (= lt!27175 (lemmaContainsTupThenGetReturnValue!45 lt!27178 (_1!1039 (tuple2!2057 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))) (_2!1039 (tuple2!2057 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (=> d!13307 (= lt!27178 (insertStrictlySorted!48 (toList!698 lt!27053) (_1!1039 (tuple2!2057 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))) (_2!1039 (tuple2!2057 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (=> d!13307 (= (+!84 lt!27053 (tuple2!2057 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27176)))

(declare-fun b!64188 () Bool)

(declare-fun res!35013 () Bool)

(assert (=> b!64188 (=> (not res!35013) (not e!42078))))

(assert (=> b!64188 (= res!35013 (= (getValueByKey!125 (toList!698 lt!27176) (_1!1039 (tuple2!2057 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))) (Some!130 (_2!1039 (tuple2!2057 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))))))))

(declare-fun b!64189 () Bool)

(assert (=> b!64189 (= e!42078 (contains!695 (toList!698 lt!27176) (tuple2!2057 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))))))

(assert (= (and d!13307 res!35014) b!64188))

(assert (= (and b!64188 res!35013) b!64189))

(declare-fun m!58513 () Bool)

(assert (=> d!13307 m!58513))

(declare-fun m!58515 () Bool)

(assert (=> d!13307 m!58515))

(declare-fun m!58517 () Bool)

(assert (=> d!13307 m!58517))

(declare-fun m!58519 () Bool)

(assert (=> d!13307 m!58519))

(declare-fun m!58521 () Bool)

(assert (=> b!64188 m!58521))

(declare-fun m!58523 () Bool)

(assert (=> b!64189 m!58523))

(assert (=> b!64028 d!13307))

(declare-fun d!13309 () Bool)

(declare-fun e!42079 () Bool)

(assert (=> d!13309 e!42079))

(declare-fun res!35016 () Bool)

(assert (=> d!13309 (=> (not res!35016) (not e!42079))))

(declare-fun lt!27180 () ListLongMap!1365)

(assert (=> d!13309 (= res!35016 (contains!693 lt!27180 (_1!1039 (tuple2!2057 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(declare-fun lt!27182 () List!1451)

(assert (=> d!13309 (= lt!27180 (ListLongMap!1366 lt!27182))))

(declare-fun lt!27181 () Unit!1751)

(declare-fun lt!27179 () Unit!1751)

(assert (=> d!13309 (= lt!27181 lt!27179)))

(assert (=> d!13309 (= (getValueByKey!125 lt!27182 (_1!1039 (tuple2!2057 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))) (Some!130 (_2!1039 (tuple2!2057 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (=> d!13309 (= lt!27179 (lemmaContainsTupThenGetReturnValue!45 lt!27182 (_1!1039 (tuple2!2057 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992))))) (_2!1039 (tuple2!2057 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (=> d!13309 (= lt!27182 (insertStrictlySorted!48 (toList!698 lt!27059) (_1!1039 (tuple2!2057 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992))))) (_2!1039 (tuple2!2057 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (=> d!13309 (= (+!84 lt!27059 (tuple2!2057 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27180)))

(declare-fun b!64190 () Bool)

(declare-fun res!35015 () Bool)

(assert (=> b!64190 (=> (not res!35015) (not e!42079))))

(assert (=> b!64190 (= res!35015 (= (getValueByKey!125 (toList!698 lt!27180) (_1!1039 (tuple2!2057 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))) (Some!130 (_2!1039 (tuple2!2057 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992))))))))))

(declare-fun b!64191 () Bool)

(assert (=> b!64191 (= e!42079 (contains!695 (toList!698 lt!27180) (tuple2!2057 lt!27043 (minValue!2018 (v!2428 (underlying!232 thiss!992))))))))

(assert (= (and d!13309 res!35016) b!64190))

(assert (= (and b!64190 res!35015) b!64191))

(declare-fun m!58525 () Bool)

(assert (=> d!13309 m!58525))

(declare-fun m!58527 () Bool)

(assert (=> d!13309 m!58527))

(declare-fun m!58529 () Bool)

(assert (=> d!13309 m!58529))

(declare-fun m!58531 () Bool)

(assert (=> d!13309 m!58531))

(declare-fun m!58533 () Bool)

(assert (=> b!64190 m!58533))

(declare-fun m!58535 () Bool)

(assert (=> b!64191 m!58535))

(assert (=> b!64028 d!13309))

(declare-fun d!13311 () Bool)

(assert (=> d!13311 (= (apply!69 (+!84 lt!27041 (tuple2!2057 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27049) (get!1098 (getValueByKey!125 (toList!698 (+!84 lt!27041 (tuple2!2057 lt!27056 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))) lt!27049)))))

(declare-fun bs!2788 () Bool)

(assert (= bs!2788 d!13311))

(declare-fun m!58537 () Bool)

(assert (=> bs!2788 m!58537))

(assert (=> bs!2788 m!58537))

(declare-fun m!58539 () Bool)

(assert (=> bs!2788 m!58539))

(assert (=> b!64028 d!13311))

(declare-fun d!13313 () Bool)

(assert (=> d!13313 (= (apply!69 lt!27053 lt!27044) (get!1098 (getValueByKey!125 (toList!698 lt!27053) lt!27044)))))

(declare-fun bs!2789 () Bool)

(assert (= bs!2789 d!13313))

(declare-fun m!58541 () Bool)

(assert (=> bs!2789 m!58541))

(assert (=> bs!2789 m!58541))

(declare-fun m!58543 () Bool)

(assert (=> bs!2789 m!58543))

(assert (=> b!64028 d!13313))

(declare-fun d!13315 () Bool)

(assert (=> d!13315 (= (apply!69 (+!84 lt!27053 (tuple2!2057 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27044) (apply!69 lt!27053 lt!27044))))

(declare-fun lt!27183 () Unit!1751)

(assert (=> d!13315 (= lt!27183 (choose!352 lt!27053 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) lt!27044))))

(declare-fun e!42080 () Bool)

(assert (=> d!13315 e!42080))

(declare-fun res!35017 () Bool)

(assert (=> d!13315 (=> (not res!35017) (not e!42080))))

(assert (=> d!13315 (= res!35017 (contains!693 lt!27053 lt!27044))))

(assert (=> d!13315 (= (addApplyDifferent!45 lt!27053 lt!27057 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) lt!27044) lt!27183)))

(declare-fun b!64192 () Bool)

(assert (=> b!64192 (= e!42080 (not (= lt!27044 lt!27057)))))

(assert (= (and d!13315 res!35017) b!64192))

(assert (=> d!13315 m!58219))

(declare-fun m!58545 () Bool)

(assert (=> d!13315 m!58545))

(assert (=> d!13315 m!58213))

(assert (=> d!13315 m!58213))

(assert (=> d!13315 m!58227))

(declare-fun m!58547 () Bool)

(assert (=> d!13315 m!58547))

(assert (=> b!64028 d!13315))

(declare-fun d!13317 () Bool)

(declare-fun e!42081 () Bool)

(assert (=> d!13317 e!42081))

(declare-fun res!35019 () Bool)

(assert (=> d!13317 (=> (not res!35019) (not e!42081))))

(declare-fun lt!27185 () ListLongMap!1365)

(assert (=> d!13317 (= res!35019 (contains!693 lt!27185 (_1!1039 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(declare-fun lt!27187 () List!1451)

(assert (=> d!13317 (= lt!27185 (ListLongMap!1366 lt!27187))))

(declare-fun lt!27186 () Unit!1751)

(declare-fun lt!27184 () Unit!1751)

(assert (=> d!13317 (= lt!27186 lt!27184)))

(assert (=> d!13317 (= (getValueByKey!125 lt!27187 (_1!1039 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))) (Some!130 (_2!1039 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (=> d!13317 (= lt!27184 (lemmaContainsTupThenGetReturnValue!45 lt!27187 (_1!1039 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))) (_2!1039 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (=> d!13317 (= lt!27187 (insertStrictlySorted!48 (toList!698 lt!27055) (_1!1039 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))) (_2!1039 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (=> d!13317 (= (+!84 lt!27055 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))) lt!27185)))

(declare-fun b!64193 () Bool)

(declare-fun res!35018 () Bool)

(assert (=> b!64193 (=> (not res!35018) (not e!42081))))

(assert (=> b!64193 (= res!35018 (= (getValueByKey!125 (toList!698 lt!27185) (_1!1039 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))))) (Some!130 (_2!1039 (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))))))))

(declare-fun b!64194 () Bool)

(assert (=> b!64194 (= e!42081 (contains!695 (toList!698 lt!27185) (tuple2!2057 lt!27058 (zeroValue!2018 (v!2428 (underlying!232 thiss!992))))))))

(assert (= (and d!13317 res!35019) b!64193))

(assert (= (and b!64193 res!35018) b!64194))

(declare-fun m!58549 () Bool)

(assert (=> d!13317 m!58549))

(declare-fun m!58551 () Bool)

(assert (=> d!13317 m!58551))

(declare-fun m!58553 () Bool)

(assert (=> d!13317 m!58553))

(declare-fun m!58555 () Bool)

(assert (=> d!13317 m!58555))

(declare-fun m!58557 () Bool)

(assert (=> b!64193 m!58557))

(declare-fun m!58559 () Bool)

(assert (=> b!64194 m!58559))

(assert (=> b!64028 d!13317))

(declare-fun d!13319 () Bool)

(declare-fun e!42084 () Bool)

(assert (=> d!13319 e!42084))

(declare-fun res!35025 () Bool)

(assert (=> d!13319 (=> (not res!35025) (not e!42084))))

(declare-fun lt!27192 () SeekEntryResult!233)

(assert (=> d!13319 (= res!35025 ((_ is Found!233) lt!27192))))

(assert (=> d!13319 (= lt!27192 (seekEntryOrOpen!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (_keys!3743 newMap!16) (mask!6023 newMap!16)))))

(declare-fun lt!27193 () Unit!1751)

(declare-fun choose!354 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 64) Int) Unit!1751)

(assert (=> d!13319 (= lt!27193 (choose!354 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)))))

(assert (=> d!13319 (validMask!0 (mask!6023 newMap!16))))

(assert (=> d!13319 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!18 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)) lt!27193)))

(declare-fun b!64199 () Bool)

(declare-fun res!35024 () Bool)

(assert (=> b!64199 (=> (not res!35024) (not e!42084))))

(assert (=> b!64199 (= res!35024 (inRange!0 (index!3059 lt!27192) (mask!6023 newMap!16)))))

(declare-fun b!64200 () Bool)

(assert (=> b!64200 (= e!42084 (= (select (arr!1792 (_keys!3743 newMap!16)) (index!3059 lt!27192)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(assert (=> b!64200 (and (bvsge (index!3059 lt!27192) #b00000000000000000000000000000000) (bvslt (index!3059 lt!27192) (size!2026 (_keys!3743 newMap!16))))))

(assert (= (and d!13319 res!35025) b!64199))

(assert (= (and b!64199 res!35024) b!64200))

(assert (=> d!13319 m!57973))

(assert (=> d!13319 m!58109))

(assert (=> d!13319 m!57973))

(declare-fun m!58561 () Bool)

(assert (=> d!13319 m!58561))

(assert (=> d!13319 m!58327))

(declare-fun m!58563 () Bool)

(assert (=> b!64199 m!58563))

(declare-fun m!58565 () Bool)

(assert (=> b!64200 m!58565))

(assert (=> bm!5112 d!13319))

(declare-fun b!64201 () Bool)

(declare-fun e!42086 () Bool)

(declare-fun e!42087 () Bool)

(assert (=> b!64201 (= e!42086 e!42087)))

(declare-fun c!8749 () Bool)

(assert (=> b!64201 (= c!8749 (validKeyInArray!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!5172 () Bool)

(declare-fun call!5175 () Bool)

(assert (=> bm!5172 (= call!5175 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3743 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun d!13321 () Bool)

(declare-fun res!35027 () Bool)

(assert (=> d!13321 (=> res!35027 e!42086)))

(assert (=> d!13321 (= res!35027 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(assert (=> d!13321 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3743 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992)))) e!42086)))

(declare-fun b!64202 () Bool)

(declare-fun e!42085 () Bool)

(assert (=> b!64202 (= e!42087 e!42085)))

(declare-fun lt!27196 () (_ BitVec 64))

(assert (=> b!64202 (= lt!27196 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!27195 () Unit!1751)

(assert (=> b!64202 (= lt!27195 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) lt!27196 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!64202 (arrayContainsKey!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) lt!27196 #b00000000000000000000000000000000)))

(declare-fun lt!27194 () Unit!1751)

(assert (=> b!64202 (= lt!27194 lt!27195)))

(declare-fun res!35026 () Bool)

(assert (=> b!64202 (= res!35026 (= (seekEntryOrOpen!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3743 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992)))) (Found!233 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!64202 (=> (not res!35026) (not e!42085))))

(declare-fun b!64203 () Bool)

(assert (=> b!64203 (= e!42087 call!5175)))

(declare-fun b!64204 () Bool)

(assert (=> b!64204 (= e!42085 call!5175)))

(assert (= (and d!13321 (not res!35027)) b!64201))

(assert (= (and b!64201 c!8749) b!64202))

(assert (= (and b!64201 (not c!8749)) b!64203))

(assert (= (and b!64202 res!35026) b!64204))

(assert (= (or b!64204 b!64203) bm!5172))

(declare-fun m!58567 () Bool)

(assert (=> b!64201 m!58567))

(assert (=> b!64201 m!58567))

(declare-fun m!58569 () Bool)

(assert (=> b!64201 m!58569))

(declare-fun m!58571 () Bool)

(assert (=> bm!5172 m!58571))

(assert (=> b!64202 m!58567))

(declare-fun m!58573 () Bool)

(assert (=> b!64202 m!58573))

(declare-fun m!58575 () Bool)

(assert (=> b!64202 m!58575))

(assert (=> b!64202 m!58567))

(declare-fun m!58577 () Bool)

(assert (=> b!64202 m!58577))

(assert (=> bm!5126 d!13321))

(declare-fun d!13323 () Bool)

(declare-fun res!35028 () Bool)

(declare-fun e!42088 () Bool)

(assert (=> d!13323 (=> (not res!35028) (not e!42088))))

(assert (=> d!13323 (= res!35028 (simpleValid!45 (_2!1038 lt!26965)))))

(assert (=> d!13323 (= (valid!272 (_2!1038 lt!26965)) e!42088)))

(declare-fun b!64205 () Bool)

(declare-fun res!35029 () Bool)

(assert (=> b!64205 (=> (not res!35029) (not e!42088))))

(assert (=> b!64205 (= res!35029 (= (arrayCountValidKeys!0 (_keys!3743 (_2!1038 lt!26965)) #b00000000000000000000000000000000 (size!2026 (_keys!3743 (_2!1038 lt!26965)))) (_size!369 (_2!1038 lt!26965))))))

(declare-fun b!64206 () Bool)

(declare-fun res!35030 () Bool)

(assert (=> b!64206 (=> (not res!35030) (not e!42088))))

(assert (=> b!64206 (= res!35030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3743 (_2!1038 lt!26965)) (mask!6023 (_2!1038 lt!26965))))))

(declare-fun b!64207 () Bool)

(assert (=> b!64207 (= e!42088 (arrayNoDuplicates!0 (_keys!3743 (_2!1038 lt!26965)) #b00000000000000000000000000000000 Nil!1447))))

(assert (= (and d!13323 res!35028) b!64205))

(assert (= (and b!64205 res!35029) b!64206))

(assert (= (and b!64206 res!35030) b!64207))

(declare-fun m!58579 () Bool)

(assert (=> d!13323 m!58579))

(declare-fun m!58581 () Bool)

(assert (=> b!64205 m!58581))

(declare-fun m!58583 () Bool)

(assert (=> b!64206 m!58583))

(declare-fun m!58585 () Bool)

(assert (=> b!64207 m!58585))

(assert (=> d!13225 d!13323))

(assert (=> d!13225 d!13245))

(declare-fun b!64208 () Bool)

(declare-fun e!42092 () Bool)

(declare-fun e!42091 () Bool)

(assert (=> b!64208 (= e!42092 e!42091)))

(declare-fun res!35032 () Bool)

(assert (=> b!64208 (=> (not res!35032) (not e!42091))))

(declare-fun e!42090 () Bool)

(assert (=> b!64208 (= res!35032 (not e!42090))))

(declare-fun res!35033 () Bool)

(assert (=> b!64208 (=> (not res!35033) (not e!42090))))

(assert (=> b!64208 (= res!35033 (validKeyInArray!0 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64209 () Bool)

(declare-fun e!42089 () Bool)

(assert (=> b!64209 (= e!42091 e!42089)))

(declare-fun c!8750 () Bool)

(assert (=> b!64209 (= c!8750 (validKeyInArray!0 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!13325 () Bool)

(declare-fun res!35031 () Bool)

(assert (=> d!13325 (=> res!35031 e!42092)))

(assert (=> d!13325 (= res!35031 (bvsge #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))

(assert (=> d!13325 (= (arrayNoDuplicates!0 (_keys!3743 newMap!16) #b00000000000000000000000000000000 Nil!1447) e!42092)))

(declare-fun b!64210 () Bool)

(declare-fun call!5176 () Bool)

(assert (=> b!64210 (= e!42089 call!5176)))

(declare-fun b!64211 () Bool)

(assert (=> b!64211 (= e!42090 (contains!694 Nil!1447 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64212 () Bool)

(assert (=> b!64212 (= e!42089 call!5176)))

(declare-fun bm!5173 () Bool)

(assert (=> bm!5173 (= call!5176 (arrayNoDuplicates!0 (_keys!3743 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8750 (Cons!1446 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000) Nil!1447) Nil!1447)))))

(assert (= (and d!13325 (not res!35031)) b!64208))

(assert (= (and b!64208 res!35033) b!64211))

(assert (= (and b!64208 res!35032) b!64209))

(assert (= (and b!64209 c!8750) b!64212))

(assert (= (and b!64209 (not c!8750)) b!64210))

(assert (= (or b!64212 b!64210) bm!5173))

(assert (=> b!64208 m!58291))

(assert (=> b!64208 m!58291))

(assert (=> b!64208 m!58333))

(assert (=> b!64209 m!58291))

(assert (=> b!64209 m!58291))

(assert (=> b!64209 m!58333))

(assert (=> b!64211 m!58291))

(assert (=> b!64211 m!58291))

(declare-fun m!58587 () Bool)

(assert (=> b!64211 m!58587))

(assert (=> bm!5173 m!58291))

(declare-fun m!58589 () Bool)

(assert (=> bm!5173 m!58589))

(assert (=> b!63969 d!13325))

(assert (=> b!63878 d!13263))

(assert (=> bm!5118 d!13273))

(declare-fun d!13327 () Bool)

(declare-fun e!42093 () Bool)

(assert (=> d!13327 e!42093))

(declare-fun res!35034 () Bool)

(assert (=> d!13327 (=> res!35034 e!42093)))

(declare-fun lt!27197 () Bool)

(assert (=> d!13327 (= res!35034 (not lt!27197))))

(declare-fun lt!27200 () Bool)

(assert (=> d!13327 (= lt!27197 lt!27200)))

(declare-fun lt!27199 () Unit!1751)

(declare-fun e!42094 () Unit!1751)

(assert (=> d!13327 (= lt!27199 e!42094)))

(declare-fun c!8751 () Bool)

(assert (=> d!13327 (= c!8751 lt!27200)))

(assert (=> d!13327 (= lt!27200 (containsKey!129 (toList!698 lt!27042) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13327 (= (contains!693 lt!27042 #b1000000000000000000000000000000000000000000000000000000000000000) lt!27197)))

(declare-fun b!64213 () Bool)

(declare-fun lt!27198 () Unit!1751)

(assert (=> b!64213 (= e!42094 lt!27198)))

(assert (=> b!64213 (= lt!27198 (lemmaContainsKeyImpliesGetValueByKeyDefined!78 (toList!698 lt!27042) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64213 (isDefined!79 (getValueByKey!125 (toList!698 lt!27042) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64214 () Bool)

(declare-fun Unit!1762 () Unit!1751)

(assert (=> b!64214 (= e!42094 Unit!1762)))

(declare-fun b!64215 () Bool)

(assert (=> b!64215 (= e!42093 (isDefined!79 (getValueByKey!125 (toList!698 lt!27042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13327 c!8751) b!64213))

(assert (= (and d!13327 (not c!8751)) b!64214))

(assert (= (and d!13327 (not res!35034)) b!64215))

(declare-fun m!58591 () Bool)

(assert (=> d!13327 m!58591))

(declare-fun m!58593 () Bool)

(assert (=> b!64213 m!58593))

(declare-fun m!58595 () Bool)

(assert (=> b!64213 m!58595))

(assert (=> b!64213 m!58595))

(declare-fun m!58597 () Bool)

(assert (=> b!64213 m!58597))

(assert (=> b!64215 m!58595))

(assert (=> b!64215 m!58595))

(assert (=> b!64215 m!58597))

(assert (=> bm!5149 d!13327))

(declare-fun d!13329 () Bool)

(declare-fun e!42095 () Bool)

(assert (=> d!13329 e!42095))

(declare-fun res!35035 () Bool)

(assert (=> d!13329 (=> res!35035 e!42095)))

(declare-fun lt!27201 () Bool)

(assert (=> d!13329 (= res!35035 (not lt!27201))))

(declare-fun lt!27204 () Bool)

(assert (=> d!13329 (= lt!27201 lt!27204)))

(declare-fun lt!27203 () Unit!1751)

(declare-fun e!42096 () Unit!1751)

(assert (=> d!13329 (= lt!27203 e!42096)))

(declare-fun c!8752 () Bool)

(assert (=> d!13329 (= c!8752 lt!27204)))

(assert (=> d!13329 (= lt!27204 (containsKey!129 (toList!698 lt!27042) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!13329 (= (contains!693 lt!27042 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!27201)))

(declare-fun b!64216 () Bool)

(declare-fun lt!27202 () Unit!1751)

(assert (=> b!64216 (= e!42096 lt!27202)))

(assert (=> b!64216 (= lt!27202 (lemmaContainsKeyImpliesGetValueByKeyDefined!78 (toList!698 lt!27042) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64216 (isDefined!79 (getValueByKey!125 (toList!698 lt!27042) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!64217 () Bool)

(declare-fun Unit!1763 () Unit!1751)

(assert (=> b!64217 (= e!42096 Unit!1763)))

(declare-fun b!64218 () Bool)

(assert (=> b!64218 (= e!42095 (isDefined!79 (getValueByKey!125 (toList!698 lt!27042) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!13329 c!8752) b!64216))

(assert (= (and d!13329 (not c!8752)) b!64217))

(assert (= (and d!13329 (not res!35035)) b!64218))

(assert (=> d!13329 m!58183))

(declare-fun m!58599 () Bool)

(assert (=> d!13329 m!58599))

(assert (=> b!64216 m!58183))

(declare-fun m!58601 () Bool)

(assert (=> b!64216 m!58601))

(assert (=> b!64216 m!58183))

(declare-fun m!58603 () Bool)

(assert (=> b!64216 m!58603))

(assert (=> b!64216 m!58603))

(declare-fun m!58605 () Bool)

(assert (=> b!64216 m!58605))

(assert (=> b!64218 m!58183))

(assert (=> b!64218 m!58603))

(assert (=> b!64218 m!58603))

(assert (=> b!64218 m!58605))

(assert (=> b!64032 d!13329))

(assert (=> d!13235 d!13239))

(declare-fun d!13331 () Bool)

(assert (=> d!13331 (not (arrayContainsKey!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!13331 true))

(declare-fun _$68!40 () Unit!1751)

(assert (=> d!13331 (= (choose!68 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (Cons!1446 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) Nil!1447)) _$68!40)))

(declare-fun bs!2790 () Bool)

(assert (= bs!2790 d!13331))

(assert (=> bs!2790 m!57973))

(assert (=> bs!2790 m!57977))

(assert (=> d!13235 d!13331))

(assert (=> b!64018 d!13269))

(declare-fun d!13333 () Bool)

(assert (=> d!13333 (= (get!1096 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2427 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(assert (=> b!63920 d!13333))

(assert (=> b!63956 d!13265))

(declare-fun d!13335 () Bool)

(assert (=> d!13335 (= (map!1116 (_2!1038 lt!26965)) (getCurrentListMap!394 (_keys!3743 (_2!1038 lt!26965)) (_values!2091 (_2!1038 lt!26965)) (mask!6023 (_2!1038 lt!26965)) (extraKeys!1983 (_2!1038 lt!26965)) (zeroValue!2018 (_2!1038 lt!26965)) (minValue!2018 (_2!1038 lt!26965)) #b00000000000000000000000000000000 (defaultEntry!2108 (_2!1038 lt!26965))))))

(declare-fun bs!2791 () Bool)

(assert (= bs!2791 d!13335))

(declare-fun m!58607 () Bool)

(assert (=> bs!2791 m!58607))

(assert (=> bm!5107 d!13335))

(declare-fun d!13337 () Bool)

(declare-fun e!42097 () Bool)

(assert (=> d!13337 e!42097))

(declare-fun res!35036 () Bool)

(assert (=> d!13337 (=> res!35036 e!42097)))

(declare-fun lt!27205 () Bool)

(assert (=> d!13337 (= res!35036 (not lt!27205))))

(declare-fun lt!27208 () Bool)

(assert (=> d!13337 (= lt!27205 lt!27208)))

(declare-fun lt!27207 () Unit!1751)

(declare-fun e!42098 () Unit!1751)

(assert (=> d!13337 (= lt!27207 e!42098)))

(declare-fun c!8753 () Bool)

(assert (=> d!13337 (= c!8753 lt!27208)))

(assert (=> d!13337 (= lt!27208 (containsKey!129 (toList!698 call!5122) (select (arr!1792 (_keys!3743 newMap!16)) (index!3059 lt!26958))))))

(assert (=> d!13337 (= (contains!693 call!5122 (select (arr!1792 (_keys!3743 newMap!16)) (index!3059 lt!26958))) lt!27205)))

(declare-fun b!64219 () Bool)

(declare-fun lt!27206 () Unit!1751)

(assert (=> b!64219 (= e!42098 lt!27206)))

(assert (=> b!64219 (= lt!27206 (lemmaContainsKeyImpliesGetValueByKeyDefined!78 (toList!698 call!5122) (select (arr!1792 (_keys!3743 newMap!16)) (index!3059 lt!26958))))))

(assert (=> b!64219 (isDefined!79 (getValueByKey!125 (toList!698 call!5122) (select (arr!1792 (_keys!3743 newMap!16)) (index!3059 lt!26958))))))

(declare-fun b!64220 () Bool)

(declare-fun Unit!1764 () Unit!1751)

(assert (=> b!64220 (= e!42098 Unit!1764)))

(declare-fun b!64221 () Bool)

(assert (=> b!64221 (= e!42097 (isDefined!79 (getValueByKey!125 (toList!698 call!5122) (select (arr!1792 (_keys!3743 newMap!16)) (index!3059 lt!26958)))))))

(assert (= (and d!13337 c!8753) b!64219))

(assert (= (and d!13337 (not c!8753)) b!64220))

(assert (= (and d!13337 (not res!35036)) b!64221))

(assert (=> d!13337 m!58139))

(declare-fun m!58609 () Bool)

(assert (=> d!13337 m!58609))

(assert (=> b!64219 m!58139))

(declare-fun m!58611 () Bool)

(assert (=> b!64219 m!58611))

(assert (=> b!64219 m!58139))

(declare-fun m!58613 () Bool)

(assert (=> b!64219 m!58613))

(assert (=> b!64219 m!58613))

(declare-fun m!58615 () Bool)

(assert (=> b!64219 m!58615))

(assert (=> b!64221 m!58139))

(assert (=> b!64221 m!58613))

(assert (=> b!64221 m!58613))

(assert (=> b!64221 m!58615))

(assert (=> b!63880 d!13337))

(declare-fun d!13339 () Bool)

(declare-fun e!42101 () Bool)

(assert (=> d!13339 e!42101))

(declare-fun res!35039 () Bool)

(assert (=> d!13339 (=> (not res!35039) (not e!42101))))

(assert (=> d!13339 (= res!35039 (and (bvsge (index!3059 lt!26958) #b00000000000000000000000000000000) (bvslt (index!3059 lt!26958) (size!2026 (_keys!3743 newMap!16)))))))

(declare-fun lt!27211 () Unit!1751)

(declare-fun choose!355 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 32) Int) Unit!1751)

(assert (=> d!13339 (= lt!27211 (choose!355 (_keys!3743 newMap!16) lt!26960 (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (index!3059 lt!26958) (defaultEntry!2108 newMap!16)))))

(assert (=> d!13339 (validMask!0 (mask!6023 newMap!16))))

(assert (=> d!13339 (= (lemmaValidKeyInArrayIsInListMap!77 (_keys!3743 newMap!16) lt!26960 (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (index!3059 lt!26958) (defaultEntry!2108 newMap!16)) lt!27211)))

(declare-fun b!64224 () Bool)

(assert (=> b!64224 (= e!42101 (contains!693 (getCurrentListMap!394 (_keys!3743 newMap!16) lt!26960 (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (select (arr!1792 (_keys!3743 newMap!16)) (index!3059 lt!26958))))))

(assert (= (and d!13339 res!35039) b!64224))

(declare-fun m!58617 () Bool)

(assert (=> d!13339 m!58617))

(assert (=> d!13339 m!58327))

(declare-fun m!58619 () Bool)

(assert (=> b!64224 m!58619))

(assert (=> b!64224 m!58139))

(assert (=> b!64224 m!58619))

(assert (=> b!64224 m!58139))

(declare-fun m!58621 () Bool)

(assert (=> b!64224 m!58621))

(assert (=> b!63880 d!13339))

(declare-fun d!13341 () Bool)

(declare-fun e!42104 () Bool)

(assert (=> d!13341 e!42104))

(declare-fun res!35042 () Bool)

(assert (=> d!13341 (=> (not res!35042) (not e!42104))))

(assert (=> d!13341 (= res!35042 (and (bvsge (index!3059 lt!26958) #b00000000000000000000000000000000) (bvslt (index!3059 lt!26958) (size!2027 (_values!2091 newMap!16)))))))

(declare-fun lt!27214 () Unit!1751)

(declare-fun choose!356 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 32) (_ BitVec 64) V!2873 Int) Unit!1751)

(assert (=> d!13341 (= lt!27214 (choose!356 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (index!3059 lt!26958) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2108 newMap!16)))))

(assert (=> d!13341 (validMask!0 (mask!6023 newMap!16))))

(assert (=> d!13341 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!18 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (index!3059 lt!26958) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2108 newMap!16)) lt!27214)))

(declare-fun b!64227 () Bool)

(assert (=> b!64227 (= e!42104 (= (+!84 (getCurrentListMap!394 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!394 (_keys!3743 newMap!16) (array!3754 (store (arr!1793 (_values!2091 newMap!16)) (index!3059 lt!26958) (ValueCellFull!866 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2027 (_values!2091 newMap!16))) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16))))))

(assert (= (and d!13341 res!35042) b!64227))

(assert (=> d!13341 m!57973))

(assert (=> d!13341 m!57985))

(declare-fun m!58623 () Bool)

(assert (=> d!13341 m!58623))

(assert (=> d!13341 m!58327))

(assert (=> b!64227 m!58113))

(assert (=> b!64227 m!58113))

(declare-fun m!58625 () Bool)

(assert (=> b!64227 m!58625))

(assert (=> b!64227 m!58115))

(declare-fun m!58627 () Bool)

(assert (=> b!64227 m!58627))

(assert (=> b!63880 d!13341))

(declare-fun d!13343 () Bool)

(assert (=> d!13343 (isDefined!79 (getValueByKey!125 (toList!698 lt!26840) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun lt!27217 () Unit!1751)

(declare-fun choose!357 (List!1451 (_ BitVec 64)) Unit!1751)

(assert (=> d!13343 (= lt!27217 (choose!357 (toList!698 lt!26840) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun e!42107 () Bool)

(assert (=> d!13343 e!42107))

(declare-fun res!35045 () Bool)

(assert (=> d!13343 (=> (not res!35045) (not e!42107))))

(declare-fun isStrictlySorted!282 (List!1451) Bool)

(assert (=> d!13343 (= res!35045 (isStrictlySorted!282 (toList!698 lt!26840)))))

(assert (=> d!13343 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!78 (toList!698 lt!26840) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) lt!27217)))

(declare-fun b!64230 () Bool)

(assert (=> b!64230 (= e!42107 (containsKey!129 (toList!698 lt!26840) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(assert (= (and d!13343 res!35045) b!64230))

(assert (=> d!13343 m!57973))

(assert (=> d!13343 m!58101))

(assert (=> d!13343 m!58101))

(assert (=> d!13343 m!58103))

(assert (=> d!13343 m!57973))

(declare-fun m!58629 () Bool)

(assert (=> d!13343 m!58629))

(declare-fun m!58631 () Bool)

(assert (=> d!13343 m!58631))

(assert (=> b!64230 m!57973))

(assert (=> b!64230 m!58097))

(assert (=> b!63787 d!13343))

(declare-fun d!13345 () Bool)

(declare-fun isEmpty!307 (Option!131) Bool)

(assert (=> d!13345 (= (isDefined!79 (getValueByKey!125 (toList!698 lt!26840) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355))) (not (isEmpty!307 (getValueByKey!125 (toList!698 lt!26840) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))))

(declare-fun bs!2792 () Bool)

(assert (= bs!2792 d!13345))

(assert (=> bs!2792 m!58101))

(declare-fun m!58633 () Bool)

(assert (=> bs!2792 m!58633))

(assert (=> b!63787 d!13345))

(declare-fun e!42113 () Option!131)

(declare-fun b!64241 () Bool)

(assert (=> b!64241 (= e!42113 (getValueByKey!125 (t!4856 (toList!698 lt!26840)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun b!64242 () Bool)

(assert (=> b!64242 (= e!42113 None!129)))

(declare-fun b!64239 () Bool)

(declare-fun e!42112 () Option!131)

(assert (=> b!64239 (= e!42112 (Some!130 (_2!1039 (h!2031 (toList!698 lt!26840)))))))

(declare-fun b!64240 () Bool)

(assert (=> b!64240 (= e!42112 e!42113)))

(declare-fun c!8759 () Bool)

(assert (=> b!64240 (= c!8759 (and ((_ is Cons!1447) (toList!698 lt!26840)) (not (= (_1!1039 (h!2031 (toList!698 lt!26840))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))))

(declare-fun c!8758 () Bool)

(declare-fun d!13347 () Bool)

(assert (=> d!13347 (= c!8758 (and ((_ is Cons!1447) (toList!698 lt!26840)) (= (_1!1039 (h!2031 (toList!698 lt!26840))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355))))))

(assert (=> d!13347 (= (getValueByKey!125 (toList!698 lt!26840) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) e!42112)))

(assert (= (and d!13347 c!8758) b!64239))

(assert (= (and d!13347 (not c!8758)) b!64240))

(assert (= (and b!64240 c!8759) b!64241))

(assert (= (and b!64240 (not c!8759)) b!64242))

(assert (=> b!64241 m!57973))

(declare-fun m!58635 () Bool)

(assert (=> b!64241 m!58635))

(assert (=> b!63787 d!13347))

(declare-fun d!13349 () Bool)

(declare-fun e!42114 () Bool)

(assert (=> d!13349 e!42114))

(declare-fun res!35046 () Bool)

(assert (=> d!13349 (=> res!35046 e!42114)))

(declare-fun lt!27218 () Bool)

(assert (=> d!13349 (= res!35046 (not lt!27218))))

(declare-fun lt!27221 () Bool)

(assert (=> d!13349 (= lt!27218 lt!27221)))

(declare-fun lt!27220 () Unit!1751)

(declare-fun e!42115 () Unit!1751)

(assert (=> d!13349 (= lt!27220 e!42115)))

(declare-fun c!8760 () Bool)

(assert (=> d!13349 (= c!8760 lt!27221)))

(assert (=> d!13349 (= lt!27221 (containsKey!129 (toList!698 e!41897) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(assert (=> d!13349 (= (contains!693 e!41897 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) lt!27218)))

(declare-fun b!64243 () Bool)

(declare-fun lt!27219 () Unit!1751)

(assert (=> b!64243 (= e!42115 lt!27219)))

(assert (=> b!64243 (= lt!27219 (lemmaContainsKeyImpliesGetValueByKeyDefined!78 (toList!698 e!41897) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(assert (=> b!64243 (isDefined!79 (getValueByKey!125 (toList!698 e!41897) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun b!64244 () Bool)

(declare-fun Unit!1765 () Unit!1751)

(assert (=> b!64244 (= e!42115 Unit!1765)))

(declare-fun b!64245 () Bool)

(assert (=> b!64245 (= e!42114 (isDefined!79 (getValueByKey!125 (toList!698 e!41897) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355))))))

(assert (= (and d!13349 c!8760) b!64243))

(assert (= (and d!13349 (not c!8760)) b!64244))

(assert (= (and d!13349 (not res!35046)) b!64245))

(assert (=> d!13349 m!57973))

(declare-fun m!58637 () Bool)

(assert (=> d!13349 m!58637))

(assert (=> b!64243 m!57973))

(declare-fun m!58639 () Bool)

(assert (=> b!64243 m!58639))

(assert (=> b!64243 m!57973))

(declare-fun m!58641 () Bool)

(assert (=> b!64243 m!58641))

(assert (=> b!64243 m!58641))

(declare-fun m!58643 () Bool)

(assert (=> b!64243 m!58643))

(assert (=> b!64245 m!57973))

(assert (=> b!64245 m!58641))

(assert (=> b!64245 m!58641))

(assert (=> b!64245 m!58643))

(assert (=> bm!5115 d!13349))

(assert (=> b!63789 d!13345))

(assert (=> b!63789 d!13347))

(declare-fun d!13351 () Bool)

(declare-fun e!42116 () Bool)

(assert (=> d!13351 e!42116))

(declare-fun res!35047 () Bool)

(assert (=> d!13351 (=> res!35047 e!42116)))

(declare-fun lt!27222 () Bool)

(assert (=> d!13351 (= res!35047 (not lt!27222))))

(declare-fun lt!27225 () Bool)

(assert (=> d!13351 (= lt!27222 lt!27225)))

(declare-fun lt!27224 () Unit!1751)

(declare-fun e!42117 () Unit!1751)

(assert (=> d!13351 (= lt!27224 e!42117)))

(declare-fun c!8761 () Bool)

(assert (=> d!13351 (= c!8761 lt!27225)))

(assert (=> d!13351 (= lt!27225 (containsKey!129 (toList!698 lt!27042) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13351 (= (contains!693 lt!27042 #b0000000000000000000000000000000000000000000000000000000000000000) lt!27222)))

(declare-fun b!64246 () Bool)

(declare-fun lt!27223 () Unit!1751)

(assert (=> b!64246 (= e!42117 lt!27223)))

(assert (=> b!64246 (= lt!27223 (lemmaContainsKeyImpliesGetValueByKeyDefined!78 (toList!698 lt!27042) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64246 (isDefined!79 (getValueByKey!125 (toList!698 lt!27042) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64247 () Bool)

(declare-fun Unit!1766 () Unit!1751)

(assert (=> b!64247 (= e!42117 Unit!1766)))

(declare-fun b!64248 () Bool)

(assert (=> b!64248 (= e!42116 (isDefined!79 (getValueByKey!125 (toList!698 lt!27042) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13351 c!8761) b!64246))

(assert (= (and d!13351 (not c!8761)) b!64247))

(assert (= (and d!13351 (not res!35047)) b!64248))

(declare-fun m!58645 () Bool)

(assert (=> d!13351 m!58645))

(declare-fun m!58647 () Bool)

(assert (=> b!64246 m!58647))

(declare-fun m!58649 () Bool)

(assert (=> b!64246 m!58649))

(assert (=> b!64246 m!58649))

(declare-fun m!58651 () Bool)

(assert (=> b!64246 m!58651))

(assert (=> b!64248 m!58649))

(assert (=> b!64248 m!58649))

(assert (=> b!64248 m!58651))

(assert (=> bm!5147 d!13351))

(assert (=> d!13237 d!13243))

(declare-fun d!13353 () Bool)

(assert (=> d!13353 (arrayNoDuplicates!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) from!355 Nil!1447)))

(assert (=> d!13353 true))

(declare-fun _$71!81 () Unit!1751)

(assert (=> d!13353 (= (choose!39 (_keys!3743 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!81)))

(declare-fun bs!2793 () Bool)

(assert (= bs!2793 d!13353))

(assert (=> bs!2793 m!57971))

(assert (=> d!13237 d!13353))

(declare-fun d!13355 () Bool)

(assert (=> d!13355 (= (apply!69 lt!27042 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1098 (getValueByKey!125 (toList!698 lt!27042) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!2794 () Bool)

(assert (= bs!2794 d!13355))

(assert (=> bs!2794 m!58183))

(assert (=> bs!2794 m!58603))

(assert (=> bs!2794 m!58603))

(declare-fun m!58653 () Bool)

(assert (=> bs!2794 m!58653))

(assert (=> b!64026 d!13355))

(declare-fun d!13357 () Bool)

(declare-fun c!8762 () Bool)

(assert (=> d!13357 (= c!8762 ((_ is ValueCellFull!866) (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!42118 () V!2873)

(assert (=> d!13357 (= (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!42118)))

(declare-fun b!64249 () Bool)

(assert (=> b!64249 (= e!42118 (get!1096 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!64250 () Bool)

(assert (=> b!64250 (= e!42118 (get!1097 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13357 c!8762) b!64249))

(assert (= (and d!13357 (not c!8762)) b!64250))

(assert (=> b!64249 m!58207))

(assert (=> b!64249 m!57983))

(declare-fun m!58655 () Bool)

(assert (=> b!64249 m!58655))

(assert (=> b!64250 m!58207))

(assert (=> b!64250 m!57983))

(declare-fun m!58657 () Bool)

(assert (=> b!64250 m!58657))

(assert (=> b!64026 d!13357))

(assert (=> d!13249 d!13229))

(declare-fun d!13359 () Bool)

(declare-fun e!42121 () Bool)

(assert (=> d!13359 e!42121))

(declare-fun c!8765 () Bool)

(assert (=> d!13359 (= c!8765 (and (not (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!13359 true))

(declare-fun _$29!75 () Unit!1751)

(assert (=> d!13359 (= (choose!350 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (_values!2091 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992))) (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) (zeroValue!2018 (v!2428 (underlying!232 thiss!992))) (minValue!2018 (v!2428 (underlying!232 thiss!992))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992)))) _$29!75)))

(declare-fun b!64255 () Bool)

(assert (=> b!64255 (= e!42121 (arrayContainsKey!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!64256 () Bool)

(assert (=> b!64256 (= e!42121 (ite (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1983 (v!2428 (underlying!232 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!13359 c!8765) b!64255))

(assert (= (and d!13359 (not c!8765)) b!64256))

(assert (=> b!64255 m!57973))

(assert (=> b!64255 m!57977))

(assert (=> d!13241 d!13359))

(assert (=> d!13241 d!13229))

(declare-fun d!13361 () Bool)

(assert (=> d!13361 (= (apply!69 lt!27042 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1098 (getValueByKey!125 (toList!698 lt!27042) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2795 () Bool)

(assert (= bs!2795 d!13361))

(assert (=> bs!2795 m!58649))

(assert (=> bs!2795 m!58649))

(declare-fun m!58659 () Bool)

(assert (=> bs!2795 m!58659))

(assert (=> b!64027 d!13361))

(declare-fun b!64273 () Bool)

(declare-fun res!35058 () Bool)

(declare-fun e!42132 () Bool)

(assert (=> b!64273 (=> (not res!35058) (not e!42132))))

(declare-fun call!5181 () Bool)

(assert (=> b!64273 (= res!35058 call!5181)))

(declare-fun e!42131 () Bool)

(assert (=> b!64273 (= e!42131 e!42132)))

(declare-fun b!64274 () Bool)

(declare-fun lt!27230 () SeekEntryResult!233)

(assert (=> b!64274 (and (bvsge (index!3058 lt!27230) #b00000000000000000000000000000000) (bvslt (index!3058 lt!27230) (size!2026 (_keys!3743 newMap!16))))))

(declare-fun res!35056 () Bool)

(assert (=> b!64274 (= res!35056 (= (select (arr!1792 (_keys!3743 newMap!16)) (index!3058 lt!27230)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42133 () Bool)

(assert (=> b!64274 (=> (not res!35056) (not e!42133))))

(declare-fun b!64275 () Bool)

(declare-fun call!5182 () Bool)

(assert (=> b!64275 (= e!42132 (not call!5182))))

(declare-fun b!64276 () Bool)

(assert (=> b!64276 (= e!42133 (not call!5182))))

(declare-fun b!64278 () Bool)

(declare-fun e!42130 () Bool)

(assert (=> b!64278 (= e!42130 e!42131)))

(declare-fun c!8770 () Bool)

(assert (=> b!64278 (= c!8770 ((_ is MissingVacant!233) lt!27230))))

(declare-fun b!64279 () Bool)

(assert (=> b!64279 (= e!42130 e!42133)))

(declare-fun res!35059 () Bool)

(assert (=> b!64279 (= res!35059 call!5181)))

(assert (=> b!64279 (=> (not res!35059) (not e!42133))))

(declare-fun c!8771 () Bool)

(declare-fun bm!5178 () Bool)

(assert (=> bm!5178 (= call!5181 (inRange!0 (ite c!8771 (index!3058 lt!27230) (index!3061 lt!27230)) (mask!6023 newMap!16)))))

(declare-fun bm!5179 () Bool)

(assert (=> bm!5179 (= call!5182 (arrayContainsKey!0 (_keys!3743 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!64280 () Bool)

(assert (=> b!64280 (= e!42131 ((_ is Undefined!233) lt!27230))))

(declare-fun d!13363 () Bool)

(assert (=> d!13363 e!42130))

(assert (=> d!13363 (= c!8771 ((_ is MissingZero!233) lt!27230))))

(assert (=> d!13363 (= lt!27230 (seekEntryOrOpen!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (_keys!3743 newMap!16) (mask!6023 newMap!16)))))

(declare-fun lt!27231 () Unit!1751)

(declare-fun choose!358 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 64) Int) Unit!1751)

(assert (=> d!13363 (= lt!27231 (choose!358 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)))))

(assert (=> d!13363 (validMask!0 (mask!6023 newMap!16))))

(assert (=> d!13363 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!18 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)) lt!27231)))

(declare-fun b!64277 () Bool)

(declare-fun res!35057 () Bool)

(assert (=> b!64277 (=> (not res!35057) (not e!42132))))

(assert (=> b!64277 (= res!35057 (= (select (arr!1792 (_keys!3743 newMap!16)) (index!3061 lt!27230)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64277 (and (bvsge (index!3061 lt!27230) #b00000000000000000000000000000000) (bvslt (index!3061 lt!27230) (size!2026 (_keys!3743 newMap!16))))))

(assert (= (and d!13363 c!8771) b!64279))

(assert (= (and d!13363 (not c!8771)) b!64278))

(assert (= (and b!64279 res!35059) b!64274))

(assert (= (and b!64274 res!35056) b!64276))

(assert (= (and b!64278 c!8770) b!64273))

(assert (= (and b!64278 (not c!8770)) b!64280))

(assert (= (and b!64273 res!35058) b!64277))

(assert (= (and b!64277 res!35057) b!64275))

(assert (= (or b!64279 b!64273) bm!5178))

(assert (= (or b!64276 b!64275) bm!5179))

(declare-fun m!58661 () Bool)

(assert (=> b!64277 m!58661))

(assert (=> d!13363 m!57973))

(assert (=> d!13363 m!58109))

(assert (=> d!13363 m!57973))

(declare-fun m!58663 () Bool)

(assert (=> d!13363 m!58663))

(assert (=> d!13363 m!58327))

(declare-fun m!58665 () Bool)

(assert (=> b!64274 m!58665))

(assert (=> bm!5179 m!57973))

(assert (=> bm!5179 m!58147))

(declare-fun m!58667 () Bool)

(assert (=> bm!5178 m!58667))

(assert (=> bm!5111 d!13363))

(declare-fun d!13365 () Bool)

(declare-fun res!35064 () Bool)

(declare-fun e!42138 () Bool)

(assert (=> d!13365 (=> res!35064 e!42138)))

(assert (=> d!13365 (= res!35064 (and ((_ is Cons!1447) (toList!698 lt!26840)) (= (_1!1039 (h!2031 (toList!698 lt!26840))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355))))))

(assert (=> d!13365 (= (containsKey!129 (toList!698 lt!26840) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) e!42138)))

(declare-fun b!64285 () Bool)

(declare-fun e!42139 () Bool)

(assert (=> b!64285 (= e!42138 e!42139)))

(declare-fun res!35065 () Bool)

(assert (=> b!64285 (=> (not res!35065) (not e!42139))))

(assert (=> b!64285 (= res!35065 (and (or (not ((_ is Cons!1447) (toList!698 lt!26840))) (bvsle (_1!1039 (h!2031 (toList!698 lt!26840))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355))) ((_ is Cons!1447) (toList!698 lt!26840)) (bvslt (_1!1039 (h!2031 (toList!698 lt!26840))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355))))))

(declare-fun b!64286 () Bool)

(assert (=> b!64286 (= e!42139 (containsKey!129 (t!4856 (toList!698 lt!26840)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(assert (= (and d!13365 (not res!35064)) b!64285))

(assert (= (and b!64285 res!35065) b!64286))

(assert (=> b!64286 m!57973))

(declare-fun m!58669 () Bool)

(assert (=> b!64286 m!58669))

(assert (=> d!13223 d!13365))

(declare-fun b!64287 () Bool)

(declare-fun e!42144 () Bool)

(declare-fun call!5186 () Bool)

(assert (=> b!64287 (= e!42144 (not call!5186))))

(declare-fun d!13367 () Bool)

(declare-fun e!42151 () Bool)

(assert (=> d!13367 e!42151))

(declare-fun res!35071 () Bool)

(assert (=> d!13367 (=> (not res!35071) (not e!42151))))

(assert (=> d!13367 (= res!35071 (or (bvsge #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))))

(declare-fun lt!27235 () ListLongMap!1365)

(declare-fun lt!27253 () ListLongMap!1365)

(assert (=> d!13367 (= lt!27235 lt!27253)))

(declare-fun lt!27247 () Unit!1751)

(declare-fun e!42147 () Unit!1751)

(assert (=> d!13367 (= lt!27247 e!42147)))

(declare-fun c!8772 () Bool)

(declare-fun e!42142 () Bool)

(assert (=> d!13367 (= c!8772 e!42142)))

(declare-fun res!35068 () Bool)

(assert (=> d!13367 (=> (not res!35068) (not e!42142))))

(assert (=> d!13367 (= res!35068 (bvslt #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))

(declare-fun e!42149 () ListLongMap!1365)

(assert (=> d!13367 (= lt!27253 e!42149)))

(declare-fun c!8777 () Bool)

(assert (=> d!13367 (= c!8777 (and (not (= (bvand (ite c!8671 (ite c!8667 (extraKeys!1983 newMap!16) lt!26952) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!8671 (ite c!8667 (extraKeys!1983 newMap!16) lt!26952) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13367 (validMask!0 (mask!6023 newMap!16))))

(assert (=> d!13367 (= (getCurrentListMap!394 (_keys!3743 newMap!16) (ite c!8671 (_values!2091 newMap!16) lt!26960) (mask!6023 newMap!16) (ite c!8671 (ite c!8667 (extraKeys!1983 newMap!16) lt!26952) (extraKeys!1983 newMap!16)) (zeroValue!2018 newMap!16) (ite c!8671 (ite c!8667 (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) lt!27235)))

(declare-fun b!64288 () Bool)

(declare-fun res!35072 () Bool)

(assert (=> b!64288 (=> (not res!35072) (not e!42151))))

(declare-fun e!42152 () Bool)

(assert (=> b!64288 (= res!35072 e!42152)))

(declare-fun c!8776 () Bool)

(assert (=> b!64288 (= c!8776 (not (= (bvand (ite c!8671 (ite c!8667 (extraKeys!1983 newMap!16) lt!26952) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!8775 () Bool)

(declare-fun b!64289 () Bool)

(assert (=> b!64289 (= c!8775 (and (not (= (bvand (ite c!8671 (ite c!8667 (extraKeys!1983 newMap!16) lt!26952) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!8671 (ite c!8667 (extraKeys!1983 newMap!16) lt!26952) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!42141 () ListLongMap!1365)

(declare-fun e!42143 () ListLongMap!1365)

(assert (=> b!64289 (= e!42141 e!42143)))

(declare-fun b!64290 () Bool)

(declare-fun call!5187 () ListLongMap!1365)

(assert (=> b!64290 (= e!42143 call!5187)))

(declare-fun b!64291 () Bool)

(declare-fun call!5184 () ListLongMap!1365)

(assert (=> b!64291 (= e!42141 call!5184)))

(declare-fun b!64292 () Bool)

(declare-fun Unit!1767 () Unit!1751)

(assert (=> b!64292 (= e!42147 Unit!1767)))

(declare-fun b!64293 () Bool)

(declare-fun e!42150 () Bool)

(assert (=> b!64293 (= e!42150 (validKeyInArray!0 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64294 () Bool)

(declare-fun e!42148 () Bool)

(assert (=> b!64294 (= e!42148 (= (apply!69 lt!27235 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!8671 (ite c!8667 (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16))))))

(declare-fun call!5185 () ListLongMap!1365)

(declare-fun bm!5180 () Bool)

(assert (=> bm!5180 (= call!5185 (getCurrentListMapNoExtraKeys!47 (_keys!3743 newMap!16) (ite c!8671 (_values!2091 newMap!16) lt!26960) (mask!6023 newMap!16) (ite c!8671 (ite c!8667 (extraKeys!1983 newMap!16) lt!26952) (extraKeys!1983 newMap!16)) (zeroValue!2018 newMap!16) (ite c!8671 (ite c!8667 (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun b!64295 () Bool)

(assert (=> b!64295 (= e!42143 call!5184)))

(declare-fun bm!5181 () Bool)

(declare-fun call!5183 () ListLongMap!1365)

(assert (=> bm!5181 (= call!5187 call!5183)))

(declare-fun b!64296 () Bool)

(assert (=> b!64296 (= e!42151 e!42144)))

(declare-fun c!8773 () Bool)

(assert (=> b!64296 (= c!8773 (not (= (bvand (ite c!8671 (ite c!8667 (extraKeys!1983 newMap!16) lt!26952) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64297 () Bool)

(assert (=> b!64297 (= e!42142 (validKeyInArray!0 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64298 () Bool)

(assert (=> b!64298 (= e!42149 e!42141)))

(declare-fun c!8774 () Bool)

(assert (=> b!64298 (= c!8774 (and (not (= (bvand (ite c!8671 (ite c!8667 (extraKeys!1983 newMap!16) lt!26952) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!8671 (ite c!8667 (extraKeys!1983 newMap!16) lt!26952) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64299 () Bool)

(declare-fun call!5188 () ListLongMap!1365)

(assert (=> b!64299 (= e!42149 (+!84 call!5188 (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!8671 (ite c!8667 (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)))))))

(declare-fun b!64300 () Bool)

(declare-fun e!42140 () Bool)

(assert (=> b!64300 (= e!42152 e!42140)))

(declare-fun res!35070 () Bool)

(declare-fun call!5189 () Bool)

(assert (=> b!64300 (= res!35070 call!5189)))

(assert (=> b!64300 (=> (not res!35070) (not e!42140))))

(declare-fun bm!5182 () Bool)

(assert (=> bm!5182 (= call!5184 call!5188)))

(declare-fun bm!5183 () Bool)

(assert (=> bm!5183 (= call!5189 (contains!693 lt!27235 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64301 () Bool)

(declare-fun e!42146 () Bool)

(assert (=> b!64301 (= e!42146 (= (apply!69 lt!27235 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)) (get!1095 (select (arr!1793 (ite c!8671 (_values!2091 newMap!16) lt!26960)) #b00000000000000000000000000000000) (dynLambda!313 (defaultEntry!2108 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64301 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2027 (ite c!8671 (_values!2091 newMap!16) lt!26960))))))

(assert (=> b!64301 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))

(declare-fun bm!5184 () Bool)

(assert (=> bm!5184 (= call!5183 call!5185)))

(declare-fun b!64302 () Bool)

(assert (=> b!64302 (= e!42140 (= (apply!69 lt!27235 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2018 newMap!16)))))

(declare-fun b!64303 () Bool)

(declare-fun lt!27233 () Unit!1751)

(assert (=> b!64303 (= e!42147 lt!27233)))

(declare-fun lt!27248 () ListLongMap!1365)

(assert (=> b!64303 (= lt!27248 (getCurrentListMapNoExtraKeys!47 (_keys!3743 newMap!16) (ite c!8671 (_values!2091 newMap!16) lt!26960) (mask!6023 newMap!16) (ite c!8671 (ite c!8667 (extraKeys!1983 newMap!16) lt!26952) (extraKeys!1983 newMap!16)) (zeroValue!2018 newMap!16) (ite c!8671 (ite c!8667 (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27251 () (_ BitVec 64))

(assert (=> b!64303 (= lt!27251 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27240 () (_ BitVec 64))

(assert (=> b!64303 (= lt!27240 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27232 () Unit!1751)

(assert (=> b!64303 (= lt!27232 (addStillContains!45 lt!27248 lt!27251 (zeroValue!2018 newMap!16) lt!27240))))

(assert (=> b!64303 (contains!693 (+!84 lt!27248 (tuple2!2057 lt!27251 (zeroValue!2018 newMap!16))) lt!27240)))

(declare-fun lt!27243 () Unit!1751)

(assert (=> b!64303 (= lt!27243 lt!27232)))

(declare-fun lt!27252 () ListLongMap!1365)

(assert (=> b!64303 (= lt!27252 (getCurrentListMapNoExtraKeys!47 (_keys!3743 newMap!16) (ite c!8671 (_values!2091 newMap!16) lt!26960) (mask!6023 newMap!16) (ite c!8671 (ite c!8667 (extraKeys!1983 newMap!16) lt!26952) (extraKeys!1983 newMap!16)) (zeroValue!2018 newMap!16) (ite c!8671 (ite c!8667 (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27236 () (_ BitVec 64))

(assert (=> b!64303 (= lt!27236 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27241 () (_ BitVec 64))

(assert (=> b!64303 (= lt!27241 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27245 () Unit!1751)

(assert (=> b!64303 (= lt!27245 (addApplyDifferent!45 lt!27252 lt!27236 (ite c!8671 (ite c!8667 (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) lt!27241))))

(assert (=> b!64303 (= (apply!69 (+!84 lt!27252 (tuple2!2057 lt!27236 (ite c!8671 (ite c!8667 (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)))) lt!27241) (apply!69 lt!27252 lt!27241))))

(declare-fun lt!27238 () Unit!1751)

(assert (=> b!64303 (= lt!27238 lt!27245)))

(declare-fun lt!27246 () ListLongMap!1365)

(assert (=> b!64303 (= lt!27246 (getCurrentListMapNoExtraKeys!47 (_keys!3743 newMap!16) (ite c!8671 (_values!2091 newMap!16) lt!26960) (mask!6023 newMap!16) (ite c!8671 (ite c!8667 (extraKeys!1983 newMap!16) lt!26952) (extraKeys!1983 newMap!16)) (zeroValue!2018 newMap!16) (ite c!8671 (ite c!8667 (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27250 () (_ BitVec 64))

(assert (=> b!64303 (= lt!27250 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27237 () (_ BitVec 64))

(assert (=> b!64303 (= lt!27237 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27244 () Unit!1751)

(assert (=> b!64303 (= lt!27244 (addApplyDifferent!45 lt!27246 lt!27250 (zeroValue!2018 newMap!16) lt!27237))))

(assert (=> b!64303 (= (apply!69 (+!84 lt!27246 (tuple2!2057 lt!27250 (zeroValue!2018 newMap!16))) lt!27237) (apply!69 lt!27246 lt!27237))))

(declare-fun lt!27239 () Unit!1751)

(assert (=> b!64303 (= lt!27239 lt!27244)))

(declare-fun lt!27234 () ListLongMap!1365)

(assert (=> b!64303 (= lt!27234 (getCurrentListMapNoExtraKeys!47 (_keys!3743 newMap!16) (ite c!8671 (_values!2091 newMap!16) lt!26960) (mask!6023 newMap!16) (ite c!8671 (ite c!8667 (extraKeys!1983 newMap!16) lt!26952) (extraKeys!1983 newMap!16)) (zeroValue!2018 newMap!16) (ite c!8671 (ite c!8667 (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27249 () (_ BitVec 64))

(assert (=> b!64303 (= lt!27249 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27242 () (_ BitVec 64))

(assert (=> b!64303 (= lt!27242 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64303 (= lt!27233 (addApplyDifferent!45 lt!27234 lt!27249 (ite c!8671 (ite c!8667 (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) lt!27242))))

(assert (=> b!64303 (= (apply!69 (+!84 lt!27234 (tuple2!2057 lt!27249 (ite c!8671 (ite c!8667 (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)))) lt!27242) (apply!69 lt!27234 lt!27242))))

(declare-fun b!64304 () Bool)

(assert (=> b!64304 (= e!42152 (not call!5189))))

(declare-fun b!64305 () Bool)

(declare-fun res!35066 () Bool)

(assert (=> b!64305 (=> (not res!35066) (not e!42151))))

(declare-fun e!42145 () Bool)

(assert (=> b!64305 (= res!35066 e!42145)))

(declare-fun res!35067 () Bool)

(assert (=> b!64305 (=> res!35067 e!42145)))

(assert (=> b!64305 (= res!35067 (not e!42150))))

(declare-fun res!35073 () Bool)

(assert (=> b!64305 (=> (not res!35073) (not e!42150))))

(assert (=> b!64305 (= res!35073 (bvslt #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))

(declare-fun b!64306 () Bool)

(assert (=> b!64306 (= e!42144 e!42148)))

(declare-fun res!35069 () Bool)

(assert (=> b!64306 (= res!35069 call!5186)))

(assert (=> b!64306 (=> (not res!35069) (not e!42148))))

(declare-fun bm!5185 () Bool)

(assert (=> bm!5185 (= call!5186 (contains!693 lt!27235 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5186 () Bool)

(assert (=> bm!5186 (= call!5188 (+!84 (ite c!8777 call!5185 (ite c!8774 call!5183 call!5187)) (ite (or c!8777 c!8774) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 newMap!16)) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!8671 (ite c!8667 (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16))))))))

(declare-fun b!64307 () Bool)

(assert (=> b!64307 (= e!42145 e!42146)))

(declare-fun res!35074 () Bool)

(assert (=> b!64307 (=> (not res!35074) (not e!42146))))

(assert (=> b!64307 (= res!35074 (contains!693 lt!27235 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!64307 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))

(assert (= (and d!13367 c!8777) b!64299))

(assert (= (and d!13367 (not c!8777)) b!64298))

(assert (= (and b!64298 c!8774) b!64291))

(assert (= (and b!64298 (not c!8774)) b!64289))

(assert (= (and b!64289 c!8775) b!64295))

(assert (= (and b!64289 (not c!8775)) b!64290))

(assert (= (or b!64295 b!64290) bm!5181))

(assert (= (or b!64291 bm!5181) bm!5184))

(assert (= (or b!64291 b!64295) bm!5182))

(assert (= (or b!64299 bm!5184) bm!5180))

(assert (= (or b!64299 bm!5182) bm!5186))

(assert (= (and d!13367 res!35068) b!64297))

(assert (= (and d!13367 c!8772) b!64303))

(assert (= (and d!13367 (not c!8772)) b!64292))

(assert (= (and d!13367 res!35071) b!64305))

(assert (= (and b!64305 res!35073) b!64293))

(assert (= (and b!64305 (not res!35067)) b!64307))

(assert (= (and b!64307 res!35074) b!64301))

(assert (= (and b!64305 res!35066) b!64288))

(assert (= (and b!64288 c!8776) b!64300))

(assert (= (and b!64288 (not c!8776)) b!64304))

(assert (= (and b!64300 res!35070) b!64302))

(assert (= (or b!64300 b!64304) bm!5183))

(assert (= (and b!64288 res!35072) b!64296))

(assert (= (and b!64296 c!8773) b!64306))

(assert (= (and b!64296 (not c!8773)) b!64287))

(assert (= (and b!64306 res!35069) b!64294))

(assert (= (or b!64306 b!64287) bm!5185))

(declare-fun b_lambda!2875 () Bool)

(assert (=> (not b_lambda!2875) (not b!64301)))

(assert (=> b!64301 t!4867))

(declare-fun b_and!3933 () Bool)

(assert (= b_and!3929 (and (=> t!4867 result!2483) b_and!3933)))

(assert (=> b!64301 t!4869))

(declare-fun b_and!3935 () Bool)

(assert (= b_and!3931 (and (=> t!4869 result!2485) b_and!3935)))

(declare-fun m!58671 () Bool)

(assert (=> b!64299 m!58671))

(declare-fun m!58673 () Bool)

(assert (=> bm!5185 m!58673))

(declare-fun m!58675 () Bool)

(assert (=> b!64301 m!58675))

(assert (=> b!64301 m!58675))

(assert (=> b!64301 m!58287))

(declare-fun m!58677 () Bool)

(assert (=> b!64301 m!58677))

(assert (=> b!64301 m!58291))

(assert (=> b!64301 m!58287))

(assert (=> b!64301 m!58291))

(declare-fun m!58679 () Bool)

(assert (=> b!64301 m!58679))

(declare-fun m!58681 () Bool)

(assert (=> b!64303 m!58681))

(declare-fun m!58683 () Bool)

(assert (=> b!64303 m!58683))

(declare-fun m!58685 () Bool)

(assert (=> b!64303 m!58685))

(declare-fun m!58687 () Bool)

(assert (=> b!64303 m!58687))

(declare-fun m!58689 () Bool)

(assert (=> b!64303 m!58689))

(declare-fun m!58691 () Bool)

(assert (=> b!64303 m!58691))

(assert (=> b!64303 m!58689))

(declare-fun m!58693 () Bool)

(assert (=> b!64303 m!58693))

(assert (=> b!64303 m!58681))

(declare-fun m!58695 () Bool)

(assert (=> b!64303 m!58695))

(assert (=> b!64303 m!58291))

(declare-fun m!58697 () Bool)

(assert (=> b!64303 m!58697))

(declare-fun m!58699 () Bool)

(assert (=> b!64303 m!58699))

(declare-fun m!58701 () Bool)

(assert (=> b!64303 m!58701))

(declare-fun m!58703 () Bool)

(assert (=> b!64303 m!58703))

(assert (=> b!64303 m!58685))

(declare-fun m!58705 () Bool)

(assert (=> b!64303 m!58705))

(declare-fun m!58707 () Bool)

(assert (=> b!64303 m!58707))

(declare-fun m!58709 () Bool)

(assert (=> b!64303 m!58709))

(assert (=> b!64303 m!58707))

(declare-fun m!58711 () Bool)

(assert (=> b!64303 m!58711))

(assert (=> bm!5180 m!58683))

(assert (=> d!13367 m!58327))

(assert (=> b!64307 m!58291))

(assert (=> b!64307 m!58291))

(declare-fun m!58713 () Bool)

(assert (=> b!64307 m!58713))

(declare-fun m!58715 () Bool)

(assert (=> bm!5186 m!58715))

(assert (=> b!64293 m!58291))

(assert (=> b!64293 m!58291))

(assert (=> b!64293 m!58333))

(declare-fun m!58717 () Bool)

(assert (=> b!64302 m!58717))

(declare-fun m!58719 () Bool)

(assert (=> b!64294 m!58719))

(assert (=> b!64297 m!58291))

(assert (=> b!64297 m!58291))

(assert (=> b!64297 m!58333))

(declare-fun m!58721 () Bool)

(assert (=> bm!5183 m!58721))

(assert (=> bm!5117 d!13367))

(declare-fun d!13369 () Bool)

(assert (=> d!13369 (= (validKeyInArray!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!63930 d!13369))

(assert (=> b!63944 d!13239))

(declare-fun d!13371 () Bool)

(declare-fun res!35085 () Bool)

(declare-fun e!42155 () Bool)

(assert (=> d!13371 (=> (not res!35085) (not e!42155))))

(assert (=> d!13371 (= res!35085 (validMask!0 (mask!6023 newMap!16)))))

(assert (=> d!13371 (= (simpleValid!45 newMap!16) e!42155)))

(declare-fun b!64318 () Bool)

(declare-fun res!35084 () Bool)

(assert (=> b!64318 (=> (not res!35084) (not e!42155))))

(declare-fun size!2032 (LongMapFixedSize!640) (_ BitVec 32))

(assert (=> b!64318 (= res!35084 (= (size!2032 newMap!16) (bvadd (_size!369 newMap!16) (bvsdiv (bvadd (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!64319 () Bool)

(assert (=> b!64319 (= e!42155 (and (bvsge (extraKeys!1983 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1983 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!369 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!64316 () Bool)

(declare-fun res!35083 () Bool)

(assert (=> b!64316 (=> (not res!35083) (not e!42155))))

(assert (=> b!64316 (= res!35083 (and (= (size!2027 (_values!2091 newMap!16)) (bvadd (mask!6023 newMap!16) #b00000000000000000000000000000001)) (= (size!2026 (_keys!3743 newMap!16)) (size!2027 (_values!2091 newMap!16))) (bvsge (_size!369 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!369 newMap!16) (bvadd (mask!6023 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!64317 () Bool)

(declare-fun res!35086 () Bool)

(assert (=> b!64317 (=> (not res!35086) (not e!42155))))

(assert (=> b!64317 (= res!35086 (bvsge (size!2032 newMap!16) (_size!369 newMap!16)))))

(assert (= (and d!13371 res!35085) b!64316))

(assert (= (and b!64316 res!35083) b!64317))

(assert (= (and b!64317 res!35086) b!64318))

(assert (= (and b!64318 res!35084) b!64319))

(assert (=> d!13371 m!58327))

(declare-fun m!58723 () Bool)

(assert (=> b!64318 m!58723))

(assert (=> b!64317 m!58723))

(assert (=> d!13245 d!13371))

(declare-fun d!13373 () Bool)

(declare-fun e!42156 () Bool)

(assert (=> d!13373 e!42156))

(declare-fun res!35087 () Bool)

(assert (=> d!13373 (=> res!35087 e!42156)))

(declare-fun lt!27254 () Bool)

(assert (=> d!13373 (= res!35087 (not lt!27254))))

(declare-fun lt!27257 () Bool)

(assert (=> d!13373 (= lt!27254 lt!27257)))

(declare-fun lt!27256 () Unit!1751)

(declare-fun e!42157 () Unit!1751)

(assert (=> d!13373 (= lt!27256 e!42157)))

(declare-fun c!8778 () Bool)

(assert (=> d!13373 (= c!8778 lt!27257)))

(assert (=> d!13373 (= lt!27257 (containsKey!129 (toList!698 call!5109) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(assert (=> d!13373 (= (contains!693 call!5109 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) lt!27254)))

(declare-fun b!64320 () Bool)

(declare-fun lt!27255 () Unit!1751)

(assert (=> b!64320 (= e!42157 lt!27255)))

(assert (=> b!64320 (= lt!27255 (lemmaContainsKeyImpliesGetValueByKeyDefined!78 (toList!698 call!5109) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(assert (=> b!64320 (isDefined!79 (getValueByKey!125 (toList!698 call!5109) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun b!64321 () Bool)

(declare-fun Unit!1768 () Unit!1751)

(assert (=> b!64321 (= e!42157 Unit!1768)))

(declare-fun b!64322 () Bool)

(assert (=> b!64322 (= e!42156 (isDefined!79 (getValueByKey!125 (toList!698 call!5109) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355))))))

(assert (= (and d!13373 c!8778) b!64320))

(assert (= (and d!13373 (not c!8778)) b!64321))

(assert (= (and d!13373 (not res!35087)) b!64322))

(assert (=> d!13373 m!57973))

(declare-fun m!58725 () Bool)

(assert (=> d!13373 m!58725))

(assert (=> b!64320 m!57973))

(declare-fun m!58727 () Bool)

(assert (=> b!64320 m!58727))

(assert (=> b!64320 m!57973))

(declare-fun m!58729 () Bool)

(assert (=> b!64320 m!58729))

(assert (=> b!64320 m!58729))

(declare-fun m!58731 () Bool)

(assert (=> b!64320 m!58731))

(assert (=> b!64322 m!57973))

(assert (=> b!64322 m!58729))

(assert (=> b!64322 m!58729))

(assert (=> b!64322 m!58731))

(assert (=> b!63887 d!13373))

(declare-fun b!64323 () Bool)

(declare-fun e!42159 () Bool)

(declare-fun e!42160 () Bool)

(assert (=> b!64323 (= e!42159 e!42160)))

(declare-fun c!8779 () Bool)

(assert (=> b!64323 (= c!8779 (validKeyInArray!0 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!5187 () Bool)

(declare-fun call!5190 () Bool)

(assert (=> bm!5187 (= call!5190 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3743 newMap!16) (mask!6023 newMap!16)))))

(declare-fun d!13375 () Bool)

(declare-fun res!35089 () Bool)

(assert (=> d!13375 (=> res!35089 e!42159)))

(assert (=> d!13375 (= res!35089 (bvsge #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))))))

(assert (=> d!13375 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3743 newMap!16) (mask!6023 newMap!16)) e!42159)))

(declare-fun b!64324 () Bool)

(declare-fun e!42158 () Bool)

(assert (=> b!64324 (= e!42160 e!42158)))

(declare-fun lt!27260 () (_ BitVec 64))

(assert (=> b!64324 (= lt!27260 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27259 () Unit!1751)

(assert (=> b!64324 (= lt!27259 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3743 newMap!16) lt!27260 #b00000000000000000000000000000000))))

(assert (=> b!64324 (arrayContainsKey!0 (_keys!3743 newMap!16) lt!27260 #b00000000000000000000000000000000)))

(declare-fun lt!27258 () Unit!1751)

(assert (=> b!64324 (= lt!27258 lt!27259)))

(declare-fun res!35088 () Bool)

(assert (=> b!64324 (= res!35088 (= (seekEntryOrOpen!0 (select (arr!1792 (_keys!3743 newMap!16)) #b00000000000000000000000000000000) (_keys!3743 newMap!16) (mask!6023 newMap!16)) (Found!233 #b00000000000000000000000000000000)))))

(assert (=> b!64324 (=> (not res!35088) (not e!42158))))

(declare-fun b!64325 () Bool)

(assert (=> b!64325 (= e!42160 call!5190)))

(declare-fun b!64326 () Bool)

(assert (=> b!64326 (= e!42158 call!5190)))

(assert (= (and d!13375 (not res!35089)) b!64323))

(assert (= (and b!64323 c!8779) b!64324))

(assert (= (and b!64323 (not c!8779)) b!64325))

(assert (= (and b!64324 res!35088) b!64326))

(assert (= (or b!64326 b!64325) bm!5187))

(assert (=> b!64323 m!58291))

(assert (=> b!64323 m!58291))

(assert (=> b!64323 m!58333))

(declare-fun m!58733 () Bool)

(assert (=> bm!5187 m!58733))

(assert (=> b!64324 m!58291))

(declare-fun m!58735 () Bool)

(assert (=> b!64324 m!58735))

(declare-fun m!58737 () Bool)

(assert (=> b!64324 m!58737))

(assert (=> b!64324 m!58291))

(declare-fun m!58739 () Bool)

(assert (=> b!64324 m!58739))

(assert (=> b!63968 d!13375))

(declare-fun b!64361 () Bool)

(declare-fun e!42181 () Bool)

(declare-fun e!42182 () Bool)

(assert (=> b!64361 (= e!42181 e!42182)))

(declare-fun res!35113 () Bool)

(declare-fun call!5200 () Bool)

(assert (=> b!64361 (= res!35113 call!5200)))

(assert (=> b!64361 (=> (not res!35113) (not e!42182))))

(declare-fun b!64362 () Bool)

(declare-fun lt!27332 () SeekEntryResult!233)

(assert (=> b!64362 (= e!42181 ((_ is Undefined!233) lt!27332))))

(declare-fun b!64363 () Bool)

(declare-fun res!35108 () Bool)

(declare-fun e!42183 () Bool)

(assert (=> b!64363 (=> (not res!35108) (not e!42183))))

(declare-fun lt!27346 () tuple2!2054)

(assert (=> b!64363 (= res!35108 (valid!272 (_2!1038 lt!27346)))))

(declare-fun bm!5196 () Bool)

(declare-fun call!5202 () Bool)

(assert (=> bm!5196 (= call!5200 call!5202)))

(declare-fun b!64364 () Bool)

(declare-fun res!35109 () Bool)

(declare-fun e!42178 () Bool)

(assert (=> b!64364 (=> (not res!35109) (not e!42178))))

(assert (=> b!64364 (= res!35109 call!5200)))

(declare-fun e!42179 () Bool)

(assert (=> b!64364 (= e!42179 e!42178)))

(declare-fun b!64365 () Bool)

(assert (=> b!64365 (= e!42183 (= (map!1116 (_2!1038 lt!27346)) (+!84 (map!1116 newMap!16) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!5197 () Bool)

(declare-fun call!5201 () SeekEntryResult!233)

(assert (=> bm!5197 (= call!5201 (seekEntryOrOpen!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (_keys!3743 newMap!16) (mask!6023 newMap!16)))))

(declare-fun b!64366 () Bool)

(declare-fun call!5199 () Bool)

(assert (=> b!64366 (= e!42178 (not call!5199))))

(declare-fun b!64368 () Bool)

(declare-fun e!42180 () Unit!1751)

(declare-fun Unit!1769 () Unit!1751)

(assert (=> b!64368 (= e!42180 Unit!1769)))

(declare-fun lt!27322 () Unit!1751)

(declare-fun lemmaArrayContainsKeyThenInListMap!8 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 64) (_ BitVec 32) Int) Unit!1751)

(assert (=> b!64368 (= lt!27322 (lemmaArrayContainsKeyThenInListMap!8 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(assert (=> b!64368 (contains!693 (getCurrentListMap!394 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355))))

(declare-fun lt!27341 () Unit!1751)

(assert (=> b!64368 (= lt!27341 lt!27322)))

(assert (=> b!64368 false))

(declare-fun b!64369 () Bool)

(declare-fun res!35114 () Bool)

(assert (=> b!64369 (= res!35114 call!5202)))

(declare-fun e!42177 () Bool)

(assert (=> b!64369 (=> (not res!35114) (not e!42177))))

(declare-fun b!64370 () Bool)

(assert (=> b!64370 (= e!42182 (not call!5199))))

(declare-fun b!64371 () Bool)

(declare-fun res!35111 () Bool)

(assert (=> b!64371 (=> (not res!35111) (not e!42178))))

(assert (=> b!64371 (= res!35111 (= (select (arr!1792 (_keys!3743 newMap!16)) (index!3058 lt!27332)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!8791 () Bool)

(declare-fun bm!5198 () Bool)

(declare-fun lt!27331 () SeekEntryResult!233)

(declare-fun c!8790 () Bool)

(assert (=> bm!5198 (= call!5202 (inRange!0 (ite c!8790 (index!3059 lt!27331) (ite c!8791 (index!3058 lt!27332) (index!3061 lt!27332))) (mask!6023 newMap!16)))))

(declare-fun b!64372 () Bool)

(declare-fun e!42184 () Unit!1751)

(declare-fun lt!27350 () Unit!1751)

(assert (=> b!64372 (= e!42184 lt!27350)))

(assert (=> b!64372 (= lt!27350 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!18 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)))))

(assert (=> b!64372 (= lt!27332 call!5201)))

(assert (=> b!64372 (= c!8791 ((_ is MissingZero!233) lt!27332))))

(assert (=> b!64372 e!42179))

(declare-fun b!64373 () Bool)

(declare-fun res!35116 () Bool)

(assert (=> b!64373 (= res!35116 (= (select (arr!1792 (_keys!3743 newMap!16)) (index!3061 lt!27332)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64373 (=> (not res!35116) (not e!42182))))

(declare-fun b!64374 () Bool)

(declare-fun Unit!1770 () Unit!1751)

(assert (=> b!64374 (= e!42184 Unit!1770)))

(declare-fun lt!27348 () Unit!1751)

(assert (=> b!64374 (= lt!27348 (lemmaInListMapThenSeekEntryOrOpenFindsIt!18 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)))))

(assert (=> b!64374 (= lt!27331 call!5201)))

(declare-fun res!35115 () Bool)

(assert (=> b!64374 (= res!35115 ((_ is Found!233) lt!27331))))

(assert (=> b!64374 (=> (not res!35115) (not e!42177))))

(assert (=> b!64374 e!42177))

(declare-fun lt!27329 () Unit!1751)

(assert (=> b!64374 (= lt!27329 lt!27348)))

(assert (=> b!64374 false))

(declare-fun b!64375 () Bool)

(assert (=> b!64375 (= e!42177 (= (select (arr!1792 (_keys!3743 newMap!16)) (index!3059 lt!27331)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun bm!5199 () Bool)

(assert (=> bm!5199 (= call!5199 (arrayContainsKey!0 (_keys!3743 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!64367 () Bool)

(declare-fun c!8788 () Bool)

(assert (=> b!64367 (= c!8788 ((_ is MissingVacant!233) lt!27332))))

(assert (=> b!64367 (= e!42179 e!42181)))

(declare-fun d!13377 () Bool)

(assert (=> d!13377 e!42183))

(declare-fun res!35112 () Bool)

(assert (=> d!13377 (=> (not res!35112) (not e!42183))))

(assert (=> d!13377 (= res!35112 (_1!1038 lt!27346))))

(assert (=> d!13377 (= lt!27346 (tuple2!2055 true (LongMapFixedSize!641 (defaultEntry!2108 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (bvadd (_size!369 newMap!16) #b00000000000000000000000000000001) (array!3752 (store (arr!1792 (_keys!3743 newMap!16)) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) (size!2026 (_keys!3743 newMap!16))) (array!3754 (store (arr!1793 (_values!2091 newMap!16)) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (ValueCellFull!866 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2027 (_values!2091 newMap!16))) (_vacant!369 newMap!16))))))

(declare-fun lt!27339 () Unit!1751)

(declare-fun lt!27327 () Unit!1751)

(assert (=> d!13377 (= lt!27339 lt!27327)))

(declare-fun lt!27326 () array!3751)

(declare-fun lt!27343 () array!3753)

(assert (=> d!13377 (contains!693 (getCurrentListMap!394 lt!27326 lt!27343 (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (select (store (arr!1792 (_keys!3743 newMap!16)) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958))))))

(assert (=> d!13377 (= lt!27327 (lemmaValidKeyInArrayIsInListMap!77 lt!27326 lt!27343 (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (defaultEntry!2108 newMap!16)))))

(assert (=> d!13377 (= lt!27343 (array!3754 (store (arr!1793 (_values!2091 newMap!16)) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (ValueCellFull!866 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2027 (_values!2091 newMap!16))))))

(assert (=> d!13377 (= lt!27326 (array!3752 (store (arr!1792 (_keys!3743 newMap!16)) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) (size!2026 (_keys!3743 newMap!16))))))

(declare-fun lt!27325 () Unit!1751)

(declare-fun lt!27328 () Unit!1751)

(assert (=> d!13377 (= lt!27325 lt!27328)))

(declare-fun lt!27333 () array!3751)

(assert (=> d!13377 (= (arrayCountValidKeys!0 lt!27333 (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (bvadd (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!3751 (_ BitVec 32)) Unit!1751)

(assert (=> d!13377 (= lt!27328 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!27333 (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958))))))

(assert (=> d!13377 (= lt!27333 (array!3752 (store (arr!1792 (_keys!3743 newMap!16)) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) (size!2026 (_keys!3743 newMap!16))))))

(declare-fun lt!27345 () Unit!1751)

(declare-fun lt!27334 () Unit!1751)

(assert (=> d!13377 (= lt!27345 lt!27334)))

(declare-fun lt!27330 () array!3751)

(assert (=> d!13377 (arrayContainsKey!0 lt!27330 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!13377 (= lt!27334 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!27330 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958))))))

(assert (=> d!13377 (= lt!27330 (array!3752 (store (arr!1792 (_keys!3743 newMap!16)) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) (size!2026 (_keys!3743 newMap!16))))))

(declare-fun lt!27335 () Unit!1751)

(declare-fun lt!27342 () Unit!1751)

(assert (=> d!13377 (= lt!27335 lt!27342)))

(assert (=> d!13377 (= (+!84 (getCurrentListMap!394 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!394 (array!3752 (store (arr!1792 (_keys!3743 newMap!16)) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) (size!2026 (_keys!3743 newMap!16))) (array!3754 (store (arr!1793 (_values!2091 newMap!16)) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (ValueCellFull!866 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2027 (_values!2091 newMap!16))) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!8 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 32) (_ BitVec 64) V!2873 Int) Unit!1751)

(assert (=> d!13377 (= lt!27342 (lemmaAddValidKeyToArrayThenAddPairToListMap!8 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27323 () Unit!1751)

(declare-fun lt!27321 () Unit!1751)

(assert (=> d!13377 (= lt!27323 lt!27321)))

(assert (=> d!13377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!3752 (store (arr!1792 (_keys!3743 newMap!16)) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) (size!2026 (_keys!3743 newMap!16))) (mask!6023 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!3751 (_ BitVec 32) (_ BitVec 32)) Unit!1751)

(assert (=> d!13377 (= lt!27321 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (_keys!3743 newMap!16) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (mask!6023 newMap!16)))))

(declare-fun lt!27324 () Unit!1751)

(declare-fun lt!27349 () Unit!1751)

(assert (=> d!13377 (= lt!27324 lt!27349)))

(assert (=> d!13377 (= (arrayCountValidKeys!0 (array!3752 (store (arr!1792 (_keys!3743 newMap!16)) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) (size!2026 (_keys!3743 newMap!16))) #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!3743 newMap!16) #b00000000000000000000000000000000 (size!2026 (_keys!3743 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!3751 (_ BitVec 32) (_ BitVec 64)) Unit!1751)

(assert (=> d!13377 (= lt!27349 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3743 newMap!16) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun lt!27344 () Unit!1751)

(declare-fun lt!27337 () Unit!1751)

(assert (=> d!13377 (= lt!27344 lt!27337)))

(declare-fun lt!27340 () List!1450)

(declare-fun lt!27336 () (_ BitVec 32))

(assert (=> d!13377 (arrayNoDuplicates!0 (array!3752 (store (arr!1792 (_keys!3743 newMap!16)) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)) (size!2026 (_keys!3743 newMap!16))) lt!27336 lt!27340)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!3751 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1450) Unit!1751)

(assert (=> d!13377 (= lt!27337 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3743 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958)) lt!27336 lt!27340))))

(assert (=> d!13377 (= lt!27340 Nil!1447)))

(assert (=> d!13377 (= lt!27336 #b00000000000000000000000000000000)))

(declare-fun lt!27347 () Unit!1751)

(assert (=> d!13377 (= lt!27347 e!42180)))

(declare-fun c!8789 () Bool)

(assert (=> d!13377 (= c!8789 (arrayContainsKey!0 (_keys!3743 newMap!16) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!27338 () Unit!1751)

(assert (=> d!13377 (= lt!27338 e!42184)))

(assert (=> d!13377 (= c!8790 (contains!693 (getCurrentListMap!394 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(assert (=> d!13377 (valid!272 newMap!16)))

(assert (=> d!13377 (= (updateHelperNewKey!18 newMap!16 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!8673 (index!3061 lt!26958) (index!3058 lt!26958))) lt!27346)))

(declare-fun b!64376 () Bool)

(declare-fun res!35110 () Bool)

(assert (=> b!64376 (=> (not res!35110) (not e!42183))))

(assert (=> b!64376 (= res!35110 (contains!693 (map!1116 (_2!1038 lt!27346)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355)))))

(declare-fun b!64377 () Bool)

(declare-fun Unit!1771 () Unit!1751)

(assert (=> b!64377 (= e!42180 Unit!1771)))

(assert (= (and d!13377 c!8790) b!64374))

(assert (= (and d!13377 (not c!8790)) b!64372))

(assert (= (and b!64374 res!35115) b!64369))

(assert (= (and b!64369 res!35114) b!64375))

(assert (= (and b!64372 c!8791) b!64364))

(assert (= (and b!64372 (not c!8791)) b!64367))

(assert (= (and b!64364 res!35109) b!64371))

(assert (= (and b!64371 res!35111) b!64366))

(assert (= (and b!64367 c!8788) b!64361))

(assert (= (and b!64367 (not c!8788)) b!64362))

(assert (= (and b!64361 res!35113) b!64373))

(assert (= (and b!64373 res!35116) b!64370))

(assert (= (or b!64364 b!64361) bm!5196))

(assert (= (or b!64366 b!64370) bm!5199))

(assert (= (or b!64369 bm!5196) bm!5198))

(assert (= (or b!64374 b!64372) bm!5197))

(assert (= (and d!13377 c!8789) b!64368))

(assert (= (and d!13377 (not c!8789)) b!64377))

(assert (= (and d!13377 res!35112) b!64363))

(assert (= (and b!64363 res!35108) b!64376))

(assert (= (and b!64376 res!35110) b!64365))

(declare-fun m!58741 () Bool)

(assert (=> b!64363 m!58741))

(assert (=> b!64372 m!57973))

(assert (=> b!64372 m!58123))

(declare-fun m!58743 () Bool)

(assert (=> b!64375 m!58743))

(declare-fun m!58745 () Bool)

(assert (=> b!64371 m!58745))

(declare-fun m!58747 () Bool)

(assert (=> bm!5198 m!58747))

(assert (=> b!64374 m!57973))

(assert (=> b!64374 m!58133))

(assert (=> bm!5199 m!57973))

(assert (=> bm!5199 m!58147))

(assert (=> b!64368 m!57973))

(declare-fun m!58749 () Bool)

(assert (=> b!64368 m!58749))

(assert (=> b!64368 m!58113))

(assert (=> b!64368 m!58113))

(assert (=> b!64368 m!57973))

(declare-fun m!58751 () Bool)

(assert (=> b!64368 m!58751))

(assert (=> d!13377 m!57973))

(declare-fun m!58753 () Bool)

(assert (=> d!13377 m!58753))

(assert (=> d!13377 m!57973))

(declare-fun m!58755 () Bool)

(assert (=> d!13377 m!58755))

(declare-fun m!58757 () Bool)

(assert (=> d!13377 m!58757))

(assert (=> d!13377 m!58197))

(assert (=> d!13377 m!57973))

(declare-fun m!58759 () Bool)

(assert (=> d!13377 m!58759))

(assert (=> d!13377 m!58113))

(assert (=> d!13377 m!57973))

(assert (=> d!13377 m!58147))

(assert (=> d!13377 m!57973))

(declare-fun m!58761 () Bool)

(assert (=> d!13377 m!58761))

(declare-fun m!58763 () Bool)

(assert (=> d!13377 m!58763))

(assert (=> d!13377 m!57973))

(declare-fun m!58765 () Bool)

(assert (=> d!13377 m!58765))

(assert (=> d!13377 m!57963))

(declare-fun m!58767 () Bool)

(assert (=> d!13377 m!58767))

(assert (=> d!13377 m!57973))

(assert (=> d!13377 m!57985))

(declare-fun m!58769 () Bool)

(assert (=> d!13377 m!58769))

(declare-fun m!58771 () Bool)

(assert (=> d!13377 m!58771))

(declare-fun m!58773 () Bool)

(assert (=> d!13377 m!58773))

(assert (=> d!13377 m!58113))

(assert (=> d!13377 m!58625))

(declare-fun m!58775 () Bool)

(assert (=> d!13377 m!58775))

(declare-fun m!58777 () Bool)

(assert (=> d!13377 m!58777))

(declare-fun m!58779 () Bool)

(assert (=> d!13377 m!58779))

(assert (=> d!13377 m!58779))

(assert (=> d!13377 m!58767))

(declare-fun m!58781 () Bool)

(assert (=> d!13377 m!58781))

(declare-fun m!58783 () Bool)

(assert (=> d!13377 m!58783))

(declare-fun m!58785 () Bool)

(assert (=> d!13377 m!58785))

(declare-fun m!58787 () Bool)

(assert (=> d!13377 m!58787))

(assert (=> d!13377 m!58113))

(assert (=> d!13377 m!57973))

(assert (=> d!13377 m!58751))

(declare-fun m!58789 () Bool)

(assert (=> b!64376 m!58789))

(assert (=> b!64376 m!58789))

(assert (=> b!64376 m!57973))

(declare-fun m!58791 () Bool)

(assert (=> b!64376 m!58791))

(assert (=> b!64365 m!58789))

(assert (=> b!64365 m!57991))

(assert (=> b!64365 m!57991))

(declare-fun m!58793 () Bool)

(assert (=> b!64365 m!58793))

(assert (=> bm!5197 m!57973))

(assert (=> bm!5197 m!58109))

(declare-fun m!58795 () Bool)

(assert (=> b!64373 m!58795))

(assert (=> bm!5101 d!13377))

(declare-fun d!13379 () Bool)

(declare-fun e!42185 () Bool)

(assert (=> d!13379 e!42185))

(declare-fun res!35118 () Bool)

(assert (=> d!13379 (=> (not res!35118) (not e!42185))))

(declare-fun lt!27352 () ListLongMap!1365)

(assert (=> d!13379 (= res!35118 (contains!693 lt!27352 (_1!1039 (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!27354 () List!1451)

(assert (=> d!13379 (= lt!27352 (ListLongMap!1366 lt!27354))))

(declare-fun lt!27353 () Unit!1751)

(declare-fun lt!27351 () Unit!1751)

(assert (=> d!13379 (= lt!27353 lt!27351)))

(assert (=> d!13379 (= (getValueByKey!125 lt!27354 (_1!1039 (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!130 (_2!1039 (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13379 (= lt!27351 (lemmaContainsTupThenGetReturnValue!45 lt!27354 (_1!1039 (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1039 (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13379 (= lt!27354 (insertStrictlySorted!48 (toList!698 call!5116) (_1!1039 (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1039 (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13379 (= (+!84 call!5116 (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!27352)))

(declare-fun b!64378 () Bool)

(declare-fun res!35117 () Bool)

(assert (=> b!64378 (=> (not res!35117) (not e!42185))))

(assert (=> b!64378 (= res!35117 (= (getValueByKey!125 (toList!698 lt!27352) (_1!1039 (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!130 (_2!1039 (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!64379 () Bool)

(assert (=> b!64379 (= e!42185 (contains!695 (toList!698 lt!27352) (tuple2!2057 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) from!355) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!13379 res!35118) b!64378))

(assert (= (and b!64378 res!35117) b!64379))

(declare-fun m!58797 () Bool)

(assert (=> d!13379 m!58797))

(declare-fun m!58799 () Bool)

(assert (=> d!13379 m!58799))

(declare-fun m!58801 () Bool)

(assert (=> d!13379 m!58801))

(declare-fun m!58803 () Bool)

(assert (=> d!13379 m!58803))

(declare-fun m!58805 () Bool)

(assert (=> b!64378 m!58805))

(declare-fun m!58807 () Bool)

(assert (=> b!64379 m!58807))

(assert (=> b!63889 d!13379))

(declare-fun d!13381 () Bool)

(assert (=> d!13381 (arrayContainsKey!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) lt!26985 #b00000000000000000000000000000000)))

(declare-fun lt!27357 () Unit!1751)

(declare-fun choose!13 (array!3751 (_ BitVec 64) (_ BitVec 32)) Unit!1751)

(assert (=> d!13381 (= lt!27357 (choose!13 (_keys!3743 (v!2428 (underlying!232 thiss!992))) lt!26985 #b00000000000000000000000000000000))))

(assert (=> d!13381 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!13381 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) lt!26985 #b00000000000000000000000000000000) lt!27357)))

(declare-fun bs!2796 () Bool)

(assert (= bs!2796 d!13381))

(assert (=> bs!2796 m!58173))

(declare-fun m!58809 () Bool)

(assert (=> bs!2796 m!58809))

(assert (=> b!63931 d!13381))

(declare-fun d!13383 () Bool)

(declare-fun res!35119 () Bool)

(declare-fun e!42186 () Bool)

(assert (=> d!13383 (=> res!35119 e!42186)))

(assert (=> d!13383 (= res!35119 (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b00000000000000000000000000000000) lt!26985))))

(assert (=> d!13383 (= (arrayContainsKey!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) lt!26985 #b00000000000000000000000000000000) e!42186)))

(declare-fun b!64380 () Bool)

(declare-fun e!42187 () Bool)

(assert (=> b!64380 (= e!42186 e!42187)))

(declare-fun res!35120 () Bool)

(assert (=> b!64380 (=> (not res!35120) (not e!42187))))

(assert (=> b!64380 (= res!35120 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))))

(declare-fun b!64381 () Bool)

(assert (=> b!64381 (= e!42187 (arrayContainsKey!0 (_keys!3743 (v!2428 (underlying!232 thiss!992))) lt!26985 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!13383 (not res!35119)) b!64380))

(assert (= (and b!64380 res!35120) b!64381))

(assert (=> d!13383 m!58165))

(declare-fun m!58811 () Bool)

(assert (=> b!64381 m!58811))

(assert (=> b!63931 d!13383))

(declare-fun b!64382 () Bool)

(declare-fun c!8793 () Bool)

(declare-fun lt!27360 () (_ BitVec 64))

(assert (=> b!64382 (= c!8793 (= lt!27360 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42188 () SeekEntryResult!233)

(declare-fun e!42190 () SeekEntryResult!233)

(assert (=> b!64382 (= e!42188 e!42190)))

(declare-fun b!64383 () Bool)

(declare-fun e!42189 () SeekEntryResult!233)

(assert (=> b!64383 (= e!42189 Undefined!233)))

(declare-fun b!64384 () Bool)

(declare-fun lt!27358 () SeekEntryResult!233)

(assert (=> b!64384 (= e!42190 (MissingZero!233 (index!3060 lt!27358)))))

(declare-fun b!64385 () Bool)

(assert (=> b!64385 (= e!42189 e!42188)))

(assert (=> b!64385 (= lt!27360 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (index!3060 lt!27358)))))

(declare-fun c!8792 () Bool)

(assert (=> b!64385 (= c!8792 (= lt!27360 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!64386 () Bool)

(assert (=> b!64386 (= e!42190 (seekKeyOrZeroReturnVacant!0 (x!10454 lt!27358) (index!3060 lt!27358) (index!3060 lt!27358) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b00000000000000000000000000000000) (_keys!3743 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992)))))))

(declare-fun b!64387 () Bool)

(assert (=> b!64387 (= e!42188 (Found!233 (index!3060 lt!27358)))))

(declare-fun d!13385 () Bool)

(declare-fun lt!27359 () SeekEntryResult!233)

(assert (=> d!13385 (and (or ((_ is Undefined!233) lt!27359) (not ((_ is Found!233) lt!27359)) (and (bvsge (index!3059 lt!27359) #b00000000000000000000000000000000) (bvslt (index!3059 lt!27359) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))) (or ((_ is Undefined!233) lt!27359) ((_ is Found!233) lt!27359) (not ((_ is MissingZero!233) lt!27359)) (and (bvsge (index!3058 lt!27359) #b00000000000000000000000000000000) (bvslt (index!3058 lt!27359) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))) (or ((_ is Undefined!233) lt!27359) ((_ is Found!233) lt!27359) ((_ is MissingZero!233) lt!27359) (not ((_ is MissingVacant!233) lt!27359)) (and (bvsge (index!3061 lt!27359) #b00000000000000000000000000000000) (bvslt (index!3061 lt!27359) (size!2026 (_keys!3743 (v!2428 (underlying!232 thiss!992))))))) (or ((_ is Undefined!233) lt!27359) (ite ((_ is Found!233) lt!27359) (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (index!3059 lt!27359)) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!233) lt!27359) (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (index!3058 lt!27359)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!233) lt!27359) (= (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) (index!3061 lt!27359)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13385 (= lt!27359 e!42189)))

(declare-fun c!8794 () Bool)

(assert (=> d!13385 (= c!8794 (and ((_ is Intermediate!233) lt!27358) (undefined!1045 lt!27358)))))

(assert (=> d!13385 (= lt!27358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b00000000000000000000000000000000) (mask!6023 (v!2428 (underlying!232 thiss!992)))) (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b00000000000000000000000000000000) (_keys!3743 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992)))))))

(assert (=> d!13385 (validMask!0 (mask!6023 (v!2428 (underlying!232 thiss!992))))))

(assert (=> d!13385 (= (seekEntryOrOpen!0 (select (arr!1792 (_keys!3743 (v!2428 (underlying!232 thiss!992)))) #b00000000000000000000000000000000) (_keys!3743 (v!2428 (underlying!232 thiss!992))) (mask!6023 (v!2428 (underlying!232 thiss!992)))) lt!27359)))

(assert (= (and d!13385 c!8794) b!64383))

(assert (= (and d!13385 (not c!8794)) b!64385))

(assert (= (and b!64385 c!8792) b!64387))

(assert (= (and b!64385 (not c!8792)) b!64382))

(assert (= (and b!64382 c!8793) b!64384))

(assert (= (and b!64382 (not c!8793)) b!64386))

(declare-fun m!58813 () Bool)

(assert (=> b!64385 m!58813))

(assert (=> b!64386 m!58165))

(declare-fun m!58815 () Bool)

(assert (=> b!64386 m!58815))

(declare-fun m!58817 () Bool)

(assert (=> d!13385 m!58817))

(assert (=> d!13385 m!57959))

(declare-fun m!58819 () Bool)

(assert (=> d!13385 m!58819))

(declare-fun m!58821 () Bool)

(assert (=> d!13385 m!58821))

(declare-fun m!58823 () Bool)

(assert (=> d!13385 m!58823))

(assert (=> d!13385 m!58165))

(declare-fun m!58825 () Bool)

(assert (=> d!13385 m!58825))

(assert (=> d!13385 m!58165))

(assert (=> d!13385 m!58823))

(assert (=> b!63931 d!13385))

(declare-fun d!13387 () Bool)

(declare-fun e!42191 () Bool)

(assert (=> d!13387 e!42191))

(declare-fun res!35122 () Bool)

(assert (=> d!13387 (=> (not res!35122) (not e!42191))))

(declare-fun lt!27362 () ListLongMap!1365)

(assert (=> d!13387 (= res!35122 (contains!693 lt!27362 (_1!1039 (ite (or c!8707 c!8704) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992))))))))))

(declare-fun lt!27364 () List!1451)

(assert (=> d!13387 (= lt!27362 (ListLongMap!1366 lt!27364))))

(declare-fun lt!27363 () Unit!1751)

(declare-fun lt!27361 () Unit!1751)

(assert (=> d!13387 (= lt!27363 lt!27361)))

(assert (=> d!13387 (= (getValueByKey!125 lt!27364 (_1!1039 (ite (or c!8707 c!8704) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992))))))) (Some!130 (_2!1039 (ite (or c!8707 c!8704) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992))))))))))

(assert (=> d!13387 (= lt!27361 (lemmaContainsTupThenGetReturnValue!45 lt!27364 (_1!1039 (ite (or c!8707 c!8704) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))) (_2!1039 (ite (or c!8707 c!8704) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992))))))))))

(assert (=> d!13387 (= lt!27364 (insertStrictlySorted!48 (toList!698 (ite c!8707 call!5149 (ite c!8704 call!5147 call!5151))) (_1!1039 (ite (or c!8707 c!8704) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))) (_2!1039 (ite (or c!8707 c!8704) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992))))))))))

(assert (=> d!13387 (= (+!84 (ite c!8707 call!5149 (ite c!8704 call!5147 call!5151)) (ite (or c!8707 c!8704) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))) lt!27362)))

(declare-fun b!64388 () Bool)

(declare-fun res!35121 () Bool)

(assert (=> b!64388 (=> (not res!35121) (not e!42191))))

(assert (=> b!64388 (= res!35121 (= (getValueByKey!125 (toList!698 lt!27362) (_1!1039 (ite (or c!8707 c!8704) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992))))))) (Some!130 (_2!1039 (ite (or c!8707 c!8704) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))))))

(declare-fun b!64389 () Bool)

(assert (=> b!64389 (= e!42191 (contains!695 (toList!698 lt!27362) (ite (or c!8707 c!8704) (tuple2!2057 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2428 (underlying!232 thiss!992)))) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2428 (underlying!232 thiss!992)))))))))

(assert (= (and d!13387 res!35122) b!64388))

(assert (= (and b!64388 res!35121) b!64389))

(declare-fun m!58827 () Bool)

(assert (=> d!13387 m!58827))

(declare-fun m!58829 () Bool)

(assert (=> d!13387 m!58829))

(declare-fun m!58831 () Bool)

(assert (=> d!13387 m!58831))

(declare-fun m!58833 () Bool)

(assert (=> d!13387 m!58833))

(declare-fun m!58835 () Bool)

(assert (=> b!64388 m!58835))

(declare-fun m!58837 () Bool)

(assert (=> b!64389 m!58837))

(assert (=> bm!5150 d!13387))

(declare-fun d!13389 () Bool)

(assert (=> d!13389 (= (inRange!0 (ite c!8674 (ite c!8670 (index!3059 lt!26974) (ite c!8669 (index!3058 lt!26969) (index!3061 lt!26969))) (ite c!8677 (index!3059 lt!26975) (ite c!8664 (index!3058 lt!26953) (index!3061 lt!26953)))) (mask!6023 newMap!16)) (and (bvsge (ite c!8674 (ite c!8670 (index!3059 lt!26974) (ite c!8669 (index!3058 lt!26969) (index!3061 lt!26969))) (ite c!8677 (index!3059 lt!26975) (ite c!8664 (index!3058 lt!26953) (index!3061 lt!26953)))) #b00000000000000000000000000000000) (bvslt (ite c!8674 (ite c!8670 (index!3059 lt!26974) (ite c!8669 (index!3058 lt!26969) (index!3061 lt!26969))) (ite c!8677 (index!3059 lt!26975) (ite c!8664 (index!3058 lt!26953) (index!3061 lt!26953)))) (bvadd (mask!6023 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!5103 d!13389))

(declare-fun d!13391 () Bool)

(assert (=> d!13391 (= (apply!69 lt!27042 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1098 (getValueByKey!125 (toList!698 lt!27042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2797 () Bool)

(assert (= bs!2797 d!13391))

(assert (=> bs!2797 m!58595))

(assert (=> bs!2797 m!58595))

(declare-fun m!58839 () Bool)

(assert (=> bs!2797 m!58839))

(assert (=> b!64019 d!13391))

(declare-fun d!13393 () Bool)

(assert (=> d!13393 (= (get!1097 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!63921 d!13393))

(declare-fun d!13395 () Bool)

(assert (=> d!13395 (= (+!84 (getCurrentListMap!394 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (tuple2!2057 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!394 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) lt!26952 (zeroValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27367 () Unit!1751)

(declare-fun choose!359 (array!3751 array!3753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 V!2873 Int) Unit!1751)

(assert (=> d!13395 (= lt!27367 (choose!359 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) lt!26952 (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2108 newMap!16)))))

(assert (=> d!13395 (validMask!0 (mask!6023 newMap!16))))

(assert (=> d!13395 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!18 (_keys!3743 newMap!16) (_values!2091 newMap!16) (mask!6023 newMap!16) (extraKeys!1983 newMap!16) lt!26952 (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (get!1095 (select (arr!1793 (_values!2091 (v!2428 (underlying!232 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2108 newMap!16)) lt!27367)))

(declare-fun bs!2798 () Bool)

(assert (= bs!2798 d!13395))

(assert (=> bs!2798 m!57985))

(declare-fun m!58841 () Bool)

(assert (=> bs!2798 m!58841))

(assert (=> bs!2798 m!57985))

(declare-fun m!58843 () Bool)

(assert (=> bs!2798 m!58843))

(assert (=> bs!2798 m!58113))

(assert (=> bs!2798 m!58327))

(assert (=> bs!2798 m!58113))

(declare-fun m!58845 () Bool)

(assert (=> bs!2798 m!58845))

(assert (=> b!63907 d!13395))

(declare-fun mapIsEmpty!2981 () Bool)

(declare-fun mapRes!2981 () Bool)

(assert (=> mapIsEmpty!2981 mapRes!2981))

(declare-fun condMapEmpty!2981 () Bool)

(declare-fun mapDefault!2981 () ValueCell!866)

(assert (=> mapNonEmpty!2980 (= condMapEmpty!2981 (= mapRest!2980 ((as const (Array (_ BitVec 32) ValueCell!866)) mapDefault!2981)))))

(declare-fun e!42192 () Bool)

(assert (=> mapNonEmpty!2980 (= tp!8182 (and e!42192 mapRes!2981))))

(declare-fun b!64390 () Bool)

(declare-fun e!42193 () Bool)

(assert (=> b!64390 (= e!42193 tp_is_empty!2419)))

(declare-fun mapNonEmpty!2981 () Bool)

(declare-fun tp!8183 () Bool)

(assert (=> mapNonEmpty!2981 (= mapRes!2981 (and tp!8183 e!42193))))

(declare-fun mapValue!2981 () ValueCell!866)

(declare-fun mapKey!2981 () (_ BitVec 32))

(declare-fun mapRest!2981 () (Array (_ BitVec 32) ValueCell!866))

(assert (=> mapNonEmpty!2981 (= mapRest!2980 (store mapRest!2981 mapKey!2981 mapValue!2981))))

(declare-fun b!64391 () Bool)

(assert (=> b!64391 (= e!42192 tp_is_empty!2419)))

(assert (= (and mapNonEmpty!2980 condMapEmpty!2981) mapIsEmpty!2981))

(assert (= (and mapNonEmpty!2980 (not condMapEmpty!2981)) mapNonEmpty!2981))

(assert (= (and mapNonEmpty!2981 ((_ is ValueCellFull!866) mapValue!2981)) b!64390))

(assert (= (and mapNonEmpty!2980 ((_ is ValueCellFull!866) mapDefault!2981)) b!64391))

(declare-fun m!58847 () Bool)

(assert (=> mapNonEmpty!2981 m!58847))

(declare-fun mapIsEmpty!2982 () Bool)

(declare-fun mapRes!2982 () Bool)

(assert (=> mapIsEmpty!2982 mapRes!2982))

(declare-fun condMapEmpty!2982 () Bool)

(declare-fun mapDefault!2982 () ValueCell!866)

(assert (=> mapNonEmpty!2979 (= condMapEmpty!2982 (= mapRest!2979 ((as const (Array (_ BitVec 32) ValueCell!866)) mapDefault!2982)))))

(declare-fun e!42194 () Bool)

(assert (=> mapNonEmpty!2979 (= tp!8181 (and e!42194 mapRes!2982))))

(declare-fun b!64392 () Bool)

(declare-fun e!42195 () Bool)

(assert (=> b!64392 (= e!42195 tp_is_empty!2419)))

(declare-fun mapNonEmpty!2982 () Bool)

(declare-fun tp!8184 () Bool)

(assert (=> mapNonEmpty!2982 (= mapRes!2982 (and tp!8184 e!42195))))

(declare-fun mapKey!2982 () (_ BitVec 32))

(declare-fun mapRest!2982 () (Array (_ BitVec 32) ValueCell!866))

(declare-fun mapValue!2982 () ValueCell!866)

(assert (=> mapNonEmpty!2982 (= mapRest!2979 (store mapRest!2982 mapKey!2982 mapValue!2982))))

(declare-fun b!64393 () Bool)

(assert (=> b!64393 (= e!42194 tp_is_empty!2419)))

(assert (= (and mapNonEmpty!2979 condMapEmpty!2982) mapIsEmpty!2982))

(assert (= (and mapNonEmpty!2979 (not condMapEmpty!2982)) mapNonEmpty!2982))

(assert (= (and mapNonEmpty!2982 ((_ is ValueCellFull!866) mapValue!2982)) b!64392))

(assert (= (and mapNonEmpty!2979 ((_ is ValueCellFull!866) mapDefault!2982)) b!64393))

(declare-fun m!58849 () Bool)

(assert (=> mapNonEmpty!2982 m!58849))

(declare-fun b_lambda!2877 () Bool)

(assert (= b_lambda!2867 (or (and b!63640 b_free!2005) (and b!63641 b_free!2007 (= (defaultEntry!2108 newMap!16) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))))) b_lambda!2877)))

(declare-fun b_lambda!2879 () Bool)

(assert (= b_lambda!2873 (or (and b!63640 b_free!2005 (= (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) (defaultEntry!2108 newMap!16))) (and b!63641 b_free!2007) b_lambda!2879)))

(declare-fun b_lambda!2881 () Bool)

(assert (= b_lambda!2875 (or (and b!63640 b_free!2005 (= (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) (defaultEntry!2108 newMap!16))) (and b!63641 b_free!2007) b_lambda!2881)))

(declare-fun b_lambda!2883 () Bool)

(assert (= b_lambda!2869 (or (and b!63640 b_free!2005) (and b!63641 b_free!2007 (= (defaultEntry!2108 newMap!16) (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))))) b_lambda!2883)))

(declare-fun b_lambda!2885 () Bool)

(assert (= b_lambda!2871 (or (and b!63640 b_free!2005 (= (defaultEntry!2108 (v!2428 (underlying!232 thiss!992))) (defaultEntry!2108 newMap!16))) (and b!63641 b_free!2007) b_lambda!2885)))

(check-sat (not b!64190) (not d!13387) (not d!13319) (not d!13283) (not b!64194) (not bm!5186) (not b!64286) (not d!13259) tp_is_empty!2419 (not b!64154) (not b_next!2007) (not b!64386) (not b!64177) (not b!64246) (not b!64230) (not d!13305) (not d!13297) (not b!64205) (not b!64089) (not bm!5198) (not b!64374) (not bm!5154) (not bm!5185) (not b!64293) (not b!64219) (not b_lambda!2861) (not b!64372) (not d!13351) (not b!64085) (not b!64163) (not b!64301) (not bm!5159) (not b!64093) (not d!13295) (not bm!5173) (not b!64152) (not bm!5168) (not b!64128) (not b!64297) (not b!64317) (not b!64181) (not b!64368) (not b!64077) (not d!13291) (not d!13355) (not mapNonEmpty!2981) (not b_lambda!2883) (not b!64323) (not b!64074) b_and!3935 (not b!64243) (not d!13315) (not b!64099) (not b!64255) (not b!64241) (not d!13285) (not b!64161) (not b!64076) (not d!13275) (not b!64173) (not d!13313) (not d!13261) (not b!64211) (not d!13341) (not b_lambda!2879) (not d!13379) (not b!64158) (not d!13303) (not b!64086) (not d!13323) (not bm!5160) (not b!64164) (not d!13301) (not d!13273) (not bm!5178) (not d!13353) (not d!13391) (not bm!5187) (not b_next!2005) (not b!64091) (not b!64188) (not mapNonEmpty!2982) (not d!13293) (not b!64213) (not b!64218) (not d!13337) (not d!13309) (not b!64151) (not b!64094) (not bm!5197) (not b!64180) (not d!13327) (not bm!5157) (not b!64389) (not b!64245) (not b!64202) (not d!13339) (not b!64069) (not d!13363) (not d!13395) (not b!64126) (not b!64227) (not bm!5161) (not b!64162) (not d!13367) (not bm!5153) (not b!64067) (not d!13289) (not d!13267) (not b!64363) (not b!64216) (not b!64324) (not b!64307) (not b!64078) (not b!64110) (not b_lambda!2885) (not b!64381) (not d!13317) (not bm!5171) (not b!64145) (not b!64112) (not b!64106) (not b!64156) (not d!13329) (not bm!5179) (not b!64376) (not b!64299) (not b!64072) (not d!13385) (not d!13349) (not d!13361) (not bm!5164) (not d!13299) (not b_lambda!2881) (not b!64107) (not b!64248) (not b!64294) (not bm!5167) (not b!64191) (not bm!5180) (not bm!5172) (not b!64116) (not b!64114) (not b!64095) (not b!64365) (not b!64199) (not b!64179) (not d!13263) (not bm!5199) (not b!64207) (not b!64224) (not b!64388) (not b!64206) b_and!3933 (not d!13343) (not b!64160) (not b!64302) (not b!64318) (not d!13377) (not b!64320) (not b!64215) (not b!64155) (not b!64379) (not b!64221) (not d!13331) (not d!13371) (not b!64322) (not d!13373) (not b!64120) (not bm!5183) (not d!13345) (not b!64303) (not b!64208) (not d!13335) (not d!13281) (not b!64249) (not b!64193) (not b!64189) (not b!64209) (not b!64250) (not b!64068) (not d!13307) (not bm!5166) (not b!64378) (not d!13381) (not d!13311) (not b_lambda!2865) (not b_lambda!2877) (not b!64115) (not b!64201))
(check-sat b_and!3933 b_and!3935 (not b_next!2005) (not b_next!2007))
