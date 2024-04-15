; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9216 () Bool)

(assert start!9216)

(declare-fun b!65460 () Bool)

(declare-fun b_free!2041 () Bool)

(declare-fun b_next!2041 () Bool)

(assert (=> b!65460 (= b_free!2041 (not b_next!2041))))

(declare-fun tp!8272 () Bool)

(declare-fun b_and!4009 () Bool)

(assert (=> b!65460 (= tp!8272 b_and!4009)))

(declare-fun b!65468 () Bool)

(declare-fun b_free!2043 () Bool)

(declare-fun b_next!2043 () Bool)

(assert (=> b!65468 (= b_free!2043 (not b_next!2043))))

(declare-fun tp!8273 () Bool)

(declare-fun b_and!4011 () Bool)

(assert (=> b!65468 (= tp!8273 b_and!4011)))

(declare-fun b!65454 () Bool)

(declare-fun res!35592 () Bool)

(declare-fun e!42890 () Bool)

(assert (=> b!65454 (=> (not res!35592) (not e!42890))))

(declare-datatypes ((V!2897 0))(
  ( (V!2898 (val!1263 Int)) )
))
(declare-datatypes ((array!3791 0))(
  ( (array!3792 (arr!1810 (Array (_ BitVec 32) (_ BitVec 64))) (size!2046 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!875 0))(
  ( (ValueCellFull!875 (v!2456 V!2897)) (EmptyCell!875) )
))
(declare-datatypes ((array!3793 0))(
  ( (array!3794 (arr!1811 (Array (_ BitVec 32) ValueCell!875)) (size!2047 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!658 0))(
  ( (LongMapFixedSize!659 (defaultEntry!2137 Int) (mask!6066 (_ BitVec 32)) (extraKeys!2008 (_ BitVec 32)) (zeroValue!2045 V!2897) (minValue!2045 V!2897) (_size!378 (_ BitVec 32)) (_keys!3776 array!3791) (_values!2120 array!3793) (_vacant!378 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!658)

(declare-datatypes ((Cell!458 0))(
  ( (Cell!459 (v!2457 LongMapFixedSize!658)) )
))
(declare-datatypes ((LongMap!458 0))(
  ( (LongMap!459 (underlying!240 Cell!458)) )
))
(declare-fun thiss!992 () LongMap!458)

(assert (=> b!65454 (= res!35592 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6066 newMap!16)) (_size!378 (v!2457 (underlying!240 thiss!992)))))))

(declare-fun b!65455 () Bool)

(declare-fun e!42902 () Bool)

(declare-fun e!42899 () Bool)

(assert (=> b!65455 (= e!42902 e!42899)))

(declare-fun res!35591 () Bool)

(assert (=> b!65455 (=> (not res!35591) (not e!42899))))

(declare-datatypes ((tuple2!2072 0))(
  ( (tuple2!2073 (_1!1047 Bool) (_2!1047 LongMapFixedSize!658)) )
))
(declare-fun lt!28002 () tuple2!2072)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!65455 (= res!35591 (and (_1!1047 lt!28002) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!1802 0))(
  ( (Unit!1803) )
))
(declare-fun lt!27995 () Unit!1802)

(declare-fun e!42901 () Unit!1802)

(assert (=> b!65455 (= lt!27995 e!42901)))

(declare-datatypes ((tuple2!2074 0))(
  ( (tuple2!2075 (_1!1048 (_ BitVec 64)) (_2!1048 V!2897)) )
))
(declare-datatypes ((List!1461 0))(
  ( (Nil!1458) (Cons!1457 (h!2041 tuple2!2074) (t!4910 List!1461)) )
))
(declare-datatypes ((ListLongMap!1375 0))(
  ( (ListLongMap!1376 (toList!703 List!1461)) )
))
(declare-fun lt!28001 () ListLongMap!1375)

(declare-fun c!8979 () Bool)

(declare-fun contains!701 (ListLongMap!1375 (_ BitVec 64)) Bool)

(assert (=> b!65455 (= c!8979 (contains!701 lt!28001 (select (arr!1810 (_keys!3776 (v!2457 (underlying!240 thiss!992)))) from!355)))))

(declare-fun update!93 (LongMapFixedSize!658 (_ BitVec 64) V!2897) tuple2!2072)

(declare-fun get!1111 (ValueCell!875 V!2897) V!2897)

(declare-fun dynLambda!317 (Int (_ BitVec 64)) V!2897)

(assert (=> b!65455 (= lt!28002 (update!93 newMap!16 (select (arr!1810 (_keys!3776 (v!2457 (underlying!240 thiss!992)))) from!355) (get!1111 (select (arr!1811 (_values!2120 (v!2457 (underlying!240 thiss!992)))) from!355) (dynLambda!317 (defaultEntry!2137 (v!2457 (underlying!240 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!65456 () Bool)

(declare-fun Unit!1804 () Unit!1802)

(assert (=> b!65456 (= e!42901 Unit!1804)))

(declare-fun lt!27997 () Unit!1802)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!40 (array!3791 array!3793 (_ BitVec 32) (_ BitVec 32) V!2897 V!2897 (_ BitVec 64) (_ BitVec 32) Int) Unit!1802)

(assert (=> b!65456 (= lt!27997 (lemmaListMapContainsThenArrayContainsFrom!40 (_keys!3776 (v!2457 (underlying!240 thiss!992))) (_values!2120 (v!2457 (underlying!240 thiss!992))) (mask!6066 (v!2457 (underlying!240 thiss!992))) (extraKeys!2008 (v!2457 (underlying!240 thiss!992))) (zeroValue!2045 (v!2457 (underlying!240 thiss!992))) (minValue!2045 (v!2457 (underlying!240 thiss!992))) (select (arr!1810 (_keys!3776 (v!2457 (underlying!240 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2137 (v!2457 (underlying!240 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!65456 (arrayContainsKey!0 (_keys!3776 (v!2457 (underlying!240 thiss!992))) (select (arr!1810 (_keys!3776 (v!2457 (underlying!240 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!28000 () Unit!1802)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3791 (_ BitVec 32) (_ BitVec 32)) Unit!1802)

(assert (=> b!65456 (= lt!28000 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3776 (v!2457 (underlying!240 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1462 0))(
  ( (Nil!1459) (Cons!1458 (h!2042 (_ BitVec 64)) (t!4911 List!1462)) )
))
(declare-fun arrayNoDuplicates!0 (array!3791 (_ BitVec 32) List!1462) Bool)

(assert (=> b!65456 (arrayNoDuplicates!0 (_keys!3776 (v!2457 (underlying!240 thiss!992))) from!355 Nil!1459)))

(declare-fun lt!27996 () Unit!1802)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3791 (_ BitVec 32) (_ BitVec 64) List!1462) Unit!1802)

(assert (=> b!65456 (= lt!27996 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3776 (v!2457 (underlying!240 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1810 (_keys!3776 (v!2457 (underlying!240 thiss!992)))) from!355) (Cons!1458 (select (arr!1810 (_keys!3776 (v!2457 (underlying!240 thiss!992)))) from!355) Nil!1459)))))

(assert (=> b!65456 false))

(declare-fun b!65457 () Bool)

(declare-fun Unit!1805 () Unit!1802)

(assert (=> b!65457 (= e!42901 Unit!1805)))

(declare-fun mapIsEmpty!3029 () Bool)

(declare-fun mapRes!3030 () Bool)

(assert (=> mapIsEmpty!3029 mapRes!3030))

(declare-fun mapIsEmpty!3030 () Bool)

(declare-fun mapRes!3029 () Bool)

(assert (=> mapIsEmpty!3030 mapRes!3029))

(declare-fun b!65459 () Bool)

(declare-fun e!42897 () Bool)

(declare-fun e!42896 () Bool)

(assert (=> b!65459 (= e!42897 (and e!42896 mapRes!3029))))

(declare-fun condMapEmpty!3030 () Bool)

(declare-fun mapDefault!3030 () ValueCell!875)

(assert (=> b!65459 (= condMapEmpty!3030 (= (arr!1811 (_values!2120 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!875)) mapDefault!3030)))))

(declare-fun e!42888 () Bool)

(declare-fun e!42887 () Bool)

(declare-fun tp_is_empty!2437 () Bool)

(declare-fun array_inv!1129 (array!3791) Bool)

(declare-fun array_inv!1130 (array!3793) Bool)

(assert (=> b!65460 (= e!42888 (and tp!8272 tp_is_empty!2437 (array_inv!1129 (_keys!3776 (v!2457 (underlying!240 thiss!992)))) (array_inv!1130 (_values!2120 (v!2457 (underlying!240 thiss!992)))) e!42887))))

(declare-fun mapNonEmpty!3029 () Bool)

(declare-fun tp!8271 () Bool)

(declare-fun e!42894 () Bool)

(assert (=> mapNonEmpty!3029 (= mapRes!3029 (and tp!8271 e!42894))))

(declare-fun mapKey!3030 () (_ BitVec 32))

(declare-fun mapValue!3030 () ValueCell!875)

(declare-fun mapRest!3030 () (Array (_ BitVec 32) ValueCell!875))

(assert (=> mapNonEmpty!3029 (= (arr!1811 (_values!2120 newMap!16)) (store mapRest!3030 mapKey!3030 mapValue!3030))))

(declare-fun b!65461 () Bool)

(assert (=> b!65461 (= e!42894 tp_is_empty!2437)))

(declare-fun b!65462 () Bool)

(declare-fun e!42891 () Bool)

(assert (=> b!65462 (= e!42891 tp_is_empty!2437)))

(declare-fun b!65463 () Bool)

(declare-fun e!42898 () Bool)

(declare-fun e!42893 () Bool)

(assert (=> b!65463 (= e!42898 e!42893)))

(declare-fun b!65464 () Bool)

(assert (=> b!65464 (= e!42899 false)))

(declare-fun lt!27999 () ListLongMap!1375)

(declare-fun getCurrentListMapNoExtraKeys!49 (array!3791 array!3793 (_ BitVec 32) (_ BitVec 32) V!2897 V!2897 (_ BitVec 32) Int) ListLongMap!1375)

(assert (=> b!65464 (= lt!27999 (getCurrentListMapNoExtraKeys!49 (_keys!3776 (v!2457 (underlying!240 thiss!992))) (_values!2120 (v!2457 (underlying!240 thiss!992))) (mask!6066 (v!2457 (underlying!240 thiss!992))) (extraKeys!2008 (v!2457 (underlying!240 thiss!992))) (zeroValue!2045 (v!2457 (underlying!240 thiss!992))) (minValue!2045 (v!2457 (underlying!240 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2137 (v!2457 (underlying!240 thiss!992)))))))

(declare-fun mapNonEmpty!3030 () Bool)

(declare-fun tp!8274 () Bool)

(assert (=> mapNonEmpty!3030 (= mapRes!3030 (and tp!8274 e!42891))))

(declare-fun mapRest!3029 () (Array (_ BitVec 32) ValueCell!875))

(declare-fun mapValue!3029 () ValueCell!875)

(declare-fun mapKey!3029 () (_ BitVec 32))

(assert (=> mapNonEmpty!3030 (= (arr!1811 (_values!2120 (v!2457 (underlying!240 thiss!992)))) (store mapRest!3029 mapKey!3029 mapValue!3029))))

(declare-fun b!65465 () Bool)

(declare-fun e!42892 () Bool)

(assert (=> b!65465 (= e!42887 (and e!42892 mapRes!3030))))

(declare-fun condMapEmpty!3029 () Bool)

(declare-fun mapDefault!3029 () ValueCell!875)

(assert (=> b!65465 (= condMapEmpty!3029 (= (arr!1811 (_values!2120 (v!2457 (underlying!240 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!875)) mapDefault!3029)))))

(declare-fun b!65466 () Bool)

(declare-fun res!35589 () Bool)

(assert (=> b!65466 (=> (not res!35589) (not e!42890))))

(declare-fun valid!282 (LongMapFixedSize!658) Bool)

(assert (=> b!65466 (= res!35589 (valid!282 newMap!16))))

(declare-fun b!65467 () Bool)

(declare-fun res!35587 () Bool)

(assert (=> b!65467 (=> (not res!35587) (not e!42890))))

(assert (=> b!65467 (= res!35587 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2046 (_keys!3776 (v!2457 (underlying!240 thiss!992)))))))))

(declare-fun e!42895 () Bool)

(assert (=> b!65468 (= e!42895 (and tp!8273 tp_is_empty!2437 (array_inv!1129 (_keys!3776 newMap!16)) (array_inv!1130 (_values!2120 newMap!16)) e!42897))))

(declare-fun b!65469 () Bool)

(assert (=> b!65469 (= e!42893 e!42888)))

(declare-fun b!65470 () Bool)

(assert (=> b!65470 (= e!42892 tp_is_empty!2437)))

(declare-fun b!65471 () Bool)

(assert (=> b!65471 (= e!42896 tp_is_empty!2437)))

(declare-fun res!35588 () Bool)

(assert (=> start!9216 (=> (not res!35588) (not e!42890))))

(declare-fun valid!283 (LongMap!458) Bool)

(assert (=> start!9216 (= res!35588 (valid!283 thiss!992))))

(assert (=> start!9216 e!42890))

(assert (=> start!9216 e!42898))

(assert (=> start!9216 true))

(assert (=> start!9216 e!42895))

(declare-fun b!65458 () Bool)

(assert (=> b!65458 (= e!42890 e!42902)))

(declare-fun res!35590 () Bool)

(assert (=> b!65458 (=> (not res!35590) (not e!42902))))

(declare-fun lt!27998 () ListLongMap!1375)

(assert (=> b!65458 (= res!35590 (and (= lt!27998 lt!28001) (not (= (select (arr!1810 (_keys!3776 (v!2457 (underlying!240 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1810 (_keys!3776 (v!2457 (underlying!240 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1127 (LongMapFixedSize!658) ListLongMap!1375)

(assert (=> b!65458 (= lt!28001 (map!1127 newMap!16))))

(declare-fun getCurrentListMap!399 (array!3791 array!3793 (_ BitVec 32) (_ BitVec 32) V!2897 V!2897 (_ BitVec 32) Int) ListLongMap!1375)

(assert (=> b!65458 (= lt!27998 (getCurrentListMap!399 (_keys!3776 (v!2457 (underlying!240 thiss!992))) (_values!2120 (v!2457 (underlying!240 thiss!992))) (mask!6066 (v!2457 (underlying!240 thiss!992))) (extraKeys!2008 (v!2457 (underlying!240 thiss!992))) (zeroValue!2045 (v!2457 (underlying!240 thiss!992))) (minValue!2045 (v!2457 (underlying!240 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2137 (v!2457 (underlying!240 thiss!992)))))))

(assert (= (and start!9216 res!35588) b!65467))

(assert (= (and b!65467 res!35587) b!65466))

(assert (= (and b!65466 res!35589) b!65454))

(assert (= (and b!65454 res!35592) b!65458))

(assert (= (and b!65458 res!35590) b!65455))

(assert (= (and b!65455 c!8979) b!65456))

(assert (= (and b!65455 (not c!8979)) b!65457))

(assert (= (and b!65455 res!35591) b!65464))

(assert (= (and b!65465 condMapEmpty!3029) mapIsEmpty!3029))

(assert (= (and b!65465 (not condMapEmpty!3029)) mapNonEmpty!3030))

(get-info :version)

(assert (= (and mapNonEmpty!3030 ((_ is ValueCellFull!875) mapValue!3029)) b!65462))

(assert (= (and b!65465 ((_ is ValueCellFull!875) mapDefault!3029)) b!65470))

(assert (= b!65460 b!65465))

(assert (= b!65469 b!65460))

(assert (= b!65463 b!65469))

(assert (= start!9216 b!65463))

(assert (= (and b!65459 condMapEmpty!3030) mapIsEmpty!3030))

(assert (= (and b!65459 (not condMapEmpty!3030)) mapNonEmpty!3029))

(assert (= (and mapNonEmpty!3029 ((_ is ValueCellFull!875) mapValue!3030)) b!65461))

(assert (= (and b!65459 ((_ is ValueCellFull!875) mapDefault!3030)) b!65471))

(assert (= b!65468 b!65459))

(assert (= start!9216 b!65468))

(declare-fun b_lambda!2925 () Bool)

(assert (=> (not b_lambda!2925) (not b!65455)))

(declare-fun t!4907 () Bool)

(declare-fun tb!1425 () Bool)

(assert (=> (and b!65460 (= (defaultEntry!2137 (v!2457 (underlying!240 thiss!992))) (defaultEntry!2137 (v!2457 (underlying!240 thiss!992)))) t!4907) tb!1425))

(declare-fun result!2529 () Bool)

(assert (=> tb!1425 (= result!2529 tp_is_empty!2437)))

(assert (=> b!65455 t!4907))

(declare-fun b_and!4013 () Bool)

(assert (= b_and!4009 (and (=> t!4907 result!2529) b_and!4013)))

(declare-fun t!4909 () Bool)

(declare-fun tb!1427 () Bool)

(assert (=> (and b!65468 (= (defaultEntry!2137 newMap!16) (defaultEntry!2137 (v!2457 (underlying!240 thiss!992)))) t!4909) tb!1427))

(declare-fun result!2533 () Bool)

(assert (= result!2533 result!2529))

(assert (=> b!65455 t!4909))

(declare-fun b_and!4015 () Bool)

(assert (= b_and!4011 (and (=> t!4909 result!2533) b_and!4015)))

(declare-fun m!59903 () Bool)

(assert (=> b!65455 m!59903))

(declare-fun m!59905 () Bool)

(assert (=> b!65455 m!59905))

(declare-fun m!59907 () Bool)

(assert (=> b!65455 m!59907))

(declare-fun m!59909 () Bool)

(assert (=> b!65455 m!59909))

(declare-fun m!59911 () Bool)

(assert (=> b!65455 m!59911))

(assert (=> b!65455 m!59909))

(assert (=> b!65455 m!59905))

(assert (=> b!65455 m!59909))

(assert (=> b!65455 m!59907))

(declare-fun m!59913 () Bool)

(assert (=> b!65455 m!59913))

(assert (=> b!65455 m!59903))

(declare-fun m!59915 () Bool)

(assert (=> b!65464 m!59915))

(declare-fun m!59917 () Bool)

(assert (=> b!65468 m!59917))

(declare-fun m!59919 () Bool)

(assert (=> b!65468 m!59919))

(declare-fun m!59921 () Bool)

(assert (=> b!65456 m!59921))

(declare-fun m!59923 () Bool)

(assert (=> b!65456 m!59923))

(assert (=> b!65456 m!59909))

(declare-fun m!59925 () Bool)

(assert (=> b!65456 m!59925))

(assert (=> b!65456 m!59909))

(assert (=> b!65456 m!59909))

(declare-fun m!59927 () Bool)

(assert (=> b!65456 m!59927))

(assert (=> b!65456 m!59909))

(declare-fun m!59929 () Bool)

(assert (=> b!65456 m!59929))

(declare-fun m!59931 () Bool)

(assert (=> mapNonEmpty!3030 m!59931))

(declare-fun m!59933 () Bool)

(assert (=> b!65460 m!59933))

(declare-fun m!59935 () Bool)

(assert (=> b!65460 m!59935))

(declare-fun m!59937 () Bool)

(assert (=> mapNonEmpty!3029 m!59937))

(declare-fun m!59939 () Bool)

(assert (=> b!65466 m!59939))

(declare-fun m!59941 () Bool)

(assert (=> start!9216 m!59941))

(assert (=> b!65458 m!59909))

(declare-fun m!59943 () Bool)

(assert (=> b!65458 m!59943))

(declare-fun m!59945 () Bool)

(assert (=> b!65458 m!59945))

(check-sat (not b!65458) (not b_next!2041) b_and!4013 (not b!65468) (not b_next!2043) (not b_lambda!2925) (not start!9216) (not b!65460) (not mapNonEmpty!3029) (not b!65456) (not b!65466) (not b!65455) (not b!65464) tp_is_empty!2437 (not mapNonEmpty!3030) b_and!4015)
(check-sat b_and!4013 b_and!4015 (not b_next!2041) (not b_next!2043))
